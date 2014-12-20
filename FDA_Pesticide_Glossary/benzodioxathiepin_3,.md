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
-2.826561, -0.8154566, 0.4461891, 1, 0, 0, 1,
-2.632702, -0.9653996, -1.991608, 1, 0.007843138, 0, 1,
-2.598815, 2.201893, -1.695141, 1, 0.01176471, 0, 1,
-2.528589, 1.029887, -2.080925, 1, 0.01960784, 0, 1,
-2.49004, -0.1640311, -3.217052, 1, 0.02352941, 0, 1,
-2.372731, 0.6137929, -0.2592169, 1, 0.03137255, 0, 1,
-2.354717, 2.280349, -1.54788, 1, 0.03529412, 0, 1,
-2.339582, -0.285733, -0.08601182, 1, 0.04313726, 0, 1,
-2.323545, -0.3252711, -0.8669369, 1, 0.04705882, 0, 1,
-2.318897, -0.3021723, -0.8933541, 1, 0.05490196, 0, 1,
-2.302492, 0.2463126, -2.05619, 1, 0.05882353, 0, 1,
-2.221303, 0.6082061, -1.418468, 1, 0.06666667, 0, 1,
-2.219652, 0.9025829, -2.374047, 1, 0.07058824, 0, 1,
-2.195423, -0.3394469, 0.02672032, 1, 0.07843138, 0, 1,
-2.172239, 0.1580164, -0.1909207, 1, 0.08235294, 0, 1,
-2.154318, 0.7794069, -0.2018347, 1, 0.09019608, 0, 1,
-2.113388, -0.8824052, -3.026942, 1, 0.09411765, 0, 1,
-2.097525, -0.4850019, -2.902711, 1, 0.1019608, 0, 1,
-2.040694, 0.1652083, -2.942926, 1, 0.1098039, 0, 1,
-2.025011, 0.3310955, -2.602425, 1, 0.1137255, 0, 1,
-2.004536, 1.213377, -2.701251, 1, 0.1215686, 0, 1,
-2.000141, 0.6054964, -0.3570539, 1, 0.1254902, 0, 1,
-1.983977, -1.898951, -2.207078, 1, 0.1333333, 0, 1,
-1.951552, -0.1916946, -0.9837401, 1, 0.1372549, 0, 1,
-1.939478, -0.3978052, -2.799176, 1, 0.145098, 0, 1,
-1.902571, -2.22196, -2.042355, 1, 0.1490196, 0, 1,
-1.887368, 0.3915183, -0.8441966, 1, 0.1568628, 0, 1,
-1.877684, 3.636545, -0.3269867, 1, 0.1607843, 0, 1,
-1.832393, 0.05077793, -2.259015, 1, 0.1686275, 0, 1,
-1.819579, 2.17275, -0.9257503, 1, 0.172549, 0, 1,
-1.770858, 0.434845, -1.168624, 1, 0.1803922, 0, 1,
-1.746361, 0.5374712, -1.942026, 1, 0.1843137, 0, 1,
-1.736453, -0.3390077, -1.959622, 1, 0.1921569, 0, 1,
-1.733594, 0.9088138, -1.687291, 1, 0.1960784, 0, 1,
-1.725048, 2.07315, -1.661158, 1, 0.2039216, 0, 1,
-1.721636, 0.2163256, -0.7682949, 1, 0.2117647, 0, 1,
-1.697239, -0.8828415, -2.561425, 1, 0.2156863, 0, 1,
-1.672241, -0.3463573, -1.288952, 1, 0.2235294, 0, 1,
-1.667886, 1.20018, 0.7194031, 1, 0.227451, 0, 1,
-1.650445, 0.2791407, -0.1108999, 1, 0.2352941, 0, 1,
-1.636034, 0.7655873, -1.075117, 1, 0.2392157, 0, 1,
-1.622427, 0.9844335, 1.728926, 1, 0.2470588, 0, 1,
-1.617776, 0.2225592, -1.903972, 1, 0.2509804, 0, 1,
-1.614121, -0.2196801, -2.465722, 1, 0.2588235, 0, 1,
-1.613287, -1.835615, -0.04393182, 1, 0.2627451, 0, 1,
-1.587596, -0.2099934, -2.574022, 1, 0.2705882, 0, 1,
-1.578218, 0.6499765, 0.6069501, 1, 0.2745098, 0, 1,
-1.575932, -0.5881576, -1.67199, 1, 0.282353, 0, 1,
-1.573039, -0.5416721, -1.882331, 1, 0.2862745, 0, 1,
-1.571473, -1.35747, -2.678293, 1, 0.2941177, 0, 1,
-1.563567, 1.602075, -2.828161, 1, 0.3019608, 0, 1,
-1.552438, 0.9512632, 0.1841139, 1, 0.3058824, 0, 1,
-1.548855, 1.310318, -2.451095, 1, 0.3137255, 0, 1,
-1.546645, -2.626868, -2.637503, 1, 0.3176471, 0, 1,
-1.542555, 0.1448513, 0.3523275, 1, 0.3254902, 0, 1,
-1.539994, -0.5028597, 0.2443823, 1, 0.3294118, 0, 1,
-1.530746, -0.4492286, -1.771777, 1, 0.3372549, 0, 1,
-1.518898, 0.6510513, -1.249004, 1, 0.3411765, 0, 1,
-1.51872, -0.8588563, -2.51488, 1, 0.3490196, 0, 1,
-1.50797, 0.9014648, -0.7607419, 1, 0.3529412, 0, 1,
-1.500149, 0.4415855, -1.620481, 1, 0.3607843, 0, 1,
-1.499454, -1.953311, -2.507027, 1, 0.3647059, 0, 1,
-1.494486, -0.4523493, -3.809718, 1, 0.372549, 0, 1,
-1.485206, 0.5903073, -2.287183, 1, 0.3764706, 0, 1,
-1.476763, -1.32029, -0.9245597, 1, 0.3843137, 0, 1,
-1.456622, 0.1659639, -2.833287, 1, 0.3882353, 0, 1,
-1.454231, -1.334436, -0.838464, 1, 0.3960784, 0, 1,
-1.451208, -1.9486, -3.587305, 1, 0.4039216, 0, 1,
-1.450702, 0.2664915, -1.379174, 1, 0.4078431, 0, 1,
-1.447597, 0.8855073, 0.03809342, 1, 0.4156863, 0, 1,
-1.438191, 0.9417607, -1.584406, 1, 0.4196078, 0, 1,
-1.437058, -1.564554, -3.373169, 1, 0.427451, 0, 1,
-1.41139, -0.1466041, -1.682604, 1, 0.4313726, 0, 1,
-1.402698, -0.09157413, -1.553639, 1, 0.4392157, 0, 1,
-1.393604, 0.7532405, -4.02165, 1, 0.4431373, 0, 1,
-1.390884, -0.3861313, -0.6993344, 1, 0.4509804, 0, 1,
-1.367749, -0.4326954, -2.222884, 1, 0.454902, 0, 1,
-1.363654, 2.462037, 0.8045219, 1, 0.4627451, 0, 1,
-1.358864, -1.09082, -2.202744, 1, 0.4666667, 0, 1,
-1.349462, -1.628046, -2.868727, 1, 0.4745098, 0, 1,
-1.347824, -0.1556212, -1.149865, 1, 0.4784314, 0, 1,
-1.324096, -0.622283, -1.752404, 1, 0.4862745, 0, 1,
-1.313228, -0.9549824, -2.100145, 1, 0.4901961, 0, 1,
-1.311937, 0.09423598, -1.289103, 1, 0.4980392, 0, 1,
-1.292718, 0.1758508, -1.456791, 1, 0.5058824, 0, 1,
-1.291459, 0.3854483, 0.4510576, 1, 0.509804, 0, 1,
-1.286221, 1.399514, -0.928422, 1, 0.5176471, 0, 1,
-1.278762, 0.3167318, -0.96412, 1, 0.5215687, 0, 1,
-1.275065, -2.147897, -3.808149, 1, 0.5294118, 0, 1,
-1.272674, -0.27029, -1.635735, 1, 0.5333334, 0, 1,
-1.265797, -0.592004, -3.322811, 1, 0.5411765, 0, 1,
-1.259268, 1.592549, 0.3805604, 1, 0.5450981, 0, 1,
-1.251802, 0.2483765, -2.274665, 1, 0.5529412, 0, 1,
-1.251434, -0.3068739, -2.958706, 1, 0.5568628, 0, 1,
-1.249352, -0.3904719, -1.374338, 1, 0.5647059, 0, 1,
-1.247528, -2.727251, -2.911722, 1, 0.5686275, 0, 1,
-1.238662, 1.538687, -0.504732, 1, 0.5764706, 0, 1,
-1.23148, -0.3099512, -3.356561, 1, 0.5803922, 0, 1,
-1.229973, 3.028666, -0.2312201, 1, 0.5882353, 0, 1,
-1.227046, 1.685842, -1.557593, 1, 0.5921569, 0, 1,
-1.219915, 2.457934, 0.4978158, 1, 0.6, 0, 1,
-1.219148, -0.1734524, -2.731512, 1, 0.6078432, 0, 1,
-1.218672, -0.8978074, -3.712843, 1, 0.6117647, 0, 1,
-1.217176, -0.9706939, -3.455856, 1, 0.6196079, 0, 1,
-1.213683, -2.717519, -1.633863, 1, 0.6235294, 0, 1,
-1.212011, -0.7192568, -2.499859, 1, 0.6313726, 0, 1,
-1.208619, -2.25102, -4.281921, 1, 0.6352941, 0, 1,
-1.205407, 0.7007705, 0.1973466, 1, 0.6431373, 0, 1,
-1.189317, 0.02836063, -0.103571, 1, 0.6470588, 0, 1,
-1.166233, 1.829614, -1.173537, 1, 0.654902, 0, 1,
-1.16408, 1.030959, -1.152489, 1, 0.6588235, 0, 1,
-1.162804, -0.4356447, -2.549613, 1, 0.6666667, 0, 1,
-1.1608, 1.849771, -0.8987707, 1, 0.6705883, 0, 1,
-1.157264, 0.3486512, -2.547672, 1, 0.6784314, 0, 1,
-1.154255, 1.244686, -0.1456099, 1, 0.682353, 0, 1,
-1.141388, 0.1186908, -1.692743, 1, 0.6901961, 0, 1,
-1.138763, -1.695171, -0.7661737, 1, 0.6941177, 0, 1,
-1.137811, -1.315677, -1.875657, 1, 0.7019608, 0, 1,
-1.137748, 1.117457, -1.25508, 1, 0.7098039, 0, 1,
-1.137291, 1.001814, 0.1763356, 1, 0.7137255, 0, 1,
-1.13658, -0.3415619, -1.697837, 1, 0.7215686, 0, 1,
-1.1317, -0.7464569, -0.5605853, 1, 0.7254902, 0, 1,
-1.121214, 0.2871456, -0.1093804, 1, 0.7333333, 0, 1,
-1.120353, -1.175278, -1.584628, 1, 0.7372549, 0, 1,
-1.111059, 0.268798, -1.403094, 1, 0.7450981, 0, 1,
-1.102898, -1.229294, -2.267348, 1, 0.7490196, 0, 1,
-1.098247, 1.359447, 0.2939146, 1, 0.7568628, 0, 1,
-1.097281, 0.37333, -2.353702, 1, 0.7607843, 0, 1,
-1.095257, -1.541173, -3.687221, 1, 0.7686275, 0, 1,
-1.094376, -1.532186, -1.978203, 1, 0.772549, 0, 1,
-1.092954, -0.03409988, -0.9819524, 1, 0.7803922, 0, 1,
-1.092521, 0.9553691, -1.177404, 1, 0.7843137, 0, 1,
-1.087514, 1.270913, -2.573498, 1, 0.7921569, 0, 1,
-1.082631, 0.813789, -2.214966, 1, 0.7960784, 0, 1,
-1.077539, 0.8120871, -0.6109223, 1, 0.8039216, 0, 1,
-1.072645, 0.08178948, -1.364773, 1, 0.8117647, 0, 1,
-1.071615, -0.3062393, -2.371724, 1, 0.8156863, 0, 1,
-1.071603, -0.9496179, -3.427019, 1, 0.8235294, 0, 1,
-1.069042, -2.666255, -1.251419, 1, 0.827451, 0, 1,
-1.058703, -0.6769712, -1.238473, 1, 0.8352941, 0, 1,
-1.053595, 0.7809352, -2.130883, 1, 0.8392157, 0, 1,
-1.05269, -0.857375, -1.013748, 1, 0.8470588, 0, 1,
-1.052538, 0.2520657, -0.7774574, 1, 0.8509804, 0, 1,
-1.048311, -1.01234, -2.231753, 1, 0.8588235, 0, 1,
-1.047057, 0.2383594, 0.2483873, 1, 0.8627451, 0, 1,
-1.045949, 0.1902088, -1.463569, 1, 0.8705882, 0, 1,
-1.043814, 0.7579218, -1.221555, 1, 0.8745098, 0, 1,
-1.043313, 0.1413873, -2.089186, 1, 0.8823529, 0, 1,
-1.040139, 1.120166, -0.4095999, 1, 0.8862745, 0, 1,
-1.037531, 0.6806166, -1.483362, 1, 0.8941177, 0, 1,
-1.026097, -0.1864591, 0.3108263, 1, 0.8980392, 0, 1,
-1.015285, 0.184227, -3.026167, 1, 0.9058824, 0, 1,
-1.015087, 1.233624, -1.002012, 1, 0.9137255, 0, 1,
-1.013564, -0.08951869, -2.273995, 1, 0.9176471, 0, 1,
-1.012809, 0.6892278, -0.2513106, 1, 0.9254902, 0, 1,
-1.00372, 0.7570638, -2.220129, 1, 0.9294118, 0, 1,
-0.9990045, -0.6019188, -2.631393, 1, 0.9372549, 0, 1,
-0.997573, 0.7207674, -1.611717, 1, 0.9411765, 0, 1,
-0.9948357, -1.693796, -2.78505, 1, 0.9490196, 0, 1,
-0.9937249, -0.5258286, -2.22016, 1, 0.9529412, 0, 1,
-0.9931344, 0.1270546, -1.391513, 1, 0.9607843, 0, 1,
-0.9883124, 0.8697018, -0.8488069, 1, 0.9647059, 0, 1,
-0.9856479, 0.865356, 0.1128922, 1, 0.972549, 0, 1,
-0.9755775, -1.182491, -3.417145, 1, 0.9764706, 0, 1,
-0.9719908, -0.4798307, -2.247309, 1, 0.9843137, 0, 1,
-0.963165, 0.249733, -1.74358, 1, 0.9882353, 0, 1,
-0.9593452, 0.56732, 1.059436, 1, 0.9960784, 0, 1,
-0.9554319, -0.4353555, -2.896238, 0.9960784, 1, 0, 1,
-0.9543748, 1.144114, -0.5863487, 0.9921569, 1, 0, 1,
-0.9532051, 1.225153, 0.3751963, 0.9843137, 1, 0, 1,
-0.9515377, -1.080243, -4.084139, 0.9803922, 1, 0, 1,
-0.9492032, -0.7478786, -2.939799, 0.972549, 1, 0, 1,
-0.9489854, -1.472117, -1.399937, 0.9686275, 1, 0, 1,
-0.9430078, -0.3226528, -1.999897, 0.9607843, 1, 0, 1,
-0.9389054, 0.1694459, -1.469617, 0.9568627, 1, 0, 1,
-0.9388402, 0.4025264, 0.3943349, 0.9490196, 1, 0, 1,
-0.93706, 0.1766862, -2.633907, 0.945098, 1, 0, 1,
-0.9365905, 1.362804, -1.05612, 0.9372549, 1, 0, 1,
-0.9358481, -1.206441, -3.622244, 0.9333333, 1, 0, 1,
-0.928328, -0.5750668, -4.031807, 0.9254902, 1, 0, 1,
-0.9232386, 0.2602986, -1.965307, 0.9215686, 1, 0, 1,
-0.9203005, 0.1813859, 0.388292, 0.9137255, 1, 0, 1,
-0.9144508, 0.2516706, -1.823727, 0.9098039, 1, 0, 1,
-0.9133359, 0.9147863, -0.5337926, 0.9019608, 1, 0, 1,
-0.9118897, -2.115044, -3.938542, 0.8941177, 1, 0, 1,
-0.9114388, 1.085554, -0.3599006, 0.8901961, 1, 0, 1,
-0.9100828, 1.352895, 0.3684118, 0.8823529, 1, 0, 1,
-0.8993354, 1.093607, -0.5221382, 0.8784314, 1, 0, 1,
-0.8935922, -1.676725, -3.412144, 0.8705882, 1, 0, 1,
-0.8924516, 2.15829, 0.2187384, 0.8666667, 1, 0, 1,
-0.8914737, 1.432191, -0.6898705, 0.8588235, 1, 0, 1,
-0.8897187, 1.665602, -0.9746487, 0.854902, 1, 0, 1,
-0.8876792, -0.9564267, -2.366113, 0.8470588, 1, 0, 1,
-0.8831874, -0.1431536, -1.949406, 0.8431373, 1, 0, 1,
-0.8797373, 0.776879, -2.133118, 0.8352941, 1, 0, 1,
-0.874543, -1.248063, -2.19837, 0.8313726, 1, 0, 1,
-0.8745227, 0.7119417, -0.8064964, 0.8235294, 1, 0, 1,
-0.8730844, -0.9407682, -2.074968, 0.8196079, 1, 0, 1,
-0.8700488, 0.2263039, -1.379285, 0.8117647, 1, 0, 1,
-0.8645157, -3.122842, -3.471392, 0.8078431, 1, 0, 1,
-0.8597513, 0.06671722, -1.337356, 0.8, 1, 0, 1,
-0.8593441, 1.291274, -0.1288999, 0.7921569, 1, 0, 1,
-0.8581643, -1.508511, -3.436115, 0.7882353, 1, 0, 1,
-0.8525047, 0.9942464, -0.7072449, 0.7803922, 1, 0, 1,
-0.851464, 0.3218934, -0.475731, 0.7764706, 1, 0, 1,
-0.8510877, -0.1090554, -3.601711, 0.7686275, 1, 0, 1,
-0.8452058, -0.7148393, -2.228503, 0.7647059, 1, 0, 1,
-0.8449197, -1.148257, -3.369668, 0.7568628, 1, 0, 1,
-0.8438659, -1.527096, -3.951103, 0.7529412, 1, 0, 1,
-0.8374121, -0.2986989, -2.550904, 0.7450981, 1, 0, 1,
-0.8353495, -0.9469274, -2.845268, 0.7411765, 1, 0, 1,
-0.8325382, -2.102854, -3.467357, 0.7333333, 1, 0, 1,
-0.8242353, 0.1511709, -1.249577, 0.7294118, 1, 0, 1,
-0.8160507, 2.367498, 0.666499, 0.7215686, 1, 0, 1,
-0.8137145, -1.102754, -1.425571, 0.7176471, 1, 0, 1,
-0.8119204, -0.4297916, -0.9393197, 0.7098039, 1, 0, 1,
-0.8099457, -0.6671892, -2.757549, 0.7058824, 1, 0, 1,
-0.8096264, -0.4324947, -1.978025, 0.6980392, 1, 0, 1,
-0.8077279, 1.553369, 0.1346914, 0.6901961, 1, 0, 1,
-0.8067495, -0.9600562, -2.849496, 0.6862745, 1, 0, 1,
-0.8052605, -1.569393, -3.200938, 0.6784314, 1, 0, 1,
-0.802776, 0.3786519, 0.04256472, 0.6745098, 1, 0, 1,
-0.7982275, -1.422319, -0.2512036, 0.6666667, 1, 0, 1,
-0.7919251, -0.1699362, -3.293031, 0.6627451, 1, 0, 1,
-0.7879592, 0.4005609, -0.3665014, 0.654902, 1, 0, 1,
-0.7840015, 0.6482978, -1.022886, 0.6509804, 1, 0, 1,
-0.7824553, -0.6259843, -2.402028, 0.6431373, 1, 0, 1,
-0.7794403, 2.557407, -0.990607, 0.6392157, 1, 0, 1,
-0.7776744, -0.2394202, -2.211961, 0.6313726, 1, 0, 1,
-0.7776126, -0.7325749, -0.8410345, 0.627451, 1, 0, 1,
-0.7696541, -1.97348, -1.791428, 0.6196079, 1, 0, 1,
-0.766524, -0.675288, -1.629675, 0.6156863, 1, 0, 1,
-0.7662879, 0.4668301, 0.2285068, 0.6078432, 1, 0, 1,
-0.7634575, -0.5678895, -3.217159, 0.6039216, 1, 0, 1,
-0.7571979, -2.876743, -2.234449, 0.5960785, 1, 0, 1,
-0.7384117, 1.132506, -0.2612235, 0.5882353, 1, 0, 1,
-0.7373685, 0.7214733, -0.04748944, 0.5843138, 1, 0, 1,
-0.735324, 0.6130716, -0.9499919, 0.5764706, 1, 0, 1,
-0.7321208, -0.4670957, -2.606581, 0.572549, 1, 0, 1,
-0.7312104, -0.6133878, -3.782079, 0.5647059, 1, 0, 1,
-0.7298893, 0.1318989, -1.542558, 0.5607843, 1, 0, 1,
-0.7294474, -0.05167873, -0.134557, 0.5529412, 1, 0, 1,
-0.7267959, -2.293331, -2.731079, 0.5490196, 1, 0, 1,
-0.7263199, 0.0611118, -0.4406007, 0.5411765, 1, 0, 1,
-0.7205424, -0.1846365, -2.381844, 0.5372549, 1, 0, 1,
-0.7153723, -1.004089, -2.682599, 0.5294118, 1, 0, 1,
-0.7127734, -0.516284, -1.887739, 0.5254902, 1, 0, 1,
-0.7105162, 0.2327242, -1.549021, 0.5176471, 1, 0, 1,
-0.7093761, 0.7244759, -0.7726607, 0.5137255, 1, 0, 1,
-0.7085588, 0.8717551, -0.8450918, 0.5058824, 1, 0, 1,
-0.7080693, 0.1550555, -2.737109, 0.5019608, 1, 0, 1,
-0.7072787, -1.525251, -2.896842, 0.4941176, 1, 0, 1,
-0.707253, 0.3592901, 0.0748474, 0.4862745, 1, 0, 1,
-0.7027022, -0.6970696, -2.244774, 0.4823529, 1, 0, 1,
-0.7025113, 0.5475556, -0.3078775, 0.4745098, 1, 0, 1,
-0.7022488, -1.414686, -1.728304, 0.4705882, 1, 0, 1,
-0.6946688, 0.3283479, -1.700014, 0.4627451, 1, 0, 1,
-0.689421, -0.9380764, -4.139916, 0.4588235, 1, 0, 1,
-0.6844723, -1.775046, -1.217954, 0.4509804, 1, 0, 1,
-0.6780396, -1.263037, -1.910471, 0.4470588, 1, 0, 1,
-0.6742076, 1.521366, -0.09383348, 0.4392157, 1, 0, 1,
-0.6690152, 0.6032103, -1.012965, 0.4352941, 1, 0, 1,
-0.6670594, -0.439882, -2.548803, 0.427451, 1, 0, 1,
-0.6669947, 0.02682254, -2.104407, 0.4235294, 1, 0, 1,
-0.6666209, -1.57026, -2.035757, 0.4156863, 1, 0, 1,
-0.6628422, 0.9390938, -0.5224878, 0.4117647, 1, 0, 1,
-0.6624053, -0.7852576, -0.5141634, 0.4039216, 1, 0, 1,
-0.6609666, -0.3276829, -1.840875, 0.3960784, 1, 0, 1,
-0.6508901, 0.823682, -0.919817, 0.3921569, 1, 0, 1,
-0.648492, 1.894466, -0.5135834, 0.3843137, 1, 0, 1,
-0.6473234, 0.7018314, -0.3356675, 0.3803922, 1, 0, 1,
-0.6464332, -0.495241, -1.918351, 0.372549, 1, 0, 1,
-0.6394359, 1.081164, 0.8066036, 0.3686275, 1, 0, 1,
-0.6320024, -2.785883, -2.82979, 0.3607843, 1, 0, 1,
-0.6319425, 1.440012, -0.6942894, 0.3568628, 1, 0, 1,
-0.6315268, 0.3253177, -0.2459848, 0.3490196, 1, 0, 1,
-0.6252333, -0.3152545, -1.784844, 0.345098, 1, 0, 1,
-0.6229886, 0.2174626, -1.986598, 0.3372549, 1, 0, 1,
-0.6197295, -0.02511707, -0.5878572, 0.3333333, 1, 0, 1,
-0.6189707, -0.4779065, -4.090626, 0.3254902, 1, 0, 1,
-0.6099973, 0.6193925, -0.02415925, 0.3215686, 1, 0, 1,
-0.6096238, 0.7179812, -1.903519, 0.3137255, 1, 0, 1,
-0.6086212, -0.6492247, -3.559153, 0.3098039, 1, 0, 1,
-0.6085341, -0.3535669, -3.296487, 0.3019608, 1, 0, 1,
-0.6055642, -1.045439, -3.240896, 0.2941177, 1, 0, 1,
-0.6055554, -1.231901, -2.270383, 0.2901961, 1, 0, 1,
-0.6045696, 1.02141, 0.06562775, 0.282353, 1, 0, 1,
-0.6045212, -0.8754643, -4.23757, 0.2784314, 1, 0, 1,
-0.6031317, -0.3958959, -1.813232, 0.2705882, 1, 0, 1,
-0.5987483, 0.1958728, -1.038222, 0.2666667, 1, 0, 1,
-0.5904727, 1.086684, -1.192288, 0.2588235, 1, 0, 1,
-0.5899083, 0.1735845, -1.460397, 0.254902, 1, 0, 1,
-0.5887734, 1.196685, -0.1744291, 0.2470588, 1, 0, 1,
-0.5885439, 0.7424843, -1.663713, 0.2431373, 1, 0, 1,
-0.5883864, -1.158883, -2.044415, 0.2352941, 1, 0, 1,
-0.5863748, -1.131118, -2.895628, 0.2313726, 1, 0, 1,
-0.5723387, 0.9955745, -0.5143206, 0.2235294, 1, 0, 1,
-0.5710533, -1.858436, -1.996469, 0.2196078, 1, 0, 1,
-0.5709627, -0.3077616, -2.645905, 0.2117647, 1, 0, 1,
-0.5652848, -0.6134644, -4.025149, 0.2078431, 1, 0, 1,
-0.5606008, 0.6787771, -0.7794732, 0.2, 1, 0, 1,
-0.560197, -0.3611044, -2.181415, 0.1921569, 1, 0, 1,
-0.5559651, -1.000893, -2.814041, 0.1882353, 1, 0, 1,
-0.55336, -0.1725882, -1.042329, 0.1803922, 1, 0, 1,
-0.5533597, -1.975314, -1.707202, 0.1764706, 1, 0, 1,
-0.5495213, -0.3550274, -2.025821, 0.1686275, 1, 0, 1,
-0.5482057, -0.637897, -2.199025, 0.1647059, 1, 0, 1,
-0.5382975, -0.711931, -0.4411149, 0.1568628, 1, 0, 1,
-0.5361075, 0.4750689, -0.1297792, 0.1529412, 1, 0, 1,
-0.5341509, 0.5990564, -0.3752572, 0.145098, 1, 0, 1,
-0.5330048, 1.141785, 0.2372063, 0.1411765, 1, 0, 1,
-0.5316357, -0.7380342, -3.767162, 0.1333333, 1, 0, 1,
-0.5257501, 1.407557, -0.2204706, 0.1294118, 1, 0, 1,
-0.5249045, 0.1098387, -4.177861, 0.1215686, 1, 0, 1,
-0.5247021, -0.5262201, -2.827653, 0.1176471, 1, 0, 1,
-0.5246402, 0.3724612, -1.377016, 0.1098039, 1, 0, 1,
-0.5232465, 0.6076753, -0.1800543, 0.1058824, 1, 0, 1,
-0.5207471, 0.4632484, -3.259195, 0.09803922, 1, 0, 1,
-0.5191514, -0.6309562, -2.869813, 0.09019608, 1, 0, 1,
-0.5168139, -0.1879055, -2.27614, 0.08627451, 1, 0, 1,
-0.5162071, -0.5176847, -3.413142, 0.07843138, 1, 0, 1,
-0.5075378, -0.7120847, -1.975465, 0.07450981, 1, 0, 1,
-0.5073038, 1.635796, -0.127503, 0.06666667, 1, 0, 1,
-0.5023469, 0.5413121, -2.3258, 0.0627451, 1, 0, 1,
-0.5015985, 0.6854227, -1.096187, 0.05490196, 1, 0, 1,
-0.5012224, 1.318977, -1.517557, 0.05098039, 1, 0, 1,
-0.5005862, 0.9581852, 1.278037, 0.04313726, 1, 0, 1,
-0.4986321, -2.101977, -2.401428, 0.03921569, 1, 0, 1,
-0.4970385, 0.2373558, -1.627937, 0.03137255, 1, 0, 1,
-0.4924786, -0.02825006, -1.000045, 0.02745098, 1, 0, 1,
-0.4898985, 0.3328838, -0.1007176, 0.01960784, 1, 0, 1,
-0.4894905, 1.14876, -1.277899, 0.01568628, 1, 0, 1,
-0.4893309, -0.4535814, -2.074794, 0.007843138, 1, 0, 1,
-0.4890283, 0.4000854, -1.310994, 0.003921569, 1, 0, 1,
-0.4861049, 0.4307682, -0.07811569, 0, 1, 0.003921569, 1,
-0.4838565, 0.3643543, 0.4802638, 0, 1, 0.01176471, 1,
-0.4745897, 0.84135, -0.684346, 0, 1, 0.01568628, 1,
-0.4701218, -1.164286, -2.360593, 0, 1, 0.02352941, 1,
-0.4675644, -1.761683, -2.441095, 0, 1, 0.02745098, 1,
-0.4638066, -0.6651046, -2.269589, 0, 1, 0.03529412, 1,
-0.4634247, 1.232749, -0.3381246, 0, 1, 0.03921569, 1,
-0.4617088, 0.6978922, 1.266268, 0, 1, 0.04705882, 1,
-0.4616735, -0.3836837, -2.473845, 0, 1, 0.05098039, 1,
-0.4564837, -0.7380873, -3.753457, 0, 1, 0.05882353, 1,
-0.4563156, 0.3027059, -0.4152218, 0, 1, 0.0627451, 1,
-0.4554461, -0.2772342, 0.2592689, 0, 1, 0.07058824, 1,
-0.4513219, 0.7892393, -0.773252, 0, 1, 0.07450981, 1,
-0.4485877, -0.3596541, -1.864962, 0, 1, 0.08235294, 1,
-0.4467357, 0.7516491, -1.40159, 0, 1, 0.08627451, 1,
-0.4420171, 1.284909, -1.746645, 0, 1, 0.09411765, 1,
-0.4415625, -0.9311471, -2.087868, 0, 1, 0.1019608, 1,
-0.4407999, 0.5107317, 1.015465, 0, 1, 0.1058824, 1,
-0.436166, -0.05389627, -1.884726, 0, 1, 0.1137255, 1,
-0.4348141, -1.069962, -2.349018, 0, 1, 0.1176471, 1,
-0.4274838, -0.2445008, -2.919575, 0, 1, 0.1254902, 1,
-0.4233243, 0.2766248, -0.6965271, 0, 1, 0.1294118, 1,
-0.4230931, 2.07902, -0.4916504, 0, 1, 0.1372549, 1,
-0.4219513, -1.130235, -2.631333, 0, 1, 0.1411765, 1,
-0.4212305, -0.8247185, -3.2673, 0, 1, 0.1490196, 1,
-0.4208037, 0.3818633, 0.2830785, 0, 1, 0.1529412, 1,
-0.4113344, 0.9477909, 0.8232663, 0, 1, 0.1607843, 1,
-0.4076772, -0.9308327, -1.820834, 0, 1, 0.1647059, 1,
-0.401046, 1.291187, 0.7333163, 0, 1, 0.172549, 1,
-0.4007436, 0.3822515, -1.534847, 0, 1, 0.1764706, 1,
-0.3984267, 0.4707979, -0.3109075, 0, 1, 0.1843137, 1,
-0.3928662, 0.01926167, -1.890867, 0, 1, 0.1882353, 1,
-0.3920725, -0.8041925, -3.923296, 0, 1, 0.1960784, 1,
-0.3906238, 0.6456518, -1.882832, 0, 1, 0.2039216, 1,
-0.3904374, 0.100832, -1.698135, 0, 1, 0.2078431, 1,
-0.3865834, 0.6139639, 0.4076319, 0, 1, 0.2156863, 1,
-0.3843541, -1.490337, -3.113569, 0, 1, 0.2196078, 1,
-0.3835934, -0.530581, -2.049395, 0, 1, 0.227451, 1,
-0.382408, -0.7662302, -1.672798, 0, 1, 0.2313726, 1,
-0.3778014, -2.786134, -2.681444, 0, 1, 0.2392157, 1,
-0.375464, -2.08107, -2.18452, 0, 1, 0.2431373, 1,
-0.3717902, 1.59949, -0.2265602, 0, 1, 0.2509804, 1,
-0.3688437, 0.8996505, -1.307289, 0, 1, 0.254902, 1,
-0.3674995, 0.860979, -0.09938902, 0, 1, 0.2627451, 1,
-0.364016, 0.946836, 0.9045152, 0, 1, 0.2666667, 1,
-0.3627139, -0.6643027, -2.826156, 0, 1, 0.2745098, 1,
-0.3608462, 1.257958, -0.4441146, 0, 1, 0.2784314, 1,
-0.3535461, 0.8824258, 0.8317658, 0, 1, 0.2862745, 1,
-0.3526196, 0.4299527, -0.2809578, 0, 1, 0.2901961, 1,
-0.3502591, -0.525029, -3.777854, 0, 1, 0.2980392, 1,
-0.3460495, 0.5138673, 0.42817, 0, 1, 0.3058824, 1,
-0.3452712, -1.684841, -2.929864, 0, 1, 0.3098039, 1,
-0.3419801, -0.5693852, -2.714125, 0, 1, 0.3176471, 1,
-0.3378145, -0.3261663, -2.316984, 0, 1, 0.3215686, 1,
-0.336335, 0.1558319, -1.238586, 0, 1, 0.3294118, 1,
-0.3349666, 1.943299, 1.469351, 0, 1, 0.3333333, 1,
-0.326382, 0.8535815, -0.1544152, 0, 1, 0.3411765, 1,
-0.3252057, 0.1863939, 0.1383063, 0, 1, 0.345098, 1,
-0.3244929, 0.9843224, 0.9168978, 0, 1, 0.3529412, 1,
-0.3243189, -0.2639821, -0.5304565, 0, 1, 0.3568628, 1,
-0.3231136, 1.339738, -0.3341787, 0, 1, 0.3647059, 1,
-0.3226886, 0.2261966, -0.810219, 0, 1, 0.3686275, 1,
-0.322355, -0.002433931, 0.08715062, 0, 1, 0.3764706, 1,
-0.3153324, -0.6256325, -2.855098, 0, 1, 0.3803922, 1,
-0.31452, -0.3812024, -2.588429, 0, 1, 0.3882353, 1,
-0.308748, -1.171418, -1.669761, 0, 1, 0.3921569, 1,
-0.3084865, 0.1385622, 0.8647264, 0, 1, 0.4, 1,
-0.3081282, 1.733484, -2.717347, 0, 1, 0.4078431, 1,
-0.3052549, 1.408283, -0.02950537, 0, 1, 0.4117647, 1,
-0.3050697, 0.3561986, -1.383718, 0, 1, 0.4196078, 1,
-0.3025523, -0.6672103, -0.6174762, 0, 1, 0.4235294, 1,
-0.2996456, 1.312568, -0.8830244, 0, 1, 0.4313726, 1,
-0.2983391, -0.8631632, -3.012746, 0, 1, 0.4352941, 1,
-0.2963316, 0.2370004, -1.128349, 0, 1, 0.4431373, 1,
-0.2929302, 1.329638, -0.5870926, 0, 1, 0.4470588, 1,
-0.2872937, -1.764029, -2.143342, 0, 1, 0.454902, 1,
-0.282341, -0.1294499, -1.691725, 0, 1, 0.4588235, 1,
-0.2785504, 0.8750185, -1.196712, 0, 1, 0.4666667, 1,
-0.2755324, -2.647467, -4.116883, 0, 1, 0.4705882, 1,
-0.2689529, -1.332083, -3.485521, 0, 1, 0.4784314, 1,
-0.267369, 1.337851, 0.2063573, 0, 1, 0.4823529, 1,
-0.256229, -1.263524, -4.546211, 0, 1, 0.4901961, 1,
-0.2558152, 0.7104905, -0.4537741, 0, 1, 0.4941176, 1,
-0.2547515, 0.08117965, -1.235632, 0, 1, 0.5019608, 1,
-0.2524618, -0.4474942, -2.365419, 0, 1, 0.509804, 1,
-0.2483282, 1.134146, 0.554538, 0, 1, 0.5137255, 1,
-0.2473253, 0.4129673, -2.275423, 0, 1, 0.5215687, 1,
-0.2451929, 0.3910448, 0.5698973, 0, 1, 0.5254902, 1,
-0.2413647, 0.4282659, 0.2897974, 0, 1, 0.5333334, 1,
-0.2400924, -1.267817, -2.394595, 0, 1, 0.5372549, 1,
-0.2392361, 0.3042023, -2.592582, 0, 1, 0.5450981, 1,
-0.2368767, 1.0344, -0.5560097, 0, 1, 0.5490196, 1,
-0.2331066, -0.6122665, -1.081863, 0, 1, 0.5568628, 1,
-0.2325154, -0.344984, -3.644586, 0, 1, 0.5607843, 1,
-0.2321066, -1.858694, -1.158696, 0, 1, 0.5686275, 1,
-0.225366, -1.321734, -3.862731, 0, 1, 0.572549, 1,
-0.2181599, 0.1892164, 0.9022756, 0, 1, 0.5803922, 1,
-0.2162714, -2.842617, -3.626904, 0, 1, 0.5843138, 1,
-0.2103708, 0.8426957, 0.3819577, 0, 1, 0.5921569, 1,
-0.2040362, 0.4580027, -0.01610328, 0, 1, 0.5960785, 1,
-0.1999412, -0.5217089, -3.6609, 0, 1, 0.6039216, 1,
-0.1977924, -0.4078422, -1.303895, 0, 1, 0.6117647, 1,
-0.1966437, -0.297752, -3.423619, 0, 1, 0.6156863, 1,
-0.1963217, -1.555339, -2.039713, 0, 1, 0.6235294, 1,
-0.1960054, -0.4146972, -1.978062, 0, 1, 0.627451, 1,
-0.1929844, -0.07423278, -2.407852, 0, 1, 0.6352941, 1,
-0.1921717, 0.4123186, 0.1804235, 0, 1, 0.6392157, 1,
-0.1918527, -0.1349016, -1.037293, 0, 1, 0.6470588, 1,
-0.1899758, -1.10995, -1.091769, 0, 1, 0.6509804, 1,
-0.1899501, 2.193904, -0.7263857, 0, 1, 0.6588235, 1,
-0.1853189, -0.1242576, -0.6292099, 0, 1, 0.6627451, 1,
-0.1852243, 0.3047846, 0.7799414, 0, 1, 0.6705883, 1,
-0.1840368, -0.3504714, -3.091326, 0, 1, 0.6745098, 1,
-0.1839866, -1.46922, -2.523998, 0, 1, 0.682353, 1,
-0.1834727, 0.3938728, -0.2982184, 0, 1, 0.6862745, 1,
-0.1820608, -0.3627886, -3.401927, 0, 1, 0.6941177, 1,
-0.1820158, -0.4657808, -4.088388, 0, 1, 0.7019608, 1,
-0.1806854, 0.6712731, 0.7737821, 0, 1, 0.7058824, 1,
-0.1806237, 1.415969, 0.2623253, 0, 1, 0.7137255, 1,
-0.1781739, 0.8260293, 0.0846389, 0, 1, 0.7176471, 1,
-0.1777004, 1.659071, 0.6077856, 0, 1, 0.7254902, 1,
-0.1753794, -1.505817, -3.762572, 0, 1, 0.7294118, 1,
-0.1747462, 0.1279977, -0.4872453, 0, 1, 0.7372549, 1,
-0.1740165, 0.9007913, 0.9912733, 0, 1, 0.7411765, 1,
-0.1664914, 1.723703, 0.3165195, 0, 1, 0.7490196, 1,
-0.1609434, 0.2437904, -0.385893, 0, 1, 0.7529412, 1,
-0.1534054, 0.1126817, 0.3998876, 0, 1, 0.7607843, 1,
-0.1529764, 0.001669989, -0.7224689, 0, 1, 0.7647059, 1,
-0.1516472, -2.902886, -5.839878, 0, 1, 0.772549, 1,
-0.1489655, -0.8772896, -4.750667, 0, 1, 0.7764706, 1,
-0.1477352, -0.60164, -1.829126, 0, 1, 0.7843137, 1,
-0.1453067, -0.550958, -2.76201, 0, 1, 0.7882353, 1,
-0.1445708, -1.848814, -3.171952, 0, 1, 0.7960784, 1,
-0.1399457, -1.119547, -2.078986, 0, 1, 0.8039216, 1,
-0.1397551, -0.07946007, -1.555023, 0, 1, 0.8078431, 1,
-0.1343492, 1.002425, 0.9006462, 0, 1, 0.8156863, 1,
-0.130969, 2.223729, 0.4909567, 0, 1, 0.8196079, 1,
-0.1250516, 0.1868418, -1.038594, 0, 1, 0.827451, 1,
-0.1197096, -1.368284, -2.448907, 0, 1, 0.8313726, 1,
-0.1139529, -0.7532303, -3.703515, 0, 1, 0.8392157, 1,
-0.1103871, -1.02844, -2.684123, 0, 1, 0.8431373, 1,
-0.1091731, -0.5389669, -3.843803, 0, 1, 0.8509804, 1,
-0.1023722, -2.261331, -2.388599, 0, 1, 0.854902, 1,
-0.09849743, -1.33665, -3.48111, 0, 1, 0.8627451, 1,
-0.09611289, -1.043879, -4.833584, 0, 1, 0.8666667, 1,
-0.09403343, -0.07721063, -3.409746, 0, 1, 0.8745098, 1,
-0.09306255, 1.658125, 0.5272743, 0, 1, 0.8784314, 1,
-0.09149072, 0.1739991, -2.945636, 0, 1, 0.8862745, 1,
-0.08965143, 1.097041, 1.1064, 0, 1, 0.8901961, 1,
-0.08786406, 0.8427007, -0.2505157, 0, 1, 0.8980392, 1,
-0.08718562, 0.7784491, -0.2231973, 0, 1, 0.9058824, 1,
-0.0867967, 2.573905, 0.5299059, 0, 1, 0.9098039, 1,
-0.08565351, 0.6080448, 0.3839244, 0, 1, 0.9176471, 1,
-0.07960999, -2.148116, -2.125404, 0, 1, 0.9215686, 1,
-0.0792053, 0.09856611, -1.197928, 0, 1, 0.9294118, 1,
-0.07793751, 0.6578538, 0.05625314, 0, 1, 0.9333333, 1,
-0.07682691, 1.547766, 1.444311, 0, 1, 0.9411765, 1,
-0.07139208, -0.4874382, -1.965735, 0, 1, 0.945098, 1,
-0.06422812, -0.05974833, -1.650155, 0, 1, 0.9529412, 1,
-0.06291914, -0.6865622, -2.840703, 0, 1, 0.9568627, 1,
-0.05797327, 1.771801, -0.6951543, 0, 1, 0.9647059, 1,
-0.05780771, 0.3732028, 0.1075677, 0, 1, 0.9686275, 1,
-0.05701494, 0.6081357, -1.340572, 0, 1, 0.9764706, 1,
-0.04706956, -1.198429, -2.87483, 0, 1, 0.9803922, 1,
-0.0450746, -2.137148, -3.446666, 0, 1, 0.9882353, 1,
-0.04278649, -1.349678, -2.456088, 0, 1, 0.9921569, 1,
-0.04262608, -0.5413645, -3.541159, 0, 1, 1, 1,
-0.03994282, 2.235547, 0.1757475, 0, 0.9921569, 1, 1,
-0.03616825, -0.887185, -1.683917, 0, 0.9882353, 1, 1,
-0.03412202, -0.231091, -2.158928, 0, 0.9803922, 1, 1,
-0.03058306, 0.7170303, 0.05366277, 0, 0.9764706, 1, 1,
-0.02880699, -0.06993083, -2.543281, 0, 0.9686275, 1, 1,
-0.02752114, -0.881542, -3.28037, 0, 0.9647059, 1, 1,
-0.02709928, 2.318202, -0.7264143, 0, 0.9568627, 1, 1,
-0.02682629, -0.8068696, -2.297277, 0, 0.9529412, 1, 1,
-0.02650608, 1.289196, 0.3386203, 0, 0.945098, 1, 1,
-0.0255138, -2.533201, -5.185932, 0, 0.9411765, 1, 1,
-0.02520327, 0.07782951, -0.8171864, 0, 0.9333333, 1, 1,
-0.02175323, -1.443592, -4.458006, 0, 0.9294118, 1, 1,
-0.02083925, -1.616477, -4.08347, 0, 0.9215686, 1, 1,
-0.02015372, 1.383014, 0.8213799, 0, 0.9176471, 1, 1,
-0.01822929, 0.2443513, 2.517483, 0, 0.9098039, 1, 1,
-0.01776736, 0.3438366, -0.5689452, 0, 0.9058824, 1, 1,
-0.01481423, -0.1118632, -1.944729, 0, 0.8980392, 1, 1,
-0.01179132, -1.15147, -3.010884, 0, 0.8901961, 1, 1,
-0.008703157, -0.4891155, -3.1234, 0, 0.8862745, 1, 1,
-0.007490869, 0.7953061, 1.156814, 0, 0.8784314, 1, 1,
-0.004332711, -1.06352, -4.654621, 0, 0.8745098, 1, 1,
-0.001856977, 0.2792648, 0.3464494, 0, 0.8666667, 1, 1,
0.000160249, -2.400373, 3.202633, 0, 0.8627451, 1, 1,
0.001098327, 0.6585786, -0.5212033, 0, 0.854902, 1, 1,
0.002202363, -0.5733374, 3.015491, 0, 0.8509804, 1, 1,
0.003906734, -0.9034826, 3.965372, 0, 0.8431373, 1, 1,
0.006069103, -0.2234479, 2.993661, 0, 0.8392157, 1, 1,
0.006327715, -0.8172742, 5.16432, 0, 0.8313726, 1, 1,
0.008725124, -0.2273332, 2.166208, 0, 0.827451, 1, 1,
0.01047065, 0.6474606, 0.4915294, 0, 0.8196079, 1, 1,
0.01327561, 0.7003891, -1.093116, 0, 0.8156863, 1, 1,
0.01880435, 0.6655406, 0.4856917, 0, 0.8078431, 1, 1,
0.02264704, 0.6488276, 0.9795173, 0, 0.8039216, 1, 1,
0.02359652, -1.562999, 1.795496, 0, 0.7960784, 1, 1,
0.02505074, 0.3885877, 0.1300096, 0, 0.7882353, 1, 1,
0.03288971, -1.145191, 2.807284, 0, 0.7843137, 1, 1,
0.03506524, -0.06108178, 3.806115, 0, 0.7764706, 1, 1,
0.03693271, 0.6421137, -1.882899, 0, 0.772549, 1, 1,
0.0377489, 0.2033682, -0.3563348, 0, 0.7647059, 1, 1,
0.03896878, -0.5345255, 3.334513, 0, 0.7607843, 1, 1,
0.04104117, 0.1596258, 0.5687556, 0, 0.7529412, 1, 1,
0.04244713, 0.5332355, -0.4519197, 0, 0.7490196, 1, 1,
0.04380903, -0.8798733, 3.797541, 0, 0.7411765, 1, 1,
0.044368, 0.2150789, 0.3573635, 0, 0.7372549, 1, 1,
0.04505399, -0.7425223, 3.671948, 0, 0.7294118, 1, 1,
0.04901769, -1.480949, 3.094244, 0, 0.7254902, 1, 1,
0.05385062, -1.095402, 2.892272, 0, 0.7176471, 1, 1,
0.05391468, -0.3256242, 4.157265, 0, 0.7137255, 1, 1,
0.05415538, -0.05292896, 3.112539, 0, 0.7058824, 1, 1,
0.05516445, 0.2111359, 0.6548269, 0, 0.6980392, 1, 1,
0.0590049, 0.2763941, 0.01986959, 0, 0.6941177, 1, 1,
0.06085287, -0.1178156, 3.195472, 0, 0.6862745, 1, 1,
0.06129001, 0.8241709, -0.3425288, 0, 0.682353, 1, 1,
0.06409556, 1.866166, -1.895924, 0, 0.6745098, 1, 1,
0.06685089, -1.333836, 2.670971, 0, 0.6705883, 1, 1,
0.06765285, 0.5366545, -1.129405, 0, 0.6627451, 1, 1,
0.06957318, 0.7426844, 0.1260558, 0, 0.6588235, 1, 1,
0.07139851, -0.02266425, 1.020955, 0, 0.6509804, 1, 1,
0.07394596, -0.8283305, 2.724365, 0, 0.6470588, 1, 1,
0.07472834, -0.9766332, 2.427171, 0, 0.6392157, 1, 1,
0.07477035, 0.1690292, 1.116356, 0, 0.6352941, 1, 1,
0.07572945, -0.893542, 2.84379, 0, 0.627451, 1, 1,
0.0812224, 1.347254, 0.900062, 0, 0.6235294, 1, 1,
0.08414493, -0.6071537, 1.962574, 0, 0.6156863, 1, 1,
0.08621182, -0.8767666, 3.43501, 0, 0.6117647, 1, 1,
0.08968454, 0.1197771, 0.2025336, 0, 0.6039216, 1, 1,
0.08984592, -1.347505, 2.878513, 0, 0.5960785, 1, 1,
0.09024856, 0.8670679, -1.012483, 0, 0.5921569, 1, 1,
0.09148662, 1.188367, -0.1935454, 0, 0.5843138, 1, 1,
0.09158729, -1.753486, 3.358605, 0, 0.5803922, 1, 1,
0.09425005, -0.008477951, 0.8310298, 0, 0.572549, 1, 1,
0.09437816, 0.09927727, 0.8155566, 0, 0.5686275, 1, 1,
0.09520556, -0.684631, 1.170298, 0, 0.5607843, 1, 1,
0.09560058, -0.4350064, 4.507758, 0, 0.5568628, 1, 1,
0.09703123, 0.1342089, 0.6584163, 0, 0.5490196, 1, 1,
0.1012296, 0.2276405, 1.280602, 0, 0.5450981, 1, 1,
0.1077741, -0.304915, 3.260872, 0, 0.5372549, 1, 1,
0.1100533, 0.2148246, -0.5482478, 0, 0.5333334, 1, 1,
0.1169484, 0.9505988, -1.847762, 0, 0.5254902, 1, 1,
0.1190504, -0.1680123, 2.844949, 0, 0.5215687, 1, 1,
0.1199264, -1.72764, 3.089983, 0, 0.5137255, 1, 1,
0.1214475, -0.6504423, 4.188154, 0, 0.509804, 1, 1,
0.121919, 1.015305, -0.05814754, 0, 0.5019608, 1, 1,
0.122497, 1.103889, -0.4279959, 0, 0.4941176, 1, 1,
0.1246503, 1.114186, 1.084264, 0, 0.4901961, 1, 1,
0.1251197, -0.1428012, 2.198652, 0, 0.4823529, 1, 1,
0.1261861, 1.272143, 1.522567, 0, 0.4784314, 1, 1,
0.1272214, 0.1469267, 0.9036577, 0, 0.4705882, 1, 1,
0.1277003, -2.323348, 2.749618, 0, 0.4666667, 1, 1,
0.1309502, 1.69673, 0.3628187, 0, 0.4588235, 1, 1,
0.1361301, 0.7025962, -1.715205, 0, 0.454902, 1, 1,
0.1366308, 1.480088, 1.120246, 0, 0.4470588, 1, 1,
0.137481, -0.9793517, 4.415554, 0, 0.4431373, 1, 1,
0.1407592, 0.1522198, -0.2093438, 0, 0.4352941, 1, 1,
0.141708, 0.8961468, -2.437362, 0, 0.4313726, 1, 1,
0.1425473, 0.2277923, 2.451023, 0, 0.4235294, 1, 1,
0.1439152, 0.5132354, 0.3433259, 0, 0.4196078, 1, 1,
0.1439954, 0.536175, -0.2102402, 0, 0.4117647, 1, 1,
0.144635, 1.35747, 2.224856, 0, 0.4078431, 1, 1,
0.144736, -0.3884666, 1.964144, 0, 0.4, 1, 1,
0.14654, 0.3384336, 0.9843285, 0, 0.3921569, 1, 1,
0.1501686, -0.3644899, 2.556665, 0, 0.3882353, 1, 1,
0.1511642, 1.348595, -0.9377605, 0, 0.3803922, 1, 1,
0.1557138, 0.1342272, 1.503866, 0, 0.3764706, 1, 1,
0.1607683, 0.5800738, -0.6162434, 0, 0.3686275, 1, 1,
0.1643084, -0.5316228, 0.8266796, 0, 0.3647059, 1, 1,
0.1663294, 0.9963528, 1.74278, 0, 0.3568628, 1, 1,
0.1670154, -1.175897, 4.076479, 0, 0.3529412, 1, 1,
0.1705503, -0.1635902, 1.556681, 0, 0.345098, 1, 1,
0.1754777, -0.8381903, 3.978603, 0, 0.3411765, 1, 1,
0.1781659, 0.8506593, -0.4471042, 0, 0.3333333, 1, 1,
0.1841982, -0.3411081, 2.749211, 0, 0.3294118, 1, 1,
0.1863016, -0.159574, 2.929048, 0, 0.3215686, 1, 1,
0.1869702, 0.4937274, 0.5821279, 0, 0.3176471, 1, 1,
0.1869946, -1.725899, 3.435753, 0, 0.3098039, 1, 1,
0.1895514, -1.453971, 1.643636, 0, 0.3058824, 1, 1,
0.1911451, -1.675942, 3.10333, 0, 0.2980392, 1, 1,
0.1913091, 0.3427866, 2.007189, 0, 0.2901961, 1, 1,
0.1941044, -2.3483, 1.684096, 0, 0.2862745, 1, 1,
0.1953087, -1.340335, 0.748412, 0, 0.2784314, 1, 1,
0.1974425, -0.3839035, 2.490335, 0, 0.2745098, 1, 1,
0.1982029, 1.822216, -1.694759, 0, 0.2666667, 1, 1,
0.200209, 0.3105429, -0.692418, 0, 0.2627451, 1, 1,
0.2115593, -0.6460478, 3.248701, 0, 0.254902, 1, 1,
0.2125653, 1.00969, -0.08540875, 0, 0.2509804, 1, 1,
0.2142129, -1.321674, 1.778658, 0, 0.2431373, 1, 1,
0.218455, 0.3792777, 1.041991, 0, 0.2392157, 1, 1,
0.2287318, 1.313201, 0.4623197, 0, 0.2313726, 1, 1,
0.2290963, 1.233081, 0.4365875, 0, 0.227451, 1, 1,
0.231185, -0.003839524, 0.8135139, 0, 0.2196078, 1, 1,
0.2334977, 0.9269393, 0.6394883, 0, 0.2156863, 1, 1,
0.2351158, 0.07714871, 1.29058, 0, 0.2078431, 1, 1,
0.2354932, 0.1358503, 1.183619, 0, 0.2039216, 1, 1,
0.2388682, 2.220232, 0.1785737, 0, 0.1960784, 1, 1,
0.2419373, 0.01997877, 2.505329, 0, 0.1882353, 1, 1,
0.2457526, 1.423213, 1.115329, 0, 0.1843137, 1, 1,
0.2458258, -0.2435642, 2.23893, 0, 0.1764706, 1, 1,
0.2570372, -0.416113, 1.979888, 0, 0.172549, 1, 1,
0.2571285, 0.8117913, -0.1266435, 0, 0.1647059, 1, 1,
0.2658716, -0.447552, 2.734102, 0, 0.1607843, 1, 1,
0.2668047, 0.5001644, 1.134123, 0, 0.1529412, 1, 1,
0.2725184, 1.816726, -1.252892, 0, 0.1490196, 1, 1,
0.2739128, -1.245092, 1.140437, 0, 0.1411765, 1, 1,
0.2741287, 0.187303, 1.062568, 0, 0.1372549, 1, 1,
0.2761042, 0.02589319, 3.672992, 0, 0.1294118, 1, 1,
0.2764366, -0.7877163, 3.477008, 0, 0.1254902, 1, 1,
0.2789198, -1.43563, 3.322545, 0, 0.1176471, 1, 1,
0.2807265, 0.9517416, 0.008197963, 0, 0.1137255, 1, 1,
0.2825151, 1.304222, 0.7988698, 0, 0.1058824, 1, 1,
0.2846577, 0.4550216, 0.1512022, 0, 0.09803922, 1, 1,
0.2894332, 0.5320618, -1.268447, 0, 0.09411765, 1, 1,
0.2910707, -1.383334, 3.287739, 0, 0.08627451, 1, 1,
0.294393, 0.638225, 0.3227074, 0, 0.08235294, 1, 1,
0.295024, 0.1616816, 2.64802, 0, 0.07450981, 1, 1,
0.29781, -0.5782243, 1.394316, 0, 0.07058824, 1, 1,
0.2989028, 0.6833081, -0.1081243, 0, 0.0627451, 1, 1,
0.3029628, 1.950848, 1.139389, 0, 0.05882353, 1, 1,
0.3062406, -0.4822202, 4.540504, 0, 0.05098039, 1, 1,
0.3093787, 1.225499, -0.1375079, 0, 0.04705882, 1, 1,
0.3149016, -0.3204903, 0.8491648, 0, 0.03921569, 1, 1,
0.3181178, 0.03688342, 3.567074, 0, 0.03529412, 1, 1,
0.3190374, 0.2821124, 0.1012581, 0, 0.02745098, 1, 1,
0.3224874, 0.535198, -0.5786777, 0, 0.02352941, 1, 1,
0.3274791, 1.436931, 0.05814231, 0, 0.01568628, 1, 1,
0.3292677, -1.732966, 2.689225, 0, 0.01176471, 1, 1,
0.336766, 1.06213, -0.1819436, 0, 0.003921569, 1, 1,
0.339222, 0.6530254, 0.4022072, 0.003921569, 0, 1, 1,
0.3426404, -1.93291, 3.759002, 0.007843138, 0, 1, 1,
0.3497744, 0.1658884, 0.6936452, 0.01568628, 0, 1, 1,
0.3505123, -1.982345, 0.8573713, 0.01960784, 0, 1, 1,
0.3515354, 0.6878358, -0.3473224, 0.02745098, 0, 1, 1,
0.3566725, -1.236791, 4.031301, 0.03137255, 0, 1, 1,
0.3574727, -0.5677053, 1.889937, 0.03921569, 0, 1, 1,
0.3596654, 0.6694943, 0.08263634, 0.04313726, 0, 1, 1,
0.3653454, -0.2622775, 2.217506, 0.05098039, 0, 1, 1,
0.3660592, -0.8091955, 3.802214, 0.05490196, 0, 1, 1,
0.3664837, 1.496711, 1.45532, 0.0627451, 0, 1, 1,
0.3688104, 0.2381549, 1.10926, 0.06666667, 0, 1, 1,
0.3688212, -0.1304946, 1.941896, 0.07450981, 0, 1, 1,
0.3705506, -1.718544, 1.43485, 0.07843138, 0, 1, 1,
0.3773357, -0.3018829, 1.565184, 0.08627451, 0, 1, 1,
0.3841642, -1.393592, 3.009351, 0.09019608, 0, 1, 1,
0.3853135, 0.1860356, -1.068092, 0.09803922, 0, 1, 1,
0.3863196, 1.682038, 0.1177222, 0.1058824, 0, 1, 1,
0.3882876, -0.3878876, 2.279281, 0.1098039, 0, 1, 1,
0.3931724, -1.029974, 2.851612, 0.1176471, 0, 1, 1,
0.3934836, -1.187719, 4.672236, 0.1215686, 0, 1, 1,
0.4050452, -0.2023638, 1.841872, 0.1294118, 0, 1, 1,
0.4234776, 1.552257, -1.523025, 0.1333333, 0, 1, 1,
0.424374, 1.122141, 0.4457286, 0.1411765, 0, 1, 1,
0.42861, 0.6988503, -1.770166, 0.145098, 0, 1, 1,
0.4313495, -0.7558149, 2.770934, 0.1529412, 0, 1, 1,
0.4315804, -0.5118413, 2.568878, 0.1568628, 0, 1, 1,
0.4331535, -0.2672807, 2.440646, 0.1647059, 0, 1, 1,
0.4391311, -0.008143742, 1.78071, 0.1686275, 0, 1, 1,
0.4397555, -0.2028969, 1.170849, 0.1764706, 0, 1, 1,
0.4428856, -0.3871772, 3.218575, 0.1803922, 0, 1, 1,
0.4431575, 0.7238488, 1.087465, 0.1882353, 0, 1, 1,
0.4434914, -0.4901568, 2.870286, 0.1921569, 0, 1, 1,
0.4447827, 0.09294771, 1.548052, 0.2, 0, 1, 1,
0.447945, 0.4291694, 0.9650462, 0.2078431, 0, 1, 1,
0.455111, 0.4385688, 0.1101677, 0.2117647, 0, 1, 1,
0.4604672, 0.4399401, 2.886822, 0.2196078, 0, 1, 1,
0.4614697, 1.043533, -0.4009972, 0.2235294, 0, 1, 1,
0.4620166, 0.1126611, 1.210984, 0.2313726, 0, 1, 1,
0.4627306, 0.7895429, 1.314395, 0.2352941, 0, 1, 1,
0.4793677, -0.08294871, 0.859596, 0.2431373, 0, 1, 1,
0.4805569, 0.4426678, 0.195809, 0.2470588, 0, 1, 1,
0.4807962, -1.120833, 3.29021, 0.254902, 0, 1, 1,
0.4868826, -0.4116393, 3.052326, 0.2588235, 0, 1, 1,
0.4885432, 0.435688, 0.687122, 0.2666667, 0, 1, 1,
0.4888054, -1.111097, 4.361047, 0.2705882, 0, 1, 1,
0.4903991, -2.19991, 1.935913, 0.2784314, 0, 1, 1,
0.4920547, -1.267116, 2.233892, 0.282353, 0, 1, 1,
0.4949831, -1.609843, 3.201812, 0.2901961, 0, 1, 1,
0.5043064, 2.861209, -0.501678, 0.2941177, 0, 1, 1,
0.5055891, 0.7539186, 1.232322, 0.3019608, 0, 1, 1,
0.5103799, -0.3647852, 2.473264, 0.3098039, 0, 1, 1,
0.5123723, -0.1357125, 1.870055, 0.3137255, 0, 1, 1,
0.5145161, -0.2561161, 2.184073, 0.3215686, 0, 1, 1,
0.5149502, 0.0601963, 0.9764935, 0.3254902, 0, 1, 1,
0.5157429, 0.7923431, -1.080149, 0.3333333, 0, 1, 1,
0.5176654, 1.139283, 0.0641263, 0.3372549, 0, 1, 1,
0.5213097, 0.02580815, 1.460361, 0.345098, 0, 1, 1,
0.5226049, -1.695708, 3.694871, 0.3490196, 0, 1, 1,
0.527601, 0.2476891, 1.589551, 0.3568628, 0, 1, 1,
0.5299929, 0.5300586, 2.556869, 0.3607843, 0, 1, 1,
0.5357338, -2.373704, 1.620474, 0.3686275, 0, 1, 1,
0.5390905, -0.2382515, 1.982912, 0.372549, 0, 1, 1,
0.5402634, 1.137513, -0.751433, 0.3803922, 0, 1, 1,
0.5453862, -0.0876255, 4.033702, 0.3843137, 0, 1, 1,
0.5455511, 0.9458877, 0.9006329, 0.3921569, 0, 1, 1,
0.5579598, -0.5294369, 3.450523, 0.3960784, 0, 1, 1,
0.5582528, 2.425534, 2.547849, 0.4039216, 0, 1, 1,
0.5611999, 0.700856, 0.6803801, 0.4117647, 0, 1, 1,
0.5614972, 0.3630966, 2.648911, 0.4156863, 0, 1, 1,
0.5624979, -0.9901651, 2.324936, 0.4235294, 0, 1, 1,
0.5753526, 0.4362225, -0.80587, 0.427451, 0, 1, 1,
0.5760642, 0.2226298, 0.8372617, 0.4352941, 0, 1, 1,
0.5799099, 1.304466, 0.9318391, 0.4392157, 0, 1, 1,
0.5808638, 0.4108795, 2.394924, 0.4470588, 0, 1, 1,
0.5832749, 1.588534, 0.8979887, 0.4509804, 0, 1, 1,
0.5852798, 0.3512608, 1.422876, 0.4588235, 0, 1, 1,
0.5862269, 1.055699, -0.7319813, 0.4627451, 0, 1, 1,
0.5875409, -1.800322, 1.679164, 0.4705882, 0, 1, 1,
0.5974704, 0.8671769, -1.324857, 0.4745098, 0, 1, 1,
0.5979338, 0.06106408, 0.8924428, 0.4823529, 0, 1, 1,
0.5985376, 0.6619637, 2.464504, 0.4862745, 0, 1, 1,
0.6013292, 0.3683675, -0.2451623, 0.4941176, 0, 1, 1,
0.6132841, 0.02382793, 1.265752, 0.5019608, 0, 1, 1,
0.6144188, -0.7249016, 3.054582, 0.5058824, 0, 1, 1,
0.6171738, -0.9330425, 2.299248, 0.5137255, 0, 1, 1,
0.6217228, 0.4541514, 0.9268379, 0.5176471, 0, 1, 1,
0.6281593, -0.5843846, 2.384418, 0.5254902, 0, 1, 1,
0.6305836, 1.397463, 1.372901, 0.5294118, 0, 1, 1,
0.63449, 0.001455617, 0.1217589, 0.5372549, 0, 1, 1,
0.634612, -1.754323, 2.628744, 0.5411765, 0, 1, 1,
0.6360138, 1.087098, 0.3736312, 0.5490196, 0, 1, 1,
0.6437417, -2.754568, 1.426863, 0.5529412, 0, 1, 1,
0.6441548, 1.592526, 1.470318, 0.5607843, 0, 1, 1,
0.6456096, 0.5307294, 1.251292, 0.5647059, 0, 1, 1,
0.6672266, 0.1028571, 3.865077, 0.572549, 0, 1, 1,
0.6697432, -0.2482592, 2.201849, 0.5764706, 0, 1, 1,
0.6806847, 0.9112995, 0.5574994, 0.5843138, 0, 1, 1,
0.6864312, 0.9079118, -1.235653, 0.5882353, 0, 1, 1,
0.6902436, -0.7710012, 2.772361, 0.5960785, 0, 1, 1,
0.6940267, 0.1765622, 1.647562, 0.6039216, 0, 1, 1,
0.694342, 0.7706705, 1.158553, 0.6078432, 0, 1, 1,
0.6987385, -0.2665458, 1.695988, 0.6156863, 0, 1, 1,
0.6999471, -0.9861583, 3.065178, 0.6196079, 0, 1, 1,
0.7025844, 0.3920117, 1.007535, 0.627451, 0, 1, 1,
0.7038245, -0.7807751, 1.759096, 0.6313726, 0, 1, 1,
0.7059539, 0.5450875, 3.343194, 0.6392157, 0, 1, 1,
0.710609, -0.4344383, 3.81684, 0.6431373, 0, 1, 1,
0.7275, -2.501882, 1.607962, 0.6509804, 0, 1, 1,
0.7286256, -1.721307, 3.174621, 0.654902, 0, 1, 1,
0.7310983, 0.3921289, 1.962682, 0.6627451, 0, 1, 1,
0.7334707, -0.398453, 1.264501, 0.6666667, 0, 1, 1,
0.7362548, 0.6987497, -0.9341267, 0.6745098, 0, 1, 1,
0.7378543, -0.1679458, 0.8458093, 0.6784314, 0, 1, 1,
0.7407283, -0.196635, 2.515845, 0.6862745, 0, 1, 1,
0.748091, -1.553553, 2.970527, 0.6901961, 0, 1, 1,
0.7494675, 0.419405, 1.649749, 0.6980392, 0, 1, 1,
0.7500556, -0.9963118, 1.41577, 0.7058824, 0, 1, 1,
0.7551445, 1.348614, 0.1686611, 0.7098039, 0, 1, 1,
0.7591931, -0.1382499, 2.433915, 0.7176471, 0, 1, 1,
0.7661124, 1.32047, -0.5541335, 0.7215686, 0, 1, 1,
0.7679168, -1.18497, 5.086728, 0.7294118, 0, 1, 1,
0.7705566, 0.1637267, 3.384295, 0.7333333, 0, 1, 1,
0.770686, 0.6275197, 3.341328, 0.7411765, 0, 1, 1,
0.7723235, -0.6789868, 1.143696, 0.7450981, 0, 1, 1,
0.7773041, 1.764117, 1.262974, 0.7529412, 0, 1, 1,
0.7922689, -0.7594854, 3.391364, 0.7568628, 0, 1, 1,
0.796967, -1.532114, 1.467128, 0.7647059, 0, 1, 1,
0.800873, -0.2224099, 1.232448, 0.7686275, 0, 1, 1,
0.8021809, 0.7954976, 1.285368, 0.7764706, 0, 1, 1,
0.8156024, -0.03003047, 1.051005, 0.7803922, 0, 1, 1,
0.8192695, -0.6273915, 1.298106, 0.7882353, 0, 1, 1,
0.8251277, 0.1611247, 1.708424, 0.7921569, 0, 1, 1,
0.8274325, -1.372218, 1.282039, 0.8, 0, 1, 1,
0.8289847, 0.7777663, 1.610138, 0.8078431, 0, 1, 1,
0.8309247, -0.6519157, 0.7183186, 0.8117647, 0, 1, 1,
0.8366497, -1.35906, 2.019367, 0.8196079, 0, 1, 1,
0.8422417, 0.5626543, 0.2148076, 0.8235294, 0, 1, 1,
0.845819, -1.440327, 3.083719, 0.8313726, 0, 1, 1,
0.8482869, -0.380791, 2.834308, 0.8352941, 0, 1, 1,
0.8493254, -0.506583, 1.330236, 0.8431373, 0, 1, 1,
0.8606542, -0.6736538, 0.7682582, 0.8470588, 0, 1, 1,
0.8635089, 0.6019503, 0.1936682, 0.854902, 0, 1, 1,
0.8646306, -1.909949, 1.881018, 0.8588235, 0, 1, 1,
0.8654854, -0.7373809, 1.617658, 0.8666667, 0, 1, 1,
0.8691273, -1.657063, 5.128419, 0.8705882, 0, 1, 1,
0.8703784, 1.958551, -0.9029298, 0.8784314, 0, 1, 1,
0.8796887, -0.975946, 1.008281, 0.8823529, 0, 1, 1,
0.8797439, -0.4319833, 0.2478612, 0.8901961, 0, 1, 1,
0.8902211, 2.480924, 1.41128, 0.8941177, 0, 1, 1,
0.9044386, -0.5975523, 0.35847, 0.9019608, 0, 1, 1,
0.9095643, 0.08423819, 1.454793, 0.9098039, 0, 1, 1,
0.9151045, 0.3028036, 0.5499089, 0.9137255, 0, 1, 1,
0.9152111, -0.8368589, 2.438765, 0.9215686, 0, 1, 1,
0.9303842, 1.19761, 0.3548404, 0.9254902, 0, 1, 1,
0.9323403, 0.07871312, 2.400502, 0.9333333, 0, 1, 1,
0.9337002, 1.116582, 0.04717958, 0.9372549, 0, 1, 1,
0.9389024, 0.2034389, -0.6970972, 0.945098, 0, 1, 1,
0.9407233, -0.8585483, 4.440052, 0.9490196, 0, 1, 1,
0.9453318, -0.4628434, 1.271762, 0.9568627, 0, 1, 1,
0.9480605, 1.094456, 0.286018, 0.9607843, 0, 1, 1,
0.9509512, 0.6178781, 1.647833, 0.9686275, 0, 1, 1,
0.9567934, 1.211375, 0.2064843, 0.972549, 0, 1, 1,
0.9590296, -0.3421616, 1.670773, 0.9803922, 0, 1, 1,
0.9612917, 0.3337656, 0.9762821, 0.9843137, 0, 1, 1,
0.9617961, 0.3536004, 0.5927928, 0.9921569, 0, 1, 1,
0.96188, 0.3921311, 1.963786, 0.9960784, 0, 1, 1,
0.9633437, -1.152966, 3.07757, 1, 0, 0.9960784, 1,
0.9671676, -0.4413342, 3.131165, 1, 0, 0.9882353, 1,
0.9699386, -0.4295798, 1.766928, 1, 0, 0.9843137, 1,
0.9762528, -1.070498, 0.8860078, 1, 0, 0.9764706, 1,
0.9767531, 0.2967478, -0.1399579, 1, 0, 0.972549, 1,
0.9975414, 1.194582, 2.552057, 1, 0, 0.9647059, 1,
1.001048, 0.4822866, 1.672702, 1, 0, 0.9607843, 1,
1.011444, -0.6437153, 3.235636, 1, 0, 0.9529412, 1,
1.011561, 1.729036, 0.6165881, 1, 0, 0.9490196, 1,
1.014692, -0.9022155, 1.419543, 1, 0, 0.9411765, 1,
1.020758, -0.732171, 1.634357, 1, 0, 0.9372549, 1,
1.024288, -1.209211, 2.272164, 1, 0, 0.9294118, 1,
1.024681, 0.885887, 0.5130763, 1, 0, 0.9254902, 1,
1.024715, -1.435846, 1.416073, 1, 0, 0.9176471, 1,
1.025929, 0.5360407, 0.7894658, 1, 0, 0.9137255, 1,
1.031272, 0.3992245, -0.2358178, 1, 0, 0.9058824, 1,
1.033817, 0.5929283, 0.6746625, 1, 0, 0.9019608, 1,
1.037617, 0.2360793, -0.8971513, 1, 0, 0.8941177, 1,
1.040447, 1.55972, 1.681576, 1, 0, 0.8862745, 1,
1.040948, -1.511743, 2.50861, 1, 0, 0.8823529, 1,
1.062099, 0.4072989, -0.2243576, 1, 0, 0.8745098, 1,
1.065899, 1.003531, 1.171358, 1, 0, 0.8705882, 1,
1.071181, -1.371515, 1.555672, 1, 0, 0.8627451, 1,
1.073341, 0.2789232, 1.946118, 1, 0, 0.8588235, 1,
1.073771, 0.2694169, 0.9794442, 1, 0, 0.8509804, 1,
1.074875, -0.3942147, 1.051586, 1, 0, 0.8470588, 1,
1.078507, 1.224115, 0.4758193, 1, 0, 0.8392157, 1,
1.082054, -0.3511964, 0.9880111, 1, 0, 0.8352941, 1,
1.083391, -0.56052, 1.959957, 1, 0, 0.827451, 1,
1.083886, 0.630539, 0.5555427, 1, 0, 0.8235294, 1,
1.092683, 0.8720014, 1.288257, 1, 0, 0.8156863, 1,
1.097827, 0.4402291, 0.6492913, 1, 0, 0.8117647, 1,
1.101082, 0.1413701, 0.3541034, 1, 0, 0.8039216, 1,
1.112674, 0.7887823, 0.3919747, 1, 0, 0.7960784, 1,
1.116873, -0.324582, 2.392905, 1, 0, 0.7921569, 1,
1.129182, 0.1622721, 2.169745, 1, 0, 0.7843137, 1,
1.133402, -0.02918454, 4.060829, 1, 0, 0.7803922, 1,
1.137383, 1.368332, -0.7253971, 1, 0, 0.772549, 1,
1.139076, 0.6743262, 0.5847942, 1, 0, 0.7686275, 1,
1.152122, -0.04178305, 2.213849, 1, 0, 0.7607843, 1,
1.154251, 0.4174708, 2.494525, 1, 0, 0.7568628, 1,
1.155673, -0.5891574, 0.7509812, 1, 0, 0.7490196, 1,
1.158382, 1.790576, 0.1411207, 1, 0, 0.7450981, 1,
1.166285, -1.251083, 1.727906, 1, 0, 0.7372549, 1,
1.170289, 0.571, 0.1823816, 1, 0, 0.7333333, 1,
1.20241, -0.4842987, 1.218686, 1, 0, 0.7254902, 1,
1.203336, 0.5591611, -0.1808596, 1, 0, 0.7215686, 1,
1.204872, -0.683279, 2.679922, 1, 0, 0.7137255, 1,
1.208909, -0.5905793, 1.185404, 1, 0, 0.7098039, 1,
1.211857, 1.5627, 1.120363, 1, 0, 0.7019608, 1,
1.21262, 2.441261, -1.15945, 1, 0, 0.6941177, 1,
1.213243, 0.1464607, 0.944309, 1, 0, 0.6901961, 1,
1.222464, -0.6636673, 2.774678, 1, 0, 0.682353, 1,
1.223783, -0.008588076, 0.8910976, 1, 0, 0.6784314, 1,
1.225372, 0.2786844, 0.7088967, 1, 0, 0.6705883, 1,
1.228479, 0.5636998, 0.8385598, 1, 0, 0.6666667, 1,
1.229548, 0.5086098, 0.2788246, 1, 0, 0.6588235, 1,
1.234955, 1.06443, 1.151881, 1, 0, 0.654902, 1,
1.23625, 2.947243, -0.686979, 1, 0, 0.6470588, 1,
1.236345, 1.276541, -0.9526051, 1, 0, 0.6431373, 1,
1.237506, 0.7654309, 1.625607, 1, 0, 0.6352941, 1,
1.250084, -0.5474069, 3.044409, 1, 0, 0.6313726, 1,
1.252728, 0.4411819, 1.401057, 1, 0, 0.6235294, 1,
1.258428, 0.005372967, 3.02182, 1, 0, 0.6196079, 1,
1.261075, 0.2493268, 0.371436, 1, 0, 0.6117647, 1,
1.261735, 1.554301, -1.167677, 1, 0, 0.6078432, 1,
1.271377, -1.086138, 3.139779, 1, 0, 0.6, 1,
1.274951, -1.161809, 1.414333, 1, 0, 0.5921569, 1,
1.277906, 1.779523, -0.1435236, 1, 0, 0.5882353, 1,
1.283193, 0.8936691, -0.8542081, 1, 0, 0.5803922, 1,
1.284804, 1.332822, -0.2089865, 1, 0, 0.5764706, 1,
1.286728, -0.4269383, 2.372356, 1, 0, 0.5686275, 1,
1.28786, -1.924311, 1.03402, 1, 0, 0.5647059, 1,
1.287953, -0.4655042, 1.895122, 1, 0, 0.5568628, 1,
1.289807, -0.2509879, 1.45233, 1, 0, 0.5529412, 1,
1.297739, 1.227666, 0.9782868, 1, 0, 0.5450981, 1,
1.299719, 1.640779, 0.2534488, 1, 0, 0.5411765, 1,
1.303073, 0.5780786, 0.1470044, 1, 0, 0.5333334, 1,
1.315058, -0.5782508, 0.74457, 1, 0, 0.5294118, 1,
1.318155, 0.02327646, 2.064559, 1, 0, 0.5215687, 1,
1.32129, 1.734945, 0.4716433, 1, 0, 0.5176471, 1,
1.321339, 0.7356362, 0.7409748, 1, 0, 0.509804, 1,
1.324799, -1.143978, 1.530901, 1, 0, 0.5058824, 1,
1.353042, 0.7505594, 1.820953, 1, 0, 0.4980392, 1,
1.353355, -0.928259, 2.023887, 1, 0, 0.4901961, 1,
1.363065, 1.070304, 1.557306, 1, 0, 0.4862745, 1,
1.36837, 0.8679212, 0.8541216, 1, 0, 0.4784314, 1,
1.374519, -0.03167138, 2.539458, 1, 0, 0.4745098, 1,
1.379931, -0.9499046, 2.514455, 1, 0, 0.4666667, 1,
1.407714, 0.5927787, 1.285157, 1, 0, 0.4627451, 1,
1.414134, -0.6028829, 2.478427, 1, 0, 0.454902, 1,
1.415275, 0.3921859, 0.8999525, 1, 0, 0.4509804, 1,
1.439044, 0.9479754, 1.170061, 1, 0, 0.4431373, 1,
1.445139, 0.1871919, 1.913968, 1, 0, 0.4392157, 1,
1.451067, -1.574509, 0.7222852, 1, 0, 0.4313726, 1,
1.456555, -0.8996865, 3.197185, 1, 0, 0.427451, 1,
1.459866, -0.8634079, 0.922801, 1, 0, 0.4196078, 1,
1.459928, -0.8030576, 3.44455, 1, 0, 0.4156863, 1,
1.462494, -0.5174108, 0.9321664, 1, 0, 0.4078431, 1,
1.476068, -0.1814579, 0.7374338, 1, 0, 0.4039216, 1,
1.480359, -0.3939781, 1.92656, 1, 0, 0.3960784, 1,
1.488338, -1.366072, 1.679134, 1, 0, 0.3882353, 1,
1.488616, -0.7054471, 0.9345352, 1, 0, 0.3843137, 1,
1.489248, -0.5954581, 0.8919631, 1, 0, 0.3764706, 1,
1.49279, -0.06645463, 0.7946277, 1, 0, 0.372549, 1,
1.493029, -0.5267903, 1.511004, 1, 0, 0.3647059, 1,
1.503152, 0.9231448, 1.1536, 1, 0, 0.3607843, 1,
1.518888, 1.473656, 1.208451, 1, 0, 0.3529412, 1,
1.541142, -0.5595576, 0.5136592, 1, 0, 0.3490196, 1,
1.550562, 0.03604332, 1.253109, 1, 0, 0.3411765, 1,
1.566934, 0.7034847, 1.624995, 1, 0, 0.3372549, 1,
1.580481, -0.1087765, 2.625021, 1, 0, 0.3294118, 1,
1.58206, 1.305147, 2.232819, 1, 0, 0.3254902, 1,
1.594522, -0.2350137, 1.513037, 1, 0, 0.3176471, 1,
1.597299, -1.531653, 2.911063, 1, 0, 0.3137255, 1,
1.611628, 0.537828, 1.582394, 1, 0, 0.3058824, 1,
1.63212, 0.2089982, 1.823566, 1, 0, 0.2980392, 1,
1.633873, 1.332634, -0.427489, 1, 0, 0.2941177, 1,
1.651718, -1.24373, 1.370451, 1, 0, 0.2862745, 1,
1.691471, 0.06512232, 1.39587, 1, 0, 0.282353, 1,
1.724509, 1.557788, 0.2400565, 1, 0, 0.2745098, 1,
1.729408, 1.390571, 0.4436637, 1, 0, 0.2705882, 1,
1.768094, -1.039065, 3.188277, 1, 0, 0.2627451, 1,
1.787054, 0.2603675, 1.877367, 1, 0, 0.2588235, 1,
1.797046, 0.4909377, 1.812896, 1, 0, 0.2509804, 1,
1.807053, -0.4415084, 1.862884, 1, 0, 0.2470588, 1,
1.815953, 0.3800507, 0.6585606, 1, 0, 0.2392157, 1,
1.821225, 1.143903, -0.9646518, 1, 0, 0.2352941, 1,
1.823406, -0.4903046, 2.022004, 1, 0, 0.227451, 1,
1.828435, 0.1204175, 0.628949, 1, 0, 0.2235294, 1,
1.829381, 0.2644804, 2.324875, 1, 0, 0.2156863, 1,
1.838694, 0.03057374, 2.382156, 1, 0, 0.2117647, 1,
1.844155, -1.725924, 2.24479, 1, 0, 0.2039216, 1,
1.846421, -1.671881, 1.717875, 1, 0, 0.1960784, 1,
1.849223, 1.11709, 0.5595734, 1, 0, 0.1921569, 1,
1.852893, -0.216353, -0.1235376, 1, 0, 0.1843137, 1,
1.881697, -0.3882872, 3.708836, 1, 0, 0.1803922, 1,
1.882659, -1.691771, 2.046369, 1, 0, 0.172549, 1,
1.885992, 0.5923487, 0.7915994, 1, 0, 0.1686275, 1,
1.891103, -1.169017, 2.540342, 1, 0, 0.1607843, 1,
1.900263, 0.4162609, 0.5417036, 1, 0, 0.1568628, 1,
1.914266, -0.7528274, 2.926467, 1, 0, 0.1490196, 1,
1.923542, -1.545911, 3.77333, 1, 0, 0.145098, 1,
1.943668, 0.474026, 0.3362634, 1, 0, 0.1372549, 1,
1.993551, -0.373836, 2.105516, 1, 0, 0.1333333, 1,
2.007145, -0.3108873, 3.699136, 1, 0, 0.1254902, 1,
2.026421, -0.7433606, 2.151496, 1, 0, 0.1215686, 1,
2.036453, 0.4941331, 3.198695, 1, 0, 0.1137255, 1,
2.046634, 1.737172, 0.08747714, 1, 0, 0.1098039, 1,
2.109396, -1.639031, 2.287036, 1, 0, 0.1019608, 1,
2.131782, 0.4168737, 1.023151, 1, 0, 0.09411765, 1,
2.153486, -1.065571, 2.274578, 1, 0, 0.09019608, 1,
2.193422, 0.6715921, 1.601789, 1, 0, 0.08235294, 1,
2.201942, -2.288218, 1.058664, 1, 0, 0.07843138, 1,
2.211715, -1.769173, 2.949812, 1, 0, 0.07058824, 1,
2.212408, -0.8192542, 3.44555, 1, 0, 0.06666667, 1,
2.234059, -0.7338345, 3.674725, 1, 0, 0.05882353, 1,
2.237492, -0.1546302, 2.266893, 1, 0, 0.05490196, 1,
2.305218, -0.8157884, 1.788478, 1, 0, 0.04705882, 1,
2.3094, -0.9671187, 1.918227, 1, 0, 0.04313726, 1,
2.333166, -0.7787765, 2.161461, 1, 0, 0.03529412, 1,
2.432853, 1.882873, 1.820592, 1, 0, 0.03137255, 1,
2.552406, -0.5418668, 2.672568, 1, 0, 0.02352941, 1,
2.668144, 1.123958, 0.4773514, 1, 0, 0.01960784, 1,
2.78693, -1.234018, 1.200093, 1, 0, 0.01176471, 1,
2.809868, -1.81914, 2.347602, 1, 0, 0.007843138, 1
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
-0.0083462, -4.268558, -7.705089, 0, -0.5, 0.5, 0.5,
-0.0083462, -4.268558, -7.705089, 1, -0.5, 0.5, 0.5,
-0.0083462, -4.268558, -7.705089, 1, 1.5, 0.5, 0.5,
-0.0083462, -4.268558, -7.705089, 0, 1.5, 0.5, 0.5
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
-3.781935, 0.2568516, -7.705089, 0, -0.5, 0.5, 0.5,
-3.781935, 0.2568516, -7.705089, 1, -0.5, 0.5, 0.5,
-3.781935, 0.2568516, -7.705089, 1, 1.5, 0.5, 0.5,
-3.781935, 0.2568516, -7.705089, 0, 1.5, 0.5, 0.5
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
-3.781935, -4.268558, -0.3377788, 0, -0.5, 0.5, 0.5,
-3.781935, -4.268558, -0.3377788, 1, -0.5, 0.5, 0.5,
-3.781935, -4.268558, -0.3377788, 1, 1.5, 0.5, 0.5,
-3.781935, -4.268558, -0.3377788, 0, 1.5, 0.5, 0.5
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
-2, -3.224233, -6.004941,
2, -3.224233, -6.004941,
-2, -3.224233, -6.004941,
-2, -3.398287, -6.288299,
-1, -3.224233, -6.004941,
-1, -3.398287, -6.288299,
0, -3.224233, -6.004941,
0, -3.398287, -6.288299,
1, -3.224233, -6.004941,
1, -3.398287, -6.288299,
2, -3.224233, -6.004941,
2, -3.398287, -6.288299
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
-2, -3.746395, -6.855015, 0, -0.5, 0.5, 0.5,
-2, -3.746395, -6.855015, 1, -0.5, 0.5, 0.5,
-2, -3.746395, -6.855015, 1, 1.5, 0.5, 0.5,
-2, -3.746395, -6.855015, 0, 1.5, 0.5, 0.5,
-1, -3.746395, -6.855015, 0, -0.5, 0.5, 0.5,
-1, -3.746395, -6.855015, 1, -0.5, 0.5, 0.5,
-1, -3.746395, -6.855015, 1, 1.5, 0.5, 0.5,
-1, -3.746395, -6.855015, 0, 1.5, 0.5, 0.5,
0, -3.746395, -6.855015, 0, -0.5, 0.5, 0.5,
0, -3.746395, -6.855015, 1, -0.5, 0.5, 0.5,
0, -3.746395, -6.855015, 1, 1.5, 0.5, 0.5,
0, -3.746395, -6.855015, 0, 1.5, 0.5, 0.5,
1, -3.746395, -6.855015, 0, -0.5, 0.5, 0.5,
1, -3.746395, -6.855015, 1, -0.5, 0.5, 0.5,
1, -3.746395, -6.855015, 1, 1.5, 0.5, 0.5,
1, -3.746395, -6.855015, 0, 1.5, 0.5, 0.5,
2, -3.746395, -6.855015, 0, -0.5, 0.5, 0.5,
2, -3.746395, -6.855015, 1, -0.5, 0.5, 0.5,
2, -3.746395, -6.855015, 1, 1.5, 0.5, 0.5,
2, -3.746395, -6.855015, 0, 1.5, 0.5, 0.5
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
-2.911107, -3, -6.004941,
-2.911107, 3, -6.004941,
-2.911107, -3, -6.004941,
-3.056245, -3, -6.288299,
-2.911107, -2, -6.004941,
-3.056245, -2, -6.288299,
-2.911107, -1, -6.004941,
-3.056245, -1, -6.288299,
-2.911107, 0, -6.004941,
-3.056245, 0, -6.288299,
-2.911107, 1, -6.004941,
-3.056245, 1, -6.288299,
-2.911107, 2, -6.004941,
-3.056245, 2, -6.288299,
-2.911107, 3, -6.004941,
-3.056245, 3, -6.288299
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
-3.346521, -3, -6.855015, 0, -0.5, 0.5, 0.5,
-3.346521, -3, -6.855015, 1, -0.5, 0.5, 0.5,
-3.346521, -3, -6.855015, 1, 1.5, 0.5, 0.5,
-3.346521, -3, -6.855015, 0, 1.5, 0.5, 0.5,
-3.346521, -2, -6.855015, 0, -0.5, 0.5, 0.5,
-3.346521, -2, -6.855015, 1, -0.5, 0.5, 0.5,
-3.346521, -2, -6.855015, 1, 1.5, 0.5, 0.5,
-3.346521, -2, -6.855015, 0, 1.5, 0.5, 0.5,
-3.346521, -1, -6.855015, 0, -0.5, 0.5, 0.5,
-3.346521, -1, -6.855015, 1, -0.5, 0.5, 0.5,
-3.346521, -1, -6.855015, 1, 1.5, 0.5, 0.5,
-3.346521, -1, -6.855015, 0, 1.5, 0.5, 0.5,
-3.346521, 0, -6.855015, 0, -0.5, 0.5, 0.5,
-3.346521, 0, -6.855015, 1, -0.5, 0.5, 0.5,
-3.346521, 0, -6.855015, 1, 1.5, 0.5, 0.5,
-3.346521, 0, -6.855015, 0, 1.5, 0.5, 0.5,
-3.346521, 1, -6.855015, 0, -0.5, 0.5, 0.5,
-3.346521, 1, -6.855015, 1, -0.5, 0.5, 0.5,
-3.346521, 1, -6.855015, 1, 1.5, 0.5, 0.5,
-3.346521, 1, -6.855015, 0, 1.5, 0.5, 0.5,
-3.346521, 2, -6.855015, 0, -0.5, 0.5, 0.5,
-3.346521, 2, -6.855015, 1, -0.5, 0.5, 0.5,
-3.346521, 2, -6.855015, 1, 1.5, 0.5, 0.5,
-3.346521, 2, -6.855015, 0, 1.5, 0.5, 0.5,
-3.346521, 3, -6.855015, 0, -0.5, 0.5, 0.5,
-3.346521, 3, -6.855015, 1, -0.5, 0.5, 0.5,
-3.346521, 3, -6.855015, 1, 1.5, 0.5, 0.5,
-3.346521, 3, -6.855015, 0, 1.5, 0.5, 0.5
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
-2.911107, -3.224233, -4,
-2.911107, -3.224233, 4,
-2.911107, -3.224233, -4,
-3.056245, -3.398287, -4,
-2.911107, -3.224233, -2,
-3.056245, -3.398287, -2,
-2.911107, -3.224233, 0,
-3.056245, -3.398287, 0,
-2.911107, -3.224233, 2,
-3.056245, -3.398287, 2,
-2.911107, -3.224233, 4,
-3.056245, -3.398287, 4
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
-3.346521, -3.746395, -4, 0, -0.5, 0.5, 0.5,
-3.346521, -3.746395, -4, 1, -0.5, 0.5, 0.5,
-3.346521, -3.746395, -4, 1, 1.5, 0.5, 0.5,
-3.346521, -3.746395, -4, 0, 1.5, 0.5, 0.5,
-3.346521, -3.746395, -2, 0, -0.5, 0.5, 0.5,
-3.346521, -3.746395, -2, 1, -0.5, 0.5, 0.5,
-3.346521, -3.746395, -2, 1, 1.5, 0.5, 0.5,
-3.346521, -3.746395, -2, 0, 1.5, 0.5, 0.5,
-3.346521, -3.746395, 0, 0, -0.5, 0.5, 0.5,
-3.346521, -3.746395, 0, 1, -0.5, 0.5, 0.5,
-3.346521, -3.746395, 0, 1, 1.5, 0.5, 0.5,
-3.346521, -3.746395, 0, 0, 1.5, 0.5, 0.5,
-3.346521, -3.746395, 2, 0, -0.5, 0.5, 0.5,
-3.346521, -3.746395, 2, 1, -0.5, 0.5, 0.5,
-3.346521, -3.746395, 2, 1, 1.5, 0.5, 0.5,
-3.346521, -3.746395, 2, 0, 1.5, 0.5, 0.5,
-3.346521, -3.746395, 4, 0, -0.5, 0.5, 0.5,
-3.346521, -3.746395, 4, 1, -0.5, 0.5, 0.5,
-3.346521, -3.746395, 4, 1, 1.5, 0.5, 0.5,
-3.346521, -3.746395, 4, 0, 1.5, 0.5, 0.5
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
-2.911107, -3.224233, -6.004941,
-2.911107, 3.737936, -6.004941,
-2.911107, -3.224233, 5.329383,
-2.911107, 3.737936, 5.329383,
-2.911107, -3.224233, -6.004941,
-2.911107, -3.224233, 5.329383,
-2.911107, 3.737936, -6.004941,
-2.911107, 3.737936, 5.329383,
-2.911107, -3.224233, -6.004941,
2.894415, -3.224233, -6.004941,
-2.911107, -3.224233, 5.329383,
2.894415, -3.224233, 5.329383,
-2.911107, 3.737936, -6.004941,
2.894415, 3.737936, -6.004941,
-2.911107, 3.737936, 5.329383,
2.894415, 3.737936, 5.329383,
2.894415, -3.224233, -6.004941,
2.894415, 3.737936, -6.004941,
2.894415, -3.224233, 5.329383,
2.894415, 3.737936, 5.329383,
2.894415, -3.224233, -6.004941,
2.894415, -3.224233, 5.329383,
2.894415, 3.737936, -6.004941,
2.894415, 3.737936, 5.329383
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
var radius = 7.749947;
var distance = 34.48039;
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
mvMatrix.translate( 0.0083462, -0.2568516, 0.3377788 );
mvMatrix.scale( 1.443349, 1.203561, 0.7392938 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48039);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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


