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
-3.062036, 2.766716, -2.112156, 1, 0, 0, 1,
-2.965342, 0.08598857, -1.927375, 1, 0.007843138, 0, 1,
-2.867881, 0.7417738, -0.7236593, 1, 0.01176471, 0, 1,
-2.737631, 1.154017, -2.356103, 1, 0.01960784, 0, 1,
-2.68994, -0.7078917, -0.7244506, 1, 0.02352941, 0, 1,
-2.686879, 0.7410905, 0.1139221, 1, 0.03137255, 0, 1,
-2.67874, -0.2778412, -0.7908247, 1, 0.03529412, 0, 1,
-2.576302, 0.3285963, -0.6503504, 1, 0.04313726, 0, 1,
-2.5132, 0.145073, -0.7019812, 1, 0.04705882, 0, 1,
-2.431067, -0.497221, -1.642348, 1, 0.05490196, 0, 1,
-2.364364, -0.5199971, -2.915965, 1, 0.05882353, 0, 1,
-2.34164, 1.98331, -2.551777, 1, 0.06666667, 0, 1,
-2.31045, 1.041428, -2.037924, 1, 0.07058824, 0, 1,
-2.212785, -1.39097, 0.2908356, 1, 0.07843138, 0, 1,
-2.087236, 1.110904, -0.9847378, 1, 0.08235294, 0, 1,
-2.077073, -0.339768, -2.844, 1, 0.09019608, 0, 1,
-2.076659, 3.380389, -0.282328, 1, 0.09411765, 0, 1,
-2.052898, -0.1198913, -1.215118, 1, 0.1019608, 0, 1,
-2.01371, -0.3965735, -1.447474, 1, 0.1098039, 0, 1,
-1.953652, -1.611568, -2.000367, 1, 0.1137255, 0, 1,
-1.95161, 0.2927715, -1.253464, 1, 0.1215686, 0, 1,
-1.94802, -1.064604, -3.385083, 1, 0.1254902, 0, 1,
-1.933141, 0.9463637, -1.557758, 1, 0.1333333, 0, 1,
-1.887804, -0.9543681, -1.491018, 1, 0.1372549, 0, 1,
-1.876054, -1.573012, -4.070799, 1, 0.145098, 0, 1,
-1.815992, 1.059649, -0.1434661, 1, 0.1490196, 0, 1,
-1.810997, 0.4715627, -0.3646581, 1, 0.1568628, 0, 1,
-1.798112, 0.3050601, 0.4684075, 1, 0.1607843, 0, 1,
-1.790753, 1.105306, 0.6349965, 1, 0.1686275, 0, 1,
-1.781355, -0.1765411, -0.7495717, 1, 0.172549, 0, 1,
-1.771526, -0.7427748, -0.6173353, 1, 0.1803922, 0, 1,
-1.769885, 1.313773, -0.6639206, 1, 0.1843137, 0, 1,
-1.761479, -0.2666782, -2.775469, 1, 0.1921569, 0, 1,
-1.75191, 0.02266741, -2.140723, 1, 0.1960784, 0, 1,
-1.740896, -0.4146779, -2.308799, 1, 0.2039216, 0, 1,
-1.728107, -0.4989257, -2.043093, 1, 0.2117647, 0, 1,
-1.700428, -0.04157554, -0.7021528, 1, 0.2156863, 0, 1,
-1.694032, 0.1661893, 0.0380886, 1, 0.2235294, 0, 1,
-1.670891, -1.094429, -1.464799, 1, 0.227451, 0, 1,
-1.665344, 0.6879882, -1.284103, 1, 0.2352941, 0, 1,
-1.663269, 0.7502921, -1.516593, 1, 0.2392157, 0, 1,
-1.661393, -0.7210067, -3.011588, 1, 0.2470588, 0, 1,
-1.654078, 1.607392, -1.965348, 1, 0.2509804, 0, 1,
-1.644345, -1.748144, -1.734369, 1, 0.2588235, 0, 1,
-1.643287, 1.979646, -0.7927989, 1, 0.2627451, 0, 1,
-1.638, -0.5773799, -1.687953, 1, 0.2705882, 0, 1,
-1.634131, -1.938896, -3.871346, 1, 0.2745098, 0, 1,
-1.629081, -0.2055366, -2.417268, 1, 0.282353, 0, 1,
-1.627647, 0.6644198, -1.288731, 1, 0.2862745, 0, 1,
-1.617695, -0.9221041, -2.834134, 1, 0.2941177, 0, 1,
-1.614989, -0.9708346, -2.724938, 1, 0.3019608, 0, 1,
-1.606868, 0.6697917, -0.5870111, 1, 0.3058824, 0, 1,
-1.600286, -0.1335185, -1.219085, 1, 0.3137255, 0, 1,
-1.594363, -0.5982686, -3.745235, 1, 0.3176471, 0, 1,
-1.576824, -1.055748, -3.052405, 1, 0.3254902, 0, 1,
-1.567565, -0.8967019, -2.145053, 1, 0.3294118, 0, 1,
-1.551437, 0.5379097, -1.626035, 1, 0.3372549, 0, 1,
-1.549004, 0.446463, -1.365356, 1, 0.3411765, 0, 1,
-1.543956, -0.3922423, -3.009745, 1, 0.3490196, 0, 1,
-1.520116, 0.6746531, -2.131605, 1, 0.3529412, 0, 1,
-1.505383, -1.62336, -3.782435, 1, 0.3607843, 0, 1,
-1.489774, 0.2307554, -0.1301659, 1, 0.3647059, 0, 1,
-1.488475, -0.4115116, -1.989076, 1, 0.372549, 0, 1,
-1.481327, -0.8683719, -1.628277, 1, 0.3764706, 0, 1,
-1.471306, -0.1191277, -1.405225, 1, 0.3843137, 0, 1,
-1.470427, -1.839383, -1.952255, 1, 0.3882353, 0, 1,
-1.461139, 1.367293, -2.364982, 1, 0.3960784, 0, 1,
-1.459738, -0.7392434, -3.521854, 1, 0.4039216, 0, 1,
-1.443165, 0.5032981, -1.696562, 1, 0.4078431, 0, 1,
-1.425546, -1.486498, -1.347357, 1, 0.4156863, 0, 1,
-1.420827, 1.91888, -1.757989, 1, 0.4196078, 0, 1,
-1.412753, 1.107854, 0.1184633, 1, 0.427451, 0, 1,
-1.41259, 1.030249, 1.222661, 1, 0.4313726, 0, 1,
-1.409254, 1.039202, 0.1091894, 1, 0.4392157, 0, 1,
-1.409206, 0.08988913, -0.5370625, 1, 0.4431373, 0, 1,
-1.404858, 0.06416973, -1.74837, 1, 0.4509804, 0, 1,
-1.391624, -0.6402714, -1.53207, 1, 0.454902, 0, 1,
-1.389577, 1.150124, -2.470706, 1, 0.4627451, 0, 1,
-1.387752, 1.864182, -1.052296, 1, 0.4666667, 0, 1,
-1.375199, 0.9750483, -1.184362, 1, 0.4745098, 0, 1,
-1.369561, 1.832297, -2.321924, 1, 0.4784314, 0, 1,
-1.368788, 0.1531631, 0.9674683, 1, 0.4862745, 0, 1,
-1.36762, 0.4257984, 0.0502365, 1, 0.4901961, 0, 1,
-1.358977, -1.04874, -0.750783, 1, 0.4980392, 0, 1,
-1.354832, 0.2959118, -0.9403093, 1, 0.5058824, 0, 1,
-1.351644, -0.4138923, -2.655713, 1, 0.509804, 0, 1,
-1.346581, -0.6269991, -3.112796, 1, 0.5176471, 0, 1,
-1.342689, 0.7391536, -1.960088, 1, 0.5215687, 0, 1,
-1.341976, -1.610479, -2.420247, 1, 0.5294118, 0, 1,
-1.335531, 1.848173, -1.906299, 1, 0.5333334, 0, 1,
-1.334925, 2.071703, -1.139803, 1, 0.5411765, 0, 1,
-1.32284, -0.573602, -2.174333, 1, 0.5450981, 0, 1,
-1.316712, -0.7859869, -2.26642, 1, 0.5529412, 0, 1,
-1.308694, 1.392102, -0.6417066, 1, 0.5568628, 0, 1,
-1.303038, -0.1920366, -2.18003, 1, 0.5647059, 0, 1,
-1.301205, -0.2370086, -1.416052, 1, 0.5686275, 0, 1,
-1.299377, 0.4445481, -1.348417, 1, 0.5764706, 0, 1,
-1.292646, -0.8672639, -1.078462, 1, 0.5803922, 0, 1,
-1.290726, 0.9431629, -1.771515, 1, 0.5882353, 0, 1,
-1.255855, 0.1362842, -2.159312, 1, 0.5921569, 0, 1,
-1.24807, -0.1731296, -1.809814, 1, 0.6, 0, 1,
-1.2447, 0.917275, -1.825422, 1, 0.6078432, 0, 1,
-1.233519, 0.05005767, -1.964546, 1, 0.6117647, 0, 1,
-1.225382, 0.07017335, -1.696419, 1, 0.6196079, 0, 1,
-1.222318, -0.1972978, -1.944591, 1, 0.6235294, 0, 1,
-1.220109, -2.503802, -2.30831, 1, 0.6313726, 0, 1,
-1.210523, -0.9597809, -1.177674, 1, 0.6352941, 0, 1,
-1.209984, -0.3964737, -3.240327, 1, 0.6431373, 0, 1,
-1.201782, -0.7010469, -3.098247, 1, 0.6470588, 0, 1,
-1.199802, 1.243504, -0.4132521, 1, 0.654902, 0, 1,
-1.199528, -1.310618, -3.444704, 1, 0.6588235, 0, 1,
-1.186673, -0.1253518, -2.351295, 1, 0.6666667, 0, 1,
-1.178015, 0.2071213, -3.102848, 1, 0.6705883, 0, 1,
-1.170243, 0.2472036, -0.5560053, 1, 0.6784314, 0, 1,
-1.166784, -0.6171559, -3.491394, 1, 0.682353, 0, 1,
-1.163108, 1.473265, -0.2992604, 1, 0.6901961, 0, 1,
-1.159696, 0.03320226, -0.6100554, 1, 0.6941177, 0, 1,
-1.137562, -1.954048, -3.670164, 1, 0.7019608, 0, 1,
-1.128913, 0.3700805, -1.605719, 1, 0.7098039, 0, 1,
-1.124351, 0.5392408, -2.851105, 1, 0.7137255, 0, 1,
-1.123543, -1.617754, -3.301544, 1, 0.7215686, 0, 1,
-1.113972, -0.8206739, -1.112855, 1, 0.7254902, 0, 1,
-1.113814, 0.03378088, -1.725009, 1, 0.7333333, 0, 1,
-1.107626, 0.462119, -0.6144435, 1, 0.7372549, 0, 1,
-1.102632, -0.4678156, -0.8661456, 1, 0.7450981, 0, 1,
-1.101691, -0.06294778, -1.02702, 1, 0.7490196, 0, 1,
-1.096794, -1.51241, -1.388624, 1, 0.7568628, 0, 1,
-1.087179, -0.5425675, -3.159307, 1, 0.7607843, 0, 1,
-1.086883, 0.2876658, -1.667378, 1, 0.7686275, 0, 1,
-1.081498, 0.01601222, -2.144053, 1, 0.772549, 0, 1,
-1.073801, -0.986755, -1.636401, 1, 0.7803922, 0, 1,
-1.069028, 1.007831, -0.7776377, 1, 0.7843137, 0, 1,
-1.062198, -1.567129, -2.406006, 1, 0.7921569, 0, 1,
-1.059324, -1.182304, -2.750746, 1, 0.7960784, 0, 1,
-1.057305, 1.558314, 0.1048071, 1, 0.8039216, 0, 1,
-1.055124, 1.176018, -1.795523, 1, 0.8117647, 0, 1,
-1.048632, -0.01062053, -3.569323, 1, 0.8156863, 0, 1,
-1.046425, -0.1626574, -2.104034, 1, 0.8235294, 0, 1,
-1.041966, -0.4403037, -1.531199, 1, 0.827451, 0, 1,
-1.037376, -0.4914046, -1.819033, 1, 0.8352941, 0, 1,
-1.027413, -1.497755, -2.481132, 1, 0.8392157, 0, 1,
-1.027233, -0.3732387, 1.390642, 1, 0.8470588, 0, 1,
-1.025273, 1.09646, -1.245541, 1, 0.8509804, 0, 1,
-1.024801, -0.2342797, -2.835829, 1, 0.8588235, 0, 1,
-1.024366, -0.1563442, -0.8880183, 1, 0.8627451, 0, 1,
-1.021765, -0.6352355, -2.768188, 1, 0.8705882, 0, 1,
-1.018285, 1.51477, -2.112013, 1, 0.8745098, 0, 1,
-1.014503, -0.9001163, -1.352698, 1, 0.8823529, 0, 1,
-1.013864, -1.655449, -2.630307, 1, 0.8862745, 0, 1,
-1.011257, 0.3399967, 0.1537184, 1, 0.8941177, 0, 1,
-1.008787, -0.3548186, -2.015187, 1, 0.8980392, 0, 1,
-1.0064, 0.1944293, -1.55798, 1, 0.9058824, 0, 1,
-1.004534, 1.444791, -1.254487, 1, 0.9137255, 0, 1,
-1.001792, 0.5903561, -0.5987568, 1, 0.9176471, 0, 1,
-0.9943023, 0.6598675, 1.418658, 1, 0.9254902, 0, 1,
-0.9904168, 1.904023, 0.6321024, 1, 0.9294118, 0, 1,
-0.9871739, 1.074407, -1.183889, 1, 0.9372549, 0, 1,
-0.9865895, 1.843246, -0.04014562, 1, 0.9411765, 0, 1,
-0.9829005, 1.484986, 0.2198865, 1, 0.9490196, 0, 1,
-0.9628461, 0.2014325, -2.130581, 1, 0.9529412, 0, 1,
-0.9602423, -1.778867, -3.206669, 1, 0.9607843, 0, 1,
-0.9481248, -0.3335703, -1.526198, 1, 0.9647059, 0, 1,
-0.9383947, 0.7684325, -0.2490653, 1, 0.972549, 0, 1,
-0.9330966, -0.04208732, -3.278518, 1, 0.9764706, 0, 1,
-0.9330837, -0.6138654, -0.4673004, 1, 0.9843137, 0, 1,
-0.9328966, -0.9545913, -2.181688, 1, 0.9882353, 0, 1,
-0.9248376, 1.811574, -1.652025, 1, 0.9960784, 0, 1,
-0.9234987, 2.165998, -1.96644, 0.9960784, 1, 0, 1,
-0.9231433, 1.15195, -1.844907, 0.9921569, 1, 0, 1,
-0.9105514, 0.2187378, -2.151943, 0.9843137, 1, 0, 1,
-0.9097248, -0.1259276, -1.604827, 0.9803922, 1, 0, 1,
-0.9082168, -0.1250961, -0.8814924, 0.972549, 1, 0, 1,
-0.9043794, -0.2463362, -2.022572, 0.9686275, 1, 0, 1,
-0.8856232, 0.6962504, -0.2874725, 0.9607843, 1, 0, 1,
-0.8829621, 1.55428, -1.298213, 0.9568627, 1, 0, 1,
-0.8790576, -1.017712, -2.293409, 0.9490196, 1, 0, 1,
-0.8786553, 0.124354, -2.525676, 0.945098, 1, 0, 1,
-0.8664077, -0.4346921, -2.771991, 0.9372549, 1, 0, 1,
-0.8663313, -0.5792079, -5.171841, 0.9333333, 1, 0, 1,
-0.863598, 0.1795837, -2.712014, 0.9254902, 1, 0, 1,
-0.8562109, -0.242203, -1.961782, 0.9215686, 1, 0, 1,
-0.856165, 0.8007009, -2.487435, 0.9137255, 1, 0, 1,
-0.8510357, -1.858492, -3.462048, 0.9098039, 1, 0, 1,
-0.8441328, 1.385274, -0.6828349, 0.9019608, 1, 0, 1,
-0.8403475, 1.242318, -0.7195696, 0.8941177, 1, 0, 1,
-0.83302, -1.284022, -1.615621, 0.8901961, 1, 0, 1,
-0.8250151, 1.060156, -0.1033441, 0.8823529, 1, 0, 1,
-0.8224931, 0.2352118, -1.017584, 0.8784314, 1, 0, 1,
-0.8196904, -0.303792, -3.174175, 0.8705882, 1, 0, 1,
-0.8195841, 1.904654, -1.2001, 0.8666667, 1, 0, 1,
-0.8083597, -0.5263246, -2.61593, 0.8588235, 1, 0, 1,
-0.8075261, -0.6126999, -3.020052, 0.854902, 1, 0, 1,
-0.8053855, -0.9124895, -4.077771, 0.8470588, 1, 0, 1,
-0.8023788, -1.48946, -0.6732919, 0.8431373, 1, 0, 1,
-0.8014184, -0.7642527, -3.27635, 0.8352941, 1, 0, 1,
-0.7933173, -1.421659, -3.334589, 0.8313726, 1, 0, 1,
-0.7921404, -0.9248978, -2.396236, 0.8235294, 1, 0, 1,
-0.7864262, -0.5389718, -1.909266, 0.8196079, 1, 0, 1,
-0.7805737, 0.772655, -1.528608, 0.8117647, 1, 0, 1,
-0.7792319, -0.3731312, -2.540789, 0.8078431, 1, 0, 1,
-0.7779269, -2.259542, -1.540996, 0.8, 1, 0, 1,
-0.7707258, -0.05501181, -1.216438, 0.7921569, 1, 0, 1,
-0.7704489, 1.036938, -0.6500377, 0.7882353, 1, 0, 1,
-0.7696762, -1.280284, -2.612766, 0.7803922, 1, 0, 1,
-0.7662448, -0.9325782, -2.888204, 0.7764706, 1, 0, 1,
-0.759165, -0.8281361, -2.690593, 0.7686275, 1, 0, 1,
-0.7556066, 0.5430827, -1.573754, 0.7647059, 1, 0, 1,
-0.7550619, -0.9892501, -4.140144, 0.7568628, 1, 0, 1,
-0.7550234, -0.7140223, -3.007679, 0.7529412, 1, 0, 1,
-0.752854, -1.279217, -2.380462, 0.7450981, 1, 0, 1,
-0.748693, 0.5660305, -1.532989, 0.7411765, 1, 0, 1,
-0.7478904, -0.9810624, -1.546623, 0.7333333, 1, 0, 1,
-0.7475595, -0.1415206, -0.2785977, 0.7294118, 1, 0, 1,
-0.7468873, 2.544795, -1.313118, 0.7215686, 1, 0, 1,
-0.7462378, -0.6484202, -2.58359, 0.7176471, 1, 0, 1,
-0.7456555, 1.267115, 1.657035, 0.7098039, 1, 0, 1,
-0.7358986, -0.5281018, -2.834257, 0.7058824, 1, 0, 1,
-0.7343273, 0.815983, -1.679909, 0.6980392, 1, 0, 1,
-0.7314287, 0.4665122, -0.7317913, 0.6901961, 1, 0, 1,
-0.7312341, 0.7825794, -0.6909906, 0.6862745, 1, 0, 1,
-0.7285323, -0.5426818, -5.327865, 0.6784314, 1, 0, 1,
-0.720011, 0.4515564, -2.294502, 0.6745098, 1, 0, 1,
-0.7126875, -0.2250293, -2.631204, 0.6666667, 1, 0, 1,
-0.7111589, 0.6015255, -2.027351, 0.6627451, 1, 0, 1,
-0.7070759, -0.6965008, -2.35102, 0.654902, 1, 0, 1,
-0.7045812, -1.197261, -5.51178, 0.6509804, 1, 0, 1,
-0.7025644, -0.8105213, -2.985453, 0.6431373, 1, 0, 1,
-0.7009598, -0.9080176, -2.613476, 0.6392157, 1, 0, 1,
-0.700374, -2.749026, -5.171464, 0.6313726, 1, 0, 1,
-0.6985991, 1.596613, -1.095104, 0.627451, 1, 0, 1,
-0.6894566, -0.3358128, -0.3776108, 0.6196079, 1, 0, 1,
-0.6860595, -0.9075374, -2.130012, 0.6156863, 1, 0, 1,
-0.6843176, -0.3495139, -1.073296, 0.6078432, 1, 0, 1,
-0.6831698, 0.4966742, -0.7482904, 0.6039216, 1, 0, 1,
-0.6799184, -0.2344591, -2.380952, 0.5960785, 1, 0, 1,
-0.676406, -0.08494684, -3.043892, 0.5882353, 1, 0, 1,
-0.6718608, -0.5657563, -1.444458, 0.5843138, 1, 0, 1,
-0.6712946, 2.085887, -1.533565, 0.5764706, 1, 0, 1,
-0.667287, -0.6719748, -2.284117, 0.572549, 1, 0, 1,
-0.6649669, -0.8316444, -1.46227, 0.5647059, 1, 0, 1,
-0.6623298, -0.2558475, -1.665318, 0.5607843, 1, 0, 1,
-0.6599743, 0.1186875, -2.564446, 0.5529412, 1, 0, 1,
-0.6526641, -2.760848, -0.7181376, 0.5490196, 1, 0, 1,
-0.6522523, 0.2099569, -1.931326, 0.5411765, 1, 0, 1,
-0.6506845, 1.783497, 0.233675, 0.5372549, 1, 0, 1,
-0.6500564, 0.9080908, -0.5226293, 0.5294118, 1, 0, 1,
-0.6482468, 0.3426704, 0.5883605, 0.5254902, 1, 0, 1,
-0.6454314, -1.128561, -0.9108683, 0.5176471, 1, 0, 1,
-0.6442849, -1.275298, -3.610557, 0.5137255, 1, 0, 1,
-0.6408359, -0.3727119, -1.526455, 0.5058824, 1, 0, 1,
-0.6370436, 1.030194, -0.1497111, 0.5019608, 1, 0, 1,
-0.6342186, 0.4737737, -0.9014071, 0.4941176, 1, 0, 1,
-0.63097, -0.04343378, -3.712614, 0.4862745, 1, 0, 1,
-0.6275105, 1.174342, -1.780501, 0.4823529, 1, 0, 1,
-0.6247392, -0.06439789, -2.855795, 0.4745098, 1, 0, 1,
-0.6109727, -0.9906762, -2.961479, 0.4705882, 1, 0, 1,
-0.608454, 0.07549005, -3.479234, 0.4627451, 1, 0, 1,
-0.5961953, 1.571777, -1.796659, 0.4588235, 1, 0, 1,
-0.5889428, 1.034515, -0.06885266, 0.4509804, 1, 0, 1,
-0.5863895, 0.5962773, 0.01745918, 0.4470588, 1, 0, 1,
-0.5813565, 0.06589294, -0.5270858, 0.4392157, 1, 0, 1,
-0.5771623, -0.6735595, -2.494406, 0.4352941, 1, 0, 1,
-0.5749905, 0.1804311, -0.7400277, 0.427451, 1, 0, 1,
-0.5739215, -0.8557946, -2.506035, 0.4235294, 1, 0, 1,
-0.5641654, -0.9074882, -2.53253, 0.4156863, 1, 0, 1,
-0.5637484, -0.4651597, -2.074613, 0.4117647, 1, 0, 1,
-0.5609176, -0.1213747, -1.623656, 0.4039216, 1, 0, 1,
-0.5594042, -0.7639367, -1.704598, 0.3960784, 1, 0, 1,
-0.5570962, -0.887219, -2.668246, 0.3921569, 1, 0, 1,
-0.5554488, -0.1244848, -0.4763704, 0.3843137, 1, 0, 1,
-0.5521494, -2.071255, -3.228725, 0.3803922, 1, 0, 1,
-0.5467955, -0.6428437, -2.958363, 0.372549, 1, 0, 1,
-0.5459463, 1.685822, -0.450961, 0.3686275, 1, 0, 1,
-0.5456972, 0.6616529, -2.415788, 0.3607843, 1, 0, 1,
-0.5441719, 1.994751, 0.2030268, 0.3568628, 1, 0, 1,
-0.5412625, -0.9503984, -0.9399731, 0.3490196, 1, 0, 1,
-0.5401413, 0.7427991, -0.8543697, 0.345098, 1, 0, 1,
-0.5352186, 0.8704155, -0.2211397, 0.3372549, 1, 0, 1,
-0.5351366, -0.3830518, -1.109277, 0.3333333, 1, 0, 1,
-0.5296012, 0.3052984, -0.996218, 0.3254902, 1, 0, 1,
-0.5246773, -0.814532, -1.982497, 0.3215686, 1, 0, 1,
-0.5224547, -1.938459, -4.639493, 0.3137255, 1, 0, 1,
-0.5209257, -0.6710561, -0.9219261, 0.3098039, 1, 0, 1,
-0.5190225, -0.2117509, -2.116797, 0.3019608, 1, 0, 1,
-0.5116634, -0.4067068, -0.1097797, 0.2941177, 1, 0, 1,
-0.5074203, -1.741204, -1.736777, 0.2901961, 1, 0, 1,
-0.5069865, 0.2460791, -2.161686, 0.282353, 1, 0, 1,
-0.5051214, 1.160133, -0.01258666, 0.2784314, 1, 0, 1,
-0.5002784, 0.570579, 0.01232714, 0.2705882, 1, 0, 1,
-0.5001711, -0.9439465, -3.016008, 0.2666667, 1, 0, 1,
-0.4971866, -0.1133358, -0.822457, 0.2588235, 1, 0, 1,
-0.4953105, 0.08840613, -0.4150454, 0.254902, 1, 0, 1,
-0.493894, 0.21713, -1.276753, 0.2470588, 1, 0, 1,
-0.493352, -0.5563157, -1.541217, 0.2431373, 1, 0, 1,
-0.4858827, 0.5944505, 0.001206292, 0.2352941, 1, 0, 1,
-0.4856147, -0.1353525, -3.235686, 0.2313726, 1, 0, 1,
-0.4847259, 0.8312432, 0.2800528, 0.2235294, 1, 0, 1,
-0.4774278, -1.822128, -1.682308, 0.2196078, 1, 0, 1,
-0.4773746, -0.1785184, -2.726803, 0.2117647, 1, 0, 1,
-0.4765255, 0.3792622, -1.843431, 0.2078431, 1, 0, 1,
-0.4746524, 0.1589435, -3.400378, 0.2, 1, 0, 1,
-0.4701234, 0.7720311, -1.48936, 0.1921569, 1, 0, 1,
-0.4638982, 0.01906707, -0.6062474, 0.1882353, 1, 0, 1,
-0.4585835, 0.09719349, -0.3017967, 0.1803922, 1, 0, 1,
-0.4518799, 0.3919178, -0.6594569, 0.1764706, 1, 0, 1,
-0.4464384, 0.4249688, -0.06870462, 0.1686275, 1, 0, 1,
-0.4454477, 0.2363497, -0.1131479, 0.1647059, 1, 0, 1,
-0.4439041, -1.587842, -3.206409, 0.1568628, 1, 0, 1,
-0.4417244, -0.4018858, -0.4432099, 0.1529412, 1, 0, 1,
-0.4407171, -0.9652258, -3.712679, 0.145098, 1, 0, 1,
-0.4326509, -0.01255845, -1.340992, 0.1411765, 1, 0, 1,
-0.4325035, 0.1000154, -1.586424, 0.1333333, 1, 0, 1,
-0.431484, -0.3180925, -1.527205, 0.1294118, 1, 0, 1,
-0.4267125, 0.3423544, 0.7377211, 0.1215686, 1, 0, 1,
-0.4216214, 0.640466, -2.22949, 0.1176471, 1, 0, 1,
-0.4196265, -0.06328418, -1.340551, 0.1098039, 1, 0, 1,
-0.4160427, -1.032082, -3.089472, 0.1058824, 1, 0, 1,
-0.4142045, -0.9485555, -2.222564, 0.09803922, 1, 0, 1,
-0.4112679, 0.4239195, -1.245482, 0.09019608, 1, 0, 1,
-0.4087073, 1.063764, 0.04036964, 0.08627451, 1, 0, 1,
-0.403814, -1.644005, -1.269607, 0.07843138, 1, 0, 1,
-0.3940425, 0.6105478, 1.02573, 0.07450981, 1, 0, 1,
-0.3916242, -0.03894008, -1.473649, 0.06666667, 1, 0, 1,
-0.390776, 0.2754804, -0.06253459, 0.0627451, 1, 0, 1,
-0.3864982, 1.82594, -0.8416051, 0.05490196, 1, 0, 1,
-0.3842323, 0.3216406, 0.2251886, 0.05098039, 1, 0, 1,
-0.3817393, -1.504078, -3.277863, 0.04313726, 1, 0, 1,
-0.3734605, 0.2565267, -1.306617, 0.03921569, 1, 0, 1,
-0.3728852, -2.008788, -4.226954, 0.03137255, 1, 0, 1,
-0.372348, 0.828549, -0.6746716, 0.02745098, 1, 0, 1,
-0.3637737, 1.684305, 0.4404475, 0.01960784, 1, 0, 1,
-0.3590195, -0.1809325, -2.036887, 0.01568628, 1, 0, 1,
-0.3576306, 1.019406, -0.7197891, 0.007843138, 1, 0, 1,
-0.3555938, -0.3296474, -2.294058, 0.003921569, 1, 0, 1,
-0.3510151, 0.5613756, -1.094866, 0, 1, 0.003921569, 1,
-0.3469897, -1.757756, -2.95252, 0, 1, 0.01176471, 1,
-0.3458724, 0.05609282, -1.376904, 0, 1, 0.01568628, 1,
-0.3391211, -1.022725, -2.375977, 0, 1, 0.02352941, 1,
-0.3374237, -1.140853, -1.692614, 0, 1, 0.02745098, 1,
-0.3363145, 1.530478, 0.4178835, 0, 1, 0.03529412, 1,
-0.3353367, 0.07992997, -1.436149, 0, 1, 0.03921569, 1,
-0.3345753, 0.1383328, 0.01254716, 0, 1, 0.04705882, 1,
-0.3310317, -0.2463272, -2.757041, 0, 1, 0.05098039, 1,
-0.327471, 0.3995958, -1.398543, 0, 1, 0.05882353, 1,
-0.326187, -0.4655796, -1.478947, 0, 1, 0.0627451, 1,
-0.3259161, 0.1819278, -0.9854847, 0, 1, 0.07058824, 1,
-0.3250968, -0.6161991, -3.581028, 0, 1, 0.07450981, 1,
-0.3213941, -0.4274751, -3.448679, 0, 1, 0.08235294, 1,
-0.3194234, -0.3581759, 0.06451994, 0, 1, 0.08627451, 1,
-0.315536, -0.03000601, -1.154665, 0, 1, 0.09411765, 1,
-0.3129876, -1.255987, -1.239905, 0, 1, 0.1019608, 1,
-0.3106119, 0.3994569, -1.392953, 0, 1, 0.1058824, 1,
-0.3086259, -0.4998172, -3.868716, 0, 1, 0.1137255, 1,
-0.3058831, 0.1565179, -2.351403, 0, 1, 0.1176471, 1,
-0.3045117, -0.2330181, -2.04556, 0, 1, 0.1254902, 1,
-0.2965359, 0.1457608, -1.687503, 0, 1, 0.1294118, 1,
-0.2963071, 1.401575, 0.3687561, 0, 1, 0.1372549, 1,
-0.292348, -0.8833697, -3.604084, 0, 1, 0.1411765, 1,
-0.2888677, 0.3396668, -1.980179, 0, 1, 0.1490196, 1,
-0.2876564, -1.223164, -2.802024, 0, 1, 0.1529412, 1,
-0.2874584, 1.081367, 0.27315, 0, 1, 0.1607843, 1,
-0.2834797, 0.2019389, -0.2963021, 0, 1, 0.1647059, 1,
-0.2834505, -0.0902477, -1.711544, 0, 1, 0.172549, 1,
-0.2828828, 0.5300716, -1.000105, 0, 1, 0.1764706, 1,
-0.2808149, 1.240656, -0.4001768, 0, 1, 0.1843137, 1,
-0.2780917, 1.070128, -0.8486606, 0, 1, 0.1882353, 1,
-0.2776344, 0.9644141, -2.423797, 0, 1, 0.1960784, 1,
-0.2750222, 0.9655288, 1.263835, 0, 1, 0.2039216, 1,
-0.2715136, 0.946395, -0.750505, 0, 1, 0.2078431, 1,
-0.2709479, -0.3843346, -1.362521, 0, 1, 0.2156863, 1,
-0.2699455, -0.2798534, -3.751552, 0, 1, 0.2196078, 1,
-0.268238, 0.07571267, -0.1035144, 0, 1, 0.227451, 1,
-0.2602523, 0.3797794, 0.008916713, 0, 1, 0.2313726, 1,
-0.2589924, 1.023583, 0.1110671, 0, 1, 0.2392157, 1,
-0.2540666, -0.2863222, -3.309417, 0, 1, 0.2431373, 1,
-0.2535828, 0.946655, 0.8311774, 0, 1, 0.2509804, 1,
-0.2527403, -0.6360037, -3.635799, 0, 1, 0.254902, 1,
-0.251808, -0.04454754, -0.06230009, 0, 1, 0.2627451, 1,
-0.248765, -0.6368442, -2.983424, 0, 1, 0.2666667, 1,
-0.2415667, -1.450517, -2.239906, 0, 1, 0.2745098, 1,
-0.2390262, -0.2460031, -3.147595, 0, 1, 0.2784314, 1,
-0.2347365, 0.1967625, -1.39694, 0, 1, 0.2862745, 1,
-0.229298, -0.8584482, -1.849701, 0, 1, 0.2901961, 1,
-0.2281442, 0.9782099, -0.03322727, 0, 1, 0.2980392, 1,
-0.2262964, 0.1394439, -1.299014, 0, 1, 0.3058824, 1,
-0.2237798, -0.4971329, -0.7451122, 0, 1, 0.3098039, 1,
-0.2225173, -0.9804134, -3.962366, 0, 1, 0.3176471, 1,
-0.2200082, -0.5190407, -2.808155, 0, 1, 0.3215686, 1,
-0.2154655, -0.9069175, -3.110324, 0, 1, 0.3294118, 1,
-0.2136026, 0.455646, -0.5719829, 0, 1, 0.3333333, 1,
-0.2028043, -1.998165, -1.407362, 0, 1, 0.3411765, 1,
-0.1938694, 0.8182331, 0.8152986, 0, 1, 0.345098, 1,
-0.1895824, -0.165891, -3.058001, 0, 1, 0.3529412, 1,
-0.188836, 1.590546, -0.002398361, 0, 1, 0.3568628, 1,
-0.1879447, 1.737056, -0.9126045, 0, 1, 0.3647059, 1,
-0.1849167, 0.1975127, -0.4112354, 0, 1, 0.3686275, 1,
-0.1805413, -1.364697, -3.517387, 0, 1, 0.3764706, 1,
-0.175769, 0.4668797, -0.5571766, 0, 1, 0.3803922, 1,
-0.1735872, 0.3693922, 1.318289, 0, 1, 0.3882353, 1,
-0.1720236, 0.6696115, 0.2545496, 0, 1, 0.3921569, 1,
-0.1715965, 0.1426981, -1.086029, 0, 1, 0.4, 1,
-0.1714204, -1.677719, -5.030293, 0, 1, 0.4078431, 1,
-0.1664718, -0.6220168, -4.092909, 0, 1, 0.4117647, 1,
-0.1658843, -0.2155751, -3.206823, 0, 1, 0.4196078, 1,
-0.1655711, -2.701448, -3.216365, 0, 1, 0.4235294, 1,
-0.1650293, -0.7355502, -2.392056, 0, 1, 0.4313726, 1,
-0.1627105, 2.104304, 0.7346417, 0, 1, 0.4352941, 1,
-0.1616928, 0.302229, -0.3776786, 0, 1, 0.4431373, 1,
-0.1613334, 0.2734692, 0.4930578, 0, 1, 0.4470588, 1,
-0.1612292, 1.357427, 0.2497929, 0, 1, 0.454902, 1,
-0.1608213, -1.409454, -2.273281, 0, 1, 0.4588235, 1,
-0.1567717, -1.199029, -0.6645734, 0, 1, 0.4666667, 1,
-0.1567181, -0.1876296, -3.037646, 0, 1, 0.4705882, 1,
-0.1541486, 0.9150455, 0.06141417, 0, 1, 0.4784314, 1,
-0.1511614, 0.6138881, -0.7045944, 0, 1, 0.4823529, 1,
-0.1448419, 0.8997437, -0.2733838, 0, 1, 0.4901961, 1,
-0.1442931, -0.04919114, -1.593246, 0, 1, 0.4941176, 1,
-0.1440715, 1.543875, -0.5865804, 0, 1, 0.5019608, 1,
-0.1326351, 0.01027695, -2.730759, 0, 1, 0.509804, 1,
-0.1282643, 0.5263846, 1.869925, 0, 1, 0.5137255, 1,
-0.1281446, -0.3764537, -1.875178, 0, 1, 0.5215687, 1,
-0.1164257, -0.9521753, -4.242013, 0, 1, 0.5254902, 1,
-0.1118875, -0.4346685, -3.701382, 0, 1, 0.5333334, 1,
-0.1098475, -0.6656407, -3.249311, 0, 1, 0.5372549, 1,
-0.1079399, -0.5103576, -4.642848, 0, 1, 0.5450981, 1,
-0.1048065, -0.1147165, -0.6619835, 0, 1, 0.5490196, 1,
-0.1028029, 0.164678, -1.14061, 0, 1, 0.5568628, 1,
-0.102047, 1.183226, -0.4312463, 0, 1, 0.5607843, 1,
-0.09817132, 0.7159469, -0.7187515, 0, 1, 0.5686275, 1,
-0.09815335, 1.388621, -2.120588, 0, 1, 0.572549, 1,
-0.09614418, 0.8524925, -0.002625078, 0, 1, 0.5803922, 1,
-0.09162908, 0.5912043, -0.318225, 0, 1, 0.5843138, 1,
-0.08930622, -0.6579742, -3.303888, 0, 1, 0.5921569, 1,
-0.08652545, -0.7528569, -2.237708, 0, 1, 0.5960785, 1,
-0.08364109, -0.8926612, -2.37464, 0, 1, 0.6039216, 1,
-0.08315477, 0.5867686, -1.135585, 0, 1, 0.6117647, 1,
-0.08083012, 0.7307212, 0.5009968, 0, 1, 0.6156863, 1,
-0.08079207, -1.248342, -3.536875, 0, 1, 0.6235294, 1,
-0.07631221, -0.1492452, -3.480041, 0, 1, 0.627451, 1,
-0.07258701, 0.77979, 0.1575026, 0, 1, 0.6352941, 1,
-0.07161469, -0.114524, -2.273727, 0, 1, 0.6392157, 1,
-0.07026396, -0.670164, -1.069608, 0, 1, 0.6470588, 1,
-0.06364442, 0.906188, -0.3768702, 0, 1, 0.6509804, 1,
-0.05547255, 1.103944, 1.712153, 0, 1, 0.6588235, 1,
-0.054557, 2.335917, 1.369391, 0, 1, 0.6627451, 1,
-0.05127476, -0.4772908, -3.504845, 0, 1, 0.6705883, 1,
-0.05029765, 0.3128838, 1.336654, 0, 1, 0.6745098, 1,
-0.04861846, -0.7592174, -4.743142, 0, 1, 0.682353, 1,
-0.04627744, -1.132561, -3.068434, 0, 1, 0.6862745, 1,
-0.04257732, 0.1605456, 1.876644, 0, 1, 0.6941177, 1,
-0.03935174, -0.4487571, -3.855618, 0, 1, 0.7019608, 1,
-0.03495507, -0.6813518, -2.039881, 0, 1, 0.7058824, 1,
-0.03402269, -0.5611815, -1.168082, 0, 1, 0.7137255, 1,
-0.03076724, -1.398998, -2.924962, 0, 1, 0.7176471, 1,
-0.02950706, -0.02476185, -2.209418, 0, 1, 0.7254902, 1,
-0.02571009, 2.024816, -1.7016, 0, 1, 0.7294118, 1,
-0.02172629, 0.7950074, -0.3695023, 0, 1, 0.7372549, 1,
-0.02160664, 0.01127404, -0.351916, 0, 1, 0.7411765, 1,
-0.01790283, 0.03916394, 0.5754266, 0, 1, 0.7490196, 1,
-0.01482778, 0.3963817, -0.8167587, 0, 1, 0.7529412, 1,
-0.01117231, 0.1987223, -0.7523428, 0, 1, 0.7607843, 1,
-0.01111187, 0.5495213, -1.258838, 0, 1, 0.7647059, 1,
-0.01066821, -0.09718396, -2.743852, 0, 1, 0.772549, 1,
-0.01047314, -0.8145626, -1.892013, 0, 1, 0.7764706, 1,
-0.007813063, -0.6729622, -2.963124, 0, 1, 0.7843137, 1,
-0.007037426, -0.03043, -2.572936, 0, 1, 0.7882353, 1,
-0.004765975, -0.6301531, -3.342635, 0, 1, 0.7960784, 1,
0.01058862, 1.154512, -0.001362885, 0, 1, 0.8039216, 1,
0.01432384, 1.01648, 0.7370161, 0, 1, 0.8078431, 1,
0.0153443, 0.5322393, -0.2571434, 0, 1, 0.8156863, 1,
0.01587045, 2.077272, 0.01997043, 0, 1, 0.8196079, 1,
0.01609333, 2.14267, 1.248102, 0, 1, 0.827451, 1,
0.01752617, -0.793559, 0.9236662, 0, 1, 0.8313726, 1,
0.01872136, 1.766439, 0.57275, 0, 1, 0.8392157, 1,
0.02406213, -0.2679606, 3.523122, 0, 1, 0.8431373, 1,
0.02428484, 1.349334, -0.1580959, 0, 1, 0.8509804, 1,
0.02518738, -2.252399, 2.257628, 0, 1, 0.854902, 1,
0.02682063, 1.322388, 0.4146426, 0, 1, 0.8627451, 1,
0.03431724, -0.9248472, 2.459303, 0, 1, 0.8666667, 1,
0.03656738, 0.09326928, -1.847514, 0, 1, 0.8745098, 1,
0.03847244, 0.7235073, -0.4884291, 0, 1, 0.8784314, 1,
0.04167086, 0.07465745, -1.146677, 0, 1, 0.8862745, 1,
0.04588915, 0.8100445, 0.4565825, 0, 1, 0.8901961, 1,
0.04869332, -1.004517, 2.862806, 0, 1, 0.8980392, 1,
0.04893826, 2.320396, 2.474124, 0, 1, 0.9058824, 1,
0.05564351, 0.4774766, 1.354069, 0, 1, 0.9098039, 1,
0.05666507, -1.455626, 3.09249, 0, 1, 0.9176471, 1,
0.06032718, -1.123653, 4.514969, 0, 1, 0.9215686, 1,
0.06546033, 0.1317456, 2.156234, 0, 1, 0.9294118, 1,
0.06665504, -0.6620212, 2.17652, 0, 1, 0.9333333, 1,
0.06964588, -0.489456, 3.305363, 0, 1, 0.9411765, 1,
0.07258344, -0.5632566, 3.073309, 0, 1, 0.945098, 1,
0.07305029, -1.338692, 4.010109, 0, 1, 0.9529412, 1,
0.07604209, 1.011062, -0.2704312, 0, 1, 0.9568627, 1,
0.07766028, -1.424584, 1.301498, 0, 1, 0.9647059, 1,
0.07810517, 2.031397, -0.3267125, 0, 1, 0.9686275, 1,
0.07900116, 0.9214041, 0.1752795, 0, 1, 0.9764706, 1,
0.08040218, 0.4865987, -0.2400811, 0, 1, 0.9803922, 1,
0.08275578, 0.06053844, 0.2308998, 0, 1, 0.9882353, 1,
0.08714344, -0.1422032, 2.519021, 0, 1, 0.9921569, 1,
0.08726364, -0.118057, 1.903964, 0, 1, 1, 1,
0.0886233, 0.179286, 0.2767147, 0, 0.9921569, 1, 1,
0.08987547, -0.9992045, 3.946752, 0, 0.9882353, 1, 1,
0.09114964, 0.9508724, 0.1232809, 0, 0.9803922, 1, 1,
0.09344256, 0.8800953, 1.725307, 0, 0.9764706, 1, 1,
0.09466226, -1.999447, 5.016926, 0, 0.9686275, 1, 1,
0.0961456, -0.8506454, 2.461264, 0, 0.9647059, 1, 1,
0.09708181, -0.6604257, 3.189215, 0, 0.9568627, 1, 1,
0.09725839, -0.9979284, 1.100057, 0, 0.9529412, 1, 1,
0.1001299, 0.3231106, 0.8659387, 0, 0.945098, 1, 1,
0.1018709, -0.7905345, 4.007935, 0, 0.9411765, 1, 1,
0.1089497, 0.9819043, 0.654751, 0, 0.9333333, 1, 1,
0.1107808, -1.398974, 2.196568, 0, 0.9294118, 1, 1,
0.1125901, 0.8806947, -1.364587, 0, 0.9215686, 1, 1,
0.1143928, -1.408288, 1.89245, 0, 0.9176471, 1, 1,
0.1167952, 1.180893, 0.8515428, 0, 0.9098039, 1, 1,
0.1209214, 1.342897, -0.143787, 0, 0.9058824, 1, 1,
0.1212097, -1.148439, 3.406005, 0, 0.8980392, 1, 1,
0.1217148, 0.8429676, -0.883498, 0, 0.8901961, 1, 1,
0.1238933, 0.5125837, -0.2767574, 0, 0.8862745, 1, 1,
0.125531, -1.664958, 2.554979, 0, 0.8784314, 1, 1,
0.1256228, -0.7348054, 2.348969, 0, 0.8745098, 1, 1,
0.1265896, -0.6624959, 3.432928, 0, 0.8666667, 1, 1,
0.127362, 0.9004558, -0.8773709, 0, 0.8627451, 1, 1,
0.1295872, 2.580271, 2.652343, 0, 0.854902, 1, 1,
0.1299095, -1.848238, 1.731483, 0, 0.8509804, 1, 1,
0.1411461, 0.237578, 0.4634965, 0, 0.8431373, 1, 1,
0.1475924, 0.008684577, 2.893813, 0, 0.8392157, 1, 1,
0.1482917, -1.522077, 3.950315, 0, 0.8313726, 1, 1,
0.1483592, 1.800744, -0.03121135, 0, 0.827451, 1, 1,
0.1489888, -0.8943961, 2.871405, 0, 0.8196079, 1, 1,
0.152263, -0.2743846, 1.005683, 0, 0.8156863, 1, 1,
0.1551632, 0.184191, 2.039919, 0, 0.8078431, 1, 1,
0.155317, 0.9991633, -0.2512106, 0, 0.8039216, 1, 1,
0.1564611, -1.465934, 3.387691, 0, 0.7960784, 1, 1,
0.1600405, 1.290858, -0.688307, 0, 0.7882353, 1, 1,
0.1601888, -0.2944193, 1.272174, 0, 0.7843137, 1, 1,
0.1640553, -0.3496908, 0.971389, 0, 0.7764706, 1, 1,
0.1649911, -0.4621821, 2.718036, 0, 0.772549, 1, 1,
0.1696102, -0.01252403, 3.447315, 0, 0.7647059, 1, 1,
0.1721482, -1.379226, 4.716014, 0, 0.7607843, 1, 1,
0.1794432, -2.061862, 2.09682, 0, 0.7529412, 1, 1,
0.1822958, 1.031076, 0.04567004, 0, 0.7490196, 1, 1,
0.1827489, 0.7096469, 1.824155, 0, 0.7411765, 1, 1,
0.1829329, 0.5486314, 0.0004016273, 0, 0.7372549, 1, 1,
0.1865404, 0.8693166, -0.1897881, 0, 0.7294118, 1, 1,
0.1894198, 0.5148401, 2.409346, 0, 0.7254902, 1, 1,
0.1993121, 0.1533801, 1.477949, 0, 0.7176471, 1, 1,
0.2015197, -0.9513145, 1.688953, 0, 0.7137255, 1, 1,
0.2118614, 0.1136258, 1.15892, 0, 0.7058824, 1, 1,
0.2119523, 0.5823421, 0.972526, 0, 0.6980392, 1, 1,
0.2153295, 0.4754144, -0.05124942, 0, 0.6941177, 1, 1,
0.2177036, 0.6918777, -0.7005595, 0, 0.6862745, 1, 1,
0.2202701, -0.1111122, 3.95499, 0, 0.682353, 1, 1,
0.2208345, -1.311127, 2.982817, 0, 0.6745098, 1, 1,
0.2243086, 0.2939495, -0.1172049, 0, 0.6705883, 1, 1,
0.2292157, -0.02083932, 2.237587, 0, 0.6627451, 1, 1,
0.23409, 0.1469083, 0.6867313, 0, 0.6588235, 1, 1,
0.2346262, -1.672064, 3.265801, 0, 0.6509804, 1, 1,
0.2363138, -0.6602929, 3.333491, 0, 0.6470588, 1, 1,
0.2404187, 1.493533, 0.4233464, 0, 0.6392157, 1, 1,
0.24169, 0.3752115, 0.3993428, 0, 0.6352941, 1, 1,
0.2501183, 1.192142, -0.8602216, 0, 0.627451, 1, 1,
0.2506026, -1.383989, 1.358577, 0, 0.6235294, 1, 1,
0.251327, 1.55219, 1.251862, 0, 0.6156863, 1, 1,
0.2522717, 0.04144409, 1.528783, 0, 0.6117647, 1, 1,
0.2526752, 0.02899064, 2.130113, 0, 0.6039216, 1, 1,
0.2558901, 0.1716093, 1.934751, 0, 0.5960785, 1, 1,
0.2565082, -1.441225, 2.725641, 0, 0.5921569, 1, 1,
0.2588249, 2.697458, -0.4280213, 0, 0.5843138, 1, 1,
0.2597112, -0.06384224, -0.1286827, 0, 0.5803922, 1, 1,
0.2604707, -0.688836, 4.339227, 0, 0.572549, 1, 1,
0.2605686, -0.3023216, 2.785784, 0, 0.5686275, 1, 1,
0.2655626, -0.62618, 4.135788, 0, 0.5607843, 1, 1,
0.2697504, 0.5922377, 1.778131, 0, 0.5568628, 1, 1,
0.2708739, -1.139911, 6.20426, 0, 0.5490196, 1, 1,
0.2711284, 2.238166, -0.1071246, 0, 0.5450981, 1, 1,
0.2718273, 0.3003078, 1.456842, 0, 0.5372549, 1, 1,
0.2722987, 0.08523235, 0.05994127, 0, 0.5333334, 1, 1,
0.2765783, 1.216205, -0.5272437, 0, 0.5254902, 1, 1,
0.2786517, -0.1056074, 0.4935681, 0, 0.5215687, 1, 1,
0.2802469, 0.1068528, 2.17283, 0, 0.5137255, 1, 1,
0.2808033, 0.414969, -0.02790056, 0, 0.509804, 1, 1,
0.2828598, 0.4518104, 0.1155082, 0, 0.5019608, 1, 1,
0.2832272, 1.123241, 0.7085413, 0, 0.4941176, 1, 1,
0.2841293, -0.9670584, 3.877877, 0, 0.4901961, 1, 1,
0.2851751, -0.2718845, 1.421202, 0, 0.4823529, 1, 1,
0.2966116, -0.1190974, 2.660087, 0, 0.4784314, 1, 1,
0.2975264, -1.313332, 2.583724, 0, 0.4705882, 1, 1,
0.2987987, -0.1175224, 1.427862, 0, 0.4666667, 1, 1,
0.3001134, 0.6388682, -0.6813338, 0, 0.4588235, 1, 1,
0.311415, 0.9126456, 0.8982536, 0, 0.454902, 1, 1,
0.3130321, 0.2230902, 2.713685, 0, 0.4470588, 1, 1,
0.3186762, 1.226643, 0.2291003, 0, 0.4431373, 1, 1,
0.3197375, -0.6843143, 1.338022, 0, 0.4352941, 1, 1,
0.3202033, -1.007019, 3.034889, 0, 0.4313726, 1, 1,
0.3215692, -0.4693709, 2.488304, 0, 0.4235294, 1, 1,
0.3294151, -1.035004, 5.406779, 0, 0.4196078, 1, 1,
0.3311964, 0.8514233, 0.6355634, 0, 0.4117647, 1, 1,
0.3312645, 0.2728503, -0.8942084, 0, 0.4078431, 1, 1,
0.3369599, -1.526153, 2.939581, 0, 0.4, 1, 1,
0.3421642, 0.1473871, 0.7334046, 0, 0.3921569, 1, 1,
0.3428343, -0.4534529, 2.788648, 0, 0.3882353, 1, 1,
0.3440642, 0.819803, 1.725808, 0, 0.3803922, 1, 1,
0.3452162, -0.8494225, 1.414142, 0, 0.3764706, 1, 1,
0.3514025, -0.6050117, 2.937993, 0, 0.3686275, 1, 1,
0.3525854, -0.07762308, 2.098805, 0, 0.3647059, 1, 1,
0.3559005, 0.4286073, -0.1373057, 0, 0.3568628, 1, 1,
0.3560866, 0.2271213, 2.477772, 0, 0.3529412, 1, 1,
0.3607122, -0.573117, 3.799652, 0, 0.345098, 1, 1,
0.3619496, 0.3151183, 1.830137, 0, 0.3411765, 1, 1,
0.3622772, -1.397384, 0.7714187, 0, 0.3333333, 1, 1,
0.3625854, 1.688433, -2.656923, 0, 0.3294118, 1, 1,
0.3674766, 0.4743904, -0.4374522, 0, 0.3215686, 1, 1,
0.3782539, -0.3209401, 3.657429, 0, 0.3176471, 1, 1,
0.3806354, -0.6035854, 1.290806, 0, 0.3098039, 1, 1,
0.3848259, 2.578, -0.1541847, 0, 0.3058824, 1, 1,
0.3856159, -0.3257265, 1.330448, 0, 0.2980392, 1, 1,
0.3861596, 1.000928, 0.4076718, 0, 0.2901961, 1, 1,
0.3903691, -0.04226964, 2.392627, 0, 0.2862745, 1, 1,
0.391527, 2.281762, -0.6398305, 0, 0.2784314, 1, 1,
0.3938072, 1.32809, 0.8072651, 0, 0.2745098, 1, 1,
0.3960216, 0.2299459, 0.8258209, 0, 0.2666667, 1, 1,
0.4030876, 0.3928514, 1.432817, 0, 0.2627451, 1, 1,
0.4070596, 0.6775327, 0.8974513, 0, 0.254902, 1, 1,
0.4131447, 0.1544041, 1.455926, 0, 0.2509804, 1, 1,
0.4149386, 0.7206399, 2.176249, 0, 0.2431373, 1, 1,
0.4156643, -0.2699521, 2.524531, 0, 0.2392157, 1, 1,
0.418157, 0.1494792, 1.551478, 0, 0.2313726, 1, 1,
0.4211436, -0.06287054, 0.7833605, 0, 0.227451, 1, 1,
0.4236445, 0.1775093, 1.482447, 0, 0.2196078, 1, 1,
0.4266925, 1.259543, -0.08703818, 0, 0.2156863, 1, 1,
0.42986, 1.047904, 0.2775381, 0, 0.2078431, 1, 1,
0.4325499, 0.5045208, 1.337134, 0, 0.2039216, 1, 1,
0.4332748, 1.142553, -1.300964, 0, 0.1960784, 1, 1,
0.4335115, -2.617337, 4.383176, 0, 0.1882353, 1, 1,
0.4336864, 1.25313, 0.8242748, 0, 0.1843137, 1, 1,
0.434548, 0.5865369, -0.0819771, 0, 0.1764706, 1, 1,
0.4347906, 0.2536496, 1.406647, 0, 0.172549, 1, 1,
0.4373149, 0.8022445, 1.383996, 0, 0.1647059, 1, 1,
0.439918, -0.237792, 2.553682, 0, 0.1607843, 1, 1,
0.4409962, 1.653622, 0.9659115, 0, 0.1529412, 1, 1,
0.4425691, -1.218709, 3.335159, 0, 0.1490196, 1, 1,
0.4437088, -2.35323, 4.61884, 0, 0.1411765, 1, 1,
0.4486578, -0.2377081, 0.787676, 0, 0.1372549, 1, 1,
0.4516598, -0.3996965, 2.332913, 0, 0.1294118, 1, 1,
0.4518533, 0.5178431, 0.8873238, 0, 0.1254902, 1, 1,
0.4554959, 1.124024, 1.51014, 0, 0.1176471, 1, 1,
0.456314, 1.655209, 2.273376, 0, 0.1137255, 1, 1,
0.4579477, -1.23375, 1.285555, 0, 0.1058824, 1, 1,
0.4585536, -0.04752263, 1.847396, 0, 0.09803922, 1, 1,
0.4622311, -1.047992, 2.663505, 0, 0.09411765, 1, 1,
0.466859, 1.042067, 1.70276, 0, 0.08627451, 1, 1,
0.4686112, -1.249612, 2.569116, 0, 0.08235294, 1, 1,
0.4698249, -0.4340445, 1.993103, 0, 0.07450981, 1, 1,
0.4731247, 1.844969, 0.9249765, 0, 0.07058824, 1, 1,
0.4745368, 0.5144699, 1.717468, 0, 0.0627451, 1, 1,
0.4825427, -1.816744, 3.977859, 0, 0.05882353, 1, 1,
0.48259, -0.8279052, 3.080278, 0, 0.05098039, 1, 1,
0.4862546, 0.3641283, -0.4607655, 0, 0.04705882, 1, 1,
0.4885131, 0.4682146, 2.095803, 0, 0.03921569, 1, 1,
0.4895154, -0.2704785, 3.483854, 0, 0.03529412, 1, 1,
0.4901365, 0.2358359, 1.474555, 0, 0.02745098, 1, 1,
0.4910254, -0.6684582, 3.81556, 0, 0.02352941, 1, 1,
0.4920405, 0.09819613, 0.9902765, 0, 0.01568628, 1, 1,
0.4929914, -0.8267279, 2.417737, 0, 0.01176471, 1, 1,
0.4932872, 0.1267002, -0.6319532, 0, 0.003921569, 1, 1,
0.4939964, 1.167972, 0.7418853, 0.003921569, 0, 1, 1,
0.4952819, 0.03514537, 3.961813, 0.007843138, 0, 1, 1,
0.5001718, -0.0748634, 0.2615536, 0.01568628, 0, 1, 1,
0.501951, -0.8644887, 2.481293, 0.01960784, 0, 1, 1,
0.504544, -0.542353, 2.079249, 0.02745098, 0, 1, 1,
0.5064477, 2.028096, 0.8091269, 0.03137255, 0, 1, 1,
0.5109559, 0.2574481, 0.4612658, 0.03921569, 0, 1, 1,
0.513595, -0.5269512, 2.085174, 0.04313726, 0, 1, 1,
0.5158839, 1.3046, 1.361503, 0.05098039, 0, 1, 1,
0.517714, 2.783081, 0.1665098, 0.05490196, 0, 1, 1,
0.5206119, -1.637258, 2.349227, 0.0627451, 0, 1, 1,
0.5207277, -0.01409772, 2.868179, 0.06666667, 0, 1, 1,
0.5215022, 0.9059057, 0.8490039, 0.07450981, 0, 1, 1,
0.5226316, 1.233286, 2.070982, 0.07843138, 0, 1, 1,
0.5314137, -0.4935869, 3.442785, 0.08627451, 0, 1, 1,
0.5325944, 1.305995, 0.7933716, 0.09019608, 0, 1, 1,
0.5332017, 0.9732493, 1.140059, 0.09803922, 0, 1, 1,
0.5332662, 0.3144996, 2.8652, 0.1058824, 0, 1, 1,
0.5362038, 0.1536689, -0.5295604, 0.1098039, 0, 1, 1,
0.5382254, -1.76347, 3.795244, 0.1176471, 0, 1, 1,
0.5391091, -0.3221011, 3.909257, 0.1215686, 0, 1, 1,
0.544776, -0.3282143, 1.689114, 0.1294118, 0, 1, 1,
0.545063, -1.092553, 3.57808, 0.1333333, 0, 1, 1,
0.5451139, -0.1553997, 1.700822, 0.1411765, 0, 1, 1,
0.5497491, 0.4230253, 1.144256, 0.145098, 0, 1, 1,
0.5566465, -0.02528378, 1.904485, 0.1529412, 0, 1, 1,
0.5601328, 0.1817348, 1.662458, 0.1568628, 0, 1, 1,
0.5604643, 0.4616669, 1.005988, 0.1647059, 0, 1, 1,
0.5656359, -0.5770276, 1.212185, 0.1686275, 0, 1, 1,
0.5674241, 0.3077163, 0.66184, 0.1764706, 0, 1, 1,
0.5748692, -0.7631691, 3.401889, 0.1803922, 0, 1, 1,
0.5817237, 0.9101106, 1.214535, 0.1882353, 0, 1, 1,
0.5846577, 1.574406, 1.470998, 0.1921569, 0, 1, 1,
0.588186, -1.293936, 2.820144, 0.2, 0, 1, 1,
0.5893657, -0.5270629, 1.640494, 0.2078431, 0, 1, 1,
0.5910688, 0.7994522, 0.9006553, 0.2117647, 0, 1, 1,
0.5923336, 2.408359, 1.269808, 0.2196078, 0, 1, 1,
0.5945598, -0.1595106, 0.8598185, 0.2235294, 0, 1, 1,
0.5975024, 1.303546, 0.4587965, 0.2313726, 0, 1, 1,
0.6012926, 0.1946697, 2.168718, 0.2352941, 0, 1, 1,
0.6044195, -1.46825, 2.291478, 0.2431373, 0, 1, 1,
0.6052037, -0.9651554, 2.6955, 0.2470588, 0, 1, 1,
0.6059831, 0.4728127, 1.283873, 0.254902, 0, 1, 1,
0.6123422, 0.4122607, -0.486406, 0.2588235, 0, 1, 1,
0.6140088, 1.847043, -1.64124, 0.2666667, 0, 1, 1,
0.6239917, 0.05372556, 0.7635069, 0.2705882, 0, 1, 1,
0.6249493, 0.6494963, 0.5359418, 0.2784314, 0, 1, 1,
0.6273921, 0.4046183, 0.5470225, 0.282353, 0, 1, 1,
0.6311484, -0.1509048, 3.897053, 0.2901961, 0, 1, 1,
0.6312521, -0.6291071, 0.7445855, 0.2941177, 0, 1, 1,
0.6324908, -0.658347, 3.811052, 0.3019608, 0, 1, 1,
0.6342698, 0.3761959, 1.524312, 0.3098039, 0, 1, 1,
0.6393756, -0.7463582, 2.369927, 0.3137255, 0, 1, 1,
0.6422754, 0.8855271, 0.05604165, 0.3215686, 0, 1, 1,
0.6424345, -1.367104, 2.694022, 0.3254902, 0, 1, 1,
0.6453004, -0.8491325, 4.956983, 0.3333333, 0, 1, 1,
0.6503875, 0.5977129, 1.273626, 0.3372549, 0, 1, 1,
0.6523204, -0.812355, 2.832022, 0.345098, 0, 1, 1,
0.6526462, 0.3342523, 1.30322, 0.3490196, 0, 1, 1,
0.6580975, -0.3605348, 2.50528, 0.3568628, 0, 1, 1,
0.6592703, 0.7824229, 1.912735, 0.3607843, 0, 1, 1,
0.6633571, -0.1405761, 2.553582, 0.3686275, 0, 1, 1,
0.6649589, -0.2619414, 2.03537, 0.372549, 0, 1, 1,
0.6663104, -0.661961, 2.885822, 0.3803922, 0, 1, 1,
0.6708886, -0.3854094, -0.3525456, 0.3843137, 0, 1, 1,
0.6818607, -0.4045644, 1.02463, 0.3921569, 0, 1, 1,
0.684305, 0.2298494, 1.15464, 0.3960784, 0, 1, 1,
0.6891479, -0.7920237, 3.560127, 0.4039216, 0, 1, 1,
0.6919521, 0.636257, 2.81375, 0.4117647, 0, 1, 1,
0.6926361, 0.0893101, 1.357287, 0.4156863, 0, 1, 1,
0.6956857, 0.5217827, -0.02411715, 0.4235294, 0, 1, 1,
0.6958422, -0.5518366, 1.926616, 0.427451, 0, 1, 1,
0.7023024, -0.5203382, 0.8357174, 0.4352941, 0, 1, 1,
0.7027538, 0.5206545, 1.560958, 0.4392157, 0, 1, 1,
0.703207, -1.859165, 0.3936894, 0.4470588, 0, 1, 1,
0.7098119, 0.8047106, 0.6948377, 0.4509804, 0, 1, 1,
0.7100807, -1.193253, 3.206453, 0.4588235, 0, 1, 1,
0.7129104, -0.7684203, 2.013647, 0.4627451, 0, 1, 1,
0.7216836, -0.3249002, 2.221001, 0.4705882, 0, 1, 1,
0.7237314, -0.1180006, 0.3343284, 0.4745098, 0, 1, 1,
0.7241336, 0.9730442, 1.244763, 0.4823529, 0, 1, 1,
0.7243358, 1.577896, -0.5230852, 0.4862745, 0, 1, 1,
0.7257056, 1.600049, 0.4504668, 0.4941176, 0, 1, 1,
0.7318763, -0.282277, 1.302002, 0.5019608, 0, 1, 1,
0.7327835, -0.1123699, -0.08774491, 0.5058824, 0, 1, 1,
0.7357731, -1.275157, 1.478521, 0.5137255, 0, 1, 1,
0.7382996, 0.8494442, 0.4419016, 0.5176471, 0, 1, 1,
0.7405322, 0.4649174, 1.794724, 0.5254902, 0, 1, 1,
0.7452297, 0.1137898, 2.279426, 0.5294118, 0, 1, 1,
0.751121, 0.5602557, -0.8650318, 0.5372549, 0, 1, 1,
0.7521101, -0.2802155, 1.341654, 0.5411765, 0, 1, 1,
0.754561, -1.083259, 2.495696, 0.5490196, 0, 1, 1,
0.7548066, 1.070847, 0.4972109, 0.5529412, 0, 1, 1,
0.755688, -1.194252, 3.156341, 0.5607843, 0, 1, 1,
0.7587076, 1.340861, -0.3020481, 0.5647059, 0, 1, 1,
0.7588894, 1.814854, 0.6730808, 0.572549, 0, 1, 1,
0.7595699, -0.6396652, 1.91529, 0.5764706, 0, 1, 1,
0.7644842, 0.6506499, -0.03061121, 0.5843138, 0, 1, 1,
0.7647381, -0.1772228, 1.392767, 0.5882353, 0, 1, 1,
0.7658572, 0.4538632, 0.0243372, 0.5960785, 0, 1, 1,
0.7674875, -0.4853866, 2.044114, 0.6039216, 0, 1, 1,
0.7679483, 0.2609184, 0.9780723, 0.6078432, 0, 1, 1,
0.76802, 0.8250505, 0.6118807, 0.6156863, 0, 1, 1,
0.7701022, 1.657083, -0.09032841, 0.6196079, 0, 1, 1,
0.7745973, 1.022695, -0.175966, 0.627451, 0, 1, 1,
0.7750142, -0.03484067, 0.01543025, 0.6313726, 0, 1, 1,
0.7764664, -0.1178699, 1.669504, 0.6392157, 0, 1, 1,
0.7773709, -0.2839493, 0.2194668, 0.6431373, 0, 1, 1,
0.7819187, 1.685757, 0.8469782, 0.6509804, 0, 1, 1,
0.7896197, -0.9032004, 1.398561, 0.654902, 0, 1, 1,
0.7934378, 1.090723, 0.9051755, 0.6627451, 0, 1, 1,
0.7934548, 0.7155792, 1.274459, 0.6666667, 0, 1, 1,
0.7993793, -2.083435, 3.447353, 0.6745098, 0, 1, 1,
0.7996209, 0.6861836, 0.9986392, 0.6784314, 0, 1, 1,
0.8042911, -1.729317, 1.969228, 0.6862745, 0, 1, 1,
0.8058439, 0.004083181, 0.4909366, 0.6901961, 0, 1, 1,
0.8073602, 0.1911688, 1.244784, 0.6980392, 0, 1, 1,
0.8080611, -0.1510828, 1.222961, 0.7058824, 0, 1, 1,
0.8091407, 2.011544, -0.07244186, 0.7098039, 0, 1, 1,
0.8138383, 1.22665, -0.5126486, 0.7176471, 0, 1, 1,
0.8208105, -0.3674915, 3.504899, 0.7215686, 0, 1, 1,
0.8214203, 0.9191217, 0.4031726, 0.7294118, 0, 1, 1,
0.8256475, 0.336644, 0.9382777, 0.7333333, 0, 1, 1,
0.8298006, -0.8551038, 3.04455, 0.7411765, 0, 1, 1,
0.8414325, -0.2043509, -0.3876536, 0.7450981, 0, 1, 1,
0.8419632, 0.02182484, 1.695509, 0.7529412, 0, 1, 1,
0.8500911, 0.7295233, 1.041172, 0.7568628, 0, 1, 1,
0.8557539, 0.8041964, 1.511778, 0.7647059, 0, 1, 1,
0.8563423, -1.179079, 3.486312, 0.7686275, 0, 1, 1,
0.8576049, 0.151871, 0.4161444, 0.7764706, 0, 1, 1,
0.8608284, -0.6146454, -1.354323, 0.7803922, 0, 1, 1,
0.870843, 0.9710145, -0.5766761, 0.7882353, 0, 1, 1,
0.8709215, -0.6098084, 2.754362, 0.7921569, 0, 1, 1,
0.8719657, -1.753936, 1.805799, 0.8, 0, 1, 1,
0.8744419, -0.6992673, 2.481379, 0.8078431, 0, 1, 1,
0.8754412, -0.3156732, 1.089956, 0.8117647, 0, 1, 1,
0.8766927, -0.4242716, 1.657624, 0.8196079, 0, 1, 1,
0.8779312, 0.1051743, -0.09363469, 0.8235294, 0, 1, 1,
0.8794808, 1.209764, 0.8734993, 0.8313726, 0, 1, 1,
0.8810765, 0.02329418, 3.174893, 0.8352941, 0, 1, 1,
0.8858611, -0.280047, 2.063119, 0.8431373, 0, 1, 1,
0.8873259, -0.4942086, 2.769207, 0.8470588, 0, 1, 1,
0.8920076, 0.694931, 1.369173, 0.854902, 0, 1, 1,
0.8984109, 0.6179953, 0.8131354, 0.8588235, 0, 1, 1,
0.9042375, -0.4408456, 3.147618, 0.8666667, 0, 1, 1,
0.9061086, -0.5599969, 3.178607, 0.8705882, 0, 1, 1,
0.9097274, -0.1564292, 4.110074, 0.8784314, 0, 1, 1,
0.9103019, -1.731676, 1.326476, 0.8823529, 0, 1, 1,
0.9141731, -0.665931, 1.192595, 0.8901961, 0, 1, 1,
0.9201578, 1.858046, 0.05257367, 0.8941177, 0, 1, 1,
0.9254173, -0.4035797, 1.570652, 0.9019608, 0, 1, 1,
0.9310111, -0.2089763, 2.336178, 0.9098039, 0, 1, 1,
0.9312118, -1.248457, 1.689226, 0.9137255, 0, 1, 1,
0.9322225, -0.4076766, 1.681256, 0.9215686, 0, 1, 1,
0.9336883, 0.3654703, 0.9216832, 0.9254902, 0, 1, 1,
0.93405, -1.213273, 2.738749, 0.9333333, 0, 1, 1,
0.937502, 1.713986, 1.185842, 0.9372549, 0, 1, 1,
0.9540799, -0.6126671, 1.922401, 0.945098, 0, 1, 1,
0.9558962, -0.5679691, 1.037293, 0.9490196, 0, 1, 1,
0.9628069, -0.2355658, 1.57172, 0.9568627, 0, 1, 1,
0.9650695, 1.409104, 1.309554, 0.9607843, 0, 1, 1,
0.9670632, -1.206665, 2.90155, 0.9686275, 0, 1, 1,
0.970966, 1.875502, 1.135463, 0.972549, 0, 1, 1,
0.9838845, -1.321465, 0.4082111, 0.9803922, 0, 1, 1,
0.9877959, 0.9029801, 1.63043, 0.9843137, 0, 1, 1,
0.9886898, 1.284878, 0.3044217, 0.9921569, 0, 1, 1,
0.9921917, 0.1047594, 2.19108, 0.9960784, 0, 1, 1,
1.009218, -0.9428556, 2.072662, 1, 0, 0.9960784, 1,
1.010702, -0.5278266, 0.7502958, 1, 0, 0.9882353, 1,
1.014405, 0.6316318, 1.102712, 1, 0, 0.9843137, 1,
1.019761, -0.6624312, 1.940536, 1, 0, 0.9764706, 1,
1.020919, 1.276958, 1.483043, 1, 0, 0.972549, 1,
1.02383, 0.7359719, 1.090991, 1, 0, 0.9647059, 1,
1.026257, -1.12897, 2.737604, 1, 0, 0.9607843, 1,
1.03837, -1.006338, 2.346058, 1, 0, 0.9529412, 1,
1.056696, 0.954573, 0.6775905, 1, 0, 0.9490196, 1,
1.064369, 0.3004734, 1.077884, 1, 0, 0.9411765, 1,
1.06775, 0.1375431, 2.221658, 1, 0, 0.9372549, 1,
1.070774, 0.3203687, 0.5753108, 1, 0, 0.9294118, 1,
1.071477, -0.1752955, 2.415638, 1, 0, 0.9254902, 1,
1.072216, 0.4210277, 1.722512, 1, 0, 0.9176471, 1,
1.077205, 1.477341, 3.476991, 1, 0, 0.9137255, 1,
1.077615, -0.6473407, 1.271415, 1, 0, 0.9058824, 1,
1.081925, 0.2671797, 1.375016, 1, 0, 0.9019608, 1,
1.082307, 1.127754, 0.2547229, 1, 0, 0.8941177, 1,
1.082492, 1.586215, 0.7575256, 1, 0, 0.8862745, 1,
1.085673, -0.8224349, 3.537225, 1, 0, 0.8823529, 1,
1.097256, 0.4383968, 0.7851416, 1, 0, 0.8745098, 1,
1.099494, 1.444486, 1.800008, 1, 0, 0.8705882, 1,
1.102983, 0.61451, 0.1343778, 1, 0, 0.8627451, 1,
1.109559, 0.4618341, 1.39185, 1, 0, 0.8588235, 1,
1.112995, -0.2514319, 1.037313, 1, 0, 0.8509804, 1,
1.113929, -2.342981, 4.292706, 1, 0, 0.8470588, 1,
1.127607, -0.2055354, 3.226573, 1, 0, 0.8392157, 1,
1.129315, 0.5450551, 1.942648, 1, 0, 0.8352941, 1,
1.13019, 0.8656451, 1.004476, 1, 0, 0.827451, 1,
1.136896, 1.076476, -0.06782024, 1, 0, 0.8235294, 1,
1.138667, 1.710077, 0.2800016, 1, 0, 0.8156863, 1,
1.143232, -0.292225, 1.991291, 1, 0, 0.8117647, 1,
1.147108, -0.4018744, 2.631112, 1, 0, 0.8039216, 1,
1.152857, -0.4893078, 1.677364, 1, 0, 0.7960784, 1,
1.161071, -0.2530518, 1.905924, 1, 0, 0.7921569, 1,
1.163387, -0.4512212, 0.7423689, 1, 0, 0.7843137, 1,
1.17162, 0.5644275, 2.529166, 1, 0, 0.7803922, 1,
1.171829, 0.6232247, 3.976499, 1, 0, 0.772549, 1,
1.177974, -0.4886455, 3.131552, 1, 0, 0.7686275, 1,
1.181876, -1.452158, 2.49459, 1, 0, 0.7607843, 1,
1.18264, 1.166046, 2.048122, 1, 0, 0.7568628, 1,
1.190161, -1.486589, 2.265259, 1, 0, 0.7490196, 1,
1.191807, 0.3741505, 0.418586, 1, 0, 0.7450981, 1,
1.193277, 0.2160056, 0.1833318, 1, 0, 0.7372549, 1,
1.200572, 0.7360445, 0.08918165, 1, 0, 0.7333333, 1,
1.203148, 0.6475607, 1.856353, 1, 0, 0.7254902, 1,
1.204688, -0.542685, 0.655502, 1, 0, 0.7215686, 1,
1.20844, -0.7375644, 2.494855, 1, 0, 0.7137255, 1,
1.216746, 1.065007, 0.5886931, 1, 0, 0.7098039, 1,
1.217721, 0.1680739, 1.088947, 1, 0, 0.7019608, 1,
1.218831, -0.1300555, 1.935617, 1, 0, 0.6941177, 1,
1.232064, -1.069863, 3.111845, 1, 0, 0.6901961, 1,
1.232408, 0.05232095, 3.575701, 1, 0, 0.682353, 1,
1.233757, -1.486571, 4.717899, 1, 0, 0.6784314, 1,
1.238788, -1.980763, 2.019868, 1, 0, 0.6705883, 1,
1.239129, 0.5576921, 0.4553629, 1, 0, 0.6666667, 1,
1.241321, -1.410239, 2.140978, 1, 0, 0.6588235, 1,
1.246152, 0.3733761, 1.448243, 1, 0, 0.654902, 1,
1.247848, -1.327915, 1.632189, 1, 0, 0.6470588, 1,
1.249164, -0.4482834, 2.680654, 1, 0, 0.6431373, 1,
1.250926, 0.03591579, 1.311612, 1, 0, 0.6352941, 1,
1.259881, 0.1531023, 0.8542436, 1, 0, 0.6313726, 1,
1.264557, 0.07792768, 1.209151, 1, 0, 0.6235294, 1,
1.268562, -0.274971, 1.401383, 1, 0, 0.6196079, 1,
1.280672, -1.288366, 2.40688, 1, 0, 0.6117647, 1,
1.283666, -0.03515254, 4.298908, 1, 0, 0.6078432, 1,
1.292119, 0.8308763, -0.5226728, 1, 0, 0.6, 1,
1.295026, -0.7890035, 1.195171, 1, 0, 0.5921569, 1,
1.303191, 0.9899303, 1.243531, 1, 0, 0.5882353, 1,
1.319574, -0.9959109, 0.4449428, 1, 0, 0.5803922, 1,
1.329236, -1.373753, 1.234696, 1, 0, 0.5764706, 1,
1.329869, -0.7085423, 1.886183, 1, 0, 0.5686275, 1,
1.333682, -2.395595, 2.732274, 1, 0, 0.5647059, 1,
1.335842, 1.138266, -0.2097808, 1, 0, 0.5568628, 1,
1.341582, -0.9626478, 2.04397, 1, 0, 0.5529412, 1,
1.344942, -1.802742, 1.538953, 1, 0, 0.5450981, 1,
1.351481, 0.2263734, -0.4348313, 1, 0, 0.5411765, 1,
1.35218, 1.859784, -0.0170492, 1, 0, 0.5333334, 1,
1.370797, 0.9470053, 0.8483515, 1, 0, 0.5294118, 1,
1.372564, -0.9144743, 1.402366, 1, 0, 0.5215687, 1,
1.390833, -0.4291749, 2.330909, 1, 0, 0.5176471, 1,
1.416956, 1.002154, 1.011821, 1, 0, 0.509804, 1,
1.41728, 1.096333, 1.677104, 1, 0, 0.5058824, 1,
1.427934, -0.1888663, 0.9238385, 1, 0, 0.4980392, 1,
1.434867, 0.6638279, 1.488028, 1, 0, 0.4901961, 1,
1.437664, 0.631298, 0.7194462, 1, 0, 0.4862745, 1,
1.459756, -1.026444, 0.9351037, 1, 0, 0.4784314, 1,
1.469081, 0.1935122, 0.9880189, 1, 0, 0.4745098, 1,
1.47125, -1.150008, 0.9953301, 1, 0, 0.4666667, 1,
1.471663, 1.823454, 0.1318945, 1, 0, 0.4627451, 1,
1.476092, -0.6089037, 0.3955065, 1, 0, 0.454902, 1,
1.478021, -0.7193501, 1.046817, 1, 0, 0.4509804, 1,
1.479593, -1.96193, 1.644582, 1, 0, 0.4431373, 1,
1.494064, -1.712026, 3.245169, 1, 0, 0.4392157, 1,
1.504067, 2.758278, 1.781631, 1, 0, 0.4313726, 1,
1.514326, 0.4191741, 0.6005526, 1, 0, 0.427451, 1,
1.516008, 1.038659, 1.780871, 1, 0, 0.4196078, 1,
1.516482, -1.183786, 2.246155, 1, 0, 0.4156863, 1,
1.5229, 0.1922134, 2.610029, 1, 0, 0.4078431, 1,
1.528782, -0.007305836, 0.8930618, 1, 0, 0.4039216, 1,
1.570316, 0.2788242, 1.334142, 1, 0, 0.3960784, 1,
1.579973, 1.798167, 1.568155, 1, 0, 0.3882353, 1,
1.582001, -1.396554, 2.900695, 1, 0, 0.3843137, 1,
1.585161, 0.1303041, 0.8659567, 1, 0, 0.3764706, 1,
1.585398, 0.3077985, 0.6558327, 1, 0, 0.372549, 1,
1.586386, -1.368774, 0.2026449, 1, 0, 0.3647059, 1,
1.600912, -0.9617152, 0.4424606, 1, 0, 0.3607843, 1,
1.603607, 0.7449865, 0.4853353, 1, 0, 0.3529412, 1,
1.610513, -0.6141821, 2.757867, 1, 0, 0.3490196, 1,
1.611171, 0.7485135, 0.8872293, 1, 0, 0.3411765, 1,
1.615041, -0.2633653, 1.558711, 1, 0, 0.3372549, 1,
1.626263, 0.8117474, -0.5408002, 1, 0, 0.3294118, 1,
1.637596, 0.3135957, 0.2248918, 1, 0, 0.3254902, 1,
1.649115, 0.521341, 1.748462, 1, 0, 0.3176471, 1,
1.66351, 0.2405781, 2.128851, 1, 0, 0.3137255, 1,
1.682197, -1.465362, -0.4529615, 1, 0, 0.3058824, 1,
1.687755, 0.4694329, 2.00054, 1, 0, 0.2980392, 1,
1.690679, 0.4239826, 2.923499, 1, 0, 0.2941177, 1,
1.703779, -1.068225, 2.241997, 1, 0, 0.2862745, 1,
1.71106, -0.2846325, 2.905485, 1, 0, 0.282353, 1,
1.717982, 0.4880363, 1.054845, 1, 0, 0.2745098, 1,
1.735213, -0.8924044, 2.3664, 1, 0, 0.2705882, 1,
1.735262, -0.8706187, 2.290517, 1, 0, 0.2627451, 1,
1.747767, -2.02877, 2.736376, 1, 0, 0.2588235, 1,
1.748045, -0.131974, 2.344404, 1, 0, 0.2509804, 1,
1.752847, -2.464335, 2.73565, 1, 0, 0.2470588, 1,
1.75862, 0.9332902, 1.970627, 1, 0, 0.2392157, 1,
1.760705, 0.1556186, 1.515855, 1, 0, 0.2352941, 1,
1.799103, 0.3249282, 0.9332435, 1, 0, 0.227451, 1,
1.806324, 0.9511923, 1.024938, 1, 0, 0.2235294, 1,
1.80993, -0.1500873, 1.771589, 1, 0, 0.2156863, 1,
1.819468, 0.4731812, -0.9923905, 1, 0, 0.2117647, 1,
1.859113, 0.4177558, 0.1114382, 1, 0, 0.2039216, 1,
1.887199, 1.608328, 2.343861, 1, 0, 0.1960784, 1,
1.888798, -1.387685, 2.043288, 1, 0, 0.1921569, 1,
1.889799, -1.782221, 2.854946, 1, 0, 0.1843137, 1,
1.897754, -0.06690433, 3.118716, 1, 0, 0.1803922, 1,
1.90324, -0.3382175, 1.082154, 1, 0, 0.172549, 1,
1.949309, 2.103508, 1.113659, 1, 0, 0.1686275, 1,
1.9598, 0.5616202, 0.9049231, 1, 0, 0.1607843, 1,
1.960502, 0.1054488, 2.96331, 1, 0, 0.1568628, 1,
1.975889, 1.037809, 0.03408428, 1, 0, 0.1490196, 1,
1.994984, -1.923653, 1.722843, 1, 0, 0.145098, 1,
2.000259, 0.2541841, 2.421374, 1, 0, 0.1372549, 1,
2.029231, -0.4271299, 1.309083, 1, 0, 0.1333333, 1,
2.082242, -1.110333, 2.774178, 1, 0, 0.1254902, 1,
2.118628, -0.6658674, 1.903022, 1, 0, 0.1215686, 1,
2.129322, -0.1646484, 3.120555, 1, 0, 0.1137255, 1,
2.151483, -0.14835, 2.673729, 1, 0, 0.1098039, 1,
2.174531, 0.1117426, 1.59695, 1, 0, 0.1019608, 1,
2.175896, 0.5111365, 0.2375863, 1, 0, 0.09411765, 1,
2.184169, 0.4808059, 0.4231261, 1, 0, 0.09019608, 1,
2.247482, -1.141395, 1.855359, 1, 0, 0.08235294, 1,
2.352608, -0.875349, 1.536316, 1, 0, 0.07843138, 1,
2.372736, -0.1176991, 2.40728, 1, 0, 0.07058824, 1,
2.37277, 0.457636, 1.833829, 1, 0, 0.06666667, 1,
2.391829, 1.204119, 1.678889, 1, 0, 0.05882353, 1,
2.440119, 1.654704, 1.252511, 1, 0, 0.05490196, 1,
2.441055, 0.7283199, 1.601753, 1, 0, 0.04705882, 1,
2.49122, -1.042897, 0.7619868, 1, 0, 0.04313726, 1,
2.511341, 0.07904433, 2.192627, 1, 0, 0.03529412, 1,
2.549649, 1.550069, 0.3839384, 1, 0, 0.03137255, 1,
2.56968, 0.06648953, 1.417668, 1, 0, 0.02352941, 1,
2.78574, 0.4416181, 1.014614, 1, 0, 0.01960784, 1,
2.93644, 1.790947, 0.3475089, 1, 0, 0.01176471, 1,
3.23432, 1.057523, 2.196126, 1, 0, 0.007843138, 1
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
0.08614206, -3.801788, -7.497649, 0, -0.5, 0.5, 0.5,
0.08614206, -3.801788, -7.497649, 1, -0.5, 0.5, 0.5,
0.08614206, -3.801788, -7.497649, 1, 1.5, 0.5, 0.5,
0.08614206, -3.801788, -7.497649, 0, 1.5, 0.5, 0.5
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
-4.129268, 0.3097707, -7.497649, 0, -0.5, 0.5, 0.5,
-4.129268, 0.3097707, -7.497649, 1, -0.5, 0.5, 0.5,
-4.129268, 0.3097707, -7.497649, 1, 1.5, 0.5, 0.5,
-4.129268, 0.3097707, -7.497649, 0, 1.5, 0.5, 0.5
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
-4.129268, -3.801788, 0.3462403, 0, -0.5, 0.5, 0.5,
-4.129268, -3.801788, 0.3462403, 1, -0.5, 0.5, 0.5,
-4.129268, -3.801788, 0.3462403, 1, 1.5, 0.5, 0.5,
-4.129268, -3.801788, 0.3462403, 0, 1.5, 0.5, 0.5
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
-3, -2.852967, -5.687521,
3, -2.852967, -5.687521,
-3, -2.852967, -5.687521,
-3, -3.011103, -5.989208,
-2, -2.852967, -5.687521,
-2, -3.011103, -5.989208,
-1, -2.852967, -5.687521,
-1, -3.011103, -5.989208,
0, -2.852967, -5.687521,
0, -3.011103, -5.989208,
1, -2.852967, -5.687521,
1, -3.011103, -5.989208,
2, -2.852967, -5.687521,
2, -3.011103, -5.989208,
3, -2.852967, -5.687521,
3, -3.011103, -5.989208
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3, -3.327377, -6.592585, 0, -0.5, 0.5, 0.5,
-3, -3.327377, -6.592585, 1, -0.5, 0.5, 0.5,
-3, -3.327377, -6.592585, 1, 1.5, 0.5, 0.5,
-3, -3.327377, -6.592585, 0, 1.5, 0.5, 0.5,
-2, -3.327377, -6.592585, 0, -0.5, 0.5, 0.5,
-2, -3.327377, -6.592585, 1, -0.5, 0.5, 0.5,
-2, -3.327377, -6.592585, 1, 1.5, 0.5, 0.5,
-2, -3.327377, -6.592585, 0, 1.5, 0.5, 0.5,
-1, -3.327377, -6.592585, 0, -0.5, 0.5, 0.5,
-1, -3.327377, -6.592585, 1, -0.5, 0.5, 0.5,
-1, -3.327377, -6.592585, 1, 1.5, 0.5, 0.5,
-1, -3.327377, -6.592585, 0, 1.5, 0.5, 0.5,
0, -3.327377, -6.592585, 0, -0.5, 0.5, 0.5,
0, -3.327377, -6.592585, 1, -0.5, 0.5, 0.5,
0, -3.327377, -6.592585, 1, 1.5, 0.5, 0.5,
0, -3.327377, -6.592585, 0, 1.5, 0.5, 0.5,
1, -3.327377, -6.592585, 0, -0.5, 0.5, 0.5,
1, -3.327377, -6.592585, 1, -0.5, 0.5, 0.5,
1, -3.327377, -6.592585, 1, 1.5, 0.5, 0.5,
1, -3.327377, -6.592585, 0, 1.5, 0.5, 0.5,
2, -3.327377, -6.592585, 0, -0.5, 0.5, 0.5,
2, -3.327377, -6.592585, 1, -0.5, 0.5, 0.5,
2, -3.327377, -6.592585, 1, 1.5, 0.5, 0.5,
2, -3.327377, -6.592585, 0, 1.5, 0.5, 0.5,
3, -3.327377, -6.592585, 0, -0.5, 0.5, 0.5,
3, -3.327377, -6.592585, 1, -0.5, 0.5, 0.5,
3, -3.327377, -6.592585, 1, 1.5, 0.5, 0.5,
3, -3.327377, -6.592585, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.156481, -2, -5.687521,
-3.156481, 3, -5.687521,
-3.156481, -2, -5.687521,
-3.318612, -2, -5.989208,
-3.156481, -1, -5.687521,
-3.318612, -1, -5.989208,
-3.156481, 0, -5.687521,
-3.318612, 0, -5.989208,
-3.156481, 1, -5.687521,
-3.318612, 1, -5.989208,
-3.156481, 2, -5.687521,
-3.318612, 2, -5.989208,
-3.156481, 3, -5.687521,
-3.318612, 3, -5.989208
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
"-1",
"0",
"1",
"2",
"3"
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
-3.642875, -2, -6.592585, 0, -0.5, 0.5, 0.5,
-3.642875, -2, -6.592585, 1, -0.5, 0.5, 0.5,
-3.642875, -2, -6.592585, 1, 1.5, 0.5, 0.5,
-3.642875, -2, -6.592585, 0, 1.5, 0.5, 0.5,
-3.642875, -1, -6.592585, 0, -0.5, 0.5, 0.5,
-3.642875, -1, -6.592585, 1, -0.5, 0.5, 0.5,
-3.642875, -1, -6.592585, 1, 1.5, 0.5, 0.5,
-3.642875, -1, -6.592585, 0, 1.5, 0.5, 0.5,
-3.642875, 0, -6.592585, 0, -0.5, 0.5, 0.5,
-3.642875, 0, -6.592585, 1, -0.5, 0.5, 0.5,
-3.642875, 0, -6.592585, 1, 1.5, 0.5, 0.5,
-3.642875, 0, -6.592585, 0, 1.5, 0.5, 0.5,
-3.642875, 1, -6.592585, 0, -0.5, 0.5, 0.5,
-3.642875, 1, -6.592585, 1, -0.5, 0.5, 0.5,
-3.642875, 1, -6.592585, 1, 1.5, 0.5, 0.5,
-3.642875, 1, -6.592585, 0, 1.5, 0.5, 0.5,
-3.642875, 2, -6.592585, 0, -0.5, 0.5, 0.5,
-3.642875, 2, -6.592585, 1, -0.5, 0.5, 0.5,
-3.642875, 2, -6.592585, 1, 1.5, 0.5, 0.5,
-3.642875, 2, -6.592585, 0, 1.5, 0.5, 0.5,
-3.642875, 3, -6.592585, 0, -0.5, 0.5, 0.5,
-3.642875, 3, -6.592585, 1, -0.5, 0.5, 0.5,
-3.642875, 3, -6.592585, 1, 1.5, 0.5, 0.5,
-3.642875, 3, -6.592585, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
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
-3.156481, -2.852967, -4,
-3.156481, -2.852967, 6,
-3.156481, -2.852967, -4,
-3.318612, -3.011103, -4,
-3.156481, -2.852967, -2,
-3.318612, -3.011103, -2,
-3.156481, -2.852967, 0,
-3.318612, -3.011103, 0,
-3.156481, -2.852967, 2,
-3.318612, -3.011103, 2,
-3.156481, -2.852967, 4,
-3.318612, -3.011103, 4,
-3.156481, -2.852967, 6,
-3.318612, -3.011103, 6
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
"4",
"6"
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
-3.642875, -3.327377, -4, 0, -0.5, 0.5, 0.5,
-3.642875, -3.327377, -4, 1, -0.5, 0.5, 0.5,
-3.642875, -3.327377, -4, 1, 1.5, 0.5, 0.5,
-3.642875, -3.327377, -4, 0, 1.5, 0.5, 0.5,
-3.642875, -3.327377, -2, 0, -0.5, 0.5, 0.5,
-3.642875, -3.327377, -2, 1, -0.5, 0.5, 0.5,
-3.642875, -3.327377, -2, 1, 1.5, 0.5, 0.5,
-3.642875, -3.327377, -2, 0, 1.5, 0.5, 0.5,
-3.642875, -3.327377, 0, 0, -0.5, 0.5, 0.5,
-3.642875, -3.327377, 0, 1, -0.5, 0.5, 0.5,
-3.642875, -3.327377, 0, 1, 1.5, 0.5, 0.5,
-3.642875, -3.327377, 0, 0, 1.5, 0.5, 0.5,
-3.642875, -3.327377, 2, 0, -0.5, 0.5, 0.5,
-3.642875, -3.327377, 2, 1, -0.5, 0.5, 0.5,
-3.642875, -3.327377, 2, 1, 1.5, 0.5, 0.5,
-3.642875, -3.327377, 2, 0, 1.5, 0.5, 0.5,
-3.642875, -3.327377, 4, 0, -0.5, 0.5, 0.5,
-3.642875, -3.327377, 4, 1, -0.5, 0.5, 0.5,
-3.642875, -3.327377, 4, 1, 1.5, 0.5, 0.5,
-3.642875, -3.327377, 4, 0, 1.5, 0.5, 0.5,
-3.642875, -3.327377, 6, 0, -0.5, 0.5, 0.5,
-3.642875, -3.327377, 6, 1, -0.5, 0.5, 0.5,
-3.642875, -3.327377, 6, 1, 1.5, 0.5, 0.5,
-3.642875, -3.327377, 6, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
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
-3.156481, -2.852967, -5.687521,
-3.156481, 3.472508, -5.687521,
-3.156481, -2.852967, 6.380001,
-3.156481, 3.472508, 6.380001,
-3.156481, -2.852967, -5.687521,
-3.156481, -2.852967, 6.380001,
-3.156481, 3.472508, -5.687521,
-3.156481, 3.472508, 6.380001,
-3.156481, -2.852967, -5.687521,
3.328765, -2.852967, -5.687521,
-3.156481, -2.852967, 6.380001,
3.328765, -2.852967, 6.380001,
-3.156481, 3.472508, -5.687521,
3.328765, 3.472508, -5.687521,
-3.156481, 3.472508, 6.380001,
3.328765, 3.472508, 6.380001,
3.328765, -2.852967, -5.687521,
3.328765, 3.472508, -5.687521,
3.328765, -2.852967, 6.380001,
3.328765, 3.472508, 6.380001,
3.328765, -2.852967, -5.687521,
3.328765, -2.852967, 6.380001,
3.328765, 3.472508, -5.687521,
3.328765, 3.472508, 6.380001
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
var radius = 8.057537;
var distance = 35.84889;
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
mvMatrix.translate( -0.08614206, -0.3097707, -0.3462403 );
mvMatrix.scale( 1.343352, 1.377283, 0.7219351 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.84889);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Nitrapyrin<-read.table("Nitrapyrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Nitrapyrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nitrapyrin' not found
```

```r
y<-Nitrapyrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nitrapyrin' not found
```

```r
z<-Nitrapyrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nitrapyrin' not found
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
-3.062036, 2.766716, -2.112156, 0, 0, 1, 1, 1,
-2.965342, 0.08598857, -1.927375, 1, 0, 0, 1, 1,
-2.867881, 0.7417738, -0.7236593, 1, 0, 0, 1, 1,
-2.737631, 1.154017, -2.356103, 1, 0, 0, 1, 1,
-2.68994, -0.7078917, -0.7244506, 1, 0, 0, 1, 1,
-2.686879, 0.7410905, 0.1139221, 1, 0, 0, 1, 1,
-2.67874, -0.2778412, -0.7908247, 0, 0, 0, 1, 1,
-2.576302, 0.3285963, -0.6503504, 0, 0, 0, 1, 1,
-2.5132, 0.145073, -0.7019812, 0, 0, 0, 1, 1,
-2.431067, -0.497221, -1.642348, 0, 0, 0, 1, 1,
-2.364364, -0.5199971, -2.915965, 0, 0, 0, 1, 1,
-2.34164, 1.98331, -2.551777, 0, 0, 0, 1, 1,
-2.31045, 1.041428, -2.037924, 0, 0, 0, 1, 1,
-2.212785, -1.39097, 0.2908356, 1, 1, 1, 1, 1,
-2.087236, 1.110904, -0.9847378, 1, 1, 1, 1, 1,
-2.077073, -0.339768, -2.844, 1, 1, 1, 1, 1,
-2.076659, 3.380389, -0.282328, 1, 1, 1, 1, 1,
-2.052898, -0.1198913, -1.215118, 1, 1, 1, 1, 1,
-2.01371, -0.3965735, -1.447474, 1, 1, 1, 1, 1,
-1.953652, -1.611568, -2.000367, 1, 1, 1, 1, 1,
-1.95161, 0.2927715, -1.253464, 1, 1, 1, 1, 1,
-1.94802, -1.064604, -3.385083, 1, 1, 1, 1, 1,
-1.933141, 0.9463637, -1.557758, 1, 1, 1, 1, 1,
-1.887804, -0.9543681, -1.491018, 1, 1, 1, 1, 1,
-1.876054, -1.573012, -4.070799, 1, 1, 1, 1, 1,
-1.815992, 1.059649, -0.1434661, 1, 1, 1, 1, 1,
-1.810997, 0.4715627, -0.3646581, 1, 1, 1, 1, 1,
-1.798112, 0.3050601, 0.4684075, 1, 1, 1, 1, 1,
-1.790753, 1.105306, 0.6349965, 0, 0, 1, 1, 1,
-1.781355, -0.1765411, -0.7495717, 1, 0, 0, 1, 1,
-1.771526, -0.7427748, -0.6173353, 1, 0, 0, 1, 1,
-1.769885, 1.313773, -0.6639206, 1, 0, 0, 1, 1,
-1.761479, -0.2666782, -2.775469, 1, 0, 0, 1, 1,
-1.75191, 0.02266741, -2.140723, 1, 0, 0, 1, 1,
-1.740896, -0.4146779, -2.308799, 0, 0, 0, 1, 1,
-1.728107, -0.4989257, -2.043093, 0, 0, 0, 1, 1,
-1.700428, -0.04157554, -0.7021528, 0, 0, 0, 1, 1,
-1.694032, 0.1661893, 0.0380886, 0, 0, 0, 1, 1,
-1.670891, -1.094429, -1.464799, 0, 0, 0, 1, 1,
-1.665344, 0.6879882, -1.284103, 0, 0, 0, 1, 1,
-1.663269, 0.7502921, -1.516593, 0, 0, 0, 1, 1,
-1.661393, -0.7210067, -3.011588, 1, 1, 1, 1, 1,
-1.654078, 1.607392, -1.965348, 1, 1, 1, 1, 1,
-1.644345, -1.748144, -1.734369, 1, 1, 1, 1, 1,
-1.643287, 1.979646, -0.7927989, 1, 1, 1, 1, 1,
-1.638, -0.5773799, -1.687953, 1, 1, 1, 1, 1,
-1.634131, -1.938896, -3.871346, 1, 1, 1, 1, 1,
-1.629081, -0.2055366, -2.417268, 1, 1, 1, 1, 1,
-1.627647, 0.6644198, -1.288731, 1, 1, 1, 1, 1,
-1.617695, -0.9221041, -2.834134, 1, 1, 1, 1, 1,
-1.614989, -0.9708346, -2.724938, 1, 1, 1, 1, 1,
-1.606868, 0.6697917, -0.5870111, 1, 1, 1, 1, 1,
-1.600286, -0.1335185, -1.219085, 1, 1, 1, 1, 1,
-1.594363, -0.5982686, -3.745235, 1, 1, 1, 1, 1,
-1.576824, -1.055748, -3.052405, 1, 1, 1, 1, 1,
-1.567565, -0.8967019, -2.145053, 1, 1, 1, 1, 1,
-1.551437, 0.5379097, -1.626035, 0, 0, 1, 1, 1,
-1.549004, 0.446463, -1.365356, 1, 0, 0, 1, 1,
-1.543956, -0.3922423, -3.009745, 1, 0, 0, 1, 1,
-1.520116, 0.6746531, -2.131605, 1, 0, 0, 1, 1,
-1.505383, -1.62336, -3.782435, 1, 0, 0, 1, 1,
-1.489774, 0.2307554, -0.1301659, 1, 0, 0, 1, 1,
-1.488475, -0.4115116, -1.989076, 0, 0, 0, 1, 1,
-1.481327, -0.8683719, -1.628277, 0, 0, 0, 1, 1,
-1.471306, -0.1191277, -1.405225, 0, 0, 0, 1, 1,
-1.470427, -1.839383, -1.952255, 0, 0, 0, 1, 1,
-1.461139, 1.367293, -2.364982, 0, 0, 0, 1, 1,
-1.459738, -0.7392434, -3.521854, 0, 0, 0, 1, 1,
-1.443165, 0.5032981, -1.696562, 0, 0, 0, 1, 1,
-1.425546, -1.486498, -1.347357, 1, 1, 1, 1, 1,
-1.420827, 1.91888, -1.757989, 1, 1, 1, 1, 1,
-1.412753, 1.107854, 0.1184633, 1, 1, 1, 1, 1,
-1.41259, 1.030249, 1.222661, 1, 1, 1, 1, 1,
-1.409254, 1.039202, 0.1091894, 1, 1, 1, 1, 1,
-1.409206, 0.08988913, -0.5370625, 1, 1, 1, 1, 1,
-1.404858, 0.06416973, -1.74837, 1, 1, 1, 1, 1,
-1.391624, -0.6402714, -1.53207, 1, 1, 1, 1, 1,
-1.389577, 1.150124, -2.470706, 1, 1, 1, 1, 1,
-1.387752, 1.864182, -1.052296, 1, 1, 1, 1, 1,
-1.375199, 0.9750483, -1.184362, 1, 1, 1, 1, 1,
-1.369561, 1.832297, -2.321924, 1, 1, 1, 1, 1,
-1.368788, 0.1531631, 0.9674683, 1, 1, 1, 1, 1,
-1.36762, 0.4257984, 0.0502365, 1, 1, 1, 1, 1,
-1.358977, -1.04874, -0.750783, 1, 1, 1, 1, 1,
-1.354832, 0.2959118, -0.9403093, 0, 0, 1, 1, 1,
-1.351644, -0.4138923, -2.655713, 1, 0, 0, 1, 1,
-1.346581, -0.6269991, -3.112796, 1, 0, 0, 1, 1,
-1.342689, 0.7391536, -1.960088, 1, 0, 0, 1, 1,
-1.341976, -1.610479, -2.420247, 1, 0, 0, 1, 1,
-1.335531, 1.848173, -1.906299, 1, 0, 0, 1, 1,
-1.334925, 2.071703, -1.139803, 0, 0, 0, 1, 1,
-1.32284, -0.573602, -2.174333, 0, 0, 0, 1, 1,
-1.316712, -0.7859869, -2.26642, 0, 0, 0, 1, 1,
-1.308694, 1.392102, -0.6417066, 0, 0, 0, 1, 1,
-1.303038, -0.1920366, -2.18003, 0, 0, 0, 1, 1,
-1.301205, -0.2370086, -1.416052, 0, 0, 0, 1, 1,
-1.299377, 0.4445481, -1.348417, 0, 0, 0, 1, 1,
-1.292646, -0.8672639, -1.078462, 1, 1, 1, 1, 1,
-1.290726, 0.9431629, -1.771515, 1, 1, 1, 1, 1,
-1.255855, 0.1362842, -2.159312, 1, 1, 1, 1, 1,
-1.24807, -0.1731296, -1.809814, 1, 1, 1, 1, 1,
-1.2447, 0.917275, -1.825422, 1, 1, 1, 1, 1,
-1.233519, 0.05005767, -1.964546, 1, 1, 1, 1, 1,
-1.225382, 0.07017335, -1.696419, 1, 1, 1, 1, 1,
-1.222318, -0.1972978, -1.944591, 1, 1, 1, 1, 1,
-1.220109, -2.503802, -2.30831, 1, 1, 1, 1, 1,
-1.210523, -0.9597809, -1.177674, 1, 1, 1, 1, 1,
-1.209984, -0.3964737, -3.240327, 1, 1, 1, 1, 1,
-1.201782, -0.7010469, -3.098247, 1, 1, 1, 1, 1,
-1.199802, 1.243504, -0.4132521, 1, 1, 1, 1, 1,
-1.199528, -1.310618, -3.444704, 1, 1, 1, 1, 1,
-1.186673, -0.1253518, -2.351295, 1, 1, 1, 1, 1,
-1.178015, 0.2071213, -3.102848, 0, 0, 1, 1, 1,
-1.170243, 0.2472036, -0.5560053, 1, 0, 0, 1, 1,
-1.166784, -0.6171559, -3.491394, 1, 0, 0, 1, 1,
-1.163108, 1.473265, -0.2992604, 1, 0, 0, 1, 1,
-1.159696, 0.03320226, -0.6100554, 1, 0, 0, 1, 1,
-1.137562, -1.954048, -3.670164, 1, 0, 0, 1, 1,
-1.128913, 0.3700805, -1.605719, 0, 0, 0, 1, 1,
-1.124351, 0.5392408, -2.851105, 0, 0, 0, 1, 1,
-1.123543, -1.617754, -3.301544, 0, 0, 0, 1, 1,
-1.113972, -0.8206739, -1.112855, 0, 0, 0, 1, 1,
-1.113814, 0.03378088, -1.725009, 0, 0, 0, 1, 1,
-1.107626, 0.462119, -0.6144435, 0, 0, 0, 1, 1,
-1.102632, -0.4678156, -0.8661456, 0, 0, 0, 1, 1,
-1.101691, -0.06294778, -1.02702, 1, 1, 1, 1, 1,
-1.096794, -1.51241, -1.388624, 1, 1, 1, 1, 1,
-1.087179, -0.5425675, -3.159307, 1, 1, 1, 1, 1,
-1.086883, 0.2876658, -1.667378, 1, 1, 1, 1, 1,
-1.081498, 0.01601222, -2.144053, 1, 1, 1, 1, 1,
-1.073801, -0.986755, -1.636401, 1, 1, 1, 1, 1,
-1.069028, 1.007831, -0.7776377, 1, 1, 1, 1, 1,
-1.062198, -1.567129, -2.406006, 1, 1, 1, 1, 1,
-1.059324, -1.182304, -2.750746, 1, 1, 1, 1, 1,
-1.057305, 1.558314, 0.1048071, 1, 1, 1, 1, 1,
-1.055124, 1.176018, -1.795523, 1, 1, 1, 1, 1,
-1.048632, -0.01062053, -3.569323, 1, 1, 1, 1, 1,
-1.046425, -0.1626574, -2.104034, 1, 1, 1, 1, 1,
-1.041966, -0.4403037, -1.531199, 1, 1, 1, 1, 1,
-1.037376, -0.4914046, -1.819033, 1, 1, 1, 1, 1,
-1.027413, -1.497755, -2.481132, 0, 0, 1, 1, 1,
-1.027233, -0.3732387, 1.390642, 1, 0, 0, 1, 1,
-1.025273, 1.09646, -1.245541, 1, 0, 0, 1, 1,
-1.024801, -0.2342797, -2.835829, 1, 0, 0, 1, 1,
-1.024366, -0.1563442, -0.8880183, 1, 0, 0, 1, 1,
-1.021765, -0.6352355, -2.768188, 1, 0, 0, 1, 1,
-1.018285, 1.51477, -2.112013, 0, 0, 0, 1, 1,
-1.014503, -0.9001163, -1.352698, 0, 0, 0, 1, 1,
-1.013864, -1.655449, -2.630307, 0, 0, 0, 1, 1,
-1.011257, 0.3399967, 0.1537184, 0, 0, 0, 1, 1,
-1.008787, -0.3548186, -2.015187, 0, 0, 0, 1, 1,
-1.0064, 0.1944293, -1.55798, 0, 0, 0, 1, 1,
-1.004534, 1.444791, -1.254487, 0, 0, 0, 1, 1,
-1.001792, 0.5903561, -0.5987568, 1, 1, 1, 1, 1,
-0.9943023, 0.6598675, 1.418658, 1, 1, 1, 1, 1,
-0.9904168, 1.904023, 0.6321024, 1, 1, 1, 1, 1,
-0.9871739, 1.074407, -1.183889, 1, 1, 1, 1, 1,
-0.9865895, 1.843246, -0.04014562, 1, 1, 1, 1, 1,
-0.9829005, 1.484986, 0.2198865, 1, 1, 1, 1, 1,
-0.9628461, 0.2014325, -2.130581, 1, 1, 1, 1, 1,
-0.9602423, -1.778867, -3.206669, 1, 1, 1, 1, 1,
-0.9481248, -0.3335703, -1.526198, 1, 1, 1, 1, 1,
-0.9383947, 0.7684325, -0.2490653, 1, 1, 1, 1, 1,
-0.9330966, -0.04208732, -3.278518, 1, 1, 1, 1, 1,
-0.9330837, -0.6138654, -0.4673004, 1, 1, 1, 1, 1,
-0.9328966, -0.9545913, -2.181688, 1, 1, 1, 1, 1,
-0.9248376, 1.811574, -1.652025, 1, 1, 1, 1, 1,
-0.9234987, 2.165998, -1.96644, 1, 1, 1, 1, 1,
-0.9231433, 1.15195, -1.844907, 0, 0, 1, 1, 1,
-0.9105514, 0.2187378, -2.151943, 1, 0, 0, 1, 1,
-0.9097248, -0.1259276, -1.604827, 1, 0, 0, 1, 1,
-0.9082168, -0.1250961, -0.8814924, 1, 0, 0, 1, 1,
-0.9043794, -0.2463362, -2.022572, 1, 0, 0, 1, 1,
-0.8856232, 0.6962504, -0.2874725, 1, 0, 0, 1, 1,
-0.8829621, 1.55428, -1.298213, 0, 0, 0, 1, 1,
-0.8790576, -1.017712, -2.293409, 0, 0, 0, 1, 1,
-0.8786553, 0.124354, -2.525676, 0, 0, 0, 1, 1,
-0.8664077, -0.4346921, -2.771991, 0, 0, 0, 1, 1,
-0.8663313, -0.5792079, -5.171841, 0, 0, 0, 1, 1,
-0.863598, 0.1795837, -2.712014, 0, 0, 0, 1, 1,
-0.8562109, -0.242203, -1.961782, 0, 0, 0, 1, 1,
-0.856165, 0.8007009, -2.487435, 1, 1, 1, 1, 1,
-0.8510357, -1.858492, -3.462048, 1, 1, 1, 1, 1,
-0.8441328, 1.385274, -0.6828349, 1, 1, 1, 1, 1,
-0.8403475, 1.242318, -0.7195696, 1, 1, 1, 1, 1,
-0.83302, -1.284022, -1.615621, 1, 1, 1, 1, 1,
-0.8250151, 1.060156, -0.1033441, 1, 1, 1, 1, 1,
-0.8224931, 0.2352118, -1.017584, 1, 1, 1, 1, 1,
-0.8196904, -0.303792, -3.174175, 1, 1, 1, 1, 1,
-0.8195841, 1.904654, -1.2001, 1, 1, 1, 1, 1,
-0.8083597, -0.5263246, -2.61593, 1, 1, 1, 1, 1,
-0.8075261, -0.6126999, -3.020052, 1, 1, 1, 1, 1,
-0.8053855, -0.9124895, -4.077771, 1, 1, 1, 1, 1,
-0.8023788, -1.48946, -0.6732919, 1, 1, 1, 1, 1,
-0.8014184, -0.7642527, -3.27635, 1, 1, 1, 1, 1,
-0.7933173, -1.421659, -3.334589, 1, 1, 1, 1, 1,
-0.7921404, -0.9248978, -2.396236, 0, 0, 1, 1, 1,
-0.7864262, -0.5389718, -1.909266, 1, 0, 0, 1, 1,
-0.7805737, 0.772655, -1.528608, 1, 0, 0, 1, 1,
-0.7792319, -0.3731312, -2.540789, 1, 0, 0, 1, 1,
-0.7779269, -2.259542, -1.540996, 1, 0, 0, 1, 1,
-0.7707258, -0.05501181, -1.216438, 1, 0, 0, 1, 1,
-0.7704489, 1.036938, -0.6500377, 0, 0, 0, 1, 1,
-0.7696762, -1.280284, -2.612766, 0, 0, 0, 1, 1,
-0.7662448, -0.9325782, -2.888204, 0, 0, 0, 1, 1,
-0.759165, -0.8281361, -2.690593, 0, 0, 0, 1, 1,
-0.7556066, 0.5430827, -1.573754, 0, 0, 0, 1, 1,
-0.7550619, -0.9892501, -4.140144, 0, 0, 0, 1, 1,
-0.7550234, -0.7140223, -3.007679, 0, 0, 0, 1, 1,
-0.752854, -1.279217, -2.380462, 1, 1, 1, 1, 1,
-0.748693, 0.5660305, -1.532989, 1, 1, 1, 1, 1,
-0.7478904, -0.9810624, -1.546623, 1, 1, 1, 1, 1,
-0.7475595, -0.1415206, -0.2785977, 1, 1, 1, 1, 1,
-0.7468873, 2.544795, -1.313118, 1, 1, 1, 1, 1,
-0.7462378, -0.6484202, -2.58359, 1, 1, 1, 1, 1,
-0.7456555, 1.267115, 1.657035, 1, 1, 1, 1, 1,
-0.7358986, -0.5281018, -2.834257, 1, 1, 1, 1, 1,
-0.7343273, 0.815983, -1.679909, 1, 1, 1, 1, 1,
-0.7314287, 0.4665122, -0.7317913, 1, 1, 1, 1, 1,
-0.7312341, 0.7825794, -0.6909906, 1, 1, 1, 1, 1,
-0.7285323, -0.5426818, -5.327865, 1, 1, 1, 1, 1,
-0.720011, 0.4515564, -2.294502, 1, 1, 1, 1, 1,
-0.7126875, -0.2250293, -2.631204, 1, 1, 1, 1, 1,
-0.7111589, 0.6015255, -2.027351, 1, 1, 1, 1, 1,
-0.7070759, -0.6965008, -2.35102, 0, 0, 1, 1, 1,
-0.7045812, -1.197261, -5.51178, 1, 0, 0, 1, 1,
-0.7025644, -0.8105213, -2.985453, 1, 0, 0, 1, 1,
-0.7009598, -0.9080176, -2.613476, 1, 0, 0, 1, 1,
-0.700374, -2.749026, -5.171464, 1, 0, 0, 1, 1,
-0.6985991, 1.596613, -1.095104, 1, 0, 0, 1, 1,
-0.6894566, -0.3358128, -0.3776108, 0, 0, 0, 1, 1,
-0.6860595, -0.9075374, -2.130012, 0, 0, 0, 1, 1,
-0.6843176, -0.3495139, -1.073296, 0, 0, 0, 1, 1,
-0.6831698, 0.4966742, -0.7482904, 0, 0, 0, 1, 1,
-0.6799184, -0.2344591, -2.380952, 0, 0, 0, 1, 1,
-0.676406, -0.08494684, -3.043892, 0, 0, 0, 1, 1,
-0.6718608, -0.5657563, -1.444458, 0, 0, 0, 1, 1,
-0.6712946, 2.085887, -1.533565, 1, 1, 1, 1, 1,
-0.667287, -0.6719748, -2.284117, 1, 1, 1, 1, 1,
-0.6649669, -0.8316444, -1.46227, 1, 1, 1, 1, 1,
-0.6623298, -0.2558475, -1.665318, 1, 1, 1, 1, 1,
-0.6599743, 0.1186875, -2.564446, 1, 1, 1, 1, 1,
-0.6526641, -2.760848, -0.7181376, 1, 1, 1, 1, 1,
-0.6522523, 0.2099569, -1.931326, 1, 1, 1, 1, 1,
-0.6506845, 1.783497, 0.233675, 1, 1, 1, 1, 1,
-0.6500564, 0.9080908, -0.5226293, 1, 1, 1, 1, 1,
-0.6482468, 0.3426704, 0.5883605, 1, 1, 1, 1, 1,
-0.6454314, -1.128561, -0.9108683, 1, 1, 1, 1, 1,
-0.6442849, -1.275298, -3.610557, 1, 1, 1, 1, 1,
-0.6408359, -0.3727119, -1.526455, 1, 1, 1, 1, 1,
-0.6370436, 1.030194, -0.1497111, 1, 1, 1, 1, 1,
-0.6342186, 0.4737737, -0.9014071, 1, 1, 1, 1, 1,
-0.63097, -0.04343378, -3.712614, 0, 0, 1, 1, 1,
-0.6275105, 1.174342, -1.780501, 1, 0, 0, 1, 1,
-0.6247392, -0.06439789, -2.855795, 1, 0, 0, 1, 1,
-0.6109727, -0.9906762, -2.961479, 1, 0, 0, 1, 1,
-0.608454, 0.07549005, -3.479234, 1, 0, 0, 1, 1,
-0.5961953, 1.571777, -1.796659, 1, 0, 0, 1, 1,
-0.5889428, 1.034515, -0.06885266, 0, 0, 0, 1, 1,
-0.5863895, 0.5962773, 0.01745918, 0, 0, 0, 1, 1,
-0.5813565, 0.06589294, -0.5270858, 0, 0, 0, 1, 1,
-0.5771623, -0.6735595, -2.494406, 0, 0, 0, 1, 1,
-0.5749905, 0.1804311, -0.7400277, 0, 0, 0, 1, 1,
-0.5739215, -0.8557946, -2.506035, 0, 0, 0, 1, 1,
-0.5641654, -0.9074882, -2.53253, 0, 0, 0, 1, 1,
-0.5637484, -0.4651597, -2.074613, 1, 1, 1, 1, 1,
-0.5609176, -0.1213747, -1.623656, 1, 1, 1, 1, 1,
-0.5594042, -0.7639367, -1.704598, 1, 1, 1, 1, 1,
-0.5570962, -0.887219, -2.668246, 1, 1, 1, 1, 1,
-0.5554488, -0.1244848, -0.4763704, 1, 1, 1, 1, 1,
-0.5521494, -2.071255, -3.228725, 1, 1, 1, 1, 1,
-0.5467955, -0.6428437, -2.958363, 1, 1, 1, 1, 1,
-0.5459463, 1.685822, -0.450961, 1, 1, 1, 1, 1,
-0.5456972, 0.6616529, -2.415788, 1, 1, 1, 1, 1,
-0.5441719, 1.994751, 0.2030268, 1, 1, 1, 1, 1,
-0.5412625, -0.9503984, -0.9399731, 1, 1, 1, 1, 1,
-0.5401413, 0.7427991, -0.8543697, 1, 1, 1, 1, 1,
-0.5352186, 0.8704155, -0.2211397, 1, 1, 1, 1, 1,
-0.5351366, -0.3830518, -1.109277, 1, 1, 1, 1, 1,
-0.5296012, 0.3052984, -0.996218, 1, 1, 1, 1, 1,
-0.5246773, -0.814532, -1.982497, 0, 0, 1, 1, 1,
-0.5224547, -1.938459, -4.639493, 1, 0, 0, 1, 1,
-0.5209257, -0.6710561, -0.9219261, 1, 0, 0, 1, 1,
-0.5190225, -0.2117509, -2.116797, 1, 0, 0, 1, 1,
-0.5116634, -0.4067068, -0.1097797, 1, 0, 0, 1, 1,
-0.5074203, -1.741204, -1.736777, 1, 0, 0, 1, 1,
-0.5069865, 0.2460791, -2.161686, 0, 0, 0, 1, 1,
-0.5051214, 1.160133, -0.01258666, 0, 0, 0, 1, 1,
-0.5002784, 0.570579, 0.01232714, 0, 0, 0, 1, 1,
-0.5001711, -0.9439465, -3.016008, 0, 0, 0, 1, 1,
-0.4971866, -0.1133358, -0.822457, 0, 0, 0, 1, 1,
-0.4953105, 0.08840613, -0.4150454, 0, 0, 0, 1, 1,
-0.493894, 0.21713, -1.276753, 0, 0, 0, 1, 1,
-0.493352, -0.5563157, -1.541217, 1, 1, 1, 1, 1,
-0.4858827, 0.5944505, 0.001206292, 1, 1, 1, 1, 1,
-0.4856147, -0.1353525, -3.235686, 1, 1, 1, 1, 1,
-0.4847259, 0.8312432, 0.2800528, 1, 1, 1, 1, 1,
-0.4774278, -1.822128, -1.682308, 1, 1, 1, 1, 1,
-0.4773746, -0.1785184, -2.726803, 1, 1, 1, 1, 1,
-0.4765255, 0.3792622, -1.843431, 1, 1, 1, 1, 1,
-0.4746524, 0.1589435, -3.400378, 1, 1, 1, 1, 1,
-0.4701234, 0.7720311, -1.48936, 1, 1, 1, 1, 1,
-0.4638982, 0.01906707, -0.6062474, 1, 1, 1, 1, 1,
-0.4585835, 0.09719349, -0.3017967, 1, 1, 1, 1, 1,
-0.4518799, 0.3919178, -0.6594569, 1, 1, 1, 1, 1,
-0.4464384, 0.4249688, -0.06870462, 1, 1, 1, 1, 1,
-0.4454477, 0.2363497, -0.1131479, 1, 1, 1, 1, 1,
-0.4439041, -1.587842, -3.206409, 1, 1, 1, 1, 1,
-0.4417244, -0.4018858, -0.4432099, 0, 0, 1, 1, 1,
-0.4407171, -0.9652258, -3.712679, 1, 0, 0, 1, 1,
-0.4326509, -0.01255845, -1.340992, 1, 0, 0, 1, 1,
-0.4325035, 0.1000154, -1.586424, 1, 0, 0, 1, 1,
-0.431484, -0.3180925, -1.527205, 1, 0, 0, 1, 1,
-0.4267125, 0.3423544, 0.7377211, 1, 0, 0, 1, 1,
-0.4216214, 0.640466, -2.22949, 0, 0, 0, 1, 1,
-0.4196265, -0.06328418, -1.340551, 0, 0, 0, 1, 1,
-0.4160427, -1.032082, -3.089472, 0, 0, 0, 1, 1,
-0.4142045, -0.9485555, -2.222564, 0, 0, 0, 1, 1,
-0.4112679, 0.4239195, -1.245482, 0, 0, 0, 1, 1,
-0.4087073, 1.063764, 0.04036964, 0, 0, 0, 1, 1,
-0.403814, -1.644005, -1.269607, 0, 0, 0, 1, 1,
-0.3940425, 0.6105478, 1.02573, 1, 1, 1, 1, 1,
-0.3916242, -0.03894008, -1.473649, 1, 1, 1, 1, 1,
-0.390776, 0.2754804, -0.06253459, 1, 1, 1, 1, 1,
-0.3864982, 1.82594, -0.8416051, 1, 1, 1, 1, 1,
-0.3842323, 0.3216406, 0.2251886, 1, 1, 1, 1, 1,
-0.3817393, -1.504078, -3.277863, 1, 1, 1, 1, 1,
-0.3734605, 0.2565267, -1.306617, 1, 1, 1, 1, 1,
-0.3728852, -2.008788, -4.226954, 1, 1, 1, 1, 1,
-0.372348, 0.828549, -0.6746716, 1, 1, 1, 1, 1,
-0.3637737, 1.684305, 0.4404475, 1, 1, 1, 1, 1,
-0.3590195, -0.1809325, -2.036887, 1, 1, 1, 1, 1,
-0.3576306, 1.019406, -0.7197891, 1, 1, 1, 1, 1,
-0.3555938, -0.3296474, -2.294058, 1, 1, 1, 1, 1,
-0.3510151, 0.5613756, -1.094866, 1, 1, 1, 1, 1,
-0.3469897, -1.757756, -2.95252, 1, 1, 1, 1, 1,
-0.3458724, 0.05609282, -1.376904, 0, 0, 1, 1, 1,
-0.3391211, -1.022725, -2.375977, 1, 0, 0, 1, 1,
-0.3374237, -1.140853, -1.692614, 1, 0, 0, 1, 1,
-0.3363145, 1.530478, 0.4178835, 1, 0, 0, 1, 1,
-0.3353367, 0.07992997, -1.436149, 1, 0, 0, 1, 1,
-0.3345753, 0.1383328, 0.01254716, 1, 0, 0, 1, 1,
-0.3310317, -0.2463272, -2.757041, 0, 0, 0, 1, 1,
-0.327471, 0.3995958, -1.398543, 0, 0, 0, 1, 1,
-0.326187, -0.4655796, -1.478947, 0, 0, 0, 1, 1,
-0.3259161, 0.1819278, -0.9854847, 0, 0, 0, 1, 1,
-0.3250968, -0.6161991, -3.581028, 0, 0, 0, 1, 1,
-0.3213941, -0.4274751, -3.448679, 0, 0, 0, 1, 1,
-0.3194234, -0.3581759, 0.06451994, 0, 0, 0, 1, 1,
-0.315536, -0.03000601, -1.154665, 1, 1, 1, 1, 1,
-0.3129876, -1.255987, -1.239905, 1, 1, 1, 1, 1,
-0.3106119, 0.3994569, -1.392953, 1, 1, 1, 1, 1,
-0.3086259, -0.4998172, -3.868716, 1, 1, 1, 1, 1,
-0.3058831, 0.1565179, -2.351403, 1, 1, 1, 1, 1,
-0.3045117, -0.2330181, -2.04556, 1, 1, 1, 1, 1,
-0.2965359, 0.1457608, -1.687503, 1, 1, 1, 1, 1,
-0.2963071, 1.401575, 0.3687561, 1, 1, 1, 1, 1,
-0.292348, -0.8833697, -3.604084, 1, 1, 1, 1, 1,
-0.2888677, 0.3396668, -1.980179, 1, 1, 1, 1, 1,
-0.2876564, -1.223164, -2.802024, 1, 1, 1, 1, 1,
-0.2874584, 1.081367, 0.27315, 1, 1, 1, 1, 1,
-0.2834797, 0.2019389, -0.2963021, 1, 1, 1, 1, 1,
-0.2834505, -0.0902477, -1.711544, 1, 1, 1, 1, 1,
-0.2828828, 0.5300716, -1.000105, 1, 1, 1, 1, 1,
-0.2808149, 1.240656, -0.4001768, 0, 0, 1, 1, 1,
-0.2780917, 1.070128, -0.8486606, 1, 0, 0, 1, 1,
-0.2776344, 0.9644141, -2.423797, 1, 0, 0, 1, 1,
-0.2750222, 0.9655288, 1.263835, 1, 0, 0, 1, 1,
-0.2715136, 0.946395, -0.750505, 1, 0, 0, 1, 1,
-0.2709479, -0.3843346, -1.362521, 1, 0, 0, 1, 1,
-0.2699455, -0.2798534, -3.751552, 0, 0, 0, 1, 1,
-0.268238, 0.07571267, -0.1035144, 0, 0, 0, 1, 1,
-0.2602523, 0.3797794, 0.008916713, 0, 0, 0, 1, 1,
-0.2589924, 1.023583, 0.1110671, 0, 0, 0, 1, 1,
-0.2540666, -0.2863222, -3.309417, 0, 0, 0, 1, 1,
-0.2535828, 0.946655, 0.8311774, 0, 0, 0, 1, 1,
-0.2527403, -0.6360037, -3.635799, 0, 0, 0, 1, 1,
-0.251808, -0.04454754, -0.06230009, 1, 1, 1, 1, 1,
-0.248765, -0.6368442, -2.983424, 1, 1, 1, 1, 1,
-0.2415667, -1.450517, -2.239906, 1, 1, 1, 1, 1,
-0.2390262, -0.2460031, -3.147595, 1, 1, 1, 1, 1,
-0.2347365, 0.1967625, -1.39694, 1, 1, 1, 1, 1,
-0.229298, -0.8584482, -1.849701, 1, 1, 1, 1, 1,
-0.2281442, 0.9782099, -0.03322727, 1, 1, 1, 1, 1,
-0.2262964, 0.1394439, -1.299014, 1, 1, 1, 1, 1,
-0.2237798, -0.4971329, -0.7451122, 1, 1, 1, 1, 1,
-0.2225173, -0.9804134, -3.962366, 1, 1, 1, 1, 1,
-0.2200082, -0.5190407, -2.808155, 1, 1, 1, 1, 1,
-0.2154655, -0.9069175, -3.110324, 1, 1, 1, 1, 1,
-0.2136026, 0.455646, -0.5719829, 1, 1, 1, 1, 1,
-0.2028043, -1.998165, -1.407362, 1, 1, 1, 1, 1,
-0.1938694, 0.8182331, 0.8152986, 1, 1, 1, 1, 1,
-0.1895824, -0.165891, -3.058001, 0, 0, 1, 1, 1,
-0.188836, 1.590546, -0.002398361, 1, 0, 0, 1, 1,
-0.1879447, 1.737056, -0.9126045, 1, 0, 0, 1, 1,
-0.1849167, 0.1975127, -0.4112354, 1, 0, 0, 1, 1,
-0.1805413, -1.364697, -3.517387, 1, 0, 0, 1, 1,
-0.175769, 0.4668797, -0.5571766, 1, 0, 0, 1, 1,
-0.1735872, 0.3693922, 1.318289, 0, 0, 0, 1, 1,
-0.1720236, 0.6696115, 0.2545496, 0, 0, 0, 1, 1,
-0.1715965, 0.1426981, -1.086029, 0, 0, 0, 1, 1,
-0.1714204, -1.677719, -5.030293, 0, 0, 0, 1, 1,
-0.1664718, -0.6220168, -4.092909, 0, 0, 0, 1, 1,
-0.1658843, -0.2155751, -3.206823, 0, 0, 0, 1, 1,
-0.1655711, -2.701448, -3.216365, 0, 0, 0, 1, 1,
-0.1650293, -0.7355502, -2.392056, 1, 1, 1, 1, 1,
-0.1627105, 2.104304, 0.7346417, 1, 1, 1, 1, 1,
-0.1616928, 0.302229, -0.3776786, 1, 1, 1, 1, 1,
-0.1613334, 0.2734692, 0.4930578, 1, 1, 1, 1, 1,
-0.1612292, 1.357427, 0.2497929, 1, 1, 1, 1, 1,
-0.1608213, -1.409454, -2.273281, 1, 1, 1, 1, 1,
-0.1567717, -1.199029, -0.6645734, 1, 1, 1, 1, 1,
-0.1567181, -0.1876296, -3.037646, 1, 1, 1, 1, 1,
-0.1541486, 0.9150455, 0.06141417, 1, 1, 1, 1, 1,
-0.1511614, 0.6138881, -0.7045944, 1, 1, 1, 1, 1,
-0.1448419, 0.8997437, -0.2733838, 1, 1, 1, 1, 1,
-0.1442931, -0.04919114, -1.593246, 1, 1, 1, 1, 1,
-0.1440715, 1.543875, -0.5865804, 1, 1, 1, 1, 1,
-0.1326351, 0.01027695, -2.730759, 1, 1, 1, 1, 1,
-0.1282643, 0.5263846, 1.869925, 1, 1, 1, 1, 1,
-0.1281446, -0.3764537, -1.875178, 0, 0, 1, 1, 1,
-0.1164257, -0.9521753, -4.242013, 1, 0, 0, 1, 1,
-0.1118875, -0.4346685, -3.701382, 1, 0, 0, 1, 1,
-0.1098475, -0.6656407, -3.249311, 1, 0, 0, 1, 1,
-0.1079399, -0.5103576, -4.642848, 1, 0, 0, 1, 1,
-0.1048065, -0.1147165, -0.6619835, 1, 0, 0, 1, 1,
-0.1028029, 0.164678, -1.14061, 0, 0, 0, 1, 1,
-0.102047, 1.183226, -0.4312463, 0, 0, 0, 1, 1,
-0.09817132, 0.7159469, -0.7187515, 0, 0, 0, 1, 1,
-0.09815335, 1.388621, -2.120588, 0, 0, 0, 1, 1,
-0.09614418, 0.8524925, -0.002625078, 0, 0, 0, 1, 1,
-0.09162908, 0.5912043, -0.318225, 0, 0, 0, 1, 1,
-0.08930622, -0.6579742, -3.303888, 0, 0, 0, 1, 1,
-0.08652545, -0.7528569, -2.237708, 1, 1, 1, 1, 1,
-0.08364109, -0.8926612, -2.37464, 1, 1, 1, 1, 1,
-0.08315477, 0.5867686, -1.135585, 1, 1, 1, 1, 1,
-0.08083012, 0.7307212, 0.5009968, 1, 1, 1, 1, 1,
-0.08079207, -1.248342, -3.536875, 1, 1, 1, 1, 1,
-0.07631221, -0.1492452, -3.480041, 1, 1, 1, 1, 1,
-0.07258701, 0.77979, 0.1575026, 1, 1, 1, 1, 1,
-0.07161469, -0.114524, -2.273727, 1, 1, 1, 1, 1,
-0.07026396, -0.670164, -1.069608, 1, 1, 1, 1, 1,
-0.06364442, 0.906188, -0.3768702, 1, 1, 1, 1, 1,
-0.05547255, 1.103944, 1.712153, 1, 1, 1, 1, 1,
-0.054557, 2.335917, 1.369391, 1, 1, 1, 1, 1,
-0.05127476, -0.4772908, -3.504845, 1, 1, 1, 1, 1,
-0.05029765, 0.3128838, 1.336654, 1, 1, 1, 1, 1,
-0.04861846, -0.7592174, -4.743142, 1, 1, 1, 1, 1,
-0.04627744, -1.132561, -3.068434, 0, 0, 1, 1, 1,
-0.04257732, 0.1605456, 1.876644, 1, 0, 0, 1, 1,
-0.03935174, -0.4487571, -3.855618, 1, 0, 0, 1, 1,
-0.03495507, -0.6813518, -2.039881, 1, 0, 0, 1, 1,
-0.03402269, -0.5611815, -1.168082, 1, 0, 0, 1, 1,
-0.03076724, -1.398998, -2.924962, 1, 0, 0, 1, 1,
-0.02950706, -0.02476185, -2.209418, 0, 0, 0, 1, 1,
-0.02571009, 2.024816, -1.7016, 0, 0, 0, 1, 1,
-0.02172629, 0.7950074, -0.3695023, 0, 0, 0, 1, 1,
-0.02160664, 0.01127404, -0.351916, 0, 0, 0, 1, 1,
-0.01790283, 0.03916394, 0.5754266, 0, 0, 0, 1, 1,
-0.01482778, 0.3963817, -0.8167587, 0, 0, 0, 1, 1,
-0.01117231, 0.1987223, -0.7523428, 0, 0, 0, 1, 1,
-0.01111187, 0.5495213, -1.258838, 1, 1, 1, 1, 1,
-0.01066821, -0.09718396, -2.743852, 1, 1, 1, 1, 1,
-0.01047314, -0.8145626, -1.892013, 1, 1, 1, 1, 1,
-0.007813063, -0.6729622, -2.963124, 1, 1, 1, 1, 1,
-0.007037426, -0.03043, -2.572936, 1, 1, 1, 1, 1,
-0.004765975, -0.6301531, -3.342635, 1, 1, 1, 1, 1,
0.01058862, 1.154512, -0.001362885, 1, 1, 1, 1, 1,
0.01432384, 1.01648, 0.7370161, 1, 1, 1, 1, 1,
0.0153443, 0.5322393, -0.2571434, 1, 1, 1, 1, 1,
0.01587045, 2.077272, 0.01997043, 1, 1, 1, 1, 1,
0.01609333, 2.14267, 1.248102, 1, 1, 1, 1, 1,
0.01752617, -0.793559, 0.9236662, 1, 1, 1, 1, 1,
0.01872136, 1.766439, 0.57275, 1, 1, 1, 1, 1,
0.02406213, -0.2679606, 3.523122, 1, 1, 1, 1, 1,
0.02428484, 1.349334, -0.1580959, 1, 1, 1, 1, 1,
0.02518738, -2.252399, 2.257628, 0, 0, 1, 1, 1,
0.02682063, 1.322388, 0.4146426, 1, 0, 0, 1, 1,
0.03431724, -0.9248472, 2.459303, 1, 0, 0, 1, 1,
0.03656738, 0.09326928, -1.847514, 1, 0, 0, 1, 1,
0.03847244, 0.7235073, -0.4884291, 1, 0, 0, 1, 1,
0.04167086, 0.07465745, -1.146677, 1, 0, 0, 1, 1,
0.04588915, 0.8100445, 0.4565825, 0, 0, 0, 1, 1,
0.04869332, -1.004517, 2.862806, 0, 0, 0, 1, 1,
0.04893826, 2.320396, 2.474124, 0, 0, 0, 1, 1,
0.05564351, 0.4774766, 1.354069, 0, 0, 0, 1, 1,
0.05666507, -1.455626, 3.09249, 0, 0, 0, 1, 1,
0.06032718, -1.123653, 4.514969, 0, 0, 0, 1, 1,
0.06546033, 0.1317456, 2.156234, 0, 0, 0, 1, 1,
0.06665504, -0.6620212, 2.17652, 1, 1, 1, 1, 1,
0.06964588, -0.489456, 3.305363, 1, 1, 1, 1, 1,
0.07258344, -0.5632566, 3.073309, 1, 1, 1, 1, 1,
0.07305029, -1.338692, 4.010109, 1, 1, 1, 1, 1,
0.07604209, 1.011062, -0.2704312, 1, 1, 1, 1, 1,
0.07766028, -1.424584, 1.301498, 1, 1, 1, 1, 1,
0.07810517, 2.031397, -0.3267125, 1, 1, 1, 1, 1,
0.07900116, 0.9214041, 0.1752795, 1, 1, 1, 1, 1,
0.08040218, 0.4865987, -0.2400811, 1, 1, 1, 1, 1,
0.08275578, 0.06053844, 0.2308998, 1, 1, 1, 1, 1,
0.08714344, -0.1422032, 2.519021, 1, 1, 1, 1, 1,
0.08726364, -0.118057, 1.903964, 1, 1, 1, 1, 1,
0.0886233, 0.179286, 0.2767147, 1, 1, 1, 1, 1,
0.08987547, -0.9992045, 3.946752, 1, 1, 1, 1, 1,
0.09114964, 0.9508724, 0.1232809, 1, 1, 1, 1, 1,
0.09344256, 0.8800953, 1.725307, 0, 0, 1, 1, 1,
0.09466226, -1.999447, 5.016926, 1, 0, 0, 1, 1,
0.0961456, -0.8506454, 2.461264, 1, 0, 0, 1, 1,
0.09708181, -0.6604257, 3.189215, 1, 0, 0, 1, 1,
0.09725839, -0.9979284, 1.100057, 1, 0, 0, 1, 1,
0.1001299, 0.3231106, 0.8659387, 1, 0, 0, 1, 1,
0.1018709, -0.7905345, 4.007935, 0, 0, 0, 1, 1,
0.1089497, 0.9819043, 0.654751, 0, 0, 0, 1, 1,
0.1107808, -1.398974, 2.196568, 0, 0, 0, 1, 1,
0.1125901, 0.8806947, -1.364587, 0, 0, 0, 1, 1,
0.1143928, -1.408288, 1.89245, 0, 0, 0, 1, 1,
0.1167952, 1.180893, 0.8515428, 0, 0, 0, 1, 1,
0.1209214, 1.342897, -0.143787, 0, 0, 0, 1, 1,
0.1212097, -1.148439, 3.406005, 1, 1, 1, 1, 1,
0.1217148, 0.8429676, -0.883498, 1, 1, 1, 1, 1,
0.1238933, 0.5125837, -0.2767574, 1, 1, 1, 1, 1,
0.125531, -1.664958, 2.554979, 1, 1, 1, 1, 1,
0.1256228, -0.7348054, 2.348969, 1, 1, 1, 1, 1,
0.1265896, -0.6624959, 3.432928, 1, 1, 1, 1, 1,
0.127362, 0.9004558, -0.8773709, 1, 1, 1, 1, 1,
0.1295872, 2.580271, 2.652343, 1, 1, 1, 1, 1,
0.1299095, -1.848238, 1.731483, 1, 1, 1, 1, 1,
0.1411461, 0.237578, 0.4634965, 1, 1, 1, 1, 1,
0.1475924, 0.008684577, 2.893813, 1, 1, 1, 1, 1,
0.1482917, -1.522077, 3.950315, 1, 1, 1, 1, 1,
0.1483592, 1.800744, -0.03121135, 1, 1, 1, 1, 1,
0.1489888, -0.8943961, 2.871405, 1, 1, 1, 1, 1,
0.152263, -0.2743846, 1.005683, 1, 1, 1, 1, 1,
0.1551632, 0.184191, 2.039919, 0, 0, 1, 1, 1,
0.155317, 0.9991633, -0.2512106, 1, 0, 0, 1, 1,
0.1564611, -1.465934, 3.387691, 1, 0, 0, 1, 1,
0.1600405, 1.290858, -0.688307, 1, 0, 0, 1, 1,
0.1601888, -0.2944193, 1.272174, 1, 0, 0, 1, 1,
0.1640553, -0.3496908, 0.971389, 1, 0, 0, 1, 1,
0.1649911, -0.4621821, 2.718036, 0, 0, 0, 1, 1,
0.1696102, -0.01252403, 3.447315, 0, 0, 0, 1, 1,
0.1721482, -1.379226, 4.716014, 0, 0, 0, 1, 1,
0.1794432, -2.061862, 2.09682, 0, 0, 0, 1, 1,
0.1822958, 1.031076, 0.04567004, 0, 0, 0, 1, 1,
0.1827489, 0.7096469, 1.824155, 0, 0, 0, 1, 1,
0.1829329, 0.5486314, 0.0004016273, 0, 0, 0, 1, 1,
0.1865404, 0.8693166, -0.1897881, 1, 1, 1, 1, 1,
0.1894198, 0.5148401, 2.409346, 1, 1, 1, 1, 1,
0.1993121, 0.1533801, 1.477949, 1, 1, 1, 1, 1,
0.2015197, -0.9513145, 1.688953, 1, 1, 1, 1, 1,
0.2118614, 0.1136258, 1.15892, 1, 1, 1, 1, 1,
0.2119523, 0.5823421, 0.972526, 1, 1, 1, 1, 1,
0.2153295, 0.4754144, -0.05124942, 1, 1, 1, 1, 1,
0.2177036, 0.6918777, -0.7005595, 1, 1, 1, 1, 1,
0.2202701, -0.1111122, 3.95499, 1, 1, 1, 1, 1,
0.2208345, -1.311127, 2.982817, 1, 1, 1, 1, 1,
0.2243086, 0.2939495, -0.1172049, 1, 1, 1, 1, 1,
0.2292157, -0.02083932, 2.237587, 1, 1, 1, 1, 1,
0.23409, 0.1469083, 0.6867313, 1, 1, 1, 1, 1,
0.2346262, -1.672064, 3.265801, 1, 1, 1, 1, 1,
0.2363138, -0.6602929, 3.333491, 1, 1, 1, 1, 1,
0.2404187, 1.493533, 0.4233464, 0, 0, 1, 1, 1,
0.24169, 0.3752115, 0.3993428, 1, 0, 0, 1, 1,
0.2501183, 1.192142, -0.8602216, 1, 0, 0, 1, 1,
0.2506026, -1.383989, 1.358577, 1, 0, 0, 1, 1,
0.251327, 1.55219, 1.251862, 1, 0, 0, 1, 1,
0.2522717, 0.04144409, 1.528783, 1, 0, 0, 1, 1,
0.2526752, 0.02899064, 2.130113, 0, 0, 0, 1, 1,
0.2558901, 0.1716093, 1.934751, 0, 0, 0, 1, 1,
0.2565082, -1.441225, 2.725641, 0, 0, 0, 1, 1,
0.2588249, 2.697458, -0.4280213, 0, 0, 0, 1, 1,
0.2597112, -0.06384224, -0.1286827, 0, 0, 0, 1, 1,
0.2604707, -0.688836, 4.339227, 0, 0, 0, 1, 1,
0.2605686, -0.3023216, 2.785784, 0, 0, 0, 1, 1,
0.2655626, -0.62618, 4.135788, 1, 1, 1, 1, 1,
0.2697504, 0.5922377, 1.778131, 1, 1, 1, 1, 1,
0.2708739, -1.139911, 6.20426, 1, 1, 1, 1, 1,
0.2711284, 2.238166, -0.1071246, 1, 1, 1, 1, 1,
0.2718273, 0.3003078, 1.456842, 1, 1, 1, 1, 1,
0.2722987, 0.08523235, 0.05994127, 1, 1, 1, 1, 1,
0.2765783, 1.216205, -0.5272437, 1, 1, 1, 1, 1,
0.2786517, -0.1056074, 0.4935681, 1, 1, 1, 1, 1,
0.2802469, 0.1068528, 2.17283, 1, 1, 1, 1, 1,
0.2808033, 0.414969, -0.02790056, 1, 1, 1, 1, 1,
0.2828598, 0.4518104, 0.1155082, 1, 1, 1, 1, 1,
0.2832272, 1.123241, 0.7085413, 1, 1, 1, 1, 1,
0.2841293, -0.9670584, 3.877877, 1, 1, 1, 1, 1,
0.2851751, -0.2718845, 1.421202, 1, 1, 1, 1, 1,
0.2966116, -0.1190974, 2.660087, 1, 1, 1, 1, 1,
0.2975264, -1.313332, 2.583724, 0, 0, 1, 1, 1,
0.2987987, -0.1175224, 1.427862, 1, 0, 0, 1, 1,
0.3001134, 0.6388682, -0.6813338, 1, 0, 0, 1, 1,
0.311415, 0.9126456, 0.8982536, 1, 0, 0, 1, 1,
0.3130321, 0.2230902, 2.713685, 1, 0, 0, 1, 1,
0.3186762, 1.226643, 0.2291003, 1, 0, 0, 1, 1,
0.3197375, -0.6843143, 1.338022, 0, 0, 0, 1, 1,
0.3202033, -1.007019, 3.034889, 0, 0, 0, 1, 1,
0.3215692, -0.4693709, 2.488304, 0, 0, 0, 1, 1,
0.3294151, -1.035004, 5.406779, 0, 0, 0, 1, 1,
0.3311964, 0.8514233, 0.6355634, 0, 0, 0, 1, 1,
0.3312645, 0.2728503, -0.8942084, 0, 0, 0, 1, 1,
0.3369599, -1.526153, 2.939581, 0, 0, 0, 1, 1,
0.3421642, 0.1473871, 0.7334046, 1, 1, 1, 1, 1,
0.3428343, -0.4534529, 2.788648, 1, 1, 1, 1, 1,
0.3440642, 0.819803, 1.725808, 1, 1, 1, 1, 1,
0.3452162, -0.8494225, 1.414142, 1, 1, 1, 1, 1,
0.3514025, -0.6050117, 2.937993, 1, 1, 1, 1, 1,
0.3525854, -0.07762308, 2.098805, 1, 1, 1, 1, 1,
0.3559005, 0.4286073, -0.1373057, 1, 1, 1, 1, 1,
0.3560866, 0.2271213, 2.477772, 1, 1, 1, 1, 1,
0.3607122, -0.573117, 3.799652, 1, 1, 1, 1, 1,
0.3619496, 0.3151183, 1.830137, 1, 1, 1, 1, 1,
0.3622772, -1.397384, 0.7714187, 1, 1, 1, 1, 1,
0.3625854, 1.688433, -2.656923, 1, 1, 1, 1, 1,
0.3674766, 0.4743904, -0.4374522, 1, 1, 1, 1, 1,
0.3782539, -0.3209401, 3.657429, 1, 1, 1, 1, 1,
0.3806354, -0.6035854, 1.290806, 1, 1, 1, 1, 1,
0.3848259, 2.578, -0.1541847, 0, 0, 1, 1, 1,
0.3856159, -0.3257265, 1.330448, 1, 0, 0, 1, 1,
0.3861596, 1.000928, 0.4076718, 1, 0, 0, 1, 1,
0.3903691, -0.04226964, 2.392627, 1, 0, 0, 1, 1,
0.391527, 2.281762, -0.6398305, 1, 0, 0, 1, 1,
0.3938072, 1.32809, 0.8072651, 1, 0, 0, 1, 1,
0.3960216, 0.2299459, 0.8258209, 0, 0, 0, 1, 1,
0.4030876, 0.3928514, 1.432817, 0, 0, 0, 1, 1,
0.4070596, 0.6775327, 0.8974513, 0, 0, 0, 1, 1,
0.4131447, 0.1544041, 1.455926, 0, 0, 0, 1, 1,
0.4149386, 0.7206399, 2.176249, 0, 0, 0, 1, 1,
0.4156643, -0.2699521, 2.524531, 0, 0, 0, 1, 1,
0.418157, 0.1494792, 1.551478, 0, 0, 0, 1, 1,
0.4211436, -0.06287054, 0.7833605, 1, 1, 1, 1, 1,
0.4236445, 0.1775093, 1.482447, 1, 1, 1, 1, 1,
0.4266925, 1.259543, -0.08703818, 1, 1, 1, 1, 1,
0.42986, 1.047904, 0.2775381, 1, 1, 1, 1, 1,
0.4325499, 0.5045208, 1.337134, 1, 1, 1, 1, 1,
0.4332748, 1.142553, -1.300964, 1, 1, 1, 1, 1,
0.4335115, -2.617337, 4.383176, 1, 1, 1, 1, 1,
0.4336864, 1.25313, 0.8242748, 1, 1, 1, 1, 1,
0.434548, 0.5865369, -0.0819771, 1, 1, 1, 1, 1,
0.4347906, 0.2536496, 1.406647, 1, 1, 1, 1, 1,
0.4373149, 0.8022445, 1.383996, 1, 1, 1, 1, 1,
0.439918, -0.237792, 2.553682, 1, 1, 1, 1, 1,
0.4409962, 1.653622, 0.9659115, 1, 1, 1, 1, 1,
0.4425691, -1.218709, 3.335159, 1, 1, 1, 1, 1,
0.4437088, -2.35323, 4.61884, 1, 1, 1, 1, 1,
0.4486578, -0.2377081, 0.787676, 0, 0, 1, 1, 1,
0.4516598, -0.3996965, 2.332913, 1, 0, 0, 1, 1,
0.4518533, 0.5178431, 0.8873238, 1, 0, 0, 1, 1,
0.4554959, 1.124024, 1.51014, 1, 0, 0, 1, 1,
0.456314, 1.655209, 2.273376, 1, 0, 0, 1, 1,
0.4579477, -1.23375, 1.285555, 1, 0, 0, 1, 1,
0.4585536, -0.04752263, 1.847396, 0, 0, 0, 1, 1,
0.4622311, -1.047992, 2.663505, 0, 0, 0, 1, 1,
0.466859, 1.042067, 1.70276, 0, 0, 0, 1, 1,
0.4686112, -1.249612, 2.569116, 0, 0, 0, 1, 1,
0.4698249, -0.4340445, 1.993103, 0, 0, 0, 1, 1,
0.4731247, 1.844969, 0.9249765, 0, 0, 0, 1, 1,
0.4745368, 0.5144699, 1.717468, 0, 0, 0, 1, 1,
0.4825427, -1.816744, 3.977859, 1, 1, 1, 1, 1,
0.48259, -0.8279052, 3.080278, 1, 1, 1, 1, 1,
0.4862546, 0.3641283, -0.4607655, 1, 1, 1, 1, 1,
0.4885131, 0.4682146, 2.095803, 1, 1, 1, 1, 1,
0.4895154, -0.2704785, 3.483854, 1, 1, 1, 1, 1,
0.4901365, 0.2358359, 1.474555, 1, 1, 1, 1, 1,
0.4910254, -0.6684582, 3.81556, 1, 1, 1, 1, 1,
0.4920405, 0.09819613, 0.9902765, 1, 1, 1, 1, 1,
0.4929914, -0.8267279, 2.417737, 1, 1, 1, 1, 1,
0.4932872, 0.1267002, -0.6319532, 1, 1, 1, 1, 1,
0.4939964, 1.167972, 0.7418853, 1, 1, 1, 1, 1,
0.4952819, 0.03514537, 3.961813, 1, 1, 1, 1, 1,
0.5001718, -0.0748634, 0.2615536, 1, 1, 1, 1, 1,
0.501951, -0.8644887, 2.481293, 1, 1, 1, 1, 1,
0.504544, -0.542353, 2.079249, 1, 1, 1, 1, 1,
0.5064477, 2.028096, 0.8091269, 0, 0, 1, 1, 1,
0.5109559, 0.2574481, 0.4612658, 1, 0, 0, 1, 1,
0.513595, -0.5269512, 2.085174, 1, 0, 0, 1, 1,
0.5158839, 1.3046, 1.361503, 1, 0, 0, 1, 1,
0.517714, 2.783081, 0.1665098, 1, 0, 0, 1, 1,
0.5206119, -1.637258, 2.349227, 1, 0, 0, 1, 1,
0.5207277, -0.01409772, 2.868179, 0, 0, 0, 1, 1,
0.5215022, 0.9059057, 0.8490039, 0, 0, 0, 1, 1,
0.5226316, 1.233286, 2.070982, 0, 0, 0, 1, 1,
0.5314137, -0.4935869, 3.442785, 0, 0, 0, 1, 1,
0.5325944, 1.305995, 0.7933716, 0, 0, 0, 1, 1,
0.5332017, 0.9732493, 1.140059, 0, 0, 0, 1, 1,
0.5332662, 0.3144996, 2.8652, 0, 0, 0, 1, 1,
0.5362038, 0.1536689, -0.5295604, 1, 1, 1, 1, 1,
0.5382254, -1.76347, 3.795244, 1, 1, 1, 1, 1,
0.5391091, -0.3221011, 3.909257, 1, 1, 1, 1, 1,
0.544776, -0.3282143, 1.689114, 1, 1, 1, 1, 1,
0.545063, -1.092553, 3.57808, 1, 1, 1, 1, 1,
0.5451139, -0.1553997, 1.700822, 1, 1, 1, 1, 1,
0.5497491, 0.4230253, 1.144256, 1, 1, 1, 1, 1,
0.5566465, -0.02528378, 1.904485, 1, 1, 1, 1, 1,
0.5601328, 0.1817348, 1.662458, 1, 1, 1, 1, 1,
0.5604643, 0.4616669, 1.005988, 1, 1, 1, 1, 1,
0.5656359, -0.5770276, 1.212185, 1, 1, 1, 1, 1,
0.5674241, 0.3077163, 0.66184, 1, 1, 1, 1, 1,
0.5748692, -0.7631691, 3.401889, 1, 1, 1, 1, 1,
0.5817237, 0.9101106, 1.214535, 1, 1, 1, 1, 1,
0.5846577, 1.574406, 1.470998, 1, 1, 1, 1, 1,
0.588186, -1.293936, 2.820144, 0, 0, 1, 1, 1,
0.5893657, -0.5270629, 1.640494, 1, 0, 0, 1, 1,
0.5910688, 0.7994522, 0.9006553, 1, 0, 0, 1, 1,
0.5923336, 2.408359, 1.269808, 1, 0, 0, 1, 1,
0.5945598, -0.1595106, 0.8598185, 1, 0, 0, 1, 1,
0.5975024, 1.303546, 0.4587965, 1, 0, 0, 1, 1,
0.6012926, 0.1946697, 2.168718, 0, 0, 0, 1, 1,
0.6044195, -1.46825, 2.291478, 0, 0, 0, 1, 1,
0.6052037, -0.9651554, 2.6955, 0, 0, 0, 1, 1,
0.6059831, 0.4728127, 1.283873, 0, 0, 0, 1, 1,
0.6123422, 0.4122607, -0.486406, 0, 0, 0, 1, 1,
0.6140088, 1.847043, -1.64124, 0, 0, 0, 1, 1,
0.6239917, 0.05372556, 0.7635069, 0, 0, 0, 1, 1,
0.6249493, 0.6494963, 0.5359418, 1, 1, 1, 1, 1,
0.6273921, 0.4046183, 0.5470225, 1, 1, 1, 1, 1,
0.6311484, -0.1509048, 3.897053, 1, 1, 1, 1, 1,
0.6312521, -0.6291071, 0.7445855, 1, 1, 1, 1, 1,
0.6324908, -0.658347, 3.811052, 1, 1, 1, 1, 1,
0.6342698, 0.3761959, 1.524312, 1, 1, 1, 1, 1,
0.6393756, -0.7463582, 2.369927, 1, 1, 1, 1, 1,
0.6422754, 0.8855271, 0.05604165, 1, 1, 1, 1, 1,
0.6424345, -1.367104, 2.694022, 1, 1, 1, 1, 1,
0.6453004, -0.8491325, 4.956983, 1, 1, 1, 1, 1,
0.6503875, 0.5977129, 1.273626, 1, 1, 1, 1, 1,
0.6523204, -0.812355, 2.832022, 1, 1, 1, 1, 1,
0.6526462, 0.3342523, 1.30322, 1, 1, 1, 1, 1,
0.6580975, -0.3605348, 2.50528, 1, 1, 1, 1, 1,
0.6592703, 0.7824229, 1.912735, 1, 1, 1, 1, 1,
0.6633571, -0.1405761, 2.553582, 0, 0, 1, 1, 1,
0.6649589, -0.2619414, 2.03537, 1, 0, 0, 1, 1,
0.6663104, -0.661961, 2.885822, 1, 0, 0, 1, 1,
0.6708886, -0.3854094, -0.3525456, 1, 0, 0, 1, 1,
0.6818607, -0.4045644, 1.02463, 1, 0, 0, 1, 1,
0.684305, 0.2298494, 1.15464, 1, 0, 0, 1, 1,
0.6891479, -0.7920237, 3.560127, 0, 0, 0, 1, 1,
0.6919521, 0.636257, 2.81375, 0, 0, 0, 1, 1,
0.6926361, 0.0893101, 1.357287, 0, 0, 0, 1, 1,
0.6956857, 0.5217827, -0.02411715, 0, 0, 0, 1, 1,
0.6958422, -0.5518366, 1.926616, 0, 0, 0, 1, 1,
0.7023024, -0.5203382, 0.8357174, 0, 0, 0, 1, 1,
0.7027538, 0.5206545, 1.560958, 0, 0, 0, 1, 1,
0.703207, -1.859165, 0.3936894, 1, 1, 1, 1, 1,
0.7098119, 0.8047106, 0.6948377, 1, 1, 1, 1, 1,
0.7100807, -1.193253, 3.206453, 1, 1, 1, 1, 1,
0.7129104, -0.7684203, 2.013647, 1, 1, 1, 1, 1,
0.7216836, -0.3249002, 2.221001, 1, 1, 1, 1, 1,
0.7237314, -0.1180006, 0.3343284, 1, 1, 1, 1, 1,
0.7241336, 0.9730442, 1.244763, 1, 1, 1, 1, 1,
0.7243358, 1.577896, -0.5230852, 1, 1, 1, 1, 1,
0.7257056, 1.600049, 0.4504668, 1, 1, 1, 1, 1,
0.7318763, -0.282277, 1.302002, 1, 1, 1, 1, 1,
0.7327835, -0.1123699, -0.08774491, 1, 1, 1, 1, 1,
0.7357731, -1.275157, 1.478521, 1, 1, 1, 1, 1,
0.7382996, 0.8494442, 0.4419016, 1, 1, 1, 1, 1,
0.7405322, 0.4649174, 1.794724, 1, 1, 1, 1, 1,
0.7452297, 0.1137898, 2.279426, 1, 1, 1, 1, 1,
0.751121, 0.5602557, -0.8650318, 0, 0, 1, 1, 1,
0.7521101, -0.2802155, 1.341654, 1, 0, 0, 1, 1,
0.754561, -1.083259, 2.495696, 1, 0, 0, 1, 1,
0.7548066, 1.070847, 0.4972109, 1, 0, 0, 1, 1,
0.755688, -1.194252, 3.156341, 1, 0, 0, 1, 1,
0.7587076, 1.340861, -0.3020481, 1, 0, 0, 1, 1,
0.7588894, 1.814854, 0.6730808, 0, 0, 0, 1, 1,
0.7595699, -0.6396652, 1.91529, 0, 0, 0, 1, 1,
0.7644842, 0.6506499, -0.03061121, 0, 0, 0, 1, 1,
0.7647381, -0.1772228, 1.392767, 0, 0, 0, 1, 1,
0.7658572, 0.4538632, 0.0243372, 0, 0, 0, 1, 1,
0.7674875, -0.4853866, 2.044114, 0, 0, 0, 1, 1,
0.7679483, 0.2609184, 0.9780723, 0, 0, 0, 1, 1,
0.76802, 0.8250505, 0.6118807, 1, 1, 1, 1, 1,
0.7701022, 1.657083, -0.09032841, 1, 1, 1, 1, 1,
0.7745973, 1.022695, -0.175966, 1, 1, 1, 1, 1,
0.7750142, -0.03484067, 0.01543025, 1, 1, 1, 1, 1,
0.7764664, -0.1178699, 1.669504, 1, 1, 1, 1, 1,
0.7773709, -0.2839493, 0.2194668, 1, 1, 1, 1, 1,
0.7819187, 1.685757, 0.8469782, 1, 1, 1, 1, 1,
0.7896197, -0.9032004, 1.398561, 1, 1, 1, 1, 1,
0.7934378, 1.090723, 0.9051755, 1, 1, 1, 1, 1,
0.7934548, 0.7155792, 1.274459, 1, 1, 1, 1, 1,
0.7993793, -2.083435, 3.447353, 1, 1, 1, 1, 1,
0.7996209, 0.6861836, 0.9986392, 1, 1, 1, 1, 1,
0.8042911, -1.729317, 1.969228, 1, 1, 1, 1, 1,
0.8058439, 0.004083181, 0.4909366, 1, 1, 1, 1, 1,
0.8073602, 0.1911688, 1.244784, 1, 1, 1, 1, 1,
0.8080611, -0.1510828, 1.222961, 0, 0, 1, 1, 1,
0.8091407, 2.011544, -0.07244186, 1, 0, 0, 1, 1,
0.8138383, 1.22665, -0.5126486, 1, 0, 0, 1, 1,
0.8208105, -0.3674915, 3.504899, 1, 0, 0, 1, 1,
0.8214203, 0.9191217, 0.4031726, 1, 0, 0, 1, 1,
0.8256475, 0.336644, 0.9382777, 1, 0, 0, 1, 1,
0.8298006, -0.8551038, 3.04455, 0, 0, 0, 1, 1,
0.8414325, -0.2043509, -0.3876536, 0, 0, 0, 1, 1,
0.8419632, 0.02182484, 1.695509, 0, 0, 0, 1, 1,
0.8500911, 0.7295233, 1.041172, 0, 0, 0, 1, 1,
0.8557539, 0.8041964, 1.511778, 0, 0, 0, 1, 1,
0.8563423, -1.179079, 3.486312, 0, 0, 0, 1, 1,
0.8576049, 0.151871, 0.4161444, 0, 0, 0, 1, 1,
0.8608284, -0.6146454, -1.354323, 1, 1, 1, 1, 1,
0.870843, 0.9710145, -0.5766761, 1, 1, 1, 1, 1,
0.8709215, -0.6098084, 2.754362, 1, 1, 1, 1, 1,
0.8719657, -1.753936, 1.805799, 1, 1, 1, 1, 1,
0.8744419, -0.6992673, 2.481379, 1, 1, 1, 1, 1,
0.8754412, -0.3156732, 1.089956, 1, 1, 1, 1, 1,
0.8766927, -0.4242716, 1.657624, 1, 1, 1, 1, 1,
0.8779312, 0.1051743, -0.09363469, 1, 1, 1, 1, 1,
0.8794808, 1.209764, 0.8734993, 1, 1, 1, 1, 1,
0.8810765, 0.02329418, 3.174893, 1, 1, 1, 1, 1,
0.8858611, -0.280047, 2.063119, 1, 1, 1, 1, 1,
0.8873259, -0.4942086, 2.769207, 1, 1, 1, 1, 1,
0.8920076, 0.694931, 1.369173, 1, 1, 1, 1, 1,
0.8984109, 0.6179953, 0.8131354, 1, 1, 1, 1, 1,
0.9042375, -0.4408456, 3.147618, 1, 1, 1, 1, 1,
0.9061086, -0.5599969, 3.178607, 0, 0, 1, 1, 1,
0.9097274, -0.1564292, 4.110074, 1, 0, 0, 1, 1,
0.9103019, -1.731676, 1.326476, 1, 0, 0, 1, 1,
0.9141731, -0.665931, 1.192595, 1, 0, 0, 1, 1,
0.9201578, 1.858046, 0.05257367, 1, 0, 0, 1, 1,
0.9254173, -0.4035797, 1.570652, 1, 0, 0, 1, 1,
0.9310111, -0.2089763, 2.336178, 0, 0, 0, 1, 1,
0.9312118, -1.248457, 1.689226, 0, 0, 0, 1, 1,
0.9322225, -0.4076766, 1.681256, 0, 0, 0, 1, 1,
0.9336883, 0.3654703, 0.9216832, 0, 0, 0, 1, 1,
0.93405, -1.213273, 2.738749, 0, 0, 0, 1, 1,
0.937502, 1.713986, 1.185842, 0, 0, 0, 1, 1,
0.9540799, -0.6126671, 1.922401, 0, 0, 0, 1, 1,
0.9558962, -0.5679691, 1.037293, 1, 1, 1, 1, 1,
0.9628069, -0.2355658, 1.57172, 1, 1, 1, 1, 1,
0.9650695, 1.409104, 1.309554, 1, 1, 1, 1, 1,
0.9670632, -1.206665, 2.90155, 1, 1, 1, 1, 1,
0.970966, 1.875502, 1.135463, 1, 1, 1, 1, 1,
0.9838845, -1.321465, 0.4082111, 1, 1, 1, 1, 1,
0.9877959, 0.9029801, 1.63043, 1, 1, 1, 1, 1,
0.9886898, 1.284878, 0.3044217, 1, 1, 1, 1, 1,
0.9921917, 0.1047594, 2.19108, 1, 1, 1, 1, 1,
1.009218, -0.9428556, 2.072662, 1, 1, 1, 1, 1,
1.010702, -0.5278266, 0.7502958, 1, 1, 1, 1, 1,
1.014405, 0.6316318, 1.102712, 1, 1, 1, 1, 1,
1.019761, -0.6624312, 1.940536, 1, 1, 1, 1, 1,
1.020919, 1.276958, 1.483043, 1, 1, 1, 1, 1,
1.02383, 0.7359719, 1.090991, 1, 1, 1, 1, 1,
1.026257, -1.12897, 2.737604, 0, 0, 1, 1, 1,
1.03837, -1.006338, 2.346058, 1, 0, 0, 1, 1,
1.056696, 0.954573, 0.6775905, 1, 0, 0, 1, 1,
1.064369, 0.3004734, 1.077884, 1, 0, 0, 1, 1,
1.06775, 0.1375431, 2.221658, 1, 0, 0, 1, 1,
1.070774, 0.3203687, 0.5753108, 1, 0, 0, 1, 1,
1.071477, -0.1752955, 2.415638, 0, 0, 0, 1, 1,
1.072216, 0.4210277, 1.722512, 0, 0, 0, 1, 1,
1.077205, 1.477341, 3.476991, 0, 0, 0, 1, 1,
1.077615, -0.6473407, 1.271415, 0, 0, 0, 1, 1,
1.081925, 0.2671797, 1.375016, 0, 0, 0, 1, 1,
1.082307, 1.127754, 0.2547229, 0, 0, 0, 1, 1,
1.082492, 1.586215, 0.7575256, 0, 0, 0, 1, 1,
1.085673, -0.8224349, 3.537225, 1, 1, 1, 1, 1,
1.097256, 0.4383968, 0.7851416, 1, 1, 1, 1, 1,
1.099494, 1.444486, 1.800008, 1, 1, 1, 1, 1,
1.102983, 0.61451, 0.1343778, 1, 1, 1, 1, 1,
1.109559, 0.4618341, 1.39185, 1, 1, 1, 1, 1,
1.112995, -0.2514319, 1.037313, 1, 1, 1, 1, 1,
1.113929, -2.342981, 4.292706, 1, 1, 1, 1, 1,
1.127607, -0.2055354, 3.226573, 1, 1, 1, 1, 1,
1.129315, 0.5450551, 1.942648, 1, 1, 1, 1, 1,
1.13019, 0.8656451, 1.004476, 1, 1, 1, 1, 1,
1.136896, 1.076476, -0.06782024, 1, 1, 1, 1, 1,
1.138667, 1.710077, 0.2800016, 1, 1, 1, 1, 1,
1.143232, -0.292225, 1.991291, 1, 1, 1, 1, 1,
1.147108, -0.4018744, 2.631112, 1, 1, 1, 1, 1,
1.152857, -0.4893078, 1.677364, 1, 1, 1, 1, 1,
1.161071, -0.2530518, 1.905924, 0, 0, 1, 1, 1,
1.163387, -0.4512212, 0.7423689, 1, 0, 0, 1, 1,
1.17162, 0.5644275, 2.529166, 1, 0, 0, 1, 1,
1.171829, 0.6232247, 3.976499, 1, 0, 0, 1, 1,
1.177974, -0.4886455, 3.131552, 1, 0, 0, 1, 1,
1.181876, -1.452158, 2.49459, 1, 0, 0, 1, 1,
1.18264, 1.166046, 2.048122, 0, 0, 0, 1, 1,
1.190161, -1.486589, 2.265259, 0, 0, 0, 1, 1,
1.191807, 0.3741505, 0.418586, 0, 0, 0, 1, 1,
1.193277, 0.2160056, 0.1833318, 0, 0, 0, 1, 1,
1.200572, 0.7360445, 0.08918165, 0, 0, 0, 1, 1,
1.203148, 0.6475607, 1.856353, 0, 0, 0, 1, 1,
1.204688, -0.542685, 0.655502, 0, 0, 0, 1, 1,
1.20844, -0.7375644, 2.494855, 1, 1, 1, 1, 1,
1.216746, 1.065007, 0.5886931, 1, 1, 1, 1, 1,
1.217721, 0.1680739, 1.088947, 1, 1, 1, 1, 1,
1.218831, -0.1300555, 1.935617, 1, 1, 1, 1, 1,
1.232064, -1.069863, 3.111845, 1, 1, 1, 1, 1,
1.232408, 0.05232095, 3.575701, 1, 1, 1, 1, 1,
1.233757, -1.486571, 4.717899, 1, 1, 1, 1, 1,
1.238788, -1.980763, 2.019868, 1, 1, 1, 1, 1,
1.239129, 0.5576921, 0.4553629, 1, 1, 1, 1, 1,
1.241321, -1.410239, 2.140978, 1, 1, 1, 1, 1,
1.246152, 0.3733761, 1.448243, 1, 1, 1, 1, 1,
1.247848, -1.327915, 1.632189, 1, 1, 1, 1, 1,
1.249164, -0.4482834, 2.680654, 1, 1, 1, 1, 1,
1.250926, 0.03591579, 1.311612, 1, 1, 1, 1, 1,
1.259881, 0.1531023, 0.8542436, 1, 1, 1, 1, 1,
1.264557, 0.07792768, 1.209151, 0, 0, 1, 1, 1,
1.268562, -0.274971, 1.401383, 1, 0, 0, 1, 1,
1.280672, -1.288366, 2.40688, 1, 0, 0, 1, 1,
1.283666, -0.03515254, 4.298908, 1, 0, 0, 1, 1,
1.292119, 0.8308763, -0.5226728, 1, 0, 0, 1, 1,
1.295026, -0.7890035, 1.195171, 1, 0, 0, 1, 1,
1.303191, 0.9899303, 1.243531, 0, 0, 0, 1, 1,
1.319574, -0.9959109, 0.4449428, 0, 0, 0, 1, 1,
1.329236, -1.373753, 1.234696, 0, 0, 0, 1, 1,
1.329869, -0.7085423, 1.886183, 0, 0, 0, 1, 1,
1.333682, -2.395595, 2.732274, 0, 0, 0, 1, 1,
1.335842, 1.138266, -0.2097808, 0, 0, 0, 1, 1,
1.341582, -0.9626478, 2.04397, 0, 0, 0, 1, 1,
1.344942, -1.802742, 1.538953, 1, 1, 1, 1, 1,
1.351481, 0.2263734, -0.4348313, 1, 1, 1, 1, 1,
1.35218, 1.859784, -0.0170492, 1, 1, 1, 1, 1,
1.370797, 0.9470053, 0.8483515, 1, 1, 1, 1, 1,
1.372564, -0.9144743, 1.402366, 1, 1, 1, 1, 1,
1.390833, -0.4291749, 2.330909, 1, 1, 1, 1, 1,
1.416956, 1.002154, 1.011821, 1, 1, 1, 1, 1,
1.41728, 1.096333, 1.677104, 1, 1, 1, 1, 1,
1.427934, -0.1888663, 0.9238385, 1, 1, 1, 1, 1,
1.434867, 0.6638279, 1.488028, 1, 1, 1, 1, 1,
1.437664, 0.631298, 0.7194462, 1, 1, 1, 1, 1,
1.459756, -1.026444, 0.9351037, 1, 1, 1, 1, 1,
1.469081, 0.1935122, 0.9880189, 1, 1, 1, 1, 1,
1.47125, -1.150008, 0.9953301, 1, 1, 1, 1, 1,
1.471663, 1.823454, 0.1318945, 1, 1, 1, 1, 1,
1.476092, -0.6089037, 0.3955065, 0, 0, 1, 1, 1,
1.478021, -0.7193501, 1.046817, 1, 0, 0, 1, 1,
1.479593, -1.96193, 1.644582, 1, 0, 0, 1, 1,
1.494064, -1.712026, 3.245169, 1, 0, 0, 1, 1,
1.504067, 2.758278, 1.781631, 1, 0, 0, 1, 1,
1.514326, 0.4191741, 0.6005526, 1, 0, 0, 1, 1,
1.516008, 1.038659, 1.780871, 0, 0, 0, 1, 1,
1.516482, -1.183786, 2.246155, 0, 0, 0, 1, 1,
1.5229, 0.1922134, 2.610029, 0, 0, 0, 1, 1,
1.528782, -0.007305836, 0.8930618, 0, 0, 0, 1, 1,
1.570316, 0.2788242, 1.334142, 0, 0, 0, 1, 1,
1.579973, 1.798167, 1.568155, 0, 0, 0, 1, 1,
1.582001, -1.396554, 2.900695, 0, 0, 0, 1, 1,
1.585161, 0.1303041, 0.8659567, 1, 1, 1, 1, 1,
1.585398, 0.3077985, 0.6558327, 1, 1, 1, 1, 1,
1.586386, -1.368774, 0.2026449, 1, 1, 1, 1, 1,
1.600912, -0.9617152, 0.4424606, 1, 1, 1, 1, 1,
1.603607, 0.7449865, 0.4853353, 1, 1, 1, 1, 1,
1.610513, -0.6141821, 2.757867, 1, 1, 1, 1, 1,
1.611171, 0.7485135, 0.8872293, 1, 1, 1, 1, 1,
1.615041, -0.2633653, 1.558711, 1, 1, 1, 1, 1,
1.626263, 0.8117474, -0.5408002, 1, 1, 1, 1, 1,
1.637596, 0.3135957, 0.2248918, 1, 1, 1, 1, 1,
1.649115, 0.521341, 1.748462, 1, 1, 1, 1, 1,
1.66351, 0.2405781, 2.128851, 1, 1, 1, 1, 1,
1.682197, -1.465362, -0.4529615, 1, 1, 1, 1, 1,
1.687755, 0.4694329, 2.00054, 1, 1, 1, 1, 1,
1.690679, 0.4239826, 2.923499, 1, 1, 1, 1, 1,
1.703779, -1.068225, 2.241997, 0, 0, 1, 1, 1,
1.71106, -0.2846325, 2.905485, 1, 0, 0, 1, 1,
1.717982, 0.4880363, 1.054845, 1, 0, 0, 1, 1,
1.735213, -0.8924044, 2.3664, 1, 0, 0, 1, 1,
1.735262, -0.8706187, 2.290517, 1, 0, 0, 1, 1,
1.747767, -2.02877, 2.736376, 1, 0, 0, 1, 1,
1.748045, -0.131974, 2.344404, 0, 0, 0, 1, 1,
1.752847, -2.464335, 2.73565, 0, 0, 0, 1, 1,
1.75862, 0.9332902, 1.970627, 0, 0, 0, 1, 1,
1.760705, 0.1556186, 1.515855, 0, 0, 0, 1, 1,
1.799103, 0.3249282, 0.9332435, 0, 0, 0, 1, 1,
1.806324, 0.9511923, 1.024938, 0, 0, 0, 1, 1,
1.80993, -0.1500873, 1.771589, 0, 0, 0, 1, 1,
1.819468, 0.4731812, -0.9923905, 1, 1, 1, 1, 1,
1.859113, 0.4177558, 0.1114382, 1, 1, 1, 1, 1,
1.887199, 1.608328, 2.343861, 1, 1, 1, 1, 1,
1.888798, -1.387685, 2.043288, 1, 1, 1, 1, 1,
1.889799, -1.782221, 2.854946, 1, 1, 1, 1, 1,
1.897754, -0.06690433, 3.118716, 1, 1, 1, 1, 1,
1.90324, -0.3382175, 1.082154, 1, 1, 1, 1, 1,
1.949309, 2.103508, 1.113659, 1, 1, 1, 1, 1,
1.9598, 0.5616202, 0.9049231, 1, 1, 1, 1, 1,
1.960502, 0.1054488, 2.96331, 1, 1, 1, 1, 1,
1.975889, 1.037809, 0.03408428, 1, 1, 1, 1, 1,
1.994984, -1.923653, 1.722843, 1, 1, 1, 1, 1,
2.000259, 0.2541841, 2.421374, 1, 1, 1, 1, 1,
2.029231, -0.4271299, 1.309083, 1, 1, 1, 1, 1,
2.082242, -1.110333, 2.774178, 1, 1, 1, 1, 1,
2.118628, -0.6658674, 1.903022, 0, 0, 1, 1, 1,
2.129322, -0.1646484, 3.120555, 1, 0, 0, 1, 1,
2.151483, -0.14835, 2.673729, 1, 0, 0, 1, 1,
2.174531, 0.1117426, 1.59695, 1, 0, 0, 1, 1,
2.175896, 0.5111365, 0.2375863, 1, 0, 0, 1, 1,
2.184169, 0.4808059, 0.4231261, 1, 0, 0, 1, 1,
2.247482, -1.141395, 1.855359, 0, 0, 0, 1, 1,
2.352608, -0.875349, 1.536316, 0, 0, 0, 1, 1,
2.372736, -0.1176991, 2.40728, 0, 0, 0, 1, 1,
2.37277, 0.457636, 1.833829, 0, 0, 0, 1, 1,
2.391829, 1.204119, 1.678889, 0, 0, 0, 1, 1,
2.440119, 1.654704, 1.252511, 0, 0, 0, 1, 1,
2.441055, 0.7283199, 1.601753, 0, 0, 0, 1, 1,
2.49122, -1.042897, 0.7619868, 1, 1, 1, 1, 1,
2.511341, 0.07904433, 2.192627, 1, 1, 1, 1, 1,
2.549649, 1.550069, 0.3839384, 1, 1, 1, 1, 1,
2.56968, 0.06648953, 1.417668, 1, 1, 1, 1, 1,
2.78574, 0.4416181, 1.014614, 1, 1, 1, 1, 1,
2.93644, 1.790947, 0.3475089, 1, 1, 1, 1, 1,
3.23432, 1.057523, 2.196126, 1, 1, 1, 1, 1
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
var radius = 9.888367;
var distance = 34.73247;
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
mvMatrix.translate( -0.08614206, -0.3097706, -0.3462403 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.73247);
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
