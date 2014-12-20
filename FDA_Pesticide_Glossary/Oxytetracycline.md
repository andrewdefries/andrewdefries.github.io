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
-3.193862, 0.05178822, -1.314426, 1, 0, 0, 1,
-2.7349, 0.2142642, 0.2563583, 1, 0.007843138, 0, 1,
-2.55513, -0.08202336, -1.23072, 1, 0.01176471, 0, 1,
-2.527244, -0.8160675, -0.1640243, 1, 0.01960784, 0, 1,
-2.524836, -0.6341056, -1.907377, 1, 0.02352941, 0, 1,
-2.511359, -0.2389968, -1.808281, 1, 0.03137255, 0, 1,
-2.419533, 0.06375694, -1.307721, 1, 0.03529412, 0, 1,
-2.406536, -0.4681681, -2.748716, 1, 0.04313726, 0, 1,
-2.369688, -0.8889298, -1.861, 1, 0.04705882, 0, 1,
-2.295555, 1.754444, -0.5557531, 1, 0.05490196, 0, 1,
-2.265904, 0.08706793, -2.478889, 1, 0.05882353, 0, 1,
-2.232823, 0.002489488, -2.502902, 1, 0.06666667, 0, 1,
-2.215112, -0.8759604, -2.877797, 1, 0.07058824, 0, 1,
-2.178543, -0.4241412, -2.805967, 1, 0.07843138, 0, 1,
-2.159111, -0.5558885, -2.55678, 1, 0.08235294, 0, 1,
-2.158701, -1.401744, -1.355463, 1, 0.09019608, 0, 1,
-2.156367, -1.029846, -2.10031, 1, 0.09411765, 0, 1,
-2.145832, 1.933624, -0.6567238, 1, 0.1019608, 0, 1,
-2.143277, 0.3508111, -0.1021025, 1, 0.1098039, 0, 1,
-2.102922, -0.7878243, 0.4571243, 1, 0.1137255, 0, 1,
-2.089481, 1.412867, -1.220361, 1, 0.1215686, 0, 1,
-2.089175, 0.1051533, -2.516405, 1, 0.1254902, 0, 1,
-2.080403, 0.6865082, -3.131885, 1, 0.1333333, 0, 1,
-2.042225, 1.929251, -1.139599, 1, 0.1372549, 0, 1,
-2.039339, -1.606283, -3.970383, 1, 0.145098, 0, 1,
-2.023651, -0.4146661, -1.143562, 1, 0.1490196, 0, 1,
-1.978001, 0.9229517, 2.134419, 1, 0.1568628, 0, 1,
-1.923454, -0.9237083, -2.403745, 1, 0.1607843, 0, 1,
-1.923426, 0.1413569, -2.320516, 1, 0.1686275, 0, 1,
-1.900733, 0.4776509, -1.198216, 1, 0.172549, 0, 1,
-1.889449, 0.8017797, 0.3721429, 1, 0.1803922, 0, 1,
-1.886387, 1.841476, -0.09651972, 1, 0.1843137, 0, 1,
-1.870566, -0.6792757, -2.157327, 1, 0.1921569, 0, 1,
-1.869417, 0.5652186, -1.109245, 1, 0.1960784, 0, 1,
-1.857625, -0.04266702, -1.490919, 1, 0.2039216, 0, 1,
-1.825899, 0.1760409, -1.598611, 1, 0.2117647, 0, 1,
-1.813503, 0.488419, -2.527526, 1, 0.2156863, 0, 1,
-1.795532, -1.274274, -4.571988, 1, 0.2235294, 0, 1,
-1.79449, 0.8905731, 0.04482118, 1, 0.227451, 0, 1,
-1.778982, 1.569196, -0.128319, 1, 0.2352941, 0, 1,
-1.760684, -0.4999274, -1.372895, 1, 0.2392157, 0, 1,
-1.729899, 1.744944, -1.552442, 1, 0.2470588, 0, 1,
-1.709013, -0.1603744, -2.634263, 1, 0.2509804, 0, 1,
-1.706633, -0.3871884, -0.771513, 1, 0.2588235, 0, 1,
-1.702366, 0.1207188, -2.008495, 1, 0.2627451, 0, 1,
-1.69807, 0.9900131, -2.337664, 1, 0.2705882, 0, 1,
-1.671867, -0.1133213, -3.622858, 1, 0.2745098, 0, 1,
-1.656149, 0.4656751, 0.0707273, 1, 0.282353, 0, 1,
-1.630074, 0.5716565, 0.2698063, 1, 0.2862745, 0, 1,
-1.62383, -0.04426025, -2.433122, 1, 0.2941177, 0, 1,
-1.613528, 0.7574468, -0.2247811, 1, 0.3019608, 0, 1,
-1.611459, 0.09257884, -1.391418, 1, 0.3058824, 0, 1,
-1.603786, -0.3416318, -3.196801, 1, 0.3137255, 0, 1,
-1.600631, -1.393744, -3.09416, 1, 0.3176471, 0, 1,
-1.593823, 1.265017, -0.1480636, 1, 0.3254902, 0, 1,
-1.5849, -0.12107, -1.655223, 1, 0.3294118, 0, 1,
-1.581865, 1.718027, -0.2278983, 1, 0.3372549, 0, 1,
-1.568324, -1.155533, -2.564615, 1, 0.3411765, 0, 1,
-1.545088, -0.1076393, -1.884419, 1, 0.3490196, 0, 1,
-1.535452, -0.2945924, -2.566116, 1, 0.3529412, 0, 1,
-1.525257, 0.7683167, -1.391386, 1, 0.3607843, 0, 1,
-1.515504, 0.7553768, -1.161184, 1, 0.3647059, 0, 1,
-1.511645, -0.2151844, -2.481927, 1, 0.372549, 0, 1,
-1.504377, -0.6213503, -3.257113, 1, 0.3764706, 0, 1,
-1.486881, -0.5474046, -1.197727, 1, 0.3843137, 0, 1,
-1.48568, 1.125749, -0.9647714, 1, 0.3882353, 0, 1,
-1.477098, 0.3481517, -2.114564, 1, 0.3960784, 0, 1,
-1.471254, -0.7124767, -4.00341, 1, 0.4039216, 0, 1,
-1.46846, -0.9009771, -1.407663, 1, 0.4078431, 0, 1,
-1.460004, -1.440075, -3.295352, 1, 0.4156863, 0, 1,
-1.459898, -0.2196164, -2.560116, 1, 0.4196078, 0, 1,
-1.456454, -2.58498, -1.99594, 1, 0.427451, 0, 1,
-1.435225, 0.6872073, 0.07634441, 1, 0.4313726, 0, 1,
-1.433054, -0.9646907, -2.648277, 1, 0.4392157, 0, 1,
-1.432993, 0.128599, -1.260306, 1, 0.4431373, 0, 1,
-1.424765, 1.15263, 0.322268, 1, 0.4509804, 0, 1,
-1.42381, 0.2451225, -1.57299, 1, 0.454902, 0, 1,
-1.415167, 1.329489, -0.458243, 1, 0.4627451, 0, 1,
-1.408506, -0.3395531, -0.26815, 1, 0.4666667, 0, 1,
-1.407015, 1.107305, -0.05762692, 1, 0.4745098, 0, 1,
-1.403755, 0.5213459, 0.3198237, 1, 0.4784314, 0, 1,
-1.40247, -3.119182, -2.403207, 1, 0.4862745, 0, 1,
-1.402109, -1.098503, -3.118143, 1, 0.4901961, 0, 1,
-1.385172, -0.4437123, -1.473699, 1, 0.4980392, 0, 1,
-1.382911, -0.3225624, 0.236752, 1, 0.5058824, 0, 1,
-1.380156, 1.805199, 0.9675853, 1, 0.509804, 0, 1,
-1.372661, 0.05862957, -3.07601, 1, 0.5176471, 0, 1,
-1.370241, 1.927507, -0.7549786, 1, 0.5215687, 0, 1,
-1.355464, -0.404034, -1.08298, 1, 0.5294118, 0, 1,
-1.346142, -1.439304, -4.156492, 1, 0.5333334, 0, 1,
-1.325708, -0.3857939, -1.925342, 1, 0.5411765, 0, 1,
-1.325628, -0.01942593, -2.969613, 1, 0.5450981, 0, 1,
-1.311824, 0.803683, -0.589147, 1, 0.5529412, 0, 1,
-1.307092, 1.258676, -1.451749, 1, 0.5568628, 0, 1,
-1.303131, 0.4128597, -1.413511, 1, 0.5647059, 0, 1,
-1.302201, -1.193033, -1.888443, 1, 0.5686275, 0, 1,
-1.295286, 0.3119909, -2.293563, 1, 0.5764706, 0, 1,
-1.294413, 0.1791104, -1.943931, 1, 0.5803922, 0, 1,
-1.294119, 0.5227723, 0.1248259, 1, 0.5882353, 0, 1,
-1.29237, 0.6649923, -1.78896, 1, 0.5921569, 0, 1,
-1.292126, -2.431548, -2.549591, 1, 0.6, 0, 1,
-1.285976, -0.8849947, -0.4360485, 1, 0.6078432, 0, 1,
-1.281333, -0.3961139, -1.006897, 1, 0.6117647, 0, 1,
-1.278526, 0.4333093, -0.8687079, 1, 0.6196079, 0, 1,
-1.274908, -1.1152, -2.835302, 1, 0.6235294, 0, 1,
-1.268765, 1.263631, 1.147631, 1, 0.6313726, 0, 1,
-1.265603, -0.8717808, -1.454217, 1, 0.6352941, 0, 1,
-1.258773, 0.831465, -1.434476, 1, 0.6431373, 0, 1,
-1.258485, -0.6015843, -1.392554, 1, 0.6470588, 0, 1,
-1.247207, 0.06295768, 0.5248869, 1, 0.654902, 0, 1,
-1.235343, 0.4535212, -3.0829, 1, 0.6588235, 0, 1,
-1.224244, 0.4527243, -0.1338275, 1, 0.6666667, 0, 1,
-1.223906, -0.4415287, -1.898976, 1, 0.6705883, 0, 1,
-1.22151, 0.01379323, 0.6664883, 1, 0.6784314, 0, 1,
-1.210566, -0.1728907, -1.314154, 1, 0.682353, 0, 1,
-1.207052, -0.8394208, -1.588327, 1, 0.6901961, 0, 1,
-1.20323, 1.394709, -0.2860792, 1, 0.6941177, 0, 1,
-1.199148, -0.7663771, -3.437468, 1, 0.7019608, 0, 1,
-1.198937, 0.8006772, -1.967501, 1, 0.7098039, 0, 1,
-1.189659, -0.5323849, -1.18737, 1, 0.7137255, 0, 1,
-1.186237, 0.2674799, -1.156197, 1, 0.7215686, 0, 1,
-1.186119, -0.3382155, -2.017281, 1, 0.7254902, 0, 1,
-1.18353, 1.103835, -1.386675, 1, 0.7333333, 0, 1,
-1.174156, 0.8693731, -1.728041, 1, 0.7372549, 0, 1,
-1.171161, -1.063367, -2.717451, 1, 0.7450981, 0, 1,
-1.168593, -1.362834, -2.77717, 1, 0.7490196, 0, 1,
-1.16399, -0.08566513, -2.126343, 1, 0.7568628, 0, 1,
-1.163638, -0.8482139, -2.119701, 1, 0.7607843, 0, 1,
-1.163102, -0.3522127, -3.166297, 1, 0.7686275, 0, 1,
-1.162746, -1.50254, 0.2216362, 1, 0.772549, 0, 1,
-1.158037, 0.3538705, -1.10182, 1, 0.7803922, 0, 1,
-1.157818, 0.3120974, -4.068433, 1, 0.7843137, 0, 1,
-1.155861, 2.277102, -1.297608, 1, 0.7921569, 0, 1,
-1.147858, -0.08288142, -2.81414, 1, 0.7960784, 0, 1,
-1.141083, -0.4805471, -2.327975, 1, 0.8039216, 0, 1,
-1.13991, 1.024276, 0.256623, 1, 0.8117647, 0, 1,
-1.138162, 0.1689203, -2.349977, 1, 0.8156863, 0, 1,
-1.134599, 0.6616891, -0.9940641, 1, 0.8235294, 0, 1,
-1.132786, 0.8195565, -0.1488771, 1, 0.827451, 0, 1,
-1.130124, 1.156484, -2.394418, 1, 0.8352941, 0, 1,
-1.122565, -0.2622795, -2.184757, 1, 0.8392157, 0, 1,
-1.120503, -0.855762, -1.49008, 1, 0.8470588, 0, 1,
-1.120397, 0.7288976, -0.810689, 1, 0.8509804, 0, 1,
-1.119553, -1.760422, -3.720116, 1, 0.8588235, 0, 1,
-1.109833, -0.08843824, -2.831561, 1, 0.8627451, 0, 1,
-1.107399, 0.2262721, -2.329384, 1, 0.8705882, 0, 1,
-1.107101, -0.8416445, -2.558952, 1, 0.8745098, 0, 1,
-1.09558, -1.841335, -2.19934, 1, 0.8823529, 0, 1,
-1.094283, -0.1816084, -1.094162, 1, 0.8862745, 0, 1,
-1.091955, -0.8496136, -3.086173, 1, 0.8941177, 0, 1,
-1.087493, 0.2110009, -2.306323, 1, 0.8980392, 0, 1,
-1.086404, 0.7617059, 0.2703485, 1, 0.9058824, 0, 1,
-1.083607, 0.2563951, -2.042548, 1, 0.9137255, 0, 1,
-1.083148, 1.040985, -1.451921, 1, 0.9176471, 0, 1,
-1.07575, -0.9388928, -3.409805, 1, 0.9254902, 0, 1,
-1.072943, -0.5876995, -1.526755, 1, 0.9294118, 0, 1,
-1.072759, 0.9518335, 0.05977273, 1, 0.9372549, 0, 1,
-1.070808, 0.3621406, -1.976037, 1, 0.9411765, 0, 1,
-1.070765, -0.8132619, -2.113252, 1, 0.9490196, 0, 1,
-1.070651, -0.1239117, -4.373249, 1, 0.9529412, 0, 1,
-1.069411, 0.954915, 0.2178039, 1, 0.9607843, 0, 1,
-1.067419, -0.6898808, -1.903509, 1, 0.9647059, 0, 1,
-1.066891, 0.33003, -1.228582, 1, 0.972549, 0, 1,
-1.059273, 0.9726697, -1.524094, 1, 0.9764706, 0, 1,
-1.056676, -0.3889748, -1.918397, 1, 0.9843137, 0, 1,
-1.053311, -0.09469953, 0.2024343, 1, 0.9882353, 0, 1,
-1.041459, 0.03014332, -2.924243, 1, 0.9960784, 0, 1,
-1.040509, -0.1663644, -2.401331, 0.9960784, 1, 0, 1,
-1.035886, -1.709221, -1.985378, 0.9921569, 1, 0, 1,
-1.022376, 0.4978888, -1.119861, 0.9843137, 1, 0, 1,
-1.014097, 1.090465, 0.5348533, 0.9803922, 1, 0, 1,
-1.012179, -0.6206726, -4.555743, 0.972549, 1, 0, 1,
-1.009377, 2.195796, 0.8276475, 0.9686275, 1, 0, 1,
-1.009077, -1.487549, -1.111305, 0.9607843, 1, 0, 1,
-1.003258, 0.9966305, 0.2609538, 0.9568627, 1, 0, 1,
-1.003129, -0.657903, -2.039661, 0.9490196, 1, 0, 1,
-1.001252, 0.1114343, -2.537077, 0.945098, 1, 0, 1,
-0.9984773, 0.6490498, -1.278264, 0.9372549, 1, 0, 1,
-0.9959837, -1.230075, -2.970395, 0.9333333, 1, 0, 1,
-0.9906039, 0.2287343, -1.451881, 0.9254902, 1, 0, 1,
-0.9905259, 0.07389193, -0.8073635, 0.9215686, 1, 0, 1,
-0.9872954, 1.796033, -0.7627938, 0.9137255, 1, 0, 1,
-0.9844977, 0.1462678, -2.940351, 0.9098039, 1, 0, 1,
-0.9814608, 1.352785, -0.3968, 0.9019608, 1, 0, 1,
-0.9770957, 1.205961, -2.585645, 0.8941177, 1, 0, 1,
-0.9721968, -1.312636, -3.180026, 0.8901961, 1, 0, 1,
-0.9721654, -0.1563221, -1.758846, 0.8823529, 1, 0, 1,
-0.9718599, 1.029679, -1.222491, 0.8784314, 1, 0, 1,
-0.9593351, -0.1465617, -2.612875, 0.8705882, 1, 0, 1,
-0.9578812, 0.7669304, 1.517307, 0.8666667, 1, 0, 1,
-0.9572299, 0.6434056, -0.4373537, 0.8588235, 1, 0, 1,
-0.9565066, 0.445276, -1.107511, 0.854902, 1, 0, 1,
-0.9525779, 0.6725143, 0.4420909, 0.8470588, 1, 0, 1,
-0.9435978, 1.227965, -2.031949, 0.8431373, 1, 0, 1,
-0.9424451, 1.310763, -1.136875, 0.8352941, 1, 0, 1,
-0.9417437, 0.5745783, -2.489096, 0.8313726, 1, 0, 1,
-0.941283, -1.76394, -3.183867, 0.8235294, 1, 0, 1,
-0.9325811, -1.392295, -4.165329, 0.8196079, 1, 0, 1,
-0.9171633, -0.2034838, -2.104623, 0.8117647, 1, 0, 1,
-0.9095196, 0.3671418, -0.1116072, 0.8078431, 1, 0, 1,
-0.9093856, 0.1337414, -1.482013, 0.8, 1, 0, 1,
-0.9043781, -1.402393, -4.852323, 0.7921569, 1, 0, 1,
-0.9015762, 1.300381, -2.323942, 0.7882353, 1, 0, 1,
-0.8986953, 0.1017699, -2.377314, 0.7803922, 1, 0, 1,
-0.8905566, -0.8331549, -2.911252, 0.7764706, 1, 0, 1,
-0.8879525, -1.159636, -2.730529, 0.7686275, 1, 0, 1,
-0.8735813, -0.3382107, -3.808896, 0.7647059, 1, 0, 1,
-0.8680981, 0.2035198, -0.05281914, 0.7568628, 1, 0, 1,
-0.8668838, 0.03594996, -0.4803383, 0.7529412, 1, 0, 1,
-0.8662285, -0.4748392, -1.971768, 0.7450981, 1, 0, 1,
-0.8604627, 0.472602, -0.4199216, 0.7411765, 1, 0, 1,
-0.8558558, 0.0632684, -3.002383, 0.7333333, 1, 0, 1,
-0.854571, -0.4329284, -3.395468, 0.7294118, 1, 0, 1,
-0.8524768, -1.075548, -2.486494, 0.7215686, 1, 0, 1,
-0.8505241, -0.4551499, -2.782018, 0.7176471, 1, 0, 1,
-0.8392102, 0.107994, -2.104607, 0.7098039, 1, 0, 1,
-0.8377909, -0.1324617, -0.6740031, 0.7058824, 1, 0, 1,
-0.8377115, 0.5585852, -1.484804, 0.6980392, 1, 0, 1,
-0.8253749, -0.2150992, -2.017817, 0.6901961, 1, 0, 1,
-0.8188193, 1.895231, -0.1045667, 0.6862745, 1, 0, 1,
-0.8172109, 0.263408, -1.838566, 0.6784314, 1, 0, 1,
-0.8165458, 1.610864, 0.1791635, 0.6745098, 1, 0, 1,
-0.8155173, 0.8781188, -2.235799, 0.6666667, 1, 0, 1,
-0.8150147, -0.8147622, -1.916948, 0.6627451, 1, 0, 1,
-0.8140643, 1.78863, -2.04647, 0.654902, 1, 0, 1,
-0.811413, 0.2793485, -1.230179, 0.6509804, 1, 0, 1,
-0.8093954, 0.952594, -2.027953, 0.6431373, 1, 0, 1,
-0.8083907, -0.9352153, -1.362592, 0.6392157, 1, 0, 1,
-0.8059955, 1.86828, 0.3251506, 0.6313726, 1, 0, 1,
-0.7982476, 1.211607, -2.049082, 0.627451, 1, 0, 1,
-0.7976968, 0.6978979, -0.806335, 0.6196079, 1, 0, 1,
-0.7971866, 1.689855, -1.965453, 0.6156863, 1, 0, 1,
-0.7905999, 0.1852011, -1.254146, 0.6078432, 1, 0, 1,
-0.7898588, 0.6089801, -0.7239816, 0.6039216, 1, 0, 1,
-0.78962, -0.5787993, -2.751448, 0.5960785, 1, 0, 1,
-0.7879479, 0.5455232, 0.4540824, 0.5882353, 1, 0, 1,
-0.7860633, -0.656883, -1.022246, 0.5843138, 1, 0, 1,
-0.784808, -1.755919, -1.534247, 0.5764706, 1, 0, 1,
-0.7780204, 0.6060312, -0.9267521, 0.572549, 1, 0, 1,
-0.776444, 0.5573069, -1.779838, 0.5647059, 1, 0, 1,
-0.7760496, -0.4324475, -2.033633, 0.5607843, 1, 0, 1,
-0.7733091, -0.1989234, 0.008072741, 0.5529412, 1, 0, 1,
-0.7696336, 1.131989, 0.09814565, 0.5490196, 1, 0, 1,
-0.768281, 0.607235, -1.506438, 0.5411765, 1, 0, 1,
-0.7610965, 0.865644, -0.7372533, 0.5372549, 1, 0, 1,
-0.7544906, 0.2977452, -2.324938, 0.5294118, 1, 0, 1,
-0.7463769, 0.7336496, -0.4688658, 0.5254902, 1, 0, 1,
-0.7264802, 0.4037773, -0.574199, 0.5176471, 1, 0, 1,
-0.7204875, -1.104722, -3.286975, 0.5137255, 1, 0, 1,
-0.7189234, -1.311139, -3.453685, 0.5058824, 1, 0, 1,
-0.7170743, -1.533633, -2.40169, 0.5019608, 1, 0, 1,
-0.7131938, 0.2481569, -0.4417261, 0.4941176, 1, 0, 1,
-0.7131383, -0.3209463, -3.283321, 0.4862745, 1, 0, 1,
-0.7109787, -0.9252051, -1.471032, 0.4823529, 1, 0, 1,
-0.7057425, 0.7309718, -0.552812, 0.4745098, 1, 0, 1,
-0.7035685, -0.7280757, -2.80987, 0.4705882, 1, 0, 1,
-0.7019579, -0.5391022, -1.792507, 0.4627451, 1, 0, 1,
-0.7008864, -2.062498, -1.985398, 0.4588235, 1, 0, 1,
-0.6991923, -0.6431947, -1.334328, 0.4509804, 1, 0, 1,
-0.6971995, -1.562712, -2.890553, 0.4470588, 1, 0, 1,
-0.693913, 0.03536421, -1.932107, 0.4392157, 1, 0, 1,
-0.6929283, 0.3074494, -0.9011366, 0.4352941, 1, 0, 1,
-0.688142, -0.1979285, -3.321284, 0.427451, 1, 0, 1,
-0.6881077, 0.1755309, -0.08512115, 0.4235294, 1, 0, 1,
-0.6873652, -0.489301, -1.711872, 0.4156863, 1, 0, 1,
-0.6862082, -0.1582504, -0.6534739, 0.4117647, 1, 0, 1,
-0.6834486, -0.8468956, -2.84833, 0.4039216, 1, 0, 1,
-0.6798304, -0.5985049, -2.8852, 0.3960784, 1, 0, 1,
-0.6736578, 0.2677009, 0.08970582, 0.3921569, 1, 0, 1,
-0.6725466, -0.1257174, -2.195057, 0.3843137, 1, 0, 1,
-0.6717867, 1.750054, -1.09967, 0.3803922, 1, 0, 1,
-0.6672649, -0.01164969, -0.5375568, 0.372549, 1, 0, 1,
-0.6578208, -1.112918, -3.025004, 0.3686275, 1, 0, 1,
-0.6555828, 1.062857, -0.03634152, 0.3607843, 1, 0, 1,
-0.6525265, 0.6752755, -2.018708, 0.3568628, 1, 0, 1,
-0.6508029, 0.5911869, -1.334098, 0.3490196, 1, 0, 1,
-0.6500024, -0.7779178, -2.536726, 0.345098, 1, 0, 1,
-0.6435816, -0.7520767, -2.269464, 0.3372549, 1, 0, 1,
-0.6415237, 1.107839, -1.205515, 0.3333333, 1, 0, 1,
-0.6404155, -1.679313, -4.782277, 0.3254902, 1, 0, 1,
-0.63909, 1.803674, -0.0175049, 0.3215686, 1, 0, 1,
-0.6382163, -0.7449853, -3.092401, 0.3137255, 1, 0, 1,
-0.6366609, -1.053167, -3.588039, 0.3098039, 1, 0, 1,
-0.6311934, -0.02122276, -1.96463, 0.3019608, 1, 0, 1,
-0.626307, -0.5125523, -2.270952, 0.2941177, 1, 0, 1,
-0.624633, 0.8208486, -2.318948, 0.2901961, 1, 0, 1,
-0.6199323, 2.24197, 0.4383338, 0.282353, 1, 0, 1,
-0.6187557, 0.05210621, -0.671721, 0.2784314, 1, 0, 1,
-0.6129072, 0.2896082, -0.5365194, 0.2705882, 1, 0, 1,
-0.6100798, 0.402379, 0.09756167, 0.2666667, 1, 0, 1,
-0.6047879, -1.132886, -3.173027, 0.2588235, 1, 0, 1,
-0.5951052, 0.1451981, -1.762565, 0.254902, 1, 0, 1,
-0.5905519, -1.409074, -3.877093, 0.2470588, 1, 0, 1,
-0.5852106, -0.161396, -2.415731, 0.2431373, 1, 0, 1,
-0.5807425, 0.3224349, -0.9832242, 0.2352941, 1, 0, 1,
-0.5797134, -1.411875, -2.036499, 0.2313726, 1, 0, 1,
-0.5690632, 1.851609, 1.755663, 0.2235294, 1, 0, 1,
-0.5671753, -0.3905717, -2.931957, 0.2196078, 1, 0, 1,
-0.5653436, -1.357476, -2.490884, 0.2117647, 1, 0, 1,
-0.564393, 1.13563, -0.7045646, 0.2078431, 1, 0, 1,
-0.5641493, -1.278663, -3.16675, 0.2, 1, 0, 1,
-0.5443959, -1.462477, -2.791746, 0.1921569, 1, 0, 1,
-0.5390363, 0.1092633, -1.035865, 0.1882353, 1, 0, 1,
-0.5373555, -0.928785, -0.6179636, 0.1803922, 1, 0, 1,
-0.5336621, -1.245769, -1.470343, 0.1764706, 1, 0, 1,
-0.5323061, 0.9827784, -1.421744, 0.1686275, 1, 0, 1,
-0.5312641, -0.4821483, -2.552772, 0.1647059, 1, 0, 1,
-0.5279243, 1.173582, 2.008449, 0.1568628, 1, 0, 1,
-0.5266138, -0.9924235, -0.4516835, 0.1529412, 1, 0, 1,
-0.5265363, 0.1748946, -0.4121993, 0.145098, 1, 0, 1,
-0.5250123, -0.02536009, -1.893752, 0.1411765, 1, 0, 1,
-0.5232228, 0.681739, -0.03143841, 0.1333333, 1, 0, 1,
-0.5157458, -0.6075233, -2.505548, 0.1294118, 1, 0, 1,
-0.5156116, 0.08022166, -1.492467, 0.1215686, 1, 0, 1,
-0.5081297, 0.7198886, 0.2297135, 0.1176471, 1, 0, 1,
-0.5040684, -1.574465, -1.779578, 0.1098039, 1, 0, 1,
-0.5014006, 0.467017, 0.8360279, 0.1058824, 1, 0, 1,
-0.5012552, 0.4699534, -0.1271085, 0.09803922, 1, 0, 1,
-0.497968, -0.4714819, -1.110859, 0.09019608, 1, 0, 1,
-0.4978633, 2.167769, -0.7058546, 0.08627451, 1, 0, 1,
-0.4946395, 0.9666988, -0.4403887, 0.07843138, 1, 0, 1,
-0.4936124, -1.53557, -1.51626, 0.07450981, 1, 0, 1,
-0.4921421, -0.8625222, -2.691678, 0.06666667, 1, 0, 1,
-0.4893577, 2.059162, 0.02146584, 0.0627451, 1, 0, 1,
-0.4882144, 1.270082, -2.108613, 0.05490196, 1, 0, 1,
-0.4861019, -1.513176, -1.732102, 0.05098039, 1, 0, 1,
-0.4766198, -0.2287176, -2.653273, 0.04313726, 1, 0, 1,
-0.4726893, 1.121028, 0.2134834, 0.03921569, 1, 0, 1,
-0.4632483, -0.1506163, -3.241505, 0.03137255, 1, 0, 1,
-0.4626475, -0.8185476, -1.031397, 0.02745098, 1, 0, 1,
-0.4580474, 0.1362115, -0.5544107, 0.01960784, 1, 0, 1,
-0.4564458, 0.6092519, -0.8585294, 0.01568628, 1, 0, 1,
-0.4515935, -0.1344859, -2.553483, 0.007843138, 1, 0, 1,
-0.4489858, -0.03464222, -1.037504, 0.003921569, 1, 0, 1,
-0.448935, 0.05583326, -1.905897, 0, 1, 0.003921569, 1,
-0.4489007, 0.9335427, -2.624164, 0, 1, 0.01176471, 1,
-0.4488171, 1.807427, -0.063094, 0, 1, 0.01568628, 1,
-0.448038, 1.222533, 0.6850564, 0, 1, 0.02352941, 1,
-0.4460326, -1.107959, -2.526068, 0, 1, 0.02745098, 1,
-0.4420431, -0.5392873, -2.866255, 0, 1, 0.03529412, 1,
-0.4416171, 0.5620557, -0.1193366, 0, 1, 0.03921569, 1,
-0.4414139, 0.1068982, -0.5890452, 0, 1, 0.04705882, 1,
-0.4350569, 0.4189494, -0.00416027, 0, 1, 0.05098039, 1,
-0.4304127, 0.2184531, -0.3982783, 0, 1, 0.05882353, 1,
-0.4271945, 1.286926, -0.3883301, 0, 1, 0.0627451, 1,
-0.4229544, 0.470703, -2.121723, 0, 1, 0.07058824, 1,
-0.4212801, 0.1917111, -0.9280048, 0, 1, 0.07450981, 1,
-0.4177339, 0.9659236, -2.040532, 0, 1, 0.08235294, 1,
-0.4161145, -1.032274, -3.798612, 0, 1, 0.08627451, 1,
-0.4156635, 1.757774, 0.3847025, 0, 1, 0.09411765, 1,
-0.414653, -1.592049, -3.095079, 0, 1, 0.1019608, 1,
-0.4099663, 0.6747115, -2.767918, 0, 1, 0.1058824, 1,
-0.4071998, -2.124396, -2.661358, 0, 1, 0.1137255, 1,
-0.4050627, 1.567914, -1.434325, 0, 1, 0.1176471, 1,
-0.397903, 0.2123632, -1.330927, 0, 1, 0.1254902, 1,
-0.3951322, -1.851032, -2.904893, 0, 1, 0.1294118, 1,
-0.3926049, -0.02928013, -2.054576, 0, 1, 0.1372549, 1,
-0.3915086, 0.004386853, -0.9641029, 0, 1, 0.1411765, 1,
-0.3868558, 2.06573, 0.3587855, 0, 1, 0.1490196, 1,
-0.3858965, -0.4747634, -3.295757, 0, 1, 0.1529412, 1,
-0.3825921, -1.195479, -3.551522, 0, 1, 0.1607843, 1,
-0.3795013, 0.9991897, 0.9638759, 0, 1, 0.1647059, 1,
-0.3744958, 0.8306091, -0.4671173, 0, 1, 0.172549, 1,
-0.3744607, 0.2001866, -1.314566, 0, 1, 0.1764706, 1,
-0.3732416, -0.5434788, -2.022926, 0, 1, 0.1843137, 1,
-0.3689146, -1.405142, -3.147652, 0, 1, 0.1882353, 1,
-0.3664449, -2.379672, -3.865786, 0, 1, 0.1960784, 1,
-0.3622783, -1.076998, -2.563225, 0, 1, 0.2039216, 1,
-0.3612294, -0.001023698, -1.542765, 0, 1, 0.2078431, 1,
-0.3594266, 1.124785, -1.200888, 0, 1, 0.2156863, 1,
-0.3592504, 1.091122, -0.2347784, 0, 1, 0.2196078, 1,
-0.3558082, -0.6742564, -3.156272, 0, 1, 0.227451, 1,
-0.353785, -0.810851, -3.835221, 0, 1, 0.2313726, 1,
-0.3494394, -0.09741932, -0.9072438, 0, 1, 0.2392157, 1,
-0.3450748, 0.7483763, -0.5880717, 0, 1, 0.2431373, 1,
-0.3445417, 1.013829, -0.4584015, 0, 1, 0.2509804, 1,
-0.3426753, -0.331739, -2.655567, 0, 1, 0.254902, 1,
-0.3425359, -0.9942482, -2.787792, 0, 1, 0.2627451, 1,
-0.3382607, -0.07002846, 0.1330071, 0, 1, 0.2666667, 1,
-0.3372894, -1.552603, -5.588469, 0, 1, 0.2745098, 1,
-0.3345221, -1.329051, -2.978425, 0, 1, 0.2784314, 1,
-0.331914, -0.07851916, -2.161335, 0, 1, 0.2862745, 1,
-0.3295715, 1.034264, -0.3932292, 0, 1, 0.2901961, 1,
-0.3294795, 1.701051, -1.809832, 0, 1, 0.2980392, 1,
-0.3282688, 1.06613, -0.2201428, 0, 1, 0.3058824, 1,
-0.3268171, 0.9596624, -1.969164, 0, 1, 0.3098039, 1,
-0.3264015, 1.895063, -0.469501, 0, 1, 0.3176471, 1,
-0.3249205, 1.025215, -0.1290445, 0, 1, 0.3215686, 1,
-0.3206765, 0.4892595, -0.8187572, 0, 1, 0.3294118, 1,
-0.3199887, 0.8849034, -2.932226, 0, 1, 0.3333333, 1,
-0.3184358, -0.2699059, -2.878711, 0, 1, 0.3411765, 1,
-0.3171694, -0.2237684, -3.22121, 0, 1, 0.345098, 1,
-0.3170931, -0.6804579, -2.048989, 0, 1, 0.3529412, 1,
-0.3133737, -0.6993302, -3.69166, 0, 1, 0.3568628, 1,
-0.3120201, -2.144183, -4.038658, 0, 1, 0.3647059, 1,
-0.3085685, -0.03394339, -0.2200885, 0, 1, 0.3686275, 1,
-0.3047329, -0.6248294, -2.724986, 0, 1, 0.3764706, 1,
-0.303774, 0.2342067, -1.183625, 0, 1, 0.3803922, 1,
-0.3021164, -0.6688237, -2.749449, 0, 1, 0.3882353, 1,
-0.2931752, -0.03579538, -1.97372, 0, 1, 0.3921569, 1,
-0.2930109, 1.335641, -1.893796, 0, 1, 0.4, 1,
-0.2924813, 0.9176046, 1.34146, 0, 1, 0.4078431, 1,
-0.2922952, 1.323575, -1.46482, 0, 1, 0.4117647, 1,
-0.2836968, 0.4162534, -1.560009, 0, 1, 0.4196078, 1,
-0.270884, 0.5539593, 0.6031563, 0, 1, 0.4235294, 1,
-0.2680582, -1.06786, -2.693038, 0, 1, 0.4313726, 1,
-0.267487, 0.6325758, 1.052544, 0, 1, 0.4352941, 1,
-0.2604597, -1.504579, -4.760403, 0, 1, 0.4431373, 1,
-0.2578567, 0.5740243, -1.05148, 0, 1, 0.4470588, 1,
-0.2513261, -0.7910581, -3.872639, 0, 1, 0.454902, 1,
-0.2507667, -0.7712955, -3.597898, 0, 1, 0.4588235, 1,
-0.2507418, -0.8285315, -3.231937, 0, 1, 0.4666667, 1,
-0.2483777, 0.03535796, -2.006544, 0, 1, 0.4705882, 1,
-0.2426055, -0.9653839, -3.422777, 0, 1, 0.4784314, 1,
-0.2417856, 2.469996, 1.494224, 0, 1, 0.4823529, 1,
-0.2393378, -0.6538609, -3.386309, 0, 1, 0.4901961, 1,
-0.2390361, 0.1730978, -0.3627211, 0, 1, 0.4941176, 1,
-0.2389624, -0.001500307, 0.2808198, 0, 1, 0.5019608, 1,
-0.2377489, -1.094677, -3.19897, 0, 1, 0.509804, 1,
-0.2335575, 1.038686, -1.15651, 0, 1, 0.5137255, 1,
-0.2333537, 0.7581474, -0.6645434, 0, 1, 0.5215687, 1,
-0.2285583, 0.4550067, -2.091751, 0, 1, 0.5254902, 1,
-0.2265247, 0.2594042, -0.1816388, 0, 1, 0.5333334, 1,
-0.2218285, 1.644469, -0.2115379, 0, 1, 0.5372549, 1,
-0.2113755, 1.528436, -0.04911468, 0, 1, 0.5450981, 1,
-0.2093738, -1.336587, -3.013541, 0, 1, 0.5490196, 1,
-0.2069181, -0.5941165, -4.548502, 0, 1, 0.5568628, 1,
-0.20659, -0.3055102, -3.003894, 0, 1, 0.5607843, 1,
-0.200733, -1.18838, -3.512088, 0, 1, 0.5686275, 1,
-0.1995248, 0.5172637, -1.159021, 0, 1, 0.572549, 1,
-0.1899427, -1.721847, -3.132335, 0, 1, 0.5803922, 1,
-0.1888214, 0.5876728, 0.6656064, 0, 1, 0.5843138, 1,
-0.1862358, -0.1756897, -0.6020542, 0, 1, 0.5921569, 1,
-0.1843865, -0.3526439, -0.346718, 0, 1, 0.5960785, 1,
-0.1815573, -0.02735313, -2.004933, 0, 1, 0.6039216, 1,
-0.1776836, -0.5565014, -3.502284, 0, 1, 0.6117647, 1,
-0.1755108, -0.3515433, -3.575932, 0, 1, 0.6156863, 1,
-0.1713315, -0.1319621, -2.948719, 0, 1, 0.6235294, 1,
-0.1712697, -0.871911, -1.182922, 0, 1, 0.627451, 1,
-0.1698374, 0.654577, -0.7109393, 0, 1, 0.6352941, 1,
-0.168685, 0.02144349, -0.2023649, 0, 1, 0.6392157, 1,
-0.167079, -0.09088062, -1.556809, 0, 1, 0.6470588, 1,
-0.1626138, 1.402637, 0.6534524, 0, 1, 0.6509804, 1,
-0.1624058, -1.177395, -2.31446, 0, 1, 0.6588235, 1,
-0.1602577, 1.556883, 1.481601, 0, 1, 0.6627451, 1,
-0.1582922, -0.2477459, -2.748782, 0, 1, 0.6705883, 1,
-0.1579577, -0.05537513, -1.836617, 0, 1, 0.6745098, 1,
-0.1570396, -0.3704982, -2.553871, 0, 1, 0.682353, 1,
-0.1562364, 0.5458866, 1.119025, 0, 1, 0.6862745, 1,
-0.1554247, 0.3120153, -0.02273685, 0, 1, 0.6941177, 1,
-0.1531039, 1.655437, 2.180582, 0, 1, 0.7019608, 1,
-0.1530428, 0.3187105, -0.9931798, 0, 1, 0.7058824, 1,
-0.1510069, -1.288013, -5.146362, 0, 1, 0.7137255, 1,
-0.1496028, -1.43507, -3.892148, 0, 1, 0.7176471, 1,
-0.1494799, 1.38206, 0.1534647, 0, 1, 0.7254902, 1,
-0.1490452, 0.2542849, -0.2195608, 0, 1, 0.7294118, 1,
-0.1489453, 1.11078, -0.6572182, 0, 1, 0.7372549, 1,
-0.1488201, -0.8126697, -3.468942, 0, 1, 0.7411765, 1,
-0.1439043, -0.2349935, -2.571171, 0, 1, 0.7490196, 1,
-0.1433924, -0.5621752, -2.210455, 0, 1, 0.7529412, 1,
-0.1430056, 1.658882, -0.8053043, 0, 1, 0.7607843, 1,
-0.1421308, -0.1141505, -2.098546, 0, 1, 0.7647059, 1,
-0.1419973, -0.6676432, -2.857869, 0, 1, 0.772549, 1,
-0.1418959, -0.2093019, -3.938501, 0, 1, 0.7764706, 1,
-0.1394914, -0.7898654, -1.479095, 0, 1, 0.7843137, 1,
-0.1381705, -2.51798, -4.211152, 0, 1, 0.7882353, 1,
-0.1322161, 0.4182419, 0.1937342, 0, 1, 0.7960784, 1,
-0.1308048, -0.5888079, -2.578197, 0, 1, 0.8039216, 1,
-0.1222079, 0.7153145, 0.6830153, 0, 1, 0.8078431, 1,
-0.1200385, -0.233402, -2.440315, 0, 1, 0.8156863, 1,
-0.1139656, 0.7539384, -0.150632, 0, 1, 0.8196079, 1,
-0.1138261, -1.291429, -1.631521, 0, 1, 0.827451, 1,
-0.1138121, -0.7074617, -2.165045, 0, 1, 0.8313726, 1,
-0.1006324, -0.5966842, -2.742992, 0, 1, 0.8392157, 1,
-0.1001891, -0.4435475, -3.0393, 0, 1, 0.8431373, 1,
-0.09833775, 0.07692405, -0.1801657, 0, 1, 0.8509804, 1,
-0.09354775, -2.14133, -4.014737, 0, 1, 0.854902, 1,
-0.09256244, -0.3405848, -2.386867, 0, 1, 0.8627451, 1,
-0.08506005, 0.8222814, 0.1589957, 0, 1, 0.8666667, 1,
-0.08296663, -0.9086416, -4.021019, 0, 1, 0.8745098, 1,
-0.07990928, 0.08472758, -0.3888982, 0, 1, 0.8784314, 1,
-0.07679876, -0.9179645, -1.774577, 0, 1, 0.8862745, 1,
-0.07624762, 1.610625, 1.368005, 0, 1, 0.8901961, 1,
-0.06706005, -0.4092492, -3.45055, 0, 1, 0.8980392, 1,
-0.06319516, -1.04511, -2.071897, 0, 1, 0.9058824, 1,
-0.06255092, 2.527569, 0.04577537, 0, 1, 0.9098039, 1,
-0.05579939, -0.1446155, -4.879611, 0, 1, 0.9176471, 1,
-0.05444128, 0.6168841, -0.8199062, 0, 1, 0.9215686, 1,
-0.05431172, 0.5993122, -0.03465522, 0, 1, 0.9294118, 1,
-0.04798174, -1.422869, -1.592888, 0, 1, 0.9333333, 1,
-0.04704644, -0.2304581, -3.284849, 0, 1, 0.9411765, 1,
-0.04526004, 0.707625, 1.816761, 0, 1, 0.945098, 1,
-0.04479125, 0.608581, -0.09112464, 0, 1, 0.9529412, 1,
-0.03018871, 0.9580267, 1.575469, 0, 1, 0.9568627, 1,
-0.02935542, -1.366127, -1.238572, 0, 1, 0.9647059, 1,
-0.02504658, 0.8779738, 0.3278016, 0, 1, 0.9686275, 1,
-0.02271188, 0.2500858, 0.33054, 0, 1, 0.9764706, 1,
-0.02265803, -0.4496795, -4.223682, 0, 1, 0.9803922, 1,
-0.02043202, -0.5179855, -3.087281, 0, 1, 0.9882353, 1,
-0.01296636, -1.480532, -3.134113, 0, 1, 0.9921569, 1,
-0.0128274, -0.4937999, -0.6292979, 0, 1, 1, 1,
-0.01265193, 0.8743345, -0.6947268, 0, 0.9921569, 1, 1,
-0.001502762, 0.691582, 0.762516, 0, 0.9882353, 1, 1,
0.001322443, 1.127032, -1.103849, 0, 0.9803922, 1, 1,
0.006369441, 0.7343524, -0.7894117, 0, 0.9764706, 1, 1,
0.008395752, 0.665852, 0.1329972, 0, 0.9686275, 1, 1,
0.01426276, 1.396134, -1.225191, 0, 0.9647059, 1, 1,
0.02382527, -0.8252838, 3.025617, 0, 0.9568627, 1, 1,
0.03181342, 0.1607928, 0.7144279, 0, 0.9529412, 1, 1,
0.03366897, -0.9861003, 4.297647, 0, 0.945098, 1, 1,
0.04296242, 1.067343, -2.141119, 0, 0.9411765, 1, 1,
0.04319425, -2.316772, 4.985211, 0, 0.9333333, 1, 1,
0.04348383, -0.7655217, 3.842279, 0, 0.9294118, 1, 1,
0.05123154, -1.195837, 5.023182, 0, 0.9215686, 1, 1,
0.05497434, 0.6587964, 2.550815, 0, 0.9176471, 1, 1,
0.05924904, -0.4538987, 2.537821, 0, 0.9098039, 1, 1,
0.0609387, -1.988691, 4.338153, 0, 0.9058824, 1, 1,
0.0612695, 0.02834751, 1.651068, 0, 0.8980392, 1, 1,
0.06161055, -0.2413832, 3.360571, 0, 0.8901961, 1, 1,
0.0617521, 0.0218191, 1.662099, 0, 0.8862745, 1, 1,
0.06685937, 0.7990742, -0.120156, 0, 0.8784314, 1, 1,
0.06831194, 0.9299049, -1.107848, 0, 0.8745098, 1, 1,
0.07592481, 1.534764, -1.287865, 0, 0.8666667, 1, 1,
0.07618038, 1.695962, 0.4031801, 0, 0.8627451, 1, 1,
0.07673415, -0.1983443, 1.818495, 0, 0.854902, 1, 1,
0.07923901, -0.94091, 4.042159, 0, 0.8509804, 1, 1,
0.08270457, -0.5534685, 3.626867, 0, 0.8431373, 1, 1,
0.08513688, -1.141032, 1.346301, 0, 0.8392157, 1, 1,
0.09063652, -0.1518801, 0.6708262, 0, 0.8313726, 1, 1,
0.09085448, -2.250136, 4.223953, 0, 0.827451, 1, 1,
0.09172002, 0.4711367, -0.9163083, 0, 0.8196079, 1, 1,
0.09684187, -0.3352656, 2.56624, 0, 0.8156863, 1, 1,
0.09825013, 0.9758725, 2.668942, 0, 0.8078431, 1, 1,
0.09922581, -0.3926146, 2.567271, 0, 0.8039216, 1, 1,
0.1017927, -0.3673694, 2.982658, 0, 0.7960784, 1, 1,
0.1052043, -1.129164, 2.434056, 0, 0.7882353, 1, 1,
0.1105103, 0.2008292, 0.5203615, 0, 0.7843137, 1, 1,
0.1105652, 0.1062574, 0.9194126, 0, 0.7764706, 1, 1,
0.1111466, 0.9847251, -1.47399, 0, 0.772549, 1, 1,
0.1135165, 0.8123586, -0.2146948, 0, 0.7647059, 1, 1,
0.1140456, 0.38019, -0.4446109, 0, 0.7607843, 1, 1,
0.1142547, 1.038141, 0.2488541, 0, 0.7529412, 1, 1,
0.1159448, 1.838242, -1.185618, 0, 0.7490196, 1, 1,
0.1178782, 1.164774, -0.3681103, 0, 0.7411765, 1, 1,
0.1182811, -1.166545, 3.410533, 0, 0.7372549, 1, 1,
0.120293, 0.8625627, -0.4060509, 0, 0.7294118, 1, 1,
0.12682, -1.167979, 3.083169, 0, 0.7254902, 1, 1,
0.1270708, -0.9171711, 2.679057, 0, 0.7176471, 1, 1,
0.1278366, 0.2509411, 1.377194, 0, 0.7137255, 1, 1,
0.1291881, 0.1310674, -0.08457683, 0, 0.7058824, 1, 1,
0.1317887, -2.060544, 2.200511, 0, 0.6980392, 1, 1,
0.1335547, -1.076035, 4.065274, 0, 0.6941177, 1, 1,
0.1342678, -1.233266, 3.399456, 0, 0.6862745, 1, 1,
0.1370169, -0.6544102, 3.756481, 0, 0.682353, 1, 1,
0.1376359, -0.2757114, 5.366837, 0, 0.6745098, 1, 1,
0.1396601, -0.3923531, 1.541985, 0, 0.6705883, 1, 1,
0.1396713, 0.8469337, 0.8669514, 0, 0.6627451, 1, 1,
0.1404795, 0.3532758, 2.226275, 0, 0.6588235, 1, 1,
0.1410172, -0.4669468, 0.3313287, 0, 0.6509804, 1, 1,
0.142649, -0.4335447, 1.331153, 0, 0.6470588, 1, 1,
0.1435595, -0.9376172, 1.328976, 0, 0.6392157, 1, 1,
0.1496838, 1.31582, 1.630865, 0, 0.6352941, 1, 1,
0.1505071, -1.13948, 2.553016, 0, 0.627451, 1, 1,
0.1516398, -1.769701, 3.282164, 0, 0.6235294, 1, 1,
0.1519229, 0.03289269, 0.8015038, 0, 0.6156863, 1, 1,
0.1538341, -0.1325872, 0.7602255, 0, 0.6117647, 1, 1,
0.1546401, -0.2015656, 2.369668, 0, 0.6039216, 1, 1,
0.1571714, 0.8459505, -1.96199, 0, 0.5960785, 1, 1,
0.1578029, 1.66929, 0.7418752, 0, 0.5921569, 1, 1,
0.1602961, 0.3645608, 0.3884526, 0, 0.5843138, 1, 1,
0.162525, -1.736342, 2.7451, 0, 0.5803922, 1, 1,
0.1658411, 0.1140159, 1.623192, 0, 0.572549, 1, 1,
0.1682635, -0.7052128, 4.400563, 0, 0.5686275, 1, 1,
0.1689886, 0.1947322, 2.438622, 0, 0.5607843, 1, 1,
0.1693774, 0.1070175, -0.2805085, 0, 0.5568628, 1, 1,
0.1700034, 0.4093812, 1.137628, 0, 0.5490196, 1, 1,
0.1702152, 0.3481334, -1.358843, 0, 0.5450981, 1, 1,
0.1722962, -0.5509889, 3.357648, 0, 0.5372549, 1, 1,
0.1730687, -1.598819, 1.938976, 0, 0.5333334, 1, 1,
0.1742982, 0.2453731, -0.4736965, 0, 0.5254902, 1, 1,
0.176769, 0.1544128, 1.557616, 0, 0.5215687, 1, 1,
0.1775221, 1.304295, 0.6379284, 0, 0.5137255, 1, 1,
0.1794075, -0.6317182, 1.377694, 0, 0.509804, 1, 1,
0.1817989, -0.5366103, 2.934241, 0, 0.5019608, 1, 1,
0.1842558, 1.165394, 1.502696, 0, 0.4941176, 1, 1,
0.1920894, -1.184131, 2.420561, 0, 0.4901961, 1, 1,
0.1927942, 1.858798, 0.06008094, 0, 0.4823529, 1, 1,
0.1965709, 0.1503232, 0.8341798, 0, 0.4784314, 1, 1,
0.1979991, 0.4324858, 1.128769, 0, 0.4705882, 1, 1,
0.2074836, -0.09157673, -0.1458588, 0, 0.4666667, 1, 1,
0.2121947, -0.6996096, 2.49786, 0, 0.4588235, 1, 1,
0.2203241, 0.2733626, 0.4044428, 0, 0.454902, 1, 1,
0.2267769, -0.1820906, 1.624551, 0, 0.4470588, 1, 1,
0.2294981, 0.636262, 1.034801, 0, 0.4431373, 1, 1,
0.2342479, 0.8437799, 0.4343243, 0, 0.4352941, 1, 1,
0.2407654, -1.026516, 2.902862, 0, 0.4313726, 1, 1,
0.2408196, 0.470659, 0.01455769, 0, 0.4235294, 1, 1,
0.2424441, -2.064193, 4.41711, 0, 0.4196078, 1, 1,
0.2460634, 1.511764, -0.1249554, 0, 0.4117647, 1, 1,
0.2511215, 2.451816, -0.7470007, 0, 0.4078431, 1, 1,
0.2515314, 0.1361967, 1.408533, 0, 0.4, 1, 1,
0.2522102, -0.4033255, 2.343646, 0, 0.3921569, 1, 1,
0.25445, 0.2282322, 0.6259759, 0, 0.3882353, 1, 1,
0.2555074, 1.150173, -0.1006532, 0, 0.3803922, 1, 1,
0.2564494, 0.3926151, 0.5348912, 0, 0.3764706, 1, 1,
0.2588434, -1.310696, 3.780589, 0, 0.3686275, 1, 1,
0.2598572, -1.116111, 3.1373, 0, 0.3647059, 1, 1,
0.2609636, 0.08963911, 0.9237055, 0, 0.3568628, 1, 1,
0.2613855, 0.1898185, 0.048488, 0, 0.3529412, 1, 1,
0.2620794, 1.757675, -1.049656, 0, 0.345098, 1, 1,
0.2659449, 2.258509, -2.08802, 0, 0.3411765, 1, 1,
0.2721108, -1.023665, 0.5990799, 0, 0.3333333, 1, 1,
0.2733265, 1.358242, -0.2788999, 0, 0.3294118, 1, 1,
0.2750421, 0.9027785, 0.144816, 0, 0.3215686, 1, 1,
0.2838953, 1.150779, 0.8544189, 0, 0.3176471, 1, 1,
0.2871446, 0.4358267, -1.123254, 0, 0.3098039, 1, 1,
0.2943052, -1.574765, 4.863992, 0, 0.3058824, 1, 1,
0.2970249, -2.095852, 3.447717, 0, 0.2980392, 1, 1,
0.2981076, -1.134373, 3.97858, 0, 0.2901961, 1, 1,
0.3000154, -1.244527, 2.013761, 0, 0.2862745, 1, 1,
0.301876, 0.6126541, 1.092068, 0, 0.2784314, 1, 1,
0.3208374, -0.7617157, 1.722864, 0, 0.2745098, 1, 1,
0.3219899, -0.2522546, 3.031334, 0, 0.2666667, 1, 1,
0.3223863, 0.1618511, 3.11957, 0, 0.2627451, 1, 1,
0.3238501, -0.0219279, 0.821272, 0, 0.254902, 1, 1,
0.3249875, 0.2122211, -0.2996476, 0, 0.2509804, 1, 1,
0.3263597, -1.477119, 2.362456, 0, 0.2431373, 1, 1,
0.3271506, -1.87539, 3.622283, 0, 0.2392157, 1, 1,
0.330834, 0.6009203, 0.6635728, 0, 0.2313726, 1, 1,
0.3314418, 1.241176, 0.6725607, 0, 0.227451, 1, 1,
0.3340264, -0.4032502, 3.993868, 0, 0.2196078, 1, 1,
0.3342391, -1.842272, 4.676675, 0, 0.2156863, 1, 1,
0.3378103, 0.694118, 1.571151, 0, 0.2078431, 1, 1,
0.3410442, 1.840761, -1.289444, 0, 0.2039216, 1, 1,
0.3453891, 0.5810423, 0.3714525, 0, 0.1960784, 1, 1,
0.3497196, 0.7707442, 0.3667692, 0, 0.1882353, 1, 1,
0.3521044, -0.5769397, 2.292746, 0, 0.1843137, 1, 1,
0.3522485, -0.8312097, 3.226546, 0, 0.1764706, 1, 1,
0.3651148, 0.828265, -0.03757266, 0, 0.172549, 1, 1,
0.3674986, -0.9706699, 2.090847, 0, 0.1647059, 1, 1,
0.3703868, -0.6524995, 2.307569, 0, 0.1607843, 1, 1,
0.3713208, -0.9471276, 2.845504, 0, 0.1529412, 1, 1,
0.3724726, 0.08936663, -0.4443586, 0, 0.1490196, 1, 1,
0.3751435, 0.2851556, 0.9987298, 0, 0.1411765, 1, 1,
0.3780261, -0.9430987, 2.870818, 0, 0.1372549, 1, 1,
0.3807886, -0.85256, 2.556339, 0, 0.1294118, 1, 1,
0.3822169, 0.3465005, -0.1232122, 0, 0.1254902, 1, 1,
0.3823756, -0.8976801, 2.248118, 0, 0.1176471, 1, 1,
0.3844087, -1.742088, 2.637001, 0, 0.1137255, 1, 1,
0.3871506, -0.3604534, 2.112064, 0, 0.1058824, 1, 1,
0.390302, -0.8057722, 3.718015, 0, 0.09803922, 1, 1,
0.3918313, 0.7813746, 0.1632342, 0, 0.09411765, 1, 1,
0.3930583, -0.572204, 0.7878628, 0, 0.08627451, 1, 1,
0.3934579, 0.3915291, -1.579336, 0, 0.08235294, 1, 1,
0.393656, 0.1743113, 1.907749, 0, 0.07450981, 1, 1,
0.3968007, 1.026022, 0.04395861, 0, 0.07058824, 1, 1,
0.3986113, 0.5735827, 1.625184, 0, 0.0627451, 1, 1,
0.3994377, -0.7588819, 3.939524, 0, 0.05882353, 1, 1,
0.4021134, -0.3423698, 1.994442, 0, 0.05098039, 1, 1,
0.4022888, 1.182833, 1.197989, 0, 0.04705882, 1, 1,
0.4094227, 0.3972987, 0.521715, 0, 0.03921569, 1, 1,
0.4101939, -0.463921, 0.6125752, 0, 0.03529412, 1, 1,
0.4148149, 0.3195443, 1.637799, 0, 0.02745098, 1, 1,
0.4163726, -0.07501499, 2.311567, 0, 0.02352941, 1, 1,
0.4261183, 0.3098128, 2.065208, 0, 0.01568628, 1, 1,
0.4268003, 0.6205139, 0.8051368, 0, 0.01176471, 1, 1,
0.4312604, 0.339933, 0.9613051, 0, 0.003921569, 1, 1,
0.4314302, 0.207901, 1.087917, 0.003921569, 0, 1, 1,
0.43278, 1.86031, -0.1942331, 0.007843138, 0, 1, 1,
0.4394526, -1.325889, 2.10614, 0.01568628, 0, 1, 1,
0.4414972, -0.7318434, 2.116304, 0.01960784, 0, 1, 1,
0.4436496, -0.1964575, 1.329646, 0.02745098, 0, 1, 1,
0.444029, -1.602898, 1.523662, 0.03137255, 0, 1, 1,
0.446572, -0.6737252, 2.426382, 0.03921569, 0, 1, 1,
0.449052, -0.3573986, 2.785951, 0.04313726, 0, 1, 1,
0.4494008, -0.9087523, 2.017144, 0.05098039, 0, 1, 1,
0.4542409, -0.6764919, 1.7619, 0.05490196, 0, 1, 1,
0.4546965, 0.3880775, 1.376233, 0.0627451, 0, 1, 1,
0.4548711, -0.5330037, 1.64955, 0.06666667, 0, 1, 1,
0.4636537, 1.647584, 0.2297135, 0.07450981, 0, 1, 1,
0.4648786, 1.540732, 1.523505, 0.07843138, 0, 1, 1,
0.4651025, -2.073028, 2.987307, 0.08627451, 0, 1, 1,
0.4662236, 0.4969377, 2.075707, 0.09019608, 0, 1, 1,
0.4694994, 0.01636337, 1.978569, 0.09803922, 0, 1, 1,
0.471942, 0.04803997, 1.450276, 0.1058824, 0, 1, 1,
0.4724275, 0.9621545, 0.9292098, 0.1098039, 0, 1, 1,
0.4806566, 1.572076, -0.6369361, 0.1176471, 0, 1, 1,
0.4856895, -1.635191, 3.311795, 0.1215686, 0, 1, 1,
0.4869141, -0.6563342, 3.078735, 0.1294118, 0, 1, 1,
0.494385, 1.07323, 0.7676519, 0.1333333, 0, 1, 1,
0.4947889, 0.1088995, 0.6811041, 0.1411765, 0, 1, 1,
0.50253, 0.8946022, 0.5572132, 0.145098, 0, 1, 1,
0.5089741, 1.642752, 2.173639, 0.1529412, 0, 1, 1,
0.510843, 2.942231, -0.7460281, 0.1568628, 0, 1, 1,
0.519908, -0.3240306, 2.801185, 0.1647059, 0, 1, 1,
0.5207584, 0.8195992, 1.447627, 0.1686275, 0, 1, 1,
0.5219175, -0.7249928, 1.763563, 0.1764706, 0, 1, 1,
0.526953, -1.58812, 2.153589, 0.1803922, 0, 1, 1,
0.5290127, -0.1295603, -0.1729634, 0.1882353, 0, 1, 1,
0.5325547, -0.9703162, 3.566433, 0.1921569, 0, 1, 1,
0.5342116, -1.581463, 1.442923, 0.2, 0, 1, 1,
0.5351062, 1.670982, -0.03317118, 0.2078431, 0, 1, 1,
0.5406064, -0.7450472, 4.651433, 0.2117647, 0, 1, 1,
0.5423475, 0.564157, 1.691128, 0.2196078, 0, 1, 1,
0.5448784, 0.4415288, 1.234437, 0.2235294, 0, 1, 1,
0.5479547, -0.3182371, 4.983887, 0.2313726, 0, 1, 1,
0.5593134, -0.03900383, 0.9630331, 0.2352941, 0, 1, 1,
0.5606371, 0.2490682, 0.5590215, 0.2431373, 0, 1, 1,
0.5616273, -1.529535, 1.84429, 0.2470588, 0, 1, 1,
0.5705829, 1.083342, 0.60291, 0.254902, 0, 1, 1,
0.5736402, -0.7777845, 0.5623752, 0.2588235, 0, 1, 1,
0.5796397, 1.169609, -0.1220627, 0.2666667, 0, 1, 1,
0.5827395, -0.6192113, 1.52199, 0.2705882, 0, 1, 1,
0.5853303, 0.2096836, 0.3535349, 0.2784314, 0, 1, 1,
0.5870827, 1.188833, 1.611027, 0.282353, 0, 1, 1,
0.5884221, 0.995989, 1.720942, 0.2901961, 0, 1, 1,
0.5921358, -0.2092918, 2.53414, 0.2941177, 0, 1, 1,
0.5927894, -0.7126253, 2.702832, 0.3019608, 0, 1, 1,
0.5933037, 0.1271856, 0.840838, 0.3098039, 0, 1, 1,
0.5935576, -0.9738192, 3.060087, 0.3137255, 0, 1, 1,
0.5941477, -1.488958, 2.104404, 0.3215686, 0, 1, 1,
0.5961815, -1.931416, 2.730037, 0.3254902, 0, 1, 1,
0.5989528, -1.608131, 2.985696, 0.3333333, 0, 1, 1,
0.6000611, 0.5091374, 0.7403238, 0.3372549, 0, 1, 1,
0.6009867, -1.196785, 2.520554, 0.345098, 0, 1, 1,
0.6050559, -0.5804906, 3.230536, 0.3490196, 0, 1, 1,
0.6084843, -0.3861724, 2.977998, 0.3568628, 0, 1, 1,
0.6097924, 1.320088, 1.406755, 0.3607843, 0, 1, 1,
0.6157569, 0.7964497, -0.7099504, 0.3686275, 0, 1, 1,
0.6164104, 1.127614, -0.8571959, 0.372549, 0, 1, 1,
0.6205432, -1.815243, 3.629699, 0.3803922, 0, 1, 1,
0.6254987, 0.08281878, 4.116234, 0.3843137, 0, 1, 1,
0.6258014, -0.3101862, 3.406048, 0.3921569, 0, 1, 1,
0.6307678, 2.218706, 2.160071, 0.3960784, 0, 1, 1,
0.635803, -1.0226, 1.432768, 0.4039216, 0, 1, 1,
0.637692, 2.207706, 1.078443, 0.4117647, 0, 1, 1,
0.6380738, -0.04698079, 2.238307, 0.4156863, 0, 1, 1,
0.6410933, 1.119961, 1.360683, 0.4235294, 0, 1, 1,
0.644249, -2.240941, 3.121143, 0.427451, 0, 1, 1,
0.6447641, 0.2353842, 0.6878867, 0.4352941, 0, 1, 1,
0.6474776, 1.025411, -0.03986241, 0.4392157, 0, 1, 1,
0.6480634, -0.8777051, 2.873668, 0.4470588, 0, 1, 1,
0.6487026, -0.2725089, 2.008682, 0.4509804, 0, 1, 1,
0.6549059, 1.24223, -1.063304, 0.4588235, 0, 1, 1,
0.6593899, -0.6711839, 2.011132, 0.4627451, 0, 1, 1,
0.6595192, -0.5120809, 3.251001, 0.4705882, 0, 1, 1,
0.6676819, 0.4978343, 0.5092676, 0.4745098, 0, 1, 1,
0.6717295, 0.6837233, 1.680876, 0.4823529, 0, 1, 1,
0.6723286, -1.138151, 3.091968, 0.4862745, 0, 1, 1,
0.6723906, 0.2601615, 2.017926, 0.4941176, 0, 1, 1,
0.674605, 0.1100165, 2.260912, 0.5019608, 0, 1, 1,
0.6754274, -0.08357134, 1.631496, 0.5058824, 0, 1, 1,
0.6781387, -0.009728625, 3.014578, 0.5137255, 0, 1, 1,
0.6819864, 0.8004, -1.348814, 0.5176471, 0, 1, 1,
0.6828141, -0.406336, 1.435754, 0.5254902, 0, 1, 1,
0.6859958, -1.170925, 2.659835, 0.5294118, 0, 1, 1,
0.687478, -0.223173, 1.618286, 0.5372549, 0, 1, 1,
0.6880934, -0.9890894, 1.622132, 0.5411765, 0, 1, 1,
0.6919748, 0.4755849, 1.955001, 0.5490196, 0, 1, 1,
0.6964101, 0.6292116, -0.5654108, 0.5529412, 0, 1, 1,
0.6992112, 1.106197, -0.1313486, 0.5607843, 0, 1, 1,
0.7007869, 0.3326198, 1.189419, 0.5647059, 0, 1, 1,
0.7018011, -1.900033, 2.567466, 0.572549, 0, 1, 1,
0.7112644, -0.6244867, 2.708205, 0.5764706, 0, 1, 1,
0.7147723, -0.7837694, 1.600488, 0.5843138, 0, 1, 1,
0.7161447, 0.1308767, 2.002877, 0.5882353, 0, 1, 1,
0.717532, -0.08633593, 1.435748, 0.5960785, 0, 1, 1,
0.7189565, -0.2743855, 1.877241, 0.6039216, 0, 1, 1,
0.7247463, 0.0540905, 0.9494538, 0.6078432, 0, 1, 1,
0.7264504, 0.2869255, 0.8053929, 0.6156863, 0, 1, 1,
0.7302964, 0.02840521, 2.548438, 0.6196079, 0, 1, 1,
0.7414117, 0.82809, -0.9360333, 0.627451, 0, 1, 1,
0.7497681, 0.157154, -0.1949088, 0.6313726, 0, 1, 1,
0.7567683, -0.6782294, 2.33737, 0.6392157, 0, 1, 1,
0.7596518, 0.2621282, 2.582807, 0.6431373, 0, 1, 1,
0.7605929, -0.4486474, 2.636631, 0.6509804, 0, 1, 1,
0.7652058, -0.7976448, 3.274688, 0.654902, 0, 1, 1,
0.7714263, -0.5356345, 2.718628, 0.6627451, 0, 1, 1,
0.7748871, 0.1646733, 2.296005, 0.6666667, 0, 1, 1,
0.775162, 0.7720926, 1.933175, 0.6745098, 0, 1, 1,
0.7813879, -0.008006509, 1.640555, 0.6784314, 0, 1, 1,
0.7827256, 0.9263719, -0.1353822, 0.6862745, 0, 1, 1,
0.7828709, -0.008619798, 1.586828, 0.6901961, 0, 1, 1,
0.7834023, 0.8016722, 0.2212357, 0.6980392, 0, 1, 1,
0.7837782, 1.554809, 0.4539467, 0.7058824, 0, 1, 1,
0.7851442, 0.1509974, 1.920079, 0.7098039, 0, 1, 1,
0.7868234, 0.1292466, 0.2520772, 0.7176471, 0, 1, 1,
0.7890679, 0.9491014, 0.08930767, 0.7215686, 0, 1, 1,
0.7892576, 0.8657291, -0.4767576, 0.7294118, 0, 1, 1,
0.7917085, -0.5772806, 2.846296, 0.7333333, 0, 1, 1,
0.792735, 2.711367, 1.459408, 0.7411765, 0, 1, 1,
0.7974524, 0.1552683, 2.752856, 0.7450981, 0, 1, 1,
0.8099375, -0.599503, 3.036856, 0.7529412, 0, 1, 1,
0.8114232, 0.7659124, 2.132616, 0.7568628, 0, 1, 1,
0.8122203, -0.1024978, 0.1930134, 0.7647059, 0, 1, 1,
0.8195462, 0.3695032, 1.806097, 0.7686275, 0, 1, 1,
0.8224667, -0.511287, 3.191542, 0.7764706, 0, 1, 1,
0.8255203, -0.6988032, 1.763456, 0.7803922, 0, 1, 1,
0.8300786, 0.2720638, 1.119798, 0.7882353, 0, 1, 1,
0.8311588, 1.947363, -1.554797, 0.7921569, 0, 1, 1,
0.833634, -1.909674, 3.685564, 0.8, 0, 1, 1,
0.8464231, 0.9618989, 1.751425, 0.8078431, 0, 1, 1,
0.8484392, -1.519799, 3.327876, 0.8117647, 0, 1, 1,
0.8551714, 0.7386096, 0.6876408, 0.8196079, 0, 1, 1,
0.8574829, -0.1633218, -0.6360263, 0.8235294, 0, 1, 1,
0.8606625, 1.651363, 1.957201, 0.8313726, 0, 1, 1,
0.8633578, -0.4613299, 2.553015, 0.8352941, 0, 1, 1,
0.8641253, -0.1256495, 0.4832789, 0.8431373, 0, 1, 1,
0.8644761, -0.2263059, 1.231248, 0.8470588, 0, 1, 1,
0.8709278, -0.8974344, 4.01661, 0.854902, 0, 1, 1,
0.8773143, -1.585429, 2.643291, 0.8588235, 0, 1, 1,
0.8773937, 0.4006138, 0.4672287, 0.8666667, 0, 1, 1,
0.8804048, -1.348575, 1.995451, 0.8705882, 0, 1, 1,
0.8860114, -1.107081, 1.028162, 0.8784314, 0, 1, 1,
0.8890586, -0.9473314, 2.867557, 0.8823529, 0, 1, 1,
0.8904417, 1.1862, 0.2436123, 0.8901961, 0, 1, 1,
0.891308, -1.886518, 2.116703, 0.8941177, 0, 1, 1,
0.8934379, 1.297433, 0.5010163, 0.9019608, 0, 1, 1,
0.8967083, 1.885782, 0.04121066, 0.9098039, 0, 1, 1,
0.9034424, -0.5218516, 1.092315, 0.9137255, 0, 1, 1,
0.910853, -0.3706579, 5.001577, 0.9215686, 0, 1, 1,
0.9114489, -0.740047, 4.809387, 0.9254902, 0, 1, 1,
0.9183326, -1.479599, 2.595476, 0.9333333, 0, 1, 1,
0.9204113, 0.4758903, 0.7820727, 0.9372549, 0, 1, 1,
0.9217671, 0.7899259, 2.29094, 0.945098, 0, 1, 1,
0.9219926, -2.019938, 2.737074, 0.9490196, 0, 1, 1,
0.9254169, -1.515004, 1.664046, 0.9568627, 0, 1, 1,
0.9265124, 2.452718, 0.5115267, 0.9607843, 0, 1, 1,
0.9313722, -0.7281104, 3.435966, 0.9686275, 0, 1, 1,
0.9314004, 0.4926465, 0.6066194, 0.972549, 0, 1, 1,
0.9387358, -1.232984, 3.243836, 0.9803922, 0, 1, 1,
0.941626, -0.9027226, 2.441013, 0.9843137, 0, 1, 1,
0.9436023, -0.8437929, 2.303675, 0.9921569, 0, 1, 1,
0.9449664, -0.1122912, 0.2758003, 0.9960784, 0, 1, 1,
0.9502237, 1.084474, 2.224231, 1, 0, 0.9960784, 1,
0.954046, 0.816433, 0.785024, 1, 0, 0.9882353, 1,
0.9588017, -0.4538004, 1.812531, 1, 0, 0.9843137, 1,
0.9715425, 2.177694, 0.0403869, 1, 0, 0.9764706, 1,
0.9781808, -0.3167858, 2.513715, 1, 0, 0.972549, 1,
0.9818323, 0.1246216, 3.396952, 1, 0, 0.9647059, 1,
0.9850216, -0.3961022, 1.661708, 1, 0, 0.9607843, 1,
0.9855195, 0.1191418, -0.2596653, 1, 0, 0.9529412, 1,
0.9885578, -2.349064, 2.465215, 1, 0, 0.9490196, 1,
0.9901356, -0.4984427, 2.92552, 1, 0, 0.9411765, 1,
1.000352, -0.4125477, -0.07807285, 1, 0, 0.9372549, 1,
1.002283, -1.047434, 0.5940671, 1, 0, 0.9294118, 1,
1.009678, -2.966524, 0.8731629, 1, 0, 0.9254902, 1,
1.010449, 1.932673, -0.3016707, 1, 0, 0.9176471, 1,
1.016128, -0.173872, 2.848041, 1, 0, 0.9137255, 1,
1.025431, -0.504042, 2.899908, 1, 0, 0.9058824, 1,
1.027218, -1.852152, 2.539702, 1, 0, 0.9019608, 1,
1.02924, -0.4988563, 0.3994518, 1, 0, 0.8941177, 1,
1.029787, 0.2253074, 0.6410774, 1, 0, 0.8862745, 1,
1.03259, -1.041233, 3.512609, 1, 0, 0.8823529, 1,
1.034193, 1.973409, -0.2831851, 1, 0, 0.8745098, 1,
1.035139, 0.0820396, 0.6749777, 1, 0, 0.8705882, 1,
1.036202, 0.3045439, 0.8621057, 1, 0, 0.8627451, 1,
1.03927, -0.6153432, 2.920055, 1, 0, 0.8588235, 1,
1.055107, 2.049796, 1.588723, 1, 0, 0.8509804, 1,
1.05553, 0.3311972, 0.1720577, 1, 0, 0.8470588, 1,
1.060839, 0.2575624, 1.433741, 1, 0, 0.8392157, 1,
1.065793, 1.251967, 0.03642497, 1, 0, 0.8352941, 1,
1.065793, 1.469309, 0.2572273, 1, 0, 0.827451, 1,
1.070282, 0.8701251, 2.915457, 1, 0, 0.8235294, 1,
1.072439, 1.774067, 1.416477, 1, 0, 0.8156863, 1,
1.081484, -0.1239248, 4.055521, 1, 0, 0.8117647, 1,
1.102522, 1.078436, 0.7804965, 1, 0, 0.8039216, 1,
1.109356, -0.5013962, 3.271686, 1, 0, 0.7960784, 1,
1.11652, -0.5155085, -0.264802, 1, 0, 0.7921569, 1,
1.120024, -0.1271325, 1.956962, 1, 0, 0.7843137, 1,
1.126053, 0.5556784, 0.5530902, 1, 0, 0.7803922, 1,
1.127948, -0.733386, 2.488375, 1, 0, 0.772549, 1,
1.130916, 0.8895141, -0.9029326, 1, 0, 0.7686275, 1,
1.132483, -0.1021191, 1.832568, 1, 0, 0.7607843, 1,
1.138173, 1.73854, -0.004988029, 1, 0, 0.7568628, 1,
1.138284, -1.183271, 2.475659, 1, 0, 0.7490196, 1,
1.13886, 2.498624, 1.30015, 1, 0, 0.7450981, 1,
1.14932, 0.5207995, 2.144087, 1, 0, 0.7372549, 1,
1.156108, 0.003216003, 1.226009, 1, 0, 0.7333333, 1,
1.165128, -1.282129, 1.678536, 1, 0, 0.7254902, 1,
1.167602, 0.03546017, 1.110468, 1, 0, 0.7215686, 1,
1.174367, 0.3557674, -0.1668648, 1, 0, 0.7137255, 1,
1.179088, 0.002985154, 1.310089, 1, 0, 0.7098039, 1,
1.184638, -0.4626547, 2.491247, 1, 0, 0.7019608, 1,
1.18709, -1.013525, 1.701833, 1, 0, 0.6941177, 1,
1.189851, 0.5864674, 1.22475, 1, 0, 0.6901961, 1,
1.192075, 0.8475566, -0.2333481, 1, 0, 0.682353, 1,
1.1921, -0.8867841, 2.276273, 1, 0, 0.6784314, 1,
1.192536, -0.3340545, 2.672647, 1, 0, 0.6705883, 1,
1.193838, -2.316228, 3.070194, 1, 0, 0.6666667, 1,
1.194469, 0.6778164, -0.1995599, 1, 0, 0.6588235, 1,
1.198811, -1.163969, 2.107564, 1, 0, 0.654902, 1,
1.198971, -0.5297167, 3.09725, 1, 0, 0.6470588, 1,
1.199367, 0.6040294, 2.156655, 1, 0, 0.6431373, 1,
1.202642, -0.5935139, 3.175115, 1, 0, 0.6352941, 1,
1.202686, -1.150882, 2.256048, 1, 0, 0.6313726, 1,
1.207196, 0.2300332, 1.3252, 1, 0, 0.6235294, 1,
1.20827, -0.08631381, 1.925323, 1, 0, 0.6196079, 1,
1.208825, 0.4454821, 0.4983335, 1, 0, 0.6117647, 1,
1.214285, 0.8447145, 1.617855, 1, 0, 0.6078432, 1,
1.217115, 0.1767356, 1.114629, 1, 0, 0.6, 1,
1.221579, 1.029337, 0.1944235, 1, 0, 0.5921569, 1,
1.221829, -0.4252992, 3.392521, 1, 0, 0.5882353, 1,
1.22262, 1.161572, 1.759777, 1, 0, 0.5803922, 1,
1.224327, -0.03543852, 1.085093, 1, 0, 0.5764706, 1,
1.228909, 0.5664523, 1.453968, 1, 0, 0.5686275, 1,
1.237022, -1.253551, 2.47062, 1, 0, 0.5647059, 1,
1.245288, 1.945711, 0.8395044, 1, 0, 0.5568628, 1,
1.25413, -0.07492402, 1.089474, 1, 0, 0.5529412, 1,
1.282161, -0.870768, 1.756558, 1, 0, 0.5450981, 1,
1.292443, 1.730449, 0.2085299, 1, 0, 0.5411765, 1,
1.294604, -0.4719392, 1.716983, 1, 0, 0.5333334, 1,
1.295758, 0.4009564, -0.06233281, 1, 0, 0.5294118, 1,
1.296543, -0.9182726, -0.349833, 1, 0, 0.5215687, 1,
1.302818, 0.4426645, 0.9173849, 1, 0, 0.5176471, 1,
1.303629, -1.394913, 3.499165, 1, 0, 0.509804, 1,
1.304199, -0.9728101, 2.970213, 1, 0, 0.5058824, 1,
1.318611, -0.5540986, 1.285379, 1, 0, 0.4980392, 1,
1.332072, -0.1678291, -0.04367791, 1, 0, 0.4901961, 1,
1.332335, 0.582047, -0.1939986, 1, 0, 0.4862745, 1,
1.3393, -0.484093, 2.531802, 1, 0, 0.4784314, 1,
1.363617, -0.8946705, 2.003816, 1, 0, 0.4745098, 1,
1.36469, -0.237947, 1.665072, 1, 0, 0.4666667, 1,
1.366927, 1.520911, 1.661915, 1, 0, 0.4627451, 1,
1.371811, -0.4652422, 1.997264, 1, 0, 0.454902, 1,
1.374204, -0.2838154, 0.1371718, 1, 0, 0.4509804, 1,
1.37849, 0.3244977, 0.6501107, 1, 0, 0.4431373, 1,
1.384107, 1.920526, 1.159307, 1, 0, 0.4392157, 1,
1.389234, 0.3142056, 1.348317, 1, 0, 0.4313726, 1,
1.392619, -0.1920457, 0.9753553, 1, 0, 0.427451, 1,
1.394995, -0.09016702, 2.231865, 1, 0, 0.4196078, 1,
1.405783, -2.64083, 2.373191, 1, 0, 0.4156863, 1,
1.406784, -2.019825, 4.022782, 1, 0, 0.4078431, 1,
1.413657, 0.02017282, 2.464108, 1, 0, 0.4039216, 1,
1.429106, -1.68053, 3.350201, 1, 0, 0.3960784, 1,
1.430133, -0.8079244, 2.043471, 1, 0, 0.3882353, 1,
1.434134, 0.3523816, 1.792037, 1, 0, 0.3843137, 1,
1.434545, 0.2101288, 1.19651, 1, 0, 0.3764706, 1,
1.474813, 1.904979, 0.4895388, 1, 0, 0.372549, 1,
1.47903, 0.9552432, 0.5118672, 1, 0, 0.3647059, 1,
1.479319, -0.2524365, 0.9886769, 1, 0, 0.3607843, 1,
1.48214, -0.1128528, 0.8289538, 1, 0, 0.3529412, 1,
1.482991, -0.8328062, 2.543314, 1, 0, 0.3490196, 1,
1.492144, 0.8746236, 1.568052, 1, 0, 0.3411765, 1,
1.493701, -0.001824451, 2.122884, 1, 0, 0.3372549, 1,
1.500658, -0.7679733, 2.628554, 1, 0, 0.3294118, 1,
1.501361, -0.9702052, 2.788933, 1, 0, 0.3254902, 1,
1.524161, -0.3852743, 0.6527585, 1, 0, 0.3176471, 1,
1.527851, 1.151578, -0.7252529, 1, 0, 0.3137255, 1,
1.52879, 0.004036373, 1.465872, 1, 0, 0.3058824, 1,
1.55527, -0.2948926, 3.108163, 1, 0, 0.2980392, 1,
1.588637, 0.6190163, 2.643708, 1, 0, 0.2941177, 1,
1.591228, 0.2453925, 1.88639, 1, 0, 0.2862745, 1,
1.594635, 0.3289395, 1.868473, 1, 0, 0.282353, 1,
1.602988, -1.364345, 2.542489, 1, 0, 0.2745098, 1,
1.621629, 1.200161, 0.002815229, 1, 0, 0.2705882, 1,
1.626195, 0.1164336, 1.384322, 1, 0, 0.2627451, 1,
1.633015, 0.7920857, 2.271067, 1, 0, 0.2588235, 1,
1.633803, 0.5667257, 2.078106, 1, 0, 0.2509804, 1,
1.634996, 0.4323987, 0.4474564, 1, 0, 0.2470588, 1,
1.649136, 1.019117, 1.038682, 1, 0, 0.2392157, 1,
1.649925, 0.2647646, -0.3249257, 1, 0, 0.2352941, 1,
1.660499, 0.6352907, 0.6852681, 1, 0, 0.227451, 1,
1.662965, -1.684802, 2.71788, 1, 0, 0.2235294, 1,
1.674407, 0.1103655, 1.097996, 1, 0, 0.2156863, 1,
1.682882, 0.3683783, 2.197538, 1, 0, 0.2117647, 1,
1.683541, 0.2589066, 1.824834, 1, 0, 0.2039216, 1,
1.713499, 0.3716111, 0.9678198, 1, 0, 0.1960784, 1,
1.72923, -0.8278087, 3.318529, 1, 0, 0.1921569, 1,
1.737888, -0.2359717, 0.6450304, 1, 0, 0.1843137, 1,
1.802133, -0.1401788, 2.212727, 1, 0, 0.1803922, 1,
1.819648, 1.297464, 0.3896792, 1, 0, 0.172549, 1,
1.82802, 2.062586, -0.1566388, 1, 0, 0.1686275, 1,
1.846321, 0.7641848, 0.6253129, 1, 0, 0.1607843, 1,
1.852828, -0.7144366, 3.426443, 1, 0, 0.1568628, 1,
1.880867, 0.6873099, 1.522604, 1, 0, 0.1490196, 1,
1.901271, -1.12415, 1.122715, 1, 0, 0.145098, 1,
1.922145, 0.4377145, 2.289949, 1, 0, 0.1372549, 1,
1.926658, -1.562112, 1.793102, 1, 0, 0.1333333, 1,
1.933169, -0.3988183, 0.9296001, 1, 0, 0.1254902, 1,
1.968422, 0.1042943, 1.745353, 1, 0, 0.1215686, 1,
1.970964, 0.3093092, 2.272937, 1, 0, 0.1137255, 1,
1.972244, 0.06589642, 1.821931, 1, 0, 0.1098039, 1,
1.980973, -0.5543249, 2.463409, 1, 0, 0.1019608, 1,
1.986063, 0.2437477, 0.7542316, 1, 0, 0.09411765, 1,
2.03222, -1.242571, 0.1472163, 1, 0, 0.09019608, 1,
2.084011, 0.3585947, 2.251086, 1, 0, 0.08235294, 1,
2.087579, 0.6584975, 2.021611, 1, 0, 0.07843138, 1,
2.250081, 0.07099, 2.184894, 1, 0, 0.07058824, 1,
2.274693, -0.7626293, 2.072016, 1, 0, 0.06666667, 1,
2.351881, 0.3075396, 1.10262, 1, 0, 0.05882353, 1,
2.384568, 0.5141264, 1.821499, 1, 0, 0.05490196, 1,
2.390203, -0.6066057, 1.114786, 1, 0, 0.04705882, 1,
2.441979, 0.9213125, 0.2548835, 1, 0, 0.04313726, 1,
2.444678, -0.6801608, 0.3290586, 1, 0, 0.03529412, 1,
2.54115, 2.775379, -0.544911, 1, 0, 0.03137255, 1,
2.65062, 0.6433494, 2.683432, 1, 0, 0.02352941, 1,
2.843945, -0.5102543, 2.099467, 1, 0, 0.01960784, 1,
2.921334, 0.6652806, 0.9527633, 1, 0, 0.01176471, 1,
3.044249, -0.9335711, 1.584269, 1, 0, 0.007843138, 1
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
-0.07480669, -4.146591, -7.445394, 0, -0.5, 0.5, 0.5,
-0.07480669, -4.146591, -7.445394, 1, -0.5, 0.5, 0.5,
-0.07480669, -4.146591, -7.445394, 1, 1.5, 0.5, 0.5,
-0.07480669, -4.146591, -7.445394, 0, 1.5, 0.5, 0.5
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
-4.251222, -0.08847547, -7.445394, 0, -0.5, 0.5, 0.5,
-4.251222, -0.08847547, -7.445394, 1, -0.5, 0.5, 0.5,
-4.251222, -0.08847547, -7.445394, 1, 1.5, 0.5, 0.5,
-4.251222, -0.08847547, -7.445394, 0, 1.5, 0.5, 0.5
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
-4.251222, -4.146591, -0.110816, 0, -0.5, 0.5, 0.5,
-4.251222, -4.146591, -0.110816, 1, -0.5, 0.5, 0.5,
-4.251222, -4.146591, -0.110816, 1, 1.5, 0.5, 0.5,
-4.251222, -4.146591, -0.110816, 0, 1.5, 0.5, 0.5
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
-3, -3.210103, -5.752799,
3, -3.210103, -5.752799,
-3, -3.210103, -5.752799,
-3, -3.366184, -6.034898,
-2, -3.210103, -5.752799,
-2, -3.366184, -6.034898,
-1, -3.210103, -5.752799,
-1, -3.366184, -6.034898,
0, -3.210103, -5.752799,
0, -3.366184, -6.034898,
1, -3.210103, -5.752799,
1, -3.366184, -6.034898,
2, -3.210103, -5.752799,
2, -3.366184, -6.034898,
3, -3.210103, -5.752799,
3, -3.366184, -6.034898
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
-3, -3.678347, -6.599096, 0, -0.5, 0.5, 0.5,
-3, -3.678347, -6.599096, 1, -0.5, 0.5, 0.5,
-3, -3.678347, -6.599096, 1, 1.5, 0.5, 0.5,
-3, -3.678347, -6.599096, 0, 1.5, 0.5, 0.5,
-2, -3.678347, -6.599096, 0, -0.5, 0.5, 0.5,
-2, -3.678347, -6.599096, 1, -0.5, 0.5, 0.5,
-2, -3.678347, -6.599096, 1, 1.5, 0.5, 0.5,
-2, -3.678347, -6.599096, 0, 1.5, 0.5, 0.5,
-1, -3.678347, -6.599096, 0, -0.5, 0.5, 0.5,
-1, -3.678347, -6.599096, 1, -0.5, 0.5, 0.5,
-1, -3.678347, -6.599096, 1, 1.5, 0.5, 0.5,
-1, -3.678347, -6.599096, 0, 1.5, 0.5, 0.5,
0, -3.678347, -6.599096, 0, -0.5, 0.5, 0.5,
0, -3.678347, -6.599096, 1, -0.5, 0.5, 0.5,
0, -3.678347, -6.599096, 1, 1.5, 0.5, 0.5,
0, -3.678347, -6.599096, 0, 1.5, 0.5, 0.5,
1, -3.678347, -6.599096, 0, -0.5, 0.5, 0.5,
1, -3.678347, -6.599096, 1, -0.5, 0.5, 0.5,
1, -3.678347, -6.599096, 1, 1.5, 0.5, 0.5,
1, -3.678347, -6.599096, 0, 1.5, 0.5, 0.5,
2, -3.678347, -6.599096, 0, -0.5, 0.5, 0.5,
2, -3.678347, -6.599096, 1, -0.5, 0.5, 0.5,
2, -3.678347, -6.599096, 1, 1.5, 0.5, 0.5,
2, -3.678347, -6.599096, 0, 1.5, 0.5, 0.5,
3, -3.678347, -6.599096, 0, -0.5, 0.5, 0.5,
3, -3.678347, -6.599096, 1, -0.5, 0.5, 0.5,
3, -3.678347, -6.599096, 1, 1.5, 0.5, 0.5,
3, -3.678347, -6.599096, 0, 1.5, 0.5, 0.5
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
-3.287434, -3, -5.752799,
-3.287434, 2, -5.752799,
-3.287434, -3, -5.752799,
-3.448065, -3, -6.034898,
-3.287434, -2, -5.752799,
-3.448065, -2, -6.034898,
-3.287434, -1, -5.752799,
-3.448065, -1, -6.034898,
-3.287434, 0, -5.752799,
-3.448065, 0, -6.034898,
-3.287434, 1, -5.752799,
-3.448065, 1, -6.034898,
-3.287434, 2, -5.752799,
-3.448065, 2, -6.034898
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
"-3",
"-2",
"-1",
"0",
"1",
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
-3.769328, -3, -6.599096, 0, -0.5, 0.5, 0.5,
-3.769328, -3, -6.599096, 1, -0.5, 0.5, 0.5,
-3.769328, -3, -6.599096, 1, 1.5, 0.5, 0.5,
-3.769328, -3, -6.599096, 0, 1.5, 0.5, 0.5,
-3.769328, -2, -6.599096, 0, -0.5, 0.5, 0.5,
-3.769328, -2, -6.599096, 1, -0.5, 0.5, 0.5,
-3.769328, -2, -6.599096, 1, 1.5, 0.5, 0.5,
-3.769328, -2, -6.599096, 0, 1.5, 0.5, 0.5,
-3.769328, -1, -6.599096, 0, -0.5, 0.5, 0.5,
-3.769328, -1, -6.599096, 1, -0.5, 0.5, 0.5,
-3.769328, -1, -6.599096, 1, 1.5, 0.5, 0.5,
-3.769328, -1, -6.599096, 0, 1.5, 0.5, 0.5,
-3.769328, 0, -6.599096, 0, -0.5, 0.5, 0.5,
-3.769328, 0, -6.599096, 1, -0.5, 0.5, 0.5,
-3.769328, 0, -6.599096, 1, 1.5, 0.5, 0.5,
-3.769328, 0, -6.599096, 0, 1.5, 0.5, 0.5,
-3.769328, 1, -6.599096, 0, -0.5, 0.5, 0.5,
-3.769328, 1, -6.599096, 1, -0.5, 0.5, 0.5,
-3.769328, 1, -6.599096, 1, 1.5, 0.5, 0.5,
-3.769328, 1, -6.599096, 0, 1.5, 0.5, 0.5,
-3.769328, 2, -6.599096, 0, -0.5, 0.5, 0.5,
-3.769328, 2, -6.599096, 1, -0.5, 0.5, 0.5,
-3.769328, 2, -6.599096, 1, 1.5, 0.5, 0.5,
-3.769328, 2, -6.599096, 0, 1.5, 0.5, 0.5
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
-3.287434, -3.210103, -4,
-3.287434, -3.210103, 4,
-3.287434, -3.210103, -4,
-3.448065, -3.366184, -4,
-3.287434, -3.210103, -2,
-3.448065, -3.366184, -2,
-3.287434, -3.210103, 0,
-3.448065, -3.366184, 0,
-3.287434, -3.210103, 2,
-3.448065, -3.366184, 2,
-3.287434, -3.210103, 4,
-3.448065, -3.366184, 4
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
-3.769328, -3.678347, -4, 0, -0.5, 0.5, 0.5,
-3.769328, -3.678347, -4, 1, -0.5, 0.5, 0.5,
-3.769328, -3.678347, -4, 1, 1.5, 0.5, 0.5,
-3.769328, -3.678347, -4, 0, 1.5, 0.5, 0.5,
-3.769328, -3.678347, -2, 0, -0.5, 0.5, 0.5,
-3.769328, -3.678347, -2, 1, -0.5, 0.5, 0.5,
-3.769328, -3.678347, -2, 1, 1.5, 0.5, 0.5,
-3.769328, -3.678347, -2, 0, 1.5, 0.5, 0.5,
-3.769328, -3.678347, 0, 0, -0.5, 0.5, 0.5,
-3.769328, -3.678347, 0, 1, -0.5, 0.5, 0.5,
-3.769328, -3.678347, 0, 1, 1.5, 0.5, 0.5,
-3.769328, -3.678347, 0, 0, 1.5, 0.5, 0.5,
-3.769328, -3.678347, 2, 0, -0.5, 0.5, 0.5,
-3.769328, -3.678347, 2, 1, -0.5, 0.5, 0.5,
-3.769328, -3.678347, 2, 1, 1.5, 0.5, 0.5,
-3.769328, -3.678347, 2, 0, 1.5, 0.5, 0.5,
-3.769328, -3.678347, 4, 0, -0.5, 0.5, 0.5,
-3.769328, -3.678347, 4, 1, -0.5, 0.5, 0.5,
-3.769328, -3.678347, 4, 1, 1.5, 0.5, 0.5,
-3.769328, -3.678347, 4, 0, 1.5, 0.5, 0.5
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
-3.287434, -3.210103, -5.752799,
-3.287434, 3.033152, -5.752799,
-3.287434, -3.210103, 5.531167,
-3.287434, 3.033152, 5.531167,
-3.287434, -3.210103, -5.752799,
-3.287434, -3.210103, 5.531167,
-3.287434, 3.033152, -5.752799,
-3.287434, 3.033152, 5.531167,
-3.287434, -3.210103, -5.752799,
3.13782, -3.210103, -5.752799,
-3.287434, -3.210103, 5.531167,
3.13782, -3.210103, 5.531167,
-3.287434, 3.033152, -5.752799,
3.13782, 3.033152, -5.752799,
-3.287434, 3.033152, 5.531167,
3.13782, 3.033152, 5.531167,
3.13782, -3.210103, -5.752799,
3.13782, 3.033152, -5.752799,
3.13782, -3.210103, 5.531167,
3.13782, 3.033152, 5.531167,
3.13782, -3.210103, -5.752799,
3.13782, -3.210103, 5.531167,
3.13782, 3.033152, -5.752799,
3.13782, 3.033152, 5.531167
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
var radius = 7.693584;
var distance = 34.22962;
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
mvMatrix.translate( 0.07480669, 0.08847547, 0.110816 );
mvMatrix.scale( 1.29465, 1.33239, 0.7371924 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.22962);
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
Oxytetracycline<-read.table("Oxytetracycline.xyz")
```

```
## Error in read.table("Oxytetracycline.xyz"): no lines available in input
```

```r
x<-Oxytetracycline$V2
```

```
## Error in eval(expr, envir, enclos): object 'Oxytetracycline' not found
```

```r
y<-Oxytetracycline$V3
```

```
## Error in eval(expr, envir, enclos): object 'Oxytetracycline' not found
```

```r
z<-Oxytetracycline$V4
```

```
## Error in eval(expr, envir, enclos): object 'Oxytetracycline' not found
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
-3.193862, 0.05178822, -1.314426, 0, 0, 1, 1, 1,
-2.7349, 0.2142642, 0.2563583, 1, 0, 0, 1, 1,
-2.55513, -0.08202336, -1.23072, 1, 0, 0, 1, 1,
-2.527244, -0.8160675, -0.1640243, 1, 0, 0, 1, 1,
-2.524836, -0.6341056, -1.907377, 1, 0, 0, 1, 1,
-2.511359, -0.2389968, -1.808281, 1, 0, 0, 1, 1,
-2.419533, 0.06375694, -1.307721, 0, 0, 0, 1, 1,
-2.406536, -0.4681681, -2.748716, 0, 0, 0, 1, 1,
-2.369688, -0.8889298, -1.861, 0, 0, 0, 1, 1,
-2.295555, 1.754444, -0.5557531, 0, 0, 0, 1, 1,
-2.265904, 0.08706793, -2.478889, 0, 0, 0, 1, 1,
-2.232823, 0.002489488, -2.502902, 0, 0, 0, 1, 1,
-2.215112, -0.8759604, -2.877797, 0, 0, 0, 1, 1,
-2.178543, -0.4241412, -2.805967, 1, 1, 1, 1, 1,
-2.159111, -0.5558885, -2.55678, 1, 1, 1, 1, 1,
-2.158701, -1.401744, -1.355463, 1, 1, 1, 1, 1,
-2.156367, -1.029846, -2.10031, 1, 1, 1, 1, 1,
-2.145832, 1.933624, -0.6567238, 1, 1, 1, 1, 1,
-2.143277, 0.3508111, -0.1021025, 1, 1, 1, 1, 1,
-2.102922, -0.7878243, 0.4571243, 1, 1, 1, 1, 1,
-2.089481, 1.412867, -1.220361, 1, 1, 1, 1, 1,
-2.089175, 0.1051533, -2.516405, 1, 1, 1, 1, 1,
-2.080403, 0.6865082, -3.131885, 1, 1, 1, 1, 1,
-2.042225, 1.929251, -1.139599, 1, 1, 1, 1, 1,
-2.039339, -1.606283, -3.970383, 1, 1, 1, 1, 1,
-2.023651, -0.4146661, -1.143562, 1, 1, 1, 1, 1,
-1.978001, 0.9229517, 2.134419, 1, 1, 1, 1, 1,
-1.923454, -0.9237083, -2.403745, 1, 1, 1, 1, 1,
-1.923426, 0.1413569, -2.320516, 0, 0, 1, 1, 1,
-1.900733, 0.4776509, -1.198216, 1, 0, 0, 1, 1,
-1.889449, 0.8017797, 0.3721429, 1, 0, 0, 1, 1,
-1.886387, 1.841476, -0.09651972, 1, 0, 0, 1, 1,
-1.870566, -0.6792757, -2.157327, 1, 0, 0, 1, 1,
-1.869417, 0.5652186, -1.109245, 1, 0, 0, 1, 1,
-1.857625, -0.04266702, -1.490919, 0, 0, 0, 1, 1,
-1.825899, 0.1760409, -1.598611, 0, 0, 0, 1, 1,
-1.813503, 0.488419, -2.527526, 0, 0, 0, 1, 1,
-1.795532, -1.274274, -4.571988, 0, 0, 0, 1, 1,
-1.79449, 0.8905731, 0.04482118, 0, 0, 0, 1, 1,
-1.778982, 1.569196, -0.128319, 0, 0, 0, 1, 1,
-1.760684, -0.4999274, -1.372895, 0, 0, 0, 1, 1,
-1.729899, 1.744944, -1.552442, 1, 1, 1, 1, 1,
-1.709013, -0.1603744, -2.634263, 1, 1, 1, 1, 1,
-1.706633, -0.3871884, -0.771513, 1, 1, 1, 1, 1,
-1.702366, 0.1207188, -2.008495, 1, 1, 1, 1, 1,
-1.69807, 0.9900131, -2.337664, 1, 1, 1, 1, 1,
-1.671867, -0.1133213, -3.622858, 1, 1, 1, 1, 1,
-1.656149, 0.4656751, 0.0707273, 1, 1, 1, 1, 1,
-1.630074, 0.5716565, 0.2698063, 1, 1, 1, 1, 1,
-1.62383, -0.04426025, -2.433122, 1, 1, 1, 1, 1,
-1.613528, 0.7574468, -0.2247811, 1, 1, 1, 1, 1,
-1.611459, 0.09257884, -1.391418, 1, 1, 1, 1, 1,
-1.603786, -0.3416318, -3.196801, 1, 1, 1, 1, 1,
-1.600631, -1.393744, -3.09416, 1, 1, 1, 1, 1,
-1.593823, 1.265017, -0.1480636, 1, 1, 1, 1, 1,
-1.5849, -0.12107, -1.655223, 1, 1, 1, 1, 1,
-1.581865, 1.718027, -0.2278983, 0, 0, 1, 1, 1,
-1.568324, -1.155533, -2.564615, 1, 0, 0, 1, 1,
-1.545088, -0.1076393, -1.884419, 1, 0, 0, 1, 1,
-1.535452, -0.2945924, -2.566116, 1, 0, 0, 1, 1,
-1.525257, 0.7683167, -1.391386, 1, 0, 0, 1, 1,
-1.515504, 0.7553768, -1.161184, 1, 0, 0, 1, 1,
-1.511645, -0.2151844, -2.481927, 0, 0, 0, 1, 1,
-1.504377, -0.6213503, -3.257113, 0, 0, 0, 1, 1,
-1.486881, -0.5474046, -1.197727, 0, 0, 0, 1, 1,
-1.48568, 1.125749, -0.9647714, 0, 0, 0, 1, 1,
-1.477098, 0.3481517, -2.114564, 0, 0, 0, 1, 1,
-1.471254, -0.7124767, -4.00341, 0, 0, 0, 1, 1,
-1.46846, -0.9009771, -1.407663, 0, 0, 0, 1, 1,
-1.460004, -1.440075, -3.295352, 1, 1, 1, 1, 1,
-1.459898, -0.2196164, -2.560116, 1, 1, 1, 1, 1,
-1.456454, -2.58498, -1.99594, 1, 1, 1, 1, 1,
-1.435225, 0.6872073, 0.07634441, 1, 1, 1, 1, 1,
-1.433054, -0.9646907, -2.648277, 1, 1, 1, 1, 1,
-1.432993, 0.128599, -1.260306, 1, 1, 1, 1, 1,
-1.424765, 1.15263, 0.322268, 1, 1, 1, 1, 1,
-1.42381, 0.2451225, -1.57299, 1, 1, 1, 1, 1,
-1.415167, 1.329489, -0.458243, 1, 1, 1, 1, 1,
-1.408506, -0.3395531, -0.26815, 1, 1, 1, 1, 1,
-1.407015, 1.107305, -0.05762692, 1, 1, 1, 1, 1,
-1.403755, 0.5213459, 0.3198237, 1, 1, 1, 1, 1,
-1.40247, -3.119182, -2.403207, 1, 1, 1, 1, 1,
-1.402109, -1.098503, -3.118143, 1, 1, 1, 1, 1,
-1.385172, -0.4437123, -1.473699, 1, 1, 1, 1, 1,
-1.382911, -0.3225624, 0.236752, 0, 0, 1, 1, 1,
-1.380156, 1.805199, 0.9675853, 1, 0, 0, 1, 1,
-1.372661, 0.05862957, -3.07601, 1, 0, 0, 1, 1,
-1.370241, 1.927507, -0.7549786, 1, 0, 0, 1, 1,
-1.355464, -0.404034, -1.08298, 1, 0, 0, 1, 1,
-1.346142, -1.439304, -4.156492, 1, 0, 0, 1, 1,
-1.325708, -0.3857939, -1.925342, 0, 0, 0, 1, 1,
-1.325628, -0.01942593, -2.969613, 0, 0, 0, 1, 1,
-1.311824, 0.803683, -0.589147, 0, 0, 0, 1, 1,
-1.307092, 1.258676, -1.451749, 0, 0, 0, 1, 1,
-1.303131, 0.4128597, -1.413511, 0, 0, 0, 1, 1,
-1.302201, -1.193033, -1.888443, 0, 0, 0, 1, 1,
-1.295286, 0.3119909, -2.293563, 0, 0, 0, 1, 1,
-1.294413, 0.1791104, -1.943931, 1, 1, 1, 1, 1,
-1.294119, 0.5227723, 0.1248259, 1, 1, 1, 1, 1,
-1.29237, 0.6649923, -1.78896, 1, 1, 1, 1, 1,
-1.292126, -2.431548, -2.549591, 1, 1, 1, 1, 1,
-1.285976, -0.8849947, -0.4360485, 1, 1, 1, 1, 1,
-1.281333, -0.3961139, -1.006897, 1, 1, 1, 1, 1,
-1.278526, 0.4333093, -0.8687079, 1, 1, 1, 1, 1,
-1.274908, -1.1152, -2.835302, 1, 1, 1, 1, 1,
-1.268765, 1.263631, 1.147631, 1, 1, 1, 1, 1,
-1.265603, -0.8717808, -1.454217, 1, 1, 1, 1, 1,
-1.258773, 0.831465, -1.434476, 1, 1, 1, 1, 1,
-1.258485, -0.6015843, -1.392554, 1, 1, 1, 1, 1,
-1.247207, 0.06295768, 0.5248869, 1, 1, 1, 1, 1,
-1.235343, 0.4535212, -3.0829, 1, 1, 1, 1, 1,
-1.224244, 0.4527243, -0.1338275, 1, 1, 1, 1, 1,
-1.223906, -0.4415287, -1.898976, 0, 0, 1, 1, 1,
-1.22151, 0.01379323, 0.6664883, 1, 0, 0, 1, 1,
-1.210566, -0.1728907, -1.314154, 1, 0, 0, 1, 1,
-1.207052, -0.8394208, -1.588327, 1, 0, 0, 1, 1,
-1.20323, 1.394709, -0.2860792, 1, 0, 0, 1, 1,
-1.199148, -0.7663771, -3.437468, 1, 0, 0, 1, 1,
-1.198937, 0.8006772, -1.967501, 0, 0, 0, 1, 1,
-1.189659, -0.5323849, -1.18737, 0, 0, 0, 1, 1,
-1.186237, 0.2674799, -1.156197, 0, 0, 0, 1, 1,
-1.186119, -0.3382155, -2.017281, 0, 0, 0, 1, 1,
-1.18353, 1.103835, -1.386675, 0, 0, 0, 1, 1,
-1.174156, 0.8693731, -1.728041, 0, 0, 0, 1, 1,
-1.171161, -1.063367, -2.717451, 0, 0, 0, 1, 1,
-1.168593, -1.362834, -2.77717, 1, 1, 1, 1, 1,
-1.16399, -0.08566513, -2.126343, 1, 1, 1, 1, 1,
-1.163638, -0.8482139, -2.119701, 1, 1, 1, 1, 1,
-1.163102, -0.3522127, -3.166297, 1, 1, 1, 1, 1,
-1.162746, -1.50254, 0.2216362, 1, 1, 1, 1, 1,
-1.158037, 0.3538705, -1.10182, 1, 1, 1, 1, 1,
-1.157818, 0.3120974, -4.068433, 1, 1, 1, 1, 1,
-1.155861, 2.277102, -1.297608, 1, 1, 1, 1, 1,
-1.147858, -0.08288142, -2.81414, 1, 1, 1, 1, 1,
-1.141083, -0.4805471, -2.327975, 1, 1, 1, 1, 1,
-1.13991, 1.024276, 0.256623, 1, 1, 1, 1, 1,
-1.138162, 0.1689203, -2.349977, 1, 1, 1, 1, 1,
-1.134599, 0.6616891, -0.9940641, 1, 1, 1, 1, 1,
-1.132786, 0.8195565, -0.1488771, 1, 1, 1, 1, 1,
-1.130124, 1.156484, -2.394418, 1, 1, 1, 1, 1,
-1.122565, -0.2622795, -2.184757, 0, 0, 1, 1, 1,
-1.120503, -0.855762, -1.49008, 1, 0, 0, 1, 1,
-1.120397, 0.7288976, -0.810689, 1, 0, 0, 1, 1,
-1.119553, -1.760422, -3.720116, 1, 0, 0, 1, 1,
-1.109833, -0.08843824, -2.831561, 1, 0, 0, 1, 1,
-1.107399, 0.2262721, -2.329384, 1, 0, 0, 1, 1,
-1.107101, -0.8416445, -2.558952, 0, 0, 0, 1, 1,
-1.09558, -1.841335, -2.19934, 0, 0, 0, 1, 1,
-1.094283, -0.1816084, -1.094162, 0, 0, 0, 1, 1,
-1.091955, -0.8496136, -3.086173, 0, 0, 0, 1, 1,
-1.087493, 0.2110009, -2.306323, 0, 0, 0, 1, 1,
-1.086404, 0.7617059, 0.2703485, 0, 0, 0, 1, 1,
-1.083607, 0.2563951, -2.042548, 0, 0, 0, 1, 1,
-1.083148, 1.040985, -1.451921, 1, 1, 1, 1, 1,
-1.07575, -0.9388928, -3.409805, 1, 1, 1, 1, 1,
-1.072943, -0.5876995, -1.526755, 1, 1, 1, 1, 1,
-1.072759, 0.9518335, 0.05977273, 1, 1, 1, 1, 1,
-1.070808, 0.3621406, -1.976037, 1, 1, 1, 1, 1,
-1.070765, -0.8132619, -2.113252, 1, 1, 1, 1, 1,
-1.070651, -0.1239117, -4.373249, 1, 1, 1, 1, 1,
-1.069411, 0.954915, 0.2178039, 1, 1, 1, 1, 1,
-1.067419, -0.6898808, -1.903509, 1, 1, 1, 1, 1,
-1.066891, 0.33003, -1.228582, 1, 1, 1, 1, 1,
-1.059273, 0.9726697, -1.524094, 1, 1, 1, 1, 1,
-1.056676, -0.3889748, -1.918397, 1, 1, 1, 1, 1,
-1.053311, -0.09469953, 0.2024343, 1, 1, 1, 1, 1,
-1.041459, 0.03014332, -2.924243, 1, 1, 1, 1, 1,
-1.040509, -0.1663644, -2.401331, 1, 1, 1, 1, 1,
-1.035886, -1.709221, -1.985378, 0, 0, 1, 1, 1,
-1.022376, 0.4978888, -1.119861, 1, 0, 0, 1, 1,
-1.014097, 1.090465, 0.5348533, 1, 0, 0, 1, 1,
-1.012179, -0.6206726, -4.555743, 1, 0, 0, 1, 1,
-1.009377, 2.195796, 0.8276475, 1, 0, 0, 1, 1,
-1.009077, -1.487549, -1.111305, 1, 0, 0, 1, 1,
-1.003258, 0.9966305, 0.2609538, 0, 0, 0, 1, 1,
-1.003129, -0.657903, -2.039661, 0, 0, 0, 1, 1,
-1.001252, 0.1114343, -2.537077, 0, 0, 0, 1, 1,
-0.9984773, 0.6490498, -1.278264, 0, 0, 0, 1, 1,
-0.9959837, -1.230075, -2.970395, 0, 0, 0, 1, 1,
-0.9906039, 0.2287343, -1.451881, 0, 0, 0, 1, 1,
-0.9905259, 0.07389193, -0.8073635, 0, 0, 0, 1, 1,
-0.9872954, 1.796033, -0.7627938, 1, 1, 1, 1, 1,
-0.9844977, 0.1462678, -2.940351, 1, 1, 1, 1, 1,
-0.9814608, 1.352785, -0.3968, 1, 1, 1, 1, 1,
-0.9770957, 1.205961, -2.585645, 1, 1, 1, 1, 1,
-0.9721968, -1.312636, -3.180026, 1, 1, 1, 1, 1,
-0.9721654, -0.1563221, -1.758846, 1, 1, 1, 1, 1,
-0.9718599, 1.029679, -1.222491, 1, 1, 1, 1, 1,
-0.9593351, -0.1465617, -2.612875, 1, 1, 1, 1, 1,
-0.9578812, 0.7669304, 1.517307, 1, 1, 1, 1, 1,
-0.9572299, 0.6434056, -0.4373537, 1, 1, 1, 1, 1,
-0.9565066, 0.445276, -1.107511, 1, 1, 1, 1, 1,
-0.9525779, 0.6725143, 0.4420909, 1, 1, 1, 1, 1,
-0.9435978, 1.227965, -2.031949, 1, 1, 1, 1, 1,
-0.9424451, 1.310763, -1.136875, 1, 1, 1, 1, 1,
-0.9417437, 0.5745783, -2.489096, 1, 1, 1, 1, 1,
-0.941283, -1.76394, -3.183867, 0, 0, 1, 1, 1,
-0.9325811, -1.392295, -4.165329, 1, 0, 0, 1, 1,
-0.9171633, -0.2034838, -2.104623, 1, 0, 0, 1, 1,
-0.9095196, 0.3671418, -0.1116072, 1, 0, 0, 1, 1,
-0.9093856, 0.1337414, -1.482013, 1, 0, 0, 1, 1,
-0.9043781, -1.402393, -4.852323, 1, 0, 0, 1, 1,
-0.9015762, 1.300381, -2.323942, 0, 0, 0, 1, 1,
-0.8986953, 0.1017699, -2.377314, 0, 0, 0, 1, 1,
-0.8905566, -0.8331549, -2.911252, 0, 0, 0, 1, 1,
-0.8879525, -1.159636, -2.730529, 0, 0, 0, 1, 1,
-0.8735813, -0.3382107, -3.808896, 0, 0, 0, 1, 1,
-0.8680981, 0.2035198, -0.05281914, 0, 0, 0, 1, 1,
-0.8668838, 0.03594996, -0.4803383, 0, 0, 0, 1, 1,
-0.8662285, -0.4748392, -1.971768, 1, 1, 1, 1, 1,
-0.8604627, 0.472602, -0.4199216, 1, 1, 1, 1, 1,
-0.8558558, 0.0632684, -3.002383, 1, 1, 1, 1, 1,
-0.854571, -0.4329284, -3.395468, 1, 1, 1, 1, 1,
-0.8524768, -1.075548, -2.486494, 1, 1, 1, 1, 1,
-0.8505241, -0.4551499, -2.782018, 1, 1, 1, 1, 1,
-0.8392102, 0.107994, -2.104607, 1, 1, 1, 1, 1,
-0.8377909, -0.1324617, -0.6740031, 1, 1, 1, 1, 1,
-0.8377115, 0.5585852, -1.484804, 1, 1, 1, 1, 1,
-0.8253749, -0.2150992, -2.017817, 1, 1, 1, 1, 1,
-0.8188193, 1.895231, -0.1045667, 1, 1, 1, 1, 1,
-0.8172109, 0.263408, -1.838566, 1, 1, 1, 1, 1,
-0.8165458, 1.610864, 0.1791635, 1, 1, 1, 1, 1,
-0.8155173, 0.8781188, -2.235799, 1, 1, 1, 1, 1,
-0.8150147, -0.8147622, -1.916948, 1, 1, 1, 1, 1,
-0.8140643, 1.78863, -2.04647, 0, 0, 1, 1, 1,
-0.811413, 0.2793485, -1.230179, 1, 0, 0, 1, 1,
-0.8093954, 0.952594, -2.027953, 1, 0, 0, 1, 1,
-0.8083907, -0.9352153, -1.362592, 1, 0, 0, 1, 1,
-0.8059955, 1.86828, 0.3251506, 1, 0, 0, 1, 1,
-0.7982476, 1.211607, -2.049082, 1, 0, 0, 1, 1,
-0.7976968, 0.6978979, -0.806335, 0, 0, 0, 1, 1,
-0.7971866, 1.689855, -1.965453, 0, 0, 0, 1, 1,
-0.7905999, 0.1852011, -1.254146, 0, 0, 0, 1, 1,
-0.7898588, 0.6089801, -0.7239816, 0, 0, 0, 1, 1,
-0.78962, -0.5787993, -2.751448, 0, 0, 0, 1, 1,
-0.7879479, 0.5455232, 0.4540824, 0, 0, 0, 1, 1,
-0.7860633, -0.656883, -1.022246, 0, 0, 0, 1, 1,
-0.784808, -1.755919, -1.534247, 1, 1, 1, 1, 1,
-0.7780204, 0.6060312, -0.9267521, 1, 1, 1, 1, 1,
-0.776444, 0.5573069, -1.779838, 1, 1, 1, 1, 1,
-0.7760496, -0.4324475, -2.033633, 1, 1, 1, 1, 1,
-0.7733091, -0.1989234, 0.008072741, 1, 1, 1, 1, 1,
-0.7696336, 1.131989, 0.09814565, 1, 1, 1, 1, 1,
-0.768281, 0.607235, -1.506438, 1, 1, 1, 1, 1,
-0.7610965, 0.865644, -0.7372533, 1, 1, 1, 1, 1,
-0.7544906, 0.2977452, -2.324938, 1, 1, 1, 1, 1,
-0.7463769, 0.7336496, -0.4688658, 1, 1, 1, 1, 1,
-0.7264802, 0.4037773, -0.574199, 1, 1, 1, 1, 1,
-0.7204875, -1.104722, -3.286975, 1, 1, 1, 1, 1,
-0.7189234, -1.311139, -3.453685, 1, 1, 1, 1, 1,
-0.7170743, -1.533633, -2.40169, 1, 1, 1, 1, 1,
-0.7131938, 0.2481569, -0.4417261, 1, 1, 1, 1, 1,
-0.7131383, -0.3209463, -3.283321, 0, 0, 1, 1, 1,
-0.7109787, -0.9252051, -1.471032, 1, 0, 0, 1, 1,
-0.7057425, 0.7309718, -0.552812, 1, 0, 0, 1, 1,
-0.7035685, -0.7280757, -2.80987, 1, 0, 0, 1, 1,
-0.7019579, -0.5391022, -1.792507, 1, 0, 0, 1, 1,
-0.7008864, -2.062498, -1.985398, 1, 0, 0, 1, 1,
-0.6991923, -0.6431947, -1.334328, 0, 0, 0, 1, 1,
-0.6971995, -1.562712, -2.890553, 0, 0, 0, 1, 1,
-0.693913, 0.03536421, -1.932107, 0, 0, 0, 1, 1,
-0.6929283, 0.3074494, -0.9011366, 0, 0, 0, 1, 1,
-0.688142, -0.1979285, -3.321284, 0, 0, 0, 1, 1,
-0.6881077, 0.1755309, -0.08512115, 0, 0, 0, 1, 1,
-0.6873652, -0.489301, -1.711872, 0, 0, 0, 1, 1,
-0.6862082, -0.1582504, -0.6534739, 1, 1, 1, 1, 1,
-0.6834486, -0.8468956, -2.84833, 1, 1, 1, 1, 1,
-0.6798304, -0.5985049, -2.8852, 1, 1, 1, 1, 1,
-0.6736578, 0.2677009, 0.08970582, 1, 1, 1, 1, 1,
-0.6725466, -0.1257174, -2.195057, 1, 1, 1, 1, 1,
-0.6717867, 1.750054, -1.09967, 1, 1, 1, 1, 1,
-0.6672649, -0.01164969, -0.5375568, 1, 1, 1, 1, 1,
-0.6578208, -1.112918, -3.025004, 1, 1, 1, 1, 1,
-0.6555828, 1.062857, -0.03634152, 1, 1, 1, 1, 1,
-0.6525265, 0.6752755, -2.018708, 1, 1, 1, 1, 1,
-0.6508029, 0.5911869, -1.334098, 1, 1, 1, 1, 1,
-0.6500024, -0.7779178, -2.536726, 1, 1, 1, 1, 1,
-0.6435816, -0.7520767, -2.269464, 1, 1, 1, 1, 1,
-0.6415237, 1.107839, -1.205515, 1, 1, 1, 1, 1,
-0.6404155, -1.679313, -4.782277, 1, 1, 1, 1, 1,
-0.63909, 1.803674, -0.0175049, 0, 0, 1, 1, 1,
-0.6382163, -0.7449853, -3.092401, 1, 0, 0, 1, 1,
-0.6366609, -1.053167, -3.588039, 1, 0, 0, 1, 1,
-0.6311934, -0.02122276, -1.96463, 1, 0, 0, 1, 1,
-0.626307, -0.5125523, -2.270952, 1, 0, 0, 1, 1,
-0.624633, 0.8208486, -2.318948, 1, 0, 0, 1, 1,
-0.6199323, 2.24197, 0.4383338, 0, 0, 0, 1, 1,
-0.6187557, 0.05210621, -0.671721, 0, 0, 0, 1, 1,
-0.6129072, 0.2896082, -0.5365194, 0, 0, 0, 1, 1,
-0.6100798, 0.402379, 0.09756167, 0, 0, 0, 1, 1,
-0.6047879, -1.132886, -3.173027, 0, 0, 0, 1, 1,
-0.5951052, 0.1451981, -1.762565, 0, 0, 0, 1, 1,
-0.5905519, -1.409074, -3.877093, 0, 0, 0, 1, 1,
-0.5852106, -0.161396, -2.415731, 1, 1, 1, 1, 1,
-0.5807425, 0.3224349, -0.9832242, 1, 1, 1, 1, 1,
-0.5797134, -1.411875, -2.036499, 1, 1, 1, 1, 1,
-0.5690632, 1.851609, 1.755663, 1, 1, 1, 1, 1,
-0.5671753, -0.3905717, -2.931957, 1, 1, 1, 1, 1,
-0.5653436, -1.357476, -2.490884, 1, 1, 1, 1, 1,
-0.564393, 1.13563, -0.7045646, 1, 1, 1, 1, 1,
-0.5641493, -1.278663, -3.16675, 1, 1, 1, 1, 1,
-0.5443959, -1.462477, -2.791746, 1, 1, 1, 1, 1,
-0.5390363, 0.1092633, -1.035865, 1, 1, 1, 1, 1,
-0.5373555, -0.928785, -0.6179636, 1, 1, 1, 1, 1,
-0.5336621, -1.245769, -1.470343, 1, 1, 1, 1, 1,
-0.5323061, 0.9827784, -1.421744, 1, 1, 1, 1, 1,
-0.5312641, -0.4821483, -2.552772, 1, 1, 1, 1, 1,
-0.5279243, 1.173582, 2.008449, 1, 1, 1, 1, 1,
-0.5266138, -0.9924235, -0.4516835, 0, 0, 1, 1, 1,
-0.5265363, 0.1748946, -0.4121993, 1, 0, 0, 1, 1,
-0.5250123, -0.02536009, -1.893752, 1, 0, 0, 1, 1,
-0.5232228, 0.681739, -0.03143841, 1, 0, 0, 1, 1,
-0.5157458, -0.6075233, -2.505548, 1, 0, 0, 1, 1,
-0.5156116, 0.08022166, -1.492467, 1, 0, 0, 1, 1,
-0.5081297, 0.7198886, 0.2297135, 0, 0, 0, 1, 1,
-0.5040684, -1.574465, -1.779578, 0, 0, 0, 1, 1,
-0.5014006, 0.467017, 0.8360279, 0, 0, 0, 1, 1,
-0.5012552, 0.4699534, -0.1271085, 0, 0, 0, 1, 1,
-0.497968, -0.4714819, -1.110859, 0, 0, 0, 1, 1,
-0.4978633, 2.167769, -0.7058546, 0, 0, 0, 1, 1,
-0.4946395, 0.9666988, -0.4403887, 0, 0, 0, 1, 1,
-0.4936124, -1.53557, -1.51626, 1, 1, 1, 1, 1,
-0.4921421, -0.8625222, -2.691678, 1, 1, 1, 1, 1,
-0.4893577, 2.059162, 0.02146584, 1, 1, 1, 1, 1,
-0.4882144, 1.270082, -2.108613, 1, 1, 1, 1, 1,
-0.4861019, -1.513176, -1.732102, 1, 1, 1, 1, 1,
-0.4766198, -0.2287176, -2.653273, 1, 1, 1, 1, 1,
-0.4726893, 1.121028, 0.2134834, 1, 1, 1, 1, 1,
-0.4632483, -0.1506163, -3.241505, 1, 1, 1, 1, 1,
-0.4626475, -0.8185476, -1.031397, 1, 1, 1, 1, 1,
-0.4580474, 0.1362115, -0.5544107, 1, 1, 1, 1, 1,
-0.4564458, 0.6092519, -0.8585294, 1, 1, 1, 1, 1,
-0.4515935, -0.1344859, -2.553483, 1, 1, 1, 1, 1,
-0.4489858, -0.03464222, -1.037504, 1, 1, 1, 1, 1,
-0.448935, 0.05583326, -1.905897, 1, 1, 1, 1, 1,
-0.4489007, 0.9335427, -2.624164, 1, 1, 1, 1, 1,
-0.4488171, 1.807427, -0.063094, 0, 0, 1, 1, 1,
-0.448038, 1.222533, 0.6850564, 1, 0, 0, 1, 1,
-0.4460326, -1.107959, -2.526068, 1, 0, 0, 1, 1,
-0.4420431, -0.5392873, -2.866255, 1, 0, 0, 1, 1,
-0.4416171, 0.5620557, -0.1193366, 1, 0, 0, 1, 1,
-0.4414139, 0.1068982, -0.5890452, 1, 0, 0, 1, 1,
-0.4350569, 0.4189494, -0.00416027, 0, 0, 0, 1, 1,
-0.4304127, 0.2184531, -0.3982783, 0, 0, 0, 1, 1,
-0.4271945, 1.286926, -0.3883301, 0, 0, 0, 1, 1,
-0.4229544, 0.470703, -2.121723, 0, 0, 0, 1, 1,
-0.4212801, 0.1917111, -0.9280048, 0, 0, 0, 1, 1,
-0.4177339, 0.9659236, -2.040532, 0, 0, 0, 1, 1,
-0.4161145, -1.032274, -3.798612, 0, 0, 0, 1, 1,
-0.4156635, 1.757774, 0.3847025, 1, 1, 1, 1, 1,
-0.414653, -1.592049, -3.095079, 1, 1, 1, 1, 1,
-0.4099663, 0.6747115, -2.767918, 1, 1, 1, 1, 1,
-0.4071998, -2.124396, -2.661358, 1, 1, 1, 1, 1,
-0.4050627, 1.567914, -1.434325, 1, 1, 1, 1, 1,
-0.397903, 0.2123632, -1.330927, 1, 1, 1, 1, 1,
-0.3951322, -1.851032, -2.904893, 1, 1, 1, 1, 1,
-0.3926049, -0.02928013, -2.054576, 1, 1, 1, 1, 1,
-0.3915086, 0.004386853, -0.9641029, 1, 1, 1, 1, 1,
-0.3868558, 2.06573, 0.3587855, 1, 1, 1, 1, 1,
-0.3858965, -0.4747634, -3.295757, 1, 1, 1, 1, 1,
-0.3825921, -1.195479, -3.551522, 1, 1, 1, 1, 1,
-0.3795013, 0.9991897, 0.9638759, 1, 1, 1, 1, 1,
-0.3744958, 0.8306091, -0.4671173, 1, 1, 1, 1, 1,
-0.3744607, 0.2001866, -1.314566, 1, 1, 1, 1, 1,
-0.3732416, -0.5434788, -2.022926, 0, 0, 1, 1, 1,
-0.3689146, -1.405142, -3.147652, 1, 0, 0, 1, 1,
-0.3664449, -2.379672, -3.865786, 1, 0, 0, 1, 1,
-0.3622783, -1.076998, -2.563225, 1, 0, 0, 1, 1,
-0.3612294, -0.001023698, -1.542765, 1, 0, 0, 1, 1,
-0.3594266, 1.124785, -1.200888, 1, 0, 0, 1, 1,
-0.3592504, 1.091122, -0.2347784, 0, 0, 0, 1, 1,
-0.3558082, -0.6742564, -3.156272, 0, 0, 0, 1, 1,
-0.353785, -0.810851, -3.835221, 0, 0, 0, 1, 1,
-0.3494394, -0.09741932, -0.9072438, 0, 0, 0, 1, 1,
-0.3450748, 0.7483763, -0.5880717, 0, 0, 0, 1, 1,
-0.3445417, 1.013829, -0.4584015, 0, 0, 0, 1, 1,
-0.3426753, -0.331739, -2.655567, 0, 0, 0, 1, 1,
-0.3425359, -0.9942482, -2.787792, 1, 1, 1, 1, 1,
-0.3382607, -0.07002846, 0.1330071, 1, 1, 1, 1, 1,
-0.3372894, -1.552603, -5.588469, 1, 1, 1, 1, 1,
-0.3345221, -1.329051, -2.978425, 1, 1, 1, 1, 1,
-0.331914, -0.07851916, -2.161335, 1, 1, 1, 1, 1,
-0.3295715, 1.034264, -0.3932292, 1, 1, 1, 1, 1,
-0.3294795, 1.701051, -1.809832, 1, 1, 1, 1, 1,
-0.3282688, 1.06613, -0.2201428, 1, 1, 1, 1, 1,
-0.3268171, 0.9596624, -1.969164, 1, 1, 1, 1, 1,
-0.3264015, 1.895063, -0.469501, 1, 1, 1, 1, 1,
-0.3249205, 1.025215, -0.1290445, 1, 1, 1, 1, 1,
-0.3206765, 0.4892595, -0.8187572, 1, 1, 1, 1, 1,
-0.3199887, 0.8849034, -2.932226, 1, 1, 1, 1, 1,
-0.3184358, -0.2699059, -2.878711, 1, 1, 1, 1, 1,
-0.3171694, -0.2237684, -3.22121, 1, 1, 1, 1, 1,
-0.3170931, -0.6804579, -2.048989, 0, 0, 1, 1, 1,
-0.3133737, -0.6993302, -3.69166, 1, 0, 0, 1, 1,
-0.3120201, -2.144183, -4.038658, 1, 0, 0, 1, 1,
-0.3085685, -0.03394339, -0.2200885, 1, 0, 0, 1, 1,
-0.3047329, -0.6248294, -2.724986, 1, 0, 0, 1, 1,
-0.303774, 0.2342067, -1.183625, 1, 0, 0, 1, 1,
-0.3021164, -0.6688237, -2.749449, 0, 0, 0, 1, 1,
-0.2931752, -0.03579538, -1.97372, 0, 0, 0, 1, 1,
-0.2930109, 1.335641, -1.893796, 0, 0, 0, 1, 1,
-0.2924813, 0.9176046, 1.34146, 0, 0, 0, 1, 1,
-0.2922952, 1.323575, -1.46482, 0, 0, 0, 1, 1,
-0.2836968, 0.4162534, -1.560009, 0, 0, 0, 1, 1,
-0.270884, 0.5539593, 0.6031563, 0, 0, 0, 1, 1,
-0.2680582, -1.06786, -2.693038, 1, 1, 1, 1, 1,
-0.267487, 0.6325758, 1.052544, 1, 1, 1, 1, 1,
-0.2604597, -1.504579, -4.760403, 1, 1, 1, 1, 1,
-0.2578567, 0.5740243, -1.05148, 1, 1, 1, 1, 1,
-0.2513261, -0.7910581, -3.872639, 1, 1, 1, 1, 1,
-0.2507667, -0.7712955, -3.597898, 1, 1, 1, 1, 1,
-0.2507418, -0.8285315, -3.231937, 1, 1, 1, 1, 1,
-0.2483777, 0.03535796, -2.006544, 1, 1, 1, 1, 1,
-0.2426055, -0.9653839, -3.422777, 1, 1, 1, 1, 1,
-0.2417856, 2.469996, 1.494224, 1, 1, 1, 1, 1,
-0.2393378, -0.6538609, -3.386309, 1, 1, 1, 1, 1,
-0.2390361, 0.1730978, -0.3627211, 1, 1, 1, 1, 1,
-0.2389624, -0.001500307, 0.2808198, 1, 1, 1, 1, 1,
-0.2377489, -1.094677, -3.19897, 1, 1, 1, 1, 1,
-0.2335575, 1.038686, -1.15651, 1, 1, 1, 1, 1,
-0.2333537, 0.7581474, -0.6645434, 0, 0, 1, 1, 1,
-0.2285583, 0.4550067, -2.091751, 1, 0, 0, 1, 1,
-0.2265247, 0.2594042, -0.1816388, 1, 0, 0, 1, 1,
-0.2218285, 1.644469, -0.2115379, 1, 0, 0, 1, 1,
-0.2113755, 1.528436, -0.04911468, 1, 0, 0, 1, 1,
-0.2093738, -1.336587, -3.013541, 1, 0, 0, 1, 1,
-0.2069181, -0.5941165, -4.548502, 0, 0, 0, 1, 1,
-0.20659, -0.3055102, -3.003894, 0, 0, 0, 1, 1,
-0.200733, -1.18838, -3.512088, 0, 0, 0, 1, 1,
-0.1995248, 0.5172637, -1.159021, 0, 0, 0, 1, 1,
-0.1899427, -1.721847, -3.132335, 0, 0, 0, 1, 1,
-0.1888214, 0.5876728, 0.6656064, 0, 0, 0, 1, 1,
-0.1862358, -0.1756897, -0.6020542, 0, 0, 0, 1, 1,
-0.1843865, -0.3526439, -0.346718, 1, 1, 1, 1, 1,
-0.1815573, -0.02735313, -2.004933, 1, 1, 1, 1, 1,
-0.1776836, -0.5565014, -3.502284, 1, 1, 1, 1, 1,
-0.1755108, -0.3515433, -3.575932, 1, 1, 1, 1, 1,
-0.1713315, -0.1319621, -2.948719, 1, 1, 1, 1, 1,
-0.1712697, -0.871911, -1.182922, 1, 1, 1, 1, 1,
-0.1698374, 0.654577, -0.7109393, 1, 1, 1, 1, 1,
-0.168685, 0.02144349, -0.2023649, 1, 1, 1, 1, 1,
-0.167079, -0.09088062, -1.556809, 1, 1, 1, 1, 1,
-0.1626138, 1.402637, 0.6534524, 1, 1, 1, 1, 1,
-0.1624058, -1.177395, -2.31446, 1, 1, 1, 1, 1,
-0.1602577, 1.556883, 1.481601, 1, 1, 1, 1, 1,
-0.1582922, -0.2477459, -2.748782, 1, 1, 1, 1, 1,
-0.1579577, -0.05537513, -1.836617, 1, 1, 1, 1, 1,
-0.1570396, -0.3704982, -2.553871, 1, 1, 1, 1, 1,
-0.1562364, 0.5458866, 1.119025, 0, 0, 1, 1, 1,
-0.1554247, 0.3120153, -0.02273685, 1, 0, 0, 1, 1,
-0.1531039, 1.655437, 2.180582, 1, 0, 0, 1, 1,
-0.1530428, 0.3187105, -0.9931798, 1, 0, 0, 1, 1,
-0.1510069, -1.288013, -5.146362, 1, 0, 0, 1, 1,
-0.1496028, -1.43507, -3.892148, 1, 0, 0, 1, 1,
-0.1494799, 1.38206, 0.1534647, 0, 0, 0, 1, 1,
-0.1490452, 0.2542849, -0.2195608, 0, 0, 0, 1, 1,
-0.1489453, 1.11078, -0.6572182, 0, 0, 0, 1, 1,
-0.1488201, -0.8126697, -3.468942, 0, 0, 0, 1, 1,
-0.1439043, -0.2349935, -2.571171, 0, 0, 0, 1, 1,
-0.1433924, -0.5621752, -2.210455, 0, 0, 0, 1, 1,
-0.1430056, 1.658882, -0.8053043, 0, 0, 0, 1, 1,
-0.1421308, -0.1141505, -2.098546, 1, 1, 1, 1, 1,
-0.1419973, -0.6676432, -2.857869, 1, 1, 1, 1, 1,
-0.1418959, -0.2093019, -3.938501, 1, 1, 1, 1, 1,
-0.1394914, -0.7898654, -1.479095, 1, 1, 1, 1, 1,
-0.1381705, -2.51798, -4.211152, 1, 1, 1, 1, 1,
-0.1322161, 0.4182419, 0.1937342, 1, 1, 1, 1, 1,
-0.1308048, -0.5888079, -2.578197, 1, 1, 1, 1, 1,
-0.1222079, 0.7153145, 0.6830153, 1, 1, 1, 1, 1,
-0.1200385, -0.233402, -2.440315, 1, 1, 1, 1, 1,
-0.1139656, 0.7539384, -0.150632, 1, 1, 1, 1, 1,
-0.1138261, -1.291429, -1.631521, 1, 1, 1, 1, 1,
-0.1138121, -0.7074617, -2.165045, 1, 1, 1, 1, 1,
-0.1006324, -0.5966842, -2.742992, 1, 1, 1, 1, 1,
-0.1001891, -0.4435475, -3.0393, 1, 1, 1, 1, 1,
-0.09833775, 0.07692405, -0.1801657, 1, 1, 1, 1, 1,
-0.09354775, -2.14133, -4.014737, 0, 0, 1, 1, 1,
-0.09256244, -0.3405848, -2.386867, 1, 0, 0, 1, 1,
-0.08506005, 0.8222814, 0.1589957, 1, 0, 0, 1, 1,
-0.08296663, -0.9086416, -4.021019, 1, 0, 0, 1, 1,
-0.07990928, 0.08472758, -0.3888982, 1, 0, 0, 1, 1,
-0.07679876, -0.9179645, -1.774577, 1, 0, 0, 1, 1,
-0.07624762, 1.610625, 1.368005, 0, 0, 0, 1, 1,
-0.06706005, -0.4092492, -3.45055, 0, 0, 0, 1, 1,
-0.06319516, -1.04511, -2.071897, 0, 0, 0, 1, 1,
-0.06255092, 2.527569, 0.04577537, 0, 0, 0, 1, 1,
-0.05579939, -0.1446155, -4.879611, 0, 0, 0, 1, 1,
-0.05444128, 0.6168841, -0.8199062, 0, 0, 0, 1, 1,
-0.05431172, 0.5993122, -0.03465522, 0, 0, 0, 1, 1,
-0.04798174, -1.422869, -1.592888, 1, 1, 1, 1, 1,
-0.04704644, -0.2304581, -3.284849, 1, 1, 1, 1, 1,
-0.04526004, 0.707625, 1.816761, 1, 1, 1, 1, 1,
-0.04479125, 0.608581, -0.09112464, 1, 1, 1, 1, 1,
-0.03018871, 0.9580267, 1.575469, 1, 1, 1, 1, 1,
-0.02935542, -1.366127, -1.238572, 1, 1, 1, 1, 1,
-0.02504658, 0.8779738, 0.3278016, 1, 1, 1, 1, 1,
-0.02271188, 0.2500858, 0.33054, 1, 1, 1, 1, 1,
-0.02265803, -0.4496795, -4.223682, 1, 1, 1, 1, 1,
-0.02043202, -0.5179855, -3.087281, 1, 1, 1, 1, 1,
-0.01296636, -1.480532, -3.134113, 1, 1, 1, 1, 1,
-0.0128274, -0.4937999, -0.6292979, 1, 1, 1, 1, 1,
-0.01265193, 0.8743345, -0.6947268, 1, 1, 1, 1, 1,
-0.001502762, 0.691582, 0.762516, 1, 1, 1, 1, 1,
0.001322443, 1.127032, -1.103849, 1, 1, 1, 1, 1,
0.006369441, 0.7343524, -0.7894117, 0, 0, 1, 1, 1,
0.008395752, 0.665852, 0.1329972, 1, 0, 0, 1, 1,
0.01426276, 1.396134, -1.225191, 1, 0, 0, 1, 1,
0.02382527, -0.8252838, 3.025617, 1, 0, 0, 1, 1,
0.03181342, 0.1607928, 0.7144279, 1, 0, 0, 1, 1,
0.03366897, -0.9861003, 4.297647, 1, 0, 0, 1, 1,
0.04296242, 1.067343, -2.141119, 0, 0, 0, 1, 1,
0.04319425, -2.316772, 4.985211, 0, 0, 0, 1, 1,
0.04348383, -0.7655217, 3.842279, 0, 0, 0, 1, 1,
0.05123154, -1.195837, 5.023182, 0, 0, 0, 1, 1,
0.05497434, 0.6587964, 2.550815, 0, 0, 0, 1, 1,
0.05924904, -0.4538987, 2.537821, 0, 0, 0, 1, 1,
0.0609387, -1.988691, 4.338153, 0, 0, 0, 1, 1,
0.0612695, 0.02834751, 1.651068, 1, 1, 1, 1, 1,
0.06161055, -0.2413832, 3.360571, 1, 1, 1, 1, 1,
0.0617521, 0.0218191, 1.662099, 1, 1, 1, 1, 1,
0.06685937, 0.7990742, -0.120156, 1, 1, 1, 1, 1,
0.06831194, 0.9299049, -1.107848, 1, 1, 1, 1, 1,
0.07592481, 1.534764, -1.287865, 1, 1, 1, 1, 1,
0.07618038, 1.695962, 0.4031801, 1, 1, 1, 1, 1,
0.07673415, -0.1983443, 1.818495, 1, 1, 1, 1, 1,
0.07923901, -0.94091, 4.042159, 1, 1, 1, 1, 1,
0.08270457, -0.5534685, 3.626867, 1, 1, 1, 1, 1,
0.08513688, -1.141032, 1.346301, 1, 1, 1, 1, 1,
0.09063652, -0.1518801, 0.6708262, 1, 1, 1, 1, 1,
0.09085448, -2.250136, 4.223953, 1, 1, 1, 1, 1,
0.09172002, 0.4711367, -0.9163083, 1, 1, 1, 1, 1,
0.09684187, -0.3352656, 2.56624, 1, 1, 1, 1, 1,
0.09825013, 0.9758725, 2.668942, 0, 0, 1, 1, 1,
0.09922581, -0.3926146, 2.567271, 1, 0, 0, 1, 1,
0.1017927, -0.3673694, 2.982658, 1, 0, 0, 1, 1,
0.1052043, -1.129164, 2.434056, 1, 0, 0, 1, 1,
0.1105103, 0.2008292, 0.5203615, 1, 0, 0, 1, 1,
0.1105652, 0.1062574, 0.9194126, 1, 0, 0, 1, 1,
0.1111466, 0.9847251, -1.47399, 0, 0, 0, 1, 1,
0.1135165, 0.8123586, -0.2146948, 0, 0, 0, 1, 1,
0.1140456, 0.38019, -0.4446109, 0, 0, 0, 1, 1,
0.1142547, 1.038141, 0.2488541, 0, 0, 0, 1, 1,
0.1159448, 1.838242, -1.185618, 0, 0, 0, 1, 1,
0.1178782, 1.164774, -0.3681103, 0, 0, 0, 1, 1,
0.1182811, -1.166545, 3.410533, 0, 0, 0, 1, 1,
0.120293, 0.8625627, -0.4060509, 1, 1, 1, 1, 1,
0.12682, -1.167979, 3.083169, 1, 1, 1, 1, 1,
0.1270708, -0.9171711, 2.679057, 1, 1, 1, 1, 1,
0.1278366, 0.2509411, 1.377194, 1, 1, 1, 1, 1,
0.1291881, 0.1310674, -0.08457683, 1, 1, 1, 1, 1,
0.1317887, -2.060544, 2.200511, 1, 1, 1, 1, 1,
0.1335547, -1.076035, 4.065274, 1, 1, 1, 1, 1,
0.1342678, -1.233266, 3.399456, 1, 1, 1, 1, 1,
0.1370169, -0.6544102, 3.756481, 1, 1, 1, 1, 1,
0.1376359, -0.2757114, 5.366837, 1, 1, 1, 1, 1,
0.1396601, -0.3923531, 1.541985, 1, 1, 1, 1, 1,
0.1396713, 0.8469337, 0.8669514, 1, 1, 1, 1, 1,
0.1404795, 0.3532758, 2.226275, 1, 1, 1, 1, 1,
0.1410172, -0.4669468, 0.3313287, 1, 1, 1, 1, 1,
0.142649, -0.4335447, 1.331153, 1, 1, 1, 1, 1,
0.1435595, -0.9376172, 1.328976, 0, 0, 1, 1, 1,
0.1496838, 1.31582, 1.630865, 1, 0, 0, 1, 1,
0.1505071, -1.13948, 2.553016, 1, 0, 0, 1, 1,
0.1516398, -1.769701, 3.282164, 1, 0, 0, 1, 1,
0.1519229, 0.03289269, 0.8015038, 1, 0, 0, 1, 1,
0.1538341, -0.1325872, 0.7602255, 1, 0, 0, 1, 1,
0.1546401, -0.2015656, 2.369668, 0, 0, 0, 1, 1,
0.1571714, 0.8459505, -1.96199, 0, 0, 0, 1, 1,
0.1578029, 1.66929, 0.7418752, 0, 0, 0, 1, 1,
0.1602961, 0.3645608, 0.3884526, 0, 0, 0, 1, 1,
0.162525, -1.736342, 2.7451, 0, 0, 0, 1, 1,
0.1658411, 0.1140159, 1.623192, 0, 0, 0, 1, 1,
0.1682635, -0.7052128, 4.400563, 0, 0, 0, 1, 1,
0.1689886, 0.1947322, 2.438622, 1, 1, 1, 1, 1,
0.1693774, 0.1070175, -0.2805085, 1, 1, 1, 1, 1,
0.1700034, 0.4093812, 1.137628, 1, 1, 1, 1, 1,
0.1702152, 0.3481334, -1.358843, 1, 1, 1, 1, 1,
0.1722962, -0.5509889, 3.357648, 1, 1, 1, 1, 1,
0.1730687, -1.598819, 1.938976, 1, 1, 1, 1, 1,
0.1742982, 0.2453731, -0.4736965, 1, 1, 1, 1, 1,
0.176769, 0.1544128, 1.557616, 1, 1, 1, 1, 1,
0.1775221, 1.304295, 0.6379284, 1, 1, 1, 1, 1,
0.1794075, -0.6317182, 1.377694, 1, 1, 1, 1, 1,
0.1817989, -0.5366103, 2.934241, 1, 1, 1, 1, 1,
0.1842558, 1.165394, 1.502696, 1, 1, 1, 1, 1,
0.1920894, -1.184131, 2.420561, 1, 1, 1, 1, 1,
0.1927942, 1.858798, 0.06008094, 1, 1, 1, 1, 1,
0.1965709, 0.1503232, 0.8341798, 1, 1, 1, 1, 1,
0.1979991, 0.4324858, 1.128769, 0, 0, 1, 1, 1,
0.2074836, -0.09157673, -0.1458588, 1, 0, 0, 1, 1,
0.2121947, -0.6996096, 2.49786, 1, 0, 0, 1, 1,
0.2203241, 0.2733626, 0.4044428, 1, 0, 0, 1, 1,
0.2267769, -0.1820906, 1.624551, 1, 0, 0, 1, 1,
0.2294981, 0.636262, 1.034801, 1, 0, 0, 1, 1,
0.2342479, 0.8437799, 0.4343243, 0, 0, 0, 1, 1,
0.2407654, -1.026516, 2.902862, 0, 0, 0, 1, 1,
0.2408196, 0.470659, 0.01455769, 0, 0, 0, 1, 1,
0.2424441, -2.064193, 4.41711, 0, 0, 0, 1, 1,
0.2460634, 1.511764, -0.1249554, 0, 0, 0, 1, 1,
0.2511215, 2.451816, -0.7470007, 0, 0, 0, 1, 1,
0.2515314, 0.1361967, 1.408533, 0, 0, 0, 1, 1,
0.2522102, -0.4033255, 2.343646, 1, 1, 1, 1, 1,
0.25445, 0.2282322, 0.6259759, 1, 1, 1, 1, 1,
0.2555074, 1.150173, -0.1006532, 1, 1, 1, 1, 1,
0.2564494, 0.3926151, 0.5348912, 1, 1, 1, 1, 1,
0.2588434, -1.310696, 3.780589, 1, 1, 1, 1, 1,
0.2598572, -1.116111, 3.1373, 1, 1, 1, 1, 1,
0.2609636, 0.08963911, 0.9237055, 1, 1, 1, 1, 1,
0.2613855, 0.1898185, 0.048488, 1, 1, 1, 1, 1,
0.2620794, 1.757675, -1.049656, 1, 1, 1, 1, 1,
0.2659449, 2.258509, -2.08802, 1, 1, 1, 1, 1,
0.2721108, -1.023665, 0.5990799, 1, 1, 1, 1, 1,
0.2733265, 1.358242, -0.2788999, 1, 1, 1, 1, 1,
0.2750421, 0.9027785, 0.144816, 1, 1, 1, 1, 1,
0.2838953, 1.150779, 0.8544189, 1, 1, 1, 1, 1,
0.2871446, 0.4358267, -1.123254, 1, 1, 1, 1, 1,
0.2943052, -1.574765, 4.863992, 0, 0, 1, 1, 1,
0.2970249, -2.095852, 3.447717, 1, 0, 0, 1, 1,
0.2981076, -1.134373, 3.97858, 1, 0, 0, 1, 1,
0.3000154, -1.244527, 2.013761, 1, 0, 0, 1, 1,
0.301876, 0.6126541, 1.092068, 1, 0, 0, 1, 1,
0.3208374, -0.7617157, 1.722864, 1, 0, 0, 1, 1,
0.3219899, -0.2522546, 3.031334, 0, 0, 0, 1, 1,
0.3223863, 0.1618511, 3.11957, 0, 0, 0, 1, 1,
0.3238501, -0.0219279, 0.821272, 0, 0, 0, 1, 1,
0.3249875, 0.2122211, -0.2996476, 0, 0, 0, 1, 1,
0.3263597, -1.477119, 2.362456, 0, 0, 0, 1, 1,
0.3271506, -1.87539, 3.622283, 0, 0, 0, 1, 1,
0.330834, 0.6009203, 0.6635728, 0, 0, 0, 1, 1,
0.3314418, 1.241176, 0.6725607, 1, 1, 1, 1, 1,
0.3340264, -0.4032502, 3.993868, 1, 1, 1, 1, 1,
0.3342391, -1.842272, 4.676675, 1, 1, 1, 1, 1,
0.3378103, 0.694118, 1.571151, 1, 1, 1, 1, 1,
0.3410442, 1.840761, -1.289444, 1, 1, 1, 1, 1,
0.3453891, 0.5810423, 0.3714525, 1, 1, 1, 1, 1,
0.3497196, 0.7707442, 0.3667692, 1, 1, 1, 1, 1,
0.3521044, -0.5769397, 2.292746, 1, 1, 1, 1, 1,
0.3522485, -0.8312097, 3.226546, 1, 1, 1, 1, 1,
0.3651148, 0.828265, -0.03757266, 1, 1, 1, 1, 1,
0.3674986, -0.9706699, 2.090847, 1, 1, 1, 1, 1,
0.3703868, -0.6524995, 2.307569, 1, 1, 1, 1, 1,
0.3713208, -0.9471276, 2.845504, 1, 1, 1, 1, 1,
0.3724726, 0.08936663, -0.4443586, 1, 1, 1, 1, 1,
0.3751435, 0.2851556, 0.9987298, 1, 1, 1, 1, 1,
0.3780261, -0.9430987, 2.870818, 0, 0, 1, 1, 1,
0.3807886, -0.85256, 2.556339, 1, 0, 0, 1, 1,
0.3822169, 0.3465005, -0.1232122, 1, 0, 0, 1, 1,
0.3823756, -0.8976801, 2.248118, 1, 0, 0, 1, 1,
0.3844087, -1.742088, 2.637001, 1, 0, 0, 1, 1,
0.3871506, -0.3604534, 2.112064, 1, 0, 0, 1, 1,
0.390302, -0.8057722, 3.718015, 0, 0, 0, 1, 1,
0.3918313, 0.7813746, 0.1632342, 0, 0, 0, 1, 1,
0.3930583, -0.572204, 0.7878628, 0, 0, 0, 1, 1,
0.3934579, 0.3915291, -1.579336, 0, 0, 0, 1, 1,
0.393656, 0.1743113, 1.907749, 0, 0, 0, 1, 1,
0.3968007, 1.026022, 0.04395861, 0, 0, 0, 1, 1,
0.3986113, 0.5735827, 1.625184, 0, 0, 0, 1, 1,
0.3994377, -0.7588819, 3.939524, 1, 1, 1, 1, 1,
0.4021134, -0.3423698, 1.994442, 1, 1, 1, 1, 1,
0.4022888, 1.182833, 1.197989, 1, 1, 1, 1, 1,
0.4094227, 0.3972987, 0.521715, 1, 1, 1, 1, 1,
0.4101939, -0.463921, 0.6125752, 1, 1, 1, 1, 1,
0.4148149, 0.3195443, 1.637799, 1, 1, 1, 1, 1,
0.4163726, -0.07501499, 2.311567, 1, 1, 1, 1, 1,
0.4261183, 0.3098128, 2.065208, 1, 1, 1, 1, 1,
0.4268003, 0.6205139, 0.8051368, 1, 1, 1, 1, 1,
0.4312604, 0.339933, 0.9613051, 1, 1, 1, 1, 1,
0.4314302, 0.207901, 1.087917, 1, 1, 1, 1, 1,
0.43278, 1.86031, -0.1942331, 1, 1, 1, 1, 1,
0.4394526, -1.325889, 2.10614, 1, 1, 1, 1, 1,
0.4414972, -0.7318434, 2.116304, 1, 1, 1, 1, 1,
0.4436496, -0.1964575, 1.329646, 1, 1, 1, 1, 1,
0.444029, -1.602898, 1.523662, 0, 0, 1, 1, 1,
0.446572, -0.6737252, 2.426382, 1, 0, 0, 1, 1,
0.449052, -0.3573986, 2.785951, 1, 0, 0, 1, 1,
0.4494008, -0.9087523, 2.017144, 1, 0, 0, 1, 1,
0.4542409, -0.6764919, 1.7619, 1, 0, 0, 1, 1,
0.4546965, 0.3880775, 1.376233, 1, 0, 0, 1, 1,
0.4548711, -0.5330037, 1.64955, 0, 0, 0, 1, 1,
0.4636537, 1.647584, 0.2297135, 0, 0, 0, 1, 1,
0.4648786, 1.540732, 1.523505, 0, 0, 0, 1, 1,
0.4651025, -2.073028, 2.987307, 0, 0, 0, 1, 1,
0.4662236, 0.4969377, 2.075707, 0, 0, 0, 1, 1,
0.4694994, 0.01636337, 1.978569, 0, 0, 0, 1, 1,
0.471942, 0.04803997, 1.450276, 0, 0, 0, 1, 1,
0.4724275, 0.9621545, 0.9292098, 1, 1, 1, 1, 1,
0.4806566, 1.572076, -0.6369361, 1, 1, 1, 1, 1,
0.4856895, -1.635191, 3.311795, 1, 1, 1, 1, 1,
0.4869141, -0.6563342, 3.078735, 1, 1, 1, 1, 1,
0.494385, 1.07323, 0.7676519, 1, 1, 1, 1, 1,
0.4947889, 0.1088995, 0.6811041, 1, 1, 1, 1, 1,
0.50253, 0.8946022, 0.5572132, 1, 1, 1, 1, 1,
0.5089741, 1.642752, 2.173639, 1, 1, 1, 1, 1,
0.510843, 2.942231, -0.7460281, 1, 1, 1, 1, 1,
0.519908, -0.3240306, 2.801185, 1, 1, 1, 1, 1,
0.5207584, 0.8195992, 1.447627, 1, 1, 1, 1, 1,
0.5219175, -0.7249928, 1.763563, 1, 1, 1, 1, 1,
0.526953, -1.58812, 2.153589, 1, 1, 1, 1, 1,
0.5290127, -0.1295603, -0.1729634, 1, 1, 1, 1, 1,
0.5325547, -0.9703162, 3.566433, 1, 1, 1, 1, 1,
0.5342116, -1.581463, 1.442923, 0, 0, 1, 1, 1,
0.5351062, 1.670982, -0.03317118, 1, 0, 0, 1, 1,
0.5406064, -0.7450472, 4.651433, 1, 0, 0, 1, 1,
0.5423475, 0.564157, 1.691128, 1, 0, 0, 1, 1,
0.5448784, 0.4415288, 1.234437, 1, 0, 0, 1, 1,
0.5479547, -0.3182371, 4.983887, 1, 0, 0, 1, 1,
0.5593134, -0.03900383, 0.9630331, 0, 0, 0, 1, 1,
0.5606371, 0.2490682, 0.5590215, 0, 0, 0, 1, 1,
0.5616273, -1.529535, 1.84429, 0, 0, 0, 1, 1,
0.5705829, 1.083342, 0.60291, 0, 0, 0, 1, 1,
0.5736402, -0.7777845, 0.5623752, 0, 0, 0, 1, 1,
0.5796397, 1.169609, -0.1220627, 0, 0, 0, 1, 1,
0.5827395, -0.6192113, 1.52199, 0, 0, 0, 1, 1,
0.5853303, 0.2096836, 0.3535349, 1, 1, 1, 1, 1,
0.5870827, 1.188833, 1.611027, 1, 1, 1, 1, 1,
0.5884221, 0.995989, 1.720942, 1, 1, 1, 1, 1,
0.5921358, -0.2092918, 2.53414, 1, 1, 1, 1, 1,
0.5927894, -0.7126253, 2.702832, 1, 1, 1, 1, 1,
0.5933037, 0.1271856, 0.840838, 1, 1, 1, 1, 1,
0.5935576, -0.9738192, 3.060087, 1, 1, 1, 1, 1,
0.5941477, -1.488958, 2.104404, 1, 1, 1, 1, 1,
0.5961815, -1.931416, 2.730037, 1, 1, 1, 1, 1,
0.5989528, -1.608131, 2.985696, 1, 1, 1, 1, 1,
0.6000611, 0.5091374, 0.7403238, 1, 1, 1, 1, 1,
0.6009867, -1.196785, 2.520554, 1, 1, 1, 1, 1,
0.6050559, -0.5804906, 3.230536, 1, 1, 1, 1, 1,
0.6084843, -0.3861724, 2.977998, 1, 1, 1, 1, 1,
0.6097924, 1.320088, 1.406755, 1, 1, 1, 1, 1,
0.6157569, 0.7964497, -0.7099504, 0, 0, 1, 1, 1,
0.6164104, 1.127614, -0.8571959, 1, 0, 0, 1, 1,
0.6205432, -1.815243, 3.629699, 1, 0, 0, 1, 1,
0.6254987, 0.08281878, 4.116234, 1, 0, 0, 1, 1,
0.6258014, -0.3101862, 3.406048, 1, 0, 0, 1, 1,
0.6307678, 2.218706, 2.160071, 1, 0, 0, 1, 1,
0.635803, -1.0226, 1.432768, 0, 0, 0, 1, 1,
0.637692, 2.207706, 1.078443, 0, 0, 0, 1, 1,
0.6380738, -0.04698079, 2.238307, 0, 0, 0, 1, 1,
0.6410933, 1.119961, 1.360683, 0, 0, 0, 1, 1,
0.644249, -2.240941, 3.121143, 0, 0, 0, 1, 1,
0.6447641, 0.2353842, 0.6878867, 0, 0, 0, 1, 1,
0.6474776, 1.025411, -0.03986241, 0, 0, 0, 1, 1,
0.6480634, -0.8777051, 2.873668, 1, 1, 1, 1, 1,
0.6487026, -0.2725089, 2.008682, 1, 1, 1, 1, 1,
0.6549059, 1.24223, -1.063304, 1, 1, 1, 1, 1,
0.6593899, -0.6711839, 2.011132, 1, 1, 1, 1, 1,
0.6595192, -0.5120809, 3.251001, 1, 1, 1, 1, 1,
0.6676819, 0.4978343, 0.5092676, 1, 1, 1, 1, 1,
0.6717295, 0.6837233, 1.680876, 1, 1, 1, 1, 1,
0.6723286, -1.138151, 3.091968, 1, 1, 1, 1, 1,
0.6723906, 0.2601615, 2.017926, 1, 1, 1, 1, 1,
0.674605, 0.1100165, 2.260912, 1, 1, 1, 1, 1,
0.6754274, -0.08357134, 1.631496, 1, 1, 1, 1, 1,
0.6781387, -0.009728625, 3.014578, 1, 1, 1, 1, 1,
0.6819864, 0.8004, -1.348814, 1, 1, 1, 1, 1,
0.6828141, -0.406336, 1.435754, 1, 1, 1, 1, 1,
0.6859958, -1.170925, 2.659835, 1, 1, 1, 1, 1,
0.687478, -0.223173, 1.618286, 0, 0, 1, 1, 1,
0.6880934, -0.9890894, 1.622132, 1, 0, 0, 1, 1,
0.6919748, 0.4755849, 1.955001, 1, 0, 0, 1, 1,
0.6964101, 0.6292116, -0.5654108, 1, 0, 0, 1, 1,
0.6992112, 1.106197, -0.1313486, 1, 0, 0, 1, 1,
0.7007869, 0.3326198, 1.189419, 1, 0, 0, 1, 1,
0.7018011, -1.900033, 2.567466, 0, 0, 0, 1, 1,
0.7112644, -0.6244867, 2.708205, 0, 0, 0, 1, 1,
0.7147723, -0.7837694, 1.600488, 0, 0, 0, 1, 1,
0.7161447, 0.1308767, 2.002877, 0, 0, 0, 1, 1,
0.717532, -0.08633593, 1.435748, 0, 0, 0, 1, 1,
0.7189565, -0.2743855, 1.877241, 0, 0, 0, 1, 1,
0.7247463, 0.0540905, 0.9494538, 0, 0, 0, 1, 1,
0.7264504, 0.2869255, 0.8053929, 1, 1, 1, 1, 1,
0.7302964, 0.02840521, 2.548438, 1, 1, 1, 1, 1,
0.7414117, 0.82809, -0.9360333, 1, 1, 1, 1, 1,
0.7497681, 0.157154, -0.1949088, 1, 1, 1, 1, 1,
0.7567683, -0.6782294, 2.33737, 1, 1, 1, 1, 1,
0.7596518, 0.2621282, 2.582807, 1, 1, 1, 1, 1,
0.7605929, -0.4486474, 2.636631, 1, 1, 1, 1, 1,
0.7652058, -0.7976448, 3.274688, 1, 1, 1, 1, 1,
0.7714263, -0.5356345, 2.718628, 1, 1, 1, 1, 1,
0.7748871, 0.1646733, 2.296005, 1, 1, 1, 1, 1,
0.775162, 0.7720926, 1.933175, 1, 1, 1, 1, 1,
0.7813879, -0.008006509, 1.640555, 1, 1, 1, 1, 1,
0.7827256, 0.9263719, -0.1353822, 1, 1, 1, 1, 1,
0.7828709, -0.008619798, 1.586828, 1, 1, 1, 1, 1,
0.7834023, 0.8016722, 0.2212357, 1, 1, 1, 1, 1,
0.7837782, 1.554809, 0.4539467, 0, 0, 1, 1, 1,
0.7851442, 0.1509974, 1.920079, 1, 0, 0, 1, 1,
0.7868234, 0.1292466, 0.2520772, 1, 0, 0, 1, 1,
0.7890679, 0.9491014, 0.08930767, 1, 0, 0, 1, 1,
0.7892576, 0.8657291, -0.4767576, 1, 0, 0, 1, 1,
0.7917085, -0.5772806, 2.846296, 1, 0, 0, 1, 1,
0.792735, 2.711367, 1.459408, 0, 0, 0, 1, 1,
0.7974524, 0.1552683, 2.752856, 0, 0, 0, 1, 1,
0.8099375, -0.599503, 3.036856, 0, 0, 0, 1, 1,
0.8114232, 0.7659124, 2.132616, 0, 0, 0, 1, 1,
0.8122203, -0.1024978, 0.1930134, 0, 0, 0, 1, 1,
0.8195462, 0.3695032, 1.806097, 0, 0, 0, 1, 1,
0.8224667, -0.511287, 3.191542, 0, 0, 0, 1, 1,
0.8255203, -0.6988032, 1.763456, 1, 1, 1, 1, 1,
0.8300786, 0.2720638, 1.119798, 1, 1, 1, 1, 1,
0.8311588, 1.947363, -1.554797, 1, 1, 1, 1, 1,
0.833634, -1.909674, 3.685564, 1, 1, 1, 1, 1,
0.8464231, 0.9618989, 1.751425, 1, 1, 1, 1, 1,
0.8484392, -1.519799, 3.327876, 1, 1, 1, 1, 1,
0.8551714, 0.7386096, 0.6876408, 1, 1, 1, 1, 1,
0.8574829, -0.1633218, -0.6360263, 1, 1, 1, 1, 1,
0.8606625, 1.651363, 1.957201, 1, 1, 1, 1, 1,
0.8633578, -0.4613299, 2.553015, 1, 1, 1, 1, 1,
0.8641253, -0.1256495, 0.4832789, 1, 1, 1, 1, 1,
0.8644761, -0.2263059, 1.231248, 1, 1, 1, 1, 1,
0.8709278, -0.8974344, 4.01661, 1, 1, 1, 1, 1,
0.8773143, -1.585429, 2.643291, 1, 1, 1, 1, 1,
0.8773937, 0.4006138, 0.4672287, 1, 1, 1, 1, 1,
0.8804048, -1.348575, 1.995451, 0, 0, 1, 1, 1,
0.8860114, -1.107081, 1.028162, 1, 0, 0, 1, 1,
0.8890586, -0.9473314, 2.867557, 1, 0, 0, 1, 1,
0.8904417, 1.1862, 0.2436123, 1, 0, 0, 1, 1,
0.891308, -1.886518, 2.116703, 1, 0, 0, 1, 1,
0.8934379, 1.297433, 0.5010163, 1, 0, 0, 1, 1,
0.8967083, 1.885782, 0.04121066, 0, 0, 0, 1, 1,
0.9034424, -0.5218516, 1.092315, 0, 0, 0, 1, 1,
0.910853, -0.3706579, 5.001577, 0, 0, 0, 1, 1,
0.9114489, -0.740047, 4.809387, 0, 0, 0, 1, 1,
0.9183326, -1.479599, 2.595476, 0, 0, 0, 1, 1,
0.9204113, 0.4758903, 0.7820727, 0, 0, 0, 1, 1,
0.9217671, 0.7899259, 2.29094, 0, 0, 0, 1, 1,
0.9219926, -2.019938, 2.737074, 1, 1, 1, 1, 1,
0.9254169, -1.515004, 1.664046, 1, 1, 1, 1, 1,
0.9265124, 2.452718, 0.5115267, 1, 1, 1, 1, 1,
0.9313722, -0.7281104, 3.435966, 1, 1, 1, 1, 1,
0.9314004, 0.4926465, 0.6066194, 1, 1, 1, 1, 1,
0.9387358, -1.232984, 3.243836, 1, 1, 1, 1, 1,
0.941626, -0.9027226, 2.441013, 1, 1, 1, 1, 1,
0.9436023, -0.8437929, 2.303675, 1, 1, 1, 1, 1,
0.9449664, -0.1122912, 0.2758003, 1, 1, 1, 1, 1,
0.9502237, 1.084474, 2.224231, 1, 1, 1, 1, 1,
0.954046, 0.816433, 0.785024, 1, 1, 1, 1, 1,
0.9588017, -0.4538004, 1.812531, 1, 1, 1, 1, 1,
0.9715425, 2.177694, 0.0403869, 1, 1, 1, 1, 1,
0.9781808, -0.3167858, 2.513715, 1, 1, 1, 1, 1,
0.9818323, 0.1246216, 3.396952, 1, 1, 1, 1, 1,
0.9850216, -0.3961022, 1.661708, 0, 0, 1, 1, 1,
0.9855195, 0.1191418, -0.2596653, 1, 0, 0, 1, 1,
0.9885578, -2.349064, 2.465215, 1, 0, 0, 1, 1,
0.9901356, -0.4984427, 2.92552, 1, 0, 0, 1, 1,
1.000352, -0.4125477, -0.07807285, 1, 0, 0, 1, 1,
1.002283, -1.047434, 0.5940671, 1, 0, 0, 1, 1,
1.009678, -2.966524, 0.8731629, 0, 0, 0, 1, 1,
1.010449, 1.932673, -0.3016707, 0, 0, 0, 1, 1,
1.016128, -0.173872, 2.848041, 0, 0, 0, 1, 1,
1.025431, -0.504042, 2.899908, 0, 0, 0, 1, 1,
1.027218, -1.852152, 2.539702, 0, 0, 0, 1, 1,
1.02924, -0.4988563, 0.3994518, 0, 0, 0, 1, 1,
1.029787, 0.2253074, 0.6410774, 0, 0, 0, 1, 1,
1.03259, -1.041233, 3.512609, 1, 1, 1, 1, 1,
1.034193, 1.973409, -0.2831851, 1, 1, 1, 1, 1,
1.035139, 0.0820396, 0.6749777, 1, 1, 1, 1, 1,
1.036202, 0.3045439, 0.8621057, 1, 1, 1, 1, 1,
1.03927, -0.6153432, 2.920055, 1, 1, 1, 1, 1,
1.055107, 2.049796, 1.588723, 1, 1, 1, 1, 1,
1.05553, 0.3311972, 0.1720577, 1, 1, 1, 1, 1,
1.060839, 0.2575624, 1.433741, 1, 1, 1, 1, 1,
1.065793, 1.251967, 0.03642497, 1, 1, 1, 1, 1,
1.065793, 1.469309, 0.2572273, 1, 1, 1, 1, 1,
1.070282, 0.8701251, 2.915457, 1, 1, 1, 1, 1,
1.072439, 1.774067, 1.416477, 1, 1, 1, 1, 1,
1.081484, -0.1239248, 4.055521, 1, 1, 1, 1, 1,
1.102522, 1.078436, 0.7804965, 1, 1, 1, 1, 1,
1.109356, -0.5013962, 3.271686, 1, 1, 1, 1, 1,
1.11652, -0.5155085, -0.264802, 0, 0, 1, 1, 1,
1.120024, -0.1271325, 1.956962, 1, 0, 0, 1, 1,
1.126053, 0.5556784, 0.5530902, 1, 0, 0, 1, 1,
1.127948, -0.733386, 2.488375, 1, 0, 0, 1, 1,
1.130916, 0.8895141, -0.9029326, 1, 0, 0, 1, 1,
1.132483, -0.1021191, 1.832568, 1, 0, 0, 1, 1,
1.138173, 1.73854, -0.004988029, 0, 0, 0, 1, 1,
1.138284, -1.183271, 2.475659, 0, 0, 0, 1, 1,
1.13886, 2.498624, 1.30015, 0, 0, 0, 1, 1,
1.14932, 0.5207995, 2.144087, 0, 0, 0, 1, 1,
1.156108, 0.003216003, 1.226009, 0, 0, 0, 1, 1,
1.165128, -1.282129, 1.678536, 0, 0, 0, 1, 1,
1.167602, 0.03546017, 1.110468, 0, 0, 0, 1, 1,
1.174367, 0.3557674, -0.1668648, 1, 1, 1, 1, 1,
1.179088, 0.002985154, 1.310089, 1, 1, 1, 1, 1,
1.184638, -0.4626547, 2.491247, 1, 1, 1, 1, 1,
1.18709, -1.013525, 1.701833, 1, 1, 1, 1, 1,
1.189851, 0.5864674, 1.22475, 1, 1, 1, 1, 1,
1.192075, 0.8475566, -0.2333481, 1, 1, 1, 1, 1,
1.1921, -0.8867841, 2.276273, 1, 1, 1, 1, 1,
1.192536, -0.3340545, 2.672647, 1, 1, 1, 1, 1,
1.193838, -2.316228, 3.070194, 1, 1, 1, 1, 1,
1.194469, 0.6778164, -0.1995599, 1, 1, 1, 1, 1,
1.198811, -1.163969, 2.107564, 1, 1, 1, 1, 1,
1.198971, -0.5297167, 3.09725, 1, 1, 1, 1, 1,
1.199367, 0.6040294, 2.156655, 1, 1, 1, 1, 1,
1.202642, -0.5935139, 3.175115, 1, 1, 1, 1, 1,
1.202686, -1.150882, 2.256048, 1, 1, 1, 1, 1,
1.207196, 0.2300332, 1.3252, 0, 0, 1, 1, 1,
1.20827, -0.08631381, 1.925323, 1, 0, 0, 1, 1,
1.208825, 0.4454821, 0.4983335, 1, 0, 0, 1, 1,
1.214285, 0.8447145, 1.617855, 1, 0, 0, 1, 1,
1.217115, 0.1767356, 1.114629, 1, 0, 0, 1, 1,
1.221579, 1.029337, 0.1944235, 1, 0, 0, 1, 1,
1.221829, -0.4252992, 3.392521, 0, 0, 0, 1, 1,
1.22262, 1.161572, 1.759777, 0, 0, 0, 1, 1,
1.224327, -0.03543852, 1.085093, 0, 0, 0, 1, 1,
1.228909, 0.5664523, 1.453968, 0, 0, 0, 1, 1,
1.237022, -1.253551, 2.47062, 0, 0, 0, 1, 1,
1.245288, 1.945711, 0.8395044, 0, 0, 0, 1, 1,
1.25413, -0.07492402, 1.089474, 0, 0, 0, 1, 1,
1.282161, -0.870768, 1.756558, 1, 1, 1, 1, 1,
1.292443, 1.730449, 0.2085299, 1, 1, 1, 1, 1,
1.294604, -0.4719392, 1.716983, 1, 1, 1, 1, 1,
1.295758, 0.4009564, -0.06233281, 1, 1, 1, 1, 1,
1.296543, -0.9182726, -0.349833, 1, 1, 1, 1, 1,
1.302818, 0.4426645, 0.9173849, 1, 1, 1, 1, 1,
1.303629, -1.394913, 3.499165, 1, 1, 1, 1, 1,
1.304199, -0.9728101, 2.970213, 1, 1, 1, 1, 1,
1.318611, -0.5540986, 1.285379, 1, 1, 1, 1, 1,
1.332072, -0.1678291, -0.04367791, 1, 1, 1, 1, 1,
1.332335, 0.582047, -0.1939986, 1, 1, 1, 1, 1,
1.3393, -0.484093, 2.531802, 1, 1, 1, 1, 1,
1.363617, -0.8946705, 2.003816, 1, 1, 1, 1, 1,
1.36469, -0.237947, 1.665072, 1, 1, 1, 1, 1,
1.366927, 1.520911, 1.661915, 1, 1, 1, 1, 1,
1.371811, -0.4652422, 1.997264, 0, 0, 1, 1, 1,
1.374204, -0.2838154, 0.1371718, 1, 0, 0, 1, 1,
1.37849, 0.3244977, 0.6501107, 1, 0, 0, 1, 1,
1.384107, 1.920526, 1.159307, 1, 0, 0, 1, 1,
1.389234, 0.3142056, 1.348317, 1, 0, 0, 1, 1,
1.392619, -0.1920457, 0.9753553, 1, 0, 0, 1, 1,
1.394995, -0.09016702, 2.231865, 0, 0, 0, 1, 1,
1.405783, -2.64083, 2.373191, 0, 0, 0, 1, 1,
1.406784, -2.019825, 4.022782, 0, 0, 0, 1, 1,
1.413657, 0.02017282, 2.464108, 0, 0, 0, 1, 1,
1.429106, -1.68053, 3.350201, 0, 0, 0, 1, 1,
1.430133, -0.8079244, 2.043471, 0, 0, 0, 1, 1,
1.434134, 0.3523816, 1.792037, 0, 0, 0, 1, 1,
1.434545, 0.2101288, 1.19651, 1, 1, 1, 1, 1,
1.474813, 1.904979, 0.4895388, 1, 1, 1, 1, 1,
1.47903, 0.9552432, 0.5118672, 1, 1, 1, 1, 1,
1.479319, -0.2524365, 0.9886769, 1, 1, 1, 1, 1,
1.48214, -0.1128528, 0.8289538, 1, 1, 1, 1, 1,
1.482991, -0.8328062, 2.543314, 1, 1, 1, 1, 1,
1.492144, 0.8746236, 1.568052, 1, 1, 1, 1, 1,
1.493701, -0.001824451, 2.122884, 1, 1, 1, 1, 1,
1.500658, -0.7679733, 2.628554, 1, 1, 1, 1, 1,
1.501361, -0.9702052, 2.788933, 1, 1, 1, 1, 1,
1.524161, -0.3852743, 0.6527585, 1, 1, 1, 1, 1,
1.527851, 1.151578, -0.7252529, 1, 1, 1, 1, 1,
1.52879, 0.004036373, 1.465872, 1, 1, 1, 1, 1,
1.55527, -0.2948926, 3.108163, 1, 1, 1, 1, 1,
1.588637, 0.6190163, 2.643708, 1, 1, 1, 1, 1,
1.591228, 0.2453925, 1.88639, 0, 0, 1, 1, 1,
1.594635, 0.3289395, 1.868473, 1, 0, 0, 1, 1,
1.602988, -1.364345, 2.542489, 1, 0, 0, 1, 1,
1.621629, 1.200161, 0.002815229, 1, 0, 0, 1, 1,
1.626195, 0.1164336, 1.384322, 1, 0, 0, 1, 1,
1.633015, 0.7920857, 2.271067, 1, 0, 0, 1, 1,
1.633803, 0.5667257, 2.078106, 0, 0, 0, 1, 1,
1.634996, 0.4323987, 0.4474564, 0, 0, 0, 1, 1,
1.649136, 1.019117, 1.038682, 0, 0, 0, 1, 1,
1.649925, 0.2647646, -0.3249257, 0, 0, 0, 1, 1,
1.660499, 0.6352907, 0.6852681, 0, 0, 0, 1, 1,
1.662965, -1.684802, 2.71788, 0, 0, 0, 1, 1,
1.674407, 0.1103655, 1.097996, 0, 0, 0, 1, 1,
1.682882, 0.3683783, 2.197538, 1, 1, 1, 1, 1,
1.683541, 0.2589066, 1.824834, 1, 1, 1, 1, 1,
1.713499, 0.3716111, 0.9678198, 1, 1, 1, 1, 1,
1.72923, -0.8278087, 3.318529, 1, 1, 1, 1, 1,
1.737888, -0.2359717, 0.6450304, 1, 1, 1, 1, 1,
1.802133, -0.1401788, 2.212727, 1, 1, 1, 1, 1,
1.819648, 1.297464, 0.3896792, 1, 1, 1, 1, 1,
1.82802, 2.062586, -0.1566388, 1, 1, 1, 1, 1,
1.846321, 0.7641848, 0.6253129, 1, 1, 1, 1, 1,
1.852828, -0.7144366, 3.426443, 1, 1, 1, 1, 1,
1.880867, 0.6873099, 1.522604, 1, 1, 1, 1, 1,
1.901271, -1.12415, 1.122715, 1, 1, 1, 1, 1,
1.922145, 0.4377145, 2.289949, 1, 1, 1, 1, 1,
1.926658, -1.562112, 1.793102, 1, 1, 1, 1, 1,
1.933169, -0.3988183, 0.9296001, 1, 1, 1, 1, 1,
1.968422, 0.1042943, 1.745353, 0, 0, 1, 1, 1,
1.970964, 0.3093092, 2.272937, 1, 0, 0, 1, 1,
1.972244, 0.06589642, 1.821931, 1, 0, 0, 1, 1,
1.980973, -0.5543249, 2.463409, 1, 0, 0, 1, 1,
1.986063, 0.2437477, 0.7542316, 1, 0, 0, 1, 1,
2.03222, -1.242571, 0.1472163, 1, 0, 0, 1, 1,
2.084011, 0.3585947, 2.251086, 0, 0, 0, 1, 1,
2.087579, 0.6584975, 2.021611, 0, 0, 0, 1, 1,
2.250081, 0.07099, 2.184894, 0, 0, 0, 1, 1,
2.274693, -0.7626293, 2.072016, 0, 0, 0, 1, 1,
2.351881, 0.3075396, 1.10262, 0, 0, 0, 1, 1,
2.384568, 0.5141264, 1.821499, 0, 0, 0, 1, 1,
2.390203, -0.6066057, 1.114786, 0, 0, 0, 1, 1,
2.441979, 0.9213125, 0.2548835, 1, 1, 1, 1, 1,
2.444678, -0.6801608, 0.3290586, 1, 1, 1, 1, 1,
2.54115, 2.775379, -0.544911, 1, 1, 1, 1, 1,
2.65062, 0.6433494, 2.683432, 1, 1, 1, 1, 1,
2.843945, -0.5102543, 2.099467, 1, 1, 1, 1, 1,
2.921334, 0.6652806, 0.9527633, 1, 1, 1, 1, 1,
3.044249, -0.9335711, 1.584269, 1, 1, 1, 1, 1
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
var radius = 9.537273;
var distance = 33.49927;
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
mvMatrix.translate( 0.07480669, 0.08847535, 0.110816 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.49927);
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
