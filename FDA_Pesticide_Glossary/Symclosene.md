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
-3.762409, 2.696853, -1.155219, 1, 0, 0, 1,
-3.275834, 0.4493395, -1.356963, 1, 0.007843138, 0, 1,
-2.64127, -1.386913, -2.673075, 1, 0.01176471, 0, 1,
-2.520285, 1.346384, -1.288556, 1, 0.01960784, 0, 1,
-2.511576, -1.325578, -1.064017, 1, 0.02352941, 0, 1,
-2.506983, 0.6996706, -2.24762, 1, 0.03137255, 0, 1,
-2.420313, -0.051944, -1.732461, 1, 0.03529412, 0, 1,
-2.247995, -0.3593219, -0.222977, 1, 0.04313726, 0, 1,
-2.205514, 1.319351, 0.7592173, 1, 0.04705882, 0, 1,
-2.152529, 0.8766655, -0.8939009, 1, 0.05490196, 0, 1,
-2.108796, -0.2361437, -1.839081, 1, 0.05882353, 0, 1,
-2.096007, 0.9308923, -0.3160248, 1, 0.06666667, 0, 1,
-2.075176, -0.1595672, -0.9317423, 1, 0.07058824, 0, 1,
-2.012216, 0.8796883, 0.1665727, 1, 0.07843138, 0, 1,
-2.001777, 0.395859, 0.9218197, 1, 0.08235294, 0, 1,
-1.989229, -0.2432278, -3.178094, 1, 0.09019608, 0, 1,
-1.935866, 0.9098703, -1.767908, 1, 0.09411765, 0, 1,
-1.920797, 0.04041658, -1.646916, 1, 0.1019608, 0, 1,
-1.908107, -2.56623, -1.738196, 1, 0.1098039, 0, 1,
-1.888331, -0.3104092, -0.8808505, 1, 0.1137255, 0, 1,
-1.863031, -0.5270275, -1.651384, 1, 0.1215686, 0, 1,
-1.805816, 0.3854912, -0.1729562, 1, 0.1254902, 0, 1,
-1.796475, 0.1306143, -1.96381, 1, 0.1333333, 0, 1,
-1.795005, -0.6234646, 0.7371395, 1, 0.1372549, 0, 1,
-1.79043, -0.2087832, -2.168352, 1, 0.145098, 0, 1,
-1.782528, 0.855261, -1.384155, 1, 0.1490196, 0, 1,
-1.767788, -0.05461108, -4.082275, 1, 0.1568628, 0, 1,
-1.763884, -0.6225681, -3.864676, 1, 0.1607843, 0, 1,
-1.740698, 1.587437, -1.271142, 1, 0.1686275, 0, 1,
-1.732712, 0.6685759, -1.013374, 1, 0.172549, 0, 1,
-1.720671, 0.5659672, -2.311715, 1, 0.1803922, 0, 1,
-1.702446, -0.6782246, -0.3162861, 1, 0.1843137, 0, 1,
-1.694363, -0.6360797, -1.705779, 1, 0.1921569, 0, 1,
-1.691414, 0.05687144, -2.571413, 1, 0.1960784, 0, 1,
-1.667884, 1.651499, -1.156943, 1, 0.2039216, 0, 1,
-1.662738, 0.3589678, -2.312768, 1, 0.2117647, 0, 1,
-1.651323, -1.099604, -2.829147, 1, 0.2156863, 0, 1,
-1.645409, -0.6528768, -1.284383, 1, 0.2235294, 0, 1,
-1.639372, 0.3714401, -2.157808, 1, 0.227451, 0, 1,
-1.635514, -1.134201, -3.647933, 1, 0.2352941, 0, 1,
-1.632353, 0.689105, -0.9054714, 1, 0.2392157, 0, 1,
-1.63062, -0.2842144, -2.60494, 1, 0.2470588, 0, 1,
-1.628819, 0.9674322, 1.973159, 1, 0.2509804, 0, 1,
-1.625458, -1.386241, -2.37921, 1, 0.2588235, 0, 1,
-1.621622, 0.1082117, -1.034923, 1, 0.2627451, 0, 1,
-1.619992, 0.5760176, 0.06918444, 1, 0.2705882, 0, 1,
-1.619097, -0.04407792, -1.96958, 1, 0.2745098, 0, 1,
-1.61362, -0.8534681, -2.588447, 1, 0.282353, 0, 1,
-1.599918, 0.9155601, -0.7086691, 1, 0.2862745, 0, 1,
-1.599266, 1.506153, -2.601837, 1, 0.2941177, 0, 1,
-1.598279, 1.649421, -1.204625, 1, 0.3019608, 0, 1,
-1.597867, -0.9226279, -2.443538, 1, 0.3058824, 0, 1,
-1.580808, -1.669272, -3.264955, 1, 0.3137255, 0, 1,
-1.572642, 0.3853786, 0.1736159, 1, 0.3176471, 0, 1,
-1.565892, -1.455102, -1.390386, 1, 0.3254902, 0, 1,
-1.565884, -1.010636, -4.33119, 1, 0.3294118, 0, 1,
-1.548801, 1.198254, -1.435007, 1, 0.3372549, 0, 1,
-1.546338, -0.04828021, -1.368428, 1, 0.3411765, 0, 1,
-1.546116, 2.247577, -1.727033, 1, 0.3490196, 0, 1,
-1.541078, 0.6245053, -0.731468, 1, 0.3529412, 0, 1,
-1.506248, 1.047617, 0.5897888, 1, 0.3607843, 0, 1,
-1.502356, 0.6042951, -0.0314026, 1, 0.3647059, 0, 1,
-1.494599, -1.889327, -1.152083, 1, 0.372549, 0, 1,
-1.493763, -0.1079404, -2.380055, 1, 0.3764706, 0, 1,
-1.491772, -0.1063315, -1.575622, 1, 0.3843137, 0, 1,
-1.488234, 0.4610408, 0.5929991, 1, 0.3882353, 0, 1,
-1.484137, 0.3998632, -2.51382, 1, 0.3960784, 0, 1,
-1.480207, 1.856707, -0.307341, 1, 0.4039216, 0, 1,
-1.470388, 0.002707493, -3.973454, 1, 0.4078431, 0, 1,
-1.469517, 0.1106105, -2.279202, 1, 0.4156863, 0, 1,
-1.469454, 1.054381, 0.08010604, 1, 0.4196078, 0, 1,
-1.465652, 2.04209, -0.2270537, 1, 0.427451, 0, 1,
-1.464473, -1.114525, -3.265568, 1, 0.4313726, 0, 1,
-1.455223, -1.408659, -3.62654, 1, 0.4392157, 0, 1,
-1.440588, -1.678733, -3.941311, 1, 0.4431373, 0, 1,
-1.427979, -0.4648459, -2.421242, 1, 0.4509804, 0, 1,
-1.425311, 1.00977, -1.027012, 1, 0.454902, 0, 1,
-1.422909, 1.99576, -2.128429, 1, 0.4627451, 0, 1,
-1.410703, -0.6059745, -2.969673, 1, 0.4666667, 0, 1,
-1.383767, -1.425782, -3.023232, 1, 0.4745098, 0, 1,
-1.365457, 1.73105, 0.4265071, 1, 0.4784314, 0, 1,
-1.352733, 1.206072, -0.3747275, 1, 0.4862745, 0, 1,
-1.347646, 1.36428, -1.696631, 1, 0.4901961, 0, 1,
-1.338896, 0.5521465, -3.472412, 1, 0.4980392, 0, 1,
-1.335911, -0.5101126, -3.094256, 1, 0.5058824, 0, 1,
-1.335623, 0.8365733, -0.1201765, 1, 0.509804, 0, 1,
-1.321527, 0.4917485, -3.063849, 1, 0.5176471, 0, 1,
-1.321232, -0.1665257, -0.8443245, 1, 0.5215687, 0, 1,
-1.320906, -0.2610939, -0.5493559, 1, 0.5294118, 0, 1,
-1.313059, 0.8802387, -1.519837, 1, 0.5333334, 0, 1,
-1.29379, -0.8551952, -3.833686, 1, 0.5411765, 0, 1,
-1.29207, -1.411958, -2.287622, 1, 0.5450981, 0, 1,
-1.290567, 0.2936293, -1.023461, 1, 0.5529412, 0, 1,
-1.286314, -1.033303, -2.140342, 1, 0.5568628, 0, 1,
-1.280806, 2.255813, -0.5385181, 1, 0.5647059, 0, 1,
-1.275378, -0.5210401, -1.770273, 1, 0.5686275, 0, 1,
-1.269189, -3.066, -1.093504, 1, 0.5764706, 0, 1,
-1.266227, 0.746206, 0.5196993, 1, 0.5803922, 0, 1,
-1.264942, -1.366377, -1.386468, 1, 0.5882353, 0, 1,
-1.262756, -0.2293082, -0.9428802, 1, 0.5921569, 0, 1,
-1.256943, 1.671356, -0.6248334, 1, 0.6, 0, 1,
-1.252061, -0.5402245, -1.477676, 1, 0.6078432, 0, 1,
-1.245642, 0.01549336, -1.589482, 1, 0.6117647, 0, 1,
-1.23962, 1.597304, -1.924614, 1, 0.6196079, 0, 1,
-1.239296, -0.008231906, -1.450794, 1, 0.6235294, 0, 1,
-1.238251, -0.9947398, -2.169988, 1, 0.6313726, 0, 1,
-1.236427, 1.058102, -0.6892006, 1, 0.6352941, 0, 1,
-1.217441, -2.038912, -1.59285, 1, 0.6431373, 0, 1,
-1.216874, -0.4885902, -0.8356611, 1, 0.6470588, 0, 1,
-1.2124, 0.1745794, -2.407556, 1, 0.654902, 0, 1,
-1.181837, 1.398416, -0.5871789, 1, 0.6588235, 0, 1,
-1.178748, 1.451911, -0.8407716, 1, 0.6666667, 0, 1,
-1.176767, 2.708578, -0.4586389, 1, 0.6705883, 0, 1,
-1.158768, 0.3678546, -2.610064, 1, 0.6784314, 0, 1,
-1.156178, 0.5987472, -0.3419674, 1, 0.682353, 0, 1,
-1.152763, 0.2565269, -0.9085705, 1, 0.6901961, 0, 1,
-1.150374, 0.6554712, -0.6355464, 1, 0.6941177, 0, 1,
-1.150122, -1.350674, -1.909188, 1, 0.7019608, 0, 1,
-1.146724, -1.07766, -3.227283, 1, 0.7098039, 0, 1,
-1.139682, 0.7949629, 0.2400474, 1, 0.7137255, 0, 1,
-1.136755, -1.545177, -1.635305, 1, 0.7215686, 0, 1,
-1.129782, 0.3758799, -1.138171, 1, 0.7254902, 0, 1,
-1.129356, 0.4162975, -1.921232, 1, 0.7333333, 0, 1,
-1.116582, 2.185197, 0.5975789, 1, 0.7372549, 0, 1,
-1.111541, 0.3831593, 0.09664514, 1, 0.7450981, 0, 1,
-1.111406, -1.369079, -1.920788, 1, 0.7490196, 0, 1,
-1.108921, 0.4595416, -1.024887, 1, 0.7568628, 0, 1,
-1.106599, 0.1219723, 1.063426, 1, 0.7607843, 0, 1,
-1.105687, 0.556351, -3.547683, 1, 0.7686275, 0, 1,
-1.104033, -1.026861, -3.923938, 1, 0.772549, 0, 1,
-1.086865, -0.3862552, -1.720872, 1, 0.7803922, 0, 1,
-1.078341, -0.6218062, -1.081986, 1, 0.7843137, 0, 1,
-1.077219, 0.5307014, -0.4838137, 1, 0.7921569, 0, 1,
-1.071751, 0.7587091, -0.7309083, 1, 0.7960784, 0, 1,
-1.068834, -0.9789946, -2.760261, 1, 0.8039216, 0, 1,
-1.06142, 1.486626, -1.049616, 1, 0.8117647, 0, 1,
-1.048076, 1.627928, 1.15005, 1, 0.8156863, 0, 1,
-1.037709, 0.3171262, -2.319125, 1, 0.8235294, 0, 1,
-1.037616, 0.1991205, -2.915309, 1, 0.827451, 0, 1,
-1.032567, -1.08604, -3.409382, 1, 0.8352941, 0, 1,
-1.03207, -0.8757885, -0.6885918, 1, 0.8392157, 0, 1,
-1.029446, -0.3556309, -3.197638, 1, 0.8470588, 0, 1,
-1.021855, -0.8098826, -1.364037, 1, 0.8509804, 0, 1,
-1.01834, 0.5580343, 0.3979572, 1, 0.8588235, 0, 1,
-1.01273, 0.7009829, 0.03954645, 1, 0.8627451, 0, 1,
-1.010795, -0.5289128, -2.10728, 1, 0.8705882, 0, 1,
-1.003081, -0.8470546, -0.6984519, 1, 0.8745098, 0, 1,
-0.9917902, 1.214, -0.6046342, 1, 0.8823529, 0, 1,
-0.989728, -0.8159364, -1.719546, 1, 0.8862745, 0, 1,
-0.9894617, -0.1345995, -1.761393, 1, 0.8941177, 0, 1,
-0.9853702, -1.214232, -2.467553, 1, 0.8980392, 0, 1,
-0.9852788, -0.431904, -3.726916, 1, 0.9058824, 0, 1,
-0.9846557, -0.2358432, -2.332804, 1, 0.9137255, 0, 1,
-0.9821498, 0.7286433, -2.253229, 1, 0.9176471, 0, 1,
-0.9810105, -1.248235, -1.852126, 1, 0.9254902, 0, 1,
-0.975553, 0.3006096, -2.162342, 1, 0.9294118, 0, 1,
-0.974628, 0.795568, -0.3427779, 1, 0.9372549, 0, 1,
-0.9739928, -0.1532011, -0.7219533, 1, 0.9411765, 0, 1,
-0.9697272, 0.6691779, -1.874485, 1, 0.9490196, 0, 1,
-0.9681416, -0.297668, -0.8822011, 1, 0.9529412, 0, 1,
-0.9661227, -0.5104105, -2.542309, 1, 0.9607843, 0, 1,
-0.9637823, -0.04976951, -1.188497, 1, 0.9647059, 0, 1,
-0.9625169, 0.04209953, -2.114868, 1, 0.972549, 0, 1,
-0.9508328, -0.903791, -3.0913, 1, 0.9764706, 0, 1,
-0.9502609, -0.05091041, -1.9713, 1, 0.9843137, 0, 1,
-0.9472424, -1.434824, -2.30661, 1, 0.9882353, 0, 1,
-0.9458079, -0.3338965, -1.95145, 1, 0.9960784, 0, 1,
-0.939896, -1.026483, -0.8918566, 0.9960784, 1, 0, 1,
-0.9395468, -0.001644809, -2.78257, 0.9921569, 1, 0, 1,
-0.9346271, 0.7122094, -0.8802111, 0.9843137, 1, 0, 1,
-0.9313668, 0.8461562, 0.817036, 0.9803922, 1, 0, 1,
-0.9293858, 1.883367, 1.343025, 0.972549, 1, 0, 1,
-0.9277344, -0.419965, -1.990094, 0.9686275, 1, 0, 1,
-0.9172767, -0.3117122, -0.794782, 0.9607843, 1, 0, 1,
-0.9147314, 0.6983134, -1.771536, 0.9568627, 1, 0, 1,
-0.912236, -1.169356, -2.206883, 0.9490196, 1, 0, 1,
-0.9064053, 0.9355655, -1.347806, 0.945098, 1, 0, 1,
-0.9045097, 0.1522458, -0.466454, 0.9372549, 1, 0, 1,
-0.9025682, 0.1911181, -0.8154442, 0.9333333, 1, 0, 1,
-0.9006235, -0.5670063, -3.271397, 0.9254902, 1, 0, 1,
-0.8963577, 0.2509573, -1.523557, 0.9215686, 1, 0, 1,
-0.8828851, 0.9750186, -1.051513, 0.9137255, 1, 0, 1,
-0.8818225, -1.312107, -0.7472202, 0.9098039, 1, 0, 1,
-0.8800633, 1.084796, 0.5313095, 0.9019608, 1, 0, 1,
-0.8714439, 0.3417341, -1.713422, 0.8941177, 1, 0, 1,
-0.8656117, 0.2830969, -0.2113135, 0.8901961, 1, 0, 1,
-0.8575547, -0.2557825, -1.751239, 0.8823529, 1, 0, 1,
-0.8546352, 2.196476, -0.5509052, 0.8784314, 1, 0, 1,
-0.8472672, -0.09580667, -0.5247533, 0.8705882, 1, 0, 1,
-0.8455311, 0.9182717, -0.1393214, 0.8666667, 1, 0, 1,
-0.8436345, 0.9616613, -0.0169352, 0.8588235, 1, 0, 1,
-0.8426837, 0.4408983, -1.384347, 0.854902, 1, 0, 1,
-0.8414991, 0.3211086, 0.02216177, 0.8470588, 1, 0, 1,
-0.8413432, -0.9445965, -2.617073, 0.8431373, 1, 0, 1,
-0.8374841, -0.3724969, -1.495906, 0.8352941, 1, 0, 1,
-0.8359893, 1.600167, 0.01694429, 0.8313726, 1, 0, 1,
-0.8339498, -1.186783, -3.888995, 0.8235294, 1, 0, 1,
-0.8317778, -0.04590711, -2.436879, 0.8196079, 1, 0, 1,
-0.8311481, 0.01092612, -1.915949, 0.8117647, 1, 0, 1,
-0.8311198, -1.067534, -3.685257, 0.8078431, 1, 0, 1,
-0.8233493, -0.7251984, -2.083926, 0.8, 1, 0, 1,
-0.8213131, 1.761124, 0.6633846, 0.7921569, 1, 0, 1,
-0.820342, -0.4691437, -3.465716, 0.7882353, 1, 0, 1,
-0.8195361, -0.0364055, -1.35505, 0.7803922, 1, 0, 1,
-0.8160419, 2.517475, 1.323909, 0.7764706, 1, 0, 1,
-0.8159655, -1.100528, -0.4150336, 0.7686275, 1, 0, 1,
-0.8064483, -0.2987876, -2.268512, 0.7647059, 1, 0, 1,
-0.8063702, 1.638018, -1.008736, 0.7568628, 1, 0, 1,
-0.7966954, -0.08221751, -1.401299, 0.7529412, 1, 0, 1,
-0.7896367, 1.256124, -0.4556129, 0.7450981, 1, 0, 1,
-0.7729656, -0.2433271, -3.553966, 0.7411765, 1, 0, 1,
-0.7716141, 0.6141761, -1.343635, 0.7333333, 1, 0, 1,
-0.7696474, -1.195708, -2.278562, 0.7294118, 1, 0, 1,
-0.7694688, 1.045008, -1.080905, 0.7215686, 1, 0, 1,
-0.7685988, 1.379076, 0.7127494, 0.7176471, 1, 0, 1,
-0.7647759, -0.5314021, -1.489735, 0.7098039, 1, 0, 1,
-0.7619558, -0.1460168, -0.907723, 0.7058824, 1, 0, 1,
-0.7609627, 0.004123874, -1.477035, 0.6980392, 1, 0, 1,
-0.7608179, -2.09253, -3.008004, 0.6901961, 1, 0, 1,
-0.7600961, 0.4874233, 1.014901, 0.6862745, 1, 0, 1,
-0.7592099, 0.3375825, -1.123735, 0.6784314, 1, 0, 1,
-0.7571256, -0.4406091, -0.5761961, 0.6745098, 1, 0, 1,
-0.7552257, -0.6850764, -2.043695, 0.6666667, 1, 0, 1,
-0.7536457, -1.016548, -2.989212, 0.6627451, 1, 0, 1,
-0.7493047, 1.638614, -1.735407, 0.654902, 1, 0, 1,
-0.7473729, -1.105154, -4.023468, 0.6509804, 1, 0, 1,
-0.7424222, -0.4438932, -1.408305, 0.6431373, 1, 0, 1,
-0.7401942, -0.0717936, -0.7986669, 0.6392157, 1, 0, 1,
-0.7399604, 1.442068, 0.5171698, 0.6313726, 1, 0, 1,
-0.7356188, 0.3400027, -0.9131302, 0.627451, 1, 0, 1,
-0.7337674, -1.415176, -0.7761973, 0.6196079, 1, 0, 1,
-0.7316729, 0.1945157, -1.013685, 0.6156863, 1, 0, 1,
-0.7254165, -1.838541, -1.457805, 0.6078432, 1, 0, 1,
-0.7223443, -1.108611, -2.55539, 0.6039216, 1, 0, 1,
-0.7209283, 0.8991432, -1.448745, 0.5960785, 1, 0, 1,
-0.7168945, 1.463775, -2.331781, 0.5882353, 1, 0, 1,
-0.7156473, -1.684261, -3.239807, 0.5843138, 1, 0, 1,
-0.7106962, 0.2902525, 0.2553353, 0.5764706, 1, 0, 1,
-0.7049707, -2.384044, -2.239925, 0.572549, 1, 0, 1,
-0.7032458, 0.443368, -0.8976449, 0.5647059, 1, 0, 1,
-0.6986451, 1.026659, -0.8057856, 0.5607843, 1, 0, 1,
-0.6938834, -1.118911, -2.371391, 0.5529412, 1, 0, 1,
-0.6910971, -0.2038611, -1.165594, 0.5490196, 1, 0, 1,
-0.6902999, -0.7035001, -2.251637, 0.5411765, 1, 0, 1,
-0.6898244, -1.880258, -4.078932, 0.5372549, 1, 0, 1,
-0.6894203, -0.1559141, -3.655891, 0.5294118, 1, 0, 1,
-0.6887187, -1.268767, -3.551181, 0.5254902, 1, 0, 1,
-0.6832199, 0.1096063, -2.005605, 0.5176471, 1, 0, 1,
-0.6783958, 1.52899, -0.9342155, 0.5137255, 1, 0, 1,
-0.677497, 0.4835734, 0.3037835, 0.5058824, 1, 0, 1,
-0.6716031, 0.6677307, -0.900174, 0.5019608, 1, 0, 1,
-0.6610718, -0.09828355, -1.428563, 0.4941176, 1, 0, 1,
-0.6591838, 0.6782274, -2.276894, 0.4862745, 1, 0, 1,
-0.6551822, 0.2624202, -1.600344, 0.4823529, 1, 0, 1,
-0.650097, -1.282193, -1.437485, 0.4745098, 1, 0, 1,
-0.6481854, -0.8696905, -2.167731, 0.4705882, 1, 0, 1,
-0.645725, -0.08829992, -0.6707755, 0.4627451, 1, 0, 1,
-0.6443185, 2.190321, 0.1223331, 0.4588235, 1, 0, 1,
-0.6341138, 0.2932722, -0.7779002, 0.4509804, 1, 0, 1,
-0.6276044, -1.357997, -4.261718, 0.4470588, 1, 0, 1,
-0.6274517, 0.157393, -1.943254, 0.4392157, 1, 0, 1,
-0.612375, 0.7568773, -0.4158115, 0.4352941, 1, 0, 1,
-0.597501, -0.7533947, -3.533804, 0.427451, 1, 0, 1,
-0.5902705, 2.752535, -0.8835889, 0.4235294, 1, 0, 1,
-0.5869992, 1.886266, -0.4015029, 0.4156863, 1, 0, 1,
-0.5848417, 0.3558966, -1.365599, 0.4117647, 1, 0, 1,
-0.583546, 0.716849, 1.136235, 0.4039216, 1, 0, 1,
-0.582341, 0.792365, -0.3700322, 0.3960784, 1, 0, 1,
-0.5777768, 1.222931, 1.874922, 0.3921569, 1, 0, 1,
-0.575566, 0.8738286, -1.785335, 0.3843137, 1, 0, 1,
-0.5654535, 1.052379, -1.1096, 0.3803922, 1, 0, 1,
-0.5652692, 0.4140676, -1.303445, 0.372549, 1, 0, 1,
-0.5629941, -0.1848994, -2.267631, 0.3686275, 1, 0, 1,
-0.5621989, -0.4083814, -3.074849, 0.3607843, 1, 0, 1,
-0.5582544, 0.3499814, -0.4718516, 0.3568628, 1, 0, 1,
-0.5549344, 0.1877799, -2.334342, 0.3490196, 1, 0, 1,
-0.5521349, -0.8951619, -1.553829, 0.345098, 1, 0, 1,
-0.5498444, 0.01186535, -0.1236681, 0.3372549, 1, 0, 1,
-0.5424566, -0.475877, -3.217514, 0.3333333, 1, 0, 1,
-0.5395194, -1.032003, -3.144936, 0.3254902, 1, 0, 1,
-0.5386149, -0.9189966, -0.2290676, 0.3215686, 1, 0, 1,
-0.5384245, 0.8991285, -1.006361, 0.3137255, 1, 0, 1,
-0.5354324, -0.2655976, -1.502622, 0.3098039, 1, 0, 1,
-0.5332865, 0.7274803, 0.08530787, 0.3019608, 1, 0, 1,
-0.5305353, -0.2784564, -0.6938044, 0.2941177, 1, 0, 1,
-0.5289387, 1.638253, -1.101902, 0.2901961, 1, 0, 1,
-0.5252696, -0.1901084, 0.00295727, 0.282353, 1, 0, 1,
-0.5215549, -1.675524, -2.121314, 0.2784314, 1, 0, 1,
-0.5176535, 0.1840667, -0.7912402, 0.2705882, 1, 0, 1,
-0.516558, 0.02675027, 0.4993608, 0.2666667, 1, 0, 1,
-0.5165425, -0.4769503, -1.874156, 0.2588235, 1, 0, 1,
-0.5110478, -0.5071284, -3.38063, 0.254902, 1, 0, 1,
-0.5099207, -0.8542871, -1.91546, 0.2470588, 1, 0, 1,
-0.5066386, 1.010501, -1.341317, 0.2431373, 1, 0, 1,
-0.5045863, -0.1158562, -2.40691, 0.2352941, 1, 0, 1,
-0.5045586, -0.1693902, -1.460152, 0.2313726, 1, 0, 1,
-0.504093, -0.1176069, -3.322811, 0.2235294, 1, 0, 1,
-0.5002044, 1.528475, -0.1489388, 0.2196078, 1, 0, 1,
-0.4985401, -0.4964322, -0.08023595, 0.2117647, 1, 0, 1,
-0.4914764, -0.2060346, -0.6246269, 0.2078431, 1, 0, 1,
-0.4905142, 0.3370041, -0.6838613, 0.2, 1, 0, 1,
-0.4883797, 0.2523303, -2.103462, 0.1921569, 1, 0, 1,
-0.4868316, 0.2138016, -0.08252263, 0.1882353, 1, 0, 1,
-0.4821703, 1.345056, -1.793546, 0.1803922, 1, 0, 1,
-0.4799105, 0.2665597, -1.723229, 0.1764706, 1, 0, 1,
-0.4788668, -0.5086002, -2.483669, 0.1686275, 1, 0, 1,
-0.4783286, -0.2685514, -2.060994, 0.1647059, 1, 0, 1,
-0.4746565, 0.2042683, -0.3795602, 0.1568628, 1, 0, 1,
-0.4718537, 1.209698, 1.972406, 0.1529412, 1, 0, 1,
-0.469769, 0.475156, 0.6800137, 0.145098, 1, 0, 1,
-0.4689959, -0.5032686, -0.4221778, 0.1411765, 1, 0, 1,
-0.4683591, -0.6440664, -0.7163279, 0.1333333, 1, 0, 1,
-0.4671493, -0.2084757, -3.34743, 0.1294118, 1, 0, 1,
-0.4556072, -1.253835, -2.065043, 0.1215686, 1, 0, 1,
-0.452851, -0.1432737, -1.578599, 0.1176471, 1, 0, 1,
-0.449822, -1.53917, -2.982148, 0.1098039, 1, 0, 1,
-0.4477119, 1.015689, -1.642146, 0.1058824, 1, 0, 1,
-0.4438871, -0.767058, -3.52295, 0.09803922, 1, 0, 1,
-0.4407988, -0.7527452, -3.327322, 0.09019608, 1, 0, 1,
-0.4407585, 0.3104442, -1.489219, 0.08627451, 1, 0, 1,
-0.4396518, 0.3142354, -1.701995, 0.07843138, 1, 0, 1,
-0.4389391, 1.277706, -0.356225, 0.07450981, 1, 0, 1,
-0.4357354, 0.5152845, -0.3554448, 0.06666667, 1, 0, 1,
-0.4327824, 0.401426, -1.560112, 0.0627451, 1, 0, 1,
-0.4312502, -1.757489, -2.503791, 0.05490196, 1, 0, 1,
-0.4309252, 1.464177, -0.8385603, 0.05098039, 1, 0, 1,
-0.4298097, -0.2749134, -1.634854, 0.04313726, 1, 0, 1,
-0.4265893, 0.4109919, -1.691802, 0.03921569, 1, 0, 1,
-0.4224698, 1.23217, 0.6606243, 0.03137255, 1, 0, 1,
-0.415974, -1.10638, -4.210979, 0.02745098, 1, 0, 1,
-0.4158704, 0.6410822, -0.1443436, 0.01960784, 1, 0, 1,
-0.4143993, -1.151655, -3.748366, 0.01568628, 1, 0, 1,
-0.4082434, -0.4580935, -2.669213, 0.007843138, 1, 0, 1,
-0.4034217, -0.396131, -1.451618, 0.003921569, 1, 0, 1,
-0.402449, -0.7241186, -2.100997, 0, 1, 0.003921569, 1,
-0.397067, 0.4194794, -0.7717302, 0, 1, 0.01176471, 1,
-0.3968273, 0.8441777, -0.4829307, 0, 1, 0.01568628, 1,
-0.3955033, -1.31883, -3.36778, 0, 1, 0.02352941, 1,
-0.3953464, 1.767758, -1.167512, 0, 1, 0.02745098, 1,
-0.3908457, -0.02422895, -2.766975, 0, 1, 0.03529412, 1,
-0.3859785, -0.9726386, -4.037348, 0, 1, 0.03921569, 1,
-0.3803111, 0.6962524, -2.187492, 0, 1, 0.04705882, 1,
-0.379591, -1.967267, -2.208424, 0, 1, 0.05098039, 1,
-0.3736914, -1.94752, -3.988597, 0, 1, 0.05882353, 1,
-0.3705484, -0.9142816, -3.066798, 0, 1, 0.0627451, 1,
-0.3687768, 1.15333, -0.1904837, 0, 1, 0.07058824, 1,
-0.3628893, -0.5373933, -3.722029, 0, 1, 0.07450981, 1,
-0.3532655, -0.8209322, -2.711497, 0, 1, 0.08235294, 1,
-0.3526084, 0.8907716, 0.5002371, 0, 1, 0.08627451, 1,
-0.3490794, 0.2945626, 0.07319648, 0, 1, 0.09411765, 1,
-0.3489155, 1.788741, -0.7649747, 0, 1, 0.1019608, 1,
-0.348726, -1.069499, -3.87908, 0, 1, 0.1058824, 1,
-0.3478894, 0.6754479, 0.4240104, 0, 1, 0.1137255, 1,
-0.3426334, 2.165572, 2.21909, 0, 1, 0.1176471, 1,
-0.3415703, 2.024027, 0.5770823, 0, 1, 0.1254902, 1,
-0.3397865, -0.968608, -2.211131, 0, 1, 0.1294118, 1,
-0.3329101, 0.4411612, -1.034622, 0, 1, 0.1372549, 1,
-0.329529, 0.2896386, -0.3600055, 0, 1, 0.1411765, 1,
-0.3257374, 0.4430051, -0.7434659, 0, 1, 0.1490196, 1,
-0.3242207, -0.2921977, -1.825365, 0, 1, 0.1529412, 1,
-0.3213246, -0.7896083, -3.172913, 0, 1, 0.1607843, 1,
-0.3207931, 0.2104064, -1.298173, 0, 1, 0.1647059, 1,
-0.3170329, 1.474316, -0.8800287, 0, 1, 0.172549, 1,
-0.3160141, -1.190503, -1.230378, 0, 1, 0.1764706, 1,
-0.3157989, -0.1273707, -1.803442, 0, 1, 0.1843137, 1,
-0.3137781, 0.413379, 1.115091, 0, 1, 0.1882353, 1,
-0.3137727, -0.1881718, -2.791314, 0, 1, 0.1960784, 1,
-0.3095587, 1.34236, -1.722851, 0, 1, 0.2039216, 1,
-0.3089447, -0.6196765, -1.838361, 0, 1, 0.2078431, 1,
-0.3054124, -0.240171, -2.558234, 0, 1, 0.2156863, 1,
-0.3038406, -0.0868568, -0.2216416, 0, 1, 0.2196078, 1,
-0.2989808, 0.1803841, -0.3063435, 0, 1, 0.227451, 1,
-0.2903332, -1.401292, -3.47993, 0, 1, 0.2313726, 1,
-0.2901371, -0.9139959, -3.15398, 0, 1, 0.2392157, 1,
-0.2873142, -0.232974, -2.376427, 0, 1, 0.2431373, 1,
-0.2871066, -1.588003, -2.780706, 0, 1, 0.2509804, 1,
-0.287056, 0.6271587, 0.3696215, 0, 1, 0.254902, 1,
-0.2857016, 0.8794775, -0.8488063, 0, 1, 0.2627451, 1,
-0.2856256, 0.3145323, 1.253546, 0, 1, 0.2666667, 1,
-0.2736184, -0.6336385, -4.740558, 0, 1, 0.2745098, 1,
-0.2732311, -1.514568, -3.632663, 0, 1, 0.2784314, 1,
-0.2730329, -0.1926344, -0.1367573, 0, 1, 0.2862745, 1,
-0.2645229, -0.841239, -2.492228, 0, 1, 0.2901961, 1,
-0.2629364, -0.2020629, -1.279998, 0, 1, 0.2980392, 1,
-0.2620203, 0.8376602, -0.69922, 0, 1, 0.3058824, 1,
-0.2611706, -0.9595301, -3.761215, 0, 1, 0.3098039, 1,
-0.2596559, -1.871224, -2.359097, 0, 1, 0.3176471, 1,
-0.2576734, -0.8229623, -4.215703, 0, 1, 0.3215686, 1,
-0.2573846, -1.07846, -3.121671, 0, 1, 0.3294118, 1,
-0.2564994, -1.622722, -2.618999, 0, 1, 0.3333333, 1,
-0.2553765, 0.1867007, 0.1085993, 0, 1, 0.3411765, 1,
-0.2502295, 0.9995109, 0.245763, 0, 1, 0.345098, 1,
-0.2319079, -0.8544685, -4.528581, 0, 1, 0.3529412, 1,
-0.2308324, -1.615471, -5.710852, 0, 1, 0.3568628, 1,
-0.228381, -0.4480729, -3.133995, 0, 1, 0.3647059, 1,
-0.2274129, 0.002550498, -0.9297194, 0, 1, 0.3686275, 1,
-0.226673, -0.2990879, -1.860214, 0, 1, 0.3764706, 1,
-0.2261111, 1.037087, 0.2667664, 0, 1, 0.3803922, 1,
-0.220194, -1.202739, -3.733033, 0, 1, 0.3882353, 1,
-0.2155055, 1.013339, -0.2381017, 0, 1, 0.3921569, 1,
-0.2129783, -0.03805026, -3.210165, 0, 1, 0.4, 1,
-0.2090038, -2.285879, -3.335644, 0, 1, 0.4078431, 1,
-0.2078326, 0.8974813, -0.6280856, 0, 1, 0.4117647, 1,
-0.2013305, -0.1965502, -2.189069, 0, 1, 0.4196078, 1,
-0.1989479, -1.546128, -4.33849, 0, 1, 0.4235294, 1,
-0.1978494, -0.9113156, -2.836234, 0, 1, 0.4313726, 1,
-0.197403, -0.1430201, -2.288566, 0, 1, 0.4352941, 1,
-0.195683, -1.205314, -3.645767, 0, 1, 0.4431373, 1,
-0.1948197, 0.3834243, 1.020037, 0, 1, 0.4470588, 1,
-0.1935986, 0.4425667, -0.7677806, 0, 1, 0.454902, 1,
-0.1923845, 0.1024324, -1.874723, 0, 1, 0.4588235, 1,
-0.1908802, 0.2650014, 0.5482859, 0, 1, 0.4666667, 1,
-0.1885287, -1.309631, -2.363234, 0, 1, 0.4705882, 1,
-0.1878061, 0.3744362, 0.06963928, 0, 1, 0.4784314, 1,
-0.1863057, -0.5396848, -2.044955, 0, 1, 0.4823529, 1,
-0.182926, -0.1061909, -1.714211, 0, 1, 0.4901961, 1,
-0.1821445, -0.0741823, -3.521609, 0, 1, 0.4941176, 1,
-0.176752, 0.9970387, -0.2011284, 0, 1, 0.5019608, 1,
-0.1734679, 0.9662163, -1.203214, 0, 1, 0.509804, 1,
-0.1697633, -0.5535697, -3.716845, 0, 1, 0.5137255, 1,
-0.1634831, -0.9210731, -3.819485, 0, 1, 0.5215687, 1,
-0.1621982, -0.9080012, -3.209794, 0, 1, 0.5254902, 1,
-0.1618977, 0.4763072, -0.2046584, 0, 1, 0.5333334, 1,
-0.1595697, -0.5530627, -3.738067, 0, 1, 0.5372549, 1,
-0.1592463, -0.5019346, -1.350266, 0, 1, 0.5450981, 1,
-0.1588538, -0.8664514, -1.76951, 0, 1, 0.5490196, 1,
-0.1569317, 0.887109, 0.2268071, 0, 1, 0.5568628, 1,
-0.1539716, 0.2062467, 0.9886596, 0, 1, 0.5607843, 1,
-0.1504621, -0.3405239, -2.775978, 0, 1, 0.5686275, 1,
-0.1485129, 1.385622, 0.4659655, 0, 1, 0.572549, 1,
-0.1451858, -0.1386743, -2.749524, 0, 1, 0.5803922, 1,
-0.1420637, -0.1346407, -3.688763, 0, 1, 0.5843138, 1,
-0.1402243, -1.612374, -0.9535552, 0, 1, 0.5921569, 1,
-0.1392548, 1.966376, 0.2296312, 0, 1, 0.5960785, 1,
-0.1382898, 0.02573028, 0.7780042, 0, 1, 0.6039216, 1,
-0.1343218, -0.1065874, -1.166858, 0, 1, 0.6117647, 1,
-0.1316628, 0.1598798, 0.7517051, 0, 1, 0.6156863, 1,
-0.1309801, 1.744426, 1.665896, 0, 1, 0.6235294, 1,
-0.1295208, 0.4639212, -0.7757736, 0, 1, 0.627451, 1,
-0.1276658, 0.02003264, -1.634554, 0, 1, 0.6352941, 1,
-0.1254714, 0.009120366, -1.15668, 0, 1, 0.6392157, 1,
-0.1233081, 0.5260518, 0.2153019, 0, 1, 0.6470588, 1,
-0.1175062, -0.4746229, -3.393347, 0, 1, 0.6509804, 1,
-0.1124242, 0.962607, -0.9805427, 0, 1, 0.6588235, 1,
-0.1108589, 0.01597708, -1.527127, 0, 1, 0.6627451, 1,
-0.1076599, 2.242309, 1.003252, 0, 1, 0.6705883, 1,
-0.1053421, 0.6300164, 0.7525767, 0, 1, 0.6745098, 1,
-0.105064, -0.1351175, -1.30501, 0, 1, 0.682353, 1,
-0.1041678, -0.9001231, -3.761049, 0, 1, 0.6862745, 1,
-0.09924756, -0.8337352, -2.695076, 0, 1, 0.6941177, 1,
-0.0992148, -1.299846, -2.539935, 0, 1, 0.7019608, 1,
-0.0977966, 0.5755765, 1.124377, 0, 1, 0.7058824, 1,
-0.09646642, 0.3000402, -0.4736886, 0, 1, 0.7137255, 1,
-0.09152668, -0.5451682, -3.742583, 0, 1, 0.7176471, 1,
-0.08745092, -1.8606, -3.887775, 0, 1, 0.7254902, 1,
-0.08727896, 1.124534, -0.8308897, 0, 1, 0.7294118, 1,
-0.08233327, 0.06149626, -1.53946, 0, 1, 0.7372549, 1,
-0.08147839, 0.3507572, -1.756148, 0, 1, 0.7411765, 1,
-0.08114488, -0.3485403, -2.15882, 0, 1, 0.7490196, 1,
-0.07742558, -1.046964, -2.831113, 0, 1, 0.7529412, 1,
-0.07655279, 1.316692, 0.04132425, 0, 1, 0.7607843, 1,
-0.05959838, 0.2149546, -0.401466, 0, 1, 0.7647059, 1,
-0.05666893, 1.244248, 0.07631119, 0, 1, 0.772549, 1,
-0.05606087, -1.973829, -4.216215, 0, 1, 0.7764706, 1,
-0.05511003, -0.1025242, -3.817213, 0, 1, 0.7843137, 1,
-0.05352888, 1.204703, 1.421691, 0, 1, 0.7882353, 1,
-0.05197452, 0.5721845, 0.04369863, 0, 1, 0.7960784, 1,
-0.05182732, 0.762419, -0.8022357, 0, 1, 0.8039216, 1,
-0.04542537, 0.6115968, 0.5711669, 0, 1, 0.8078431, 1,
-0.04049012, 0.1614776, 2.069047, 0, 1, 0.8156863, 1,
-0.03716952, 0.05657757, -2.116952, 0, 1, 0.8196079, 1,
-0.03603422, -0.9145598, -3.912902, 0, 1, 0.827451, 1,
-0.0351899, -1.639927, -3.62112, 0, 1, 0.8313726, 1,
-0.03489473, 0.8952777, 0.3570133, 0, 1, 0.8392157, 1,
-0.03443391, 0.01814788, -2.002635, 0, 1, 0.8431373, 1,
-0.03435253, 0.4191035, 0.7412981, 0, 1, 0.8509804, 1,
-0.02623269, -0.7590548, -2.699691, 0, 1, 0.854902, 1,
-0.02443117, 2.22886, -0.91475, 0, 1, 0.8627451, 1,
-0.02327606, -0.492205, -2.500038, 0, 1, 0.8666667, 1,
-0.02216805, -1.859975, -2.796553, 0, 1, 0.8745098, 1,
-0.01979245, 0.6560769, 0.2239372, 0, 1, 0.8784314, 1,
-0.01909881, 0.09852254, -0.03988268, 0, 1, 0.8862745, 1,
-0.01840665, -0.2157765, -2.955494, 0, 1, 0.8901961, 1,
-0.01685937, 0.3653754, -1.236767, 0, 1, 0.8980392, 1,
-0.01298809, -1.061213, -3.36622, 0, 1, 0.9058824, 1,
-0.009533716, -0.2336645, -2.276592, 0, 1, 0.9098039, 1,
-0.008920825, 0.1046881, -0.2493756, 0, 1, 0.9176471, 1,
-0.004087166, 0.2194635, -1.157356, 0, 1, 0.9215686, 1,
-0.0005765517, -0.7086606, -3.815513, 0, 1, 0.9294118, 1,
-0.0005402794, -0.1816367, -3.876519, 0, 1, 0.9333333, 1,
0.008874997, -1.07225, 3.276152, 0, 1, 0.9411765, 1,
0.009537025, -0.9801178, 4.142897, 0, 1, 0.945098, 1,
0.01383432, -1.188591, 4.043274, 0, 1, 0.9529412, 1,
0.01391521, 1.064421, 0.7301207, 0, 1, 0.9568627, 1,
0.01700751, 0.08704, -1.114246, 0, 1, 0.9647059, 1,
0.02095885, -0.8309298, 3.88796, 0, 1, 0.9686275, 1,
0.02373811, 0.07983105, 1.275042, 0, 1, 0.9764706, 1,
0.04029055, 1.065656, 0.53084, 0, 1, 0.9803922, 1,
0.04069383, -0.09104978, 2.366688, 0, 1, 0.9882353, 1,
0.04104056, 0.09256465, 0.6514444, 0, 1, 0.9921569, 1,
0.04387347, -1.062681, 3.279891, 0, 1, 1, 1,
0.04853308, 0.06252811, 0.2658588, 0, 0.9921569, 1, 1,
0.04942488, 0.3795848, 1.43186, 0, 0.9882353, 1, 1,
0.05003037, 1.162771, 0.7552176, 0, 0.9803922, 1, 1,
0.05441696, -0.6577871, 3.528317, 0, 0.9764706, 1, 1,
0.05470576, 1.475881, 0.7909983, 0, 0.9686275, 1, 1,
0.05521305, 0.9390451, 0.2408851, 0, 0.9647059, 1, 1,
0.05532759, -0.6345643, 3.149745, 0, 0.9568627, 1, 1,
0.05674964, 0.3833969, 0.7608028, 0, 0.9529412, 1, 1,
0.06139269, 0.1262143, 2.159754, 0, 0.945098, 1, 1,
0.06152623, 0.3527442, 1.377571, 0, 0.9411765, 1, 1,
0.06507037, -0.8498527, 2.885333, 0, 0.9333333, 1, 1,
0.06682216, 0.2459183, 0.4044393, 0, 0.9294118, 1, 1,
0.07250031, -0.725975, 3.474079, 0, 0.9215686, 1, 1,
0.0727263, 0.04814328, 0.9921685, 0, 0.9176471, 1, 1,
0.07679593, -0.6070679, 2.99808, 0, 0.9098039, 1, 1,
0.08021716, 1.035168, 1.335577, 0, 0.9058824, 1, 1,
0.08157905, -2.188775, 3.689386, 0, 0.8980392, 1, 1,
0.08878367, 0.3745312, -1.409911, 0, 0.8901961, 1, 1,
0.09348985, 1.297723, 0.3696225, 0, 0.8862745, 1, 1,
0.09432447, 0.1396373, 0.8935365, 0, 0.8784314, 1, 1,
0.1018242, -0.2755895, 3.877161, 0, 0.8745098, 1, 1,
0.1022542, 2.167584, -0.1307923, 0, 0.8666667, 1, 1,
0.1089977, 0.1242072, 0.4109476, 0, 0.8627451, 1, 1,
0.1148044, 1.231849, 1.200506, 0, 0.854902, 1, 1,
0.1164603, -1.043394, 1.792625, 0, 0.8509804, 1, 1,
0.116631, -0.1446261, 3.783516, 0, 0.8431373, 1, 1,
0.1167685, 1.228109, -0.5596199, 0, 0.8392157, 1, 1,
0.1173359, 0.4282813, 0.8540139, 0, 0.8313726, 1, 1,
0.117451, 0.364189, 1.206129, 0, 0.827451, 1, 1,
0.1185733, 0.1149719, 0.8958239, 0, 0.8196079, 1, 1,
0.1196148, -0.3381548, 3.285052, 0, 0.8156863, 1, 1,
0.1235184, -1.315572, 5.794312, 0, 0.8078431, 1, 1,
0.1281045, -0.05838718, 1.880022, 0, 0.8039216, 1, 1,
0.1317995, -0.1651877, 1.592762, 0, 0.7960784, 1, 1,
0.1331553, 1.059263, -0.7941006, 0, 0.7882353, 1, 1,
0.1334492, 1.230518, -0.4355369, 0, 0.7843137, 1, 1,
0.133845, 0.1368892, 1.612399, 0, 0.7764706, 1, 1,
0.134384, -0.5793017, 3.444067, 0, 0.772549, 1, 1,
0.1360201, -0.5328935, 3.412668, 0, 0.7647059, 1, 1,
0.1360691, -0.4837818, 3.312717, 0, 0.7607843, 1, 1,
0.1365137, -0.1139124, 3.170529, 0, 0.7529412, 1, 1,
0.1409322, 1.54873, 0.4602258, 0, 0.7490196, 1, 1,
0.1411748, 1.400422, 0.06822454, 0, 0.7411765, 1, 1,
0.1417246, -1.246212, 2.353112, 0, 0.7372549, 1, 1,
0.1482205, -0.5273057, 2.003518, 0, 0.7294118, 1, 1,
0.1497103, 0.6225114, 3.0834, 0, 0.7254902, 1, 1,
0.1510607, -0.1370898, 1.598742, 0, 0.7176471, 1, 1,
0.1520327, 1.53946, -0.1481421, 0, 0.7137255, 1, 1,
0.1551765, -0.4859463, 3.894202, 0, 0.7058824, 1, 1,
0.1566817, -0.3296607, 2.276178, 0, 0.6980392, 1, 1,
0.1596928, -0.5188323, 2.025265, 0, 0.6941177, 1, 1,
0.1602576, -0.6244679, 3.518765, 0, 0.6862745, 1, 1,
0.1702177, -0.7871879, 1.982162, 0, 0.682353, 1, 1,
0.1717581, -0.05615117, 2.657088, 0, 0.6745098, 1, 1,
0.1719662, 3.136075, -0.5296736, 0, 0.6705883, 1, 1,
0.1737408, -0.1476163, 2.970817, 0, 0.6627451, 1, 1,
0.1749939, -0.112839, 1.734259, 0, 0.6588235, 1, 1,
0.176825, 0.7918811, 1.157636, 0, 0.6509804, 1, 1,
0.1773757, -1.210529, 3.529016, 0, 0.6470588, 1, 1,
0.1896986, 0.3518719, 1.757081, 0, 0.6392157, 1, 1,
0.1918117, 0.8577856, -1.165861, 0, 0.6352941, 1, 1,
0.1946448, 1.310023, 0.9108731, 0, 0.627451, 1, 1,
0.1995915, 1.501868, 0.3190381, 0, 0.6235294, 1, 1,
0.2009707, 0.1720641, 0.4823259, 0, 0.6156863, 1, 1,
0.2042397, 0.7534073, 1.049224, 0, 0.6117647, 1, 1,
0.2070443, -0.974721, 2.737855, 0, 0.6039216, 1, 1,
0.2088928, -0.3559225, 2.910352, 0, 0.5960785, 1, 1,
0.2090317, -0.4738152, 2.189017, 0, 0.5921569, 1, 1,
0.2131396, 0.6589938, 1.131492, 0, 0.5843138, 1, 1,
0.2141275, 1.13099, -0.4459549, 0, 0.5803922, 1, 1,
0.2155214, -0.5210955, 2.229075, 0, 0.572549, 1, 1,
0.21839, 0.5540418, 0.8407283, 0, 0.5686275, 1, 1,
0.2218682, -1.007847, 1.069556, 0, 0.5607843, 1, 1,
0.2234102, 1.011461, -1.048574, 0, 0.5568628, 1, 1,
0.2247844, 0.9434891, -0.7575234, 0, 0.5490196, 1, 1,
0.2252623, 1.04992, 1.288987, 0, 0.5450981, 1, 1,
0.2257504, -0.3598677, 0.8721047, 0, 0.5372549, 1, 1,
0.2274068, 1.424382, 1.487821, 0, 0.5333334, 1, 1,
0.233237, -0.1321879, 3.080508, 0, 0.5254902, 1, 1,
0.2336345, -1.359297, 1.476447, 0, 0.5215687, 1, 1,
0.2422913, 0.07121705, 1.712847, 0, 0.5137255, 1, 1,
0.244129, 0.8508274, 0.6916667, 0, 0.509804, 1, 1,
0.2445943, 0.03826921, 1.553046, 0, 0.5019608, 1, 1,
0.247572, -0.1274222, 1.892534, 0, 0.4941176, 1, 1,
0.2492626, 0.580043, -0.4000543, 0, 0.4901961, 1, 1,
0.2529035, -0.2172533, 0.3203738, 0, 0.4823529, 1, 1,
0.2530439, 1.689696, -1.20199, 0, 0.4784314, 1, 1,
0.253088, -3.03728, 4.087725, 0, 0.4705882, 1, 1,
0.2540147, -0.5617358, 3.507348, 0, 0.4666667, 1, 1,
0.2598044, -1.134193, 2.924499, 0, 0.4588235, 1, 1,
0.2637034, 2.264662, 0.4534653, 0, 0.454902, 1, 1,
0.2672435, 0.2883559, 1.038708, 0, 0.4470588, 1, 1,
0.2721311, -0.5755988, 1.856382, 0, 0.4431373, 1, 1,
0.2764553, 1.333956, -0.1610809, 0, 0.4352941, 1, 1,
0.276802, 2.306223, 0.2867781, 0, 0.4313726, 1, 1,
0.2806781, -1.32292, 2.816875, 0, 0.4235294, 1, 1,
0.2818438, -0.7137988, 2.360387, 0, 0.4196078, 1, 1,
0.2863858, 1.330279, -1.387326, 0, 0.4117647, 1, 1,
0.2928731, 1.808869, 0.2364604, 0, 0.4078431, 1, 1,
0.2933447, -1.032745, 2.436335, 0, 0.4, 1, 1,
0.2975112, -1.269893, 2.1525, 0, 0.3921569, 1, 1,
0.2982222, 2.329831, 0.7245981, 0, 0.3882353, 1, 1,
0.3055929, -0.7461771, 2.231461, 0, 0.3803922, 1, 1,
0.3091949, -2.579085, 3.197943, 0, 0.3764706, 1, 1,
0.3107893, -0.9636714, 3.638457, 0, 0.3686275, 1, 1,
0.312792, -1.020692, 2.068456, 0, 0.3647059, 1, 1,
0.3151183, -0.8624857, 1.552878, 0, 0.3568628, 1, 1,
0.3178151, 0.3445356, 1.550397, 0, 0.3529412, 1, 1,
0.3198071, 0.5376462, -0.1114422, 0, 0.345098, 1, 1,
0.3263339, -0.7439231, 2.971004, 0, 0.3411765, 1, 1,
0.3273416, 0.589725, 1.364218, 0, 0.3333333, 1, 1,
0.3288033, 1.210219, 0.451914, 0, 0.3294118, 1, 1,
0.3317862, 1.07018, 2.258893, 0, 0.3215686, 1, 1,
0.3321144, -1.112958, 4.819371, 0, 0.3176471, 1, 1,
0.3369429, 1.022832, -0.2513156, 0, 0.3098039, 1, 1,
0.3456437, -1.781501, 3.387879, 0, 0.3058824, 1, 1,
0.3459146, 0.6809717, 1.995672, 0, 0.2980392, 1, 1,
0.3518007, -1.756817, 3.329705, 0, 0.2901961, 1, 1,
0.3523598, 1.481666, -0.1217481, 0, 0.2862745, 1, 1,
0.353402, -1.653129, 4.598961, 0, 0.2784314, 1, 1,
0.3626663, -3.181831, 2.217193, 0, 0.2745098, 1, 1,
0.3626818, 1.566715, -0.8195426, 0, 0.2666667, 1, 1,
0.3664267, 0.6675131, -0.02573003, 0, 0.2627451, 1, 1,
0.367325, -0.9723459, 3.474017, 0, 0.254902, 1, 1,
0.3745875, -0.3606129, 3.476161, 0, 0.2509804, 1, 1,
0.3753486, 0.5797614, 1.018809, 0, 0.2431373, 1, 1,
0.3755237, 2.805774, 0.07126048, 0, 0.2392157, 1, 1,
0.3767588, 1.136777, 0.4942277, 0, 0.2313726, 1, 1,
0.3861344, 0.2927787, 1.200716, 0, 0.227451, 1, 1,
0.3915422, -0.1844018, 1.797108, 0, 0.2196078, 1, 1,
0.393084, -1.349765, 1.864385, 0, 0.2156863, 1, 1,
0.3974682, 1.793132, 0.2186189, 0, 0.2078431, 1, 1,
0.4013534, 0.626936, -0.2800776, 0, 0.2039216, 1, 1,
0.4013667, 2.106323, -0.06360769, 0, 0.1960784, 1, 1,
0.4033253, -0.7701119, 4.099687, 0, 0.1882353, 1, 1,
0.4034614, -0.6715179, 2.602779, 0, 0.1843137, 1, 1,
0.4074889, 0.9447398, 1.39329, 0, 0.1764706, 1, 1,
0.4097358, 0.3989049, 0.7921398, 0, 0.172549, 1, 1,
0.4102709, 1.615257, -2.073941, 0, 0.1647059, 1, 1,
0.4205996, -1.711153, 4.210384, 0, 0.1607843, 1, 1,
0.4211565, -1.657665, 2.604472, 0, 0.1529412, 1, 1,
0.423407, 1.415353, 0.01970326, 0, 0.1490196, 1, 1,
0.4238637, -0.4825394, 1.369275, 0, 0.1411765, 1, 1,
0.4242004, 1.538682, 0.4035031, 0, 0.1372549, 1, 1,
0.4260992, 0.8738226, 1.079769, 0, 0.1294118, 1, 1,
0.426291, -0.01855521, 1.427054, 0, 0.1254902, 1, 1,
0.4309611, 1.168801, -0.8940921, 0, 0.1176471, 1, 1,
0.4317655, 0.3318098, 3.146606, 0, 0.1137255, 1, 1,
0.4319816, 1.297853, -0.7696653, 0, 0.1058824, 1, 1,
0.4378518, 0.4617448, -0.6415522, 0, 0.09803922, 1, 1,
0.4413998, 1.529989, -0.4928345, 0, 0.09411765, 1, 1,
0.4449193, 1.098874, 1.667733, 0, 0.08627451, 1, 1,
0.4522549, -1.106907, 2.699747, 0, 0.08235294, 1, 1,
0.4536791, -1.27169, 1.791691, 0, 0.07450981, 1, 1,
0.4555179, 1.964373, 0.4937451, 0, 0.07058824, 1, 1,
0.457639, 1.336214, -1.216458, 0, 0.0627451, 1, 1,
0.4601126, -0.4966357, 3.047217, 0, 0.05882353, 1, 1,
0.4606276, 1.255935, -0.9431559, 0, 0.05098039, 1, 1,
0.4678482, 1.307676, 1.910748, 0, 0.04705882, 1, 1,
0.4694436, -0.9041312, 4.049241, 0, 0.03921569, 1, 1,
0.4731129, 1.475267, 1.994322, 0, 0.03529412, 1, 1,
0.4761898, -1.913685, 3.093588, 0, 0.02745098, 1, 1,
0.4765321, -0.5920679, 3.873689, 0, 0.02352941, 1, 1,
0.4769406, -0.8808869, 2.521024, 0, 0.01568628, 1, 1,
0.483426, -0.2037524, 0.9674473, 0, 0.01176471, 1, 1,
0.4889675, 0.3191664, 0.6693646, 0, 0.003921569, 1, 1,
0.4913654, -0.7911569, 4.277258, 0.003921569, 0, 1, 1,
0.4940695, -0.6328641, 3.238827, 0.007843138, 0, 1, 1,
0.4955585, -1.255375, 2.991777, 0.01568628, 0, 1, 1,
0.4964756, -1.531174, 1.964199, 0.01960784, 0, 1, 1,
0.4965962, -0.8007087, 2.495776, 0.02745098, 0, 1, 1,
0.496767, -0.6331113, 3.126133, 0.03137255, 0, 1, 1,
0.5003657, 0.2441267, 1.86165, 0.03921569, 0, 1, 1,
0.5081034, 0.8349226, -0.5605976, 0.04313726, 0, 1, 1,
0.5089436, -0.3946238, 3.22735, 0.05098039, 0, 1, 1,
0.5145721, 0.3913261, 2.4696, 0.05490196, 0, 1, 1,
0.5160144, -1.258479, 0.06741224, 0.0627451, 0, 1, 1,
0.5175945, 0.53677, 0.05841282, 0.06666667, 0, 1, 1,
0.5193799, -0.9258724, 2.782159, 0.07450981, 0, 1, 1,
0.520346, -0.9582357, 2.828126, 0.07843138, 0, 1, 1,
0.5212016, 0.4948539, -0.6612294, 0.08627451, 0, 1, 1,
0.5259142, 0.9659967, 0.6544852, 0.09019608, 0, 1, 1,
0.5265041, -0.883374, 2.268179, 0.09803922, 0, 1, 1,
0.5281366, -0.9057092, 2.638285, 0.1058824, 0, 1, 1,
0.5281476, -0.7454059, 2.583818, 0.1098039, 0, 1, 1,
0.5339171, 1.443301, 1.071498, 0.1176471, 0, 1, 1,
0.5380283, 0.7213902, 0.3362162, 0.1215686, 0, 1, 1,
0.5413454, 0.8342728, -2.584414, 0.1294118, 0, 1, 1,
0.5469017, -0.6550418, 3.374706, 0.1333333, 0, 1, 1,
0.5502142, 1.117235, -1.499915, 0.1411765, 0, 1, 1,
0.5508564, -0.5436753, 3.021636, 0.145098, 0, 1, 1,
0.5525561, 0.5221854, 0.9690977, 0.1529412, 0, 1, 1,
0.5544136, 0.6724682, 1.062271, 0.1568628, 0, 1, 1,
0.5554141, -0.07204846, 2.661341, 0.1647059, 0, 1, 1,
0.5756899, 0.3341889, 2.39404, 0.1686275, 0, 1, 1,
0.5775257, 0.5236062, 1.153014, 0.1764706, 0, 1, 1,
0.5792422, -1.231036, 1.723824, 0.1803922, 0, 1, 1,
0.5807813, -0.2859181, 1.811757, 0.1882353, 0, 1, 1,
0.5811974, 0.7069961, -0.3714672, 0.1921569, 0, 1, 1,
0.5850335, -1.223755, 3.7617, 0.2, 0, 1, 1,
0.58648, 0.3613442, 1.61411, 0.2078431, 0, 1, 1,
0.5908055, -0.6334857, 1.723038, 0.2117647, 0, 1, 1,
0.5932091, 0.5836793, 0.7869996, 0.2196078, 0, 1, 1,
0.5978101, 0.2332686, 2.489622, 0.2235294, 0, 1, 1,
0.5982413, 1.806832, -0.5972106, 0.2313726, 0, 1, 1,
0.5983152, -0.1272147, 1.991271, 0.2352941, 0, 1, 1,
0.5988714, 0.831551, 0.5111984, 0.2431373, 0, 1, 1,
0.5992368, -0.5356653, 1.57329, 0.2470588, 0, 1, 1,
0.6064728, 0.06129083, 1.632213, 0.254902, 0, 1, 1,
0.6068977, -0.2439927, 1.092461, 0.2588235, 0, 1, 1,
0.6082214, -2.85381, 1.437836, 0.2666667, 0, 1, 1,
0.6117542, -2.416285, 3.889168, 0.2705882, 0, 1, 1,
0.6130894, -0.529716, 3.297974, 0.2784314, 0, 1, 1,
0.6138473, -0.422832, 1.956176, 0.282353, 0, 1, 1,
0.6139784, 0.09127654, 2.828983, 0.2901961, 0, 1, 1,
0.6143926, 0.2496507, 2.852551, 0.2941177, 0, 1, 1,
0.6147113, -0.3887692, 0.7695995, 0.3019608, 0, 1, 1,
0.6158465, 0.03975979, 2.240858, 0.3098039, 0, 1, 1,
0.6207686, -1.612136, 2.960564, 0.3137255, 0, 1, 1,
0.6222344, 0.491944, 0.5822793, 0.3215686, 0, 1, 1,
0.6225684, 0.3193685, 0.8064771, 0.3254902, 0, 1, 1,
0.6263297, 0.9508118, 1.692452, 0.3333333, 0, 1, 1,
0.6272836, 0.4205435, 1.413912, 0.3372549, 0, 1, 1,
0.6282126, 0.2812998, 0.01535615, 0.345098, 0, 1, 1,
0.6366069, -0.1720894, 2.270045, 0.3490196, 0, 1, 1,
0.6368322, 1.70006, -1.839644, 0.3568628, 0, 1, 1,
0.6374249, 1.017892, 0.9873144, 0.3607843, 0, 1, 1,
0.6376003, -0.1341629, -0.511258, 0.3686275, 0, 1, 1,
0.6389886, -1.206241, 2.479889, 0.372549, 0, 1, 1,
0.6428584, 0.5437163, -0.06116877, 0.3803922, 0, 1, 1,
0.6461843, -0.9711296, 3.318441, 0.3843137, 0, 1, 1,
0.6508656, -0.04677827, 0.7692037, 0.3921569, 0, 1, 1,
0.6529335, -0.8082387, 3.576874, 0.3960784, 0, 1, 1,
0.6576611, -0.7004214, 1.402499, 0.4039216, 0, 1, 1,
0.6635476, -0.1614657, 1.710941, 0.4117647, 0, 1, 1,
0.6643752, -0.8817847, 1.978791, 0.4156863, 0, 1, 1,
0.6692013, 0.04487455, 2.233189, 0.4235294, 0, 1, 1,
0.6703122, 0.4389115, 1.298531, 0.427451, 0, 1, 1,
0.6720521, 1.908672, -0.1563467, 0.4352941, 0, 1, 1,
0.6741208, 0.3387174, -0.02339525, 0.4392157, 0, 1, 1,
0.6762503, -0.6564252, 0.9742208, 0.4470588, 0, 1, 1,
0.6806667, 0.7176201, 0.4106983, 0.4509804, 0, 1, 1,
0.6917947, 1.239497, -0.4111596, 0.4588235, 0, 1, 1,
0.6936467, -1.154158, 2.083169, 0.4627451, 0, 1, 1,
0.6965735, 0.4000846, 2.275832, 0.4705882, 0, 1, 1,
0.6994585, 0.1507811, 2.16664, 0.4745098, 0, 1, 1,
0.7073197, -1.635907, 3.707806, 0.4823529, 0, 1, 1,
0.708893, -1.339691, 1.34508, 0.4862745, 0, 1, 1,
0.7158144, 0.5694249, 0.8055422, 0.4941176, 0, 1, 1,
0.7158753, 0.1844929, 0.2899853, 0.5019608, 0, 1, 1,
0.716319, -1.110315, 3.090807, 0.5058824, 0, 1, 1,
0.7164329, -0.6961635, 0.4381261, 0.5137255, 0, 1, 1,
0.7164783, 0.6062225, 0.6337191, 0.5176471, 0, 1, 1,
0.720785, -0.8527266, 0.5899518, 0.5254902, 0, 1, 1,
0.7234619, 0.6803232, 0.2142899, 0.5294118, 0, 1, 1,
0.7241974, -0.1575109, 1.508243, 0.5372549, 0, 1, 1,
0.7281486, 0.07683174, 1.655876, 0.5411765, 0, 1, 1,
0.7285556, -1.122727, 3.213496, 0.5490196, 0, 1, 1,
0.7314943, -0.1452778, 1.101088, 0.5529412, 0, 1, 1,
0.7316696, -0.8674982, 2.774993, 0.5607843, 0, 1, 1,
0.7333241, 0.7458584, 1.78276, 0.5647059, 0, 1, 1,
0.7346039, 0.6115537, 0.4499987, 0.572549, 0, 1, 1,
0.7351116, 0.9124359, 1.131446, 0.5764706, 0, 1, 1,
0.7368734, 1.035725, 0.7966827, 0.5843138, 0, 1, 1,
0.7413142, -0.8213783, 2.627816, 0.5882353, 0, 1, 1,
0.7449144, 0.7061079, -1.424316, 0.5960785, 0, 1, 1,
0.7450287, 0.4835369, 0.2725483, 0.6039216, 0, 1, 1,
0.7491417, -2.152167, 2.398526, 0.6078432, 0, 1, 1,
0.7576512, -0.7909874, 2.962889, 0.6156863, 0, 1, 1,
0.7577933, -1.185523, 1.629376, 0.6196079, 0, 1, 1,
0.7620144, -0.2242835, 3.253287, 0.627451, 0, 1, 1,
0.7641818, 0.802606, 1.024113, 0.6313726, 0, 1, 1,
0.7765036, -0.5988372, 0.2040785, 0.6392157, 0, 1, 1,
0.782272, -0.7459045, 1.651477, 0.6431373, 0, 1, 1,
0.7823892, -0.6161911, 1.819625, 0.6509804, 0, 1, 1,
0.7854097, -0.1446107, 2.024917, 0.654902, 0, 1, 1,
0.7882394, -0.4756829, 1.962076, 0.6627451, 0, 1, 1,
0.7958495, 1.14367, 1.793621, 0.6666667, 0, 1, 1,
0.7975996, -0.1848922, 1.152458, 0.6745098, 0, 1, 1,
0.7990873, 0.5505657, 0.2097284, 0.6784314, 0, 1, 1,
0.8032162, -0.2521504, 0.8933538, 0.6862745, 0, 1, 1,
0.806833, -1.6966, 1.557334, 0.6901961, 0, 1, 1,
0.8161755, -0.4349357, 1.657501, 0.6980392, 0, 1, 1,
0.8193709, -0.8288596, 0.9685925, 0.7058824, 0, 1, 1,
0.8252093, -2.397068, 1.809954, 0.7098039, 0, 1, 1,
0.8307738, 1.916299, -0.8323464, 0.7176471, 0, 1, 1,
0.8310922, 0.433782, 1.347055, 0.7215686, 0, 1, 1,
0.8345322, -0.8321514, 3.475778, 0.7294118, 0, 1, 1,
0.8367264, 0.2125606, 0.2346519, 0.7333333, 0, 1, 1,
0.8387236, -1.203962, 1.68004, 0.7411765, 0, 1, 1,
0.840875, 1.651954, 1.121913, 0.7450981, 0, 1, 1,
0.8506178, -1.705514, 1.955324, 0.7529412, 0, 1, 1,
0.8526155, -1.439968, 3.160944, 0.7568628, 0, 1, 1,
0.85276, 0.5753821, 2.46795, 0.7647059, 0, 1, 1,
0.8528428, -0.05106679, 1.844652, 0.7686275, 0, 1, 1,
0.8564355, -0.9068389, 2.290385, 0.7764706, 0, 1, 1,
0.8578351, 0.1821743, 2.066624, 0.7803922, 0, 1, 1,
0.8593698, 0.5032937, -1.512742, 0.7882353, 0, 1, 1,
0.8635719, 1.073774, 1.577264, 0.7921569, 0, 1, 1,
0.8690131, -0.3809418, 1.941133, 0.8, 0, 1, 1,
0.8701736, -0.6335236, 1.919208, 0.8078431, 0, 1, 1,
0.8708361, 0.7137348, 2.917332, 0.8117647, 0, 1, 1,
0.8783239, 1.997769, 0.6600979, 0.8196079, 0, 1, 1,
0.8785878, 0.6625707, -0.375419, 0.8235294, 0, 1, 1,
0.8794991, 1.517024, -0.9207285, 0.8313726, 0, 1, 1,
0.8857824, -0.1209865, 0.766193, 0.8352941, 0, 1, 1,
0.8864817, 0.4105616, 1.304727, 0.8431373, 0, 1, 1,
0.8926712, -0.3681737, 1.594309, 0.8470588, 0, 1, 1,
0.8944614, -0.04717699, 0.9929327, 0.854902, 0, 1, 1,
0.9076055, -0.6913873, 2.453572, 0.8588235, 0, 1, 1,
0.9078842, -1.11601, 1.981619, 0.8666667, 0, 1, 1,
0.9085048, -1.187373, 1.518844, 0.8705882, 0, 1, 1,
0.9089136, -0.240508, 0.9443633, 0.8784314, 0, 1, 1,
0.9118137, -1.331862, 3.140976, 0.8823529, 0, 1, 1,
0.9252629, -0.5882496, 2.961738, 0.8901961, 0, 1, 1,
0.9303058, -0.8282378, 3.611014, 0.8941177, 0, 1, 1,
0.930939, -0.04405516, 2.319236, 0.9019608, 0, 1, 1,
0.9375517, -0.3195499, 1.520386, 0.9098039, 0, 1, 1,
0.937668, -0.7381237, 2.737975, 0.9137255, 0, 1, 1,
0.9445332, 0.3319418, 1.791502, 0.9215686, 0, 1, 1,
0.9485831, -1.456295, 0.4943404, 0.9254902, 0, 1, 1,
0.9541897, -0.5551666, 1.662138, 0.9333333, 0, 1, 1,
0.9548873, 1.054658, 0.9538896, 0.9372549, 0, 1, 1,
0.962629, -0.8414567, 3.979172, 0.945098, 0, 1, 1,
0.9628957, -0.3326577, 1.070466, 0.9490196, 0, 1, 1,
0.9645447, -0.02597469, 1.604793, 0.9568627, 0, 1, 1,
0.9699147, -0.552507, 1.59717, 0.9607843, 0, 1, 1,
0.9851696, 0.1532216, 0.9965654, 0.9686275, 0, 1, 1,
0.9934695, -1.392119, 2.574145, 0.972549, 0, 1, 1,
0.9946587, 0.1750929, 1.292778, 0.9803922, 0, 1, 1,
0.9963563, 0.3270527, 0.6272694, 0.9843137, 0, 1, 1,
0.9986395, -1.359387, 2.889858, 0.9921569, 0, 1, 1,
1.014543, 0.3680403, 1.685917, 0.9960784, 0, 1, 1,
1.019835, 0.2873645, -1.030922, 1, 0, 0.9960784, 1,
1.024344, 1.533305, 1.127811, 1, 0, 0.9882353, 1,
1.025675, 0.7881601, 0.211444, 1, 0, 0.9843137, 1,
1.026438, -0.084746, 3.094531, 1, 0, 0.9764706, 1,
1.031025, 1.466663, 2.427472, 1, 0, 0.972549, 1,
1.036838, -0.7020804, 0.1295249, 1, 0, 0.9647059, 1,
1.044201, -0.6822902, 2.484066, 1, 0, 0.9607843, 1,
1.054334, -0.5296499, 1.285095, 1, 0, 0.9529412, 1,
1.061391, 0.1507676, 2.552349, 1, 0, 0.9490196, 1,
1.063042, 0.1452179, 1.416366, 1, 0, 0.9411765, 1,
1.065516, 0.3905706, 1.073216, 1, 0, 0.9372549, 1,
1.066067, 0.7730882, 1.50457, 1, 0, 0.9294118, 1,
1.067897, -1.787324, 0.1191105, 1, 0, 0.9254902, 1,
1.069649, -1.293974, 1.426917, 1, 0, 0.9176471, 1,
1.071498, 0.2192863, 0.3600693, 1, 0, 0.9137255, 1,
1.084243, 1.031715, -0.05123604, 1, 0, 0.9058824, 1,
1.087627, 2.190792, -0.3390151, 1, 0, 0.9019608, 1,
1.088561, 1.401639, -0.7472379, 1, 0, 0.8941177, 1,
1.103446, 0.06588621, 1.575587, 1, 0, 0.8862745, 1,
1.104126, 0.2267667, 2.417083, 1, 0, 0.8823529, 1,
1.104322, 0.3226745, -0.1760696, 1, 0, 0.8745098, 1,
1.106054, -0.9718653, 3.722147, 1, 0, 0.8705882, 1,
1.112378, 0.841177, 1.551764, 1, 0, 0.8627451, 1,
1.117676, -0.5585628, 3.112655, 1, 0, 0.8588235, 1,
1.121523, -1.325107, 2.397484, 1, 0, 0.8509804, 1,
1.122151, 0.6152424, 1.203731, 1, 0, 0.8470588, 1,
1.122278, -0.2596638, 1.30308, 1, 0, 0.8392157, 1,
1.123209, 1.205338, 2.202511, 1, 0, 0.8352941, 1,
1.125815, -0.3634961, 0.5505177, 1, 0, 0.827451, 1,
1.126919, 1.148858, 0.5084361, 1, 0, 0.8235294, 1,
1.127977, 0.407262, 1.081888, 1, 0, 0.8156863, 1,
1.136111, -1.234246, 2.876212, 1, 0, 0.8117647, 1,
1.139699, -1.069018, 2.301473, 1, 0, 0.8039216, 1,
1.14246, 0.3703403, -0.2046832, 1, 0, 0.7960784, 1,
1.143247, -0.07862107, 0.8595305, 1, 0, 0.7921569, 1,
1.143708, 1.808361, 1.982943, 1, 0, 0.7843137, 1,
1.157004, 1.436298, -0.5372229, 1, 0, 0.7803922, 1,
1.169208, -0.7903885, 3.179247, 1, 0, 0.772549, 1,
1.175385, -2.289161, 2.169447, 1, 0, 0.7686275, 1,
1.182324, -0.6193738, 0.6869503, 1, 0, 0.7607843, 1,
1.18382, -1.6972, 0.8229544, 1, 0, 0.7568628, 1,
1.186956, 0.9515166, -0.4830608, 1, 0, 0.7490196, 1,
1.187028, -1.438947, 2.219912, 1, 0, 0.7450981, 1,
1.187661, -0.2040435, 3.633596, 1, 0, 0.7372549, 1,
1.195537, 0.09565367, 0.7766386, 1, 0, 0.7333333, 1,
1.195888, 1.649307, 2.312249, 1, 0, 0.7254902, 1,
1.202672, 1.927127, -0.6846057, 1, 0, 0.7215686, 1,
1.207471, -0.7949139, 2.406218, 1, 0, 0.7137255, 1,
1.213185, -0.3219736, 2.572784, 1, 0, 0.7098039, 1,
1.21795, -0.986919, 2.143173, 1, 0, 0.7019608, 1,
1.220515, 0.4950521, 3.179599, 1, 0, 0.6941177, 1,
1.227598, 1.099511, -0.1640479, 1, 0, 0.6901961, 1,
1.228727, -0.2342067, 2.217311, 1, 0, 0.682353, 1,
1.236027, -0.7642915, 2.365456, 1, 0, 0.6784314, 1,
1.254773, 1.346936, 0.7441416, 1, 0, 0.6705883, 1,
1.257826, -0.01942379, 2.110767, 1, 0, 0.6666667, 1,
1.260073, -0.2404652, 2.605296, 1, 0, 0.6588235, 1,
1.262021, 0.03274431, 2.272797, 1, 0, 0.654902, 1,
1.264799, 1.063716, -0.7622669, 1, 0, 0.6470588, 1,
1.274171, -1.326057, 2.015797, 1, 0, 0.6431373, 1,
1.28405, -0.7967744, 1.786502, 1, 0, 0.6352941, 1,
1.288483, 0.7998414, 1.987297, 1, 0, 0.6313726, 1,
1.289742, -0.3177341, 1.344849, 1, 0, 0.6235294, 1,
1.292027, -2.149819, 3.634881, 1, 0, 0.6196079, 1,
1.293616, 0.1575966, 1.499383, 1, 0, 0.6117647, 1,
1.294383, -0.4309105, 3.540426, 1, 0, 0.6078432, 1,
1.300586, 0.4614005, 2.161869, 1, 0, 0.6, 1,
1.30367, 0.9494107, 2.508559, 1, 0, 0.5921569, 1,
1.31192, 0.4781067, -1.272686, 1, 0, 0.5882353, 1,
1.312251, -1.011605, 2.02036, 1, 0, 0.5803922, 1,
1.313913, 0.05084408, 1.19007, 1, 0, 0.5764706, 1,
1.319907, -0.5894227, 2.369132, 1, 0, 0.5686275, 1,
1.341602, 0.3283712, 0.2649537, 1, 0, 0.5647059, 1,
1.349012, -0.9495341, 1.601437, 1, 0, 0.5568628, 1,
1.351075, 1.051805, 1.063081, 1, 0, 0.5529412, 1,
1.353978, 2.073436, 1.747116, 1, 0, 0.5450981, 1,
1.357959, -0.3420442, 0.8271186, 1, 0, 0.5411765, 1,
1.359639, -0.602185, 2.045125, 1, 0, 0.5333334, 1,
1.359747, -0.7075459, 3.41557, 1, 0, 0.5294118, 1,
1.36246, -0.1474496, 1.737309, 1, 0, 0.5215687, 1,
1.363678, -0.2315346, 3.098452, 1, 0, 0.5176471, 1,
1.368439, 0.8926895, -0.1259859, 1, 0, 0.509804, 1,
1.370357, -0.4710441, 2.587581, 1, 0, 0.5058824, 1,
1.372285, 0.4399542, 2.063531, 1, 0, 0.4980392, 1,
1.377855, -0.8680277, 3.700475, 1, 0, 0.4901961, 1,
1.402609, 0.1682074, 2.137589, 1, 0, 0.4862745, 1,
1.402811, 0.6488076, -1.167419, 1, 0, 0.4784314, 1,
1.408822, 0.1293677, 0.6264316, 1, 0, 0.4745098, 1,
1.422169, 1.409199, 0.1057784, 1, 0, 0.4666667, 1,
1.424126, 0.6656361, -1.212188, 1, 0, 0.4627451, 1,
1.438539, -1.119673, 2.614246, 1, 0, 0.454902, 1,
1.439735, 0.7801273, 2.099103, 1, 0, 0.4509804, 1,
1.44422, -0.3004921, 4.058062, 1, 0, 0.4431373, 1,
1.457346, 1.422325, 1.316914, 1, 0, 0.4392157, 1,
1.45864, 0.7985712, 2.867988, 1, 0, 0.4313726, 1,
1.464772, -2.212015, 2.168504, 1, 0, 0.427451, 1,
1.469271, -1.77737, 2.418635, 1, 0, 0.4196078, 1,
1.471263, 0.7909685, 0.2574014, 1, 0, 0.4156863, 1,
1.477778, -0.8666283, 2.113042, 1, 0, 0.4078431, 1,
1.487054, -1.259672, 3.454381, 1, 0, 0.4039216, 1,
1.494114, -0.2570092, 3.037108, 1, 0, 0.3960784, 1,
1.494938, -1.138529, 0.6394725, 1, 0, 0.3882353, 1,
1.495816, -0.2648533, 1.056129, 1, 0, 0.3843137, 1,
1.497239, 1.24953, 0.3887809, 1, 0, 0.3764706, 1,
1.510678, -0.3870091, 1.039513, 1, 0, 0.372549, 1,
1.511536, -1.230486, 1.284475, 1, 0, 0.3647059, 1,
1.535253, -1.302267, 2.919171, 1, 0, 0.3607843, 1,
1.552382, -0.1225269, 0.8937579, 1, 0, 0.3529412, 1,
1.55344, 0.8938286, 0.9293028, 1, 0, 0.3490196, 1,
1.555514, -0.3215836, 0.7622971, 1, 0, 0.3411765, 1,
1.582356, -0.3015176, 1.335486, 1, 0, 0.3372549, 1,
1.584811, 0.3470119, 2.124584, 1, 0, 0.3294118, 1,
1.590727, -0.3002338, 2.031139, 1, 0, 0.3254902, 1,
1.605301, 1.068602, 0.7998042, 1, 0, 0.3176471, 1,
1.63818, 0.1348625, 0.9491621, 1, 0, 0.3137255, 1,
1.663314, 0.1742474, 1.676838, 1, 0, 0.3058824, 1,
1.675111, 1.074069, 1.259919, 1, 0, 0.2980392, 1,
1.675162, 1.807489, 0.877616, 1, 0, 0.2941177, 1,
1.676382, 0.9902602, -0.06414586, 1, 0, 0.2862745, 1,
1.678884, 1.580471, 0.704323, 1, 0, 0.282353, 1,
1.690692, -0.5778893, 3.481001, 1, 0, 0.2745098, 1,
1.695745, -0.06072582, 2.245946, 1, 0, 0.2705882, 1,
1.696651, 2.473283, -0.08501652, 1, 0, 0.2627451, 1,
1.69673, -0.2946506, 2.512386, 1, 0, 0.2588235, 1,
1.700386, 1.652992, 0.8668869, 1, 0, 0.2509804, 1,
1.710288, -2.178318, 2.020435, 1, 0, 0.2470588, 1,
1.723107, -0.554975, 2.637571, 1, 0, 0.2392157, 1,
1.729802, -0.7282213, 1.433738, 1, 0, 0.2352941, 1,
1.740342, 0.6592734, 1.658809, 1, 0, 0.227451, 1,
1.742724, -1.619253, 1.597462, 1, 0, 0.2235294, 1,
1.749791, -1.453312, 2.461195, 1, 0, 0.2156863, 1,
1.755617, -0.06085724, 0.4459943, 1, 0, 0.2117647, 1,
1.787795, 1.932213, 0.5939136, 1, 0, 0.2039216, 1,
1.79754, -0.2975175, 0.8108447, 1, 0, 0.1960784, 1,
1.805208, 1.437378, 3.626996, 1, 0, 0.1921569, 1,
1.806022, 0.7851599, 0.7760398, 1, 0, 0.1843137, 1,
1.808717, -0.0455806, 2.418525, 1, 0, 0.1803922, 1,
1.837194, 1.156971, 2.278453, 1, 0, 0.172549, 1,
1.865568, 0.8302824, 0.9254186, 1, 0, 0.1686275, 1,
1.942766, -1.15935, 2.594538, 1, 0, 0.1607843, 1,
1.949023, -0.4894208, 2.642617, 1, 0, 0.1568628, 1,
1.951441, 0.6015341, 1.75498, 1, 0, 0.1490196, 1,
1.956807, 0.0057065, 2.123273, 1, 0, 0.145098, 1,
1.964472, -0.1951334, -0.1913969, 1, 0, 0.1372549, 1,
1.975916, -0.09104789, 2.257122, 1, 0, 0.1333333, 1,
1.984361, 1.049537, 1.278974, 1, 0, 0.1254902, 1,
1.997473, -1.121325, 2.322079, 1, 0, 0.1215686, 1,
2.00817, 0.2165918, 3.190249, 1, 0, 0.1137255, 1,
2.021189, 1.066126, 0.1843595, 1, 0, 0.1098039, 1,
2.021595, 0.8766202, 0.8357037, 1, 0, 0.1019608, 1,
2.033746, -0.6491564, 2.792291, 1, 0, 0.09411765, 1,
2.047747, -0.1570542, 0.7533945, 1, 0, 0.09019608, 1,
2.054834, -1.245309, -0.4932105, 1, 0, 0.08235294, 1,
2.095598, -0.4152758, 2.882672, 1, 0, 0.07843138, 1,
2.116132, -0.9583024, 2.322701, 1, 0, 0.07058824, 1,
2.15537, -1.263042, 2.944578, 1, 0, 0.06666667, 1,
2.221381, -0.7094617, 1.76932, 1, 0, 0.05882353, 1,
2.235647, -2.056221, 4.140656, 1, 0, 0.05490196, 1,
2.247406, -0.2986863, 2.213681, 1, 0, 0.04705882, 1,
2.276127, -1.224022, 2.60101, 1, 0, 0.04313726, 1,
2.464491, 0.5022013, 0.7160182, 1, 0, 0.03529412, 1,
2.573169, -1.441569, 2.306813, 1, 0, 0.03137255, 1,
2.722176, 0.05237789, 1.16444, 1, 0, 0.02352941, 1,
2.757194, -0.7313837, 3.149397, 1, 0, 0.01960784, 1,
3.075661, -1.523946, 0.2395184, 1, 0, 0.01176471, 1,
3.391653, -2.065112, 5.16695, 1, 0, 0.007843138, 1
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
-0.1853782, -4.252716, -7.660977, 0, -0.5, 0.5, 0.5,
-0.1853782, -4.252716, -7.660977, 1, -0.5, 0.5, 0.5,
-0.1853782, -4.252716, -7.660977, 1, 1.5, 0.5, 0.5,
-0.1853782, -4.252716, -7.660977, 0, 1.5, 0.5, 0.5
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
-4.975022, -0.02287793, -7.660977, 0, -0.5, 0.5, 0.5,
-4.975022, -0.02287793, -7.660977, 1, -0.5, 0.5, 0.5,
-4.975022, -0.02287793, -7.660977, 1, 1.5, 0.5, 0.5,
-4.975022, -0.02287793, -7.660977, 0, 1.5, 0.5, 0.5
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
-4.975022, -4.252716, 0.04172969, 0, -0.5, 0.5, 0.5,
-4.975022, -4.252716, 0.04172969, 1, -0.5, 0.5, 0.5,
-4.975022, -4.252716, 0.04172969, 1, 1.5, 0.5, 0.5,
-4.975022, -4.252716, 0.04172969, 0, 1.5, 0.5, 0.5
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
-2, -3.2766, -5.88343,
2, -3.2766, -5.88343,
-2, -3.2766, -5.88343,
-2, -3.439286, -6.179688,
0, -3.2766, -5.88343,
0, -3.439286, -6.179688,
2, -3.2766, -5.88343,
2, -3.439286, -6.179688
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
"0",
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
-2, -3.764658, -6.772203, 0, -0.5, 0.5, 0.5,
-2, -3.764658, -6.772203, 1, -0.5, 0.5, 0.5,
-2, -3.764658, -6.772203, 1, 1.5, 0.5, 0.5,
-2, -3.764658, -6.772203, 0, 1.5, 0.5, 0.5,
0, -3.764658, -6.772203, 0, -0.5, 0.5, 0.5,
0, -3.764658, -6.772203, 1, -0.5, 0.5, 0.5,
0, -3.764658, -6.772203, 1, 1.5, 0.5, 0.5,
0, -3.764658, -6.772203, 0, 1.5, 0.5, 0.5,
2, -3.764658, -6.772203, 0, -0.5, 0.5, 0.5,
2, -3.764658, -6.772203, 1, -0.5, 0.5, 0.5,
2, -3.764658, -6.772203, 1, 1.5, 0.5, 0.5,
2, -3.764658, -6.772203, 0, 1.5, 0.5, 0.5
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
-3.86972, -3, -5.88343,
-3.86972, 3, -5.88343,
-3.86972, -3, -5.88343,
-4.053937, -3, -6.179688,
-3.86972, -2, -5.88343,
-4.053937, -2, -6.179688,
-3.86972, -1, -5.88343,
-4.053937, -1, -6.179688,
-3.86972, 0, -5.88343,
-4.053937, 0, -6.179688,
-3.86972, 1, -5.88343,
-4.053937, 1, -6.179688,
-3.86972, 2, -5.88343,
-4.053937, 2, -6.179688,
-3.86972, 3, -5.88343,
-4.053937, 3, -6.179688
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
-4.422371, -3, -6.772203, 0, -0.5, 0.5, 0.5,
-4.422371, -3, -6.772203, 1, -0.5, 0.5, 0.5,
-4.422371, -3, -6.772203, 1, 1.5, 0.5, 0.5,
-4.422371, -3, -6.772203, 0, 1.5, 0.5, 0.5,
-4.422371, -2, -6.772203, 0, -0.5, 0.5, 0.5,
-4.422371, -2, -6.772203, 1, -0.5, 0.5, 0.5,
-4.422371, -2, -6.772203, 1, 1.5, 0.5, 0.5,
-4.422371, -2, -6.772203, 0, 1.5, 0.5, 0.5,
-4.422371, -1, -6.772203, 0, -0.5, 0.5, 0.5,
-4.422371, -1, -6.772203, 1, -0.5, 0.5, 0.5,
-4.422371, -1, -6.772203, 1, 1.5, 0.5, 0.5,
-4.422371, -1, -6.772203, 0, 1.5, 0.5, 0.5,
-4.422371, 0, -6.772203, 0, -0.5, 0.5, 0.5,
-4.422371, 0, -6.772203, 1, -0.5, 0.5, 0.5,
-4.422371, 0, -6.772203, 1, 1.5, 0.5, 0.5,
-4.422371, 0, -6.772203, 0, 1.5, 0.5, 0.5,
-4.422371, 1, -6.772203, 0, -0.5, 0.5, 0.5,
-4.422371, 1, -6.772203, 1, -0.5, 0.5, 0.5,
-4.422371, 1, -6.772203, 1, 1.5, 0.5, 0.5,
-4.422371, 1, -6.772203, 0, 1.5, 0.5, 0.5,
-4.422371, 2, -6.772203, 0, -0.5, 0.5, 0.5,
-4.422371, 2, -6.772203, 1, -0.5, 0.5, 0.5,
-4.422371, 2, -6.772203, 1, 1.5, 0.5, 0.5,
-4.422371, 2, -6.772203, 0, 1.5, 0.5, 0.5,
-4.422371, 3, -6.772203, 0, -0.5, 0.5, 0.5,
-4.422371, 3, -6.772203, 1, -0.5, 0.5, 0.5,
-4.422371, 3, -6.772203, 1, 1.5, 0.5, 0.5,
-4.422371, 3, -6.772203, 0, 1.5, 0.5, 0.5
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
-3.86972, -3.2766, -4,
-3.86972, -3.2766, 4,
-3.86972, -3.2766, -4,
-4.053937, -3.439286, -4,
-3.86972, -3.2766, -2,
-4.053937, -3.439286, -2,
-3.86972, -3.2766, 0,
-4.053937, -3.439286, 0,
-3.86972, -3.2766, 2,
-4.053937, -3.439286, 2,
-3.86972, -3.2766, 4,
-4.053937, -3.439286, 4
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
-4.422371, -3.764658, -4, 0, -0.5, 0.5, 0.5,
-4.422371, -3.764658, -4, 1, -0.5, 0.5, 0.5,
-4.422371, -3.764658, -4, 1, 1.5, 0.5, 0.5,
-4.422371, -3.764658, -4, 0, 1.5, 0.5, 0.5,
-4.422371, -3.764658, -2, 0, -0.5, 0.5, 0.5,
-4.422371, -3.764658, -2, 1, -0.5, 0.5, 0.5,
-4.422371, -3.764658, -2, 1, 1.5, 0.5, 0.5,
-4.422371, -3.764658, -2, 0, 1.5, 0.5, 0.5,
-4.422371, -3.764658, 0, 0, -0.5, 0.5, 0.5,
-4.422371, -3.764658, 0, 1, -0.5, 0.5, 0.5,
-4.422371, -3.764658, 0, 1, 1.5, 0.5, 0.5,
-4.422371, -3.764658, 0, 0, 1.5, 0.5, 0.5,
-4.422371, -3.764658, 2, 0, -0.5, 0.5, 0.5,
-4.422371, -3.764658, 2, 1, -0.5, 0.5, 0.5,
-4.422371, -3.764658, 2, 1, 1.5, 0.5, 0.5,
-4.422371, -3.764658, 2, 0, 1.5, 0.5, 0.5,
-4.422371, -3.764658, 4, 0, -0.5, 0.5, 0.5,
-4.422371, -3.764658, 4, 1, -0.5, 0.5, 0.5,
-4.422371, -3.764658, 4, 1, 1.5, 0.5, 0.5,
-4.422371, -3.764658, 4, 0, 1.5, 0.5, 0.5
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
-3.86972, -3.2766, -5.88343,
-3.86972, 3.230844, -5.88343,
-3.86972, -3.2766, 5.966889,
-3.86972, 3.230844, 5.966889,
-3.86972, -3.2766, -5.88343,
-3.86972, -3.2766, 5.966889,
-3.86972, 3.230844, -5.88343,
-3.86972, 3.230844, 5.966889,
-3.86972, -3.2766, -5.88343,
3.498964, -3.2766, -5.88343,
-3.86972, -3.2766, 5.966889,
3.498964, -3.2766, 5.966889,
-3.86972, 3.230844, -5.88343,
3.498964, 3.230844, -5.88343,
-3.86972, 3.230844, 5.966889,
3.498964, 3.230844, 5.966889,
3.498964, -3.2766, -5.88343,
3.498964, 3.230844, -5.88343,
3.498964, -3.2766, 5.966889,
3.498964, 3.230844, 5.966889,
3.498964, -3.2766, -5.88343,
3.498964, -3.2766, 5.966889,
3.498964, 3.230844, -5.88343,
3.498964, 3.230844, 5.966889
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
var radius = 8.221816;
var distance = 36.57979;
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
mvMatrix.translate( 0.1853782, 0.02287793, -0.04172969 );
mvMatrix.scale( 1.206401, 1.366065, 0.7501561 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.57979);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Symclosene<-read.table("Symclosene.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Symclosene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Symclosene' not found
```

```r
y<-Symclosene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Symclosene' not found
```

```r
z<-Symclosene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Symclosene' not found
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
-3.762409, 2.696853, -1.155219, 0, 0, 1, 1, 1,
-3.275834, 0.4493395, -1.356963, 1, 0, 0, 1, 1,
-2.64127, -1.386913, -2.673075, 1, 0, 0, 1, 1,
-2.520285, 1.346384, -1.288556, 1, 0, 0, 1, 1,
-2.511576, -1.325578, -1.064017, 1, 0, 0, 1, 1,
-2.506983, 0.6996706, -2.24762, 1, 0, 0, 1, 1,
-2.420313, -0.051944, -1.732461, 0, 0, 0, 1, 1,
-2.247995, -0.3593219, -0.222977, 0, 0, 0, 1, 1,
-2.205514, 1.319351, 0.7592173, 0, 0, 0, 1, 1,
-2.152529, 0.8766655, -0.8939009, 0, 0, 0, 1, 1,
-2.108796, -0.2361437, -1.839081, 0, 0, 0, 1, 1,
-2.096007, 0.9308923, -0.3160248, 0, 0, 0, 1, 1,
-2.075176, -0.1595672, -0.9317423, 0, 0, 0, 1, 1,
-2.012216, 0.8796883, 0.1665727, 1, 1, 1, 1, 1,
-2.001777, 0.395859, 0.9218197, 1, 1, 1, 1, 1,
-1.989229, -0.2432278, -3.178094, 1, 1, 1, 1, 1,
-1.935866, 0.9098703, -1.767908, 1, 1, 1, 1, 1,
-1.920797, 0.04041658, -1.646916, 1, 1, 1, 1, 1,
-1.908107, -2.56623, -1.738196, 1, 1, 1, 1, 1,
-1.888331, -0.3104092, -0.8808505, 1, 1, 1, 1, 1,
-1.863031, -0.5270275, -1.651384, 1, 1, 1, 1, 1,
-1.805816, 0.3854912, -0.1729562, 1, 1, 1, 1, 1,
-1.796475, 0.1306143, -1.96381, 1, 1, 1, 1, 1,
-1.795005, -0.6234646, 0.7371395, 1, 1, 1, 1, 1,
-1.79043, -0.2087832, -2.168352, 1, 1, 1, 1, 1,
-1.782528, 0.855261, -1.384155, 1, 1, 1, 1, 1,
-1.767788, -0.05461108, -4.082275, 1, 1, 1, 1, 1,
-1.763884, -0.6225681, -3.864676, 1, 1, 1, 1, 1,
-1.740698, 1.587437, -1.271142, 0, 0, 1, 1, 1,
-1.732712, 0.6685759, -1.013374, 1, 0, 0, 1, 1,
-1.720671, 0.5659672, -2.311715, 1, 0, 0, 1, 1,
-1.702446, -0.6782246, -0.3162861, 1, 0, 0, 1, 1,
-1.694363, -0.6360797, -1.705779, 1, 0, 0, 1, 1,
-1.691414, 0.05687144, -2.571413, 1, 0, 0, 1, 1,
-1.667884, 1.651499, -1.156943, 0, 0, 0, 1, 1,
-1.662738, 0.3589678, -2.312768, 0, 0, 0, 1, 1,
-1.651323, -1.099604, -2.829147, 0, 0, 0, 1, 1,
-1.645409, -0.6528768, -1.284383, 0, 0, 0, 1, 1,
-1.639372, 0.3714401, -2.157808, 0, 0, 0, 1, 1,
-1.635514, -1.134201, -3.647933, 0, 0, 0, 1, 1,
-1.632353, 0.689105, -0.9054714, 0, 0, 0, 1, 1,
-1.63062, -0.2842144, -2.60494, 1, 1, 1, 1, 1,
-1.628819, 0.9674322, 1.973159, 1, 1, 1, 1, 1,
-1.625458, -1.386241, -2.37921, 1, 1, 1, 1, 1,
-1.621622, 0.1082117, -1.034923, 1, 1, 1, 1, 1,
-1.619992, 0.5760176, 0.06918444, 1, 1, 1, 1, 1,
-1.619097, -0.04407792, -1.96958, 1, 1, 1, 1, 1,
-1.61362, -0.8534681, -2.588447, 1, 1, 1, 1, 1,
-1.599918, 0.9155601, -0.7086691, 1, 1, 1, 1, 1,
-1.599266, 1.506153, -2.601837, 1, 1, 1, 1, 1,
-1.598279, 1.649421, -1.204625, 1, 1, 1, 1, 1,
-1.597867, -0.9226279, -2.443538, 1, 1, 1, 1, 1,
-1.580808, -1.669272, -3.264955, 1, 1, 1, 1, 1,
-1.572642, 0.3853786, 0.1736159, 1, 1, 1, 1, 1,
-1.565892, -1.455102, -1.390386, 1, 1, 1, 1, 1,
-1.565884, -1.010636, -4.33119, 1, 1, 1, 1, 1,
-1.548801, 1.198254, -1.435007, 0, 0, 1, 1, 1,
-1.546338, -0.04828021, -1.368428, 1, 0, 0, 1, 1,
-1.546116, 2.247577, -1.727033, 1, 0, 0, 1, 1,
-1.541078, 0.6245053, -0.731468, 1, 0, 0, 1, 1,
-1.506248, 1.047617, 0.5897888, 1, 0, 0, 1, 1,
-1.502356, 0.6042951, -0.0314026, 1, 0, 0, 1, 1,
-1.494599, -1.889327, -1.152083, 0, 0, 0, 1, 1,
-1.493763, -0.1079404, -2.380055, 0, 0, 0, 1, 1,
-1.491772, -0.1063315, -1.575622, 0, 0, 0, 1, 1,
-1.488234, 0.4610408, 0.5929991, 0, 0, 0, 1, 1,
-1.484137, 0.3998632, -2.51382, 0, 0, 0, 1, 1,
-1.480207, 1.856707, -0.307341, 0, 0, 0, 1, 1,
-1.470388, 0.002707493, -3.973454, 0, 0, 0, 1, 1,
-1.469517, 0.1106105, -2.279202, 1, 1, 1, 1, 1,
-1.469454, 1.054381, 0.08010604, 1, 1, 1, 1, 1,
-1.465652, 2.04209, -0.2270537, 1, 1, 1, 1, 1,
-1.464473, -1.114525, -3.265568, 1, 1, 1, 1, 1,
-1.455223, -1.408659, -3.62654, 1, 1, 1, 1, 1,
-1.440588, -1.678733, -3.941311, 1, 1, 1, 1, 1,
-1.427979, -0.4648459, -2.421242, 1, 1, 1, 1, 1,
-1.425311, 1.00977, -1.027012, 1, 1, 1, 1, 1,
-1.422909, 1.99576, -2.128429, 1, 1, 1, 1, 1,
-1.410703, -0.6059745, -2.969673, 1, 1, 1, 1, 1,
-1.383767, -1.425782, -3.023232, 1, 1, 1, 1, 1,
-1.365457, 1.73105, 0.4265071, 1, 1, 1, 1, 1,
-1.352733, 1.206072, -0.3747275, 1, 1, 1, 1, 1,
-1.347646, 1.36428, -1.696631, 1, 1, 1, 1, 1,
-1.338896, 0.5521465, -3.472412, 1, 1, 1, 1, 1,
-1.335911, -0.5101126, -3.094256, 0, 0, 1, 1, 1,
-1.335623, 0.8365733, -0.1201765, 1, 0, 0, 1, 1,
-1.321527, 0.4917485, -3.063849, 1, 0, 0, 1, 1,
-1.321232, -0.1665257, -0.8443245, 1, 0, 0, 1, 1,
-1.320906, -0.2610939, -0.5493559, 1, 0, 0, 1, 1,
-1.313059, 0.8802387, -1.519837, 1, 0, 0, 1, 1,
-1.29379, -0.8551952, -3.833686, 0, 0, 0, 1, 1,
-1.29207, -1.411958, -2.287622, 0, 0, 0, 1, 1,
-1.290567, 0.2936293, -1.023461, 0, 0, 0, 1, 1,
-1.286314, -1.033303, -2.140342, 0, 0, 0, 1, 1,
-1.280806, 2.255813, -0.5385181, 0, 0, 0, 1, 1,
-1.275378, -0.5210401, -1.770273, 0, 0, 0, 1, 1,
-1.269189, -3.066, -1.093504, 0, 0, 0, 1, 1,
-1.266227, 0.746206, 0.5196993, 1, 1, 1, 1, 1,
-1.264942, -1.366377, -1.386468, 1, 1, 1, 1, 1,
-1.262756, -0.2293082, -0.9428802, 1, 1, 1, 1, 1,
-1.256943, 1.671356, -0.6248334, 1, 1, 1, 1, 1,
-1.252061, -0.5402245, -1.477676, 1, 1, 1, 1, 1,
-1.245642, 0.01549336, -1.589482, 1, 1, 1, 1, 1,
-1.23962, 1.597304, -1.924614, 1, 1, 1, 1, 1,
-1.239296, -0.008231906, -1.450794, 1, 1, 1, 1, 1,
-1.238251, -0.9947398, -2.169988, 1, 1, 1, 1, 1,
-1.236427, 1.058102, -0.6892006, 1, 1, 1, 1, 1,
-1.217441, -2.038912, -1.59285, 1, 1, 1, 1, 1,
-1.216874, -0.4885902, -0.8356611, 1, 1, 1, 1, 1,
-1.2124, 0.1745794, -2.407556, 1, 1, 1, 1, 1,
-1.181837, 1.398416, -0.5871789, 1, 1, 1, 1, 1,
-1.178748, 1.451911, -0.8407716, 1, 1, 1, 1, 1,
-1.176767, 2.708578, -0.4586389, 0, 0, 1, 1, 1,
-1.158768, 0.3678546, -2.610064, 1, 0, 0, 1, 1,
-1.156178, 0.5987472, -0.3419674, 1, 0, 0, 1, 1,
-1.152763, 0.2565269, -0.9085705, 1, 0, 0, 1, 1,
-1.150374, 0.6554712, -0.6355464, 1, 0, 0, 1, 1,
-1.150122, -1.350674, -1.909188, 1, 0, 0, 1, 1,
-1.146724, -1.07766, -3.227283, 0, 0, 0, 1, 1,
-1.139682, 0.7949629, 0.2400474, 0, 0, 0, 1, 1,
-1.136755, -1.545177, -1.635305, 0, 0, 0, 1, 1,
-1.129782, 0.3758799, -1.138171, 0, 0, 0, 1, 1,
-1.129356, 0.4162975, -1.921232, 0, 0, 0, 1, 1,
-1.116582, 2.185197, 0.5975789, 0, 0, 0, 1, 1,
-1.111541, 0.3831593, 0.09664514, 0, 0, 0, 1, 1,
-1.111406, -1.369079, -1.920788, 1, 1, 1, 1, 1,
-1.108921, 0.4595416, -1.024887, 1, 1, 1, 1, 1,
-1.106599, 0.1219723, 1.063426, 1, 1, 1, 1, 1,
-1.105687, 0.556351, -3.547683, 1, 1, 1, 1, 1,
-1.104033, -1.026861, -3.923938, 1, 1, 1, 1, 1,
-1.086865, -0.3862552, -1.720872, 1, 1, 1, 1, 1,
-1.078341, -0.6218062, -1.081986, 1, 1, 1, 1, 1,
-1.077219, 0.5307014, -0.4838137, 1, 1, 1, 1, 1,
-1.071751, 0.7587091, -0.7309083, 1, 1, 1, 1, 1,
-1.068834, -0.9789946, -2.760261, 1, 1, 1, 1, 1,
-1.06142, 1.486626, -1.049616, 1, 1, 1, 1, 1,
-1.048076, 1.627928, 1.15005, 1, 1, 1, 1, 1,
-1.037709, 0.3171262, -2.319125, 1, 1, 1, 1, 1,
-1.037616, 0.1991205, -2.915309, 1, 1, 1, 1, 1,
-1.032567, -1.08604, -3.409382, 1, 1, 1, 1, 1,
-1.03207, -0.8757885, -0.6885918, 0, 0, 1, 1, 1,
-1.029446, -0.3556309, -3.197638, 1, 0, 0, 1, 1,
-1.021855, -0.8098826, -1.364037, 1, 0, 0, 1, 1,
-1.01834, 0.5580343, 0.3979572, 1, 0, 0, 1, 1,
-1.01273, 0.7009829, 0.03954645, 1, 0, 0, 1, 1,
-1.010795, -0.5289128, -2.10728, 1, 0, 0, 1, 1,
-1.003081, -0.8470546, -0.6984519, 0, 0, 0, 1, 1,
-0.9917902, 1.214, -0.6046342, 0, 0, 0, 1, 1,
-0.989728, -0.8159364, -1.719546, 0, 0, 0, 1, 1,
-0.9894617, -0.1345995, -1.761393, 0, 0, 0, 1, 1,
-0.9853702, -1.214232, -2.467553, 0, 0, 0, 1, 1,
-0.9852788, -0.431904, -3.726916, 0, 0, 0, 1, 1,
-0.9846557, -0.2358432, -2.332804, 0, 0, 0, 1, 1,
-0.9821498, 0.7286433, -2.253229, 1, 1, 1, 1, 1,
-0.9810105, -1.248235, -1.852126, 1, 1, 1, 1, 1,
-0.975553, 0.3006096, -2.162342, 1, 1, 1, 1, 1,
-0.974628, 0.795568, -0.3427779, 1, 1, 1, 1, 1,
-0.9739928, -0.1532011, -0.7219533, 1, 1, 1, 1, 1,
-0.9697272, 0.6691779, -1.874485, 1, 1, 1, 1, 1,
-0.9681416, -0.297668, -0.8822011, 1, 1, 1, 1, 1,
-0.9661227, -0.5104105, -2.542309, 1, 1, 1, 1, 1,
-0.9637823, -0.04976951, -1.188497, 1, 1, 1, 1, 1,
-0.9625169, 0.04209953, -2.114868, 1, 1, 1, 1, 1,
-0.9508328, -0.903791, -3.0913, 1, 1, 1, 1, 1,
-0.9502609, -0.05091041, -1.9713, 1, 1, 1, 1, 1,
-0.9472424, -1.434824, -2.30661, 1, 1, 1, 1, 1,
-0.9458079, -0.3338965, -1.95145, 1, 1, 1, 1, 1,
-0.939896, -1.026483, -0.8918566, 1, 1, 1, 1, 1,
-0.9395468, -0.001644809, -2.78257, 0, 0, 1, 1, 1,
-0.9346271, 0.7122094, -0.8802111, 1, 0, 0, 1, 1,
-0.9313668, 0.8461562, 0.817036, 1, 0, 0, 1, 1,
-0.9293858, 1.883367, 1.343025, 1, 0, 0, 1, 1,
-0.9277344, -0.419965, -1.990094, 1, 0, 0, 1, 1,
-0.9172767, -0.3117122, -0.794782, 1, 0, 0, 1, 1,
-0.9147314, 0.6983134, -1.771536, 0, 0, 0, 1, 1,
-0.912236, -1.169356, -2.206883, 0, 0, 0, 1, 1,
-0.9064053, 0.9355655, -1.347806, 0, 0, 0, 1, 1,
-0.9045097, 0.1522458, -0.466454, 0, 0, 0, 1, 1,
-0.9025682, 0.1911181, -0.8154442, 0, 0, 0, 1, 1,
-0.9006235, -0.5670063, -3.271397, 0, 0, 0, 1, 1,
-0.8963577, 0.2509573, -1.523557, 0, 0, 0, 1, 1,
-0.8828851, 0.9750186, -1.051513, 1, 1, 1, 1, 1,
-0.8818225, -1.312107, -0.7472202, 1, 1, 1, 1, 1,
-0.8800633, 1.084796, 0.5313095, 1, 1, 1, 1, 1,
-0.8714439, 0.3417341, -1.713422, 1, 1, 1, 1, 1,
-0.8656117, 0.2830969, -0.2113135, 1, 1, 1, 1, 1,
-0.8575547, -0.2557825, -1.751239, 1, 1, 1, 1, 1,
-0.8546352, 2.196476, -0.5509052, 1, 1, 1, 1, 1,
-0.8472672, -0.09580667, -0.5247533, 1, 1, 1, 1, 1,
-0.8455311, 0.9182717, -0.1393214, 1, 1, 1, 1, 1,
-0.8436345, 0.9616613, -0.0169352, 1, 1, 1, 1, 1,
-0.8426837, 0.4408983, -1.384347, 1, 1, 1, 1, 1,
-0.8414991, 0.3211086, 0.02216177, 1, 1, 1, 1, 1,
-0.8413432, -0.9445965, -2.617073, 1, 1, 1, 1, 1,
-0.8374841, -0.3724969, -1.495906, 1, 1, 1, 1, 1,
-0.8359893, 1.600167, 0.01694429, 1, 1, 1, 1, 1,
-0.8339498, -1.186783, -3.888995, 0, 0, 1, 1, 1,
-0.8317778, -0.04590711, -2.436879, 1, 0, 0, 1, 1,
-0.8311481, 0.01092612, -1.915949, 1, 0, 0, 1, 1,
-0.8311198, -1.067534, -3.685257, 1, 0, 0, 1, 1,
-0.8233493, -0.7251984, -2.083926, 1, 0, 0, 1, 1,
-0.8213131, 1.761124, 0.6633846, 1, 0, 0, 1, 1,
-0.820342, -0.4691437, -3.465716, 0, 0, 0, 1, 1,
-0.8195361, -0.0364055, -1.35505, 0, 0, 0, 1, 1,
-0.8160419, 2.517475, 1.323909, 0, 0, 0, 1, 1,
-0.8159655, -1.100528, -0.4150336, 0, 0, 0, 1, 1,
-0.8064483, -0.2987876, -2.268512, 0, 0, 0, 1, 1,
-0.8063702, 1.638018, -1.008736, 0, 0, 0, 1, 1,
-0.7966954, -0.08221751, -1.401299, 0, 0, 0, 1, 1,
-0.7896367, 1.256124, -0.4556129, 1, 1, 1, 1, 1,
-0.7729656, -0.2433271, -3.553966, 1, 1, 1, 1, 1,
-0.7716141, 0.6141761, -1.343635, 1, 1, 1, 1, 1,
-0.7696474, -1.195708, -2.278562, 1, 1, 1, 1, 1,
-0.7694688, 1.045008, -1.080905, 1, 1, 1, 1, 1,
-0.7685988, 1.379076, 0.7127494, 1, 1, 1, 1, 1,
-0.7647759, -0.5314021, -1.489735, 1, 1, 1, 1, 1,
-0.7619558, -0.1460168, -0.907723, 1, 1, 1, 1, 1,
-0.7609627, 0.004123874, -1.477035, 1, 1, 1, 1, 1,
-0.7608179, -2.09253, -3.008004, 1, 1, 1, 1, 1,
-0.7600961, 0.4874233, 1.014901, 1, 1, 1, 1, 1,
-0.7592099, 0.3375825, -1.123735, 1, 1, 1, 1, 1,
-0.7571256, -0.4406091, -0.5761961, 1, 1, 1, 1, 1,
-0.7552257, -0.6850764, -2.043695, 1, 1, 1, 1, 1,
-0.7536457, -1.016548, -2.989212, 1, 1, 1, 1, 1,
-0.7493047, 1.638614, -1.735407, 0, 0, 1, 1, 1,
-0.7473729, -1.105154, -4.023468, 1, 0, 0, 1, 1,
-0.7424222, -0.4438932, -1.408305, 1, 0, 0, 1, 1,
-0.7401942, -0.0717936, -0.7986669, 1, 0, 0, 1, 1,
-0.7399604, 1.442068, 0.5171698, 1, 0, 0, 1, 1,
-0.7356188, 0.3400027, -0.9131302, 1, 0, 0, 1, 1,
-0.7337674, -1.415176, -0.7761973, 0, 0, 0, 1, 1,
-0.7316729, 0.1945157, -1.013685, 0, 0, 0, 1, 1,
-0.7254165, -1.838541, -1.457805, 0, 0, 0, 1, 1,
-0.7223443, -1.108611, -2.55539, 0, 0, 0, 1, 1,
-0.7209283, 0.8991432, -1.448745, 0, 0, 0, 1, 1,
-0.7168945, 1.463775, -2.331781, 0, 0, 0, 1, 1,
-0.7156473, -1.684261, -3.239807, 0, 0, 0, 1, 1,
-0.7106962, 0.2902525, 0.2553353, 1, 1, 1, 1, 1,
-0.7049707, -2.384044, -2.239925, 1, 1, 1, 1, 1,
-0.7032458, 0.443368, -0.8976449, 1, 1, 1, 1, 1,
-0.6986451, 1.026659, -0.8057856, 1, 1, 1, 1, 1,
-0.6938834, -1.118911, -2.371391, 1, 1, 1, 1, 1,
-0.6910971, -0.2038611, -1.165594, 1, 1, 1, 1, 1,
-0.6902999, -0.7035001, -2.251637, 1, 1, 1, 1, 1,
-0.6898244, -1.880258, -4.078932, 1, 1, 1, 1, 1,
-0.6894203, -0.1559141, -3.655891, 1, 1, 1, 1, 1,
-0.6887187, -1.268767, -3.551181, 1, 1, 1, 1, 1,
-0.6832199, 0.1096063, -2.005605, 1, 1, 1, 1, 1,
-0.6783958, 1.52899, -0.9342155, 1, 1, 1, 1, 1,
-0.677497, 0.4835734, 0.3037835, 1, 1, 1, 1, 1,
-0.6716031, 0.6677307, -0.900174, 1, 1, 1, 1, 1,
-0.6610718, -0.09828355, -1.428563, 1, 1, 1, 1, 1,
-0.6591838, 0.6782274, -2.276894, 0, 0, 1, 1, 1,
-0.6551822, 0.2624202, -1.600344, 1, 0, 0, 1, 1,
-0.650097, -1.282193, -1.437485, 1, 0, 0, 1, 1,
-0.6481854, -0.8696905, -2.167731, 1, 0, 0, 1, 1,
-0.645725, -0.08829992, -0.6707755, 1, 0, 0, 1, 1,
-0.6443185, 2.190321, 0.1223331, 1, 0, 0, 1, 1,
-0.6341138, 0.2932722, -0.7779002, 0, 0, 0, 1, 1,
-0.6276044, -1.357997, -4.261718, 0, 0, 0, 1, 1,
-0.6274517, 0.157393, -1.943254, 0, 0, 0, 1, 1,
-0.612375, 0.7568773, -0.4158115, 0, 0, 0, 1, 1,
-0.597501, -0.7533947, -3.533804, 0, 0, 0, 1, 1,
-0.5902705, 2.752535, -0.8835889, 0, 0, 0, 1, 1,
-0.5869992, 1.886266, -0.4015029, 0, 0, 0, 1, 1,
-0.5848417, 0.3558966, -1.365599, 1, 1, 1, 1, 1,
-0.583546, 0.716849, 1.136235, 1, 1, 1, 1, 1,
-0.582341, 0.792365, -0.3700322, 1, 1, 1, 1, 1,
-0.5777768, 1.222931, 1.874922, 1, 1, 1, 1, 1,
-0.575566, 0.8738286, -1.785335, 1, 1, 1, 1, 1,
-0.5654535, 1.052379, -1.1096, 1, 1, 1, 1, 1,
-0.5652692, 0.4140676, -1.303445, 1, 1, 1, 1, 1,
-0.5629941, -0.1848994, -2.267631, 1, 1, 1, 1, 1,
-0.5621989, -0.4083814, -3.074849, 1, 1, 1, 1, 1,
-0.5582544, 0.3499814, -0.4718516, 1, 1, 1, 1, 1,
-0.5549344, 0.1877799, -2.334342, 1, 1, 1, 1, 1,
-0.5521349, -0.8951619, -1.553829, 1, 1, 1, 1, 1,
-0.5498444, 0.01186535, -0.1236681, 1, 1, 1, 1, 1,
-0.5424566, -0.475877, -3.217514, 1, 1, 1, 1, 1,
-0.5395194, -1.032003, -3.144936, 1, 1, 1, 1, 1,
-0.5386149, -0.9189966, -0.2290676, 0, 0, 1, 1, 1,
-0.5384245, 0.8991285, -1.006361, 1, 0, 0, 1, 1,
-0.5354324, -0.2655976, -1.502622, 1, 0, 0, 1, 1,
-0.5332865, 0.7274803, 0.08530787, 1, 0, 0, 1, 1,
-0.5305353, -0.2784564, -0.6938044, 1, 0, 0, 1, 1,
-0.5289387, 1.638253, -1.101902, 1, 0, 0, 1, 1,
-0.5252696, -0.1901084, 0.00295727, 0, 0, 0, 1, 1,
-0.5215549, -1.675524, -2.121314, 0, 0, 0, 1, 1,
-0.5176535, 0.1840667, -0.7912402, 0, 0, 0, 1, 1,
-0.516558, 0.02675027, 0.4993608, 0, 0, 0, 1, 1,
-0.5165425, -0.4769503, -1.874156, 0, 0, 0, 1, 1,
-0.5110478, -0.5071284, -3.38063, 0, 0, 0, 1, 1,
-0.5099207, -0.8542871, -1.91546, 0, 0, 0, 1, 1,
-0.5066386, 1.010501, -1.341317, 1, 1, 1, 1, 1,
-0.5045863, -0.1158562, -2.40691, 1, 1, 1, 1, 1,
-0.5045586, -0.1693902, -1.460152, 1, 1, 1, 1, 1,
-0.504093, -0.1176069, -3.322811, 1, 1, 1, 1, 1,
-0.5002044, 1.528475, -0.1489388, 1, 1, 1, 1, 1,
-0.4985401, -0.4964322, -0.08023595, 1, 1, 1, 1, 1,
-0.4914764, -0.2060346, -0.6246269, 1, 1, 1, 1, 1,
-0.4905142, 0.3370041, -0.6838613, 1, 1, 1, 1, 1,
-0.4883797, 0.2523303, -2.103462, 1, 1, 1, 1, 1,
-0.4868316, 0.2138016, -0.08252263, 1, 1, 1, 1, 1,
-0.4821703, 1.345056, -1.793546, 1, 1, 1, 1, 1,
-0.4799105, 0.2665597, -1.723229, 1, 1, 1, 1, 1,
-0.4788668, -0.5086002, -2.483669, 1, 1, 1, 1, 1,
-0.4783286, -0.2685514, -2.060994, 1, 1, 1, 1, 1,
-0.4746565, 0.2042683, -0.3795602, 1, 1, 1, 1, 1,
-0.4718537, 1.209698, 1.972406, 0, 0, 1, 1, 1,
-0.469769, 0.475156, 0.6800137, 1, 0, 0, 1, 1,
-0.4689959, -0.5032686, -0.4221778, 1, 0, 0, 1, 1,
-0.4683591, -0.6440664, -0.7163279, 1, 0, 0, 1, 1,
-0.4671493, -0.2084757, -3.34743, 1, 0, 0, 1, 1,
-0.4556072, -1.253835, -2.065043, 1, 0, 0, 1, 1,
-0.452851, -0.1432737, -1.578599, 0, 0, 0, 1, 1,
-0.449822, -1.53917, -2.982148, 0, 0, 0, 1, 1,
-0.4477119, 1.015689, -1.642146, 0, 0, 0, 1, 1,
-0.4438871, -0.767058, -3.52295, 0, 0, 0, 1, 1,
-0.4407988, -0.7527452, -3.327322, 0, 0, 0, 1, 1,
-0.4407585, 0.3104442, -1.489219, 0, 0, 0, 1, 1,
-0.4396518, 0.3142354, -1.701995, 0, 0, 0, 1, 1,
-0.4389391, 1.277706, -0.356225, 1, 1, 1, 1, 1,
-0.4357354, 0.5152845, -0.3554448, 1, 1, 1, 1, 1,
-0.4327824, 0.401426, -1.560112, 1, 1, 1, 1, 1,
-0.4312502, -1.757489, -2.503791, 1, 1, 1, 1, 1,
-0.4309252, 1.464177, -0.8385603, 1, 1, 1, 1, 1,
-0.4298097, -0.2749134, -1.634854, 1, 1, 1, 1, 1,
-0.4265893, 0.4109919, -1.691802, 1, 1, 1, 1, 1,
-0.4224698, 1.23217, 0.6606243, 1, 1, 1, 1, 1,
-0.415974, -1.10638, -4.210979, 1, 1, 1, 1, 1,
-0.4158704, 0.6410822, -0.1443436, 1, 1, 1, 1, 1,
-0.4143993, -1.151655, -3.748366, 1, 1, 1, 1, 1,
-0.4082434, -0.4580935, -2.669213, 1, 1, 1, 1, 1,
-0.4034217, -0.396131, -1.451618, 1, 1, 1, 1, 1,
-0.402449, -0.7241186, -2.100997, 1, 1, 1, 1, 1,
-0.397067, 0.4194794, -0.7717302, 1, 1, 1, 1, 1,
-0.3968273, 0.8441777, -0.4829307, 0, 0, 1, 1, 1,
-0.3955033, -1.31883, -3.36778, 1, 0, 0, 1, 1,
-0.3953464, 1.767758, -1.167512, 1, 0, 0, 1, 1,
-0.3908457, -0.02422895, -2.766975, 1, 0, 0, 1, 1,
-0.3859785, -0.9726386, -4.037348, 1, 0, 0, 1, 1,
-0.3803111, 0.6962524, -2.187492, 1, 0, 0, 1, 1,
-0.379591, -1.967267, -2.208424, 0, 0, 0, 1, 1,
-0.3736914, -1.94752, -3.988597, 0, 0, 0, 1, 1,
-0.3705484, -0.9142816, -3.066798, 0, 0, 0, 1, 1,
-0.3687768, 1.15333, -0.1904837, 0, 0, 0, 1, 1,
-0.3628893, -0.5373933, -3.722029, 0, 0, 0, 1, 1,
-0.3532655, -0.8209322, -2.711497, 0, 0, 0, 1, 1,
-0.3526084, 0.8907716, 0.5002371, 0, 0, 0, 1, 1,
-0.3490794, 0.2945626, 0.07319648, 1, 1, 1, 1, 1,
-0.3489155, 1.788741, -0.7649747, 1, 1, 1, 1, 1,
-0.348726, -1.069499, -3.87908, 1, 1, 1, 1, 1,
-0.3478894, 0.6754479, 0.4240104, 1, 1, 1, 1, 1,
-0.3426334, 2.165572, 2.21909, 1, 1, 1, 1, 1,
-0.3415703, 2.024027, 0.5770823, 1, 1, 1, 1, 1,
-0.3397865, -0.968608, -2.211131, 1, 1, 1, 1, 1,
-0.3329101, 0.4411612, -1.034622, 1, 1, 1, 1, 1,
-0.329529, 0.2896386, -0.3600055, 1, 1, 1, 1, 1,
-0.3257374, 0.4430051, -0.7434659, 1, 1, 1, 1, 1,
-0.3242207, -0.2921977, -1.825365, 1, 1, 1, 1, 1,
-0.3213246, -0.7896083, -3.172913, 1, 1, 1, 1, 1,
-0.3207931, 0.2104064, -1.298173, 1, 1, 1, 1, 1,
-0.3170329, 1.474316, -0.8800287, 1, 1, 1, 1, 1,
-0.3160141, -1.190503, -1.230378, 1, 1, 1, 1, 1,
-0.3157989, -0.1273707, -1.803442, 0, 0, 1, 1, 1,
-0.3137781, 0.413379, 1.115091, 1, 0, 0, 1, 1,
-0.3137727, -0.1881718, -2.791314, 1, 0, 0, 1, 1,
-0.3095587, 1.34236, -1.722851, 1, 0, 0, 1, 1,
-0.3089447, -0.6196765, -1.838361, 1, 0, 0, 1, 1,
-0.3054124, -0.240171, -2.558234, 1, 0, 0, 1, 1,
-0.3038406, -0.0868568, -0.2216416, 0, 0, 0, 1, 1,
-0.2989808, 0.1803841, -0.3063435, 0, 0, 0, 1, 1,
-0.2903332, -1.401292, -3.47993, 0, 0, 0, 1, 1,
-0.2901371, -0.9139959, -3.15398, 0, 0, 0, 1, 1,
-0.2873142, -0.232974, -2.376427, 0, 0, 0, 1, 1,
-0.2871066, -1.588003, -2.780706, 0, 0, 0, 1, 1,
-0.287056, 0.6271587, 0.3696215, 0, 0, 0, 1, 1,
-0.2857016, 0.8794775, -0.8488063, 1, 1, 1, 1, 1,
-0.2856256, 0.3145323, 1.253546, 1, 1, 1, 1, 1,
-0.2736184, -0.6336385, -4.740558, 1, 1, 1, 1, 1,
-0.2732311, -1.514568, -3.632663, 1, 1, 1, 1, 1,
-0.2730329, -0.1926344, -0.1367573, 1, 1, 1, 1, 1,
-0.2645229, -0.841239, -2.492228, 1, 1, 1, 1, 1,
-0.2629364, -0.2020629, -1.279998, 1, 1, 1, 1, 1,
-0.2620203, 0.8376602, -0.69922, 1, 1, 1, 1, 1,
-0.2611706, -0.9595301, -3.761215, 1, 1, 1, 1, 1,
-0.2596559, -1.871224, -2.359097, 1, 1, 1, 1, 1,
-0.2576734, -0.8229623, -4.215703, 1, 1, 1, 1, 1,
-0.2573846, -1.07846, -3.121671, 1, 1, 1, 1, 1,
-0.2564994, -1.622722, -2.618999, 1, 1, 1, 1, 1,
-0.2553765, 0.1867007, 0.1085993, 1, 1, 1, 1, 1,
-0.2502295, 0.9995109, 0.245763, 1, 1, 1, 1, 1,
-0.2319079, -0.8544685, -4.528581, 0, 0, 1, 1, 1,
-0.2308324, -1.615471, -5.710852, 1, 0, 0, 1, 1,
-0.228381, -0.4480729, -3.133995, 1, 0, 0, 1, 1,
-0.2274129, 0.002550498, -0.9297194, 1, 0, 0, 1, 1,
-0.226673, -0.2990879, -1.860214, 1, 0, 0, 1, 1,
-0.2261111, 1.037087, 0.2667664, 1, 0, 0, 1, 1,
-0.220194, -1.202739, -3.733033, 0, 0, 0, 1, 1,
-0.2155055, 1.013339, -0.2381017, 0, 0, 0, 1, 1,
-0.2129783, -0.03805026, -3.210165, 0, 0, 0, 1, 1,
-0.2090038, -2.285879, -3.335644, 0, 0, 0, 1, 1,
-0.2078326, 0.8974813, -0.6280856, 0, 0, 0, 1, 1,
-0.2013305, -0.1965502, -2.189069, 0, 0, 0, 1, 1,
-0.1989479, -1.546128, -4.33849, 0, 0, 0, 1, 1,
-0.1978494, -0.9113156, -2.836234, 1, 1, 1, 1, 1,
-0.197403, -0.1430201, -2.288566, 1, 1, 1, 1, 1,
-0.195683, -1.205314, -3.645767, 1, 1, 1, 1, 1,
-0.1948197, 0.3834243, 1.020037, 1, 1, 1, 1, 1,
-0.1935986, 0.4425667, -0.7677806, 1, 1, 1, 1, 1,
-0.1923845, 0.1024324, -1.874723, 1, 1, 1, 1, 1,
-0.1908802, 0.2650014, 0.5482859, 1, 1, 1, 1, 1,
-0.1885287, -1.309631, -2.363234, 1, 1, 1, 1, 1,
-0.1878061, 0.3744362, 0.06963928, 1, 1, 1, 1, 1,
-0.1863057, -0.5396848, -2.044955, 1, 1, 1, 1, 1,
-0.182926, -0.1061909, -1.714211, 1, 1, 1, 1, 1,
-0.1821445, -0.0741823, -3.521609, 1, 1, 1, 1, 1,
-0.176752, 0.9970387, -0.2011284, 1, 1, 1, 1, 1,
-0.1734679, 0.9662163, -1.203214, 1, 1, 1, 1, 1,
-0.1697633, -0.5535697, -3.716845, 1, 1, 1, 1, 1,
-0.1634831, -0.9210731, -3.819485, 0, 0, 1, 1, 1,
-0.1621982, -0.9080012, -3.209794, 1, 0, 0, 1, 1,
-0.1618977, 0.4763072, -0.2046584, 1, 0, 0, 1, 1,
-0.1595697, -0.5530627, -3.738067, 1, 0, 0, 1, 1,
-0.1592463, -0.5019346, -1.350266, 1, 0, 0, 1, 1,
-0.1588538, -0.8664514, -1.76951, 1, 0, 0, 1, 1,
-0.1569317, 0.887109, 0.2268071, 0, 0, 0, 1, 1,
-0.1539716, 0.2062467, 0.9886596, 0, 0, 0, 1, 1,
-0.1504621, -0.3405239, -2.775978, 0, 0, 0, 1, 1,
-0.1485129, 1.385622, 0.4659655, 0, 0, 0, 1, 1,
-0.1451858, -0.1386743, -2.749524, 0, 0, 0, 1, 1,
-0.1420637, -0.1346407, -3.688763, 0, 0, 0, 1, 1,
-0.1402243, -1.612374, -0.9535552, 0, 0, 0, 1, 1,
-0.1392548, 1.966376, 0.2296312, 1, 1, 1, 1, 1,
-0.1382898, 0.02573028, 0.7780042, 1, 1, 1, 1, 1,
-0.1343218, -0.1065874, -1.166858, 1, 1, 1, 1, 1,
-0.1316628, 0.1598798, 0.7517051, 1, 1, 1, 1, 1,
-0.1309801, 1.744426, 1.665896, 1, 1, 1, 1, 1,
-0.1295208, 0.4639212, -0.7757736, 1, 1, 1, 1, 1,
-0.1276658, 0.02003264, -1.634554, 1, 1, 1, 1, 1,
-0.1254714, 0.009120366, -1.15668, 1, 1, 1, 1, 1,
-0.1233081, 0.5260518, 0.2153019, 1, 1, 1, 1, 1,
-0.1175062, -0.4746229, -3.393347, 1, 1, 1, 1, 1,
-0.1124242, 0.962607, -0.9805427, 1, 1, 1, 1, 1,
-0.1108589, 0.01597708, -1.527127, 1, 1, 1, 1, 1,
-0.1076599, 2.242309, 1.003252, 1, 1, 1, 1, 1,
-0.1053421, 0.6300164, 0.7525767, 1, 1, 1, 1, 1,
-0.105064, -0.1351175, -1.30501, 1, 1, 1, 1, 1,
-0.1041678, -0.9001231, -3.761049, 0, 0, 1, 1, 1,
-0.09924756, -0.8337352, -2.695076, 1, 0, 0, 1, 1,
-0.0992148, -1.299846, -2.539935, 1, 0, 0, 1, 1,
-0.0977966, 0.5755765, 1.124377, 1, 0, 0, 1, 1,
-0.09646642, 0.3000402, -0.4736886, 1, 0, 0, 1, 1,
-0.09152668, -0.5451682, -3.742583, 1, 0, 0, 1, 1,
-0.08745092, -1.8606, -3.887775, 0, 0, 0, 1, 1,
-0.08727896, 1.124534, -0.8308897, 0, 0, 0, 1, 1,
-0.08233327, 0.06149626, -1.53946, 0, 0, 0, 1, 1,
-0.08147839, 0.3507572, -1.756148, 0, 0, 0, 1, 1,
-0.08114488, -0.3485403, -2.15882, 0, 0, 0, 1, 1,
-0.07742558, -1.046964, -2.831113, 0, 0, 0, 1, 1,
-0.07655279, 1.316692, 0.04132425, 0, 0, 0, 1, 1,
-0.05959838, 0.2149546, -0.401466, 1, 1, 1, 1, 1,
-0.05666893, 1.244248, 0.07631119, 1, 1, 1, 1, 1,
-0.05606087, -1.973829, -4.216215, 1, 1, 1, 1, 1,
-0.05511003, -0.1025242, -3.817213, 1, 1, 1, 1, 1,
-0.05352888, 1.204703, 1.421691, 1, 1, 1, 1, 1,
-0.05197452, 0.5721845, 0.04369863, 1, 1, 1, 1, 1,
-0.05182732, 0.762419, -0.8022357, 1, 1, 1, 1, 1,
-0.04542537, 0.6115968, 0.5711669, 1, 1, 1, 1, 1,
-0.04049012, 0.1614776, 2.069047, 1, 1, 1, 1, 1,
-0.03716952, 0.05657757, -2.116952, 1, 1, 1, 1, 1,
-0.03603422, -0.9145598, -3.912902, 1, 1, 1, 1, 1,
-0.0351899, -1.639927, -3.62112, 1, 1, 1, 1, 1,
-0.03489473, 0.8952777, 0.3570133, 1, 1, 1, 1, 1,
-0.03443391, 0.01814788, -2.002635, 1, 1, 1, 1, 1,
-0.03435253, 0.4191035, 0.7412981, 1, 1, 1, 1, 1,
-0.02623269, -0.7590548, -2.699691, 0, 0, 1, 1, 1,
-0.02443117, 2.22886, -0.91475, 1, 0, 0, 1, 1,
-0.02327606, -0.492205, -2.500038, 1, 0, 0, 1, 1,
-0.02216805, -1.859975, -2.796553, 1, 0, 0, 1, 1,
-0.01979245, 0.6560769, 0.2239372, 1, 0, 0, 1, 1,
-0.01909881, 0.09852254, -0.03988268, 1, 0, 0, 1, 1,
-0.01840665, -0.2157765, -2.955494, 0, 0, 0, 1, 1,
-0.01685937, 0.3653754, -1.236767, 0, 0, 0, 1, 1,
-0.01298809, -1.061213, -3.36622, 0, 0, 0, 1, 1,
-0.009533716, -0.2336645, -2.276592, 0, 0, 0, 1, 1,
-0.008920825, 0.1046881, -0.2493756, 0, 0, 0, 1, 1,
-0.004087166, 0.2194635, -1.157356, 0, 0, 0, 1, 1,
-0.0005765517, -0.7086606, -3.815513, 0, 0, 0, 1, 1,
-0.0005402794, -0.1816367, -3.876519, 1, 1, 1, 1, 1,
0.008874997, -1.07225, 3.276152, 1, 1, 1, 1, 1,
0.009537025, -0.9801178, 4.142897, 1, 1, 1, 1, 1,
0.01383432, -1.188591, 4.043274, 1, 1, 1, 1, 1,
0.01391521, 1.064421, 0.7301207, 1, 1, 1, 1, 1,
0.01700751, 0.08704, -1.114246, 1, 1, 1, 1, 1,
0.02095885, -0.8309298, 3.88796, 1, 1, 1, 1, 1,
0.02373811, 0.07983105, 1.275042, 1, 1, 1, 1, 1,
0.04029055, 1.065656, 0.53084, 1, 1, 1, 1, 1,
0.04069383, -0.09104978, 2.366688, 1, 1, 1, 1, 1,
0.04104056, 0.09256465, 0.6514444, 1, 1, 1, 1, 1,
0.04387347, -1.062681, 3.279891, 1, 1, 1, 1, 1,
0.04853308, 0.06252811, 0.2658588, 1, 1, 1, 1, 1,
0.04942488, 0.3795848, 1.43186, 1, 1, 1, 1, 1,
0.05003037, 1.162771, 0.7552176, 1, 1, 1, 1, 1,
0.05441696, -0.6577871, 3.528317, 0, 0, 1, 1, 1,
0.05470576, 1.475881, 0.7909983, 1, 0, 0, 1, 1,
0.05521305, 0.9390451, 0.2408851, 1, 0, 0, 1, 1,
0.05532759, -0.6345643, 3.149745, 1, 0, 0, 1, 1,
0.05674964, 0.3833969, 0.7608028, 1, 0, 0, 1, 1,
0.06139269, 0.1262143, 2.159754, 1, 0, 0, 1, 1,
0.06152623, 0.3527442, 1.377571, 0, 0, 0, 1, 1,
0.06507037, -0.8498527, 2.885333, 0, 0, 0, 1, 1,
0.06682216, 0.2459183, 0.4044393, 0, 0, 0, 1, 1,
0.07250031, -0.725975, 3.474079, 0, 0, 0, 1, 1,
0.0727263, 0.04814328, 0.9921685, 0, 0, 0, 1, 1,
0.07679593, -0.6070679, 2.99808, 0, 0, 0, 1, 1,
0.08021716, 1.035168, 1.335577, 0, 0, 0, 1, 1,
0.08157905, -2.188775, 3.689386, 1, 1, 1, 1, 1,
0.08878367, 0.3745312, -1.409911, 1, 1, 1, 1, 1,
0.09348985, 1.297723, 0.3696225, 1, 1, 1, 1, 1,
0.09432447, 0.1396373, 0.8935365, 1, 1, 1, 1, 1,
0.1018242, -0.2755895, 3.877161, 1, 1, 1, 1, 1,
0.1022542, 2.167584, -0.1307923, 1, 1, 1, 1, 1,
0.1089977, 0.1242072, 0.4109476, 1, 1, 1, 1, 1,
0.1148044, 1.231849, 1.200506, 1, 1, 1, 1, 1,
0.1164603, -1.043394, 1.792625, 1, 1, 1, 1, 1,
0.116631, -0.1446261, 3.783516, 1, 1, 1, 1, 1,
0.1167685, 1.228109, -0.5596199, 1, 1, 1, 1, 1,
0.1173359, 0.4282813, 0.8540139, 1, 1, 1, 1, 1,
0.117451, 0.364189, 1.206129, 1, 1, 1, 1, 1,
0.1185733, 0.1149719, 0.8958239, 1, 1, 1, 1, 1,
0.1196148, -0.3381548, 3.285052, 1, 1, 1, 1, 1,
0.1235184, -1.315572, 5.794312, 0, 0, 1, 1, 1,
0.1281045, -0.05838718, 1.880022, 1, 0, 0, 1, 1,
0.1317995, -0.1651877, 1.592762, 1, 0, 0, 1, 1,
0.1331553, 1.059263, -0.7941006, 1, 0, 0, 1, 1,
0.1334492, 1.230518, -0.4355369, 1, 0, 0, 1, 1,
0.133845, 0.1368892, 1.612399, 1, 0, 0, 1, 1,
0.134384, -0.5793017, 3.444067, 0, 0, 0, 1, 1,
0.1360201, -0.5328935, 3.412668, 0, 0, 0, 1, 1,
0.1360691, -0.4837818, 3.312717, 0, 0, 0, 1, 1,
0.1365137, -0.1139124, 3.170529, 0, 0, 0, 1, 1,
0.1409322, 1.54873, 0.4602258, 0, 0, 0, 1, 1,
0.1411748, 1.400422, 0.06822454, 0, 0, 0, 1, 1,
0.1417246, -1.246212, 2.353112, 0, 0, 0, 1, 1,
0.1482205, -0.5273057, 2.003518, 1, 1, 1, 1, 1,
0.1497103, 0.6225114, 3.0834, 1, 1, 1, 1, 1,
0.1510607, -0.1370898, 1.598742, 1, 1, 1, 1, 1,
0.1520327, 1.53946, -0.1481421, 1, 1, 1, 1, 1,
0.1551765, -0.4859463, 3.894202, 1, 1, 1, 1, 1,
0.1566817, -0.3296607, 2.276178, 1, 1, 1, 1, 1,
0.1596928, -0.5188323, 2.025265, 1, 1, 1, 1, 1,
0.1602576, -0.6244679, 3.518765, 1, 1, 1, 1, 1,
0.1702177, -0.7871879, 1.982162, 1, 1, 1, 1, 1,
0.1717581, -0.05615117, 2.657088, 1, 1, 1, 1, 1,
0.1719662, 3.136075, -0.5296736, 1, 1, 1, 1, 1,
0.1737408, -0.1476163, 2.970817, 1, 1, 1, 1, 1,
0.1749939, -0.112839, 1.734259, 1, 1, 1, 1, 1,
0.176825, 0.7918811, 1.157636, 1, 1, 1, 1, 1,
0.1773757, -1.210529, 3.529016, 1, 1, 1, 1, 1,
0.1896986, 0.3518719, 1.757081, 0, 0, 1, 1, 1,
0.1918117, 0.8577856, -1.165861, 1, 0, 0, 1, 1,
0.1946448, 1.310023, 0.9108731, 1, 0, 0, 1, 1,
0.1995915, 1.501868, 0.3190381, 1, 0, 0, 1, 1,
0.2009707, 0.1720641, 0.4823259, 1, 0, 0, 1, 1,
0.2042397, 0.7534073, 1.049224, 1, 0, 0, 1, 1,
0.2070443, -0.974721, 2.737855, 0, 0, 0, 1, 1,
0.2088928, -0.3559225, 2.910352, 0, 0, 0, 1, 1,
0.2090317, -0.4738152, 2.189017, 0, 0, 0, 1, 1,
0.2131396, 0.6589938, 1.131492, 0, 0, 0, 1, 1,
0.2141275, 1.13099, -0.4459549, 0, 0, 0, 1, 1,
0.2155214, -0.5210955, 2.229075, 0, 0, 0, 1, 1,
0.21839, 0.5540418, 0.8407283, 0, 0, 0, 1, 1,
0.2218682, -1.007847, 1.069556, 1, 1, 1, 1, 1,
0.2234102, 1.011461, -1.048574, 1, 1, 1, 1, 1,
0.2247844, 0.9434891, -0.7575234, 1, 1, 1, 1, 1,
0.2252623, 1.04992, 1.288987, 1, 1, 1, 1, 1,
0.2257504, -0.3598677, 0.8721047, 1, 1, 1, 1, 1,
0.2274068, 1.424382, 1.487821, 1, 1, 1, 1, 1,
0.233237, -0.1321879, 3.080508, 1, 1, 1, 1, 1,
0.2336345, -1.359297, 1.476447, 1, 1, 1, 1, 1,
0.2422913, 0.07121705, 1.712847, 1, 1, 1, 1, 1,
0.244129, 0.8508274, 0.6916667, 1, 1, 1, 1, 1,
0.2445943, 0.03826921, 1.553046, 1, 1, 1, 1, 1,
0.247572, -0.1274222, 1.892534, 1, 1, 1, 1, 1,
0.2492626, 0.580043, -0.4000543, 1, 1, 1, 1, 1,
0.2529035, -0.2172533, 0.3203738, 1, 1, 1, 1, 1,
0.2530439, 1.689696, -1.20199, 1, 1, 1, 1, 1,
0.253088, -3.03728, 4.087725, 0, 0, 1, 1, 1,
0.2540147, -0.5617358, 3.507348, 1, 0, 0, 1, 1,
0.2598044, -1.134193, 2.924499, 1, 0, 0, 1, 1,
0.2637034, 2.264662, 0.4534653, 1, 0, 0, 1, 1,
0.2672435, 0.2883559, 1.038708, 1, 0, 0, 1, 1,
0.2721311, -0.5755988, 1.856382, 1, 0, 0, 1, 1,
0.2764553, 1.333956, -0.1610809, 0, 0, 0, 1, 1,
0.276802, 2.306223, 0.2867781, 0, 0, 0, 1, 1,
0.2806781, -1.32292, 2.816875, 0, 0, 0, 1, 1,
0.2818438, -0.7137988, 2.360387, 0, 0, 0, 1, 1,
0.2863858, 1.330279, -1.387326, 0, 0, 0, 1, 1,
0.2928731, 1.808869, 0.2364604, 0, 0, 0, 1, 1,
0.2933447, -1.032745, 2.436335, 0, 0, 0, 1, 1,
0.2975112, -1.269893, 2.1525, 1, 1, 1, 1, 1,
0.2982222, 2.329831, 0.7245981, 1, 1, 1, 1, 1,
0.3055929, -0.7461771, 2.231461, 1, 1, 1, 1, 1,
0.3091949, -2.579085, 3.197943, 1, 1, 1, 1, 1,
0.3107893, -0.9636714, 3.638457, 1, 1, 1, 1, 1,
0.312792, -1.020692, 2.068456, 1, 1, 1, 1, 1,
0.3151183, -0.8624857, 1.552878, 1, 1, 1, 1, 1,
0.3178151, 0.3445356, 1.550397, 1, 1, 1, 1, 1,
0.3198071, 0.5376462, -0.1114422, 1, 1, 1, 1, 1,
0.3263339, -0.7439231, 2.971004, 1, 1, 1, 1, 1,
0.3273416, 0.589725, 1.364218, 1, 1, 1, 1, 1,
0.3288033, 1.210219, 0.451914, 1, 1, 1, 1, 1,
0.3317862, 1.07018, 2.258893, 1, 1, 1, 1, 1,
0.3321144, -1.112958, 4.819371, 1, 1, 1, 1, 1,
0.3369429, 1.022832, -0.2513156, 1, 1, 1, 1, 1,
0.3456437, -1.781501, 3.387879, 0, 0, 1, 1, 1,
0.3459146, 0.6809717, 1.995672, 1, 0, 0, 1, 1,
0.3518007, -1.756817, 3.329705, 1, 0, 0, 1, 1,
0.3523598, 1.481666, -0.1217481, 1, 0, 0, 1, 1,
0.353402, -1.653129, 4.598961, 1, 0, 0, 1, 1,
0.3626663, -3.181831, 2.217193, 1, 0, 0, 1, 1,
0.3626818, 1.566715, -0.8195426, 0, 0, 0, 1, 1,
0.3664267, 0.6675131, -0.02573003, 0, 0, 0, 1, 1,
0.367325, -0.9723459, 3.474017, 0, 0, 0, 1, 1,
0.3745875, -0.3606129, 3.476161, 0, 0, 0, 1, 1,
0.3753486, 0.5797614, 1.018809, 0, 0, 0, 1, 1,
0.3755237, 2.805774, 0.07126048, 0, 0, 0, 1, 1,
0.3767588, 1.136777, 0.4942277, 0, 0, 0, 1, 1,
0.3861344, 0.2927787, 1.200716, 1, 1, 1, 1, 1,
0.3915422, -0.1844018, 1.797108, 1, 1, 1, 1, 1,
0.393084, -1.349765, 1.864385, 1, 1, 1, 1, 1,
0.3974682, 1.793132, 0.2186189, 1, 1, 1, 1, 1,
0.4013534, 0.626936, -0.2800776, 1, 1, 1, 1, 1,
0.4013667, 2.106323, -0.06360769, 1, 1, 1, 1, 1,
0.4033253, -0.7701119, 4.099687, 1, 1, 1, 1, 1,
0.4034614, -0.6715179, 2.602779, 1, 1, 1, 1, 1,
0.4074889, 0.9447398, 1.39329, 1, 1, 1, 1, 1,
0.4097358, 0.3989049, 0.7921398, 1, 1, 1, 1, 1,
0.4102709, 1.615257, -2.073941, 1, 1, 1, 1, 1,
0.4205996, -1.711153, 4.210384, 1, 1, 1, 1, 1,
0.4211565, -1.657665, 2.604472, 1, 1, 1, 1, 1,
0.423407, 1.415353, 0.01970326, 1, 1, 1, 1, 1,
0.4238637, -0.4825394, 1.369275, 1, 1, 1, 1, 1,
0.4242004, 1.538682, 0.4035031, 0, 0, 1, 1, 1,
0.4260992, 0.8738226, 1.079769, 1, 0, 0, 1, 1,
0.426291, -0.01855521, 1.427054, 1, 0, 0, 1, 1,
0.4309611, 1.168801, -0.8940921, 1, 0, 0, 1, 1,
0.4317655, 0.3318098, 3.146606, 1, 0, 0, 1, 1,
0.4319816, 1.297853, -0.7696653, 1, 0, 0, 1, 1,
0.4378518, 0.4617448, -0.6415522, 0, 0, 0, 1, 1,
0.4413998, 1.529989, -0.4928345, 0, 0, 0, 1, 1,
0.4449193, 1.098874, 1.667733, 0, 0, 0, 1, 1,
0.4522549, -1.106907, 2.699747, 0, 0, 0, 1, 1,
0.4536791, -1.27169, 1.791691, 0, 0, 0, 1, 1,
0.4555179, 1.964373, 0.4937451, 0, 0, 0, 1, 1,
0.457639, 1.336214, -1.216458, 0, 0, 0, 1, 1,
0.4601126, -0.4966357, 3.047217, 1, 1, 1, 1, 1,
0.4606276, 1.255935, -0.9431559, 1, 1, 1, 1, 1,
0.4678482, 1.307676, 1.910748, 1, 1, 1, 1, 1,
0.4694436, -0.9041312, 4.049241, 1, 1, 1, 1, 1,
0.4731129, 1.475267, 1.994322, 1, 1, 1, 1, 1,
0.4761898, -1.913685, 3.093588, 1, 1, 1, 1, 1,
0.4765321, -0.5920679, 3.873689, 1, 1, 1, 1, 1,
0.4769406, -0.8808869, 2.521024, 1, 1, 1, 1, 1,
0.483426, -0.2037524, 0.9674473, 1, 1, 1, 1, 1,
0.4889675, 0.3191664, 0.6693646, 1, 1, 1, 1, 1,
0.4913654, -0.7911569, 4.277258, 1, 1, 1, 1, 1,
0.4940695, -0.6328641, 3.238827, 1, 1, 1, 1, 1,
0.4955585, -1.255375, 2.991777, 1, 1, 1, 1, 1,
0.4964756, -1.531174, 1.964199, 1, 1, 1, 1, 1,
0.4965962, -0.8007087, 2.495776, 1, 1, 1, 1, 1,
0.496767, -0.6331113, 3.126133, 0, 0, 1, 1, 1,
0.5003657, 0.2441267, 1.86165, 1, 0, 0, 1, 1,
0.5081034, 0.8349226, -0.5605976, 1, 0, 0, 1, 1,
0.5089436, -0.3946238, 3.22735, 1, 0, 0, 1, 1,
0.5145721, 0.3913261, 2.4696, 1, 0, 0, 1, 1,
0.5160144, -1.258479, 0.06741224, 1, 0, 0, 1, 1,
0.5175945, 0.53677, 0.05841282, 0, 0, 0, 1, 1,
0.5193799, -0.9258724, 2.782159, 0, 0, 0, 1, 1,
0.520346, -0.9582357, 2.828126, 0, 0, 0, 1, 1,
0.5212016, 0.4948539, -0.6612294, 0, 0, 0, 1, 1,
0.5259142, 0.9659967, 0.6544852, 0, 0, 0, 1, 1,
0.5265041, -0.883374, 2.268179, 0, 0, 0, 1, 1,
0.5281366, -0.9057092, 2.638285, 0, 0, 0, 1, 1,
0.5281476, -0.7454059, 2.583818, 1, 1, 1, 1, 1,
0.5339171, 1.443301, 1.071498, 1, 1, 1, 1, 1,
0.5380283, 0.7213902, 0.3362162, 1, 1, 1, 1, 1,
0.5413454, 0.8342728, -2.584414, 1, 1, 1, 1, 1,
0.5469017, -0.6550418, 3.374706, 1, 1, 1, 1, 1,
0.5502142, 1.117235, -1.499915, 1, 1, 1, 1, 1,
0.5508564, -0.5436753, 3.021636, 1, 1, 1, 1, 1,
0.5525561, 0.5221854, 0.9690977, 1, 1, 1, 1, 1,
0.5544136, 0.6724682, 1.062271, 1, 1, 1, 1, 1,
0.5554141, -0.07204846, 2.661341, 1, 1, 1, 1, 1,
0.5756899, 0.3341889, 2.39404, 1, 1, 1, 1, 1,
0.5775257, 0.5236062, 1.153014, 1, 1, 1, 1, 1,
0.5792422, -1.231036, 1.723824, 1, 1, 1, 1, 1,
0.5807813, -0.2859181, 1.811757, 1, 1, 1, 1, 1,
0.5811974, 0.7069961, -0.3714672, 1, 1, 1, 1, 1,
0.5850335, -1.223755, 3.7617, 0, 0, 1, 1, 1,
0.58648, 0.3613442, 1.61411, 1, 0, 0, 1, 1,
0.5908055, -0.6334857, 1.723038, 1, 0, 0, 1, 1,
0.5932091, 0.5836793, 0.7869996, 1, 0, 0, 1, 1,
0.5978101, 0.2332686, 2.489622, 1, 0, 0, 1, 1,
0.5982413, 1.806832, -0.5972106, 1, 0, 0, 1, 1,
0.5983152, -0.1272147, 1.991271, 0, 0, 0, 1, 1,
0.5988714, 0.831551, 0.5111984, 0, 0, 0, 1, 1,
0.5992368, -0.5356653, 1.57329, 0, 0, 0, 1, 1,
0.6064728, 0.06129083, 1.632213, 0, 0, 0, 1, 1,
0.6068977, -0.2439927, 1.092461, 0, 0, 0, 1, 1,
0.6082214, -2.85381, 1.437836, 0, 0, 0, 1, 1,
0.6117542, -2.416285, 3.889168, 0, 0, 0, 1, 1,
0.6130894, -0.529716, 3.297974, 1, 1, 1, 1, 1,
0.6138473, -0.422832, 1.956176, 1, 1, 1, 1, 1,
0.6139784, 0.09127654, 2.828983, 1, 1, 1, 1, 1,
0.6143926, 0.2496507, 2.852551, 1, 1, 1, 1, 1,
0.6147113, -0.3887692, 0.7695995, 1, 1, 1, 1, 1,
0.6158465, 0.03975979, 2.240858, 1, 1, 1, 1, 1,
0.6207686, -1.612136, 2.960564, 1, 1, 1, 1, 1,
0.6222344, 0.491944, 0.5822793, 1, 1, 1, 1, 1,
0.6225684, 0.3193685, 0.8064771, 1, 1, 1, 1, 1,
0.6263297, 0.9508118, 1.692452, 1, 1, 1, 1, 1,
0.6272836, 0.4205435, 1.413912, 1, 1, 1, 1, 1,
0.6282126, 0.2812998, 0.01535615, 1, 1, 1, 1, 1,
0.6366069, -0.1720894, 2.270045, 1, 1, 1, 1, 1,
0.6368322, 1.70006, -1.839644, 1, 1, 1, 1, 1,
0.6374249, 1.017892, 0.9873144, 1, 1, 1, 1, 1,
0.6376003, -0.1341629, -0.511258, 0, 0, 1, 1, 1,
0.6389886, -1.206241, 2.479889, 1, 0, 0, 1, 1,
0.6428584, 0.5437163, -0.06116877, 1, 0, 0, 1, 1,
0.6461843, -0.9711296, 3.318441, 1, 0, 0, 1, 1,
0.6508656, -0.04677827, 0.7692037, 1, 0, 0, 1, 1,
0.6529335, -0.8082387, 3.576874, 1, 0, 0, 1, 1,
0.6576611, -0.7004214, 1.402499, 0, 0, 0, 1, 1,
0.6635476, -0.1614657, 1.710941, 0, 0, 0, 1, 1,
0.6643752, -0.8817847, 1.978791, 0, 0, 0, 1, 1,
0.6692013, 0.04487455, 2.233189, 0, 0, 0, 1, 1,
0.6703122, 0.4389115, 1.298531, 0, 0, 0, 1, 1,
0.6720521, 1.908672, -0.1563467, 0, 0, 0, 1, 1,
0.6741208, 0.3387174, -0.02339525, 0, 0, 0, 1, 1,
0.6762503, -0.6564252, 0.9742208, 1, 1, 1, 1, 1,
0.6806667, 0.7176201, 0.4106983, 1, 1, 1, 1, 1,
0.6917947, 1.239497, -0.4111596, 1, 1, 1, 1, 1,
0.6936467, -1.154158, 2.083169, 1, 1, 1, 1, 1,
0.6965735, 0.4000846, 2.275832, 1, 1, 1, 1, 1,
0.6994585, 0.1507811, 2.16664, 1, 1, 1, 1, 1,
0.7073197, -1.635907, 3.707806, 1, 1, 1, 1, 1,
0.708893, -1.339691, 1.34508, 1, 1, 1, 1, 1,
0.7158144, 0.5694249, 0.8055422, 1, 1, 1, 1, 1,
0.7158753, 0.1844929, 0.2899853, 1, 1, 1, 1, 1,
0.716319, -1.110315, 3.090807, 1, 1, 1, 1, 1,
0.7164329, -0.6961635, 0.4381261, 1, 1, 1, 1, 1,
0.7164783, 0.6062225, 0.6337191, 1, 1, 1, 1, 1,
0.720785, -0.8527266, 0.5899518, 1, 1, 1, 1, 1,
0.7234619, 0.6803232, 0.2142899, 1, 1, 1, 1, 1,
0.7241974, -0.1575109, 1.508243, 0, 0, 1, 1, 1,
0.7281486, 0.07683174, 1.655876, 1, 0, 0, 1, 1,
0.7285556, -1.122727, 3.213496, 1, 0, 0, 1, 1,
0.7314943, -0.1452778, 1.101088, 1, 0, 0, 1, 1,
0.7316696, -0.8674982, 2.774993, 1, 0, 0, 1, 1,
0.7333241, 0.7458584, 1.78276, 1, 0, 0, 1, 1,
0.7346039, 0.6115537, 0.4499987, 0, 0, 0, 1, 1,
0.7351116, 0.9124359, 1.131446, 0, 0, 0, 1, 1,
0.7368734, 1.035725, 0.7966827, 0, 0, 0, 1, 1,
0.7413142, -0.8213783, 2.627816, 0, 0, 0, 1, 1,
0.7449144, 0.7061079, -1.424316, 0, 0, 0, 1, 1,
0.7450287, 0.4835369, 0.2725483, 0, 0, 0, 1, 1,
0.7491417, -2.152167, 2.398526, 0, 0, 0, 1, 1,
0.7576512, -0.7909874, 2.962889, 1, 1, 1, 1, 1,
0.7577933, -1.185523, 1.629376, 1, 1, 1, 1, 1,
0.7620144, -0.2242835, 3.253287, 1, 1, 1, 1, 1,
0.7641818, 0.802606, 1.024113, 1, 1, 1, 1, 1,
0.7765036, -0.5988372, 0.2040785, 1, 1, 1, 1, 1,
0.782272, -0.7459045, 1.651477, 1, 1, 1, 1, 1,
0.7823892, -0.6161911, 1.819625, 1, 1, 1, 1, 1,
0.7854097, -0.1446107, 2.024917, 1, 1, 1, 1, 1,
0.7882394, -0.4756829, 1.962076, 1, 1, 1, 1, 1,
0.7958495, 1.14367, 1.793621, 1, 1, 1, 1, 1,
0.7975996, -0.1848922, 1.152458, 1, 1, 1, 1, 1,
0.7990873, 0.5505657, 0.2097284, 1, 1, 1, 1, 1,
0.8032162, -0.2521504, 0.8933538, 1, 1, 1, 1, 1,
0.806833, -1.6966, 1.557334, 1, 1, 1, 1, 1,
0.8161755, -0.4349357, 1.657501, 1, 1, 1, 1, 1,
0.8193709, -0.8288596, 0.9685925, 0, 0, 1, 1, 1,
0.8252093, -2.397068, 1.809954, 1, 0, 0, 1, 1,
0.8307738, 1.916299, -0.8323464, 1, 0, 0, 1, 1,
0.8310922, 0.433782, 1.347055, 1, 0, 0, 1, 1,
0.8345322, -0.8321514, 3.475778, 1, 0, 0, 1, 1,
0.8367264, 0.2125606, 0.2346519, 1, 0, 0, 1, 1,
0.8387236, -1.203962, 1.68004, 0, 0, 0, 1, 1,
0.840875, 1.651954, 1.121913, 0, 0, 0, 1, 1,
0.8506178, -1.705514, 1.955324, 0, 0, 0, 1, 1,
0.8526155, -1.439968, 3.160944, 0, 0, 0, 1, 1,
0.85276, 0.5753821, 2.46795, 0, 0, 0, 1, 1,
0.8528428, -0.05106679, 1.844652, 0, 0, 0, 1, 1,
0.8564355, -0.9068389, 2.290385, 0, 0, 0, 1, 1,
0.8578351, 0.1821743, 2.066624, 1, 1, 1, 1, 1,
0.8593698, 0.5032937, -1.512742, 1, 1, 1, 1, 1,
0.8635719, 1.073774, 1.577264, 1, 1, 1, 1, 1,
0.8690131, -0.3809418, 1.941133, 1, 1, 1, 1, 1,
0.8701736, -0.6335236, 1.919208, 1, 1, 1, 1, 1,
0.8708361, 0.7137348, 2.917332, 1, 1, 1, 1, 1,
0.8783239, 1.997769, 0.6600979, 1, 1, 1, 1, 1,
0.8785878, 0.6625707, -0.375419, 1, 1, 1, 1, 1,
0.8794991, 1.517024, -0.9207285, 1, 1, 1, 1, 1,
0.8857824, -0.1209865, 0.766193, 1, 1, 1, 1, 1,
0.8864817, 0.4105616, 1.304727, 1, 1, 1, 1, 1,
0.8926712, -0.3681737, 1.594309, 1, 1, 1, 1, 1,
0.8944614, -0.04717699, 0.9929327, 1, 1, 1, 1, 1,
0.9076055, -0.6913873, 2.453572, 1, 1, 1, 1, 1,
0.9078842, -1.11601, 1.981619, 1, 1, 1, 1, 1,
0.9085048, -1.187373, 1.518844, 0, 0, 1, 1, 1,
0.9089136, -0.240508, 0.9443633, 1, 0, 0, 1, 1,
0.9118137, -1.331862, 3.140976, 1, 0, 0, 1, 1,
0.9252629, -0.5882496, 2.961738, 1, 0, 0, 1, 1,
0.9303058, -0.8282378, 3.611014, 1, 0, 0, 1, 1,
0.930939, -0.04405516, 2.319236, 1, 0, 0, 1, 1,
0.9375517, -0.3195499, 1.520386, 0, 0, 0, 1, 1,
0.937668, -0.7381237, 2.737975, 0, 0, 0, 1, 1,
0.9445332, 0.3319418, 1.791502, 0, 0, 0, 1, 1,
0.9485831, -1.456295, 0.4943404, 0, 0, 0, 1, 1,
0.9541897, -0.5551666, 1.662138, 0, 0, 0, 1, 1,
0.9548873, 1.054658, 0.9538896, 0, 0, 0, 1, 1,
0.962629, -0.8414567, 3.979172, 0, 0, 0, 1, 1,
0.9628957, -0.3326577, 1.070466, 1, 1, 1, 1, 1,
0.9645447, -0.02597469, 1.604793, 1, 1, 1, 1, 1,
0.9699147, -0.552507, 1.59717, 1, 1, 1, 1, 1,
0.9851696, 0.1532216, 0.9965654, 1, 1, 1, 1, 1,
0.9934695, -1.392119, 2.574145, 1, 1, 1, 1, 1,
0.9946587, 0.1750929, 1.292778, 1, 1, 1, 1, 1,
0.9963563, 0.3270527, 0.6272694, 1, 1, 1, 1, 1,
0.9986395, -1.359387, 2.889858, 1, 1, 1, 1, 1,
1.014543, 0.3680403, 1.685917, 1, 1, 1, 1, 1,
1.019835, 0.2873645, -1.030922, 1, 1, 1, 1, 1,
1.024344, 1.533305, 1.127811, 1, 1, 1, 1, 1,
1.025675, 0.7881601, 0.211444, 1, 1, 1, 1, 1,
1.026438, -0.084746, 3.094531, 1, 1, 1, 1, 1,
1.031025, 1.466663, 2.427472, 1, 1, 1, 1, 1,
1.036838, -0.7020804, 0.1295249, 1, 1, 1, 1, 1,
1.044201, -0.6822902, 2.484066, 0, 0, 1, 1, 1,
1.054334, -0.5296499, 1.285095, 1, 0, 0, 1, 1,
1.061391, 0.1507676, 2.552349, 1, 0, 0, 1, 1,
1.063042, 0.1452179, 1.416366, 1, 0, 0, 1, 1,
1.065516, 0.3905706, 1.073216, 1, 0, 0, 1, 1,
1.066067, 0.7730882, 1.50457, 1, 0, 0, 1, 1,
1.067897, -1.787324, 0.1191105, 0, 0, 0, 1, 1,
1.069649, -1.293974, 1.426917, 0, 0, 0, 1, 1,
1.071498, 0.2192863, 0.3600693, 0, 0, 0, 1, 1,
1.084243, 1.031715, -0.05123604, 0, 0, 0, 1, 1,
1.087627, 2.190792, -0.3390151, 0, 0, 0, 1, 1,
1.088561, 1.401639, -0.7472379, 0, 0, 0, 1, 1,
1.103446, 0.06588621, 1.575587, 0, 0, 0, 1, 1,
1.104126, 0.2267667, 2.417083, 1, 1, 1, 1, 1,
1.104322, 0.3226745, -0.1760696, 1, 1, 1, 1, 1,
1.106054, -0.9718653, 3.722147, 1, 1, 1, 1, 1,
1.112378, 0.841177, 1.551764, 1, 1, 1, 1, 1,
1.117676, -0.5585628, 3.112655, 1, 1, 1, 1, 1,
1.121523, -1.325107, 2.397484, 1, 1, 1, 1, 1,
1.122151, 0.6152424, 1.203731, 1, 1, 1, 1, 1,
1.122278, -0.2596638, 1.30308, 1, 1, 1, 1, 1,
1.123209, 1.205338, 2.202511, 1, 1, 1, 1, 1,
1.125815, -0.3634961, 0.5505177, 1, 1, 1, 1, 1,
1.126919, 1.148858, 0.5084361, 1, 1, 1, 1, 1,
1.127977, 0.407262, 1.081888, 1, 1, 1, 1, 1,
1.136111, -1.234246, 2.876212, 1, 1, 1, 1, 1,
1.139699, -1.069018, 2.301473, 1, 1, 1, 1, 1,
1.14246, 0.3703403, -0.2046832, 1, 1, 1, 1, 1,
1.143247, -0.07862107, 0.8595305, 0, 0, 1, 1, 1,
1.143708, 1.808361, 1.982943, 1, 0, 0, 1, 1,
1.157004, 1.436298, -0.5372229, 1, 0, 0, 1, 1,
1.169208, -0.7903885, 3.179247, 1, 0, 0, 1, 1,
1.175385, -2.289161, 2.169447, 1, 0, 0, 1, 1,
1.182324, -0.6193738, 0.6869503, 1, 0, 0, 1, 1,
1.18382, -1.6972, 0.8229544, 0, 0, 0, 1, 1,
1.186956, 0.9515166, -0.4830608, 0, 0, 0, 1, 1,
1.187028, -1.438947, 2.219912, 0, 0, 0, 1, 1,
1.187661, -0.2040435, 3.633596, 0, 0, 0, 1, 1,
1.195537, 0.09565367, 0.7766386, 0, 0, 0, 1, 1,
1.195888, 1.649307, 2.312249, 0, 0, 0, 1, 1,
1.202672, 1.927127, -0.6846057, 0, 0, 0, 1, 1,
1.207471, -0.7949139, 2.406218, 1, 1, 1, 1, 1,
1.213185, -0.3219736, 2.572784, 1, 1, 1, 1, 1,
1.21795, -0.986919, 2.143173, 1, 1, 1, 1, 1,
1.220515, 0.4950521, 3.179599, 1, 1, 1, 1, 1,
1.227598, 1.099511, -0.1640479, 1, 1, 1, 1, 1,
1.228727, -0.2342067, 2.217311, 1, 1, 1, 1, 1,
1.236027, -0.7642915, 2.365456, 1, 1, 1, 1, 1,
1.254773, 1.346936, 0.7441416, 1, 1, 1, 1, 1,
1.257826, -0.01942379, 2.110767, 1, 1, 1, 1, 1,
1.260073, -0.2404652, 2.605296, 1, 1, 1, 1, 1,
1.262021, 0.03274431, 2.272797, 1, 1, 1, 1, 1,
1.264799, 1.063716, -0.7622669, 1, 1, 1, 1, 1,
1.274171, -1.326057, 2.015797, 1, 1, 1, 1, 1,
1.28405, -0.7967744, 1.786502, 1, 1, 1, 1, 1,
1.288483, 0.7998414, 1.987297, 1, 1, 1, 1, 1,
1.289742, -0.3177341, 1.344849, 0, 0, 1, 1, 1,
1.292027, -2.149819, 3.634881, 1, 0, 0, 1, 1,
1.293616, 0.1575966, 1.499383, 1, 0, 0, 1, 1,
1.294383, -0.4309105, 3.540426, 1, 0, 0, 1, 1,
1.300586, 0.4614005, 2.161869, 1, 0, 0, 1, 1,
1.30367, 0.9494107, 2.508559, 1, 0, 0, 1, 1,
1.31192, 0.4781067, -1.272686, 0, 0, 0, 1, 1,
1.312251, -1.011605, 2.02036, 0, 0, 0, 1, 1,
1.313913, 0.05084408, 1.19007, 0, 0, 0, 1, 1,
1.319907, -0.5894227, 2.369132, 0, 0, 0, 1, 1,
1.341602, 0.3283712, 0.2649537, 0, 0, 0, 1, 1,
1.349012, -0.9495341, 1.601437, 0, 0, 0, 1, 1,
1.351075, 1.051805, 1.063081, 0, 0, 0, 1, 1,
1.353978, 2.073436, 1.747116, 1, 1, 1, 1, 1,
1.357959, -0.3420442, 0.8271186, 1, 1, 1, 1, 1,
1.359639, -0.602185, 2.045125, 1, 1, 1, 1, 1,
1.359747, -0.7075459, 3.41557, 1, 1, 1, 1, 1,
1.36246, -0.1474496, 1.737309, 1, 1, 1, 1, 1,
1.363678, -0.2315346, 3.098452, 1, 1, 1, 1, 1,
1.368439, 0.8926895, -0.1259859, 1, 1, 1, 1, 1,
1.370357, -0.4710441, 2.587581, 1, 1, 1, 1, 1,
1.372285, 0.4399542, 2.063531, 1, 1, 1, 1, 1,
1.377855, -0.8680277, 3.700475, 1, 1, 1, 1, 1,
1.402609, 0.1682074, 2.137589, 1, 1, 1, 1, 1,
1.402811, 0.6488076, -1.167419, 1, 1, 1, 1, 1,
1.408822, 0.1293677, 0.6264316, 1, 1, 1, 1, 1,
1.422169, 1.409199, 0.1057784, 1, 1, 1, 1, 1,
1.424126, 0.6656361, -1.212188, 1, 1, 1, 1, 1,
1.438539, -1.119673, 2.614246, 0, 0, 1, 1, 1,
1.439735, 0.7801273, 2.099103, 1, 0, 0, 1, 1,
1.44422, -0.3004921, 4.058062, 1, 0, 0, 1, 1,
1.457346, 1.422325, 1.316914, 1, 0, 0, 1, 1,
1.45864, 0.7985712, 2.867988, 1, 0, 0, 1, 1,
1.464772, -2.212015, 2.168504, 1, 0, 0, 1, 1,
1.469271, -1.77737, 2.418635, 0, 0, 0, 1, 1,
1.471263, 0.7909685, 0.2574014, 0, 0, 0, 1, 1,
1.477778, -0.8666283, 2.113042, 0, 0, 0, 1, 1,
1.487054, -1.259672, 3.454381, 0, 0, 0, 1, 1,
1.494114, -0.2570092, 3.037108, 0, 0, 0, 1, 1,
1.494938, -1.138529, 0.6394725, 0, 0, 0, 1, 1,
1.495816, -0.2648533, 1.056129, 0, 0, 0, 1, 1,
1.497239, 1.24953, 0.3887809, 1, 1, 1, 1, 1,
1.510678, -0.3870091, 1.039513, 1, 1, 1, 1, 1,
1.511536, -1.230486, 1.284475, 1, 1, 1, 1, 1,
1.535253, -1.302267, 2.919171, 1, 1, 1, 1, 1,
1.552382, -0.1225269, 0.8937579, 1, 1, 1, 1, 1,
1.55344, 0.8938286, 0.9293028, 1, 1, 1, 1, 1,
1.555514, -0.3215836, 0.7622971, 1, 1, 1, 1, 1,
1.582356, -0.3015176, 1.335486, 1, 1, 1, 1, 1,
1.584811, 0.3470119, 2.124584, 1, 1, 1, 1, 1,
1.590727, -0.3002338, 2.031139, 1, 1, 1, 1, 1,
1.605301, 1.068602, 0.7998042, 1, 1, 1, 1, 1,
1.63818, 0.1348625, 0.9491621, 1, 1, 1, 1, 1,
1.663314, 0.1742474, 1.676838, 1, 1, 1, 1, 1,
1.675111, 1.074069, 1.259919, 1, 1, 1, 1, 1,
1.675162, 1.807489, 0.877616, 1, 1, 1, 1, 1,
1.676382, 0.9902602, -0.06414586, 0, 0, 1, 1, 1,
1.678884, 1.580471, 0.704323, 1, 0, 0, 1, 1,
1.690692, -0.5778893, 3.481001, 1, 0, 0, 1, 1,
1.695745, -0.06072582, 2.245946, 1, 0, 0, 1, 1,
1.696651, 2.473283, -0.08501652, 1, 0, 0, 1, 1,
1.69673, -0.2946506, 2.512386, 1, 0, 0, 1, 1,
1.700386, 1.652992, 0.8668869, 0, 0, 0, 1, 1,
1.710288, -2.178318, 2.020435, 0, 0, 0, 1, 1,
1.723107, -0.554975, 2.637571, 0, 0, 0, 1, 1,
1.729802, -0.7282213, 1.433738, 0, 0, 0, 1, 1,
1.740342, 0.6592734, 1.658809, 0, 0, 0, 1, 1,
1.742724, -1.619253, 1.597462, 0, 0, 0, 1, 1,
1.749791, -1.453312, 2.461195, 0, 0, 0, 1, 1,
1.755617, -0.06085724, 0.4459943, 1, 1, 1, 1, 1,
1.787795, 1.932213, 0.5939136, 1, 1, 1, 1, 1,
1.79754, -0.2975175, 0.8108447, 1, 1, 1, 1, 1,
1.805208, 1.437378, 3.626996, 1, 1, 1, 1, 1,
1.806022, 0.7851599, 0.7760398, 1, 1, 1, 1, 1,
1.808717, -0.0455806, 2.418525, 1, 1, 1, 1, 1,
1.837194, 1.156971, 2.278453, 1, 1, 1, 1, 1,
1.865568, 0.8302824, 0.9254186, 1, 1, 1, 1, 1,
1.942766, -1.15935, 2.594538, 1, 1, 1, 1, 1,
1.949023, -0.4894208, 2.642617, 1, 1, 1, 1, 1,
1.951441, 0.6015341, 1.75498, 1, 1, 1, 1, 1,
1.956807, 0.0057065, 2.123273, 1, 1, 1, 1, 1,
1.964472, -0.1951334, -0.1913969, 1, 1, 1, 1, 1,
1.975916, -0.09104789, 2.257122, 1, 1, 1, 1, 1,
1.984361, 1.049537, 1.278974, 1, 1, 1, 1, 1,
1.997473, -1.121325, 2.322079, 0, 0, 1, 1, 1,
2.00817, 0.2165918, 3.190249, 1, 0, 0, 1, 1,
2.021189, 1.066126, 0.1843595, 1, 0, 0, 1, 1,
2.021595, 0.8766202, 0.8357037, 1, 0, 0, 1, 1,
2.033746, -0.6491564, 2.792291, 1, 0, 0, 1, 1,
2.047747, -0.1570542, 0.7533945, 1, 0, 0, 1, 1,
2.054834, -1.245309, -0.4932105, 0, 0, 0, 1, 1,
2.095598, -0.4152758, 2.882672, 0, 0, 0, 1, 1,
2.116132, -0.9583024, 2.322701, 0, 0, 0, 1, 1,
2.15537, -1.263042, 2.944578, 0, 0, 0, 1, 1,
2.221381, -0.7094617, 1.76932, 0, 0, 0, 1, 1,
2.235647, -2.056221, 4.140656, 0, 0, 0, 1, 1,
2.247406, -0.2986863, 2.213681, 0, 0, 0, 1, 1,
2.276127, -1.224022, 2.60101, 1, 1, 1, 1, 1,
2.464491, 0.5022013, 0.7160182, 1, 1, 1, 1, 1,
2.573169, -1.441569, 2.306813, 1, 1, 1, 1, 1,
2.722176, 0.05237789, 1.16444, 1, 1, 1, 1, 1,
2.757194, -0.7313837, 3.149397, 1, 1, 1, 1, 1,
3.075661, -1.523946, 0.2395184, 1, 1, 1, 1, 1,
3.391653, -2.065112, 5.16695, 1, 1, 1, 1, 1
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
var radius = 10.07227;
var distance = 35.37841;
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
mvMatrix.translate( 0.1853783, 0.02287817, -0.04172969 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.37841);
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
