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
-2.749845, 0.5883086, -1.249385, 1, 0, 0, 1,
-2.676812, -0.9441715, -2.113863, 1, 0.007843138, 0, 1,
-2.647218, 0.8237709, -2.213638, 1, 0.01176471, 0, 1,
-2.531916, -0.1725784, -2.661463, 1, 0.01960784, 0, 1,
-2.43604, -0.6882102, -2.11025, 1, 0.02352941, 0, 1,
-2.415193, -0.2632488, -1.590467, 1, 0.03137255, 0, 1,
-2.298065, -2.151, -2.656981, 1, 0.03529412, 0, 1,
-2.274886, 1.316909, -0.9831135, 1, 0.04313726, 0, 1,
-2.271649, 0.2689284, -0.853817, 1, 0.04705882, 0, 1,
-2.227916, -0.6820741, -2.90466, 1, 0.05490196, 0, 1,
-2.215949, 1.527197, -0.1427397, 1, 0.05882353, 0, 1,
-2.184078, 0.1306653, -1.125685, 1, 0.06666667, 0, 1,
-2.151244, 1.100008, -1.126959, 1, 0.07058824, 0, 1,
-2.101073, 2.359718, -1.207199, 1, 0.07843138, 0, 1,
-2.083667, -0.12613, -2.295751, 1, 0.08235294, 0, 1,
-2.026511, -0.3941249, -1.479671, 1, 0.09019608, 0, 1,
-2.023368, 1.598227, -1.229458, 1, 0.09411765, 0, 1,
-2.004405, -0.7160248, -1.122474, 1, 0.1019608, 0, 1,
-1.972959, -0.3725776, -2.034929, 1, 0.1098039, 0, 1,
-1.971915, 0.3849165, -2.82079, 1, 0.1137255, 0, 1,
-1.967824, 0.4724067, -0.6359414, 1, 0.1215686, 0, 1,
-1.945645, -0.7456338, -3.53838, 1, 0.1254902, 0, 1,
-1.923848, -1.461186, -2.94815, 1, 0.1333333, 0, 1,
-1.902349, 0.2742743, -0.9571788, 1, 0.1372549, 0, 1,
-1.901083, 1.280238, -1.524805, 1, 0.145098, 0, 1,
-1.880453, -0.7979732, -2.415241, 1, 0.1490196, 0, 1,
-1.875649, 0.1817769, -1.270951, 1, 0.1568628, 0, 1,
-1.851563, -2.800279, -1.894068, 1, 0.1607843, 0, 1,
-1.840849, -1.549761, -1.417104, 1, 0.1686275, 0, 1,
-1.838277, 0.5688502, -1.424107, 1, 0.172549, 0, 1,
-1.83393, 0.35056, -0.144256, 1, 0.1803922, 0, 1,
-1.822616, -0.1887135, -2.327413, 1, 0.1843137, 0, 1,
-1.821702, -0.7328543, -1.016742, 1, 0.1921569, 0, 1,
-1.811805, -0.8931049, -2.461466, 1, 0.1960784, 0, 1,
-1.790679, 1.847617, -2.512789, 1, 0.2039216, 0, 1,
-1.732325, -0.1517941, -0.621632, 1, 0.2117647, 0, 1,
-1.73221, -0.7313027, -2.474871, 1, 0.2156863, 0, 1,
-1.724216, 0.3006681, -2.063581, 1, 0.2235294, 0, 1,
-1.723691, 0.120686, -1.469207, 1, 0.227451, 0, 1,
-1.711922, -0.8078257, -2.070895, 1, 0.2352941, 0, 1,
-1.707424, 0.04299239, -2.731667, 1, 0.2392157, 0, 1,
-1.695335, -1.208095, -2.254914, 1, 0.2470588, 0, 1,
-1.688806, 0.1977193, -2.013281, 1, 0.2509804, 0, 1,
-1.661815, -0.2542599, -2.16382, 1, 0.2588235, 0, 1,
-1.661486, 1.626868, -1.241968, 1, 0.2627451, 0, 1,
-1.644267, 1.426019, -4.010861, 1, 0.2705882, 0, 1,
-1.637959, 0.2632083, -1.353873, 1, 0.2745098, 0, 1,
-1.631358, 0.1690148, -1.189571, 1, 0.282353, 0, 1,
-1.627668, 0.9911801, -1.609835, 1, 0.2862745, 0, 1,
-1.627061, -1.397672, -1.360905, 1, 0.2941177, 0, 1,
-1.626568, 0.3800831, -1.730062, 1, 0.3019608, 0, 1,
-1.618062, 0.8119056, -1.773031, 1, 0.3058824, 0, 1,
-1.608283, -1.193589, -0.3360668, 1, 0.3137255, 0, 1,
-1.606826, 0.561618, -2.253374, 1, 0.3176471, 0, 1,
-1.602521, -0.4721511, -0.4092571, 1, 0.3254902, 0, 1,
-1.563229, 0.9179353, -1.747651, 1, 0.3294118, 0, 1,
-1.560634, 0.6126533, -1.35968, 1, 0.3372549, 0, 1,
-1.529471, -1.658478, -3.906677, 1, 0.3411765, 0, 1,
-1.527119, 0.3920621, -0.5657036, 1, 0.3490196, 0, 1,
-1.506916, 0.05719001, -2.061457, 1, 0.3529412, 0, 1,
-1.50121, -1.178744, -1.033366, 1, 0.3607843, 0, 1,
-1.49452, 0.5499379, 0.2508004, 1, 0.3647059, 0, 1,
-1.493487, -0.4907453, -2.265578, 1, 0.372549, 0, 1,
-1.482795, -0.3127962, -1.88747, 1, 0.3764706, 0, 1,
-1.461796, -0.9508677, -2.272017, 1, 0.3843137, 0, 1,
-1.461525, -0.7935922, -3.274567, 1, 0.3882353, 0, 1,
-1.445922, 0.7462323, -3.897701, 1, 0.3960784, 0, 1,
-1.445599, 0.5003096, -1.630095, 1, 0.4039216, 0, 1,
-1.445267, -0.890521, -2.476753, 1, 0.4078431, 0, 1,
-1.430547, 1.307992, -0.9910006, 1, 0.4156863, 0, 1,
-1.424307, -0.009125641, -2.165415, 1, 0.4196078, 0, 1,
-1.410548, 0.523525, -2.807048, 1, 0.427451, 0, 1,
-1.398919, -0.05633301, -0.6159545, 1, 0.4313726, 0, 1,
-1.383651, 1.529918, 0.2518039, 1, 0.4392157, 0, 1,
-1.382122, -0.4246502, -1.568864, 1, 0.4431373, 0, 1,
-1.381575, -0.05986156, -1.715355, 1, 0.4509804, 0, 1,
-1.378568, 0.6511176, -3.088988, 1, 0.454902, 0, 1,
-1.372609, 1.007124, -1.294165, 1, 0.4627451, 0, 1,
-1.370748, 0.7514207, -0.9974098, 1, 0.4666667, 0, 1,
-1.370222, 1.327201, -0.9941198, 1, 0.4745098, 0, 1,
-1.367053, 1.458899, -1.681502, 1, 0.4784314, 0, 1,
-1.362746, 2.498009, -1.030258, 1, 0.4862745, 0, 1,
-1.356552, 1.061242, -1.162904, 1, 0.4901961, 0, 1,
-1.336093, -1.185672, -1.672586, 1, 0.4980392, 0, 1,
-1.335195, 1.13562, 0.6884742, 1, 0.5058824, 0, 1,
-1.328975, 0.5741765, -1.399949, 1, 0.509804, 0, 1,
-1.327177, 0.9169095, -0.418833, 1, 0.5176471, 0, 1,
-1.313037, 0.3953923, -0.6744744, 1, 0.5215687, 0, 1,
-1.312784, -0.380569, -2.320821, 1, 0.5294118, 0, 1,
-1.288686, 0.4009737, -0.8262983, 1, 0.5333334, 0, 1,
-1.285469, -1.617572, -3.337093, 1, 0.5411765, 0, 1,
-1.284316, -1.021678, -1.671469, 1, 0.5450981, 0, 1,
-1.281591, -1.15891, -2.863545, 1, 0.5529412, 0, 1,
-1.279005, -0.4500327, -1.739758, 1, 0.5568628, 0, 1,
-1.274355, -0.270136, -2.127815, 1, 0.5647059, 0, 1,
-1.26932, -0.2295658, -1.142251, 1, 0.5686275, 0, 1,
-1.264341, -0.6975769, -2.332381, 1, 0.5764706, 0, 1,
-1.260056, -1.408613, -4.133484, 1, 0.5803922, 0, 1,
-1.259303, -0.1024481, -0.2791654, 1, 0.5882353, 0, 1,
-1.255641, 0.3323629, -1.816497, 1, 0.5921569, 0, 1,
-1.251086, 0.0575786, -2.654909, 1, 0.6, 0, 1,
-1.244977, 1.536845, -2.274417, 1, 0.6078432, 0, 1,
-1.244702, 0.1653961, -2.450994, 1, 0.6117647, 0, 1,
-1.244211, 0.3236155, -0.6002098, 1, 0.6196079, 0, 1,
-1.238283, -0.7024423, -2.813195, 1, 0.6235294, 0, 1,
-1.235858, -1.7348, -0.640493, 1, 0.6313726, 0, 1,
-1.231474, -0.07910968, -1.055337, 1, 0.6352941, 0, 1,
-1.227209, -0.8665121, -1.356102, 1, 0.6431373, 0, 1,
-1.222115, 0.07858673, -1.086183, 1, 0.6470588, 0, 1,
-1.219795, 0.1200201, -1.574795, 1, 0.654902, 0, 1,
-1.212279, -0.2083533, -2.595741, 1, 0.6588235, 0, 1,
-1.199132, -0.5370917, -1.592427, 1, 0.6666667, 0, 1,
-1.193835, 1.106126, -1.938587, 1, 0.6705883, 0, 1,
-1.183531, 0.8574942, -1.070912, 1, 0.6784314, 0, 1,
-1.180773, 0.5576997, -1.613824, 1, 0.682353, 0, 1,
-1.179675, 1.764745, -2.068769, 1, 0.6901961, 0, 1,
-1.174084, -2.284409, -2.867705, 1, 0.6941177, 0, 1,
-1.170744, -0.368049, -1.535591, 1, 0.7019608, 0, 1,
-1.170615, 0.728062, 0.9952253, 1, 0.7098039, 0, 1,
-1.1644, -0.2662069, -2.351998, 1, 0.7137255, 0, 1,
-1.162434, 1.138874, 0.4342217, 1, 0.7215686, 0, 1,
-1.155805, -0.316478, -1.179601, 1, 0.7254902, 0, 1,
-1.151397, -0.6050465, -3.124865, 1, 0.7333333, 0, 1,
-1.146058, 1.549851, -1.958685, 1, 0.7372549, 0, 1,
-1.143288, 2.148699, -1.299489, 1, 0.7450981, 0, 1,
-1.137058, 1.013859, -2.441676, 1, 0.7490196, 0, 1,
-1.128984, -0.5737528, -1.318197, 1, 0.7568628, 0, 1,
-1.117036, -1.230049, -3.098849, 1, 0.7607843, 0, 1,
-1.1081, -0.8517559, -2.030744, 1, 0.7686275, 0, 1,
-1.107941, 0.1573775, -2.242854, 1, 0.772549, 0, 1,
-1.096275, -0.8024576, 0.7512798, 1, 0.7803922, 0, 1,
-1.093402, -0.1970291, -2.53309, 1, 0.7843137, 0, 1,
-1.093355, 1.579113, -2.314125, 1, 0.7921569, 0, 1,
-1.09238, -0.6218884, -3.849345, 1, 0.7960784, 0, 1,
-1.090865, 0.5097531, -1.333473, 1, 0.8039216, 0, 1,
-1.084516, 0.2518438, -2.793219, 1, 0.8117647, 0, 1,
-1.077337, -2.022479, -1.702189, 1, 0.8156863, 0, 1,
-1.067637, 0.9583014, 1.398643, 1, 0.8235294, 0, 1,
-1.063422, 0.0599154, 1.5113, 1, 0.827451, 0, 1,
-1.055218, 1.077331, 0.1966934, 1, 0.8352941, 0, 1,
-1.054238, -0.6160932, -3.298041, 1, 0.8392157, 0, 1,
-1.05169, 0.5196036, -1.121024, 1, 0.8470588, 0, 1,
-1.051334, -1.67629, -2.525662, 1, 0.8509804, 0, 1,
-1.047315, 0.9466429, -0.4477864, 1, 0.8588235, 0, 1,
-1.043411, 0.3108878, -1.254516, 1, 0.8627451, 0, 1,
-1.039965, -1.353933, -2.885176, 1, 0.8705882, 0, 1,
-1.023958, 1.287231, -0.09519348, 1, 0.8745098, 0, 1,
-1.014715, 0.1185151, -0.405795, 1, 0.8823529, 0, 1,
-1.012156, 0.1604995, -1.944047, 1, 0.8862745, 0, 1,
-1.01211, -1.122132, -2.421993, 1, 0.8941177, 0, 1,
-1.005851, 0.7448261, -0.6600655, 1, 0.8980392, 0, 1,
-1.003564, 0.3449963, 0.3182369, 1, 0.9058824, 0, 1,
-1.002414, 0.05165561, -1.214333, 1, 0.9137255, 0, 1,
-0.9994111, -1.052626, -2.191058, 1, 0.9176471, 0, 1,
-0.987842, -1.192013, -2.551424, 1, 0.9254902, 0, 1,
-0.984766, -0.4606411, -2.000569, 1, 0.9294118, 0, 1,
-0.9762432, 1.314983, 0.2226133, 1, 0.9372549, 0, 1,
-0.9744152, -1.446817, -2.303551, 1, 0.9411765, 0, 1,
-0.9577527, 0.4304896, 0.1785682, 1, 0.9490196, 0, 1,
-0.9562994, 2.204159, -2.346329, 1, 0.9529412, 0, 1,
-0.955456, -0.4940787, -1.633571, 1, 0.9607843, 0, 1,
-0.9420195, -0.7301184, -3.284624, 1, 0.9647059, 0, 1,
-0.9378988, -0.5647842, -2.499907, 1, 0.972549, 0, 1,
-0.9349635, -1.050231, -2.885821, 1, 0.9764706, 0, 1,
-0.9129437, 0.1574312, 0.6704081, 1, 0.9843137, 0, 1,
-0.9086679, 1.710265, 0.07999267, 1, 0.9882353, 0, 1,
-0.9037561, 0.774995, -0.7672971, 1, 0.9960784, 0, 1,
-0.9033126, 1.137592, -0.4966636, 0.9960784, 1, 0, 1,
-0.8959758, -0.4410321, -1.233116, 0.9921569, 1, 0, 1,
-0.8953756, -0.05420301, -0.6189771, 0.9843137, 1, 0, 1,
-0.8890911, 1.498692, 0.5902876, 0.9803922, 1, 0, 1,
-0.8820795, -0.876007, -1.750425, 0.972549, 1, 0, 1,
-0.8794531, 0.3948435, -1.280191, 0.9686275, 1, 0, 1,
-0.8702903, -0.405311, -0.172599, 0.9607843, 1, 0, 1,
-0.8696088, 2.510695, 0.5122175, 0.9568627, 1, 0, 1,
-0.8662278, 0.1403238, -1.996251, 0.9490196, 1, 0, 1,
-0.8558938, -0.600539, -2.323664, 0.945098, 1, 0, 1,
-0.8499497, 0.8751042, 1.866761, 0.9372549, 1, 0, 1,
-0.8404821, 0.08825964, -1.392352, 0.9333333, 1, 0, 1,
-0.8388787, 0.9904661, 0.6125534, 0.9254902, 1, 0, 1,
-0.8350668, -0.4361054, -1.800132, 0.9215686, 1, 0, 1,
-0.8112031, -1.16213, -3.174018, 0.9137255, 1, 0, 1,
-0.8108807, 0.3107698, -1.382323, 0.9098039, 1, 0, 1,
-0.8049291, 1.158207, -2.155632, 0.9019608, 1, 0, 1,
-0.7977279, -0.03139185, -1.420957, 0.8941177, 1, 0, 1,
-0.7971299, -0.8013684, -2.461559, 0.8901961, 1, 0, 1,
-0.790641, 1.193171, -1.064126, 0.8823529, 1, 0, 1,
-0.7900255, -1.010068, -2.525285, 0.8784314, 1, 0, 1,
-0.7848379, -0.7616665, -2.51551, 0.8705882, 1, 0, 1,
-0.7838085, 0.1586972, -1.597152, 0.8666667, 1, 0, 1,
-0.7837433, -2.668298, -3.024251, 0.8588235, 1, 0, 1,
-0.7705655, 0.0702088, -2.79728, 0.854902, 1, 0, 1,
-0.7692617, -0.7038431, -1.67792, 0.8470588, 1, 0, 1,
-0.766664, -0.2513341, -2.606734, 0.8431373, 1, 0, 1,
-0.7625028, -0.3566027, -1.21319, 0.8352941, 1, 0, 1,
-0.752468, 1.554147, -0.1378845, 0.8313726, 1, 0, 1,
-0.7505203, -0.09987498, -0.4414074, 0.8235294, 1, 0, 1,
-0.744101, 1.131566, -1.282313, 0.8196079, 1, 0, 1,
-0.7428331, 1.606551, 0.1554668, 0.8117647, 1, 0, 1,
-0.7359525, -0.8397224, -3.140581, 0.8078431, 1, 0, 1,
-0.7349873, 1.478199, 0.4331236, 0.8, 1, 0, 1,
-0.7299343, -1.039522, -4.352864, 0.7921569, 1, 0, 1,
-0.7189264, 0.9925226, -0.4059293, 0.7882353, 1, 0, 1,
-0.7123803, 2.417344, -0.4715246, 0.7803922, 1, 0, 1,
-0.7099831, -0.3641862, -1.563498, 0.7764706, 1, 0, 1,
-0.7088839, -1.016336, -0.7591231, 0.7686275, 1, 0, 1,
-0.7047392, 1.592808, -1.246095, 0.7647059, 1, 0, 1,
-0.7043691, -0.7607888, -1.485758, 0.7568628, 1, 0, 1,
-0.7001753, -0.4121412, -1.411561, 0.7529412, 1, 0, 1,
-0.7001247, 0.4057304, -0.9175971, 0.7450981, 1, 0, 1,
-0.6916936, 1.707428, -0.4688935, 0.7411765, 1, 0, 1,
-0.6803671, 0.8263211, -0.1729007, 0.7333333, 1, 0, 1,
-0.6766142, 0.1267003, -0.4200389, 0.7294118, 1, 0, 1,
-0.6756047, -0.1450737, -2.182102, 0.7215686, 1, 0, 1,
-0.6735299, -0.3761999, -3.251591, 0.7176471, 1, 0, 1,
-0.6734128, -0.1565596, -2.964302, 0.7098039, 1, 0, 1,
-0.6676878, 0.7028205, -2.840368, 0.7058824, 1, 0, 1,
-0.6638649, -0.5439782, -2.709404, 0.6980392, 1, 0, 1,
-0.6634743, 0.3700622, -1.055689, 0.6901961, 1, 0, 1,
-0.6622702, -0.07273914, 0.04714898, 0.6862745, 1, 0, 1,
-0.6552779, 1.326675, -1.049294, 0.6784314, 1, 0, 1,
-0.6529655, -0.3105965, -1.723432, 0.6745098, 1, 0, 1,
-0.6514375, 1.595373, -1.514873, 0.6666667, 1, 0, 1,
-0.6479048, 1.515103, -0.7719346, 0.6627451, 1, 0, 1,
-0.6475615, -0.09930283, -3.373521, 0.654902, 1, 0, 1,
-0.6456583, -0.5313503, -2.921139, 0.6509804, 1, 0, 1,
-0.644285, -1.245618, -2.394013, 0.6431373, 1, 0, 1,
-0.6394517, 0.4672537, -1.928591, 0.6392157, 1, 0, 1,
-0.6382845, 1.831541, -0.8465887, 0.6313726, 1, 0, 1,
-0.6372455, 0.7766711, -0.8092769, 0.627451, 1, 0, 1,
-0.6365966, -1.289529, -2.746013, 0.6196079, 1, 0, 1,
-0.6357737, 0.04980548, 0.1591519, 0.6156863, 1, 0, 1,
-0.6324469, 0.5207754, 0.1307932, 0.6078432, 1, 0, 1,
-0.6313734, 0.3771293, -2.431311, 0.6039216, 1, 0, 1,
-0.6292507, -0.5335518, -0.8880897, 0.5960785, 1, 0, 1,
-0.6261953, 0.8123118, -2.530754, 0.5882353, 1, 0, 1,
-0.6229625, -2.230221, -3.575816, 0.5843138, 1, 0, 1,
-0.6226334, -0.9790423, -2.721337, 0.5764706, 1, 0, 1,
-0.6212844, -0.2810175, -2.31832, 0.572549, 1, 0, 1,
-0.6196777, 0.2457995, 0.1252464, 0.5647059, 1, 0, 1,
-0.6176934, 0.1077059, -1.678434, 0.5607843, 1, 0, 1,
-0.6167021, -0.417477, -3.092405, 0.5529412, 1, 0, 1,
-0.6165004, -2.341665, -2.422831, 0.5490196, 1, 0, 1,
-0.608157, -0.5235822, -2.68833, 0.5411765, 1, 0, 1,
-0.6007882, 0.3699448, 0.1348715, 0.5372549, 1, 0, 1,
-0.5989589, 0.03404298, -2.636391, 0.5294118, 1, 0, 1,
-0.5983738, 0.9076402, -2.199357, 0.5254902, 1, 0, 1,
-0.5975466, -0.4028811, -0.8571246, 0.5176471, 1, 0, 1,
-0.5967327, 0.8858339, -0.1114636, 0.5137255, 1, 0, 1,
-0.5954423, 2.508263, 0.9817433, 0.5058824, 1, 0, 1,
-0.594261, -0.380922, -2.763677, 0.5019608, 1, 0, 1,
-0.5939555, -0.3505426, -3.648731, 0.4941176, 1, 0, 1,
-0.59005, 0.6861703, -0.6601157, 0.4862745, 1, 0, 1,
-0.584255, 1.039576, 0.2909427, 0.4823529, 1, 0, 1,
-0.5810679, 1.483608, -1.778688, 0.4745098, 1, 0, 1,
-0.5741402, -0.5222395, -2.858409, 0.4705882, 1, 0, 1,
-0.5729858, 0.9567422, -0.006505026, 0.4627451, 1, 0, 1,
-0.5723788, 0.2120485, -0.9550624, 0.4588235, 1, 0, 1,
-0.5713667, 0.06425026, -0.8468987, 0.4509804, 1, 0, 1,
-0.5671828, 0.3670222, -1.37435, 0.4470588, 1, 0, 1,
-0.5580308, 0.2109263, -1.455608, 0.4392157, 1, 0, 1,
-0.5540472, 1.550955, -0.5579506, 0.4352941, 1, 0, 1,
-0.5534048, -0.952066, -4.431098, 0.427451, 1, 0, 1,
-0.5528953, -2.209582, -2.469625, 0.4235294, 1, 0, 1,
-0.5524788, 2.110322, -0.9702158, 0.4156863, 1, 0, 1,
-0.5421103, 0.2151412, -0.2178968, 0.4117647, 1, 0, 1,
-0.5405903, -0.2557915, -2.22332, 0.4039216, 1, 0, 1,
-0.5400334, -1.331105, -1.22531, 0.3960784, 1, 0, 1,
-0.5388073, -1.083115, -3.148718, 0.3921569, 1, 0, 1,
-0.5381979, 0.7074289, -0.8062056, 0.3843137, 1, 0, 1,
-0.5376064, -1.058747, -1.373221, 0.3803922, 1, 0, 1,
-0.5362878, 2.347618, -0.682054, 0.372549, 1, 0, 1,
-0.5339069, -2.283007, -4.607352, 0.3686275, 1, 0, 1,
-0.5335821, -0.2384353, -1.13419, 0.3607843, 1, 0, 1,
-0.5318908, -0.6044397, -2.852091, 0.3568628, 1, 0, 1,
-0.5308167, -0.531514, -2.535638, 0.3490196, 1, 0, 1,
-0.5262413, 1.270236, 0.284071, 0.345098, 1, 0, 1,
-0.5222459, 0.5585909, -0.972061, 0.3372549, 1, 0, 1,
-0.5167289, -1.013995, -2.498971, 0.3333333, 1, 0, 1,
-0.5102062, 0.5651495, -1.582339, 0.3254902, 1, 0, 1,
-0.5064211, -1.263866, -1.976324, 0.3215686, 1, 0, 1,
-0.5048288, -2.383095, -6.518848, 0.3137255, 1, 0, 1,
-0.4958662, 1.293377, -1.869968, 0.3098039, 1, 0, 1,
-0.4930263, 1.434855, 0.6699468, 0.3019608, 1, 0, 1,
-0.4904388, 0.3686141, -0.3774472, 0.2941177, 1, 0, 1,
-0.4893686, -0.2723586, -0.9026527, 0.2901961, 1, 0, 1,
-0.4881358, 0.7598172, -0.899116, 0.282353, 1, 0, 1,
-0.4854428, 0.1484408, -1.391461, 0.2784314, 1, 0, 1,
-0.4841731, 0.7349622, 0.5091879, 0.2705882, 1, 0, 1,
-0.4819792, -0.8636957, -3.024632, 0.2666667, 1, 0, 1,
-0.4758663, -0.2547616, -3.43178, 0.2588235, 1, 0, 1,
-0.4728245, -1.237971, -1.220549, 0.254902, 1, 0, 1,
-0.4724287, -0.2562705, -1.261428, 0.2470588, 1, 0, 1,
-0.471968, -0.8644202, -1.812592, 0.2431373, 1, 0, 1,
-0.4638213, 1.024098, -1.373284, 0.2352941, 1, 0, 1,
-0.4633805, -0.01786474, -0.2926928, 0.2313726, 1, 0, 1,
-0.4627957, -0.7731876, -3.372501, 0.2235294, 1, 0, 1,
-0.4622933, 0.131379, -0.6820744, 0.2196078, 1, 0, 1,
-0.4596481, 0.01189897, -1.159129, 0.2117647, 1, 0, 1,
-0.4573935, 0.4633064, -3.512184, 0.2078431, 1, 0, 1,
-0.4557405, -0.1518726, -1.918358, 0.2, 1, 0, 1,
-0.4544218, -0.4575188, -2.934905, 0.1921569, 1, 0, 1,
-0.4533906, -1.17613, -2.011125, 0.1882353, 1, 0, 1,
-0.4520572, 1.173395, 0.06345951, 0.1803922, 1, 0, 1,
-0.45143, -0.6102721, -2.897134, 0.1764706, 1, 0, 1,
-0.4495543, -1.671192, -3.36642, 0.1686275, 1, 0, 1,
-0.44677, 1.157331, -0.238325, 0.1647059, 1, 0, 1,
-0.442834, 0.652806, -1.385844, 0.1568628, 1, 0, 1,
-0.4425868, -1.035704, -3.750365, 0.1529412, 1, 0, 1,
-0.4364444, 0.912662, -1.647293, 0.145098, 1, 0, 1,
-0.4352526, -0.2421832, -1.954132, 0.1411765, 1, 0, 1,
-0.4300457, 0.07355672, -1.918558, 0.1333333, 1, 0, 1,
-0.4269555, -1.437858, -2.536588, 0.1294118, 1, 0, 1,
-0.4242349, -0.9312144, -2.057059, 0.1215686, 1, 0, 1,
-0.4219157, 2.045067, -0.5767789, 0.1176471, 1, 0, 1,
-0.421848, 0.5953554, -0.7530451, 0.1098039, 1, 0, 1,
-0.4206446, 0.7188405, 0.4833931, 0.1058824, 1, 0, 1,
-0.4195559, -2.196663, -3.88347, 0.09803922, 1, 0, 1,
-0.4185918, -0.225803, -3.042531, 0.09019608, 1, 0, 1,
-0.4178754, -2.375801, -3.469257, 0.08627451, 1, 0, 1,
-0.4172971, 0.3391558, -0.77123, 0.07843138, 1, 0, 1,
-0.4102517, -0.8892168, -1.946112, 0.07450981, 1, 0, 1,
-0.4095914, 1.705649, 2.009608, 0.06666667, 1, 0, 1,
-0.407248, 0.8634957, -0.6514619, 0.0627451, 1, 0, 1,
-0.403577, -0.8312227, -2.196388, 0.05490196, 1, 0, 1,
-0.3969809, 0.2938745, -2.434943, 0.05098039, 1, 0, 1,
-0.3964035, 0.9690701, -0.2007387, 0.04313726, 1, 0, 1,
-0.3949118, -0.4284934, -2.572865, 0.03921569, 1, 0, 1,
-0.3878457, 1.614219, 1.157022, 0.03137255, 1, 0, 1,
-0.3845873, -1.420166, -3.580056, 0.02745098, 1, 0, 1,
-0.3798028, -0.8170996, -1.889884, 0.01960784, 1, 0, 1,
-0.3766663, -1.339725, -2.85364, 0.01568628, 1, 0, 1,
-0.3738192, 0.1635975, -0.4331287, 0.007843138, 1, 0, 1,
-0.3690348, 0.08639258, -0.7415105, 0.003921569, 1, 0, 1,
-0.3689364, 0.196504, 0.2298632, 0, 1, 0.003921569, 1,
-0.3668947, -0.8559718, -1.185514, 0, 1, 0.01176471, 1,
-0.3661828, -0.2014791, -1.906981, 0, 1, 0.01568628, 1,
-0.3655465, 0.9155195, -2.51738, 0, 1, 0.02352941, 1,
-0.3629192, -0.03679229, -1.194862, 0, 1, 0.02745098, 1,
-0.3626871, -1.165382, -4.909256, 0, 1, 0.03529412, 1,
-0.3593932, -1.296972, -4.341987, 0, 1, 0.03921569, 1,
-0.3559169, 0.01484006, -1.179105, 0, 1, 0.04705882, 1,
-0.3513751, -1.300474, -2.786373, 0, 1, 0.05098039, 1,
-0.3504204, -0.1966784, -1.307151, 0, 1, 0.05882353, 1,
-0.3494761, -0.9088705, -2.441905, 0, 1, 0.0627451, 1,
-0.3440758, 1.08046, 0.08710712, 0, 1, 0.07058824, 1,
-0.3429379, 1.135832, -0.8313329, 0, 1, 0.07450981, 1,
-0.3280447, -0.5433761, -3.438042, 0, 1, 0.08235294, 1,
-0.3268606, -0.101881, -3.245616, 0, 1, 0.08627451, 1,
-0.3256639, -0.06373608, -3.883407, 0, 1, 0.09411765, 1,
-0.3174279, 0.4474185, -1.275327, 0, 1, 0.1019608, 1,
-0.3150004, 0.2334839, 0.7115926, 0, 1, 0.1058824, 1,
-0.3147492, 0.4134105, -0.01669238, 0, 1, 0.1137255, 1,
-0.3136221, 0.08188907, -1.99549, 0, 1, 0.1176471, 1,
-0.3105838, 0.4418406, -0.3564999, 0, 1, 0.1254902, 1,
-0.3077471, -0.8831601, -3.134461, 0, 1, 0.1294118, 1,
-0.3059201, -0.08297619, -1.316775, 0, 1, 0.1372549, 1,
-0.3011858, -0.7936156, -2.609359, 0, 1, 0.1411765, 1,
-0.2983364, -0.3738673, -4.233547, 0, 1, 0.1490196, 1,
-0.2980363, -0.03896277, -2.174506, 0, 1, 0.1529412, 1,
-0.2942868, -0.9828509, -3.81732, 0, 1, 0.1607843, 1,
-0.2929201, 0.6906735, 0.5450428, 0, 1, 0.1647059, 1,
-0.2908105, -0.7045444, -4.320185, 0, 1, 0.172549, 1,
-0.2904126, -1.274773, -3.449599, 0, 1, 0.1764706, 1,
-0.2822316, -0.7024346, -2.921122, 0, 1, 0.1843137, 1,
-0.2756437, -0.2005282, -5.087806, 0, 1, 0.1882353, 1,
-0.2699548, -0.6569909, -0.8134999, 0, 1, 0.1960784, 1,
-0.2658797, 0.5465507, -0.7611378, 0, 1, 0.2039216, 1,
-0.2583217, -0.2252706, -0.7721431, 0, 1, 0.2078431, 1,
-0.2580005, 0.5322824, -1.805768, 0, 1, 0.2156863, 1,
-0.2568359, -1.549325, -3.237124, 0, 1, 0.2196078, 1,
-0.2512385, -0.9696156, -4.770627, 0, 1, 0.227451, 1,
-0.2437619, -0.6360053, -3.062785, 0, 1, 0.2313726, 1,
-0.2348297, -0.6768177, -1.638261, 0, 1, 0.2392157, 1,
-0.233269, -0.7199724, -2.751661, 0, 1, 0.2431373, 1,
-0.2330757, 1.622373, 1.275106, 0, 1, 0.2509804, 1,
-0.2323302, -0.3698267, -1.67712, 0, 1, 0.254902, 1,
-0.2290077, 0.299521, -1.645832, 0, 1, 0.2627451, 1,
-0.2287023, 0.3436208, -0.4929369, 0, 1, 0.2666667, 1,
-0.2262816, 0.185363, -1.440138, 0, 1, 0.2745098, 1,
-0.2249057, -0.80878, -1.10051, 0, 1, 0.2784314, 1,
-0.2247604, 0.5676402, -0.6040469, 0, 1, 0.2862745, 1,
-0.2226405, -1.555772, -1.028762, 0, 1, 0.2901961, 1,
-0.2214419, -0.9659554, -2.314345, 0, 1, 0.2980392, 1,
-0.2210292, -0.3528074, -2.578244, 0, 1, 0.3058824, 1,
-0.2209286, 0.1747624, -2.120839, 0, 1, 0.3098039, 1,
-0.2164638, -0.1942543, -3.099404, 0, 1, 0.3176471, 1,
-0.2131611, 0.4996936, 0.3796787, 0, 1, 0.3215686, 1,
-0.2123472, 0.637004, 0.4938295, 0, 1, 0.3294118, 1,
-0.2122528, 0.0912155, -2.143144, 0, 1, 0.3333333, 1,
-0.2096046, 1.922311, 0.04337988, 0, 1, 0.3411765, 1,
-0.2079869, 0.3397939, 1.947981, 0, 1, 0.345098, 1,
-0.2059567, -0.3793459, -3.304033, 0, 1, 0.3529412, 1,
-0.2016179, 0.6298721, -0.7958288, 0, 1, 0.3568628, 1,
-0.2003463, -3.319278, -3.809664, 0, 1, 0.3647059, 1,
-0.1980407, 0.7310139, -3.182625, 0, 1, 0.3686275, 1,
-0.1946703, -0.259276, -3.017538, 0, 1, 0.3764706, 1,
-0.1938482, -0.5941145, -1.103884, 0, 1, 0.3803922, 1,
-0.1913246, -1.010427, -1.63708, 0, 1, 0.3882353, 1,
-0.1903037, 1.044809, -0.07525697, 0, 1, 0.3921569, 1,
-0.1877381, 0.0274603, 0.45229, 0, 1, 0.4, 1,
-0.1855359, 0.104781, -0.01646468, 0, 1, 0.4078431, 1,
-0.1839768, -0.01869209, -1.173638, 0, 1, 0.4117647, 1,
-0.1828176, -1.128335, -2.490066, 0, 1, 0.4196078, 1,
-0.1813426, 0.05089874, 0.1138491, 0, 1, 0.4235294, 1,
-0.1800913, 2.238784, 0.3931748, 0, 1, 0.4313726, 1,
-0.1755749, 1.155783, -0.05074323, 0, 1, 0.4352941, 1,
-0.1749582, 2.071311, 0.8172218, 0, 1, 0.4431373, 1,
-0.1715345, 0.5903322, 1.163325, 0, 1, 0.4470588, 1,
-0.1712521, -0.01975029, -3.246042, 0, 1, 0.454902, 1,
-0.1694784, 0.6531962, -0.5712175, 0, 1, 0.4588235, 1,
-0.1689861, 0.2809707, -1.177148, 0, 1, 0.4666667, 1,
-0.1689063, 1.216402, 0.6515388, 0, 1, 0.4705882, 1,
-0.1674828, -0.2557028, -4.379896, 0, 1, 0.4784314, 1,
-0.1662417, -0.5444168, -2.037206, 0, 1, 0.4823529, 1,
-0.1655675, -0.1605295, -2.734237, 0, 1, 0.4901961, 1,
-0.1615014, 0.3972305, -0.7850175, 0, 1, 0.4941176, 1,
-0.1608892, -2.130325, -3.226452, 0, 1, 0.5019608, 1,
-0.1589143, -1.447577, -3.511224, 0, 1, 0.509804, 1,
-0.1569026, 1.450702, -0.6410142, 0, 1, 0.5137255, 1,
-0.1544541, 1.611094, -0.1344057, 0, 1, 0.5215687, 1,
-0.153918, 0.2033609, -0.07091459, 0, 1, 0.5254902, 1,
-0.1536372, -0.9392659, -2.52769, 0, 1, 0.5333334, 1,
-0.1479534, 0.6825554, -0.6807443, 0, 1, 0.5372549, 1,
-0.1465871, -2.389819, -2.073131, 0, 1, 0.5450981, 1,
-0.1463398, -1.469301, -1.210011, 0, 1, 0.5490196, 1,
-0.1425221, -0.7505583, -1.827146, 0, 1, 0.5568628, 1,
-0.1414606, -0.5449358, -2.021862, 0, 1, 0.5607843, 1,
-0.1412985, -0.1389502, -2.587492, 0, 1, 0.5686275, 1,
-0.1403769, -2.293852, -2.059739, 0, 1, 0.572549, 1,
-0.1381592, 0.6363626, 0.8947493, 0, 1, 0.5803922, 1,
-0.137433, -0.08167362, 0.1269998, 0, 1, 0.5843138, 1,
-0.1309999, -1.425277, -2.83782, 0, 1, 0.5921569, 1,
-0.1298359, 1.044433, -1.383697, 0, 1, 0.5960785, 1,
-0.1263446, 2.148176, -0.3377914, 0, 1, 0.6039216, 1,
-0.1236997, -1.328557, -0.3596532, 0, 1, 0.6117647, 1,
-0.1168124, -0.6924192, -2.462687, 0, 1, 0.6156863, 1,
-0.1160575, -0.4035694, -2.202657, 0, 1, 0.6235294, 1,
-0.1156378, -1.152761, -3.473987, 0, 1, 0.627451, 1,
-0.115595, 0.2240182, -1.500371, 0, 1, 0.6352941, 1,
-0.1153414, 1.588036, 0.2046025, 0, 1, 0.6392157, 1,
-0.1133332, 0.630079, -0.2672863, 0, 1, 0.6470588, 1,
-0.1099828, -1.799506, -2.768975, 0, 1, 0.6509804, 1,
-0.106192, -0.003103181, -1.062921, 0, 1, 0.6588235, 1,
-0.1042013, 0.8870211, 0.8108718, 0, 1, 0.6627451, 1,
-0.102133, -0.2542953, -0.6624032, 0, 1, 0.6705883, 1,
-0.09268627, 1.080621, 1.262599, 0, 1, 0.6745098, 1,
-0.08148498, 0.9325025, 0.3802274, 0, 1, 0.682353, 1,
-0.08097397, 1.130926, 0.4277945, 0, 1, 0.6862745, 1,
-0.08025537, -0.2578385, -0.9420798, 0, 1, 0.6941177, 1,
-0.07968087, 0.4335716, 0.6328572, 0, 1, 0.7019608, 1,
-0.07694626, -0.2775596, -2.313547, 0, 1, 0.7058824, 1,
-0.07279667, 0.3100835, 1.141247, 0, 1, 0.7137255, 1,
-0.07259624, -0.2063367, -3.130218, 0, 1, 0.7176471, 1,
-0.07098501, -0.7913585, -3.900593, 0, 1, 0.7254902, 1,
-0.07034557, -0.3475591, -5.252626, 0, 1, 0.7294118, 1,
-0.0693803, 0.06683961, -0.5090882, 0, 1, 0.7372549, 1,
-0.06762657, -0.1193818, -2.382055, 0, 1, 0.7411765, 1,
-0.06607321, -0.9908404, -2.297426, 0, 1, 0.7490196, 1,
-0.0556642, -0.04724623, -2.839752, 0, 1, 0.7529412, 1,
-0.05378271, 0.4420169, 0.7933097, 0, 1, 0.7607843, 1,
-0.05283584, 1.26657, -0.3826071, 0, 1, 0.7647059, 1,
-0.04916012, -0.5670396, -2.829227, 0, 1, 0.772549, 1,
-0.03857014, -0.09236239, -0.041214, 0, 1, 0.7764706, 1,
-0.03853429, 1.026597, 0.9559238, 0, 1, 0.7843137, 1,
-0.03571079, -0.8816248, -4.308862, 0, 1, 0.7882353, 1,
-0.03493767, 2.326446, 0.4267602, 0, 1, 0.7960784, 1,
-0.03401195, -0.8267315, -3.668049, 0, 1, 0.8039216, 1,
-0.03215903, -0.008881781, -1.929301, 0, 1, 0.8078431, 1,
-0.02836406, 0.003537156, -2.582634, 0, 1, 0.8156863, 1,
-0.02426413, -0.7931012, -3.042492, 0, 1, 0.8196079, 1,
-0.02328701, 1.186852, 0.2260463, 0, 1, 0.827451, 1,
-0.020973, 0.7073412, 0.2750945, 0, 1, 0.8313726, 1,
-0.01921769, 1.233157, 0.421267, 0, 1, 0.8392157, 1,
-0.01529024, 0.2275799, 1.652183, 0, 1, 0.8431373, 1,
-0.01087251, -0.1514, -4.056788, 0, 1, 0.8509804, 1,
-0.006725596, -1.006619, -3.728935, 0, 1, 0.854902, 1,
-0.006533217, -1.028401, -2.724658, 0, 1, 0.8627451, 1,
-0.004097331, 1.159917, -0.4310889, 0, 1, 0.8666667, 1,
-0.002822143, 0.1209469, 0.3200866, 0, 1, 0.8745098, 1,
-0.0008643491, 1.229462, 0.2533296, 0, 1, 0.8784314, 1,
0.001576779, -0.8294699, 2.453552, 0, 1, 0.8862745, 1,
0.001949443, -0.4605345, 2.691165, 0, 1, 0.8901961, 1,
0.002835017, -1.71281, 4.280961, 0, 1, 0.8980392, 1,
0.005061141, -1.555835, 3.1888, 0, 1, 0.9058824, 1,
0.0070088, -0.7966924, 2.478741, 0, 1, 0.9098039, 1,
0.008794801, -1.524491, 3.414385, 0, 1, 0.9176471, 1,
0.009424925, -0.1600211, 3.814227, 0, 1, 0.9215686, 1,
0.009642171, -0.8931382, 2.330693, 0, 1, 0.9294118, 1,
0.0114224, -0.6111318, 2.143681, 0, 1, 0.9333333, 1,
0.01192911, 0.3047223, 0.1944522, 0, 1, 0.9411765, 1,
0.01835619, -0.2381402, 0.7657927, 0, 1, 0.945098, 1,
0.01923615, 0.7076553, -1.712117, 0, 1, 0.9529412, 1,
0.02085726, 0.219869, 0.9338174, 0, 1, 0.9568627, 1,
0.02435514, 1.18981, -0.3508142, 0, 1, 0.9647059, 1,
0.02650777, -0.4316265, 3.024665, 0, 1, 0.9686275, 1,
0.02931004, -1.5013, 2.278875, 0, 1, 0.9764706, 1,
0.03453058, -1.275054, 3.862092, 0, 1, 0.9803922, 1,
0.03712625, -1.242188, 3.744727, 0, 1, 0.9882353, 1,
0.04068282, -0.7360376, 4.77333, 0, 1, 0.9921569, 1,
0.04505929, 1.136314, 0.8045731, 0, 1, 1, 1,
0.04559239, 0.9682081, 0.7153998, 0, 0.9921569, 1, 1,
0.04855781, -0.9795329, 4.690574, 0, 0.9882353, 1, 1,
0.04954516, -1.640135, 2.309347, 0, 0.9803922, 1, 1,
0.05403004, 0.7938401, 1.492348, 0, 0.9764706, 1, 1,
0.05911932, -0.6338007, 3.000115, 0, 0.9686275, 1, 1,
0.0744535, -0.7055151, 3.900599, 0, 0.9647059, 1, 1,
0.07576038, -1.48658, 2.647942, 0, 0.9568627, 1, 1,
0.07752869, -0.02845494, 1.929401, 0, 0.9529412, 1, 1,
0.07757076, 1.171072, -0.06584276, 0, 0.945098, 1, 1,
0.07805005, -0.6691794, 3.012015, 0, 0.9411765, 1, 1,
0.08051276, -0.009407084, 0.3515498, 0, 0.9333333, 1, 1,
0.08243687, 0.7310921, -0.5462713, 0, 0.9294118, 1, 1,
0.08327289, 1.321987, -1.814951, 0, 0.9215686, 1, 1,
0.09077463, -0.5745391, 5.121382, 0, 0.9176471, 1, 1,
0.09549683, -0.0303034, 0.7955313, 0, 0.9098039, 1, 1,
0.09839275, 0.5114174, -1.405088, 0, 0.9058824, 1, 1,
0.09921905, 0.7068206, 0.5529919, 0, 0.8980392, 1, 1,
0.09998809, -0.2177214, 4.319801, 0, 0.8901961, 1, 1,
0.1009685, -0.3293492, 4.055797, 0, 0.8862745, 1, 1,
0.103488, 0.9190155, 0.2732848, 0, 0.8784314, 1, 1,
0.1063779, -0.7215838, 4.691012, 0, 0.8745098, 1, 1,
0.1159705, -0.7562678, 3.177668, 0, 0.8666667, 1, 1,
0.1170486, -1.179137, 2.44258, 0, 0.8627451, 1, 1,
0.1201205, 1.413252, 0.04777525, 0, 0.854902, 1, 1,
0.1210561, 0.1735004, 0.2469526, 0, 0.8509804, 1, 1,
0.1254705, -0.2918817, 1.909602, 0, 0.8431373, 1, 1,
0.1287964, -0.2746046, 2.310832, 0, 0.8392157, 1, 1,
0.129752, 1.028096, 1.476321, 0, 0.8313726, 1, 1,
0.1312012, 0.251082, 0.7954834, 0, 0.827451, 1, 1,
0.1319831, 1.06282, 0.4662555, 0, 0.8196079, 1, 1,
0.1367127, -0.7808264, 2.564779, 0, 0.8156863, 1, 1,
0.1385443, 0.7825692, -1.051657, 0, 0.8078431, 1, 1,
0.1394281, -0.8187216, 2.915452, 0, 0.8039216, 1, 1,
0.1398328, -0.2559806, 2.701187, 0, 0.7960784, 1, 1,
0.1398743, 0.389548, 0.9663231, 0, 0.7882353, 1, 1,
0.1415354, -0.5549486, 4.153934, 0, 0.7843137, 1, 1,
0.1420381, -0.4366543, 2.528569, 0, 0.7764706, 1, 1,
0.1421887, 0.8677666, 1.155355, 0, 0.772549, 1, 1,
0.1455557, 0.476746, 0.294912, 0, 0.7647059, 1, 1,
0.1524849, 0.6775404, -0.7584623, 0, 0.7607843, 1, 1,
0.159234, 0.2260442, 2.247047, 0, 0.7529412, 1, 1,
0.161097, -0.3458174, 2.883889, 0, 0.7490196, 1, 1,
0.1654545, 1.816605, 0.1143067, 0, 0.7411765, 1, 1,
0.1689771, 1.515635, -0.7914239, 0, 0.7372549, 1, 1,
0.1697657, 0.5785917, 1.190845, 0, 0.7294118, 1, 1,
0.1698603, -0.04396956, 2.422625, 0, 0.7254902, 1, 1,
0.1723657, 0.8107621, -0.2858649, 0, 0.7176471, 1, 1,
0.1731595, -0.2068399, 3.029943, 0, 0.7137255, 1, 1,
0.1765077, 1.176566, -1.120012, 0, 0.7058824, 1, 1,
0.1786494, -1.237943, 2.447273, 0, 0.6980392, 1, 1,
0.1796507, -0.6793711, 4.471496, 0, 0.6941177, 1, 1,
0.1839063, -1.061072, 1.169636, 0, 0.6862745, 1, 1,
0.1839454, 0.8599218, -0.2768333, 0, 0.682353, 1, 1,
0.185075, 0.5229037, -0.760309, 0, 0.6745098, 1, 1,
0.187865, -0.2849382, 3.027897, 0, 0.6705883, 1, 1,
0.1893277, 0.3781443, 2.630744, 0, 0.6627451, 1, 1,
0.1935944, 1.017488, 1.309986, 0, 0.6588235, 1, 1,
0.1956123, -0.4860328, 2.797091, 0, 0.6509804, 1, 1,
0.2008138, -1.765335, 3.298609, 0, 0.6470588, 1, 1,
0.2013249, 1.465726, -0.3123963, 0, 0.6392157, 1, 1,
0.204596, -0.003059517, 3.483255, 0, 0.6352941, 1, 1,
0.2054665, 0.8540778, 0.4955729, 0, 0.627451, 1, 1,
0.2074048, -0.4027022, 2.085867, 0, 0.6235294, 1, 1,
0.2127649, -0.1569598, 2.722254, 0, 0.6156863, 1, 1,
0.2143893, 1.051979, -0.4176597, 0, 0.6117647, 1, 1,
0.2145165, -0.4690082, 2.573579, 0, 0.6039216, 1, 1,
0.2180804, -0.4342237, 1.893823, 0, 0.5960785, 1, 1,
0.2215702, 0.1604306, 1.89922, 0, 0.5921569, 1, 1,
0.2220847, 0.5979308, 0.3013126, 0, 0.5843138, 1, 1,
0.2234597, 0.9735215, -1.09471, 0, 0.5803922, 1, 1,
0.2288972, 2.355177, 0.6420935, 0, 0.572549, 1, 1,
0.2344139, 1.572546, 0.2401741, 0, 0.5686275, 1, 1,
0.2363753, -0.8213832, 3.450873, 0, 0.5607843, 1, 1,
0.239317, 1.282044, 1.885653, 0, 0.5568628, 1, 1,
0.240849, 0.92928, -0.07897502, 0, 0.5490196, 1, 1,
0.2574088, 2.33425, 1.282724, 0, 0.5450981, 1, 1,
0.258279, -1.323743, 3.242459, 0, 0.5372549, 1, 1,
0.2610662, 0.360638, 0.5032793, 0, 0.5333334, 1, 1,
0.2615342, -0.8700724, 3.931504, 0, 0.5254902, 1, 1,
0.2653824, -0.8419607, 3.560625, 0, 0.5215687, 1, 1,
0.2658564, 0.8813858, 0.3224042, 0, 0.5137255, 1, 1,
0.2664617, -1.76354, 1.853888, 0, 0.509804, 1, 1,
0.2684021, 0.1813005, 0.09801105, 0, 0.5019608, 1, 1,
0.2691648, 0.1931614, 1.862208, 0, 0.4941176, 1, 1,
0.2695026, -0.3234845, 2.457906, 0, 0.4901961, 1, 1,
0.269614, 2.499547, 1.547381, 0, 0.4823529, 1, 1,
0.2753015, -0.3882401, 3.203246, 0, 0.4784314, 1, 1,
0.2761854, -0.9060706, 1.472205, 0, 0.4705882, 1, 1,
0.2767244, 0.2368093, 0.2758999, 0, 0.4666667, 1, 1,
0.2895485, 0.1963948, 0.05521284, 0, 0.4588235, 1, 1,
0.2955009, -0.04977555, 2.81608, 0, 0.454902, 1, 1,
0.296851, 1.193119, 1.41422, 0, 0.4470588, 1, 1,
0.3023904, -2.288862, 3.249153, 0, 0.4431373, 1, 1,
0.306719, 1.084484, -0.3960881, 0, 0.4352941, 1, 1,
0.3074385, -1.268772, 3.407074, 0, 0.4313726, 1, 1,
0.3134194, 1.16031, -1.424765, 0, 0.4235294, 1, 1,
0.314369, 1.80809, 1.444125, 0, 0.4196078, 1, 1,
0.3145058, 0.1070983, 1.535954, 0, 0.4117647, 1, 1,
0.3147305, -1.139705, 0.8081907, 0, 0.4078431, 1, 1,
0.3168932, -0.006102039, 0.8636584, 0, 0.4, 1, 1,
0.3198622, -1.608539, 3.492459, 0, 0.3921569, 1, 1,
0.3297532, -1.995737, 2.573999, 0, 0.3882353, 1, 1,
0.3306495, 0.5339083, -1.411839, 0, 0.3803922, 1, 1,
0.3311297, -1.551219, 2.52674, 0, 0.3764706, 1, 1,
0.3322059, 1.271399, -1.585243, 0, 0.3686275, 1, 1,
0.3342248, -0.984355, 3.776235, 0, 0.3647059, 1, 1,
0.3386884, -1.081356, 4.124832, 0, 0.3568628, 1, 1,
0.3433125, 0.5605248, 0.179506, 0, 0.3529412, 1, 1,
0.3507338, -0.123319, 3.855093, 0, 0.345098, 1, 1,
0.3509842, -1.417161, 4.74518, 0, 0.3411765, 1, 1,
0.3535475, 0.5979348, 0.5274258, 0, 0.3333333, 1, 1,
0.3546741, 0.7354195, 1.112624, 0, 0.3294118, 1, 1,
0.3557603, 1.321685, 0.9844574, 0, 0.3215686, 1, 1,
0.3568181, 0.4803359, 1.457098, 0, 0.3176471, 1, 1,
0.3569223, 0.7155725, -0.2309927, 0, 0.3098039, 1, 1,
0.3572622, -1.431038, 3.205965, 0, 0.3058824, 1, 1,
0.3578788, -1.329217, 2.120619, 0, 0.2980392, 1, 1,
0.3580012, -0.1805921, 1.52968, 0, 0.2901961, 1, 1,
0.3621364, -0.9459442, 3.606244, 0, 0.2862745, 1, 1,
0.3670737, -0.5400178, 2.393027, 0, 0.2784314, 1, 1,
0.3700294, 0.6666346, 1.887029, 0, 0.2745098, 1, 1,
0.3751827, -0.003542066, 1.875813, 0, 0.2666667, 1, 1,
0.3872738, -0.2352283, 1.399793, 0, 0.2627451, 1, 1,
0.3889136, -1.105971, 3.207958, 0, 0.254902, 1, 1,
0.3910769, 0.9442956, 0.1639031, 0, 0.2509804, 1, 1,
0.392235, -1.779108, 0.8590259, 0, 0.2431373, 1, 1,
0.3938445, -2.198965, 4.655604, 0, 0.2392157, 1, 1,
0.3957547, 0.4072771, 2.11782, 0, 0.2313726, 1, 1,
0.3970801, 2.516551, -0.3335235, 0, 0.227451, 1, 1,
0.3972895, 0.4520122, 1.516578, 0, 0.2196078, 1, 1,
0.3976909, 2.22172, 0.421131, 0, 0.2156863, 1, 1,
0.3986309, 1.921157, -0.9995379, 0, 0.2078431, 1, 1,
0.399948, 0.534766, -1.327005, 0, 0.2039216, 1, 1,
0.4006888, -0.3185364, 0.9879948, 0, 0.1960784, 1, 1,
0.4008292, -2.206284, 3.447567, 0, 0.1882353, 1, 1,
0.4034222, 0.9348521, 1.077278, 0, 0.1843137, 1, 1,
0.4042749, 0.6737576, 0.0118663, 0, 0.1764706, 1, 1,
0.4052689, -0.8708057, 2.360834, 0, 0.172549, 1, 1,
0.4080475, 0.4788139, 1.00514, 0, 0.1647059, 1, 1,
0.4100838, 0.5795234, -1.007998, 0, 0.1607843, 1, 1,
0.4103663, 2.121397, 1.918747, 0, 0.1529412, 1, 1,
0.411426, 0.7687261, 1.156612, 0, 0.1490196, 1, 1,
0.4125345, -0.2267662, 1.426413, 0, 0.1411765, 1, 1,
0.4130138, 0.2212252, 1.58765, 0, 0.1372549, 1, 1,
0.4170169, 1.623886, 0.4052866, 0, 0.1294118, 1, 1,
0.4242588, -0.4354292, 1.341676, 0, 0.1254902, 1, 1,
0.4250799, 1.962979, 0.2470138, 0, 0.1176471, 1, 1,
0.4260491, 0.3532934, 0.5656931, 0, 0.1137255, 1, 1,
0.4263346, -0.4283152, 1.833463, 0, 0.1058824, 1, 1,
0.4357048, -0.7044847, 0.4511386, 0, 0.09803922, 1, 1,
0.4380114, 0.9000444, -1.192214, 0, 0.09411765, 1, 1,
0.4396422, 1.084917, -0.8467507, 0, 0.08627451, 1, 1,
0.4434577, 0.7430521, 1.386381, 0, 0.08235294, 1, 1,
0.4490677, -1.376662, 2.250751, 0, 0.07450981, 1, 1,
0.4536946, 1.682652, 1.212271, 0, 0.07058824, 1, 1,
0.4537594, -1.519026, 1.803744, 0, 0.0627451, 1, 1,
0.4540894, -0.2541754, 1.031627, 0, 0.05882353, 1, 1,
0.4542434, 0.7436618, 0.8749373, 0, 0.05098039, 1, 1,
0.4564595, -1.147768, 2.210994, 0, 0.04705882, 1, 1,
0.4602751, 0.8743232, 0.2808367, 0, 0.03921569, 1, 1,
0.4669047, 1.462417, 0.5032197, 0, 0.03529412, 1, 1,
0.4746711, 1.183708, 0.2917632, 0, 0.02745098, 1, 1,
0.4759977, 0.3871389, 0.06063127, 0, 0.02352941, 1, 1,
0.4779278, -0.6949404, 1.28052, 0, 0.01568628, 1, 1,
0.4794591, -0.8470963, 2.293192, 0, 0.01176471, 1, 1,
0.4810124, -1.265024, 2.20421, 0, 0.003921569, 1, 1,
0.4849033, -1.113915, 3.742662, 0.003921569, 0, 1, 1,
0.487775, -1.090814, 2.629773, 0.007843138, 0, 1, 1,
0.4884747, 1.26788, 0.3898786, 0.01568628, 0, 1, 1,
0.4946222, 0.5809801, 2.01333, 0.01960784, 0, 1, 1,
0.4965161, -1.30416, 2.640855, 0.02745098, 0, 1, 1,
0.50234, 0.3904277, -0.3761915, 0.03137255, 0, 1, 1,
0.504186, 1.656376, -0.3001754, 0.03921569, 0, 1, 1,
0.5062647, -0.5255901, 0.5528556, 0.04313726, 0, 1, 1,
0.5079846, 0.1542847, 2.185324, 0.05098039, 0, 1, 1,
0.5094782, 1.518426, -0.2617815, 0.05490196, 0, 1, 1,
0.5140152, -0.1094915, 1.91979, 0.0627451, 0, 1, 1,
0.5141374, -0.7029058, 1.775017, 0.06666667, 0, 1, 1,
0.515389, 0.4788933, 2.258033, 0.07450981, 0, 1, 1,
0.5160139, -0.4638894, 2.163225, 0.07843138, 0, 1, 1,
0.5235337, -0.778262, 1.750987, 0.08627451, 0, 1, 1,
0.5262143, 0.0866778, 1.205416, 0.09019608, 0, 1, 1,
0.5265826, -0.3084731, 3.324679, 0.09803922, 0, 1, 1,
0.5300241, 2.353823, 1.425286, 0.1058824, 0, 1, 1,
0.5356216, 0.4520071, -0.4375963, 0.1098039, 0, 1, 1,
0.5368937, -0.9306065, 4.40761, 0.1176471, 0, 1, 1,
0.5374976, -0.2946621, 2.389474, 0.1215686, 0, 1, 1,
0.5385582, -1.719812, 3.723099, 0.1294118, 0, 1, 1,
0.5438813, 1.082718, 1.344328, 0.1333333, 0, 1, 1,
0.5441704, 1.458716, 0.503347, 0.1411765, 0, 1, 1,
0.5487142, 0.201137, 0.3087154, 0.145098, 0, 1, 1,
0.5552616, -0.04346572, 0.8056417, 0.1529412, 0, 1, 1,
0.5579704, -1.990062, 1.871924, 0.1568628, 0, 1, 1,
0.5592275, -1.151567, 3.541744, 0.1647059, 0, 1, 1,
0.5595638, 0.9817831, 0.700582, 0.1686275, 0, 1, 1,
0.5628352, 0.1648549, 0.8761273, 0.1764706, 0, 1, 1,
0.573715, 0.05976408, -0.05315902, 0.1803922, 0, 1, 1,
0.584594, -0.6401791, 1.934392, 0.1882353, 0, 1, 1,
0.5859678, 0.4415451, 1.145328, 0.1921569, 0, 1, 1,
0.5859892, 0.2826973, 2.233579, 0.2, 0, 1, 1,
0.5912783, -0.8492889, 3.060013, 0.2078431, 0, 1, 1,
0.5953494, -0.9477263, 2.129383, 0.2117647, 0, 1, 1,
0.6090618, 1.012848, 2.484654, 0.2196078, 0, 1, 1,
0.6095999, -0.5942701, 1.111841, 0.2235294, 0, 1, 1,
0.6112742, -0.7060505, 3.495642, 0.2313726, 0, 1, 1,
0.6123372, -0.1357528, 0.9371393, 0.2352941, 0, 1, 1,
0.6181817, 0.4385814, 1.975828, 0.2431373, 0, 1, 1,
0.6206431, -1.637681, 4.277414, 0.2470588, 0, 1, 1,
0.6254415, -1.264029, 3.351178, 0.254902, 0, 1, 1,
0.6296807, -0.006920371, 0.6405519, 0.2588235, 0, 1, 1,
0.6300606, -1.450585, 2.864164, 0.2666667, 0, 1, 1,
0.6373991, 0.8250376, -1.848091, 0.2705882, 0, 1, 1,
0.6426655, 0.08690855, 2.141785, 0.2784314, 0, 1, 1,
0.6428258, 0.1167722, 0.345565, 0.282353, 0, 1, 1,
0.6440468, -1.548066, 2.476802, 0.2901961, 0, 1, 1,
0.6446098, -1.657545, 2.157452, 0.2941177, 0, 1, 1,
0.6449071, -0.2184176, -0.09216545, 0.3019608, 0, 1, 1,
0.6452844, 0.1995863, -0.2943077, 0.3098039, 0, 1, 1,
0.6484915, -1.699132, 4.835158, 0.3137255, 0, 1, 1,
0.6489693, -1.260272, 2.711192, 0.3215686, 0, 1, 1,
0.649775, -0.2932577, 1.051731, 0.3254902, 0, 1, 1,
0.6498871, -0.4376867, 3.618283, 0.3333333, 0, 1, 1,
0.6671527, -0.6183528, 1.053134, 0.3372549, 0, 1, 1,
0.6679864, 0.8808984, -0.5314632, 0.345098, 0, 1, 1,
0.6801137, 0.3296949, 0.6641803, 0.3490196, 0, 1, 1,
0.6821234, 1.50076, 0.3363638, 0.3568628, 0, 1, 1,
0.6834356, -1.182064, 1.296407, 0.3607843, 0, 1, 1,
0.6888645, 0.07618598, 2.242531, 0.3686275, 0, 1, 1,
0.692012, 0.7185608, 1.618828, 0.372549, 0, 1, 1,
0.6933446, 0.07253266, 2.978602, 0.3803922, 0, 1, 1,
0.7014958, 0.111634, 2.108909, 0.3843137, 0, 1, 1,
0.7060152, -0.2756366, 3.471277, 0.3921569, 0, 1, 1,
0.7066368, 1.816867, 0.42365, 0.3960784, 0, 1, 1,
0.7087275, -0.0358605, 1.778594, 0.4039216, 0, 1, 1,
0.7107378, -1.147025, 4.412387, 0.4117647, 0, 1, 1,
0.7126586, 0.4276443, 1.863076, 0.4156863, 0, 1, 1,
0.714005, -0.9715463, 2.386414, 0.4235294, 0, 1, 1,
0.7161086, 0.3268017, 0.6640314, 0.427451, 0, 1, 1,
0.7172263, -0.04928212, 2.203942, 0.4352941, 0, 1, 1,
0.7308646, 0.04386426, 2.517723, 0.4392157, 0, 1, 1,
0.7340781, 1.199096, -0.5328763, 0.4470588, 0, 1, 1,
0.7346786, 0.113937, -0.4757795, 0.4509804, 0, 1, 1,
0.7367349, -2.190124, 2.46418, 0.4588235, 0, 1, 1,
0.7382172, -1.159898, 3.343544, 0.4627451, 0, 1, 1,
0.7519345, -0.112838, 0.184812, 0.4705882, 0, 1, 1,
0.7542676, -0.6292542, 0.6165876, 0.4745098, 0, 1, 1,
0.761709, -0.6282179, 2.077147, 0.4823529, 0, 1, 1,
0.7647375, -0.8007402, 2.381151, 0.4862745, 0, 1, 1,
0.7658123, 1.877995, -2.032728, 0.4941176, 0, 1, 1,
0.7699332, 0.5868897, 1.450298, 0.5019608, 0, 1, 1,
0.7712891, -0.7400174, 3.664247, 0.5058824, 0, 1, 1,
0.7765926, 0.353688, 2.917309, 0.5137255, 0, 1, 1,
0.7785223, -0.4841768, 2.528139, 0.5176471, 0, 1, 1,
0.7789708, -0.2959791, 1.943563, 0.5254902, 0, 1, 1,
0.779833, -0.7763786, 0.1611728, 0.5294118, 0, 1, 1,
0.7887726, 0.2029642, 1.335996, 0.5372549, 0, 1, 1,
0.7942989, 0.1752201, -0.4023158, 0.5411765, 0, 1, 1,
0.7945635, 0.9305527, 0.7534859, 0.5490196, 0, 1, 1,
0.8123572, 0.6164513, 0.5724183, 0.5529412, 0, 1, 1,
0.8219147, 0.1742963, 1.120036, 0.5607843, 0, 1, 1,
0.8243882, 0.4069157, 0.6294326, 0.5647059, 0, 1, 1,
0.8302852, 1.128202, -0.8175301, 0.572549, 0, 1, 1,
0.8359243, 0.3750993, 0.4586753, 0.5764706, 0, 1, 1,
0.850184, 1.89205, 1.39712, 0.5843138, 0, 1, 1,
0.8517157, -0.3310121, 3.684849, 0.5882353, 0, 1, 1,
0.8574977, -1.090957, 1.463176, 0.5960785, 0, 1, 1,
0.8593536, 0.7970071, 0.287084, 0.6039216, 0, 1, 1,
0.8596919, 0.471744, 0.1701195, 0.6078432, 0, 1, 1,
0.8610444, -0.3911897, 0.73728, 0.6156863, 0, 1, 1,
0.861769, 0.9904057, -0.029925, 0.6196079, 0, 1, 1,
0.864296, 0.4683879, 1.576866, 0.627451, 0, 1, 1,
0.8644859, 0.1531368, 2.804304, 0.6313726, 0, 1, 1,
0.8663816, 1.399479, 2.28633, 0.6392157, 0, 1, 1,
0.8690605, 0.1481145, -0.3671498, 0.6431373, 0, 1, 1,
0.8714199, 1.37614, -0.1248196, 0.6509804, 0, 1, 1,
0.8777449, 1.199566, 0.7101194, 0.654902, 0, 1, 1,
0.8806426, -0.3984855, 1.47146, 0.6627451, 0, 1, 1,
0.8808805, 0.3090841, 1.545377, 0.6666667, 0, 1, 1,
0.8898926, -0.6857411, 2.000136, 0.6745098, 0, 1, 1,
0.8899334, 1.66729, -0.4200774, 0.6784314, 0, 1, 1,
0.8912956, 2.506337, 0.4775104, 0.6862745, 0, 1, 1,
0.8941104, -1.814809, 3.207674, 0.6901961, 0, 1, 1,
0.9034231, -0.4004854, 2.639662, 0.6980392, 0, 1, 1,
0.903827, 0.4131266, 1.985135, 0.7058824, 0, 1, 1,
0.9049655, -0.1541931, 3.350268, 0.7098039, 0, 1, 1,
0.9093171, -1.961541, 1.969287, 0.7176471, 0, 1, 1,
0.9144609, -0.3334545, -0.3369544, 0.7215686, 0, 1, 1,
0.9155176, -0.4979541, 0.9868896, 0.7294118, 0, 1, 1,
0.9171612, 0.8423648, 2.132727, 0.7333333, 0, 1, 1,
0.9248729, 0.1966625, 0.1381539, 0.7411765, 0, 1, 1,
0.9284168, 0.4014311, -1.289322, 0.7450981, 0, 1, 1,
0.9296947, 0.5994159, 2.530237, 0.7529412, 0, 1, 1,
0.9305992, 0.1439072, 2.077001, 0.7568628, 0, 1, 1,
0.933633, 0.579694, 1.267629, 0.7647059, 0, 1, 1,
0.9355254, -0.03316985, 2.286876, 0.7686275, 0, 1, 1,
0.9365339, -0.5973452, 2.081049, 0.7764706, 0, 1, 1,
0.937344, 0.9764443, 1.907826, 0.7803922, 0, 1, 1,
0.941758, -1.276979, 2.663966, 0.7882353, 0, 1, 1,
0.9427855, 0.2913255, 0.1657808, 0.7921569, 0, 1, 1,
0.9443811, 1.032087, 1.230352, 0.8, 0, 1, 1,
0.9463171, 0.1971049, 0.2789023, 0.8078431, 0, 1, 1,
0.9471037, -0.01054934, 2.704114, 0.8117647, 0, 1, 1,
0.9545717, 1.114888, 1.83168, 0.8196079, 0, 1, 1,
0.9658089, -0.881279, 0.8602986, 0.8235294, 0, 1, 1,
0.9697492, -2.162595, 2.994817, 0.8313726, 0, 1, 1,
0.9747896, -0.6925787, 4.5527, 0.8352941, 0, 1, 1,
0.9791641, 0.7382882, 2.054379, 0.8431373, 0, 1, 1,
0.9816737, -1.466324, 2.217734, 0.8470588, 0, 1, 1,
0.9848981, -0.6252688, 2.693067, 0.854902, 0, 1, 1,
0.9884292, 0.3573951, 1.711076, 0.8588235, 0, 1, 1,
0.9885615, 0.7327308, 0.056704, 0.8666667, 0, 1, 1,
0.9908428, 0.6428288, 1.238199, 0.8705882, 0, 1, 1,
0.9937066, 0.9857754, -1.392054, 0.8784314, 0, 1, 1,
0.9963257, 1.108211, 0.5868396, 0.8823529, 0, 1, 1,
1.00238, -0.0765959, 2.373908, 0.8901961, 0, 1, 1,
1.004475, 0.4691842, 2.301956, 0.8941177, 0, 1, 1,
1.005329, 0.06373446, 0.5341883, 0.9019608, 0, 1, 1,
1.008638, -1.080953, 3.812863, 0.9098039, 0, 1, 1,
1.010084, 0.1063508, 1.35867, 0.9137255, 0, 1, 1,
1.016577, 1.536799, -1.903373, 0.9215686, 0, 1, 1,
1.023536, 0.5212496, 2.474221, 0.9254902, 0, 1, 1,
1.02478, 1.233629, 1.571373, 0.9333333, 0, 1, 1,
1.025341, 0.9026872, 0.4436371, 0.9372549, 0, 1, 1,
1.02676, -0.3184989, 2.629727, 0.945098, 0, 1, 1,
1.026997, -1.030965, 1.428606, 0.9490196, 0, 1, 1,
1.034678, -0.7472141, 3.084276, 0.9568627, 0, 1, 1,
1.037151, 1.288516, 0.4210245, 0.9607843, 0, 1, 1,
1.04189, 2.094568, -0.3180015, 0.9686275, 0, 1, 1,
1.043101, 0.2945242, 1.84922, 0.972549, 0, 1, 1,
1.043968, 1.339941, 0.9494688, 0.9803922, 0, 1, 1,
1.052869, -2.233642, 1.834534, 0.9843137, 0, 1, 1,
1.053078, 0.02604212, 0.1755767, 0.9921569, 0, 1, 1,
1.055718, -0.4316412, 2.006751, 0.9960784, 0, 1, 1,
1.057811, 0.06524432, 0.03490039, 1, 0, 0.9960784, 1,
1.059221, -0.3868506, 0.6782404, 1, 0, 0.9882353, 1,
1.061534, 0.3364703, 2.538975, 1, 0, 0.9843137, 1,
1.063297, 0.7410561, 2.47469, 1, 0, 0.9764706, 1,
1.066271, 1.255852, 2.154468, 1, 0, 0.972549, 1,
1.06934, 0.3916512, 2.950298, 1, 0, 0.9647059, 1,
1.08299, -1.428935, 2.526593, 1, 0, 0.9607843, 1,
1.087654, 0.02397153, 1.196345, 1, 0, 0.9529412, 1,
1.09447, 0.2858586, 0.1669866, 1, 0, 0.9490196, 1,
1.09498, 1.842163, -0.8443422, 1, 0, 0.9411765, 1,
1.099789, 0.2639158, 2.773839, 1, 0, 0.9372549, 1,
1.109341, -1.210509, 2.308615, 1, 0, 0.9294118, 1,
1.109977, 0.6791599, 1.834428, 1, 0, 0.9254902, 1,
1.11874, 0.004043998, 0.9478605, 1, 0, 0.9176471, 1,
1.125932, -2.465055, 3.290313, 1, 0, 0.9137255, 1,
1.128159, 0.7495216, 1.652766, 1, 0, 0.9058824, 1,
1.130007, 1.141356, 0.6601307, 1, 0, 0.9019608, 1,
1.132058, 0.8980584, 2.259674, 1, 0, 0.8941177, 1,
1.134281, 0.5513799, -0.3349556, 1, 0, 0.8862745, 1,
1.136333, -0.1669316, 0.6696823, 1, 0, 0.8823529, 1,
1.141846, 1.510873, 1.793441, 1, 0, 0.8745098, 1,
1.154916, -0.8021696, 2.509694, 1, 0, 0.8705882, 1,
1.156702, 0.3427044, 0.176051, 1, 0, 0.8627451, 1,
1.166158, 1.814025, -1.013802, 1, 0, 0.8588235, 1,
1.190935, -0.3546025, 1.820176, 1, 0, 0.8509804, 1,
1.196771, -0.6284142, 1.506098, 1, 0, 0.8470588, 1,
1.199671, -0.4901728, 1.542645, 1, 0, 0.8392157, 1,
1.21551, 0.249, 1.180323, 1, 0, 0.8352941, 1,
1.216216, 1.307379, 1.737023, 1, 0, 0.827451, 1,
1.217849, 0.4769182, 2.917519, 1, 0, 0.8235294, 1,
1.219351, -0.7410384, 1.994197, 1, 0, 0.8156863, 1,
1.220178, -0.1397125, 1.587098, 1, 0, 0.8117647, 1,
1.233781, 0.9569363, -0.5190697, 1, 0, 0.8039216, 1,
1.236124, 0.6884559, 1.509704, 1, 0, 0.7960784, 1,
1.238369, -1.345837, 0.4764566, 1, 0, 0.7921569, 1,
1.244986, -0.9055179, 0.9144679, 1, 0, 0.7843137, 1,
1.245504, -2.283152, 2.205173, 1, 0, 0.7803922, 1,
1.260059, -0.6285614, 2.950037, 1, 0, 0.772549, 1,
1.267507, 0.6598577, 0.9831672, 1, 0, 0.7686275, 1,
1.272889, 1.427773, 0.6070911, 1, 0, 0.7607843, 1,
1.274582, -1.573782, 3.708575, 1, 0, 0.7568628, 1,
1.275173, 1.376169, 1.52164, 1, 0, 0.7490196, 1,
1.277397, 0.53066, 3.410572, 1, 0, 0.7450981, 1,
1.278413, -0.1154784, 1.297912, 1, 0, 0.7372549, 1,
1.283378, 0.4244233, 1.043582, 1, 0, 0.7333333, 1,
1.288381, 0.8962227, 0.473975, 1, 0, 0.7254902, 1,
1.292387, 0.9954084, 1.768543, 1, 0, 0.7215686, 1,
1.292566, 1.626739, -0.2724327, 1, 0, 0.7137255, 1,
1.294317, -1.1386, 0.9138927, 1, 0, 0.7098039, 1,
1.295711, 0.692654, 0.3161907, 1, 0, 0.7019608, 1,
1.297536, -0.7188633, 1.577549, 1, 0, 0.6941177, 1,
1.299536, 0.669719, 2.659473, 1, 0, 0.6901961, 1,
1.302478, 0.4002101, 1.239678, 1, 0, 0.682353, 1,
1.3072, -0.1281654, 2.297957, 1, 0, 0.6784314, 1,
1.312478, -0.8760917, 3.09029, 1, 0, 0.6705883, 1,
1.323002, 2.643468, 0.1175847, 1, 0, 0.6666667, 1,
1.328066, 0.6069225, 0.6619428, 1, 0, 0.6588235, 1,
1.329705, -0.3401591, 2.994955, 1, 0, 0.654902, 1,
1.33001, -1.426902, 4.112024, 1, 0, 0.6470588, 1,
1.331289, -0.141581, 2.252838, 1, 0, 0.6431373, 1,
1.331312, 0.2238896, 0.9714348, 1, 0, 0.6352941, 1,
1.336258, 0.3718081, 3.342415, 1, 0, 0.6313726, 1,
1.340488, 0.5745319, 2.010091, 1, 0, 0.6235294, 1,
1.340896, -0.7916871, 3.087363, 1, 0, 0.6196079, 1,
1.349387, 0.2161432, 1.545979, 1, 0, 0.6117647, 1,
1.351303, -0.5525693, 4.453207, 1, 0, 0.6078432, 1,
1.369198, -0.9422446, 1.837625, 1, 0, 0.6, 1,
1.373204, -0.005646273, 2.014606, 1, 0, 0.5921569, 1,
1.374241, -1.841562, 2.252759, 1, 0, 0.5882353, 1,
1.377675, 0.655759, 1.98574, 1, 0, 0.5803922, 1,
1.377956, 0.08143803, 1.895411, 1, 0, 0.5764706, 1,
1.38629, 0.8882725, 1.715175, 1, 0, 0.5686275, 1,
1.394764, -0.6016447, 1.329293, 1, 0, 0.5647059, 1,
1.403071, 0.4979872, 1.735944, 1, 0, 0.5568628, 1,
1.408856, -0.1410192, 1.022551, 1, 0, 0.5529412, 1,
1.409439, 1.135865, -0.5311394, 1, 0, 0.5450981, 1,
1.411909, 1.765385, 0.9044918, 1, 0, 0.5411765, 1,
1.42352, 0.753645, 2.539665, 1, 0, 0.5333334, 1,
1.427028, 0.4945971, 2.019425, 1, 0, 0.5294118, 1,
1.431233, -0.8398334, 2.075906, 1, 0, 0.5215687, 1,
1.433749, 0.9053113, -0.02154859, 1, 0, 0.5176471, 1,
1.444971, -0.04502901, 2.102344, 1, 0, 0.509804, 1,
1.450629, 1.230354, -0.1398802, 1, 0, 0.5058824, 1,
1.452079, 0.3447659, 1.217722, 1, 0, 0.4980392, 1,
1.453678, 1.003882, 0.8901331, 1, 0, 0.4901961, 1,
1.458351, -1.265822, 0.6925195, 1, 0, 0.4862745, 1,
1.460526, -0.8978005, 2.351093, 1, 0, 0.4784314, 1,
1.46193, 0.2590221, 1.21547, 1, 0, 0.4745098, 1,
1.465852, -0.2864499, 2.487261, 1, 0, 0.4666667, 1,
1.465998, -0.9896552, 2.048767, 1, 0, 0.4627451, 1,
1.468069, 1.035215, 0.7002512, 1, 0, 0.454902, 1,
1.476712, 0.9349686, 0.3757281, 1, 0, 0.4509804, 1,
1.478072, -1.11911, 2.429876, 1, 0, 0.4431373, 1,
1.486857, 2.200027, -0.2933625, 1, 0, 0.4392157, 1,
1.494172, 1.098614, -0.6840521, 1, 0, 0.4313726, 1,
1.494305, -1.737762, 1.566152, 1, 0, 0.427451, 1,
1.49742, -1.07314, 2.265998, 1, 0, 0.4196078, 1,
1.504073, -0.437773, 0.2871238, 1, 0, 0.4156863, 1,
1.520132, -0.8869551, 2.245563, 1, 0, 0.4078431, 1,
1.522627, 0.5632122, 2.001598, 1, 0, 0.4039216, 1,
1.523003, -0.3233629, 2.652624, 1, 0, 0.3960784, 1,
1.526357, 0.7993674, 1.065889, 1, 0, 0.3882353, 1,
1.528869, 1.471738, 0.9216467, 1, 0, 0.3843137, 1,
1.541151, 0.2214039, 1.853886, 1, 0, 0.3764706, 1,
1.544302, -1.050548, 2.99433, 1, 0, 0.372549, 1,
1.578528, 0.07919075, 1.966053, 1, 0, 0.3647059, 1,
1.597766, -0.02130313, 1.259916, 1, 0, 0.3607843, 1,
1.609333, -0.9007811, 1.712772, 1, 0, 0.3529412, 1,
1.611174, 0.1661986, 2.218013, 1, 0, 0.3490196, 1,
1.611329, -0.2856616, 2.715342, 1, 0, 0.3411765, 1,
1.624593, 1.428652, 2.219056, 1, 0, 0.3372549, 1,
1.625821, -1.793464, 1.391309, 1, 0, 0.3294118, 1,
1.626179, 0.7627168, 2.956996, 1, 0, 0.3254902, 1,
1.633463, 0.8226744, 0.5650843, 1, 0, 0.3176471, 1,
1.654209, 1.36456, 1.719803, 1, 0, 0.3137255, 1,
1.656086, -0.6681197, 2.961119, 1, 0, 0.3058824, 1,
1.707257, -0.1073369, 0.4721241, 1, 0, 0.2980392, 1,
1.709611, -1.329912, 1.379669, 1, 0, 0.2941177, 1,
1.71427, 0.7512469, 2.425333, 1, 0, 0.2862745, 1,
1.72384, 0.6464493, 1.060931, 1, 0, 0.282353, 1,
1.738948, 1.070843, 0.0667746, 1, 0, 0.2745098, 1,
1.743352, 0.7945523, 0.3159756, 1, 0, 0.2705882, 1,
1.755722, 1.036486, 2.098946, 1, 0, 0.2627451, 1,
1.758943, -1.190293, 1.069348, 1, 0, 0.2588235, 1,
1.761603, -0.7656466, 2.159788, 1, 0, 0.2509804, 1,
1.768188, -0.3619843, 1.338685, 1, 0, 0.2470588, 1,
1.772075, 0.9361451, 0.9611586, 1, 0, 0.2392157, 1,
1.785764, -1.35748, 4.043235, 1, 0, 0.2352941, 1,
1.797668, 0.1863157, 2.204937, 1, 0, 0.227451, 1,
1.798659, -0.04765673, 1.172133, 1, 0, 0.2235294, 1,
1.81318, -0.7148272, 3.049021, 1, 0, 0.2156863, 1,
1.815116, 0.8815596, 2.734851, 1, 0, 0.2117647, 1,
1.831071, 0.7035691, 0.6903193, 1, 0, 0.2039216, 1,
1.833826, 0.190101, 3.18892, 1, 0, 0.1960784, 1,
1.836707, -1.120836, -0.04517672, 1, 0, 0.1921569, 1,
1.844894, 0.5334213, 2.114988, 1, 0, 0.1843137, 1,
1.875294, -1.836949, 1.65642, 1, 0, 0.1803922, 1,
1.885276, 0.9523178, 0.573716, 1, 0, 0.172549, 1,
1.964893, 0.4374496, 0.07888547, 1, 0, 0.1686275, 1,
1.965607, 0.1811249, 0.7799808, 1, 0, 0.1607843, 1,
1.969173, 0.3739595, 1.467588, 1, 0, 0.1568628, 1,
1.976674, -0.2818488, 2.482611, 1, 0, 0.1490196, 1,
1.982136, -0.5007076, 2.575077, 1, 0, 0.145098, 1,
1.992979, -0.82008, 4.09933, 1, 0, 0.1372549, 1,
2.018374, 0.7059916, 1.182781, 1, 0, 0.1333333, 1,
2.021386, -0.2390094, 1.646054, 1, 0, 0.1254902, 1,
2.023705, 1.275138, 1.775359, 1, 0, 0.1215686, 1,
2.049701, -0.8922395, 2.518523, 1, 0, 0.1137255, 1,
2.160798, -0.2109382, -0.9103255, 1, 0, 0.1098039, 1,
2.200531, -0.4087963, 1.22628, 1, 0, 0.1019608, 1,
2.204191, -1.312768, 1.02691, 1, 0, 0.09411765, 1,
2.21026, -1.720695, 1.910808, 1, 0, 0.09019608, 1,
2.273696, 0.8637865, -0.2895322, 1, 0, 0.08235294, 1,
2.321788, -1.022118, 1.472075, 1, 0, 0.07843138, 1,
2.422675, -1.441678, 0.4241617, 1, 0, 0.07058824, 1,
2.442494, -0.07360969, -0.3641508, 1, 0, 0.06666667, 1,
2.478475, 1.819844, 0.6404645, 1, 0, 0.05882353, 1,
2.502741, 0.1846635, 3.029057, 1, 0, 0.05490196, 1,
2.538053, -0.8476064, 3.624213, 1, 0, 0.04705882, 1,
2.634851, 0.7242699, 1.126163, 1, 0, 0.04313726, 1,
2.640986, 0.3671202, 0.1183375, 1, 0, 0.03529412, 1,
2.715219, -0.09910084, 1.97089, 1, 0, 0.03137255, 1,
2.821351, 0.4284067, 1.667908, 1, 0, 0.02352941, 1,
2.958049, 0.8342245, 1.082551, 1, 0, 0.01960784, 1,
3.111864, -0.799401, 1.322931, 1, 0, 0.01176471, 1,
5.027736, -1.195122, 3.297243, 1, 0, 0.007843138, 1
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
1.138945, -4.329964, -8.491867, 0, -0.5, 0.5, 0.5,
1.138945, -4.329964, -8.491867, 1, -0.5, 0.5, 0.5,
1.138945, -4.329964, -8.491867, 1, 1.5, 0.5, 0.5,
1.138945, -4.329964, -8.491867, 0, 1.5, 0.5, 0.5
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
-4.068145, -0.3379052, -8.491867, 0, -0.5, 0.5, 0.5,
-4.068145, -0.3379052, -8.491867, 1, -0.5, 0.5, 0.5,
-4.068145, -0.3379052, -8.491867, 1, 1.5, 0.5, 0.5,
-4.068145, -0.3379052, -8.491867, 0, 1.5, 0.5, 0.5
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
-4.068145, -4.329964, -0.6987331, 0, -0.5, 0.5, 0.5,
-4.068145, -4.329964, -0.6987331, 1, -0.5, 0.5, 0.5,
-4.068145, -4.329964, -0.6987331, 1, 1.5, 0.5, 0.5,
-4.068145, -4.329964, -0.6987331, 0, 1.5, 0.5, 0.5
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
-2, -3.40872, -6.693452,
4, -3.40872, -6.693452,
-2, -3.40872, -6.693452,
-2, -3.56226, -6.993188,
0, -3.40872, -6.693452,
0, -3.56226, -6.993188,
2, -3.40872, -6.693452,
2, -3.56226, -6.993188,
4, -3.40872, -6.693452,
4, -3.56226, -6.993188
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
"2",
"4"
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
-2, -3.869342, -7.592659, 0, -0.5, 0.5, 0.5,
-2, -3.869342, -7.592659, 1, -0.5, 0.5, 0.5,
-2, -3.869342, -7.592659, 1, 1.5, 0.5, 0.5,
-2, -3.869342, -7.592659, 0, 1.5, 0.5, 0.5,
0, -3.869342, -7.592659, 0, -0.5, 0.5, 0.5,
0, -3.869342, -7.592659, 1, -0.5, 0.5, 0.5,
0, -3.869342, -7.592659, 1, 1.5, 0.5, 0.5,
0, -3.869342, -7.592659, 0, 1.5, 0.5, 0.5,
2, -3.869342, -7.592659, 0, -0.5, 0.5, 0.5,
2, -3.869342, -7.592659, 1, -0.5, 0.5, 0.5,
2, -3.869342, -7.592659, 1, 1.5, 0.5, 0.5,
2, -3.869342, -7.592659, 0, 1.5, 0.5, 0.5,
4, -3.869342, -7.592659, 0, -0.5, 0.5, 0.5,
4, -3.869342, -7.592659, 1, -0.5, 0.5, 0.5,
4, -3.869342, -7.592659, 1, 1.5, 0.5, 0.5,
4, -3.869342, -7.592659, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-2.866508, -3, -6.693452,
-2.866508, 2, -6.693452,
-2.866508, -3, -6.693452,
-3.066781, -3, -6.993188,
-2.866508, -2, -6.693452,
-3.066781, -2, -6.993188,
-2.866508, -1, -6.693452,
-3.066781, -1, -6.993188,
-2.866508, 0, -6.693452,
-3.066781, 0, -6.993188,
-2.866508, 1, -6.693452,
-3.066781, 1, -6.993188,
-2.866508, 2, -6.693452,
-3.066781, 2, -6.993188
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
-3.467327, -3, -7.592659, 0, -0.5, 0.5, 0.5,
-3.467327, -3, -7.592659, 1, -0.5, 0.5, 0.5,
-3.467327, -3, -7.592659, 1, 1.5, 0.5, 0.5,
-3.467327, -3, -7.592659, 0, 1.5, 0.5, 0.5,
-3.467327, -2, -7.592659, 0, -0.5, 0.5, 0.5,
-3.467327, -2, -7.592659, 1, -0.5, 0.5, 0.5,
-3.467327, -2, -7.592659, 1, 1.5, 0.5, 0.5,
-3.467327, -2, -7.592659, 0, 1.5, 0.5, 0.5,
-3.467327, -1, -7.592659, 0, -0.5, 0.5, 0.5,
-3.467327, -1, -7.592659, 1, -0.5, 0.5, 0.5,
-3.467327, -1, -7.592659, 1, 1.5, 0.5, 0.5,
-3.467327, -1, -7.592659, 0, 1.5, 0.5, 0.5,
-3.467327, 0, -7.592659, 0, -0.5, 0.5, 0.5,
-3.467327, 0, -7.592659, 1, -0.5, 0.5, 0.5,
-3.467327, 0, -7.592659, 1, 1.5, 0.5, 0.5,
-3.467327, 0, -7.592659, 0, 1.5, 0.5, 0.5,
-3.467327, 1, -7.592659, 0, -0.5, 0.5, 0.5,
-3.467327, 1, -7.592659, 1, -0.5, 0.5, 0.5,
-3.467327, 1, -7.592659, 1, 1.5, 0.5, 0.5,
-3.467327, 1, -7.592659, 0, 1.5, 0.5, 0.5,
-3.467327, 2, -7.592659, 0, -0.5, 0.5, 0.5,
-3.467327, 2, -7.592659, 1, -0.5, 0.5, 0.5,
-3.467327, 2, -7.592659, 1, 1.5, 0.5, 0.5,
-3.467327, 2, -7.592659, 0, 1.5, 0.5, 0.5
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
-2.866508, -3.40872, -6,
-2.866508, -3.40872, 4,
-2.866508, -3.40872, -6,
-3.066781, -3.56226, -6,
-2.866508, -3.40872, -4,
-3.066781, -3.56226, -4,
-2.866508, -3.40872, -2,
-3.066781, -3.56226, -2,
-2.866508, -3.40872, 0,
-3.066781, -3.56226, 0,
-2.866508, -3.40872, 2,
-3.066781, -3.56226, 2,
-2.866508, -3.40872, 4,
-3.066781, -3.56226, 4
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
"-6",
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
-3.467327, -3.869342, -6, 0, -0.5, 0.5, 0.5,
-3.467327, -3.869342, -6, 1, -0.5, 0.5, 0.5,
-3.467327, -3.869342, -6, 1, 1.5, 0.5, 0.5,
-3.467327, -3.869342, -6, 0, 1.5, 0.5, 0.5,
-3.467327, -3.869342, -4, 0, -0.5, 0.5, 0.5,
-3.467327, -3.869342, -4, 1, -0.5, 0.5, 0.5,
-3.467327, -3.869342, -4, 1, 1.5, 0.5, 0.5,
-3.467327, -3.869342, -4, 0, 1.5, 0.5, 0.5,
-3.467327, -3.869342, -2, 0, -0.5, 0.5, 0.5,
-3.467327, -3.869342, -2, 1, -0.5, 0.5, 0.5,
-3.467327, -3.869342, -2, 1, 1.5, 0.5, 0.5,
-3.467327, -3.869342, -2, 0, 1.5, 0.5, 0.5,
-3.467327, -3.869342, 0, 0, -0.5, 0.5, 0.5,
-3.467327, -3.869342, 0, 1, -0.5, 0.5, 0.5,
-3.467327, -3.869342, 0, 1, 1.5, 0.5, 0.5,
-3.467327, -3.869342, 0, 0, 1.5, 0.5, 0.5,
-3.467327, -3.869342, 2, 0, -0.5, 0.5, 0.5,
-3.467327, -3.869342, 2, 1, -0.5, 0.5, 0.5,
-3.467327, -3.869342, 2, 1, 1.5, 0.5, 0.5,
-3.467327, -3.869342, 2, 0, 1.5, 0.5, 0.5,
-3.467327, -3.869342, 4, 0, -0.5, 0.5, 0.5,
-3.467327, -3.869342, 4, 1, -0.5, 0.5, 0.5,
-3.467327, -3.869342, 4, 1, 1.5, 0.5, 0.5,
-3.467327, -3.869342, 4, 0, 1.5, 0.5, 0.5
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
-2.866508, -3.40872, -6.693452,
-2.866508, 2.732909, -6.693452,
-2.866508, -3.40872, 5.295986,
-2.866508, 2.732909, 5.295986,
-2.866508, -3.40872, -6.693452,
-2.866508, -3.40872, 5.295986,
-2.866508, 2.732909, -6.693452,
-2.866508, 2.732909, 5.295986,
-2.866508, -3.40872, -6.693452,
5.1444, -3.40872, -6.693452,
-2.866508, -3.40872, 5.295986,
5.1444, -3.40872, 5.295986,
-2.866508, 2.732909, -6.693452,
5.1444, 2.732909, -6.693452,
-2.866508, 2.732909, 5.295986,
5.1444, 2.732909, 5.295986,
5.1444, -3.40872, -6.693452,
5.1444, 2.732909, -6.693452,
5.1444, -3.40872, 5.295986,
5.1444, 2.732909, 5.295986,
5.1444, -3.40872, -6.693452,
5.1444, -3.40872, 5.295986,
5.1444, 2.732909, -6.693452,
5.1444, 2.732909, 5.295986
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
var radius = 8.369042;
var distance = 37.23481;
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
mvMatrix.translate( -1.138945, 0.3379052, 0.6987331 );
mvMatrix.scale( 1.129556, 1.473351, 0.7547287 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.23481);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Triadimenol<-read.table("Triadimenol.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Triadimenol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Triadimenol' not found
```

```r
y<-Triadimenol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Triadimenol' not found
```

```r
z<-Triadimenol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Triadimenol' not found
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
-2.749845, 0.5883086, -1.249385, 0, 0, 1, 1, 1,
-2.676812, -0.9441715, -2.113863, 1, 0, 0, 1, 1,
-2.647218, 0.8237709, -2.213638, 1, 0, 0, 1, 1,
-2.531916, -0.1725784, -2.661463, 1, 0, 0, 1, 1,
-2.43604, -0.6882102, -2.11025, 1, 0, 0, 1, 1,
-2.415193, -0.2632488, -1.590467, 1, 0, 0, 1, 1,
-2.298065, -2.151, -2.656981, 0, 0, 0, 1, 1,
-2.274886, 1.316909, -0.9831135, 0, 0, 0, 1, 1,
-2.271649, 0.2689284, -0.853817, 0, 0, 0, 1, 1,
-2.227916, -0.6820741, -2.90466, 0, 0, 0, 1, 1,
-2.215949, 1.527197, -0.1427397, 0, 0, 0, 1, 1,
-2.184078, 0.1306653, -1.125685, 0, 0, 0, 1, 1,
-2.151244, 1.100008, -1.126959, 0, 0, 0, 1, 1,
-2.101073, 2.359718, -1.207199, 1, 1, 1, 1, 1,
-2.083667, -0.12613, -2.295751, 1, 1, 1, 1, 1,
-2.026511, -0.3941249, -1.479671, 1, 1, 1, 1, 1,
-2.023368, 1.598227, -1.229458, 1, 1, 1, 1, 1,
-2.004405, -0.7160248, -1.122474, 1, 1, 1, 1, 1,
-1.972959, -0.3725776, -2.034929, 1, 1, 1, 1, 1,
-1.971915, 0.3849165, -2.82079, 1, 1, 1, 1, 1,
-1.967824, 0.4724067, -0.6359414, 1, 1, 1, 1, 1,
-1.945645, -0.7456338, -3.53838, 1, 1, 1, 1, 1,
-1.923848, -1.461186, -2.94815, 1, 1, 1, 1, 1,
-1.902349, 0.2742743, -0.9571788, 1, 1, 1, 1, 1,
-1.901083, 1.280238, -1.524805, 1, 1, 1, 1, 1,
-1.880453, -0.7979732, -2.415241, 1, 1, 1, 1, 1,
-1.875649, 0.1817769, -1.270951, 1, 1, 1, 1, 1,
-1.851563, -2.800279, -1.894068, 1, 1, 1, 1, 1,
-1.840849, -1.549761, -1.417104, 0, 0, 1, 1, 1,
-1.838277, 0.5688502, -1.424107, 1, 0, 0, 1, 1,
-1.83393, 0.35056, -0.144256, 1, 0, 0, 1, 1,
-1.822616, -0.1887135, -2.327413, 1, 0, 0, 1, 1,
-1.821702, -0.7328543, -1.016742, 1, 0, 0, 1, 1,
-1.811805, -0.8931049, -2.461466, 1, 0, 0, 1, 1,
-1.790679, 1.847617, -2.512789, 0, 0, 0, 1, 1,
-1.732325, -0.1517941, -0.621632, 0, 0, 0, 1, 1,
-1.73221, -0.7313027, -2.474871, 0, 0, 0, 1, 1,
-1.724216, 0.3006681, -2.063581, 0, 0, 0, 1, 1,
-1.723691, 0.120686, -1.469207, 0, 0, 0, 1, 1,
-1.711922, -0.8078257, -2.070895, 0, 0, 0, 1, 1,
-1.707424, 0.04299239, -2.731667, 0, 0, 0, 1, 1,
-1.695335, -1.208095, -2.254914, 1, 1, 1, 1, 1,
-1.688806, 0.1977193, -2.013281, 1, 1, 1, 1, 1,
-1.661815, -0.2542599, -2.16382, 1, 1, 1, 1, 1,
-1.661486, 1.626868, -1.241968, 1, 1, 1, 1, 1,
-1.644267, 1.426019, -4.010861, 1, 1, 1, 1, 1,
-1.637959, 0.2632083, -1.353873, 1, 1, 1, 1, 1,
-1.631358, 0.1690148, -1.189571, 1, 1, 1, 1, 1,
-1.627668, 0.9911801, -1.609835, 1, 1, 1, 1, 1,
-1.627061, -1.397672, -1.360905, 1, 1, 1, 1, 1,
-1.626568, 0.3800831, -1.730062, 1, 1, 1, 1, 1,
-1.618062, 0.8119056, -1.773031, 1, 1, 1, 1, 1,
-1.608283, -1.193589, -0.3360668, 1, 1, 1, 1, 1,
-1.606826, 0.561618, -2.253374, 1, 1, 1, 1, 1,
-1.602521, -0.4721511, -0.4092571, 1, 1, 1, 1, 1,
-1.563229, 0.9179353, -1.747651, 1, 1, 1, 1, 1,
-1.560634, 0.6126533, -1.35968, 0, 0, 1, 1, 1,
-1.529471, -1.658478, -3.906677, 1, 0, 0, 1, 1,
-1.527119, 0.3920621, -0.5657036, 1, 0, 0, 1, 1,
-1.506916, 0.05719001, -2.061457, 1, 0, 0, 1, 1,
-1.50121, -1.178744, -1.033366, 1, 0, 0, 1, 1,
-1.49452, 0.5499379, 0.2508004, 1, 0, 0, 1, 1,
-1.493487, -0.4907453, -2.265578, 0, 0, 0, 1, 1,
-1.482795, -0.3127962, -1.88747, 0, 0, 0, 1, 1,
-1.461796, -0.9508677, -2.272017, 0, 0, 0, 1, 1,
-1.461525, -0.7935922, -3.274567, 0, 0, 0, 1, 1,
-1.445922, 0.7462323, -3.897701, 0, 0, 0, 1, 1,
-1.445599, 0.5003096, -1.630095, 0, 0, 0, 1, 1,
-1.445267, -0.890521, -2.476753, 0, 0, 0, 1, 1,
-1.430547, 1.307992, -0.9910006, 1, 1, 1, 1, 1,
-1.424307, -0.009125641, -2.165415, 1, 1, 1, 1, 1,
-1.410548, 0.523525, -2.807048, 1, 1, 1, 1, 1,
-1.398919, -0.05633301, -0.6159545, 1, 1, 1, 1, 1,
-1.383651, 1.529918, 0.2518039, 1, 1, 1, 1, 1,
-1.382122, -0.4246502, -1.568864, 1, 1, 1, 1, 1,
-1.381575, -0.05986156, -1.715355, 1, 1, 1, 1, 1,
-1.378568, 0.6511176, -3.088988, 1, 1, 1, 1, 1,
-1.372609, 1.007124, -1.294165, 1, 1, 1, 1, 1,
-1.370748, 0.7514207, -0.9974098, 1, 1, 1, 1, 1,
-1.370222, 1.327201, -0.9941198, 1, 1, 1, 1, 1,
-1.367053, 1.458899, -1.681502, 1, 1, 1, 1, 1,
-1.362746, 2.498009, -1.030258, 1, 1, 1, 1, 1,
-1.356552, 1.061242, -1.162904, 1, 1, 1, 1, 1,
-1.336093, -1.185672, -1.672586, 1, 1, 1, 1, 1,
-1.335195, 1.13562, 0.6884742, 0, 0, 1, 1, 1,
-1.328975, 0.5741765, -1.399949, 1, 0, 0, 1, 1,
-1.327177, 0.9169095, -0.418833, 1, 0, 0, 1, 1,
-1.313037, 0.3953923, -0.6744744, 1, 0, 0, 1, 1,
-1.312784, -0.380569, -2.320821, 1, 0, 0, 1, 1,
-1.288686, 0.4009737, -0.8262983, 1, 0, 0, 1, 1,
-1.285469, -1.617572, -3.337093, 0, 0, 0, 1, 1,
-1.284316, -1.021678, -1.671469, 0, 0, 0, 1, 1,
-1.281591, -1.15891, -2.863545, 0, 0, 0, 1, 1,
-1.279005, -0.4500327, -1.739758, 0, 0, 0, 1, 1,
-1.274355, -0.270136, -2.127815, 0, 0, 0, 1, 1,
-1.26932, -0.2295658, -1.142251, 0, 0, 0, 1, 1,
-1.264341, -0.6975769, -2.332381, 0, 0, 0, 1, 1,
-1.260056, -1.408613, -4.133484, 1, 1, 1, 1, 1,
-1.259303, -0.1024481, -0.2791654, 1, 1, 1, 1, 1,
-1.255641, 0.3323629, -1.816497, 1, 1, 1, 1, 1,
-1.251086, 0.0575786, -2.654909, 1, 1, 1, 1, 1,
-1.244977, 1.536845, -2.274417, 1, 1, 1, 1, 1,
-1.244702, 0.1653961, -2.450994, 1, 1, 1, 1, 1,
-1.244211, 0.3236155, -0.6002098, 1, 1, 1, 1, 1,
-1.238283, -0.7024423, -2.813195, 1, 1, 1, 1, 1,
-1.235858, -1.7348, -0.640493, 1, 1, 1, 1, 1,
-1.231474, -0.07910968, -1.055337, 1, 1, 1, 1, 1,
-1.227209, -0.8665121, -1.356102, 1, 1, 1, 1, 1,
-1.222115, 0.07858673, -1.086183, 1, 1, 1, 1, 1,
-1.219795, 0.1200201, -1.574795, 1, 1, 1, 1, 1,
-1.212279, -0.2083533, -2.595741, 1, 1, 1, 1, 1,
-1.199132, -0.5370917, -1.592427, 1, 1, 1, 1, 1,
-1.193835, 1.106126, -1.938587, 0, 0, 1, 1, 1,
-1.183531, 0.8574942, -1.070912, 1, 0, 0, 1, 1,
-1.180773, 0.5576997, -1.613824, 1, 0, 0, 1, 1,
-1.179675, 1.764745, -2.068769, 1, 0, 0, 1, 1,
-1.174084, -2.284409, -2.867705, 1, 0, 0, 1, 1,
-1.170744, -0.368049, -1.535591, 1, 0, 0, 1, 1,
-1.170615, 0.728062, 0.9952253, 0, 0, 0, 1, 1,
-1.1644, -0.2662069, -2.351998, 0, 0, 0, 1, 1,
-1.162434, 1.138874, 0.4342217, 0, 0, 0, 1, 1,
-1.155805, -0.316478, -1.179601, 0, 0, 0, 1, 1,
-1.151397, -0.6050465, -3.124865, 0, 0, 0, 1, 1,
-1.146058, 1.549851, -1.958685, 0, 0, 0, 1, 1,
-1.143288, 2.148699, -1.299489, 0, 0, 0, 1, 1,
-1.137058, 1.013859, -2.441676, 1, 1, 1, 1, 1,
-1.128984, -0.5737528, -1.318197, 1, 1, 1, 1, 1,
-1.117036, -1.230049, -3.098849, 1, 1, 1, 1, 1,
-1.1081, -0.8517559, -2.030744, 1, 1, 1, 1, 1,
-1.107941, 0.1573775, -2.242854, 1, 1, 1, 1, 1,
-1.096275, -0.8024576, 0.7512798, 1, 1, 1, 1, 1,
-1.093402, -0.1970291, -2.53309, 1, 1, 1, 1, 1,
-1.093355, 1.579113, -2.314125, 1, 1, 1, 1, 1,
-1.09238, -0.6218884, -3.849345, 1, 1, 1, 1, 1,
-1.090865, 0.5097531, -1.333473, 1, 1, 1, 1, 1,
-1.084516, 0.2518438, -2.793219, 1, 1, 1, 1, 1,
-1.077337, -2.022479, -1.702189, 1, 1, 1, 1, 1,
-1.067637, 0.9583014, 1.398643, 1, 1, 1, 1, 1,
-1.063422, 0.0599154, 1.5113, 1, 1, 1, 1, 1,
-1.055218, 1.077331, 0.1966934, 1, 1, 1, 1, 1,
-1.054238, -0.6160932, -3.298041, 0, 0, 1, 1, 1,
-1.05169, 0.5196036, -1.121024, 1, 0, 0, 1, 1,
-1.051334, -1.67629, -2.525662, 1, 0, 0, 1, 1,
-1.047315, 0.9466429, -0.4477864, 1, 0, 0, 1, 1,
-1.043411, 0.3108878, -1.254516, 1, 0, 0, 1, 1,
-1.039965, -1.353933, -2.885176, 1, 0, 0, 1, 1,
-1.023958, 1.287231, -0.09519348, 0, 0, 0, 1, 1,
-1.014715, 0.1185151, -0.405795, 0, 0, 0, 1, 1,
-1.012156, 0.1604995, -1.944047, 0, 0, 0, 1, 1,
-1.01211, -1.122132, -2.421993, 0, 0, 0, 1, 1,
-1.005851, 0.7448261, -0.6600655, 0, 0, 0, 1, 1,
-1.003564, 0.3449963, 0.3182369, 0, 0, 0, 1, 1,
-1.002414, 0.05165561, -1.214333, 0, 0, 0, 1, 1,
-0.9994111, -1.052626, -2.191058, 1, 1, 1, 1, 1,
-0.987842, -1.192013, -2.551424, 1, 1, 1, 1, 1,
-0.984766, -0.4606411, -2.000569, 1, 1, 1, 1, 1,
-0.9762432, 1.314983, 0.2226133, 1, 1, 1, 1, 1,
-0.9744152, -1.446817, -2.303551, 1, 1, 1, 1, 1,
-0.9577527, 0.4304896, 0.1785682, 1, 1, 1, 1, 1,
-0.9562994, 2.204159, -2.346329, 1, 1, 1, 1, 1,
-0.955456, -0.4940787, -1.633571, 1, 1, 1, 1, 1,
-0.9420195, -0.7301184, -3.284624, 1, 1, 1, 1, 1,
-0.9378988, -0.5647842, -2.499907, 1, 1, 1, 1, 1,
-0.9349635, -1.050231, -2.885821, 1, 1, 1, 1, 1,
-0.9129437, 0.1574312, 0.6704081, 1, 1, 1, 1, 1,
-0.9086679, 1.710265, 0.07999267, 1, 1, 1, 1, 1,
-0.9037561, 0.774995, -0.7672971, 1, 1, 1, 1, 1,
-0.9033126, 1.137592, -0.4966636, 1, 1, 1, 1, 1,
-0.8959758, -0.4410321, -1.233116, 0, 0, 1, 1, 1,
-0.8953756, -0.05420301, -0.6189771, 1, 0, 0, 1, 1,
-0.8890911, 1.498692, 0.5902876, 1, 0, 0, 1, 1,
-0.8820795, -0.876007, -1.750425, 1, 0, 0, 1, 1,
-0.8794531, 0.3948435, -1.280191, 1, 0, 0, 1, 1,
-0.8702903, -0.405311, -0.172599, 1, 0, 0, 1, 1,
-0.8696088, 2.510695, 0.5122175, 0, 0, 0, 1, 1,
-0.8662278, 0.1403238, -1.996251, 0, 0, 0, 1, 1,
-0.8558938, -0.600539, -2.323664, 0, 0, 0, 1, 1,
-0.8499497, 0.8751042, 1.866761, 0, 0, 0, 1, 1,
-0.8404821, 0.08825964, -1.392352, 0, 0, 0, 1, 1,
-0.8388787, 0.9904661, 0.6125534, 0, 0, 0, 1, 1,
-0.8350668, -0.4361054, -1.800132, 0, 0, 0, 1, 1,
-0.8112031, -1.16213, -3.174018, 1, 1, 1, 1, 1,
-0.8108807, 0.3107698, -1.382323, 1, 1, 1, 1, 1,
-0.8049291, 1.158207, -2.155632, 1, 1, 1, 1, 1,
-0.7977279, -0.03139185, -1.420957, 1, 1, 1, 1, 1,
-0.7971299, -0.8013684, -2.461559, 1, 1, 1, 1, 1,
-0.790641, 1.193171, -1.064126, 1, 1, 1, 1, 1,
-0.7900255, -1.010068, -2.525285, 1, 1, 1, 1, 1,
-0.7848379, -0.7616665, -2.51551, 1, 1, 1, 1, 1,
-0.7838085, 0.1586972, -1.597152, 1, 1, 1, 1, 1,
-0.7837433, -2.668298, -3.024251, 1, 1, 1, 1, 1,
-0.7705655, 0.0702088, -2.79728, 1, 1, 1, 1, 1,
-0.7692617, -0.7038431, -1.67792, 1, 1, 1, 1, 1,
-0.766664, -0.2513341, -2.606734, 1, 1, 1, 1, 1,
-0.7625028, -0.3566027, -1.21319, 1, 1, 1, 1, 1,
-0.752468, 1.554147, -0.1378845, 1, 1, 1, 1, 1,
-0.7505203, -0.09987498, -0.4414074, 0, 0, 1, 1, 1,
-0.744101, 1.131566, -1.282313, 1, 0, 0, 1, 1,
-0.7428331, 1.606551, 0.1554668, 1, 0, 0, 1, 1,
-0.7359525, -0.8397224, -3.140581, 1, 0, 0, 1, 1,
-0.7349873, 1.478199, 0.4331236, 1, 0, 0, 1, 1,
-0.7299343, -1.039522, -4.352864, 1, 0, 0, 1, 1,
-0.7189264, 0.9925226, -0.4059293, 0, 0, 0, 1, 1,
-0.7123803, 2.417344, -0.4715246, 0, 0, 0, 1, 1,
-0.7099831, -0.3641862, -1.563498, 0, 0, 0, 1, 1,
-0.7088839, -1.016336, -0.7591231, 0, 0, 0, 1, 1,
-0.7047392, 1.592808, -1.246095, 0, 0, 0, 1, 1,
-0.7043691, -0.7607888, -1.485758, 0, 0, 0, 1, 1,
-0.7001753, -0.4121412, -1.411561, 0, 0, 0, 1, 1,
-0.7001247, 0.4057304, -0.9175971, 1, 1, 1, 1, 1,
-0.6916936, 1.707428, -0.4688935, 1, 1, 1, 1, 1,
-0.6803671, 0.8263211, -0.1729007, 1, 1, 1, 1, 1,
-0.6766142, 0.1267003, -0.4200389, 1, 1, 1, 1, 1,
-0.6756047, -0.1450737, -2.182102, 1, 1, 1, 1, 1,
-0.6735299, -0.3761999, -3.251591, 1, 1, 1, 1, 1,
-0.6734128, -0.1565596, -2.964302, 1, 1, 1, 1, 1,
-0.6676878, 0.7028205, -2.840368, 1, 1, 1, 1, 1,
-0.6638649, -0.5439782, -2.709404, 1, 1, 1, 1, 1,
-0.6634743, 0.3700622, -1.055689, 1, 1, 1, 1, 1,
-0.6622702, -0.07273914, 0.04714898, 1, 1, 1, 1, 1,
-0.6552779, 1.326675, -1.049294, 1, 1, 1, 1, 1,
-0.6529655, -0.3105965, -1.723432, 1, 1, 1, 1, 1,
-0.6514375, 1.595373, -1.514873, 1, 1, 1, 1, 1,
-0.6479048, 1.515103, -0.7719346, 1, 1, 1, 1, 1,
-0.6475615, -0.09930283, -3.373521, 0, 0, 1, 1, 1,
-0.6456583, -0.5313503, -2.921139, 1, 0, 0, 1, 1,
-0.644285, -1.245618, -2.394013, 1, 0, 0, 1, 1,
-0.6394517, 0.4672537, -1.928591, 1, 0, 0, 1, 1,
-0.6382845, 1.831541, -0.8465887, 1, 0, 0, 1, 1,
-0.6372455, 0.7766711, -0.8092769, 1, 0, 0, 1, 1,
-0.6365966, -1.289529, -2.746013, 0, 0, 0, 1, 1,
-0.6357737, 0.04980548, 0.1591519, 0, 0, 0, 1, 1,
-0.6324469, 0.5207754, 0.1307932, 0, 0, 0, 1, 1,
-0.6313734, 0.3771293, -2.431311, 0, 0, 0, 1, 1,
-0.6292507, -0.5335518, -0.8880897, 0, 0, 0, 1, 1,
-0.6261953, 0.8123118, -2.530754, 0, 0, 0, 1, 1,
-0.6229625, -2.230221, -3.575816, 0, 0, 0, 1, 1,
-0.6226334, -0.9790423, -2.721337, 1, 1, 1, 1, 1,
-0.6212844, -0.2810175, -2.31832, 1, 1, 1, 1, 1,
-0.6196777, 0.2457995, 0.1252464, 1, 1, 1, 1, 1,
-0.6176934, 0.1077059, -1.678434, 1, 1, 1, 1, 1,
-0.6167021, -0.417477, -3.092405, 1, 1, 1, 1, 1,
-0.6165004, -2.341665, -2.422831, 1, 1, 1, 1, 1,
-0.608157, -0.5235822, -2.68833, 1, 1, 1, 1, 1,
-0.6007882, 0.3699448, 0.1348715, 1, 1, 1, 1, 1,
-0.5989589, 0.03404298, -2.636391, 1, 1, 1, 1, 1,
-0.5983738, 0.9076402, -2.199357, 1, 1, 1, 1, 1,
-0.5975466, -0.4028811, -0.8571246, 1, 1, 1, 1, 1,
-0.5967327, 0.8858339, -0.1114636, 1, 1, 1, 1, 1,
-0.5954423, 2.508263, 0.9817433, 1, 1, 1, 1, 1,
-0.594261, -0.380922, -2.763677, 1, 1, 1, 1, 1,
-0.5939555, -0.3505426, -3.648731, 1, 1, 1, 1, 1,
-0.59005, 0.6861703, -0.6601157, 0, 0, 1, 1, 1,
-0.584255, 1.039576, 0.2909427, 1, 0, 0, 1, 1,
-0.5810679, 1.483608, -1.778688, 1, 0, 0, 1, 1,
-0.5741402, -0.5222395, -2.858409, 1, 0, 0, 1, 1,
-0.5729858, 0.9567422, -0.006505026, 1, 0, 0, 1, 1,
-0.5723788, 0.2120485, -0.9550624, 1, 0, 0, 1, 1,
-0.5713667, 0.06425026, -0.8468987, 0, 0, 0, 1, 1,
-0.5671828, 0.3670222, -1.37435, 0, 0, 0, 1, 1,
-0.5580308, 0.2109263, -1.455608, 0, 0, 0, 1, 1,
-0.5540472, 1.550955, -0.5579506, 0, 0, 0, 1, 1,
-0.5534048, -0.952066, -4.431098, 0, 0, 0, 1, 1,
-0.5528953, -2.209582, -2.469625, 0, 0, 0, 1, 1,
-0.5524788, 2.110322, -0.9702158, 0, 0, 0, 1, 1,
-0.5421103, 0.2151412, -0.2178968, 1, 1, 1, 1, 1,
-0.5405903, -0.2557915, -2.22332, 1, 1, 1, 1, 1,
-0.5400334, -1.331105, -1.22531, 1, 1, 1, 1, 1,
-0.5388073, -1.083115, -3.148718, 1, 1, 1, 1, 1,
-0.5381979, 0.7074289, -0.8062056, 1, 1, 1, 1, 1,
-0.5376064, -1.058747, -1.373221, 1, 1, 1, 1, 1,
-0.5362878, 2.347618, -0.682054, 1, 1, 1, 1, 1,
-0.5339069, -2.283007, -4.607352, 1, 1, 1, 1, 1,
-0.5335821, -0.2384353, -1.13419, 1, 1, 1, 1, 1,
-0.5318908, -0.6044397, -2.852091, 1, 1, 1, 1, 1,
-0.5308167, -0.531514, -2.535638, 1, 1, 1, 1, 1,
-0.5262413, 1.270236, 0.284071, 1, 1, 1, 1, 1,
-0.5222459, 0.5585909, -0.972061, 1, 1, 1, 1, 1,
-0.5167289, -1.013995, -2.498971, 1, 1, 1, 1, 1,
-0.5102062, 0.5651495, -1.582339, 1, 1, 1, 1, 1,
-0.5064211, -1.263866, -1.976324, 0, 0, 1, 1, 1,
-0.5048288, -2.383095, -6.518848, 1, 0, 0, 1, 1,
-0.4958662, 1.293377, -1.869968, 1, 0, 0, 1, 1,
-0.4930263, 1.434855, 0.6699468, 1, 0, 0, 1, 1,
-0.4904388, 0.3686141, -0.3774472, 1, 0, 0, 1, 1,
-0.4893686, -0.2723586, -0.9026527, 1, 0, 0, 1, 1,
-0.4881358, 0.7598172, -0.899116, 0, 0, 0, 1, 1,
-0.4854428, 0.1484408, -1.391461, 0, 0, 0, 1, 1,
-0.4841731, 0.7349622, 0.5091879, 0, 0, 0, 1, 1,
-0.4819792, -0.8636957, -3.024632, 0, 0, 0, 1, 1,
-0.4758663, -0.2547616, -3.43178, 0, 0, 0, 1, 1,
-0.4728245, -1.237971, -1.220549, 0, 0, 0, 1, 1,
-0.4724287, -0.2562705, -1.261428, 0, 0, 0, 1, 1,
-0.471968, -0.8644202, -1.812592, 1, 1, 1, 1, 1,
-0.4638213, 1.024098, -1.373284, 1, 1, 1, 1, 1,
-0.4633805, -0.01786474, -0.2926928, 1, 1, 1, 1, 1,
-0.4627957, -0.7731876, -3.372501, 1, 1, 1, 1, 1,
-0.4622933, 0.131379, -0.6820744, 1, 1, 1, 1, 1,
-0.4596481, 0.01189897, -1.159129, 1, 1, 1, 1, 1,
-0.4573935, 0.4633064, -3.512184, 1, 1, 1, 1, 1,
-0.4557405, -0.1518726, -1.918358, 1, 1, 1, 1, 1,
-0.4544218, -0.4575188, -2.934905, 1, 1, 1, 1, 1,
-0.4533906, -1.17613, -2.011125, 1, 1, 1, 1, 1,
-0.4520572, 1.173395, 0.06345951, 1, 1, 1, 1, 1,
-0.45143, -0.6102721, -2.897134, 1, 1, 1, 1, 1,
-0.4495543, -1.671192, -3.36642, 1, 1, 1, 1, 1,
-0.44677, 1.157331, -0.238325, 1, 1, 1, 1, 1,
-0.442834, 0.652806, -1.385844, 1, 1, 1, 1, 1,
-0.4425868, -1.035704, -3.750365, 0, 0, 1, 1, 1,
-0.4364444, 0.912662, -1.647293, 1, 0, 0, 1, 1,
-0.4352526, -0.2421832, -1.954132, 1, 0, 0, 1, 1,
-0.4300457, 0.07355672, -1.918558, 1, 0, 0, 1, 1,
-0.4269555, -1.437858, -2.536588, 1, 0, 0, 1, 1,
-0.4242349, -0.9312144, -2.057059, 1, 0, 0, 1, 1,
-0.4219157, 2.045067, -0.5767789, 0, 0, 0, 1, 1,
-0.421848, 0.5953554, -0.7530451, 0, 0, 0, 1, 1,
-0.4206446, 0.7188405, 0.4833931, 0, 0, 0, 1, 1,
-0.4195559, -2.196663, -3.88347, 0, 0, 0, 1, 1,
-0.4185918, -0.225803, -3.042531, 0, 0, 0, 1, 1,
-0.4178754, -2.375801, -3.469257, 0, 0, 0, 1, 1,
-0.4172971, 0.3391558, -0.77123, 0, 0, 0, 1, 1,
-0.4102517, -0.8892168, -1.946112, 1, 1, 1, 1, 1,
-0.4095914, 1.705649, 2.009608, 1, 1, 1, 1, 1,
-0.407248, 0.8634957, -0.6514619, 1, 1, 1, 1, 1,
-0.403577, -0.8312227, -2.196388, 1, 1, 1, 1, 1,
-0.3969809, 0.2938745, -2.434943, 1, 1, 1, 1, 1,
-0.3964035, 0.9690701, -0.2007387, 1, 1, 1, 1, 1,
-0.3949118, -0.4284934, -2.572865, 1, 1, 1, 1, 1,
-0.3878457, 1.614219, 1.157022, 1, 1, 1, 1, 1,
-0.3845873, -1.420166, -3.580056, 1, 1, 1, 1, 1,
-0.3798028, -0.8170996, -1.889884, 1, 1, 1, 1, 1,
-0.3766663, -1.339725, -2.85364, 1, 1, 1, 1, 1,
-0.3738192, 0.1635975, -0.4331287, 1, 1, 1, 1, 1,
-0.3690348, 0.08639258, -0.7415105, 1, 1, 1, 1, 1,
-0.3689364, 0.196504, 0.2298632, 1, 1, 1, 1, 1,
-0.3668947, -0.8559718, -1.185514, 1, 1, 1, 1, 1,
-0.3661828, -0.2014791, -1.906981, 0, 0, 1, 1, 1,
-0.3655465, 0.9155195, -2.51738, 1, 0, 0, 1, 1,
-0.3629192, -0.03679229, -1.194862, 1, 0, 0, 1, 1,
-0.3626871, -1.165382, -4.909256, 1, 0, 0, 1, 1,
-0.3593932, -1.296972, -4.341987, 1, 0, 0, 1, 1,
-0.3559169, 0.01484006, -1.179105, 1, 0, 0, 1, 1,
-0.3513751, -1.300474, -2.786373, 0, 0, 0, 1, 1,
-0.3504204, -0.1966784, -1.307151, 0, 0, 0, 1, 1,
-0.3494761, -0.9088705, -2.441905, 0, 0, 0, 1, 1,
-0.3440758, 1.08046, 0.08710712, 0, 0, 0, 1, 1,
-0.3429379, 1.135832, -0.8313329, 0, 0, 0, 1, 1,
-0.3280447, -0.5433761, -3.438042, 0, 0, 0, 1, 1,
-0.3268606, -0.101881, -3.245616, 0, 0, 0, 1, 1,
-0.3256639, -0.06373608, -3.883407, 1, 1, 1, 1, 1,
-0.3174279, 0.4474185, -1.275327, 1, 1, 1, 1, 1,
-0.3150004, 0.2334839, 0.7115926, 1, 1, 1, 1, 1,
-0.3147492, 0.4134105, -0.01669238, 1, 1, 1, 1, 1,
-0.3136221, 0.08188907, -1.99549, 1, 1, 1, 1, 1,
-0.3105838, 0.4418406, -0.3564999, 1, 1, 1, 1, 1,
-0.3077471, -0.8831601, -3.134461, 1, 1, 1, 1, 1,
-0.3059201, -0.08297619, -1.316775, 1, 1, 1, 1, 1,
-0.3011858, -0.7936156, -2.609359, 1, 1, 1, 1, 1,
-0.2983364, -0.3738673, -4.233547, 1, 1, 1, 1, 1,
-0.2980363, -0.03896277, -2.174506, 1, 1, 1, 1, 1,
-0.2942868, -0.9828509, -3.81732, 1, 1, 1, 1, 1,
-0.2929201, 0.6906735, 0.5450428, 1, 1, 1, 1, 1,
-0.2908105, -0.7045444, -4.320185, 1, 1, 1, 1, 1,
-0.2904126, -1.274773, -3.449599, 1, 1, 1, 1, 1,
-0.2822316, -0.7024346, -2.921122, 0, 0, 1, 1, 1,
-0.2756437, -0.2005282, -5.087806, 1, 0, 0, 1, 1,
-0.2699548, -0.6569909, -0.8134999, 1, 0, 0, 1, 1,
-0.2658797, 0.5465507, -0.7611378, 1, 0, 0, 1, 1,
-0.2583217, -0.2252706, -0.7721431, 1, 0, 0, 1, 1,
-0.2580005, 0.5322824, -1.805768, 1, 0, 0, 1, 1,
-0.2568359, -1.549325, -3.237124, 0, 0, 0, 1, 1,
-0.2512385, -0.9696156, -4.770627, 0, 0, 0, 1, 1,
-0.2437619, -0.6360053, -3.062785, 0, 0, 0, 1, 1,
-0.2348297, -0.6768177, -1.638261, 0, 0, 0, 1, 1,
-0.233269, -0.7199724, -2.751661, 0, 0, 0, 1, 1,
-0.2330757, 1.622373, 1.275106, 0, 0, 0, 1, 1,
-0.2323302, -0.3698267, -1.67712, 0, 0, 0, 1, 1,
-0.2290077, 0.299521, -1.645832, 1, 1, 1, 1, 1,
-0.2287023, 0.3436208, -0.4929369, 1, 1, 1, 1, 1,
-0.2262816, 0.185363, -1.440138, 1, 1, 1, 1, 1,
-0.2249057, -0.80878, -1.10051, 1, 1, 1, 1, 1,
-0.2247604, 0.5676402, -0.6040469, 1, 1, 1, 1, 1,
-0.2226405, -1.555772, -1.028762, 1, 1, 1, 1, 1,
-0.2214419, -0.9659554, -2.314345, 1, 1, 1, 1, 1,
-0.2210292, -0.3528074, -2.578244, 1, 1, 1, 1, 1,
-0.2209286, 0.1747624, -2.120839, 1, 1, 1, 1, 1,
-0.2164638, -0.1942543, -3.099404, 1, 1, 1, 1, 1,
-0.2131611, 0.4996936, 0.3796787, 1, 1, 1, 1, 1,
-0.2123472, 0.637004, 0.4938295, 1, 1, 1, 1, 1,
-0.2122528, 0.0912155, -2.143144, 1, 1, 1, 1, 1,
-0.2096046, 1.922311, 0.04337988, 1, 1, 1, 1, 1,
-0.2079869, 0.3397939, 1.947981, 1, 1, 1, 1, 1,
-0.2059567, -0.3793459, -3.304033, 0, 0, 1, 1, 1,
-0.2016179, 0.6298721, -0.7958288, 1, 0, 0, 1, 1,
-0.2003463, -3.319278, -3.809664, 1, 0, 0, 1, 1,
-0.1980407, 0.7310139, -3.182625, 1, 0, 0, 1, 1,
-0.1946703, -0.259276, -3.017538, 1, 0, 0, 1, 1,
-0.1938482, -0.5941145, -1.103884, 1, 0, 0, 1, 1,
-0.1913246, -1.010427, -1.63708, 0, 0, 0, 1, 1,
-0.1903037, 1.044809, -0.07525697, 0, 0, 0, 1, 1,
-0.1877381, 0.0274603, 0.45229, 0, 0, 0, 1, 1,
-0.1855359, 0.104781, -0.01646468, 0, 0, 0, 1, 1,
-0.1839768, -0.01869209, -1.173638, 0, 0, 0, 1, 1,
-0.1828176, -1.128335, -2.490066, 0, 0, 0, 1, 1,
-0.1813426, 0.05089874, 0.1138491, 0, 0, 0, 1, 1,
-0.1800913, 2.238784, 0.3931748, 1, 1, 1, 1, 1,
-0.1755749, 1.155783, -0.05074323, 1, 1, 1, 1, 1,
-0.1749582, 2.071311, 0.8172218, 1, 1, 1, 1, 1,
-0.1715345, 0.5903322, 1.163325, 1, 1, 1, 1, 1,
-0.1712521, -0.01975029, -3.246042, 1, 1, 1, 1, 1,
-0.1694784, 0.6531962, -0.5712175, 1, 1, 1, 1, 1,
-0.1689861, 0.2809707, -1.177148, 1, 1, 1, 1, 1,
-0.1689063, 1.216402, 0.6515388, 1, 1, 1, 1, 1,
-0.1674828, -0.2557028, -4.379896, 1, 1, 1, 1, 1,
-0.1662417, -0.5444168, -2.037206, 1, 1, 1, 1, 1,
-0.1655675, -0.1605295, -2.734237, 1, 1, 1, 1, 1,
-0.1615014, 0.3972305, -0.7850175, 1, 1, 1, 1, 1,
-0.1608892, -2.130325, -3.226452, 1, 1, 1, 1, 1,
-0.1589143, -1.447577, -3.511224, 1, 1, 1, 1, 1,
-0.1569026, 1.450702, -0.6410142, 1, 1, 1, 1, 1,
-0.1544541, 1.611094, -0.1344057, 0, 0, 1, 1, 1,
-0.153918, 0.2033609, -0.07091459, 1, 0, 0, 1, 1,
-0.1536372, -0.9392659, -2.52769, 1, 0, 0, 1, 1,
-0.1479534, 0.6825554, -0.6807443, 1, 0, 0, 1, 1,
-0.1465871, -2.389819, -2.073131, 1, 0, 0, 1, 1,
-0.1463398, -1.469301, -1.210011, 1, 0, 0, 1, 1,
-0.1425221, -0.7505583, -1.827146, 0, 0, 0, 1, 1,
-0.1414606, -0.5449358, -2.021862, 0, 0, 0, 1, 1,
-0.1412985, -0.1389502, -2.587492, 0, 0, 0, 1, 1,
-0.1403769, -2.293852, -2.059739, 0, 0, 0, 1, 1,
-0.1381592, 0.6363626, 0.8947493, 0, 0, 0, 1, 1,
-0.137433, -0.08167362, 0.1269998, 0, 0, 0, 1, 1,
-0.1309999, -1.425277, -2.83782, 0, 0, 0, 1, 1,
-0.1298359, 1.044433, -1.383697, 1, 1, 1, 1, 1,
-0.1263446, 2.148176, -0.3377914, 1, 1, 1, 1, 1,
-0.1236997, -1.328557, -0.3596532, 1, 1, 1, 1, 1,
-0.1168124, -0.6924192, -2.462687, 1, 1, 1, 1, 1,
-0.1160575, -0.4035694, -2.202657, 1, 1, 1, 1, 1,
-0.1156378, -1.152761, -3.473987, 1, 1, 1, 1, 1,
-0.115595, 0.2240182, -1.500371, 1, 1, 1, 1, 1,
-0.1153414, 1.588036, 0.2046025, 1, 1, 1, 1, 1,
-0.1133332, 0.630079, -0.2672863, 1, 1, 1, 1, 1,
-0.1099828, -1.799506, -2.768975, 1, 1, 1, 1, 1,
-0.106192, -0.003103181, -1.062921, 1, 1, 1, 1, 1,
-0.1042013, 0.8870211, 0.8108718, 1, 1, 1, 1, 1,
-0.102133, -0.2542953, -0.6624032, 1, 1, 1, 1, 1,
-0.09268627, 1.080621, 1.262599, 1, 1, 1, 1, 1,
-0.08148498, 0.9325025, 0.3802274, 1, 1, 1, 1, 1,
-0.08097397, 1.130926, 0.4277945, 0, 0, 1, 1, 1,
-0.08025537, -0.2578385, -0.9420798, 1, 0, 0, 1, 1,
-0.07968087, 0.4335716, 0.6328572, 1, 0, 0, 1, 1,
-0.07694626, -0.2775596, -2.313547, 1, 0, 0, 1, 1,
-0.07279667, 0.3100835, 1.141247, 1, 0, 0, 1, 1,
-0.07259624, -0.2063367, -3.130218, 1, 0, 0, 1, 1,
-0.07098501, -0.7913585, -3.900593, 0, 0, 0, 1, 1,
-0.07034557, -0.3475591, -5.252626, 0, 0, 0, 1, 1,
-0.0693803, 0.06683961, -0.5090882, 0, 0, 0, 1, 1,
-0.06762657, -0.1193818, -2.382055, 0, 0, 0, 1, 1,
-0.06607321, -0.9908404, -2.297426, 0, 0, 0, 1, 1,
-0.0556642, -0.04724623, -2.839752, 0, 0, 0, 1, 1,
-0.05378271, 0.4420169, 0.7933097, 0, 0, 0, 1, 1,
-0.05283584, 1.26657, -0.3826071, 1, 1, 1, 1, 1,
-0.04916012, -0.5670396, -2.829227, 1, 1, 1, 1, 1,
-0.03857014, -0.09236239, -0.041214, 1, 1, 1, 1, 1,
-0.03853429, 1.026597, 0.9559238, 1, 1, 1, 1, 1,
-0.03571079, -0.8816248, -4.308862, 1, 1, 1, 1, 1,
-0.03493767, 2.326446, 0.4267602, 1, 1, 1, 1, 1,
-0.03401195, -0.8267315, -3.668049, 1, 1, 1, 1, 1,
-0.03215903, -0.008881781, -1.929301, 1, 1, 1, 1, 1,
-0.02836406, 0.003537156, -2.582634, 1, 1, 1, 1, 1,
-0.02426413, -0.7931012, -3.042492, 1, 1, 1, 1, 1,
-0.02328701, 1.186852, 0.2260463, 1, 1, 1, 1, 1,
-0.020973, 0.7073412, 0.2750945, 1, 1, 1, 1, 1,
-0.01921769, 1.233157, 0.421267, 1, 1, 1, 1, 1,
-0.01529024, 0.2275799, 1.652183, 1, 1, 1, 1, 1,
-0.01087251, -0.1514, -4.056788, 1, 1, 1, 1, 1,
-0.006725596, -1.006619, -3.728935, 0, 0, 1, 1, 1,
-0.006533217, -1.028401, -2.724658, 1, 0, 0, 1, 1,
-0.004097331, 1.159917, -0.4310889, 1, 0, 0, 1, 1,
-0.002822143, 0.1209469, 0.3200866, 1, 0, 0, 1, 1,
-0.0008643491, 1.229462, 0.2533296, 1, 0, 0, 1, 1,
0.001576779, -0.8294699, 2.453552, 1, 0, 0, 1, 1,
0.001949443, -0.4605345, 2.691165, 0, 0, 0, 1, 1,
0.002835017, -1.71281, 4.280961, 0, 0, 0, 1, 1,
0.005061141, -1.555835, 3.1888, 0, 0, 0, 1, 1,
0.0070088, -0.7966924, 2.478741, 0, 0, 0, 1, 1,
0.008794801, -1.524491, 3.414385, 0, 0, 0, 1, 1,
0.009424925, -0.1600211, 3.814227, 0, 0, 0, 1, 1,
0.009642171, -0.8931382, 2.330693, 0, 0, 0, 1, 1,
0.0114224, -0.6111318, 2.143681, 1, 1, 1, 1, 1,
0.01192911, 0.3047223, 0.1944522, 1, 1, 1, 1, 1,
0.01835619, -0.2381402, 0.7657927, 1, 1, 1, 1, 1,
0.01923615, 0.7076553, -1.712117, 1, 1, 1, 1, 1,
0.02085726, 0.219869, 0.9338174, 1, 1, 1, 1, 1,
0.02435514, 1.18981, -0.3508142, 1, 1, 1, 1, 1,
0.02650777, -0.4316265, 3.024665, 1, 1, 1, 1, 1,
0.02931004, -1.5013, 2.278875, 1, 1, 1, 1, 1,
0.03453058, -1.275054, 3.862092, 1, 1, 1, 1, 1,
0.03712625, -1.242188, 3.744727, 1, 1, 1, 1, 1,
0.04068282, -0.7360376, 4.77333, 1, 1, 1, 1, 1,
0.04505929, 1.136314, 0.8045731, 1, 1, 1, 1, 1,
0.04559239, 0.9682081, 0.7153998, 1, 1, 1, 1, 1,
0.04855781, -0.9795329, 4.690574, 1, 1, 1, 1, 1,
0.04954516, -1.640135, 2.309347, 1, 1, 1, 1, 1,
0.05403004, 0.7938401, 1.492348, 0, 0, 1, 1, 1,
0.05911932, -0.6338007, 3.000115, 1, 0, 0, 1, 1,
0.0744535, -0.7055151, 3.900599, 1, 0, 0, 1, 1,
0.07576038, -1.48658, 2.647942, 1, 0, 0, 1, 1,
0.07752869, -0.02845494, 1.929401, 1, 0, 0, 1, 1,
0.07757076, 1.171072, -0.06584276, 1, 0, 0, 1, 1,
0.07805005, -0.6691794, 3.012015, 0, 0, 0, 1, 1,
0.08051276, -0.009407084, 0.3515498, 0, 0, 0, 1, 1,
0.08243687, 0.7310921, -0.5462713, 0, 0, 0, 1, 1,
0.08327289, 1.321987, -1.814951, 0, 0, 0, 1, 1,
0.09077463, -0.5745391, 5.121382, 0, 0, 0, 1, 1,
0.09549683, -0.0303034, 0.7955313, 0, 0, 0, 1, 1,
0.09839275, 0.5114174, -1.405088, 0, 0, 0, 1, 1,
0.09921905, 0.7068206, 0.5529919, 1, 1, 1, 1, 1,
0.09998809, -0.2177214, 4.319801, 1, 1, 1, 1, 1,
0.1009685, -0.3293492, 4.055797, 1, 1, 1, 1, 1,
0.103488, 0.9190155, 0.2732848, 1, 1, 1, 1, 1,
0.1063779, -0.7215838, 4.691012, 1, 1, 1, 1, 1,
0.1159705, -0.7562678, 3.177668, 1, 1, 1, 1, 1,
0.1170486, -1.179137, 2.44258, 1, 1, 1, 1, 1,
0.1201205, 1.413252, 0.04777525, 1, 1, 1, 1, 1,
0.1210561, 0.1735004, 0.2469526, 1, 1, 1, 1, 1,
0.1254705, -0.2918817, 1.909602, 1, 1, 1, 1, 1,
0.1287964, -0.2746046, 2.310832, 1, 1, 1, 1, 1,
0.129752, 1.028096, 1.476321, 1, 1, 1, 1, 1,
0.1312012, 0.251082, 0.7954834, 1, 1, 1, 1, 1,
0.1319831, 1.06282, 0.4662555, 1, 1, 1, 1, 1,
0.1367127, -0.7808264, 2.564779, 1, 1, 1, 1, 1,
0.1385443, 0.7825692, -1.051657, 0, 0, 1, 1, 1,
0.1394281, -0.8187216, 2.915452, 1, 0, 0, 1, 1,
0.1398328, -0.2559806, 2.701187, 1, 0, 0, 1, 1,
0.1398743, 0.389548, 0.9663231, 1, 0, 0, 1, 1,
0.1415354, -0.5549486, 4.153934, 1, 0, 0, 1, 1,
0.1420381, -0.4366543, 2.528569, 1, 0, 0, 1, 1,
0.1421887, 0.8677666, 1.155355, 0, 0, 0, 1, 1,
0.1455557, 0.476746, 0.294912, 0, 0, 0, 1, 1,
0.1524849, 0.6775404, -0.7584623, 0, 0, 0, 1, 1,
0.159234, 0.2260442, 2.247047, 0, 0, 0, 1, 1,
0.161097, -0.3458174, 2.883889, 0, 0, 0, 1, 1,
0.1654545, 1.816605, 0.1143067, 0, 0, 0, 1, 1,
0.1689771, 1.515635, -0.7914239, 0, 0, 0, 1, 1,
0.1697657, 0.5785917, 1.190845, 1, 1, 1, 1, 1,
0.1698603, -0.04396956, 2.422625, 1, 1, 1, 1, 1,
0.1723657, 0.8107621, -0.2858649, 1, 1, 1, 1, 1,
0.1731595, -0.2068399, 3.029943, 1, 1, 1, 1, 1,
0.1765077, 1.176566, -1.120012, 1, 1, 1, 1, 1,
0.1786494, -1.237943, 2.447273, 1, 1, 1, 1, 1,
0.1796507, -0.6793711, 4.471496, 1, 1, 1, 1, 1,
0.1839063, -1.061072, 1.169636, 1, 1, 1, 1, 1,
0.1839454, 0.8599218, -0.2768333, 1, 1, 1, 1, 1,
0.185075, 0.5229037, -0.760309, 1, 1, 1, 1, 1,
0.187865, -0.2849382, 3.027897, 1, 1, 1, 1, 1,
0.1893277, 0.3781443, 2.630744, 1, 1, 1, 1, 1,
0.1935944, 1.017488, 1.309986, 1, 1, 1, 1, 1,
0.1956123, -0.4860328, 2.797091, 1, 1, 1, 1, 1,
0.2008138, -1.765335, 3.298609, 1, 1, 1, 1, 1,
0.2013249, 1.465726, -0.3123963, 0, 0, 1, 1, 1,
0.204596, -0.003059517, 3.483255, 1, 0, 0, 1, 1,
0.2054665, 0.8540778, 0.4955729, 1, 0, 0, 1, 1,
0.2074048, -0.4027022, 2.085867, 1, 0, 0, 1, 1,
0.2127649, -0.1569598, 2.722254, 1, 0, 0, 1, 1,
0.2143893, 1.051979, -0.4176597, 1, 0, 0, 1, 1,
0.2145165, -0.4690082, 2.573579, 0, 0, 0, 1, 1,
0.2180804, -0.4342237, 1.893823, 0, 0, 0, 1, 1,
0.2215702, 0.1604306, 1.89922, 0, 0, 0, 1, 1,
0.2220847, 0.5979308, 0.3013126, 0, 0, 0, 1, 1,
0.2234597, 0.9735215, -1.09471, 0, 0, 0, 1, 1,
0.2288972, 2.355177, 0.6420935, 0, 0, 0, 1, 1,
0.2344139, 1.572546, 0.2401741, 0, 0, 0, 1, 1,
0.2363753, -0.8213832, 3.450873, 1, 1, 1, 1, 1,
0.239317, 1.282044, 1.885653, 1, 1, 1, 1, 1,
0.240849, 0.92928, -0.07897502, 1, 1, 1, 1, 1,
0.2574088, 2.33425, 1.282724, 1, 1, 1, 1, 1,
0.258279, -1.323743, 3.242459, 1, 1, 1, 1, 1,
0.2610662, 0.360638, 0.5032793, 1, 1, 1, 1, 1,
0.2615342, -0.8700724, 3.931504, 1, 1, 1, 1, 1,
0.2653824, -0.8419607, 3.560625, 1, 1, 1, 1, 1,
0.2658564, 0.8813858, 0.3224042, 1, 1, 1, 1, 1,
0.2664617, -1.76354, 1.853888, 1, 1, 1, 1, 1,
0.2684021, 0.1813005, 0.09801105, 1, 1, 1, 1, 1,
0.2691648, 0.1931614, 1.862208, 1, 1, 1, 1, 1,
0.2695026, -0.3234845, 2.457906, 1, 1, 1, 1, 1,
0.269614, 2.499547, 1.547381, 1, 1, 1, 1, 1,
0.2753015, -0.3882401, 3.203246, 1, 1, 1, 1, 1,
0.2761854, -0.9060706, 1.472205, 0, 0, 1, 1, 1,
0.2767244, 0.2368093, 0.2758999, 1, 0, 0, 1, 1,
0.2895485, 0.1963948, 0.05521284, 1, 0, 0, 1, 1,
0.2955009, -0.04977555, 2.81608, 1, 0, 0, 1, 1,
0.296851, 1.193119, 1.41422, 1, 0, 0, 1, 1,
0.3023904, -2.288862, 3.249153, 1, 0, 0, 1, 1,
0.306719, 1.084484, -0.3960881, 0, 0, 0, 1, 1,
0.3074385, -1.268772, 3.407074, 0, 0, 0, 1, 1,
0.3134194, 1.16031, -1.424765, 0, 0, 0, 1, 1,
0.314369, 1.80809, 1.444125, 0, 0, 0, 1, 1,
0.3145058, 0.1070983, 1.535954, 0, 0, 0, 1, 1,
0.3147305, -1.139705, 0.8081907, 0, 0, 0, 1, 1,
0.3168932, -0.006102039, 0.8636584, 0, 0, 0, 1, 1,
0.3198622, -1.608539, 3.492459, 1, 1, 1, 1, 1,
0.3297532, -1.995737, 2.573999, 1, 1, 1, 1, 1,
0.3306495, 0.5339083, -1.411839, 1, 1, 1, 1, 1,
0.3311297, -1.551219, 2.52674, 1, 1, 1, 1, 1,
0.3322059, 1.271399, -1.585243, 1, 1, 1, 1, 1,
0.3342248, -0.984355, 3.776235, 1, 1, 1, 1, 1,
0.3386884, -1.081356, 4.124832, 1, 1, 1, 1, 1,
0.3433125, 0.5605248, 0.179506, 1, 1, 1, 1, 1,
0.3507338, -0.123319, 3.855093, 1, 1, 1, 1, 1,
0.3509842, -1.417161, 4.74518, 1, 1, 1, 1, 1,
0.3535475, 0.5979348, 0.5274258, 1, 1, 1, 1, 1,
0.3546741, 0.7354195, 1.112624, 1, 1, 1, 1, 1,
0.3557603, 1.321685, 0.9844574, 1, 1, 1, 1, 1,
0.3568181, 0.4803359, 1.457098, 1, 1, 1, 1, 1,
0.3569223, 0.7155725, -0.2309927, 1, 1, 1, 1, 1,
0.3572622, -1.431038, 3.205965, 0, 0, 1, 1, 1,
0.3578788, -1.329217, 2.120619, 1, 0, 0, 1, 1,
0.3580012, -0.1805921, 1.52968, 1, 0, 0, 1, 1,
0.3621364, -0.9459442, 3.606244, 1, 0, 0, 1, 1,
0.3670737, -0.5400178, 2.393027, 1, 0, 0, 1, 1,
0.3700294, 0.6666346, 1.887029, 1, 0, 0, 1, 1,
0.3751827, -0.003542066, 1.875813, 0, 0, 0, 1, 1,
0.3872738, -0.2352283, 1.399793, 0, 0, 0, 1, 1,
0.3889136, -1.105971, 3.207958, 0, 0, 0, 1, 1,
0.3910769, 0.9442956, 0.1639031, 0, 0, 0, 1, 1,
0.392235, -1.779108, 0.8590259, 0, 0, 0, 1, 1,
0.3938445, -2.198965, 4.655604, 0, 0, 0, 1, 1,
0.3957547, 0.4072771, 2.11782, 0, 0, 0, 1, 1,
0.3970801, 2.516551, -0.3335235, 1, 1, 1, 1, 1,
0.3972895, 0.4520122, 1.516578, 1, 1, 1, 1, 1,
0.3976909, 2.22172, 0.421131, 1, 1, 1, 1, 1,
0.3986309, 1.921157, -0.9995379, 1, 1, 1, 1, 1,
0.399948, 0.534766, -1.327005, 1, 1, 1, 1, 1,
0.4006888, -0.3185364, 0.9879948, 1, 1, 1, 1, 1,
0.4008292, -2.206284, 3.447567, 1, 1, 1, 1, 1,
0.4034222, 0.9348521, 1.077278, 1, 1, 1, 1, 1,
0.4042749, 0.6737576, 0.0118663, 1, 1, 1, 1, 1,
0.4052689, -0.8708057, 2.360834, 1, 1, 1, 1, 1,
0.4080475, 0.4788139, 1.00514, 1, 1, 1, 1, 1,
0.4100838, 0.5795234, -1.007998, 1, 1, 1, 1, 1,
0.4103663, 2.121397, 1.918747, 1, 1, 1, 1, 1,
0.411426, 0.7687261, 1.156612, 1, 1, 1, 1, 1,
0.4125345, -0.2267662, 1.426413, 1, 1, 1, 1, 1,
0.4130138, 0.2212252, 1.58765, 0, 0, 1, 1, 1,
0.4170169, 1.623886, 0.4052866, 1, 0, 0, 1, 1,
0.4242588, -0.4354292, 1.341676, 1, 0, 0, 1, 1,
0.4250799, 1.962979, 0.2470138, 1, 0, 0, 1, 1,
0.4260491, 0.3532934, 0.5656931, 1, 0, 0, 1, 1,
0.4263346, -0.4283152, 1.833463, 1, 0, 0, 1, 1,
0.4357048, -0.7044847, 0.4511386, 0, 0, 0, 1, 1,
0.4380114, 0.9000444, -1.192214, 0, 0, 0, 1, 1,
0.4396422, 1.084917, -0.8467507, 0, 0, 0, 1, 1,
0.4434577, 0.7430521, 1.386381, 0, 0, 0, 1, 1,
0.4490677, -1.376662, 2.250751, 0, 0, 0, 1, 1,
0.4536946, 1.682652, 1.212271, 0, 0, 0, 1, 1,
0.4537594, -1.519026, 1.803744, 0, 0, 0, 1, 1,
0.4540894, -0.2541754, 1.031627, 1, 1, 1, 1, 1,
0.4542434, 0.7436618, 0.8749373, 1, 1, 1, 1, 1,
0.4564595, -1.147768, 2.210994, 1, 1, 1, 1, 1,
0.4602751, 0.8743232, 0.2808367, 1, 1, 1, 1, 1,
0.4669047, 1.462417, 0.5032197, 1, 1, 1, 1, 1,
0.4746711, 1.183708, 0.2917632, 1, 1, 1, 1, 1,
0.4759977, 0.3871389, 0.06063127, 1, 1, 1, 1, 1,
0.4779278, -0.6949404, 1.28052, 1, 1, 1, 1, 1,
0.4794591, -0.8470963, 2.293192, 1, 1, 1, 1, 1,
0.4810124, -1.265024, 2.20421, 1, 1, 1, 1, 1,
0.4849033, -1.113915, 3.742662, 1, 1, 1, 1, 1,
0.487775, -1.090814, 2.629773, 1, 1, 1, 1, 1,
0.4884747, 1.26788, 0.3898786, 1, 1, 1, 1, 1,
0.4946222, 0.5809801, 2.01333, 1, 1, 1, 1, 1,
0.4965161, -1.30416, 2.640855, 1, 1, 1, 1, 1,
0.50234, 0.3904277, -0.3761915, 0, 0, 1, 1, 1,
0.504186, 1.656376, -0.3001754, 1, 0, 0, 1, 1,
0.5062647, -0.5255901, 0.5528556, 1, 0, 0, 1, 1,
0.5079846, 0.1542847, 2.185324, 1, 0, 0, 1, 1,
0.5094782, 1.518426, -0.2617815, 1, 0, 0, 1, 1,
0.5140152, -0.1094915, 1.91979, 1, 0, 0, 1, 1,
0.5141374, -0.7029058, 1.775017, 0, 0, 0, 1, 1,
0.515389, 0.4788933, 2.258033, 0, 0, 0, 1, 1,
0.5160139, -0.4638894, 2.163225, 0, 0, 0, 1, 1,
0.5235337, -0.778262, 1.750987, 0, 0, 0, 1, 1,
0.5262143, 0.0866778, 1.205416, 0, 0, 0, 1, 1,
0.5265826, -0.3084731, 3.324679, 0, 0, 0, 1, 1,
0.5300241, 2.353823, 1.425286, 0, 0, 0, 1, 1,
0.5356216, 0.4520071, -0.4375963, 1, 1, 1, 1, 1,
0.5368937, -0.9306065, 4.40761, 1, 1, 1, 1, 1,
0.5374976, -0.2946621, 2.389474, 1, 1, 1, 1, 1,
0.5385582, -1.719812, 3.723099, 1, 1, 1, 1, 1,
0.5438813, 1.082718, 1.344328, 1, 1, 1, 1, 1,
0.5441704, 1.458716, 0.503347, 1, 1, 1, 1, 1,
0.5487142, 0.201137, 0.3087154, 1, 1, 1, 1, 1,
0.5552616, -0.04346572, 0.8056417, 1, 1, 1, 1, 1,
0.5579704, -1.990062, 1.871924, 1, 1, 1, 1, 1,
0.5592275, -1.151567, 3.541744, 1, 1, 1, 1, 1,
0.5595638, 0.9817831, 0.700582, 1, 1, 1, 1, 1,
0.5628352, 0.1648549, 0.8761273, 1, 1, 1, 1, 1,
0.573715, 0.05976408, -0.05315902, 1, 1, 1, 1, 1,
0.584594, -0.6401791, 1.934392, 1, 1, 1, 1, 1,
0.5859678, 0.4415451, 1.145328, 1, 1, 1, 1, 1,
0.5859892, 0.2826973, 2.233579, 0, 0, 1, 1, 1,
0.5912783, -0.8492889, 3.060013, 1, 0, 0, 1, 1,
0.5953494, -0.9477263, 2.129383, 1, 0, 0, 1, 1,
0.6090618, 1.012848, 2.484654, 1, 0, 0, 1, 1,
0.6095999, -0.5942701, 1.111841, 1, 0, 0, 1, 1,
0.6112742, -0.7060505, 3.495642, 1, 0, 0, 1, 1,
0.6123372, -0.1357528, 0.9371393, 0, 0, 0, 1, 1,
0.6181817, 0.4385814, 1.975828, 0, 0, 0, 1, 1,
0.6206431, -1.637681, 4.277414, 0, 0, 0, 1, 1,
0.6254415, -1.264029, 3.351178, 0, 0, 0, 1, 1,
0.6296807, -0.006920371, 0.6405519, 0, 0, 0, 1, 1,
0.6300606, -1.450585, 2.864164, 0, 0, 0, 1, 1,
0.6373991, 0.8250376, -1.848091, 0, 0, 0, 1, 1,
0.6426655, 0.08690855, 2.141785, 1, 1, 1, 1, 1,
0.6428258, 0.1167722, 0.345565, 1, 1, 1, 1, 1,
0.6440468, -1.548066, 2.476802, 1, 1, 1, 1, 1,
0.6446098, -1.657545, 2.157452, 1, 1, 1, 1, 1,
0.6449071, -0.2184176, -0.09216545, 1, 1, 1, 1, 1,
0.6452844, 0.1995863, -0.2943077, 1, 1, 1, 1, 1,
0.6484915, -1.699132, 4.835158, 1, 1, 1, 1, 1,
0.6489693, -1.260272, 2.711192, 1, 1, 1, 1, 1,
0.649775, -0.2932577, 1.051731, 1, 1, 1, 1, 1,
0.6498871, -0.4376867, 3.618283, 1, 1, 1, 1, 1,
0.6671527, -0.6183528, 1.053134, 1, 1, 1, 1, 1,
0.6679864, 0.8808984, -0.5314632, 1, 1, 1, 1, 1,
0.6801137, 0.3296949, 0.6641803, 1, 1, 1, 1, 1,
0.6821234, 1.50076, 0.3363638, 1, 1, 1, 1, 1,
0.6834356, -1.182064, 1.296407, 1, 1, 1, 1, 1,
0.6888645, 0.07618598, 2.242531, 0, 0, 1, 1, 1,
0.692012, 0.7185608, 1.618828, 1, 0, 0, 1, 1,
0.6933446, 0.07253266, 2.978602, 1, 0, 0, 1, 1,
0.7014958, 0.111634, 2.108909, 1, 0, 0, 1, 1,
0.7060152, -0.2756366, 3.471277, 1, 0, 0, 1, 1,
0.7066368, 1.816867, 0.42365, 1, 0, 0, 1, 1,
0.7087275, -0.0358605, 1.778594, 0, 0, 0, 1, 1,
0.7107378, -1.147025, 4.412387, 0, 0, 0, 1, 1,
0.7126586, 0.4276443, 1.863076, 0, 0, 0, 1, 1,
0.714005, -0.9715463, 2.386414, 0, 0, 0, 1, 1,
0.7161086, 0.3268017, 0.6640314, 0, 0, 0, 1, 1,
0.7172263, -0.04928212, 2.203942, 0, 0, 0, 1, 1,
0.7308646, 0.04386426, 2.517723, 0, 0, 0, 1, 1,
0.7340781, 1.199096, -0.5328763, 1, 1, 1, 1, 1,
0.7346786, 0.113937, -0.4757795, 1, 1, 1, 1, 1,
0.7367349, -2.190124, 2.46418, 1, 1, 1, 1, 1,
0.7382172, -1.159898, 3.343544, 1, 1, 1, 1, 1,
0.7519345, -0.112838, 0.184812, 1, 1, 1, 1, 1,
0.7542676, -0.6292542, 0.6165876, 1, 1, 1, 1, 1,
0.761709, -0.6282179, 2.077147, 1, 1, 1, 1, 1,
0.7647375, -0.8007402, 2.381151, 1, 1, 1, 1, 1,
0.7658123, 1.877995, -2.032728, 1, 1, 1, 1, 1,
0.7699332, 0.5868897, 1.450298, 1, 1, 1, 1, 1,
0.7712891, -0.7400174, 3.664247, 1, 1, 1, 1, 1,
0.7765926, 0.353688, 2.917309, 1, 1, 1, 1, 1,
0.7785223, -0.4841768, 2.528139, 1, 1, 1, 1, 1,
0.7789708, -0.2959791, 1.943563, 1, 1, 1, 1, 1,
0.779833, -0.7763786, 0.1611728, 1, 1, 1, 1, 1,
0.7887726, 0.2029642, 1.335996, 0, 0, 1, 1, 1,
0.7942989, 0.1752201, -0.4023158, 1, 0, 0, 1, 1,
0.7945635, 0.9305527, 0.7534859, 1, 0, 0, 1, 1,
0.8123572, 0.6164513, 0.5724183, 1, 0, 0, 1, 1,
0.8219147, 0.1742963, 1.120036, 1, 0, 0, 1, 1,
0.8243882, 0.4069157, 0.6294326, 1, 0, 0, 1, 1,
0.8302852, 1.128202, -0.8175301, 0, 0, 0, 1, 1,
0.8359243, 0.3750993, 0.4586753, 0, 0, 0, 1, 1,
0.850184, 1.89205, 1.39712, 0, 0, 0, 1, 1,
0.8517157, -0.3310121, 3.684849, 0, 0, 0, 1, 1,
0.8574977, -1.090957, 1.463176, 0, 0, 0, 1, 1,
0.8593536, 0.7970071, 0.287084, 0, 0, 0, 1, 1,
0.8596919, 0.471744, 0.1701195, 0, 0, 0, 1, 1,
0.8610444, -0.3911897, 0.73728, 1, 1, 1, 1, 1,
0.861769, 0.9904057, -0.029925, 1, 1, 1, 1, 1,
0.864296, 0.4683879, 1.576866, 1, 1, 1, 1, 1,
0.8644859, 0.1531368, 2.804304, 1, 1, 1, 1, 1,
0.8663816, 1.399479, 2.28633, 1, 1, 1, 1, 1,
0.8690605, 0.1481145, -0.3671498, 1, 1, 1, 1, 1,
0.8714199, 1.37614, -0.1248196, 1, 1, 1, 1, 1,
0.8777449, 1.199566, 0.7101194, 1, 1, 1, 1, 1,
0.8806426, -0.3984855, 1.47146, 1, 1, 1, 1, 1,
0.8808805, 0.3090841, 1.545377, 1, 1, 1, 1, 1,
0.8898926, -0.6857411, 2.000136, 1, 1, 1, 1, 1,
0.8899334, 1.66729, -0.4200774, 1, 1, 1, 1, 1,
0.8912956, 2.506337, 0.4775104, 1, 1, 1, 1, 1,
0.8941104, -1.814809, 3.207674, 1, 1, 1, 1, 1,
0.9034231, -0.4004854, 2.639662, 1, 1, 1, 1, 1,
0.903827, 0.4131266, 1.985135, 0, 0, 1, 1, 1,
0.9049655, -0.1541931, 3.350268, 1, 0, 0, 1, 1,
0.9093171, -1.961541, 1.969287, 1, 0, 0, 1, 1,
0.9144609, -0.3334545, -0.3369544, 1, 0, 0, 1, 1,
0.9155176, -0.4979541, 0.9868896, 1, 0, 0, 1, 1,
0.9171612, 0.8423648, 2.132727, 1, 0, 0, 1, 1,
0.9248729, 0.1966625, 0.1381539, 0, 0, 0, 1, 1,
0.9284168, 0.4014311, -1.289322, 0, 0, 0, 1, 1,
0.9296947, 0.5994159, 2.530237, 0, 0, 0, 1, 1,
0.9305992, 0.1439072, 2.077001, 0, 0, 0, 1, 1,
0.933633, 0.579694, 1.267629, 0, 0, 0, 1, 1,
0.9355254, -0.03316985, 2.286876, 0, 0, 0, 1, 1,
0.9365339, -0.5973452, 2.081049, 0, 0, 0, 1, 1,
0.937344, 0.9764443, 1.907826, 1, 1, 1, 1, 1,
0.941758, -1.276979, 2.663966, 1, 1, 1, 1, 1,
0.9427855, 0.2913255, 0.1657808, 1, 1, 1, 1, 1,
0.9443811, 1.032087, 1.230352, 1, 1, 1, 1, 1,
0.9463171, 0.1971049, 0.2789023, 1, 1, 1, 1, 1,
0.9471037, -0.01054934, 2.704114, 1, 1, 1, 1, 1,
0.9545717, 1.114888, 1.83168, 1, 1, 1, 1, 1,
0.9658089, -0.881279, 0.8602986, 1, 1, 1, 1, 1,
0.9697492, -2.162595, 2.994817, 1, 1, 1, 1, 1,
0.9747896, -0.6925787, 4.5527, 1, 1, 1, 1, 1,
0.9791641, 0.7382882, 2.054379, 1, 1, 1, 1, 1,
0.9816737, -1.466324, 2.217734, 1, 1, 1, 1, 1,
0.9848981, -0.6252688, 2.693067, 1, 1, 1, 1, 1,
0.9884292, 0.3573951, 1.711076, 1, 1, 1, 1, 1,
0.9885615, 0.7327308, 0.056704, 1, 1, 1, 1, 1,
0.9908428, 0.6428288, 1.238199, 0, 0, 1, 1, 1,
0.9937066, 0.9857754, -1.392054, 1, 0, 0, 1, 1,
0.9963257, 1.108211, 0.5868396, 1, 0, 0, 1, 1,
1.00238, -0.0765959, 2.373908, 1, 0, 0, 1, 1,
1.004475, 0.4691842, 2.301956, 1, 0, 0, 1, 1,
1.005329, 0.06373446, 0.5341883, 1, 0, 0, 1, 1,
1.008638, -1.080953, 3.812863, 0, 0, 0, 1, 1,
1.010084, 0.1063508, 1.35867, 0, 0, 0, 1, 1,
1.016577, 1.536799, -1.903373, 0, 0, 0, 1, 1,
1.023536, 0.5212496, 2.474221, 0, 0, 0, 1, 1,
1.02478, 1.233629, 1.571373, 0, 0, 0, 1, 1,
1.025341, 0.9026872, 0.4436371, 0, 0, 0, 1, 1,
1.02676, -0.3184989, 2.629727, 0, 0, 0, 1, 1,
1.026997, -1.030965, 1.428606, 1, 1, 1, 1, 1,
1.034678, -0.7472141, 3.084276, 1, 1, 1, 1, 1,
1.037151, 1.288516, 0.4210245, 1, 1, 1, 1, 1,
1.04189, 2.094568, -0.3180015, 1, 1, 1, 1, 1,
1.043101, 0.2945242, 1.84922, 1, 1, 1, 1, 1,
1.043968, 1.339941, 0.9494688, 1, 1, 1, 1, 1,
1.052869, -2.233642, 1.834534, 1, 1, 1, 1, 1,
1.053078, 0.02604212, 0.1755767, 1, 1, 1, 1, 1,
1.055718, -0.4316412, 2.006751, 1, 1, 1, 1, 1,
1.057811, 0.06524432, 0.03490039, 1, 1, 1, 1, 1,
1.059221, -0.3868506, 0.6782404, 1, 1, 1, 1, 1,
1.061534, 0.3364703, 2.538975, 1, 1, 1, 1, 1,
1.063297, 0.7410561, 2.47469, 1, 1, 1, 1, 1,
1.066271, 1.255852, 2.154468, 1, 1, 1, 1, 1,
1.06934, 0.3916512, 2.950298, 1, 1, 1, 1, 1,
1.08299, -1.428935, 2.526593, 0, 0, 1, 1, 1,
1.087654, 0.02397153, 1.196345, 1, 0, 0, 1, 1,
1.09447, 0.2858586, 0.1669866, 1, 0, 0, 1, 1,
1.09498, 1.842163, -0.8443422, 1, 0, 0, 1, 1,
1.099789, 0.2639158, 2.773839, 1, 0, 0, 1, 1,
1.109341, -1.210509, 2.308615, 1, 0, 0, 1, 1,
1.109977, 0.6791599, 1.834428, 0, 0, 0, 1, 1,
1.11874, 0.004043998, 0.9478605, 0, 0, 0, 1, 1,
1.125932, -2.465055, 3.290313, 0, 0, 0, 1, 1,
1.128159, 0.7495216, 1.652766, 0, 0, 0, 1, 1,
1.130007, 1.141356, 0.6601307, 0, 0, 0, 1, 1,
1.132058, 0.8980584, 2.259674, 0, 0, 0, 1, 1,
1.134281, 0.5513799, -0.3349556, 0, 0, 0, 1, 1,
1.136333, -0.1669316, 0.6696823, 1, 1, 1, 1, 1,
1.141846, 1.510873, 1.793441, 1, 1, 1, 1, 1,
1.154916, -0.8021696, 2.509694, 1, 1, 1, 1, 1,
1.156702, 0.3427044, 0.176051, 1, 1, 1, 1, 1,
1.166158, 1.814025, -1.013802, 1, 1, 1, 1, 1,
1.190935, -0.3546025, 1.820176, 1, 1, 1, 1, 1,
1.196771, -0.6284142, 1.506098, 1, 1, 1, 1, 1,
1.199671, -0.4901728, 1.542645, 1, 1, 1, 1, 1,
1.21551, 0.249, 1.180323, 1, 1, 1, 1, 1,
1.216216, 1.307379, 1.737023, 1, 1, 1, 1, 1,
1.217849, 0.4769182, 2.917519, 1, 1, 1, 1, 1,
1.219351, -0.7410384, 1.994197, 1, 1, 1, 1, 1,
1.220178, -0.1397125, 1.587098, 1, 1, 1, 1, 1,
1.233781, 0.9569363, -0.5190697, 1, 1, 1, 1, 1,
1.236124, 0.6884559, 1.509704, 1, 1, 1, 1, 1,
1.238369, -1.345837, 0.4764566, 0, 0, 1, 1, 1,
1.244986, -0.9055179, 0.9144679, 1, 0, 0, 1, 1,
1.245504, -2.283152, 2.205173, 1, 0, 0, 1, 1,
1.260059, -0.6285614, 2.950037, 1, 0, 0, 1, 1,
1.267507, 0.6598577, 0.9831672, 1, 0, 0, 1, 1,
1.272889, 1.427773, 0.6070911, 1, 0, 0, 1, 1,
1.274582, -1.573782, 3.708575, 0, 0, 0, 1, 1,
1.275173, 1.376169, 1.52164, 0, 0, 0, 1, 1,
1.277397, 0.53066, 3.410572, 0, 0, 0, 1, 1,
1.278413, -0.1154784, 1.297912, 0, 0, 0, 1, 1,
1.283378, 0.4244233, 1.043582, 0, 0, 0, 1, 1,
1.288381, 0.8962227, 0.473975, 0, 0, 0, 1, 1,
1.292387, 0.9954084, 1.768543, 0, 0, 0, 1, 1,
1.292566, 1.626739, -0.2724327, 1, 1, 1, 1, 1,
1.294317, -1.1386, 0.9138927, 1, 1, 1, 1, 1,
1.295711, 0.692654, 0.3161907, 1, 1, 1, 1, 1,
1.297536, -0.7188633, 1.577549, 1, 1, 1, 1, 1,
1.299536, 0.669719, 2.659473, 1, 1, 1, 1, 1,
1.302478, 0.4002101, 1.239678, 1, 1, 1, 1, 1,
1.3072, -0.1281654, 2.297957, 1, 1, 1, 1, 1,
1.312478, -0.8760917, 3.09029, 1, 1, 1, 1, 1,
1.323002, 2.643468, 0.1175847, 1, 1, 1, 1, 1,
1.328066, 0.6069225, 0.6619428, 1, 1, 1, 1, 1,
1.329705, -0.3401591, 2.994955, 1, 1, 1, 1, 1,
1.33001, -1.426902, 4.112024, 1, 1, 1, 1, 1,
1.331289, -0.141581, 2.252838, 1, 1, 1, 1, 1,
1.331312, 0.2238896, 0.9714348, 1, 1, 1, 1, 1,
1.336258, 0.3718081, 3.342415, 1, 1, 1, 1, 1,
1.340488, 0.5745319, 2.010091, 0, 0, 1, 1, 1,
1.340896, -0.7916871, 3.087363, 1, 0, 0, 1, 1,
1.349387, 0.2161432, 1.545979, 1, 0, 0, 1, 1,
1.351303, -0.5525693, 4.453207, 1, 0, 0, 1, 1,
1.369198, -0.9422446, 1.837625, 1, 0, 0, 1, 1,
1.373204, -0.005646273, 2.014606, 1, 0, 0, 1, 1,
1.374241, -1.841562, 2.252759, 0, 0, 0, 1, 1,
1.377675, 0.655759, 1.98574, 0, 0, 0, 1, 1,
1.377956, 0.08143803, 1.895411, 0, 0, 0, 1, 1,
1.38629, 0.8882725, 1.715175, 0, 0, 0, 1, 1,
1.394764, -0.6016447, 1.329293, 0, 0, 0, 1, 1,
1.403071, 0.4979872, 1.735944, 0, 0, 0, 1, 1,
1.408856, -0.1410192, 1.022551, 0, 0, 0, 1, 1,
1.409439, 1.135865, -0.5311394, 1, 1, 1, 1, 1,
1.411909, 1.765385, 0.9044918, 1, 1, 1, 1, 1,
1.42352, 0.753645, 2.539665, 1, 1, 1, 1, 1,
1.427028, 0.4945971, 2.019425, 1, 1, 1, 1, 1,
1.431233, -0.8398334, 2.075906, 1, 1, 1, 1, 1,
1.433749, 0.9053113, -0.02154859, 1, 1, 1, 1, 1,
1.444971, -0.04502901, 2.102344, 1, 1, 1, 1, 1,
1.450629, 1.230354, -0.1398802, 1, 1, 1, 1, 1,
1.452079, 0.3447659, 1.217722, 1, 1, 1, 1, 1,
1.453678, 1.003882, 0.8901331, 1, 1, 1, 1, 1,
1.458351, -1.265822, 0.6925195, 1, 1, 1, 1, 1,
1.460526, -0.8978005, 2.351093, 1, 1, 1, 1, 1,
1.46193, 0.2590221, 1.21547, 1, 1, 1, 1, 1,
1.465852, -0.2864499, 2.487261, 1, 1, 1, 1, 1,
1.465998, -0.9896552, 2.048767, 1, 1, 1, 1, 1,
1.468069, 1.035215, 0.7002512, 0, 0, 1, 1, 1,
1.476712, 0.9349686, 0.3757281, 1, 0, 0, 1, 1,
1.478072, -1.11911, 2.429876, 1, 0, 0, 1, 1,
1.486857, 2.200027, -0.2933625, 1, 0, 0, 1, 1,
1.494172, 1.098614, -0.6840521, 1, 0, 0, 1, 1,
1.494305, -1.737762, 1.566152, 1, 0, 0, 1, 1,
1.49742, -1.07314, 2.265998, 0, 0, 0, 1, 1,
1.504073, -0.437773, 0.2871238, 0, 0, 0, 1, 1,
1.520132, -0.8869551, 2.245563, 0, 0, 0, 1, 1,
1.522627, 0.5632122, 2.001598, 0, 0, 0, 1, 1,
1.523003, -0.3233629, 2.652624, 0, 0, 0, 1, 1,
1.526357, 0.7993674, 1.065889, 0, 0, 0, 1, 1,
1.528869, 1.471738, 0.9216467, 0, 0, 0, 1, 1,
1.541151, 0.2214039, 1.853886, 1, 1, 1, 1, 1,
1.544302, -1.050548, 2.99433, 1, 1, 1, 1, 1,
1.578528, 0.07919075, 1.966053, 1, 1, 1, 1, 1,
1.597766, -0.02130313, 1.259916, 1, 1, 1, 1, 1,
1.609333, -0.9007811, 1.712772, 1, 1, 1, 1, 1,
1.611174, 0.1661986, 2.218013, 1, 1, 1, 1, 1,
1.611329, -0.2856616, 2.715342, 1, 1, 1, 1, 1,
1.624593, 1.428652, 2.219056, 1, 1, 1, 1, 1,
1.625821, -1.793464, 1.391309, 1, 1, 1, 1, 1,
1.626179, 0.7627168, 2.956996, 1, 1, 1, 1, 1,
1.633463, 0.8226744, 0.5650843, 1, 1, 1, 1, 1,
1.654209, 1.36456, 1.719803, 1, 1, 1, 1, 1,
1.656086, -0.6681197, 2.961119, 1, 1, 1, 1, 1,
1.707257, -0.1073369, 0.4721241, 1, 1, 1, 1, 1,
1.709611, -1.329912, 1.379669, 1, 1, 1, 1, 1,
1.71427, 0.7512469, 2.425333, 0, 0, 1, 1, 1,
1.72384, 0.6464493, 1.060931, 1, 0, 0, 1, 1,
1.738948, 1.070843, 0.0667746, 1, 0, 0, 1, 1,
1.743352, 0.7945523, 0.3159756, 1, 0, 0, 1, 1,
1.755722, 1.036486, 2.098946, 1, 0, 0, 1, 1,
1.758943, -1.190293, 1.069348, 1, 0, 0, 1, 1,
1.761603, -0.7656466, 2.159788, 0, 0, 0, 1, 1,
1.768188, -0.3619843, 1.338685, 0, 0, 0, 1, 1,
1.772075, 0.9361451, 0.9611586, 0, 0, 0, 1, 1,
1.785764, -1.35748, 4.043235, 0, 0, 0, 1, 1,
1.797668, 0.1863157, 2.204937, 0, 0, 0, 1, 1,
1.798659, -0.04765673, 1.172133, 0, 0, 0, 1, 1,
1.81318, -0.7148272, 3.049021, 0, 0, 0, 1, 1,
1.815116, 0.8815596, 2.734851, 1, 1, 1, 1, 1,
1.831071, 0.7035691, 0.6903193, 1, 1, 1, 1, 1,
1.833826, 0.190101, 3.18892, 1, 1, 1, 1, 1,
1.836707, -1.120836, -0.04517672, 1, 1, 1, 1, 1,
1.844894, 0.5334213, 2.114988, 1, 1, 1, 1, 1,
1.875294, -1.836949, 1.65642, 1, 1, 1, 1, 1,
1.885276, 0.9523178, 0.573716, 1, 1, 1, 1, 1,
1.964893, 0.4374496, 0.07888547, 1, 1, 1, 1, 1,
1.965607, 0.1811249, 0.7799808, 1, 1, 1, 1, 1,
1.969173, 0.3739595, 1.467588, 1, 1, 1, 1, 1,
1.976674, -0.2818488, 2.482611, 1, 1, 1, 1, 1,
1.982136, -0.5007076, 2.575077, 1, 1, 1, 1, 1,
1.992979, -0.82008, 4.09933, 1, 1, 1, 1, 1,
2.018374, 0.7059916, 1.182781, 1, 1, 1, 1, 1,
2.021386, -0.2390094, 1.646054, 1, 1, 1, 1, 1,
2.023705, 1.275138, 1.775359, 0, 0, 1, 1, 1,
2.049701, -0.8922395, 2.518523, 1, 0, 0, 1, 1,
2.160798, -0.2109382, -0.9103255, 1, 0, 0, 1, 1,
2.200531, -0.4087963, 1.22628, 1, 0, 0, 1, 1,
2.204191, -1.312768, 1.02691, 1, 0, 0, 1, 1,
2.21026, -1.720695, 1.910808, 1, 0, 0, 1, 1,
2.273696, 0.8637865, -0.2895322, 0, 0, 0, 1, 1,
2.321788, -1.022118, 1.472075, 0, 0, 0, 1, 1,
2.422675, -1.441678, 0.4241617, 0, 0, 0, 1, 1,
2.442494, -0.07360969, -0.3641508, 0, 0, 0, 1, 1,
2.478475, 1.819844, 0.6404645, 0, 0, 0, 1, 1,
2.502741, 0.1846635, 3.029057, 0, 0, 0, 1, 1,
2.538053, -0.8476064, 3.624213, 0, 0, 0, 1, 1,
2.634851, 0.7242699, 1.126163, 1, 1, 1, 1, 1,
2.640986, 0.3671202, 0.1183375, 1, 1, 1, 1, 1,
2.715219, -0.09910084, 1.97089, 1, 1, 1, 1, 1,
2.821351, 0.4284067, 1.667908, 1, 1, 1, 1, 1,
2.958049, 0.8342245, 1.082551, 1, 1, 1, 1, 1,
3.111864, -0.799401, 1.322931, 1, 1, 1, 1, 1,
5.027736, -1.195122, 3.297243, 1, 1, 1, 1, 1
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
var radius = 10.21672;
var distance = 35.88579;
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
mvMatrix.translate( -1.138945, 0.3379052, 0.6987331 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.88579);
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
