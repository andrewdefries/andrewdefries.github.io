---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.788107, -0.6705635, -1.459888, 1, 0, 0, 1,
-2.723934, 1.25368, -0.1670937, 1, 0.007843138, 0, 1,
-2.651977, -1.332978, -2.541748, 1, 0.01176471, 0, 1,
-2.436702, -0.9288379, -0.6171692, 1, 0.01960784, 0, 1,
-2.429798, -1.150025, -2.824434, 1, 0.02352941, 0, 1,
-2.386781, 1.118944, 0.03273251, 1, 0.03137255, 0, 1,
-2.322985, -1.623206, -0.9959974, 1, 0.03529412, 0, 1,
-2.279141, -0.6910828, -1.179799, 1, 0.04313726, 0, 1,
-2.263876, 0.2042995, -2.221468, 1, 0.04705882, 0, 1,
-2.26015, 0.2656173, -0.9013123, 1, 0.05490196, 0, 1,
-2.252355, -1.190184, -1.299379, 1, 0.05882353, 0, 1,
-2.222268, 1.042739, -1.957773, 1, 0.06666667, 0, 1,
-2.21894, 1.240397, -0.3681147, 1, 0.07058824, 0, 1,
-2.213117, -1.655206, -1.725858, 1, 0.07843138, 0, 1,
-2.211384, -1.876832, -1.502646, 1, 0.08235294, 0, 1,
-2.199745, 1.792638, -2.429913, 1, 0.09019608, 0, 1,
-2.137525, -1.546649, -3.047941, 1, 0.09411765, 0, 1,
-2.136456, 1.069285, 1.000282, 1, 0.1019608, 0, 1,
-2.101399, 0.3875628, -1.503351, 1, 0.1098039, 0, 1,
-2.078011, -1.532434, -3.553336, 1, 0.1137255, 0, 1,
-2.072857, -0.05269258, -1.858222, 1, 0.1215686, 0, 1,
-2.024786, 0.07950005, -1.09735, 1, 0.1254902, 0, 1,
-2.017992, -1.314298, -0.960759, 1, 0.1333333, 0, 1,
-2.010243, -1.378461, -4.105306, 1, 0.1372549, 0, 1,
-1.994625, 0.904146, -0.8179724, 1, 0.145098, 0, 1,
-1.94044, -0.8954747, -2.829514, 1, 0.1490196, 0, 1,
-1.934552, -0.7890002, -1.46296, 1, 0.1568628, 0, 1,
-1.929778, 1.333454, -0.7860448, 1, 0.1607843, 0, 1,
-1.907571, -0.5453556, -3.099564, 1, 0.1686275, 0, 1,
-1.890182, 2.156583, -1.965511, 1, 0.172549, 0, 1,
-1.862381, 1.869538, 0.7631507, 1, 0.1803922, 0, 1,
-1.857214, -0.3644066, -2.09614, 1, 0.1843137, 0, 1,
-1.802024, 1.459597, -0.4416746, 1, 0.1921569, 0, 1,
-1.794064, 0.3546219, -0.02663507, 1, 0.1960784, 0, 1,
-1.777472, -0.789106, -3.005719, 1, 0.2039216, 0, 1,
-1.770387, -2.262905, -3.068392, 1, 0.2117647, 0, 1,
-1.76544, -0.6359217, -0.9811899, 1, 0.2156863, 0, 1,
-1.730565, 0.3382731, -1.663013, 1, 0.2235294, 0, 1,
-1.727249, 0.1119653, -2.347852, 1, 0.227451, 0, 1,
-1.726728, 0.9743334, -2.434144, 1, 0.2352941, 0, 1,
-1.72574, 0.6916094, -0.7426285, 1, 0.2392157, 0, 1,
-1.724401, -0.2770742, -0.4271551, 1, 0.2470588, 0, 1,
-1.684031, 1.055668, -0.477465, 1, 0.2509804, 0, 1,
-1.656492, -1.520412, -2.803408, 1, 0.2588235, 0, 1,
-1.650463, -0.8532672, -4.249069, 1, 0.2627451, 0, 1,
-1.63361, -0.1086256, -1.595639, 1, 0.2705882, 0, 1,
-1.628897, 0.4660152, -0.8623972, 1, 0.2745098, 0, 1,
-1.623664, 1.734635, -1.375399, 1, 0.282353, 0, 1,
-1.619992, -0.1952128, -2.988534, 1, 0.2862745, 0, 1,
-1.617361, 1.369823, -1.404125, 1, 0.2941177, 0, 1,
-1.591289, -0.6113613, -0.1829421, 1, 0.3019608, 0, 1,
-1.590713, -0.8160419, -0.09676509, 1, 0.3058824, 0, 1,
-1.584541, -0.1914613, -2.113558, 1, 0.3137255, 0, 1,
-1.583666, 1.016905, 0.9568832, 1, 0.3176471, 0, 1,
-1.580423, 1.793984, -0.4018412, 1, 0.3254902, 0, 1,
-1.546711, -0.1399325, -2.014852, 1, 0.3294118, 0, 1,
-1.542923, -1.959989, -1.271503, 1, 0.3372549, 0, 1,
-1.531202, -0.6111168, -2.035509, 1, 0.3411765, 0, 1,
-1.510335, -0.5273134, -1.26928, 1, 0.3490196, 0, 1,
-1.495211, -0.230598, -0.9533206, 1, 0.3529412, 0, 1,
-1.485955, -1.255063, -1.717628, 1, 0.3607843, 0, 1,
-1.473746, 0.2760428, -0.3450144, 1, 0.3647059, 0, 1,
-1.457408, 0.1189235, -2.133099, 1, 0.372549, 0, 1,
-1.449892, 0.3032463, -0.8635662, 1, 0.3764706, 0, 1,
-1.426932, -0.8225896, 0.129387, 1, 0.3843137, 0, 1,
-1.413743, -1.884141, -2.578293, 1, 0.3882353, 0, 1,
-1.400425, 0.0961954, -1.499127, 1, 0.3960784, 0, 1,
-1.393147, 0.6194126, 0.2673214, 1, 0.4039216, 0, 1,
-1.390964, -1.294959, -4.116688, 1, 0.4078431, 0, 1,
-1.387263, -0.3621249, -2.494822, 1, 0.4156863, 0, 1,
-1.386647, -0.9969982, -4.042299, 1, 0.4196078, 0, 1,
-1.380482, -0.7907246, -2.421244, 1, 0.427451, 0, 1,
-1.380474, 0.1585223, -0.7984886, 1, 0.4313726, 0, 1,
-1.377753, 0.692764, 0.5213569, 1, 0.4392157, 0, 1,
-1.367909, -0.5275337, -2.212064, 1, 0.4431373, 0, 1,
-1.366797, -0.1663936, -3.072803, 1, 0.4509804, 0, 1,
-1.33295, 0.2250241, -1.659853, 1, 0.454902, 0, 1,
-1.324612, 0.004590921, -2.791885, 1, 0.4627451, 0, 1,
-1.322133, 0.1570676, -2.2589, 1, 0.4666667, 0, 1,
-1.318106, 0.5662868, -0.4366985, 1, 0.4745098, 0, 1,
-1.304534, 1.376178, -0.5780672, 1, 0.4784314, 0, 1,
-1.299896, -1.654763, -3.082556, 1, 0.4862745, 0, 1,
-1.298889, -0.1834602, -2.512902, 1, 0.4901961, 0, 1,
-1.298571, -0.3907492, -0.8888467, 1, 0.4980392, 0, 1,
-1.285943, 0.09864653, -1.582584, 1, 0.5058824, 0, 1,
-1.281519, 0.3734862, -2.087872, 1, 0.509804, 0, 1,
-1.256199, -1.113751, -2.747792, 1, 0.5176471, 0, 1,
-1.255733, 0.07030739, -2.367597, 1, 0.5215687, 0, 1,
-1.248285, 0.4991079, -0.5752867, 1, 0.5294118, 0, 1,
-1.245002, 0.3239137, -1.505823, 1, 0.5333334, 0, 1,
-1.243579, 0.3239785, 0.5363349, 1, 0.5411765, 0, 1,
-1.237196, 1.01326, -1.912728, 1, 0.5450981, 0, 1,
-1.236497, 2.425378, -0.6575423, 1, 0.5529412, 0, 1,
-1.235255, 1.523591, -1.437556, 1, 0.5568628, 0, 1,
-1.223806, 0.09113116, -2.218588, 1, 0.5647059, 0, 1,
-1.222787, 0.46164, -3.585118, 1, 0.5686275, 0, 1,
-1.21689, -1.04954, -2.747077, 1, 0.5764706, 0, 1,
-1.215633, 0.8923764, -0.5232638, 1, 0.5803922, 0, 1,
-1.214103, -0.9648668, -0.9067869, 1, 0.5882353, 0, 1,
-1.209626, -0.6110618, -0.8047466, 1, 0.5921569, 0, 1,
-1.209536, 1.384192, 0.5050969, 1, 0.6, 0, 1,
-1.204476, -0.8447354, -2.662314, 1, 0.6078432, 0, 1,
-1.198634, -0.9665215, -2.854393, 1, 0.6117647, 0, 1,
-1.195072, 1.523633, -1.825201, 1, 0.6196079, 0, 1,
-1.19297, -1.78491, -1.392648, 1, 0.6235294, 0, 1,
-1.180774, -0.7007532, -2.926667, 1, 0.6313726, 0, 1,
-1.175739, -1.113904, -2.021518, 1, 0.6352941, 0, 1,
-1.171343, 1.24658, -0.7137507, 1, 0.6431373, 0, 1,
-1.171302, 0.324679, -0.7722098, 1, 0.6470588, 0, 1,
-1.166346, -0.9360649, -1.01521, 1, 0.654902, 0, 1,
-1.159134, 0.8964391, -1.107555, 1, 0.6588235, 0, 1,
-1.150321, 0.5368744, 0.06324632, 1, 0.6666667, 0, 1,
-1.148235, 1.392068, -1.241216, 1, 0.6705883, 0, 1,
-1.144992, 2.04618, 2.016778, 1, 0.6784314, 0, 1,
-1.139704, 3.428992, -1.825256, 1, 0.682353, 0, 1,
-1.119861, 0.9449978, -0.5104718, 1, 0.6901961, 0, 1,
-1.115374, 0.1320468, -1.848845, 1, 0.6941177, 0, 1,
-1.110258, -0.816552, -2.517816, 1, 0.7019608, 0, 1,
-1.107142, 0.6884547, -0.1529482, 1, 0.7098039, 0, 1,
-1.1045, -0.5313188, -1.890578, 1, 0.7137255, 0, 1,
-1.103406, -0.2495392, -1.98569, 1, 0.7215686, 0, 1,
-1.101721, 1.739574, -0.957352, 1, 0.7254902, 0, 1,
-1.093268, 1.035204, -2.127978, 1, 0.7333333, 0, 1,
-1.090431, -0.40776, -3.187577, 1, 0.7372549, 0, 1,
-1.08928, 0.2742068, -0.6900538, 1, 0.7450981, 0, 1,
-1.088333, -0.7365782, -2.305052, 1, 0.7490196, 0, 1,
-1.084636, -1.284584, -3.49219, 1, 0.7568628, 0, 1,
-1.075799, -2.239328, -3.829123, 1, 0.7607843, 0, 1,
-1.07485, -0.6561728, -1.96001, 1, 0.7686275, 0, 1,
-1.067201, -0.756653, -3.111894, 1, 0.772549, 0, 1,
-1.066879, -0.8022996, -1.442366, 1, 0.7803922, 0, 1,
-1.06509, 0.7149258, -1.380398, 1, 0.7843137, 0, 1,
-1.061452, -1.065412, -2.132388, 1, 0.7921569, 0, 1,
-1.058212, 0.2676955, -2.432035, 1, 0.7960784, 0, 1,
-1.055255, -1.841458, -2.565789, 1, 0.8039216, 0, 1,
-1.052325, -0.09116803, -2.745772, 1, 0.8117647, 0, 1,
-1.050882, -1.203324, -3.692451, 1, 0.8156863, 0, 1,
-1.046931, -0.05925308, -0.4745536, 1, 0.8235294, 0, 1,
-1.04368, -0.1698059, -2.484275, 1, 0.827451, 0, 1,
-1.041523, 0.5045757, -1.179693, 1, 0.8352941, 0, 1,
-1.02964, 1.165237, -1.194515, 1, 0.8392157, 0, 1,
-1.028904, -0.2943341, -2.329529, 1, 0.8470588, 0, 1,
-1.027777, -0.5560226, -2.526659, 1, 0.8509804, 0, 1,
-1.024473, -2.189951, -2.628459, 1, 0.8588235, 0, 1,
-1.024, -0.2272028, -0.09395487, 1, 0.8627451, 0, 1,
-1.023999, 1.063156, -1.557045, 1, 0.8705882, 0, 1,
-1.019003, -0.6841729, -1.795432, 1, 0.8745098, 0, 1,
-1.018376, 0.2616625, 0.1697461, 1, 0.8823529, 0, 1,
-1.01504, 1.771196, -0.3517677, 1, 0.8862745, 0, 1,
-1.013409, -0.7731909, -2.908515, 1, 0.8941177, 0, 1,
-1.013062, 0.2348969, -2.300797, 1, 0.8980392, 0, 1,
-1.007077, -1.911263, -4.716084, 1, 0.9058824, 0, 1,
-0.991749, 1.343042, -0.1314527, 1, 0.9137255, 0, 1,
-0.9906108, 0.3542162, -0.1665658, 1, 0.9176471, 0, 1,
-0.9836682, 0.5985914, -2.506272, 1, 0.9254902, 0, 1,
-0.9806017, 1.759717, -0.6549152, 1, 0.9294118, 0, 1,
-0.979773, -0.9862746, -2.332147, 1, 0.9372549, 0, 1,
-0.9667953, -1.115723, -1.35957, 1, 0.9411765, 0, 1,
-0.9646752, -1.342674, -1.749119, 1, 0.9490196, 0, 1,
-0.9599172, -0.2546637, -1.753687, 1, 0.9529412, 0, 1,
-0.9529808, -0.352581, -1.522207, 1, 0.9607843, 0, 1,
-0.9484906, 0.6291356, 0.4503542, 1, 0.9647059, 0, 1,
-0.9456467, 0.5583435, -2.416615, 1, 0.972549, 0, 1,
-0.9436523, 0.1595502, -3.482388, 1, 0.9764706, 0, 1,
-0.9395055, -0.9693384, -2.509767, 1, 0.9843137, 0, 1,
-0.9370243, 0.5807496, -0.9228961, 1, 0.9882353, 0, 1,
-0.91254, -0.5296274, -2.327018, 1, 0.9960784, 0, 1,
-0.9105228, -1.027618, -1.465481, 0.9960784, 1, 0, 1,
-0.910192, -0.3296108, -1.633598, 0.9921569, 1, 0, 1,
-0.9089676, 0.4081927, -1.289003, 0.9843137, 1, 0, 1,
-0.9014382, -0.911595, -2.333123, 0.9803922, 1, 0, 1,
-0.9009689, 1.193659, 0.197581, 0.972549, 1, 0, 1,
-0.8998615, -1.983127, -0.1745063, 0.9686275, 1, 0, 1,
-0.8971744, -1.70339, -0.9625316, 0.9607843, 1, 0, 1,
-0.8965087, -0.4587317, -0.9978462, 0.9568627, 1, 0, 1,
-0.895313, 0.8088065, -1.463604, 0.9490196, 1, 0, 1,
-0.892188, 0.008852137, 0.4369761, 0.945098, 1, 0, 1,
-0.8905677, 2.133139, -0.5579129, 0.9372549, 1, 0, 1,
-0.8885632, 0.4533469, 0.4220372, 0.9333333, 1, 0, 1,
-0.8833169, -0.1618595, -1.349122, 0.9254902, 1, 0, 1,
-0.8816465, -0.2752011, -2.082254, 0.9215686, 1, 0, 1,
-0.8815612, -0.08112387, -1.735187, 0.9137255, 1, 0, 1,
-0.877673, 0.2865953, -0.6830857, 0.9098039, 1, 0, 1,
-0.874745, -0.8960962, -1.888732, 0.9019608, 1, 0, 1,
-0.8737893, 0.6944278, -0.8597841, 0.8941177, 1, 0, 1,
-0.8652965, -0.1090613, -1.348214, 0.8901961, 1, 0, 1,
-0.8599331, 0.007672283, -1.711676, 0.8823529, 1, 0, 1,
-0.8533429, -1.668601, -0.7897655, 0.8784314, 1, 0, 1,
-0.8530826, 2.008711, -0.6403832, 0.8705882, 1, 0, 1,
-0.8529038, 0.4440498, -1.182056, 0.8666667, 1, 0, 1,
-0.8365537, -1.301769, -1.235676, 0.8588235, 1, 0, 1,
-0.8349717, -1.274388, -3.687206, 0.854902, 1, 0, 1,
-0.8243419, -0.63661, -1.32035, 0.8470588, 1, 0, 1,
-0.8210588, -0.1809926, -2.579869, 0.8431373, 1, 0, 1,
-0.8209012, -0.1698011, -0.996542, 0.8352941, 1, 0, 1,
-0.8156881, -0.4440254, -1.318723, 0.8313726, 1, 0, 1,
-0.8154612, 0.770842, -1.69141, 0.8235294, 1, 0, 1,
-0.8145111, 0.177002, -1.145291, 0.8196079, 1, 0, 1,
-0.8135678, 0.6818528, -0.8456098, 0.8117647, 1, 0, 1,
-0.8129581, 0.9796715, -0.9545038, 0.8078431, 1, 0, 1,
-0.8116519, -1.646681, -4.130627, 0.8, 1, 0, 1,
-0.802013, 0.7940484, 1.313299, 0.7921569, 1, 0, 1,
-0.7967318, -0.1752929, -2.441288, 0.7882353, 1, 0, 1,
-0.7933634, -0.2863972, -1.518653, 0.7803922, 1, 0, 1,
-0.7914176, 1.278271, -1.139407, 0.7764706, 1, 0, 1,
-0.7908787, -0.6965534, 0.211447, 0.7686275, 1, 0, 1,
-0.7901817, 0.3289365, -2.668522, 0.7647059, 1, 0, 1,
-0.7826051, -0.5841041, -2.296975, 0.7568628, 1, 0, 1,
-0.7743471, 0.1081847, -0.8504596, 0.7529412, 1, 0, 1,
-0.7698345, 0.7308506, -2.486068, 0.7450981, 1, 0, 1,
-0.7684469, 1.288981, -1.484909, 0.7411765, 1, 0, 1,
-0.7668881, 0.4043846, -1.508743, 0.7333333, 1, 0, 1,
-0.7585979, -1.829679, -2.320084, 0.7294118, 1, 0, 1,
-0.7464796, -1.126133, -1.3946, 0.7215686, 1, 0, 1,
-0.7396209, -0.2409739, 0.4685381, 0.7176471, 1, 0, 1,
-0.737636, -0.3603293, -2.41294, 0.7098039, 1, 0, 1,
-0.7373756, -1.06835, -4.015319, 0.7058824, 1, 0, 1,
-0.7332197, -1.780016, -3.102505, 0.6980392, 1, 0, 1,
-0.7320791, 1.581414, -0.7817485, 0.6901961, 1, 0, 1,
-0.7308646, 1.148873, -1.520789, 0.6862745, 1, 0, 1,
-0.7293337, 1.642988, -0.7727982, 0.6784314, 1, 0, 1,
-0.720281, 1.681674, -1.676138, 0.6745098, 1, 0, 1,
-0.7193556, 0.1814785, -2.352676, 0.6666667, 1, 0, 1,
-0.7177463, 1.54677, 0.05762185, 0.6627451, 1, 0, 1,
-0.7141861, -0.4704555, -2.010263, 0.654902, 1, 0, 1,
-0.7124958, 0.5775728, -0.1983789, 0.6509804, 1, 0, 1,
-0.7105611, -0.6016181, -3.502097, 0.6431373, 1, 0, 1,
-0.7090887, -2.25725, -2.251912, 0.6392157, 1, 0, 1,
-0.7073267, -0.2976479, -2.775019, 0.6313726, 1, 0, 1,
-0.7041978, -0.3323987, -2.765409, 0.627451, 1, 0, 1,
-0.7028477, 0.5354821, -2.996309, 0.6196079, 1, 0, 1,
-0.6999027, 2.366029, 0.8588964, 0.6156863, 1, 0, 1,
-0.6996995, -1.664397, -2.216405, 0.6078432, 1, 0, 1,
-0.6995269, -0.3188314, -3.043821, 0.6039216, 1, 0, 1,
-0.6949831, -1.210683, -2.263651, 0.5960785, 1, 0, 1,
-0.690769, 1.028968, 1.9111, 0.5882353, 1, 0, 1,
-0.6860414, 0.5242031, -1.955326, 0.5843138, 1, 0, 1,
-0.6803493, -0.386166, -0.1461015, 0.5764706, 1, 0, 1,
-0.6786551, 1.805569, -0.2715122, 0.572549, 1, 0, 1,
-0.6707404, 1.168493, -1.027134, 0.5647059, 1, 0, 1,
-0.6672991, 1.122371, 0.03470692, 0.5607843, 1, 0, 1,
-0.6637663, 0.3657713, -0.6792233, 0.5529412, 1, 0, 1,
-0.6633087, 0.5622329, -0.0182723, 0.5490196, 1, 0, 1,
-0.6623021, -0.9099175, -0.7449099, 0.5411765, 1, 0, 1,
-0.6561925, -1.489364, -2.513057, 0.5372549, 1, 0, 1,
-0.6547781, 0.222224, -2.768249, 0.5294118, 1, 0, 1,
-0.6545464, 1.494694, -1.799127, 0.5254902, 1, 0, 1,
-0.6543652, 1.645185, -0.4917725, 0.5176471, 1, 0, 1,
-0.6513871, -0.7625978, -1.410645, 0.5137255, 1, 0, 1,
-0.65105, 0.3710644, 0.06491039, 0.5058824, 1, 0, 1,
-0.6488913, -0.8658456, -3.122067, 0.5019608, 1, 0, 1,
-0.6477811, 0.6558149, -1.098096, 0.4941176, 1, 0, 1,
-0.6427105, -1.054394, -2.717037, 0.4862745, 1, 0, 1,
-0.6379133, 0.3527142, -2.015599, 0.4823529, 1, 0, 1,
-0.6260765, -0.7233822, -0.7740223, 0.4745098, 1, 0, 1,
-0.6177982, -1.306727, -3.531781, 0.4705882, 1, 0, 1,
-0.6153567, 0.8855854, -1.157039, 0.4627451, 1, 0, 1,
-0.6127625, -1.788232, -2.984189, 0.4588235, 1, 0, 1,
-0.6116162, 0.6202874, -1.436768, 0.4509804, 1, 0, 1,
-0.6087561, -0.2982229, -2.485706, 0.4470588, 1, 0, 1,
-0.6067609, -0.9329426, -3.415629, 0.4392157, 1, 0, 1,
-0.606561, 1.262172, -0.008799164, 0.4352941, 1, 0, 1,
-0.6054906, 0.5623989, -2.408085, 0.427451, 1, 0, 1,
-0.6027519, -2.06876, -3.399894, 0.4235294, 1, 0, 1,
-0.6015823, 0.9729257, 0.209424, 0.4156863, 1, 0, 1,
-0.6013387, -1.611536, -3.142126, 0.4117647, 1, 0, 1,
-0.5987277, 0.3913694, 0.4696018, 0.4039216, 1, 0, 1,
-0.5937948, 0.1562563, -2.272475, 0.3960784, 1, 0, 1,
-0.5913835, 0.8528313, -1.32263, 0.3921569, 1, 0, 1,
-0.5875962, 0.4790641, -1.942773, 0.3843137, 1, 0, 1,
-0.5851464, 0.2652121, -2.085079, 0.3803922, 1, 0, 1,
-0.5850671, -0.9695075, -1.753395, 0.372549, 1, 0, 1,
-0.5776265, -1.585462, -3.868786, 0.3686275, 1, 0, 1,
-0.5760387, 0.1580349, 0.3039406, 0.3607843, 1, 0, 1,
-0.569371, 1.350623, -0.1132457, 0.3568628, 1, 0, 1,
-0.5692384, -0.3181972, -0.5472448, 0.3490196, 1, 0, 1,
-0.5689155, -1.449572, -1.724553, 0.345098, 1, 0, 1,
-0.5626845, -1.626547, -3.309733, 0.3372549, 1, 0, 1,
-0.5613751, -0.01461943, -2.730264, 0.3333333, 1, 0, 1,
-0.5573704, 1.160595, 0.01881159, 0.3254902, 1, 0, 1,
-0.5543272, -0.8368327, -4.008824, 0.3215686, 1, 0, 1,
-0.5468245, -1.170707, -2.749412, 0.3137255, 1, 0, 1,
-0.5466064, -0.7305853, -3.102103, 0.3098039, 1, 0, 1,
-0.5397534, 1.609601, -0.4310436, 0.3019608, 1, 0, 1,
-0.539047, -0.5116441, -1.212548, 0.2941177, 1, 0, 1,
-0.5359588, -0.7329083, -3.061281, 0.2901961, 1, 0, 1,
-0.5346175, -0.02261417, -2.674835, 0.282353, 1, 0, 1,
-0.5321789, 1.852298, 1.727937, 0.2784314, 1, 0, 1,
-0.5264334, 0.2737666, -0.6510602, 0.2705882, 1, 0, 1,
-0.5233474, -0.1346683, -1.630891, 0.2666667, 1, 0, 1,
-0.5210976, -0.982506, -3.78481, 0.2588235, 1, 0, 1,
-0.5190449, -2.071221, -2.914526, 0.254902, 1, 0, 1,
-0.5166795, -2.024422, -3.289312, 0.2470588, 1, 0, 1,
-0.5155525, -0.6941267, -2.764848, 0.2431373, 1, 0, 1,
-0.5122128, 0.3226651, -0.1876723, 0.2352941, 1, 0, 1,
-0.5111212, -0.6485627, -4.197341, 0.2313726, 1, 0, 1,
-0.5089707, 0.6455587, -1.931202, 0.2235294, 1, 0, 1,
-0.5046768, -0.7541103, -3.064018, 0.2196078, 1, 0, 1,
-0.5044232, -1.915781, -2.394783, 0.2117647, 1, 0, 1,
-0.5042306, -1.417034, -3.358595, 0.2078431, 1, 0, 1,
-0.4993986, 1.06776, -1.642862, 0.2, 1, 0, 1,
-0.4993783, 1.888167, -0.5925649, 0.1921569, 1, 0, 1,
-0.4868882, -0.2955177, -1.476185, 0.1882353, 1, 0, 1,
-0.4792987, -0.3307188, -2.769334, 0.1803922, 1, 0, 1,
-0.4790049, -2.155936, -1.600044, 0.1764706, 1, 0, 1,
-0.4786188, 0.6701189, 1.06462, 0.1686275, 1, 0, 1,
-0.4781157, -0.3446438, -2.188878, 0.1647059, 1, 0, 1,
-0.4773188, -0.8847651, -3.339131, 0.1568628, 1, 0, 1,
-0.4765141, -0.07597449, 0.1443704, 0.1529412, 1, 0, 1,
-0.475746, -0.3954165, -2.246531, 0.145098, 1, 0, 1,
-0.4748937, 0.1105229, -0.3986717, 0.1411765, 1, 0, 1,
-0.4728728, 1.003507, -1.793148, 0.1333333, 1, 0, 1,
-0.4697838, 1.066898, 0.7838298, 0.1294118, 1, 0, 1,
-0.4623464, 1.557213, 0.2889506, 0.1215686, 1, 0, 1,
-0.4606072, -1.072518, -1.764293, 0.1176471, 1, 0, 1,
-0.4573074, 0.8096396, -2.131133, 0.1098039, 1, 0, 1,
-0.4564194, 2.079468, -0.339102, 0.1058824, 1, 0, 1,
-0.4536936, 0.8599283, -0.4502197, 0.09803922, 1, 0, 1,
-0.4532688, -1.539292, -2.736474, 0.09019608, 1, 0, 1,
-0.4491458, 0.1012201, -1.266233, 0.08627451, 1, 0, 1,
-0.4471846, 0.3531916, -2.832348, 0.07843138, 1, 0, 1,
-0.4466595, -0.2920203, -2.837174, 0.07450981, 1, 0, 1,
-0.4421743, 1.916019, -1.958038, 0.06666667, 1, 0, 1,
-0.4415812, -0.1347625, -1.066016, 0.0627451, 1, 0, 1,
-0.4413774, -0.2370839, -2.106633, 0.05490196, 1, 0, 1,
-0.441374, 0.2724764, -2.782484, 0.05098039, 1, 0, 1,
-0.4362274, 1.662132, 0.6150929, 0.04313726, 1, 0, 1,
-0.4345671, -1.046781, -3.266784, 0.03921569, 1, 0, 1,
-0.4344029, -1.655692, -1.281361, 0.03137255, 1, 0, 1,
-0.4340956, -1.465066, -2.317028, 0.02745098, 1, 0, 1,
-0.4317338, 0.573473, -1.084276, 0.01960784, 1, 0, 1,
-0.4258592, 0.2262796, -1.820817, 0.01568628, 1, 0, 1,
-0.4254, -1.215363, -3.030739, 0.007843138, 1, 0, 1,
-0.4183371, -0.7962919, -3.997904, 0.003921569, 1, 0, 1,
-0.4115674, 0.0220882, -0.1546197, 0, 1, 0.003921569, 1,
-0.4106416, 1.684689, 0.116178, 0, 1, 0.01176471, 1,
-0.404579, 0.4167402, -1.100583, 0, 1, 0.01568628, 1,
-0.3968543, -1.263229, -1.035219, 0, 1, 0.02352941, 1,
-0.3950533, 0.1215496, -1.302616, 0, 1, 0.02745098, 1,
-0.3940883, 1.744376, -0.3245724, 0, 1, 0.03529412, 1,
-0.3926064, -0.1829139, -2.184108, 0, 1, 0.03921569, 1,
-0.3915864, -0.1263099, -1.608925, 0, 1, 0.04705882, 1,
-0.3848051, -1.347298, -0.6438339, 0, 1, 0.05098039, 1,
-0.3819624, 0.2162914, -1.096561, 0, 1, 0.05882353, 1,
-0.3794442, -0.1110345, -1.340587, 0, 1, 0.0627451, 1,
-0.3790403, 0.6886353, -1.272116, 0, 1, 0.07058824, 1,
-0.3782878, 0.5776306, -0.3587923, 0, 1, 0.07450981, 1,
-0.377127, -1.165455, -4.383023, 0, 1, 0.08235294, 1,
-0.3765289, -0.4007695, -3.862581, 0, 1, 0.08627451, 1,
-0.3760045, -0.6219602, -2.274248, 0, 1, 0.09411765, 1,
-0.3581818, 0.857182, -1.482491, 0, 1, 0.1019608, 1,
-0.3575419, -0.7029338, -4.237762, 0, 1, 0.1058824, 1,
-0.3501688, -0.2108012, -2.512367, 0, 1, 0.1137255, 1,
-0.3456372, -0.07976773, -0.4471567, 0, 1, 0.1176471, 1,
-0.3438194, 0.1833752, -1.957116, 0, 1, 0.1254902, 1,
-0.3436411, -1.510242, -1.879448, 0, 1, 0.1294118, 1,
-0.3393803, -0.136866, -2.975752, 0, 1, 0.1372549, 1,
-0.3359139, 0.1509365, -1.110199, 0, 1, 0.1411765, 1,
-0.3312641, -0.2983228, -1.755475, 0, 1, 0.1490196, 1,
-0.3298802, 0.3984808, 0.3833409, 0, 1, 0.1529412, 1,
-0.3289619, 1.031896, 1.490808, 0, 1, 0.1607843, 1,
-0.3289362, -1.071224, -3.383603, 0, 1, 0.1647059, 1,
-0.3269945, 0.8750106, -0.05871729, 0, 1, 0.172549, 1,
-0.32577, 0.124554, -0.9885753, 0, 1, 0.1764706, 1,
-0.3248781, -1.391143, -3.128141, 0, 1, 0.1843137, 1,
-0.3220632, -1.148342, -2.655108, 0, 1, 0.1882353, 1,
-0.3218286, 1.960981, 0.1633932, 0, 1, 0.1960784, 1,
-0.3204182, -0.7337714, -3.430229, 0, 1, 0.2039216, 1,
-0.3163478, -1.779712, -3.716262, 0, 1, 0.2078431, 1,
-0.3136727, -0.2415092, -2.66216, 0, 1, 0.2156863, 1,
-0.3125798, -0.5360951, -1.792565, 0, 1, 0.2196078, 1,
-0.3061884, -0.5817077, -4.997693, 0, 1, 0.227451, 1,
-0.2952122, -1.833688, -4.354287, 0, 1, 0.2313726, 1,
-0.2930014, -0.2581593, -3.62051, 0, 1, 0.2392157, 1,
-0.287738, -1.155554, -3.667377, 0, 1, 0.2431373, 1,
-0.2876107, -0.07096002, -0.8070307, 0, 1, 0.2509804, 1,
-0.2873179, -0.2527751, -3.059214, 0, 1, 0.254902, 1,
-0.2868245, -0.5290272, -2.221284, 0, 1, 0.2627451, 1,
-0.2853877, -1.068122, -3.030788, 0, 1, 0.2666667, 1,
-0.2816031, -1.412612, -4.221307, 0, 1, 0.2745098, 1,
-0.2766315, -0.3735783, -1.784997, 0, 1, 0.2784314, 1,
-0.2757591, 1.128339, -0.6219582, 0, 1, 0.2862745, 1,
-0.2745078, 0.5610262, -0.4909358, 0, 1, 0.2901961, 1,
-0.2741702, -0.9948083, -3.097083, 0, 1, 0.2980392, 1,
-0.2738023, -0.6570865, -2.748993, 0, 1, 0.3058824, 1,
-0.2719759, 0.2430952, -2.015059, 0, 1, 0.3098039, 1,
-0.2667857, -1.549402, -2.386085, 0, 1, 0.3176471, 1,
-0.262711, -0.4465526, -2.931998, 0, 1, 0.3215686, 1,
-0.2595052, -0.5298217, -3.128369, 0, 1, 0.3294118, 1,
-0.2492715, 0.5014014, 1.486934, 0, 1, 0.3333333, 1,
-0.2450063, -0.07246901, -2.607862, 0, 1, 0.3411765, 1,
-0.2427185, -0.1061737, -1.443045, 0, 1, 0.345098, 1,
-0.2427156, -0.9354389, -1.920142, 0, 1, 0.3529412, 1,
-0.241619, 0.6831195, -0.4287476, 0, 1, 0.3568628, 1,
-0.2398891, 2.058965, -1.281989, 0, 1, 0.3647059, 1,
-0.2350409, -0.1447898, -0.03971519, 0, 1, 0.3686275, 1,
-0.2344128, 1.322112, 0.9534326, 0, 1, 0.3764706, 1,
-0.2335932, -0.8256629, -2.747571, 0, 1, 0.3803922, 1,
-0.2314399, 1.24592, 2.501957, 0, 1, 0.3882353, 1,
-0.2297084, -0.7647275, -3.693272, 0, 1, 0.3921569, 1,
-0.2250826, -1.028765, -2.645107, 0, 1, 0.4, 1,
-0.2194558, 0.1980926, 0.4598003, 0, 1, 0.4078431, 1,
-0.2155878, -0.6347814, -4.090731, 0, 1, 0.4117647, 1,
-0.2129214, -0.5449038, -2.269578, 0, 1, 0.4196078, 1,
-0.2126012, -3.650151, -4.490603, 0, 1, 0.4235294, 1,
-0.2068455, 0.1197924, -0.502665, 0, 1, 0.4313726, 1,
-0.2058609, -0.1722631, -2.952491, 0, 1, 0.4352941, 1,
-0.2039602, 2.155958, -0.7391133, 0, 1, 0.4431373, 1,
-0.200072, 0.4762294, -1.754879, 0, 1, 0.4470588, 1,
-0.1937427, 1.437162, -1.499954, 0, 1, 0.454902, 1,
-0.1926052, -1.90898, -4.203569, 0, 1, 0.4588235, 1,
-0.1900603, 0.4401796, -0.2676641, 0, 1, 0.4666667, 1,
-0.1879645, 0.3856615, 0.4094888, 0, 1, 0.4705882, 1,
-0.1879484, 0.9500374, 0.6574031, 0, 1, 0.4784314, 1,
-0.1845988, 0.2166294, -1.457314, 0, 1, 0.4823529, 1,
-0.1836062, 0.3582156, 0.0002179027, 0, 1, 0.4901961, 1,
-0.1822949, -0.4203704, -3.117315, 0, 1, 0.4941176, 1,
-0.1774518, -2.737152, -2.593773, 0, 1, 0.5019608, 1,
-0.1735291, -1.610384, -0.9762358, 0, 1, 0.509804, 1,
-0.1700404, 0.7036059, -0.01224595, 0, 1, 0.5137255, 1,
-0.1684206, -0.01706707, -2.696351, 0, 1, 0.5215687, 1,
-0.1678222, -0.242894, -2.051019, 0, 1, 0.5254902, 1,
-0.1640819, 0.7071803, 1.314623, 0, 1, 0.5333334, 1,
-0.1635173, -1.817762, -1.711902, 0, 1, 0.5372549, 1,
-0.1555316, -0.1257153, -1.254931, 0, 1, 0.5450981, 1,
-0.1503918, 0.4077114, -1.971287, 0, 1, 0.5490196, 1,
-0.1455448, 0.4783386, 1.480619, 0, 1, 0.5568628, 1,
-0.1455089, -1.620408, -3.362728, 0, 1, 0.5607843, 1,
-0.1448997, -0.9595132, -3.294564, 0, 1, 0.5686275, 1,
-0.1393724, 0.857784, -0.6088046, 0, 1, 0.572549, 1,
-0.1333673, 0.09722847, 0.4526776, 0, 1, 0.5803922, 1,
-0.1332296, -0.7789853, -3.07558, 0, 1, 0.5843138, 1,
-0.1289315, -1.09746, -2.072422, 0, 1, 0.5921569, 1,
-0.1284508, -0.1872959, -2.452058, 0, 1, 0.5960785, 1,
-0.1271136, 1.367985, -1.1106, 0, 1, 0.6039216, 1,
-0.1268348, -0.7265925, -1.529953, 0, 1, 0.6117647, 1,
-0.1267572, 1.274054, -2.173329, 0, 1, 0.6156863, 1,
-0.1266043, -1.100305, -3.760598, 0, 1, 0.6235294, 1,
-0.1238121, 0.7040696, 0.4408591, 0, 1, 0.627451, 1,
-0.1237439, 0.7962215, -1.759481, 0, 1, 0.6352941, 1,
-0.1229621, 0.4815643, -0.05444775, 0, 1, 0.6392157, 1,
-0.1188256, -1.190003, -3.689564, 0, 1, 0.6470588, 1,
-0.1129098, 0.3466327, 0.2866037, 0, 1, 0.6509804, 1,
-0.1082679, 0.5640565, -0.9571205, 0, 1, 0.6588235, 1,
-0.1016348, 1.005579, 0.6037261, 0, 1, 0.6627451, 1,
-0.1015363, -1.835676, -2.34388, 0, 1, 0.6705883, 1,
-0.1008063, 1.202193, -0.2186428, 0, 1, 0.6745098, 1,
-0.1007092, -0.8224264, -2.369678, 0, 1, 0.682353, 1,
-0.09405163, 1.467127, -1.38903, 0, 1, 0.6862745, 1,
-0.09046154, 0.4201957, -2.336853, 0, 1, 0.6941177, 1,
-0.08996465, 0.6350204, -0.5715476, 0, 1, 0.7019608, 1,
-0.08636039, -0.3947951, -4.970286, 0, 1, 0.7058824, 1,
-0.07930952, 0.825061, 0.9286393, 0, 1, 0.7137255, 1,
-0.07880808, 0.5734987, -0.7564983, 0, 1, 0.7176471, 1,
-0.06791967, 0.01845057, 0.3685051, 0, 1, 0.7254902, 1,
-0.06759635, -0.7500518, -3.921223, 0, 1, 0.7294118, 1,
-0.06673371, 1.05675, 1.272556, 0, 1, 0.7372549, 1,
-0.06614238, 0.8705227, -0.5383359, 0, 1, 0.7411765, 1,
-0.06467262, -0.6948004, -1.546491, 0, 1, 0.7490196, 1,
-0.05981807, -0.5321425, -4.005993, 0, 1, 0.7529412, 1,
-0.05549615, -0.4010105, -3.799851, 0, 1, 0.7607843, 1,
-0.05204963, 1.060291, -0.2996804, 0, 1, 0.7647059, 1,
-0.04768194, 1.020077, -1.024685, 0, 1, 0.772549, 1,
-0.04658096, -0.2336348, -3.478156, 0, 1, 0.7764706, 1,
-0.04574294, 0.01027401, -0.9664838, 0, 1, 0.7843137, 1,
-0.04476295, 0.2759529, 0.1080331, 0, 1, 0.7882353, 1,
-0.04265741, 1.280719, -0.147045, 0, 1, 0.7960784, 1,
-0.03454646, -0.3277012, -3.753051, 0, 1, 0.8039216, 1,
-0.03191983, -1.61181, -5.102545, 0, 1, 0.8078431, 1,
-0.03173677, 0.6423426, -0.03914983, 0, 1, 0.8156863, 1,
-0.02741985, -0.6041564, -2.221663, 0, 1, 0.8196079, 1,
-0.02662661, -0.7139399, -3.104126, 0, 1, 0.827451, 1,
-0.02351064, -0.8553059, -1.921173, 0, 1, 0.8313726, 1,
-0.01889916, -0.1719938, -4.919922, 0, 1, 0.8392157, 1,
-0.01437236, 1.806704, -0.09694285, 0, 1, 0.8431373, 1,
-0.008845457, 0.4460694, -0.9247119, 0, 1, 0.8509804, 1,
-0.007693988, 0.2349506, 1.504559, 0, 1, 0.854902, 1,
-0.005397135, 0.925611, 1.623315, 0, 1, 0.8627451, 1,
-0.004461435, -1.293521, -2.764458, 0, 1, 0.8666667, 1,
0.004026503, -0.3383478, 4.334868, 0, 1, 0.8745098, 1,
0.006571296, -0.6114199, 2.537053, 0, 1, 0.8784314, 1,
0.007605208, -1.059566, 1.907058, 0, 1, 0.8862745, 1,
0.007816586, 0.9438089, 0.66572, 0, 1, 0.8901961, 1,
0.008023004, 0.4472823, 0.9710591, 0, 1, 0.8980392, 1,
0.008659587, -0.4865262, 3.624973, 0, 1, 0.9058824, 1,
0.01613428, -1.092773, 5.310399, 0, 1, 0.9098039, 1,
0.01842807, 0.02077017, 2.059837, 0, 1, 0.9176471, 1,
0.01887391, -0.4563774, 1.834719, 0, 1, 0.9215686, 1,
0.02118012, 1.239642, -0.4133578, 0, 1, 0.9294118, 1,
0.02876104, 0.7619844, 2.758534, 0, 1, 0.9333333, 1,
0.02903855, -1.1649, 2.844017, 0, 1, 0.9411765, 1,
0.03910175, -1.331876, 4.361753, 0, 1, 0.945098, 1,
0.04438646, 1.11456, -0.5176492, 0, 1, 0.9529412, 1,
0.04485749, 1.680905, -1.38612, 0, 1, 0.9568627, 1,
0.04499896, -0.5543293, 4.560859, 0, 1, 0.9647059, 1,
0.04595409, -0.6366779, 2.432442, 0, 1, 0.9686275, 1,
0.04912673, -1.060734, 5.512793, 0, 1, 0.9764706, 1,
0.0501965, -0.3390642, 2.735229, 0, 1, 0.9803922, 1,
0.05111863, 0.4100848, 0.3236514, 0, 1, 0.9882353, 1,
0.05322378, 0.6546286, 0.7505862, 0, 1, 0.9921569, 1,
0.05687544, 2.258063, 0.5865015, 0, 1, 1, 1,
0.06166729, -1.173888, 4.149004, 0, 0.9921569, 1, 1,
0.06411065, 1.06865, -2.209355, 0, 0.9882353, 1, 1,
0.06522432, 0.2599447, -0.3595779, 0, 0.9803922, 1, 1,
0.06848002, -0.4376812, 2.446881, 0, 0.9764706, 1, 1,
0.0842467, -0.6756015, 2.256819, 0, 0.9686275, 1, 1,
0.08789247, 1.511695, -0.3165147, 0, 0.9647059, 1, 1,
0.09047095, -1.57438, 1.714693, 0, 0.9568627, 1, 1,
0.0912756, -0.5287622, 3.242451, 0, 0.9529412, 1, 1,
0.0916368, 0.6663727, 0.3970114, 0, 0.945098, 1, 1,
0.09204564, 0.8482604, 1.474011, 0, 0.9411765, 1, 1,
0.09274057, 0.7357681, 1.402279, 0, 0.9333333, 1, 1,
0.09366617, -0.3744544, 3.681424, 0, 0.9294118, 1, 1,
0.09764203, 1.026407, -1.102628, 0, 0.9215686, 1, 1,
0.09776394, -0.4868568, 3.292175, 0, 0.9176471, 1, 1,
0.1019353, 0.9403412, 0.2435222, 0, 0.9098039, 1, 1,
0.1028467, 3.181524, -1.268868, 0, 0.9058824, 1, 1,
0.1077671, 0.3675073, 0.1301911, 0, 0.8980392, 1, 1,
0.113202, 1.456457, -0.4517168, 0, 0.8901961, 1, 1,
0.1154003, -0.1116464, 3.135441, 0, 0.8862745, 1, 1,
0.1162724, 1.09018, -0.5051178, 0, 0.8784314, 1, 1,
0.1178028, -0.835793, 3.295008, 0, 0.8745098, 1, 1,
0.1189477, -0.9514815, 3.504664, 0, 0.8666667, 1, 1,
0.1196878, -0.5263156, 4.567885, 0, 0.8627451, 1, 1,
0.1202867, -0.5080046, 3.298004, 0, 0.854902, 1, 1,
0.1280212, -0.1300551, 2.860877, 0, 0.8509804, 1, 1,
0.129508, 0.04131449, 0.447398, 0, 0.8431373, 1, 1,
0.1322697, -0.1616556, 1.704283, 0, 0.8392157, 1, 1,
0.132868, -1.253711, 3.501967, 0, 0.8313726, 1, 1,
0.1330037, 0.9407096, 0.5593877, 0, 0.827451, 1, 1,
0.133538, -0.4898911, 2.736903, 0, 0.8196079, 1, 1,
0.1338664, 1.065853, -0.6244364, 0, 0.8156863, 1, 1,
0.1339811, -0.6383834, 1.347936, 0, 0.8078431, 1, 1,
0.1345107, -0.8633328, 3.971536, 0, 0.8039216, 1, 1,
0.1350581, 0.03017739, 0.6983921, 0, 0.7960784, 1, 1,
0.1355235, 1.223741, -0.4879638, 0, 0.7882353, 1, 1,
0.1356988, -0.790532, 4.615377, 0, 0.7843137, 1, 1,
0.1384522, -1.225832, 3.440084, 0, 0.7764706, 1, 1,
0.1389576, 1.053312, 1.540228, 0, 0.772549, 1, 1,
0.1440523, -2.463918, 3.175193, 0, 0.7647059, 1, 1,
0.1453668, -0.04838067, 2.695361, 0, 0.7607843, 1, 1,
0.1472107, -2.440994, 3.746485, 0, 0.7529412, 1, 1,
0.1484368, -0.5252431, 4.207438, 0, 0.7490196, 1, 1,
0.1536808, -0.9888034, 4.027291, 0, 0.7411765, 1, 1,
0.1541194, 1.063661, 0.1405106, 0, 0.7372549, 1, 1,
0.1549187, -0.5010457, 2.794918, 0, 0.7294118, 1, 1,
0.155442, 1.654565, 0.4935071, 0, 0.7254902, 1, 1,
0.1555883, -2.40619, 3.550758, 0, 0.7176471, 1, 1,
0.1570777, -0.14076, 2.338606, 0, 0.7137255, 1, 1,
0.1596482, -2.579889, 2.44815, 0, 0.7058824, 1, 1,
0.1619052, -1.030629, 3.047752, 0, 0.6980392, 1, 1,
0.1710675, 0.5481768, -1.041254, 0, 0.6941177, 1, 1,
0.1742307, 0.09871035, 1.422257, 0, 0.6862745, 1, 1,
0.174682, 1.257808, -0.5494604, 0, 0.682353, 1, 1,
0.1750905, 0.6214573, 2.109535, 0, 0.6745098, 1, 1,
0.1818628, 0.2003811, -0.2764328, 0, 0.6705883, 1, 1,
0.1895894, 0.8288372, 1.395622, 0, 0.6627451, 1, 1,
0.1973996, -0.4676874, 3.344489, 0, 0.6588235, 1, 1,
0.1989602, 1.848488, 0.9880518, 0, 0.6509804, 1, 1,
0.2047458, -0.411749, 4.118785, 0, 0.6470588, 1, 1,
0.2058303, -0.2798892, 2.143068, 0, 0.6392157, 1, 1,
0.2121389, 1.101477, 0.0170103, 0, 0.6352941, 1, 1,
0.2129245, -0.2670327, 3.114176, 0, 0.627451, 1, 1,
0.2159559, -0.1692602, 2.913758, 0, 0.6235294, 1, 1,
0.2242531, 0.8482975, 0.5222692, 0, 0.6156863, 1, 1,
0.2282638, 1.298659, 0.8351746, 0, 0.6117647, 1, 1,
0.2325933, 0.871987, 2.413695, 0, 0.6039216, 1, 1,
0.234051, 0.2683729, -0.28044, 0, 0.5960785, 1, 1,
0.2380598, 0.1022636, -0.2435095, 0, 0.5921569, 1, 1,
0.2414968, 1.127298, -0.9962125, 0, 0.5843138, 1, 1,
0.2424748, 0.6834389, 0.441906, 0, 0.5803922, 1, 1,
0.2437643, 0.6358201, -0.2196727, 0, 0.572549, 1, 1,
0.2477519, 0.8482391, 2.198236, 0, 0.5686275, 1, 1,
0.2504291, 0.9276721, -0.8154078, 0, 0.5607843, 1, 1,
0.2556698, -0.08820908, 1.336281, 0, 0.5568628, 1, 1,
0.2617925, -0.906251, 2.806052, 0, 0.5490196, 1, 1,
0.2622084, 0.4341186, 0.1187264, 0, 0.5450981, 1, 1,
0.2632444, -0.1876876, 1.559984, 0, 0.5372549, 1, 1,
0.2646737, 1.543669, 0.6821843, 0, 0.5333334, 1, 1,
0.2664086, -0.1320963, 3.137812, 0, 0.5254902, 1, 1,
0.2695578, -0.2315388, 1.280701, 0, 0.5215687, 1, 1,
0.2728692, 0.6854999, -1.043631, 0, 0.5137255, 1, 1,
0.2769239, 0.8806056, 0.1117741, 0, 0.509804, 1, 1,
0.2797718, 2.296897, 0.7005706, 0, 0.5019608, 1, 1,
0.2830224, -0.7697015, 4.242692, 0, 0.4941176, 1, 1,
0.284398, 0.07136631, 1.838753, 0, 0.4901961, 1, 1,
0.289685, 0.4362727, -0.1728514, 0, 0.4823529, 1, 1,
0.2909276, 0.3535532, -0.6273746, 0, 0.4784314, 1, 1,
0.2921431, -2.009963, 2.493735, 0, 0.4705882, 1, 1,
0.2937736, -1.054726, 4.265003, 0, 0.4666667, 1, 1,
0.2941644, 0.7509407, -0.1979866, 0, 0.4588235, 1, 1,
0.2943744, 2.16951, 1.604279, 0, 0.454902, 1, 1,
0.2962549, -0.2174191, 1.255957, 0, 0.4470588, 1, 1,
0.3007639, -0.3757367, 3.304687, 0, 0.4431373, 1, 1,
0.3007984, -1.140009, 5.061207, 0, 0.4352941, 1, 1,
0.3039352, -1.805617, 1.890241, 0, 0.4313726, 1, 1,
0.3058789, 0.8586444, 0.9370831, 0, 0.4235294, 1, 1,
0.3097113, -1.368764, 0.8046255, 0, 0.4196078, 1, 1,
0.3104266, -1.147897, 0.5991411, 0, 0.4117647, 1, 1,
0.3134842, -0.6105591, 4.271067, 0, 0.4078431, 1, 1,
0.3234821, -1.897844, 2.597449, 0, 0.4, 1, 1,
0.3261308, -0.9846784, 1.171538, 0, 0.3921569, 1, 1,
0.3272966, 0.3769288, -0.8854836, 0, 0.3882353, 1, 1,
0.3284104, 0.12716, 1.602061, 0, 0.3803922, 1, 1,
0.3292524, -2.474559, 2.918286, 0, 0.3764706, 1, 1,
0.3297124, -0.5730205, 2.574826, 0, 0.3686275, 1, 1,
0.3298871, -0.9218825, 1.102561, 0, 0.3647059, 1, 1,
0.3315038, -1.58345, 3.50304, 0, 0.3568628, 1, 1,
0.3364365, 1.215099, 0.2335289, 0, 0.3529412, 1, 1,
0.3364551, 0.5812446, 0.832371, 0, 0.345098, 1, 1,
0.3385637, 0.4731424, -0.1544263, 0, 0.3411765, 1, 1,
0.3387482, -0.4646844, 2.276361, 0, 0.3333333, 1, 1,
0.3406569, 1.163616, 2.019109, 0, 0.3294118, 1, 1,
0.3428866, 0.4706814, 0.5052221, 0, 0.3215686, 1, 1,
0.3437764, -2.945888, 3.239257, 0, 0.3176471, 1, 1,
0.3444772, -0.9644799, 3.802836, 0, 0.3098039, 1, 1,
0.3468076, 0.5809419, -0.4134609, 0, 0.3058824, 1, 1,
0.3509246, 0.1461471, 0.4129677, 0, 0.2980392, 1, 1,
0.3519444, 0.07958309, 1.244226, 0, 0.2901961, 1, 1,
0.3520672, 0.1429102, 1.673391, 0, 0.2862745, 1, 1,
0.354187, 0.02444895, -0.0223162, 0, 0.2784314, 1, 1,
0.3556743, -0.1215324, 2.804623, 0, 0.2745098, 1, 1,
0.3635233, -0.4216974, 2.284573, 0, 0.2666667, 1, 1,
0.3656487, 1.886427, 0.0656818, 0, 0.2627451, 1, 1,
0.3749464, 2.371706, 0.6646606, 0, 0.254902, 1, 1,
0.3763756, -1.259397, 3.674263, 0, 0.2509804, 1, 1,
0.3766959, -0.5423609, 3.111069, 0, 0.2431373, 1, 1,
0.3787248, 1.381227, 0.5624266, 0, 0.2392157, 1, 1,
0.3796258, 0.3517706, 1.072569, 0, 0.2313726, 1, 1,
0.38163, -1.038896, 3.058964, 0, 0.227451, 1, 1,
0.3837681, 1.143283, 0.2688925, 0, 0.2196078, 1, 1,
0.3844257, 0.5724529, -0.7545024, 0, 0.2156863, 1, 1,
0.3852305, 0.533916, 2.039325, 0, 0.2078431, 1, 1,
0.3865375, 0.3617433, 1.324653, 0, 0.2039216, 1, 1,
0.3875596, 0.3061469, 0.4925444, 0, 0.1960784, 1, 1,
0.3905355, 1.364339, 0.4469085, 0, 0.1882353, 1, 1,
0.3912053, -0.7329221, 3.017427, 0, 0.1843137, 1, 1,
0.3980986, 0.3639965, 2.084419, 0, 0.1764706, 1, 1,
0.4019468, -0.956714, 2.044396, 0, 0.172549, 1, 1,
0.403534, -0.04908276, 1.114469, 0, 0.1647059, 1, 1,
0.4087282, 0.06076742, 1.610263, 0, 0.1607843, 1, 1,
0.4105554, -0.8927729, 2.711013, 0, 0.1529412, 1, 1,
0.4116335, 1.274304, 1.204695, 0, 0.1490196, 1, 1,
0.4162186, 2.236899, 0.423261, 0, 0.1411765, 1, 1,
0.4165153, 0.4882458, 0.9132361, 0, 0.1372549, 1, 1,
0.4211449, -1.856738, 3.35771, 0, 0.1294118, 1, 1,
0.4218432, 0.7161125, 1.12149, 0, 0.1254902, 1, 1,
0.4225371, 1.72097, -0.01492766, 0, 0.1176471, 1, 1,
0.4227894, -1.095643, 1.918078, 0, 0.1137255, 1, 1,
0.4259605, -0.0741644, 0.4880366, 0, 0.1058824, 1, 1,
0.4303048, 1.007913, 0.2925749, 0, 0.09803922, 1, 1,
0.4306646, 0.3702516, -0.8187181, 0, 0.09411765, 1, 1,
0.4317098, 1.153058, 0.5936632, 0, 0.08627451, 1, 1,
0.432793, -0.7779311, 3.09162, 0, 0.08235294, 1, 1,
0.4337877, -0.5337, 3.679874, 0, 0.07450981, 1, 1,
0.4343986, 0.3837426, 1.890949, 0, 0.07058824, 1, 1,
0.4344236, -0.7356929, 5.739631, 0, 0.0627451, 1, 1,
0.4348916, -0.5887685, 3.121831, 0, 0.05882353, 1, 1,
0.4349765, -0.1246733, 1.685249, 0, 0.05098039, 1, 1,
0.4374275, -0.7847367, 2.263906, 0, 0.04705882, 1, 1,
0.4400704, 0.4374194, 2.766795, 0, 0.03921569, 1, 1,
0.4416199, 2.749404, 0.5888615, 0, 0.03529412, 1, 1,
0.4416818, 0.2223198, -0.5097955, 0, 0.02745098, 1, 1,
0.4434392, -0.3787458, 1.541597, 0, 0.02352941, 1, 1,
0.4456239, -0.4111586, 1.473488, 0, 0.01568628, 1, 1,
0.4456246, -0.02831258, 1.933079, 0, 0.01176471, 1, 1,
0.4539838, -0.8706818, 2.841283, 0, 0.003921569, 1, 1,
0.4588538, 1.210793, 2.461461, 0.003921569, 0, 1, 1,
0.4589694, 0.4741825, 1.306743, 0.007843138, 0, 1, 1,
0.4604875, -0.3589941, 1.8676, 0.01568628, 0, 1, 1,
0.4633538, 2.643616, 0.1817359, 0.01960784, 0, 1, 1,
0.4640244, 0.5638901, 0.5660267, 0.02745098, 0, 1, 1,
0.4714459, 1.176032, -0.2284453, 0.03137255, 0, 1, 1,
0.4726065, -0.4661917, 3.249088, 0.03921569, 0, 1, 1,
0.4752589, -1.206971, 2.629939, 0.04313726, 0, 1, 1,
0.4788238, 0.9229307, 0.9780914, 0.05098039, 0, 1, 1,
0.4831511, 1.118086, 1.684748, 0.05490196, 0, 1, 1,
0.486175, 1.705819, 0.7608648, 0.0627451, 0, 1, 1,
0.4867906, 0.1277872, 1.630607, 0.06666667, 0, 1, 1,
0.4881029, -1.106104, 2.926008, 0.07450981, 0, 1, 1,
0.4941969, 2.491379, -0.3800512, 0.07843138, 0, 1, 1,
0.4986891, 0.4085307, 1.236782, 0.08627451, 0, 1, 1,
0.4992903, -0.3054416, 4.645775, 0.09019608, 0, 1, 1,
0.5060474, -1.283044, 2.62903, 0.09803922, 0, 1, 1,
0.5065806, -1.202571, 2.843245, 0.1058824, 0, 1, 1,
0.5148186, 0.875887, 1.267203, 0.1098039, 0, 1, 1,
0.5196043, -1.149731, 2.775693, 0.1176471, 0, 1, 1,
0.5233299, 1.069796, 1.016105, 0.1215686, 0, 1, 1,
0.5280004, 0.32362, 1.638274, 0.1294118, 0, 1, 1,
0.5333479, 1.230718, 1.87869, 0.1333333, 0, 1, 1,
0.5370486, 1.477213, 1.249344, 0.1411765, 0, 1, 1,
0.5385795, -1.050598, 3.569594, 0.145098, 0, 1, 1,
0.5389388, -0.00765332, 0.6152464, 0.1529412, 0, 1, 1,
0.5434021, -1.81246, 1.699322, 0.1568628, 0, 1, 1,
0.5517279, -0.1816846, 1.446301, 0.1647059, 0, 1, 1,
0.5531425, -0.5820066, 1.975662, 0.1686275, 0, 1, 1,
0.5599191, -0.3907065, 1.510124, 0.1764706, 0, 1, 1,
0.566862, 1.073964, 0.2694395, 0.1803922, 0, 1, 1,
0.5712937, 0.1278757, 0.1994393, 0.1882353, 0, 1, 1,
0.5744867, 0.2244182, 0.2566993, 0.1921569, 0, 1, 1,
0.5754513, 0.6337113, 1.227767, 0.2, 0, 1, 1,
0.5802845, 1.340546, -0.5672053, 0.2078431, 0, 1, 1,
0.5832568, -1.034951, 3.676047, 0.2117647, 0, 1, 1,
0.5833702, -0.5430539, 1.930302, 0.2196078, 0, 1, 1,
0.5843786, 0.3621269, 0.4551008, 0.2235294, 0, 1, 1,
0.5870878, -0.1059854, 1.297176, 0.2313726, 0, 1, 1,
0.5876004, 0.1710464, 1.208188, 0.2352941, 0, 1, 1,
0.5921506, -0.02930163, 1.521536, 0.2431373, 0, 1, 1,
0.5923131, 0.2961554, 0.9299972, 0.2470588, 0, 1, 1,
0.5923406, -0.4375726, 1.218914, 0.254902, 0, 1, 1,
0.5959302, -0.6404402, 1.252967, 0.2588235, 0, 1, 1,
0.598732, 0.779377, -0.6101702, 0.2666667, 0, 1, 1,
0.6031817, 0.1840417, 1.801309, 0.2705882, 0, 1, 1,
0.6036107, 0.2122185, 1.359984, 0.2784314, 0, 1, 1,
0.6116372, 1.548986, -0.08809996, 0.282353, 0, 1, 1,
0.6147605, -0.7751253, 4.034058, 0.2901961, 0, 1, 1,
0.6230682, 0.5729212, -0.8808226, 0.2941177, 0, 1, 1,
0.6246184, -0.1586837, 1.03068, 0.3019608, 0, 1, 1,
0.6270308, 0.8205177, 1.953796, 0.3098039, 0, 1, 1,
0.6291701, -0.5882881, 3.541973, 0.3137255, 0, 1, 1,
0.6326473, -0.4171935, 2.551934, 0.3215686, 0, 1, 1,
0.6400052, 1.355538, 0.8421422, 0.3254902, 0, 1, 1,
0.6411936, -1.198679, 3.35514, 0.3333333, 0, 1, 1,
0.6421471, 0.8164626, 2.408888, 0.3372549, 0, 1, 1,
0.6469553, 0.09390289, 2.811469, 0.345098, 0, 1, 1,
0.6470072, -0.4023344, 0.3351412, 0.3490196, 0, 1, 1,
0.6471381, -0.09744312, 1.153572, 0.3568628, 0, 1, 1,
0.6474721, 0.1732373, 1.174733, 0.3607843, 0, 1, 1,
0.6496741, 0.4585531, 0.506494, 0.3686275, 0, 1, 1,
0.6497132, 0.4835354, -0.3244209, 0.372549, 0, 1, 1,
0.6508776, 1.767483, -0.1988089, 0.3803922, 0, 1, 1,
0.6528559, -0.6253375, 0.8157418, 0.3843137, 0, 1, 1,
0.6535664, 1.150042, 0.3288245, 0.3921569, 0, 1, 1,
0.653748, -0.5628404, 2.149847, 0.3960784, 0, 1, 1,
0.6569538, -0.4736277, 3.346053, 0.4039216, 0, 1, 1,
0.6570377, 0.0554554, -0.4862018, 0.4117647, 0, 1, 1,
0.6583306, 0.345279, 1.256407, 0.4156863, 0, 1, 1,
0.6597323, 0.5096605, -0.3631415, 0.4235294, 0, 1, 1,
0.6665441, -1.051141, 1.256226, 0.427451, 0, 1, 1,
0.6758375, 2.194123, 0.7812962, 0.4352941, 0, 1, 1,
0.6833108, 1.069024, 1.689862, 0.4392157, 0, 1, 1,
0.6834109, -0.5265831, 1.04469, 0.4470588, 0, 1, 1,
0.6849684, 0.5179434, -1.844851, 0.4509804, 0, 1, 1,
0.6918491, 0.4801784, -0.5095758, 0.4588235, 0, 1, 1,
0.6939946, 0.6693996, 1.282982, 0.4627451, 0, 1, 1,
0.6956069, -0.4673826, 0.6190264, 0.4705882, 0, 1, 1,
0.6962538, -0.3818553, 3.577593, 0.4745098, 0, 1, 1,
0.6969793, -0.8142892, 3.1509, 0.4823529, 0, 1, 1,
0.6974263, 0.03687041, 2.133173, 0.4862745, 0, 1, 1,
0.6975177, 0.6665702, 0.497574, 0.4941176, 0, 1, 1,
0.7006844, 0.08627715, 2.005948, 0.5019608, 0, 1, 1,
0.7011378, 1.226988, 2.458943, 0.5058824, 0, 1, 1,
0.7042871, 1.285939, 0.582809, 0.5137255, 0, 1, 1,
0.7048285, 1.114951, 0.5086009, 0.5176471, 0, 1, 1,
0.7056184, -0.05100077, -0.5121122, 0.5254902, 0, 1, 1,
0.705827, 1.668695, -1.062658, 0.5294118, 0, 1, 1,
0.7063338, -0.4020461, 1.202195, 0.5372549, 0, 1, 1,
0.709874, -0.4601218, 0.7494234, 0.5411765, 0, 1, 1,
0.7106707, -0.6235607, 3.750943, 0.5490196, 0, 1, 1,
0.7159798, 1.689457, 1.786624, 0.5529412, 0, 1, 1,
0.7201349, -0.2208481, 2.38468, 0.5607843, 0, 1, 1,
0.7235488, 0.519373, -0.2003761, 0.5647059, 0, 1, 1,
0.736562, -0.4191642, 2.854796, 0.572549, 0, 1, 1,
0.7379544, -0.2709959, 1.477829, 0.5764706, 0, 1, 1,
0.7432257, 0.446839, -0.7066029, 0.5843138, 0, 1, 1,
0.7485031, 0.4526821, 0.2384387, 0.5882353, 0, 1, 1,
0.752134, 0.08925, 0.919904, 0.5960785, 0, 1, 1,
0.7526656, 0.8407709, 1.363106, 0.6039216, 0, 1, 1,
0.7674164, 0.1467499, 0.7360908, 0.6078432, 0, 1, 1,
0.7724383, 1.743275, -0.4238487, 0.6156863, 0, 1, 1,
0.7752014, -1.16242, 1.050344, 0.6196079, 0, 1, 1,
0.7792914, 1.784983, 0.7690398, 0.627451, 0, 1, 1,
0.780445, 0.5932752, 1.581585, 0.6313726, 0, 1, 1,
0.7809055, 0.3949948, -0.1558724, 0.6392157, 0, 1, 1,
0.7843257, 1.783063, -0.3048846, 0.6431373, 0, 1, 1,
0.7893629, -1.581557, 0.6121944, 0.6509804, 0, 1, 1,
0.7914879, -0.826178, 1.663484, 0.654902, 0, 1, 1,
0.7928494, -0.1950053, 3.664415, 0.6627451, 0, 1, 1,
0.7965569, 0.6202372, 0.2839906, 0.6666667, 0, 1, 1,
0.8010651, -1.520205, 0.8999147, 0.6745098, 0, 1, 1,
0.8049865, 0.1013638, 0.2807717, 0.6784314, 0, 1, 1,
0.8054614, 0.7472751, 2.240665, 0.6862745, 0, 1, 1,
0.8094189, 0.668248, 0.7028687, 0.6901961, 0, 1, 1,
0.8140477, 0.1642058, 1.802425, 0.6980392, 0, 1, 1,
0.8231481, -0.8090562, 2.255314, 0.7058824, 0, 1, 1,
0.8256484, 0.4675432, 0.885802, 0.7098039, 0, 1, 1,
0.8277608, 1.047465, 1.038795, 0.7176471, 0, 1, 1,
0.8326854, 0.3248852, 0.5376529, 0.7215686, 0, 1, 1,
0.8348289, -0.3818515, 2.295596, 0.7294118, 0, 1, 1,
0.8353396, 0.4904525, 0.8006036, 0.7333333, 0, 1, 1,
0.8392202, -1.152958, 2.082585, 0.7411765, 0, 1, 1,
0.8395936, -0.3887602, 2.19514, 0.7450981, 0, 1, 1,
0.8396074, -0.6531548, 3.200323, 0.7529412, 0, 1, 1,
0.8402772, 0.0423652, 2.622061, 0.7568628, 0, 1, 1,
0.8438572, 0.8901204, -0.4911666, 0.7647059, 0, 1, 1,
0.844602, -1.893061, 1.977707, 0.7686275, 0, 1, 1,
0.8458189, -0.4850844, 2.690274, 0.7764706, 0, 1, 1,
0.8463905, -2.065894, 4.536439, 0.7803922, 0, 1, 1,
0.8474321, 1.307311, -0.2723717, 0.7882353, 0, 1, 1,
0.8554791, -1.816122, 2.745755, 0.7921569, 0, 1, 1,
0.861661, 1.372429, 0.1812262, 0.8, 0, 1, 1,
0.8638037, -1.244367, 1.33437, 0.8078431, 0, 1, 1,
0.8648575, -1.392755, 2.894619, 0.8117647, 0, 1, 1,
0.8667675, 0.04369512, 1.55314, 0.8196079, 0, 1, 1,
0.8671507, 0.03397639, -0.05899483, 0.8235294, 0, 1, 1,
0.8713925, -1.20714, 3.7822, 0.8313726, 0, 1, 1,
0.8733867, -1.932932, 3.85522, 0.8352941, 0, 1, 1,
0.8739057, -0.3671852, 2.172659, 0.8431373, 0, 1, 1,
0.8853659, 0.7884932, 1.992873, 0.8470588, 0, 1, 1,
0.8873442, 0.08593971, 2.31469, 0.854902, 0, 1, 1,
0.8897296, 0.05030545, 1.70787, 0.8588235, 0, 1, 1,
0.8922712, -0.1545138, 0.1391211, 0.8666667, 0, 1, 1,
0.893667, 0.5744595, 1.609815, 0.8705882, 0, 1, 1,
0.8939669, -0.6101004, 2.581852, 0.8784314, 0, 1, 1,
0.8956435, 0.3274035, 0.2433454, 0.8823529, 0, 1, 1,
0.9001129, 2.422211, 0.7513342, 0.8901961, 0, 1, 1,
0.9048279, -0.04538004, 0.2649924, 0.8941177, 0, 1, 1,
0.9050429, 0.188261, 1.528806, 0.9019608, 0, 1, 1,
0.9151449, -0.07990214, 1.693478, 0.9098039, 0, 1, 1,
0.9160191, 0.5058674, 0.1906211, 0.9137255, 0, 1, 1,
0.9348406, -1.545185, 1.162181, 0.9215686, 0, 1, 1,
0.936989, 0.8666059, 1.211079, 0.9254902, 0, 1, 1,
0.9407216, 0.5255783, 1.77191, 0.9333333, 0, 1, 1,
0.9500945, 0.4681996, 0.8151489, 0.9372549, 0, 1, 1,
0.9502191, -1.468265, 1.958439, 0.945098, 0, 1, 1,
0.9562467, -1.833104, 1.427709, 0.9490196, 0, 1, 1,
0.9606518, -0.3125755, 1.655695, 0.9568627, 0, 1, 1,
0.9634495, -0.1084205, 0.4507484, 0.9607843, 0, 1, 1,
0.9663079, 0.7801859, 2.356755, 0.9686275, 0, 1, 1,
0.9665031, 0.9838874, 0.2842111, 0.972549, 0, 1, 1,
0.9674827, -0.8512317, 0.9337214, 0.9803922, 0, 1, 1,
0.9729501, -0.6414999, 3.604181, 0.9843137, 0, 1, 1,
0.9743074, -0.06721914, 1.14373, 0.9921569, 0, 1, 1,
0.9772217, -0.3645843, 1.356941, 0.9960784, 0, 1, 1,
0.97763, 1.68716, 1.587187, 1, 0, 0.9960784, 1,
0.9796766, -0.3129283, 3.180715, 1, 0, 0.9882353, 1,
0.9833423, 1.601268, -0.02914345, 1, 0, 0.9843137, 1,
0.9843975, -0.2588841, 0.9795136, 1, 0, 0.9764706, 1,
0.9859968, 0.03366886, 1.596237, 1, 0, 0.972549, 1,
0.9868483, -0.1410745, 1.374198, 1, 0, 0.9647059, 1,
0.9907526, -2.013186, 3.875371, 1, 0, 0.9607843, 1,
1.001585, 0.2678592, 3.060001, 1, 0, 0.9529412, 1,
1.012841, 1.437358, 1.899649, 1, 0, 0.9490196, 1,
1.022201, -0.609483, 2.200631, 1, 0, 0.9411765, 1,
1.022387, -0.2117971, 2.504347, 1, 0, 0.9372549, 1,
1.023152, 1.378553, -1.665658, 1, 0, 0.9294118, 1,
1.036427, -1.427278, 2.794353, 1, 0, 0.9254902, 1,
1.03895, -0.2996047, 1.862208, 1, 0, 0.9176471, 1,
1.039354, -2.861918, 3.893591, 1, 0, 0.9137255, 1,
1.044212, -0.03599223, 1.058471, 1, 0, 0.9058824, 1,
1.046128, -0.9103855, 1.824255, 1, 0, 0.9019608, 1,
1.05186, -0.8551098, 1.501438, 1, 0, 0.8941177, 1,
1.061541, -0.9475316, 2.461298, 1, 0, 0.8862745, 1,
1.066504, -0.798505, 1.920918, 1, 0, 0.8823529, 1,
1.07483, -1.093916, 3.08254, 1, 0, 0.8745098, 1,
1.075566, -1.809744, 2.547415, 1, 0, 0.8705882, 1,
1.077574, 0.5754265, 0.3117019, 1, 0, 0.8627451, 1,
1.089037, -0.5966246, 0.4834314, 1, 0, 0.8588235, 1,
1.089763, 0.3216091, 0.6059486, 1, 0, 0.8509804, 1,
1.094509, -0.4398492, 2.461031, 1, 0, 0.8470588, 1,
1.095117, -0.7236726, 3.644764, 1, 0, 0.8392157, 1,
1.099107, 0.3655534, 1.390792, 1, 0, 0.8352941, 1,
1.099825, 0.1473587, 0.3368439, 1, 0, 0.827451, 1,
1.106121, -0.2800077, 2.600006, 1, 0, 0.8235294, 1,
1.108553, -0.4944175, 1.248722, 1, 0, 0.8156863, 1,
1.114267, -0.1202632, 2.415632, 1, 0, 0.8117647, 1,
1.120628, 0.199452, 0.2078651, 1, 0, 0.8039216, 1,
1.120986, 0.06118944, 0.08680453, 1, 0, 0.7960784, 1,
1.122026, -0.2597104, 1.380507, 1, 0, 0.7921569, 1,
1.12746, 0.3724025, 1.423696, 1, 0, 0.7843137, 1,
1.132389, 0.2837758, 1.665669, 1, 0, 0.7803922, 1,
1.135178, 1.74404, 0.2606497, 1, 0, 0.772549, 1,
1.137208, -2.34226, 1.579138, 1, 0, 0.7686275, 1,
1.138215, -0.2175968, 2.011882, 1, 0, 0.7607843, 1,
1.145322, 0.8949617, 1.394868, 1, 0, 0.7568628, 1,
1.152164, 1.769766, 0.1668771, 1, 0, 0.7490196, 1,
1.152281, -0.4390804, 1.502006, 1, 0, 0.7450981, 1,
1.162452, 1.349726, 0.7927785, 1, 0, 0.7372549, 1,
1.166593, 1.839163, 1.873098, 1, 0, 0.7333333, 1,
1.177195, 1.575226, 0.8150077, 1, 0, 0.7254902, 1,
1.18301, -0.726799, 1.801552, 1, 0, 0.7215686, 1,
1.184127, -0.2871014, 2.64414, 1, 0, 0.7137255, 1,
1.184134, 0.07826618, 1.001019, 1, 0, 0.7098039, 1,
1.187303, -1.495337, 2.876299, 1, 0, 0.7019608, 1,
1.192344, -0.3562049, -1.01967, 1, 0, 0.6941177, 1,
1.201952, 0.1582297, 3.288079, 1, 0, 0.6901961, 1,
1.206854, 0.297442, 0.9446868, 1, 0, 0.682353, 1,
1.216088, 1.037062, 1.684666, 1, 0, 0.6784314, 1,
1.216658, -0.1986901, 2.708227, 1, 0, 0.6705883, 1,
1.217083, -0.275648, 2.202219, 1, 0, 0.6666667, 1,
1.219676, -1.911449, 1.554467, 1, 0, 0.6588235, 1,
1.238267, -0.86531, 4.060569, 1, 0, 0.654902, 1,
1.252878, 0.2551759, 1.651869, 1, 0, 0.6470588, 1,
1.255639, -0.1249585, 1.033988, 1, 0, 0.6431373, 1,
1.263934, -0.2445913, 2.241568, 1, 0, 0.6352941, 1,
1.276216, -1.314214, 3.785247, 1, 0, 0.6313726, 1,
1.277385, -1.76367, 2.991839, 1, 0, 0.6235294, 1,
1.278998, 1.154564, 1.484082, 1, 0, 0.6196079, 1,
1.287818, 0.1631678, 1.082623, 1, 0, 0.6117647, 1,
1.299986, 0.4020585, 2.136388, 1, 0, 0.6078432, 1,
1.307316, -0.5110301, 3.556205, 1, 0, 0.6, 1,
1.309428, 0.03530258, 0.8549016, 1, 0, 0.5921569, 1,
1.310987, -1.069243, 2.641971, 1, 0, 0.5882353, 1,
1.312465, 1.414295, -0.5210626, 1, 0, 0.5803922, 1,
1.321743, -0.2115937, 3.430711, 1, 0, 0.5764706, 1,
1.323601, -1.368147, 2.159743, 1, 0, 0.5686275, 1,
1.33428, -0.818729, 2.606001, 1, 0, 0.5647059, 1,
1.345101, -1.295717, 2.293542, 1, 0, 0.5568628, 1,
1.350175, -0.3555903, 2.691326, 1, 0, 0.5529412, 1,
1.352203, 0.7033295, 1.245681, 1, 0, 0.5450981, 1,
1.352539, 0.8611614, 1.476831, 1, 0, 0.5411765, 1,
1.367983, 0.5663747, 0.4433176, 1, 0, 0.5333334, 1,
1.375421, 0.4145775, 2.604438, 1, 0, 0.5294118, 1,
1.397991, -0.5275639, 3.035559, 1, 0, 0.5215687, 1,
1.39856, 1.037643, 0.6637853, 1, 0, 0.5176471, 1,
1.404424, -0.01912888, -0.345401, 1, 0, 0.509804, 1,
1.441418, 0.1490668, 2.120933, 1, 0, 0.5058824, 1,
1.444215, 0.04296008, 1.496493, 1, 0, 0.4980392, 1,
1.455117, 0.4703064, 0.4097455, 1, 0, 0.4901961, 1,
1.456486, -1.054604, 3.178857, 1, 0, 0.4862745, 1,
1.468163, -0.4587708, 1.274377, 1, 0, 0.4784314, 1,
1.476349, -0.4306418, 1.586097, 1, 0, 0.4745098, 1,
1.480965, 0.7813505, 3.62644, 1, 0, 0.4666667, 1,
1.489783, 0.1785673, 3.648426, 1, 0, 0.4627451, 1,
1.492544, -2.083086, 2.783098, 1, 0, 0.454902, 1,
1.511881, 1.132999, 0.9577017, 1, 0, 0.4509804, 1,
1.516107, -0.02077992, 1.184652, 1, 0, 0.4431373, 1,
1.521646, 0.4157151, 1.138329, 1, 0, 0.4392157, 1,
1.523494, -0.5674533, 1.496131, 1, 0, 0.4313726, 1,
1.52573, -1.129339, 2.721504, 1, 0, 0.427451, 1,
1.535602, 1.353668, 2.13506, 1, 0, 0.4196078, 1,
1.535789, 0.6968594, 1.115852, 1, 0, 0.4156863, 1,
1.549758, -1.033438, 1.799192, 1, 0, 0.4078431, 1,
1.556516, -0.3787611, 2.254059, 1, 0, 0.4039216, 1,
1.581872, 1.748486, 1.981806, 1, 0, 0.3960784, 1,
1.591099, -0.9214249, 1.701257, 1, 0, 0.3882353, 1,
1.609488, -0.6183074, 0.6875069, 1, 0, 0.3843137, 1,
1.6105, 0.4361098, 3.207592, 1, 0, 0.3764706, 1,
1.615375, -1.067782, 3.507283, 1, 0, 0.372549, 1,
1.644587, -0.7168397, 1.198527, 1, 0, 0.3647059, 1,
1.644897, 1.746186, 1.485518, 1, 0, 0.3607843, 1,
1.64872, 0.8005821, 0.7966532, 1, 0, 0.3529412, 1,
1.671386, 0.2098605, 1.833852, 1, 0, 0.3490196, 1,
1.672492, -1.222075, 1.378619, 1, 0, 0.3411765, 1,
1.672947, 0.6719704, 0.9567322, 1, 0, 0.3372549, 1,
1.686244, 0.03729505, 0.7994844, 1, 0, 0.3294118, 1,
1.688593, 0.2619786, 2.7289, 1, 0, 0.3254902, 1,
1.710317, -0.7754593, 1.676025, 1, 0, 0.3176471, 1,
1.714334, 1.850391, 0.7901154, 1, 0, 0.3137255, 1,
1.722257, 2.373053, -0.9277958, 1, 0, 0.3058824, 1,
1.723423, 0.1204761, 1.118929, 1, 0, 0.2980392, 1,
1.724625, 0.01366086, 1.655193, 1, 0, 0.2941177, 1,
1.72617, 0.3713333, 0.424256, 1, 0, 0.2862745, 1,
1.733001, 0.6360223, 2.22301, 1, 0, 0.282353, 1,
1.743363, -0.09968454, 1.692772, 1, 0, 0.2745098, 1,
1.745144, -2.730288, 3.599222, 1, 0, 0.2705882, 1,
1.755246, -0.1222625, 0.3233587, 1, 0, 0.2627451, 1,
1.772517, 0.3997041, -0.01598581, 1, 0, 0.2588235, 1,
1.79765, 1.175344, 0.1871033, 1, 0, 0.2509804, 1,
1.826818, -0.03513305, 0.08565965, 1, 0, 0.2470588, 1,
1.826925, -0.1254241, 1.35417, 1, 0, 0.2392157, 1,
1.830072, -0.945727, 1.375585, 1, 0, 0.2352941, 1,
1.842341, -0.8663625, 1.380124, 1, 0, 0.227451, 1,
1.851664, -1.170403, 2.290688, 1, 0, 0.2235294, 1,
1.865666, 1.132576, 0.7952353, 1, 0, 0.2156863, 1,
1.874923, 0.8777345, 0.1200005, 1, 0, 0.2117647, 1,
1.884305, 1.537862, 1.366465, 1, 0, 0.2039216, 1,
1.969239, -0.5293475, 0.5682779, 1, 0, 0.1960784, 1,
1.985837, -2.371511, 2.637601, 1, 0, 0.1921569, 1,
1.989226, 0.1183917, 3.331446, 1, 0, 0.1843137, 1,
1.995224, 0.08029766, 1.976223, 1, 0, 0.1803922, 1,
2.00232, 2.415584, 1.783795, 1, 0, 0.172549, 1,
2.008476, 1.8415, -0.1064146, 1, 0, 0.1686275, 1,
2.009572, -0.3244781, 1.240747, 1, 0, 0.1607843, 1,
2.045222, -0.4359876, 2.888733, 1, 0, 0.1568628, 1,
2.057512, 0.5793288, 0.8159369, 1, 0, 0.1490196, 1,
2.060687, -0.7581341, 2.215468, 1, 0, 0.145098, 1,
2.068404, -1.266107, 0.9114839, 1, 0, 0.1372549, 1,
2.073197, -0.9160752, 4.024782, 1, 0, 0.1333333, 1,
2.080883, -0.6677514, 2.061697, 1, 0, 0.1254902, 1,
2.094057, -0.2134367, 0.782544, 1, 0, 0.1215686, 1,
2.104227, 0.4297671, 2.006688, 1, 0, 0.1137255, 1,
2.216979, -0.2988601, 1.49426, 1, 0, 0.1098039, 1,
2.274463, -0.1392149, 0.8016508, 1, 0, 0.1019608, 1,
2.309139, -0.7633176, 4.235275, 1, 0, 0.09411765, 1,
2.326652, -0.3675003, 2.522714, 1, 0, 0.09019608, 1,
2.352133, -0.04039374, 1.002946, 1, 0, 0.08235294, 1,
2.36064, 0.440271, 1.223624, 1, 0, 0.07843138, 1,
2.361828, -0.6159865, 2.972539, 1, 0, 0.07058824, 1,
2.395453, 0.5823331, 0.9688803, 1, 0, 0.06666667, 1,
2.407584, 0.8100694, 0.7048023, 1, 0, 0.05882353, 1,
2.430635, -0.7257262, 1.782746, 1, 0, 0.05490196, 1,
2.466981, 0.8937836, -0.2481553, 1, 0, 0.04705882, 1,
2.719965, -0.6141662, 0.416641, 1, 0, 0.04313726, 1,
2.74429, -0.6680434, 1.653986, 1, 0, 0.03529412, 1,
2.753506, 0.3491277, 1.711331, 1, 0, 0.03137255, 1,
2.776416, 0.4542394, 0.8293614, 1, 0, 0.02352941, 1,
2.78295, 0.07005376, 1.202482, 1, 0, 0.01960784, 1,
2.861063, 0.02947877, 1.588453, 1, 0, 0.01176471, 1,
2.93065, 0.03376273, 0.4715599, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.0712713, -4.850065, -6.940294, 0, -0.5, 0.5, 0.5,
0.0712713, -4.850065, -6.940294, 1, -0.5, 0.5, 0.5,
0.0712713, -4.850065, -6.940294, 1, 1.5, 0.5, 0.5,
0.0712713, -4.850065, -6.940294, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.757437, -0.1105791, -6.940294, 0, -0.5, 0.5, 0.5,
-3.757437, -0.1105791, -6.940294, 1, -0.5, 0.5, 0.5,
-3.757437, -0.1105791, -6.940294, 1, 1.5, 0.5, 0.5,
-3.757437, -0.1105791, -6.940294, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.757437, -4.850065, 0.3185432, 0, -0.5, 0.5, 0.5,
-3.757437, -4.850065, 0.3185432, 1, -0.5, 0.5, 0.5,
-3.757437, -4.850065, 0.3185432, 1, 1.5, 0.5, 0.5,
-3.757437, -4.850065, 0.3185432, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.756338, -5.265177,
2, -3.756338, -5.265177,
-2, -3.756338, -5.265177,
-2, -3.938626, -5.544363,
-1, -3.756338, -5.265177,
-1, -3.938626, -5.544363,
0, -3.756338, -5.265177,
0, -3.938626, -5.544363,
1, -3.756338, -5.265177,
1, -3.938626, -5.544363,
2, -3.756338, -5.265177,
2, -3.938626, -5.544363
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -4.303202, -6.102736, 0, -0.5, 0.5, 0.5,
-2, -4.303202, -6.102736, 1, -0.5, 0.5, 0.5,
-2, -4.303202, -6.102736, 1, 1.5, 0.5, 0.5,
-2, -4.303202, -6.102736, 0, 1.5, 0.5, 0.5,
-1, -4.303202, -6.102736, 0, -0.5, 0.5, 0.5,
-1, -4.303202, -6.102736, 1, -0.5, 0.5, 0.5,
-1, -4.303202, -6.102736, 1, 1.5, 0.5, 0.5,
-1, -4.303202, -6.102736, 0, 1.5, 0.5, 0.5,
0, -4.303202, -6.102736, 0, -0.5, 0.5, 0.5,
0, -4.303202, -6.102736, 1, -0.5, 0.5, 0.5,
0, -4.303202, -6.102736, 1, 1.5, 0.5, 0.5,
0, -4.303202, -6.102736, 0, 1.5, 0.5, 0.5,
1, -4.303202, -6.102736, 0, -0.5, 0.5, 0.5,
1, -4.303202, -6.102736, 1, -0.5, 0.5, 0.5,
1, -4.303202, -6.102736, 1, 1.5, 0.5, 0.5,
1, -4.303202, -6.102736, 0, 1.5, 0.5, 0.5,
2, -4.303202, -6.102736, 0, -0.5, 0.5, 0.5,
2, -4.303202, -6.102736, 1, -0.5, 0.5, 0.5,
2, -4.303202, -6.102736, 1, 1.5, 0.5, 0.5,
2, -4.303202, -6.102736, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-2.873889, -2, -5.265177,
-2.873889, 2, -5.265177,
-2.873889, -2, -5.265177,
-3.021147, -2, -5.544363,
-2.873889, 0, -5.265177,
-3.021147, 0, -5.544363,
-2.873889, 2, -5.265177,
-3.021147, 2, -5.544363
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.315663, -2, -6.102736, 0, -0.5, 0.5, 0.5,
-3.315663, -2, -6.102736, 1, -0.5, 0.5, 0.5,
-3.315663, -2, -6.102736, 1, 1.5, 0.5, 0.5,
-3.315663, -2, -6.102736, 0, 1.5, 0.5, 0.5,
-3.315663, 0, -6.102736, 0, -0.5, 0.5, 0.5,
-3.315663, 0, -6.102736, 1, -0.5, 0.5, 0.5,
-3.315663, 0, -6.102736, 1, 1.5, 0.5, 0.5,
-3.315663, 0, -6.102736, 0, 1.5, 0.5, 0.5,
-3.315663, 2, -6.102736, 0, -0.5, 0.5, 0.5,
-3.315663, 2, -6.102736, 1, -0.5, 0.5, 0.5,
-3.315663, 2, -6.102736, 1, 1.5, 0.5, 0.5,
-3.315663, 2, -6.102736, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-2.873889, -3.756338, -4,
-2.873889, -3.756338, 4,
-2.873889, -3.756338, -4,
-3.021147, -3.938626, -4,
-2.873889, -3.756338, -2,
-3.021147, -3.938626, -2,
-2.873889, -3.756338, 0,
-3.021147, -3.938626, 0,
-2.873889, -3.756338, 2,
-3.021147, -3.938626, 2,
-2.873889, -3.756338, 4,
-3.021147, -3.938626, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.315663, -4.303202, -4, 0, -0.5, 0.5, 0.5,
-3.315663, -4.303202, -4, 1, -0.5, 0.5, 0.5,
-3.315663, -4.303202, -4, 1, 1.5, 0.5, 0.5,
-3.315663, -4.303202, -4, 0, 1.5, 0.5, 0.5,
-3.315663, -4.303202, -2, 0, -0.5, 0.5, 0.5,
-3.315663, -4.303202, -2, 1, -0.5, 0.5, 0.5,
-3.315663, -4.303202, -2, 1, 1.5, 0.5, 0.5,
-3.315663, -4.303202, -2, 0, 1.5, 0.5, 0.5,
-3.315663, -4.303202, 0, 0, -0.5, 0.5, 0.5,
-3.315663, -4.303202, 0, 1, -0.5, 0.5, 0.5,
-3.315663, -4.303202, 0, 1, 1.5, 0.5, 0.5,
-3.315663, -4.303202, 0, 0, 1.5, 0.5, 0.5,
-3.315663, -4.303202, 2, 0, -0.5, 0.5, 0.5,
-3.315663, -4.303202, 2, 1, -0.5, 0.5, 0.5,
-3.315663, -4.303202, 2, 1, 1.5, 0.5, 0.5,
-3.315663, -4.303202, 2, 0, 1.5, 0.5, 0.5,
-3.315663, -4.303202, 4, 0, -0.5, 0.5, 0.5,
-3.315663, -4.303202, 4, 1, -0.5, 0.5, 0.5,
-3.315663, -4.303202, 4, 1, 1.5, 0.5, 0.5,
-3.315663, -4.303202, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-2.873889, -3.756338, -5.265177,
-2.873889, 3.535179, -5.265177,
-2.873889, -3.756338, 5.902264,
-2.873889, 3.535179, 5.902264,
-2.873889, -3.756338, -5.265177,
-2.873889, -3.756338, 5.902264,
-2.873889, 3.535179, -5.265177,
-2.873889, 3.535179, 5.902264,
-2.873889, -3.756338, -5.265177,
3.016431, -3.756338, -5.265177,
-2.873889, -3.756338, 5.902264,
3.016431, -3.756338, 5.902264,
-2.873889, 3.535179, -5.265177,
3.016431, 3.535179, -5.265177,
-2.873889, 3.535179, 5.902264,
3.016431, 3.535179, 5.902264,
3.016431, -3.756338, -5.265177,
3.016431, 3.535179, -5.265177,
3.016431, -3.756338, 5.902264,
3.016431, 3.535179, 5.902264,
3.016431, -3.756338, -5.265177,
3.016431, -3.756338, 5.902264,
3.016431, 3.535179, -5.265177,
3.016431, 3.535179, 5.902264
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.78539;
var distance = 34.63808;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.0712713, 0.1105791, -0.3185432 );
mvMatrix.scale( 1.429076, 1.154453, 0.753773 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63808);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 8);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
thiophosphoric_acid<-read.table("thiophosphoric_acid.xyz")
```

```
## Error in read.table("thiophosphoric_acid.xyz"): no lines available in input
```

```r
x<-thiophosphoric_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiophosphoric_acid' not found
```

```r
y<-thiophosphoric_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiophosphoric_acid' not found
```

```r
z<-thiophosphoric_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiophosphoric_acid' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.788107, -0.6705635, -1.459888, 0, 0, 1, 1, 1,
-2.723934, 1.25368, -0.1670937, 1, 0, 0, 1, 1,
-2.651977, -1.332978, -2.541748, 1, 0, 0, 1, 1,
-2.436702, -0.9288379, -0.6171692, 1, 0, 0, 1, 1,
-2.429798, -1.150025, -2.824434, 1, 0, 0, 1, 1,
-2.386781, 1.118944, 0.03273251, 1, 0, 0, 1, 1,
-2.322985, -1.623206, -0.9959974, 0, 0, 0, 1, 1,
-2.279141, -0.6910828, -1.179799, 0, 0, 0, 1, 1,
-2.263876, 0.2042995, -2.221468, 0, 0, 0, 1, 1,
-2.26015, 0.2656173, -0.9013123, 0, 0, 0, 1, 1,
-2.252355, -1.190184, -1.299379, 0, 0, 0, 1, 1,
-2.222268, 1.042739, -1.957773, 0, 0, 0, 1, 1,
-2.21894, 1.240397, -0.3681147, 0, 0, 0, 1, 1,
-2.213117, -1.655206, -1.725858, 1, 1, 1, 1, 1,
-2.211384, -1.876832, -1.502646, 1, 1, 1, 1, 1,
-2.199745, 1.792638, -2.429913, 1, 1, 1, 1, 1,
-2.137525, -1.546649, -3.047941, 1, 1, 1, 1, 1,
-2.136456, 1.069285, 1.000282, 1, 1, 1, 1, 1,
-2.101399, 0.3875628, -1.503351, 1, 1, 1, 1, 1,
-2.078011, -1.532434, -3.553336, 1, 1, 1, 1, 1,
-2.072857, -0.05269258, -1.858222, 1, 1, 1, 1, 1,
-2.024786, 0.07950005, -1.09735, 1, 1, 1, 1, 1,
-2.017992, -1.314298, -0.960759, 1, 1, 1, 1, 1,
-2.010243, -1.378461, -4.105306, 1, 1, 1, 1, 1,
-1.994625, 0.904146, -0.8179724, 1, 1, 1, 1, 1,
-1.94044, -0.8954747, -2.829514, 1, 1, 1, 1, 1,
-1.934552, -0.7890002, -1.46296, 1, 1, 1, 1, 1,
-1.929778, 1.333454, -0.7860448, 1, 1, 1, 1, 1,
-1.907571, -0.5453556, -3.099564, 0, 0, 1, 1, 1,
-1.890182, 2.156583, -1.965511, 1, 0, 0, 1, 1,
-1.862381, 1.869538, 0.7631507, 1, 0, 0, 1, 1,
-1.857214, -0.3644066, -2.09614, 1, 0, 0, 1, 1,
-1.802024, 1.459597, -0.4416746, 1, 0, 0, 1, 1,
-1.794064, 0.3546219, -0.02663507, 1, 0, 0, 1, 1,
-1.777472, -0.789106, -3.005719, 0, 0, 0, 1, 1,
-1.770387, -2.262905, -3.068392, 0, 0, 0, 1, 1,
-1.76544, -0.6359217, -0.9811899, 0, 0, 0, 1, 1,
-1.730565, 0.3382731, -1.663013, 0, 0, 0, 1, 1,
-1.727249, 0.1119653, -2.347852, 0, 0, 0, 1, 1,
-1.726728, 0.9743334, -2.434144, 0, 0, 0, 1, 1,
-1.72574, 0.6916094, -0.7426285, 0, 0, 0, 1, 1,
-1.724401, -0.2770742, -0.4271551, 1, 1, 1, 1, 1,
-1.684031, 1.055668, -0.477465, 1, 1, 1, 1, 1,
-1.656492, -1.520412, -2.803408, 1, 1, 1, 1, 1,
-1.650463, -0.8532672, -4.249069, 1, 1, 1, 1, 1,
-1.63361, -0.1086256, -1.595639, 1, 1, 1, 1, 1,
-1.628897, 0.4660152, -0.8623972, 1, 1, 1, 1, 1,
-1.623664, 1.734635, -1.375399, 1, 1, 1, 1, 1,
-1.619992, -0.1952128, -2.988534, 1, 1, 1, 1, 1,
-1.617361, 1.369823, -1.404125, 1, 1, 1, 1, 1,
-1.591289, -0.6113613, -0.1829421, 1, 1, 1, 1, 1,
-1.590713, -0.8160419, -0.09676509, 1, 1, 1, 1, 1,
-1.584541, -0.1914613, -2.113558, 1, 1, 1, 1, 1,
-1.583666, 1.016905, 0.9568832, 1, 1, 1, 1, 1,
-1.580423, 1.793984, -0.4018412, 1, 1, 1, 1, 1,
-1.546711, -0.1399325, -2.014852, 1, 1, 1, 1, 1,
-1.542923, -1.959989, -1.271503, 0, 0, 1, 1, 1,
-1.531202, -0.6111168, -2.035509, 1, 0, 0, 1, 1,
-1.510335, -0.5273134, -1.26928, 1, 0, 0, 1, 1,
-1.495211, -0.230598, -0.9533206, 1, 0, 0, 1, 1,
-1.485955, -1.255063, -1.717628, 1, 0, 0, 1, 1,
-1.473746, 0.2760428, -0.3450144, 1, 0, 0, 1, 1,
-1.457408, 0.1189235, -2.133099, 0, 0, 0, 1, 1,
-1.449892, 0.3032463, -0.8635662, 0, 0, 0, 1, 1,
-1.426932, -0.8225896, 0.129387, 0, 0, 0, 1, 1,
-1.413743, -1.884141, -2.578293, 0, 0, 0, 1, 1,
-1.400425, 0.0961954, -1.499127, 0, 0, 0, 1, 1,
-1.393147, 0.6194126, 0.2673214, 0, 0, 0, 1, 1,
-1.390964, -1.294959, -4.116688, 0, 0, 0, 1, 1,
-1.387263, -0.3621249, -2.494822, 1, 1, 1, 1, 1,
-1.386647, -0.9969982, -4.042299, 1, 1, 1, 1, 1,
-1.380482, -0.7907246, -2.421244, 1, 1, 1, 1, 1,
-1.380474, 0.1585223, -0.7984886, 1, 1, 1, 1, 1,
-1.377753, 0.692764, 0.5213569, 1, 1, 1, 1, 1,
-1.367909, -0.5275337, -2.212064, 1, 1, 1, 1, 1,
-1.366797, -0.1663936, -3.072803, 1, 1, 1, 1, 1,
-1.33295, 0.2250241, -1.659853, 1, 1, 1, 1, 1,
-1.324612, 0.004590921, -2.791885, 1, 1, 1, 1, 1,
-1.322133, 0.1570676, -2.2589, 1, 1, 1, 1, 1,
-1.318106, 0.5662868, -0.4366985, 1, 1, 1, 1, 1,
-1.304534, 1.376178, -0.5780672, 1, 1, 1, 1, 1,
-1.299896, -1.654763, -3.082556, 1, 1, 1, 1, 1,
-1.298889, -0.1834602, -2.512902, 1, 1, 1, 1, 1,
-1.298571, -0.3907492, -0.8888467, 1, 1, 1, 1, 1,
-1.285943, 0.09864653, -1.582584, 0, 0, 1, 1, 1,
-1.281519, 0.3734862, -2.087872, 1, 0, 0, 1, 1,
-1.256199, -1.113751, -2.747792, 1, 0, 0, 1, 1,
-1.255733, 0.07030739, -2.367597, 1, 0, 0, 1, 1,
-1.248285, 0.4991079, -0.5752867, 1, 0, 0, 1, 1,
-1.245002, 0.3239137, -1.505823, 1, 0, 0, 1, 1,
-1.243579, 0.3239785, 0.5363349, 0, 0, 0, 1, 1,
-1.237196, 1.01326, -1.912728, 0, 0, 0, 1, 1,
-1.236497, 2.425378, -0.6575423, 0, 0, 0, 1, 1,
-1.235255, 1.523591, -1.437556, 0, 0, 0, 1, 1,
-1.223806, 0.09113116, -2.218588, 0, 0, 0, 1, 1,
-1.222787, 0.46164, -3.585118, 0, 0, 0, 1, 1,
-1.21689, -1.04954, -2.747077, 0, 0, 0, 1, 1,
-1.215633, 0.8923764, -0.5232638, 1, 1, 1, 1, 1,
-1.214103, -0.9648668, -0.9067869, 1, 1, 1, 1, 1,
-1.209626, -0.6110618, -0.8047466, 1, 1, 1, 1, 1,
-1.209536, 1.384192, 0.5050969, 1, 1, 1, 1, 1,
-1.204476, -0.8447354, -2.662314, 1, 1, 1, 1, 1,
-1.198634, -0.9665215, -2.854393, 1, 1, 1, 1, 1,
-1.195072, 1.523633, -1.825201, 1, 1, 1, 1, 1,
-1.19297, -1.78491, -1.392648, 1, 1, 1, 1, 1,
-1.180774, -0.7007532, -2.926667, 1, 1, 1, 1, 1,
-1.175739, -1.113904, -2.021518, 1, 1, 1, 1, 1,
-1.171343, 1.24658, -0.7137507, 1, 1, 1, 1, 1,
-1.171302, 0.324679, -0.7722098, 1, 1, 1, 1, 1,
-1.166346, -0.9360649, -1.01521, 1, 1, 1, 1, 1,
-1.159134, 0.8964391, -1.107555, 1, 1, 1, 1, 1,
-1.150321, 0.5368744, 0.06324632, 1, 1, 1, 1, 1,
-1.148235, 1.392068, -1.241216, 0, 0, 1, 1, 1,
-1.144992, 2.04618, 2.016778, 1, 0, 0, 1, 1,
-1.139704, 3.428992, -1.825256, 1, 0, 0, 1, 1,
-1.119861, 0.9449978, -0.5104718, 1, 0, 0, 1, 1,
-1.115374, 0.1320468, -1.848845, 1, 0, 0, 1, 1,
-1.110258, -0.816552, -2.517816, 1, 0, 0, 1, 1,
-1.107142, 0.6884547, -0.1529482, 0, 0, 0, 1, 1,
-1.1045, -0.5313188, -1.890578, 0, 0, 0, 1, 1,
-1.103406, -0.2495392, -1.98569, 0, 0, 0, 1, 1,
-1.101721, 1.739574, -0.957352, 0, 0, 0, 1, 1,
-1.093268, 1.035204, -2.127978, 0, 0, 0, 1, 1,
-1.090431, -0.40776, -3.187577, 0, 0, 0, 1, 1,
-1.08928, 0.2742068, -0.6900538, 0, 0, 0, 1, 1,
-1.088333, -0.7365782, -2.305052, 1, 1, 1, 1, 1,
-1.084636, -1.284584, -3.49219, 1, 1, 1, 1, 1,
-1.075799, -2.239328, -3.829123, 1, 1, 1, 1, 1,
-1.07485, -0.6561728, -1.96001, 1, 1, 1, 1, 1,
-1.067201, -0.756653, -3.111894, 1, 1, 1, 1, 1,
-1.066879, -0.8022996, -1.442366, 1, 1, 1, 1, 1,
-1.06509, 0.7149258, -1.380398, 1, 1, 1, 1, 1,
-1.061452, -1.065412, -2.132388, 1, 1, 1, 1, 1,
-1.058212, 0.2676955, -2.432035, 1, 1, 1, 1, 1,
-1.055255, -1.841458, -2.565789, 1, 1, 1, 1, 1,
-1.052325, -0.09116803, -2.745772, 1, 1, 1, 1, 1,
-1.050882, -1.203324, -3.692451, 1, 1, 1, 1, 1,
-1.046931, -0.05925308, -0.4745536, 1, 1, 1, 1, 1,
-1.04368, -0.1698059, -2.484275, 1, 1, 1, 1, 1,
-1.041523, 0.5045757, -1.179693, 1, 1, 1, 1, 1,
-1.02964, 1.165237, -1.194515, 0, 0, 1, 1, 1,
-1.028904, -0.2943341, -2.329529, 1, 0, 0, 1, 1,
-1.027777, -0.5560226, -2.526659, 1, 0, 0, 1, 1,
-1.024473, -2.189951, -2.628459, 1, 0, 0, 1, 1,
-1.024, -0.2272028, -0.09395487, 1, 0, 0, 1, 1,
-1.023999, 1.063156, -1.557045, 1, 0, 0, 1, 1,
-1.019003, -0.6841729, -1.795432, 0, 0, 0, 1, 1,
-1.018376, 0.2616625, 0.1697461, 0, 0, 0, 1, 1,
-1.01504, 1.771196, -0.3517677, 0, 0, 0, 1, 1,
-1.013409, -0.7731909, -2.908515, 0, 0, 0, 1, 1,
-1.013062, 0.2348969, -2.300797, 0, 0, 0, 1, 1,
-1.007077, -1.911263, -4.716084, 0, 0, 0, 1, 1,
-0.991749, 1.343042, -0.1314527, 0, 0, 0, 1, 1,
-0.9906108, 0.3542162, -0.1665658, 1, 1, 1, 1, 1,
-0.9836682, 0.5985914, -2.506272, 1, 1, 1, 1, 1,
-0.9806017, 1.759717, -0.6549152, 1, 1, 1, 1, 1,
-0.979773, -0.9862746, -2.332147, 1, 1, 1, 1, 1,
-0.9667953, -1.115723, -1.35957, 1, 1, 1, 1, 1,
-0.9646752, -1.342674, -1.749119, 1, 1, 1, 1, 1,
-0.9599172, -0.2546637, -1.753687, 1, 1, 1, 1, 1,
-0.9529808, -0.352581, -1.522207, 1, 1, 1, 1, 1,
-0.9484906, 0.6291356, 0.4503542, 1, 1, 1, 1, 1,
-0.9456467, 0.5583435, -2.416615, 1, 1, 1, 1, 1,
-0.9436523, 0.1595502, -3.482388, 1, 1, 1, 1, 1,
-0.9395055, -0.9693384, -2.509767, 1, 1, 1, 1, 1,
-0.9370243, 0.5807496, -0.9228961, 1, 1, 1, 1, 1,
-0.91254, -0.5296274, -2.327018, 1, 1, 1, 1, 1,
-0.9105228, -1.027618, -1.465481, 1, 1, 1, 1, 1,
-0.910192, -0.3296108, -1.633598, 0, 0, 1, 1, 1,
-0.9089676, 0.4081927, -1.289003, 1, 0, 0, 1, 1,
-0.9014382, -0.911595, -2.333123, 1, 0, 0, 1, 1,
-0.9009689, 1.193659, 0.197581, 1, 0, 0, 1, 1,
-0.8998615, -1.983127, -0.1745063, 1, 0, 0, 1, 1,
-0.8971744, -1.70339, -0.9625316, 1, 0, 0, 1, 1,
-0.8965087, -0.4587317, -0.9978462, 0, 0, 0, 1, 1,
-0.895313, 0.8088065, -1.463604, 0, 0, 0, 1, 1,
-0.892188, 0.008852137, 0.4369761, 0, 0, 0, 1, 1,
-0.8905677, 2.133139, -0.5579129, 0, 0, 0, 1, 1,
-0.8885632, 0.4533469, 0.4220372, 0, 0, 0, 1, 1,
-0.8833169, -0.1618595, -1.349122, 0, 0, 0, 1, 1,
-0.8816465, -0.2752011, -2.082254, 0, 0, 0, 1, 1,
-0.8815612, -0.08112387, -1.735187, 1, 1, 1, 1, 1,
-0.877673, 0.2865953, -0.6830857, 1, 1, 1, 1, 1,
-0.874745, -0.8960962, -1.888732, 1, 1, 1, 1, 1,
-0.8737893, 0.6944278, -0.8597841, 1, 1, 1, 1, 1,
-0.8652965, -0.1090613, -1.348214, 1, 1, 1, 1, 1,
-0.8599331, 0.007672283, -1.711676, 1, 1, 1, 1, 1,
-0.8533429, -1.668601, -0.7897655, 1, 1, 1, 1, 1,
-0.8530826, 2.008711, -0.6403832, 1, 1, 1, 1, 1,
-0.8529038, 0.4440498, -1.182056, 1, 1, 1, 1, 1,
-0.8365537, -1.301769, -1.235676, 1, 1, 1, 1, 1,
-0.8349717, -1.274388, -3.687206, 1, 1, 1, 1, 1,
-0.8243419, -0.63661, -1.32035, 1, 1, 1, 1, 1,
-0.8210588, -0.1809926, -2.579869, 1, 1, 1, 1, 1,
-0.8209012, -0.1698011, -0.996542, 1, 1, 1, 1, 1,
-0.8156881, -0.4440254, -1.318723, 1, 1, 1, 1, 1,
-0.8154612, 0.770842, -1.69141, 0, 0, 1, 1, 1,
-0.8145111, 0.177002, -1.145291, 1, 0, 0, 1, 1,
-0.8135678, 0.6818528, -0.8456098, 1, 0, 0, 1, 1,
-0.8129581, 0.9796715, -0.9545038, 1, 0, 0, 1, 1,
-0.8116519, -1.646681, -4.130627, 1, 0, 0, 1, 1,
-0.802013, 0.7940484, 1.313299, 1, 0, 0, 1, 1,
-0.7967318, -0.1752929, -2.441288, 0, 0, 0, 1, 1,
-0.7933634, -0.2863972, -1.518653, 0, 0, 0, 1, 1,
-0.7914176, 1.278271, -1.139407, 0, 0, 0, 1, 1,
-0.7908787, -0.6965534, 0.211447, 0, 0, 0, 1, 1,
-0.7901817, 0.3289365, -2.668522, 0, 0, 0, 1, 1,
-0.7826051, -0.5841041, -2.296975, 0, 0, 0, 1, 1,
-0.7743471, 0.1081847, -0.8504596, 0, 0, 0, 1, 1,
-0.7698345, 0.7308506, -2.486068, 1, 1, 1, 1, 1,
-0.7684469, 1.288981, -1.484909, 1, 1, 1, 1, 1,
-0.7668881, 0.4043846, -1.508743, 1, 1, 1, 1, 1,
-0.7585979, -1.829679, -2.320084, 1, 1, 1, 1, 1,
-0.7464796, -1.126133, -1.3946, 1, 1, 1, 1, 1,
-0.7396209, -0.2409739, 0.4685381, 1, 1, 1, 1, 1,
-0.737636, -0.3603293, -2.41294, 1, 1, 1, 1, 1,
-0.7373756, -1.06835, -4.015319, 1, 1, 1, 1, 1,
-0.7332197, -1.780016, -3.102505, 1, 1, 1, 1, 1,
-0.7320791, 1.581414, -0.7817485, 1, 1, 1, 1, 1,
-0.7308646, 1.148873, -1.520789, 1, 1, 1, 1, 1,
-0.7293337, 1.642988, -0.7727982, 1, 1, 1, 1, 1,
-0.720281, 1.681674, -1.676138, 1, 1, 1, 1, 1,
-0.7193556, 0.1814785, -2.352676, 1, 1, 1, 1, 1,
-0.7177463, 1.54677, 0.05762185, 1, 1, 1, 1, 1,
-0.7141861, -0.4704555, -2.010263, 0, 0, 1, 1, 1,
-0.7124958, 0.5775728, -0.1983789, 1, 0, 0, 1, 1,
-0.7105611, -0.6016181, -3.502097, 1, 0, 0, 1, 1,
-0.7090887, -2.25725, -2.251912, 1, 0, 0, 1, 1,
-0.7073267, -0.2976479, -2.775019, 1, 0, 0, 1, 1,
-0.7041978, -0.3323987, -2.765409, 1, 0, 0, 1, 1,
-0.7028477, 0.5354821, -2.996309, 0, 0, 0, 1, 1,
-0.6999027, 2.366029, 0.8588964, 0, 0, 0, 1, 1,
-0.6996995, -1.664397, -2.216405, 0, 0, 0, 1, 1,
-0.6995269, -0.3188314, -3.043821, 0, 0, 0, 1, 1,
-0.6949831, -1.210683, -2.263651, 0, 0, 0, 1, 1,
-0.690769, 1.028968, 1.9111, 0, 0, 0, 1, 1,
-0.6860414, 0.5242031, -1.955326, 0, 0, 0, 1, 1,
-0.6803493, -0.386166, -0.1461015, 1, 1, 1, 1, 1,
-0.6786551, 1.805569, -0.2715122, 1, 1, 1, 1, 1,
-0.6707404, 1.168493, -1.027134, 1, 1, 1, 1, 1,
-0.6672991, 1.122371, 0.03470692, 1, 1, 1, 1, 1,
-0.6637663, 0.3657713, -0.6792233, 1, 1, 1, 1, 1,
-0.6633087, 0.5622329, -0.0182723, 1, 1, 1, 1, 1,
-0.6623021, -0.9099175, -0.7449099, 1, 1, 1, 1, 1,
-0.6561925, -1.489364, -2.513057, 1, 1, 1, 1, 1,
-0.6547781, 0.222224, -2.768249, 1, 1, 1, 1, 1,
-0.6545464, 1.494694, -1.799127, 1, 1, 1, 1, 1,
-0.6543652, 1.645185, -0.4917725, 1, 1, 1, 1, 1,
-0.6513871, -0.7625978, -1.410645, 1, 1, 1, 1, 1,
-0.65105, 0.3710644, 0.06491039, 1, 1, 1, 1, 1,
-0.6488913, -0.8658456, -3.122067, 1, 1, 1, 1, 1,
-0.6477811, 0.6558149, -1.098096, 1, 1, 1, 1, 1,
-0.6427105, -1.054394, -2.717037, 0, 0, 1, 1, 1,
-0.6379133, 0.3527142, -2.015599, 1, 0, 0, 1, 1,
-0.6260765, -0.7233822, -0.7740223, 1, 0, 0, 1, 1,
-0.6177982, -1.306727, -3.531781, 1, 0, 0, 1, 1,
-0.6153567, 0.8855854, -1.157039, 1, 0, 0, 1, 1,
-0.6127625, -1.788232, -2.984189, 1, 0, 0, 1, 1,
-0.6116162, 0.6202874, -1.436768, 0, 0, 0, 1, 1,
-0.6087561, -0.2982229, -2.485706, 0, 0, 0, 1, 1,
-0.6067609, -0.9329426, -3.415629, 0, 0, 0, 1, 1,
-0.606561, 1.262172, -0.008799164, 0, 0, 0, 1, 1,
-0.6054906, 0.5623989, -2.408085, 0, 0, 0, 1, 1,
-0.6027519, -2.06876, -3.399894, 0, 0, 0, 1, 1,
-0.6015823, 0.9729257, 0.209424, 0, 0, 0, 1, 1,
-0.6013387, -1.611536, -3.142126, 1, 1, 1, 1, 1,
-0.5987277, 0.3913694, 0.4696018, 1, 1, 1, 1, 1,
-0.5937948, 0.1562563, -2.272475, 1, 1, 1, 1, 1,
-0.5913835, 0.8528313, -1.32263, 1, 1, 1, 1, 1,
-0.5875962, 0.4790641, -1.942773, 1, 1, 1, 1, 1,
-0.5851464, 0.2652121, -2.085079, 1, 1, 1, 1, 1,
-0.5850671, -0.9695075, -1.753395, 1, 1, 1, 1, 1,
-0.5776265, -1.585462, -3.868786, 1, 1, 1, 1, 1,
-0.5760387, 0.1580349, 0.3039406, 1, 1, 1, 1, 1,
-0.569371, 1.350623, -0.1132457, 1, 1, 1, 1, 1,
-0.5692384, -0.3181972, -0.5472448, 1, 1, 1, 1, 1,
-0.5689155, -1.449572, -1.724553, 1, 1, 1, 1, 1,
-0.5626845, -1.626547, -3.309733, 1, 1, 1, 1, 1,
-0.5613751, -0.01461943, -2.730264, 1, 1, 1, 1, 1,
-0.5573704, 1.160595, 0.01881159, 1, 1, 1, 1, 1,
-0.5543272, -0.8368327, -4.008824, 0, 0, 1, 1, 1,
-0.5468245, -1.170707, -2.749412, 1, 0, 0, 1, 1,
-0.5466064, -0.7305853, -3.102103, 1, 0, 0, 1, 1,
-0.5397534, 1.609601, -0.4310436, 1, 0, 0, 1, 1,
-0.539047, -0.5116441, -1.212548, 1, 0, 0, 1, 1,
-0.5359588, -0.7329083, -3.061281, 1, 0, 0, 1, 1,
-0.5346175, -0.02261417, -2.674835, 0, 0, 0, 1, 1,
-0.5321789, 1.852298, 1.727937, 0, 0, 0, 1, 1,
-0.5264334, 0.2737666, -0.6510602, 0, 0, 0, 1, 1,
-0.5233474, -0.1346683, -1.630891, 0, 0, 0, 1, 1,
-0.5210976, -0.982506, -3.78481, 0, 0, 0, 1, 1,
-0.5190449, -2.071221, -2.914526, 0, 0, 0, 1, 1,
-0.5166795, -2.024422, -3.289312, 0, 0, 0, 1, 1,
-0.5155525, -0.6941267, -2.764848, 1, 1, 1, 1, 1,
-0.5122128, 0.3226651, -0.1876723, 1, 1, 1, 1, 1,
-0.5111212, -0.6485627, -4.197341, 1, 1, 1, 1, 1,
-0.5089707, 0.6455587, -1.931202, 1, 1, 1, 1, 1,
-0.5046768, -0.7541103, -3.064018, 1, 1, 1, 1, 1,
-0.5044232, -1.915781, -2.394783, 1, 1, 1, 1, 1,
-0.5042306, -1.417034, -3.358595, 1, 1, 1, 1, 1,
-0.4993986, 1.06776, -1.642862, 1, 1, 1, 1, 1,
-0.4993783, 1.888167, -0.5925649, 1, 1, 1, 1, 1,
-0.4868882, -0.2955177, -1.476185, 1, 1, 1, 1, 1,
-0.4792987, -0.3307188, -2.769334, 1, 1, 1, 1, 1,
-0.4790049, -2.155936, -1.600044, 1, 1, 1, 1, 1,
-0.4786188, 0.6701189, 1.06462, 1, 1, 1, 1, 1,
-0.4781157, -0.3446438, -2.188878, 1, 1, 1, 1, 1,
-0.4773188, -0.8847651, -3.339131, 1, 1, 1, 1, 1,
-0.4765141, -0.07597449, 0.1443704, 0, 0, 1, 1, 1,
-0.475746, -0.3954165, -2.246531, 1, 0, 0, 1, 1,
-0.4748937, 0.1105229, -0.3986717, 1, 0, 0, 1, 1,
-0.4728728, 1.003507, -1.793148, 1, 0, 0, 1, 1,
-0.4697838, 1.066898, 0.7838298, 1, 0, 0, 1, 1,
-0.4623464, 1.557213, 0.2889506, 1, 0, 0, 1, 1,
-0.4606072, -1.072518, -1.764293, 0, 0, 0, 1, 1,
-0.4573074, 0.8096396, -2.131133, 0, 0, 0, 1, 1,
-0.4564194, 2.079468, -0.339102, 0, 0, 0, 1, 1,
-0.4536936, 0.8599283, -0.4502197, 0, 0, 0, 1, 1,
-0.4532688, -1.539292, -2.736474, 0, 0, 0, 1, 1,
-0.4491458, 0.1012201, -1.266233, 0, 0, 0, 1, 1,
-0.4471846, 0.3531916, -2.832348, 0, 0, 0, 1, 1,
-0.4466595, -0.2920203, -2.837174, 1, 1, 1, 1, 1,
-0.4421743, 1.916019, -1.958038, 1, 1, 1, 1, 1,
-0.4415812, -0.1347625, -1.066016, 1, 1, 1, 1, 1,
-0.4413774, -0.2370839, -2.106633, 1, 1, 1, 1, 1,
-0.441374, 0.2724764, -2.782484, 1, 1, 1, 1, 1,
-0.4362274, 1.662132, 0.6150929, 1, 1, 1, 1, 1,
-0.4345671, -1.046781, -3.266784, 1, 1, 1, 1, 1,
-0.4344029, -1.655692, -1.281361, 1, 1, 1, 1, 1,
-0.4340956, -1.465066, -2.317028, 1, 1, 1, 1, 1,
-0.4317338, 0.573473, -1.084276, 1, 1, 1, 1, 1,
-0.4258592, 0.2262796, -1.820817, 1, 1, 1, 1, 1,
-0.4254, -1.215363, -3.030739, 1, 1, 1, 1, 1,
-0.4183371, -0.7962919, -3.997904, 1, 1, 1, 1, 1,
-0.4115674, 0.0220882, -0.1546197, 1, 1, 1, 1, 1,
-0.4106416, 1.684689, 0.116178, 1, 1, 1, 1, 1,
-0.404579, 0.4167402, -1.100583, 0, 0, 1, 1, 1,
-0.3968543, -1.263229, -1.035219, 1, 0, 0, 1, 1,
-0.3950533, 0.1215496, -1.302616, 1, 0, 0, 1, 1,
-0.3940883, 1.744376, -0.3245724, 1, 0, 0, 1, 1,
-0.3926064, -0.1829139, -2.184108, 1, 0, 0, 1, 1,
-0.3915864, -0.1263099, -1.608925, 1, 0, 0, 1, 1,
-0.3848051, -1.347298, -0.6438339, 0, 0, 0, 1, 1,
-0.3819624, 0.2162914, -1.096561, 0, 0, 0, 1, 1,
-0.3794442, -0.1110345, -1.340587, 0, 0, 0, 1, 1,
-0.3790403, 0.6886353, -1.272116, 0, 0, 0, 1, 1,
-0.3782878, 0.5776306, -0.3587923, 0, 0, 0, 1, 1,
-0.377127, -1.165455, -4.383023, 0, 0, 0, 1, 1,
-0.3765289, -0.4007695, -3.862581, 0, 0, 0, 1, 1,
-0.3760045, -0.6219602, -2.274248, 1, 1, 1, 1, 1,
-0.3581818, 0.857182, -1.482491, 1, 1, 1, 1, 1,
-0.3575419, -0.7029338, -4.237762, 1, 1, 1, 1, 1,
-0.3501688, -0.2108012, -2.512367, 1, 1, 1, 1, 1,
-0.3456372, -0.07976773, -0.4471567, 1, 1, 1, 1, 1,
-0.3438194, 0.1833752, -1.957116, 1, 1, 1, 1, 1,
-0.3436411, -1.510242, -1.879448, 1, 1, 1, 1, 1,
-0.3393803, -0.136866, -2.975752, 1, 1, 1, 1, 1,
-0.3359139, 0.1509365, -1.110199, 1, 1, 1, 1, 1,
-0.3312641, -0.2983228, -1.755475, 1, 1, 1, 1, 1,
-0.3298802, 0.3984808, 0.3833409, 1, 1, 1, 1, 1,
-0.3289619, 1.031896, 1.490808, 1, 1, 1, 1, 1,
-0.3289362, -1.071224, -3.383603, 1, 1, 1, 1, 1,
-0.3269945, 0.8750106, -0.05871729, 1, 1, 1, 1, 1,
-0.32577, 0.124554, -0.9885753, 1, 1, 1, 1, 1,
-0.3248781, -1.391143, -3.128141, 0, 0, 1, 1, 1,
-0.3220632, -1.148342, -2.655108, 1, 0, 0, 1, 1,
-0.3218286, 1.960981, 0.1633932, 1, 0, 0, 1, 1,
-0.3204182, -0.7337714, -3.430229, 1, 0, 0, 1, 1,
-0.3163478, -1.779712, -3.716262, 1, 0, 0, 1, 1,
-0.3136727, -0.2415092, -2.66216, 1, 0, 0, 1, 1,
-0.3125798, -0.5360951, -1.792565, 0, 0, 0, 1, 1,
-0.3061884, -0.5817077, -4.997693, 0, 0, 0, 1, 1,
-0.2952122, -1.833688, -4.354287, 0, 0, 0, 1, 1,
-0.2930014, -0.2581593, -3.62051, 0, 0, 0, 1, 1,
-0.287738, -1.155554, -3.667377, 0, 0, 0, 1, 1,
-0.2876107, -0.07096002, -0.8070307, 0, 0, 0, 1, 1,
-0.2873179, -0.2527751, -3.059214, 0, 0, 0, 1, 1,
-0.2868245, -0.5290272, -2.221284, 1, 1, 1, 1, 1,
-0.2853877, -1.068122, -3.030788, 1, 1, 1, 1, 1,
-0.2816031, -1.412612, -4.221307, 1, 1, 1, 1, 1,
-0.2766315, -0.3735783, -1.784997, 1, 1, 1, 1, 1,
-0.2757591, 1.128339, -0.6219582, 1, 1, 1, 1, 1,
-0.2745078, 0.5610262, -0.4909358, 1, 1, 1, 1, 1,
-0.2741702, -0.9948083, -3.097083, 1, 1, 1, 1, 1,
-0.2738023, -0.6570865, -2.748993, 1, 1, 1, 1, 1,
-0.2719759, 0.2430952, -2.015059, 1, 1, 1, 1, 1,
-0.2667857, -1.549402, -2.386085, 1, 1, 1, 1, 1,
-0.262711, -0.4465526, -2.931998, 1, 1, 1, 1, 1,
-0.2595052, -0.5298217, -3.128369, 1, 1, 1, 1, 1,
-0.2492715, 0.5014014, 1.486934, 1, 1, 1, 1, 1,
-0.2450063, -0.07246901, -2.607862, 1, 1, 1, 1, 1,
-0.2427185, -0.1061737, -1.443045, 1, 1, 1, 1, 1,
-0.2427156, -0.9354389, -1.920142, 0, 0, 1, 1, 1,
-0.241619, 0.6831195, -0.4287476, 1, 0, 0, 1, 1,
-0.2398891, 2.058965, -1.281989, 1, 0, 0, 1, 1,
-0.2350409, -0.1447898, -0.03971519, 1, 0, 0, 1, 1,
-0.2344128, 1.322112, 0.9534326, 1, 0, 0, 1, 1,
-0.2335932, -0.8256629, -2.747571, 1, 0, 0, 1, 1,
-0.2314399, 1.24592, 2.501957, 0, 0, 0, 1, 1,
-0.2297084, -0.7647275, -3.693272, 0, 0, 0, 1, 1,
-0.2250826, -1.028765, -2.645107, 0, 0, 0, 1, 1,
-0.2194558, 0.1980926, 0.4598003, 0, 0, 0, 1, 1,
-0.2155878, -0.6347814, -4.090731, 0, 0, 0, 1, 1,
-0.2129214, -0.5449038, -2.269578, 0, 0, 0, 1, 1,
-0.2126012, -3.650151, -4.490603, 0, 0, 0, 1, 1,
-0.2068455, 0.1197924, -0.502665, 1, 1, 1, 1, 1,
-0.2058609, -0.1722631, -2.952491, 1, 1, 1, 1, 1,
-0.2039602, 2.155958, -0.7391133, 1, 1, 1, 1, 1,
-0.200072, 0.4762294, -1.754879, 1, 1, 1, 1, 1,
-0.1937427, 1.437162, -1.499954, 1, 1, 1, 1, 1,
-0.1926052, -1.90898, -4.203569, 1, 1, 1, 1, 1,
-0.1900603, 0.4401796, -0.2676641, 1, 1, 1, 1, 1,
-0.1879645, 0.3856615, 0.4094888, 1, 1, 1, 1, 1,
-0.1879484, 0.9500374, 0.6574031, 1, 1, 1, 1, 1,
-0.1845988, 0.2166294, -1.457314, 1, 1, 1, 1, 1,
-0.1836062, 0.3582156, 0.0002179027, 1, 1, 1, 1, 1,
-0.1822949, -0.4203704, -3.117315, 1, 1, 1, 1, 1,
-0.1774518, -2.737152, -2.593773, 1, 1, 1, 1, 1,
-0.1735291, -1.610384, -0.9762358, 1, 1, 1, 1, 1,
-0.1700404, 0.7036059, -0.01224595, 1, 1, 1, 1, 1,
-0.1684206, -0.01706707, -2.696351, 0, 0, 1, 1, 1,
-0.1678222, -0.242894, -2.051019, 1, 0, 0, 1, 1,
-0.1640819, 0.7071803, 1.314623, 1, 0, 0, 1, 1,
-0.1635173, -1.817762, -1.711902, 1, 0, 0, 1, 1,
-0.1555316, -0.1257153, -1.254931, 1, 0, 0, 1, 1,
-0.1503918, 0.4077114, -1.971287, 1, 0, 0, 1, 1,
-0.1455448, 0.4783386, 1.480619, 0, 0, 0, 1, 1,
-0.1455089, -1.620408, -3.362728, 0, 0, 0, 1, 1,
-0.1448997, -0.9595132, -3.294564, 0, 0, 0, 1, 1,
-0.1393724, 0.857784, -0.6088046, 0, 0, 0, 1, 1,
-0.1333673, 0.09722847, 0.4526776, 0, 0, 0, 1, 1,
-0.1332296, -0.7789853, -3.07558, 0, 0, 0, 1, 1,
-0.1289315, -1.09746, -2.072422, 0, 0, 0, 1, 1,
-0.1284508, -0.1872959, -2.452058, 1, 1, 1, 1, 1,
-0.1271136, 1.367985, -1.1106, 1, 1, 1, 1, 1,
-0.1268348, -0.7265925, -1.529953, 1, 1, 1, 1, 1,
-0.1267572, 1.274054, -2.173329, 1, 1, 1, 1, 1,
-0.1266043, -1.100305, -3.760598, 1, 1, 1, 1, 1,
-0.1238121, 0.7040696, 0.4408591, 1, 1, 1, 1, 1,
-0.1237439, 0.7962215, -1.759481, 1, 1, 1, 1, 1,
-0.1229621, 0.4815643, -0.05444775, 1, 1, 1, 1, 1,
-0.1188256, -1.190003, -3.689564, 1, 1, 1, 1, 1,
-0.1129098, 0.3466327, 0.2866037, 1, 1, 1, 1, 1,
-0.1082679, 0.5640565, -0.9571205, 1, 1, 1, 1, 1,
-0.1016348, 1.005579, 0.6037261, 1, 1, 1, 1, 1,
-0.1015363, -1.835676, -2.34388, 1, 1, 1, 1, 1,
-0.1008063, 1.202193, -0.2186428, 1, 1, 1, 1, 1,
-0.1007092, -0.8224264, -2.369678, 1, 1, 1, 1, 1,
-0.09405163, 1.467127, -1.38903, 0, 0, 1, 1, 1,
-0.09046154, 0.4201957, -2.336853, 1, 0, 0, 1, 1,
-0.08996465, 0.6350204, -0.5715476, 1, 0, 0, 1, 1,
-0.08636039, -0.3947951, -4.970286, 1, 0, 0, 1, 1,
-0.07930952, 0.825061, 0.9286393, 1, 0, 0, 1, 1,
-0.07880808, 0.5734987, -0.7564983, 1, 0, 0, 1, 1,
-0.06791967, 0.01845057, 0.3685051, 0, 0, 0, 1, 1,
-0.06759635, -0.7500518, -3.921223, 0, 0, 0, 1, 1,
-0.06673371, 1.05675, 1.272556, 0, 0, 0, 1, 1,
-0.06614238, 0.8705227, -0.5383359, 0, 0, 0, 1, 1,
-0.06467262, -0.6948004, -1.546491, 0, 0, 0, 1, 1,
-0.05981807, -0.5321425, -4.005993, 0, 0, 0, 1, 1,
-0.05549615, -0.4010105, -3.799851, 0, 0, 0, 1, 1,
-0.05204963, 1.060291, -0.2996804, 1, 1, 1, 1, 1,
-0.04768194, 1.020077, -1.024685, 1, 1, 1, 1, 1,
-0.04658096, -0.2336348, -3.478156, 1, 1, 1, 1, 1,
-0.04574294, 0.01027401, -0.9664838, 1, 1, 1, 1, 1,
-0.04476295, 0.2759529, 0.1080331, 1, 1, 1, 1, 1,
-0.04265741, 1.280719, -0.147045, 1, 1, 1, 1, 1,
-0.03454646, -0.3277012, -3.753051, 1, 1, 1, 1, 1,
-0.03191983, -1.61181, -5.102545, 1, 1, 1, 1, 1,
-0.03173677, 0.6423426, -0.03914983, 1, 1, 1, 1, 1,
-0.02741985, -0.6041564, -2.221663, 1, 1, 1, 1, 1,
-0.02662661, -0.7139399, -3.104126, 1, 1, 1, 1, 1,
-0.02351064, -0.8553059, -1.921173, 1, 1, 1, 1, 1,
-0.01889916, -0.1719938, -4.919922, 1, 1, 1, 1, 1,
-0.01437236, 1.806704, -0.09694285, 1, 1, 1, 1, 1,
-0.008845457, 0.4460694, -0.9247119, 1, 1, 1, 1, 1,
-0.007693988, 0.2349506, 1.504559, 0, 0, 1, 1, 1,
-0.005397135, 0.925611, 1.623315, 1, 0, 0, 1, 1,
-0.004461435, -1.293521, -2.764458, 1, 0, 0, 1, 1,
0.004026503, -0.3383478, 4.334868, 1, 0, 0, 1, 1,
0.006571296, -0.6114199, 2.537053, 1, 0, 0, 1, 1,
0.007605208, -1.059566, 1.907058, 1, 0, 0, 1, 1,
0.007816586, 0.9438089, 0.66572, 0, 0, 0, 1, 1,
0.008023004, 0.4472823, 0.9710591, 0, 0, 0, 1, 1,
0.008659587, -0.4865262, 3.624973, 0, 0, 0, 1, 1,
0.01613428, -1.092773, 5.310399, 0, 0, 0, 1, 1,
0.01842807, 0.02077017, 2.059837, 0, 0, 0, 1, 1,
0.01887391, -0.4563774, 1.834719, 0, 0, 0, 1, 1,
0.02118012, 1.239642, -0.4133578, 0, 0, 0, 1, 1,
0.02876104, 0.7619844, 2.758534, 1, 1, 1, 1, 1,
0.02903855, -1.1649, 2.844017, 1, 1, 1, 1, 1,
0.03910175, -1.331876, 4.361753, 1, 1, 1, 1, 1,
0.04438646, 1.11456, -0.5176492, 1, 1, 1, 1, 1,
0.04485749, 1.680905, -1.38612, 1, 1, 1, 1, 1,
0.04499896, -0.5543293, 4.560859, 1, 1, 1, 1, 1,
0.04595409, -0.6366779, 2.432442, 1, 1, 1, 1, 1,
0.04912673, -1.060734, 5.512793, 1, 1, 1, 1, 1,
0.0501965, -0.3390642, 2.735229, 1, 1, 1, 1, 1,
0.05111863, 0.4100848, 0.3236514, 1, 1, 1, 1, 1,
0.05322378, 0.6546286, 0.7505862, 1, 1, 1, 1, 1,
0.05687544, 2.258063, 0.5865015, 1, 1, 1, 1, 1,
0.06166729, -1.173888, 4.149004, 1, 1, 1, 1, 1,
0.06411065, 1.06865, -2.209355, 1, 1, 1, 1, 1,
0.06522432, 0.2599447, -0.3595779, 1, 1, 1, 1, 1,
0.06848002, -0.4376812, 2.446881, 0, 0, 1, 1, 1,
0.0842467, -0.6756015, 2.256819, 1, 0, 0, 1, 1,
0.08789247, 1.511695, -0.3165147, 1, 0, 0, 1, 1,
0.09047095, -1.57438, 1.714693, 1, 0, 0, 1, 1,
0.0912756, -0.5287622, 3.242451, 1, 0, 0, 1, 1,
0.0916368, 0.6663727, 0.3970114, 1, 0, 0, 1, 1,
0.09204564, 0.8482604, 1.474011, 0, 0, 0, 1, 1,
0.09274057, 0.7357681, 1.402279, 0, 0, 0, 1, 1,
0.09366617, -0.3744544, 3.681424, 0, 0, 0, 1, 1,
0.09764203, 1.026407, -1.102628, 0, 0, 0, 1, 1,
0.09776394, -0.4868568, 3.292175, 0, 0, 0, 1, 1,
0.1019353, 0.9403412, 0.2435222, 0, 0, 0, 1, 1,
0.1028467, 3.181524, -1.268868, 0, 0, 0, 1, 1,
0.1077671, 0.3675073, 0.1301911, 1, 1, 1, 1, 1,
0.113202, 1.456457, -0.4517168, 1, 1, 1, 1, 1,
0.1154003, -0.1116464, 3.135441, 1, 1, 1, 1, 1,
0.1162724, 1.09018, -0.5051178, 1, 1, 1, 1, 1,
0.1178028, -0.835793, 3.295008, 1, 1, 1, 1, 1,
0.1189477, -0.9514815, 3.504664, 1, 1, 1, 1, 1,
0.1196878, -0.5263156, 4.567885, 1, 1, 1, 1, 1,
0.1202867, -0.5080046, 3.298004, 1, 1, 1, 1, 1,
0.1280212, -0.1300551, 2.860877, 1, 1, 1, 1, 1,
0.129508, 0.04131449, 0.447398, 1, 1, 1, 1, 1,
0.1322697, -0.1616556, 1.704283, 1, 1, 1, 1, 1,
0.132868, -1.253711, 3.501967, 1, 1, 1, 1, 1,
0.1330037, 0.9407096, 0.5593877, 1, 1, 1, 1, 1,
0.133538, -0.4898911, 2.736903, 1, 1, 1, 1, 1,
0.1338664, 1.065853, -0.6244364, 1, 1, 1, 1, 1,
0.1339811, -0.6383834, 1.347936, 0, 0, 1, 1, 1,
0.1345107, -0.8633328, 3.971536, 1, 0, 0, 1, 1,
0.1350581, 0.03017739, 0.6983921, 1, 0, 0, 1, 1,
0.1355235, 1.223741, -0.4879638, 1, 0, 0, 1, 1,
0.1356988, -0.790532, 4.615377, 1, 0, 0, 1, 1,
0.1384522, -1.225832, 3.440084, 1, 0, 0, 1, 1,
0.1389576, 1.053312, 1.540228, 0, 0, 0, 1, 1,
0.1440523, -2.463918, 3.175193, 0, 0, 0, 1, 1,
0.1453668, -0.04838067, 2.695361, 0, 0, 0, 1, 1,
0.1472107, -2.440994, 3.746485, 0, 0, 0, 1, 1,
0.1484368, -0.5252431, 4.207438, 0, 0, 0, 1, 1,
0.1536808, -0.9888034, 4.027291, 0, 0, 0, 1, 1,
0.1541194, 1.063661, 0.1405106, 0, 0, 0, 1, 1,
0.1549187, -0.5010457, 2.794918, 1, 1, 1, 1, 1,
0.155442, 1.654565, 0.4935071, 1, 1, 1, 1, 1,
0.1555883, -2.40619, 3.550758, 1, 1, 1, 1, 1,
0.1570777, -0.14076, 2.338606, 1, 1, 1, 1, 1,
0.1596482, -2.579889, 2.44815, 1, 1, 1, 1, 1,
0.1619052, -1.030629, 3.047752, 1, 1, 1, 1, 1,
0.1710675, 0.5481768, -1.041254, 1, 1, 1, 1, 1,
0.1742307, 0.09871035, 1.422257, 1, 1, 1, 1, 1,
0.174682, 1.257808, -0.5494604, 1, 1, 1, 1, 1,
0.1750905, 0.6214573, 2.109535, 1, 1, 1, 1, 1,
0.1818628, 0.2003811, -0.2764328, 1, 1, 1, 1, 1,
0.1895894, 0.8288372, 1.395622, 1, 1, 1, 1, 1,
0.1973996, -0.4676874, 3.344489, 1, 1, 1, 1, 1,
0.1989602, 1.848488, 0.9880518, 1, 1, 1, 1, 1,
0.2047458, -0.411749, 4.118785, 1, 1, 1, 1, 1,
0.2058303, -0.2798892, 2.143068, 0, 0, 1, 1, 1,
0.2121389, 1.101477, 0.0170103, 1, 0, 0, 1, 1,
0.2129245, -0.2670327, 3.114176, 1, 0, 0, 1, 1,
0.2159559, -0.1692602, 2.913758, 1, 0, 0, 1, 1,
0.2242531, 0.8482975, 0.5222692, 1, 0, 0, 1, 1,
0.2282638, 1.298659, 0.8351746, 1, 0, 0, 1, 1,
0.2325933, 0.871987, 2.413695, 0, 0, 0, 1, 1,
0.234051, 0.2683729, -0.28044, 0, 0, 0, 1, 1,
0.2380598, 0.1022636, -0.2435095, 0, 0, 0, 1, 1,
0.2414968, 1.127298, -0.9962125, 0, 0, 0, 1, 1,
0.2424748, 0.6834389, 0.441906, 0, 0, 0, 1, 1,
0.2437643, 0.6358201, -0.2196727, 0, 0, 0, 1, 1,
0.2477519, 0.8482391, 2.198236, 0, 0, 0, 1, 1,
0.2504291, 0.9276721, -0.8154078, 1, 1, 1, 1, 1,
0.2556698, -0.08820908, 1.336281, 1, 1, 1, 1, 1,
0.2617925, -0.906251, 2.806052, 1, 1, 1, 1, 1,
0.2622084, 0.4341186, 0.1187264, 1, 1, 1, 1, 1,
0.2632444, -0.1876876, 1.559984, 1, 1, 1, 1, 1,
0.2646737, 1.543669, 0.6821843, 1, 1, 1, 1, 1,
0.2664086, -0.1320963, 3.137812, 1, 1, 1, 1, 1,
0.2695578, -0.2315388, 1.280701, 1, 1, 1, 1, 1,
0.2728692, 0.6854999, -1.043631, 1, 1, 1, 1, 1,
0.2769239, 0.8806056, 0.1117741, 1, 1, 1, 1, 1,
0.2797718, 2.296897, 0.7005706, 1, 1, 1, 1, 1,
0.2830224, -0.7697015, 4.242692, 1, 1, 1, 1, 1,
0.284398, 0.07136631, 1.838753, 1, 1, 1, 1, 1,
0.289685, 0.4362727, -0.1728514, 1, 1, 1, 1, 1,
0.2909276, 0.3535532, -0.6273746, 1, 1, 1, 1, 1,
0.2921431, -2.009963, 2.493735, 0, 0, 1, 1, 1,
0.2937736, -1.054726, 4.265003, 1, 0, 0, 1, 1,
0.2941644, 0.7509407, -0.1979866, 1, 0, 0, 1, 1,
0.2943744, 2.16951, 1.604279, 1, 0, 0, 1, 1,
0.2962549, -0.2174191, 1.255957, 1, 0, 0, 1, 1,
0.3007639, -0.3757367, 3.304687, 1, 0, 0, 1, 1,
0.3007984, -1.140009, 5.061207, 0, 0, 0, 1, 1,
0.3039352, -1.805617, 1.890241, 0, 0, 0, 1, 1,
0.3058789, 0.8586444, 0.9370831, 0, 0, 0, 1, 1,
0.3097113, -1.368764, 0.8046255, 0, 0, 0, 1, 1,
0.3104266, -1.147897, 0.5991411, 0, 0, 0, 1, 1,
0.3134842, -0.6105591, 4.271067, 0, 0, 0, 1, 1,
0.3234821, -1.897844, 2.597449, 0, 0, 0, 1, 1,
0.3261308, -0.9846784, 1.171538, 1, 1, 1, 1, 1,
0.3272966, 0.3769288, -0.8854836, 1, 1, 1, 1, 1,
0.3284104, 0.12716, 1.602061, 1, 1, 1, 1, 1,
0.3292524, -2.474559, 2.918286, 1, 1, 1, 1, 1,
0.3297124, -0.5730205, 2.574826, 1, 1, 1, 1, 1,
0.3298871, -0.9218825, 1.102561, 1, 1, 1, 1, 1,
0.3315038, -1.58345, 3.50304, 1, 1, 1, 1, 1,
0.3364365, 1.215099, 0.2335289, 1, 1, 1, 1, 1,
0.3364551, 0.5812446, 0.832371, 1, 1, 1, 1, 1,
0.3385637, 0.4731424, -0.1544263, 1, 1, 1, 1, 1,
0.3387482, -0.4646844, 2.276361, 1, 1, 1, 1, 1,
0.3406569, 1.163616, 2.019109, 1, 1, 1, 1, 1,
0.3428866, 0.4706814, 0.5052221, 1, 1, 1, 1, 1,
0.3437764, -2.945888, 3.239257, 1, 1, 1, 1, 1,
0.3444772, -0.9644799, 3.802836, 1, 1, 1, 1, 1,
0.3468076, 0.5809419, -0.4134609, 0, 0, 1, 1, 1,
0.3509246, 0.1461471, 0.4129677, 1, 0, 0, 1, 1,
0.3519444, 0.07958309, 1.244226, 1, 0, 0, 1, 1,
0.3520672, 0.1429102, 1.673391, 1, 0, 0, 1, 1,
0.354187, 0.02444895, -0.0223162, 1, 0, 0, 1, 1,
0.3556743, -0.1215324, 2.804623, 1, 0, 0, 1, 1,
0.3635233, -0.4216974, 2.284573, 0, 0, 0, 1, 1,
0.3656487, 1.886427, 0.0656818, 0, 0, 0, 1, 1,
0.3749464, 2.371706, 0.6646606, 0, 0, 0, 1, 1,
0.3763756, -1.259397, 3.674263, 0, 0, 0, 1, 1,
0.3766959, -0.5423609, 3.111069, 0, 0, 0, 1, 1,
0.3787248, 1.381227, 0.5624266, 0, 0, 0, 1, 1,
0.3796258, 0.3517706, 1.072569, 0, 0, 0, 1, 1,
0.38163, -1.038896, 3.058964, 1, 1, 1, 1, 1,
0.3837681, 1.143283, 0.2688925, 1, 1, 1, 1, 1,
0.3844257, 0.5724529, -0.7545024, 1, 1, 1, 1, 1,
0.3852305, 0.533916, 2.039325, 1, 1, 1, 1, 1,
0.3865375, 0.3617433, 1.324653, 1, 1, 1, 1, 1,
0.3875596, 0.3061469, 0.4925444, 1, 1, 1, 1, 1,
0.3905355, 1.364339, 0.4469085, 1, 1, 1, 1, 1,
0.3912053, -0.7329221, 3.017427, 1, 1, 1, 1, 1,
0.3980986, 0.3639965, 2.084419, 1, 1, 1, 1, 1,
0.4019468, -0.956714, 2.044396, 1, 1, 1, 1, 1,
0.403534, -0.04908276, 1.114469, 1, 1, 1, 1, 1,
0.4087282, 0.06076742, 1.610263, 1, 1, 1, 1, 1,
0.4105554, -0.8927729, 2.711013, 1, 1, 1, 1, 1,
0.4116335, 1.274304, 1.204695, 1, 1, 1, 1, 1,
0.4162186, 2.236899, 0.423261, 1, 1, 1, 1, 1,
0.4165153, 0.4882458, 0.9132361, 0, 0, 1, 1, 1,
0.4211449, -1.856738, 3.35771, 1, 0, 0, 1, 1,
0.4218432, 0.7161125, 1.12149, 1, 0, 0, 1, 1,
0.4225371, 1.72097, -0.01492766, 1, 0, 0, 1, 1,
0.4227894, -1.095643, 1.918078, 1, 0, 0, 1, 1,
0.4259605, -0.0741644, 0.4880366, 1, 0, 0, 1, 1,
0.4303048, 1.007913, 0.2925749, 0, 0, 0, 1, 1,
0.4306646, 0.3702516, -0.8187181, 0, 0, 0, 1, 1,
0.4317098, 1.153058, 0.5936632, 0, 0, 0, 1, 1,
0.432793, -0.7779311, 3.09162, 0, 0, 0, 1, 1,
0.4337877, -0.5337, 3.679874, 0, 0, 0, 1, 1,
0.4343986, 0.3837426, 1.890949, 0, 0, 0, 1, 1,
0.4344236, -0.7356929, 5.739631, 0, 0, 0, 1, 1,
0.4348916, -0.5887685, 3.121831, 1, 1, 1, 1, 1,
0.4349765, -0.1246733, 1.685249, 1, 1, 1, 1, 1,
0.4374275, -0.7847367, 2.263906, 1, 1, 1, 1, 1,
0.4400704, 0.4374194, 2.766795, 1, 1, 1, 1, 1,
0.4416199, 2.749404, 0.5888615, 1, 1, 1, 1, 1,
0.4416818, 0.2223198, -0.5097955, 1, 1, 1, 1, 1,
0.4434392, -0.3787458, 1.541597, 1, 1, 1, 1, 1,
0.4456239, -0.4111586, 1.473488, 1, 1, 1, 1, 1,
0.4456246, -0.02831258, 1.933079, 1, 1, 1, 1, 1,
0.4539838, -0.8706818, 2.841283, 1, 1, 1, 1, 1,
0.4588538, 1.210793, 2.461461, 1, 1, 1, 1, 1,
0.4589694, 0.4741825, 1.306743, 1, 1, 1, 1, 1,
0.4604875, -0.3589941, 1.8676, 1, 1, 1, 1, 1,
0.4633538, 2.643616, 0.1817359, 1, 1, 1, 1, 1,
0.4640244, 0.5638901, 0.5660267, 1, 1, 1, 1, 1,
0.4714459, 1.176032, -0.2284453, 0, 0, 1, 1, 1,
0.4726065, -0.4661917, 3.249088, 1, 0, 0, 1, 1,
0.4752589, -1.206971, 2.629939, 1, 0, 0, 1, 1,
0.4788238, 0.9229307, 0.9780914, 1, 0, 0, 1, 1,
0.4831511, 1.118086, 1.684748, 1, 0, 0, 1, 1,
0.486175, 1.705819, 0.7608648, 1, 0, 0, 1, 1,
0.4867906, 0.1277872, 1.630607, 0, 0, 0, 1, 1,
0.4881029, -1.106104, 2.926008, 0, 0, 0, 1, 1,
0.4941969, 2.491379, -0.3800512, 0, 0, 0, 1, 1,
0.4986891, 0.4085307, 1.236782, 0, 0, 0, 1, 1,
0.4992903, -0.3054416, 4.645775, 0, 0, 0, 1, 1,
0.5060474, -1.283044, 2.62903, 0, 0, 0, 1, 1,
0.5065806, -1.202571, 2.843245, 0, 0, 0, 1, 1,
0.5148186, 0.875887, 1.267203, 1, 1, 1, 1, 1,
0.5196043, -1.149731, 2.775693, 1, 1, 1, 1, 1,
0.5233299, 1.069796, 1.016105, 1, 1, 1, 1, 1,
0.5280004, 0.32362, 1.638274, 1, 1, 1, 1, 1,
0.5333479, 1.230718, 1.87869, 1, 1, 1, 1, 1,
0.5370486, 1.477213, 1.249344, 1, 1, 1, 1, 1,
0.5385795, -1.050598, 3.569594, 1, 1, 1, 1, 1,
0.5389388, -0.00765332, 0.6152464, 1, 1, 1, 1, 1,
0.5434021, -1.81246, 1.699322, 1, 1, 1, 1, 1,
0.5517279, -0.1816846, 1.446301, 1, 1, 1, 1, 1,
0.5531425, -0.5820066, 1.975662, 1, 1, 1, 1, 1,
0.5599191, -0.3907065, 1.510124, 1, 1, 1, 1, 1,
0.566862, 1.073964, 0.2694395, 1, 1, 1, 1, 1,
0.5712937, 0.1278757, 0.1994393, 1, 1, 1, 1, 1,
0.5744867, 0.2244182, 0.2566993, 1, 1, 1, 1, 1,
0.5754513, 0.6337113, 1.227767, 0, 0, 1, 1, 1,
0.5802845, 1.340546, -0.5672053, 1, 0, 0, 1, 1,
0.5832568, -1.034951, 3.676047, 1, 0, 0, 1, 1,
0.5833702, -0.5430539, 1.930302, 1, 0, 0, 1, 1,
0.5843786, 0.3621269, 0.4551008, 1, 0, 0, 1, 1,
0.5870878, -0.1059854, 1.297176, 1, 0, 0, 1, 1,
0.5876004, 0.1710464, 1.208188, 0, 0, 0, 1, 1,
0.5921506, -0.02930163, 1.521536, 0, 0, 0, 1, 1,
0.5923131, 0.2961554, 0.9299972, 0, 0, 0, 1, 1,
0.5923406, -0.4375726, 1.218914, 0, 0, 0, 1, 1,
0.5959302, -0.6404402, 1.252967, 0, 0, 0, 1, 1,
0.598732, 0.779377, -0.6101702, 0, 0, 0, 1, 1,
0.6031817, 0.1840417, 1.801309, 0, 0, 0, 1, 1,
0.6036107, 0.2122185, 1.359984, 1, 1, 1, 1, 1,
0.6116372, 1.548986, -0.08809996, 1, 1, 1, 1, 1,
0.6147605, -0.7751253, 4.034058, 1, 1, 1, 1, 1,
0.6230682, 0.5729212, -0.8808226, 1, 1, 1, 1, 1,
0.6246184, -0.1586837, 1.03068, 1, 1, 1, 1, 1,
0.6270308, 0.8205177, 1.953796, 1, 1, 1, 1, 1,
0.6291701, -0.5882881, 3.541973, 1, 1, 1, 1, 1,
0.6326473, -0.4171935, 2.551934, 1, 1, 1, 1, 1,
0.6400052, 1.355538, 0.8421422, 1, 1, 1, 1, 1,
0.6411936, -1.198679, 3.35514, 1, 1, 1, 1, 1,
0.6421471, 0.8164626, 2.408888, 1, 1, 1, 1, 1,
0.6469553, 0.09390289, 2.811469, 1, 1, 1, 1, 1,
0.6470072, -0.4023344, 0.3351412, 1, 1, 1, 1, 1,
0.6471381, -0.09744312, 1.153572, 1, 1, 1, 1, 1,
0.6474721, 0.1732373, 1.174733, 1, 1, 1, 1, 1,
0.6496741, 0.4585531, 0.506494, 0, 0, 1, 1, 1,
0.6497132, 0.4835354, -0.3244209, 1, 0, 0, 1, 1,
0.6508776, 1.767483, -0.1988089, 1, 0, 0, 1, 1,
0.6528559, -0.6253375, 0.8157418, 1, 0, 0, 1, 1,
0.6535664, 1.150042, 0.3288245, 1, 0, 0, 1, 1,
0.653748, -0.5628404, 2.149847, 1, 0, 0, 1, 1,
0.6569538, -0.4736277, 3.346053, 0, 0, 0, 1, 1,
0.6570377, 0.0554554, -0.4862018, 0, 0, 0, 1, 1,
0.6583306, 0.345279, 1.256407, 0, 0, 0, 1, 1,
0.6597323, 0.5096605, -0.3631415, 0, 0, 0, 1, 1,
0.6665441, -1.051141, 1.256226, 0, 0, 0, 1, 1,
0.6758375, 2.194123, 0.7812962, 0, 0, 0, 1, 1,
0.6833108, 1.069024, 1.689862, 0, 0, 0, 1, 1,
0.6834109, -0.5265831, 1.04469, 1, 1, 1, 1, 1,
0.6849684, 0.5179434, -1.844851, 1, 1, 1, 1, 1,
0.6918491, 0.4801784, -0.5095758, 1, 1, 1, 1, 1,
0.6939946, 0.6693996, 1.282982, 1, 1, 1, 1, 1,
0.6956069, -0.4673826, 0.6190264, 1, 1, 1, 1, 1,
0.6962538, -0.3818553, 3.577593, 1, 1, 1, 1, 1,
0.6969793, -0.8142892, 3.1509, 1, 1, 1, 1, 1,
0.6974263, 0.03687041, 2.133173, 1, 1, 1, 1, 1,
0.6975177, 0.6665702, 0.497574, 1, 1, 1, 1, 1,
0.7006844, 0.08627715, 2.005948, 1, 1, 1, 1, 1,
0.7011378, 1.226988, 2.458943, 1, 1, 1, 1, 1,
0.7042871, 1.285939, 0.582809, 1, 1, 1, 1, 1,
0.7048285, 1.114951, 0.5086009, 1, 1, 1, 1, 1,
0.7056184, -0.05100077, -0.5121122, 1, 1, 1, 1, 1,
0.705827, 1.668695, -1.062658, 1, 1, 1, 1, 1,
0.7063338, -0.4020461, 1.202195, 0, 0, 1, 1, 1,
0.709874, -0.4601218, 0.7494234, 1, 0, 0, 1, 1,
0.7106707, -0.6235607, 3.750943, 1, 0, 0, 1, 1,
0.7159798, 1.689457, 1.786624, 1, 0, 0, 1, 1,
0.7201349, -0.2208481, 2.38468, 1, 0, 0, 1, 1,
0.7235488, 0.519373, -0.2003761, 1, 0, 0, 1, 1,
0.736562, -0.4191642, 2.854796, 0, 0, 0, 1, 1,
0.7379544, -0.2709959, 1.477829, 0, 0, 0, 1, 1,
0.7432257, 0.446839, -0.7066029, 0, 0, 0, 1, 1,
0.7485031, 0.4526821, 0.2384387, 0, 0, 0, 1, 1,
0.752134, 0.08925, 0.919904, 0, 0, 0, 1, 1,
0.7526656, 0.8407709, 1.363106, 0, 0, 0, 1, 1,
0.7674164, 0.1467499, 0.7360908, 0, 0, 0, 1, 1,
0.7724383, 1.743275, -0.4238487, 1, 1, 1, 1, 1,
0.7752014, -1.16242, 1.050344, 1, 1, 1, 1, 1,
0.7792914, 1.784983, 0.7690398, 1, 1, 1, 1, 1,
0.780445, 0.5932752, 1.581585, 1, 1, 1, 1, 1,
0.7809055, 0.3949948, -0.1558724, 1, 1, 1, 1, 1,
0.7843257, 1.783063, -0.3048846, 1, 1, 1, 1, 1,
0.7893629, -1.581557, 0.6121944, 1, 1, 1, 1, 1,
0.7914879, -0.826178, 1.663484, 1, 1, 1, 1, 1,
0.7928494, -0.1950053, 3.664415, 1, 1, 1, 1, 1,
0.7965569, 0.6202372, 0.2839906, 1, 1, 1, 1, 1,
0.8010651, -1.520205, 0.8999147, 1, 1, 1, 1, 1,
0.8049865, 0.1013638, 0.2807717, 1, 1, 1, 1, 1,
0.8054614, 0.7472751, 2.240665, 1, 1, 1, 1, 1,
0.8094189, 0.668248, 0.7028687, 1, 1, 1, 1, 1,
0.8140477, 0.1642058, 1.802425, 1, 1, 1, 1, 1,
0.8231481, -0.8090562, 2.255314, 0, 0, 1, 1, 1,
0.8256484, 0.4675432, 0.885802, 1, 0, 0, 1, 1,
0.8277608, 1.047465, 1.038795, 1, 0, 0, 1, 1,
0.8326854, 0.3248852, 0.5376529, 1, 0, 0, 1, 1,
0.8348289, -0.3818515, 2.295596, 1, 0, 0, 1, 1,
0.8353396, 0.4904525, 0.8006036, 1, 0, 0, 1, 1,
0.8392202, -1.152958, 2.082585, 0, 0, 0, 1, 1,
0.8395936, -0.3887602, 2.19514, 0, 0, 0, 1, 1,
0.8396074, -0.6531548, 3.200323, 0, 0, 0, 1, 1,
0.8402772, 0.0423652, 2.622061, 0, 0, 0, 1, 1,
0.8438572, 0.8901204, -0.4911666, 0, 0, 0, 1, 1,
0.844602, -1.893061, 1.977707, 0, 0, 0, 1, 1,
0.8458189, -0.4850844, 2.690274, 0, 0, 0, 1, 1,
0.8463905, -2.065894, 4.536439, 1, 1, 1, 1, 1,
0.8474321, 1.307311, -0.2723717, 1, 1, 1, 1, 1,
0.8554791, -1.816122, 2.745755, 1, 1, 1, 1, 1,
0.861661, 1.372429, 0.1812262, 1, 1, 1, 1, 1,
0.8638037, -1.244367, 1.33437, 1, 1, 1, 1, 1,
0.8648575, -1.392755, 2.894619, 1, 1, 1, 1, 1,
0.8667675, 0.04369512, 1.55314, 1, 1, 1, 1, 1,
0.8671507, 0.03397639, -0.05899483, 1, 1, 1, 1, 1,
0.8713925, -1.20714, 3.7822, 1, 1, 1, 1, 1,
0.8733867, -1.932932, 3.85522, 1, 1, 1, 1, 1,
0.8739057, -0.3671852, 2.172659, 1, 1, 1, 1, 1,
0.8853659, 0.7884932, 1.992873, 1, 1, 1, 1, 1,
0.8873442, 0.08593971, 2.31469, 1, 1, 1, 1, 1,
0.8897296, 0.05030545, 1.70787, 1, 1, 1, 1, 1,
0.8922712, -0.1545138, 0.1391211, 1, 1, 1, 1, 1,
0.893667, 0.5744595, 1.609815, 0, 0, 1, 1, 1,
0.8939669, -0.6101004, 2.581852, 1, 0, 0, 1, 1,
0.8956435, 0.3274035, 0.2433454, 1, 0, 0, 1, 1,
0.9001129, 2.422211, 0.7513342, 1, 0, 0, 1, 1,
0.9048279, -0.04538004, 0.2649924, 1, 0, 0, 1, 1,
0.9050429, 0.188261, 1.528806, 1, 0, 0, 1, 1,
0.9151449, -0.07990214, 1.693478, 0, 0, 0, 1, 1,
0.9160191, 0.5058674, 0.1906211, 0, 0, 0, 1, 1,
0.9348406, -1.545185, 1.162181, 0, 0, 0, 1, 1,
0.936989, 0.8666059, 1.211079, 0, 0, 0, 1, 1,
0.9407216, 0.5255783, 1.77191, 0, 0, 0, 1, 1,
0.9500945, 0.4681996, 0.8151489, 0, 0, 0, 1, 1,
0.9502191, -1.468265, 1.958439, 0, 0, 0, 1, 1,
0.9562467, -1.833104, 1.427709, 1, 1, 1, 1, 1,
0.9606518, -0.3125755, 1.655695, 1, 1, 1, 1, 1,
0.9634495, -0.1084205, 0.4507484, 1, 1, 1, 1, 1,
0.9663079, 0.7801859, 2.356755, 1, 1, 1, 1, 1,
0.9665031, 0.9838874, 0.2842111, 1, 1, 1, 1, 1,
0.9674827, -0.8512317, 0.9337214, 1, 1, 1, 1, 1,
0.9729501, -0.6414999, 3.604181, 1, 1, 1, 1, 1,
0.9743074, -0.06721914, 1.14373, 1, 1, 1, 1, 1,
0.9772217, -0.3645843, 1.356941, 1, 1, 1, 1, 1,
0.97763, 1.68716, 1.587187, 1, 1, 1, 1, 1,
0.9796766, -0.3129283, 3.180715, 1, 1, 1, 1, 1,
0.9833423, 1.601268, -0.02914345, 1, 1, 1, 1, 1,
0.9843975, -0.2588841, 0.9795136, 1, 1, 1, 1, 1,
0.9859968, 0.03366886, 1.596237, 1, 1, 1, 1, 1,
0.9868483, -0.1410745, 1.374198, 1, 1, 1, 1, 1,
0.9907526, -2.013186, 3.875371, 0, 0, 1, 1, 1,
1.001585, 0.2678592, 3.060001, 1, 0, 0, 1, 1,
1.012841, 1.437358, 1.899649, 1, 0, 0, 1, 1,
1.022201, -0.609483, 2.200631, 1, 0, 0, 1, 1,
1.022387, -0.2117971, 2.504347, 1, 0, 0, 1, 1,
1.023152, 1.378553, -1.665658, 1, 0, 0, 1, 1,
1.036427, -1.427278, 2.794353, 0, 0, 0, 1, 1,
1.03895, -0.2996047, 1.862208, 0, 0, 0, 1, 1,
1.039354, -2.861918, 3.893591, 0, 0, 0, 1, 1,
1.044212, -0.03599223, 1.058471, 0, 0, 0, 1, 1,
1.046128, -0.9103855, 1.824255, 0, 0, 0, 1, 1,
1.05186, -0.8551098, 1.501438, 0, 0, 0, 1, 1,
1.061541, -0.9475316, 2.461298, 0, 0, 0, 1, 1,
1.066504, -0.798505, 1.920918, 1, 1, 1, 1, 1,
1.07483, -1.093916, 3.08254, 1, 1, 1, 1, 1,
1.075566, -1.809744, 2.547415, 1, 1, 1, 1, 1,
1.077574, 0.5754265, 0.3117019, 1, 1, 1, 1, 1,
1.089037, -0.5966246, 0.4834314, 1, 1, 1, 1, 1,
1.089763, 0.3216091, 0.6059486, 1, 1, 1, 1, 1,
1.094509, -0.4398492, 2.461031, 1, 1, 1, 1, 1,
1.095117, -0.7236726, 3.644764, 1, 1, 1, 1, 1,
1.099107, 0.3655534, 1.390792, 1, 1, 1, 1, 1,
1.099825, 0.1473587, 0.3368439, 1, 1, 1, 1, 1,
1.106121, -0.2800077, 2.600006, 1, 1, 1, 1, 1,
1.108553, -0.4944175, 1.248722, 1, 1, 1, 1, 1,
1.114267, -0.1202632, 2.415632, 1, 1, 1, 1, 1,
1.120628, 0.199452, 0.2078651, 1, 1, 1, 1, 1,
1.120986, 0.06118944, 0.08680453, 1, 1, 1, 1, 1,
1.122026, -0.2597104, 1.380507, 0, 0, 1, 1, 1,
1.12746, 0.3724025, 1.423696, 1, 0, 0, 1, 1,
1.132389, 0.2837758, 1.665669, 1, 0, 0, 1, 1,
1.135178, 1.74404, 0.2606497, 1, 0, 0, 1, 1,
1.137208, -2.34226, 1.579138, 1, 0, 0, 1, 1,
1.138215, -0.2175968, 2.011882, 1, 0, 0, 1, 1,
1.145322, 0.8949617, 1.394868, 0, 0, 0, 1, 1,
1.152164, 1.769766, 0.1668771, 0, 0, 0, 1, 1,
1.152281, -0.4390804, 1.502006, 0, 0, 0, 1, 1,
1.162452, 1.349726, 0.7927785, 0, 0, 0, 1, 1,
1.166593, 1.839163, 1.873098, 0, 0, 0, 1, 1,
1.177195, 1.575226, 0.8150077, 0, 0, 0, 1, 1,
1.18301, -0.726799, 1.801552, 0, 0, 0, 1, 1,
1.184127, -0.2871014, 2.64414, 1, 1, 1, 1, 1,
1.184134, 0.07826618, 1.001019, 1, 1, 1, 1, 1,
1.187303, -1.495337, 2.876299, 1, 1, 1, 1, 1,
1.192344, -0.3562049, -1.01967, 1, 1, 1, 1, 1,
1.201952, 0.1582297, 3.288079, 1, 1, 1, 1, 1,
1.206854, 0.297442, 0.9446868, 1, 1, 1, 1, 1,
1.216088, 1.037062, 1.684666, 1, 1, 1, 1, 1,
1.216658, -0.1986901, 2.708227, 1, 1, 1, 1, 1,
1.217083, -0.275648, 2.202219, 1, 1, 1, 1, 1,
1.219676, -1.911449, 1.554467, 1, 1, 1, 1, 1,
1.238267, -0.86531, 4.060569, 1, 1, 1, 1, 1,
1.252878, 0.2551759, 1.651869, 1, 1, 1, 1, 1,
1.255639, -0.1249585, 1.033988, 1, 1, 1, 1, 1,
1.263934, -0.2445913, 2.241568, 1, 1, 1, 1, 1,
1.276216, -1.314214, 3.785247, 1, 1, 1, 1, 1,
1.277385, -1.76367, 2.991839, 0, 0, 1, 1, 1,
1.278998, 1.154564, 1.484082, 1, 0, 0, 1, 1,
1.287818, 0.1631678, 1.082623, 1, 0, 0, 1, 1,
1.299986, 0.4020585, 2.136388, 1, 0, 0, 1, 1,
1.307316, -0.5110301, 3.556205, 1, 0, 0, 1, 1,
1.309428, 0.03530258, 0.8549016, 1, 0, 0, 1, 1,
1.310987, -1.069243, 2.641971, 0, 0, 0, 1, 1,
1.312465, 1.414295, -0.5210626, 0, 0, 0, 1, 1,
1.321743, -0.2115937, 3.430711, 0, 0, 0, 1, 1,
1.323601, -1.368147, 2.159743, 0, 0, 0, 1, 1,
1.33428, -0.818729, 2.606001, 0, 0, 0, 1, 1,
1.345101, -1.295717, 2.293542, 0, 0, 0, 1, 1,
1.350175, -0.3555903, 2.691326, 0, 0, 0, 1, 1,
1.352203, 0.7033295, 1.245681, 1, 1, 1, 1, 1,
1.352539, 0.8611614, 1.476831, 1, 1, 1, 1, 1,
1.367983, 0.5663747, 0.4433176, 1, 1, 1, 1, 1,
1.375421, 0.4145775, 2.604438, 1, 1, 1, 1, 1,
1.397991, -0.5275639, 3.035559, 1, 1, 1, 1, 1,
1.39856, 1.037643, 0.6637853, 1, 1, 1, 1, 1,
1.404424, -0.01912888, -0.345401, 1, 1, 1, 1, 1,
1.441418, 0.1490668, 2.120933, 1, 1, 1, 1, 1,
1.444215, 0.04296008, 1.496493, 1, 1, 1, 1, 1,
1.455117, 0.4703064, 0.4097455, 1, 1, 1, 1, 1,
1.456486, -1.054604, 3.178857, 1, 1, 1, 1, 1,
1.468163, -0.4587708, 1.274377, 1, 1, 1, 1, 1,
1.476349, -0.4306418, 1.586097, 1, 1, 1, 1, 1,
1.480965, 0.7813505, 3.62644, 1, 1, 1, 1, 1,
1.489783, 0.1785673, 3.648426, 1, 1, 1, 1, 1,
1.492544, -2.083086, 2.783098, 0, 0, 1, 1, 1,
1.511881, 1.132999, 0.9577017, 1, 0, 0, 1, 1,
1.516107, -0.02077992, 1.184652, 1, 0, 0, 1, 1,
1.521646, 0.4157151, 1.138329, 1, 0, 0, 1, 1,
1.523494, -0.5674533, 1.496131, 1, 0, 0, 1, 1,
1.52573, -1.129339, 2.721504, 1, 0, 0, 1, 1,
1.535602, 1.353668, 2.13506, 0, 0, 0, 1, 1,
1.535789, 0.6968594, 1.115852, 0, 0, 0, 1, 1,
1.549758, -1.033438, 1.799192, 0, 0, 0, 1, 1,
1.556516, -0.3787611, 2.254059, 0, 0, 0, 1, 1,
1.581872, 1.748486, 1.981806, 0, 0, 0, 1, 1,
1.591099, -0.9214249, 1.701257, 0, 0, 0, 1, 1,
1.609488, -0.6183074, 0.6875069, 0, 0, 0, 1, 1,
1.6105, 0.4361098, 3.207592, 1, 1, 1, 1, 1,
1.615375, -1.067782, 3.507283, 1, 1, 1, 1, 1,
1.644587, -0.7168397, 1.198527, 1, 1, 1, 1, 1,
1.644897, 1.746186, 1.485518, 1, 1, 1, 1, 1,
1.64872, 0.8005821, 0.7966532, 1, 1, 1, 1, 1,
1.671386, 0.2098605, 1.833852, 1, 1, 1, 1, 1,
1.672492, -1.222075, 1.378619, 1, 1, 1, 1, 1,
1.672947, 0.6719704, 0.9567322, 1, 1, 1, 1, 1,
1.686244, 0.03729505, 0.7994844, 1, 1, 1, 1, 1,
1.688593, 0.2619786, 2.7289, 1, 1, 1, 1, 1,
1.710317, -0.7754593, 1.676025, 1, 1, 1, 1, 1,
1.714334, 1.850391, 0.7901154, 1, 1, 1, 1, 1,
1.722257, 2.373053, -0.9277958, 1, 1, 1, 1, 1,
1.723423, 0.1204761, 1.118929, 1, 1, 1, 1, 1,
1.724625, 0.01366086, 1.655193, 1, 1, 1, 1, 1,
1.72617, 0.3713333, 0.424256, 0, 0, 1, 1, 1,
1.733001, 0.6360223, 2.22301, 1, 0, 0, 1, 1,
1.743363, -0.09968454, 1.692772, 1, 0, 0, 1, 1,
1.745144, -2.730288, 3.599222, 1, 0, 0, 1, 1,
1.755246, -0.1222625, 0.3233587, 1, 0, 0, 1, 1,
1.772517, 0.3997041, -0.01598581, 1, 0, 0, 1, 1,
1.79765, 1.175344, 0.1871033, 0, 0, 0, 1, 1,
1.826818, -0.03513305, 0.08565965, 0, 0, 0, 1, 1,
1.826925, -0.1254241, 1.35417, 0, 0, 0, 1, 1,
1.830072, -0.945727, 1.375585, 0, 0, 0, 1, 1,
1.842341, -0.8663625, 1.380124, 0, 0, 0, 1, 1,
1.851664, -1.170403, 2.290688, 0, 0, 0, 1, 1,
1.865666, 1.132576, 0.7952353, 0, 0, 0, 1, 1,
1.874923, 0.8777345, 0.1200005, 1, 1, 1, 1, 1,
1.884305, 1.537862, 1.366465, 1, 1, 1, 1, 1,
1.969239, -0.5293475, 0.5682779, 1, 1, 1, 1, 1,
1.985837, -2.371511, 2.637601, 1, 1, 1, 1, 1,
1.989226, 0.1183917, 3.331446, 1, 1, 1, 1, 1,
1.995224, 0.08029766, 1.976223, 1, 1, 1, 1, 1,
2.00232, 2.415584, 1.783795, 1, 1, 1, 1, 1,
2.008476, 1.8415, -0.1064146, 1, 1, 1, 1, 1,
2.009572, -0.3244781, 1.240747, 1, 1, 1, 1, 1,
2.045222, -0.4359876, 2.888733, 1, 1, 1, 1, 1,
2.057512, 0.5793288, 0.8159369, 1, 1, 1, 1, 1,
2.060687, -0.7581341, 2.215468, 1, 1, 1, 1, 1,
2.068404, -1.266107, 0.9114839, 1, 1, 1, 1, 1,
2.073197, -0.9160752, 4.024782, 1, 1, 1, 1, 1,
2.080883, -0.6677514, 2.061697, 1, 1, 1, 1, 1,
2.094057, -0.2134367, 0.782544, 0, 0, 1, 1, 1,
2.104227, 0.4297671, 2.006688, 1, 0, 0, 1, 1,
2.216979, -0.2988601, 1.49426, 1, 0, 0, 1, 1,
2.274463, -0.1392149, 0.8016508, 1, 0, 0, 1, 1,
2.309139, -0.7633176, 4.235275, 1, 0, 0, 1, 1,
2.326652, -0.3675003, 2.522714, 1, 0, 0, 1, 1,
2.352133, -0.04039374, 1.002946, 0, 0, 0, 1, 1,
2.36064, 0.440271, 1.223624, 0, 0, 0, 1, 1,
2.361828, -0.6159865, 2.972539, 0, 0, 0, 1, 1,
2.395453, 0.5823331, 0.9688803, 0, 0, 0, 1, 1,
2.407584, 0.8100694, 0.7048023, 0, 0, 0, 1, 1,
2.430635, -0.7257262, 1.782746, 0, 0, 0, 1, 1,
2.466981, 0.8937836, -0.2481553, 0, 0, 0, 1, 1,
2.719965, -0.6141662, 0.416641, 1, 1, 1, 1, 1,
2.74429, -0.6680434, 1.653986, 1, 1, 1, 1, 1,
2.753506, 0.3491277, 1.711331, 1, 1, 1, 1, 1,
2.776416, 0.4542394, 0.8293614, 1, 1, 1, 1, 1,
2.78295, 0.07005376, 1.202482, 1, 1, 1, 1, 1,
2.861063, 0.02947877, 1.588453, 1, 1, 1, 1, 1,
2.93065, 0.03376273, 0.4715599, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.635704;
var distance = 33.845;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.0712713, 0.110579, -0.3185432 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.845);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
