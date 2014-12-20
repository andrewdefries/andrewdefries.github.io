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
-3.327022, -0.91082, -1.919906, 1, 0, 0, 1,
-2.792529, -0.6623345, -2.128839, 1, 0.007843138, 0, 1,
-2.768001, -0.5781975, -2.947378, 1, 0.01176471, 0, 1,
-2.75732, 0.4050066, -0.8843648, 1, 0.01960784, 0, 1,
-2.598816, -1.28475, -1.634885, 1, 0.02352941, 0, 1,
-2.593458, -0.2017516, -0.7378255, 1, 0.03137255, 0, 1,
-2.536097, 0.5783827, -0.9350235, 1, 0.03529412, 0, 1,
-2.453631, 0.6766702, -2.128075, 1, 0.04313726, 0, 1,
-2.449777, -0.9036888, -2.671074, 1, 0.04705882, 0, 1,
-2.381125, 1.356425, -1.781283, 1, 0.05490196, 0, 1,
-2.341909, -0.2637022, -0.4263382, 1, 0.05882353, 0, 1,
-2.328798, -1.044243, -1.323712, 1, 0.06666667, 0, 1,
-2.256222, 0.2969419, -1.883601, 1, 0.07058824, 0, 1,
-2.237859, 0.6191603, -0.592852, 1, 0.07843138, 0, 1,
-2.231537, -1.369394, -1.048498, 1, 0.08235294, 0, 1,
-2.188601, -0.5714334, -0.8954776, 1, 0.09019608, 0, 1,
-2.177393, -1.331323, -0.7663862, 1, 0.09411765, 0, 1,
-2.163272, -1.051989, -0.3546434, 1, 0.1019608, 0, 1,
-2.141033, 0.04064277, -0.4806985, 1, 0.1098039, 0, 1,
-2.112451, 0.5536478, 0.2656767, 1, 0.1137255, 0, 1,
-2.090848, 1.469869, 1.128333, 1, 0.1215686, 0, 1,
-2.073589, -0.6099649, -0.7529644, 1, 0.1254902, 0, 1,
-2.050385, -2.500142, -4.324236, 1, 0.1333333, 0, 1,
-2.04753, 0.5665534, -2.607355, 1, 0.1372549, 0, 1,
-2.011072, 0.5788869, -0.1334123, 1, 0.145098, 0, 1,
-1.971913, -0.856397, -1.497291, 1, 0.1490196, 0, 1,
-1.905604, 1.049647, -1.013679, 1, 0.1568628, 0, 1,
-1.887591, 0.1333237, -3.273213, 1, 0.1607843, 0, 1,
-1.88466, -1.088438, -1.788665, 1, 0.1686275, 0, 1,
-1.87319, 0.8738571, -1.676031, 1, 0.172549, 0, 1,
-1.872901, -0.3007501, -0.3309575, 1, 0.1803922, 0, 1,
-1.866609, 0.75786, -1.097735, 1, 0.1843137, 0, 1,
-1.856913, 2.191268, -0.2830549, 1, 0.1921569, 0, 1,
-1.847366, 1.207344, -1.366329, 1, 0.1960784, 0, 1,
-1.843202, 0.7189685, -0.2481357, 1, 0.2039216, 0, 1,
-1.818174, -0.3127617, -2.454225, 1, 0.2117647, 0, 1,
-1.803994, -0.7092583, -2.521067, 1, 0.2156863, 0, 1,
-1.786834, 0.1693685, -0.5463138, 1, 0.2235294, 0, 1,
-1.777219, 2.090253, -0.6281605, 1, 0.227451, 0, 1,
-1.776693, -0.08056705, -2.205733, 1, 0.2352941, 0, 1,
-1.771655, 1.844611, -0.7233758, 1, 0.2392157, 0, 1,
-1.763067, -0.4813281, -2.421482, 1, 0.2470588, 0, 1,
-1.757423, -1.596309, -3.142852, 1, 0.2509804, 0, 1,
-1.726733, -1.011868, -2.704807, 1, 0.2588235, 0, 1,
-1.685842, -0.8172947, -2.419731, 1, 0.2627451, 0, 1,
-1.68571, -0.1476598, -1.548379, 1, 0.2705882, 0, 1,
-1.681548, 0.8952352, -0.5635638, 1, 0.2745098, 0, 1,
-1.65789, -0.03526337, -3.148549, 1, 0.282353, 0, 1,
-1.647488, 1.308673, -2.236369, 1, 0.2862745, 0, 1,
-1.646842, -0.7829872, -3.116476, 1, 0.2941177, 0, 1,
-1.643606, -0.7592678, -1.547178, 1, 0.3019608, 0, 1,
-1.631012, -0.9586862, -0.4110235, 1, 0.3058824, 0, 1,
-1.623836, 2.18444, -1.992889, 1, 0.3137255, 0, 1,
-1.613068, 0.3850955, -2.54565, 1, 0.3176471, 0, 1,
-1.60113, 0.7961718, -1.77135, 1, 0.3254902, 0, 1,
-1.600836, -0.8757048, -4.528878, 1, 0.3294118, 0, 1,
-1.584908, 0.1795031, -1.710335, 1, 0.3372549, 0, 1,
-1.532762, -0.5149137, -1.128623, 1, 0.3411765, 0, 1,
-1.524438, -1.202544, -1.218916, 1, 0.3490196, 0, 1,
-1.517271, -0.9484718, -2.066861, 1, 0.3529412, 0, 1,
-1.512017, 0.2706776, -2.363465, 1, 0.3607843, 0, 1,
-1.511712, 0.3007044, -1.768555, 1, 0.3647059, 0, 1,
-1.504894, -0.2617144, -0.08285232, 1, 0.372549, 0, 1,
-1.498635, 0.3747527, -2.366659, 1, 0.3764706, 0, 1,
-1.481513, 0.7727858, -3.507491, 1, 0.3843137, 0, 1,
-1.477573, -0.386294, -2.159824, 1, 0.3882353, 0, 1,
-1.475613, 1.539875, -0.4659236, 1, 0.3960784, 0, 1,
-1.475028, -0.5019885, -2.230966, 1, 0.4039216, 0, 1,
-1.473846, 1.322093, -0.8212453, 1, 0.4078431, 0, 1,
-1.471705, 0.7320325, -2.031612, 1, 0.4156863, 0, 1,
-1.45961, 0.3453779, -2.750463, 1, 0.4196078, 0, 1,
-1.459561, 0.1073888, -0.06958917, 1, 0.427451, 0, 1,
-1.455939, 0.3860625, -1.634712, 1, 0.4313726, 0, 1,
-1.436305, -1.228122, -2.709509, 1, 0.4392157, 0, 1,
-1.412523, -0.08252261, -2.833293, 1, 0.4431373, 0, 1,
-1.410113, -1.800164, -1.392411, 1, 0.4509804, 0, 1,
-1.39784, 0.281073, -1.697909, 1, 0.454902, 0, 1,
-1.38388, 0.2137994, -1.525996, 1, 0.4627451, 0, 1,
-1.381878, 0.7322655, -0.4838884, 1, 0.4666667, 0, 1,
-1.373352, 0.04857873, -0.4863558, 1, 0.4745098, 0, 1,
-1.364241, -1.246843, -1.842473, 1, 0.4784314, 0, 1,
-1.358054, -0.3097436, -0.5496835, 1, 0.4862745, 0, 1,
-1.357986, 1.212115, 0.5721386, 1, 0.4901961, 0, 1,
-1.350214, 1.357852, 0.1113017, 1, 0.4980392, 0, 1,
-1.347765, -1.632373, -2.379316, 1, 0.5058824, 0, 1,
-1.342551, -0.9355613, -0.9469923, 1, 0.509804, 0, 1,
-1.340198, -0.02465997, -3.483913, 1, 0.5176471, 0, 1,
-1.340079, -0.2949836, -2.453268, 1, 0.5215687, 0, 1,
-1.337942, 1.372415, 0.8302047, 1, 0.5294118, 0, 1,
-1.337699, -0.5438179, -2.278161, 1, 0.5333334, 0, 1,
-1.33563, -0.7872663, -1.729461, 1, 0.5411765, 0, 1,
-1.33258, -0.2979967, -2.419063, 1, 0.5450981, 0, 1,
-1.316948, 0.3011886, 0.4915796, 1, 0.5529412, 0, 1,
-1.316666, 0.04477608, -0.2483184, 1, 0.5568628, 0, 1,
-1.31164, 0.2228555, -0.4702593, 1, 0.5647059, 0, 1,
-1.298061, 0.1083835, -0.6681991, 1, 0.5686275, 0, 1,
-1.296691, -0.5547036, -1.882697, 1, 0.5764706, 0, 1,
-1.276166, -0.590902, -1.388899, 1, 0.5803922, 0, 1,
-1.272859, 1.7123, 0.77431, 1, 0.5882353, 0, 1,
-1.265823, -0.8886499, -2.422621, 1, 0.5921569, 0, 1,
-1.262004, -1.022403, -2.268781, 1, 0.6, 0, 1,
-1.261332, -0.5306894, -2.028865, 1, 0.6078432, 0, 1,
-1.259441, 1.171038, -1.432898, 1, 0.6117647, 0, 1,
-1.258974, 0.3548203, -1.194559, 1, 0.6196079, 0, 1,
-1.258676, 0.2658126, -0.9755152, 1, 0.6235294, 0, 1,
-1.25079, 1.903647, -0.05993142, 1, 0.6313726, 0, 1,
-1.245821, -1.557977, -2.027977, 1, 0.6352941, 0, 1,
-1.242278, -0.7310535, -2.324406, 1, 0.6431373, 0, 1,
-1.240871, 0.8275922, -1.448529, 1, 0.6470588, 0, 1,
-1.236639, -0.9468992, -1.533704, 1, 0.654902, 0, 1,
-1.234195, 0.2725155, -1.299499, 1, 0.6588235, 0, 1,
-1.232891, -1.395648, -2.29767, 1, 0.6666667, 0, 1,
-1.224988, -1.290041, -2.675043, 1, 0.6705883, 0, 1,
-1.224726, 0.02930791, -0.5313187, 1, 0.6784314, 0, 1,
-1.219077, -0.1427185, -0.8271452, 1, 0.682353, 0, 1,
-1.219043, -0.3930071, -1.974269, 1, 0.6901961, 0, 1,
-1.209287, 0.6235562, -1.068593, 1, 0.6941177, 0, 1,
-1.208996, -0.01692706, -1.018314, 1, 0.7019608, 0, 1,
-1.190318, -1.26259, -3.133803, 1, 0.7098039, 0, 1,
-1.178571, -0.1351522, -1.526092, 1, 0.7137255, 0, 1,
-1.177186, -1.63647, -1.331824, 1, 0.7215686, 0, 1,
-1.175265, -0.6812986, -1.09278, 1, 0.7254902, 0, 1,
-1.162291, 0.1560567, -0.2793252, 1, 0.7333333, 0, 1,
-1.158092, 1.903058, 0.2466746, 1, 0.7372549, 0, 1,
-1.15, -0.8062701, -3.113866, 1, 0.7450981, 0, 1,
-1.14972, -0.6869954, -3.178464, 1, 0.7490196, 0, 1,
-1.143348, -0.8108189, -2.83022, 1, 0.7568628, 0, 1,
-1.138036, 0.1080932, -2.926381, 1, 0.7607843, 0, 1,
-1.138008, 0.3664995, 0.127543, 1, 0.7686275, 0, 1,
-1.134747, -0.7021651, -0.2096724, 1, 0.772549, 0, 1,
-1.1346, 1.11956, 0.4585617, 1, 0.7803922, 0, 1,
-1.127536, 0.4773849, -0.3186412, 1, 0.7843137, 0, 1,
-1.124212, -1.076316, -2.997464, 1, 0.7921569, 0, 1,
-1.12395, -0.5265808, -2.312121, 1, 0.7960784, 0, 1,
-1.122202, -0.5451179, -3.674134, 1, 0.8039216, 0, 1,
-1.113387, 0.827047, -2.232274, 1, 0.8117647, 0, 1,
-1.112428, -0.398256, -1.748487, 1, 0.8156863, 0, 1,
-1.107183, 0.07457323, -3.431823, 1, 0.8235294, 0, 1,
-1.099147, 0.912122, -2.275063, 1, 0.827451, 0, 1,
-1.09678, -0.6114844, -2.039483, 1, 0.8352941, 0, 1,
-1.079301, 1.097223, -0.8304819, 1, 0.8392157, 0, 1,
-1.076007, -0.09190336, -1.548834, 1, 0.8470588, 0, 1,
-1.075963, -0.9233117, -3.727738, 1, 0.8509804, 0, 1,
-1.070386, -1.144605, -2.061772, 1, 0.8588235, 0, 1,
-1.067543, 1.263505, -1.236505, 1, 0.8627451, 0, 1,
-1.066675, -0.004936422, -1.545193, 1, 0.8705882, 0, 1,
-1.064717, 0.1683814, -2.604455, 1, 0.8745098, 0, 1,
-1.055822, 1.169303, -0.08243104, 1, 0.8823529, 0, 1,
-1.054311, 1.209614, -0.8542523, 1, 0.8862745, 0, 1,
-1.051512, -2.310798, -2.139249, 1, 0.8941177, 0, 1,
-1.049742, -2.899009, -1.987844, 1, 0.8980392, 0, 1,
-1.048314, 1.120582, -2.108532, 1, 0.9058824, 0, 1,
-1.047118, 0.169402, -2.580252, 1, 0.9137255, 0, 1,
-1.044724, -0.8627842, -1.872903, 1, 0.9176471, 0, 1,
-1.044644, 1.280631, -0.3735094, 1, 0.9254902, 0, 1,
-1.043733, 0.3454521, -3.547659, 1, 0.9294118, 0, 1,
-1.034803, 0.4518416, -2.189239, 1, 0.9372549, 0, 1,
-1.034499, -0.6754187, -0.7467963, 1, 0.9411765, 0, 1,
-1.033365, -0.6309171, -3.995572, 1, 0.9490196, 0, 1,
-1.024854, -0.4647936, -1.121783, 1, 0.9529412, 0, 1,
-1.023428, -0.02036014, -0.01266015, 1, 0.9607843, 0, 1,
-1.016301, -0.3311921, -2.380542, 1, 0.9647059, 0, 1,
-1.015248, -0.1670039, -1.737704, 1, 0.972549, 0, 1,
-1.003461, 0.6473145, -1.139296, 1, 0.9764706, 0, 1,
-0.9983673, -0.04018731, -1.261243, 1, 0.9843137, 0, 1,
-0.9939924, -0.4085038, -1.295562, 1, 0.9882353, 0, 1,
-0.9861308, 0.2678499, -0.5055213, 1, 0.9960784, 0, 1,
-0.9765784, 0.7174518, 0.8487824, 0.9960784, 1, 0, 1,
-0.9745685, -0.5476022, -1.228434, 0.9921569, 1, 0, 1,
-0.9664746, -1.553595, -0.3505472, 0.9843137, 1, 0, 1,
-0.9638877, 1.682364, -0.2473482, 0.9803922, 1, 0, 1,
-0.9608641, 0.8964498, -0.8753936, 0.972549, 1, 0, 1,
-0.9590733, -0.8559369, -1.662662, 0.9686275, 1, 0, 1,
-0.955648, -1.648696, -2.142267, 0.9607843, 1, 0, 1,
-0.9476945, 0.01715362, -1.809981, 0.9568627, 1, 0, 1,
-0.9447381, 1.651467, 1.922173, 0.9490196, 1, 0, 1,
-0.9410176, 0.774874, -2.056953, 0.945098, 1, 0, 1,
-0.9395608, 1.269235, -1.76322, 0.9372549, 1, 0, 1,
-0.9344567, -0.3814451, -2.004991, 0.9333333, 1, 0, 1,
-0.9340723, -0.8745247, -2.120978, 0.9254902, 1, 0, 1,
-0.934031, -0.4230343, -2.293012, 0.9215686, 1, 0, 1,
-0.9327565, -0.7198516, -1.383167, 0.9137255, 1, 0, 1,
-0.9320304, -1.106851, 0.3151421, 0.9098039, 1, 0, 1,
-0.9273964, -1.006966, -2.268328, 0.9019608, 1, 0, 1,
-0.9245209, -0.3236953, -2.864023, 0.8941177, 1, 0, 1,
-0.9225979, 1.194197, -0.4557596, 0.8901961, 1, 0, 1,
-0.9204249, -1.350052, -2.530301, 0.8823529, 1, 0, 1,
-0.917052, -0.9151294, -3.351177, 0.8784314, 1, 0, 1,
-0.901187, 0.5403717, -0.8167046, 0.8705882, 1, 0, 1,
-0.8880316, 2.333128, -1.53664, 0.8666667, 1, 0, 1,
-0.8877383, -0.9687066, -0.8627641, 0.8588235, 1, 0, 1,
-0.884266, 0.2838962, -1.262377, 0.854902, 1, 0, 1,
-0.8836419, -0.9913294, -1.82211, 0.8470588, 1, 0, 1,
-0.8796253, 0.2791904, -0.1847209, 0.8431373, 1, 0, 1,
-0.8793305, -0.6620085, -1.754313, 0.8352941, 1, 0, 1,
-0.8789953, -0.1372918, -2.731687, 0.8313726, 1, 0, 1,
-0.8749413, -0.4861174, -3.460938, 0.8235294, 1, 0, 1,
-0.8731873, 0.6784282, -0.6342857, 0.8196079, 1, 0, 1,
-0.8617901, 0.8231255, -2.13692, 0.8117647, 1, 0, 1,
-0.8585672, 0.5291743, -1.334468, 0.8078431, 1, 0, 1,
-0.847949, -0.03366244, -0.6185763, 0.8, 1, 0, 1,
-0.8393667, 1.14238, 0.6645204, 0.7921569, 1, 0, 1,
-0.8388785, 1.042106, -0.1085194, 0.7882353, 1, 0, 1,
-0.8386401, -0.2342818, -1.136762, 0.7803922, 1, 0, 1,
-0.8367317, -0.1135442, -2.370779, 0.7764706, 1, 0, 1,
-0.8359237, -0.6712312, -1.695256, 0.7686275, 1, 0, 1,
-0.8347195, -1.558389, -0.6044086, 0.7647059, 1, 0, 1,
-0.8340549, -0.6006192, -1.662738, 0.7568628, 1, 0, 1,
-0.8339549, 0.4068527, -1.542832, 0.7529412, 1, 0, 1,
-0.8298321, 1.300025, -0.3684346, 0.7450981, 1, 0, 1,
-0.8235571, 0.4837195, -1.83489, 0.7411765, 1, 0, 1,
-0.8216837, 1.168893, -1.626305, 0.7333333, 1, 0, 1,
-0.8189623, 0.2951854, 0.09589469, 0.7294118, 1, 0, 1,
-0.8027411, 0.4436941, -0.983065, 0.7215686, 1, 0, 1,
-0.8011128, 0.4151637, -0.1316491, 0.7176471, 1, 0, 1,
-0.7999621, -0.1868661, -1.956854, 0.7098039, 1, 0, 1,
-0.7970286, 2.589272, -1.165954, 0.7058824, 1, 0, 1,
-0.7952938, 0.0007638271, -1.456254, 0.6980392, 1, 0, 1,
-0.7801402, 1.844748, -0.1404377, 0.6901961, 1, 0, 1,
-0.7790467, 0.7184856, -1.696277, 0.6862745, 1, 0, 1,
-0.7746696, 1.507974, -0.356223, 0.6784314, 1, 0, 1,
-0.7723534, 0.3986068, -0.9707884, 0.6745098, 1, 0, 1,
-0.7659479, 2.341356, -0.8147423, 0.6666667, 1, 0, 1,
-0.7641284, 0.3395115, -0.8756144, 0.6627451, 1, 0, 1,
-0.7569073, -1.659448, 0.02510525, 0.654902, 1, 0, 1,
-0.7533683, -1.600621, -3.280619, 0.6509804, 1, 0, 1,
-0.7446439, 1.206153, 0.3157028, 0.6431373, 1, 0, 1,
-0.741017, 1.205456, -0.451737, 0.6392157, 1, 0, 1,
-0.7377664, 0.5262206, -0.6026233, 0.6313726, 1, 0, 1,
-0.7356673, -0.3939581, -2.7075, 0.627451, 1, 0, 1,
-0.7324801, 1.107452, -0.1208673, 0.6196079, 1, 0, 1,
-0.7263649, 0.3897498, -0.3960427, 0.6156863, 1, 0, 1,
-0.7257956, 0.8326949, -0.4826847, 0.6078432, 1, 0, 1,
-0.7208103, -0.04000834, -1.455356, 0.6039216, 1, 0, 1,
-0.7204534, -0.2653387, -0.0606561, 0.5960785, 1, 0, 1,
-0.717798, 0.7166913, 0.3851384, 0.5882353, 1, 0, 1,
-0.7114596, -1.751854, -3.44904, 0.5843138, 1, 0, 1,
-0.7110389, -1.150783, -2.387694, 0.5764706, 1, 0, 1,
-0.7087968, -0.9359071, -2.921091, 0.572549, 1, 0, 1,
-0.6986855, 0.03329858, -3.231571, 0.5647059, 1, 0, 1,
-0.6967977, -0.2717104, -1.381818, 0.5607843, 1, 0, 1,
-0.6926693, 0.395366, -1.515295, 0.5529412, 1, 0, 1,
-0.6915823, 0.1902634, -1.46246, 0.5490196, 1, 0, 1,
-0.6774142, -0.216247, 0.08149984, 0.5411765, 1, 0, 1,
-0.6757619, -0.5153143, -2.018496, 0.5372549, 1, 0, 1,
-0.675312, 0.2513104, 0.2237964, 0.5294118, 1, 0, 1,
-0.6745393, 0.5279475, -0.9659951, 0.5254902, 1, 0, 1,
-0.6645741, 0.3685268, -1.880117, 0.5176471, 1, 0, 1,
-0.6637719, -0.547545, -2.026754, 0.5137255, 1, 0, 1,
-0.6594359, 0.6214803, -0.9381328, 0.5058824, 1, 0, 1,
-0.6576106, 0.8402877, 1.192251, 0.5019608, 1, 0, 1,
-0.6572618, -0.498233, -2.317763, 0.4941176, 1, 0, 1,
-0.6524302, 1.306431, 0.1016498, 0.4862745, 1, 0, 1,
-0.6520475, -1.088232, -3.677721, 0.4823529, 1, 0, 1,
-0.6374164, 0.1926618, -1.176189, 0.4745098, 1, 0, 1,
-0.6311314, 0.3659947, -0.3515058, 0.4705882, 1, 0, 1,
-0.6188235, 0.6667987, -1.146499, 0.4627451, 1, 0, 1,
-0.6128474, 0.8194663, -0.9337083, 0.4588235, 1, 0, 1,
-0.5997438, -0.3872466, -1.456361, 0.4509804, 1, 0, 1,
-0.5987003, -0.3979038, -1.084551, 0.4470588, 1, 0, 1,
-0.5961805, -0.3974331, -3.063705, 0.4392157, 1, 0, 1,
-0.5958176, -0.03521538, -2.915035, 0.4352941, 1, 0, 1,
-0.5943734, -1.054491, -3.042308, 0.427451, 1, 0, 1,
-0.5921982, -0.8665211, -2.987262, 0.4235294, 1, 0, 1,
-0.5888552, -0.1706989, -2.721495, 0.4156863, 1, 0, 1,
-0.5883123, 0.1117221, -0.9444883, 0.4117647, 1, 0, 1,
-0.5847116, -1.392955, -1.699216, 0.4039216, 1, 0, 1,
-0.5787787, 1.208572, -1.646918, 0.3960784, 1, 0, 1,
-0.5772868, -0.4419961, -0.3844026, 0.3921569, 1, 0, 1,
-0.5733722, 0.08098014, -2.541167, 0.3843137, 1, 0, 1,
-0.5693665, -1.032195, -2.648357, 0.3803922, 1, 0, 1,
-0.5686906, 1.57719, 1.446632, 0.372549, 1, 0, 1,
-0.5642319, 0.5619838, 0.9951426, 0.3686275, 1, 0, 1,
-0.5616181, 0.3917123, -1.298468, 0.3607843, 1, 0, 1,
-0.559262, -1.883025, -2.578282, 0.3568628, 1, 0, 1,
-0.5560233, -0.7963555, -1.456769, 0.3490196, 1, 0, 1,
-0.5552978, -1.217564, -2.765394, 0.345098, 1, 0, 1,
-0.5417436, 0.439554, -0.8310249, 0.3372549, 1, 0, 1,
-0.5365174, 0.1804358, -1.962263, 0.3333333, 1, 0, 1,
-0.5306084, -0.366401, -2.659, 0.3254902, 1, 0, 1,
-0.5293293, -0.5118224, -2.847264, 0.3215686, 1, 0, 1,
-0.5287647, 0.9807018, 0.3845462, 0.3137255, 1, 0, 1,
-0.5205178, -0.9346378, -1.924742, 0.3098039, 1, 0, 1,
-0.5179888, -0.9516948, -3.964124, 0.3019608, 1, 0, 1,
-0.5177189, 1.171389, -1.012285, 0.2941177, 1, 0, 1,
-0.5131238, 0.5896924, -1.651863, 0.2901961, 1, 0, 1,
-0.5095153, -0.7314662, -1.389343, 0.282353, 1, 0, 1,
-0.4935546, 0.9753772, 0.4903356, 0.2784314, 1, 0, 1,
-0.4903295, -0.6724701, -3.191841, 0.2705882, 1, 0, 1,
-0.4901525, 0.1667324, -3.799757, 0.2666667, 1, 0, 1,
-0.4894618, 0.03988975, -1.066143, 0.2588235, 1, 0, 1,
-0.4885558, -1.12578, -2.645582, 0.254902, 1, 0, 1,
-0.4866517, 1.740904, -0.3002389, 0.2470588, 1, 0, 1,
-0.4856484, 0.3803777, -1.447804, 0.2431373, 1, 0, 1,
-0.4849174, 1.047852, 0.601923, 0.2352941, 1, 0, 1,
-0.482571, 1.875581, -0.7043614, 0.2313726, 1, 0, 1,
-0.4812252, -0.4226339, -1.186752, 0.2235294, 1, 0, 1,
-0.4803624, -1.430345, -3.725605, 0.2196078, 1, 0, 1,
-0.4798719, -0.341416, -1.044556, 0.2117647, 1, 0, 1,
-0.4797512, -1.046601, -1.79354, 0.2078431, 1, 0, 1,
-0.4789187, 0.6533432, 0.0644066, 0.2, 1, 0, 1,
-0.4787569, 1.259, -0.7233717, 0.1921569, 1, 0, 1,
-0.4714649, 1.558091, 0.7000312, 0.1882353, 1, 0, 1,
-0.4698525, -2.057482, -3.198436, 0.1803922, 1, 0, 1,
-0.4667578, -1.169801, -2.423162, 0.1764706, 1, 0, 1,
-0.4633273, 2.083954, -1.53335, 0.1686275, 1, 0, 1,
-0.4632877, 0.8186278, -1.930282, 0.1647059, 1, 0, 1,
-0.4615914, 0.08040031, -2.534905, 0.1568628, 1, 0, 1,
-0.4605257, -0.4463652, -1.664121, 0.1529412, 1, 0, 1,
-0.4575939, -1.66963, -4.069851, 0.145098, 1, 0, 1,
-0.4478718, -1.341866, -2.316918, 0.1411765, 1, 0, 1,
-0.4458705, 1.195289, -1.084326, 0.1333333, 1, 0, 1,
-0.4455424, 0.6700094, -2.478606, 0.1294118, 1, 0, 1,
-0.4425856, -1.125216, -2.990384, 0.1215686, 1, 0, 1,
-0.4359699, -0.9693912, -2.9956, 0.1176471, 1, 0, 1,
-0.4324868, 0.1398111, 0.02575041, 0.1098039, 1, 0, 1,
-0.4313054, -0.1969956, -1.354942, 0.1058824, 1, 0, 1,
-0.4251255, 1.216056, -0.5746594, 0.09803922, 1, 0, 1,
-0.424918, 0.4431175, -0.9045117, 0.09019608, 1, 0, 1,
-0.4237352, 0.362541, -0.3009962, 0.08627451, 1, 0, 1,
-0.4181423, -0.1499346, -0.5470623, 0.07843138, 1, 0, 1,
-0.4141093, -0.443997, -2.856915, 0.07450981, 1, 0, 1,
-0.4130141, 0.7408282, -1.087094, 0.06666667, 1, 0, 1,
-0.4113795, 0.7779993, -0.607781, 0.0627451, 1, 0, 1,
-0.4113059, -0.7454045, -2.779601, 0.05490196, 1, 0, 1,
-0.409582, 1.292735, -0.810043, 0.05098039, 1, 0, 1,
-0.4087257, 0.02399426, -0.7236634, 0.04313726, 1, 0, 1,
-0.4074234, 1.291053, -2.263739, 0.03921569, 1, 0, 1,
-0.3983716, 0.2277675, -1.478092, 0.03137255, 1, 0, 1,
-0.3940436, 1.232118, 0.2684198, 0.02745098, 1, 0, 1,
-0.388738, -0.4855428, -3.637074, 0.01960784, 1, 0, 1,
-0.3861144, -0.1084956, -1.752299, 0.01568628, 1, 0, 1,
-0.3860668, -0.4421189, -1.657813, 0.007843138, 1, 0, 1,
-0.382743, -1.672885, -5.040371, 0.003921569, 1, 0, 1,
-0.376781, -1.869482, -3.94884, 0, 1, 0.003921569, 1,
-0.3748601, 0.6133667, -0.9741415, 0, 1, 0.01176471, 1,
-0.3660054, 0.6223879, -0.6343011, 0, 1, 0.01568628, 1,
-0.3627877, 0.242848, -2.668848, 0, 1, 0.02352941, 1,
-0.3611047, -1.054071, -2.500713, 0, 1, 0.02745098, 1,
-0.3609634, -1.735706, -3.39666, 0, 1, 0.03529412, 1,
-0.3572049, -0.015668, -0.2583767, 0, 1, 0.03921569, 1,
-0.3517228, 0.1558682, -0.4121587, 0, 1, 0.04705882, 1,
-0.3497932, 2.79112, -1.923773, 0, 1, 0.05098039, 1,
-0.3481917, 1.594199, -0.3574463, 0, 1, 0.05882353, 1,
-0.3473351, -0.5503495, -4.134835, 0, 1, 0.0627451, 1,
-0.3443304, 1.105811, 0.1857302, 0, 1, 0.07058824, 1,
-0.3441384, 1.621052, -1.437509, 0, 1, 0.07450981, 1,
-0.3426163, -0.09543607, -3.830966, 0, 1, 0.08235294, 1,
-0.3319936, 0.07793217, -1.789551, 0, 1, 0.08627451, 1,
-0.3270376, -1.086168, -3.610295, 0, 1, 0.09411765, 1,
-0.326431, 0.3809963, -0.5227485, 0, 1, 0.1019608, 1,
-0.3239395, 0.2393398, 1.322463, 0, 1, 0.1058824, 1,
-0.3229799, -0.5859549, -3.324876, 0, 1, 0.1137255, 1,
-0.3222523, -0.3058197, -3.72744, 0, 1, 0.1176471, 1,
-0.3206824, 0.6669557, -0.5670951, 0, 1, 0.1254902, 1,
-0.3147726, 0.2526823, -2.769828, 0, 1, 0.1294118, 1,
-0.3065036, -1.631537, -1.847715, 0, 1, 0.1372549, 1,
-0.3009591, -1.042067, -3.245726, 0, 1, 0.1411765, 1,
-0.3009118, 0.3781168, -1.454682, 0, 1, 0.1490196, 1,
-0.3003641, 1.544141, 2.093239, 0, 1, 0.1529412, 1,
-0.2982385, -1.251465, -4.525603, 0, 1, 0.1607843, 1,
-0.2913, 2.536207, -0.5269174, 0, 1, 0.1647059, 1,
-0.2900001, 0.06731034, -0.8802397, 0, 1, 0.172549, 1,
-0.2878446, 1.266764, -1.176879, 0, 1, 0.1764706, 1,
-0.287327, 0.1762305, -1.625286, 0, 1, 0.1843137, 1,
-0.2828747, 0.9251627, 0.7226537, 0, 1, 0.1882353, 1,
-0.2786679, 0.4259447, -0.9551537, 0, 1, 0.1960784, 1,
-0.2770458, -0.7961037, -3.148355, 0, 1, 0.2039216, 1,
-0.2765793, -1.19567, -0.8169499, 0, 1, 0.2078431, 1,
-0.2716309, -0.1789442, -3.120579, 0, 1, 0.2156863, 1,
-0.2695841, 0.481433, -0.07977032, 0, 1, 0.2196078, 1,
-0.2640457, 0.09064198, 0.639137, 0, 1, 0.227451, 1,
-0.2595663, 0.1741747, -2.665133, 0, 1, 0.2313726, 1,
-0.2516939, -1.325083, -3.313596, 0, 1, 0.2392157, 1,
-0.2481573, -2.827957, -2.535038, 0, 1, 0.2431373, 1,
-0.2424752, -0.2698396, -2.067646, 0, 1, 0.2509804, 1,
-0.2393796, 1.33197, 0.458756, 0, 1, 0.254902, 1,
-0.2309908, 1.332833, 1.148882, 0, 1, 0.2627451, 1,
-0.2290078, 0.1502562, -1.885818, 0, 1, 0.2666667, 1,
-0.2283975, 0.1609826, -1.759386, 0, 1, 0.2745098, 1,
-0.2255895, 0.6338316, -0.8333776, 0, 1, 0.2784314, 1,
-0.2248799, -1.654283, -3.792335, 0, 1, 0.2862745, 1,
-0.2193333, 0.7752244, 0.01981295, 0, 1, 0.2901961, 1,
-0.2184691, 1.022878, -1.05818, 0, 1, 0.2980392, 1,
-0.2176232, 0.6471283, -0.7380422, 0, 1, 0.3058824, 1,
-0.2134142, 0.5131854, -0.5031409, 0, 1, 0.3098039, 1,
-0.2127414, 0.4794215, -0.7759608, 0, 1, 0.3176471, 1,
-0.2087415, 0.3607035, -0.05701444, 0, 1, 0.3215686, 1,
-0.2083871, -0.211844, -2.406403, 0, 1, 0.3294118, 1,
-0.2067935, 0.2614383, -1.430681, 0, 1, 0.3333333, 1,
-0.2067686, 1.257806, -1.235122, 0, 1, 0.3411765, 1,
-0.2027036, -0.2189442, -4.030598, 0, 1, 0.345098, 1,
-0.2026001, -1.153592, -1.611318, 0, 1, 0.3529412, 1,
-0.2020427, 0.5268306, 0.9896922, 0, 1, 0.3568628, 1,
-0.20169, -1.732198, -2.96278, 0, 1, 0.3647059, 1,
-0.1886432, -1.795714, -2.332726, 0, 1, 0.3686275, 1,
-0.1876279, -1.206482, -2.622251, 0, 1, 0.3764706, 1,
-0.1866864, -0.07718537, 0.2288164, 0, 1, 0.3803922, 1,
-0.1840899, -1.474516, -1.494184, 0, 1, 0.3882353, 1,
-0.1835819, 0.9119822, -0.00324503, 0, 1, 0.3921569, 1,
-0.1822733, 1.887346, 0.531601, 0, 1, 0.4, 1,
-0.1765521, 0.4894477, -2.30086, 0, 1, 0.4078431, 1,
-0.1754769, -0.2577694, -2.611874, 0, 1, 0.4117647, 1,
-0.1737355, -0.911729, -3.063615, 0, 1, 0.4196078, 1,
-0.1727583, 0.1408071, -1.249413, 0, 1, 0.4235294, 1,
-0.1715496, 0.375792, -1.052533, 0, 1, 0.4313726, 1,
-0.1700082, -0.9221595, -2.945323, 0, 1, 0.4352941, 1,
-0.1581393, -1.085874, -3.514567, 0, 1, 0.4431373, 1,
-0.1527911, -0.08626956, -3.260099, 0, 1, 0.4470588, 1,
-0.1526483, -0.9053487, -3.184501, 0, 1, 0.454902, 1,
-0.1497011, -0.0396438, -3.841351, 0, 1, 0.4588235, 1,
-0.1463375, -0.8202159, -2.69287, 0, 1, 0.4666667, 1,
-0.1452238, 2.084182, -0.1813236, 0, 1, 0.4705882, 1,
-0.1451688, 2.134833, -1.387121, 0, 1, 0.4784314, 1,
-0.1430228, 1.227659, 0.2793917, 0, 1, 0.4823529, 1,
-0.1397918, -0.6046072, -4.033266, 0, 1, 0.4901961, 1,
-0.1305049, 1.649359, 1.163625, 0, 1, 0.4941176, 1,
-0.1290485, 0.632443, -0.947322, 0, 1, 0.5019608, 1,
-0.1290074, -1.688911, -2.937968, 0, 1, 0.509804, 1,
-0.1267531, -0.1337398, -3.591569, 0, 1, 0.5137255, 1,
-0.1261273, -1.456718, -3.773021, 0, 1, 0.5215687, 1,
-0.1246244, -0.05368157, -4.679932, 0, 1, 0.5254902, 1,
-0.1227017, 0.7305455, -0.205344, 0, 1, 0.5333334, 1,
-0.1195946, -0.5101482, -2.183245, 0, 1, 0.5372549, 1,
-0.1163358, 0.1237257, -0.7961985, 0, 1, 0.5450981, 1,
-0.1134523, 0.9095162, -0.2468333, 0, 1, 0.5490196, 1,
-0.1116646, -0.3213691, -2.512641, 0, 1, 0.5568628, 1,
-0.1108869, 0.8073274, 0.5170939, 0, 1, 0.5607843, 1,
-0.1087615, -0.9727356, -5.697454, 0, 1, 0.5686275, 1,
-0.1087523, -1.302817, -1.111009, 0, 1, 0.572549, 1,
-0.1063638, 0.9877846, 1.721052, 0, 1, 0.5803922, 1,
-0.09991346, 1.024855, -1.008857, 0, 1, 0.5843138, 1,
-0.09926801, -0.08106259, -2.980116, 0, 1, 0.5921569, 1,
-0.09321292, -0.5214617, -3.879427, 0, 1, 0.5960785, 1,
-0.09289416, -0.006198039, -2.080469, 0, 1, 0.6039216, 1,
-0.09213137, 0.1928691, -0.5887482, 0, 1, 0.6117647, 1,
-0.09067828, 1.306877, 1.806212, 0, 1, 0.6156863, 1,
-0.08801322, -0.01719857, -3.035389, 0, 1, 0.6235294, 1,
-0.08240724, 0.9952867, 0.7447132, 0, 1, 0.627451, 1,
-0.08237356, 1.374914, 1.27078, 0, 1, 0.6352941, 1,
-0.08013711, 0.6923183, 0.3069707, 0, 1, 0.6392157, 1,
-0.07424864, -0.1973602, -2.726474, 0, 1, 0.6470588, 1,
-0.07254583, 0.4409111, -0.6891822, 0, 1, 0.6509804, 1,
-0.05973607, 2.507952, -0.2045668, 0, 1, 0.6588235, 1,
-0.05850307, 0.890494, -0.7828127, 0, 1, 0.6627451, 1,
-0.05553404, -0.48658, -2.74693, 0, 1, 0.6705883, 1,
-0.05304771, -1.081409, -2.416843, 0, 1, 0.6745098, 1,
-0.05026341, 0.6367007, -0.8471861, 0, 1, 0.682353, 1,
-0.04996712, 0.2501893, 0.5573595, 0, 1, 0.6862745, 1,
-0.0456027, 0.9203872, 0.5574576, 0, 1, 0.6941177, 1,
-0.03888256, -0.5876263, -3.736808, 0, 1, 0.7019608, 1,
-0.03559672, -0.308779, -4.045794, 0, 1, 0.7058824, 1,
-0.03504584, -0.1808608, -5.356341, 0, 1, 0.7137255, 1,
-0.03205125, -0.3648071, -5.665624, 0, 1, 0.7176471, 1,
-0.02736224, 0.8879998, 0.07420252, 0, 1, 0.7254902, 1,
-0.02711043, 1.061698, -2.547235, 0, 1, 0.7294118, 1,
-0.02690547, -0.1171815, -2.206135, 0, 1, 0.7372549, 1,
-0.02674421, 1.600032, -0.7239964, 0, 1, 0.7411765, 1,
-0.02312495, 2.546378, -2.02457, 0, 1, 0.7490196, 1,
-0.02224692, -0.7295485, -2.841849, 0, 1, 0.7529412, 1,
-0.019899, 0.8624606, 0.3210016, 0, 1, 0.7607843, 1,
-0.0198807, 0.6858743, -0.9346748, 0, 1, 0.7647059, 1,
-0.0174225, 0.1593036, 0.281323, 0, 1, 0.772549, 1,
-0.01145, -1.054129, -4.234416, 0, 1, 0.7764706, 1,
-0.01003565, -0.3144141, -3.831185, 0, 1, 0.7843137, 1,
-0.009123511, 0.1445299, -0.1328359, 0, 1, 0.7882353, 1,
-0.009001283, -0.9590477, -4.665363, 0, 1, 0.7960784, 1,
-0.00817478, 0.09491958, -0.06675081, 0, 1, 0.8039216, 1,
-0.006926856, 0.2026595, 0.8890899, 0, 1, 0.8078431, 1,
-0.006555787, -0.6834429, -2.500193, 0, 1, 0.8156863, 1,
-0.00515448, 0.2942014, 1.316748, 0, 1, 0.8196079, 1,
-0.001701665, -0.3197525, -4.280329, 0, 1, 0.827451, 1,
0.0006136051, -0.3021611, 3.594366, 0, 1, 0.8313726, 1,
0.001783843, -0.5713086, 3.276611, 0, 1, 0.8392157, 1,
0.002546358, 0.4397693, -0.06441558, 0, 1, 0.8431373, 1,
0.003035792, 1.836319, -1.172125, 0, 1, 0.8509804, 1,
0.005088836, 1.217849, -0.3570998, 0, 1, 0.854902, 1,
0.005170962, 1.088959, -0.4963765, 0, 1, 0.8627451, 1,
0.005547902, 0.4508661, 1.033677, 0, 1, 0.8666667, 1,
0.005753177, 1.405264, 2.763828, 0, 1, 0.8745098, 1,
0.009205417, 0.2657419, 0.6696316, 0, 1, 0.8784314, 1,
0.01121478, -1.082783, 1.368799, 0, 1, 0.8862745, 1,
0.01482083, 1.145935, 0.6166135, 0, 1, 0.8901961, 1,
0.01633167, 2.01964, -2.817208, 0, 1, 0.8980392, 1,
0.0172047, 1.079849, 0.7672368, 0, 1, 0.9058824, 1,
0.02055168, -1.744222, 4.33268, 0, 1, 0.9098039, 1,
0.03435172, 1.668284, -1.344288, 0, 1, 0.9176471, 1,
0.03436923, 0.7772273, -1.176031, 0, 1, 0.9215686, 1,
0.03447366, -0.3110517, 2.435945, 0, 1, 0.9294118, 1,
0.03897924, 1.094628, 0.5256419, 0, 1, 0.9333333, 1,
0.04095845, 0.6479058, 0.4396438, 0, 1, 0.9411765, 1,
0.04123581, 0.7278095, -0.4524075, 0, 1, 0.945098, 1,
0.04407149, -0.9735283, 2.380737, 0, 1, 0.9529412, 1,
0.04870407, -1.264474, 3.674414, 0, 1, 0.9568627, 1,
0.04961376, 0.283429, -0.3673971, 0, 1, 0.9647059, 1,
0.05025684, -0.8632634, 1.888177, 0, 1, 0.9686275, 1,
0.05271138, -0.7995684, 3.065027, 0, 1, 0.9764706, 1,
0.05272848, 0.5913097, -0.7774454, 0, 1, 0.9803922, 1,
0.06055792, 1.002881, -1.147236, 0, 1, 0.9882353, 1,
0.06320256, 1.054819, -1.436475, 0, 1, 0.9921569, 1,
0.06403764, 1.008989, -2.157921, 0, 1, 1, 1,
0.06722444, 0.5277975, -0.8056724, 0, 0.9921569, 1, 1,
0.06757114, -0.4304766, 1.805408, 0, 0.9882353, 1, 1,
0.07111797, -0.9431109, 3.081422, 0, 0.9803922, 1, 1,
0.0772499, -0.01307059, 2.513654, 0, 0.9764706, 1, 1,
0.08256423, -0.5428663, 3.547715, 0, 0.9686275, 1, 1,
0.08306161, -0.07177375, 0.5629315, 0, 0.9647059, 1, 1,
0.08931969, -1.559587, 3.919437, 0, 0.9568627, 1, 1,
0.09119002, -0.1484827, 3.715137, 0, 0.9529412, 1, 1,
0.09138034, -0.3049513, 0.5324693, 0, 0.945098, 1, 1,
0.09249104, 0.2768767, -1.234399, 0, 0.9411765, 1, 1,
0.09281636, -0.2752828, 2.154891, 0, 0.9333333, 1, 1,
0.09293105, -0.6612557, 3.99577, 0, 0.9294118, 1, 1,
0.09406306, 0.1463616, 0.2047516, 0, 0.9215686, 1, 1,
0.09759779, 0.2310421, -0.2467197, 0, 0.9176471, 1, 1,
0.0984893, 1.475111, 0.3853241, 0, 0.9098039, 1, 1,
0.09867368, -0.5429269, 3.969875, 0, 0.9058824, 1, 1,
0.09881473, 1.030643, -0.580219, 0, 0.8980392, 1, 1,
0.1003992, 1.793378, -1.095896, 0, 0.8901961, 1, 1,
0.1006038, 1.957149, -2.124866, 0, 0.8862745, 1, 1,
0.1012879, 1.992209, -0.03061441, 0, 0.8784314, 1, 1,
0.1056846, 1.75496, 1.011197, 0, 0.8745098, 1, 1,
0.1080736, 0.4726645, -0.4614907, 0, 0.8666667, 1, 1,
0.1083115, 2.570927, -1.849096, 0, 0.8627451, 1, 1,
0.1083535, -0.6357327, 2.835129, 0, 0.854902, 1, 1,
0.1131597, 0.5648236, 1.120327, 0, 0.8509804, 1, 1,
0.1132443, -0.4855537, 2.208389, 0, 0.8431373, 1, 1,
0.1135582, 1.025348, -0.2135504, 0, 0.8392157, 1, 1,
0.1144663, -0.4899995, 2.759629, 0, 0.8313726, 1, 1,
0.1182332, 1.064397, -0.732408, 0, 0.827451, 1, 1,
0.1204066, 0.5094398, 0.9316972, 0, 0.8196079, 1, 1,
0.1241388, -0.05608357, 2.925732, 0, 0.8156863, 1, 1,
0.1278288, -1.212755, 3.055851, 0, 0.8078431, 1, 1,
0.1301732, 0.003244358, 0.6020457, 0, 0.8039216, 1, 1,
0.1356902, -0.260542, 3.745078, 0, 0.7960784, 1, 1,
0.1398947, -1.24682, 2.801429, 0, 0.7882353, 1, 1,
0.1403291, 0.6615489, -0.237908, 0, 0.7843137, 1, 1,
0.1430877, 0.3779932, -0.4401193, 0, 0.7764706, 1, 1,
0.1442714, -0.8350033, 2.426017, 0, 0.772549, 1, 1,
0.1442783, -0.2330321, 3.617963, 0, 0.7647059, 1, 1,
0.1453793, -2.32197, 2.440498, 0, 0.7607843, 1, 1,
0.146661, -0.5573496, 2.869032, 0, 0.7529412, 1, 1,
0.1569115, -0.3640761, 2.457899, 0, 0.7490196, 1, 1,
0.1601377, -0.2070717, 3.531745, 0, 0.7411765, 1, 1,
0.1628658, -1.492126, 1.713466, 0, 0.7372549, 1, 1,
0.1634309, 0.3306582, 0.6973709, 0, 0.7294118, 1, 1,
0.1635401, -0.6017048, 3.054575, 0, 0.7254902, 1, 1,
0.1713238, -0.4636365, 0.8464039, 0, 0.7176471, 1, 1,
0.1723531, 0.1360955, 1.213551, 0, 0.7137255, 1, 1,
0.1757495, 0.4244832, -0.09162592, 0, 0.7058824, 1, 1,
0.1765073, -1.509621, 2.590569, 0, 0.6980392, 1, 1,
0.1774902, 0.09262325, 0.3330155, 0, 0.6941177, 1, 1,
0.1789263, -0.9713788, 2.523347, 0, 0.6862745, 1, 1,
0.1803724, -0.7437923, 3.490117, 0, 0.682353, 1, 1,
0.1817643, 0.0221596, -0.04948096, 0, 0.6745098, 1, 1,
0.1838563, -0.3025046, 2.71567, 0, 0.6705883, 1, 1,
0.1918392, 0.2953949, 0.2671096, 0, 0.6627451, 1, 1,
0.1940714, -1.055893, 2.542976, 0, 0.6588235, 1, 1,
0.1943503, 1.600407, 0.8173438, 0, 0.6509804, 1, 1,
0.1965314, 0.1607727, 2.092664, 0, 0.6470588, 1, 1,
0.1973414, -0.4571647, 3.481434, 0, 0.6392157, 1, 1,
0.1996466, -0.06798524, 0.7354881, 0, 0.6352941, 1, 1,
0.2000901, 1.612478, 0.6264192, 0, 0.627451, 1, 1,
0.2059964, 0.8520997, 0.9200212, 0, 0.6235294, 1, 1,
0.206037, 1.45704, -0.3158573, 0, 0.6156863, 1, 1,
0.2089757, -0.8927594, 2.514354, 0, 0.6117647, 1, 1,
0.2112751, -0.5589559, 2.412093, 0, 0.6039216, 1, 1,
0.2128584, -0.03216223, 2.518404, 0, 0.5960785, 1, 1,
0.2129116, 0.5456599, -0.6801426, 0, 0.5921569, 1, 1,
0.2156005, -0.1045039, 1.317102, 0, 0.5843138, 1, 1,
0.2164245, -0.244337, 1.792902, 0, 0.5803922, 1, 1,
0.2184367, 0.5129992, -1.220601, 0, 0.572549, 1, 1,
0.2194028, 0.02628383, 2.466471, 0, 0.5686275, 1, 1,
0.2231972, -1.773598, 4.629416, 0, 0.5607843, 1, 1,
0.2309348, 0.02966725, 2.087494, 0, 0.5568628, 1, 1,
0.2331508, 0.08600923, 0.3188217, 0, 0.5490196, 1, 1,
0.2386603, -0.1422712, 3.117341, 0, 0.5450981, 1, 1,
0.2398542, -0.8290397, 3.729206, 0, 0.5372549, 1, 1,
0.2401523, -0.1244039, 1.274747, 0, 0.5333334, 1, 1,
0.2409308, -1.846218, 2.551036, 0, 0.5254902, 1, 1,
0.2411475, -1.291563, 2.506031, 0, 0.5215687, 1, 1,
0.2412452, -0.09214045, 1.518294, 0, 0.5137255, 1, 1,
0.2413482, -2.094003, 3.986875, 0, 0.509804, 1, 1,
0.2462464, 0.01347962, 1.708289, 0, 0.5019608, 1, 1,
0.2463166, 2.27221, -0.6132103, 0, 0.4941176, 1, 1,
0.254836, 1.379582, -0.9791137, 0, 0.4901961, 1, 1,
0.2598148, -0.2493066, 2.056285, 0, 0.4823529, 1, 1,
0.26269, 0.6580439, 0.3895774, 0, 0.4784314, 1, 1,
0.2628373, -0.5173696, 3.339612, 0, 0.4705882, 1, 1,
0.2633868, 0.4038989, 1.825799, 0, 0.4666667, 1, 1,
0.2675374, -0.1317056, 1.055251, 0, 0.4588235, 1, 1,
0.2709283, 0.3533975, 0.1186207, 0, 0.454902, 1, 1,
0.273018, -0.3329765, 3.096438, 0, 0.4470588, 1, 1,
0.2781404, 1.220855, -1.020289, 0, 0.4431373, 1, 1,
0.2827396, -0.2818419, 3.276507, 0, 0.4352941, 1, 1,
0.2835341, -0.4778769, 1.070009, 0, 0.4313726, 1, 1,
0.2838685, -1.41762, 3.181559, 0, 0.4235294, 1, 1,
0.2849371, 0.1828315, 1.546708, 0, 0.4196078, 1, 1,
0.2939086, -0.6048254, 4.162382, 0, 0.4117647, 1, 1,
0.2954283, -1.831155, 3.164861, 0, 0.4078431, 1, 1,
0.3035088, -1.226851, 2.296561, 0, 0.4, 1, 1,
0.3068716, -1.489455, 2.703709, 0, 0.3921569, 1, 1,
0.3084382, 0.8024769, -0.6368412, 0, 0.3882353, 1, 1,
0.3146732, -0.8563604, 3.578469, 0, 0.3803922, 1, 1,
0.3148276, 1.358283, 0.9260417, 0, 0.3764706, 1, 1,
0.318353, -0.4488884, 0.3607204, 0, 0.3686275, 1, 1,
0.3191262, 0.7126595, -0.1841284, 0, 0.3647059, 1, 1,
0.3195731, -1.404266, 3.64583, 0, 0.3568628, 1, 1,
0.3228058, 0.5576437, 1.062076, 0, 0.3529412, 1, 1,
0.3240582, -2.533866, 3.26463, 0, 0.345098, 1, 1,
0.3277668, 1.532956, 1.367386, 0, 0.3411765, 1, 1,
0.3292739, -0.1748391, 1.810098, 0, 0.3333333, 1, 1,
0.3293521, -1.821216, 3.811875, 0, 0.3294118, 1, 1,
0.335586, 0.7923177, 0.2111275, 0, 0.3215686, 1, 1,
0.3382584, -0.9875654, 2.969806, 0, 0.3176471, 1, 1,
0.3386956, 0.1032848, 0.2624649, 0, 0.3098039, 1, 1,
0.3410875, -1.288807, 4.372662, 0, 0.3058824, 1, 1,
0.3421628, -1.000928, 2.944629, 0, 0.2980392, 1, 1,
0.3480423, -0.06325106, 1.255873, 0, 0.2901961, 1, 1,
0.3497162, 0.444331, 1.684943, 0, 0.2862745, 1, 1,
0.3509351, -0.6211913, 2.778574, 0, 0.2784314, 1, 1,
0.3562959, -0.6887325, 2.260789, 0, 0.2745098, 1, 1,
0.3568233, -1.297083, 1.137901, 0, 0.2666667, 1, 1,
0.3598159, 0.1173794, 0.9234034, 0, 0.2627451, 1, 1,
0.3609549, 0.752232, -1.076919, 0, 0.254902, 1, 1,
0.3655059, -0.3783442, 1.430508, 0, 0.2509804, 1, 1,
0.3662426, -0.2647368, 2.49093, 0, 0.2431373, 1, 1,
0.3675593, -1.352118, 2.481637, 0, 0.2392157, 1, 1,
0.3680439, 0.2044743, 1.353422, 0, 0.2313726, 1, 1,
0.3688306, -0.4408928, 2.571579, 0, 0.227451, 1, 1,
0.3724055, 0.7456316, -1.078479, 0, 0.2196078, 1, 1,
0.3729843, -0.358288, 0.9649999, 0, 0.2156863, 1, 1,
0.3746073, 2.74392, 0.2029499, 0, 0.2078431, 1, 1,
0.3767787, 1.509091, 0.1993932, 0, 0.2039216, 1, 1,
0.3792848, -1.039673, 1.727718, 0, 0.1960784, 1, 1,
0.3814714, -0.6118895, 1.627088, 0, 0.1882353, 1, 1,
0.3824688, 0.405698, 0.02017691, 0, 0.1843137, 1, 1,
0.3825612, -1.210029, 2.724057, 0, 0.1764706, 1, 1,
0.3844525, 0.3884128, 0.4066835, 0, 0.172549, 1, 1,
0.3864595, -0.2808985, 0.7005647, 0, 0.1647059, 1, 1,
0.3904901, 0.7041995, 0.37168, 0, 0.1607843, 1, 1,
0.3916069, -0.334419, 1.661205, 0, 0.1529412, 1, 1,
0.393038, 2.31266, -2.369681, 0, 0.1490196, 1, 1,
0.3938573, -0.02484745, 2.769041, 0, 0.1411765, 1, 1,
0.3951191, -0.4006958, 2.196858, 0, 0.1372549, 1, 1,
0.3976538, 0.0241137, 1.353492, 0, 0.1294118, 1, 1,
0.3978356, -1.089503, 2.500613, 0, 0.1254902, 1, 1,
0.3986364, 0.7845718, 1.440233, 0, 0.1176471, 1, 1,
0.398723, 0.1409409, 0.2331932, 0, 0.1137255, 1, 1,
0.4024916, -0.8154101, 1.670406, 0, 0.1058824, 1, 1,
0.4045358, -0.05762009, 0.9423945, 0, 0.09803922, 1, 1,
0.4076836, -0.2219464, 4.214955, 0, 0.09411765, 1, 1,
0.4077695, 0.4652355, -0.9071268, 0, 0.08627451, 1, 1,
0.4101974, -0.4911126, 4.515182, 0, 0.08235294, 1, 1,
0.4117253, 1.241702, 1.355265, 0, 0.07450981, 1, 1,
0.4122391, 0.4576148, 0.921867, 0, 0.07058824, 1, 1,
0.4128033, -0.9362725, 2.38608, 0, 0.0627451, 1, 1,
0.4162774, -1.28025, 3.023933, 0, 0.05882353, 1, 1,
0.4190057, -1.227749, 1.774855, 0, 0.05098039, 1, 1,
0.4202094, 0.1901062, 0.2078915, 0, 0.04705882, 1, 1,
0.4230537, -1.033642, 1.699865, 0, 0.03921569, 1, 1,
0.4241216, 1.339804, 0.3059605, 0, 0.03529412, 1, 1,
0.4329195, 1.116799, 0.006866285, 0, 0.02745098, 1, 1,
0.441176, -0.8976852, 4.409787, 0, 0.02352941, 1, 1,
0.4426734, 1.313623, 1.057235, 0, 0.01568628, 1, 1,
0.4436302, 0.1289239, 1.382033, 0, 0.01176471, 1, 1,
0.443688, 0.2516427, 1.322867, 0, 0.003921569, 1, 1,
0.4439369, -0.4409625, 3.573385, 0.003921569, 0, 1, 1,
0.4442696, 0.1085119, 0.5252041, 0.007843138, 0, 1, 1,
0.446111, 2.610923, 1.199611, 0.01568628, 0, 1, 1,
0.4643827, -0.3454284, 1.031371, 0.01960784, 0, 1, 1,
0.464976, -0.1434178, 2.056299, 0.02745098, 0, 1, 1,
0.4689558, -0.0248361, 2.181244, 0.03137255, 0, 1, 1,
0.473399, -0.983834, 3.540703, 0.03921569, 0, 1, 1,
0.4743889, -0.715276, 2.126454, 0.04313726, 0, 1, 1,
0.4799186, 0.04578015, 1.18393, 0.05098039, 0, 1, 1,
0.4974841, -0.003501752, 0.5483083, 0.05490196, 0, 1, 1,
0.5072898, 1.967507, 0.7373263, 0.0627451, 0, 1, 1,
0.5105507, 0.05933544, 1.0612, 0.06666667, 0, 1, 1,
0.5112679, 0.4357174, 1.365407, 0.07450981, 0, 1, 1,
0.5121019, -0.5702731, 1.316971, 0.07843138, 0, 1, 1,
0.5164569, -0.4071786, 2.344833, 0.08627451, 0, 1, 1,
0.5187859, 0.8535427, -0.3719941, 0.09019608, 0, 1, 1,
0.5213453, -0.9604775, 1.613862, 0.09803922, 0, 1, 1,
0.5242647, -1.893103, 2.757896, 0.1058824, 0, 1, 1,
0.5282746, 0.4564298, 0.448034, 0.1098039, 0, 1, 1,
0.528363, -1.037578, 2.677138, 0.1176471, 0, 1, 1,
0.5309564, -2.361276, 2.087548, 0.1215686, 0, 1, 1,
0.5311686, -2.148202, 3.291358, 0.1294118, 0, 1, 1,
0.5320463, -0.4777715, 1.56099, 0.1333333, 0, 1, 1,
0.5334454, 0.5822474, 0.5468199, 0.1411765, 0, 1, 1,
0.5348246, 0.2541573, -0.6957679, 0.145098, 0, 1, 1,
0.5348552, -1.443855, 3.773278, 0.1529412, 0, 1, 1,
0.5384297, -0.02069548, 4.258956, 0.1568628, 0, 1, 1,
0.5439448, 0.558637, 0.4601249, 0.1647059, 0, 1, 1,
0.5446923, -1.206057, 2.795375, 0.1686275, 0, 1, 1,
0.5489721, 0.8771815, 0.05897892, 0.1764706, 0, 1, 1,
0.5512267, 0.5228928, 0.7416807, 0.1803922, 0, 1, 1,
0.5524577, 1.991611, -0.6437653, 0.1882353, 0, 1, 1,
0.5528408, 1.001602, 2.560923, 0.1921569, 0, 1, 1,
0.5529796, -1.045585, 3.721858, 0.2, 0, 1, 1,
0.5537213, -0.4850184, 2.489211, 0.2078431, 0, 1, 1,
0.5558571, -1.768223, 1.456848, 0.2117647, 0, 1, 1,
0.5579355, 0.1961011, 0.07417793, 0.2196078, 0, 1, 1,
0.558284, -0.2049321, 1.581763, 0.2235294, 0, 1, 1,
0.5602771, -1.175054, 2.503507, 0.2313726, 0, 1, 1,
0.5742834, -1.319522, 2.167009, 0.2352941, 0, 1, 1,
0.5754716, 0.9299501, 2.114375, 0.2431373, 0, 1, 1,
0.5818571, 0.04908267, 0.8985418, 0.2470588, 0, 1, 1,
0.5899913, -1.074467, 2.111435, 0.254902, 0, 1, 1,
0.5945198, -0.9521538, 3.285693, 0.2588235, 0, 1, 1,
0.5966523, 1.712887, 0.3933557, 0.2666667, 0, 1, 1,
0.5995159, -1.732804, 1.094938, 0.2705882, 0, 1, 1,
0.6003343, 0.1529698, 2.104836, 0.2784314, 0, 1, 1,
0.6023871, -0.6137759, 2.197989, 0.282353, 0, 1, 1,
0.6039701, -0.1488413, 0.04407625, 0.2901961, 0, 1, 1,
0.6061237, 0.9438554, 0.941815, 0.2941177, 0, 1, 1,
0.6124077, 1.038705, 0.23584, 0.3019608, 0, 1, 1,
0.6127985, 0.3555002, 0.3761934, 0.3098039, 0, 1, 1,
0.6143369, -0.5785199, 2.968158, 0.3137255, 0, 1, 1,
0.6162692, 0.8225397, -0.4042588, 0.3215686, 0, 1, 1,
0.6214784, -2.383065, 3.648946, 0.3254902, 0, 1, 1,
0.6221274, -1.721455, 2.160623, 0.3333333, 0, 1, 1,
0.6323841, 0.7756715, -0.7075009, 0.3372549, 0, 1, 1,
0.6378216, 1.001632, 0.07264628, 0.345098, 0, 1, 1,
0.6381062, -0.6700354, 3.659017, 0.3490196, 0, 1, 1,
0.6415316, -0.06747925, 2.010851, 0.3568628, 0, 1, 1,
0.6486406, 0.8535277, 1.288791, 0.3607843, 0, 1, 1,
0.6486989, 0.4438806, 0.7220575, 0.3686275, 0, 1, 1,
0.6516564, -0.08376434, 0.7899751, 0.372549, 0, 1, 1,
0.6553051, 0.5164626, 0.2959155, 0.3803922, 0, 1, 1,
0.6563249, -0.8377164, 2.902737, 0.3843137, 0, 1, 1,
0.6593776, 0.2098554, 1.606791, 0.3921569, 0, 1, 1,
0.6731199, 1.391673, -0.1565278, 0.3960784, 0, 1, 1,
0.681242, 1.918294, -0.6668108, 0.4039216, 0, 1, 1,
0.6827964, 1.444177, -0.1608239, 0.4117647, 0, 1, 1,
0.6886499, 0.4966303, 1.624458, 0.4156863, 0, 1, 1,
0.6906034, -0.8246847, 3.692158, 0.4235294, 0, 1, 1,
0.6911809, -0.2267958, 1.394121, 0.427451, 0, 1, 1,
0.6920424, -1.000323, 3.238557, 0.4352941, 0, 1, 1,
0.7005884, 0.3185009, 2.159458, 0.4392157, 0, 1, 1,
0.7011911, 0.9982175, -1.260225, 0.4470588, 0, 1, 1,
0.7085863, 0.05663438, -0.1294716, 0.4509804, 0, 1, 1,
0.7089249, -1.333475, 3.40451, 0.4588235, 0, 1, 1,
0.7092662, -1.202292, 1.560225, 0.4627451, 0, 1, 1,
0.7094522, -1.471883, 2.014861, 0.4705882, 0, 1, 1,
0.7098649, -0.1064173, 1.212766, 0.4745098, 0, 1, 1,
0.7218338, 1.275012, -0.3641296, 0.4823529, 0, 1, 1,
0.7247646, -0.91308, 2.76166, 0.4862745, 0, 1, 1,
0.7259015, -0.3616416, 2.82007, 0.4941176, 0, 1, 1,
0.7264604, -1.182559, 3.325142, 0.5019608, 0, 1, 1,
0.7397127, -1.156195, 3.548964, 0.5058824, 0, 1, 1,
0.7442131, -0.3584924, 3.302393, 0.5137255, 0, 1, 1,
0.7453934, -0.1358712, 2.122712, 0.5176471, 0, 1, 1,
0.745961, 0.3077855, 3.173064, 0.5254902, 0, 1, 1,
0.7499408, -0.1275291, 0.7296364, 0.5294118, 0, 1, 1,
0.7500461, -1.779781, 1.474738, 0.5372549, 0, 1, 1,
0.7505482, 0.4724933, 2.01284, 0.5411765, 0, 1, 1,
0.7517478, 0.1142728, 0.3538644, 0.5490196, 0, 1, 1,
0.7521294, 0.9134701, 0.008744623, 0.5529412, 0, 1, 1,
0.7544136, -1.807525, 3.056502, 0.5607843, 0, 1, 1,
0.7558098, -0.1868021, 2.044539, 0.5647059, 0, 1, 1,
0.7593454, 0.2521928, 2.520138, 0.572549, 0, 1, 1,
0.7605445, -0.3748128, 0.09287638, 0.5764706, 0, 1, 1,
0.7618752, -0.0913948, 0.652822, 0.5843138, 0, 1, 1,
0.7647905, 0.1491777, 1.715684, 0.5882353, 0, 1, 1,
0.7681445, -0.7410489, 3.075622, 0.5960785, 0, 1, 1,
0.7682507, -1.08742, 0.908438, 0.6039216, 0, 1, 1,
0.768862, 1.426985, 1.163591, 0.6078432, 0, 1, 1,
0.7722517, -0.4418369, 3.485729, 0.6156863, 0, 1, 1,
0.7768202, -0.2298655, 4.012065, 0.6196079, 0, 1, 1,
0.7793479, -2.315102, 3.169363, 0.627451, 0, 1, 1,
0.780556, 0.07733899, 2.257032, 0.6313726, 0, 1, 1,
0.7828451, -0.711495, 0.05249107, 0.6392157, 0, 1, 1,
0.7857007, 0.3903798, 0.101442, 0.6431373, 0, 1, 1,
0.7892082, -0.6998044, 3.055943, 0.6509804, 0, 1, 1,
0.7912724, 0.818527, 0.9197845, 0.654902, 0, 1, 1,
0.7969791, -0.5263652, -0.1842577, 0.6627451, 0, 1, 1,
0.7990651, 0.4263166, 0.3221072, 0.6666667, 0, 1, 1,
0.8034928, -0.1049092, 1.711918, 0.6745098, 0, 1, 1,
0.8036723, -0.514521, 1.712669, 0.6784314, 0, 1, 1,
0.8043852, -0.7473011, 4.297104, 0.6862745, 0, 1, 1,
0.8047211, -1.684791, 1.7621, 0.6901961, 0, 1, 1,
0.814673, -0.3676043, 0.7996411, 0.6980392, 0, 1, 1,
0.8162178, 0.8983014, 0.6287054, 0.7058824, 0, 1, 1,
0.8164909, -1.070712, 2.073127, 0.7098039, 0, 1, 1,
0.8192691, 0.6079435, 3.104152, 0.7176471, 0, 1, 1,
0.8260464, 1.9072, 1.351432, 0.7215686, 0, 1, 1,
0.8285158, -0.3940639, 2.359452, 0.7294118, 0, 1, 1,
0.8329529, -0.5775906, 3.62821, 0.7333333, 0, 1, 1,
0.8380375, 0.2117692, 1.908311, 0.7411765, 0, 1, 1,
0.8409063, -0.7724813, 1.542479, 0.7450981, 0, 1, 1,
0.851465, -0.909136, 2.833215, 0.7529412, 0, 1, 1,
0.852828, 0.4886482, 0.6327856, 0.7568628, 0, 1, 1,
0.8579211, -0.789018, 2.194019, 0.7647059, 0, 1, 1,
0.8600412, -0.7703825, 1.687144, 0.7686275, 0, 1, 1,
0.8605646, -1.314433, 2.955075, 0.7764706, 0, 1, 1,
0.8630467, -0.2801912, 1.461506, 0.7803922, 0, 1, 1,
0.8664752, -1.08412, 2.731778, 0.7882353, 0, 1, 1,
0.8716601, 0.4423745, 2.138887, 0.7921569, 0, 1, 1,
0.8972829, -0.1716096, 0.9293088, 0.8, 0, 1, 1,
0.9006975, 1.257663, 2.419078, 0.8078431, 0, 1, 1,
0.9047215, -0.937961, 2.147087, 0.8117647, 0, 1, 1,
0.9083287, 0.3476913, 1.845834, 0.8196079, 0, 1, 1,
0.9095797, -0.6781591, 0.473361, 0.8235294, 0, 1, 1,
0.9109568, 1.43408, 0.8563062, 0.8313726, 0, 1, 1,
0.914228, 2.871256, 0.2092148, 0.8352941, 0, 1, 1,
0.914744, 0.2040112, 0.5519555, 0.8431373, 0, 1, 1,
0.9234658, -0.467802, 1.284668, 0.8470588, 0, 1, 1,
0.9253123, 0.0236487, 4.108232, 0.854902, 0, 1, 1,
0.9285964, 1.237478, -1.499731, 0.8588235, 0, 1, 1,
0.9290466, -0.08778134, 2.994915, 0.8666667, 0, 1, 1,
0.9342604, -0.4101649, 0.6964602, 0.8705882, 0, 1, 1,
0.9376317, -0.53284, 0.04433203, 0.8784314, 0, 1, 1,
0.9414033, -1.221928, 2.92056, 0.8823529, 0, 1, 1,
0.941577, 1.220085, 1.415277, 0.8901961, 0, 1, 1,
0.9432739, -0.08838376, 1.161778, 0.8941177, 0, 1, 1,
0.9436551, -0.6058697, 1.843976, 0.9019608, 0, 1, 1,
0.9456588, 0.7858616, 1.851315, 0.9098039, 0, 1, 1,
0.9466531, -2.129082, 2.838759, 0.9137255, 0, 1, 1,
0.9483212, -0.06841458, 2.726804, 0.9215686, 0, 1, 1,
0.954829, 0.003493723, 3.263019, 0.9254902, 0, 1, 1,
0.9574047, 0.03718642, 2.103167, 0.9333333, 0, 1, 1,
0.9583652, -0.7002363, 1.234464, 0.9372549, 0, 1, 1,
0.9616674, 0.6146941, 3.229814, 0.945098, 0, 1, 1,
0.9631654, -0.2039222, 1.567784, 0.9490196, 0, 1, 1,
0.9656276, 1.241701, 1.287795, 0.9568627, 0, 1, 1,
0.9675255, 1.238804, -1.276627, 0.9607843, 0, 1, 1,
0.968555, -1.109788, 3.209189, 0.9686275, 0, 1, 1,
0.9688466, 1.140477, 0.08599403, 0.972549, 0, 1, 1,
0.9822624, 0.7621761, 0.1676572, 0.9803922, 0, 1, 1,
1.000479, 0.4325883, 2.804825, 0.9843137, 0, 1, 1,
1.002068, 0.3443755, -0.5774877, 0.9921569, 0, 1, 1,
1.007285, -0.6794168, 3.105047, 0.9960784, 0, 1, 1,
1.007879, 0.2871234, 2.79296, 1, 0, 0.9960784, 1,
1.012797, -0.2775874, 1.411272, 1, 0, 0.9882353, 1,
1.017957, -1.792591, 4.325129, 1, 0, 0.9843137, 1,
1.025173, 0.8363525, 0.8027399, 1, 0, 0.9764706, 1,
1.026875, -0.1918744, 1.156004, 1, 0, 0.972549, 1,
1.026922, 0.1235631, 0.6962698, 1, 0, 0.9647059, 1,
1.027871, 0.002782321, 0.5392331, 1, 0, 0.9607843, 1,
1.034086, 0.504213, 0.9794397, 1, 0, 0.9529412, 1,
1.036677, -0.6548039, 1.757795, 1, 0, 0.9490196, 1,
1.04481, 0.04063775, 3.895746, 1, 0, 0.9411765, 1,
1.048084, 0.4707228, 0.7971784, 1, 0, 0.9372549, 1,
1.053295, 0.9583898, 0.03861837, 1, 0, 0.9294118, 1,
1.055862, -0.5547719, 1.94457, 1, 0, 0.9254902, 1,
1.060097, -0.6314955, 1.996875, 1, 0, 0.9176471, 1,
1.061529, 1.69837, 0.1270465, 1, 0, 0.9137255, 1,
1.062332, -1.874011, 1.767943, 1, 0, 0.9058824, 1,
1.076632, 0.2451364, 2.99564, 1, 0, 0.9019608, 1,
1.0848, -0.2663274, 1.61735, 1, 0, 0.8941177, 1,
1.091421, 1.190667, 1.480826, 1, 0, 0.8862745, 1,
1.092918, -0.3628125, 0.4098224, 1, 0, 0.8823529, 1,
1.098592, -0.1713137, 2.401875, 1, 0, 0.8745098, 1,
1.106142, -0.733581, 3.216995, 1, 0, 0.8705882, 1,
1.113207, -0.7032707, 3.050545, 1, 0, 0.8627451, 1,
1.120005, 1.67508, -1.30556, 1, 0, 0.8588235, 1,
1.12087, -0.9561813, 2.891851, 1, 0, 0.8509804, 1,
1.122321, 0.1775679, -0.3866066, 1, 0, 0.8470588, 1,
1.124063, -1.015298, 3.467119, 1, 0, 0.8392157, 1,
1.127982, 0.423531, 1.342485, 1, 0, 0.8352941, 1,
1.129807, -0.7936695, 1.310853, 1, 0, 0.827451, 1,
1.152866, -1.846378, 2.970626, 1, 0, 0.8235294, 1,
1.155464, 1.617425, 2.249562, 1, 0, 0.8156863, 1,
1.164674, -1.379932, 2.894455, 1, 0, 0.8117647, 1,
1.168127, 0.386273, 1.177048, 1, 0, 0.8039216, 1,
1.170695, 0.2459513, 1.865545, 1, 0, 0.7960784, 1,
1.184874, -1.121277, 2.644126, 1, 0, 0.7921569, 1,
1.198793, 0.4740756, 1.172441, 1, 0, 0.7843137, 1,
1.198994, -0.8660033, 2.809376, 1, 0, 0.7803922, 1,
1.200469, -0.5701499, 1.605706, 1, 0, 0.772549, 1,
1.200864, -0.2569115, 4.103204, 1, 0, 0.7686275, 1,
1.203757, 0.4769907, -0.638797, 1, 0, 0.7607843, 1,
1.212586, -0.4730701, 2.660865, 1, 0, 0.7568628, 1,
1.212995, -1.557613, 2.799225, 1, 0, 0.7490196, 1,
1.222739, 1.135744, 1.296744, 1, 0, 0.7450981, 1,
1.223176, -1.673247, 1.456736, 1, 0, 0.7372549, 1,
1.22364, 0.1739522, 3.309844, 1, 0, 0.7333333, 1,
1.224148, -2.110422, 3.692136, 1, 0, 0.7254902, 1,
1.23349, -1.245556, 2.446932, 1, 0, 0.7215686, 1,
1.237359, -1.210709, 2.271068, 1, 0, 0.7137255, 1,
1.238303, -1.721924, 2.365026, 1, 0, 0.7098039, 1,
1.240471, -1.658, 2.21789, 1, 0, 0.7019608, 1,
1.246767, -0.8721485, 2.651366, 1, 0, 0.6941177, 1,
1.247941, 0.808492, -0.7871659, 1, 0, 0.6901961, 1,
1.249543, 1.679429, 0.1844117, 1, 0, 0.682353, 1,
1.261215, 0.80278, 0.9502401, 1, 0, 0.6784314, 1,
1.271907, 0.9051091, 1.417285, 1, 0, 0.6705883, 1,
1.287028, -0.1703213, 2.184127, 1, 0, 0.6666667, 1,
1.291795, 0.9924583, -1.001987, 1, 0, 0.6588235, 1,
1.300189, -0.5648696, 2.613472, 1, 0, 0.654902, 1,
1.315433, 0.5103273, 0.454183, 1, 0, 0.6470588, 1,
1.317132, 0.4745695, 2.231622, 1, 0, 0.6431373, 1,
1.325035, 1.309149, 2.423445, 1, 0, 0.6352941, 1,
1.326077, 0.330571, 0.7118025, 1, 0, 0.6313726, 1,
1.327175, 0.568582, 1.13265, 1, 0, 0.6235294, 1,
1.330604, -0.6309018, 1.525727, 1, 0, 0.6196079, 1,
1.343152, -0.03272207, 0.2389566, 1, 0, 0.6117647, 1,
1.359518, 0.02117453, 1.206421, 1, 0, 0.6078432, 1,
1.362099, -0.8061208, 1.109217, 1, 0, 0.6, 1,
1.364307, 0.5753052, 2.352132, 1, 0, 0.5921569, 1,
1.368055, 0.9318699, 1.37048, 1, 0, 0.5882353, 1,
1.368441, 0.3925235, -0.3994063, 1, 0, 0.5803922, 1,
1.372895, -0.2289207, -0.1645623, 1, 0, 0.5764706, 1,
1.374334, -1.899475, 3.876698, 1, 0, 0.5686275, 1,
1.385978, -0.7778808, 1.073936, 1, 0, 0.5647059, 1,
1.407835, -2.151622, 3.869699, 1, 0, 0.5568628, 1,
1.408884, 1.1955, 1.889655, 1, 0, 0.5529412, 1,
1.413201, -0.4529657, 0.9830248, 1, 0, 0.5450981, 1,
1.423476, 1.162997, 0.1922868, 1, 0, 0.5411765, 1,
1.437178, 1.186098, -0.3348501, 1, 0, 0.5333334, 1,
1.454542, 0.9912643, 2.437161, 1, 0, 0.5294118, 1,
1.464832, 0.9308186, -0.7509565, 1, 0, 0.5215687, 1,
1.46797, -2.220379, 2.10373, 1, 0, 0.5176471, 1,
1.470171, -0.3823178, 1.284889, 1, 0, 0.509804, 1,
1.478487, -1.336714, 2.806453, 1, 0, 0.5058824, 1,
1.496491, 0.442432, 1.654075, 1, 0, 0.4980392, 1,
1.501334, 0.6556523, -0.5382809, 1, 0, 0.4901961, 1,
1.502178, -0.127114, 2.49072, 1, 0, 0.4862745, 1,
1.505837, 0.05719006, 3.394706, 1, 0, 0.4784314, 1,
1.51956, 0.4851801, 0.5139582, 1, 0, 0.4745098, 1,
1.524436, -0.7980698, 2.154176, 1, 0, 0.4666667, 1,
1.534519, -0.9267703, 1.167056, 1, 0, 0.4627451, 1,
1.548224, 0.7961473, 3.329768, 1, 0, 0.454902, 1,
1.548236, 0.2201808, 2.672327, 1, 0, 0.4509804, 1,
1.549106, -1.067598, 3.000525, 1, 0, 0.4431373, 1,
1.559054, 0.5529993, 1.727381, 1, 0, 0.4392157, 1,
1.561048, 0.9436244, -0.2158716, 1, 0, 0.4313726, 1,
1.56645, 1.53303, 1.723472, 1, 0, 0.427451, 1,
1.569868, 0.08924019, 3.315995, 1, 0, 0.4196078, 1,
1.575195, 0.1089373, 2.013387, 1, 0, 0.4156863, 1,
1.578993, -0.2173614, 1.832118, 1, 0, 0.4078431, 1,
1.585997, -0.8268723, 2.302147, 1, 0, 0.4039216, 1,
1.590653, -0.5361938, 1.298815, 1, 0, 0.3960784, 1,
1.59947, -0.03287002, 2.011068, 1, 0, 0.3882353, 1,
1.600744, 1.66058, 0.08091889, 1, 0, 0.3843137, 1,
1.6153, 0.6591281, 0.4476209, 1, 0, 0.3764706, 1,
1.636687, 1.381329, 1.767803, 1, 0, 0.372549, 1,
1.638378, 2.515269, 0.2827152, 1, 0, 0.3647059, 1,
1.646161, 0.9940571, 1.328177, 1, 0, 0.3607843, 1,
1.649174, 1.289378, -0.1153449, 1, 0, 0.3529412, 1,
1.657321, 0.8793442, 0.6346947, 1, 0, 0.3490196, 1,
1.658158, 0.5457403, 4.069434, 1, 0, 0.3411765, 1,
1.66845, 0.1835089, 1.655837, 1, 0, 0.3372549, 1,
1.674788, 0.7213476, 0.4633374, 1, 0, 0.3294118, 1,
1.700898, -0.2856746, 1.617878, 1, 0, 0.3254902, 1,
1.709383, 1.993309, 1.41441, 1, 0, 0.3176471, 1,
1.719122, -1.066437, 1.514712, 1, 0, 0.3137255, 1,
1.774964, -0.5527222, 0.335855, 1, 0, 0.3058824, 1,
1.782904, -0.1613662, -0.6035656, 1, 0, 0.2980392, 1,
1.785096, 0.834473, 0.2402702, 1, 0, 0.2941177, 1,
1.794083, 2.297213, -0.4733531, 1, 0, 0.2862745, 1,
1.802963, -1.55182, 2.789171, 1, 0, 0.282353, 1,
1.807345, 0.9785811, 0.5382101, 1, 0, 0.2745098, 1,
1.826328, -0.4687926, 2.063229, 1, 0, 0.2705882, 1,
1.85518, -1.922163, 2.165819, 1, 0, 0.2627451, 1,
1.864697, -0.812203, 2.070626, 1, 0, 0.2588235, 1,
1.869744, -0.1786898, 1.140754, 1, 0, 0.2509804, 1,
1.886403, 1.178714, -0.5097825, 1, 0, 0.2470588, 1,
1.887099, 0.05819165, 2.183068, 1, 0, 0.2392157, 1,
1.906413, 3.396163, 0.6854191, 1, 0, 0.2352941, 1,
1.916754, -0.8108668, 4.221688, 1, 0, 0.227451, 1,
1.918872, -0.6076782, 1.655204, 1, 0, 0.2235294, 1,
1.920535, 0.8047926, 1.473668, 1, 0, 0.2156863, 1,
1.925143, -0.4905359, 0.08141122, 1, 0, 0.2117647, 1,
1.950627, -0.2908424, 2.145006, 1, 0, 0.2039216, 1,
1.952574, -0.2408284, 1.244919, 1, 0, 0.1960784, 1,
1.965486, 0.05031615, 0.5212329, 1, 0, 0.1921569, 1,
1.986009, 0.5626988, 1.624233, 1, 0, 0.1843137, 1,
1.998935, 2.482097, 0.7741185, 1, 0, 0.1803922, 1,
2.042068, -0.4366131, 3.173518, 1, 0, 0.172549, 1,
2.044864, -0.134381, 2.227683, 1, 0, 0.1686275, 1,
2.061105, 0.698602, 2.810714, 1, 0, 0.1607843, 1,
2.064556, -0.9996998, 3.805109, 1, 0, 0.1568628, 1,
2.06987, 0.3774024, 3.874429, 1, 0, 0.1490196, 1,
2.08112, -0.4281833, 2.072108, 1, 0, 0.145098, 1,
2.08447, -0.6117696, 4.09366, 1, 0, 0.1372549, 1,
2.09659, -0.240378, 3.352623, 1, 0, 0.1333333, 1,
2.099587, -0.1204043, 2.235614, 1, 0, 0.1254902, 1,
2.108651, 0.3391235, 1.271252, 1, 0, 0.1215686, 1,
2.170811, -1.930478, 1.111184, 1, 0, 0.1137255, 1,
2.199111, 1.612403, 1.275033, 1, 0, 0.1098039, 1,
2.222628, -1.433931, 3.384457, 1, 0, 0.1019608, 1,
2.224856, -1.08989, 2.447014, 1, 0, 0.09411765, 1,
2.29174, -0.3006965, 3.023342, 1, 0, 0.09019608, 1,
2.309765, 0.5202867, 1.340602, 1, 0, 0.08235294, 1,
2.338429, 0.3627334, 1.292103, 1, 0, 0.07843138, 1,
2.352393, 0.3415497, -0.2310263, 1, 0, 0.07058824, 1,
2.368849, 0.8393805, 1.662973, 1, 0, 0.06666667, 1,
2.372666, 1.136434, 0.1765039, 1, 0, 0.05882353, 1,
2.441141, -1.090643, 3.323001, 1, 0, 0.05490196, 1,
2.450453, 1.329056, 1.886765, 1, 0, 0.04705882, 1,
2.487459, 0.9217703, 2.785404, 1, 0, 0.04313726, 1,
2.503449, 0.1976865, 0.8178009, 1, 0, 0.03529412, 1,
2.659349, -0.1688389, 1.701915, 1, 0, 0.03137255, 1,
2.662013, 0.9602888, 1.298871, 1, 0, 0.02352941, 1,
2.678462, 0.3369177, -0.4483947, 1, 0, 0.01960784, 1,
2.824994, 1.026727, 1.195359, 1, 0, 0.01176471, 1,
3.623325, 0.9949238, -0.2105824, 1, 0, 0.007843138, 1
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
0.1481514, -3.966041, -7.447858, 0, -0.5, 0.5, 0.5,
0.1481514, -3.966041, -7.447858, 1, -0.5, 0.5, 0.5,
0.1481514, -3.966041, -7.447858, 1, 1.5, 0.5, 0.5,
0.1481514, -3.966041, -7.447858, 0, 1.5, 0.5, 0.5
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
-4.505106, 0.248577, -7.447858, 0, -0.5, 0.5, 0.5,
-4.505106, 0.248577, -7.447858, 1, -0.5, 0.5, 0.5,
-4.505106, 0.248577, -7.447858, 1, 1.5, 0.5, 0.5,
-4.505106, 0.248577, -7.447858, 0, 1.5, 0.5, 0.5
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
-4.505106, -3.966041, -0.5340192, 0, -0.5, 0.5, 0.5,
-4.505106, -3.966041, -0.5340192, 1, -0.5, 0.5, 0.5,
-4.505106, -3.966041, -0.5340192, 1, 1.5, 0.5, 0.5,
-4.505106, -3.966041, -0.5340192, 0, 1.5, 0.5, 0.5
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
-3, -2.993437, -5.852357,
3, -2.993437, -5.852357,
-3, -2.993437, -5.852357,
-3, -3.155538, -6.118274,
-2, -2.993437, -5.852357,
-2, -3.155538, -6.118274,
-1, -2.993437, -5.852357,
-1, -3.155538, -6.118274,
0, -2.993437, -5.852357,
0, -3.155538, -6.118274,
1, -2.993437, -5.852357,
1, -3.155538, -6.118274,
2, -2.993437, -5.852357,
2, -3.155538, -6.118274,
3, -2.993437, -5.852357,
3, -3.155538, -6.118274
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
-3, -3.479739, -6.650108, 0, -0.5, 0.5, 0.5,
-3, -3.479739, -6.650108, 1, -0.5, 0.5, 0.5,
-3, -3.479739, -6.650108, 1, 1.5, 0.5, 0.5,
-3, -3.479739, -6.650108, 0, 1.5, 0.5, 0.5,
-2, -3.479739, -6.650108, 0, -0.5, 0.5, 0.5,
-2, -3.479739, -6.650108, 1, -0.5, 0.5, 0.5,
-2, -3.479739, -6.650108, 1, 1.5, 0.5, 0.5,
-2, -3.479739, -6.650108, 0, 1.5, 0.5, 0.5,
-1, -3.479739, -6.650108, 0, -0.5, 0.5, 0.5,
-1, -3.479739, -6.650108, 1, -0.5, 0.5, 0.5,
-1, -3.479739, -6.650108, 1, 1.5, 0.5, 0.5,
-1, -3.479739, -6.650108, 0, 1.5, 0.5, 0.5,
0, -3.479739, -6.650108, 0, -0.5, 0.5, 0.5,
0, -3.479739, -6.650108, 1, -0.5, 0.5, 0.5,
0, -3.479739, -6.650108, 1, 1.5, 0.5, 0.5,
0, -3.479739, -6.650108, 0, 1.5, 0.5, 0.5,
1, -3.479739, -6.650108, 0, -0.5, 0.5, 0.5,
1, -3.479739, -6.650108, 1, -0.5, 0.5, 0.5,
1, -3.479739, -6.650108, 1, 1.5, 0.5, 0.5,
1, -3.479739, -6.650108, 0, 1.5, 0.5, 0.5,
2, -3.479739, -6.650108, 0, -0.5, 0.5, 0.5,
2, -3.479739, -6.650108, 1, -0.5, 0.5, 0.5,
2, -3.479739, -6.650108, 1, 1.5, 0.5, 0.5,
2, -3.479739, -6.650108, 0, 1.5, 0.5, 0.5,
3, -3.479739, -6.650108, 0, -0.5, 0.5, 0.5,
3, -3.479739, -6.650108, 1, -0.5, 0.5, 0.5,
3, -3.479739, -6.650108, 1, 1.5, 0.5, 0.5,
3, -3.479739, -6.650108, 0, 1.5, 0.5, 0.5
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
-3.431278, -2, -5.852357,
-3.431278, 3, -5.852357,
-3.431278, -2, -5.852357,
-3.610249, -2, -6.118274,
-3.431278, -1, -5.852357,
-3.610249, -1, -6.118274,
-3.431278, 0, -5.852357,
-3.610249, 0, -6.118274,
-3.431278, 1, -5.852357,
-3.610249, 1, -6.118274,
-3.431278, 2, -5.852357,
-3.610249, 2, -6.118274,
-3.431278, 3, -5.852357,
-3.610249, 3, -6.118274
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
-3.968192, -2, -6.650108, 0, -0.5, 0.5, 0.5,
-3.968192, -2, -6.650108, 1, -0.5, 0.5, 0.5,
-3.968192, -2, -6.650108, 1, 1.5, 0.5, 0.5,
-3.968192, -2, -6.650108, 0, 1.5, 0.5, 0.5,
-3.968192, -1, -6.650108, 0, -0.5, 0.5, 0.5,
-3.968192, -1, -6.650108, 1, -0.5, 0.5, 0.5,
-3.968192, -1, -6.650108, 1, 1.5, 0.5, 0.5,
-3.968192, -1, -6.650108, 0, 1.5, 0.5, 0.5,
-3.968192, 0, -6.650108, 0, -0.5, 0.5, 0.5,
-3.968192, 0, -6.650108, 1, -0.5, 0.5, 0.5,
-3.968192, 0, -6.650108, 1, 1.5, 0.5, 0.5,
-3.968192, 0, -6.650108, 0, 1.5, 0.5, 0.5,
-3.968192, 1, -6.650108, 0, -0.5, 0.5, 0.5,
-3.968192, 1, -6.650108, 1, -0.5, 0.5, 0.5,
-3.968192, 1, -6.650108, 1, 1.5, 0.5, 0.5,
-3.968192, 1, -6.650108, 0, 1.5, 0.5, 0.5,
-3.968192, 2, -6.650108, 0, -0.5, 0.5, 0.5,
-3.968192, 2, -6.650108, 1, -0.5, 0.5, 0.5,
-3.968192, 2, -6.650108, 1, 1.5, 0.5, 0.5,
-3.968192, 2, -6.650108, 0, 1.5, 0.5, 0.5,
-3.968192, 3, -6.650108, 0, -0.5, 0.5, 0.5,
-3.968192, 3, -6.650108, 1, -0.5, 0.5, 0.5,
-3.968192, 3, -6.650108, 1, 1.5, 0.5, 0.5,
-3.968192, 3, -6.650108, 0, 1.5, 0.5, 0.5
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
-3.431278, -2.993437, -4,
-3.431278, -2.993437, 4,
-3.431278, -2.993437, -4,
-3.610249, -3.155538, -4,
-3.431278, -2.993437, -2,
-3.610249, -3.155538, -2,
-3.431278, -2.993437, 0,
-3.610249, -3.155538, 0,
-3.431278, -2.993437, 2,
-3.610249, -3.155538, 2,
-3.431278, -2.993437, 4,
-3.610249, -3.155538, 4
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
-3.968192, -3.479739, -4, 0, -0.5, 0.5, 0.5,
-3.968192, -3.479739, -4, 1, -0.5, 0.5, 0.5,
-3.968192, -3.479739, -4, 1, 1.5, 0.5, 0.5,
-3.968192, -3.479739, -4, 0, 1.5, 0.5, 0.5,
-3.968192, -3.479739, -2, 0, -0.5, 0.5, 0.5,
-3.968192, -3.479739, -2, 1, -0.5, 0.5, 0.5,
-3.968192, -3.479739, -2, 1, 1.5, 0.5, 0.5,
-3.968192, -3.479739, -2, 0, 1.5, 0.5, 0.5,
-3.968192, -3.479739, 0, 0, -0.5, 0.5, 0.5,
-3.968192, -3.479739, 0, 1, -0.5, 0.5, 0.5,
-3.968192, -3.479739, 0, 1, 1.5, 0.5, 0.5,
-3.968192, -3.479739, 0, 0, 1.5, 0.5, 0.5,
-3.968192, -3.479739, 2, 0, -0.5, 0.5, 0.5,
-3.968192, -3.479739, 2, 1, -0.5, 0.5, 0.5,
-3.968192, -3.479739, 2, 1, 1.5, 0.5, 0.5,
-3.968192, -3.479739, 2, 0, 1.5, 0.5, 0.5,
-3.968192, -3.479739, 4, 0, -0.5, 0.5, 0.5,
-3.968192, -3.479739, 4, 1, -0.5, 0.5, 0.5,
-3.968192, -3.479739, 4, 1, 1.5, 0.5, 0.5,
-3.968192, -3.479739, 4, 0, 1.5, 0.5, 0.5
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
-3.431278, -2.993437, -5.852357,
-3.431278, 3.490591, -5.852357,
-3.431278, -2.993437, 4.784318,
-3.431278, 3.490591, 4.784318,
-3.431278, -2.993437, -5.852357,
-3.431278, -2.993437, 4.784318,
-3.431278, 3.490591, -5.852357,
-3.431278, 3.490591, 4.784318,
-3.431278, -2.993437, -5.852357,
3.72758, -2.993437, -5.852357,
-3.431278, -2.993437, 4.784318,
3.72758, -2.993437, 4.784318,
-3.431278, 3.490591, -5.852357,
3.72758, 3.490591, -5.852357,
-3.431278, 3.490591, 4.784318,
3.72758, 3.490591, 4.784318,
3.72758, -2.993437, -5.852357,
3.72758, 3.490591, -5.852357,
3.72758, -2.993437, 4.784318,
3.72758, 3.490591, 4.784318,
3.72758, -2.993437, -5.852357,
3.72758, -2.993437, 4.784318,
3.72758, 3.490591, -5.852357,
3.72758, 3.490591, 4.784318
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
var radius = 7.672071;
var distance = 34.13391;
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
mvMatrix.translate( -0.1481514, -0.248577, 0.5340192 );
mvMatrix.scale( 1.158731, 1.279327, 0.7798672 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.13391);
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
acetyl-N-methylcarba<-read.table("acetyl-N-methylcarba.xyz")
```

```
## Error in read.table("acetyl-N-methylcarba.xyz"): no lines available in input
```

```r
x<-acetyl-N-methylcarba$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetyl' not found
```

```r
y<-acetyl-N-methylcarba$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetyl' not found
```

```r
z<-acetyl-N-methylcarba$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetyl' not found
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
-3.327022, -0.91082, -1.919906, 0, 0, 1, 1, 1,
-2.792529, -0.6623345, -2.128839, 1, 0, 0, 1, 1,
-2.768001, -0.5781975, -2.947378, 1, 0, 0, 1, 1,
-2.75732, 0.4050066, -0.8843648, 1, 0, 0, 1, 1,
-2.598816, -1.28475, -1.634885, 1, 0, 0, 1, 1,
-2.593458, -0.2017516, -0.7378255, 1, 0, 0, 1, 1,
-2.536097, 0.5783827, -0.9350235, 0, 0, 0, 1, 1,
-2.453631, 0.6766702, -2.128075, 0, 0, 0, 1, 1,
-2.449777, -0.9036888, -2.671074, 0, 0, 0, 1, 1,
-2.381125, 1.356425, -1.781283, 0, 0, 0, 1, 1,
-2.341909, -0.2637022, -0.4263382, 0, 0, 0, 1, 1,
-2.328798, -1.044243, -1.323712, 0, 0, 0, 1, 1,
-2.256222, 0.2969419, -1.883601, 0, 0, 0, 1, 1,
-2.237859, 0.6191603, -0.592852, 1, 1, 1, 1, 1,
-2.231537, -1.369394, -1.048498, 1, 1, 1, 1, 1,
-2.188601, -0.5714334, -0.8954776, 1, 1, 1, 1, 1,
-2.177393, -1.331323, -0.7663862, 1, 1, 1, 1, 1,
-2.163272, -1.051989, -0.3546434, 1, 1, 1, 1, 1,
-2.141033, 0.04064277, -0.4806985, 1, 1, 1, 1, 1,
-2.112451, 0.5536478, 0.2656767, 1, 1, 1, 1, 1,
-2.090848, 1.469869, 1.128333, 1, 1, 1, 1, 1,
-2.073589, -0.6099649, -0.7529644, 1, 1, 1, 1, 1,
-2.050385, -2.500142, -4.324236, 1, 1, 1, 1, 1,
-2.04753, 0.5665534, -2.607355, 1, 1, 1, 1, 1,
-2.011072, 0.5788869, -0.1334123, 1, 1, 1, 1, 1,
-1.971913, -0.856397, -1.497291, 1, 1, 1, 1, 1,
-1.905604, 1.049647, -1.013679, 1, 1, 1, 1, 1,
-1.887591, 0.1333237, -3.273213, 1, 1, 1, 1, 1,
-1.88466, -1.088438, -1.788665, 0, 0, 1, 1, 1,
-1.87319, 0.8738571, -1.676031, 1, 0, 0, 1, 1,
-1.872901, -0.3007501, -0.3309575, 1, 0, 0, 1, 1,
-1.866609, 0.75786, -1.097735, 1, 0, 0, 1, 1,
-1.856913, 2.191268, -0.2830549, 1, 0, 0, 1, 1,
-1.847366, 1.207344, -1.366329, 1, 0, 0, 1, 1,
-1.843202, 0.7189685, -0.2481357, 0, 0, 0, 1, 1,
-1.818174, -0.3127617, -2.454225, 0, 0, 0, 1, 1,
-1.803994, -0.7092583, -2.521067, 0, 0, 0, 1, 1,
-1.786834, 0.1693685, -0.5463138, 0, 0, 0, 1, 1,
-1.777219, 2.090253, -0.6281605, 0, 0, 0, 1, 1,
-1.776693, -0.08056705, -2.205733, 0, 0, 0, 1, 1,
-1.771655, 1.844611, -0.7233758, 0, 0, 0, 1, 1,
-1.763067, -0.4813281, -2.421482, 1, 1, 1, 1, 1,
-1.757423, -1.596309, -3.142852, 1, 1, 1, 1, 1,
-1.726733, -1.011868, -2.704807, 1, 1, 1, 1, 1,
-1.685842, -0.8172947, -2.419731, 1, 1, 1, 1, 1,
-1.68571, -0.1476598, -1.548379, 1, 1, 1, 1, 1,
-1.681548, 0.8952352, -0.5635638, 1, 1, 1, 1, 1,
-1.65789, -0.03526337, -3.148549, 1, 1, 1, 1, 1,
-1.647488, 1.308673, -2.236369, 1, 1, 1, 1, 1,
-1.646842, -0.7829872, -3.116476, 1, 1, 1, 1, 1,
-1.643606, -0.7592678, -1.547178, 1, 1, 1, 1, 1,
-1.631012, -0.9586862, -0.4110235, 1, 1, 1, 1, 1,
-1.623836, 2.18444, -1.992889, 1, 1, 1, 1, 1,
-1.613068, 0.3850955, -2.54565, 1, 1, 1, 1, 1,
-1.60113, 0.7961718, -1.77135, 1, 1, 1, 1, 1,
-1.600836, -0.8757048, -4.528878, 1, 1, 1, 1, 1,
-1.584908, 0.1795031, -1.710335, 0, 0, 1, 1, 1,
-1.532762, -0.5149137, -1.128623, 1, 0, 0, 1, 1,
-1.524438, -1.202544, -1.218916, 1, 0, 0, 1, 1,
-1.517271, -0.9484718, -2.066861, 1, 0, 0, 1, 1,
-1.512017, 0.2706776, -2.363465, 1, 0, 0, 1, 1,
-1.511712, 0.3007044, -1.768555, 1, 0, 0, 1, 1,
-1.504894, -0.2617144, -0.08285232, 0, 0, 0, 1, 1,
-1.498635, 0.3747527, -2.366659, 0, 0, 0, 1, 1,
-1.481513, 0.7727858, -3.507491, 0, 0, 0, 1, 1,
-1.477573, -0.386294, -2.159824, 0, 0, 0, 1, 1,
-1.475613, 1.539875, -0.4659236, 0, 0, 0, 1, 1,
-1.475028, -0.5019885, -2.230966, 0, 0, 0, 1, 1,
-1.473846, 1.322093, -0.8212453, 0, 0, 0, 1, 1,
-1.471705, 0.7320325, -2.031612, 1, 1, 1, 1, 1,
-1.45961, 0.3453779, -2.750463, 1, 1, 1, 1, 1,
-1.459561, 0.1073888, -0.06958917, 1, 1, 1, 1, 1,
-1.455939, 0.3860625, -1.634712, 1, 1, 1, 1, 1,
-1.436305, -1.228122, -2.709509, 1, 1, 1, 1, 1,
-1.412523, -0.08252261, -2.833293, 1, 1, 1, 1, 1,
-1.410113, -1.800164, -1.392411, 1, 1, 1, 1, 1,
-1.39784, 0.281073, -1.697909, 1, 1, 1, 1, 1,
-1.38388, 0.2137994, -1.525996, 1, 1, 1, 1, 1,
-1.381878, 0.7322655, -0.4838884, 1, 1, 1, 1, 1,
-1.373352, 0.04857873, -0.4863558, 1, 1, 1, 1, 1,
-1.364241, -1.246843, -1.842473, 1, 1, 1, 1, 1,
-1.358054, -0.3097436, -0.5496835, 1, 1, 1, 1, 1,
-1.357986, 1.212115, 0.5721386, 1, 1, 1, 1, 1,
-1.350214, 1.357852, 0.1113017, 1, 1, 1, 1, 1,
-1.347765, -1.632373, -2.379316, 0, 0, 1, 1, 1,
-1.342551, -0.9355613, -0.9469923, 1, 0, 0, 1, 1,
-1.340198, -0.02465997, -3.483913, 1, 0, 0, 1, 1,
-1.340079, -0.2949836, -2.453268, 1, 0, 0, 1, 1,
-1.337942, 1.372415, 0.8302047, 1, 0, 0, 1, 1,
-1.337699, -0.5438179, -2.278161, 1, 0, 0, 1, 1,
-1.33563, -0.7872663, -1.729461, 0, 0, 0, 1, 1,
-1.33258, -0.2979967, -2.419063, 0, 0, 0, 1, 1,
-1.316948, 0.3011886, 0.4915796, 0, 0, 0, 1, 1,
-1.316666, 0.04477608, -0.2483184, 0, 0, 0, 1, 1,
-1.31164, 0.2228555, -0.4702593, 0, 0, 0, 1, 1,
-1.298061, 0.1083835, -0.6681991, 0, 0, 0, 1, 1,
-1.296691, -0.5547036, -1.882697, 0, 0, 0, 1, 1,
-1.276166, -0.590902, -1.388899, 1, 1, 1, 1, 1,
-1.272859, 1.7123, 0.77431, 1, 1, 1, 1, 1,
-1.265823, -0.8886499, -2.422621, 1, 1, 1, 1, 1,
-1.262004, -1.022403, -2.268781, 1, 1, 1, 1, 1,
-1.261332, -0.5306894, -2.028865, 1, 1, 1, 1, 1,
-1.259441, 1.171038, -1.432898, 1, 1, 1, 1, 1,
-1.258974, 0.3548203, -1.194559, 1, 1, 1, 1, 1,
-1.258676, 0.2658126, -0.9755152, 1, 1, 1, 1, 1,
-1.25079, 1.903647, -0.05993142, 1, 1, 1, 1, 1,
-1.245821, -1.557977, -2.027977, 1, 1, 1, 1, 1,
-1.242278, -0.7310535, -2.324406, 1, 1, 1, 1, 1,
-1.240871, 0.8275922, -1.448529, 1, 1, 1, 1, 1,
-1.236639, -0.9468992, -1.533704, 1, 1, 1, 1, 1,
-1.234195, 0.2725155, -1.299499, 1, 1, 1, 1, 1,
-1.232891, -1.395648, -2.29767, 1, 1, 1, 1, 1,
-1.224988, -1.290041, -2.675043, 0, 0, 1, 1, 1,
-1.224726, 0.02930791, -0.5313187, 1, 0, 0, 1, 1,
-1.219077, -0.1427185, -0.8271452, 1, 0, 0, 1, 1,
-1.219043, -0.3930071, -1.974269, 1, 0, 0, 1, 1,
-1.209287, 0.6235562, -1.068593, 1, 0, 0, 1, 1,
-1.208996, -0.01692706, -1.018314, 1, 0, 0, 1, 1,
-1.190318, -1.26259, -3.133803, 0, 0, 0, 1, 1,
-1.178571, -0.1351522, -1.526092, 0, 0, 0, 1, 1,
-1.177186, -1.63647, -1.331824, 0, 0, 0, 1, 1,
-1.175265, -0.6812986, -1.09278, 0, 0, 0, 1, 1,
-1.162291, 0.1560567, -0.2793252, 0, 0, 0, 1, 1,
-1.158092, 1.903058, 0.2466746, 0, 0, 0, 1, 1,
-1.15, -0.8062701, -3.113866, 0, 0, 0, 1, 1,
-1.14972, -0.6869954, -3.178464, 1, 1, 1, 1, 1,
-1.143348, -0.8108189, -2.83022, 1, 1, 1, 1, 1,
-1.138036, 0.1080932, -2.926381, 1, 1, 1, 1, 1,
-1.138008, 0.3664995, 0.127543, 1, 1, 1, 1, 1,
-1.134747, -0.7021651, -0.2096724, 1, 1, 1, 1, 1,
-1.1346, 1.11956, 0.4585617, 1, 1, 1, 1, 1,
-1.127536, 0.4773849, -0.3186412, 1, 1, 1, 1, 1,
-1.124212, -1.076316, -2.997464, 1, 1, 1, 1, 1,
-1.12395, -0.5265808, -2.312121, 1, 1, 1, 1, 1,
-1.122202, -0.5451179, -3.674134, 1, 1, 1, 1, 1,
-1.113387, 0.827047, -2.232274, 1, 1, 1, 1, 1,
-1.112428, -0.398256, -1.748487, 1, 1, 1, 1, 1,
-1.107183, 0.07457323, -3.431823, 1, 1, 1, 1, 1,
-1.099147, 0.912122, -2.275063, 1, 1, 1, 1, 1,
-1.09678, -0.6114844, -2.039483, 1, 1, 1, 1, 1,
-1.079301, 1.097223, -0.8304819, 0, 0, 1, 1, 1,
-1.076007, -0.09190336, -1.548834, 1, 0, 0, 1, 1,
-1.075963, -0.9233117, -3.727738, 1, 0, 0, 1, 1,
-1.070386, -1.144605, -2.061772, 1, 0, 0, 1, 1,
-1.067543, 1.263505, -1.236505, 1, 0, 0, 1, 1,
-1.066675, -0.004936422, -1.545193, 1, 0, 0, 1, 1,
-1.064717, 0.1683814, -2.604455, 0, 0, 0, 1, 1,
-1.055822, 1.169303, -0.08243104, 0, 0, 0, 1, 1,
-1.054311, 1.209614, -0.8542523, 0, 0, 0, 1, 1,
-1.051512, -2.310798, -2.139249, 0, 0, 0, 1, 1,
-1.049742, -2.899009, -1.987844, 0, 0, 0, 1, 1,
-1.048314, 1.120582, -2.108532, 0, 0, 0, 1, 1,
-1.047118, 0.169402, -2.580252, 0, 0, 0, 1, 1,
-1.044724, -0.8627842, -1.872903, 1, 1, 1, 1, 1,
-1.044644, 1.280631, -0.3735094, 1, 1, 1, 1, 1,
-1.043733, 0.3454521, -3.547659, 1, 1, 1, 1, 1,
-1.034803, 0.4518416, -2.189239, 1, 1, 1, 1, 1,
-1.034499, -0.6754187, -0.7467963, 1, 1, 1, 1, 1,
-1.033365, -0.6309171, -3.995572, 1, 1, 1, 1, 1,
-1.024854, -0.4647936, -1.121783, 1, 1, 1, 1, 1,
-1.023428, -0.02036014, -0.01266015, 1, 1, 1, 1, 1,
-1.016301, -0.3311921, -2.380542, 1, 1, 1, 1, 1,
-1.015248, -0.1670039, -1.737704, 1, 1, 1, 1, 1,
-1.003461, 0.6473145, -1.139296, 1, 1, 1, 1, 1,
-0.9983673, -0.04018731, -1.261243, 1, 1, 1, 1, 1,
-0.9939924, -0.4085038, -1.295562, 1, 1, 1, 1, 1,
-0.9861308, 0.2678499, -0.5055213, 1, 1, 1, 1, 1,
-0.9765784, 0.7174518, 0.8487824, 1, 1, 1, 1, 1,
-0.9745685, -0.5476022, -1.228434, 0, 0, 1, 1, 1,
-0.9664746, -1.553595, -0.3505472, 1, 0, 0, 1, 1,
-0.9638877, 1.682364, -0.2473482, 1, 0, 0, 1, 1,
-0.9608641, 0.8964498, -0.8753936, 1, 0, 0, 1, 1,
-0.9590733, -0.8559369, -1.662662, 1, 0, 0, 1, 1,
-0.955648, -1.648696, -2.142267, 1, 0, 0, 1, 1,
-0.9476945, 0.01715362, -1.809981, 0, 0, 0, 1, 1,
-0.9447381, 1.651467, 1.922173, 0, 0, 0, 1, 1,
-0.9410176, 0.774874, -2.056953, 0, 0, 0, 1, 1,
-0.9395608, 1.269235, -1.76322, 0, 0, 0, 1, 1,
-0.9344567, -0.3814451, -2.004991, 0, 0, 0, 1, 1,
-0.9340723, -0.8745247, -2.120978, 0, 0, 0, 1, 1,
-0.934031, -0.4230343, -2.293012, 0, 0, 0, 1, 1,
-0.9327565, -0.7198516, -1.383167, 1, 1, 1, 1, 1,
-0.9320304, -1.106851, 0.3151421, 1, 1, 1, 1, 1,
-0.9273964, -1.006966, -2.268328, 1, 1, 1, 1, 1,
-0.9245209, -0.3236953, -2.864023, 1, 1, 1, 1, 1,
-0.9225979, 1.194197, -0.4557596, 1, 1, 1, 1, 1,
-0.9204249, -1.350052, -2.530301, 1, 1, 1, 1, 1,
-0.917052, -0.9151294, -3.351177, 1, 1, 1, 1, 1,
-0.901187, 0.5403717, -0.8167046, 1, 1, 1, 1, 1,
-0.8880316, 2.333128, -1.53664, 1, 1, 1, 1, 1,
-0.8877383, -0.9687066, -0.8627641, 1, 1, 1, 1, 1,
-0.884266, 0.2838962, -1.262377, 1, 1, 1, 1, 1,
-0.8836419, -0.9913294, -1.82211, 1, 1, 1, 1, 1,
-0.8796253, 0.2791904, -0.1847209, 1, 1, 1, 1, 1,
-0.8793305, -0.6620085, -1.754313, 1, 1, 1, 1, 1,
-0.8789953, -0.1372918, -2.731687, 1, 1, 1, 1, 1,
-0.8749413, -0.4861174, -3.460938, 0, 0, 1, 1, 1,
-0.8731873, 0.6784282, -0.6342857, 1, 0, 0, 1, 1,
-0.8617901, 0.8231255, -2.13692, 1, 0, 0, 1, 1,
-0.8585672, 0.5291743, -1.334468, 1, 0, 0, 1, 1,
-0.847949, -0.03366244, -0.6185763, 1, 0, 0, 1, 1,
-0.8393667, 1.14238, 0.6645204, 1, 0, 0, 1, 1,
-0.8388785, 1.042106, -0.1085194, 0, 0, 0, 1, 1,
-0.8386401, -0.2342818, -1.136762, 0, 0, 0, 1, 1,
-0.8367317, -0.1135442, -2.370779, 0, 0, 0, 1, 1,
-0.8359237, -0.6712312, -1.695256, 0, 0, 0, 1, 1,
-0.8347195, -1.558389, -0.6044086, 0, 0, 0, 1, 1,
-0.8340549, -0.6006192, -1.662738, 0, 0, 0, 1, 1,
-0.8339549, 0.4068527, -1.542832, 0, 0, 0, 1, 1,
-0.8298321, 1.300025, -0.3684346, 1, 1, 1, 1, 1,
-0.8235571, 0.4837195, -1.83489, 1, 1, 1, 1, 1,
-0.8216837, 1.168893, -1.626305, 1, 1, 1, 1, 1,
-0.8189623, 0.2951854, 0.09589469, 1, 1, 1, 1, 1,
-0.8027411, 0.4436941, -0.983065, 1, 1, 1, 1, 1,
-0.8011128, 0.4151637, -0.1316491, 1, 1, 1, 1, 1,
-0.7999621, -0.1868661, -1.956854, 1, 1, 1, 1, 1,
-0.7970286, 2.589272, -1.165954, 1, 1, 1, 1, 1,
-0.7952938, 0.0007638271, -1.456254, 1, 1, 1, 1, 1,
-0.7801402, 1.844748, -0.1404377, 1, 1, 1, 1, 1,
-0.7790467, 0.7184856, -1.696277, 1, 1, 1, 1, 1,
-0.7746696, 1.507974, -0.356223, 1, 1, 1, 1, 1,
-0.7723534, 0.3986068, -0.9707884, 1, 1, 1, 1, 1,
-0.7659479, 2.341356, -0.8147423, 1, 1, 1, 1, 1,
-0.7641284, 0.3395115, -0.8756144, 1, 1, 1, 1, 1,
-0.7569073, -1.659448, 0.02510525, 0, 0, 1, 1, 1,
-0.7533683, -1.600621, -3.280619, 1, 0, 0, 1, 1,
-0.7446439, 1.206153, 0.3157028, 1, 0, 0, 1, 1,
-0.741017, 1.205456, -0.451737, 1, 0, 0, 1, 1,
-0.7377664, 0.5262206, -0.6026233, 1, 0, 0, 1, 1,
-0.7356673, -0.3939581, -2.7075, 1, 0, 0, 1, 1,
-0.7324801, 1.107452, -0.1208673, 0, 0, 0, 1, 1,
-0.7263649, 0.3897498, -0.3960427, 0, 0, 0, 1, 1,
-0.7257956, 0.8326949, -0.4826847, 0, 0, 0, 1, 1,
-0.7208103, -0.04000834, -1.455356, 0, 0, 0, 1, 1,
-0.7204534, -0.2653387, -0.0606561, 0, 0, 0, 1, 1,
-0.717798, 0.7166913, 0.3851384, 0, 0, 0, 1, 1,
-0.7114596, -1.751854, -3.44904, 0, 0, 0, 1, 1,
-0.7110389, -1.150783, -2.387694, 1, 1, 1, 1, 1,
-0.7087968, -0.9359071, -2.921091, 1, 1, 1, 1, 1,
-0.6986855, 0.03329858, -3.231571, 1, 1, 1, 1, 1,
-0.6967977, -0.2717104, -1.381818, 1, 1, 1, 1, 1,
-0.6926693, 0.395366, -1.515295, 1, 1, 1, 1, 1,
-0.6915823, 0.1902634, -1.46246, 1, 1, 1, 1, 1,
-0.6774142, -0.216247, 0.08149984, 1, 1, 1, 1, 1,
-0.6757619, -0.5153143, -2.018496, 1, 1, 1, 1, 1,
-0.675312, 0.2513104, 0.2237964, 1, 1, 1, 1, 1,
-0.6745393, 0.5279475, -0.9659951, 1, 1, 1, 1, 1,
-0.6645741, 0.3685268, -1.880117, 1, 1, 1, 1, 1,
-0.6637719, -0.547545, -2.026754, 1, 1, 1, 1, 1,
-0.6594359, 0.6214803, -0.9381328, 1, 1, 1, 1, 1,
-0.6576106, 0.8402877, 1.192251, 1, 1, 1, 1, 1,
-0.6572618, -0.498233, -2.317763, 1, 1, 1, 1, 1,
-0.6524302, 1.306431, 0.1016498, 0, 0, 1, 1, 1,
-0.6520475, -1.088232, -3.677721, 1, 0, 0, 1, 1,
-0.6374164, 0.1926618, -1.176189, 1, 0, 0, 1, 1,
-0.6311314, 0.3659947, -0.3515058, 1, 0, 0, 1, 1,
-0.6188235, 0.6667987, -1.146499, 1, 0, 0, 1, 1,
-0.6128474, 0.8194663, -0.9337083, 1, 0, 0, 1, 1,
-0.5997438, -0.3872466, -1.456361, 0, 0, 0, 1, 1,
-0.5987003, -0.3979038, -1.084551, 0, 0, 0, 1, 1,
-0.5961805, -0.3974331, -3.063705, 0, 0, 0, 1, 1,
-0.5958176, -0.03521538, -2.915035, 0, 0, 0, 1, 1,
-0.5943734, -1.054491, -3.042308, 0, 0, 0, 1, 1,
-0.5921982, -0.8665211, -2.987262, 0, 0, 0, 1, 1,
-0.5888552, -0.1706989, -2.721495, 0, 0, 0, 1, 1,
-0.5883123, 0.1117221, -0.9444883, 1, 1, 1, 1, 1,
-0.5847116, -1.392955, -1.699216, 1, 1, 1, 1, 1,
-0.5787787, 1.208572, -1.646918, 1, 1, 1, 1, 1,
-0.5772868, -0.4419961, -0.3844026, 1, 1, 1, 1, 1,
-0.5733722, 0.08098014, -2.541167, 1, 1, 1, 1, 1,
-0.5693665, -1.032195, -2.648357, 1, 1, 1, 1, 1,
-0.5686906, 1.57719, 1.446632, 1, 1, 1, 1, 1,
-0.5642319, 0.5619838, 0.9951426, 1, 1, 1, 1, 1,
-0.5616181, 0.3917123, -1.298468, 1, 1, 1, 1, 1,
-0.559262, -1.883025, -2.578282, 1, 1, 1, 1, 1,
-0.5560233, -0.7963555, -1.456769, 1, 1, 1, 1, 1,
-0.5552978, -1.217564, -2.765394, 1, 1, 1, 1, 1,
-0.5417436, 0.439554, -0.8310249, 1, 1, 1, 1, 1,
-0.5365174, 0.1804358, -1.962263, 1, 1, 1, 1, 1,
-0.5306084, -0.366401, -2.659, 1, 1, 1, 1, 1,
-0.5293293, -0.5118224, -2.847264, 0, 0, 1, 1, 1,
-0.5287647, 0.9807018, 0.3845462, 1, 0, 0, 1, 1,
-0.5205178, -0.9346378, -1.924742, 1, 0, 0, 1, 1,
-0.5179888, -0.9516948, -3.964124, 1, 0, 0, 1, 1,
-0.5177189, 1.171389, -1.012285, 1, 0, 0, 1, 1,
-0.5131238, 0.5896924, -1.651863, 1, 0, 0, 1, 1,
-0.5095153, -0.7314662, -1.389343, 0, 0, 0, 1, 1,
-0.4935546, 0.9753772, 0.4903356, 0, 0, 0, 1, 1,
-0.4903295, -0.6724701, -3.191841, 0, 0, 0, 1, 1,
-0.4901525, 0.1667324, -3.799757, 0, 0, 0, 1, 1,
-0.4894618, 0.03988975, -1.066143, 0, 0, 0, 1, 1,
-0.4885558, -1.12578, -2.645582, 0, 0, 0, 1, 1,
-0.4866517, 1.740904, -0.3002389, 0, 0, 0, 1, 1,
-0.4856484, 0.3803777, -1.447804, 1, 1, 1, 1, 1,
-0.4849174, 1.047852, 0.601923, 1, 1, 1, 1, 1,
-0.482571, 1.875581, -0.7043614, 1, 1, 1, 1, 1,
-0.4812252, -0.4226339, -1.186752, 1, 1, 1, 1, 1,
-0.4803624, -1.430345, -3.725605, 1, 1, 1, 1, 1,
-0.4798719, -0.341416, -1.044556, 1, 1, 1, 1, 1,
-0.4797512, -1.046601, -1.79354, 1, 1, 1, 1, 1,
-0.4789187, 0.6533432, 0.0644066, 1, 1, 1, 1, 1,
-0.4787569, 1.259, -0.7233717, 1, 1, 1, 1, 1,
-0.4714649, 1.558091, 0.7000312, 1, 1, 1, 1, 1,
-0.4698525, -2.057482, -3.198436, 1, 1, 1, 1, 1,
-0.4667578, -1.169801, -2.423162, 1, 1, 1, 1, 1,
-0.4633273, 2.083954, -1.53335, 1, 1, 1, 1, 1,
-0.4632877, 0.8186278, -1.930282, 1, 1, 1, 1, 1,
-0.4615914, 0.08040031, -2.534905, 1, 1, 1, 1, 1,
-0.4605257, -0.4463652, -1.664121, 0, 0, 1, 1, 1,
-0.4575939, -1.66963, -4.069851, 1, 0, 0, 1, 1,
-0.4478718, -1.341866, -2.316918, 1, 0, 0, 1, 1,
-0.4458705, 1.195289, -1.084326, 1, 0, 0, 1, 1,
-0.4455424, 0.6700094, -2.478606, 1, 0, 0, 1, 1,
-0.4425856, -1.125216, -2.990384, 1, 0, 0, 1, 1,
-0.4359699, -0.9693912, -2.9956, 0, 0, 0, 1, 1,
-0.4324868, 0.1398111, 0.02575041, 0, 0, 0, 1, 1,
-0.4313054, -0.1969956, -1.354942, 0, 0, 0, 1, 1,
-0.4251255, 1.216056, -0.5746594, 0, 0, 0, 1, 1,
-0.424918, 0.4431175, -0.9045117, 0, 0, 0, 1, 1,
-0.4237352, 0.362541, -0.3009962, 0, 0, 0, 1, 1,
-0.4181423, -0.1499346, -0.5470623, 0, 0, 0, 1, 1,
-0.4141093, -0.443997, -2.856915, 1, 1, 1, 1, 1,
-0.4130141, 0.7408282, -1.087094, 1, 1, 1, 1, 1,
-0.4113795, 0.7779993, -0.607781, 1, 1, 1, 1, 1,
-0.4113059, -0.7454045, -2.779601, 1, 1, 1, 1, 1,
-0.409582, 1.292735, -0.810043, 1, 1, 1, 1, 1,
-0.4087257, 0.02399426, -0.7236634, 1, 1, 1, 1, 1,
-0.4074234, 1.291053, -2.263739, 1, 1, 1, 1, 1,
-0.3983716, 0.2277675, -1.478092, 1, 1, 1, 1, 1,
-0.3940436, 1.232118, 0.2684198, 1, 1, 1, 1, 1,
-0.388738, -0.4855428, -3.637074, 1, 1, 1, 1, 1,
-0.3861144, -0.1084956, -1.752299, 1, 1, 1, 1, 1,
-0.3860668, -0.4421189, -1.657813, 1, 1, 1, 1, 1,
-0.382743, -1.672885, -5.040371, 1, 1, 1, 1, 1,
-0.376781, -1.869482, -3.94884, 1, 1, 1, 1, 1,
-0.3748601, 0.6133667, -0.9741415, 1, 1, 1, 1, 1,
-0.3660054, 0.6223879, -0.6343011, 0, 0, 1, 1, 1,
-0.3627877, 0.242848, -2.668848, 1, 0, 0, 1, 1,
-0.3611047, -1.054071, -2.500713, 1, 0, 0, 1, 1,
-0.3609634, -1.735706, -3.39666, 1, 0, 0, 1, 1,
-0.3572049, -0.015668, -0.2583767, 1, 0, 0, 1, 1,
-0.3517228, 0.1558682, -0.4121587, 1, 0, 0, 1, 1,
-0.3497932, 2.79112, -1.923773, 0, 0, 0, 1, 1,
-0.3481917, 1.594199, -0.3574463, 0, 0, 0, 1, 1,
-0.3473351, -0.5503495, -4.134835, 0, 0, 0, 1, 1,
-0.3443304, 1.105811, 0.1857302, 0, 0, 0, 1, 1,
-0.3441384, 1.621052, -1.437509, 0, 0, 0, 1, 1,
-0.3426163, -0.09543607, -3.830966, 0, 0, 0, 1, 1,
-0.3319936, 0.07793217, -1.789551, 0, 0, 0, 1, 1,
-0.3270376, -1.086168, -3.610295, 1, 1, 1, 1, 1,
-0.326431, 0.3809963, -0.5227485, 1, 1, 1, 1, 1,
-0.3239395, 0.2393398, 1.322463, 1, 1, 1, 1, 1,
-0.3229799, -0.5859549, -3.324876, 1, 1, 1, 1, 1,
-0.3222523, -0.3058197, -3.72744, 1, 1, 1, 1, 1,
-0.3206824, 0.6669557, -0.5670951, 1, 1, 1, 1, 1,
-0.3147726, 0.2526823, -2.769828, 1, 1, 1, 1, 1,
-0.3065036, -1.631537, -1.847715, 1, 1, 1, 1, 1,
-0.3009591, -1.042067, -3.245726, 1, 1, 1, 1, 1,
-0.3009118, 0.3781168, -1.454682, 1, 1, 1, 1, 1,
-0.3003641, 1.544141, 2.093239, 1, 1, 1, 1, 1,
-0.2982385, -1.251465, -4.525603, 1, 1, 1, 1, 1,
-0.2913, 2.536207, -0.5269174, 1, 1, 1, 1, 1,
-0.2900001, 0.06731034, -0.8802397, 1, 1, 1, 1, 1,
-0.2878446, 1.266764, -1.176879, 1, 1, 1, 1, 1,
-0.287327, 0.1762305, -1.625286, 0, 0, 1, 1, 1,
-0.2828747, 0.9251627, 0.7226537, 1, 0, 0, 1, 1,
-0.2786679, 0.4259447, -0.9551537, 1, 0, 0, 1, 1,
-0.2770458, -0.7961037, -3.148355, 1, 0, 0, 1, 1,
-0.2765793, -1.19567, -0.8169499, 1, 0, 0, 1, 1,
-0.2716309, -0.1789442, -3.120579, 1, 0, 0, 1, 1,
-0.2695841, 0.481433, -0.07977032, 0, 0, 0, 1, 1,
-0.2640457, 0.09064198, 0.639137, 0, 0, 0, 1, 1,
-0.2595663, 0.1741747, -2.665133, 0, 0, 0, 1, 1,
-0.2516939, -1.325083, -3.313596, 0, 0, 0, 1, 1,
-0.2481573, -2.827957, -2.535038, 0, 0, 0, 1, 1,
-0.2424752, -0.2698396, -2.067646, 0, 0, 0, 1, 1,
-0.2393796, 1.33197, 0.458756, 0, 0, 0, 1, 1,
-0.2309908, 1.332833, 1.148882, 1, 1, 1, 1, 1,
-0.2290078, 0.1502562, -1.885818, 1, 1, 1, 1, 1,
-0.2283975, 0.1609826, -1.759386, 1, 1, 1, 1, 1,
-0.2255895, 0.6338316, -0.8333776, 1, 1, 1, 1, 1,
-0.2248799, -1.654283, -3.792335, 1, 1, 1, 1, 1,
-0.2193333, 0.7752244, 0.01981295, 1, 1, 1, 1, 1,
-0.2184691, 1.022878, -1.05818, 1, 1, 1, 1, 1,
-0.2176232, 0.6471283, -0.7380422, 1, 1, 1, 1, 1,
-0.2134142, 0.5131854, -0.5031409, 1, 1, 1, 1, 1,
-0.2127414, 0.4794215, -0.7759608, 1, 1, 1, 1, 1,
-0.2087415, 0.3607035, -0.05701444, 1, 1, 1, 1, 1,
-0.2083871, -0.211844, -2.406403, 1, 1, 1, 1, 1,
-0.2067935, 0.2614383, -1.430681, 1, 1, 1, 1, 1,
-0.2067686, 1.257806, -1.235122, 1, 1, 1, 1, 1,
-0.2027036, -0.2189442, -4.030598, 1, 1, 1, 1, 1,
-0.2026001, -1.153592, -1.611318, 0, 0, 1, 1, 1,
-0.2020427, 0.5268306, 0.9896922, 1, 0, 0, 1, 1,
-0.20169, -1.732198, -2.96278, 1, 0, 0, 1, 1,
-0.1886432, -1.795714, -2.332726, 1, 0, 0, 1, 1,
-0.1876279, -1.206482, -2.622251, 1, 0, 0, 1, 1,
-0.1866864, -0.07718537, 0.2288164, 1, 0, 0, 1, 1,
-0.1840899, -1.474516, -1.494184, 0, 0, 0, 1, 1,
-0.1835819, 0.9119822, -0.00324503, 0, 0, 0, 1, 1,
-0.1822733, 1.887346, 0.531601, 0, 0, 0, 1, 1,
-0.1765521, 0.4894477, -2.30086, 0, 0, 0, 1, 1,
-0.1754769, -0.2577694, -2.611874, 0, 0, 0, 1, 1,
-0.1737355, -0.911729, -3.063615, 0, 0, 0, 1, 1,
-0.1727583, 0.1408071, -1.249413, 0, 0, 0, 1, 1,
-0.1715496, 0.375792, -1.052533, 1, 1, 1, 1, 1,
-0.1700082, -0.9221595, -2.945323, 1, 1, 1, 1, 1,
-0.1581393, -1.085874, -3.514567, 1, 1, 1, 1, 1,
-0.1527911, -0.08626956, -3.260099, 1, 1, 1, 1, 1,
-0.1526483, -0.9053487, -3.184501, 1, 1, 1, 1, 1,
-0.1497011, -0.0396438, -3.841351, 1, 1, 1, 1, 1,
-0.1463375, -0.8202159, -2.69287, 1, 1, 1, 1, 1,
-0.1452238, 2.084182, -0.1813236, 1, 1, 1, 1, 1,
-0.1451688, 2.134833, -1.387121, 1, 1, 1, 1, 1,
-0.1430228, 1.227659, 0.2793917, 1, 1, 1, 1, 1,
-0.1397918, -0.6046072, -4.033266, 1, 1, 1, 1, 1,
-0.1305049, 1.649359, 1.163625, 1, 1, 1, 1, 1,
-0.1290485, 0.632443, -0.947322, 1, 1, 1, 1, 1,
-0.1290074, -1.688911, -2.937968, 1, 1, 1, 1, 1,
-0.1267531, -0.1337398, -3.591569, 1, 1, 1, 1, 1,
-0.1261273, -1.456718, -3.773021, 0, 0, 1, 1, 1,
-0.1246244, -0.05368157, -4.679932, 1, 0, 0, 1, 1,
-0.1227017, 0.7305455, -0.205344, 1, 0, 0, 1, 1,
-0.1195946, -0.5101482, -2.183245, 1, 0, 0, 1, 1,
-0.1163358, 0.1237257, -0.7961985, 1, 0, 0, 1, 1,
-0.1134523, 0.9095162, -0.2468333, 1, 0, 0, 1, 1,
-0.1116646, -0.3213691, -2.512641, 0, 0, 0, 1, 1,
-0.1108869, 0.8073274, 0.5170939, 0, 0, 0, 1, 1,
-0.1087615, -0.9727356, -5.697454, 0, 0, 0, 1, 1,
-0.1087523, -1.302817, -1.111009, 0, 0, 0, 1, 1,
-0.1063638, 0.9877846, 1.721052, 0, 0, 0, 1, 1,
-0.09991346, 1.024855, -1.008857, 0, 0, 0, 1, 1,
-0.09926801, -0.08106259, -2.980116, 0, 0, 0, 1, 1,
-0.09321292, -0.5214617, -3.879427, 1, 1, 1, 1, 1,
-0.09289416, -0.006198039, -2.080469, 1, 1, 1, 1, 1,
-0.09213137, 0.1928691, -0.5887482, 1, 1, 1, 1, 1,
-0.09067828, 1.306877, 1.806212, 1, 1, 1, 1, 1,
-0.08801322, -0.01719857, -3.035389, 1, 1, 1, 1, 1,
-0.08240724, 0.9952867, 0.7447132, 1, 1, 1, 1, 1,
-0.08237356, 1.374914, 1.27078, 1, 1, 1, 1, 1,
-0.08013711, 0.6923183, 0.3069707, 1, 1, 1, 1, 1,
-0.07424864, -0.1973602, -2.726474, 1, 1, 1, 1, 1,
-0.07254583, 0.4409111, -0.6891822, 1, 1, 1, 1, 1,
-0.05973607, 2.507952, -0.2045668, 1, 1, 1, 1, 1,
-0.05850307, 0.890494, -0.7828127, 1, 1, 1, 1, 1,
-0.05553404, -0.48658, -2.74693, 1, 1, 1, 1, 1,
-0.05304771, -1.081409, -2.416843, 1, 1, 1, 1, 1,
-0.05026341, 0.6367007, -0.8471861, 1, 1, 1, 1, 1,
-0.04996712, 0.2501893, 0.5573595, 0, 0, 1, 1, 1,
-0.0456027, 0.9203872, 0.5574576, 1, 0, 0, 1, 1,
-0.03888256, -0.5876263, -3.736808, 1, 0, 0, 1, 1,
-0.03559672, -0.308779, -4.045794, 1, 0, 0, 1, 1,
-0.03504584, -0.1808608, -5.356341, 1, 0, 0, 1, 1,
-0.03205125, -0.3648071, -5.665624, 1, 0, 0, 1, 1,
-0.02736224, 0.8879998, 0.07420252, 0, 0, 0, 1, 1,
-0.02711043, 1.061698, -2.547235, 0, 0, 0, 1, 1,
-0.02690547, -0.1171815, -2.206135, 0, 0, 0, 1, 1,
-0.02674421, 1.600032, -0.7239964, 0, 0, 0, 1, 1,
-0.02312495, 2.546378, -2.02457, 0, 0, 0, 1, 1,
-0.02224692, -0.7295485, -2.841849, 0, 0, 0, 1, 1,
-0.019899, 0.8624606, 0.3210016, 0, 0, 0, 1, 1,
-0.0198807, 0.6858743, -0.9346748, 1, 1, 1, 1, 1,
-0.0174225, 0.1593036, 0.281323, 1, 1, 1, 1, 1,
-0.01145, -1.054129, -4.234416, 1, 1, 1, 1, 1,
-0.01003565, -0.3144141, -3.831185, 1, 1, 1, 1, 1,
-0.009123511, 0.1445299, -0.1328359, 1, 1, 1, 1, 1,
-0.009001283, -0.9590477, -4.665363, 1, 1, 1, 1, 1,
-0.00817478, 0.09491958, -0.06675081, 1, 1, 1, 1, 1,
-0.006926856, 0.2026595, 0.8890899, 1, 1, 1, 1, 1,
-0.006555787, -0.6834429, -2.500193, 1, 1, 1, 1, 1,
-0.00515448, 0.2942014, 1.316748, 1, 1, 1, 1, 1,
-0.001701665, -0.3197525, -4.280329, 1, 1, 1, 1, 1,
0.0006136051, -0.3021611, 3.594366, 1, 1, 1, 1, 1,
0.001783843, -0.5713086, 3.276611, 1, 1, 1, 1, 1,
0.002546358, 0.4397693, -0.06441558, 1, 1, 1, 1, 1,
0.003035792, 1.836319, -1.172125, 1, 1, 1, 1, 1,
0.005088836, 1.217849, -0.3570998, 0, 0, 1, 1, 1,
0.005170962, 1.088959, -0.4963765, 1, 0, 0, 1, 1,
0.005547902, 0.4508661, 1.033677, 1, 0, 0, 1, 1,
0.005753177, 1.405264, 2.763828, 1, 0, 0, 1, 1,
0.009205417, 0.2657419, 0.6696316, 1, 0, 0, 1, 1,
0.01121478, -1.082783, 1.368799, 1, 0, 0, 1, 1,
0.01482083, 1.145935, 0.6166135, 0, 0, 0, 1, 1,
0.01633167, 2.01964, -2.817208, 0, 0, 0, 1, 1,
0.0172047, 1.079849, 0.7672368, 0, 0, 0, 1, 1,
0.02055168, -1.744222, 4.33268, 0, 0, 0, 1, 1,
0.03435172, 1.668284, -1.344288, 0, 0, 0, 1, 1,
0.03436923, 0.7772273, -1.176031, 0, 0, 0, 1, 1,
0.03447366, -0.3110517, 2.435945, 0, 0, 0, 1, 1,
0.03897924, 1.094628, 0.5256419, 1, 1, 1, 1, 1,
0.04095845, 0.6479058, 0.4396438, 1, 1, 1, 1, 1,
0.04123581, 0.7278095, -0.4524075, 1, 1, 1, 1, 1,
0.04407149, -0.9735283, 2.380737, 1, 1, 1, 1, 1,
0.04870407, -1.264474, 3.674414, 1, 1, 1, 1, 1,
0.04961376, 0.283429, -0.3673971, 1, 1, 1, 1, 1,
0.05025684, -0.8632634, 1.888177, 1, 1, 1, 1, 1,
0.05271138, -0.7995684, 3.065027, 1, 1, 1, 1, 1,
0.05272848, 0.5913097, -0.7774454, 1, 1, 1, 1, 1,
0.06055792, 1.002881, -1.147236, 1, 1, 1, 1, 1,
0.06320256, 1.054819, -1.436475, 1, 1, 1, 1, 1,
0.06403764, 1.008989, -2.157921, 1, 1, 1, 1, 1,
0.06722444, 0.5277975, -0.8056724, 1, 1, 1, 1, 1,
0.06757114, -0.4304766, 1.805408, 1, 1, 1, 1, 1,
0.07111797, -0.9431109, 3.081422, 1, 1, 1, 1, 1,
0.0772499, -0.01307059, 2.513654, 0, 0, 1, 1, 1,
0.08256423, -0.5428663, 3.547715, 1, 0, 0, 1, 1,
0.08306161, -0.07177375, 0.5629315, 1, 0, 0, 1, 1,
0.08931969, -1.559587, 3.919437, 1, 0, 0, 1, 1,
0.09119002, -0.1484827, 3.715137, 1, 0, 0, 1, 1,
0.09138034, -0.3049513, 0.5324693, 1, 0, 0, 1, 1,
0.09249104, 0.2768767, -1.234399, 0, 0, 0, 1, 1,
0.09281636, -0.2752828, 2.154891, 0, 0, 0, 1, 1,
0.09293105, -0.6612557, 3.99577, 0, 0, 0, 1, 1,
0.09406306, 0.1463616, 0.2047516, 0, 0, 0, 1, 1,
0.09759779, 0.2310421, -0.2467197, 0, 0, 0, 1, 1,
0.0984893, 1.475111, 0.3853241, 0, 0, 0, 1, 1,
0.09867368, -0.5429269, 3.969875, 0, 0, 0, 1, 1,
0.09881473, 1.030643, -0.580219, 1, 1, 1, 1, 1,
0.1003992, 1.793378, -1.095896, 1, 1, 1, 1, 1,
0.1006038, 1.957149, -2.124866, 1, 1, 1, 1, 1,
0.1012879, 1.992209, -0.03061441, 1, 1, 1, 1, 1,
0.1056846, 1.75496, 1.011197, 1, 1, 1, 1, 1,
0.1080736, 0.4726645, -0.4614907, 1, 1, 1, 1, 1,
0.1083115, 2.570927, -1.849096, 1, 1, 1, 1, 1,
0.1083535, -0.6357327, 2.835129, 1, 1, 1, 1, 1,
0.1131597, 0.5648236, 1.120327, 1, 1, 1, 1, 1,
0.1132443, -0.4855537, 2.208389, 1, 1, 1, 1, 1,
0.1135582, 1.025348, -0.2135504, 1, 1, 1, 1, 1,
0.1144663, -0.4899995, 2.759629, 1, 1, 1, 1, 1,
0.1182332, 1.064397, -0.732408, 1, 1, 1, 1, 1,
0.1204066, 0.5094398, 0.9316972, 1, 1, 1, 1, 1,
0.1241388, -0.05608357, 2.925732, 1, 1, 1, 1, 1,
0.1278288, -1.212755, 3.055851, 0, 0, 1, 1, 1,
0.1301732, 0.003244358, 0.6020457, 1, 0, 0, 1, 1,
0.1356902, -0.260542, 3.745078, 1, 0, 0, 1, 1,
0.1398947, -1.24682, 2.801429, 1, 0, 0, 1, 1,
0.1403291, 0.6615489, -0.237908, 1, 0, 0, 1, 1,
0.1430877, 0.3779932, -0.4401193, 1, 0, 0, 1, 1,
0.1442714, -0.8350033, 2.426017, 0, 0, 0, 1, 1,
0.1442783, -0.2330321, 3.617963, 0, 0, 0, 1, 1,
0.1453793, -2.32197, 2.440498, 0, 0, 0, 1, 1,
0.146661, -0.5573496, 2.869032, 0, 0, 0, 1, 1,
0.1569115, -0.3640761, 2.457899, 0, 0, 0, 1, 1,
0.1601377, -0.2070717, 3.531745, 0, 0, 0, 1, 1,
0.1628658, -1.492126, 1.713466, 0, 0, 0, 1, 1,
0.1634309, 0.3306582, 0.6973709, 1, 1, 1, 1, 1,
0.1635401, -0.6017048, 3.054575, 1, 1, 1, 1, 1,
0.1713238, -0.4636365, 0.8464039, 1, 1, 1, 1, 1,
0.1723531, 0.1360955, 1.213551, 1, 1, 1, 1, 1,
0.1757495, 0.4244832, -0.09162592, 1, 1, 1, 1, 1,
0.1765073, -1.509621, 2.590569, 1, 1, 1, 1, 1,
0.1774902, 0.09262325, 0.3330155, 1, 1, 1, 1, 1,
0.1789263, -0.9713788, 2.523347, 1, 1, 1, 1, 1,
0.1803724, -0.7437923, 3.490117, 1, 1, 1, 1, 1,
0.1817643, 0.0221596, -0.04948096, 1, 1, 1, 1, 1,
0.1838563, -0.3025046, 2.71567, 1, 1, 1, 1, 1,
0.1918392, 0.2953949, 0.2671096, 1, 1, 1, 1, 1,
0.1940714, -1.055893, 2.542976, 1, 1, 1, 1, 1,
0.1943503, 1.600407, 0.8173438, 1, 1, 1, 1, 1,
0.1965314, 0.1607727, 2.092664, 1, 1, 1, 1, 1,
0.1973414, -0.4571647, 3.481434, 0, 0, 1, 1, 1,
0.1996466, -0.06798524, 0.7354881, 1, 0, 0, 1, 1,
0.2000901, 1.612478, 0.6264192, 1, 0, 0, 1, 1,
0.2059964, 0.8520997, 0.9200212, 1, 0, 0, 1, 1,
0.206037, 1.45704, -0.3158573, 1, 0, 0, 1, 1,
0.2089757, -0.8927594, 2.514354, 1, 0, 0, 1, 1,
0.2112751, -0.5589559, 2.412093, 0, 0, 0, 1, 1,
0.2128584, -0.03216223, 2.518404, 0, 0, 0, 1, 1,
0.2129116, 0.5456599, -0.6801426, 0, 0, 0, 1, 1,
0.2156005, -0.1045039, 1.317102, 0, 0, 0, 1, 1,
0.2164245, -0.244337, 1.792902, 0, 0, 0, 1, 1,
0.2184367, 0.5129992, -1.220601, 0, 0, 0, 1, 1,
0.2194028, 0.02628383, 2.466471, 0, 0, 0, 1, 1,
0.2231972, -1.773598, 4.629416, 1, 1, 1, 1, 1,
0.2309348, 0.02966725, 2.087494, 1, 1, 1, 1, 1,
0.2331508, 0.08600923, 0.3188217, 1, 1, 1, 1, 1,
0.2386603, -0.1422712, 3.117341, 1, 1, 1, 1, 1,
0.2398542, -0.8290397, 3.729206, 1, 1, 1, 1, 1,
0.2401523, -0.1244039, 1.274747, 1, 1, 1, 1, 1,
0.2409308, -1.846218, 2.551036, 1, 1, 1, 1, 1,
0.2411475, -1.291563, 2.506031, 1, 1, 1, 1, 1,
0.2412452, -0.09214045, 1.518294, 1, 1, 1, 1, 1,
0.2413482, -2.094003, 3.986875, 1, 1, 1, 1, 1,
0.2462464, 0.01347962, 1.708289, 1, 1, 1, 1, 1,
0.2463166, 2.27221, -0.6132103, 1, 1, 1, 1, 1,
0.254836, 1.379582, -0.9791137, 1, 1, 1, 1, 1,
0.2598148, -0.2493066, 2.056285, 1, 1, 1, 1, 1,
0.26269, 0.6580439, 0.3895774, 1, 1, 1, 1, 1,
0.2628373, -0.5173696, 3.339612, 0, 0, 1, 1, 1,
0.2633868, 0.4038989, 1.825799, 1, 0, 0, 1, 1,
0.2675374, -0.1317056, 1.055251, 1, 0, 0, 1, 1,
0.2709283, 0.3533975, 0.1186207, 1, 0, 0, 1, 1,
0.273018, -0.3329765, 3.096438, 1, 0, 0, 1, 1,
0.2781404, 1.220855, -1.020289, 1, 0, 0, 1, 1,
0.2827396, -0.2818419, 3.276507, 0, 0, 0, 1, 1,
0.2835341, -0.4778769, 1.070009, 0, 0, 0, 1, 1,
0.2838685, -1.41762, 3.181559, 0, 0, 0, 1, 1,
0.2849371, 0.1828315, 1.546708, 0, 0, 0, 1, 1,
0.2939086, -0.6048254, 4.162382, 0, 0, 0, 1, 1,
0.2954283, -1.831155, 3.164861, 0, 0, 0, 1, 1,
0.3035088, -1.226851, 2.296561, 0, 0, 0, 1, 1,
0.3068716, -1.489455, 2.703709, 1, 1, 1, 1, 1,
0.3084382, 0.8024769, -0.6368412, 1, 1, 1, 1, 1,
0.3146732, -0.8563604, 3.578469, 1, 1, 1, 1, 1,
0.3148276, 1.358283, 0.9260417, 1, 1, 1, 1, 1,
0.318353, -0.4488884, 0.3607204, 1, 1, 1, 1, 1,
0.3191262, 0.7126595, -0.1841284, 1, 1, 1, 1, 1,
0.3195731, -1.404266, 3.64583, 1, 1, 1, 1, 1,
0.3228058, 0.5576437, 1.062076, 1, 1, 1, 1, 1,
0.3240582, -2.533866, 3.26463, 1, 1, 1, 1, 1,
0.3277668, 1.532956, 1.367386, 1, 1, 1, 1, 1,
0.3292739, -0.1748391, 1.810098, 1, 1, 1, 1, 1,
0.3293521, -1.821216, 3.811875, 1, 1, 1, 1, 1,
0.335586, 0.7923177, 0.2111275, 1, 1, 1, 1, 1,
0.3382584, -0.9875654, 2.969806, 1, 1, 1, 1, 1,
0.3386956, 0.1032848, 0.2624649, 1, 1, 1, 1, 1,
0.3410875, -1.288807, 4.372662, 0, 0, 1, 1, 1,
0.3421628, -1.000928, 2.944629, 1, 0, 0, 1, 1,
0.3480423, -0.06325106, 1.255873, 1, 0, 0, 1, 1,
0.3497162, 0.444331, 1.684943, 1, 0, 0, 1, 1,
0.3509351, -0.6211913, 2.778574, 1, 0, 0, 1, 1,
0.3562959, -0.6887325, 2.260789, 1, 0, 0, 1, 1,
0.3568233, -1.297083, 1.137901, 0, 0, 0, 1, 1,
0.3598159, 0.1173794, 0.9234034, 0, 0, 0, 1, 1,
0.3609549, 0.752232, -1.076919, 0, 0, 0, 1, 1,
0.3655059, -0.3783442, 1.430508, 0, 0, 0, 1, 1,
0.3662426, -0.2647368, 2.49093, 0, 0, 0, 1, 1,
0.3675593, -1.352118, 2.481637, 0, 0, 0, 1, 1,
0.3680439, 0.2044743, 1.353422, 0, 0, 0, 1, 1,
0.3688306, -0.4408928, 2.571579, 1, 1, 1, 1, 1,
0.3724055, 0.7456316, -1.078479, 1, 1, 1, 1, 1,
0.3729843, -0.358288, 0.9649999, 1, 1, 1, 1, 1,
0.3746073, 2.74392, 0.2029499, 1, 1, 1, 1, 1,
0.3767787, 1.509091, 0.1993932, 1, 1, 1, 1, 1,
0.3792848, -1.039673, 1.727718, 1, 1, 1, 1, 1,
0.3814714, -0.6118895, 1.627088, 1, 1, 1, 1, 1,
0.3824688, 0.405698, 0.02017691, 1, 1, 1, 1, 1,
0.3825612, -1.210029, 2.724057, 1, 1, 1, 1, 1,
0.3844525, 0.3884128, 0.4066835, 1, 1, 1, 1, 1,
0.3864595, -0.2808985, 0.7005647, 1, 1, 1, 1, 1,
0.3904901, 0.7041995, 0.37168, 1, 1, 1, 1, 1,
0.3916069, -0.334419, 1.661205, 1, 1, 1, 1, 1,
0.393038, 2.31266, -2.369681, 1, 1, 1, 1, 1,
0.3938573, -0.02484745, 2.769041, 1, 1, 1, 1, 1,
0.3951191, -0.4006958, 2.196858, 0, 0, 1, 1, 1,
0.3976538, 0.0241137, 1.353492, 1, 0, 0, 1, 1,
0.3978356, -1.089503, 2.500613, 1, 0, 0, 1, 1,
0.3986364, 0.7845718, 1.440233, 1, 0, 0, 1, 1,
0.398723, 0.1409409, 0.2331932, 1, 0, 0, 1, 1,
0.4024916, -0.8154101, 1.670406, 1, 0, 0, 1, 1,
0.4045358, -0.05762009, 0.9423945, 0, 0, 0, 1, 1,
0.4076836, -0.2219464, 4.214955, 0, 0, 0, 1, 1,
0.4077695, 0.4652355, -0.9071268, 0, 0, 0, 1, 1,
0.4101974, -0.4911126, 4.515182, 0, 0, 0, 1, 1,
0.4117253, 1.241702, 1.355265, 0, 0, 0, 1, 1,
0.4122391, 0.4576148, 0.921867, 0, 0, 0, 1, 1,
0.4128033, -0.9362725, 2.38608, 0, 0, 0, 1, 1,
0.4162774, -1.28025, 3.023933, 1, 1, 1, 1, 1,
0.4190057, -1.227749, 1.774855, 1, 1, 1, 1, 1,
0.4202094, 0.1901062, 0.2078915, 1, 1, 1, 1, 1,
0.4230537, -1.033642, 1.699865, 1, 1, 1, 1, 1,
0.4241216, 1.339804, 0.3059605, 1, 1, 1, 1, 1,
0.4329195, 1.116799, 0.006866285, 1, 1, 1, 1, 1,
0.441176, -0.8976852, 4.409787, 1, 1, 1, 1, 1,
0.4426734, 1.313623, 1.057235, 1, 1, 1, 1, 1,
0.4436302, 0.1289239, 1.382033, 1, 1, 1, 1, 1,
0.443688, 0.2516427, 1.322867, 1, 1, 1, 1, 1,
0.4439369, -0.4409625, 3.573385, 1, 1, 1, 1, 1,
0.4442696, 0.1085119, 0.5252041, 1, 1, 1, 1, 1,
0.446111, 2.610923, 1.199611, 1, 1, 1, 1, 1,
0.4643827, -0.3454284, 1.031371, 1, 1, 1, 1, 1,
0.464976, -0.1434178, 2.056299, 1, 1, 1, 1, 1,
0.4689558, -0.0248361, 2.181244, 0, 0, 1, 1, 1,
0.473399, -0.983834, 3.540703, 1, 0, 0, 1, 1,
0.4743889, -0.715276, 2.126454, 1, 0, 0, 1, 1,
0.4799186, 0.04578015, 1.18393, 1, 0, 0, 1, 1,
0.4974841, -0.003501752, 0.5483083, 1, 0, 0, 1, 1,
0.5072898, 1.967507, 0.7373263, 1, 0, 0, 1, 1,
0.5105507, 0.05933544, 1.0612, 0, 0, 0, 1, 1,
0.5112679, 0.4357174, 1.365407, 0, 0, 0, 1, 1,
0.5121019, -0.5702731, 1.316971, 0, 0, 0, 1, 1,
0.5164569, -0.4071786, 2.344833, 0, 0, 0, 1, 1,
0.5187859, 0.8535427, -0.3719941, 0, 0, 0, 1, 1,
0.5213453, -0.9604775, 1.613862, 0, 0, 0, 1, 1,
0.5242647, -1.893103, 2.757896, 0, 0, 0, 1, 1,
0.5282746, 0.4564298, 0.448034, 1, 1, 1, 1, 1,
0.528363, -1.037578, 2.677138, 1, 1, 1, 1, 1,
0.5309564, -2.361276, 2.087548, 1, 1, 1, 1, 1,
0.5311686, -2.148202, 3.291358, 1, 1, 1, 1, 1,
0.5320463, -0.4777715, 1.56099, 1, 1, 1, 1, 1,
0.5334454, 0.5822474, 0.5468199, 1, 1, 1, 1, 1,
0.5348246, 0.2541573, -0.6957679, 1, 1, 1, 1, 1,
0.5348552, -1.443855, 3.773278, 1, 1, 1, 1, 1,
0.5384297, -0.02069548, 4.258956, 1, 1, 1, 1, 1,
0.5439448, 0.558637, 0.4601249, 1, 1, 1, 1, 1,
0.5446923, -1.206057, 2.795375, 1, 1, 1, 1, 1,
0.5489721, 0.8771815, 0.05897892, 1, 1, 1, 1, 1,
0.5512267, 0.5228928, 0.7416807, 1, 1, 1, 1, 1,
0.5524577, 1.991611, -0.6437653, 1, 1, 1, 1, 1,
0.5528408, 1.001602, 2.560923, 1, 1, 1, 1, 1,
0.5529796, -1.045585, 3.721858, 0, 0, 1, 1, 1,
0.5537213, -0.4850184, 2.489211, 1, 0, 0, 1, 1,
0.5558571, -1.768223, 1.456848, 1, 0, 0, 1, 1,
0.5579355, 0.1961011, 0.07417793, 1, 0, 0, 1, 1,
0.558284, -0.2049321, 1.581763, 1, 0, 0, 1, 1,
0.5602771, -1.175054, 2.503507, 1, 0, 0, 1, 1,
0.5742834, -1.319522, 2.167009, 0, 0, 0, 1, 1,
0.5754716, 0.9299501, 2.114375, 0, 0, 0, 1, 1,
0.5818571, 0.04908267, 0.8985418, 0, 0, 0, 1, 1,
0.5899913, -1.074467, 2.111435, 0, 0, 0, 1, 1,
0.5945198, -0.9521538, 3.285693, 0, 0, 0, 1, 1,
0.5966523, 1.712887, 0.3933557, 0, 0, 0, 1, 1,
0.5995159, -1.732804, 1.094938, 0, 0, 0, 1, 1,
0.6003343, 0.1529698, 2.104836, 1, 1, 1, 1, 1,
0.6023871, -0.6137759, 2.197989, 1, 1, 1, 1, 1,
0.6039701, -0.1488413, 0.04407625, 1, 1, 1, 1, 1,
0.6061237, 0.9438554, 0.941815, 1, 1, 1, 1, 1,
0.6124077, 1.038705, 0.23584, 1, 1, 1, 1, 1,
0.6127985, 0.3555002, 0.3761934, 1, 1, 1, 1, 1,
0.6143369, -0.5785199, 2.968158, 1, 1, 1, 1, 1,
0.6162692, 0.8225397, -0.4042588, 1, 1, 1, 1, 1,
0.6214784, -2.383065, 3.648946, 1, 1, 1, 1, 1,
0.6221274, -1.721455, 2.160623, 1, 1, 1, 1, 1,
0.6323841, 0.7756715, -0.7075009, 1, 1, 1, 1, 1,
0.6378216, 1.001632, 0.07264628, 1, 1, 1, 1, 1,
0.6381062, -0.6700354, 3.659017, 1, 1, 1, 1, 1,
0.6415316, -0.06747925, 2.010851, 1, 1, 1, 1, 1,
0.6486406, 0.8535277, 1.288791, 1, 1, 1, 1, 1,
0.6486989, 0.4438806, 0.7220575, 0, 0, 1, 1, 1,
0.6516564, -0.08376434, 0.7899751, 1, 0, 0, 1, 1,
0.6553051, 0.5164626, 0.2959155, 1, 0, 0, 1, 1,
0.6563249, -0.8377164, 2.902737, 1, 0, 0, 1, 1,
0.6593776, 0.2098554, 1.606791, 1, 0, 0, 1, 1,
0.6731199, 1.391673, -0.1565278, 1, 0, 0, 1, 1,
0.681242, 1.918294, -0.6668108, 0, 0, 0, 1, 1,
0.6827964, 1.444177, -0.1608239, 0, 0, 0, 1, 1,
0.6886499, 0.4966303, 1.624458, 0, 0, 0, 1, 1,
0.6906034, -0.8246847, 3.692158, 0, 0, 0, 1, 1,
0.6911809, -0.2267958, 1.394121, 0, 0, 0, 1, 1,
0.6920424, -1.000323, 3.238557, 0, 0, 0, 1, 1,
0.7005884, 0.3185009, 2.159458, 0, 0, 0, 1, 1,
0.7011911, 0.9982175, -1.260225, 1, 1, 1, 1, 1,
0.7085863, 0.05663438, -0.1294716, 1, 1, 1, 1, 1,
0.7089249, -1.333475, 3.40451, 1, 1, 1, 1, 1,
0.7092662, -1.202292, 1.560225, 1, 1, 1, 1, 1,
0.7094522, -1.471883, 2.014861, 1, 1, 1, 1, 1,
0.7098649, -0.1064173, 1.212766, 1, 1, 1, 1, 1,
0.7218338, 1.275012, -0.3641296, 1, 1, 1, 1, 1,
0.7247646, -0.91308, 2.76166, 1, 1, 1, 1, 1,
0.7259015, -0.3616416, 2.82007, 1, 1, 1, 1, 1,
0.7264604, -1.182559, 3.325142, 1, 1, 1, 1, 1,
0.7397127, -1.156195, 3.548964, 1, 1, 1, 1, 1,
0.7442131, -0.3584924, 3.302393, 1, 1, 1, 1, 1,
0.7453934, -0.1358712, 2.122712, 1, 1, 1, 1, 1,
0.745961, 0.3077855, 3.173064, 1, 1, 1, 1, 1,
0.7499408, -0.1275291, 0.7296364, 1, 1, 1, 1, 1,
0.7500461, -1.779781, 1.474738, 0, 0, 1, 1, 1,
0.7505482, 0.4724933, 2.01284, 1, 0, 0, 1, 1,
0.7517478, 0.1142728, 0.3538644, 1, 0, 0, 1, 1,
0.7521294, 0.9134701, 0.008744623, 1, 0, 0, 1, 1,
0.7544136, -1.807525, 3.056502, 1, 0, 0, 1, 1,
0.7558098, -0.1868021, 2.044539, 1, 0, 0, 1, 1,
0.7593454, 0.2521928, 2.520138, 0, 0, 0, 1, 1,
0.7605445, -0.3748128, 0.09287638, 0, 0, 0, 1, 1,
0.7618752, -0.0913948, 0.652822, 0, 0, 0, 1, 1,
0.7647905, 0.1491777, 1.715684, 0, 0, 0, 1, 1,
0.7681445, -0.7410489, 3.075622, 0, 0, 0, 1, 1,
0.7682507, -1.08742, 0.908438, 0, 0, 0, 1, 1,
0.768862, 1.426985, 1.163591, 0, 0, 0, 1, 1,
0.7722517, -0.4418369, 3.485729, 1, 1, 1, 1, 1,
0.7768202, -0.2298655, 4.012065, 1, 1, 1, 1, 1,
0.7793479, -2.315102, 3.169363, 1, 1, 1, 1, 1,
0.780556, 0.07733899, 2.257032, 1, 1, 1, 1, 1,
0.7828451, -0.711495, 0.05249107, 1, 1, 1, 1, 1,
0.7857007, 0.3903798, 0.101442, 1, 1, 1, 1, 1,
0.7892082, -0.6998044, 3.055943, 1, 1, 1, 1, 1,
0.7912724, 0.818527, 0.9197845, 1, 1, 1, 1, 1,
0.7969791, -0.5263652, -0.1842577, 1, 1, 1, 1, 1,
0.7990651, 0.4263166, 0.3221072, 1, 1, 1, 1, 1,
0.8034928, -0.1049092, 1.711918, 1, 1, 1, 1, 1,
0.8036723, -0.514521, 1.712669, 1, 1, 1, 1, 1,
0.8043852, -0.7473011, 4.297104, 1, 1, 1, 1, 1,
0.8047211, -1.684791, 1.7621, 1, 1, 1, 1, 1,
0.814673, -0.3676043, 0.7996411, 1, 1, 1, 1, 1,
0.8162178, 0.8983014, 0.6287054, 0, 0, 1, 1, 1,
0.8164909, -1.070712, 2.073127, 1, 0, 0, 1, 1,
0.8192691, 0.6079435, 3.104152, 1, 0, 0, 1, 1,
0.8260464, 1.9072, 1.351432, 1, 0, 0, 1, 1,
0.8285158, -0.3940639, 2.359452, 1, 0, 0, 1, 1,
0.8329529, -0.5775906, 3.62821, 1, 0, 0, 1, 1,
0.8380375, 0.2117692, 1.908311, 0, 0, 0, 1, 1,
0.8409063, -0.7724813, 1.542479, 0, 0, 0, 1, 1,
0.851465, -0.909136, 2.833215, 0, 0, 0, 1, 1,
0.852828, 0.4886482, 0.6327856, 0, 0, 0, 1, 1,
0.8579211, -0.789018, 2.194019, 0, 0, 0, 1, 1,
0.8600412, -0.7703825, 1.687144, 0, 0, 0, 1, 1,
0.8605646, -1.314433, 2.955075, 0, 0, 0, 1, 1,
0.8630467, -0.2801912, 1.461506, 1, 1, 1, 1, 1,
0.8664752, -1.08412, 2.731778, 1, 1, 1, 1, 1,
0.8716601, 0.4423745, 2.138887, 1, 1, 1, 1, 1,
0.8972829, -0.1716096, 0.9293088, 1, 1, 1, 1, 1,
0.9006975, 1.257663, 2.419078, 1, 1, 1, 1, 1,
0.9047215, -0.937961, 2.147087, 1, 1, 1, 1, 1,
0.9083287, 0.3476913, 1.845834, 1, 1, 1, 1, 1,
0.9095797, -0.6781591, 0.473361, 1, 1, 1, 1, 1,
0.9109568, 1.43408, 0.8563062, 1, 1, 1, 1, 1,
0.914228, 2.871256, 0.2092148, 1, 1, 1, 1, 1,
0.914744, 0.2040112, 0.5519555, 1, 1, 1, 1, 1,
0.9234658, -0.467802, 1.284668, 1, 1, 1, 1, 1,
0.9253123, 0.0236487, 4.108232, 1, 1, 1, 1, 1,
0.9285964, 1.237478, -1.499731, 1, 1, 1, 1, 1,
0.9290466, -0.08778134, 2.994915, 1, 1, 1, 1, 1,
0.9342604, -0.4101649, 0.6964602, 0, 0, 1, 1, 1,
0.9376317, -0.53284, 0.04433203, 1, 0, 0, 1, 1,
0.9414033, -1.221928, 2.92056, 1, 0, 0, 1, 1,
0.941577, 1.220085, 1.415277, 1, 0, 0, 1, 1,
0.9432739, -0.08838376, 1.161778, 1, 0, 0, 1, 1,
0.9436551, -0.6058697, 1.843976, 1, 0, 0, 1, 1,
0.9456588, 0.7858616, 1.851315, 0, 0, 0, 1, 1,
0.9466531, -2.129082, 2.838759, 0, 0, 0, 1, 1,
0.9483212, -0.06841458, 2.726804, 0, 0, 0, 1, 1,
0.954829, 0.003493723, 3.263019, 0, 0, 0, 1, 1,
0.9574047, 0.03718642, 2.103167, 0, 0, 0, 1, 1,
0.9583652, -0.7002363, 1.234464, 0, 0, 0, 1, 1,
0.9616674, 0.6146941, 3.229814, 0, 0, 0, 1, 1,
0.9631654, -0.2039222, 1.567784, 1, 1, 1, 1, 1,
0.9656276, 1.241701, 1.287795, 1, 1, 1, 1, 1,
0.9675255, 1.238804, -1.276627, 1, 1, 1, 1, 1,
0.968555, -1.109788, 3.209189, 1, 1, 1, 1, 1,
0.9688466, 1.140477, 0.08599403, 1, 1, 1, 1, 1,
0.9822624, 0.7621761, 0.1676572, 1, 1, 1, 1, 1,
1.000479, 0.4325883, 2.804825, 1, 1, 1, 1, 1,
1.002068, 0.3443755, -0.5774877, 1, 1, 1, 1, 1,
1.007285, -0.6794168, 3.105047, 1, 1, 1, 1, 1,
1.007879, 0.2871234, 2.79296, 1, 1, 1, 1, 1,
1.012797, -0.2775874, 1.411272, 1, 1, 1, 1, 1,
1.017957, -1.792591, 4.325129, 1, 1, 1, 1, 1,
1.025173, 0.8363525, 0.8027399, 1, 1, 1, 1, 1,
1.026875, -0.1918744, 1.156004, 1, 1, 1, 1, 1,
1.026922, 0.1235631, 0.6962698, 1, 1, 1, 1, 1,
1.027871, 0.002782321, 0.5392331, 0, 0, 1, 1, 1,
1.034086, 0.504213, 0.9794397, 1, 0, 0, 1, 1,
1.036677, -0.6548039, 1.757795, 1, 0, 0, 1, 1,
1.04481, 0.04063775, 3.895746, 1, 0, 0, 1, 1,
1.048084, 0.4707228, 0.7971784, 1, 0, 0, 1, 1,
1.053295, 0.9583898, 0.03861837, 1, 0, 0, 1, 1,
1.055862, -0.5547719, 1.94457, 0, 0, 0, 1, 1,
1.060097, -0.6314955, 1.996875, 0, 0, 0, 1, 1,
1.061529, 1.69837, 0.1270465, 0, 0, 0, 1, 1,
1.062332, -1.874011, 1.767943, 0, 0, 0, 1, 1,
1.076632, 0.2451364, 2.99564, 0, 0, 0, 1, 1,
1.0848, -0.2663274, 1.61735, 0, 0, 0, 1, 1,
1.091421, 1.190667, 1.480826, 0, 0, 0, 1, 1,
1.092918, -0.3628125, 0.4098224, 1, 1, 1, 1, 1,
1.098592, -0.1713137, 2.401875, 1, 1, 1, 1, 1,
1.106142, -0.733581, 3.216995, 1, 1, 1, 1, 1,
1.113207, -0.7032707, 3.050545, 1, 1, 1, 1, 1,
1.120005, 1.67508, -1.30556, 1, 1, 1, 1, 1,
1.12087, -0.9561813, 2.891851, 1, 1, 1, 1, 1,
1.122321, 0.1775679, -0.3866066, 1, 1, 1, 1, 1,
1.124063, -1.015298, 3.467119, 1, 1, 1, 1, 1,
1.127982, 0.423531, 1.342485, 1, 1, 1, 1, 1,
1.129807, -0.7936695, 1.310853, 1, 1, 1, 1, 1,
1.152866, -1.846378, 2.970626, 1, 1, 1, 1, 1,
1.155464, 1.617425, 2.249562, 1, 1, 1, 1, 1,
1.164674, -1.379932, 2.894455, 1, 1, 1, 1, 1,
1.168127, 0.386273, 1.177048, 1, 1, 1, 1, 1,
1.170695, 0.2459513, 1.865545, 1, 1, 1, 1, 1,
1.184874, -1.121277, 2.644126, 0, 0, 1, 1, 1,
1.198793, 0.4740756, 1.172441, 1, 0, 0, 1, 1,
1.198994, -0.8660033, 2.809376, 1, 0, 0, 1, 1,
1.200469, -0.5701499, 1.605706, 1, 0, 0, 1, 1,
1.200864, -0.2569115, 4.103204, 1, 0, 0, 1, 1,
1.203757, 0.4769907, -0.638797, 1, 0, 0, 1, 1,
1.212586, -0.4730701, 2.660865, 0, 0, 0, 1, 1,
1.212995, -1.557613, 2.799225, 0, 0, 0, 1, 1,
1.222739, 1.135744, 1.296744, 0, 0, 0, 1, 1,
1.223176, -1.673247, 1.456736, 0, 0, 0, 1, 1,
1.22364, 0.1739522, 3.309844, 0, 0, 0, 1, 1,
1.224148, -2.110422, 3.692136, 0, 0, 0, 1, 1,
1.23349, -1.245556, 2.446932, 0, 0, 0, 1, 1,
1.237359, -1.210709, 2.271068, 1, 1, 1, 1, 1,
1.238303, -1.721924, 2.365026, 1, 1, 1, 1, 1,
1.240471, -1.658, 2.21789, 1, 1, 1, 1, 1,
1.246767, -0.8721485, 2.651366, 1, 1, 1, 1, 1,
1.247941, 0.808492, -0.7871659, 1, 1, 1, 1, 1,
1.249543, 1.679429, 0.1844117, 1, 1, 1, 1, 1,
1.261215, 0.80278, 0.9502401, 1, 1, 1, 1, 1,
1.271907, 0.9051091, 1.417285, 1, 1, 1, 1, 1,
1.287028, -0.1703213, 2.184127, 1, 1, 1, 1, 1,
1.291795, 0.9924583, -1.001987, 1, 1, 1, 1, 1,
1.300189, -0.5648696, 2.613472, 1, 1, 1, 1, 1,
1.315433, 0.5103273, 0.454183, 1, 1, 1, 1, 1,
1.317132, 0.4745695, 2.231622, 1, 1, 1, 1, 1,
1.325035, 1.309149, 2.423445, 1, 1, 1, 1, 1,
1.326077, 0.330571, 0.7118025, 1, 1, 1, 1, 1,
1.327175, 0.568582, 1.13265, 0, 0, 1, 1, 1,
1.330604, -0.6309018, 1.525727, 1, 0, 0, 1, 1,
1.343152, -0.03272207, 0.2389566, 1, 0, 0, 1, 1,
1.359518, 0.02117453, 1.206421, 1, 0, 0, 1, 1,
1.362099, -0.8061208, 1.109217, 1, 0, 0, 1, 1,
1.364307, 0.5753052, 2.352132, 1, 0, 0, 1, 1,
1.368055, 0.9318699, 1.37048, 0, 0, 0, 1, 1,
1.368441, 0.3925235, -0.3994063, 0, 0, 0, 1, 1,
1.372895, -0.2289207, -0.1645623, 0, 0, 0, 1, 1,
1.374334, -1.899475, 3.876698, 0, 0, 0, 1, 1,
1.385978, -0.7778808, 1.073936, 0, 0, 0, 1, 1,
1.407835, -2.151622, 3.869699, 0, 0, 0, 1, 1,
1.408884, 1.1955, 1.889655, 0, 0, 0, 1, 1,
1.413201, -0.4529657, 0.9830248, 1, 1, 1, 1, 1,
1.423476, 1.162997, 0.1922868, 1, 1, 1, 1, 1,
1.437178, 1.186098, -0.3348501, 1, 1, 1, 1, 1,
1.454542, 0.9912643, 2.437161, 1, 1, 1, 1, 1,
1.464832, 0.9308186, -0.7509565, 1, 1, 1, 1, 1,
1.46797, -2.220379, 2.10373, 1, 1, 1, 1, 1,
1.470171, -0.3823178, 1.284889, 1, 1, 1, 1, 1,
1.478487, -1.336714, 2.806453, 1, 1, 1, 1, 1,
1.496491, 0.442432, 1.654075, 1, 1, 1, 1, 1,
1.501334, 0.6556523, -0.5382809, 1, 1, 1, 1, 1,
1.502178, -0.127114, 2.49072, 1, 1, 1, 1, 1,
1.505837, 0.05719006, 3.394706, 1, 1, 1, 1, 1,
1.51956, 0.4851801, 0.5139582, 1, 1, 1, 1, 1,
1.524436, -0.7980698, 2.154176, 1, 1, 1, 1, 1,
1.534519, -0.9267703, 1.167056, 1, 1, 1, 1, 1,
1.548224, 0.7961473, 3.329768, 0, 0, 1, 1, 1,
1.548236, 0.2201808, 2.672327, 1, 0, 0, 1, 1,
1.549106, -1.067598, 3.000525, 1, 0, 0, 1, 1,
1.559054, 0.5529993, 1.727381, 1, 0, 0, 1, 1,
1.561048, 0.9436244, -0.2158716, 1, 0, 0, 1, 1,
1.56645, 1.53303, 1.723472, 1, 0, 0, 1, 1,
1.569868, 0.08924019, 3.315995, 0, 0, 0, 1, 1,
1.575195, 0.1089373, 2.013387, 0, 0, 0, 1, 1,
1.578993, -0.2173614, 1.832118, 0, 0, 0, 1, 1,
1.585997, -0.8268723, 2.302147, 0, 0, 0, 1, 1,
1.590653, -0.5361938, 1.298815, 0, 0, 0, 1, 1,
1.59947, -0.03287002, 2.011068, 0, 0, 0, 1, 1,
1.600744, 1.66058, 0.08091889, 0, 0, 0, 1, 1,
1.6153, 0.6591281, 0.4476209, 1, 1, 1, 1, 1,
1.636687, 1.381329, 1.767803, 1, 1, 1, 1, 1,
1.638378, 2.515269, 0.2827152, 1, 1, 1, 1, 1,
1.646161, 0.9940571, 1.328177, 1, 1, 1, 1, 1,
1.649174, 1.289378, -0.1153449, 1, 1, 1, 1, 1,
1.657321, 0.8793442, 0.6346947, 1, 1, 1, 1, 1,
1.658158, 0.5457403, 4.069434, 1, 1, 1, 1, 1,
1.66845, 0.1835089, 1.655837, 1, 1, 1, 1, 1,
1.674788, 0.7213476, 0.4633374, 1, 1, 1, 1, 1,
1.700898, -0.2856746, 1.617878, 1, 1, 1, 1, 1,
1.709383, 1.993309, 1.41441, 1, 1, 1, 1, 1,
1.719122, -1.066437, 1.514712, 1, 1, 1, 1, 1,
1.774964, -0.5527222, 0.335855, 1, 1, 1, 1, 1,
1.782904, -0.1613662, -0.6035656, 1, 1, 1, 1, 1,
1.785096, 0.834473, 0.2402702, 1, 1, 1, 1, 1,
1.794083, 2.297213, -0.4733531, 0, 0, 1, 1, 1,
1.802963, -1.55182, 2.789171, 1, 0, 0, 1, 1,
1.807345, 0.9785811, 0.5382101, 1, 0, 0, 1, 1,
1.826328, -0.4687926, 2.063229, 1, 0, 0, 1, 1,
1.85518, -1.922163, 2.165819, 1, 0, 0, 1, 1,
1.864697, -0.812203, 2.070626, 1, 0, 0, 1, 1,
1.869744, -0.1786898, 1.140754, 0, 0, 0, 1, 1,
1.886403, 1.178714, -0.5097825, 0, 0, 0, 1, 1,
1.887099, 0.05819165, 2.183068, 0, 0, 0, 1, 1,
1.906413, 3.396163, 0.6854191, 0, 0, 0, 1, 1,
1.916754, -0.8108668, 4.221688, 0, 0, 0, 1, 1,
1.918872, -0.6076782, 1.655204, 0, 0, 0, 1, 1,
1.920535, 0.8047926, 1.473668, 0, 0, 0, 1, 1,
1.925143, -0.4905359, 0.08141122, 1, 1, 1, 1, 1,
1.950627, -0.2908424, 2.145006, 1, 1, 1, 1, 1,
1.952574, -0.2408284, 1.244919, 1, 1, 1, 1, 1,
1.965486, 0.05031615, 0.5212329, 1, 1, 1, 1, 1,
1.986009, 0.5626988, 1.624233, 1, 1, 1, 1, 1,
1.998935, 2.482097, 0.7741185, 1, 1, 1, 1, 1,
2.042068, -0.4366131, 3.173518, 1, 1, 1, 1, 1,
2.044864, -0.134381, 2.227683, 1, 1, 1, 1, 1,
2.061105, 0.698602, 2.810714, 1, 1, 1, 1, 1,
2.064556, -0.9996998, 3.805109, 1, 1, 1, 1, 1,
2.06987, 0.3774024, 3.874429, 1, 1, 1, 1, 1,
2.08112, -0.4281833, 2.072108, 1, 1, 1, 1, 1,
2.08447, -0.6117696, 4.09366, 1, 1, 1, 1, 1,
2.09659, -0.240378, 3.352623, 1, 1, 1, 1, 1,
2.099587, -0.1204043, 2.235614, 1, 1, 1, 1, 1,
2.108651, 0.3391235, 1.271252, 0, 0, 1, 1, 1,
2.170811, -1.930478, 1.111184, 1, 0, 0, 1, 1,
2.199111, 1.612403, 1.275033, 1, 0, 0, 1, 1,
2.222628, -1.433931, 3.384457, 1, 0, 0, 1, 1,
2.224856, -1.08989, 2.447014, 1, 0, 0, 1, 1,
2.29174, -0.3006965, 3.023342, 1, 0, 0, 1, 1,
2.309765, 0.5202867, 1.340602, 0, 0, 0, 1, 1,
2.338429, 0.3627334, 1.292103, 0, 0, 0, 1, 1,
2.352393, 0.3415497, -0.2310263, 0, 0, 0, 1, 1,
2.368849, 0.8393805, 1.662973, 0, 0, 0, 1, 1,
2.372666, 1.136434, 0.1765039, 0, 0, 0, 1, 1,
2.441141, -1.090643, 3.323001, 0, 0, 0, 1, 1,
2.450453, 1.329056, 1.886765, 0, 0, 0, 1, 1,
2.487459, 0.9217703, 2.785404, 1, 1, 1, 1, 1,
2.503449, 0.1976865, 0.8178009, 1, 1, 1, 1, 1,
2.659349, -0.1688389, 1.701915, 1, 1, 1, 1, 1,
2.662013, 0.9602888, 1.298871, 1, 1, 1, 1, 1,
2.678462, 0.3369177, -0.4483947, 1, 1, 1, 1, 1,
2.824994, 1.026727, 1.195359, 1, 1, 1, 1, 1,
3.623325, 0.9949238, -0.2105824, 1, 1, 1, 1, 1
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
var radius = 9.540088;
var distance = 33.50915;
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
mvMatrix.translate( -0.1481514, -0.248577, 0.5340192 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.50915);
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
