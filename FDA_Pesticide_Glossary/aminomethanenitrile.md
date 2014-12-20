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
-2.770529, 0.02267228, -2.327744, 1, 0, 0, 1,
-2.717353, 0.5887873, -1.616263, 1, 0.007843138, 0, 1,
-2.68938, -1.959286, -3.284164, 1, 0.01176471, 0, 1,
-2.54891, 0.932681, -1.56139, 1, 0.01960784, 0, 1,
-2.512865, -0.2438886, -2.381755, 1, 0.02352941, 0, 1,
-2.445134, 1.022408, -0.7790877, 1, 0.03137255, 0, 1,
-2.422595, -2.030515, -1.135327, 1, 0.03529412, 0, 1,
-2.394332, -0.902633, -3.005706, 1, 0.04313726, 0, 1,
-2.310231, -1.413918, -2.774065, 1, 0.04705882, 0, 1,
-2.29789, 0.7131552, 0.7599115, 1, 0.05490196, 0, 1,
-2.262754, -1.941293, -1.082455, 1, 0.05882353, 0, 1,
-2.256785, 0.1894862, -1.051109, 1, 0.06666667, 0, 1,
-2.230494, 0.1736561, -1.522208, 1, 0.07058824, 0, 1,
-2.229234, -0.7538014, -1.235572, 1, 0.07843138, 0, 1,
-2.200686, 1.147484, -0.2426844, 1, 0.08235294, 0, 1,
-2.193172, -0.8738626, -2.309793, 1, 0.09019608, 0, 1,
-2.103722, 3.055517, -1.609942, 1, 0.09411765, 0, 1,
-2.08293, -0.1215626, -1.445239, 1, 0.1019608, 0, 1,
-2.080346, 0.4922525, -1.862112, 1, 0.1098039, 0, 1,
-2.078664, -0.5578377, -1.052607, 1, 0.1137255, 0, 1,
-2.066678, -0.3838091, -0.5338731, 1, 0.1215686, 0, 1,
-1.994141, 0.1586458, -0.9769865, 1, 0.1254902, 0, 1,
-1.988552, -0.2859535, -0.251722, 1, 0.1333333, 0, 1,
-1.98263, 1.59909, -2.846855, 1, 0.1372549, 0, 1,
-1.965427, -0.3882209, -1.836396, 1, 0.145098, 0, 1,
-1.93796, -0.30406, 0.5421227, 1, 0.1490196, 0, 1,
-1.930546, -0.8193998, -2.192913, 1, 0.1568628, 0, 1,
-1.919962, -1.513476, -2.506539, 1, 0.1607843, 0, 1,
-1.919042, -0.2308238, -2.144437, 1, 0.1686275, 0, 1,
-1.916329, 2.684066, -0.5698999, 1, 0.172549, 0, 1,
-1.899472, 0.2501404, 0.2810123, 1, 0.1803922, 0, 1,
-1.893602, -1.27631, -0.8857943, 1, 0.1843137, 0, 1,
-1.86097, 0.2475699, -2.182139, 1, 0.1921569, 0, 1,
-1.856577, -1.72862, -2.656694, 1, 0.1960784, 0, 1,
-1.832685, -1.590467, -2.458203, 1, 0.2039216, 0, 1,
-1.8181, -0.3021897, -2.151343, 1, 0.2117647, 0, 1,
-1.790306, 0.2887545, -1.002985, 1, 0.2156863, 0, 1,
-1.783348, -0.2475341, 0.2898208, 1, 0.2235294, 0, 1,
-1.781163, -0.2751374, -1.117975, 1, 0.227451, 0, 1,
-1.776396, -0.9849728, -1.317126, 1, 0.2352941, 0, 1,
-1.764248, 2.144947, -1.875174, 1, 0.2392157, 0, 1,
-1.752643, 0.4162988, -0.2498207, 1, 0.2470588, 0, 1,
-1.748893, -0.008408139, -2.048541, 1, 0.2509804, 0, 1,
-1.742293, 1.910908, 0.05167481, 1, 0.2588235, 0, 1,
-1.728054, 0.3461912, -0.3546534, 1, 0.2627451, 0, 1,
-1.724094, 0.1049096, -1.43227, 1, 0.2705882, 0, 1,
-1.721025, -0.02779611, -2.909717, 1, 0.2745098, 0, 1,
-1.70735, 0.6510857, -0.4224161, 1, 0.282353, 0, 1,
-1.706573, 0.8851954, 1.105422, 1, 0.2862745, 0, 1,
-1.699659, 0.05000893, -3.224171, 1, 0.2941177, 0, 1,
-1.682259, -1.332552, -3.167846, 1, 0.3019608, 0, 1,
-1.680435, 1.069892, -0.03382929, 1, 0.3058824, 0, 1,
-1.662927, 1.342363, -1.207562, 1, 0.3137255, 0, 1,
-1.659088, -1.365123, -0.5425249, 1, 0.3176471, 0, 1,
-1.628659, 1.870433, -2.577935, 1, 0.3254902, 0, 1,
-1.62081, -0.9315227, -1.390704, 1, 0.3294118, 0, 1,
-1.61147, 0.637999, -1.587824, 1, 0.3372549, 0, 1,
-1.610503, -0.1817373, -2.050632, 1, 0.3411765, 0, 1,
-1.594511, -1.24148, -3.105133, 1, 0.3490196, 0, 1,
-1.583837, -1.491756, -1.505065, 1, 0.3529412, 0, 1,
-1.548861, 2.445044, -0.6077126, 1, 0.3607843, 0, 1,
-1.543982, -1.030424, -2.944124, 1, 0.3647059, 0, 1,
-1.539157, 0.6439007, -1.04723, 1, 0.372549, 0, 1,
-1.527206, 1.874906, -1.559097, 1, 0.3764706, 0, 1,
-1.516161, -0.4063488, -3.216822, 1, 0.3843137, 0, 1,
-1.514973, 0.2733054, -1.773831, 1, 0.3882353, 0, 1,
-1.509931, -0.8396436, -3.278774, 1, 0.3960784, 0, 1,
-1.498924, -0.3108945, -1.65463, 1, 0.4039216, 0, 1,
-1.488562, 0.183707, -1.046521, 1, 0.4078431, 0, 1,
-1.475237, 0.8595487, -0.9181185, 1, 0.4156863, 0, 1,
-1.469432, -0.06100468, -3.514645, 1, 0.4196078, 0, 1,
-1.464686, 0.9646028, -1.350168, 1, 0.427451, 0, 1,
-1.459898, -1.529626, -2.798202, 1, 0.4313726, 0, 1,
-1.454313, 0.3770969, 0.006495348, 1, 0.4392157, 0, 1,
-1.449747, 0.8582729, -0.1053302, 1, 0.4431373, 0, 1,
-1.441881, -1.829572, -3.457773, 1, 0.4509804, 0, 1,
-1.433092, 1.407769, -0.4936143, 1, 0.454902, 0, 1,
-1.430469, 1.468499, -1.651411, 1, 0.4627451, 0, 1,
-1.420086, -1.283558, -1.562105, 1, 0.4666667, 0, 1,
-1.417856, 0.3627505, -1.891083, 1, 0.4745098, 0, 1,
-1.415118, 1.776617, -0.2833299, 1, 0.4784314, 0, 1,
-1.412553, -0.04441983, -1.714404, 1, 0.4862745, 0, 1,
-1.41054, 0.2212051, -2.417492, 1, 0.4901961, 0, 1,
-1.377845, 0.6236753, -1.008046, 1, 0.4980392, 0, 1,
-1.37686, -1.238473, -1.453371, 1, 0.5058824, 0, 1,
-1.36708, 0.5348254, 1.25609, 1, 0.509804, 0, 1,
-1.36265, -0.7522702, -1.263963, 1, 0.5176471, 0, 1,
-1.340643, -2.18032, -3.600266, 1, 0.5215687, 0, 1,
-1.33818, -1.099649, -1.712879, 1, 0.5294118, 0, 1,
-1.329701, -1.377848, -3.754847, 1, 0.5333334, 0, 1,
-1.309919, -0.1778581, -2.824997, 1, 0.5411765, 0, 1,
-1.302245, 2.761328, -0.5096115, 1, 0.5450981, 0, 1,
-1.294797, 0.4784919, -2.132658, 1, 0.5529412, 0, 1,
-1.287701, 1.745881, 1.435221, 1, 0.5568628, 0, 1,
-1.282859, 0.8992805, -0.1788441, 1, 0.5647059, 0, 1,
-1.28159, -0.412238, -1.372138, 1, 0.5686275, 0, 1,
-1.277395, -1.779977, -2.042186, 1, 0.5764706, 0, 1,
-1.269063, 0.1106241, -1.516932, 1, 0.5803922, 0, 1,
-1.259385, 2.008166, -0.7001103, 1, 0.5882353, 0, 1,
-1.256839, -1.073007, -1.507246, 1, 0.5921569, 0, 1,
-1.254936, -1.272398, -2.195514, 1, 0.6, 0, 1,
-1.252578, -0.07645522, -2.143196, 1, 0.6078432, 0, 1,
-1.251836, -0.3473537, -1.808476, 1, 0.6117647, 0, 1,
-1.251149, -1.369412, -1.016242, 1, 0.6196079, 0, 1,
-1.240439, 0.7280379, -0.2368111, 1, 0.6235294, 0, 1,
-1.237545, 0.7813719, 0.4292962, 1, 0.6313726, 0, 1,
-1.232462, 1.000665, -1.163183, 1, 0.6352941, 0, 1,
-1.232095, 0.5250111, -0.8250952, 1, 0.6431373, 0, 1,
-1.224593, -1.50922, -2.115079, 1, 0.6470588, 0, 1,
-1.207817, -0.2345676, -0.7350788, 1, 0.654902, 0, 1,
-1.206906, -0.1944203, -1.154233, 1, 0.6588235, 0, 1,
-1.188165, -0.3669937, -1.3441, 1, 0.6666667, 0, 1,
-1.183608, 1.472126, -0.02854505, 1, 0.6705883, 0, 1,
-1.182225, 1.156097, -1.085081, 1, 0.6784314, 0, 1,
-1.174556, -1.222608, -3.16156, 1, 0.682353, 0, 1,
-1.173889, -0.4722487, -0.8873339, 1, 0.6901961, 0, 1,
-1.172997, -0.7662787, -2.885419, 1, 0.6941177, 0, 1,
-1.160116, -2.230459, -2.400879, 1, 0.7019608, 0, 1,
-1.156567, -1.24329, -3.849466, 1, 0.7098039, 0, 1,
-1.156264, -0.07169724, -1.351532, 1, 0.7137255, 0, 1,
-1.152935, 0.5011, -1.928981, 1, 0.7215686, 0, 1,
-1.148967, -1.405377, -4.180094, 1, 0.7254902, 0, 1,
-1.145657, 0.3392639, -0.8398572, 1, 0.7333333, 0, 1,
-1.141464, 0.1178236, -1.81679, 1, 0.7372549, 0, 1,
-1.138417, 0.5881352, -2.754179, 1, 0.7450981, 0, 1,
-1.137799, -1.180188, -2.593492, 1, 0.7490196, 0, 1,
-1.136255, 0.4959345, -1.617718, 1, 0.7568628, 0, 1,
-1.12939, 0.2172895, -0.1168483, 1, 0.7607843, 0, 1,
-1.120973, -0.9587771, -1.946479, 1, 0.7686275, 0, 1,
-1.120913, -0.3315338, -1.681895, 1, 0.772549, 0, 1,
-1.118233, 1.783266, 0.05375795, 1, 0.7803922, 0, 1,
-1.111585, 0.1822833, -0.7830917, 1, 0.7843137, 0, 1,
-1.109844, -0.4926343, -1.547334, 1, 0.7921569, 0, 1,
-1.0923, 2.015794, 0.531569, 1, 0.7960784, 0, 1,
-1.089878, -0.9886448, -2.543237, 1, 0.8039216, 0, 1,
-1.086015, 0.6424391, -2.210223, 1, 0.8117647, 0, 1,
-1.082844, 0.7054715, 0.03705147, 1, 0.8156863, 0, 1,
-1.079792, 0.3503872, -1.306104, 1, 0.8235294, 0, 1,
-1.079223, -2.346514, -0.4119752, 1, 0.827451, 0, 1,
-1.07373, 0.6705087, -1.133717, 1, 0.8352941, 0, 1,
-1.069955, 1.4193, -0.3599829, 1, 0.8392157, 0, 1,
-1.068261, -1.331932, -3.954201, 1, 0.8470588, 0, 1,
-1.064363, 0.4587734, -0.7419124, 1, 0.8509804, 0, 1,
-1.061576, -0.5257626, -0.851424, 1, 0.8588235, 0, 1,
-1.058446, -0.2860662, -1.1015, 1, 0.8627451, 0, 1,
-1.053513, -0.5729702, -2.081838, 1, 0.8705882, 0, 1,
-1.052644, -0.5278297, -1.712738, 1, 0.8745098, 0, 1,
-1.046756, -0.9477157, -3.528764, 1, 0.8823529, 0, 1,
-1.042205, -0.09350327, -1.062466, 1, 0.8862745, 0, 1,
-1.040658, 1.357346, -1.70324, 1, 0.8941177, 0, 1,
-1.037011, 1.036537, -0.5170457, 1, 0.8980392, 0, 1,
-1.034033, 1.070669, -0.8990566, 1, 0.9058824, 0, 1,
-1.031255, -0.388088, -2.836391, 1, 0.9137255, 0, 1,
-1.023199, 0.8493578, -1.06217, 1, 0.9176471, 0, 1,
-1.022218, 0.1150492, -0.2622837, 1, 0.9254902, 0, 1,
-1.014087, 0.4636849, -2.365069, 1, 0.9294118, 0, 1,
-1.01379, -0.03436283, -1.08847, 1, 0.9372549, 0, 1,
-1.008008, -0.668687, -2.431501, 1, 0.9411765, 0, 1,
-1.003142, 0.4015205, -1.418602, 1, 0.9490196, 0, 1,
-1.000332, -1.410791, -2.773172, 1, 0.9529412, 0, 1,
-0.9994135, 0.4033999, -3.033479, 1, 0.9607843, 0, 1,
-0.9989668, -1.062667, -3.026342, 1, 0.9647059, 0, 1,
-0.9988177, -0.2186257, -1.370926, 1, 0.972549, 0, 1,
-0.9985304, 1.616364, -0.1211363, 1, 0.9764706, 0, 1,
-0.9903538, -1.351607, -4.020915, 1, 0.9843137, 0, 1,
-0.9898949, 1.134515, -1.60937, 1, 0.9882353, 0, 1,
-0.986818, 2.006794, -0.3673258, 1, 0.9960784, 0, 1,
-0.9815615, -0.4730961, -1.834457, 0.9960784, 1, 0, 1,
-0.9749154, -2.596103, -3.110713, 0.9921569, 1, 0, 1,
-0.974031, 0.5748443, -1.544732, 0.9843137, 1, 0, 1,
-0.9735013, 0.8382903, -0.7709562, 0.9803922, 1, 0, 1,
-0.972334, -0.8104097, -1.783672, 0.972549, 1, 0, 1,
-0.9702457, -0.4932765, -2.810267, 0.9686275, 1, 0, 1,
-0.9620531, 0.6589998, 0.06553478, 0.9607843, 1, 0, 1,
-0.961857, 0.6442181, -0.2875222, 0.9568627, 1, 0, 1,
-0.958697, -0.6899401, -2.954874, 0.9490196, 1, 0, 1,
-0.9507629, 0.1951244, -0.5628728, 0.945098, 1, 0, 1,
-0.9463732, -2.253749, -4.603767, 0.9372549, 1, 0, 1,
-0.9429539, 1.878023, -0.3394216, 0.9333333, 1, 0, 1,
-0.9429033, -0.4725345, -2.460444, 0.9254902, 1, 0, 1,
-0.9373802, 0.2747176, -0.6223438, 0.9215686, 1, 0, 1,
-0.9336336, -0.6909431, -3.819031, 0.9137255, 1, 0, 1,
-0.9299709, 0.4657839, -1.461797, 0.9098039, 1, 0, 1,
-0.9258093, 0.429479, -0.3000426, 0.9019608, 1, 0, 1,
-0.9132441, -0.1512468, -2.010149, 0.8941177, 1, 0, 1,
-0.9090876, -0.5228534, -2.561248, 0.8901961, 1, 0, 1,
-0.9075785, 0.1283705, -3.256115, 0.8823529, 1, 0, 1,
-0.903845, 0.9438857, 0.303759, 0.8784314, 1, 0, 1,
-0.9015602, 0.8323075, -1.698176, 0.8705882, 1, 0, 1,
-0.9009384, 0.2934647, -1.948482, 0.8666667, 1, 0, 1,
-0.8954904, 0.6879545, -1.054014, 0.8588235, 1, 0, 1,
-0.8929738, 0.6108009, -2.107423, 0.854902, 1, 0, 1,
-0.8911917, -2.310685, -4.406632, 0.8470588, 1, 0, 1,
-0.8909477, 0.5046685, -0.273523, 0.8431373, 1, 0, 1,
-0.8857479, 0.4348114, -0.8925647, 0.8352941, 1, 0, 1,
-0.8835915, 0.2256858, -1.445772, 0.8313726, 1, 0, 1,
-0.861277, -0.7164394, -3.666506, 0.8235294, 1, 0, 1,
-0.8577712, -1.032859, -2.185688, 0.8196079, 1, 0, 1,
-0.8564005, -0.447481, -2.448195, 0.8117647, 1, 0, 1,
-0.8519228, -0.9918167, -1.556715, 0.8078431, 1, 0, 1,
-0.8478883, -0.9159352, -1.630251, 0.8, 1, 0, 1,
-0.846644, -0.4848606, -1.442325, 0.7921569, 1, 0, 1,
-0.8454447, -1.749189, -1.355023, 0.7882353, 1, 0, 1,
-0.8419993, 0.6834241, -2.80092, 0.7803922, 1, 0, 1,
-0.8393182, 0.7679152, 0.5953774, 0.7764706, 1, 0, 1,
-0.8341165, 0.06009207, -1.108216, 0.7686275, 1, 0, 1,
-0.8314296, -0.7848694, -2.833378, 0.7647059, 1, 0, 1,
-0.8270512, 1.501471, 0.9265598, 0.7568628, 1, 0, 1,
-0.8268547, 1.185932, -3.503432, 0.7529412, 1, 0, 1,
-0.8208325, -0.6981124, -1.576611, 0.7450981, 1, 0, 1,
-0.8108747, -0.5079618, -1.3886, 0.7411765, 1, 0, 1,
-0.8098012, -1.921079, -4.235043, 0.7333333, 1, 0, 1,
-0.8084803, -1.813923, -4.325879, 0.7294118, 1, 0, 1,
-0.8078684, 2.293104, -0.6227415, 0.7215686, 1, 0, 1,
-0.7954598, -0.5667889, -1.105782, 0.7176471, 1, 0, 1,
-0.7922412, 0.009729081, -2.729909, 0.7098039, 1, 0, 1,
-0.7896422, 0.4701491, 0.9009524, 0.7058824, 1, 0, 1,
-0.7883026, 0.1232423, -2.148482, 0.6980392, 1, 0, 1,
-0.7865041, 1.799972, -0.3442797, 0.6901961, 1, 0, 1,
-0.7815662, -0.1754881, 0.2577838, 0.6862745, 1, 0, 1,
-0.7810656, -0.01782356, -1.496245, 0.6784314, 1, 0, 1,
-0.7810366, -0.6568656, -1.347601, 0.6745098, 1, 0, 1,
-0.7792916, -0.5174296, -2.908537, 0.6666667, 1, 0, 1,
-0.7745441, -0.6556279, -2.507749, 0.6627451, 1, 0, 1,
-0.7690533, 0.6760327, -0.7407764, 0.654902, 1, 0, 1,
-0.7611099, 1.2248, 0.7738257, 0.6509804, 1, 0, 1,
-0.7578515, -0.7365545, 0.05590333, 0.6431373, 1, 0, 1,
-0.7516233, -0.7078812, -2.766096, 0.6392157, 1, 0, 1,
-0.7381831, -0.2719603, -2.401001, 0.6313726, 1, 0, 1,
-0.737577, 1.38696, -0.3963055, 0.627451, 1, 0, 1,
-0.734214, -0.04151388, -0.8796609, 0.6196079, 1, 0, 1,
-0.7290159, -2.373044, -2.790755, 0.6156863, 1, 0, 1,
-0.7257205, 0.1925435, -1.805548, 0.6078432, 1, 0, 1,
-0.7235958, -0.1428195, -1.593106, 0.6039216, 1, 0, 1,
-0.7235529, 2.377583, -1.565096, 0.5960785, 1, 0, 1,
-0.7229812, 0.5851773, 0.7673279, 0.5882353, 1, 0, 1,
-0.7140294, -2.13334, -2.52959, 0.5843138, 1, 0, 1,
-0.713285, -1.40215, -3.830353, 0.5764706, 1, 0, 1,
-0.7124577, 0.2283897, -1.082322, 0.572549, 1, 0, 1,
-0.7118692, 2.298257, -0.9436852, 0.5647059, 1, 0, 1,
-0.7080587, -0.3087628, -3.234731, 0.5607843, 1, 0, 1,
-0.707739, -0.01652032, -0.8871055, 0.5529412, 1, 0, 1,
-0.7059433, -1.459441, -2.505473, 0.5490196, 1, 0, 1,
-0.6970314, -0.1112474, -2.545435, 0.5411765, 1, 0, 1,
-0.6964906, -0.9716059, -2.377048, 0.5372549, 1, 0, 1,
-0.6954071, 1.52167, 0.2933312, 0.5294118, 1, 0, 1,
-0.6943371, 0.04079087, -2.338207, 0.5254902, 1, 0, 1,
-0.6901212, -0.3129504, -2.270207, 0.5176471, 1, 0, 1,
-0.6891093, -0.2439083, -2.294665, 0.5137255, 1, 0, 1,
-0.686207, 0.3030263, 0.2613879, 0.5058824, 1, 0, 1,
-0.6854097, -1.714125, -1.414716, 0.5019608, 1, 0, 1,
-0.6833427, 1.079015, -1.907451, 0.4941176, 1, 0, 1,
-0.6830047, -2.356915, -3.256267, 0.4862745, 1, 0, 1,
-0.6803832, 1.038715, -1.67399, 0.4823529, 1, 0, 1,
-0.6771589, 0.4666086, -0.09735311, 0.4745098, 1, 0, 1,
-0.675718, -0.242607, -3.581528, 0.4705882, 1, 0, 1,
-0.667628, 0.2875, -2.773274, 0.4627451, 1, 0, 1,
-0.666222, 0.2249595, -2.175045, 0.4588235, 1, 0, 1,
-0.6651361, -0.4850461, -2.339915, 0.4509804, 1, 0, 1,
-0.6624379, -0.5928276, 0.2226022, 0.4470588, 1, 0, 1,
-0.658164, -0.4129071, -0.2154135, 0.4392157, 1, 0, 1,
-0.6581522, 0.6477727, -1.155232, 0.4352941, 1, 0, 1,
-0.6544811, 0.9705309, -2.279582, 0.427451, 1, 0, 1,
-0.653621, -1.411916, -3.239656, 0.4235294, 1, 0, 1,
-0.6516379, 0.5178735, -0.1351173, 0.4156863, 1, 0, 1,
-0.6454463, 0.7161097, 0.5373748, 0.4117647, 1, 0, 1,
-0.6431977, -0.3602802, -4.540088, 0.4039216, 1, 0, 1,
-0.6411254, 1.553163, -0.0787141, 0.3960784, 1, 0, 1,
-0.6390125, -0.1322037, -1.781617, 0.3921569, 1, 0, 1,
-0.6381505, 0.3386059, -1.864679, 0.3843137, 1, 0, 1,
-0.6325591, 1.235314, -0.07681281, 0.3803922, 1, 0, 1,
-0.6207571, 2.075099, -2.422179, 0.372549, 1, 0, 1,
-0.6184443, -1.477345, -4.140227, 0.3686275, 1, 0, 1,
-0.6181186, -2.817508, -3.498079, 0.3607843, 1, 0, 1,
-0.6155686, 0.5825067, 0.08942018, 0.3568628, 1, 0, 1,
-0.6137239, -0.4320251, -2.876464, 0.3490196, 1, 0, 1,
-0.6084948, 0.3326121, 0.430303, 0.345098, 1, 0, 1,
-0.6084312, -0.6553597, -3.273994, 0.3372549, 1, 0, 1,
-0.6073148, -0.8378699, -4.274, 0.3333333, 1, 0, 1,
-0.605494, 1.976445, -0.9607632, 0.3254902, 1, 0, 1,
-0.6019794, -0.4151831, -1.832714, 0.3215686, 1, 0, 1,
-0.6019548, -1.757135, -2.517795, 0.3137255, 1, 0, 1,
-0.5972523, 1.268799, -1.738086, 0.3098039, 1, 0, 1,
-0.591634, 1.786947, 0.1456927, 0.3019608, 1, 0, 1,
-0.5913642, 0.8575765, -0.4079015, 0.2941177, 1, 0, 1,
-0.5819377, -1.107522, -2.574624, 0.2901961, 1, 0, 1,
-0.5819108, -0.4562913, -2.426915, 0.282353, 1, 0, 1,
-0.5771585, -0.7760013, -2.099413, 0.2784314, 1, 0, 1,
-0.5734388, -0.7568164, -2.613205, 0.2705882, 1, 0, 1,
-0.5730613, 0.7002124, -2.035841, 0.2666667, 1, 0, 1,
-0.5710752, 1.186689, 0.7641873, 0.2588235, 1, 0, 1,
-0.5632942, -0.5663347, -4.540376, 0.254902, 1, 0, 1,
-0.5563313, -0.2089084, -1.322369, 0.2470588, 1, 0, 1,
-0.5549226, 1.254034, 0.4581745, 0.2431373, 1, 0, 1,
-0.552343, -0.4464794, -3.412479, 0.2352941, 1, 0, 1,
-0.5518948, 1.22182, -0.3237057, 0.2313726, 1, 0, 1,
-0.5511971, -0.7231677, -2.157889, 0.2235294, 1, 0, 1,
-0.5502939, 0.1018929, -3.185635, 0.2196078, 1, 0, 1,
-0.5487404, -0.4226435, -2.689712, 0.2117647, 1, 0, 1,
-0.5408791, 0.1112706, -2.221147, 0.2078431, 1, 0, 1,
-0.5407358, -1.213239, -2.584481, 0.2, 1, 0, 1,
-0.537958, 0.6685438, -0.1710181, 0.1921569, 1, 0, 1,
-0.5336955, 0.4670833, -1.908489, 0.1882353, 1, 0, 1,
-0.5286652, 0.9990074, -0.08969255, 0.1803922, 1, 0, 1,
-0.524973, 0.8088372, -0.1789876, 0.1764706, 1, 0, 1,
-0.5211529, 0.03723134, -0.8832191, 0.1686275, 1, 0, 1,
-0.5208873, -1.148626, -1.220302, 0.1647059, 1, 0, 1,
-0.5148875, 0.3082769, -1.926527, 0.1568628, 1, 0, 1,
-0.5147556, 0.7219716, -0.9770786, 0.1529412, 1, 0, 1,
-0.5115402, -0.4857481, -1.162236, 0.145098, 1, 0, 1,
-0.5093936, -0.2811349, -1.581072, 0.1411765, 1, 0, 1,
-0.5081321, 0.2999969, -0.886171, 0.1333333, 1, 0, 1,
-0.5044733, 1.824081, -1.317502, 0.1294118, 1, 0, 1,
-0.4953734, -1.44459, -2.217685, 0.1215686, 1, 0, 1,
-0.4949397, -1.048193, -3.23267, 0.1176471, 1, 0, 1,
-0.4888425, 0.6754639, -0.9946244, 0.1098039, 1, 0, 1,
-0.4847553, 1.45671, -0.1710887, 0.1058824, 1, 0, 1,
-0.4843642, -0.481812, -3.198285, 0.09803922, 1, 0, 1,
-0.4806339, 0.5805639, 0.7480929, 0.09019608, 1, 0, 1,
-0.4788969, -0.3416818, -2.450812, 0.08627451, 1, 0, 1,
-0.47059, 2.123627, -2.670852, 0.07843138, 1, 0, 1,
-0.4705515, 1.756748, -1.015668, 0.07450981, 1, 0, 1,
-0.4667421, 1.397845, 1.104691, 0.06666667, 1, 0, 1,
-0.4622195, 1.125495, 0.8585873, 0.0627451, 1, 0, 1,
-0.4584416, -0.2635017, -2.3278, 0.05490196, 1, 0, 1,
-0.4573054, 0.6367453, -0.4197898, 0.05098039, 1, 0, 1,
-0.4558319, -1.124233, -2.57519, 0.04313726, 1, 0, 1,
-0.4544037, -1.128619, -2.527958, 0.03921569, 1, 0, 1,
-0.448319, 1.260322, -0.3648915, 0.03137255, 1, 0, 1,
-0.4475909, 0.04606546, -1.943509, 0.02745098, 1, 0, 1,
-0.4452789, -0.6621583, -3.693712, 0.01960784, 1, 0, 1,
-0.4451998, -0.1816622, 0.2933338, 0.01568628, 1, 0, 1,
-0.4428309, 1.938313, 2.127318, 0.007843138, 1, 0, 1,
-0.4411664, 0.4403885, -1.03458, 0.003921569, 1, 0, 1,
-0.4408232, 0.7822352, -1.992973, 0, 1, 0.003921569, 1,
-0.4406917, -0.4671481, -0.8652279, 0, 1, 0.01176471, 1,
-0.4396003, 0.453504, -1.927976, 0, 1, 0.01568628, 1,
-0.4380872, -0.1869741, -1.289549, 0, 1, 0.02352941, 1,
-0.4365778, 1.202042, 1.159518, 0, 1, 0.02745098, 1,
-0.4334883, 0.5308526, -1.510147, 0, 1, 0.03529412, 1,
-0.4329363, -1.480814, -2.36127, 0, 1, 0.03921569, 1,
-0.4322989, 0.4055306, -0.2178644, 0, 1, 0.04705882, 1,
-0.4269747, 0.1229416, 0.8438714, 0, 1, 0.05098039, 1,
-0.4248529, -0.537178, -3.144284, 0, 1, 0.05882353, 1,
-0.4235434, 0.832563, -0.08980386, 0, 1, 0.0627451, 1,
-0.4197272, -0.5291005, -2.738547, 0, 1, 0.07058824, 1,
-0.4152024, 1.33004, 1.886471, 0, 1, 0.07450981, 1,
-0.4145502, -1.312289, -2.734793, 0, 1, 0.08235294, 1,
-0.4112633, -1.706867, -2.796491, 0, 1, 0.08627451, 1,
-0.4111677, 3.01423, 1.100992, 0, 1, 0.09411765, 1,
-0.4103487, -0.5504093, -3.247053, 0, 1, 0.1019608, 1,
-0.4062809, 0.5830162, 0.1675117, 0, 1, 0.1058824, 1,
-0.4017645, 0.936357, -3.024116, 0, 1, 0.1137255, 1,
-0.3879291, -0.6901855, -2.072349, 0, 1, 0.1176471, 1,
-0.3857087, 0.4377733, -2.174108, 0, 1, 0.1254902, 1,
-0.3845867, 0.207032, -1.249371, 0, 1, 0.1294118, 1,
-0.3837025, 0.5025233, -0.09418634, 0, 1, 0.1372549, 1,
-0.3821783, 1.080072, 1.484366, 0, 1, 0.1411765, 1,
-0.3705297, 0.6533932, -0.9744928, 0, 1, 0.1490196, 1,
-0.3686233, -0.802813, -2.384682, 0, 1, 0.1529412, 1,
-0.3624595, 0.343595, 0.3643616, 0, 1, 0.1607843, 1,
-0.3620833, -0.04421572, -1.302394, 0, 1, 0.1647059, 1,
-0.361653, -0.4152927, -1.912161, 0, 1, 0.172549, 1,
-0.3606489, 0.7849538, 1.372064, 0, 1, 0.1764706, 1,
-0.3591464, -0.5561115, -1.873441, 0, 1, 0.1843137, 1,
-0.3572716, 0.654776, -0.3041518, 0, 1, 0.1882353, 1,
-0.3542806, 0.5571582, -0.2352703, 0, 1, 0.1960784, 1,
-0.3525619, 0.4674245, -1.63496, 0, 1, 0.2039216, 1,
-0.3497798, -1.899619, -2.665781, 0, 1, 0.2078431, 1,
-0.3496456, -0.6232418, -4.729795, 0, 1, 0.2156863, 1,
-0.3492706, 1.252965, -0.08615337, 0, 1, 0.2196078, 1,
-0.3486424, -2.458559, -3.485635, 0, 1, 0.227451, 1,
-0.3476214, -0.7775702, -3.673676, 0, 1, 0.2313726, 1,
-0.3473486, 1.876372, -1.12201, 0, 1, 0.2392157, 1,
-0.3418046, 0.7285839, -1.273682, 0, 1, 0.2431373, 1,
-0.3355044, -0.2348725, -2.58333, 0, 1, 0.2509804, 1,
-0.330211, -0.3690806, -2.253687, 0, 1, 0.254902, 1,
-0.3292798, 1.221015, -0.4559446, 0, 1, 0.2627451, 1,
-0.328506, -0.6830225, -1.239416, 0, 1, 0.2666667, 1,
-0.3214805, -2.071856, -2.935246, 0, 1, 0.2745098, 1,
-0.320309, 0.471418, -0.4210556, 0, 1, 0.2784314, 1,
-0.3150953, 2.080343, 1.355587, 0, 1, 0.2862745, 1,
-0.3144355, -0.1148484, -3.64077, 0, 1, 0.2901961, 1,
-0.3121985, 0.6797339, -0.772221, 0, 1, 0.2980392, 1,
-0.310846, -1.823849, -2.136639, 0, 1, 0.3058824, 1,
-0.3089705, 0.3181668, -1.740841, 0, 1, 0.3098039, 1,
-0.3054675, -0.0364807, -2.09325, 0, 1, 0.3176471, 1,
-0.3031779, 1.048788, -0.4484922, 0, 1, 0.3215686, 1,
-0.3003965, -0.455913, -2.19291, 0, 1, 0.3294118, 1,
-0.3003371, -1.220656, -2.907653, 0, 1, 0.3333333, 1,
-0.2930986, 0.202402, 0.07027347, 0, 1, 0.3411765, 1,
-0.2924653, -0.04601077, -3.223731, 0, 1, 0.345098, 1,
-0.2922423, 0.6729605, 0.4985857, 0, 1, 0.3529412, 1,
-0.2897403, 1.858286, -0.8238282, 0, 1, 0.3568628, 1,
-0.2845908, -0.4714985, -2.529951, 0, 1, 0.3647059, 1,
-0.282684, -0.3354886, -2.614775, 0, 1, 0.3686275, 1,
-0.2822537, 0.830615, -0.7944781, 0, 1, 0.3764706, 1,
-0.2821126, 1.506189, -2.297045, 0, 1, 0.3803922, 1,
-0.2798622, 1.076509, -0.4478924, 0, 1, 0.3882353, 1,
-0.2754687, 1.065583, -1.611788, 0, 1, 0.3921569, 1,
-0.2723338, 0.04596637, -2.434392, 0, 1, 0.4, 1,
-0.2657791, -0.9392449, -3.217962, 0, 1, 0.4078431, 1,
-0.2648226, 0.2404063, -0.407565, 0, 1, 0.4117647, 1,
-0.2627818, 2.092924, 1.419361, 0, 1, 0.4196078, 1,
-0.2541847, -1.74684, -2.248653, 0, 1, 0.4235294, 1,
-0.247605, 0.7861316, -0.5626848, 0, 1, 0.4313726, 1,
-0.2456567, -0.9510775, -2.36098, 0, 1, 0.4352941, 1,
-0.2432816, -1.021775, -2.853533, 0, 1, 0.4431373, 1,
-0.2390884, -0.869902, -2.177217, 0, 1, 0.4470588, 1,
-0.2389677, -1.372974, -2.636655, 0, 1, 0.454902, 1,
-0.2387037, -0.4657647, -2.882012, 0, 1, 0.4588235, 1,
-0.2352014, -0.7193123, -1.669325, 0, 1, 0.4666667, 1,
-0.2292746, -2.232505, -3.040406, 0, 1, 0.4705882, 1,
-0.2269666, 0.3893866, 0.1846129, 0, 1, 0.4784314, 1,
-0.2235318, -0.08744594, -1.677091, 0, 1, 0.4823529, 1,
-0.2221039, 0.1988326, -1.126189, 0, 1, 0.4901961, 1,
-0.2194661, -0.2943701, -2.346886, 0, 1, 0.4941176, 1,
-0.2173291, -2.434551, -3.525885, 0, 1, 0.5019608, 1,
-0.2169125, 0.4377132, -2.424092, 0, 1, 0.509804, 1,
-0.2125719, 0.8832834, 0.4009422, 0, 1, 0.5137255, 1,
-0.2048344, 0.3492841, 0.3189068, 0, 1, 0.5215687, 1,
-0.202299, -0.3743125, -2.194018, 0, 1, 0.5254902, 1,
-0.2015888, -0.06772041, -2.590787, 0, 1, 0.5333334, 1,
-0.2008933, 0.9661922, -1.194541, 0, 1, 0.5372549, 1,
-0.200672, -0.8311455, -2.025057, 0, 1, 0.5450981, 1,
-0.1989429, -0.4756336, -3.832401, 0, 1, 0.5490196, 1,
-0.1964612, 0.6697958, -0.6938143, 0, 1, 0.5568628, 1,
-0.1964079, 0.2793398, -1.545831, 0, 1, 0.5607843, 1,
-0.1960475, -1.472409, -3.507102, 0, 1, 0.5686275, 1,
-0.1845418, -2.112492, -2.559046, 0, 1, 0.572549, 1,
-0.1839645, 0.7695361, -0.4807853, 0, 1, 0.5803922, 1,
-0.1828296, 0.1021361, -0.1203703, 0, 1, 0.5843138, 1,
-0.1817635, -0.2834267, -1.571427, 0, 1, 0.5921569, 1,
-0.1810046, 0.4820099, 0.8217783, 0, 1, 0.5960785, 1,
-0.164323, 0.6778312, 0.4424705, 0, 1, 0.6039216, 1,
-0.1589103, 3.239038, 1.153159, 0, 1, 0.6117647, 1,
-0.1582566, 1.866482, 0.1102784, 0, 1, 0.6156863, 1,
-0.1580827, 0.308801, 1.170969, 0, 1, 0.6235294, 1,
-0.1563767, 0.3356253, -1.786914, 0, 1, 0.627451, 1,
-0.155213, 0.0991413, -1.367813, 0, 1, 0.6352941, 1,
-0.1544148, 0.01692918, 0.2832898, 0, 1, 0.6392157, 1,
-0.1524003, 0.002108716, -0.766728, 0, 1, 0.6470588, 1,
-0.1519592, -0.3138404, -2.15251, 0, 1, 0.6509804, 1,
-0.1485665, -1.563701, -3.136032, 0, 1, 0.6588235, 1,
-0.1460165, -0.5969664, -2.94786, 0, 1, 0.6627451, 1,
-0.14431, 0.1909926, -0.08501589, 0, 1, 0.6705883, 1,
-0.1413949, -2.222489, -3.658028, 0, 1, 0.6745098, 1,
-0.1396733, 1.619138, 0.596604, 0, 1, 0.682353, 1,
-0.1370965, 0.6216674, -0.8661712, 0, 1, 0.6862745, 1,
-0.1320732, 0.5589957, 0.5590142, 0, 1, 0.6941177, 1,
-0.1297336, -0.6417152, -1.405921, 0, 1, 0.7019608, 1,
-0.1296361, -0.05395005, -2.414808, 0, 1, 0.7058824, 1,
-0.1288166, 1.274826, 0.08878087, 0, 1, 0.7137255, 1,
-0.1242319, -0.9676653, -2.151999, 0, 1, 0.7176471, 1,
-0.1219061, -0.5132207, -5.086643, 0, 1, 0.7254902, 1,
-0.1215251, 1.634695, 0.9384823, 0, 1, 0.7294118, 1,
-0.1212313, -0.1263122, -3.227793, 0, 1, 0.7372549, 1,
-0.1149468, -0.2010579, -3.542127, 0, 1, 0.7411765, 1,
-0.1111746, 2.316943, 0.8332652, 0, 1, 0.7490196, 1,
-0.1068401, 0.1617799, 0.06746131, 0, 1, 0.7529412, 1,
-0.09920053, -0.3553951, -0.9598556, 0, 1, 0.7607843, 1,
-0.09457874, 0.5638804, -1.527785, 0, 1, 0.7647059, 1,
-0.08979046, -0.159581, -0.4262947, 0, 1, 0.772549, 1,
-0.08608623, -0.3280875, -4.06021, 0, 1, 0.7764706, 1,
-0.08506698, 1.815484, -0.6315225, 0, 1, 0.7843137, 1,
-0.08304532, -0.1433997, -3.153741, 0, 1, 0.7882353, 1,
-0.08262776, -0.3744564, -2.101673, 0, 1, 0.7960784, 1,
-0.07843667, -1.109616, -2.408484, 0, 1, 0.8039216, 1,
-0.07764586, -1.257728, -3.384119, 0, 1, 0.8078431, 1,
-0.07504336, -0.3007784, -2.726094, 0, 1, 0.8156863, 1,
-0.07368666, 1.081781, -0.9523802, 0, 1, 0.8196079, 1,
-0.0726482, 1.277344, -0.4329442, 0, 1, 0.827451, 1,
-0.07194525, 2.571356, 0.09404255, 0, 1, 0.8313726, 1,
-0.06834186, -0.07205109, -1.203846, 0, 1, 0.8392157, 1,
-0.06726089, -0.5999151, -1.956263, 0, 1, 0.8431373, 1,
-0.0582813, 2.42257, -2.604225, 0, 1, 0.8509804, 1,
-0.05490908, 1.282905, 1.906902, 0, 1, 0.854902, 1,
-0.05361944, 1.705566, 2.061604, 0, 1, 0.8627451, 1,
-0.04658036, -0.1119469, -2.285367, 0, 1, 0.8666667, 1,
-0.04656521, -1.06509, -1.030204, 0, 1, 0.8745098, 1,
-0.04183187, -0.7448345, -4.167289, 0, 1, 0.8784314, 1,
-0.03937458, 0.02957132, -1.246429, 0, 1, 0.8862745, 1,
-0.03933657, -0.1907492, -3.013352, 0, 1, 0.8901961, 1,
-0.03498169, -0.07151521, -2.608857, 0, 1, 0.8980392, 1,
-0.03288341, 0.4376989, -1.020058, 0, 1, 0.9058824, 1,
-0.03226877, -0.9797745, -1.918041, 0, 1, 0.9098039, 1,
-0.03024787, 0.734841, 1.581335, 0, 1, 0.9176471, 1,
-0.0235976, -1.238622, -3.718407, 0, 1, 0.9215686, 1,
-0.02299099, 0.5314541, 1.02835, 0, 1, 0.9294118, 1,
-0.02110212, -0.2074921, -1.847676, 0, 1, 0.9333333, 1,
-0.01301873, -0.2959663, -3.215907, 0, 1, 0.9411765, 1,
-0.008429295, 0.2254368, 1.446227, 0, 1, 0.945098, 1,
-0.004425352, 1.413821, 1.120142, 0, 1, 0.9529412, 1,
-0.004058774, -0.2338545, -2.249452, 0, 1, 0.9568627, 1,
0.007056485, 0.8805976, 0.2162462, 0, 1, 0.9647059, 1,
0.007589122, -0.4445817, 2.085769, 0, 1, 0.9686275, 1,
0.008329608, 1.096317, -0.6159957, 0, 1, 0.9764706, 1,
0.01057533, 0.1009581, 0.5610951, 0, 1, 0.9803922, 1,
0.01266579, 2.111013, 0.2847067, 0, 1, 0.9882353, 1,
0.0129327, -0.6200453, 2.551503, 0, 1, 0.9921569, 1,
0.01433788, -0.3643244, 2.905354, 0, 1, 1, 1,
0.01472674, 0.3279408, 0.1858048, 0, 0.9921569, 1, 1,
0.01619465, -0.6656047, 2.464965, 0, 0.9882353, 1, 1,
0.02061304, -1.133274, 3.025594, 0, 0.9803922, 1, 1,
0.03338399, 0.2826891, -0.7806678, 0, 0.9764706, 1, 1,
0.03440636, 0.3900271, 0.2042992, 0, 0.9686275, 1, 1,
0.03841344, -0.03835103, 1.224381, 0, 0.9647059, 1, 1,
0.04226854, 0.2437997, 1.247797, 0, 0.9568627, 1, 1,
0.04239539, 1.621658, -1.166765, 0, 0.9529412, 1, 1,
0.0431565, 0.6193643, -0.9887298, 0, 0.945098, 1, 1,
0.04864903, 1.392251, -0.8181009, 0, 0.9411765, 1, 1,
0.04918633, 0.6388882, -0.18984, 0, 0.9333333, 1, 1,
0.05142539, -0.7436741, 3.743204, 0, 0.9294118, 1, 1,
0.05335505, 0.2612072, 0.9543331, 0, 0.9215686, 1, 1,
0.0601663, -1.377203, 4.207708, 0, 0.9176471, 1, 1,
0.06067472, -1.344961, 2.634737, 0, 0.9098039, 1, 1,
0.06460143, 0.09503205, 1.067165, 0, 0.9058824, 1, 1,
0.06484463, -0.9879831, 4.136784, 0, 0.8980392, 1, 1,
0.06503376, 1.848193, 0.4224962, 0, 0.8901961, 1, 1,
0.06511753, 1.909486, -0.1766235, 0, 0.8862745, 1, 1,
0.06957887, 0.3070581, 0.9358936, 0, 0.8784314, 1, 1,
0.07366718, 1.331283, -0.0105329, 0, 0.8745098, 1, 1,
0.07430112, 1.53831, 0.2311956, 0, 0.8666667, 1, 1,
0.07750197, 0.4647198, -0.8313916, 0, 0.8627451, 1, 1,
0.0796365, -1.753695, 3.863707, 0, 0.854902, 1, 1,
0.08085479, -0.1853776, 3.047981, 0, 0.8509804, 1, 1,
0.08114382, -0.03042919, 2.210635, 0, 0.8431373, 1, 1,
0.08480727, 0.04517896, 0.1126693, 0, 0.8392157, 1, 1,
0.08875074, 0.3424406, 0.4495193, 0, 0.8313726, 1, 1,
0.09131883, -1.566988, 1.398032, 0, 0.827451, 1, 1,
0.09167684, 0.8263531, 0.2839679, 0, 0.8196079, 1, 1,
0.09240878, -0.03545965, 2.592843, 0, 0.8156863, 1, 1,
0.09653184, 1.786046, 0.1829634, 0, 0.8078431, 1, 1,
0.09731387, -0.5524366, 2.322026, 0, 0.8039216, 1, 1,
0.1017783, -1.218406, 3.186839, 0, 0.7960784, 1, 1,
0.1023059, -0.5291905, 3.044413, 0, 0.7882353, 1, 1,
0.1065779, 1.225662, 0.1398512, 0, 0.7843137, 1, 1,
0.1083263, -0.6124503, 2.628893, 0, 0.7764706, 1, 1,
0.1133474, -0.1980306, 1.587049, 0, 0.772549, 1, 1,
0.1190165, -0.3541496, 3.043025, 0, 0.7647059, 1, 1,
0.1231592, -0.07966375, 4.870224, 0, 0.7607843, 1, 1,
0.1239686, 0.05311807, 0.6092117, 0, 0.7529412, 1, 1,
0.1256609, -0.4672526, 2.872065, 0, 0.7490196, 1, 1,
0.1259402, 0.5638096, 0.8794602, 0, 0.7411765, 1, 1,
0.1273898, -1.16707, 2.181476, 0, 0.7372549, 1, 1,
0.1325327, -0.9756013, 3.231502, 0, 0.7294118, 1, 1,
0.1327108, 1.044004, -1.188119, 0, 0.7254902, 1, 1,
0.1334085, 0.0393676, 1.698992, 0, 0.7176471, 1, 1,
0.1369462, 1.469586, -0.195033, 0, 0.7137255, 1, 1,
0.1388776, 0.3398517, -0.525919, 0, 0.7058824, 1, 1,
0.1405749, 0.4080108, 1.145506, 0, 0.6980392, 1, 1,
0.1416675, -1.090699, 2.86505, 0, 0.6941177, 1, 1,
0.141864, -0.07567852, 0.8594987, 0, 0.6862745, 1, 1,
0.1446968, -0.2887542, 2.039679, 0, 0.682353, 1, 1,
0.1460519, 0.7288245, 2.184394, 0, 0.6745098, 1, 1,
0.1465479, 2.40275, 0.4078337, 0, 0.6705883, 1, 1,
0.1469816, -0.3296896, 3.293019, 0, 0.6627451, 1, 1,
0.1520094, -0.371026, 3.798092, 0, 0.6588235, 1, 1,
0.1522322, 2.11517, 1.149832, 0, 0.6509804, 1, 1,
0.1580279, 0.5639968, 0.05325472, 0, 0.6470588, 1, 1,
0.1598594, 0.4712345, -1.089304, 0, 0.6392157, 1, 1,
0.1626635, 0.06660877, 1.386197, 0, 0.6352941, 1, 1,
0.1638624, 0.4279055, 0.5984231, 0, 0.627451, 1, 1,
0.1642298, -0.04831152, 2.274256, 0, 0.6235294, 1, 1,
0.1700214, -0.02505552, 4.520228, 0, 0.6156863, 1, 1,
0.1724941, -0.7460895, 3.985339, 0, 0.6117647, 1, 1,
0.1817139, -1.515345, 3.93706, 0, 0.6039216, 1, 1,
0.1845924, 1.11328, -0.7854907, 0, 0.5960785, 1, 1,
0.1852457, -0.9211691, 1.971283, 0, 0.5921569, 1, 1,
0.1865178, 0.8929627, 1.091277, 0, 0.5843138, 1, 1,
0.1873675, 0.5714565, 2.464757, 0, 0.5803922, 1, 1,
0.1910789, 0.6995423, 0.7647755, 0, 0.572549, 1, 1,
0.1924501, -0.5903282, 3.017845, 0, 0.5686275, 1, 1,
0.1963384, 0.09426207, 0.03966407, 0, 0.5607843, 1, 1,
0.1996258, -0.5757593, 1.958928, 0, 0.5568628, 1, 1,
0.2004882, -0.4704159, 3.681537, 0, 0.5490196, 1, 1,
0.2014272, -0.4612332, 3.467767, 0, 0.5450981, 1, 1,
0.2021451, 0.7681458, 0.9577944, 0, 0.5372549, 1, 1,
0.2035987, -1.610418, 1.544424, 0, 0.5333334, 1, 1,
0.2051092, -0.968523, 0.9627278, 0, 0.5254902, 1, 1,
0.2057104, 0.02504667, 1.697504, 0, 0.5215687, 1, 1,
0.2066204, -0.3063446, 2.820152, 0, 0.5137255, 1, 1,
0.2087654, -0.4610665, 4.728928, 0, 0.509804, 1, 1,
0.2138732, -0.6315458, 2.891412, 0, 0.5019608, 1, 1,
0.2199475, 0.09987889, 2.266209, 0, 0.4941176, 1, 1,
0.2265599, -0.8389508, 3.622926, 0, 0.4901961, 1, 1,
0.2315967, 0.9318165, 0.8049156, 0, 0.4823529, 1, 1,
0.2369484, 1.770289, -0.1109764, 0, 0.4784314, 1, 1,
0.2374268, -1.111766, 2.266126, 0, 0.4705882, 1, 1,
0.2402722, 0.6421644, 0.5858064, 0, 0.4666667, 1, 1,
0.2409959, 0.2074602, 1.452287, 0, 0.4588235, 1, 1,
0.2431968, -1.569046, 2.667927, 0, 0.454902, 1, 1,
0.2454, 1.694371, 1.182536, 0, 0.4470588, 1, 1,
0.2462723, -0.5653471, 1.862526, 0, 0.4431373, 1, 1,
0.2472248, -1.36716, 2.092241, 0, 0.4352941, 1, 1,
0.2524714, 0.009995284, 0.9174077, 0, 0.4313726, 1, 1,
0.2543686, 0.2873395, 1.713874, 0, 0.4235294, 1, 1,
0.2599327, 0.7244602, 1.203514, 0, 0.4196078, 1, 1,
0.2619099, 0.07739326, 2.257716, 0, 0.4117647, 1, 1,
0.2675214, 0.1066927, 0.6274743, 0, 0.4078431, 1, 1,
0.2679348, -0.8727925, 1.447933, 0, 0.4, 1, 1,
0.2697947, 2.02014, 0.06089169, 0, 0.3921569, 1, 1,
0.2698759, 0.826104, 0.4477827, 0, 0.3882353, 1, 1,
0.2744459, -0.2873421, 1.666075, 0, 0.3803922, 1, 1,
0.2788981, -0.8347703, 3.115344, 0, 0.3764706, 1, 1,
0.2822753, -0.7152135, 4.28489, 0, 0.3686275, 1, 1,
0.2833002, -0.2422267, 3.297049, 0, 0.3647059, 1, 1,
0.2857434, 0.5240598, 0.610819, 0, 0.3568628, 1, 1,
0.2862375, 0.8042633, -0.138269, 0, 0.3529412, 1, 1,
0.2875325, 0.3464605, 1.299975, 0, 0.345098, 1, 1,
0.2903669, 0.03232579, -0.05262781, 0, 0.3411765, 1, 1,
0.2917717, -0.7114872, 1.801051, 0, 0.3333333, 1, 1,
0.295928, 0.2034534, 1.443054, 0, 0.3294118, 1, 1,
0.297559, 0.1486833, 0.7553838, 0, 0.3215686, 1, 1,
0.2983139, 0.5242863, 1.375083, 0, 0.3176471, 1, 1,
0.2984287, 0.7756107, 0.2340732, 0, 0.3098039, 1, 1,
0.3013409, -0.4342497, 4.055734, 0, 0.3058824, 1, 1,
0.3051406, -1.428437, 3.125445, 0, 0.2980392, 1, 1,
0.3099096, -0.7135634, 3.58381, 0, 0.2901961, 1, 1,
0.3185576, -1.894938, 5.620332, 0, 0.2862745, 1, 1,
0.3208737, 0.6080633, 1.018189, 0, 0.2784314, 1, 1,
0.3223135, 1.759958, -0.3805406, 0, 0.2745098, 1, 1,
0.3234079, 0.7725829, 2.239275, 0, 0.2666667, 1, 1,
0.3262176, -1.303436, 2.253009, 0, 0.2627451, 1, 1,
0.3263012, -1.291, 3.068772, 0, 0.254902, 1, 1,
0.3295591, -0.2877794, 1.170817, 0, 0.2509804, 1, 1,
0.337106, 1.143258, 1.010016, 0, 0.2431373, 1, 1,
0.3400677, -0.02490686, 0.4212592, 0, 0.2392157, 1, 1,
0.3418489, 0.1531532, 0.5475102, 0, 0.2313726, 1, 1,
0.3511758, 0.1125498, 0.6514935, 0, 0.227451, 1, 1,
0.3519217, 0.3871599, -0.4664492, 0, 0.2196078, 1, 1,
0.3576172, -1.187773, 2.923428, 0, 0.2156863, 1, 1,
0.3577366, -0.7489207, 1.758679, 0, 0.2078431, 1, 1,
0.3590577, 0.6810164, 1.190672, 0, 0.2039216, 1, 1,
0.363133, 1.725026, 0.7836722, 0, 0.1960784, 1, 1,
0.363886, -1.185706, 4.176332, 0, 0.1882353, 1, 1,
0.3679598, 0.1480454, -0.3022998, 0, 0.1843137, 1, 1,
0.3701215, -1.174052, 3.635021, 0, 0.1764706, 1, 1,
0.3741932, -0.3425453, 3.111565, 0, 0.172549, 1, 1,
0.3761987, 0.5958325, 1.112291, 0, 0.1647059, 1, 1,
0.3808405, -1.860067, 3.150923, 0, 0.1607843, 1, 1,
0.38124, 0.9788507, 0.9342379, 0, 0.1529412, 1, 1,
0.3878174, 1.222259, 0.03063685, 0, 0.1490196, 1, 1,
0.3878419, 1.274165, -0.1587275, 0, 0.1411765, 1, 1,
0.4035779, 0.4001461, 1.03108, 0, 0.1372549, 1, 1,
0.4061258, 2.043656, -0.233624, 0, 0.1294118, 1, 1,
0.4124238, 0.7190428, 1.327892, 0, 0.1254902, 1, 1,
0.4157359, -0.03427532, 1.864915, 0, 0.1176471, 1, 1,
0.4194597, -1.74613, 3.696831, 0, 0.1137255, 1, 1,
0.4207994, 2.468028, -0.1839887, 0, 0.1058824, 1, 1,
0.4209048, 0.1570761, 1.340993, 0, 0.09803922, 1, 1,
0.4220999, -2.688278, 2.441895, 0, 0.09411765, 1, 1,
0.4230927, 0.9664017, 1.045071, 0, 0.08627451, 1, 1,
0.425005, -0.8304217, 1.729831, 0, 0.08235294, 1, 1,
0.4265941, -0.4894721, 1.572213, 0, 0.07450981, 1, 1,
0.426819, -0.563808, 4.658114, 0, 0.07058824, 1, 1,
0.4331795, 1.128506, 2.179932, 0, 0.0627451, 1, 1,
0.4333642, -1.224473, 1.506353, 0, 0.05882353, 1, 1,
0.436317, 0.501738, 2.782023, 0, 0.05098039, 1, 1,
0.4375225, -0.6948836, 2.38189, 0, 0.04705882, 1, 1,
0.4378962, -0.2362442, 2.494464, 0, 0.03921569, 1, 1,
0.4435467, -1.72697, 2.728622, 0, 0.03529412, 1, 1,
0.4478837, -0.1500383, 3.07137, 0, 0.02745098, 1, 1,
0.4513866, 0.2372443, 1.233742, 0, 0.02352941, 1, 1,
0.4542502, 0.3263953, 1.646067, 0, 0.01568628, 1, 1,
0.4565702, 0.6237113, 0.1755248, 0, 0.01176471, 1, 1,
0.4637019, 0.8361193, 0.09220348, 0, 0.003921569, 1, 1,
0.4644031, -1.328931, 2.931528, 0.003921569, 0, 1, 1,
0.4658231, -0.01077831, 2.428054, 0.007843138, 0, 1, 1,
0.4669951, -1.304023, 1.115778, 0.01568628, 0, 1, 1,
0.468165, 0.06570655, 1.493197, 0.01960784, 0, 1, 1,
0.4723245, 0.9270739, 0.7524205, 0.02745098, 0, 1, 1,
0.4724385, -0.01752665, 0.7353951, 0.03137255, 0, 1, 1,
0.473125, -0.2218578, 0.9417116, 0.03921569, 0, 1, 1,
0.479916, 0.07521234, 0.9637229, 0.04313726, 0, 1, 1,
0.4828696, 0.1308976, 1.737689, 0.05098039, 0, 1, 1,
0.4834273, -0.4490903, 2.389159, 0.05490196, 0, 1, 1,
0.4895148, 0.5964504, 0.3168061, 0.0627451, 0, 1, 1,
0.4917793, -0.551297, 2.633719, 0.06666667, 0, 1, 1,
0.4935641, -0.602186, 3.561451, 0.07450981, 0, 1, 1,
0.4947352, 0.3694832, 1.536106, 0.07843138, 0, 1, 1,
0.495381, 0.4252077, -0.7527165, 0.08627451, 0, 1, 1,
0.4963983, -0.5915504, 4.073917, 0.09019608, 0, 1, 1,
0.5039918, -1.532136, 2.337479, 0.09803922, 0, 1, 1,
0.5055808, 0.9541043, 0.6035622, 0.1058824, 0, 1, 1,
0.5078248, -1.017285, 3.501604, 0.1098039, 0, 1, 1,
0.5114878, 0.09174898, 1.205296, 0.1176471, 0, 1, 1,
0.5134041, -2.805078, 1.087748, 0.1215686, 0, 1, 1,
0.516932, 0.9471527, -0.51218, 0.1294118, 0, 1, 1,
0.5178425, 0.5576316, 0.7550589, 0.1333333, 0, 1, 1,
0.5310429, 0.8051023, -0.892781, 0.1411765, 0, 1, 1,
0.5332863, -0.8518865, 2.617717, 0.145098, 0, 1, 1,
0.5374529, -0.08314051, 2.570909, 0.1529412, 0, 1, 1,
0.537484, 1.189543, -0.1798154, 0.1568628, 0, 1, 1,
0.5387988, 1.660492, 1.85551, 0.1647059, 0, 1, 1,
0.5455183, -0.7955104, 2.53666, 0.1686275, 0, 1, 1,
0.5462797, 0.07616573, 2.268215, 0.1764706, 0, 1, 1,
0.5475764, 1.26733, 0.6361029, 0.1803922, 0, 1, 1,
0.5524586, -1.022313, 1.421631, 0.1882353, 0, 1, 1,
0.5543486, 1.077877, 1.064348, 0.1921569, 0, 1, 1,
0.5598465, -1.381047, 1.63746, 0.2, 0, 1, 1,
0.5672294, -0.6772823, 4.171662, 0.2078431, 0, 1, 1,
0.5679262, -0.7074516, 3.667341, 0.2117647, 0, 1, 1,
0.5680277, -0.3817227, 1.587911, 0.2196078, 0, 1, 1,
0.5717788, -0.887705, 2.201433, 0.2235294, 0, 1, 1,
0.5721151, -0.0758501, 2.081628, 0.2313726, 0, 1, 1,
0.5738032, -1.313544, 1.675938, 0.2352941, 0, 1, 1,
0.5749375, -0.8399664, 4.084585, 0.2431373, 0, 1, 1,
0.579916, -0.5839581, 0.3757956, 0.2470588, 0, 1, 1,
0.5799341, -0.3501189, 2.269675, 0.254902, 0, 1, 1,
0.5856964, 2.655864, 0.726687, 0.2588235, 0, 1, 1,
0.5865382, 0.5344176, -0.18852, 0.2666667, 0, 1, 1,
0.5877957, 0.5076105, 0.1281745, 0.2705882, 0, 1, 1,
0.5885212, -0.5038383, 1.088717, 0.2784314, 0, 1, 1,
0.5908252, -0.1880479, 0.7679809, 0.282353, 0, 1, 1,
0.5910903, 0.1188138, 2.287156, 0.2901961, 0, 1, 1,
0.5911474, -1.748625, 2.736933, 0.2941177, 0, 1, 1,
0.5928372, 0.384815, 0.6482574, 0.3019608, 0, 1, 1,
0.5968328, -0.005992698, 0.8807024, 0.3098039, 0, 1, 1,
0.6012061, 0.6618672, 1.342272, 0.3137255, 0, 1, 1,
0.6039011, -0.04330348, 2.243114, 0.3215686, 0, 1, 1,
0.6041479, -0.8338386, 3.851918, 0.3254902, 0, 1, 1,
0.6043926, 0.2751479, 1.168334, 0.3333333, 0, 1, 1,
0.6054592, -0.5046366, 1.271959, 0.3372549, 0, 1, 1,
0.6073303, -0.3145079, 1.468725, 0.345098, 0, 1, 1,
0.6078165, -1.796075, 2.622874, 0.3490196, 0, 1, 1,
0.6081991, -1.925959, 3.007602, 0.3568628, 0, 1, 1,
0.6082522, -1.192862, 1.790021, 0.3607843, 0, 1, 1,
0.6096756, 0.6904202, 2.630309, 0.3686275, 0, 1, 1,
0.6140776, -0.7722929, 1.754514, 0.372549, 0, 1, 1,
0.6189637, -0.7780777, 1.221722, 0.3803922, 0, 1, 1,
0.6190794, 0.4513605, 2.396805, 0.3843137, 0, 1, 1,
0.6200816, -0.5068294, 3.07927, 0.3921569, 0, 1, 1,
0.6257428, -1.885171, 2.22125, 0.3960784, 0, 1, 1,
0.6287365, 0.2064889, 2.216527, 0.4039216, 0, 1, 1,
0.6288992, 2.051215, 1.472658, 0.4117647, 0, 1, 1,
0.6326863, 0.356468, -0.1571479, 0.4156863, 0, 1, 1,
0.6389892, -0.2691744, 0.2157303, 0.4235294, 0, 1, 1,
0.6425912, -0.5979061, 1.675809, 0.427451, 0, 1, 1,
0.6433576, -0.3093244, 0.5639859, 0.4352941, 0, 1, 1,
0.6476555, -0.9814669, 2.850596, 0.4392157, 0, 1, 1,
0.6514958, 0.8366177, -0.4408146, 0.4470588, 0, 1, 1,
0.6533266, 0.4230618, 0.1543502, 0.4509804, 0, 1, 1,
0.6533548, -0.2055966, 0.7944415, 0.4588235, 0, 1, 1,
0.6550978, -1.672458, 1.99521, 0.4627451, 0, 1, 1,
0.6620795, -0.9759808, 1.88221, 0.4705882, 0, 1, 1,
0.6642913, 0.3704597, 1.082456, 0.4745098, 0, 1, 1,
0.6653023, 0.04387985, 2.634622, 0.4823529, 0, 1, 1,
0.6705586, -0.07389604, 1.426965, 0.4862745, 0, 1, 1,
0.6719737, 0.167117, 2.067145, 0.4941176, 0, 1, 1,
0.6767238, 2.299716, 0.3933508, 0.5019608, 0, 1, 1,
0.6884718, -0.368402, 1.942436, 0.5058824, 0, 1, 1,
0.6889645, -0.04020312, 2.22303, 0.5137255, 0, 1, 1,
0.6900972, -0.9906337, 2.778481, 0.5176471, 0, 1, 1,
0.6912826, 1.020682, -0.2544408, 0.5254902, 0, 1, 1,
0.6933373, 0.1150958, 1.490137, 0.5294118, 0, 1, 1,
0.6956617, -0.9758853, 2.817116, 0.5372549, 0, 1, 1,
0.6965476, 0.1918719, -0.2632921, 0.5411765, 0, 1, 1,
0.7053363, 0.4540641, 0.01040973, 0.5490196, 0, 1, 1,
0.7083507, -0.6588907, 2.995789, 0.5529412, 0, 1, 1,
0.7134677, 0.945883, 0.9270755, 0.5607843, 0, 1, 1,
0.7146205, -0.1978019, 2.207422, 0.5647059, 0, 1, 1,
0.7192093, 0.2283907, 2.0432, 0.572549, 0, 1, 1,
0.7234298, -0.2376775, 2.202852, 0.5764706, 0, 1, 1,
0.7259254, 0.1382771, 0.6359916, 0.5843138, 0, 1, 1,
0.730834, 1.741517, 1.187502, 0.5882353, 0, 1, 1,
0.7326807, -0.2609885, 1.108875, 0.5960785, 0, 1, 1,
0.7376982, 0.3409391, 1.094067, 0.6039216, 0, 1, 1,
0.7396527, -2.581962, 3.193814, 0.6078432, 0, 1, 1,
0.7403966, -1.215862, 2.372429, 0.6156863, 0, 1, 1,
0.7424012, 1.96393, -0.4272786, 0.6196079, 0, 1, 1,
0.746367, -0.3204939, 1.113784, 0.627451, 0, 1, 1,
0.7477189, 0.6977814, 3.480698, 0.6313726, 0, 1, 1,
0.74933, 0.5528514, -0.7336463, 0.6392157, 0, 1, 1,
0.7500068, 1.60658, 0.5525059, 0.6431373, 0, 1, 1,
0.7507809, 0.3503321, 3.499262, 0.6509804, 0, 1, 1,
0.7510845, 0.3512693, 2.689429, 0.654902, 0, 1, 1,
0.757014, -0.3679327, 1.060457, 0.6627451, 0, 1, 1,
0.7637078, 0.4851316, 0.9800977, 0.6666667, 0, 1, 1,
0.7686616, 0.223623, 3.253851, 0.6745098, 0, 1, 1,
0.7773198, -0.4622443, 2.579715, 0.6784314, 0, 1, 1,
0.7809796, -1.498423, 1.348969, 0.6862745, 0, 1, 1,
0.786989, 0.3678241, 1.205046, 0.6901961, 0, 1, 1,
0.7897783, 0.3538878, 1.296744, 0.6980392, 0, 1, 1,
0.7917085, 0.9933775, 0.8118446, 0.7058824, 0, 1, 1,
0.7945362, -0.8278453, 2.380693, 0.7098039, 0, 1, 1,
0.7964622, 0.4335718, 2.594677, 0.7176471, 0, 1, 1,
0.8060759, 0.9258053, 0.2135794, 0.7215686, 0, 1, 1,
0.8238853, -0.2759777, 3.178926, 0.7294118, 0, 1, 1,
0.8251777, 0.08441924, 2.27529, 0.7333333, 0, 1, 1,
0.8251891, 0.3168026, 2.816945, 0.7411765, 0, 1, 1,
0.8260785, 0.1660947, 0.6728496, 0.7450981, 0, 1, 1,
0.8300877, 0.06189269, 2.520514, 0.7529412, 0, 1, 1,
0.8452944, 0.2466349, -0.2682115, 0.7568628, 0, 1, 1,
0.8470982, -0.594713, 1.272941, 0.7647059, 0, 1, 1,
0.8512551, -1.812487, 1.927563, 0.7686275, 0, 1, 1,
0.8532155, 1.690629, -0.3585252, 0.7764706, 0, 1, 1,
0.8582045, 1.177256, -0.1287116, 0.7803922, 0, 1, 1,
0.8582571, -0.6538648, 2.843121, 0.7882353, 0, 1, 1,
0.8603508, -1.075327, 3.464842, 0.7921569, 0, 1, 1,
0.8627254, -1.550882, 3.813337, 0.8, 0, 1, 1,
0.8649856, -0.9510825, 3.068864, 0.8078431, 0, 1, 1,
0.872064, -0.05275065, 1.963626, 0.8117647, 0, 1, 1,
0.8746421, 0.3523553, 0.9328994, 0.8196079, 0, 1, 1,
0.8777548, 0.8665951, 1.125597, 0.8235294, 0, 1, 1,
0.8808599, 1.574764, 0.2522159, 0.8313726, 0, 1, 1,
0.8808926, -1.737973, 2.439261, 0.8352941, 0, 1, 1,
0.8823568, 0.4008372, 0.5895803, 0.8431373, 0, 1, 1,
0.8931243, 0.9917715, 0.2124108, 0.8470588, 0, 1, 1,
0.9012596, -1.243379, 2.436801, 0.854902, 0, 1, 1,
0.9015028, -0.6995885, 3.004495, 0.8588235, 0, 1, 1,
0.9029012, -1.148853, 2.349043, 0.8666667, 0, 1, 1,
0.906831, 1.304755, 0.6258358, 0.8705882, 0, 1, 1,
0.9068996, -0.2277658, 1.729959, 0.8784314, 0, 1, 1,
0.9086313, -0.03039578, 1.269547, 0.8823529, 0, 1, 1,
0.9137124, 0.2333184, 0.5796856, 0.8901961, 0, 1, 1,
0.9142059, 1.898787, 2.311917, 0.8941177, 0, 1, 1,
0.9155287, 0.1644515, 2.874888, 0.9019608, 0, 1, 1,
0.9165815, 0.9952376, -1.231544, 0.9098039, 0, 1, 1,
0.9189577, 0.436776, 1.38193, 0.9137255, 0, 1, 1,
0.9193648, -1.460521, 1.586036, 0.9215686, 0, 1, 1,
0.9203056, 0.4895158, 1.340257, 0.9254902, 0, 1, 1,
0.9213877, -0.5821513, 1.316196, 0.9333333, 0, 1, 1,
0.9215745, -2.361637, 0.7612528, 0.9372549, 0, 1, 1,
0.9257625, -0.09082367, 2.944331, 0.945098, 0, 1, 1,
0.9295762, -0.8334457, 2.506304, 0.9490196, 0, 1, 1,
0.9300174, -0.8185723, 2.360173, 0.9568627, 0, 1, 1,
0.9375486, -0.3274386, 2.728518, 0.9607843, 0, 1, 1,
0.9394825, -0.9585652, 0.5794508, 0.9686275, 0, 1, 1,
0.9426852, 0.08933797, 0.8815244, 0.972549, 0, 1, 1,
0.9548008, -0.9217881, 2.274461, 0.9803922, 0, 1, 1,
0.9568508, -0.2351732, 2.164487, 0.9843137, 0, 1, 1,
0.9621792, -1.003892, 3.304931, 0.9921569, 0, 1, 1,
0.9665302, 0.6631291, -1.427115, 0.9960784, 0, 1, 1,
0.9786764, -0.01631917, 0.5288116, 1, 0, 0.9960784, 1,
0.9817999, 0.3056724, 0.8118903, 1, 0, 0.9882353, 1,
0.9865253, -0.159041, 1.226436, 1, 0, 0.9843137, 1,
0.987894, -0.9116485, 4.130672, 1, 0, 0.9764706, 1,
0.9915885, 0.5302403, 1.563964, 1, 0, 0.972549, 1,
0.9985621, 0.09813657, 2.056587, 1, 0, 0.9647059, 1,
1.004632, 0.05743686, 1.575327, 1, 0, 0.9607843, 1,
1.006341, 0.4690231, 0.2531908, 1, 0, 0.9529412, 1,
1.006468, -2.136812, 4.913216, 1, 0, 0.9490196, 1,
1.010293, -0.3263485, 2.312169, 1, 0, 0.9411765, 1,
1.012456, 0.2867155, 2.119153, 1, 0, 0.9372549, 1,
1.015941, -0.1761112, 1.114859, 1, 0, 0.9294118, 1,
1.035171, 2.329957, -2.178616, 1, 0, 0.9254902, 1,
1.042792, 1.78619, 3.269361, 1, 0, 0.9176471, 1,
1.050914, 0.581878, 2.430528, 1, 0, 0.9137255, 1,
1.054219, -0.9862769, 3.386252, 1, 0, 0.9058824, 1,
1.058169, -0.6299438, -0.6830691, 1, 0, 0.9019608, 1,
1.059757, 1.703552, 1.692089, 1, 0, 0.8941177, 1,
1.061078, -0.6925685, 1.376725, 1, 0, 0.8862745, 1,
1.066452, -2.155253, 4.558588, 1, 0, 0.8823529, 1,
1.066931, -1.437679, 3.585022, 1, 0, 0.8745098, 1,
1.067825, -0.4043277, 3.472382, 1, 0, 0.8705882, 1,
1.072375, -2.634054, 3.520037, 1, 0, 0.8627451, 1,
1.075785, -0.3511914, 2.486761, 1, 0, 0.8588235, 1,
1.078166, 2.057724, 1.577241, 1, 0, 0.8509804, 1,
1.080554, -0.956972, 2.124313, 1, 0, 0.8470588, 1,
1.096703, 0.2621129, -0.2583998, 1, 0, 0.8392157, 1,
1.098172, -1.241669, 1.750165, 1, 0, 0.8352941, 1,
1.112865, 0.9843944, 0.5333339, 1, 0, 0.827451, 1,
1.112986, -1.766882, 2.389835, 1, 0, 0.8235294, 1,
1.113336, 0.5321742, -0.9705725, 1, 0, 0.8156863, 1,
1.11611, -0.7776273, 4.112595, 1, 0, 0.8117647, 1,
1.119981, 0.05436744, 1.854973, 1, 0, 0.8039216, 1,
1.123039, -0.5944299, 3.700936, 1, 0, 0.7960784, 1,
1.124444, -0.3163388, 1.384372, 1, 0, 0.7921569, 1,
1.129435, 1.199866, 2.261979, 1, 0, 0.7843137, 1,
1.132657, -0.8579677, 3.270734, 1, 0, 0.7803922, 1,
1.137422, -1.58624, 1.831285, 1, 0, 0.772549, 1,
1.139494, -1.053821, 2.800568, 1, 0, 0.7686275, 1,
1.144286, 0.0009511976, 0.887343, 1, 0, 0.7607843, 1,
1.150912, 1.586069, -0.07865455, 1, 0, 0.7568628, 1,
1.154672, 1.687596, -1.816048, 1, 0, 0.7490196, 1,
1.158248, 2.183942, -0.5943314, 1, 0, 0.7450981, 1,
1.170893, 0.3886769, 2.15776, 1, 0, 0.7372549, 1,
1.1794, -0.4027064, -0.30484, 1, 0, 0.7333333, 1,
1.1818, -1.86768, 2.572605, 1, 0, 0.7254902, 1,
1.181947, -0.9379038, 2.05634, 1, 0, 0.7215686, 1,
1.185339, -0.7953355, 3.07224, 1, 0, 0.7137255, 1,
1.199383, 0.3971115, 2.961694, 1, 0, 0.7098039, 1,
1.200514, -0.5096221, 2.010263, 1, 0, 0.7019608, 1,
1.207363, 0.1127453, 1.882562, 1, 0, 0.6941177, 1,
1.213661, 1.387646, 1.271728, 1, 0, 0.6901961, 1,
1.226406, -0.1726422, 0.2784124, 1, 0, 0.682353, 1,
1.23154, -1.998774, 2.509807, 1, 0, 0.6784314, 1,
1.235952, -1.369545, 0.7483218, 1, 0, 0.6705883, 1,
1.241694, -0.01551475, 2.949201, 1, 0, 0.6666667, 1,
1.243952, 1.610987, -0.2075663, 1, 0, 0.6588235, 1,
1.251361, 0.03006712, 0.8810328, 1, 0, 0.654902, 1,
1.254026, -0.8544306, 2.067164, 1, 0, 0.6470588, 1,
1.264992, 1.356368, 1.745769, 1, 0, 0.6431373, 1,
1.267896, -1.129696, 3.264947, 1, 0, 0.6352941, 1,
1.27871, 0.1982352, 1.69879, 1, 0, 0.6313726, 1,
1.300005, -0.9508812, 1.034068, 1, 0, 0.6235294, 1,
1.302521, 0.812835, 1.79057, 1, 0, 0.6196079, 1,
1.30481, 0.03632649, 1.466002, 1, 0, 0.6117647, 1,
1.308483, 0.6959374, 1.148055, 1, 0, 0.6078432, 1,
1.320692, 0.3625649, 1.401954, 1, 0, 0.6, 1,
1.332049, 1.159573, 0.2376819, 1, 0, 0.5921569, 1,
1.337765, -0.9326634, 3.033934, 1, 0, 0.5882353, 1,
1.350698, -1.135163, 2.953595, 1, 0, 0.5803922, 1,
1.358079, -0.0491646, 2.268127, 1, 0, 0.5764706, 1,
1.360356, 0.3905861, 2.479661, 1, 0, 0.5686275, 1,
1.361648, -1.20868, 2.480606, 1, 0, 0.5647059, 1,
1.378969, -1.393602, 3.142659, 1, 0, 0.5568628, 1,
1.381963, 1.378748, 1.769623, 1, 0, 0.5529412, 1,
1.387945, -1.707727, 2.086842, 1, 0, 0.5450981, 1,
1.389134, 0.2545768, 1.920835, 1, 0, 0.5411765, 1,
1.40556, -1.423357, 2.750103, 1, 0, 0.5333334, 1,
1.419315, 0.3069339, 3.246804, 1, 0, 0.5294118, 1,
1.435351, -1.206318, -0.2736762, 1, 0, 0.5215687, 1,
1.449722, -0.3437259, 2.570989, 1, 0, 0.5176471, 1,
1.453938, 0.5984325, 1.763993, 1, 0, 0.509804, 1,
1.458732, 0.7420521, 0.864226, 1, 0, 0.5058824, 1,
1.460981, -1.016253, 1.289544, 1, 0, 0.4980392, 1,
1.460992, -0.3449364, 1.195365, 1, 0, 0.4901961, 1,
1.476232, -1.041209, 1.25468, 1, 0, 0.4862745, 1,
1.479947, -0.4999773, 0.9467857, 1, 0, 0.4784314, 1,
1.484402, 0.6149415, 0.7633319, 1, 0, 0.4745098, 1,
1.493208, -0.8888015, 3.176988, 1, 0, 0.4666667, 1,
1.494207, 0.2272311, 1.440196, 1, 0, 0.4627451, 1,
1.495729, 0.4574572, 2.496089, 1, 0, 0.454902, 1,
1.496542, 1.629024, -0.6714176, 1, 0, 0.4509804, 1,
1.512777, 1.203613, 0.7479547, 1, 0, 0.4431373, 1,
1.513233, -1.747077, 1.986165, 1, 0, 0.4392157, 1,
1.516485, 2.585148, 1.113476, 1, 0, 0.4313726, 1,
1.518056, 0.02172106, 2.898695, 1, 0, 0.427451, 1,
1.521344, -0.3367614, 2.138684, 1, 0, 0.4196078, 1,
1.528024, 1.38699, 0.9355675, 1, 0, 0.4156863, 1,
1.528307, -2.10017, 2.969025, 1, 0, 0.4078431, 1,
1.530692, 1.938865, 0.7372195, 1, 0, 0.4039216, 1,
1.55405, 0.1770875, 1.914006, 1, 0, 0.3960784, 1,
1.569315, -1.823347, 1.829746, 1, 0, 0.3882353, 1,
1.577136, -1.28135, 0.8403746, 1, 0, 0.3843137, 1,
1.579151, 0.8609967, 2.224767, 1, 0, 0.3764706, 1,
1.581493, -0.7675897, 2.600312, 1, 0, 0.372549, 1,
1.583156, -0.8524987, 3.288454, 1, 0, 0.3647059, 1,
1.612771, -0.2376563, 0.3985091, 1, 0, 0.3607843, 1,
1.628776, -0.9767158, 1.73991, 1, 0, 0.3529412, 1,
1.643855, -0.3069797, 0.515395, 1, 0, 0.3490196, 1,
1.650144, 1.687186, 1.324377, 1, 0, 0.3411765, 1,
1.67264, -0.1871962, 1.152675, 1, 0, 0.3372549, 1,
1.68184, -0.8815448, -0.1816662, 1, 0, 0.3294118, 1,
1.683649, 0.2799528, 0.8983567, 1, 0, 0.3254902, 1,
1.691929, -0.9580181, 2.931112, 1, 0, 0.3176471, 1,
1.701854, -0.4308504, 2.040217, 1, 0, 0.3137255, 1,
1.730116, 0.6406807, 1.840016, 1, 0, 0.3058824, 1,
1.731227, -1.79523, 1.672444, 1, 0, 0.2980392, 1,
1.738135, 1.557613, -1.83498, 1, 0, 0.2941177, 1,
1.738565, -1.03145, 3.052069, 1, 0, 0.2862745, 1,
1.743297, 1.284068, -0.248969, 1, 0, 0.282353, 1,
1.749009, 0.6026334, 2.844738, 1, 0, 0.2745098, 1,
1.763955, 0.813689, 0.3995598, 1, 0, 0.2705882, 1,
1.773984, -0.9416777, 2.396495, 1, 0, 0.2627451, 1,
1.775586, 0.002132887, 3.431715, 1, 0, 0.2588235, 1,
1.809041, -0.9922997, 1.893536, 1, 0, 0.2509804, 1,
1.832871, -1.169424, 3.355644, 1, 0, 0.2470588, 1,
1.847671, -0.6554363, 1.988326, 1, 0, 0.2392157, 1,
1.852079, 0.2348514, -0.04863447, 1, 0, 0.2352941, 1,
1.8615, -0.2229005, 1.286376, 1, 0, 0.227451, 1,
1.862884, -0.03477023, 3.467819, 1, 0, 0.2235294, 1,
1.868996, 0.8383691, 0.7741768, 1, 0, 0.2156863, 1,
1.873971, -0.947342, 3.716419, 1, 0, 0.2117647, 1,
1.888548, 1.666066, 0.3421203, 1, 0, 0.2039216, 1,
1.902622, -1.186563, 2.492625, 1, 0, 0.1960784, 1,
1.918594, -0.1213401, 3.213502, 1, 0, 0.1921569, 1,
1.953719, 0.5414889, 1.362078, 1, 0, 0.1843137, 1,
1.961847, -1.582922, 2.487652, 1, 0, 0.1803922, 1,
1.968273, 0.1624113, 2.23983, 1, 0, 0.172549, 1,
1.970356, 0.8363181, 2.672862, 1, 0, 0.1686275, 1,
1.974109, -1.520241, 3.164301, 1, 0, 0.1607843, 1,
1.99815, -0.4233832, 2.342763, 1, 0, 0.1568628, 1,
2.008399, -1.002, 2.661012, 1, 0, 0.1490196, 1,
2.020158, 0.3642629, 0.9218366, 1, 0, 0.145098, 1,
2.034278, -0.3347043, 2.268656, 1, 0, 0.1372549, 1,
2.086643, 1.298078, 0.7862467, 1, 0, 0.1333333, 1,
2.089106, -1.125953, 1.79807, 1, 0, 0.1254902, 1,
2.095077, 0.001315767, 1.833516, 1, 0, 0.1215686, 1,
2.098523, -1.648166, 2.859925, 1, 0, 0.1137255, 1,
2.158938, 2.035002, 1.971193, 1, 0, 0.1098039, 1,
2.165418, 0.1567367, 1.439614, 1, 0, 0.1019608, 1,
2.208712, -0.5549832, -0.03934025, 1, 0, 0.09411765, 1,
2.215272, -0.5725817, 2.985544, 1, 0, 0.09019608, 1,
2.216236, 0.4556566, -0.5276471, 1, 0, 0.08235294, 1,
2.306716, 0.3073695, 0.7712725, 1, 0, 0.07843138, 1,
2.390213, -0.9859604, 1.876058, 1, 0, 0.07058824, 1,
2.396307, -0.5862185, 2.864146, 1, 0, 0.06666667, 1,
2.423885, -0.6063448, 2.636233, 1, 0, 0.05882353, 1,
2.433965, 1.509965, 2.304453, 1, 0, 0.05490196, 1,
2.437054, 1.484038, -0.3779821, 1, 0, 0.04705882, 1,
2.476293, 1.74778, 0.7502947, 1, 0, 0.04313726, 1,
2.545935, 0.5831051, 3.07134, 1, 0, 0.03529412, 1,
2.584064, 0.7626255, 0.1212047, 1, 0, 0.03137255, 1,
2.58748, -0.05201128, 0.2760748, 1, 0, 0.02352941, 1,
2.788757, 0.7308866, 2.641058, 1, 0, 0.01960784, 1,
2.793252, 1.141428, 2.078569, 1, 0, 0.01176471, 1,
3.582963, 2.060533, 2.765685, 1, 0, 0.007843138, 1
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
0.4062167, -3.844093, -6.901475, 0, -0.5, 0.5, 0.5,
0.4062167, -3.844093, -6.901475, 1, -0.5, 0.5, 0.5,
0.4062167, -3.844093, -6.901475, 1, 1.5, 0.5, 0.5,
0.4062167, -3.844093, -6.901475, 0, 1.5, 0.5, 0.5
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
-3.847446, 0.210765, -6.901475, 0, -0.5, 0.5, 0.5,
-3.847446, 0.210765, -6.901475, 1, -0.5, 0.5, 0.5,
-3.847446, 0.210765, -6.901475, 1, 1.5, 0.5, 0.5,
-3.847446, 0.210765, -6.901475, 0, 1.5, 0.5, 0.5
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
-3.847446, -3.844093, 0.2668447, 0, -0.5, 0.5, 0.5,
-3.847446, -3.844093, 0.2668447, 1, -0.5, 0.5, 0.5,
-3.847446, -3.844093, 0.2668447, 1, 1.5, 0.5, 0.5,
-3.847446, -3.844093, 0.2668447, 0, 1.5, 0.5, 0.5
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
-2, -2.908356, -5.247247,
3, -2.908356, -5.247247,
-2, -2.908356, -5.247247,
-2, -3.064312, -5.522952,
-1, -2.908356, -5.247247,
-1, -3.064312, -5.522952,
0, -2.908356, -5.247247,
0, -3.064312, -5.522952,
1, -2.908356, -5.247247,
1, -3.064312, -5.522952,
2, -2.908356, -5.247247,
2, -3.064312, -5.522952,
3, -2.908356, -5.247247,
3, -3.064312, -5.522952
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
-2, -3.376224, -6.074361, 0, -0.5, 0.5, 0.5,
-2, -3.376224, -6.074361, 1, -0.5, 0.5, 0.5,
-2, -3.376224, -6.074361, 1, 1.5, 0.5, 0.5,
-2, -3.376224, -6.074361, 0, 1.5, 0.5, 0.5,
-1, -3.376224, -6.074361, 0, -0.5, 0.5, 0.5,
-1, -3.376224, -6.074361, 1, -0.5, 0.5, 0.5,
-1, -3.376224, -6.074361, 1, 1.5, 0.5, 0.5,
-1, -3.376224, -6.074361, 0, 1.5, 0.5, 0.5,
0, -3.376224, -6.074361, 0, -0.5, 0.5, 0.5,
0, -3.376224, -6.074361, 1, -0.5, 0.5, 0.5,
0, -3.376224, -6.074361, 1, 1.5, 0.5, 0.5,
0, -3.376224, -6.074361, 0, 1.5, 0.5, 0.5,
1, -3.376224, -6.074361, 0, -0.5, 0.5, 0.5,
1, -3.376224, -6.074361, 1, -0.5, 0.5, 0.5,
1, -3.376224, -6.074361, 1, 1.5, 0.5, 0.5,
1, -3.376224, -6.074361, 0, 1.5, 0.5, 0.5,
2, -3.376224, -6.074361, 0, -0.5, 0.5, 0.5,
2, -3.376224, -6.074361, 1, -0.5, 0.5, 0.5,
2, -3.376224, -6.074361, 1, 1.5, 0.5, 0.5,
2, -3.376224, -6.074361, 0, 1.5, 0.5, 0.5,
3, -3.376224, -6.074361, 0, -0.5, 0.5, 0.5,
3, -3.376224, -6.074361, 1, -0.5, 0.5, 0.5,
3, -3.376224, -6.074361, 1, 1.5, 0.5, 0.5,
3, -3.376224, -6.074361, 0, 1.5, 0.5, 0.5
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
-2.865831, -2, -5.247247,
-2.865831, 3, -5.247247,
-2.865831, -2, -5.247247,
-3.029434, -2, -5.522952,
-2.865831, -1, -5.247247,
-3.029434, -1, -5.522952,
-2.865831, 0, -5.247247,
-3.029434, 0, -5.522952,
-2.865831, 1, -5.247247,
-3.029434, 1, -5.522952,
-2.865831, 2, -5.247247,
-3.029434, 2, -5.522952,
-2.865831, 3, -5.247247,
-3.029434, 3, -5.522952
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
-3.356639, -2, -6.074361, 0, -0.5, 0.5, 0.5,
-3.356639, -2, -6.074361, 1, -0.5, 0.5, 0.5,
-3.356639, -2, -6.074361, 1, 1.5, 0.5, 0.5,
-3.356639, -2, -6.074361, 0, 1.5, 0.5, 0.5,
-3.356639, -1, -6.074361, 0, -0.5, 0.5, 0.5,
-3.356639, -1, -6.074361, 1, -0.5, 0.5, 0.5,
-3.356639, -1, -6.074361, 1, 1.5, 0.5, 0.5,
-3.356639, -1, -6.074361, 0, 1.5, 0.5, 0.5,
-3.356639, 0, -6.074361, 0, -0.5, 0.5, 0.5,
-3.356639, 0, -6.074361, 1, -0.5, 0.5, 0.5,
-3.356639, 0, -6.074361, 1, 1.5, 0.5, 0.5,
-3.356639, 0, -6.074361, 0, 1.5, 0.5, 0.5,
-3.356639, 1, -6.074361, 0, -0.5, 0.5, 0.5,
-3.356639, 1, -6.074361, 1, -0.5, 0.5, 0.5,
-3.356639, 1, -6.074361, 1, 1.5, 0.5, 0.5,
-3.356639, 1, -6.074361, 0, 1.5, 0.5, 0.5,
-3.356639, 2, -6.074361, 0, -0.5, 0.5, 0.5,
-3.356639, 2, -6.074361, 1, -0.5, 0.5, 0.5,
-3.356639, 2, -6.074361, 1, 1.5, 0.5, 0.5,
-3.356639, 2, -6.074361, 0, 1.5, 0.5, 0.5,
-3.356639, 3, -6.074361, 0, -0.5, 0.5, 0.5,
-3.356639, 3, -6.074361, 1, -0.5, 0.5, 0.5,
-3.356639, 3, -6.074361, 1, 1.5, 0.5, 0.5,
-3.356639, 3, -6.074361, 0, 1.5, 0.5, 0.5
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
-2.865831, -2.908356, -4,
-2.865831, -2.908356, 4,
-2.865831, -2.908356, -4,
-3.029434, -3.064312, -4,
-2.865831, -2.908356, -2,
-3.029434, -3.064312, -2,
-2.865831, -2.908356, 0,
-3.029434, -3.064312, 0,
-2.865831, -2.908356, 2,
-3.029434, -3.064312, 2,
-2.865831, -2.908356, 4,
-3.029434, -3.064312, 4
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
-3.356639, -3.376224, -4, 0, -0.5, 0.5, 0.5,
-3.356639, -3.376224, -4, 1, -0.5, 0.5, 0.5,
-3.356639, -3.376224, -4, 1, 1.5, 0.5, 0.5,
-3.356639, -3.376224, -4, 0, 1.5, 0.5, 0.5,
-3.356639, -3.376224, -2, 0, -0.5, 0.5, 0.5,
-3.356639, -3.376224, -2, 1, -0.5, 0.5, 0.5,
-3.356639, -3.376224, -2, 1, 1.5, 0.5, 0.5,
-3.356639, -3.376224, -2, 0, 1.5, 0.5, 0.5,
-3.356639, -3.376224, 0, 0, -0.5, 0.5, 0.5,
-3.356639, -3.376224, 0, 1, -0.5, 0.5, 0.5,
-3.356639, -3.376224, 0, 1, 1.5, 0.5, 0.5,
-3.356639, -3.376224, 0, 0, 1.5, 0.5, 0.5,
-3.356639, -3.376224, 2, 0, -0.5, 0.5, 0.5,
-3.356639, -3.376224, 2, 1, -0.5, 0.5, 0.5,
-3.356639, -3.376224, 2, 1, 1.5, 0.5, 0.5,
-3.356639, -3.376224, 2, 0, 1.5, 0.5, 0.5,
-3.356639, -3.376224, 4, 0, -0.5, 0.5, 0.5,
-3.356639, -3.376224, 4, 1, -0.5, 0.5, 0.5,
-3.356639, -3.376224, 4, 1, 1.5, 0.5, 0.5,
-3.356639, -3.376224, 4, 0, 1.5, 0.5, 0.5
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
-2.865831, -2.908356, -5.247247,
-2.865831, 3.329886, -5.247247,
-2.865831, -2.908356, 5.780937,
-2.865831, 3.329886, 5.780937,
-2.865831, -2.908356, -5.247247,
-2.865831, -2.908356, 5.780937,
-2.865831, 3.329886, -5.247247,
-2.865831, 3.329886, 5.780937,
-2.865831, -2.908356, -5.247247,
3.678265, -2.908356, -5.247247,
-2.865831, -2.908356, 5.780937,
3.678265, -2.908356, 5.780937,
-2.865831, 3.329886, -5.247247,
3.678265, 3.329886, -5.247247,
-2.865831, 3.329886, 5.780937,
3.678265, 3.329886, 5.780937,
3.678265, -2.908356, -5.247247,
3.678265, 3.329886, -5.247247,
3.678265, -2.908356, 5.780937,
3.678265, 3.329886, 5.780937,
3.678265, -2.908356, -5.247247,
3.678265, -2.908356, 5.780937,
3.678265, 3.329886, -5.247247,
3.678265, 3.329886, 5.780937
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
var radius = 7.614827;
var distance = 33.87923;
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
mvMatrix.translate( -0.4062167, -0.210765, -0.2668447 );
mvMatrix.scale( 1.258126, 1.319811, 0.746569 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.87923);
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
aminomethanenitrile<-read.table("aminomethanenitrile.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-aminomethanenitrile$V2
```

```
## Error in eval(expr, envir, enclos): object 'aminomethanenitrile' not found
```

```r
y<-aminomethanenitrile$V3
```

```
## Error in eval(expr, envir, enclos): object 'aminomethanenitrile' not found
```

```r
z<-aminomethanenitrile$V4
```

```
## Error in eval(expr, envir, enclos): object 'aminomethanenitrile' not found
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
-2.770529, 0.02267228, -2.327744, 0, 0, 1, 1, 1,
-2.717353, 0.5887873, -1.616263, 1, 0, 0, 1, 1,
-2.68938, -1.959286, -3.284164, 1, 0, 0, 1, 1,
-2.54891, 0.932681, -1.56139, 1, 0, 0, 1, 1,
-2.512865, -0.2438886, -2.381755, 1, 0, 0, 1, 1,
-2.445134, 1.022408, -0.7790877, 1, 0, 0, 1, 1,
-2.422595, -2.030515, -1.135327, 0, 0, 0, 1, 1,
-2.394332, -0.902633, -3.005706, 0, 0, 0, 1, 1,
-2.310231, -1.413918, -2.774065, 0, 0, 0, 1, 1,
-2.29789, 0.7131552, 0.7599115, 0, 0, 0, 1, 1,
-2.262754, -1.941293, -1.082455, 0, 0, 0, 1, 1,
-2.256785, 0.1894862, -1.051109, 0, 0, 0, 1, 1,
-2.230494, 0.1736561, -1.522208, 0, 0, 0, 1, 1,
-2.229234, -0.7538014, -1.235572, 1, 1, 1, 1, 1,
-2.200686, 1.147484, -0.2426844, 1, 1, 1, 1, 1,
-2.193172, -0.8738626, -2.309793, 1, 1, 1, 1, 1,
-2.103722, 3.055517, -1.609942, 1, 1, 1, 1, 1,
-2.08293, -0.1215626, -1.445239, 1, 1, 1, 1, 1,
-2.080346, 0.4922525, -1.862112, 1, 1, 1, 1, 1,
-2.078664, -0.5578377, -1.052607, 1, 1, 1, 1, 1,
-2.066678, -0.3838091, -0.5338731, 1, 1, 1, 1, 1,
-1.994141, 0.1586458, -0.9769865, 1, 1, 1, 1, 1,
-1.988552, -0.2859535, -0.251722, 1, 1, 1, 1, 1,
-1.98263, 1.59909, -2.846855, 1, 1, 1, 1, 1,
-1.965427, -0.3882209, -1.836396, 1, 1, 1, 1, 1,
-1.93796, -0.30406, 0.5421227, 1, 1, 1, 1, 1,
-1.930546, -0.8193998, -2.192913, 1, 1, 1, 1, 1,
-1.919962, -1.513476, -2.506539, 1, 1, 1, 1, 1,
-1.919042, -0.2308238, -2.144437, 0, 0, 1, 1, 1,
-1.916329, 2.684066, -0.5698999, 1, 0, 0, 1, 1,
-1.899472, 0.2501404, 0.2810123, 1, 0, 0, 1, 1,
-1.893602, -1.27631, -0.8857943, 1, 0, 0, 1, 1,
-1.86097, 0.2475699, -2.182139, 1, 0, 0, 1, 1,
-1.856577, -1.72862, -2.656694, 1, 0, 0, 1, 1,
-1.832685, -1.590467, -2.458203, 0, 0, 0, 1, 1,
-1.8181, -0.3021897, -2.151343, 0, 0, 0, 1, 1,
-1.790306, 0.2887545, -1.002985, 0, 0, 0, 1, 1,
-1.783348, -0.2475341, 0.2898208, 0, 0, 0, 1, 1,
-1.781163, -0.2751374, -1.117975, 0, 0, 0, 1, 1,
-1.776396, -0.9849728, -1.317126, 0, 0, 0, 1, 1,
-1.764248, 2.144947, -1.875174, 0, 0, 0, 1, 1,
-1.752643, 0.4162988, -0.2498207, 1, 1, 1, 1, 1,
-1.748893, -0.008408139, -2.048541, 1, 1, 1, 1, 1,
-1.742293, 1.910908, 0.05167481, 1, 1, 1, 1, 1,
-1.728054, 0.3461912, -0.3546534, 1, 1, 1, 1, 1,
-1.724094, 0.1049096, -1.43227, 1, 1, 1, 1, 1,
-1.721025, -0.02779611, -2.909717, 1, 1, 1, 1, 1,
-1.70735, 0.6510857, -0.4224161, 1, 1, 1, 1, 1,
-1.706573, 0.8851954, 1.105422, 1, 1, 1, 1, 1,
-1.699659, 0.05000893, -3.224171, 1, 1, 1, 1, 1,
-1.682259, -1.332552, -3.167846, 1, 1, 1, 1, 1,
-1.680435, 1.069892, -0.03382929, 1, 1, 1, 1, 1,
-1.662927, 1.342363, -1.207562, 1, 1, 1, 1, 1,
-1.659088, -1.365123, -0.5425249, 1, 1, 1, 1, 1,
-1.628659, 1.870433, -2.577935, 1, 1, 1, 1, 1,
-1.62081, -0.9315227, -1.390704, 1, 1, 1, 1, 1,
-1.61147, 0.637999, -1.587824, 0, 0, 1, 1, 1,
-1.610503, -0.1817373, -2.050632, 1, 0, 0, 1, 1,
-1.594511, -1.24148, -3.105133, 1, 0, 0, 1, 1,
-1.583837, -1.491756, -1.505065, 1, 0, 0, 1, 1,
-1.548861, 2.445044, -0.6077126, 1, 0, 0, 1, 1,
-1.543982, -1.030424, -2.944124, 1, 0, 0, 1, 1,
-1.539157, 0.6439007, -1.04723, 0, 0, 0, 1, 1,
-1.527206, 1.874906, -1.559097, 0, 0, 0, 1, 1,
-1.516161, -0.4063488, -3.216822, 0, 0, 0, 1, 1,
-1.514973, 0.2733054, -1.773831, 0, 0, 0, 1, 1,
-1.509931, -0.8396436, -3.278774, 0, 0, 0, 1, 1,
-1.498924, -0.3108945, -1.65463, 0, 0, 0, 1, 1,
-1.488562, 0.183707, -1.046521, 0, 0, 0, 1, 1,
-1.475237, 0.8595487, -0.9181185, 1, 1, 1, 1, 1,
-1.469432, -0.06100468, -3.514645, 1, 1, 1, 1, 1,
-1.464686, 0.9646028, -1.350168, 1, 1, 1, 1, 1,
-1.459898, -1.529626, -2.798202, 1, 1, 1, 1, 1,
-1.454313, 0.3770969, 0.006495348, 1, 1, 1, 1, 1,
-1.449747, 0.8582729, -0.1053302, 1, 1, 1, 1, 1,
-1.441881, -1.829572, -3.457773, 1, 1, 1, 1, 1,
-1.433092, 1.407769, -0.4936143, 1, 1, 1, 1, 1,
-1.430469, 1.468499, -1.651411, 1, 1, 1, 1, 1,
-1.420086, -1.283558, -1.562105, 1, 1, 1, 1, 1,
-1.417856, 0.3627505, -1.891083, 1, 1, 1, 1, 1,
-1.415118, 1.776617, -0.2833299, 1, 1, 1, 1, 1,
-1.412553, -0.04441983, -1.714404, 1, 1, 1, 1, 1,
-1.41054, 0.2212051, -2.417492, 1, 1, 1, 1, 1,
-1.377845, 0.6236753, -1.008046, 1, 1, 1, 1, 1,
-1.37686, -1.238473, -1.453371, 0, 0, 1, 1, 1,
-1.36708, 0.5348254, 1.25609, 1, 0, 0, 1, 1,
-1.36265, -0.7522702, -1.263963, 1, 0, 0, 1, 1,
-1.340643, -2.18032, -3.600266, 1, 0, 0, 1, 1,
-1.33818, -1.099649, -1.712879, 1, 0, 0, 1, 1,
-1.329701, -1.377848, -3.754847, 1, 0, 0, 1, 1,
-1.309919, -0.1778581, -2.824997, 0, 0, 0, 1, 1,
-1.302245, 2.761328, -0.5096115, 0, 0, 0, 1, 1,
-1.294797, 0.4784919, -2.132658, 0, 0, 0, 1, 1,
-1.287701, 1.745881, 1.435221, 0, 0, 0, 1, 1,
-1.282859, 0.8992805, -0.1788441, 0, 0, 0, 1, 1,
-1.28159, -0.412238, -1.372138, 0, 0, 0, 1, 1,
-1.277395, -1.779977, -2.042186, 0, 0, 0, 1, 1,
-1.269063, 0.1106241, -1.516932, 1, 1, 1, 1, 1,
-1.259385, 2.008166, -0.7001103, 1, 1, 1, 1, 1,
-1.256839, -1.073007, -1.507246, 1, 1, 1, 1, 1,
-1.254936, -1.272398, -2.195514, 1, 1, 1, 1, 1,
-1.252578, -0.07645522, -2.143196, 1, 1, 1, 1, 1,
-1.251836, -0.3473537, -1.808476, 1, 1, 1, 1, 1,
-1.251149, -1.369412, -1.016242, 1, 1, 1, 1, 1,
-1.240439, 0.7280379, -0.2368111, 1, 1, 1, 1, 1,
-1.237545, 0.7813719, 0.4292962, 1, 1, 1, 1, 1,
-1.232462, 1.000665, -1.163183, 1, 1, 1, 1, 1,
-1.232095, 0.5250111, -0.8250952, 1, 1, 1, 1, 1,
-1.224593, -1.50922, -2.115079, 1, 1, 1, 1, 1,
-1.207817, -0.2345676, -0.7350788, 1, 1, 1, 1, 1,
-1.206906, -0.1944203, -1.154233, 1, 1, 1, 1, 1,
-1.188165, -0.3669937, -1.3441, 1, 1, 1, 1, 1,
-1.183608, 1.472126, -0.02854505, 0, 0, 1, 1, 1,
-1.182225, 1.156097, -1.085081, 1, 0, 0, 1, 1,
-1.174556, -1.222608, -3.16156, 1, 0, 0, 1, 1,
-1.173889, -0.4722487, -0.8873339, 1, 0, 0, 1, 1,
-1.172997, -0.7662787, -2.885419, 1, 0, 0, 1, 1,
-1.160116, -2.230459, -2.400879, 1, 0, 0, 1, 1,
-1.156567, -1.24329, -3.849466, 0, 0, 0, 1, 1,
-1.156264, -0.07169724, -1.351532, 0, 0, 0, 1, 1,
-1.152935, 0.5011, -1.928981, 0, 0, 0, 1, 1,
-1.148967, -1.405377, -4.180094, 0, 0, 0, 1, 1,
-1.145657, 0.3392639, -0.8398572, 0, 0, 0, 1, 1,
-1.141464, 0.1178236, -1.81679, 0, 0, 0, 1, 1,
-1.138417, 0.5881352, -2.754179, 0, 0, 0, 1, 1,
-1.137799, -1.180188, -2.593492, 1, 1, 1, 1, 1,
-1.136255, 0.4959345, -1.617718, 1, 1, 1, 1, 1,
-1.12939, 0.2172895, -0.1168483, 1, 1, 1, 1, 1,
-1.120973, -0.9587771, -1.946479, 1, 1, 1, 1, 1,
-1.120913, -0.3315338, -1.681895, 1, 1, 1, 1, 1,
-1.118233, 1.783266, 0.05375795, 1, 1, 1, 1, 1,
-1.111585, 0.1822833, -0.7830917, 1, 1, 1, 1, 1,
-1.109844, -0.4926343, -1.547334, 1, 1, 1, 1, 1,
-1.0923, 2.015794, 0.531569, 1, 1, 1, 1, 1,
-1.089878, -0.9886448, -2.543237, 1, 1, 1, 1, 1,
-1.086015, 0.6424391, -2.210223, 1, 1, 1, 1, 1,
-1.082844, 0.7054715, 0.03705147, 1, 1, 1, 1, 1,
-1.079792, 0.3503872, -1.306104, 1, 1, 1, 1, 1,
-1.079223, -2.346514, -0.4119752, 1, 1, 1, 1, 1,
-1.07373, 0.6705087, -1.133717, 1, 1, 1, 1, 1,
-1.069955, 1.4193, -0.3599829, 0, 0, 1, 1, 1,
-1.068261, -1.331932, -3.954201, 1, 0, 0, 1, 1,
-1.064363, 0.4587734, -0.7419124, 1, 0, 0, 1, 1,
-1.061576, -0.5257626, -0.851424, 1, 0, 0, 1, 1,
-1.058446, -0.2860662, -1.1015, 1, 0, 0, 1, 1,
-1.053513, -0.5729702, -2.081838, 1, 0, 0, 1, 1,
-1.052644, -0.5278297, -1.712738, 0, 0, 0, 1, 1,
-1.046756, -0.9477157, -3.528764, 0, 0, 0, 1, 1,
-1.042205, -0.09350327, -1.062466, 0, 0, 0, 1, 1,
-1.040658, 1.357346, -1.70324, 0, 0, 0, 1, 1,
-1.037011, 1.036537, -0.5170457, 0, 0, 0, 1, 1,
-1.034033, 1.070669, -0.8990566, 0, 0, 0, 1, 1,
-1.031255, -0.388088, -2.836391, 0, 0, 0, 1, 1,
-1.023199, 0.8493578, -1.06217, 1, 1, 1, 1, 1,
-1.022218, 0.1150492, -0.2622837, 1, 1, 1, 1, 1,
-1.014087, 0.4636849, -2.365069, 1, 1, 1, 1, 1,
-1.01379, -0.03436283, -1.08847, 1, 1, 1, 1, 1,
-1.008008, -0.668687, -2.431501, 1, 1, 1, 1, 1,
-1.003142, 0.4015205, -1.418602, 1, 1, 1, 1, 1,
-1.000332, -1.410791, -2.773172, 1, 1, 1, 1, 1,
-0.9994135, 0.4033999, -3.033479, 1, 1, 1, 1, 1,
-0.9989668, -1.062667, -3.026342, 1, 1, 1, 1, 1,
-0.9988177, -0.2186257, -1.370926, 1, 1, 1, 1, 1,
-0.9985304, 1.616364, -0.1211363, 1, 1, 1, 1, 1,
-0.9903538, -1.351607, -4.020915, 1, 1, 1, 1, 1,
-0.9898949, 1.134515, -1.60937, 1, 1, 1, 1, 1,
-0.986818, 2.006794, -0.3673258, 1, 1, 1, 1, 1,
-0.9815615, -0.4730961, -1.834457, 1, 1, 1, 1, 1,
-0.9749154, -2.596103, -3.110713, 0, 0, 1, 1, 1,
-0.974031, 0.5748443, -1.544732, 1, 0, 0, 1, 1,
-0.9735013, 0.8382903, -0.7709562, 1, 0, 0, 1, 1,
-0.972334, -0.8104097, -1.783672, 1, 0, 0, 1, 1,
-0.9702457, -0.4932765, -2.810267, 1, 0, 0, 1, 1,
-0.9620531, 0.6589998, 0.06553478, 1, 0, 0, 1, 1,
-0.961857, 0.6442181, -0.2875222, 0, 0, 0, 1, 1,
-0.958697, -0.6899401, -2.954874, 0, 0, 0, 1, 1,
-0.9507629, 0.1951244, -0.5628728, 0, 0, 0, 1, 1,
-0.9463732, -2.253749, -4.603767, 0, 0, 0, 1, 1,
-0.9429539, 1.878023, -0.3394216, 0, 0, 0, 1, 1,
-0.9429033, -0.4725345, -2.460444, 0, 0, 0, 1, 1,
-0.9373802, 0.2747176, -0.6223438, 0, 0, 0, 1, 1,
-0.9336336, -0.6909431, -3.819031, 1, 1, 1, 1, 1,
-0.9299709, 0.4657839, -1.461797, 1, 1, 1, 1, 1,
-0.9258093, 0.429479, -0.3000426, 1, 1, 1, 1, 1,
-0.9132441, -0.1512468, -2.010149, 1, 1, 1, 1, 1,
-0.9090876, -0.5228534, -2.561248, 1, 1, 1, 1, 1,
-0.9075785, 0.1283705, -3.256115, 1, 1, 1, 1, 1,
-0.903845, 0.9438857, 0.303759, 1, 1, 1, 1, 1,
-0.9015602, 0.8323075, -1.698176, 1, 1, 1, 1, 1,
-0.9009384, 0.2934647, -1.948482, 1, 1, 1, 1, 1,
-0.8954904, 0.6879545, -1.054014, 1, 1, 1, 1, 1,
-0.8929738, 0.6108009, -2.107423, 1, 1, 1, 1, 1,
-0.8911917, -2.310685, -4.406632, 1, 1, 1, 1, 1,
-0.8909477, 0.5046685, -0.273523, 1, 1, 1, 1, 1,
-0.8857479, 0.4348114, -0.8925647, 1, 1, 1, 1, 1,
-0.8835915, 0.2256858, -1.445772, 1, 1, 1, 1, 1,
-0.861277, -0.7164394, -3.666506, 0, 0, 1, 1, 1,
-0.8577712, -1.032859, -2.185688, 1, 0, 0, 1, 1,
-0.8564005, -0.447481, -2.448195, 1, 0, 0, 1, 1,
-0.8519228, -0.9918167, -1.556715, 1, 0, 0, 1, 1,
-0.8478883, -0.9159352, -1.630251, 1, 0, 0, 1, 1,
-0.846644, -0.4848606, -1.442325, 1, 0, 0, 1, 1,
-0.8454447, -1.749189, -1.355023, 0, 0, 0, 1, 1,
-0.8419993, 0.6834241, -2.80092, 0, 0, 0, 1, 1,
-0.8393182, 0.7679152, 0.5953774, 0, 0, 0, 1, 1,
-0.8341165, 0.06009207, -1.108216, 0, 0, 0, 1, 1,
-0.8314296, -0.7848694, -2.833378, 0, 0, 0, 1, 1,
-0.8270512, 1.501471, 0.9265598, 0, 0, 0, 1, 1,
-0.8268547, 1.185932, -3.503432, 0, 0, 0, 1, 1,
-0.8208325, -0.6981124, -1.576611, 1, 1, 1, 1, 1,
-0.8108747, -0.5079618, -1.3886, 1, 1, 1, 1, 1,
-0.8098012, -1.921079, -4.235043, 1, 1, 1, 1, 1,
-0.8084803, -1.813923, -4.325879, 1, 1, 1, 1, 1,
-0.8078684, 2.293104, -0.6227415, 1, 1, 1, 1, 1,
-0.7954598, -0.5667889, -1.105782, 1, 1, 1, 1, 1,
-0.7922412, 0.009729081, -2.729909, 1, 1, 1, 1, 1,
-0.7896422, 0.4701491, 0.9009524, 1, 1, 1, 1, 1,
-0.7883026, 0.1232423, -2.148482, 1, 1, 1, 1, 1,
-0.7865041, 1.799972, -0.3442797, 1, 1, 1, 1, 1,
-0.7815662, -0.1754881, 0.2577838, 1, 1, 1, 1, 1,
-0.7810656, -0.01782356, -1.496245, 1, 1, 1, 1, 1,
-0.7810366, -0.6568656, -1.347601, 1, 1, 1, 1, 1,
-0.7792916, -0.5174296, -2.908537, 1, 1, 1, 1, 1,
-0.7745441, -0.6556279, -2.507749, 1, 1, 1, 1, 1,
-0.7690533, 0.6760327, -0.7407764, 0, 0, 1, 1, 1,
-0.7611099, 1.2248, 0.7738257, 1, 0, 0, 1, 1,
-0.7578515, -0.7365545, 0.05590333, 1, 0, 0, 1, 1,
-0.7516233, -0.7078812, -2.766096, 1, 0, 0, 1, 1,
-0.7381831, -0.2719603, -2.401001, 1, 0, 0, 1, 1,
-0.737577, 1.38696, -0.3963055, 1, 0, 0, 1, 1,
-0.734214, -0.04151388, -0.8796609, 0, 0, 0, 1, 1,
-0.7290159, -2.373044, -2.790755, 0, 0, 0, 1, 1,
-0.7257205, 0.1925435, -1.805548, 0, 0, 0, 1, 1,
-0.7235958, -0.1428195, -1.593106, 0, 0, 0, 1, 1,
-0.7235529, 2.377583, -1.565096, 0, 0, 0, 1, 1,
-0.7229812, 0.5851773, 0.7673279, 0, 0, 0, 1, 1,
-0.7140294, -2.13334, -2.52959, 0, 0, 0, 1, 1,
-0.713285, -1.40215, -3.830353, 1, 1, 1, 1, 1,
-0.7124577, 0.2283897, -1.082322, 1, 1, 1, 1, 1,
-0.7118692, 2.298257, -0.9436852, 1, 1, 1, 1, 1,
-0.7080587, -0.3087628, -3.234731, 1, 1, 1, 1, 1,
-0.707739, -0.01652032, -0.8871055, 1, 1, 1, 1, 1,
-0.7059433, -1.459441, -2.505473, 1, 1, 1, 1, 1,
-0.6970314, -0.1112474, -2.545435, 1, 1, 1, 1, 1,
-0.6964906, -0.9716059, -2.377048, 1, 1, 1, 1, 1,
-0.6954071, 1.52167, 0.2933312, 1, 1, 1, 1, 1,
-0.6943371, 0.04079087, -2.338207, 1, 1, 1, 1, 1,
-0.6901212, -0.3129504, -2.270207, 1, 1, 1, 1, 1,
-0.6891093, -0.2439083, -2.294665, 1, 1, 1, 1, 1,
-0.686207, 0.3030263, 0.2613879, 1, 1, 1, 1, 1,
-0.6854097, -1.714125, -1.414716, 1, 1, 1, 1, 1,
-0.6833427, 1.079015, -1.907451, 1, 1, 1, 1, 1,
-0.6830047, -2.356915, -3.256267, 0, 0, 1, 1, 1,
-0.6803832, 1.038715, -1.67399, 1, 0, 0, 1, 1,
-0.6771589, 0.4666086, -0.09735311, 1, 0, 0, 1, 1,
-0.675718, -0.242607, -3.581528, 1, 0, 0, 1, 1,
-0.667628, 0.2875, -2.773274, 1, 0, 0, 1, 1,
-0.666222, 0.2249595, -2.175045, 1, 0, 0, 1, 1,
-0.6651361, -0.4850461, -2.339915, 0, 0, 0, 1, 1,
-0.6624379, -0.5928276, 0.2226022, 0, 0, 0, 1, 1,
-0.658164, -0.4129071, -0.2154135, 0, 0, 0, 1, 1,
-0.6581522, 0.6477727, -1.155232, 0, 0, 0, 1, 1,
-0.6544811, 0.9705309, -2.279582, 0, 0, 0, 1, 1,
-0.653621, -1.411916, -3.239656, 0, 0, 0, 1, 1,
-0.6516379, 0.5178735, -0.1351173, 0, 0, 0, 1, 1,
-0.6454463, 0.7161097, 0.5373748, 1, 1, 1, 1, 1,
-0.6431977, -0.3602802, -4.540088, 1, 1, 1, 1, 1,
-0.6411254, 1.553163, -0.0787141, 1, 1, 1, 1, 1,
-0.6390125, -0.1322037, -1.781617, 1, 1, 1, 1, 1,
-0.6381505, 0.3386059, -1.864679, 1, 1, 1, 1, 1,
-0.6325591, 1.235314, -0.07681281, 1, 1, 1, 1, 1,
-0.6207571, 2.075099, -2.422179, 1, 1, 1, 1, 1,
-0.6184443, -1.477345, -4.140227, 1, 1, 1, 1, 1,
-0.6181186, -2.817508, -3.498079, 1, 1, 1, 1, 1,
-0.6155686, 0.5825067, 0.08942018, 1, 1, 1, 1, 1,
-0.6137239, -0.4320251, -2.876464, 1, 1, 1, 1, 1,
-0.6084948, 0.3326121, 0.430303, 1, 1, 1, 1, 1,
-0.6084312, -0.6553597, -3.273994, 1, 1, 1, 1, 1,
-0.6073148, -0.8378699, -4.274, 1, 1, 1, 1, 1,
-0.605494, 1.976445, -0.9607632, 1, 1, 1, 1, 1,
-0.6019794, -0.4151831, -1.832714, 0, 0, 1, 1, 1,
-0.6019548, -1.757135, -2.517795, 1, 0, 0, 1, 1,
-0.5972523, 1.268799, -1.738086, 1, 0, 0, 1, 1,
-0.591634, 1.786947, 0.1456927, 1, 0, 0, 1, 1,
-0.5913642, 0.8575765, -0.4079015, 1, 0, 0, 1, 1,
-0.5819377, -1.107522, -2.574624, 1, 0, 0, 1, 1,
-0.5819108, -0.4562913, -2.426915, 0, 0, 0, 1, 1,
-0.5771585, -0.7760013, -2.099413, 0, 0, 0, 1, 1,
-0.5734388, -0.7568164, -2.613205, 0, 0, 0, 1, 1,
-0.5730613, 0.7002124, -2.035841, 0, 0, 0, 1, 1,
-0.5710752, 1.186689, 0.7641873, 0, 0, 0, 1, 1,
-0.5632942, -0.5663347, -4.540376, 0, 0, 0, 1, 1,
-0.5563313, -0.2089084, -1.322369, 0, 0, 0, 1, 1,
-0.5549226, 1.254034, 0.4581745, 1, 1, 1, 1, 1,
-0.552343, -0.4464794, -3.412479, 1, 1, 1, 1, 1,
-0.5518948, 1.22182, -0.3237057, 1, 1, 1, 1, 1,
-0.5511971, -0.7231677, -2.157889, 1, 1, 1, 1, 1,
-0.5502939, 0.1018929, -3.185635, 1, 1, 1, 1, 1,
-0.5487404, -0.4226435, -2.689712, 1, 1, 1, 1, 1,
-0.5408791, 0.1112706, -2.221147, 1, 1, 1, 1, 1,
-0.5407358, -1.213239, -2.584481, 1, 1, 1, 1, 1,
-0.537958, 0.6685438, -0.1710181, 1, 1, 1, 1, 1,
-0.5336955, 0.4670833, -1.908489, 1, 1, 1, 1, 1,
-0.5286652, 0.9990074, -0.08969255, 1, 1, 1, 1, 1,
-0.524973, 0.8088372, -0.1789876, 1, 1, 1, 1, 1,
-0.5211529, 0.03723134, -0.8832191, 1, 1, 1, 1, 1,
-0.5208873, -1.148626, -1.220302, 1, 1, 1, 1, 1,
-0.5148875, 0.3082769, -1.926527, 1, 1, 1, 1, 1,
-0.5147556, 0.7219716, -0.9770786, 0, 0, 1, 1, 1,
-0.5115402, -0.4857481, -1.162236, 1, 0, 0, 1, 1,
-0.5093936, -0.2811349, -1.581072, 1, 0, 0, 1, 1,
-0.5081321, 0.2999969, -0.886171, 1, 0, 0, 1, 1,
-0.5044733, 1.824081, -1.317502, 1, 0, 0, 1, 1,
-0.4953734, -1.44459, -2.217685, 1, 0, 0, 1, 1,
-0.4949397, -1.048193, -3.23267, 0, 0, 0, 1, 1,
-0.4888425, 0.6754639, -0.9946244, 0, 0, 0, 1, 1,
-0.4847553, 1.45671, -0.1710887, 0, 0, 0, 1, 1,
-0.4843642, -0.481812, -3.198285, 0, 0, 0, 1, 1,
-0.4806339, 0.5805639, 0.7480929, 0, 0, 0, 1, 1,
-0.4788969, -0.3416818, -2.450812, 0, 0, 0, 1, 1,
-0.47059, 2.123627, -2.670852, 0, 0, 0, 1, 1,
-0.4705515, 1.756748, -1.015668, 1, 1, 1, 1, 1,
-0.4667421, 1.397845, 1.104691, 1, 1, 1, 1, 1,
-0.4622195, 1.125495, 0.8585873, 1, 1, 1, 1, 1,
-0.4584416, -0.2635017, -2.3278, 1, 1, 1, 1, 1,
-0.4573054, 0.6367453, -0.4197898, 1, 1, 1, 1, 1,
-0.4558319, -1.124233, -2.57519, 1, 1, 1, 1, 1,
-0.4544037, -1.128619, -2.527958, 1, 1, 1, 1, 1,
-0.448319, 1.260322, -0.3648915, 1, 1, 1, 1, 1,
-0.4475909, 0.04606546, -1.943509, 1, 1, 1, 1, 1,
-0.4452789, -0.6621583, -3.693712, 1, 1, 1, 1, 1,
-0.4451998, -0.1816622, 0.2933338, 1, 1, 1, 1, 1,
-0.4428309, 1.938313, 2.127318, 1, 1, 1, 1, 1,
-0.4411664, 0.4403885, -1.03458, 1, 1, 1, 1, 1,
-0.4408232, 0.7822352, -1.992973, 1, 1, 1, 1, 1,
-0.4406917, -0.4671481, -0.8652279, 1, 1, 1, 1, 1,
-0.4396003, 0.453504, -1.927976, 0, 0, 1, 1, 1,
-0.4380872, -0.1869741, -1.289549, 1, 0, 0, 1, 1,
-0.4365778, 1.202042, 1.159518, 1, 0, 0, 1, 1,
-0.4334883, 0.5308526, -1.510147, 1, 0, 0, 1, 1,
-0.4329363, -1.480814, -2.36127, 1, 0, 0, 1, 1,
-0.4322989, 0.4055306, -0.2178644, 1, 0, 0, 1, 1,
-0.4269747, 0.1229416, 0.8438714, 0, 0, 0, 1, 1,
-0.4248529, -0.537178, -3.144284, 0, 0, 0, 1, 1,
-0.4235434, 0.832563, -0.08980386, 0, 0, 0, 1, 1,
-0.4197272, -0.5291005, -2.738547, 0, 0, 0, 1, 1,
-0.4152024, 1.33004, 1.886471, 0, 0, 0, 1, 1,
-0.4145502, -1.312289, -2.734793, 0, 0, 0, 1, 1,
-0.4112633, -1.706867, -2.796491, 0, 0, 0, 1, 1,
-0.4111677, 3.01423, 1.100992, 1, 1, 1, 1, 1,
-0.4103487, -0.5504093, -3.247053, 1, 1, 1, 1, 1,
-0.4062809, 0.5830162, 0.1675117, 1, 1, 1, 1, 1,
-0.4017645, 0.936357, -3.024116, 1, 1, 1, 1, 1,
-0.3879291, -0.6901855, -2.072349, 1, 1, 1, 1, 1,
-0.3857087, 0.4377733, -2.174108, 1, 1, 1, 1, 1,
-0.3845867, 0.207032, -1.249371, 1, 1, 1, 1, 1,
-0.3837025, 0.5025233, -0.09418634, 1, 1, 1, 1, 1,
-0.3821783, 1.080072, 1.484366, 1, 1, 1, 1, 1,
-0.3705297, 0.6533932, -0.9744928, 1, 1, 1, 1, 1,
-0.3686233, -0.802813, -2.384682, 1, 1, 1, 1, 1,
-0.3624595, 0.343595, 0.3643616, 1, 1, 1, 1, 1,
-0.3620833, -0.04421572, -1.302394, 1, 1, 1, 1, 1,
-0.361653, -0.4152927, -1.912161, 1, 1, 1, 1, 1,
-0.3606489, 0.7849538, 1.372064, 1, 1, 1, 1, 1,
-0.3591464, -0.5561115, -1.873441, 0, 0, 1, 1, 1,
-0.3572716, 0.654776, -0.3041518, 1, 0, 0, 1, 1,
-0.3542806, 0.5571582, -0.2352703, 1, 0, 0, 1, 1,
-0.3525619, 0.4674245, -1.63496, 1, 0, 0, 1, 1,
-0.3497798, -1.899619, -2.665781, 1, 0, 0, 1, 1,
-0.3496456, -0.6232418, -4.729795, 1, 0, 0, 1, 1,
-0.3492706, 1.252965, -0.08615337, 0, 0, 0, 1, 1,
-0.3486424, -2.458559, -3.485635, 0, 0, 0, 1, 1,
-0.3476214, -0.7775702, -3.673676, 0, 0, 0, 1, 1,
-0.3473486, 1.876372, -1.12201, 0, 0, 0, 1, 1,
-0.3418046, 0.7285839, -1.273682, 0, 0, 0, 1, 1,
-0.3355044, -0.2348725, -2.58333, 0, 0, 0, 1, 1,
-0.330211, -0.3690806, -2.253687, 0, 0, 0, 1, 1,
-0.3292798, 1.221015, -0.4559446, 1, 1, 1, 1, 1,
-0.328506, -0.6830225, -1.239416, 1, 1, 1, 1, 1,
-0.3214805, -2.071856, -2.935246, 1, 1, 1, 1, 1,
-0.320309, 0.471418, -0.4210556, 1, 1, 1, 1, 1,
-0.3150953, 2.080343, 1.355587, 1, 1, 1, 1, 1,
-0.3144355, -0.1148484, -3.64077, 1, 1, 1, 1, 1,
-0.3121985, 0.6797339, -0.772221, 1, 1, 1, 1, 1,
-0.310846, -1.823849, -2.136639, 1, 1, 1, 1, 1,
-0.3089705, 0.3181668, -1.740841, 1, 1, 1, 1, 1,
-0.3054675, -0.0364807, -2.09325, 1, 1, 1, 1, 1,
-0.3031779, 1.048788, -0.4484922, 1, 1, 1, 1, 1,
-0.3003965, -0.455913, -2.19291, 1, 1, 1, 1, 1,
-0.3003371, -1.220656, -2.907653, 1, 1, 1, 1, 1,
-0.2930986, 0.202402, 0.07027347, 1, 1, 1, 1, 1,
-0.2924653, -0.04601077, -3.223731, 1, 1, 1, 1, 1,
-0.2922423, 0.6729605, 0.4985857, 0, 0, 1, 1, 1,
-0.2897403, 1.858286, -0.8238282, 1, 0, 0, 1, 1,
-0.2845908, -0.4714985, -2.529951, 1, 0, 0, 1, 1,
-0.282684, -0.3354886, -2.614775, 1, 0, 0, 1, 1,
-0.2822537, 0.830615, -0.7944781, 1, 0, 0, 1, 1,
-0.2821126, 1.506189, -2.297045, 1, 0, 0, 1, 1,
-0.2798622, 1.076509, -0.4478924, 0, 0, 0, 1, 1,
-0.2754687, 1.065583, -1.611788, 0, 0, 0, 1, 1,
-0.2723338, 0.04596637, -2.434392, 0, 0, 0, 1, 1,
-0.2657791, -0.9392449, -3.217962, 0, 0, 0, 1, 1,
-0.2648226, 0.2404063, -0.407565, 0, 0, 0, 1, 1,
-0.2627818, 2.092924, 1.419361, 0, 0, 0, 1, 1,
-0.2541847, -1.74684, -2.248653, 0, 0, 0, 1, 1,
-0.247605, 0.7861316, -0.5626848, 1, 1, 1, 1, 1,
-0.2456567, -0.9510775, -2.36098, 1, 1, 1, 1, 1,
-0.2432816, -1.021775, -2.853533, 1, 1, 1, 1, 1,
-0.2390884, -0.869902, -2.177217, 1, 1, 1, 1, 1,
-0.2389677, -1.372974, -2.636655, 1, 1, 1, 1, 1,
-0.2387037, -0.4657647, -2.882012, 1, 1, 1, 1, 1,
-0.2352014, -0.7193123, -1.669325, 1, 1, 1, 1, 1,
-0.2292746, -2.232505, -3.040406, 1, 1, 1, 1, 1,
-0.2269666, 0.3893866, 0.1846129, 1, 1, 1, 1, 1,
-0.2235318, -0.08744594, -1.677091, 1, 1, 1, 1, 1,
-0.2221039, 0.1988326, -1.126189, 1, 1, 1, 1, 1,
-0.2194661, -0.2943701, -2.346886, 1, 1, 1, 1, 1,
-0.2173291, -2.434551, -3.525885, 1, 1, 1, 1, 1,
-0.2169125, 0.4377132, -2.424092, 1, 1, 1, 1, 1,
-0.2125719, 0.8832834, 0.4009422, 1, 1, 1, 1, 1,
-0.2048344, 0.3492841, 0.3189068, 0, 0, 1, 1, 1,
-0.202299, -0.3743125, -2.194018, 1, 0, 0, 1, 1,
-0.2015888, -0.06772041, -2.590787, 1, 0, 0, 1, 1,
-0.2008933, 0.9661922, -1.194541, 1, 0, 0, 1, 1,
-0.200672, -0.8311455, -2.025057, 1, 0, 0, 1, 1,
-0.1989429, -0.4756336, -3.832401, 1, 0, 0, 1, 1,
-0.1964612, 0.6697958, -0.6938143, 0, 0, 0, 1, 1,
-0.1964079, 0.2793398, -1.545831, 0, 0, 0, 1, 1,
-0.1960475, -1.472409, -3.507102, 0, 0, 0, 1, 1,
-0.1845418, -2.112492, -2.559046, 0, 0, 0, 1, 1,
-0.1839645, 0.7695361, -0.4807853, 0, 0, 0, 1, 1,
-0.1828296, 0.1021361, -0.1203703, 0, 0, 0, 1, 1,
-0.1817635, -0.2834267, -1.571427, 0, 0, 0, 1, 1,
-0.1810046, 0.4820099, 0.8217783, 1, 1, 1, 1, 1,
-0.164323, 0.6778312, 0.4424705, 1, 1, 1, 1, 1,
-0.1589103, 3.239038, 1.153159, 1, 1, 1, 1, 1,
-0.1582566, 1.866482, 0.1102784, 1, 1, 1, 1, 1,
-0.1580827, 0.308801, 1.170969, 1, 1, 1, 1, 1,
-0.1563767, 0.3356253, -1.786914, 1, 1, 1, 1, 1,
-0.155213, 0.0991413, -1.367813, 1, 1, 1, 1, 1,
-0.1544148, 0.01692918, 0.2832898, 1, 1, 1, 1, 1,
-0.1524003, 0.002108716, -0.766728, 1, 1, 1, 1, 1,
-0.1519592, -0.3138404, -2.15251, 1, 1, 1, 1, 1,
-0.1485665, -1.563701, -3.136032, 1, 1, 1, 1, 1,
-0.1460165, -0.5969664, -2.94786, 1, 1, 1, 1, 1,
-0.14431, 0.1909926, -0.08501589, 1, 1, 1, 1, 1,
-0.1413949, -2.222489, -3.658028, 1, 1, 1, 1, 1,
-0.1396733, 1.619138, 0.596604, 1, 1, 1, 1, 1,
-0.1370965, 0.6216674, -0.8661712, 0, 0, 1, 1, 1,
-0.1320732, 0.5589957, 0.5590142, 1, 0, 0, 1, 1,
-0.1297336, -0.6417152, -1.405921, 1, 0, 0, 1, 1,
-0.1296361, -0.05395005, -2.414808, 1, 0, 0, 1, 1,
-0.1288166, 1.274826, 0.08878087, 1, 0, 0, 1, 1,
-0.1242319, -0.9676653, -2.151999, 1, 0, 0, 1, 1,
-0.1219061, -0.5132207, -5.086643, 0, 0, 0, 1, 1,
-0.1215251, 1.634695, 0.9384823, 0, 0, 0, 1, 1,
-0.1212313, -0.1263122, -3.227793, 0, 0, 0, 1, 1,
-0.1149468, -0.2010579, -3.542127, 0, 0, 0, 1, 1,
-0.1111746, 2.316943, 0.8332652, 0, 0, 0, 1, 1,
-0.1068401, 0.1617799, 0.06746131, 0, 0, 0, 1, 1,
-0.09920053, -0.3553951, -0.9598556, 0, 0, 0, 1, 1,
-0.09457874, 0.5638804, -1.527785, 1, 1, 1, 1, 1,
-0.08979046, -0.159581, -0.4262947, 1, 1, 1, 1, 1,
-0.08608623, -0.3280875, -4.06021, 1, 1, 1, 1, 1,
-0.08506698, 1.815484, -0.6315225, 1, 1, 1, 1, 1,
-0.08304532, -0.1433997, -3.153741, 1, 1, 1, 1, 1,
-0.08262776, -0.3744564, -2.101673, 1, 1, 1, 1, 1,
-0.07843667, -1.109616, -2.408484, 1, 1, 1, 1, 1,
-0.07764586, -1.257728, -3.384119, 1, 1, 1, 1, 1,
-0.07504336, -0.3007784, -2.726094, 1, 1, 1, 1, 1,
-0.07368666, 1.081781, -0.9523802, 1, 1, 1, 1, 1,
-0.0726482, 1.277344, -0.4329442, 1, 1, 1, 1, 1,
-0.07194525, 2.571356, 0.09404255, 1, 1, 1, 1, 1,
-0.06834186, -0.07205109, -1.203846, 1, 1, 1, 1, 1,
-0.06726089, -0.5999151, -1.956263, 1, 1, 1, 1, 1,
-0.0582813, 2.42257, -2.604225, 1, 1, 1, 1, 1,
-0.05490908, 1.282905, 1.906902, 0, 0, 1, 1, 1,
-0.05361944, 1.705566, 2.061604, 1, 0, 0, 1, 1,
-0.04658036, -0.1119469, -2.285367, 1, 0, 0, 1, 1,
-0.04656521, -1.06509, -1.030204, 1, 0, 0, 1, 1,
-0.04183187, -0.7448345, -4.167289, 1, 0, 0, 1, 1,
-0.03937458, 0.02957132, -1.246429, 1, 0, 0, 1, 1,
-0.03933657, -0.1907492, -3.013352, 0, 0, 0, 1, 1,
-0.03498169, -0.07151521, -2.608857, 0, 0, 0, 1, 1,
-0.03288341, 0.4376989, -1.020058, 0, 0, 0, 1, 1,
-0.03226877, -0.9797745, -1.918041, 0, 0, 0, 1, 1,
-0.03024787, 0.734841, 1.581335, 0, 0, 0, 1, 1,
-0.0235976, -1.238622, -3.718407, 0, 0, 0, 1, 1,
-0.02299099, 0.5314541, 1.02835, 0, 0, 0, 1, 1,
-0.02110212, -0.2074921, -1.847676, 1, 1, 1, 1, 1,
-0.01301873, -0.2959663, -3.215907, 1, 1, 1, 1, 1,
-0.008429295, 0.2254368, 1.446227, 1, 1, 1, 1, 1,
-0.004425352, 1.413821, 1.120142, 1, 1, 1, 1, 1,
-0.004058774, -0.2338545, -2.249452, 1, 1, 1, 1, 1,
0.007056485, 0.8805976, 0.2162462, 1, 1, 1, 1, 1,
0.007589122, -0.4445817, 2.085769, 1, 1, 1, 1, 1,
0.008329608, 1.096317, -0.6159957, 1, 1, 1, 1, 1,
0.01057533, 0.1009581, 0.5610951, 1, 1, 1, 1, 1,
0.01266579, 2.111013, 0.2847067, 1, 1, 1, 1, 1,
0.0129327, -0.6200453, 2.551503, 1, 1, 1, 1, 1,
0.01433788, -0.3643244, 2.905354, 1, 1, 1, 1, 1,
0.01472674, 0.3279408, 0.1858048, 1, 1, 1, 1, 1,
0.01619465, -0.6656047, 2.464965, 1, 1, 1, 1, 1,
0.02061304, -1.133274, 3.025594, 1, 1, 1, 1, 1,
0.03338399, 0.2826891, -0.7806678, 0, 0, 1, 1, 1,
0.03440636, 0.3900271, 0.2042992, 1, 0, 0, 1, 1,
0.03841344, -0.03835103, 1.224381, 1, 0, 0, 1, 1,
0.04226854, 0.2437997, 1.247797, 1, 0, 0, 1, 1,
0.04239539, 1.621658, -1.166765, 1, 0, 0, 1, 1,
0.0431565, 0.6193643, -0.9887298, 1, 0, 0, 1, 1,
0.04864903, 1.392251, -0.8181009, 0, 0, 0, 1, 1,
0.04918633, 0.6388882, -0.18984, 0, 0, 0, 1, 1,
0.05142539, -0.7436741, 3.743204, 0, 0, 0, 1, 1,
0.05335505, 0.2612072, 0.9543331, 0, 0, 0, 1, 1,
0.0601663, -1.377203, 4.207708, 0, 0, 0, 1, 1,
0.06067472, -1.344961, 2.634737, 0, 0, 0, 1, 1,
0.06460143, 0.09503205, 1.067165, 0, 0, 0, 1, 1,
0.06484463, -0.9879831, 4.136784, 1, 1, 1, 1, 1,
0.06503376, 1.848193, 0.4224962, 1, 1, 1, 1, 1,
0.06511753, 1.909486, -0.1766235, 1, 1, 1, 1, 1,
0.06957887, 0.3070581, 0.9358936, 1, 1, 1, 1, 1,
0.07366718, 1.331283, -0.0105329, 1, 1, 1, 1, 1,
0.07430112, 1.53831, 0.2311956, 1, 1, 1, 1, 1,
0.07750197, 0.4647198, -0.8313916, 1, 1, 1, 1, 1,
0.0796365, -1.753695, 3.863707, 1, 1, 1, 1, 1,
0.08085479, -0.1853776, 3.047981, 1, 1, 1, 1, 1,
0.08114382, -0.03042919, 2.210635, 1, 1, 1, 1, 1,
0.08480727, 0.04517896, 0.1126693, 1, 1, 1, 1, 1,
0.08875074, 0.3424406, 0.4495193, 1, 1, 1, 1, 1,
0.09131883, -1.566988, 1.398032, 1, 1, 1, 1, 1,
0.09167684, 0.8263531, 0.2839679, 1, 1, 1, 1, 1,
0.09240878, -0.03545965, 2.592843, 1, 1, 1, 1, 1,
0.09653184, 1.786046, 0.1829634, 0, 0, 1, 1, 1,
0.09731387, -0.5524366, 2.322026, 1, 0, 0, 1, 1,
0.1017783, -1.218406, 3.186839, 1, 0, 0, 1, 1,
0.1023059, -0.5291905, 3.044413, 1, 0, 0, 1, 1,
0.1065779, 1.225662, 0.1398512, 1, 0, 0, 1, 1,
0.1083263, -0.6124503, 2.628893, 1, 0, 0, 1, 1,
0.1133474, -0.1980306, 1.587049, 0, 0, 0, 1, 1,
0.1190165, -0.3541496, 3.043025, 0, 0, 0, 1, 1,
0.1231592, -0.07966375, 4.870224, 0, 0, 0, 1, 1,
0.1239686, 0.05311807, 0.6092117, 0, 0, 0, 1, 1,
0.1256609, -0.4672526, 2.872065, 0, 0, 0, 1, 1,
0.1259402, 0.5638096, 0.8794602, 0, 0, 0, 1, 1,
0.1273898, -1.16707, 2.181476, 0, 0, 0, 1, 1,
0.1325327, -0.9756013, 3.231502, 1, 1, 1, 1, 1,
0.1327108, 1.044004, -1.188119, 1, 1, 1, 1, 1,
0.1334085, 0.0393676, 1.698992, 1, 1, 1, 1, 1,
0.1369462, 1.469586, -0.195033, 1, 1, 1, 1, 1,
0.1388776, 0.3398517, -0.525919, 1, 1, 1, 1, 1,
0.1405749, 0.4080108, 1.145506, 1, 1, 1, 1, 1,
0.1416675, -1.090699, 2.86505, 1, 1, 1, 1, 1,
0.141864, -0.07567852, 0.8594987, 1, 1, 1, 1, 1,
0.1446968, -0.2887542, 2.039679, 1, 1, 1, 1, 1,
0.1460519, 0.7288245, 2.184394, 1, 1, 1, 1, 1,
0.1465479, 2.40275, 0.4078337, 1, 1, 1, 1, 1,
0.1469816, -0.3296896, 3.293019, 1, 1, 1, 1, 1,
0.1520094, -0.371026, 3.798092, 1, 1, 1, 1, 1,
0.1522322, 2.11517, 1.149832, 1, 1, 1, 1, 1,
0.1580279, 0.5639968, 0.05325472, 1, 1, 1, 1, 1,
0.1598594, 0.4712345, -1.089304, 0, 0, 1, 1, 1,
0.1626635, 0.06660877, 1.386197, 1, 0, 0, 1, 1,
0.1638624, 0.4279055, 0.5984231, 1, 0, 0, 1, 1,
0.1642298, -0.04831152, 2.274256, 1, 0, 0, 1, 1,
0.1700214, -0.02505552, 4.520228, 1, 0, 0, 1, 1,
0.1724941, -0.7460895, 3.985339, 1, 0, 0, 1, 1,
0.1817139, -1.515345, 3.93706, 0, 0, 0, 1, 1,
0.1845924, 1.11328, -0.7854907, 0, 0, 0, 1, 1,
0.1852457, -0.9211691, 1.971283, 0, 0, 0, 1, 1,
0.1865178, 0.8929627, 1.091277, 0, 0, 0, 1, 1,
0.1873675, 0.5714565, 2.464757, 0, 0, 0, 1, 1,
0.1910789, 0.6995423, 0.7647755, 0, 0, 0, 1, 1,
0.1924501, -0.5903282, 3.017845, 0, 0, 0, 1, 1,
0.1963384, 0.09426207, 0.03966407, 1, 1, 1, 1, 1,
0.1996258, -0.5757593, 1.958928, 1, 1, 1, 1, 1,
0.2004882, -0.4704159, 3.681537, 1, 1, 1, 1, 1,
0.2014272, -0.4612332, 3.467767, 1, 1, 1, 1, 1,
0.2021451, 0.7681458, 0.9577944, 1, 1, 1, 1, 1,
0.2035987, -1.610418, 1.544424, 1, 1, 1, 1, 1,
0.2051092, -0.968523, 0.9627278, 1, 1, 1, 1, 1,
0.2057104, 0.02504667, 1.697504, 1, 1, 1, 1, 1,
0.2066204, -0.3063446, 2.820152, 1, 1, 1, 1, 1,
0.2087654, -0.4610665, 4.728928, 1, 1, 1, 1, 1,
0.2138732, -0.6315458, 2.891412, 1, 1, 1, 1, 1,
0.2199475, 0.09987889, 2.266209, 1, 1, 1, 1, 1,
0.2265599, -0.8389508, 3.622926, 1, 1, 1, 1, 1,
0.2315967, 0.9318165, 0.8049156, 1, 1, 1, 1, 1,
0.2369484, 1.770289, -0.1109764, 1, 1, 1, 1, 1,
0.2374268, -1.111766, 2.266126, 0, 0, 1, 1, 1,
0.2402722, 0.6421644, 0.5858064, 1, 0, 0, 1, 1,
0.2409959, 0.2074602, 1.452287, 1, 0, 0, 1, 1,
0.2431968, -1.569046, 2.667927, 1, 0, 0, 1, 1,
0.2454, 1.694371, 1.182536, 1, 0, 0, 1, 1,
0.2462723, -0.5653471, 1.862526, 1, 0, 0, 1, 1,
0.2472248, -1.36716, 2.092241, 0, 0, 0, 1, 1,
0.2524714, 0.009995284, 0.9174077, 0, 0, 0, 1, 1,
0.2543686, 0.2873395, 1.713874, 0, 0, 0, 1, 1,
0.2599327, 0.7244602, 1.203514, 0, 0, 0, 1, 1,
0.2619099, 0.07739326, 2.257716, 0, 0, 0, 1, 1,
0.2675214, 0.1066927, 0.6274743, 0, 0, 0, 1, 1,
0.2679348, -0.8727925, 1.447933, 0, 0, 0, 1, 1,
0.2697947, 2.02014, 0.06089169, 1, 1, 1, 1, 1,
0.2698759, 0.826104, 0.4477827, 1, 1, 1, 1, 1,
0.2744459, -0.2873421, 1.666075, 1, 1, 1, 1, 1,
0.2788981, -0.8347703, 3.115344, 1, 1, 1, 1, 1,
0.2822753, -0.7152135, 4.28489, 1, 1, 1, 1, 1,
0.2833002, -0.2422267, 3.297049, 1, 1, 1, 1, 1,
0.2857434, 0.5240598, 0.610819, 1, 1, 1, 1, 1,
0.2862375, 0.8042633, -0.138269, 1, 1, 1, 1, 1,
0.2875325, 0.3464605, 1.299975, 1, 1, 1, 1, 1,
0.2903669, 0.03232579, -0.05262781, 1, 1, 1, 1, 1,
0.2917717, -0.7114872, 1.801051, 1, 1, 1, 1, 1,
0.295928, 0.2034534, 1.443054, 1, 1, 1, 1, 1,
0.297559, 0.1486833, 0.7553838, 1, 1, 1, 1, 1,
0.2983139, 0.5242863, 1.375083, 1, 1, 1, 1, 1,
0.2984287, 0.7756107, 0.2340732, 1, 1, 1, 1, 1,
0.3013409, -0.4342497, 4.055734, 0, 0, 1, 1, 1,
0.3051406, -1.428437, 3.125445, 1, 0, 0, 1, 1,
0.3099096, -0.7135634, 3.58381, 1, 0, 0, 1, 1,
0.3185576, -1.894938, 5.620332, 1, 0, 0, 1, 1,
0.3208737, 0.6080633, 1.018189, 1, 0, 0, 1, 1,
0.3223135, 1.759958, -0.3805406, 1, 0, 0, 1, 1,
0.3234079, 0.7725829, 2.239275, 0, 0, 0, 1, 1,
0.3262176, -1.303436, 2.253009, 0, 0, 0, 1, 1,
0.3263012, -1.291, 3.068772, 0, 0, 0, 1, 1,
0.3295591, -0.2877794, 1.170817, 0, 0, 0, 1, 1,
0.337106, 1.143258, 1.010016, 0, 0, 0, 1, 1,
0.3400677, -0.02490686, 0.4212592, 0, 0, 0, 1, 1,
0.3418489, 0.1531532, 0.5475102, 0, 0, 0, 1, 1,
0.3511758, 0.1125498, 0.6514935, 1, 1, 1, 1, 1,
0.3519217, 0.3871599, -0.4664492, 1, 1, 1, 1, 1,
0.3576172, -1.187773, 2.923428, 1, 1, 1, 1, 1,
0.3577366, -0.7489207, 1.758679, 1, 1, 1, 1, 1,
0.3590577, 0.6810164, 1.190672, 1, 1, 1, 1, 1,
0.363133, 1.725026, 0.7836722, 1, 1, 1, 1, 1,
0.363886, -1.185706, 4.176332, 1, 1, 1, 1, 1,
0.3679598, 0.1480454, -0.3022998, 1, 1, 1, 1, 1,
0.3701215, -1.174052, 3.635021, 1, 1, 1, 1, 1,
0.3741932, -0.3425453, 3.111565, 1, 1, 1, 1, 1,
0.3761987, 0.5958325, 1.112291, 1, 1, 1, 1, 1,
0.3808405, -1.860067, 3.150923, 1, 1, 1, 1, 1,
0.38124, 0.9788507, 0.9342379, 1, 1, 1, 1, 1,
0.3878174, 1.222259, 0.03063685, 1, 1, 1, 1, 1,
0.3878419, 1.274165, -0.1587275, 1, 1, 1, 1, 1,
0.4035779, 0.4001461, 1.03108, 0, 0, 1, 1, 1,
0.4061258, 2.043656, -0.233624, 1, 0, 0, 1, 1,
0.4124238, 0.7190428, 1.327892, 1, 0, 0, 1, 1,
0.4157359, -0.03427532, 1.864915, 1, 0, 0, 1, 1,
0.4194597, -1.74613, 3.696831, 1, 0, 0, 1, 1,
0.4207994, 2.468028, -0.1839887, 1, 0, 0, 1, 1,
0.4209048, 0.1570761, 1.340993, 0, 0, 0, 1, 1,
0.4220999, -2.688278, 2.441895, 0, 0, 0, 1, 1,
0.4230927, 0.9664017, 1.045071, 0, 0, 0, 1, 1,
0.425005, -0.8304217, 1.729831, 0, 0, 0, 1, 1,
0.4265941, -0.4894721, 1.572213, 0, 0, 0, 1, 1,
0.426819, -0.563808, 4.658114, 0, 0, 0, 1, 1,
0.4331795, 1.128506, 2.179932, 0, 0, 0, 1, 1,
0.4333642, -1.224473, 1.506353, 1, 1, 1, 1, 1,
0.436317, 0.501738, 2.782023, 1, 1, 1, 1, 1,
0.4375225, -0.6948836, 2.38189, 1, 1, 1, 1, 1,
0.4378962, -0.2362442, 2.494464, 1, 1, 1, 1, 1,
0.4435467, -1.72697, 2.728622, 1, 1, 1, 1, 1,
0.4478837, -0.1500383, 3.07137, 1, 1, 1, 1, 1,
0.4513866, 0.2372443, 1.233742, 1, 1, 1, 1, 1,
0.4542502, 0.3263953, 1.646067, 1, 1, 1, 1, 1,
0.4565702, 0.6237113, 0.1755248, 1, 1, 1, 1, 1,
0.4637019, 0.8361193, 0.09220348, 1, 1, 1, 1, 1,
0.4644031, -1.328931, 2.931528, 1, 1, 1, 1, 1,
0.4658231, -0.01077831, 2.428054, 1, 1, 1, 1, 1,
0.4669951, -1.304023, 1.115778, 1, 1, 1, 1, 1,
0.468165, 0.06570655, 1.493197, 1, 1, 1, 1, 1,
0.4723245, 0.9270739, 0.7524205, 1, 1, 1, 1, 1,
0.4724385, -0.01752665, 0.7353951, 0, 0, 1, 1, 1,
0.473125, -0.2218578, 0.9417116, 1, 0, 0, 1, 1,
0.479916, 0.07521234, 0.9637229, 1, 0, 0, 1, 1,
0.4828696, 0.1308976, 1.737689, 1, 0, 0, 1, 1,
0.4834273, -0.4490903, 2.389159, 1, 0, 0, 1, 1,
0.4895148, 0.5964504, 0.3168061, 1, 0, 0, 1, 1,
0.4917793, -0.551297, 2.633719, 0, 0, 0, 1, 1,
0.4935641, -0.602186, 3.561451, 0, 0, 0, 1, 1,
0.4947352, 0.3694832, 1.536106, 0, 0, 0, 1, 1,
0.495381, 0.4252077, -0.7527165, 0, 0, 0, 1, 1,
0.4963983, -0.5915504, 4.073917, 0, 0, 0, 1, 1,
0.5039918, -1.532136, 2.337479, 0, 0, 0, 1, 1,
0.5055808, 0.9541043, 0.6035622, 0, 0, 0, 1, 1,
0.5078248, -1.017285, 3.501604, 1, 1, 1, 1, 1,
0.5114878, 0.09174898, 1.205296, 1, 1, 1, 1, 1,
0.5134041, -2.805078, 1.087748, 1, 1, 1, 1, 1,
0.516932, 0.9471527, -0.51218, 1, 1, 1, 1, 1,
0.5178425, 0.5576316, 0.7550589, 1, 1, 1, 1, 1,
0.5310429, 0.8051023, -0.892781, 1, 1, 1, 1, 1,
0.5332863, -0.8518865, 2.617717, 1, 1, 1, 1, 1,
0.5374529, -0.08314051, 2.570909, 1, 1, 1, 1, 1,
0.537484, 1.189543, -0.1798154, 1, 1, 1, 1, 1,
0.5387988, 1.660492, 1.85551, 1, 1, 1, 1, 1,
0.5455183, -0.7955104, 2.53666, 1, 1, 1, 1, 1,
0.5462797, 0.07616573, 2.268215, 1, 1, 1, 1, 1,
0.5475764, 1.26733, 0.6361029, 1, 1, 1, 1, 1,
0.5524586, -1.022313, 1.421631, 1, 1, 1, 1, 1,
0.5543486, 1.077877, 1.064348, 1, 1, 1, 1, 1,
0.5598465, -1.381047, 1.63746, 0, 0, 1, 1, 1,
0.5672294, -0.6772823, 4.171662, 1, 0, 0, 1, 1,
0.5679262, -0.7074516, 3.667341, 1, 0, 0, 1, 1,
0.5680277, -0.3817227, 1.587911, 1, 0, 0, 1, 1,
0.5717788, -0.887705, 2.201433, 1, 0, 0, 1, 1,
0.5721151, -0.0758501, 2.081628, 1, 0, 0, 1, 1,
0.5738032, -1.313544, 1.675938, 0, 0, 0, 1, 1,
0.5749375, -0.8399664, 4.084585, 0, 0, 0, 1, 1,
0.579916, -0.5839581, 0.3757956, 0, 0, 0, 1, 1,
0.5799341, -0.3501189, 2.269675, 0, 0, 0, 1, 1,
0.5856964, 2.655864, 0.726687, 0, 0, 0, 1, 1,
0.5865382, 0.5344176, -0.18852, 0, 0, 0, 1, 1,
0.5877957, 0.5076105, 0.1281745, 0, 0, 0, 1, 1,
0.5885212, -0.5038383, 1.088717, 1, 1, 1, 1, 1,
0.5908252, -0.1880479, 0.7679809, 1, 1, 1, 1, 1,
0.5910903, 0.1188138, 2.287156, 1, 1, 1, 1, 1,
0.5911474, -1.748625, 2.736933, 1, 1, 1, 1, 1,
0.5928372, 0.384815, 0.6482574, 1, 1, 1, 1, 1,
0.5968328, -0.005992698, 0.8807024, 1, 1, 1, 1, 1,
0.6012061, 0.6618672, 1.342272, 1, 1, 1, 1, 1,
0.6039011, -0.04330348, 2.243114, 1, 1, 1, 1, 1,
0.6041479, -0.8338386, 3.851918, 1, 1, 1, 1, 1,
0.6043926, 0.2751479, 1.168334, 1, 1, 1, 1, 1,
0.6054592, -0.5046366, 1.271959, 1, 1, 1, 1, 1,
0.6073303, -0.3145079, 1.468725, 1, 1, 1, 1, 1,
0.6078165, -1.796075, 2.622874, 1, 1, 1, 1, 1,
0.6081991, -1.925959, 3.007602, 1, 1, 1, 1, 1,
0.6082522, -1.192862, 1.790021, 1, 1, 1, 1, 1,
0.6096756, 0.6904202, 2.630309, 0, 0, 1, 1, 1,
0.6140776, -0.7722929, 1.754514, 1, 0, 0, 1, 1,
0.6189637, -0.7780777, 1.221722, 1, 0, 0, 1, 1,
0.6190794, 0.4513605, 2.396805, 1, 0, 0, 1, 1,
0.6200816, -0.5068294, 3.07927, 1, 0, 0, 1, 1,
0.6257428, -1.885171, 2.22125, 1, 0, 0, 1, 1,
0.6287365, 0.2064889, 2.216527, 0, 0, 0, 1, 1,
0.6288992, 2.051215, 1.472658, 0, 0, 0, 1, 1,
0.6326863, 0.356468, -0.1571479, 0, 0, 0, 1, 1,
0.6389892, -0.2691744, 0.2157303, 0, 0, 0, 1, 1,
0.6425912, -0.5979061, 1.675809, 0, 0, 0, 1, 1,
0.6433576, -0.3093244, 0.5639859, 0, 0, 0, 1, 1,
0.6476555, -0.9814669, 2.850596, 0, 0, 0, 1, 1,
0.6514958, 0.8366177, -0.4408146, 1, 1, 1, 1, 1,
0.6533266, 0.4230618, 0.1543502, 1, 1, 1, 1, 1,
0.6533548, -0.2055966, 0.7944415, 1, 1, 1, 1, 1,
0.6550978, -1.672458, 1.99521, 1, 1, 1, 1, 1,
0.6620795, -0.9759808, 1.88221, 1, 1, 1, 1, 1,
0.6642913, 0.3704597, 1.082456, 1, 1, 1, 1, 1,
0.6653023, 0.04387985, 2.634622, 1, 1, 1, 1, 1,
0.6705586, -0.07389604, 1.426965, 1, 1, 1, 1, 1,
0.6719737, 0.167117, 2.067145, 1, 1, 1, 1, 1,
0.6767238, 2.299716, 0.3933508, 1, 1, 1, 1, 1,
0.6884718, -0.368402, 1.942436, 1, 1, 1, 1, 1,
0.6889645, -0.04020312, 2.22303, 1, 1, 1, 1, 1,
0.6900972, -0.9906337, 2.778481, 1, 1, 1, 1, 1,
0.6912826, 1.020682, -0.2544408, 1, 1, 1, 1, 1,
0.6933373, 0.1150958, 1.490137, 1, 1, 1, 1, 1,
0.6956617, -0.9758853, 2.817116, 0, 0, 1, 1, 1,
0.6965476, 0.1918719, -0.2632921, 1, 0, 0, 1, 1,
0.7053363, 0.4540641, 0.01040973, 1, 0, 0, 1, 1,
0.7083507, -0.6588907, 2.995789, 1, 0, 0, 1, 1,
0.7134677, 0.945883, 0.9270755, 1, 0, 0, 1, 1,
0.7146205, -0.1978019, 2.207422, 1, 0, 0, 1, 1,
0.7192093, 0.2283907, 2.0432, 0, 0, 0, 1, 1,
0.7234298, -0.2376775, 2.202852, 0, 0, 0, 1, 1,
0.7259254, 0.1382771, 0.6359916, 0, 0, 0, 1, 1,
0.730834, 1.741517, 1.187502, 0, 0, 0, 1, 1,
0.7326807, -0.2609885, 1.108875, 0, 0, 0, 1, 1,
0.7376982, 0.3409391, 1.094067, 0, 0, 0, 1, 1,
0.7396527, -2.581962, 3.193814, 0, 0, 0, 1, 1,
0.7403966, -1.215862, 2.372429, 1, 1, 1, 1, 1,
0.7424012, 1.96393, -0.4272786, 1, 1, 1, 1, 1,
0.746367, -0.3204939, 1.113784, 1, 1, 1, 1, 1,
0.7477189, 0.6977814, 3.480698, 1, 1, 1, 1, 1,
0.74933, 0.5528514, -0.7336463, 1, 1, 1, 1, 1,
0.7500068, 1.60658, 0.5525059, 1, 1, 1, 1, 1,
0.7507809, 0.3503321, 3.499262, 1, 1, 1, 1, 1,
0.7510845, 0.3512693, 2.689429, 1, 1, 1, 1, 1,
0.757014, -0.3679327, 1.060457, 1, 1, 1, 1, 1,
0.7637078, 0.4851316, 0.9800977, 1, 1, 1, 1, 1,
0.7686616, 0.223623, 3.253851, 1, 1, 1, 1, 1,
0.7773198, -0.4622443, 2.579715, 1, 1, 1, 1, 1,
0.7809796, -1.498423, 1.348969, 1, 1, 1, 1, 1,
0.786989, 0.3678241, 1.205046, 1, 1, 1, 1, 1,
0.7897783, 0.3538878, 1.296744, 1, 1, 1, 1, 1,
0.7917085, 0.9933775, 0.8118446, 0, 0, 1, 1, 1,
0.7945362, -0.8278453, 2.380693, 1, 0, 0, 1, 1,
0.7964622, 0.4335718, 2.594677, 1, 0, 0, 1, 1,
0.8060759, 0.9258053, 0.2135794, 1, 0, 0, 1, 1,
0.8238853, -0.2759777, 3.178926, 1, 0, 0, 1, 1,
0.8251777, 0.08441924, 2.27529, 1, 0, 0, 1, 1,
0.8251891, 0.3168026, 2.816945, 0, 0, 0, 1, 1,
0.8260785, 0.1660947, 0.6728496, 0, 0, 0, 1, 1,
0.8300877, 0.06189269, 2.520514, 0, 0, 0, 1, 1,
0.8452944, 0.2466349, -0.2682115, 0, 0, 0, 1, 1,
0.8470982, -0.594713, 1.272941, 0, 0, 0, 1, 1,
0.8512551, -1.812487, 1.927563, 0, 0, 0, 1, 1,
0.8532155, 1.690629, -0.3585252, 0, 0, 0, 1, 1,
0.8582045, 1.177256, -0.1287116, 1, 1, 1, 1, 1,
0.8582571, -0.6538648, 2.843121, 1, 1, 1, 1, 1,
0.8603508, -1.075327, 3.464842, 1, 1, 1, 1, 1,
0.8627254, -1.550882, 3.813337, 1, 1, 1, 1, 1,
0.8649856, -0.9510825, 3.068864, 1, 1, 1, 1, 1,
0.872064, -0.05275065, 1.963626, 1, 1, 1, 1, 1,
0.8746421, 0.3523553, 0.9328994, 1, 1, 1, 1, 1,
0.8777548, 0.8665951, 1.125597, 1, 1, 1, 1, 1,
0.8808599, 1.574764, 0.2522159, 1, 1, 1, 1, 1,
0.8808926, -1.737973, 2.439261, 1, 1, 1, 1, 1,
0.8823568, 0.4008372, 0.5895803, 1, 1, 1, 1, 1,
0.8931243, 0.9917715, 0.2124108, 1, 1, 1, 1, 1,
0.9012596, -1.243379, 2.436801, 1, 1, 1, 1, 1,
0.9015028, -0.6995885, 3.004495, 1, 1, 1, 1, 1,
0.9029012, -1.148853, 2.349043, 1, 1, 1, 1, 1,
0.906831, 1.304755, 0.6258358, 0, 0, 1, 1, 1,
0.9068996, -0.2277658, 1.729959, 1, 0, 0, 1, 1,
0.9086313, -0.03039578, 1.269547, 1, 0, 0, 1, 1,
0.9137124, 0.2333184, 0.5796856, 1, 0, 0, 1, 1,
0.9142059, 1.898787, 2.311917, 1, 0, 0, 1, 1,
0.9155287, 0.1644515, 2.874888, 1, 0, 0, 1, 1,
0.9165815, 0.9952376, -1.231544, 0, 0, 0, 1, 1,
0.9189577, 0.436776, 1.38193, 0, 0, 0, 1, 1,
0.9193648, -1.460521, 1.586036, 0, 0, 0, 1, 1,
0.9203056, 0.4895158, 1.340257, 0, 0, 0, 1, 1,
0.9213877, -0.5821513, 1.316196, 0, 0, 0, 1, 1,
0.9215745, -2.361637, 0.7612528, 0, 0, 0, 1, 1,
0.9257625, -0.09082367, 2.944331, 0, 0, 0, 1, 1,
0.9295762, -0.8334457, 2.506304, 1, 1, 1, 1, 1,
0.9300174, -0.8185723, 2.360173, 1, 1, 1, 1, 1,
0.9375486, -0.3274386, 2.728518, 1, 1, 1, 1, 1,
0.9394825, -0.9585652, 0.5794508, 1, 1, 1, 1, 1,
0.9426852, 0.08933797, 0.8815244, 1, 1, 1, 1, 1,
0.9548008, -0.9217881, 2.274461, 1, 1, 1, 1, 1,
0.9568508, -0.2351732, 2.164487, 1, 1, 1, 1, 1,
0.9621792, -1.003892, 3.304931, 1, 1, 1, 1, 1,
0.9665302, 0.6631291, -1.427115, 1, 1, 1, 1, 1,
0.9786764, -0.01631917, 0.5288116, 1, 1, 1, 1, 1,
0.9817999, 0.3056724, 0.8118903, 1, 1, 1, 1, 1,
0.9865253, -0.159041, 1.226436, 1, 1, 1, 1, 1,
0.987894, -0.9116485, 4.130672, 1, 1, 1, 1, 1,
0.9915885, 0.5302403, 1.563964, 1, 1, 1, 1, 1,
0.9985621, 0.09813657, 2.056587, 1, 1, 1, 1, 1,
1.004632, 0.05743686, 1.575327, 0, 0, 1, 1, 1,
1.006341, 0.4690231, 0.2531908, 1, 0, 0, 1, 1,
1.006468, -2.136812, 4.913216, 1, 0, 0, 1, 1,
1.010293, -0.3263485, 2.312169, 1, 0, 0, 1, 1,
1.012456, 0.2867155, 2.119153, 1, 0, 0, 1, 1,
1.015941, -0.1761112, 1.114859, 1, 0, 0, 1, 1,
1.035171, 2.329957, -2.178616, 0, 0, 0, 1, 1,
1.042792, 1.78619, 3.269361, 0, 0, 0, 1, 1,
1.050914, 0.581878, 2.430528, 0, 0, 0, 1, 1,
1.054219, -0.9862769, 3.386252, 0, 0, 0, 1, 1,
1.058169, -0.6299438, -0.6830691, 0, 0, 0, 1, 1,
1.059757, 1.703552, 1.692089, 0, 0, 0, 1, 1,
1.061078, -0.6925685, 1.376725, 0, 0, 0, 1, 1,
1.066452, -2.155253, 4.558588, 1, 1, 1, 1, 1,
1.066931, -1.437679, 3.585022, 1, 1, 1, 1, 1,
1.067825, -0.4043277, 3.472382, 1, 1, 1, 1, 1,
1.072375, -2.634054, 3.520037, 1, 1, 1, 1, 1,
1.075785, -0.3511914, 2.486761, 1, 1, 1, 1, 1,
1.078166, 2.057724, 1.577241, 1, 1, 1, 1, 1,
1.080554, -0.956972, 2.124313, 1, 1, 1, 1, 1,
1.096703, 0.2621129, -0.2583998, 1, 1, 1, 1, 1,
1.098172, -1.241669, 1.750165, 1, 1, 1, 1, 1,
1.112865, 0.9843944, 0.5333339, 1, 1, 1, 1, 1,
1.112986, -1.766882, 2.389835, 1, 1, 1, 1, 1,
1.113336, 0.5321742, -0.9705725, 1, 1, 1, 1, 1,
1.11611, -0.7776273, 4.112595, 1, 1, 1, 1, 1,
1.119981, 0.05436744, 1.854973, 1, 1, 1, 1, 1,
1.123039, -0.5944299, 3.700936, 1, 1, 1, 1, 1,
1.124444, -0.3163388, 1.384372, 0, 0, 1, 1, 1,
1.129435, 1.199866, 2.261979, 1, 0, 0, 1, 1,
1.132657, -0.8579677, 3.270734, 1, 0, 0, 1, 1,
1.137422, -1.58624, 1.831285, 1, 0, 0, 1, 1,
1.139494, -1.053821, 2.800568, 1, 0, 0, 1, 1,
1.144286, 0.0009511976, 0.887343, 1, 0, 0, 1, 1,
1.150912, 1.586069, -0.07865455, 0, 0, 0, 1, 1,
1.154672, 1.687596, -1.816048, 0, 0, 0, 1, 1,
1.158248, 2.183942, -0.5943314, 0, 0, 0, 1, 1,
1.170893, 0.3886769, 2.15776, 0, 0, 0, 1, 1,
1.1794, -0.4027064, -0.30484, 0, 0, 0, 1, 1,
1.1818, -1.86768, 2.572605, 0, 0, 0, 1, 1,
1.181947, -0.9379038, 2.05634, 0, 0, 0, 1, 1,
1.185339, -0.7953355, 3.07224, 1, 1, 1, 1, 1,
1.199383, 0.3971115, 2.961694, 1, 1, 1, 1, 1,
1.200514, -0.5096221, 2.010263, 1, 1, 1, 1, 1,
1.207363, 0.1127453, 1.882562, 1, 1, 1, 1, 1,
1.213661, 1.387646, 1.271728, 1, 1, 1, 1, 1,
1.226406, -0.1726422, 0.2784124, 1, 1, 1, 1, 1,
1.23154, -1.998774, 2.509807, 1, 1, 1, 1, 1,
1.235952, -1.369545, 0.7483218, 1, 1, 1, 1, 1,
1.241694, -0.01551475, 2.949201, 1, 1, 1, 1, 1,
1.243952, 1.610987, -0.2075663, 1, 1, 1, 1, 1,
1.251361, 0.03006712, 0.8810328, 1, 1, 1, 1, 1,
1.254026, -0.8544306, 2.067164, 1, 1, 1, 1, 1,
1.264992, 1.356368, 1.745769, 1, 1, 1, 1, 1,
1.267896, -1.129696, 3.264947, 1, 1, 1, 1, 1,
1.27871, 0.1982352, 1.69879, 1, 1, 1, 1, 1,
1.300005, -0.9508812, 1.034068, 0, 0, 1, 1, 1,
1.302521, 0.812835, 1.79057, 1, 0, 0, 1, 1,
1.30481, 0.03632649, 1.466002, 1, 0, 0, 1, 1,
1.308483, 0.6959374, 1.148055, 1, 0, 0, 1, 1,
1.320692, 0.3625649, 1.401954, 1, 0, 0, 1, 1,
1.332049, 1.159573, 0.2376819, 1, 0, 0, 1, 1,
1.337765, -0.9326634, 3.033934, 0, 0, 0, 1, 1,
1.350698, -1.135163, 2.953595, 0, 0, 0, 1, 1,
1.358079, -0.0491646, 2.268127, 0, 0, 0, 1, 1,
1.360356, 0.3905861, 2.479661, 0, 0, 0, 1, 1,
1.361648, -1.20868, 2.480606, 0, 0, 0, 1, 1,
1.378969, -1.393602, 3.142659, 0, 0, 0, 1, 1,
1.381963, 1.378748, 1.769623, 0, 0, 0, 1, 1,
1.387945, -1.707727, 2.086842, 1, 1, 1, 1, 1,
1.389134, 0.2545768, 1.920835, 1, 1, 1, 1, 1,
1.40556, -1.423357, 2.750103, 1, 1, 1, 1, 1,
1.419315, 0.3069339, 3.246804, 1, 1, 1, 1, 1,
1.435351, -1.206318, -0.2736762, 1, 1, 1, 1, 1,
1.449722, -0.3437259, 2.570989, 1, 1, 1, 1, 1,
1.453938, 0.5984325, 1.763993, 1, 1, 1, 1, 1,
1.458732, 0.7420521, 0.864226, 1, 1, 1, 1, 1,
1.460981, -1.016253, 1.289544, 1, 1, 1, 1, 1,
1.460992, -0.3449364, 1.195365, 1, 1, 1, 1, 1,
1.476232, -1.041209, 1.25468, 1, 1, 1, 1, 1,
1.479947, -0.4999773, 0.9467857, 1, 1, 1, 1, 1,
1.484402, 0.6149415, 0.7633319, 1, 1, 1, 1, 1,
1.493208, -0.8888015, 3.176988, 1, 1, 1, 1, 1,
1.494207, 0.2272311, 1.440196, 1, 1, 1, 1, 1,
1.495729, 0.4574572, 2.496089, 0, 0, 1, 1, 1,
1.496542, 1.629024, -0.6714176, 1, 0, 0, 1, 1,
1.512777, 1.203613, 0.7479547, 1, 0, 0, 1, 1,
1.513233, -1.747077, 1.986165, 1, 0, 0, 1, 1,
1.516485, 2.585148, 1.113476, 1, 0, 0, 1, 1,
1.518056, 0.02172106, 2.898695, 1, 0, 0, 1, 1,
1.521344, -0.3367614, 2.138684, 0, 0, 0, 1, 1,
1.528024, 1.38699, 0.9355675, 0, 0, 0, 1, 1,
1.528307, -2.10017, 2.969025, 0, 0, 0, 1, 1,
1.530692, 1.938865, 0.7372195, 0, 0, 0, 1, 1,
1.55405, 0.1770875, 1.914006, 0, 0, 0, 1, 1,
1.569315, -1.823347, 1.829746, 0, 0, 0, 1, 1,
1.577136, -1.28135, 0.8403746, 0, 0, 0, 1, 1,
1.579151, 0.8609967, 2.224767, 1, 1, 1, 1, 1,
1.581493, -0.7675897, 2.600312, 1, 1, 1, 1, 1,
1.583156, -0.8524987, 3.288454, 1, 1, 1, 1, 1,
1.612771, -0.2376563, 0.3985091, 1, 1, 1, 1, 1,
1.628776, -0.9767158, 1.73991, 1, 1, 1, 1, 1,
1.643855, -0.3069797, 0.515395, 1, 1, 1, 1, 1,
1.650144, 1.687186, 1.324377, 1, 1, 1, 1, 1,
1.67264, -0.1871962, 1.152675, 1, 1, 1, 1, 1,
1.68184, -0.8815448, -0.1816662, 1, 1, 1, 1, 1,
1.683649, 0.2799528, 0.8983567, 1, 1, 1, 1, 1,
1.691929, -0.9580181, 2.931112, 1, 1, 1, 1, 1,
1.701854, -0.4308504, 2.040217, 1, 1, 1, 1, 1,
1.730116, 0.6406807, 1.840016, 1, 1, 1, 1, 1,
1.731227, -1.79523, 1.672444, 1, 1, 1, 1, 1,
1.738135, 1.557613, -1.83498, 1, 1, 1, 1, 1,
1.738565, -1.03145, 3.052069, 0, 0, 1, 1, 1,
1.743297, 1.284068, -0.248969, 1, 0, 0, 1, 1,
1.749009, 0.6026334, 2.844738, 1, 0, 0, 1, 1,
1.763955, 0.813689, 0.3995598, 1, 0, 0, 1, 1,
1.773984, -0.9416777, 2.396495, 1, 0, 0, 1, 1,
1.775586, 0.002132887, 3.431715, 1, 0, 0, 1, 1,
1.809041, -0.9922997, 1.893536, 0, 0, 0, 1, 1,
1.832871, -1.169424, 3.355644, 0, 0, 0, 1, 1,
1.847671, -0.6554363, 1.988326, 0, 0, 0, 1, 1,
1.852079, 0.2348514, -0.04863447, 0, 0, 0, 1, 1,
1.8615, -0.2229005, 1.286376, 0, 0, 0, 1, 1,
1.862884, -0.03477023, 3.467819, 0, 0, 0, 1, 1,
1.868996, 0.8383691, 0.7741768, 0, 0, 0, 1, 1,
1.873971, -0.947342, 3.716419, 1, 1, 1, 1, 1,
1.888548, 1.666066, 0.3421203, 1, 1, 1, 1, 1,
1.902622, -1.186563, 2.492625, 1, 1, 1, 1, 1,
1.918594, -0.1213401, 3.213502, 1, 1, 1, 1, 1,
1.953719, 0.5414889, 1.362078, 1, 1, 1, 1, 1,
1.961847, -1.582922, 2.487652, 1, 1, 1, 1, 1,
1.968273, 0.1624113, 2.23983, 1, 1, 1, 1, 1,
1.970356, 0.8363181, 2.672862, 1, 1, 1, 1, 1,
1.974109, -1.520241, 3.164301, 1, 1, 1, 1, 1,
1.99815, -0.4233832, 2.342763, 1, 1, 1, 1, 1,
2.008399, -1.002, 2.661012, 1, 1, 1, 1, 1,
2.020158, 0.3642629, 0.9218366, 1, 1, 1, 1, 1,
2.034278, -0.3347043, 2.268656, 1, 1, 1, 1, 1,
2.086643, 1.298078, 0.7862467, 1, 1, 1, 1, 1,
2.089106, -1.125953, 1.79807, 1, 1, 1, 1, 1,
2.095077, 0.001315767, 1.833516, 0, 0, 1, 1, 1,
2.098523, -1.648166, 2.859925, 1, 0, 0, 1, 1,
2.158938, 2.035002, 1.971193, 1, 0, 0, 1, 1,
2.165418, 0.1567367, 1.439614, 1, 0, 0, 1, 1,
2.208712, -0.5549832, -0.03934025, 1, 0, 0, 1, 1,
2.215272, -0.5725817, 2.985544, 1, 0, 0, 1, 1,
2.216236, 0.4556566, -0.5276471, 0, 0, 0, 1, 1,
2.306716, 0.3073695, 0.7712725, 0, 0, 0, 1, 1,
2.390213, -0.9859604, 1.876058, 0, 0, 0, 1, 1,
2.396307, -0.5862185, 2.864146, 0, 0, 0, 1, 1,
2.423885, -0.6063448, 2.636233, 0, 0, 0, 1, 1,
2.433965, 1.509965, 2.304453, 0, 0, 0, 1, 1,
2.437054, 1.484038, -0.3779821, 0, 0, 0, 1, 1,
2.476293, 1.74778, 0.7502947, 1, 1, 1, 1, 1,
2.545935, 0.5831051, 3.07134, 1, 1, 1, 1, 1,
2.584064, 0.7626255, 0.1212047, 1, 1, 1, 1, 1,
2.58748, -0.05201128, 0.2760748, 1, 1, 1, 1, 1,
2.788757, 0.7308866, 2.641058, 1, 1, 1, 1, 1,
2.793252, 1.141428, 2.078569, 1, 1, 1, 1, 1,
3.582963, 2.060533, 2.765685, 1, 1, 1, 1, 1
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
var radius = 9.46505;
var distance = 33.24559;
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
mvMatrix.translate( -0.4062167, -0.210765, -0.2668447 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.24559);
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
