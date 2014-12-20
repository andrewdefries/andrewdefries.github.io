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
-3.359673, -1.494353, -2.750339, 1, 0, 0, 1,
-3.025973, 0.5664746, -1.854036, 1, 0.007843138, 0, 1,
-2.891145, 1.414236, -1.37225, 1, 0.01176471, 0, 1,
-2.707162, -0.1502583, -1.444537, 1, 0.01960784, 0, 1,
-2.64212, 0.8168585, -1.304937, 1, 0.02352941, 0, 1,
-2.638311, -0.5472698, -0.9588985, 1, 0.03137255, 0, 1,
-2.62712, -0.7532899, -2.46121, 1, 0.03529412, 0, 1,
-2.54126, -2.861995, -1.46843, 1, 0.04313726, 0, 1,
-2.523806, -1.023785, -2.118031, 1, 0.04705882, 0, 1,
-2.517424, 1.382832, -3.218985, 1, 0.05490196, 0, 1,
-2.500277, 0.101401, -0.77856, 1, 0.05882353, 0, 1,
-2.39555, -0.3250009, -1.075631, 1, 0.06666667, 0, 1,
-2.371035, -0.334618, -2.398888, 1, 0.07058824, 0, 1,
-2.306186, 1.204046, -0.5796669, 1, 0.07843138, 0, 1,
-2.184027, -0.1592933, -1.432657, 1, 0.08235294, 0, 1,
-2.176598, -1.023046, -3.015369, 1, 0.09019608, 0, 1,
-2.156639, 0.4996814, -1.237955, 1, 0.09411765, 0, 1,
-2.131868, -2.097922, -0.6530483, 1, 0.1019608, 0, 1,
-2.09352, 1.679159, 0.6522968, 1, 0.1098039, 0, 1,
-2.077772, -2.380372, -0.6215307, 1, 0.1137255, 0, 1,
-2.07758, 0.04407448, -0.07988067, 1, 0.1215686, 0, 1,
-1.987198, -0.1384005, -0.7351295, 1, 0.1254902, 0, 1,
-1.985509, -0.3375682, -1.494924, 1, 0.1333333, 0, 1,
-1.971154, 0.1664656, -1.285432, 1, 0.1372549, 0, 1,
-1.963655, 0.4717929, -1.322882, 1, 0.145098, 0, 1,
-1.959181, -1.065008, -1.250874, 1, 0.1490196, 0, 1,
-1.910848, 0.8471907, -0.2624542, 1, 0.1568628, 0, 1,
-1.899143, -0.1726324, -2.721473, 1, 0.1607843, 0, 1,
-1.897498, 0.1418026, -0.9342556, 1, 0.1686275, 0, 1,
-1.895923, -2.062914, -2.826248, 1, 0.172549, 0, 1,
-1.8479, -0.8360533, -1.942448, 1, 0.1803922, 0, 1,
-1.828565, 1.220436, -0.4985619, 1, 0.1843137, 0, 1,
-1.816675, -0.992226, -3.609278, 1, 0.1921569, 0, 1,
-1.813866, -0.3344703, -1.074275, 1, 0.1960784, 0, 1,
-1.794204, 0.5239893, -2.903872, 1, 0.2039216, 0, 1,
-1.746846, 1.442843, -0.8825563, 1, 0.2117647, 0, 1,
-1.737692, 0.5478323, -3.451536, 1, 0.2156863, 0, 1,
-1.736897, -0.777952, -0.7608501, 1, 0.2235294, 0, 1,
-1.728332, 0.5497385, 0.008356071, 1, 0.227451, 0, 1,
-1.723455, 0.3113934, -2.615118, 1, 0.2352941, 0, 1,
-1.702588, 1.292298, -0.08623819, 1, 0.2392157, 0, 1,
-1.699167, -0.991583, -2.584615, 1, 0.2470588, 0, 1,
-1.697073, 1.17933, -0.9270155, 1, 0.2509804, 0, 1,
-1.686639, 0.5015133, -3.466081, 1, 0.2588235, 0, 1,
-1.677012, -1.469244, 0.5743821, 1, 0.2627451, 0, 1,
-1.668445, -0.5959368, -2.716274, 1, 0.2705882, 0, 1,
-1.661047, -0.6338394, -1.412629, 1, 0.2745098, 0, 1,
-1.660545, -0.3230549, -1.216755, 1, 0.282353, 0, 1,
-1.658399, -0.03559718, -0.9806293, 1, 0.2862745, 0, 1,
-1.656711, 2.652333, -1.37332, 1, 0.2941177, 0, 1,
-1.635666, -0.5879292, -1.825312, 1, 0.3019608, 0, 1,
-1.627652, -0.4493558, -0.4772659, 1, 0.3058824, 0, 1,
-1.593601, -0.1403748, -3.495788, 1, 0.3137255, 0, 1,
-1.562442, -0.605855, -2.777523, 1, 0.3176471, 0, 1,
-1.551202, -1.647281, -1.807556, 1, 0.3254902, 0, 1,
-1.550865, 1.243448, 0.4602236, 1, 0.3294118, 0, 1,
-1.540084, 2.10578, -1.152989, 1, 0.3372549, 0, 1,
-1.539155, -1.384274, -3.078876, 1, 0.3411765, 0, 1,
-1.535196, -0.6502832, -1.6666, 1, 0.3490196, 0, 1,
-1.52877, 0.086073, 0.7493569, 1, 0.3529412, 0, 1,
-1.522849, 1.282407, -1.85163, 1, 0.3607843, 0, 1,
-1.518823, 0.6965132, -1.992645, 1, 0.3647059, 0, 1,
-1.513935, 0.6767628, -0.2005959, 1, 0.372549, 0, 1,
-1.498806, -0.5992368, -2.207407, 1, 0.3764706, 0, 1,
-1.491389, 0.04336387, -1.309019, 1, 0.3843137, 0, 1,
-1.490476, -1.378345, -2.408119, 1, 0.3882353, 0, 1,
-1.488939, -0.5041303, -1.540421, 1, 0.3960784, 0, 1,
-1.481993, -0.1144776, -0.5002578, 1, 0.4039216, 0, 1,
-1.463367, 1.162597, -0.2823918, 1, 0.4078431, 0, 1,
-1.462031, -0.5942873, -1.620202, 1, 0.4156863, 0, 1,
-1.447223, -1.574275, -1.820634, 1, 0.4196078, 0, 1,
-1.446144, 1.023553, -0.7729828, 1, 0.427451, 0, 1,
-1.445729, -1.036759, -2.753467, 1, 0.4313726, 0, 1,
-1.4337, 0.3833219, -1.162095, 1, 0.4392157, 0, 1,
-1.426111, -0.3897551, 0.2163332, 1, 0.4431373, 0, 1,
-1.426047, -0.1914152, 0.09863807, 1, 0.4509804, 0, 1,
-1.425929, -0.5479178, -0.6921398, 1, 0.454902, 0, 1,
-1.414033, 0.1959775, -1.896419, 1, 0.4627451, 0, 1,
-1.409403, 0.3558891, -1.325621, 1, 0.4666667, 0, 1,
-1.403548, -0.3294353, -2.372239, 1, 0.4745098, 0, 1,
-1.400681, -1.040954, -2.395979, 1, 0.4784314, 0, 1,
-1.38116, -1.348853, -2.198702, 1, 0.4862745, 0, 1,
-1.378573, -0.6418225, -1.237045, 1, 0.4901961, 0, 1,
-1.358587, 0.4348137, -3.459505, 1, 0.4980392, 0, 1,
-1.357217, 0.7534285, -0.8112347, 1, 0.5058824, 0, 1,
-1.354001, 1.300529, 0.825646, 1, 0.509804, 0, 1,
-1.34441, 1.029059, -0.03177138, 1, 0.5176471, 0, 1,
-1.335216, 0.9150369, -0.1138234, 1, 0.5215687, 0, 1,
-1.326289, -0.5040914, -0.9133682, 1, 0.5294118, 0, 1,
-1.325031, 1.312726, -1.867102, 1, 0.5333334, 0, 1,
-1.324837, -1.393665, -1.758004, 1, 0.5411765, 0, 1,
-1.323156, 1.020169, -0.9638235, 1, 0.5450981, 0, 1,
-1.315792, 0.4687746, 1.554888, 1, 0.5529412, 0, 1,
-1.30598, -1.087274, -2.284521, 1, 0.5568628, 0, 1,
-1.300263, -0.534406, -1.839434, 1, 0.5647059, 0, 1,
-1.289585, -0.6813263, -3.825125, 1, 0.5686275, 0, 1,
-1.289087, 0.269261, -2.647267, 1, 0.5764706, 0, 1,
-1.277072, -1.227137, -1.915696, 1, 0.5803922, 0, 1,
-1.263072, 0.280924, -0.458885, 1, 0.5882353, 0, 1,
-1.255212, 0.03069553, -0.2049016, 1, 0.5921569, 0, 1,
-1.25137, -0.2080823, -2.375951, 1, 0.6, 0, 1,
-1.246313, -0.2062127, -3.767203, 1, 0.6078432, 0, 1,
-1.229607, 0.9579523, -2.058307, 1, 0.6117647, 0, 1,
-1.227789, -0.709456, -3.648987, 1, 0.6196079, 0, 1,
-1.224382, -2.199893, -2.918942, 1, 0.6235294, 0, 1,
-1.204999, -1.642738, -1.992634, 1, 0.6313726, 0, 1,
-1.204678, -0.7236363, -2.389592, 1, 0.6352941, 0, 1,
-1.200139, 0.4901704, -0.7718047, 1, 0.6431373, 0, 1,
-1.195232, -0.5741624, -1.442024, 1, 0.6470588, 0, 1,
-1.194412, 0.06483062, -2.43372, 1, 0.654902, 0, 1,
-1.194085, 0.447979, -0.1814922, 1, 0.6588235, 0, 1,
-1.183981, -2.236375, -1.8161, 1, 0.6666667, 0, 1,
-1.181231, -0.162357, -1.165895, 1, 0.6705883, 0, 1,
-1.171292, 0.8238667, -1.197698, 1, 0.6784314, 0, 1,
-1.170823, 0.2774041, -1.021078, 1, 0.682353, 0, 1,
-1.165149, 0.7566512, -0.3834147, 1, 0.6901961, 0, 1,
-1.164765, -1.483457, -3.485231, 1, 0.6941177, 0, 1,
-1.146966, 0.5106363, 0.639012, 1, 0.7019608, 0, 1,
-1.145515, 0.3722649, -2.386489, 1, 0.7098039, 0, 1,
-1.136604, -0.7631103, -3.211822, 1, 0.7137255, 0, 1,
-1.136109, 0.2240786, -2.303704, 1, 0.7215686, 0, 1,
-1.13221, 1.746036, 0.2083646, 1, 0.7254902, 0, 1,
-1.120675, 0.7302905, -0.7803728, 1, 0.7333333, 0, 1,
-1.115149, 0.7209525, -1.882589, 1, 0.7372549, 0, 1,
-1.113522, -0.8593848, -2.726946, 1, 0.7450981, 0, 1,
-1.10689, 0.221262, -2.405799, 1, 0.7490196, 0, 1,
-1.103413, -0.3210827, -1.316623, 1, 0.7568628, 0, 1,
-1.09922, -0.6920247, -4.550846, 1, 0.7607843, 0, 1,
-1.095201, 1.593376, 0.4992945, 1, 0.7686275, 0, 1,
-1.093781, -0.4486287, -0.4623331, 1, 0.772549, 0, 1,
-1.084552, 0.3716457, -1.664773, 1, 0.7803922, 0, 1,
-1.078283, 0.3025679, 0.7233537, 1, 0.7843137, 0, 1,
-1.070234, 0.6787265, -0.5397186, 1, 0.7921569, 0, 1,
-1.059681, -0.5141618, -2.392027, 1, 0.7960784, 0, 1,
-1.054274, 1.088723, -0.09530659, 1, 0.8039216, 0, 1,
-1.03405, -0.05866845, -2.219463, 1, 0.8117647, 0, 1,
-1.030235, 0.797111, -0.4815049, 1, 0.8156863, 0, 1,
-1.02638, -0.2167291, -1.865541, 1, 0.8235294, 0, 1,
-1.024062, -0.5718138, -2.654185, 1, 0.827451, 0, 1,
-1.022954, -2.033262, -2.904541, 1, 0.8352941, 0, 1,
-1.021457, 1.329827, 0.7160991, 1, 0.8392157, 0, 1,
-1.018655, -1.408564, -2.934701, 1, 0.8470588, 0, 1,
-1.007417, 0.4526822, -1.236226, 1, 0.8509804, 0, 1,
-1.006792, 0.5055782, -1.325799, 1, 0.8588235, 0, 1,
-1.00312, 0.004573829, -2.84407, 1, 0.8627451, 0, 1,
-1.00187, -1.151149, -2.996351, 1, 0.8705882, 0, 1,
-0.9923465, -0.6557719, -2.42419, 1, 0.8745098, 0, 1,
-0.9915304, -0.8444193, -0.228168, 1, 0.8823529, 0, 1,
-0.9880844, 1.937912, -1.879952, 1, 0.8862745, 0, 1,
-0.9861901, -0.2872134, -2.032001, 1, 0.8941177, 0, 1,
-0.9709058, -0.912361, -3.367465, 1, 0.8980392, 0, 1,
-0.9692182, 1.128134, -1.954247, 1, 0.9058824, 0, 1,
-0.9669693, 0.3828077, -0.9508517, 1, 0.9137255, 0, 1,
-0.9661838, -2.24811, -3.019264, 1, 0.9176471, 0, 1,
-0.9611744, -0.6067345, -3.03817, 1, 0.9254902, 0, 1,
-0.9608349, -0.8723763, -2.541623, 1, 0.9294118, 0, 1,
-0.9504437, 0.5756648, -1.691956, 1, 0.9372549, 0, 1,
-0.9477286, 0.6253892, 0.2541523, 1, 0.9411765, 0, 1,
-0.942064, -0.8844407, -1.867707, 1, 0.9490196, 0, 1,
-0.93699, -0.7364413, -1.356841, 1, 0.9529412, 0, 1,
-0.9351367, -0.09009801, -2.343772, 1, 0.9607843, 0, 1,
-0.934581, -0.09869703, -3.514009, 1, 0.9647059, 0, 1,
-0.9321871, 0.9173975, -0.983799, 1, 0.972549, 0, 1,
-0.9309166, 0.7261318, -0.6167428, 1, 0.9764706, 0, 1,
-0.9265819, 1.504327, 0.8746671, 1, 0.9843137, 0, 1,
-0.9185137, 1.280371, -1.249012, 1, 0.9882353, 0, 1,
-0.9133366, 0.2338144, 1.237766, 1, 0.9960784, 0, 1,
-0.9012718, -1.075228, -1.775498, 0.9960784, 1, 0, 1,
-0.9005196, -1.27367, -3.724339, 0.9921569, 1, 0, 1,
-0.891986, -0.2632439, -3.190105, 0.9843137, 1, 0, 1,
-0.8873863, 0.6820241, -0.274532, 0.9803922, 1, 0, 1,
-0.8842183, 0.8371193, 2.099756, 0.972549, 1, 0, 1,
-0.8827762, 0.3381437, -2.939701, 0.9686275, 1, 0, 1,
-0.8804393, 0.3209, -1.873813, 0.9607843, 1, 0, 1,
-0.8768651, 0.5711639, 0.3611677, 0.9568627, 1, 0, 1,
-0.8622099, 0.659959, -2.249404, 0.9490196, 1, 0, 1,
-0.8567691, 0.8318962, -1.019859, 0.945098, 1, 0, 1,
-0.8562902, -0.0843161, -1.238199, 0.9372549, 1, 0, 1,
-0.8539322, 0.6151423, -0.2859778, 0.9333333, 1, 0, 1,
-0.8534621, -0.527292, -2.374163, 0.9254902, 1, 0, 1,
-0.8515323, 0.1669314, -1.697308, 0.9215686, 1, 0, 1,
-0.8467051, -0.3556607, -1.587902, 0.9137255, 1, 0, 1,
-0.846534, -2.603565, -2.998159, 0.9098039, 1, 0, 1,
-0.8452896, -0.2022165, -4.012297, 0.9019608, 1, 0, 1,
-0.8442381, -1.408141, -3.275977, 0.8941177, 1, 0, 1,
-0.8440188, 0.8845939, -1.674841, 0.8901961, 1, 0, 1,
-0.842555, 0.440289, -1.7563, 0.8823529, 1, 0, 1,
-0.8403057, 0.06061509, -2.374952, 0.8784314, 1, 0, 1,
-0.8402728, -3.104588, -1.170716, 0.8705882, 1, 0, 1,
-0.8387334, 0.7123825, -0.6724561, 0.8666667, 1, 0, 1,
-0.8345137, 2.145942, -0.1834405, 0.8588235, 1, 0, 1,
-0.8332809, 0.09027936, -2.47701, 0.854902, 1, 0, 1,
-0.832714, -0.07835618, 0.2939172, 0.8470588, 1, 0, 1,
-0.8300833, 0.3558574, -2.781163, 0.8431373, 1, 0, 1,
-0.8191008, -0.3486655, -1.680648, 0.8352941, 1, 0, 1,
-0.8169937, -0.3100664, -1.432999, 0.8313726, 1, 0, 1,
-0.8165905, -0.6662456, -3.697143, 0.8235294, 1, 0, 1,
-0.8113922, -1.219313, -2.710487, 0.8196079, 1, 0, 1,
-0.8091325, -1.141823, -1.642827, 0.8117647, 1, 0, 1,
-0.8075769, -0.5766888, -3.675898, 0.8078431, 1, 0, 1,
-0.8031752, 1.719233, -0.3531272, 0.8, 1, 0, 1,
-0.8022418, -0.1885135, -2.697616, 0.7921569, 1, 0, 1,
-0.7985767, -0.7064312, -2.587564, 0.7882353, 1, 0, 1,
-0.7960339, 0.3749387, -1.583838, 0.7803922, 1, 0, 1,
-0.7946411, 0.9033418, -1.505125, 0.7764706, 1, 0, 1,
-0.7899644, 0.8358126, -0.3464242, 0.7686275, 1, 0, 1,
-0.7824924, 0.0009821058, 0.6962876, 0.7647059, 1, 0, 1,
-0.7734921, 0.2738721, -0.8562818, 0.7568628, 1, 0, 1,
-0.7709522, 0.2652046, -1.996139, 0.7529412, 1, 0, 1,
-0.770914, 0.5024852, -2.018371, 0.7450981, 1, 0, 1,
-0.767817, -0.6309342, -2.421736, 0.7411765, 1, 0, 1,
-0.7611419, -0.5277011, -1.837854, 0.7333333, 1, 0, 1,
-0.7593805, -1.017804, -1.219607, 0.7294118, 1, 0, 1,
-0.7578524, -1.445328, -1.837364, 0.7215686, 1, 0, 1,
-0.7574754, -1.24158, -4.359769, 0.7176471, 1, 0, 1,
-0.7430063, 0.1880721, -1.547147, 0.7098039, 1, 0, 1,
-0.742582, -3.0306, -2.838604, 0.7058824, 1, 0, 1,
-0.7421147, 1.403536, 0.6624055, 0.6980392, 1, 0, 1,
-0.741006, 0.6279464, 0.250516, 0.6901961, 1, 0, 1,
-0.7372375, 0.8723743, 1.915587, 0.6862745, 1, 0, 1,
-0.7266382, 1.769607, -0.680337, 0.6784314, 1, 0, 1,
-0.7257842, 0.6862505, -2.497693, 0.6745098, 1, 0, 1,
-0.7227621, -1.313226, -3.813909, 0.6666667, 1, 0, 1,
-0.7175348, 0.6394843, -1.196831, 0.6627451, 1, 0, 1,
-0.7170935, 1.070124, -1.455931, 0.654902, 1, 0, 1,
-0.7139404, 1.56478, -1.583529, 0.6509804, 1, 0, 1,
-0.7115374, -1.760261, -2.868244, 0.6431373, 1, 0, 1,
-0.7095954, 0.3439595, -0.6120957, 0.6392157, 1, 0, 1,
-0.6971395, 0.555258, -0.7794477, 0.6313726, 1, 0, 1,
-0.6965272, 0.7857848, -2.179218, 0.627451, 1, 0, 1,
-0.6956524, -0.8310148, -4.029791, 0.6196079, 1, 0, 1,
-0.695589, -0.3076203, -0.5157582, 0.6156863, 1, 0, 1,
-0.6920448, 0.8539422, -0.7230486, 0.6078432, 1, 0, 1,
-0.6855765, 0.8068393, -1.612077, 0.6039216, 1, 0, 1,
-0.6841746, -1.116156, -3.249046, 0.5960785, 1, 0, 1,
-0.6823547, -0.8430811, -1.694619, 0.5882353, 1, 0, 1,
-0.6803314, -1.09987, -1.599501, 0.5843138, 1, 0, 1,
-0.6756806, -0.02267161, -3.433811, 0.5764706, 1, 0, 1,
-0.6752825, 0.1868036, -2.156391, 0.572549, 1, 0, 1,
-0.673366, -0.5868618, -3.837124, 0.5647059, 1, 0, 1,
-0.672709, -1.439197, -3.887908, 0.5607843, 1, 0, 1,
-0.6694636, 1.133251, -1.300775, 0.5529412, 1, 0, 1,
-0.6666581, -0.1455239, -0.2848793, 0.5490196, 1, 0, 1,
-0.6589513, 0.2888225, -2.901522, 0.5411765, 1, 0, 1,
-0.6567, 1.144861, -1.507035, 0.5372549, 1, 0, 1,
-0.6544859, 0.1248741, -3.446854, 0.5294118, 1, 0, 1,
-0.6529433, -0.1718004, -1.123074, 0.5254902, 1, 0, 1,
-0.6502419, -1.05243, -0.9664279, 0.5176471, 1, 0, 1,
-0.6496684, 0.3857199, -0.1740053, 0.5137255, 1, 0, 1,
-0.6371933, -0.645992, -0.7864525, 0.5058824, 1, 0, 1,
-0.6364051, -0.9060665, -2.071827, 0.5019608, 1, 0, 1,
-0.6359502, -1.804929, -1.073155, 0.4941176, 1, 0, 1,
-0.6352986, -1.50754, -3.371561, 0.4862745, 1, 0, 1,
-0.6346125, 0.4609616, 0.02332477, 0.4823529, 1, 0, 1,
-0.6319007, 0.04833527, -2.201575, 0.4745098, 1, 0, 1,
-0.6315905, -0.3114261, -2.467984, 0.4705882, 1, 0, 1,
-0.6281006, 0.8441643, 1.281237, 0.4627451, 1, 0, 1,
-0.6210364, -1.478136, -3.083602, 0.4588235, 1, 0, 1,
-0.6146182, 0.8558758, -1.714828, 0.4509804, 1, 0, 1,
-0.6084609, -0.2240849, -0.6547787, 0.4470588, 1, 0, 1,
-0.6059392, 1.97933, -0.197634, 0.4392157, 1, 0, 1,
-0.5857119, -1.008814, -4.580334, 0.4352941, 1, 0, 1,
-0.5854067, 1.968434, -0.5028617, 0.427451, 1, 0, 1,
-0.5850143, -0.04845155, -1.643276, 0.4235294, 1, 0, 1,
-0.5813645, -0.3400239, -0.4641509, 0.4156863, 1, 0, 1,
-0.5731617, 0.5269336, -1.083442, 0.4117647, 1, 0, 1,
-0.5687361, 1.288309, -0.4359225, 0.4039216, 1, 0, 1,
-0.5631522, 0.9367667, -2.147271, 0.3960784, 1, 0, 1,
-0.5630367, 2.036373, -1.241073, 0.3921569, 1, 0, 1,
-0.5575631, -0.155197, -2.944271, 0.3843137, 1, 0, 1,
-0.5557451, -0.03670516, -1.979756, 0.3803922, 1, 0, 1,
-0.5518473, 0.906238, -1.17109, 0.372549, 1, 0, 1,
-0.551414, 0.2217889, -0.2585993, 0.3686275, 1, 0, 1,
-0.5503787, 1.064929, -0.9062637, 0.3607843, 1, 0, 1,
-0.5503346, 0.331237, -0.3601418, 0.3568628, 1, 0, 1,
-0.5464304, 0.8293181, -0.6112714, 0.3490196, 1, 0, 1,
-0.5433215, 0.7474768, -0.3207612, 0.345098, 1, 0, 1,
-0.5416884, 1.065899, 0.1997937, 0.3372549, 1, 0, 1,
-0.5411747, 1.095341, 0.1080311, 0.3333333, 1, 0, 1,
-0.5371915, 0.09916529, -1.206243, 0.3254902, 1, 0, 1,
-0.5366708, 0.486314, -1.94975, 0.3215686, 1, 0, 1,
-0.5363966, -0.8396477, -3.607821, 0.3137255, 1, 0, 1,
-0.5346823, 0.1305563, -4.448098, 0.3098039, 1, 0, 1,
-0.5286362, -0.3236879, 0.5766951, 0.3019608, 1, 0, 1,
-0.523484, -0.3391019, -1.96693, 0.2941177, 1, 0, 1,
-0.5202872, 0.1069651, -1.568274, 0.2901961, 1, 0, 1,
-0.5161133, -0.6264998, -4.477807, 0.282353, 1, 0, 1,
-0.511298, 0.3833206, -1.856576, 0.2784314, 1, 0, 1,
-0.509318, -0.1128218, -2.263186, 0.2705882, 1, 0, 1,
-0.5078507, -1.621794, -3.005868, 0.2666667, 1, 0, 1,
-0.5056008, 0.9989216, -1.194856, 0.2588235, 1, 0, 1,
-0.5029789, 0.5215343, -1.474499, 0.254902, 1, 0, 1,
-0.5002159, -0.3884999, -1.82616, 0.2470588, 1, 0, 1,
-0.4905258, -1.864164, -2.895021, 0.2431373, 1, 0, 1,
-0.4878535, -2.103395, -2.500872, 0.2352941, 1, 0, 1,
-0.4867118, -0.507067, -3.871502, 0.2313726, 1, 0, 1,
-0.4820081, -0.8408811, -2.464646, 0.2235294, 1, 0, 1,
-0.481156, 0.6731037, -0.01251374, 0.2196078, 1, 0, 1,
-0.4759211, -1.384054, -2.554413, 0.2117647, 1, 0, 1,
-0.4744009, -0.5303509, -3.278591, 0.2078431, 1, 0, 1,
-0.4742327, -1.28603, -3.710185, 0.2, 1, 0, 1,
-0.4722384, -1.168097, -3.724213, 0.1921569, 1, 0, 1,
-0.4676787, 1.134598, -0.6056291, 0.1882353, 1, 0, 1,
-0.4674496, 0.3901375, -0.2312654, 0.1803922, 1, 0, 1,
-0.4662211, -0.08054309, -1.251719, 0.1764706, 1, 0, 1,
-0.4657774, 0.2299574, -1.283269, 0.1686275, 1, 0, 1,
-0.4656678, -1.421132, -3.946567, 0.1647059, 1, 0, 1,
-0.4644105, -1.105327, -3.239625, 0.1568628, 1, 0, 1,
-0.4638138, -0.1190582, -2.4923, 0.1529412, 1, 0, 1,
-0.4631571, 0.4709668, -0.8352845, 0.145098, 1, 0, 1,
-0.4598747, -0.2496372, -2.860574, 0.1411765, 1, 0, 1,
-0.4575721, 1.456653, -0.4772714, 0.1333333, 1, 0, 1,
-0.4541749, -1.004032, -1.683916, 0.1294118, 1, 0, 1,
-0.4535205, -0.2242237, -1.742429, 0.1215686, 1, 0, 1,
-0.4510918, -1.154369, -2.473558, 0.1176471, 1, 0, 1,
-0.4476019, -1.642491, -4.33079, 0.1098039, 1, 0, 1,
-0.4459769, 0.75366, 0.9833104, 0.1058824, 1, 0, 1,
-0.443003, -0.1352135, -2.715662, 0.09803922, 1, 0, 1,
-0.4417969, 0.3264823, -0.1507102, 0.09019608, 1, 0, 1,
-0.4407226, 1.082817, -1.215677, 0.08627451, 1, 0, 1,
-0.4351142, -0.02101878, -1.339516, 0.07843138, 1, 0, 1,
-0.4331212, 0.6074044, -1.157843, 0.07450981, 1, 0, 1,
-0.4329099, -2.136968, -4.425149, 0.06666667, 1, 0, 1,
-0.4313321, 1.165974, -0.4998282, 0.0627451, 1, 0, 1,
-0.4240025, -1.561717, -2.670118, 0.05490196, 1, 0, 1,
-0.4219246, 0.2114928, -1.709148, 0.05098039, 1, 0, 1,
-0.4192083, -1.013959, -3.292746, 0.04313726, 1, 0, 1,
-0.417993, -1.034621, -2.685729, 0.03921569, 1, 0, 1,
-0.4168132, -1.746354, -3.43636, 0.03137255, 1, 0, 1,
-0.4161258, -1.290041, -3.595028, 0.02745098, 1, 0, 1,
-0.4142447, -0.5085113, -1.52002, 0.01960784, 1, 0, 1,
-0.4116205, 0.6352037, -1.166388, 0.01568628, 1, 0, 1,
-0.411047, -0.8887701, -3.624975, 0.007843138, 1, 0, 1,
-0.4093524, -1.251891, -2.38924, 0.003921569, 1, 0, 1,
-0.4084395, -0.2915118, -4.056924, 0, 1, 0.003921569, 1,
-0.4033816, 0.1640034, -1.418925, 0, 1, 0.01176471, 1,
-0.403353, -1.293521, -0.3855086, 0, 1, 0.01568628, 1,
-0.4033443, 1.246216, -0.5962366, 0, 1, 0.02352941, 1,
-0.4031116, 0.2870074, -0.9853231, 0, 1, 0.02745098, 1,
-0.398534, -1.286663, -2.688505, 0, 1, 0.03529412, 1,
-0.3985001, -0.4147791, -1.874672, 0, 1, 0.03921569, 1,
-0.3947653, -1.97176, -1.709627, 0, 1, 0.04705882, 1,
-0.3918041, 2.229092, -1.245095, 0, 1, 0.05098039, 1,
-0.3892077, 0.5656185, 0.3815736, 0, 1, 0.05882353, 1,
-0.3857681, -0.1798436, -2.142367, 0, 1, 0.0627451, 1,
-0.3855942, 0.3411726, -0.6118235, 0, 1, 0.07058824, 1,
-0.3811426, -1.662921, -3.270044, 0, 1, 0.07450981, 1,
-0.3755507, 1.018413, 1.119794, 0, 1, 0.08235294, 1,
-0.369858, 0.5101022, 1.400782, 0, 1, 0.08627451, 1,
-0.3652028, -0.4614692, -2.215498, 0, 1, 0.09411765, 1,
-0.3648121, -1.330413, -3.738106, 0, 1, 0.1019608, 1,
-0.3631992, 1.534554, -1.056258, 0, 1, 0.1058824, 1,
-0.3615405, -1.061293, -1.892943, 0, 1, 0.1137255, 1,
-0.3601433, -0.5862853, -3.268346, 0, 1, 0.1176471, 1,
-0.3571403, -1.116621, -3.130182, 0, 1, 0.1254902, 1,
-0.3564053, 1.083106, 1.000253, 0, 1, 0.1294118, 1,
-0.3561972, -0.05919734, -2.006004, 0, 1, 0.1372549, 1,
-0.356143, 0.8614535, 1.424991, 0, 1, 0.1411765, 1,
-0.3527919, 1.255853, -0.4967756, 0, 1, 0.1490196, 1,
-0.3521549, -0.1386932, -1.48128, 0, 1, 0.1529412, 1,
-0.3493428, 1.125561, -0.8893025, 0, 1, 0.1607843, 1,
-0.3480006, -0.6846551, -2.110353, 0, 1, 0.1647059, 1,
-0.347952, -0.2857879, -3.07794, 0, 1, 0.172549, 1,
-0.3461269, -0.698663, -3.539084, 0, 1, 0.1764706, 1,
-0.344911, -2.584822, -2.512004, 0, 1, 0.1843137, 1,
-0.3369273, 0.4790578, -0.9244485, 0, 1, 0.1882353, 1,
-0.3349897, -0.2207274, -1.91403, 0, 1, 0.1960784, 1,
-0.334793, -0.1192016, -0.8925759, 0, 1, 0.2039216, 1,
-0.3336658, 0.6183056, -1.115044, 0, 1, 0.2078431, 1,
-0.3307608, 0.006225008, -2.878384, 0, 1, 0.2156863, 1,
-0.3287028, 0.1416593, -0.1715717, 0, 1, 0.2196078, 1,
-0.3262945, -0.4720074, -2.322353, 0, 1, 0.227451, 1,
-0.3262647, -0.9600991, -2.43074, 0, 1, 0.2313726, 1,
-0.3251975, 0.9383835, -0.3273717, 0, 1, 0.2392157, 1,
-0.3247173, -0.9816082, -0.3770256, 0, 1, 0.2431373, 1,
-0.3150044, 0.0799027, -2.674659, 0, 1, 0.2509804, 1,
-0.3106088, -0.7293736, -3.759231, 0, 1, 0.254902, 1,
-0.3067315, -0.2172953, -1.534536, 0, 1, 0.2627451, 1,
-0.3065322, -2.12363, -2.638563, 0, 1, 0.2666667, 1,
-0.3061133, 0.4252436, 0.3104621, 0, 1, 0.2745098, 1,
-0.3041782, 0.4048867, 0.04005177, 0, 1, 0.2784314, 1,
-0.3019478, -0.05403481, -1.15466, 0, 1, 0.2862745, 1,
-0.3017397, -0.190636, -2.922243, 0, 1, 0.2901961, 1,
-0.3007517, 1.582717, -1.214758, 0, 1, 0.2980392, 1,
-0.2979362, -0.402206, -2.496302, 0, 1, 0.3058824, 1,
-0.2962532, 0.3498998, -0.8271483, 0, 1, 0.3098039, 1,
-0.2914283, 0.4821322, -0.08415046, 0, 1, 0.3176471, 1,
-0.2913953, 0.2680935, -0.9000203, 0, 1, 0.3215686, 1,
-0.2900545, -1.053746, -2.859238, 0, 1, 0.3294118, 1,
-0.2871116, 0.001730154, -1.583206, 0, 1, 0.3333333, 1,
-0.2866989, -0.9268166, -2.752436, 0, 1, 0.3411765, 1,
-0.2855649, 1.301307, 0.1929032, 0, 1, 0.345098, 1,
-0.2847675, 1.141356, 0.3397419, 0, 1, 0.3529412, 1,
-0.2799415, -0.7297608, -2.184471, 0, 1, 0.3568628, 1,
-0.2789582, 1.264654, -2.14843, 0, 1, 0.3647059, 1,
-0.2779691, -0.8406427, -5.443216, 0, 1, 0.3686275, 1,
-0.2778606, 0.7198774, -0.6073817, 0, 1, 0.3764706, 1,
-0.2767387, -0.7189285, -2.749417, 0, 1, 0.3803922, 1,
-0.2733867, -0.6850986, -1.323971, 0, 1, 0.3882353, 1,
-0.2671739, 0.9702646, 1.500106, 0, 1, 0.3921569, 1,
-0.2667023, 1.897183, -1.123566, 0, 1, 0.4, 1,
-0.2654977, -1.07735, -2.6268, 0, 1, 0.4078431, 1,
-0.2635762, 2.40132, -0.1350919, 0, 1, 0.4117647, 1,
-0.2614898, -0.6009286, -1.399512, 0, 1, 0.4196078, 1,
-0.2595095, -1.228413, -3.815491, 0, 1, 0.4235294, 1,
-0.2579057, 0.4415273, -0.7496265, 0, 1, 0.4313726, 1,
-0.2567298, -0.4613851, -2.550711, 0, 1, 0.4352941, 1,
-0.2552766, 1.442068, 1.14082, 0, 1, 0.4431373, 1,
-0.2549079, -1.261192, -2.893363, 0, 1, 0.4470588, 1,
-0.2481883, -0.6575887, -2.48756, 0, 1, 0.454902, 1,
-0.2460355, -1.524521, -2.085418, 0, 1, 0.4588235, 1,
-0.2447371, 0.640714, -2.813563, 0, 1, 0.4666667, 1,
-0.2443292, -1.261921, -2.186165, 0, 1, 0.4705882, 1,
-0.2440677, -0.2152932, -2.674015, 0, 1, 0.4784314, 1,
-0.2424775, -0.4527365, -2.778997, 0, 1, 0.4823529, 1,
-0.2405233, -1.453414, -2.421802, 0, 1, 0.4901961, 1,
-0.233751, 0.7066151, 0.2415174, 0, 1, 0.4941176, 1,
-0.2268012, -0.3016126, -1.271838, 0, 1, 0.5019608, 1,
-0.2200615, -0.8023495, -3.005663, 0, 1, 0.509804, 1,
-0.2198019, -2.035697, -4.568502, 0, 1, 0.5137255, 1,
-0.2109586, 0.03504737, -3.189986, 0, 1, 0.5215687, 1,
-0.2092807, 0.826381, 0.09593647, 0, 1, 0.5254902, 1,
-0.2090382, -0.5603643, -2.656915, 0, 1, 0.5333334, 1,
-0.2077074, -1.056852, -2.782972, 0, 1, 0.5372549, 1,
-0.2074048, 0.1003565, 1.670644, 0, 1, 0.5450981, 1,
-0.2066009, 0.1576297, -1.846652, 0, 1, 0.5490196, 1,
-0.2024159, 1.75372, 0.05793155, 0, 1, 0.5568628, 1,
-0.2015624, 0.497708, 1.412795, 0, 1, 0.5607843, 1,
-0.200184, -0.3664307, -2.86164, 0, 1, 0.5686275, 1,
-0.1969661, -0.4208, -3.442131, 0, 1, 0.572549, 1,
-0.1946298, -0.08378486, -2.158054, 0, 1, 0.5803922, 1,
-0.194166, 0.3802465, -0.1030904, 0, 1, 0.5843138, 1,
-0.1932331, -0.3224027, -3.086084, 0, 1, 0.5921569, 1,
-0.1890182, 1.22423, -0.5816471, 0, 1, 0.5960785, 1,
-0.1873574, 0.262335, -1.083733, 0, 1, 0.6039216, 1,
-0.1841537, -1.603077, -2.779958, 0, 1, 0.6117647, 1,
-0.183775, 0.7985163, 0.3698459, 0, 1, 0.6156863, 1,
-0.183669, -1.046034, -3.65732, 0, 1, 0.6235294, 1,
-0.1761052, -0.163106, -2.687568, 0, 1, 0.627451, 1,
-0.1739299, 0.215354, -0.1476505, 0, 1, 0.6352941, 1,
-0.1614842, 0.528554, -0.9496413, 0, 1, 0.6392157, 1,
-0.1606991, -0.3755774, -0.1163668, 0, 1, 0.6470588, 1,
-0.1549123, -0.8456121, -2.972719, 0, 1, 0.6509804, 1,
-0.1473945, -2.604712, -2.277434, 0, 1, 0.6588235, 1,
-0.1436322, -0.761413, -3.300368, 0, 1, 0.6627451, 1,
-0.1429987, 1.44485, -1.013198, 0, 1, 0.6705883, 1,
-0.1429687, 0.2563335, 0.8939501, 0, 1, 0.6745098, 1,
-0.1386944, 0.6991079, -0.5874726, 0, 1, 0.682353, 1,
-0.1366425, -1.712862, -4.042137, 0, 1, 0.6862745, 1,
-0.1356142, -0.3957018, -4.521328, 0, 1, 0.6941177, 1,
-0.1157854, 0.6377664, -0.4206093, 0, 1, 0.7019608, 1,
-0.1100786, -0.4577237, -3.399687, 0, 1, 0.7058824, 1,
-0.1096034, -0.9620935, -3.55198, 0, 1, 0.7137255, 1,
-0.1090102, -0.1748664, -2.971633, 0, 1, 0.7176471, 1,
-0.102871, -0.5366104, -3.74929, 0, 1, 0.7254902, 1,
-0.1024785, 0.6533268, -1.599126, 0, 1, 0.7294118, 1,
-0.09919976, 1.033743, -1.138378, 0, 1, 0.7372549, 1,
-0.09798773, 0.2308087, -2.555931, 0, 1, 0.7411765, 1,
-0.09649053, -0.8863469, -1.086197, 0, 1, 0.7490196, 1,
-0.09609799, 1.164101, -1.709676, 0, 1, 0.7529412, 1,
-0.09522902, -0.2918623, -1.751731, 0, 1, 0.7607843, 1,
-0.09381744, -1.978155, -2.473734, 0, 1, 0.7647059, 1,
-0.09226245, -1.130893, -3.305542, 0, 1, 0.772549, 1,
-0.09048517, 0.9223556, 1.309698, 0, 1, 0.7764706, 1,
-0.08914986, -1.877866, -4.776939, 0, 1, 0.7843137, 1,
-0.08870446, -1.177623, -4.234725, 0, 1, 0.7882353, 1,
-0.08445489, -0.1974472, -2.778777, 0, 1, 0.7960784, 1,
-0.08348835, 0.07269527, -2.182818, 0, 1, 0.8039216, 1,
-0.08314768, 0.7034659, 0.5462341, 0, 1, 0.8078431, 1,
-0.08176635, -0.2628817, -2.749651, 0, 1, 0.8156863, 1,
-0.07324207, 0.07718747, -2.613591, 0, 1, 0.8196079, 1,
-0.07020111, -0.8554857, -1.82437, 0, 1, 0.827451, 1,
-0.06976203, 0.338093, -0.1601392, 0, 1, 0.8313726, 1,
-0.06829498, 0.3899876, -0.8617736, 0, 1, 0.8392157, 1,
-0.06358291, 0.7074776, -1.783691, 0, 1, 0.8431373, 1,
-0.0608089, -1.606562, -2.324309, 0, 1, 0.8509804, 1,
-0.05966048, 0.1959231, -1.088779, 0, 1, 0.854902, 1,
-0.05842788, -1.560099, -2.400391, 0, 1, 0.8627451, 1,
-0.05456229, -1.783917, -4.250084, 0, 1, 0.8666667, 1,
-0.05091798, -0.09354025, -2.098015, 0, 1, 0.8745098, 1,
-0.04273362, 0.4361941, 1.347792, 0, 1, 0.8784314, 1,
-0.04149216, 0.7585048, 0.3765421, 0, 1, 0.8862745, 1,
-0.03860312, -1.227248, -3.919596, 0, 1, 0.8901961, 1,
-0.03753819, 1.191513, -0.341083, 0, 1, 0.8980392, 1,
-0.03559013, 0.2268383, 0.8164215, 0, 1, 0.9058824, 1,
-0.03403994, -0.3088817, -3.258266, 0, 1, 0.9098039, 1,
-0.03184671, -0.6962616, -3.899155, 0, 1, 0.9176471, 1,
-0.02624282, 0.4053652, 0.5703674, 0, 1, 0.9215686, 1,
-0.02326423, -0.7454722, -2.285816, 0, 1, 0.9294118, 1,
-0.01835892, -0.2542589, -2.145645, 0, 1, 0.9333333, 1,
-0.0134411, 1.016404, -0.9662009, 0, 1, 0.9411765, 1,
-0.01192283, -1.606092, -3.004828, 0, 1, 0.945098, 1,
-0.007815178, 1.799391, 0.8862482, 0, 1, 0.9529412, 1,
0.004325361, 1.044884, 1.011181, 0, 1, 0.9568627, 1,
0.004560405, -0.943348, 2.807611, 0, 1, 0.9647059, 1,
0.005145717, -0.4802904, 3.330647, 0, 1, 0.9686275, 1,
0.01311358, -1.428773, 2.450252, 0, 1, 0.9764706, 1,
0.01472313, -0.5957966, 1.927494, 0, 1, 0.9803922, 1,
0.01687873, -2.144861, 2.351442, 0, 1, 0.9882353, 1,
0.01940037, 0.8512349, -0.2101677, 0, 1, 0.9921569, 1,
0.0279615, -0.07984179, 1.810458, 0, 1, 1, 1,
0.02936624, 1.877884, 0.9246086, 0, 0.9921569, 1, 1,
0.03536769, 0.06120682, -1.096316, 0, 0.9882353, 1, 1,
0.03636958, -0.5480362, 3.418708, 0, 0.9803922, 1, 1,
0.03789544, -1.423552, 2.784157, 0, 0.9764706, 1, 1,
0.05697322, -0.1739962, 1.757288, 0, 0.9686275, 1, 1,
0.05819343, -1.049027, 1.697235, 0, 0.9647059, 1, 1,
0.06007994, -0.3228584, 1.794127, 0, 0.9568627, 1, 1,
0.06085785, 1.629019, 1.400393, 0, 0.9529412, 1, 1,
0.06410448, 1.76284, 0.0863367, 0, 0.945098, 1, 1,
0.0646024, -1.55855, 2.223364, 0, 0.9411765, 1, 1,
0.06687792, 0.2122146, -0.4020074, 0, 0.9333333, 1, 1,
0.06710492, -2.917158, 3.442741, 0, 0.9294118, 1, 1,
0.06897414, -0.5622138, 2.872951, 0, 0.9215686, 1, 1,
0.07183307, -2.097588, 2.418658, 0, 0.9176471, 1, 1,
0.07278739, -0.3026053, 3.493567, 0, 0.9098039, 1, 1,
0.07594185, -0.8297903, 3.231169, 0, 0.9058824, 1, 1,
0.0760203, -0.1456946, 3.461523, 0, 0.8980392, 1, 1,
0.08273008, 0.7162027, -0.4195087, 0, 0.8901961, 1, 1,
0.08315843, 0.837717, -0.05288261, 0, 0.8862745, 1, 1,
0.088677, 1.59447, -0.4475747, 0, 0.8784314, 1, 1,
0.09385937, 0.7697778, -0.3140926, 0, 0.8745098, 1, 1,
0.09516302, -1.900563, 3.901185, 0, 0.8666667, 1, 1,
0.09629641, -0.2805898, 2.263238, 0, 0.8627451, 1, 1,
0.09694762, 0.1533632, -0.7456527, 0, 0.854902, 1, 1,
0.09887636, 0.5098837, 1.508179, 0, 0.8509804, 1, 1,
0.1020395, 0.6383613, -1.751699, 0, 0.8431373, 1, 1,
0.1086461, 0.9627026, 0.4652268, 0, 0.8392157, 1, 1,
0.1088987, -0.8890729, 3.48747, 0, 0.8313726, 1, 1,
0.1146174, 0.1173074, 1.284735, 0, 0.827451, 1, 1,
0.1177349, 2.993116, -1.575935, 0, 0.8196079, 1, 1,
0.1181289, -1.373935, 3.077348, 0, 0.8156863, 1, 1,
0.119839, 1.572802, -0.2017108, 0, 0.8078431, 1, 1,
0.1269383, -0.7701717, 2.106155, 0, 0.8039216, 1, 1,
0.1277865, 0.1524027, 2.404111, 0, 0.7960784, 1, 1,
0.1396865, 0.4629114, -0.06341487, 0, 0.7882353, 1, 1,
0.141465, -0.7046604, 1.19038, 0, 0.7843137, 1, 1,
0.1428638, -1.420394, 2.855367, 0, 0.7764706, 1, 1,
0.1433803, -0.6540062, 3.928245, 0, 0.772549, 1, 1,
0.1438965, -0.8454319, 4.82634, 0, 0.7647059, 1, 1,
0.1457018, -1.261892, 3.144508, 0, 0.7607843, 1, 1,
0.1493664, -0.8778872, 2.950017, 0, 0.7529412, 1, 1,
0.1509985, 0.8303633, -1.758156, 0, 0.7490196, 1, 1,
0.1562042, -0.977012, 3.320697, 0, 0.7411765, 1, 1,
0.1581477, 0.1217591, -0.5953848, 0, 0.7372549, 1, 1,
0.1587735, 0.487072, 1.037795, 0, 0.7294118, 1, 1,
0.1594459, -0.8521696, 1.647914, 0, 0.7254902, 1, 1,
0.165203, 0.2233298, 1.123907, 0, 0.7176471, 1, 1,
0.1680776, 0.6206542, 0.7521891, 0, 0.7137255, 1, 1,
0.1711433, -1.0967, 2.944336, 0, 0.7058824, 1, 1,
0.1716576, -1.121902, 1.340715, 0, 0.6980392, 1, 1,
0.1788026, 1.550307, 0.3241887, 0, 0.6941177, 1, 1,
0.1791797, -0.4045077, 4.041611, 0, 0.6862745, 1, 1,
0.1843441, 1.469876, 1.430293, 0, 0.682353, 1, 1,
0.1902221, 0.9349074, -0.4515311, 0, 0.6745098, 1, 1,
0.1912872, 0.0005501451, -1.049535, 0, 0.6705883, 1, 1,
0.1993784, 0.7326904, 0.2732369, 0, 0.6627451, 1, 1,
0.1994463, -0.04185848, 1.271042, 0, 0.6588235, 1, 1,
0.2019443, -0.2921517, 2.119697, 0, 0.6509804, 1, 1,
0.2036927, 0.3778869, 0.1851017, 0, 0.6470588, 1, 1,
0.2063929, -0.8546964, 1.566946, 0, 0.6392157, 1, 1,
0.2065595, 1.121579, -0.1993555, 0, 0.6352941, 1, 1,
0.2093304, -1.302154, 2.607031, 0, 0.627451, 1, 1,
0.2096274, -0.8100792, 2.443127, 0, 0.6235294, 1, 1,
0.211694, 1.058143, 0.384862, 0, 0.6156863, 1, 1,
0.2131777, 0.645103, -0.2644566, 0, 0.6117647, 1, 1,
0.2155668, 0.2341114, 0.8928035, 0, 0.6039216, 1, 1,
0.2168999, -2.20299, 2.18423, 0, 0.5960785, 1, 1,
0.220877, 2.448621, 0.4715219, 0, 0.5921569, 1, 1,
0.221551, -0.1577507, 2.386524, 0, 0.5843138, 1, 1,
0.2285037, 0.8888706, -0.842086, 0, 0.5803922, 1, 1,
0.2309376, -0.5392726, 3.09355, 0, 0.572549, 1, 1,
0.2313324, -0.1221089, 2.719649, 0, 0.5686275, 1, 1,
0.2315809, -1.446191, 2.475175, 0, 0.5607843, 1, 1,
0.2330988, 0.2644183, 1.988564, 0, 0.5568628, 1, 1,
0.2344153, -0.1779445, 2.640795, 0, 0.5490196, 1, 1,
0.2366709, 0.9739203, 1.752188, 0, 0.5450981, 1, 1,
0.2370445, -1.327706, 1.804076, 0, 0.5372549, 1, 1,
0.2382964, 0.7603116, 0.1543331, 0, 0.5333334, 1, 1,
0.2404494, -0.5535975, 2.004686, 0, 0.5254902, 1, 1,
0.2534013, 0.04332136, 2.366951, 0, 0.5215687, 1, 1,
0.2546627, -0.6261145, 1.992065, 0, 0.5137255, 1, 1,
0.2549531, 0.2297938, 1.100087, 0, 0.509804, 1, 1,
0.2604996, 0.4083197, -0.04596736, 0, 0.5019608, 1, 1,
0.2615646, 0.5610194, 1.058919, 0, 0.4941176, 1, 1,
0.2690384, 0.8046264, 1.233573, 0, 0.4901961, 1, 1,
0.271318, 0.900104, 0.7844058, 0, 0.4823529, 1, 1,
0.272657, -0.9273657, 1.496171, 0, 0.4784314, 1, 1,
0.2746187, 0.51555, -0.7884723, 0, 0.4705882, 1, 1,
0.2751963, -0.6273789, 0.5978251, 0, 0.4666667, 1, 1,
0.2804407, 0.6650094, -0.2159681, 0, 0.4588235, 1, 1,
0.2813401, 0.7018074, 0.6200702, 0, 0.454902, 1, 1,
0.287095, 0.3391899, 2.238085, 0, 0.4470588, 1, 1,
0.2902328, -1.323579, 1.765285, 0, 0.4431373, 1, 1,
0.2943381, 0.4960034, -0.04589017, 0, 0.4352941, 1, 1,
0.3012568, 0.8344358, 1.053834, 0, 0.4313726, 1, 1,
0.3042564, -0.07509766, 1.637919, 0, 0.4235294, 1, 1,
0.3045717, -1.736473, 1.660503, 0, 0.4196078, 1, 1,
0.3076705, -1.02282, 3.087781, 0, 0.4117647, 1, 1,
0.3125046, -0.2724539, 1.177514, 0, 0.4078431, 1, 1,
0.3133326, 0.8366622, 2.332198, 0, 0.4, 1, 1,
0.3167694, -1.06453, 4.635017, 0, 0.3921569, 1, 1,
0.3182912, 1.138027, -0.3387736, 0, 0.3882353, 1, 1,
0.3195289, -0.8533823, 1.15569, 0, 0.3803922, 1, 1,
0.3207191, 0.6720668, -1.044596, 0, 0.3764706, 1, 1,
0.322549, 0.5776291, 2.070246, 0, 0.3686275, 1, 1,
0.3228221, -0.01210072, 2.16189, 0, 0.3647059, 1, 1,
0.3231461, -0.05887086, 1.125744, 0, 0.3568628, 1, 1,
0.3247853, -2.051756, 2.350643, 0, 0.3529412, 1, 1,
0.3294363, -0.6019135, 2.577671, 0, 0.345098, 1, 1,
0.3329679, 0.7667022, 2.221134, 0, 0.3411765, 1, 1,
0.3331738, -1.15387, 0.5340042, 0, 0.3333333, 1, 1,
0.3431176, -0.8109631, 2.336537, 0, 0.3294118, 1, 1,
0.3467133, -1.413052, 3.323139, 0, 0.3215686, 1, 1,
0.3497059, 1.735129, -0.3639025, 0, 0.3176471, 1, 1,
0.3531386, 0.5616078, -0.5904839, 0, 0.3098039, 1, 1,
0.3549292, 0.9546511, 0.2544689, 0, 0.3058824, 1, 1,
0.3560303, -0.257837, 1.50278, 0, 0.2980392, 1, 1,
0.3627021, 0.2446165, 0.1329744, 0, 0.2901961, 1, 1,
0.3667921, 0.9104884, 2.052641, 0, 0.2862745, 1, 1,
0.3710152, -0.01086754, 2.490129, 0, 0.2784314, 1, 1,
0.3713901, 0.4575373, 1.828264, 0, 0.2745098, 1, 1,
0.3720367, -0.1186235, 3.470136, 0, 0.2666667, 1, 1,
0.3725341, 0.726333, 0.9076623, 0, 0.2627451, 1, 1,
0.3764685, 2.075216, 0.786163, 0, 0.254902, 1, 1,
0.3804882, 0.1947515, -0.03166467, 0, 0.2509804, 1, 1,
0.3848044, -0.4980794, 2.716321, 0, 0.2431373, 1, 1,
0.3862167, -0.6766081, 4.425795, 0, 0.2392157, 1, 1,
0.3878118, 0.4855089, 2.804302, 0, 0.2313726, 1, 1,
0.3926973, 0.05160557, 2.055824, 0, 0.227451, 1, 1,
0.4018961, 0.4323239, 2.277428, 0, 0.2196078, 1, 1,
0.4020535, -1.276953, 2.685905, 0, 0.2156863, 1, 1,
0.4037619, -0.6111964, 0.7758425, 0, 0.2078431, 1, 1,
0.4066757, 0.6705207, -0.2165931, 0, 0.2039216, 1, 1,
0.4067589, 0.933342, 0.5803184, 0, 0.1960784, 1, 1,
0.4094208, -0.6772176, 2.597978, 0, 0.1882353, 1, 1,
0.4106939, 0.6164156, -0.43581, 0, 0.1843137, 1, 1,
0.4126966, 0.1463275, 1.816784, 0, 0.1764706, 1, 1,
0.4130808, 0.1609295, 3.00943, 0, 0.172549, 1, 1,
0.4144392, -1.134543, 2.042989, 0, 0.1647059, 1, 1,
0.4173513, -0.6088502, 2.084451, 0, 0.1607843, 1, 1,
0.4174908, -1.063067, 0.06336352, 0, 0.1529412, 1, 1,
0.4188397, 0.1806654, 0.09276292, 0, 0.1490196, 1, 1,
0.4198266, -0.5922595, 3.373082, 0, 0.1411765, 1, 1,
0.4200241, 0.1341065, 2.07643, 0, 0.1372549, 1, 1,
0.4204013, 1.451805, 1.148226, 0, 0.1294118, 1, 1,
0.4210805, -2.132003, 0.7258874, 0, 0.1254902, 1, 1,
0.4287377, -0.5553198, 0.8882406, 0, 0.1176471, 1, 1,
0.4291059, 1.078228, -0.3923606, 0, 0.1137255, 1, 1,
0.4299207, 0.8223256, -0.5109318, 0, 0.1058824, 1, 1,
0.4305885, 1.554753, 1.505376, 0, 0.09803922, 1, 1,
0.432945, 1.160882, 0.8063516, 0, 0.09411765, 1, 1,
0.4375234, 1.941947, 0.3470159, 0, 0.08627451, 1, 1,
0.4405577, -0.3449893, 1.758485, 0, 0.08235294, 1, 1,
0.4432237, 0.4188801, 1.674729, 0, 0.07450981, 1, 1,
0.4460131, 0.4717968, 0.5092421, 0, 0.07058824, 1, 1,
0.4460406, -0.3147538, 2.167064, 0, 0.0627451, 1, 1,
0.4488927, 0.721555, -0.1770717, 0, 0.05882353, 1, 1,
0.4497529, 1.3244, 0.4848039, 0, 0.05098039, 1, 1,
0.4538144, -2.274282, 2.645465, 0, 0.04705882, 1, 1,
0.4538751, -0.9981, 1.673476, 0, 0.03921569, 1, 1,
0.4544309, 2.253954, -0.7354761, 0, 0.03529412, 1, 1,
0.4550688, 0.8455361, -0.5488857, 0, 0.02745098, 1, 1,
0.455505, 1.256889, -0.03230198, 0, 0.02352941, 1, 1,
0.4563303, -0.9339246, 2.676239, 0, 0.01568628, 1, 1,
0.4597653, 0.5492638, 1.965262, 0, 0.01176471, 1, 1,
0.4611583, -0.193399, 1.813715, 0, 0.003921569, 1, 1,
0.463568, 0.5445844, 0.7936057, 0.003921569, 0, 1, 1,
0.4646765, 0.9269527, -0.3467529, 0.007843138, 0, 1, 1,
0.4680728, 0.8297648, 2.208021, 0.01568628, 0, 1, 1,
0.4703827, 1.41414, -0.7522539, 0.01960784, 0, 1, 1,
0.4707982, 0.2949321, 2.617556, 0.02745098, 0, 1, 1,
0.4716554, -0.3309667, 2.646539, 0.03137255, 0, 1, 1,
0.4740205, -0.4330151, 1.779482, 0.03921569, 0, 1, 1,
0.4745225, -1.058467, 2.581427, 0.04313726, 0, 1, 1,
0.4789722, 0.4671443, 2.4643, 0.05098039, 0, 1, 1,
0.4813116, 1.115245, 0.4188669, 0.05490196, 0, 1, 1,
0.4819543, -1.185379, 2.461673, 0.0627451, 0, 1, 1,
0.482677, 0.6499829, 0.2820399, 0.06666667, 0, 1, 1,
0.4827395, 0.3487767, -0.3087454, 0.07450981, 0, 1, 1,
0.4872239, -0.6838891, 1.877201, 0.07843138, 0, 1, 1,
0.4872742, -1.416337, 2.3456, 0.08627451, 0, 1, 1,
0.4895951, 1.484524, 0.9213407, 0.09019608, 0, 1, 1,
0.4917281, -0.3715667, 3.326777, 0.09803922, 0, 1, 1,
0.4940287, 1.007495, 0.4150104, 0.1058824, 0, 1, 1,
0.4962573, -0.8098969, 4.801963, 0.1098039, 0, 1, 1,
0.4998135, 0.1608177, 1.511561, 0.1176471, 0, 1, 1,
0.5006645, -0.7227932, 2.771997, 0.1215686, 0, 1, 1,
0.5031902, -1.851424, 4.872035, 0.1294118, 0, 1, 1,
0.5043685, -1.169599, 3.291205, 0.1333333, 0, 1, 1,
0.5045094, -0.1241371, 3.029994, 0.1411765, 0, 1, 1,
0.5060332, 0.1308379, 2.648994, 0.145098, 0, 1, 1,
0.506927, 1.416743, 0.06707686, 0.1529412, 0, 1, 1,
0.5077221, -1.375246, 2.391717, 0.1568628, 0, 1, 1,
0.5098719, 0.8266398, -0.5051196, 0.1647059, 0, 1, 1,
0.5123442, 0.9762512, 1.061993, 0.1686275, 0, 1, 1,
0.5151682, -0.6344427, 2.869456, 0.1764706, 0, 1, 1,
0.5183924, -2.072967, 2.386518, 0.1803922, 0, 1, 1,
0.5246533, -1.035807, 4.672395, 0.1882353, 0, 1, 1,
0.526765, -1.633925, 3.859245, 0.1921569, 0, 1, 1,
0.5348822, -2.10692, 2.730659, 0.2, 0, 1, 1,
0.5349314, -1.794722, 0.1149424, 0.2078431, 0, 1, 1,
0.537657, 2.140876, 1.191312, 0.2117647, 0, 1, 1,
0.5405774, -0.9120261, 3.794099, 0.2196078, 0, 1, 1,
0.5416781, -0.6886762, 2.599073, 0.2235294, 0, 1, 1,
0.544516, 0.4222647, 0.3097381, 0.2313726, 0, 1, 1,
0.5459142, 1.124097, 1.656795, 0.2352941, 0, 1, 1,
0.5469688, 0.4783846, -0.01584701, 0.2431373, 0, 1, 1,
0.547585, 0.6204343, 1.857546, 0.2470588, 0, 1, 1,
0.5497399, -0.2816378, 1.538559, 0.254902, 0, 1, 1,
0.5500173, -2.559354, 3.031374, 0.2588235, 0, 1, 1,
0.5700226, -0.6117839, 3.39414, 0.2666667, 0, 1, 1,
0.5730973, -0.7973385, 3.350901, 0.2705882, 0, 1, 1,
0.5772607, 0.7362327, -0.2372763, 0.2784314, 0, 1, 1,
0.5829758, 0.4875141, 0.1362129, 0.282353, 0, 1, 1,
0.5832364, -0.3315345, 1.368531, 0.2901961, 0, 1, 1,
0.587703, 0.7196268, 0.118071, 0.2941177, 0, 1, 1,
0.5882994, 0.4824405, 0.8006921, 0.3019608, 0, 1, 1,
0.5986934, -0.2437999, -0.08873963, 0.3098039, 0, 1, 1,
0.6008577, -1.543676, 3.794978, 0.3137255, 0, 1, 1,
0.6016396, -0.1369424, 1.585919, 0.3215686, 0, 1, 1,
0.6054455, 0.1762284, 1.412656, 0.3254902, 0, 1, 1,
0.6148068, 0.09303588, 0.8591534, 0.3333333, 0, 1, 1,
0.6192869, -1.105787, 2.801928, 0.3372549, 0, 1, 1,
0.6200565, 0.405894, 0.7600495, 0.345098, 0, 1, 1,
0.6205583, -1.274388, 1.893475, 0.3490196, 0, 1, 1,
0.6289488, -1.240119, 2.415744, 0.3568628, 0, 1, 1,
0.6370183, 0.2795221, 2.317128, 0.3607843, 0, 1, 1,
0.6376666, -0.1463183, 2.13439, 0.3686275, 0, 1, 1,
0.638079, -1.762751, 3.526679, 0.372549, 0, 1, 1,
0.6411936, -0.201514, 2.301606, 0.3803922, 0, 1, 1,
0.6435357, 0.9019719, -0.2339589, 0.3843137, 0, 1, 1,
0.6442451, 0.3839636, 1.418067, 0.3921569, 0, 1, 1,
0.644845, 1.442828, 0.2688425, 0.3960784, 0, 1, 1,
0.6469108, 0.3799743, 0.3304584, 0.4039216, 0, 1, 1,
0.6476889, 0.5913506, 1.404916, 0.4117647, 0, 1, 1,
0.651949, 0.2198401, 2.41055, 0.4156863, 0, 1, 1,
0.6588581, 1.835949, -0.2028556, 0.4235294, 0, 1, 1,
0.6603088, -1.340682, 2.353992, 0.427451, 0, 1, 1,
0.6617879, -1.151781, 2.745805, 0.4352941, 0, 1, 1,
0.6672633, 0.04242728, 0.903424, 0.4392157, 0, 1, 1,
0.6700197, -0.1016818, 2.873416, 0.4470588, 0, 1, 1,
0.6717753, 1.021104, 0.9696969, 0.4509804, 0, 1, 1,
0.6770591, -0.7124711, 4.928325, 0.4588235, 0, 1, 1,
0.6782888, 1.408489, -1.363255, 0.4627451, 0, 1, 1,
0.6808293, 0.3691301, 0.8460035, 0.4705882, 0, 1, 1,
0.6844963, 0.0845544, 3.044445, 0.4745098, 0, 1, 1,
0.6893482, 0.6007858, 3.601993, 0.4823529, 0, 1, 1,
0.6949537, -0.5230072, 1.658925, 0.4862745, 0, 1, 1,
0.6962205, 0.4036464, 2.572017, 0.4941176, 0, 1, 1,
0.6992047, 1.110308, -0.6928343, 0.5019608, 0, 1, 1,
0.701069, 0.2218877, 1.695422, 0.5058824, 0, 1, 1,
0.7063218, 0.1309381, 0.5646059, 0.5137255, 0, 1, 1,
0.7063503, 0.1345373, 1.335927, 0.5176471, 0, 1, 1,
0.7101475, -0.4217901, 0.5145648, 0.5254902, 0, 1, 1,
0.7164713, 0.9983988, 0.3494769, 0.5294118, 0, 1, 1,
0.7175117, 0.1074283, 3.229926, 0.5372549, 0, 1, 1,
0.7211736, 0.7614602, 0.06527408, 0.5411765, 0, 1, 1,
0.7231299, -1.155715, 2.83626, 0.5490196, 0, 1, 1,
0.733094, 0.2000796, 2.879503, 0.5529412, 0, 1, 1,
0.7332683, 0.7239299, 1.762936, 0.5607843, 0, 1, 1,
0.7370228, 0.8005186, -0.2154773, 0.5647059, 0, 1, 1,
0.7387756, 0.9237256, -0.7538719, 0.572549, 0, 1, 1,
0.739996, -0.165482, 1.483897, 0.5764706, 0, 1, 1,
0.7400542, 0.8889989, 2.68885, 0.5843138, 0, 1, 1,
0.7447327, -0.5459397, 4.104274, 0.5882353, 0, 1, 1,
0.7449884, 1.260945, -0.543798, 0.5960785, 0, 1, 1,
0.7450083, 0.1098995, 0.3058665, 0.6039216, 0, 1, 1,
0.7490128, 0.3385181, 0.6553418, 0.6078432, 0, 1, 1,
0.7534028, 0.6199133, 1.543827, 0.6156863, 0, 1, 1,
0.7539928, 0.01595293, 2.147231, 0.6196079, 0, 1, 1,
0.7552531, -1.812854, 2.765799, 0.627451, 0, 1, 1,
0.7579801, -1.328014, 2.358306, 0.6313726, 0, 1, 1,
0.758096, 1.50627, 0.3720928, 0.6392157, 0, 1, 1,
0.7617419, -2.065483, 3.303648, 0.6431373, 0, 1, 1,
0.7625376, -0.1785033, 2.547614, 0.6509804, 0, 1, 1,
0.7707356, 0.6922365, 0.3223566, 0.654902, 0, 1, 1,
0.7730826, 0.05320153, 2.683423, 0.6627451, 0, 1, 1,
0.7745389, -1.639974, 4.62063, 0.6666667, 0, 1, 1,
0.7779268, 0.1303438, 1.785392, 0.6745098, 0, 1, 1,
0.7806856, -0.5813412, 3.207635, 0.6784314, 0, 1, 1,
0.7864966, 0.2198161, 1.092127, 0.6862745, 0, 1, 1,
0.7877135, -0.3522501, 1.999136, 0.6901961, 0, 1, 1,
0.7907551, 0.5756244, 1.268672, 0.6980392, 0, 1, 1,
0.7949464, -0.638581, 1.948895, 0.7058824, 0, 1, 1,
0.8024442, -1.260691, 2.334336, 0.7098039, 0, 1, 1,
0.8027381, 0.7888529, -0.785713, 0.7176471, 0, 1, 1,
0.8028772, 0.2566595, 0.7849665, 0.7215686, 0, 1, 1,
0.8115008, -0.8980482, 1.788113, 0.7294118, 0, 1, 1,
0.8142458, 1.293726, -0.5659483, 0.7333333, 0, 1, 1,
0.8144053, -0.2987523, 1.852131, 0.7411765, 0, 1, 1,
0.8184817, -0.853447, 3.626466, 0.7450981, 0, 1, 1,
0.8287284, 0.170836, 0.6115012, 0.7529412, 0, 1, 1,
0.8317208, 1.175762, -0.2081771, 0.7568628, 0, 1, 1,
0.8397108, 0.7412421, -0.1058616, 0.7647059, 0, 1, 1,
0.8452545, -1.217475, 3.778779, 0.7686275, 0, 1, 1,
0.8486412, -1.435448, 2.631631, 0.7764706, 0, 1, 1,
0.849602, 0.4931951, 2.150517, 0.7803922, 0, 1, 1,
0.8541518, -0.7664135, 2.300605, 0.7882353, 0, 1, 1,
0.8589395, 0.7475495, 0.8947601, 0.7921569, 0, 1, 1,
0.8619081, 0.7445062, 0.8223348, 0.8, 0, 1, 1,
0.8623471, -0.5256863, 0.8104281, 0.8078431, 0, 1, 1,
0.8658878, -0.3581946, 5.324304, 0.8117647, 0, 1, 1,
0.8661755, 0.8412724, 2.545817, 0.8196079, 0, 1, 1,
0.8740817, -0.2934884, 1.621892, 0.8235294, 0, 1, 1,
0.8756117, -0.9191595, 2.487471, 0.8313726, 0, 1, 1,
0.875652, -0.2551776, 1.601911, 0.8352941, 0, 1, 1,
0.8766065, 1.14006, 1.267303, 0.8431373, 0, 1, 1,
0.8873644, -1.159756, 1.928915, 0.8470588, 0, 1, 1,
0.8902292, 1.245558, 0.9217598, 0.854902, 0, 1, 1,
0.8916677, -0.4258066, 1.888454, 0.8588235, 0, 1, 1,
0.8991629, 1.38148, 0.7598751, 0.8666667, 0, 1, 1,
0.9050774, -0.2408615, 0.1953701, 0.8705882, 0, 1, 1,
0.9055102, -0.1754074, 2.455626, 0.8784314, 0, 1, 1,
0.9202527, -2.143325, 2.935426, 0.8823529, 0, 1, 1,
0.9248523, 0.3583296, 2.060819, 0.8901961, 0, 1, 1,
0.9262679, 0.100906, 1.225399, 0.8941177, 0, 1, 1,
0.9289354, 0.02089988, 0.3632872, 0.9019608, 0, 1, 1,
0.930407, 0.7552797, 0.537572, 0.9098039, 0, 1, 1,
0.9446248, -0.7783747, 2.80372, 0.9137255, 0, 1, 1,
0.9477401, 0.9612128, 0.7458436, 0.9215686, 0, 1, 1,
0.9526511, -0.5147642, 1.328838, 0.9254902, 0, 1, 1,
0.9531078, -1.50361, 2.996971, 0.9333333, 0, 1, 1,
0.9536117, 0.636728, -0.09721629, 0.9372549, 0, 1, 1,
0.9561834, -1.211913, 3.367228, 0.945098, 0, 1, 1,
0.9569339, 0.3321736, 2.330403, 0.9490196, 0, 1, 1,
0.9708275, -0.1405975, 2.957961, 0.9568627, 0, 1, 1,
0.9710099, 1.241137, 1.310289, 0.9607843, 0, 1, 1,
0.9825454, 1.716452, -0.2223093, 0.9686275, 0, 1, 1,
0.9864469, 1.110566, -0.1962265, 0.972549, 0, 1, 1,
0.9864746, -0.5303252, 1.139377, 0.9803922, 0, 1, 1,
0.9874793, 0.4698947, 2.10736, 0.9843137, 0, 1, 1,
0.9896187, 0.2442886, 2.108243, 0.9921569, 0, 1, 1,
0.9926732, -1.431409, 3.453016, 0.9960784, 0, 1, 1,
0.9962108, 0.3760404, 0.9500402, 1, 0, 0.9960784, 1,
0.9994002, 0.1254095, -0.4908155, 1, 0, 0.9882353, 1,
1.004717, -0.111424, 1.2478, 1, 0, 0.9843137, 1,
1.005317, 0.04166432, 0.4824473, 1, 0, 0.9764706, 1,
1.011423, 0.4128546, 2.513918, 1, 0, 0.972549, 1,
1.015187, -0.9573517, 3.098352, 1, 0, 0.9647059, 1,
1.015521, -0.3992305, 2.235507, 1, 0, 0.9607843, 1,
1.015674, 1.134964, -0.5849257, 1, 0, 0.9529412, 1,
1.030146, 0.4860471, 1.398284, 1, 0, 0.9490196, 1,
1.032249, -1.721603, 3.1499, 1, 0, 0.9411765, 1,
1.04818, -0.06204193, 2.030051, 1, 0, 0.9372549, 1,
1.050777, -0.2847614, 0.9230104, 1, 0, 0.9294118, 1,
1.057542, -0.8474999, 1.75833, 1, 0, 0.9254902, 1,
1.066708, 0.1992248, 0.7362049, 1, 0, 0.9176471, 1,
1.072488, -0.3957711, 1.641267, 1, 0, 0.9137255, 1,
1.079304, 2.550566, 0.6237389, 1, 0, 0.9058824, 1,
1.079901, -1.109466, 3.882011, 1, 0, 0.9019608, 1,
1.082651, -0.4734367, 2.461765, 1, 0, 0.8941177, 1,
1.083435, -0.02106869, 1.872329, 1, 0, 0.8862745, 1,
1.08374, -1.017545, 3.991597, 1, 0, 0.8823529, 1,
1.086883, 0.9035138, 1.575452, 1, 0, 0.8745098, 1,
1.093133, -0.2086177, 3.79142, 1, 0, 0.8705882, 1,
1.093312, 0.2835654, 1.618977, 1, 0, 0.8627451, 1,
1.106141, -0.6430274, 4.327973, 1, 0, 0.8588235, 1,
1.106795, -1.4543, 2.892415, 1, 0, 0.8509804, 1,
1.112805, 0.1770945, 1.351157, 1, 0, 0.8470588, 1,
1.113018, -1.666993, 2.665686, 1, 0, 0.8392157, 1,
1.118186, 0.3012788, 1.211006, 1, 0, 0.8352941, 1,
1.119347, -3.386572, 3.411525, 1, 0, 0.827451, 1,
1.120912, -0.5033329, 1.268328, 1, 0, 0.8235294, 1,
1.126686, -0.2817748, 2.328349, 1, 0, 0.8156863, 1,
1.127243, 1.476222, 0.7432203, 1, 0, 0.8117647, 1,
1.128917, -0.2766544, 0.7069384, 1, 0, 0.8039216, 1,
1.135253, 0.1720199, 1.577146, 1, 0, 0.7960784, 1,
1.148188, 0.8521782, 0.9377889, 1, 0, 0.7921569, 1,
1.155215, -0.1568065, 0.7637828, 1, 0, 0.7843137, 1,
1.155894, 1.202802, 1.592318, 1, 0, 0.7803922, 1,
1.161819, 0.1827171, 3.106889, 1, 0, 0.772549, 1,
1.169322, -0.7654653, 1.229217, 1, 0, 0.7686275, 1,
1.173152, 0.9335827, -0.4743758, 1, 0, 0.7607843, 1,
1.176587, -0.9092313, 3.338844, 1, 0, 0.7568628, 1,
1.191862, 0.06850991, 1.180633, 1, 0, 0.7490196, 1,
1.192665, -0.3154409, 1.905672, 1, 0, 0.7450981, 1,
1.193375, -0.1673191, 3.993307, 1, 0, 0.7372549, 1,
1.199562, -1.709423, 2.61955, 1, 0, 0.7333333, 1,
1.200685, -2.609685, 4.60828, 1, 0, 0.7254902, 1,
1.201137, -1.618919, 1.558877, 1, 0, 0.7215686, 1,
1.203646, -0.0498434, 1.12278, 1, 0, 0.7137255, 1,
1.206792, 0.3640028, 2.398989, 1, 0, 0.7098039, 1,
1.210927, 0.06845661, 0.3983761, 1, 0, 0.7019608, 1,
1.211822, -0.4411405, 0.2827946, 1, 0, 0.6941177, 1,
1.213108, 0.9506494, 0.5385071, 1, 0, 0.6901961, 1,
1.230744, -0.3586304, 0.6293909, 1, 0, 0.682353, 1,
1.242461, 0.3829229, 0.1480626, 1, 0, 0.6784314, 1,
1.24564, -0.3411424, 2.308794, 1, 0, 0.6705883, 1,
1.258855, 1.313664, 0.0970832, 1, 0, 0.6666667, 1,
1.260975, 0.2560935, 1.095345, 1, 0, 0.6588235, 1,
1.269648, -0.07196495, 2.599898, 1, 0, 0.654902, 1,
1.276633, -0.1552056, 2.000611, 1, 0, 0.6470588, 1,
1.279834, -1.069076, 4.153305, 1, 0, 0.6431373, 1,
1.284158, -1.367525, 2.436011, 1, 0, 0.6352941, 1,
1.286564, 1.386215, 1.329597, 1, 0, 0.6313726, 1,
1.291079, -0.9807613, 1.583735, 1, 0, 0.6235294, 1,
1.291452, -0.7177387, 3.744814, 1, 0, 0.6196079, 1,
1.29323, -2.247553, 3.337078, 1, 0, 0.6117647, 1,
1.295453, -0.4456894, 0.671475, 1, 0, 0.6078432, 1,
1.298645, -0.2706051, 2.32394, 1, 0, 0.6, 1,
1.30416, -1.23745, 3.883851, 1, 0, 0.5921569, 1,
1.3098, 1.833609, 1.375397, 1, 0, 0.5882353, 1,
1.315604, -1.20407, 1.465665, 1, 0, 0.5803922, 1,
1.332742, -0.1538294, 0.945267, 1, 0, 0.5764706, 1,
1.33296, -0.5495099, 2.362984, 1, 0, 0.5686275, 1,
1.359958, -0.1864451, 3.131745, 1, 0, 0.5647059, 1,
1.361917, 1.047081, 0.2215519, 1, 0, 0.5568628, 1,
1.364364, -1.994169, 0.5901174, 1, 0, 0.5529412, 1,
1.364415, 0.4927617, -1.616401, 1, 0, 0.5450981, 1,
1.375024, 0.7136348, -0.2736035, 1, 0, 0.5411765, 1,
1.375907, -0.7929911, 1.481289, 1, 0, 0.5333334, 1,
1.381339, 0.6199719, 0.6234503, 1, 0, 0.5294118, 1,
1.384398, -1.644581, 3.098384, 1, 0, 0.5215687, 1,
1.391324, -1.157658, 1.584321, 1, 0, 0.5176471, 1,
1.39738, -0.08544825, 1.718028, 1, 0, 0.509804, 1,
1.411664, -0.3668552, 2.419177, 1, 0, 0.5058824, 1,
1.422637, 0.667044, -0.1290655, 1, 0, 0.4980392, 1,
1.431037, 0.3563949, 0.635317, 1, 0, 0.4901961, 1,
1.432846, 0.6223235, 2.105321, 1, 0, 0.4862745, 1,
1.436538, -0.8623317, 3.25506, 1, 0, 0.4784314, 1,
1.437394, 0.5929859, 2.305944, 1, 0, 0.4745098, 1,
1.444484, 0.9453062, 2.311971, 1, 0, 0.4666667, 1,
1.446123, -0.3960183, 1.837046, 1, 0, 0.4627451, 1,
1.446129, -0.7296353, 2.485074, 1, 0, 0.454902, 1,
1.452538, 0.7182209, 1.543115, 1, 0, 0.4509804, 1,
1.453726, 1.392566, -0.717784, 1, 0, 0.4431373, 1,
1.482814, 0.3971249, 1.871932, 1, 0, 0.4392157, 1,
1.48835, 0.5878837, 1.101308, 1, 0, 0.4313726, 1,
1.493357, 0.8778738, 1.599334, 1, 0, 0.427451, 1,
1.502119, -0.5129614, 0.4313184, 1, 0, 0.4196078, 1,
1.502221, 0.0685176, 0.8310075, 1, 0, 0.4156863, 1,
1.509881, 2.048532, 2.190167, 1, 0, 0.4078431, 1,
1.525124, -1.973283, 2.541998, 1, 0, 0.4039216, 1,
1.53388, -0.2468391, 3.801705, 1, 0, 0.3960784, 1,
1.536057, 0.7962831, 0.1027407, 1, 0, 0.3882353, 1,
1.545476, 0.1028931, 0.7567112, 1, 0, 0.3843137, 1,
1.554605, 1.411698, 0.6448995, 1, 0, 0.3764706, 1,
1.568315, -1.305512, 2.983211, 1, 0, 0.372549, 1,
1.570341, 1.251633, -0.319086, 1, 0, 0.3647059, 1,
1.576362, 0.4587924, -0.1767594, 1, 0, 0.3607843, 1,
1.579962, -0.8869259, 1.517774, 1, 0, 0.3529412, 1,
1.603229, -0.2204906, 1.614677, 1, 0, 0.3490196, 1,
1.603276, -0.1686081, 0.4242604, 1, 0, 0.3411765, 1,
1.607131, 1.903135, 0.5250252, 1, 0, 0.3372549, 1,
1.611333, 1.380008, 1.477345, 1, 0, 0.3294118, 1,
1.614804, -0.4482872, 0.8901542, 1, 0, 0.3254902, 1,
1.619837, 1.173135, 2.153556, 1, 0, 0.3176471, 1,
1.625888, -0.1284718, 0.2620486, 1, 0, 0.3137255, 1,
1.628271, -0.283153, 1.19147, 1, 0, 0.3058824, 1,
1.632152, -0.9954197, 1.843284, 1, 0, 0.2980392, 1,
1.650949, 0.6032127, 1.403151, 1, 0, 0.2941177, 1,
1.651572, -0.3050323, 2.351033, 1, 0, 0.2862745, 1,
1.656791, -0.3088053, -0.5166656, 1, 0, 0.282353, 1,
1.658174, -0.2877927, 0.657988, 1, 0, 0.2745098, 1,
1.660826, -1.096362, 1.943885, 1, 0, 0.2705882, 1,
1.667696, 0.4015314, 1.62994, 1, 0, 0.2627451, 1,
1.720508, 2.940355, -0.07629173, 1, 0, 0.2588235, 1,
1.72443, -1.959596, 3.288718, 1, 0, 0.2509804, 1,
1.763892, -1.480594, -0.2203448, 1, 0, 0.2470588, 1,
1.774073, -0.6795841, 1.252811, 1, 0, 0.2392157, 1,
1.780317, 0.7525441, 1.514867, 1, 0, 0.2352941, 1,
1.785446, 0.6925676, 1.736769, 1, 0, 0.227451, 1,
1.7866, 0.6109076, 0.6982374, 1, 0, 0.2235294, 1,
1.797274, 0.6405187, -0.9619399, 1, 0, 0.2156863, 1,
1.805038, -0.03510808, 1.138826, 1, 0, 0.2117647, 1,
1.829641, 1.391043, 0.8976147, 1, 0, 0.2039216, 1,
1.843247, 1.676195, 0.4504477, 1, 0, 0.1960784, 1,
1.84625, 0.1084392, -0.197152, 1, 0, 0.1921569, 1,
1.866197, 2.705695, 0.1291159, 1, 0, 0.1843137, 1,
1.876876, 0.2509144, 0.6879352, 1, 0, 0.1803922, 1,
1.894446, 0.6345588, 2.581079, 1, 0, 0.172549, 1,
1.903455, -0.2180574, 1.235152, 1, 0, 0.1686275, 1,
1.916301, 1.132649, 1.7762, 1, 0, 0.1607843, 1,
1.924614, 0.839902, 2.357733, 1, 0, 0.1568628, 1,
1.925701, -0.7201173, 4.135426, 1, 0, 0.1490196, 1,
1.930542, 1.255789, 2.037048, 1, 0, 0.145098, 1,
1.967572, 0.5790489, 1.220149, 1, 0, 0.1372549, 1,
1.976628, 0.1780891, 1.592697, 1, 0, 0.1333333, 1,
2.005181, -0.6294039, 3.267846, 1, 0, 0.1254902, 1,
2.056533, 0.1300108, 2.146401, 1, 0, 0.1215686, 1,
2.151532, 0.5092667, 1.666229, 1, 0, 0.1137255, 1,
2.169141, -1.62606, 3.723439, 1, 0, 0.1098039, 1,
2.203941, 0.1971648, 2.191801, 1, 0, 0.1019608, 1,
2.233186, 1.368583, -0.5472379, 1, 0, 0.09411765, 1,
2.255311, 2.521067, 0.6479747, 1, 0, 0.09019608, 1,
2.28367, -0.7981407, 3.654799, 1, 0, 0.08235294, 1,
2.319606, -0.2524126, 2.132336, 1, 0, 0.07843138, 1,
2.369625, -1.984001, 2.734448, 1, 0, 0.07058824, 1,
2.406966, 0.1749189, -0.01675062, 1, 0, 0.06666667, 1,
2.423852, -0.5409407, 3.185084, 1, 0, 0.05882353, 1,
2.428608, 0.9219982, 1.968339, 1, 0, 0.05490196, 1,
2.525677, 1.203089, 2.342814, 1, 0, 0.04705882, 1,
2.553244, 0.1796089, 0.9806146, 1, 0, 0.04313726, 1,
2.577108, -1.648303, 1.671395, 1, 0, 0.03529412, 1,
2.657003, 0.8106567, 0.3117292, 1, 0, 0.03137255, 1,
2.67088, -0.7031143, 2.08935, 1, 0, 0.02352941, 1,
2.729753, -0.3780187, 1.071128, 1, 0, 0.01960784, 1,
3.054075, -0.582889, 1.827188, 1, 0, 0.01176471, 1,
3.389023, 0.01990433, 0.2872008, 1, 0, 0.007843138, 1
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
0.0146749, -4.467929, -7.268311, 0, -0.5, 0.5, 0.5,
0.0146749, -4.467929, -7.268311, 1, -0.5, 0.5, 0.5,
0.0146749, -4.467929, -7.268311, 1, 1.5, 0.5, 0.5,
0.0146749, -4.467929, -7.268311, 0, 1.5, 0.5, 0.5
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
-4.503577, -0.1967279, -7.268311, 0, -0.5, 0.5, 0.5,
-4.503577, -0.1967279, -7.268311, 1, -0.5, 0.5, 0.5,
-4.503577, -0.1967279, -7.268311, 1, 1.5, 0.5, 0.5,
-4.503577, -0.1967279, -7.268311, 0, 1.5, 0.5, 0.5
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
-4.503577, -4.467929, -0.05945635, 0, -0.5, 0.5, 0.5,
-4.503577, -4.467929, -0.05945635, 1, -0.5, 0.5, 0.5,
-4.503577, -4.467929, -0.05945635, 1, 1.5, 0.5, 0.5,
-4.503577, -4.467929, -0.05945635, 0, 1.5, 0.5, 0.5
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
-3, -3.482267, -5.604729,
3, -3.482267, -5.604729,
-3, -3.482267, -5.604729,
-3, -3.646544, -5.881993,
-2, -3.482267, -5.604729,
-2, -3.646544, -5.881993,
-1, -3.482267, -5.604729,
-1, -3.646544, -5.881993,
0, -3.482267, -5.604729,
0, -3.646544, -5.881993,
1, -3.482267, -5.604729,
1, -3.646544, -5.881993,
2, -3.482267, -5.604729,
2, -3.646544, -5.881993,
3, -3.482267, -5.604729,
3, -3.646544, -5.881993
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
-3, -3.975098, -6.43652, 0, -0.5, 0.5, 0.5,
-3, -3.975098, -6.43652, 1, -0.5, 0.5, 0.5,
-3, -3.975098, -6.43652, 1, 1.5, 0.5, 0.5,
-3, -3.975098, -6.43652, 0, 1.5, 0.5, 0.5,
-2, -3.975098, -6.43652, 0, -0.5, 0.5, 0.5,
-2, -3.975098, -6.43652, 1, -0.5, 0.5, 0.5,
-2, -3.975098, -6.43652, 1, 1.5, 0.5, 0.5,
-2, -3.975098, -6.43652, 0, 1.5, 0.5, 0.5,
-1, -3.975098, -6.43652, 0, -0.5, 0.5, 0.5,
-1, -3.975098, -6.43652, 1, -0.5, 0.5, 0.5,
-1, -3.975098, -6.43652, 1, 1.5, 0.5, 0.5,
-1, -3.975098, -6.43652, 0, 1.5, 0.5, 0.5,
0, -3.975098, -6.43652, 0, -0.5, 0.5, 0.5,
0, -3.975098, -6.43652, 1, -0.5, 0.5, 0.5,
0, -3.975098, -6.43652, 1, 1.5, 0.5, 0.5,
0, -3.975098, -6.43652, 0, 1.5, 0.5, 0.5,
1, -3.975098, -6.43652, 0, -0.5, 0.5, 0.5,
1, -3.975098, -6.43652, 1, -0.5, 0.5, 0.5,
1, -3.975098, -6.43652, 1, 1.5, 0.5, 0.5,
1, -3.975098, -6.43652, 0, 1.5, 0.5, 0.5,
2, -3.975098, -6.43652, 0, -0.5, 0.5, 0.5,
2, -3.975098, -6.43652, 1, -0.5, 0.5, 0.5,
2, -3.975098, -6.43652, 1, 1.5, 0.5, 0.5,
2, -3.975098, -6.43652, 0, 1.5, 0.5, 0.5,
3, -3.975098, -6.43652, 0, -0.5, 0.5, 0.5,
3, -3.975098, -6.43652, 1, -0.5, 0.5, 0.5,
3, -3.975098, -6.43652, 1, 1.5, 0.5, 0.5,
3, -3.975098, -6.43652, 0, 1.5, 0.5, 0.5
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
-3.460904, -3, -5.604729,
-3.460904, 2, -5.604729,
-3.460904, -3, -5.604729,
-3.634683, -3, -5.881993,
-3.460904, -2, -5.604729,
-3.634683, -2, -5.881993,
-3.460904, -1, -5.604729,
-3.634683, -1, -5.881993,
-3.460904, 0, -5.604729,
-3.634683, 0, -5.881993,
-3.460904, 1, -5.604729,
-3.634683, 1, -5.881993,
-3.460904, 2, -5.604729,
-3.634683, 2, -5.881993
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
-3.98224, -3, -6.43652, 0, -0.5, 0.5, 0.5,
-3.98224, -3, -6.43652, 1, -0.5, 0.5, 0.5,
-3.98224, -3, -6.43652, 1, 1.5, 0.5, 0.5,
-3.98224, -3, -6.43652, 0, 1.5, 0.5, 0.5,
-3.98224, -2, -6.43652, 0, -0.5, 0.5, 0.5,
-3.98224, -2, -6.43652, 1, -0.5, 0.5, 0.5,
-3.98224, -2, -6.43652, 1, 1.5, 0.5, 0.5,
-3.98224, -2, -6.43652, 0, 1.5, 0.5, 0.5,
-3.98224, -1, -6.43652, 0, -0.5, 0.5, 0.5,
-3.98224, -1, -6.43652, 1, -0.5, 0.5, 0.5,
-3.98224, -1, -6.43652, 1, 1.5, 0.5, 0.5,
-3.98224, -1, -6.43652, 0, 1.5, 0.5, 0.5,
-3.98224, 0, -6.43652, 0, -0.5, 0.5, 0.5,
-3.98224, 0, -6.43652, 1, -0.5, 0.5, 0.5,
-3.98224, 0, -6.43652, 1, 1.5, 0.5, 0.5,
-3.98224, 0, -6.43652, 0, 1.5, 0.5, 0.5,
-3.98224, 1, -6.43652, 0, -0.5, 0.5, 0.5,
-3.98224, 1, -6.43652, 1, -0.5, 0.5, 0.5,
-3.98224, 1, -6.43652, 1, 1.5, 0.5, 0.5,
-3.98224, 1, -6.43652, 0, 1.5, 0.5, 0.5,
-3.98224, 2, -6.43652, 0, -0.5, 0.5, 0.5,
-3.98224, 2, -6.43652, 1, -0.5, 0.5, 0.5,
-3.98224, 2, -6.43652, 1, 1.5, 0.5, 0.5,
-3.98224, 2, -6.43652, 0, 1.5, 0.5, 0.5
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
-3.460904, -3.482267, -4,
-3.460904, -3.482267, 4,
-3.460904, -3.482267, -4,
-3.634683, -3.646544, -4,
-3.460904, -3.482267, -2,
-3.634683, -3.646544, -2,
-3.460904, -3.482267, 0,
-3.634683, -3.646544, 0,
-3.460904, -3.482267, 2,
-3.634683, -3.646544, 2,
-3.460904, -3.482267, 4,
-3.634683, -3.646544, 4
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
-3.98224, -3.975098, -4, 0, -0.5, 0.5, 0.5,
-3.98224, -3.975098, -4, 1, -0.5, 0.5, 0.5,
-3.98224, -3.975098, -4, 1, 1.5, 0.5, 0.5,
-3.98224, -3.975098, -4, 0, 1.5, 0.5, 0.5,
-3.98224, -3.975098, -2, 0, -0.5, 0.5, 0.5,
-3.98224, -3.975098, -2, 1, -0.5, 0.5, 0.5,
-3.98224, -3.975098, -2, 1, 1.5, 0.5, 0.5,
-3.98224, -3.975098, -2, 0, 1.5, 0.5, 0.5,
-3.98224, -3.975098, 0, 0, -0.5, 0.5, 0.5,
-3.98224, -3.975098, 0, 1, -0.5, 0.5, 0.5,
-3.98224, -3.975098, 0, 1, 1.5, 0.5, 0.5,
-3.98224, -3.975098, 0, 0, 1.5, 0.5, 0.5,
-3.98224, -3.975098, 2, 0, -0.5, 0.5, 0.5,
-3.98224, -3.975098, 2, 1, -0.5, 0.5, 0.5,
-3.98224, -3.975098, 2, 1, 1.5, 0.5, 0.5,
-3.98224, -3.975098, 2, 0, 1.5, 0.5, 0.5,
-3.98224, -3.975098, 4, 0, -0.5, 0.5, 0.5,
-3.98224, -3.975098, 4, 1, -0.5, 0.5, 0.5,
-3.98224, -3.975098, 4, 1, 1.5, 0.5, 0.5,
-3.98224, -3.975098, 4, 0, 1.5, 0.5, 0.5
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
-3.460904, -3.482267, -5.604729,
-3.460904, 3.088811, -5.604729,
-3.460904, -3.482267, 5.485816,
-3.460904, 3.088811, 5.485816,
-3.460904, -3.482267, -5.604729,
-3.460904, -3.482267, 5.485816,
-3.460904, 3.088811, -5.604729,
-3.460904, 3.088811, 5.485816,
-3.460904, -3.482267, -5.604729,
3.490253, -3.482267, -5.604729,
-3.460904, -3.482267, 5.485816,
3.490253, -3.482267, 5.485816,
-3.460904, 3.088811, -5.604729,
3.490253, 3.088811, -5.604729,
-3.460904, 3.088811, 5.485816,
3.490253, 3.088811, 5.485816,
3.490253, -3.482267, -5.604729,
3.490253, 3.088811, -5.604729,
3.490253, -3.482267, 5.485816,
3.490253, 3.088811, 5.485816,
3.490253, -3.482267, -5.604729,
3.490253, -3.482267, 5.485816,
3.490253, 3.088811, -5.604729,
3.490253, 3.088811, 5.485816
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
var radius = 7.820544;
var distance = 34.79448;
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
mvMatrix.translate( -0.0146749, 0.1967279, 0.05945635 );
mvMatrix.scale( 1.216449, 1.286809, 0.7624264 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79448);
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
Propargite<-read.table("Propargite.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propargite$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propargite' not found
```

```r
y<-Propargite$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propargite' not found
```

```r
z<-Propargite$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propargite' not found
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
-3.359673, -1.494353, -2.750339, 0, 0, 1, 1, 1,
-3.025973, 0.5664746, -1.854036, 1, 0, 0, 1, 1,
-2.891145, 1.414236, -1.37225, 1, 0, 0, 1, 1,
-2.707162, -0.1502583, -1.444537, 1, 0, 0, 1, 1,
-2.64212, 0.8168585, -1.304937, 1, 0, 0, 1, 1,
-2.638311, -0.5472698, -0.9588985, 1, 0, 0, 1, 1,
-2.62712, -0.7532899, -2.46121, 0, 0, 0, 1, 1,
-2.54126, -2.861995, -1.46843, 0, 0, 0, 1, 1,
-2.523806, -1.023785, -2.118031, 0, 0, 0, 1, 1,
-2.517424, 1.382832, -3.218985, 0, 0, 0, 1, 1,
-2.500277, 0.101401, -0.77856, 0, 0, 0, 1, 1,
-2.39555, -0.3250009, -1.075631, 0, 0, 0, 1, 1,
-2.371035, -0.334618, -2.398888, 0, 0, 0, 1, 1,
-2.306186, 1.204046, -0.5796669, 1, 1, 1, 1, 1,
-2.184027, -0.1592933, -1.432657, 1, 1, 1, 1, 1,
-2.176598, -1.023046, -3.015369, 1, 1, 1, 1, 1,
-2.156639, 0.4996814, -1.237955, 1, 1, 1, 1, 1,
-2.131868, -2.097922, -0.6530483, 1, 1, 1, 1, 1,
-2.09352, 1.679159, 0.6522968, 1, 1, 1, 1, 1,
-2.077772, -2.380372, -0.6215307, 1, 1, 1, 1, 1,
-2.07758, 0.04407448, -0.07988067, 1, 1, 1, 1, 1,
-1.987198, -0.1384005, -0.7351295, 1, 1, 1, 1, 1,
-1.985509, -0.3375682, -1.494924, 1, 1, 1, 1, 1,
-1.971154, 0.1664656, -1.285432, 1, 1, 1, 1, 1,
-1.963655, 0.4717929, -1.322882, 1, 1, 1, 1, 1,
-1.959181, -1.065008, -1.250874, 1, 1, 1, 1, 1,
-1.910848, 0.8471907, -0.2624542, 1, 1, 1, 1, 1,
-1.899143, -0.1726324, -2.721473, 1, 1, 1, 1, 1,
-1.897498, 0.1418026, -0.9342556, 0, 0, 1, 1, 1,
-1.895923, -2.062914, -2.826248, 1, 0, 0, 1, 1,
-1.8479, -0.8360533, -1.942448, 1, 0, 0, 1, 1,
-1.828565, 1.220436, -0.4985619, 1, 0, 0, 1, 1,
-1.816675, -0.992226, -3.609278, 1, 0, 0, 1, 1,
-1.813866, -0.3344703, -1.074275, 1, 0, 0, 1, 1,
-1.794204, 0.5239893, -2.903872, 0, 0, 0, 1, 1,
-1.746846, 1.442843, -0.8825563, 0, 0, 0, 1, 1,
-1.737692, 0.5478323, -3.451536, 0, 0, 0, 1, 1,
-1.736897, -0.777952, -0.7608501, 0, 0, 0, 1, 1,
-1.728332, 0.5497385, 0.008356071, 0, 0, 0, 1, 1,
-1.723455, 0.3113934, -2.615118, 0, 0, 0, 1, 1,
-1.702588, 1.292298, -0.08623819, 0, 0, 0, 1, 1,
-1.699167, -0.991583, -2.584615, 1, 1, 1, 1, 1,
-1.697073, 1.17933, -0.9270155, 1, 1, 1, 1, 1,
-1.686639, 0.5015133, -3.466081, 1, 1, 1, 1, 1,
-1.677012, -1.469244, 0.5743821, 1, 1, 1, 1, 1,
-1.668445, -0.5959368, -2.716274, 1, 1, 1, 1, 1,
-1.661047, -0.6338394, -1.412629, 1, 1, 1, 1, 1,
-1.660545, -0.3230549, -1.216755, 1, 1, 1, 1, 1,
-1.658399, -0.03559718, -0.9806293, 1, 1, 1, 1, 1,
-1.656711, 2.652333, -1.37332, 1, 1, 1, 1, 1,
-1.635666, -0.5879292, -1.825312, 1, 1, 1, 1, 1,
-1.627652, -0.4493558, -0.4772659, 1, 1, 1, 1, 1,
-1.593601, -0.1403748, -3.495788, 1, 1, 1, 1, 1,
-1.562442, -0.605855, -2.777523, 1, 1, 1, 1, 1,
-1.551202, -1.647281, -1.807556, 1, 1, 1, 1, 1,
-1.550865, 1.243448, 0.4602236, 1, 1, 1, 1, 1,
-1.540084, 2.10578, -1.152989, 0, 0, 1, 1, 1,
-1.539155, -1.384274, -3.078876, 1, 0, 0, 1, 1,
-1.535196, -0.6502832, -1.6666, 1, 0, 0, 1, 1,
-1.52877, 0.086073, 0.7493569, 1, 0, 0, 1, 1,
-1.522849, 1.282407, -1.85163, 1, 0, 0, 1, 1,
-1.518823, 0.6965132, -1.992645, 1, 0, 0, 1, 1,
-1.513935, 0.6767628, -0.2005959, 0, 0, 0, 1, 1,
-1.498806, -0.5992368, -2.207407, 0, 0, 0, 1, 1,
-1.491389, 0.04336387, -1.309019, 0, 0, 0, 1, 1,
-1.490476, -1.378345, -2.408119, 0, 0, 0, 1, 1,
-1.488939, -0.5041303, -1.540421, 0, 0, 0, 1, 1,
-1.481993, -0.1144776, -0.5002578, 0, 0, 0, 1, 1,
-1.463367, 1.162597, -0.2823918, 0, 0, 0, 1, 1,
-1.462031, -0.5942873, -1.620202, 1, 1, 1, 1, 1,
-1.447223, -1.574275, -1.820634, 1, 1, 1, 1, 1,
-1.446144, 1.023553, -0.7729828, 1, 1, 1, 1, 1,
-1.445729, -1.036759, -2.753467, 1, 1, 1, 1, 1,
-1.4337, 0.3833219, -1.162095, 1, 1, 1, 1, 1,
-1.426111, -0.3897551, 0.2163332, 1, 1, 1, 1, 1,
-1.426047, -0.1914152, 0.09863807, 1, 1, 1, 1, 1,
-1.425929, -0.5479178, -0.6921398, 1, 1, 1, 1, 1,
-1.414033, 0.1959775, -1.896419, 1, 1, 1, 1, 1,
-1.409403, 0.3558891, -1.325621, 1, 1, 1, 1, 1,
-1.403548, -0.3294353, -2.372239, 1, 1, 1, 1, 1,
-1.400681, -1.040954, -2.395979, 1, 1, 1, 1, 1,
-1.38116, -1.348853, -2.198702, 1, 1, 1, 1, 1,
-1.378573, -0.6418225, -1.237045, 1, 1, 1, 1, 1,
-1.358587, 0.4348137, -3.459505, 1, 1, 1, 1, 1,
-1.357217, 0.7534285, -0.8112347, 0, 0, 1, 1, 1,
-1.354001, 1.300529, 0.825646, 1, 0, 0, 1, 1,
-1.34441, 1.029059, -0.03177138, 1, 0, 0, 1, 1,
-1.335216, 0.9150369, -0.1138234, 1, 0, 0, 1, 1,
-1.326289, -0.5040914, -0.9133682, 1, 0, 0, 1, 1,
-1.325031, 1.312726, -1.867102, 1, 0, 0, 1, 1,
-1.324837, -1.393665, -1.758004, 0, 0, 0, 1, 1,
-1.323156, 1.020169, -0.9638235, 0, 0, 0, 1, 1,
-1.315792, 0.4687746, 1.554888, 0, 0, 0, 1, 1,
-1.30598, -1.087274, -2.284521, 0, 0, 0, 1, 1,
-1.300263, -0.534406, -1.839434, 0, 0, 0, 1, 1,
-1.289585, -0.6813263, -3.825125, 0, 0, 0, 1, 1,
-1.289087, 0.269261, -2.647267, 0, 0, 0, 1, 1,
-1.277072, -1.227137, -1.915696, 1, 1, 1, 1, 1,
-1.263072, 0.280924, -0.458885, 1, 1, 1, 1, 1,
-1.255212, 0.03069553, -0.2049016, 1, 1, 1, 1, 1,
-1.25137, -0.2080823, -2.375951, 1, 1, 1, 1, 1,
-1.246313, -0.2062127, -3.767203, 1, 1, 1, 1, 1,
-1.229607, 0.9579523, -2.058307, 1, 1, 1, 1, 1,
-1.227789, -0.709456, -3.648987, 1, 1, 1, 1, 1,
-1.224382, -2.199893, -2.918942, 1, 1, 1, 1, 1,
-1.204999, -1.642738, -1.992634, 1, 1, 1, 1, 1,
-1.204678, -0.7236363, -2.389592, 1, 1, 1, 1, 1,
-1.200139, 0.4901704, -0.7718047, 1, 1, 1, 1, 1,
-1.195232, -0.5741624, -1.442024, 1, 1, 1, 1, 1,
-1.194412, 0.06483062, -2.43372, 1, 1, 1, 1, 1,
-1.194085, 0.447979, -0.1814922, 1, 1, 1, 1, 1,
-1.183981, -2.236375, -1.8161, 1, 1, 1, 1, 1,
-1.181231, -0.162357, -1.165895, 0, 0, 1, 1, 1,
-1.171292, 0.8238667, -1.197698, 1, 0, 0, 1, 1,
-1.170823, 0.2774041, -1.021078, 1, 0, 0, 1, 1,
-1.165149, 0.7566512, -0.3834147, 1, 0, 0, 1, 1,
-1.164765, -1.483457, -3.485231, 1, 0, 0, 1, 1,
-1.146966, 0.5106363, 0.639012, 1, 0, 0, 1, 1,
-1.145515, 0.3722649, -2.386489, 0, 0, 0, 1, 1,
-1.136604, -0.7631103, -3.211822, 0, 0, 0, 1, 1,
-1.136109, 0.2240786, -2.303704, 0, 0, 0, 1, 1,
-1.13221, 1.746036, 0.2083646, 0, 0, 0, 1, 1,
-1.120675, 0.7302905, -0.7803728, 0, 0, 0, 1, 1,
-1.115149, 0.7209525, -1.882589, 0, 0, 0, 1, 1,
-1.113522, -0.8593848, -2.726946, 0, 0, 0, 1, 1,
-1.10689, 0.221262, -2.405799, 1, 1, 1, 1, 1,
-1.103413, -0.3210827, -1.316623, 1, 1, 1, 1, 1,
-1.09922, -0.6920247, -4.550846, 1, 1, 1, 1, 1,
-1.095201, 1.593376, 0.4992945, 1, 1, 1, 1, 1,
-1.093781, -0.4486287, -0.4623331, 1, 1, 1, 1, 1,
-1.084552, 0.3716457, -1.664773, 1, 1, 1, 1, 1,
-1.078283, 0.3025679, 0.7233537, 1, 1, 1, 1, 1,
-1.070234, 0.6787265, -0.5397186, 1, 1, 1, 1, 1,
-1.059681, -0.5141618, -2.392027, 1, 1, 1, 1, 1,
-1.054274, 1.088723, -0.09530659, 1, 1, 1, 1, 1,
-1.03405, -0.05866845, -2.219463, 1, 1, 1, 1, 1,
-1.030235, 0.797111, -0.4815049, 1, 1, 1, 1, 1,
-1.02638, -0.2167291, -1.865541, 1, 1, 1, 1, 1,
-1.024062, -0.5718138, -2.654185, 1, 1, 1, 1, 1,
-1.022954, -2.033262, -2.904541, 1, 1, 1, 1, 1,
-1.021457, 1.329827, 0.7160991, 0, 0, 1, 1, 1,
-1.018655, -1.408564, -2.934701, 1, 0, 0, 1, 1,
-1.007417, 0.4526822, -1.236226, 1, 0, 0, 1, 1,
-1.006792, 0.5055782, -1.325799, 1, 0, 0, 1, 1,
-1.00312, 0.004573829, -2.84407, 1, 0, 0, 1, 1,
-1.00187, -1.151149, -2.996351, 1, 0, 0, 1, 1,
-0.9923465, -0.6557719, -2.42419, 0, 0, 0, 1, 1,
-0.9915304, -0.8444193, -0.228168, 0, 0, 0, 1, 1,
-0.9880844, 1.937912, -1.879952, 0, 0, 0, 1, 1,
-0.9861901, -0.2872134, -2.032001, 0, 0, 0, 1, 1,
-0.9709058, -0.912361, -3.367465, 0, 0, 0, 1, 1,
-0.9692182, 1.128134, -1.954247, 0, 0, 0, 1, 1,
-0.9669693, 0.3828077, -0.9508517, 0, 0, 0, 1, 1,
-0.9661838, -2.24811, -3.019264, 1, 1, 1, 1, 1,
-0.9611744, -0.6067345, -3.03817, 1, 1, 1, 1, 1,
-0.9608349, -0.8723763, -2.541623, 1, 1, 1, 1, 1,
-0.9504437, 0.5756648, -1.691956, 1, 1, 1, 1, 1,
-0.9477286, 0.6253892, 0.2541523, 1, 1, 1, 1, 1,
-0.942064, -0.8844407, -1.867707, 1, 1, 1, 1, 1,
-0.93699, -0.7364413, -1.356841, 1, 1, 1, 1, 1,
-0.9351367, -0.09009801, -2.343772, 1, 1, 1, 1, 1,
-0.934581, -0.09869703, -3.514009, 1, 1, 1, 1, 1,
-0.9321871, 0.9173975, -0.983799, 1, 1, 1, 1, 1,
-0.9309166, 0.7261318, -0.6167428, 1, 1, 1, 1, 1,
-0.9265819, 1.504327, 0.8746671, 1, 1, 1, 1, 1,
-0.9185137, 1.280371, -1.249012, 1, 1, 1, 1, 1,
-0.9133366, 0.2338144, 1.237766, 1, 1, 1, 1, 1,
-0.9012718, -1.075228, -1.775498, 1, 1, 1, 1, 1,
-0.9005196, -1.27367, -3.724339, 0, 0, 1, 1, 1,
-0.891986, -0.2632439, -3.190105, 1, 0, 0, 1, 1,
-0.8873863, 0.6820241, -0.274532, 1, 0, 0, 1, 1,
-0.8842183, 0.8371193, 2.099756, 1, 0, 0, 1, 1,
-0.8827762, 0.3381437, -2.939701, 1, 0, 0, 1, 1,
-0.8804393, 0.3209, -1.873813, 1, 0, 0, 1, 1,
-0.8768651, 0.5711639, 0.3611677, 0, 0, 0, 1, 1,
-0.8622099, 0.659959, -2.249404, 0, 0, 0, 1, 1,
-0.8567691, 0.8318962, -1.019859, 0, 0, 0, 1, 1,
-0.8562902, -0.0843161, -1.238199, 0, 0, 0, 1, 1,
-0.8539322, 0.6151423, -0.2859778, 0, 0, 0, 1, 1,
-0.8534621, -0.527292, -2.374163, 0, 0, 0, 1, 1,
-0.8515323, 0.1669314, -1.697308, 0, 0, 0, 1, 1,
-0.8467051, -0.3556607, -1.587902, 1, 1, 1, 1, 1,
-0.846534, -2.603565, -2.998159, 1, 1, 1, 1, 1,
-0.8452896, -0.2022165, -4.012297, 1, 1, 1, 1, 1,
-0.8442381, -1.408141, -3.275977, 1, 1, 1, 1, 1,
-0.8440188, 0.8845939, -1.674841, 1, 1, 1, 1, 1,
-0.842555, 0.440289, -1.7563, 1, 1, 1, 1, 1,
-0.8403057, 0.06061509, -2.374952, 1, 1, 1, 1, 1,
-0.8402728, -3.104588, -1.170716, 1, 1, 1, 1, 1,
-0.8387334, 0.7123825, -0.6724561, 1, 1, 1, 1, 1,
-0.8345137, 2.145942, -0.1834405, 1, 1, 1, 1, 1,
-0.8332809, 0.09027936, -2.47701, 1, 1, 1, 1, 1,
-0.832714, -0.07835618, 0.2939172, 1, 1, 1, 1, 1,
-0.8300833, 0.3558574, -2.781163, 1, 1, 1, 1, 1,
-0.8191008, -0.3486655, -1.680648, 1, 1, 1, 1, 1,
-0.8169937, -0.3100664, -1.432999, 1, 1, 1, 1, 1,
-0.8165905, -0.6662456, -3.697143, 0, 0, 1, 1, 1,
-0.8113922, -1.219313, -2.710487, 1, 0, 0, 1, 1,
-0.8091325, -1.141823, -1.642827, 1, 0, 0, 1, 1,
-0.8075769, -0.5766888, -3.675898, 1, 0, 0, 1, 1,
-0.8031752, 1.719233, -0.3531272, 1, 0, 0, 1, 1,
-0.8022418, -0.1885135, -2.697616, 1, 0, 0, 1, 1,
-0.7985767, -0.7064312, -2.587564, 0, 0, 0, 1, 1,
-0.7960339, 0.3749387, -1.583838, 0, 0, 0, 1, 1,
-0.7946411, 0.9033418, -1.505125, 0, 0, 0, 1, 1,
-0.7899644, 0.8358126, -0.3464242, 0, 0, 0, 1, 1,
-0.7824924, 0.0009821058, 0.6962876, 0, 0, 0, 1, 1,
-0.7734921, 0.2738721, -0.8562818, 0, 0, 0, 1, 1,
-0.7709522, 0.2652046, -1.996139, 0, 0, 0, 1, 1,
-0.770914, 0.5024852, -2.018371, 1, 1, 1, 1, 1,
-0.767817, -0.6309342, -2.421736, 1, 1, 1, 1, 1,
-0.7611419, -0.5277011, -1.837854, 1, 1, 1, 1, 1,
-0.7593805, -1.017804, -1.219607, 1, 1, 1, 1, 1,
-0.7578524, -1.445328, -1.837364, 1, 1, 1, 1, 1,
-0.7574754, -1.24158, -4.359769, 1, 1, 1, 1, 1,
-0.7430063, 0.1880721, -1.547147, 1, 1, 1, 1, 1,
-0.742582, -3.0306, -2.838604, 1, 1, 1, 1, 1,
-0.7421147, 1.403536, 0.6624055, 1, 1, 1, 1, 1,
-0.741006, 0.6279464, 0.250516, 1, 1, 1, 1, 1,
-0.7372375, 0.8723743, 1.915587, 1, 1, 1, 1, 1,
-0.7266382, 1.769607, -0.680337, 1, 1, 1, 1, 1,
-0.7257842, 0.6862505, -2.497693, 1, 1, 1, 1, 1,
-0.7227621, -1.313226, -3.813909, 1, 1, 1, 1, 1,
-0.7175348, 0.6394843, -1.196831, 1, 1, 1, 1, 1,
-0.7170935, 1.070124, -1.455931, 0, 0, 1, 1, 1,
-0.7139404, 1.56478, -1.583529, 1, 0, 0, 1, 1,
-0.7115374, -1.760261, -2.868244, 1, 0, 0, 1, 1,
-0.7095954, 0.3439595, -0.6120957, 1, 0, 0, 1, 1,
-0.6971395, 0.555258, -0.7794477, 1, 0, 0, 1, 1,
-0.6965272, 0.7857848, -2.179218, 1, 0, 0, 1, 1,
-0.6956524, -0.8310148, -4.029791, 0, 0, 0, 1, 1,
-0.695589, -0.3076203, -0.5157582, 0, 0, 0, 1, 1,
-0.6920448, 0.8539422, -0.7230486, 0, 0, 0, 1, 1,
-0.6855765, 0.8068393, -1.612077, 0, 0, 0, 1, 1,
-0.6841746, -1.116156, -3.249046, 0, 0, 0, 1, 1,
-0.6823547, -0.8430811, -1.694619, 0, 0, 0, 1, 1,
-0.6803314, -1.09987, -1.599501, 0, 0, 0, 1, 1,
-0.6756806, -0.02267161, -3.433811, 1, 1, 1, 1, 1,
-0.6752825, 0.1868036, -2.156391, 1, 1, 1, 1, 1,
-0.673366, -0.5868618, -3.837124, 1, 1, 1, 1, 1,
-0.672709, -1.439197, -3.887908, 1, 1, 1, 1, 1,
-0.6694636, 1.133251, -1.300775, 1, 1, 1, 1, 1,
-0.6666581, -0.1455239, -0.2848793, 1, 1, 1, 1, 1,
-0.6589513, 0.2888225, -2.901522, 1, 1, 1, 1, 1,
-0.6567, 1.144861, -1.507035, 1, 1, 1, 1, 1,
-0.6544859, 0.1248741, -3.446854, 1, 1, 1, 1, 1,
-0.6529433, -0.1718004, -1.123074, 1, 1, 1, 1, 1,
-0.6502419, -1.05243, -0.9664279, 1, 1, 1, 1, 1,
-0.6496684, 0.3857199, -0.1740053, 1, 1, 1, 1, 1,
-0.6371933, -0.645992, -0.7864525, 1, 1, 1, 1, 1,
-0.6364051, -0.9060665, -2.071827, 1, 1, 1, 1, 1,
-0.6359502, -1.804929, -1.073155, 1, 1, 1, 1, 1,
-0.6352986, -1.50754, -3.371561, 0, 0, 1, 1, 1,
-0.6346125, 0.4609616, 0.02332477, 1, 0, 0, 1, 1,
-0.6319007, 0.04833527, -2.201575, 1, 0, 0, 1, 1,
-0.6315905, -0.3114261, -2.467984, 1, 0, 0, 1, 1,
-0.6281006, 0.8441643, 1.281237, 1, 0, 0, 1, 1,
-0.6210364, -1.478136, -3.083602, 1, 0, 0, 1, 1,
-0.6146182, 0.8558758, -1.714828, 0, 0, 0, 1, 1,
-0.6084609, -0.2240849, -0.6547787, 0, 0, 0, 1, 1,
-0.6059392, 1.97933, -0.197634, 0, 0, 0, 1, 1,
-0.5857119, -1.008814, -4.580334, 0, 0, 0, 1, 1,
-0.5854067, 1.968434, -0.5028617, 0, 0, 0, 1, 1,
-0.5850143, -0.04845155, -1.643276, 0, 0, 0, 1, 1,
-0.5813645, -0.3400239, -0.4641509, 0, 0, 0, 1, 1,
-0.5731617, 0.5269336, -1.083442, 1, 1, 1, 1, 1,
-0.5687361, 1.288309, -0.4359225, 1, 1, 1, 1, 1,
-0.5631522, 0.9367667, -2.147271, 1, 1, 1, 1, 1,
-0.5630367, 2.036373, -1.241073, 1, 1, 1, 1, 1,
-0.5575631, -0.155197, -2.944271, 1, 1, 1, 1, 1,
-0.5557451, -0.03670516, -1.979756, 1, 1, 1, 1, 1,
-0.5518473, 0.906238, -1.17109, 1, 1, 1, 1, 1,
-0.551414, 0.2217889, -0.2585993, 1, 1, 1, 1, 1,
-0.5503787, 1.064929, -0.9062637, 1, 1, 1, 1, 1,
-0.5503346, 0.331237, -0.3601418, 1, 1, 1, 1, 1,
-0.5464304, 0.8293181, -0.6112714, 1, 1, 1, 1, 1,
-0.5433215, 0.7474768, -0.3207612, 1, 1, 1, 1, 1,
-0.5416884, 1.065899, 0.1997937, 1, 1, 1, 1, 1,
-0.5411747, 1.095341, 0.1080311, 1, 1, 1, 1, 1,
-0.5371915, 0.09916529, -1.206243, 1, 1, 1, 1, 1,
-0.5366708, 0.486314, -1.94975, 0, 0, 1, 1, 1,
-0.5363966, -0.8396477, -3.607821, 1, 0, 0, 1, 1,
-0.5346823, 0.1305563, -4.448098, 1, 0, 0, 1, 1,
-0.5286362, -0.3236879, 0.5766951, 1, 0, 0, 1, 1,
-0.523484, -0.3391019, -1.96693, 1, 0, 0, 1, 1,
-0.5202872, 0.1069651, -1.568274, 1, 0, 0, 1, 1,
-0.5161133, -0.6264998, -4.477807, 0, 0, 0, 1, 1,
-0.511298, 0.3833206, -1.856576, 0, 0, 0, 1, 1,
-0.509318, -0.1128218, -2.263186, 0, 0, 0, 1, 1,
-0.5078507, -1.621794, -3.005868, 0, 0, 0, 1, 1,
-0.5056008, 0.9989216, -1.194856, 0, 0, 0, 1, 1,
-0.5029789, 0.5215343, -1.474499, 0, 0, 0, 1, 1,
-0.5002159, -0.3884999, -1.82616, 0, 0, 0, 1, 1,
-0.4905258, -1.864164, -2.895021, 1, 1, 1, 1, 1,
-0.4878535, -2.103395, -2.500872, 1, 1, 1, 1, 1,
-0.4867118, -0.507067, -3.871502, 1, 1, 1, 1, 1,
-0.4820081, -0.8408811, -2.464646, 1, 1, 1, 1, 1,
-0.481156, 0.6731037, -0.01251374, 1, 1, 1, 1, 1,
-0.4759211, -1.384054, -2.554413, 1, 1, 1, 1, 1,
-0.4744009, -0.5303509, -3.278591, 1, 1, 1, 1, 1,
-0.4742327, -1.28603, -3.710185, 1, 1, 1, 1, 1,
-0.4722384, -1.168097, -3.724213, 1, 1, 1, 1, 1,
-0.4676787, 1.134598, -0.6056291, 1, 1, 1, 1, 1,
-0.4674496, 0.3901375, -0.2312654, 1, 1, 1, 1, 1,
-0.4662211, -0.08054309, -1.251719, 1, 1, 1, 1, 1,
-0.4657774, 0.2299574, -1.283269, 1, 1, 1, 1, 1,
-0.4656678, -1.421132, -3.946567, 1, 1, 1, 1, 1,
-0.4644105, -1.105327, -3.239625, 1, 1, 1, 1, 1,
-0.4638138, -0.1190582, -2.4923, 0, 0, 1, 1, 1,
-0.4631571, 0.4709668, -0.8352845, 1, 0, 0, 1, 1,
-0.4598747, -0.2496372, -2.860574, 1, 0, 0, 1, 1,
-0.4575721, 1.456653, -0.4772714, 1, 0, 0, 1, 1,
-0.4541749, -1.004032, -1.683916, 1, 0, 0, 1, 1,
-0.4535205, -0.2242237, -1.742429, 1, 0, 0, 1, 1,
-0.4510918, -1.154369, -2.473558, 0, 0, 0, 1, 1,
-0.4476019, -1.642491, -4.33079, 0, 0, 0, 1, 1,
-0.4459769, 0.75366, 0.9833104, 0, 0, 0, 1, 1,
-0.443003, -0.1352135, -2.715662, 0, 0, 0, 1, 1,
-0.4417969, 0.3264823, -0.1507102, 0, 0, 0, 1, 1,
-0.4407226, 1.082817, -1.215677, 0, 0, 0, 1, 1,
-0.4351142, -0.02101878, -1.339516, 0, 0, 0, 1, 1,
-0.4331212, 0.6074044, -1.157843, 1, 1, 1, 1, 1,
-0.4329099, -2.136968, -4.425149, 1, 1, 1, 1, 1,
-0.4313321, 1.165974, -0.4998282, 1, 1, 1, 1, 1,
-0.4240025, -1.561717, -2.670118, 1, 1, 1, 1, 1,
-0.4219246, 0.2114928, -1.709148, 1, 1, 1, 1, 1,
-0.4192083, -1.013959, -3.292746, 1, 1, 1, 1, 1,
-0.417993, -1.034621, -2.685729, 1, 1, 1, 1, 1,
-0.4168132, -1.746354, -3.43636, 1, 1, 1, 1, 1,
-0.4161258, -1.290041, -3.595028, 1, 1, 1, 1, 1,
-0.4142447, -0.5085113, -1.52002, 1, 1, 1, 1, 1,
-0.4116205, 0.6352037, -1.166388, 1, 1, 1, 1, 1,
-0.411047, -0.8887701, -3.624975, 1, 1, 1, 1, 1,
-0.4093524, -1.251891, -2.38924, 1, 1, 1, 1, 1,
-0.4084395, -0.2915118, -4.056924, 1, 1, 1, 1, 1,
-0.4033816, 0.1640034, -1.418925, 1, 1, 1, 1, 1,
-0.403353, -1.293521, -0.3855086, 0, 0, 1, 1, 1,
-0.4033443, 1.246216, -0.5962366, 1, 0, 0, 1, 1,
-0.4031116, 0.2870074, -0.9853231, 1, 0, 0, 1, 1,
-0.398534, -1.286663, -2.688505, 1, 0, 0, 1, 1,
-0.3985001, -0.4147791, -1.874672, 1, 0, 0, 1, 1,
-0.3947653, -1.97176, -1.709627, 1, 0, 0, 1, 1,
-0.3918041, 2.229092, -1.245095, 0, 0, 0, 1, 1,
-0.3892077, 0.5656185, 0.3815736, 0, 0, 0, 1, 1,
-0.3857681, -0.1798436, -2.142367, 0, 0, 0, 1, 1,
-0.3855942, 0.3411726, -0.6118235, 0, 0, 0, 1, 1,
-0.3811426, -1.662921, -3.270044, 0, 0, 0, 1, 1,
-0.3755507, 1.018413, 1.119794, 0, 0, 0, 1, 1,
-0.369858, 0.5101022, 1.400782, 0, 0, 0, 1, 1,
-0.3652028, -0.4614692, -2.215498, 1, 1, 1, 1, 1,
-0.3648121, -1.330413, -3.738106, 1, 1, 1, 1, 1,
-0.3631992, 1.534554, -1.056258, 1, 1, 1, 1, 1,
-0.3615405, -1.061293, -1.892943, 1, 1, 1, 1, 1,
-0.3601433, -0.5862853, -3.268346, 1, 1, 1, 1, 1,
-0.3571403, -1.116621, -3.130182, 1, 1, 1, 1, 1,
-0.3564053, 1.083106, 1.000253, 1, 1, 1, 1, 1,
-0.3561972, -0.05919734, -2.006004, 1, 1, 1, 1, 1,
-0.356143, 0.8614535, 1.424991, 1, 1, 1, 1, 1,
-0.3527919, 1.255853, -0.4967756, 1, 1, 1, 1, 1,
-0.3521549, -0.1386932, -1.48128, 1, 1, 1, 1, 1,
-0.3493428, 1.125561, -0.8893025, 1, 1, 1, 1, 1,
-0.3480006, -0.6846551, -2.110353, 1, 1, 1, 1, 1,
-0.347952, -0.2857879, -3.07794, 1, 1, 1, 1, 1,
-0.3461269, -0.698663, -3.539084, 1, 1, 1, 1, 1,
-0.344911, -2.584822, -2.512004, 0, 0, 1, 1, 1,
-0.3369273, 0.4790578, -0.9244485, 1, 0, 0, 1, 1,
-0.3349897, -0.2207274, -1.91403, 1, 0, 0, 1, 1,
-0.334793, -0.1192016, -0.8925759, 1, 0, 0, 1, 1,
-0.3336658, 0.6183056, -1.115044, 1, 0, 0, 1, 1,
-0.3307608, 0.006225008, -2.878384, 1, 0, 0, 1, 1,
-0.3287028, 0.1416593, -0.1715717, 0, 0, 0, 1, 1,
-0.3262945, -0.4720074, -2.322353, 0, 0, 0, 1, 1,
-0.3262647, -0.9600991, -2.43074, 0, 0, 0, 1, 1,
-0.3251975, 0.9383835, -0.3273717, 0, 0, 0, 1, 1,
-0.3247173, -0.9816082, -0.3770256, 0, 0, 0, 1, 1,
-0.3150044, 0.0799027, -2.674659, 0, 0, 0, 1, 1,
-0.3106088, -0.7293736, -3.759231, 0, 0, 0, 1, 1,
-0.3067315, -0.2172953, -1.534536, 1, 1, 1, 1, 1,
-0.3065322, -2.12363, -2.638563, 1, 1, 1, 1, 1,
-0.3061133, 0.4252436, 0.3104621, 1, 1, 1, 1, 1,
-0.3041782, 0.4048867, 0.04005177, 1, 1, 1, 1, 1,
-0.3019478, -0.05403481, -1.15466, 1, 1, 1, 1, 1,
-0.3017397, -0.190636, -2.922243, 1, 1, 1, 1, 1,
-0.3007517, 1.582717, -1.214758, 1, 1, 1, 1, 1,
-0.2979362, -0.402206, -2.496302, 1, 1, 1, 1, 1,
-0.2962532, 0.3498998, -0.8271483, 1, 1, 1, 1, 1,
-0.2914283, 0.4821322, -0.08415046, 1, 1, 1, 1, 1,
-0.2913953, 0.2680935, -0.9000203, 1, 1, 1, 1, 1,
-0.2900545, -1.053746, -2.859238, 1, 1, 1, 1, 1,
-0.2871116, 0.001730154, -1.583206, 1, 1, 1, 1, 1,
-0.2866989, -0.9268166, -2.752436, 1, 1, 1, 1, 1,
-0.2855649, 1.301307, 0.1929032, 1, 1, 1, 1, 1,
-0.2847675, 1.141356, 0.3397419, 0, 0, 1, 1, 1,
-0.2799415, -0.7297608, -2.184471, 1, 0, 0, 1, 1,
-0.2789582, 1.264654, -2.14843, 1, 0, 0, 1, 1,
-0.2779691, -0.8406427, -5.443216, 1, 0, 0, 1, 1,
-0.2778606, 0.7198774, -0.6073817, 1, 0, 0, 1, 1,
-0.2767387, -0.7189285, -2.749417, 1, 0, 0, 1, 1,
-0.2733867, -0.6850986, -1.323971, 0, 0, 0, 1, 1,
-0.2671739, 0.9702646, 1.500106, 0, 0, 0, 1, 1,
-0.2667023, 1.897183, -1.123566, 0, 0, 0, 1, 1,
-0.2654977, -1.07735, -2.6268, 0, 0, 0, 1, 1,
-0.2635762, 2.40132, -0.1350919, 0, 0, 0, 1, 1,
-0.2614898, -0.6009286, -1.399512, 0, 0, 0, 1, 1,
-0.2595095, -1.228413, -3.815491, 0, 0, 0, 1, 1,
-0.2579057, 0.4415273, -0.7496265, 1, 1, 1, 1, 1,
-0.2567298, -0.4613851, -2.550711, 1, 1, 1, 1, 1,
-0.2552766, 1.442068, 1.14082, 1, 1, 1, 1, 1,
-0.2549079, -1.261192, -2.893363, 1, 1, 1, 1, 1,
-0.2481883, -0.6575887, -2.48756, 1, 1, 1, 1, 1,
-0.2460355, -1.524521, -2.085418, 1, 1, 1, 1, 1,
-0.2447371, 0.640714, -2.813563, 1, 1, 1, 1, 1,
-0.2443292, -1.261921, -2.186165, 1, 1, 1, 1, 1,
-0.2440677, -0.2152932, -2.674015, 1, 1, 1, 1, 1,
-0.2424775, -0.4527365, -2.778997, 1, 1, 1, 1, 1,
-0.2405233, -1.453414, -2.421802, 1, 1, 1, 1, 1,
-0.233751, 0.7066151, 0.2415174, 1, 1, 1, 1, 1,
-0.2268012, -0.3016126, -1.271838, 1, 1, 1, 1, 1,
-0.2200615, -0.8023495, -3.005663, 1, 1, 1, 1, 1,
-0.2198019, -2.035697, -4.568502, 1, 1, 1, 1, 1,
-0.2109586, 0.03504737, -3.189986, 0, 0, 1, 1, 1,
-0.2092807, 0.826381, 0.09593647, 1, 0, 0, 1, 1,
-0.2090382, -0.5603643, -2.656915, 1, 0, 0, 1, 1,
-0.2077074, -1.056852, -2.782972, 1, 0, 0, 1, 1,
-0.2074048, 0.1003565, 1.670644, 1, 0, 0, 1, 1,
-0.2066009, 0.1576297, -1.846652, 1, 0, 0, 1, 1,
-0.2024159, 1.75372, 0.05793155, 0, 0, 0, 1, 1,
-0.2015624, 0.497708, 1.412795, 0, 0, 0, 1, 1,
-0.200184, -0.3664307, -2.86164, 0, 0, 0, 1, 1,
-0.1969661, -0.4208, -3.442131, 0, 0, 0, 1, 1,
-0.1946298, -0.08378486, -2.158054, 0, 0, 0, 1, 1,
-0.194166, 0.3802465, -0.1030904, 0, 0, 0, 1, 1,
-0.1932331, -0.3224027, -3.086084, 0, 0, 0, 1, 1,
-0.1890182, 1.22423, -0.5816471, 1, 1, 1, 1, 1,
-0.1873574, 0.262335, -1.083733, 1, 1, 1, 1, 1,
-0.1841537, -1.603077, -2.779958, 1, 1, 1, 1, 1,
-0.183775, 0.7985163, 0.3698459, 1, 1, 1, 1, 1,
-0.183669, -1.046034, -3.65732, 1, 1, 1, 1, 1,
-0.1761052, -0.163106, -2.687568, 1, 1, 1, 1, 1,
-0.1739299, 0.215354, -0.1476505, 1, 1, 1, 1, 1,
-0.1614842, 0.528554, -0.9496413, 1, 1, 1, 1, 1,
-0.1606991, -0.3755774, -0.1163668, 1, 1, 1, 1, 1,
-0.1549123, -0.8456121, -2.972719, 1, 1, 1, 1, 1,
-0.1473945, -2.604712, -2.277434, 1, 1, 1, 1, 1,
-0.1436322, -0.761413, -3.300368, 1, 1, 1, 1, 1,
-0.1429987, 1.44485, -1.013198, 1, 1, 1, 1, 1,
-0.1429687, 0.2563335, 0.8939501, 1, 1, 1, 1, 1,
-0.1386944, 0.6991079, -0.5874726, 1, 1, 1, 1, 1,
-0.1366425, -1.712862, -4.042137, 0, 0, 1, 1, 1,
-0.1356142, -0.3957018, -4.521328, 1, 0, 0, 1, 1,
-0.1157854, 0.6377664, -0.4206093, 1, 0, 0, 1, 1,
-0.1100786, -0.4577237, -3.399687, 1, 0, 0, 1, 1,
-0.1096034, -0.9620935, -3.55198, 1, 0, 0, 1, 1,
-0.1090102, -0.1748664, -2.971633, 1, 0, 0, 1, 1,
-0.102871, -0.5366104, -3.74929, 0, 0, 0, 1, 1,
-0.1024785, 0.6533268, -1.599126, 0, 0, 0, 1, 1,
-0.09919976, 1.033743, -1.138378, 0, 0, 0, 1, 1,
-0.09798773, 0.2308087, -2.555931, 0, 0, 0, 1, 1,
-0.09649053, -0.8863469, -1.086197, 0, 0, 0, 1, 1,
-0.09609799, 1.164101, -1.709676, 0, 0, 0, 1, 1,
-0.09522902, -0.2918623, -1.751731, 0, 0, 0, 1, 1,
-0.09381744, -1.978155, -2.473734, 1, 1, 1, 1, 1,
-0.09226245, -1.130893, -3.305542, 1, 1, 1, 1, 1,
-0.09048517, 0.9223556, 1.309698, 1, 1, 1, 1, 1,
-0.08914986, -1.877866, -4.776939, 1, 1, 1, 1, 1,
-0.08870446, -1.177623, -4.234725, 1, 1, 1, 1, 1,
-0.08445489, -0.1974472, -2.778777, 1, 1, 1, 1, 1,
-0.08348835, 0.07269527, -2.182818, 1, 1, 1, 1, 1,
-0.08314768, 0.7034659, 0.5462341, 1, 1, 1, 1, 1,
-0.08176635, -0.2628817, -2.749651, 1, 1, 1, 1, 1,
-0.07324207, 0.07718747, -2.613591, 1, 1, 1, 1, 1,
-0.07020111, -0.8554857, -1.82437, 1, 1, 1, 1, 1,
-0.06976203, 0.338093, -0.1601392, 1, 1, 1, 1, 1,
-0.06829498, 0.3899876, -0.8617736, 1, 1, 1, 1, 1,
-0.06358291, 0.7074776, -1.783691, 1, 1, 1, 1, 1,
-0.0608089, -1.606562, -2.324309, 1, 1, 1, 1, 1,
-0.05966048, 0.1959231, -1.088779, 0, 0, 1, 1, 1,
-0.05842788, -1.560099, -2.400391, 1, 0, 0, 1, 1,
-0.05456229, -1.783917, -4.250084, 1, 0, 0, 1, 1,
-0.05091798, -0.09354025, -2.098015, 1, 0, 0, 1, 1,
-0.04273362, 0.4361941, 1.347792, 1, 0, 0, 1, 1,
-0.04149216, 0.7585048, 0.3765421, 1, 0, 0, 1, 1,
-0.03860312, -1.227248, -3.919596, 0, 0, 0, 1, 1,
-0.03753819, 1.191513, -0.341083, 0, 0, 0, 1, 1,
-0.03559013, 0.2268383, 0.8164215, 0, 0, 0, 1, 1,
-0.03403994, -0.3088817, -3.258266, 0, 0, 0, 1, 1,
-0.03184671, -0.6962616, -3.899155, 0, 0, 0, 1, 1,
-0.02624282, 0.4053652, 0.5703674, 0, 0, 0, 1, 1,
-0.02326423, -0.7454722, -2.285816, 0, 0, 0, 1, 1,
-0.01835892, -0.2542589, -2.145645, 1, 1, 1, 1, 1,
-0.0134411, 1.016404, -0.9662009, 1, 1, 1, 1, 1,
-0.01192283, -1.606092, -3.004828, 1, 1, 1, 1, 1,
-0.007815178, 1.799391, 0.8862482, 1, 1, 1, 1, 1,
0.004325361, 1.044884, 1.011181, 1, 1, 1, 1, 1,
0.004560405, -0.943348, 2.807611, 1, 1, 1, 1, 1,
0.005145717, -0.4802904, 3.330647, 1, 1, 1, 1, 1,
0.01311358, -1.428773, 2.450252, 1, 1, 1, 1, 1,
0.01472313, -0.5957966, 1.927494, 1, 1, 1, 1, 1,
0.01687873, -2.144861, 2.351442, 1, 1, 1, 1, 1,
0.01940037, 0.8512349, -0.2101677, 1, 1, 1, 1, 1,
0.0279615, -0.07984179, 1.810458, 1, 1, 1, 1, 1,
0.02936624, 1.877884, 0.9246086, 1, 1, 1, 1, 1,
0.03536769, 0.06120682, -1.096316, 1, 1, 1, 1, 1,
0.03636958, -0.5480362, 3.418708, 1, 1, 1, 1, 1,
0.03789544, -1.423552, 2.784157, 0, 0, 1, 1, 1,
0.05697322, -0.1739962, 1.757288, 1, 0, 0, 1, 1,
0.05819343, -1.049027, 1.697235, 1, 0, 0, 1, 1,
0.06007994, -0.3228584, 1.794127, 1, 0, 0, 1, 1,
0.06085785, 1.629019, 1.400393, 1, 0, 0, 1, 1,
0.06410448, 1.76284, 0.0863367, 1, 0, 0, 1, 1,
0.0646024, -1.55855, 2.223364, 0, 0, 0, 1, 1,
0.06687792, 0.2122146, -0.4020074, 0, 0, 0, 1, 1,
0.06710492, -2.917158, 3.442741, 0, 0, 0, 1, 1,
0.06897414, -0.5622138, 2.872951, 0, 0, 0, 1, 1,
0.07183307, -2.097588, 2.418658, 0, 0, 0, 1, 1,
0.07278739, -0.3026053, 3.493567, 0, 0, 0, 1, 1,
0.07594185, -0.8297903, 3.231169, 0, 0, 0, 1, 1,
0.0760203, -0.1456946, 3.461523, 1, 1, 1, 1, 1,
0.08273008, 0.7162027, -0.4195087, 1, 1, 1, 1, 1,
0.08315843, 0.837717, -0.05288261, 1, 1, 1, 1, 1,
0.088677, 1.59447, -0.4475747, 1, 1, 1, 1, 1,
0.09385937, 0.7697778, -0.3140926, 1, 1, 1, 1, 1,
0.09516302, -1.900563, 3.901185, 1, 1, 1, 1, 1,
0.09629641, -0.2805898, 2.263238, 1, 1, 1, 1, 1,
0.09694762, 0.1533632, -0.7456527, 1, 1, 1, 1, 1,
0.09887636, 0.5098837, 1.508179, 1, 1, 1, 1, 1,
0.1020395, 0.6383613, -1.751699, 1, 1, 1, 1, 1,
0.1086461, 0.9627026, 0.4652268, 1, 1, 1, 1, 1,
0.1088987, -0.8890729, 3.48747, 1, 1, 1, 1, 1,
0.1146174, 0.1173074, 1.284735, 1, 1, 1, 1, 1,
0.1177349, 2.993116, -1.575935, 1, 1, 1, 1, 1,
0.1181289, -1.373935, 3.077348, 1, 1, 1, 1, 1,
0.119839, 1.572802, -0.2017108, 0, 0, 1, 1, 1,
0.1269383, -0.7701717, 2.106155, 1, 0, 0, 1, 1,
0.1277865, 0.1524027, 2.404111, 1, 0, 0, 1, 1,
0.1396865, 0.4629114, -0.06341487, 1, 0, 0, 1, 1,
0.141465, -0.7046604, 1.19038, 1, 0, 0, 1, 1,
0.1428638, -1.420394, 2.855367, 1, 0, 0, 1, 1,
0.1433803, -0.6540062, 3.928245, 0, 0, 0, 1, 1,
0.1438965, -0.8454319, 4.82634, 0, 0, 0, 1, 1,
0.1457018, -1.261892, 3.144508, 0, 0, 0, 1, 1,
0.1493664, -0.8778872, 2.950017, 0, 0, 0, 1, 1,
0.1509985, 0.8303633, -1.758156, 0, 0, 0, 1, 1,
0.1562042, -0.977012, 3.320697, 0, 0, 0, 1, 1,
0.1581477, 0.1217591, -0.5953848, 0, 0, 0, 1, 1,
0.1587735, 0.487072, 1.037795, 1, 1, 1, 1, 1,
0.1594459, -0.8521696, 1.647914, 1, 1, 1, 1, 1,
0.165203, 0.2233298, 1.123907, 1, 1, 1, 1, 1,
0.1680776, 0.6206542, 0.7521891, 1, 1, 1, 1, 1,
0.1711433, -1.0967, 2.944336, 1, 1, 1, 1, 1,
0.1716576, -1.121902, 1.340715, 1, 1, 1, 1, 1,
0.1788026, 1.550307, 0.3241887, 1, 1, 1, 1, 1,
0.1791797, -0.4045077, 4.041611, 1, 1, 1, 1, 1,
0.1843441, 1.469876, 1.430293, 1, 1, 1, 1, 1,
0.1902221, 0.9349074, -0.4515311, 1, 1, 1, 1, 1,
0.1912872, 0.0005501451, -1.049535, 1, 1, 1, 1, 1,
0.1993784, 0.7326904, 0.2732369, 1, 1, 1, 1, 1,
0.1994463, -0.04185848, 1.271042, 1, 1, 1, 1, 1,
0.2019443, -0.2921517, 2.119697, 1, 1, 1, 1, 1,
0.2036927, 0.3778869, 0.1851017, 1, 1, 1, 1, 1,
0.2063929, -0.8546964, 1.566946, 0, 0, 1, 1, 1,
0.2065595, 1.121579, -0.1993555, 1, 0, 0, 1, 1,
0.2093304, -1.302154, 2.607031, 1, 0, 0, 1, 1,
0.2096274, -0.8100792, 2.443127, 1, 0, 0, 1, 1,
0.211694, 1.058143, 0.384862, 1, 0, 0, 1, 1,
0.2131777, 0.645103, -0.2644566, 1, 0, 0, 1, 1,
0.2155668, 0.2341114, 0.8928035, 0, 0, 0, 1, 1,
0.2168999, -2.20299, 2.18423, 0, 0, 0, 1, 1,
0.220877, 2.448621, 0.4715219, 0, 0, 0, 1, 1,
0.221551, -0.1577507, 2.386524, 0, 0, 0, 1, 1,
0.2285037, 0.8888706, -0.842086, 0, 0, 0, 1, 1,
0.2309376, -0.5392726, 3.09355, 0, 0, 0, 1, 1,
0.2313324, -0.1221089, 2.719649, 0, 0, 0, 1, 1,
0.2315809, -1.446191, 2.475175, 1, 1, 1, 1, 1,
0.2330988, 0.2644183, 1.988564, 1, 1, 1, 1, 1,
0.2344153, -0.1779445, 2.640795, 1, 1, 1, 1, 1,
0.2366709, 0.9739203, 1.752188, 1, 1, 1, 1, 1,
0.2370445, -1.327706, 1.804076, 1, 1, 1, 1, 1,
0.2382964, 0.7603116, 0.1543331, 1, 1, 1, 1, 1,
0.2404494, -0.5535975, 2.004686, 1, 1, 1, 1, 1,
0.2534013, 0.04332136, 2.366951, 1, 1, 1, 1, 1,
0.2546627, -0.6261145, 1.992065, 1, 1, 1, 1, 1,
0.2549531, 0.2297938, 1.100087, 1, 1, 1, 1, 1,
0.2604996, 0.4083197, -0.04596736, 1, 1, 1, 1, 1,
0.2615646, 0.5610194, 1.058919, 1, 1, 1, 1, 1,
0.2690384, 0.8046264, 1.233573, 1, 1, 1, 1, 1,
0.271318, 0.900104, 0.7844058, 1, 1, 1, 1, 1,
0.272657, -0.9273657, 1.496171, 1, 1, 1, 1, 1,
0.2746187, 0.51555, -0.7884723, 0, 0, 1, 1, 1,
0.2751963, -0.6273789, 0.5978251, 1, 0, 0, 1, 1,
0.2804407, 0.6650094, -0.2159681, 1, 0, 0, 1, 1,
0.2813401, 0.7018074, 0.6200702, 1, 0, 0, 1, 1,
0.287095, 0.3391899, 2.238085, 1, 0, 0, 1, 1,
0.2902328, -1.323579, 1.765285, 1, 0, 0, 1, 1,
0.2943381, 0.4960034, -0.04589017, 0, 0, 0, 1, 1,
0.3012568, 0.8344358, 1.053834, 0, 0, 0, 1, 1,
0.3042564, -0.07509766, 1.637919, 0, 0, 0, 1, 1,
0.3045717, -1.736473, 1.660503, 0, 0, 0, 1, 1,
0.3076705, -1.02282, 3.087781, 0, 0, 0, 1, 1,
0.3125046, -0.2724539, 1.177514, 0, 0, 0, 1, 1,
0.3133326, 0.8366622, 2.332198, 0, 0, 0, 1, 1,
0.3167694, -1.06453, 4.635017, 1, 1, 1, 1, 1,
0.3182912, 1.138027, -0.3387736, 1, 1, 1, 1, 1,
0.3195289, -0.8533823, 1.15569, 1, 1, 1, 1, 1,
0.3207191, 0.6720668, -1.044596, 1, 1, 1, 1, 1,
0.322549, 0.5776291, 2.070246, 1, 1, 1, 1, 1,
0.3228221, -0.01210072, 2.16189, 1, 1, 1, 1, 1,
0.3231461, -0.05887086, 1.125744, 1, 1, 1, 1, 1,
0.3247853, -2.051756, 2.350643, 1, 1, 1, 1, 1,
0.3294363, -0.6019135, 2.577671, 1, 1, 1, 1, 1,
0.3329679, 0.7667022, 2.221134, 1, 1, 1, 1, 1,
0.3331738, -1.15387, 0.5340042, 1, 1, 1, 1, 1,
0.3431176, -0.8109631, 2.336537, 1, 1, 1, 1, 1,
0.3467133, -1.413052, 3.323139, 1, 1, 1, 1, 1,
0.3497059, 1.735129, -0.3639025, 1, 1, 1, 1, 1,
0.3531386, 0.5616078, -0.5904839, 1, 1, 1, 1, 1,
0.3549292, 0.9546511, 0.2544689, 0, 0, 1, 1, 1,
0.3560303, -0.257837, 1.50278, 1, 0, 0, 1, 1,
0.3627021, 0.2446165, 0.1329744, 1, 0, 0, 1, 1,
0.3667921, 0.9104884, 2.052641, 1, 0, 0, 1, 1,
0.3710152, -0.01086754, 2.490129, 1, 0, 0, 1, 1,
0.3713901, 0.4575373, 1.828264, 1, 0, 0, 1, 1,
0.3720367, -0.1186235, 3.470136, 0, 0, 0, 1, 1,
0.3725341, 0.726333, 0.9076623, 0, 0, 0, 1, 1,
0.3764685, 2.075216, 0.786163, 0, 0, 0, 1, 1,
0.3804882, 0.1947515, -0.03166467, 0, 0, 0, 1, 1,
0.3848044, -0.4980794, 2.716321, 0, 0, 0, 1, 1,
0.3862167, -0.6766081, 4.425795, 0, 0, 0, 1, 1,
0.3878118, 0.4855089, 2.804302, 0, 0, 0, 1, 1,
0.3926973, 0.05160557, 2.055824, 1, 1, 1, 1, 1,
0.4018961, 0.4323239, 2.277428, 1, 1, 1, 1, 1,
0.4020535, -1.276953, 2.685905, 1, 1, 1, 1, 1,
0.4037619, -0.6111964, 0.7758425, 1, 1, 1, 1, 1,
0.4066757, 0.6705207, -0.2165931, 1, 1, 1, 1, 1,
0.4067589, 0.933342, 0.5803184, 1, 1, 1, 1, 1,
0.4094208, -0.6772176, 2.597978, 1, 1, 1, 1, 1,
0.4106939, 0.6164156, -0.43581, 1, 1, 1, 1, 1,
0.4126966, 0.1463275, 1.816784, 1, 1, 1, 1, 1,
0.4130808, 0.1609295, 3.00943, 1, 1, 1, 1, 1,
0.4144392, -1.134543, 2.042989, 1, 1, 1, 1, 1,
0.4173513, -0.6088502, 2.084451, 1, 1, 1, 1, 1,
0.4174908, -1.063067, 0.06336352, 1, 1, 1, 1, 1,
0.4188397, 0.1806654, 0.09276292, 1, 1, 1, 1, 1,
0.4198266, -0.5922595, 3.373082, 1, 1, 1, 1, 1,
0.4200241, 0.1341065, 2.07643, 0, 0, 1, 1, 1,
0.4204013, 1.451805, 1.148226, 1, 0, 0, 1, 1,
0.4210805, -2.132003, 0.7258874, 1, 0, 0, 1, 1,
0.4287377, -0.5553198, 0.8882406, 1, 0, 0, 1, 1,
0.4291059, 1.078228, -0.3923606, 1, 0, 0, 1, 1,
0.4299207, 0.8223256, -0.5109318, 1, 0, 0, 1, 1,
0.4305885, 1.554753, 1.505376, 0, 0, 0, 1, 1,
0.432945, 1.160882, 0.8063516, 0, 0, 0, 1, 1,
0.4375234, 1.941947, 0.3470159, 0, 0, 0, 1, 1,
0.4405577, -0.3449893, 1.758485, 0, 0, 0, 1, 1,
0.4432237, 0.4188801, 1.674729, 0, 0, 0, 1, 1,
0.4460131, 0.4717968, 0.5092421, 0, 0, 0, 1, 1,
0.4460406, -0.3147538, 2.167064, 0, 0, 0, 1, 1,
0.4488927, 0.721555, -0.1770717, 1, 1, 1, 1, 1,
0.4497529, 1.3244, 0.4848039, 1, 1, 1, 1, 1,
0.4538144, -2.274282, 2.645465, 1, 1, 1, 1, 1,
0.4538751, -0.9981, 1.673476, 1, 1, 1, 1, 1,
0.4544309, 2.253954, -0.7354761, 1, 1, 1, 1, 1,
0.4550688, 0.8455361, -0.5488857, 1, 1, 1, 1, 1,
0.455505, 1.256889, -0.03230198, 1, 1, 1, 1, 1,
0.4563303, -0.9339246, 2.676239, 1, 1, 1, 1, 1,
0.4597653, 0.5492638, 1.965262, 1, 1, 1, 1, 1,
0.4611583, -0.193399, 1.813715, 1, 1, 1, 1, 1,
0.463568, 0.5445844, 0.7936057, 1, 1, 1, 1, 1,
0.4646765, 0.9269527, -0.3467529, 1, 1, 1, 1, 1,
0.4680728, 0.8297648, 2.208021, 1, 1, 1, 1, 1,
0.4703827, 1.41414, -0.7522539, 1, 1, 1, 1, 1,
0.4707982, 0.2949321, 2.617556, 1, 1, 1, 1, 1,
0.4716554, -0.3309667, 2.646539, 0, 0, 1, 1, 1,
0.4740205, -0.4330151, 1.779482, 1, 0, 0, 1, 1,
0.4745225, -1.058467, 2.581427, 1, 0, 0, 1, 1,
0.4789722, 0.4671443, 2.4643, 1, 0, 0, 1, 1,
0.4813116, 1.115245, 0.4188669, 1, 0, 0, 1, 1,
0.4819543, -1.185379, 2.461673, 1, 0, 0, 1, 1,
0.482677, 0.6499829, 0.2820399, 0, 0, 0, 1, 1,
0.4827395, 0.3487767, -0.3087454, 0, 0, 0, 1, 1,
0.4872239, -0.6838891, 1.877201, 0, 0, 0, 1, 1,
0.4872742, -1.416337, 2.3456, 0, 0, 0, 1, 1,
0.4895951, 1.484524, 0.9213407, 0, 0, 0, 1, 1,
0.4917281, -0.3715667, 3.326777, 0, 0, 0, 1, 1,
0.4940287, 1.007495, 0.4150104, 0, 0, 0, 1, 1,
0.4962573, -0.8098969, 4.801963, 1, 1, 1, 1, 1,
0.4998135, 0.1608177, 1.511561, 1, 1, 1, 1, 1,
0.5006645, -0.7227932, 2.771997, 1, 1, 1, 1, 1,
0.5031902, -1.851424, 4.872035, 1, 1, 1, 1, 1,
0.5043685, -1.169599, 3.291205, 1, 1, 1, 1, 1,
0.5045094, -0.1241371, 3.029994, 1, 1, 1, 1, 1,
0.5060332, 0.1308379, 2.648994, 1, 1, 1, 1, 1,
0.506927, 1.416743, 0.06707686, 1, 1, 1, 1, 1,
0.5077221, -1.375246, 2.391717, 1, 1, 1, 1, 1,
0.5098719, 0.8266398, -0.5051196, 1, 1, 1, 1, 1,
0.5123442, 0.9762512, 1.061993, 1, 1, 1, 1, 1,
0.5151682, -0.6344427, 2.869456, 1, 1, 1, 1, 1,
0.5183924, -2.072967, 2.386518, 1, 1, 1, 1, 1,
0.5246533, -1.035807, 4.672395, 1, 1, 1, 1, 1,
0.526765, -1.633925, 3.859245, 1, 1, 1, 1, 1,
0.5348822, -2.10692, 2.730659, 0, 0, 1, 1, 1,
0.5349314, -1.794722, 0.1149424, 1, 0, 0, 1, 1,
0.537657, 2.140876, 1.191312, 1, 0, 0, 1, 1,
0.5405774, -0.9120261, 3.794099, 1, 0, 0, 1, 1,
0.5416781, -0.6886762, 2.599073, 1, 0, 0, 1, 1,
0.544516, 0.4222647, 0.3097381, 1, 0, 0, 1, 1,
0.5459142, 1.124097, 1.656795, 0, 0, 0, 1, 1,
0.5469688, 0.4783846, -0.01584701, 0, 0, 0, 1, 1,
0.547585, 0.6204343, 1.857546, 0, 0, 0, 1, 1,
0.5497399, -0.2816378, 1.538559, 0, 0, 0, 1, 1,
0.5500173, -2.559354, 3.031374, 0, 0, 0, 1, 1,
0.5700226, -0.6117839, 3.39414, 0, 0, 0, 1, 1,
0.5730973, -0.7973385, 3.350901, 0, 0, 0, 1, 1,
0.5772607, 0.7362327, -0.2372763, 1, 1, 1, 1, 1,
0.5829758, 0.4875141, 0.1362129, 1, 1, 1, 1, 1,
0.5832364, -0.3315345, 1.368531, 1, 1, 1, 1, 1,
0.587703, 0.7196268, 0.118071, 1, 1, 1, 1, 1,
0.5882994, 0.4824405, 0.8006921, 1, 1, 1, 1, 1,
0.5986934, -0.2437999, -0.08873963, 1, 1, 1, 1, 1,
0.6008577, -1.543676, 3.794978, 1, 1, 1, 1, 1,
0.6016396, -0.1369424, 1.585919, 1, 1, 1, 1, 1,
0.6054455, 0.1762284, 1.412656, 1, 1, 1, 1, 1,
0.6148068, 0.09303588, 0.8591534, 1, 1, 1, 1, 1,
0.6192869, -1.105787, 2.801928, 1, 1, 1, 1, 1,
0.6200565, 0.405894, 0.7600495, 1, 1, 1, 1, 1,
0.6205583, -1.274388, 1.893475, 1, 1, 1, 1, 1,
0.6289488, -1.240119, 2.415744, 1, 1, 1, 1, 1,
0.6370183, 0.2795221, 2.317128, 1, 1, 1, 1, 1,
0.6376666, -0.1463183, 2.13439, 0, 0, 1, 1, 1,
0.638079, -1.762751, 3.526679, 1, 0, 0, 1, 1,
0.6411936, -0.201514, 2.301606, 1, 0, 0, 1, 1,
0.6435357, 0.9019719, -0.2339589, 1, 0, 0, 1, 1,
0.6442451, 0.3839636, 1.418067, 1, 0, 0, 1, 1,
0.644845, 1.442828, 0.2688425, 1, 0, 0, 1, 1,
0.6469108, 0.3799743, 0.3304584, 0, 0, 0, 1, 1,
0.6476889, 0.5913506, 1.404916, 0, 0, 0, 1, 1,
0.651949, 0.2198401, 2.41055, 0, 0, 0, 1, 1,
0.6588581, 1.835949, -0.2028556, 0, 0, 0, 1, 1,
0.6603088, -1.340682, 2.353992, 0, 0, 0, 1, 1,
0.6617879, -1.151781, 2.745805, 0, 0, 0, 1, 1,
0.6672633, 0.04242728, 0.903424, 0, 0, 0, 1, 1,
0.6700197, -0.1016818, 2.873416, 1, 1, 1, 1, 1,
0.6717753, 1.021104, 0.9696969, 1, 1, 1, 1, 1,
0.6770591, -0.7124711, 4.928325, 1, 1, 1, 1, 1,
0.6782888, 1.408489, -1.363255, 1, 1, 1, 1, 1,
0.6808293, 0.3691301, 0.8460035, 1, 1, 1, 1, 1,
0.6844963, 0.0845544, 3.044445, 1, 1, 1, 1, 1,
0.6893482, 0.6007858, 3.601993, 1, 1, 1, 1, 1,
0.6949537, -0.5230072, 1.658925, 1, 1, 1, 1, 1,
0.6962205, 0.4036464, 2.572017, 1, 1, 1, 1, 1,
0.6992047, 1.110308, -0.6928343, 1, 1, 1, 1, 1,
0.701069, 0.2218877, 1.695422, 1, 1, 1, 1, 1,
0.7063218, 0.1309381, 0.5646059, 1, 1, 1, 1, 1,
0.7063503, 0.1345373, 1.335927, 1, 1, 1, 1, 1,
0.7101475, -0.4217901, 0.5145648, 1, 1, 1, 1, 1,
0.7164713, 0.9983988, 0.3494769, 1, 1, 1, 1, 1,
0.7175117, 0.1074283, 3.229926, 0, 0, 1, 1, 1,
0.7211736, 0.7614602, 0.06527408, 1, 0, 0, 1, 1,
0.7231299, -1.155715, 2.83626, 1, 0, 0, 1, 1,
0.733094, 0.2000796, 2.879503, 1, 0, 0, 1, 1,
0.7332683, 0.7239299, 1.762936, 1, 0, 0, 1, 1,
0.7370228, 0.8005186, -0.2154773, 1, 0, 0, 1, 1,
0.7387756, 0.9237256, -0.7538719, 0, 0, 0, 1, 1,
0.739996, -0.165482, 1.483897, 0, 0, 0, 1, 1,
0.7400542, 0.8889989, 2.68885, 0, 0, 0, 1, 1,
0.7447327, -0.5459397, 4.104274, 0, 0, 0, 1, 1,
0.7449884, 1.260945, -0.543798, 0, 0, 0, 1, 1,
0.7450083, 0.1098995, 0.3058665, 0, 0, 0, 1, 1,
0.7490128, 0.3385181, 0.6553418, 0, 0, 0, 1, 1,
0.7534028, 0.6199133, 1.543827, 1, 1, 1, 1, 1,
0.7539928, 0.01595293, 2.147231, 1, 1, 1, 1, 1,
0.7552531, -1.812854, 2.765799, 1, 1, 1, 1, 1,
0.7579801, -1.328014, 2.358306, 1, 1, 1, 1, 1,
0.758096, 1.50627, 0.3720928, 1, 1, 1, 1, 1,
0.7617419, -2.065483, 3.303648, 1, 1, 1, 1, 1,
0.7625376, -0.1785033, 2.547614, 1, 1, 1, 1, 1,
0.7707356, 0.6922365, 0.3223566, 1, 1, 1, 1, 1,
0.7730826, 0.05320153, 2.683423, 1, 1, 1, 1, 1,
0.7745389, -1.639974, 4.62063, 1, 1, 1, 1, 1,
0.7779268, 0.1303438, 1.785392, 1, 1, 1, 1, 1,
0.7806856, -0.5813412, 3.207635, 1, 1, 1, 1, 1,
0.7864966, 0.2198161, 1.092127, 1, 1, 1, 1, 1,
0.7877135, -0.3522501, 1.999136, 1, 1, 1, 1, 1,
0.7907551, 0.5756244, 1.268672, 1, 1, 1, 1, 1,
0.7949464, -0.638581, 1.948895, 0, 0, 1, 1, 1,
0.8024442, -1.260691, 2.334336, 1, 0, 0, 1, 1,
0.8027381, 0.7888529, -0.785713, 1, 0, 0, 1, 1,
0.8028772, 0.2566595, 0.7849665, 1, 0, 0, 1, 1,
0.8115008, -0.8980482, 1.788113, 1, 0, 0, 1, 1,
0.8142458, 1.293726, -0.5659483, 1, 0, 0, 1, 1,
0.8144053, -0.2987523, 1.852131, 0, 0, 0, 1, 1,
0.8184817, -0.853447, 3.626466, 0, 0, 0, 1, 1,
0.8287284, 0.170836, 0.6115012, 0, 0, 0, 1, 1,
0.8317208, 1.175762, -0.2081771, 0, 0, 0, 1, 1,
0.8397108, 0.7412421, -0.1058616, 0, 0, 0, 1, 1,
0.8452545, -1.217475, 3.778779, 0, 0, 0, 1, 1,
0.8486412, -1.435448, 2.631631, 0, 0, 0, 1, 1,
0.849602, 0.4931951, 2.150517, 1, 1, 1, 1, 1,
0.8541518, -0.7664135, 2.300605, 1, 1, 1, 1, 1,
0.8589395, 0.7475495, 0.8947601, 1, 1, 1, 1, 1,
0.8619081, 0.7445062, 0.8223348, 1, 1, 1, 1, 1,
0.8623471, -0.5256863, 0.8104281, 1, 1, 1, 1, 1,
0.8658878, -0.3581946, 5.324304, 1, 1, 1, 1, 1,
0.8661755, 0.8412724, 2.545817, 1, 1, 1, 1, 1,
0.8740817, -0.2934884, 1.621892, 1, 1, 1, 1, 1,
0.8756117, -0.9191595, 2.487471, 1, 1, 1, 1, 1,
0.875652, -0.2551776, 1.601911, 1, 1, 1, 1, 1,
0.8766065, 1.14006, 1.267303, 1, 1, 1, 1, 1,
0.8873644, -1.159756, 1.928915, 1, 1, 1, 1, 1,
0.8902292, 1.245558, 0.9217598, 1, 1, 1, 1, 1,
0.8916677, -0.4258066, 1.888454, 1, 1, 1, 1, 1,
0.8991629, 1.38148, 0.7598751, 1, 1, 1, 1, 1,
0.9050774, -0.2408615, 0.1953701, 0, 0, 1, 1, 1,
0.9055102, -0.1754074, 2.455626, 1, 0, 0, 1, 1,
0.9202527, -2.143325, 2.935426, 1, 0, 0, 1, 1,
0.9248523, 0.3583296, 2.060819, 1, 0, 0, 1, 1,
0.9262679, 0.100906, 1.225399, 1, 0, 0, 1, 1,
0.9289354, 0.02089988, 0.3632872, 1, 0, 0, 1, 1,
0.930407, 0.7552797, 0.537572, 0, 0, 0, 1, 1,
0.9446248, -0.7783747, 2.80372, 0, 0, 0, 1, 1,
0.9477401, 0.9612128, 0.7458436, 0, 0, 0, 1, 1,
0.9526511, -0.5147642, 1.328838, 0, 0, 0, 1, 1,
0.9531078, -1.50361, 2.996971, 0, 0, 0, 1, 1,
0.9536117, 0.636728, -0.09721629, 0, 0, 0, 1, 1,
0.9561834, -1.211913, 3.367228, 0, 0, 0, 1, 1,
0.9569339, 0.3321736, 2.330403, 1, 1, 1, 1, 1,
0.9708275, -0.1405975, 2.957961, 1, 1, 1, 1, 1,
0.9710099, 1.241137, 1.310289, 1, 1, 1, 1, 1,
0.9825454, 1.716452, -0.2223093, 1, 1, 1, 1, 1,
0.9864469, 1.110566, -0.1962265, 1, 1, 1, 1, 1,
0.9864746, -0.5303252, 1.139377, 1, 1, 1, 1, 1,
0.9874793, 0.4698947, 2.10736, 1, 1, 1, 1, 1,
0.9896187, 0.2442886, 2.108243, 1, 1, 1, 1, 1,
0.9926732, -1.431409, 3.453016, 1, 1, 1, 1, 1,
0.9962108, 0.3760404, 0.9500402, 1, 1, 1, 1, 1,
0.9994002, 0.1254095, -0.4908155, 1, 1, 1, 1, 1,
1.004717, -0.111424, 1.2478, 1, 1, 1, 1, 1,
1.005317, 0.04166432, 0.4824473, 1, 1, 1, 1, 1,
1.011423, 0.4128546, 2.513918, 1, 1, 1, 1, 1,
1.015187, -0.9573517, 3.098352, 1, 1, 1, 1, 1,
1.015521, -0.3992305, 2.235507, 0, 0, 1, 1, 1,
1.015674, 1.134964, -0.5849257, 1, 0, 0, 1, 1,
1.030146, 0.4860471, 1.398284, 1, 0, 0, 1, 1,
1.032249, -1.721603, 3.1499, 1, 0, 0, 1, 1,
1.04818, -0.06204193, 2.030051, 1, 0, 0, 1, 1,
1.050777, -0.2847614, 0.9230104, 1, 0, 0, 1, 1,
1.057542, -0.8474999, 1.75833, 0, 0, 0, 1, 1,
1.066708, 0.1992248, 0.7362049, 0, 0, 0, 1, 1,
1.072488, -0.3957711, 1.641267, 0, 0, 0, 1, 1,
1.079304, 2.550566, 0.6237389, 0, 0, 0, 1, 1,
1.079901, -1.109466, 3.882011, 0, 0, 0, 1, 1,
1.082651, -0.4734367, 2.461765, 0, 0, 0, 1, 1,
1.083435, -0.02106869, 1.872329, 0, 0, 0, 1, 1,
1.08374, -1.017545, 3.991597, 1, 1, 1, 1, 1,
1.086883, 0.9035138, 1.575452, 1, 1, 1, 1, 1,
1.093133, -0.2086177, 3.79142, 1, 1, 1, 1, 1,
1.093312, 0.2835654, 1.618977, 1, 1, 1, 1, 1,
1.106141, -0.6430274, 4.327973, 1, 1, 1, 1, 1,
1.106795, -1.4543, 2.892415, 1, 1, 1, 1, 1,
1.112805, 0.1770945, 1.351157, 1, 1, 1, 1, 1,
1.113018, -1.666993, 2.665686, 1, 1, 1, 1, 1,
1.118186, 0.3012788, 1.211006, 1, 1, 1, 1, 1,
1.119347, -3.386572, 3.411525, 1, 1, 1, 1, 1,
1.120912, -0.5033329, 1.268328, 1, 1, 1, 1, 1,
1.126686, -0.2817748, 2.328349, 1, 1, 1, 1, 1,
1.127243, 1.476222, 0.7432203, 1, 1, 1, 1, 1,
1.128917, -0.2766544, 0.7069384, 1, 1, 1, 1, 1,
1.135253, 0.1720199, 1.577146, 1, 1, 1, 1, 1,
1.148188, 0.8521782, 0.9377889, 0, 0, 1, 1, 1,
1.155215, -0.1568065, 0.7637828, 1, 0, 0, 1, 1,
1.155894, 1.202802, 1.592318, 1, 0, 0, 1, 1,
1.161819, 0.1827171, 3.106889, 1, 0, 0, 1, 1,
1.169322, -0.7654653, 1.229217, 1, 0, 0, 1, 1,
1.173152, 0.9335827, -0.4743758, 1, 0, 0, 1, 1,
1.176587, -0.9092313, 3.338844, 0, 0, 0, 1, 1,
1.191862, 0.06850991, 1.180633, 0, 0, 0, 1, 1,
1.192665, -0.3154409, 1.905672, 0, 0, 0, 1, 1,
1.193375, -0.1673191, 3.993307, 0, 0, 0, 1, 1,
1.199562, -1.709423, 2.61955, 0, 0, 0, 1, 1,
1.200685, -2.609685, 4.60828, 0, 0, 0, 1, 1,
1.201137, -1.618919, 1.558877, 0, 0, 0, 1, 1,
1.203646, -0.0498434, 1.12278, 1, 1, 1, 1, 1,
1.206792, 0.3640028, 2.398989, 1, 1, 1, 1, 1,
1.210927, 0.06845661, 0.3983761, 1, 1, 1, 1, 1,
1.211822, -0.4411405, 0.2827946, 1, 1, 1, 1, 1,
1.213108, 0.9506494, 0.5385071, 1, 1, 1, 1, 1,
1.230744, -0.3586304, 0.6293909, 1, 1, 1, 1, 1,
1.242461, 0.3829229, 0.1480626, 1, 1, 1, 1, 1,
1.24564, -0.3411424, 2.308794, 1, 1, 1, 1, 1,
1.258855, 1.313664, 0.0970832, 1, 1, 1, 1, 1,
1.260975, 0.2560935, 1.095345, 1, 1, 1, 1, 1,
1.269648, -0.07196495, 2.599898, 1, 1, 1, 1, 1,
1.276633, -0.1552056, 2.000611, 1, 1, 1, 1, 1,
1.279834, -1.069076, 4.153305, 1, 1, 1, 1, 1,
1.284158, -1.367525, 2.436011, 1, 1, 1, 1, 1,
1.286564, 1.386215, 1.329597, 1, 1, 1, 1, 1,
1.291079, -0.9807613, 1.583735, 0, 0, 1, 1, 1,
1.291452, -0.7177387, 3.744814, 1, 0, 0, 1, 1,
1.29323, -2.247553, 3.337078, 1, 0, 0, 1, 1,
1.295453, -0.4456894, 0.671475, 1, 0, 0, 1, 1,
1.298645, -0.2706051, 2.32394, 1, 0, 0, 1, 1,
1.30416, -1.23745, 3.883851, 1, 0, 0, 1, 1,
1.3098, 1.833609, 1.375397, 0, 0, 0, 1, 1,
1.315604, -1.20407, 1.465665, 0, 0, 0, 1, 1,
1.332742, -0.1538294, 0.945267, 0, 0, 0, 1, 1,
1.33296, -0.5495099, 2.362984, 0, 0, 0, 1, 1,
1.359958, -0.1864451, 3.131745, 0, 0, 0, 1, 1,
1.361917, 1.047081, 0.2215519, 0, 0, 0, 1, 1,
1.364364, -1.994169, 0.5901174, 0, 0, 0, 1, 1,
1.364415, 0.4927617, -1.616401, 1, 1, 1, 1, 1,
1.375024, 0.7136348, -0.2736035, 1, 1, 1, 1, 1,
1.375907, -0.7929911, 1.481289, 1, 1, 1, 1, 1,
1.381339, 0.6199719, 0.6234503, 1, 1, 1, 1, 1,
1.384398, -1.644581, 3.098384, 1, 1, 1, 1, 1,
1.391324, -1.157658, 1.584321, 1, 1, 1, 1, 1,
1.39738, -0.08544825, 1.718028, 1, 1, 1, 1, 1,
1.411664, -0.3668552, 2.419177, 1, 1, 1, 1, 1,
1.422637, 0.667044, -0.1290655, 1, 1, 1, 1, 1,
1.431037, 0.3563949, 0.635317, 1, 1, 1, 1, 1,
1.432846, 0.6223235, 2.105321, 1, 1, 1, 1, 1,
1.436538, -0.8623317, 3.25506, 1, 1, 1, 1, 1,
1.437394, 0.5929859, 2.305944, 1, 1, 1, 1, 1,
1.444484, 0.9453062, 2.311971, 1, 1, 1, 1, 1,
1.446123, -0.3960183, 1.837046, 1, 1, 1, 1, 1,
1.446129, -0.7296353, 2.485074, 0, 0, 1, 1, 1,
1.452538, 0.7182209, 1.543115, 1, 0, 0, 1, 1,
1.453726, 1.392566, -0.717784, 1, 0, 0, 1, 1,
1.482814, 0.3971249, 1.871932, 1, 0, 0, 1, 1,
1.48835, 0.5878837, 1.101308, 1, 0, 0, 1, 1,
1.493357, 0.8778738, 1.599334, 1, 0, 0, 1, 1,
1.502119, -0.5129614, 0.4313184, 0, 0, 0, 1, 1,
1.502221, 0.0685176, 0.8310075, 0, 0, 0, 1, 1,
1.509881, 2.048532, 2.190167, 0, 0, 0, 1, 1,
1.525124, -1.973283, 2.541998, 0, 0, 0, 1, 1,
1.53388, -0.2468391, 3.801705, 0, 0, 0, 1, 1,
1.536057, 0.7962831, 0.1027407, 0, 0, 0, 1, 1,
1.545476, 0.1028931, 0.7567112, 0, 0, 0, 1, 1,
1.554605, 1.411698, 0.6448995, 1, 1, 1, 1, 1,
1.568315, -1.305512, 2.983211, 1, 1, 1, 1, 1,
1.570341, 1.251633, -0.319086, 1, 1, 1, 1, 1,
1.576362, 0.4587924, -0.1767594, 1, 1, 1, 1, 1,
1.579962, -0.8869259, 1.517774, 1, 1, 1, 1, 1,
1.603229, -0.2204906, 1.614677, 1, 1, 1, 1, 1,
1.603276, -0.1686081, 0.4242604, 1, 1, 1, 1, 1,
1.607131, 1.903135, 0.5250252, 1, 1, 1, 1, 1,
1.611333, 1.380008, 1.477345, 1, 1, 1, 1, 1,
1.614804, -0.4482872, 0.8901542, 1, 1, 1, 1, 1,
1.619837, 1.173135, 2.153556, 1, 1, 1, 1, 1,
1.625888, -0.1284718, 0.2620486, 1, 1, 1, 1, 1,
1.628271, -0.283153, 1.19147, 1, 1, 1, 1, 1,
1.632152, -0.9954197, 1.843284, 1, 1, 1, 1, 1,
1.650949, 0.6032127, 1.403151, 1, 1, 1, 1, 1,
1.651572, -0.3050323, 2.351033, 0, 0, 1, 1, 1,
1.656791, -0.3088053, -0.5166656, 1, 0, 0, 1, 1,
1.658174, -0.2877927, 0.657988, 1, 0, 0, 1, 1,
1.660826, -1.096362, 1.943885, 1, 0, 0, 1, 1,
1.667696, 0.4015314, 1.62994, 1, 0, 0, 1, 1,
1.720508, 2.940355, -0.07629173, 1, 0, 0, 1, 1,
1.72443, -1.959596, 3.288718, 0, 0, 0, 1, 1,
1.763892, -1.480594, -0.2203448, 0, 0, 0, 1, 1,
1.774073, -0.6795841, 1.252811, 0, 0, 0, 1, 1,
1.780317, 0.7525441, 1.514867, 0, 0, 0, 1, 1,
1.785446, 0.6925676, 1.736769, 0, 0, 0, 1, 1,
1.7866, 0.6109076, 0.6982374, 0, 0, 0, 1, 1,
1.797274, 0.6405187, -0.9619399, 0, 0, 0, 1, 1,
1.805038, -0.03510808, 1.138826, 1, 1, 1, 1, 1,
1.829641, 1.391043, 0.8976147, 1, 1, 1, 1, 1,
1.843247, 1.676195, 0.4504477, 1, 1, 1, 1, 1,
1.84625, 0.1084392, -0.197152, 1, 1, 1, 1, 1,
1.866197, 2.705695, 0.1291159, 1, 1, 1, 1, 1,
1.876876, 0.2509144, 0.6879352, 1, 1, 1, 1, 1,
1.894446, 0.6345588, 2.581079, 1, 1, 1, 1, 1,
1.903455, -0.2180574, 1.235152, 1, 1, 1, 1, 1,
1.916301, 1.132649, 1.7762, 1, 1, 1, 1, 1,
1.924614, 0.839902, 2.357733, 1, 1, 1, 1, 1,
1.925701, -0.7201173, 4.135426, 1, 1, 1, 1, 1,
1.930542, 1.255789, 2.037048, 1, 1, 1, 1, 1,
1.967572, 0.5790489, 1.220149, 1, 1, 1, 1, 1,
1.976628, 0.1780891, 1.592697, 1, 1, 1, 1, 1,
2.005181, -0.6294039, 3.267846, 1, 1, 1, 1, 1,
2.056533, 0.1300108, 2.146401, 0, 0, 1, 1, 1,
2.151532, 0.5092667, 1.666229, 1, 0, 0, 1, 1,
2.169141, -1.62606, 3.723439, 1, 0, 0, 1, 1,
2.203941, 0.1971648, 2.191801, 1, 0, 0, 1, 1,
2.233186, 1.368583, -0.5472379, 1, 0, 0, 1, 1,
2.255311, 2.521067, 0.6479747, 1, 0, 0, 1, 1,
2.28367, -0.7981407, 3.654799, 0, 0, 0, 1, 1,
2.319606, -0.2524126, 2.132336, 0, 0, 0, 1, 1,
2.369625, -1.984001, 2.734448, 0, 0, 0, 1, 1,
2.406966, 0.1749189, -0.01675062, 0, 0, 0, 1, 1,
2.423852, -0.5409407, 3.185084, 0, 0, 0, 1, 1,
2.428608, 0.9219982, 1.968339, 0, 0, 0, 1, 1,
2.525677, 1.203089, 2.342814, 0, 0, 0, 1, 1,
2.553244, 0.1796089, 0.9806146, 1, 1, 1, 1, 1,
2.577108, -1.648303, 1.671395, 1, 1, 1, 1, 1,
2.657003, 0.8106567, 0.3117292, 1, 1, 1, 1, 1,
2.67088, -0.7031143, 2.08935, 1, 1, 1, 1, 1,
2.729753, -0.3780187, 1.071128, 1, 1, 1, 1, 1,
3.054075, -0.582889, 1.827188, 1, 1, 1, 1, 1,
3.389023, 0.01990433, 0.2872008, 1, 1, 1, 1, 1
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
var radius = 9.680132;
var distance = 34.00105;
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
mvMatrix.translate( -0.01467466, 0.1967279, 0.05945635 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.00105);
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
