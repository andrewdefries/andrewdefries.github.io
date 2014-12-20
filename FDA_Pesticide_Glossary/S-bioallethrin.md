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
-2.790779, -0.06373625, -1.895483, 1, 0, 0, 1,
-2.741374, 0.2958394, -2.620604, 1, 0.007843138, 0, 1,
-2.652022, -2.365449, -2.711346, 1, 0.01176471, 0, 1,
-2.638714, -0.2391188, -1.286082, 1, 0.01960784, 0, 1,
-2.527186, -0.1865218, -1.163929, 1, 0.02352941, 0, 1,
-2.43917, 0.6916087, -1.67518, 1, 0.03137255, 0, 1,
-2.403175, -0.3734112, -2.947248, 1, 0.03529412, 0, 1,
-2.334123, 1.594009, -1.484423, 1, 0.04313726, 0, 1,
-2.31337, -0.2014416, -2.141562, 1, 0.04705882, 0, 1,
-2.304377, -0.1370838, -1.724087, 1, 0.05490196, 0, 1,
-2.274895, 1.549539, -2.857461, 1, 0.05882353, 0, 1,
-2.230331, 0.2175966, -1.299927, 1, 0.06666667, 0, 1,
-2.113405, -0.55106, -2.493552, 1, 0.07058824, 0, 1,
-2.09298, -0.1553216, -0.250709, 1, 0.07843138, 0, 1,
-2.087125, 0.3154973, -1.50362, 1, 0.08235294, 0, 1,
-2.082698, 0.4227723, -0.6351656, 1, 0.09019608, 0, 1,
-2.07108, -0.4715527, -1.805891, 1, 0.09411765, 0, 1,
-2.059705, 0.5264003, -2.794466, 1, 0.1019608, 0, 1,
-2.052367, -0.4491212, -1.399121, 1, 0.1098039, 0, 1,
-2.035734, 0.3653471, -1.511598, 1, 0.1137255, 0, 1,
-2.018543, -0.3618492, -1.064436, 1, 0.1215686, 0, 1,
-1.99793, 1.860134, -0.01580936, 1, 0.1254902, 0, 1,
-1.979069, -0.535877, -2.142466, 1, 0.1333333, 0, 1,
-1.968994, 1.119253, -0.6437566, 1, 0.1372549, 0, 1,
-1.964522, -0.9308435, -1.299243, 1, 0.145098, 0, 1,
-1.952373, -0.4790692, -1.137579, 1, 0.1490196, 0, 1,
-1.931989, -1.836374, -1.629198, 1, 0.1568628, 0, 1,
-1.886503, 0.02943017, -3.219841, 1, 0.1607843, 0, 1,
-1.82978, 0.481422, -3.365016, 1, 0.1686275, 0, 1,
-1.82729, -1.707187, -3.246281, 1, 0.172549, 0, 1,
-1.825672, 0.5022949, -2.066366, 1, 0.1803922, 0, 1,
-1.819852, 1.988459, -1.354594, 1, 0.1843137, 0, 1,
-1.81781, -1.35297, -4.74308, 1, 0.1921569, 0, 1,
-1.807575, -1.002592, -2.932947, 1, 0.1960784, 0, 1,
-1.796588, 1.139534, -0.09985278, 1, 0.2039216, 0, 1,
-1.795953, 0.7184466, -0.4935709, 1, 0.2117647, 0, 1,
-1.794195, -1.116454, -0.5682836, 1, 0.2156863, 0, 1,
-1.77782, -0.4793658, -1.190238, 1, 0.2235294, 0, 1,
-1.775481, 0.6483535, -2.073632, 1, 0.227451, 0, 1,
-1.767938, -1.163648, -2.35056, 1, 0.2352941, 0, 1,
-1.766578, -2.070192, -2.335667, 1, 0.2392157, 0, 1,
-1.747352, 0.2322838, -1.465865, 1, 0.2470588, 0, 1,
-1.743287, 1.47295, -1.014168, 1, 0.2509804, 0, 1,
-1.741647, -0.9562182, -2.747059, 1, 0.2588235, 0, 1,
-1.732616, 0.02144059, -2.377152, 1, 0.2627451, 0, 1,
-1.658594, -0.6853542, -2.143719, 1, 0.2705882, 0, 1,
-1.65435, 0.8508947, -0.9987794, 1, 0.2745098, 0, 1,
-1.651489, 0.3901196, -0.00590468, 1, 0.282353, 0, 1,
-1.646158, 1.295553, -2.769158, 1, 0.2862745, 0, 1,
-1.616747, 0.1979906, -2.429075, 1, 0.2941177, 0, 1,
-1.590738, 0.4309514, -2.008177, 1, 0.3019608, 0, 1,
-1.586566, 0.6450908, -1.335965, 1, 0.3058824, 0, 1,
-1.583161, 0.6902376, -2.217438, 1, 0.3137255, 0, 1,
-1.574587, 0.04081478, -1.722962, 1, 0.3176471, 0, 1,
-1.566224, -0.2376073, -1.621059, 1, 0.3254902, 0, 1,
-1.561057, -0.3409958, -1.252816, 1, 0.3294118, 0, 1,
-1.550735, -0.6045085, -1.601162, 1, 0.3372549, 0, 1,
-1.550533, -0.3555556, -1.743667, 1, 0.3411765, 0, 1,
-1.546075, 2.22296, -1.547533, 1, 0.3490196, 0, 1,
-1.538172, 0.6811897, -0.0761018, 1, 0.3529412, 0, 1,
-1.529073, -0.1841109, -2.022417, 1, 0.3607843, 0, 1,
-1.528576, -1.629334, -3.743475, 1, 0.3647059, 0, 1,
-1.525208, -0.3100673, -1.232354, 1, 0.372549, 0, 1,
-1.515945, -0.2937502, -1.056899, 1, 0.3764706, 0, 1,
-1.511451, -0.135497, -1.746027, 1, 0.3843137, 0, 1,
-1.504356, 0.08111235, -1.826361, 1, 0.3882353, 0, 1,
-1.501624, 1.544745, 0.4724356, 1, 0.3960784, 0, 1,
-1.498075, 1.125702, -2.265089, 1, 0.4039216, 0, 1,
-1.491692, 0.8982015, -0.8835533, 1, 0.4078431, 0, 1,
-1.482657, -0.5823599, -2.794186, 1, 0.4156863, 0, 1,
-1.474792, -1.740251, -2.477355, 1, 0.4196078, 0, 1,
-1.466801, -1.245173, -2.895484, 1, 0.427451, 0, 1,
-1.466082, -0.7543074, -2.184459, 1, 0.4313726, 0, 1,
-1.460545, -0.2650139, -1.943939, 1, 0.4392157, 0, 1,
-1.450229, 0.8771784, -1.897353, 1, 0.4431373, 0, 1,
-1.449114, -0.7245193, -3.347339, 1, 0.4509804, 0, 1,
-1.434545, 0.9950571, 0.3156165, 1, 0.454902, 0, 1,
-1.429807, 0.8988364, -0.3229661, 1, 0.4627451, 0, 1,
-1.423554, 1.780424, -2.273537, 1, 0.4666667, 0, 1,
-1.415042, 0.5891837, -0.7663617, 1, 0.4745098, 0, 1,
-1.414035, -0.006896093, -2.633571, 1, 0.4784314, 0, 1,
-1.403116, -1.278117, -2.149584, 1, 0.4862745, 0, 1,
-1.397715, 0.6306202, 0.1311845, 1, 0.4901961, 0, 1,
-1.392569, 0.7955099, -1.17607, 1, 0.4980392, 0, 1,
-1.388117, -1.070942, -3.239804, 1, 0.5058824, 0, 1,
-1.386248, -0.5630564, -1.559855, 1, 0.509804, 0, 1,
-1.382252, -0.867111, -1.659984, 1, 0.5176471, 0, 1,
-1.344137, 0.8351102, -0.4042499, 1, 0.5215687, 0, 1,
-1.343356, -1.32585, -2.097094, 1, 0.5294118, 0, 1,
-1.342644, 0.9484423, -1.110258, 1, 0.5333334, 0, 1,
-1.336486, -0.5443985, -0.6302233, 1, 0.5411765, 0, 1,
-1.326138, -1.148283, -2.534528, 1, 0.5450981, 0, 1,
-1.317195, 0.4415728, -0.1367266, 1, 0.5529412, 0, 1,
-1.313896, -1.066604, -1.806492, 1, 0.5568628, 0, 1,
-1.308419, -0.8316184, -0.8725282, 1, 0.5647059, 0, 1,
-1.308141, 0.5565436, -3.816773, 1, 0.5686275, 0, 1,
-1.296452, -1.060534, -1.547993, 1, 0.5764706, 0, 1,
-1.284028, -0.7458555, -2.964906, 1, 0.5803922, 0, 1,
-1.282986, -1.314445, -4.383245, 1, 0.5882353, 0, 1,
-1.281767, 0.08328128, -2.586107, 1, 0.5921569, 0, 1,
-1.270253, -0.6942018, -2.079851, 1, 0.6, 0, 1,
-1.266727, -0.01051187, 0.8740895, 1, 0.6078432, 0, 1,
-1.256961, 0.7126448, -1.709149, 1, 0.6117647, 0, 1,
-1.256831, 0.267788, -1.247337, 1, 0.6196079, 0, 1,
-1.24169, -1.216212, -3.713962, 1, 0.6235294, 0, 1,
-1.241359, -0.1149062, -1.683215, 1, 0.6313726, 0, 1,
-1.237746, 0.08547255, -0.783014, 1, 0.6352941, 0, 1,
-1.233265, -1.164816, -3.116287, 1, 0.6431373, 0, 1,
-1.230331, 0.03116689, -2.708884, 1, 0.6470588, 0, 1,
-1.229469, -0.2609328, -1.051714, 1, 0.654902, 0, 1,
-1.21623, 0.5122883, -3.934076, 1, 0.6588235, 0, 1,
-1.215696, 0.440079, -0.8534827, 1, 0.6666667, 0, 1,
-1.215572, -0.6272023, -0.8536451, 1, 0.6705883, 0, 1,
-1.200357, 0.1387207, -0.05357083, 1, 0.6784314, 0, 1,
-1.195077, 0.1901018, -2.812337, 1, 0.682353, 0, 1,
-1.181713, -0.2731962, -1.863208, 1, 0.6901961, 0, 1,
-1.172098, -0.2245492, -0.6892489, 1, 0.6941177, 0, 1,
-1.169736, 0.5645611, -2.198059, 1, 0.7019608, 0, 1,
-1.164307, 0.2653419, -0.0159041, 1, 0.7098039, 0, 1,
-1.162688, 1.10892, -1.330403, 1, 0.7137255, 0, 1,
-1.157679, -1.563044, -2.438305, 1, 0.7215686, 0, 1,
-1.14837, -0.9334899, -4.040053, 1, 0.7254902, 0, 1,
-1.134295, 1.13447, -1.064617, 1, 0.7333333, 0, 1,
-1.124525, 1.463958, -0.8446753, 1, 0.7372549, 0, 1,
-1.123362, 0.3190241, -0.7352495, 1, 0.7450981, 0, 1,
-1.111146, 0.7076134, -1.704532, 1, 0.7490196, 0, 1,
-1.106404, 1.609017, -1.819172, 1, 0.7568628, 0, 1,
-1.099413, 0.009673412, -1.304924, 1, 0.7607843, 0, 1,
-1.097492, -1.764338, -1.027933, 1, 0.7686275, 0, 1,
-1.086028, 0.416943, -0.5778823, 1, 0.772549, 0, 1,
-1.084861, 0.7714807, -1.913449, 1, 0.7803922, 0, 1,
-1.070657, -1.575004, -1.356416, 1, 0.7843137, 0, 1,
-1.069922, 0.9838147, 0.03720032, 1, 0.7921569, 0, 1,
-1.064788, -1.16112, -1.067535, 1, 0.7960784, 0, 1,
-1.064633, -1.183458, -4.097162, 1, 0.8039216, 0, 1,
-1.063017, 0.9876923, -2.28708, 1, 0.8117647, 0, 1,
-1.055532, -1.413537, -2.333107, 1, 0.8156863, 0, 1,
-1.054625, 0.01072812, -1.190125, 1, 0.8235294, 0, 1,
-1.052622, -0.1908893, -2.633456, 1, 0.827451, 0, 1,
-1.050834, -0.5188145, -3.286752, 1, 0.8352941, 0, 1,
-1.047974, -0.6696513, -2.056811, 1, 0.8392157, 0, 1,
-1.04188, 0.4573963, -1.496107, 1, 0.8470588, 0, 1,
-1.017513, -0.2852421, -2.922454, 1, 0.8509804, 0, 1,
-1.014506, 0.4302917, -0.7232684, 1, 0.8588235, 0, 1,
-1.007945, 1.917256, -0.7651324, 1, 0.8627451, 0, 1,
-1.007774, -0.1385503, -2.418389, 1, 0.8705882, 0, 1,
-1.006904, 0.6959567, -3.432063, 1, 0.8745098, 0, 1,
-1.006838, 2.299554, 0.3859362, 1, 0.8823529, 0, 1,
-1.006322, -1.238203, -2.622084, 1, 0.8862745, 0, 1,
-0.9995237, 0.2514189, -0.5835459, 1, 0.8941177, 0, 1,
-0.9965463, 0.1428862, -0.888656, 1, 0.8980392, 0, 1,
-0.9961522, 1.300813, -0.5784583, 1, 0.9058824, 0, 1,
-0.9928912, -2.022689, -2.320175, 1, 0.9137255, 0, 1,
-0.9919288, 0.8535268, 0.2038381, 1, 0.9176471, 0, 1,
-0.9882634, -0.5606098, -1.915984, 1, 0.9254902, 0, 1,
-0.9866795, -1.200363, -0.8968677, 1, 0.9294118, 0, 1,
-0.9865649, -1.094474, -3.089783, 1, 0.9372549, 0, 1,
-0.9863425, 0.2835512, -2.744623, 1, 0.9411765, 0, 1,
-0.980098, 0.07477963, -2.200026, 1, 0.9490196, 0, 1,
-0.9790704, -0.2871554, -2.667378, 1, 0.9529412, 0, 1,
-0.9738685, 1.231602, -2.436283, 1, 0.9607843, 0, 1,
-0.9728303, 0.7808974, -0.8714649, 1, 0.9647059, 0, 1,
-0.972538, -0.9401282, -4.162315, 1, 0.972549, 0, 1,
-0.9713671, -1.033759, -1.533388, 1, 0.9764706, 0, 1,
-0.9636406, -0.3950263, -0.4854875, 1, 0.9843137, 0, 1,
-0.9524778, 0.2516116, -2.054883, 1, 0.9882353, 0, 1,
-0.9521462, -0.5918117, -3.666945, 1, 0.9960784, 0, 1,
-0.9270511, 0.2483659, -0.619677, 0.9960784, 1, 0, 1,
-0.9268844, -2.355431, -2.661508, 0.9921569, 1, 0, 1,
-0.9238796, 1.035798, -1.311377, 0.9843137, 1, 0, 1,
-0.9208828, -0.08314115, -1.490659, 0.9803922, 1, 0, 1,
-0.915208, -0.4405567, -1.266787, 0.972549, 1, 0, 1,
-0.9143757, 1.227741, -0.1621221, 0.9686275, 1, 0, 1,
-0.9067852, -0.298664, -0.2398203, 0.9607843, 1, 0, 1,
-0.9036728, -1.476379, -1.492291, 0.9568627, 1, 0, 1,
-0.8974491, -0.1816943, -3.104542, 0.9490196, 1, 0, 1,
-0.8973161, 0.1234657, -0.8953927, 0.945098, 1, 0, 1,
-0.8860328, -0.07893963, -0.5748979, 0.9372549, 1, 0, 1,
-0.8770039, 1.437251, -3.265633, 0.9333333, 1, 0, 1,
-0.8716536, -1.145762, -2.029608, 0.9254902, 1, 0, 1,
-0.8695076, 0.4314004, -1.358973, 0.9215686, 1, 0, 1,
-0.8638416, 0.6110585, -2.202468, 0.9137255, 1, 0, 1,
-0.8551039, 1.069456, -0.5841175, 0.9098039, 1, 0, 1,
-0.8508884, 1.810033, -0.5378738, 0.9019608, 1, 0, 1,
-0.8479927, 0.2807868, -0.891399, 0.8941177, 1, 0, 1,
-0.847147, 0.6028783, -1.09327, 0.8901961, 1, 0, 1,
-0.8464519, 1.777988, -0.7188517, 0.8823529, 1, 0, 1,
-0.83968, 0.5620745, -1.932632, 0.8784314, 1, 0, 1,
-0.8384111, -0.0283184, -0.814109, 0.8705882, 1, 0, 1,
-0.8367425, 0.7549829, -1.698885, 0.8666667, 1, 0, 1,
-0.835894, 0.7699444, -1.584598, 0.8588235, 1, 0, 1,
-0.8354993, -0.2333152, -1.581272, 0.854902, 1, 0, 1,
-0.8303084, 0.947705, -1.793184, 0.8470588, 1, 0, 1,
-0.8199974, 0.1097932, -1.974548, 0.8431373, 1, 0, 1,
-0.8174421, 0.1869802, -0.4305558, 0.8352941, 1, 0, 1,
-0.8103135, -1.839245, -0.7662376, 0.8313726, 1, 0, 1,
-0.8040149, 0.2092875, -2.628487, 0.8235294, 1, 0, 1,
-0.7988563, 0.7566442, -0.4935669, 0.8196079, 1, 0, 1,
-0.7967247, -1.577057, -0.9076756, 0.8117647, 1, 0, 1,
-0.7955662, 0.1954111, 0.02076852, 0.8078431, 1, 0, 1,
-0.7939495, 0.9278616, -1.677815, 0.8, 1, 0, 1,
-0.7935458, 1.054147, 0.09163833, 0.7921569, 1, 0, 1,
-0.7930682, -0.2729988, -3.993713, 0.7882353, 1, 0, 1,
-0.7927825, -1.86366, -0.7314376, 0.7803922, 1, 0, 1,
-0.7913225, 0.1804515, -0.4728121, 0.7764706, 1, 0, 1,
-0.7864578, -0.534071, -1.343683, 0.7686275, 1, 0, 1,
-0.7855282, -0.06762525, -3.774152, 0.7647059, 1, 0, 1,
-0.7849479, 0.4013976, -1.339754, 0.7568628, 1, 0, 1,
-0.7745959, 0.2301362, -1.87659, 0.7529412, 1, 0, 1,
-0.7733006, -1.609312, -2.981251, 0.7450981, 1, 0, 1,
-0.7695833, -0.2460572, -1.162263, 0.7411765, 1, 0, 1,
-0.7663193, 2.113932, -0.687634, 0.7333333, 1, 0, 1,
-0.7659394, 0.1885485, -0.68995, 0.7294118, 1, 0, 1,
-0.7645872, 2.154195, 0.5787235, 0.7215686, 1, 0, 1,
-0.761167, 0.3233202, 0.7046578, 0.7176471, 1, 0, 1,
-0.7591375, -0.2313869, -2.987102, 0.7098039, 1, 0, 1,
-0.7546342, 0.6009039, -2.732272, 0.7058824, 1, 0, 1,
-0.7519822, -0.6517975, -1.494423, 0.6980392, 1, 0, 1,
-0.7518379, -0.2697247, -1.151535, 0.6901961, 1, 0, 1,
-0.7516529, -1.35436, -1.789665, 0.6862745, 1, 0, 1,
-0.7513055, 0.3385019, -0.03611894, 0.6784314, 1, 0, 1,
-0.7503474, -0.1104464, -2.305808, 0.6745098, 1, 0, 1,
-0.7439976, 1.841429, -2.104475, 0.6666667, 1, 0, 1,
-0.7415988, 0.6647232, 0.7455232, 0.6627451, 1, 0, 1,
-0.7415982, 2.467444, 1.186959, 0.654902, 1, 0, 1,
-0.7402144, 1.668291, -1.693967, 0.6509804, 1, 0, 1,
-0.7392296, -1.432613, -2.3069, 0.6431373, 1, 0, 1,
-0.7380162, 0.0955588, -2.573128, 0.6392157, 1, 0, 1,
-0.7345127, 1.922459, -1.245163, 0.6313726, 1, 0, 1,
-0.7336665, -1.152148, -2.081358, 0.627451, 1, 0, 1,
-0.7335239, 1.051942, -2.594169, 0.6196079, 1, 0, 1,
-0.7290518, 0.04726923, -3.370826, 0.6156863, 1, 0, 1,
-0.7225568, 2.194118, -1.61333, 0.6078432, 1, 0, 1,
-0.7218314, 0.7450539, -1.340529, 0.6039216, 1, 0, 1,
-0.7206734, -0.3764545, -2.323332, 0.5960785, 1, 0, 1,
-0.7193155, 0.9291305, -1.571814, 0.5882353, 1, 0, 1,
-0.7189241, -0.425453, -1.58256, 0.5843138, 1, 0, 1,
-0.7145905, -0.3436115, -2.914476, 0.5764706, 1, 0, 1,
-0.7116638, 0.2603693, -1.321876, 0.572549, 1, 0, 1,
-0.706927, -0.9204147, -3.401317, 0.5647059, 1, 0, 1,
-0.7035946, -1.561619, -2.771548, 0.5607843, 1, 0, 1,
-0.6973886, -0.2848002, -1.798452, 0.5529412, 1, 0, 1,
-0.6933984, 0.1783689, -0.3276724, 0.5490196, 1, 0, 1,
-0.6923601, 0.1577746, -0.4605944, 0.5411765, 1, 0, 1,
-0.6901724, -0.3552195, -2.508163, 0.5372549, 1, 0, 1,
-0.6888493, -1.339535, -1.180654, 0.5294118, 1, 0, 1,
-0.6860831, -0.1512383, -1.755271, 0.5254902, 1, 0, 1,
-0.6838932, 1.116476, -0.9310454, 0.5176471, 1, 0, 1,
-0.6795425, 0.2417352, -0.3497595, 0.5137255, 1, 0, 1,
-0.6707111, -0.5904701, -2.045438, 0.5058824, 1, 0, 1,
-0.6693025, 2.09221, -0.1106195, 0.5019608, 1, 0, 1,
-0.6660763, -0.8860608, -1.10506, 0.4941176, 1, 0, 1,
-0.6653719, 1.422387, 0.2363248, 0.4862745, 1, 0, 1,
-0.6607669, -1.239364, -0.7579122, 0.4823529, 1, 0, 1,
-0.6570991, -0.5005159, -1.819458, 0.4745098, 1, 0, 1,
-0.6552333, -0.9724234, -1.89972, 0.4705882, 1, 0, 1,
-0.6551914, -1.300014, -2.370541, 0.4627451, 1, 0, 1,
-0.6546612, -0.06828292, -2.781387, 0.4588235, 1, 0, 1,
-0.6487572, 1.02857, 0.5315626, 0.4509804, 1, 0, 1,
-0.6480157, 1.907945, 0.0774641, 0.4470588, 1, 0, 1,
-0.6408578, 0.8347859, -1.999104, 0.4392157, 1, 0, 1,
-0.6350914, 1.514627, -0.4165222, 0.4352941, 1, 0, 1,
-0.6321216, -1.016622, -2.011444, 0.427451, 1, 0, 1,
-0.6300995, 1.451065, -1.686748, 0.4235294, 1, 0, 1,
-0.6284851, -0.3356329, -2.259025, 0.4156863, 1, 0, 1,
-0.628128, -0.41225, -2.41531, 0.4117647, 1, 0, 1,
-0.6279601, 0.5170481, 0.6144792, 0.4039216, 1, 0, 1,
-0.6276047, 1.154515, 1.632087, 0.3960784, 1, 0, 1,
-0.6211638, 0.6791497, -1.870774, 0.3921569, 1, 0, 1,
-0.6200777, 0.4597686, -0.4598122, 0.3843137, 1, 0, 1,
-0.6147997, -0.6414019, -3.539696, 0.3803922, 1, 0, 1,
-0.613488, -0.4267988, -1.039112, 0.372549, 1, 0, 1,
-0.6068977, -0.6450382, -3.582854, 0.3686275, 1, 0, 1,
-0.6038996, -1.304952, -1.956501, 0.3607843, 1, 0, 1,
-0.5951205, 1.743543, -2.110358, 0.3568628, 1, 0, 1,
-0.5949048, -0.1470624, -1.806422, 0.3490196, 1, 0, 1,
-0.5874725, -1.935672, -2.785341, 0.345098, 1, 0, 1,
-0.5848091, -1.179603, -3.6888, 0.3372549, 1, 0, 1,
-0.5757354, 0.5200232, -1.095236, 0.3333333, 1, 0, 1,
-0.5703046, -0.05711596, -1.264441, 0.3254902, 1, 0, 1,
-0.5699086, 0.1052775, -1.5668, 0.3215686, 1, 0, 1,
-0.5688074, 0.3282942, -2.006395, 0.3137255, 1, 0, 1,
-0.5643474, -0.6234272, -2.685752, 0.3098039, 1, 0, 1,
-0.5612879, -0.7287731, -2.778685, 0.3019608, 1, 0, 1,
-0.5555625, -1.015695, -4.105972, 0.2941177, 1, 0, 1,
-0.5554031, 0.1540292, -0.7836766, 0.2901961, 1, 0, 1,
-0.5546216, -1.863482, -2.366986, 0.282353, 1, 0, 1,
-0.5521519, -1.180943, -2.374835, 0.2784314, 1, 0, 1,
-0.5520558, 1.829853, -0.7229206, 0.2705882, 1, 0, 1,
-0.5483456, -0.3517872, -1.094501, 0.2666667, 1, 0, 1,
-0.547228, 1.705885, -0.6148748, 0.2588235, 1, 0, 1,
-0.5461475, -0.4245976, -2.966053, 0.254902, 1, 0, 1,
-0.5460657, 1.205309, -1.077449, 0.2470588, 1, 0, 1,
-0.5436385, -0.862918, -1.432102, 0.2431373, 1, 0, 1,
-0.5431442, -0.3216274, -1.79909, 0.2352941, 1, 0, 1,
-0.539238, -1.031563, -1.057163, 0.2313726, 1, 0, 1,
-0.5334412, 0.05993566, -1.111412, 0.2235294, 1, 0, 1,
-0.531734, 1.628463, -0.7707868, 0.2196078, 1, 0, 1,
-0.5294986, -0.4198463, -1.394427, 0.2117647, 1, 0, 1,
-0.5278668, -1.263772, -3.901481, 0.2078431, 1, 0, 1,
-0.5217548, 1.093631, 1.203747, 0.2, 1, 0, 1,
-0.5207577, -0.1695561, -3.538564, 0.1921569, 1, 0, 1,
-0.5174032, 1.184212, 1.030626, 0.1882353, 1, 0, 1,
-0.5158324, -1.23001, -2.436713, 0.1803922, 1, 0, 1,
-0.5155811, -0.4907366, -3.873648, 0.1764706, 1, 0, 1,
-0.5141214, -0.2949917, -1.731054, 0.1686275, 1, 0, 1,
-0.5139751, 1.451635, -2.151738, 0.1647059, 1, 0, 1,
-0.5106621, -1.159701, -3.945487, 0.1568628, 1, 0, 1,
-0.5099682, -0.0973486, -2.863814, 0.1529412, 1, 0, 1,
-0.5056563, -0.14174, -1.553279, 0.145098, 1, 0, 1,
-0.5054284, -0.08644512, -2.170651, 0.1411765, 1, 0, 1,
-0.5044801, -0.1252894, -1.180654, 0.1333333, 1, 0, 1,
-0.5011007, 0.3469911, -1.963611, 0.1294118, 1, 0, 1,
-0.5008571, 2.325871, 0.5393403, 0.1215686, 1, 0, 1,
-0.4990102, -0.3556705, -1.484736, 0.1176471, 1, 0, 1,
-0.4921689, -0.4219971, -2.162434, 0.1098039, 1, 0, 1,
-0.4912363, -1.020942, -2.888517, 0.1058824, 1, 0, 1,
-0.487182, 0.7272078, -0.6920956, 0.09803922, 1, 0, 1,
-0.4813821, 0.6793435, -1.803978, 0.09019608, 1, 0, 1,
-0.4759667, -0.7374264, -2.719538, 0.08627451, 1, 0, 1,
-0.4740828, 0.6602254, -3.479735, 0.07843138, 1, 0, 1,
-0.4709529, -1.334729, -2.039939, 0.07450981, 1, 0, 1,
-0.4707453, 0.2930929, -2.035081, 0.06666667, 1, 0, 1,
-0.4685513, -0.4061378, -1.218837, 0.0627451, 1, 0, 1,
-0.4682862, -1.314768, -3.732261, 0.05490196, 1, 0, 1,
-0.4638079, 0.1165638, -2.766013, 0.05098039, 1, 0, 1,
-0.4614957, 1.006157, 0.3841366, 0.04313726, 1, 0, 1,
-0.4614607, 0.3112276, -0.6365943, 0.03921569, 1, 0, 1,
-0.4527605, 0.546096, -3.414579, 0.03137255, 1, 0, 1,
-0.4527398, 0.5283668, -0.6919183, 0.02745098, 1, 0, 1,
-0.4492103, 0.3996089, -1.157759, 0.01960784, 1, 0, 1,
-0.4358467, 0.6271678, -1.212562, 0.01568628, 1, 0, 1,
-0.4338731, 1.103947, -1.12312, 0.007843138, 1, 0, 1,
-0.4316432, 0.7447717, 0.5497236, 0.003921569, 1, 0, 1,
-0.431253, 0.08321141, -0.6283908, 0, 1, 0.003921569, 1,
-0.4284751, 0.2341421, 0.1385077, 0, 1, 0.01176471, 1,
-0.427476, -0.9403675, -2.040084, 0, 1, 0.01568628, 1,
-0.4157746, -1.000503, -4.299135, 0, 1, 0.02352941, 1,
-0.4108668, -1.749046, -2.674779, 0, 1, 0.02745098, 1,
-0.4103561, -0.05033883, -3.225817, 0, 1, 0.03529412, 1,
-0.4068187, 0.8864116, -0.361946, 0, 1, 0.03921569, 1,
-0.4038442, 1.01686, 1.146961, 0, 1, 0.04705882, 1,
-0.3994688, -1.064727, -3.120769, 0, 1, 0.05098039, 1,
-0.3983852, 0.4431899, -1.363613, 0, 1, 0.05882353, 1,
-0.3907261, -1.423046, -2.890254, 0, 1, 0.0627451, 1,
-0.385394, -1.004452, -3.061332, 0, 1, 0.07058824, 1,
-0.3833916, -1.154148, -1.879642, 0, 1, 0.07450981, 1,
-0.3793574, -1.392087, -3.936088, 0, 1, 0.08235294, 1,
-0.3786945, -1.040321, -1.744312, 0, 1, 0.08627451, 1,
-0.377986, 1.760137, -1.805711, 0, 1, 0.09411765, 1,
-0.3730977, 0.1554718, -1.800233, 0, 1, 0.1019608, 1,
-0.3652488, -0.05399866, -1.938562, 0, 1, 0.1058824, 1,
-0.3611786, 1.165077, 0.8059217, 0, 1, 0.1137255, 1,
-0.3602127, 1.429725, -1.133448, 0, 1, 0.1176471, 1,
-0.3593871, -1.64712, -4.429006, 0, 1, 0.1254902, 1,
-0.3581882, -1.106028, -2.338033, 0, 1, 0.1294118, 1,
-0.3552568, -1.793555, -2.129512, 0, 1, 0.1372549, 1,
-0.3508292, -0.8336772, -2.285055, 0, 1, 0.1411765, 1,
-0.3473254, -0.9778273, -3.829796, 0, 1, 0.1490196, 1,
-0.3448404, 1.169563, -0.3590306, 0, 1, 0.1529412, 1,
-0.3438244, 0.3894411, -1.979614, 0, 1, 0.1607843, 1,
-0.3401916, -1.520115, -2.856943, 0, 1, 0.1647059, 1,
-0.338587, 0.5245581, 0.2919837, 0, 1, 0.172549, 1,
-0.3343874, -0.3586898, -4.017956, 0, 1, 0.1764706, 1,
-0.3297053, 1.242828, -0.02825474, 0, 1, 0.1843137, 1,
-0.3284231, -0.567164, -2.570375, 0, 1, 0.1882353, 1,
-0.3282821, 0.4601297, -1.266421, 0, 1, 0.1960784, 1,
-0.323514, 0.8666226, 0.8421819, 0, 1, 0.2039216, 1,
-0.3205625, -0.1923788, -2.671921, 0, 1, 0.2078431, 1,
-0.3094705, -0.1144704, -2.758262, 0, 1, 0.2156863, 1,
-0.309105, 1.367526, -1.673162, 0, 1, 0.2196078, 1,
-0.3071862, -1.719904, -0.1458657, 0, 1, 0.227451, 1,
-0.3023038, -0.1941216, -1.998539, 0, 1, 0.2313726, 1,
-0.2967806, 2.020114, -0.3626151, 0, 1, 0.2392157, 1,
-0.2962231, -1.196963, -1.011626, 0, 1, 0.2431373, 1,
-0.2943245, -0.9372202, -4.467565, 0, 1, 0.2509804, 1,
-0.2941409, -0.1631452, -2.501897, 0, 1, 0.254902, 1,
-0.2924801, 0.4341393, 0.04197013, 0, 1, 0.2627451, 1,
-0.288482, -0.4600174, -2.44611, 0, 1, 0.2666667, 1,
-0.2855902, 0.09546496, -1.397165, 0, 1, 0.2745098, 1,
-0.2782993, -0.5985273, -2.243062, 0, 1, 0.2784314, 1,
-0.2756136, 0.4500036, -0.3503644, 0, 1, 0.2862745, 1,
-0.2696607, 0.6035485, -0.2230063, 0, 1, 0.2901961, 1,
-0.2691605, -1.49798, -3.382528, 0, 1, 0.2980392, 1,
-0.2689846, -0.7022054, -2.288384, 0, 1, 0.3058824, 1,
-0.26728, -0.9709532, -2.604552, 0, 1, 0.3098039, 1,
-0.259336, 1.125887, 1.169862, 0, 1, 0.3176471, 1,
-0.2591867, 1.01912, 1.263183, 0, 1, 0.3215686, 1,
-0.2508916, 0.3349949, -3.019707, 0, 1, 0.3294118, 1,
-0.2488176, -0.2675229, -4.010561, 0, 1, 0.3333333, 1,
-0.2454875, -0.9880399, -3.406886, 0, 1, 0.3411765, 1,
-0.2376329, -0.5685061, -4.281988, 0, 1, 0.345098, 1,
-0.2308134, -2.237388, -2.10077, 0, 1, 0.3529412, 1,
-0.2288142, 0.1166398, -1.077971, 0, 1, 0.3568628, 1,
-0.2268461, -0.8930339, -4.980733, 0, 1, 0.3647059, 1,
-0.22261, 1.003491, -0.0530397, 0, 1, 0.3686275, 1,
-0.2175797, -1.036992, -3.297503, 0, 1, 0.3764706, 1,
-0.2153055, 0.2953462, 0.5393986, 0, 1, 0.3803922, 1,
-0.210153, -0.2209907, -1.908665, 0, 1, 0.3882353, 1,
-0.2089552, 0.3254533, -1.26213, 0, 1, 0.3921569, 1,
-0.2061258, -0.2678684, -1.593648, 0, 1, 0.4, 1,
-0.2043934, 0.9868793, 0.2611533, 0, 1, 0.4078431, 1,
-0.203962, 0.3206006, -0.6678222, 0, 1, 0.4117647, 1,
-0.2038416, -0.8511255, -2.775516, 0, 1, 0.4196078, 1,
-0.198776, 1.037686, -1.335039, 0, 1, 0.4235294, 1,
-0.1981584, -0.08683066, -2.308393, 0, 1, 0.4313726, 1,
-0.196911, 1.356487, -1.63834, 0, 1, 0.4352941, 1,
-0.1946706, 1.466511, -0.5652018, 0, 1, 0.4431373, 1,
-0.1933179, -0.7750965, -2.773261, 0, 1, 0.4470588, 1,
-0.1923306, 0.5917688, 1.879192, 0, 1, 0.454902, 1,
-0.1905382, -1.503338, -1.292428, 0, 1, 0.4588235, 1,
-0.1899135, 0.3269197, -0.04910119, 0, 1, 0.4666667, 1,
-0.1849654, 0.1409501, 0.4458468, 0, 1, 0.4705882, 1,
-0.1803367, -0.854109, -2.805873, 0, 1, 0.4784314, 1,
-0.1780057, -1.367934, -2.96161, 0, 1, 0.4823529, 1,
-0.1737809, 0.130349, 1.29155, 0, 1, 0.4901961, 1,
-0.1726106, 1.72129, -0.2638969, 0, 1, 0.4941176, 1,
-0.1712301, 0.2442689, -0.9712908, 0, 1, 0.5019608, 1,
-0.1671235, 0.5183184, 0.5829724, 0, 1, 0.509804, 1,
-0.1660111, 1.184609, -0.3137141, 0, 1, 0.5137255, 1,
-0.1626783, -0.4130136, -2.624199, 0, 1, 0.5215687, 1,
-0.1625928, -0.8782495, -3.11899, 0, 1, 0.5254902, 1,
-0.159989, 0.5388353, -1.99036, 0, 1, 0.5333334, 1,
-0.1550935, 0.3508287, -1.428037, 0, 1, 0.5372549, 1,
-0.1523143, -0.6836236, -3.775886, 0, 1, 0.5450981, 1,
-0.1510982, 3.425249, 0.7556973, 0, 1, 0.5490196, 1,
-0.1493341, -0.2785606, -3.506612, 0, 1, 0.5568628, 1,
-0.1448744, 0.1017203, -0.2740499, 0, 1, 0.5607843, 1,
-0.1372776, 0.4292853, -0.7529483, 0, 1, 0.5686275, 1,
-0.1335797, -1.373756, -4.236716, 0, 1, 0.572549, 1,
-0.1320351, 0.3516421, -1.728769, 0, 1, 0.5803922, 1,
-0.1316409, -0.01498662, -0.8940979, 0, 1, 0.5843138, 1,
-0.1197184, 0.01650388, -2.746282, 0, 1, 0.5921569, 1,
-0.1153726, -0.1581514, -2.050539, 0, 1, 0.5960785, 1,
-0.1131156, -0.6712657, -2.517164, 0, 1, 0.6039216, 1,
-0.1128105, 0.1904377, -0.6822868, 0, 1, 0.6117647, 1,
-0.1127622, -1.461093, -3.062603, 0, 1, 0.6156863, 1,
-0.1113045, -0.8547223, -1.577978, 0, 1, 0.6235294, 1,
-0.1072214, 0.4869, -0.5605168, 0, 1, 0.627451, 1,
-0.1066797, -1.39149, -4.52598, 0, 1, 0.6352941, 1,
-0.09827789, -0.44195, -3.965782, 0, 1, 0.6392157, 1,
-0.09632203, 1.525594, 0.7293451, 0, 1, 0.6470588, 1,
-0.09435862, -0.4465811, -3.67197, 0, 1, 0.6509804, 1,
-0.09366295, 1.22136, 1.274351, 0, 1, 0.6588235, 1,
-0.09005582, 0.08736651, -0.3048407, 0, 1, 0.6627451, 1,
-0.08852576, -0.1612453, -1.471852, 0, 1, 0.6705883, 1,
-0.08529773, -0.7365155, -3.118335, 0, 1, 0.6745098, 1,
-0.08359099, -0.1515111, -2.047991, 0, 1, 0.682353, 1,
-0.08225001, 1.405188, -0.4581873, 0, 1, 0.6862745, 1,
-0.07251661, 0.3411931, 0.8161552, 0, 1, 0.6941177, 1,
-0.0695518, -0.4987828, -4.494845, 0, 1, 0.7019608, 1,
-0.06415684, 1.084633, 0.3150147, 0, 1, 0.7058824, 1,
-0.06377937, -1.533814, -2.518093, 0, 1, 0.7137255, 1,
-0.0620794, -1.619018, -2.734726, 0, 1, 0.7176471, 1,
-0.06064687, -0.7158136, -5.486847, 0, 1, 0.7254902, 1,
-0.05700488, 1.006928, -0.7731737, 0, 1, 0.7294118, 1,
-0.05693483, -1.204871, -3.143063, 0, 1, 0.7372549, 1,
-0.05140954, -0.2963572, -2.206845, 0, 1, 0.7411765, 1,
-0.04260695, 1.129593, -0.1396996, 0, 1, 0.7490196, 1,
-0.04214336, -0.2392751, -3.025728, 0, 1, 0.7529412, 1,
-0.04053969, 0.2176853, -0.2673695, 0, 1, 0.7607843, 1,
-0.03986634, 1.530108, 1.648359, 0, 1, 0.7647059, 1,
-0.03901622, -1.144416, -3.364621, 0, 1, 0.772549, 1,
-0.03709504, -0.3536049, -2.531044, 0, 1, 0.7764706, 1,
-0.03153508, -0.9817319, -2.933428, 0, 1, 0.7843137, 1,
-0.03004897, -1.512985, -3.764321, 0, 1, 0.7882353, 1,
-0.02952996, -0.0627184, -3.89737, 0, 1, 0.7960784, 1,
-0.02786891, -1.613822, -2.457752, 0, 1, 0.8039216, 1,
-0.02619669, 1.653047, 0.462973, 0, 1, 0.8078431, 1,
-0.02348539, -0.9938273, -3.712092, 0, 1, 0.8156863, 1,
-0.02320936, 0.9364685, 0.5071473, 0, 1, 0.8196079, 1,
-0.02317416, -0.4684709, -3.138928, 0, 1, 0.827451, 1,
-0.02289944, -2.418616, -0.9695214, 0, 1, 0.8313726, 1,
-0.02265985, -0.3751962, -2.19599, 0, 1, 0.8392157, 1,
-0.01841752, -0.4685071, -2.688237, 0, 1, 0.8431373, 1,
-0.01512311, 0.8454419, 0.1201292, 0, 1, 0.8509804, 1,
-0.01251827, -0.8349676, -3.107601, 0, 1, 0.854902, 1,
-0.01062152, -0.04079054, -5.357932, 0, 1, 0.8627451, 1,
-0.005251364, -0.03432228, -2.555561, 0, 1, 0.8666667, 1,
0.002347718, 1.128695, -0.3312056, 0, 1, 0.8745098, 1,
0.005483684, 0.4003028, -0.122629, 0, 1, 0.8784314, 1,
0.007235625, 0.4371256, -1.267153, 0, 1, 0.8862745, 1,
0.007571147, -0.2002306, 1.924264, 0, 1, 0.8901961, 1,
0.008152354, -0.7482816, 4.278287, 0, 1, 0.8980392, 1,
0.01412217, 0.4395972, 0.1028106, 0, 1, 0.9058824, 1,
0.01486608, 1.599831, -0.8687481, 0, 1, 0.9098039, 1,
0.01989239, 0.1991328, -0.7789558, 0, 1, 0.9176471, 1,
0.02073755, 1.317949, 0.8033583, 0, 1, 0.9215686, 1,
0.02152866, 0.1946698, 0.9557506, 0, 1, 0.9294118, 1,
0.03108046, 0.1450094, 1.545144, 0, 1, 0.9333333, 1,
0.03801065, -0.04754503, 4.140746, 0, 1, 0.9411765, 1,
0.03864955, -1.946219, 2.424797, 0, 1, 0.945098, 1,
0.04330944, 1.573564, 1.14245, 0, 1, 0.9529412, 1,
0.04447811, -0.3846487, 3.510172, 0, 1, 0.9568627, 1,
0.04973852, -0.3094168, 1.947867, 0, 1, 0.9647059, 1,
0.05287396, -0.9676259, 2.264231, 0, 1, 0.9686275, 1,
0.05798921, -1.722185, 4.499612, 0, 1, 0.9764706, 1,
0.06596302, 0.6865634, 2.108298, 0, 1, 0.9803922, 1,
0.06912713, -1.254127, 2.892098, 0, 1, 0.9882353, 1,
0.06914203, 0.03959926, 0.1325374, 0, 1, 0.9921569, 1,
0.06983905, -0.07445423, 3.37921, 0, 1, 1, 1,
0.07642338, -0.4140212, 4.880572, 0, 0.9921569, 1, 1,
0.07822781, -1.319393, 2.09516, 0, 0.9882353, 1, 1,
0.0814136, -0.2250745, 2.185085, 0, 0.9803922, 1, 1,
0.08155026, 0.9970923, -0.4362276, 0, 0.9764706, 1, 1,
0.09083643, 0.03468923, 1.231777, 0, 0.9686275, 1, 1,
0.09382314, -1.11688, 1.576425, 0, 0.9647059, 1, 1,
0.0996822, -1.528608, 3.691934, 0, 0.9568627, 1, 1,
0.1020521, 1.379928, 1.697253, 0, 0.9529412, 1, 1,
0.1059873, 1.101542, -0.9073268, 0, 0.945098, 1, 1,
0.1067571, 0.630029, -0.8041031, 0, 0.9411765, 1, 1,
0.111663, 1.203669, -1.386441, 0, 0.9333333, 1, 1,
0.1163087, 0.1307459, 0.9406164, 0, 0.9294118, 1, 1,
0.1208499, -0.7944058, 5.480221, 0, 0.9215686, 1, 1,
0.1213977, -1.619795, 3.567117, 0, 0.9176471, 1, 1,
0.1227043, -0.9337669, 0.5387672, 0, 0.9098039, 1, 1,
0.1228427, 0.7132718, 0.9751901, 0, 0.9058824, 1, 1,
0.1282432, -0.1940055, 1.572419, 0, 0.8980392, 1, 1,
0.1288066, -0.5441774, 2.644698, 0, 0.8901961, 1, 1,
0.133479, -0.608007, 2.569063, 0, 0.8862745, 1, 1,
0.1339779, 1.889133, 0.9174972, 0, 0.8784314, 1, 1,
0.1425682, 0.6270879, 0.4430583, 0, 0.8745098, 1, 1,
0.1426295, 0.8689246, 1.373749, 0, 0.8666667, 1, 1,
0.1426419, 0.3241111, -0.3617874, 0, 0.8627451, 1, 1,
0.1437033, -1.624928, 1.537244, 0, 0.854902, 1, 1,
0.1438119, -0.5906082, 1.596715, 0, 0.8509804, 1, 1,
0.1488556, 0.3669011, 2.323379, 0, 0.8431373, 1, 1,
0.1489634, -0.2813068, 4.480004, 0, 0.8392157, 1, 1,
0.1490273, 0.235685, 0.1092877, 0, 0.8313726, 1, 1,
0.1502267, -0.3536694, 2.956822, 0, 0.827451, 1, 1,
0.1515092, -0.277772, 3.805221, 0, 0.8196079, 1, 1,
0.1559587, -0.4254966, 4.348299, 0, 0.8156863, 1, 1,
0.1560573, 0.1985468, -0.01615295, 0, 0.8078431, 1, 1,
0.1603916, 0.3333744, -0.6439033, 0, 0.8039216, 1, 1,
0.161589, -1.481277, 2.67086, 0, 0.7960784, 1, 1,
0.1644872, 0.6970606, -0.2503794, 0, 0.7882353, 1, 1,
0.1658101, 1.093715, 0.2297651, 0, 0.7843137, 1, 1,
0.1709955, 0.2527405, 0.3536772, 0, 0.7764706, 1, 1,
0.1755216, -0.384268, 1.300132, 0, 0.772549, 1, 1,
0.1774714, 0.3181574, -0.8422977, 0, 0.7647059, 1, 1,
0.1784638, -0.3186997, 2.18499, 0, 0.7607843, 1, 1,
0.178675, -0.626451, 1.782032, 0, 0.7529412, 1, 1,
0.1816354, -0.3360197, 3.139363, 0, 0.7490196, 1, 1,
0.1823714, -0.6376017, 1.117829, 0, 0.7411765, 1, 1,
0.1893515, -1.192169, 3.483952, 0, 0.7372549, 1, 1,
0.1904515, 0.9104751, 1.335676, 0, 0.7294118, 1, 1,
0.1978828, -0.6638094, 4.02504, 0, 0.7254902, 1, 1,
0.1998833, 0.3824559, -0.4579036, 0, 0.7176471, 1, 1,
0.2057602, 0.009183024, 0.2662177, 0, 0.7137255, 1, 1,
0.2063012, 0.3697441, 3.023794, 0, 0.7058824, 1, 1,
0.2071576, 0.3815053, -0.2085093, 0, 0.6980392, 1, 1,
0.2163794, -0.09281863, 2.08518, 0, 0.6941177, 1, 1,
0.2165764, 0.5331837, 2.182908, 0, 0.6862745, 1, 1,
0.2177484, -0.6174766, 2.61751, 0, 0.682353, 1, 1,
0.2205257, 2.115358, -0.6537102, 0, 0.6745098, 1, 1,
0.2213314, 1.012424, -0.3555138, 0, 0.6705883, 1, 1,
0.2214317, 0.9475523, 1.651968, 0, 0.6627451, 1, 1,
0.2248606, -1.528154, 2.013747, 0, 0.6588235, 1, 1,
0.2251607, -0.2286553, 2.685907, 0, 0.6509804, 1, 1,
0.2297532, 0.5905593, -0.7030625, 0, 0.6470588, 1, 1,
0.2300822, -0.3204132, 3.648149, 0, 0.6392157, 1, 1,
0.2335221, -0.8054295, 4.026956, 0, 0.6352941, 1, 1,
0.2340829, 1.868684, 0.7035696, 0, 0.627451, 1, 1,
0.235891, -0.4652746, 0.4451634, 0, 0.6235294, 1, 1,
0.237157, -0.1056522, 3.241717, 0, 0.6156863, 1, 1,
0.2390197, 0.03584784, 1.422488, 0, 0.6117647, 1, 1,
0.2399613, -0.0636561, 3.244162, 0, 0.6039216, 1, 1,
0.2425706, -0.8076457, 5.653863, 0, 0.5960785, 1, 1,
0.2475452, -1.405679, 3.018608, 0, 0.5921569, 1, 1,
0.2480044, -0.4867983, 3.921267, 0, 0.5843138, 1, 1,
0.2547061, 0.8300957, 0.5540763, 0, 0.5803922, 1, 1,
0.2601162, -0.2299366, 1.483743, 0, 0.572549, 1, 1,
0.2614368, -0.9459258, 3.0892, 0, 0.5686275, 1, 1,
0.2643369, 0.1052293, 1.153619, 0, 0.5607843, 1, 1,
0.2656144, 0.3488221, 0.6505867, 0, 0.5568628, 1, 1,
0.2659877, 0.07357183, 1.318305, 0, 0.5490196, 1, 1,
0.2672175, 1.11994, 1.90916, 0, 0.5450981, 1, 1,
0.2681352, 0.6441711, -0.2706872, 0, 0.5372549, 1, 1,
0.273259, 1.935888, -0.8643336, 0, 0.5333334, 1, 1,
0.2837023, -0.9209036, 3.289459, 0, 0.5254902, 1, 1,
0.2844264, 0.5066536, -0.6844344, 0, 0.5215687, 1, 1,
0.2846521, 0.2691317, 2.857043, 0, 0.5137255, 1, 1,
0.2846634, 0.9415472, 1.062438, 0, 0.509804, 1, 1,
0.2857327, -0.772553, 4.591513, 0, 0.5019608, 1, 1,
0.286061, 0.4546802, -0.2455016, 0, 0.4941176, 1, 1,
0.2891321, -0.03862675, 2.07913, 0, 0.4901961, 1, 1,
0.2903683, -0.3937753, 2.579785, 0, 0.4823529, 1, 1,
0.295335, 0.2469354, 0.2324937, 0, 0.4784314, 1, 1,
0.2959264, 2.401233, -0.3269721, 0, 0.4705882, 1, 1,
0.2961177, 0.9566188, -0.4772538, 0, 0.4666667, 1, 1,
0.3009699, -0.8212124, 3.710586, 0, 0.4588235, 1, 1,
0.3025621, 1.855274, -0.3871053, 0, 0.454902, 1, 1,
0.3028239, -0.3108744, 1.119238, 0, 0.4470588, 1, 1,
0.3032628, 0.5724523, 0.8794703, 0, 0.4431373, 1, 1,
0.3065318, -0.3590765, 2.071925, 0, 0.4352941, 1, 1,
0.3065332, 0.5232543, -0.1567291, 0, 0.4313726, 1, 1,
0.3092902, 1.438566, 0.0381879, 0, 0.4235294, 1, 1,
0.3100049, 1.71841, 0.1363334, 0, 0.4196078, 1, 1,
0.312805, -0.3136652, 2.661065, 0, 0.4117647, 1, 1,
0.3195712, 0.6776856, -0.6280778, 0, 0.4078431, 1, 1,
0.3209793, -0.0006575981, 3.132953, 0, 0.4, 1, 1,
0.3261566, -0.3521417, 2.361012, 0, 0.3921569, 1, 1,
0.3270958, 1.955039, 0.3324266, 0, 0.3882353, 1, 1,
0.3281797, 0.3341379, -0.4317861, 0, 0.3803922, 1, 1,
0.3315776, -0.3409848, 3.120628, 0, 0.3764706, 1, 1,
0.3316988, 0.01930186, 0.8679892, 0, 0.3686275, 1, 1,
0.3340624, -0.2416951, 1.800615, 0, 0.3647059, 1, 1,
0.3413363, -1.319358, 2.052238, 0, 0.3568628, 1, 1,
0.3421224, 0.7935256, 1.492196, 0, 0.3529412, 1, 1,
0.3423788, -0.7103635, 2.490164, 0, 0.345098, 1, 1,
0.3452916, 1.022855, 1.489352, 0, 0.3411765, 1, 1,
0.3513354, -0.4538481, 1.801161, 0, 0.3333333, 1, 1,
0.3540309, 1.254092, -1.484048, 0, 0.3294118, 1, 1,
0.3580298, 0.8759604, -0.001454937, 0, 0.3215686, 1, 1,
0.3593228, -0.47288, 2.656204, 0, 0.3176471, 1, 1,
0.3617454, 1.168694, -0.4442687, 0, 0.3098039, 1, 1,
0.3662649, 0.4225524, 1.78905, 0, 0.3058824, 1, 1,
0.3759225, -0.8277476, 1.472492, 0, 0.2980392, 1, 1,
0.3806068, -1.387056, 3.022006, 0, 0.2901961, 1, 1,
0.386543, -0.608886, 1.703768, 0, 0.2862745, 1, 1,
0.3882171, 0.4157997, -0.1018789, 0, 0.2784314, 1, 1,
0.3917055, 0.8034024, 1.585806, 0, 0.2745098, 1, 1,
0.3919924, -1.689094, 2.121322, 0, 0.2666667, 1, 1,
0.3937432, -1.576465, 2.671757, 0, 0.2627451, 1, 1,
0.3983569, 0.01861166, 0.8298948, 0, 0.254902, 1, 1,
0.4039056, -0.07918686, 1.45546, 0, 0.2509804, 1, 1,
0.4045998, -0.006863799, -0.9594617, 0, 0.2431373, 1, 1,
0.4102502, -1.131391, 2.850664, 0, 0.2392157, 1, 1,
0.4171351, 1.963907, 0.9547651, 0, 0.2313726, 1, 1,
0.4191784, -0.3861347, 0.6075271, 0, 0.227451, 1, 1,
0.4215116, 0.4659765, -0.1951412, 0, 0.2196078, 1, 1,
0.4218725, -1.353791, 2.436608, 0, 0.2156863, 1, 1,
0.4230745, -0.02784245, 2.457663, 0, 0.2078431, 1, 1,
0.4282775, -0.3703456, -0.04241949, 0, 0.2039216, 1, 1,
0.4289739, -0.2303413, 2.226514, 0, 0.1960784, 1, 1,
0.4300149, 0.3921567, 2.967413, 0, 0.1882353, 1, 1,
0.4333831, -1.065049, 1.790491, 0, 0.1843137, 1, 1,
0.4348206, -0.7469677, 3.230785, 0, 0.1764706, 1, 1,
0.4352872, 1.34226, -0.03386128, 0, 0.172549, 1, 1,
0.4467127, -2.265098, 2.238316, 0, 0.1647059, 1, 1,
0.4477092, 0.4682895, 1.773376, 0, 0.1607843, 1, 1,
0.4505961, 1.433884, 0.8533664, 0, 0.1529412, 1, 1,
0.4511396, 0.2110005, -0.4284262, 0, 0.1490196, 1, 1,
0.4580765, 0.3625304, 1.188772, 0, 0.1411765, 1, 1,
0.4587875, -1.181044, 1.356204, 0, 0.1372549, 1, 1,
0.4664166, -0.8321409, 2.172823, 0, 0.1294118, 1, 1,
0.4667109, -0.2196204, 1.709008, 0, 0.1254902, 1, 1,
0.4667767, 1.119792, -0.4981205, 0, 0.1176471, 1, 1,
0.4685611, -1.234607, 2.858387, 0, 0.1137255, 1, 1,
0.4690384, 0.5674759, -0.1921328, 0, 0.1058824, 1, 1,
0.4695441, -0.4564512, 1.435906, 0, 0.09803922, 1, 1,
0.4713838, 1.214814, -0.3830006, 0, 0.09411765, 1, 1,
0.4800804, -0.8032454, 1.153273, 0, 0.08627451, 1, 1,
0.4849998, 0.2945978, 2.110819, 0, 0.08235294, 1, 1,
0.4866079, -1.211092, 4.133391, 0, 0.07450981, 1, 1,
0.4891252, 0.2840768, 0.2097663, 0, 0.07058824, 1, 1,
0.4913588, 0.1914836, 3.071963, 0, 0.0627451, 1, 1,
0.4921828, 0.5725141, 1.447142, 0, 0.05882353, 1, 1,
0.493173, -1.162401, 2.754998, 0, 0.05098039, 1, 1,
0.4937257, -0.7419548, 2.865763, 0, 0.04705882, 1, 1,
0.4951829, 0.7645471, -0.1524068, 0, 0.03921569, 1, 1,
0.4961517, 0.5174575, 0.1536178, 0, 0.03529412, 1, 1,
0.4968918, -0.5259131, 1.648266, 0, 0.02745098, 1, 1,
0.4969233, -1.468108, 3.584661, 0, 0.02352941, 1, 1,
0.4971071, 0.04456265, 0.06252551, 0, 0.01568628, 1, 1,
0.5072522, 0.3340267, -0.9498202, 0, 0.01176471, 1, 1,
0.5179275, -0.1070889, 1.606943, 0, 0.003921569, 1, 1,
0.5220572, 1.62874, -0.3061834, 0.003921569, 0, 1, 1,
0.5238284, 1.474198, -1.715117, 0.007843138, 0, 1, 1,
0.5273068, 0.3704713, 0.07442886, 0.01568628, 0, 1, 1,
0.5315347, -0.3227874, -0.2916411, 0.01960784, 0, 1, 1,
0.5387713, -0.01855743, 2.19869, 0.02745098, 0, 1, 1,
0.5390705, -0.7996247, -0.1255387, 0.03137255, 0, 1, 1,
0.544009, -0.5768977, 2.815207, 0.03921569, 0, 1, 1,
0.5459775, 0.681241, 1.116398, 0.04313726, 0, 1, 1,
0.5477154, 0.686532, 0.4817064, 0.05098039, 0, 1, 1,
0.5489939, -0.5237276, 2.788971, 0.05490196, 0, 1, 1,
0.5508379, 0.8818399, 0.004515627, 0.0627451, 0, 1, 1,
0.551635, -0.5583102, 2.322948, 0.06666667, 0, 1, 1,
0.5520356, -1.038547, 2.481151, 0.07450981, 0, 1, 1,
0.5533649, -0.8648065, 4.430844, 0.07843138, 0, 1, 1,
0.553399, -1.040797, 2.826332, 0.08627451, 0, 1, 1,
0.5546824, -0.7217965, 3.299247, 0.09019608, 0, 1, 1,
0.5565612, -0.6223043, 2.272881, 0.09803922, 0, 1, 1,
0.5577354, -0.7126209, 2.974122, 0.1058824, 0, 1, 1,
0.5588522, 0.6194189, 0.8726937, 0.1098039, 0, 1, 1,
0.5591235, -1.395993, 2.112908, 0.1176471, 0, 1, 1,
0.5601518, -1.721632, 2.184124, 0.1215686, 0, 1, 1,
0.5673941, 0.3843177, 0.7814916, 0.1294118, 0, 1, 1,
0.5675135, -0.7671918, 2.060361, 0.1333333, 0, 1, 1,
0.569595, 0.01199293, 0.2789262, 0.1411765, 0, 1, 1,
0.5705314, -0.01223436, 3.046224, 0.145098, 0, 1, 1,
0.5712827, -0.5210452, 2.472704, 0.1529412, 0, 1, 1,
0.5729024, -0.8845344, 4.004582, 0.1568628, 0, 1, 1,
0.5742897, -0.5713868, 2.392001, 0.1647059, 0, 1, 1,
0.5743638, -0.7382431, 1.284172, 0.1686275, 0, 1, 1,
0.5778289, 0.2131597, 2.985028, 0.1764706, 0, 1, 1,
0.578297, 0.18195, 1.31544, 0.1803922, 0, 1, 1,
0.5800925, 0.8249425, 0.03886053, 0.1882353, 0, 1, 1,
0.5839697, -0.8568457, 3.057045, 0.1921569, 0, 1, 1,
0.5901324, 0.4600809, 0.5561266, 0.2, 0, 1, 1,
0.5923623, -1.262529, 0.9345724, 0.2078431, 0, 1, 1,
0.6010846, -0.7197317, 3.081856, 0.2117647, 0, 1, 1,
0.6011621, -0.5559136, 2.576535, 0.2196078, 0, 1, 1,
0.604966, -1.480142, 4.24282, 0.2235294, 0, 1, 1,
0.6054245, -0.9876294, 0.02831259, 0.2313726, 0, 1, 1,
0.6064926, 0.3357946, 1.070927, 0.2352941, 0, 1, 1,
0.6088983, 1.243372, 0.512947, 0.2431373, 0, 1, 1,
0.6096785, -1.556746, 2.312742, 0.2470588, 0, 1, 1,
0.6109034, 0.05560173, 0.1158572, 0.254902, 0, 1, 1,
0.6119047, 0.7008165, 2.796752, 0.2588235, 0, 1, 1,
0.6131896, -1.829216, 4.895957, 0.2666667, 0, 1, 1,
0.6169759, 0.3977595, 1.186295, 0.2705882, 0, 1, 1,
0.6191536, 0.9581605, 1.900277, 0.2784314, 0, 1, 1,
0.6208886, 0.5280024, -0.6411688, 0.282353, 0, 1, 1,
0.622094, -0.008020948, 1.213771, 0.2901961, 0, 1, 1,
0.623856, 0.5877117, -0.02543712, 0.2941177, 0, 1, 1,
0.6269605, 1.117079, 0.930955, 0.3019608, 0, 1, 1,
0.6302035, 0.3721231, 2.038025, 0.3098039, 0, 1, 1,
0.6309161, -1.77413, 2.418526, 0.3137255, 0, 1, 1,
0.6372979, -0.5171538, 3.786581, 0.3215686, 0, 1, 1,
0.6396219, -0.8652059, 2.047981, 0.3254902, 0, 1, 1,
0.6396377, 1.415792, 3.053825, 0.3333333, 0, 1, 1,
0.6432224, -0.6661623, 1.526349, 0.3372549, 0, 1, 1,
0.6446582, 0.2444528, -0.1975828, 0.345098, 0, 1, 1,
0.6448995, 0.6512129, -1.022433, 0.3490196, 0, 1, 1,
0.6510838, -1.019587, 3.06725, 0.3568628, 0, 1, 1,
0.6528355, -1.33076, 2.498598, 0.3607843, 0, 1, 1,
0.6593302, 1.493049, -0.4001182, 0.3686275, 0, 1, 1,
0.6594558, -1.627591, 3.054874, 0.372549, 0, 1, 1,
0.663393, 1.287409, -0.1594364, 0.3803922, 0, 1, 1,
0.6670774, 0.2944284, 1.811543, 0.3843137, 0, 1, 1,
0.6714841, -1.113453, 4.609788, 0.3921569, 0, 1, 1,
0.6796905, 0.3677861, 1.974409, 0.3960784, 0, 1, 1,
0.6799782, 0.0314907, 1.339171, 0.4039216, 0, 1, 1,
0.6868565, -0.4564467, 1.393462, 0.4117647, 0, 1, 1,
0.6919232, 0.6494415, 1.927732, 0.4156863, 0, 1, 1,
0.6954414, -0.6938121, 2.283181, 0.4235294, 0, 1, 1,
0.6963463, -0.9592153, 3.339816, 0.427451, 0, 1, 1,
0.6970034, -0.3452825, 3.329492, 0.4352941, 0, 1, 1,
0.7014558, 0.9992694, 1.701169, 0.4392157, 0, 1, 1,
0.7027358, 2.102682, 3.485687, 0.4470588, 0, 1, 1,
0.7038033, 1.434554, 2.52165, 0.4509804, 0, 1, 1,
0.7072982, 1.096204, 0.3295328, 0.4588235, 0, 1, 1,
0.7142817, 0.4706628, 1.702999, 0.4627451, 0, 1, 1,
0.7145507, 0.4035781, 1.492625, 0.4705882, 0, 1, 1,
0.7151572, 2.1183, -1.001261, 0.4745098, 0, 1, 1,
0.7170871, 0.9107167, 0.6494807, 0.4823529, 0, 1, 1,
0.7172731, 1.420246, 1.587053, 0.4862745, 0, 1, 1,
0.7245676, 0.8464309, 1.580719, 0.4941176, 0, 1, 1,
0.725378, -1.533837, 4.06041, 0.5019608, 0, 1, 1,
0.7263907, -2.952174, 1.794378, 0.5058824, 0, 1, 1,
0.7264547, -0.3023953, 1.035208, 0.5137255, 0, 1, 1,
0.7311297, 0.06402991, -0.09755108, 0.5176471, 0, 1, 1,
0.7320135, 0.225116, 2.600295, 0.5254902, 0, 1, 1,
0.7387902, 0.4065718, 1.29869, 0.5294118, 0, 1, 1,
0.7394663, 0.1410068, 1.590834, 0.5372549, 0, 1, 1,
0.7428096, -0.1682296, 1.031357, 0.5411765, 0, 1, 1,
0.7499732, -1.467268, 3.19253, 0.5490196, 0, 1, 1,
0.7526181, 2.07317, 0.4210639, 0.5529412, 0, 1, 1,
0.7555689, 0.9455619, 0.8450227, 0.5607843, 0, 1, 1,
0.7574975, 0.4830241, 1.644469, 0.5647059, 0, 1, 1,
0.7582915, 2.476249, 2.748161, 0.572549, 0, 1, 1,
0.7613932, -0.1241967, 2.45231, 0.5764706, 0, 1, 1,
0.7640256, 0.8652772, 1.797496, 0.5843138, 0, 1, 1,
0.7673636, 0.1903789, 2.881697, 0.5882353, 0, 1, 1,
0.7700766, -1.041168, 1.73767, 0.5960785, 0, 1, 1,
0.7777905, -1.141075, 1.563572, 0.6039216, 0, 1, 1,
0.7825992, -1.252275, 3.603599, 0.6078432, 0, 1, 1,
0.783718, -0.4827765, 3.725379, 0.6156863, 0, 1, 1,
0.7844341, -1.392648, 3.714055, 0.6196079, 0, 1, 1,
0.7853422, -0.5083289, 2.092991, 0.627451, 0, 1, 1,
0.7866648, -1.193236, 1.921786, 0.6313726, 0, 1, 1,
0.7880133, -1.115633, 3.318753, 0.6392157, 0, 1, 1,
0.7905302, 0.363735, 1.19995, 0.6431373, 0, 1, 1,
0.7937025, 0.5327953, 1.018761, 0.6509804, 0, 1, 1,
0.7946399, 1.073029, 1.462278, 0.654902, 0, 1, 1,
0.7950029, -1.214388, 2.753251, 0.6627451, 0, 1, 1,
0.800203, 1.177565, 0.05715518, 0.6666667, 0, 1, 1,
0.8049861, 0.4179671, 1.312981, 0.6745098, 0, 1, 1,
0.8056095, 0.5714026, 2.23547, 0.6784314, 0, 1, 1,
0.8179636, -0.4087386, 2.805872, 0.6862745, 0, 1, 1,
0.8262412, 0.701282, 2.352994, 0.6901961, 0, 1, 1,
0.8266577, -0.2993942, 1.998403, 0.6980392, 0, 1, 1,
0.8276085, 0.1794606, 2.631548, 0.7058824, 0, 1, 1,
0.828463, -0.07900815, 2.059924, 0.7098039, 0, 1, 1,
0.8304454, -1.039347, 1.617347, 0.7176471, 0, 1, 1,
0.8353652, 0.55088, 1.667059, 0.7215686, 0, 1, 1,
0.8357981, -0.1954631, 2.718239, 0.7294118, 0, 1, 1,
0.8406582, 1.048852, 0.9258772, 0.7333333, 0, 1, 1,
0.8451638, 1.445065, -0.03820585, 0.7411765, 0, 1, 1,
0.8500692, -0.8753702, 2.233653, 0.7450981, 0, 1, 1,
0.8563561, -0.1172366, 2.052728, 0.7529412, 0, 1, 1,
0.8634816, -0.2362384, 0.9432349, 0.7568628, 0, 1, 1,
0.8638818, 0.8304237, -0.6458264, 0.7647059, 0, 1, 1,
0.8654276, 1.061941, -0.4912227, 0.7686275, 0, 1, 1,
0.8686043, 0.1425054, 0.3024813, 0.7764706, 0, 1, 1,
0.8769637, 0.2347956, -0.2215832, 0.7803922, 0, 1, 1,
0.8785519, -0.1991773, 2.242568, 0.7882353, 0, 1, 1,
0.8794152, -1.395791, 4.136544, 0.7921569, 0, 1, 1,
0.8794565, -1.573436, 3.369308, 0.8, 0, 1, 1,
0.8925825, 0.4645222, 0.4828441, 0.8078431, 0, 1, 1,
0.8942026, -0.317766, 0.6782299, 0.8117647, 0, 1, 1,
0.8998937, 0.619167, 0.7542495, 0.8196079, 0, 1, 1,
0.9006251, -0.2236611, 3.170193, 0.8235294, 0, 1, 1,
0.9029389, 1.72502, 1.218513, 0.8313726, 0, 1, 1,
0.905341, 0.2229643, 1.716023, 0.8352941, 0, 1, 1,
0.9061368, 0.03530467, 1.442997, 0.8431373, 0, 1, 1,
0.9087755, 2.020285, 0.05979987, 0.8470588, 0, 1, 1,
0.9093765, -0.9465323, 2.843381, 0.854902, 0, 1, 1,
0.9142072, 1.128685, 2.21277, 0.8588235, 0, 1, 1,
0.9148418, 1.750559, -0.9408355, 0.8666667, 0, 1, 1,
0.9168586, 1.348905, -0.3069664, 0.8705882, 0, 1, 1,
0.9251779, -1.039052, 2.707256, 0.8784314, 0, 1, 1,
0.927961, 0.4374285, 0.6608708, 0.8823529, 0, 1, 1,
0.9286884, -1.859818, 3.058598, 0.8901961, 0, 1, 1,
0.9360825, 0.1740315, 1.466427, 0.8941177, 0, 1, 1,
0.9368802, -0.9135421, 1.333442, 0.9019608, 0, 1, 1,
0.9383666, -1.164334, 1.666903, 0.9098039, 0, 1, 1,
0.9410586, -2.391248, 0.1806605, 0.9137255, 0, 1, 1,
0.9424736, 0.0829861, 2.002312, 0.9215686, 0, 1, 1,
0.9444389, -0.2433918, 1.346318, 0.9254902, 0, 1, 1,
0.9447365, -1.644661, 3.281851, 0.9333333, 0, 1, 1,
0.9460011, -0.4440661, -0.2320478, 0.9372549, 0, 1, 1,
0.9538762, 0.7264406, 2.536494, 0.945098, 0, 1, 1,
0.9594445, -1.16239, 1.418474, 0.9490196, 0, 1, 1,
0.9598266, -0.2557274, 2.653162, 0.9568627, 0, 1, 1,
0.9666392, -0.5951918, 1.234894, 0.9607843, 0, 1, 1,
0.9765736, -2.10908, 1.699668, 0.9686275, 0, 1, 1,
0.9768572, -0.4888055, 1.509886, 0.972549, 0, 1, 1,
0.9787261, -0.05728469, 2.497547, 0.9803922, 0, 1, 1,
0.9796454, -0.674157, 0.9461375, 0.9843137, 0, 1, 1,
0.9814723, 0.3597774, -0.6610058, 0.9921569, 0, 1, 1,
0.983235, -0.1011446, 1.867558, 0.9960784, 0, 1, 1,
0.9856388, -0.7590963, 1.842193, 1, 0, 0.9960784, 1,
0.9874794, -1.492971, 3.543418, 1, 0, 0.9882353, 1,
0.9897441, -0.2019198, 2.092217, 1, 0, 0.9843137, 1,
0.9911289, -0.4570443, 1.774053, 1, 0, 0.9764706, 1,
0.9999292, 1.579532, -0.6300264, 1, 0, 0.972549, 1,
1.001859, -0.4129162, 2.544087, 1, 0, 0.9647059, 1,
1.004663, 0.06784585, -0.2193865, 1, 0, 0.9607843, 1,
1.007464, 1.630298, 0.08924542, 1, 0, 0.9529412, 1,
1.013602, -0.5785462, 3.218569, 1, 0, 0.9490196, 1,
1.017843, -1.365773, 2.107976, 1, 0, 0.9411765, 1,
1.019217, 0.6406254, 2.352286, 1, 0, 0.9372549, 1,
1.022071, 0.1405601, 0.7471573, 1, 0, 0.9294118, 1,
1.02358, -1.559129, 2.301404, 1, 0, 0.9254902, 1,
1.025192, -1.225825, 1.622559, 1, 0, 0.9176471, 1,
1.03227, 0.4894325, 1.342317, 1, 0, 0.9137255, 1,
1.036303, -0.3062377, 4.801203, 1, 0, 0.9058824, 1,
1.038976, -0.173885, 2.382528, 1, 0, 0.9019608, 1,
1.044622, 0.2370603, 0.9716762, 1, 0, 0.8941177, 1,
1.048385, 0.4930938, 1.116104, 1, 0, 0.8862745, 1,
1.057843, -0.8503883, 3.122175, 1, 0, 0.8823529, 1,
1.059523, 0.0942867, 0.7311987, 1, 0, 0.8745098, 1,
1.060011, -0.1468107, 2.814567, 1, 0, 0.8705882, 1,
1.061238, -1.609437, 3.018098, 1, 0, 0.8627451, 1,
1.061788, -1.862961, 4.076784, 1, 0, 0.8588235, 1,
1.063102, -1.59001, 1.767686, 1, 0, 0.8509804, 1,
1.06325, -0.2818697, 0.8987448, 1, 0, 0.8470588, 1,
1.065439, 0.6806336, -0.03953255, 1, 0, 0.8392157, 1,
1.066833, 1.104298, 1.073729, 1, 0, 0.8352941, 1,
1.068914, 0.6862938, 0.5625048, 1, 0, 0.827451, 1,
1.071531, -0.1109275, 0.7022467, 1, 0, 0.8235294, 1,
1.072118, 0.1149236, -0.3202173, 1, 0, 0.8156863, 1,
1.075345, -0.189401, 1.829139, 1, 0, 0.8117647, 1,
1.082414, -0.6921506, 2.404922, 1, 0, 0.8039216, 1,
1.095792, 0.1915551, 2.115237, 1, 0, 0.7960784, 1,
1.110216, -0.1362582, 1.386395, 1, 0, 0.7921569, 1,
1.111383, 0.2167945, 0.1058843, 1, 0, 0.7843137, 1,
1.114581, -0.4359231, 1.795466, 1, 0, 0.7803922, 1,
1.125698, 0.3674576, 1.363322, 1, 0, 0.772549, 1,
1.130798, -0.8281745, 2.710485, 1, 0, 0.7686275, 1,
1.134547, 0.1645698, 0.009660554, 1, 0, 0.7607843, 1,
1.141723, -0.3248083, 2.25435, 1, 0, 0.7568628, 1,
1.150212, -0.5694435, 3.599463, 1, 0, 0.7490196, 1,
1.152129, 0.1829113, 2.130731, 1, 0, 0.7450981, 1,
1.161466, 1.13012, 0.3807957, 1, 0, 0.7372549, 1,
1.162447, 1.330193, -0.2934619, 1, 0, 0.7333333, 1,
1.166216, -1.106915, 2.209551, 1, 0, 0.7254902, 1,
1.17358, 0.277376, 1.888949, 1, 0, 0.7215686, 1,
1.174183, 0.3076396, 1.042783, 1, 0, 0.7137255, 1,
1.175516, -0.8890599, 3.025219, 1, 0, 0.7098039, 1,
1.182396, 1.448148, 1.120514, 1, 0, 0.7019608, 1,
1.183489, -0.5052764, 3.349764, 1, 0, 0.6941177, 1,
1.185954, -0.7193974, 1.323416, 1, 0, 0.6901961, 1,
1.190844, -0.02466636, 1.605675, 1, 0, 0.682353, 1,
1.194044, -0.3571514, 2.532646, 1, 0, 0.6784314, 1,
1.196016, 1.098455, 1.722235, 1, 0, 0.6705883, 1,
1.205559, 0.2597563, 2.822205, 1, 0, 0.6666667, 1,
1.206379, -0.9064139, 3.303328, 1, 0, 0.6588235, 1,
1.218227, -0.3801438, 0.6029877, 1, 0, 0.654902, 1,
1.222135, -0.157103, 1.915936, 1, 0, 0.6470588, 1,
1.224989, -1.231361, 2.060764, 1, 0, 0.6431373, 1,
1.230595, 2.457286, -0.2408036, 1, 0, 0.6352941, 1,
1.235263, 0.1342178, 2.604592, 1, 0, 0.6313726, 1,
1.237969, -0.9597425, 3.041917, 1, 0, 0.6235294, 1,
1.24167, 1.178737, 1.167648, 1, 0, 0.6196079, 1,
1.247714, 0.2920414, 0.374287, 1, 0, 0.6117647, 1,
1.250003, -0.7940194, 2.8995, 1, 0, 0.6078432, 1,
1.257999, -0.7155389, 3.644644, 1, 0, 0.6, 1,
1.27121, 0.0826639, 0.8661238, 1, 0, 0.5921569, 1,
1.279388, -0.5016719, 1.977768, 1, 0, 0.5882353, 1,
1.285334, -0.2698227, 3.229081, 1, 0, 0.5803922, 1,
1.304268, 0.2955251, 1.188618, 1, 0, 0.5764706, 1,
1.30943, 0.2082411, -0.4399027, 1, 0, 0.5686275, 1,
1.314164, 0.2340804, -0.06078095, 1, 0, 0.5647059, 1,
1.320052, 0.03029631, -0.2202222, 1, 0, 0.5568628, 1,
1.324823, -0.03327543, 2.168429, 1, 0, 0.5529412, 1,
1.3293, -1.21258, 4.395099, 1, 0, 0.5450981, 1,
1.329871, -0.4560252, 2.531445, 1, 0, 0.5411765, 1,
1.348251, -0.9853258, 2.837536, 1, 0, 0.5333334, 1,
1.352581, 0.04954269, -0.004531188, 1, 0, 0.5294118, 1,
1.355829, -0.8028826, 1.501788, 1, 0, 0.5215687, 1,
1.365407, 0.09129864, 2.235272, 1, 0, 0.5176471, 1,
1.36725, 0.465483, 1.92667, 1, 0, 0.509804, 1,
1.371265, -0.3072112, 2.776858, 1, 0, 0.5058824, 1,
1.373145, 0.4304015, 1.339471, 1, 0, 0.4980392, 1,
1.375079, 0.4327399, 0.7015266, 1, 0, 0.4901961, 1,
1.381285, -0.8161335, 2.964917, 1, 0, 0.4862745, 1,
1.406092, -1.05596, 1.957683, 1, 0, 0.4784314, 1,
1.410242, -0.2308313, 1.380663, 1, 0, 0.4745098, 1,
1.415631, 0.545827, -1.215968, 1, 0, 0.4666667, 1,
1.415968, 0.1634658, 1.507919, 1, 0, 0.4627451, 1,
1.416338, -1.207744, 1.469451, 1, 0, 0.454902, 1,
1.422244, -1.108683, 2.881902, 1, 0, 0.4509804, 1,
1.429189, -0.08471748, 1.946452, 1, 0, 0.4431373, 1,
1.440401, 0.6958135, 0.08665483, 1, 0, 0.4392157, 1,
1.445165, 0.2986068, 2.548756, 1, 0, 0.4313726, 1,
1.453634, 0.5491595, 1.288738, 1, 0, 0.427451, 1,
1.459183, -0.1206774, 1.657545, 1, 0, 0.4196078, 1,
1.46345, 0.6162126, 0.952095, 1, 0, 0.4156863, 1,
1.477416, -0.7639978, 2.645017, 1, 0, 0.4078431, 1,
1.496591, -0.5385253, 2.899563, 1, 0, 0.4039216, 1,
1.506311, -0.4105585, 1.257191, 1, 0, 0.3960784, 1,
1.508356, 0.5029087, 2.628231, 1, 0, 0.3882353, 1,
1.526522, -0.8358423, 2.242677, 1, 0, 0.3843137, 1,
1.527779, 1.726492, -0.1522388, 1, 0, 0.3764706, 1,
1.530308, -0.001401664, 0.3707177, 1, 0, 0.372549, 1,
1.533059, -0.4436833, 1.112828, 1, 0, 0.3647059, 1,
1.533465, -0.05869172, 2.544021, 1, 0, 0.3607843, 1,
1.547749, -0.4857531, 3.740597, 1, 0, 0.3529412, 1,
1.549233, -1.505297, 3.167668, 1, 0, 0.3490196, 1,
1.575513, 0.01212637, 0.857208, 1, 0, 0.3411765, 1,
1.583251, -0.03438707, 1.739698, 1, 0, 0.3372549, 1,
1.602104, -0.7891182, 1.798876, 1, 0, 0.3294118, 1,
1.628071, -0.835331, 1.563508, 1, 0, 0.3254902, 1,
1.634949, 0.5520896, 0.2203836, 1, 0, 0.3176471, 1,
1.646818, 0.6709424, 0.1725481, 1, 0, 0.3137255, 1,
1.649797, 0.2729206, 2.084098, 1, 0, 0.3058824, 1,
1.652013, -0.6137319, 2.113199, 1, 0, 0.2980392, 1,
1.693843, -1.145903, 1.963684, 1, 0, 0.2941177, 1,
1.706833, 1.621304, 1.134469, 1, 0, 0.2862745, 1,
1.709832, -0.05577511, 3.912372, 1, 0, 0.282353, 1,
1.722849, 0.01762626, 2.631691, 1, 0, 0.2745098, 1,
1.733997, -0.4457671, 2.798262, 1, 0, 0.2705882, 1,
1.738385, -0.504854, 2.856366, 1, 0, 0.2627451, 1,
1.740826, 1.426472, 0.7624148, 1, 0, 0.2588235, 1,
1.747247, 1.711056, 0.4131512, 1, 0, 0.2509804, 1,
1.756819, 0.3015514, 1.882657, 1, 0, 0.2470588, 1,
1.775223, -0.484273, 1.53998, 1, 0, 0.2392157, 1,
1.791922, 0.6523671, 2.454053, 1, 0, 0.2352941, 1,
1.810944, 0.9546469, 2.485807, 1, 0, 0.227451, 1,
1.822777, -0.5678127, 1.100688, 1, 0, 0.2235294, 1,
1.826367, 1.624362, 1.502798, 1, 0, 0.2156863, 1,
1.828624, 0.3147863, 0.3855601, 1, 0, 0.2117647, 1,
1.849069, -1.167689, 1.544806, 1, 0, 0.2039216, 1,
1.874793, -1.358269, -0.0160761, 1, 0, 0.1960784, 1,
1.887839, -0.9232803, 3.233511, 1, 0, 0.1921569, 1,
1.890571, 0.08520824, 1.966077, 1, 0, 0.1843137, 1,
1.903983, 0.7613118, 1.32473, 1, 0, 0.1803922, 1,
1.905158, 0.2921288, 2.213567, 1, 0, 0.172549, 1,
1.941069, -0.2623602, 1.422185, 1, 0, 0.1686275, 1,
1.949037, 0.2655284, 2.487674, 1, 0, 0.1607843, 1,
1.976422, 0.1613341, 1.938819, 1, 0, 0.1568628, 1,
2.000384, 0.2278354, 0.3757524, 1, 0, 0.1490196, 1,
2.000874, -1.539104, 0.4200654, 1, 0, 0.145098, 1,
2.010536, -1.008114, 2.678201, 1, 0, 0.1372549, 1,
2.024205, -0.2414334, 1.519017, 1, 0, 0.1333333, 1,
2.033039, -1.118653, 3.254257, 1, 0, 0.1254902, 1,
2.046027, 0.524442, 0.9665896, 1, 0, 0.1215686, 1,
2.0771, -0.4535848, 1.681878, 1, 0, 0.1137255, 1,
2.125978, -0.459514, 2.452451, 1, 0, 0.1098039, 1,
2.163198, 0.1995712, 1.82645, 1, 0, 0.1019608, 1,
2.165494, -1.453241, 0.4899366, 1, 0, 0.09411765, 1,
2.207518, -1.167527, 2.536589, 1, 0, 0.09019608, 1,
2.246061, 1.087544, 2.17561, 1, 0, 0.08235294, 1,
2.252702, -0.662364, 2.048422, 1, 0, 0.07843138, 1,
2.263114, 0.3658186, 1.188687, 1, 0, 0.07058824, 1,
2.395764, 1.209986, -0.0858824, 1, 0, 0.06666667, 1,
2.45929, 1.651102, 1.431514, 1, 0, 0.05882353, 1,
2.49649, 0.1157371, 1.555722, 1, 0, 0.05490196, 1,
2.570966, -0.2383299, 1.50414, 1, 0, 0.04705882, 1,
2.660661, 0.6546105, 0.1589144, 1, 0, 0.04313726, 1,
2.666842, -0.01089001, 1.699544, 1, 0, 0.03529412, 1,
2.720419, -0.2152693, 1.530191, 1, 0, 0.03137255, 1,
2.995627, -1.847374, 2.216741, 1, 0, 0.02352941, 1,
3.005173, 0.2464721, 1.968737, 1, 0, 0.01960784, 1,
3.018533, -0.4199555, 3.541642, 1, 0, 0.01176471, 1,
3.038805, 2.364925, 0.6276118, 1, 0, 0.007843138, 1
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
0.1240132, -4.033148, -7.375198, 0, -0.5, 0.5, 0.5,
0.1240132, -4.033148, -7.375198, 1, -0.5, 0.5, 0.5,
0.1240132, -4.033148, -7.375198, 1, 1.5, 0.5, 0.5,
0.1240132, -4.033148, -7.375198, 0, 1.5, 0.5, 0.5
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
-3.778894, 0.2365372, -7.375198, 0, -0.5, 0.5, 0.5,
-3.778894, 0.2365372, -7.375198, 1, -0.5, 0.5, 0.5,
-3.778894, 0.2365372, -7.375198, 1, 1.5, 0.5, 0.5,
-3.778894, 0.2365372, -7.375198, 0, 1.5, 0.5, 0.5
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
-3.778894, -4.033148, 0.08350778, 0, -0.5, 0.5, 0.5,
-3.778894, -4.033148, 0.08350778, 1, -0.5, 0.5, 0.5,
-3.778894, -4.033148, 0.08350778, 1, 1.5, 0.5, 0.5,
-3.778894, -4.033148, 0.08350778, 0, 1.5, 0.5, 0.5
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
-2, -3.047836, -5.653958,
3, -3.047836, -5.653958,
-2, -3.047836, -5.653958,
-2, -3.212054, -5.940831,
-1, -3.047836, -5.653958,
-1, -3.212054, -5.940831,
0, -3.047836, -5.653958,
0, -3.212054, -5.940831,
1, -3.047836, -5.653958,
1, -3.212054, -5.940831,
2, -3.047836, -5.653958,
2, -3.212054, -5.940831,
3, -3.047836, -5.653958,
3, -3.212054, -5.940831
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
-2, -3.540492, -6.514578, 0, -0.5, 0.5, 0.5,
-2, -3.540492, -6.514578, 1, -0.5, 0.5, 0.5,
-2, -3.540492, -6.514578, 1, 1.5, 0.5, 0.5,
-2, -3.540492, -6.514578, 0, 1.5, 0.5, 0.5,
-1, -3.540492, -6.514578, 0, -0.5, 0.5, 0.5,
-1, -3.540492, -6.514578, 1, -0.5, 0.5, 0.5,
-1, -3.540492, -6.514578, 1, 1.5, 0.5, 0.5,
-1, -3.540492, -6.514578, 0, 1.5, 0.5, 0.5,
0, -3.540492, -6.514578, 0, -0.5, 0.5, 0.5,
0, -3.540492, -6.514578, 1, -0.5, 0.5, 0.5,
0, -3.540492, -6.514578, 1, 1.5, 0.5, 0.5,
0, -3.540492, -6.514578, 0, 1.5, 0.5, 0.5,
1, -3.540492, -6.514578, 0, -0.5, 0.5, 0.5,
1, -3.540492, -6.514578, 1, -0.5, 0.5, 0.5,
1, -3.540492, -6.514578, 1, 1.5, 0.5, 0.5,
1, -3.540492, -6.514578, 0, 1.5, 0.5, 0.5,
2, -3.540492, -6.514578, 0, -0.5, 0.5, 0.5,
2, -3.540492, -6.514578, 1, -0.5, 0.5, 0.5,
2, -3.540492, -6.514578, 1, 1.5, 0.5, 0.5,
2, -3.540492, -6.514578, 0, 1.5, 0.5, 0.5,
3, -3.540492, -6.514578, 0, -0.5, 0.5, 0.5,
3, -3.540492, -6.514578, 1, -0.5, 0.5, 0.5,
3, -3.540492, -6.514578, 1, 1.5, 0.5, 0.5,
3, -3.540492, -6.514578, 0, 1.5, 0.5, 0.5
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
-2.878223, -2, -5.653958,
-2.878223, 3, -5.653958,
-2.878223, -2, -5.653958,
-3.028335, -2, -5.940831,
-2.878223, -1, -5.653958,
-3.028335, -1, -5.940831,
-2.878223, 0, -5.653958,
-3.028335, 0, -5.940831,
-2.878223, 1, -5.653958,
-3.028335, 1, -5.940831,
-2.878223, 2, -5.653958,
-3.028335, 2, -5.940831,
-2.878223, 3, -5.653958,
-3.028335, 3, -5.940831
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
-3.328558, -2, -6.514578, 0, -0.5, 0.5, 0.5,
-3.328558, -2, -6.514578, 1, -0.5, 0.5, 0.5,
-3.328558, -2, -6.514578, 1, 1.5, 0.5, 0.5,
-3.328558, -2, -6.514578, 0, 1.5, 0.5, 0.5,
-3.328558, -1, -6.514578, 0, -0.5, 0.5, 0.5,
-3.328558, -1, -6.514578, 1, -0.5, 0.5, 0.5,
-3.328558, -1, -6.514578, 1, 1.5, 0.5, 0.5,
-3.328558, -1, -6.514578, 0, 1.5, 0.5, 0.5,
-3.328558, 0, -6.514578, 0, -0.5, 0.5, 0.5,
-3.328558, 0, -6.514578, 1, -0.5, 0.5, 0.5,
-3.328558, 0, -6.514578, 1, 1.5, 0.5, 0.5,
-3.328558, 0, -6.514578, 0, 1.5, 0.5, 0.5,
-3.328558, 1, -6.514578, 0, -0.5, 0.5, 0.5,
-3.328558, 1, -6.514578, 1, -0.5, 0.5, 0.5,
-3.328558, 1, -6.514578, 1, 1.5, 0.5, 0.5,
-3.328558, 1, -6.514578, 0, 1.5, 0.5, 0.5,
-3.328558, 2, -6.514578, 0, -0.5, 0.5, 0.5,
-3.328558, 2, -6.514578, 1, -0.5, 0.5, 0.5,
-3.328558, 2, -6.514578, 1, 1.5, 0.5, 0.5,
-3.328558, 2, -6.514578, 0, 1.5, 0.5, 0.5,
-3.328558, 3, -6.514578, 0, -0.5, 0.5, 0.5,
-3.328558, 3, -6.514578, 1, -0.5, 0.5, 0.5,
-3.328558, 3, -6.514578, 1, 1.5, 0.5, 0.5,
-3.328558, 3, -6.514578, 0, 1.5, 0.5, 0.5
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
-2.878223, -3.047836, -4,
-2.878223, -3.047836, 4,
-2.878223, -3.047836, -4,
-3.028335, -3.212054, -4,
-2.878223, -3.047836, -2,
-3.028335, -3.212054, -2,
-2.878223, -3.047836, 0,
-3.028335, -3.212054, 0,
-2.878223, -3.047836, 2,
-3.028335, -3.212054, 2,
-2.878223, -3.047836, 4,
-3.028335, -3.212054, 4
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
-3.328558, -3.540492, -4, 0, -0.5, 0.5, 0.5,
-3.328558, -3.540492, -4, 1, -0.5, 0.5, 0.5,
-3.328558, -3.540492, -4, 1, 1.5, 0.5, 0.5,
-3.328558, -3.540492, -4, 0, 1.5, 0.5, 0.5,
-3.328558, -3.540492, -2, 0, -0.5, 0.5, 0.5,
-3.328558, -3.540492, -2, 1, -0.5, 0.5, 0.5,
-3.328558, -3.540492, -2, 1, 1.5, 0.5, 0.5,
-3.328558, -3.540492, -2, 0, 1.5, 0.5, 0.5,
-3.328558, -3.540492, 0, 0, -0.5, 0.5, 0.5,
-3.328558, -3.540492, 0, 1, -0.5, 0.5, 0.5,
-3.328558, -3.540492, 0, 1, 1.5, 0.5, 0.5,
-3.328558, -3.540492, 0, 0, 1.5, 0.5, 0.5,
-3.328558, -3.540492, 2, 0, -0.5, 0.5, 0.5,
-3.328558, -3.540492, 2, 1, -0.5, 0.5, 0.5,
-3.328558, -3.540492, 2, 1, 1.5, 0.5, 0.5,
-3.328558, -3.540492, 2, 0, 1.5, 0.5, 0.5,
-3.328558, -3.540492, 4, 0, -0.5, 0.5, 0.5,
-3.328558, -3.540492, 4, 1, -0.5, 0.5, 0.5,
-3.328558, -3.540492, 4, 1, 1.5, 0.5, 0.5,
-3.328558, -3.540492, 4, 0, 1.5, 0.5, 0.5
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
-2.878223, -3.047836, -5.653958,
-2.878223, 3.52091, -5.653958,
-2.878223, -3.047836, 5.820973,
-2.878223, 3.52091, 5.820973,
-2.878223, -3.047836, -5.653958,
-2.878223, -3.047836, 5.820973,
-2.878223, 3.52091, -5.653958,
-2.878223, 3.52091, 5.820973,
-2.878223, -3.047836, -5.653958,
3.126249, -3.047836, -5.653958,
-2.878223, -3.047836, 5.820973,
3.126249, -3.047836, 5.820973,
-2.878223, 3.52091, -5.653958,
3.126249, 3.52091, -5.653958,
-2.878223, 3.52091, 5.820973,
3.126249, 3.52091, 5.820973,
3.126249, -3.047836, -5.653958,
3.126249, 3.52091, -5.653958,
3.126249, -3.047836, 5.820973,
3.126249, 3.52091, 5.820973,
3.126249, -3.047836, -5.653958,
3.126249, -3.047836, 5.820973,
3.126249, 3.52091, -5.653958,
3.126249, 3.52091, 5.820973
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
var radius = 7.754239;
var distance = 34.49949;
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
mvMatrix.translate( -0.1240132, -0.2365372, -0.08350778 );
mvMatrix.scale( 1.396299, 1.276353, 0.7306393 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.49949);
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
S-bioallethrin<-read.table("S-bioallethrin.xyz")
```

```
## Error in read.table("S-bioallethrin.xyz"): no lines available in input
```

```r
x<-S-bioallethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
y<-S-bioallethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
z<-S-bioallethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
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
-2.790779, -0.06373625, -1.895483, 0, 0, 1, 1, 1,
-2.741374, 0.2958394, -2.620604, 1, 0, 0, 1, 1,
-2.652022, -2.365449, -2.711346, 1, 0, 0, 1, 1,
-2.638714, -0.2391188, -1.286082, 1, 0, 0, 1, 1,
-2.527186, -0.1865218, -1.163929, 1, 0, 0, 1, 1,
-2.43917, 0.6916087, -1.67518, 1, 0, 0, 1, 1,
-2.403175, -0.3734112, -2.947248, 0, 0, 0, 1, 1,
-2.334123, 1.594009, -1.484423, 0, 0, 0, 1, 1,
-2.31337, -0.2014416, -2.141562, 0, 0, 0, 1, 1,
-2.304377, -0.1370838, -1.724087, 0, 0, 0, 1, 1,
-2.274895, 1.549539, -2.857461, 0, 0, 0, 1, 1,
-2.230331, 0.2175966, -1.299927, 0, 0, 0, 1, 1,
-2.113405, -0.55106, -2.493552, 0, 0, 0, 1, 1,
-2.09298, -0.1553216, -0.250709, 1, 1, 1, 1, 1,
-2.087125, 0.3154973, -1.50362, 1, 1, 1, 1, 1,
-2.082698, 0.4227723, -0.6351656, 1, 1, 1, 1, 1,
-2.07108, -0.4715527, -1.805891, 1, 1, 1, 1, 1,
-2.059705, 0.5264003, -2.794466, 1, 1, 1, 1, 1,
-2.052367, -0.4491212, -1.399121, 1, 1, 1, 1, 1,
-2.035734, 0.3653471, -1.511598, 1, 1, 1, 1, 1,
-2.018543, -0.3618492, -1.064436, 1, 1, 1, 1, 1,
-1.99793, 1.860134, -0.01580936, 1, 1, 1, 1, 1,
-1.979069, -0.535877, -2.142466, 1, 1, 1, 1, 1,
-1.968994, 1.119253, -0.6437566, 1, 1, 1, 1, 1,
-1.964522, -0.9308435, -1.299243, 1, 1, 1, 1, 1,
-1.952373, -0.4790692, -1.137579, 1, 1, 1, 1, 1,
-1.931989, -1.836374, -1.629198, 1, 1, 1, 1, 1,
-1.886503, 0.02943017, -3.219841, 1, 1, 1, 1, 1,
-1.82978, 0.481422, -3.365016, 0, 0, 1, 1, 1,
-1.82729, -1.707187, -3.246281, 1, 0, 0, 1, 1,
-1.825672, 0.5022949, -2.066366, 1, 0, 0, 1, 1,
-1.819852, 1.988459, -1.354594, 1, 0, 0, 1, 1,
-1.81781, -1.35297, -4.74308, 1, 0, 0, 1, 1,
-1.807575, -1.002592, -2.932947, 1, 0, 0, 1, 1,
-1.796588, 1.139534, -0.09985278, 0, 0, 0, 1, 1,
-1.795953, 0.7184466, -0.4935709, 0, 0, 0, 1, 1,
-1.794195, -1.116454, -0.5682836, 0, 0, 0, 1, 1,
-1.77782, -0.4793658, -1.190238, 0, 0, 0, 1, 1,
-1.775481, 0.6483535, -2.073632, 0, 0, 0, 1, 1,
-1.767938, -1.163648, -2.35056, 0, 0, 0, 1, 1,
-1.766578, -2.070192, -2.335667, 0, 0, 0, 1, 1,
-1.747352, 0.2322838, -1.465865, 1, 1, 1, 1, 1,
-1.743287, 1.47295, -1.014168, 1, 1, 1, 1, 1,
-1.741647, -0.9562182, -2.747059, 1, 1, 1, 1, 1,
-1.732616, 0.02144059, -2.377152, 1, 1, 1, 1, 1,
-1.658594, -0.6853542, -2.143719, 1, 1, 1, 1, 1,
-1.65435, 0.8508947, -0.9987794, 1, 1, 1, 1, 1,
-1.651489, 0.3901196, -0.00590468, 1, 1, 1, 1, 1,
-1.646158, 1.295553, -2.769158, 1, 1, 1, 1, 1,
-1.616747, 0.1979906, -2.429075, 1, 1, 1, 1, 1,
-1.590738, 0.4309514, -2.008177, 1, 1, 1, 1, 1,
-1.586566, 0.6450908, -1.335965, 1, 1, 1, 1, 1,
-1.583161, 0.6902376, -2.217438, 1, 1, 1, 1, 1,
-1.574587, 0.04081478, -1.722962, 1, 1, 1, 1, 1,
-1.566224, -0.2376073, -1.621059, 1, 1, 1, 1, 1,
-1.561057, -0.3409958, -1.252816, 1, 1, 1, 1, 1,
-1.550735, -0.6045085, -1.601162, 0, 0, 1, 1, 1,
-1.550533, -0.3555556, -1.743667, 1, 0, 0, 1, 1,
-1.546075, 2.22296, -1.547533, 1, 0, 0, 1, 1,
-1.538172, 0.6811897, -0.0761018, 1, 0, 0, 1, 1,
-1.529073, -0.1841109, -2.022417, 1, 0, 0, 1, 1,
-1.528576, -1.629334, -3.743475, 1, 0, 0, 1, 1,
-1.525208, -0.3100673, -1.232354, 0, 0, 0, 1, 1,
-1.515945, -0.2937502, -1.056899, 0, 0, 0, 1, 1,
-1.511451, -0.135497, -1.746027, 0, 0, 0, 1, 1,
-1.504356, 0.08111235, -1.826361, 0, 0, 0, 1, 1,
-1.501624, 1.544745, 0.4724356, 0, 0, 0, 1, 1,
-1.498075, 1.125702, -2.265089, 0, 0, 0, 1, 1,
-1.491692, 0.8982015, -0.8835533, 0, 0, 0, 1, 1,
-1.482657, -0.5823599, -2.794186, 1, 1, 1, 1, 1,
-1.474792, -1.740251, -2.477355, 1, 1, 1, 1, 1,
-1.466801, -1.245173, -2.895484, 1, 1, 1, 1, 1,
-1.466082, -0.7543074, -2.184459, 1, 1, 1, 1, 1,
-1.460545, -0.2650139, -1.943939, 1, 1, 1, 1, 1,
-1.450229, 0.8771784, -1.897353, 1, 1, 1, 1, 1,
-1.449114, -0.7245193, -3.347339, 1, 1, 1, 1, 1,
-1.434545, 0.9950571, 0.3156165, 1, 1, 1, 1, 1,
-1.429807, 0.8988364, -0.3229661, 1, 1, 1, 1, 1,
-1.423554, 1.780424, -2.273537, 1, 1, 1, 1, 1,
-1.415042, 0.5891837, -0.7663617, 1, 1, 1, 1, 1,
-1.414035, -0.006896093, -2.633571, 1, 1, 1, 1, 1,
-1.403116, -1.278117, -2.149584, 1, 1, 1, 1, 1,
-1.397715, 0.6306202, 0.1311845, 1, 1, 1, 1, 1,
-1.392569, 0.7955099, -1.17607, 1, 1, 1, 1, 1,
-1.388117, -1.070942, -3.239804, 0, 0, 1, 1, 1,
-1.386248, -0.5630564, -1.559855, 1, 0, 0, 1, 1,
-1.382252, -0.867111, -1.659984, 1, 0, 0, 1, 1,
-1.344137, 0.8351102, -0.4042499, 1, 0, 0, 1, 1,
-1.343356, -1.32585, -2.097094, 1, 0, 0, 1, 1,
-1.342644, 0.9484423, -1.110258, 1, 0, 0, 1, 1,
-1.336486, -0.5443985, -0.6302233, 0, 0, 0, 1, 1,
-1.326138, -1.148283, -2.534528, 0, 0, 0, 1, 1,
-1.317195, 0.4415728, -0.1367266, 0, 0, 0, 1, 1,
-1.313896, -1.066604, -1.806492, 0, 0, 0, 1, 1,
-1.308419, -0.8316184, -0.8725282, 0, 0, 0, 1, 1,
-1.308141, 0.5565436, -3.816773, 0, 0, 0, 1, 1,
-1.296452, -1.060534, -1.547993, 0, 0, 0, 1, 1,
-1.284028, -0.7458555, -2.964906, 1, 1, 1, 1, 1,
-1.282986, -1.314445, -4.383245, 1, 1, 1, 1, 1,
-1.281767, 0.08328128, -2.586107, 1, 1, 1, 1, 1,
-1.270253, -0.6942018, -2.079851, 1, 1, 1, 1, 1,
-1.266727, -0.01051187, 0.8740895, 1, 1, 1, 1, 1,
-1.256961, 0.7126448, -1.709149, 1, 1, 1, 1, 1,
-1.256831, 0.267788, -1.247337, 1, 1, 1, 1, 1,
-1.24169, -1.216212, -3.713962, 1, 1, 1, 1, 1,
-1.241359, -0.1149062, -1.683215, 1, 1, 1, 1, 1,
-1.237746, 0.08547255, -0.783014, 1, 1, 1, 1, 1,
-1.233265, -1.164816, -3.116287, 1, 1, 1, 1, 1,
-1.230331, 0.03116689, -2.708884, 1, 1, 1, 1, 1,
-1.229469, -0.2609328, -1.051714, 1, 1, 1, 1, 1,
-1.21623, 0.5122883, -3.934076, 1, 1, 1, 1, 1,
-1.215696, 0.440079, -0.8534827, 1, 1, 1, 1, 1,
-1.215572, -0.6272023, -0.8536451, 0, 0, 1, 1, 1,
-1.200357, 0.1387207, -0.05357083, 1, 0, 0, 1, 1,
-1.195077, 0.1901018, -2.812337, 1, 0, 0, 1, 1,
-1.181713, -0.2731962, -1.863208, 1, 0, 0, 1, 1,
-1.172098, -0.2245492, -0.6892489, 1, 0, 0, 1, 1,
-1.169736, 0.5645611, -2.198059, 1, 0, 0, 1, 1,
-1.164307, 0.2653419, -0.0159041, 0, 0, 0, 1, 1,
-1.162688, 1.10892, -1.330403, 0, 0, 0, 1, 1,
-1.157679, -1.563044, -2.438305, 0, 0, 0, 1, 1,
-1.14837, -0.9334899, -4.040053, 0, 0, 0, 1, 1,
-1.134295, 1.13447, -1.064617, 0, 0, 0, 1, 1,
-1.124525, 1.463958, -0.8446753, 0, 0, 0, 1, 1,
-1.123362, 0.3190241, -0.7352495, 0, 0, 0, 1, 1,
-1.111146, 0.7076134, -1.704532, 1, 1, 1, 1, 1,
-1.106404, 1.609017, -1.819172, 1, 1, 1, 1, 1,
-1.099413, 0.009673412, -1.304924, 1, 1, 1, 1, 1,
-1.097492, -1.764338, -1.027933, 1, 1, 1, 1, 1,
-1.086028, 0.416943, -0.5778823, 1, 1, 1, 1, 1,
-1.084861, 0.7714807, -1.913449, 1, 1, 1, 1, 1,
-1.070657, -1.575004, -1.356416, 1, 1, 1, 1, 1,
-1.069922, 0.9838147, 0.03720032, 1, 1, 1, 1, 1,
-1.064788, -1.16112, -1.067535, 1, 1, 1, 1, 1,
-1.064633, -1.183458, -4.097162, 1, 1, 1, 1, 1,
-1.063017, 0.9876923, -2.28708, 1, 1, 1, 1, 1,
-1.055532, -1.413537, -2.333107, 1, 1, 1, 1, 1,
-1.054625, 0.01072812, -1.190125, 1, 1, 1, 1, 1,
-1.052622, -0.1908893, -2.633456, 1, 1, 1, 1, 1,
-1.050834, -0.5188145, -3.286752, 1, 1, 1, 1, 1,
-1.047974, -0.6696513, -2.056811, 0, 0, 1, 1, 1,
-1.04188, 0.4573963, -1.496107, 1, 0, 0, 1, 1,
-1.017513, -0.2852421, -2.922454, 1, 0, 0, 1, 1,
-1.014506, 0.4302917, -0.7232684, 1, 0, 0, 1, 1,
-1.007945, 1.917256, -0.7651324, 1, 0, 0, 1, 1,
-1.007774, -0.1385503, -2.418389, 1, 0, 0, 1, 1,
-1.006904, 0.6959567, -3.432063, 0, 0, 0, 1, 1,
-1.006838, 2.299554, 0.3859362, 0, 0, 0, 1, 1,
-1.006322, -1.238203, -2.622084, 0, 0, 0, 1, 1,
-0.9995237, 0.2514189, -0.5835459, 0, 0, 0, 1, 1,
-0.9965463, 0.1428862, -0.888656, 0, 0, 0, 1, 1,
-0.9961522, 1.300813, -0.5784583, 0, 0, 0, 1, 1,
-0.9928912, -2.022689, -2.320175, 0, 0, 0, 1, 1,
-0.9919288, 0.8535268, 0.2038381, 1, 1, 1, 1, 1,
-0.9882634, -0.5606098, -1.915984, 1, 1, 1, 1, 1,
-0.9866795, -1.200363, -0.8968677, 1, 1, 1, 1, 1,
-0.9865649, -1.094474, -3.089783, 1, 1, 1, 1, 1,
-0.9863425, 0.2835512, -2.744623, 1, 1, 1, 1, 1,
-0.980098, 0.07477963, -2.200026, 1, 1, 1, 1, 1,
-0.9790704, -0.2871554, -2.667378, 1, 1, 1, 1, 1,
-0.9738685, 1.231602, -2.436283, 1, 1, 1, 1, 1,
-0.9728303, 0.7808974, -0.8714649, 1, 1, 1, 1, 1,
-0.972538, -0.9401282, -4.162315, 1, 1, 1, 1, 1,
-0.9713671, -1.033759, -1.533388, 1, 1, 1, 1, 1,
-0.9636406, -0.3950263, -0.4854875, 1, 1, 1, 1, 1,
-0.9524778, 0.2516116, -2.054883, 1, 1, 1, 1, 1,
-0.9521462, -0.5918117, -3.666945, 1, 1, 1, 1, 1,
-0.9270511, 0.2483659, -0.619677, 1, 1, 1, 1, 1,
-0.9268844, -2.355431, -2.661508, 0, 0, 1, 1, 1,
-0.9238796, 1.035798, -1.311377, 1, 0, 0, 1, 1,
-0.9208828, -0.08314115, -1.490659, 1, 0, 0, 1, 1,
-0.915208, -0.4405567, -1.266787, 1, 0, 0, 1, 1,
-0.9143757, 1.227741, -0.1621221, 1, 0, 0, 1, 1,
-0.9067852, -0.298664, -0.2398203, 1, 0, 0, 1, 1,
-0.9036728, -1.476379, -1.492291, 0, 0, 0, 1, 1,
-0.8974491, -0.1816943, -3.104542, 0, 0, 0, 1, 1,
-0.8973161, 0.1234657, -0.8953927, 0, 0, 0, 1, 1,
-0.8860328, -0.07893963, -0.5748979, 0, 0, 0, 1, 1,
-0.8770039, 1.437251, -3.265633, 0, 0, 0, 1, 1,
-0.8716536, -1.145762, -2.029608, 0, 0, 0, 1, 1,
-0.8695076, 0.4314004, -1.358973, 0, 0, 0, 1, 1,
-0.8638416, 0.6110585, -2.202468, 1, 1, 1, 1, 1,
-0.8551039, 1.069456, -0.5841175, 1, 1, 1, 1, 1,
-0.8508884, 1.810033, -0.5378738, 1, 1, 1, 1, 1,
-0.8479927, 0.2807868, -0.891399, 1, 1, 1, 1, 1,
-0.847147, 0.6028783, -1.09327, 1, 1, 1, 1, 1,
-0.8464519, 1.777988, -0.7188517, 1, 1, 1, 1, 1,
-0.83968, 0.5620745, -1.932632, 1, 1, 1, 1, 1,
-0.8384111, -0.0283184, -0.814109, 1, 1, 1, 1, 1,
-0.8367425, 0.7549829, -1.698885, 1, 1, 1, 1, 1,
-0.835894, 0.7699444, -1.584598, 1, 1, 1, 1, 1,
-0.8354993, -0.2333152, -1.581272, 1, 1, 1, 1, 1,
-0.8303084, 0.947705, -1.793184, 1, 1, 1, 1, 1,
-0.8199974, 0.1097932, -1.974548, 1, 1, 1, 1, 1,
-0.8174421, 0.1869802, -0.4305558, 1, 1, 1, 1, 1,
-0.8103135, -1.839245, -0.7662376, 1, 1, 1, 1, 1,
-0.8040149, 0.2092875, -2.628487, 0, 0, 1, 1, 1,
-0.7988563, 0.7566442, -0.4935669, 1, 0, 0, 1, 1,
-0.7967247, -1.577057, -0.9076756, 1, 0, 0, 1, 1,
-0.7955662, 0.1954111, 0.02076852, 1, 0, 0, 1, 1,
-0.7939495, 0.9278616, -1.677815, 1, 0, 0, 1, 1,
-0.7935458, 1.054147, 0.09163833, 1, 0, 0, 1, 1,
-0.7930682, -0.2729988, -3.993713, 0, 0, 0, 1, 1,
-0.7927825, -1.86366, -0.7314376, 0, 0, 0, 1, 1,
-0.7913225, 0.1804515, -0.4728121, 0, 0, 0, 1, 1,
-0.7864578, -0.534071, -1.343683, 0, 0, 0, 1, 1,
-0.7855282, -0.06762525, -3.774152, 0, 0, 0, 1, 1,
-0.7849479, 0.4013976, -1.339754, 0, 0, 0, 1, 1,
-0.7745959, 0.2301362, -1.87659, 0, 0, 0, 1, 1,
-0.7733006, -1.609312, -2.981251, 1, 1, 1, 1, 1,
-0.7695833, -0.2460572, -1.162263, 1, 1, 1, 1, 1,
-0.7663193, 2.113932, -0.687634, 1, 1, 1, 1, 1,
-0.7659394, 0.1885485, -0.68995, 1, 1, 1, 1, 1,
-0.7645872, 2.154195, 0.5787235, 1, 1, 1, 1, 1,
-0.761167, 0.3233202, 0.7046578, 1, 1, 1, 1, 1,
-0.7591375, -0.2313869, -2.987102, 1, 1, 1, 1, 1,
-0.7546342, 0.6009039, -2.732272, 1, 1, 1, 1, 1,
-0.7519822, -0.6517975, -1.494423, 1, 1, 1, 1, 1,
-0.7518379, -0.2697247, -1.151535, 1, 1, 1, 1, 1,
-0.7516529, -1.35436, -1.789665, 1, 1, 1, 1, 1,
-0.7513055, 0.3385019, -0.03611894, 1, 1, 1, 1, 1,
-0.7503474, -0.1104464, -2.305808, 1, 1, 1, 1, 1,
-0.7439976, 1.841429, -2.104475, 1, 1, 1, 1, 1,
-0.7415988, 0.6647232, 0.7455232, 1, 1, 1, 1, 1,
-0.7415982, 2.467444, 1.186959, 0, 0, 1, 1, 1,
-0.7402144, 1.668291, -1.693967, 1, 0, 0, 1, 1,
-0.7392296, -1.432613, -2.3069, 1, 0, 0, 1, 1,
-0.7380162, 0.0955588, -2.573128, 1, 0, 0, 1, 1,
-0.7345127, 1.922459, -1.245163, 1, 0, 0, 1, 1,
-0.7336665, -1.152148, -2.081358, 1, 0, 0, 1, 1,
-0.7335239, 1.051942, -2.594169, 0, 0, 0, 1, 1,
-0.7290518, 0.04726923, -3.370826, 0, 0, 0, 1, 1,
-0.7225568, 2.194118, -1.61333, 0, 0, 0, 1, 1,
-0.7218314, 0.7450539, -1.340529, 0, 0, 0, 1, 1,
-0.7206734, -0.3764545, -2.323332, 0, 0, 0, 1, 1,
-0.7193155, 0.9291305, -1.571814, 0, 0, 0, 1, 1,
-0.7189241, -0.425453, -1.58256, 0, 0, 0, 1, 1,
-0.7145905, -0.3436115, -2.914476, 1, 1, 1, 1, 1,
-0.7116638, 0.2603693, -1.321876, 1, 1, 1, 1, 1,
-0.706927, -0.9204147, -3.401317, 1, 1, 1, 1, 1,
-0.7035946, -1.561619, -2.771548, 1, 1, 1, 1, 1,
-0.6973886, -0.2848002, -1.798452, 1, 1, 1, 1, 1,
-0.6933984, 0.1783689, -0.3276724, 1, 1, 1, 1, 1,
-0.6923601, 0.1577746, -0.4605944, 1, 1, 1, 1, 1,
-0.6901724, -0.3552195, -2.508163, 1, 1, 1, 1, 1,
-0.6888493, -1.339535, -1.180654, 1, 1, 1, 1, 1,
-0.6860831, -0.1512383, -1.755271, 1, 1, 1, 1, 1,
-0.6838932, 1.116476, -0.9310454, 1, 1, 1, 1, 1,
-0.6795425, 0.2417352, -0.3497595, 1, 1, 1, 1, 1,
-0.6707111, -0.5904701, -2.045438, 1, 1, 1, 1, 1,
-0.6693025, 2.09221, -0.1106195, 1, 1, 1, 1, 1,
-0.6660763, -0.8860608, -1.10506, 1, 1, 1, 1, 1,
-0.6653719, 1.422387, 0.2363248, 0, 0, 1, 1, 1,
-0.6607669, -1.239364, -0.7579122, 1, 0, 0, 1, 1,
-0.6570991, -0.5005159, -1.819458, 1, 0, 0, 1, 1,
-0.6552333, -0.9724234, -1.89972, 1, 0, 0, 1, 1,
-0.6551914, -1.300014, -2.370541, 1, 0, 0, 1, 1,
-0.6546612, -0.06828292, -2.781387, 1, 0, 0, 1, 1,
-0.6487572, 1.02857, 0.5315626, 0, 0, 0, 1, 1,
-0.6480157, 1.907945, 0.0774641, 0, 0, 0, 1, 1,
-0.6408578, 0.8347859, -1.999104, 0, 0, 0, 1, 1,
-0.6350914, 1.514627, -0.4165222, 0, 0, 0, 1, 1,
-0.6321216, -1.016622, -2.011444, 0, 0, 0, 1, 1,
-0.6300995, 1.451065, -1.686748, 0, 0, 0, 1, 1,
-0.6284851, -0.3356329, -2.259025, 0, 0, 0, 1, 1,
-0.628128, -0.41225, -2.41531, 1, 1, 1, 1, 1,
-0.6279601, 0.5170481, 0.6144792, 1, 1, 1, 1, 1,
-0.6276047, 1.154515, 1.632087, 1, 1, 1, 1, 1,
-0.6211638, 0.6791497, -1.870774, 1, 1, 1, 1, 1,
-0.6200777, 0.4597686, -0.4598122, 1, 1, 1, 1, 1,
-0.6147997, -0.6414019, -3.539696, 1, 1, 1, 1, 1,
-0.613488, -0.4267988, -1.039112, 1, 1, 1, 1, 1,
-0.6068977, -0.6450382, -3.582854, 1, 1, 1, 1, 1,
-0.6038996, -1.304952, -1.956501, 1, 1, 1, 1, 1,
-0.5951205, 1.743543, -2.110358, 1, 1, 1, 1, 1,
-0.5949048, -0.1470624, -1.806422, 1, 1, 1, 1, 1,
-0.5874725, -1.935672, -2.785341, 1, 1, 1, 1, 1,
-0.5848091, -1.179603, -3.6888, 1, 1, 1, 1, 1,
-0.5757354, 0.5200232, -1.095236, 1, 1, 1, 1, 1,
-0.5703046, -0.05711596, -1.264441, 1, 1, 1, 1, 1,
-0.5699086, 0.1052775, -1.5668, 0, 0, 1, 1, 1,
-0.5688074, 0.3282942, -2.006395, 1, 0, 0, 1, 1,
-0.5643474, -0.6234272, -2.685752, 1, 0, 0, 1, 1,
-0.5612879, -0.7287731, -2.778685, 1, 0, 0, 1, 1,
-0.5555625, -1.015695, -4.105972, 1, 0, 0, 1, 1,
-0.5554031, 0.1540292, -0.7836766, 1, 0, 0, 1, 1,
-0.5546216, -1.863482, -2.366986, 0, 0, 0, 1, 1,
-0.5521519, -1.180943, -2.374835, 0, 0, 0, 1, 1,
-0.5520558, 1.829853, -0.7229206, 0, 0, 0, 1, 1,
-0.5483456, -0.3517872, -1.094501, 0, 0, 0, 1, 1,
-0.547228, 1.705885, -0.6148748, 0, 0, 0, 1, 1,
-0.5461475, -0.4245976, -2.966053, 0, 0, 0, 1, 1,
-0.5460657, 1.205309, -1.077449, 0, 0, 0, 1, 1,
-0.5436385, -0.862918, -1.432102, 1, 1, 1, 1, 1,
-0.5431442, -0.3216274, -1.79909, 1, 1, 1, 1, 1,
-0.539238, -1.031563, -1.057163, 1, 1, 1, 1, 1,
-0.5334412, 0.05993566, -1.111412, 1, 1, 1, 1, 1,
-0.531734, 1.628463, -0.7707868, 1, 1, 1, 1, 1,
-0.5294986, -0.4198463, -1.394427, 1, 1, 1, 1, 1,
-0.5278668, -1.263772, -3.901481, 1, 1, 1, 1, 1,
-0.5217548, 1.093631, 1.203747, 1, 1, 1, 1, 1,
-0.5207577, -0.1695561, -3.538564, 1, 1, 1, 1, 1,
-0.5174032, 1.184212, 1.030626, 1, 1, 1, 1, 1,
-0.5158324, -1.23001, -2.436713, 1, 1, 1, 1, 1,
-0.5155811, -0.4907366, -3.873648, 1, 1, 1, 1, 1,
-0.5141214, -0.2949917, -1.731054, 1, 1, 1, 1, 1,
-0.5139751, 1.451635, -2.151738, 1, 1, 1, 1, 1,
-0.5106621, -1.159701, -3.945487, 1, 1, 1, 1, 1,
-0.5099682, -0.0973486, -2.863814, 0, 0, 1, 1, 1,
-0.5056563, -0.14174, -1.553279, 1, 0, 0, 1, 1,
-0.5054284, -0.08644512, -2.170651, 1, 0, 0, 1, 1,
-0.5044801, -0.1252894, -1.180654, 1, 0, 0, 1, 1,
-0.5011007, 0.3469911, -1.963611, 1, 0, 0, 1, 1,
-0.5008571, 2.325871, 0.5393403, 1, 0, 0, 1, 1,
-0.4990102, -0.3556705, -1.484736, 0, 0, 0, 1, 1,
-0.4921689, -0.4219971, -2.162434, 0, 0, 0, 1, 1,
-0.4912363, -1.020942, -2.888517, 0, 0, 0, 1, 1,
-0.487182, 0.7272078, -0.6920956, 0, 0, 0, 1, 1,
-0.4813821, 0.6793435, -1.803978, 0, 0, 0, 1, 1,
-0.4759667, -0.7374264, -2.719538, 0, 0, 0, 1, 1,
-0.4740828, 0.6602254, -3.479735, 0, 0, 0, 1, 1,
-0.4709529, -1.334729, -2.039939, 1, 1, 1, 1, 1,
-0.4707453, 0.2930929, -2.035081, 1, 1, 1, 1, 1,
-0.4685513, -0.4061378, -1.218837, 1, 1, 1, 1, 1,
-0.4682862, -1.314768, -3.732261, 1, 1, 1, 1, 1,
-0.4638079, 0.1165638, -2.766013, 1, 1, 1, 1, 1,
-0.4614957, 1.006157, 0.3841366, 1, 1, 1, 1, 1,
-0.4614607, 0.3112276, -0.6365943, 1, 1, 1, 1, 1,
-0.4527605, 0.546096, -3.414579, 1, 1, 1, 1, 1,
-0.4527398, 0.5283668, -0.6919183, 1, 1, 1, 1, 1,
-0.4492103, 0.3996089, -1.157759, 1, 1, 1, 1, 1,
-0.4358467, 0.6271678, -1.212562, 1, 1, 1, 1, 1,
-0.4338731, 1.103947, -1.12312, 1, 1, 1, 1, 1,
-0.4316432, 0.7447717, 0.5497236, 1, 1, 1, 1, 1,
-0.431253, 0.08321141, -0.6283908, 1, 1, 1, 1, 1,
-0.4284751, 0.2341421, 0.1385077, 1, 1, 1, 1, 1,
-0.427476, -0.9403675, -2.040084, 0, 0, 1, 1, 1,
-0.4157746, -1.000503, -4.299135, 1, 0, 0, 1, 1,
-0.4108668, -1.749046, -2.674779, 1, 0, 0, 1, 1,
-0.4103561, -0.05033883, -3.225817, 1, 0, 0, 1, 1,
-0.4068187, 0.8864116, -0.361946, 1, 0, 0, 1, 1,
-0.4038442, 1.01686, 1.146961, 1, 0, 0, 1, 1,
-0.3994688, -1.064727, -3.120769, 0, 0, 0, 1, 1,
-0.3983852, 0.4431899, -1.363613, 0, 0, 0, 1, 1,
-0.3907261, -1.423046, -2.890254, 0, 0, 0, 1, 1,
-0.385394, -1.004452, -3.061332, 0, 0, 0, 1, 1,
-0.3833916, -1.154148, -1.879642, 0, 0, 0, 1, 1,
-0.3793574, -1.392087, -3.936088, 0, 0, 0, 1, 1,
-0.3786945, -1.040321, -1.744312, 0, 0, 0, 1, 1,
-0.377986, 1.760137, -1.805711, 1, 1, 1, 1, 1,
-0.3730977, 0.1554718, -1.800233, 1, 1, 1, 1, 1,
-0.3652488, -0.05399866, -1.938562, 1, 1, 1, 1, 1,
-0.3611786, 1.165077, 0.8059217, 1, 1, 1, 1, 1,
-0.3602127, 1.429725, -1.133448, 1, 1, 1, 1, 1,
-0.3593871, -1.64712, -4.429006, 1, 1, 1, 1, 1,
-0.3581882, -1.106028, -2.338033, 1, 1, 1, 1, 1,
-0.3552568, -1.793555, -2.129512, 1, 1, 1, 1, 1,
-0.3508292, -0.8336772, -2.285055, 1, 1, 1, 1, 1,
-0.3473254, -0.9778273, -3.829796, 1, 1, 1, 1, 1,
-0.3448404, 1.169563, -0.3590306, 1, 1, 1, 1, 1,
-0.3438244, 0.3894411, -1.979614, 1, 1, 1, 1, 1,
-0.3401916, -1.520115, -2.856943, 1, 1, 1, 1, 1,
-0.338587, 0.5245581, 0.2919837, 1, 1, 1, 1, 1,
-0.3343874, -0.3586898, -4.017956, 1, 1, 1, 1, 1,
-0.3297053, 1.242828, -0.02825474, 0, 0, 1, 1, 1,
-0.3284231, -0.567164, -2.570375, 1, 0, 0, 1, 1,
-0.3282821, 0.4601297, -1.266421, 1, 0, 0, 1, 1,
-0.323514, 0.8666226, 0.8421819, 1, 0, 0, 1, 1,
-0.3205625, -0.1923788, -2.671921, 1, 0, 0, 1, 1,
-0.3094705, -0.1144704, -2.758262, 1, 0, 0, 1, 1,
-0.309105, 1.367526, -1.673162, 0, 0, 0, 1, 1,
-0.3071862, -1.719904, -0.1458657, 0, 0, 0, 1, 1,
-0.3023038, -0.1941216, -1.998539, 0, 0, 0, 1, 1,
-0.2967806, 2.020114, -0.3626151, 0, 0, 0, 1, 1,
-0.2962231, -1.196963, -1.011626, 0, 0, 0, 1, 1,
-0.2943245, -0.9372202, -4.467565, 0, 0, 0, 1, 1,
-0.2941409, -0.1631452, -2.501897, 0, 0, 0, 1, 1,
-0.2924801, 0.4341393, 0.04197013, 1, 1, 1, 1, 1,
-0.288482, -0.4600174, -2.44611, 1, 1, 1, 1, 1,
-0.2855902, 0.09546496, -1.397165, 1, 1, 1, 1, 1,
-0.2782993, -0.5985273, -2.243062, 1, 1, 1, 1, 1,
-0.2756136, 0.4500036, -0.3503644, 1, 1, 1, 1, 1,
-0.2696607, 0.6035485, -0.2230063, 1, 1, 1, 1, 1,
-0.2691605, -1.49798, -3.382528, 1, 1, 1, 1, 1,
-0.2689846, -0.7022054, -2.288384, 1, 1, 1, 1, 1,
-0.26728, -0.9709532, -2.604552, 1, 1, 1, 1, 1,
-0.259336, 1.125887, 1.169862, 1, 1, 1, 1, 1,
-0.2591867, 1.01912, 1.263183, 1, 1, 1, 1, 1,
-0.2508916, 0.3349949, -3.019707, 1, 1, 1, 1, 1,
-0.2488176, -0.2675229, -4.010561, 1, 1, 1, 1, 1,
-0.2454875, -0.9880399, -3.406886, 1, 1, 1, 1, 1,
-0.2376329, -0.5685061, -4.281988, 1, 1, 1, 1, 1,
-0.2308134, -2.237388, -2.10077, 0, 0, 1, 1, 1,
-0.2288142, 0.1166398, -1.077971, 1, 0, 0, 1, 1,
-0.2268461, -0.8930339, -4.980733, 1, 0, 0, 1, 1,
-0.22261, 1.003491, -0.0530397, 1, 0, 0, 1, 1,
-0.2175797, -1.036992, -3.297503, 1, 0, 0, 1, 1,
-0.2153055, 0.2953462, 0.5393986, 1, 0, 0, 1, 1,
-0.210153, -0.2209907, -1.908665, 0, 0, 0, 1, 1,
-0.2089552, 0.3254533, -1.26213, 0, 0, 0, 1, 1,
-0.2061258, -0.2678684, -1.593648, 0, 0, 0, 1, 1,
-0.2043934, 0.9868793, 0.2611533, 0, 0, 0, 1, 1,
-0.203962, 0.3206006, -0.6678222, 0, 0, 0, 1, 1,
-0.2038416, -0.8511255, -2.775516, 0, 0, 0, 1, 1,
-0.198776, 1.037686, -1.335039, 0, 0, 0, 1, 1,
-0.1981584, -0.08683066, -2.308393, 1, 1, 1, 1, 1,
-0.196911, 1.356487, -1.63834, 1, 1, 1, 1, 1,
-0.1946706, 1.466511, -0.5652018, 1, 1, 1, 1, 1,
-0.1933179, -0.7750965, -2.773261, 1, 1, 1, 1, 1,
-0.1923306, 0.5917688, 1.879192, 1, 1, 1, 1, 1,
-0.1905382, -1.503338, -1.292428, 1, 1, 1, 1, 1,
-0.1899135, 0.3269197, -0.04910119, 1, 1, 1, 1, 1,
-0.1849654, 0.1409501, 0.4458468, 1, 1, 1, 1, 1,
-0.1803367, -0.854109, -2.805873, 1, 1, 1, 1, 1,
-0.1780057, -1.367934, -2.96161, 1, 1, 1, 1, 1,
-0.1737809, 0.130349, 1.29155, 1, 1, 1, 1, 1,
-0.1726106, 1.72129, -0.2638969, 1, 1, 1, 1, 1,
-0.1712301, 0.2442689, -0.9712908, 1, 1, 1, 1, 1,
-0.1671235, 0.5183184, 0.5829724, 1, 1, 1, 1, 1,
-0.1660111, 1.184609, -0.3137141, 1, 1, 1, 1, 1,
-0.1626783, -0.4130136, -2.624199, 0, 0, 1, 1, 1,
-0.1625928, -0.8782495, -3.11899, 1, 0, 0, 1, 1,
-0.159989, 0.5388353, -1.99036, 1, 0, 0, 1, 1,
-0.1550935, 0.3508287, -1.428037, 1, 0, 0, 1, 1,
-0.1523143, -0.6836236, -3.775886, 1, 0, 0, 1, 1,
-0.1510982, 3.425249, 0.7556973, 1, 0, 0, 1, 1,
-0.1493341, -0.2785606, -3.506612, 0, 0, 0, 1, 1,
-0.1448744, 0.1017203, -0.2740499, 0, 0, 0, 1, 1,
-0.1372776, 0.4292853, -0.7529483, 0, 0, 0, 1, 1,
-0.1335797, -1.373756, -4.236716, 0, 0, 0, 1, 1,
-0.1320351, 0.3516421, -1.728769, 0, 0, 0, 1, 1,
-0.1316409, -0.01498662, -0.8940979, 0, 0, 0, 1, 1,
-0.1197184, 0.01650388, -2.746282, 0, 0, 0, 1, 1,
-0.1153726, -0.1581514, -2.050539, 1, 1, 1, 1, 1,
-0.1131156, -0.6712657, -2.517164, 1, 1, 1, 1, 1,
-0.1128105, 0.1904377, -0.6822868, 1, 1, 1, 1, 1,
-0.1127622, -1.461093, -3.062603, 1, 1, 1, 1, 1,
-0.1113045, -0.8547223, -1.577978, 1, 1, 1, 1, 1,
-0.1072214, 0.4869, -0.5605168, 1, 1, 1, 1, 1,
-0.1066797, -1.39149, -4.52598, 1, 1, 1, 1, 1,
-0.09827789, -0.44195, -3.965782, 1, 1, 1, 1, 1,
-0.09632203, 1.525594, 0.7293451, 1, 1, 1, 1, 1,
-0.09435862, -0.4465811, -3.67197, 1, 1, 1, 1, 1,
-0.09366295, 1.22136, 1.274351, 1, 1, 1, 1, 1,
-0.09005582, 0.08736651, -0.3048407, 1, 1, 1, 1, 1,
-0.08852576, -0.1612453, -1.471852, 1, 1, 1, 1, 1,
-0.08529773, -0.7365155, -3.118335, 1, 1, 1, 1, 1,
-0.08359099, -0.1515111, -2.047991, 1, 1, 1, 1, 1,
-0.08225001, 1.405188, -0.4581873, 0, 0, 1, 1, 1,
-0.07251661, 0.3411931, 0.8161552, 1, 0, 0, 1, 1,
-0.0695518, -0.4987828, -4.494845, 1, 0, 0, 1, 1,
-0.06415684, 1.084633, 0.3150147, 1, 0, 0, 1, 1,
-0.06377937, -1.533814, -2.518093, 1, 0, 0, 1, 1,
-0.0620794, -1.619018, -2.734726, 1, 0, 0, 1, 1,
-0.06064687, -0.7158136, -5.486847, 0, 0, 0, 1, 1,
-0.05700488, 1.006928, -0.7731737, 0, 0, 0, 1, 1,
-0.05693483, -1.204871, -3.143063, 0, 0, 0, 1, 1,
-0.05140954, -0.2963572, -2.206845, 0, 0, 0, 1, 1,
-0.04260695, 1.129593, -0.1396996, 0, 0, 0, 1, 1,
-0.04214336, -0.2392751, -3.025728, 0, 0, 0, 1, 1,
-0.04053969, 0.2176853, -0.2673695, 0, 0, 0, 1, 1,
-0.03986634, 1.530108, 1.648359, 1, 1, 1, 1, 1,
-0.03901622, -1.144416, -3.364621, 1, 1, 1, 1, 1,
-0.03709504, -0.3536049, -2.531044, 1, 1, 1, 1, 1,
-0.03153508, -0.9817319, -2.933428, 1, 1, 1, 1, 1,
-0.03004897, -1.512985, -3.764321, 1, 1, 1, 1, 1,
-0.02952996, -0.0627184, -3.89737, 1, 1, 1, 1, 1,
-0.02786891, -1.613822, -2.457752, 1, 1, 1, 1, 1,
-0.02619669, 1.653047, 0.462973, 1, 1, 1, 1, 1,
-0.02348539, -0.9938273, -3.712092, 1, 1, 1, 1, 1,
-0.02320936, 0.9364685, 0.5071473, 1, 1, 1, 1, 1,
-0.02317416, -0.4684709, -3.138928, 1, 1, 1, 1, 1,
-0.02289944, -2.418616, -0.9695214, 1, 1, 1, 1, 1,
-0.02265985, -0.3751962, -2.19599, 1, 1, 1, 1, 1,
-0.01841752, -0.4685071, -2.688237, 1, 1, 1, 1, 1,
-0.01512311, 0.8454419, 0.1201292, 1, 1, 1, 1, 1,
-0.01251827, -0.8349676, -3.107601, 0, 0, 1, 1, 1,
-0.01062152, -0.04079054, -5.357932, 1, 0, 0, 1, 1,
-0.005251364, -0.03432228, -2.555561, 1, 0, 0, 1, 1,
0.002347718, 1.128695, -0.3312056, 1, 0, 0, 1, 1,
0.005483684, 0.4003028, -0.122629, 1, 0, 0, 1, 1,
0.007235625, 0.4371256, -1.267153, 1, 0, 0, 1, 1,
0.007571147, -0.2002306, 1.924264, 0, 0, 0, 1, 1,
0.008152354, -0.7482816, 4.278287, 0, 0, 0, 1, 1,
0.01412217, 0.4395972, 0.1028106, 0, 0, 0, 1, 1,
0.01486608, 1.599831, -0.8687481, 0, 0, 0, 1, 1,
0.01989239, 0.1991328, -0.7789558, 0, 0, 0, 1, 1,
0.02073755, 1.317949, 0.8033583, 0, 0, 0, 1, 1,
0.02152866, 0.1946698, 0.9557506, 0, 0, 0, 1, 1,
0.03108046, 0.1450094, 1.545144, 1, 1, 1, 1, 1,
0.03801065, -0.04754503, 4.140746, 1, 1, 1, 1, 1,
0.03864955, -1.946219, 2.424797, 1, 1, 1, 1, 1,
0.04330944, 1.573564, 1.14245, 1, 1, 1, 1, 1,
0.04447811, -0.3846487, 3.510172, 1, 1, 1, 1, 1,
0.04973852, -0.3094168, 1.947867, 1, 1, 1, 1, 1,
0.05287396, -0.9676259, 2.264231, 1, 1, 1, 1, 1,
0.05798921, -1.722185, 4.499612, 1, 1, 1, 1, 1,
0.06596302, 0.6865634, 2.108298, 1, 1, 1, 1, 1,
0.06912713, -1.254127, 2.892098, 1, 1, 1, 1, 1,
0.06914203, 0.03959926, 0.1325374, 1, 1, 1, 1, 1,
0.06983905, -0.07445423, 3.37921, 1, 1, 1, 1, 1,
0.07642338, -0.4140212, 4.880572, 1, 1, 1, 1, 1,
0.07822781, -1.319393, 2.09516, 1, 1, 1, 1, 1,
0.0814136, -0.2250745, 2.185085, 1, 1, 1, 1, 1,
0.08155026, 0.9970923, -0.4362276, 0, 0, 1, 1, 1,
0.09083643, 0.03468923, 1.231777, 1, 0, 0, 1, 1,
0.09382314, -1.11688, 1.576425, 1, 0, 0, 1, 1,
0.0996822, -1.528608, 3.691934, 1, 0, 0, 1, 1,
0.1020521, 1.379928, 1.697253, 1, 0, 0, 1, 1,
0.1059873, 1.101542, -0.9073268, 1, 0, 0, 1, 1,
0.1067571, 0.630029, -0.8041031, 0, 0, 0, 1, 1,
0.111663, 1.203669, -1.386441, 0, 0, 0, 1, 1,
0.1163087, 0.1307459, 0.9406164, 0, 0, 0, 1, 1,
0.1208499, -0.7944058, 5.480221, 0, 0, 0, 1, 1,
0.1213977, -1.619795, 3.567117, 0, 0, 0, 1, 1,
0.1227043, -0.9337669, 0.5387672, 0, 0, 0, 1, 1,
0.1228427, 0.7132718, 0.9751901, 0, 0, 0, 1, 1,
0.1282432, -0.1940055, 1.572419, 1, 1, 1, 1, 1,
0.1288066, -0.5441774, 2.644698, 1, 1, 1, 1, 1,
0.133479, -0.608007, 2.569063, 1, 1, 1, 1, 1,
0.1339779, 1.889133, 0.9174972, 1, 1, 1, 1, 1,
0.1425682, 0.6270879, 0.4430583, 1, 1, 1, 1, 1,
0.1426295, 0.8689246, 1.373749, 1, 1, 1, 1, 1,
0.1426419, 0.3241111, -0.3617874, 1, 1, 1, 1, 1,
0.1437033, -1.624928, 1.537244, 1, 1, 1, 1, 1,
0.1438119, -0.5906082, 1.596715, 1, 1, 1, 1, 1,
0.1488556, 0.3669011, 2.323379, 1, 1, 1, 1, 1,
0.1489634, -0.2813068, 4.480004, 1, 1, 1, 1, 1,
0.1490273, 0.235685, 0.1092877, 1, 1, 1, 1, 1,
0.1502267, -0.3536694, 2.956822, 1, 1, 1, 1, 1,
0.1515092, -0.277772, 3.805221, 1, 1, 1, 1, 1,
0.1559587, -0.4254966, 4.348299, 1, 1, 1, 1, 1,
0.1560573, 0.1985468, -0.01615295, 0, 0, 1, 1, 1,
0.1603916, 0.3333744, -0.6439033, 1, 0, 0, 1, 1,
0.161589, -1.481277, 2.67086, 1, 0, 0, 1, 1,
0.1644872, 0.6970606, -0.2503794, 1, 0, 0, 1, 1,
0.1658101, 1.093715, 0.2297651, 1, 0, 0, 1, 1,
0.1709955, 0.2527405, 0.3536772, 1, 0, 0, 1, 1,
0.1755216, -0.384268, 1.300132, 0, 0, 0, 1, 1,
0.1774714, 0.3181574, -0.8422977, 0, 0, 0, 1, 1,
0.1784638, -0.3186997, 2.18499, 0, 0, 0, 1, 1,
0.178675, -0.626451, 1.782032, 0, 0, 0, 1, 1,
0.1816354, -0.3360197, 3.139363, 0, 0, 0, 1, 1,
0.1823714, -0.6376017, 1.117829, 0, 0, 0, 1, 1,
0.1893515, -1.192169, 3.483952, 0, 0, 0, 1, 1,
0.1904515, 0.9104751, 1.335676, 1, 1, 1, 1, 1,
0.1978828, -0.6638094, 4.02504, 1, 1, 1, 1, 1,
0.1998833, 0.3824559, -0.4579036, 1, 1, 1, 1, 1,
0.2057602, 0.009183024, 0.2662177, 1, 1, 1, 1, 1,
0.2063012, 0.3697441, 3.023794, 1, 1, 1, 1, 1,
0.2071576, 0.3815053, -0.2085093, 1, 1, 1, 1, 1,
0.2163794, -0.09281863, 2.08518, 1, 1, 1, 1, 1,
0.2165764, 0.5331837, 2.182908, 1, 1, 1, 1, 1,
0.2177484, -0.6174766, 2.61751, 1, 1, 1, 1, 1,
0.2205257, 2.115358, -0.6537102, 1, 1, 1, 1, 1,
0.2213314, 1.012424, -0.3555138, 1, 1, 1, 1, 1,
0.2214317, 0.9475523, 1.651968, 1, 1, 1, 1, 1,
0.2248606, -1.528154, 2.013747, 1, 1, 1, 1, 1,
0.2251607, -0.2286553, 2.685907, 1, 1, 1, 1, 1,
0.2297532, 0.5905593, -0.7030625, 1, 1, 1, 1, 1,
0.2300822, -0.3204132, 3.648149, 0, 0, 1, 1, 1,
0.2335221, -0.8054295, 4.026956, 1, 0, 0, 1, 1,
0.2340829, 1.868684, 0.7035696, 1, 0, 0, 1, 1,
0.235891, -0.4652746, 0.4451634, 1, 0, 0, 1, 1,
0.237157, -0.1056522, 3.241717, 1, 0, 0, 1, 1,
0.2390197, 0.03584784, 1.422488, 1, 0, 0, 1, 1,
0.2399613, -0.0636561, 3.244162, 0, 0, 0, 1, 1,
0.2425706, -0.8076457, 5.653863, 0, 0, 0, 1, 1,
0.2475452, -1.405679, 3.018608, 0, 0, 0, 1, 1,
0.2480044, -0.4867983, 3.921267, 0, 0, 0, 1, 1,
0.2547061, 0.8300957, 0.5540763, 0, 0, 0, 1, 1,
0.2601162, -0.2299366, 1.483743, 0, 0, 0, 1, 1,
0.2614368, -0.9459258, 3.0892, 0, 0, 0, 1, 1,
0.2643369, 0.1052293, 1.153619, 1, 1, 1, 1, 1,
0.2656144, 0.3488221, 0.6505867, 1, 1, 1, 1, 1,
0.2659877, 0.07357183, 1.318305, 1, 1, 1, 1, 1,
0.2672175, 1.11994, 1.90916, 1, 1, 1, 1, 1,
0.2681352, 0.6441711, -0.2706872, 1, 1, 1, 1, 1,
0.273259, 1.935888, -0.8643336, 1, 1, 1, 1, 1,
0.2837023, -0.9209036, 3.289459, 1, 1, 1, 1, 1,
0.2844264, 0.5066536, -0.6844344, 1, 1, 1, 1, 1,
0.2846521, 0.2691317, 2.857043, 1, 1, 1, 1, 1,
0.2846634, 0.9415472, 1.062438, 1, 1, 1, 1, 1,
0.2857327, -0.772553, 4.591513, 1, 1, 1, 1, 1,
0.286061, 0.4546802, -0.2455016, 1, 1, 1, 1, 1,
0.2891321, -0.03862675, 2.07913, 1, 1, 1, 1, 1,
0.2903683, -0.3937753, 2.579785, 1, 1, 1, 1, 1,
0.295335, 0.2469354, 0.2324937, 1, 1, 1, 1, 1,
0.2959264, 2.401233, -0.3269721, 0, 0, 1, 1, 1,
0.2961177, 0.9566188, -0.4772538, 1, 0, 0, 1, 1,
0.3009699, -0.8212124, 3.710586, 1, 0, 0, 1, 1,
0.3025621, 1.855274, -0.3871053, 1, 0, 0, 1, 1,
0.3028239, -0.3108744, 1.119238, 1, 0, 0, 1, 1,
0.3032628, 0.5724523, 0.8794703, 1, 0, 0, 1, 1,
0.3065318, -0.3590765, 2.071925, 0, 0, 0, 1, 1,
0.3065332, 0.5232543, -0.1567291, 0, 0, 0, 1, 1,
0.3092902, 1.438566, 0.0381879, 0, 0, 0, 1, 1,
0.3100049, 1.71841, 0.1363334, 0, 0, 0, 1, 1,
0.312805, -0.3136652, 2.661065, 0, 0, 0, 1, 1,
0.3195712, 0.6776856, -0.6280778, 0, 0, 0, 1, 1,
0.3209793, -0.0006575981, 3.132953, 0, 0, 0, 1, 1,
0.3261566, -0.3521417, 2.361012, 1, 1, 1, 1, 1,
0.3270958, 1.955039, 0.3324266, 1, 1, 1, 1, 1,
0.3281797, 0.3341379, -0.4317861, 1, 1, 1, 1, 1,
0.3315776, -0.3409848, 3.120628, 1, 1, 1, 1, 1,
0.3316988, 0.01930186, 0.8679892, 1, 1, 1, 1, 1,
0.3340624, -0.2416951, 1.800615, 1, 1, 1, 1, 1,
0.3413363, -1.319358, 2.052238, 1, 1, 1, 1, 1,
0.3421224, 0.7935256, 1.492196, 1, 1, 1, 1, 1,
0.3423788, -0.7103635, 2.490164, 1, 1, 1, 1, 1,
0.3452916, 1.022855, 1.489352, 1, 1, 1, 1, 1,
0.3513354, -0.4538481, 1.801161, 1, 1, 1, 1, 1,
0.3540309, 1.254092, -1.484048, 1, 1, 1, 1, 1,
0.3580298, 0.8759604, -0.001454937, 1, 1, 1, 1, 1,
0.3593228, -0.47288, 2.656204, 1, 1, 1, 1, 1,
0.3617454, 1.168694, -0.4442687, 1, 1, 1, 1, 1,
0.3662649, 0.4225524, 1.78905, 0, 0, 1, 1, 1,
0.3759225, -0.8277476, 1.472492, 1, 0, 0, 1, 1,
0.3806068, -1.387056, 3.022006, 1, 0, 0, 1, 1,
0.386543, -0.608886, 1.703768, 1, 0, 0, 1, 1,
0.3882171, 0.4157997, -0.1018789, 1, 0, 0, 1, 1,
0.3917055, 0.8034024, 1.585806, 1, 0, 0, 1, 1,
0.3919924, -1.689094, 2.121322, 0, 0, 0, 1, 1,
0.3937432, -1.576465, 2.671757, 0, 0, 0, 1, 1,
0.3983569, 0.01861166, 0.8298948, 0, 0, 0, 1, 1,
0.4039056, -0.07918686, 1.45546, 0, 0, 0, 1, 1,
0.4045998, -0.006863799, -0.9594617, 0, 0, 0, 1, 1,
0.4102502, -1.131391, 2.850664, 0, 0, 0, 1, 1,
0.4171351, 1.963907, 0.9547651, 0, 0, 0, 1, 1,
0.4191784, -0.3861347, 0.6075271, 1, 1, 1, 1, 1,
0.4215116, 0.4659765, -0.1951412, 1, 1, 1, 1, 1,
0.4218725, -1.353791, 2.436608, 1, 1, 1, 1, 1,
0.4230745, -0.02784245, 2.457663, 1, 1, 1, 1, 1,
0.4282775, -0.3703456, -0.04241949, 1, 1, 1, 1, 1,
0.4289739, -0.2303413, 2.226514, 1, 1, 1, 1, 1,
0.4300149, 0.3921567, 2.967413, 1, 1, 1, 1, 1,
0.4333831, -1.065049, 1.790491, 1, 1, 1, 1, 1,
0.4348206, -0.7469677, 3.230785, 1, 1, 1, 1, 1,
0.4352872, 1.34226, -0.03386128, 1, 1, 1, 1, 1,
0.4467127, -2.265098, 2.238316, 1, 1, 1, 1, 1,
0.4477092, 0.4682895, 1.773376, 1, 1, 1, 1, 1,
0.4505961, 1.433884, 0.8533664, 1, 1, 1, 1, 1,
0.4511396, 0.2110005, -0.4284262, 1, 1, 1, 1, 1,
0.4580765, 0.3625304, 1.188772, 1, 1, 1, 1, 1,
0.4587875, -1.181044, 1.356204, 0, 0, 1, 1, 1,
0.4664166, -0.8321409, 2.172823, 1, 0, 0, 1, 1,
0.4667109, -0.2196204, 1.709008, 1, 0, 0, 1, 1,
0.4667767, 1.119792, -0.4981205, 1, 0, 0, 1, 1,
0.4685611, -1.234607, 2.858387, 1, 0, 0, 1, 1,
0.4690384, 0.5674759, -0.1921328, 1, 0, 0, 1, 1,
0.4695441, -0.4564512, 1.435906, 0, 0, 0, 1, 1,
0.4713838, 1.214814, -0.3830006, 0, 0, 0, 1, 1,
0.4800804, -0.8032454, 1.153273, 0, 0, 0, 1, 1,
0.4849998, 0.2945978, 2.110819, 0, 0, 0, 1, 1,
0.4866079, -1.211092, 4.133391, 0, 0, 0, 1, 1,
0.4891252, 0.2840768, 0.2097663, 0, 0, 0, 1, 1,
0.4913588, 0.1914836, 3.071963, 0, 0, 0, 1, 1,
0.4921828, 0.5725141, 1.447142, 1, 1, 1, 1, 1,
0.493173, -1.162401, 2.754998, 1, 1, 1, 1, 1,
0.4937257, -0.7419548, 2.865763, 1, 1, 1, 1, 1,
0.4951829, 0.7645471, -0.1524068, 1, 1, 1, 1, 1,
0.4961517, 0.5174575, 0.1536178, 1, 1, 1, 1, 1,
0.4968918, -0.5259131, 1.648266, 1, 1, 1, 1, 1,
0.4969233, -1.468108, 3.584661, 1, 1, 1, 1, 1,
0.4971071, 0.04456265, 0.06252551, 1, 1, 1, 1, 1,
0.5072522, 0.3340267, -0.9498202, 1, 1, 1, 1, 1,
0.5179275, -0.1070889, 1.606943, 1, 1, 1, 1, 1,
0.5220572, 1.62874, -0.3061834, 1, 1, 1, 1, 1,
0.5238284, 1.474198, -1.715117, 1, 1, 1, 1, 1,
0.5273068, 0.3704713, 0.07442886, 1, 1, 1, 1, 1,
0.5315347, -0.3227874, -0.2916411, 1, 1, 1, 1, 1,
0.5387713, -0.01855743, 2.19869, 1, 1, 1, 1, 1,
0.5390705, -0.7996247, -0.1255387, 0, 0, 1, 1, 1,
0.544009, -0.5768977, 2.815207, 1, 0, 0, 1, 1,
0.5459775, 0.681241, 1.116398, 1, 0, 0, 1, 1,
0.5477154, 0.686532, 0.4817064, 1, 0, 0, 1, 1,
0.5489939, -0.5237276, 2.788971, 1, 0, 0, 1, 1,
0.5508379, 0.8818399, 0.004515627, 1, 0, 0, 1, 1,
0.551635, -0.5583102, 2.322948, 0, 0, 0, 1, 1,
0.5520356, -1.038547, 2.481151, 0, 0, 0, 1, 1,
0.5533649, -0.8648065, 4.430844, 0, 0, 0, 1, 1,
0.553399, -1.040797, 2.826332, 0, 0, 0, 1, 1,
0.5546824, -0.7217965, 3.299247, 0, 0, 0, 1, 1,
0.5565612, -0.6223043, 2.272881, 0, 0, 0, 1, 1,
0.5577354, -0.7126209, 2.974122, 0, 0, 0, 1, 1,
0.5588522, 0.6194189, 0.8726937, 1, 1, 1, 1, 1,
0.5591235, -1.395993, 2.112908, 1, 1, 1, 1, 1,
0.5601518, -1.721632, 2.184124, 1, 1, 1, 1, 1,
0.5673941, 0.3843177, 0.7814916, 1, 1, 1, 1, 1,
0.5675135, -0.7671918, 2.060361, 1, 1, 1, 1, 1,
0.569595, 0.01199293, 0.2789262, 1, 1, 1, 1, 1,
0.5705314, -0.01223436, 3.046224, 1, 1, 1, 1, 1,
0.5712827, -0.5210452, 2.472704, 1, 1, 1, 1, 1,
0.5729024, -0.8845344, 4.004582, 1, 1, 1, 1, 1,
0.5742897, -0.5713868, 2.392001, 1, 1, 1, 1, 1,
0.5743638, -0.7382431, 1.284172, 1, 1, 1, 1, 1,
0.5778289, 0.2131597, 2.985028, 1, 1, 1, 1, 1,
0.578297, 0.18195, 1.31544, 1, 1, 1, 1, 1,
0.5800925, 0.8249425, 0.03886053, 1, 1, 1, 1, 1,
0.5839697, -0.8568457, 3.057045, 1, 1, 1, 1, 1,
0.5901324, 0.4600809, 0.5561266, 0, 0, 1, 1, 1,
0.5923623, -1.262529, 0.9345724, 1, 0, 0, 1, 1,
0.6010846, -0.7197317, 3.081856, 1, 0, 0, 1, 1,
0.6011621, -0.5559136, 2.576535, 1, 0, 0, 1, 1,
0.604966, -1.480142, 4.24282, 1, 0, 0, 1, 1,
0.6054245, -0.9876294, 0.02831259, 1, 0, 0, 1, 1,
0.6064926, 0.3357946, 1.070927, 0, 0, 0, 1, 1,
0.6088983, 1.243372, 0.512947, 0, 0, 0, 1, 1,
0.6096785, -1.556746, 2.312742, 0, 0, 0, 1, 1,
0.6109034, 0.05560173, 0.1158572, 0, 0, 0, 1, 1,
0.6119047, 0.7008165, 2.796752, 0, 0, 0, 1, 1,
0.6131896, -1.829216, 4.895957, 0, 0, 0, 1, 1,
0.6169759, 0.3977595, 1.186295, 0, 0, 0, 1, 1,
0.6191536, 0.9581605, 1.900277, 1, 1, 1, 1, 1,
0.6208886, 0.5280024, -0.6411688, 1, 1, 1, 1, 1,
0.622094, -0.008020948, 1.213771, 1, 1, 1, 1, 1,
0.623856, 0.5877117, -0.02543712, 1, 1, 1, 1, 1,
0.6269605, 1.117079, 0.930955, 1, 1, 1, 1, 1,
0.6302035, 0.3721231, 2.038025, 1, 1, 1, 1, 1,
0.6309161, -1.77413, 2.418526, 1, 1, 1, 1, 1,
0.6372979, -0.5171538, 3.786581, 1, 1, 1, 1, 1,
0.6396219, -0.8652059, 2.047981, 1, 1, 1, 1, 1,
0.6396377, 1.415792, 3.053825, 1, 1, 1, 1, 1,
0.6432224, -0.6661623, 1.526349, 1, 1, 1, 1, 1,
0.6446582, 0.2444528, -0.1975828, 1, 1, 1, 1, 1,
0.6448995, 0.6512129, -1.022433, 1, 1, 1, 1, 1,
0.6510838, -1.019587, 3.06725, 1, 1, 1, 1, 1,
0.6528355, -1.33076, 2.498598, 1, 1, 1, 1, 1,
0.6593302, 1.493049, -0.4001182, 0, 0, 1, 1, 1,
0.6594558, -1.627591, 3.054874, 1, 0, 0, 1, 1,
0.663393, 1.287409, -0.1594364, 1, 0, 0, 1, 1,
0.6670774, 0.2944284, 1.811543, 1, 0, 0, 1, 1,
0.6714841, -1.113453, 4.609788, 1, 0, 0, 1, 1,
0.6796905, 0.3677861, 1.974409, 1, 0, 0, 1, 1,
0.6799782, 0.0314907, 1.339171, 0, 0, 0, 1, 1,
0.6868565, -0.4564467, 1.393462, 0, 0, 0, 1, 1,
0.6919232, 0.6494415, 1.927732, 0, 0, 0, 1, 1,
0.6954414, -0.6938121, 2.283181, 0, 0, 0, 1, 1,
0.6963463, -0.9592153, 3.339816, 0, 0, 0, 1, 1,
0.6970034, -0.3452825, 3.329492, 0, 0, 0, 1, 1,
0.7014558, 0.9992694, 1.701169, 0, 0, 0, 1, 1,
0.7027358, 2.102682, 3.485687, 1, 1, 1, 1, 1,
0.7038033, 1.434554, 2.52165, 1, 1, 1, 1, 1,
0.7072982, 1.096204, 0.3295328, 1, 1, 1, 1, 1,
0.7142817, 0.4706628, 1.702999, 1, 1, 1, 1, 1,
0.7145507, 0.4035781, 1.492625, 1, 1, 1, 1, 1,
0.7151572, 2.1183, -1.001261, 1, 1, 1, 1, 1,
0.7170871, 0.9107167, 0.6494807, 1, 1, 1, 1, 1,
0.7172731, 1.420246, 1.587053, 1, 1, 1, 1, 1,
0.7245676, 0.8464309, 1.580719, 1, 1, 1, 1, 1,
0.725378, -1.533837, 4.06041, 1, 1, 1, 1, 1,
0.7263907, -2.952174, 1.794378, 1, 1, 1, 1, 1,
0.7264547, -0.3023953, 1.035208, 1, 1, 1, 1, 1,
0.7311297, 0.06402991, -0.09755108, 1, 1, 1, 1, 1,
0.7320135, 0.225116, 2.600295, 1, 1, 1, 1, 1,
0.7387902, 0.4065718, 1.29869, 1, 1, 1, 1, 1,
0.7394663, 0.1410068, 1.590834, 0, 0, 1, 1, 1,
0.7428096, -0.1682296, 1.031357, 1, 0, 0, 1, 1,
0.7499732, -1.467268, 3.19253, 1, 0, 0, 1, 1,
0.7526181, 2.07317, 0.4210639, 1, 0, 0, 1, 1,
0.7555689, 0.9455619, 0.8450227, 1, 0, 0, 1, 1,
0.7574975, 0.4830241, 1.644469, 1, 0, 0, 1, 1,
0.7582915, 2.476249, 2.748161, 0, 0, 0, 1, 1,
0.7613932, -0.1241967, 2.45231, 0, 0, 0, 1, 1,
0.7640256, 0.8652772, 1.797496, 0, 0, 0, 1, 1,
0.7673636, 0.1903789, 2.881697, 0, 0, 0, 1, 1,
0.7700766, -1.041168, 1.73767, 0, 0, 0, 1, 1,
0.7777905, -1.141075, 1.563572, 0, 0, 0, 1, 1,
0.7825992, -1.252275, 3.603599, 0, 0, 0, 1, 1,
0.783718, -0.4827765, 3.725379, 1, 1, 1, 1, 1,
0.7844341, -1.392648, 3.714055, 1, 1, 1, 1, 1,
0.7853422, -0.5083289, 2.092991, 1, 1, 1, 1, 1,
0.7866648, -1.193236, 1.921786, 1, 1, 1, 1, 1,
0.7880133, -1.115633, 3.318753, 1, 1, 1, 1, 1,
0.7905302, 0.363735, 1.19995, 1, 1, 1, 1, 1,
0.7937025, 0.5327953, 1.018761, 1, 1, 1, 1, 1,
0.7946399, 1.073029, 1.462278, 1, 1, 1, 1, 1,
0.7950029, -1.214388, 2.753251, 1, 1, 1, 1, 1,
0.800203, 1.177565, 0.05715518, 1, 1, 1, 1, 1,
0.8049861, 0.4179671, 1.312981, 1, 1, 1, 1, 1,
0.8056095, 0.5714026, 2.23547, 1, 1, 1, 1, 1,
0.8179636, -0.4087386, 2.805872, 1, 1, 1, 1, 1,
0.8262412, 0.701282, 2.352994, 1, 1, 1, 1, 1,
0.8266577, -0.2993942, 1.998403, 1, 1, 1, 1, 1,
0.8276085, 0.1794606, 2.631548, 0, 0, 1, 1, 1,
0.828463, -0.07900815, 2.059924, 1, 0, 0, 1, 1,
0.8304454, -1.039347, 1.617347, 1, 0, 0, 1, 1,
0.8353652, 0.55088, 1.667059, 1, 0, 0, 1, 1,
0.8357981, -0.1954631, 2.718239, 1, 0, 0, 1, 1,
0.8406582, 1.048852, 0.9258772, 1, 0, 0, 1, 1,
0.8451638, 1.445065, -0.03820585, 0, 0, 0, 1, 1,
0.8500692, -0.8753702, 2.233653, 0, 0, 0, 1, 1,
0.8563561, -0.1172366, 2.052728, 0, 0, 0, 1, 1,
0.8634816, -0.2362384, 0.9432349, 0, 0, 0, 1, 1,
0.8638818, 0.8304237, -0.6458264, 0, 0, 0, 1, 1,
0.8654276, 1.061941, -0.4912227, 0, 0, 0, 1, 1,
0.8686043, 0.1425054, 0.3024813, 0, 0, 0, 1, 1,
0.8769637, 0.2347956, -0.2215832, 1, 1, 1, 1, 1,
0.8785519, -0.1991773, 2.242568, 1, 1, 1, 1, 1,
0.8794152, -1.395791, 4.136544, 1, 1, 1, 1, 1,
0.8794565, -1.573436, 3.369308, 1, 1, 1, 1, 1,
0.8925825, 0.4645222, 0.4828441, 1, 1, 1, 1, 1,
0.8942026, -0.317766, 0.6782299, 1, 1, 1, 1, 1,
0.8998937, 0.619167, 0.7542495, 1, 1, 1, 1, 1,
0.9006251, -0.2236611, 3.170193, 1, 1, 1, 1, 1,
0.9029389, 1.72502, 1.218513, 1, 1, 1, 1, 1,
0.905341, 0.2229643, 1.716023, 1, 1, 1, 1, 1,
0.9061368, 0.03530467, 1.442997, 1, 1, 1, 1, 1,
0.9087755, 2.020285, 0.05979987, 1, 1, 1, 1, 1,
0.9093765, -0.9465323, 2.843381, 1, 1, 1, 1, 1,
0.9142072, 1.128685, 2.21277, 1, 1, 1, 1, 1,
0.9148418, 1.750559, -0.9408355, 1, 1, 1, 1, 1,
0.9168586, 1.348905, -0.3069664, 0, 0, 1, 1, 1,
0.9251779, -1.039052, 2.707256, 1, 0, 0, 1, 1,
0.927961, 0.4374285, 0.6608708, 1, 0, 0, 1, 1,
0.9286884, -1.859818, 3.058598, 1, 0, 0, 1, 1,
0.9360825, 0.1740315, 1.466427, 1, 0, 0, 1, 1,
0.9368802, -0.9135421, 1.333442, 1, 0, 0, 1, 1,
0.9383666, -1.164334, 1.666903, 0, 0, 0, 1, 1,
0.9410586, -2.391248, 0.1806605, 0, 0, 0, 1, 1,
0.9424736, 0.0829861, 2.002312, 0, 0, 0, 1, 1,
0.9444389, -0.2433918, 1.346318, 0, 0, 0, 1, 1,
0.9447365, -1.644661, 3.281851, 0, 0, 0, 1, 1,
0.9460011, -0.4440661, -0.2320478, 0, 0, 0, 1, 1,
0.9538762, 0.7264406, 2.536494, 0, 0, 0, 1, 1,
0.9594445, -1.16239, 1.418474, 1, 1, 1, 1, 1,
0.9598266, -0.2557274, 2.653162, 1, 1, 1, 1, 1,
0.9666392, -0.5951918, 1.234894, 1, 1, 1, 1, 1,
0.9765736, -2.10908, 1.699668, 1, 1, 1, 1, 1,
0.9768572, -0.4888055, 1.509886, 1, 1, 1, 1, 1,
0.9787261, -0.05728469, 2.497547, 1, 1, 1, 1, 1,
0.9796454, -0.674157, 0.9461375, 1, 1, 1, 1, 1,
0.9814723, 0.3597774, -0.6610058, 1, 1, 1, 1, 1,
0.983235, -0.1011446, 1.867558, 1, 1, 1, 1, 1,
0.9856388, -0.7590963, 1.842193, 1, 1, 1, 1, 1,
0.9874794, -1.492971, 3.543418, 1, 1, 1, 1, 1,
0.9897441, -0.2019198, 2.092217, 1, 1, 1, 1, 1,
0.9911289, -0.4570443, 1.774053, 1, 1, 1, 1, 1,
0.9999292, 1.579532, -0.6300264, 1, 1, 1, 1, 1,
1.001859, -0.4129162, 2.544087, 1, 1, 1, 1, 1,
1.004663, 0.06784585, -0.2193865, 0, 0, 1, 1, 1,
1.007464, 1.630298, 0.08924542, 1, 0, 0, 1, 1,
1.013602, -0.5785462, 3.218569, 1, 0, 0, 1, 1,
1.017843, -1.365773, 2.107976, 1, 0, 0, 1, 1,
1.019217, 0.6406254, 2.352286, 1, 0, 0, 1, 1,
1.022071, 0.1405601, 0.7471573, 1, 0, 0, 1, 1,
1.02358, -1.559129, 2.301404, 0, 0, 0, 1, 1,
1.025192, -1.225825, 1.622559, 0, 0, 0, 1, 1,
1.03227, 0.4894325, 1.342317, 0, 0, 0, 1, 1,
1.036303, -0.3062377, 4.801203, 0, 0, 0, 1, 1,
1.038976, -0.173885, 2.382528, 0, 0, 0, 1, 1,
1.044622, 0.2370603, 0.9716762, 0, 0, 0, 1, 1,
1.048385, 0.4930938, 1.116104, 0, 0, 0, 1, 1,
1.057843, -0.8503883, 3.122175, 1, 1, 1, 1, 1,
1.059523, 0.0942867, 0.7311987, 1, 1, 1, 1, 1,
1.060011, -0.1468107, 2.814567, 1, 1, 1, 1, 1,
1.061238, -1.609437, 3.018098, 1, 1, 1, 1, 1,
1.061788, -1.862961, 4.076784, 1, 1, 1, 1, 1,
1.063102, -1.59001, 1.767686, 1, 1, 1, 1, 1,
1.06325, -0.2818697, 0.8987448, 1, 1, 1, 1, 1,
1.065439, 0.6806336, -0.03953255, 1, 1, 1, 1, 1,
1.066833, 1.104298, 1.073729, 1, 1, 1, 1, 1,
1.068914, 0.6862938, 0.5625048, 1, 1, 1, 1, 1,
1.071531, -0.1109275, 0.7022467, 1, 1, 1, 1, 1,
1.072118, 0.1149236, -0.3202173, 1, 1, 1, 1, 1,
1.075345, -0.189401, 1.829139, 1, 1, 1, 1, 1,
1.082414, -0.6921506, 2.404922, 1, 1, 1, 1, 1,
1.095792, 0.1915551, 2.115237, 1, 1, 1, 1, 1,
1.110216, -0.1362582, 1.386395, 0, 0, 1, 1, 1,
1.111383, 0.2167945, 0.1058843, 1, 0, 0, 1, 1,
1.114581, -0.4359231, 1.795466, 1, 0, 0, 1, 1,
1.125698, 0.3674576, 1.363322, 1, 0, 0, 1, 1,
1.130798, -0.8281745, 2.710485, 1, 0, 0, 1, 1,
1.134547, 0.1645698, 0.009660554, 1, 0, 0, 1, 1,
1.141723, -0.3248083, 2.25435, 0, 0, 0, 1, 1,
1.150212, -0.5694435, 3.599463, 0, 0, 0, 1, 1,
1.152129, 0.1829113, 2.130731, 0, 0, 0, 1, 1,
1.161466, 1.13012, 0.3807957, 0, 0, 0, 1, 1,
1.162447, 1.330193, -0.2934619, 0, 0, 0, 1, 1,
1.166216, -1.106915, 2.209551, 0, 0, 0, 1, 1,
1.17358, 0.277376, 1.888949, 0, 0, 0, 1, 1,
1.174183, 0.3076396, 1.042783, 1, 1, 1, 1, 1,
1.175516, -0.8890599, 3.025219, 1, 1, 1, 1, 1,
1.182396, 1.448148, 1.120514, 1, 1, 1, 1, 1,
1.183489, -0.5052764, 3.349764, 1, 1, 1, 1, 1,
1.185954, -0.7193974, 1.323416, 1, 1, 1, 1, 1,
1.190844, -0.02466636, 1.605675, 1, 1, 1, 1, 1,
1.194044, -0.3571514, 2.532646, 1, 1, 1, 1, 1,
1.196016, 1.098455, 1.722235, 1, 1, 1, 1, 1,
1.205559, 0.2597563, 2.822205, 1, 1, 1, 1, 1,
1.206379, -0.9064139, 3.303328, 1, 1, 1, 1, 1,
1.218227, -0.3801438, 0.6029877, 1, 1, 1, 1, 1,
1.222135, -0.157103, 1.915936, 1, 1, 1, 1, 1,
1.224989, -1.231361, 2.060764, 1, 1, 1, 1, 1,
1.230595, 2.457286, -0.2408036, 1, 1, 1, 1, 1,
1.235263, 0.1342178, 2.604592, 1, 1, 1, 1, 1,
1.237969, -0.9597425, 3.041917, 0, 0, 1, 1, 1,
1.24167, 1.178737, 1.167648, 1, 0, 0, 1, 1,
1.247714, 0.2920414, 0.374287, 1, 0, 0, 1, 1,
1.250003, -0.7940194, 2.8995, 1, 0, 0, 1, 1,
1.257999, -0.7155389, 3.644644, 1, 0, 0, 1, 1,
1.27121, 0.0826639, 0.8661238, 1, 0, 0, 1, 1,
1.279388, -0.5016719, 1.977768, 0, 0, 0, 1, 1,
1.285334, -0.2698227, 3.229081, 0, 0, 0, 1, 1,
1.304268, 0.2955251, 1.188618, 0, 0, 0, 1, 1,
1.30943, 0.2082411, -0.4399027, 0, 0, 0, 1, 1,
1.314164, 0.2340804, -0.06078095, 0, 0, 0, 1, 1,
1.320052, 0.03029631, -0.2202222, 0, 0, 0, 1, 1,
1.324823, -0.03327543, 2.168429, 0, 0, 0, 1, 1,
1.3293, -1.21258, 4.395099, 1, 1, 1, 1, 1,
1.329871, -0.4560252, 2.531445, 1, 1, 1, 1, 1,
1.348251, -0.9853258, 2.837536, 1, 1, 1, 1, 1,
1.352581, 0.04954269, -0.004531188, 1, 1, 1, 1, 1,
1.355829, -0.8028826, 1.501788, 1, 1, 1, 1, 1,
1.365407, 0.09129864, 2.235272, 1, 1, 1, 1, 1,
1.36725, 0.465483, 1.92667, 1, 1, 1, 1, 1,
1.371265, -0.3072112, 2.776858, 1, 1, 1, 1, 1,
1.373145, 0.4304015, 1.339471, 1, 1, 1, 1, 1,
1.375079, 0.4327399, 0.7015266, 1, 1, 1, 1, 1,
1.381285, -0.8161335, 2.964917, 1, 1, 1, 1, 1,
1.406092, -1.05596, 1.957683, 1, 1, 1, 1, 1,
1.410242, -0.2308313, 1.380663, 1, 1, 1, 1, 1,
1.415631, 0.545827, -1.215968, 1, 1, 1, 1, 1,
1.415968, 0.1634658, 1.507919, 1, 1, 1, 1, 1,
1.416338, -1.207744, 1.469451, 0, 0, 1, 1, 1,
1.422244, -1.108683, 2.881902, 1, 0, 0, 1, 1,
1.429189, -0.08471748, 1.946452, 1, 0, 0, 1, 1,
1.440401, 0.6958135, 0.08665483, 1, 0, 0, 1, 1,
1.445165, 0.2986068, 2.548756, 1, 0, 0, 1, 1,
1.453634, 0.5491595, 1.288738, 1, 0, 0, 1, 1,
1.459183, -0.1206774, 1.657545, 0, 0, 0, 1, 1,
1.46345, 0.6162126, 0.952095, 0, 0, 0, 1, 1,
1.477416, -0.7639978, 2.645017, 0, 0, 0, 1, 1,
1.496591, -0.5385253, 2.899563, 0, 0, 0, 1, 1,
1.506311, -0.4105585, 1.257191, 0, 0, 0, 1, 1,
1.508356, 0.5029087, 2.628231, 0, 0, 0, 1, 1,
1.526522, -0.8358423, 2.242677, 0, 0, 0, 1, 1,
1.527779, 1.726492, -0.1522388, 1, 1, 1, 1, 1,
1.530308, -0.001401664, 0.3707177, 1, 1, 1, 1, 1,
1.533059, -0.4436833, 1.112828, 1, 1, 1, 1, 1,
1.533465, -0.05869172, 2.544021, 1, 1, 1, 1, 1,
1.547749, -0.4857531, 3.740597, 1, 1, 1, 1, 1,
1.549233, -1.505297, 3.167668, 1, 1, 1, 1, 1,
1.575513, 0.01212637, 0.857208, 1, 1, 1, 1, 1,
1.583251, -0.03438707, 1.739698, 1, 1, 1, 1, 1,
1.602104, -0.7891182, 1.798876, 1, 1, 1, 1, 1,
1.628071, -0.835331, 1.563508, 1, 1, 1, 1, 1,
1.634949, 0.5520896, 0.2203836, 1, 1, 1, 1, 1,
1.646818, 0.6709424, 0.1725481, 1, 1, 1, 1, 1,
1.649797, 0.2729206, 2.084098, 1, 1, 1, 1, 1,
1.652013, -0.6137319, 2.113199, 1, 1, 1, 1, 1,
1.693843, -1.145903, 1.963684, 1, 1, 1, 1, 1,
1.706833, 1.621304, 1.134469, 0, 0, 1, 1, 1,
1.709832, -0.05577511, 3.912372, 1, 0, 0, 1, 1,
1.722849, 0.01762626, 2.631691, 1, 0, 0, 1, 1,
1.733997, -0.4457671, 2.798262, 1, 0, 0, 1, 1,
1.738385, -0.504854, 2.856366, 1, 0, 0, 1, 1,
1.740826, 1.426472, 0.7624148, 1, 0, 0, 1, 1,
1.747247, 1.711056, 0.4131512, 0, 0, 0, 1, 1,
1.756819, 0.3015514, 1.882657, 0, 0, 0, 1, 1,
1.775223, -0.484273, 1.53998, 0, 0, 0, 1, 1,
1.791922, 0.6523671, 2.454053, 0, 0, 0, 1, 1,
1.810944, 0.9546469, 2.485807, 0, 0, 0, 1, 1,
1.822777, -0.5678127, 1.100688, 0, 0, 0, 1, 1,
1.826367, 1.624362, 1.502798, 0, 0, 0, 1, 1,
1.828624, 0.3147863, 0.3855601, 1, 1, 1, 1, 1,
1.849069, -1.167689, 1.544806, 1, 1, 1, 1, 1,
1.874793, -1.358269, -0.0160761, 1, 1, 1, 1, 1,
1.887839, -0.9232803, 3.233511, 1, 1, 1, 1, 1,
1.890571, 0.08520824, 1.966077, 1, 1, 1, 1, 1,
1.903983, 0.7613118, 1.32473, 1, 1, 1, 1, 1,
1.905158, 0.2921288, 2.213567, 1, 1, 1, 1, 1,
1.941069, -0.2623602, 1.422185, 1, 1, 1, 1, 1,
1.949037, 0.2655284, 2.487674, 1, 1, 1, 1, 1,
1.976422, 0.1613341, 1.938819, 1, 1, 1, 1, 1,
2.000384, 0.2278354, 0.3757524, 1, 1, 1, 1, 1,
2.000874, -1.539104, 0.4200654, 1, 1, 1, 1, 1,
2.010536, -1.008114, 2.678201, 1, 1, 1, 1, 1,
2.024205, -0.2414334, 1.519017, 1, 1, 1, 1, 1,
2.033039, -1.118653, 3.254257, 1, 1, 1, 1, 1,
2.046027, 0.524442, 0.9665896, 0, 0, 1, 1, 1,
2.0771, -0.4535848, 1.681878, 1, 0, 0, 1, 1,
2.125978, -0.459514, 2.452451, 1, 0, 0, 1, 1,
2.163198, 0.1995712, 1.82645, 1, 0, 0, 1, 1,
2.165494, -1.453241, 0.4899366, 1, 0, 0, 1, 1,
2.207518, -1.167527, 2.536589, 1, 0, 0, 1, 1,
2.246061, 1.087544, 2.17561, 0, 0, 0, 1, 1,
2.252702, -0.662364, 2.048422, 0, 0, 0, 1, 1,
2.263114, 0.3658186, 1.188687, 0, 0, 0, 1, 1,
2.395764, 1.209986, -0.0858824, 0, 0, 0, 1, 1,
2.45929, 1.651102, 1.431514, 0, 0, 0, 1, 1,
2.49649, 0.1157371, 1.555722, 0, 0, 0, 1, 1,
2.570966, -0.2383299, 1.50414, 0, 0, 0, 1, 1,
2.660661, 0.6546105, 0.1589144, 1, 1, 1, 1, 1,
2.666842, -0.01089001, 1.699544, 1, 1, 1, 1, 1,
2.720419, -0.2152693, 1.530191, 1, 1, 1, 1, 1,
2.995627, -1.847374, 2.216741, 1, 1, 1, 1, 1,
3.005173, 0.2464721, 1.968737, 1, 1, 1, 1, 1,
3.018533, -0.4199555, 3.541642, 1, 1, 1, 1, 1,
3.038805, 2.364925, 0.6276118, 1, 1, 1, 1, 1
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
var radius = 9.592131;
var distance = 33.69195;
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
mvMatrix.translate( -0.1240132, -0.2365373, -0.08350778 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.69195);
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
