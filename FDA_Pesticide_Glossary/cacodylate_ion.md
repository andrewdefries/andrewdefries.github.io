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
-3.354212, 1.089131, -3.524753, 1, 0, 0, 1,
-3.288412, 0.2870826, -3.024942, 1, 0.007843138, 0, 1,
-2.562315, -0.6884079, -0.8867031, 1, 0.01176471, 0, 1,
-2.405212, 0.818133, -1.491183, 1, 0.01960784, 0, 1,
-2.359674, -0.009803165, -2.124006, 1, 0.02352941, 0, 1,
-2.352396, 0.6307496, -0.7316552, 1, 0.03137255, 0, 1,
-2.333478, -1.109024, -0.6659997, 1, 0.03529412, 0, 1,
-2.25124, 1.282103, -0.1624667, 1, 0.04313726, 0, 1,
-2.249063, 0.9578251, -2.002275, 1, 0.04705882, 0, 1,
-2.241986, 2.132268, -2.037315, 1, 0.05490196, 0, 1,
-2.208011, -0.1982405, -0.2932161, 1, 0.05882353, 0, 1,
-2.172807, 1.282899, -0.8982384, 1, 0.06666667, 0, 1,
-2.115804, -0.2273258, -2.37813, 1, 0.07058824, 0, 1,
-2.114407, -2.13548, -1.561324, 1, 0.07843138, 0, 1,
-2.021673, 0.2842565, -1.437053, 1, 0.08235294, 0, 1,
-1.987802, -0.9170122, -4.185796, 1, 0.09019608, 0, 1,
-1.9804, -0.7588531, -0.4420785, 1, 0.09411765, 0, 1,
-1.974782, 0.4428307, -0.2580487, 1, 0.1019608, 0, 1,
-1.943769, -0.6211938, -1.538988, 1, 0.1098039, 0, 1,
-1.938419, -1.420835, -2.007896, 1, 0.1137255, 0, 1,
-1.924955, 1.491774, -0.7609618, 1, 0.1215686, 0, 1,
-1.913236, -0.2876336, -1.544411, 1, 0.1254902, 0, 1,
-1.899639, 1.023811, -1.859665, 1, 0.1333333, 0, 1,
-1.899573, -0.4962295, -0.909332, 1, 0.1372549, 0, 1,
-1.875905, 0.5001765, -2.209452, 1, 0.145098, 0, 1,
-1.861237, 1.367368, -1.073487, 1, 0.1490196, 0, 1,
-1.847846, 0.1920461, -0.0594863, 1, 0.1568628, 0, 1,
-1.843151, 0.0613361, -3.821516, 1, 0.1607843, 0, 1,
-1.835248, -0.6949043, -2.363575, 1, 0.1686275, 0, 1,
-1.83281, -0.5580193, -1.987035, 1, 0.172549, 0, 1,
-1.825337, 0.6840817, -0.6718009, 1, 0.1803922, 0, 1,
-1.816576, 0.5381358, -2.555116, 1, 0.1843137, 0, 1,
-1.813345, -1.96759, -1.321089, 1, 0.1921569, 0, 1,
-1.811745, -0.3312175, -2.121164, 1, 0.1960784, 0, 1,
-1.778342, 0.03764221, -1.615037, 1, 0.2039216, 0, 1,
-1.76516, -0.9074761, -0.9331086, 1, 0.2117647, 0, 1,
-1.737432, -1.018561, -2.076299, 1, 0.2156863, 0, 1,
-1.730489, -1.026185, -2.405179, 1, 0.2235294, 0, 1,
-1.701478, -0.1226885, -1.710235, 1, 0.227451, 0, 1,
-1.691074, -1.23655, -1.080718, 1, 0.2352941, 0, 1,
-1.688213, -0.4258676, -2.01651, 1, 0.2392157, 0, 1,
-1.679394, -0.1494518, -2.631116, 1, 0.2470588, 0, 1,
-1.674571, 0.2303966, -2.396377, 1, 0.2509804, 0, 1,
-1.666273, -0.6435135, -2.062355, 1, 0.2588235, 0, 1,
-1.663808, -0.1322411, -1.693851, 1, 0.2627451, 0, 1,
-1.638185, 0.2926952, -0.1199556, 1, 0.2705882, 0, 1,
-1.621272, -0.8517517, -1.97889, 1, 0.2745098, 0, 1,
-1.617796, -1.146425, -4.628179, 1, 0.282353, 0, 1,
-1.610426, -1.063675, -4.085048, 1, 0.2862745, 0, 1,
-1.610121, 1.39763, -0.3500098, 1, 0.2941177, 0, 1,
-1.608529, -0.651467, -2.904237, 1, 0.3019608, 0, 1,
-1.601745, 0.9811088, -0.1394611, 1, 0.3058824, 0, 1,
-1.594031, 0.7365298, -0.8679225, 1, 0.3137255, 0, 1,
-1.593864, 0.1990011, -1.974087, 1, 0.3176471, 0, 1,
-1.591045, 0.7186609, -0.3029833, 1, 0.3254902, 0, 1,
-1.589231, 0.8666888, -0.4445097, 1, 0.3294118, 0, 1,
-1.588154, -0.005705199, 0.5697147, 1, 0.3372549, 0, 1,
-1.57549, -1.508165, -3.350856, 1, 0.3411765, 0, 1,
-1.565494, -0.5940245, -2.613883, 1, 0.3490196, 0, 1,
-1.562482, -0.2496727, -2.524684, 1, 0.3529412, 0, 1,
-1.538361, 1.057631, -2.038948, 1, 0.3607843, 0, 1,
-1.527155, -1.087807, -3.160792, 1, 0.3647059, 0, 1,
-1.525181, 0.1460936, -3.079534, 1, 0.372549, 0, 1,
-1.504899, 0.05830479, -0.6421904, 1, 0.3764706, 0, 1,
-1.503649, -0.05883316, -1.802805, 1, 0.3843137, 0, 1,
-1.502119, 1.335358, -0.4181543, 1, 0.3882353, 0, 1,
-1.495142, -0.2334973, -3.526024, 1, 0.3960784, 0, 1,
-1.478701, 0.3838557, -0.06035144, 1, 0.4039216, 0, 1,
-1.478405, -0.9696448, -0.8585099, 1, 0.4078431, 0, 1,
-1.474782, -1.496494, -3.059139, 1, 0.4156863, 0, 1,
-1.450959, -1.300989, -1.740362, 1, 0.4196078, 0, 1,
-1.44136, -0.08975822, -0.9264508, 1, 0.427451, 0, 1,
-1.437512, -0.7330492, -2.243441, 1, 0.4313726, 0, 1,
-1.430815, 0.2676606, -1.545154, 1, 0.4392157, 0, 1,
-1.4169, 0.2309164, -1.606313, 1, 0.4431373, 0, 1,
-1.399667, 2.227259, 0.1415469, 1, 0.4509804, 0, 1,
-1.398008, -1.923517, -4.211792, 1, 0.454902, 0, 1,
-1.392495, 2.536165, 0.02697296, 1, 0.4627451, 0, 1,
-1.372023, -1.702568, -3.221556, 1, 0.4666667, 0, 1,
-1.368176, 0.002500504, -1.529479, 1, 0.4745098, 0, 1,
-1.360978, -0.4931316, -2.253183, 1, 0.4784314, 0, 1,
-1.35291, 0.6716163, -0.1429179, 1, 0.4862745, 0, 1,
-1.346461, 0.1498267, -0.9288653, 1, 0.4901961, 0, 1,
-1.344535, 1.173752, 0.2217896, 1, 0.4980392, 0, 1,
-1.340165, -0.1196911, -1.985384, 1, 0.5058824, 0, 1,
-1.336205, -0.007179263, -0.1174635, 1, 0.509804, 0, 1,
-1.333197, -0.3067608, -1.27035, 1, 0.5176471, 0, 1,
-1.329539, -0.441372, -1.767789, 1, 0.5215687, 0, 1,
-1.316926, 0.725632, -0.07719065, 1, 0.5294118, 0, 1,
-1.31629, -0.2964399, -2.831155, 1, 0.5333334, 0, 1,
-1.296041, 1.060003, -1.504628, 1, 0.5411765, 0, 1,
-1.291529, 0.6811042, -1.607854, 1, 0.5450981, 0, 1,
-1.284569, 0.7465705, -0.6961282, 1, 0.5529412, 0, 1,
-1.283221, -0.2326555, -3.591493, 1, 0.5568628, 0, 1,
-1.281623, 0.7492479, -1.240297, 1, 0.5647059, 0, 1,
-1.272227, 1.25522, -0.04226193, 1, 0.5686275, 0, 1,
-1.266317, -1.398853, -2.346626, 1, 0.5764706, 0, 1,
-1.262892, 0.4218595, -0.01773037, 1, 0.5803922, 0, 1,
-1.26103, 0.09005992, -1.568827, 1, 0.5882353, 0, 1,
-1.255888, 0.8364378, -0.4409965, 1, 0.5921569, 0, 1,
-1.252106, 0.5098315, 0.9111336, 1, 0.6, 0, 1,
-1.232289, 1.753125, -1.227567, 1, 0.6078432, 0, 1,
-1.213537, -1.117159, -3.538596, 1, 0.6117647, 0, 1,
-1.204606, -0.1833281, -0.538543, 1, 0.6196079, 0, 1,
-1.198975, 1.36471, -1.723091, 1, 0.6235294, 0, 1,
-1.194189, -0.7743451, -2.725794, 1, 0.6313726, 0, 1,
-1.18711, 0.725925, -0.5378529, 1, 0.6352941, 0, 1,
-1.186779, 0.7053191, -0.8129705, 1, 0.6431373, 0, 1,
-1.183714, -0.09318483, -1.111445, 1, 0.6470588, 0, 1,
-1.177565, -0.9074874, -3.297993, 1, 0.654902, 0, 1,
-1.173803, -0.5154023, -2.612763, 1, 0.6588235, 0, 1,
-1.170842, 0.13748, -3.599082, 1, 0.6666667, 0, 1,
-1.159718, 1.223278, 1.299918, 1, 0.6705883, 0, 1,
-1.148639, -0.2003284, -0.7836003, 1, 0.6784314, 0, 1,
-1.147025, 0.0425244, 0.06455888, 1, 0.682353, 0, 1,
-1.146336, 1.873127, -0.6492828, 1, 0.6901961, 0, 1,
-1.144585, -2.290975, -1.152098, 1, 0.6941177, 0, 1,
-1.136132, 0.7160956, -1.498533, 1, 0.7019608, 0, 1,
-1.125803, -1.323349, -2.386428, 1, 0.7098039, 0, 1,
-1.124122, 0.2107046, -0.3492873, 1, 0.7137255, 0, 1,
-1.119615, -0.1498112, -1.608741, 1, 0.7215686, 0, 1,
-1.1154, 0.8690638, -2.246074, 1, 0.7254902, 0, 1,
-1.105223, 0.9568636, 0.3159593, 1, 0.7333333, 0, 1,
-1.100789, 0.9168293, -1.315688, 1, 0.7372549, 0, 1,
-1.09983, -1.069354, -3.812785, 1, 0.7450981, 0, 1,
-1.097493, 1.087922, -0.1747967, 1, 0.7490196, 0, 1,
-1.097044, 0.9547572, -0.1406308, 1, 0.7568628, 0, 1,
-1.094602, -0.6596063, -1.34701, 1, 0.7607843, 0, 1,
-1.093446, 0.6411093, -1.942634, 1, 0.7686275, 0, 1,
-1.091063, -0.3317407, -1.206202, 1, 0.772549, 0, 1,
-1.090928, -1.626327, -2.318344, 1, 0.7803922, 0, 1,
-1.08768, -0.2867517, -1.079918, 1, 0.7843137, 0, 1,
-1.087287, 0.02389295, -2.075486, 1, 0.7921569, 0, 1,
-1.084833, -1.100092, -1.155526, 1, 0.7960784, 0, 1,
-1.073279, -0.8484603, -3.640917, 1, 0.8039216, 0, 1,
-1.064047, 2.101698, -0.4086266, 1, 0.8117647, 0, 1,
-1.063971, 1.574489, -0.03555575, 1, 0.8156863, 0, 1,
-1.058762, 0.1876338, 0.02751292, 1, 0.8235294, 0, 1,
-1.05635, -0.9524575, -2.224278, 1, 0.827451, 0, 1,
-1.05227, 1.845997, -1.382348, 1, 0.8352941, 0, 1,
-1.051174, 0.7302775, -0.7747527, 1, 0.8392157, 0, 1,
-1.050279, 0.5780993, -1.068737, 1, 0.8470588, 0, 1,
-1.048008, 0.7730601, 1.151295, 1, 0.8509804, 0, 1,
-1.045368, 1.854557, -0.4198024, 1, 0.8588235, 0, 1,
-1.043518, 0.2442653, -2.840701, 1, 0.8627451, 0, 1,
-1.041534, -0.2578089, -2.057172, 1, 0.8705882, 0, 1,
-1.04123, 0.1474613, -1.460012, 1, 0.8745098, 0, 1,
-1.038152, 0.1650562, -1.839914, 1, 0.8823529, 0, 1,
-1.029598, 0.8046576, -3.039956, 1, 0.8862745, 0, 1,
-1.022675, 0.6887701, -1.747277, 1, 0.8941177, 0, 1,
-1.010628, 0.04688836, -2.408702, 1, 0.8980392, 0, 1,
-1.003287, 0.7306312, -1.952755, 1, 0.9058824, 0, 1,
-0.9945855, 0.5540772, -1.626733, 1, 0.9137255, 0, 1,
-0.9904346, 0.8388551, -2.086401, 1, 0.9176471, 0, 1,
-0.9846635, 0.3903949, -3.07519, 1, 0.9254902, 0, 1,
-0.9598688, 0.8210282, -2.3002, 1, 0.9294118, 0, 1,
-0.9563407, 0.8898377, -0.6596801, 1, 0.9372549, 0, 1,
-0.9540442, -0.3840349, -2.515775, 1, 0.9411765, 0, 1,
-0.9539382, 1.55581, -1.687216, 1, 0.9490196, 0, 1,
-0.953485, -0.9405326, -1.525664, 1, 0.9529412, 0, 1,
-0.9529279, -0.7938588, -3.168121, 1, 0.9607843, 0, 1,
-0.9519992, -0.2387624, -2.207927, 1, 0.9647059, 0, 1,
-0.9513019, 0.5376514, -0.9020987, 1, 0.972549, 0, 1,
-0.9490711, 1.02586, 0.4798011, 1, 0.9764706, 0, 1,
-0.9488178, 0.8517786, -1.879657, 1, 0.9843137, 0, 1,
-0.9418888, -0.4390034, -2.277206, 1, 0.9882353, 0, 1,
-0.9395893, -0.6769137, -3.250663, 1, 0.9960784, 0, 1,
-0.9330514, -0.3406249, -2.921911, 0.9960784, 1, 0, 1,
-0.9308249, -1.417833, -2.909077, 0.9921569, 1, 0, 1,
-0.9240755, -2.077541, -2.691227, 0.9843137, 1, 0, 1,
-0.9236437, -0.7563968, -1.807533, 0.9803922, 1, 0, 1,
-0.9202119, 0.2642959, -1.159679, 0.972549, 1, 0, 1,
-0.9013106, 2.529945, 0.04435747, 0.9686275, 1, 0, 1,
-0.8959435, -0.534793, -0.7637984, 0.9607843, 1, 0, 1,
-0.8952379, 0.7437624, 0.2055989, 0.9568627, 1, 0, 1,
-0.8926995, 1.022639, 1.470452, 0.9490196, 1, 0, 1,
-0.8926212, -0.2257659, -2.525203, 0.945098, 1, 0, 1,
-0.8882973, -0.2418133, -0.8486174, 0.9372549, 1, 0, 1,
-0.8875927, -0.2643622, -0.5162767, 0.9333333, 1, 0, 1,
-0.8780152, 0.4602794, -0.9807739, 0.9254902, 1, 0, 1,
-0.8752992, -0.8627927, -1.360676, 0.9215686, 1, 0, 1,
-0.8667576, 1.069373, -0.8574995, 0.9137255, 1, 0, 1,
-0.8470023, 1.349328, -1.183242, 0.9098039, 1, 0, 1,
-0.8455925, 0.8387408, -1.041542, 0.9019608, 1, 0, 1,
-0.8443725, -1.34185, -3.469732, 0.8941177, 1, 0, 1,
-0.83995, -0.4497614, -1.381064, 0.8901961, 1, 0, 1,
-0.8387738, 0.4846185, -0.6538143, 0.8823529, 1, 0, 1,
-0.8385199, 0.06760988, -3.460909, 0.8784314, 1, 0, 1,
-0.8332043, -0.4231233, -3.139821, 0.8705882, 1, 0, 1,
-0.8305953, -0.1395168, -1.480544, 0.8666667, 1, 0, 1,
-0.8301553, -1.218049, -4.038445, 0.8588235, 1, 0, 1,
-0.8294932, -1.341143, -2.166189, 0.854902, 1, 0, 1,
-0.8282593, -1.364324, -2.352393, 0.8470588, 1, 0, 1,
-0.8259155, -0.2660358, -1.031479, 0.8431373, 1, 0, 1,
-0.8225039, 0.5740793, 0.6952519, 0.8352941, 1, 0, 1,
-0.8164793, -0.9893813, -3.334379, 0.8313726, 1, 0, 1,
-0.8097022, -0.1951801, -1.11429, 0.8235294, 1, 0, 1,
-0.8092004, -1.711322, -3.118348, 0.8196079, 1, 0, 1,
-0.8054273, 0.7561321, -0.6135144, 0.8117647, 1, 0, 1,
-0.7979794, -1.771347, -2.545004, 0.8078431, 1, 0, 1,
-0.7909279, -1.035313, -3.346677, 0.8, 1, 0, 1,
-0.7904664, -0.6137211, -1.555402, 0.7921569, 1, 0, 1,
-0.7896848, -0.9916543, -2.303972, 0.7882353, 1, 0, 1,
-0.777522, -0.3896526, -1.158628, 0.7803922, 1, 0, 1,
-0.7735367, -0.5083755, -3.343159, 0.7764706, 1, 0, 1,
-0.7666979, -0.5708031, -2.652116, 0.7686275, 1, 0, 1,
-0.7645079, -0.02023562, -2.470612, 0.7647059, 1, 0, 1,
-0.7637191, 0.8076993, -0.8361197, 0.7568628, 1, 0, 1,
-0.7602188, 0.2215723, -1.071647, 0.7529412, 1, 0, 1,
-0.7588607, 0.1669434, -1.64414, 0.7450981, 1, 0, 1,
-0.757645, -0.891512, -2.203579, 0.7411765, 1, 0, 1,
-0.7567769, 0.9846034, -0.3728031, 0.7333333, 1, 0, 1,
-0.7486633, 0.603742, -0.4655285, 0.7294118, 1, 0, 1,
-0.747565, -2.327895, -1.988468, 0.7215686, 1, 0, 1,
-0.7401835, 0.3853239, -0.9248127, 0.7176471, 1, 0, 1,
-0.7354409, 0.2032566, -1.299598, 0.7098039, 1, 0, 1,
-0.7292657, 1.399784, -1.054006, 0.7058824, 1, 0, 1,
-0.7277876, 1.363919, -1.331867, 0.6980392, 1, 0, 1,
-0.7229723, -1.235667, -4.263391, 0.6901961, 1, 0, 1,
-0.71995, -0.1790162, -2.745595, 0.6862745, 1, 0, 1,
-0.7180876, -0.3384987, -1.554623, 0.6784314, 1, 0, 1,
-0.7165832, 0.7052652, -1.603748, 0.6745098, 1, 0, 1,
-0.7123415, -0.1500924, -2.070692, 0.6666667, 1, 0, 1,
-0.7114912, 0.3626022, -1.958006, 0.6627451, 1, 0, 1,
-0.7078321, -0.4914233, -2.149804, 0.654902, 1, 0, 1,
-0.7059382, 0.2689591, -0.6634427, 0.6509804, 1, 0, 1,
-0.6971476, 1.00049, -0.3918456, 0.6431373, 1, 0, 1,
-0.6922654, -1.162815, -2.868253, 0.6392157, 1, 0, 1,
-0.6922626, -1.483622, -2.41196, 0.6313726, 1, 0, 1,
-0.6922264, -1.091092, -2.696089, 0.627451, 1, 0, 1,
-0.6865608, -1.408632, -3.805134, 0.6196079, 1, 0, 1,
-0.6845184, -1.923734, -2.547878, 0.6156863, 1, 0, 1,
-0.6708716, 0.8103008, -1.176959, 0.6078432, 1, 0, 1,
-0.6686897, -0.02105117, -3.159617, 0.6039216, 1, 0, 1,
-0.6684191, -1.48521, -1.262487, 0.5960785, 1, 0, 1,
-0.6667017, 0.3553554, -2.402377, 0.5882353, 1, 0, 1,
-0.6665576, 1.199933, -1.1295, 0.5843138, 1, 0, 1,
-0.6625888, 0.08856791, -1.439147, 0.5764706, 1, 0, 1,
-0.65929, -1.002061, -2.403061, 0.572549, 1, 0, 1,
-0.6578619, -1.228182, -1.724984, 0.5647059, 1, 0, 1,
-0.6577191, 1.151205, 0.9028596, 0.5607843, 1, 0, 1,
-0.650405, -0.1710005, -2.156741, 0.5529412, 1, 0, 1,
-0.6489933, -0.7829741, -2.34747, 0.5490196, 1, 0, 1,
-0.648898, -0.7631493, -1.163614, 0.5411765, 1, 0, 1,
-0.6420012, -1.455846, -4.691592, 0.5372549, 1, 0, 1,
-0.6364232, 0.5824867, -1.997704, 0.5294118, 1, 0, 1,
-0.6273054, -1.062113, -1.7075, 0.5254902, 1, 0, 1,
-0.6179289, 0.4991435, 0.6747261, 0.5176471, 1, 0, 1,
-0.6151276, -0.7898502, -0.7609659, 0.5137255, 1, 0, 1,
-0.6127591, 1.341835, -1.766039, 0.5058824, 1, 0, 1,
-0.6124222, 0.6675028, -0.8905221, 0.5019608, 1, 0, 1,
-0.6036762, -0.4972001, -2.40111, 0.4941176, 1, 0, 1,
-0.5983422, -0.6831328, -1.575676, 0.4862745, 1, 0, 1,
-0.5968574, -1.228422, -3.073671, 0.4823529, 1, 0, 1,
-0.5930556, 1.349834, -1.235026, 0.4745098, 1, 0, 1,
-0.5906657, 0.5753053, -0.1380633, 0.4705882, 1, 0, 1,
-0.5886148, 0.8873933, -0.6945998, 0.4627451, 1, 0, 1,
-0.5879194, -1.729135, -3.913323, 0.4588235, 1, 0, 1,
-0.5860003, -0.1421295, -1.987819, 0.4509804, 1, 0, 1,
-0.5760995, -0.8840719, -2.912945, 0.4470588, 1, 0, 1,
-0.5753425, 0.9989084, -0.1942101, 0.4392157, 1, 0, 1,
-0.5696014, -0.300196, -2.933188, 0.4352941, 1, 0, 1,
-0.5669662, 0.9939278, -1.800097, 0.427451, 1, 0, 1,
-0.5640838, -1.662767, -1.270536, 0.4235294, 1, 0, 1,
-0.5617733, -0.8252784, -2.485461, 0.4156863, 1, 0, 1,
-0.556464, -1.122173, -1.987723, 0.4117647, 1, 0, 1,
-0.5510281, -1.411012, -2.69715, 0.4039216, 1, 0, 1,
-0.540969, 0.7861711, -2.38114, 0.3960784, 1, 0, 1,
-0.5401521, -0.5508293, -3.406442, 0.3921569, 1, 0, 1,
-0.5395966, 0.8339243, -1.596925, 0.3843137, 1, 0, 1,
-0.5390517, -0.301921, -1.808039, 0.3803922, 1, 0, 1,
-0.5365642, 0.01478836, 0.01895305, 0.372549, 1, 0, 1,
-0.53431, -0.01482747, -2.37268, 0.3686275, 1, 0, 1,
-0.5311117, -0.6619947, -0.9056873, 0.3607843, 1, 0, 1,
-0.5210616, 0.2877224, -1.402944, 0.3568628, 1, 0, 1,
-0.5194895, -1.085713, -2.206861, 0.3490196, 1, 0, 1,
-0.5156299, -0.8623082, -4.278648, 0.345098, 1, 0, 1,
-0.5101041, 1.859964, -0.453442, 0.3372549, 1, 0, 1,
-0.5003027, -0.8555173, -2.615226, 0.3333333, 1, 0, 1,
-0.4963731, 0.8433916, -0.6914597, 0.3254902, 1, 0, 1,
-0.495165, 1.517451, -0.4662292, 0.3215686, 1, 0, 1,
-0.4915088, 2.304173, -0.7843533, 0.3137255, 1, 0, 1,
-0.4905793, -0.9244362, -2.077308, 0.3098039, 1, 0, 1,
-0.4896716, 0.6636237, 1.571412, 0.3019608, 1, 0, 1,
-0.4861188, -0.6957429, -3.848936, 0.2941177, 1, 0, 1,
-0.485422, 0.1174178, -1.270785, 0.2901961, 1, 0, 1,
-0.4853812, 0.01077564, -2.363279, 0.282353, 1, 0, 1,
-0.4830765, -0.7924874, -1.755656, 0.2784314, 1, 0, 1,
-0.4611558, 0.1196747, -3.252651, 0.2705882, 1, 0, 1,
-0.4599676, 0.9956758, -0.5198963, 0.2666667, 1, 0, 1,
-0.4579136, -0.4737943, -1.286453, 0.2588235, 1, 0, 1,
-0.4578585, 0.8645537, 0.3478892, 0.254902, 1, 0, 1,
-0.4518929, 0.7975773, 0.4586092, 0.2470588, 1, 0, 1,
-0.44842, -1.498461, -2.523791, 0.2431373, 1, 0, 1,
-0.4482355, 0.1113081, -1.646661, 0.2352941, 1, 0, 1,
-0.44799, 1.071128, 0.4584002, 0.2313726, 1, 0, 1,
-0.4456307, -0.1585318, -2.259004, 0.2235294, 1, 0, 1,
-0.4455946, 0.1006229, -1.065512, 0.2196078, 1, 0, 1,
-0.4449301, -1.388291, -1.990007, 0.2117647, 1, 0, 1,
-0.4406901, 0.8221018, -0.8954588, 0.2078431, 1, 0, 1,
-0.4406891, -0.06338841, -1.725356, 0.2, 1, 0, 1,
-0.4400274, 1.25455, 0.9038102, 0.1921569, 1, 0, 1,
-0.4386483, -1.208929, -2.63959, 0.1882353, 1, 0, 1,
-0.4329558, 0.5296, -0.3271956, 0.1803922, 1, 0, 1,
-0.4274645, 0.4886572, -1.258227, 0.1764706, 1, 0, 1,
-0.4197927, 0.9464003, -1.331184, 0.1686275, 1, 0, 1,
-0.4183052, -1.268379, -2.923843, 0.1647059, 1, 0, 1,
-0.4171443, -1.646015, -4.10909, 0.1568628, 1, 0, 1,
-0.4159985, 0.1068557, 0.1773994, 0.1529412, 1, 0, 1,
-0.4155194, 0.4828169, 1.391257, 0.145098, 1, 0, 1,
-0.4148087, 0.9873673, 0.718563, 0.1411765, 1, 0, 1,
-0.4145525, -1.43962, -3.778608, 0.1333333, 1, 0, 1,
-0.4130034, 0.339998, -1.727268, 0.1294118, 1, 0, 1,
-0.4021142, 0.1056319, -1.223755, 0.1215686, 1, 0, 1,
-0.4004949, 0.4613582, -0.2122193, 0.1176471, 1, 0, 1,
-0.3969975, -1.660564, -2.838073, 0.1098039, 1, 0, 1,
-0.39546, 0.4620124, -2.662784, 0.1058824, 1, 0, 1,
-0.3947989, 0.7358346, -0.9213684, 0.09803922, 1, 0, 1,
-0.3898199, -0.2982427, -2.493286, 0.09019608, 1, 0, 1,
-0.3873484, 0.03696759, -2.325733, 0.08627451, 1, 0, 1,
-0.3846352, 0.3876334, -2.372842, 0.07843138, 1, 0, 1,
-0.3846113, -1.222215, -4.204755, 0.07450981, 1, 0, 1,
-0.3821995, 0.2558302, -1.513323, 0.06666667, 1, 0, 1,
-0.3819934, 0.1549422, -1.599084, 0.0627451, 1, 0, 1,
-0.3804417, 0.00766036, -0.4771149, 0.05490196, 1, 0, 1,
-0.3782564, 0.2048902, -1.946487, 0.05098039, 1, 0, 1,
-0.3760088, -2.338495, -3.535073, 0.04313726, 1, 0, 1,
-0.3731328, -1.169249, -2.661419, 0.03921569, 1, 0, 1,
-0.3729911, -0.02566016, -1.908856, 0.03137255, 1, 0, 1,
-0.3692147, -0.370155, -2.760084, 0.02745098, 1, 0, 1,
-0.368147, -1.117262, -2.635186, 0.01960784, 1, 0, 1,
-0.3632942, 0.1306495, -1.554794, 0.01568628, 1, 0, 1,
-0.3627394, -2.41906, -3.6913, 0.007843138, 1, 0, 1,
-0.3602147, 0.4176883, -0.09861898, 0.003921569, 1, 0, 1,
-0.3541272, 1.300118, -1.820232, 0, 1, 0.003921569, 1,
-0.3526352, -0.3345846, -2.270706, 0, 1, 0.01176471, 1,
-0.3524104, -0.3487021, -3.286172, 0, 1, 0.01568628, 1,
-0.3518926, -0.6315969, -3.022851, 0, 1, 0.02352941, 1,
-0.3500204, -0.2885627, -0.3019919, 0, 1, 0.02745098, 1,
-0.3463012, -1.863515, -2.637281, 0, 1, 0.03529412, 1,
-0.3404406, 0.9296281, -0.3748719, 0, 1, 0.03921569, 1,
-0.3392157, 0.7627155, -1.005447, 0, 1, 0.04705882, 1,
-0.3344148, -0.0791021, -1.002225, 0, 1, 0.05098039, 1,
-0.3286927, 1.500717, -1.837053, 0, 1, 0.05882353, 1,
-0.3286009, -0.7154044, -2.540611, 0, 1, 0.0627451, 1,
-0.3262704, 1.695687, 0.2698919, 0, 1, 0.07058824, 1,
-0.3224368, -0.09759711, -0.8650998, 0, 1, 0.07450981, 1,
-0.3213926, -0.3085518, -1.728674, 0, 1, 0.08235294, 1,
-0.3195368, 0.6111908, 1.326676, 0, 1, 0.08627451, 1,
-0.317701, 0.8445715, -0.7042115, 0, 1, 0.09411765, 1,
-0.316245, 0.8165949, -0.642448, 0, 1, 0.1019608, 1,
-0.3157431, -1.437223, -3.785029, 0, 1, 0.1058824, 1,
-0.3120535, 0.09930843, -1.33204, 0, 1, 0.1137255, 1,
-0.3078974, -0.9157591, -2.574006, 0, 1, 0.1176471, 1,
-0.3063351, -0.3685187, -3.820371, 0, 1, 0.1254902, 1,
-0.3040043, -1.997035, -1.748354, 0, 1, 0.1294118, 1,
-0.3012109, -0.6934705, -1.64784, 0, 1, 0.1372549, 1,
-0.3007876, 1.610833, 0.2095781, 0, 1, 0.1411765, 1,
-0.2992091, -1.143778, -0.176362, 0, 1, 0.1490196, 1,
-0.2899396, -0.9402866, -2.801531, 0, 1, 0.1529412, 1,
-0.2864281, -0.8004319, -2.07705, 0, 1, 0.1607843, 1,
-0.2845562, -0.3603489, -2.003824, 0, 1, 0.1647059, 1,
-0.284514, -0.9193337, -1.970628, 0, 1, 0.172549, 1,
-0.2739436, 0.1821984, -2.131158, 0, 1, 0.1764706, 1,
-0.2696547, 0.335885, -1.373314, 0, 1, 0.1843137, 1,
-0.268635, -0.1824049, -0.5851256, 0, 1, 0.1882353, 1,
-0.2651667, -0.01477027, -0.5319111, 0, 1, 0.1960784, 1,
-0.2601337, -0.3897758, -3.404537, 0, 1, 0.2039216, 1,
-0.2597398, -0.8334664, -3.165488, 0, 1, 0.2078431, 1,
-0.2594492, -1.82991, -3.014305, 0, 1, 0.2156863, 1,
-0.2586701, 1.821922, -1.451262, 0, 1, 0.2196078, 1,
-0.2586218, -1.093985, -3.798861, 0, 1, 0.227451, 1,
-0.2579579, 0.9117507, 0.9563465, 0, 1, 0.2313726, 1,
-0.2495783, 0.8385478, 1.627915, 0, 1, 0.2392157, 1,
-0.2389377, -0.2646122, -1.578049, 0, 1, 0.2431373, 1,
-0.2386878, 0.0293497, -1.033414, 0, 1, 0.2509804, 1,
-0.2380959, 1.231163, 0.2894545, 0, 1, 0.254902, 1,
-0.2305077, -1.272851, -2.180117, 0, 1, 0.2627451, 1,
-0.2298588, 1.094443, 0.4766241, 0, 1, 0.2666667, 1,
-0.2279457, 0.3808777, -1.20675, 0, 1, 0.2745098, 1,
-0.2235904, -1.566127, -3.591914, 0, 1, 0.2784314, 1,
-0.2215354, -0.7004135, -2.506451, 0, 1, 0.2862745, 1,
-0.2199548, -0.3984742, -2.796405, 0, 1, 0.2901961, 1,
-0.2179735, -1.931891, -2.137377, 0, 1, 0.2980392, 1,
-0.2125063, -0.9473195, -1.516971, 0, 1, 0.3058824, 1,
-0.2112735, -1.362738, -2.653488, 0, 1, 0.3098039, 1,
-0.2066057, -0.06272721, -1.212745, 0, 1, 0.3176471, 1,
-0.2052229, 0.0926807, 0.2577693, 0, 1, 0.3215686, 1,
-0.2048667, 1.562733, -0.3621829, 0, 1, 0.3294118, 1,
-0.202418, 1.226451, -1.486661, 0, 1, 0.3333333, 1,
-0.189101, -0.1021702, -2.416091, 0, 1, 0.3411765, 1,
-0.1889972, -0.4275669, -1.564802, 0, 1, 0.345098, 1,
-0.1887164, -1.532859, -3.402519, 0, 1, 0.3529412, 1,
-0.1885825, -0.716934, -3.073931, 0, 1, 0.3568628, 1,
-0.1874986, -1.118718, -3.374992, 0, 1, 0.3647059, 1,
-0.1827074, 0.1582322, -0.8576635, 0, 1, 0.3686275, 1,
-0.1813501, -1.96366, -3.360478, 0, 1, 0.3764706, 1,
-0.1810574, 0.7114036, 0.9703404, 0, 1, 0.3803922, 1,
-0.1746858, -0.4583882, -1.694265, 0, 1, 0.3882353, 1,
-0.1743131, 0.8011785, 1.27614, 0, 1, 0.3921569, 1,
-0.1704301, -0.6741982, -2.577172, 0, 1, 0.4, 1,
-0.1666144, 2.349894, 0.3869895, 0, 1, 0.4078431, 1,
-0.1636986, 0.05191446, -0.373615, 0, 1, 0.4117647, 1,
-0.161294, -1.686952, -3.664649, 0, 1, 0.4196078, 1,
-0.1610194, 0.04442727, -2.089726, 0, 1, 0.4235294, 1,
-0.1594557, -0.3385777, -3.149226, 0, 1, 0.4313726, 1,
-0.1508563, 0.1346643, -0.5661994, 0, 1, 0.4352941, 1,
-0.1445063, -2.193591, -3.041635, 0, 1, 0.4431373, 1,
-0.1438237, 0.03642251, -1.967856, 0, 1, 0.4470588, 1,
-0.1437508, 0.28113, -1.406566, 0, 1, 0.454902, 1,
-0.141251, -0.2756267, -3.801781, 0, 1, 0.4588235, 1,
-0.1403881, 0.8399156, -0.4676296, 0, 1, 0.4666667, 1,
-0.1394092, 0.8567555, 0.2219188, 0, 1, 0.4705882, 1,
-0.1393016, -0.330256, -5.174376, 0, 1, 0.4784314, 1,
-0.1369429, 0.7889881, 0.5026923, 0, 1, 0.4823529, 1,
-0.1345287, -0.9387931, -2.000927, 0, 1, 0.4901961, 1,
-0.1278885, 0.6869316, -0.4874967, 0, 1, 0.4941176, 1,
-0.1238365, -0.1283904, -4.151814, 0, 1, 0.5019608, 1,
-0.1236172, -0.1681429, -3.880248, 0, 1, 0.509804, 1,
-0.1226341, -0.4280097, -1.541278, 0, 1, 0.5137255, 1,
-0.1176343, -1.586902, -2.866872, 0, 1, 0.5215687, 1,
-0.1160567, -0.468072, -2.238073, 0, 1, 0.5254902, 1,
-0.1155359, 0.1543219, 0.03366608, 0, 1, 0.5333334, 1,
-0.1116321, -1.239995, -4.496867, 0, 1, 0.5372549, 1,
-0.1089633, -0.8235222, -2.701714, 0, 1, 0.5450981, 1,
-0.1033171, -0.790337, -3.046442, 0, 1, 0.5490196, 1,
-0.1022066, 0.03632312, -1.730168, 0, 1, 0.5568628, 1,
-0.1007106, -1.413439, -0.9963083, 0, 1, 0.5607843, 1,
-0.1006205, 0.6751883, -0.02762946, 0, 1, 0.5686275, 1,
-0.1001925, 1.287318, 1.177939, 0, 1, 0.572549, 1,
-0.09828997, 0.5968573, -1.844604, 0, 1, 0.5803922, 1,
-0.09780833, 1.364794, -0.813562, 0, 1, 0.5843138, 1,
-0.09706105, 1.105348, 0.2269502, 0, 1, 0.5921569, 1,
-0.09653168, -1.522548, -3.054733, 0, 1, 0.5960785, 1,
-0.09261283, -0.5150172, -1.563424, 0, 1, 0.6039216, 1,
-0.09008928, -0.1742368, -2.571713, 0, 1, 0.6117647, 1,
-0.08526166, -0.32622, -1.804515, 0, 1, 0.6156863, 1,
-0.08240079, 0.6624722, 0.3820764, 0, 1, 0.6235294, 1,
-0.08077652, -1.489641, -3.061382, 0, 1, 0.627451, 1,
-0.08076158, 0.07548679, -1.51651, 0, 1, 0.6352941, 1,
-0.07997463, -0.3473451, -2.200882, 0, 1, 0.6392157, 1,
-0.07667468, 0.9254872, 0.3469736, 0, 1, 0.6470588, 1,
-0.0717314, -1.467146, -2.25077, 0, 1, 0.6509804, 1,
-0.0706885, -0.9930394, -4.642788, 0, 1, 0.6588235, 1,
-0.07007401, 0.8358833, -1.584923, 0, 1, 0.6627451, 1,
-0.06970303, -0.9605286, -4.166448, 0, 1, 0.6705883, 1,
-0.0671958, 0.4062889, 1.691019, 0, 1, 0.6745098, 1,
-0.05985805, 0.5973347, -0.01190254, 0, 1, 0.682353, 1,
-0.05843256, -1.25748, -2.71519, 0, 1, 0.6862745, 1,
-0.05442122, -0.3527183, -2.690645, 0, 1, 0.6941177, 1,
-0.05116687, -0.3331275, -3.217239, 0, 1, 0.7019608, 1,
-0.05109316, 0.04614205, -0.8789026, 0, 1, 0.7058824, 1,
-0.05093736, 0.6267352, -0.004068438, 0, 1, 0.7137255, 1,
-0.04392686, -0.04840995, -1.026859, 0, 1, 0.7176471, 1,
-0.03122006, -1.177932, -1.705718, 0, 1, 0.7254902, 1,
-0.02930406, -0.4234509, -1.391812, 0, 1, 0.7294118, 1,
-0.0264328, -0.4727757, -2.810004, 0, 1, 0.7372549, 1,
-0.02533179, -0.4542128, -4.735717, 0, 1, 0.7411765, 1,
-0.02295661, -0.3443331, -2.910322, 0, 1, 0.7490196, 1,
-0.02226735, -0.1642993, -2.649479, 0, 1, 0.7529412, 1,
-0.01843018, -0.5129133, -2.045736, 0, 1, 0.7607843, 1,
-0.01782746, 0.6034272, -0.08496568, 0, 1, 0.7647059, 1,
-0.01564394, 1.637712, 1.024995, 0, 1, 0.772549, 1,
-0.01368285, -1.150647, -3.069037, 0, 1, 0.7764706, 1,
-0.01326415, 1.765993, -0.9341863, 0, 1, 0.7843137, 1,
-0.008676791, -0.8236619, -2.578634, 0, 1, 0.7882353, 1,
-0.008597332, -0.5977612, -5.871059, 0, 1, 0.7960784, 1,
-0.005528307, 0.9376091, -0.03361122, 0, 1, 0.8039216, 1,
-0.0005776967, 0.0435215, -0.3800493, 0, 1, 0.8078431, 1,
0.0008446565, 0.8483627, 0.7570631, 0, 1, 0.8156863, 1,
0.00204486, -0.5593485, 2.797772, 0, 1, 0.8196079, 1,
0.004541723, -0.005761787, 2.74448, 0, 1, 0.827451, 1,
0.01605825, -0.3818919, 3.848446, 0, 1, 0.8313726, 1,
0.01986419, 0.7871129, 0.5406242, 0, 1, 0.8392157, 1,
0.0211309, -2.330807, 2.190326, 0, 1, 0.8431373, 1,
0.0215123, -1.008221, 2.498497, 0, 1, 0.8509804, 1,
0.02541466, -1.164572, 2.762862, 0, 1, 0.854902, 1,
0.02688376, -0.3309792, 3.536377, 0, 1, 0.8627451, 1,
0.02743881, 0.6633412, -0.175546, 0, 1, 0.8666667, 1,
0.02805576, -0.3150463, 3.008957, 0, 1, 0.8745098, 1,
0.028776, 1.179945, -1.542142, 0, 1, 0.8784314, 1,
0.03235166, -0.5018132, 3.589356, 0, 1, 0.8862745, 1,
0.03831305, -0.1838206, 1.310071, 0, 1, 0.8901961, 1,
0.04583143, 1.532276, -0.3783125, 0, 1, 0.8980392, 1,
0.04662704, -1.41037, 4.610138, 0, 1, 0.9058824, 1,
0.04670611, 0.2080754, 1.498979, 0, 1, 0.9098039, 1,
0.05009165, -0.8747959, 4.258697, 0, 1, 0.9176471, 1,
0.05078113, -0.1829817, 3.273455, 0, 1, 0.9215686, 1,
0.05517329, 0.3579488, 1.755133, 0, 1, 0.9294118, 1,
0.05621641, -1.053369, 3.964012, 0, 1, 0.9333333, 1,
0.05654102, 0.6899787, -0.5475149, 0, 1, 0.9411765, 1,
0.05664817, -0.1366919, 2.66168, 0, 1, 0.945098, 1,
0.05697814, 0.631088, 0.2348488, 0, 1, 0.9529412, 1,
0.05778414, 0.5596244, 0.4370883, 0, 1, 0.9568627, 1,
0.06159992, -1.558539, 2.601688, 0, 1, 0.9647059, 1,
0.06256492, 0.9785885, 0.4164644, 0, 1, 0.9686275, 1,
0.06460363, 0.3485116, -0.4633766, 0, 1, 0.9764706, 1,
0.0654267, 0.3152763, 1.107727, 0, 1, 0.9803922, 1,
0.06872184, 0.01837714, 2.181689, 0, 1, 0.9882353, 1,
0.07135502, 0.1477194, 0.1358373, 0, 1, 0.9921569, 1,
0.07143255, -0.3237737, 5.069565, 0, 1, 1, 1,
0.0747095, 0.4921787, 0.5398248, 0, 0.9921569, 1, 1,
0.07510801, -0.1434864, 2.831286, 0, 0.9882353, 1, 1,
0.07717069, 0.6868256, 0.4284674, 0, 0.9803922, 1, 1,
0.07852304, -0.09775388, 4.465899, 0, 0.9764706, 1, 1,
0.07905204, 1.329172, -0.5035962, 0, 0.9686275, 1, 1,
0.08033529, -0.2675869, 2.923687, 0, 0.9647059, 1, 1,
0.08341855, 1.472597, -1.633359, 0, 0.9568627, 1, 1,
0.08642621, -0.1300257, 1.947112, 0, 0.9529412, 1, 1,
0.0870183, -1.45824, 2.933649, 0, 0.945098, 1, 1,
0.08936617, 0.6484196, 0.7340835, 0, 0.9411765, 1, 1,
0.09292275, 0.6755482, 0.1928179, 0, 0.9333333, 1, 1,
0.09379111, 0.2881211, 0.6492443, 0, 0.9294118, 1, 1,
0.09890465, 0.936831, -1.200551, 0, 0.9215686, 1, 1,
0.1002608, 0.237473, 0.07271639, 0, 0.9176471, 1, 1,
0.1011558, 0.1275738, 1.77799, 0, 0.9098039, 1, 1,
0.1019855, 0.9702325, -0.9308732, 0, 0.9058824, 1, 1,
0.1042868, -0.8062398, 3.206184, 0, 0.8980392, 1, 1,
0.1043924, 0.9119139, 0.5233214, 0, 0.8901961, 1, 1,
0.1088345, -0.5340567, 3.300468, 0, 0.8862745, 1, 1,
0.1136323, -0.6429833, 2.947408, 0, 0.8784314, 1, 1,
0.1158161, 0.08920274, 1.774434, 0, 0.8745098, 1, 1,
0.1227393, 0.5719914, -0.9273808, 0, 0.8666667, 1, 1,
0.1227419, 0.1154081, 1.222501, 0, 0.8627451, 1, 1,
0.1250115, -0.7163771, 3.265378, 0, 0.854902, 1, 1,
0.1264403, -0.5798175, 4.311563, 0, 0.8509804, 1, 1,
0.126545, -0.2837393, 2.928412, 0, 0.8431373, 1, 1,
0.1281222, -0.7698374, 4.18497, 0, 0.8392157, 1, 1,
0.1333724, -0.722647, 2.634795, 0, 0.8313726, 1, 1,
0.1381116, -0.7033272, 3.700454, 0, 0.827451, 1, 1,
0.138207, -0.3110029, 3.629693, 0, 0.8196079, 1, 1,
0.1388206, -0.7216368, 3.19637, 0, 0.8156863, 1, 1,
0.1407637, 0.7534989, 0.1573808, 0, 0.8078431, 1, 1,
0.1430947, -0.04803992, 0.3762807, 0, 0.8039216, 1, 1,
0.1462171, 0.3792464, 1.089418, 0, 0.7960784, 1, 1,
0.1477293, 1.187307, 0.5815597, 0, 0.7882353, 1, 1,
0.1503633, 0.8524044, -1.449671, 0, 0.7843137, 1, 1,
0.1504748, -0.1525669, 2.897538, 0, 0.7764706, 1, 1,
0.1551585, 0.7124167, 2.226977, 0, 0.772549, 1, 1,
0.1572478, -0.5213476, -0.07882418, 0, 0.7647059, 1, 1,
0.1597579, 0.2926501, 1.388863, 0, 0.7607843, 1, 1,
0.1671847, 0.5290817, 0.2563176, 0, 0.7529412, 1, 1,
0.1695464, -0.7026749, 2.476415, 0, 0.7490196, 1, 1,
0.1698778, 0.43211, 1.400748, 0, 0.7411765, 1, 1,
0.17151, 0.9435596, 0.8825665, 0, 0.7372549, 1, 1,
0.1867309, 0.08256079, 1.141369, 0, 0.7294118, 1, 1,
0.1869429, 0.2575413, -0.9593221, 0, 0.7254902, 1, 1,
0.1883463, 2.492897, 1.873368, 0, 0.7176471, 1, 1,
0.1901001, -0.1604486, 1.773415, 0, 0.7137255, 1, 1,
0.1905013, 0.9944793, -0.02082659, 0, 0.7058824, 1, 1,
0.1981702, -0.3293509, 1.50328, 0, 0.6980392, 1, 1,
0.2006124, 2.13398, 0.2279246, 0, 0.6941177, 1, 1,
0.2007354, -0.6321549, 1.802048, 0, 0.6862745, 1, 1,
0.2032121, 1.634619, 0.9132135, 0, 0.682353, 1, 1,
0.2046013, 1.472523, 0.7109982, 0, 0.6745098, 1, 1,
0.2093216, 0.4754255, -1.172326, 0, 0.6705883, 1, 1,
0.2132064, -0.385675, 3.245318, 0, 0.6627451, 1, 1,
0.2133402, 0.5117726, 1.109869, 0, 0.6588235, 1, 1,
0.214176, 0.1415507, 1.576853, 0, 0.6509804, 1, 1,
0.2152274, 1.543947, 1.867899, 0, 0.6470588, 1, 1,
0.2213912, -1.00091, 3.55951, 0, 0.6392157, 1, 1,
0.2264624, 0.9504169, 0.5175807, 0, 0.6352941, 1, 1,
0.2285897, 1.773636, 0.7370473, 0, 0.627451, 1, 1,
0.2296405, 0.5786115, -0.8510662, 0, 0.6235294, 1, 1,
0.2339038, 0.9983941, 0.2527042, 0, 0.6156863, 1, 1,
0.2370252, -0.3022071, 2.478515, 0, 0.6117647, 1, 1,
0.2375342, 0.1239626, 2.33098, 0, 0.6039216, 1, 1,
0.2383146, -0.1619539, 3.447893, 0, 0.5960785, 1, 1,
0.2409828, -0.2505222, 3.966187, 0, 0.5921569, 1, 1,
0.2428934, 0.02857322, 2.014658, 0, 0.5843138, 1, 1,
0.244252, -2.052183, 1.794087, 0, 0.5803922, 1, 1,
0.2444259, -0.3389726, 4.104511, 0, 0.572549, 1, 1,
0.2467321, 1.10704, 1.831221, 0, 0.5686275, 1, 1,
0.24755, -0.9845847, 3.385656, 0, 0.5607843, 1, 1,
0.2482964, 0.431073, -0.2916323, 0, 0.5568628, 1, 1,
0.2493052, 0.4816965, -0.2109216, 0, 0.5490196, 1, 1,
0.2499962, 0.7890629, 1.045879, 0, 0.5450981, 1, 1,
0.2525377, 0.4574542, 1.690132, 0, 0.5372549, 1, 1,
0.2562315, -0.8510725, 1.002282, 0, 0.5333334, 1, 1,
0.260607, -1.396036, 3.252527, 0, 0.5254902, 1, 1,
0.2625426, 0.8878689, -0.1778619, 0, 0.5215687, 1, 1,
0.2650351, -1.701456, 1.727705, 0, 0.5137255, 1, 1,
0.2651909, 0.3756898, 1.642979, 0, 0.509804, 1, 1,
0.265723, -0.842107, 3.340071, 0, 0.5019608, 1, 1,
0.2660017, -1.462749, 2.511265, 0, 0.4941176, 1, 1,
0.2682249, -0.2055269, 3.1875, 0, 0.4901961, 1, 1,
0.2698254, -0.6577784, 3.214286, 0, 0.4823529, 1, 1,
0.2719878, -0.8027855, 3.474874, 0, 0.4784314, 1, 1,
0.2729111, 0.9588075, -1.566943, 0, 0.4705882, 1, 1,
0.2736942, -0.3145549, 2.748346, 0, 0.4666667, 1, 1,
0.2788331, 0.3368958, 0.6895949, 0, 0.4588235, 1, 1,
0.2819422, -0.02788909, 2.628457, 0, 0.454902, 1, 1,
0.2829259, -1.002019, 3.307747, 0, 0.4470588, 1, 1,
0.2831826, 0.903188, 1.207154, 0, 0.4431373, 1, 1,
0.2921186, 0.4985663, 0.9897065, 0, 0.4352941, 1, 1,
0.2935417, -0.3774844, 3.036046, 0, 0.4313726, 1, 1,
0.2964933, 1.196787, 0.03733218, 0, 0.4235294, 1, 1,
0.2991014, -0.6518326, 2.725808, 0, 0.4196078, 1, 1,
0.3007976, -0.3790051, 3.396672, 0, 0.4117647, 1, 1,
0.3012301, -0.2214182, 4.489301, 0, 0.4078431, 1, 1,
0.3041496, 2.401284, -0.389352, 0, 0.4, 1, 1,
0.3052323, -0.2886257, 3.342801, 0, 0.3921569, 1, 1,
0.3091134, 0.8454064, 0.06568538, 0, 0.3882353, 1, 1,
0.3104238, 1.678685, 1.022127, 0, 0.3803922, 1, 1,
0.3114648, 1.703086, 1.126658, 0, 0.3764706, 1, 1,
0.3156101, -0.6204694, 0.9196623, 0, 0.3686275, 1, 1,
0.3172776, -0.7061194, 2.993835, 0, 0.3647059, 1, 1,
0.3198007, -1.863569, 1.926486, 0, 0.3568628, 1, 1,
0.3207395, -0.6647846, 2.664522, 0, 0.3529412, 1, 1,
0.326605, -1.097722, 3.52739, 0, 0.345098, 1, 1,
0.3284738, 1.036174, -1.044746, 0, 0.3411765, 1, 1,
0.3361474, -1.298661, 3.753766, 0, 0.3333333, 1, 1,
0.3362835, -0.4817231, 2.096508, 0, 0.3294118, 1, 1,
0.3404603, 0.5757388, 0.5496728, 0, 0.3215686, 1, 1,
0.3439097, -0.2231254, 1.445877, 0, 0.3176471, 1, 1,
0.3463712, 0.277727, 0.285616, 0, 0.3098039, 1, 1,
0.3490395, -0.2125887, 2.598976, 0, 0.3058824, 1, 1,
0.353992, -1.561926, 1.925251, 0, 0.2980392, 1, 1,
0.3564705, -1.507429, 3.269571, 0, 0.2901961, 1, 1,
0.3577461, -1.378224, 2.385798, 0, 0.2862745, 1, 1,
0.3596888, 1.00554, 0.2498003, 0, 0.2784314, 1, 1,
0.3610021, -0.0820991, 3.410855, 0, 0.2745098, 1, 1,
0.36517, -0.5557715, 1.115296, 0, 0.2666667, 1, 1,
0.3691979, -0.7869868, 2.753997, 0, 0.2627451, 1, 1,
0.3708389, 0.3273104, 0.6978593, 0, 0.254902, 1, 1,
0.3721689, -0.1632724, 0.3211451, 0, 0.2509804, 1, 1,
0.3729452, -0.02826151, 1.223954, 0, 0.2431373, 1, 1,
0.3774647, 1.0295, 0.5586231, 0, 0.2392157, 1, 1,
0.3794148, -0.3582867, 3.138983, 0, 0.2313726, 1, 1,
0.3798583, -0.3621423, 1.38918, 0, 0.227451, 1, 1,
0.3844324, -0.3886611, 0.6735041, 0, 0.2196078, 1, 1,
0.3846938, 0.5072643, 0.9592417, 0, 0.2156863, 1, 1,
0.3855602, -0.05102133, 2.637974, 0, 0.2078431, 1, 1,
0.3884051, 0.5641599, 0.5543016, 0, 0.2039216, 1, 1,
0.3889591, -0.1246266, 0.7045085, 0, 0.1960784, 1, 1,
0.3932995, -1.190373, 2.117635, 0, 0.1882353, 1, 1,
0.3941043, 0.3436599, -0.9978597, 0, 0.1843137, 1, 1,
0.3949275, -0.8764688, 2.431027, 0, 0.1764706, 1, 1,
0.3952269, 0.2915572, 2.864409, 0, 0.172549, 1, 1,
0.403485, -1.254194, 3.631108, 0, 0.1647059, 1, 1,
0.4058614, 0.2129561, 0.2169547, 0, 0.1607843, 1, 1,
0.4087135, -0.7075692, 2.977355, 0, 0.1529412, 1, 1,
0.412729, -1.164695, 1.302711, 0, 0.1490196, 1, 1,
0.4165938, 1.193717, 0.7477558, 0, 0.1411765, 1, 1,
0.4178181, -0.261757, 1.223461, 0, 0.1372549, 1, 1,
0.4182375, -1.06063, 1.566411, 0, 0.1294118, 1, 1,
0.4196478, -0.6960185, 3.518855, 0, 0.1254902, 1, 1,
0.4222982, -0.1510996, 5.51936, 0, 0.1176471, 1, 1,
0.4237972, 0.04350407, 1.938359, 0, 0.1137255, 1, 1,
0.4312687, 0.489051, -0.4678221, 0, 0.1058824, 1, 1,
0.4350956, -1.012299, 3.767532, 0, 0.09803922, 1, 1,
0.4351042, 1.795588, -1.377461, 0, 0.09411765, 1, 1,
0.4393175, 0.3587653, 0.8701076, 0, 0.08627451, 1, 1,
0.4419968, -1.216159, 3.7832, 0, 0.08235294, 1, 1,
0.4461704, -1.463594, 2.00611, 0, 0.07450981, 1, 1,
0.4466376, 1.880388, -2.435498, 0, 0.07058824, 1, 1,
0.4467589, 1.393752, -1.433207, 0, 0.0627451, 1, 1,
0.4484419, 1.715256, 0.06523274, 0, 0.05882353, 1, 1,
0.4490176, -0.7036548, 2.43183, 0, 0.05098039, 1, 1,
0.4499479, 0.1393103, 1.528957, 0, 0.04705882, 1, 1,
0.4515168, -2.250241, 3.806357, 0, 0.03921569, 1, 1,
0.4521951, -0.5251526, 2.714774, 0, 0.03529412, 1, 1,
0.4553562, -0.8573214, 1.933293, 0, 0.02745098, 1, 1,
0.4559546, -0.8587856, 4.909957, 0, 0.02352941, 1, 1,
0.4582896, -0.3813277, 1.275409, 0, 0.01568628, 1, 1,
0.4598662, 0.42021, 0.8728777, 0, 0.01176471, 1, 1,
0.4634762, -0.4956786, 2.593166, 0, 0.003921569, 1, 1,
0.464053, -0.3796942, 1.551964, 0.003921569, 0, 1, 1,
0.4648056, -0.7032048, 2.144078, 0.007843138, 0, 1, 1,
0.4667001, 0.05033414, 1.840965, 0.01568628, 0, 1, 1,
0.473133, -0.1202082, 3.277099, 0.01960784, 0, 1, 1,
0.4736299, -2.021963, 2.451489, 0.02745098, 0, 1, 1,
0.4766583, 0.7769144, 0.09243999, 0.03137255, 0, 1, 1,
0.4804053, 1.425418, 1.506873, 0.03921569, 0, 1, 1,
0.4809458, -0.6050521, 3.735032, 0.04313726, 0, 1, 1,
0.4825664, -0.5479258, 2.310924, 0.05098039, 0, 1, 1,
0.4846308, 0.1578574, -0.6274562, 0.05490196, 0, 1, 1,
0.4866127, 0.9380689, 1.23799, 0.0627451, 0, 1, 1,
0.4918626, 1.229493, -0.4860503, 0.06666667, 0, 1, 1,
0.4927449, -0.1468771, 2.218246, 0.07450981, 0, 1, 1,
0.4983143, 0.02772977, 3.771091, 0.07843138, 0, 1, 1,
0.5001741, 0.6152694, 0.09832635, 0.08627451, 0, 1, 1,
0.500824, -0.7933549, 2.284383, 0.09019608, 0, 1, 1,
0.503968, -0.7726132, 2.973208, 0.09803922, 0, 1, 1,
0.50462, 1.939718, 0.160186, 0.1058824, 0, 1, 1,
0.5061781, 1.045918, 0.2225727, 0.1098039, 0, 1, 1,
0.5098267, -2.016781, 3.556659, 0.1176471, 0, 1, 1,
0.510524, 0.3965469, 2.010417, 0.1215686, 0, 1, 1,
0.512767, 0.2079728, 0.2018217, 0.1294118, 0, 1, 1,
0.5133516, 0.4024353, -0.8026447, 0.1333333, 0, 1, 1,
0.5144796, 0.2409988, -2.633304, 0.1411765, 0, 1, 1,
0.5145078, 0.9564428, 1.177152, 0.145098, 0, 1, 1,
0.515013, 1.080152, 0.05214658, 0.1529412, 0, 1, 1,
0.5154325, 0.5001543, 1.770378, 0.1568628, 0, 1, 1,
0.5169789, 0.3912703, 2.037128, 0.1647059, 0, 1, 1,
0.5192018, 1.961111, 0.08431592, 0.1686275, 0, 1, 1,
0.5192081, -1.408941, 3.087491, 0.1764706, 0, 1, 1,
0.5193527, -1.43048, 3.784141, 0.1803922, 0, 1, 1,
0.5197138, 0.252075, 2.237369, 0.1882353, 0, 1, 1,
0.5198136, -0.288413, 0.7840725, 0.1921569, 0, 1, 1,
0.5201816, 0.1097844, 1.878959, 0.2, 0, 1, 1,
0.5212615, 1.209761, -0.5738036, 0.2078431, 0, 1, 1,
0.5258668, 0.6165157, -1.853751, 0.2117647, 0, 1, 1,
0.5286626, -0.7382003, 3.686381, 0.2196078, 0, 1, 1,
0.5301892, 0.9457963, 0.618418, 0.2235294, 0, 1, 1,
0.5315006, 0.2252411, 1.6421, 0.2313726, 0, 1, 1,
0.5315863, -1.400498, 1.951707, 0.2352941, 0, 1, 1,
0.5361278, 0.7693049, -0.3552226, 0.2431373, 0, 1, 1,
0.5373496, 0.1281467, 2.942202, 0.2470588, 0, 1, 1,
0.5383097, -1.336345, 2.541215, 0.254902, 0, 1, 1,
0.5418078, 0.4189725, -1.164774, 0.2588235, 0, 1, 1,
0.5418962, -0.7672962, 2.191921, 0.2666667, 0, 1, 1,
0.5426593, -0.6483148, 3.34507, 0.2705882, 0, 1, 1,
0.5449424, 1.569028, -0.575826, 0.2784314, 0, 1, 1,
0.5526186, -0.141611, 1.034448, 0.282353, 0, 1, 1,
0.5534195, 0.5763612, 0.8957176, 0.2901961, 0, 1, 1,
0.5549571, -0.236647, 0.06288894, 0.2941177, 0, 1, 1,
0.5572405, -0.02503708, 0.8009401, 0.3019608, 0, 1, 1,
0.5617127, 0.330654, 0.2970393, 0.3098039, 0, 1, 1,
0.5625505, 0.2204446, 0.6126499, 0.3137255, 0, 1, 1,
0.5652046, -0.7257277, 3.810782, 0.3215686, 0, 1, 1,
0.5666285, 0.9722661, 0.1522917, 0.3254902, 0, 1, 1,
0.5693349, -1.535071, 2.892184, 0.3333333, 0, 1, 1,
0.5711215, -0.9296086, 2.911736, 0.3372549, 0, 1, 1,
0.5789438, 0.4368868, -0.07657966, 0.345098, 0, 1, 1,
0.5812739, -1.645288, 2.497698, 0.3490196, 0, 1, 1,
0.5839877, 1.977162, 0.9207744, 0.3568628, 0, 1, 1,
0.5877092, -0.998529, 3.043726, 0.3607843, 0, 1, 1,
0.59684, 1.827843, -0.2877609, 0.3686275, 0, 1, 1,
0.5983308, -0.2315374, 0.764969, 0.372549, 0, 1, 1,
0.5988448, 0.255035, 1.611131, 0.3803922, 0, 1, 1,
0.6015405, 2.358334, -1.341224, 0.3843137, 0, 1, 1,
0.6027812, 1.806954, 0.06856137, 0.3921569, 0, 1, 1,
0.6074471, 0.3797236, -1.37998, 0.3960784, 0, 1, 1,
0.6114939, 0.4651032, 1.551849, 0.4039216, 0, 1, 1,
0.6169678, -0.7819976, 1.11622, 0.4117647, 0, 1, 1,
0.6183235, -1.758989, 1.71386, 0.4156863, 0, 1, 1,
0.6196947, 0.3842032, -1.120088, 0.4235294, 0, 1, 1,
0.62101, 0.2201558, -0.4319744, 0.427451, 0, 1, 1,
0.6222156, -1.190497, 2.428129, 0.4352941, 0, 1, 1,
0.6243085, -0.169351, 1.465423, 0.4392157, 0, 1, 1,
0.6284032, -0.5011652, -0.1412698, 0.4470588, 0, 1, 1,
0.6305186, 0.7586242, -0.1544006, 0.4509804, 0, 1, 1,
0.6308713, -0.8517006, 2.541428, 0.4588235, 0, 1, 1,
0.6385677, 2.09373, 1.72178, 0.4627451, 0, 1, 1,
0.6442041, -1.727792, 0.6340908, 0.4705882, 0, 1, 1,
0.6449842, -0.9547656, 1.507874, 0.4745098, 0, 1, 1,
0.646294, 0.4757158, 1.364015, 0.4823529, 0, 1, 1,
0.6543116, 0.4448576, 0.1684554, 0.4862745, 0, 1, 1,
0.657109, -0.4882267, 2.231263, 0.4941176, 0, 1, 1,
0.6625592, 1.241972, 0.8444527, 0.5019608, 0, 1, 1,
0.6659644, -0.4270356, 3.517043, 0.5058824, 0, 1, 1,
0.6662089, 1.229609, -0.4255348, 0.5137255, 0, 1, 1,
0.6670474, 0.419506, 1.676162, 0.5176471, 0, 1, 1,
0.6683177, -0.1477632, 1.84169, 0.5254902, 0, 1, 1,
0.6721826, -0.1915552, 2.959075, 0.5294118, 0, 1, 1,
0.6738225, 0.06171671, 1.120223, 0.5372549, 0, 1, 1,
0.6760585, 1.230568, -0.9849172, 0.5411765, 0, 1, 1,
0.6786725, 1.215985, -0.1245825, 0.5490196, 0, 1, 1,
0.6818707, 1.759047, 0.1440566, 0.5529412, 0, 1, 1,
0.6824035, 0.06749463, 0.4472346, 0.5607843, 0, 1, 1,
0.6866815, -0.6515749, 2.818456, 0.5647059, 0, 1, 1,
0.6874533, 1.249944, 0.7213368, 0.572549, 0, 1, 1,
0.6877599, -0.688522, 0.6282048, 0.5764706, 0, 1, 1,
0.6907234, -0.7616239, 3.667372, 0.5843138, 0, 1, 1,
0.6987432, -0.5905823, 4.361777, 0.5882353, 0, 1, 1,
0.700425, -1.278069, 2.345123, 0.5960785, 0, 1, 1,
0.7039358, -1.077281, 2.188248, 0.6039216, 0, 1, 1,
0.7142212, 0.005362017, 0.7484915, 0.6078432, 0, 1, 1,
0.7160653, 1.115065, 3.066719, 0.6156863, 0, 1, 1,
0.7178553, -0.7756152, 0.9266408, 0.6196079, 0, 1, 1,
0.718338, 0.06908407, 2.216097, 0.627451, 0, 1, 1,
0.7204062, -1.621769, 3.550048, 0.6313726, 0, 1, 1,
0.7240866, 0.5969765, 1.482226, 0.6392157, 0, 1, 1,
0.7285243, 1.224256, 0.7574402, 0.6431373, 0, 1, 1,
0.7297042, 0.4689827, 0.1175928, 0.6509804, 0, 1, 1,
0.7307588, 0.2874418, 0.4212278, 0.654902, 0, 1, 1,
0.7324628, -0.1096629, 3.006904, 0.6627451, 0, 1, 1,
0.7343378, 1.438277, 1.848463, 0.6666667, 0, 1, 1,
0.7344918, 1.425646, 1.234384, 0.6745098, 0, 1, 1,
0.7361127, 0.3553628, 0.9816148, 0.6784314, 0, 1, 1,
0.7378771, 2.920579, -0.3904658, 0.6862745, 0, 1, 1,
0.7466841, 0.3141792, 1.388369, 0.6901961, 0, 1, 1,
0.7473653, 1.448587, 0.6701875, 0.6980392, 0, 1, 1,
0.7494195, 2.859708, -0.3939309, 0.7058824, 0, 1, 1,
0.750231, -1.409777, 3.616891, 0.7098039, 0, 1, 1,
0.75669, -0.4557758, 1.993367, 0.7176471, 0, 1, 1,
0.7655652, -0.4723385, 2.242393, 0.7215686, 0, 1, 1,
0.7705136, 0.6201823, -0.7963576, 0.7294118, 0, 1, 1,
0.775064, -0.2167534, 0.1958076, 0.7333333, 0, 1, 1,
0.7782047, 0.1142011, -0.04740448, 0.7411765, 0, 1, 1,
0.7787886, -0.9918792, 3.368918, 0.7450981, 0, 1, 1,
0.7788761, 0.952202, 0.1156268, 0.7529412, 0, 1, 1,
0.7809731, -1.30678, 2.574117, 0.7568628, 0, 1, 1,
0.7852131, 0.3677054, 0.8678277, 0.7647059, 0, 1, 1,
0.7891357, 0.1978718, 1.405821, 0.7686275, 0, 1, 1,
0.7933391, 0.1701941, 0.351778, 0.7764706, 0, 1, 1,
0.7954425, 2.330923, 0.06501189, 0.7803922, 0, 1, 1,
0.8019602, -0.563248, 1.123, 0.7882353, 0, 1, 1,
0.805531, 1.121557, -1.331508, 0.7921569, 0, 1, 1,
0.806888, 0.2794167, 0.4601008, 0.8, 0, 1, 1,
0.809808, -1.071031, 2.139697, 0.8078431, 0, 1, 1,
0.8144812, 0.2681205, 0.04227986, 0.8117647, 0, 1, 1,
0.8167061, -0.6486644, 1.927405, 0.8196079, 0, 1, 1,
0.8200233, -1.482164, 4.378019, 0.8235294, 0, 1, 1,
0.8300859, 0.02415113, 2.472911, 0.8313726, 0, 1, 1,
0.8316688, -1.082702, 3.808148, 0.8352941, 0, 1, 1,
0.8338243, 1.785739, 0.9393908, 0.8431373, 0, 1, 1,
0.8350257, 0.04301882, 1.576, 0.8470588, 0, 1, 1,
0.8380293, -0.2353028, 0.6515077, 0.854902, 0, 1, 1,
0.8389902, 0.4745765, 0.9694675, 0.8588235, 0, 1, 1,
0.8483953, -0.07051993, 1.580734, 0.8666667, 0, 1, 1,
0.8505591, -1.116983, 1.876587, 0.8705882, 0, 1, 1,
0.8542164, -2.068198, 1.249287, 0.8784314, 0, 1, 1,
0.8611474, 0.1296578, 2.31071, 0.8823529, 0, 1, 1,
0.8675991, 0.7878041, 0.04266347, 0.8901961, 0, 1, 1,
0.8686748, 0.1355162, 0.9776932, 0.8941177, 0, 1, 1,
0.8805639, -0.07332133, 2.847157, 0.9019608, 0, 1, 1,
0.8823949, -1.551021, 4.279382, 0.9098039, 0, 1, 1,
0.8856758, -1.495749, 2.761936, 0.9137255, 0, 1, 1,
0.8867275, -1.305113, 4.569182, 0.9215686, 0, 1, 1,
0.8880081, 1.866834, -0.3160698, 0.9254902, 0, 1, 1,
0.8924868, -0.8982186, 4.620058, 0.9333333, 0, 1, 1,
0.8945637, -0.6401532, 2.903898, 0.9372549, 0, 1, 1,
0.8951481, 1.129838, 0.285025, 0.945098, 0, 1, 1,
0.8955675, 1.796921, 0.6609253, 0.9490196, 0, 1, 1,
0.8989581, -1.087957, 3.830781, 0.9568627, 0, 1, 1,
0.901796, 0.9790014, 0.5192687, 0.9607843, 0, 1, 1,
0.9043438, 0.8932176, 1.150364, 0.9686275, 0, 1, 1,
0.9071443, 1.998531, -0.6719249, 0.972549, 0, 1, 1,
0.9108484, -0.7113577, 3.535495, 0.9803922, 0, 1, 1,
0.9163489, -0.6794782, 3.334911, 0.9843137, 0, 1, 1,
0.9184185, -0.3557738, 1.486644, 0.9921569, 0, 1, 1,
0.9202632, 0.4823427, 1.779925, 0.9960784, 0, 1, 1,
0.922681, -0.9914914, 4.142872, 1, 0, 0.9960784, 1,
0.922937, -0.08885135, 1.628365, 1, 0, 0.9882353, 1,
0.9364635, -0.7916748, 1.974816, 1, 0, 0.9843137, 1,
0.9368293, 1.758997, 0.6394805, 1, 0, 0.9764706, 1,
0.9402196, 1.453949, 1.432237, 1, 0, 0.972549, 1,
0.9404461, 1.446305, 2.074576, 1, 0, 0.9647059, 1,
0.9465894, -0.699342, 2.393196, 1, 0, 0.9607843, 1,
0.9487656, -0.3810724, 1.860286, 1, 0, 0.9529412, 1,
0.9562263, 0.4585733, 1.293184, 1, 0, 0.9490196, 1,
0.9625988, -1.61099, 2.404649, 1, 0, 0.9411765, 1,
0.967935, 0.05134594, 1.187009, 1, 0, 0.9372549, 1,
0.9978248, 0.5647572, 0.5224786, 1, 0, 0.9294118, 1,
1.000111, -0.5527544, 2.315921, 1, 0, 0.9254902, 1,
1.006849, 1.274901, 0.8740687, 1, 0, 0.9176471, 1,
1.009709, -1.488509, 2.190875, 1, 0, 0.9137255, 1,
1.013496, -1.507205, 0.8371434, 1, 0, 0.9058824, 1,
1.019238, -0.3689696, 3.332584, 1, 0, 0.9019608, 1,
1.019789, 0.7070527, 1.169492, 1, 0, 0.8941177, 1,
1.025114, 1.810011, -0.5522521, 1, 0, 0.8862745, 1,
1.028295, 0.4216628, 1.376302, 1, 0, 0.8823529, 1,
1.035928, 0.8538287, 3.083118, 1, 0, 0.8745098, 1,
1.035978, 1.061019, 2.36152, 1, 0, 0.8705882, 1,
1.04026, -0.5878332, 1.791021, 1, 0, 0.8627451, 1,
1.041383, 0.5741582, 2.060474, 1, 0, 0.8588235, 1,
1.054259, -0.06203417, 1.389081, 1, 0, 0.8509804, 1,
1.05459, -0.6936294, 1.820914, 1, 0, 0.8470588, 1,
1.055843, 0.5048292, 0.9790837, 1, 0, 0.8392157, 1,
1.056935, 0.7434319, -0.1074951, 1, 0, 0.8352941, 1,
1.058135, -1.696263, 2.108356, 1, 0, 0.827451, 1,
1.062189, -1.111919, 2.72999, 1, 0, 0.8235294, 1,
1.068949, 1.126799, -0.1268752, 1, 0, 0.8156863, 1,
1.071042, 0.2152964, 0.5758824, 1, 0, 0.8117647, 1,
1.078175, -0.6413372, 3.155722, 1, 0, 0.8039216, 1,
1.079721, -0.7083131, 1.673796, 1, 0, 0.7960784, 1,
1.08548, -2.376083, 2.960729, 1, 0, 0.7921569, 1,
1.090796, -0.3189993, 2.40913, 1, 0, 0.7843137, 1,
1.097471, 1.836703, -0.5248442, 1, 0, 0.7803922, 1,
1.099922, -0.7411966, 2.269006, 1, 0, 0.772549, 1,
1.109999, -0.4703359, 2.040532, 1, 0, 0.7686275, 1,
1.110461, -0.6806614, 1.95205, 1, 0, 0.7607843, 1,
1.112095, 0.3725615, 0.3185507, 1, 0, 0.7568628, 1,
1.121649, -0.2990222, 1.850325, 1, 0, 0.7490196, 1,
1.12459, 1.16515, 0.4717083, 1, 0, 0.7450981, 1,
1.126016, 2.456178, 1.17633, 1, 0, 0.7372549, 1,
1.137836, -1.142456, 3.8665, 1, 0, 0.7333333, 1,
1.173517, 1.664882, 1.348096, 1, 0, 0.7254902, 1,
1.18211, 1.399231, 1.967454, 1, 0, 0.7215686, 1,
1.194089, -0.9843165, 0.8977221, 1, 0, 0.7137255, 1,
1.207277, 1.872599, 0.8097642, 1, 0, 0.7098039, 1,
1.216017, -0.3157587, 1.592323, 1, 0, 0.7019608, 1,
1.218189, 0.4515378, 2.796282, 1, 0, 0.6941177, 1,
1.232509, -0.2094333, 1.855957, 1, 0, 0.6901961, 1,
1.236532, 0.07676584, 1.931436, 1, 0, 0.682353, 1,
1.238824, 0.8906723, 1.792116, 1, 0, 0.6784314, 1,
1.240029, 0.2704728, 1.800206, 1, 0, 0.6705883, 1,
1.2402, -2.324238, 2.627997, 1, 0, 0.6666667, 1,
1.245844, -0.2936097, 1.511214, 1, 0, 0.6588235, 1,
1.251258, -1.712781, 1.666889, 1, 0, 0.654902, 1,
1.260949, 0.06482454, 1.112068, 1, 0, 0.6470588, 1,
1.26281, -1.850545, 3.385424, 1, 0, 0.6431373, 1,
1.277609, 0.2258482, 2.129294, 1, 0, 0.6352941, 1,
1.285006, 1.174568, 1.223257, 1, 0, 0.6313726, 1,
1.286486, 1.341377, 0.4991451, 1, 0, 0.6235294, 1,
1.289712, 0.7808892, 1.115561, 1, 0, 0.6196079, 1,
1.289833, -0.3923672, 1.886754, 1, 0, 0.6117647, 1,
1.291305, -0.2074906, 2.776127, 1, 0, 0.6078432, 1,
1.291534, -0.02992867, 0.5228009, 1, 0, 0.6, 1,
1.293415, -0.9159311, 2.361473, 1, 0, 0.5921569, 1,
1.293687, -0.1432737, 1.319789, 1, 0, 0.5882353, 1,
1.296824, -1.229161, 2.353567, 1, 0, 0.5803922, 1,
1.307816, 0.8141985, 2.178239, 1, 0, 0.5764706, 1,
1.314864, 0.7267579, 0.3078911, 1, 0, 0.5686275, 1,
1.315027, 0.2410171, 1.409976, 1, 0, 0.5647059, 1,
1.315723, 0.8671846, 1.963425, 1, 0, 0.5568628, 1,
1.317932, -0.7061552, 1.29771, 1, 0, 0.5529412, 1,
1.327733, -1.210868, 3.209875, 1, 0, 0.5450981, 1,
1.329762, -0.08411751, 3.192912, 1, 0, 0.5411765, 1,
1.329925, 0.5135043, 0.4917318, 1, 0, 0.5333334, 1,
1.329944, 1.071988, 1.159471, 1, 0, 0.5294118, 1,
1.332831, -1.545829, 3.379762, 1, 0, 0.5215687, 1,
1.341193, -0.6248022, 1.690595, 1, 0, 0.5176471, 1,
1.34867, -2.095734, 1.937079, 1, 0, 0.509804, 1,
1.350113, -0.8716757, 1.333966, 1, 0, 0.5058824, 1,
1.352996, -0.5145709, 3.074664, 1, 0, 0.4980392, 1,
1.359748, -1.147544, 3.972183, 1, 0, 0.4901961, 1,
1.36014, -1.927948, 4.456935, 1, 0, 0.4862745, 1,
1.363374, 0.3266251, 2.428953, 1, 0, 0.4784314, 1,
1.367053, 1.132077, -1.31584, 1, 0, 0.4745098, 1,
1.385107, -0.5511031, 1.802895, 1, 0, 0.4666667, 1,
1.387465, 0.1570216, 1.187918, 1, 0, 0.4627451, 1,
1.388104, 0.57552, 1.528694, 1, 0, 0.454902, 1,
1.390924, -0.9683012, 0.7148697, 1, 0, 0.4509804, 1,
1.399233, -2.021555, 2.671344, 1, 0, 0.4431373, 1,
1.40603, -0.6085052, 0.3872392, 1, 0, 0.4392157, 1,
1.415667, 1.119018, -0.8259007, 1, 0, 0.4313726, 1,
1.415721, 1.025471, 0.939678, 1, 0, 0.427451, 1,
1.430639, -1.009814, 2.934956, 1, 0, 0.4196078, 1,
1.432257, -1.030234, 3.7636, 1, 0, 0.4156863, 1,
1.437236, 0.07225402, 0.2405327, 1, 0, 0.4078431, 1,
1.438027, -1.718488, 2.52197, 1, 0, 0.4039216, 1,
1.472936, 0.8296438, 2.198728, 1, 0, 0.3960784, 1,
1.481146, -0.6724845, 1.070039, 1, 0, 0.3882353, 1,
1.485662, -0.2855004, 1.105217, 1, 0, 0.3843137, 1,
1.505807, -0.3349781, 1.390896, 1, 0, 0.3764706, 1,
1.516948, 0.7122059, 0.7344953, 1, 0, 0.372549, 1,
1.518909, 0.623462, -0.5710785, 1, 0, 0.3647059, 1,
1.52775, 0.2702177, 0.7827919, 1, 0, 0.3607843, 1,
1.528321, 0.8880429, 0.7860247, 1, 0, 0.3529412, 1,
1.536949, -0.1662035, 1.470966, 1, 0, 0.3490196, 1,
1.558643, 1.217212, 1.693566, 1, 0, 0.3411765, 1,
1.575796, -0.002939273, 1.432753, 1, 0, 0.3372549, 1,
1.578394, -1.320744, 2.637925, 1, 0, 0.3294118, 1,
1.579833, -0.5825875, 1.509969, 1, 0, 0.3254902, 1,
1.58248, -1.345719, 3.389018, 1, 0, 0.3176471, 1,
1.597529, -1.394474, 2.107458, 1, 0, 0.3137255, 1,
1.612257, 0.002466541, 1.071359, 1, 0, 0.3058824, 1,
1.621801, 0.3582599, 0.5950398, 1, 0, 0.2980392, 1,
1.65982, -0.9088832, 2.35317, 1, 0, 0.2941177, 1,
1.660443, -0.0447475, 0.5079753, 1, 0, 0.2862745, 1,
1.661888, -0.2702208, 1.355283, 1, 0, 0.282353, 1,
1.669337, -0.5296009, 3.520154, 1, 0, 0.2745098, 1,
1.677716, 2.307215, -0.5234417, 1, 0, 0.2705882, 1,
1.687624, 0.3587731, -1.774694, 1, 0, 0.2627451, 1,
1.720093, 0.994071, 3.259426, 1, 0, 0.2588235, 1,
1.731882, -0.4145478, 2.43073, 1, 0, 0.2509804, 1,
1.73968, 2.594669, 0.3701345, 1, 0, 0.2470588, 1,
1.742676, 0.1438833, 1.158976, 1, 0, 0.2392157, 1,
1.75216, -0.2730608, 2.057146, 1, 0, 0.2352941, 1,
1.752884, 0.371315, 2.288519, 1, 0, 0.227451, 1,
1.767484, -0.03009651, 1.092802, 1, 0, 0.2235294, 1,
1.777022, 0.7522618, 0.7133194, 1, 0, 0.2156863, 1,
1.777302, 0.1633941, 1.894371, 1, 0, 0.2117647, 1,
1.78042, 0.8853214, 1.6201, 1, 0, 0.2039216, 1,
1.78191, 0.03560498, 2.138948, 1, 0, 0.1960784, 1,
1.84323, -0.6200244, 1.225397, 1, 0, 0.1921569, 1,
1.882185, -0.3404823, 1.542635, 1, 0, 0.1843137, 1,
1.888103, -0.3134182, 1.171332, 1, 0, 0.1803922, 1,
1.939233, -0.1718601, 1.815023, 1, 0, 0.172549, 1,
1.943456, 0.5257239, 1.091733, 1, 0, 0.1686275, 1,
1.949294, 0.3303505, 1.448682, 1, 0, 0.1607843, 1,
1.979472, -0.3173184, 2.628256, 1, 0, 0.1568628, 1,
1.982667, -0.3693218, 2.783055, 1, 0, 0.1490196, 1,
1.998073, 0.6991138, 0.2270762, 1, 0, 0.145098, 1,
2.06199, 1.431752, 0.8358428, 1, 0, 0.1372549, 1,
2.088884, -1.282268, 3.051921, 1, 0, 0.1333333, 1,
2.091866, 0.2086928, 1.303499, 1, 0, 0.1254902, 1,
2.138274, 0.5275888, -0.5332309, 1, 0, 0.1215686, 1,
2.174832, 0.1187587, 1.948637, 1, 0, 0.1137255, 1,
2.210602, -0.240861, 3.113799, 1, 0, 0.1098039, 1,
2.222964, -0.1157551, 2.415674, 1, 0, 0.1019608, 1,
2.241503, -0.4705734, 0.7572441, 1, 0, 0.09411765, 1,
2.263214, 0.1184162, 2.640997, 1, 0, 0.09019608, 1,
2.293495, 0.4068324, 0.3181106, 1, 0, 0.08235294, 1,
2.297845, -0.5956195, 2.975835, 1, 0, 0.07843138, 1,
2.332132, 0.08751847, 1.655357, 1, 0, 0.07058824, 1,
2.364549, -1.290021, 2.865864, 1, 0, 0.06666667, 1,
2.377383, -0.1483493, 2.136921, 1, 0, 0.05882353, 1,
2.47012, -1.100027, 0.3381402, 1, 0, 0.05490196, 1,
2.527399, -0.01278556, -0.6012934, 1, 0, 0.04705882, 1,
2.535859, 2.487374, 1.726667, 1, 0, 0.04313726, 1,
2.618855, -0.7258465, 1.447156, 1, 0, 0.03529412, 1,
2.65676, 0.1015562, 2.223732, 1, 0, 0.03137255, 1,
2.65754, -0.9133469, 2.224627, 1, 0, 0.02352941, 1,
2.668723, -1.262768, 2.586459, 1, 0, 0.01960784, 1,
3.016104, 0.6514872, 1.674664, 1, 0, 0.01176471, 1,
3.066927, 0.005164069, 1.278116, 1, 0, 0.007843138, 1
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
-0.1436424, -3.324129, -7.801735, 0, -0.5, 0.5, 0.5,
-0.1436424, -3.324129, -7.801735, 1, -0.5, 0.5, 0.5,
-0.1436424, -3.324129, -7.801735, 1, 1.5, 0.5, 0.5,
-0.1436424, -3.324129, -7.801735, 0, 1.5, 0.5, 0.5
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
-4.442595, 0.2507597, -7.801735, 0, -0.5, 0.5, 0.5,
-4.442595, 0.2507597, -7.801735, 1, -0.5, 0.5, 0.5,
-4.442595, 0.2507597, -7.801735, 1, 1.5, 0.5, 0.5,
-4.442595, 0.2507597, -7.801735, 0, 1.5, 0.5, 0.5
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
-4.442595, -3.324129, -0.1758497, 0, -0.5, 0.5, 0.5,
-4.442595, -3.324129, -0.1758497, 1, -0.5, 0.5, 0.5,
-4.442595, -3.324129, -0.1758497, 1, 1.5, 0.5, 0.5,
-4.442595, -3.324129, -0.1758497, 0, 1.5, 0.5, 0.5
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
-3, -2.499155, -6.041916,
3, -2.499155, -6.041916,
-3, -2.499155, -6.041916,
-3, -2.63665, -6.335219,
-2, -2.499155, -6.041916,
-2, -2.63665, -6.335219,
-1, -2.499155, -6.041916,
-1, -2.63665, -6.335219,
0, -2.499155, -6.041916,
0, -2.63665, -6.335219,
1, -2.499155, -6.041916,
1, -2.63665, -6.335219,
2, -2.499155, -6.041916,
2, -2.63665, -6.335219,
3, -2.499155, -6.041916,
3, -2.63665, -6.335219
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
-3, -2.911642, -6.921825, 0, -0.5, 0.5, 0.5,
-3, -2.911642, -6.921825, 1, -0.5, 0.5, 0.5,
-3, -2.911642, -6.921825, 1, 1.5, 0.5, 0.5,
-3, -2.911642, -6.921825, 0, 1.5, 0.5, 0.5,
-2, -2.911642, -6.921825, 0, -0.5, 0.5, 0.5,
-2, -2.911642, -6.921825, 1, -0.5, 0.5, 0.5,
-2, -2.911642, -6.921825, 1, 1.5, 0.5, 0.5,
-2, -2.911642, -6.921825, 0, 1.5, 0.5, 0.5,
-1, -2.911642, -6.921825, 0, -0.5, 0.5, 0.5,
-1, -2.911642, -6.921825, 1, -0.5, 0.5, 0.5,
-1, -2.911642, -6.921825, 1, 1.5, 0.5, 0.5,
-1, -2.911642, -6.921825, 0, 1.5, 0.5, 0.5,
0, -2.911642, -6.921825, 0, -0.5, 0.5, 0.5,
0, -2.911642, -6.921825, 1, -0.5, 0.5, 0.5,
0, -2.911642, -6.921825, 1, 1.5, 0.5, 0.5,
0, -2.911642, -6.921825, 0, 1.5, 0.5, 0.5,
1, -2.911642, -6.921825, 0, -0.5, 0.5, 0.5,
1, -2.911642, -6.921825, 1, -0.5, 0.5, 0.5,
1, -2.911642, -6.921825, 1, 1.5, 0.5, 0.5,
1, -2.911642, -6.921825, 0, 1.5, 0.5, 0.5,
2, -2.911642, -6.921825, 0, -0.5, 0.5, 0.5,
2, -2.911642, -6.921825, 1, -0.5, 0.5, 0.5,
2, -2.911642, -6.921825, 1, 1.5, 0.5, 0.5,
2, -2.911642, -6.921825, 0, 1.5, 0.5, 0.5,
3, -2.911642, -6.921825, 0, -0.5, 0.5, 0.5,
3, -2.911642, -6.921825, 1, -0.5, 0.5, 0.5,
3, -2.911642, -6.921825, 1, 1.5, 0.5, 0.5,
3, -2.911642, -6.921825, 0, 1.5, 0.5, 0.5
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
-3.450529, -2, -6.041916,
-3.450529, 2, -6.041916,
-3.450529, -2, -6.041916,
-3.615874, -2, -6.335219,
-3.450529, -1, -6.041916,
-3.615874, -1, -6.335219,
-3.450529, 0, -6.041916,
-3.615874, 0, -6.335219,
-3.450529, 1, -6.041916,
-3.615874, 1, -6.335219,
-3.450529, 2, -6.041916,
-3.615874, 2, -6.335219
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
-3.946562, -2, -6.921825, 0, -0.5, 0.5, 0.5,
-3.946562, -2, -6.921825, 1, -0.5, 0.5, 0.5,
-3.946562, -2, -6.921825, 1, 1.5, 0.5, 0.5,
-3.946562, -2, -6.921825, 0, 1.5, 0.5, 0.5,
-3.946562, -1, -6.921825, 0, -0.5, 0.5, 0.5,
-3.946562, -1, -6.921825, 1, -0.5, 0.5, 0.5,
-3.946562, -1, -6.921825, 1, 1.5, 0.5, 0.5,
-3.946562, -1, -6.921825, 0, 1.5, 0.5, 0.5,
-3.946562, 0, -6.921825, 0, -0.5, 0.5, 0.5,
-3.946562, 0, -6.921825, 1, -0.5, 0.5, 0.5,
-3.946562, 0, -6.921825, 1, 1.5, 0.5, 0.5,
-3.946562, 0, -6.921825, 0, 1.5, 0.5, 0.5,
-3.946562, 1, -6.921825, 0, -0.5, 0.5, 0.5,
-3.946562, 1, -6.921825, 1, -0.5, 0.5, 0.5,
-3.946562, 1, -6.921825, 1, 1.5, 0.5, 0.5,
-3.946562, 1, -6.921825, 0, 1.5, 0.5, 0.5,
-3.946562, 2, -6.921825, 0, -0.5, 0.5, 0.5,
-3.946562, 2, -6.921825, 1, -0.5, 0.5, 0.5,
-3.946562, 2, -6.921825, 1, 1.5, 0.5, 0.5,
-3.946562, 2, -6.921825, 0, 1.5, 0.5, 0.5
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
-3.450529, -2.499155, -4,
-3.450529, -2.499155, 4,
-3.450529, -2.499155, -4,
-3.615874, -2.63665, -4,
-3.450529, -2.499155, -2,
-3.615874, -2.63665, -2,
-3.450529, -2.499155, 0,
-3.615874, -2.63665, 0,
-3.450529, -2.499155, 2,
-3.615874, -2.63665, 2,
-3.450529, -2.499155, 4,
-3.615874, -2.63665, 4
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
-3.946562, -2.911642, -4, 0, -0.5, 0.5, 0.5,
-3.946562, -2.911642, -4, 1, -0.5, 0.5, 0.5,
-3.946562, -2.911642, -4, 1, 1.5, 0.5, 0.5,
-3.946562, -2.911642, -4, 0, 1.5, 0.5, 0.5,
-3.946562, -2.911642, -2, 0, -0.5, 0.5, 0.5,
-3.946562, -2.911642, -2, 1, -0.5, 0.5, 0.5,
-3.946562, -2.911642, -2, 1, 1.5, 0.5, 0.5,
-3.946562, -2.911642, -2, 0, 1.5, 0.5, 0.5,
-3.946562, -2.911642, 0, 0, -0.5, 0.5, 0.5,
-3.946562, -2.911642, 0, 1, -0.5, 0.5, 0.5,
-3.946562, -2.911642, 0, 1, 1.5, 0.5, 0.5,
-3.946562, -2.911642, 0, 0, 1.5, 0.5, 0.5,
-3.946562, -2.911642, 2, 0, -0.5, 0.5, 0.5,
-3.946562, -2.911642, 2, 1, -0.5, 0.5, 0.5,
-3.946562, -2.911642, 2, 1, 1.5, 0.5, 0.5,
-3.946562, -2.911642, 2, 0, 1.5, 0.5, 0.5,
-3.946562, -2.911642, 4, 0, -0.5, 0.5, 0.5,
-3.946562, -2.911642, 4, 1, -0.5, 0.5, 0.5,
-3.946562, -2.911642, 4, 1, 1.5, 0.5, 0.5,
-3.946562, -2.911642, 4, 0, 1.5, 0.5, 0.5
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
-3.450529, -2.499155, -6.041916,
-3.450529, 3.000674, -6.041916,
-3.450529, -2.499155, 5.690217,
-3.450529, 3.000674, 5.690217,
-3.450529, -2.499155, -6.041916,
-3.450529, -2.499155, 5.690217,
-3.450529, 3.000674, -6.041916,
-3.450529, 3.000674, 5.690217,
-3.450529, -2.499155, -6.041916,
3.163244, -2.499155, -6.041916,
-3.450529, -2.499155, 5.690217,
3.163244, -2.499155, 5.690217,
-3.450529, 3.000674, -6.041916,
3.163244, 3.000674, -6.041916,
-3.450529, 3.000674, 5.690217,
3.163244, 3.000674, 5.690217,
3.163244, -2.499155, -6.041916,
3.163244, 3.000674, -6.041916,
3.163244, -2.499155, 5.690217,
3.163244, 3.000674, 5.690217,
3.163244, -2.499155, -6.041916,
3.163244, -2.499155, 5.690217,
3.163244, 3.000674, -6.041916,
3.163244, 3.000674, 5.690217
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
var radius = 7.768143;
var distance = 34.56134;
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
mvMatrix.translate( 0.1436424, -0.2507597, 0.1758497 );
mvMatrix.scale( 1.269936, 1.527151, 0.715903 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.56134);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
cacodylate_ion<-read.table("cacodylate_ion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cacodylate_ion$V2
```

```
## Error in eval(expr, envir, enclos): object 'cacodylate_ion' not found
```

```r
y<-cacodylate_ion$V3
```

```
## Error in eval(expr, envir, enclos): object 'cacodylate_ion' not found
```

```r
z<-cacodylate_ion$V4
```

```
## Error in eval(expr, envir, enclos): object 'cacodylate_ion' not found
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
-3.354212, 1.089131, -3.524753, 0, 0, 1, 1, 1,
-3.288412, 0.2870826, -3.024942, 1, 0, 0, 1, 1,
-2.562315, -0.6884079, -0.8867031, 1, 0, 0, 1, 1,
-2.405212, 0.818133, -1.491183, 1, 0, 0, 1, 1,
-2.359674, -0.009803165, -2.124006, 1, 0, 0, 1, 1,
-2.352396, 0.6307496, -0.7316552, 1, 0, 0, 1, 1,
-2.333478, -1.109024, -0.6659997, 0, 0, 0, 1, 1,
-2.25124, 1.282103, -0.1624667, 0, 0, 0, 1, 1,
-2.249063, 0.9578251, -2.002275, 0, 0, 0, 1, 1,
-2.241986, 2.132268, -2.037315, 0, 0, 0, 1, 1,
-2.208011, -0.1982405, -0.2932161, 0, 0, 0, 1, 1,
-2.172807, 1.282899, -0.8982384, 0, 0, 0, 1, 1,
-2.115804, -0.2273258, -2.37813, 0, 0, 0, 1, 1,
-2.114407, -2.13548, -1.561324, 1, 1, 1, 1, 1,
-2.021673, 0.2842565, -1.437053, 1, 1, 1, 1, 1,
-1.987802, -0.9170122, -4.185796, 1, 1, 1, 1, 1,
-1.9804, -0.7588531, -0.4420785, 1, 1, 1, 1, 1,
-1.974782, 0.4428307, -0.2580487, 1, 1, 1, 1, 1,
-1.943769, -0.6211938, -1.538988, 1, 1, 1, 1, 1,
-1.938419, -1.420835, -2.007896, 1, 1, 1, 1, 1,
-1.924955, 1.491774, -0.7609618, 1, 1, 1, 1, 1,
-1.913236, -0.2876336, -1.544411, 1, 1, 1, 1, 1,
-1.899639, 1.023811, -1.859665, 1, 1, 1, 1, 1,
-1.899573, -0.4962295, -0.909332, 1, 1, 1, 1, 1,
-1.875905, 0.5001765, -2.209452, 1, 1, 1, 1, 1,
-1.861237, 1.367368, -1.073487, 1, 1, 1, 1, 1,
-1.847846, 0.1920461, -0.0594863, 1, 1, 1, 1, 1,
-1.843151, 0.0613361, -3.821516, 1, 1, 1, 1, 1,
-1.835248, -0.6949043, -2.363575, 0, 0, 1, 1, 1,
-1.83281, -0.5580193, -1.987035, 1, 0, 0, 1, 1,
-1.825337, 0.6840817, -0.6718009, 1, 0, 0, 1, 1,
-1.816576, 0.5381358, -2.555116, 1, 0, 0, 1, 1,
-1.813345, -1.96759, -1.321089, 1, 0, 0, 1, 1,
-1.811745, -0.3312175, -2.121164, 1, 0, 0, 1, 1,
-1.778342, 0.03764221, -1.615037, 0, 0, 0, 1, 1,
-1.76516, -0.9074761, -0.9331086, 0, 0, 0, 1, 1,
-1.737432, -1.018561, -2.076299, 0, 0, 0, 1, 1,
-1.730489, -1.026185, -2.405179, 0, 0, 0, 1, 1,
-1.701478, -0.1226885, -1.710235, 0, 0, 0, 1, 1,
-1.691074, -1.23655, -1.080718, 0, 0, 0, 1, 1,
-1.688213, -0.4258676, -2.01651, 0, 0, 0, 1, 1,
-1.679394, -0.1494518, -2.631116, 1, 1, 1, 1, 1,
-1.674571, 0.2303966, -2.396377, 1, 1, 1, 1, 1,
-1.666273, -0.6435135, -2.062355, 1, 1, 1, 1, 1,
-1.663808, -0.1322411, -1.693851, 1, 1, 1, 1, 1,
-1.638185, 0.2926952, -0.1199556, 1, 1, 1, 1, 1,
-1.621272, -0.8517517, -1.97889, 1, 1, 1, 1, 1,
-1.617796, -1.146425, -4.628179, 1, 1, 1, 1, 1,
-1.610426, -1.063675, -4.085048, 1, 1, 1, 1, 1,
-1.610121, 1.39763, -0.3500098, 1, 1, 1, 1, 1,
-1.608529, -0.651467, -2.904237, 1, 1, 1, 1, 1,
-1.601745, 0.9811088, -0.1394611, 1, 1, 1, 1, 1,
-1.594031, 0.7365298, -0.8679225, 1, 1, 1, 1, 1,
-1.593864, 0.1990011, -1.974087, 1, 1, 1, 1, 1,
-1.591045, 0.7186609, -0.3029833, 1, 1, 1, 1, 1,
-1.589231, 0.8666888, -0.4445097, 1, 1, 1, 1, 1,
-1.588154, -0.005705199, 0.5697147, 0, 0, 1, 1, 1,
-1.57549, -1.508165, -3.350856, 1, 0, 0, 1, 1,
-1.565494, -0.5940245, -2.613883, 1, 0, 0, 1, 1,
-1.562482, -0.2496727, -2.524684, 1, 0, 0, 1, 1,
-1.538361, 1.057631, -2.038948, 1, 0, 0, 1, 1,
-1.527155, -1.087807, -3.160792, 1, 0, 0, 1, 1,
-1.525181, 0.1460936, -3.079534, 0, 0, 0, 1, 1,
-1.504899, 0.05830479, -0.6421904, 0, 0, 0, 1, 1,
-1.503649, -0.05883316, -1.802805, 0, 0, 0, 1, 1,
-1.502119, 1.335358, -0.4181543, 0, 0, 0, 1, 1,
-1.495142, -0.2334973, -3.526024, 0, 0, 0, 1, 1,
-1.478701, 0.3838557, -0.06035144, 0, 0, 0, 1, 1,
-1.478405, -0.9696448, -0.8585099, 0, 0, 0, 1, 1,
-1.474782, -1.496494, -3.059139, 1, 1, 1, 1, 1,
-1.450959, -1.300989, -1.740362, 1, 1, 1, 1, 1,
-1.44136, -0.08975822, -0.9264508, 1, 1, 1, 1, 1,
-1.437512, -0.7330492, -2.243441, 1, 1, 1, 1, 1,
-1.430815, 0.2676606, -1.545154, 1, 1, 1, 1, 1,
-1.4169, 0.2309164, -1.606313, 1, 1, 1, 1, 1,
-1.399667, 2.227259, 0.1415469, 1, 1, 1, 1, 1,
-1.398008, -1.923517, -4.211792, 1, 1, 1, 1, 1,
-1.392495, 2.536165, 0.02697296, 1, 1, 1, 1, 1,
-1.372023, -1.702568, -3.221556, 1, 1, 1, 1, 1,
-1.368176, 0.002500504, -1.529479, 1, 1, 1, 1, 1,
-1.360978, -0.4931316, -2.253183, 1, 1, 1, 1, 1,
-1.35291, 0.6716163, -0.1429179, 1, 1, 1, 1, 1,
-1.346461, 0.1498267, -0.9288653, 1, 1, 1, 1, 1,
-1.344535, 1.173752, 0.2217896, 1, 1, 1, 1, 1,
-1.340165, -0.1196911, -1.985384, 0, 0, 1, 1, 1,
-1.336205, -0.007179263, -0.1174635, 1, 0, 0, 1, 1,
-1.333197, -0.3067608, -1.27035, 1, 0, 0, 1, 1,
-1.329539, -0.441372, -1.767789, 1, 0, 0, 1, 1,
-1.316926, 0.725632, -0.07719065, 1, 0, 0, 1, 1,
-1.31629, -0.2964399, -2.831155, 1, 0, 0, 1, 1,
-1.296041, 1.060003, -1.504628, 0, 0, 0, 1, 1,
-1.291529, 0.6811042, -1.607854, 0, 0, 0, 1, 1,
-1.284569, 0.7465705, -0.6961282, 0, 0, 0, 1, 1,
-1.283221, -0.2326555, -3.591493, 0, 0, 0, 1, 1,
-1.281623, 0.7492479, -1.240297, 0, 0, 0, 1, 1,
-1.272227, 1.25522, -0.04226193, 0, 0, 0, 1, 1,
-1.266317, -1.398853, -2.346626, 0, 0, 0, 1, 1,
-1.262892, 0.4218595, -0.01773037, 1, 1, 1, 1, 1,
-1.26103, 0.09005992, -1.568827, 1, 1, 1, 1, 1,
-1.255888, 0.8364378, -0.4409965, 1, 1, 1, 1, 1,
-1.252106, 0.5098315, 0.9111336, 1, 1, 1, 1, 1,
-1.232289, 1.753125, -1.227567, 1, 1, 1, 1, 1,
-1.213537, -1.117159, -3.538596, 1, 1, 1, 1, 1,
-1.204606, -0.1833281, -0.538543, 1, 1, 1, 1, 1,
-1.198975, 1.36471, -1.723091, 1, 1, 1, 1, 1,
-1.194189, -0.7743451, -2.725794, 1, 1, 1, 1, 1,
-1.18711, 0.725925, -0.5378529, 1, 1, 1, 1, 1,
-1.186779, 0.7053191, -0.8129705, 1, 1, 1, 1, 1,
-1.183714, -0.09318483, -1.111445, 1, 1, 1, 1, 1,
-1.177565, -0.9074874, -3.297993, 1, 1, 1, 1, 1,
-1.173803, -0.5154023, -2.612763, 1, 1, 1, 1, 1,
-1.170842, 0.13748, -3.599082, 1, 1, 1, 1, 1,
-1.159718, 1.223278, 1.299918, 0, 0, 1, 1, 1,
-1.148639, -0.2003284, -0.7836003, 1, 0, 0, 1, 1,
-1.147025, 0.0425244, 0.06455888, 1, 0, 0, 1, 1,
-1.146336, 1.873127, -0.6492828, 1, 0, 0, 1, 1,
-1.144585, -2.290975, -1.152098, 1, 0, 0, 1, 1,
-1.136132, 0.7160956, -1.498533, 1, 0, 0, 1, 1,
-1.125803, -1.323349, -2.386428, 0, 0, 0, 1, 1,
-1.124122, 0.2107046, -0.3492873, 0, 0, 0, 1, 1,
-1.119615, -0.1498112, -1.608741, 0, 0, 0, 1, 1,
-1.1154, 0.8690638, -2.246074, 0, 0, 0, 1, 1,
-1.105223, 0.9568636, 0.3159593, 0, 0, 0, 1, 1,
-1.100789, 0.9168293, -1.315688, 0, 0, 0, 1, 1,
-1.09983, -1.069354, -3.812785, 0, 0, 0, 1, 1,
-1.097493, 1.087922, -0.1747967, 1, 1, 1, 1, 1,
-1.097044, 0.9547572, -0.1406308, 1, 1, 1, 1, 1,
-1.094602, -0.6596063, -1.34701, 1, 1, 1, 1, 1,
-1.093446, 0.6411093, -1.942634, 1, 1, 1, 1, 1,
-1.091063, -0.3317407, -1.206202, 1, 1, 1, 1, 1,
-1.090928, -1.626327, -2.318344, 1, 1, 1, 1, 1,
-1.08768, -0.2867517, -1.079918, 1, 1, 1, 1, 1,
-1.087287, 0.02389295, -2.075486, 1, 1, 1, 1, 1,
-1.084833, -1.100092, -1.155526, 1, 1, 1, 1, 1,
-1.073279, -0.8484603, -3.640917, 1, 1, 1, 1, 1,
-1.064047, 2.101698, -0.4086266, 1, 1, 1, 1, 1,
-1.063971, 1.574489, -0.03555575, 1, 1, 1, 1, 1,
-1.058762, 0.1876338, 0.02751292, 1, 1, 1, 1, 1,
-1.05635, -0.9524575, -2.224278, 1, 1, 1, 1, 1,
-1.05227, 1.845997, -1.382348, 1, 1, 1, 1, 1,
-1.051174, 0.7302775, -0.7747527, 0, 0, 1, 1, 1,
-1.050279, 0.5780993, -1.068737, 1, 0, 0, 1, 1,
-1.048008, 0.7730601, 1.151295, 1, 0, 0, 1, 1,
-1.045368, 1.854557, -0.4198024, 1, 0, 0, 1, 1,
-1.043518, 0.2442653, -2.840701, 1, 0, 0, 1, 1,
-1.041534, -0.2578089, -2.057172, 1, 0, 0, 1, 1,
-1.04123, 0.1474613, -1.460012, 0, 0, 0, 1, 1,
-1.038152, 0.1650562, -1.839914, 0, 0, 0, 1, 1,
-1.029598, 0.8046576, -3.039956, 0, 0, 0, 1, 1,
-1.022675, 0.6887701, -1.747277, 0, 0, 0, 1, 1,
-1.010628, 0.04688836, -2.408702, 0, 0, 0, 1, 1,
-1.003287, 0.7306312, -1.952755, 0, 0, 0, 1, 1,
-0.9945855, 0.5540772, -1.626733, 0, 0, 0, 1, 1,
-0.9904346, 0.8388551, -2.086401, 1, 1, 1, 1, 1,
-0.9846635, 0.3903949, -3.07519, 1, 1, 1, 1, 1,
-0.9598688, 0.8210282, -2.3002, 1, 1, 1, 1, 1,
-0.9563407, 0.8898377, -0.6596801, 1, 1, 1, 1, 1,
-0.9540442, -0.3840349, -2.515775, 1, 1, 1, 1, 1,
-0.9539382, 1.55581, -1.687216, 1, 1, 1, 1, 1,
-0.953485, -0.9405326, -1.525664, 1, 1, 1, 1, 1,
-0.9529279, -0.7938588, -3.168121, 1, 1, 1, 1, 1,
-0.9519992, -0.2387624, -2.207927, 1, 1, 1, 1, 1,
-0.9513019, 0.5376514, -0.9020987, 1, 1, 1, 1, 1,
-0.9490711, 1.02586, 0.4798011, 1, 1, 1, 1, 1,
-0.9488178, 0.8517786, -1.879657, 1, 1, 1, 1, 1,
-0.9418888, -0.4390034, -2.277206, 1, 1, 1, 1, 1,
-0.9395893, -0.6769137, -3.250663, 1, 1, 1, 1, 1,
-0.9330514, -0.3406249, -2.921911, 1, 1, 1, 1, 1,
-0.9308249, -1.417833, -2.909077, 0, 0, 1, 1, 1,
-0.9240755, -2.077541, -2.691227, 1, 0, 0, 1, 1,
-0.9236437, -0.7563968, -1.807533, 1, 0, 0, 1, 1,
-0.9202119, 0.2642959, -1.159679, 1, 0, 0, 1, 1,
-0.9013106, 2.529945, 0.04435747, 1, 0, 0, 1, 1,
-0.8959435, -0.534793, -0.7637984, 1, 0, 0, 1, 1,
-0.8952379, 0.7437624, 0.2055989, 0, 0, 0, 1, 1,
-0.8926995, 1.022639, 1.470452, 0, 0, 0, 1, 1,
-0.8926212, -0.2257659, -2.525203, 0, 0, 0, 1, 1,
-0.8882973, -0.2418133, -0.8486174, 0, 0, 0, 1, 1,
-0.8875927, -0.2643622, -0.5162767, 0, 0, 0, 1, 1,
-0.8780152, 0.4602794, -0.9807739, 0, 0, 0, 1, 1,
-0.8752992, -0.8627927, -1.360676, 0, 0, 0, 1, 1,
-0.8667576, 1.069373, -0.8574995, 1, 1, 1, 1, 1,
-0.8470023, 1.349328, -1.183242, 1, 1, 1, 1, 1,
-0.8455925, 0.8387408, -1.041542, 1, 1, 1, 1, 1,
-0.8443725, -1.34185, -3.469732, 1, 1, 1, 1, 1,
-0.83995, -0.4497614, -1.381064, 1, 1, 1, 1, 1,
-0.8387738, 0.4846185, -0.6538143, 1, 1, 1, 1, 1,
-0.8385199, 0.06760988, -3.460909, 1, 1, 1, 1, 1,
-0.8332043, -0.4231233, -3.139821, 1, 1, 1, 1, 1,
-0.8305953, -0.1395168, -1.480544, 1, 1, 1, 1, 1,
-0.8301553, -1.218049, -4.038445, 1, 1, 1, 1, 1,
-0.8294932, -1.341143, -2.166189, 1, 1, 1, 1, 1,
-0.8282593, -1.364324, -2.352393, 1, 1, 1, 1, 1,
-0.8259155, -0.2660358, -1.031479, 1, 1, 1, 1, 1,
-0.8225039, 0.5740793, 0.6952519, 1, 1, 1, 1, 1,
-0.8164793, -0.9893813, -3.334379, 1, 1, 1, 1, 1,
-0.8097022, -0.1951801, -1.11429, 0, 0, 1, 1, 1,
-0.8092004, -1.711322, -3.118348, 1, 0, 0, 1, 1,
-0.8054273, 0.7561321, -0.6135144, 1, 0, 0, 1, 1,
-0.7979794, -1.771347, -2.545004, 1, 0, 0, 1, 1,
-0.7909279, -1.035313, -3.346677, 1, 0, 0, 1, 1,
-0.7904664, -0.6137211, -1.555402, 1, 0, 0, 1, 1,
-0.7896848, -0.9916543, -2.303972, 0, 0, 0, 1, 1,
-0.777522, -0.3896526, -1.158628, 0, 0, 0, 1, 1,
-0.7735367, -0.5083755, -3.343159, 0, 0, 0, 1, 1,
-0.7666979, -0.5708031, -2.652116, 0, 0, 0, 1, 1,
-0.7645079, -0.02023562, -2.470612, 0, 0, 0, 1, 1,
-0.7637191, 0.8076993, -0.8361197, 0, 0, 0, 1, 1,
-0.7602188, 0.2215723, -1.071647, 0, 0, 0, 1, 1,
-0.7588607, 0.1669434, -1.64414, 1, 1, 1, 1, 1,
-0.757645, -0.891512, -2.203579, 1, 1, 1, 1, 1,
-0.7567769, 0.9846034, -0.3728031, 1, 1, 1, 1, 1,
-0.7486633, 0.603742, -0.4655285, 1, 1, 1, 1, 1,
-0.747565, -2.327895, -1.988468, 1, 1, 1, 1, 1,
-0.7401835, 0.3853239, -0.9248127, 1, 1, 1, 1, 1,
-0.7354409, 0.2032566, -1.299598, 1, 1, 1, 1, 1,
-0.7292657, 1.399784, -1.054006, 1, 1, 1, 1, 1,
-0.7277876, 1.363919, -1.331867, 1, 1, 1, 1, 1,
-0.7229723, -1.235667, -4.263391, 1, 1, 1, 1, 1,
-0.71995, -0.1790162, -2.745595, 1, 1, 1, 1, 1,
-0.7180876, -0.3384987, -1.554623, 1, 1, 1, 1, 1,
-0.7165832, 0.7052652, -1.603748, 1, 1, 1, 1, 1,
-0.7123415, -0.1500924, -2.070692, 1, 1, 1, 1, 1,
-0.7114912, 0.3626022, -1.958006, 1, 1, 1, 1, 1,
-0.7078321, -0.4914233, -2.149804, 0, 0, 1, 1, 1,
-0.7059382, 0.2689591, -0.6634427, 1, 0, 0, 1, 1,
-0.6971476, 1.00049, -0.3918456, 1, 0, 0, 1, 1,
-0.6922654, -1.162815, -2.868253, 1, 0, 0, 1, 1,
-0.6922626, -1.483622, -2.41196, 1, 0, 0, 1, 1,
-0.6922264, -1.091092, -2.696089, 1, 0, 0, 1, 1,
-0.6865608, -1.408632, -3.805134, 0, 0, 0, 1, 1,
-0.6845184, -1.923734, -2.547878, 0, 0, 0, 1, 1,
-0.6708716, 0.8103008, -1.176959, 0, 0, 0, 1, 1,
-0.6686897, -0.02105117, -3.159617, 0, 0, 0, 1, 1,
-0.6684191, -1.48521, -1.262487, 0, 0, 0, 1, 1,
-0.6667017, 0.3553554, -2.402377, 0, 0, 0, 1, 1,
-0.6665576, 1.199933, -1.1295, 0, 0, 0, 1, 1,
-0.6625888, 0.08856791, -1.439147, 1, 1, 1, 1, 1,
-0.65929, -1.002061, -2.403061, 1, 1, 1, 1, 1,
-0.6578619, -1.228182, -1.724984, 1, 1, 1, 1, 1,
-0.6577191, 1.151205, 0.9028596, 1, 1, 1, 1, 1,
-0.650405, -0.1710005, -2.156741, 1, 1, 1, 1, 1,
-0.6489933, -0.7829741, -2.34747, 1, 1, 1, 1, 1,
-0.648898, -0.7631493, -1.163614, 1, 1, 1, 1, 1,
-0.6420012, -1.455846, -4.691592, 1, 1, 1, 1, 1,
-0.6364232, 0.5824867, -1.997704, 1, 1, 1, 1, 1,
-0.6273054, -1.062113, -1.7075, 1, 1, 1, 1, 1,
-0.6179289, 0.4991435, 0.6747261, 1, 1, 1, 1, 1,
-0.6151276, -0.7898502, -0.7609659, 1, 1, 1, 1, 1,
-0.6127591, 1.341835, -1.766039, 1, 1, 1, 1, 1,
-0.6124222, 0.6675028, -0.8905221, 1, 1, 1, 1, 1,
-0.6036762, -0.4972001, -2.40111, 1, 1, 1, 1, 1,
-0.5983422, -0.6831328, -1.575676, 0, 0, 1, 1, 1,
-0.5968574, -1.228422, -3.073671, 1, 0, 0, 1, 1,
-0.5930556, 1.349834, -1.235026, 1, 0, 0, 1, 1,
-0.5906657, 0.5753053, -0.1380633, 1, 0, 0, 1, 1,
-0.5886148, 0.8873933, -0.6945998, 1, 0, 0, 1, 1,
-0.5879194, -1.729135, -3.913323, 1, 0, 0, 1, 1,
-0.5860003, -0.1421295, -1.987819, 0, 0, 0, 1, 1,
-0.5760995, -0.8840719, -2.912945, 0, 0, 0, 1, 1,
-0.5753425, 0.9989084, -0.1942101, 0, 0, 0, 1, 1,
-0.5696014, -0.300196, -2.933188, 0, 0, 0, 1, 1,
-0.5669662, 0.9939278, -1.800097, 0, 0, 0, 1, 1,
-0.5640838, -1.662767, -1.270536, 0, 0, 0, 1, 1,
-0.5617733, -0.8252784, -2.485461, 0, 0, 0, 1, 1,
-0.556464, -1.122173, -1.987723, 1, 1, 1, 1, 1,
-0.5510281, -1.411012, -2.69715, 1, 1, 1, 1, 1,
-0.540969, 0.7861711, -2.38114, 1, 1, 1, 1, 1,
-0.5401521, -0.5508293, -3.406442, 1, 1, 1, 1, 1,
-0.5395966, 0.8339243, -1.596925, 1, 1, 1, 1, 1,
-0.5390517, -0.301921, -1.808039, 1, 1, 1, 1, 1,
-0.5365642, 0.01478836, 0.01895305, 1, 1, 1, 1, 1,
-0.53431, -0.01482747, -2.37268, 1, 1, 1, 1, 1,
-0.5311117, -0.6619947, -0.9056873, 1, 1, 1, 1, 1,
-0.5210616, 0.2877224, -1.402944, 1, 1, 1, 1, 1,
-0.5194895, -1.085713, -2.206861, 1, 1, 1, 1, 1,
-0.5156299, -0.8623082, -4.278648, 1, 1, 1, 1, 1,
-0.5101041, 1.859964, -0.453442, 1, 1, 1, 1, 1,
-0.5003027, -0.8555173, -2.615226, 1, 1, 1, 1, 1,
-0.4963731, 0.8433916, -0.6914597, 1, 1, 1, 1, 1,
-0.495165, 1.517451, -0.4662292, 0, 0, 1, 1, 1,
-0.4915088, 2.304173, -0.7843533, 1, 0, 0, 1, 1,
-0.4905793, -0.9244362, -2.077308, 1, 0, 0, 1, 1,
-0.4896716, 0.6636237, 1.571412, 1, 0, 0, 1, 1,
-0.4861188, -0.6957429, -3.848936, 1, 0, 0, 1, 1,
-0.485422, 0.1174178, -1.270785, 1, 0, 0, 1, 1,
-0.4853812, 0.01077564, -2.363279, 0, 0, 0, 1, 1,
-0.4830765, -0.7924874, -1.755656, 0, 0, 0, 1, 1,
-0.4611558, 0.1196747, -3.252651, 0, 0, 0, 1, 1,
-0.4599676, 0.9956758, -0.5198963, 0, 0, 0, 1, 1,
-0.4579136, -0.4737943, -1.286453, 0, 0, 0, 1, 1,
-0.4578585, 0.8645537, 0.3478892, 0, 0, 0, 1, 1,
-0.4518929, 0.7975773, 0.4586092, 0, 0, 0, 1, 1,
-0.44842, -1.498461, -2.523791, 1, 1, 1, 1, 1,
-0.4482355, 0.1113081, -1.646661, 1, 1, 1, 1, 1,
-0.44799, 1.071128, 0.4584002, 1, 1, 1, 1, 1,
-0.4456307, -0.1585318, -2.259004, 1, 1, 1, 1, 1,
-0.4455946, 0.1006229, -1.065512, 1, 1, 1, 1, 1,
-0.4449301, -1.388291, -1.990007, 1, 1, 1, 1, 1,
-0.4406901, 0.8221018, -0.8954588, 1, 1, 1, 1, 1,
-0.4406891, -0.06338841, -1.725356, 1, 1, 1, 1, 1,
-0.4400274, 1.25455, 0.9038102, 1, 1, 1, 1, 1,
-0.4386483, -1.208929, -2.63959, 1, 1, 1, 1, 1,
-0.4329558, 0.5296, -0.3271956, 1, 1, 1, 1, 1,
-0.4274645, 0.4886572, -1.258227, 1, 1, 1, 1, 1,
-0.4197927, 0.9464003, -1.331184, 1, 1, 1, 1, 1,
-0.4183052, -1.268379, -2.923843, 1, 1, 1, 1, 1,
-0.4171443, -1.646015, -4.10909, 1, 1, 1, 1, 1,
-0.4159985, 0.1068557, 0.1773994, 0, 0, 1, 1, 1,
-0.4155194, 0.4828169, 1.391257, 1, 0, 0, 1, 1,
-0.4148087, 0.9873673, 0.718563, 1, 0, 0, 1, 1,
-0.4145525, -1.43962, -3.778608, 1, 0, 0, 1, 1,
-0.4130034, 0.339998, -1.727268, 1, 0, 0, 1, 1,
-0.4021142, 0.1056319, -1.223755, 1, 0, 0, 1, 1,
-0.4004949, 0.4613582, -0.2122193, 0, 0, 0, 1, 1,
-0.3969975, -1.660564, -2.838073, 0, 0, 0, 1, 1,
-0.39546, 0.4620124, -2.662784, 0, 0, 0, 1, 1,
-0.3947989, 0.7358346, -0.9213684, 0, 0, 0, 1, 1,
-0.3898199, -0.2982427, -2.493286, 0, 0, 0, 1, 1,
-0.3873484, 0.03696759, -2.325733, 0, 0, 0, 1, 1,
-0.3846352, 0.3876334, -2.372842, 0, 0, 0, 1, 1,
-0.3846113, -1.222215, -4.204755, 1, 1, 1, 1, 1,
-0.3821995, 0.2558302, -1.513323, 1, 1, 1, 1, 1,
-0.3819934, 0.1549422, -1.599084, 1, 1, 1, 1, 1,
-0.3804417, 0.00766036, -0.4771149, 1, 1, 1, 1, 1,
-0.3782564, 0.2048902, -1.946487, 1, 1, 1, 1, 1,
-0.3760088, -2.338495, -3.535073, 1, 1, 1, 1, 1,
-0.3731328, -1.169249, -2.661419, 1, 1, 1, 1, 1,
-0.3729911, -0.02566016, -1.908856, 1, 1, 1, 1, 1,
-0.3692147, -0.370155, -2.760084, 1, 1, 1, 1, 1,
-0.368147, -1.117262, -2.635186, 1, 1, 1, 1, 1,
-0.3632942, 0.1306495, -1.554794, 1, 1, 1, 1, 1,
-0.3627394, -2.41906, -3.6913, 1, 1, 1, 1, 1,
-0.3602147, 0.4176883, -0.09861898, 1, 1, 1, 1, 1,
-0.3541272, 1.300118, -1.820232, 1, 1, 1, 1, 1,
-0.3526352, -0.3345846, -2.270706, 1, 1, 1, 1, 1,
-0.3524104, -0.3487021, -3.286172, 0, 0, 1, 1, 1,
-0.3518926, -0.6315969, -3.022851, 1, 0, 0, 1, 1,
-0.3500204, -0.2885627, -0.3019919, 1, 0, 0, 1, 1,
-0.3463012, -1.863515, -2.637281, 1, 0, 0, 1, 1,
-0.3404406, 0.9296281, -0.3748719, 1, 0, 0, 1, 1,
-0.3392157, 0.7627155, -1.005447, 1, 0, 0, 1, 1,
-0.3344148, -0.0791021, -1.002225, 0, 0, 0, 1, 1,
-0.3286927, 1.500717, -1.837053, 0, 0, 0, 1, 1,
-0.3286009, -0.7154044, -2.540611, 0, 0, 0, 1, 1,
-0.3262704, 1.695687, 0.2698919, 0, 0, 0, 1, 1,
-0.3224368, -0.09759711, -0.8650998, 0, 0, 0, 1, 1,
-0.3213926, -0.3085518, -1.728674, 0, 0, 0, 1, 1,
-0.3195368, 0.6111908, 1.326676, 0, 0, 0, 1, 1,
-0.317701, 0.8445715, -0.7042115, 1, 1, 1, 1, 1,
-0.316245, 0.8165949, -0.642448, 1, 1, 1, 1, 1,
-0.3157431, -1.437223, -3.785029, 1, 1, 1, 1, 1,
-0.3120535, 0.09930843, -1.33204, 1, 1, 1, 1, 1,
-0.3078974, -0.9157591, -2.574006, 1, 1, 1, 1, 1,
-0.3063351, -0.3685187, -3.820371, 1, 1, 1, 1, 1,
-0.3040043, -1.997035, -1.748354, 1, 1, 1, 1, 1,
-0.3012109, -0.6934705, -1.64784, 1, 1, 1, 1, 1,
-0.3007876, 1.610833, 0.2095781, 1, 1, 1, 1, 1,
-0.2992091, -1.143778, -0.176362, 1, 1, 1, 1, 1,
-0.2899396, -0.9402866, -2.801531, 1, 1, 1, 1, 1,
-0.2864281, -0.8004319, -2.07705, 1, 1, 1, 1, 1,
-0.2845562, -0.3603489, -2.003824, 1, 1, 1, 1, 1,
-0.284514, -0.9193337, -1.970628, 1, 1, 1, 1, 1,
-0.2739436, 0.1821984, -2.131158, 1, 1, 1, 1, 1,
-0.2696547, 0.335885, -1.373314, 0, 0, 1, 1, 1,
-0.268635, -0.1824049, -0.5851256, 1, 0, 0, 1, 1,
-0.2651667, -0.01477027, -0.5319111, 1, 0, 0, 1, 1,
-0.2601337, -0.3897758, -3.404537, 1, 0, 0, 1, 1,
-0.2597398, -0.8334664, -3.165488, 1, 0, 0, 1, 1,
-0.2594492, -1.82991, -3.014305, 1, 0, 0, 1, 1,
-0.2586701, 1.821922, -1.451262, 0, 0, 0, 1, 1,
-0.2586218, -1.093985, -3.798861, 0, 0, 0, 1, 1,
-0.2579579, 0.9117507, 0.9563465, 0, 0, 0, 1, 1,
-0.2495783, 0.8385478, 1.627915, 0, 0, 0, 1, 1,
-0.2389377, -0.2646122, -1.578049, 0, 0, 0, 1, 1,
-0.2386878, 0.0293497, -1.033414, 0, 0, 0, 1, 1,
-0.2380959, 1.231163, 0.2894545, 0, 0, 0, 1, 1,
-0.2305077, -1.272851, -2.180117, 1, 1, 1, 1, 1,
-0.2298588, 1.094443, 0.4766241, 1, 1, 1, 1, 1,
-0.2279457, 0.3808777, -1.20675, 1, 1, 1, 1, 1,
-0.2235904, -1.566127, -3.591914, 1, 1, 1, 1, 1,
-0.2215354, -0.7004135, -2.506451, 1, 1, 1, 1, 1,
-0.2199548, -0.3984742, -2.796405, 1, 1, 1, 1, 1,
-0.2179735, -1.931891, -2.137377, 1, 1, 1, 1, 1,
-0.2125063, -0.9473195, -1.516971, 1, 1, 1, 1, 1,
-0.2112735, -1.362738, -2.653488, 1, 1, 1, 1, 1,
-0.2066057, -0.06272721, -1.212745, 1, 1, 1, 1, 1,
-0.2052229, 0.0926807, 0.2577693, 1, 1, 1, 1, 1,
-0.2048667, 1.562733, -0.3621829, 1, 1, 1, 1, 1,
-0.202418, 1.226451, -1.486661, 1, 1, 1, 1, 1,
-0.189101, -0.1021702, -2.416091, 1, 1, 1, 1, 1,
-0.1889972, -0.4275669, -1.564802, 1, 1, 1, 1, 1,
-0.1887164, -1.532859, -3.402519, 0, 0, 1, 1, 1,
-0.1885825, -0.716934, -3.073931, 1, 0, 0, 1, 1,
-0.1874986, -1.118718, -3.374992, 1, 0, 0, 1, 1,
-0.1827074, 0.1582322, -0.8576635, 1, 0, 0, 1, 1,
-0.1813501, -1.96366, -3.360478, 1, 0, 0, 1, 1,
-0.1810574, 0.7114036, 0.9703404, 1, 0, 0, 1, 1,
-0.1746858, -0.4583882, -1.694265, 0, 0, 0, 1, 1,
-0.1743131, 0.8011785, 1.27614, 0, 0, 0, 1, 1,
-0.1704301, -0.6741982, -2.577172, 0, 0, 0, 1, 1,
-0.1666144, 2.349894, 0.3869895, 0, 0, 0, 1, 1,
-0.1636986, 0.05191446, -0.373615, 0, 0, 0, 1, 1,
-0.161294, -1.686952, -3.664649, 0, 0, 0, 1, 1,
-0.1610194, 0.04442727, -2.089726, 0, 0, 0, 1, 1,
-0.1594557, -0.3385777, -3.149226, 1, 1, 1, 1, 1,
-0.1508563, 0.1346643, -0.5661994, 1, 1, 1, 1, 1,
-0.1445063, -2.193591, -3.041635, 1, 1, 1, 1, 1,
-0.1438237, 0.03642251, -1.967856, 1, 1, 1, 1, 1,
-0.1437508, 0.28113, -1.406566, 1, 1, 1, 1, 1,
-0.141251, -0.2756267, -3.801781, 1, 1, 1, 1, 1,
-0.1403881, 0.8399156, -0.4676296, 1, 1, 1, 1, 1,
-0.1394092, 0.8567555, 0.2219188, 1, 1, 1, 1, 1,
-0.1393016, -0.330256, -5.174376, 1, 1, 1, 1, 1,
-0.1369429, 0.7889881, 0.5026923, 1, 1, 1, 1, 1,
-0.1345287, -0.9387931, -2.000927, 1, 1, 1, 1, 1,
-0.1278885, 0.6869316, -0.4874967, 1, 1, 1, 1, 1,
-0.1238365, -0.1283904, -4.151814, 1, 1, 1, 1, 1,
-0.1236172, -0.1681429, -3.880248, 1, 1, 1, 1, 1,
-0.1226341, -0.4280097, -1.541278, 1, 1, 1, 1, 1,
-0.1176343, -1.586902, -2.866872, 0, 0, 1, 1, 1,
-0.1160567, -0.468072, -2.238073, 1, 0, 0, 1, 1,
-0.1155359, 0.1543219, 0.03366608, 1, 0, 0, 1, 1,
-0.1116321, -1.239995, -4.496867, 1, 0, 0, 1, 1,
-0.1089633, -0.8235222, -2.701714, 1, 0, 0, 1, 1,
-0.1033171, -0.790337, -3.046442, 1, 0, 0, 1, 1,
-0.1022066, 0.03632312, -1.730168, 0, 0, 0, 1, 1,
-0.1007106, -1.413439, -0.9963083, 0, 0, 0, 1, 1,
-0.1006205, 0.6751883, -0.02762946, 0, 0, 0, 1, 1,
-0.1001925, 1.287318, 1.177939, 0, 0, 0, 1, 1,
-0.09828997, 0.5968573, -1.844604, 0, 0, 0, 1, 1,
-0.09780833, 1.364794, -0.813562, 0, 0, 0, 1, 1,
-0.09706105, 1.105348, 0.2269502, 0, 0, 0, 1, 1,
-0.09653168, -1.522548, -3.054733, 1, 1, 1, 1, 1,
-0.09261283, -0.5150172, -1.563424, 1, 1, 1, 1, 1,
-0.09008928, -0.1742368, -2.571713, 1, 1, 1, 1, 1,
-0.08526166, -0.32622, -1.804515, 1, 1, 1, 1, 1,
-0.08240079, 0.6624722, 0.3820764, 1, 1, 1, 1, 1,
-0.08077652, -1.489641, -3.061382, 1, 1, 1, 1, 1,
-0.08076158, 0.07548679, -1.51651, 1, 1, 1, 1, 1,
-0.07997463, -0.3473451, -2.200882, 1, 1, 1, 1, 1,
-0.07667468, 0.9254872, 0.3469736, 1, 1, 1, 1, 1,
-0.0717314, -1.467146, -2.25077, 1, 1, 1, 1, 1,
-0.0706885, -0.9930394, -4.642788, 1, 1, 1, 1, 1,
-0.07007401, 0.8358833, -1.584923, 1, 1, 1, 1, 1,
-0.06970303, -0.9605286, -4.166448, 1, 1, 1, 1, 1,
-0.0671958, 0.4062889, 1.691019, 1, 1, 1, 1, 1,
-0.05985805, 0.5973347, -0.01190254, 1, 1, 1, 1, 1,
-0.05843256, -1.25748, -2.71519, 0, 0, 1, 1, 1,
-0.05442122, -0.3527183, -2.690645, 1, 0, 0, 1, 1,
-0.05116687, -0.3331275, -3.217239, 1, 0, 0, 1, 1,
-0.05109316, 0.04614205, -0.8789026, 1, 0, 0, 1, 1,
-0.05093736, 0.6267352, -0.004068438, 1, 0, 0, 1, 1,
-0.04392686, -0.04840995, -1.026859, 1, 0, 0, 1, 1,
-0.03122006, -1.177932, -1.705718, 0, 0, 0, 1, 1,
-0.02930406, -0.4234509, -1.391812, 0, 0, 0, 1, 1,
-0.0264328, -0.4727757, -2.810004, 0, 0, 0, 1, 1,
-0.02533179, -0.4542128, -4.735717, 0, 0, 0, 1, 1,
-0.02295661, -0.3443331, -2.910322, 0, 0, 0, 1, 1,
-0.02226735, -0.1642993, -2.649479, 0, 0, 0, 1, 1,
-0.01843018, -0.5129133, -2.045736, 0, 0, 0, 1, 1,
-0.01782746, 0.6034272, -0.08496568, 1, 1, 1, 1, 1,
-0.01564394, 1.637712, 1.024995, 1, 1, 1, 1, 1,
-0.01368285, -1.150647, -3.069037, 1, 1, 1, 1, 1,
-0.01326415, 1.765993, -0.9341863, 1, 1, 1, 1, 1,
-0.008676791, -0.8236619, -2.578634, 1, 1, 1, 1, 1,
-0.008597332, -0.5977612, -5.871059, 1, 1, 1, 1, 1,
-0.005528307, 0.9376091, -0.03361122, 1, 1, 1, 1, 1,
-0.0005776967, 0.0435215, -0.3800493, 1, 1, 1, 1, 1,
0.0008446565, 0.8483627, 0.7570631, 1, 1, 1, 1, 1,
0.00204486, -0.5593485, 2.797772, 1, 1, 1, 1, 1,
0.004541723, -0.005761787, 2.74448, 1, 1, 1, 1, 1,
0.01605825, -0.3818919, 3.848446, 1, 1, 1, 1, 1,
0.01986419, 0.7871129, 0.5406242, 1, 1, 1, 1, 1,
0.0211309, -2.330807, 2.190326, 1, 1, 1, 1, 1,
0.0215123, -1.008221, 2.498497, 1, 1, 1, 1, 1,
0.02541466, -1.164572, 2.762862, 0, 0, 1, 1, 1,
0.02688376, -0.3309792, 3.536377, 1, 0, 0, 1, 1,
0.02743881, 0.6633412, -0.175546, 1, 0, 0, 1, 1,
0.02805576, -0.3150463, 3.008957, 1, 0, 0, 1, 1,
0.028776, 1.179945, -1.542142, 1, 0, 0, 1, 1,
0.03235166, -0.5018132, 3.589356, 1, 0, 0, 1, 1,
0.03831305, -0.1838206, 1.310071, 0, 0, 0, 1, 1,
0.04583143, 1.532276, -0.3783125, 0, 0, 0, 1, 1,
0.04662704, -1.41037, 4.610138, 0, 0, 0, 1, 1,
0.04670611, 0.2080754, 1.498979, 0, 0, 0, 1, 1,
0.05009165, -0.8747959, 4.258697, 0, 0, 0, 1, 1,
0.05078113, -0.1829817, 3.273455, 0, 0, 0, 1, 1,
0.05517329, 0.3579488, 1.755133, 0, 0, 0, 1, 1,
0.05621641, -1.053369, 3.964012, 1, 1, 1, 1, 1,
0.05654102, 0.6899787, -0.5475149, 1, 1, 1, 1, 1,
0.05664817, -0.1366919, 2.66168, 1, 1, 1, 1, 1,
0.05697814, 0.631088, 0.2348488, 1, 1, 1, 1, 1,
0.05778414, 0.5596244, 0.4370883, 1, 1, 1, 1, 1,
0.06159992, -1.558539, 2.601688, 1, 1, 1, 1, 1,
0.06256492, 0.9785885, 0.4164644, 1, 1, 1, 1, 1,
0.06460363, 0.3485116, -0.4633766, 1, 1, 1, 1, 1,
0.0654267, 0.3152763, 1.107727, 1, 1, 1, 1, 1,
0.06872184, 0.01837714, 2.181689, 1, 1, 1, 1, 1,
0.07135502, 0.1477194, 0.1358373, 1, 1, 1, 1, 1,
0.07143255, -0.3237737, 5.069565, 1, 1, 1, 1, 1,
0.0747095, 0.4921787, 0.5398248, 1, 1, 1, 1, 1,
0.07510801, -0.1434864, 2.831286, 1, 1, 1, 1, 1,
0.07717069, 0.6868256, 0.4284674, 1, 1, 1, 1, 1,
0.07852304, -0.09775388, 4.465899, 0, 0, 1, 1, 1,
0.07905204, 1.329172, -0.5035962, 1, 0, 0, 1, 1,
0.08033529, -0.2675869, 2.923687, 1, 0, 0, 1, 1,
0.08341855, 1.472597, -1.633359, 1, 0, 0, 1, 1,
0.08642621, -0.1300257, 1.947112, 1, 0, 0, 1, 1,
0.0870183, -1.45824, 2.933649, 1, 0, 0, 1, 1,
0.08936617, 0.6484196, 0.7340835, 0, 0, 0, 1, 1,
0.09292275, 0.6755482, 0.1928179, 0, 0, 0, 1, 1,
0.09379111, 0.2881211, 0.6492443, 0, 0, 0, 1, 1,
0.09890465, 0.936831, -1.200551, 0, 0, 0, 1, 1,
0.1002608, 0.237473, 0.07271639, 0, 0, 0, 1, 1,
0.1011558, 0.1275738, 1.77799, 0, 0, 0, 1, 1,
0.1019855, 0.9702325, -0.9308732, 0, 0, 0, 1, 1,
0.1042868, -0.8062398, 3.206184, 1, 1, 1, 1, 1,
0.1043924, 0.9119139, 0.5233214, 1, 1, 1, 1, 1,
0.1088345, -0.5340567, 3.300468, 1, 1, 1, 1, 1,
0.1136323, -0.6429833, 2.947408, 1, 1, 1, 1, 1,
0.1158161, 0.08920274, 1.774434, 1, 1, 1, 1, 1,
0.1227393, 0.5719914, -0.9273808, 1, 1, 1, 1, 1,
0.1227419, 0.1154081, 1.222501, 1, 1, 1, 1, 1,
0.1250115, -0.7163771, 3.265378, 1, 1, 1, 1, 1,
0.1264403, -0.5798175, 4.311563, 1, 1, 1, 1, 1,
0.126545, -0.2837393, 2.928412, 1, 1, 1, 1, 1,
0.1281222, -0.7698374, 4.18497, 1, 1, 1, 1, 1,
0.1333724, -0.722647, 2.634795, 1, 1, 1, 1, 1,
0.1381116, -0.7033272, 3.700454, 1, 1, 1, 1, 1,
0.138207, -0.3110029, 3.629693, 1, 1, 1, 1, 1,
0.1388206, -0.7216368, 3.19637, 1, 1, 1, 1, 1,
0.1407637, 0.7534989, 0.1573808, 0, 0, 1, 1, 1,
0.1430947, -0.04803992, 0.3762807, 1, 0, 0, 1, 1,
0.1462171, 0.3792464, 1.089418, 1, 0, 0, 1, 1,
0.1477293, 1.187307, 0.5815597, 1, 0, 0, 1, 1,
0.1503633, 0.8524044, -1.449671, 1, 0, 0, 1, 1,
0.1504748, -0.1525669, 2.897538, 1, 0, 0, 1, 1,
0.1551585, 0.7124167, 2.226977, 0, 0, 0, 1, 1,
0.1572478, -0.5213476, -0.07882418, 0, 0, 0, 1, 1,
0.1597579, 0.2926501, 1.388863, 0, 0, 0, 1, 1,
0.1671847, 0.5290817, 0.2563176, 0, 0, 0, 1, 1,
0.1695464, -0.7026749, 2.476415, 0, 0, 0, 1, 1,
0.1698778, 0.43211, 1.400748, 0, 0, 0, 1, 1,
0.17151, 0.9435596, 0.8825665, 0, 0, 0, 1, 1,
0.1867309, 0.08256079, 1.141369, 1, 1, 1, 1, 1,
0.1869429, 0.2575413, -0.9593221, 1, 1, 1, 1, 1,
0.1883463, 2.492897, 1.873368, 1, 1, 1, 1, 1,
0.1901001, -0.1604486, 1.773415, 1, 1, 1, 1, 1,
0.1905013, 0.9944793, -0.02082659, 1, 1, 1, 1, 1,
0.1981702, -0.3293509, 1.50328, 1, 1, 1, 1, 1,
0.2006124, 2.13398, 0.2279246, 1, 1, 1, 1, 1,
0.2007354, -0.6321549, 1.802048, 1, 1, 1, 1, 1,
0.2032121, 1.634619, 0.9132135, 1, 1, 1, 1, 1,
0.2046013, 1.472523, 0.7109982, 1, 1, 1, 1, 1,
0.2093216, 0.4754255, -1.172326, 1, 1, 1, 1, 1,
0.2132064, -0.385675, 3.245318, 1, 1, 1, 1, 1,
0.2133402, 0.5117726, 1.109869, 1, 1, 1, 1, 1,
0.214176, 0.1415507, 1.576853, 1, 1, 1, 1, 1,
0.2152274, 1.543947, 1.867899, 1, 1, 1, 1, 1,
0.2213912, -1.00091, 3.55951, 0, 0, 1, 1, 1,
0.2264624, 0.9504169, 0.5175807, 1, 0, 0, 1, 1,
0.2285897, 1.773636, 0.7370473, 1, 0, 0, 1, 1,
0.2296405, 0.5786115, -0.8510662, 1, 0, 0, 1, 1,
0.2339038, 0.9983941, 0.2527042, 1, 0, 0, 1, 1,
0.2370252, -0.3022071, 2.478515, 1, 0, 0, 1, 1,
0.2375342, 0.1239626, 2.33098, 0, 0, 0, 1, 1,
0.2383146, -0.1619539, 3.447893, 0, 0, 0, 1, 1,
0.2409828, -0.2505222, 3.966187, 0, 0, 0, 1, 1,
0.2428934, 0.02857322, 2.014658, 0, 0, 0, 1, 1,
0.244252, -2.052183, 1.794087, 0, 0, 0, 1, 1,
0.2444259, -0.3389726, 4.104511, 0, 0, 0, 1, 1,
0.2467321, 1.10704, 1.831221, 0, 0, 0, 1, 1,
0.24755, -0.9845847, 3.385656, 1, 1, 1, 1, 1,
0.2482964, 0.431073, -0.2916323, 1, 1, 1, 1, 1,
0.2493052, 0.4816965, -0.2109216, 1, 1, 1, 1, 1,
0.2499962, 0.7890629, 1.045879, 1, 1, 1, 1, 1,
0.2525377, 0.4574542, 1.690132, 1, 1, 1, 1, 1,
0.2562315, -0.8510725, 1.002282, 1, 1, 1, 1, 1,
0.260607, -1.396036, 3.252527, 1, 1, 1, 1, 1,
0.2625426, 0.8878689, -0.1778619, 1, 1, 1, 1, 1,
0.2650351, -1.701456, 1.727705, 1, 1, 1, 1, 1,
0.2651909, 0.3756898, 1.642979, 1, 1, 1, 1, 1,
0.265723, -0.842107, 3.340071, 1, 1, 1, 1, 1,
0.2660017, -1.462749, 2.511265, 1, 1, 1, 1, 1,
0.2682249, -0.2055269, 3.1875, 1, 1, 1, 1, 1,
0.2698254, -0.6577784, 3.214286, 1, 1, 1, 1, 1,
0.2719878, -0.8027855, 3.474874, 1, 1, 1, 1, 1,
0.2729111, 0.9588075, -1.566943, 0, 0, 1, 1, 1,
0.2736942, -0.3145549, 2.748346, 1, 0, 0, 1, 1,
0.2788331, 0.3368958, 0.6895949, 1, 0, 0, 1, 1,
0.2819422, -0.02788909, 2.628457, 1, 0, 0, 1, 1,
0.2829259, -1.002019, 3.307747, 1, 0, 0, 1, 1,
0.2831826, 0.903188, 1.207154, 1, 0, 0, 1, 1,
0.2921186, 0.4985663, 0.9897065, 0, 0, 0, 1, 1,
0.2935417, -0.3774844, 3.036046, 0, 0, 0, 1, 1,
0.2964933, 1.196787, 0.03733218, 0, 0, 0, 1, 1,
0.2991014, -0.6518326, 2.725808, 0, 0, 0, 1, 1,
0.3007976, -0.3790051, 3.396672, 0, 0, 0, 1, 1,
0.3012301, -0.2214182, 4.489301, 0, 0, 0, 1, 1,
0.3041496, 2.401284, -0.389352, 0, 0, 0, 1, 1,
0.3052323, -0.2886257, 3.342801, 1, 1, 1, 1, 1,
0.3091134, 0.8454064, 0.06568538, 1, 1, 1, 1, 1,
0.3104238, 1.678685, 1.022127, 1, 1, 1, 1, 1,
0.3114648, 1.703086, 1.126658, 1, 1, 1, 1, 1,
0.3156101, -0.6204694, 0.9196623, 1, 1, 1, 1, 1,
0.3172776, -0.7061194, 2.993835, 1, 1, 1, 1, 1,
0.3198007, -1.863569, 1.926486, 1, 1, 1, 1, 1,
0.3207395, -0.6647846, 2.664522, 1, 1, 1, 1, 1,
0.326605, -1.097722, 3.52739, 1, 1, 1, 1, 1,
0.3284738, 1.036174, -1.044746, 1, 1, 1, 1, 1,
0.3361474, -1.298661, 3.753766, 1, 1, 1, 1, 1,
0.3362835, -0.4817231, 2.096508, 1, 1, 1, 1, 1,
0.3404603, 0.5757388, 0.5496728, 1, 1, 1, 1, 1,
0.3439097, -0.2231254, 1.445877, 1, 1, 1, 1, 1,
0.3463712, 0.277727, 0.285616, 1, 1, 1, 1, 1,
0.3490395, -0.2125887, 2.598976, 0, 0, 1, 1, 1,
0.353992, -1.561926, 1.925251, 1, 0, 0, 1, 1,
0.3564705, -1.507429, 3.269571, 1, 0, 0, 1, 1,
0.3577461, -1.378224, 2.385798, 1, 0, 0, 1, 1,
0.3596888, 1.00554, 0.2498003, 1, 0, 0, 1, 1,
0.3610021, -0.0820991, 3.410855, 1, 0, 0, 1, 1,
0.36517, -0.5557715, 1.115296, 0, 0, 0, 1, 1,
0.3691979, -0.7869868, 2.753997, 0, 0, 0, 1, 1,
0.3708389, 0.3273104, 0.6978593, 0, 0, 0, 1, 1,
0.3721689, -0.1632724, 0.3211451, 0, 0, 0, 1, 1,
0.3729452, -0.02826151, 1.223954, 0, 0, 0, 1, 1,
0.3774647, 1.0295, 0.5586231, 0, 0, 0, 1, 1,
0.3794148, -0.3582867, 3.138983, 0, 0, 0, 1, 1,
0.3798583, -0.3621423, 1.38918, 1, 1, 1, 1, 1,
0.3844324, -0.3886611, 0.6735041, 1, 1, 1, 1, 1,
0.3846938, 0.5072643, 0.9592417, 1, 1, 1, 1, 1,
0.3855602, -0.05102133, 2.637974, 1, 1, 1, 1, 1,
0.3884051, 0.5641599, 0.5543016, 1, 1, 1, 1, 1,
0.3889591, -0.1246266, 0.7045085, 1, 1, 1, 1, 1,
0.3932995, -1.190373, 2.117635, 1, 1, 1, 1, 1,
0.3941043, 0.3436599, -0.9978597, 1, 1, 1, 1, 1,
0.3949275, -0.8764688, 2.431027, 1, 1, 1, 1, 1,
0.3952269, 0.2915572, 2.864409, 1, 1, 1, 1, 1,
0.403485, -1.254194, 3.631108, 1, 1, 1, 1, 1,
0.4058614, 0.2129561, 0.2169547, 1, 1, 1, 1, 1,
0.4087135, -0.7075692, 2.977355, 1, 1, 1, 1, 1,
0.412729, -1.164695, 1.302711, 1, 1, 1, 1, 1,
0.4165938, 1.193717, 0.7477558, 1, 1, 1, 1, 1,
0.4178181, -0.261757, 1.223461, 0, 0, 1, 1, 1,
0.4182375, -1.06063, 1.566411, 1, 0, 0, 1, 1,
0.4196478, -0.6960185, 3.518855, 1, 0, 0, 1, 1,
0.4222982, -0.1510996, 5.51936, 1, 0, 0, 1, 1,
0.4237972, 0.04350407, 1.938359, 1, 0, 0, 1, 1,
0.4312687, 0.489051, -0.4678221, 1, 0, 0, 1, 1,
0.4350956, -1.012299, 3.767532, 0, 0, 0, 1, 1,
0.4351042, 1.795588, -1.377461, 0, 0, 0, 1, 1,
0.4393175, 0.3587653, 0.8701076, 0, 0, 0, 1, 1,
0.4419968, -1.216159, 3.7832, 0, 0, 0, 1, 1,
0.4461704, -1.463594, 2.00611, 0, 0, 0, 1, 1,
0.4466376, 1.880388, -2.435498, 0, 0, 0, 1, 1,
0.4467589, 1.393752, -1.433207, 0, 0, 0, 1, 1,
0.4484419, 1.715256, 0.06523274, 1, 1, 1, 1, 1,
0.4490176, -0.7036548, 2.43183, 1, 1, 1, 1, 1,
0.4499479, 0.1393103, 1.528957, 1, 1, 1, 1, 1,
0.4515168, -2.250241, 3.806357, 1, 1, 1, 1, 1,
0.4521951, -0.5251526, 2.714774, 1, 1, 1, 1, 1,
0.4553562, -0.8573214, 1.933293, 1, 1, 1, 1, 1,
0.4559546, -0.8587856, 4.909957, 1, 1, 1, 1, 1,
0.4582896, -0.3813277, 1.275409, 1, 1, 1, 1, 1,
0.4598662, 0.42021, 0.8728777, 1, 1, 1, 1, 1,
0.4634762, -0.4956786, 2.593166, 1, 1, 1, 1, 1,
0.464053, -0.3796942, 1.551964, 1, 1, 1, 1, 1,
0.4648056, -0.7032048, 2.144078, 1, 1, 1, 1, 1,
0.4667001, 0.05033414, 1.840965, 1, 1, 1, 1, 1,
0.473133, -0.1202082, 3.277099, 1, 1, 1, 1, 1,
0.4736299, -2.021963, 2.451489, 1, 1, 1, 1, 1,
0.4766583, 0.7769144, 0.09243999, 0, 0, 1, 1, 1,
0.4804053, 1.425418, 1.506873, 1, 0, 0, 1, 1,
0.4809458, -0.6050521, 3.735032, 1, 0, 0, 1, 1,
0.4825664, -0.5479258, 2.310924, 1, 0, 0, 1, 1,
0.4846308, 0.1578574, -0.6274562, 1, 0, 0, 1, 1,
0.4866127, 0.9380689, 1.23799, 1, 0, 0, 1, 1,
0.4918626, 1.229493, -0.4860503, 0, 0, 0, 1, 1,
0.4927449, -0.1468771, 2.218246, 0, 0, 0, 1, 1,
0.4983143, 0.02772977, 3.771091, 0, 0, 0, 1, 1,
0.5001741, 0.6152694, 0.09832635, 0, 0, 0, 1, 1,
0.500824, -0.7933549, 2.284383, 0, 0, 0, 1, 1,
0.503968, -0.7726132, 2.973208, 0, 0, 0, 1, 1,
0.50462, 1.939718, 0.160186, 0, 0, 0, 1, 1,
0.5061781, 1.045918, 0.2225727, 1, 1, 1, 1, 1,
0.5098267, -2.016781, 3.556659, 1, 1, 1, 1, 1,
0.510524, 0.3965469, 2.010417, 1, 1, 1, 1, 1,
0.512767, 0.2079728, 0.2018217, 1, 1, 1, 1, 1,
0.5133516, 0.4024353, -0.8026447, 1, 1, 1, 1, 1,
0.5144796, 0.2409988, -2.633304, 1, 1, 1, 1, 1,
0.5145078, 0.9564428, 1.177152, 1, 1, 1, 1, 1,
0.515013, 1.080152, 0.05214658, 1, 1, 1, 1, 1,
0.5154325, 0.5001543, 1.770378, 1, 1, 1, 1, 1,
0.5169789, 0.3912703, 2.037128, 1, 1, 1, 1, 1,
0.5192018, 1.961111, 0.08431592, 1, 1, 1, 1, 1,
0.5192081, -1.408941, 3.087491, 1, 1, 1, 1, 1,
0.5193527, -1.43048, 3.784141, 1, 1, 1, 1, 1,
0.5197138, 0.252075, 2.237369, 1, 1, 1, 1, 1,
0.5198136, -0.288413, 0.7840725, 1, 1, 1, 1, 1,
0.5201816, 0.1097844, 1.878959, 0, 0, 1, 1, 1,
0.5212615, 1.209761, -0.5738036, 1, 0, 0, 1, 1,
0.5258668, 0.6165157, -1.853751, 1, 0, 0, 1, 1,
0.5286626, -0.7382003, 3.686381, 1, 0, 0, 1, 1,
0.5301892, 0.9457963, 0.618418, 1, 0, 0, 1, 1,
0.5315006, 0.2252411, 1.6421, 1, 0, 0, 1, 1,
0.5315863, -1.400498, 1.951707, 0, 0, 0, 1, 1,
0.5361278, 0.7693049, -0.3552226, 0, 0, 0, 1, 1,
0.5373496, 0.1281467, 2.942202, 0, 0, 0, 1, 1,
0.5383097, -1.336345, 2.541215, 0, 0, 0, 1, 1,
0.5418078, 0.4189725, -1.164774, 0, 0, 0, 1, 1,
0.5418962, -0.7672962, 2.191921, 0, 0, 0, 1, 1,
0.5426593, -0.6483148, 3.34507, 0, 0, 0, 1, 1,
0.5449424, 1.569028, -0.575826, 1, 1, 1, 1, 1,
0.5526186, -0.141611, 1.034448, 1, 1, 1, 1, 1,
0.5534195, 0.5763612, 0.8957176, 1, 1, 1, 1, 1,
0.5549571, -0.236647, 0.06288894, 1, 1, 1, 1, 1,
0.5572405, -0.02503708, 0.8009401, 1, 1, 1, 1, 1,
0.5617127, 0.330654, 0.2970393, 1, 1, 1, 1, 1,
0.5625505, 0.2204446, 0.6126499, 1, 1, 1, 1, 1,
0.5652046, -0.7257277, 3.810782, 1, 1, 1, 1, 1,
0.5666285, 0.9722661, 0.1522917, 1, 1, 1, 1, 1,
0.5693349, -1.535071, 2.892184, 1, 1, 1, 1, 1,
0.5711215, -0.9296086, 2.911736, 1, 1, 1, 1, 1,
0.5789438, 0.4368868, -0.07657966, 1, 1, 1, 1, 1,
0.5812739, -1.645288, 2.497698, 1, 1, 1, 1, 1,
0.5839877, 1.977162, 0.9207744, 1, 1, 1, 1, 1,
0.5877092, -0.998529, 3.043726, 1, 1, 1, 1, 1,
0.59684, 1.827843, -0.2877609, 0, 0, 1, 1, 1,
0.5983308, -0.2315374, 0.764969, 1, 0, 0, 1, 1,
0.5988448, 0.255035, 1.611131, 1, 0, 0, 1, 1,
0.6015405, 2.358334, -1.341224, 1, 0, 0, 1, 1,
0.6027812, 1.806954, 0.06856137, 1, 0, 0, 1, 1,
0.6074471, 0.3797236, -1.37998, 1, 0, 0, 1, 1,
0.6114939, 0.4651032, 1.551849, 0, 0, 0, 1, 1,
0.6169678, -0.7819976, 1.11622, 0, 0, 0, 1, 1,
0.6183235, -1.758989, 1.71386, 0, 0, 0, 1, 1,
0.6196947, 0.3842032, -1.120088, 0, 0, 0, 1, 1,
0.62101, 0.2201558, -0.4319744, 0, 0, 0, 1, 1,
0.6222156, -1.190497, 2.428129, 0, 0, 0, 1, 1,
0.6243085, -0.169351, 1.465423, 0, 0, 0, 1, 1,
0.6284032, -0.5011652, -0.1412698, 1, 1, 1, 1, 1,
0.6305186, 0.7586242, -0.1544006, 1, 1, 1, 1, 1,
0.6308713, -0.8517006, 2.541428, 1, 1, 1, 1, 1,
0.6385677, 2.09373, 1.72178, 1, 1, 1, 1, 1,
0.6442041, -1.727792, 0.6340908, 1, 1, 1, 1, 1,
0.6449842, -0.9547656, 1.507874, 1, 1, 1, 1, 1,
0.646294, 0.4757158, 1.364015, 1, 1, 1, 1, 1,
0.6543116, 0.4448576, 0.1684554, 1, 1, 1, 1, 1,
0.657109, -0.4882267, 2.231263, 1, 1, 1, 1, 1,
0.6625592, 1.241972, 0.8444527, 1, 1, 1, 1, 1,
0.6659644, -0.4270356, 3.517043, 1, 1, 1, 1, 1,
0.6662089, 1.229609, -0.4255348, 1, 1, 1, 1, 1,
0.6670474, 0.419506, 1.676162, 1, 1, 1, 1, 1,
0.6683177, -0.1477632, 1.84169, 1, 1, 1, 1, 1,
0.6721826, -0.1915552, 2.959075, 1, 1, 1, 1, 1,
0.6738225, 0.06171671, 1.120223, 0, 0, 1, 1, 1,
0.6760585, 1.230568, -0.9849172, 1, 0, 0, 1, 1,
0.6786725, 1.215985, -0.1245825, 1, 0, 0, 1, 1,
0.6818707, 1.759047, 0.1440566, 1, 0, 0, 1, 1,
0.6824035, 0.06749463, 0.4472346, 1, 0, 0, 1, 1,
0.6866815, -0.6515749, 2.818456, 1, 0, 0, 1, 1,
0.6874533, 1.249944, 0.7213368, 0, 0, 0, 1, 1,
0.6877599, -0.688522, 0.6282048, 0, 0, 0, 1, 1,
0.6907234, -0.7616239, 3.667372, 0, 0, 0, 1, 1,
0.6987432, -0.5905823, 4.361777, 0, 0, 0, 1, 1,
0.700425, -1.278069, 2.345123, 0, 0, 0, 1, 1,
0.7039358, -1.077281, 2.188248, 0, 0, 0, 1, 1,
0.7142212, 0.005362017, 0.7484915, 0, 0, 0, 1, 1,
0.7160653, 1.115065, 3.066719, 1, 1, 1, 1, 1,
0.7178553, -0.7756152, 0.9266408, 1, 1, 1, 1, 1,
0.718338, 0.06908407, 2.216097, 1, 1, 1, 1, 1,
0.7204062, -1.621769, 3.550048, 1, 1, 1, 1, 1,
0.7240866, 0.5969765, 1.482226, 1, 1, 1, 1, 1,
0.7285243, 1.224256, 0.7574402, 1, 1, 1, 1, 1,
0.7297042, 0.4689827, 0.1175928, 1, 1, 1, 1, 1,
0.7307588, 0.2874418, 0.4212278, 1, 1, 1, 1, 1,
0.7324628, -0.1096629, 3.006904, 1, 1, 1, 1, 1,
0.7343378, 1.438277, 1.848463, 1, 1, 1, 1, 1,
0.7344918, 1.425646, 1.234384, 1, 1, 1, 1, 1,
0.7361127, 0.3553628, 0.9816148, 1, 1, 1, 1, 1,
0.7378771, 2.920579, -0.3904658, 1, 1, 1, 1, 1,
0.7466841, 0.3141792, 1.388369, 1, 1, 1, 1, 1,
0.7473653, 1.448587, 0.6701875, 1, 1, 1, 1, 1,
0.7494195, 2.859708, -0.3939309, 0, 0, 1, 1, 1,
0.750231, -1.409777, 3.616891, 1, 0, 0, 1, 1,
0.75669, -0.4557758, 1.993367, 1, 0, 0, 1, 1,
0.7655652, -0.4723385, 2.242393, 1, 0, 0, 1, 1,
0.7705136, 0.6201823, -0.7963576, 1, 0, 0, 1, 1,
0.775064, -0.2167534, 0.1958076, 1, 0, 0, 1, 1,
0.7782047, 0.1142011, -0.04740448, 0, 0, 0, 1, 1,
0.7787886, -0.9918792, 3.368918, 0, 0, 0, 1, 1,
0.7788761, 0.952202, 0.1156268, 0, 0, 0, 1, 1,
0.7809731, -1.30678, 2.574117, 0, 0, 0, 1, 1,
0.7852131, 0.3677054, 0.8678277, 0, 0, 0, 1, 1,
0.7891357, 0.1978718, 1.405821, 0, 0, 0, 1, 1,
0.7933391, 0.1701941, 0.351778, 0, 0, 0, 1, 1,
0.7954425, 2.330923, 0.06501189, 1, 1, 1, 1, 1,
0.8019602, -0.563248, 1.123, 1, 1, 1, 1, 1,
0.805531, 1.121557, -1.331508, 1, 1, 1, 1, 1,
0.806888, 0.2794167, 0.4601008, 1, 1, 1, 1, 1,
0.809808, -1.071031, 2.139697, 1, 1, 1, 1, 1,
0.8144812, 0.2681205, 0.04227986, 1, 1, 1, 1, 1,
0.8167061, -0.6486644, 1.927405, 1, 1, 1, 1, 1,
0.8200233, -1.482164, 4.378019, 1, 1, 1, 1, 1,
0.8300859, 0.02415113, 2.472911, 1, 1, 1, 1, 1,
0.8316688, -1.082702, 3.808148, 1, 1, 1, 1, 1,
0.8338243, 1.785739, 0.9393908, 1, 1, 1, 1, 1,
0.8350257, 0.04301882, 1.576, 1, 1, 1, 1, 1,
0.8380293, -0.2353028, 0.6515077, 1, 1, 1, 1, 1,
0.8389902, 0.4745765, 0.9694675, 1, 1, 1, 1, 1,
0.8483953, -0.07051993, 1.580734, 1, 1, 1, 1, 1,
0.8505591, -1.116983, 1.876587, 0, 0, 1, 1, 1,
0.8542164, -2.068198, 1.249287, 1, 0, 0, 1, 1,
0.8611474, 0.1296578, 2.31071, 1, 0, 0, 1, 1,
0.8675991, 0.7878041, 0.04266347, 1, 0, 0, 1, 1,
0.8686748, 0.1355162, 0.9776932, 1, 0, 0, 1, 1,
0.8805639, -0.07332133, 2.847157, 1, 0, 0, 1, 1,
0.8823949, -1.551021, 4.279382, 0, 0, 0, 1, 1,
0.8856758, -1.495749, 2.761936, 0, 0, 0, 1, 1,
0.8867275, -1.305113, 4.569182, 0, 0, 0, 1, 1,
0.8880081, 1.866834, -0.3160698, 0, 0, 0, 1, 1,
0.8924868, -0.8982186, 4.620058, 0, 0, 0, 1, 1,
0.8945637, -0.6401532, 2.903898, 0, 0, 0, 1, 1,
0.8951481, 1.129838, 0.285025, 0, 0, 0, 1, 1,
0.8955675, 1.796921, 0.6609253, 1, 1, 1, 1, 1,
0.8989581, -1.087957, 3.830781, 1, 1, 1, 1, 1,
0.901796, 0.9790014, 0.5192687, 1, 1, 1, 1, 1,
0.9043438, 0.8932176, 1.150364, 1, 1, 1, 1, 1,
0.9071443, 1.998531, -0.6719249, 1, 1, 1, 1, 1,
0.9108484, -0.7113577, 3.535495, 1, 1, 1, 1, 1,
0.9163489, -0.6794782, 3.334911, 1, 1, 1, 1, 1,
0.9184185, -0.3557738, 1.486644, 1, 1, 1, 1, 1,
0.9202632, 0.4823427, 1.779925, 1, 1, 1, 1, 1,
0.922681, -0.9914914, 4.142872, 1, 1, 1, 1, 1,
0.922937, -0.08885135, 1.628365, 1, 1, 1, 1, 1,
0.9364635, -0.7916748, 1.974816, 1, 1, 1, 1, 1,
0.9368293, 1.758997, 0.6394805, 1, 1, 1, 1, 1,
0.9402196, 1.453949, 1.432237, 1, 1, 1, 1, 1,
0.9404461, 1.446305, 2.074576, 1, 1, 1, 1, 1,
0.9465894, -0.699342, 2.393196, 0, 0, 1, 1, 1,
0.9487656, -0.3810724, 1.860286, 1, 0, 0, 1, 1,
0.9562263, 0.4585733, 1.293184, 1, 0, 0, 1, 1,
0.9625988, -1.61099, 2.404649, 1, 0, 0, 1, 1,
0.967935, 0.05134594, 1.187009, 1, 0, 0, 1, 1,
0.9978248, 0.5647572, 0.5224786, 1, 0, 0, 1, 1,
1.000111, -0.5527544, 2.315921, 0, 0, 0, 1, 1,
1.006849, 1.274901, 0.8740687, 0, 0, 0, 1, 1,
1.009709, -1.488509, 2.190875, 0, 0, 0, 1, 1,
1.013496, -1.507205, 0.8371434, 0, 0, 0, 1, 1,
1.019238, -0.3689696, 3.332584, 0, 0, 0, 1, 1,
1.019789, 0.7070527, 1.169492, 0, 0, 0, 1, 1,
1.025114, 1.810011, -0.5522521, 0, 0, 0, 1, 1,
1.028295, 0.4216628, 1.376302, 1, 1, 1, 1, 1,
1.035928, 0.8538287, 3.083118, 1, 1, 1, 1, 1,
1.035978, 1.061019, 2.36152, 1, 1, 1, 1, 1,
1.04026, -0.5878332, 1.791021, 1, 1, 1, 1, 1,
1.041383, 0.5741582, 2.060474, 1, 1, 1, 1, 1,
1.054259, -0.06203417, 1.389081, 1, 1, 1, 1, 1,
1.05459, -0.6936294, 1.820914, 1, 1, 1, 1, 1,
1.055843, 0.5048292, 0.9790837, 1, 1, 1, 1, 1,
1.056935, 0.7434319, -0.1074951, 1, 1, 1, 1, 1,
1.058135, -1.696263, 2.108356, 1, 1, 1, 1, 1,
1.062189, -1.111919, 2.72999, 1, 1, 1, 1, 1,
1.068949, 1.126799, -0.1268752, 1, 1, 1, 1, 1,
1.071042, 0.2152964, 0.5758824, 1, 1, 1, 1, 1,
1.078175, -0.6413372, 3.155722, 1, 1, 1, 1, 1,
1.079721, -0.7083131, 1.673796, 1, 1, 1, 1, 1,
1.08548, -2.376083, 2.960729, 0, 0, 1, 1, 1,
1.090796, -0.3189993, 2.40913, 1, 0, 0, 1, 1,
1.097471, 1.836703, -0.5248442, 1, 0, 0, 1, 1,
1.099922, -0.7411966, 2.269006, 1, 0, 0, 1, 1,
1.109999, -0.4703359, 2.040532, 1, 0, 0, 1, 1,
1.110461, -0.6806614, 1.95205, 1, 0, 0, 1, 1,
1.112095, 0.3725615, 0.3185507, 0, 0, 0, 1, 1,
1.121649, -0.2990222, 1.850325, 0, 0, 0, 1, 1,
1.12459, 1.16515, 0.4717083, 0, 0, 0, 1, 1,
1.126016, 2.456178, 1.17633, 0, 0, 0, 1, 1,
1.137836, -1.142456, 3.8665, 0, 0, 0, 1, 1,
1.173517, 1.664882, 1.348096, 0, 0, 0, 1, 1,
1.18211, 1.399231, 1.967454, 0, 0, 0, 1, 1,
1.194089, -0.9843165, 0.8977221, 1, 1, 1, 1, 1,
1.207277, 1.872599, 0.8097642, 1, 1, 1, 1, 1,
1.216017, -0.3157587, 1.592323, 1, 1, 1, 1, 1,
1.218189, 0.4515378, 2.796282, 1, 1, 1, 1, 1,
1.232509, -0.2094333, 1.855957, 1, 1, 1, 1, 1,
1.236532, 0.07676584, 1.931436, 1, 1, 1, 1, 1,
1.238824, 0.8906723, 1.792116, 1, 1, 1, 1, 1,
1.240029, 0.2704728, 1.800206, 1, 1, 1, 1, 1,
1.2402, -2.324238, 2.627997, 1, 1, 1, 1, 1,
1.245844, -0.2936097, 1.511214, 1, 1, 1, 1, 1,
1.251258, -1.712781, 1.666889, 1, 1, 1, 1, 1,
1.260949, 0.06482454, 1.112068, 1, 1, 1, 1, 1,
1.26281, -1.850545, 3.385424, 1, 1, 1, 1, 1,
1.277609, 0.2258482, 2.129294, 1, 1, 1, 1, 1,
1.285006, 1.174568, 1.223257, 1, 1, 1, 1, 1,
1.286486, 1.341377, 0.4991451, 0, 0, 1, 1, 1,
1.289712, 0.7808892, 1.115561, 1, 0, 0, 1, 1,
1.289833, -0.3923672, 1.886754, 1, 0, 0, 1, 1,
1.291305, -0.2074906, 2.776127, 1, 0, 0, 1, 1,
1.291534, -0.02992867, 0.5228009, 1, 0, 0, 1, 1,
1.293415, -0.9159311, 2.361473, 1, 0, 0, 1, 1,
1.293687, -0.1432737, 1.319789, 0, 0, 0, 1, 1,
1.296824, -1.229161, 2.353567, 0, 0, 0, 1, 1,
1.307816, 0.8141985, 2.178239, 0, 0, 0, 1, 1,
1.314864, 0.7267579, 0.3078911, 0, 0, 0, 1, 1,
1.315027, 0.2410171, 1.409976, 0, 0, 0, 1, 1,
1.315723, 0.8671846, 1.963425, 0, 0, 0, 1, 1,
1.317932, -0.7061552, 1.29771, 0, 0, 0, 1, 1,
1.327733, -1.210868, 3.209875, 1, 1, 1, 1, 1,
1.329762, -0.08411751, 3.192912, 1, 1, 1, 1, 1,
1.329925, 0.5135043, 0.4917318, 1, 1, 1, 1, 1,
1.329944, 1.071988, 1.159471, 1, 1, 1, 1, 1,
1.332831, -1.545829, 3.379762, 1, 1, 1, 1, 1,
1.341193, -0.6248022, 1.690595, 1, 1, 1, 1, 1,
1.34867, -2.095734, 1.937079, 1, 1, 1, 1, 1,
1.350113, -0.8716757, 1.333966, 1, 1, 1, 1, 1,
1.352996, -0.5145709, 3.074664, 1, 1, 1, 1, 1,
1.359748, -1.147544, 3.972183, 1, 1, 1, 1, 1,
1.36014, -1.927948, 4.456935, 1, 1, 1, 1, 1,
1.363374, 0.3266251, 2.428953, 1, 1, 1, 1, 1,
1.367053, 1.132077, -1.31584, 1, 1, 1, 1, 1,
1.385107, -0.5511031, 1.802895, 1, 1, 1, 1, 1,
1.387465, 0.1570216, 1.187918, 1, 1, 1, 1, 1,
1.388104, 0.57552, 1.528694, 0, 0, 1, 1, 1,
1.390924, -0.9683012, 0.7148697, 1, 0, 0, 1, 1,
1.399233, -2.021555, 2.671344, 1, 0, 0, 1, 1,
1.40603, -0.6085052, 0.3872392, 1, 0, 0, 1, 1,
1.415667, 1.119018, -0.8259007, 1, 0, 0, 1, 1,
1.415721, 1.025471, 0.939678, 1, 0, 0, 1, 1,
1.430639, -1.009814, 2.934956, 0, 0, 0, 1, 1,
1.432257, -1.030234, 3.7636, 0, 0, 0, 1, 1,
1.437236, 0.07225402, 0.2405327, 0, 0, 0, 1, 1,
1.438027, -1.718488, 2.52197, 0, 0, 0, 1, 1,
1.472936, 0.8296438, 2.198728, 0, 0, 0, 1, 1,
1.481146, -0.6724845, 1.070039, 0, 0, 0, 1, 1,
1.485662, -0.2855004, 1.105217, 0, 0, 0, 1, 1,
1.505807, -0.3349781, 1.390896, 1, 1, 1, 1, 1,
1.516948, 0.7122059, 0.7344953, 1, 1, 1, 1, 1,
1.518909, 0.623462, -0.5710785, 1, 1, 1, 1, 1,
1.52775, 0.2702177, 0.7827919, 1, 1, 1, 1, 1,
1.528321, 0.8880429, 0.7860247, 1, 1, 1, 1, 1,
1.536949, -0.1662035, 1.470966, 1, 1, 1, 1, 1,
1.558643, 1.217212, 1.693566, 1, 1, 1, 1, 1,
1.575796, -0.002939273, 1.432753, 1, 1, 1, 1, 1,
1.578394, -1.320744, 2.637925, 1, 1, 1, 1, 1,
1.579833, -0.5825875, 1.509969, 1, 1, 1, 1, 1,
1.58248, -1.345719, 3.389018, 1, 1, 1, 1, 1,
1.597529, -1.394474, 2.107458, 1, 1, 1, 1, 1,
1.612257, 0.002466541, 1.071359, 1, 1, 1, 1, 1,
1.621801, 0.3582599, 0.5950398, 1, 1, 1, 1, 1,
1.65982, -0.9088832, 2.35317, 1, 1, 1, 1, 1,
1.660443, -0.0447475, 0.5079753, 0, 0, 1, 1, 1,
1.661888, -0.2702208, 1.355283, 1, 0, 0, 1, 1,
1.669337, -0.5296009, 3.520154, 1, 0, 0, 1, 1,
1.677716, 2.307215, -0.5234417, 1, 0, 0, 1, 1,
1.687624, 0.3587731, -1.774694, 1, 0, 0, 1, 1,
1.720093, 0.994071, 3.259426, 1, 0, 0, 1, 1,
1.731882, -0.4145478, 2.43073, 0, 0, 0, 1, 1,
1.73968, 2.594669, 0.3701345, 0, 0, 0, 1, 1,
1.742676, 0.1438833, 1.158976, 0, 0, 0, 1, 1,
1.75216, -0.2730608, 2.057146, 0, 0, 0, 1, 1,
1.752884, 0.371315, 2.288519, 0, 0, 0, 1, 1,
1.767484, -0.03009651, 1.092802, 0, 0, 0, 1, 1,
1.777022, 0.7522618, 0.7133194, 0, 0, 0, 1, 1,
1.777302, 0.1633941, 1.894371, 1, 1, 1, 1, 1,
1.78042, 0.8853214, 1.6201, 1, 1, 1, 1, 1,
1.78191, 0.03560498, 2.138948, 1, 1, 1, 1, 1,
1.84323, -0.6200244, 1.225397, 1, 1, 1, 1, 1,
1.882185, -0.3404823, 1.542635, 1, 1, 1, 1, 1,
1.888103, -0.3134182, 1.171332, 1, 1, 1, 1, 1,
1.939233, -0.1718601, 1.815023, 1, 1, 1, 1, 1,
1.943456, 0.5257239, 1.091733, 1, 1, 1, 1, 1,
1.949294, 0.3303505, 1.448682, 1, 1, 1, 1, 1,
1.979472, -0.3173184, 2.628256, 1, 1, 1, 1, 1,
1.982667, -0.3693218, 2.783055, 1, 1, 1, 1, 1,
1.998073, 0.6991138, 0.2270762, 1, 1, 1, 1, 1,
2.06199, 1.431752, 0.8358428, 1, 1, 1, 1, 1,
2.088884, -1.282268, 3.051921, 1, 1, 1, 1, 1,
2.091866, 0.2086928, 1.303499, 1, 1, 1, 1, 1,
2.138274, 0.5275888, -0.5332309, 0, 0, 1, 1, 1,
2.174832, 0.1187587, 1.948637, 1, 0, 0, 1, 1,
2.210602, -0.240861, 3.113799, 1, 0, 0, 1, 1,
2.222964, -0.1157551, 2.415674, 1, 0, 0, 1, 1,
2.241503, -0.4705734, 0.7572441, 1, 0, 0, 1, 1,
2.263214, 0.1184162, 2.640997, 1, 0, 0, 1, 1,
2.293495, 0.4068324, 0.3181106, 0, 0, 0, 1, 1,
2.297845, -0.5956195, 2.975835, 0, 0, 0, 1, 1,
2.332132, 0.08751847, 1.655357, 0, 0, 0, 1, 1,
2.364549, -1.290021, 2.865864, 0, 0, 0, 1, 1,
2.377383, -0.1483493, 2.136921, 0, 0, 0, 1, 1,
2.47012, -1.100027, 0.3381402, 0, 0, 0, 1, 1,
2.527399, -0.01278556, -0.6012934, 0, 0, 0, 1, 1,
2.535859, 2.487374, 1.726667, 1, 1, 1, 1, 1,
2.618855, -0.7258465, 1.447156, 1, 1, 1, 1, 1,
2.65676, 0.1015562, 2.223732, 1, 1, 1, 1, 1,
2.65754, -0.9133469, 2.224627, 1, 1, 1, 1, 1,
2.668723, -1.262768, 2.586459, 1, 1, 1, 1, 1,
3.016104, 0.6514872, 1.674664, 1, 1, 1, 1, 1,
3.066927, 0.005164069, 1.278116, 1, 1, 1, 1, 1
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
var radius = 9.590985;
var distance = 33.68793;
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
mvMatrix.translate( 0.1436424, -0.2507597, 0.1758497 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.68793);
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