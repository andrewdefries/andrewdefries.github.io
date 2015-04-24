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
-2.740588, 0.08081511, -2.159467, 1, 0, 0, 1,
-2.729106, -0.7710592, -2.110284, 1, 0.007843138, 0, 1,
-2.726592, 1.11578, -2.369713, 1, 0.01176471, 0, 1,
-2.638576, 0.3013414, 0.4027247, 1, 0.01960784, 0, 1,
-2.545551, 0.4398075, -1.910332, 1, 0.02352941, 0, 1,
-2.443659, -0.5213882, -0.7236111, 1, 0.03137255, 0, 1,
-2.432309, 0.2488254, -1.516006, 1, 0.03529412, 0, 1,
-2.403651, -0.02781322, -0.5271294, 1, 0.04313726, 0, 1,
-2.356063, -0.1940262, -3.624572, 1, 0.04705882, 0, 1,
-2.331488, -0.3956825, -0.8979366, 1, 0.05490196, 0, 1,
-2.292154, 0.3968625, 0.218039, 1, 0.05882353, 0, 1,
-2.281892, -0.4770018, -1.589549, 1, 0.06666667, 0, 1,
-2.262833, 0.1997018, -1.253577, 1, 0.07058824, 0, 1,
-2.259703, 1.088251, -1.528177, 1, 0.07843138, 0, 1,
-2.254893, 0.5702024, -0.3394756, 1, 0.08235294, 0, 1,
-2.236139, 0.7554064, -0.9932537, 1, 0.09019608, 0, 1,
-2.234524, 2.007301, 0.3034986, 1, 0.09411765, 0, 1,
-2.2345, -2.247579, -1.248205, 1, 0.1019608, 0, 1,
-2.218398, -1.548984, -2.584329, 1, 0.1098039, 0, 1,
-2.218065, 2.39293, 0.1412733, 1, 0.1137255, 0, 1,
-2.199285, -0.2443931, -2.435946, 1, 0.1215686, 0, 1,
-2.197434, 0.2753199, -2.138104, 1, 0.1254902, 0, 1,
-2.196676, -1.711089, -2.334553, 1, 0.1333333, 0, 1,
-2.18481, 0.637006, -1.902383, 1, 0.1372549, 0, 1,
-2.17355, 0.4117413, -0.5874784, 1, 0.145098, 0, 1,
-2.095647, 0.08487452, -1.582919, 1, 0.1490196, 0, 1,
-2.093541, -0.7962411, -2.759584, 1, 0.1568628, 0, 1,
-2.04062, -0.4441661, -1.646302, 1, 0.1607843, 0, 1,
-2.021964, 0.7496743, -3.672488, 1, 0.1686275, 0, 1,
-2.019074, 0.8469092, -1.632376, 1, 0.172549, 0, 1,
-2.015112, -1.126525, -1.851247, 1, 0.1803922, 0, 1,
-1.985231, -1.696487, -2.545694, 1, 0.1843137, 0, 1,
-1.980672, -0.7930379, -3.844215, 1, 0.1921569, 0, 1,
-1.938783, -0.8849456, -1.577348, 1, 0.1960784, 0, 1,
-1.924708, -2.010149, -3.408971, 1, 0.2039216, 0, 1,
-1.898874, -0.01262311, -0.8390449, 1, 0.2117647, 0, 1,
-1.88836, 0.3625283, -1.118969, 1, 0.2156863, 0, 1,
-1.884863, -0.2404253, -1.885615, 1, 0.2235294, 0, 1,
-1.871898, 1.592014, -0.7636288, 1, 0.227451, 0, 1,
-1.859562, -0.2134805, -1.085609, 1, 0.2352941, 0, 1,
-1.84735, 0.3854729, -2.189412, 1, 0.2392157, 0, 1,
-1.835279, -0.2508392, -1.202755, 1, 0.2470588, 0, 1,
-1.805308, 0.2548236, -2.16399, 1, 0.2509804, 0, 1,
-1.759157, 0.3224588, -0.5795881, 1, 0.2588235, 0, 1,
-1.75702, -0.8036043, -0.7786658, 1, 0.2627451, 0, 1,
-1.737158, -2.161325, -3.063382, 1, 0.2705882, 0, 1,
-1.720068, 1.926396, -2.057585, 1, 0.2745098, 0, 1,
-1.707387, -2.578697, -1.423724, 1, 0.282353, 0, 1,
-1.702159, -0.0869766, -3.027588, 1, 0.2862745, 0, 1,
-1.663028, 0.02464208, -2.422058, 1, 0.2941177, 0, 1,
-1.626912, -1.158795, -2.351653, 1, 0.3019608, 0, 1,
-1.620319, 1.033953, -0.4975715, 1, 0.3058824, 0, 1,
-1.603955, 0.3152231, 0.07514476, 1, 0.3137255, 0, 1,
-1.59028, 0.7345806, -1.322472, 1, 0.3176471, 0, 1,
-1.579151, -1.665585, -1.81857, 1, 0.3254902, 0, 1,
-1.572321, 1.267411, 0.1670508, 1, 0.3294118, 0, 1,
-1.570389, 2.118013, 0.227863, 1, 0.3372549, 0, 1,
-1.570213, 0.4743589, 0.2583918, 1, 0.3411765, 0, 1,
-1.564854, 0.0193483, -1.055995, 1, 0.3490196, 0, 1,
-1.555044, -0.1651406, -2.481003, 1, 0.3529412, 0, 1,
-1.535046, -0.09604882, -2.636799, 1, 0.3607843, 0, 1,
-1.526846, 0.5777585, -2.215755, 1, 0.3647059, 0, 1,
-1.52651, -0.3810761, -0.9678448, 1, 0.372549, 0, 1,
-1.499369, -1.342777, -2.028901, 1, 0.3764706, 0, 1,
-1.494061, -1.791511, -2.447115, 1, 0.3843137, 0, 1,
-1.48957, 1.310169, -0.6578593, 1, 0.3882353, 0, 1,
-1.486435, 0.09508424, -0.7666023, 1, 0.3960784, 0, 1,
-1.474402, 0.1687546, -0.8176916, 1, 0.4039216, 0, 1,
-1.47269, 0.470315, -0.903648, 1, 0.4078431, 0, 1,
-1.470086, -1.06623, -1.622171, 1, 0.4156863, 0, 1,
-1.465155, 1.199224, -1.814211, 1, 0.4196078, 0, 1,
-1.45956, 0.5907769, -0.897705, 1, 0.427451, 0, 1,
-1.444378, -2.18192, -4.004113, 1, 0.4313726, 0, 1,
-1.43429, -0.228854, -0.3506245, 1, 0.4392157, 0, 1,
-1.428816, 0.1974885, 0.2433725, 1, 0.4431373, 0, 1,
-1.428121, 1.366199, -1.730848, 1, 0.4509804, 0, 1,
-1.427395, -0.3846825, -0.8325776, 1, 0.454902, 0, 1,
-1.422641, -0.3791009, -2.431356, 1, 0.4627451, 0, 1,
-1.415879, 0.9985557, -0.9802334, 1, 0.4666667, 0, 1,
-1.406589, 0.6085548, -0.4770743, 1, 0.4745098, 0, 1,
-1.396913, -0.8083007, -2.18639, 1, 0.4784314, 0, 1,
-1.388903, -0.637324, -2.732081, 1, 0.4862745, 0, 1,
-1.388631, 1.719006, 0.1410135, 1, 0.4901961, 0, 1,
-1.368943, 1.152368, 0.7583135, 1, 0.4980392, 0, 1,
-1.366623, 0.2367106, -1.823454, 1, 0.5058824, 0, 1,
-1.354677, -1.25472, 0.04890157, 1, 0.509804, 0, 1,
-1.344042, -0.4047537, -3.298793, 1, 0.5176471, 0, 1,
-1.333152, 0.642767, -1.037677, 1, 0.5215687, 0, 1,
-1.322498, -0.7854767, -1.85659, 1, 0.5294118, 0, 1,
-1.321619, -0.2899348, -3.097798, 1, 0.5333334, 0, 1,
-1.317733, 0.2649161, -1.908599, 1, 0.5411765, 0, 1,
-1.314008, -1.291593, -1.916615, 1, 0.5450981, 0, 1,
-1.311707, 1.127827, 1.931437, 1, 0.5529412, 0, 1,
-1.311525, -0.1921821, -3.542709, 1, 0.5568628, 0, 1,
-1.307196, 0.4677628, -0.4920745, 1, 0.5647059, 0, 1,
-1.306169, 0.8655502, -1.577637, 1, 0.5686275, 0, 1,
-1.303884, 1.20591, -2.009765, 1, 0.5764706, 0, 1,
-1.301331, -0.395051, -3.315351, 1, 0.5803922, 0, 1,
-1.297506, 1.177992, -1.825623, 1, 0.5882353, 0, 1,
-1.295505, 1.019337, 0.04020861, 1, 0.5921569, 0, 1,
-1.29146, -0.01157611, -1.050542, 1, 0.6, 0, 1,
-1.290965, 0.5815024, -0.4446398, 1, 0.6078432, 0, 1,
-1.280432, 0.6686602, -1.137578, 1, 0.6117647, 0, 1,
-1.2748, 2.309022, -1.840603, 1, 0.6196079, 0, 1,
-1.268412, 1.050152, 0.5897349, 1, 0.6235294, 0, 1,
-1.252055, -0.8216834, -2.312841, 1, 0.6313726, 0, 1,
-1.249407, -0.03260417, -1.495667, 1, 0.6352941, 0, 1,
-1.248973, -2.699435, -4.340491, 1, 0.6431373, 0, 1,
-1.238058, -1.453175, -4.318179, 1, 0.6470588, 0, 1,
-1.224525, -0.1450703, -0.5033389, 1, 0.654902, 0, 1,
-1.219952, 0.9415383, 0.1228075, 1, 0.6588235, 0, 1,
-1.214673, 0.2720342, -3.697764, 1, 0.6666667, 0, 1,
-1.212241, 1.267998, -0.6526847, 1, 0.6705883, 0, 1,
-1.208728, -0.6255603, -1.699218, 1, 0.6784314, 0, 1,
-1.208578, 0.9007958, 0.0866624, 1, 0.682353, 0, 1,
-1.204781, 0.9008377, -0.3085987, 1, 0.6901961, 0, 1,
-1.202375, -0.08971395, -0.3011748, 1, 0.6941177, 0, 1,
-1.200256, -0.8829153, -2.319599, 1, 0.7019608, 0, 1,
-1.199006, 0.09461369, -1.075922, 1, 0.7098039, 0, 1,
-1.192746, 0.5334712, -1.247067, 1, 0.7137255, 0, 1,
-1.19075, 1.02457, -0.6951474, 1, 0.7215686, 0, 1,
-1.184168, 0.4194544, -0.5994552, 1, 0.7254902, 0, 1,
-1.180576, -0.04104396, 0.3999179, 1, 0.7333333, 0, 1,
-1.179603, 0.5941429, -1.230706, 1, 0.7372549, 0, 1,
-1.172948, 0.6329588, -0.9702626, 1, 0.7450981, 0, 1,
-1.171256, 0.6870603, 0.5019035, 1, 0.7490196, 0, 1,
-1.154371, 0.5002268, -2.838409, 1, 0.7568628, 0, 1,
-1.154278, 1.181828, -1.032586, 1, 0.7607843, 0, 1,
-1.142877, 0.4419183, -0.2256861, 1, 0.7686275, 0, 1,
-1.135771, 2.315371, -0.0412524, 1, 0.772549, 0, 1,
-1.135556, 1.099408, -2.2656, 1, 0.7803922, 0, 1,
-1.126982, -0.5737521, -2.321231, 1, 0.7843137, 0, 1,
-1.125483, 0.098023, 1.054818, 1, 0.7921569, 0, 1,
-1.122819, -0.9503386, -2.767446, 1, 0.7960784, 0, 1,
-1.12181, -0.9413573, -4.143314, 1, 0.8039216, 0, 1,
-1.115805, -0.1006404, -1.691633, 1, 0.8117647, 0, 1,
-1.114388, 0.6251289, -0.1772979, 1, 0.8156863, 0, 1,
-1.11338, 0.232108, -0.4402477, 1, 0.8235294, 0, 1,
-1.105129, 1.257578, -2.052009, 1, 0.827451, 0, 1,
-1.102256, 0.5743109, -1.03781, 1, 0.8352941, 0, 1,
-1.097555, -0.420679, -2.208337, 1, 0.8392157, 0, 1,
-1.096746, 1.46374, -1.5215, 1, 0.8470588, 0, 1,
-1.08615, 0.1041215, -2.402359, 1, 0.8509804, 0, 1,
-1.081094, -1.054765, -2.770721, 1, 0.8588235, 0, 1,
-1.076952, -0.2808957, -1.619747, 1, 0.8627451, 0, 1,
-1.073787, -0.0891459, -2.847625, 1, 0.8705882, 0, 1,
-1.061635, 1.945514, -1.557644, 1, 0.8745098, 0, 1,
-1.057201, -1.542773, -5.11623, 1, 0.8823529, 0, 1,
-1.052785, 2.559561, 0.1471871, 1, 0.8862745, 0, 1,
-1.048862, 1.068908, -0.4341686, 1, 0.8941177, 0, 1,
-1.043624, 0.6195898, -1.23509, 1, 0.8980392, 0, 1,
-1.039186, 1.065759, -0.5192186, 1, 0.9058824, 0, 1,
-1.036262, 0.1569422, 1.127195, 1, 0.9137255, 0, 1,
-1.030955, -0.7770659, -2.272104, 1, 0.9176471, 0, 1,
-1.026329, -0.3722992, -3.590899, 1, 0.9254902, 0, 1,
-1.021801, -0.4886452, -1.754752, 1, 0.9294118, 0, 1,
-1.019878, -0.9402504, -2.11791, 1, 0.9372549, 0, 1,
-1.009848, 1.193897, -0.8045472, 1, 0.9411765, 0, 1,
-1.007377, -1.104797, -1.966828, 1, 0.9490196, 0, 1,
-1.003669, 0.8976513, 0.2277608, 1, 0.9529412, 0, 1,
-1.001932, -1.385918, -4.040245, 1, 0.9607843, 0, 1,
-0.9902034, -0.8887219, -3.24497, 1, 0.9647059, 0, 1,
-0.9895411, 1.23783, -0.04803107, 1, 0.972549, 0, 1,
-0.9889343, 0.4324498, -0.8823323, 1, 0.9764706, 0, 1,
-0.9883298, -0.1930517, -2.088655, 1, 0.9843137, 0, 1,
-0.984214, 0.6788446, -1.95514, 1, 0.9882353, 0, 1,
-0.983168, -0.2093271, -2.052675, 1, 0.9960784, 0, 1,
-0.9817365, -1.97408, -1.48536, 0.9960784, 1, 0, 1,
-0.9800068, -0.05384789, -0.6280926, 0.9921569, 1, 0, 1,
-0.9788181, -0.08871633, -1.657371, 0.9843137, 1, 0, 1,
-0.9748557, 0.5049194, -2.512821, 0.9803922, 1, 0, 1,
-0.967546, -0.5174869, -2.08395, 0.972549, 1, 0, 1,
-0.9639012, 0.004950543, -3.275839, 0.9686275, 1, 0, 1,
-0.9607219, 0.1336713, -0.4899205, 0.9607843, 1, 0, 1,
-0.9530037, -0.4486686, -1.189676, 0.9568627, 1, 0, 1,
-0.9509608, -0.4538959, -3.740198, 0.9490196, 1, 0, 1,
-0.9439079, -0.7285104, -2.019697, 0.945098, 1, 0, 1,
-0.943866, -0.2206503, -2.273578, 0.9372549, 1, 0, 1,
-0.9433462, -0.9047856, -3.56591, 0.9333333, 1, 0, 1,
-0.934633, -1.680484, -2.176088, 0.9254902, 1, 0, 1,
-0.9263889, 0.8580204, -0.2189049, 0.9215686, 1, 0, 1,
-0.9185751, 0.8294373, 1.349671, 0.9137255, 1, 0, 1,
-0.9127589, 0.9270945, 1.264581, 0.9098039, 1, 0, 1,
-0.9088923, -1.710571, -2.978648, 0.9019608, 1, 0, 1,
-0.9050828, -0.8492955, -2.103218, 0.8941177, 1, 0, 1,
-0.9038657, -0.1506584, -0.2182988, 0.8901961, 1, 0, 1,
-0.8998554, 0.7316709, -0.1582366, 0.8823529, 1, 0, 1,
-0.8979853, 0.938395, -2.252307, 0.8784314, 1, 0, 1,
-0.8950517, 0.7073587, -1.261041, 0.8705882, 1, 0, 1,
-0.8933789, -1.530028, -2.802615, 0.8666667, 1, 0, 1,
-0.8930847, 0.1702301, -2.235904, 0.8588235, 1, 0, 1,
-0.8861715, -0.7928684, -1.962757, 0.854902, 1, 0, 1,
-0.8842664, 0.6664637, -0.5707073, 0.8470588, 1, 0, 1,
-0.8814027, 1.53412, -0.600735, 0.8431373, 1, 0, 1,
-0.8806356, 0.04321467, -1.3955, 0.8352941, 1, 0, 1,
-0.8754214, -1.675413, -3.022352, 0.8313726, 1, 0, 1,
-0.8696126, 0.534874, -1.068508, 0.8235294, 1, 0, 1,
-0.8686559, 0.2052058, -3.200012, 0.8196079, 1, 0, 1,
-0.8644213, -0.5937984, -2.604768, 0.8117647, 1, 0, 1,
-0.8632699, 0.8675984, -0.7683967, 0.8078431, 1, 0, 1,
-0.8628405, 0.6921917, -1.093983, 0.8, 1, 0, 1,
-0.8592282, 1.209619, -1.492237, 0.7921569, 1, 0, 1,
-0.8578805, 0.9307405, 0.8952712, 0.7882353, 1, 0, 1,
-0.8549935, 0.06146286, -1.334903, 0.7803922, 1, 0, 1,
-0.8519643, -0.8386804, -2.970103, 0.7764706, 1, 0, 1,
-0.8509823, -0.1646902, -3.658549, 0.7686275, 1, 0, 1,
-0.8460306, 2.395669, 0.1887234, 0.7647059, 1, 0, 1,
-0.8450048, -0.5226119, -1.942017, 0.7568628, 1, 0, 1,
-0.8417044, -0.4085104, -1.853745, 0.7529412, 1, 0, 1,
-0.831588, -1.102175, -1.544528, 0.7450981, 1, 0, 1,
-0.8302578, 2.15314, -1.829683, 0.7411765, 1, 0, 1,
-0.8246785, -1.413339, -3.630649, 0.7333333, 1, 0, 1,
-0.8204383, 0.6632348, -0.5169123, 0.7294118, 1, 0, 1,
-0.8181547, 1.10709, -2.256173, 0.7215686, 1, 0, 1,
-0.8175366, -0.2885307, -3.021815, 0.7176471, 1, 0, 1,
-0.8088398, -0.100068, -1.518043, 0.7098039, 1, 0, 1,
-0.7938308, -0.07461116, -1.407687, 0.7058824, 1, 0, 1,
-0.7881464, 1.129541, -1.393682, 0.6980392, 1, 0, 1,
-0.7856988, 0.2363966, -1.161603, 0.6901961, 1, 0, 1,
-0.7855693, 0.09019727, -1.192321, 0.6862745, 1, 0, 1,
-0.7843552, 0.001933465, -2.21905, 0.6784314, 1, 0, 1,
-0.7834388, 0.8406221, -0.1360083, 0.6745098, 1, 0, 1,
-0.7814407, 0.4929895, -1.333664, 0.6666667, 1, 0, 1,
-0.775903, 1.260658, 1.536163, 0.6627451, 1, 0, 1,
-0.7740229, -0.4320735, -1.654572, 0.654902, 1, 0, 1,
-0.7733045, -0.5065838, -2.966128, 0.6509804, 1, 0, 1,
-0.7730233, -0.325149, -1.664159, 0.6431373, 1, 0, 1,
-0.7726696, 1.929537, -0.939509, 0.6392157, 1, 0, 1,
-0.7710145, -0.7765129, -1.741503, 0.6313726, 1, 0, 1,
-0.7685443, 0.07463031, -1.664901, 0.627451, 1, 0, 1,
-0.7653275, -0.3643605, -2.452844, 0.6196079, 1, 0, 1,
-0.7644256, 1.110805, -1.834532, 0.6156863, 1, 0, 1,
-0.7576334, 0.09561465, -0.1251063, 0.6078432, 1, 0, 1,
-0.75542, -0.4651149, -2.392313, 0.6039216, 1, 0, 1,
-0.753683, 0.2837989, -2.535588, 0.5960785, 1, 0, 1,
-0.7514087, -0.2355411, -2.582509, 0.5882353, 1, 0, 1,
-0.7492606, -0.4285101, -4.499572, 0.5843138, 1, 0, 1,
-0.7480066, 0.4700971, 0.3988563, 0.5764706, 1, 0, 1,
-0.7456995, -0.5513649, -1.663069, 0.572549, 1, 0, 1,
-0.745222, -0.770924, -2.274397, 0.5647059, 1, 0, 1,
-0.7331842, -0.7033007, -1.706368, 0.5607843, 1, 0, 1,
-0.7297349, 0.4015133, -0.3167875, 0.5529412, 1, 0, 1,
-0.7284283, -0.5232227, -0.1131936, 0.5490196, 1, 0, 1,
-0.7171164, -0.6743973, -2.704412, 0.5411765, 1, 0, 1,
-0.7077572, 0.2143943, -0.8060057, 0.5372549, 1, 0, 1,
-0.70681, 2.168249, -0.05952907, 0.5294118, 1, 0, 1,
-0.7039321, 0.5511522, -1.017899, 0.5254902, 1, 0, 1,
-0.7037936, 0.1775547, -1.20476, 0.5176471, 1, 0, 1,
-0.7012582, 0.7864037, -1.235954, 0.5137255, 1, 0, 1,
-0.694816, 0.0361133, -2.08848, 0.5058824, 1, 0, 1,
-0.6923136, -1.461523, -3.308259, 0.5019608, 1, 0, 1,
-0.6921587, 0.5628279, -1.796801, 0.4941176, 1, 0, 1,
-0.6911388, -1.132023, -2.124552, 0.4862745, 1, 0, 1,
-0.6896541, 2.043672, 0.1969285, 0.4823529, 1, 0, 1,
-0.6890097, 1.779254, -1.212195, 0.4745098, 1, 0, 1,
-0.6844025, -0.494554, -1.097147, 0.4705882, 1, 0, 1,
-0.6834633, 0.7373114, -0.1302104, 0.4627451, 1, 0, 1,
-0.6817187, 1.404634, -2.611122, 0.4588235, 1, 0, 1,
-0.6761296, 0.08117449, -0.9959596, 0.4509804, 1, 0, 1,
-0.6721738, 0.9265161, -1.563468, 0.4470588, 1, 0, 1,
-0.670741, 0.7453333, -0.8723749, 0.4392157, 1, 0, 1,
-0.6691999, 0.1649683, 1.259024, 0.4352941, 1, 0, 1,
-0.6691681, -0.30985, -1.82021, 0.427451, 1, 0, 1,
-0.6594506, 0.4226766, -2.479977, 0.4235294, 1, 0, 1,
-0.657572, 0.5398474, 1.637865, 0.4156863, 1, 0, 1,
-0.6532214, -0.5839407, -2.007192, 0.4117647, 1, 0, 1,
-0.6508185, 0.7030509, -2.243913, 0.4039216, 1, 0, 1,
-0.6497619, -0.06406274, -2.324266, 0.3960784, 1, 0, 1,
-0.6484689, -0.3596232, -1.103971, 0.3921569, 1, 0, 1,
-0.6476749, -1.198655, -3.322564, 0.3843137, 1, 0, 1,
-0.6466207, -1.861112, -2.646876, 0.3803922, 1, 0, 1,
-0.6448531, 1.155221, -0.203908, 0.372549, 1, 0, 1,
-0.6430103, 0.7388245, 0.4387086, 0.3686275, 1, 0, 1,
-0.6378438, 0.0966121, -1.746155, 0.3607843, 1, 0, 1,
-0.6353063, 1.894531, 0.07771026, 0.3568628, 1, 0, 1,
-0.628935, -1.530666, -1.862591, 0.3490196, 1, 0, 1,
-0.626667, -1.858782, -2.521868, 0.345098, 1, 0, 1,
-0.6162505, -0.8335012, -3.382865, 0.3372549, 1, 0, 1,
-0.6155229, -1.319324, -4.021143, 0.3333333, 1, 0, 1,
-0.608359, 1.133028, 0.8619286, 0.3254902, 1, 0, 1,
-0.6071574, 0.9636388, -1.468461, 0.3215686, 1, 0, 1,
-0.606494, -1.401813, -1.776633, 0.3137255, 1, 0, 1,
-0.6061794, 0.300017, -3.259564, 0.3098039, 1, 0, 1,
-0.6061164, 0.3573126, -1.930973, 0.3019608, 1, 0, 1,
-0.5985296, 2.247424, -0.1941531, 0.2941177, 1, 0, 1,
-0.5885653, 0.4543756, 0.6126939, 0.2901961, 1, 0, 1,
-0.5806418, 0.9967303, -1.635291, 0.282353, 1, 0, 1,
-0.5741023, -0.6935582, -3.091225, 0.2784314, 1, 0, 1,
-0.5720695, 0.3673778, -0.730092, 0.2705882, 1, 0, 1,
-0.5686756, 0.1091999, -0.7270998, 0.2666667, 1, 0, 1,
-0.5641627, -0.9512659, -2.801498, 0.2588235, 1, 0, 1,
-0.560294, 1.210439, -0.7935662, 0.254902, 1, 0, 1,
-0.5578584, 1.486893, -2.462661, 0.2470588, 1, 0, 1,
-0.5558838, 0.5470963, -0.7572211, 0.2431373, 1, 0, 1,
-0.5549873, 0.5757446, -0.5914963, 0.2352941, 1, 0, 1,
-0.5539618, 0.7155054, 0.5479199, 0.2313726, 1, 0, 1,
-0.5401396, 0.4755831, -0.7341668, 0.2235294, 1, 0, 1,
-0.5390209, 0.5239646, 0.943507, 0.2196078, 1, 0, 1,
-0.5281877, 0.9766182, -0.1629971, 0.2117647, 1, 0, 1,
-0.5275354, 0.07699306, -0.850029, 0.2078431, 1, 0, 1,
-0.522293, -0.5513976, -2.695911, 0.2, 1, 0, 1,
-0.5210645, 1.709745, -0.7841405, 0.1921569, 1, 0, 1,
-0.5202999, -1.578366, -3.725051, 0.1882353, 1, 0, 1,
-0.5200739, -0.2614872, -2.388769, 0.1803922, 1, 0, 1,
-0.5194208, 0.4364144, 0.4108292, 0.1764706, 1, 0, 1,
-0.5177819, 1.868556, 0.3846245, 0.1686275, 1, 0, 1,
-0.5175281, -1.574484, -3.95731, 0.1647059, 1, 0, 1,
-0.5103719, -0.3735053, -1.388147, 0.1568628, 1, 0, 1,
-0.5064181, -1.985551, -4.40274, 0.1529412, 1, 0, 1,
-0.505784, -0.481193, -1.044306, 0.145098, 1, 0, 1,
-0.5046315, 1.737952, -0.7873552, 0.1411765, 1, 0, 1,
-0.5036855, 1.467477, -1.493455, 0.1333333, 1, 0, 1,
-0.4955708, 0.5694199, -1.579001, 0.1294118, 1, 0, 1,
-0.4931369, -0.7000783, -2.830889, 0.1215686, 1, 0, 1,
-0.4901861, 1.309952, 0.5954556, 0.1176471, 1, 0, 1,
-0.4894549, 0.07371233, -0.8070626, 0.1098039, 1, 0, 1,
-0.4823556, -1.030022, -2.872001, 0.1058824, 1, 0, 1,
-0.4808952, -0.063984, -2.258997, 0.09803922, 1, 0, 1,
-0.4795551, 0.9028875, -1.018614, 0.09019608, 1, 0, 1,
-0.4790018, -0.1815061, -2.279452, 0.08627451, 1, 0, 1,
-0.4535204, -0.5373446, -1.393549, 0.07843138, 1, 0, 1,
-0.4508836, 2.634717, -0.6952782, 0.07450981, 1, 0, 1,
-0.4474832, 0.9454746, 0.2417743, 0.06666667, 1, 0, 1,
-0.4462044, -0.284071, -2.545013, 0.0627451, 1, 0, 1,
-0.4457735, 1.468462, 0.7256462, 0.05490196, 1, 0, 1,
-0.4448302, -1.149637, -2.30826, 0.05098039, 1, 0, 1,
-0.4436929, -0.6029646, -2.500755, 0.04313726, 1, 0, 1,
-0.4413426, 0.09696621, -0.8854641, 0.03921569, 1, 0, 1,
-0.4340163, 0.4955069, -0.4147053, 0.03137255, 1, 0, 1,
-0.4336584, 0.08249488, -1.233133, 0.02745098, 1, 0, 1,
-0.4290223, 0.4519698, 0.4673953, 0.01960784, 1, 0, 1,
-0.4279113, 1.146181, -1.826612, 0.01568628, 1, 0, 1,
-0.4278625, 0.1571001, -0.05641764, 0.007843138, 1, 0, 1,
-0.4219719, -0.6605998, -3.696779, 0.003921569, 1, 0, 1,
-0.4202837, 0.6858771, 0.3823283, 0, 1, 0.003921569, 1,
-0.418665, -0.3061469, -2.004328, 0, 1, 0.01176471, 1,
-0.416926, -1.146499, -2.048807, 0, 1, 0.01568628, 1,
-0.4158147, 1.184045, -1.711335, 0, 1, 0.02352941, 1,
-0.4148983, -0.3688134, -2.289745, 0, 1, 0.02745098, 1,
-0.4136942, -0.6102433, -1.544404, 0, 1, 0.03529412, 1,
-0.4079023, -0.620663, -1.578932, 0, 1, 0.03921569, 1,
-0.4058097, -0.3843918, -2.022713, 0, 1, 0.04705882, 1,
-0.4018746, 0.1175777, -0.9604901, 0, 1, 0.05098039, 1,
-0.4009814, -0.720507, -2.795469, 0, 1, 0.05882353, 1,
-0.3947141, 0.2002933, 0.4576647, 0, 1, 0.0627451, 1,
-0.3899061, 1.435155, -0.9350877, 0, 1, 0.07058824, 1,
-0.3878412, -1.793879, -3.354646, 0, 1, 0.07450981, 1,
-0.3835851, -0.2991293, -1.954361, 0, 1, 0.08235294, 1,
-0.382381, -1.9892, -4.107378, 0, 1, 0.08627451, 1,
-0.382141, 0.9234593, 1.209364, 0, 1, 0.09411765, 1,
-0.3806372, -1.176277, -3.624243, 0, 1, 0.1019608, 1,
-0.3735088, -0.2200719, -1.611945, 0, 1, 0.1058824, 1,
-0.3661472, 0.548588, -0.4836294, 0, 1, 0.1137255, 1,
-0.3651387, 0.5663611, -0.1922138, 0, 1, 0.1176471, 1,
-0.3624773, -3.716734, -2.760808, 0, 1, 0.1254902, 1,
-0.3605017, -0.495478, -3.278458, 0, 1, 0.1294118, 1,
-0.3591878, 0.2260191, -0.4368398, 0, 1, 0.1372549, 1,
-0.3561414, -1.292935, -2.878744, 0, 1, 0.1411765, 1,
-0.3542099, 1.123626, -0.83764, 0, 1, 0.1490196, 1,
-0.3522163, 0.7816657, -1.877266, 0, 1, 0.1529412, 1,
-0.350151, -0.3042985, -3.684509, 0, 1, 0.1607843, 1,
-0.3498236, -0.3034824, -1.687969, 0, 1, 0.1647059, 1,
-0.3481475, -0.3471009, -1.936506, 0, 1, 0.172549, 1,
-0.3427601, -1.490046, -3.189999, 0, 1, 0.1764706, 1,
-0.3356093, 0.8730716, -0.7924948, 0, 1, 0.1843137, 1,
-0.3346453, 0.729583, -0.6989301, 0, 1, 0.1882353, 1,
-0.3346452, -0.7556956, -1.567012, 0, 1, 0.1960784, 1,
-0.3325228, 0.3026164, 0.08790505, 0, 1, 0.2039216, 1,
-0.3303894, 0.7748798, -2.386134, 0, 1, 0.2078431, 1,
-0.3134879, 0.3451612, -0.2491723, 0, 1, 0.2156863, 1,
-0.3127081, 0.8294507, 0.041322, 0, 1, 0.2196078, 1,
-0.3119959, -1.459791, -2.412982, 0, 1, 0.227451, 1,
-0.3081365, 1.263207, -0.132739, 0, 1, 0.2313726, 1,
-0.3039227, 0.8572719, 0.01544224, 0, 1, 0.2392157, 1,
-0.3030295, -0.268263, -1.799882, 0, 1, 0.2431373, 1,
-0.3015271, -2.648626, -1.475359, 0, 1, 0.2509804, 1,
-0.2993793, -0.7235809, -1.867416, 0, 1, 0.254902, 1,
-0.2981889, -1.306226, -3.058991, 0, 1, 0.2627451, 1,
-0.2968815, -1.196652, -2.232665, 0, 1, 0.2666667, 1,
-0.2946274, -2.056308, -2.245224, 0, 1, 0.2745098, 1,
-0.2943667, 1.020505, 2.752507, 0, 1, 0.2784314, 1,
-0.2931197, 1.183794, -1.494695, 0, 1, 0.2862745, 1,
-0.292834, -0.1118192, -3.153173, 0, 1, 0.2901961, 1,
-0.2912535, -0.7628199, -4.195403, 0, 1, 0.2980392, 1,
-0.287923, -0.4742642, -1.965201, 0, 1, 0.3058824, 1,
-0.2867601, -1.00168, -3.342092, 0, 1, 0.3098039, 1,
-0.2826805, -0.3777569, -3.153542, 0, 1, 0.3176471, 1,
-0.282474, -0.1927536, -0.1491093, 0, 1, 0.3215686, 1,
-0.2818891, -0.1041987, -2.00416, 0, 1, 0.3294118, 1,
-0.2814564, 1.217114, -0.8472639, 0, 1, 0.3333333, 1,
-0.2799159, -0.4545936, -4.32175, 0, 1, 0.3411765, 1,
-0.2792353, -1.029726, -2.853027, 0, 1, 0.345098, 1,
-0.2762699, 0.6093817, 0.6671849, 0, 1, 0.3529412, 1,
-0.2726482, 0.6825351, -0.08775848, 0, 1, 0.3568628, 1,
-0.2659118, 0.2196142, 1.694481, 0, 1, 0.3647059, 1,
-0.2645664, 0.6399802, -0.1930444, 0, 1, 0.3686275, 1,
-0.2639418, -0.01369984, 0.4835258, 0, 1, 0.3764706, 1,
-0.2579994, -0.7509383, -1.220678, 0, 1, 0.3803922, 1,
-0.2574289, 0.47646, -0.4205593, 0, 1, 0.3882353, 1,
-0.2573958, -0.3977895, -1.725159, 0, 1, 0.3921569, 1,
-0.2562782, -1.188608, -2.07116, 0, 1, 0.4, 1,
-0.2536637, 1.165734, -0.2832346, 0, 1, 0.4078431, 1,
-0.2506592, -1.309522, -3.271811, 0, 1, 0.4117647, 1,
-0.2491474, -0.9573075, -3.285637, 0, 1, 0.4196078, 1,
-0.2446641, 0.4536498, -0.6110297, 0, 1, 0.4235294, 1,
-0.244463, 0.8317968, 0.4648208, 0, 1, 0.4313726, 1,
-0.2439122, 2.41904, 0.4708154, 0, 1, 0.4352941, 1,
-0.2429785, -0.7195851, -3.779626, 0, 1, 0.4431373, 1,
-0.2359145, 0.9805719, 1.590394, 0, 1, 0.4470588, 1,
-0.2350948, 0.6423016, -1.186455, 0, 1, 0.454902, 1,
-0.2323175, -0.1028185, -2.085304, 0, 1, 0.4588235, 1,
-0.2298287, -0.8605669, -2.942122, 0, 1, 0.4666667, 1,
-0.2297049, -0.6927543, -2.585684, 0, 1, 0.4705882, 1,
-0.2296822, -1.66497, -2.618096, 0, 1, 0.4784314, 1,
-0.2252623, 0.1534865, -2.067906, 0, 1, 0.4823529, 1,
-0.223368, -0.6894544, -3.959612, 0, 1, 0.4901961, 1,
-0.2203434, 0.07656096, -0.05964876, 0, 1, 0.4941176, 1,
-0.218505, 0.1030466, -2.101247, 0, 1, 0.5019608, 1,
-0.2167453, -0.5331404, -0.7216833, 0, 1, 0.509804, 1,
-0.2152233, -0.3081622, -3.645939, 0, 1, 0.5137255, 1,
-0.2120388, -0.4602253, -2.719095, 0, 1, 0.5215687, 1,
-0.2119537, 0.8686959, -1.052486, 0, 1, 0.5254902, 1,
-0.20787, 0.06880368, -1.570917, 0, 1, 0.5333334, 1,
-0.2076678, -0.2795328, -2.107167, 0, 1, 0.5372549, 1,
-0.2045541, 0.4808483, -0.4280111, 0, 1, 0.5450981, 1,
-0.1983283, -0.6203843, -5.203569, 0, 1, 0.5490196, 1,
-0.1944076, 0.9789032, 0.03425489, 0, 1, 0.5568628, 1,
-0.1933332, 1.62233, -0.9576184, 0, 1, 0.5607843, 1,
-0.1886363, 0.5211306, -1.313504, 0, 1, 0.5686275, 1,
-0.178487, 0.3753028, -1.226593, 0, 1, 0.572549, 1,
-0.1755101, 1.818644, -0.1985479, 0, 1, 0.5803922, 1,
-0.1743568, 0.3322864, -0.09109841, 0, 1, 0.5843138, 1,
-0.1704664, -0.06904951, -1.995265, 0, 1, 0.5921569, 1,
-0.1703804, -0.1804055, -4.403023, 0, 1, 0.5960785, 1,
-0.1702374, 0.2670614, -2.198814, 0, 1, 0.6039216, 1,
-0.1694114, -0.9667962, -3.839424, 0, 1, 0.6117647, 1,
-0.167877, -1.126773, -5.063711, 0, 1, 0.6156863, 1,
-0.1627964, -1.051934, -2.924234, 0, 1, 0.6235294, 1,
-0.160735, -0.4789326, -1.975308, 0, 1, 0.627451, 1,
-0.1562515, -0.2820975, -3.098135, 0, 1, 0.6352941, 1,
-0.1549305, -0.7774448, -3.736383, 0, 1, 0.6392157, 1,
-0.1524738, -2.582494, -3.841365, 0, 1, 0.6470588, 1,
-0.1494253, 0.1824925, -0.4002214, 0, 1, 0.6509804, 1,
-0.1465513, 1.589151, -1.255661, 0, 1, 0.6588235, 1,
-0.1459382, -0.9048097, -2.636399, 0, 1, 0.6627451, 1,
-0.1429724, 0.2247549, -0.1093222, 0, 1, 0.6705883, 1,
-0.142813, 1.261293, -0.03912073, 0, 1, 0.6745098, 1,
-0.1419845, 0.2560356, -1.319767, 0, 1, 0.682353, 1,
-0.1394681, -1.059064, -3.61834, 0, 1, 0.6862745, 1,
-0.1376706, 1.902728, 0.08122675, 0, 1, 0.6941177, 1,
-0.136868, -0.4125084, -2.270953, 0, 1, 0.7019608, 1,
-0.1356764, -0.3972996, -1.630811, 0, 1, 0.7058824, 1,
-0.1332213, -0.6680127, -2.935626, 0, 1, 0.7137255, 1,
-0.1328222, 0.7647791, 0.7963181, 0, 1, 0.7176471, 1,
-0.1310576, -0.5682501, -1.216102, 0, 1, 0.7254902, 1,
-0.1254532, 0.9297123, 0.1189624, 0, 1, 0.7294118, 1,
-0.1240423, 0.6571199, 2.369497, 0, 1, 0.7372549, 1,
-0.124014, 0.1103987, -0.02214575, 0, 1, 0.7411765, 1,
-0.1221212, 0.1341732, -1.136285, 0, 1, 0.7490196, 1,
-0.1210285, 0.4126358, 1.810778, 0, 1, 0.7529412, 1,
-0.1187899, -1.983604, -0.854926, 0, 1, 0.7607843, 1,
-0.1179014, -0.3193282, -2.522696, 0, 1, 0.7647059, 1,
-0.1106434, -1.109349, -1.587785, 0, 1, 0.772549, 1,
-0.1101921, 1.252196, -0.4670434, 0, 1, 0.7764706, 1,
-0.110135, -2.147328, -3.389288, 0, 1, 0.7843137, 1,
-0.1090649, 0.2119588, -1.071721, 0, 1, 0.7882353, 1,
-0.1051927, 0.1001771, -0.521929, 0, 1, 0.7960784, 1,
-0.1028319, -0.6105171, -3.537241, 0, 1, 0.8039216, 1,
-0.1027576, -0.4840336, -3.234192, 0, 1, 0.8078431, 1,
-0.1012471, -0.8330119, -3.927382, 0, 1, 0.8156863, 1,
-0.0976999, 1.307052, -1.349186, 0, 1, 0.8196079, 1,
-0.09286775, 0.6748057, -1.77919, 0, 1, 0.827451, 1,
-0.09156124, 1.255847, 0.5792548, 0, 1, 0.8313726, 1,
-0.08905412, -0.7398691, -3.098097, 0, 1, 0.8392157, 1,
-0.08518411, 0.1384791, -1.939996, 0, 1, 0.8431373, 1,
-0.07597959, 0.463288, 0.7179521, 0, 1, 0.8509804, 1,
-0.07502494, 1.03619, 0.4686575, 0, 1, 0.854902, 1,
-0.074836, 1.874614, -0.3150446, 0, 1, 0.8627451, 1,
-0.07458501, -0.9510373, -3.218132, 0, 1, 0.8666667, 1,
-0.06891257, -0.2598021, -3.616596, 0, 1, 0.8745098, 1,
-0.06758919, -0.01538349, -2.924454, 0, 1, 0.8784314, 1,
-0.06498054, 1.044339, 1.966653, 0, 1, 0.8862745, 1,
-0.05997219, -0.6774278, -2.184268, 0, 1, 0.8901961, 1,
-0.05892809, 2.47727, -1.749487, 0, 1, 0.8980392, 1,
-0.05887738, -1.508758, -3.986056, 0, 1, 0.9058824, 1,
-0.05649574, -0.001390673, -3.307405, 0, 1, 0.9098039, 1,
-0.05136281, 1.623481, -3.141821, 0, 1, 0.9176471, 1,
-0.05046602, -1.178584, -2.306686, 0, 1, 0.9215686, 1,
-0.04668988, 0.03305513, -1.118217, 0, 1, 0.9294118, 1,
-0.04389723, -1.144325, -2.420326, 0, 1, 0.9333333, 1,
-0.0431142, -1.094352, -2.337118, 0, 1, 0.9411765, 1,
-0.03138208, -1.754435, -2.247847, 0, 1, 0.945098, 1,
-0.03059218, 0.05550361, -1.084025, 0, 1, 0.9529412, 1,
-0.03050842, -0.9433297, -2.154205, 0, 1, 0.9568627, 1,
-0.03026051, 0.4345765, 0.2064648, 0, 1, 0.9647059, 1,
-0.02973335, 0.408332, 0.9126593, 0, 1, 0.9686275, 1,
-0.02860859, -0.9801403, -2.57712, 0, 1, 0.9764706, 1,
-0.02795634, -0.4758004, -5.028459, 0, 1, 0.9803922, 1,
-0.02163739, -0.02363367, -2.790794, 0, 1, 0.9882353, 1,
-0.02104035, 1.570015, 1.057923, 0, 1, 0.9921569, 1,
-0.01510329, 0.04292217, -0.1394012, 0, 1, 1, 1,
-0.01347056, -1.310426, -3.08197, 0, 0.9921569, 1, 1,
-0.01324012, 1.012929, 1.098817, 0, 0.9882353, 1, 1,
-0.01018414, -0.6695921, -2.105309, 0, 0.9803922, 1, 1,
-0.009945813, -0.2045005, -3.139915, 0, 0.9764706, 1, 1,
-0.002940614, -1.515422, -4.20364, 0, 0.9686275, 1, 1,
-0.001541322, 0.07645822, 0.5729908, 0, 0.9647059, 1, 1,
-0.00025407, 0.3392767, -0.03157634, 0, 0.9568627, 1, 1,
0.007165885, -0.2724244, 2.975907, 0, 0.9529412, 1, 1,
0.01030628, 0.4849873, 0.5954709, 0, 0.945098, 1, 1,
0.01268932, -0.8689088, 3.077235, 0, 0.9411765, 1, 1,
0.01342601, 2.21188, -0.3551514, 0, 0.9333333, 1, 1,
0.01603333, -0.01965008, 3.542094, 0, 0.9294118, 1, 1,
0.01637592, -0.4247431, 0.479651, 0, 0.9215686, 1, 1,
0.01659552, 2.135282, 0.6675628, 0, 0.9176471, 1, 1,
0.01852989, -0.6205994, 2.62484, 0, 0.9098039, 1, 1,
0.01879863, -0.9240051, 2.257988, 0, 0.9058824, 1, 1,
0.0195282, 0.2680788, -0.5409004, 0, 0.8980392, 1, 1,
0.02024351, 0.09188231, 0.4062834, 0, 0.8901961, 1, 1,
0.02155162, 0.1855214, 1.102262, 0, 0.8862745, 1, 1,
0.02347548, 0.3918715, 0.6394248, 0, 0.8784314, 1, 1,
0.02570015, -0.1117931, 0.386962, 0, 0.8745098, 1, 1,
0.02835154, 1.698067, 0.1713961, 0, 0.8666667, 1, 1,
0.03256708, 0.1257103, 0.4563082, 0, 0.8627451, 1, 1,
0.03392757, -0.45381, 2.220984, 0, 0.854902, 1, 1,
0.03483573, 1.63549, -0.9989412, 0, 0.8509804, 1, 1,
0.03637462, -0.6994184, 3.186325, 0, 0.8431373, 1, 1,
0.03739787, 0.246443, 0.02774657, 0, 0.8392157, 1, 1,
0.04080671, 1.813284, 1.132138, 0, 0.8313726, 1, 1,
0.04207352, 0.4335606, 0.7067847, 0, 0.827451, 1, 1,
0.04216211, -1.684489, 1.915788, 0, 0.8196079, 1, 1,
0.04388467, 0.737729, -0.06221211, 0, 0.8156863, 1, 1,
0.04445208, 0.5021085, -0.327898, 0, 0.8078431, 1, 1,
0.04584913, 0.9271947, -1.204587, 0, 0.8039216, 1, 1,
0.04706245, 1.452914, 0.5754548, 0, 0.7960784, 1, 1,
0.05414161, -1.388542, 3.986897, 0, 0.7882353, 1, 1,
0.05803064, 0.2910775, 0.369372, 0, 0.7843137, 1, 1,
0.06345455, 1.064103, -1.380837, 0, 0.7764706, 1, 1,
0.07163677, 2.329849, 0.948194, 0, 0.772549, 1, 1,
0.07261939, 1.14048, 0.2417742, 0, 0.7647059, 1, 1,
0.07392377, -0.4409399, 1.470063, 0, 0.7607843, 1, 1,
0.07737625, -0.5456293, 2.465026, 0, 0.7529412, 1, 1,
0.08169962, 0.01568388, 0.3849277, 0, 0.7490196, 1, 1,
0.08260368, 0.07692055, -0.021104, 0, 0.7411765, 1, 1,
0.08281636, -0.2223249, 2.692862, 0, 0.7372549, 1, 1,
0.09174857, 0.8521001, 0.1630181, 0, 0.7294118, 1, 1,
0.09272552, -0.9602479, 2.330556, 0, 0.7254902, 1, 1,
0.0932086, 1.089506, -1.079477, 0, 0.7176471, 1, 1,
0.09427366, -0.1573106, 1.619988, 0, 0.7137255, 1, 1,
0.0951095, 0.01008145, 0.8278258, 0, 0.7058824, 1, 1,
0.09648895, -0.2711231, 2.894463, 0, 0.6980392, 1, 1,
0.09929546, 2.147615, 0.3508092, 0, 0.6941177, 1, 1,
0.1014399, 1.213978, 0.5808646, 0, 0.6862745, 1, 1,
0.1017051, 0.003467153, 2.251944, 0, 0.682353, 1, 1,
0.1022384, 0.3211563, 1.435133, 0, 0.6745098, 1, 1,
0.1031637, 0.6862702, 0.7906964, 0, 0.6705883, 1, 1,
0.1062607, 1.140689, 1.593721, 0, 0.6627451, 1, 1,
0.1076219, -0.9961917, 3.059488, 0, 0.6588235, 1, 1,
0.1079059, 0.4709688, -0.6083558, 0, 0.6509804, 1, 1,
0.1080689, 0.4198029, -0.4617104, 0, 0.6470588, 1, 1,
0.1095263, 0.8960501, -0.07356042, 0, 0.6392157, 1, 1,
0.1123925, -0.6187974, 4.294981, 0, 0.6352941, 1, 1,
0.1133762, -1.49245, 3.423066, 0, 0.627451, 1, 1,
0.1145438, 0.6139363, -0.4082529, 0, 0.6235294, 1, 1,
0.1210776, -0.6550336, 3.506984, 0, 0.6156863, 1, 1,
0.1211153, 1.62154, 1.128673, 0, 0.6117647, 1, 1,
0.1213953, -1.486027, 2.306653, 0, 0.6039216, 1, 1,
0.1226796, -1.60358, 3.218145, 0, 0.5960785, 1, 1,
0.124049, 0.4183932, -3.083216, 0, 0.5921569, 1, 1,
0.1316024, -0.2323869, 3.976624, 0, 0.5843138, 1, 1,
0.1322381, -1.773151, 4.721844, 0, 0.5803922, 1, 1,
0.1335076, -0.6990358, 1.932287, 0, 0.572549, 1, 1,
0.1337459, -1.01424, 2.116934, 0, 0.5686275, 1, 1,
0.135204, 0.04244028, 0.9065288, 0, 0.5607843, 1, 1,
0.141679, -0.2461078, 2.406818, 0, 0.5568628, 1, 1,
0.1434495, -0.9565278, 5.366139, 0, 0.5490196, 1, 1,
0.1440715, 0.7090341, -0.2763667, 0, 0.5450981, 1, 1,
0.1454578, 1.511554, 0.06314292, 0, 0.5372549, 1, 1,
0.1465388, 1.344094, 1.022297, 0, 0.5333334, 1, 1,
0.149667, -0.9122058, 3.601371, 0, 0.5254902, 1, 1,
0.1549987, -0.3481938, 1.991365, 0, 0.5215687, 1, 1,
0.1583917, -1.134707, 2.886319, 0, 0.5137255, 1, 1,
0.1702676, 0.09503357, 1.047864, 0, 0.509804, 1, 1,
0.1716974, 0.8662179, -0.2902417, 0, 0.5019608, 1, 1,
0.1722379, -0.394172, 3.566385, 0, 0.4941176, 1, 1,
0.1756512, 2.365999, 0.905522, 0, 0.4901961, 1, 1,
0.1785211, 0.5936986, -0.7926738, 0, 0.4823529, 1, 1,
0.1827531, -0.02461328, 1.136057, 0, 0.4784314, 1, 1,
0.1841747, -0.2463056, 3.107204, 0, 0.4705882, 1, 1,
0.1871049, -0.4545823, 0.9442441, 0, 0.4666667, 1, 1,
0.1907728, -0.6296027, 2.829623, 0, 0.4588235, 1, 1,
0.1957141, -0.4610876, 1.994669, 0, 0.454902, 1, 1,
0.1964506, -0.3041038, 3.936603, 0, 0.4470588, 1, 1,
0.2013993, -0.16093, 2.746376, 0, 0.4431373, 1, 1,
0.2027664, -0.3415761, 2.489799, 0, 0.4352941, 1, 1,
0.2062276, -1.488927, 2.859683, 0, 0.4313726, 1, 1,
0.2155079, 0.9664527, 0.2526107, 0, 0.4235294, 1, 1,
0.2167713, -0.4753332, 0.7365465, 0, 0.4196078, 1, 1,
0.2168147, -0.2604799, 2.597912, 0, 0.4117647, 1, 1,
0.2172569, 2.411093, -0.01332885, 0, 0.4078431, 1, 1,
0.217639, 0.3820301, -0.3526612, 0, 0.4, 1, 1,
0.2267345, -0.9209012, 2.805635, 0, 0.3921569, 1, 1,
0.2289307, 0.6845833, 0.7110479, 0, 0.3882353, 1, 1,
0.2295121, -0.1248014, 2.049611, 0, 0.3803922, 1, 1,
0.2333055, -0.2796608, 1.839602, 0, 0.3764706, 1, 1,
0.2368466, -0.1407435, 0.8787568, 0, 0.3686275, 1, 1,
0.2401346, 0.8747386, 1.638568, 0, 0.3647059, 1, 1,
0.2454728, 0.6589876, 0.2949475, 0, 0.3568628, 1, 1,
0.2463388, 0.159082, 1.638533, 0, 0.3529412, 1, 1,
0.2471603, 0.1524526, -0.3207528, 0, 0.345098, 1, 1,
0.2483465, -0.1959848, 1.673662, 0, 0.3411765, 1, 1,
0.2572937, -0.7076557, 3.437379, 0, 0.3333333, 1, 1,
0.2581696, 0.1548961, 0.8397833, 0, 0.3294118, 1, 1,
0.258871, -0.2462366, 2.233541, 0, 0.3215686, 1, 1,
0.2590637, 1.036231, -1.439971, 0, 0.3176471, 1, 1,
0.2592216, -0.828021, 2.467815, 0, 0.3098039, 1, 1,
0.2599213, -0.7195964, 2.819502, 0, 0.3058824, 1, 1,
0.2616342, -1.575923, 0.61352, 0, 0.2980392, 1, 1,
0.2657532, -0.8279458, 1.713592, 0, 0.2901961, 1, 1,
0.2662152, -0.5022314, 4.721629, 0, 0.2862745, 1, 1,
0.2675346, 0.2384116, 0.4799202, 0, 0.2784314, 1, 1,
0.2744124, 1.085129, 1.070135, 0, 0.2745098, 1, 1,
0.2848895, 1.159807, 0.8634905, 0, 0.2666667, 1, 1,
0.2870196, -0.02112734, 1.976028, 0, 0.2627451, 1, 1,
0.2897055, 1.25883, 0.1786653, 0, 0.254902, 1, 1,
0.2902141, 0.5304662, -0.6940551, 0, 0.2509804, 1, 1,
0.2926465, -0.9069496, 3.034045, 0, 0.2431373, 1, 1,
0.2931564, -0.9060648, 2.979469, 0, 0.2392157, 1, 1,
0.2958842, 0.3803826, 1.810905, 0, 0.2313726, 1, 1,
0.2961238, -0.2186451, 2.024364, 0, 0.227451, 1, 1,
0.2967505, 1.562335, 0.4395161, 0, 0.2196078, 1, 1,
0.2985144, -1.92661, 1.13113, 0, 0.2156863, 1, 1,
0.3011122, -0.4948799, 1.526237, 0, 0.2078431, 1, 1,
0.3062386, -0.6419865, 2.471601, 0, 0.2039216, 1, 1,
0.308891, -0.3806866, 1.454612, 0, 0.1960784, 1, 1,
0.3113183, -0.09558285, 1.510486, 0, 0.1882353, 1, 1,
0.3171637, 1.35689, -0.3606386, 0, 0.1843137, 1, 1,
0.3172857, 0.1106722, 2.685565, 0, 0.1764706, 1, 1,
0.3205217, 0.7356678, 0.7058846, 0, 0.172549, 1, 1,
0.3205777, -1.427051, 3.12262, 0, 0.1647059, 1, 1,
0.3207665, -0.472397, 1.057513, 0, 0.1607843, 1, 1,
0.3238027, 0.7331878, 1.037599, 0, 0.1529412, 1, 1,
0.3254052, 0.3385221, 0.481661, 0, 0.1490196, 1, 1,
0.3268022, 0.5957525, 1.783462, 0, 0.1411765, 1, 1,
0.3284999, -1.635595, 0.9385348, 0, 0.1372549, 1, 1,
0.3296828, -2.118702, 2.519286, 0, 0.1294118, 1, 1,
0.3305816, 2.381868, -0.1564329, 0, 0.1254902, 1, 1,
0.3374653, -0.5725425, 2.447095, 0, 0.1176471, 1, 1,
0.3385635, -1.147774, 3.25684, 0, 0.1137255, 1, 1,
0.3398314, 1.808028, 0.2620061, 0, 0.1058824, 1, 1,
0.3419676, 0.896197, -1.281455, 0, 0.09803922, 1, 1,
0.3433074, -0.4050983, 3.179406, 0, 0.09411765, 1, 1,
0.345704, 0.3675899, 0.9219754, 0, 0.08627451, 1, 1,
0.346489, -0.3203655, 3.212449, 0, 0.08235294, 1, 1,
0.3509959, -0.8784945, 3.337597, 0, 0.07450981, 1, 1,
0.3575927, -0.007267654, -0.5833603, 0, 0.07058824, 1, 1,
0.3638144, 0.4805016, -0.1618966, 0, 0.0627451, 1, 1,
0.3665336, 0.4775334, -0.4509535, 0, 0.05882353, 1, 1,
0.3689441, 0.6651103, 1.600804, 0, 0.05098039, 1, 1,
0.3736103, 0.9809688, -1.076274, 0, 0.04705882, 1, 1,
0.3791907, -0.8391058, 1.082492, 0, 0.03921569, 1, 1,
0.3792897, 1.376312, -0.916572, 0, 0.03529412, 1, 1,
0.3802021, -1.039834, 1.170948, 0, 0.02745098, 1, 1,
0.3822424, 1.067564, 0.4593906, 0, 0.02352941, 1, 1,
0.3831313, -0.4762474, 1.573962, 0, 0.01568628, 1, 1,
0.3839026, 0.8389999, 2.225214, 0, 0.01176471, 1, 1,
0.3870254, 0.9964495, 1.056503, 0, 0.003921569, 1, 1,
0.3891092, 0.1511743, 0.9431845, 0.003921569, 0, 1, 1,
0.3902286, 0.2532859, 1.268713, 0.007843138, 0, 1, 1,
0.3918317, 0.3967201, 2.149506, 0.01568628, 0, 1, 1,
0.393034, -0.3907146, -1.035872, 0.01960784, 0, 1, 1,
0.394108, 0.4140565, -1.824333, 0.02745098, 0, 1, 1,
0.4008661, 0.2001679, 2.077171, 0.03137255, 0, 1, 1,
0.4014576, -0.2575499, 2.161673, 0.03921569, 0, 1, 1,
0.4029935, -1.244083, 3.075526, 0.04313726, 0, 1, 1,
0.4039997, 0.882357, 0.1713527, 0.05098039, 0, 1, 1,
0.4080572, 0.4916248, 0.1029405, 0.05490196, 0, 1, 1,
0.4137267, 1.593011, 0.8547177, 0.0627451, 0, 1, 1,
0.4137598, 0.2318957, 1.282815, 0.06666667, 0, 1, 1,
0.4205437, 0.6382486, 0.8421367, 0.07450981, 0, 1, 1,
0.4247747, 0.1798658, 1.173737, 0.07843138, 0, 1, 1,
0.4253016, 0.1473993, 1.836207, 0.08627451, 0, 1, 1,
0.4256161, -0.289543, 1.654603, 0.09019608, 0, 1, 1,
0.4266051, -1.169466, 1.079061, 0.09803922, 0, 1, 1,
0.4279813, -0.1196956, 1.03148, 0.1058824, 0, 1, 1,
0.4324151, -0.9640035, 3.994713, 0.1098039, 0, 1, 1,
0.4337451, 1.393691, -0.1128786, 0.1176471, 0, 1, 1,
0.433956, 0.5451626, 1.822689, 0.1215686, 0, 1, 1,
0.4356173, 1.51411, 1.044657, 0.1294118, 0, 1, 1,
0.4401757, 1.183136, 0.6818503, 0.1333333, 0, 1, 1,
0.4410004, -0.04215103, 1.88492, 0.1411765, 0, 1, 1,
0.443772, -1.529323, 2.933739, 0.145098, 0, 1, 1,
0.4533191, -0.3764392, 0.8458576, 0.1529412, 0, 1, 1,
0.4614701, 0.06729771, 2.063362, 0.1568628, 0, 1, 1,
0.4633551, 0.02132938, 0.1404853, 0.1647059, 0, 1, 1,
0.4645005, -0.167397, 2.376403, 0.1686275, 0, 1, 1,
0.4677151, -2.039944, 3.25093, 0.1764706, 0, 1, 1,
0.4677503, -0.2979133, 0.7077036, 0.1803922, 0, 1, 1,
0.4687566, 0.6914408, 0.4142299, 0.1882353, 0, 1, 1,
0.4688748, -0.4322251, 3.23016, 0.1921569, 0, 1, 1,
0.4772131, 1.022503, 1.831053, 0.2, 0, 1, 1,
0.4773871, 1.021719, 0.6568624, 0.2078431, 0, 1, 1,
0.4786222, -0.03922278, 2.532679, 0.2117647, 0, 1, 1,
0.482617, -0.8516136, 2.605715, 0.2196078, 0, 1, 1,
0.4840525, 0.2312117, -0.1390468, 0.2235294, 0, 1, 1,
0.4868663, 1.674399, -0.1736749, 0.2313726, 0, 1, 1,
0.4898204, -0.573065, 2.668813, 0.2352941, 0, 1, 1,
0.4928131, 0.2103119, 0.2213136, 0.2431373, 0, 1, 1,
0.4997616, 0.9379789, 0.5383918, 0.2470588, 0, 1, 1,
0.501428, -1.742956, 2.887202, 0.254902, 0, 1, 1,
0.502537, -2.414123, 3.469303, 0.2588235, 0, 1, 1,
0.5038673, 0.3734692, -1.242872, 0.2666667, 0, 1, 1,
0.5135766, -0.7259674, 3.523758, 0.2705882, 0, 1, 1,
0.5152177, -1.156292, 3.832179, 0.2784314, 0, 1, 1,
0.5184585, 2.587946, -0.0386997, 0.282353, 0, 1, 1,
0.5250764, 0.1510645, 1.49922, 0.2901961, 0, 1, 1,
0.526529, -0.9168763, 3.839984, 0.2941177, 0, 1, 1,
0.5305939, 0.1550836, 2.500987, 0.3019608, 0, 1, 1,
0.5306285, 0.08501016, 1.064396, 0.3098039, 0, 1, 1,
0.531137, 0.3584494, 0.3573867, 0.3137255, 0, 1, 1,
0.5367336, 0.3499837, 1.463831, 0.3215686, 0, 1, 1,
0.5377024, 0.403248, 0.4535144, 0.3254902, 0, 1, 1,
0.5386525, 0.5171637, 2.255401, 0.3333333, 0, 1, 1,
0.5411147, -0.003404957, 2.580969, 0.3372549, 0, 1, 1,
0.5420781, 0.675521, -0.09458611, 0.345098, 0, 1, 1,
0.5426802, 0.5103827, -0.4423932, 0.3490196, 0, 1, 1,
0.5435971, -0.7857125, 2.237941, 0.3568628, 0, 1, 1,
0.5460587, 0.4287664, 1.011939, 0.3607843, 0, 1, 1,
0.5470031, 0.7179354, 1.663953, 0.3686275, 0, 1, 1,
0.5537251, 0.8436747, 0.3676994, 0.372549, 0, 1, 1,
0.5551236, -1.220199, 4.304908, 0.3803922, 0, 1, 1,
0.5580811, 0.5219287, -0.2718368, 0.3843137, 0, 1, 1,
0.5581869, -1.049065, 1.04881, 0.3921569, 0, 1, 1,
0.5624272, -0.8791856, 1.113784, 0.3960784, 0, 1, 1,
0.5689345, 0.05383238, 1.337799, 0.4039216, 0, 1, 1,
0.5708506, -1.143278, 3.083239, 0.4117647, 0, 1, 1,
0.5709783, 0.999828, 1.203374, 0.4156863, 0, 1, 1,
0.5713322, -1.521312, 2.518212, 0.4235294, 0, 1, 1,
0.5760248, 0.7179937, -0.009802319, 0.427451, 0, 1, 1,
0.5764105, 0.8017228, 0.3063118, 0.4352941, 0, 1, 1,
0.5777937, 0.8139855, 1.208809, 0.4392157, 0, 1, 1,
0.5834814, 0.8554955, -0.07954677, 0.4470588, 0, 1, 1,
0.5837468, 0.1053029, 2.5017, 0.4509804, 0, 1, 1,
0.5854124, 0.9868268, 0.5428084, 0.4588235, 0, 1, 1,
0.5859533, -0.2912286, -1.134561, 0.4627451, 0, 1, 1,
0.5877436, 2.15833, 0.882625, 0.4705882, 0, 1, 1,
0.587953, 1.458129, -0.005124344, 0.4745098, 0, 1, 1,
0.5910404, 0.834472, -0.658323, 0.4823529, 0, 1, 1,
0.5947856, 0.7766634, 1.39251, 0.4862745, 0, 1, 1,
0.5964377, 1.16948, 1.646115, 0.4941176, 0, 1, 1,
0.6041284, 0.04835549, 2.638828, 0.5019608, 0, 1, 1,
0.6044458, -0.7797127, 2.799169, 0.5058824, 0, 1, 1,
0.6074166, -1.468352, 2.761987, 0.5137255, 0, 1, 1,
0.6075389, 0.1012804, 1.223213, 0.5176471, 0, 1, 1,
0.6101632, 0.4700874, 1.544715, 0.5254902, 0, 1, 1,
0.6127142, -0.1305312, 2.70868, 0.5294118, 0, 1, 1,
0.6222292, -1.436626, 4.515847, 0.5372549, 0, 1, 1,
0.6237584, -1.633555, 3.123487, 0.5411765, 0, 1, 1,
0.6262082, -1.654214, 1.285039, 0.5490196, 0, 1, 1,
0.626363, -0.3382197, -0.6510475, 0.5529412, 0, 1, 1,
0.6279807, 0.4210182, 1.066947, 0.5607843, 0, 1, 1,
0.6286229, 0.5608117, 0.3980319, 0.5647059, 0, 1, 1,
0.6295274, 0.6211464, 1.095886, 0.572549, 0, 1, 1,
0.6333469, 0.6186689, -0.719134, 0.5764706, 0, 1, 1,
0.6381282, -1.66388, 3.388844, 0.5843138, 0, 1, 1,
0.6469952, -0.984689, -0.4700884, 0.5882353, 0, 1, 1,
0.6592435, 1.53194, 3.505997, 0.5960785, 0, 1, 1,
0.6592821, -0.846666, 3.237342, 0.6039216, 0, 1, 1,
0.6627419, -0.2497872, 1.425914, 0.6078432, 0, 1, 1,
0.6644969, 0.05199626, 2.098249, 0.6156863, 0, 1, 1,
0.664758, -0.677103, 2.008972, 0.6196079, 0, 1, 1,
0.6649107, 0.09482634, -0.1066983, 0.627451, 0, 1, 1,
0.6677622, 1.44631, 0.4806076, 0.6313726, 0, 1, 1,
0.6692331, -0.449941, 3.047298, 0.6392157, 0, 1, 1,
0.6738552, 0.8377679, 0.5967497, 0.6431373, 0, 1, 1,
0.6740385, 0.5533665, 0.4901069, 0.6509804, 0, 1, 1,
0.6779841, -0.2462587, 1.543996, 0.654902, 0, 1, 1,
0.6818249, -0.007351885, 2.319911, 0.6627451, 0, 1, 1,
0.6837713, -0.6089998, 4.458276, 0.6666667, 0, 1, 1,
0.6895084, -0.760065, 0.5076513, 0.6745098, 0, 1, 1,
0.6974419, 1.042385, 0.03215338, 0.6784314, 0, 1, 1,
0.7049199, -1.374588, 2.745677, 0.6862745, 0, 1, 1,
0.7110147, 1.062383, 1.480329, 0.6901961, 0, 1, 1,
0.7125938, 0.6870736, 2.735202, 0.6980392, 0, 1, 1,
0.72054, -0.1264254, 2.252854, 0.7058824, 0, 1, 1,
0.7258477, 0.2405013, 1.218055, 0.7098039, 0, 1, 1,
0.7283658, -2.125145, 4.034366, 0.7176471, 0, 1, 1,
0.7326561, -1.494229, 1.056358, 0.7215686, 0, 1, 1,
0.7372479, -2.095787, 2.822198, 0.7294118, 0, 1, 1,
0.7405006, -0.6904165, 1.623204, 0.7333333, 0, 1, 1,
0.7429593, 0.1800891, 2.617796, 0.7411765, 0, 1, 1,
0.7479599, 0.7378207, 2.182315, 0.7450981, 0, 1, 1,
0.7495858, -1.440711, 3.114326, 0.7529412, 0, 1, 1,
0.75481, -0.4650977, 2.525847, 0.7568628, 0, 1, 1,
0.7634043, 0.27558, 1.163046, 0.7647059, 0, 1, 1,
0.779914, -1.369711, 1.51527, 0.7686275, 0, 1, 1,
0.7805673, 2.187576, 0.5807361, 0.7764706, 0, 1, 1,
0.7838471, 0.6291218, -0.1301295, 0.7803922, 0, 1, 1,
0.7865649, 1.029526, 2.874533, 0.7882353, 0, 1, 1,
0.7881927, -0.5877557, 1.847768, 0.7921569, 0, 1, 1,
0.7947131, -0.7823651, 2.220347, 0.8, 0, 1, 1,
0.7981657, -0.01751387, 2.553764, 0.8078431, 0, 1, 1,
0.7997341, -0.1585594, 0.9132391, 0.8117647, 0, 1, 1,
0.799997, 0.2974972, -0.03419513, 0.8196079, 0, 1, 1,
0.8001634, -0.9236341, 2.080575, 0.8235294, 0, 1, 1,
0.8026894, 1.41727, 2.057356, 0.8313726, 0, 1, 1,
0.8049356, 2.476938, 1.505902, 0.8352941, 0, 1, 1,
0.806976, 0.6573433, 0.2178848, 0.8431373, 0, 1, 1,
0.8145854, 1.167317, -0.6346318, 0.8470588, 0, 1, 1,
0.8151342, 1.119579, 0.9923781, 0.854902, 0, 1, 1,
0.8152353, 0.6311057, 3.556194, 0.8588235, 0, 1, 1,
0.8157768, -0.08387174, 0.9337777, 0.8666667, 0, 1, 1,
0.8157895, 0.3590115, 2.837043, 0.8705882, 0, 1, 1,
0.8176388, 0.23853, 1.719538, 0.8784314, 0, 1, 1,
0.8181676, 0.2843769, 0.1654609, 0.8823529, 0, 1, 1,
0.8208123, -1.163005, 2.619267, 0.8901961, 0, 1, 1,
0.8214986, -0.0964913, 1.76724, 0.8941177, 0, 1, 1,
0.8230703, 0.3872781, 0.2670961, 0.9019608, 0, 1, 1,
0.8243392, -0.761838, 2.200406, 0.9098039, 0, 1, 1,
0.8288694, 0.6943405, 2.323659, 0.9137255, 0, 1, 1,
0.8311344, -0.04872072, 1.489681, 0.9215686, 0, 1, 1,
0.8363997, 0.4357334, 1.592431, 0.9254902, 0, 1, 1,
0.8406003, 0.4120955, 1.49439, 0.9333333, 0, 1, 1,
0.8420408, 1.448386, 0.6411387, 0.9372549, 0, 1, 1,
0.8549158, 0.06771284, 2.00391, 0.945098, 0, 1, 1,
0.8567395, 1.097491, 1.294281, 0.9490196, 0, 1, 1,
0.8593435, 0.9022819, -0.9697697, 0.9568627, 0, 1, 1,
0.8637298, -1.246861, 2.792793, 0.9607843, 0, 1, 1,
0.8661246, 1.003136, -0.1889143, 0.9686275, 0, 1, 1,
0.8683436, 1.329163, 0.0707371, 0.972549, 0, 1, 1,
0.8690879, 0.4963598, 1.427197, 0.9803922, 0, 1, 1,
0.874997, -2.541714, 2.062525, 0.9843137, 0, 1, 1,
0.8789482, 0.6867056, 0.04377988, 0.9921569, 0, 1, 1,
0.879855, -0.2543977, 4.010938, 0.9960784, 0, 1, 1,
0.894556, -0.4217708, 2.160587, 1, 0, 0.9960784, 1,
0.8970283, 0.2355929, -0.7885862, 1, 0, 0.9882353, 1,
0.8983684, 1.168334, -1.237904, 1, 0, 0.9843137, 1,
0.9002015, 3.304234, 0.9349555, 1, 0, 0.9764706, 1,
0.9113176, 1.075886, 0.4452201, 1, 0, 0.972549, 1,
0.9157376, -0.01108099, 0.1710734, 1, 0, 0.9647059, 1,
0.9171646, 3.372207, -1.890209, 1, 0, 0.9607843, 1,
0.9217957, 1.547278, 0.3116996, 1, 0, 0.9529412, 1,
0.9219345, -1.114944, 3.065389, 1, 0, 0.9490196, 1,
0.9235415, 2.324051, -0.1208521, 1, 0, 0.9411765, 1,
0.9298461, -1.977881, 3.648936, 1, 0, 0.9372549, 1,
0.9408061, 0.2678581, -0.004672835, 1, 0, 0.9294118, 1,
0.9410257, 1.472571, -0.03792202, 1, 0, 0.9254902, 1,
0.9477553, -1.103291, 1.562685, 1, 0, 0.9176471, 1,
0.947827, -0.6059994, 2.83586, 1, 0, 0.9137255, 1,
0.9583715, 0.3662448, 0.6122527, 1, 0, 0.9058824, 1,
0.9589483, -0.5165075, 2.983935, 1, 0, 0.9019608, 1,
0.9671708, -0.02701212, 1.608844, 1, 0, 0.8941177, 1,
0.9709806, -2.008881, 2.301073, 1, 0, 0.8862745, 1,
0.9749756, 1.056831, 2.623504, 1, 0, 0.8823529, 1,
0.978156, -0.176487, 2.073651, 1, 0, 0.8745098, 1,
0.9790529, 0.4599358, -1.310788, 1, 0, 0.8705882, 1,
0.9802196, -0.3906049, 2.463339, 1, 0, 0.8627451, 1,
0.9807829, 1.821972, 0.9674188, 1, 0, 0.8588235, 1,
0.993085, -0.944046, 3.482564, 1, 0, 0.8509804, 1,
1.002088, -1.728771, 1.10678, 1, 0, 0.8470588, 1,
1.00979, 0.9597874, 0.4756046, 1, 0, 0.8392157, 1,
1.014241, 1.367142, 1.361969, 1, 0, 0.8352941, 1,
1.018938, -1.536678, 2.000083, 1, 0, 0.827451, 1,
1.019656, -1.066717, 2.307802, 1, 0, 0.8235294, 1,
1.019907, 1.17455, 2.191282, 1, 0, 0.8156863, 1,
1.026521, -0.6516653, 1.937221, 1, 0, 0.8117647, 1,
1.029424, -0.3169132, 1.5029, 1, 0, 0.8039216, 1,
1.03071, 0.6860843, -0.1878711, 1, 0, 0.7960784, 1,
1.045701, -0.1845203, 4.459644, 1, 0, 0.7921569, 1,
1.04841, -0.8916934, 2.712803, 1, 0, 0.7843137, 1,
1.054206, -0.07447335, 1.427667, 1, 0, 0.7803922, 1,
1.055073, -0.7613425, 2.306028, 1, 0, 0.772549, 1,
1.056442, 0.6897894, 0.6931664, 1, 0, 0.7686275, 1,
1.056468, 0.1190445, 1.80914, 1, 0, 0.7607843, 1,
1.061291, -1.003102, 2.466618, 1, 0, 0.7568628, 1,
1.068566, 0.05862393, 1.952728, 1, 0, 0.7490196, 1,
1.069239, 0.7809271, 0.2800874, 1, 0, 0.7450981, 1,
1.069961, 0.7574923, 1.855432, 1, 0, 0.7372549, 1,
1.076596, 1.116322, 1.652245, 1, 0, 0.7333333, 1,
1.088971, -1.093518, 3.050822, 1, 0, 0.7254902, 1,
1.089417, -1.772071, 3.002468, 1, 0, 0.7215686, 1,
1.102946, 0.1549864, 2.080648, 1, 0, 0.7137255, 1,
1.104588, 0.2600732, 1.834558, 1, 0, 0.7098039, 1,
1.106825, 0.5590397, 0.2628728, 1, 0, 0.7019608, 1,
1.12623, -1.310149, 2.002193, 1, 0, 0.6941177, 1,
1.13173, -0.4064092, 1.646941, 1, 0, 0.6901961, 1,
1.133077, 1.735547, 0.3059446, 1, 0, 0.682353, 1,
1.138081, -0.09076777, 1.20901, 1, 0, 0.6784314, 1,
1.142491, 0.229325, 2.111572, 1, 0, 0.6705883, 1,
1.148978, -0.152596, 2.607092, 1, 0, 0.6666667, 1,
1.156673, -0.9648275, 2.860326, 1, 0, 0.6588235, 1,
1.166242, 1.129144, 0.6474267, 1, 0, 0.654902, 1,
1.170929, -0.6513792, 0.4361474, 1, 0, 0.6470588, 1,
1.180421, 0.836638, 2.227607, 1, 0, 0.6431373, 1,
1.18446, -0.4354617, 3.213477, 1, 0, 0.6352941, 1,
1.196378, 0.1836165, 2.07179, 1, 0, 0.6313726, 1,
1.198164, 0.2474447, 0.5311987, 1, 0, 0.6235294, 1,
1.216281, 0.1931118, 1.553045, 1, 0, 0.6196079, 1,
1.218636, -0.6464465, 3.51421, 1, 0, 0.6117647, 1,
1.228971, 0.9302938, -0.7768434, 1, 0, 0.6078432, 1,
1.230685, -0.2887507, 1.883244, 1, 0, 0.6, 1,
1.235477, 1.538689, 0.03413424, 1, 0, 0.5921569, 1,
1.237682, 1.014521, 0.6529607, 1, 0, 0.5882353, 1,
1.240524, -0.1115062, 0.2882193, 1, 0, 0.5803922, 1,
1.249259, 0.7945543, 0.05110432, 1, 0, 0.5764706, 1,
1.249274, -1.1386, 1.565131, 1, 0, 0.5686275, 1,
1.249707, 0.4035529, 1.373102, 1, 0, 0.5647059, 1,
1.2606, -1.239125, 2.558245, 1, 0, 0.5568628, 1,
1.261266, -0.4914206, 1.340851, 1, 0, 0.5529412, 1,
1.265146, 0.3166978, 0.7591242, 1, 0, 0.5450981, 1,
1.269916, 0.6874655, 1.14488, 1, 0, 0.5411765, 1,
1.270395, -0.04284838, -0.6082653, 1, 0, 0.5333334, 1,
1.274254, -0.6699619, 1.746531, 1, 0, 0.5294118, 1,
1.296719, 0.1563553, 0.9533627, 1, 0, 0.5215687, 1,
1.304633, 1.305989, 0.1694536, 1, 0, 0.5176471, 1,
1.313542, -2.255099, 4.836019, 1, 0, 0.509804, 1,
1.314891, -2.536479, 0.956565, 1, 0, 0.5058824, 1,
1.31741, -1.930442, 3.579242, 1, 0, 0.4980392, 1,
1.319273, 0.05553284, 1.111027, 1, 0, 0.4901961, 1,
1.321954, -0.1229561, 2.257387, 1, 0, 0.4862745, 1,
1.328666, 0.6140757, 0.8522536, 1, 0, 0.4784314, 1,
1.333948, -0.6663015, 2.145824, 1, 0, 0.4745098, 1,
1.34662, 0.3042003, 1.898427, 1, 0, 0.4666667, 1,
1.349979, -0.02355532, 1.889113, 1, 0, 0.4627451, 1,
1.366565, 0.02021448, 1.742143, 1, 0, 0.454902, 1,
1.368377, 0.2427902, 2.186155, 1, 0, 0.4509804, 1,
1.368656, 0.1662037, 1.609235, 1, 0, 0.4431373, 1,
1.373399, -1.109892, 3.539381, 1, 0, 0.4392157, 1,
1.384341, -1.484975, 2.063824, 1, 0, 0.4313726, 1,
1.393667, 0.6692562, 2.508007, 1, 0, 0.427451, 1,
1.396931, 0.07191251, 1.086003, 1, 0, 0.4196078, 1,
1.397014, 0.01108772, 0.8239859, 1, 0, 0.4156863, 1,
1.39716, -0.3689099, 2.665119, 1, 0, 0.4078431, 1,
1.401648, 1.403757, 1.665103, 1, 0, 0.4039216, 1,
1.407859, 0.9452058, 1.429186, 1, 0, 0.3960784, 1,
1.415191, 0.1316912, 1.711704, 1, 0, 0.3882353, 1,
1.435585, 0.07106719, -0.3854306, 1, 0, 0.3843137, 1,
1.46354, 0.6895467, 0.2087902, 1, 0, 0.3764706, 1,
1.469096, 1.994048, 1.430261, 1, 0, 0.372549, 1,
1.482375, -0.4734395, 0.03834039, 1, 0, 0.3647059, 1,
1.483655, -0.894107, 1.724187, 1, 0, 0.3607843, 1,
1.492126, -0.09369867, 1.004994, 1, 0, 0.3529412, 1,
1.492321, -0.8844019, 2.114512, 1, 0, 0.3490196, 1,
1.515377, -0.4349848, 2.912614, 1, 0, 0.3411765, 1,
1.525627, -0.4634776, 2.755127, 1, 0, 0.3372549, 1,
1.556459, -0.4683391, 2.698439, 1, 0, 0.3294118, 1,
1.564184, 0.1911251, 0.4429173, 1, 0, 0.3254902, 1,
1.567076, -0.350906, 0.4094795, 1, 0, 0.3176471, 1,
1.604023, 1.653946, 1.468303, 1, 0, 0.3137255, 1,
1.612537, -0.8145549, 2.974856, 1, 0, 0.3058824, 1,
1.621235, 0.4509776, 2.664605, 1, 0, 0.2980392, 1,
1.631546, -0.4457859, 3.608803, 1, 0, 0.2941177, 1,
1.644133, 0.009268973, 0.403853, 1, 0, 0.2862745, 1,
1.657754, 0.5953106, 0.8995103, 1, 0, 0.282353, 1,
1.668296, 1.71799, 0.5388519, 1, 0, 0.2745098, 1,
1.694355, 0.4184714, 1.56516, 1, 0, 0.2705882, 1,
1.699196, -0.5137815, 1.868293, 1, 0, 0.2627451, 1,
1.710206, 0.765262, 2.089186, 1, 0, 0.2588235, 1,
1.72314, 1.490794, 0.05289077, 1, 0, 0.2509804, 1,
1.732486, -1.141304, 1.417828, 1, 0, 0.2470588, 1,
1.738439, -0.4507398, 2.756104, 1, 0, 0.2392157, 1,
1.74466, -0.008152275, 1.899576, 1, 0, 0.2352941, 1,
1.754042, 0.06467184, -0.1525294, 1, 0, 0.227451, 1,
1.754078, -0.8588296, 4.240127, 1, 0, 0.2235294, 1,
1.75699, -0.4179945, 1.920039, 1, 0, 0.2156863, 1,
1.789487, -0.3674355, 3.079207, 1, 0, 0.2117647, 1,
1.809438, 1.634034, 0.9197083, 1, 0, 0.2039216, 1,
1.81125, -0.4878252, 1.276569, 1, 0, 0.1960784, 1,
1.82426, -0.1530357, 1.232488, 1, 0, 0.1921569, 1,
1.856225, -0.01963133, 2.501171, 1, 0, 0.1843137, 1,
1.867813, -1.265222, 0.04869885, 1, 0, 0.1803922, 1,
1.894548, 0.1555536, 1.407489, 1, 0, 0.172549, 1,
1.910129, 0.3531881, 2.214044, 1, 0, 0.1686275, 1,
1.911523, 0.007708631, 0.6876401, 1, 0, 0.1607843, 1,
1.917713, 1.919835, -2.259094, 1, 0, 0.1568628, 1,
1.919072, 0.55968, 1.924864, 1, 0, 0.1490196, 1,
1.919294, 1.949836, 0.3824206, 1, 0, 0.145098, 1,
1.927654, -1.030521, 1.674874, 1, 0, 0.1372549, 1,
1.937238, -0.5434101, 2.7792, 1, 0, 0.1333333, 1,
1.937933, 0.5058591, -0.3941417, 1, 0, 0.1254902, 1,
1.942317, -0.6313944, 3.086093, 1, 0, 0.1215686, 1,
1.94759, 1.921897, 2.078864, 1, 0, 0.1137255, 1,
1.962433, -0.120605, -0.1733145, 1, 0, 0.1098039, 1,
1.964884, 0.6266044, 3.083505, 1, 0, 0.1019608, 1,
2.019784, -0.4629124, 0.8055802, 1, 0, 0.09411765, 1,
2.046659, 0.5788957, 1.080773, 1, 0, 0.09019608, 1,
2.050054, -0.97849, 2.259099, 1, 0, 0.08235294, 1,
2.07879, 0.4343336, 2.484475, 1, 0, 0.07843138, 1,
2.121826, 0.01112913, 2.966174, 1, 0, 0.07058824, 1,
2.12847, -2.064327, 3.555875, 1, 0, 0.06666667, 1,
2.12871, 0.002755972, 0.6134578, 1, 0, 0.05882353, 1,
2.160116, -0.9159358, 2.504941, 1, 0, 0.05490196, 1,
2.189483, -0.8640475, 2.6943, 1, 0, 0.04705882, 1,
2.198755, 0.8055314, 2.091936, 1, 0, 0.04313726, 1,
2.437749, 0.04599122, 2.771344, 1, 0, 0.03529412, 1,
2.551123, -1.627254, 1.24063, 1, 0, 0.03137255, 1,
2.615538, -0.7924218, 0.1730228, 1, 0, 0.02352941, 1,
2.789174, -0.6902702, -0.5837092, 1, 0, 0.01960784, 1,
2.970353, 1.382301, 1.515936, 1, 0, 0.01176471, 1,
3.33584, 0.1062662, 1.845854, 1, 0, 0.007843138, 1
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
0.2976263, -4.91831, -6.995135, 0, -0.5, 0.5, 0.5,
0.2976263, -4.91831, -6.995135, 1, -0.5, 0.5, 0.5,
0.2976263, -4.91831, -6.995135, 1, 1.5, 0.5, 0.5,
0.2976263, -4.91831, -6.995135, 0, 1.5, 0.5, 0.5
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
-3.770542, -0.1722636, -6.995135, 0, -0.5, 0.5, 0.5,
-3.770542, -0.1722636, -6.995135, 1, -0.5, 0.5, 0.5,
-3.770542, -0.1722636, -6.995135, 1, 1.5, 0.5, 0.5,
-3.770542, -0.1722636, -6.995135, 0, 1.5, 0.5, 0.5
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
-3.770542, -4.91831, 0.08128476, 0, -0.5, 0.5, 0.5,
-3.770542, -4.91831, 0.08128476, 1, -0.5, 0.5, 0.5,
-3.770542, -4.91831, 0.08128476, 1, 1.5, 0.5, 0.5,
-3.770542, -4.91831, 0.08128476, 0, 1.5, 0.5, 0.5
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
-2, -3.823069, -5.362115,
3, -3.823069, -5.362115,
-2, -3.823069, -5.362115,
-2, -4.005609, -5.634285,
-1, -3.823069, -5.362115,
-1, -4.005609, -5.634285,
0, -3.823069, -5.362115,
0, -4.005609, -5.634285,
1, -3.823069, -5.362115,
1, -4.005609, -5.634285,
2, -3.823069, -5.362115,
2, -4.005609, -5.634285,
3, -3.823069, -5.362115,
3, -4.005609, -5.634285
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
-2, -4.370689, -6.178625, 0, -0.5, 0.5, 0.5,
-2, -4.370689, -6.178625, 1, -0.5, 0.5, 0.5,
-2, -4.370689, -6.178625, 1, 1.5, 0.5, 0.5,
-2, -4.370689, -6.178625, 0, 1.5, 0.5, 0.5,
-1, -4.370689, -6.178625, 0, -0.5, 0.5, 0.5,
-1, -4.370689, -6.178625, 1, -0.5, 0.5, 0.5,
-1, -4.370689, -6.178625, 1, 1.5, 0.5, 0.5,
-1, -4.370689, -6.178625, 0, 1.5, 0.5, 0.5,
0, -4.370689, -6.178625, 0, -0.5, 0.5, 0.5,
0, -4.370689, -6.178625, 1, -0.5, 0.5, 0.5,
0, -4.370689, -6.178625, 1, 1.5, 0.5, 0.5,
0, -4.370689, -6.178625, 0, 1.5, 0.5, 0.5,
1, -4.370689, -6.178625, 0, -0.5, 0.5, 0.5,
1, -4.370689, -6.178625, 1, -0.5, 0.5, 0.5,
1, -4.370689, -6.178625, 1, 1.5, 0.5, 0.5,
1, -4.370689, -6.178625, 0, 1.5, 0.5, 0.5,
2, -4.370689, -6.178625, 0, -0.5, 0.5, 0.5,
2, -4.370689, -6.178625, 1, -0.5, 0.5, 0.5,
2, -4.370689, -6.178625, 1, 1.5, 0.5, 0.5,
2, -4.370689, -6.178625, 0, 1.5, 0.5, 0.5,
3, -4.370689, -6.178625, 0, -0.5, 0.5, 0.5,
3, -4.370689, -6.178625, 1, -0.5, 0.5, 0.5,
3, -4.370689, -6.178625, 1, 1.5, 0.5, 0.5,
3, -4.370689, -6.178625, 0, 1.5, 0.5, 0.5
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
-2.831734, -2, -5.362115,
-2.831734, 2, -5.362115,
-2.831734, -2, -5.362115,
-2.988202, -2, -5.634285,
-2.831734, 0, -5.362115,
-2.988202, 0, -5.634285,
-2.831734, 2, -5.362115,
-2.988202, 2, -5.634285
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
-3.301138, -2, -6.178625, 0, -0.5, 0.5, 0.5,
-3.301138, -2, -6.178625, 1, -0.5, 0.5, 0.5,
-3.301138, -2, -6.178625, 1, 1.5, 0.5, 0.5,
-3.301138, -2, -6.178625, 0, 1.5, 0.5, 0.5,
-3.301138, 0, -6.178625, 0, -0.5, 0.5, 0.5,
-3.301138, 0, -6.178625, 1, -0.5, 0.5, 0.5,
-3.301138, 0, -6.178625, 1, 1.5, 0.5, 0.5,
-3.301138, 0, -6.178625, 0, 1.5, 0.5, 0.5,
-3.301138, 2, -6.178625, 0, -0.5, 0.5, 0.5,
-3.301138, 2, -6.178625, 1, -0.5, 0.5, 0.5,
-3.301138, 2, -6.178625, 1, 1.5, 0.5, 0.5,
-3.301138, 2, -6.178625, 0, 1.5, 0.5, 0.5
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
-2.831734, -3.823069, -4,
-2.831734, -3.823069, 4,
-2.831734, -3.823069, -4,
-2.988202, -4.005609, -4,
-2.831734, -3.823069, -2,
-2.988202, -4.005609, -2,
-2.831734, -3.823069, 0,
-2.988202, -4.005609, 0,
-2.831734, -3.823069, 2,
-2.988202, -4.005609, 2,
-2.831734, -3.823069, 4,
-2.988202, -4.005609, 4
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
-3.301138, -4.370689, -4, 0, -0.5, 0.5, 0.5,
-3.301138, -4.370689, -4, 1, -0.5, 0.5, 0.5,
-3.301138, -4.370689, -4, 1, 1.5, 0.5, 0.5,
-3.301138, -4.370689, -4, 0, 1.5, 0.5, 0.5,
-3.301138, -4.370689, -2, 0, -0.5, 0.5, 0.5,
-3.301138, -4.370689, -2, 1, -0.5, 0.5, 0.5,
-3.301138, -4.370689, -2, 1, 1.5, 0.5, 0.5,
-3.301138, -4.370689, -2, 0, 1.5, 0.5, 0.5,
-3.301138, -4.370689, 0, 0, -0.5, 0.5, 0.5,
-3.301138, -4.370689, 0, 1, -0.5, 0.5, 0.5,
-3.301138, -4.370689, 0, 1, 1.5, 0.5, 0.5,
-3.301138, -4.370689, 0, 0, 1.5, 0.5, 0.5,
-3.301138, -4.370689, 2, 0, -0.5, 0.5, 0.5,
-3.301138, -4.370689, 2, 1, -0.5, 0.5, 0.5,
-3.301138, -4.370689, 2, 1, 1.5, 0.5, 0.5,
-3.301138, -4.370689, 2, 0, 1.5, 0.5, 0.5,
-3.301138, -4.370689, 4, 0, -0.5, 0.5, 0.5,
-3.301138, -4.370689, 4, 1, -0.5, 0.5, 0.5,
-3.301138, -4.370689, 4, 1, 1.5, 0.5, 0.5,
-3.301138, -4.370689, 4, 0, 1.5, 0.5, 0.5
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
-2.831734, -3.823069, -5.362115,
-2.831734, 3.478541, -5.362115,
-2.831734, -3.823069, 5.524684,
-2.831734, 3.478541, 5.524684,
-2.831734, -3.823069, -5.362115,
-2.831734, -3.823069, 5.524684,
-2.831734, 3.478541, -5.362115,
-2.831734, 3.478541, 5.524684,
-2.831734, -3.823069, -5.362115,
3.426987, -3.823069, -5.362115,
-2.831734, -3.823069, 5.524684,
3.426987, -3.823069, 5.524684,
-2.831734, 3.478541, -5.362115,
3.426987, 3.478541, -5.362115,
-2.831734, 3.478541, 5.524684,
3.426987, 3.478541, 5.524684,
3.426987, -3.823069, -5.362115,
3.426987, 3.478541, -5.362115,
3.426987, -3.823069, 5.524684,
3.426987, 3.478541, 5.524684,
3.426987, -3.823069, -5.362115,
3.426987, -3.823069, 5.524684,
3.426987, 3.478541, -5.362115,
3.426987, 3.478541, 5.524684
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
var radius = 7.756654;
var distance = 34.51023;
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
mvMatrix.translate( -0.2976263, 0.1722636, -0.08128476 );
mvMatrix.scale( 1.339994, 1.148602, 0.77035 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.51023);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Nitrofen<-read.table("Nitrofen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Nitrofen$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nitrofen' not found
```

```r
y<-Nitrofen$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nitrofen' not found
```

```r
z<-Nitrofen$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nitrofen' not found
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
-2.740588, 0.08081511, -2.159467, 0, 0, 1, 1, 1,
-2.729106, -0.7710592, -2.110284, 1, 0, 0, 1, 1,
-2.726592, 1.11578, -2.369713, 1, 0, 0, 1, 1,
-2.638576, 0.3013414, 0.4027247, 1, 0, 0, 1, 1,
-2.545551, 0.4398075, -1.910332, 1, 0, 0, 1, 1,
-2.443659, -0.5213882, -0.7236111, 1, 0, 0, 1, 1,
-2.432309, 0.2488254, -1.516006, 0, 0, 0, 1, 1,
-2.403651, -0.02781322, -0.5271294, 0, 0, 0, 1, 1,
-2.356063, -0.1940262, -3.624572, 0, 0, 0, 1, 1,
-2.331488, -0.3956825, -0.8979366, 0, 0, 0, 1, 1,
-2.292154, 0.3968625, 0.218039, 0, 0, 0, 1, 1,
-2.281892, -0.4770018, -1.589549, 0, 0, 0, 1, 1,
-2.262833, 0.1997018, -1.253577, 0, 0, 0, 1, 1,
-2.259703, 1.088251, -1.528177, 1, 1, 1, 1, 1,
-2.254893, 0.5702024, -0.3394756, 1, 1, 1, 1, 1,
-2.236139, 0.7554064, -0.9932537, 1, 1, 1, 1, 1,
-2.234524, 2.007301, 0.3034986, 1, 1, 1, 1, 1,
-2.2345, -2.247579, -1.248205, 1, 1, 1, 1, 1,
-2.218398, -1.548984, -2.584329, 1, 1, 1, 1, 1,
-2.218065, 2.39293, 0.1412733, 1, 1, 1, 1, 1,
-2.199285, -0.2443931, -2.435946, 1, 1, 1, 1, 1,
-2.197434, 0.2753199, -2.138104, 1, 1, 1, 1, 1,
-2.196676, -1.711089, -2.334553, 1, 1, 1, 1, 1,
-2.18481, 0.637006, -1.902383, 1, 1, 1, 1, 1,
-2.17355, 0.4117413, -0.5874784, 1, 1, 1, 1, 1,
-2.095647, 0.08487452, -1.582919, 1, 1, 1, 1, 1,
-2.093541, -0.7962411, -2.759584, 1, 1, 1, 1, 1,
-2.04062, -0.4441661, -1.646302, 1, 1, 1, 1, 1,
-2.021964, 0.7496743, -3.672488, 0, 0, 1, 1, 1,
-2.019074, 0.8469092, -1.632376, 1, 0, 0, 1, 1,
-2.015112, -1.126525, -1.851247, 1, 0, 0, 1, 1,
-1.985231, -1.696487, -2.545694, 1, 0, 0, 1, 1,
-1.980672, -0.7930379, -3.844215, 1, 0, 0, 1, 1,
-1.938783, -0.8849456, -1.577348, 1, 0, 0, 1, 1,
-1.924708, -2.010149, -3.408971, 0, 0, 0, 1, 1,
-1.898874, -0.01262311, -0.8390449, 0, 0, 0, 1, 1,
-1.88836, 0.3625283, -1.118969, 0, 0, 0, 1, 1,
-1.884863, -0.2404253, -1.885615, 0, 0, 0, 1, 1,
-1.871898, 1.592014, -0.7636288, 0, 0, 0, 1, 1,
-1.859562, -0.2134805, -1.085609, 0, 0, 0, 1, 1,
-1.84735, 0.3854729, -2.189412, 0, 0, 0, 1, 1,
-1.835279, -0.2508392, -1.202755, 1, 1, 1, 1, 1,
-1.805308, 0.2548236, -2.16399, 1, 1, 1, 1, 1,
-1.759157, 0.3224588, -0.5795881, 1, 1, 1, 1, 1,
-1.75702, -0.8036043, -0.7786658, 1, 1, 1, 1, 1,
-1.737158, -2.161325, -3.063382, 1, 1, 1, 1, 1,
-1.720068, 1.926396, -2.057585, 1, 1, 1, 1, 1,
-1.707387, -2.578697, -1.423724, 1, 1, 1, 1, 1,
-1.702159, -0.0869766, -3.027588, 1, 1, 1, 1, 1,
-1.663028, 0.02464208, -2.422058, 1, 1, 1, 1, 1,
-1.626912, -1.158795, -2.351653, 1, 1, 1, 1, 1,
-1.620319, 1.033953, -0.4975715, 1, 1, 1, 1, 1,
-1.603955, 0.3152231, 0.07514476, 1, 1, 1, 1, 1,
-1.59028, 0.7345806, -1.322472, 1, 1, 1, 1, 1,
-1.579151, -1.665585, -1.81857, 1, 1, 1, 1, 1,
-1.572321, 1.267411, 0.1670508, 1, 1, 1, 1, 1,
-1.570389, 2.118013, 0.227863, 0, 0, 1, 1, 1,
-1.570213, 0.4743589, 0.2583918, 1, 0, 0, 1, 1,
-1.564854, 0.0193483, -1.055995, 1, 0, 0, 1, 1,
-1.555044, -0.1651406, -2.481003, 1, 0, 0, 1, 1,
-1.535046, -0.09604882, -2.636799, 1, 0, 0, 1, 1,
-1.526846, 0.5777585, -2.215755, 1, 0, 0, 1, 1,
-1.52651, -0.3810761, -0.9678448, 0, 0, 0, 1, 1,
-1.499369, -1.342777, -2.028901, 0, 0, 0, 1, 1,
-1.494061, -1.791511, -2.447115, 0, 0, 0, 1, 1,
-1.48957, 1.310169, -0.6578593, 0, 0, 0, 1, 1,
-1.486435, 0.09508424, -0.7666023, 0, 0, 0, 1, 1,
-1.474402, 0.1687546, -0.8176916, 0, 0, 0, 1, 1,
-1.47269, 0.470315, -0.903648, 0, 0, 0, 1, 1,
-1.470086, -1.06623, -1.622171, 1, 1, 1, 1, 1,
-1.465155, 1.199224, -1.814211, 1, 1, 1, 1, 1,
-1.45956, 0.5907769, -0.897705, 1, 1, 1, 1, 1,
-1.444378, -2.18192, -4.004113, 1, 1, 1, 1, 1,
-1.43429, -0.228854, -0.3506245, 1, 1, 1, 1, 1,
-1.428816, 0.1974885, 0.2433725, 1, 1, 1, 1, 1,
-1.428121, 1.366199, -1.730848, 1, 1, 1, 1, 1,
-1.427395, -0.3846825, -0.8325776, 1, 1, 1, 1, 1,
-1.422641, -0.3791009, -2.431356, 1, 1, 1, 1, 1,
-1.415879, 0.9985557, -0.9802334, 1, 1, 1, 1, 1,
-1.406589, 0.6085548, -0.4770743, 1, 1, 1, 1, 1,
-1.396913, -0.8083007, -2.18639, 1, 1, 1, 1, 1,
-1.388903, -0.637324, -2.732081, 1, 1, 1, 1, 1,
-1.388631, 1.719006, 0.1410135, 1, 1, 1, 1, 1,
-1.368943, 1.152368, 0.7583135, 1, 1, 1, 1, 1,
-1.366623, 0.2367106, -1.823454, 0, 0, 1, 1, 1,
-1.354677, -1.25472, 0.04890157, 1, 0, 0, 1, 1,
-1.344042, -0.4047537, -3.298793, 1, 0, 0, 1, 1,
-1.333152, 0.642767, -1.037677, 1, 0, 0, 1, 1,
-1.322498, -0.7854767, -1.85659, 1, 0, 0, 1, 1,
-1.321619, -0.2899348, -3.097798, 1, 0, 0, 1, 1,
-1.317733, 0.2649161, -1.908599, 0, 0, 0, 1, 1,
-1.314008, -1.291593, -1.916615, 0, 0, 0, 1, 1,
-1.311707, 1.127827, 1.931437, 0, 0, 0, 1, 1,
-1.311525, -0.1921821, -3.542709, 0, 0, 0, 1, 1,
-1.307196, 0.4677628, -0.4920745, 0, 0, 0, 1, 1,
-1.306169, 0.8655502, -1.577637, 0, 0, 0, 1, 1,
-1.303884, 1.20591, -2.009765, 0, 0, 0, 1, 1,
-1.301331, -0.395051, -3.315351, 1, 1, 1, 1, 1,
-1.297506, 1.177992, -1.825623, 1, 1, 1, 1, 1,
-1.295505, 1.019337, 0.04020861, 1, 1, 1, 1, 1,
-1.29146, -0.01157611, -1.050542, 1, 1, 1, 1, 1,
-1.290965, 0.5815024, -0.4446398, 1, 1, 1, 1, 1,
-1.280432, 0.6686602, -1.137578, 1, 1, 1, 1, 1,
-1.2748, 2.309022, -1.840603, 1, 1, 1, 1, 1,
-1.268412, 1.050152, 0.5897349, 1, 1, 1, 1, 1,
-1.252055, -0.8216834, -2.312841, 1, 1, 1, 1, 1,
-1.249407, -0.03260417, -1.495667, 1, 1, 1, 1, 1,
-1.248973, -2.699435, -4.340491, 1, 1, 1, 1, 1,
-1.238058, -1.453175, -4.318179, 1, 1, 1, 1, 1,
-1.224525, -0.1450703, -0.5033389, 1, 1, 1, 1, 1,
-1.219952, 0.9415383, 0.1228075, 1, 1, 1, 1, 1,
-1.214673, 0.2720342, -3.697764, 1, 1, 1, 1, 1,
-1.212241, 1.267998, -0.6526847, 0, 0, 1, 1, 1,
-1.208728, -0.6255603, -1.699218, 1, 0, 0, 1, 1,
-1.208578, 0.9007958, 0.0866624, 1, 0, 0, 1, 1,
-1.204781, 0.9008377, -0.3085987, 1, 0, 0, 1, 1,
-1.202375, -0.08971395, -0.3011748, 1, 0, 0, 1, 1,
-1.200256, -0.8829153, -2.319599, 1, 0, 0, 1, 1,
-1.199006, 0.09461369, -1.075922, 0, 0, 0, 1, 1,
-1.192746, 0.5334712, -1.247067, 0, 0, 0, 1, 1,
-1.19075, 1.02457, -0.6951474, 0, 0, 0, 1, 1,
-1.184168, 0.4194544, -0.5994552, 0, 0, 0, 1, 1,
-1.180576, -0.04104396, 0.3999179, 0, 0, 0, 1, 1,
-1.179603, 0.5941429, -1.230706, 0, 0, 0, 1, 1,
-1.172948, 0.6329588, -0.9702626, 0, 0, 0, 1, 1,
-1.171256, 0.6870603, 0.5019035, 1, 1, 1, 1, 1,
-1.154371, 0.5002268, -2.838409, 1, 1, 1, 1, 1,
-1.154278, 1.181828, -1.032586, 1, 1, 1, 1, 1,
-1.142877, 0.4419183, -0.2256861, 1, 1, 1, 1, 1,
-1.135771, 2.315371, -0.0412524, 1, 1, 1, 1, 1,
-1.135556, 1.099408, -2.2656, 1, 1, 1, 1, 1,
-1.126982, -0.5737521, -2.321231, 1, 1, 1, 1, 1,
-1.125483, 0.098023, 1.054818, 1, 1, 1, 1, 1,
-1.122819, -0.9503386, -2.767446, 1, 1, 1, 1, 1,
-1.12181, -0.9413573, -4.143314, 1, 1, 1, 1, 1,
-1.115805, -0.1006404, -1.691633, 1, 1, 1, 1, 1,
-1.114388, 0.6251289, -0.1772979, 1, 1, 1, 1, 1,
-1.11338, 0.232108, -0.4402477, 1, 1, 1, 1, 1,
-1.105129, 1.257578, -2.052009, 1, 1, 1, 1, 1,
-1.102256, 0.5743109, -1.03781, 1, 1, 1, 1, 1,
-1.097555, -0.420679, -2.208337, 0, 0, 1, 1, 1,
-1.096746, 1.46374, -1.5215, 1, 0, 0, 1, 1,
-1.08615, 0.1041215, -2.402359, 1, 0, 0, 1, 1,
-1.081094, -1.054765, -2.770721, 1, 0, 0, 1, 1,
-1.076952, -0.2808957, -1.619747, 1, 0, 0, 1, 1,
-1.073787, -0.0891459, -2.847625, 1, 0, 0, 1, 1,
-1.061635, 1.945514, -1.557644, 0, 0, 0, 1, 1,
-1.057201, -1.542773, -5.11623, 0, 0, 0, 1, 1,
-1.052785, 2.559561, 0.1471871, 0, 0, 0, 1, 1,
-1.048862, 1.068908, -0.4341686, 0, 0, 0, 1, 1,
-1.043624, 0.6195898, -1.23509, 0, 0, 0, 1, 1,
-1.039186, 1.065759, -0.5192186, 0, 0, 0, 1, 1,
-1.036262, 0.1569422, 1.127195, 0, 0, 0, 1, 1,
-1.030955, -0.7770659, -2.272104, 1, 1, 1, 1, 1,
-1.026329, -0.3722992, -3.590899, 1, 1, 1, 1, 1,
-1.021801, -0.4886452, -1.754752, 1, 1, 1, 1, 1,
-1.019878, -0.9402504, -2.11791, 1, 1, 1, 1, 1,
-1.009848, 1.193897, -0.8045472, 1, 1, 1, 1, 1,
-1.007377, -1.104797, -1.966828, 1, 1, 1, 1, 1,
-1.003669, 0.8976513, 0.2277608, 1, 1, 1, 1, 1,
-1.001932, -1.385918, -4.040245, 1, 1, 1, 1, 1,
-0.9902034, -0.8887219, -3.24497, 1, 1, 1, 1, 1,
-0.9895411, 1.23783, -0.04803107, 1, 1, 1, 1, 1,
-0.9889343, 0.4324498, -0.8823323, 1, 1, 1, 1, 1,
-0.9883298, -0.1930517, -2.088655, 1, 1, 1, 1, 1,
-0.984214, 0.6788446, -1.95514, 1, 1, 1, 1, 1,
-0.983168, -0.2093271, -2.052675, 1, 1, 1, 1, 1,
-0.9817365, -1.97408, -1.48536, 1, 1, 1, 1, 1,
-0.9800068, -0.05384789, -0.6280926, 0, 0, 1, 1, 1,
-0.9788181, -0.08871633, -1.657371, 1, 0, 0, 1, 1,
-0.9748557, 0.5049194, -2.512821, 1, 0, 0, 1, 1,
-0.967546, -0.5174869, -2.08395, 1, 0, 0, 1, 1,
-0.9639012, 0.004950543, -3.275839, 1, 0, 0, 1, 1,
-0.9607219, 0.1336713, -0.4899205, 1, 0, 0, 1, 1,
-0.9530037, -0.4486686, -1.189676, 0, 0, 0, 1, 1,
-0.9509608, -0.4538959, -3.740198, 0, 0, 0, 1, 1,
-0.9439079, -0.7285104, -2.019697, 0, 0, 0, 1, 1,
-0.943866, -0.2206503, -2.273578, 0, 0, 0, 1, 1,
-0.9433462, -0.9047856, -3.56591, 0, 0, 0, 1, 1,
-0.934633, -1.680484, -2.176088, 0, 0, 0, 1, 1,
-0.9263889, 0.8580204, -0.2189049, 0, 0, 0, 1, 1,
-0.9185751, 0.8294373, 1.349671, 1, 1, 1, 1, 1,
-0.9127589, 0.9270945, 1.264581, 1, 1, 1, 1, 1,
-0.9088923, -1.710571, -2.978648, 1, 1, 1, 1, 1,
-0.9050828, -0.8492955, -2.103218, 1, 1, 1, 1, 1,
-0.9038657, -0.1506584, -0.2182988, 1, 1, 1, 1, 1,
-0.8998554, 0.7316709, -0.1582366, 1, 1, 1, 1, 1,
-0.8979853, 0.938395, -2.252307, 1, 1, 1, 1, 1,
-0.8950517, 0.7073587, -1.261041, 1, 1, 1, 1, 1,
-0.8933789, -1.530028, -2.802615, 1, 1, 1, 1, 1,
-0.8930847, 0.1702301, -2.235904, 1, 1, 1, 1, 1,
-0.8861715, -0.7928684, -1.962757, 1, 1, 1, 1, 1,
-0.8842664, 0.6664637, -0.5707073, 1, 1, 1, 1, 1,
-0.8814027, 1.53412, -0.600735, 1, 1, 1, 1, 1,
-0.8806356, 0.04321467, -1.3955, 1, 1, 1, 1, 1,
-0.8754214, -1.675413, -3.022352, 1, 1, 1, 1, 1,
-0.8696126, 0.534874, -1.068508, 0, 0, 1, 1, 1,
-0.8686559, 0.2052058, -3.200012, 1, 0, 0, 1, 1,
-0.8644213, -0.5937984, -2.604768, 1, 0, 0, 1, 1,
-0.8632699, 0.8675984, -0.7683967, 1, 0, 0, 1, 1,
-0.8628405, 0.6921917, -1.093983, 1, 0, 0, 1, 1,
-0.8592282, 1.209619, -1.492237, 1, 0, 0, 1, 1,
-0.8578805, 0.9307405, 0.8952712, 0, 0, 0, 1, 1,
-0.8549935, 0.06146286, -1.334903, 0, 0, 0, 1, 1,
-0.8519643, -0.8386804, -2.970103, 0, 0, 0, 1, 1,
-0.8509823, -0.1646902, -3.658549, 0, 0, 0, 1, 1,
-0.8460306, 2.395669, 0.1887234, 0, 0, 0, 1, 1,
-0.8450048, -0.5226119, -1.942017, 0, 0, 0, 1, 1,
-0.8417044, -0.4085104, -1.853745, 0, 0, 0, 1, 1,
-0.831588, -1.102175, -1.544528, 1, 1, 1, 1, 1,
-0.8302578, 2.15314, -1.829683, 1, 1, 1, 1, 1,
-0.8246785, -1.413339, -3.630649, 1, 1, 1, 1, 1,
-0.8204383, 0.6632348, -0.5169123, 1, 1, 1, 1, 1,
-0.8181547, 1.10709, -2.256173, 1, 1, 1, 1, 1,
-0.8175366, -0.2885307, -3.021815, 1, 1, 1, 1, 1,
-0.8088398, -0.100068, -1.518043, 1, 1, 1, 1, 1,
-0.7938308, -0.07461116, -1.407687, 1, 1, 1, 1, 1,
-0.7881464, 1.129541, -1.393682, 1, 1, 1, 1, 1,
-0.7856988, 0.2363966, -1.161603, 1, 1, 1, 1, 1,
-0.7855693, 0.09019727, -1.192321, 1, 1, 1, 1, 1,
-0.7843552, 0.001933465, -2.21905, 1, 1, 1, 1, 1,
-0.7834388, 0.8406221, -0.1360083, 1, 1, 1, 1, 1,
-0.7814407, 0.4929895, -1.333664, 1, 1, 1, 1, 1,
-0.775903, 1.260658, 1.536163, 1, 1, 1, 1, 1,
-0.7740229, -0.4320735, -1.654572, 0, 0, 1, 1, 1,
-0.7733045, -0.5065838, -2.966128, 1, 0, 0, 1, 1,
-0.7730233, -0.325149, -1.664159, 1, 0, 0, 1, 1,
-0.7726696, 1.929537, -0.939509, 1, 0, 0, 1, 1,
-0.7710145, -0.7765129, -1.741503, 1, 0, 0, 1, 1,
-0.7685443, 0.07463031, -1.664901, 1, 0, 0, 1, 1,
-0.7653275, -0.3643605, -2.452844, 0, 0, 0, 1, 1,
-0.7644256, 1.110805, -1.834532, 0, 0, 0, 1, 1,
-0.7576334, 0.09561465, -0.1251063, 0, 0, 0, 1, 1,
-0.75542, -0.4651149, -2.392313, 0, 0, 0, 1, 1,
-0.753683, 0.2837989, -2.535588, 0, 0, 0, 1, 1,
-0.7514087, -0.2355411, -2.582509, 0, 0, 0, 1, 1,
-0.7492606, -0.4285101, -4.499572, 0, 0, 0, 1, 1,
-0.7480066, 0.4700971, 0.3988563, 1, 1, 1, 1, 1,
-0.7456995, -0.5513649, -1.663069, 1, 1, 1, 1, 1,
-0.745222, -0.770924, -2.274397, 1, 1, 1, 1, 1,
-0.7331842, -0.7033007, -1.706368, 1, 1, 1, 1, 1,
-0.7297349, 0.4015133, -0.3167875, 1, 1, 1, 1, 1,
-0.7284283, -0.5232227, -0.1131936, 1, 1, 1, 1, 1,
-0.7171164, -0.6743973, -2.704412, 1, 1, 1, 1, 1,
-0.7077572, 0.2143943, -0.8060057, 1, 1, 1, 1, 1,
-0.70681, 2.168249, -0.05952907, 1, 1, 1, 1, 1,
-0.7039321, 0.5511522, -1.017899, 1, 1, 1, 1, 1,
-0.7037936, 0.1775547, -1.20476, 1, 1, 1, 1, 1,
-0.7012582, 0.7864037, -1.235954, 1, 1, 1, 1, 1,
-0.694816, 0.0361133, -2.08848, 1, 1, 1, 1, 1,
-0.6923136, -1.461523, -3.308259, 1, 1, 1, 1, 1,
-0.6921587, 0.5628279, -1.796801, 1, 1, 1, 1, 1,
-0.6911388, -1.132023, -2.124552, 0, 0, 1, 1, 1,
-0.6896541, 2.043672, 0.1969285, 1, 0, 0, 1, 1,
-0.6890097, 1.779254, -1.212195, 1, 0, 0, 1, 1,
-0.6844025, -0.494554, -1.097147, 1, 0, 0, 1, 1,
-0.6834633, 0.7373114, -0.1302104, 1, 0, 0, 1, 1,
-0.6817187, 1.404634, -2.611122, 1, 0, 0, 1, 1,
-0.6761296, 0.08117449, -0.9959596, 0, 0, 0, 1, 1,
-0.6721738, 0.9265161, -1.563468, 0, 0, 0, 1, 1,
-0.670741, 0.7453333, -0.8723749, 0, 0, 0, 1, 1,
-0.6691999, 0.1649683, 1.259024, 0, 0, 0, 1, 1,
-0.6691681, -0.30985, -1.82021, 0, 0, 0, 1, 1,
-0.6594506, 0.4226766, -2.479977, 0, 0, 0, 1, 1,
-0.657572, 0.5398474, 1.637865, 0, 0, 0, 1, 1,
-0.6532214, -0.5839407, -2.007192, 1, 1, 1, 1, 1,
-0.6508185, 0.7030509, -2.243913, 1, 1, 1, 1, 1,
-0.6497619, -0.06406274, -2.324266, 1, 1, 1, 1, 1,
-0.6484689, -0.3596232, -1.103971, 1, 1, 1, 1, 1,
-0.6476749, -1.198655, -3.322564, 1, 1, 1, 1, 1,
-0.6466207, -1.861112, -2.646876, 1, 1, 1, 1, 1,
-0.6448531, 1.155221, -0.203908, 1, 1, 1, 1, 1,
-0.6430103, 0.7388245, 0.4387086, 1, 1, 1, 1, 1,
-0.6378438, 0.0966121, -1.746155, 1, 1, 1, 1, 1,
-0.6353063, 1.894531, 0.07771026, 1, 1, 1, 1, 1,
-0.628935, -1.530666, -1.862591, 1, 1, 1, 1, 1,
-0.626667, -1.858782, -2.521868, 1, 1, 1, 1, 1,
-0.6162505, -0.8335012, -3.382865, 1, 1, 1, 1, 1,
-0.6155229, -1.319324, -4.021143, 1, 1, 1, 1, 1,
-0.608359, 1.133028, 0.8619286, 1, 1, 1, 1, 1,
-0.6071574, 0.9636388, -1.468461, 0, 0, 1, 1, 1,
-0.606494, -1.401813, -1.776633, 1, 0, 0, 1, 1,
-0.6061794, 0.300017, -3.259564, 1, 0, 0, 1, 1,
-0.6061164, 0.3573126, -1.930973, 1, 0, 0, 1, 1,
-0.5985296, 2.247424, -0.1941531, 1, 0, 0, 1, 1,
-0.5885653, 0.4543756, 0.6126939, 1, 0, 0, 1, 1,
-0.5806418, 0.9967303, -1.635291, 0, 0, 0, 1, 1,
-0.5741023, -0.6935582, -3.091225, 0, 0, 0, 1, 1,
-0.5720695, 0.3673778, -0.730092, 0, 0, 0, 1, 1,
-0.5686756, 0.1091999, -0.7270998, 0, 0, 0, 1, 1,
-0.5641627, -0.9512659, -2.801498, 0, 0, 0, 1, 1,
-0.560294, 1.210439, -0.7935662, 0, 0, 0, 1, 1,
-0.5578584, 1.486893, -2.462661, 0, 0, 0, 1, 1,
-0.5558838, 0.5470963, -0.7572211, 1, 1, 1, 1, 1,
-0.5549873, 0.5757446, -0.5914963, 1, 1, 1, 1, 1,
-0.5539618, 0.7155054, 0.5479199, 1, 1, 1, 1, 1,
-0.5401396, 0.4755831, -0.7341668, 1, 1, 1, 1, 1,
-0.5390209, 0.5239646, 0.943507, 1, 1, 1, 1, 1,
-0.5281877, 0.9766182, -0.1629971, 1, 1, 1, 1, 1,
-0.5275354, 0.07699306, -0.850029, 1, 1, 1, 1, 1,
-0.522293, -0.5513976, -2.695911, 1, 1, 1, 1, 1,
-0.5210645, 1.709745, -0.7841405, 1, 1, 1, 1, 1,
-0.5202999, -1.578366, -3.725051, 1, 1, 1, 1, 1,
-0.5200739, -0.2614872, -2.388769, 1, 1, 1, 1, 1,
-0.5194208, 0.4364144, 0.4108292, 1, 1, 1, 1, 1,
-0.5177819, 1.868556, 0.3846245, 1, 1, 1, 1, 1,
-0.5175281, -1.574484, -3.95731, 1, 1, 1, 1, 1,
-0.5103719, -0.3735053, -1.388147, 1, 1, 1, 1, 1,
-0.5064181, -1.985551, -4.40274, 0, 0, 1, 1, 1,
-0.505784, -0.481193, -1.044306, 1, 0, 0, 1, 1,
-0.5046315, 1.737952, -0.7873552, 1, 0, 0, 1, 1,
-0.5036855, 1.467477, -1.493455, 1, 0, 0, 1, 1,
-0.4955708, 0.5694199, -1.579001, 1, 0, 0, 1, 1,
-0.4931369, -0.7000783, -2.830889, 1, 0, 0, 1, 1,
-0.4901861, 1.309952, 0.5954556, 0, 0, 0, 1, 1,
-0.4894549, 0.07371233, -0.8070626, 0, 0, 0, 1, 1,
-0.4823556, -1.030022, -2.872001, 0, 0, 0, 1, 1,
-0.4808952, -0.063984, -2.258997, 0, 0, 0, 1, 1,
-0.4795551, 0.9028875, -1.018614, 0, 0, 0, 1, 1,
-0.4790018, -0.1815061, -2.279452, 0, 0, 0, 1, 1,
-0.4535204, -0.5373446, -1.393549, 0, 0, 0, 1, 1,
-0.4508836, 2.634717, -0.6952782, 1, 1, 1, 1, 1,
-0.4474832, 0.9454746, 0.2417743, 1, 1, 1, 1, 1,
-0.4462044, -0.284071, -2.545013, 1, 1, 1, 1, 1,
-0.4457735, 1.468462, 0.7256462, 1, 1, 1, 1, 1,
-0.4448302, -1.149637, -2.30826, 1, 1, 1, 1, 1,
-0.4436929, -0.6029646, -2.500755, 1, 1, 1, 1, 1,
-0.4413426, 0.09696621, -0.8854641, 1, 1, 1, 1, 1,
-0.4340163, 0.4955069, -0.4147053, 1, 1, 1, 1, 1,
-0.4336584, 0.08249488, -1.233133, 1, 1, 1, 1, 1,
-0.4290223, 0.4519698, 0.4673953, 1, 1, 1, 1, 1,
-0.4279113, 1.146181, -1.826612, 1, 1, 1, 1, 1,
-0.4278625, 0.1571001, -0.05641764, 1, 1, 1, 1, 1,
-0.4219719, -0.6605998, -3.696779, 1, 1, 1, 1, 1,
-0.4202837, 0.6858771, 0.3823283, 1, 1, 1, 1, 1,
-0.418665, -0.3061469, -2.004328, 1, 1, 1, 1, 1,
-0.416926, -1.146499, -2.048807, 0, 0, 1, 1, 1,
-0.4158147, 1.184045, -1.711335, 1, 0, 0, 1, 1,
-0.4148983, -0.3688134, -2.289745, 1, 0, 0, 1, 1,
-0.4136942, -0.6102433, -1.544404, 1, 0, 0, 1, 1,
-0.4079023, -0.620663, -1.578932, 1, 0, 0, 1, 1,
-0.4058097, -0.3843918, -2.022713, 1, 0, 0, 1, 1,
-0.4018746, 0.1175777, -0.9604901, 0, 0, 0, 1, 1,
-0.4009814, -0.720507, -2.795469, 0, 0, 0, 1, 1,
-0.3947141, 0.2002933, 0.4576647, 0, 0, 0, 1, 1,
-0.3899061, 1.435155, -0.9350877, 0, 0, 0, 1, 1,
-0.3878412, -1.793879, -3.354646, 0, 0, 0, 1, 1,
-0.3835851, -0.2991293, -1.954361, 0, 0, 0, 1, 1,
-0.382381, -1.9892, -4.107378, 0, 0, 0, 1, 1,
-0.382141, 0.9234593, 1.209364, 1, 1, 1, 1, 1,
-0.3806372, -1.176277, -3.624243, 1, 1, 1, 1, 1,
-0.3735088, -0.2200719, -1.611945, 1, 1, 1, 1, 1,
-0.3661472, 0.548588, -0.4836294, 1, 1, 1, 1, 1,
-0.3651387, 0.5663611, -0.1922138, 1, 1, 1, 1, 1,
-0.3624773, -3.716734, -2.760808, 1, 1, 1, 1, 1,
-0.3605017, -0.495478, -3.278458, 1, 1, 1, 1, 1,
-0.3591878, 0.2260191, -0.4368398, 1, 1, 1, 1, 1,
-0.3561414, -1.292935, -2.878744, 1, 1, 1, 1, 1,
-0.3542099, 1.123626, -0.83764, 1, 1, 1, 1, 1,
-0.3522163, 0.7816657, -1.877266, 1, 1, 1, 1, 1,
-0.350151, -0.3042985, -3.684509, 1, 1, 1, 1, 1,
-0.3498236, -0.3034824, -1.687969, 1, 1, 1, 1, 1,
-0.3481475, -0.3471009, -1.936506, 1, 1, 1, 1, 1,
-0.3427601, -1.490046, -3.189999, 1, 1, 1, 1, 1,
-0.3356093, 0.8730716, -0.7924948, 0, 0, 1, 1, 1,
-0.3346453, 0.729583, -0.6989301, 1, 0, 0, 1, 1,
-0.3346452, -0.7556956, -1.567012, 1, 0, 0, 1, 1,
-0.3325228, 0.3026164, 0.08790505, 1, 0, 0, 1, 1,
-0.3303894, 0.7748798, -2.386134, 1, 0, 0, 1, 1,
-0.3134879, 0.3451612, -0.2491723, 1, 0, 0, 1, 1,
-0.3127081, 0.8294507, 0.041322, 0, 0, 0, 1, 1,
-0.3119959, -1.459791, -2.412982, 0, 0, 0, 1, 1,
-0.3081365, 1.263207, -0.132739, 0, 0, 0, 1, 1,
-0.3039227, 0.8572719, 0.01544224, 0, 0, 0, 1, 1,
-0.3030295, -0.268263, -1.799882, 0, 0, 0, 1, 1,
-0.3015271, -2.648626, -1.475359, 0, 0, 0, 1, 1,
-0.2993793, -0.7235809, -1.867416, 0, 0, 0, 1, 1,
-0.2981889, -1.306226, -3.058991, 1, 1, 1, 1, 1,
-0.2968815, -1.196652, -2.232665, 1, 1, 1, 1, 1,
-0.2946274, -2.056308, -2.245224, 1, 1, 1, 1, 1,
-0.2943667, 1.020505, 2.752507, 1, 1, 1, 1, 1,
-0.2931197, 1.183794, -1.494695, 1, 1, 1, 1, 1,
-0.292834, -0.1118192, -3.153173, 1, 1, 1, 1, 1,
-0.2912535, -0.7628199, -4.195403, 1, 1, 1, 1, 1,
-0.287923, -0.4742642, -1.965201, 1, 1, 1, 1, 1,
-0.2867601, -1.00168, -3.342092, 1, 1, 1, 1, 1,
-0.2826805, -0.3777569, -3.153542, 1, 1, 1, 1, 1,
-0.282474, -0.1927536, -0.1491093, 1, 1, 1, 1, 1,
-0.2818891, -0.1041987, -2.00416, 1, 1, 1, 1, 1,
-0.2814564, 1.217114, -0.8472639, 1, 1, 1, 1, 1,
-0.2799159, -0.4545936, -4.32175, 1, 1, 1, 1, 1,
-0.2792353, -1.029726, -2.853027, 1, 1, 1, 1, 1,
-0.2762699, 0.6093817, 0.6671849, 0, 0, 1, 1, 1,
-0.2726482, 0.6825351, -0.08775848, 1, 0, 0, 1, 1,
-0.2659118, 0.2196142, 1.694481, 1, 0, 0, 1, 1,
-0.2645664, 0.6399802, -0.1930444, 1, 0, 0, 1, 1,
-0.2639418, -0.01369984, 0.4835258, 1, 0, 0, 1, 1,
-0.2579994, -0.7509383, -1.220678, 1, 0, 0, 1, 1,
-0.2574289, 0.47646, -0.4205593, 0, 0, 0, 1, 1,
-0.2573958, -0.3977895, -1.725159, 0, 0, 0, 1, 1,
-0.2562782, -1.188608, -2.07116, 0, 0, 0, 1, 1,
-0.2536637, 1.165734, -0.2832346, 0, 0, 0, 1, 1,
-0.2506592, -1.309522, -3.271811, 0, 0, 0, 1, 1,
-0.2491474, -0.9573075, -3.285637, 0, 0, 0, 1, 1,
-0.2446641, 0.4536498, -0.6110297, 0, 0, 0, 1, 1,
-0.244463, 0.8317968, 0.4648208, 1, 1, 1, 1, 1,
-0.2439122, 2.41904, 0.4708154, 1, 1, 1, 1, 1,
-0.2429785, -0.7195851, -3.779626, 1, 1, 1, 1, 1,
-0.2359145, 0.9805719, 1.590394, 1, 1, 1, 1, 1,
-0.2350948, 0.6423016, -1.186455, 1, 1, 1, 1, 1,
-0.2323175, -0.1028185, -2.085304, 1, 1, 1, 1, 1,
-0.2298287, -0.8605669, -2.942122, 1, 1, 1, 1, 1,
-0.2297049, -0.6927543, -2.585684, 1, 1, 1, 1, 1,
-0.2296822, -1.66497, -2.618096, 1, 1, 1, 1, 1,
-0.2252623, 0.1534865, -2.067906, 1, 1, 1, 1, 1,
-0.223368, -0.6894544, -3.959612, 1, 1, 1, 1, 1,
-0.2203434, 0.07656096, -0.05964876, 1, 1, 1, 1, 1,
-0.218505, 0.1030466, -2.101247, 1, 1, 1, 1, 1,
-0.2167453, -0.5331404, -0.7216833, 1, 1, 1, 1, 1,
-0.2152233, -0.3081622, -3.645939, 1, 1, 1, 1, 1,
-0.2120388, -0.4602253, -2.719095, 0, 0, 1, 1, 1,
-0.2119537, 0.8686959, -1.052486, 1, 0, 0, 1, 1,
-0.20787, 0.06880368, -1.570917, 1, 0, 0, 1, 1,
-0.2076678, -0.2795328, -2.107167, 1, 0, 0, 1, 1,
-0.2045541, 0.4808483, -0.4280111, 1, 0, 0, 1, 1,
-0.1983283, -0.6203843, -5.203569, 1, 0, 0, 1, 1,
-0.1944076, 0.9789032, 0.03425489, 0, 0, 0, 1, 1,
-0.1933332, 1.62233, -0.9576184, 0, 0, 0, 1, 1,
-0.1886363, 0.5211306, -1.313504, 0, 0, 0, 1, 1,
-0.178487, 0.3753028, -1.226593, 0, 0, 0, 1, 1,
-0.1755101, 1.818644, -0.1985479, 0, 0, 0, 1, 1,
-0.1743568, 0.3322864, -0.09109841, 0, 0, 0, 1, 1,
-0.1704664, -0.06904951, -1.995265, 0, 0, 0, 1, 1,
-0.1703804, -0.1804055, -4.403023, 1, 1, 1, 1, 1,
-0.1702374, 0.2670614, -2.198814, 1, 1, 1, 1, 1,
-0.1694114, -0.9667962, -3.839424, 1, 1, 1, 1, 1,
-0.167877, -1.126773, -5.063711, 1, 1, 1, 1, 1,
-0.1627964, -1.051934, -2.924234, 1, 1, 1, 1, 1,
-0.160735, -0.4789326, -1.975308, 1, 1, 1, 1, 1,
-0.1562515, -0.2820975, -3.098135, 1, 1, 1, 1, 1,
-0.1549305, -0.7774448, -3.736383, 1, 1, 1, 1, 1,
-0.1524738, -2.582494, -3.841365, 1, 1, 1, 1, 1,
-0.1494253, 0.1824925, -0.4002214, 1, 1, 1, 1, 1,
-0.1465513, 1.589151, -1.255661, 1, 1, 1, 1, 1,
-0.1459382, -0.9048097, -2.636399, 1, 1, 1, 1, 1,
-0.1429724, 0.2247549, -0.1093222, 1, 1, 1, 1, 1,
-0.142813, 1.261293, -0.03912073, 1, 1, 1, 1, 1,
-0.1419845, 0.2560356, -1.319767, 1, 1, 1, 1, 1,
-0.1394681, -1.059064, -3.61834, 0, 0, 1, 1, 1,
-0.1376706, 1.902728, 0.08122675, 1, 0, 0, 1, 1,
-0.136868, -0.4125084, -2.270953, 1, 0, 0, 1, 1,
-0.1356764, -0.3972996, -1.630811, 1, 0, 0, 1, 1,
-0.1332213, -0.6680127, -2.935626, 1, 0, 0, 1, 1,
-0.1328222, 0.7647791, 0.7963181, 1, 0, 0, 1, 1,
-0.1310576, -0.5682501, -1.216102, 0, 0, 0, 1, 1,
-0.1254532, 0.9297123, 0.1189624, 0, 0, 0, 1, 1,
-0.1240423, 0.6571199, 2.369497, 0, 0, 0, 1, 1,
-0.124014, 0.1103987, -0.02214575, 0, 0, 0, 1, 1,
-0.1221212, 0.1341732, -1.136285, 0, 0, 0, 1, 1,
-0.1210285, 0.4126358, 1.810778, 0, 0, 0, 1, 1,
-0.1187899, -1.983604, -0.854926, 0, 0, 0, 1, 1,
-0.1179014, -0.3193282, -2.522696, 1, 1, 1, 1, 1,
-0.1106434, -1.109349, -1.587785, 1, 1, 1, 1, 1,
-0.1101921, 1.252196, -0.4670434, 1, 1, 1, 1, 1,
-0.110135, -2.147328, -3.389288, 1, 1, 1, 1, 1,
-0.1090649, 0.2119588, -1.071721, 1, 1, 1, 1, 1,
-0.1051927, 0.1001771, -0.521929, 1, 1, 1, 1, 1,
-0.1028319, -0.6105171, -3.537241, 1, 1, 1, 1, 1,
-0.1027576, -0.4840336, -3.234192, 1, 1, 1, 1, 1,
-0.1012471, -0.8330119, -3.927382, 1, 1, 1, 1, 1,
-0.0976999, 1.307052, -1.349186, 1, 1, 1, 1, 1,
-0.09286775, 0.6748057, -1.77919, 1, 1, 1, 1, 1,
-0.09156124, 1.255847, 0.5792548, 1, 1, 1, 1, 1,
-0.08905412, -0.7398691, -3.098097, 1, 1, 1, 1, 1,
-0.08518411, 0.1384791, -1.939996, 1, 1, 1, 1, 1,
-0.07597959, 0.463288, 0.7179521, 1, 1, 1, 1, 1,
-0.07502494, 1.03619, 0.4686575, 0, 0, 1, 1, 1,
-0.074836, 1.874614, -0.3150446, 1, 0, 0, 1, 1,
-0.07458501, -0.9510373, -3.218132, 1, 0, 0, 1, 1,
-0.06891257, -0.2598021, -3.616596, 1, 0, 0, 1, 1,
-0.06758919, -0.01538349, -2.924454, 1, 0, 0, 1, 1,
-0.06498054, 1.044339, 1.966653, 1, 0, 0, 1, 1,
-0.05997219, -0.6774278, -2.184268, 0, 0, 0, 1, 1,
-0.05892809, 2.47727, -1.749487, 0, 0, 0, 1, 1,
-0.05887738, -1.508758, -3.986056, 0, 0, 0, 1, 1,
-0.05649574, -0.001390673, -3.307405, 0, 0, 0, 1, 1,
-0.05136281, 1.623481, -3.141821, 0, 0, 0, 1, 1,
-0.05046602, -1.178584, -2.306686, 0, 0, 0, 1, 1,
-0.04668988, 0.03305513, -1.118217, 0, 0, 0, 1, 1,
-0.04389723, -1.144325, -2.420326, 1, 1, 1, 1, 1,
-0.0431142, -1.094352, -2.337118, 1, 1, 1, 1, 1,
-0.03138208, -1.754435, -2.247847, 1, 1, 1, 1, 1,
-0.03059218, 0.05550361, -1.084025, 1, 1, 1, 1, 1,
-0.03050842, -0.9433297, -2.154205, 1, 1, 1, 1, 1,
-0.03026051, 0.4345765, 0.2064648, 1, 1, 1, 1, 1,
-0.02973335, 0.408332, 0.9126593, 1, 1, 1, 1, 1,
-0.02860859, -0.9801403, -2.57712, 1, 1, 1, 1, 1,
-0.02795634, -0.4758004, -5.028459, 1, 1, 1, 1, 1,
-0.02163739, -0.02363367, -2.790794, 1, 1, 1, 1, 1,
-0.02104035, 1.570015, 1.057923, 1, 1, 1, 1, 1,
-0.01510329, 0.04292217, -0.1394012, 1, 1, 1, 1, 1,
-0.01347056, -1.310426, -3.08197, 1, 1, 1, 1, 1,
-0.01324012, 1.012929, 1.098817, 1, 1, 1, 1, 1,
-0.01018414, -0.6695921, -2.105309, 1, 1, 1, 1, 1,
-0.009945813, -0.2045005, -3.139915, 0, 0, 1, 1, 1,
-0.002940614, -1.515422, -4.20364, 1, 0, 0, 1, 1,
-0.001541322, 0.07645822, 0.5729908, 1, 0, 0, 1, 1,
-0.00025407, 0.3392767, -0.03157634, 1, 0, 0, 1, 1,
0.007165885, -0.2724244, 2.975907, 1, 0, 0, 1, 1,
0.01030628, 0.4849873, 0.5954709, 1, 0, 0, 1, 1,
0.01268932, -0.8689088, 3.077235, 0, 0, 0, 1, 1,
0.01342601, 2.21188, -0.3551514, 0, 0, 0, 1, 1,
0.01603333, -0.01965008, 3.542094, 0, 0, 0, 1, 1,
0.01637592, -0.4247431, 0.479651, 0, 0, 0, 1, 1,
0.01659552, 2.135282, 0.6675628, 0, 0, 0, 1, 1,
0.01852989, -0.6205994, 2.62484, 0, 0, 0, 1, 1,
0.01879863, -0.9240051, 2.257988, 0, 0, 0, 1, 1,
0.0195282, 0.2680788, -0.5409004, 1, 1, 1, 1, 1,
0.02024351, 0.09188231, 0.4062834, 1, 1, 1, 1, 1,
0.02155162, 0.1855214, 1.102262, 1, 1, 1, 1, 1,
0.02347548, 0.3918715, 0.6394248, 1, 1, 1, 1, 1,
0.02570015, -0.1117931, 0.386962, 1, 1, 1, 1, 1,
0.02835154, 1.698067, 0.1713961, 1, 1, 1, 1, 1,
0.03256708, 0.1257103, 0.4563082, 1, 1, 1, 1, 1,
0.03392757, -0.45381, 2.220984, 1, 1, 1, 1, 1,
0.03483573, 1.63549, -0.9989412, 1, 1, 1, 1, 1,
0.03637462, -0.6994184, 3.186325, 1, 1, 1, 1, 1,
0.03739787, 0.246443, 0.02774657, 1, 1, 1, 1, 1,
0.04080671, 1.813284, 1.132138, 1, 1, 1, 1, 1,
0.04207352, 0.4335606, 0.7067847, 1, 1, 1, 1, 1,
0.04216211, -1.684489, 1.915788, 1, 1, 1, 1, 1,
0.04388467, 0.737729, -0.06221211, 1, 1, 1, 1, 1,
0.04445208, 0.5021085, -0.327898, 0, 0, 1, 1, 1,
0.04584913, 0.9271947, -1.204587, 1, 0, 0, 1, 1,
0.04706245, 1.452914, 0.5754548, 1, 0, 0, 1, 1,
0.05414161, -1.388542, 3.986897, 1, 0, 0, 1, 1,
0.05803064, 0.2910775, 0.369372, 1, 0, 0, 1, 1,
0.06345455, 1.064103, -1.380837, 1, 0, 0, 1, 1,
0.07163677, 2.329849, 0.948194, 0, 0, 0, 1, 1,
0.07261939, 1.14048, 0.2417742, 0, 0, 0, 1, 1,
0.07392377, -0.4409399, 1.470063, 0, 0, 0, 1, 1,
0.07737625, -0.5456293, 2.465026, 0, 0, 0, 1, 1,
0.08169962, 0.01568388, 0.3849277, 0, 0, 0, 1, 1,
0.08260368, 0.07692055, -0.021104, 0, 0, 0, 1, 1,
0.08281636, -0.2223249, 2.692862, 0, 0, 0, 1, 1,
0.09174857, 0.8521001, 0.1630181, 1, 1, 1, 1, 1,
0.09272552, -0.9602479, 2.330556, 1, 1, 1, 1, 1,
0.0932086, 1.089506, -1.079477, 1, 1, 1, 1, 1,
0.09427366, -0.1573106, 1.619988, 1, 1, 1, 1, 1,
0.0951095, 0.01008145, 0.8278258, 1, 1, 1, 1, 1,
0.09648895, -0.2711231, 2.894463, 1, 1, 1, 1, 1,
0.09929546, 2.147615, 0.3508092, 1, 1, 1, 1, 1,
0.1014399, 1.213978, 0.5808646, 1, 1, 1, 1, 1,
0.1017051, 0.003467153, 2.251944, 1, 1, 1, 1, 1,
0.1022384, 0.3211563, 1.435133, 1, 1, 1, 1, 1,
0.1031637, 0.6862702, 0.7906964, 1, 1, 1, 1, 1,
0.1062607, 1.140689, 1.593721, 1, 1, 1, 1, 1,
0.1076219, -0.9961917, 3.059488, 1, 1, 1, 1, 1,
0.1079059, 0.4709688, -0.6083558, 1, 1, 1, 1, 1,
0.1080689, 0.4198029, -0.4617104, 1, 1, 1, 1, 1,
0.1095263, 0.8960501, -0.07356042, 0, 0, 1, 1, 1,
0.1123925, -0.6187974, 4.294981, 1, 0, 0, 1, 1,
0.1133762, -1.49245, 3.423066, 1, 0, 0, 1, 1,
0.1145438, 0.6139363, -0.4082529, 1, 0, 0, 1, 1,
0.1210776, -0.6550336, 3.506984, 1, 0, 0, 1, 1,
0.1211153, 1.62154, 1.128673, 1, 0, 0, 1, 1,
0.1213953, -1.486027, 2.306653, 0, 0, 0, 1, 1,
0.1226796, -1.60358, 3.218145, 0, 0, 0, 1, 1,
0.124049, 0.4183932, -3.083216, 0, 0, 0, 1, 1,
0.1316024, -0.2323869, 3.976624, 0, 0, 0, 1, 1,
0.1322381, -1.773151, 4.721844, 0, 0, 0, 1, 1,
0.1335076, -0.6990358, 1.932287, 0, 0, 0, 1, 1,
0.1337459, -1.01424, 2.116934, 0, 0, 0, 1, 1,
0.135204, 0.04244028, 0.9065288, 1, 1, 1, 1, 1,
0.141679, -0.2461078, 2.406818, 1, 1, 1, 1, 1,
0.1434495, -0.9565278, 5.366139, 1, 1, 1, 1, 1,
0.1440715, 0.7090341, -0.2763667, 1, 1, 1, 1, 1,
0.1454578, 1.511554, 0.06314292, 1, 1, 1, 1, 1,
0.1465388, 1.344094, 1.022297, 1, 1, 1, 1, 1,
0.149667, -0.9122058, 3.601371, 1, 1, 1, 1, 1,
0.1549987, -0.3481938, 1.991365, 1, 1, 1, 1, 1,
0.1583917, -1.134707, 2.886319, 1, 1, 1, 1, 1,
0.1702676, 0.09503357, 1.047864, 1, 1, 1, 1, 1,
0.1716974, 0.8662179, -0.2902417, 1, 1, 1, 1, 1,
0.1722379, -0.394172, 3.566385, 1, 1, 1, 1, 1,
0.1756512, 2.365999, 0.905522, 1, 1, 1, 1, 1,
0.1785211, 0.5936986, -0.7926738, 1, 1, 1, 1, 1,
0.1827531, -0.02461328, 1.136057, 1, 1, 1, 1, 1,
0.1841747, -0.2463056, 3.107204, 0, 0, 1, 1, 1,
0.1871049, -0.4545823, 0.9442441, 1, 0, 0, 1, 1,
0.1907728, -0.6296027, 2.829623, 1, 0, 0, 1, 1,
0.1957141, -0.4610876, 1.994669, 1, 0, 0, 1, 1,
0.1964506, -0.3041038, 3.936603, 1, 0, 0, 1, 1,
0.2013993, -0.16093, 2.746376, 1, 0, 0, 1, 1,
0.2027664, -0.3415761, 2.489799, 0, 0, 0, 1, 1,
0.2062276, -1.488927, 2.859683, 0, 0, 0, 1, 1,
0.2155079, 0.9664527, 0.2526107, 0, 0, 0, 1, 1,
0.2167713, -0.4753332, 0.7365465, 0, 0, 0, 1, 1,
0.2168147, -0.2604799, 2.597912, 0, 0, 0, 1, 1,
0.2172569, 2.411093, -0.01332885, 0, 0, 0, 1, 1,
0.217639, 0.3820301, -0.3526612, 0, 0, 0, 1, 1,
0.2267345, -0.9209012, 2.805635, 1, 1, 1, 1, 1,
0.2289307, 0.6845833, 0.7110479, 1, 1, 1, 1, 1,
0.2295121, -0.1248014, 2.049611, 1, 1, 1, 1, 1,
0.2333055, -0.2796608, 1.839602, 1, 1, 1, 1, 1,
0.2368466, -0.1407435, 0.8787568, 1, 1, 1, 1, 1,
0.2401346, 0.8747386, 1.638568, 1, 1, 1, 1, 1,
0.2454728, 0.6589876, 0.2949475, 1, 1, 1, 1, 1,
0.2463388, 0.159082, 1.638533, 1, 1, 1, 1, 1,
0.2471603, 0.1524526, -0.3207528, 1, 1, 1, 1, 1,
0.2483465, -0.1959848, 1.673662, 1, 1, 1, 1, 1,
0.2572937, -0.7076557, 3.437379, 1, 1, 1, 1, 1,
0.2581696, 0.1548961, 0.8397833, 1, 1, 1, 1, 1,
0.258871, -0.2462366, 2.233541, 1, 1, 1, 1, 1,
0.2590637, 1.036231, -1.439971, 1, 1, 1, 1, 1,
0.2592216, -0.828021, 2.467815, 1, 1, 1, 1, 1,
0.2599213, -0.7195964, 2.819502, 0, 0, 1, 1, 1,
0.2616342, -1.575923, 0.61352, 1, 0, 0, 1, 1,
0.2657532, -0.8279458, 1.713592, 1, 0, 0, 1, 1,
0.2662152, -0.5022314, 4.721629, 1, 0, 0, 1, 1,
0.2675346, 0.2384116, 0.4799202, 1, 0, 0, 1, 1,
0.2744124, 1.085129, 1.070135, 1, 0, 0, 1, 1,
0.2848895, 1.159807, 0.8634905, 0, 0, 0, 1, 1,
0.2870196, -0.02112734, 1.976028, 0, 0, 0, 1, 1,
0.2897055, 1.25883, 0.1786653, 0, 0, 0, 1, 1,
0.2902141, 0.5304662, -0.6940551, 0, 0, 0, 1, 1,
0.2926465, -0.9069496, 3.034045, 0, 0, 0, 1, 1,
0.2931564, -0.9060648, 2.979469, 0, 0, 0, 1, 1,
0.2958842, 0.3803826, 1.810905, 0, 0, 0, 1, 1,
0.2961238, -0.2186451, 2.024364, 1, 1, 1, 1, 1,
0.2967505, 1.562335, 0.4395161, 1, 1, 1, 1, 1,
0.2985144, -1.92661, 1.13113, 1, 1, 1, 1, 1,
0.3011122, -0.4948799, 1.526237, 1, 1, 1, 1, 1,
0.3062386, -0.6419865, 2.471601, 1, 1, 1, 1, 1,
0.308891, -0.3806866, 1.454612, 1, 1, 1, 1, 1,
0.3113183, -0.09558285, 1.510486, 1, 1, 1, 1, 1,
0.3171637, 1.35689, -0.3606386, 1, 1, 1, 1, 1,
0.3172857, 0.1106722, 2.685565, 1, 1, 1, 1, 1,
0.3205217, 0.7356678, 0.7058846, 1, 1, 1, 1, 1,
0.3205777, -1.427051, 3.12262, 1, 1, 1, 1, 1,
0.3207665, -0.472397, 1.057513, 1, 1, 1, 1, 1,
0.3238027, 0.7331878, 1.037599, 1, 1, 1, 1, 1,
0.3254052, 0.3385221, 0.481661, 1, 1, 1, 1, 1,
0.3268022, 0.5957525, 1.783462, 1, 1, 1, 1, 1,
0.3284999, -1.635595, 0.9385348, 0, 0, 1, 1, 1,
0.3296828, -2.118702, 2.519286, 1, 0, 0, 1, 1,
0.3305816, 2.381868, -0.1564329, 1, 0, 0, 1, 1,
0.3374653, -0.5725425, 2.447095, 1, 0, 0, 1, 1,
0.3385635, -1.147774, 3.25684, 1, 0, 0, 1, 1,
0.3398314, 1.808028, 0.2620061, 1, 0, 0, 1, 1,
0.3419676, 0.896197, -1.281455, 0, 0, 0, 1, 1,
0.3433074, -0.4050983, 3.179406, 0, 0, 0, 1, 1,
0.345704, 0.3675899, 0.9219754, 0, 0, 0, 1, 1,
0.346489, -0.3203655, 3.212449, 0, 0, 0, 1, 1,
0.3509959, -0.8784945, 3.337597, 0, 0, 0, 1, 1,
0.3575927, -0.007267654, -0.5833603, 0, 0, 0, 1, 1,
0.3638144, 0.4805016, -0.1618966, 0, 0, 0, 1, 1,
0.3665336, 0.4775334, -0.4509535, 1, 1, 1, 1, 1,
0.3689441, 0.6651103, 1.600804, 1, 1, 1, 1, 1,
0.3736103, 0.9809688, -1.076274, 1, 1, 1, 1, 1,
0.3791907, -0.8391058, 1.082492, 1, 1, 1, 1, 1,
0.3792897, 1.376312, -0.916572, 1, 1, 1, 1, 1,
0.3802021, -1.039834, 1.170948, 1, 1, 1, 1, 1,
0.3822424, 1.067564, 0.4593906, 1, 1, 1, 1, 1,
0.3831313, -0.4762474, 1.573962, 1, 1, 1, 1, 1,
0.3839026, 0.8389999, 2.225214, 1, 1, 1, 1, 1,
0.3870254, 0.9964495, 1.056503, 1, 1, 1, 1, 1,
0.3891092, 0.1511743, 0.9431845, 1, 1, 1, 1, 1,
0.3902286, 0.2532859, 1.268713, 1, 1, 1, 1, 1,
0.3918317, 0.3967201, 2.149506, 1, 1, 1, 1, 1,
0.393034, -0.3907146, -1.035872, 1, 1, 1, 1, 1,
0.394108, 0.4140565, -1.824333, 1, 1, 1, 1, 1,
0.4008661, 0.2001679, 2.077171, 0, 0, 1, 1, 1,
0.4014576, -0.2575499, 2.161673, 1, 0, 0, 1, 1,
0.4029935, -1.244083, 3.075526, 1, 0, 0, 1, 1,
0.4039997, 0.882357, 0.1713527, 1, 0, 0, 1, 1,
0.4080572, 0.4916248, 0.1029405, 1, 0, 0, 1, 1,
0.4137267, 1.593011, 0.8547177, 1, 0, 0, 1, 1,
0.4137598, 0.2318957, 1.282815, 0, 0, 0, 1, 1,
0.4205437, 0.6382486, 0.8421367, 0, 0, 0, 1, 1,
0.4247747, 0.1798658, 1.173737, 0, 0, 0, 1, 1,
0.4253016, 0.1473993, 1.836207, 0, 0, 0, 1, 1,
0.4256161, -0.289543, 1.654603, 0, 0, 0, 1, 1,
0.4266051, -1.169466, 1.079061, 0, 0, 0, 1, 1,
0.4279813, -0.1196956, 1.03148, 0, 0, 0, 1, 1,
0.4324151, -0.9640035, 3.994713, 1, 1, 1, 1, 1,
0.4337451, 1.393691, -0.1128786, 1, 1, 1, 1, 1,
0.433956, 0.5451626, 1.822689, 1, 1, 1, 1, 1,
0.4356173, 1.51411, 1.044657, 1, 1, 1, 1, 1,
0.4401757, 1.183136, 0.6818503, 1, 1, 1, 1, 1,
0.4410004, -0.04215103, 1.88492, 1, 1, 1, 1, 1,
0.443772, -1.529323, 2.933739, 1, 1, 1, 1, 1,
0.4533191, -0.3764392, 0.8458576, 1, 1, 1, 1, 1,
0.4614701, 0.06729771, 2.063362, 1, 1, 1, 1, 1,
0.4633551, 0.02132938, 0.1404853, 1, 1, 1, 1, 1,
0.4645005, -0.167397, 2.376403, 1, 1, 1, 1, 1,
0.4677151, -2.039944, 3.25093, 1, 1, 1, 1, 1,
0.4677503, -0.2979133, 0.7077036, 1, 1, 1, 1, 1,
0.4687566, 0.6914408, 0.4142299, 1, 1, 1, 1, 1,
0.4688748, -0.4322251, 3.23016, 1, 1, 1, 1, 1,
0.4772131, 1.022503, 1.831053, 0, 0, 1, 1, 1,
0.4773871, 1.021719, 0.6568624, 1, 0, 0, 1, 1,
0.4786222, -0.03922278, 2.532679, 1, 0, 0, 1, 1,
0.482617, -0.8516136, 2.605715, 1, 0, 0, 1, 1,
0.4840525, 0.2312117, -0.1390468, 1, 0, 0, 1, 1,
0.4868663, 1.674399, -0.1736749, 1, 0, 0, 1, 1,
0.4898204, -0.573065, 2.668813, 0, 0, 0, 1, 1,
0.4928131, 0.2103119, 0.2213136, 0, 0, 0, 1, 1,
0.4997616, 0.9379789, 0.5383918, 0, 0, 0, 1, 1,
0.501428, -1.742956, 2.887202, 0, 0, 0, 1, 1,
0.502537, -2.414123, 3.469303, 0, 0, 0, 1, 1,
0.5038673, 0.3734692, -1.242872, 0, 0, 0, 1, 1,
0.5135766, -0.7259674, 3.523758, 0, 0, 0, 1, 1,
0.5152177, -1.156292, 3.832179, 1, 1, 1, 1, 1,
0.5184585, 2.587946, -0.0386997, 1, 1, 1, 1, 1,
0.5250764, 0.1510645, 1.49922, 1, 1, 1, 1, 1,
0.526529, -0.9168763, 3.839984, 1, 1, 1, 1, 1,
0.5305939, 0.1550836, 2.500987, 1, 1, 1, 1, 1,
0.5306285, 0.08501016, 1.064396, 1, 1, 1, 1, 1,
0.531137, 0.3584494, 0.3573867, 1, 1, 1, 1, 1,
0.5367336, 0.3499837, 1.463831, 1, 1, 1, 1, 1,
0.5377024, 0.403248, 0.4535144, 1, 1, 1, 1, 1,
0.5386525, 0.5171637, 2.255401, 1, 1, 1, 1, 1,
0.5411147, -0.003404957, 2.580969, 1, 1, 1, 1, 1,
0.5420781, 0.675521, -0.09458611, 1, 1, 1, 1, 1,
0.5426802, 0.5103827, -0.4423932, 1, 1, 1, 1, 1,
0.5435971, -0.7857125, 2.237941, 1, 1, 1, 1, 1,
0.5460587, 0.4287664, 1.011939, 1, 1, 1, 1, 1,
0.5470031, 0.7179354, 1.663953, 0, 0, 1, 1, 1,
0.5537251, 0.8436747, 0.3676994, 1, 0, 0, 1, 1,
0.5551236, -1.220199, 4.304908, 1, 0, 0, 1, 1,
0.5580811, 0.5219287, -0.2718368, 1, 0, 0, 1, 1,
0.5581869, -1.049065, 1.04881, 1, 0, 0, 1, 1,
0.5624272, -0.8791856, 1.113784, 1, 0, 0, 1, 1,
0.5689345, 0.05383238, 1.337799, 0, 0, 0, 1, 1,
0.5708506, -1.143278, 3.083239, 0, 0, 0, 1, 1,
0.5709783, 0.999828, 1.203374, 0, 0, 0, 1, 1,
0.5713322, -1.521312, 2.518212, 0, 0, 0, 1, 1,
0.5760248, 0.7179937, -0.009802319, 0, 0, 0, 1, 1,
0.5764105, 0.8017228, 0.3063118, 0, 0, 0, 1, 1,
0.5777937, 0.8139855, 1.208809, 0, 0, 0, 1, 1,
0.5834814, 0.8554955, -0.07954677, 1, 1, 1, 1, 1,
0.5837468, 0.1053029, 2.5017, 1, 1, 1, 1, 1,
0.5854124, 0.9868268, 0.5428084, 1, 1, 1, 1, 1,
0.5859533, -0.2912286, -1.134561, 1, 1, 1, 1, 1,
0.5877436, 2.15833, 0.882625, 1, 1, 1, 1, 1,
0.587953, 1.458129, -0.005124344, 1, 1, 1, 1, 1,
0.5910404, 0.834472, -0.658323, 1, 1, 1, 1, 1,
0.5947856, 0.7766634, 1.39251, 1, 1, 1, 1, 1,
0.5964377, 1.16948, 1.646115, 1, 1, 1, 1, 1,
0.6041284, 0.04835549, 2.638828, 1, 1, 1, 1, 1,
0.6044458, -0.7797127, 2.799169, 1, 1, 1, 1, 1,
0.6074166, -1.468352, 2.761987, 1, 1, 1, 1, 1,
0.6075389, 0.1012804, 1.223213, 1, 1, 1, 1, 1,
0.6101632, 0.4700874, 1.544715, 1, 1, 1, 1, 1,
0.6127142, -0.1305312, 2.70868, 1, 1, 1, 1, 1,
0.6222292, -1.436626, 4.515847, 0, 0, 1, 1, 1,
0.6237584, -1.633555, 3.123487, 1, 0, 0, 1, 1,
0.6262082, -1.654214, 1.285039, 1, 0, 0, 1, 1,
0.626363, -0.3382197, -0.6510475, 1, 0, 0, 1, 1,
0.6279807, 0.4210182, 1.066947, 1, 0, 0, 1, 1,
0.6286229, 0.5608117, 0.3980319, 1, 0, 0, 1, 1,
0.6295274, 0.6211464, 1.095886, 0, 0, 0, 1, 1,
0.6333469, 0.6186689, -0.719134, 0, 0, 0, 1, 1,
0.6381282, -1.66388, 3.388844, 0, 0, 0, 1, 1,
0.6469952, -0.984689, -0.4700884, 0, 0, 0, 1, 1,
0.6592435, 1.53194, 3.505997, 0, 0, 0, 1, 1,
0.6592821, -0.846666, 3.237342, 0, 0, 0, 1, 1,
0.6627419, -0.2497872, 1.425914, 0, 0, 0, 1, 1,
0.6644969, 0.05199626, 2.098249, 1, 1, 1, 1, 1,
0.664758, -0.677103, 2.008972, 1, 1, 1, 1, 1,
0.6649107, 0.09482634, -0.1066983, 1, 1, 1, 1, 1,
0.6677622, 1.44631, 0.4806076, 1, 1, 1, 1, 1,
0.6692331, -0.449941, 3.047298, 1, 1, 1, 1, 1,
0.6738552, 0.8377679, 0.5967497, 1, 1, 1, 1, 1,
0.6740385, 0.5533665, 0.4901069, 1, 1, 1, 1, 1,
0.6779841, -0.2462587, 1.543996, 1, 1, 1, 1, 1,
0.6818249, -0.007351885, 2.319911, 1, 1, 1, 1, 1,
0.6837713, -0.6089998, 4.458276, 1, 1, 1, 1, 1,
0.6895084, -0.760065, 0.5076513, 1, 1, 1, 1, 1,
0.6974419, 1.042385, 0.03215338, 1, 1, 1, 1, 1,
0.7049199, -1.374588, 2.745677, 1, 1, 1, 1, 1,
0.7110147, 1.062383, 1.480329, 1, 1, 1, 1, 1,
0.7125938, 0.6870736, 2.735202, 1, 1, 1, 1, 1,
0.72054, -0.1264254, 2.252854, 0, 0, 1, 1, 1,
0.7258477, 0.2405013, 1.218055, 1, 0, 0, 1, 1,
0.7283658, -2.125145, 4.034366, 1, 0, 0, 1, 1,
0.7326561, -1.494229, 1.056358, 1, 0, 0, 1, 1,
0.7372479, -2.095787, 2.822198, 1, 0, 0, 1, 1,
0.7405006, -0.6904165, 1.623204, 1, 0, 0, 1, 1,
0.7429593, 0.1800891, 2.617796, 0, 0, 0, 1, 1,
0.7479599, 0.7378207, 2.182315, 0, 0, 0, 1, 1,
0.7495858, -1.440711, 3.114326, 0, 0, 0, 1, 1,
0.75481, -0.4650977, 2.525847, 0, 0, 0, 1, 1,
0.7634043, 0.27558, 1.163046, 0, 0, 0, 1, 1,
0.779914, -1.369711, 1.51527, 0, 0, 0, 1, 1,
0.7805673, 2.187576, 0.5807361, 0, 0, 0, 1, 1,
0.7838471, 0.6291218, -0.1301295, 1, 1, 1, 1, 1,
0.7865649, 1.029526, 2.874533, 1, 1, 1, 1, 1,
0.7881927, -0.5877557, 1.847768, 1, 1, 1, 1, 1,
0.7947131, -0.7823651, 2.220347, 1, 1, 1, 1, 1,
0.7981657, -0.01751387, 2.553764, 1, 1, 1, 1, 1,
0.7997341, -0.1585594, 0.9132391, 1, 1, 1, 1, 1,
0.799997, 0.2974972, -0.03419513, 1, 1, 1, 1, 1,
0.8001634, -0.9236341, 2.080575, 1, 1, 1, 1, 1,
0.8026894, 1.41727, 2.057356, 1, 1, 1, 1, 1,
0.8049356, 2.476938, 1.505902, 1, 1, 1, 1, 1,
0.806976, 0.6573433, 0.2178848, 1, 1, 1, 1, 1,
0.8145854, 1.167317, -0.6346318, 1, 1, 1, 1, 1,
0.8151342, 1.119579, 0.9923781, 1, 1, 1, 1, 1,
0.8152353, 0.6311057, 3.556194, 1, 1, 1, 1, 1,
0.8157768, -0.08387174, 0.9337777, 1, 1, 1, 1, 1,
0.8157895, 0.3590115, 2.837043, 0, 0, 1, 1, 1,
0.8176388, 0.23853, 1.719538, 1, 0, 0, 1, 1,
0.8181676, 0.2843769, 0.1654609, 1, 0, 0, 1, 1,
0.8208123, -1.163005, 2.619267, 1, 0, 0, 1, 1,
0.8214986, -0.0964913, 1.76724, 1, 0, 0, 1, 1,
0.8230703, 0.3872781, 0.2670961, 1, 0, 0, 1, 1,
0.8243392, -0.761838, 2.200406, 0, 0, 0, 1, 1,
0.8288694, 0.6943405, 2.323659, 0, 0, 0, 1, 1,
0.8311344, -0.04872072, 1.489681, 0, 0, 0, 1, 1,
0.8363997, 0.4357334, 1.592431, 0, 0, 0, 1, 1,
0.8406003, 0.4120955, 1.49439, 0, 0, 0, 1, 1,
0.8420408, 1.448386, 0.6411387, 0, 0, 0, 1, 1,
0.8549158, 0.06771284, 2.00391, 0, 0, 0, 1, 1,
0.8567395, 1.097491, 1.294281, 1, 1, 1, 1, 1,
0.8593435, 0.9022819, -0.9697697, 1, 1, 1, 1, 1,
0.8637298, -1.246861, 2.792793, 1, 1, 1, 1, 1,
0.8661246, 1.003136, -0.1889143, 1, 1, 1, 1, 1,
0.8683436, 1.329163, 0.0707371, 1, 1, 1, 1, 1,
0.8690879, 0.4963598, 1.427197, 1, 1, 1, 1, 1,
0.874997, -2.541714, 2.062525, 1, 1, 1, 1, 1,
0.8789482, 0.6867056, 0.04377988, 1, 1, 1, 1, 1,
0.879855, -0.2543977, 4.010938, 1, 1, 1, 1, 1,
0.894556, -0.4217708, 2.160587, 1, 1, 1, 1, 1,
0.8970283, 0.2355929, -0.7885862, 1, 1, 1, 1, 1,
0.8983684, 1.168334, -1.237904, 1, 1, 1, 1, 1,
0.9002015, 3.304234, 0.9349555, 1, 1, 1, 1, 1,
0.9113176, 1.075886, 0.4452201, 1, 1, 1, 1, 1,
0.9157376, -0.01108099, 0.1710734, 1, 1, 1, 1, 1,
0.9171646, 3.372207, -1.890209, 0, 0, 1, 1, 1,
0.9217957, 1.547278, 0.3116996, 1, 0, 0, 1, 1,
0.9219345, -1.114944, 3.065389, 1, 0, 0, 1, 1,
0.9235415, 2.324051, -0.1208521, 1, 0, 0, 1, 1,
0.9298461, -1.977881, 3.648936, 1, 0, 0, 1, 1,
0.9408061, 0.2678581, -0.004672835, 1, 0, 0, 1, 1,
0.9410257, 1.472571, -0.03792202, 0, 0, 0, 1, 1,
0.9477553, -1.103291, 1.562685, 0, 0, 0, 1, 1,
0.947827, -0.6059994, 2.83586, 0, 0, 0, 1, 1,
0.9583715, 0.3662448, 0.6122527, 0, 0, 0, 1, 1,
0.9589483, -0.5165075, 2.983935, 0, 0, 0, 1, 1,
0.9671708, -0.02701212, 1.608844, 0, 0, 0, 1, 1,
0.9709806, -2.008881, 2.301073, 0, 0, 0, 1, 1,
0.9749756, 1.056831, 2.623504, 1, 1, 1, 1, 1,
0.978156, -0.176487, 2.073651, 1, 1, 1, 1, 1,
0.9790529, 0.4599358, -1.310788, 1, 1, 1, 1, 1,
0.9802196, -0.3906049, 2.463339, 1, 1, 1, 1, 1,
0.9807829, 1.821972, 0.9674188, 1, 1, 1, 1, 1,
0.993085, -0.944046, 3.482564, 1, 1, 1, 1, 1,
1.002088, -1.728771, 1.10678, 1, 1, 1, 1, 1,
1.00979, 0.9597874, 0.4756046, 1, 1, 1, 1, 1,
1.014241, 1.367142, 1.361969, 1, 1, 1, 1, 1,
1.018938, -1.536678, 2.000083, 1, 1, 1, 1, 1,
1.019656, -1.066717, 2.307802, 1, 1, 1, 1, 1,
1.019907, 1.17455, 2.191282, 1, 1, 1, 1, 1,
1.026521, -0.6516653, 1.937221, 1, 1, 1, 1, 1,
1.029424, -0.3169132, 1.5029, 1, 1, 1, 1, 1,
1.03071, 0.6860843, -0.1878711, 1, 1, 1, 1, 1,
1.045701, -0.1845203, 4.459644, 0, 0, 1, 1, 1,
1.04841, -0.8916934, 2.712803, 1, 0, 0, 1, 1,
1.054206, -0.07447335, 1.427667, 1, 0, 0, 1, 1,
1.055073, -0.7613425, 2.306028, 1, 0, 0, 1, 1,
1.056442, 0.6897894, 0.6931664, 1, 0, 0, 1, 1,
1.056468, 0.1190445, 1.80914, 1, 0, 0, 1, 1,
1.061291, -1.003102, 2.466618, 0, 0, 0, 1, 1,
1.068566, 0.05862393, 1.952728, 0, 0, 0, 1, 1,
1.069239, 0.7809271, 0.2800874, 0, 0, 0, 1, 1,
1.069961, 0.7574923, 1.855432, 0, 0, 0, 1, 1,
1.076596, 1.116322, 1.652245, 0, 0, 0, 1, 1,
1.088971, -1.093518, 3.050822, 0, 0, 0, 1, 1,
1.089417, -1.772071, 3.002468, 0, 0, 0, 1, 1,
1.102946, 0.1549864, 2.080648, 1, 1, 1, 1, 1,
1.104588, 0.2600732, 1.834558, 1, 1, 1, 1, 1,
1.106825, 0.5590397, 0.2628728, 1, 1, 1, 1, 1,
1.12623, -1.310149, 2.002193, 1, 1, 1, 1, 1,
1.13173, -0.4064092, 1.646941, 1, 1, 1, 1, 1,
1.133077, 1.735547, 0.3059446, 1, 1, 1, 1, 1,
1.138081, -0.09076777, 1.20901, 1, 1, 1, 1, 1,
1.142491, 0.229325, 2.111572, 1, 1, 1, 1, 1,
1.148978, -0.152596, 2.607092, 1, 1, 1, 1, 1,
1.156673, -0.9648275, 2.860326, 1, 1, 1, 1, 1,
1.166242, 1.129144, 0.6474267, 1, 1, 1, 1, 1,
1.170929, -0.6513792, 0.4361474, 1, 1, 1, 1, 1,
1.180421, 0.836638, 2.227607, 1, 1, 1, 1, 1,
1.18446, -0.4354617, 3.213477, 1, 1, 1, 1, 1,
1.196378, 0.1836165, 2.07179, 1, 1, 1, 1, 1,
1.198164, 0.2474447, 0.5311987, 0, 0, 1, 1, 1,
1.216281, 0.1931118, 1.553045, 1, 0, 0, 1, 1,
1.218636, -0.6464465, 3.51421, 1, 0, 0, 1, 1,
1.228971, 0.9302938, -0.7768434, 1, 0, 0, 1, 1,
1.230685, -0.2887507, 1.883244, 1, 0, 0, 1, 1,
1.235477, 1.538689, 0.03413424, 1, 0, 0, 1, 1,
1.237682, 1.014521, 0.6529607, 0, 0, 0, 1, 1,
1.240524, -0.1115062, 0.2882193, 0, 0, 0, 1, 1,
1.249259, 0.7945543, 0.05110432, 0, 0, 0, 1, 1,
1.249274, -1.1386, 1.565131, 0, 0, 0, 1, 1,
1.249707, 0.4035529, 1.373102, 0, 0, 0, 1, 1,
1.2606, -1.239125, 2.558245, 0, 0, 0, 1, 1,
1.261266, -0.4914206, 1.340851, 0, 0, 0, 1, 1,
1.265146, 0.3166978, 0.7591242, 1, 1, 1, 1, 1,
1.269916, 0.6874655, 1.14488, 1, 1, 1, 1, 1,
1.270395, -0.04284838, -0.6082653, 1, 1, 1, 1, 1,
1.274254, -0.6699619, 1.746531, 1, 1, 1, 1, 1,
1.296719, 0.1563553, 0.9533627, 1, 1, 1, 1, 1,
1.304633, 1.305989, 0.1694536, 1, 1, 1, 1, 1,
1.313542, -2.255099, 4.836019, 1, 1, 1, 1, 1,
1.314891, -2.536479, 0.956565, 1, 1, 1, 1, 1,
1.31741, -1.930442, 3.579242, 1, 1, 1, 1, 1,
1.319273, 0.05553284, 1.111027, 1, 1, 1, 1, 1,
1.321954, -0.1229561, 2.257387, 1, 1, 1, 1, 1,
1.328666, 0.6140757, 0.8522536, 1, 1, 1, 1, 1,
1.333948, -0.6663015, 2.145824, 1, 1, 1, 1, 1,
1.34662, 0.3042003, 1.898427, 1, 1, 1, 1, 1,
1.349979, -0.02355532, 1.889113, 1, 1, 1, 1, 1,
1.366565, 0.02021448, 1.742143, 0, 0, 1, 1, 1,
1.368377, 0.2427902, 2.186155, 1, 0, 0, 1, 1,
1.368656, 0.1662037, 1.609235, 1, 0, 0, 1, 1,
1.373399, -1.109892, 3.539381, 1, 0, 0, 1, 1,
1.384341, -1.484975, 2.063824, 1, 0, 0, 1, 1,
1.393667, 0.6692562, 2.508007, 1, 0, 0, 1, 1,
1.396931, 0.07191251, 1.086003, 0, 0, 0, 1, 1,
1.397014, 0.01108772, 0.8239859, 0, 0, 0, 1, 1,
1.39716, -0.3689099, 2.665119, 0, 0, 0, 1, 1,
1.401648, 1.403757, 1.665103, 0, 0, 0, 1, 1,
1.407859, 0.9452058, 1.429186, 0, 0, 0, 1, 1,
1.415191, 0.1316912, 1.711704, 0, 0, 0, 1, 1,
1.435585, 0.07106719, -0.3854306, 0, 0, 0, 1, 1,
1.46354, 0.6895467, 0.2087902, 1, 1, 1, 1, 1,
1.469096, 1.994048, 1.430261, 1, 1, 1, 1, 1,
1.482375, -0.4734395, 0.03834039, 1, 1, 1, 1, 1,
1.483655, -0.894107, 1.724187, 1, 1, 1, 1, 1,
1.492126, -0.09369867, 1.004994, 1, 1, 1, 1, 1,
1.492321, -0.8844019, 2.114512, 1, 1, 1, 1, 1,
1.515377, -0.4349848, 2.912614, 1, 1, 1, 1, 1,
1.525627, -0.4634776, 2.755127, 1, 1, 1, 1, 1,
1.556459, -0.4683391, 2.698439, 1, 1, 1, 1, 1,
1.564184, 0.1911251, 0.4429173, 1, 1, 1, 1, 1,
1.567076, -0.350906, 0.4094795, 1, 1, 1, 1, 1,
1.604023, 1.653946, 1.468303, 1, 1, 1, 1, 1,
1.612537, -0.8145549, 2.974856, 1, 1, 1, 1, 1,
1.621235, 0.4509776, 2.664605, 1, 1, 1, 1, 1,
1.631546, -0.4457859, 3.608803, 1, 1, 1, 1, 1,
1.644133, 0.009268973, 0.403853, 0, 0, 1, 1, 1,
1.657754, 0.5953106, 0.8995103, 1, 0, 0, 1, 1,
1.668296, 1.71799, 0.5388519, 1, 0, 0, 1, 1,
1.694355, 0.4184714, 1.56516, 1, 0, 0, 1, 1,
1.699196, -0.5137815, 1.868293, 1, 0, 0, 1, 1,
1.710206, 0.765262, 2.089186, 1, 0, 0, 1, 1,
1.72314, 1.490794, 0.05289077, 0, 0, 0, 1, 1,
1.732486, -1.141304, 1.417828, 0, 0, 0, 1, 1,
1.738439, -0.4507398, 2.756104, 0, 0, 0, 1, 1,
1.74466, -0.008152275, 1.899576, 0, 0, 0, 1, 1,
1.754042, 0.06467184, -0.1525294, 0, 0, 0, 1, 1,
1.754078, -0.8588296, 4.240127, 0, 0, 0, 1, 1,
1.75699, -0.4179945, 1.920039, 0, 0, 0, 1, 1,
1.789487, -0.3674355, 3.079207, 1, 1, 1, 1, 1,
1.809438, 1.634034, 0.9197083, 1, 1, 1, 1, 1,
1.81125, -0.4878252, 1.276569, 1, 1, 1, 1, 1,
1.82426, -0.1530357, 1.232488, 1, 1, 1, 1, 1,
1.856225, -0.01963133, 2.501171, 1, 1, 1, 1, 1,
1.867813, -1.265222, 0.04869885, 1, 1, 1, 1, 1,
1.894548, 0.1555536, 1.407489, 1, 1, 1, 1, 1,
1.910129, 0.3531881, 2.214044, 1, 1, 1, 1, 1,
1.911523, 0.007708631, 0.6876401, 1, 1, 1, 1, 1,
1.917713, 1.919835, -2.259094, 1, 1, 1, 1, 1,
1.919072, 0.55968, 1.924864, 1, 1, 1, 1, 1,
1.919294, 1.949836, 0.3824206, 1, 1, 1, 1, 1,
1.927654, -1.030521, 1.674874, 1, 1, 1, 1, 1,
1.937238, -0.5434101, 2.7792, 1, 1, 1, 1, 1,
1.937933, 0.5058591, -0.3941417, 1, 1, 1, 1, 1,
1.942317, -0.6313944, 3.086093, 0, 0, 1, 1, 1,
1.94759, 1.921897, 2.078864, 1, 0, 0, 1, 1,
1.962433, -0.120605, -0.1733145, 1, 0, 0, 1, 1,
1.964884, 0.6266044, 3.083505, 1, 0, 0, 1, 1,
2.019784, -0.4629124, 0.8055802, 1, 0, 0, 1, 1,
2.046659, 0.5788957, 1.080773, 1, 0, 0, 1, 1,
2.050054, -0.97849, 2.259099, 0, 0, 0, 1, 1,
2.07879, 0.4343336, 2.484475, 0, 0, 0, 1, 1,
2.121826, 0.01112913, 2.966174, 0, 0, 0, 1, 1,
2.12847, -2.064327, 3.555875, 0, 0, 0, 1, 1,
2.12871, 0.002755972, 0.6134578, 0, 0, 0, 1, 1,
2.160116, -0.9159358, 2.504941, 0, 0, 0, 1, 1,
2.189483, -0.8640475, 2.6943, 0, 0, 0, 1, 1,
2.198755, 0.8055314, 2.091936, 1, 1, 1, 1, 1,
2.437749, 0.04599122, 2.771344, 1, 1, 1, 1, 1,
2.551123, -1.627254, 1.24063, 1, 1, 1, 1, 1,
2.615538, -0.7924218, 0.1730228, 1, 1, 1, 1, 1,
2.789174, -0.6902702, -0.5837092, 1, 1, 1, 1, 1,
2.970353, 1.382301, 1.515936, 1, 1, 1, 1, 1,
3.33584, 0.1062662, 1.845854, 1, 1, 1, 1, 1
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
var radius = 9.618478;
var distance = 33.7845;
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
mvMatrix.translate( -0.2976263, 0.1722636, -0.08128476 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.7845);
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