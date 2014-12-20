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
-3.169854, 1.595336, -1.786659, 1, 0, 0, 1,
-2.623906, 0.7202967, -1.255523, 1, 0.007843138, 0, 1,
-2.605909, 0.501111, -1.710353, 1, 0.01176471, 0, 1,
-2.474285, -1.161164, -3.445106, 1, 0.01960784, 0, 1,
-2.420395, -1.199334, -1.417532, 1, 0.02352941, 0, 1,
-2.365448, 0.2602161, -0.5586919, 1, 0.03137255, 0, 1,
-2.208871, 1.314863, 0.2939561, 1, 0.03529412, 0, 1,
-2.139186, -0.5098262, -3.176246, 1, 0.04313726, 0, 1,
-2.119537, 1.433929, -0.7878025, 1, 0.04705882, 0, 1,
-2.028384, 1.799324, 0.1842335, 1, 0.05490196, 0, 1,
-2.017213, 0.06904261, -3.34611, 1, 0.05882353, 0, 1,
-2.011185, 0.790285, -1.16608, 1, 0.06666667, 0, 1,
-1.991588, 0.2667524, 0.1659295, 1, 0.07058824, 0, 1,
-1.937752, 0.1834695, -2.826912, 1, 0.07843138, 0, 1,
-1.935849, -1.045001, -2.009157, 1, 0.08235294, 0, 1,
-1.92934, 1.255722, 0.048866, 1, 0.09019608, 0, 1,
-1.906487, -0.6134501, -2.861592, 1, 0.09411765, 0, 1,
-1.892313, -0.7715783, -2.480841, 1, 0.1019608, 0, 1,
-1.889557, -0.7373973, -2.802579, 1, 0.1098039, 0, 1,
-1.877367, 1.930675, 0.02394462, 1, 0.1137255, 0, 1,
-1.843627, -1.490586, -1.485327, 1, 0.1215686, 0, 1,
-1.821728, 0.7024626, -1.192752, 1, 0.1254902, 0, 1,
-1.821241, -0.2885886, -2.073828, 1, 0.1333333, 0, 1,
-1.789242, 0.6962267, -2.197718, 1, 0.1372549, 0, 1,
-1.782126, -0.7710368, -1.327315, 1, 0.145098, 0, 1,
-1.760824, 0.6642173, -0.736573, 1, 0.1490196, 0, 1,
-1.757479, 1.077487, -0.8475667, 1, 0.1568628, 0, 1,
-1.753408, 1.483132, 0.02321441, 1, 0.1607843, 0, 1,
-1.743466, 1.072154, -1.922317, 1, 0.1686275, 0, 1,
-1.717874, -0.388041, -0.5864385, 1, 0.172549, 0, 1,
-1.709616, -1.548568, -3.296566, 1, 0.1803922, 0, 1,
-1.705667, 1.374198, -1.024561, 1, 0.1843137, 0, 1,
-1.704109, 0.6235383, -1.220662, 1, 0.1921569, 0, 1,
-1.697392, 0.9522282, -0.4586941, 1, 0.1960784, 0, 1,
-1.686816, 0.594572, -0.6767098, 1, 0.2039216, 0, 1,
-1.684658, 1.758332, -1.666576, 1, 0.2117647, 0, 1,
-1.657802, -3.272659, -2.768431, 1, 0.2156863, 0, 1,
-1.654284, -2.874991, -0.5016471, 1, 0.2235294, 0, 1,
-1.641776, -0.1599382, -1.171778, 1, 0.227451, 0, 1,
-1.641702, -0.1200383, -1.915292, 1, 0.2352941, 0, 1,
-1.629882, 1.361346, 0.4194047, 1, 0.2392157, 0, 1,
-1.592255, 0.4199339, -0.02674599, 1, 0.2470588, 0, 1,
-1.590776, 1.097204, -1.070185, 1, 0.2509804, 0, 1,
-1.582893, -0.3454246, -1.622056, 1, 0.2588235, 0, 1,
-1.577321, -0.2297751, -0.1664323, 1, 0.2627451, 0, 1,
-1.561608, 0.8120803, -0.7981818, 1, 0.2705882, 0, 1,
-1.558877, -0.0691558, -1.952571, 1, 0.2745098, 0, 1,
-1.531394, -0.2322489, -0.8751564, 1, 0.282353, 0, 1,
-1.529764, -0.8822667, -1.562582, 1, 0.2862745, 0, 1,
-1.524407, -0.07779203, -3.942984, 1, 0.2941177, 0, 1,
-1.510454, 0.1827278, -1.317489, 1, 0.3019608, 0, 1,
-1.501786, -0.5531869, -1.046278, 1, 0.3058824, 0, 1,
-1.497442, -0.8365281, -1.570915, 1, 0.3137255, 0, 1,
-1.480215, -0.4628913, -1.26136, 1, 0.3176471, 0, 1,
-1.477068, 0.3808128, -1.671963, 1, 0.3254902, 0, 1,
-1.468221, -1.641271, -1.732701, 1, 0.3294118, 0, 1,
-1.467942, 0.6509376, -0.8443835, 1, 0.3372549, 0, 1,
-1.467199, 0.07338538, -1.377915, 1, 0.3411765, 0, 1,
-1.464637, 0.4185727, -2.017235, 1, 0.3490196, 0, 1,
-1.450291, -1.251251, -1.144061, 1, 0.3529412, 0, 1,
-1.419975, -0.1994443, -1.205476, 1, 0.3607843, 0, 1,
-1.415233, -1.252616, -0.5086511, 1, 0.3647059, 0, 1,
-1.398142, 1.29058, -0.8929294, 1, 0.372549, 0, 1,
-1.396447, -3.105262, -1.940859, 1, 0.3764706, 0, 1,
-1.39536, -0.2080247, -3.219704, 1, 0.3843137, 0, 1,
-1.39119, -0.9206401, -3.257589, 1, 0.3882353, 0, 1,
-1.386286, 0.2529028, -1.620571, 1, 0.3960784, 0, 1,
-1.375739, 0.9526173, -0.9838012, 1, 0.4039216, 0, 1,
-1.37339, 1.455007, -0.239565, 1, 0.4078431, 0, 1,
-1.372724, -2.023879, -3.243211, 1, 0.4156863, 0, 1,
-1.36054, 0.7712201, -2.84276, 1, 0.4196078, 0, 1,
-1.355752, 0.6255019, -2.268106, 1, 0.427451, 0, 1,
-1.342129, 0.2198844, -1.786208, 1, 0.4313726, 0, 1,
-1.339978, -0.7494301, -1.381499, 1, 0.4392157, 0, 1,
-1.337619, -0.5711404, -2.604542, 1, 0.4431373, 0, 1,
-1.327473, -1.616082, -1.932665, 1, 0.4509804, 0, 1,
-1.32708, 0.4496869, -1.888856, 1, 0.454902, 0, 1,
-1.318877, -2.286659, -4.106362, 1, 0.4627451, 0, 1,
-1.309977, -2.225795, -4.195348, 1, 0.4666667, 0, 1,
-1.30605, -0.5629532, -1.90265, 1, 0.4745098, 0, 1,
-1.299747, 0.6659247, -0.868246, 1, 0.4784314, 0, 1,
-1.287875, -0.1044404, -2.954, 1, 0.4862745, 0, 1,
-1.262065, -1.435423, -3.806594, 1, 0.4901961, 0, 1,
-1.259719, 0.5913958, -0.407302, 1, 0.4980392, 0, 1,
-1.258794, 1.661881, 0.2076495, 1, 0.5058824, 0, 1,
-1.258108, -1.414517, -3.093732, 1, 0.509804, 0, 1,
-1.257121, -0.2336006, -2.691849, 1, 0.5176471, 0, 1,
-1.24772, -0.06049263, -0.6516753, 1, 0.5215687, 0, 1,
-1.246913, -1.01964, -1.814577, 1, 0.5294118, 0, 1,
-1.242964, 1.736072, 0.9732097, 1, 0.5333334, 0, 1,
-1.240192, 0.8133677, 0.01680947, 1, 0.5411765, 0, 1,
-1.216166, -0.1515029, -4.379026, 1, 0.5450981, 0, 1,
-1.214699, 2.163963, -1.296959, 1, 0.5529412, 0, 1,
-1.195633, 1.751209, -1.243243, 1, 0.5568628, 0, 1,
-1.18911, -0.3555059, -1.489404, 1, 0.5647059, 0, 1,
-1.186817, -0.1200062, -1.189631, 1, 0.5686275, 0, 1,
-1.18189, -2.324975, -2.927048, 1, 0.5764706, 0, 1,
-1.180219, -0.5921457, -1.15584, 1, 0.5803922, 0, 1,
-1.17174, 0.04735769, -3.200317, 1, 0.5882353, 0, 1,
-1.167727, 0.7992122, -2.013147, 1, 0.5921569, 0, 1,
-1.161425, -0.3191739, -2.887778, 1, 0.6, 0, 1,
-1.141486, 0.00681851, -1.749158, 1, 0.6078432, 0, 1,
-1.139667, -0.8206427, -3.885151, 1, 0.6117647, 0, 1,
-1.129853, 0.04949436, -0.6222046, 1, 0.6196079, 0, 1,
-1.12248, 1.569955, -1.406528, 1, 0.6235294, 0, 1,
-1.115832, -0.6519503, -1.756422, 1, 0.6313726, 0, 1,
-1.109759, 0.2457245, -1.974053, 1, 0.6352941, 0, 1,
-1.105721, -0.0400041, -2.028831, 1, 0.6431373, 0, 1,
-1.105362, 0.8753524, -1.330663, 1, 0.6470588, 0, 1,
-1.10501, 0.7638057, -1.819102, 1, 0.654902, 0, 1,
-1.095996, -0.1857325, -0.3974033, 1, 0.6588235, 0, 1,
-1.09324, 0.7316929, -1.016179, 1, 0.6666667, 0, 1,
-1.091535, 1.52319, -1.945611, 1, 0.6705883, 0, 1,
-1.081971, 1.061105, -1.539816, 1, 0.6784314, 0, 1,
-1.074373, 0.220738, -1.630983, 1, 0.682353, 0, 1,
-1.072669, 0.2519155, -3.616799, 1, 0.6901961, 0, 1,
-1.069801, -0.4663694, -1.308163, 1, 0.6941177, 0, 1,
-1.065703, -0.579845, -1.492756, 1, 0.7019608, 0, 1,
-1.061732, 1.501045, -0.8420297, 1, 0.7098039, 0, 1,
-1.057336, -0.717255, -2.160548, 1, 0.7137255, 0, 1,
-1.054323, -0.6058364, -4.036645, 1, 0.7215686, 0, 1,
-1.053551, 0.9698152, -1.908794, 1, 0.7254902, 0, 1,
-1.050003, -0.3770014, -2.814143, 1, 0.7333333, 0, 1,
-1.0471, 0.6974841, 0.6368367, 1, 0.7372549, 0, 1,
-1.04067, 1.046342, -3.093908, 1, 0.7450981, 0, 1,
-1.039689, 0.01507514, -0.1575145, 1, 0.7490196, 0, 1,
-1.037727, 0.6184891, -1.70624, 1, 0.7568628, 0, 1,
-1.037333, 0.8870582, 0.5683752, 1, 0.7607843, 0, 1,
-1.034079, -0.720376, -2.705909, 1, 0.7686275, 0, 1,
-1.03348, 0.4904555, -0.5349425, 1, 0.772549, 0, 1,
-1.015302, -1.068352, -2.339797, 1, 0.7803922, 0, 1,
-1.008248, 0.6443582, -1.802527, 1, 0.7843137, 0, 1,
-1.005617, -2.382607, -2.033112, 1, 0.7921569, 0, 1,
-1.000241, -1.268791, -3.136718, 1, 0.7960784, 0, 1,
-0.9998232, 0.3202823, 0.07315533, 1, 0.8039216, 0, 1,
-0.9983946, -1.037378, -0.7653883, 1, 0.8117647, 0, 1,
-0.9946258, 0.1935944, -0.9190468, 1, 0.8156863, 0, 1,
-0.9941434, 1.406726, -2.091539, 1, 0.8235294, 0, 1,
-0.9922717, 0.7659972, -0.5162511, 1, 0.827451, 0, 1,
-0.992104, -0.2965662, -2.418426, 1, 0.8352941, 0, 1,
-0.9865832, -0.05756539, -1.050788, 1, 0.8392157, 0, 1,
-0.9719782, -0.3980885, -3.330002, 1, 0.8470588, 0, 1,
-0.969668, 1.369697, -0.01177626, 1, 0.8509804, 0, 1,
-0.9664613, 0.473227, -0.6659297, 1, 0.8588235, 0, 1,
-0.9642869, 0.580029, -1.117911, 1, 0.8627451, 0, 1,
-0.9534927, -0.1096347, -2.03182, 1, 0.8705882, 0, 1,
-0.953054, 1.348958, -0.5856244, 1, 0.8745098, 0, 1,
-0.9495246, 0.518651, -0.62075, 1, 0.8823529, 0, 1,
-0.9419822, 0.6305668, -1.618754, 1, 0.8862745, 0, 1,
-0.9383653, -1.1647, -2.97809, 1, 0.8941177, 0, 1,
-0.9362797, -2.02916, -3.422753, 1, 0.8980392, 0, 1,
-0.93515, -0.5930102, -3.948914, 1, 0.9058824, 0, 1,
-0.9231687, 1.311258, -2.10354, 1, 0.9137255, 0, 1,
-0.9098911, 1.652141, -0.8784739, 1, 0.9176471, 0, 1,
-0.9083614, 0.7787375, -0.2597665, 1, 0.9254902, 0, 1,
-0.9081975, 0.630946, -0.7246428, 1, 0.9294118, 0, 1,
-0.8965765, -0.3904536, -1.716417, 1, 0.9372549, 0, 1,
-0.8920783, 1.169678, -1.181549, 1, 0.9411765, 0, 1,
-0.8912979, 0.5787939, -0.1847901, 1, 0.9490196, 0, 1,
-0.8885019, -0.6596648, -2.715203, 1, 0.9529412, 0, 1,
-0.8853261, -0.04044551, -1.113398, 1, 0.9607843, 0, 1,
-0.8851004, 0.4788556, -2.709335, 1, 0.9647059, 0, 1,
-0.8838139, -1.409008, -3.237388, 1, 0.972549, 0, 1,
-0.8760911, -0.003990467, 0.5388191, 1, 0.9764706, 0, 1,
-0.8751861, -1.20254, -2.723478, 1, 0.9843137, 0, 1,
-0.8718891, 2.016738, 0.7363518, 1, 0.9882353, 0, 1,
-0.8651478, -1.048888, -1.667403, 1, 0.9960784, 0, 1,
-0.8597242, -0.4897524, -0.9059368, 0.9960784, 1, 0, 1,
-0.8585683, 0.4708517, 0.08109626, 0.9921569, 1, 0, 1,
-0.8542488, 0.0450107, -2.88173, 0.9843137, 1, 0, 1,
-0.8540058, -0.09324702, -0.5164379, 0.9803922, 1, 0, 1,
-0.8470223, -1.640795, -2.276258, 0.972549, 1, 0, 1,
-0.8450855, -1.451544, -0.04936609, 0.9686275, 1, 0, 1,
-0.8444007, 2.36359, -2.031416, 0.9607843, 1, 0, 1,
-0.8337592, -0.443714, -2.869288, 0.9568627, 1, 0, 1,
-0.8295429, -0.6005599, -0.495047, 0.9490196, 1, 0, 1,
-0.8196995, -0.8141925, -2.237807, 0.945098, 1, 0, 1,
-0.8165997, 1.746999, -1.936822, 0.9372549, 1, 0, 1,
-0.8163712, -0.0593727, -3.635915, 0.9333333, 1, 0, 1,
-0.8138627, -1.698363, -2.416735, 0.9254902, 1, 0, 1,
-0.8130674, 0.8886591, -1.959875, 0.9215686, 1, 0, 1,
-0.8112119, -0.9971193, -0.5736042, 0.9137255, 1, 0, 1,
-0.8107736, -0.7156669, -2.888909, 0.9098039, 1, 0, 1,
-0.8058576, 0.5077142, -1.427525, 0.9019608, 1, 0, 1,
-0.8036345, -1.348503, -3.030955, 0.8941177, 1, 0, 1,
-0.8014478, 0.2948478, -0.6204645, 0.8901961, 1, 0, 1,
-0.8000227, -0.09553193, -0.9453085, 0.8823529, 1, 0, 1,
-0.7990766, -0.332199, -2.068153, 0.8784314, 1, 0, 1,
-0.7961425, -0.6812698, -1.913636, 0.8705882, 1, 0, 1,
-0.7951336, -1.732577, -2.824318, 0.8666667, 1, 0, 1,
-0.794834, 0.4365223, 0.07511137, 0.8588235, 1, 0, 1,
-0.7937385, 1.981069, 0.647682, 0.854902, 1, 0, 1,
-0.7906953, 0.4471103, 0.3980717, 0.8470588, 1, 0, 1,
-0.7879443, 2.524994, -1.711193, 0.8431373, 1, 0, 1,
-0.7855041, -0.9557251, -5.838611, 0.8352941, 1, 0, 1,
-0.7791517, -0.714884, 0.3854393, 0.8313726, 1, 0, 1,
-0.7709061, -0.4234215, -1.62131, 0.8235294, 1, 0, 1,
-0.766545, 0.8479076, -2.795316, 0.8196079, 1, 0, 1,
-0.762701, -0.08873583, -1.130095, 0.8117647, 1, 0, 1,
-0.7620179, 0.6605444, -0.1765604, 0.8078431, 1, 0, 1,
-0.760314, 0.1288292, -2.21465, 0.8, 1, 0, 1,
-0.7476675, -0.9553071, -2.151661, 0.7921569, 1, 0, 1,
-0.7377072, 0.192154, -0.7430269, 0.7882353, 1, 0, 1,
-0.736768, 1.92211, -0.8820173, 0.7803922, 1, 0, 1,
-0.7366652, 0.3803751, -1.189386, 0.7764706, 1, 0, 1,
-0.7347605, 1.697666, -0.1220658, 0.7686275, 1, 0, 1,
-0.734287, -0.91311, -2.294428, 0.7647059, 1, 0, 1,
-0.733609, -0.1193363, -2.034681, 0.7568628, 1, 0, 1,
-0.7332747, -0.02931866, -1.710366, 0.7529412, 1, 0, 1,
-0.7302853, -1.264983, -3.701044, 0.7450981, 1, 0, 1,
-0.726321, -0.3709559, -1.7238, 0.7411765, 1, 0, 1,
-0.7199371, 0.8829584, -1.018534, 0.7333333, 1, 0, 1,
-0.7166274, -1.841259, -2.259363, 0.7294118, 1, 0, 1,
-0.714519, 0.9712646, 1.627903, 0.7215686, 1, 0, 1,
-0.7126541, 0.2244661, -1.055277, 0.7176471, 1, 0, 1,
-0.7114851, -3.413309, -3.169277, 0.7098039, 1, 0, 1,
-0.7069231, -0.02191094, -1.756068, 0.7058824, 1, 0, 1,
-0.7053478, 0.2765963, -1.956245, 0.6980392, 1, 0, 1,
-0.705337, -0.9935661, -2.182174, 0.6901961, 1, 0, 1,
-0.7027215, 0.07038352, -0.358323, 0.6862745, 1, 0, 1,
-0.6890287, -0.03694418, -3.147235, 0.6784314, 1, 0, 1,
-0.6871567, 1.086453, -0.7239323, 0.6745098, 1, 0, 1,
-0.686725, -0.4581814, -1.978921, 0.6666667, 1, 0, 1,
-0.6847785, -0.6980435, -1.931728, 0.6627451, 1, 0, 1,
-0.6821217, -2.594124, -2.534269, 0.654902, 1, 0, 1,
-0.677975, 1.771631, 0.4499745, 0.6509804, 1, 0, 1,
-0.6765496, -0.4382524, -3.058131, 0.6431373, 1, 0, 1,
-0.671005, 0.2215141, -1.894038, 0.6392157, 1, 0, 1,
-0.6683296, 0.9809577, 0.4465912, 0.6313726, 1, 0, 1,
-0.6668687, 0.4164791, -1.562178, 0.627451, 1, 0, 1,
-0.6645548, 0.1334555, -4.517919, 0.6196079, 1, 0, 1,
-0.6613963, -1.487779, -1.066535, 0.6156863, 1, 0, 1,
-0.6606384, 0.4960025, -0.4314123, 0.6078432, 1, 0, 1,
-0.6557777, -1.427344, -2.629839, 0.6039216, 1, 0, 1,
-0.6505793, -0.458588, -2.50351, 0.5960785, 1, 0, 1,
-0.6491293, -0.9108462, -1.215195, 0.5882353, 1, 0, 1,
-0.6442134, 0.9084192, 0.3575551, 0.5843138, 1, 0, 1,
-0.6433434, -0.9800716, -1.716306, 0.5764706, 1, 0, 1,
-0.6398045, -0.3376545, -1.917338, 0.572549, 1, 0, 1,
-0.6362982, -0.6783575, -3.740043, 0.5647059, 1, 0, 1,
-0.6334369, -0.2218103, -2.255514, 0.5607843, 1, 0, 1,
-0.6291758, -1.732878, -2.558202, 0.5529412, 1, 0, 1,
-0.6200578, -0.1836107, -1.089378, 0.5490196, 1, 0, 1,
-0.6179684, 1.151177, -0.3041846, 0.5411765, 1, 0, 1,
-0.6137283, 2.029335, -0.02896619, 0.5372549, 1, 0, 1,
-0.6117105, 0.1369911, -2.395179, 0.5294118, 1, 0, 1,
-0.6096261, -0.9044172, -3.012292, 0.5254902, 1, 0, 1,
-0.6087932, 1.206795, -0.7987359, 0.5176471, 1, 0, 1,
-0.6031474, -0.5044017, -2.949369, 0.5137255, 1, 0, 1,
-0.6016762, -0.6584984, -2.779781, 0.5058824, 1, 0, 1,
-0.597599, -0.00105321, -0.439846, 0.5019608, 1, 0, 1,
-0.5936623, 0.1829268, -1.692493, 0.4941176, 1, 0, 1,
-0.589259, 0.9842262, -0.5960141, 0.4862745, 1, 0, 1,
-0.5868512, 2.319707, 0.6395851, 0.4823529, 1, 0, 1,
-0.5816212, -0.3641697, -2.663337, 0.4745098, 1, 0, 1,
-0.5808814, -1.131248, -3.420075, 0.4705882, 1, 0, 1,
-0.5797784, -0.7331605, -2.686067, 0.4627451, 1, 0, 1,
-0.575196, -0.8729312, -1.89374, 0.4588235, 1, 0, 1,
-0.5750481, -0.9301331, -0.7301584, 0.4509804, 1, 0, 1,
-0.5721176, 1.804055, -0.9000187, 0.4470588, 1, 0, 1,
-0.5718084, -1.425079, -5.894616, 0.4392157, 1, 0, 1,
-0.5636033, -1.528098, -3.562729, 0.4352941, 1, 0, 1,
-0.5605473, -0.2914903, -2.872616, 0.427451, 1, 0, 1,
-0.5536814, -0.2643958, -4.174186, 0.4235294, 1, 0, 1,
-0.5533949, 0.206789, -0.6406435, 0.4156863, 1, 0, 1,
-0.5498811, 0.3745254, -1.087917, 0.4117647, 1, 0, 1,
-0.5430542, -0.6918874, -1.959163, 0.4039216, 1, 0, 1,
-0.5408518, 0.04564249, -0.09388361, 0.3960784, 1, 0, 1,
-0.5404893, -0.5484899, -2.146478, 0.3921569, 1, 0, 1,
-0.5393983, -0.6745339, -2.655603, 0.3843137, 1, 0, 1,
-0.5373316, 1.904362, 0.02384824, 0.3803922, 1, 0, 1,
-0.5351204, 0.8934982, -1.157463, 0.372549, 1, 0, 1,
-0.5316154, -0.5376843, -1.523696, 0.3686275, 1, 0, 1,
-0.5276173, -0.4261653, -1.973908, 0.3607843, 1, 0, 1,
-0.5261813, -2.792423, -4.408867, 0.3568628, 1, 0, 1,
-0.5257719, -2.431037, -2.76479, 0.3490196, 1, 0, 1,
-0.5248095, -0.824437, -2.352409, 0.345098, 1, 0, 1,
-0.5231346, -1.795011, -1.695486, 0.3372549, 1, 0, 1,
-0.5230049, 1.754498, -0.1159413, 0.3333333, 1, 0, 1,
-0.5221093, 0.5814745, -0.3615497, 0.3254902, 1, 0, 1,
-0.5207027, -1.20111, -3.415073, 0.3215686, 1, 0, 1,
-0.5192817, 2.176956, -0.188092, 0.3137255, 1, 0, 1,
-0.5147696, -1.172651, -3.097149, 0.3098039, 1, 0, 1,
-0.5147145, -2.392318, -1.630409, 0.3019608, 1, 0, 1,
-0.5143965, 0.3707989, -0.229993, 0.2941177, 1, 0, 1,
-0.5114077, 0.3536581, -0.5472101, 0.2901961, 1, 0, 1,
-0.5004569, 1.336071, -0.998951, 0.282353, 1, 0, 1,
-0.4991487, 1.161832, -1.387253, 0.2784314, 1, 0, 1,
-0.4989187, 0.0644442, -1.731727, 0.2705882, 1, 0, 1,
-0.4988657, 0.4651493, -1.2014, 0.2666667, 1, 0, 1,
-0.4984907, -0.7388902, -1.479405, 0.2588235, 1, 0, 1,
-0.4975507, 0.4768079, 0.007291214, 0.254902, 1, 0, 1,
-0.4912377, -2.149705, -2.609399, 0.2470588, 1, 0, 1,
-0.4894162, 0.3663946, -1.052538, 0.2431373, 1, 0, 1,
-0.4814394, -0.1280458, -1.700736, 0.2352941, 1, 0, 1,
-0.4778705, -0.03056719, -1.646997, 0.2313726, 1, 0, 1,
-0.4777879, -0.4107847, -3.56847, 0.2235294, 1, 0, 1,
-0.4771716, -1.95624, -4.289983, 0.2196078, 1, 0, 1,
-0.4748721, -0.3644192, -1.03177, 0.2117647, 1, 0, 1,
-0.4717959, 0.3544889, -3.083203, 0.2078431, 1, 0, 1,
-0.4706843, -0.6276779, -1.965799, 0.2, 1, 0, 1,
-0.4696822, 1.600977, 1.093435, 0.1921569, 1, 0, 1,
-0.4688182, -0.5902092, -2.990264, 0.1882353, 1, 0, 1,
-0.4647433, -1.248521, -1.941358, 0.1803922, 1, 0, 1,
-0.464046, 1.917407, 0.6774945, 0.1764706, 1, 0, 1,
-0.4604428, -1.051123, -0.8864285, 0.1686275, 1, 0, 1,
-0.4601062, -0.2194146, -2.510861, 0.1647059, 1, 0, 1,
-0.4589557, -0.04256263, -1.263655, 0.1568628, 1, 0, 1,
-0.4587581, 1.75043, 0.3041527, 0.1529412, 1, 0, 1,
-0.4532777, -0.05142435, -1.142201, 0.145098, 1, 0, 1,
-0.4514937, 0.5577414, -0.4870528, 0.1411765, 1, 0, 1,
-0.4495953, -1.700913, -3.142065, 0.1333333, 1, 0, 1,
-0.439808, 1.12631, -0.3687453, 0.1294118, 1, 0, 1,
-0.4392436, -0.4402014, -2.852536, 0.1215686, 1, 0, 1,
-0.4375879, -1.457601, -3.793588, 0.1176471, 1, 0, 1,
-0.4290998, -0.9043524, -2.228593, 0.1098039, 1, 0, 1,
-0.4283904, 1.675576, -0.4367711, 0.1058824, 1, 0, 1,
-0.4243923, -0.6513212, -3.769765, 0.09803922, 1, 0, 1,
-0.421646, 0.4644669, -1.753512, 0.09019608, 1, 0, 1,
-0.4213492, 0.3122683, -1.263376, 0.08627451, 1, 0, 1,
-0.4190058, -0.663285, -2.004853, 0.07843138, 1, 0, 1,
-0.4172028, 1.181562, -2.311576, 0.07450981, 1, 0, 1,
-0.4127318, 0.1221678, -1.173218, 0.06666667, 1, 0, 1,
-0.4118573, -0.6798488, -2.083454, 0.0627451, 1, 0, 1,
-0.4078206, -0.9806768, -1.684601, 0.05490196, 1, 0, 1,
-0.4046485, 1.257201, -1.463447, 0.05098039, 1, 0, 1,
-0.4016708, -0.03065868, -1.097504, 0.04313726, 1, 0, 1,
-0.399713, 0.05302155, 0.2743765, 0.03921569, 1, 0, 1,
-0.3963629, -1.751461, -2.70747, 0.03137255, 1, 0, 1,
-0.3944148, 2.055463, 1.291585, 0.02745098, 1, 0, 1,
-0.3925375, 0.1846086, -1.02209, 0.01960784, 1, 0, 1,
-0.3922422, -0.1363291, 0.3088442, 0.01568628, 1, 0, 1,
-0.3918354, -0.4323809, -2.446413, 0.007843138, 1, 0, 1,
-0.3885158, -0.6440079, -1.322703, 0.003921569, 1, 0, 1,
-0.3860002, -0.485943, -1.695449, 0, 1, 0.003921569, 1,
-0.3853057, 0.8836757, -1.255969, 0, 1, 0.01176471, 1,
-0.3837773, -1.512956, -2.866748, 0, 1, 0.01568628, 1,
-0.3825651, -0.2857427, -1.816278, 0, 1, 0.02352941, 1,
-0.3816921, -1.00595, -1.983779, 0, 1, 0.02745098, 1,
-0.3813265, 0.04303754, -0.2601903, 0, 1, 0.03529412, 1,
-0.379676, 1.103205, 0.7568403, 0, 1, 0.03921569, 1,
-0.3780661, -0.2321801, -3.359008, 0, 1, 0.04705882, 1,
-0.3777476, 1.125293, -0.8443474, 0, 1, 0.05098039, 1,
-0.3775567, -0.348087, -2.619531, 0, 1, 0.05882353, 1,
-0.3733528, -0.2563619, -1.139936, 0, 1, 0.0627451, 1,
-0.3650117, 0.8971279, 0.355772, 0, 1, 0.07058824, 1,
-0.3627165, 0.6449018, -1.979991, 0, 1, 0.07450981, 1,
-0.3595251, -0.7361034, -2.069763, 0, 1, 0.08235294, 1,
-0.3526285, 0.0222657, -1.337735, 0, 1, 0.08627451, 1,
-0.3518751, -0.7043754, -0.6489499, 0, 1, 0.09411765, 1,
-0.3509682, 0.7576278, -1.003769, 0, 1, 0.1019608, 1,
-0.3493148, -1.159885, -0.06794704, 0, 1, 0.1058824, 1,
-0.3464086, -0.1972915, -3.705551, 0, 1, 0.1137255, 1,
-0.3444465, 0.341525, -1.264896, 0, 1, 0.1176471, 1,
-0.3424298, -0.4368799, -1.221035, 0, 1, 0.1254902, 1,
-0.3400412, -0.4419428, -2.975747, 0, 1, 0.1294118, 1,
-0.3396773, -2.087511, -2.972291, 0, 1, 0.1372549, 1,
-0.3341054, -0.02288264, -0.4028965, 0, 1, 0.1411765, 1,
-0.332413, 2.408914, -3.126739, 0, 1, 0.1490196, 1,
-0.3272709, 0.3887209, -0.02782108, 0, 1, 0.1529412, 1,
-0.3235394, 0.02546897, 0.7690111, 0, 1, 0.1607843, 1,
-0.3224849, 1.055622, -1.047775, 0, 1, 0.1647059, 1,
-0.3220673, -1.952444, -2.70406, 0, 1, 0.172549, 1,
-0.3196251, -1.987769, -3.330003, 0, 1, 0.1764706, 1,
-0.3189285, 0.4674025, 0.3791536, 0, 1, 0.1843137, 1,
-0.3152395, -0.5229232, -2.068004, 0, 1, 0.1882353, 1,
-0.3149855, 0.7085669, -1.373249, 0, 1, 0.1960784, 1,
-0.3120909, 1.070127, -1.015751, 0, 1, 0.2039216, 1,
-0.3095849, 2.068376, 0.2590246, 0, 1, 0.2078431, 1,
-0.3092975, 1.390947, 0.008804366, 0, 1, 0.2156863, 1,
-0.3038019, -0.8788033, -2.551117, 0, 1, 0.2196078, 1,
-0.2991422, -1.002509, -1.482184, 0, 1, 0.227451, 1,
-0.2989925, -0.02629862, -2.222962, 0, 1, 0.2313726, 1,
-0.2979115, 0.2942254, -0.6233624, 0, 1, 0.2392157, 1,
-0.2967256, 0.9117759, -0.5591467, 0, 1, 0.2431373, 1,
-0.2966668, 2.26215, 1.136974, 0, 1, 0.2509804, 1,
-0.2956596, 1.324987, -0.6251355, 0, 1, 0.254902, 1,
-0.2940691, -0.2611435, -2.166174, 0, 1, 0.2627451, 1,
-0.2878116, 0.1656545, -2.161, 0, 1, 0.2666667, 1,
-0.2875403, -0.8141418, -1.350079, 0, 1, 0.2745098, 1,
-0.2816483, 0.3267906, -0.5984257, 0, 1, 0.2784314, 1,
-0.2796804, -0.5415469, -1.582724, 0, 1, 0.2862745, 1,
-0.2747784, 0.7205203, 2.040418, 0, 1, 0.2901961, 1,
-0.2716739, -0.04977264, -1.57854, 0, 1, 0.2980392, 1,
-0.2712671, -2.99791, -2.789837, 0, 1, 0.3058824, 1,
-0.2679394, 0.6344548, -0.9576314, 0, 1, 0.3098039, 1,
-0.2651631, -0.4525713, -1.34046, 0, 1, 0.3176471, 1,
-0.2622871, 0.1993028, -0.8321216, 0, 1, 0.3215686, 1,
-0.2621961, 0.7278672, -0.1943532, 0, 1, 0.3294118, 1,
-0.2620098, -0.7312607, -1.55381, 0, 1, 0.3333333, 1,
-0.2595707, -0.01615666, -1.440214, 0, 1, 0.3411765, 1,
-0.2580621, 0.703662, -0.4048291, 0, 1, 0.345098, 1,
-0.2567885, -1.209153, -1.704868, 0, 1, 0.3529412, 1,
-0.2562841, 1.674913, 1.591352, 0, 1, 0.3568628, 1,
-0.2545388, 1.27201, 0.7632378, 0, 1, 0.3647059, 1,
-0.2520257, -0.2395103, -0.5637518, 0, 1, 0.3686275, 1,
-0.2509106, 0.4273972, -0.2331832, 0, 1, 0.3764706, 1,
-0.2486807, -0.1992792, -2.19399, 0, 1, 0.3803922, 1,
-0.2485334, -1.529139, -3.468274, 0, 1, 0.3882353, 1,
-0.2473404, 0.2784279, -0.7812611, 0, 1, 0.3921569, 1,
-0.2464411, 0.6239461, -1.866566, 0, 1, 0.4, 1,
-0.2462512, -0.4431744, -3.070608, 0, 1, 0.4078431, 1,
-0.2425691, -0.1416474, -3.326926, 0, 1, 0.4117647, 1,
-0.2399919, 1.011866, 0.5260422, 0, 1, 0.4196078, 1,
-0.2385543, -0.1510183, -1.700424, 0, 1, 0.4235294, 1,
-0.2383505, -1.127892, -3.404406, 0, 1, 0.4313726, 1,
-0.2352636, 1.626998, 0.03175057, 0, 1, 0.4352941, 1,
-0.2303092, -0.2203332, -1.929734, 0, 1, 0.4431373, 1,
-0.2292681, 1.064997, -2.466056, 0, 1, 0.4470588, 1,
-0.2291336, 1.570592, 0.1560326, 0, 1, 0.454902, 1,
-0.2242196, 0.9842184, 0.502494, 0, 1, 0.4588235, 1,
-0.2224968, 0.1873199, 0.3245246, 0, 1, 0.4666667, 1,
-0.2175877, 0.6467854, 0.5066, 0, 1, 0.4705882, 1,
-0.2164729, -1.193911, -2.117274, 0, 1, 0.4784314, 1,
-0.2143391, 0.257563, -1.315587, 0, 1, 0.4823529, 1,
-0.2140491, 0.3585694, -0.5796847, 0, 1, 0.4901961, 1,
-0.2135121, 0.5436898, -1.960649, 0, 1, 0.4941176, 1,
-0.21119, -0.5901681, -3.480772, 0, 1, 0.5019608, 1,
-0.2106172, -0.9020753, -3.961899, 0, 1, 0.509804, 1,
-0.2054809, 0.02430638, -2.422913, 0, 1, 0.5137255, 1,
-0.2035691, -1.612543, -2.63485, 0, 1, 0.5215687, 1,
-0.2033721, -0.9051734, -2.817365, 0, 1, 0.5254902, 1,
-0.1990587, -0.3645864, -1.602278, 0, 1, 0.5333334, 1,
-0.1986927, -0.05618931, -0.8592876, 0, 1, 0.5372549, 1,
-0.1975188, -0.777538, -1.538286, 0, 1, 0.5450981, 1,
-0.1973568, -0.9233463, -3.734737, 0, 1, 0.5490196, 1,
-0.1973253, -0.9058732, -2.219035, 0, 1, 0.5568628, 1,
-0.1971563, 0.3850948, -1.581398, 0, 1, 0.5607843, 1,
-0.1953137, 0.2339541, -0.8208385, 0, 1, 0.5686275, 1,
-0.1952334, -1.200542, -4.120315, 0, 1, 0.572549, 1,
-0.1931104, -3.133791, -2.156201, 0, 1, 0.5803922, 1,
-0.1876661, -0.9624177, -3.168442, 0, 1, 0.5843138, 1,
-0.1821939, 1.571542, -0.4457517, 0, 1, 0.5921569, 1,
-0.1800367, 1.303321, -1.972128, 0, 1, 0.5960785, 1,
-0.1780771, 0.3334451, -0.62377, 0, 1, 0.6039216, 1,
-0.1780465, 0.4256986, -1.22328, 0, 1, 0.6117647, 1,
-0.1758457, 0.558028, -0.6942407, 0, 1, 0.6156863, 1,
-0.1756464, -0.6021774, -1.136309, 0, 1, 0.6235294, 1,
-0.1739619, 1.591971, 1.272527, 0, 1, 0.627451, 1,
-0.1713559, -2.113054, -3.437959, 0, 1, 0.6352941, 1,
-0.1700747, 1.10255, 0.178984, 0, 1, 0.6392157, 1,
-0.1691957, -0.6260402, -2.700005, 0, 1, 0.6470588, 1,
-0.1654873, 1.122995, -0.7127552, 0, 1, 0.6509804, 1,
-0.1605781, -0.8417534, -2.91434, 0, 1, 0.6588235, 1,
-0.1584706, 2.441795, 0.04186077, 0, 1, 0.6627451, 1,
-0.1573504, 1.046391, 0.1434162, 0, 1, 0.6705883, 1,
-0.1541253, -1.213343, -2.544353, 0, 1, 0.6745098, 1,
-0.1519964, 0.8370178, -0.1670766, 0, 1, 0.682353, 1,
-0.1470721, 1.675664, -0.01837903, 0, 1, 0.6862745, 1,
-0.1462261, -0.1195839, -1.997937, 0, 1, 0.6941177, 1,
-0.1452497, -0.8701059, -1.538435, 0, 1, 0.7019608, 1,
-0.1422703, 0.5871223, 1.380463, 0, 1, 0.7058824, 1,
-0.142003, -0.4534657, -4.709272, 0, 1, 0.7137255, 1,
-0.1408981, 1.29394, 0.3172803, 0, 1, 0.7176471, 1,
-0.1399208, -0.2350835, -2.949976, 0, 1, 0.7254902, 1,
-0.1390401, -0.09797998, -2.295638, 0, 1, 0.7294118, 1,
-0.1367387, 0.8769085, -0.9701776, 0, 1, 0.7372549, 1,
-0.1315355, 2.477514, -0.9031779, 0, 1, 0.7411765, 1,
-0.1226704, 1.239057, -0.8062775, 0, 1, 0.7490196, 1,
-0.1171798, -0.3979158, -2.053463, 0, 1, 0.7529412, 1,
-0.1158402, 0.2197915, -1.198548, 0, 1, 0.7607843, 1,
-0.1152946, 0.7888437, -1.076856, 0, 1, 0.7647059, 1,
-0.1150217, -0.9727282, -1.774312, 0, 1, 0.772549, 1,
-0.1134058, 0.03001558, -1.302227, 0, 1, 0.7764706, 1,
-0.1098633, -0.1136316, -2.207929, 0, 1, 0.7843137, 1,
-0.109287, 0.2387009, 0.4620468, 0, 1, 0.7882353, 1,
-0.1083543, 1.684833, -1.376559, 0, 1, 0.7960784, 1,
-0.1057398, 1.310397, -0.18104, 0, 1, 0.8039216, 1,
-0.1045593, -0.02874983, -1.566073, 0, 1, 0.8078431, 1,
-0.1018192, 0.3666115, 0.5142967, 0, 1, 0.8156863, 1,
-0.0989703, 0.8409979, 0.7969415, 0, 1, 0.8196079, 1,
-0.09586476, -0.4707913, -2.994327, 0, 1, 0.827451, 1,
-0.091667, 1.570134, -0.2099911, 0, 1, 0.8313726, 1,
-0.09121539, -0.09634746, -1.714901, 0, 1, 0.8392157, 1,
-0.09105816, 1.040396, -1.406188, 0, 1, 0.8431373, 1,
-0.08979172, 1.170185, -1.208227, 0, 1, 0.8509804, 1,
-0.08969224, 0.3967941, -3.269924, 0, 1, 0.854902, 1,
-0.08935466, -0.607501, -2.651926, 0, 1, 0.8627451, 1,
-0.08586351, 0.5742349, -0.09212737, 0, 1, 0.8666667, 1,
-0.08479482, -0.120256, -4.760769, 0, 1, 0.8745098, 1,
-0.07199723, 0.8330954, -0.9059774, 0, 1, 0.8784314, 1,
-0.06447726, -0.6426864, -3.922156, 0, 1, 0.8862745, 1,
-0.05896273, -1.25592, -2.807317, 0, 1, 0.8901961, 1,
-0.05414958, 1.060772, 0.6034278, 0, 1, 0.8980392, 1,
-0.05313646, -0.7548609, -3.230222, 0, 1, 0.9058824, 1,
-0.05238516, 0.1455817, 0.3811637, 0, 1, 0.9098039, 1,
-0.0520565, 0.08115947, -0.2725707, 0, 1, 0.9176471, 1,
-0.05165784, -0.9344531, -3.26486, 0, 1, 0.9215686, 1,
-0.04893057, -0.03279166, -1.496195, 0, 1, 0.9294118, 1,
-0.04117642, -1.579443, -3.12905, 0, 1, 0.9333333, 1,
-0.03880425, 0.21627, -0.6371909, 0, 1, 0.9411765, 1,
-0.03603196, 0.03799031, -1.793039, 0, 1, 0.945098, 1,
-0.034303, -1.166864, -4.265874, 0, 1, 0.9529412, 1,
-0.02998345, 0.9498666, -0.5458081, 0, 1, 0.9568627, 1,
-0.02763844, 1.163118, -0.2937721, 0, 1, 0.9647059, 1,
-0.02734986, 1.284195, -1.753589, 0, 1, 0.9686275, 1,
-0.02558558, 0.1246247, 0.06832375, 0, 1, 0.9764706, 1,
-0.02152846, -0.1398668, -2.157875, 0, 1, 0.9803922, 1,
-0.01999077, 1.947049, 0.3112791, 0, 1, 0.9882353, 1,
-0.01842584, 0.06896855, -0.5143135, 0, 1, 0.9921569, 1,
-0.01323872, -2.960411, -1.807855, 0, 1, 1, 1,
-0.01145798, -1.430517, -4.179534, 0, 0.9921569, 1, 1,
-0.01117013, -0.9013427, -4.054823, 0, 0.9882353, 1, 1,
-0.00047388, -2.180549, -4.056228, 0, 0.9803922, 1, 1,
0.0007394264, -0.5789089, 2.620766, 0, 0.9764706, 1, 1,
0.003177478, 0.3915154, -0.6679897, 0, 0.9686275, 1, 1,
0.007511072, 0.162809, 0.7701086, 0, 0.9647059, 1, 1,
0.01055939, 0.4112161, 0.01765286, 0, 0.9568627, 1, 1,
0.01554716, 2.056759, -1.116879, 0, 0.9529412, 1, 1,
0.01628333, -1.441431, 3.525182, 0, 0.945098, 1, 1,
0.02063336, 0.3533257, 1.282245, 0, 0.9411765, 1, 1,
0.02920399, -0.31749, 3.298926, 0, 0.9333333, 1, 1,
0.02941294, -0.3705522, 1.474373, 0, 0.9294118, 1, 1,
0.02943438, -0.9840018, 2.991943, 0, 0.9215686, 1, 1,
0.02978654, 1.35528, 0.3077746, 0, 0.9176471, 1, 1,
0.03098169, -0.7199659, 1.982277, 0, 0.9098039, 1, 1,
0.03258861, 1.084037, 0.4391881, 0, 0.9058824, 1, 1,
0.03595141, -0.6341623, 3.637361, 0, 0.8980392, 1, 1,
0.03666784, 1.514758, -0.9091464, 0, 0.8901961, 1, 1,
0.03760585, -1.031512, 1.470137, 0, 0.8862745, 1, 1,
0.03893464, 0.02629867, -0.07060922, 0, 0.8784314, 1, 1,
0.04460473, -0.0390036, 0.292595, 0, 0.8745098, 1, 1,
0.051008, 0.3921138, -1.737044, 0, 0.8666667, 1, 1,
0.05190424, -0.1925925, 2.379916, 0, 0.8627451, 1, 1,
0.05451337, -0.7767169, 1.69187, 0, 0.854902, 1, 1,
0.05697125, 2.131889, -1.132642, 0, 0.8509804, 1, 1,
0.05750721, 0.2245634, 0.5574026, 0, 0.8431373, 1, 1,
0.05751668, -1.973202, 3.276516, 0, 0.8392157, 1, 1,
0.06125033, -2.157262, 3.712332, 0, 0.8313726, 1, 1,
0.06170196, 0.1318034, 0.1013769, 0, 0.827451, 1, 1,
0.06444904, 0.06549109, -0.1442765, 0, 0.8196079, 1, 1,
0.06723495, 0.4367701, 1.202289, 0, 0.8156863, 1, 1,
0.0694109, 0.7447416, 0.3638073, 0, 0.8078431, 1, 1,
0.08318428, -2.073914, 2.715688, 0, 0.8039216, 1, 1,
0.08645026, 0.6767312, 2.181177, 0, 0.7960784, 1, 1,
0.08652144, -1.636718, 2.244522, 0, 0.7882353, 1, 1,
0.09051516, -1.220261, 2.248784, 0, 0.7843137, 1, 1,
0.0912359, 1.175728, -2.005398, 0, 0.7764706, 1, 1,
0.09184033, -0.6530494, 2.812257, 0, 0.772549, 1, 1,
0.09305036, -0.9009485, 2.764031, 0, 0.7647059, 1, 1,
0.1011065, -0.6167862, 1.749928, 0, 0.7607843, 1, 1,
0.1057281, 0.8852567, -1.860585, 0, 0.7529412, 1, 1,
0.1061855, -0.5926386, 2.256585, 0, 0.7490196, 1, 1,
0.1066586, 0.2055154, 0.5518848, 0, 0.7411765, 1, 1,
0.1072371, -0.293444, 0.9933091, 0, 0.7372549, 1, 1,
0.1190107, 0.3525889, -0.7712385, 0, 0.7294118, 1, 1,
0.1193263, 0.6541961, 2.128362, 0, 0.7254902, 1, 1,
0.1214375, 0.4743204, -0.3653356, 0, 0.7176471, 1, 1,
0.1244497, -0.4786577, 3.777451, 0, 0.7137255, 1, 1,
0.1302073, -0.4223047, 2.136073, 0, 0.7058824, 1, 1,
0.1318667, 1.125735, -0.4740219, 0, 0.6980392, 1, 1,
0.1360327, 1.069289, 0.4936241, 0, 0.6941177, 1, 1,
0.1396694, -1.006486, 2.240993, 0, 0.6862745, 1, 1,
0.1410694, -0.7746393, 2.571679, 0, 0.682353, 1, 1,
0.1411235, 0.4630164, 1.044512, 0, 0.6745098, 1, 1,
0.1499836, 0.9656996, -0.462205, 0, 0.6705883, 1, 1,
0.1507829, -1.365486, 2.723638, 0, 0.6627451, 1, 1,
0.1575299, -0.1590389, 1.005245, 0, 0.6588235, 1, 1,
0.1619778, 0.5780966, -0.3656166, 0, 0.6509804, 1, 1,
0.1652218, -0.5872446, 2.583015, 0, 0.6470588, 1, 1,
0.1679055, 0.5280614, -1.179032, 0, 0.6392157, 1, 1,
0.1708713, 0.4041072, 1.071881, 0, 0.6352941, 1, 1,
0.1719201, 0.336125, 1.644608, 0, 0.627451, 1, 1,
0.1721542, 1.469653, -0.2410441, 0, 0.6235294, 1, 1,
0.1756178, -1.032342, 2.0893, 0, 0.6156863, 1, 1,
0.1758097, -0.4772482, 2.239933, 0, 0.6117647, 1, 1,
0.1833458, -1.006357, 1.453499, 0, 0.6039216, 1, 1,
0.1834272, 1.512686, -1.044339, 0, 0.5960785, 1, 1,
0.1859707, 0.3213432, -0.228221, 0, 0.5921569, 1, 1,
0.1933944, -0.002507913, 1.594828, 0, 0.5843138, 1, 1,
0.1943322, -0.593936, 3.416405, 0, 0.5803922, 1, 1,
0.2094117, 0.9598119, 0.4607351, 0, 0.572549, 1, 1,
0.2099148, 0.7313313, 0.004170406, 0, 0.5686275, 1, 1,
0.2155787, 0.06582962, -1.354281, 0, 0.5607843, 1, 1,
0.2159245, -0.7016336, 3.568547, 0, 0.5568628, 1, 1,
0.2162822, -0.1325352, 0.2294924, 0, 0.5490196, 1, 1,
0.2179447, 1.187489, 0.9194397, 0, 0.5450981, 1, 1,
0.2207275, -0.5292711, 3.091335, 0, 0.5372549, 1, 1,
0.2232847, -0.7766698, 3.046084, 0, 0.5333334, 1, 1,
0.2241747, 0.6583003, -0.4591564, 0, 0.5254902, 1, 1,
0.2244895, 0.5084444, 1.828734, 0, 0.5215687, 1, 1,
0.2281612, 0.2132818, 0.5799231, 0, 0.5137255, 1, 1,
0.2291189, -1.268496, 2.603087, 0, 0.509804, 1, 1,
0.2307985, 0.8217672, -0.7036662, 0, 0.5019608, 1, 1,
0.2365451, 0.5181016, 0.7554212, 0, 0.4941176, 1, 1,
0.2367281, -1.883805, 2.840606, 0, 0.4901961, 1, 1,
0.2388922, -0.5465772, 2.223438, 0, 0.4823529, 1, 1,
0.2394381, -0.8709771, 3.57051, 0, 0.4784314, 1, 1,
0.2401173, 2.315657, 1.319356, 0, 0.4705882, 1, 1,
0.2419301, 1.557464, -1.145153, 0, 0.4666667, 1, 1,
0.2435609, 1.855809, -0.3334609, 0, 0.4588235, 1, 1,
0.2450818, 0.5567397, -0.5057101, 0, 0.454902, 1, 1,
0.2495283, 0.3998563, 1.169021, 0, 0.4470588, 1, 1,
0.2548152, 0.9105561, 0.2020658, 0, 0.4431373, 1, 1,
0.255007, -0.9348549, 1.628123, 0, 0.4352941, 1, 1,
0.255501, 0.7936521, 1.851958, 0, 0.4313726, 1, 1,
0.2556941, 0.1209161, 0.3118782, 0, 0.4235294, 1, 1,
0.2568389, 0.9598957, 0.9982738, 0, 0.4196078, 1, 1,
0.2589718, 0.2453557, 1.871894, 0, 0.4117647, 1, 1,
0.2593953, 0.888244, 0.02478568, 0, 0.4078431, 1, 1,
0.2595608, 0.2345267, 2.43786, 0, 0.4, 1, 1,
0.2596918, 0.03019132, -0.4839558, 0, 0.3921569, 1, 1,
0.2620389, -1.719551, 3.33973, 0, 0.3882353, 1, 1,
0.2624689, 0.9254031, -0.6407773, 0, 0.3803922, 1, 1,
0.2634921, -1.002316, 3.421947, 0, 0.3764706, 1, 1,
0.2701124, -0.7380058, 2.579716, 0, 0.3686275, 1, 1,
0.2703001, 0.2366576, 2.573724, 0, 0.3647059, 1, 1,
0.2723646, -0.5369481, 2.578064, 0, 0.3568628, 1, 1,
0.2777747, -0.1115361, 1.074185, 0, 0.3529412, 1, 1,
0.2788043, 0.4820158, 0.278414, 0, 0.345098, 1, 1,
0.2800487, -0.6440919, 1.038937, 0, 0.3411765, 1, 1,
0.283463, -1.54898, 3.54535, 0, 0.3333333, 1, 1,
0.2837993, -0.9847074, 2.450917, 0, 0.3294118, 1, 1,
0.2879588, 1.460885, 2.305226, 0, 0.3215686, 1, 1,
0.2890651, -0.882195, 3.43219, 0, 0.3176471, 1, 1,
0.2949939, -0.4017308, 2.629418, 0, 0.3098039, 1, 1,
0.2963629, -0.3482878, 1.756172, 0, 0.3058824, 1, 1,
0.2987852, 1.804831, 2.492329, 0, 0.2980392, 1, 1,
0.2999714, -1.853908, 2.48394, 0, 0.2901961, 1, 1,
0.3003823, 0.5970622, 0.02091461, 0, 0.2862745, 1, 1,
0.3016847, 1.15937, -0.005876604, 0, 0.2784314, 1, 1,
0.3034656, 0.6456249, -0.9238632, 0, 0.2745098, 1, 1,
0.3041813, -1.9351, 2.977068, 0, 0.2666667, 1, 1,
0.3069608, -0.007065615, 1.632478, 0, 0.2627451, 1, 1,
0.3080652, 0.3348853, -1.499162, 0, 0.254902, 1, 1,
0.3123459, 0.599835, -0.4417963, 0, 0.2509804, 1, 1,
0.3143307, -1.696393, 1.860602, 0, 0.2431373, 1, 1,
0.3176205, -0.7489502, 3.411982, 0, 0.2392157, 1, 1,
0.3257695, -0.8353898, 4.546675, 0, 0.2313726, 1, 1,
0.3320021, -0.4164246, 3.80166, 0, 0.227451, 1, 1,
0.3334945, -0.1295982, 0.6821164, 0, 0.2196078, 1, 1,
0.3369437, -0.484765, 3.591054, 0, 0.2156863, 1, 1,
0.3383628, -2.654073, 3.030501, 0, 0.2078431, 1, 1,
0.3400373, -0.1670585, 1.549602, 0, 0.2039216, 1, 1,
0.3520289, -0.122716, 2.307313, 0, 0.1960784, 1, 1,
0.3561058, 1.510731, 1.708258, 0, 0.1882353, 1, 1,
0.3594182, -2.530337, 2.880115, 0, 0.1843137, 1, 1,
0.3660969, 0.5370361, 0.992696, 0, 0.1764706, 1, 1,
0.3672546, -0.3071149, 3.009068, 0, 0.172549, 1, 1,
0.3691695, 0.3824758, -0.00560226, 0, 0.1647059, 1, 1,
0.3708259, -1.261911, 1.824793, 0, 0.1607843, 1, 1,
0.3727918, -0.6023039, 2.34368, 0, 0.1529412, 1, 1,
0.3761256, 0.04537022, 1.447112, 0, 0.1490196, 1, 1,
0.379569, 1.182925, -1.530164, 0, 0.1411765, 1, 1,
0.3798105, -0.5921121, 2.027793, 0, 0.1372549, 1, 1,
0.3816241, 0.8017774, 1.778435, 0, 0.1294118, 1, 1,
0.3866738, -0.8156533, 3.11017, 0, 0.1254902, 1, 1,
0.3884524, -1.22062, 3.383369, 0, 0.1176471, 1, 1,
0.3935302, -0.3407584, 3.93138, 0, 0.1137255, 1, 1,
0.3955207, 0.2813166, 0.09039198, 0, 0.1058824, 1, 1,
0.3988597, 1.450525, -1.059811, 0, 0.09803922, 1, 1,
0.4012374, 1.469069, -0.2674135, 0, 0.09411765, 1, 1,
0.406158, 2.036017, -2.543328, 0, 0.08627451, 1, 1,
0.4081872, 0.4353706, 0.242952, 0, 0.08235294, 1, 1,
0.4100863, 0.5668976, 0.4773933, 0, 0.07450981, 1, 1,
0.4129389, -1.208629, 1.219545, 0, 0.07058824, 1, 1,
0.4149606, 0.7608169, 1.317901, 0, 0.0627451, 1, 1,
0.415499, -3.055283, 4.05076, 0, 0.05882353, 1, 1,
0.4184475, -0.3967696, 2.016174, 0, 0.05098039, 1, 1,
0.4241241, -1.514194, 2.129954, 0, 0.04705882, 1, 1,
0.4256722, 1.09576, 0.4151085, 0, 0.03921569, 1, 1,
0.4260511, -0.5715441, 3.307808, 0, 0.03529412, 1, 1,
0.4286981, -1.084286, 3.352463, 0, 0.02745098, 1, 1,
0.4304412, 1.631723, 1.070671, 0, 0.02352941, 1, 1,
0.4311514, -2.084795, 2.5535, 0, 0.01568628, 1, 1,
0.4314495, 0.4305578, -0.6805679, 0, 0.01176471, 1, 1,
0.4315965, 0.4893509, 0.9899964, 0, 0.003921569, 1, 1,
0.4323028, 0.4868249, -0.5682356, 0.003921569, 0, 1, 1,
0.4349889, 0.6998916, 0.4919274, 0.007843138, 0, 1, 1,
0.4353295, 0.2123283, 2.646701, 0.01568628, 0, 1, 1,
0.442126, 0.4733506, 1.512155, 0.01960784, 0, 1, 1,
0.4424852, -3.070852, 3.042219, 0.02745098, 0, 1, 1,
0.4470309, 0.2715914, 0.1844266, 0.03137255, 0, 1, 1,
0.4471522, 0.3584711, -0.2898771, 0.03921569, 0, 1, 1,
0.4488156, -1.313338, 3.681435, 0.04313726, 0, 1, 1,
0.4490765, -0.3474058, 4.517585, 0.05098039, 0, 1, 1,
0.4493577, 0.4120818, 1.462369, 0.05490196, 0, 1, 1,
0.4525002, 1.202957, -0.6953044, 0.0627451, 0, 1, 1,
0.4602848, -0.1750699, 1.953241, 0.06666667, 0, 1, 1,
0.4630645, 0.01635901, 2.298518, 0.07450981, 0, 1, 1,
0.4677547, -0.7497932, 4.086096, 0.07843138, 0, 1, 1,
0.4693384, 1.06108, 2.139788, 0.08627451, 0, 1, 1,
0.4708974, -0.1901013, 0.7452429, 0.09019608, 0, 1, 1,
0.4729014, -1.099526, 1.563112, 0.09803922, 0, 1, 1,
0.4804958, 0.4535605, 0.4232752, 0.1058824, 0, 1, 1,
0.4807017, 0.3228745, 1.901037, 0.1098039, 0, 1, 1,
0.48261, -1.929746, 1.724906, 0.1176471, 0, 1, 1,
0.4856902, 0.074492, 1.935707, 0.1215686, 0, 1, 1,
0.486287, -1.101363, 3.556323, 0.1294118, 0, 1, 1,
0.4937436, 0.7442912, 0.2401346, 0.1333333, 0, 1, 1,
0.4999337, 2.320699, 0.8211105, 0.1411765, 0, 1, 1,
0.5008822, 2.065118, -0.2181868, 0.145098, 0, 1, 1,
0.5038037, 0.766432, 0.403611, 0.1529412, 0, 1, 1,
0.5054752, 2.320949, 2.044472, 0.1568628, 0, 1, 1,
0.5061533, -0.657839, 2.766336, 0.1647059, 0, 1, 1,
0.5063272, -0.005275652, 2.087591, 0.1686275, 0, 1, 1,
0.5091457, -1.049502, 2.391671, 0.1764706, 0, 1, 1,
0.5140951, 0.1292486, 2.479461, 0.1803922, 0, 1, 1,
0.5150098, 0.2621254, 0.0356891, 0.1882353, 0, 1, 1,
0.5185947, -0.909791, 3.299019, 0.1921569, 0, 1, 1,
0.5232444, -0.3168389, 2.782165, 0.2, 0, 1, 1,
0.5232663, 0.2259235, 2.824172, 0.2078431, 0, 1, 1,
0.5245411, 1.032167, 1.071617, 0.2117647, 0, 1, 1,
0.5282131, 0.9036137, 0.7795459, 0.2196078, 0, 1, 1,
0.5296156, -0.6019202, 2.365535, 0.2235294, 0, 1, 1,
0.5323392, 0.09832343, 0.8178615, 0.2313726, 0, 1, 1,
0.544013, 0.04440323, 0.01019343, 0.2352941, 0, 1, 1,
0.547456, -0.04911798, 3.410948, 0.2431373, 0, 1, 1,
0.5480819, -0.665585, 0.8232276, 0.2470588, 0, 1, 1,
0.5513708, 0.8437872, 0.3595726, 0.254902, 0, 1, 1,
0.5548592, -0.5447921, 3.134864, 0.2588235, 0, 1, 1,
0.5548654, 0.269751, 1.80817, 0.2666667, 0, 1, 1,
0.5569139, 0.5713451, 1.833249, 0.2705882, 0, 1, 1,
0.5593293, -0.1228291, 1.13998, 0.2784314, 0, 1, 1,
0.5593902, 0.2285433, 0.8784538, 0.282353, 0, 1, 1,
0.5604777, 0.08643599, 0.1725173, 0.2901961, 0, 1, 1,
0.5616088, 2.143655, 0.4587936, 0.2941177, 0, 1, 1,
0.5618893, -1.05539, 1.128102, 0.3019608, 0, 1, 1,
0.565051, -1.305124, 0.911213, 0.3098039, 0, 1, 1,
0.5663495, -0.7337706, 1.651595, 0.3137255, 0, 1, 1,
0.5704232, -0.5021269, 1.432359, 0.3215686, 0, 1, 1,
0.5715274, -0.4906238, 1.46364, 0.3254902, 0, 1, 1,
0.5728955, -1.810856, 1.176598, 0.3333333, 0, 1, 1,
0.5733603, -1.094084, 0.7338961, 0.3372549, 0, 1, 1,
0.5749313, -0.2101584, 1.918229, 0.345098, 0, 1, 1,
0.5908077, 1.157819, 0.03228538, 0.3490196, 0, 1, 1,
0.592766, 0.2763378, 1.977131, 0.3568628, 0, 1, 1,
0.5953795, 1.800554, 1.059864, 0.3607843, 0, 1, 1,
0.5982722, 2.101233, -1.070048, 0.3686275, 0, 1, 1,
0.6014438, -2.110033, 2.080351, 0.372549, 0, 1, 1,
0.6026366, 1.66711, -0.06433722, 0.3803922, 0, 1, 1,
0.6028119, 1.149067, 0.5179991, 0.3843137, 0, 1, 1,
0.6103951, -0.03867386, 1.554277, 0.3921569, 0, 1, 1,
0.6105077, -0.6205956, 3.352397, 0.3960784, 0, 1, 1,
0.6121587, -1.310339, 3.382588, 0.4039216, 0, 1, 1,
0.6150634, -0.4139447, 1.654304, 0.4117647, 0, 1, 1,
0.6166139, -0.1136247, 1.414209, 0.4156863, 0, 1, 1,
0.6180602, 2.227108, -0.2947187, 0.4235294, 0, 1, 1,
0.6209929, -1.85534, 3.220346, 0.427451, 0, 1, 1,
0.6235379, -0.8207775, 1.968713, 0.4352941, 0, 1, 1,
0.6295641, 1.340747, 0.6779104, 0.4392157, 0, 1, 1,
0.6399338, -1.454287, 2.947131, 0.4470588, 0, 1, 1,
0.6491154, -0.4549215, 2.345074, 0.4509804, 0, 1, 1,
0.6536903, 0.473586, 2.40702, 0.4588235, 0, 1, 1,
0.6553868, -0.7018906, 3.291321, 0.4627451, 0, 1, 1,
0.6568292, 0.3177731, -1.271796, 0.4705882, 0, 1, 1,
0.658174, -0.1488897, 1.787977, 0.4745098, 0, 1, 1,
0.6590871, 0.7667414, 2.561196, 0.4823529, 0, 1, 1,
0.6590915, -0.5726613, 1.65147, 0.4862745, 0, 1, 1,
0.6598122, -1.646345, 3.32424, 0.4941176, 0, 1, 1,
0.6629661, -0.176509, 2.125139, 0.5019608, 0, 1, 1,
0.6673295, -0.4829964, 1.096589, 0.5058824, 0, 1, 1,
0.6738254, -0.5114591, 4.131125, 0.5137255, 0, 1, 1,
0.67594, -0.02828408, 1.335521, 0.5176471, 0, 1, 1,
0.6858356, 0.2555158, 2.231211, 0.5254902, 0, 1, 1,
0.6867852, -0.6031358, 1.807076, 0.5294118, 0, 1, 1,
0.6896446, 0.7969138, 2.085933, 0.5372549, 0, 1, 1,
0.6917272, 1.402059, -0.4231107, 0.5411765, 0, 1, 1,
0.6940731, 0.65194, -0.947283, 0.5490196, 0, 1, 1,
0.6971726, -1.208039, 1.603293, 0.5529412, 0, 1, 1,
0.7048404, 1.541286, 0.6520107, 0.5607843, 0, 1, 1,
0.7114314, -1.41658, 2.911035, 0.5647059, 0, 1, 1,
0.7116461, -1.064357, 0.3077154, 0.572549, 0, 1, 1,
0.7136978, 0.1193754, 1.947555, 0.5764706, 0, 1, 1,
0.7146586, 0.1304781, 0.1282347, 0.5843138, 0, 1, 1,
0.7181653, 0.5645112, 1.54893, 0.5882353, 0, 1, 1,
0.7193103, 0.9708619, 0.5247416, 0.5960785, 0, 1, 1,
0.7202789, -0.28049, 0.6659454, 0.6039216, 0, 1, 1,
0.724256, -0.119502, 2.247828, 0.6078432, 0, 1, 1,
0.7252219, -0.2810153, 1.70776, 0.6156863, 0, 1, 1,
0.7268171, -0.9709821, 3.593927, 0.6196079, 0, 1, 1,
0.7327852, 0.0383195, 1.964387, 0.627451, 0, 1, 1,
0.7362543, -0.9392675, 2.620371, 0.6313726, 0, 1, 1,
0.741254, -0.2510139, 2.101034, 0.6392157, 0, 1, 1,
0.7433074, 1.618567, 0.340954, 0.6431373, 0, 1, 1,
0.7440147, 0.1629981, 1.670145, 0.6509804, 0, 1, 1,
0.7492418, 0.09543041, 3.076498, 0.654902, 0, 1, 1,
0.7513339, 0.001149517, 1.923673, 0.6627451, 0, 1, 1,
0.7523528, -0.009937568, 2.540632, 0.6666667, 0, 1, 1,
0.7554568, 1.016085, 0.05542599, 0.6745098, 0, 1, 1,
0.7560952, -0.4342744, 3.073956, 0.6784314, 0, 1, 1,
0.759461, -2.316908, 2.646212, 0.6862745, 0, 1, 1,
0.760513, 0.452429, -0.2245049, 0.6901961, 0, 1, 1,
0.761401, 0.143063, 2.786421, 0.6980392, 0, 1, 1,
0.7690405, 0.4466501, 1.09662, 0.7058824, 0, 1, 1,
0.769139, 0.06129872, 2.26753, 0.7098039, 0, 1, 1,
0.7703115, 0.458867, -0.4530751, 0.7176471, 0, 1, 1,
0.7717599, -2.023771, 3.552909, 0.7215686, 0, 1, 1,
0.7737862, 0.8228818, -0.4776822, 0.7294118, 0, 1, 1,
0.7760745, -1.126279, 3.386543, 0.7333333, 0, 1, 1,
0.7766019, -0.1910764, -0.102432, 0.7411765, 0, 1, 1,
0.7791318, -0.1390468, 1.614428, 0.7450981, 0, 1, 1,
0.7860161, 0.03844202, 1.620247, 0.7529412, 0, 1, 1,
0.7968348, -1.70486, 3.177799, 0.7568628, 0, 1, 1,
0.8031247, 0.5960591, 1.138133, 0.7647059, 0, 1, 1,
0.805966, 0.1542137, 1.311424, 0.7686275, 0, 1, 1,
0.8077561, -0.223131, 3.144655, 0.7764706, 0, 1, 1,
0.8088916, 1.277387, 1.915228, 0.7803922, 0, 1, 1,
0.8103896, 0.7723966, -0.4279549, 0.7882353, 0, 1, 1,
0.8135878, 0.4684977, 3.027811, 0.7921569, 0, 1, 1,
0.8157055, 0.4477099, 0.3304518, 0.8, 0, 1, 1,
0.8173255, 0.3398882, 0.6049803, 0.8078431, 0, 1, 1,
0.8193257, -0.1507753, 1.139139, 0.8117647, 0, 1, 1,
0.8283967, -2.153036, 1.811931, 0.8196079, 0, 1, 1,
0.8305231, -0.1952698, 2.554543, 0.8235294, 0, 1, 1,
0.8414693, 0.7823689, 2.066217, 0.8313726, 0, 1, 1,
0.8501279, -0.0494473, 1.510003, 0.8352941, 0, 1, 1,
0.8504809, 0.8582509, 0.420409, 0.8431373, 0, 1, 1,
0.8788429, 1.564864, 0.5886117, 0.8470588, 0, 1, 1,
0.885774, 1.05479, 0.6266094, 0.854902, 0, 1, 1,
0.8922641, 0.6697129, 1.083627, 0.8588235, 0, 1, 1,
0.8936791, -1.269451, 0.4958708, 0.8666667, 0, 1, 1,
0.896279, 0.03831758, 2.151779, 0.8705882, 0, 1, 1,
0.9012442, -0.208037, 2.047561, 0.8784314, 0, 1, 1,
0.9067616, 1.313134, 0.7811346, 0.8823529, 0, 1, 1,
0.9073088, -1.45968, 1.322442, 0.8901961, 0, 1, 1,
0.9095395, 0.2124188, 1.55137, 0.8941177, 0, 1, 1,
0.9128857, 0.8474152, 0.7344913, 0.9019608, 0, 1, 1,
0.9193366, 1.678519, 0.4634587, 0.9098039, 0, 1, 1,
0.9196326, -0.7136289, 2.237669, 0.9137255, 0, 1, 1,
0.9230109, -0.06210859, 1.587826, 0.9215686, 0, 1, 1,
0.9244338, 0.6994138, 0.4103287, 0.9254902, 0, 1, 1,
0.9293806, 0.9110853, -0.1091933, 0.9333333, 0, 1, 1,
0.9375756, 0.2898262, 0.5428955, 0.9372549, 0, 1, 1,
0.9432882, 0.3266644, 1.637047, 0.945098, 0, 1, 1,
0.9445981, 0.08116706, -0.3498179, 0.9490196, 0, 1, 1,
0.9480194, -0.4775922, 2.090251, 0.9568627, 0, 1, 1,
0.9483334, -0.3922336, 1.18319, 0.9607843, 0, 1, 1,
0.9499737, -0.307036, 3.104292, 0.9686275, 0, 1, 1,
0.9524031, -0.4587518, 1.01244, 0.972549, 0, 1, 1,
0.9602228, -0.1091381, 1.502392, 0.9803922, 0, 1, 1,
0.963186, -0.1932168, 3.933821, 0.9843137, 0, 1, 1,
0.9674261, -0.1090088, 1.085904, 0.9921569, 0, 1, 1,
0.9740762, -0.7559488, 0.7513103, 0.9960784, 0, 1, 1,
0.990384, -0.5881342, 1.591189, 1, 0, 0.9960784, 1,
0.9934767, 0.1871475, 1.146198, 1, 0, 0.9882353, 1,
0.9975608, 0.8587857, 1.117659, 1, 0, 0.9843137, 1,
1.001373, -1.118782, 2.282679, 1, 0, 0.9764706, 1,
1.002859, -1.504995, 3.42148, 1, 0, 0.972549, 1,
1.003268, 0.08240501, 0.5459152, 1, 0, 0.9647059, 1,
1.006349, -1.429581, 1.411582, 1, 0, 0.9607843, 1,
1.008166, 1.086295, 0.1989827, 1, 0, 0.9529412, 1,
1.010892, -0.8646857, 2.996756, 1, 0, 0.9490196, 1,
1.023468, 0.5195231, -0.3176198, 1, 0, 0.9411765, 1,
1.024818, 1.911317, 0.3651657, 1, 0, 0.9372549, 1,
1.030265, 1.573831, 1.977037, 1, 0, 0.9294118, 1,
1.032245, -1.22049, 2.377754, 1, 0, 0.9254902, 1,
1.032285, -1.03752, 1.897504, 1, 0, 0.9176471, 1,
1.032583, -0.9507215, 3.111859, 1, 0, 0.9137255, 1,
1.042276, 1.927099, 1.257145, 1, 0, 0.9058824, 1,
1.042912, -1.084905, 3.05155, 1, 0, 0.9019608, 1,
1.045815, -0.5328625, 2.071355, 1, 0, 0.8941177, 1,
1.047631, 0.9906657, 0.335068, 1, 0, 0.8862745, 1,
1.057678, 0.6855224, 0.2779642, 1, 0, 0.8823529, 1,
1.065261, -0.05785194, 2.391628, 1, 0, 0.8745098, 1,
1.067474, 0.5233676, 1.123986, 1, 0, 0.8705882, 1,
1.069663, 0.0563888, 0.2100276, 1, 0, 0.8627451, 1,
1.086593, -1.897181, 3.668139, 1, 0, 0.8588235, 1,
1.094305, -1.662844, 1.89017, 1, 0, 0.8509804, 1,
1.094987, -0.2324786, 0.8184848, 1, 0, 0.8470588, 1,
1.096436, -0.6481324, 3.279033, 1, 0, 0.8392157, 1,
1.101761, -0.4850001, 3.527767, 1, 0, 0.8352941, 1,
1.102276, 0.07511323, 1.178722, 1, 0, 0.827451, 1,
1.119482, -0.7961012, 1.93654, 1, 0, 0.8235294, 1,
1.121116, -0.8640053, 2.040196, 1, 0, 0.8156863, 1,
1.122288, 1.240357, -0.9343964, 1, 0, 0.8117647, 1,
1.126323, -0.8679005, 1.579353, 1, 0, 0.8039216, 1,
1.132812, 1.357052, 0.9185587, 1, 0, 0.7960784, 1,
1.137491, -0.3253911, 1.818251, 1, 0, 0.7921569, 1,
1.142179, -2.251471, 3.2223, 1, 0, 0.7843137, 1,
1.15563, 0.8693959, 0.6821091, 1, 0, 0.7803922, 1,
1.16048, 0.4784925, -0.6921244, 1, 0, 0.772549, 1,
1.16392, 1.148328, 1.184508, 1, 0, 0.7686275, 1,
1.168914, 1.096427, -0.1034602, 1, 0, 0.7607843, 1,
1.187919, 1.414068, 0.7671866, 1, 0, 0.7568628, 1,
1.196061, 0.590405, 0.4258539, 1, 0, 0.7490196, 1,
1.196376, -1.146079, 0.353366, 1, 0, 0.7450981, 1,
1.203682, -1.396918, 4.190153, 1, 0, 0.7372549, 1,
1.209024, -1.333824, 2.299278, 1, 0, 0.7333333, 1,
1.210567, 0.4817893, 2.007717, 1, 0, 0.7254902, 1,
1.212566, 0.08140285, 0.3353961, 1, 0, 0.7215686, 1,
1.233971, 0.06289587, 2.387105, 1, 0, 0.7137255, 1,
1.236621, -1.516745, 2.428178, 1, 0, 0.7098039, 1,
1.237888, 0.16813, 0.5712982, 1, 0, 0.7019608, 1,
1.245813, 0.4031477, 0.4542506, 1, 0, 0.6941177, 1,
1.253181, -0.8811001, 0.7056175, 1, 0, 0.6901961, 1,
1.262435, -1.086595, 3.818508, 1, 0, 0.682353, 1,
1.262606, -0.6845395, 2.840368, 1, 0, 0.6784314, 1,
1.272, 0.8125543, -0.6260796, 1, 0, 0.6705883, 1,
1.275179, 0.6120397, 0.1887579, 1, 0, 0.6666667, 1,
1.277856, 0.01098201, 1.197044, 1, 0, 0.6588235, 1,
1.288886, 0.2574415, 2.275957, 1, 0, 0.654902, 1,
1.29225, -0.4987952, 1.331342, 1, 0, 0.6470588, 1,
1.298546, -0.459008, 2.704931, 1, 0, 0.6431373, 1,
1.299306, -0.5766957, 1.765343, 1, 0, 0.6352941, 1,
1.304158, -1.378352, 2.809609, 1, 0, 0.6313726, 1,
1.315854, -1.410845, 2.801915, 1, 0, 0.6235294, 1,
1.318158, -0.1801467, -1.022638, 1, 0, 0.6196079, 1,
1.318383, -0.2941882, 2.14464, 1, 0, 0.6117647, 1,
1.318975, -0.3589997, 1.784837, 1, 0, 0.6078432, 1,
1.33349, 0.5202912, 1.579845, 1, 0, 0.6, 1,
1.338422, 0.3875223, 2.183442, 1, 0, 0.5921569, 1,
1.339839, -2.339731, 2.457812, 1, 0, 0.5882353, 1,
1.342418, 2.827536, 2.140203, 1, 0, 0.5803922, 1,
1.350379, -1.217182, 2.594287, 1, 0, 0.5764706, 1,
1.357788, 0.6439288, -0.7372159, 1, 0, 0.5686275, 1,
1.361505, 0.5068996, 1.57979, 1, 0, 0.5647059, 1,
1.36578, 1.804086, -0.5267736, 1, 0, 0.5568628, 1,
1.365944, -0.9669864, 3.134639, 1, 0, 0.5529412, 1,
1.3697, 2.074534, 1.392453, 1, 0, 0.5450981, 1,
1.379019, -0.6551111, 1.201806, 1, 0, 0.5411765, 1,
1.400356, -0.8622486, 2.100042, 1, 0, 0.5333334, 1,
1.404072, -2.028488, 2.806622, 1, 0, 0.5294118, 1,
1.405387, -1.529022, -0.02085192, 1, 0, 0.5215687, 1,
1.406651, 1.077362, 1.66114, 1, 0, 0.5176471, 1,
1.407247, 1.196824, 1.162906, 1, 0, 0.509804, 1,
1.410357, 2.028044, 0.9379743, 1, 0, 0.5058824, 1,
1.419678, -0.4338654, 2.039302, 1, 0, 0.4980392, 1,
1.422759, 0.4181168, 0.4514456, 1, 0, 0.4901961, 1,
1.426029, 0.4551365, 1.914031, 1, 0, 0.4862745, 1,
1.427072, -0.8861717, 2.726923, 1, 0, 0.4784314, 1,
1.429871, -0.1500054, 2.648139, 1, 0, 0.4745098, 1,
1.44125, 1.52241, 1.036344, 1, 0, 0.4666667, 1,
1.450993, 1.184594, 1.779261, 1, 0, 0.4627451, 1,
1.452886, -0.5391726, 1.188532, 1, 0, 0.454902, 1,
1.45716, -0.3907427, 2.49955, 1, 0, 0.4509804, 1,
1.461849, 1.680957, -0.1980565, 1, 0, 0.4431373, 1,
1.466782, -0.09113251, 1.306817, 1, 0, 0.4392157, 1,
1.472818, -0.8556309, -0.1321401, 1, 0, 0.4313726, 1,
1.473766, -1.297558, 1.654088, 1, 0, 0.427451, 1,
1.47685, 0.3926771, 0.9393726, 1, 0, 0.4196078, 1,
1.479993, 1.037551, 1.452207, 1, 0, 0.4156863, 1,
1.48011, -1.49403, 1.79584, 1, 0, 0.4078431, 1,
1.484378, 0.602877, 1.908715, 1, 0, 0.4039216, 1,
1.486738, -1.196876, 3.127213, 1, 0, 0.3960784, 1,
1.490755, 0.5011188, 0.9523467, 1, 0, 0.3882353, 1,
1.507868, -0.6515959, 1.617717, 1, 0, 0.3843137, 1,
1.508606, -2.387188, 3.368166, 1, 0, 0.3764706, 1,
1.51754, 0.4806325, 1.88662, 1, 0, 0.372549, 1,
1.520266, -0.4839581, 1.505621, 1, 0, 0.3647059, 1,
1.52776, -0.01184849, 1.768293, 1, 0, 0.3607843, 1,
1.53709, 1.297659, -0.5097401, 1, 0, 0.3529412, 1,
1.546783, -1.359256, 3.157676, 1, 0, 0.3490196, 1,
1.557788, 0.1478591, 0.779072, 1, 0, 0.3411765, 1,
1.594635, -0.5089335, 2.401862, 1, 0, 0.3372549, 1,
1.595128, 0.2204319, -0.5657913, 1, 0, 0.3294118, 1,
1.596701, -0.9624349, 2.28093, 1, 0, 0.3254902, 1,
1.625686, -0.707656, 0.8433524, 1, 0, 0.3176471, 1,
1.635605, -1.622168, 2.257858, 1, 0, 0.3137255, 1,
1.639632, 1.970094, 0.09880655, 1, 0, 0.3058824, 1,
1.642178, 0.2929159, 1.251006, 1, 0, 0.2980392, 1,
1.644239, -1.447, 3.049757, 1, 0, 0.2941177, 1,
1.644387, -1.578203, 2.141248, 1, 0, 0.2862745, 1,
1.659651, 0.9819889, 3.189685, 1, 0, 0.282353, 1,
1.659778, -1.017508, 2.767167, 1, 0, 0.2745098, 1,
1.661731, -0.3798063, -0.9104378, 1, 0, 0.2705882, 1,
1.669104, -0.8781691, 2.502774, 1, 0, 0.2627451, 1,
1.670815, 0.4123614, 0.1141523, 1, 0, 0.2588235, 1,
1.676372, -0.2554499, 0.3742394, 1, 0, 0.2509804, 1,
1.67644, 1.120289, 2.661464, 1, 0, 0.2470588, 1,
1.676931, -0.6035044, 3.853967, 1, 0, 0.2392157, 1,
1.68189, 0.4613736, 1.309422, 1, 0, 0.2352941, 1,
1.68506, 1.683453, -0.1799321, 1, 0, 0.227451, 1,
1.687063, 0.1480408, 0.6961251, 1, 0, 0.2235294, 1,
1.690852, -0.7310972, 2.58102, 1, 0, 0.2156863, 1,
1.698324, -1.317297, 3.38457, 1, 0, 0.2117647, 1,
1.711303, 1.226504, 1.753649, 1, 0, 0.2039216, 1,
1.723464, 0.3401722, 1.914683, 1, 0, 0.1960784, 1,
1.738212, 0.1640307, 2.397357, 1, 0, 0.1921569, 1,
1.763638, 1.137755, 1.957387, 1, 0, 0.1843137, 1,
1.764028, -0.03898053, 1.779233, 1, 0, 0.1803922, 1,
1.769169, -1.324169, 2.699978, 1, 0, 0.172549, 1,
1.769225, 0.2937703, 2.488913, 1, 0, 0.1686275, 1,
1.772478, 0.4278811, 1.522667, 1, 0, 0.1607843, 1,
1.783923, 0.1698164, -0.5327926, 1, 0, 0.1568628, 1,
1.797157, -0.8777868, 1.48007, 1, 0, 0.1490196, 1,
1.893709, -1.059256, 0.6645678, 1, 0, 0.145098, 1,
1.922531, -0.2327132, 1.347302, 1, 0, 0.1372549, 1,
1.927472, -1.017942, 2.252158, 1, 0, 0.1333333, 1,
1.944242, -0.2785278, 1.309717, 1, 0, 0.1254902, 1,
1.959557, 0.01089594, 1.665793, 1, 0, 0.1215686, 1,
1.966416, -1.047425, 1.813718, 1, 0, 0.1137255, 1,
1.969555, -1.378219, 2.343543, 1, 0, 0.1098039, 1,
2.049067, 0.4912677, 3.581645, 1, 0, 0.1019608, 1,
2.072077, 0.5745836, 0.8355504, 1, 0, 0.09411765, 1,
2.090789, -1.23739, 1.579983, 1, 0, 0.09019608, 1,
2.127023, 1.613846, -1.289338, 1, 0, 0.08235294, 1,
2.179292, 0.01032106, -0.06572213, 1, 0, 0.07843138, 1,
2.185872, -1.046926, 0.5323668, 1, 0, 0.07058824, 1,
2.205681, -0.5947077, 1.354502, 1, 0, 0.06666667, 1,
2.269521, -0.9445639, 1.211723, 1, 0, 0.05882353, 1,
2.299734, 1.468242, 0.9785852, 1, 0, 0.05490196, 1,
2.319496, -0.06155999, 3.246905, 1, 0, 0.04705882, 1,
2.353211, -0.1981102, -1.813146, 1, 0, 0.04313726, 1,
2.423143, -0.7360517, 0.2379121, 1, 0, 0.03529412, 1,
2.533053, 0.4391388, 0.9117338, 1, 0, 0.03137255, 1,
2.620228, 1.750743, 0.6462728, 1, 0, 0.02352941, 1,
2.940313, -1.842921, 2.490258, 1, 0, 0.01960784, 1,
3.096824, -0.2731197, 1.769674, 1, 0, 0.01176471, 1,
3.315295, -0.7482812, 2.267705, 1, 0, 0.007843138, 1
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
0.07272065, -4.471132, -7.664414, 0, -0.5, 0.5, 0.5,
0.07272065, -4.471132, -7.664414, 1, -0.5, 0.5, 0.5,
0.07272065, -4.471132, -7.664414, 1, 1.5, 0.5, 0.5,
0.07272065, -4.471132, -7.664414, 0, 1.5, 0.5, 0.5
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
-4.269087, -0.2928866, -7.664414, 0, -0.5, 0.5, 0.5,
-4.269087, -0.2928866, -7.664414, 1, -0.5, 0.5, 0.5,
-4.269087, -0.2928866, -7.664414, 1, 1.5, 0.5, 0.5,
-4.269087, -0.2928866, -7.664414, 0, 1.5, 0.5, 0.5
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
-4.269087, -4.471132, -0.6739702, 0, -0.5, 0.5, 0.5,
-4.269087, -4.471132, -0.6739702, 1, -0.5, 0.5, 0.5,
-4.269087, -4.471132, -0.6739702, 1, 1.5, 0.5, 0.5,
-4.269087, -4.471132, -0.6739702, 0, 1.5, 0.5, 0.5
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
-3, -3.506922, -6.051235,
3, -3.506922, -6.051235,
-3, -3.506922, -6.051235,
-3, -3.667624, -6.320098,
-2, -3.506922, -6.051235,
-2, -3.667624, -6.320098,
-1, -3.506922, -6.051235,
-1, -3.667624, -6.320098,
0, -3.506922, -6.051235,
0, -3.667624, -6.320098,
1, -3.506922, -6.051235,
1, -3.667624, -6.320098,
2, -3.506922, -6.051235,
2, -3.667624, -6.320098,
3, -3.506922, -6.051235,
3, -3.667624, -6.320098
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
-3, -3.989027, -6.857825, 0, -0.5, 0.5, 0.5,
-3, -3.989027, -6.857825, 1, -0.5, 0.5, 0.5,
-3, -3.989027, -6.857825, 1, 1.5, 0.5, 0.5,
-3, -3.989027, -6.857825, 0, 1.5, 0.5, 0.5,
-2, -3.989027, -6.857825, 0, -0.5, 0.5, 0.5,
-2, -3.989027, -6.857825, 1, -0.5, 0.5, 0.5,
-2, -3.989027, -6.857825, 1, 1.5, 0.5, 0.5,
-2, -3.989027, -6.857825, 0, 1.5, 0.5, 0.5,
-1, -3.989027, -6.857825, 0, -0.5, 0.5, 0.5,
-1, -3.989027, -6.857825, 1, -0.5, 0.5, 0.5,
-1, -3.989027, -6.857825, 1, 1.5, 0.5, 0.5,
-1, -3.989027, -6.857825, 0, 1.5, 0.5, 0.5,
0, -3.989027, -6.857825, 0, -0.5, 0.5, 0.5,
0, -3.989027, -6.857825, 1, -0.5, 0.5, 0.5,
0, -3.989027, -6.857825, 1, 1.5, 0.5, 0.5,
0, -3.989027, -6.857825, 0, 1.5, 0.5, 0.5,
1, -3.989027, -6.857825, 0, -0.5, 0.5, 0.5,
1, -3.989027, -6.857825, 1, -0.5, 0.5, 0.5,
1, -3.989027, -6.857825, 1, 1.5, 0.5, 0.5,
1, -3.989027, -6.857825, 0, 1.5, 0.5, 0.5,
2, -3.989027, -6.857825, 0, -0.5, 0.5, 0.5,
2, -3.989027, -6.857825, 1, -0.5, 0.5, 0.5,
2, -3.989027, -6.857825, 1, 1.5, 0.5, 0.5,
2, -3.989027, -6.857825, 0, 1.5, 0.5, 0.5,
3, -3.989027, -6.857825, 0, -0.5, 0.5, 0.5,
3, -3.989027, -6.857825, 1, -0.5, 0.5, 0.5,
3, -3.989027, -6.857825, 1, 1.5, 0.5, 0.5,
3, -3.989027, -6.857825, 0, 1.5, 0.5, 0.5
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
-3.267131, -3, -6.051235,
-3.267131, 2, -6.051235,
-3.267131, -3, -6.051235,
-3.434124, -3, -6.320098,
-3.267131, -2, -6.051235,
-3.434124, -2, -6.320098,
-3.267131, -1, -6.051235,
-3.434124, -1, -6.320098,
-3.267131, 0, -6.051235,
-3.434124, 0, -6.320098,
-3.267131, 1, -6.051235,
-3.434124, 1, -6.320098,
-3.267131, 2, -6.051235,
-3.434124, 2, -6.320098
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
-3.768109, -3, -6.857825, 0, -0.5, 0.5, 0.5,
-3.768109, -3, -6.857825, 1, -0.5, 0.5, 0.5,
-3.768109, -3, -6.857825, 1, 1.5, 0.5, 0.5,
-3.768109, -3, -6.857825, 0, 1.5, 0.5, 0.5,
-3.768109, -2, -6.857825, 0, -0.5, 0.5, 0.5,
-3.768109, -2, -6.857825, 1, -0.5, 0.5, 0.5,
-3.768109, -2, -6.857825, 1, 1.5, 0.5, 0.5,
-3.768109, -2, -6.857825, 0, 1.5, 0.5, 0.5,
-3.768109, -1, -6.857825, 0, -0.5, 0.5, 0.5,
-3.768109, -1, -6.857825, 1, -0.5, 0.5, 0.5,
-3.768109, -1, -6.857825, 1, 1.5, 0.5, 0.5,
-3.768109, -1, -6.857825, 0, 1.5, 0.5, 0.5,
-3.768109, 0, -6.857825, 0, -0.5, 0.5, 0.5,
-3.768109, 0, -6.857825, 1, -0.5, 0.5, 0.5,
-3.768109, 0, -6.857825, 1, 1.5, 0.5, 0.5,
-3.768109, 0, -6.857825, 0, 1.5, 0.5, 0.5,
-3.768109, 1, -6.857825, 0, -0.5, 0.5, 0.5,
-3.768109, 1, -6.857825, 1, -0.5, 0.5, 0.5,
-3.768109, 1, -6.857825, 1, 1.5, 0.5, 0.5,
-3.768109, 1, -6.857825, 0, 1.5, 0.5, 0.5,
-3.768109, 2, -6.857825, 0, -0.5, 0.5, 0.5,
-3.768109, 2, -6.857825, 1, -0.5, 0.5, 0.5,
-3.768109, 2, -6.857825, 1, 1.5, 0.5, 0.5,
-3.768109, 2, -6.857825, 0, 1.5, 0.5, 0.5
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
-3.267131, -3.506922, -4,
-3.267131, -3.506922, 4,
-3.267131, -3.506922, -4,
-3.434124, -3.667624, -4,
-3.267131, -3.506922, -2,
-3.434124, -3.667624, -2,
-3.267131, -3.506922, 0,
-3.434124, -3.667624, 0,
-3.267131, -3.506922, 2,
-3.434124, -3.667624, 2,
-3.267131, -3.506922, 4,
-3.434124, -3.667624, 4
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
-3.768109, -3.989027, -4, 0, -0.5, 0.5, 0.5,
-3.768109, -3.989027, -4, 1, -0.5, 0.5, 0.5,
-3.768109, -3.989027, -4, 1, 1.5, 0.5, 0.5,
-3.768109, -3.989027, -4, 0, 1.5, 0.5, 0.5,
-3.768109, -3.989027, -2, 0, -0.5, 0.5, 0.5,
-3.768109, -3.989027, -2, 1, -0.5, 0.5, 0.5,
-3.768109, -3.989027, -2, 1, 1.5, 0.5, 0.5,
-3.768109, -3.989027, -2, 0, 1.5, 0.5, 0.5,
-3.768109, -3.989027, 0, 0, -0.5, 0.5, 0.5,
-3.768109, -3.989027, 0, 1, -0.5, 0.5, 0.5,
-3.768109, -3.989027, 0, 1, 1.5, 0.5, 0.5,
-3.768109, -3.989027, 0, 0, 1.5, 0.5, 0.5,
-3.768109, -3.989027, 2, 0, -0.5, 0.5, 0.5,
-3.768109, -3.989027, 2, 1, -0.5, 0.5, 0.5,
-3.768109, -3.989027, 2, 1, 1.5, 0.5, 0.5,
-3.768109, -3.989027, 2, 0, 1.5, 0.5, 0.5,
-3.768109, -3.989027, 4, 0, -0.5, 0.5, 0.5,
-3.768109, -3.989027, 4, 1, -0.5, 0.5, 0.5,
-3.768109, -3.989027, 4, 1, 1.5, 0.5, 0.5,
-3.768109, -3.989027, 4, 0, 1.5, 0.5, 0.5
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
-3.267131, -3.506922, -6.051235,
-3.267131, 2.921149, -6.051235,
-3.267131, -3.506922, 4.703295,
-3.267131, 2.921149, 4.703295,
-3.267131, -3.506922, -6.051235,
-3.267131, -3.506922, 4.703295,
-3.267131, 2.921149, -6.051235,
-3.267131, 2.921149, 4.703295,
-3.267131, -3.506922, -6.051235,
3.412572, -3.506922, -6.051235,
-3.267131, -3.506922, 4.703295,
3.412572, -3.506922, 4.703295,
-3.267131, 2.921149, -6.051235,
3.412572, 2.921149, -6.051235,
-3.267131, 2.921149, 4.703295,
3.412572, 2.921149, 4.703295,
3.412572, -3.506922, -6.051235,
3.412572, 2.921149, -6.051235,
3.412572, -3.506922, 4.703295,
3.412572, 2.921149, 4.703295,
3.412572, -3.506922, -6.051235,
3.412572, -3.506922, 4.703295,
3.412572, 2.921149, -6.051235,
3.412572, 2.921149, 4.703295
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
var radius = 7.581743;
var distance = 33.73203;
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
mvMatrix.translate( -0.07272065, 0.2928866, 0.6739702 );
mvMatrix.scale( 1.227229, 1.275271, 0.7622396 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.73203);
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
Zineb<-read.table("Zineb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Zineb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Zineb' not found
```

```r
y<-Zineb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Zineb' not found
```

```r
z<-Zineb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Zineb' not found
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
-3.169854, 1.595336, -1.786659, 0, 0, 1, 1, 1,
-2.623906, 0.7202967, -1.255523, 1, 0, 0, 1, 1,
-2.605909, 0.501111, -1.710353, 1, 0, 0, 1, 1,
-2.474285, -1.161164, -3.445106, 1, 0, 0, 1, 1,
-2.420395, -1.199334, -1.417532, 1, 0, 0, 1, 1,
-2.365448, 0.2602161, -0.5586919, 1, 0, 0, 1, 1,
-2.208871, 1.314863, 0.2939561, 0, 0, 0, 1, 1,
-2.139186, -0.5098262, -3.176246, 0, 0, 0, 1, 1,
-2.119537, 1.433929, -0.7878025, 0, 0, 0, 1, 1,
-2.028384, 1.799324, 0.1842335, 0, 0, 0, 1, 1,
-2.017213, 0.06904261, -3.34611, 0, 0, 0, 1, 1,
-2.011185, 0.790285, -1.16608, 0, 0, 0, 1, 1,
-1.991588, 0.2667524, 0.1659295, 0, 0, 0, 1, 1,
-1.937752, 0.1834695, -2.826912, 1, 1, 1, 1, 1,
-1.935849, -1.045001, -2.009157, 1, 1, 1, 1, 1,
-1.92934, 1.255722, 0.048866, 1, 1, 1, 1, 1,
-1.906487, -0.6134501, -2.861592, 1, 1, 1, 1, 1,
-1.892313, -0.7715783, -2.480841, 1, 1, 1, 1, 1,
-1.889557, -0.7373973, -2.802579, 1, 1, 1, 1, 1,
-1.877367, 1.930675, 0.02394462, 1, 1, 1, 1, 1,
-1.843627, -1.490586, -1.485327, 1, 1, 1, 1, 1,
-1.821728, 0.7024626, -1.192752, 1, 1, 1, 1, 1,
-1.821241, -0.2885886, -2.073828, 1, 1, 1, 1, 1,
-1.789242, 0.6962267, -2.197718, 1, 1, 1, 1, 1,
-1.782126, -0.7710368, -1.327315, 1, 1, 1, 1, 1,
-1.760824, 0.6642173, -0.736573, 1, 1, 1, 1, 1,
-1.757479, 1.077487, -0.8475667, 1, 1, 1, 1, 1,
-1.753408, 1.483132, 0.02321441, 1, 1, 1, 1, 1,
-1.743466, 1.072154, -1.922317, 0, 0, 1, 1, 1,
-1.717874, -0.388041, -0.5864385, 1, 0, 0, 1, 1,
-1.709616, -1.548568, -3.296566, 1, 0, 0, 1, 1,
-1.705667, 1.374198, -1.024561, 1, 0, 0, 1, 1,
-1.704109, 0.6235383, -1.220662, 1, 0, 0, 1, 1,
-1.697392, 0.9522282, -0.4586941, 1, 0, 0, 1, 1,
-1.686816, 0.594572, -0.6767098, 0, 0, 0, 1, 1,
-1.684658, 1.758332, -1.666576, 0, 0, 0, 1, 1,
-1.657802, -3.272659, -2.768431, 0, 0, 0, 1, 1,
-1.654284, -2.874991, -0.5016471, 0, 0, 0, 1, 1,
-1.641776, -0.1599382, -1.171778, 0, 0, 0, 1, 1,
-1.641702, -0.1200383, -1.915292, 0, 0, 0, 1, 1,
-1.629882, 1.361346, 0.4194047, 0, 0, 0, 1, 1,
-1.592255, 0.4199339, -0.02674599, 1, 1, 1, 1, 1,
-1.590776, 1.097204, -1.070185, 1, 1, 1, 1, 1,
-1.582893, -0.3454246, -1.622056, 1, 1, 1, 1, 1,
-1.577321, -0.2297751, -0.1664323, 1, 1, 1, 1, 1,
-1.561608, 0.8120803, -0.7981818, 1, 1, 1, 1, 1,
-1.558877, -0.0691558, -1.952571, 1, 1, 1, 1, 1,
-1.531394, -0.2322489, -0.8751564, 1, 1, 1, 1, 1,
-1.529764, -0.8822667, -1.562582, 1, 1, 1, 1, 1,
-1.524407, -0.07779203, -3.942984, 1, 1, 1, 1, 1,
-1.510454, 0.1827278, -1.317489, 1, 1, 1, 1, 1,
-1.501786, -0.5531869, -1.046278, 1, 1, 1, 1, 1,
-1.497442, -0.8365281, -1.570915, 1, 1, 1, 1, 1,
-1.480215, -0.4628913, -1.26136, 1, 1, 1, 1, 1,
-1.477068, 0.3808128, -1.671963, 1, 1, 1, 1, 1,
-1.468221, -1.641271, -1.732701, 1, 1, 1, 1, 1,
-1.467942, 0.6509376, -0.8443835, 0, 0, 1, 1, 1,
-1.467199, 0.07338538, -1.377915, 1, 0, 0, 1, 1,
-1.464637, 0.4185727, -2.017235, 1, 0, 0, 1, 1,
-1.450291, -1.251251, -1.144061, 1, 0, 0, 1, 1,
-1.419975, -0.1994443, -1.205476, 1, 0, 0, 1, 1,
-1.415233, -1.252616, -0.5086511, 1, 0, 0, 1, 1,
-1.398142, 1.29058, -0.8929294, 0, 0, 0, 1, 1,
-1.396447, -3.105262, -1.940859, 0, 0, 0, 1, 1,
-1.39536, -0.2080247, -3.219704, 0, 0, 0, 1, 1,
-1.39119, -0.9206401, -3.257589, 0, 0, 0, 1, 1,
-1.386286, 0.2529028, -1.620571, 0, 0, 0, 1, 1,
-1.375739, 0.9526173, -0.9838012, 0, 0, 0, 1, 1,
-1.37339, 1.455007, -0.239565, 0, 0, 0, 1, 1,
-1.372724, -2.023879, -3.243211, 1, 1, 1, 1, 1,
-1.36054, 0.7712201, -2.84276, 1, 1, 1, 1, 1,
-1.355752, 0.6255019, -2.268106, 1, 1, 1, 1, 1,
-1.342129, 0.2198844, -1.786208, 1, 1, 1, 1, 1,
-1.339978, -0.7494301, -1.381499, 1, 1, 1, 1, 1,
-1.337619, -0.5711404, -2.604542, 1, 1, 1, 1, 1,
-1.327473, -1.616082, -1.932665, 1, 1, 1, 1, 1,
-1.32708, 0.4496869, -1.888856, 1, 1, 1, 1, 1,
-1.318877, -2.286659, -4.106362, 1, 1, 1, 1, 1,
-1.309977, -2.225795, -4.195348, 1, 1, 1, 1, 1,
-1.30605, -0.5629532, -1.90265, 1, 1, 1, 1, 1,
-1.299747, 0.6659247, -0.868246, 1, 1, 1, 1, 1,
-1.287875, -0.1044404, -2.954, 1, 1, 1, 1, 1,
-1.262065, -1.435423, -3.806594, 1, 1, 1, 1, 1,
-1.259719, 0.5913958, -0.407302, 1, 1, 1, 1, 1,
-1.258794, 1.661881, 0.2076495, 0, 0, 1, 1, 1,
-1.258108, -1.414517, -3.093732, 1, 0, 0, 1, 1,
-1.257121, -0.2336006, -2.691849, 1, 0, 0, 1, 1,
-1.24772, -0.06049263, -0.6516753, 1, 0, 0, 1, 1,
-1.246913, -1.01964, -1.814577, 1, 0, 0, 1, 1,
-1.242964, 1.736072, 0.9732097, 1, 0, 0, 1, 1,
-1.240192, 0.8133677, 0.01680947, 0, 0, 0, 1, 1,
-1.216166, -0.1515029, -4.379026, 0, 0, 0, 1, 1,
-1.214699, 2.163963, -1.296959, 0, 0, 0, 1, 1,
-1.195633, 1.751209, -1.243243, 0, 0, 0, 1, 1,
-1.18911, -0.3555059, -1.489404, 0, 0, 0, 1, 1,
-1.186817, -0.1200062, -1.189631, 0, 0, 0, 1, 1,
-1.18189, -2.324975, -2.927048, 0, 0, 0, 1, 1,
-1.180219, -0.5921457, -1.15584, 1, 1, 1, 1, 1,
-1.17174, 0.04735769, -3.200317, 1, 1, 1, 1, 1,
-1.167727, 0.7992122, -2.013147, 1, 1, 1, 1, 1,
-1.161425, -0.3191739, -2.887778, 1, 1, 1, 1, 1,
-1.141486, 0.00681851, -1.749158, 1, 1, 1, 1, 1,
-1.139667, -0.8206427, -3.885151, 1, 1, 1, 1, 1,
-1.129853, 0.04949436, -0.6222046, 1, 1, 1, 1, 1,
-1.12248, 1.569955, -1.406528, 1, 1, 1, 1, 1,
-1.115832, -0.6519503, -1.756422, 1, 1, 1, 1, 1,
-1.109759, 0.2457245, -1.974053, 1, 1, 1, 1, 1,
-1.105721, -0.0400041, -2.028831, 1, 1, 1, 1, 1,
-1.105362, 0.8753524, -1.330663, 1, 1, 1, 1, 1,
-1.10501, 0.7638057, -1.819102, 1, 1, 1, 1, 1,
-1.095996, -0.1857325, -0.3974033, 1, 1, 1, 1, 1,
-1.09324, 0.7316929, -1.016179, 1, 1, 1, 1, 1,
-1.091535, 1.52319, -1.945611, 0, 0, 1, 1, 1,
-1.081971, 1.061105, -1.539816, 1, 0, 0, 1, 1,
-1.074373, 0.220738, -1.630983, 1, 0, 0, 1, 1,
-1.072669, 0.2519155, -3.616799, 1, 0, 0, 1, 1,
-1.069801, -0.4663694, -1.308163, 1, 0, 0, 1, 1,
-1.065703, -0.579845, -1.492756, 1, 0, 0, 1, 1,
-1.061732, 1.501045, -0.8420297, 0, 0, 0, 1, 1,
-1.057336, -0.717255, -2.160548, 0, 0, 0, 1, 1,
-1.054323, -0.6058364, -4.036645, 0, 0, 0, 1, 1,
-1.053551, 0.9698152, -1.908794, 0, 0, 0, 1, 1,
-1.050003, -0.3770014, -2.814143, 0, 0, 0, 1, 1,
-1.0471, 0.6974841, 0.6368367, 0, 0, 0, 1, 1,
-1.04067, 1.046342, -3.093908, 0, 0, 0, 1, 1,
-1.039689, 0.01507514, -0.1575145, 1, 1, 1, 1, 1,
-1.037727, 0.6184891, -1.70624, 1, 1, 1, 1, 1,
-1.037333, 0.8870582, 0.5683752, 1, 1, 1, 1, 1,
-1.034079, -0.720376, -2.705909, 1, 1, 1, 1, 1,
-1.03348, 0.4904555, -0.5349425, 1, 1, 1, 1, 1,
-1.015302, -1.068352, -2.339797, 1, 1, 1, 1, 1,
-1.008248, 0.6443582, -1.802527, 1, 1, 1, 1, 1,
-1.005617, -2.382607, -2.033112, 1, 1, 1, 1, 1,
-1.000241, -1.268791, -3.136718, 1, 1, 1, 1, 1,
-0.9998232, 0.3202823, 0.07315533, 1, 1, 1, 1, 1,
-0.9983946, -1.037378, -0.7653883, 1, 1, 1, 1, 1,
-0.9946258, 0.1935944, -0.9190468, 1, 1, 1, 1, 1,
-0.9941434, 1.406726, -2.091539, 1, 1, 1, 1, 1,
-0.9922717, 0.7659972, -0.5162511, 1, 1, 1, 1, 1,
-0.992104, -0.2965662, -2.418426, 1, 1, 1, 1, 1,
-0.9865832, -0.05756539, -1.050788, 0, 0, 1, 1, 1,
-0.9719782, -0.3980885, -3.330002, 1, 0, 0, 1, 1,
-0.969668, 1.369697, -0.01177626, 1, 0, 0, 1, 1,
-0.9664613, 0.473227, -0.6659297, 1, 0, 0, 1, 1,
-0.9642869, 0.580029, -1.117911, 1, 0, 0, 1, 1,
-0.9534927, -0.1096347, -2.03182, 1, 0, 0, 1, 1,
-0.953054, 1.348958, -0.5856244, 0, 0, 0, 1, 1,
-0.9495246, 0.518651, -0.62075, 0, 0, 0, 1, 1,
-0.9419822, 0.6305668, -1.618754, 0, 0, 0, 1, 1,
-0.9383653, -1.1647, -2.97809, 0, 0, 0, 1, 1,
-0.9362797, -2.02916, -3.422753, 0, 0, 0, 1, 1,
-0.93515, -0.5930102, -3.948914, 0, 0, 0, 1, 1,
-0.9231687, 1.311258, -2.10354, 0, 0, 0, 1, 1,
-0.9098911, 1.652141, -0.8784739, 1, 1, 1, 1, 1,
-0.9083614, 0.7787375, -0.2597665, 1, 1, 1, 1, 1,
-0.9081975, 0.630946, -0.7246428, 1, 1, 1, 1, 1,
-0.8965765, -0.3904536, -1.716417, 1, 1, 1, 1, 1,
-0.8920783, 1.169678, -1.181549, 1, 1, 1, 1, 1,
-0.8912979, 0.5787939, -0.1847901, 1, 1, 1, 1, 1,
-0.8885019, -0.6596648, -2.715203, 1, 1, 1, 1, 1,
-0.8853261, -0.04044551, -1.113398, 1, 1, 1, 1, 1,
-0.8851004, 0.4788556, -2.709335, 1, 1, 1, 1, 1,
-0.8838139, -1.409008, -3.237388, 1, 1, 1, 1, 1,
-0.8760911, -0.003990467, 0.5388191, 1, 1, 1, 1, 1,
-0.8751861, -1.20254, -2.723478, 1, 1, 1, 1, 1,
-0.8718891, 2.016738, 0.7363518, 1, 1, 1, 1, 1,
-0.8651478, -1.048888, -1.667403, 1, 1, 1, 1, 1,
-0.8597242, -0.4897524, -0.9059368, 1, 1, 1, 1, 1,
-0.8585683, 0.4708517, 0.08109626, 0, 0, 1, 1, 1,
-0.8542488, 0.0450107, -2.88173, 1, 0, 0, 1, 1,
-0.8540058, -0.09324702, -0.5164379, 1, 0, 0, 1, 1,
-0.8470223, -1.640795, -2.276258, 1, 0, 0, 1, 1,
-0.8450855, -1.451544, -0.04936609, 1, 0, 0, 1, 1,
-0.8444007, 2.36359, -2.031416, 1, 0, 0, 1, 1,
-0.8337592, -0.443714, -2.869288, 0, 0, 0, 1, 1,
-0.8295429, -0.6005599, -0.495047, 0, 0, 0, 1, 1,
-0.8196995, -0.8141925, -2.237807, 0, 0, 0, 1, 1,
-0.8165997, 1.746999, -1.936822, 0, 0, 0, 1, 1,
-0.8163712, -0.0593727, -3.635915, 0, 0, 0, 1, 1,
-0.8138627, -1.698363, -2.416735, 0, 0, 0, 1, 1,
-0.8130674, 0.8886591, -1.959875, 0, 0, 0, 1, 1,
-0.8112119, -0.9971193, -0.5736042, 1, 1, 1, 1, 1,
-0.8107736, -0.7156669, -2.888909, 1, 1, 1, 1, 1,
-0.8058576, 0.5077142, -1.427525, 1, 1, 1, 1, 1,
-0.8036345, -1.348503, -3.030955, 1, 1, 1, 1, 1,
-0.8014478, 0.2948478, -0.6204645, 1, 1, 1, 1, 1,
-0.8000227, -0.09553193, -0.9453085, 1, 1, 1, 1, 1,
-0.7990766, -0.332199, -2.068153, 1, 1, 1, 1, 1,
-0.7961425, -0.6812698, -1.913636, 1, 1, 1, 1, 1,
-0.7951336, -1.732577, -2.824318, 1, 1, 1, 1, 1,
-0.794834, 0.4365223, 0.07511137, 1, 1, 1, 1, 1,
-0.7937385, 1.981069, 0.647682, 1, 1, 1, 1, 1,
-0.7906953, 0.4471103, 0.3980717, 1, 1, 1, 1, 1,
-0.7879443, 2.524994, -1.711193, 1, 1, 1, 1, 1,
-0.7855041, -0.9557251, -5.838611, 1, 1, 1, 1, 1,
-0.7791517, -0.714884, 0.3854393, 1, 1, 1, 1, 1,
-0.7709061, -0.4234215, -1.62131, 0, 0, 1, 1, 1,
-0.766545, 0.8479076, -2.795316, 1, 0, 0, 1, 1,
-0.762701, -0.08873583, -1.130095, 1, 0, 0, 1, 1,
-0.7620179, 0.6605444, -0.1765604, 1, 0, 0, 1, 1,
-0.760314, 0.1288292, -2.21465, 1, 0, 0, 1, 1,
-0.7476675, -0.9553071, -2.151661, 1, 0, 0, 1, 1,
-0.7377072, 0.192154, -0.7430269, 0, 0, 0, 1, 1,
-0.736768, 1.92211, -0.8820173, 0, 0, 0, 1, 1,
-0.7366652, 0.3803751, -1.189386, 0, 0, 0, 1, 1,
-0.7347605, 1.697666, -0.1220658, 0, 0, 0, 1, 1,
-0.734287, -0.91311, -2.294428, 0, 0, 0, 1, 1,
-0.733609, -0.1193363, -2.034681, 0, 0, 0, 1, 1,
-0.7332747, -0.02931866, -1.710366, 0, 0, 0, 1, 1,
-0.7302853, -1.264983, -3.701044, 1, 1, 1, 1, 1,
-0.726321, -0.3709559, -1.7238, 1, 1, 1, 1, 1,
-0.7199371, 0.8829584, -1.018534, 1, 1, 1, 1, 1,
-0.7166274, -1.841259, -2.259363, 1, 1, 1, 1, 1,
-0.714519, 0.9712646, 1.627903, 1, 1, 1, 1, 1,
-0.7126541, 0.2244661, -1.055277, 1, 1, 1, 1, 1,
-0.7114851, -3.413309, -3.169277, 1, 1, 1, 1, 1,
-0.7069231, -0.02191094, -1.756068, 1, 1, 1, 1, 1,
-0.7053478, 0.2765963, -1.956245, 1, 1, 1, 1, 1,
-0.705337, -0.9935661, -2.182174, 1, 1, 1, 1, 1,
-0.7027215, 0.07038352, -0.358323, 1, 1, 1, 1, 1,
-0.6890287, -0.03694418, -3.147235, 1, 1, 1, 1, 1,
-0.6871567, 1.086453, -0.7239323, 1, 1, 1, 1, 1,
-0.686725, -0.4581814, -1.978921, 1, 1, 1, 1, 1,
-0.6847785, -0.6980435, -1.931728, 1, 1, 1, 1, 1,
-0.6821217, -2.594124, -2.534269, 0, 0, 1, 1, 1,
-0.677975, 1.771631, 0.4499745, 1, 0, 0, 1, 1,
-0.6765496, -0.4382524, -3.058131, 1, 0, 0, 1, 1,
-0.671005, 0.2215141, -1.894038, 1, 0, 0, 1, 1,
-0.6683296, 0.9809577, 0.4465912, 1, 0, 0, 1, 1,
-0.6668687, 0.4164791, -1.562178, 1, 0, 0, 1, 1,
-0.6645548, 0.1334555, -4.517919, 0, 0, 0, 1, 1,
-0.6613963, -1.487779, -1.066535, 0, 0, 0, 1, 1,
-0.6606384, 0.4960025, -0.4314123, 0, 0, 0, 1, 1,
-0.6557777, -1.427344, -2.629839, 0, 0, 0, 1, 1,
-0.6505793, -0.458588, -2.50351, 0, 0, 0, 1, 1,
-0.6491293, -0.9108462, -1.215195, 0, 0, 0, 1, 1,
-0.6442134, 0.9084192, 0.3575551, 0, 0, 0, 1, 1,
-0.6433434, -0.9800716, -1.716306, 1, 1, 1, 1, 1,
-0.6398045, -0.3376545, -1.917338, 1, 1, 1, 1, 1,
-0.6362982, -0.6783575, -3.740043, 1, 1, 1, 1, 1,
-0.6334369, -0.2218103, -2.255514, 1, 1, 1, 1, 1,
-0.6291758, -1.732878, -2.558202, 1, 1, 1, 1, 1,
-0.6200578, -0.1836107, -1.089378, 1, 1, 1, 1, 1,
-0.6179684, 1.151177, -0.3041846, 1, 1, 1, 1, 1,
-0.6137283, 2.029335, -0.02896619, 1, 1, 1, 1, 1,
-0.6117105, 0.1369911, -2.395179, 1, 1, 1, 1, 1,
-0.6096261, -0.9044172, -3.012292, 1, 1, 1, 1, 1,
-0.6087932, 1.206795, -0.7987359, 1, 1, 1, 1, 1,
-0.6031474, -0.5044017, -2.949369, 1, 1, 1, 1, 1,
-0.6016762, -0.6584984, -2.779781, 1, 1, 1, 1, 1,
-0.597599, -0.00105321, -0.439846, 1, 1, 1, 1, 1,
-0.5936623, 0.1829268, -1.692493, 1, 1, 1, 1, 1,
-0.589259, 0.9842262, -0.5960141, 0, 0, 1, 1, 1,
-0.5868512, 2.319707, 0.6395851, 1, 0, 0, 1, 1,
-0.5816212, -0.3641697, -2.663337, 1, 0, 0, 1, 1,
-0.5808814, -1.131248, -3.420075, 1, 0, 0, 1, 1,
-0.5797784, -0.7331605, -2.686067, 1, 0, 0, 1, 1,
-0.575196, -0.8729312, -1.89374, 1, 0, 0, 1, 1,
-0.5750481, -0.9301331, -0.7301584, 0, 0, 0, 1, 1,
-0.5721176, 1.804055, -0.9000187, 0, 0, 0, 1, 1,
-0.5718084, -1.425079, -5.894616, 0, 0, 0, 1, 1,
-0.5636033, -1.528098, -3.562729, 0, 0, 0, 1, 1,
-0.5605473, -0.2914903, -2.872616, 0, 0, 0, 1, 1,
-0.5536814, -0.2643958, -4.174186, 0, 0, 0, 1, 1,
-0.5533949, 0.206789, -0.6406435, 0, 0, 0, 1, 1,
-0.5498811, 0.3745254, -1.087917, 1, 1, 1, 1, 1,
-0.5430542, -0.6918874, -1.959163, 1, 1, 1, 1, 1,
-0.5408518, 0.04564249, -0.09388361, 1, 1, 1, 1, 1,
-0.5404893, -0.5484899, -2.146478, 1, 1, 1, 1, 1,
-0.5393983, -0.6745339, -2.655603, 1, 1, 1, 1, 1,
-0.5373316, 1.904362, 0.02384824, 1, 1, 1, 1, 1,
-0.5351204, 0.8934982, -1.157463, 1, 1, 1, 1, 1,
-0.5316154, -0.5376843, -1.523696, 1, 1, 1, 1, 1,
-0.5276173, -0.4261653, -1.973908, 1, 1, 1, 1, 1,
-0.5261813, -2.792423, -4.408867, 1, 1, 1, 1, 1,
-0.5257719, -2.431037, -2.76479, 1, 1, 1, 1, 1,
-0.5248095, -0.824437, -2.352409, 1, 1, 1, 1, 1,
-0.5231346, -1.795011, -1.695486, 1, 1, 1, 1, 1,
-0.5230049, 1.754498, -0.1159413, 1, 1, 1, 1, 1,
-0.5221093, 0.5814745, -0.3615497, 1, 1, 1, 1, 1,
-0.5207027, -1.20111, -3.415073, 0, 0, 1, 1, 1,
-0.5192817, 2.176956, -0.188092, 1, 0, 0, 1, 1,
-0.5147696, -1.172651, -3.097149, 1, 0, 0, 1, 1,
-0.5147145, -2.392318, -1.630409, 1, 0, 0, 1, 1,
-0.5143965, 0.3707989, -0.229993, 1, 0, 0, 1, 1,
-0.5114077, 0.3536581, -0.5472101, 1, 0, 0, 1, 1,
-0.5004569, 1.336071, -0.998951, 0, 0, 0, 1, 1,
-0.4991487, 1.161832, -1.387253, 0, 0, 0, 1, 1,
-0.4989187, 0.0644442, -1.731727, 0, 0, 0, 1, 1,
-0.4988657, 0.4651493, -1.2014, 0, 0, 0, 1, 1,
-0.4984907, -0.7388902, -1.479405, 0, 0, 0, 1, 1,
-0.4975507, 0.4768079, 0.007291214, 0, 0, 0, 1, 1,
-0.4912377, -2.149705, -2.609399, 0, 0, 0, 1, 1,
-0.4894162, 0.3663946, -1.052538, 1, 1, 1, 1, 1,
-0.4814394, -0.1280458, -1.700736, 1, 1, 1, 1, 1,
-0.4778705, -0.03056719, -1.646997, 1, 1, 1, 1, 1,
-0.4777879, -0.4107847, -3.56847, 1, 1, 1, 1, 1,
-0.4771716, -1.95624, -4.289983, 1, 1, 1, 1, 1,
-0.4748721, -0.3644192, -1.03177, 1, 1, 1, 1, 1,
-0.4717959, 0.3544889, -3.083203, 1, 1, 1, 1, 1,
-0.4706843, -0.6276779, -1.965799, 1, 1, 1, 1, 1,
-0.4696822, 1.600977, 1.093435, 1, 1, 1, 1, 1,
-0.4688182, -0.5902092, -2.990264, 1, 1, 1, 1, 1,
-0.4647433, -1.248521, -1.941358, 1, 1, 1, 1, 1,
-0.464046, 1.917407, 0.6774945, 1, 1, 1, 1, 1,
-0.4604428, -1.051123, -0.8864285, 1, 1, 1, 1, 1,
-0.4601062, -0.2194146, -2.510861, 1, 1, 1, 1, 1,
-0.4589557, -0.04256263, -1.263655, 1, 1, 1, 1, 1,
-0.4587581, 1.75043, 0.3041527, 0, 0, 1, 1, 1,
-0.4532777, -0.05142435, -1.142201, 1, 0, 0, 1, 1,
-0.4514937, 0.5577414, -0.4870528, 1, 0, 0, 1, 1,
-0.4495953, -1.700913, -3.142065, 1, 0, 0, 1, 1,
-0.439808, 1.12631, -0.3687453, 1, 0, 0, 1, 1,
-0.4392436, -0.4402014, -2.852536, 1, 0, 0, 1, 1,
-0.4375879, -1.457601, -3.793588, 0, 0, 0, 1, 1,
-0.4290998, -0.9043524, -2.228593, 0, 0, 0, 1, 1,
-0.4283904, 1.675576, -0.4367711, 0, 0, 0, 1, 1,
-0.4243923, -0.6513212, -3.769765, 0, 0, 0, 1, 1,
-0.421646, 0.4644669, -1.753512, 0, 0, 0, 1, 1,
-0.4213492, 0.3122683, -1.263376, 0, 0, 0, 1, 1,
-0.4190058, -0.663285, -2.004853, 0, 0, 0, 1, 1,
-0.4172028, 1.181562, -2.311576, 1, 1, 1, 1, 1,
-0.4127318, 0.1221678, -1.173218, 1, 1, 1, 1, 1,
-0.4118573, -0.6798488, -2.083454, 1, 1, 1, 1, 1,
-0.4078206, -0.9806768, -1.684601, 1, 1, 1, 1, 1,
-0.4046485, 1.257201, -1.463447, 1, 1, 1, 1, 1,
-0.4016708, -0.03065868, -1.097504, 1, 1, 1, 1, 1,
-0.399713, 0.05302155, 0.2743765, 1, 1, 1, 1, 1,
-0.3963629, -1.751461, -2.70747, 1, 1, 1, 1, 1,
-0.3944148, 2.055463, 1.291585, 1, 1, 1, 1, 1,
-0.3925375, 0.1846086, -1.02209, 1, 1, 1, 1, 1,
-0.3922422, -0.1363291, 0.3088442, 1, 1, 1, 1, 1,
-0.3918354, -0.4323809, -2.446413, 1, 1, 1, 1, 1,
-0.3885158, -0.6440079, -1.322703, 1, 1, 1, 1, 1,
-0.3860002, -0.485943, -1.695449, 1, 1, 1, 1, 1,
-0.3853057, 0.8836757, -1.255969, 1, 1, 1, 1, 1,
-0.3837773, -1.512956, -2.866748, 0, 0, 1, 1, 1,
-0.3825651, -0.2857427, -1.816278, 1, 0, 0, 1, 1,
-0.3816921, -1.00595, -1.983779, 1, 0, 0, 1, 1,
-0.3813265, 0.04303754, -0.2601903, 1, 0, 0, 1, 1,
-0.379676, 1.103205, 0.7568403, 1, 0, 0, 1, 1,
-0.3780661, -0.2321801, -3.359008, 1, 0, 0, 1, 1,
-0.3777476, 1.125293, -0.8443474, 0, 0, 0, 1, 1,
-0.3775567, -0.348087, -2.619531, 0, 0, 0, 1, 1,
-0.3733528, -0.2563619, -1.139936, 0, 0, 0, 1, 1,
-0.3650117, 0.8971279, 0.355772, 0, 0, 0, 1, 1,
-0.3627165, 0.6449018, -1.979991, 0, 0, 0, 1, 1,
-0.3595251, -0.7361034, -2.069763, 0, 0, 0, 1, 1,
-0.3526285, 0.0222657, -1.337735, 0, 0, 0, 1, 1,
-0.3518751, -0.7043754, -0.6489499, 1, 1, 1, 1, 1,
-0.3509682, 0.7576278, -1.003769, 1, 1, 1, 1, 1,
-0.3493148, -1.159885, -0.06794704, 1, 1, 1, 1, 1,
-0.3464086, -0.1972915, -3.705551, 1, 1, 1, 1, 1,
-0.3444465, 0.341525, -1.264896, 1, 1, 1, 1, 1,
-0.3424298, -0.4368799, -1.221035, 1, 1, 1, 1, 1,
-0.3400412, -0.4419428, -2.975747, 1, 1, 1, 1, 1,
-0.3396773, -2.087511, -2.972291, 1, 1, 1, 1, 1,
-0.3341054, -0.02288264, -0.4028965, 1, 1, 1, 1, 1,
-0.332413, 2.408914, -3.126739, 1, 1, 1, 1, 1,
-0.3272709, 0.3887209, -0.02782108, 1, 1, 1, 1, 1,
-0.3235394, 0.02546897, 0.7690111, 1, 1, 1, 1, 1,
-0.3224849, 1.055622, -1.047775, 1, 1, 1, 1, 1,
-0.3220673, -1.952444, -2.70406, 1, 1, 1, 1, 1,
-0.3196251, -1.987769, -3.330003, 1, 1, 1, 1, 1,
-0.3189285, 0.4674025, 0.3791536, 0, 0, 1, 1, 1,
-0.3152395, -0.5229232, -2.068004, 1, 0, 0, 1, 1,
-0.3149855, 0.7085669, -1.373249, 1, 0, 0, 1, 1,
-0.3120909, 1.070127, -1.015751, 1, 0, 0, 1, 1,
-0.3095849, 2.068376, 0.2590246, 1, 0, 0, 1, 1,
-0.3092975, 1.390947, 0.008804366, 1, 0, 0, 1, 1,
-0.3038019, -0.8788033, -2.551117, 0, 0, 0, 1, 1,
-0.2991422, -1.002509, -1.482184, 0, 0, 0, 1, 1,
-0.2989925, -0.02629862, -2.222962, 0, 0, 0, 1, 1,
-0.2979115, 0.2942254, -0.6233624, 0, 0, 0, 1, 1,
-0.2967256, 0.9117759, -0.5591467, 0, 0, 0, 1, 1,
-0.2966668, 2.26215, 1.136974, 0, 0, 0, 1, 1,
-0.2956596, 1.324987, -0.6251355, 0, 0, 0, 1, 1,
-0.2940691, -0.2611435, -2.166174, 1, 1, 1, 1, 1,
-0.2878116, 0.1656545, -2.161, 1, 1, 1, 1, 1,
-0.2875403, -0.8141418, -1.350079, 1, 1, 1, 1, 1,
-0.2816483, 0.3267906, -0.5984257, 1, 1, 1, 1, 1,
-0.2796804, -0.5415469, -1.582724, 1, 1, 1, 1, 1,
-0.2747784, 0.7205203, 2.040418, 1, 1, 1, 1, 1,
-0.2716739, -0.04977264, -1.57854, 1, 1, 1, 1, 1,
-0.2712671, -2.99791, -2.789837, 1, 1, 1, 1, 1,
-0.2679394, 0.6344548, -0.9576314, 1, 1, 1, 1, 1,
-0.2651631, -0.4525713, -1.34046, 1, 1, 1, 1, 1,
-0.2622871, 0.1993028, -0.8321216, 1, 1, 1, 1, 1,
-0.2621961, 0.7278672, -0.1943532, 1, 1, 1, 1, 1,
-0.2620098, -0.7312607, -1.55381, 1, 1, 1, 1, 1,
-0.2595707, -0.01615666, -1.440214, 1, 1, 1, 1, 1,
-0.2580621, 0.703662, -0.4048291, 1, 1, 1, 1, 1,
-0.2567885, -1.209153, -1.704868, 0, 0, 1, 1, 1,
-0.2562841, 1.674913, 1.591352, 1, 0, 0, 1, 1,
-0.2545388, 1.27201, 0.7632378, 1, 0, 0, 1, 1,
-0.2520257, -0.2395103, -0.5637518, 1, 0, 0, 1, 1,
-0.2509106, 0.4273972, -0.2331832, 1, 0, 0, 1, 1,
-0.2486807, -0.1992792, -2.19399, 1, 0, 0, 1, 1,
-0.2485334, -1.529139, -3.468274, 0, 0, 0, 1, 1,
-0.2473404, 0.2784279, -0.7812611, 0, 0, 0, 1, 1,
-0.2464411, 0.6239461, -1.866566, 0, 0, 0, 1, 1,
-0.2462512, -0.4431744, -3.070608, 0, 0, 0, 1, 1,
-0.2425691, -0.1416474, -3.326926, 0, 0, 0, 1, 1,
-0.2399919, 1.011866, 0.5260422, 0, 0, 0, 1, 1,
-0.2385543, -0.1510183, -1.700424, 0, 0, 0, 1, 1,
-0.2383505, -1.127892, -3.404406, 1, 1, 1, 1, 1,
-0.2352636, 1.626998, 0.03175057, 1, 1, 1, 1, 1,
-0.2303092, -0.2203332, -1.929734, 1, 1, 1, 1, 1,
-0.2292681, 1.064997, -2.466056, 1, 1, 1, 1, 1,
-0.2291336, 1.570592, 0.1560326, 1, 1, 1, 1, 1,
-0.2242196, 0.9842184, 0.502494, 1, 1, 1, 1, 1,
-0.2224968, 0.1873199, 0.3245246, 1, 1, 1, 1, 1,
-0.2175877, 0.6467854, 0.5066, 1, 1, 1, 1, 1,
-0.2164729, -1.193911, -2.117274, 1, 1, 1, 1, 1,
-0.2143391, 0.257563, -1.315587, 1, 1, 1, 1, 1,
-0.2140491, 0.3585694, -0.5796847, 1, 1, 1, 1, 1,
-0.2135121, 0.5436898, -1.960649, 1, 1, 1, 1, 1,
-0.21119, -0.5901681, -3.480772, 1, 1, 1, 1, 1,
-0.2106172, -0.9020753, -3.961899, 1, 1, 1, 1, 1,
-0.2054809, 0.02430638, -2.422913, 1, 1, 1, 1, 1,
-0.2035691, -1.612543, -2.63485, 0, 0, 1, 1, 1,
-0.2033721, -0.9051734, -2.817365, 1, 0, 0, 1, 1,
-0.1990587, -0.3645864, -1.602278, 1, 0, 0, 1, 1,
-0.1986927, -0.05618931, -0.8592876, 1, 0, 0, 1, 1,
-0.1975188, -0.777538, -1.538286, 1, 0, 0, 1, 1,
-0.1973568, -0.9233463, -3.734737, 1, 0, 0, 1, 1,
-0.1973253, -0.9058732, -2.219035, 0, 0, 0, 1, 1,
-0.1971563, 0.3850948, -1.581398, 0, 0, 0, 1, 1,
-0.1953137, 0.2339541, -0.8208385, 0, 0, 0, 1, 1,
-0.1952334, -1.200542, -4.120315, 0, 0, 0, 1, 1,
-0.1931104, -3.133791, -2.156201, 0, 0, 0, 1, 1,
-0.1876661, -0.9624177, -3.168442, 0, 0, 0, 1, 1,
-0.1821939, 1.571542, -0.4457517, 0, 0, 0, 1, 1,
-0.1800367, 1.303321, -1.972128, 1, 1, 1, 1, 1,
-0.1780771, 0.3334451, -0.62377, 1, 1, 1, 1, 1,
-0.1780465, 0.4256986, -1.22328, 1, 1, 1, 1, 1,
-0.1758457, 0.558028, -0.6942407, 1, 1, 1, 1, 1,
-0.1756464, -0.6021774, -1.136309, 1, 1, 1, 1, 1,
-0.1739619, 1.591971, 1.272527, 1, 1, 1, 1, 1,
-0.1713559, -2.113054, -3.437959, 1, 1, 1, 1, 1,
-0.1700747, 1.10255, 0.178984, 1, 1, 1, 1, 1,
-0.1691957, -0.6260402, -2.700005, 1, 1, 1, 1, 1,
-0.1654873, 1.122995, -0.7127552, 1, 1, 1, 1, 1,
-0.1605781, -0.8417534, -2.91434, 1, 1, 1, 1, 1,
-0.1584706, 2.441795, 0.04186077, 1, 1, 1, 1, 1,
-0.1573504, 1.046391, 0.1434162, 1, 1, 1, 1, 1,
-0.1541253, -1.213343, -2.544353, 1, 1, 1, 1, 1,
-0.1519964, 0.8370178, -0.1670766, 1, 1, 1, 1, 1,
-0.1470721, 1.675664, -0.01837903, 0, 0, 1, 1, 1,
-0.1462261, -0.1195839, -1.997937, 1, 0, 0, 1, 1,
-0.1452497, -0.8701059, -1.538435, 1, 0, 0, 1, 1,
-0.1422703, 0.5871223, 1.380463, 1, 0, 0, 1, 1,
-0.142003, -0.4534657, -4.709272, 1, 0, 0, 1, 1,
-0.1408981, 1.29394, 0.3172803, 1, 0, 0, 1, 1,
-0.1399208, -0.2350835, -2.949976, 0, 0, 0, 1, 1,
-0.1390401, -0.09797998, -2.295638, 0, 0, 0, 1, 1,
-0.1367387, 0.8769085, -0.9701776, 0, 0, 0, 1, 1,
-0.1315355, 2.477514, -0.9031779, 0, 0, 0, 1, 1,
-0.1226704, 1.239057, -0.8062775, 0, 0, 0, 1, 1,
-0.1171798, -0.3979158, -2.053463, 0, 0, 0, 1, 1,
-0.1158402, 0.2197915, -1.198548, 0, 0, 0, 1, 1,
-0.1152946, 0.7888437, -1.076856, 1, 1, 1, 1, 1,
-0.1150217, -0.9727282, -1.774312, 1, 1, 1, 1, 1,
-0.1134058, 0.03001558, -1.302227, 1, 1, 1, 1, 1,
-0.1098633, -0.1136316, -2.207929, 1, 1, 1, 1, 1,
-0.109287, 0.2387009, 0.4620468, 1, 1, 1, 1, 1,
-0.1083543, 1.684833, -1.376559, 1, 1, 1, 1, 1,
-0.1057398, 1.310397, -0.18104, 1, 1, 1, 1, 1,
-0.1045593, -0.02874983, -1.566073, 1, 1, 1, 1, 1,
-0.1018192, 0.3666115, 0.5142967, 1, 1, 1, 1, 1,
-0.0989703, 0.8409979, 0.7969415, 1, 1, 1, 1, 1,
-0.09586476, -0.4707913, -2.994327, 1, 1, 1, 1, 1,
-0.091667, 1.570134, -0.2099911, 1, 1, 1, 1, 1,
-0.09121539, -0.09634746, -1.714901, 1, 1, 1, 1, 1,
-0.09105816, 1.040396, -1.406188, 1, 1, 1, 1, 1,
-0.08979172, 1.170185, -1.208227, 1, 1, 1, 1, 1,
-0.08969224, 0.3967941, -3.269924, 0, 0, 1, 1, 1,
-0.08935466, -0.607501, -2.651926, 1, 0, 0, 1, 1,
-0.08586351, 0.5742349, -0.09212737, 1, 0, 0, 1, 1,
-0.08479482, -0.120256, -4.760769, 1, 0, 0, 1, 1,
-0.07199723, 0.8330954, -0.9059774, 1, 0, 0, 1, 1,
-0.06447726, -0.6426864, -3.922156, 1, 0, 0, 1, 1,
-0.05896273, -1.25592, -2.807317, 0, 0, 0, 1, 1,
-0.05414958, 1.060772, 0.6034278, 0, 0, 0, 1, 1,
-0.05313646, -0.7548609, -3.230222, 0, 0, 0, 1, 1,
-0.05238516, 0.1455817, 0.3811637, 0, 0, 0, 1, 1,
-0.0520565, 0.08115947, -0.2725707, 0, 0, 0, 1, 1,
-0.05165784, -0.9344531, -3.26486, 0, 0, 0, 1, 1,
-0.04893057, -0.03279166, -1.496195, 0, 0, 0, 1, 1,
-0.04117642, -1.579443, -3.12905, 1, 1, 1, 1, 1,
-0.03880425, 0.21627, -0.6371909, 1, 1, 1, 1, 1,
-0.03603196, 0.03799031, -1.793039, 1, 1, 1, 1, 1,
-0.034303, -1.166864, -4.265874, 1, 1, 1, 1, 1,
-0.02998345, 0.9498666, -0.5458081, 1, 1, 1, 1, 1,
-0.02763844, 1.163118, -0.2937721, 1, 1, 1, 1, 1,
-0.02734986, 1.284195, -1.753589, 1, 1, 1, 1, 1,
-0.02558558, 0.1246247, 0.06832375, 1, 1, 1, 1, 1,
-0.02152846, -0.1398668, -2.157875, 1, 1, 1, 1, 1,
-0.01999077, 1.947049, 0.3112791, 1, 1, 1, 1, 1,
-0.01842584, 0.06896855, -0.5143135, 1, 1, 1, 1, 1,
-0.01323872, -2.960411, -1.807855, 1, 1, 1, 1, 1,
-0.01145798, -1.430517, -4.179534, 1, 1, 1, 1, 1,
-0.01117013, -0.9013427, -4.054823, 1, 1, 1, 1, 1,
-0.00047388, -2.180549, -4.056228, 1, 1, 1, 1, 1,
0.0007394264, -0.5789089, 2.620766, 0, 0, 1, 1, 1,
0.003177478, 0.3915154, -0.6679897, 1, 0, 0, 1, 1,
0.007511072, 0.162809, 0.7701086, 1, 0, 0, 1, 1,
0.01055939, 0.4112161, 0.01765286, 1, 0, 0, 1, 1,
0.01554716, 2.056759, -1.116879, 1, 0, 0, 1, 1,
0.01628333, -1.441431, 3.525182, 1, 0, 0, 1, 1,
0.02063336, 0.3533257, 1.282245, 0, 0, 0, 1, 1,
0.02920399, -0.31749, 3.298926, 0, 0, 0, 1, 1,
0.02941294, -0.3705522, 1.474373, 0, 0, 0, 1, 1,
0.02943438, -0.9840018, 2.991943, 0, 0, 0, 1, 1,
0.02978654, 1.35528, 0.3077746, 0, 0, 0, 1, 1,
0.03098169, -0.7199659, 1.982277, 0, 0, 0, 1, 1,
0.03258861, 1.084037, 0.4391881, 0, 0, 0, 1, 1,
0.03595141, -0.6341623, 3.637361, 1, 1, 1, 1, 1,
0.03666784, 1.514758, -0.9091464, 1, 1, 1, 1, 1,
0.03760585, -1.031512, 1.470137, 1, 1, 1, 1, 1,
0.03893464, 0.02629867, -0.07060922, 1, 1, 1, 1, 1,
0.04460473, -0.0390036, 0.292595, 1, 1, 1, 1, 1,
0.051008, 0.3921138, -1.737044, 1, 1, 1, 1, 1,
0.05190424, -0.1925925, 2.379916, 1, 1, 1, 1, 1,
0.05451337, -0.7767169, 1.69187, 1, 1, 1, 1, 1,
0.05697125, 2.131889, -1.132642, 1, 1, 1, 1, 1,
0.05750721, 0.2245634, 0.5574026, 1, 1, 1, 1, 1,
0.05751668, -1.973202, 3.276516, 1, 1, 1, 1, 1,
0.06125033, -2.157262, 3.712332, 1, 1, 1, 1, 1,
0.06170196, 0.1318034, 0.1013769, 1, 1, 1, 1, 1,
0.06444904, 0.06549109, -0.1442765, 1, 1, 1, 1, 1,
0.06723495, 0.4367701, 1.202289, 1, 1, 1, 1, 1,
0.0694109, 0.7447416, 0.3638073, 0, 0, 1, 1, 1,
0.08318428, -2.073914, 2.715688, 1, 0, 0, 1, 1,
0.08645026, 0.6767312, 2.181177, 1, 0, 0, 1, 1,
0.08652144, -1.636718, 2.244522, 1, 0, 0, 1, 1,
0.09051516, -1.220261, 2.248784, 1, 0, 0, 1, 1,
0.0912359, 1.175728, -2.005398, 1, 0, 0, 1, 1,
0.09184033, -0.6530494, 2.812257, 0, 0, 0, 1, 1,
0.09305036, -0.9009485, 2.764031, 0, 0, 0, 1, 1,
0.1011065, -0.6167862, 1.749928, 0, 0, 0, 1, 1,
0.1057281, 0.8852567, -1.860585, 0, 0, 0, 1, 1,
0.1061855, -0.5926386, 2.256585, 0, 0, 0, 1, 1,
0.1066586, 0.2055154, 0.5518848, 0, 0, 0, 1, 1,
0.1072371, -0.293444, 0.9933091, 0, 0, 0, 1, 1,
0.1190107, 0.3525889, -0.7712385, 1, 1, 1, 1, 1,
0.1193263, 0.6541961, 2.128362, 1, 1, 1, 1, 1,
0.1214375, 0.4743204, -0.3653356, 1, 1, 1, 1, 1,
0.1244497, -0.4786577, 3.777451, 1, 1, 1, 1, 1,
0.1302073, -0.4223047, 2.136073, 1, 1, 1, 1, 1,
0.1318667, 1.125735, -0.4740219, 1, 1, 1, 1, 1,
0.1360327, 1.069289, 0.4936241, 1, 1, 1, 1, 1,
0.1396694, -1.006486, 2.240993, 1, 1, 1, 1, 1,
0.1410694, -0.7746393, 2.571679, 1, 1, 1, 1, 1,
0.1411235, 0.4630164, 1.044512, 1, 1, 1, 1, 1,
0.1499836, 0.9656996, -0.462205, 1, 1, 1, 1, 1,
0.1507829, -1.365486, 2.723638, 1, 1, 1, 1, 1,
0.1575299, -0.1590389, 1.005245, 1, 1, 1, 1, 1,
0.1619778, 0.5780966, -0.3656166, 1, 1, 1, 1, 1,
0.1652218, -0.5872446, 2.583015, 1, 1, 1, 1, 1,
0.1679055, 0.5280614, -1.179032, 0, 0, 1, 1, 1,
0.1708713, 0.4041072, 1.071881, 1, 0, 0, 1, 1,
0.1719201, 0.336125, 1.644608, 1, 0, 0, 1, 1,
0.1721542, 1.469653, -0.2410441, 1, 0, 0, 1, 1,
0.1756178, -1.032342, 2.0893, 1, 0, 0, 1, 1,
0.1758097, -0.4772482, 2.239933, 1, 0, 0, 1, 1,
0.1833458, -1.006357, 1.453499, 0, 0, 0, 1, 1,
0.1834272, 1.512686, -1.044339, 0, 0, 0, 1, 1,
0.1859707, 0.3213432, -0.228221, 0, 0, 0, 1, 1,
0.1933944, -0.002507913, 1.594828, 0, 0, 0, 1, 1,
0.1943322, -0.593936, 3.416405, 0, 0, 0, 1, 1,
0.2094117, 0.9598119, 0.4607351, 0, 0, 0, 1, 1,
0.2099148, 0.7313313, 0.004170406, 0, 0, 0, 1, 1,
0.2155787, 0.06582962, -1.354281, 1, 1, 1, 1, 1,
0.2159245, -0.7016336, 3.568547, 1, 1, 1, 1, 1,
0.2162822, -0.1325352, 0.2294924, 1, 1, 1, 1, 1,
0.2179447, 1.187489, 0.9194397, 1, 1, 1, 1, 1,
0.2207275, -0.5292711, 3.091335, 1, 1, 1, 1, 1,
0.2232847, -0.7766698, 3.046084, 1, 1, 1, 1, 1,
0.2241747, 0.6583003, -0.4591564, 1, 1, 1, 1, 1,
0.2244895, 0.5084444, 1.828734, 1, 1, 1, 1, 1,
0.2281612, 0.2132818, 0.5799231, 1, 1, 1, 1, 1,
0.2291189, -1.268496, 2.603087, 1, 1, 1, 1, 1,
0.2307985, 0.8217672, -0.7036662, 1, 1, 1, 1, 1,
0.2365451, 0.5181016, 0.7554212, 1, 1, 1, 1, 1,
0.2367281, -1.883805, 2.840606, 1, 1, 1, 1, 1,
0.2388922, -0.5465772, 2.223438, 1, 1, 1, 1, 1,
0.2394381, -0.8709771, 3.57051, 1, 1, 1, 1, 1,
0.2401173, 2.315657, 1.319356, 0, 0, 1, 1, 1,
0.2419301, 1.557464, -1.145153, 1, 0, 0, 1, 1,
0.2435609, 1.855809, -0.3334609, 1, 0, 0, 1, 1,
0.2450818, 0.5567397, -0.5057101, 1, 0, 0, 1, 1,
0.2495283, 0.3998563, 1.169021, 1, 0, 0, 1, 1,
0.2548152, 0.9105561, 0.2020658, 1, 0, 0, 1, 1,
0.255007, -0.9348549, 1.628123, 0, 0, 0, 1, 1,
0.255501, 0.7936521, 1.851958, 0, 0, 0, 1, 1,
0.2556941, 0.1209161, 0.3118782, 0, 0, 0, 1, 1,
0.2568389, 0.9598957, 0.9982738, 0, 0, 0, 1, 1,
0.2589718, 0.2453557, 1.871894, 0, 0, 0, 1, 1,
0.2593953, 0.888244, 0.02478568, 0, 0, 0, 1, 1,
0.2595608, 0.2345267, 2.43786, 0, 0, 0, 1, 1,
0.2596918, 0.03019132, -0.4839558, 1, 1, 1, 1, 1,
0.2620389, -1.719551, 3.33973, 1, 1, 1, 1, 1,
0.2624689, 0.9254031, -0.6407773, 1, 1, 1, 1, 1,
0.2634921, -1.002316, 3.421947, 1, 1, 1, 1, 1,
0.2701124, -0.7380058, 2.579716, 1, 1, 1, 1, 1,
0.2703001, 0.2366576, 2.573724, 1, 1, 1, 1, 1,
0.2723646, -0.5369481, 2.578064, 1, 1, 1, 1, 1,
0.2777747, -0.1115361, 1.074185, 1, 1, 1, 1, 1,
0.2788043, 0.4820158, 0.278414, 1, 1, 1, 1, 1,
0.2800487, -0.6440919, 1.038937, 1, 1, 1, 1, 1,
0.283463, -1.54898, 3.54535, 1, 1, 1, 1, 1,
0.2837993, -0.9847074, 2.450917, 1, 1, 1, 1, 1,
0.2879588, 1.460885, 2.305226, 1, 1, 1, 1, 1,
0.2890651, -0.882195, 3.43219, 1, 1, 1, 1, 1,
0.2949939, -0.4017308, 2.629418, 1, 1, 1, 1, 1,
0.2963629, -0.3482878, 1.756172, 0, 0, 1, 1, 1,
0.2987852, 1.804831, 2.492329, 1, 0, 0, 1, 1,
0.2999714, -1.853908, 2.48394, 1, 0, 0, 1, 1,
0.3003823, 0.5970622, 0.02091461, 1, 0, 0, 1, 1,
0.3016847, 1.15937, -0.005876604, 1, 0, 0, 1, 1,
0.3034656, 0.6456249, -0.9238632, 1, 0, 0, 1, 1,
0.3041813, -1.9351, 2.977068, 0, 0, 0, 1, 1,
0.3069608, -0.007065615, 1.632478, 0, 0, 0, 1, 1,
0.3080652, 0.3348853, -1.499162, 0, 0, 0, 1, 1,
0.3123459, 0.599835, -0.4417963, 0, 0, 0, 1, 1,
0.3143307, -1.696393, 1.860602, 0, 0, 0, 1, 1,
0.3176205, -0.7489502, 3.411982, 0, 0, 0, 1, 1,
0.3257695, -0.8353898, 4.546675, 0, 0, 0, 1, 1,
0.3320021, -0.4164246, 3.80166, 1, 1, 1, 1, 1,
0.3334945, -0.1295982, 0.6821164, 1, 1, 1, 1, 1,
0.3369437, -0.484765, 3.591054, 1, 1, 1, 1, 1,
0.3383628, -2.654073, 3.030501, 1, 1, 1, 1, 1,
0.3400373, -0.1670585, 1.549602, 1, 1, 1, 1, 1,
0.3520289, -0.122716, 2.307313, 1, 1, 1, 1, 1,
0.3561058, 1.510731, 1.708258, 1, 1, 1, 1, 1,
0.3594182, -2.530337, 2.880115, 1, 1, 1, 1, 1,
0.3660969, 0.5370361, 0.992696, 1, 1, 1, 1, 1,
0.3672546, -0.3071149, 3.009068, 1, 1, 1, 1, 1,
0.3691695, 0.3824758, -0.00560226, 1, 1, 1, 1, 1,
0.3708259, -1.261911, 1.824793, 1, 1, 1, 1, 1,
0.3727918, -0.6023039, 2.34368, 1, 1, 1, 1, 1,
0.3761256, 0.04537022, 1.447112, 1, 1, 1, 1, 1,
0.379569, 1.182925, -1.530164, 1, 1, 1, 1, 1,
0.3798105, -0.5921121, 2.027793, 0, 0, 1, 1, 1,
0.3816241, 0.8017774, 1.778435, 1, 0, 0, 1, 1,
0.3866738, -0.8156533, 3.11017, 1, 0, 0, 1, 1,
0.3884524, -1.22062, 3.383369, 1, 0, 0, 1, 1,
0.3935302, -0.3407584, 3.93138, 1, 0, 0, 1, 1,
0.3955207, 0.2813166, 0.09039198, 1, 0, 0, 1, 1,
0.3988597, 1.450525, -1.059811, 0, 0, 0, 1, 1,
0.4012374, 1.469069, -0.2674135, 0, 0, 0, 1, 1,
0.406158, 2.036017, -2.543328, 0, 0, 0, 1, 1,
0.4081872, 0.4353706, 0.242952, 0, 0, 0, 1, 1,
0.4100863, 0.5668976, 0.4773933, 0, 0, 0, 1, 1,
0.4129389, -1.208629, 1.219545, 0, 0, 0, 1, 1,
0.4149606, 0.7608169, 1.317901, 0, 0, 0, 1, 1,
0.415499, -3.055283, 4.05076, 1, 1, 1, 1, 1,
0.4184475, -0.3967696, 2.016174, 1, 1, 1, 1, 1,
0.4241241, -1.514194, 2.129954, 1, 1, 1, 1, 1,
0.4256722, 1.09576, 0.4151085, 1, 1, 1, 1, 1,
0.4260511, -0.5715441, 3.307808, 1, 1, 1, 1, 1,
0.4286981, -1.084286, 3.352463, 1, 1, 1, 1, 1,
0.4304412, 1.631723, 1.070671, 1, 1, 1, 1, 1,
0.4311514, -2.084795, 2.5535, 1, 1, 1, 1, 1,
0.4314495, 0.4305578, -0.6805679, 1, 1, 1, 1, 1,
0.4315965, 0.4893509, 0.9899964, 1, 1, 1, 1, 1,
0.4323028, 0.4868249, -0.5682356, 1, 1, 1, 1, 1,
0.4349889, 0.6998916, 0.4919274, 1, 1, 1, 1, 1,
0.4353295, 0.2123283, 2.646701, 1, 1, 1, 1, 1,
0.442126, 0.4733506, 1.512155, 1, 1, 1, 1, 1,
0.4424852, -3.070852, 3.042219, 1, 1, 1, 1, 1,
0.4470309, 0.2715914, 0.1844266, 0, 0, 1, 1, 1,
0.4471522, 0.3584711, -0.2898771, 1, 0, 0, 1, 1,
0.4488156, -1.313338, 3.681435, 1, 0, 0, 1, 1,
0.4490765, -0.3474058, 4.517585, 1, 0, 0, 1, 1,
0.4493577, 0.4120818, 1.462369, 1, 0, 0, 1, 1,
0.4525002, 1.202957, -0.6953044, 1, 0, 0, 1, 1,
0.4602848, -0.1750699, 1.953241, 0, 0, 0, 1, 1,
0.4630645, 0.01635901, 2.298518, 0, 0, 0, 1, 1,
0.4677547, -0.7497932, 4.086096, 0, 0, 0, 1, 1,
0.4693384, 1.06108, 2.139788, 0, 0, 0, 1, 1,
0.4708974, -0.1901013, 0.7452429, 0, 0, 0, 1, 1,
0.4729014, -1.099526, 1.563112, 0, 0, 0, 1, 1,
0.4804958, 0.4535605, 0.4232752, 0, 0, 0, 1, 1,
0.4807017, 0.3228745, 1.901037, 1, 1, 1, 1, 1,
0.48261, -1.929746, 1.724906, 1, 1, 1, 1, 1,
0.4856902, 0.074492, 1.935707, 1, 1, 1, 1, 1,
0.486287, -1.101363, 3.556323, 1, 1, 1, 1, 1,
0.4937436, 0.7442912, 0.2401346, 1, 1, 1, 1, 1,
0.4999337, 2.320699, 0.8211105, 1, 1, 1, 1, 1,
0.5008822, 2.065118, -0.2181868, 1, 1, 1, 1, 1,
0.5038037, 0.766432, 0.403611, 1, 1, 1, 1, 1,
0.5054752, 2.320949, 2.044472, 1, 1, 1, 1, 1,
0.5061533, -0.657839, 2.766336, 1, 1, 1, 1, 1,
0.5063272, -0.005275652, 2.087591, 1, 1, 1, 1, 1,
0.5091457, -1.049502, 2.391671, 1, 1, 1, 1, 1,
0.5140951, 0.1292486, 2.479461, 1, 1, 1, 1, 1,
0.5150098, 0.2621254, 0.0356891, 1, 1, 1, 1, 1,
0.5185947, -0.909791, 3.299019, 1, 1, 1, 1, 1,
0.5232444, -0.3168389, 2.782165, 0, 0, 1, 1, 1,
0.5232663, 0.2259235, 2.824172, 1, 0, 0, 1, 1,
0.5245411, 1.032167, 1.071617, 1, 0, 0, 1, 1,
0.5282131, 0.9036137, 0.7795459, 1, 0, 0, 1, 1,
0.5296156, -0.6019202, 2.365535, 1, 0, 0, 1, 1,
0.5323392, 0.09832343, 0.8178615, 1, 0, 0, 1, 1,
0.544013, 0.04440323, 0.01019343, 0, 0, 0, 1, 1,
0.547456, -0.04911798, 3.410948, 0, 0, 0, 1, 1,
0.5480819, -0.665585, 0.8232276, 0, 0, 0, 1, 1,
0.5513708, 0.8437872, 0.3595726, 0, 0, 0, 1, 1,
0.5548592, -0.5447921, 3.134864, 0, 0, 0, 1, 1,
0.5548654, 0.269751, 1.80817, 0, 0, 0, 1, 1,
0.5569139, 0.5713451, 1.833249, 0, 0, 0, 1, 1,
0.5593293, -0.1228291, 1.13998, 1, 1, 1, 1, 1,
0.5593902, 0.2285433, 0.8784538, 1, 1, 1, 1, 1,
0.5604777, 0.08643599, 0.1725173, 1, 1, 1, 1, 1,
0.5616088, 2.143655, 0.4587936, 1, 1, 1, 1, 1,
0.5618893, -1.05539, 1.128102, 1, 1, 1, 1, 1,
0.565051, -1.305124, 0.911213, 1, 1, 1, 1, 1,
0.5663495, -0.7337706, 1.651595, 1, 1, 1, 1, 1,
0.5704232, -0.5021269, 1.432359, 1, 1, 1, 1, 1,
0.5715274, -0.4906238, 1.46364, 1, 1, 1, 1, 1,
0.5728955, -1.810856, 1.176598, 1, 1, 1, 1, 1,
0.5733603, -1.094084, 0.7338961, 1, 1, 1, 1, 1,
0.5749313, -0.2101584, 1.918229, 1, 1, 1, 1, 1,
0.5908077, 1.157819, 0.03228538, 1, 1, 1, 1, 1,
0.592766, 0.2763378, 1.977131, 1, 1, 1, 1, 1,
0.5953795, 1.800554, 1.059864, 1, 1, 1, 1, 1,
0.5982722, 2.101233, -1.070048, 0, 0, 1, 1, 1,
0.6014438, -2.110033, 2.080351, 1, 0, 0, 1, 1,
0.6026366, 1.66711, -0.06433722, 1, 0, 0, 1, 1,
0.6028119, 1.149067, 0.5179991, 1, 0, 0, 1, 1,
0.6103951, -0.03867386, 1.554277, 1, 0, 0, 1, 1,
0.6105077, -0.6205956, 3.352397, 1, 0, 0, 1, 1,
0.6121587, -1.310339, 3.382588, 0, 0, 0, 1, 1,
0.6150634, -0.4139447, 1.654304, 0, 0, 0, 1, 1,
0.6166139, -0.1136247, 1.414209, 0, 0, 0, 1, 1,
0.6180602, 2.227108, -0.2947187, 0, 0, 0, 1, 1,
0.6209929, -1.85534, 3.220346, 0, 0, 0, 1, 1,
0.6235379, -0.8207775, 1.968713, 0, 0, 0, 1, 1,
0.6295641, 1.340747, 0.6779104, 0, 0, 0, 1, 1,
0.6399338, -1.454287, 2.947131, 1, 1, 1, 1, 1,
0.6491154, -0.4549215, 2.345074, 1, 1, 1, 1, 1,
0.6536903, 0.473586, 2.40702, 1, 1, 1, 1, 1,
0.6553868, -0.7018906, 3.291321, 1, 1, 1, 1, 1,
0.6568292, 0.3177731, -1.271796, 1, 1, 1, 1, 1,
0.658174, -0.1488897, 1.787977, 1, 1, 1, 1, 1,
0.6590871, 0.7667414, 2.561196, 1, 1, 1, 1, 1,
0.6590915, -0.5726613, 1.65147, 1, 1, 1, 1, 1,
0.6598122, -1.646345, 3.32424, 1, 1, 1, 1, 1,
0.6629661, -0.176509, 2.125139, 1, 1, 1, 1, 1,
0.6673295, -0.4829964, 1.096589, 1, 1, 1, 1, 1,
0.6738254, -0.5114591, 4.131125, 1, 1, 1, 1, 1,
0.67594, -0.02828408, 1.335521, 1, 1, 1, 1, 1,
0.6858356, 0.2555158, 2.231211, 1, 1, 1, 1, 1,
0.6867852, -0.6031358, 1.807076, 1, 1, 1, 1, 1,
0.6896446, 0.7969138, 2.085933, 0, 0, 1, 1, 1,
0.6917272, 1.402059, -0.4231107, 1, 0, 0, 1, 1,
0.6940731, 0.65194, -0.947283, 1, 0, 0, 1, 1,
0.6971726, -1.208039, 1.603293, 1, 0, 0, 1, 1,
0.7048404, 1.541286, 0.6520107, 1, 0, 0, 1, 1,
0.7114314, -1.41658, 2.911035, 1, 0, 0, 1, 1,
0.7116461, -1.064357, 0.3077154, 0, 0, 0, 1, 1,
0.7136978, 0.1193754, 1.947555, 0, 0, 0, 1, 1,
0.7146586, 0.1304781, 0.1282347, 0, 0, 0, 1, 1,
0.7181653, 0.5645112, 1.54893, 0, 0, 0, 1, 1,
0.7193103, 0.9708619, 0.5247416, 0, 0, 0, 1, 1,
0.7202789, -0.28049, 0.6659454, 0, 0, 0, 1, 1,
0.724256, -0.119502, 2.247828, 0, 0, 0, 1, 1,
0.7252219, -0.2810153, 1.70776, 1, 1, 1, 1, 1,
0.7268171, -0.9709821, 3.593927, 1, 1, 1, 1, 1,
0.7327852, 0.0383195, 1.964387, 1, 1, 1, 1, 1,
0.7362543, -0.9392675, 2.620371, 1, 1, 1, 1, 1,
0.741254, -0.2510139, 2.101034, 1, 1, 1, 1, 1,
0.7433074, 1.618567, 0.340954, 1, 1, 1, 1, 1,
0.7440147, 0.1629981, 1.670145, 1, 1, 1, 1, 1,
0.7492418, 0.09543041, 3.076498, 1, 1, 1, 1, 1,
0.7513339, 0.001149517, 1.923673, 1, 1, 1, 1, 1,
0.7523528, -0.009937568, 2.540632, 1, 1, 1, 1, 1,
0.7554568, 1.016085, 0.05542599, 1, 1, 1, 1, 1,
0.7560952, -0.4342744, 3.073956, 1, 1, 1, 1, 1,
0.759461, -2.316908, 2.646212, 1, 1, 1, 1, 1,
0.760513, 0.452429, -0.2245049, 1, 1, 1, 1, 1,
0.761401, 0.143063, 2.786421, 1, 1, 1, 1, 1,
0.7690405, 0.4466501, 1.09662, 0, 0, 1, 1, 1,
0.769139, 0.06129872, 2.26753, 1, 0, 0, 1, 1,
0.7703115, 0.458867, -0.4530751, 1, 0, 0, 1, 1,
0.7717599, -2.023771, 3.552909, 1, 0, 0, 1, 1,
0.7737862, 0.8228818, -0.4776822, 1, 0, 0, 1, 1,
0.7760745, -1.126279, 3.386543, 1, 0, 0, 1, 1,
0.7766019, -0.1910764, -0.102432, 0, 0, 0, 1, 1,
0.7791318, -0.1390468, 1.614428, 0, 0, 0, 1, 1,
0.7860161, 0.03844202, 1.620247, 0, 0, 0, 1, 1,
0.7968348, -1.70486, 3.177799, 0, 0, 0, 1, 1,
0.8031247, 0.5960591, 1.138133, 0, 0, 0, 1, 1,
0.805966, 0.1542137, 1.311424, 0, 0, 0, 1, 1,
0.8077561, -0.223131, 3.144655, 0, 0, 0, 1, 1,
0.8088916, 1.277387, 1.915228, 1, 1, 1, 1, 1,
0.8103896, 0.7723966, -0.4279549, 1, 1, 1, 1, 1,
0.8135878, 0.4684977, 3.027811, 1, 1, 1, 1, 1,
0.8157055, 0.4477099, 0.3304518, 1, 1, 1, 1, 1,
0.8173255, 0.3398882, 0.6049803, 1, 1, 1, 1, 1,
0.8193257, -0.1507753, 1.139139, 1, 1, 1, 1, 1,
0.8283967, -2.153036, 1.811931, 1, 1, 1, 1, 1,
0.8305231, -0.1952698, 2.554543, 1, 1, 1, 1, 1,
0.8414693, 0.7823689, 2.066217, 1, 1, 1, 1, 1,
0.8501279, -0.0494473, 1.510003, 1, 1, 1, 1, 1,
0.8504809, 0.8582509, 0.420409, 1, 1, 1, 1, 1,
0.8788429, 1.564864, 0.5886117, 1, 1, 1, 1, 1,
0.885774, 1.05479, 0.6266094, 1, 1, 1, 1, 1,
0.8922641, 0.6697129, 1.083627, 1, 1, 1, 1, 1,
0.8936791, -1.269451, 0.4958708, 1, 1, 1, 1, 1,
0.896279, 0.03831758, 2.151779, 0, 0, 1, 1, 1,
0.9012442, -0.208037, 2.047561, 1, 0, 0, 1, 1,
0.9067616, 1.313134, 0.7811346, 1, 0, 0, 1, 1,
0.9073088, -1.45968, 1.322442, 1, 0, 0, 1, 1,
0.9095395, 0.2124188, 1.55137, 1, 0, 0, 1, 1,
0.9128857, 0.8474152, 0.7344913, 1, 0, 0, 1, 1,
0.9193366, 1.678519, 0.4634587, 0, 0, 0, 1, 1,
0.9196326, -0.7136289, 2.237669, 0, 0, 0, 1, 1,
0.9230109, -0.06210859, 1.587826, 0, 0, 0, 1, 1,
0.9244338, 0.6994138, 0.4103287, 0, 0, 0, 1, 1,
0.9293806, 0.9110853, -0.1091933, 0, 0, 0, 1, 1,
0.9375756, 0.2898262, 0.5428955, 0, 0, 0, 1, 1,
0.9432882, 0.3266644, 1.637047, 0, 0, 0, 1, 1,
0.9445981, 0.08116706, -0.3498179, 1, 1, 1, 1, 1,
0.9480194, -0.4775922, 2.090251, 1, 1, 1, 1, 1,
0.9483334, -0.3922336, 1.18319, 1, 1, 1, 1, 1,
0.9499737, -0.307036, 3.104292, 1, 1, 1, 1, 1,
0.9524031, -0.4587518, 1.01244, 1, 1, 1, 1, 1,
0.9602228, -0.1091381, 1.502392, 1, 1, 1, 1, 1,
0.963186, -0.1932168, 3.933821, 1, 1, 1, 1, 1,
0.9674261, -0.1090088, 1.085904, 1, 1, 1, 1, 1,
0.9740762, -0.7559488, 0.7513103, 1, 1, 1, 1, 1,
0.990384, -0.5881342, 1.591189, 1, 1, 1, 1, 1,
0.9934767, 0.1871475, 1.146198, 1, 1, 1, 1, 1,
0.9975608, 0.8587857, 1.117659, 1, 1, 1, 1, 1,
1.001373, -1.118782, 2.282679, 1, 1, 1, 1, 1,
1.002859, -1.504995, 3.42148, 1, 1, 1, 1, 1,
1.003268, 0.08240501, 0.5459152, 1, 1, 1, 1, 1,
1.006349, -1.429581, 1.411582, 0, 0, 1, 1, 1,
1.008166, 1.086295, 0.1989827, 1, 0, 0, 1, 1,
1.010892, -0.8646857, 2.996756, 1, 0, 0, 1, 1,
1.023468, 0.5195231, -0.3176198, 1, 0, 0, 1, 1,
1.024818, 1.911317, 0.3651657, 1, 0, 0, 1, 1,
1.030265, 1.573831, 1.977037, 1, 0, 0, 1, 1,
1.032245, -1.22049, 2.377754, 0, 0, 0, 1, 1,
1.032285, -1.03752, 1.897504, 0, 0, 0, 1, 1,
1.032583, -0.9507215, 3.111859, 0, 0, 0, 1, 1,
1.042276, 1.927099, 1.257145, 0, 0, 0, 1, 1,
1.042912, -1.084905, 3.05155, 0, 0, 0, 1, 1,
1.045815, -0.5328625, 2.071355, 0, 0, 0, 1, 1,
1.047631, 0.9906657, 0.335068, 0, 0, 0, 1, 1,
1.057678, 0.6855224, 0.2779642, 1, 1, 1, 1, 1,
1.065261, -0.05785194, 2.391628, 1, 1, 1, 1, 1,
1.067474, 0.5233676, 1.123986, 1, 1, 1, 1, 1,
1.069663, 0.0563888, 0.2100276, 1, 1, 1, 1, 1,
1.086593, -1.897181, 3.668139, 1, 1, 1, 1, 1,
1.094305, -1.662844, 1.89017, 1, 1, 1, 1, 1,
1.094987, -0.2324786, 0.8184848, 1, 1, 1, 1, 1,
1.096436, -0.6481324, 3.279033, 1, 1, 1, 1, 1,
1.101761, -0.4850001, 3.527767, 1, 1, 1, 1, 1,
1.102276, 0.07511323, 1.178722, 1, 1, 1, 1, 1,
1.119482, -0.7961012, 1.93654, 1, 1, 1, 1, 1,
1.121116, -0.8640053, 2.040196, 1, 1, 1, 1, 1,
1.122288, 1.240357, -0.9343964, 1, 1, 1, 1, 1,
1.126323, -0.8679005, 1.579353, 1, 1, 1, 1, 1,
1.132812, 1.357052, 0.9185587, 1, 1, 1, 1, 1,
1.137491, -0.3253911, 1.818251, 0, 0, 1, 1, 1,
1.142179, -2.251471, 3.2223, 1, 0, 0, 1, 1,
1.15563, 0.8693959, 0.6821091, 1, 0, 0, 1, 1,
1.16048, 0.4784925, -0.6921244, 1, 0, 0, 1, 1,
1.16392, 1.148328, 1.184508, 1, 0, 0, 1, 1,
1.168914, 1.096427, -0.1034602, 1, 0, 0, 1, 1,
1.187919, 1.414068, 0.7671866, 0, 0, 0, 1, 1,
1.196061, 0.590405, 0.4258539, 0, 0, 0, 1, 1,
1.196376, -1.146079, 0.353366, 0, 0, 0, 1, 1,
1.203682, -1.396918, 4.190153, 0, 0, 0, 1, 1,
1.209024, -1.333824, 2.299278, 0, 0, 0, 1, 1,
1.210567, 0.4817893, 2.007717, 0, 0, 0, 1, 1,
1.212566, 0.08140285, 0.3353961, 0, 0, 0, 1, 1,
1.233971, 0.06289587, 2.387105, 1, 1, 1, 1, 1,
1.236621, -1.516745, 2.428178, 1, 1, 1, 1, 1,
1.237888, 0.16813, 0.5712982, 1, 1, 1, 1, 1,
1.245813, 0.4031477, 0.4542506, 1, 1, 1, 1, 1,
1.253181, -0.8811001, 0.7056175, 1, 1, 1, 1, 1,
1.262435, -1.086595, 3.818508, 1, 1, 1, 1, 1,
1.262606, -0.6845395, 2.840368, 1, 1, 1, 1, 1,
1.272, 0.8125543, -0.6260796, 1, 1, 1, 1, 1,
1.275179, 0.6120397, 0.1887579, 1, 1, 1, 1, 1,
1.277856, 0.01098201, 1.197044, 1, 1, 1, 1, 1,
1.288886, 0.2574415, 2.275957, 1, 1, 1, 1, 1,
1.29225, -0.4987952, 1.331342, 1, 1, 1, 1, 1,
1.298546, -0.459008, 2.704931, 1, 1, 1, 1, 1,
1.299306, -0.5766957, 1.765343, 1, 1, 1, 1, 1,
1.304158, -1.378352, 2.809609, 1, 1, 1, 1, 1,
1.315854, -1.410845, 2.801915, 0, 0, 1, 1, 1,
1.318158, -0.1801467, -1.022638, 1, 0, 0, 1, 1,
1.318383, -0.2941882, 2.14464, 1, 0, 0, 1, 1,
1.318975, -0.3589997, 1.784837, 1, 0, 0, 1, 1,
1.33349, 0.5202912, 1.579845, 1, 0, 0, 1, 1,
1.338422, 0.3875223, 2.183442, 1, 0, 0, 1, 1,
1.339839, -2.339731, 2.457812, 0, 0, 0, 1, 1,
1.342418, 2.827536, 2.140203, 0, 0, 0, 1, 1,
1.350379, -1.217182, 2.594287, 0, 0, 0, 1, 1,
1.357788, 0.6439288, -0.7372159, 0, 0, 0, 1, 1,
1.361505, 0.5068996, 1.57979, 0, 0, 0, 1, 1,
1.36578, 1.804086, -0.5267736, 0, 0, 0, 1, 1,
1.365944, -0.9669864, 3.134639, 0, 0, 0, 1, 1,
1.3697, 2.074534, 1.392453, 1, 1, 1, 1, 1,
1.379019, -0.6551111, 1.201806, 1, 1, 1, 1, 1,
1.400356, -0.8622486, 2.100042, 1, 1, 1, 1, 1,
1.404072, -2.028488, 2.806622, 1, 1, 1, 1, 1,
1.405387, -1.529022, -0.02085192, 1, 1, 1, 1, 1,
1.406651, 1.077362, 1.66114, 1, 1, 1, 1, 1,
1.407247, 1.196824, 1.162906, 1, 1, 1, 1, 1,
1.410357, 2.028044, 0.9379743, 1, 1, 1, 1, 1,
1.419678, -0.4338654, 2.039302, 1, 1, 1, 1, 1,
1.422759, 0.4181168, 0.4514456, 1, 1, 1, 1, 1,
1.426029, 0.4551365, 1.914031, 1, 1, 1, 1, 1,
1.427072, -0.8861717, 2.726923, 1, 1, 1, 1, 1,
1.429871, -0.1500054, 2.648139, 1, 1, 1, 1, 1,
1.44125, 1.52241, 1.036344, 1, 1, 1, 1, 1,
1.450993, 1.184594, 1.779261, 1, 1, 1, 1, 1,
1.452886, -0.5391726, 1.188532, 0, 0, 1, 1, 1,
1.45716, -0.3907427, 2.49955, 1, 0, 0, 1, 1,
1.461849, 1.680957, -0.1980565, 1, 0, 0, 1, 1,
1.466782, -0.09113251, 1.306817, 1, 0, 0, 1, 1,
1.472818, -0.8556309, -0.1321401, 1, 0, 0, 1, 1,
1.473766, -1.297558, 1.654088, 1, 0, 0, 1, 1,
1.47685, 0.3926771, 0.9393726, 0, 0, 0, 1, 1,
1.479993, 1.037551, 1.452207, 0, 0, 0, 1, 1,
1.48011, -1.49403, 1.79584, 0, 0, 0, 1, 1,
1.484378, 0.602877, 1.908715, 0, 0, 0, 1, 1,
1.486738, -1.196876, 3.127213, 0, 0, 0, 1, 1,
1.490755, 0.5011188, 0.9523467, 0, 0, 0, 1, 1,
1.507868, -0.6515959, 1.617717, 0, 0, 0, 1, 1,
1.508606, -2.387188, 3.368166, 1, 1, 1, 1, 1,
1.51754, 0.4806325, 1.88662, 1, 1, 1, 1, 1,
1.520266, -0.4839581, 1.505621, 1, 1, 1, 1, 1,
1.52776, -0.01184849, 1.768293, 1, 1, 1, 1, 1,
1.53709, 1.297659, -0.5097401, 1, 1, 1, 1, 1,
1.546783, -1.359256, 3.157676, 1, 1, 1, 1, 1,
1.557788, 0.1478591, 0.779072, 1, 1, 1, 1, 1,
1.594635, -0.5089335, 2.401862, 1, 1, 1, 1, 1,
1.595128, 0.2204319, -0.5657913, 1, 1, 1, 1, 1,
1.596701, -0.9624349, 2.28093, 1, 1, 1, 1, 1,
1.625686, -0.707656, 0.8433524, 1, 1, 1, 1, 1,
1.635605, -1.622168, 2.257858, 1, 1, 1, 1, 1,
1.639632, 1.970094, 0.09880655, 1, 1, 1, 1, 1,
1.642178, 0.2929159, 1.251006, 1, 1, 1, 1, 1,
1.644239, -1.447, 3.049757, 1, 1, 1, 1, 1,
1.644387, -1.578203, 2.141248, 0, 0, 1, 1, 1,
1.659651, 0.9819889, 3.189685, 1, 0, 0, 1, 1,
1.659778, -1.017508, 2.767167, 1, 0, 0, 1, 1,
1.661731, -0.3798063, -0.9104378, 1, 0, 0, 1, 1,
1.669104, -0.8781691, 2.502774, 1, 0, 0, 1, 1,
1.670815, 0.4123614, 0.1141523, 1, 0, 0, 1, 1,
1.676372, -0.2554499, 0.3742394, 0, 0, 0, 1, 1,
1.67644, 1.120289, 2.661464, 0, 0, 0, 1, 1,
1.676931, -0.6035044, 3.853967, 0, 0, 0, 1, 1,
1.68189, 0.4613736, 1.309422, 0, 0, 0, 1, 1,
1.68506, 1.683453, -0.1799321, 0, 0, 0, 1, 1,
1.687063, 0.1480408, 0.6961251, 0, 0, 0, 1, 1,
1.690852, -0.7310972, 2.58102, 0, 0, 0, 1, 1,
1.698324, -1.317297, 3.38457, 1, 1, 1, 1, 1,
1.711303, 1.226504, 1.753649, 1, 1, 1, 1, 1,
1.723464, 0.3401722, 1.914683, 1, 1, 1, 1, 1,
1.738212, 0.1640307, 2.397357, 1, 1, 1, 1, 1,
1.763638, 1.137755, 1.957387, 1, 1, 1, 1, 1,
1.764028, -0.03898053, 1.779233, 1, 1, 1, 1, 1,
1.769169, -1.324169, 2.699978, 1, 1, 1, 1, 1,
1.769225, 0.2937703, 2.488913, 1, 1, 1, 1, 1,
1.772478, 0.4278811, 1.522667, 1, 1, 1, 1, 1,
1.783923, 0.1698164, -0.5327926, 1, 1, 1, 1, 1,
1.797157, -0.8777868, 1.48007, 1, 1, 1, 1, 1,
1.893709, -1.059256, 0.6645678, 1, 1, 1, 1, 1,
1.922531, -0.2327132, 1.347302, 1, 1, 1, 1, 1,
1.927472, -1.017942, 2.252158, 1, 1, 1, 1, 1,
1.944242, -0.2785278, 1.309717, 1, 1, 1, 1, 1,
1.959557, 0.01089594, 1.665793, 0, 0, 1, 1, 1,
1.966416, -1.047425, 1.813718, 1, 0, 0, 1, 1,
1.969555, -1.378219, 2.343543, 1, 0, 0, 1, 1,
2.049067, 0.4912677, 3.581645, 1, 0, 0, 1, 1,
2.072077, 0.5745836, 0.8355504, 1, 0, 0, 1, 1,
2.090789, -1.23739, 1.579983, 1, 0, 0, 1, 1,
2.127023, 1.613846, -1.289338, 0, 0, 0, 1, 1,
2.179292, 0.01032106, -0.06572213, 0, 0, 0, 1, 1,
2.185872, -1.046926, 0.5323668, 0, 0, 0, 1, 1,
2.205681, -0.5947077, 1.354502, 0, 0, 0, 1, 1,
2.269521, -0.9445639, 1.211723, 0, 0, 0, 1, 1,
2.299734, 1.468242, 0.9785852, 0, 0, 0, 1, 1,
2.319496, -0.06155999, 3.246905, 0, 0, 0, 1, 1,
2.353211, -0.1981102, -1.813146, 1, 1, 1, 1, 1,
2.423143, -0.7360517, 0.2379121, 1, 1, 1, 1, 1,
2.533053, 0.4391388, 0.9117338, 1, 1, 1, 1, 1,
2.620228, 1.750743, 0.6462728, 1, 1, 1, 1, 1,
2.940313, -1.842921, 2.490258, 1, 1, 1, 1, 1,
3.096824, -0.2731197, 1.769674, 1, 1, 1, 1, 1,
3.315295, -0.7482812, 2.267705, 1, 1, 1, 1, 1
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
var radius = 9.441676;
var distance = 33.16349;
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
mvMatrix.translate( -0.07272053, 0.2928866, 0.6739702 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16349);
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
