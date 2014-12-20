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
-2.873807, 0.3278046, 0.2358329, 1, 0, 0, 1,
-2.838595, -0.4383685, -1.306827, 1, 0.007843138, 0, 1,
-2.58221, 0.6873943, -0.04869667, 1, 0.01176471, 0, 1,
-2.559732, -1.751295, -2.619792, 1, 0.01960784, 0, 1,
-2.513527, 1.44678, -1.363864, 1, 0.02352941, 0, 1,
-2.500285, -0.5514013, -1.040968, 1, 0.03137255, 0, 1,
-2.47711, 0.6479999, -1.018382, 1, 0.03529412, 0, 1,
-2.458576, -0.626116, -0.691046, 1, 0.04313726, 0, 1,
-2.371654, 1.155977, -0.3396113, 1, 0.04705882, 0, 1,
-2.34849, -1.431863, -2.695705, 1, 0.05490196, 0, 1,
-2.299262, 0.160768, -0.06607807, 1, 0.05882353, 0, 1,
-2.295774, -0.473485, -2.161757, 1, 0.06666667, 0, 1,
-2.227638, 0.6527203, -1.498521, 1, 0.07058824, 0, 1,
-2.20546, 0.6692079, -1.381091, 1, 0.07843138, 0, 1,
-2.197084, 0.3854469, -1.406412, 1, 0.08235294, 0, 1,
-2.182174, -0.7120999, -3.36699, 1, 0.09019608, 0, 1,
-2.165681, 0.7048265, -2.318604, 1, 0.09411765, 0, 1,
-2.118943, -1.122722, -0.824194, 1, 0.1019608, 0, 1,
-2.099124, 0.8433899, 0.08319817, 1, 0.1098039, 0, 1,
-2.049473, -1.553199, -1.468537, 1, 0.1137255, 0, 1,
-2.019741, 0.3231035, -0.9131076, 1, 0.1215686, 0, 1,
-2.014283, -0.2189586, -1.664992, 1, 0.1254902, 0, 1,
-1.960414, -0.06857415, -0.1921751, 1, 0.1333333, 0, 1,
-1.957956, -0.3325443, -0.9062486, 1, 0.1372549, 0, 1,
-1.920576, -0.1189206, -1.911433, 1, 0.145098, 0, 1,
-1.917634, -0.2013085, -1.769482, 1, 0.1490196, 0, 1,
-1.912466, 0.7360463, 0.0899239, 1, 0.1568628, 0, 1,
-1.909055, 0.3297011, -1.953719, 1, 0.1607843, 0, 1,
-1.907357, -0.2756907, -1.63954, 1, 0.1686275, 0, 1,
-1.843874, -1.619119, -2.010691, 1, 0.172549, 0, 1,
-1.840932, 0.79504, -1.961483, 1, 0.1803922, 0, 1,
-1.823359, -0.3336641, -2.896085, 1, 0.1843137, 0, 1,
-1.821189, -0.8095759, -0.4125046, 1, 0.1921569, 0, 1,
-1.817888, -1.840468, -2.710494, 1, 0.1960784, 0, 1,
-1.810716, 1.031379, -1.208547, 1, 0.2039216, 0, 1,
-1.807024, 0.9331367, -1.969173, 1, 0.2117647, 0, 1,
-1.798628, -1.056952, -0.1323372, 1, 0.2156863, 0, 1,
-1.768162, 0.2498357, -0.7112548, 1, 0.2235294, 0, 1,
-1.754542, -1.468295, -3.133821, 1, 0.227451, 0, 1,
-1.754312, 0.06497736, -1.354938, 1, 0.2352941, 0, 1,
-1.750936, 1.302635, -1.667051, 1, 0.2392157, 0, 1,
-1.727067, -0.08221695, -0.6506453, 1, 0.2470588, 0, 1,
-1.71884, 0.843628, -0.858204, 1, 0.2509804, 0, 1,
-1.714418, 1.377925, -0.8226888, 1, 0.2588235, 0, 1,
-1.713897, 0.7534918, 0.6524691, 1, 0.2627451, 0, 1,
-1.70725, -0.5610701, -3.060089, 1, 0.2705882, 0, 1,
-1.699638, -0.6298821, -3.382319, 1, 0.2745098, 0, 1,
-1.698535, -0.0142619, -1.919928, 1, 0.282353, 0, 1,
-1.693637, -0.1512744, -1.299541, 1, 0.2862745, 0, 1,
-1.678064, -0.07782196, -1.131205, 1, 0.2941177, 0, 1,
-1.675731, 0.032691, -1.352842, 1, 0.3019608, 0, 1,
-1.659832, 0.3643456, -1.393479, 1, 0.3058824, 0, 1,
-1.627348, 1.03612, -1.468436, 1, 0.3137255, 0, 1,
-1.621861, -0.6916603, -0.01222063, 1, 0.3176471, 0, 1,
-1.608487, 0.4959605, -0.71734, 1, 0.3254902, 0, 1,
-1.603203, 1.158771, -0.2633823, 1, 0.3294118, 0, 1,
-1.592643, -0.7445183, -0.04197303, 1, 0.3372549, 0, 1,
-1.58848, -0.09210802, -2.099489, 1, 0.3411765, 0, 1,
-1.581437, 1.037035, -1.019172, 1, 0.3490196, 0, 1,
-1.580298, 0.05752345, -0.9462703, 1, 0.3529412, 0, 1,
-1.57914, 0.936802, 0.3292002, 1, 0.3607843, 0, 1,
-1.556419, 0.2327386, -0.7832065, 1, 0.3647059, 0, 1,
-1.556104, 1.781654, -0.1826037, 1, 0.372549, 0, 1,
-1.554516, -0.3142523, -1.181183, 1, 0.3764706, 0, 1,
-1.551404, -0.2274116, -2.570679, 1, 0.3843137, 0, 1,
-1.543558, -1.044267, -3.929842, 1, 0.3882353, 0, 1,
-1.532639, -0.6580207, -2.680213, 1, 0.3960784, 0, 1,
-1.530002, -0.8229351, -1.257033, 1, 0.4039216, 0, 1,
-1.518793, -0.3869637, -2.228545, 1, 0.4078431, 0, 1,
-1.513006, 0.1024425, -1.296424, 1, 0.4156863, 0, 1,
-1.51235, 0.00408965, -1.038284, 1, 0.4196078, 0, 1,
-1.506363, -1.34195, -3.213688, 1, 0.427451, 0, 1,
-1.494128, -2.167581, -2.98039, 1, 0.4313726, 0, 1,
-1.488154, -0.7658121, -2.891682, 1, 0.4392157, 0, 1,
-1.486074, -0.9584461, -4.124394, 1, 0.4431373, 0, 1,
-1.470071, -0.3620497, -2.886952, 1, 0.4509804, 0, 1,
-1.468625, -1.122368, -1.7315, 1, 0.454902, 0, 1,
-1.463323, 1.66282, -0.2825087, 1, 0.4627451, 0, 1,
-1.457037, -0.9523087, -4.24867, 1, 0.4666667, 0, 1,
-1.453938, 1.22499, -1.277462, 1, 0.4745098, 0, 1,
-1.452723, -0.3973255, -2.084293, 1, 0.4784314, 0, 1,
-1.446958, -0.6875851, -1.847023, 1, 0.4862745, 0, 1,
-1.444353, 0.4525194, -1.207834, 1, 0.4901961, 0, 1,
-1.440154, 0.1545522, -0.6307586, 1, 0.4980392, 0, 1,
-1.434763, 1.092665, -0.595975, 1, 0.5058824, 0, 1,
-1.420163, -1.748207, -2.198809, 1, 0.509804, 0, 1,
-1.399236, -0.08111835, -3.160497, 1, 0.5176471, 0, 1,
-1.390744, -2.575429, -3.374883, 1, 0.5215687, 0, 1,
-1.383207, 0.1501102, -1.591766, 1, 0.5294118, 0, 1,
-1.368972, -0.4159094, -2.852307, 1, 0.5333334, 0, 1,
-1.353203, -0.6849015, -2.192961, 1, 0.5411765, 0, 1,
-1.348629, 1.08826, -0.6109448, 1, 0.5450981, 0, 1,
-1.347761, 0.6015911, -0.3513055, 1, 0.5529412, 0, 1,
-1.346428, 0.09032292, -1.657498, 1, 0.5568628, 0, 1,
-1.343114, -0.3367331, -2.390131, 1, 0.5647059, 0, 1,
-1.336109, 0.5716533, -1.737694, 1, 0.5686275, 0, 1,
-1.326746, -0.7701449, -0.6497999, 1, 0.5764706, 0, 1,
-1.320478, -0.08938569, -2.107056, 1, 0.5803922, 0, 1,
-1.308384, 1.950901, 0.0001834384, 1, 0.5882353, 0, 1,
-1.302268, 0.2636073, -1.570806, 1, 0.5921569, 0, 1,
-1.287287, 0.1560386, -2.37564, 1, 0.6, 0, 1,
-1.286597, 1.404746, 0.7320673, 1, 0.6078432, 0, 1,
-1.280847, 0.1906338, -0.8012515, 1, 0.6117647, 0, 1,
-1.277491, -2.059997, -4.176112, 1, 0.6196079, 0, 1,
-1.269197, 1.160647, -0.4956034, 1, 0.6235294, 0, 1,
-1.263385, -0.692522, -3.913773, 1, 0.6313726, 0, 1,
-1.259264, 0.2270507, -1.179176, 1, 0.6352941, 0, 1,
-1.240309, 1.361676, -0.703866, 1, 0.6431373, 0, 1,
-1.231477, 1.356424, 0.3925547, 1, 0.6470588, 0, 1,
-1.212374, -0.4639554, -1.907709, 1, 0.654902, 0, 1,
-1.211047, -0.7796063, -1.643053, 1, 0.6588235, 0, 1,
-1.19676, 0.3729996, -0.8542529, 1, 0.6666667, 0, 1,
-1.194095, 0.378698, -0.1176703, 1, 0.6705883, 0, 1,
-1.193377, 0.9177102, -1.56569, 1, 0.6784314, 0, 1,
-1.193348, 0.6262976, -0.6961408, 1, 0.682353, 0, 1,
-1.181711, -0.1317688, -0.2107136, 1, 0.6901961, 0, 1,
-1.159522, 0.8711416, 0.01217251, 1, 0.6941177, 0, 1,
-1.158181, 0.5171216, -0.4203541, 1, 0.7019608, 0, 1,
-1.155141, 0.2490174, 0.2003487, 1, 0.7098039, 0, 1,
-1.151353, -1.64282, -0.3035272, 1, 0.7137255, 0, 1,
-1.141739, 1.108669, -1.405805, 1, 0.7215686, 0, 1,
-1.126452, 2.215627, -0.7274022, 1, 0.7254902, 0, 1,
-1.119147, 0.5578141, -0.5321826, 1, 0.7333333, 0, 1,
-1.113364, -0.721428, -2.154246, 1, 0.7372549, 0, 1,
-1.111882, 0.4078151, -2.288186, 1, 0.7450981, 0, 1,
-1.111604, -1.425213, -1.652766, 1, 0.7490196, 0, 1,
-1.098827, 1.389039, -1.074923, 1, 0.7568628, 0, 1,
-1.096339, 0.9406459, 0.3350099, 1, 0.7607843, 0, 1,
-1.09624, 0.6992971, -0.6928375, 1, 0.7686275, 0, 1,
-1.094525, 0.1965201, -2.509979, 1, 0.772549, 0, 1,
-1.090395, 0.3194878, -0.0718549, 1, 0.7803922, 0, 1,
-1.089104, -1.123973, -2.801683, 1, 0.7843137, 0, 1,
-1.08551, -0.7091018, -1.736245, 1, 0.7921569, 0, 1,
-1.081867, 0.06258452, -1.474317, 1, 0.7960784, 0, 1,
-1.073677, -2.249352, -1.997412, 1, 0.8039216, 0, 1,
-1.071993, -0.1909592, -2.168245, 1, 0.8117647, 0, 1,
-1.065575, -0.4452456, -1.419889, 1, 0.8156863, 0, 1,
-1.063478, 0.7418951, -0.3670161, 1, 0.8235294, 0, 1,
-1.061417, 0.1297168, -2.36608, 1, 0.827451, 0, 1,
-1.059355, 1.770347, -0.03252871, 1, 0.8352941, 0, 1,
-1.058873, -0.1605203, -2.05356, 1, 0.8392157, 0, 1,
-1.055783, -0.0450934, -2.133357, 1, 0.8470588, 0, 1,
-1.052482, -1.350729, -2.925775, 1, 0.8509804, 0, 1,
-1.047829, 0.8731441, -1.151868, 1, 0.8588235, 0, 1,
-1.022883, 1.048728, -1.433476, 1, 0.8627451, 0, 1,
-1.018665, 0.9425489, -1.034572, 1, 0.8705882, 0, 1,
-1.01398, 1.481602, 0.3360376, 1, 0.8745098, 0, 1,
-1.012992, 0.7798311, -2.150494, 1, 0.8823529, 0, 1,
-1.006309, -0.5805666, -2.701022, 1, 0.8862745, 0, 1,
-1.000438, -2.097352, -0.6674407, 1, 0.8941177, 0, 1,
-0.9989584, 1.185228, 0.007923692, 1, 0.8980392, 0, 1,
-0.9974541, -0.5071095, -2.122447, 1, 0.9058824, 0, 1,
-0.9905792, -0.7751567, -3.38205, 1, 0.9137255, 0, 1,
-0.9836257, 0.5817135, -1.793544, 1, 0.9176471, 0, 1,
-0.9753999, 0.4667607, -1.671742, 1, 0.9254902, 0, 1,
-0.9645665, 2.128822, -0.9527012, 1, 0.9294118, 0, 1,
-0.9635553, -0.5445291, -2.930989, 1, 0.9372549, 0, 1,
-0.9634811, 1.427948, -0.9080103, 1, 0.9411765, 0, 1,
-0.9579679, 0.1584336, -3.022589, 1, 0.9490196, 0, 1,
-0.951766, -0.3411645, -2.280017, 1, 0.9529412, 0, 1,
-0.949184, 0.2069811, -1.017876, 1, 0.9607843, 0, 1,
-0.9371707, -0.2829692, -1.39089, 1, 0.9647059, 0, 1,
-0.9344988, -1.183562, -2.908567, 1, 0.972549, 0, 1,
-0.9344057, -0.3129897, -0.3192273, 1, 0.9764706, 0, 1,
-0.9343772, -0.1146912, -3.47867, 1, 0.9843137, 0, 1,
-0.9322736, 1.076669, 0.02460155, 1, 0.9882353, 0, 1,
-0.9311378, -1.011193, -2.058568, 1, 0.9960784, 0, 1,
-0.9269198, -1.002031, -2.665447, 0.9960784, 1, 0, 1,
-0.9214187, -0.7787992, -1.353858, 0.9921569, 1, 0, 1,
-0.9204858, 0.9792665, -0.4492836, 0.9843137, 1, 0, 1,
-0.9192636, -1.894752, -1.271947, 0.9803922, 1, 0, 1,
-0.918929, -0.1848729, -1.409359, 0.972549, 1, 0, 1,
-0.9107497, -0.3312944, -3.218447, 0.9686275, 1, 0, 1,
-0.9101698, 0.6597468, -1.092257, 0.9607843, 1, 0, 1,
-0.909965, -0.360287, -1.557651, 0.9568627, 1, 0, 1,
-0.9014089, -0.1505821, -0.7009827, 0.9490196, 1, 0, 1,
-0.8949014, -0.4941492, -3.041121, 0.945098, 1, 0, 1,
-0.8903988, 0.8033112, -2.645257, 0.9372549, 1, 0, 1,
-0.8892236, 0.7943298, -0.3439939, 0.9333333, 1, 0, 1,
-0.888218, -1.078683, -1.671904, 0.9254902, 1, 0, 1,
-0.8823859, 0.6444882, -1.482443, 0.9215686, 1, 0, 1,
-0.8822325, -0.7577851, -2.160237, 0.9137255, 1, 0, 1,
-0.8692507, -0.1514868, -2.151906, 0.9098039, 1, 0, 1,
-0.8652288, -0.7289025, -2.731996, 0.9019608, 1, 0, 1,
-0.8622844, -0.5588864, -1.807824, 0.8941177, 1, 0, 1,
-0.860378, -0.9033896, -1.545675, 0.8901961, 1, 0, 1,
-0.859015, 0.8397076, -0.9220415, 0.8823529, 1, 0, 1,
-0.8584981, -0.5017264, -3.770624, 0.8784314, 1, 0, 1,
-0.8583511, -3.121371, -1.550222, 0.8705882, 1, 0, 1,
-0.85731, -0.40157, -2.802133, 0.8666667, 1, 0, 1,
-0.8519178, -0.4096202, -2.886796, 0.8588235, 1, 0, 1,
-0.8454415, -1.428082, -2.954082, 0.854902, 1, 0, 1,
-0.8404225, -1.282441, -1.377403, 0.8470588, 1, 0, 1,
-0.8341214, 0.1600232, -1.891702, 0.8431373, 1, 0, 1,
-0.8322855, 0.7179911, 0.4263353, 0.8352941, 1, 0, 1,
-0.8208849, 1.55379, -1.328202, 0.8313726, 1, 0, 1,
-0.8194625, -0.9359846, -2.562773, 0.8235294, 1, 0, 1,
-0.8172436, 0.9156982, -1.73657, 0.8196079, 1, 0, 1,
-0.8141186, -0.5029731, -3.024857, 0.8117647, 1, 0, 1,
-0.8138421, -0.8897715, -2.644108, 0.8078431, 1, 0, 1,
-0.8132273, 1.024951, -1.131764, 0.8, 1, 0, 1,
-0.8100137, -1.535634, -0.6904501, 0.7921569, 1, 0, 1,
-0.8095918, -1.110292, -1.808819, 0.7882353, 1, 0, 1,
-0.8087875, -0.09474772, -2.236124, 0.7803922, 1, 0, 1,
-0.8053604, 0.680207, -0.7774721, 0.7764706, 1, 0, 1,
-0.799178, 0.5827346, -0.9766887, 0.7686275, 1, 0, 1,
-0.7948713, -0.4428192, -0.4227474, 0.7647059, 1, 0, 1,
-0.789848, -1.592332, -1.772666, 0.7568628, 1, 0, 1,
-0.786311, 0.4411553, -1.407418, 0.7529412, 1, 0, 1,
-0.7860162, 0.6035944, -0.6897113, 0.7450981, 1, 0, 1,
-0.7831846, 0.6880418, -1.863514, 0.7411765, 1, 0, 1,
-0.7796127, 0.02867642, -3.15794, 0.7333333, 1, 0, 1,
-0.7791488, 1.210665, -1.526604, 0.7294118, 1, 0, 1,
-0.7771605, -0.3909141, -1.99928, 0.7215686, 1, 0, 1,
-0.7748237, -1.000847, -2.23868, 0.7176471, 1, 0, 1,
-0.7705333, -0.3901894, -0.4977033, 0.7098039, 1, 0, 1,
-0.7653537, -0.1357488, -2.714705, 0.7058824, 1, 0, 1,
-0.7592196, -0.5927129, -4.550194, 0.6980392, 1, 0, 1,
-0.7588097, -0.3365811, -2.503509, 0.6901961, 1, 0, 1,
-0.7579141, -1.124234, -1.471687, 0.6862745, 1, 0, 1,
-0.7575592, 2.54019, 0.182702, 0.6784314, 1, 0, 1,
-0.7573014, 1.155682, -1.344533, 0.6745098, 1, 0, 1,
-0.748504, -1.067641, -4.424007, 0.6666667, 1, 0, 1,
-0.7420477, 0.2973144, -1.563647, 0.6627451, 1, 0, 1,
-0.737334, -0.6003361, -2.048986, 0.654902, 1, 0, 1,
-0.7334271, -0.3732156, -2.953304, 0.6509804, 1, 0, 1,
-0.7256922, 0.5331889, -2.249713, 0.6431373, 1, 0, 1,
-0.7214569, -1.864689, -3.753482, 0.6392157, 1, 0, 1,
-0.7195392, -1.333426, -3.099897, 0.6313726, 1, 0, 1,
-0.7178758, 1.253706, -1.891456, 0.627451, 1, 0, 1,
-0.7137902, 0.7866627, -1.177296, 0.6196079, 1, 0, 1,
-0.7124911, -1.63477, -3.392662, 0.6156863, 1, 0, 1,
-0.7093635, -1.9431, -4.065793, 0.6078432, 1, 0, 1,
-0.7086447, -0.928533, -3.595013, 0.6039216, 1, 0, 1,
-0.7062671, -1.31586, -3.057254, 0.5960785, 1, 0, 1,
-0.7052841, -0.4931894, -1.77441, 0.5882353, 1, 0, 1,
-0.6980481, 0.3168128, 0.2771233, 0.5843138, 1, 0, 1,
-0.6881576, 0.6269809, -1.957781, 0.5764706, 1, 0, 1,
-0.6848358, 0.5704823, -1.537469, 0.572549, 1, 0, 1,
-0.6845602, 0.8953114, -0.7553331, 0.5647059, 1, 0, 1,
-0.683635, 0.2196526, -1.376437, 0.5607843, 1, 0, 1,
-0.6820958, 0.1934473, -0.5964983, 0.5529412, 1, 0, 1,
-0.6815296, -1.562031, -2.023418, 0.5490196, 1, 0, 1,
-0.6778807, 0.5104122, 0.2220614, 0.5411765, 1, 0, 1,
-0.6714405, 1.555257, -0.3920671, 0.5372549, 1, 0, 1,
-0.6702731, -2.316024, -3.521929, 0.5294118, 1, 0, 1,
-0.6641006, 0.05855273, 0.3225729, 0.5254902, 1, 0, 1,
-0.6604619, -1.238911, -1.666135, 0.5176471, 1, 0, 1,
-0.6571078, -1.080891, -2.471368, 0.5137255, 1, 0, 1,
-0.6537994, 1.56704, -1.720393, 0.5058824, 1, 0, 1,
-0.653528, -0.6267784, -2.768037, 0.5019608, 1, 0, 1,
-0.6455492, 0.5880203, -0.4431279, 0.4941176, 1, 0, 1,
-0.6455254, -1.425503, -1.821711, 0.4862745, 1, 0, 1,
-0.6435137, -1.847657, -2.958542, 0.4823529, 1, 0, 1,
-0.6381192, 0.2284062, -1.505167, 0.4745098, 1, 0, 1,
-0.6364157, -0.9885164, -3.930602, 0.4705882, 1, 0, 1,
-0.6354768, -0.5530784, -1.048343, 0.4627451, 1, 0, 1,
-0.6340407, -0.9501035, -2.168427, 0.4588235, 1, 0, 1,
-0.6312562, -0.6848779, -3.606255, 0.4509804, 1, 0, 1,
-0.6305392, -0.005082465, -0.5009952, 0.4470588, 1, 0, 1,
-0.6304818, 0.4847477, -0.138914, 0.4392157, 1, 0, 1,
-0.6276137, 0.08636702, -2.825218, 0.4352941, 1, 0, 1,
-0.626065, 0.9153541, -0.1806626, 0.427451, 1, 0, 1,
-0.6244219, 2.401423, -0.09174526, 0.4235294, 1, 0, 1,
-0.617815, -0.2239986, -0.3205813, 0.4156863, 1, 0, 1,
-0.6171581, 1.105185, 0.5631639, 0.4117647, 1, 0, 1,
-0.6157641, 0.7382526, 0.2351165, 0.4039216, 1, 0, 1,
-0.6107814, 1.48968, 0.09678213, 0.3960784, 1, 0, 1,
-0.608487, -0.4844663, -1.615277, 0.3921569, 1, 0, 1,
-0.6076549, -1.159189, -5.389479, 0.3843137, 1, 0, 1,
-0.6051084, -1.685852, -1.867203, 0.3803922, 1, 0, 1,
-0.603781, -1.866568, -2.068918, 0.372549, 1, 0, 1,
-0.6004587, -0.00315835, -1.09542, 0.3686275, 1, 0, 1,
-0.5920919, 0.3847426, -2.799902, 0.3607843, 1, 0, 1,
-0.5879696, -1.285566, -2.011299, 0.3568628, 1, 0, 1,
-0.5876754, -1.25517, -3.478422, 0.3490196, 1, 0, 1,
-0.5860903, 1.350648, 0.231569, 0.345098, 1, 0, 1,
-0.580689, 0.2257341, 0.3754108, 0.3372549, 1, 0, 1,
-0.5792003, -0.7289706, -0.8748836, 0.3333333, 1, 0, 1,
-0.5739083, 0.4697409, -1.83263, 0.3254902, 1, 0, 1,
-0.5722809, -0.151189, -2.727314, 0.3215686, 1, 0, 1,
-0.5697998, 2.336269, -0.3366022, 0.3137255, 1, 0, 1,
-0.56839, -1.155618, -1.55001, 0.3098039, 1, 0, 1,
-0.5661225, -0.01848652, -1.857983, 0.3019608, 1, 0, 1,
-0.5657468, -0.2927516, -0.7424192, 0.2941177, 1, 0, 1,
-0.5647243, 0.2414675, -0.8501719, 0.2901961, 1, 0, 1,
-0.5627249, 0.3173752, -1.005667, 0.282353, 1, 0, 1,
-0.5615909, 1.763636, -0.5599848, 0.2784314, 1, 0, 1,
-0.5585752, 0.5695642, -0.3407865, 0.2705882, 1, 0, 1,
-0.5578122, -0.07913169, -2.165118, 0.2666667, 1, 0, 1,
-0.5567636, 0.4904457, -3.001863, 0.2588235, 1, 0, 1,
-0.5562247, 0.4211523, -1.957811, 0.254902, 1, 0, 1,
-0.5505403, 0.6469414, 0.1083883, 0.2470588, 1, 0, 1,
-0.5496809, -1.096708, -3.337377, 0.2431373, 1, 0, 1,
-0.5456473, 0.4558297, 0.1472874, 0.2352941, 1, 0, 1,
-0.5449362, 1.721577, -1.536474, 0.2313726, 1, 0, 1,
-0.5386649, 1.575472, 0.2292285, 0.2235294, 1, 0, 1,
-0.5300472, -0.7249609, -3.128489, 0.2196078, 1, 0, 1,
-0.5268647, -1.025974, -2.894932, 0.2117647, 1, 0, 1,
-0.5261032, -0.8333021, -1.912012, 0.2078431, 1, 0, 1,
-0.523854, 0.03329919, -2.787708, 0.2, 1, 0, 1,
-0.5232995, -0.02676903, -2.388721, 0.1921569, 1, 0, 1,
-0.5179421, -0.1460133, -2.582374, 0.1882353, 1, 0, 1,
-0.5173889, 0.8409823, 1.781993, 0.1803922, 1, 0, 1,
-0.5122722, 0.9790753, -0.3371291, 0.1764706, 1, 0, 1,
-0.511772, -0.151728, -0.8062494, 0.1686275, 1, 0, 1,
-0.5064225, -0.03968633, -3.277018, 0.1647059, 1, 0, 1,
-0.503107, -0.5237545, -2.017186, 0.1568628, 1, 0, 1,
-0.5019233, -1.00808, -3.477686, 0.1529412, 1, 0, 1,
-0.4994791, -1.434893, -3.023757, 0.145098, 1, 0, 1,
-0.4872971, -1.264199, -0.7473809, 0.1411765, 1, 0, 1,
-0.4871784, -0.0530298, -1.689583, 0.1333333, 1, 0, 1,
-0.4805565, -1.689211, -3.226455, 0.1294118, 1, 0, 1,
-0.4805031, -0.7354382, -2.593367, 0.1215686, 1, 0, 1,
-0.4793855, 0.7919108, 0.4259945, 0.1176471, 1, 0, 1,
-0.474695, 0.4524653, -1.402666, 0.1098039, 1, 0, 1,
-0.4739945, -0.5254322, -3.408339, 0.1058824, 1, 0, 1,
-0.4709777, -1.106098, -2.17746, 0.09803922, 1, 0, 1,
-0.4689621, 1.044718, -1.326683, 0.09019608, 1, 0, 1,
-0.4598488, -2.417141, -2.478527, 0.08627451, 1, 0, 1,
-0.4522809, -0.1364106, -1.796659, 0.07843138, 1, 0, 1,
-0.4502077, -0.9109439, -3.90054, 0.07450981, 1, 0, 1,
-0.4470364, -0.7858932, -3.198642, 0.06666667, 1, 0, 1,
-0.447031, -0.8029744, -1.775759, 0.0627451, 1, 0, 1,
-0.4465598, -0.3863621, -0.6316444, 0.05490196, 1, 0, 1,
-0.4462748, 1.138179, -0.7855043, 0.05098039, 1, 0, 1,
-0.4450121, 0.6162233, 0.6926617, 0.04313726, 1, 0, 1,
-0.4421049, 0.02613863, -2.346714, 0.03921569, 1, 0, 1,
-0.4388818, -0.6245947, -3.231394, 0.03137255, 1, 0, 1,
-0.4387923, 0.5601624, -1.207043, 0.02745098, 1, 0, 1,
-0.4359387, -0.9155293, -1.284075, 0.01960784, 1, 0, 1,
-0.4327602, -0.8102622, -3.972347, 0.01568628, 1, 0, 1,
-0.4303816, 0.4213934, -2.108176, 0.007843138, 1, 0, 1,
-0.4286066, 1.276385, 0.7434862, 0.003921569, 1, 0, 1,
-0.4180216, -0.06908461, -2.054969, 0, 1, 0.003921569, 1,
-0.4179172, 0.6903825, 0.9628397, 0, 1, 0.01176471, 1,
-0.4127264, -0.6927516, -2.744342, 0, 1, 0.01568628, 1,
-0.4116713, 0.8322697, -2.87699, 0, 1, 0.02352941, 1,
-0.4100994, -0.2677746, -1.375466, 0, 1, 0.02745098, 1,
-0.4098939, 0.7531872, -0.04090388, 0, 1, 0.03529412, 1,
-0.4082915, -1.076778, -4.017408, 0, 1, 0.03921569, 1,
-0.4076623, -1.067487, -3.403995, 0, 1, 0.04705882, 1,
-0.4074661, 0.1121327, -0.3400278, 0, 1, 0.05098039, 1,
-0.4070489, 1.297271, 1.217912, 0, 1, 0.05882353, 1,
-0.4046418, -0.5607277, -1.327589, 0, 1, 0.0627451, 1,
-0.3946654, -2.560818, -2.767411, 0, 1, 0.07058824, 1,
-0.3898959, 1.91929, 0.07175996, 0, 1, 0.07450981, 1,
-0.3888715, -0.4488139, -3.431141, 0, 1, 0.08235294, 1,
-0.3881841, -0.1510416, -1.464588, 0, 1, 0.08627451, 1,
-0.3873611, -0.9429482, -4.288694, 0, 1, 0.09411765, 1,
-0.3852008, 0.1205126, -2.742403, 0, 1, 0.1019608, 1,
-0.3739728, 0.5570654, -0.3868791, 0, 1, 0.1058824, 1,
-0.3711449, -1.47378, -3.482323, 0, 1, 0.1137255, 1,
-0.3688821, 0.9621724, -2.268256, 0, 1, 0.1176471, 1,
-0.3576313, -1.1172, -2.051133, 0, 1, 0.1254902, 1,
-0.3560238, -1.344439, -1.666939, 0, 1, 0.1294118, 1,
-0.3458693, 1.314831, -0.2521029, 0, 1, 0.1372549, 1,
-0.342459, -1.596666, -2.930863, 0, 1, 0.1411765, 1,
-0.3401993, -1.339571, -5.199818, 0, 1, 0.1490196, 1,
-0.338738, -0.5955245, -2.3526, 0, 1, 0.1529412, 1,
-0.3333434, 0.5008881, 0.04888842, 0, 1, 0.1607843, 1,
-0.3299571, -0.9364727, -2.355454, 0, 1, 0.1647059, 1,
-0.329265, 1.505595, -0.8346732, 0, 1, 0.172549, 1,
-0.3232864, -0.9161505, -2.639638, 0, 1, 0.1764706, 1,
-0.3215114, 0.6029184, -1.041849, 0, 1, 0.1843137, 1,
-0.3199694, -1.916417, -2.736179, 0, 1, 0.1882353, 1,
-0.3187866, 0.5672788, -1.703283, 0, 1, 0.1960784, 1,
-0.3152227, -0.4182227, -2.505103, 0, 1, 0.2039216, 1,
-0.3144491, 1.274695, -0.5536639, 0, 1, 0.2078431, 1,
-0.3129934, -0.7591412, -2.21752, 0, 1, 0.2156863, 1,
-0.2974117, 0.0002157731, -2.681727, 0, 1, 0.2196078, 1,
-0.2952603, 1.419923, 1.125106, 0, 1, 0.227451, 1,
-0.2891592, 0.6566198, 0.1426065, 0, 1, 0.2313726, 1,
-0.2890287, -0.03528515, -1.842419, 0, 1, 0.2392157, 1,
-0.2887667, 0.2618571, 0.9425106, 0, 1, 0.2431373, 1,
-0.2816379, 0.8157679, -2.729823, 0, 1, 0.2509804, 1,
-0.2787966, -0.4024088, -3.048691, 0, 1, 0.254902, 1,
-0.2787395, -0.2564516, -3.644544, 0, 1, 0.2627451, 1,
-0.277274, -0.5848045, -3.29819, 0, 1, 0.2666667, 1,
-0.2765421, -0.6995915, -3.701752, 0, 1, 0.2745098, 1,
-0.2758176, 1.00288, -0.1663852, 0, 1, 0.2784314, 1,
-0.2726333, 0.7056131, -0.5245367, 0, 1, 0.2862745, 1,
-0.268519, 0.3982621, -1.496227, 0, 1, 0.2901961, 1,
-0.2630755, -0.3301111, -4.39885, 0, 1, 0.2980392, 1,
-0.2584498, 0.9844592, -2.466765, 0, 1, 0.3058824, 1,
-0.2507093, -0.8252569, -2.156469, 0, 1, 0.3098039, 1,
-0.2416833, -1.78177, -2.705723, 0, 1, 0.3176471, 1,
-0.2399624, 0.200857, -2.282318, 0, 1, 0.3215686, 1,
-0.2373614, 0.6903216, -0.2717618, 0, 1, 0.3294118, 1,
-0.2358886, 0.9007946, 0.3900128, 0, 1, 0.3333333, 1,
-0.2343096, 1.466382, -1.693827, 0, 1, 0.3411765, 1,
-0.2342616, 1.232589, -0.2088425, 0, 1, 0.345098, 1,
-0.2249303, -0.7664648, -2.82867, 0, 1, 0.3529412, 1,
-0.2241833, -0.4513225, -2.264368, 0, 1, 0.3568628, 1,
-0.223464, -0.8860666, -3.863047, 0, 1, 0.3647059, 1,
-0.2186491, 1.794754, -0.6139807, 0, 1, 0.3686275, 1,
-0.2129716, 1.760047, -1.93399, 0, 1, 0.3764706, 1,
-0.2126049, 1.58442, 1.206362, 0, 1, 0.3803922, 1,
-0.2076034, -0.865374, -3.02868, 0, 1, 0.3882353, 1,
-0.2075412, -0.4376267, -2.972519, 0, 1, 0.3921569, 1,
-0.2065668, -0.4780229, -3.640185, 0, 1, 0.4, 1,
-0.2022858, -0.7824889, -1.631486, 0, 1, 0.4078431, 1,
-0.2008126, -0.2124682, -3.777445, 0, 1, 0.4117647, 1,
-0.1978465, -0.3634766, -3.171414, 0, 1, 0.4196078, 1,
-0.1970416, 0.406216, -1.33276, 0, 1, 0.4235294, 1,
-0.1951586, -0.1809527, -2.83559, 0, 1, 0.4313726, 1,
-0.177862, 0.3562863, -0.6620167, 0, 1, 0.4352941, 1,
-0.177159, 0.8128428, -0.1842699, 0, 1, 0.4431373, 1,
-0.1761164, -0.08491155, -3.227924, 0, 1, 0.4470588, 1,
-0.1745709, -1.189263, -1.939221, 0, 1, 0.454902, 1,
-0.1727859, 0.8185773, 0.2815516, 0, 1, 0.4588235, 1,
-0.1713514, 0.6963676, -0.6336752, 0, 1, 0.4666667, 1,
-0.1709365, -1.269472, -2.715374, 0, 1, 0.4705882, 1,
-0.1651089, -1.133409, -3.710506, 0, 1, 0.4784314, 1,
-0.1625517, 0.3446807, -0.249616, 0, 1, 0.4823529, 1,
-0.1513855, 0.8640709, 1.705484, 0, 1, 0.4901961, 1,
-0.1470524, -1.769671, -3.35408, 0, 1, 0.4941176, 1,
-0.1409307, 1.302553, -1.171602, 0, 1, 0.5019608, 1,
-0.1391023, -0.3507365, -4.208807, 0, 1, 0.509804, 1,
-0.12929, -2.697456, -1.152602, 0, 1, 0.5137255, 1,
-0.1292424, 1.371243, 0.8507578, 0, 1, 0.5215687, 1,
-0.1282966, 0.67209, -0.06119664, 0, 1, 0.5254902, 1,
-0.1280415, 0.9890718, -0.2855272, 0, 1, 0.5333334, 1,
-0.125547, 0.6855602, -1.37572, 0, 1, 0.5372549, 1,
-0.1232553, -2.554364, -3.156084, 0, 1, 0.5450981, 1,
-0.1210572, 0.2178228, -1.001824, 0, 1, 0.5490196, 1,
-0.1153777, 1.85331, 0.1217499, 0, 1, 0.5568628, 1,
-0.1141013, 0.1795453, 1.067932, 0, 1, 0.5607843, 1,
-0.1108772, 0.09318084, -0.1353563, 0, 1, 0.5686275, 1,
-0.110205, 1.556432, 0.4804282, 0, 1, 0.572549, 1,
-0.106955, -0.4120838, -1.256304, 0, 1, 0.5803922, 1,
-0.1041197, -0.2507522, -2.755293, 0, 1, 0.5843138, 1,
-0.1008172, -1.063369, -3.896729, 0, 1, 0.5921569, 1,
-0.09985112, 0.6867585, -0.8007834, 0, 1, 0.5960785, 1,
-0.09840735, 0.6798537, 2.372602, 0, 1, 0.6039216, 1,
-0.09727782, 0.591375, -0.09850492, 0, 1, 0.6117647, 1,
-0.09676083, -1.468226, -3.477672, 0, 1, 0.6156863, 1,
-0.09305935, -0.2311706, -2.725765, 0, 1, 0.6235294, 1,
-0.09222616, 1.071736, -0.6243469, 0, 1, 0.627451, 1,
-0.09121665, 0.7527786, 0.5266039, 0, 1, 0.6352941, 1,
-0.0909282, -0.4779269, -3.402118, 0, 1, 0.6392157, 1,
-0.07810776, -0.5311398, -2.603828, 0, 1, 0.6470588, 1,
-0.07698226, -2.099021, -4.049131, 0, 1, 0.6509804, 1,
-0.06963746, -0.7524146, -4.357437, 0, 1, 0.6588235, 1,
-0.0664934, -0.5193243, -4.417093, 0, 1, 0.6627451, 1,
-0.06584711, 0.7674967, -1.038097, 0, 1, 0.6705883, 1,
-0.06353188, -0.2571008, -1.748675, 0, 1, 0.6745098, 1,
-0.06160935, -0.3733051, -3.151706, 0, 1, 0.682353, 1,
-0.05345392, -0.7133642, -3.613994, 0, 1, 0.6862745, 1,
-0.05179339, -0.1134802, -1.842481, 0, 1, 0.6941177, 1,
-0.05047185, -1.087019, -4.546631, 0, 1, 0.7019608, 1,
-0.05001533, 1.077022, -0.2056282, 0, 1, 0.7058824, 1,
-0.04745215, 0.02345772, -0.2530705, 0, 1, 0.7137255, 1,
-0.04436819, -1.423878, -3.45888, 0, 1, 0.7176471, 1,
-0.0433073, 0.6996808, 1.563653, 0, 1, 0.7254902, 1,
-0.04201065, -0.1013526, -2.703321, 0, 1, 0.7294118, 1,
-0.03714556, -1.268494, -3.305025, 0, 1, 0.7372549, 1,
-0.03663206, 0.2397096, -0.2669283, 0, 1, 0.7411765, 1,
-0.03436271, -0.5686671, -3.815101, 0, 1, 0.7490196, 1,
-0.03217814, -0.4019907, -4.080309, 0, 1, 0.7529412, 1,
-0.03200743, 0.6902923, 0.4087686, 0, 1, 0.7607843, 1,
-0.03056371, 0.4447543, -0.5645592, 0, 1, 0.7647059, 1,
-0.02797877, 0.8707618, -0.3150834, 0, 1, 0.772549, 1,
-0.02516437, 1.427975, -0.38037, 0, 1, 0.7764706, 1,
-0.02320591, 1.323279, -0.1658575, 0, 1, 0.7843137, 1,
-0.02132329, 0.2165675, -0.52925, 0, 1, 0.7882353, 1,
-0.01408397, -1.926329, -0.00884756, 0, 1, 0.7960784, 1,
-0.006168719, 0.1306761, -0.7459049, 0, 1, 0.8039216, 1,
-0.003370815, 0.2845647, 0.06675536, 0, 1, 0.8078431, 1,
-0.0005405363, -1.026727, -1.898097, 0, 1, 0.8156863, 1,
0.00297945, -0.2261275, 2.273488, 0, 1, 0.8196079, 1,
0.009369071, -2.227856, 2.449808, 0, 1, 0.827451, 1,
0.01707713, -1.190785, 2.429739, 0, 1, 0.8313726, 1,
0.01810596, 1.254959, 0.2277045, 0, 1, 0.8392157, 1,
0.0210268, 1.082609, 1.046274, 0, 1, 0.8431373, 1,
0.02220107, 0.09186279, 1.232176, 0, 1, 0.8509804, 1,
0.02301051, -0.09499881, 2.218719, 0, 1, 0.854902, 1,
0.02901535, 1.87827, -1.308279, 0, 1, 0.8627451, 1,
0.03046499, 1.262135, 1.86654, 0, 1, 0.8666667, 1,
0.03335053, 1.369713, 1.539559, 0, 1, 0.8745098, 1,
0.03424243, -0.2974792, 4.156228, 0, 1, 0.8784314, 1,
0.03502428, 1.360463, 0.04716375, 0, 1, 0.8862745, 1,
0.04089075, 0.106601, 1.548673, 0, 1, 0.8901961, 1,
0.04094249, -0.3727509, 1.745074, 0, 1, 0.8980392, 1,
0.04303155, -0.05954317, 3.814491, 0, 1, 0.9058824, 1,
0.04705636, -1.043322, 2.955712, 0, 1, 0.9098039, 1,
0.04895862, -0.09869748, 4.83017, 0, 1, 0.9176471, 1,
0.05049068, -0.7785724, 3.915797, 0, 1, 0.9215686, 1,
0.05343293, -0.4528101, 3.166415, 0, 1, 0.9294118, 1,
0.06265752, 0.323831, 0.5775724, 0, 1, 0.9333333, 1,
0.06413245, 0.3064587, -0.2613018, 0, 1, 0.9411765, 1,
0.06479818, -0.1719528, 2.990061, 0, 1, 0.945098, 1,
0.06491438, 1.191185, -1.305499, 0, 1, 0.9529412, 1,
0.06543515, -1.750425, 3.798806, 0, 1, 0.9568627, 1,
0.06719372, 0.3441678, 0.1525941, 0, 1, 0.9647059, 1,
0.06747547, -0.1445983, 1.102519, 0, 1, 0.9686275, 1,
0.06821901, -0.4112226, 3.695642, 0, 1, 0.9764706, 1,
0.0684949, 0.5657583, -1.821763, 0, 1, 0.9803922, 1,
0.06978063, -0.2668855, 5.431149, 0, 1, 0.9882353, 1,
0.07077515, -0.5879989, 1.632397, 0, 1, 0.9921569, 1,
0.07310952, 0.3401658, -0.8859913, 0, 1, 1, 1,
0.07628035, -1.957555, 4.937975, 0, 0.9921569, 1, 1,
0.07689238, 0.8578393, 0.5390249, 0, 0.9882353, 1, 1,
0.07872236, -0.9857131, 3.185291, 0, 0.9803922, 1, 1,
0.07926365, 1.089455, -0.2481701, 0, 0.9764706, 1, 1,
0.08022643, -0.1394243, 3.177292, 0, 0.9686275, 1, 1,
0.08302369, -1.590469, 3.91949, 0, 0.9647059, 1, 1,
0.08738597, -0.9297969, 1.562234, 0, 0.9568627, 1, 1,
0.08815043, -0.2547809, 2.052878, 0, 0.9529412, 1, 1,
0.08864541, -0.3930428, 2.736993, 0, 0.945098, 1, 1,
0.0939412, -0.09668218, 2.716115, 0, 0.9411765, 1, 1,
0.09636713, -0.996995, 3.207084, 0, 0.9333333, 1, 1,
0.09636984, -0.06230819, 3.057222, 0, 0.9294118, 1, 1,
0.09897253, 0.179336, -0.7156965, 0, 0.9215686, 1, 1,
0.1017067, 0.6709622, 0.5087479, 0, 0.9176471, 1, 1,
0.1226718, -1.004352, 3.196713, 0, 0.9098039, 1, 1,
0.123682, -0.645475, 2.282483, 0, 0.9058824, 1, 1,
0.1270353, -0.3625666, 3.1545, 0, 0.8980392, 1, 1,
0.1284558, -2.217391, 2.470624, 0, 0.8901961, 1, 1,
0.1309474, -0.3238056, 2.286259, 0, 0.8862745, 1, 1,
0.1312462, -1.101528, 4.71216, 0, 0.8784314, 1, 1,
0.1375417, -0.03300105, 2.805364, 0, 0.8745098, 1, 1,
0.1392604, -0.3711897, -0.2707713, 0, 0.8666667, 1, 1,
0.1411082, -1.161204, 3.594424, 0, 0.8627451, 1, 1,
0.1417368, -0.2854837, 3.500584, 0, 0.854902, 1, 1,
0.1432495, -0.6850882, 4.016014, 0, 0.8509804, 1, 1,
0.1464578, 0.1328697, 1.147476, 0, 0.8431373, 1, 1,
0.1556473, -0.2774241, 2.451681, 0, 0.8392157, 1, 1,
0.1666945, 0.4778678, 2.859003, 0, 0.8313726, 1, 1,
0.1668322, 1.116486, -0.9254047, 0, 0.827451, 1, 1,
0.1763193, -1.58772, 2.675963, 0, 0.8196079, 1, 1,
0.177247, 0.7627965, -2.305721, 0, 0.8156863, 1, 1,
0.1797895, 0.9770066, 0.5999424, 0, 0.8078431, 1, 1,
0.180377, 0.9316269, -1.081537, 0, 0.8039216, 1, 1,
0.1812664, 0.05701285, 1.867159, 0, 0.7960784, 1, 1,
0.1862044, -0.9490734, 3.509201, 0, 0.7882353, 1, 1,
0.1864859, 0.2833948, 1.338799, 0, 0.7843137, 1, 1,
0.1878063, 1.893129, 0.1271009, 0, 0.7764706, 1, 1,
0.2083888, -0.9759383, 2.450052, 0, 0.772549, 1, 1,
0.2092691, -0.1434832, 1.96513, 0, 0.7647059, 1, 1,
0.212319, 1.847484, -0.1188158, 0, 0.7607843, 1, 1,
0.2152071, 0.5540727, 1.857747, 0, 0.7529412, 1, 1,
0.2167742, -0.9406924, 4.107056, 0, 0.7490196, 1, 1,
0.2193124, 1.045353, 0.9728978, 0, 0.7411765, 1, 1,
0.2216135, 1.377304, 2.067459, 0, 0.7372549, 1, 1,
0.2216259, 0.3300919, 0.07555071, 0, 0.7294118, 1, 1,
0.2322046, -0.7282824, 4.102096, 0, 0.7254902, 1, 1,
0.2359471, 0.1642527, 0.8884798, 0, 0.7176471, 1, 1,
0.237151, 0.05892542, 0.8870277, 0, 0.7137255, 1, 1,
0.2377772, -0.04388855, 1.723988, 0, 0.7058824, 1, 1,
0.2389219, -0.5251547, 2.849924, 0, 0.6980392, 1, 1,
0.2395183, 0.3087168, 0.8773479, 0, 0.6941177, 1, 1,
0.2395184, 0.3666693, 0.7063388, 0, 0.6862745, 1, 1,
0.2419865, -0.4912391, 3.287377, 0, 0.682353, 1, 1,
0.2420073, 2.321813, 0.246697, 0, 0.6745098, 1, 1,
0.2521489, 0.8019103, 0.5933145, 0, 0.6705883, 1, 1,
0.2535209, 0.004890191, 1.997142, 0, 0.6627451, 1, 1,
0.2536725, 0.1408845, -0.8412499, 0, 0.6588235, 1, 1,
0.2546397, -0.675804, 2.714823, 0, 0.6509804, 1, 1,
0.2556736, -0.4722137, 3.207914, 0, 0.6470588, 1, 1,
0.2565576, -0.7143368, 2.372995, 0, 0.6392157, 1, 1,
0.2571949, -0.06904367, 2.12559, 0, 0.6352941, 1, 1,
0.2585815, 0.1040502, 1.337854, 0, 0.627451, 1, 1,
0.2596265, -0.3819307, 3.408015, 0, 0.6235294, 1, 1,
0.2628178, -0.9271703, 3.562592, 0, 0.6156863, 1, 1,
0.264514, 0.8954459, 1.76234, 0, 0.6117647, 1, 1,
0.2659167, 0.7566485, 1.286769, 0, 0.6039216, 1, 1,
0.2670118, -2.024199, 1.841672, 0, 0.5960785, 1, 1,
0.2717397, 0.3187028, 2.635554, 0, 0.5921569, 1, 1,
0.2717607, -0.1689596, 2.700792, 0, 0.5843138, 1, 1,
0.2733645, -0.9403032, 3.088559, 0, 0.5803922, 1, 1,
0.2747749, -0.222396, 2.544512, 0, 0.572549, 1, 1,
0.2754928, 0.9470173, 1.688375, 0, 0.5686275, 1, 1,
0.2807437, 0.8325952, -1.300411, 0, 0.5607843, 1, 1,
0.2844695, 1.286198, 0.3137482, 0, 0.5568628, 1, 1,
0.2879821, 0.5123228, 1.128498, 0, 0.5490196, 1, 1,
0.2887733, 0.8408875, 0.7207926, 0, 0.5450981, 1, 1,
0.2899967, -0.009605968, 0.9258569, 0, 0.5372549, 1, 1,
0.2914759, 0.5469391, -0.7792691, 0, 0.5333334, 1, 1,
0.2922134, 1.526022, -1.540598, 0, 0.5254902, 1, 1,
0.2946206, 0.06302498, 1.232267, 0, 0.5215687, 1, 1,
0.2959739, 2.021527, 0.8277543, 0, 0.5137255, 1, 1,
0.3011415, 0.5417724, 0.3040752, 0, 0.509804, 1, 1,
0.3087244, 0.4061521, -0.9858519, 0, 0.5019608, 1, 1,
0.3132366, -0.9383463, 0.9952838, 0, 0.4941176, 1, 1,
0.3178102, 0.08573481, 2.85469, 0, 0.4901961, 1, 1,
0.3190474, 0.7070194, -0.2059273, 0, 0.4823529, 1, 1,
0.3198934, 0.2855151, 0.01803144, 0, 0.4784314, 1, 1,
0.320312, -0.4996242, 4.054881, 0, 0.4705882, 1, 1,
0.3222405, -0.3147873, 3.67581, 0, 0.4666667, 1, 1,
0.3225738, 1.773443, -0.4970542, 0, 0.4588235, 1, 1,
0.3296222, 0.2925645, 1.017851, 0, 0.454902, 1, 1,
0.3299889, 0.008706692, -0.0266221, 0, 0.4470588, 1, 1,
0.3330963, -0.5196524, 3.313161, 0, 0.4431373, 1, 1,
0.3483872, 0.102483, 2.746981, 0, 0.4352941, 1, 1,
0.351417, 2.148625, -0.5685598, 0, 0.4313726, 1, 1,
0.3530624, -0.01762404, 2.636553, 0, 0.4235294, 1, 1,
0.353841, -1.029399, 2.93474, 0, 0.4196078, 1, 1,
0.3588456, -0.1983319, 2.551348, 0, 0.4117647, 1, 1,
0.3598233, -1.054949, 3.521303, 0, 0.4078431, 1, 1,
0.3612759, 1.13092, 1.00836, 0, 0.4, 1, 1,
0.3628394, -0.85143, 2.881815, 0, 0.3921569, 1, 1,
0.3640853, 0.701578, -0.04952896, 0, 0.3882353, 1, 1,
0.3662672, -0.07761915, 1.109048, 0, 0.3803922, 1, 1,
0.3683129, -0.05127007, 2.881045, 0, 0.3764706, 1, 1,
0.3686867, -0.2720315, 2.179916, 0, 0.3686275, 1, 1,
0.3708254, 0.7216755, 0.9080968, 0, 0.3647059, 1, 1,
0.3742379, 0.7407019, 1.424708, 0, 0.3568628, 1, 1,
0.3790797, -0.1452798, 3.022288, 0, 0.3529412, 1, 1,
0.3796366, 0.1370566, -0.252742, 0, 0.345098, 1, 1,
0.3798742, 0.2857185, 0.3627942, 0, 0.3411765, 1, 1,
0.3860027, -0.6496743, 2.034916, 0, 0.3333333, 1, 1,
0.3885473, -0.08624011, 1.595751, 0, 0.3294118, 1, 1,
0.391553, 0.6975204, 1.306727, 0, 0.3215686, 1, 1,
0.3919683, 1.407706, -1.680846, 0, 0.3176471, 1, 1,
0.4012021, 0.02317371, 2.043647, 0, 0.3098039, 1, 1,
0.4013168, 1.783715, 0.07712965, 0, 0.3058824, 1, 1,
0.4018219, 0.07030841, 1.691422, 0, 0.2980392, 1, 1,
0.406401, -0.1615571, 1.130311, 0, 0.2901961, 1, 1,
0.4102862, -1.342135, 1.431736, 0, 0.2862745, 1, 1,
0.4113321, -0.208297, 2.058821, 0, 0.2784314, 1, 1,
0.4144899, 0.08551832, -0.8490298, 0, 0.2745098, 1, 1,
0.4148436, -0.9385333, 1.702481, 0, 0.2666667, 1, 1,
0.4164061, -1.251305, 2.683409, 0, 0.2627451, 1, 1,
0.4200582, -0.8949713, 2.048621, 0, 0.254902, 1, 1,
0.4210833, -1.210403, 3.031002, 0, 0.2509804, 1, 1,
0.4211362, -0.8357665, 3.767227, 0, 0.2431373, 1, 1,
0.4235676, -0.08572142, 2.0366, 0, 0.2392157, 1, 1,
0.424166, 1.768281, -0.9825629, 0, 0.2313726, 1, 1,
0.42535, 0.8399125, 1.482864, 0, 0.227451, 1, 1,
0.4272544, -0.6090026, 3.099354, 0, 0.2196078, 1, 1,
0.4278454, 0.611376, 0.2420107, 0, 0.2156863, 1, 1,
0.4285956, -0.8317645, 1.548962, 0, 0.2078431, 1, 1,
0.433552, 1.479653, -1.119347, 0, 0.2039216, 1, 1,
0.4375098, 0.009129438, 1.181969, 0, 0.1960784, 1, 1,
0.4400504, 1.429736, -1.125997, 0, 0.1882353, 1, 1,
0.4410355, -0.1928785, 2.957617, 0, 0.1843137, 1, 1,
0.4426709, -0.559464, 1.661281, 0, 0.1764706, 1, 1,
0.4488049, -1.186363, 2.691511, 0, 0.172549, 1, 1,
0.4506828, 1.514675, -0.9453426, 0, 0.1647059, 1, 1,
0.4515696, -0.3246221, 0.8670818, 0, 0.1607843, 1, 1,
0.4525122, 0.6620654, 0.9727312, 0, 0.1529412, 1, 1,
0.4527903, -0.2205153, 2.504955, 0, 0.1490196, 1, 1,
0.4529286, -2.374516, 2.647028, 0, 0.1411765, 1, 1,
0.4571371, 0.9115248, 0.6513332, 0, 0.1372549, 1, 1,
0.4633317, -2.453222, 3.048257, 0, 0.1294118, 1, 1,
0.4654837, -0.2061456, 2.4333, 0, 0.1254902, 1, 1,
0.4665117, -1.675186, 4.027685, 0, 0.1176471, 1, 1,
0.4683971, -1.563455, 3.402195, 0, 0.1137255, 1, 1,
0.471553, 0.8515722, -0.7560211, 0, 0.1058824, 1, 1,
0.4729609, 2.842139, 2.046141, 0, 0.09803922, 1, 1,
0.4808975, -0.5298409, 2.090068, 0, 0.09411765, 1, 1,
0.4811722, -0.2477428, 0.07936898, 0, 0.08627451, 1, 1,
0.4817357, -1.575086, 2.686254, 0, 0.08235294, 1, 1,
0.4839571, 0.8362926, 0.4461935, 0, 0.07450981, 1, 1,
0.4844961, 0.06657764, 2.119977, 0, 0.07058824, 1, 1,
0.4849913, -0.3686519, 3.582614, 0, 0.0627451, 1, 1,
0.4876832, -1.029105, 1.06475, 0, 0.05882353, 1, 1,
0.4880078, 0.01650506, 2.600691, 0, 0.05098039, 1, 1,
0.4943515, 0.873789, 0.1432118, 0, 0.04705882, 1, 1,
0.4959428, -0.6267079, 2.476633, 0, 0.03921569, 1, 1,
0.4970305, -0.122563, 1.813648, 0, 0.03529412, 1, 1,
0.5031652, -1.777787, 2.712867, 0, 0.02745098, 1, 1,
0.5105489, 0.4863494, 0.4350469, 0, 0.02352941, 1, 1,
0.5114793, -0.188233, 1.456867, 0, 0.01568628, 1, 1,
0.5119847, 0.326046, 0.7919415, 0, 0.01176471, 1, 1,
0.512324, -0.2496813, 1.767745, 0, 0.003921569, 1, 1,
0.5125391, -1.159361, 2.094732, 0.003921569, 0, 1, 1,
0.513267, 1.786155, -0.4820961, 0.007843138, 0, 1, 1,
0.5142419, -0.2128233, 3.014989, 0.01568628, 0, 1, 1,
0.5181128, -0.1146432, 0.3670063, 0.01960784, 0, 1, 1,
0.5184729, 1.735064, 1.036326, 0.02745098, 0, 1, 1,
0.5184759, 0.01272881, 1.289186, 0.03137255, 0, 1, 1,
0.5186453, 0.1505233, 2.945694, 0.03921569, 0, 1, 1,
0.5212387, -0.5390309, 2.426306, 0.04313726, 0, 1, 1,
0.5225649, -1.503152, 2.774274, 0.05098039, 0, 1, 1,
0.5266484, -0.6718188, 5.71277, 0.05490196, 0, 1, 1,
0.5273041, -0.1749394, 3.561287, 0.0627451, 0, 1, 1,
0.5273098, -0.06704592, -0.9270623, 0.06666667, 0, 1, 1,
0.5273319, 0.6459675, 1.886654, 0.07450981, 0, 1, 1,
0.538924, -1.340211, 3.695485, 0.07843138, 0, 1, 1,
0.5389552, -1.25921, 1.84166, 0.08627451, 0, 1, 1,
0.5443455, -0.6915151, 2.076971, 0.09019608, 0, 1, 1,
0.5443907, -1.521416, 2.146055, 0.09803922, 0, 1, 1,
0.546201, -0.2458453, 1.512778, 0.1058824, 0, 1, 1,
0.5488095, -0.6269541, 3.658557, 0.1098039, 0, 1, 1,
0.5506977, -0.5872447, 0.7448588, 0.1176471, 0, 1, 1,
0.5514423, 0.6701762, 0.1492047, 0.1215686, 0, 1, 1,
0.5515926, 0.7432211, 1.225769, 0.1294118, 0, 1, 1,
0.5526032, -0.2699782, 0.538187, 0.1333333, 0, 1, 1,
0.557711, 0.9118117, 2.628243, 0.1411765, 0, 1, 1,
0.5606385, -0.3420957, 1.940222, 0.145098, 0, 1, 1,
0.5610449, 0.3205934, 0.6599055, 0.1529412, 0, 1, 1,
0.5668892, 0.1925093, 0.1126775, 0.1568628, 0, 1, 1,
0.5693914, -1.670126, 3.2742, 0.1647059, 0, 1, 1,
0.5697348, -0.05005173, 2.580554, 0.1686275, 0, 1, 1,
0.5697883, -0.7570671, 2.522365, 0.1764706, 0, 1, 1,
0.5699494, 0.03548339, 1.920981, 0.1803922, 0, 1, 1,
0.5700457, -1.191073, 3.972835, 0.1882353, 0, 1, 1,
0.5727999, -0.1521413, 0.01161157, 0.1921569, 0, 1, 1,
0.5742291, 0.2233532, 1.047673, 0.2, 0, 1, 1,
0.5759526, 1.928655, 2.71323, 0.2078431, 0, 1, 1,
0.5773615, -0.5298958, 1.573095, 0.2117647, 0, 1, 1,
0.5842087, 0.5547059, -0.1868003, 0.2196078, 0, 1, 1,
0.5861092, -1.146869, 2.290576, 0.2235294, 0, 1, 1,
0.5892667, 0.07336903, 0.4383157, 0.2313726, 0, 1, 1,
0.5906698, -0.07842676, 1.376879, 0.2352941, 0, 1, 1,
0.5911345, -0.481582, 1.464215, 0.2431373, 0, 1, 1,
0.5947968, 1.73888, 0.8024265, 0.2470588, 0, 1, 1,
0.6004551, -1.035677, 1.456061, 0.254902, 0, 1, 1,
0.6083178, -0.5985246, 2.293531, 0.2588235, 0, 1, 1,
0.6137521, -0.7381676, 2.369944, 0.2666667, 0, 1, 1,
0.6182531, -0.6729689, 3.277465, 0.2705882, 0, 1, 1,
0.6206939, -0.0811941, 1.156269, 0.2784314, 0, 1, 1,
0.6247652, -0.5646285, 1.843543, 0.282353, 0, 1, 1,
0.6281318, -0.1266643, 2.041101, 0.2901961, 0, 1, 1,
0.6317592, -0.4694356, 3.0286, 0.2941177, 0, 1, 1,
0.6356127, -0.07356255, 2.599242, 0.3019608, 0, 1, 1,
0.6395993, 1.825202, 0.763023, 0.3098039, 0, 1, 1,
0.6468522, -0.3837884, 3.1184, 0.3137255, 0, 1, 1,
0.6474795, -0.3075025, 1.110908, 0.3215686, 0, 1, 1,
0.6477041, -1.99386, 3.047532, 0.3254902, 0, 1, 1,
0.6514939, -1.372178, 2.021301, 0.3333333, 0, 1, 1,
0.6540942, 1.707605, 2.20677, 0.3372549, 0, 1, 1,
0.6549516, -0.548209, 2.15191, 0.345098, 0, 1, 1,
0.6624207, 0.2450604, 1.657864, 0.3490196, 0, 1, 1,
0.6643905, -0.5925061, 4.244605, 0.3568628, 0, 1, 1,
0.6660156, 0.195094, -0.727523, 0.3607843, 0, 1, 1,
0.670675, 0.1166966, 2.91089, 0.3686275, 0, 1, 1,
0.6781021, -0.6463624, 2.685476, 0.372549, 0, 1, 1,
0.6809021, 1.480378, 1.272967, 0.3803922, 0, 1, 1,
0.6815472, 0.2913076, 1.876825, 0.3843137, 0, 1, 1,
0.6820158, -0.3345231, 1.08743, 0.3921569, 0, 1, 1,
0.6823788, 0.233942, -0.8147194, 0.3960784, 0, 1, 1,
0.6840315, 0.5746361, -0.7165951, 0.4039216, 0, 1, 1,
0.6858634, -0.2415679, 0.9488716, 0.4117647, 0, 1, 1,
0.7059553, -0.5209565, 3.50311, 0.4156863, 0, 1, 1,
0.7066047, -0.7831518, 3.021112, 0.4235294, 0, 1, 1,
0.7094653, 0.319093, -0.2899316, 0.427451, 0, 1, 1,
0.7103024, 0.1619317, 2.573071, 0.4352941, 0, 1, 1,
0.7124556, 0.05777692, 0.3638827, 0.4392157, 0, 1, 1,
0.7147143, -1.438073, 2.566568, 0.4470588, 0, 1, 1,
0.7163858, -0.7824503, 3.173405, 0.4509804, 0, 1, 1,
0.7180392, -1.150645, 3.562351, 0.4588235, 0, 1, 1,
0.7180486, -0.3929904, 0.7689676, 0.4627451, 0, 1, 1,
0.7199293, -0.6673527, 1.809908, 0.4705882, 0, 1, 1,
0.7211351, 0.3884506, 1.421463, 0.4745098, 0, 1, 1,
0.7228944, -0.01669987, 2.008855, 0.4823529, 0, 1, 1,
0.7229721, 1.753229, 0.5079678, 0.4862745, 0, 1, 1,
0.7241135, -0.533276, 2.565908, 0.4941176, 0, 1, 1,
0.7248995, -0.7022209, 1.362711, 0.5019608, 0, 1, 1,
0.7320902, -0.6830263, 2.893799, 0.5058824, 0, 1, 1,
0.7339054, -0.6146907, 4.262175, 0.5137255, 0, 1, 1,
0.7456947, 0.8143895, 2.07202, 0.5176471, 0, 1, 1,
0.752356, 0.105764, 2.24932, 0.5254902, 0, 1, 1,
0.7611548, 1.739729, 0.7364573, 0.5294118, 0, 1, 1,
0.7620794, -0.219456, 1.418895, 0.5372549, 0, 1, 1,
0.7623109, -0.03758067, 1.264661, 0.5411765, 0, 1, 1,
0.7665065, -1.087456, 1.872362, 0.5490196, 0, 1, 1,
0.7665691, 0.09476944, 1.520704, 0.5529412, 0, 1, 1,
0.7678919, -1.066123, 3.267581, 0.5607843, 0, 1, 1,
0.7691149, 2.256561, 0.8662535, 0.5647059, 0, 1, 1,
0.7703951, 0.1728502, 2.523113, 0.572549, 0, 1, 1,
0.7719976, 0.01755662, 2.371638, 0.5764706, 0, 1, 1,
0.7730707, -1.137972, 3.29518, 0.5843138, 0, 1, 1,
0.7745156, 1.620684, -1.296101, 0.5882353, 0, 1, 1,
0.7746267, 1.256388, -0.04980106, 0.5960785, 0, 1, 1,
0.775687, -1.129613, 3.08679, 0.6039216, 0, 1, 1,
0.7793899, -0.3224406, 3.000923, 0.6078432, 0, 1, 1,
0.7798452, -0.8706723, 2.885697, 0.6156863, 0, 1, 1,
0.7801812, 0.8663575, -0.9226475, 0.6196079, 0, 1, 1,
0.783263, 1.473046, 1.579687, 0.627451, 0, 1, 1,
0.7841434, 1.659688, 0.4962872, 0.6313726, 0, 1, 1,
0.7889252, -0.317471, 2.816062, 0.6392157, 0, 1, 1,
0.7913048, -1.355066, 1.103685, 0.6431373, 0, 1, 1,
0.7921067, -1.097532, 0.7034611, 0.6509804, 0, 1, 1,
0.7924051, 0.01234938, 2.921326, 0.654902, 0, 1, 1,
0.7994801, -1.229259, 1.647417, 0.6627451, 0, 1, 1,
0.8001438, 0.3303472, 0.6380687, 0.6666667, 0, 1, 1,
0.8002805, -1.806496, 1.459655, 0.6745098, 0, 1, 1,
0.8053639, -0.9205706, 4.696265, 0.6784314, 0, 1, 1,
0.8082108, -0.3141176, 3.970068, 0.6862745, 0, 1, 1,
0.8103746, -1.466484, 2.67276, 0.6901961, 0, 1, 1,
0.8103792, -0.3050598, 1.534683, 0.6980392, 0, 1, 1,
0.8221781, -0.08019826, -0.5123361, 0.7058824, 0, 1, 1,
0.8236724, -0.3335252, 3.753725, 0.7098039, 0, 1, 1,
0.8254244, 0.5758495, -0.6169369, 0.7176471, 0, 1, 1,
0.8267719, 0.5424896, 1.348639, 0.7215686, 0, 1, 1,
0.8293341, -1.004298, 1.915873, 0.7294118, 0, 1, 1,
0.8347951, -0.4852539, 2.519714, 0.7333333, 0, 1, 1,
0.8354003, -0.7267468, 3.555495, 0.7411765, 0, 1, 1,
0.8406485, 0.5240718, 0.5164593, 0.7450981, 0, 1, 1,
0.8411106, 0.3703758, -0.8999001, 0.7529412, 0, 1, 1,
0.8428469, 2.325564, -0.1127881, 0.7568628, 0, 1, 1,
0.8459126, 0.3231341, 0.4795361, 0.7647059, 0, 1, 1,
0.8490353, 0.5979764, 0.6602857, 0.7686275, 0, 1, 1,
0.8522196, 0.2971936, 3.002256, 0.7764706, 0, 1, 1,
0.8564692, 0.8412208, 1.186737, 0.7803922, 0, 1, 1,
0.8582315, 1.314541, 0.251009, 0.7882353, 0, 1, 1,
0.8652868, 0.007393917, 0.06471819, 0.7921569, 0, 1, 1,
0.86764, 1.276987, -1.2601, 0.8, 0, 1, 1,
0.8739945, -1.073704, 2.985075, 0.8078431, 0, 1, 1,
0.8786165, 0.9572706, -0.8494185, 0.8117647, 0, 1, 1,
0.8821223, -2.024382, 3.387286, 0.8196079, 0, 1, 1,
0.8860673, 0.1149953, 2.960092, 0.8235294, 0, 1, 1,
0.8905781, 0.2725757, 0.7754429, 0.8313726, 0, 1, 1,
0.8918917, 0.8238989, -0.9496271, 0.8352941, 0, 1, 1,
0.8947842, -0.3579862, 1.970278, 0.8431373, 0, 1, 1,
0.9095758, 0.0216786, 1.803779, 0.8470588, 0, 1, 1,
0.9133019, 0.7291508, 0.5271625, 0.854902, 0, 1, 1,
0.9181066, -1.837309, 2.653968, 0.8588235, 0, 1, 1,
0.9193169, -0.6938442, 3.005447, 0.8666667, 0, 1, 1,
0.9269047, 0.1424483, 1.934752, 0.8705882, 0, 1, 1,
0.9270818, -0.997322, 1.679432, 0.8784314, 0, 1, 1,
0.9280742, -0.5755771, 1.629105, 0.8823529, 0, 1, 1,
0.9296914, -0.8696834, 1.879049, 0.8901961, 0, 1, 1,
0.9341341, 1.635891, 1.853826, 0.8941177, 0, 1, 1,
0.9347814, 0.503059, 1.496026, 0.9019608, 0, 1, 1,
0.943211, -0.2642083, 2.162207, 0.9098039, 0, 1, 1,
0.9461784, 0.0834848, 0.1488403, 0.9137255, 0, 1, 1,
0.9468206, 0.3630211, 0.3486519, 0.9215686, 0, 1, 1,
0.9528131, 1.56757, 3.134229, 0.9254902, 0, 1, 1,
0.9559323, 1.317351, 1.76156, 0.9333333, 0, 1, 1,
0.9670975, 1.00412, 0.2960327, 0.9372549, 0, 1, 1,
0.9721729, 0.5400272, -0.2464164, 0.945098, 0, 1, 1,
0.9740966, -1.678105, 3.784636, 0.9490196, 0, 1, 1,
0.9748457, 0.7692765, -0.2433158, 0.9568627, 0, 1, 1,
0.9809623, -0.1988384, 1.746684, 0.9607843, 0, 1, 1,
0.9838982, -0.01130913, 3.574959, 0.9686275, 0, 1, 1,
0.9841397, 0.4394249, -0.5233544, 0.972549, 0, 1, 1,
0.9843581, 0.05686866, 0.7417169, 0.9803922, 0, 1, 1,
0.9863524, -0.1196821, 1.717911, 0.9843137, 0, 1, 1,
0.988789, -0.6532235, 3.196169, 0.9921569, 0, 1, 1,
0.988867, 1.011453, 1.713385, 0.9960784, 0, 1, 1,
0.9909612, 0.1395204, 0.7345632, 1, 0, 0.9960784, 1,
0.9994426, 2.702067, 0.7611356, 1, 0, 0.9882353, 1,
0.999847, -0.6154798, 1.929168, 1, 0, 0.9843137, 1,
1.00068, -0.2825092, 2.276719, 1, 0, 0.9764706, 1,
1.003825, 0.09800677, 0.5574165, 1, 0, 0.972549, 1,
1.00714, 0.313483, 1.007525, 1, 0, 0.9647059, 1,
1.013559, 1.164587, 0.663816, 1, 0, 0.9607843, 1,
1.022605, 0.7119113, 0.2769876, 1, 0, 0.9529412, 1,
1.027178, -0.04175927, 2.760463, 1, 0, 0.9490196, 1,
1.030816, 0.6559103, -0.7761567, 1, 0, 0.9411765, 1,
1.033312, 1.291673, 0.9132912, 1, 0, 0.9372549, 1,
1.039159, -0.08875661, 3.105012, 1, 0, 0.9294118, 1,
1.048353, 0.8962474, 2.507299, 1, 0, 0.9254902, 1,
1.048663, 0.8277208, 0.1192449, 1, 0, 0.9176471, 1,
1.058773, -0.972804, 3.291335, 1, 0, 0.9137255, 1,
1.058813, 1.212331, 0.939698, 1, 0, 0.9058824, 1,
1.062849, 1.905926, -0.2089196, 1, 0, 0.9019608, 1,
1.066198, 0.6793327, 1.015809, 1, 0, 0.8941177, 1,
1.067404, 0.8434462, 0.1777519, 1, 0, 0.8862745, 1,
1.067472, -0.5186739, 0.2294628, 1, 0, 0.8823529, 1,
1.074085, -1.344316, 3.450212, 1, 0, 0.8745098, 1,
1.078195, -0.2839043, 2.087718, 1, 0, 0.8705882, 1,
1.087957, -0.2523332, 2.209676, 1, 0, 0.8627451, 1,
1.092849, 1.029334, 2.080661, 1, 0, 0.8588235, 1,
1.102427, 0.7196538, 2.550239, 1, 0, 0.8509804, 1,
1.104082, 0.4409026, 0.6278582, 1, 0, 0.8470588, 1,
1.108984, -0.550153, 1.300808, 1, 0, 0.8392157, 1,
1.11246, 1.431938, 0.18665, 1, 0, 0.8352941, 1,
1.117082, -0.6365397, 1.596961, 1, 0, 0.827451, 1,
1.120111, -0.741972, 3.950596, 1, 0, 0.8235294, 1,
1.133428, 0.5125133, 2.192766, 1, 0, 0.8156863, 1,
1.134585, -1.22375, 2.731556, 1, 0, 0.8117647, 1,
1.139716, 0.1362556, 1.191538, 1, 0, 0.8039216, 1,
1.141449, -1.326091, 2.995574, 1, 0, 0.7960784, 1,
1.150837, 0.8387527, 2.69542, 1, 0, 0.7921569, 1,
1.151805, -0.4429619, 2.057769, 1, 0, 0.7843137, 1,
1.15834, 1.973594, 0.01598802, 1, 0, 0.7803922, 1,
1.161709, -0.03629184, 1.724308, 1, 0, 0.772549, 1,
1.165987, 0.6561836, 1.34888, 1, 0, 0.7686275, 1,
1.172508, 0.01875257, 1.859534, 1, 0, 0.7607843, 1,
1.173682, 0.6858544, 1.060012, 1, 0, 0.7568628, 1,
1.176537, 1.264852, 0.4594586, 1, 0, 0.7490196, 1,
1.179011, 0.9579284, 3.164653, 1, 0, 0.7450981, 1,
1.186937, 0.6507368, 2.773686, 1, 0, 0.7372549, 1,
1.201367, -0.2981434, 3.120852, 1, 0, 0.7333333, 1,
1.207868, -1.685895, 2.191093, 1, 0, 0.7254902, 1,
1.207948, 0.09683485, 2.461702, 1, 0, 0.7215686, 1,
1.208749, 0.4246448, 1.063676, 1, 0, 0.7137255, 1,
1.209484, -0.9598507, 2.542934, 1, 0, 0.7098039, 1,
1.217863, 1.265629, 0.7097494, 1, 0, 0.7019608, 1,
1.217918, 1.557261, 1.209126, 1, 0, 0.6941177, 1,
1.219191, 0.6127123, -0.4095315, 1, 0, 0.6901961, 1,
1.219563, 1.009181, -0.2968007, 1, 0, 0.682353, 1,
1.220526, -0.1713575, 0.5032701, 1, 0, 0.6784314, 1,
1.228992, -0.5907191, 1.392226, 1, 0, 0.6705883, 1,
1.232644, -0.4143229, 3.100527, 1, 0, 0.6666667, 1,
1.235076, 0.710573, 2.815711, 1, 0, 0.6588235, 1,
1.236259, 0.3754617, 1.172585, 1, 0, 0.654902, 1,
1.237353, 0.04254566, 1.6275, 1, 0, 0.6470588, 1,
1.242165, -0.6796419, 1.882248, 1, 0, 0.6431373, 1,
1.242563, 0.7397851, 0.5108291, 1, 0, 0.6352941, 1,
1.244959, -0.4533208, 0.3296553, 1, 0, 0.6313726, 1,
1.246444, -0.3459536, 1.689799, 1, 0, 0.6235294, 1,
1.248056, -1.033512, 3.92629, 1, 0, 0.6196079, 1,
1.248536, 0.4789948, 0.1771372, 1, 0, 0.6117647, 1,
1.249944, 0.8881549, 2.174826, 1, 0, 0.6078432, 1,
1.256279, 0.5239062, 0.8238837, 1, 0, 0.6, 1,
1.258059, -0.4351713, 1.471151, 1, 0, 0.5921569, 1,
1.262545, -1.038046, 1.017942, 1, 0, 0.5882353, 1,
1.263379, 0.7738915, 2.338891, 1, 0, 0.5803922, 1,
1.268797, 0.4792492, 0.8585092, 1, 0, 0.5764706, 1,
1.276103, 1.450039, 0.4764688, 1, 0, 0.5686275, 1,
1.289144, -0.5111468, 1.894631, 1, 0, 0.5647059, 1,
1.300216, 0.2432451, 1.347976, 1, 0, 0.5568628, 1,
1.308907, 1.225474, -0.2644033, 1, 0, 0.5529412, 1,
1.318645, 0.1884269, 0.6032619, 1, 0, 0.5450981, 1,
1.318911, 0.492494, 1.132631, 1, 0, 0.5411765, 1,
1.327714, 0.6594642, 1.342142, 1, 0, 0.5333334, 1,
1.331301, -0.1326738, 2.633133, 1, 0, 0.5294118, 1,
1.331379, 0.8534281, 0.204409, 1, 0, 0.5215687, 1,
1.349541, 0.4854633, 1.493405, 1, 0, 0.5176471, 1,
1.351474, -0.2430809, -0.3690091, 1, 0, 0.509804, 1,
1.360507, -0.7821507, 1.592312, 1, 0, 0.5058824, 1,
1.364357, -1.540949, 1.551803, 1, 0, 0.4980392, 1,
1.368202, -2.075278, 3.890234, 1, 0, 0.4901961, 1,
1.369135, 0.7600065, 0.4686969, 1, 0, 0.4862745, 1,
1.376835, -0.9853667, 0.785034, 1, 0, 0.4784314, 1,
1.378736, 0.1473736, 2.414301, 1, 0, 0.4745098, 1,
1.378985, 0.5424053, 1.173522, 1, 0, 0.4666667, 1,
1.385763, 0.9727305, 1.932914, 1, 0, 0.4627451, 1,
1.395673, -0.6037346, 3.059709, 1, 0, 0.454902, 1,
1.396337, 1.662954, -0.04263354, 1, 0, 0.4509804, 1,
1.399775, 0.7569071, 2.568526, 1, 0, 0.4431373, 1,
1.409456, 2.470171, 0.4122127, 1, 0, 0.4392157, 1,
1.412321, -0.6597133, 1.295148, 1, 0, 0.4313726, 1,
1.414137, 0.7827498, 0.4043631, 1, 0, 0.427451, 1,
1.436497, -0.3105955, 1.395376, 1, 0, 0.4196078, 1,
1.438858, -0.9928565, 1.664167, 1, 0, 0.4156863, 1,
1.449744, -0.1376594, 2.983031, 1, 0, 0.4078431, 1,
1.451915, -1.022514, 2.47038, 1, 0, 0.4039216, 1,
1.454771, -1.678573, 2.736792, 1, 0, 0.3960784, 1,
1.46054, 2.360396, 0.01119931, 1, 0, 0.3882353, 1,
1.46422, 1.006022, 1.705899, 1, 0, 0.3843137, 1,
1.480272, 0.282808, 0.1657658, 1, 0, 0.3764706, 1,
1.494506, 0.2610112, 1.27385, 1, 0, 0.372549, 1,
1.500024, -0.02650161, 1.272424, 1, 0, 0.3647059, 1,
1.500132, 1.735712, 0.3958391, 1, 0, 0.3607843, 1,
1.500939, 0.8237626, 2.573263, 1, 0, 0.3529412, 1,
1.505735, -0.9478738, 3.15967, 1, 0, 0.3490196, 1,
1.506163, -0.1202583, 1.07162, 1, 0, 0.3411765, 1,
1.525672, 0.4938637, -0.3183489, 1, 0, 0.3372549, 1,
1.536247, 1.402036, -0.05427723, 1, 0, 0.3294118, 1,
1.53873, 1.507737, 1.112029, 1, 0, 0.3254902, 1,
1.543311, -2.428375, 3.540374, 1, 0, 0.3176471, 1,
1.549371, 0.86177, 0.4025161, 1, 0, 0.3137255, 1,
1.550238, 0.5400967, 1.200754, 1, 0, 0.3058824, 1,
1.554262, -1.528803, 4.300293, 1, 0, 0.2980392, 1,
1.555972, -0.4002111, 1.214472, 1, 0, 0.2941177, 1,
1.574629, -0.05816213, 1.218943, 1, 0, 0.2862745, 1,
1.601882, 0.02126681, 2.715615, 1, 0, 0.282353, 1,
1.606706, -0.6880011, 1.190731, 1, 0, 0.2745098, 1,
1.608718, -1.648499, 2.795197, 1, 0, 0.2705882, 1,
1.628658, -0.5243599, 1.689405, 1, 0, 0.2627451, 1,
1.637378, 0.02672487, 1.688251, 1, 0, 0.2588235, 1,
1.649161, 0.1283188, 2.21626, 1, 0, 0.2509804, 1,
1.654183, -0.4331001, 0.7721987, 1, 0, 0.2470588, 1,
1.657786, 0.3788331, 1.880284, 1, 0, 0.2392157, 1,
1.662951, 0.7542434, 2.417799, 1, 0, 0.2352941, 1,
1.663376, 0.6580873, 0.5688411, 1, 0, 0.227451, 1,
1.678112, 0.4183123, 1.411548, 1, 0, 0.2235294, 1,
1.679369, -0.8635519, 4.265234, 1, 0, 0.2156863, 1,
1.680359, -0.4075412, 2.192518, 1, 0, 0.2117647, 1,
1.683751, 1.386996, 0.9068281, 1, 0, 0.2039216, 1,
1.688477, -0.831996, 2.700763, 1, 0, 0.1960784, 1,
1.719409, -0.1517489, 1.297025, 1, 0, 0.1921569, 1,
1.726908, 0.4492319, 0.2264324, 1, 0, 0.1843137, 1,
1.729749, -1.528984, 3.065761, 1, 0, 0.1803922, 1,
1.748554, 2.145179, 1.324457, 1, 0, 0.172549, 1,
1.787313, -0.1750471, 3.065103, 1, 0, 0.1686275, 1,
1.787882, -0.831201, 2.0321, 1, 0, 0.1607843, 1,
1.801021, 0.2889903, 1.479113, 1, 0, 0.1568628, 1,
1.811472, 0.2388338, 3.816936, 1, 0, 0.1490196, 1,
1.855355, -1.325308, 2.584621, 1, 0, 0.145098, 1,
1.88992, -0.6378646, 3.328391, 1, 0, 0.1372549, 1,
1.890846, 0.1514183, 4.376926, 1, 0, 0.1333333, 1,
1.904287, -0.1775574, 2.344602, 1, 0, 0.1254902, 1,
1.913421, -0.9643428, 2.026421, 1, 0, 0.1215686, 1,
1.976919, 0.8260718, -0.5479611, 1, 0, 0.1137255, 1,
1.982789, 0.4881114, 0.08894564, 1, 0, 0.1098039, 1,
1.983896, -1.24571, 1.96861, 1, 0, 0.1019608, 1,
2.010077, -0.7357996, 3.110254, 1, 0, 0.09411765, 1,
2.014478, 0.2765647, 2.423368, 1, 0, 0.09019608, 1,
2.039735, -0.8912352, 2.330683, 1, 0, 0.08235294, 1,
2.062726, -1.183329, 0.9714205, 1, 0, 0.07843138, 1,
2.083479, 0.343201, 0.08723667, 1, 0, 0.07058824, 1,
2.109217, 0.8098578, 1.740756, 1, 0, 0.06666667, 1,
2.179516, -1.426545, 3.990547, 1, 0, 0.05882353, 1,
2.17966, -0.2894109, 0.5865446, 1, 0, 0.05490196, 1,
2.181577, -0.5955325, 1.906225, 1, 0, 0.04705882, 1,
2.214553, 0.111215, 1.36208, 1, 0, 0.04313726, 1,
2.310899, 0.7989791, 0.8615833, 1, 0, 0.03529412, 1,
2.337901, -0.003808755, 1.266963, 1, 0, 0.03137255, 1,
2.429361, 0.964117, 2.85308, 1, 0, 0.02352941, 1,
2.659768, -1.531992, -0.3195645, 1, 0, 0.01960784, 1,
2.698435, -0.6245881, 1.468072, 1, 0, 0.01176471, 1,
3.356934, 0.6849593, 1.064475, 1, 0, 0.007843138, 1
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
0.2415632, -4.132186, -7.27131, 0, -0.5, 0.5, 0.5,
0.2415632, -4.132186, -7.27131, 1, -0.5, 0.5, 0.5,
0.2415632, -4.132186, -7.27131, 1, 1.5, 0.5, 0.5,
0.2415632, -4.132186, -7.27131, 0, 1.5, 0.5, 0.5
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
-3.929918, -0.1396159, -7.27131, 0, -0.5, 0.5, 0.5,
-3.929918, -0.1396159, -7.27131, 1, -0.5, 0.5, 0.5,
-3.929918, -0.1396159, -7.27131, 1, 1.5, 0.5, 0.5,
-3.929918, -0.1396159, -7.27131, 0, 1.5, 0.5, 0.5
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
-3.929918, -4.132186, 0.1616452, 0, -0.5, 0.5, 0.5,
-3.929918, -4.132186, 0.1616452, 1, -0.5, 0.5, 0.5,
-3.929918, -4.132186, 0.1616452, 1, 1.5, 0.5, 0.5,
-3.929918, -4.132186, 0.1616452, 0, 1.5, 0.5, 0.5
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
-2, -3.210824, -5.556013,
3, -3.210824, -5.556013,
-2, -3.210824, -5.556013,
-2, -3.364384, -5.841896,
-1, -3.210824, -5.556013,
-1, -3.364384, -5.841896,
0, -3.210824, -5.556013,
0, -3.364384, -5.841896,
1, -3.210824, -5.556013,
1, -3.364384, -5.841896,
2, -3.210824, -5.556013,
2, -3.364384, -5.841896,
3, -3.210824, -5.556013,
3, -3.364384, -5.841896
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
-2, -3.671504, -6.413661, 0, -0.5, 0.5, 0.5,
-2, -3.671504, -6.413661, 1, -0.5, 0.5, 0.5,
-2, -3.671504, -6.413661, 1, 1.5, 0.5, 0.5,
-2, -3.671504, -6.413661, 0, 1.5, 0.5, 0.5,
-1, -3.671504, -6.413661, 0, -0.5, 0.5, 0.5,
-1, -3.671504, -6.413661, 1, -0.5, 0.5, 0.5,
-1, -3.671504, -6.413661, 1, 1.5, 0.5, 0.5,
-1, -3.671504, -6.413661, 0, 1.5, 0.5, 0.5,
0, -3.671504, -6.413661, 0, -0.5, 0.5, 0.5,
0, -3.671504, -6.413661, 1, -0.5, 0.5, 0.5,
0, -3.671504, -6.413661, 1, 1.5, 0.5, 0.5,
0, -3.671504, -6.413661, 0, 1.5, 0.5, 0.5,
1, -3.671504, -6.413661, 0, -0.5, 0.5, 0.5,
1, -3.671504, -6.413661, 1, -0.5, 0.5, 0.5,
1, -3.671504, -6.413661, 1, 1.5, 0.5, 0.5,
1, -3.671504, -6.413661, 0, 1.5, 0.5, 0.5,
2, -3.671504, -6.413661, 0, -0.5, 0.5, 0.5,
2, -3.671504, -6.413661, 1, -0.5, 0.5, 0.5,
2, -3.671504, -6.413661, 1, 1.5, 0.5, 0.5,
2, -3.671504, -6.413661, 0, 1.5, 0.5, 0.5,
3, -3.671504, -6.413661, 0, -0.5, 0.5, 0.5,
3, -3.671504, -6.413661, 1, -0.5, 0.5, 0.5,
3, -3.671504, -6.413661, 1, 1.5, 0.5, 0.5,
3, -3.671504, -6.413661, 0, 1.5, 0.5, 0.5
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
-2.967268, -3, -5.556013,
-2.967268, 2, -5.556013,
-2.967268, -3, -5.556013,
-3.12771, -3, -5.841896,
-2.967268, -2, -5.556013,
-3.12771, -2, -5.841896,
-2.967268, -1, -5.556013,
-3.12771, -1, -5.841896,
-2.967268, 0, -5.556013,
-3.12771, 0, -5.841896,
-2.967268, 1, -5.556013,
-3.12771, 1, -5.841896,
-2.967268, 2, -5.556013,
-3.12771, 2, -5.841896
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
-3.448593, -3, -6.413661, 0, -0.5, 0.5, 0.5,
-3.448593, -3, -6.413661, 1, -0.5, 0.5, 0.5,
-3.448593, -3, -6.413661, 1, 1.5, 0.5, 0.5,
-3.448593, -3, -6.413661, 0, 1.5, 0.5, 0.5,
-3.448593, -2, -6.413661, 0, -0.5, 0.5, 0.5,
-3.448593, -2, -6.413661, 1, -0.5, 0.5, 0.5,
-3.448593, -2, -6.413661, 1, 1.5, 0.5, 0.5,
-3.448593, -2, -6.413661, 0, 1.5, 0.5, 0.5,
-3.448593, -1, -6.413661, 0, -0.5, 0.5, 0.5,
-3.448593, -1, -6.413661, 1, -0.5, 0.5, 0.5,
-3.448593, -1, -6.413661, 1, 1.5, 0.5, 0.5,
-3.448593, -1, -6.413661, 0, 1.5, 0.5, 0.5,
-3.448593, 0, -6.413661, 0, -0.5, 0.5, 0.5,
-3.448593, 0, -6.413661, 1, -0.5, 0.5, 0.5,
-3.448593, 0, -6.413661, 1, 1.5, 0.5, 0.5,
-3.448593, 0, -6.413661, 0, 1.5, 0.5, 0.5,
-3.448593, 1, -6.413661, 0, -0.5, 0.5, 0.5,
-3.448593, 1, -6.413661, 1, -0.5, 0.5, 0.5,
-3.448593, 1, -6.413661, 1, 1.5, 0.5, 0.5,
-3.448593, 1, -6.413661, 0, 1.5, 0.5, 0.5,
-3.448593, 2, -6.413661, 0, -0.5, 0.5, 0.5,
-3.448593, 2, -6.413661, 1, -0.5, 0.5, 0.5,
-3.448593, 2, -6.413661, 1, 1.5, 0.5, 0.5,
-3.448593, 2, -6.413661, 0, 1.5, 0.5, 0.5
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
-2.967268, -3.210824, -4,
-2.967268, -3.210824, 4,
-2.967268, -3.210824, -4,
-3.12771, -3.364384, -4,
-2.967268, -3.210824, -2,
-3.12771, -3.364384, -2,
-2.967268, -3.210824, 0,
-3.12771, -3.364384, 0,
-2.967268, -3.210824, 2,
-3.12771, -3.364384, 2,
-2.967268, -3.210824, 4,
-3.12771, -3.364384, 4
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
-3.448593, -3.671504, -4, 0, -0.5, 0.5, 0.5,
-3.448593, -3.671504, -4, 1, -0.5, 0.5, 0.5,
-3.448593, -3.671504, -4, 1, 1.5, 0.5, 0.5,
-3.448593, -3.671504, -4, 0, 1.5, 0.5, 0.5,
-3.448593, -3.671504, -2, 0, -0.5, 0.5, 0.5,
-3.448593, -3.671504, -2, 1, -0.5, 0.5, 0.5,
-3.448593, -3.671504, -2, 1, 1.5, 0.5, 0.5,
-3.448593, -3.671504, -2, 0, 1.5, 0.5, 0.5,
-3.448593, -3.671504, 0, 0, -0.5, 0.5, 0.5,
-3.448593, -3.671504, 0, 1, -0.5, 0.5, 0.5,
-3.448593, -3.671504, 0, 1, 1.5, 0.5, 0.5,
-3.448593, -3.671504, 0, 0, 1.5, 0.5, 0.5,
-3.448593, -3.671504, 2, 0, -0.5, 0.5, 0.5,
-3.448593, -3.671504, 2, 1, -0.5, 0.5, 0.5,
-3.448593, -3.671504, 2, 1, 1.5, 0.5, 0.5,
-3.448593, -3.671504, 2, 0, 1.5, 0.5, 0.5,
-3.448593, -3.671504, 4, 0, -0.5, 0.5, 0.5,
-3.448593, -3.671504, 4, 1, -0.5, 0.5, 0.5,
-3.448593, -3.671504, 4, 1, 1.5, 0.5, 0.5,
-3.448593, -3.671504, 4, 0, 1.5, 0.5, 0.5
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
-2.967268, -3.210824, -5.556013,
-2.967268, 2.931592, -5.556013,
-2.967268, -3.210824, 5.879303,
-2.967268, 2.931592, 5.879303,
-2.967268, -3.210824, -5.556013,
-2.967268, -3.210824, 5.879303,
-2.967268, 2.931592, -5.556013,
-2.967268, 2.931592, 5.879303,
-2.967268, -3.210824, -5.556013,
3.450395, -3.210824, -5.556013,
-2.967268, -3.210824, 5.879303,
3.450395, -3.210824, 5.879303,
-2.967268, 2.931592, -5.556013,
3.450395, 2.931592, -5.556013,
-2.967268, 2.931592, 5.879303,
3.450395, 2.931592, 5.879303,
3.450395, -3.210824, -5.556013,
3.450395, 2.931592, -5.556013,
3.450395, -3.210824, 5.879303,
3.450395, 2.931592, 5.879303,
3.450395, -3.210824, -5.556013,
3.450395, -3.210824, 5.879303,
3.450395, 2.931592, -5.556013,
3.450395, 2.931592, 5.879303
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
var radius = 7.732255;
var distance = 34.40168;
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
mvMatrix.translate( -0.2415632, 0.1396159, -0.1616452 );
mvMatrix.scale( 1.302696, 1.361071, 0.7310917 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.40168);
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
boscalid<-read.table("boscalid.xyz")
```

```
## Error in read.table("boscalid.xyz"): no lines available in input
```

```r
x<-boscalid$V2
```

```
## Error in eval(expr, envir, enclos): object 'boscalid' not found
```

```r
y<-boscalid$V3
```

```
## Error in eval(expr, envir, enclos): object 'boscalid' not found
```

```r
z<-boscalid$V4
```

```
## Error in eval(expr, envir, enclos): object 'boscalid' not found
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
-2.873807, 0.3278046, 0.2358329, 0, 0, 1, 1, 1,
-2.838595, -0.4383685, -1.306827, 1, 0, 0, 1, 1,
-2.58221, 0.6873943, -0.04869667, 1, 0, 0, 1, 1,
-2.559732, -1.751295, -2.619792, 1, 0, 0, 1, 1,
-2.513527, 1.44678, -1.363864, 1, 0, 0, 1, 1,
-2.500285, -0.5514013, -1.040968, 1, 0, 0, 1, 1,
-2.47711, 0.6479999, -1.018382, 0, 0, 0, 1, 1,
-2.458576, -0.626116, -0.691046, 0, 0, 0, 1, 1,
-2.371654, 1.155977, -0.3396113, 0, 0, 0, 1, 1,
-2.34849, -1.431863, -2.695705, 0, 0, 0, 1, 1,
-2.299262, 0.160768, -0.06607807, 0, 0, 0, 1, 1,
-2.295774, -0.473485, -2.161757, 0, 0, 0, 1, 1,
-2.227638, 0.6527203, -1.498521, 0, 0, 0, 1, 1,
-2.20546, 0.6692079, -1.381091, 1, 1, 1, 1, 1,
-2.197084, 0.3854469, -1.406412, 1, 1, 1, 1, 1,
-2.182174, -0.7120999, -3.36699, 1, 1, 1, 1, 1,
-2.165681, 0.7048265, -2.318604, 1, 1, 1, 1, 1,
-2.118943, -1.122722, -0.824194, 1, 1, 1, 1, 1,
-2.099124, 0.8433899, 0.08319817, 1, 1, 1, 1, 1,
-2.049473, -1.553199, -1.468537, 1, 1, 1, 1, 1,
-2.019741, 0.3231035, -0.9131076, 1, 1, 1, 1, 1,
-2.014283, -0.2189586, -1.664992, 1, 1, 1, 1, 1,
-1.960414, -0.06857415, -0.1921751, 1, 1, 1, 1, 1,
-1.957956, -0.3325443, -0.9062486, 1, 1, 1, 1, 1,
-1.920576, -0.1189206, -1.911433, 1, 1, 1, 1, 1,
-1.917634, -0.2013085, -1.769482, 1, 1, 1, 1, 1,
-1.912466, 0.7360463, 0.0899239, 1, 1, 1, 1, 1,
-1.909055, 0.3297011, -1.953719, 1, 1, 1, 1, 1,
-1.907357, -0.2756907, -1.63954, 0, 0, 1, 1, 1,
-1.843874, -1.619119, -2.010691, 1, 0, 0, 1, 1,
-1.840932, 0.79504, -1.961483, 1, 0, 0, 1, 1,
-1.823359, -0.3336641, -2.896085, 1, 0, 0, 1, 1,
-1.821189, -0.8095759, -0.4125046, 1, 0, 0, 1, 1,
-1.817888, -1.840468, -2.710494, 1, 0, 0, 1, 1,
-1.810716, 1.031379, -1.208547, 0, 0, 0, 1, 1,
-1.807024, 0.9331367, -1.969173, 0, 0, 0, 1, 1,
-1.798628, -1.056952, -0.1323372, 0, 0, 0, 1, 1,
-1.768162, 0.2498357, -0.7112548, 0, 0, 0, 1, 1,
-1.754542, -1.468295, -3.133821, 0, 0, 0, 1, 1,
-1.754312, 0.06497736, -1.354938, 0, 0, 0, 1, 1,
-1.750936, 1.302635, -1.667051, 0, 0, 0, 1, 1,
-1.727067, -0.08221695, -0.6506453, 1, 1, 1, 1, 1,
-1.71884, 0.843628, -0.858204, 1, 1, 1, 1, 1,
-1.714418, 1.377925, -0.8226888, 1, 1, 1, 1, 1,
-1.713897, 0.7534918, 0.6524691, 1, 1, 1, 1, 1,
-1.70725, -0.5610701, -3.060089, 1, 1, 1, 1, 1,
-1.699638, -0.6298821, -3.382319, 1, 1, 1, 1, 1,
-1.698535, -0.0142619, -1.919928, 1, 1, 1, 1, 1,
-1.693637, -0.1512744, -1.299541, 1, 1, 1, 1, 1,
-1.678064, -0.07782196, -1.131205, 1, 1, 1, 1, 1,
-1.675731, 0.032691, -1.352842, 1, 1, 1, 1, 1,
-1.659832, 0.3643456, -1.393479, 1, 1, 1, 1, 1,
-1.627348, 1.03612, -1.468436, 1, 1, 1, 1, 1,
-1.621861, -0.6916603, -0.01222063, 1, 1, 1, 1, 1,
-1.608487, 0.4959605, -0.71734, 1, 1, 1, 1, 1,
-1.603203, 1.158771, -0.2633823, 1, 1, 1, 1, 1,
-1.592643, -0.7445183, -0.04197303, 0, 0, 1, 1, 1,
-1.58848, -0.09210802, -2.099489, 1, 0, 0, 1, 1,
-1.581437, 1.037035, -1.019172, 1, 0, 0, 1, 1,
-1.580298, 0.05752345, -0.9462703, 1, 0, 0, 1, 1,
-1.57914, 0.936802, 0.3292002, 1, 0, 0, 1, 1,
-1.556419, 0.2327386, -0.7832065, 1, 0, 0, 1, 1,
-1.556104, 1.781654, -0.1826037, 0, 0, 0, 1, 1,
-1.554516, -0.3142523, -1.181183, 0, 0, 0, 1, 1,
-1.551404, -0.2274116, -2.570679, 0, 0, 0, 1, 1,
-1.543558, -1.044267, -3.929842, 0, 0, 0, 1, 1,
-1.532639, -0.6580207, -2.680213, 0, 0, 0, 1, 1,
-1.530002, -0.8229351, -1.257033, 0, 0, 0, 1, 1,
-1.518793, -0.3869637, -2.228545, 0, 0, 0, 1, 1,
-1.513006, 0.1024425, -1.296424, 1, 1, 1, 1, 1,
-1.51235, 0.00408965, -1.038284, 1, 1, 1, 1, 1,
-1.506363, -1.34195, -3.213688, 1, 1, 1, 1, 1,
-1.494128, -2.167581, -2.98039, 1, 1, 1, 1, 1,
-1.488154, -0.7658121, -2.891682, 1, 1, 1, 1, 1,
-1.486074, -0.9584461, -4.124394, 1, 1, 1, 1, 1,
-1.470071, -0.3620497, -2.886952, 1, 1, 1, 1, 1,
-1.468625, -1.122368, -1.7315, 1, 1, 1, 1, 1,
-1.463323, 1.66282, -0.2825087, 1, 1, 1, 1, 1,
-1.457037, -0.9523087, -4.24867, 1, 1, 1, 1, 1,
-1.453938, 1.22499, -1.277462, 1, 1, 1, 1, 1,
-1.452723, -0.3973255, -2.084293, 1, 1, 1, 1, 1,
-1.446958, -0.6875851, -1.847023, 1, 1, 1, 1, 1,
-1.444353, 0.4525194, -1.207834, 1, 1, 1, 1, 1,
-1.440154, 0.1545522, -0.6307586, 1, 1, 1, 1, 1,
-1.434763, 1.092665, -0.595975, 0, 0, 1, 1, 1,
-1.420163, -1.748207, -2.198809, 1, 0, 0, 1, 1,
-1.399236, -0.08111835, -3.160497, 1, 0, 0, 1, 1,
-1.390744, -2.575429, -3.374883, 1, 0, 0, 1, 1,
-1.383207, 0.1501102, -1.591766, 1, 0, 0, 1, 1,
-1.368972, -0.4159094, -2.852307, 1, 0, 0, 1, 1,
-1.353203, -0.6849015, -2.192961, 0, 0, 0, 1, 1,
-1.348629, 1.08826, -0.6109448, 0, 0, 0, 1, 1,
-1.347761, 0.6015911, -0.3513055, 0, 0, 0, 1, 1,
-1.346428, 0.09032292, -1.657498, 0, 0, 0, 1, 1,
-1.343114, -0.3367331, -2.390131, 0, 0, 0, 1, 1,
-1.336109, 0.5716533, -1.737694, 0, 0, 0, 1, 1,
-1.326746, -0.7701449, -0.6497999, 0, 0, 0, 1, 1,
-1.320478, -0.08938569, -2.107056, 1, 1, 1, 1, 1,
-1.308384, 1.950901, 0.0001834384, 1, 1, 1, 1, 1,
-1.302268, 0.2636073, -1.570806, 1, 1, 1, 1, 1,
-1.287287, 0.1560386, -2.37564, 1, 1, 1, 1, 1,
-1.286597, 1.404746, 0.7320673, 1, 1, 1, 1, 1,
-1.280847, 0.1906338, -0.8012515, 1, 1, 1, 1, 1,
-1.277491, -2.059997, -4.176112, 1, 1, 1, 1, 1,
-1.269197, 1.160647, -0.4956034, 1, 1, 1, 1, 1,
-1.263385, -0.692522, -3.913773, 1, 1, 1, 1, 1,
-1.259264, 0.2270507, -1.179176, 1, 1, 1, 1, 1,
-1.240309, 1.361676, -0.703866, 1, 1, 1, 1, 1,
-1.231477, 1.356424, 0.3925547, 1, 1, 1, 1, 1,
-1.212374, -0.4639554, -1.907709, 1, 1, 1, 1, 1,
-1.211047, -0.7796063, -1.643053, 1, 1, 1, 1, 1,
-1.19676, 0.3729996, -0.8542529, 1, 1, 1, 1, 1,
-1.194095, 0.378698, -0.1176703, 0, 0, 1, 1, 1,
-1.193377, 0.9177102, -1.56569, 1, 0, 0, 1, 1,
-1.193348, 0.6262976, -0.6961408, 1, 0, 0, 1, 1,
-1.181711, -0.1317688, -0.2107136, 1, 0, 0, 1, 1,
-1.159522, 0.8711416, 0.01217251, 1, 0, 0, 1, 1,
-1.158181, 0.5171216, -0.4203541, 1, 0, 0, 1, 1,
-1.155141, 0.2490174, 0.2003487, 0, 0, 0, 1, 1,
-1.151353, -1.64282, -0.3035272, 0, 0, 0, 1, 1,
-1.141739, 1.108669, -1.405805, 0, 0, 0, 1, 1,
-1.126452, 2.215627, -0.7274022, 0, 0, 0, 1, 1,
-1.119147, 0.5578141, -0.5321826, 0, 0, 0, 1, 1,
-1.113364, -0.721428, -2.154246, 0, 0, 0, 1, 1,
-1.111882, 0.4078151, -2.288186, 0, 0, 0, 1, 1,
-1.111604, -1.425213, -1.652766, 1, 1, 1, 1, 1,
-1.098827, 1.389039, -1.074923, 1, 1, 1, 1, 1,
-1.096339, 0.9406459, 0.3350099, 1, 1, 1, 1, 1,
-1.09624, 0.6992971, -0.6928375, 1, 1, 1, 1, 1,
-1.094525, 0.1965201, -2.509979, 1, 1, 1, 1, 1,
-1.090395, 0.3194878, -0.0718549, 1, 1, 1, 1, 1,
-1.089104, -1.123973, -2.801683, 1, 1, 1, 1, 1,
-1.08551, -0.7091018, -1.736245, 1, 1, 1, 1, 1,
-1.081867, 0.06258452, -1.474317, 1, 1, 1, 1, 1,
-1.073677, -2.249352, -1.997412, 1, 1, 1, 1, 1,
-1.071993, -0.1909592, -2.168245, 1, 1, 1, 1, 1,
-1.065575, -0.4452456, -1.419889, 1, 1, 1, 1, 1,
-1.063478, 0.7418951, -0.3670161, 1, 1, 1, 1, 1,
-1.061417, 0.1297168, -2.36608, 1, 1, 1, 1, 1,
-1.059355, 1.770347, -0.03252871, 1, 1, 1, 1, 1,
-1.058873, -0.1605203, -2.05356, 0, 0, 1, 1, 1,
-1.055783, -0.0450934, -2.133357, 1, 0, 0, 1, 1,
-1.052482, -1.350729, -2.925775, 1, 0, 0, 1, 1,
-1.047829, 0.8731441, -1.151868, 1, 0, 0, 1, 1,
-1.022883, 1.048728, -1.433476, 1, 0, 0, 1, 1,
-1.018665, 0.9425489, -1.034572, 1, 0, 0, 1, 1,
-1.01398, 1.481602, 0.3360376, 0, 0, 0, 1, 1,
-1.012992, 0.7798311, -2.150494, 0, 0, 0, 1, 1,
-1.006309, -0.5805666, -2.701022, 0, 0, 0, 1, 1,
-1.000438, -2.097352, -0.6674407, 0, 0, 0, 1, 1,
-0.9989584, 1.185228, 0.007923692, 0, 0, 0, 1, 1,
-0.9974541, -0.5071095, -2.122447, 0, 0, 0, 1, 1,
-0.9905792, -0.7751567, -3.38205, 0, 0, 0, 1, 1,
-0.9836257, 0.5817135, -1.793544, 1, 1, 1, 1, 1,
-0.9753999, 0.4667607, -1.671742, 1, 1, 1, 1, 1,
-0.9645665, 2.128822, -0.9527012, 1, 1, 1, 1, 1,
-0.9635553, -0.5445291, -2.930989, 1, 1, 1, 1, 1,
-0.9634811, 1.427948, -0.9080103, 1, 1, 1, 1, 1,
-0.9579679, 0.1584336, -3.022589, 1, 1, 1, 1, 1,
-0.951766, -0.3411645, -2.280017, 1, 1, 1, 1, 1,
-0.949184, 0.2069811, -1.017876, 1, 1, 1, 1, 1,
-0.9371707, -0.2829692, -1.39089, 1, 1, 1, 1, 1,
-0.9344988, -1.183562, -2.908567, 1, 1, 1, 1, 1,
-0.9344057, -0.3129897, -0.3192273, 1, 1, 1, 1, 1,
-0.9343772, -0.1146912, -3.47867, 1, 1, 1, 1, 1,
-0.9322736, 1.076669, 0.02460155, 1, 1, 1, 1, 1,
-0.9311378, -1.011193, -2.058568, 1, 1, 1, 1, 1,
-0.9269198, -1.002031, -2.665447, 1, 1, 1, 1, 1,
-0.9214187, -0.7787992, -1.353858, 0, 0, 1, 1, 1,
-0.9204858, 0.9792665, -0.4492836, 1, 0, 0, 1, 1,
-0.9192636, -1.894752, -1.271947, 1, 0, 0, 1, 1,
-0.918929, -0.1848729, -1.409359, 1, 0, 0, 1, 1,
-0.9107497, -0.3312944, -3.218447, 1, 0, 0, 1, 1,
-0.9101698, 0.6597468, -1.092257, 1, 0, 0, 1, 1,
-0.909965, -0.360287, -1.557651, 0, 0, 0, 1, 1,
-0.9014089, -0.1505821, -0.7009827, 0, 0, 0, 1, 1,
-0.8949014, -0.4941492, -3.041121, 0, 0, 0, 1, 1,
-0.8903988, 0.8033112, -2.645257, 0, 0, 0, 1, 1,
-0.8892236, 0.7943298, -0.3439939, 0, 0, 0, 1, 1,
-0.888218, -1.078683, -1.671904, 0, 0, 0, 1, 1,
-0.8823859, 0.6444882, -1.482443, 0, 0, 0, 1, 1,
-0.8822325, -0.7577851, -2.160237, 1, 1, 1, 1, 1,
-0.8692507, -0.1514868, -2.151906, 1, 1, 1, 1, 1,
-0.8652288, -0.7289025, -2.731996, 1, 1, 1, 1, 1,
-0.8622844, -0.5588864, -1.807824, 1, 1, 1, 1, 1,
-0.860378, -0.9033896, -1.545675, 1, 1, 1, 1, 1,
-0.859015, 0.8397076, -0.9220415, 1, 1, 1, 1, 1,
-0.8584981, -0.5017264, -3.770624, 1, 1, 1, 1, 1,
-0.8583511, -3.121371, -1.550222, 1, 1, 1, 1, 1,
-0.85731, -0.40157, -2.802133, 1, 1, 1, 1, 1,
-0.8519178, -0.4096202, -2.886796, 1, 1, 1, 1, 1,
-0.8454415, -1.428082, -2.954082, 1, 1, 1, 1, 1,
-0.8404225, -1.282441, -1.377403, 1, 1, 1, 1, 1,
-0.8341214, 0.1600232, -1.891702, 1, 1, 1, 1, 1,
-0.8322855, 0.7179911, 0.4263353, 1, 1, 1, 1, 1,
-0.8208849, 1.55379, -1.328202, 1, 1, 1, 1, 1,
-0.8194625, -0.9359846, -2.562773, 0, 0, 1, 1, 1,
-0.8172436, 0.9156982, -1.73657, 1, 0, 0, 1, 1,
-0.8141186, -0.5029731, -3.024857, 1, 0, 0, 1, 1,
-0.8138421, -0.8897715, -2.644108, 1, 0, 0, 1, 1,
-0.8132273, 1.024951, -1.131764, 1, 0, 0, 1, 1,
-0.8100137, -1.535634, -0.6904501, 1, 0, 0, 1, 1,
-0.8095918, -1.110292, -1.808819, 0, 0, 0, 1, 1,
-0.8087875, -0.09474772, -2.236124, 0, 0, 0, 1, 1,
-0.8053604, 0.680207, -0.7774721, 0, 0, 0, 1, 1,
-0.799178, 0.5827346, -0.9766887, 0, 0, 0, 1, 1,
-0.7948713, -0.4428192, -0.4227474, 0, 0, 0, 1, 1,
-0.789848, -1.592332, -1.772666, 0, 0, 0, 1, 1,
-0.786311, 0.4411553, -1.407418, 0, 0, 0, 1, 1,
-0.7860162, 0.6035944, -0.6897113, 1, 1, 1, 1, 1,
-0.7831846, 0.6880418, -1.863514, 1, 1, 1, 1, 1,
-0.7796127, 0.02867642, -3.15794, 1, 1, 1, 1, 1,
-0.7791488, 1.210665, -1.526604, 1, 1, 1, 1, 1,
-0.7771605, -0.3909141, -1.99928, 1, 1, 1, 1, 1,
-0.7748237, -1.000847, -2.23868, 1, 1, 1, 1, 1,
-0.7705333, -0.3901894, -0.4977033, 1, 1, 1, 1, 1,
-0.7653537, -0.1357488, -2.714705, 1, 1, 1, 1, 1,
-0.7592196, -0.5927129, -4.550194, 1, 1, 1, 1, 1,
-0.7588097, -0.3365811, -2.503509, 1, 1, 1, 1, 1,
-0.7579141, -1.124234, -1.471687, 1, 1, 1, 1, 1,
-0.7575592, 2.54019, 0.182702, 1, 1, 1, 1, 1,
-0.7573014, 1.155682, -1.344533, 1, 1, 1, 1, 1,
-0.748504, -1.067641, -4.424007, 1, 1, 1, 1, 1,
-0.7420477, 0.2973144, -1.563647, 1, 1, 1, 1, 1,
-0.737334, -0.6003361, -2.048986, 0, 0, 1, 1, 1,
-0.7334271, -0.3732156, -2.953304, 1, 0, 0, 1, 1,
-0.7256922, 0.5331889, -2.249713, 1, 0, 0, 1, 1,
-0.7214569, -1.864689, -3.753482, 1, 0, 0, 1, 1,
-0.7195392, -1.333426, -3.099897, 1, 0, 0, 1, 1,
-0.7178758, 1.253706, -1.891456, 1, 0, 0, 1, 1,
-0.7137902, 0.7866627, -1.177296, 0, 0, 0, 1, 1,
-0.7124911, -1.63477, -3.392662, 0, 0, 0, 1, 1,
-0.7093635, -1.9431, -4.065793, 0, 0, 0, 1, 1,
-0.7086447, -0.928533, -3.595013, 0, 0, 0, 1, 1,
-0.7062671, -1.31586, -3.057254, 0, 0, 0, 1, 1,
-0.7052841, -0.4931894, -1.77441, 0, 0, 0, 1, 1,
-0.6980481, 0.3168128, 0.2771233, 0, 0, 0, 1, 1,
-0.6881576, 0.6269809, -1.957781, 1, 1, 1, 1, 1,
-0.6848358, 0.5704823, -1.537469, 1, 1, 1, 1, 1,
-0.6845602, 0.8953114, -0.7553331, 1, 1, 1, 1, 1,
-0.683635, 0.2196526, -1.376437, 1, 1, 1, 1, 1,
-0.6820958, 0.1934473, -0.5964983, 1, 1, 1, 1, 1,
-0.6815296, -1.562031, -2.023418, 1, 1, 1, 1, 1,
-0.6778807, 0.5104122, 0.2220614, 1, 1, 1, 1, 1,
-0.6714405, 1.555257, -0.3920671, 1, 1, 1, 1, 1,
-0.6702731, -2.316024, -3.521929, 1, 1, 1, 1, 1,
-0.6641006, 0.05855273, 0.3225729, 1, 1, 1, 1, 1,
-0.6604619, -1.238911, -1.666135, 1, 1, 1, 1, 1,
-0.6571078, -1.080891, -2.471368, 1, 1, 1, 1, 1,
-0.6537994, 1.56704, -1.720393, 1, 1, 1, 1, 1,
-0.653528, -0.6267784, -2.768037, 1, 1, 1, 1, 1,
-0.6455492, 0.5880203, -0.4431279, 1, 1, 1, 1, 1,
-0.6455254, -1.425503, -1.821711, 0, 0, 1, 1, 1,
-0.6435137, -1.847657, -2.958542, 1, 0, 0, 1, 1,
-0.6381192, 0.2284062, -1.505167, 1, 0, 0, 1, 1,
-0.6364157, -0.9885164, -3.930602, 1, 0, 0, 1, 1,
-0.6354768, -0.5530784, -1.048343, 1, 0, 0, 1, 1,
-0.6340407, -0.9501035, -2.168427, 1, 0, 0, 1, 1,
-0.6312562, -0.6848779, -3.606255, 0, 0, 0, 1, 1,
-0.6305392, -0.005082465, -0.5009952, 0, 0, 0, 1, 1,
-0.6304818, 0.4847477, -0.138914, 0, 0, 0, 1, 1,
-0.6276137, 0.08636702, -2.825218, 0, 0, 0, 1, 1,
-0.626065, 0.9153541, -0.1806626, 0, 0, 0, 1, 1,
-0.6244219, 2.401423, -0.09174526, 0, 0, 0, 1, 1,
-0.617815, -0.2239986, -0.3205813, 0, 0, 0, 1, 1,
-0.6171581, 1.105185, 0.5631639, 1, 1, 1, 1, 1,
-0.6157641, 0.7382526, 0.2351165, 1, 1, 1, 1, 1,
-0.6107814, 1.48968, 0.09678213, 1, 1, 1, 1, 1,
-0.608487, -0.4844663, -1.615277, 1, 1, 1, 1, 1,
-0.6076549, -1.159189, -5.389479, 1, 1, 1, 1, 1,
-0.6051084, -1.685852, -1.867203, 1, 1, 1, 1, 1,
-0.603781, -1.866568, -2.068918, 1, 1, 1, 1, 1,
-0.6004587, -0.00315835, -1.09542, 1, 1, 1, 1, 1,
-0.5920919, 0.3847426, -2.799902, 1, 1, 1, 1, 1,
-0.5879696, -1.285566, -2.011299, 1, 1, 1, 1, 1,
-0.5876754, -1.25517, -3.478422, 1, 1, 1, 1, 1,
-0.5860903, 1.350648, 0.231569, 1, 1, 1, 1, 1,
-0.580689, 0.2257341, 0.3754108, 1, 1, 1, 1, 1,
-0.5792003, -0.7289706, -0.8748836, 1, 1, 1, 1, 1,
-0.5739083, 0.4697409, -1.83263, 1, 1, 1, 1, 1,
-0.5722809, -0.151189, -2.727314, 0, 0, 1, 1, 1,
-0.5697998, 2.336269, -0.3366022, 1, 0, 0, 1, 1,
-0.56839, -1.155618, -1.55001, 1, 0, 0, 1, 1,
-0.5661225, -0.01848652, -1.857983, 1, 0, 0, 1, 1,
-0.5657468, -0.2927516, -0.7424192, 1, 0, 0, 1, 1,
-0.5647243, 0.2414675, -0.8501719, 1, 0, 0, 1, 1,
-0.5627249, 0.3173752, -1.005667, 0, 0, 0, 1, 1,
-0.5615909, 1.763636, -0.5599848, 0, 0, 0, 1, 1,
-0.5585752, 0.5695642, -0.3407865, 0, 0, 0, 1, 1,
-0.5578122, -0.07913169, -2.165118, 0, 0, 0, 1, 1,
-0.5567636, 0.4904457, -3.001863, 0, 0, 0, 1, 1,
-0.5562247, 0.4211523, -1.957811, 0, 0, 0, 1, 1,
-0.5505403, 0.6469414, 0.1083883, 0, 0, 0, 1, 1,
-0.5496809, -1.096708, -3.337377, 1, 1, 1, 1, 1,
-0.5456473, 0.4558297, 0.1472874, 1, 1, 1, 1, 1,
-0.5449362, 1.721577, -1.536474, 1, 1, 1, 1, 1,
-0.5386649, 1.575472, 0.2292285, 1, 1, 1, 1, 1,
-0.5300472, -0.7249609, -3.128489, 1, 1, 1, 1, 1,
-0.5268647, -1.025974, -2.894932, 1, 1, 1, 1, 1,
-0.5261032, -0.8333021, -1.912012, 1, 1, 1, 1, 1,
-0.523854, 0.03329919, -2.787708, 1, 1, 1, 1, 1,
-0.5232995, -0.02676903, -2.388721, 1, 1, 1, 1, 1,
-0.5179421, -0.1460133, -2.582374, 1, 1, 1, 1, 1,
-0.5173889, 0.8409823, 1.781993, 1, 1, 1, 1, 1,
-0.5122722, 0.9790753, -0.3371291, 1, 1, 1, 1, 1,
-0.511772, -0.151728, -0.8062494, 1, 1, 1, 1, 1,
-0.5064225, -0.03968633, -3.277018, 1, 1, 1, 1, 1,
-0.503107, -0.5237545, -2.017186, 1, 1, 1, 1, 1,
-0.5019233, -1.00808, -3.477686, 0, 0, 1, 1, 1,
-0.4994791, -1.434893, -3.023757, 1, 0, 0, 1, 1,
-0.4872971, -1.264199, -0.7473809, 1, 0, 0, 1, 1,
-0.4871784, -0.0530298, -1.689583, 1, 0, 0, 1, 1,
-0.4805565, -1.689211, -3.226455, 1, 0, 0, 1, 1,
-0.4805031, -0.7354382, -2.593367, 1, 0, 0, 1, 1,
-0.4793855, 0.7919108, 0.4259945, 0, 0, 0, 1, 1,
-0.474695, 0.4524653, -1.402666, 0, 0, 0, 1, 1,
-0.4739945, -0.5254322, -3.408339, 0, 0, 0, 1, 1,
-0.4709777, -1.106098, -2.17746, 0, 0, 0, 1, 1,
-0.4689621, 1.044718, -1.326683, 0, 0, 0, 1, 1,
-0.4598488, -2.417141, -2.478527, 0, 0, 0, 1, 1,
-0.4522809, -0.1364106, -1.796659, 0, 0, 0, 1, 1,
-0.4502077, -0.9109439, -3.90054, 1, 1, 1, 1, 1,
-0.4470364, -0.7858932, -3.198642, 1, 1, 1, 1, 1,
-0.447031, -0.8029744, -1.775759, 1, 1, 1, 1, 1,
-0.4465598, -0.3863621, -0.6316444, 1, 1, 1, 1, 1,
-0.4462748, 1.138179, -0.7855043, 1, 1, 1, 1, 1,
-0.4450121, 0.6162233, 0.6926617, 1, 1, 1, 1, 1,
-0.4421049, 0.02613863, -2.346714, 1, 1, 1, 1, 1,
-0.4388818, -0.6245947, -3.231394, 1, 1, 1, 1, 1,
-0.4387923, 0.5601624, -1.207043, 1, 1, 1, 1, 1,
-0.4359387, -0.9155293, -1.284075, 1, 1, 1, 1, 1,
-0.4327602, -0.8102622, -3.972347, 1, 1, 1, 1, 1,
-0.4303816, 0.4213934, -2.108176, 1, 1, 1, 1, 1,
-0.4286066, 1.276385, 0.7434862, 1, 1, 1, 1, 1,
-0.4180216, -0.06908461, -2.054969, 1, 1, 1, 1, 1,
-0.4179172, 0.6903825, 0.9628397, 1, 1, 1, 1, 1,
-0.4127264, -0.6927516, -2.744342, 0, 0, 1, 1, 1,
-0.4116713, 0.8322697, -2.87699, 1, 0, 0, 1, 1,
-0.4100994, -0.2677746, -1.375466, 1, 0, 0, 1, 1,
-0.4098939, 0.7531872, -0.04090388, 1, 0, 0, 1, 1,
-0.4082915, -1.076778, -4.017408, 1, 0, 0, 1, 1,
-0.4076623, -1.067487, -3.403995, 1, 0, 0, 1, 1,
-0.4074661, 0.1121327, -0.3400278, 0, 0, 0, 1, 1,
-0.4070489, 1.297271, 1.217912, 0, 0, 0, 1, 1,
-0.4046418, -0.5607277, -1.327589, 0, 0, 0, 1, 1,
-0.3946654, -2.560818, -2.767411, 0, 0, 0, 1, 1,
-0.3898959, 1.91929, 0.07175996, 0, 0, 0, 1, 1,
-0.3888715, -0.4488139, -3.431141, 0, 0, 0, 1, 1,
-0.3881841, -0.1510416, -1.464588, 0, 0, 0, 1, 1,
-0.3873611, -0.9429482, -4.288694, 1, 1, 1, 1, 1,
-0.3852008, 0.1205126, -2.742403, 1, 1, 1, 1, 1,
-0.3739728, 0.5570654, -0.3868791, 1, 1, 1, 1, 1,
-0.3711449, -1.47378, -3.482323, 1, 1, 1, 1, 1,
-0.3688821, 0.9621724, -2.268256, 1, 1, 1, 1, 1,
-0.3576313, -1.1172, -2.051133, 1, 1, 1, 1, 1,
-0.3560238, -1.344439, -1.666939, 1, 1, 1, 1, 1,
-0.3458693, 1.314831, -0.2521029, 1, 1, 1, 1, 1,
-0.342459, -1.596666, -2.930863, 1, 1, 1, 1, 1,
-0.3401993, -1.339571, -5.199818, 1, 1, 1, 1, 1,
-0.338738, -0.5955245, -2.3526, 1, 1, 1, 1, 1,
-0.3333434, 0.5008881, 0.04888842, 1, 1, 1, 1, 1,
-0.3299571, -0.9364727, -2.355454, 1, 1, 1, 1, 1,
-0.329265, 1.505595, -0.8346732, 1, 1, 1, 1, 1,
-0.3232864, -0.9161505, -2.639638, 1, 1, 1, 1, 1,
-0.3215114, 0.6029184, -1.041849, 0, 0, 1, 1, 1,
-0.3199694, -1.916417, -2.736179, 1, 0, 0, 1, 1,
-0.3187866, 0.5672788, -1.703283, 1, 0, 0, 1, 1,
-0.3152227, -0.4182227, -2.505103, 1, 0, 0, 1, 1,
-0.3144491, 1.274695, -0.5536639, 1, 0, 0, 1, 1,
-0.3129934, -0.7591412, -2.21752, 1, 0, 0, 1, 1,
-0.2974117, 0.0002157731, -2.681727, 0, 0, 0, 1, 1,
-0.2952603, 1.419923, 1.125106, 0, 0, 0, 1, 1,
-0.2891592, 0.6566198, 0.1426065, 0, 0, 0, 1, 1,
-0.2890287, -0.03528515, -1.842419, 0, 0, 0, 1, 1,
-0.2887667, 0.2618571, 0.9425106, 0, 0, 0, 1, 1,
-0.2816379, 0.8157679, -2.729823, 0, 0, 0, 1, 1,
-0.2787966, -0.4024088, -3.048691, 0, 0, 0, 1, 1,
-0.2787395, -0.2564516, -3.644544, 1, 1, 1, 1, 1,
-0.277274, -0.5848045, -3.29819, 1, 1, 1, 1, 1,
-0.2765421, -0.6995915, -3.701752, 1, 1, 1, 1, 1,
-0.2758176, 1.00288, -0.1663852, 1, 1, 1, 1, 1,
-0.2726333, 0.7056131, -0.5245367, 1, 1, 1, 1, 1,
-0.268519, 0.3982621, -1.496227, 1, 1, 1, 1, 1,
-0.2630755, -0.3301111, -4.39885, 1, 1, 1, 1, 1,
-0.2584498, 0.9844592, -2.466765, 1, 1, 1, 1, 1,
-0.2507093, -0.8252569, -2.156469, 1, 1, 1, 1, 1,
-0.2416833, -1.78177, -2.705723, 1, 1, 1, 1, 1,
-0.2399624, 0.200857, -2.282318, 1, 1, 1, 1, 1,
-0.2373614, 0.6903216, -0.2717618, 1, 1, 1, 1, 1,
-0.2358886, 0.9007946, 0.3900128, 1, 1, 1, 1, 1,
-0.2343096, 1.466382, -1.693827, 1, 1, 1, 1, 1,
-0.2342616, 1.232589, -0.2088425, 1, 1, 1, 1, 1,
-0.2249303, -0.7664648, -2.82867, 0, 0, 1, 1, 1,
-0.2241833, -0.4513225, -2.264368, 1, 0, 0, 1, 1,
-0.223464, -0.8860666, -3.863047, 1, 0, 0, 1, 1,
-0.2186491, 1.794754, -0.6139807, 1, 0, 0, 1, 1,
-0.2129716, 1.760047, -1.93399, 1, 0, 0, 1, 1,
-0.2126049, 1.58442, 1.206362, 1, 0, 0, 1, 1,
-0.2076034, -0.865374, -3.02868, 0, 0, 0, 1, 1,
-0.2075412, -0.4376267, -2.972519, 0, 0, 0, 1, 1,
-0.2065668, -0.4780229, -3.640185, 0, 0, 0, 1, 1,
-0.2022858, -0.7824889, -1.631486, 0, 0, 0, 1, 1,
-0.2008126, -0.2124682, -3.777445, 0, 0, 0, 1, 1,
-0.1978465, -0.3634766, -3.171414, 0, 0, 0, 1, 1,
-0.1970416, 0.406216, -1.33276, 0, 0, 0, 1, 1,
-0.1951586, -0.1809527, -2.83559, 1, 1, 1, 1, 1,
-0.177862, 0.3562863, -0.6620167, 1, 1, 1, 1, 1,
-0.177159, 0.8128428, -0.1842699, 1, 1, 1, 1, 1,
-0.1761164, -0.08491155, -3.227924, 1, 1, 1, 1, 1,
-0.1745709, -1.189263, -1.939221, 1, 1, 1, 1, 1,
-0.1727859, 0.8185773, 0.2815516, 1, 1, 1, 1, 1,
-0.1713514, 0.6963676, -0.6336752, 1, 1, 1, 1, 1,
-0.1709365, -1.269472, -2.715374, 1, 1, 1, 1, 1,
-0.1651089, -1.133409, -3.710506, 1, 1, 1, 1, 1,
-0.1625517, 0.3446807, -0.249616, 1, 1, 1, 1, 1,
-0.1513855, 0.8640709, 1.705484, 1, 1, 1, 1, 1,
-0.1470524, -1.769671, -3.35408, 1, 1, 1, 1, 1,
-0.1409307, 1.302553, -1.171602, 1, 1, 1, 1, 1,
-0.1391023, -0.3507365, -4.208807, 1, 1, 1, 1, 1,
-0.12929, -2.697456, -1.152602, 1, 1, 1, 1, 1,
-0.1292424, 1.371243, 0.8507578, 0, 0, 1, 1, 1,
-0.1282966, 0.67209, -0.06119664, 1, 0, 0, 1, 1,
-0.1280415, 0.9890718, -0.2855272, 1, 0, 0, 1, 1,
-0.125547, 0.6855602, -1.37572, 1, 0, 0, 1, 1,
-0.1232553, -2.554364, -3.156084, 1, 0, 0, 1, 1,
-0.1210572, 0.2178228, -1.001824, 1, 0, 0, 1, 1,
-0.1153777, 1.85331, 0.1217499, 0, 0, 0, 1, 1,
-0.1141013, 0.1795453, 1.067932, 0, 0, 0, 1, 1,
-0.1108772, 0.09318084, -0.1353563, 0, 0, 0, 1, 1,
-0.110205, 1.556432, 0.4804282, 0, 0, 0, 1, 1,
-0.106955, -0.4120838, -1.256304, 0, 0, 0, 1, 1,
-0.1041197, -0.2507522, -2.755293, 0, 0, 0, 1, 1,
-0.1008172, -1.063369, -3.896729, 0, 0, 0, 1, 1,
-0.09985112, 0.6867585, -0.8007834, 1, 1, 1, 1, 1,
-0.09840735, 0.6798537, 2.372602, 1, 1, 1, 1, 1,
-0.09727782, 0.591375, -0.09850492, 1, 1, 1, 1, 1,
-0.09676083, -1.468226, -3.477672, 1, 1, 1, 1, 1,
-0.09305935, -0.2311706, -2.725765, 1, 1, 1, 1, 1,
-0.09222616, 1.071736, -0.6243469, 1, 1, 1, 1, 1,
-0.09121665, 0.7527786, 0.5266039, 1, 1, 1, 1, 1,
-0.0909282, -0.4779269, -3.402118, 1, 1, 1, 1, 1,
-0.07810776, -0.5311398, -2.603828, 1, 1, 1, 1, 1,
-0.07698226, -2.099021, -4.049131, 1, 1, 1, 1, 1,
-0.06963746, -0.7524146, -4.357437, 1, 1, 1, 1, 1,
-0.0664934, -0.5193243, -4.417093, 1, 1, 1, 1, 1,
-0.06584711, 0.7674967, -1.038097, 1, 1, 1, 1, 1,
-0.06353188, -0.2571008, -1.748675, 1, 1, 1, 1, 1,
-0.06160935, -0.3733051, -3.151706, 1, 1, 1, 1, 1,
-0.05345392, -0.7133642, -3.613994, 0, 0, 1, 1, 1,
-0.05179339, -0.1134802, -1.842481, 1, 0, 0, 1, 1,
-0.05047185, -1.087019, -4.546631, 1, 0, 0, 1, 1,
-0.05001533, 1.077022, -0.2056282, 1, 0, 0, 1, 1,
-0.04745215, 0.02345772, -0.2530705, 1, 0, 0, 1, 1,
-0.04436819, -1.423878, -3.45888, 1, 0, 0, 1, 1,
-0.0433073, 0.6996808, 1.563653, 0, 0, 0, 1, 1,
-0.04201065, -0.1013526, -2.703321, 0, 0, 0, 1, 1,
-0.03714556, -1.268494, -3.305025, 0, 0, 0, 1, 1,
-0.03663206, 0.2397096, -0.2669283, 0, 0, 0, 1, 1,
-0.03436271, -0.5686671, -3.815101, 0, 0, 0, 1, 1,
-0.03217814, -0.4019907, -4.080309, 0, 0, 0, 1, 1,
-0.03200743, 0.6902923, 0.4087686, 0, 0, 0, 1, 1,
-0.03056371, 0.4447543, -0.5645592, 1, 1, 1, 1, 1,
-0.02797877, 0.8707618, -0.3150834, 1, 1, 1, 1, 1,
-0.02516437, 1.427975, -0.38037, 1, 1, 1, 1, 1,
-0.02320591, 1.323279, -0.1658575, 1, 1, 1, 1, 1,
-0.02132329, 0.2165675, -0.52925, 1, 1, 1, 1, 1,
-0.01408397, -1.926329, -0.00884756, 1, 1, 1, 1, 1,
-0.006168719, 0.1306761, -0.7459049, 1, 1, 1, 1, 1,
-0.003370815, 0.2845647, 0.06675536, 1, 1, 1, 1, 1,
-0.0005405363, -1.026727, -1.898097, 1, 1, 1, 1, 1,
0.00297945, -0.2261275, 2.273488, 1, 1, 1, 1, 1,
0.009369071, -2.227856, 2.449808, 1, 1, 1, 1, 1,
0.01707713, -1.190785, 2.429739, 1, 1, 1, 1, 1,
0.01810596, 1.254959, 0.2277045, 1, 1, 1, 1, 1,
0.0210268, 1.082609, 1.046274, 1, 1, 1, 1, 1,
0.02220107, 0.09186279, 1.232176, 1, 1, 1, 1, 1,
0.02301051, -0.09499881, 2.218719, 0, 0, 1, 1, 1,
0.02901535, 1.87827, -1.308279, 1, 0, 0, 1, 1,
0.03046499, 1.262135, 1.86654, 1, 0, 0, 1, 1,
0.03335053, 1.369713, 1.539559, 1, 0, 0, 1, 1,
0.03424243, -0.2974792, 4.156228, 1, 0, 0, 1, 1,
0.03502428, 1.360463, 0.04716375, 1, 0, 0, 1, 1,
0.04089075, 0.106601, 1.548673, 0, 0, 0, 1, 1,
0.04094249, -0.3727509, 1.745074, 0, 0, 0, 1, 1,
0.04303155, -0.05954317, 3.814491, 0, 0, 0, 1, 1,
0.04705636, -1.043322, 2.955712, 0, 0, 0, 1, 1,
0.04895862, -0.09869748, 4.83017, 0, 0, 0, 1, 1,
0.05049068, -0.7785724, 3.915797, 0, 0, 0, 1, 1,
0.05343293, -0.4528101, 3.166415, 0, 0, 0, 1, 1,
0.06265752, 0.323831, 0.5775724, 1, 1, 1, 1, 1,
0.06413245, 0.3064587, -0.2613018, 1, 1, 1, 1, 1,
0.06479818, -0.1719528, 2.990061, 1, 1, 1, 1, 1,
0.06491438, 1.191185, -1.305499, 1, 1, 1, 1, 1,
0.06543515, -1.750425, 3.798806, 1, 1, 1, 1, 1,
0.06719372, 0.3441678, 0.1525941, 1, 1, 1, 1, 1,
0.06747547, -0.1445983, 1.102519, 1, 1, 1, 1, 1,
0.06821901, -0.4112226, 3.695642, 1, 1, 1, 1, 1,
0.0684949, 0.5657583, -1.821763, 1, 1, 1, 1, 1,
0.06978063, -0.2668855, 5.431149, 1, 1, 1, 1, 1,
0.07077515, -0.5879989, 1.632397, 1, 1, 1, 1, 1,
0.07310952, 0.3401658, -0.8859913, 1, 1, 1, 1, 1,
0.07628035, -1.957555, 4.937975, 1, 1, 1, 1, 1,
0.07689238, 0.8578393, 0.5390249, 1, 1, 1, 1, 1,
0.07872236, -0.9857131, 3.185291, 1, 1, 1, 1, 1,
0.07926365, 1.089455, -0.2481701, 0, 0, 1, 1, 1,
0.08022643, -0.1394243, 3.177292, 1, 0, 0, 1, 1,
0.08302369, -1.590469, 3.91949, 1, 0, 0, 1, 1,
0.08738597, -0.9297969, 1.562234, 1, 0, 0, 1, 1,
0.08815043, -0.2547809, 2.052878, 1, 0, 0, 1, 1,
0.08864541, -0.3930428, 2.736993, 1, 0, 0, 1, 1,
0.0939412, -0.09668218, 2.716115, 0, 0, 0, 1, 1,
0.09636713, -0.996995, 3.207084, 0, 0, 0, 1, 1,
0.09636984, -0.06230819, 3.057222, 0, 0, 0, 1, 1,
0.09897253, 0.179336, -0.7156965, 0, 0, 0, 1, 1,
0.1017067, 0.6709622, 0.5087479, 0, 0, 0, 1, 1,
0.1226718, -1.004352, 3.196713, 0, 0, 0, 1, 1,
0.123682, -0.645475, 2.282483, 0, 0, 0, 1, 1,
0.1270353, -0.3625666, 3.1545, 1, 1, 1, 1, 1,
0.1284558, -2.217391, 2.470624, 1, 1, 1, 1, 1,
0.1309474, -0.3238056, 2.286259, 1, 1, 1, 1, 1,
0.1312462, -1.101528, 4.71216, 1, 1, 1, 1, 1,
0.1375417, -0.03300105, 2.805364, 1, 1, 1, 1, 1,
0.1392604, -0.3711897, -0.2707713, 1, 1, 1, 1, 1,
0.1411082, -1.161204, 3.594424, 1, 1, 1, 1, 1,
0.1417368, -0.2854837, 3.500584, 1, 1, 1, 1, 1,
0.1432495, -0.6850882, 4.016014, 1, 1, 1, 1, 1,
0.1464578, 0.1328697, 1.147476, 1, 1, 1, 1, 1,
0.1556473, -0.2774241, 2.451681, 1, 1, 1, 1, 1,
0.1666945, 0.4778678, 2.859003, 1, 1, 1, 1, 1,
0.1668322, 1.116486, -0.9254047, 1, 1, 1, 1, 1,
0.1763193, -1.58772, 2.675963, 1, 1, 1, 1, 1,
0.177247, 0.7627965, -2.305721, 1, 1, 1, 1, 1,
0.1797895, 0.9770066, 0.5999424, 0, 0, 1, 1, 1,
0.180377, 0.9316269, -1.081537, 1, 0, 0, 1, 1,
0.1812664, 0.05701285, 1.867159, 1, 0, 0, 1, 1,
0.1862044, -0.9490734, 3.509201, 1, 0, 0, 1, 1,
0.1864859, 0.2833948, 1.338799, 1, 0, 0, 1, 1,
0.1878063, 1.893129, 0.1271009, 1, 0, 0, 1, 1,
0.2083888, -0.9759383, 2.450052, 0, 0, 0, 1, 1,
0.2092691, -0.1434832, 1.96513, 0, 0, 0, 1, 1,
0.212319, 1.847484, -0.1188158, 0, 0, 0, 1, 1,
0.2152071, 0.5540727, 1.857747, 0, 0, 0, 1, 1,
0.2167742, -0.9406924, 4.107056, 0, 0, 0, 1, 1,
0.2193124, 1.045353, 0.9728978, 0, 0, 0, 1, 1,
0.2216135, 1.377304, 2.067459, 0, 0, 0, 1, 1,
0.2216259, 0.3300919, 0.07555071, 1, 1, 1, 1, 1,
0.2322046, -0.7282824, 4.102096, 1, 1, 1, 1, 1,
0.2359471, 0.1642527, 0.8884798, 1, 1, 1, 1, 1,
0.237151, 0.05892542, 0.8870277, 1, 1, 1, 1, 1,
0.2377772, -0.04388855, 1.723988, 1, 1, 1, 1, 1,
0.2389219, -0.5251547, 2.849924, 1, 1, 1, 1, 1,
0.2395183, 0.3087168, 0.8773479, 1, 1, 1, 1, 1,
0.2395184, 0.3666693, 0.7063388, 1, 1, 1, 1, 1,
0.2419865, -0.4912391, 3.287377, 1, 1, 1, 1, 1,
0.2420073, 2.321813, 0.246697, 1, 1, 1, 1, 1,
0.2521489, 0.8019103, 0.5933145, 1, 1, 1, 1, 1,
0.2535209, 0.004890191, 1.997142, 1, 1, 1, 1, 1,
0.2536725, 0.1408845, -0.8412499, 1, 1, 1, 1, 1,
0.2546397, -0.675804, 2.714823, 1, 1, 1, 1, 1,
0.2556736, -0.4722137, 3.207914, 1, 1, 1, 1, 1,
0.2565576, -0.7143368, 2.372995, 0, 0, 1, 1, 1,
0.2571949, -0.06904367, 2.12559, 1, 0, 0, 1, 1,
0.2585815, 0.1040502, 1.337854, 1, 0, 0, 1, 1,
0.2596265, -0.3819307, 3.408015, 1, 0, 0, 1, 1,
0.2628178, -0.9271703, 3.562592, 1, 0, 0, 1, 1,
0.264514, 0.8954459, 1.76234, 1, 0, 0, 1, 1,
0.2659167, 0.7566485, 1.286769, 0, 0, 0, 1, 1,
0.2670118, -2.024199, 1.841672, 0, 0, 0, 1, 1,
0.2717397, 0.3187028, 2.635554, 0, 0, 0, 1, 1,
0.2717607, -0.1689596, 2.700792, 0, 0, 0, 1, 1,
0.2733645, -0.9403032, 3.088559, 0, 0, 0, 1, 1,
0.2747749, -0.222396, 2.544512, 0, 0, 0, 1, 1,
0.2754928, 0.9470173, 1.688375, 0, 0, 0, 1, 1,
0.2807437, 0.8325952, -1.300411, 1, 1, 1, 1, 1,
0.2844695, 1.286198, 0.3137482, 1, 1, 1, 1, 1,
0.2879821, 0.5123228, 1.128498, 1, 1, 1, 1, 1,
0.2887733, 0.8408875, 0.7207926, 1, 1, 1, 1, 1,
0.2899967, -0.009605968, 0.9258569, 1, 1, 1, 1, 1,
0.2914759, 0.5469391, -0.7792691, 1, 1, 1, 1, 1,
0.2922134, 1.526022, -1.540598, 1, 1, 1, 1, 1,
0.2946206, 0.06302498, 1.232267, 1, 1, 1, 1, 1,
0.2959739, 2.021527, 0.8277543, 1, 1, 1, 1, 1,
0.3011415, 0.5417724, 0.3040752, 1, 1, 1, 1, 1,
0.3087244, 0.4061521, -0.9858519, 1, 1, 1, 1, 1,
0.3132366, -0.9383463, 0.9952838, 1, 1, 1, 1, 1,
0.3178102, 0.08573481, 2.85469, 1, 1, 1, 1, 1,
0.3190474, 0.7070194, -0.2059273, 1, 1, 1, 1, 1,
0.3198934, 0.2855151, 0.01803144, 1, 1, 1, 1, 1,
0.320312, -0.4996242, 4.054881, 0, 0, 1, 1, 1,
0.3222405, -0.3147873, 3.67581, 1, 0, 0, 1, 1,
0.3225738, 1.773443, -0.4970542, 1, 0, 0, 1, 1,
0.3296222, 0.2925645, 1.017851, 1, 0, 0, 1, 1,
0.3299889, 0.008706692, -0.0266221, 1, 0, 0, 1, 1,
0.3330963, -0.5196524, 3.313161, 1, 0, 0, 1, 1,
0.3483872, 0.102483, 2.746981, 0, 0, 0, 1, 1,
0.351417, 2.148625, -0.5685598, 0, 0, 0, 1, 1,
0.3530624, -0.01762404, 2.636553, 0, 0, 0, 1, 1,
0.353841, -1.029399, 2.93474, 0, 0, 0, 1, 1,
0.3588456, -0.1983319, 2.551348, 0, 0, 0, 1, 1,
0.3598233, -1.054949, 3.521303, 0, 0, 0, 1, 1,
0.3612759, 1.13092, 1.00836, 0, 0, 0, 1, 1,
0.3628394, -0.85143, 2.881815, 1, 1, 1, 1, 1,
0.3640853, 0.701578, -0.04952896, 1, 1, 1, 1, 1,
0.3662672, -0.07761915, 1.109048, 1, 1, 1, 1, 1,
0.3683129, -0.05127007, 2.881045, 1, 1, 1, 1, 1,
0.3686867, -0.2720315, 2.179916, 1, 1, 1, 1, 1,
0.3708254, 0.7216755, 0.9080968, 1, 1, 1, 1, 1,
0.3742379, 0.7407019, 1.424708, 1, 1, 1, 1, 1,
0.3790797, -0.1452798, 3.022288, 1, 1, 1, 1, 1,
0.3796366, 0.1370566, -0.252742, 1, 1, 1, 1, 1,
0.3798742, 0.2857185, 0.3627942, 1, 1, 1, 1, 1,
0.3860027, -0.6496743, 2.034916, 1, 1, 1, 1, 1,
0.3885473, -0.08624011, 1.595751, 1, 1, 1, 1, 1,
0.391553, 0.6975204, 1.306727, 1, 1, 1, 1, 1,
0.3919683, 1.407706, -1.680846, 1, 1, 1, 1, 1,
0.4012021, 0.02317371, 2.043647, 1, 1, 1, 1, 1,
0.4013168, 1.783715, 0.07712965, 0, 0, 1, 1, 1,
0.4018219, 0.07030841, 1.691422, 1, 0, 0, 1, 1,
0.406401, -0.1615571, 1.130311, 1, 0, 0, 1, 1,
0.4102862, -1.342135, 1.431736, 1, 0, 0, 1, 1,
0.4113321, -0.208297, 2.058821, 1, 0, 0, 1, 1,
0.4144899, 0.08551832, -0.8490298, 1, 0, 0, 1, 1,
0.4148436, -0.9385333, 1.702481, 0, 0, 0, 1, 1,
0.4164061, -1.251305, 2.683409, 0, 0, 0, 1, 1,
0.4200582, -0.8949713, 2.048621, 0, 0, 0, 1, 1,
0.4210833, -1.210403, 3.031002, 0, 0, 0, 1, 1,
0.4211362, -0.8357665, 3.767227, 0, 0, 0, 1, 1,
0.4235676, -0.08572142, 2.0366, 0, 0, 0, 1, 1,
0.424166, 1.768281, -0.9825629, 0, 0, 0, 1, 1,
0.42535, 0.8399125, 1.482864, 1, 1, 1, 1, 1,
0.4272544, -0.6090026, 3.099354, 1, 1, 1, 1, 1,
0.4278454, 0.611376, 0.2420107, 1, 1, 1, 1, 1,
0.4285956, -0.8317645, 1.548962, 1, 1, 1, 1, 1,
0.433552, 1.479653, -1.119347, 1, 1, 1, 1, 1,
0.4375098, 0.009129438, 1.181969, 1, 1, 1, 1, 1,
0.4400504, 1.429736, -1.125997, 1, 1, 1, 1, 1,
0.4410355, -0.1928785, 2.957617, 1, 1, 1, 1, 1,
0.4426709, -0.559464, 1.661281, 1, 1, 1, 1, 1,
0.4488049, -1.186363, 2.691511, 1, 1, 1, 1, 1,
0.4506828, 1.514675, -0.9453426, 1, 1, 1, 1, 1,
0.4515696, -0.3246221, 0.8670818, 1, 1, 1, 1, 1,
0.4525122, 0.6620654, 0.9727312, 1, 1, 1, 1, 1,
0.4527903, -0.2205153, 2.504955, 1, 1, 1, 1, 1,
0.4529286, -2.374516, 2.647028, 1, 1, 1, 1, 1,
0.4571371, 0.9115248, 0.6513332, 0, 0, 1, 1, 1,
0.4633317, -2.453222, 3.048257, 1, 0, 0, 1, 1,
0.4654837, -0.2061456, 2.4333, 1, 0, 0, 1, 1,
0.4665117, -1.675186, 4.027685, 1, 0, 0, 1, 1,
0.4683971, -1.563455, 3.402195, 1, 0, 0, 1, 1,
0.471553, 0.8515722, -0.7560211, 1, 0, 0, 1, 1,
0.4729609, 2.842139, 2.046141, 0, 0, 0, 1, 1,
0.4808975, -0.5298409, 2.090068, 0, 0, 0, 1, 1,
0.4811722, -0.2477428, 0.07936898, 0, 0, 0, 1, 1,
0.4817357, -1.575086, 2.686254, 0, 0, 0, 1, 1,
0.4839571, 0.8362926, 0.4461935, 0, 0, 0, 1, 1,
0.4844961, 0.06657764, 2.119977, 0, 0, 0, 1, 1,
0.4849913, -0.3686519, 3.582614, 0, 0, 0, 1, 1,
0.4876832, -1.029105, 1.06475, 1, 1, 1, 1, 1,
0.4880078, 0.01650506, 2.600691, 1, 1, 1, 1, 1,
0.4943515, 0.873789, 0.1432118, 1, 1, 1, 1, 1,
0.4959428, -0.6267079, 2.476633, 1, 1, 1, 1, 1,
0.4970305, -0.122563, 1.813648, 1, 1, 1, 1, 1,
0.5031652, -1.777787, 2.712867, 1, 1, 1, 1, 1,
0.5105489, 0.4863494, 0.4350469, 1, 1, 1, 1, 1,
0.5114793, -0.188233, 1.456867, 1, 1, 1, 1, 1,
0.5119847, 0.326046, 0.7919415, 1, 1, 1, 1, 1,
0.512324, -0.2496813, 1.767745, 1, 1, 1, 1, 1,
0.5125391, -1.159361, 2.094732, 1, 1, 1, 1, 1,
0.513267, 1.786155, -0.4820961, 1, 1, 1, 1, 1,
0.5142419, -0.2128233, 3.014989, 1, 1, 1, 1, 1,
0.5181128, -0.1146432, 0.3670063, 1, 1, 1, 1, 1,
0.5184729, 1.735064, 1.036326, 1, 1, 1, 1, 1,
0.5184759, 0.01272881, 1.289186, 0, 0, 1, 1, 1,
0.5186453, 0.1505233, 2.945694, 1, 0, 0, 1, 1,
0.5212387, -0.5390309, 2.426306, 1, 0, 0, 1, 1,
0.5225649, -1.503152, 2.774274, 1, 0, 0, 1, 1,
0.5266484, -0.6718188, 5.71277, 1, 0, 0, 1, 1,
0.5273041, -0.1749394, 3.561287, 1, 0, 0, 1, 1,
0.5273098, -0.06704592, -0.9270623, 0, 0, 0, 1, 1,
0.5273319, 0.6459675, 1.886654, 0, 0, 0, 1, 1,
0.538924, -1.340211, 3.695485, 0, 0, 0, 1, 1,
0.5389552, -1.25921, 1.84166, 0, 0, 0, 1, 1,
0.5443455, -0.6915151, 2.076971, 0, 0, 0, 1, 1,
0.5443907, -1.521416, 2.146055, 0, 0, 0, 1, 1,
0.546201, -0.2458453, 1.512778, 0, 0, 0, 1, 1,
0.5488095, -0.6269541, 3.658557, 1, 1, 1, 1, 1,
0.5506977, -0.5872447, 0.7448588, 1, 1, 1, 1, 1,
0.5514423, 0.6701762, 0.1492047, 1, 1, 1, 1, 1,
0.5515926, 0.7432211, 1.225769, 1, 1, 1, 1, 1,
0.5526032, -0.2699782, 0.538187, 1, 1, 1, 1, 1,
0.557711, 0.9118117, 2.628243, 1, 1, 1, 1, 1,
0.5606385, -0.3420957, 1.940222, 1, 1, 1, 1, 1,
0.5610449, 0.3205934, 0.6599055, 1, 1, 1, 1, 1,
0.5668892, 0.1925093, 0.1126775, 1, 1, 1, 1, 1,
0.5693914, -1.670126, 3.2742, 1, 1, 1, 1, 1,
0.5697348, -0.05005173, 2.580554, 1, 1, 1, 1, 1,
0.5697883, -0.7570671, 2.522365, 1, 1, 1, 1, 1,
0.5699494, 0.03548339, 1.920981, 1, 1, 1, 1, 1,
0.5700457, -1.191073, 3.972835, 1, 1, 1, 1, 1,
0.5727999, -0.1521413, 0.01161157, 1, 1, 1, 1, 1,
0.5742291, 0.2233532, 1.047673, 0, 0, 1, 1, 1,
0.5759526, 1.928655, 2.71323, 1, 0, 0, 1, 1,
0.5773615, -0.5298958, 1.573095, 1, 0, 0, 1, 1,
0.5842087, 0.5547059, -0.1868003, 1, 0, 0, 1, 1,
0.5861092, -1.146869, 2.290576, 1, 0, 0, 1, 1,
0.5892667, 0.07336903, 0.4383157, 1, 0, 0, 1, 1,
0.5906698, -0.07842676, 1.376879, 0, 0, 0, 1, 1,
0.5911345, -0.481582, 1.464215, 0, 0, 0, 1, 1,
0.5947968, 1.73888, 0.8024265, 0, 0, 0, 1, 1,
0.6004551, -1.035677, 1.456061, 0, 0, 0, 1, 1,
0.6083178, -0.5985246, 2.293531, 0, 0, 0, 1, 1,
0.6137521, -0.7381676, 2.369944, 0, 0, 0, 1, 1,
0.6182531, -0.6729689, 3.277465, 0, 0, 0, 1, 1,
0.6206939, -0.0811941, 1.156269, 1, 1, 1, 1, 1,
0.6247652, -0.5646285, 1.843543, 1, 1, 1, 1, 1,
0.6281318, -0.1266643, 2.041101, 1, 1, 1, 1, 1,
0.6317592, -0.4694356, 3.0286, 1, 1, 1, 1, 1,
0.6356127, -0.07356255, 2.599242, 1, 1, 1, 1, 1,
0.6395993, 1.825202, 0.763023, 1, 1, 1, 1, 1,
0.6468522, -0.3837884, 3.1184, 1, 1, 1, 1, 1,
0.6474795, -0.3075025, 1.110908, 1, 1, 1, 1, 1,
0.6477041, -1.99386, 3.047532, 1, 1, 1, 1, 1,
0.6514939, -1.372178, 2.021301, 1, 1, 1, 1, 1,
0.6540942, 1.707605, 2.20677, 1, 1, 1, 1, 1,
0.6549516, -0.548209, 2.15191, 1, 1, 1, 1, 1,
0.6624207, 0.2450604, 1.657864, 1, 1, 1, 1, 1,
0.6643905, -0.5925061, 4.244605, 1, 1, 1, 1, 1,
0.6660156, 0.195094, -0.727523, 1, 1, 1, 1, 1,
0.670675, 0.1166966, 2.91089, 0, 0, 1, 1, 1,
0.6781021, -0.6463624, 2.685476, 1, 0, 0, 1, 1,
0.6809021, 1.480378, 1.272967, 1, 0, 0, 1, 1,
0.6815472, 0.2913076, 1.876825, 1, 0, 0, 1, 1,
0.6820158, -0.3345231, 1.08743, 1, 0, 0, 1, 1,
0.6823788, 0.233942, -0.8147194, 1, 0, 0, 1, 1,
0.6840315, 0.5746361, -0.7165951, 0, 0, 0, 1, 1,
0.6858634, -0.2415679, 0.9488716, 0, 0, 0, 1, 1,
0.7059553, -0.5209565, 3.50311, 0, 0, 0, 1, 1,
0.7066047, -0.7831518, 3.021112, 0, 0, 0, 1, 1,
0.7094653, 0.319093, -0.2899316, 0, 0, 0, 1, 1,
0.7103024, 0.1619317, 2.573071, 0, 0, 0, 1, 1,
0.7124556, 0.05777692, 0.3638827, 0, 0, 0, 1, 1,
0.7147143, -1.438073, 2.566568, 1, 1, 1, 1, 1,
0.7163858, -0.7824503, 3.173405, 1, 1, 1, 1, 1,
0.7180392, -1.150645, 3.562351, 1, 1, 1, 1, 1,
0.7180486, -0.3929904, 0.7689676, 1, 1, 1, 1, 1,
0.7199293, -0.6673527, 1.809908, 1, 1, 1, 1, 1,
0.7211351, 0.3884506, 1.421463, 1, 1, 1, 1, 1,
0.7228944, -0.01669987, 2.008855, 1, 1, 1, 1, 1,
0.7229721, 1.753229, 0.5079678, 1, 1, 1, 1, 1,
0.7241135, -0.533276, 2.565908, 1, 1, 1, 1, 1,
0.7248995, -0.7022209, 1.362711, 1, 1, 1, 1, 1,
0.7320902, -0.6830263, 2.893799, 1, 1, 1, 1, 1,
0.7339054, -0.6146907, 4.262175, 1, 1, 1, 1, 1,
0.7456947, 0.8143895, 2.07202, 1, 1, 1, 1, 1,
0.752356, 0.105764, 2.24932, 1, 1, 1, 1, 1,
0.7611548, 1.739729, 0.7364573, 1, 1, 1, 1, 1,
0.7620794, -0.219456, 1.418895, 0, 0, 1, 1, 1,
0.7623109, -0.03758067, 1.264661, 1, 0, 0, 1, 1,
0.7665065, -1.087456, 1.872362, 1, 0, 0, 1, 1,
0.7665691, 0.09476944, 1.520704, 1, 0, 0, 1, 1,
0.7678919, -1.066123, 3.267581, 1, 0, 0, 1, 1,
0.7691149, 2.256561, 0.8662535, 1, 0, 0, 1, 1,
0.7703951, 0.1728502, 2.523113, 0, 0, 0, 1, 1,
0.7719976, 0.01755662, 2.371638, 0, 0, 0, 1, 1,
0.7730707, -1.137972, 3.29518, 0, 0, 0, 1, 1,
0.7745156, 1.620684, -1.296101, 0, 0, 0, 1, 1,
0.7746267, 1.256388, -0.04980106, 0, 0, 0, 1, 1,
0.775687, -1.129613, 3.08679, 0, 0, 0, 1, 1,
0.7793899, -0.3224406, 3.000923, 0, 0, 0, 1, 1,
0.7798452, -0.8706723, 2.885697, 1, 1, 1, 1, 1,
0.7801812, 0.8663575, -0.9226475, 1, 1, 1, 1, 1,
0.783263, 1.473046, 1.579687, 1, 1, 1, 1, 1,
0.7841434, 1.659688, 0.4962872, 1, 1, 1, 1, 1,
0.7889252, -0.317471, 2.816062, 1, 1, 1, 1, 1,
0.7913048, -1.355066, 1.103685, 1, 1, 1, 1, 1,
0.7921067, -1.097532, 0.7034611, 1, 1, 1, 1, 1,
0.7924051, 0.01234938, 2.921326, 1, 1, 1, 1, 1,
0.7994801, -1.229259, 1.647417, 1, 1, 1, 1, 1,
0.8001438, 0.3303472, 0.6380687, 1, 1, 1, 1, 1,
0.8002805, -1.806496, 1.459655, 1, 1, 1, 1, 1,
0.8053639, -0.9205706, 4.696265, 1, 1, 1, 1, 1,
0.8082108, -0.3141176, 3.970068, 1, 1, 1, 1, 1,
0.8103746, -1.466484, 2.67276, 1, 1, 1, 1, 1,
0.8103792, -0.3050598, 1.534683, 1, 1, 1, 1, 1,
0.8221781, -0.08019826, -0.5123361, 0, 0, 1, 1, 1,
0.8236724, -0.3335252, 3.753725, 1, 0, 0, 1, 1,
0.8254244, 0.5758495, -0.6169369, 1, 0, 0, 1, 1,
0.8267719, 0.5424896, 1.348639, 1, 0, 0, 1, 1,
0.8293341, -1.004298, 1.915873, 1, 0, 0, 1, 1,
0.8347951, -0.4852539, 2.519714, 1, 0, 0, 1, 1,
0.8354003, -0.7267468, 3.555495, 0, 0, 0, 1, 1,
0.8406485, 0.5240718, 0.5164593, 0, 0, 0, 1, 1,
0.8411106, 0.3703758, -0.8999001, 0, 0, 0, 1, 1,
0.8428469, 2.325564, -0.1127881, 0, 0, 0, 1, 1,
0.8459126, 0.3231341, 0.4795361, 0, 0, 0, 1, 1,
0.8490353, 0.5979764, 0.6602857, 0, 0, 0, 1, 1,
0.8522196, 0.2971936, 3.002256, 0, 0, 0, 1, 1,
0.8564692, 0.8412208, 1.186737, 1, 1, 1, 1, 1,
0.8582315, 1.314541, 0.251009, 1, 1, 1, 1, 1,
0.8652868, 0.007393917, 0.06471819, 1, 1, 1, 1, 1,
0.86764, 1.276987, -1.2601, 1, 1, 1, 1, 1,
0.8739945, -1.073704, 2.985075, 1, 1, 1, 1, 1,
0.8786165, 0.9572706, -0.8494185, 1, 1, 1, 1, 1,
0.8821223, -2.024382, 3.387286, 1, 1, 1, 1, 1,
0.8860673, 0.1149953, 2.960092, 1, 1, 1, 1, 1,
0.8905781, 0.2725757, 0.7754429, 1, 1, 1, 1, 1,
0.8918917, 0.8238989, -0.9496271, 1, 1, 1, 1, 1,
0.8947842, -0.3579862, 1.970278, 1, 1, 1, 1, 1,
0.9095758, 0.0216786, 1.803779, 1, 1, 1, 1, 1,
0.9133019, 0.7291508, 0.5271625, 1, 1, 1, 1, 1,
0.9181066, -1.837309, 2.653968, 1, 1, 1, 1, 1,
0.9193169, -0.6938442, 3.005447, 1, 1, 1, 1, 1,
0.9269047, 0.1424483, 1.934752, 0, 0, 1, 1, 1,
0.9270818, -0.997322, 1.679432, 1, 0, 0, 1, 1,
0.9280742, -0.5755771, 1.629105, 1, 0, 0, 1, 1,
0.9296914, -0.8696834, 1.879049, 1, 0, 0, 1, 1,
0.9341341, 1.635891, 1.853826, 1, 0, 0, 1, 1,
0.9347814, 0.503059, 1.496026, 1, 0, 0, 1, 1,
0.943211, -0.2642083, 2.162207, 0, 0, 0, 1, 1,
0.9461784, 0.0834848, 0.1488403, 0, 0, 0, 1, 1,
0.9468206, 0.3630211, 0.3486519, 0, 0, 0, 1, 1,
0.9528131, 1.56757, 3.134229, 0, 0, 0, 1, 1,
0.9559323, 1.317351, 1.76156, 0, 0, 0, 1, 1,
0.9670975, 1.00412, 0.2960327, 0, 0, 0, 1, 1,
0.9721729, 0.5400272, -0.2464164, 0, 0, 0, 1, 1,
0.9740966, -1.678105, 3.784636, 1, 1, 1, 1, 1,
0.9748457, 0.7692765, -0.2433158, 1, 1, 1, 1, 1,
0.9809623, -0.1988384, 1.746684, 1, 1, 1, 1, 1,
0.9838982, -0.01130913, 3.574959, 1, 1, 1, 1, 1,
0.9841397, 0.4394249, -0.5233544, 1, 1, 1, 1, 1,
0.9843581, 0.05686866, 0.7417169, 1, 1, 1, 1, 1,
0.9863524, -0.1196821, 1.717911, 1, 1, 1, 1, 1,
0.988789, -0.6532235, 3.196169, 1, 1, 1, 1, 1,
0.988867, 1.011453, 1.713385, 1, 1, 1, 1, 1,
0.9909612, 0.1395204, 0.7345632, 1, 1, 1, 1, 1,
0.9994426, 2.702067, 0.7611356, 1, 1, 1, 1, 1,
0.999847, -0.6154798, 1.929168, 1, 1, 1, 1, 1,
1.00068, -0.2825092, 2.276719, 1, 1, 1, 1, 1,
1.003825, 0.09800677, 0.5574165, 1, 1, 1, 1, 1,
1.00714, 0.313483, 1.007525, 1, 1, 1, 1, 1,
1.013559, 1.164587, 0.663816, 0, 0, 1, 1, 1,
1.022605, 0.7119113, 0.2769876, 1, 0, 0, 1, 1,
1.027178, -0.04175927, 2.760463, 1, 0, 0, 1, 1,
1.030816, 0.6559103, -0.7761567, 1, 0, 0, 1, 1,
1.033312, 1.291673, 0.9132912, 1, 0, 0, 1, 1,
1.039159, -0.08875661, 3.105012, 1, 0, 0, 1, 1,
1.048353, 0.8962474, 2.507299, 0, 0, 0, 1, 1,
1.048663, 0.8277208, 0.1192449, 0, 0, 0, 1, 1,
1.058773, -0.972804, 3.291335, 0, 0, 0, 1, 1,
1.058813, 1.212331, 0.939698, 0, 0, 0, 1, 1,
1.062849, 1.905926, -0.2089196, 0, 0, 0, 1, 1,
1.066198, 0.6793327, 1.015809, 0, 0, 0, 1, 1,
1.067404, 0.8434462, 0.1777519, 0, 0, 0, 1, 1,
1.067472, -0.5186739, 0.2294628, 1, 1, 1, 1, 1,
1.074085, -1.344316, 3.450212, 1, 1, 1, 1, 1,
1.078195, -0.2839043, 2.087718, 1, 1, 1, 1, 1,
1.087957, -0.2523332, 2.209676, 1, 1, 1, 1, 1,
1.092849, 1.029334, 2.080661, 1, 1, 1, 1, 1,
1.102427, 0.7196538, 2.550239, 1, 1, 1, 1, 1,
1.104082, 0.4409026, 0.6278582, 1, 1, 1, 1, 1,
1.108984, -0.550153, 1.300808, 1, 1, 1, 1, 1,
1.11246, 1.431938, 0.18665, 1, 1, 1, 1, 1,
1.117082, -0.6365397, 1.596961, 1, 1, 1, 1, 1,
1.120111, -0.741972, 3.950596, 1, 1, 1, 1, 1,
1.133428, 0.5125133, 2.192766, 1, 1, 1, 1, 1,
1.134585, -1.22375, 2.731556, 1, 1, 1, 1, 1,
1.139716, 0.1362556, 1.191538, 1, 1, 1, 1, 1,
1.141449, -1.326091, 2.995574, 1, 1, 1, 1, 1,
1.150837, 0.8387527, 2.69542, 0, 0, 1, 1, 1,
1.151805, -0.4429619, 2.057769, 1, 0, 0, 1, 1,
1.15834, 1.973594, 0.01598802, 1, 0, 0, 1, 1,
1.161709, -0.03629184, 1.724308, 1, 0, 0, 1, 1,
1.165987, 0.6561836, 1.34888, 1, 0, 0, 1, 1,
1.172508, 0.01875257, 1.859534, 1, 0, 0, 1, 1,
1.173682, 0.6858544, 1.060012, 0, 0, 0, 1, 1,
1.176537, 1.264852, 0.4594586, 0, 0, 0, 1, 1,
1.179011, 0.9579284, 3.164653, 0, 0, 0, 1, 1,
1.186937, 0.6507368, 2.773686, 0, 0, 0, 1, 1,
1.201367, -0.2981434, 3.120852, 0, 0, 0, 1, 1,
1.207868, -1.685895, 2.191093, 0, 0, 0, 1, 1,
1.207948, 0.09683485, 2.461702, 0, 0, 0, 1, 1,
1.208749, 0.4246448, 1.063676, 1, 1, 1, 1, 1,
1.209484, -0.9598507, 2.542934, 1, 1, 1, 1, 1,
1.217863, 1.265629, 0.7097494, 1, 1, 1, 1, 1,
1.217918, 1.557261, 1.209126, 1, 1, 1, 1, 1,
1.219191, 0.6127123, -0.4095315, 1, 1, 1, 1, 1,
1.219563, 1.009181, -0.2968007, 1, 1, 1, 1, 1,
1.220526, -0.1713575, 0.5032701, 1, 1, 1, 1, 1,
1.228992, -0.5907191, 1.392226, 1, 1, 1, 1, 1,
1.232644, -0.4143229, 3.100527, 1, 1, 1, 1, 1,
1.235076, 0.710573, 2.815711, 1, 1, 1, 1, 1,
1.236259, 0.3754617, 1.172585, 1, 1, 1, 1, 1,
1.237353, 0.04254566, 1.6275, 1, 1, 1, 1, 1,
1.242165, -0.6796419, 1.882248, 1, 1, 1, 1, 1,
1.242563, 0.7397851, 0.5108291, 1, 1, 1, 1, 1,
1.244959, -0.4533208, 0.3296553, 1, 1, 1, 1, 1,
1.246444, -0.3459536, 1.689799, 0, 0, 1, 1, 1,
1.248056, -1.033512, 3.92629, 1, 0, 0, 1, 1,
1.248536, 0.4789948, 0.1771372, 1, 0, 0, 1, 1,
1.249944, 0.8881549, 2.174826, 1, 0, 0, 1, 1,
1.256279, 0.5239062, 0.8238837, 1, 0, 0, 1, 1,
1.258059, -0.4351713, 1.471151, 1, 0, 0, 1, 1,
1.262545, -1.038046, 1.017942, 0, 0, 0, 1, 1,
1.263379, 0.7738915, 2.338891, 0, 0, 0, 1, 1,
1.268797, 0.4792492, 0.8585092, 0, 0, 0, 1, 1,
1.276103, 1.450039, 0.4764688, 0, 0, 0, 1, 1,
1.289144, -0.5111468, 1.894631, 0, 0, 0, 1, 1,
1.300216, 0.2432451, 1.347976, 0, 0, 0, 1, 1,
1.308907, 1.225474, -0.2644033, 0, 0, 0, 1, 1,
1.318645, 0.1884269, 0.6032619, 1, 1, 1, 1, 1,
1.318911, 0.492494, 1.132631, 1, 1, 1, 1, 1,
1.327714, 0.6594642, 1.342142, 1, 1, 1, 1, 1,
1.331301, -0.1326738, 2.633133, 1, 1, 1, 1, 1,
1.331379, 0.8534281, 0.204409, 1, 1, 1, 1, 1,
1.349541, 0.4854633, 1.493405, 1, 1, 1, 1, 1,
1.351474, -0.2430809, -0.3690091, 1, 1, 1, 1, 1,
1.360507, -0.7821507, 1.592312, 1, 1, 1, 1, 1,
1.364357, -1.540949, 1.551803, 1, 1, 1, 1, 1,
1.368202, -2.075278, 3.890234, 1, 1, 1, 1, 1,
1.369135, 0.7600065, 0.4686969, 1, 1, 1, 1, 1,
1.376835, -0.9853667, 0.785034, 1, 1, 1, 1, 1,
1.378736, 0.1473736, 2.414301, 1, 1, 1, 1, 1,
1.378985, 0.5424053, 1.173522, 1, 1, 1, 1, 1,
1.385763, 0.9727305, 1.932914, 1, 1, 1, 1, 1,
1.395673, -0.6037346, 3.059709, 0, 0, 1, 1, 1,
1.396337, 1.662954, -0.04263354, 1, 0, 0, 1, 1,
1.399775, 0.7569071, 2.568526, 1, 0, 0, 1, 1,
1.409456, 2.470171, 0.4122127, 1, 0, 0, 1, 1,
1.412321, -0.6597133, 1.295148, 1, 0, 0, 1, 1,
1.414137, 0.7827498, 0.4043631, 1, 0, 0, 1, 1,
1.436497, -0.3105955, 1.395376, 0, 0, 0, 1, 1,
1.438858, -0.9928565, 1.664167, 0, 0, 0, 1, 1,
1.449744, -0.1376594, 2.983031, 0, 0, 0, 1, 1,
1.451915, -1.022514, 2.47038, 0, 0, 0, 1, 1,
1.454771, -1.678573, 2.736792, 0, 0, 0, 1, 1,
1.46054, 2.360396, 0.01119931, 0, 0, 0, 1, 1,
1.46422, 1.006022, 1.705899, 0, 0, 0, 1, 1,
1.480272, 0.282808, 0.1657658, 1, 1, 1, 1, 1,
1.494506, 0.2610112, 1.27385, 1, 1, 1, 1, 1,
1.500024, -0.02650161, 1.272424, 1, 1, 1, 1, 1,
1.500132, 1.735712, 0.3958391, 1, 1, 1, 1, 1,
1.500939, 0.8237626, 2.573263, 1, 1, 1, 1, 1,
1.505735, -0.9478738, 3.15967, 1, 1, 1, 1, 1,
1.506163, -0.1202583, 1.07162, 1, 1, 1, 1, 1,
1.525672, 0.4938637, -0.3183489, 1, 1, 1, 1, 1,
1.536247, 1.402036, -0.05427723, 1, 1, 1, 1, 1,
1.53873, 1.507737, 1.112029, 1, 1, 1, 1, 1,
1.543311, -2.428375, 3.540374, 1, 1, 1, 1, 1,
1.549371, 0.86177, 0.4025161, 1, 1, 1, 1, 1,
1.550238, 0.5400967, 1.200754, 1, 1, 1, 1, 1,
1.554262, -1.528803, 4.300293, 1, 1, 1, 1, 1,
1.555972, -0.4002111, 1.214472, 1, 1, 1, 1, 1,
1.574629, -0.05816213, 1.218943, 0, 0, 1, 1, 1,
1.601882, 0.02126681, 2.715615, 1, 0, 0, 1, 1,
1.606706, -0.6880011, 1.190731, 1, 0, 0, 1, 1,
1.608718, -1.648499, 2.795197, 1, 0, 0, 1, 1,
1.628658, -0.5243599, 1.689405, 1, 0, 0, 1, 1,
1.637378, 0.02672487, 1.688251, 1, 0, 0, 1, 1,
1.649161, 0.1283188, 2.21626, 0, 0, 0, 1, 1,
1.654183, -0.4331001, 0.7721987, 0, 0, 0, 1, 1,
1.657786, 0.3788331, 1.880284, 0, 0, 0, 1, 1,
1.662951, 0.7542434, 2.417799, 0, 0, 0, 1, 1,
1.663376, 0.6580873, 0.5688411, 0, 0, 0, 1, 1,
1.678112, 0.4183123, 1.411548, 0, 0, 0, 1, 1,
1.679369, -0.8635519, 4.265234, 0, 0, 0, 1, 1,
1.680359, -0.4075412, 2.192518, 1, 1, 1, 1, 1,
1.683751, 1.386996, 0.9068281, 1, 1, 1, 1, 1,
1.688477, -0.831996, 2.700763, 1, 1, 1, 1, 1,
1.719409, -0.1517489, 1.297025, 1, 1, 1, 1, 1,
1.726908, 0.4492319, 0.2264324, 1, 1, 1, 1, 1,
1.729749, -1.528984, 3.065761, 1, 1, 1, 1, 1,
1.748554, 2.145179, 1.324457, 1, 1, 1, 1, 1,
1.787313, -0.1750471, 3.065103, 1, 1, 1, 1, 1,
1.787882, -0.831201, 2.0321, 1, 1, 1, 1, 1,
1.801021, 0.2889903, 1.479113, 1, 1, 1, 1, 1,
1.811472, 0.2388338, 3.816936, 1, 1, 1, 1, 1,
1.855355, -1.325308, 2.584621, 1, 1, 1, 1, 1,
1.88992, -0.6378646, 3.328391, 1, 1, 1, 1, 1,
1.890846, 0.1514183, 4.376926, 1, 1, 1, 1, 1,
1.904287, -0.1775574, 2.344602, 1, 1, 1, 1, 1,
1.913421, -0.9643428, 2.026421, 0, 0, 1, 1, 1,
1.976919, 0.8260718, -0.5479611, 1, 0, 0, 1, 1,
1.982789, 0.4881114, 0.08894564, 1, 0, 0, 1, 1,
1.983896, -1.24571, 1.96861, 1, 0, 0, 1, 1,
2.010077, -0.7357996, 3.110254, 1, 0, 0, 1, 1,
2.014478, 0.2765647, 2.423368, 1, 0, 0, 1, 1,
2.039735, -0.8912352, 2.330683, 0, 0, 0, 1, 1,
2.062726, -1.183329, 0.9714205, 0, 0, 0, 1, 1,
2.083479, 0.343201, 0.08723667, 0, 0, 0, 1, 1,
2.109217, 0.8098578, 1.740756, 0, 0, 0, 1, 1,
2.179516, -1.426545, 3.990547, 0, 0, 0, 1, 1,
2.17966, -0.2894109, 0.5865446, 0, 0, 0, 1, 1,
2.181577, -0.5955325, 1.906225, 0, 0, 0, 1, 1,
2.214553, 0.111215, 1.36208, 1, 1, 1, 1, 1,
2.310899, 0.7989791, 0.8615833, 1, 1, 1, 1, 1,
2.337901, -0.003808755, 1.266963, 1, 1, 1, 1, 1,
2.429361, 0.964117, 2.85308, 1, 1, 1, 1, 1,
2.659768, -1.531992, -0.3195645, 1, 1, 1, 1, 1,
2.698435, -0.6245881, 1.468072, 1, 1, 1, 1, 1,
3.356934, 0.6849593, 1.064475, 1, 1, 1, 1, 1
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
var radius = 9.57113;
var distance = 33.61819;
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
mvMatrix.translate( -0.2415632, 0.1396159, -0.1616452 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.61819);
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
