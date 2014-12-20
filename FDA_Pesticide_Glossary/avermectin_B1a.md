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
-4.038855, 0.6785276, -0.8554378, 1, 0, 0, 1,
-3.227784, 0.2655347, -2.086838, 1, 0.007843138, 0, 1,
-2.707144, -0.2978562, -3.699748, 1, 0.01176471, 0, 1,
-2.697448, -1.387745, -4.261158, 1, 0.01960784, 0, 1,
-2.452354, -0.7186658, -2.327272, 1, 0.02352941, 0, 1,
-2.41699, -0.04609157, -2.399004, 1, 0.03137255, 0, 1,
-2.293513, -0.8639811, -3.122125, 1, 0.03529412, 0, 1,
-2.241715, -0.3259861, -3.224984, 1, 0.04313726, 0, 1,
-2.235404, 0.1850252, 0.2483788, 1, 0.04705882, 0, 1,
-2.206933, -0.4480772, -1.932332, 1, 0.05490196, 0, 1,
-2.181748, -0.1014496, -2.751372, 1, 0.05882353, 0, 1,
-2.162372, -0.5761044, -0.961937, 1, 0.06666667, 0, 1,
-2.148514, 0.9733979, -1.200097, 1, 0.07058824, 0, 1,
-2.147891, -0.03225008, -2.072573, 1, 0.07843138, 0, 1,
-2.135253, -0.848852, -1.343933, 1, 0.08235294, 0, 1,
-2.132832, -0.2298105, -4.383117, 1, 0.09019608, 0, 1,
-2.117169, -0.535834, -0.9979545, 1, 0.09411765, 0, 1,
-2.109649, -0.4181961, -2.55172, 1, 0.1019608, 0, 1,
-2.078338, 1.101773, -1.764582, 1, 0.1098039, 0, 1,
-2.072936, -0.582512, -0.8881879, 1, 0.1137255, 0, 1,
-2.056815, 0.09517036, -0.3698557, 1, 0.1215686, 0, 1,
-2.053842, 0.8011149, -1.730426, 1, 0.1254902, 0, 1,
-2.042081, -0.5994787, -1.277079, 1, 0.1333333, 0, 1,
-2.003237, -1.81179, -1.397789, 1, 0.1372549, 0, 1,
-1.996056, 0.1517677, -1.129937, 1, 0.145098, 0, 1,
-1.992348, -1.037184, -0.6194993, 1, 0.1490196, 0, 1,
-1.980323, 0.01435603, -3.282855, 1, 0.1568628, 0, 1,
-1.911726, 0.3637561, -4.955321, 1, 0.1607843, 0, 1,
-1.910088, -0.5056701, -3.154721, 1, 0.1686275, 0, 1,
-1.901081, -2.380818, -3.744495, 1, 0.172549, 0, 1,
-1.877702, 0.5179819, -1.413936, 1, 0.1803922, 0, 1,
-1.866033, -1.091412, -3.542577, 1, 0.1843137, 0, 1,
-1.85693, 0.9436995, -0.0124038, 1, 0.1921569, 0, 1,
-1.839051, 1.48877, -1.4256, 1, 0.1960784, 0, 1,
-1.810805, -1.564917, -0.7181425, 1, 0.2039216, 0, 1,
-1.795832, 0.2136564, 0.1287414, 1, 0.2117647, 0, 1,
-1.780464, 1.220091, -1.803551, 1, 0.2156863, 0, 1,
-1.758881, -1.117889, -1.027194, 1, 0.2235294, 0, 1,
-1.756262, 0.1106629, -1.968862, 1, 0.227451, 0, 1,
-1.756229, 1.613872, 0.2426998, 1, 0.2352941, 0, 1,
-1.753261, -0.3951282, -3.667857, 1, 0.2392157, 0, 1,
-1.749997, -1.494187, -2.393189, 1, 0.2470588, 0, 1,
-1.734405, -0.5438407, -2.311873, 1, 0.2509804, 0, 1,
-1.715925, -1.019315, -2.476856, 1, 0.2588235, 0, 1,
-1.686061, -1.019255, -2.338099, 1, 0.2627451, 0, 1,
-1.680988, -0.290657, -2.41611, 1, 0.2705882, 0, 1,
-1.66755, 0.9231215, -0.7382606, 1, 0.2745098, 0, 1,
-1.652547, -0.9310367, -2.227654, 1, 0.282353, 0, 1,
-1.650844, -1.823101, -3.716596, 1, 0.2862745, 0, 1,
-1.641473, 1.066749, -0.7049156, 1, 0.2941177, 0, 1,
-1.639775, -1.081348, -1.615992, 1, 0.3019608, 0, 1,
-1.629716, 2.353699, -0.9265732, 1, 0.3058824, 0, 1,
-1.627192, 1.874253, -2.608837, 1, 0.3137255, 0, 1,
-1.621525, -0.5727316, -2.119296, 1, 0.3176471, 0, 1,
-1.619536, 0.6102769, -1.116065, 1, 0.3254902, 0, 1,
-1.609934, -1.25768, -2.902553, 1, 0.3294118, 0, 1,
-1.60541, -0.4498307, -1.344387, 1, 0.3372549, 0, 1,
-1.598177, -0.8564012, -1.852935, 1, 0.3411765, 0, 1,
-1.585958, -1.301774, -4.481192, 1, 0.3490196, 0, 1,
-1.583013, -0.4491293, -3.662432, 1, 0.3529412, 0, 1,
-1.582845, -0.2108008, -1.108986, 1, 0.3607843, 0, 1,
-1.579602, -0.5275738, -2.519423, 1, 0.3647059, 0, 1,
-1.572095, 0.1664626, 0.1234824, 1, 0.372549, 0, 1,
-1.568137, -0.4715231, -2.476315, 1, 0.3764706, 0, 1,
-1.552866, -0.6169972, -1.583677, 1, 0.3843137, 0, 1,
-1.54341, 0.8788152, -2.020871, 1, 0.3882353, 0, 1,
-1.509328, 0.5971914, -2.333866, 1, 0.3960784, 0, 1,
-1.506172, 0.3764566, 0.02887299, 1, 0.4039216, 0, 1,
-1.504976, -0.5684054, -0.5445919, 1, 0.4078431, 0, 1,
-1.496911, 0.3632738, -2.343403, 1, 0.4156863, 0, 1,
-1.492591, 0.4620848, -2.485433, 1, 0.4196078, 0, 1,
-1.482262, 2.162336, -1.58529, 1, 0.427451, 0, 1,
-1.478919, 0.5145766, -1.082748, 1, 0.4313726, 0, 1,
-1.474505, 0.8622822, 0.06704571, 1, 0.4392157, 0, 1,
-1.473226, -0.3414865, -2.064904, 1, 0.4431373, 0, 1,
-1.468776, 0.58658, -1.367438, 1, 0.4509804, 0, 1,
-1.467904, -0.8703287, -4.73204, 1, 0.454902, 0, 1,
-1.46649, -0.2706888, -1.752981, 1, 0.4627451, 0, 1,
-1.460188, -0.3852514, -2.060198, 1, 0.4666667, 0, 1,
-1.43054, -1.077829, -2.410222, 1, 0.4745098, 0, 1,
-1.422633, 0.1418064, -2.021285, 1, 0.4784314, 0, 1,
-1.412235, 0.169625, -0.004331172, 1, 0.4862745, 0, 1,
-1.410898, -0.8946245, -2.66486, 1, 0.4901961, 0, 1,
-1.409739, 0.766658, -2.825572, 1, 0.4980392, 0, 1,
-1.388587, -0.4165235, -3.288358, 1, 0.5058824, 0, 1,
-1.380631, 0.6133082, -3.56515, 1, 0.509804, 0, 1,
-1.374647, 0.08053159, -0.9493783, 1, 0.5176471, 0, 1,
-1.362734, 0.5128769, -2.567905, 1, 0.5215687, 0, 1,
-1.360728, 0.08185848, -1.085072, 1, 0.5294118, 0, 1,
-1.355106, 0.952905, 0.2736301, 1, 0.5333334, 0, 1,
-1.353483, 0.799108, -1.279497, 1, 0.5411765, 0, 1,
-1.351919, 0.3711321, 0.9594529, 1, 0.5450981, 0, 1,
-1.34867, -0.2365642, -2.547527, 1, 0.5529412, 0, 1,
-1.326223, 0.1188798, -0.1027237, 1, 0.5568628, 0, 1,
-1.323105, -0.03148213, -1.356145, 1, 0.5647059, 0, 1,
-1.29693, -0.5988876, -1.991219, 1, 0.5686275, 0, 1,
-1.293369, 0.2826358, -0.658424, 1, 0.5764706, 0, 1,
-1.29158, 2.032158, -1.853579, 1, 0.5803922, 0, 1,
-1.284347, -1.928647, -2.897923, 1, 0.5882353, 0, 1,
-1.281881, -0.58111, -3.626278, 1, 0.5921569, 0, 1,
-1.280664, 0.7935581, -1.239392, 1, 0.6, 0, 1,
-1.274554, -0.8392007, 0.1742765, 1, 0.6078432, 0, 1,
-1.258781, 0.6810175, -1.620502, 1, 0.6117647, 0, 1,
-1.249066, 0.6654177, -1.154246, 1, 0.6196079, 0, 1,
-1.248268, 1.915125, -1.768299, 1, 0.6235294, 0, 1,
-1.242364, 0.6728891, -1.377269, 1, 0.6313726, 0, 1,
-1.241657, -0.1720955, 0.5784591, 1, 0.6352941, 0, 1,
-1.241605, -1.528689, -1.52379, 1, 0.6431373, 0, 1,
-1.237221, -1.157901, -1.329132, 1, 0.6470588, 0, 1,
-1.235883, 1.069598, -1.212042, 1, 0.654902, 0, 1,
-1.230338, -0.5968442, -2.625931, 1, 0.6588235, 0, 1,
-1.218399, 0.1071028, -1.988312, 1, 0.6666667, 0, 1,
-1.211419, -1.550017, -1.865139, 1, 0.6705883, 0, 1,
-1.210114, -0.07691212, -1.6996, 1, 0.6784314, 0, 1,
-1.196522, -1.44207, -2.67063, 1, 0.682353, 0, 1,
-1.183774, -0.6121256, -1.605122, 1, 0.6901961, 0, 1,
-1.176568, -0.65799, -2.097315, 1, 0.6941177, 0, 1,
-1.17054, -0.717352, -0.05664371, 1, 0.7019608, 0, 1,
-1.170488, 0.2679135, -2.844531, 1, 0.7098039, 0, 1,
-1.165983, -0.6209202, -3.028594, 1, 0.7137255, 0, 1,
-1.16565, 0.5886111, -2.589695, 1, 0.7215686, 0, 1,
-1.163751, 1.236155, -1.216079, 1, 0.7254902, 0, 1,
-1.155195, 0.632358, -1.654586, 1, 0.7333333, 0, 1,
-1.14432, 1.703992, -2.26218, 1, 0.7372549, 0, 1,
-1.143784, 1.52955, -0.05902897, 1, 0.7450981, 0, 1,
-1.131617, 0.382627, -0.366703, 1, 0.7490196, 0, 1,
-1.130334, 1.554816, -0.9700038, 1, 0.7568628, 0, 1,
-1.126199, -0.57051, -0.2780339, 1, 0.7607843, 0, 1,
-1.123465, 0.7246341, -1.448244, 1, 0.7686275, 0, 1,
-1.120386, 0.4910915, 0.09758104, 1, 0.772549, 0, 1,
-1.118059, 1.047666, -2.330319, 1, 0.7803922, 0, 1,
-1.111522, -1.988695, -3.777672, 1, 0.7843137, 0, 1,
-1.101665, -1.188803, -3.212856, 1, 0.7921569, 0, 1,
-1.097228, -0.5311125, -1.998073, 1, 0.7960784, 0, 1,
-1.086589, 0.4421156, -0.2242951, 1, 0.8039216, 0, 1,
-1.082495, -0.616843, -2.313256, 1, 0.8117647, 0, 1,
-1.076756, -1.902707, -2.118583, 1, 0.8156863, 0, 1,
-1.076305, -1.109239, -4.587613, 1, 0.8235294, 0, 1,
-1.07115, 0.03031898, -1.746494, 1, 0.827451, 0, 1,
-1.066227, -0.4546765, -2.793665, 1, 0.8352941, 0, 1,
-1.064805, -0.6119065, -1.876925, 1, 0.8392157, 0, 1,
-1.063375, -1.871596, -4.233534, 1, 0.8470588, 0, 1,
-1.062285, -0.06866297, -2.605226, 1, 0.8509804, 0, 1,
-1.058078, -0.01462601, -0.8363824, 1, 0.8588235, 0, 1,
-1.053892, -0.06768003, -0.004490746, 1, 0.8627451, 0, 1,
-1.053657, -0.2793826, -2.444244, 1, 0.8705882, 0, 1,
-1.04019, 0.2726421, -2.041971, 1, 0.8745098, 0, 1,
-1.035326, 0.04611785, -1.161619, 1, 0.8823529, 0, 1,
-1.027338, -0.2715462, -2.108092, 1, 0.8862745, 0, 1,
-1.025983, -0.7968751, -2.607777, 1, 0.8941177, 0, 1,
-1.016095, -0.7222736, -1.295554, 1, 0.8980392, 0, 1,
-1.012032, -0.01457836, -2.212172, 1, 0.9058824, 0, 1,
-1.006597, 0.2307128, -2.870847, 1, 0.9137255, 0, 1,
-1.006385, -0.3527476, -1.017164, 1, 0.9176471, 0, 1,
-0.9997346, -0.5094296, -2.661947, 1, 0.9254902, 0, 1,
-0.9993228, -2.032687, -2.812486, 1, 0.9294118, 0, 1,
-0.9965481, 0.335348, -1.415139, 1, 0.9372549, 0, 1,
-0.9964128, 1.519258, -1.702129, 1, 0.9411765, 0, 1,
-0.9923772, 0.5663431, -1.161875, 1, 0.9490196, 0, 1,
-0.9885174, 2.799928, -0.02423427, 1, 0.9529412, 0, 1,
-0.963153, -1.760583, -3.987381, 1, 0.9607843, 0, 1,
-0.951786, 1.937882, 1.171203, 1, 0.9647059, 0, 1,
-0.9497668, 0.7340739, -1.303538, 1, 0.972549, 0, 1,
-0.944845, -1.146141, -3.603897, 1, 0.9764706, 0, 1,
-0.94284, 1.259392, 0.01646684, 1, 0.9843137, 0, 1,
-0.9356815, 0.2945117, 0.7530982, 1, 0.9882353, 0, 1,
-0.9330012, -1.031832, -1.917013, 1, 0.9960784, 0, 1,
-0.9269375, 0.6891159, -2.669261, 0.9960784, 1, 0, 1,
-0.9266623, 0.8839297, -1.641678, 0.9921569, 1, 0, 1,
-0.9264361, -0.6284794, -1.160488, 0.9843137, 1, 0, 1,
-0.9193082, 0.7016988, -1.267365, 0.9803922, 1, 0, 1,
-0.9171501, -2.089141, -2.753237, 0.972549, 1, 0, 1,
-0.9148643, -0.1597917, -2.799747, 0.9686275, 1, 0, 1,
-0.9089738, -0.6887318, -3.30753, 0.9607843, 1, 0, 1,
-0.9071749, 0.8683222, -0.0005914926, 0.9568627, 1, 0, 1,
-0.9069283, -1.768053, -4.225482, 0.9490196, 1, 0, 1,
-0.9069069, -1.184339, -2.041193, 0.945098, 1, 0, 1,
-0.9050424, -0.5981613, -2.132952, 0.9372549, 1, 0, 1,
-0.9010897, -0.603752, -2.814487, 0.9333333, 1, 0, 1,
-0.8971037, -0.6282074, -3.376309, 0.9254902, 1, 0, 1,
-0.8962978, -0.09910042, -0.2966972, 0.9215686, 1, 0, 1,
-0.8961472, 0.5048984, -2.564748, 0.9137255, 1, 0, 1,
-0.8953652, -0.4421312, -1.956645, 0.9098039, 1, 0, 1,
-0.8950645, -1.354647, -2.77158, 0.9019608, 1, 0, 1,
-0.8869336, 0.4870881, -0.1351317, 0.8941177, 1, 0, 1,
-0.8832909, -0.7131308, -3.397785, 0.8901961, 1, 0, 1,
-0.8831559, -0.2417557, -1.715906, 0.8823529, 1, 0, 1,
-0.8825547, 0.4541818, -1.732935, 0.8784314, 1, 0, 1,
-0.8825288, 2.693319, -0.3703772, 0.8705882, 1, 0, 1,
-0.8796486, 1.868285, -0.03749789, 0.8666667, 1, 0, 1,
-0.8781834, 0.2929504, -2.026211, 0.8588235, 1, 0, 1,
-0.8754905, -0.5730519, -4.082159, 0.854902, 1, 0, 1,
-0.8735021, 0.3682077, -2.171314, 0.8470588, 1, 0, 1,
-0.8728149, 0.8612326, -0.6832542, 0.8431373, 1, 0, 1,
-0.8673064, 0.8320965, 1.222877, 0.8352941, 1, 0, 1,
-0.8644723, 1.305201, -0.5730327, 0.8313726, 1, 0, 1,
-0.8623456, -0.1417851, -1.40281, 0.8235294, 1, 0, 1,
-0.8563352, 1.664033, -1.742961, 0.8196079, 1, 0, 1,
-0.8562346, -1.129752, -1.06411, 0.8117647, 1, 0, 1,
-0.8557478, -0.123945, -2.234752, 0.8078431, 1, 0, 1,
-0.8517879, -0.6313823, -2.319206, 0.8, 1, 0, 1,
-0.8509131, -1.425009, -2.656583, 0.7921569, 1, 0, 1,
-0.8502383, 0.0354928, 0.6262432, 0.7882353, 1, 0, 1,
-0.8462216, 0.2124569, -1.398139, 0.7803922, 1, 0, 1,
-0.8440679, 0.8548906, -1.388961, 0.7764706, 1, 0, 1,
-0.8411397, -2.151327, -2.782919, 0.7686275, 1, 0, 1,
-0.8402923, 0.3885129, -0.5698432, 0.7647059, 1, 0, 1,
-0.8398157, -0.523706, -2.155675, 0.7568628, 1, 0, 1,
-0.8381554, 0.3702867, -0.776993, 0.7529412, 1, 0, 1,
-0.834277, 2.339271, -0.1555553, 0.7450981, 1, 0, 1,
-0.8244707, -0.5221292, -2.379535, 0.7411765, 1, 0, 1,
-0.8213856, -0.4659926, -2.599106, 0.7333333, 1, 0, 1,
-0.8210484, -0.4987029, -1.720929, 0.7294118, 1, 0, 1,
-0.8189647, 0.03891246, -1.205777, 0.7215686, 1, 0, 1,
-0.8164099, 2.420397, 0.7953731, 0.7176471, 1, 0, 1,
-0.8163162, -2.319893, -4.161935, 0.7098039, 1, 0, 1,
-0.8089825, 0.6842997, -2.079256, 0.7058824, 1, 0, 1,
-0.8079828, 0.137434, -1.549616, 0.6980392, 1, 0, 1,
-0.8066623, 0.6987438, -0.511629, 0.6901961, 1, 0, 1,
-0.8059212, 1.554096, 0.7148928, 0.6862745, 1, 0, 1,
-0.8008195, 0.2123681, -0.754762, 0.6784314, 1, 0, 1,
-0.7949988, -0.303685, -0.7447293, 0.6745098, 1, 0, 1,
-0.7946839, -0.7836224, -2.403186, 0.6666667, 1, 0, 1,
-0.7922727, -0.3611446, -3.133708, 0.6627451, 1, 0, 1,
-0.7899393, 1.228804, 1.456473, 0.654902, 1, 0, 1,
-0.7864098, -1.111517, -0.6835411, 0.6509804, 1, 0, 1,
-0.7808702, 0.1406744, -1.169944, 0.6431373, 1, 0, 1,
-0.7795321, -0.4230397, -3.054799, 0.6392157, 1, 0, 1,
-0.7489437, 0.3046156, -0.1467828, 0.6313726, 1, 0, 1,
-0.7484651, 1.027363, -1.941573, 0.627451, 1, 0, 1,
-0.7483163, 0.3286666, -1.303062, 0.6196079, 1, 0, 1,
-0.7474607, 1.052255, 0.3260951, 0.6156863, 1, 0, 1,
-0.7467074, 0.3393736, -0.5328199, 0.6078432, 1, 0, 1,
-0.7459548, -0.6250279, -3.373378, 0.6039216, 1, 0, 1,
-0.7445774, 1.235121, -0.6992612, 0.5960785, 1, 0, 1,
-0.7404798, -0.3622687, -1.633817, 0.5882353, 1, 0, 1,
-0.7351456, -0.3392487, -2.270686, 0.5843138, 1, 0, 1,
-0.7247469, 1.923358, -0.5674273, 0.5764706, 1, 0, 1,
-0.7233251, -1.420657, -2.795789, 0.572549, 1, 0, 1,
-0.7186982, 0.2351201, -2.703491, 0.5647059, 1, 0, 1,
-0.7178037, 0.6348414, -2.725229, 0.5607843, 1, 0, 1,
-0.7166499, -0.4667535, -2.656575, 0.5529412, 1, 0, 1,
-0.7140011, 0.2017286, -1.9804, 0.5490196, 1, 0, 1,
-0.7119403, 0.2608115, -0.7307292, 0.5411765, 1, 0, 1,
-0.7101402, 0.551798, -0.1654334, 0.5372549, 1, 0, 1,
-0.7058668, 0.2890333, -1.582314, 0.5294118, 1, 0, 1,
-0.7017971, 1.957089, 1.663261, 0.5254902, 1, 0, 1,
-0.6975522, -0.5404895, -1.269419, 0.5176471, 1, 0, 1,
-0.6974056, 0.3666042, -1.707, 0.5137255, 1, 0, 1,
-0.6962772, 0.3077982, 0.2111333, 0.5058824, 1, 0, 1,
-0.6949942, -1.106534, -0.5231699, 0.5019608, 1, 0, 1,
-0.6931997, 0.9051035, -0.401801, 0.4941176, 1, 0, 1,
-0.6901086, 1.21817, -1.123891, 0.4862745, 1, 0, 1,
-0.6899488, 0.6773556, -0.7296068, 0.4823529, 1, 0, 1,
-0.6890202, 0.719327, 0.172148, 0.4745098, 1, 0, 1,
-0.6877793, 1.583166, -0.3436663, 0.4705882, 1, 0, 1,
-0.6832532, -1.015983, -1.993504, 0.4627451, 1, 0, 1,
-0.6765485, 0.4795522, -3.121575, 0.4588235, 1, 0, 1,
-0.6762649, 2.085751, -2.046094, 0.4509804, 1, 0, 1,
-0.6734465, 1.089246, -1.675812, 0.4470588, 1, 0, 1,
-0.6721281, -0.9262539, -0.8690698, 0.4392157, 1, 0, 1,
-0.660392, 0.407759, -0.7478691, 0.4352941, 1, 0, 1,
-0.6593832, -1.026217, -2.748925, 0.427451, 1, 0, 1,
-0.6582884, -1.411192, -1.648691, 0.4235294, 1, 0, 1,
-0.6575951, 0.9552978, -1.170072, 0.4156863, 1, 0, 1,
-0.6541741, 1.718311, -0.8052762, 0.4117647, 1, 0, 1,
-0.6518562, 0.03831515, -1.005646, 0.4039216, 1, 0, 1,
-0.6451197, -0.89288, -2.496962, 0.3960784, 1, 0, 1,
-0.6448449, -0.06736933, -0.7433447, 0.3921569, 1, 0, 1,
-0.6432865, -0.1034736, -1.994645, 0.3843137, 1, 0, 1,
-0.6408494, 0.3172899, -1.912083, 0.3803922, 1, 0, 1,
-0.6402169, 0.5788203, -1.20409, 0.372549, 1, 0, 1,
-0.6392425, 0.9746066, -0.295304, 0.3686275, 1, 0, 1,
-0.6339231, -0.004508619, -1.452688, 0.3607843, 1, 0, 1,
-0.6280143, 1.030849, -1.534549, 0.3568628, 1, 0, 1,
-0.6270374, -1.027264, -1.655382, 0.3490196, 1, 0, 1,
-0.6211288, 0.1894693, -1.976097, 0.345098, 1, 0, 1,
-0.6195151, -1.321854, -3.745703, 0.3372549, 1, 0, 1,
-0.6095611, -0.06324814, -1.468222, 0.3333333, 1, 0, 1,
-0.6093954, 0.224643, -1.888798, 0.3254902, 1, 0, 1,
-0.6080424, 0.08175085, -2.067812, 0.3215686, 1, 0, 1,
-0.6055757, 0.8484577, 1.63069, 0.3137255, 1, 0, 1,
-0.6041874, 0.3715708, -1.802828, 0.3098039, 1, 0, 1,
-0.5962999, 0.7365072, -1.666368, 0.3019608, 1, 0, 1,
-0.5960019, -1.929719, -1.736446, 0.2941177, 1, 0, 1,
-0.5959657, -1.795195, -3.16186, 0.2901961, 1, 0, 1,
-0.5951501, -0.3321866, -2.587121, 0.282353, 1, 0, 1,
-0.5901462, 0.6024079, -1.970504, 0.2784314, 1, 0, 1,
-0.5900697, 0.889001, -2.017838, 0.2705882, 1, 0, 1,
-0.5877715, -1.474637, -3.357546, 0.2666667, 1, 0, 1,
-0.5794353, 0.6082487, -1.449315, 0.2588235, 1, 0, 1,
-0.5762867, -0.2979946, -3.097993, 0.254902, 1, 0, 1,
-0.5757143, -0.333529, 0.2410249, 0.2470588, 1, 0, 1,
-0.5729614, -0.6735961, -2.396496, 0.2431373, 1, 0, 1,
-0.5688858, -0.04351769, -1.960853, 0.2352941, 1, 0, 1,
-0.568531, 0.7882687, 1.602148, 0.2313726, 1, 0, 1,
-0.5668313, 0.05319567, -1.318483, 0.2235294, 1, 0, 1,
-0.565068, -0.6492543, -2.786651, 0.2196078, 1, 0, 1,
-0.564269, -0.5377023, -3.744594, 0.2117647, 1, 0, 1,
-0.5540867, 0.1677049, -1.534022, 0.2078431, 1, 0, 1,
-0.5508841, -0.44252, -2.016917, 0.2, 1, 0, 1,
-0.5493728, 0.4302084, -1.130684, 0.1921569, 1, 0, 1,
-0.546567, -1.453761, -3.314182, 0.1882353, 1, 0, 1,
-0.5456177, -1.124469, -2.077013, 0.1803922, 1, 0, 1,
-0.5438483, 0.2355754, -0.004858631, 0.1764706, 1, 0, 1,
-0.5392036, -1.574582, -4.497572, 0.1686275, 1, 0, 1,
-0.5344524, -0.01415408, -1.55997, 0.1647059, 1, 0, 1,
-0.5297469, -1.414598, -2.536199, 0.1568628, 1, 0, 1,
-0.5261818, 0.438934, 0.3147327, 0.1529412, 1, 0, 1,
-0.5255851, 0.1633877, 0.1815519, 0.145098, 1, 0, 1,
-0.5241861, -0.05689964, -1.310079, 0.1411765, 1, 0, 1,
-0.5240395, -1.000637, -1.774783, 0.1333333, 1, 0, 1,
-0.5228814, -0.6466188, -1.498917, 0.1294118, 1, 0, 1,
-0.5224875, -1.590205, -3.698117, 0.1215686, 1, 0, 1,
-0.5155206, -0.7085935, -3.641011, 0.1176471, 1, 0, 1,
-0.5154309, -0.5658055, -4.380024, 0.1098039, 1, 0, 1,
-0.5148588, 0.04062008, -2.247755, 0.1058824, 1, 0, 1,
-0.5120545, 1.987618, -0.1227402, 0.09803922, 1, 0, 1,
-0.511377, -0.6706958, -4.212422, 0.09019608, 1, 0, 1,
-0.5065795, 0.726204, 0.6503986, 0.08627451, 1, 0, 1,
-0.4957362, -0.06745509, -1.601561, 0.07843138, 1, 0, 1,
-0.4955629, 0.1613591, -0.6132988, 0.07450981, 1, 0, 1,
-0.4921257, 0.7945439, 1.138931, 0.06666667, 1, 0, 1,
-0.4862226, -1.176274, -5.174092, 0.0627451, 1, 0, 1,
-0.4849728, 1.828047, -0.3739235, 0.05490196, 1, 0, 1,
-0.478215, -0.3240853, -0.6655357, 0.05098039, 1, 0, 1,
-0.4770363, -1.398138, -2.315562, 0.04313726, 1, 0, 1,
-0.4729275, -1.707506, -1.798839, 0.03921569, 1, 0, 1,
-0.4686183, 1.571255, -1.0434, 0.03137255, 1, 0, 1,
-0.4652655, -0.9842541, -2.155119, 0.02745098, 1, 0, 1,
-0.4635358, -0.6283709, -2.455198, 0.01960784, 1, 0, 1,
-0.462128, 1.024227, -0.2731536, 0.01568628, 1, 0, 1,
-0.4613565, 0.5753761, 0.6461059, 0.007843138, 1, 0, 1,
-0.4612875, -0.2045869, -0.5209892, 0.003921569, 1, 0, 1,
-0.4610819, -0.4755451, -2.050774, 0, 1, 0.003921569, 1,
-0.4607587, -0.4643941, -1.92054, 0, 1, 0.01176471, 1,
-0.4591372, -1.172554, -3.940527, 0, 1, 0.01568628, 1,
-0.4557187, 0.6175461, -1.443729, 0, 1, 0.02352941, 1,
-0.4488174, 1.556624, 0.4313157, 0, 1, 0.02745098, 1,
-0.4476159, -0.5209785, -1.466819, 0, 1, 0.03529412, 1,
-0.445249, 0.6307402, 0.9230099, 0, 1, 0.03921569, 1,
-0.4430605, 0.2412098, -3.03071, 0, 1, 0.04705882, 1,
-0.4407307, -0.8253171, -2.163576, 0, 1, 0.05098039, 1,
-0.4355316, 0.04902358, -1.406934, 0, 1, 0.05882353, 1,
-0.4331231, -0.6501899, -3.031696, 0, 1, 0.0627451, 1,
-0.4318154, -1.312588, -1.255864, 0, 1, 0.07058824, 1,
-0.4306468, -0.1799996, -2.029864, 0, 1, 0.07450981, 1,
-0.4264692, 0.5158902, -0.5901708, 0, 1, 0.08235294, 1,
-0.4256764, 0.02740405, -2.342599, 0, 1, 0.08627451, 1,
-0.4236279, -1.366903, -1.197603, 0, 1, 0.09411765, 1,
-0.4221492, 0.00123525, -2.003152, 0, 1, 0.1019608, 1,
-0.4186123, 1.734957, 0.5743949, 0, 1, 0.1058824, 1,
-0.4182136, -0.008993603, 0.43307, 0, 1, 0.1137255, 1,
-0.4097821, 0.6731129, -1.330063, 0, 1, 0.1176471, 1,
-0.4059954, 0.3481095, -0.06727099, 0, 1, 0.1254902, 1,
-0.3982984, -0.1521811, -1.95054, 0, 1, 0.1294118, 1,
-0.3962207, 1.887628, 1.699489, 0, 1, 0.1372549, 1,
-0.3960224, -1.475459, -3.384179, 0, 1, 0.1411765, 1,
-0.3867146, -0.6863532, -1.674026, 0, 1, 0.1490196, 1,
-0.3863826, 0.1037704, -1.250701, 0, 1, 0.1529412, 1,
-0.3850136, -0.372882, -2.415322, 0, 1, 0.1607843, 1,
-0.3828848, 1.359037, -0.3009628, 0, 1, 0.1647059, 1,
-0.3797376, -0.07302017, -2.761558, 0, 1, 0.172549, 1,
-0.3777819, -0.7487481, -3.486225, 0, 1, 0.1764706, 1,
-0.3771328, 0.5850749, -1.653037, 0, 1, 0.1843137, 1,
-0.3748842, -0.130637, -1.9878, 0, 1, 0.1882353, 1,
-0.3673746, 0.8915785, -0.3501545, 0, 1, 0.1960784, 1,
-0.364595, -0.2755708, -5.145348, 0, 1, 0.2039216, 1,
-0.3612747, 1.037076, -0.8850819, 0, 1, 0.2078431, 1,
-0.3414221, 2.798436, 1.11342, 0, 1, 0.2156863, 1,
-0.3413078, -1.637592, -3.360466, 0, 1, 0.2196078, 1,
-0.3402099, -0.8072957, -3.418354, 0, 1, 0.227451, 1,
-0.3367467, 2.862852, -0.9668868, 0, 1, 0.2313726, 1,
-0.3358138, -0.7744395, -2.958238, 0, 1, 0.2392157, 1,
-0.3342669, 0.5928757, -1.065811, 0, 1, 0.2431373, 1,
-0.3318346, 0.2668259, -0.4170383, 0, 1, 0.2509804, 1,
-0.3318169, -0.6695985, -2.535457, 0, 1, 0.254902, 1,
-0.3315866, 0.7576479, 0.0971144, 0, 1, 0.2627451, 1,
-0.331003, 0.2117277, -0.7226032, 0, 1, 0.2666667, 1,
-0.327222, 0.1397817, -0.8079612, 0, 1, 0.2745098, 1,
-0.3249654, -0.2661185, -2.797153, 0, 1, 0.2784314, 1,
-0.3245318, 0.06304558, 0.5871015, 0, 1, 0.2862745, 1,
-0.3178416, 0.5206163, 0.0927797, 0, 1, 0.2901961, 1,
-0.3131918, 0.2155957, -1.83467, 0, 1, 0.2980392, 1,
-0.3119996, 1.793106, 0.7687411, 0, 1, 0.3058824, 1,
-0.3115868, 0.02519266, -2.128088, 0, 1, 0.3098039, 1,
-0.3061061, 0.3897432, -1.345114, 0, 1, 0.3176471, 1,
-0.3051718, -0.4922413, -3.041569, 0, 1, 0.3215686, 1,
-0.304646, 0.2673306, -0.06488676, 0, 1, 0.3294118, 1,
-0.3013573, 0.4641873, -0.1632154, 0, 1, 0.3333333, 1,
-0.2997578, 0.4139751, -1.13373, 0, 1, 0.3411765, 1,
-0.2990044, -0.3533982, -0.2083292, 0, 1, 0.345098, 1,
-0.2968702, -0.8234692, -3.412858, 0, 1, 0.3529412, 1,
-0.2968589, 0.5861416, -0.3132874, 0, 1, 0.3568628, 1,
-0.2895485, 0.3087264, 0.2038906, 0, 1, 0.3647059, 1,
-0.288023, -0.893189, -3.033829, 0, 1, 0.3686275, 1,
-0.2877347, -0.1135308, -3.05905, 0, 1, 0.3764706, 1,
-0.2782847, -0.6175243, -4.365694, 0, 1, 0.3803922, 1,
-0.2641169, 0.6698163, -2.687271, 0, 1, 0.3882353, 1,
-0.2613399, 1.478197, -0.1389961, 0, 1, 0.3921569, 1,
-0.2568966, 0.01911195, -2.579043, 0, 1, 0.4, 1,
-0.2536189, 0.7146869, -1.733905, 0, 1, 0.4078431, 1,
-0.2536138, 0.4927293, 0.3879392, 0, 1, 0.4117647, 1,
-0.2529514, -1.405836, -3.731097, 0, 1, 0.4196078, 1,
-0.2515498, -0.1765878, -2.478366, 0, 1, 0.4235294, 1,
-0.2507027, -0.6312293, -5.428025, 0, 1, 0.4313726, 1,
-0.2490382, 0.9432787, -0.5580178, 0, 1, 0.4352941, 1,
-0.2476683, -0.1741671, -2.238062, 0, 1, 0.4431373, 1,
-0.2471756, 1.472308, -0.5422961, 0, 1, 0.4470588, 1,
-0.2453337, 0.5093707, -1.456193, 0, 1, 0.454902, 1,
-0.2451508, 0.6644313, 0.7582276, 0, 1, 0.4588235, 1,
-0.2425165, -0.01832373, -2.412751, 0, 1, 0.4666667, 1,
-0.2416813, 0.03872244, -1.463418, 0, 1, 0.4705882, 1,
-0.2368627, 0.3065538, 0.3735289, 0, 1, 0.4784314, 1,
-0.2367227, 1.715145, -0.01817698, 0, 1, 0.4823529, 1,
-0.2357585, 0.5357648, 0.7708549, 0, 1, 0.4901961, 1,
-0.2344989, 0.9446301, -0.7458428, 0, 1, 0.4941176, 1,
-0.230823, -0.2876792, -2.426965, 0, 1, 0.5019608, 1,
-0.2307823, 1.131934, -1.282986, 0, 1, 0.509804, 1,
-0.2279298, -0.5340088, -1.93988, 0, 1, 0.5137255, 1,
-0.2278738, 0.482287, 0.488136, 0, 1, 0.5215687, 1,
-0.2233994, -0.2881739, -2.442065, 0, 1, 0.5254902, 1,
-0.2216492, -1.537148, -2.923332, 0, 1, 0.5333334, 1,
-0.2182125, 0.435605, -0.3978384, 0, 1, 0.5372549, 1,
-0.217832, 2.084715, -0.2747482, 0, 1, 0.5450981, 1,
-0.2137377, 1.129945, -0.06787919, 0, 1, 0.5490196, 1,
-0.2086097, 0.9418803, 1.345481, 0, 1, 0.5568628, 1,
-0.2077242, 0.8541799, 1.167885, 0, 1, 0.5607843, 1,
-0.2076432, 1.272563, -0.6528475, 0, 1, 0.5686275, 1,
-0.2054487, -1.309909, -3.79444, 0, 1, 0.572549, 1,
-0.2045626, 1.716282, -0.2026504, 0, 1, 0.5803922, 1,
-0.2043047, 1.280237, -0.00680919, 0, 1, 0.5843138, 1,
-0.1985289, 2.125473, -0.0473066, 0, 1, 0.5921569, 1,
-0.1946003, -1.805758, -5.199509, 0, 1, 0.5960785, 1,
-0.1921206, -2.084491, -3.115, 0, 1, 0.6039216, 1,
-0.191925, -0.86802, -3.935803, 0, 1, 0.6117647, 1,
-0.1875878, 0.5817822, -0.9974721, 0, 1, 0.6156863, 1,
-0.1835224, -1.601662, -4.252272, 0, 1, 0.6235294, 1,
-0.1809754, 0.313603, -1.265491, 0, 1, 0.627451, 1,
-0.1802673, 0.3182083, -0.1529843, 0, 1, 0.6352941, 1,
-0.1798347, -0.2986087, -3.050915, 0, 1, 0.6392157, 1,
-0.1778175, 0.246846, 1.618637, 0, 1, 0.6470588, 1,
-0.1756208, -0.2449895, -3.118426, 0, 1, 0.6509804, 1,
-0.1752123, -1.004033, -3.781444, 0, 1, 0.6588235, 1,
-0.1736128, 0.5734097, -0.9151176, 0, 1, 0.6627451, 1,
-0.1724303, -0.9557044, -5.074114, 0, 1, 0.6705883, 1,
-0.1719799, 2.055806, 0.4167609, 0, 1, 0.6745098, 1,
-0.1719626, -0.5264506, -1.645158, 0, 1, 0.682353, 1,
-0.1687389, -1.145989, -2.584867, 0, 1, 0.6862745, 1,
-0.1674228, -1.117058, -4.233823, 0, 1, 0.6941177, 1,
-0.165931, -0.407793, -1.464991, 0, 1, 0.7019608, 1,
-0.1647515, 2.248653, 2.119243, 0, 1, 0.7058824, 1,
-0.1598707, -1.663612, -1.866415, 0, 1, 0.7137255, 1,
-0.1595556, 0.04890252, 0.3666199, 0, 1, 0.7176471, 1,
-0.1543908, 1.113554, -1.133157, 0, 1, 0.7254902, 1,
-0.1533776, -0.8111859, -2.028421, 0, 1, 0.7294118, 1,
-0.1520037, 0.358329, -0.959667, 0, 1, 0.7372549, 1,
-0.1513309, 1.217953, -0.7021388, 0, 1, 0.7411765, 1,
-0.1511182, -1.392813, -4.719001, 0, 1, 0.7490196, 1,
-0.1508185, -0.6187229, -3.072125, 0, 1, 0.7529412, 1,
-0.1480667, 0.7419157, 0.6239881, 0, 1, 0.7607843, 1,
-0.1445457, -0.06641886, -3.122391, 0, 1, 0.7647059, 1,
-0.1430467, -0.7901756, -2.988868, 0, 1, 0.772549, 1,
-0.1425155, -0.3709189, -2.55026, 0, 1, 0.7764706, 1,
-0.1376896, 1.321276, 1.122368, 0, 1, 0.7843137, 1,
-0.1373529, 1.310029, 0.5621181, 0, 1, 0.7882353, 1,
-0.1340549, -0.1056166, -3.574562, 0, 1, 0.7960784, 1,
-0.1323445, -0.05762876, -1.307848, 0, 1, 0.8039216, 1,
-0.1286533, 0.6920121, 0.1556431, 0, 1, 0.8078431, 1,
-0.127006, 0.04879054, -1.681757, 0, 1, 0.8156863, 1,
-0.1258626, 0.4210412, 1.366523, 0, 1, 0.8196079, 1,
-0.1201159, 1.287444, 0.0394525, 0, 1, 0.827451, 1,
-0.1175289, 1.111295, 0.6233008, 0, 1, 0.8313726, 1,
-0.1111694, 1.605735, 1.614359, 0, 1, 0.8392157, 1,
-0.1072888, 0.5675829, -1.203914, 0, 1, 0.8431373, 1,
-0.1037735, 0.4198827, 0.70692, 0, 1, 0.8509804, 1,
-0.09834214, 2.144228, -1.68744, 0, 1, 0.854902, 1,
-0.0976914, -1.219577, -2.260419, 0, 1, 0.8627451, 1,
-0.09634068, 1.434268, -1.806628, 0, 1, 0.8666667, 1,
-0.09119766, 0.9161651, -0.5481842, 0, 1, 0.8745098, 1,
-0.09019614, -0.4958767, -2.125581, 0, 1, 0.8784314, 1,
-0.08985611, -1.463388, -3.343647, 0, 1, 0.8862745, 1,
-0.08979766, -1.495888, -4.941643, 0, 1, 0.8901961, 1,
-0.0868358, 1.428759, 1.473909, 0, 1, 0.8980392, 1,
-0.08560568, -0.6200713, -3.028128, 0, 1, 0.9058824, 1,
-0.08502951, -0.4811378, -3.714993, 0, 1, 0.9098039, 1,
-0.07993782, -0.3273567, -2.393177, 0, 1, 0.9176471, 1,
-0.07819657, -1.238277, -3.155455, 0, 1, 0.9215686, 1,
-0.07566898, 0.381433, 0.4533972, 0, 1, 0.9294118, 1,
-0.07499608, -0.1015578, -4.040083, 0, 1, 0.9333333, 1,
-0.07005731, 0.3480294, 0.3649304, 0, 1, 0.9411765, 1,
-0.06627578, -0.4754937, -5.162946, 0, 1, 0.945098, 1,
-0.066169, 1.005747, 2.167981, 0, 1, 0.9529412, 1,
-0.06553452, -0.9269069, -3.27806, 0, 1, 0.9568627, 1,
-0.06134976, -1.359654, -3.76454, 0, 1, 0.9647059, 1,
-0.05987355, -0.05041012, 0.3676462, 0, 1, 0.9686275, 1,
-0.05717925, 0.8625999, 2.375459, 0, 1, 0.9764706, 1,
-0.0567795, 1.245512, -0.2546553, 0, 1, 0.9803922, 1,
-0.05606866, 1.497468, 1.044146, 0, 1, 0.9882353, 1,
-0.05548659, 0.4064236, -0.7245696, 0, 1, 0.9921569, 1,
-0.05512211, 0.4655265, -1.111578, 0, 1, 1, 1,
-0.05444848, 0.5436188, 0.1587888, 0, 0.9921569, 1, 1,
-0.05344028, 1.209217, -0.0118138, 0, 0.9882353, 1, 1,
-0.05240583, -0.6359929, -4.122788, 0, 0.9803922, 1, 1,
-0.05101766, 1.674865, -0.04261281, 0, 0.9764706, 1, 1,
-0.04870235, 0.1632403, 1.599627, 0, 0.9686275, 1, 1,
-0.044343, 1.205514, -0.6726076, 0, 0.9647059, 1, 1,
-0.04069456, 0.3314829, 0.7865089, 0, 0.9568627, 1, 1,
-0.03815203, -0.2396287, -4.734854, 0, 0.9529412, 1, 1,
-0.03727926, 0.7394044, -3.073914, 0, 0.945098, 1, 1,
-0.03722739, 1.321871, 0.5821838, 0, 0.9411765, 1, 1,
-0.03377942, -1.043199, -4.222857, 0, 0.9333333, 1, 1,
-0.03371216, -0.6107898, -4.440459, 0, 0.9294118, 1, 1,
-0.02906457, 0.4562407, -2.774384, 0, 0.9215686, 1, 1,
-0.02522666, 1.23263, 1.79473, 0, 0.9176471, 1, 1,
-0.01593475, -0.8507356, -3.221683, 0, 0.9098039, 1, 1,
-0.009959064, -0.7709669, -4.268352, 0, 0.9058824, 1, 1,
-0.004917898, 1.525069, -2.281404, 0, 0.8980392, 1, 1,
0.002551347, 1.752681, -0.3035099, 0, 0.8901961, 1, 1,
0.004208747, 1.976933, 0.1791783, 0, 0.8862745, 1, 1,
0.004369741, 1.572757, -1.30849, 0, 0.8784314, 1, 1,
0.007043197, -0.7885719, 3.283823, 0, 0.8745098, 1, 1,
0.0071639, 0.8912415, -0.9434439, 0, 0.8666667, 1, 1,
0.01015121, -1.309558, 1.975304, 0, 0.8627451, 1, 1,
0.01297232, 1.033926, 0.812277, 0, 0.854902, 1, 1,
0.01329899, -0.05840093, 1.218877, 0, 0.8509804, 1, 1,
0.01346478, 0.1766701, 0.4806075, 0, 0.8431373, 1, 1,
0.01360389, 1.410762, 0.5229601, 0, 0.8392157, 1, 1,
0.01583187, -0.5154756, 5.466024, 0, 0.8313726, 1, 1,
0.01625495, 2.631964, 0.6962308, 0, 0.827451, 1, 1,
0.01632317, -0.6129482, 3.627702, 0, 0.8196079, 1, 1,
0.02001068, 1.554205, 1.008168, 0, 0.8156863, 1, 1,
0.02247431, 0.1630029, -0.9083668, 0, 0.8078431, 1, 1,
0.02477254, 2.185873, -1.459602, 0, 0.8039216, 1, 1,
0.03148383, 1.395126, 0.2386323, 0, 0.7960784, 1, 1,
0.03457972, 0.832583, 2.278345, 0, 0.7882353, 1, 1,
0.03837645, 0.02604544, -1.152709, 0, 0.7843137, 1, 1,
0.04139742, -1.313891, 1.487825, 0, 0.7764706, 1, 1,
0.04150243, 0.03554521, -0.3608474, 0, 0.772549, 1, 1,
0.04273593, -1.428033, 3.669113, 0, 0.7647059, 1, 1,
0.05162392, 0.112519, -1.833631, 0, 0.7607843, 1, 1,
0.06007514, 0.3701874, 0.3412108, 0, 0.7529412, 1, 1,
0.06221589, -1.012353, 1.310672, 0, 0.7490196, 1, 1,
0.06341817, 0.4685284, 1.288676, 0, 0.7411765, 1, 1,
0.06353345, 2.171645, -0.517499, 0, 0.7372549, 1, 1,
0.06367632, -0.3522707, 2.462415, 0, 0.7294118, 1, 1,
0.06543675, 0.3909048, 0.7199178, 0, 0.7254902, 1, 1,
0.0673787, -0.9781155, 3.404231, 0, 0.7176471, 1, 1,
0.0688336, -0.1225786, 1.177387, 0, 0.7137255, 1, 1,
0.07128035, 0.2486612, 0.1535524, 0, 0.7058824, 1, 1,
0.07386427, -0.1680004, 3.437727, 0, 0.6980392, 1, 1,
0.07596602, 0.9175785, -1.051972, 0, 0.6941177, 1, 1,
0.07807591, -0.2505693, 2.516682, 0, 0.6862745, 1, 1,
0.08348858, -0.1026706, 2.022698, 0, 0.682353, 1, 1,
0.084327, -0.4368673, 2.508011, 0, 0.6745098, 1, 1,
0.08603158, 1.072848, 0.5480381, 0, 0.6705883, 1, 1,
0.08712975, 0.6567641, 0.04195442, 0, 0.6627451, 1, 1,
0.08974233, 0.6891375, -1.772492, 0, 0.6588235, 1, 1,
0.09067225, -0.2061736, 1.460536, 0, 0.6509804, 1, 1,
0.102033, -0.3526464, 2.426674, 0, 0.6470588, 1, 1,
0.103626, 0.5687958, 1.465507, 0, 0.6392157, 1, 1,
0.1074151, -0.04463581, 0.6744299, 0, 0.6352941, 1, 1,
0.1162442, -0.9699115, 4.085598, 0, 0.627451, 1, 1,
0.1194198, 1.334023, 0.4152473, 0, 0.6235294, 1, 1,
0.1208335, -2.053614, 2.396719, 0, 0.6156863, 1, 1,
0.1245362, -0.8531953, 3.701994, 0, 0.6117647, 1, 1,
0.1273373, -0.210724, 3.088024, 0, 0.6039216, 1, 1,
0.1276318, 0.3172543, 1.318174, 0, 0.5960785, 1, 1,
0.1280075, -0.3560322, 2.652385, 0, 0.5921569, 1, 1,
0.130321, -0.1901332, 3.172109, 0, 0.5843138, 1, 1,
0.1374625, 1.118196, 0.106753, 0, 0.5803922, 1, 1,
0.1377596, -2.467811, 2.335749, 0, 0.572549, 1, 1,
0.139728, 1.153186, 1.21063, 0, 0.5686275, 1, 1,
0.1429885, -0.3989618, 2.737798, 0, 0.5607843, 1, 1,
0.1452526, 1.668685, -0.04827305, 0, 0.5568628, 1, 1,
0.154862, 0.8438021, 1.581223, 0, 0.5490196, 1, 1,
0.1568673, 0.06027998, 0.6485891, 0, 0.5450981, 1, 1,
0.1571111, 0.8100935, -1.287391, 0, 0.5372549, 1, 1,
0.1583139, 0.4520089, -2.018434, 0, 0.5333334, 1, 1,
0.1606308, -0.6000472, 1.278127, 0, 0.5254902, 1, 1,
0.1628566, 1.215999, 1.037379, 0, 0.5215687, 1, 1,
0.1635092, -1.223483, 2.235209, 0, 0.5137255, 1, 1,
0.1697269, -0.8168175, 2.512212, 0, 0.509804, 1, 1,
0.1709816, -0.0009631161, 2.116309, 0, 0.5019608, 1, 1,
0.1771207, 1.153402, -0.9335861, 0, 0.4941176, 1, 1,
0.18272, -0.3009598, 2.020359, 0, 0.4901961, 1, 1,
0.1875584, -0.2462281, 0.8657133, 0, 0.4823529, 1, 1,
0.1900384, -1.089231, 2.897312, 0, 0.4784314, 1, 1,
0.1916204, -0.6022887, 3.203562, 0, 0.4705882, 1, 1,
0.1917201, 0.3120573, 2.90242, 0, 0.4666667, 1, 1,
0.1920296, -0.09696552, 2.650689, 0, 0.4588235, 1, 1,
0.1920723, -1.264398, 2.472705, 0, 0.454902, 1, 1,
0.1956774, 0.7588992, 1.337097, 0, 0.4470588, 1, 1,
0.1978825, 0.1721512, 1.039619, 0, 0.4431373, 1, 1,
0.1989687, -0.2773476, 3.339663, 0, 0.4352941, 1, 1,
0.2052951, 0.2535685, 2.204887, 0, 0.4313726, 1, 1,
0.2069369, 1.505376, 0.08455738, 0, 0.4235294, 1, 1,
0.2096972, 0.2582633, 1.50218, 0, 0.4196078, 1, 1,
0.211443, -0.2681421, 1.547702, 0, 0.4117647, 1, 1,
0.2163, -0.8183481, 2.810344, 0, 0.4078431, 1, 1,
0.2259616, 0.965674, -0.576331, 0, 0.4, 1, 1,
0.2275698, -0.06511002, 1.858727, 0, 0.3921569, 1, 1,
0.2346429, 0.6708619, 0.6852964, 0, 0.3882353, 1, 1,
0.2357954, 0.7374769, -1.404773, 0, 0.3803922, 1, 1,
0.241953, -0.9830875, 3.563864, 0, 0.3764706, 1, 1,
0.2419633, 0.824012, -1.165957, 0, 0.3686275, 1, 1,
0.2528068, 1.382145, 0.3562641, 0, 0.3647059, 1, 1,
0.2563335, -0.5775697, 3.012345, 0, 0.3568628, 1, 1,
0.2566477, -0.8007533, 4.180806, 0, 0.3529412, 1, 1,
0.2591481, 1.334734, -0.7026369, 0, 0.345098, 1, 1,
0.2610069, 0.1897842, 1.784627, 0, 0.3411765, 1, 1,
0.2690907, -0.4195461, 0.8782824, 0, 0.3333333, 1, 1,
0.2697691, -1.078001, 3.889005, 0, 0.3294118, 1, 1,
0.2721818, -0.1320027, 1.660318, 0, 0.3215686, 1, 1,
0.2744704, -1.180586, 2.578503, 0, 0.3176471, 1, 1,
0.2765454, 1.348711, 1.616682, 0, 0.3098039, 1, 1,
0.2797636, -1.702991, 2.845698, 0, 0.3058824, 1, 1,
0.2805451, -0.2234404, 0.8915934, 0, 0.2980392, 1, 1,
0.281444, -0.6244108, 2.272902, 0, 0.2901961, 1, 1,
0.2870823, 0.6896343, 0.6387131, 0, 0.2862745, 1, 1,
0.2887098, -0.02921151, 0.6877781, 0, 0.2784314, 1, 1,
0.289001, -0.3408163, 2.67183, 0, 0.2745098, 1, 1,
0.2919662, -0.5755559, 4.364468, 0, 0.2666667, 1, 1,
0.2928063, -1.057819, 3.293071, 0, 0.2627451, 1, 1,
0.2980947, -0.9500118, 1.591501, 0, 0.254902, 1, 1,
0.3011717, 0.1401017, 1.248994, 0, 0.2509804, 1, 1,
0.3037973, 1.324993, 1.285222, 0, 0.2431373, 1, 1,
0.305351, -1.992221, 2.328389, 0, 0.2392157, 1, 1,
0.3068711, 0.3724982, 0.00647855, 0, 0.2313726, 1, 1,
0.3112863, -0.06138551, 1.74543, 0, 0.227451, 1, 1,
0.3159506, -1.206046, 2.236572, 0, 0.2196078, 1, 1,
0.3216186, -0.5878896, 3.263048, 0, 0.2156863, 1, 1,
0.3321464, -0.1010608, 1.19966, 0, 0.2078431, 1, 1,
0.3331265, -1.014951, 2.335772, 0, 0.2039216, 1, 1,
0.3331526, -0.7068188, 4.231032, 0, 0.1960784, 1, 1,
0.3352282, -1.580963, 2.57161, 0, 0.1882353, 1, 1,
0.3389642, 0.09262897, 2.642985, 0, 0.1843137, 1, 1,
0.3390864, -0.7213792, 3.534378, 0, 0.1764706, 1, 1,
0.3427829, -0.7992108, 4.49837, 0, 0.172549, 1, 1,
0.3465391, -1.785242, 2.313968, 0, 0.1647059, 1, 1,
0.3486631, 1.254885, 1.772797, 0, 0.1607843, 1, 1,
0.350559, 1.022818, -0.1817298, 0, 0.1529412, 1, 1,
0.3534773, -0.1856392, 2.240374, 0, 0.1490196, 1, 1,
0.3581935, 1.280629, 0.3490563, 0, 0.1411765, 1, 1,
0.3644416, 0.03364552, 1.368893, 0, 0.1372549, 1, 1,
0.3653208, -1.223859, 3.415674, 0, 0.1294118, 1, 1,
0.3658476, -0.7623613, 3.107354, 0, 0.1254902, 1, 1,
0.3683442, -1.018309, 2.201317, 0, 0.1176471, 1, 1,
0.3692683, -0.4142085, 1.718772, 0, 0.1137255, 1, 1,
0.3711234, -1.224224, 3.72473, 0, 0.1058824, 1, 1,
0.3777688, -0.9555106, 1.870307, 0, 0.09803922, 1, 1,
0.3787781, -0.6717847, 2.250147, 0, 0.09411765, 1, 1,
0.3840929, 1.872293, 1.274331, 0, 0.08627451, 1, 1,
0.3871293, -0.7365671, 2.354064, 0, 0.08235294, 1, 1,
0.3887109, 0.04773428, 1.256078, 0, 0.07450981, 1, 1,
0.3899594, 1.608451, 0.1880098, 0, 0.07058824, 1, 1,
0.3908774, -0.855738, 3.625694, 0, 0.0627451, 1, 1,
0.394879, 0.7397489, 0.1854502, 0, 0.05882353, 1, 1,
0.4042954, -1.052222, 2.813042, 0, 0.05098039, 1, 1,
0.40479, 0.7333924, 0.7445982, 0, 0.04705882, 1, 1,
0.4074609, -0.6366261, 1.940561, 0, 0.03921569, 1, 1,
0.4106223, 0.1850442, -0.5147238, 0, 0.03529412, 1, 1,
0.4122467, -0.1124398, 2.68442, 0, 0.02745098, 1, 1,
0.413399, -0.9417785, 3.778961, 0, 0.02352941, 1, 1,
0.416934, -0.09773, -1.105521, 0, 0.01568628, 1, 1,
0.4214328, 0.9868965, 0.5066289, 0, 0.01176471, 1, 1,
0.4273564, 0.6688007, 1.689039, 0, 0.003921569, 1, 1,
0.4277835, -0.5680503, 2.931799, 0.003921569, 0, 1, 1,
0.4320216, -3.32766, 1.573344, 0.007843138, 0, 1, 1,
0.4336853, -0.5132375, 0.959471, 0.01568628, 0, 1, 1,
0.4377742, -1.039083, 2.546348, 0.01960784, 0, 1, 1,
0.439981, 0.949218, 1.69686, 0.02745098, 0, 1, 1,
0.4417169, 0.585229, 1.295855, 0.03137255, 0, 1, 1,
0.4431464, 1.359268, -0.7849773, 0.03921569, 0, 1, 1,
0.4458511, -0.107108, 2.375052, 0.04313726, 0, 1, 1,
0.4462169, 1.218103, -1.071005, 0.05098039, 0, 1, 1,
0.4502231, 0.2557468, 2.288696, 0.05490196, 0, 1, 1,
0.453996, -0.5707858, 1.106835, 0.0627451, 0, 1, 1,
0.4545506, -0.6343148, 3.894514, 0.06666667, 0, 1, 1,
0.4564371, -0.2653035, 2.144493, 0.07450981, 0, 1, 1,
0.4680174, -0.6289972, 0.4636949, 0.07843138, 0, 1, 1,
0.4715625, 0.4936205, -0.506819, 0.08627451, 0, 1, 1,
0.4781682, 0.5000849, 1.528253, 0.09019608, 0, 1, 1,
0.4787711, 0.9802773, 1.555676, 0.09803922, 0, 1, 1,
0.4812644, 2.347944, 0.3386251, 0.1058824, 0, 1, 1,
0.4872254, -1.227045, 2.025643, 0.1098039, 0, 1, 1,
0.4892201, -1.087237, 4.043997, 0.1176471, 0, 1, 1,
0.4898462, 1.816167, -1.089591, 0.1215686, 0, 1, 1,
0.4942845, 0.7827995, -1.847893, 0.1294118, 0, 1, 1,
0.4944516, 0.2431191, -0.3840705, 0.1333333, 0, 1, 1,
0.4951091, -0.9045366, 3.954166, 0.1411765, 0, 1, 1,
0.4954478, -1.046212, 3.689209, 0.145098, 0, 1, 1,
0.4981687, 1.09583, 0.4314752, 0.1529412, 0, 1, 1,
0.4991844, 1.355977, 1.647514, 0.1568628, 0, 1, 1,
0.5009032, -0.8374493, 1.818116, 0.1647059, 0, 1, 1,
0.5010137, 1.156336, 0.04734235, 0.1686275, 0, 1, 1,
0.5032991, -1.300382, 1.679431, 0.1764706, 0, 1, 1,
0.5037313, -0.001008878, 1.200092, 0.1803922, 0, 1, 1,
0.5095896, 1.208367, 1.888165, 0.1882353, 0, 1, 1,
0.5100557, -0.1737442, 2.058301, 0.1921569, 0, 1, 1,
0.5118374, -0.4875665, 4.348707, 0.2, 0, 1, 1,
0.5161738, -0.3037463, 1.09646, 0.2078431, 0, 1, 1,
0.5206485, 1.296034, 0.2860364, 0.2117647, 0, 1, 1,
0.5220788, -0.3219083, 2.911756, 0.2196078, 0, 1, 1,
0.5222186, -0.07005762, 1.89372, 0.2235294, 0, 1, 1,
0.5227214, 0.245352, -0.8196486, 0.2313726, 0, 1, 1,
0.5256441, 2.302526, 0.4627014, 0.2352941, 0, 1, 1,
0.5279882, -1.995913, 3.997061, 0.2431373, 0, 1, 1,
0.5283163, -0.8543919, 2.465614, 0.2470588, 0, 1, 1,
0.5286546, -0.7303555, 2.760912, 0.254902, 0, 1, 1,
0.5300322, 0.7182238, 2.442019, 0.2588235, 0, 1, 1,
0.5332175, -0.09430867, 4.124346, 0.2666667, 0, 1, 1,
0.5335311, 0.858778, -0.1676436, 0.2705882, 0, 1, 1,
0.5348503, 0.6627001, 1.521225, 0.2784314, 0, 1, 1,
0.5349658, -2.026487, 3.648454, 0.282353, 0, 1, 1,
0.5390061, 1.308923, 1.529089, 0.2901961, 0, 1, 1,
0.5440983, 0.6260076, 1.569433, 0.2941177, 0, 1, 1,
0.5463727, 0.4708947, -0.463234, 0.3019608, 0, 1, 1,
0.5477046, -0.9215596, 1.335769, 0.3098039, 0, 1, 1,
0.5478873, 0.8748264, 3.802136, 0.3137255, 0, 1, 1,
0.5520419, -0.1518333, 0.1737283, 0.3215686, 0, 1, 1,
0.5554634, 2.060244, -1.059941, 0.3254902, 0, 1, 1,
0.5571196, 0.09300611, 2.060227, 0.3333333, 0, 1, 1,
0.5572096, 0.3416522, 0.6052951, 0.3372549, 0, 1, 1,
0.5621003, 0.3575759, 0.339113, 0.345098, 0, 1, 1,
0.5628758, 0.4745064, 0.9308892, 0.3490196, 0, 1, 1,
0.5727661, -1.390207, 1.249955, 0.3568628, 0, 1, 1,
0.5770174, -0.7151032, 2.643348, 0.3607843, 0, 1, 1,
0.5813951, 0.8294082, 1.640319, 0.3686275, 0, 1, 1,
0.5827865, -0.9204825, 3.729804, 0.372549, 0, 1, 1,
0.5841751, 0.7607734, 0.5277218, 0.3803922, 0, 1, 1,
0.586912, -1.093557, 3.193458, 0.3843137, 0, 1, 1,
0.5871326, -1.640902, 2.894676, 0.3921569, 0, 1, 1,
0.5914759, 0.1011244, 2.843047, 0.3960784, 0, 1, 1,
0.5920264, 1.072039, -0.8122923, 0.4039216, 0, 1, 1,
0.5937492, -1.21708, 4.188054, 0.4117647, 0, 1, 1,
0.5999115, 0.4928542, 0.6017588, 0.4156863, 0, 1, 1,
0.5999858, 0.7274685, 2.155297, 0.4235294, 0, 1, 1,
0.6004107, 0.8642726, -0.2145101, 0.427451, 0, 1, 1,
0.6153505, 0.5422388, 1.439018, 0.4352941, 0, 1, 1,
0.6162351, 0.7620859, 1.297094, 0.4392157, 0, 1, 1,
0.6192145, -0.7123619, 2.677201, 0.4470588, 0, 1, 1,
0.6246063, -0.1677723, 2.041486, 0.4509804, 0, 1, 1,
0.6334049, 0.0938635, 2.159271, 0.4588235, 0, 1, 1,
0.6343622, -0.3982513, 1.009955, 0.4627451, 0, 1, 1,
0.6347556, 0.3099729, -0.9118727, 0.4705882, 0, 1, 1,
0.6367365, 0.1915702, 1.943009, 0.4745098, 0, 1, 1,
0.6368477, -0.1503575, 1.833838, 0.4823529, 0, 1, 1,
0.6394864, -1.50959, 3.108862, 0.4862745, 0, 1, 1,
0.6400493, 0.08145474, 1.098153, 0.4941176, 0, 1, 1,
0.6437068, 0.1287057, 0.6932942, 0.5019608, 0, 1, 1,
0.6456161, -1.248376, 4.608826, 0.5058824, 0, 1, 1,
0.6468401, 1.437291, 1.816654, 0.5137255, 0, 1, 1,
0.6479312, -0.02271902, 4.407854, 0.5176471, 0, 1, 1,
0.6527993, 0.8350712, 0.623961, 0.5254902, 0, 1, 1,
0.663466, 0.4947972, -1.272938, 0.5294118, 0, 1, 1,
0.6636384, 0.2256724, 3.017829, 0.5372549, 0, 1, 1,
0.6781741, 0.9227534, 0.5162024, 0.5411765, 0, 1, 1,
0.6785505, 0.8800205, 1.577747, 0.5490196, 0, 1, 1,
0.6798518, 1.214096, 1.165089, 0.5529412, 0, 1, 1,
0.6835164, -0.610679, 4.016315, 0.5607843, 0, 1, 1,
0.6870022, -0.950179, 1.5792, 0.5647059, 0, 1, 1,
0.7029467, 1.240079, -1.175698, 0.572549, 0, 1, 1,
0.704892, -0.2695985, 1.028299, 0.5764706, 0, 1, 1,
0.7069469, -0.9600529, 1.697872, 0.5843138, 0, 1, 1,
0.7147123, 2.133952, 0.816136, 0.5882353, 0, 1, 1,
0.7169644, -0.5667397, 1.682287, 0.5960785, 0, 1, 1,
0.7237265, -0.6990588, 0.2309326, 0.6039216, 0, 1, 1,
0.7237505, -2.511123, 3.263515, 0.6078432, 0, 1, 1,
0.7285474, 0.7819773, 1.232596, 0.6156863, 0, 1, 1,
0.7289937, -1.573568, 3.474996, 0.6196079, 0, 1, 1,
0.7334666, 1.444743, -0.04519243, 0.627451, 0, 1, 1,
0.7338936, 0.07931804, 2.078124, 0.6313726, 0, 1, 1,
0.7397442, 0.9774557, 0.1861465, 0.6392157, 0, 1, 1,
0.7446726, -0.5344965, 0.6934556, 0.6431373, 0, 1, 1,
0.7459073, -0.07623103, 1.76867, 0.6509804, 0, 1, 1,
0.7629561, 1.545564, -0.0156254, 0.654902, 0, 1, 1,
0.7636285, -0.7101352, 0.648003, 0.6627451, 0, 1, 1,
0.7637321, -0.4560651, 3.622089, 0.6666667, 0, 1, 1,
0.7689101, 1.908412, 1.991662, 0.6745098, 0, 1, 1,
0.7781157, 0.1134475, 1.333222, 0.6784314, 0, 1, 1,
0.7846314, -0.7437243, 2.365373, 0.6862745, 0, 1, 1,
0.7878889, 0.2474677, 0.7888772, 0.6901961, 0, 1, 1,
0.792031, 1.801054, -0.1896462, 0.6980392, 0, 1, 1,
0.7937605, 0.2515981, 2.611229, 0.7058824, 0, 1, 1,
0.794922, 1.15543, 1.539335, 0.7098039, 0, 1, 1,
0.8025463, 1.870616, 0.6048262, 0.7176471, 0, 1, 1,
0.806094, 0.4369661, 0.6977559, 0.7215686, 0, 1, 1,
0.8088608, -0.8637384, 0.9935948, 0.7294118, 0, 1, 1,
0.8145999, -0.4651279, 3.483696, 0.7333333, 0, 1, 1,
0.81614, -0.2591742, 2.488351, 0.7411765, 0, 1, 1,
0.8162432, 0.7384143, 0.623989, 0.7450981, 0, 1, 1,
0.8181493, 1.803277, 1.085528, 0.7529412, 0, 1, 1,
0.8187215, 0.0972157, 2.039078, 0.7568628, 0, 1, 1,
0.8204286, 0.2569419, -1.909217, 0.7647059, 0, 1, 1,
0.8239041, -0.3014606, 2.423323, 0.7686275, 0, 1, 1,
0.8253349, -1.679568, 3.082633, 0.7764706, 0, 1, 1,
0.8262022, -0.2368847, 2.777409, 0.7803922, 0, 1, 1,
0.8270848, -1.095834, 2.127385, 0.7882353, 0, 1, 1,
0.8271434, -0.0712278, 0.393222, 0.7921569, 0, 1, 1,
0.8284444, -0.7242553, 4.130816, 0.8, 0, 1, 1,
0.8297013, -0.2377145, 2.066847, 0.8078431, 0, 1, 1,
0.8312654, -1.28705, 1.955559, 0.8117647, 0, 1, 1,
0.8347898, -0.2461524, 1.991851, 0.8196079, 0, 1, 1,
0.834977, -0.9416457, 2.8132, 0.8235294, 0, 1, 1,
0.8400546, 0.1035692, 2.730673, 0.8313726, 0, 1, 1,
0.8402454, 0.7744163, 1.463395, 0.8352941, 0, 1, 1,
0.8447378, -0.05408233, 0.03792103, 0.8431373, 0, 1, 1,
0.8448913, -0.3450907, 0.6221835, 0.8470588, 0, 1, 1,
0.8486029, 0.03724007, 2.017365, 0.854902, 0, 1, 1,
0.8486257, -1.701414, 2.042294, 0.8588235, 0, 1, 1,
0.8529254, -0.4358497, 0.5463715, 0.8666667, 0, 1, 1,
0.8538749, -0.5154787, 2.588824, 0.8705882, 0, 1, 1,
0.8539837, 0.3613905, -0.3957881, 0.8784314, 0, 1, 1,
0.8540909, 0.04253177, 0.8117646, 0.8823529, 0, 1, 1,
0.8567786, 0.06691019, 0.3774331, 0.8901961, 0, 1, 1,
0.8709074, 0.4599223, 1.816118, 0.8941177, 0, 1, 1,
0.8722571, -0.1879193, 0.4768973, 0.9019608, 0, 1, 1,
0.872454, 0.7075962, 1.119066, 0.9098039, 0, 1, 1,
0.8730101, -0.9440199, 2.835982, 0.9137255, 0, 1, 1,
0.8759168, 1.156144, 1.710341, 0.9215686, 0, 1, 1,
0.8788061, -0.3287115, 3.088797, 0.9254902, 0, 1, 1,
0.879483, -0.4969753, 2.118613, 0.9333333, 0, 1, 1,
0.881431, -1.006342, 2.519963, 0.9372549, 0, 1, 1,
0.8879231, 1.275509, 0.02351274, 0.945098, 0, 1, 1,
0.889203, -1.561278, 3.20592, 0.9490196, 0, 1, 1,
0.8902546, -1.383558, -0.3205081, 0.9568627, 0, 1, 1,
0.890523, -1.518434, 1.799828, 0.9607843, 0, 1, 1,
0.8910511, -0.2139348, 0.9904463, 0.9686275, 0, 1, 1,
0.9033701, 1.176592, 1.149998, 0.972549, 0, 1, 1,
0.9119377, 1.172293, 1.132686, 0.9803922, 0, 1, 1,
0.9133693, 3.071293, 0.1633104, 0.9843137, 0, 1, 1,
0.9142342, 0.3217191, 1.197635, 0.9921569, 0, 1, 1,
0.9195322, -2.106736, 5.266316, 0.9960784, 0, 1, 1,
0.9197959, -0.7495093, 2.460125, 1, 0, 0.9960784, 1,
0.9290392, -0.9901552, 1.093434, 1, 0, 0.9882353, 1,
0.9298871, -1.836335, 3.568694, 1, 0, 0.9843137, 1,
0.9307144, 0.6973515, 2.553323, 1, 0, 0.9764706, 1,
0.9338691, 0.5860207, 1.811589, 1, 0, 0.972549, 1,
0.9343008, -0.8122694, 4.474413, 1, 0, 0.9647059, 1,
0.9377357, 0.2644899, 1.525228, 1, 0, 0.9607843, 1,
0.9382788, -0.5850976, 2.38379, 1, 0, 0.9529412, 1,
0.9394437, 0.9862621, -0.5027632, 1, 0, 0.9490196, 1,
0.9402128, -1.365989, 1.242635, 1, 0, 0.9411765, 1,
0.9418398, -2.169861, 2.869291, 1, 0, 0.9372549, 1,
0.9429061, 0.2678811, 1.354272, 1, 0, 0.9294118, 1,
0.9511636, 2.168729, 1.076311, 1, 0, 0.9254902, 1,
0.9634346, -1.993389, 2.05579, 1, 0, 0.9176471, 1,
0.9656869, -0.7660109, 2.41679, 1, 0, 0.9137255, 1,
0.9668492, -1.144365, 1.022812, 1, 0, 0.9058824, 1,
0.9671808, -1.189719, 1.882447, 1, 0, 0.9019608, 1,
0.9683912, 1.275229, 0.4435635, 1, 0, 0.8941177, 1,
0.9791412, -1.134143, 2.482383, 1, 0, 0.8862745, 1,
0.9798239, 2.247451, 1.359718, 1, 0, 0.8823529, 1,
0.980083, -0.2011019, 1.063017, 1, 0, 0.8745098, 1,
0.9858262, 0.844636, -0.224016, 1, 0, 0.8705882, 1,
0.9877332, 1.385038, 1.47448, 1, 0, 0.8627451, 1,
0.990567, 0.38272, 1.571637, 1, 0, 0.8588235, 1,
0.9938058, -1.515402, 1.704821, 1, 0, 0.8509804, 1,
0.9945, 2.0757, 1.243355, 1, 0, 0.8470588, 1,
0.9966589, 0.6049492, 0.7513385, 1, 0, 0.8392157, 1,
0.9994391, 0.3770864, -0.5154489, 1, 0, 0.8352941, 1,
1.001026, 0.09904768, 1.989728, 1, 0, 0.827451, 1,
1.001559, -0.1692498, 2.695929, 1, 0, 0.8235294, 1,
1.010472, -0.4907502, 1.84686, 1, 0, 0.8156863, 1,
1.012674, 1.289995, 1.700575, 1, 0, 0.8117647, 1,
1.015564, -0.4184747, 2.414018, 1, 0, 0.8039216, 1,
1.018401, 1.722312, -1.860613, 1, 0, 0.7960784, 1,
1.02044, -1.334042, 0.9353193, 1, 0, 0.7921569, 1,
1.022528, -0.01146435, 0.5829981, 1, 0, 0.7843137, 1,
1.025152, -1.18879, 2.941595, 1, 0, 0.7803922, 1,
1.03522, -0.3896941, 2.092066, 1, 0, 0.772549, 1,
1.046009, 0.2132325, 1.434708, 1, 0, 0.7686275, 1,
1.049593, 1.748562, 0.554437, 1, 0, 0.7607843, 1,
1.056109, 1.477795, -1.688085, 1, 0, 0.7568628, 1,
1.067486, -0.5970017, 1.641593, 1, 0, 0.7490196, 1,
1.084204, -0.6516714, 1.566947, 1, 0, 0.7450981, 1,
1.089665, 0.232169, 2.962284, 1, 0, 0.7372549, 1,
1.091803, -0.226266, -0.1256333, 1, 0, 0.7333333, 1,
1.097709, -1.184692, 0.7966946, 1, 0, 0.7254902, 1,
1.110578, 0.9355955, 1.90149, 1, 0, 0.7215686, 1,
1.11127, -0.9360581, 2.742577, 1, 0, 0.7137255, 1,
1.111875, 0.2612914, 2.378065, 1, 0, 0.7098039, 1,
1.123034, 0.0482988, 0.7867375, 1, 0, 0.7019608, 1,
1.130317, -0.3433152, 2.765101, 1, 0, 0.6941177, 1,
1.139687, -1.123932, 2.270674, 1, 0, 0.6901961, 1,
1.1559, 0.2935495, 1.49538, 1, 0, 0.682353, 1,
1.164343, -1.39248, 1.981655, 1, 0, 0.6784314, 1,
1.165581, 1.964067, 0.5362028, 1, 0, 0.6705883, 1,
1.166167, 0.4151793, 2.219955, 1, 0, 0.6666667, 1,
1.16717, 1.292186, -1.005303, 1, 0, 0.6588235, 1,
1.180884, -0.3007602, 3.269284, 1, 0, 0.654902, 1,
1.180953, -0.01969472, 2.105945, 1, 0, 0.6470588, 1,
1.182419, 0.1654421, 0.8936506, 1, 0, 0.6431373, 1,
1.185112, 0.4792148, -0.4092675, 1, 0, 0.6352941, 1,
1.191204, 0.6895576, 0.242562, 1, 0, 0.6313726, 1,
1.204818, 0.1700203, 3.319335, 1, 0, 0.6235294, 1,
1.217295, -0.4438197, 3.006221, 1, 0, 0.6196079, 1,
1.22702, -0.4077688, 1.765476, 1, 0, 0.6117647, 1,
1.229075, -0.1292945, 1.412396, 1, 0, 0.6078432, 1,
1.237688, 0.3078084, 1.324037, 1, 0, 0.6, 1,
1.239204, -0.2098529, 0.9451696, 1, 0, 0.5921569, 1,
1.24314, -1.960446, 4.151026, 1, 0, 0.5882353, 1,
1.243885, -1.171973, 1.635535, 1, 0, 0.5803922, 1,
1.252052, -1.165277, 2.298706, 1, 0, 0.5764706, 1,
1.252829, 0.6861621, -0.3348882, 1, 0, 0.5686275, 1,
1.261556, 0.9194286, 2.34124, 1, 0, 0.5647059, 1,
1.26163, -0.06617338, 1.942752, 1, 0, 0.5568628, 1,
1.2776, -1.385241, 2.018555, 1, 0, 0.5529412, 1,
1.283689, 0.2455194, 1.40688, 1, 0, 0.5450981, 1,
1.29128, 0.3235564, 2.018673, 1, 0, 0.5411765, 1,
1.295955, -1.424043, 3.895751, 1, 0, 0.5333334, 1,
1.296736, -1.010379, 3.567347, 1, 0, 0.5294118, 1,
1.308695, -2.417502, 2.866741, 1, 0, 0.5215687, 1,
1.328174, -1.461652, 2.317743, 1, 0, 0.5176471, 1,
1.330682, 0.7688174, 2.472187, 1, 0, 0.509804, 1,
1.334376, -0.712282, 0.459976, 1, 0, 0.5058824, 1,
1.343784, 0.6798348, 0.6313235, 1, 0, 0.4980392, 1,
1.3491, -0.06721549, 1.523624, 1, 0, 0.4901961, 1,
1.365988, 1.054112, -0.3776072, 1, 0, 0.4862745, 1,
1.367644, -0.9925939, 2.240009, 1, 0, 0.4784314, 1,
1.369128, -1.054171, 2.215748, 1, 0, 0.4745098, 1,
1.396338, 0.5079362, 0.2579605, 1, 0, 0.4666667, 1,
1.41167, 1.385895, 0.5285, 1, 0, 0.4627451, 1,
1.417485, 0.2696099, 2.451436, 1, 0, 0.454902, 1,
1.421246, -0.4201833, 3.158339, 1, 0, 0.4509804, 1,
1.425745, -0.07570954, 0.1208025, 1, 0, 0.4431373, 1,
1.426717, 1.956761, -0.3443126, 1, 0, 0.4392157, 1,
1.438077, -2.726023, 2.715093, 1, 0, 0.4313726, 1,
1.445949, -1.026989, 1.600239, 1, 0, 0.427451, 1,
1.465988, -0.2987357, 2.764986, 1, 0, 0.4196078, 1,
1.470496, -0.3153925, 2.190325, 1, 0, 0.4156863, 1,
1.471969, -0.4028836, -0.8802204, 1, 0, 0.4078431, 1,
1.474505, -0.130725, 1.701905, 1, 0, 0.4039216, 1,
1.476087, -0.6577262, 0.7858663, 1, 0, 0.3960784, 1,
1.480771, 1.303941, 1.685519, 1, 0, 0.3882353, 1,
1.509383, -0.4156252, -0.5190092, 1, 0, 0.3843137, 1,
1.524994, 1.043366, 2.281921, 1, 0, 0.3764706, 1,
1.539725, -0.7777792, 1.922692, 1, 0, 0.372549, 1,
1.563624, 0.3209699, -1.129178, 1, 0, 0.3647059, 1,
1.578506, 0.5666944, 1.294013, 1, 0, 0.3607843, 1,
1.581932, -0.09570289, 0.6975871, 1, 0, 0.3529412, 1,
1.587906, -1.146616, 1.416273, 1, 0, 0.3490196, 1,
1.590253, 1.749286, 0.02791858, 1, 0, 0.3411765, 1,
1.6067, 2.062393, 2.174309, 1, 0, 0.3372549, 1,
1.617104, -0.7100798, 1.594001, 1, 0, 0.3294118, 1,
1.61759, 2.363275, -0.09290335, 1, 0, 0.3254902, 1,
1.619746, -0.2128412, 0.7135103, 1, 0, 0.3176471, 1,
1.627006, 0.4664394, 0.4312902, 1, 0, 0.3137255, 1,
1.632201, 0.8612313, -0.01594448, 1, 0, 0.3058824, 1,
1.641542, 0.07791258, 0.5171677, 1, 0, 0.2980392, 1,
1.648112, 0.846648, 2.548557, 1, 0, 0.2941177, 1,
1.653386, 2.007919, 0.3573656, 1, 0, 0.2862745, 1,
1.66455, -0.3342126, 1.312477, 1, 0, 0.282353, 1,
1.681312, -0.5737104, -0.6544009, 1, 0, 0.2745098, 1,
1.694473, 0.3614415, 2.347376, 1, 0, 0.2705882, 1,
1.698058, -0.1466455, 2.147185, 1, 0, 0.2627451, 1,
1.708954, -0.693358, 2.488094, 1, 0, 0.2588235, 1,
1.710943, 1.13656, 0.4648414, 1, 0, 0.2509804, 1,
1.716486, -1.725622, 1.823932, 1, 0, 0.2470588, 1,
1.720477, -1.338652, 3.277891, 1, 0, 0.2392157, 1,
1.727706, 0.4273431, 0.6638532, 1, 0, 0.2352941, 1,
1.739068, -1.235483, 1.832502, 1, 0, 0.227451, 1,
1.773366, 0.1762841, 2.820954, 1, 0, 0.2235294, 1,
1.785799, -2.18149, 0.9124267, 1, 0, 0.2156863, 1,
1.798863, 1.011232, 2.403736, 1, 0, 0.2117647, 1,
1.840436, 0.2656991, -0.2900903, 1, 0, 0.2039216, 1,
1.856263, -0.01651978, 2.4181, 1, 0, 0.1960784, 1,
1.892901, -0.06536202, 2.009571, 1, 0, 0.1921569, 1,
1.895114, -0.03519359, 2.144274, 1, 0, 0.1843137, 1,
1.900088, 0.9502913, 0.7983295, 1, 0, 0.1803922, 1,
1.918894, 0.7933214, 0.2964631, 1, 0, 0.172549, 1,
1.934484, 0.438808, 1.599661, 1, 0, 0.1686275, 1,
1.955215, 0.9557101, 1.824756, 1, 0, 0.1607843, 1,
1.95854, 1.643606, 0.222601, 1, 0, 0.1568628, 1,
1.961374, 1.380139, 1.541037, 1, 0, 0.1490196, 1,
1.977558, 0.3694948, 2.337886, 1, 0, 0.145098, 1,
1.992251, -0.3050847, 0.8879408, 1, 0, 0.1372549, 1,
2.038748, 0.5999785, 0.9837686, 1, 0, 0.1333333, 1,
2.11927, 0.3780108, 1.126636, 1, 0, 0.1254902, 1,
2.165484, -1.435939, 2.986044, 1, 0, 0.1215686, 1,
2.168164, 0.005772909, -0.04211815, 1, 0, 0.1137255, 1,
2.181898, 0.4707178, 0.6844622, 1, 0, 0.1098039, 1,
2.226626, -0.7177985, 3.872327, 1, 0, 0.1019608, 1,
2.250721, 0.04613615, 2.56073, 1, 0, 0.09411765, 1,
2.250811, 0.2322101, 0.0262623, 1, 0, 0.09019608, 1,
2.266583, -0.954761, 1.835345, 1, 0, 0.08235294, 1,
2.312643, -0.4174972, 2.657194, 1, 0, 0.07843138, 1,
2.35499, 0.3774456, 2.111882, 1, 0, 0.07058824, 1,
2.357188, -0.3415464, 2.687036, 1, 0, 0.06666667, 1,
2.43519, -0.4824176, 2.233913, 1, 0, 0.05882353, 1,
2.528907, -0.003381519, 0.5824164, 1, 0, 0.05490196, 1,
2.631568, 1.065841, 1.211259, 1, 0, 0.04705882, 1,
2.635914, -0.7357888, 1.378383, 1, 0, 0.04313726, 1,
2.705057, -0.7047102, 2.237875, 1, 0, 0.03529412, 1,
2.789018, -0.7355313, -0.4840855, 1, 0, 0.03137255, 1,
2.857008, 0.4272681, 0.8727948, 1, 0, 0.02352941, 1,
2.86435, 0.1587262, -0.3207782, 1, 0, 0.01960784, 1,
3.153568, -0.3347533, 1.929984, 1, 0, 0.01176471, 1,
3.253327, 1.581388, 0.4041511, 1, 0, 0.007843138, 1
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
-0.3927639, -4.412282, -7.274566, 0, -0.5, 0.5, 0.5,
-0.3927639, -4.412282, -7.274566, 1, -0.5, 0.5, 0.5,
-0.3927639, -4.412282, -7.274566, 1, 1.5, 0.5, 0.5,
-0.3927639, -4.412282, -7.274566, 0, 1.5, 0.5, 0.5
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
-5.27488, -0.1281834, -7.274566, 0, -0.5, 0.5, 0.5,
-5.27488, -0.1281834, -7.274566, 1, -0.5, 0.5, 0.5,
-5.27488, -0.1281834, -7.274566, 1, 1.5, 0.5, 0.5,
-5.27488, -0.1281834, -7.274566, 0, 1.5, 0.5, 0.5
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
-5.27488, -4.412282, 0.01899958, 0, -0.5, 0.5, 0.5,
-5.27488, -4.412282, 0.01899958, 1, -0.5, 0.5, 0.5,
-5.27488, -4.412282, 0.01899958, 1, 1.5, 0.5, 0.5,
-5.27488, -4.412282, 0.01899958, 0, 1.5, 0.5, 0.5
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
-4, -3.423644, -5.591435,
2, -3.423644, -5.591435,
-4, -3.423644, -5.591435,
-4, -3.588418, -5.871957,
-2, -3.423644, -5.591435,
-2, -3.588418, -5.871957,
0, -3.423644, -5.591435,
0, -3.588418, -5.871957,
2, -3.423644, -5.591435,
2, -3.588418, -5.871957
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
"-4",
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
-4, -3.917964, -6.433001, 0, -0.5, 0.5, 0.5,
-4, -3.917964, -6.433001, 1, -0.5, 0.5, 0.5,
-4, -3.917964, -6.433001, 1, 1.5, 0.5, 0.5,
-4, -3.917964, -6.433001, 0, 1.5, 0.5, 0.5,
-2, -3.917964, -6.433001, 0, -0.5, 0.5, 0.5,
-2, -3.917964, -6.433001, 1, -0.5, 0.5, 0.5,
-2, -3.917964, -6.433001, 1, 1.5, 0.5, 0.5,
-2, -3.917964, -6.433001, 0, 1.5, 0.5, 0.5,
0, -3.917964, -6.433001, 0, -0.5, 0.5, 0.5,
0, -3.917964, -6.433001, 1, -0.5, 0.5, 0.5,
0, -3.917964, -6.433001, 1, 1.5, 0.5, 0.5,
0, -3.917964, -6.433001, 0, 1.5, 0.5, 0.5,
2, -3.917964, -6.433001, 0, -0.5, 0.5, 0.5,
2, -3.917964, -6.433001, 1, -0.5, 0.5, 0.5,
2, -3.917964, -6.433001, 1, 1.5, 0.5, 0.5,
2, -3.917964, -6.433001, 0, 1.5, 0.5, 0.5
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
-4.148238, -3, -5.591435,
-4.148238, 3, -5.591435,
-4.148238, -3, -5.591435,
-4.336011, -3, -5.871957,
-4.148238, -2, -5.591435,
-4.336011, -2, -5.871957,
-4.148238, -1, -5.591435,
-4.336011, -1, -5.871957,
-4.148238, 0, -5.591435,
-4.336011, 0, -5.871957,
-4.148238, 1, -5.591435,
-4.336011, 1, -5.871957,
-4.148238, 2, -5.591435,
-4.336011, 2, -5.871957,
-4.148238, 3, -5.591435,
-4.336011, 3, -5.871957
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
-4.711559, -3, -6.433001, 0, -0.5, 0.5, 0.5,
-4.711559, -3, -6.433001, 1, -0.5, 0.5, 0.5,
-4.711559, -3, -6.433001, 1, 1.5, 0.5, 0.5,
-4.711559, -3, -6.433001, 0, 1.5, 0.5, 0.5,
-4.711559, -2, -6.433001, 0, -0.5, 0.5, 0.5,
-4.711559, -2, -6.433001, 1, -0.5, 0.5, 0.5,
-4.711559, -2, -6.433001, 1, 1.5, 0.5, 0.5,
-4.711559, -2, -6.433001, 0, 1.5, 0.5, 0.5,
-4.711559, -1, -6.433001, 0, -0.5, 0.5, 0.5,
-4.711559, -1, -6.433001, 1, -0.5, 0.5, 0.5,
-4.711559, -1, -6.433001, 1, 1.5, 0.5, 0.5,
-4.711559, -1, -6.433001, 0, 1.5, 0.5, 0.5,
-4.711559, 0, -6.433001, 0, -0.5, 0.5, 0.5,
-4.711559, 0, -6.433001, 1, -0.5, 0.5, 0.5,
-4.711559, 0, -6.433001, 1, 1.5, 0.5, 0.5,
-4.711559, 0, -6.433001, 0, 1.5, 0.5, 0.5,
-4.711559, 1, -6.433001, 0, -0.5, 0.5, 0.5,
-4.711559, 1, -6.433001, 1, -0.5, 0.5, 0.5,
-4.711559, 1, -6.433001, 1, 1.5, 0.5, 0.5,
-4.711559, 1, -6.433001, 0, 1.5, 0.5, 0.5,
-4.711559, 2, -6.433001, 0, -0.5, 0.5, 0.5,
-4.711559, 2, -6.433001, 1, -0.5, 0.5, 0.5,
-4.711559, 2, -6.433001, 1, 1.5, 0.5, 0.5,
-4.711559, 2, -6.433001, 0, 1.5, 0.5, 0.5,
-4.711559, 3, -6.433001, 0, -0.5, 0.5, 0.5,
-4.711559, 3, -6.433001, 1, -0.5, 0.5, 0.5,
-4.711559, 3, -6.433001, 1, 1.5, 0.5, 0.5,
-4.711559, 3, -6.433001, 0, 1.5, 0.5, 0.5
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
-4.148238, -3.423644, -4,
-4.148238, -3.423644, 4,
-4.148238, -3.423644, -4,
-4.336011, -3.588418, -4,
-4.148238, -3.423644, -2,
-4.336011, -3.588418, -2,
-4.148238, -3.423644, 0,
-4.336011, -3.588418, 0,
-4.148238, -3.423644, 2,
-4.336011, -3.588418, 2,
-4.148238, -3.423644, 4,
-4.336011, -3.588418, 4
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
-4.711559, -3.917964, -4, 0, -0.5, 0.5, 0.5,
-4.711559, -3.917964, -4, 1, -0.5, 0.5, 0.5,
-4.711559, -3.917964, -4, 1, 1.5, 0.5, 0.5,
-4.711559, -3.917964, -4, 0, 1.5, 0.5, 0.5,
-4.711559, -3.917964, -2, 0, -0.5, 0.5, 0.5,
-4.711559, -3.917964, -2, 1, -0.5, 0.5, 0.5,
-4.711559, -3.917964, -2, 1, 1.5, 0.5, 0.5,
-4.711559, -3.917964, -2, 0, 1.5, 0.5, 0.5,
-4.711559, -3.917964, 0, 0, -0.5, 0.5, 0.5,
-4.711559, -3.917964, 0, 1, -0.5, 0.5, 0.5,
-4.711559, -3.917964, 0, 1, 1.5, 0.5, 0.5,
-4.711559, -3.917964, 0, 0, 1.5, 0.5, 0.5,
-4.711559, -3.917964, 2, 0, -0.5, 0.5, 0.5,
-4.711559, -3.917964, 2, 1, -0.5, 0.5, 0.5,
-4.711559, -3.917964, 2, 1, 1.5, 0.5, 0.5,
-4.711559, -3.917964, 2, 0, 1.5, 0.5, 0.5,
-4.711559, -3.917964, 4, 0, -0.5, 0.5, 0.5,
-4.711559, -3.917964, 4, 1, -0.5, 0.5, 0.5,
-4.711559, -3.917964, 4, 1, 1.5, 0.5, 0.5,
-4.711559, -3.917964, 4, 0, 1.5, 0.5, 0.5
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
-4.148238, -3.423644, -5.591435,
-4.148238, 3.167278, -5.591435,
-4.148238, -3.423644, 5.629435,
-4.148238, 3.167278, 5.629435,
-4.148238, -3.423644, -5.591435,
-4.148238, -3.423644, 5.629435,
-4.148238, 3.167278, -5.591435,
-4.148238, 3.167278, 5.629435,
-4.148238, -3.423644, -5.591435,
3.36271, -3.423644, -5.591435,
-4.148238, -3.423644, 5.629435,
3.36271, -3.423644, 5.629435,
-4.148238, 3.167278, -5.591435,
3.36271, 3.167278, -5.591435,
-4.148238, 3.167278, 5.629435,
3.36271, 3.167278, 5.629435,
3.36271, -3.423644, -5.591435,
3.36271, 3.167278, -5.591435,
3.36271, -3.423644, 5.629435,
3.36271, 3.167278, 5.629435,
3.36271, -3.423644, -5.591435,
3.36271, -3.423644, 5.629435,
3.36271, 3.167278, -5.591435,
3.36271, 3.167278, 5.629435
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
var radius = 8.02327;
var distance = 35.69643;
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
mvMatrix.translate( 0.3927639, 0.1281834, -0.01899958 );
mvMatrix.scale( 1.15497, 1.316192, 0.7731055 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.69643);
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
avermectin_B1a<-read.table("avermectin_B1a.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-avermectin_B1a$V2
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1a' not found
```

```r
y<-avermectin_B1a$V3
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1a' not found
```

```r
z<-avermectin_B1a$V4
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1a' not found
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
-4.038855, 0.6785276, -0.8554378, 0, 0, 1, 1, 1,
-3.227784, 0.2655347, -2.086838, 1, 0, 0, 1, 1,
-2.707144, -0.2978562, -3.699748, 1, 0, 0, 1, 1,
-2.697448, -1.387745, -4.261158, 1, 0, 0, 1, 1,
-2.452354, -0.7186658, -2.327272, 1, 0, 0, 1, 1,
-2.41699, -0.04609157, -2.399004, 1, 0, 0, 1, 1,
-2.293513, -0.8639811, -3.122125, 0, 0, 0, 1, 1,
-2.241715, -0.3259861, -3.224984, 0, 0, 0, 1, 1,
-2.235404, 0.1850252, 0.2483788, 0, 0, 0, 1, 1,
-2.206933, -0.4480772, -1.932332, 0, 0, 0, 1, 1,
-2.181748, -0.1014496, -2.751372, 0, 0, 0, 1, 1,
-2.162372, -0.5761044, -0.961937, 0, 0, 0, 1, 1,
-2.148514, 0.9733979, -1.200097, 0, 0, 0, 1, 1,
-2.147891, -0.03225008, -2.072573, 1, 1, 1, 1, 1,
-2.135253, -0.848852, -1.343933, 1, 1, 1, 1, 1,
-2.132832, -0.2298105, -4.383117, 1, 1, 1, 1, 1,
-2.117169, -0.535834, -0.9979545, 1, 1, 1, 1, 1,
-2.109649, -0.4181961, -2.55172, 1, 1, 1, 1, 1,
-2.078338, 1.101773, -1.764582, 1, 1, 1, 1, 1,
-2.072936, -0.582512, -0.8881879, 1, 1, 1, 1, 1,
-2.056815, 0.09517036, -0.3698557, 1, 1, 1, 1, 1,
-2.053842, 0.8011149, -1.730426, 1, 1, 1, 1, 1,
-2.042081, -0.5994787, -1.277079, 1, 1, 1, 1, 1,
-2.003237, -1.81179, -1.397789, 1, 1, 1, 1, 1,
-1.996056, 0.1517677, -1.129937, 1, 1, 1, 1, 1,
-1.992348, -1.037184, -0.6194993, 1, 1, 1, 1, 1,
-1.980323, 0.01435603, -3.282855, 1, 1, 1, 1, 1,
-1.911726, 0.3637561, -4.955321, 1, 1, 1, 1, 1,
-1.910088, -0.5056701, -3.154721, 0, 0, 1, 1, 1,
-1.901081, -2.380818, -3.744495, 1, 0, 0, 1, 1,
-1.877702, 0.5179819, -1.413936, 1, 0, 0, 1, 1,
-1.866033, -1.091412, -3.542577, 1, 0, 0, 1, 1,
-1.85693, 0.9436995, -0.0124038, 1, 0, 0, 1, 1,
-1.839051, 1.48877, -1.4256, 1, 0, 0, 1, 1,
-1.810805, -1.564917, -0.7181425, 0, 0, 0, 1, 1,
-1.795832, 0.2136564, 0.1287414, 0, 0, 0, 1, 1,
-1.780464, 1.220091, -1.803551, 0, 0, 0, 1, 1,
-1.758881, -1.117889, -1.027194, 0, 0, 0, 1, 1,
-1.756262, 0.1106629, -1.968862, 0, 0, 0, 1, 1,
-1.756229, 1.613872, 0.2426998, 0, 0, 0, 1, 1,
-1.753261, -0.3951282, -3.667857, 0, 0, 0, 1, 1,
-1.749997, -1.494187, -2.393189, 1, 1, 1, 1, 1,
-1.734405, -0.5438407, -2.311873, 1, 1, 1, 1, 1,
-1.715925, -1.019315, -2.476856, 1, 1, 1, 1, 1,
-1.686061, -1.019255, -2.338099, 1, 1, 1, 1, 1,
-1.680988, -0.290657, -2.41611, 1, 1, 1, 1, 1,
-1.66755, 0.9231215, -0.7382606, 1, 1, 1, 1, 1,
-1.652547, -0.9310367, -2.227654, 1, 1, 1, 1, 1,
-1.650844, -1.823101, -3.716596, 1, 1, 1, 1, 1,
-1.641473, 1.066749, -0.7049156, 1, 1, 1, 1, 1,
-1.639775, -1.081348, -1.615992, 1, 1, 1, 1, 1,
-1.629716, 2.353699, -0.9265732, 1, 1, 1, 1, 1,
-1.627192, 1.874253, -2.608837, 1, 1, 1, 1, 1,
-1.621525, -0.5727316, -2.119296, 1, 1, 1, 1, 1,
-1.619536, 0.6102769, -1.116065, 1, 1, 1, 1, 1,
-1.609934, -1.25768, -2.902553, 1, 1, 1, 1, 1,
-1.60541, -0.4498307, -1.344387, 0, 0, 1, 1, 1,
-1.598177, -0.8564012, -1.852935, 1, 0, 0, 1, 1,
-1.585958, -1.301774, -4.481192, 1, 0, 0, 1, 1,
-1.583013, -0.4491293, -3.662432, 1, 0, 0, 1, 1,
-1.582845, -0.2108008, -1.108986, 1, 0, 0, 1, 1,
-1.579602, -0.5275738, -2.519423, 1, 0, 0, 1, 1,
-1.572095, 0.1664626, 0.1234824, 0, 0, 0, 1, 1,
-1.568137, -0.4715231, -2.476315, 0, 0, 0, 1, 1,
-1.552866, -0.6169972, -1.583677, 0, 0, 0, 1, 1,
-1.54341, 0.8788152, -2.020871, 0, 0, 0, 1, 1,
-1.509328, 0.5971914, -2.333866, 0, 0, 0, 1, 1,
-1.506172, 0.3764566, 0.02887299, 0, 0, 0, 1, 1,
-1.504976, -0.5684054, -0.5445919, 0, 0, 0, 1, 1,
-1.496911, 0.3632738, -2.343403, 1, 1, 1, 1, 1,
-1.492591, 0.4620848, -2.485433, 1, 1, 1, 1, 1,
-1.482262, 2.162336, -1.58529, 1, 1, 1, 1, 1,
-1.478919, 0.5145766, -1.082748, 1, 1, 1, 1, 1,
-1.474505, 0.8622822, 0.06704571, 1, 1, 1, 1, 1,
-1.473226, -0.3414865, -2.064904, 1, 1, 1, 1, 1,
-1.468776, 0.58658, -1.367438, 1, 1, 1, 1, 1,
-1.467904, -0.8703287, -4.73204, 1, 1, 1, 1, 1,
-1.46649, -0.2706888, -1.752981, 1, 1, 1, 1, 1,
-1.460188, -0.3852514, -2.060198, 1, 1, 1, 1, 1,
-1.43054, -1.077829, -2.410222, 1, 1, 1, 1, 1,
-1.422633, 0.1418064, -2.021285, 1, 1, 1, 1, 1,
-1.412235, 0.169625, -0.004331172, 1, 1, 1, 1, 1,
-1.410898, -0.8946245, -2.66486, 1, 1, 1, 1, 1,
-1.409739, 0.766658, -2.825572, 1, 1, 1, 1, 1,
-1.388587, -0.4165235, -3.288358, 0, 0, 1, 1, 1,
-1.380631, 0.6133082, -3.56515, 1, 0, 0, 1, 1,
-1.374647, 0.08053159, -0.9493783, 1, 0, 0, 1, 1,
-1.362734, 0.5128769, -2.567905, 1, 0, 0, 1, 1,
-1.360728, 0.08185848, -1.085072, 1, 0, 0, 1, 1,
-1.355106, 0.952905, 0.2736301, 1, 0, 0, 1, 1,
-1.353483, 0.799108, -1.279497, 0, 0, 0, 1, 1,
-1.351919, 0.3711321, 0.9594529, 0, 0, 0, 1, 1,
-1.34867, -0.2365642, -2.547527, 0, 0, 0, 1, 1,
-1.326223, 0.1188798, -0.1027237, 0, 0, 0, 1, 1,
-1.323105, -0.03148213, -1.356145, 0, 0, 0, 1, 1,
-1.29693, -0.5988876, -1.991219, 0, 0, 0, 1, 1,
-1.293369, 0.2826358, -0.658424, 0, 0, 0, 1, 1,
-1.29158, 2.032158, -1.853579, 1, 1, 1, 1, 1,
-1.284347, -1.928647, -2.897923, 1, 1, 1, 1, 1,
-1.281881, -0.58111, -3.626278, 1, 1, 1, 1, 1,
-1.280664, 0.7935581, -1.239392, 1, 1, 1, 1, 1,
-1.274554, -0.8392007, 0.1742765, 1, 1, 1, 1, 1,
-1.258781, 0.6810175, -1.620502, 1, 1, 1, 1, 1,
-1.249066, 0.6654177, -1.154246, 1, 1, 1, 1, 1,
-1.248268, 1.915125, -1.768299, 1, 1, 1, 1, 1,
-1.242364, 0.6728891, -1.377269, 1, 1, 1, 1, 1,
-1.241657, -0.1720955, 0.5784591, 1, 1, 1, 1, 1,
-1.241605, -1.528689, -1.52379, 1, 1, 1, 1, 1,
-1.237221, -1.157901, -1.329132, 1, 1, 1, 1, 1,
-1.235883, 1.069598, -1.212042, 1, 1, 1, 1, 1,
-1.230338, -0.5968442, -2.625931, 1, 1, 1, 1, 1,
-1.218399, 0.1071028, -1.988312, 1, 1, 1, 1, 1,
-1.211419, -1.550017, -1.865139, 0, 0, 1, 1, 1,
-1.210114, -0.07691212, -1.6996, 1, 0, 0, 1, 1,
-1.196522, -1.44207, -2.67063, 1, 0, 0, 1, 1,
-1.183774, -0.6121256, -1.605122, 1, 0, 0, 1, 1,
-1.176568, -0.65799, -2.097315, 1, 0, 0, 1, 1,
-1.17054, -0.717352, -0.05664371, 1, 0, 0, 1, 1,
-1.170488, 0.2679135, -2.844531, 0, 0, 0, 1, 1,
-1.165983, -0.6209202, -3.028594, 0, 0, 0, 1, 1,
-1.16565, 0.5886111, -2.589695, 0, 0, 0, 1, 1,
-1.163751, 1.236155, -1.216079, 0, 0, 0, 1, 1,
-1.155195, 0.632358, -1.654586, 0, 0, 0, 1, 1,
-1.14432, 1.703992, -2.26218, 0, 0, 0, 1, 1,
-1.143784, 1.52955, -0.05902897, 0, 0, 0, 1, 1,
-1.131617, 0.382627, -0.366703, 1, 1, 1, 1, 1,
-1.130334, 1.554816, -0.9700038, 1, 1, 1, 1, 1,
-1.126199, -0.57051, -0.2780339, 1, 1, 1, 1, 1,
-1.123465, 0.7246341, -1.448244, 1, 1, 1, 1, 1,
-1.120386, 0.4910915, 0.09758104, 1, 1, 1, 1, 1,
-1.118059, 1.047666, -2.330319, 1, 1, 1, 1, 1,
-1.111522, -1.988695, -3.777672, 1, 1, 1, 1, 1,
-1.101665, -1.188803, -3.212856, 1, 1, 1, 1, 1,
-1.097228, -0.5311125, -1.998073, 1, 1, 1, 1, 1,
-1.086589, 0.4421156, -0.2242951, 1, 1, 1, 1, 1,
-1.082495, -0.616843, -2.313256, 1, 1, 1, 1, 1,
-1.076756, -1.902707, -2.118583, 1, 1, 1, 1, 1,
-1.076305, -1.109239, -4.587613, 1, 1, 1, 1, 1,
-1.07115, 0.03031898, -1.746494, 1, 1, 1, 1, 1,
-1.066227, -0.4546765, -2.793665, 1, 1, 1, 1, 1,
-1.064805, -0.6119065, -1.876925, 0, 0, 1, 1, 1,
-1.063375, -1.871596, -4.233534, 1, 0, 0, 1, 1,
-1.062285, -0.06866297, -2.605226, 1, 0, 0, 1, 1,
-1.058078, -0.01462601, -0.8363824, 1, 0, 0, 1, 1,
-1.053892, -0.06768003, -0.004490746, 1, 0, 0, 1, 1,
-1.053657, -0.2793826, -2.444244, 1, 0, 0, 1, 1,
-1.04019, 0.2726421, -2.041971, 0, 0, 0, 1, 1,
-1.035326, 0.04611785, -1.161619, 0, 0, 0, 1, 1,
-1.027338, -0.2715462, -2.108092, 0, 0, 0, 1, 1,
-1.025983, -0.7968751, -2.607777, 0, 0, 0, 1, 1,
-1.016095, -0.7222736, -1.295554, 0, 0, 0, 1, 1,
-1.012032, -0.01457836, -2.212172, 0, 0, 0, 1, 1,
-1.006597, 0.2307128, -2.870847, 0, 0, 0, 1, 1,
-1.006385, -0.3527476, -1.017164, 1, 1, 1, 1, 1,
-0.9997346, -0.5094296, -2.661947, 1, 1, 1, 1, 1,
-0.9993228, -2.032687, -2.812486, 1, 1, 1, 1, 1,
-0.9965481, 0.335348, -1.415139, 1, 1, 1, 1, 1,
-0.9964128, 1.519258, -1.702129, 1, 1, 1, 1, 1,
-0.9923772, 0.5663431, -1.161875, 1, 1, 1, 1, 1,
-0.9885174, 2.799928, -0.02423427, 1, 1, 1, 1, 1,
-0.963153, -1.760583, -3.987381, 1, 1, 1, 1, 1,
-0.951786, 1.937882, 1.171203, 1, 1, 1, 1, 1,
-0.9497668, 0.7340739, -1.303538, 1, 1, 1, 1, 1,
-0.944845, -1.146141, -3.603897, 1, 1, 1, 1, 1,
-0.94284, 1.259392, 0.01646684, 1, 1, 1, 1, 1,
-0.9356815, 0.2945117, 0.7530982, 1, 1, 1, 1, 1,
-0.9330012, -1.031832, -1.917013, 1, 1, 1, 1, 1,
-0.9269375, 0.6891159, -2.669261, 1, 1, 1, 1, 1,
-0.9266623, 0.8839297, -1.641678, 0, 0, 1, 1, 1,
-0.9264361, -0.6284794, -1.160488, 1, 0, 0, 1, 1,
-0.9193082, 0.7016988, -1.267365, 1, 0, 0, 1, 1,
-0.9171501, -2.089141, -2.753237, 1, 0, 0, 1, 1,
-0.9148643, -0.1597917, -2.799747, 1, 0, 0, 1, 1,
-0.9089738, -0.6887318, -3.30753, 1, 0, 0, 1, 1,
-0.9071749, 0.8683222, -0.0005914926, 0, 0, 0, 1, 1,
-0.9069283, -1.768053, -4.225482, 0, 0, 0, 1, 1,
-0.9069069, -1.184339, -2.041193, 0, 0, 0, 1, 1,
-0.9050424, -0.5981613, -2.132952, 0, 0, 0, 1, 1,
-0.9010897, -0.603752, -2.814487, 0, 0, 0, 1, 1,
-0.8971037, -0.6282074, -3.376309, 0, 0, 0, 1, 1,
-0.8962978, -0.09910042, -0.2966972, 0, 0, 0, 1, 1,
-0.8961472, 0.5048984, -2.564748, 1, 1, 1, 1, 1,
-0.8953652, -0.4421312, -1.956645, 1, 1, 1, 1, 1,
-0.8950645, -1.354647, -2.77158, 1, 1, 1, 1, 1,
-0.8869336, 0.4870881, -0.1351317, 1, 1, 1, 1, 1,
-0.8832909, -0.7131308, -3.397785, 1, 1, 1, 1, 1,
-0.8831559, -0.2417557, -1.715906, 1, 1, 1, 1, 1,
-0.8825547, 0.4541818, -1.732935, 1, 1, 1, 1, 1,
-0.8825288, 2.693319, -0.3703772, 1, 1, 1, 1, 1,
-0.8796486, 1.868285, -0.03749789, 1, 1, 1, 1, 1,
-0.8781834, 0.2929504, -2.026211, 1, 1, 1, 1, 1,
-0.8754905, -0.5730519, -4.082159, 1, 1, 1, 1, 1,
-0.8735021, 0.3682077, -2.171314, 1, 1, 1, 1, 1,
-0.8728149, 0.8612326, -0.6832542, 1, 1, 1, 1, 1,
-0.8673064, 0.8320965, 1.222877, 1, 1, 1, 1, 1,
-0.8644723, 1.305201, -0.5730327, 1, 1, 1, 1, 1,
-0.8623456, -0.1417851, -1.40281, 0, 0, 1, 1, 1,
-0.8563352, 1.664033, -1.742961, 1, 0, 0, 1, 1,
-0.8562346, -1.129752, -1.06411, 1, 0, 0, 1, 1,
-0.8557478, -0.123945, -2.234752, 1, 0, 0, 1, 1,
-0.8517879, -0.6313823, -2.319206, 1, 0, 0, 1, 1,
-0.8509131, -1.425009, -2.656583, 1, 0, 0, 1, 1,
-0.8502383, 0.0354928, 0.6262432, 0, 0, 0, 1, 1,
-0.8462216, 0.2124569, -1.398139, 0, 0, 0, 1, 1,
-0.8440679, 0.8548906, -1.388961, 0, 0, 0, 1, 1,
-0.8411397, -2.151327, -2.782919, 0, 0, 0, 1, 1,
-0.8402923, 0.3885129, -0.5698432, 0, 0, 0, 1, 1,
-0.8398157, -0.523706, -2.155675, 0, 0, 0, 1, 1,
-0.8381554, 0.3702867, -0.776993, 0, 0, 0, 1, 1,
-0.834277, 2.339271, -0.1555553, 1, 1, 1, 1, 1,
-0.8244707, -0.5221292, -2.379535, 1, 1, 1, 1, 1,
-0.8213856, -0.4659926, -2.599106, 1, 1, 1, 1, 1,
-0.8210484, -0.4987029, -1.720929, 1, 1, 1, 1, 1,
-0.8189647, 0.03891246, -1.205777, 1, 1, 1, 1, 1,
-0.8164099, 2.420397, 0.7953731, 1, 1, 1, 1, 1,
-0.8163162, -2.319893, -4.161935, 1, 1, 1, 1, 1,
-0.8089825, 0.6842997, -2.079256, 1, 1, 1, 1, 1,
-0.8079828, 0.137434, -1.549616, 1, 1, 1, 1, 1,
-0.8066623, 0.6987438, -0.511629, 1, 1, 1, 1, 1,
-0.8059212, 1.554096, 0.7148928, 1, 1, 1, 1, 1,
-0.8008195, 0.2123681, -0.754762, 1, 1, 1, 1, 1,
-0.7949988, -0.303685, -0.7447293, 1, 1, 1, 1, 1,
-0.7946839, -0.7836224, -2.403186, 1, 1, 1, 1, 1,
-0.7922727, -0.3611446, -3.133708, 1, 1, 1, 1, 1,
-0.7899393, 1.228804, 1.456473, 0, 0, 1, 1, 1,
-0.7864098, -1.111517, -0.6835411, 1, 0, 0, 1, 1,
-0.7808702, 0.1406744, -1.169944, 1, 0, 0, 1, 1,
-0.7795321, -0.4230397, -3.054799, 1, 0, 0, 1, 1,
-0.7489437, 0.3046156, -0.1467828, 1, 0, 0, 1, 1,
-0.7484651, 1.027363, -1.941573, 1, 0, 0, 1, 1,
-0.7483163, 0.3286666, -1.303062, 0, 0, 0, 1, 1,
-0.7474607, 1.052255, 0.3260951, 0, 0, 0, 1, 1,
-0.7467074, 0.3393736, -0.5328199, 0, 0, 0, 1, 1,
-0.7459548, -0.6250279, -3.373378, 0, 0, 0, 1, 1,
-0.7445774, 1.235121, -0.6992612, 0, 0, 0, 1, 1,
-0.7404798, -0.3622687, -1.633817, 0, 0, 0, 1, 1,
-0.7351456, -0.3392487, -2.270686, 0, 0, 0, 1, 1,
-0.7247469, 1.923358, -0.5674273, 1, 1, 1, 1, 1,
-0.7233251, -1.420657, -2.795789, 1, 1, 1, 1, 1,
-0.7186982, 0.2351201, -2.703491, 1, 1, 1, 1, 1,
-0.7178037, 0.6348414, -2.725229, 1, 1, 1, 1, 1,
-0.7166499, -0.4667535, -2.656575, 1, 1, 1, 1, 1,
-0.7140011, 0.2017286, -1.9804, 1, 1, 1, 1, 1,
-0.7119403, 0.2608115, -0.7307292, 1, 1, 1, 1, 1,
-0.7101402, 0.551798, -0.1654334, 1, 1, 1, 1, 1,
-0.7058668, 0.2890333, -1.582314, 1, 1, 1, 1, 1,
-0.7017971, 1.957089, 1.663261, 1, 1, 1, 1, 1,
-0.6975522, -0.5404895, -1.269419, 1, 1, 1, 1, 1,
-0.6974056, 0.3666042, -1.707, 1, 1, 1, 1, 1,
-0.6962772, 0.3077982, 0.2111333, 1, 1, 1, 1, 1,
-0.6949942, -1.106534, -0.5231699, 1, 1, 1, 1, 1,
-0.6931997, 0.9051035, -0.401801, 1, 1, 1, 1, 1,
-0.6901086, 1.21817, -1.123891, 0, 0, 1, 1, 1,
-0.6899488, 0.6773556, -0.7296068, 1, 0, 0, 1, 1,
-0.6890202, 0.719327, 0.172148, 1, 0, 0, 1, 1,
-0.6877793, 1.583166, -0.3436663, 1, 0, 0, 1, 1,
-0.6832532, -1.015983, -1.993504, 1, 0, 0, 1, 1,
-0.6765485, 0.4795522, -3.121575, 1, 0, 0, 1, 1,
-0.6762649, 2.085751, -2.046094, 0, 0, 0, 1, 1,
-0.6734465, 1.089246, -1.675812, 0, 0, 0, 1, 1,
-0.6721281, -0.9262539, -0.8690698, 0, 0, 0, 1, 1,
-0.660392, 0.407759, -0.7478691, 0, 0, 0, 1, 1,
-0.6593832, -1.026217, -2.748925, 0, 0, 0, 1, 1,
-0.6582884, -1.411192, -1.648691, 0, 0, 0, 1, 1,
-0.6575951, 0.9552978, -1.170072, 0, 0, 0, 1, 1,
-0.6541741, 1.718311, -0.8052762, 1, 1, 1, 1, 1,
-0.6518562, 0.03831515, -1.005646, 1, 1, 1, 1, 1,
-0.6451197, -0.89288, -2.496962, 1, 1, 1, 1, 1,
-0.6448449, -0.06736933, -0.7433447, 1, 1, 1, 1, 1,
-0.6432865, -0.1034736, -1.994645, 1, 1, 1, 1, 1,
-0.6408494, 0.3172899, -1.912083, 1, 1, 1, 1, 1,
-0.6402169, 0.5788203, -1.20409, 1, 1, 1, 1, 1,
-0.6392425, 0.9746066, -0.295304, 1, 1, 1, 1, 1,
-0.6339231, -0.004508619, -1.452688, 1, 1, 1, 1, 1,
-0.6280143, 1.030849, -1.534549, 1, 1, 1, 1, 1,
-0.6270374, -1.027264, -1.655382, 1, 1, 1, 1, 1,
-0.6211288, 0.1894693, -1.976097, 1, 1, 1, 1, 1,
-0.6195151, -1.321854, -3.745703, 1, 1, 1, 1, 1,
-0.6095611, -0.06324814, -1.468222, 1, 1, 1, 1, 1,
-0.6093954, 0.224643, -1.888798, 1, 1, 1, 1, 1,
-0.6080424, 0.08175085, -2.067812, 0, 0, 1, 1, 1,
-0.6055757, 0.8484577, 1.63069, 1, 0, 0, 1, 1,
-0.6041874, 0.3715708, -1.802828, 1, 0, 0, 1, 1,
-0.5962999, 0.7365072, -1.666368, 1, 0, 0, 1, 1,
-0.5960019, -1.929719, -1.736446, 1, 0, 0, 1, 1,
-0.5959657, -1.795195, -3.16186, 1, 0, 0, 1, 1,
-0.5951501, -0.3321866, -2.587121, 0, 0, 0, 1, 1,
-0.5901462, 0.6024079, -1.970504, 0, 0, 0, 1, 1,
-0.5900697, 0.889001, -2.017838, 0, 0, 0, 1, 1,
-0.5877715, -1.474637, -3.357546, 0, 0, 0, 1, 1,
-0.5794353, 0.6082487, -1.449315, 0, 0, 0, 1, 1,
-0.5762867, -0.2979946, -3.097993, 0, 0, 0, 1, 1,
-0.5757143, -0.333529, 0.2410249, 0, 0, 0, 1, 1,
-0.5729614, -0.6735961, -2.396496, 1, 1, 1, 1, 1,
-0.5688858, -0.04351769, -1.960853, 1, 1, 1, 1, 1,
-0.568531, 0.7882687, 1.602148, 1, 1, 1, 1, 1,
-0.5668313, 0.05319567, -1.318483, 1, 1, 1, 1, 1,
-0.565068, -0.6492543, -2.786651, 1, 1, 1, 1, 1,
-0.564269, -0.5377023, -3.744594, 1, 1, 1, 1, 1,
-0.5540867, 0.1677049, -1.534022, 1, 1, 1, 1, 1,
-0.5508841, -0.44252, -2.016917, 1, 1, 1, 1, 1,
-0.5493728, 0.4302084, -1.130684, 1, 1, 1, 1, 1,
-0.546567, -1.453761, -3.314182, 1, 1, 1, 1, 1,
-0.5456177, -1.124469, -2.077013, 1, 1, 1, 1, 1,
-0.5438483, 0.2355754, -0.004858631, 1, 1, 1, 1, 1,
-0.5392036, -1.574582, -4.497572, 1, 1, 1, 1, 1,
-0.5344524, -0.01415408, -1.55997, 1, 1, 1, 1, 1,
-0.5297469, -1.414598, -2.536199, 1, 1, 1, 1, 1,
-0.5261818, 0.438934, 0.3147327, 0, 0, 1, 1, 1,
-0.5255851, 0.1633877, 0.1815519, 1, 0, 0, 1, 1,
-0.5241861, -0.05689964, -1.310079, 1, 0, 0, 1, 1,
-0.5240395, -1.000637, -1.774783, 1, 0, 0, 1, 1,
-0.5228814, -0.6466188, -1.498917, 1, 0, 0, 1, 1,
-0.5224875, -1.590205, -3.698117, 1, 0, 0, 1, 1,
-0.5155206, -0.7085935, -3.641011, 0, 0, 0, 1, 1,
-0.5154309, -0.5658055, -4.380024, 0, 0, 0, 1, 1,
-0.5148588, 0.04062008, -2.247755, 0, 0, 0, 1, 1,
-0.5120545, 1.987618, -0.1227402, 0, 0, 0, 1, 1,
-0.511377, -0.6706958, -4.212422, 0, 0, 0, 1, 1,
-0.5065795, 0.726204, 0.6503986, 0, 0, 0, 1, 1,
-0.4957362, -0.06745509, -1.601561, 0, 0, 0, 1, 1,
-0.4955629, 0.1613591, -0.6132988, 1, 1, 1, 1, 1,
-0.4921257, 0.7945439, 1.138931, 1, 1, 1, 1, 1,
-0.4862226, -1.176274, -5.174092, 1, 1, 1, 1, 1,
-0.4849728, 1.828047, -0.3739235, 1, 1, 1, 1, 1,
-0.478215, -0.3240853, -0.6655357, 1, 1, 1, 1, 1,
-0.4770363, -1.398138, -2.315562, 1, 1, 1, 1, 1,
-0.4729275, -1.707506, -1.798839, 1, 1, 1, 1, 1,
-0.4686183, 1.571255, -1.0434, 1, 1, 1, 1, 1,
-0.4652655, -0.9842541, -2.155119, 1, 1, 1, 1, 1,
-0.4635358, -0.6283709, -2.455198, 1, 1, 1, 1, 1,
-0.462128, 1.024227, -0.2731536, 1, 1, 1, 1, 1,
-0.4613565, 0.5753761, 0.6461059, 1, 1, 1, 1, 1,
-0.4612875, -0.2045869, -0.5209892, 1, 1, 1, 1, 1,
-0.4610819, -0.4755451, -2.050774, 1, 1, 1, 1, 1,
-0.4607587, -0.4643941, -1.92054, 1, 1, 1, 1, 1,
-0.4591372, -1.172554, -3.940527, 0, 0, 1, 1, 1,
-0.4557187, 0.6175461, -1.443729, 1, 0, 0, 1, 1,
-0.4488174, 1.556624, 0.4313157, 1, 0, 0, 1, 1,
-0.4476159, -0.5209785, -1.466819, 1, 0, 0, 1, 1,
-0.445249, 0.6307402, 0.9230099, 1, 0, 0, 1, 1,
-0.4430605, 0.2412098, -3.03071, 1, 0, 0, 1, 1,
-0.4407307, -0.8253171, -2.163576, 0, 0, 0, 1, 1,
-0.4355316, 0.04902358, -1.406934, 0, 0, 0, 1, 1,
-0.4331231, -0.6501899, -3.031696, 0, 0, 0, 1, 1,
-0.4318154, -1.312588, -1.255864, 0, 0, 0, 1, 1,
-0.4306468, -0.1799996, -2.029864, 0, 0, 0, 1, 1,
-0.4264692, 0.5158902, -0.5901708, 0, 0, 0, 1, 1,
-0.4256764, 0.02740405, -2.342599, 0, 0, 0, 1, 1,
-0.4236279, -1.366903, -1.197603, 1, 1, 1, 1, 1,
-0.4221492, 0.00123525, -2.003152, 1, 1, 1, 1, 1,
-0.4186123, 1.734957, 0.5743949, 1, 1, 1, 1, 1,
-0.4182136, -0.008993603, 0.43307, 1, 1, 1, 1, 1,
-0.4097821, 0.6731129, -1.330063, 1, 1, 1, 1, 1,
-0.4059954, 0.3481095, -0.06727099, 1, 1, 1, 1, 1,
-0.3982984, -0.1521811, -1.95054, 1, 1, 1, 1, 1,
-0.3962207, 1.887628, 1.699489, 1, 1, 1, 1, 1,
-0.3960224, -1.475459, -3.384179, 1, 1, 1, 1, 1,
-0.3867146, -0.6863532, -1.674026, 1, 1, 1, 1, 1,
-0.3863826, 0.1037704, -1.250701, 1, 1, 1, 1, 1,
-0.3850136, -0.372882, -2.415322, 1, 1, 1, 1, 1,
-0.3828848, 1.359037, -0.3009628, 1, 1, 1, 1, 1,
-0.3797376, -0.07302017, -2.761558, 1, 1, 1, 1, 1,
-0.3777819, -0.7487481, -3.486225, 1, 1, 1, 1, 1,
-0.3771328, 0.5850749, -1.653037, 0, 0, 1, 1, 1,
-0.3748842, -0.130637, -1.9878, 1, 0, 0, 1, 1,
-0.3673746, 0.8915785, -0.3501545, 1, 0, 0, 1, 1,
-0.364595, -0.2755708, -5.145348, 1, 0, 0, 1, 1,
-0.3612747, 1.037076, -0.8850819, 1, 0, 0, 1, 1,
-0.3414221, 2.798436, 1.11342, 1, 0, 0, 1, 1,
-0.3413078, -1.637592, -3.360466, 0, 0, 0, 1, 1,
-0.3402099, -0.8072957, -3.418354, 0, 0, 0, 1, 1,
-0.3367467, 2.862852, -0.9668868, 0, 0, 0, 1, 1,
-0.3358138, -0.7744395, -2.958238, 0, 0, 0, 1, 1,
-0.3342669, 0.5928757, -1.065811, 0, 0, 0, 1, 1,
-0.3318346, 0.2668259, -0.4170383, 0, 0, 0, 1, 1,
-0.3318169, -0.6695985, -2.535457, 0, 0, 0, 1, 1,
-0.3315866, 0.7576479, 0.0971144, 1, 1, 1, 1, 1,
-0.331003, 0.2117277, -0.7226032, 1, 1, 1, 1, 1,
-0.327222, 0.1397817, -0.8079612, 1, 1, 1, 1, 1,
-0.3249654, -0.2661185, -2.797153, 1, 1, 1, 1, 1,
-0.3245318, 0.06304558, 0.5871015, 1, 1, 1, 1, 1,
-0.3178416, 0.5206163, 0.0927797, 1, 1, 1, 1, 1,
-0.3131918, 0.2155957, -1.83467, 1, 1, 1, 1, 1,
-0.3119996, 1.793106, 0.7687411, 1, 1, 1, 1, 1,
-0.3115868, 0.02519266, -2.128088, 1, 1, 1, 1, 1,
-0.3061061, 0.3897432, -1.345114, 1, 1, 1, 1, 1,
-0.3051718, -0.4922413, -3.041569, 1, 1, 1, 1, 1,
-0.304646, 0.2673306, -0.06488676, 1, 1, 1, 1, 1,
-0.3013573, 0.4641873, -0.1632154, 1, 1, 1, 1, 1,
-0.2997578, 0.4139751, -1.13373, 1, 1, 1, 1, 1,
-0.2990044, -0.3533982, -0.2083292, 1, 1, 1, 1, 1,
-0.2968702, -0.8234692, -3.412858, 0, 0, 1, 1, 1,
-0.2968589, 0.5861416, -0.3132874, 1, 0, 0, 1, 1,
-0.2895485, 0.3087264, 0.2038906, 1, 0, 0, 1, 1,
-0.288023, -0.893189, -3.033829, 1, 0, 0, 1, 1,
-0.2877347, -0.1135308, -3.05905, 1, 0, 0, 1, 1,
-0.2782847, -0.6175243, -4.365694, 1, 0, 0, 1, 1,
-0.2641169, 0.6698163, -2.687271, 0, 0, 0, 1, 1,
-0.2613399, 1.478197, -0.1389961, 0, 0, 0, 1, 1,
-0.2568966, 0.01911195, -2.579043, 0, 0, 0, 1, 1,
-0.2536189, 0.7146869, -1.733905, 0, 0, 0, 1, 1,
-0.2536138, 0.4927293, 0.3879392, 0, 0, 0, 1, 1,
-0.2529514, -1.405836, -3.731097, 0, 0, 0, 1, 1,
-0.2515498, -0.1765878, -2.478366, 0, 0, 0, 1, 1,
-0.2507027, -0.6312293, -5.428025, 1, 1, 1, 1, 1,
-0.2490382, 0.9432787, -0.5580178, 1, 1, 1, 1, 1,
-0.2476683, -0.1741671, -2.238062, 1, 1, 1, 1, 1,
-0.2471756, 1.472308, -0.5422961, 1, 1, 1, 1, 1,
-0.2453337, 0.5093707, -1.456193, 1, 1, 1, 1, 1,
-0.2451508, 0.6644313, 0.7582276, 1, 1, 1, 1, 1,
-0.2425165, -0.01832373, -2.412751, 1, 1, 1, 1, 1,
-0.2416813, 0.03872244, -1.463418, 1, 1, 1, 1, 1,
-0.2368627, 0.3065538, 0.3735289, 1, 1, 1, 1, 1,
-0.2367227, 1.715145, -0.01817698, 1, 1, 1, 1, 1,
-0.2357585, 0.5357648, 0.7708549, 1, 1, 1, 1, 1,
-0.2344989, 0.9446301, -0.7458428, 1, 1, 1, 1, 1,
-0.230823, -0.2876792, -2.426965, 1, 1, 1, 1, 1,
-0.2307823, 1.131934, -1.282986, 1, 1, 1, 1, 1,
-0.2279298, -0.5340088, -1.93988, 1, 1, 1, 1, 1,
-0.2278738, 0.482287, 0.488136, 0, 0, 1, 1, 1,
-0.2233994, -0.2881739, -2.442065, 1, 0, 0, 1, 1,
-0.2216492, -1.537148, -2.923332, 1, 0, 0, 1, 1,
-0.2182125, 0.435605, -0.3978384, 1, 0, 0, 1, 1,
-0.217832, 2.084715, -0.2747482, 1, 0, 0, 1, 1,
-0.2137377, 1.129945, -0.06787919, 1, 0, 0, 1, 1,
-0.2086097, 0.9418803, 1.345481, 0, 0, 0, 1, 1,
-0.2077242, 0.8541799, 1.167885, 0, 0, 0, 1, 1,
-0.2076432, 1.272563, -0.6528475, 0, 0, 0, 1, 1,
-0.2054487, -1.309909, -3.79444, 0, 0, 0, 1, 1,
-0.2045626, 1.716282, -0.2026504, 0, 0, 0, 1, 1,
-0.2043047, 1.280237, -0.00680919, 0, 0, 0, 1, 1,
-0.1985289, 2.125473, -0.0473066, 0, 0, 0, 1, 1,
-0.1946003, -1.805758, -5.199509, 1, 1, 1, 1, 1,
-0.1921206, -2.084491, -3.115, 1, 1, 1, 1, 1,
-0.191925, -0.86802, -3.935803, 1, 1, 1, 1, 1,
-0.1875878, 0.5817822, -0.9974721, 1, 1, 1, 1, 1,
-0.1835224, -1.601662, -4.252272, 1, 1, 1, 1, 1,
-0.1809754, 0.313603, -1.265491, 1, 1, 1, 1, 1,
-0.1802673, 0.3182083, -0.1529843, 1, 1, 1, 1, 1,
-0.1798347, -0.2986087, -3.050915, 1, 1, 1, 1, 1,
-0.1778175, 0.246846, 1.618637, 1, 1, 1, 1, 1,
-0.1756208, -0.2449895, -3.118426, 1, 1, 1, 1, 1,
-0.1752123, -1.004033, -3.781444, 1, 1, 1, 1, 1,
-0.1736128, 0.5734097, -0.9151176, 1, 1, 1, 1, 1,
-0.1724303, -0.9557044, -5.074114, 1, 1, 1, 1, 1,
-0.1719799, 2.055806, 0.4167609, 1, 1, 1, 1, 1,
-0.1719626, -0.5264506, -1.645158, 1, 1, 1, 1, 1,
-0.1687389, -1.145989, -2.584867, 0, 0, 1, 1, 1,
-0.1674228, -1.117058, -4.233823, 1, 0, 0, 1, 1,
-0.165931, -0.407793, -1.464991, 1, 0, 0, 1, 1,
-0.1647515, 2.248653, 2.119243, 1, 0, 0, 1, 1,
-0.1598707, -1.663612, -1.866415, 1, 0, 0, 1, 1,
-0.1595556, 0.04890252, 0.3666199, 1, 0, 0, 1, 1,
-0.1543908, 1.113554, -1.133157, 0, 0, 0, 1, 1,
-0.1533776, -0.8111859, -2.028421, 0, 0, 0, 1, 1,
-0.1520037, 0.358329, -0.959667, 0, 0, 0, 1, 1,
-0.1513309, 1.217953, -0.7021388, 0, 0, 0, 1, 1,
-0.1511182, -1.392813, -4.719001, 0, 0, 0, 1, 1,
-0.1508185, -0.6187229, -3.072125, 0, 0, 0, 1, 1,
-0.1480667, 0.7419157, 0.6239881, 0, 0, 0, 1, 1,
-0.1445457, -0.06641886, -3.122391, 1, 1, 1, 1, 1,
-0.1430467, -0.7901756, -2.988868, 1, 1, 1, 1, 1,
-0.1425155, -0.3709189, -2.55026, 1, 1, 1, 1, 1,
-0.1376896, 1.321276, 1.122368, 1, 1, 1, 1, 1,
-0.1373529, 1.310029, 0.5621181, 1, 1, 1, 1, 1,
-0.1340549, -0.1056166, -3.574562, 1, 1, 1, 1, 1,
-0.1323445, -0.05762876, -1.307848, 1, 1, 1, 1, 1,
-0.1286533, 0.6920121, 0.1556431, 1, 1, 1, 1, 1,
-0.127006, 0.04879054, -1.681757, 1, 1, 1, 1, 1,
-0.1258626, 0.4210412, 1.366523, 1, 1, 1, 1, 1,
-0.1201159, 1.287444, 0.0394525, 1, 1, 1, 1, 1,
-0.1175289, 1.111295, 0.6233008, 1, 1, 1, 1, 1,
-0.1111694, 1.605735, 1.614359, 1, 1, 1, 1, 1,
-0.1072888, 0.5675829, -1.203914, 1, 1, 1, 1, 1,
-0.1037735, 0.4198827, 0.70692, 1, 1, 1, 1, 1,
-0.09834214, 2.144228, -1.68744, 0, 0, 1, 1, 1,
-0.0976914, -1.219577, -2.260419, 1, 0, 0, 1, 1,
-0.09634068, 1.434268, -1.806628, 1, 0, 0, 1, 1,
-0.09119766, 0.9161651, -0.5481842, 1, 0, 0, 1, 1,
-0.09019614, -0.4958767, -2.125581, 1, 0, 0, 1, 1,
-0.08985611, -1.463388, -3.343647, 1, 0, 0, 1, 1,
-0.08979766, -1.495888, -4.941643, 0, 0, 0, 1, 1,
-0.0868358, 1.428759, 1.473909, 0, 0, 0, 1, 1,
-0.08560568, -0.6200713, -3.028128, 0, 0, 0, 1, 1,
-0.08502951, -0.4811378, -3.714993, 0, 0, 0, 1, 1,
-0.07993782, -0.3273567, -2.393177, 0, 0, 0, 1, 1,
-0.07819657, -1.238277, -3.155455, 0, 0, 0, 1, 1,
-0.07566898, 0.381433, 0.4533972, 0, 0, 0, 1, 1,
-0.07499608, -0.1015578, -4.040083, 1, 1, 1, 1, 1,
-0.07005731, 0.3480294, 0.3649304, 1, 1, 1, 1, 1,
-0.06627578, -0.4754937, -5.162946, 1, 1, 1, 1, 1,
-0.066169, 1.005747, 2.167981, 1, 1, 1, 1, 1,
-0.06553452, -0.9269069, -3.27806, 1, 1, 1, 1, 1,
-0.06134976, -1.359654, -3.76454, 1, 1, 1, 1, 1,
-0.05987355, -0.05041012, 0.3676462, 1, 1, 1, 1, 1,
-0.05717925, 0.8625999, 2.375459, 1, 1, 1, 1, 1,
-0.0567795, 1.245512, -0.2546553, 1, 1, 1, 1, 1,
-0.05606866, 1.497468, 1.044146, 1, 1, 1, 1, 1,
-0.05548659, 0.4064236, -0.7245696, 1, 1, 1, 1, 1,
-0.05512211, 0.4655265, -1.111578, 1, 1, 1, 1, 1,
-0.05444848, 0.5436188, 0.1587888, 1, 1, 1, 1, 1,
-0.05344028, 1.209217, -0.0118138, 1, 1, 1, 1, 1,
-0.05240583, -0.6359929, -4.122788, 1, 1, 1, 1, 1,
-0.05101766, 1.674865, -0.04261281, 0, 0, 1, 1, 1,
-0.04870235, 0.1632403, 1.599627, 1, 0, 0, 1, 1,
-0.044343, 1.205514, -0.6726076, 1, 0, 0, 1, 1,
-0.04069456, 0.3314829, 0.7865089, 1, 0, 0, 1, 1,
-0.03815203, -0.2396287, -4.734854, 1, 0, 0, 1, 1,
-0.03727926, 0.7394044, -3.073914, 1, 0, 0, 1, 1,
-0.03722739, 1.321871, 0.5821838, 0, 0, 0, 1, 1,
-0.03377942, -1.043199, -4.222857, 0, 0, 0, 1, 1,
-0.03371216, -0.6107898, -4.440459, 0, 0, 0, 1, 1,
-0.02906457, 0.4562407, -2.774384, 0, 0, 0, 1, 1,
-0.02522666, 1.23263, 1.79473, 0, 0, 0, 1, 1,
-0.01593475, -0.8507356, -3.221683, 0, 0, 0, 1, 1,
-0.009959064, -0.7709669, -4.268352, 0, 0, 0, 1, 1,
-0.004917898, 1.525069, -2.281404, 1, 1, 1, 1, 1,
0.002551347, 1.752681, -0.3035099, 1, 1, 1, 1, 1,
0.004208747, 1.976933, 0.1791783, 1, 1, 1, 1, 1,
0.004369741, 1.572757, -1.30849, 1, 1, 1, 1, 1,
0.007043197, -0.7885719, 3.283823, 1, 1, 1, 1, 1,
0.0071639, 0.8912415, -0.9434439, 1, 1, 1, 1, 1,
0.01015121, -1.309558, 1.975304, 1, 1, 1, 1, 1,
0.01297232, 1.033926, 0.812277, 1, 1, 1, 1, 1,
0.01329899, -0.05840093, 1.218877, 1, 1, 1, 1, 1,
0.01346478, 0.1766701, 0.4806075, 1, 1, 1, 1, 1,
0.01360389, 1.410762, 0.5229601, 1, 1, 1, 1, 1,
0.01583187, -0.5154756, 5.466024, 1, 1, 1, 1, 1,
0.01625495, 2.631964, 0.6962308, 1, 1, 1, 1, 1,
0.01632317, -0.6129482, 3.627702, 1, 1, 1, 1, 1,
0.02001068, 1.554205, 1.008168, 1, 1, 1, 1, 1,
0.02247431, 0.1630029, -0.9083668, 0, 0, 1, 1, 1,
0.02477254, 2.185873, -1.459602, 1, 0, 0, 1, 1,
0.03148383, 1.395126, 0.2386323, 1, 0, 0, 1, 1,
0.03457972, 0.832583, 2.278345, 1, 0, 0, 1, 1,
0.03837645, 0.02604544, -1.152709, 1, 0, 0, 1, 1,
0.04139742, -1.313891, 1.487825, 1, 0, 0, 1, 1,
0.04150243, 0.03554521, -0.3608474, 0, 0, 0, 1, 1,
0.04273593, -1.428033, 3.669113, 0, 0, 0, 1, 1,
0.05162392, 0.112519, -1.833631, 0, 0, 0, 1, 1,
0.06007514, 0.3701874, 0.3412108, 0, 0, 0, 1, 1,
0.06221589, -1.012353, 1.310672, 0, 0, 0, 1, 1,
0.06341817, 0.4685284, 1.288676, 0, 0, 0, 1, 1,
0.06353345, 2.171645, -0.517499, 0, 0, 0, 1, 1,
0.06367632, -0.3522707, 2.462415, 1, 1, 1, 1, 1,
0.06543675, 0.3909048, 0.7199178, 1, 1, 1, 1, 1,
0.0673787, -0.9781155, 3.404231, 1, 1, 1, 1, 1,
0.0688336, -0.1225786, 1.177387, 1, 1, 1, 1, 1,
0.07128035, 0.2486612, 0.1535524, 1, 1, 1, 1, 1,
0.07386427, -0.1680004, 3.437727, 1, 1, 1, 1, 1,
0.07596602, 0.9175785, -1.051972, 1, 1, 1, 1, 1,
0.07807591, -0.2505693, 2.516682, 1, 1, 1, 1, 1,
0.08348858, -0.1026706, 2.022698, 1, 1, 1, 1, 1,
0.084327, -0.4368673, 2.508011, 1, 1, 1, 1, 1,
0.08603158, 1.072848, 0.5480381, 1, 1, 1, 1, 1,
0.08712975, 0.6567641, 0.04195442, 1, 1, 1, 1, 1,
0.08974233, 0.6891375, -1.772492, 1, 1, 1, 1, 1,
0.09067225, -0.2061736, 1.460536, 1, 1, 1, 1, 1,
0.102033, -0.3526464, 2.426674, 1, 1, 1, 1, 1,
0.103626, 0.5687958, 1.465507, 0, 0, 1, 1, 1,
0.1074151, -0.04463581, 0.6744299, 1, 0, 0, 1, 1,
0.1162442, -0.9699115, 4.085598, 1, 0, 0, 1, 1,
0.1194198, 1.334023, 0.4152473, 1, 0, 0, 1, 1,
0.1208335, -2.053614, 2.396719, 1, 0, 0, 1, 1,
0.1245362, -0.8531953, 3.701994, 1, 0, 0, 1, 1,
0.1273373, -0.210724, 3.088024, 0, 0, 0, 1, 1,
0.1276318, 0.3172543, 1.318174, 0, 0, 0, 1, 1,
0.1280075, -0.3560322, 2.652385, 0, 0, 0, 1, 1,
0.130321, -0.1901332, 3.172109, 0, 0, 0, 1, 1,
0.1374625, 1.118196, 0.106753, 0, 0, 0, 1, 1,
0.1377596, -2.467811, 2.335749, 0, 0, 0, 1, 1,
0.139728, 1.153186, 1.21063, 0, 0, 0, 1, 1,
0.1429885, -0.3989618, 2.737798, 1, 1, 1, 1, 1,
0.1452526, 1.668685, -0.04827305, 1, 1, 1, 1, 1,
0.154862, 0.8438021, 1.581223, 1, 1, 1, 1, 1,
0.1568673, 0.06027998, 0.6485891, 1, 1, 1, 1, 1,
0.1571111, 0.8100935, -1.287391, 1, 1, 1, 1, 1,
0.1583139, 0.4520089, -2.018434, 1, 1, 1, 1, 1,
0.1606308, -0.6000472, 1.278127, 1, 1, 1, 1, 1,
0.1628566, 1.215999, 1.037379, 1, 1, 1, 1, 1,
0.1635092, -1.223483, 2.235209, 1, 1, 1, 1, 1,
0.1697269, -0.8168175, 2.512212, 1, 1, 1, 1, 1,
0.1709816, -0.0009631161, 2.116309, 1, 1, 1, 1, 1,
0.1771207, 1.153402, -0.9335861, 1, 1, 1, 1, 1,
0.18272, -0.3009598, 2.020359, 1, 1, 1, 1, 1,
0.1875584, -0.2462281, 0.8657133, 1, 1, 1, 1, 1,
0.1900384, -1.089231, 2.897312, 1, 1, 1, 1, 1,
0.1916204, -0.6022887, 3.203562, 0, 0, 1, 1, 1,
0.1917201, 0.3120573, 2.90242, 1, 0, 0, 1, 1,
0.1920296, -0.09696552, 2.650689, 1, 0, 0, 1, 1,
0.1920723, -1.264398, 2.472705, 1, 0, 0, 1, 1,
0.1956774, 0.7588992, 1.337097, 1, 0, 0, 1, 1,
0.1978825, 0.1721512, 1.039619, 1, 0, 0, 1, 1,
0.1989687, -0.2773476, 3.339663, 0, 0, 0, 1, 1,
0.2052951, 0.2535685, 2.204887, 0, 0, 0, 1, 1,
0.2069369, 1.505376, 0.08455738, 0, 0, 0, 1, 1,
0.2096972, 0.2582633, 1.50218, 0, 0, 0, 1, 1,
0.211443, -0.2681421, 1.547702, 0, 0, 0, 1, 1,
0.2163, -0.8183481, 2.810344, 0, 0, 0, 1, 1,
0.2259616, 0.965674, -0.576331, 0, 0, 0, 1, 1,
0.2275698, -0.06511002, 1.858727, 1, 1, 1, 1, 1,
0.2346429, 0.6708619, 0.6852964, 1, 1, 1, 1, 1,
0.2357954, 0.7374769, -1.404773, 1, 1, 1, 1, 1,
0.241953, -0.9830875, 3.563864, 1, 1, 1, 1, 1,
0.2419633, 0.824012, -1.165957, 1, 1, 1, 1, 1,
0.2528068, 1.382145, 0.3562641, 1, 1, 1, 1, 1,
0.2563335, -0.5775697, 3.012345, 1, 1, 1, 1, 1,
0.2566477, -0.8007533, 4.180806, 1, 1, 1, 1, 1,
0.2591481, 1.334734, -0.7026369, 1, 1, 1, 1, 1,
0.2610069, 0.1897842, 1.784627, 1, 1, 1, 1, 1,
0.2690907, -0.4195461, 0.8782824, 1, 1, 1, 1, 1,
0.2697691, -1.078001, 3.889005, 1, 1, 1, 1, 1,
0.2721818, -0.1320027, 1.660318, 1, 1, 1, 1, 1,
0.2744704, -1.180586, 2.578503, 1, 1, 1, 1, 1,
0.2765454, 1.348711, 1.616682, 1, 1, 1, 1, 1,
0.2797636, -1.702991, 2.845698, 0, 0, 1, 1, 1,
0.2805451, -0.2234404, 0.8915934, 1, 0, 0, 1, 1,
0.281444, -0.6244108, 2.272902, 1, 0, 0, 1, 1,
0.2870823, 0.6896343, 0.6387131, 1, 0, 0, 1, 1,
0.2887098, -0.02921151, 0.6877781, 1, 0, 0, 1, 1,
0.289001, -0.3408163, 2.67183, 1, 0, 0, 1, 1,
0.2919662, -0.5755559, 4.364468, 0, 0, 0, 1, 1,
0.2928063, -1.057819, 3.293071, 0, 0, 0, 1, 1,
0.2980947, -0.9500118, 1.591501, 0, 0, 0, 1, 1,
0.3011717, 0.1401017, 1.248994, 0, 0, 0, 1, 1,
0.3037973, 1.324993, 1.285222, 0, 0, 0, 1, 1,
0.305351, -1.992221, 2.328389, 0, 0, 0, 1, 1,
0.3068711, 0.3724982, 0.00647855, 0, 0, 0, 1, 1,
0.3112863, -0.06138551, 1.74543, 1, 1, 1, 1, 1,
0.3159506, -1.206046, 2.236572, 1, 1, 1, 1, 1,
0.3216186, -0.5878896, 3.263048, 1, 1, 1, 1, 1,
0.3321464, -0.1010608, 1.19966, 1, 1, 1, 1, 1,
0.3331265, -1.014951, 2.335772, 1, 1, 1, 1, 1,
0.3331526, -0.7068188, 4.231032, 1, 1, 1, 1, 1,
0.3352282, -1.580963, 2.57161, 1, 1, 1, 1, 1,
0.3389642, 0.09262897, 2.642985, 1, 1, 1, 1, 1,
0.3390864, -0.7213792, 3.534378, 1, 1, 1, 1, 1,
0.3427829, -0.7992108, 4.49837, 1, 1, 1, 1, 1,
0.3465391, -1.785242, 2.313968, 1, 1, 1, 1, 1,
0.3486631, 1.254885, 1.772797, 1, 1, 1, 1, 1,
0.350559, 1.022818, -0.1817298, 1, 1, 1, 1, 1,
0.3534773, -0.1856392, 2.240374, 1, 1, 1, 1, 1,
0.3581935, 1.280629, 0.3490563, 1, 1, 1, 1, 1,
0.3644416, 0.03364552, 1.368893, 0, 0, 1, 1, 1,
0.3653208, -1.223859, 3.415674, 1, 0, 0, 1, 1,
0.3658476, -0.7623613, 3.107354, 1, 0, 0, 1, 1,
0.3683442, -1.018309, 2.201317, 1, 0, 0, 1, 1,
0.3692683, -0.4142085, 1.718772, 1, 0, 0, 1, 1,
0.3711234, -1.224224, 3.72473, 1, 0, 0, 1, 1,
0.3777688, -0.9555106, 1.870307, 0, 0, 0, 1, 1,
0.3787781, -0.6717847, 2.250147, 0, 0, 0, 1, 1,
0.3840929, 1.872293, 1.274331, 0, 0, 0, 1, 1,
0.3871293, -0.7365671, 2.354064, 0, 0, 0, 1, 1,
0.3887109, 0.04773428, 1.256078, 0, 0, 0, 1, 1,
0.3899594, 1.608451, 0.1880098, 0, 0, 0, 1, 1,
0.3908774, -0.855738, 3.625694, 0, 0, 0, 1, 1,
0.394879, 0.7397489, 0.1854502, 1, 1, 1, 1, 1,
0.4042954, -1.052222, 2.813042, 1, 1, 1, 1, 1,
0.40479, 0.7333924, 0.7445982, 1, 1, 1, 1, 1,
0.4074609, -0.6366261, 1.940561, 1, 1, 1, 1, 1,
0.4106223, 0.1850442, -0.5147238, 1, 1, 1, 1, 1,
0.4122467, -0.1124398, 2.68442, 1, 1, 1, 1, 1,
0.413399, -0.9417785, 3.778961, 1, 1, 1, 1, 1,
0.416934, -0.09773, -1.105521, 1, 1, 1, 1, 1,
0.4214328, 0.9868965, 0.5066289, 1, 1, 1, 1, 1,
0.4273564, 0.6688007, 1.689039, 1, 1, 1, 1, 1,
0.4277835, -0.5680503, 2.931799, 1, 1, 1, 1, 1,
0.4320216, -3.32766, 1.573344, 1, 1, 1, 1, 1,
0.4336853, -0.5132375, 0.959471, 1, 1, 1, 1, 1,
0.4377742, -1.039083, 2.546348, 1, 1, 1, 1, 1,
0.439981, 0.949218, 1.69686, 1, 1, 1, 1, 1,
0.4417169, 0.585229, 1.295855, 0, 0, 1, 1, 1,
0.4431464, 1.359268, -0.7849773, 1, 0, 0, 1, 1,
0.4458511, -0.107108, 2.375052, 1, 0, 0, 1, 1,
0.4462169, 1.218103, -1.071005, 1, 0, 0, 1, 1,
0.4502231, 0.2557468, 2.288696, 1, 0, 0, 1, 1,
0.453996, -0.5707858, 1.106835, 1, 0, 0, 1, 1,
0.4545506, -0.6343148, 3.894514, 0, 0, 0, 1, 1,
0.4564371, -0.2653035, 2.144493, 0, 0, 0, 1, 1,
0.4680174, -0.6289972, 0.4636949, 0, 0, 0, 1, 1,
0.4715625, 0.4936205, -0.506819, 0, 0, 0, 1, 1,
0.4781682, 0.5000849, 1.528253, 0, 0, 0, 1, 1,
0.4787711, 0.9802773, 1.555676, 0, 0, 0, 1, 1,
0.4812644, 2.347944, 0.3386251, 0, 0, 0, 1, 1,
0.4872254, -1.227045, 2.025643, 1, 1, 1, 1, 1,
0.4892201, -1.087237, 4.043997, 1, 1, 1, 1, 1,
0.4898462, 1.816167, -1.089591, 1, 1, 1, 1, 1,
0.4942845, 0.7827995, -1.847893, 1, 1, 1, 1, 1,
0.4944516, 0.2431191, -0.3840705, 1, 1, 1, 1, 1,
0.4951091, -0.9045366, 3.954166, 1, 1, 1, 1, 1,
0.4954478, -1.046212, 3.689209, 1, 1, 1, 1, 1,
0.4981687, 1.09583, 0.4314752, 1, 1, 1, 1, 1,
0.4991844, 1.355977, 1.647514, 1, 1, 1, 1, 1,
0.5009032, -0.8374493, 1.818116, 1, 1, 1, 1, 1,
0.5010137, 1.156336, 0.04734235, 1, 1, 1, 1, 1,
0.5032991, -1.300382, 1.679431, 1, 1, 1, 1, 1,
0.5037313, -0.001008878, 1.200092, 1, 1, 1, 1, 1,
0.5095896, 1.208367, 1.888165, 1, 1, 1, 1, 1,
0.5100557, -0.1737442, 2.058301, 1, 1, 1, 1, 1,
0.5118374, -0.4875665, 4.348707, 0, 0, 1, 1, 1,
0.5161738, -0.3037463, 1.09646, 1, 0, 0, 1, 1,
0.5206485, 1.296034, 0.2860364, 1, 0, 0, 1, 1,
0.5220788, -0.3219083, 2.911756, 1, 0, 0, 1, 1,
0.5222186, -0.07005762, 1.89372, 1, 0, 0, 1, 1,
0.5227214, 0.245352, -0.8196486, 1, 0, 0, 1, 1,
0.5256441, 2.302526, 0.4627014, 0, 0, 0, 1, 1,
0.5279882, -1.995913, 3.997061, 0, 0, 0, 1, 1,
0.5283163, -0.8543919, 2.465614, 0, 0, 0, 1, 1,
0.5286546, -0.7303555, 2.760912, 0, 0, 0, 1, 1,
0.5300322, 0.7182238, 2.442019, 0, 0, 0, 1, 1,
0.5332175, -0.09430867, 4.124346, 0, 0, 0, 1, 1,
0.5335311, 0.858778, -0.1676436, 0, 0, 0, 1, 1,
0.5348503, 0.6627001, 1.521225, 1, 1, 1, 1, 1,
0.5349658, -2.026487, 3.648454, 1, 1, 1, 1, 1,
0.5390061, 1.308923, 1.529089, 1, 1, 1, 1, 1,
0.5440983, 0.6260076, 1.569433, 1, 1, 1, 1, 1,
0.5463727, 0.4708947, -0.463234, 1, 1, 1, 1, 1,
0.5477046, -0.9215596, 1.335769, 1, 1, 1, 1, 1,
0.5478873, 0.8748264, 3.802136, 1, 1, 1, 1, 1,
0.5520419, -0.1518333, 0.1737283, 1, 1, 1, 1, 1,
0.5554634, 2.060244, -1.059941, 1, 1, 1, 1, 1,
0.5571196, 0.09300611, 2.060227, 1, 1, 1, 1, 1,
0.5572096, 0.3416522, 0.6052951, 1, 1, 1, 1, 1,
0.5621003, 0.3575759, 0.339113, 1, 1, 1, 1, 1,
0.5628758, 0.4745064, 0.9308892, 1, 1, 1, 1, 1,
0.5727661, -1.390207, 1.249955, 1, 1, 1, 1, 1,
0.5770174, -0.7151032, 2.643348, 1, 1, 1, 1, 1,
0.5813951, 0.8294082, 1.640319, 0, 0, 1, 1, 1,
0.5827865, -0.9204825, 3.729804, 1, 0, 0, 1, 1,
0.5841751, 0.7607734, 0.5277218, 1, 0, 0, 1, 1,
0.586912, -1.093557, 3.193458, 1, 0, 0, 1, 1,
0.5871326, -1.640902, 2.894676, 1, 0, 0, 1, 1,
0.5914759, 0.1011244, 2.843047, 1, 0, 0, 1, 1,
0.5920264, 1.072039, -0.8122923, 0, 0, 0, 1, 1,
0.5937492, -1.21708, 4.188054, 0, 0, 0, 1, 1,
0.5999115, 0.4928542, 0.6017588, 0, 0, 0, 1, 1,
0.5999858, 0.7274685, 2.155297, 0, 0, 0, 1, 1,
0.6004107, 0.8642726, -0.2145101, 0, 0, 0, 1, 1,
0.6153505, 0.5422388, 1.439018, 0, 0, 0, 1, 1,
0.6162351, 0.7620859, 1.297094, 0, 0, 0, 1, 1,
0.6192145, -0.7123619, 2.677201, 1, 1, 1, 1, 1,
0.6246063, -0.1677723, 2.041486, 1, 1, 1, 1, 1,
0.6334049, 0.0938635, 2.159271, 1, 1, 1, 1, 1,
0.6343622, -0.3982513, 1.009955, 1, 1, 1, 1, 1,
0.6347556, 0.3099729, -0.9118727, 1, 1, 1, 1, 1,
0.6367365, 0.1915702, 1.943009, 1, 1, 1, 1, 1,
0.6368477, -0.1503575, 1.833838, 1, 1, 1, 1, 1,
0.6394864, -1.50959, 3.108862, 1, 1, 1, 1, 1,
0.6400493, 0.08145474, 1.098153, 1, 1, 1, 1, 1,
0.6437068, 0.1287057, 0.6932942, 1, 1, 1, 1, 1,
0.6456161, -1.248376, 4.608826, 1, 1, 1, 1, 1,
0.6468401, 1.437291, 1.816654, 1, 1, 1, 1, 1,
0.6479312, -0.02271902, 4.407854, 1, 1, 1, 1, 1,
0.6527993, 0.8350712, 0.623961, 1, 1, 1, 1, 1,
0.663466, 0.4947972, -1.272938, 1, 1, 1, 1, 1,
0.6636384, 0.2256724, 3.017829, 0, 0, 1, 1, 1,
0.6781741, 0.9227534, 0.5162024, 1, 0, 0, 1, 1,
0.6785505, 0.8800205, 1.577747, 1, 0, 0, 1, 1,
0.6798518, 1.214096, 1.165089, 1, 0, 0, 1, 1,
0.6835164, -0.610679, 4.016315, 1, 0, 0, 1, 1,
0.6870022, -0.950179, 1.5792, 1, 0, 0, 1, 1,
0.7029467, 1.240079, -1.175698, 0, 0, 0, 1, 1,
0.704892, -0.2695985, 1.028299, 0, 0, 0, 1, 1,
0.7069469, -0.9600529, 1.697872, 0, 0, 0, 1, 1,
0.7147123, 2.133952, 0.816136, 0, 0, 0, 1, 1,
0.7169644, -0.5667397, 1.682287, 0, 0, 0, 1, 1,
0.7237265, -0.6990588, 0.2309326, 0, 0, 0, 1, 1,
0.7237505, -2.511123, 3.263515, 0, 0, 0, 1, 1,
0.7285474, 0.7819773, 1.232596, 1, 1, 1, 1, 1,
0.7289937, -1.573568, 3.474996, 1, 1, 1, 1, 1,
0.7334666, 1.444743, -0.04519243, 1, 1, 1, 1, 1,
0.7338936, 0.07931804, 2.078124, 1, 1, 1, 1, 1,
0.7397442, 0.9774557, 0.1861465, 1, 1, 1, 1, 1,
0.7446726, -0.5344965, 0.6934556, 1, 1, 1, 1, 1,
0.7459073, -0.07623103, 1.76867, 1, 1, 1, 1, 1,
0.7629561, 1.545564, -0.0156254, 1, 1, 1, 1, 1,
0.7636285, -0.7101352, 0.648003, 1, 1, 1, 1, 1,
0.7637321, -0.4560651, 3.622089, 1, 1, 1, 1, 1,
0.7689101, 1.908412, 1.991662, 1, 1, 1, 1, 1,
0.7781157, 0.1134475, 1.333222, 1, 1, 1, 1, 1,
0.7846314, -0.7437243, 2.365373, 1, 1, 1, 1, 1,
0.7878889, 0.2474677, 0.7888772, 1, 1, 1, 1, 1,
0.792031, 1.801054, -0.1896462, 1, 1, 1, 1, 1,
0.7937605, 0.2515981, 2.611229, 0, 0, 1, 1, 1,
0.794922, 1.15543, 1.539335, 1, 0, 0, 1, 1,
0.8025463, 1.870616, 0.6048262, 1, 0, 0, 1, 1,
0.806094, 0.4369661, 0.6977559, 1, 0, 0, 1, 1,
0.8088608, -0.8637384, 0.9935948, 1, 0, 0, 1, 1,
0.8145999, -0.4651279, 3.483696, 1, 0, 0, 1, 1,
0.81614, -0.2591742, 2.488351, 0, 0, 0, 1, 1,
0.8162432, 0.7384143, 0.623989, 0, 0, 0, 1, 1,
0.8181493, 1.803277, 1.085528, 0, 0, 0, 1, 1,
0.8187215, 0.0972157, 2.039078, 0, 0, 0, 1, 1,
0.8204286, 0.2569419, -1.909217, 0, 0, 0, 1, 1,
0.8239041, -0.3014606, 2.423323, 0, 0, 0, 1, 1,
0.8253349, -1.679568, 3.082633, 0, 0, 0, 1, 1,
0.8262022, -0.2368847, 2.777409, 1, 1, 1, 1, 1,
0.8270848, -1.095834, 2.127385, 1, 1, 1, 1, 1,
0.8271434, -0.0712278, 0.393222, 1, 1, 1, 1, 1,
0.8284444, -0.7242553, 4.130816, 1, 1, 1, 1, 1,
0.8297013, -0.2377145, 2.066847, 1, 1, 1, 1, 1,
0.8312654, -1.28705, 1.955559, 1, 1, 1, 1, 1,
0.8347898, -0.2461524, 1.991851, 1, 1, 1, 1, 1,
0.834977, -0.9416457, 2.8132, 1, 1, 1, 1, 1,
0.8400546, 0.1035692, 2.730673, 1, 1, 1, 1, 1,
0.8402454, 0.7744163, 1.463395, 1, 1, 1, 1, 1,
0.8447378, -0.05408233, 0.03792103, 1, 1, 1, 1, 1,
0.8448913, -0.3450907, 0.6221835, 1, 1, 1, 1, 1,
0.8486029, 0.03724007, 2.017365, 1, 1, 1, 1, 1,
0.8486257, -1.701414, 2.042294, 1, 1, 1, 1, 1,
0.8529254, -0.4358497, 0.5463715, 1, 1, 1, 1, 1,
0.8538749, -0.5154787, 2.588824, 0, 0, 1, 1, 1,
0.8539837, 0.3613905, -0.3957881, 1, 0, 0, 1, 1,
0.8540909, 0.04253177, 0.8117646, 1, 0, 0, 1, 1,
0.8567786, 0.06691019, 0.3774331, 1, 0, 0, 1, 1,
0.8709074, 0.4599223, 1.816118, 1, 0, 0, 1, 1,
0.8722571, -0.1879193, 0.4768973, 1, 0, 0, 1, 1,
0.872454, 0.7075962, 1.119066, 0, 0, 0, 1, 1,
0.8730101, -0.9440199, 2.835982, 0, 0, 0, 1, 1,
0.8759168, 1.156144, 1.710341, 0, 0, 0, 1, 1,
0.8788061, -0.3287115, 3.088797, 0, 0, 0, 1, 1,
0.879483, -0.4969753, 2.118613, 0, 0, 0, 1, 1,
0.881431, -1.006342, 2.519963, 0, 0, 0, 1, 1,
0.8879231, 1.275509, 0.02351274, 0, 0, 0, 1, 1,
0.889203, -1.561278, 3.20592, 1, 1, 1, 1, 1,
0.8902546, -1.383558, -0.3205081, 1, 1, 1, 1, 1,
0.890523, -1.518434, 1.799828, 1, 1, 1, 1, 1,
0.8910511, -0.2139348, 0.9904463, 1, 1, 1, 1, 1,
0.9033701, 1.176592, 1.149998, 1, 1, 1, 1, 1,
0.9119377, 1.172293, 1.132686, 1, 1, 1, 1, 1,
0.9133693, 3.071293, 0.1633104, 1, 1, 1, 1, 1,
0.9142342, 0.3217191, 1.197635, 1, 1, 1, 1, 1,
0.9195322, -2.106736, 5.266316, 1, 1, 1, 1, 1,
0.9197959, -0.7495093, 2.460125, 1, 1, 1, 1, 1,
0.9290392, -0.9901552, 1.093434, 1, 1, 1, 1, 1,
0.9298871, -1.836335, 3.568694, 1, 1, 1, 1, 1,
0.9307144, 0.6973515, 2.553323, 1, 1, 1, 1, 1,
0.9338691, 0.5860207, 1.811589, 1, 1, 1, 1, 1,
0.9343008, -0.8122694, 4.474413, 1, 1, 1, 1, 1,
0.9377357, 0.2644899, 1.525228, 0, 0, 1, 1, 1,
0.9382788, -0.5850976, 2.38379, 1, 0, 0, 1, 1,
0.9394437, 0.9862621, -0.5027632, 1, 0, 0, 1, 1,
0.9402128, -1.365989, 1.242635, 1, 0, 0, 1, 1,
0.9418398, -2.169861, 2.869291, 1, 0, 0, 1, 1,
0.9429061, 0.2678811, 1.354272, 1, 0, 0, 1, 1,
0.9511636, 2.168729, 1.076311, 0, 0, 0, 1, 1,
0.9634346, -1.993389, 2.05579, 0, 0, 0, 1, 1,
0.9656869, -0.7660109, 2.41679, 0, 0, 0, 1, 1,
0.9668492, -1.144365, 1.022812, 0, 0, 0, 1, 1,
0.9671808, -1.189719, 1.882447, 0, 0, 0, 1, 1,
0.9683912, 1.275229, 0.4435635, 0, 0, 0, 1, 1,
0.9791412, -1.134143, 2.482383, 0, 0, 0, 1, 1,
0.9798239, 2.247451, 1.359718, 1, 1, 1, 1, 1,
0.980083, -0.2011019, 1.063017, 1, 1, 1, 1, 1,
0.9858262, 0.844636, -0.224016, 1, 1, 1, 1, 1,
0.9877332, 1.385038, 1.47448, 1, 1, 1, 1, 1,
0.990567, 0.38272, 1.571637, 1, 1, 1, 1, 1,
0.9938058, -1.515402, 1.704821, 1, 1, 1, 1, 1,
0.9945, 2.0757, 1.243355, 1, 1, 1, 1, 1,
0.9966589, 0.6049492, 0.7513385, 1, 1, 1, 1, 1,
0.9994391, 0.3770864, -0.5154489, 1, 1, 1, 1, 1,
1.001026, 0.09904768, 1.989728, 1, 1, 1, 1, 1,
1.001559, -0.1692498, 2.695929, 1, 1, 1, 1, 1,
1.010472, -0.4907502, 1.84686, 1, 1, 1, 1, 1,
1.012674, 1.289995, 1.700575, 1, 1, 1, 1, 1,
1.015564, -0.4184747, 2.414018, 1, 1, 1, 1, 1,
1.018401, 1.722312, -1.860613, 1, 1, 1, 1, 1,
1.02044, -1.334042, 0.9353193, 0, 0, 1, 1, 1,
1.022528, -0.01146435, 0.5829981, 1, 0, 0, 1, 1,
1.025152, -1.18879, 2.941595, 1, 0, 0, 1, 1,
1.03522, -0.3896941, 2.092066, 1, 0, 0, 1, 1,
1.046009, 0.2132325, 1.434708, 1, 0, 0, 1, 1,
1.049593, 1.748562, 0.554437, 1, 0, 0, 1, 1,
1.056109, 1.477795, -1.688085, 0, 0, 0, 1, 1,
1.067486, -0.5970017, 1.641593, 0, 0, 0, 1, 1,
1.084204, -0.6516714, 1.566947, 0, 0, 0, 1, 1,
1.089665, 0.232169, 2.962284, 0, 0, 0, 1, 1,
1.091803, -0.226266, -0.1256333, 0, 0, 0, 1, 1,
1.097709, -1.184692, 0.7966946, 0, 0, 0, 1, 1,
1.110578, 0.9355955, 1.90149, 0, 0, 0, 1, 1,
1.11127, -0.9360581, 2.742577, 1, 1, 1, 1, 1,
1.111875, 0.2612914, 2.378065, 1, 1, 1, 1, 1,
1.123034, 0.0482988, 0.7867375, 1, 1, 1, 1, 1,
1.130317, -0.3433152, 2.765101, 1, 1, 1, 1, 1,
1.139687, -1.123932, 2.270674, 1, 1, 1, 1, 1,
1.1559, 0.2935495, 1.49538, 1, 1, 1, 1, 1,
1.164343, -1.39248, 1.981655, 1, 1, 1, 1, 1,
1.165581, 1.964067, 0.5362028, 1, 1, 1, 1, 1,
1.166167, 0.4151793, 2.219955, 1, 1, 1, 1, 1,
1.16717, 1.292186, -1.005303, 1, 1, 1, 1, 1,
1.180884, -0.3007602, 3.269284, 1, 1, 1, 1, 1,
1.180953, -0.01969472, 2.105945, 1, 1, 1, 1, 1,
1.182419, 0.1654421, 0.8936506, 1, 1, 1, 1, 1,
1.185112, 0.4792148, -0.4092675, 1, 1, 1, 1, 1,
1.191204, 0.6895576, 0.242562, 1, 1, 1, 1, 1,
1.204818, 0.1700203, 3.319335, 0, 0, 1, 1, 1,
1.217295, -0.4438197, 3.006221, 1, 0, 0, 1, 1,
1.22702, -0.4077688, 1.765476, 1, 0, 0, 1, 1,
1.229075, -0.1292945, 1.412396, 1, 0, 0, 1, 1,
1.237688, 0.3078084, 1.324037, 1, 0, 0, 1, 1,
1.239204, -0.2098529, 0.9451696, 1, 0, 0, 1, 1,
1.24314, -1.960446, 4.151026, 0, 0, 0, 1, 1,
1.243885, -1.171973, 1.635535, 0, 0, 0, 1, 1,
1.252052, -1.165277, 2.298706, 0, 0, 0, 1, 1,
1.252829, 0.6861621, -0.3348882, 0, 0, 0, 1, 1,
1.261556, 0.9194286, 2.34124, 0, 0, 0, 1, 1,
1.26163, -0.06617338, 1.942752, 0, 0, 0, 1, 1,
1.2776, -1.385241, 2.018555, 0, 0, 0, 1, 1,
1.283689, 0.2455194, 1.40688, 1, 1, 1, 1, 1,
1.29128, 0.3235564, 2.018673, 1, 1, 1, 1, 1,
1.295955, -1.424043, 3.895751, 1, 1, 1, 1, 1,
1.296736, -1.010379, 3.567347, 1, 1, 1, 1, 1,
1.308695, -2.417502, 2.866741, 1, 1, 1, 1, 1,
1.328174, -1.461652, 2.317743, 1, 1, 1, 1, 1,
1.330682, 0.7688174, 2.472187, 1, 1, 1, 1, 1,
1.334376, -0.712282, 0.459976, 1, 1, 1, 1, 1,
1.343784, 0.6798348, 0.6313235, 1, 1, 1, 1, 1,
1.3491, -0.06721549, 1.523624, 1, 1, 1, 1, 1,
1.365988, 1.054112, -0.3776072, 1, 1, 1, 1, 1,
1.367644, -0.9925939, 2.240009, 1, 1, 1, 1, 1,
1.369128, -1.054171, 2.215748, 1, 1, 1, 1, 1,
1.396338, 0.5079362, 0.2579605, 1, 1, 1, 1, 1,
1.41167, 1.385895, 0.5285, 1, 1, 1, 1, 1,
1.417485, 0.2696099, 2.451436, 0, 0, 1, 1, 1,
1.421246, -0.4201833, 3.158339, 1, 0, 0, 1, 1,
1.425745, -0.07570954, 0.1208025, 1, 0, 0, 1, 1,
1.426717, 1.956761, -0.3443126, 1, 0, 0, 1, 1,
1.438077, -2.726023, 2.715093, 1, 0, 0, 1, 1,
1.445949, -1.026989, 1.600239, 1, 0, 0, 1, 1,
1.465988, -0.2987357, 2.764986, 0, 0, 0, 1, 1,
1.470496, -0.3153925, 2.190325, 0, 0, 0, 1, 1,
1.471969, -0.4028836, -0.8802204, 0, 0, 0, 1, 1,
1.474505, -0.130725, 1.701905, 0, 0, 0, 1, 1,
1.476087, -0.6577262, 0.7858663, 0, 0, 0, 1, 1,
1.480771, 1.303941, 1.685519, 0, 0, 0, 1, 1,
1.509383, -0.4156252, -0.5190092, 0, 0, 0, 1, 1,
1.524994, 1.043366, 2.281921, 1, 1, 1, 1, 1,
1.539725, -0.7777792, 1.922692, 1, 1, 1, 1, 1,
1.563624, 0.3209699, -1.129178, 1, 1, 1, 1, 1,
1.578506, 0.5666944, 1.294013, 1, 1, 1, 1, 1,
1.581932, -0.09570289, 0.6975871, 1, 1, 1, 1, 1,
1.587906, -1.146616, 1.416273, 1, 1, 1, 1, 1,
1.590253, 1.749286, 0.02791858, 1, 1, 1, 1, 1,
1.6067, 2.062393, 2.174309, 1, 1, 1, 1, 1,
1.617104, -0.7100798, 1.594001, 1, 1, 1, 1, 1,
1.61759, 2.363275, -0.09290335, 1, 1, 1, 1, 1,
1.619746, -0.2128412, 0.7135103, 1, 1, 1, 1, 1,
1.627006, 0.4664394, 0.4312902, 1, 1, 1, 1, 1,
1.632201, 0.8612313, -0.01594448, 1, 1, 1, 1, 1,
1.641542, 0.07791258, 0.5171677, 1, 1, 1, 1, 1,
1.648112, 0.846648, 2.548557, 1, 1, 1, 1, 1,
1.653386, 2.007919, 0.3573656, 0, 0, 1, 1, 1,
1.66455, -0.3342126, 1.312477, 1, 0, 0, 1, 1,
1.681312, -0.5737104, -0.6544009, 1, 0, 0, 1, 1,
1.694473, 0.3614415, 2.347376, 1, 0, 0, 1, 1,
1.698058, -0.1466455, 2.147185, 1, 0, 0, 1, 1,
1.708954, -0.693358, 2.488094, 1, 0, 0, 1, 1,
1.710943, 1.13656, 0.4648414, 0, 0, 0, 1, 1,
1.716486, -1.725622, 1.823932, 0, 0, 0, 1, 1,
1.720477, -1.338652, 3.277891, 0, 0, 0, 1, 1,
1.727706, 0.4273431, 0.6638532, 0, 0, 0, 1, 1,
1.739068, -1.235483, 1.832502, 0, 0, 0, 1, 1,
1.773366, 0.1762841, 2.820954, 0, 0, 0, 1, 1,
1.785799, -2.18149, 0.9124267, 0, 0, 0, 1, 1,
1.798863, 1.011232, 2.403736, 1, 1, 1, 1, 1,
1.840436, 0.2656991, -0.2900903, 1, 1, 1, 1, 1,
1.856263, -0.01651978, 2.4181, 1, 1, 1, 1, 1,
1.892901, -0.06536202, 2.009571, 1, 1, 1, 1, 1,
1.895114, -0.03519359, 2.144274, 1, 1, 1, 1, 1,
1.900088, 0.9502913, 0.7983295, 1, 1, 1, 1, 1,
1.918894, 0.7933214, 0.2964631, 1, 1, 1, 1, 1,
1.934484, 0.438808, 1.599661, 1, 1, 1, 1, 1,
1.955215, 0.9557101, 1.824756, 1, 1, 1, 1, 1,
1.95854, 1.643606, 0.222601, 1, 1, 1, 1, 1,
1.961374, 1.380139, 1.541037, 1, 1, 1, 1, 1,
1.977558, 0.3694948, 2.337886, 1, 1, 1, 1, 1,
1.992251, -0.3050847, 0.8879408, 1, 1, 1, 1, 1,
2.038748, 0.5999785, 0.9837686, 1, 1, 1, 1, 1,
2.11927, 0.3780108, 1.126636, 1, 1, 1, 1, 1,
2.165484, -1.435939, 2.986044, 0, 0, 1, 1, 1,
2.168164, 0.005772909, -0.04211815, 1, 0, 0, 1, 1,
2.181898, 0.4707178, 0.6844622, 1, 0, 0, 1, 1,
2.226626, -0.7177985, 3.872327, 1, 0, 0, 1, 1,
2.250721, 0.04613615, 2.56073, 1, 0, 0, 1, 1,
2.250811, 0.2322101, 0.0262623, 1, 0, 0, 1, 1,
2.266583, -0.954761, 1.835345, 0, 0, 0, 1, 1,
2.312643, -0.4174972, 2.657194, 0, 0, 0, 1, 1,
2.35499, 0.3774456, 2.111882, 0, 0, 0, 1, 1,
2.357188, -0.3415464, 2.687036, 0, 0, 0, 1, 1,
2.43519, -0.4824176, 2.233913, 0, 0, 0, 1, 1,
2.528907, -0.003381519, 0.5824164, 0, 0, 0, 1, 1,
2.631568, 1.065841, 1.211259, 0, 0, 0, 1, 1,
2.635914, -0.7357888, 1.378383, 1, 1, 1, 1, 1,
2.705057, -0.7047102, 2.237875, 1, 1, 1, 1, 1,
2.789018, -0.7355313, -0.4840855, 1, 1, 1, 1, 1,
2.857008, 0.4272681, 0.8727948, 1, 1, 1, 1, 1,
2.86435, 0.1587262, -0.3207782, 1, 1, 1, 1, 1,
3.153568, -0.3347533, 1.929984, 1, 1, 1, 1, 1,
3.253327, 1.581388, 0.4041511, 1, 1, 1, 1, 1
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
var radius = 9.886907;
var distance = 34.72734;
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
mvMatrix.translate( 0.3927639, 0.1281834, -0.01899958 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.72734);
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
