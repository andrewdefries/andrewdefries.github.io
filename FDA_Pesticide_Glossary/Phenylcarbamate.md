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
-3.051458, -0.4808447, -1.842599, 1, 0, 0, 1,
-3.05075, 1.740329, -0.991513, 1, 0.007843138, 0, 1,
-2.90317, -2.769989, -2.417996, 1, 0.01176471, 0, 1,
-2.698344, 0.4561022, -0.5254309, 1, 0.01960784, 0, 1,
-2.647565, -1.592647, -2.822453, 1, 0.02352941, 0, 1,
-2.629983, -0.4941876, -4.068597, 1, 0.03137255, 0, 1,
-2.623217, 0.2085369, -2.070336, 1, 0.03529412, 0, 1,
-2.595716, -1.715567, -1.796637, 1, 0.04313726, 0, 1,
-2.564676, 0.6194763, -0.8543171, 1, 0.04705882, 0, 1,
-2.520939, 1.397265, -0.8101703, 1, 0.05490196, 0, 1,
-2.463156, -0.6156433, -3.417735, 1, 0.05882353, 0, 1,
-2.398675, 0.8637623, -2.954326, 1, 0.06666667, 0, 1,
-2.3925, 0.841885, -1.406091, 1, 0.07058824, 0, 1,
-2.37352, 0.2501272, -1.116315, 1, 0.07843138, 0, 1,
-2.329873, -0.8335853, -1.086913, 1, 0.08235294, 0, 1,
-2.249355, -2.620622, -1.519027, 1, 0.09019608, 0, 1,
-2.220228, 1.048037, -0.1099996, 1, 0.09411765, 0, 1,
-2.175228, -0.2669908, -1.802515, 1, 0.1019608, 0, 1,
-2.16848, -0.04631102, -2.390304, 1, 0.1098039, 0, 1,
-2.152451, -0.05632379, -1.610973, 1, 0.1137255, 0, 1,
-2.151926, 1.910712, -0.7547278, 1, 0.1215686, 0, 1,
-2.095601, 0.5941801, 0.9900678, 1, 0.1254902, 0, 1,
-2.024631, -0.4591872, -1.792441, 1, 0.1333333, 0, 1,
-1.984681, -1.121247, -2.3396, 1, 0.1372549, 0, 1,
-1.977965, -0.6550367, -1.80485, 1, 0.145098, 0, 1,
-1.972238, 1.543563, -0.8042938, 1, 0.1490196, 0, 1,
-1.937585, -0.9980461, -1.215209, 1, 0.1568628, 0, 1,
-1.921953, 0.1248173, -1.387907, 1, 0.1607843, 0, 1,
-1.912199, 0.294168, 0.06769416, 1, 0.1686275, 0, 1,
-1.911018, -1.182328, -3.161543, 1, 0.172549, 0, 1,
-1.906203, 0.8896422, -2.11338, 1, 0.1803922, 0, 1,
-1.905146, 1.422749, -0.2751072, 1, 0.1843137, 0, 1,
-1.895368, -0.2177784, 0.6339622, 1, 0.1921569, 0, 1,
-1.862955, 1.691471, -2.465858, 1, 0.1960784, 0, 1,
-1.854199, -1.086904, -1.712319, 1, 0.2039216, 0, 1,
-1.844497, 1.265318, -1.102154, 1, 0.2117647, 0, 1,
-1.828237, -1.663343, -3.561304, 1, 0.2156863, 0, 1,
-1.820734, -1.319907, -2.536327, 1, 0.2235294, 0, 1,
-1.819966, 1.253829, -2.743541, 1, 0.227451, 0, 1,
-1.789043, 0.6975927, -1.845974, 1, 0.2352941, 0, 1,
-1.777699, 0.5019057, -1.902634, 1, 0.2392157, 0, 1,
-1.765006, -0.6932362, -2.32873, 1, 0.2470588, 0, 1,
-1.749227, -0.5567124, -1.712745, 1, 0.2509804, 0, 1,
-1.739475, 0.004549242, -1.435918, 1, 0.2588235, 0, 1,
-1.734234, 1.226657, -1.405832, 1, 0.2627451, 0, 1,
-1.733769, 0.03452151, -1.2011, 1, 0.2705882, 0, 1,
-1.716572, 0.1543228, -3.130356, 1, 0.2745098, 0, 1,
-1.703953, 0.1886138, -2.318063, 1, 0.282353, 0, 1,
-1.700839, 0.3739878, -0.754522, 1, 0.2862745, 0, 1,
-1.700062, -0.9245853, -1.609878, 1, 0.2941177, 0, 1,
-1.68215, -0.7011561, -1.066046, 1, 0.3019608, 0, 1,
-1.663414, -0.8294624, -2.303504, 1, 0.3058824, 0, 1,
-1.648441, -0.3210013, -1.575192, 1, 0.3137255, 0, 1,
-1.63905, 1.535692, -2.564955, 1, 0.3176471, 0, 1,
-1.629424, -1.02866, -2.573576, 1, 0.3254902, 0, 1,
-1.614569, 1.186079, -2.231599, 1, 0.3294118, 0, 1,
-1.597378, -0.7067772, -0.9551374, 1, 0.3372549, 0, 1,
-1.592014, -1.202738, -1.788941, 1, 0.3411765, 0, 1,
-1.558541, 0.1949407, -0.7220044, 1, 0.3490196, 0, 1,
-1.5559, 1.485983, -0.7939892, 1, 0.3529412, 0, 1,
-1.552534, 0.3643768, -0.9151552, 1, 0.3607843, 0, 1,
-1.552293, -1.429074, -3.28436, 1, 0.3647059, 0, 1,
-1.546737, 0.839685, -0.356019, 1, 0.372549, 0, 1,
-1.543015, -0.5309937, -1.235437, 1, 0.3764706, 0, 1,
-1.524605, 0.1976461, -0.588201, 1, 0.3843137, 0, 1,
-1.517583, 0.1477642, 0.2431906, 1, 0.3882353, 0, 1,
-1.516166, 0.8565939, -0.1389602, 1, 0.3960784, 0, 1,
-1.498468, 1.558823, -3.65561, 1, 0.4039216, 0, 1,
-1.492595, 1.055923, -1.248324, 1, 0.4078431, 0, 1,
-1.491337, -0.3977554, -0.219489, 1, 0.4156863, 0, 1,
-1.486786, -0.8035046, -1.201663, 1, 0.4196078, 0, 1,
-1.478119, -0.256322, -2.943289, 1, 0.427451, 0, 1,
-1.474182, 0.5403324, -2.242027, 1, 0.4313726, 0, 1,
-1.472104, 0.1572639, -1.431215, 1, 0.4392157, 0, 1,
-1.468746, 0.05616037, -1.867239, 1, 0.4431373, 0, 1,
-1.45725, 1.134585, -0.7653084, 1, 0.4509804, 0, 1,
-1.451988, -0.6727956, -2.502833, 1, 0.454902, 0, 1,
-1.447422, 0.7373173, 0.3521189, 1, 0.4627451, 0, 1,
-1.446824, -0.3000216, -1.182822, 1, 0.4666667, 0, 1,
-1.44212, -0.6015697, -0.9660755, 1, 0.4745098, 0, 1,
-1.440411, -0.6249935, -1.359702, 1, 0.4784314, 0, 1,
-1.436366, -1.424235, -0.1233105, 1, 0.4862745, 0, 1,
-1.427269, 0.1006687, -0.816655, 1, 0.4901961, 0, 1,
-1.424602, -0.3714068, -2.745777, 1, 0.4980392, 0, 1,
-1.422662, -0.8911415, -2.524275, 1, 0.5058824, 0, 1,
-1.409034, 0.1209532, -2.701177, 1, 0.509804, 0, 1,
-1.399733, 0.1104058, -2.046085, 1, 0.5176471, 0, 1,
-1.394584, 1.861613, -0.4168951, 1, 0.5215687, 0, 1,
-1.390794, 1.646181, -2.06382, 1, 0.5294118, 0, 1,
-1.388396, 1.173323, -0.065411, 1, 0.5333334, 0, 1,
-1.381787, 2.017657, -0.7334986, 1, 0.5411765, 0, 1,
-1.365466, -0.6771416, -1.9867, 1, 0.5450981, 0, 1,
-1.363183, -1.139106, -2.760003, 1, 0.5529412, 0, 1,
-1.360966, -1.387535, -0.1352347, 1, 0.5568628, 0, 1,
-1.360603, 0.4497648, -1.850154, 1, 0.5647059, 0, 1,
-1.353361, -1.239974, -3.273863, 1, 0.5686275, 0, 1,
-1.351165, 0.4306836, -2.282066, 1, 0.5764706, 0, 1,
-1.342862, 2.134701, 0.146663, 1, 0.5803922, 0, 1,
-1.338208, 1.274409, 0.03490784, 1, 0.5882353, 0, 1,
-1.324945, -0.6887562, 0.1429967, 1, 0.5921569, 0, 1,
-1.324363, -2.599246, -2.639782, 1, 0.6, 0, 1,
-1.321617, -0.9950442, -1.784784, 1, 0.6078432, 0, 1,
-1.316584, 0.2302641, 0.2796693, 1, 0.6117647, 0, 1,
-1.316507, 0.4110628, -1.084538, 1, 0.6196079, 0, 1,
-1.314071, 0.3081833, -2.126553, 1, 0.6235294, 0, 1,
-1.308062, 0.3543446, -0.06071485, 1, 0.6313726, 0, 1,
-1.291831, -0.0635373, -2.009402, 1, 0.6352941, 0, 1,
-1.287674, -0.2293955, -1.760939, 1, 0.6431373, 0, 1,
-1.259872, -1.69006, -2.823402, 1, 0.6470588, 0, 1,
-1.254084, 0.3913839, -1.04812, 1, 0.654902, 0, 1,
-1.246345, 0.2033692, 0.5068985, 1, 0.6588235, 0, 1,
-1.242689, 2.431809, -1.155682, 1, 0.6666667, 0, 1,
-1.240838, 0.5005217, -1.786767, 1, 0.6705883, 0, 1,
-1.240608, 0.4271701, -0.9395213, 1, 0.6784314, 0, 1,
-1.240561, -0.3094371, -2.445644, 1, 0.682353, 0, 1,
-1.236344, -2.765296, -3.595528, 1, 0.6901961, 0, 1,
-1.222044, 0.6568351, -1.3037, 1, 0.6941177, 0, 1,
-1.203547, -0.7177953, -0.1616004, 1, 0.7019608, 0, 1,
-1.201455, -2.026114, -2.685942, 1, 0.7098039, 0, 1,
-1.200449, -0.5518245, -1.862396, 1, 0.7137255, 0, 1,
-1.191663, -0.8020573, -2.911887, 1, 0.7215686, 0, 1,
-1.190238, 1.615923, 2.029537, 1, 0.7254902, 0, 1,
-1.184598, -1.589374, -2.835551, 1, 0.7333333, 0, 1,
-1.179473, -0.04634949, 0.4783849, 1, 0.7372549, 0, 1,
-1.176939, -0.3584448, -1.419196, 1, 0.7450981, 0, 1,
-1.176232, -0.8370972, -1.126294, 1, 0.7490196, 0, 1,
-1.168382, -1.252395, -5.102212, 1, 0.7568628, 0, 1,
-1.163374, -0.7245131, -3.126166, 1, 0.7607843, 0, 1,
-1.161621, -0.3952079, -1.160317, 1, 0.7686275, 0, 1,
-1.154633, 0.477986, -0.5771706, 1, 0.772549, 0, 1,
-1.142144, 0.524462, -2.182158, 1, 0.7803922, 0, 1,
-1.137778, -0.748257, -2.435613, 1, 0.7843137, 0, 1,
-1.133886, 0.9775078, -1.658987, 1, 0.7921569, 0, 1,
-1.13093, -0.9138114, -2.046033, 1, 0.7960784, 0, 1,
-1.128994, 1.01394, -0.6508048, 1, 0.8039216, 0, 1,
-1.121255, -0.2607747, -1.546332, 1, 0.8117647, 0, 1,
-1.1167, -1.342216, -3.314906, 1, 0.8156863, 0, 1,
-1.113108, 0.3662047, -0.2173208, 1, 0.8235294, 0, 1,
-1.111554, 0.2932274, -1.648732, 1, 0.827451, 0, 1,
-1.102975, 2.576898, 0.9943568, 1, 0.8352941, 0, 1,
-1.090546, -1.115923, -2.383091, 1, 0.8392157, 0, 1,
-1.086728, -0.7689341, -1.96931, 1, 0.8470588, 0, 1,
-1.085947, -0.9746949, -3.77236, 1, 0.8509804, 0, 1,
-1.067083, -0.3310306, -1.471784, 1, 0.8588235, 0, 1,
-1.063709, -1.505895, -2.302492, 1, 0.8627451, 0, 1,
-1.058932, 1.157136, 0.09026758, 1, 0.8705882, 0, 1,
-1.057575, -0.8033888, -2.57314, 1, 0.8745098, 0, 1,
-1.049185, 0.04934681, -2.084889, 1, 0.8823529, 0, 1,
-1.047809, 0.1683065, -0.9167603, 1, 0.8862745, 0, 1,
-1.047244, 0.1203263, -2.955137, 1, 0.8941177, 0, 1,
-1.046873, -0.8996629, -2.765312, 1, 0.8980392, 0, 1,
-1.037046, 1.750914, -1.029318, 1, 0.9058824, 0, 1,
-1.036361, -0.2866356, -3.489988, 1, 0.9137255, 0, 1,
-1.02546, 0.5422774, -2.541423, 1, 0.9176471, 0, 1,
-1.021184, -0.5936727, -0.7107437, 1, 0.9254902, 0, 1,
-1.018861, 0.342868, -1.751727, 1, 0.9294118, 0, 1,
-1.014868, 2.807851, 0.5799773, 1, 0.9372549, 0, 1,
-1.013856, 0.2089135, -2.128525, 1, 0.9411765, 0, 1,
-1.01213, 1.462046, -0.8558546, 1, 0.9490196, 0, 1,
-1.011963, -1.025169, -1.206718, 1, 0.9529412, 0, 1,
-1.0115, 0.2448786, -1.207715, 1, 0.9607843, 0, 1,
-1.007725, 0.1875843, -2.817266, 1, 0.9647059, 0, 1,
-1.00149, -1.396283, -1.494952, 1, 0.972549, 0, 1,
-0.999747, 1.115415, 0.01884479, 1, 0.9764706, 0, 1,
-0.9972456, 1.326061, -0.9431282, 1, 0.9843137, 0, 1,
-0.9910786, -1.251263, -2.385721, 1, 0.9882353, 0, 1,
-0.9892641, -0.9971607, -4.382475, 1, 0.9960784, 0, 1,
-0.9891747, -0.6384528, -1.408177, 0.9960784, 1, 0, 1,
-0.9824945, -0.6112485, -1.548999, 0.9921569, 1, 0, 1,
-0.9780761, 0.9040278, -0.3100997, 0.9843137, 1, 0, 1,
-0.974739, 0.6740315, -1.282415, 0.9803922, 1, 0, 1,
-0.9679493, 0.6380017, 0.1010671, 0.972549, 1, 0, 1,
-0.9642048, -1.795821, -2.090267, 0.9686275, 1, 0, 1,
-0.9587846, -0.8108559, -2.200804, 0.9607843, 1, 0, 1,
-0.9585307, -0.3672647, -1.828829, 0.9568627, 1, 0, 1,
-0.9509742, 0.230033, -0.9099406, 0.9490196, 1, 0, 1,
-0.9460273, -1.738619, -4.545031, 0.945098, 1, 0, 1,
-0.9411975, -0.1866082, -0.7967084, 0.9372549, 1, 0, 1,
-0.9304623, 0.5875212, -0.2184946, 0.9333333, 1, 0, 1,
-0.9226642, -1.143147, -4.192639, 0.9254902, 1, 0, 1,
-0.9119492, -0.8578811, -2.383413, 0.9215686, 1, 0, 1,
-0.9070032, -0.9201176, -0.9606418, 0.9137255, 1, 0, 1,
-0.9016441, -0.6694773, -3.231261, 0.9098039, 1, 0, 1,
-0.8973109, 1.471497, -0.8553567, 0.9019608, 1, 0, 1,
-0.8969823, -0.3190515, -2.201574, 0.8941177, 1, 0, 1,
-0.8959693, 0.1867044, -2.302488, 0.8901961, 1, 0, 1,
-0.8599086, -1.341579, -2.149592, 0.8823529, 1, 0, 1,
-0.8596555, 0.406827, -1.574272, 0.8784314, 1, 0, 1,
-0.8528509, -1.347888, -3.676638, 0.8705882, 1, 0, 1,
-0.8508393, -0.5820956, -1.721421, 0.8666667, 1, 0, 1,
-0.8495536, 0.05545814, -3.603664, 0.8588235, 1, 0, 1,
-0.8479556, 1.97018, 1.524278, 0.854902, 1, 0, 1,
-0.8463597, 0.6739944, -2.275268, 0.8470588, 1, 0, 1,
-0.8362369, -0.09947943, -2.351432, 0.8431373, 1, 0, 1,
-0.8348705, 0.7436207, -2.14432, 0.8352941, 1, 0, 1,
-0.8284537, 0.1799154, 0.6788368, 0.8313726, 1, 0, 1,
-0.8221396, -0.397099, -4.123825, 0.8235294, 1, 0, 1,
-0.8214344, -0.6372732, -1.374741, 0.8196079, 1, 0, 1,
-0.8153785, 1.996845, -0.3106796, 0.8117647, 1, 0, 1,
-0.8133251, 1.624208, -0.196086, 0.8078431, 1, 0, 1,
-0.8127154, -0.7276485, -2.629656, 0.8, 1, 0, 1,
-0.8121027, 0.2081929, 0.07759991, 0.7921569, 1, 0, 1,
-0.8055674, 0.07555124, -1.404751, 0.7882353, 1, 0, 1,
-0.8009685, -0.2056553, -2.886291, 0.7803922, 1, 0, 1,
-0.7999555, -0.4934035, -2.683694, 0.7764706, 1, 0, 1,
-0.7938638, 0.8711915, 0.2515855, 0.7686275, 1, 0, 1,
-0.7895142, -0.6716212, -2.626255, 0.7647059, 1, 0, 1,
-0.7866505, -0.4548298, -1.417992, 0.7568628, 1, 0, 1,
-0.7846466, 0.9270861, -1.223632, 0.7529412, 1, 0, 1,
-0.7773059, -0.4835403, -3.178118, 0.7450981, 1, 0, 1,
-0.776359, 0.1048904, -1.596307, 0.7411765, 1, 0, 1,
-0.7748878, -0.09137092, -0.9658065, 0.7333333, 1, 0, 1,
-0.7697566, 1.548577, -2.179811, 0.7294118, 1, 0, 1,
-0.7673831, 0.2924645, -0.7134674, 0.7215686, 1, 0, 1,
-0.7608262, 0.565435, -0.543792, 0.7176471, 1, 0, 1,
-0.7592111, 1.140768, 1.214048, 0.7098039, 1, 0, 1,
-0.7581393, 0.1093265, -0.7006342, 0.7058824, 1, 0, 1,
-0.7562824, 0.3247606, -1.330689, 0.6980392, 1, 0, 1,
-0.75437, -1.459621, -4.124847, 0.6901961, 1, 0, 1,
-0.7481192, 1.853647, -2.794408, 0.6862745, 1, 0, 1,
-0.7478434, -2.233788, -2.655057, 0.6784314, 1, 0, 1,
-0.743643, -0.4847364, -2.142929, 0.6745098, 1, 0, 1,
-0.7402487, 0.3434647, 0.8880122, 0.6666667, 1, 0, 1,
-0.7392036, 0.6604625, 0.4711976, 0.6627451, 1, 0, 1,
-0.7373297, 0.9319047, -0.885497, 0.654902, 1, 0, 1,
-0.7340998, 0.02275442, -2.610327, 0.6509804, 1, 0, 1,
-0.733932, -1.181242, -3.365835, 0.6431373, 1, 0, 1,
-0.7333409, -0.1820571, -0.9598579, 0.6392157, 1, 0, 1,
-0.7242537, -0.4735028, -1.760557, 0.6313726, 1, 0, 1,
-0.7167816, 1.329184, -0.3955032, 0.627451, 1, 0, 1,
-0.7105753, -0.3901164, -1.610647, 0.6196079, 1, 0, 1,
-0.7103764, -0.9660849, -2.358138, 0.6156863, 1, 0, 1,
-0.7084613, -0.03979242, -1.484103, 0.6078432, 1, 0, 1,
-0.7005234, 0.7739556, -1.41482, 0.6039216, 1, 0, 1,
-0.6980644, 0.2729695, -2.37326, 0.5960785, 1, 0, 1,
-0.6959099, 0.1132684, -2.327057, 0.5882353, 1, 0, 1,
-0.6916978, 1.147451, -0.6039724, 0.5843138, 1, 0, 1,
-0.6868099, -0.6958145, -2.479049, 0.5764706, 1, 0, 1,
-0.6853122, 0.4909059, -1.066084, 0.572549, 1, 0, 1,
-0.6838703, -0.175799, -2.368433, 0.5647059, 1, 0, 1,
-0.6824228, -0.3019295, -3.92326, 0.5607843, 1, 0, 1,
-0.6817256, -0.01935701, -2.039461, 0.5529412, 1, 0, 1,
-0.6790561, -0.618921, -3.92314, 0.5490196, 1, 0, 1,
-0.6781173, 1.12787, -0.9861316, 0.5411765, 1, 0, 1,
-0.6762006, 1.109302, -1.563824, 0.5372549, 1, 0, 1,
-0.6747661, 0.3406925, 0.5554448, 0.5294118, 1, 0, 1,
-0.6719525, 1.584991, 1.229624, 0.5254902, 1, 0, 1,
-0.671374, -0.2908536, -0.9176531, 0.5176471, 1, 0, 1,
-0.6709699, -2.010951, -2.588089, 0.5137255, 1, 0, 1,
-0.6708234, 1.077166, -3.370243, 0.5058824, 1, 0, 1,
-0.670777, -0.875204, -2.487473, 0.5019608, 1, 0, 1,
-0.6627959, -1.041679, -2.80038, 0.4941176, 1, 0, 1,
-0.6595647, 1.422151, -1.166059, 0.4862745, 1, 0, 1,
-0.6594151, -0.8742261, -1.12469, 0.4823529, 1, 0, 1,
-0.657779, -0.302443, -2.230767, 0.4745098, 1, 0, 1,
-0.6567434, 0.7583355, -1.888753, 0.4705882, 1, 0, 1,
-0.6513506, 0.07646995, -0.7748765, 0.4627451, 1, 0, 1,
-0.6509966, 0.5972721, 1.071034, 0.4588235, 1, 0, 1,
-0.649897, 0.1297565, -0.4904461, 0.4509804, 1, 0, 1,
-0.6489232, 1.64977, 0.5808123, 0.4470588, 1, 0, 1,
-0.648159, -0.546321, -2.623441, 0.4392157, 1, 0, 1,
-0.6453953, 0.2784013, 0.5422398, 0.4352941, 1, 0, 1,
-0.6412662, -0.1075211, -2.13745, 0.427451, 1, 0, 1,
-0.6347891, -0.4009182, -1.760612, 0.4235294, 1, 0, 1,
-0.6341081, 1.974718, -1.388721, 0.4156863, 1, 0, 1,
-0.6323831, 0.8880494, -2.175486, 0.4117647, 1, 0, 1,
-0.6323082, -0.3876004, -2.513889, 0.4039216, 1, 0, 1,
-0.6226299, 0.8394898, -1.204584, 0.3960784, 1, 0, 1,
-0.6079736, -1.553924, -2.063869, 0.3921569, 1, 0, 1,
-0.6000039, 1.400466, -0.5976396, 0.3843137, 1, 0, 1,
-0.5977621, 0.192927, -3.147412, 0.3803922, 1, 0, 1,
-0.5972174, -0.5091966, -1.400051, 0.372549, 1, 0, 1,
-0.5958455, -0.07335721, -1.484065, 0.3686275, 1, 0, 1,
-0.5942694, -0.02282814, -2.108681, 0.3607843, 1, 0, 1,
-0.5867811, -0.1188978, -3.188949, 0.3568628, 1, 0, 1,
-0.5785977, -2.017394, -2.520768, 0.3490196, 1, 0, 1,
-0.5781752, 1.847244, -2.376639, 0.345098, 1, 0, 1,
-0.5777603, 0.00791703, -2.307621, 0.3372549, 1, 0, 1,
-0.5690445, 0.2182433, -0.7600911, 0.3333333, 1, 0, 1,
-0.5653429, -0.5064518, -1.845757, 0.3254902, 1, 0, 1,
-0.564557, -2.208191, -3.777324, 0.3215686, 1, 0, 1,
-0.5601564, 0.3762053, -0.3712582, 0.3137255, 1, 0, 1,
-0.5591381, 0.5748888, -0.4629008, 0.3098039, 1, 0, 1,
-0.558607, -0.915072, -4.112534, 0.3019608, 1, 0, 1,
-0.5491906, 0.3277257, -1.37691, 0.2941177, 1, 0, 1,
-0.5409585, -0.5974061, -1.239908, 0.2901961, 1, 0, 1,
-0.540195, -0.5679836, -3.081998, 0.282353, 1, 0, 1,
-0.5390335, -0.9375725, -1.336803, 0.2784314, 1, 0, 1,
-0.5376416, -1.759152, -4.244197, 0.2705882, 1, 0, 1,
-0.5358523, 0.06056995, -2.364187, 0.2666667, 1, 0, 1,
-0.5354614, 0.6559492, -1.540611, 0.2588235, 1, 0, 1,
-0.5323465, 0.1179044, -0.9957366, 0.254902, 1, 0, 1,
-0.5308033, -0.2588774, -2.833616, 0.2470588, 1, 0, 1,
-0.5261525, -2.243973, -2.817932, 0.2431373, 1, 0, 1,
-0.5243244, 1.695047, 0.9379199, 0.2352941, 1, 0, 1,
-0.5203399, -0.7833607, -3.721584, 0.2313726, 1, 0, 1,
-0.51809, -0.3835942, -1.702783, 0.2235294, 1, 0, 1,
-0.5079579, 1.093982, -0.466234, 0.2196078, 1, 0, 1,
-0.5073267, 0.3967499, -1.191762, 0.2117647, 1, 0, 1,
-0.5048009, 0.8867517, 0.5715303, 0.2078431, 1, 0, 1,
-0.50279, 0.5792952, -1.991025, 0.2, 1, 0, 1,
-0.5027516, 2.396924, -0.8698952, 0.1921569, 1, 0, 1,
-0.4996589, -0.171935, -1.468639, 0.1882353, 1, 0, 1,
-0.4995646, -0.7209651, -2.611456, 0.1803922, 1, 0, 1,
-0.491567, 0.7117894, -2.169993, 0.1764706, 1, 0, 1,
-0.4803925, 2.965602, 0.7266044, 0.1686275, 1, 0, 1,
-0.477352, -0.8381108, -1.802035, 0.1647059, 1, 0, 1,
-0.476274, -0.7063943, -0.7779391, 0.1568628, 1, 0, 1,
-0.4740532, -0.2611723, -2.090321, 0.1529412, 1, 0, 1,
-0.4690222, 0.7236456, -1.588345, 0.145098, 1, 0, 1,
-0.464157, -0.1390654, -0.3265956, 0.1411765, 1, 0, 1,
-0.4623151, 1.842861, -1.826465, 0.1333333, 1, 0, 1,
-0.4605829, -0.5587618, -2.812029, 0.1294118, 1, 0, 1,
-0.4595515, -3.12866, -2.82667, 0.1215686, 1, 0, 1,
-0.4594992, 1.184038, 0.1418859, 0.1176471, 1, 0, 1,
-0.4575039, 0.6038096, -0.05595226, 0.1098039, 1, 0, 1,
-0.4543779, 0.5472517, -0.8947163, 0.1058824, 1, 0, 1,
-0.4517467, 1.958459, 1.040371, 0.09803922, 1, 0, 1,
-0.4496491, 0.01134221, -3.773822, 0.09019608, 1, 0, 1,
-0.4454888, 0.2094433, -1.443308, 0.08627451, 1, 0, 1,
-0.4413886, 1.395092, 0.3178391, 0.07843138, 1, 0, 1,
-0.4373072, -0.4383223, -3.010574, 0.07450981, 1, 0, 1,
-0.4341888, -0.6481872, -3.07056, 0.06666667, 1, 0, 1,
-0.4340785, 0.03061558, -2.035187, 0.0627451, 1, 0, 1,
-0.4279109, -0.5078107, -2.285546, 0.05490196, 1, 0, 1,
-0.4254247, -0.2489607, -0.7143102, 0.05098039, 1, 0, 1,
-0.4213474, 1.25282, 0.3814948, 0.04313726, 1, 0, 1,
-0.4189842, -0.9211936, -3.377554, 0.03921569, 1, 0, 1,
-0.4183378, -1.138251, -4.612574, 0.03137255, 1, 0, 1,
-0.4113089, -0.8617761, -3.936232, 0.02745098, 1, 0, 1,
-0.4090114, 1.550996, -0.3638853, 0.01960784, 1, 0, 1,
-0.4087134, 0.5508064, 0.6262107, 0.01568628, 1, 0, 1,
-0.4054642, 0.1233424, -1.395753, 0.007843138, 1, 0, 1,
-0.4037417, 0.2137388, -1.668882, 0.003921569, 1, 0, 1,
-0.4028426, 0.3483499, -0.7390308, 0, 1, 0.003921569, 1,
-0.4024526, 0.9638491, 0.872613, 0, 1, 0.01176471, 1,
-0.3974341, -1.501591, -2.572668, 0, 1, 0.01568628, 1,
-0.3949651, 0.6586798, -1.657285, 0, 1, 0.02352941, 1,
-0.3889726, 0.4346905, -0.6553987, 0, 1, 0.02745098, 1,
-0.3885403, -1.535746, -0.7487229, 0, 1, 0.03529412, 1,
-0.3881058, 0.5357062, 0.5973572, 0, 1, 0.03921569, 1,
-0.3879084, -0.7242382, -3.548012, 0, 1, 0.04705882, 1,
-0.3877984, 0.6730415, -0.6875093, 0, 1, 0.05098039, 1,
-0.3797186, 1.498326, -0.0408116, 0, 1, 0.05882353, 1,
-0.3735646, 1.936608, 0.3207995, 0, 1, 0.0627451, 1,
-0.3734924, 0.09612337, -2.32693, 0, 1, 0.07058824, 1,
-0.3732829, 1.036944, -1.014884, 0, 1, 0.07450981, 1,
-0.3726728, -0.5375698, -1.635011, 0, 1, 0.08235294, 1,
-0.37146, 0.02823775, -2.487242, 0, 1, 0.08627451, 1,
-0.3707814, -0.6364609, -3.704386, 0, 1, 0.09411765, 1,
-0.3688132, -0.3567191, -3.402519, 0, 1, 0.1019608, 1,
-0.3674989, -0.5749844, -2.101713, 0, 1, 0.1058824, 1,
-0.3673154, -0.4043584, -1.007383, 0, 1, 0.1137255, 1,
-0.3667189, -0.3866681, -1.278563, 0, 1, 0.1176471, 1,
-0.3650833, -0.505284, 0.7756038, 0, 1, 0.1254902, 1,
-0.3645802, -0.5679576, -1.626636, 0, 1, 0.1294118, 1,
-0.3626479, -0.5187929, -3.215334, 0, 1, 0.1372549, 1,
-0.3600766, 0.09666239, -1.185431, 0, 1, 0.1411765, 1,
-0.3537465, -0.3954238, -3.801597, 0, 1, 0.1490196, 1,
-0.3530642, -0.8413358, -1.927583, 0, 1, 0.1529412, 1,
-0.3524499, -0.6854498, -1.795841, 0, 1, 0.1607843, 1,
-0.3510451, -0.2005722, -3.696725, 0, 1, 0.1647059, 1,
-0.3494308, 0.2745108, -2.158024, 0, 1, 0.172549, 1,
-0.3489422, 1.390676, -1.31649, 0, 1, 0.1764706, 1,
-0.3473966, -0.1926079, -1.402323, 0, 1, 0.1843137, 1,
-0.346563, 0.3225805, -1.587427, 0, 1, 0.1882353, 1,
-0.3447488, 0.2315982, 0.2496625, 0, 1, 0.1960784, 1,
-0.3439559, 1.056177, -0.1685615, 0, 1, 0.2039216, 1,
-0.3393648, -0.3126119, 0.2608436, 0, 1, 0.2078431, 1,
-0.3371104, -0.612036, -2.623599, 0, 1, 0.2156863, 1,
-0.3369552, -1.330287, -2.15212, 0, 1, 0.2196078, 1,
-0.3367104, -0.4290257, -2.032393, 0, 1, 0.227451, 1,
-0.3362455, -0.8463405, -2.114186, 0, 1, 0.2313726, 1,
-0.329845, -0.5172235, -2.418114, 0, 1, 0.2392157, 1,
-0.3291639, 0.01316205, -1.885317, 0, 1, 0.2431373, 1,
-0.323675, 0.1492952, -2.559263, 0, 1, 0.2509804, 1,
-0.3232575, 0.5315726, 0.6731175, 0, 1, 0.254902, 1,
-0.3196243, 1.021969, -0.7379589, 0, 1, 0.2627451, 1,
-0.317233, 0.189332, 1.572638, 0, 1, 0.2666667, 1,
-0.3166616, -1.177159, -3.401697, 0, 1, 0.2745098, 1,
-0.3146608, -0.266772, -2.756354, 0, 1, 0.2784314, 1,
-0.3136696, -0.2435974, -0.5887982, 0, 1, 0.2862745, 1,
-0.3131245, 0.2539884, -0.9008105, 0, 1, 0.2901961, 1,
-0.3123534, -1.050703, -2.047502, 0, 1, 0.2980392, 1,
-0.3103155, 0.8758807, -0.03753547, 0, 1, 0.3058824, 1,
-0.3090995, -0.2452633, -3.800303, 0, 1, 0.3098039, 1,
-0.3078509, 0.8219821, -0.9256513, 0, 1, 0.3176471, 1,
-0.3038034, 0.661287, -0.5733337, 0, 1, 0.3215686, 1,
-0.3036442, 1.853584, -0.455486, 0, 1, 0.3294118, 1,
-0.2988928, 1.004278, -1.654864, 0, 1, 0.3333333, 1,
-0.2963707, 0.2021655, -1.493506, 0, 1, 0.3411765, 1,
-0.2953963, -0.474113, -1.466242, 0, 1, 0.345098, 1,
-0.294412, 0.4902924, -0.1087426, 0, 1, 0.3529412, 1,
-0.2937803, -1.968935, -3.428553, 0, 1, 0.3568628, 1,
-0.2923386, 0.3374538, -1.894569, 0, 1, 0.3647059, 1,
-0.2907429, -0.6342173, -2.041508, 0, 1, 0.3686275, 1,
-0.287439, -0.785458, -2.778637, 0, 1, 0.3764706, 1,
-0.2862917, 0.9163423, -0.1761071, 0, 1, 0.3803922, 1,
-0.2838111, 2.178247, -0.9909285, 0, 1, 0.3882353, 1,
-0.2834744, -1.2621, -3.580716, 0, 1, 0.3921569, 1,
-0.282866, 1.205626, -1.419669, 0, 1, 0.4, 1,
-0.2826488, -0.4873104, -2.418029, 0, 1, 0.4078431, 1,
-0.2815744, -0.840355, -2.697792, 0, 1, 0.4117647, 1,
-0.2737419, -0.104536, -3.086025, 0, 1, 0.4196078, 1,
-0.2722813, 0.2098009, 1.175363, 0, 1, 0.4235294, 1,
-0.266388, -1.300585, -2.10207, 0, 1, 0.4313726, 1,
-0.2650847, 1.676261, 0.6075759, 0, 1, 0.4352941, 1,
-0.2645976, -1.082604, -0.4025002, 0, 1, 0.4431373, 1,
-0.2624562, 0.9988922, -0.1201093, 0, 1, 0.4470588, 1,
-0.2623835, -0.5463412, -4.191464, 0, 1, 0.454902, 1,
-0.2549398, -0.001773353, -2.499891, 0, 1, 0.4588235, 1,
-0.254873, 0.4405494, -1.825638, 0, 1, 0.4666667, 1,
-0.250963, 0.6134031, 1.341524, 0, 1, 0.4705882, 1,
-0.2509442, 0.4445557, 0.3913739, 0, 1, 0.4784314, 1,
-0.2500905, 0.9199094, -0.268134, 0, 1, 0.4823529, 1,
-0.2456154, 0.2105528, -1.52611, 0, 1, 0.4901961, 1,
-0.2406717, 0.635714, -0.3270013, 0, 1, 0.4941176, 1,
-0.2364989, -0.540064, -2.891172, 0, 1, 0.5019608, 1,
-0.2345591, 1.428542, 1.820411, 0, 1, 0.509804, 1,
-0.2267035, 1.023792, 0.3451152, 0, 1, 0.5137255, 1,
-0.2226255, 1.656318, 0.01240828, 0, 1, 0.5215687, 1,
-0.2213552, 1.25714, -1.943667, 0, 1, 0.5254902, 1,
-0.2194406, 0.8037888, -1.661419, 0, 1, 0.5333334, 1,
-0.2087384, -0.1491449, -2.926361, 0, 1, 0.5372549, 1,
-0.2080301, -0.282685, -1.985793, 0, 1, 0.5450981, 1,
-0.2079525, -1.124317, -2.102122, 0, 1, 0.5490196, 1,
-0.2057925, 0.3035519, -0.1347919, 0, 1, 0.5568628, 1,
-0.2017147, -0.01892571, -1.026862, 0, 1, 0.5607843, 1,
-0.2013054, 1.159904, 0.1217435, 0, 1, 0.5686275, 1,
-0.2011084, 0.7229011, -1.305028, 0, 1, 0.572549, 1,
-0.2003559, 0.3303971, -1.781423, 0, 1, 0.5803922, 1,
-0.1975392, 0.4019479, -0.4626386, 0, 1, 0.5843138, 1,
-0.1864479, 0.6765761, 1.511787, 0, 1, 0.5921569, 1,
-0.1843249, -1.463838, -4.530216, 0, 1, 0.5960785, 1,
-0.180171, 0.9433338, 0.5605661, 0, 1, 0.6039216, 1,
-0.1800224, -0.3793427, -3.058985, 0, 1, 0.6117647, 1,
-0.177764, 0.3202626, 0.9674484, 0, 1, 0.6156863, 1,
-0.1747041, -0.8478482, -3.557754, 0, 1, 0.6235294, 1,
-0.1686204, 0.9006901, -0.2047009, 0, 1, 0.627451, 1,
-0.1658869, 0.9186102, -0.6501362, 0, 1, 0.6352941, 1,
-0.1653114, 0.1464356, -0.7666285, 0, 1, 0.6392157, 1,
-0.1609385, -0.9072136, -3.965174, 0, 1, 0.6470588, 1,
-0.1589961, -1.183035, -2.760228, 0, 1, 0.6509804, 1,
-0.1581101, -0.4493533, -3.360001, 0, 1, 0.6588235, 1,
-0.1566854, 0.03075279, -3.545153, 0, 1, 0.6627451, 1,
-0.1555416, 1.840822, 1.104514, 0, 1, 0.6705883, 1,
-0.15051, 0.55866, -0.06454348, 0, 1, 0.6745098, 1,
-0.1501027, 1.169656, 2.055288, 0, 1, 0.682353, 1,
-0.1469204, 0.5696262, -2.10533, 0, 1, 0.6862745, 1,
-0.1368399, 0.4460914, -1.435938, 0, 1, 0.6941177, 1,
-0.1328798, -0.1496266, -1.508771, 0, 1, 0.7019608, 1,
-0.1220525, -0.446394, -2.598565, 0, 1, 0.7058824, 1,
-0.1198161, -1.256061, -2.944737, 0, 1, 0.7137255, 1,
-0.1163593, 1.852331, 0.5334127, 0, 1, 0.7176471, 1,
-0.1120086, -0.5673105, -3.743391, 0, 1, 0.7254902, 1,
-0.1079308, -0.01331462, -2.974327, 0, 1, 0.7294118, 1,
-0.1030625, -0.6745723, -3.123144, 0, 1, 0.7372549, 1,
-0.1019477, 0.1894884, -0.4649228, 0, 1, 0.7411765, 1,
-0.09700204, -0.3866184, -2.997431, 0, 1, 0.7490196, 1,
-0.09526245, 0.1666154, 0.4265509, 0, 1, 0.7529412, 1,
-0.09506979, -0.057173, -3.993321, 0, 1, 0.7607843, 1,
-0.08844599, -0.5664192, -3.500955, 0, 1, 0.7647059, 1,
-0.08816575, 1.119685, 1.121447, 0, 1, 0.772549, 1,
-0.08567134, -0.03915963, -2.970099, 0, 1, 0.7764706, 1,
-0.08091828, 2.209219, -1.036495, 0, 1, 0.7843137, 1,
-0.08050679, -1.604018, -3.345076, 0, 1, 0.7882353, 1,
-0.0779347, -0.09945362, -0.7521375, 0, 1, 0.7960784, 1,
-0.07721671, 0.02288325, 0.4438637, 0, 1, 0.8039216, 1,
-0.07512993, -0.6415918, -2.799683, 0, 1, 0.8078431, 1,
-0.07207432, 0.7035514, -0.8531562, 0, 1, 0.8156863, 1,
-0.06699879, -0.7778749, -3.452004, 0, 1, 0.8196079, 1,
-0.06646997, 0.08658277, -1.335891, 0, 1, 0.827451, 1,
-0.0649043, -0.6411223, -2.844995, 0, 1, 0.8313726, 1,
-0.06474213, 0.3299798, -0.4456952, 0, 1, 0.8392157, 1,
-0.06053854, 1.052761, -1.652601, 0, 1, 0.8431373, 1,
-0.06033812, -0.2324314, -1.338316, 0, 1, 0.8509804, 1,
-0.0576857, -2.161073, -4.612833, 0, 1, 0.854902, 1,
-0.05648775, 0.3215005, 1.185951, 0, 1, 0.8627451, 1,
-0.05349567, -0.4405941, -2.111854, 0, 1, 0.8666667, 1,
-0.05000535, 0.9563766, 0.1016415, 0, 1, 0.8745098, 1,
-0.04995658, -0.7048227, -4.929207, 0, 1, 0.8784314, 1,
-0.04619032, -1.255621, -3.461159, 0, 1, 0.8862745, 1,
-0.04611083, 0.6095283, -1.420233, 0, 1, 0.8901961, 1,
-0.04580326, 0.8824129, 1.243789, 0, 1, 0.8980392, 1,
-0.0388951, -1.469272, -2.310601, 0, 1, 0.9058824, 1,
-0.02870985, -1.512068, -1.521904, 0, 1, 0.9098039, 1,
-0.02774993, 0.2466696, -0.6239358, 0, 1, 0.9176471, 1,
-0.02523517, 2.104179, -2.358393, 0, 1, 0.9215686, 1,
-0.02500172, 0.1852108, 0.438639, 0, 1, 0.9294118, 1,
-0.02341893, -0.2625977, -1.864449, 0, 1, 0.9333333, 1,
-0.01961787, -0.1631087, -3.301843, 0, 1, 0.9411765, 1,
-0.01851912, -0.515704, -2.841636, 0, 1, 0.945098, 1,
-0.010783, 1.608776, 0.08422222, 0, 1, 0.9529412, 1,
-0.01052048, -0.1479398, -3.680565, 0, 1, 0.9568627, 1,
-0.00840083, 0.1632591, -1.386405, 0, 1, 0.9647059, 1,
-0.00786534, -0.7947006, -2.285806, 0, 1, 0.9686275, 1,
-0.006162978, -1.289576, -2.96645, 0, 1, 0.9764706, 1,
-0.003571583, 0.007193209, -1.465474, 0, 1, 0.9803922, 1,
-0.002657826, 1.642861, 0.4940907, 0, 1, 0.9882353, 1,
-0.0001088003, -1.217611, -2.778587, 0, 1, 0.9921569, 1,
0.002261308, 1.586718, 0.6012815, 0, 1, 1, 1,
0.01033982, 0.07344463, 0.7878655, 0, 0.9921569, 1, 1,
0.01170205, -1.440377, 2.362434, 0, 0.9882353, 1, 1,
0.01254158, -0.3770042, 3.660671, 0, 0.9803922, 1, 1,
0.01276437, 0.02569386, -0.3052979, 0, 0.9764706, 1, 1,
0.01479458, -1.297011, 3.021317, 0, 0.9686275, 1, 1,
0.01496008, -0.2672964, 3.430476, 0, 0.9647059, 1, 1,
0.01679726, -0.598986, 3.789346, 0, 0.9568627, 1, 1,
0.01727133, 1.426726, 0.2440611, 0, 0.9529412, 1, 1,
0.01757945, -0.6150484, 2.283468, 0, 0.945098, 1, 1,
0.01880395, -1.721693, 3.717796, 0, 0.9411765, 1, 1,
0.01954705, -0.4370885, 3.018805, 0, 0.9333333, 1, 1,
0.02165431, -0.6991878, 2.841722, 0, 0.9294118, 1, 1,
0.02295137, -1.315122, 2.979573, 0, 0.9215686, 1, 1,
0.02300783, 0.4781505, -0.9920968, 0, 0.9176471, 1, 1,
0.02535541, 0.4365888, -0.2654511, 0, 0.9098039, 1, 1,
0.02683577, -0.9918656, 2.956391, 0, 0.9058824, 1, 1,
0.03704209, 0.5430356, 0.1927838, 0, 0.8980392, 1, 1,
0.03740703, -0.6961178, 2.444775, 0, 0.8901961, 1, 1,
0.03830666, 0.1683314, -0.9208262, 0, 0.8862745, 1, 1,
0.04226361, -1.447014, 2.500046, 0, 0.8784314, 1, 1,
0.04504659, -1.550806, 4.404387, 0, 0.8745098, 1, 1,
0.04691407, 0.9237419, 0.04026878, 0, 0.8666667, 1, 1,
0.04942731, -0.9134259, 2.754971, 0, 0.8627451, 1, 1,
0.05287813, 0.111446, 0.6231115, 0, 0.854902, 1, 1,
0.05715371, -0.3007462, 2.773017, 0, 0.8509804, 1, 1,
0.06260211, 1.134064, -0.6043579, 0, 0.8431373, 1, 1,
0.06845097, -1.259975, 3.794273, 0, 0.8392157, 1, 1,
0.0693299, 0.5466571, -0.2071699, 0, 0.8313726, 1, 1,
0.07035691, -0.5262313, 3.196568, 0, 0.827451, 1, 1,
0.07506154, 0.3775457, 1.445551, 0, 0.8196079, 1, 1,
0.07783169, 0.3138098, -0.3130602, 0, 0.8156863, 1, 1,
0.07973904, -0.388044, 2.74212, 0, 0.8078431, 1, 1,
0.08034768, -0.1281138, 1.804061, 0, 0.8039216, 1, 1,
0.08296981, -1.321629, 3.311231, 0, 0.7960784, 1, 1,
0.08592442, -0.4343117, 1.520615, 0, 0.7882353, 1, 1,
0.08853051, -0.4282764, 1.821046, 0, 0.7843137, 1, 1,
0.08908595, -0.3115447, 2.638347, 0, 0.7764706, 1, 1,
0.08984334, -0.06986763, 1.978045, 0, 0.772549, 1, 1,
0.09002081, -1.349611, 2.121103, 0, 0.7647059, 1, 1,
0.09199502, 0.5808976, 0.3779582, 0, 0.7607843, 1, 1,
0.09623526, 0.8445245, -0.6006682, 0, 0.7529412, 1, 1,
0.09850149, 1.562541, 1.403127, 0, 0.7490196, 1, 1,
0.09993286, -0.07518643, 0.8957344, 0, 0.7411765, 1, 1,
0.1003946, 0.7371974, -0.6331322, 0, 0.7372549, 1, 1,
0.1010088, -0.08278611, 2.66959, 0, 0.7294118, 1, 1,
0.1014556, -1.634622, 3.823951, 0, 0.7254902, 1, 1,
0.1017233, 0.4963505, -0.8456981, 0, 0.7176471, 1, 1,
0.1033852, 1.765607, 0.6843808, 0, 0.7137255, 1, 1,
0.1034619, -0.1839206, 2.848835, 0, 0.7058824, 1, 1,
0.1052812, -0.9380344, 3.497068, 0, 0.6980392, 1, 1,
0.1052957, 1.045603, -0.01861186, 0, 0.6941177, 1, 1,
0.1085037, 1.373229, 0.4202388, 0, 0.6862745, 1, 1,
0.1088143, -0.1379055, 4.584735, 0, 0.682353, 1, 1,
0.1094321, 0.05845159, 1.064074, 0, 0.6745098, 1, 1,
0.1140158, 1.23428, 1.305315, 0, 0.6705883, 1, 1,
0.1144169, -0.1454953, 3.139029, 0, 0.6627451, 1, 1,
0.1150196, 0.7984366, 0.04135142, 0, 0.6588235, 1, 1,
0.1196257, -0.9804025, 2.358987, 0, 0.6509804, 1, 1,
0.1216488, -0.5404475, 2.788838, 0, 0.6470588, 1, 1,
0.1237907, -1.011017, 3.937532, 0, 0.6392157, 1, 1,
0.1269615, -0.9854572, 3.143558, 0, 0.6352941, 1, 1,
0.1326002, -2.322021, 0.9432195, 0, 0.627451, 1, 1,
0.1377607, 0.8738464, 1.52232, 0, 0.6235294, 1, 1,
0.1384223, 0.07195116, -0.4000588, 0, 0.6156863, 1, 1,
0.1396519, 0.7126514, 0.8062966, 0, 0.6117647, 1, 1,
0.1443899, 0.6951352, 0.04419098, 0, 0.6039216, 1, 1,
0.1457324, 1.226315, 1.168825, 0, 0.5960785, 1, 1,
0.1499888, -0.6313254, 2.451347, 0, 0.5921569, 1, 1,
0.151736, -0.718203, 4.245534, 0, 0.5843138, 1, 1,
0.1518923, -0.7791796, 2.58512, 0, 0.5803922, 1, 1,
0.1520418, -1.166361, 2.558101, 0, 0.572549, 1, 1,
0.1537595, 1.06593, -0.4158564, 0, 0.5686275, 1, 1,
0.1576331, -1.495362, 3.523444, 0, 0.5607843, 1, 1,
0.1582592, 0.4410167, -0.4497835, 0, 0.5568628, 1, 1,
0.1587837, 1.837503, -1.401847, 0, 0.5490196, 1, 1,
0.1619412, -0.01908025, 1.880479, 0, 0.5450981, 1, 1,
0.1644612, -0.1882696, 2.154078, 0, 0.5372549, 1, 1,
0.1668788, -0.5443518, 3.831458, 0, 0.5333334, 1, 1,
0.1750881, -0.01439628, 2.466991, 0, 0.5254902, 1, 1,
0.1766119, -0.1533675, 1.265415, 0, 0.5215687, 1, 1,
0.1767509, -0.5779571, 2.213908, 0, 0.5137255, 1, 1,
0.1785549, 0.748341, -0.9881178, 0, 0.509804, 1, 1,
0.181156, -0.1313507, 3.814073, 0, 0.5019608, 1, 1,
0.1839862, -0.08029039, 2.759354, 0, 0.4941176, 1, 1,
0.1943644, 1.609218, 0.29092, 0, 0.4901961, 1, 1,
0.2003138, 1.649621, -0.7196056, 0, 0.4823529, 1, 1,
0.2016843, -0.04475733, 3.25225, 0, 0.4784314, 1, 1,
0.2021342, -2.111029, 4.654209, 0, 0.4705882, 1, 1,
0.2021359, -1.207879, 3.580906, 0, 0.4666667, 1, 1,
0.204757, 0.5266753, 1.451515, 0, 0.4588235, 1, 1,
0.207811, -1.015103, 2.712355, 0, 0.454902, 1, 1,
0.2078124, -0.679726, 1.946139, 0, 0.4470588, 1, 1,
0.2085128, 0.436924, -0.7254443, 0, 0.4431373, 1, 1,
0.2216539, -1.376171, 0.8926394, 0, 0.4352941, 1, 1,
0.2221712, -2.434771, 3.668686, 0, 0.4313726, 1, 1,
0.2234495, 1.208479, -0.8795437, 0, 0.4235294, 1, 1,
0.225249, 1.174539, -0.06422742, 0, 0.4196078, 1, 1,
0.2259082, -1.670016, 4.453719, 0, 0.4117647, 1, 1,
0.2272979, 0.2889943, 1.744425, 0, 0.4078431, 1, 1,
0.2291544, -0.9030023, 4.650554, 0, 0.4, 1, 1,
0.2312246, 0.7195047, 0.1648781, 0, 0.3921569, 1, 1,
0.2326128, 0.6438998, -0.7474034, 0, 0.3882353, 1, 1,
0.2330223, 0.9629403, -1.524707, 0, 0.3803922, 1, 1,
0.2331384, 1.675461, -0.4178899, 0, 0.3764706, 1, 1,
0.2396611, 2.278006, 0.9842846, 0, 0.3686275, 1, 1,
0.2398254, 0.705872, -1.758437, 0, 0.3647059, 1, 1,
0.2398474, -0.5171869, 2.571424, 0, 0.3568628, 1, 1,
0.2401976, -0.6828663, 3.117878, 0, 0.3529412, 1, 1,
0.2462434, -0.2284814, 2.01368, 0, 0.345098, 1, 1,
0.2470786, -0.8101321, 1.869841, 0, 0.3411765, 1, 1,
0.2475838, -1.076026, 1.196838, 0, 0.3333333, 1, 1,
0.2511789, -1.426086, 2.559523, 0, 0.3294118, 1, 1,
0.2540239, 0.9206215, -0.5284541, 0, 0.3215686, 1, 1,
0.2563099, -1.256451, 4.053681, 0, 0.3176471, 1, 1,
0.2575102, 0.447427, -0.08309239, 0, 0.3098039, 1, 1,
0.2580886, -0.1555635, 2.75583, 0, 0.3058824, 1, 1,
0.2691327, 2.060642, -0.3292921, 0, 0.2980392, 1, 1,
0.2702591, 0.7662627, 1.610984, 0, 0.2901961, 1, 1,
0.2788893, -0.1224167, 2.751828, 0, 0.2862745, 1, 1,
0.2804075, -0.5449675, 2.490354, 0, 0.2784314, 1, 1,
0.2828849, -0.4912275, 1.216412, 0, 0.2745098, 1, 1,
0.2870118, -0.8790631, 3.865142, 0, 0.2666667, 1, 1,
0.2894497, 0.3245269, -0.8039402, 0, 0.2627451, 1, 1,
0.2919545, -0.2198759, 1.005592, 0, 0.254902, 1, 1,
0.2940293, -0.07926433, 1.092157, 0, 0.2509804, 1, 1,
0.2973378, -0.3375415, 3.449404, 0, 0.2431373, 1, 1,
0.3064179, -0.6321924, 2.333077, 0, 0.2392157, 1, 1,
0.3190673, -0.3141862, 4.139351, 0, 0.2313726, 1, 1,
0.3201286, -0.127132, 2.106903, 0, 0.227451, 1, 1,
0.3213952, -0.6490316, 2.945608, 0, 0.2196078, 1, 1,
0.322981, 0.4062554, 1.096054, 0, 0.2156863, 1, 1,
0.3254699, -0.8565578, 2.649226, 0, 0.2078431, 1, 1,
0.3284113, -0.7156295, 4.501029, 0, 0.2039216, 1, 1,
0.3308811, -0.4104014, 3.265274, 0, 0.1960784, 1, 1,
0.3319512, 0.9122504, 0.8481004, 0, 0.1882353, 1, 1,
0.333926, -0.4189155, 2.180292, 0, 0.1843137, 1, 1,
0.3347429, 0.130551, 0.5813856, 0, 0.1764706, 1, 1,
0.334779, 1.101689, 0.5341552, 0, 0.172549, 1, 1,
0.3416323, -0.5867249, 2.889083, 0, 0.1647059, 1, 1,
0.3434026, -0.3611537, 3.588653, 0, 0.1607843, 1, 1,
0.3443039, -0.2024816, 3.218203, 0, 0.1529412, 1, 1,
0.3506292, -0.1610598, 0.5847238, 0, 0.1490196, 1, 1,
0.3525825, 0.3107681, 1.767793, 0, 0.1411765, 1, 1,
0.3552484, -0.7489198, 2.18952, 0, 0.1372549, 1, 1,
0.355395, -1.363494, 1.574221, 0, 0.1294118, 1, 1,
0.3594425, -0.08728301, 1.609036, 0, 0.1254902, 1, 1,
0.3637649, -1.488772, 2.396299, 0, 0.1176471, 1, 1,
0.3672029, 1.138826, 0.655247, 0, 0.1137255, 1, 1,
0.3677712, 1.328986, 2.052414, 0, 0.1058824, 1, 1,
0.3696097, 0.7049377, -0.2604592, 0, 0.09803922, 1, 1,
0.3745669, 0.8029959, -0.01981664, 0, 0.09411765, 1, 1,
0.3783477, 0.1711145, 0.3010333, 0, 0.08627451, 1, 1,
0.3795256, 0.4824304, -2.75715, 0, 0.08235294, 1, 1,
0.3835295, 0.5020134, 0.06537786, 0, 0.07450981, 1, 1,
0.3843827, -0.00975376, 2.668661, 0, 0.07058824, 1, 1,
0.3880395, 0.5564498, 0.4431953, 0, 0.0627451, 1, 1,
0.3894011, 0.5221527, 1.32242, 0, 0.05882353, 1, 1,
0.3946756, 1.029614, 0.7372017, 0, 0.05098039, 1, 1,
0.3971516, -0.328083, 2.099689, 0, 0.04705882, 1, 1,
0.3972982, 0.6430231, 1.866527, 0, 0.03921569, 1, 1,
0.3999602, 1.401859, 0.9400166, 0, 0.03529412, 1, 1,
0.4040163, 0.5757857, 2.183049, 0, 0.02745098, 1, 1,
0.4090357, 0.05328507, 2.556942, 0, 0.02352941, 1, 1,
0.411029, -0.4738452, 2.47822, 0, 0.01568628, 1, 1,
0.4113576, -1.374399, 3.819203, 0, 0.01176471, 1, 1,
0.4216807, -0.2699873, 2.388087, 0, 0.003921569, 1, 1,
0.4231031, -1.256914, 3.051919, 0.003921569, 0, 1, 1,
0.4242665, 1.014239, -0.8856242, 0.007843138, 0, 1, 1,
0.4278327, -0.5401848, 1.632215, 0.01568628, 0, 1, 1,
0.4327672, 1.084925, -0.4052209, 0.01960784, 0, 1, 1,
0.442532, 0.3925145, -0.2426263, 0.02745098, 0, 1, 1,
0.4437207, 0.7751258, 3.032115, 0.03137255, 0, 1, 1,
0.4471999, -0.7602504, 5.070985, 0.03921569, 0, 1, 1,
0.4473646, -0.5671673, 3.896989, 0.04313726, 0, 1, 1,
0.4543449, -1.215405, 2.479231, 0.05098039, 0, 1, 1,
0.4562518, 0.2203954, -0.1841416, 0.05490196, 0, 1, 1,
0.4563172, 0.7915842, -0.1426506, 0.0627451, 0, 1, 1,
0.4568369, -1.79672, 2.506971, 0.06666667, 0, 1, 1,
0.4593036, -0.4801684, 2.153458, 0.07450981, 0, 1, 1,
0.459945, -1.397923, 3.160024, 0.07843138, 0, 1, 1,
0.4614165, 1.428462, 0.1562936, 0.08627451, 0, 1, 1,
0.4615301, 1.942187, -0.03442203, 0.09019608, 0, 1, 1,
0.4680249, -0.6395954, 3.302167, 0.09803922, 0, 1, 1,
0.4696678, 0.202759, 1.303486, 0.1058824, 0, 1, 1,
0.469964, -0.6526187, 3.231173, 0.1098039, 0, 1, 1,
0.470607, 1.554271, 0.06305832, 0.1176471, 0, 1, 1,
0.4743115, 0.4793752, 1.219707, 0.1215686, 0, 1, 1,
0.4754175, 2.245708, -1.202838, 0.1294118, 0, 1, 1,
0.4765002, 0.7139202, 2.242379, 0.1333333, 0, 1, 1,
0.485278, 0.6680846, -0.6817893, 0.1411765, 0, 1, 1,
0.4874498, 0.6072049, -0.993039, 0.145098, 0, 1, 1,
0.4892202, 0.4036216, 0.6825652, 0.1529412, 0, 1, 1,
0.4902224, 0.1152713, 1.362132, 0.1568628, 0, 1, 1,
0.4906038, -1.390151, 1.279108, 0.1647059, 0, 1, 1,
0.4921049, 1.068243, 1.092375, 0.1686275, 0, 1, 1,
0.4957381, 0.3076214, 1.929644, 0.1764706, 0, 1, 1,
0.4959488, -0.5885986, 1.147237, 0.1803922, 0, 1, 1,
0.4974312, 0.9984944, -1.062581, 0.1882353, 0, 1, 1,
0.4993382, -1.198591, 2.999397, 0.1921569, 0, 1, 1,
0.5002035, 0.3572077, 1.754374, 0.2, 0, 1, 1,
0.5009403, -0.03885795, 2.58041, 0.2078431, 0, 1, 1,
0.5033383, -0.4717307, 2.678492, 0.2117647, 0, 1, 1,
0.5073912, 1.290097, 0.7161031, 0.2196078, 0, 1, 1,
0.5090246, -0.3421444, 1.675947, 0.2235294, 0, 1, 1,
0.5137405, -1.65722, 2.914269, 0.2313726, 0, 1, 1,
0.5139522, 1.631811, 0.04806456, 0.2352941, 0, 1, 1,
0.5150202, 0.4396578, 0.4301148, 0.2431373, 0, 1, 1,
0.526507, 0.03905393, 1.888656, 0.2470588, 0, 1, 1,
0.5303345, -1.22557, 2.194121, 0.254902, 0, 1, 1,
0.5303822, 0.3434368, 1.976597, 0.2588235, 0, 1, 1,
0.53665, 0.005541125, 2.09017, 0.2666667, 0, 1, 1,
0.5410363, 0.4047343, 0.491216, 0.2705882, 0, 1, 1,
0.5415293, -1.018684, 4.0156, 0.2784314, 0, 1, 1,
0.5423679, 0.5785006, 1.535896, 0.282353, 0, 1, 1,
0.5452555, -2.025842, 4.661807, 0.2901961, 0, 1, 1,
0.5455366, -0.7661439, 0.544628, 0.2941177, 0, 1, 1,
0.5459237, -1.325679, 1.037938, 0.3019608, 0, 1, 1,
0.5464933, 0.005370873, 2.546952, 0.3098039, 0, 1, 1,
0.5496613, 0.1126175, 1.711018, 0.3137255, 0, 1, 1,
0.550118, 0.7808475, 0.4844302, 0.3215686, 0, 1, 1,
0.551518, -0.0002278534, 1.753669, 0.3254902, 0, 1, 1,
0.5523297, -0.5035422, 0.009404993, 0.3333333, 0, 1, 1,
0.5526798, 0.3996233, 0.9738865, 0.3372549, 0, 1, 1,
0.5542043, -0.4873692, 2.006418, 0.345098, 0, 1, 1,
0.5561171, -1.034283, 3.027816, 0.3490196, 0, 1, 1,
0.5617043, -0.4386689, 1.446361, 0.3568628, 0, 1, 1,
0.567512, -0.4453895, 2.003479, 0.3607843, 0, 1, 1,
0.5677366, 1.611763, -0.5006987, 0.3686275, 0, 1, 1,
0.5760142, 0.4982828, 1.382274, 0.372549, 0, 1, 1,
0.5763152, -0.8896879, 1.318907, 0.3803922, 0, 1, 1,
0.581856, 0.07217532, 0.6113685, 0.3843137, 0, 1, 1,
0.5820691, -0.5778833, 1.648066, 0.3921569, 0, 1, 1,
0.5827297, -0.1138363, 3.238974, 0.3960784, 0, 1, 1,
0.5856987, 1.115704, 1.621849, 0.4039216, 0, 1, 1,
0.588398, -0.55402, 1.747107, 0.4117647, 0, 1, 1,
0.5905967, 0.894331, -0.3649819, 0.4156863, 0, 1, 1,
0.5926706, -1.08973, 1.874562, 0.4235294, 0, 1, 1,
0.5997632, 0.5374622, -0.8264863, 0.427451, 0, 1, 1,
0.6013722, -0.7058343, 2.913043, 0.4352941, 0, 1, 1,
0.6031144, -0.3767882, 1.995269, 0.4392157, 0, 1, 1,
0.6080092, -0.2319328, 1.109764, 0.4470588, 0, 1, 1,
0.6155095, 1.735845, 2.13188, 0.4509804, 0, 1, 1,
0.620324, 0.9237286, 1.052486, 0.4588235, 0, 1, 1,
0.6232913, 0.2954384, 2.109195, 0.4627451, 0, 1, 1,
0.6266449, 0.1441618, -0.5770973, 0.4705882, 0, 1, 1,
0.6310623, 0.8759001, 1.972765, 0.4745098, 0, 1, 1,
0.6322514, 1.652494, -1.200466, 0.4823529, 0, 1, 1,
0.6331947, -0.457516, 2.86385, 0.4862745, 0, 1, 1,
0.6380366, -1.043342, 3.125838, 0.4941176, 0, 1, 1,
0.6389831, -2.302948, 2.393297, 0.5019608, 0, 1, 1,
0.6392149, 0.3293686, 1.036063, 0.5058824, 0, 1, 1,
0.6411572, 0.2648884, 1.484595, 0.5137255, 0, 1, 1,
0.6429596, 0.4393817, 0.4317298, 0.5176471, 0, 1, 1,
0.6440008, -0.1524127, 1.826525, 0.5254902, 0, 1, 1,
0.658997, -0.528442, 1.322906, 0.5294118, 0, 1, 1,
0.6592445, -1.204701, 2.692294, 0.5372549, 0, 1, 1,
0.6684881, -0.3868726, 2.836438, 0.5411765, 0, 1, 1,
0.6704689, -1.007971, -0.06340278, 0.5490196, 0, 1, 1,
0.6716236, 0.9569819, 0.2062711, 0.5529412, 0, 1, 1,
0.6759502, -0.7405348, 3.697533, 0.5607843, 0, 1, 1,
0.6849937, -0.682996, 2.867159, 0.5647059, 0, 1, 1,
0.6853455, 0.5263818, 1.809251, 0.572549, 0, 1, 1,
0.6857139, -0.06590433, 1.186041, 0.5764706, 0, 1, 1,
0.6903275, -0.6420895, 2.813495, 0.5843138, 0, 1, 1,
0.6941061, -0.2856897, 1.534503, 0.5882353, 0, 1, 1,
0.7017869, 0.4342107, 1.740027, 0.5960785, 0, 1, 1,
0.7096074, 0.3902659, -0.6052518, 0.6039216, 0, 1, 1,
0.7147554, -1.661588, 1.175391, 0.6078432, 0, 1, 1,
0.7154194, 0.3137799, 0.5631114, 0.6156863, 0, 1, 1,
0.7176818, 0.7907874, -0.1282227, 0.6196079, 0, 1, 1,
0.7191487, 0.3820423, 3.532946, 0.627451, 0, 1, 1,
0.7197008, 1.534052, 0.4896991, 0.6313726, 0, 1, 1,
0.723509, 1.018368, -0.9899266, 0.6392157, 0, 1, 1,
0.7244607, -0.6671149, 1.113664, 0.6431373, 0, 1, 1,
0.7252569, -0.8826986, 1.500573, 0.6509804, 0, 1, 1,
0.7260092, -1.082303, 3.928358, 0.654902, 0, 1, 1,
0.7317433, -1.109963, 3.646416, 0.6627451, 0, 1, 1,
0.7366474, 3.223245, 0.3407524, 0.6666667, 0, 1, 1,
0.7468512, -1.096897, 2.705781, 0.6745098, 0, 1, 1,
0.7533583, 0.6321958, 1.793721, 0.6784314, 0, 1, 1,
0.7543682, -0.6181538, 1.58158, 0.6862745, 0, 1, 1,
0.7556077, -0.7828597, 2.25141, 0.6901961, 0, 1, 1,
0.7646288, -0.04477308, 0.593878, 0.6980392, 0, 1, 1,
0.7648692, 1.351505, 0.6163332, 0.7058824, 0, 1, 1,
0.7667428, -0.6329345, 3.037545, 0.7098039, 0, 1, 1,
0.770787, -1.252855, 3.431395, 0.7176471, 0, 1, 1,
0.7819036, -0.2356734, 3.397684, 0.7215686, 0, 1, 1,
0.7832282, -1.478775, 1.557247, 0.7294118, 0, 1, 1,
0.7867835, 2.113789, -0.030149, 0.7333333, 0, 1, 1,
0.7896828, -0.1184103, 1.443678, 0.7411765, 0, 1, 1,
0.7921202, -0.975459, 3.522637, 0.7450981, 0, 1, 1,
0.794699, -0.6756722, 2.2458, 0.7529412, 0, 1, 1,
0.7965553, 0.7851973, -2.397415, 0.7568628, 0, 1, 1,
0.7987534, 0.5380273, 1.059455, 0.7647059, 0, 1, 1,
0.8135127, 0.3918912, 1.736436, 0.7686275, 0, 1, 1,
0.8361737, -0.5714563, 2.124035, 0.7764706, 0, 1, 1,
0.8381016, 0.7058212, 1.337725, 0.7803922, 0, 1, 1,
0.8455955, -0.3718048, 3.409354, 0.7882353, 0, 1, 1,
0.8456008, -0.6063238, 1.31006, 0.7921569, 0, 1, 1,
0.8525065, -0.7501728, 2.777848, 0.8, 0, 1, 1,
0.8527792, -2.590666, 3.2535, 0.8078431, 0, 1, 1,
0.862664, 1.460806, 0.7841185, 0.8117647, 0, 1, 1,
0.8627102, 0.2159861, 1.12237, 0.8196079, 0, 1, 1,
0.8638624, 0.338533, 2.009317, 0.8235294, 0, 1, 1,
0.8639801, 1.220914, 0.3861119, 0.8313726, 0, 1, 1,
0.8651013, 1.422839, 1.493186, 0.8352941, 0, 1, 1,
0.8661934, -1.686273, 4.202771, 0.8431373, 0, 1, 1,
0.8693758, 1.049199, 0.04833237, 0.8470588, 0, 1, 1,
0.8703033, -1.861047, 1.189561, 0.854902, 0, 1, 1,
0.8770756, 2.090168, 1.610312, 0.8588235, 0, 1, 1,
0.8772189, -0.3067107, 1.660159, 0.8666667, 0, 1, 1,
0.8790063, -2.63623, 3.031125, 0.8705882, 0, 1, 1,
0.8811501, 1.247655, 2.231285, 0.8784314, 0, 1, 1,
0.8855653, -0.9780838, 2.84379, 0.8823529, 0, 1, 1,
0.8886768, -0.1064752, -0.05953822, 0.8901961, 0, 1, 1,
0.88915, 1.21679, 0.05847936, 0.8941177, 0, 1, 1,
0.8987697, -1.89064, 2.861253, 0.9019608, 0, 1, 1,
0.905443, -0.1797723, 1.291159, 0.9098039, 0, 1, 1,
0.9069625, -1.189595, 2.325301, 0.9137255, 0, 1, 1,
0.9154832, -0.8248295, 0.2136728, 0.9215686, 0, 1, 1,
0.9189138, -2.161099, 3.234717, 0.9254902, 0, 1, 1,
0.924699, 0.0342379, 1.266283, 0.9333333, 0, 1, 1,
0.9272717, 1.124332, -0.2795728, 0.9372549, 0, 1, 1,
0.9295973, 1.13554, -1.288801, 0.945098, 0, 1, 1,
0.9431277, 0.7663049, 1.037715, 0.9490196, 0, 1, 1,
0.9446443, 0.6475595, -0.5065431, 0.9568627, 0, 1, 1,
0.9496935, -1.041223, 1.604287, 0.9607843, 0, 1, 1,
0.9499791, -0.6445242, 0.3872141, 0.9686275, 0, 1, 1,
0.9593291, 0.3182388, 0.9212686, 0.972549, 0, 1, 1,
0.9597958, -0.8194844, 0.763669, 0.9803922, 0, 1, 1,
0.9601943, -0.1549434, 1.52359, 0.9843137, 0, 1, 1,
0.9646569, 1.386984, 0.7710825, 0.9921569, 0, 1, 1,
0.9665745, -0.8894073, 1.498685, 0.9960784, 0, 1, 1,
0.9719734, -1.352103, 3.463255, 1, 0, 0.9960784, 1,
0.9756677, -0.5867251, 3.506254, 1, 0, 0.9882353, 1,
0.9769902, 0.6906225, 0.6882302, 1, 0, 0.9843137, 1,
0.9814895, 0.07016112, 1.147084, 1, 0, 0.9764706, 1,
0.9846828, 1.016615, 0.6380661, 1, 0, 0.972549, 1,
0.9896612, -0.01669324, 2.01828, 1, 0, 0.9647059, 1,
1.000428, -0.6278002, 1.137593, 1, 0, 0.9607843, 1,
1.013657, -0.5012473, 1.504046, 1, 0, 0.9529412, 1,
1.017985, 0.1056192, 2.15013, 1, 0, 0.9490196, 1,
1.021818, 1.292255, 1.068384, 1, 0, 0.9411765, 1,
1.025254, 0.3707719, 0.8974806, 1, 0, 0.9372549, 1,
1.025816, 0.8549036, 1.040786, 1, 0, 0.9294118, 1,
1.026839, -1.345592, 2.833066, 1, 0, 0.9254902, 1,
1.029201, 1.538626, -0.2567461, 1, 0, 0.9176471, 1,
1.029526, -0.8482803, 2.868028, 1, 0, 0.9137255, 1,
1.032695, -0.1147193, 2.233634, 1, 0, 0.9058824, 1,
1.035421, -0.04711679, 2.292561, 1, 0, 0.9019608, 1,
1.038418, 1.251817, -0.3002321, 1, 0, 0.8941177, 1,
1.040947, 0.6342999, 0.3550447, 1, 0, 0.8862745, 1,
1.043091, -1.553593, 1.958008, 1, 0, 0.8823529, 1,
1.045642, 0.7506847, 1.395033, 1, 0, 0.8745098, 1,
1.047544, -1.256361, 3.460994, 1, 0, 0.8705882, 1,
1.054051, -0.5492937, 2.034802, 1, 0, 0.8627451, 1,
1.057898, 1.663842, -0.7421572, 1, 0, 0.8588235, 1,
1.06137, -0.6487009, 1.80555, 1, 0, 0.8509804, 1,
1.063318, -0.3790907, 2.527341, 1, 0, 0.8470588, 1,
1.073245, 0.5658784, -0.1191891, 1, 0, 0.8392157, 1,
1.075165, 0.5268391, 2.166722, 1, 0, 0.8352941, 1,
1.083248, 1.483448, 1.551614, 1, 0, 0.827451, 1,
1.088304, 1.058717, 0.6063256, 1, 0, 0.8235294, 1,
1.10187, -0.08273426, 2.030366, 1, 0, 0.8156863, 1,
1.103948, -0.4489088, 0.9327757, 1, 0, 0.8117647, 1,
1.109445, 0.8434741, 2.174805, 1, 0, 0.8039216, 1,
1.112026, 0.7418299, 2.026533, 1, 0, 0.7960784, 1,
1.118547, -1.178537, 1.752232, 1, 0, 0.7921569, 1,
1.118692, -1.154871, 4.597558, 1, 0, 0.7843137, 1,
1.124158, -1.020983, 2.919865, 1, 0, 0.7803922, 1,
1.126426, -0.5963428, 0.06643157, 1, 0, 0.772549, 1,
1.131619, -0.292066, 0.260486, 1, 0, 0.7686275, 1,
1.134971, 1.083087, 1.13033, 1, 0, 0.7607843, 1,
1.137476, -1.26807, 2.213613, 1, 0, 0.7568628, 1,
1.145613, 2.173437, 1.412622, 1, 0, 0.7490196, 1,
1.152737, -0.118381, 1.293053, 1, 0, 0.7450981, 1,
1.165056, -1.299013, 3.085231, 1, 0, 0.7372549, 1,
1.167526, 1.490824, 1.198532, 1, 0, 0.7333333, 1,
1.16775, 0.8369866, 2.13213, 1, 0, 0.7254902, 1,
1.172759, -1.550769, 3.814466, 1, 0, 0.7215686, 1,
1.172832, -0.2315502, 1.670859, 1, 0, 0.7137255, 1,
1.177835, 0.7486751, 1.123551, 1, 0, 0.7098039, 1,
1.179963, 0.7963927, 3.428417, 1, 0, 0.7019608, 1,
1.186462, 0.1045056, 2.575762, 1, 0, 0.6941177, 1,
1.191008, 0.433282, 2.728548, 1, 0, 0.6901961, 1,
1.191872, -0.4621524, 0.3676287, 1, 0, 0.682353, 1,
1.195464, 0.5042261, 2.33817, 1, 0, 0.6784314, 1,
1.197246, -0.3263049, 2.999211, 1, 0, 0.6705883, 1,
1.197731, 0.4425414, 1.574971, 1, 0, 0.6666667, 1,
1.216472, -0.2846776, 2.034852, 1, 0, 0.6588235, 1,
1.244388, -0.169402, 1.715464, 1, 0, 0.654902, 1,
1.244973, 0.810023, 0.3907946, 1, 0, 0.6470588, 1,
1.248587, -0.04335598, 2.70564, 1, 0, 0.6431373, 1,
1.248887, 0.9782026, 0.5443198, 1, 0, 0.6352941, 1,
1.249276, 0.2622564, 2.326559, 1, 0, 0.6313726, 1,
1.249789, -0.7396786, 1.228821, 1, 0, 0.6235294, 1,
1.25409, -0.2787671, 2.523372, 1, 0, 0.6196079, 1,
1.259063, -0.2638574, 2.776547, 1, 0, 0.6117647, 1,
1.267038, -2.501081, 2.829669, 1, 0, 0.6078432, 1,
1.268867, 0.3018903, 1.81418, 1, 0, 0.6, 1,
1.272169, -0.1582907, 2.766383, 1, 0, 0.5921569, 1,
1.277034, 1.004083, 0.9355243, 1, 0, 0.5882353, 1,
1.287233, 0.7916591, 1.7416, 1, 0, 0.5803922, 1,
1.289822, 0.529828, 1.728904, 1, 0, 0.5764706, 1,
1.297842, 0.9060783, 3.176059, 1, 0, 0.5686275, 1,
1.298996, 0.135291, 2.598304, 1, 0, 0.5647059, 1,
1.308491, -0.8032387, 3.110289, 1, 0, 0.5568628, 1,
1.32714, 1.324697, 1.686343, 1, 0, 0.5529412, 1,
1.330964, 0.3680725, 1.653353, 1, 0, 0.5450981, 1,
1.331448, -0.6554291, 3.080425, 1, 0, 0.5411765, 1,
1.333778, -0.2449472, 1.706466, 1, 0, 0.5333334, 1,
1.340303, 0.3461473, 2.049931, 1, 0, 0.5294118, 1,
1.35218, -0.4787008, 0.6661514, 1, 0, 0.5215687, 1,
1.353375, -0.5910535, 1.658996, 1, 0, 0.5176471, 1,
1.354669, 0.5701392, 0.4057321, 1, 0, 0.509804, 1,
1.356755, -0.6348511, 3.555437, 1, 0, 0.5058824, 1,
1.363954, 1.111502, 2.046553, 1, 0, 0.4980392, 1,
1.368179, -0.1613299, 2.725734, 1, 0, 0.4901961, 1,
1.371258, 1.005203, -0.2929836, 1, 0, 0.4862745, 1,
1.374857, -1.019783, 1.884184, 1, 0, 0.4784314, 1,
1.379626, -0.8624851, 0.8725185, 1, 0, 0.4745098, 1,
1.380417, 2.27604, -0.03155469, 1, 0, 0.4666667, 1,
1.381949, -0.4074084, 1.850235, 1, 0, 0.4627451, 1,
1.385397, -0.8050718, 4.333195, 1, 0, 0.454902, 1,
1.389127, 0.514918, 2.095963, 1, 0, 0.4509804, 1,
1.392612, 3.558955, 0.6174922, 1, 0, 0.4431373, 1,
1.392822, -1.80363, 3.143859, 1, 0, 0.4392157, 1,
1.407837, -2.745026, 3.392337, 1, 0, 0.4313726, 1,
1.408535, -0.4387082, 2.167259, 1, 0, 0.427451, 1,
1.416836, 1.553012, 2.198555, 1, 0, 0.4196078, 1,
1.430376, 1.264207, 1.247107, 1, 0, 0.4156863, 1,
1.441384, 0.5915741, 3.092143, 1, 0, 0.4078431, 1,
1.447635, -1.686071, 2.174712, 1, 0, 0.4039216, 1,
1.463598, -1.031235, 2.236295, 1, 0, 0.3960784, 1,
1.467544, 1.314098, 2.02053, 1, 0, 0.3882353, 1,
1.473122, -2.166301, 2.091568, 1, 0, 0.3843137, 1,
1.482152, 0.8735816, 0.6365121, 1, 0, 0.3764706, 1,
1.485806, 0.2288101, 1.219668, 1, 0, 0.372549, 1,
1.494495, -0.5528468, 3.218536, 1, 0, 0.3647059, 1,
1.49558, -0.1421143, -0.5886297, 1, 0, 0.3607843, 1,
1.507499, 0.9968529, 0.7484307, 1, 0, 0.3529412, 1,
1.51292, 0.2104916, 2.264684, 1, 0, 0.3490196, 1,
1.515699, 0.1470658, 1.816663, 1, 0, 0.3411765, 1,
1.529865, 1.070861, 2.160046, 1, 0, 0.3372549, 1,
1.535938, 0.1224632, 0.6017853, 1, 0, 0.3294118, 1,
1.537418, 1.289816, 1.699029, 1, 0, 0.3254902, 1,
1.541196, 1.588623, -0.3386612, 1, 0, 0.3176471, 1,
1.552583, 1.853224, 1.361163, 1, 0, 0.3137255, 1,
1.554273, 0.821111, 0.2241594, 1, 0, 0.3058824, 1,
1.555837, -0.6029217, 1.370682, 1, 0, 0.2980392, 1,
1.559927, -0.4239841, 3.00976, 1, 0, 0.2941177, 1,
1.560309, -0.4910975, 0.8728034, 1, 0, 0.2862745, 1,
1.567106, -0.4471927, 1.228296, 1, 0, 0.282353, 1,
1.605578, -0.08660683, 2.124401, 1, 0, 0.2745098, 1,
1.613721, 0.2647784, 2.690406, 1, 0, 0.2705882, 1,
1.61519, -0.2437623, 1.041811, 1, 0, 0.2627451, 1,
1.618644, 1.186181, 0.4559539, 1, 0, 0.2588235, 1,
1.621288, -0.1537245, 2.076255, 1, 0, 0.2509804, 1,
1.624139, -0.07141346, 0.7773681, 1, 0, 0.2470588, 1,
1.653885, -0.5417719, 3.338857, 1, 0, 0.2392157, 1,
1.655166, -1.539487, 2.517233, 1, 0, 0.2352941, 1,
1.668941, 0.8362341, 0.7223423, 1, 0, 0.227451, 1,
1.674792, -1.487139, 3.520182, 1, 0, 0.2235294, 1,
1.676843, -0.983679, 1.183595, 1, 0, 0.2156863, 1,
1.677975, -0.239637, -0.01302605, 1, 0, 0.2117647, 1,
1.679802, 1.670026, 0.7292822, 1, 0, 0.2039216, 1,
1.698924, -0.7265614, 4.36455, 1, 0, 0.1960784, 1,
1.703768, -1.411857, 3.043573, 1, 0, 0.1921569, 1,
1.72798, -0.1735543, 2.348436, 1, 0, 0.1843137, 1,
1.731267, -1.033562, 1.244161, 1, 0, 0.1803922, 1,
1.767115, 0.2289816, 0.5995495, 1, 0, 0.172549, 1,
1.805367, 0.2118073, 1.682936, 1, 0, 0.1686275, 1,
1.839211, 0.6842945, 1.51366, 1, 0, 0.1607843, 1,
1.876984, -1.49749, 1.514447, 1, 0, 0.1568628, 1,
1.897918, 0.968003, 1.368816, 1, 0, 0.1490196, 1,
1.916507, -0.5923327, 0.5929869, 1, 0, 0.145098, 1,
1.939901, 0.02660784, 0.402186, 1, 0, 0.1372549, 1,
1.996823, 0.5707425, 0.364547, 1, 0, 0.1333333, 1,
2.029553, 0.2570906, 1.650492, 1, 0, 0.1254902, 1,
2.068973, 1.160734, -0.6814157, 1, 0, 0.1215686, 1,
2.155656, 1.961797, -0.2313, 1, 0, 0.1137255, 1,
2.176731, 0.9731659, 2.520567, 1, 0, 0.1098039, 1,
2.193193, -2.172846, 2.537297, 1, 0, 0.1019608, 1,
2.22716, -0.2935764, 0.4146829, 1, 0, 0.09411765, 1,
2.263722, -0.6406096, 1.659125, 1, 0, 0.09019608, 1,
2.296451, 0.5298969, 1.709329, 1, 0, 0.08235294, 1,
2.397519, -0.4754942, 1.360786, 1, 0, 0.07843138, 1,
2.420263, -1.238222, -0.03172111, 1, 0, 0.07058824, 1,
2.441, -0.177366, 1.533735, 1, 0, 0.06666667, 1,
2.514905, -0.1929379, -0.08393819, 1, 0, 0.05882353, 1,
2.547732, 0.2425268, 3.231514, 1, 0, 0.05490196, 1,
2.550885, -0.2464827, 2.407465, 1, 0, 0.04705882, 1,
2.611796, -0.143687, -0.5345002, 1, 0, 0.04313726, 1,
2.621042, -0.9295554, 2.58856, 1, 0, 0.03529412, 1,
2.633094, 0.7833771, 1.826171, 1, 0, 0.03137255, 1,
2.666683, 0.2240759, 1.203848, 1, 0, 0.02352941, 1,
2.706406, 0.9764662, 2.106061, 1, 0, 0.01960784, 1,
2.956675, 0.9554788, 1.530001, 1, 0, 0.01176471, 1,
3.601488, -0.333946, 1.769653, 1, 0, 0.007843138, 1
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
0.275015, -4.262211, -6.82657, 0, -0.5, 0.5, 0.5,
0.275015, -4.262211, -6.82657, 1, -0.5, 0.5, 0.5,
0.275015, -4.262211, -6.82657, 1, 1.5, 0.5, 0.5,
0.275015, -4.262211, -6.82657, 0, 1.5, 0.5, 0.5
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
-4.179132, 0.2151476, -6.82657, 0, -0.5, 0.5, 0.5,
-4.179132, 0.2151476, -6.82657, 1, -0.5, 0.5, 0.5,
-4.179132, 0.2151476, -6.82657, 1, 1.5, 0.5, 0.5,
-4.179132, 0.2151476, -6.82657, 0, 1.5, 0.5, 0.5
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
-4.179132, -4.262211, -0.01561379, 0, -0.5, 0.5, 0.5,
-4.179132, -4.262211, -0.01561379, 1, -0.5, 0.5, 0.5,
-4.179132, -4.262211, -0.01561379, 1, 1.5, 0.5, 0.5,
-4.179132, -4.262211, -0.01561379, 0, 1.5, 0.5, 0.5
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
-3, -3.228974, -5.25481,
3, -3.228974, -5.25481,
-3, -3.228974, -5.25481,
-3, -3.401181, -5.51677,
-2, -3.228974, -5.25481,
-2, -3.401181, -5.51677,
-1, -3.228974, -5.25481,
-1, -3.401181, -5.51677,
0, -3.228974, -5.25481,
0, -3.401181, -5.51677,
1, -3.228974, -5.25481,
1, -3.401181, -5.51677,
2, -3.228974, -5.25481,
2, -3.401181, -5.51677,
3, -3.228974, -5.25481,
3, -3.401181, -5.51677
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
-3, -3.745593, -6.04069, 0, -0.5, 0.5, 0.5,
-3, -3.745593, -6.04069, 1, -0.5, 0.5, 0.5,
-3, -3.745593, -6.04069, 1, 1.5, 0.5, 0.5,
-3, -3.745593, -6.04069, 0, 1.5, 0.5, 0.5,
-2, -3.745593, -6.04069, 0, -0.5, 0.5, 0.5,
-2, -3.745593, -6.04069, 1, -0.5, 0.5, 0.5,
-2, -3.745593, -6.04069, 1, 1.5, 0.5, 0.5,
-2, -3.745593, -6.04069, 0, 1.5, 0.5, 0.5,
-1, -3.745593, -6.04069, 0, -0.5, 0.5, 0.5,
-1, -3.745593, -6.04069, 1, -0.5, 0.5, 0.5,
-1, -3.745593, -6.04069, 1, 1.5, 0.5, 0.5,
-1, -3.745593, -6.04069, 0, 1.5, 0.5, 0.5,
0, -3.745593, -6.04069, 0, -0.5, 0.5, 0.5,
0, -3.745593, -6.04069, 1, -0.5, 0.5, 0.5,
0, -3.745593, -6.04069, 1, 1.5, 0.5, 0.5,
0, -3.745593, -6.04069, 0, 1.5, 0.5, 0.5,
1, -3.745593, -6.04069, 0, -0.5, 0.5, 0.5,
1, -3.745593, -6.04069, 1, -0.5, 0.5, 0.5,
1, -3.745593, -6.04069, 1, 1.5, 0.5, 0.5,
1, -3.745593, -6.04069, 0, 1.5, 0.5, 0.5,
2, -3.745593, -6.04069, 0, -0.5, 0.5, 0.5,
2, -3.745593, -6.04069, 1, -0.5, 0.5, 0.5,
2, -3.745593, -6.04069, 1, 1.5, 0.5, 0.5,
2, -3.745593, -6.04069, 0, 1.5, 0.5, 0.5,
3, -3.745593, -6.04069, 0, -0.5, 0.5, 0.5,
3, -3.745593, -6.04069, 1, -0.5, 0.5, 0.5,
3, -3.745593, -6.04069, 1, 1.5, 0.5, 0.5,
3, -3.745593, -6.04069, 0, 1.5, 0.5, 0.5
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
-3.151252, -3, -5.25481,
-3.151252, 3, -5.25481,
-3.151252, -3, -5.25481,
-3.322565, -3, -5.51677,
-3.151252, -2, -5.25481,
-3.322565, -2, -5.51677,
-3.151252, -1, -5.25481,
-3.322565, -1, -5.51677,
-3.151252, 0, -5.25481,
-3.322565, 0, -5.51677,
-3.151252, 1, -5.25481,
-3.322565, 1, -5.51677,
-3.151252, 2, -5.25481,
-3.322565, 2, -5.51677,
-3.151252, 3, -5.25481,
-3.322565, 3, -5.51677
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
-3.665192, -3, -6.04069, 0, -0.5, 0.5, 0.5,
-3.665192, -3, -6.04069, 1, -0.5, 0.5, 0.5,
-3.665192, -3, -6.04069, 1, 1.5, 0.5, 0.5,
-3.665192, -3, -6.04069, 0, 1.5, 0.5, 0.5,
-3.665192, -2, -6.04069, 0, -0.5, 0.5, 0.5,
-3.665192, -2, -6.04069, 1, -0.5, 0.5, 0.5,
-3.665192, -2, -6.04069, 1, 1.5, 0.5, 0.5,
-3.665192, -2, -6.04069, 0, 1.5, 0.5, 0.5,
-3.665192, -1, -6.04069, 0, -0.5, 0.5, 0.5,
-3.665192, -1, -6.04069, 1, -0.5, 0.5, 0.5,
-3.665192, -1, -6.04069, 1, 1.5, 0.5, 0.5,
-3.665192, -1, -6.04069, 0, 1.5, 0.5, 0.5,
-3.665192, 0, -6.04069, 0, -0.5, 0.5, 0.5,
-3.665192, 0, -6.04069, 1, -0.5, 0.5, 0.5,
-3.665192, 0, -6.04069, 1, 1.5, 0.5, 0.5,
-3.665192, 0, -6.04069, 0, 1.5, 0.5, 0.5,
-3.665192, 1, -6.04069, 0, -0.5, 0.5, 0.5,
-3.665192, 1, -6.04069, 1, -0.5, 0.5, 0.5,
-3.665192, 1, -6.04069, 1, 1.5, 0.5, 0.5,
-3.665192, 1, -6.04069, 0, 1.5, 0.5, 0.5,
-3.665192, 2, -6.04069, 0, -0.5, 0.5, 0.5,
-3.665192, 2, -6.04069, 1, -0.5, 0.5, 0.5,
-3.665192, 2, -6.04069, 1, 1.5, 0.5, 0.5,
-3.665192, 2, -6.04069, 0, 1.5, 0.5, 0.5,
-3.665192, 3, -6.04069, 0, -0.5, 0.5, 0.5,
-3.665192, 3, -6.04069, 1, -0.5, 0.5, 0.5,
-3.665192, 3, -6.04069, 1, 1.5, 0.5, 0.5,
-3.665192, 3, -6.04069, 0, 1.5, 0.5, 0.5
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
-3.151252, -3.228974, -4,
-3.151252, -3.228974, 4,
-3.151252, -3.228974, -4,
-3.322565, -3.401181, -4,
-3.151252, -3.228974, -2,
-3.322565, -3.401181, -2,
-3.151252, -3.228974, 0,
-3.322565, -3.401181, 0,
-3.151252, -3.228974, 2,
-3.322565, -3.401181, 2,
-3.151252, -3.228974, 4,
-3.322565, -3.401181, 4
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
-3.665192, -3.745593, -4, 0, -0.5, 0.5, 0.5,
-3.665192, -3.745593, -4, 1, -0.5, 0.5, 0.5,
-3.665192, -3.745593, -4, 1, 1.5, 0.5, 0.5,
-3.665192, -3.745593, -4, 0, 1.5, 0.5, 0.5,
-3.665192, -3.745593, -2, 0, -0.5, 0.5, 0.5,
-3.665192, -3.745593, -2, 1, -0.5, 0.5, 0.5,
-3.665192, -3.745593, -2, 1, 1.5, 0.5, 0.5,
-3.665192, -3.745593, -2, 0, 1.5, 0.5, 0.5,
-3.665192, -3.745593, 0, 0, -0.5, 0.5, 0.5,
-3.665192, -3.745593, 0, 1, -0.5, 0.5, 0.5,
-3.665192, -3.745593, 0, 1, 1.5, 0.5, 0.5,
-3.665192, -3.745593, 0, 0, 1.5, 0.5, 0.5,
-3.665192, -3.745593, 2, 0, -0.5, 0.5, 0.5,
-3.665192, -3.745593, 2, 1, -0.5, 0.5, 0.5,
-3.665192, -3.745593, 2, 1, 1.5, 0.5, 0.5,
-3.665192, -3.745593, 2, 0, 1.5, 0.5, 0.5,
-3.665192, -3.745593, 4, 0, -0.5, 0.5, 0.5,
-3.665192, -3.745593, 4, 1, -0.5, 0.5, 0.5,
-3.665192, -3.745593, 4, 1, 1.5, 0.5, 0.5,
-3.665192, -3.745593, 4, 0, 1.5, 0.5, 0.5
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
-3.151252, -3.228974, -5.25481,
-3.151252, 3.65927, -5.25481,
-3.151252, -3.228974, 5.223583,
-3.151252, 3.65927, 5.223583,
-3.151252, -3.228974, -5.25481,
-3.151252, -3.228974, 5.223583,
-3.151252, 3.65927, -5.25481,
-3.151252, 3.65927, 5.223583,
-3.151252, -3.228974, -5.25481,
3.701282, -3.228974, -5.25481,
-3.151252, -3.228974, 5.223583,
3.701282, -3.228974, 5.223583,
-3.151252, 3.65927, -5.25481,
3.701282, 3.65927, -5.25481,
-3.151252, 3.65927, 5.223583,
3.701282, 3.65927, 5.223583,
3.701282, -3.228974, -5.25481,
3.701282, 3.65927, -5.25481,
3.701282, -3.228974, 5.223583,
3.701282, 3.65927, 5.223583,
3.701282, -3.228974, -5.25481,
3.701282, -3.228974, 5.223583,
3.701282, 3.65927, -5.25481,
3.701282, 3.65927, 5.223583
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
var radius = 7.63054;
var distance = 33.94913;
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
mvMatrix.translate( -0.275015, -0.2151476, 0.01561379 );
mvMatrix.scale( 1.203977, 1.197735, 0.7873621 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94913);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Phenylcarbamate<-read.table("Phenylcarbamate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenylcarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenylcarbamate' not found
```

```r
y<-Phenylcarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenylcarbamate' not found
```

```r
z<-Phenylcarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenylcarbamate' not found
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
-3.051458, -0.4808447, -1.842599, 0, 0, 1, 1, 1,
-3.05075, 1.740329, -0.991513, 1, 0, 0, 1, 1,
-2.90317, -2.769989, -2.417996, 1, 0, 0, 1, 1,
-2.698344, 0.4561022, -0.5254309, 1, 0, 0, 1, 1,
-2.647565, -1.592647, -2.822453, 1, 0, 0, 1, 1,
-2.629983, -0.4941876, -4.068597, 1, 0, 0, 1, 1,
-2.623217, 0.2085369, -2.070336, 0, 0, 0, 1, 1,
-2.595716, -1.715567, -1.796637, 0, 0, 0, 1, 1,
-2.564676, 0.6194763, -0.8543171, 0, 0, 0, 1, 1,
-2.520939, 1.397265, -0.8101703, 0, 0, 0, 1, 1,
-2.463156, -0.6156433, -3.417735, 0, 0, 0, 1, 1,
-2.398675, 0.8637623, -2.954326, 0, 0, 0, 1, 1,
-2.3925, 0.841885, -1.406091, 0, 0, 0, 1, 1,
-2.37352, 0.2501272, -1.116315, 1, 1, 1, 1, 1,
-2.329873, -0.8335853, -1.086913, 1, 1, 1, 1, 1,
-2.249355, -2.620622, -1.519027, 1, 1, 1, 1, 1,
-2.220228, 1.048037, -0.1099996, 1, 1, 1, 1, 1,
-2.175228, -0.2669908, -1.802515, 1, 1, 1, 1, 1,
-2.16848, -0.04631102, -2.390304, 1, 1, 1, 1, 1,
-2.152451, -0.05632379, -1.610973, 1, 1, 1, 1, 1,
-2.151926, 1.910712, -0.7547278, 1, 1, 1, 1, 1,
-2.095601, 0.5941801, 0.9900678, 1, 1, 1, 1, 1,
-2.024631, -0.4591872, -1.792441, 1, 1, 1, 1, 1,
-1.984681, -1.121247, -2.3396, 1, 1, 1, 1, 1,
-1.977965, -0.6550367, -1.80485, 1, 1, 1, 1, 1,
-1.972238, 1.543563, -0.8042938, 1, 1, 1, 1, 1,
-1.937585, -0.9980461, -1.215209, 1, 1, 1, 1, 1,
-1.921953, 0.1248173, -1.387907, 1, 1, 1, 1, 1,
-1.912199, 0.294168, 0.06769416, 0, 0, 1, 1, 1,
-1.911018, -1.182328, -3.161543, 1, 0, 0, 1, 1,
-1.906203, 0.8896422, -2.11338, 1, 0, 0, 1, 1,
-1.905146, 1.422749, -0.2751072, 1, 0, 0, 1, 1,
-1.895368, -0.2177784, 0.6339622, 1, 0, 0, 1, 1,
-1.862955, 1.691471, -2.465858, 1, 0, 0, 1, 1,
-1.854199, -1.086904, -1.712319, 0, 0, 0, 1, 1,
-1.844497, 1.265318, -1.102154, 0, 0, 0, 1, 1,
-1.828237, -1.663343, -3.561304, 0, 0, 0, 1, 1,
-1.820734, -1.319907, -2.536327, 0, 0, 0, 1, 1,
-1.819966, 1.253829, -2.743541, 0, 0, 0, 1, 1,
-1.789043, 0.6975927, -1.845974, 0, 0, 0, 1, 1,
-1.777699, 0.5019057, -1.902634, 0, 0, 0, 1, 1,
-1.765006, -0.6932362, -2.32873, 1, 1, 1, 1, 1,
-1.749227, -0.5567124, -1.712745, 1, 1, 1, 1, 1,
-1.739475, 0.004549242, -1.435918, 1, 1, 1, 1, 1,
-1.734234, 1.226657, -1.405832, 1, 1, 1, 1, 1,
-1.733769, 0.03452151, -1.2011, 1, 1, 1, 1, 1,
-1.716572, 0.1543228, -3.130356, 1, 1, 1, 1, 1,
-1.703953, 0.1886138, -2.318063, 1, 1, 1, 1, 1,
-1.700839, 0.3739878, -0.754522, 1, 1, 1, 1, 1,
-1.700062, -0.9245853, -1.609878, 1, 1, 1, 1, 1,
-1.68215, -0.7011561, -1.066046, 1, 1, 1, 1, 1,
-1.663414, -0.8294624, -2.303504, 1, 1, 1, 1, 1,
-1.648441, -0.3210013, -1.575192, 1, 1, 1, 1, 1,
-1.63905, 1.535692, -2.564955, 1, 1, 1, 1, 1,
-1.629424, -1.02866, -2.573576, 1, 1, 1, 1, 1,
-1.614569, 1.186079, -2.231599, 1, 1, 1, 1, 1,
-1.597378, -0.7067772, -0.9551374, 0, 0, 1, 1, 1,
-1.592014, -1.202738, -1.788941, 1, 0, 0, 1, 1,
-1.558541, 0.1949407, -0.7220044, 1, 0, 0, 1, 1,
-1.5559, 1.485983, -0.7939892, 1, 0, 0, 1, 1,
-1.552534, 0.3643768, -0.9151552, 1, 0, 0, 1, 1,
-1.552293, -1.429074, -3.28436, 1, 0, 0, 1, 1,
-1.546737, 0.839685, -0.356019, 0, 0, 0, 1, 1,
-1.543015, -0.5309937, -1.235437, 0, 0, 0, 1, 1,
-1.524605, 0.1976461, -0.588201, 0, 0, 0, 1, 1,
-1.517583, 0.1477642, 0.2431906, 0, 0, 0, 1, 1,
-1.516166, 0.8565939, -0.1389602, 0, 0, 0, 1, 1,
-1.498468, 1.558823, -3.65561, 0, 0, 0, 1, 1,
-1.492595, 1.055923, -1.248324, 0, 0, 0, 1, 1,
-1.491337, -0.3977554, -0.219489, 1, 1, 1, 1, 1,
-1.486786, -0.8035046, -1.201663, 1, 1, 1, 1, 1,
-1.478119, -0.256322, -2.943289, 1, 1, 1, 1, 1,
-1.474182, 0.5403324, -2.242027, 1, 1, 1, 1, 1,
-1.472104, 0.1572639, -1.431215, 1, 1, 1, 1, 1,
-1.468746, 0.05616037, -1.867239, 1, 1, 1, 1, 1,
-1.45725, 1.134585, -0.7653084, 1, 1, 1, 1, 1,
-1.451988, -0.6727956, -2.502833, 1, 1, 1, 1, 1,
-1.447422, 0.7373173, 0.3521189, 1, 1, 1, 1, 1,
-1.446824, -0.3000216, -1.182822, 1, 1, 1, 1, 1,
-1.44212, -0.6015697, -0.9660755, 1, 1, 1, 1, 1,
-1.440411, -0.6249935, -1.359702, 1, 1, 1, 1, 1,
-1.436366, -1.424235, -0.1233105, 1, 1, 1, 1, 1,
-1.427269, 0.1006687, -0.816655, 1, 1, 1, 1, 1,
-1.424602, -0.3714068, -2.745777, 1, 1, 1, 1, 1,
-1.422662, -0.8911415, -2.524275, 0, 0, 1, 1, 1,
-1.409034, 0.1209532, -2.701177, 1, 0, 0, 1, 1,
-1.399733, 0.1104058, -2.046085, 1, 0, 0, 1, 1,
-1.394584, 1.861613, -0.4168951, 1, 0, 0, 1, 1,
-1.390794, 1.646181, -2.06382, 1, 0, 0, 1, 1,
-1.388396, 1.173323, -0.065411, 1, 0, 0, 1, 1,
-1.381787, 2.017657, -0.7334986, 0, 0, 0, 1, 1,
-1.365466, -0.6771416, -1.9867, 0, 0, 0, 1, 1,
-1.363183, -1.139106, -2.760003, 0, 0, 0, 1, 1,
-1.360966, -1.387535, -0.1352347, 0, 0, 0, 1, 1,
-1.360603, 0.4497648, -1.850154, 0, 0, 0, 1, 1,
-1.353361, -1.239974, -3.273863, 0, 0, 0, 1, 1,
-1.351165, 0.4306836, -2.282066, 0, 0, 0, 1, 1,
-1.342862, 2.134701, 0.146663, 1, 1, 1, 1, 1,
-1.338208, 1.274409, 0.03490784, 1, 1, 1, 1, 1,
-1.324945, -0.6887562, 0.1429967, 1, 1, 1, 1, 1,
-1.324363, -2.599246, -2.639782, 1, 1, 1, 1, 1,
-1.321617, -0.9950442, -1.784784, 1, 1, 1, 1, 1,
-1.316584, 0.2302641, 0.2796693, 1, 1, 1, 1, 1,
-1.316507, 0.4110628, -1.084538, 1, 1, 1, 1, 1,
-1.314071, 0.3081833, -2.126553, 1, 1, 1, 1, 1,
-1.308062, 0.3543446, -0.06071485, 1, 1, 1, 1, 1,
-1.291831, -0.0635373, -2.009402, 1, 1, 1, 1, 1,
-1.287674, -0.2293955, -1.760939, 1, 1, 1, 1, 1,
-1.259872, -1.69006, -2.823402, 1, 1, 1, 1, 1,
-1.254084, 0.3913839, -1.04812, 1, 1, 1, 1, 1,
-1.246345, 0.2033692, 0.5068985, 1, 1, 1, 1, 1,
-1.242689, 2.431809, -1.155682, 1, 1, 1, 1, 1,
-1.240838, 0.5005217, -1.786767, 0, 0, 1, 1, 1,
-1.240608, 0.4271701, -0.9395213, 1, 0, 0, 1, 1,
-1.240561, -0.3094371, -2.445644, 1, 0, 0, 1, 1,
-1.236344, -2.765296, -3.595528, 1, 0, 0, 1, 1,
-1.222044, 0.6568351, -1.3037, 1, 0, 0, 1, 1,
-1.203547, -0.7177953, -0.1616004, 1, 0, 0, 1, 1,
-1.201455, -2.026114, -2.685942, 0, 0, 0, 1, 1,
-1.200449, -0.5518245, -1.862396, 0, 0, 0, 1, 1,
-1.191663, -0.8020573, -2.911887, 0, 0, 0, 1, 1,
-1.190238, 1.615923, 2.029537, 0, 0, 0, 1, 1,
-1.184598, -1.589374, -2.835551, 0, 0, 0, 1, 1,
-1.179473, -0.04634949, 0.4783849, 0, 0, 0, 1, 1,
-1.176939, -0.3584448, -1.419196, 0, 0, 0, 1, 1,
-1.176232, -0.8370972, -1.126294, 1, 1, 1, 1, 1,
-1.168382, -1.252395, -5.102212, 1, 1, 1, 1, 1,
-1.163374, -0.7245131, -3.126166, 1, 1, 1, 1, 1,
-1.161621, -0.3952079, -1.160317, 1, 1, 1, 1, 1,
-1.154633, 0.477986, -0.5771706, 1, 1, 1, 1, 1,
-1.142144, 0.524462, -2.182158, 1, 1, 1, 1, 1,
-1.137778, -0.748257, -2.435613, 1, 1, 1, 1, 1,
-1.133886, 0.9775078, -1.658987, 1, 1, 1, 1, 1,
-1.13093, -0.9138114, -2.046033, 1, 1, 1, 1, 1,
-1.128994, 1.01394, -0.6508048, 1, 1, 1, 1, 1,
-1.121255, -0.2607747, -1.546332, 1, 1, 1, 1, 1,
-1.1167, -1.342216, -3.314906, 1, 1, 1, 1, 1,
-1.113108, 0.3662047, -0.2173208, 1, 1, 1, 1, 1,
-1.111554, 0.2932274, -1.648732, 1, 1, 1, 1, 1,
-1.102975, 2.576898, 0.9943568, 1, 1, 1, 1, 1,
-1.090546, -1.115923, -2.383091, 0, 0, 1, 1, 1,
-1.086728, -0.7689341, -1.96931, 1, 0, 0, 1, 1,
-1.085947, -0.9746949, -3.77236, 1, 0, 0, 1, 1,
-1.067083, -0.3310306, -1.471784, 1, 0, 0, 1, 1,
-1.063709, -1.505895, -2.302492, 1, 0, 0, 1, 1,
-1.058932, 1.157136, 0.09026758, 1, 0, 0, 1, 1,
-1.057575, -0.8033888, -2.57314, 0, 0, 0, 1, 1,
-1.049185, 0.04934681, -2.084889, 0, 0, 0, 1, 1,
-1.047809, 0.1683065, -0.9167603, 0, 0, 0, 1, 1,
-1.047244, 0.1203263, -2.955137, 0, 0, 0, 1, 1,
-1.046873, -0.8996629, -2.765312, 0, 0, 0, 1, 1,
-1.037046, 1.750914, -1.029318, 0, 0, 0, 1, 1,
-1.036361, -0.2866356, -3.489988, 0, 0, 0, 1, 1,
-1.02546, 0.5422774, -2.541423, 1, 1, 1, 1, 1,
-1.021184, -0.5936727, -0.7107437, 1, 1, 1, 1, 1,
-1.018861, 0.342868, -1.751727, 1, 1, 1, 1, 1,
-1.014868, 2.807851, 0.5799773, 1, 1, 1, 1, 1,
-1.013856, 0.2089135, -2.128525, 1, 1, 1, 1, 1,
-1.01213, 1.462046, -0.8558546, 1, 1, 1, 1, 1,
-1.011963, -1.025169, -1.206718, 1, 1, 1, 1, 1,
-1.0115, 0.2448786, -1.207715, 1, 1, 1, 1, 1,
-1.007725, 0.1875843, -2.817266, 1, 1, 1, 1, 1,
-1.00149, -1.396283, -1.494952, 1, 1, 1, 1, 1,
-0.999747, 1.115415, 0.01884479, 1, 1, 1, 1, 1,
-0.9972456, 1.326061, -0.9431282, 1, 1, 1, 1, 1,
-0.9910786, -1.251263, -2.385721, 1, 1, 1, 1, 1,
-0.9892641, -0.9971607, -4.382475, 1, 1, 1, 1, 1,
-0.9891747, -0.6384528, -1.408177, 1, 1, 1, 1, 1,
-0.9824945, -0.6112485, -1.548999, 0, 0, 1, 1, 1,
-0.9780761, 0.9040278, -0.3100997, 1, 0, 0, 1, 1,
-0.974739, 0.6740315, -1.282415, 1, 0, 0, 1, 1,
-0.9679493, 0.6380017, 0.1010671, 1, 0, 0, 1, 1,
-0.9642048, -1.795821, -2.090267, 1, 0, 0, 1, 1,
-0.9587846, -0.8108559, -2.200804, 1, 0, 0, 1, 1,
-0.9585307, -0.3672647, -1.828829, 0, 0, 0, 1, 1,
-0.9509742, 0.230033, -0.9099406, 0, 0, 0, 1, 1,
-0.9460273, -1.738619, -4.545031, 0, 0, 0, 1, 1,
-0.9411975, -0.1866082, -0.7967084, 0, 0, 0, 1, 1,
-0.9304623, 0.5875212, -0.2184946, 0, 0, 0, 1, 1,
-0.9226642, -1.143147, -4.192639, 0, 0, 0, 1, 1,
-0.9119492, -0.8578811, -2.383413, 0, 0, 0, 1, 1,
-0.9070032, -0.9201176, -0.9606418, 1, 1, 1, 1, 1,
-0.9016441, -0.6694773, -3.231261, 1, 1, 1, 1, 1,
-0.8973109, 1.471497, -0.8553567, 1, 1, 1, 1, 1,
-0.8969823, -0.3190515, -2.201574, 1, 1, 1, 1, 1,
-0.8959693, 0.1867044, -2.302488, 1, 1, 1, 1, 1,
-0.8599086, -1.341579, -2.149592, 1, 1, 1, 1, 1,
-0.8596555, 0.406827, -1.574272, 1, 1, 1, 1, 1,
-0.8528509, -1.347888, -3.676638, 1, 1, 1, 1, 1,
-0.8508393, -0.5820956, -1.721421, 1, 1, 1, 1, 1,
-0.8495536, 0.05545814, -3.603664, 1, 1, 1, 1, 1,
-0.8479556, 1.97018, 1.524278, 1, 1, 1, 1, 1,
-0.8463597, 0.6739944, -2.275268, 1, 1, 1, 1, 1,
-0.8362369, -0.09947943, -2.351432, 1, 1, 1, 1, 1,
-0.8348705, 0.7436207, -2.14432, 1, 1, 1, 1, 1,
-0.8284537, 0.1799154, 0.6788368, 1, 1, 1, 1, 1,
-0.8221396, -0.397099, -4.123825, 0, 0, 1, 1, 1,
-0.8214344, -0.6372732, -1.374741, 1, 0, 0, 1, 1,
-0.8153785, 1.996845, -0.3106796, 1, 0, 0, 1, 1,
-0.8133251, 1.624208, -0.196086, 1, 0, 0, 1, 1,
-0.8127154, -0.7276485, -2.629656, 1, 0, 0, 1, 1,
-0.8121027, 0.2081929, 0.07759991, 1, 0, 0, 1, 1,
-0.8055674, 0.07555124, -1.404751, 0, 0, 0, 1, 1,
-0.8009685, -0.2056553, -2.886291, 0, 0, 0, 1, 1,
-0.7999555, -0.4934035, -2.683694, 0, 0, 0, 1, 1,
-0.7938638, 0.8711915, 0.2515855, 0, 0, 0, 1, 1,
-0.7895142, -0.6716212, -2.626255, 0, 0, 0, 1, 1,
-0.7866505, -0.4548298, -1.417992, 0, 0, 0, 1, 1,
-0.7846466, 0.9270861, -1.223632, 0, 0, 0, 1, 1,
-0.7773059, -0.4835403, -3.178118, 1, 1, 1, 1, 1,
-0.776359, 0.1048904, -1.596307, 1, 1, 1, 1, 1,
-0.7748878, -0.09137092, -0.9658065, 1, 1, 1, 1, 1,
-0.7697566, 1.548577, -2.179811, 1, 1, 1, 1, 1,
-0.7673831, 0.2924645, -0.7134674, 1, 1, 1, 1, 1,
-0.7608262, 0.565435, -0.543792, 1, 1, 1, 1, 1,
-0.7592111, 1.140768, 1.214048, 1, 1, 1, 1, 1,
-0.7581393, 0.1093265, -0.7006342, 1, 1, 1, 1, 1,
-0.7562824, 0.3247606, -1.330689, 1, 1, 1, 1, 1,
-0.75437, -1.459621, -4.124847, 1, 1, 1, 1, 1,
-0.7481192, 1.853647, -2.794408, 1, 1, 1, 1, 1,
-0.7478434, -2.233788, -2.655057, 1, 1, 1, 1, 1,
-0.743643, -0.4847364, -2.142929, 1, 1, 1, 1, 1,
-0.7402487, 0.3434647, 0.8880122, 1, 1, 1, 1, 1,
-0.7392036, 0.6604625, 0.4711976, 1, 1, 1, 1, 1,
-0.7373297, 0.9319047, -0.885497, 0, 0, 1, 1, 1,
-0.7340998, 0.02275442, -2.610327, 1, 0, 0, 1, 1,
-0.733932, -1.181242, -3.365835, 1, 0, 0, 1, 1,
-0.7333409, -0.1820571, -0.9598579, 1, 0, 0, 1, 1,
-0.7242537, -0.4735028, -1.760557, 1, 0, 0, 1, 1,
-0.7167816, 1.329184, -0.3955032, 1, 0, 0, 1, 1,
-0.7105753, -0.3901164, -1.610647, 0, 0, 0, 1, 1,
-0.7103764, -0.9660849, -2.358138, 0, 0, 0, 1, 1,
-0.7084613, -0.03979242, -1.484103, 0, 0, 0, 1, 1,
-0.7005234, 0.7739556, -1.41482, 0, 0, 0, 1, 1,
-0.6980644, 0.2729695, -2.37326, 0, 0, 0, 1, 1,
-0.6959099, 0.1132684, -2.327057, 0, 0, 0, 1, 1,
-0.6916978, 1.147451, -0.6039724, 0, 0, 0, 1, 1,
-0.6868099, -0.6958145, -2.479049, 1, 1, 1, 1, 1,
-0.6853122, 0.4909059, -1.066084, 1, 1, 1, 1, 1,
-0.6838703, -0.175799, -2.368433, 1, 1, 1, 1, 1,
-0.6824228, -0.3019295, -3.92326, 1, 1, 1, 1, 1,
-0.6817256, -0.01935701, -2.039461, 1, 1, 1, 1, 1,
-0.6790561, -0.618921, -3.92314, 1, 1, 1, 1, 1,
-0.6781173, 1.12787, -0.9861316, 1, 1, 1, 1, 1,
-0.6762006, 1.109302, -1.563824, 1, 1, 1, 1, 1,
-0.6747661, 0.3406925, 0.5554448, 1, 1, 1, 1, 1,
-0.6719525, 1.584991, 1.229624, 1, 1, 1, 1, 1,
-0.671374, -0.2908536, -0.9176531, 1, 1, 1, 1, 1,
-0.6709699, -2.010951, -2.588089, 1, 1, 1, 1, 1,
-0.6708234, 1.077166, -3.370243, 1, 1, 1, 1, 1,
-0.670777, -0.875204, -2.487473, 1, 1, 1, 1, 1,
-0.6627959, -1.041679, -2.80038, 1, 1, 1, 1, 1,
-0.6595647, 1.422151, -1.166059, 0, 0, 1, 1, 1,
-0.6594151, -0.8742261, -1.12469, 1, 0, 0, 1, 1,
-0.657779, -0.302443, -2.230767, 1, 0, 0, 1, 1,
-0.6567434, 0.7583355, -1.888753, 1, 0, 0, 1, 1,
-0.6513506, 0.07646995, -0.7748765, 1, 0, 0, 1, 1,
-0.6509966, 0.5972721, 1.071034, 1, 0, 0, 1, 1,
-0.649897, 0.1297565, -0.4904461, 0, 0, 0, 1, 1,
-0.6489232, 1.64977, 0.5808123, 0, 0, 0, 1, 1,
-0.648159, -0.546321, -2.623441, 0, 0, 0, 1, 1,
-0.6453953, 0.2784013, 0.5422398, 0, 0, 0, 1, 1,
-0.6412662, -0.1075211, -2.13745, 0, 0, 0, 1, 1,
-0.6347891, -0.4009182, -1.760612, 0, 0, 0, 1, 1,
-0.6341081, 1.974718, -1.388721, 0, 0, 0, 1, 1,
-0.6323831, 0.8880494, -2.175486, 1, 1, 1, 1, 1,
-0.6323082, -0.3876004, -2.513889, 1, 1, 1, 1, 1,
-0.6226299, 0.8394898, -1.204584, 1, 1, 1, 1, 1,
-0.6079736, -1.553924, -2.063869, 1, 1, 1, 1, 1,
-0.6000039, 1.400466, -0.5976396, 1, 1, 1, 1, 1,
-0.5977621, 0.192927, -3.147412, 1, 1, 1, 1, 1,
-0.5972174, -0.5091966, -1.400051, 1, 1, 1, 1, 1,
-0.5958455, -0.07335721, -1.484065, 1, 1, 1, 1, 1,
-0.5942694, -0.02282814, -2.108681, 1, 1, 1, 1, 1,
-0.5867811, -0.1188978, -3.188949, 1, 1, 1, 1, 1,
-0.5785977, -2.017394, -2.520768, 1, 1, 1, 1, 1,
-0.5781752, 1.847244, -2.376639, 1, 1, 1, 1, 1,
-0.5777603, 0.00791703, -2.307621, 1, 1, 1, 1, 1,
-0.5690445, 0.2182433, -0.7600911, 1, 1, 1, 1, 1,
-0.5653429, -0.5064518, -1.845757, 1, 1, 1, 1, 1,
-0.564557, -2.208191, -3.777324, 0, 0, 1, 1, 1,
-0.5601564, 0.3762053, -0.3712582, 1, 0, 0, 1, 1,
-0.5591381, 0.5748888, -0.4629008, 1, 0, 0, 1, 1,
-0.558607, -0.915072, -4.112534, 1, 0, 0, 1, 1,
-0.5491906, 0.3277257, -1.37691, 1, 0, 0, 1, 1,
-0.5409585, -0.5974061, -1.239908, 1, 0, 0, 1, 1,
-0.540195, -0.5679836, -3.081998, 0, 0, 0, 1, 1,
-0.5390335, -0.9375725, -1.336803, 0, 0, 0, 1, 1,
-0.5376416, -1.759152, -4.244197, 0, 0, 0, 1, 1,
-0.5358523, 0.06056995, -2.364187, 0, 0, 0, 1, 1,
-0.5354614, 0.6559492, -1.540611, 0, 0, 0, 1, 1,
-0.5323465, 0.1179044, -0.9957366, 0, 0, 0, 1, 1,
-0.5308033, -0.2588774, -2.833616, 0, 0, 0, 1, 1,
-0.5261525, -2.243973, -2.817932, 1, 1, 1, 1, 1,
-0.5243244, 1.695047, 0.9379199, 1, 1, 1, 1, 1,
-0.5203399, -0.7833607, -3.721584, 1, 1, 1, 1, 1,
-0.51809, -0.3835942, -1.702783, 1, 1, 1, 1, 1,
-0.5079579, 1.093982, -0.466234, 1, 1, 1, 1, 1,
-0.5073267, 0.3967499, -1.191762, 1, 1, 1, 1, 1,
-0.5048009, 0.8867517, 0.5715303, 1, 1, 1, 1, 1,
-0.50279, 0.5792952, -1.991025, 1, 1, 1, 1, 1,
-0.5027516, 2.396924, -0.8698952, 1, 1, 1, 1, 1,
-0.4996589, -0.171935, -1.468639, 1, 1, 1, 1, 1,
-0.4995646, -0.7209651, -2.611456, 1, 1, 1, 1, 1,
-0.491567, 0.7117894, -2.169993, 1, 1, 1, 1, 1,
-0.4803925, 2.965602, 0.7266044, 1, 1, 1, 1, 1,
-0.477352, -0.8381108, -1.802035, 1, 1, 1, 1, 1,
-0.476274, -0.7063943, -0.7779391, 1, 1, 1, 1, 1,
-0.4740532, -0.2611723, -2.090321, 0, 0, 1, 1, 1,
-0.4690222, 0.7236456, -1.588345, 1, 0, 0, 1, 1,
-0.464157, -0.1390654, -0.3265956, 1, 0, 0, 1, 1,
-0.4623151, 1.842861, -1.826465, 1, 0, 0, 1, 1,
-0.4605829, -0.5587618, -2.812029, 1, 0, 0, 1, 1,
-0.4595515, -3.12866, -2.82667, 1, 0, 0, 1, 1,
-0.4594992, 1.184038, 0.1418859, 0, 0, 0, 1, 1,
-0.4575039, 0.6038096, -0.05595226, 0, 0, 0, 1, 1,
-0.4543779, 0.5472517, -0.8947163, 0, 0, 0, 1, 1,
-0.4517467, 1.958459, 1.040371, 0, 0, 0, 1, 1,
-0.4496491, 0.01134221, -3.773822, 0, 0, 0, 1, 1,
-0.4454888, 0.2094433, -1.443308, 0, 0, 0, 1, 1,
-0.4413886, 1.395092, 0.3178391, 0, 0, 0, 1, 1,
-0.4373072, -0.4383223, -3.010574, 1, 1, 1, 1, 1,
-0.4341888, -0.6481872, -3.07056, 1, 1, 1, 1, 1,
-0.4340785, 0.03061558, -2.035187, 1, 1, 1, 1, 1,
-0.4279109, -0.5078107, -2.285546, 1, 1, 1, 1, 1,
-0.4254247, -0.2489607, -0.7143102, 1, 1, 1, 1, 1,
-0.4213474, 1.25282, 0.3814948, 1, 1, 1, 1, 1,
-0.4189842, -0.9211936, -3.377554, 1, 1, 1, 1, 1,
-0.4183378, -1.138251, -4.612574, 1, 1, 1, 1, 1,
-0.4113089, -0.8617761, -3.936232, 1, 1, 1, 1, 1,
-0.4090114, 1.550996, -0.3638853, 1, 1, 1, 1, 1,
-0.4087134, 0.5508064, 0.6262107, 1, 1, 1, 1, 1,
-0.4054642, 0.1233424, -1.395753, 1, 1, 1, 1, 1,
-0.4037417, 0.2137388, -1.668882, 1, 1, 1, 1, 1,
-0.4028426, 0.3483499, -0.7390308, 1, 1, 1, 1, 1,
-0.4024526, 0.9638491, 0.872613, 1, 1, 1, 1, 1,
-0.3974341, -1.501591, -2.572668, 0, 0, 1, 1, 1,
-0.3949651, 0.6586798, -1.657285, 1, 0, 0, 1, 1,
-0.3889726, 0.4346905, -0.6553987, 1, 0, 0, 1, 1,
-0.3885403, -1.535746, -0.7487229, 1, 0, 0, 1, 1,
-0.3881058, 0.5357062, 0.5973572, 1, 0, 0, 1, 1,
-0.3879084, -0.7242382, -3.548012, 1, 0, 0, 1, 1,
-0.3877984, 0.6730415, -0.6875093, 0, 0, 0, 1, 1,
-0.3797186, 1.498326, -0.0408116, 0, 0, 0, 1, 1,
-0.3735646, 1.936608, 0.3207995, 0, 0, 0, 1, 1,
-0.3734924, 0.09612337, -2.32693, 0, 0, 0, 1, 1,
-0.3732829, 1.036944, -1.014884, 0, 0, 0, 1, 1,
-0.3726728, -0.5375698, -1.635011, 0, 0, 0, 1, 1,
-0.37146, 0.02823775, -2.487242, 0, 0, 0, 1, 1,
-0.3707814, -0.6364609, -3.704386, 1, 1, 1, 1, 1,
-0.3688132, -0.3567191, -3.402519, 1, 1, 1, 1, 1,
-0.3674989, -0.5749844, -2.101713, 1, 1, 1, 1, 1,
-0.3673154, -0.4043584, -1.007383, 1, 1, 1, 1, 1,
-0.3667189, -0.3866681, -1.278563, 1, 1, 1, 1, 1,
-0.3650833, -0.505284, 0.7756038, 1, 1, 1, 1, 1,
-0.3645802, -0.5679576, -1.626636, 1, 1, 1, 1, 1,
-0.3626479, -0.5187929, -3.215334, 1, 1, 1, 1, 1,
-0.3600766, 0.09666239, -1.185431, 1, 1, 1, 1, 1,
-0.3537465, -0.3954238, -3.801597, 1, 1, 1, 1, 1,
-0.3530642, -0.8413358, -1.927583, 1, 1, 1, 1, 1,
-0.3524499, -0.6854498, -1.795841, 1, 1, 1, 1, 1,
-0.3510451, -0.2005722, -3.696725, 1, 1, 1, 1, 1,
-0.3494308, 0.2745108, -2.158024, 1, 1, 1, 1, 1,
-0.3489422, 1.390676, -1.31649, 1, 1, 1, 1, 1,
-0.3473966, -0.1926079, -1.402323, 0, 0, 1, 1, 1,
-0.346563, 0.3225805, -1.587427, 1, 0, 0, 1, 1,
-0.3447488, 0.2315982, 0.2496625, 1, 0, 0, 1, 1,
-0.3439559, 1.056177, -0.1685615, 1, 0, 0, 1, 1,
-0.3393648, -0.3126119, 0.2608436, 1, 0, 0, 1, 1,
-0.3371104, -0.612036, -2.623599, 1, 0, 0, 1, 1,
-0.3369552, -1.330287, -2.15212, 0, 0, 0, 1, 1,
-0.3367104, -0.4290257, -2.032393, 0, 0, 0, 1, 1,
-0.3362455, -0.8463405, -2.114186, 0, 0, 0, 1, 1,
-0.329845, -0.5172235, -2.418114, 0, 0, 0, 1, 1,
-0.3291639, 0.01316205, -1.885317, 0, 0, 0, 1, 1,
-0.323675, 0.1492952, -2.559263, 0, 0, 0, 1, 1,
-0.3232575, 0.5315726, 0.6731175, 0, 0, 0, 1, 1,
-0.3196243, 1.021969, -0.7379589, 1, 1, 1, 1, 1,
-0.317233, 0.189332, 1.572638, 1, 1, 1, 1, 1,
-0.3166616, -1.177159, -3.401697, 1, 1, 1, 1, 1,
-0.3146608, -0.266772, -2.756354, 1, 1, 1, 1, 1,
-0.3136696, -0.2435974, -0.5887982, 1, 1, 1, 1, 1,
-0.3131245, 0.2539884, -0.9008105, 1, 1, 1, 1, 1,
-0.3123534, -1.050703, -2.047502, 1, 1, 1, 1, 1,
-0.3103155, 0.8758807, -0.03753547, 1, 1, 1, 1, 1,
-0.3090995, -0.2452633, -3.800303, 1, 1, 1, 1, 1,
-0.3078509, 0.8219821, -0.9256513, 1, 1, 1, 1, 1,
-0.3038034, 0.661287, -0.5733337, 1, 1, 1, 1, 1,
-0.3036442, 1.853584, -0.455486, 1, 1, 1, 1, 1,
-0.2988928, 1.004278, -1.654864, 1, 1, 1, 1, 1,
-0.2963707, 0.2021655, -1.493506, 1, 1, 1, 1, 1,
-0.2953963, -0.474113, -1.466242, 1, 1, 1, 1, 1,
-0.294412, 0.4902924, -0.1087426, 0, 0, 1, 1, 1,
-0.2937803, -1.968935, -3.428553, 1, 0, 0, 1, 1,
-0.2923386, 0.3374538, -1.894569, 1, 0, 0, 1, 1,
-0.2907429, -0.6342173, -2.041508, 1, 0, 0, 1, 1,
-0.287439, -0.785458, -2.778637, 1, 0, 0, 1, 1,
-0.2862917, 0.9163423, -0.1761071, 1, 0, 0, 1, 1,
-0.2838111, 2.178247, -0.9909285, 0, 0, 0, 1, 1,
-0.2834744, -1.2621, -3.580716, 0, 0, 0, 1, 1,
-0.282866, 1.205626, -1.419669, 0, 0, 0, 1, 1,
-0.2826488, -0.4873104, -2.418029, 0, 0, 0, 1, 1,
-0.2815744, -0.840355, -2.697792, 0, 0, 0, 1, 1,
-0.2737419, -0.104536, -3.086025, 0, 0, 0, 1, 1,
-0.2722813, 0.2098009, 1.175363, 0, 0, 0, 1, 1,
-0.266388, -1.300585, -2.10207, 1, 1, 1, 1, 1,
-0.2650847, 1.676261, 0.6075759, 1, 1, 1, 1, 1,
-0.2645976, -1.082604, -0.4025002, 1, 1, 1, 1, 1,
-0.2624562, 0.9988922, -0.1201093, 1, 1, 1, 1, 1,
-0.2623835, -0.5463412, -4.191464, 1, 1, 1, 1, 1,
-0.2549398, -0.001773353, -2.499891, 1, 1, 1, 1, 1,
-0.254873, 0.4405494, -1.825638, 1, 1, 1, 1, 1,
-0.250963, 0.6134031, 1.341524, 1, 1, 1, 1, 1,
-0.2509442, 0.4445557, 0.3913739, 1, 1, 1, 1, 1,
-0.2500905, 0.9199094, -0.268134, 1, 1, 1, 1, 1,
-0.2456154, 0.2105528, -1.52611, 1, 1, 1, 1, 1,
-0.2406717, 0.635714, -0.3270013, 1, 1, 1, 1, 1,
-0.2364989, -0.540064, -2.891172, 1, 1, 1, 1, 1,
-0.2345591, 1.428542, 1.820411, 1, 1, 1, 1, 1,
-0.2267035, 1.023792, 0.3451152, 1, 1, 1, 1, 1,
-0.2226255, 1.656318, 0.01240828, 0, 0, 1, 1, 1,
-0.2213552, 1.25714, -1.943667, 1, 0, 0, 1, 1,
-0.2194406, 0.8037888, -1.661419, 1, 0, 0, 1, 1,
-0.2087384, -0.1491449, -2.926361, 1, 0, 0, 1, 1,
-0.2080301, -0.282685, -1.985793, 1, 0, 0, 1, 1,
-0.2079525, -1.124317, -2.102122, 1, 0, 0, 1, 1,
-0.2057925, 0.3035519, -0.1347919, 0, 0, 0, 1, 1,
-0.2017147, -0.01892571, -1.026862, 0, 0, 0, 1, 1,
-0.2013054, 1.159904, 0.1217435, 0, 0, 0, 1, 1,
-0.2011084, 0.7229011, -1.305028, 0, 0, 0, 1, 1,
-0.2003559, 0.3303971, -1.781423, 0, 0, 0, 1, 1,
-0.1975392, 0.4019479, -0.4626386, 0, 0, 0, 1, 1,
-0.1864479, 0.6765761, 1.511787, 0, 0, 0, 1, 1,
-0.1843249, -1.463838, -4.530216, 1, 1, 1, 1, 1,
-0.180171, 0.9433338, 0.5605661, 1, 1, 1, 1, 1,
-0.1800224, -0.3793427, -3.058985, 1, 1, 1, 1, 1,
-0.177764, 0.3202626, 0.9674484, 1, 1, 1, 1, 1,
-0.1747041, -0.8478482, -3.557754, 1, 1, 1, 1, 1,
-0.1686204, 0.9006901, -0.2047009, 1, 1, 1, 1, 1,
-0.1658869, 0.9186102, -0.6501362, 1, 1, 1, 1, 1,
-0.1653114, 0.1464356, -0.7666285, 1, 1, 1, 1, 1,
-0.1609385, -0.9072136, -3.965174, 1, 1, 1, 1, 1,
-0.1589961, -1.183035, -2.760228, 1, 1, 1, 1, 1,
-0.1581101, -0.4493533, -3.360001, 1, 1, 1, 1, 1,
-0.1566854, 0.03075279, -3.545153, 1, 1, 1, 1, 1,
-0.1555416, 1.840822, 1.104514, 1, 1, 1, 1, 1,
-0.15051, 0.55866, -0.06454348, 1, 1, 1, 1, 1,
-0.1501027, 1.169656, 2.055288, 1, 1, 1, 1, 1,
-0.1469204, 0.5696262, -2.10533, 0, 0, 1, 1, 1,
-0.1368399, 0.4460914, -1.435938, 1, 0, 0, 1, 1,
-0.1328798, -0.1496266, -1.508771, 1, 0, 0, 1, 1,
-0.1220525, -0.446394, -2.598565, 1, 0, 0, 1, 1,
-0.1198161, -1.256061, -2.944737, 1, 0, 0, 1, 1,
-0.1163593, 1.852331, 0.5334127, 1, 0, 0, 1, 1,
-0.1120086, -0.5673105, -3.743391, 0, 0, 0, 1, 1,
-0.1079308, -0.01331462, -2.974327, 0, 0, 0, 1, 1,
-0.1030625, -0.6745723, -3.123144, 0, 0, 0, 1, 1,
-0.1019477, 0.1894884, -0.4649228, 0, 0, 0, 1, 1,
-0.09700204, -0.3866184, -2.997431, 0, 0, 0, 1, 1,
-0.09526245, 0.1666154, 0.4265509, 0, 0, 0, 1, 1,
-0.09506979, -0.057173, -3.993321, 0, 0, 0, 1, 1,
-0.08844599, -0.5664192, -3.500955, 1, 1, 1, 1, 1,
-0.08816575, 1.119685, 1.121447, 1, 1, 1, 1, 1,
-0.08567134, -0.03915963, -2.970099, 1, 1, 1, 1, 1,
-0.08091828, 2.209219, -1.036495, 1, 1, 1, 1, 1,
-0.08050679, -1.604018, -3.345076, 1, 1, 1, 1, 1,
-0.0779347, -0.09945362, -0.7521375, 1, 1, 1, 1, 1,
-0.07721671, 0.02288325, 0.4438637, 1, 1, 1, 1, 1,
-0.07512993, -0.6415918, -2.799683, 1, 1, 1, 1, 1,
-0.07207432, 0.7035514, -0.8531562, 1, 1, 1, 1, 1,
-0.06699879, -0.7778749, -3.452004, 1, 1, 1, 1, 1,
-0.06646997, 0.08658277, -1.335891, 1, 1, 1, 1, 1,
-0.0649043, -0.6411223, -2.844995, 1, 1, 1, 1, 1,
-0.06474213, 0.3299798, -0.4456952, 1, 1, 1, 1, 1,
-0.06053854, 1.052761, -1.652601, 1, 1, 1, 1, 1,
-0.06033812, -0.2324314, -1.338316, 1, 1, 1, 1, 1,
-0.0576857, -2.161073, -4.612833, 0, 0, 1, 1, 1,
-0.05648775, 0.3215005, 1.185951, 1, 0, 0, 1, 1,
-0.05349567, -0.4405941, -2.111854, 1, 0, 0, 1, 1,
-0.05000535, 0.9563766, 0.1016415, 1, 0, 0, 1, 1,
-0.04995658, -0.7048227, -4.929207, 1, 0, 0, 1, 1,
-0.04619032, -1.255621, -3.461159, 1, 0, 0, 1, 1,
-0.04611083, 0.6095283, -1.420233, 0, 0, 0, 1, 1,
-0.04580326, 0.8824129, 1.243789, 0, 0, 0, 1, 1,
-0.0388951, -1.469272, -2.310601, 0, 0, 0, 1, 1,
-0.02870985, -1.512068, -1.521904, 0, 0, 0, 1, 1,
-0.02774993, 0.2466696, -0.6239358, 0, 0, 0, 1, 1,
-0.02523517, 2.104179, -2.358393, 0, 0, 0, 1, 1,
-0.02500172, 0.1852108, 0.438639, 0, 0, 0, 1, 1,
-0.02341893, -0.2625977, -1.864449, 1, 1, 1, 1, 1,
-0.01961787, -0.1631087, -3.301843, 1, 1, 1, 1, 1,
-0.01851912, -0.515704, -2.841636, 1, 1, 1, 1, 1,
-0.010783, 1.608776, 0.08422222, 1, 1, 1, 1, 1,
-0.01052048, -0.1479398, -3.680565, 1, 1, 1, 1, 1,
-0.00840083, 0.1632591, -1.386405, 1, 1, 1, 1, 1,
-0.00786534, -0.7947006, -2.285806, 1, 1, 1, 1, 1,
-0.006162978, -1.289576, -2.96645, 1, 1, 1, 1, 1,
-0.003571583, 0.007193209, -1.465474, 1, 1, 1, 1, 1,
-0.002657826, 1.642861, 0.4940907, 1, 1, 1, 1, 1,
-0.0001088003, -1.217611, -2.778587, 1, 1, 1, 1, 1,
0.002261308, 1.586718, 0.6012815, 1, 1, 1, 1, 1,
0.01033982, 0.07344463, 0.7878655, 1, 1, 1, 1, 1,
0.01170205, -1.440377, 2.362434, 1, 1, 1, 1, 1,
0.01254158, -0.3770042, 3.660671, 1, 1, 1, 1, 1,
0.01276437, 0.02569386, -0.3052979, 0, 0, 1, 1, 1,
0.01479458, -1.297011, 3.021317, 1, 0, 0, 1, 1,
0.01496008, -0.2672964, 3.430476, 1, 0, 0, 1, 1,
0.01679726, -0.598986, 3.789346, 1, 0, 0, 1, 1,
0.01727133, 1.426726, 0.2440611, 1, 0, 0, 1, 1,
0.01757945, -0.6150484, 2.283468, 1, 0, 0, 1, 1,
0.01880395, -1.721693, 3.717796, 0, 0, 0, 1, 1,
0.01954705, -0.4370885, 3.018805, 0, 0, 0, 1, 1,
0.02165431, -0.6991878, 2.841722, 0, 0, 0, 1, 1,
0.02295137, -1.315122, 2.979573, 0, 0, 0, 1, 1,
0.02300783, 0.4781505, -0.9920968, 0, 0, 0, 1, 1,
0.02535541, 0.4365888, -0.2654511, 0, 0, 0, 1, 1,
0.02683577, -0.9918656, 2.956391, 0, 0, 0, 1, 1,
0.03704209, 0.5430356, 0.1927838, 1, 1, 1, 1, 1,
0.03740703, -0.6961178, 2.444775, 1, 1, 1, 1, 1,
0.03830666, 0.1683314, -0.9208262, 1, 1, 1, 1, 1,
0.04226361, -1.447014, 2.500046, 1, 1, 1, 1, 1,
0.04504659, -1.550806, 4.404387, 1, 1, 1, 1, 1,
0.04691407, 0.9237419, 0.04026878, 1, 1, 1, 1, 1,
0.04942731, -0.9134259, 2.754971, 1, 1, 1, 1, 1,
0.05287813, 0.111446, 0.6231115, 1, 1, 1, 1, 1,
0.05715371, -0.3007462, 2.773017, 1, 1, 1, 1, 1,
0.06260211, 1.134064, -0.6043579, 1, 1, 1, 1, 1,
0.06845097, -1.259975, 3.794273, 1, 1, 1, 1, 1,
0.0693299, 0.5466571, -0.2071699, 1, 1, 1, 1, 1,
0.07035691, -0.5262313, 3.196568, 1, 1, 1, 1, 1,
0.07506154, 0.3775457, 1.445551, 1, 1, 1, 1, 1,
0.07783169, 0.3138098, -0.3130602, 1, 1, 1, 1, 1,
0.07973904, -0.388044, 2.74212, 0, 0, 1, 1, 1,
0.08034768, -0.1281138, 1.804061, 1, 0, 0, 1, 1,
0.08296981, -1.321629, 3.311231, 1, 0, 0, 1, 1,
0.08592442, -0.4343117, 1.520615, 1, 0, 0, 1, 1,
0.08853051, -0.4282764, 1.821046, 1, 0, 0, 1, 1,
0.08908595, -0.3115447, 2.638347, 1, 0, 0, 1, 1,
0.08984334, -0.06986763, 1.978045, 0, 0, 0, 1, 1,
0.09002081, -1.349611, 2.121103, 0, 0, 0, 1, 1,
0.09199502, 0.5808976, 0.3779582, 0, 0, 0, 1, 1,
0.09623526, 0.8445245, -0.6006682, 0, 0, 0, 1, 1,
0.09850149, 1.562541, 1.403127, 0, 0, 0, 1, 1,
0.09993286, -0.07518643, 0.8957344, 0, 0, 0, 1, 1,
0.1003946, 0.7371974, -0.6331322, 0, 0, 0, 1, 1,
0.1010088, -0.08278611, 2.66959, 1, 1, 1, 1, 1,
0.1014556, -1.634622, 3.823951, 1, 1, 1, 1, 1,
0.1017233, 0.4963505, -0.8456981, 1, 1, 1, 1, 1,
0.1033852, 1.765607, 0.6843808, 1, 1, 1, 1, 1,
0.1034619, -0.1839206, 2.848835, 1, 1, 1, 1, 1,
0.1052812, -0.9380344, 3.497068, 1, 1, 1, 1, 1,
0.1052957, 1.045603, -0.01861186, 1, 1, 1, 1, 1,
0.1085037, 1.373229, 0.4202388, 1, 1, 1, 1, 1,
0.1088143, -0.1379055, 4.584735, 1, 1, 1, 1, 1,
0.1094321, 0.05845159, 1.064074, 1, 1, 1, 1, 1,
0.1140158, 1.23428, 1.305315, 1, 1, 1, 1, 1,
0.1144169, -0.1454953, 3.139029, 1, 1, 1, 1, 1,
0.1150196, 0.7984366, 0.04135142, 1, 1, 1, 1, 1,
0.1196257, -0.9804025, 2.358987, 1, 1, 1, 1, 1,
0.1216488, -0.5404475, 2.788838, 1, 1, 1, 1, 1,
0.1237907, -1.011017, 3.937532, 0, 0, 1, 1, 1,
0.1269615, -0.9854572, 3.143558, 1, 0, 0, 1, 1,
0.1326002, -2.322021, 0.9432195, 1, 0, 0, 1, 1,
0.1377607, 0.8738464, 1.52232, 1, 0, 0, 1, 1,
0.1384223, 0.07195116, -0.4000588, 1, 0, 0, 1, 1,
0.1396519, 0.7126514, 0.8062966, 1, 0, 0, 1, 1,
0.1443899, 0.6951352, 0.04419098, 0, 0, 0, 1, 1,
0.1457324, 1.226315, 1.168825, 0, 0, 0, 1, 1,
0.1499888, -0.6313254, 2.451347, 0, 0, 0, 1, 1,
0.151736, -0.718203, 4.245534, 0, 0, 0, 1, 1,
0.1518923, -0.7791796, 2.58512, 0, 0, 0, 1, 1,
0.1520418, -1.166361, 2.558101, 0, 0, 0, 1, 1,
0.1537595, 1.06593, -0.4158564, 0, 0, 0, 1, 1,
0.1576331, -1.495362, 3.523444, 1, 1, 1, 1, 1,
0.1582592, 0.4410167, -0.4497835, 1, 1, 1, 1, 1,
0.1587837, 1.837503, -1.401847, 1, 1, 1, 1, 1,
0.1619412, -0.01908025, 1.880479, 1, 1, 1, 1, 1,
0.1644612, -0.1882696, 2.154078, 1, 1, 1, 1, 1,
0.1668788, -0.5443518, 3.831458, 1, 1, 1, 1, 1,
0.1750881, -0.01439628, 2.466991, 1, 1, 1, 1, 1,
0.1766119, -0.1533675, 1.265415, 1, 1, 1, 1, 1,
0.1767509, -0.5779571, 2.213908, 1, 1, 1, 1, 1,
0.1785549, 0.748341, -0.9881178, 1, 1, 1, 1, 1,
0.181156, -0.1313507, 3.814073, 1, 1, 1, 1, 1,
0.1839862, -0.08029039, 2.759354, 1, 1, 1, 1, 1,
0.1943644, 1.609218, 0.29092, 1, 1, 1, 1, 1,
0.2003138, 1.649621, -0.7196056, 1, 1, 1, 1, 1,
0.2016843, -0.04475733, 3.25225, 1, 1, 1, 1, 1,
0.2021342, -2.111029, 4.654209, 0, 0, 1, 1, 1,
0.2021359, -1.207879, 3.580906, 1, 0, 0, 1, 1,
0.204757, 0.5266753, 1.451515, 1, 0, 0, 1, 1,
0.207811, -1.015103, 2.712355, 1, 0, 0, 1, 1,
0.2078124, -0.679726, 1.946139, 1, 0, 0, 1, 1,
0.2085128, 0.436924, -0.7254443, 1, 0, 0, 1, 1,
0.2216539, -1.376171, 0.8926394, 0, 0, 0, 1, 1,
0.2221712, -2.434771, 3.668686, 0, 0, 0, 1, 1,
0.2234495, 1.208479, -0.8795437, 0, 0, 0, 1, 1,
0.225249, 1.174539, -0.06422742, 0, 0, 0, 1, 1,
0.2259082, -1.670016, 4.453719, 0, 0, 0, 1, 1,
0.2272979, 0.2889943, 1.744425, 0, 0, 0, 1, 1,
0.2291544, -0.9030023, 4.650554, 0, 0, 0, 1, 1,
0.2312246, 0.7195047, 0.1648781, 1, 1, 1, 1, 1,
0.2326128, 0.6438998, -0.7474034, 1, 1, 1, 1, 1,
0.2330223, 0.9629403, -1.524707, 1, 1, 1, 1, 1,
0.2331384, 1.675461, -0.4178899, 1, 1, 1, 1, 1,
0.2396611, 2.278006, 0.9842846, 1, 1, 1, 1, 1,
0.2398254, 0.705872, -1.758437, 1, 1, 1, 1, 1,
0.2398474, -0.5171869, 2.571424, 1, 1, 1, 1, 1,
0.2401976, -0.6828663, 3.117878, 1, 1, 1, 1, 1,
0.2462434, -0.2284814, 2.01368, 1, 1, 1, 1, 1,
0.2470786, -0.8101321, 1.869841, 1, 1, 1, 1, 1,
0.2475838, -1.076026, 1.196838, 1, 1, 1, 1, 1,
0.2511789, -1.426086, 2.559523, 1, 1, 1, 1, 1,
0.2540239, 0.9206215, -0.5284541, 1, 1, 1, 1, 1,
0.2563099, -1.256451, 4.053681, 1, 1, 1, 1, 1,
0.2575102, 0.447427, -0.08309239, 1, 1, 1, 1, 1,
0.2580886, -0.1555635, 2.75583, 0, 0, 1, 1, 1,
0.2691327, 2.060642, -0.3292921, 1, 0, 0, 1, 1,
0.2702591, 0.7662627, 1.610984, 1, 0, 0, 1, 1,
0.2788893, -0.1224167, 2.751828, 1, 0, 0, 1, 1,
0.2804075, -0.5449675, 2.490354, 1, 0, 0, 1, 1,
0.2828849, -0.4912275, 1.216412, 1, 0, 0, 1, 1,
0.2870118, -0.8790631, 3.865142, 0, 0, 0, 1, 1,
0.2894497, 0.3245269, -0.8039402, 0, 0, 0, 1, 1,
0.2919545, -0.2198759, 1.005592, 0, 0, 0, 1, 1,
0.2940293, -0.07926433, 1.092157, 0, 0, 0, 1, 1,
0.2973378, -0.3375415, 3.449404, 0, 0, 0, 1, 1,
0.3064179, -0.6321924, 2.333077, 0, 0, 0, 1, 1,
0.3190673, -0.3141862, 4.139351, 0, 0, 0, 1, 1,
0.3201286, -0.127132, 2.106903, 1, 1, 1, 1, 1,
0.3213952, -0.6490316, 2.945608, 1, 1, 1, 1, 1,
0.322981, 0.4062554, 1.096054, 1, 1, 1, 1, 1,
0.3254699, -0.8565578, 2.649226, 1, 1, 1, 1, 1,
0.3284113, -0.7156295, 4.501029, 1, 1, 1, 1, 1,
0.3308811, -0.4104014, 3.265274, 1, 1, 1, 1, 1,
0.3319512, 0.9122504, 0.8481004, 1, 1, 1, 1, 1,
0.333926, -0.4189155, 2.180292, 1, 1, 1, 1, 1,
0.3347429, 0.130551, 0.5813856, 1, 1, 1, 1, 1,
0.334779, 1.101689, 0.5341552, 1, 1, 1, 1, 1,
0.3416323, -0.5867249, 2.889083, 1, 1, 1, 1, 1,
0.3434026, -0.3611537, 3.588653, 1, 1, 1, 1, 1,
0.3443039, -0.2024816, 3.218203, 1, 1, 1, 1, 1,
0.3506292, -0.1610598, 0.5847238, 1, 1, 1, 1, 1,
0.3525825, 0.3107681, 1.767793, 1, 1, 1, 1, 1,
0.3552484, -0.7489198, 2.18952, 0, 0, 1, 1, 1,
0.355395, -1.363494, 1.574221, 1, 0, 0, 1, 1,
0.3594425, -0.08728301, 1.609036, 1, 0, 0, 1, 1,
0.3637649, -1.488772, 2.396299, 1, 0, 0, 1, 1,
0.3672029, 1.138826, 0.655247, 1, 0, 0, 1, 1,
0.3677712, 1.328986, 2.052414, 1, 0, 0, 1, 1,
0.3696097, 0.7049377, -0.2604592, 0, 0, 0, 1, 1,
0.3745669, 0.8029959, -0.01981664, 0, 0, 0, 1, 1,
0.3783477, 0.1711145, 0.3010333, 0, 0, 0, 1, 1,
0.3795256, 0.4824304, -2.75715, 0, 0, 0, 1, 1,
0.3835295, 0.5020134, 0.06537786, 0, 0, 0, 1, 1,
0.3843827, -0.00975376, 2.668661, 0, 0, 0, 1, 1,
0.3880395, 0.5564498, 0.4431953, 0, 0, 0, 1, 1,
0.3894011, 0.5221527, 1.32242, 1, 1, 1, 1, 1,
0.3946756, 1.029614, 0.7372017, 1, 1, 1, 1, 1,
0.3971516, -0.328083, 2.099689, 1, 1, 1, 1, 1,
0.3972982, 0.6430231, 1.866527, 1, 1, 1, 1, 1,
0.3999602, 1.401859, 0.9400166, 1, 1, 1, 1, 1,
0.4040163, 0.5757857, 2.183049, 1, 1, 1, 1, 1,
0.4090357, 0.05328507, 2.556942, 1, 1, 1, 1, 1,
0.411029, -0.4738452, 2.47822, 1, 1, 1, 1, 1,
0.4113576, -1.374399, 3.819203, 1, 1, 1, 1, 1,
0.4216807, -0.2699873, 2.388087, 1, 1, 1, 1, 1,
0.4231031, -1.256914, 3.051919, 1, 1, 1, 1, 1,
0.4242665, 1.014239, -0.8856242, 1, 1, 1, 1, 1,
0.4278327, -0.5401848, 1.632215, 1, 1, 1, 1, 1,
0.4327672, 1.084925, -0.4052209, 1, 1, 1, 1, 1,
0.442532, 0.3925145, -0.2426263, 1, 1, 1, 1, 1,
0.4437207, 0.7751258, 3.032115, 0, 0, 1, 1, 1,
0.4471999, -0.7602504, 5.070985, 1, 0, 0, 1, 1,
0.4473646, -0.5671673, 3.896989, 1, 0, 0, 1, 1,
0.4543449, -1.215405, 2.479231, 1, 0, 0, 1, 1,
0.4562518, 0.2203954, -0.1841416, 1, 0, 0, 1, 1,
0.4563172, 0.7915842, -0.1426506, 1, 0, 0, 1, 1,
0.4568369, -1.79672, 2.506971, 0, 0, 0, 1, 1,
0.4593036, -0.4801684, 2.153458, 0, 0, 0, 1, 1,
0.459945, -1.397923, 3.160024, 0, 0, 0, 1, 1,
0.4614165, 1.428462, 0.1562936, 0, 0, 0, 1, 1,
0.4615301, 1.942187, -0.03442203, 0, 0, 0, 1, 1,
0.4680249, -0.6395954, 3.302167, 0, 0, 0, 1, 1,
0.4696678, 0.202759, 1.303486, 0, 0, 0, 1, 1,
0.469964, -0.6526187, 3.231173, 1, 1, 1, 1, 1,
0.470607, 1.554271, 0.06305832, 1, 1, 1, 1, 1,
0.4743115, 0.4793752, 1.219707, 1, 1, 1, 1, 1,
0.4754175, 2.245708, -1.202838, 1, 1, 1, 1, 1,
0.4765002, 0.7139202, 2.242379, 1, 1, 1, 1, 1,
0.485278, 0.6680846, -0.6817893, 1, 1, 1, 1, 1,
0.4874498, 0.6072049, -0.993039, 1, 1, 1, 1, 1,
0.4892202, 0.4036216, 0.6825652, 1, 1, 1, 1, 1,
0.4902224, 0.1152713, 1.362132, 1, 1, 1, 1, 1,
0.4906038, -1.390151, 1.279108, 1, 1, 1, 1, 1,
0.4921049, 1.068243, 1.092375, 1, 1, 1, 1, 1,
0.4957381, 0.3076214, 1.929644, 1, 1, 1, 1, 1,
0.4959488, -0.5885986, 1.147237, 1, 1, 1, 1, 1,
0.4974312, 0.9984944, -1.062581, 1, 1, 1, 1, 1,
0.4993382, -1.198591, 2.999397, 1, 1, 1, 1, 1,
0.5002035, 0.3572077, 1.754374, 0, 0, 1, 1, 1,
0.5009403, -0.03885795, 2.58041, 1, 0, 0, 1, 1,
0.5033383, -0.4717307, 2.678492, 1, 0, 0, 1, 1,
0.5073912, 1.290097, 0.7161031, 1, 0, 0, 1, 1,
0.5090246, -0.3421444, 1.675947, 1, 0, 0, 1, 1,
0.5137405, -1.65722, 2.914269, 1, 0, 0, 1, 1,
0.5139522, 1.631811, 0.04806456, 0, 0, 0, 1, 1,
0.5150202, 0.4396578, 0.4301148, 0, 0, 0, 1, 1,
0.526507, 0.03905393, 1.888656, 0, 0, 0, 1, 1,
0.5303345, -1.22557, 2.194121, 0, 0, 0, 1, 1,
0.5303822, 0.3434368, 1.976597, 0, 0, 0, 1, 1,
0.53665, 0.005541125, 2.09017, 0, 0, 0, 1, 1,
0.5410363, 0.4047343, 0.491216, 0, 0, 0, 1, 1,
0.5415293, -1.018684, 4.0156, 1, 1, 1, 1, 1,
0.5423679, 0.5785006, 1.535896, 1, 1, 1, 1, 1,
0.5452555, -2.025842, 4.661807, 1, 1, 1, 1, 1,
0.5455366, -0.7661439, 0.544628, 1, 1, 1, 1, 1,
0.5459237, -1.325679, 1.037938, 1, 1, 1, 1, 1,
0.5464933, 0.005370873, 2.546952, 1, 1, 1, 1, 1,
0.5496613, 0.1126175, 1.711018, 1, 1, 1, 1, 1,
0.550118, 0.7808475, 0.4844302, 1, 1, 1, 1, 1,
0.551518, -0.0002278534, 1.753669, 1, 1, 1, 1, 1,
0.5523297, -0.5035422, 0.009404993, 1, 1, 1, 1, 1,
0.5526798, 0.3996233, 0.9738865, 1, 1, 1, 1, 1,
0.5542043, -0.4873692, 2.006418, 1, 1, 1, 1, 1,
0.5561171, -1.034283, 3.027816, 1, 1, 1, 1, 1,
0.5617043, -0.4386689, 1.446361, 1, 1, 1, 1, 1,
0.567512, -0.4453895, 2.003479, 1, 1, 1, 1, 1,
0.5677366, 1.611763, -0.5006987, 0, 0, 1, 1, 1,
0.5760142, 0.4982828, 1.382274, 1, 0, 0, 1, 1,
0.5763152, -0.8896879, 1.318907, 1, 0, 0, 1, 1,
0.581856, 0.07217532, 0.6113685, 1, 0, 0, 1, 1,
0.5820691, -0.5778833, 1.648066, 1, 0, 0, 1, 1,
0.5827297, -0.1138363, 3.238974, 1, 0, 0, 1, 1,
0.5856987, 1.115704, 1.621849, 0, 0, 0, 1, 1,
0.588398, -0.55402, 1.747107, 0, 0, 0, 1, 1,
0.5905967, 0.894331, -0.3649819, 0, 0, 0, 1, 1,
0.5926706, -1.08973, 1.874562, 0, 0, 0, 1, 1,
0.5997632, 0.5374622, -0.8264863, 0, 0, 0, 1, 1,
0.6013722, -0.7058343, 2.913043, 0, 0, 0, 1, 1,
0.6031144, -0.3767882, 1.995269, 0, 0, 0, 1, 1,
0.6080092, -0.2319328, 1.109764, 1, 1, 1, 1, 1,
0.6155095, 1.735845, 2.13188, 1, 1, 1, 1, 1,
0.620324, 0.9237286, 1.052486, 1, 1, 1, 1, 1,
0.6232913, 0.2954384, 2.109195, 1, 1, 1, 1, 1,
0.6266449, 0.1441618, -0.5770973, 1, 1, 1, 1, 1,
0.6310623, 0.8759001, 1.972765, 1, 1, 1, 1, 1,
0.6322514, 1.652494, -1.200466, 1, 1, 1, 1, 1,
0.6331947, -0.457516, 2.86385, 1, 1, 1, 1, 1,
0.6380366, -1.043342, 3.125838, 1, 1, 1, 1, 1,
0.6389831, -2.302948, 2.393297, 1, 1, 1, 1, 1,
0.6392149, 0.3293686, 1.036063, 1, 1, 1, 1, 1,
0.6411572, 0.2648884, 1.484595, 1, 1, 1, 1, 1,
0.6429596, 0.4393817, 0.4317298, 1, 1, 1, 1, 1,
0.6440008, -0.1524127, 1.826525, 1, 1, 1, 1, 1,
0.658997, -0.528442, 1.322906, 1, 1, 1, 1, 1,
0.6592445, -1.204701, 2.692294, 0, 0, 1, 1, 1,
0.6684881, -0.3868726, 2.836438, 1, 0, 0, 1, 1,
0.6704689, -1.007971, -0.06340278, 1, 0, 0, 1, 1,
0.6716236, 0.9569819, 0.2062711, 1, 0, 0, 1, 1,
0.6759502, -0.7405348, 3.697533, 1, 0, 0, 1, 1,
0.6849937, -0.682996, 2.867159, 1, 0, 0, 1, 1,
0.6853455, 0.5263818, 1.809251, 0, 0, 0, 1, 1,
0.6857139, -0.06590433, 1.186041, 0, 0, 0, 1, 1,
0.6903275, -0.6420895, 2.813495, 0, 0, 0, 1, 1,
0.6941061, -0.2856897, 1.534503, 0, 0, 0, 1, 1,
0.7017869, 0.4342107, 1.740027, 0, 0, 0, 1, 1,
0.7096074, 0.3902659, -0.6052518, 0, 0, 0, 1, 1,
0.7147554, -1.661588, 1.175391, 0, 0, 0, 1, 1,
0.7154194, 0.3137799, 0.5631114, 1, 1, 1, 1, 1,
0.7176818, 0.7907874, -0.1282227, 1, 1, 1, 1, 1,
0.7191487, 0.3820423, 3.532946, 1, 1, 1, 1, 1,
0.7197008, 1.534052, 0.4896991, 1, 1, 1, 1, 1,
0.723509, 1.018368, -0.9899266, 1, 1, 1, 1, 1,
0.7244607, -0.6671149, 1.113664, 1, 1, 1, 1, 1,
0.7252569, -0.8826986, 1.500573, 1, 1, 1, 1, 1,
0.7260092, -1.082303, 3.928358, 1, 1, 1, 1, 1,
0.7317433, -1.109963, 3.646416, 1, 1, 1, 1, 1,
0.7366474, 3.223245, 0.3407524, 1, 1, 1, 1, 1,
0.7468512, -1.096897, 2.705781, 1, 1, 1, 1, 1,
0.7533583, 0.6321958, 1.793721, 1, 1, 1, 1, 1,
0.7543682, -0.6181538, 1.58158, 1, 1, 1, 1, 1,
0.7556077, -0.7828597, 2.25141, 1, 1, 1, 1, 1,
0.7646288, -0.04477308, 0.593878, 1, 1, 1, 1, 1,
0.7648692, 1.351505, 0.6163332, 0, 0, 1, 1, 1,
0.7667428, -0.6329345, 3.037545, 1, 0, 0, 1, 1,
0.770787, -1.252855, 3.431395, 1, 0, 0, 1, 1,
0.7819036, -0.2356734, 3.397684, 1, 0, 0, 1, 1,
0.7832282, -1.478775, 1.557247, 1, 0, 0, 1, 1,
0.7867835, 2.113789, -0.030149, 1, 0, 0, 1, 1,
0.7896828, -0.1184103, 1.443678, 0, 0, 0, 1, 1,
0.7921202, -0.975459, 3.522637, 0, 0, 0, 1, 1,
0.794699, -0.6756722, 2.2458, 0, 0, 0, 1, 1,
0.7965553, 0.7851973, -2.397415, 0, 0, 0, 1, 1,
0.7987534, 0.5380273, 1.059455, 0, 0, 0, 1, 1,
0.8135127, 0.3918912, 1.736436, 0, 0, 0, 1, 1,
0.8361737, -0.5714563, 2.124035, 0, 0, 0, 1, 1,
0.8381016, 0.7058212, 1.337725, 1, 1, 1, 1, 1,
0.8455955, -0.3718048, 3.409354, 1, 1, 1, 1, 1,
0.8456008, -0.6063238, 1.31006, 1, 1, 1, 1, 1,
0.8525065, -0.7501728, 2.777848, 1, 1, 1, 1, 1,
0.8527792, -2.590666, 3.2535, 1, 1, 1, 1, 1,
0.862664, 1.460806, 0.7841185, 1, 1, 1, 1, 1,
0.8627102, 0.2159861, 1.12237, 1, 1, 1, 1, 1,
0.8638624, 0.338533, 2.009317, 1, 1, 1, 1, 1,
0.8639801, 1.220914, 0.3861119, 1, 1, 1, 1, 1,
0.8651013, 1.422839, 1.493186, 1, 1, 1, 1, 1,
0.8661934, -1.686273, 4.202771, 1, 1, 1, 1, 1,
0.8693758, 1.049199, 0.04833237, 1, 1, 1, 1, 1,
0.8703033, -1.861047, 1.189561, 1, 1, 1, 1, 1,
0.8770756, 2.090168, 1.610312, 1, 1, 1, 1, 1,
0.8772189, -0.3067107, 1.660159, 1, 1, 1, 1, 1,
0.8790063, -2.63623, 3.031125, 0, 0, 1, 1, 1,
0.8811501, 1.247655, 2.231285, 1, 0, 0, 1, 1,
0.8855653, -0.9780838, 2.84379, 1, 0, 0, 1, 1,
0.8886768, -0.1064752, -0.05953822, 1, 0, 0, 1, 1,
0.88915, 1.21679, 0.05847936, 1, 0, 0, 1, 1,
0.8987697, -1.89064, 2.861253, 1, 0, 0, 1, 1,
0.905443, -0.1797723, 1.291159, 0, 0, 0, 1, 1,
0.9069625, -1.189595, 2.325301, 0, 0, 0, 1, 1,
0.9154832, -0.8248295, 0.2136728, 0, 0, 0, 1, 1,
0.9189138, -2.161099, 3.234717, 0, 0, 0, 1, 1,
0.924699, 0.0342379, 1.266283, 0, 0, 0, 1, 1,
0.9272717, 1.124332, -0.2795728, 0, 0, 0, 1, 1,
0.9295973, 1.13554, -1.288801, 0, 0, 0, 1, 1,
0.9431277, 0.7663049, 1.037715, 1, 1, 1, 1, 1,
0.9446443, 0.6475595, -0.5065431, 1, 1, 1, 1, 1,
0.9496935, -1.041223, 1.604287, 1, 1, 1, 1, 1,
0.9499791, -0.6445242, 0.3872141, 1, 1, 1, 1, 1,
0.9593291, 0.3182388, 0.9212686, 1, 1, 1, 1, 1,
0.9597958, -0.8194844, 0.763669, 1, 1, 1, 1, 1,
0.9601943, -0.1549434, 1.52359, 1, 1, 1, 1, 1,
0.9646569, 1.386984, 0.7710825, 1, 1, 1, 1, 1,
0.9665745, -0.8894073, 1.498685, 1, 1, 1, 1, 1,
0.9719734, -1.352103, 3.463255, 1, 1, 1, 1, 1,
0.9756677, -0.5867251, 3.506254, 1, 1, 1, 1, 1,
0.9769902, 0.6906225, 0.6882302, 1, 1, 1, 1, 1,
0.9814895, 0.07016112, 1.147084, 1, 1, 1, 1, 1,
0.9846828, 1.016615, 0.6380661, 1, 1, 1, 1, 1,
0.9896612, -0.01669324, 2.01828, 1, 1, 1, 1, 1,
1.000428, -0.6278002, 1.137593, 0, 0, 1, 1, 1,
1.013657, -0.5012473, 1.504046, 1, 0, 0, 1, 1,
1.017985, 0.1056192, 2.15013, 1, 0, 0, 1, 1,
1.021818, 1.292255, 1.068384, 1, 0, 0, 1, 1,
1.025254, 0.3707719, 0.8974806, 1, 0, 0, 1, 1,
1.025816, 0.8549036, 1.040786, 1, 0, 0, 1, 1,
1.026839, -1.345592, 2.833066, 0, 0, 0, 1, 1,
1.029201, 1.538626, -0.2567461, 0, 0, 0, 1, 1,
1.029526, -0.8482803, 2.868028, 0, 0, 0, 1, 1,
1.032695, -0.1147193, 2.233634, 0, 0, 0, 1, 1,
1.035421, -0.04711679, 2.292561, 0, 0, 0, 1, 1,
1.038418, 1.251817, -0.3002321, 0, 0, 0, 1, 1,
1.040947, 0.6342999, 0.3550447, 0, 0, 0, 1, 1,
1.043091, -1.553593, 1.958008, 1, 1, 1, 1, 1,
1.045642, 0.7506847, 1.395033, 1, 1, 1, 1, 1,
1.047544, -1.256361, 3.460994, 1, 1, 1, 1, 1,
1.054051, -0.5492937, 2.034802, 1, 1, 1, 1, 1,
1.057898, 1.663842, -0.7421572, 1, 1, 1, 1, 1,
1.06137, -0.6487009, 1.80555, 1, 1, 1, 1, 1,
1.063318, -0.3790907, 2.527341, 1, 1, 1, 1, 1,
1.073245, 0.5658784, -0.1191891, 1, 1, 1, 1, 1,
1.075165, 0.5268391, 2.166722, 1, 1, 1, 1, 1,
1.083248, 1.483448, 1.551614, 1, 1, 1, 1, 1,
1.088304, 1.058717, 0.6063256, 1, 1, 1, 1, 1,
1.10187, -0.08273426, 2.030366, 1, 1, 1, 1, 1,
1.103948, -0.4489088, 0.9327757, 1, 1, 1, 1, 1,
1.109445, 0.8434741, 2.174805, 1, 1, 1, 1, 1,
1.112026, 0.7418299, 2.026533, 1, 1, 1, 1, 1,
1.118547, -1.178537, 1.752232, 0, 0, 1, 1, 1,
1.118692, -1.154871, 4.597558, 1, 0, 0, 1, 1,
1.124158, -1.020983, 2.919865, 1, 0, 0, 1, 1,
1.126426, -0.5963428, 0.06643157, 1, 0, 0, 1, 1,
1.131619, -0.292066, 0.260486, 1, 0, 0, 1, 1,
1.134971, 1.083087, 1.13033, 1, 0, 0, 1, 1,
1.137476, -1.26807, 2.213613, 0, 0, 0, 1, 1,
1.145613, 2.173437, 1.412622, 0, 0, 0, 1, 1,
1.152737, -0.118381, 1.293053, 0, 0, 0, 1, 1,
1.165056, -1.299013, 3.085231, 0, 0, 0, 1, 1,
1.167526, 1.490824, 1.198532, 0, 0, 0, 1, 1,
1.16775, 0.8369866, 2.13213, 0, 0, 0, 1, 1,
1.172759, -1.550769, 3.814466, 0, 0, 0, 1, 1,
1.172832, -0.2315502, 1.670859, 1, 1, 1, 1, 1,
1.177835, 0.7486751, 1.123551, 1, 1, 1, 1, 1,
1.179963, 0.7963927, 3.428417, 1, 1, 1, 1, 1,
1.186462, 0.1045056, 2.575762, 1, 1, 1, 1, 1,
1.191008, 0.433282, 2.728548, 1, 1, 1, 1, 1,
1.191872, -0.4621524, 0.3676287, 1, 1, 1, 1, 1,
1.195464, 0.5042261, 2.33817, 1, 1, 1, 1, 1,
1.197246, -0.3263049, 2.999211, 1, 1, 1, 1, 1,
1.197731, 0.4425414, 1.574971, 1, 1, 1, 1, 1,
1.216472, -0.2846776, 2.034852, 1, 1, 1, 1, 1,
1.244388, -0.169402, 1.715464, 1, 1, 1, 1, 1,
1.244973, 0.810023, 0.3907946, 1, 1, 1, 1, 1,
1.248587, -0.04335598, 2.70564, 1, 1, 1, 1, 1,
1.248887, 0.9782026, 0.5443198, 1, 1, 1, 1, 1,
1.249276, 0.2622564, 2.326559, 1, 1, 1, 1, 1,
1.249789, -0.7396786, 1.228821, 0, 0, 1, 1, 1,
1.25409, -0.2787671, 2.523372, 1, 0, 0, 1, 1,
1.259063, -0.2638574, 2.776547, 1, 0, 0, 1, 1,
1.267038, -2.501081, 2.829669, 1, 0, 0, 1, 1,
1.268867, 0.3018903, 1.81418, 1, 0, 0, 1, 1,
1.272169, -0.1582907, 2.766383, 1, 0, 0, 1, 1,
1.277034, 1.004083, 0.9355243, 0, 0, 0, 1, 1,
1.287233, 0.7916591, 1.7416, 0, 0, 0, 1, 1,
1.289822, 0.529828, 1.728904, 0, 0, 0, 1, 1,
1.297842, 0.9060783, 3.176059, 0, 0, 0, 1, 1,
1.298996, 0.135291, 2.598304, 0, 0, 0, 1, 1,
1.308491, -0.8032387, 3.110289, 0, 0, 0, 1, 1,
1.32714, 1.324697, 1.686343, 0, 0, 0, 1, 1,
1.330964, 0.3680725, 1.653353, 1, 1, 1, 1, 1,
1.331448, -0.6554291, 3.080425, 1, 1, 1, 1, 1,
1.333778, -0.2449472, 1.706466, 1, 1, 1, 1, 1,
1.340303, 0.3461473, 2.049931, 1, 1, 1, 1, 1,
1.35218, -0.4787008, 0.6661514, 1, 1, 1, 1, 1,
1.353375, -0.5910535, 1.658996, 1, 1, 1, 1, 1,
1.354669, 0.5701392, 0.4057321, 1, 1, 1, 1, 1,
1.356755, -0.6348511, 3.555437, 1, 1, 1, 1, 1,
1.363954, 1.111502, 2.046553, 1, 1, 1, 1, 1,
1.368179, -0.1613299, 2.725734, 1, 1, 1, 1, 1,
1.371258, 1.005203, -0.2929836, 1, 1, 1, 1, 1,
1.374857, -1.019783, 1.884184, 1, 1, 1, 1, 1,
1.379626, -0.8624851, 0.8725185, 1, 1, 1, 1, 1,
1.380417, 2.27604, -0.03155469, 1, 1, 1, 1, 1,
1.381949, -0.4074084, 1.850235, 1, 1, 1, 1, 1,
1.385397, -0.8050718, 4.333195, 0, 0, 1, 1, 1,
1.389127, 0.514918, 2.095963, 1, 0, 0, 1, 1,
1.392612, 3.558955, 0.6174922, 1, 0, 0, 1, 1,
1.392822, -1.80363, 3.143859, 1, 0, 0, 1, 1,
1.407837, -2.745026, 3.392337, 1, 0, 0, 1, 1,
1.408535, -0.4387082, 2.167259, 1, 0, 0, 1, 1,
1.416836, 1.553012, 2.198555, 0, 0, 0, 1, 1,
1.430376, 1.264207, 1.247107, 0, 0, 0, 1, 1,
1.441384, 0.5915741, 3.092143, 0, 0, 0, 1, 1,
1.447635, -1.686071, 2.174712, 0, 0, 0, 1, 1,
1.463598, -1.031235, 2.236295, 0, 0, 0, 1, 1,
1.467544, 1.314098, 2.02053, 0, 0, 0, 1, 1,
1.473122, -2.166301, 2.091568, 0, 0, 0, 1, 1,
1.482152, 0.8735816, 0.6365121, 1, 1, 1, 1, 1,
1.485806, 0.2288101, 1.219668, 1, 1, 1, 1, 1,
1.494495, -0.5528468, 3.218536, 1, 1, 1, 1, 1,
1.49558, -0.1421143, -0.5886297, 1, 1, 1, 1, 1,
1.507499, 0.9968529, 0.7484307, 1, 1, 1, 1, 1,
1.51292, 0.2104916, 2.264684, 1, 1, 1, 1, 1,
1.515699, 0.1470658, 1.816663, 1, 1, 1, 1, 1,
1.529865, 1.070861, 2.160046, 1, 1, 1, 1, 1,
1.535938, 0.1224632, 0.6017853, 1, 1, 1, 1, 1,
1.537418, 1.289816, 1.699029, 1, 1, 1, 1, 1,
1.541196, 1.588623, -0.3386612, 1, 1, 1, 1, 1,
1.552583, 1.853224, 1.361163, 1, 1, 1, 1, 1,
1.554273, 0.821111, 0.2241594, 1, 1, 1, 1, 1,
1.555837, -0.6029217, 1.370682, 1, 1, 1, 1, 1,
1.559927, -0.4239841, 3.00976, 1, 1, 1, 1, 1,
1.560309, -0.4910975, 0.8728034, 0, 0, 1, 1, 1,
1.567106, -0.4471927, 1.228296, 1, 0, 0, 1, 1,
1.605578, -0.08660683, 2.124401, 1, 0, 0, 1, 1,
1.613721, 0.2647784, 2.690406, 1, 0, 0, 1, 1,
1.61519, -0.2437623, 1.041811, 1, 0, 0, 1, 1,
1.618644, 1.186181, 0.4559539, 1, 0, 0, 1, 1,
1.621288, -0.1537245, 2.076255, 0, 0, 0, 1, 1,
1.624139, -0.07141346, 0.7773681, 0, 0, 0, 1, 1,
1.653885, -0.5417719, 3.338857, 0, 0, 0, 1, 1,
1.655166, -1.539487, 2.517233, 0, 0, 0, 1, 1,
1.668941, 0.8362341, 0.7223423, 0, 0, 0, 1, 1,
1.674792, -1.487139, 3.520182, 0, 0, 0, 1, 1,
1.676843, -0.983679, 1.183595, 0, 0, 0, 1, 1,
1.677975, -0.239637, -0.01302605, 1, 1, 1, 1, 1,
1.679802, 1.670026, 0.7292822, 1, 1, 1, 1, 1,
1.698924, -0.7265614, 4.36455, 1, 1, 1, 1, 1,
1.703768, -1.411857, 3.043573, 1, 1, 1, 1, 1,
1.72798, -0.1735543, 2.348436, 1, 1, 1, 1, 1,
1.731267, -1.033562, 1.244161, 1, 1, 1, 1, 1,
1.767115, 0.2289816, 0.5995495, 1, 1, 1, 1, 1,
1.805367, 0.2118073, 1.682936, 1, 1, 1, 1, 1,
1.839211, 0.6842945, 1.51366, 1, 1, 1, 1, 1,
1.876984, -1.49749, 1.514447, 1, 1, 1, 1, 1,
1.897918, 0.968003, 1.368816, 1, 1, 1, 1, 1,
1.916507, -0.5923327, 0.5929869, 1, 1, 1, 1, 1,
1.939901, 0.02660784, 0.402186, 1, 1, 1, 1, 1,
1.996823, 0.5707425, 0.364547, 1, 1, 1, 1, 1,
2.029553, 0.2570906, 1.650492, 1, 1, 1, 1, 1,
2.068973, 1.160734, -0.6814157, 0, 0, 1, 1, 1,
2.155656, 1.961797, -0.2313, 1, 0, 0, 1, 1,
2.176731, 0.9731659, 2.520567, 1, 0, 0, 1, 1,
2.193193, -2.172846, 2.537297, 1, 0, 0, 1, 1,
2.22716, -0.2935764, 0.4146829, 1, 0, 0, 1, 1,
2.263722, -0.6406096, 1.659125, 1, 0, 0, 1, 1,
2.296451, 0.5298969, 1.709329, 0, 0, 0, 1, 1,
2.397519, -0.4754942, 1.360786, 0, 0, 0, 1, 1,
2.420263, -1.238222, -0.03172111, 0, 0, 0, 1, 1,
2.441, -0.177366, 1.533735, 0, 0, 0, 1, 1,
2.514905, -0.1929379, -0.08393819, 0, 0, 0, 1, 1,
2.547732, 0.2425268, 3.231514, 0, 0, 0, 1, 1,
2.550885, -0.2464827, 2.407465, 0, 0, 0, 1, 1,
2.611796, -0.143687, -0.5345002, 1, 1, 1, 1, 1,
2.621042, -0.9295554, 2.58856, 1, 1, 1, 1, 1,
2.633094, 0.7833771, 1.826171, 1, 1, 1, 1, 1,
2.666683, 0.2240759, 1.203848, 1, 1, 1, 1, 1,
2.706406, 0.9764662, 2.106061, 1, 1, 1, 1, 1,
2.956675, 0.9554788, 1.530001, 1, 1, 1, 1, 1,
3.601488, -0.333946, 1.769653, 1, 1, 1, 1, 1
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
var radius = 9.502989;
var distance = 33.37885;
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
mvMatrix.translate( -0.2750151, -0.2151475, 0.01561379 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.37885);
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