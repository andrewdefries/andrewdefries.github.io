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
-3.276568, -0.9316277, -2.231338, 1, 0, 0, 1,
-2.908918, 0.2145081, -1.017261, 1, 0.007843138, 0, 1,
-2.901264, 1.280392, -0.9740404, 1, 0.01176471, 0, 1,
-2.740309, -0.625917, -2.776159, 1, 0.01960784, 0, 1,
-2.60913, 0.7915966, -1.808002, 1, 0.02352941, 0, 1,
-2.548176, 1.069181, -1.066381, 1, 0.03137255, 0, 1,
-2.474566, -0.05745346, -2.684087, 1, 0.03529412, 0, 1,
-2.180179, -1.528737, -2.570361, 1, 0.04313726, 0, 1,
-2.16483, -0.9353323, -2.486153, 1, 0.04705882, 0, 1,
-2.160794, 0.3314132, -1.959905, 1, 0.05490196, 0, 1,
-2.138673, 1.04134, -0.6001031, 1, 0.05882353, 0, 1,
-2.116857, -1.239888, -1.570539, 1, 0.06666667, 0, 1,
-2.068655, 0.9191875, -1.529556, 1, 0.07058824, 0, 1,
-2.066891, 0.287105, -0.3021106, 1, 0.07843138, 0, 1,
-2.058951, 0.6482416, -0.6953748, 1, 0.08235294, 0, 1,
-2.043837, -1.646736, -1.514004, 1, 0.09019608, 0, 1,
-2.040634, 2.124041, -1.876155, 1, 0.09411765, 0, 1,
-2.036138, -1.516964, -0.960105, 1, 0.1019608, 0, 1,
-1.983029, 0.4895943, -1.50914, 1, 0.1098039, 0, 1,
-1.932291, 1.344877, -1.168135, 1, 0.1137255, 0, 1,
-1.910882, 0.2332285, -3.646603, 1, 0.1215686, 0, 1,
-1.895647, 2.251589, -2.121925, 1, 0.1254902, 0, 1,
-1.8884, 1.227468, -0.6896997, 1, 0.1333333, 0, 1,
-1.873504, -1.193946, -2.661351, 1, 0.1372549, 0, 1,
-1.873018, -0.007419045, -2.012795, 1, 0.145098, 0, 1,
-1.862222, -0.3375836, -0.4904669, 1, 0.1490196, 0, 1,
-1.850862, 0.4222892, -2.002447, 1, 0.1568628, 0, 1,
-1.825039, -0.146739, -1.879579, 1, 0.1607843, 0, 1,
-1.818494, -2.762827, -2.475439, 1, 0.1686275, 0, 1,
-1.80945, -0.1687618, -1.279029, 1, 0.172549, 0, 1,
-1.809024, 0.3145896, -1.638202, 1, 0.1803922, 0, 1,
-1.807673, 0.8826616, 0.7156603, 1, 0.1843137, 0, 1,
-1.774, 0.8568426, 1.008437, 1, 0.1921569, 0, 1,
-1.76689, -0.1270444, 0.788185, 1, 0.1960784, 0, 1,
-1.756416, 0.5002576, -3.514025, 1, 0.2039216, 0, 1,
-1.722598, 0.8699245, -1.779749, 1, 0.2117647, 0, 1,
-1.715506, -1.357468, -2.829566, 1, 0.2156863, 0, 1,
-1.714503, 0.8238069, -1.093334, 1, 0.2235294, 0, 1,
-1.713199, 0.9532037, 0.09240547, 1, 0.227451, 0, 1,
-1.711136, -2.421741, -0.6531768, 1, 0.2352941, 0, 1,
-1.706497, 0.4357046, -0.4365794, 1, 0.2392157, 0, 1,
-1.688619, 0.8914837, -0.8223671, 1, 0.2470588, 0, 1,
-1.687354, -1.195246, 0.7425853, 1, 0.2509804, 0, 1,
-1.686769, -0.474759, -2.008677, 1, 0.2588235, 0, 1,
-1.681572, 0.2949642, -1.665984, 1, 0.2627451, 0, 1,
-1.658077, 0.6750386, -0.9489241, 1, 0.2705882, 0, 1,
-1.657395, 0.3440512, -2.063796, 1, 0.2745098, 0, 1,
-1.648972, -2.126559, -2.803638, 1, 0.282353, 0, 1,
-1.64845, -0.6402864, -2.224658, 1, 0.2862745, 0, 1,
-1.648074, -0.7220894, 0.4462195, 1, 0.2941177, 0, 1,
-1.632885, -1.018211, -2.381698, 1, 0.3019608, 0, 1,
-1.632193, 1.976754, -1.020915, 1, 0.3058824, 0, 1,
-1.619648, -0.2288809, -1.366714, 1, 0.3137255, 0, 1,
-1.613356, 1.367548, -0.241148, 1, 0.3176471, 0, 1,
-1.595827, 0.9840725, -1.862745, 1, 0.3254902, 0, 1,
-1.592201, -1.596532, -2.131449, 1, 0.3294118, 0, 1,
-1.587429, 1.589356, -1.969083, 1, 0.3372549, 0, 1,
-1.584026, -1.0885, -1.63612, 1, 0.3411765, 0, 1,
-1.5812, -1.043683, -2.453852, 1, 0.3490196, 0, 1,
-1.555508, 0.5189938, -0.6741523, 1, 0.3529412, 0, 1,
-1.549979, 0.7780992, -1.210873, 1, 0.3607843, 0, 1,
-1.548471, -2.494034, -4.15754, 1, 0.3647059, 0, 1,
-1.547548, -1.134139, -0.4472481, 1, 0.372549, 0, 1,
-1.541258, -2.059562, -2.653094, 1, 0.3764706, 0, 1,
-1.540947, 0.7716711, -2.373619, 1, 0.3843137, 0, 1,
-1.537149, -2.140076, -3.215675, 1, 0.3882353, 0, 1,
-1.520041, -0.2732283, -3.104436, 1, 0.3960784, 0, 1,
-1.518132, 0.6587983, -0.7337915, 1, 0.4039216, 0, 1,
-1.481514, -0.7191803, -1.221574, 1, 0.4078431, 0, 1,
-1.47982, 1.051981, -1.298072, 1, 0.4156863, 0, 1,
-1.47247, 1.10831, -0.6853094, 1, 0.4196078, 0, 1,
-1.471343, -0.8583111, -2.013773, 1, 0.427451, 0, 1,
-1.456036, 0.07759428, -0.9475531, 1, 0.4313726, 0, 1,
-1.449618, -0.6461442, -3.025968, 1, 0.4392157, 0, 1,
-1.445756, 1.578529, 0.9901991, 1, 0.4431373, 0, 1,
-1.435946, -0.0433671, -3.087616, 1, 0.4509804, 0, 1,
-1.430985, -0.5722085, -3.353034, 1, 0.454902, 0, 1,
-1.416711, 0.2821013, -3.476577, 1, 0.4627451, 0, 1,
-1.402726, -0.5001402, -3.311579, 1, 0.4666667, 0, 1,
-1.396411, 0.5669718, -1.693696, 1, 0.4745098, 0, 1,
-1.394427, 0.6112657, -0.2511123, 1, 0.4784314, 0, 1,
-1.390348, 0.7018322, -1.477018, 1, 0.4862745, 0, 1,
-1.381057, 1.79421, 0.4225219, 1, 0.4901961, 0, 1,
-1.373166, -1.02371, -0.02665933, 1, 0.4980392, 0, 1,
-1.366011, -2.229513, -2.327881, 1, 0.5058824, 0, 1,
-1.36103, -0.7313201, -2.09839, 1, 0.509804, 0, 1,
-1.344863, -0.2702567, -3.227584, 1, 0.5176471, 0, 1,
-1.340482, -1.129479, -2.602079, 1, 0.5215687, 0, 1,
-1.336924, -0.02586782, -1.137211, 1, 0.5294118, 0, 1,
-1.328997, 3.215797, -1.079746, 1, 0.5333334, 0, 1,
-1.323145, -0.8790569, -1.413934, 1, 0.5411765, 0, 1,
-1.318719, 0.09674509, -2.814775, 1, 0.5450981, 0, 1,
-1.309806, -2.087276, -2.196582, 1, 0.5529412, 0, 1,
-1.304988, 2.16067, 0.3100051, 1, 0.5568628, 0, 1,
-1.294345, -0.651356, -0.493674, 1, 0.5647059, 0, 1,
-1.286982, -0.02034501, -1.615209, 1, 0.5686275, 0, 1,
-1.278691, -0.6349542, -1.27484, 1, 0.5764706, 0, 1,
-1.270604, 0.4454435, -1.974593, 1, 0.5803922, 0, 1,
-1.266103, -0.6023119, -0.9772499, 1, 0.5882353, 0, 1,
-1.261196, 1.111694, -0.405248, 1, 0.5921569, 0, 1,
-1.260785, 2.128002, -0.4528033, 1, 0.6, 0, 1,
-1.259074, 0.787701, -1.740623, 1, 0.6078432, 0, 1,
-1.258045, -0.936712, -0.7265945, 1, 0.6117647, 0, 1,
-1.251198, -0.825229, -2.092226, 1, 0.6196079, 0, 1,
-1.250601, -1.412178, -3.809882, 1, 0.6235294, 0, 1,
-1.245762, 1.420697, -1.551404, 1, 0.6313726, 0, 1,
-1.233722, 0.1235285, 0.01517151, 1, 0.6352941, 0, 1,
-1.23351, 1.623157, 0.3053474, 1, 0.6431373, 0, 1,
-1.230515, -1.504264, -1.591437, 1, 0.6470588, 0, 1,
-1.229208, -0.8461075, -1.416798, 1, 0.654902, 0, 1,
-1.206785, -1.166467, -2.447105, 1, 0.6588235, 0, 1,
-1.190641, 0.9127452, 0.786086, 1, 0.6666667, 0, 1,
-1.186916, -1.911764, -3.021826, 1, 0.6705883, 0, 1,
-1.17868, -0.4224853, -1.964665, 1, 0.6784314, 0, 1,
-1.174482, -1.521546, -0.5476773, 1, 0.682353, 0, 1,
-1.172886, 0.413834, -2.32151, 1, 0.6901961, 0, 1,
-1.167816, -0.1355183, -0.478227, 1, 0.6941177, 0, 1,
-1.151312, -1.702156, -1.725025, 1, 0.7019608, 0, 1,
-1.147605, -0.05145488, 1.043358, 1, 0.7098039, 0, 1,
-1.133615, -0.5982213, -3.435232, 1, 0.7137255, 0, 1,
-1.128415, 1.406526, -0.4041217, 1, 0.7215686, 0, 1,
-1.115825, -1.334484, -1.887199, 1, 0.7254902, 0, 1,
-1.112091, -1.857105, -2.70055, 1, 0.7333333, 0, 1,
-1.11193, 0.4546136, 0.274567, 1, 0.7372549, 0, 1,
-1.107478, -0.4128042, -3.7519, 1, 0.7450981, 0, 1,
-1.106059, 0.2311989, -2.822435, 1, 0.7490196, 0, 1,
-1.097306, 0.02161131, -0.1752628, 1, 0.7568628, 0, 1,
-1.092417, 1.776979, -0.6097869, 1, 0.7607843, 0, 1,
-1.090693, -0.4671636, -2.266101, 1, 0.7686275, 0, 1,
-1.087206, -0.7922316, -0.6662309, 1, 0.772549, 0, 1,
-1.086934, -0.2357499, -1.796137, 1, 0.7803922, 0, 1,
-1.082552, -1.639593, -1.500943, 1, 0.7843137, 0, 1,
-1.081583, -1.514027, -4.201299, 1, 0.7921569, 0, 1,
-1.079889, -0.3927218, -1.122902, 1, 0.7960784, 0, 1,
-1.077824, -1.103334, -1.509791, 1, 0.8039216, 0, 1,
-1.07086, -1.37532, -2.92579, 1, 0.8117647, 0, 1,
-1.070594, 0.08315634, -2.593974, 1, 0.8156863, 0, 1,
-1.067058, -0.156868, -0.2699875, 1, 0.8235294, 0, 1,
-1.062556, 0.5071687, -1.505923, 1, 0.827451, 0, 1,
-1.056793, 1.181588, -2.220571, 1, 0.8352941, 0, 1,
-1.050845, -0.1427758, -1.78227, 1, 0.8392157, 0, 1,
-1.046465, 1.114019, -1.543499, 1, 0.8470588, 0, 1,
-1.040861, -0.9982877, -1.881734, 1, 0.8509804, 0, 1,
-1.039555, 1.198515, -1.491914, 1, 0.8588235, 0, 1,
-1.038257, -1.107797, -1.934676, 1, 0.8627451, 0, 1,
-1.03557, 0.0290624, -1.995916, 1, 0.8705882, 0, 1,
-1.035242, 0.4434613, -0.305255, 1, 0.8745098, 0, 1,
-1.029449, 0.6828268, -1.295782, 1, 0.8823529, 0, 1,
-1.023014, -0.2914419, -4.05448, 1, 0.8862745, 0, 1,
-1.013686, -0.006637254, -2.21559, 1, 0.8941177, 0, 1,
-1.012106, -0.1903212, -2.72153, 1, 0.8980392, 0, 1,
-1.006008, 0.1149047, -0.2563809, 1, 0.9058824, 0, 1,
-1.0044, 1.311609, 1.425695, 1, 0.9137255, 0, 1,
-1.002068, 0.4165861, -1.231521, 1, 0.9176471, 0, 1,
-1.000942, -0.4509308, -1.388141, 1, 0.9254902, 0, 1,
-0.9929978, 0.1750165, -1.387785, 1, 0.9294118, 0, 1,
-0.9929896, 1.241942, 0.4794815, 1, 0.9372549, 0, 1,
-0.9923721, -0.03299665, -1.437589, 1, 0.9411765, 0, 1,
-0.992214, -0.3829439, -1.14618, 1, 0.9490196, 0, 1,
-0.9890282, -0.8035673, -3.771753, 1, 0.9529412, 0, 1,
-0.9870703, -2.465125, -2.350714, 1, 0.9607843, 0, 1,
-0.9864432, -0.3657517, 1.029203, 1, 0.9647059, 0, 1,
-0.9824984, -0.2928667, -1.818062, 1, 0.972549, 0, 1,
-0.9689219, -2.02455, -4.032785, 1, 0.9764706, 0, 1,
-0.9640282, 1.567768, -1.764428, 1, 0.9843137, 0, 1,
-0.9618992, 0.3873613, -0.4722443, 1, 0.9882353, 0, 1,
-0.961613, -0.5915555, -0.6786683, 1, 0.9960784, 0, 1,
-0.9585021, 0.9067531, -2.219748, 0.9960784, 1, 0, 1,
-0.9576575, -1.335519, -0.7998036, 0.9921569, 1, 0, 1,
-0.9562798, -0.7603079, -2.110281, 0.9843137, 1, 0, 1,
-0.9471219, 2.754498, 0.00162136, 0.9803922, 1, 0, 1,
-0.9423146, 0.3200589, -2.597542, 0.972549, 1, 0, 1,
-0.9317406, -1.482219, -3.46129, 0.9686275, 1, 0, 1,
-0.924936, -1.320967, -3.593056, 0.9607843, 1, 0, 1,
-0.9246268, -1.075118, -3.800574, 0.9568627, 1, 0, 1,
-0.9114531, 0.5075873, 0.1187343, 0.9490196, 1, 0, 1,
-0.9075837, 0.1450217, -2.42886, 0.945098, 1, 0, 1,
-0.9067201, -1.505437, -3.082773, 0.9372549, 1, 0, 1,
-0.8980309, -0.9503901, -2.871497, 0.9333333, 1, 0, 1,
-0.8885615, -1.739189, -1.313949, 0.9254902, 1, 0, 1,
-0.8884143, -2.068364, -2.230121, 0.9215686, 1, 0, 1,
-0.8835696, 0.3759745, -0.724413, 0.9137255, 1, 0, 1,
-0.8795896, -0.7131288, -2.081137, 0.9098039, 1, 0, 1,
-0.8768434, -1.224355, -3.406217, 0.9019608, 1, 0, 1,
-0.8733951, 1.900013, -0.7397247, 0.8941177, 1, 0, 1,
-0.8725618, 0.7286413, -1.467601, 0.8901961, 1, 0, 1,
-0.8713793, -0.05991365, -1.645098, 0.8823529, 1, 0, 1,
-0.8692821, -0.779286, -2.183084, 0.8784314, 1, 0, 1,
-0.8606573, -1.153284, -2.238748, 0.8705882, 1, 0, 1,
-0.8548518, -0.5753781, -1.999107, 0.8666667, 1, 0, 1,
-0.8481899, -0.5646153, -2.654351, 0.8588235, 1, 0, 1,
-0.8449409, 0.2350446, -1.476105, 0.854902, 1, 0, 1,
-0.8445385, -0.09473862, -1.346804, 0.8470588, 1, 0, 1,
-0.8444672, 0.1423448, -1.391113, 0.8431373, 1, 0, 1,
-0.8347481, -0.5385389, -2.528549, 0.8352941, 1, 0, 1,
-0.8261734, 0.3616283, -0.4212936, 0.8313726, 1, 0, 1,
-0.8195042, -0.6351438, -2.65465, 0.8235294, 1, 0, 1,
-0.8181855, -0.451323, -1.486048, 0.8196079, 1, 0, 1,
-0.8148231, -0.3161816, -1.003405, 0.8117647, 1, 0, 1,
-0.8133053, 1.987812, -0.2627167, 0.8078431, 1, 0, 1,
-0.8108571, 0.5349569, -0.8705133, 0.8, 1, 0, 1,
-0.8059905, -0.8132616, -2.095643, 0.7921569, 1, 0, 1,
-0.801633, -0.184725, -1.831104, 0.7882353, 1, 0, 1,
-0.7851186, -0.7257829, -2.702446, 0.7803922, 1, 0, 1,
-0.7849717, -0.7240324, -1.212468, 0.7764706, 1, 0, 1,
-0.7803497, 1.40658, -2.283466, 0.7686275, 1, 0, 1,
-0.7793766, 1.165561, -1.623896, 0.7647059, 1, 0, 1,
-0.7740234, 0.0684075, -0.1841761, 0.7568628, 1, 0, 1,
-0.7707292, 2.634924, 0.6876366, 0.7529412, 1, 0, 1,
-0.7673767, -1.039052, -2.042099, 0.7450981, 1, 0, 1,
-0.7663392, 0.3567316, -2.3132, 0.7411765, 1, 0, 1,
-0.7659512, 0.4921892, -1.224041, 0.7333333, 1, 0, 1,
-0.759232, 1.862797, -0.3634635, 0.7294118, 1, 0, 1,
-0.7592134, -0.5662454, -2.224716, 0.7215686, 1, 0, 1,
-0.7585772, -1.574887, -3.047244, 0.7176471, 1, 0, 1,
-0.7581734, -0.09873725, -2.502374, 0.7098039, 1, 0, 1,
-0.751325, 0.8943816, -0.4476029, 0.7058824, 1, 0, 1,
-0.7508608, 1.502898, -0.8851199, 0.6980392, 1, 0, 1,
-0.7466695, 0.4468982, -1.516913, 0.6901961, 1, 0, 1,
-0.7447149, -1.535267, -2.707393, 0.6862745, 1, 0, 1,
-0.7392232, -0.7797571, -2.413738, 0.6784314, 1, 0, 1,
-0.7345926, 0.5043035, -2.02596, 0.6745098, 1, 0, 1,
-0.7345457, -0.3653841, -1.573256, 0.6666667, 1, 0, 1,
-0.7274541, -0.4870391, -2.153613, 0.6627451, 1, 0, 1,
-0.7262658, -0.6959335, -1.536997, 0.654902, 1, 0, 1,
-0.7243229, 1.463733, -2.213266, 0.6509804, 1, 0, 1,
-0.7172465, -0.6402738, -2.634564, 0.6431373, 1, 0, 1,
-0.7170385, -0.05354412, -1.172983, 0.6392157, 1, 0, 1,
-0.7160353, 1.363241, -0.4140835, 0.6313726, 1, 0, 1,
-0.7146077, -0.3050267, -2.458505, 0.627451, 1, 0, 1,
-0.7126457, 0.1019888, -2.410693, 0.6196079, 1, 0, 1,
-0.7022344, -0.7009518, -1.470826, 0.6156863, 1, 0, 1,
-0.6980566, -0.3883071, -0.4886897, 0.6078432, 1, 0, 1,
-0.6952083, 2.616913, -0.07754264, 0.6039216, 1, 0, 1,
-0.6879048, 0.03685316, -0.2724363, 0.5960785, 1, 0, 1,
-0.6841393, -1.580163, -1.855682, 0.5882353, 1, 0, 1,
-0.6800197, 2.500968, -0.6934221, 0.5843138, 1, 0, 1,
-0.6768073, 1.696291, -0.8808157, 0.5764706, 1, 0, 1,
-0.675341, -1.10042, -5.02163, 0.572549, 1, 0, 1,
-0.6735771, -0.7007837, -1.395689, 0.5647059, 1, 0, 1,
-0.6733191, -0.3213485, -0.03829338, 0.5607843, 1, 0, 1,
-0.6652837, 0.4611301, -1.83762, 0.5529412, 1, 0, 1,
-0.6625656, -0.320385, -2.375593, 0.5490196, 1, 0, 1,
-0.6617078, -0.2915422, -0.2829621, 0.5411765, 1, 0, 1,
-0.659461, -1.20504, -2.981666, 0.5372549, 1, 0, 1,
-0.6579338, -0.1997065, -1.540045, 0.5294118, 1, 0, 1,
-0.6561447, 0.3853188, -0.3011056, 0.5254902, 1, 0, 1,
-0.6543251, 1.102295, 2.094092, 0.5176471, 1, 0, 1,
-0.651929, 1.188794, -1.611333, 0.5137255, 1, 0, 1,
-0.648751, -1.022493, -2.250535, 0.5058824, 1, 0, 1,
-0.6463205, -1.631313, -3.422822, 0.5019608, 1, 0, 1,
-0.6441749, 0.5234048, -2.527229, 0.4941176, 1, 0, 1,
-0.6428371, -0.01655002, -2.902374, 0.4862745, 1, 0, 1,
-0.6400082, 0.7180255, -1.522498, 0.4823529, 1, 0, 1,
-0.6383659, 0.03090102, -0.6696929, 0.4745098, 1, 0, 1,
-0.6261783, -0.8070124, -2.681613, 0.4705882, 1, 0, 1,
-0.6213769, -1.309634, -1.615529, 0.4627451, 1, 0, 1,
-0.6179789, 0.5959244, -1.263323, 0.4588235, 1, 0, 1,
-0.6164551, 0.07804848, -1.005967, 0.4509804, 1, 0, 1,
-0.6093559, -0.5737984, -2.547681, 0.4470588, 1, 0, 1,
-0.6070542, -1.298776, -3.537341, 0.4392157, 1, 0, 1,
-0.6069275, 0.5887432, -1.5795, 0.4352941, 1, 0, 1,
-0.6053602, 0.6049036, -1.101285, 0.427451, 1, 0, 1,
-0.6049041, -0.2542882, 0.6593502, 0.4235294, 1, 0, 1,
-0.6029949, 0.4672692, -1.159978, 0.4156863, 1, 0, 1,
-0.5972517, 1.459232, -0.6275886, 0.4117647, 1, 0, 1,
-0.5968875, 0.3642453, -1.379709, 0.4039216, 1, 0, 1,
-0.5926217, -0.6814548, -0.7410889, 0.3960784, 1, 0, 1,
-0.5871067, -0.3299542, -0.9413475, 0.3921569, 1, 0, 1,
-0.5823011, 0.4326669, -2.263535, 0.3843137, 1, 0, 1,
-0.563623, 2.23971, -1.264821, 0.3803922, 1, 0, 1,
-0.5636123, 0.4647461, -0.7262276, 0.372549, 1, 0, 1,
-0.5612233, 0.2339547, -1.30946, 0.3686275, 1, 0, 1,
-0.5609329, -0.4241154, -4.568057, 0.3607843, 1, 0, 1,
-0.5588683, 1.55906, 2.436056, 0.3568628, 1, 0, 1,
-0.5585235, -0.4520243, -2.016064, 0.3490196, 1, 0, 1,
-0.5571001, 0.3856509, -1.019621, 0.345098, 1, 0, 1,
-0.5484634, 2.50508, -0.6902621, 0.3372549, 1, 0, 1,
-0.5429564, -0.9967337, -3.397577, 0.3333333, 1, 0, 1,
-0.5410942, 1.23291, -0.6279389, 0.3254902, 1, 0, 1,
-0.5397322, 0.1107946, -3.576229, 0.3215686, 1, 0, 1,
-0.5338047, -0.9145705, -1.850765, 0.3137255, 1, 0, 1,
-0.5276818, 0.172296, -0.8473803, 0.3098039, 1, 0, 1,
-0.5220191, -0.4118336, -1.842494, 0.3019608, 1, 0, 1,
-0.519236, 0.9318011, -1.601637, 0.2941177, 1, 0, 1,
-0.5184124, 1.500551, 1.177268, 0.2901961, 1, 0, 1,
-0.5155267, 0.2939159, -2.245175, 0.282353, 1, 0, 1,
-0.5131274, 0.2079742, -0.6939626, 0.2784314, 1, 0, 1,
-0.5031478, 2.675096, -2.184984, 0.2705882, 1, 0, 1,
-0.5005548, 0.4611422, -0.4191615, 0.2666667, 1, 0, 1,
-0.4970014, 1.10827, -1.297255, 0.2588235, 1, 0, 1,
-0.4956392, -0.3711964, -2.682948, 0.254902, 1, 0, 1,
-0.48604, -1.044357, -2.81907, 0.2470588, 1, 0, 1,
-0.4841586, 1.556174, -1.104003, 0.2431373, 1, 0, 1,
-0.4828163, 1.079528, -1.486789, 0.2352941, 1, 0, 1,
-0.4801993, -1.876611, -3.285104, 0.2313726, 1, 0, 1,
-0.4784186, 0.4708868, -1.540147, 0.2235294, 1, 0, 1,
-0.4782687, 0.2421361, -2.722853, 0.2196078, 1, 0, 1,
-0.4778776, 1.404261, 0.7828291, 0.2117647, 1, 0, 1,
-0.4772034, -0.05269234, -1.095159, 0.2078431, 1, 0, 1,
-0.4741231, -1.45269, -4.458786, 0.2, 1, 0, 1,
-0.4730155, 0.9719347, -1.461277, 0.1921569, 1, 0, 1,
-0.467549, 0.490826, -1.646357, 0.1882353, 1, 0, 1,
-0.466264, -1.699249, -5.669927, 0.1803922, 1, 0, 1,
-0.4648346, -0.6934667, -2.576804, 0.1764706, 1, 0, 1,
-0.4612685, 1.042636, 0.205349, 0.1686275, 1, 0, 1,
-0.4589049, -0.8551146, -2.42511, 0.1647059, 1, 0, 1,
-0.4585626, -0.6395127, -4.579873, 0.1568628, 1, 0, 1,
-0.4571867, -0.9947779, 0.03247786, 0.1529412, 1, 0, 1,
-0.4560901, 0.2791278, -1.974387, 0.145098, 1, 0, 1,
-0.4537719, -0.2663349, -1.973596, 0.1411765, 1, 0, 1,
-0.4508755, 1.195949, 0.7364473, 0.1333333, 1, 0, 1,
-0.4505071, 0.1051609, 0.0578153, 0.1294118, 1, 0, 1,
-0.4487396, -1.290674, -2.974475, 0.1215686, 1, 0, 1,
-0.4482318, 2.744761, -0.8771928, 0.1176471, 1, 0, 1,
-0.4427056, 0.7159283, -1.88353, 0.1098039, 1, 0, 1,
-0.4410583, -1.633348, -2.033517, 0.1058824, 1, 0, 1,
-0.4395211, 0.766656, -2.8738, 0.09803922, 1, 0, 1,
-0.4360917, -0.4235903, -4.278261, 0.09019608, 1, 0, 1,
-0.430964, -1.9248, -3.320068, 0.08627451, 1, 0, 1,
-0.4296861, -1.171776, -1.046465, 0.07843138, 1, 0, 1,
-0.4248371, 1.847971, 0.5954165, 0.07450981, 1, 0, 1,
-0.4205754, 0.1300504, -0.6219822, 0.06666667, 1, 0, 1,
-0.4185284, 1.893354, -0.270007, 0.0627451, 1, 0, 1,
-0.4179585, -1.172149, -3.687071, 0.05490196, 1, 0, 1,
-0.4170043, -1.482389, -2.56621, 0.05098039, 1, 0, 1,
-0.4018267, -0.5284787, -2.570042, 0.04313726, 1, 0, 1,
-0.3991152, 0.3130095, -0.9630061, 0.03921569, 1, 0, 1,
-0.3964733, -1.416023, -3.011486, 0.03137255, 1, 0, 1,
-0.3875187, -1.140094, -4.34832, 0.02745098, 1, 0, 1,
-0.3864658, 0.634037, -0.5646527, 0.01960784, 1, 0, 1,
-0.3858069, -0.05947132, -1.369052, 0.01568628, 1, 0, 1,
-0.3852024, -0.9868055, -2.74332, 0.007843138, 1, 0, 1,
-0.3759318, 0.7813991, -2.80728, 0.003921569, 1, 0, 1,
-0.3752444, -0.4869893, -2.106469, 0, 1, 0.003921569, 1,
-0.3738043, 0.6962557, -0.6352756, 0, 1, 0.01176471, 1,
-0.3710072, 0.7385075, 0.7888323, 0, 1, 0.01568628, 1,
-0.3709757, 0.4586471, -1.304293, 0, 1, 0.02352941, 1,
-0.3702331, 0.2697208, -0.5521889, 0, 1, 0.02745098, 1,
-0.3684349, -0.4236668, -1.450836, 0, 1, 0.03529412, 1,
-0.3680352, -1.582553, -3.554709, 0, 1, 0.03921569, 1,
-0.3605795, 0.9549375, -0.6982341, 0, 1, 0.04705882, 1,
-0.35934, 0.1563528, -2.634481, 0, 1, 0.05098039, 1,
-0.3592199, -0.5073741, -2.595425, 0, 1, 0.05882353, 1,
-0.3517212, 0.8574923, -0.2667887, 0, 1, 0.0627451, 1,
-0.3503444, 1.131901, 0.2894866, 0, 1, 0.07058824, 1,
-0.3476688, -1.607821, -1.907521, 0, 1, 0.07450981, 1,
-0.3449662, -0.2819327, -0.5865333, 0, 1, 0.08235294, 1,
-0.3415262, 0.3982618, 0.827205, 0, 1, 0.08627451, 1,
-0.3365588, -0.8097876, -3.432415, 0, 1, 0.09411765, 1,
-0.3325919, 0.2294109, -0.7643375, 0, 1, 0.1019608, 1,
-0.3325334, 1.124573, -1.613663, 0, 1, 0.1058824, 1,
-0.3300413, 0.2536393, -1.003877, 0, 1, 0.1137255, 1,
-0.3296472, -1.089638, -2.395873, 0, 1, 0.1176471, 1,
-0.3266639, -2.036311, -4.8439, 0, 1, 0.1254902, 1,
-0.3243445, -0.01845349, 0.0169456, 0, 1, 0.1294118, 1,
-0.3207161, 0.04165031, -0.2542294, 0, 1, 0.1372549, 1,
-0.3170526, -0.4172896, -2.304644, 0, 1, 0.1411765, 1,
-0.313638, -0.6628293, -3.735521, 0, 1, 0.1490196, 1,
-0.3129953, -1.145134, -2.284078, 0, 1, 0.1529412, 1,
-0.3124657, -0.3169114, -2.427148, 0, 1, 0.1607843, 1,
-0.3106785, 0.708181, 0.8238627, 0, 1, 0.1647059, 1,
-0.3094752, -1.810879, -2.544916, 0, 1, 0.172549, 1,
-0.309343, -0.221254, -2.415036, 0, 1, 0.1764706, 1,
-0.3082799, -0.8904871, -3.022276, 0, 1, 0.1843137, 1,
-0.3048624, 0.1355712, -1.840613, 0, 1, 0.1882353, 1,
-0.2982673, 0.008532863, -2.343415, 0, 1, 0.1960784, 1,
-0.2977838, 0.6139796, 0.8196937, 0, 1, 0.2039216, 1,
-0.2929009, -1.027706, -3.828754, 0, 1, 0.2078431, 1,
-0.2928864, 0.1440699, -0.9247548, 0, 1, 0.2156863, 1,
-0.2916288, 0.6352952, -0.506758, 0, 1, 0.2196078, 1,
-0.2897669, -0.738934, -1.080171, 0, 1, 0.227451, 1,
-0.2878546, -0.1292189, -1.274089, 0, 1, 0.2313726, 1,
-0.2853717, 0.3649023, -0.5901335, 0, 1, 0.2392157, 1,
-0.2791854, 0.341068, 0.1502622, 0, 1, 0.2431373, 1,
-0.277409, 1.35866, -0.8255534, 0, 1, 0.2509804, 1,
-0.2735942, -0.1377597, -2.246577, 0, 1, 0.254902, 1,
-0.2730322, -1.051009, -2.85377, 0, 1, 0.2627451, 1,
-0.270045, -0.4908553, -2.062247, 0, 1, 0.2666667, 1,
-0.2649882, 0.7205927, -0.8029048, 0, 1, 0.2745098, 1,
-0.2632635, 2.572809, 0.7415024, 0, 1, 0.2784314, 1,
-0.2629934, -0.3237023, -2.867128, 0, 1, 0.2862745, 1,
-0.262123, 0.009581722, -3.051325, 0, 1, 0.2901961, 1,
-0.2607424, 0.7041125, 0.4080849, 0, 1, 0.2980392, 1,
-0.259946, 0.1653984, -1.030094, 0, 1, 0.3058824, 1,
-0.2533169, 0.1858831, 0.1881022, 0, 1, 0.3098039, 1,
-0.2473636, 0.9621504, 0.6800962, 0, 1, 0.3176471, 1,
-0.2463138, -1.220651, -3.909456, 0, 1, 0.3215686, 1,
-0.2443218, -1.214682, -2.292526, 0, 1, 0.3294118, 1,
-0.2438619, 0.1226771, 0.2071928, 0, 1, 0.3333333, 1,
-0.2407187, -0.9029128, -2.595683, 0, 1, 0.3411765, 1,
-0.2396913, -1.05725, -2.835873, 0, 1, 0.345098, 1,
-0.2394511, -1.229593, -2.906825, 0, 1, 0.3529412, 1,
-0.2389298, 0.9498383, -0.4313096, 0, 1, 0.3568628, 1,
-0.2368266, 0.1369556, -1.850729, 0, 1, 0.3647059, 1,
-0.2364016, 0.8405863, -2.406574, 0, 1, 0.3686275, 1,
-0.234157, 1.399533, 0.6289388, 0, 1, 0.3764706, 1,
-0.233213, -0.05900574, -2.985076, 0, 1, 0.3803922, 1,
-0.2311928, -0.8082304, -2.449881, 0, 1, 0.3882353, 1,
-0.2310799, 0.7025095, -0.4925306, 0, 1, 0.3921569, 1,
-0.227692, -1.50591, -4.576343, 0, 1, 0.4, 1,
-0.2272812, -0.1793336, -0.7832031, 0, 1, 0.4078431, 1,
-0.2265026, 0.3907253, 0.1364034, 0, 1, 0.4117647, 1,
-0.2260695, -1.210611, -3.624912, 0, 1, 0.4196078, 1,
-0.2199757, 1.305282, 1.406011, 0, 1, 0.4235294, 1,
-0.2193199, 0.3522636, 0.916157, 0, 1, 0.4313726, 1,
-0.2133553, 0.6103332, 0.002493555, 0, 1, 0.4352941, 1,
-0.209529, 0.309608, -1.219544, 0, 1, 0.4431373, 1,
-0.2074803, -0.4516744, -4.101902, 0, 1, 0.4470588, 1,
-0.2070703, -1.720937, -2.986904, 0, 1, 0.454902, 1,
-0.2035561, -0.4974897, -2.245802, 0, 1, 0.4588235, 1,
-0.2025734, 1.167767, 0.4767959, 0, 1, 0.4666667, 1,
-0.1979612, 0.9673188, 0.6092572, 0, 1, 0.4705882, 1,
-0.1969176, 0.8020212, -0.2743957, 0, 1, 0.4784314, 1,
-0.1966222, 0.7294155, -0.8486159, 0, 1, 0.4823529, 1,
-0.1941808, -1.181353, -2.890684, 0, 1, 0.4901961, 1,
-0.1924194, 1.056599, 0.1546512, 0, 1, 0.4941176, 1,
-0.1876987, 0.3201469, 0.9826469, 0, 1, 0.5019608, 1,
-0.1864641, -1.366417, -3.762305, 0, 1, 0.509804, 1,
-0.1847767, 0.9184406, 0.4132095, 0, 1, 0.5137255, 1,
-0.1810549, 1.146295, 1.052649, 0, 1, 0.5215687, 1,
-0.1805687, 0.1703644, -0.009298612, 0, 1, 0.5254902, 1,
-0.1730998, 0.08416976, 1.113487, 0, 1, 0.5333334, 1,
-0.1727952, 0.1927594, -1.048298, 0, 1, 0.5372549, 1,
-0.1691423, 1.916034, -0.7555579, 0, 1, 0.5450981, 1,
-0.1680052, 1.756264, -0.04701482, 0, 1, 0.5490196, 1,
-0.1678946, 0.7221032, 0.6083416, 0, 1, 0.5568628, 1,
-0.1606552, -0.4627452, -1.684566, 0, 1, 0.5607843, 1,
-0.1583922, 1.651802, -0.6483378, 0, 1, 0.5686275, 1,
-0.1573937, -0.8522306, -3.290785, 0, 1, 0.572549, 1,
-0.1547162, 1.543006, 0.6293104, 0, 1, 0.5803922, 1,
-0.1529918, 0.3543422, 0.4513958, 0, 1, 0.5843138, 1,
-0.1507278, -0.4994186, -1.643518, 0, 1, 0.5921569, 1,
-0.1492023, -0.5834216, -1.322407, 0, 1, 0.5960785, 1,
-0.1484432, -0.1525857, -2.207896, 0, 1, 0.6039216, 1,
-0.1449, -0.3040714, -3.608365, 0, 1, 0.6117647, 1,
-0.144847, -0.3005894, -2.345938, 0, 1, 0.6156863, 1,
-0.1427473, 0.08084153, -1.672815, 0, 1, 0.6235294, 1,
-0.1410051, -0.2440206, -2.121909, 0, 1, 0.627451, 1,
-0.138785, 0.2282873, -1.715165, 0, 1, 0.6352941, 1,
-0.1386691, -0.4113005, -2.209527, 0, 1, 0.6392157, 1,
-0.1353069, 2.373769, -2.403291, 0, 1, 0.6470588, 1,
-0.1319971, 0.09751865, -0.1461671, 0, 1, 0.6509804, 1,
-0.1308291, -0.7347753, -2.034944, 0, 1, 0.6588235, 1,
-0.1302148, 0.8551268, -0.4438905, 0, 1, 0.6627451, 1,
-0.1258653, -0.9581841, -3.694628, 0, 1, 0.6705883, 1,
-0.124636, -0.8241695, -4.39317, 0, 1, 0.6745098, 1,
-0.123625, -0.1800475, -2.346134, 0, 1, 0.682353, 1,
-0.1225359, 1.083825, -0.4285826, 0, 1, 0.6862745, 1,
-0.1216734, 2.301028, -0.000951572, 0, 1, 0.6941177, 1,
-0.1193668, 0.04324263, -1.282972, 0, 1, 0.7019608, 1,
-0.1159712, -1.006394, -2.83004, 0, 1, 0.7058824, 1,
-0.1156351, -0.5741397, -2.24193, 0, 1, 0.7137255, 1,
-0.113485, -0.9463967, -3.329588, 0, 1, 0.7176471, 1,
-0.1111659, 0.6587458, 1.197983, 0, 1, 0.7254902, 1,
-0.1109544, -0.4541358, -2.520731, 0, 1, 0.7294118, 1,
-0.1101517, -0.367193, -1.572481, 0, 1, 0.7372549, 1,
-0.1085677, 0.4266968, 1.528125, 0, 1, 0.7411765, 1,
-0.1079993, -0.2553147, -2.604407, 0, 1, 0.7490196, 1,
-0.1003965, 0.9897605, 0.01962789, 0, 1, 0.7529412, 1,
-0.1002797, -0.8112018, -2.613547, 0, 1, 0.7607843, 1,
-0.0979424, -0.5104013, -4.20287, 0, 1, 0.7647059, 1,
-0.09447095, 0.802163, -1.85412, 0, 1, 0.772549, 1,
-0.09434053, 1.49942, -0.5779166, 0, 1, 0.7764706, 1,
-0.092918, -0.6928146, -3.05838, 0, 1, 0.7843137, 1,
-0.08764114, -0.008198305, -0.5213214, 0, 1, 0.7882353, 1,
-0.08525073, -0.652099, -2.336024, 0, 1, 0.7960784, 1,
-0.08450094, 0.7186944, -0.0209121, 0, 1, 0.8039216, 1,
-0.08247764, -0.1047718, -2.788866, 0, 1, 0.8078431, 1,
-0.0805501, 0.4785394, -0.8761147, 0, 1, 0.8156863, 1,
-0.08045721, 1.068962, -0.4398325, 0, 1, 0.8196079, 1,
-0.07868911, -0.1715319, -2.893585, 0, 1, 0.827451, 1,
-0.0697743, 0.8087943, 0.6864553, 0, 1, 0.8313726, 1,
-0.06623583, 0.3813626, 0.5125086, 0, 1, 0.8392157, 1,
-0.06454773, -0.2498278, -3.332576, 0, 1, 0.8431373, 1,
-0.06389976, -0.2187384, -1.788304, 0, 1, 0.8509804, 1,
-0.0604873, 2.007872, 0.7683234, 0, 1, 0.854902, 1,
-0.05768938, -1.312898, -3.212995, 0, 1, 0.8627451, 1,
-0.05334793, -1.211255, -3.468427, 0, 1, 0.8666667, 1,
-0.04954553, 0.9906242, -1.414023, 0, 1, 0.8745098, 1,
-0.04798402, -0.02542639, -1.525793, 0, 1, 0.8784314, 1,
-0.04476759, -0.07913238, -1.697377, 0, 1, 0.8862745, 1,
-0.04374112, -0.3389604, -2.810922, 0, 1, 0.8901961, 1,
-0.04020912, -1.154898, -1.721404, 0, 1, 0.8980392, 1,
-0.03614634, -0.234362, -2.858744, 0, 1, 0.9058824, 1,
-0.03516156, -1.310761, -0.5801544, 0, 1, 0.9098039, 1,
-0.0329874, 0.9520717, 0.7576693, 0, 1, 0.9176471, 1,
-0.03076738, -0.4129484, -3.2611, 0, 1, 0.9215686, 1,
-0.02241166, 0.2858858, -0.01787307, 0, 1, 0.9294118, 1,
-0.01911932, 1.285559, 1.680513, 0, 1, 0.9333333, 1,
-0.01743417, -0.2636908, -3.706619, 0, 1, 0.9411765, 1,
-0.01520636, -0.8651674, -2.316614, 0, 1, 0.945098, 1,
-0.0140024, 0.003877243, -1.99702, 0, 1, 0.9529412, 1,
-0.01250501, 0.2131155, -1.898804, 0, 1, 0.9568627, 1,
-0.006976373, -0.3915015, -2.493082, 0, 1, 0.9647059, 1,
-0.00638389, -0.6288124, -2.82434, 0, 1, 0.9686275, 1,
-0.00604365, -0.7004571, -3.651351, 0, 1, 0.9764706, 1,
-0.005726697, 0.2198484, -0.9826246, 0, 1, 0.9803922, 1,
-0.005587987, -0.1175875, -3.136199, 0, 1, 0.9882353, 1,
-0.003670133, -0.002094826, -1.374447, 0, 1, 0.9921569, 1,
5.77897e-05, -1.413216, 3.56693, 0, 1, 1, 1,
0.001495433, -0.8960614, 2.297153, 0, 0.9921569, 1, 1,
0.001709179, 0.422666, -2.021935, 0, 0.9882353, 1, 1,
0.0019221, -1.162403, 1.724693, 0, 0.9803922, 1, 1,
0.003014673, 0.9069235, -1.088631, 0, 0.9764706, 1, 1,
0.006012591, 1.355882, 0.5699043, 0, 0.9686275, 1, 1,
0.006557727, -0.6589299, 3.289362, 0, 0.9647059, 1, 1,
0.007974177, -0.1224607, 4.250025, 0, 0.9568627, 1, 1,
0.009086656, -0.1708151, 3.131321, 0, 0.9529412, 1, 1,
0.009323199, 0.4706944, -0.9494365, 0, 0.945098, 1, 1,
0.01504714, -0.1245149, 4.949801, 0, 0.9411765, 1, 1,
0.01570761, 0.8090656, -2.043717, 0, 0.9333333, 1, 1,
0.02226346, -0.1311656, 2.757809, 0, 0.9294118, 1, 1,
0.02318561, 0.8058823, 0.01770019, 0, 0.9215686, 1, 1,
0.02428243, -1.101092, 4.506336, 0, 0.9176471, 1, 1,
0.02457243, -0.01806012, 1.801725, 0, 0.9098039, 1, 1,
0.02501217, -0.1811937, 3.880807, 0, 0.9058824, 1, 1,
0.02656172, 1.547388, 1.656786, 0, 0.8980392, 1, 1,
0.02756666, 0.1124703, 0.6782321, 0, 0.8901961, 1, 1,
0.03073617, 2.871206, -0.05906198, 0, 0.8862745, 1, 1,
0.03102038, 3.015671, 0.4483814, 0, 0.8784314, 1, 1,
0.03228644, 0.1663094, 0.4498546, 0, 0.8745098, 1, 1,
0.03586137, -2.024555, 3.557103, 0, 0.8666667, 1, 1,
0.0414089, 0.3251815, -0.7211362, 0, 0.8627451, 1, 1,
0.04330771, -0.2063851, 3.018376, 0, 0.854902, 1, 1,
0.04447081, 0.8867242, -0.08022687, 0, 0.8509804, 1, 1,
0.04453075, 1.332505, -0.9713538, 0, 0.8431373, 1, 1,
0.04529795, -0.4679321, 3.591295, 0, 0.8392157, 1, 1,
0.05158479, 1.259963, 0.772553, 0, 0.8313726, 1, 1,
0.05283164, 0.915062, 0.2755105, 0, 0.827451, 1, 1,
0.05363589, -1.448017, 1.724456, 0, 0.8196079, 1, 1,
0.05370943, 0.01755146, -0.4144262, 0, 0.8156863, 1, 1,
0.05937262, -0.3715843, 0.6004438, 0, 0.8078431, 1, 1,
0.06953456, -0.1049094, 1.151394, 0, 0.8039216, 1, 1,
0.07190576, -1.343096, 4.27137, 0, 0.7960784, 1, 1,
0.07210881, -0.2363443, 3.21657, 0, 0.7882353, 1, 1,
0.07918084, 0.4702853, -0.02511054, 0, 0.7843137, 1, 1,
0.07965055, -0.4659296, 3.227856, 0, 0.7764706, 1, 1,
0.08354504, -1.462975, 2.448117, 0, 0.772549, 1, 1,
0.08439534, 0.1279954, 1.35503, 0, 0.7647059, 1, 1,
0.09050385, 0.722118, -1.631434, 0, 0.7607843, 1, 1,
0.09376219, 0.8766191, 1.464472, 0, 0.7529412, 1, 1,
0.09637086, 1.016445, -1.925345, 0, 0.7490196, 1, 1,
0.09671445, 0.7057781, 0.5237699, 0, 0.7411765, 1, 1,
0.1011944, -1.198006, 3.395133, 0, 0.7372549, 1, 1,
0.1017633, 1.250333, 0.5540602, 0, 0.7294118, 1, 1,
0.102583, -1.071969, 4.254084, 0, 0.7254902, 1, 1,
0.1062547, 3.096157, -1.04465, 0, 0.7176471, 1, 1,
0.1071708, 1.131914, -0.3750016, 0, 0.7137255, 1, 1,
0.1094177, -0.2212674, 1.199521, 0, 0.7058824, 1, 1,
0.1101157, 0.4805664, -1.036486, 0, 0.6980392, 1, 1,
0.1124973, 0.9594983, 1.248877, 0, 0.6941177, 1, 1,
0.1140721, -1.169458, 2.194054, 0, 0.6862745, 1, 1,
0.1188362, 0.6237014, 0.005636403, 0, 0.682353, 1, 1,
0.1206252, 1.18159, 1.529159, 0, 0.6745098, 1, 1,
0.122007, 0.874077, 2.125389, 0, 0.6705883, 1, 1,
0.1222912, -0.7318345, 3.835182, 0, 0.6627451, 1, 1,
0.1247091, 1.185526, 2.313611, 0, 0.6588235, 1, 1,
0.1288075, 0.8757851, -0.7096388, 0, 0.6509804, 1, 1,
0.130594, -1.327324, 1.798022, 0, 0.6470588, 1, 1,
0.1319021, -1.203914, 3.301056, 0, 0.6392157, 1, 1,
0.1323304, -1.567898, 3.09597, 0, 0.6352941, 1, 1,
0.1360496, 0.1386131, 0.9130677, 0, 0.627451, 1, 1,
0.1376569, 1.12865, 0.22554, 0, 0.6235294, 1, 1,
0.1456238, 1.449849, 0.2836123, 0, 0.6156863, 1, 1,
0.1470028, -1.109614, 2.444257, 0, 0.6117647, 1, 1,
0.1488081, 1.569727, -1.211145, 0, 0.6039216, 1, 1,
0.1595548, 0.2995787, -0.3899277, 0, 0.5960785, 1, 1,
0.1653568, 0.08342792, 0.8825932, 0, 0.5921569, 1, 1,
0.1660808, 0.1953955, -0.4642562, 0, 0.5843138, 1, 1,
0.1709011, 1.490652, -0.7319804, 0, 0.5803922, 1, 1,
0.1738685, -0.03461252, 2.176531, 0, 0.572549, 1, 1,
0.1757778, -0.6230484, 3.671332, 0, 0.5686275, 1, 1,
0.1799216, -0.7023612, 2.765759, 0, 0.5607843, 1, 1,
0.1802731, 0.05764472, 0.4237686, 0, 0.5568628, 1, 1,
0.18145, 1.184815, -1.015845, 0, 0.5490196, 1, 1,
0.1827105, 0.06543478, 1.008091, 0, 0.5450981, 1, 1,
0.1834904, 0.8974206, 0.1913994, 0, 0.5372549, 1, 1,
0.1837634, -1.921602, 3.0475, 0, 0.5333334, 1, 1,
0.1921854, -0.02365486, 2.697378, 0, 0.5254902, 1, 1,
0.1922341, -1.156149, 4.36324, 0, 0.5215687, 1, 1,
0.1959939, -0.8334362, 2.369048, 0, 0.5137255, 1, 1,
0.1970984, -0.3424587, 3.371253, 0, 0.509804, 1, 1,
0.2019145, 1.354091, 2.469669, 0, 0.5019608, 1, 1,
0.2033094, 2.004134, 1.213393, 0, 0.4941176, 1, 1,
0.2044188, 0.2993559, 0.8334189, 0, 0.4901961, 1, 1,
0.2060279, 0.01529151, 2.59808, 0, 0.4823529, 1, 1,
0.208272, 0.08983584, 1.93732, 0, 0.4784314, 1, 1,
0.2150993, -0.5232929, 3.001826, 0, 0.4705882, 1, 1,
0.2189875, 1.126385, -0.8546239, 0, 0.4666667, 1, 1,
0.2208002, -0.2615088, 1.678477, 0, 0.4588235, 1, 1,
0.2346802, 1.162223, -0.8975643, 0, 0.454902, 1, 1,
0.2352829, 1.482248, 1.032647, 0, 0.4470588, 1, 1,
0.2353185, -0.5502707, 3.299161, 0, 0.4431373, 1, 1,
0.2391342, -0.4321468, 2.276936, 0, 0.4352941, 1, 1,
0.2425066, 0.1580438, 0.2916494, 0, 0.4313726, 1, 1,
0.2453328, -0.6084872, 2.098295, 0, 0.4235294, 1, 1,
0.2460872, 1.719223, -0.04333109, 0, 0.4196078, 1, 1,
0.246131, 0.644555, -0.5052899, 0, 0.4117647, 1, 1,
0.2464044, 0.4091886, -0.3432099, 0, 0.4078431, 1, 1,
0.250691, -0.6659358, 2.702734, 0, 0.4, 1, 1,
0.256744, -0.04137738, 2.988012, 0, 0.3921569, 1, 1,
0.2575126, 0.7340147, 1.493737, 0, 0.3882353, 1, 1,
0.2592274, 0.07577407, 0.2819737, 0, 0.3803922, 1, 1,
0.2600962, -1.863206, 5.92232, 0, 0.3764706, 1, 1,
0.2623526, 1.929255, -1.31734, 0, 0.3686275, 1, 1,
0.2682988, -0.3197507, 3.202617, 0, 0.3647059, 1, 1,
0.2685006, 0.7491626, 0.3220511, 0, 0.3568628, 1, 1,
0.2752829, 0.442834, 0.6757829, 0, 0.3529412, 1, 1,
0.2848459, -0.1780834, 3.152897, 0, 0.345098, 1, 1,
0.2865486, 0.470641, 1.494993, 0, 0.3411765, 1, 1,
0.2889358, 1.15786, 0.769963, 0, 0.3333333, 1, 1,
0.2992569, 1.324739, -0.4960375, 0, 0.3294118, 1, 1,
0.3006801, 0.9917371, 0.06351342, 0, 0.3215686, 1, 1,
0.301838, 0.7141297, 0.157757, 0, 0.3176471, 1, 1,
0.303093, 1.564505, 1.465554, 0, 0.3098039, 1, 1,
0.3038951, 0.5699512, 2.622691, 0, 0.3058824, 1, 1,
0.3062697, 0.9898378, 0.8815309, 0, 0.2980392, 1, 1,
0.3087644, -0.5422438, 2.934417, 0, 0.2901961, 1, 1,
0.3118585, 0.1016663, 0.8783841, 0, 0.2862745, 1, 1,
0.3129444, 0.8035003, 1.307656, 0, 0.2784314, 1, 1,
0.3131236, 0.8903949, -0.3940129, 0, 0.2745098, 1, 1,
0.3132263, -0.9133825, 0.5942121, 0, 0.2666667, 1, 1,
0.3164914, 0.9400534, -0.4419002, 0, 0.2627451, 1, 1,
0.3256234, 0.1812015, 0.9043514, 0, 0.254902, 1, 1,
0.3361872, -0.6459999, 2.467683, 0, 0.2509804, 1, 1,
0.3373049, -0.2109451, 2.06846, 0, 0.2431373, 1, 1,
0.3377021, 1.246655, 0.1991269, 0, 0.2392157, 1, 1,
0.3392885, -0.3924757, 3.281028, 0, 0.2313726, 1, 1,
0.3428152, 1.720377, 0.122306, 0, 0.227451, 1, 1,
0.3435432, 0.9198258, 1.587548, 0, 0.2196078, 1, 1,
0.3462074, -0.5777383, 2.288317, 0, 0.2156863, 1, 1,
0.3465892, -0.663266, 3.104897, 0, 0.2078431, 1, 1,
0.3485554, 1.431312, 0.5966495, 0, 0.2039216, 1, 1,
0.3525257, 0.980265, 1.863963, 0, 0.1960784, 1, 1,
0.3537506, 1.267888, 2.599365, 0, 0.1882353, 1, 1,
0.3540297, 1.248044, 0.8337529, 0, 0.1843137, 1, 1,
0.3634107, -1.003728, 2.854175, 0, 0.1764706, 1, 1,
0.3635865, 0.6304086, 1.573856, 0, 0.172549, 1, 1,
0.3661083, 0.9226599, 0.9319579, 0, 0.1647059, 1, 1,
0.3668461, 0.9275842, 1.093002, 0, 0.1607843, 1, 1,
0.376364, -1.383031, 3.053665, 0, 0.1529412, 1, 1,
0.3764282, 0.03071485, 2.231136, 0, 0.1490196, 1, 1,
0.3767911, -0.3479615, 2.01061, 0, 0.1411765, 1, 1,
0.3791841, -0.5654528, 3.055221, 0, 0.1372549, 1, 1,
0.3843239, 0.05184994, 2.502224, 0, 0.1294118, 1, 1,
0.3867764, -1.197288, 3.051888, 0, 0.1254902, 1, 1,
0.3879339, -0.244229, 1.976655, 0, 0.1176471, 1, 1,
0.3896949, 0.9123637, 0.9189906, 0, 0.1137255, 1, 1,
0.3972163, -0.4809306, 0.905075, 0, 0.1058824, 1, 1,
0.3977323, -0.9945189, 3.335041, 0, 0.09803922, 1, 1,
0.398175, -0.2081973, 1.434675, 0, 0.09411765, 1, 1,
0.400519, 1.557527, -1.371614, 0, 0.08627451, 1, 1,
0.4039126, 0.9321767, 0.2684154, 0, 0.08235294, 1, 1,
0.4060422, 0.1291452, 1.598582, 0, 0.07450981, 1, 1,
0.4097472, 0.334442, -0.1078253, 0, 0.07058824, 1, 1,
0.4106956, -0.3628601, 1.430402, 0, 0.0627451, 1, 1,
0.41125, 0.1792121, 2.530666, 0, 0.05882353, 1, 1,
0.4113771, 0.2756197, 2.838207, 0, 0.05098039, 1, 1,
0.4168879, -0.6910895, 3.557401, 0, 0.04705882, 1, 1,
0.4171041, 0.2737979, 1.036042, 0, 0.03921569, 1, 1,
0.4188091, 1.871828, -0.2950794, 0, 0.03529412, 1, 1,
0.4215459, 1.475613, 0.4389512, 0, 0.02745098, 1, 1,
0.4247948, 1.214278, -0.3274024, 0, 0.02352941, 1, 1,
0.4315124, -1.179793, 3.355275, 0, 0.01568628, 1, 1,
0.4385535, 1.445754, -0.1254922, 0, 0.01176471, 1, 1,
0.4390561, -1.431719, 4.294352, 0, 0.003921569, 1, 1,
0.4424261, 1.195005, -0.5421014, 0.003921569, 0, 1, 1,
0.4558584, -0.810804, 1.865817, 0.007843138, 0, 1, 1,
0.4559256, -0.5498819, 3.381358, 0.01568628, 0, 1, 1,
0.4576005, -0.6633813, 2.726624, 0.01960784, 0, 1, 1,
0.4621249, -2.826246, 2.594495, 0.02745098, 0, 1, 1,
0.4691427, -0.1113915, 1.322407, 0.03137255, 0, 1, 1,
0.4693874, -2.039078, 3.334243, 0.03921569, 0, 1, 1,
0.470755, -0.1096266, 1.212424, 0.04313726, 0, 1, 1,
0.4715588, -0.7417603, 3.30112, 0.05098039, 0, 1, 1,
0.4738778, 0.6919255, 0.07760965, 0.05490196, 0, 1, 1,
0.4797713, 0.8672169, 1.694619, 0.0627451, 0, 1, 1,
0.4873984, 0.6728122, 0.7809966, 0.06666667, 0, 1, 1,
0.4875654, 0.2445555, 0.3694434, 0.07450981, 0, 1, 1,
0.4907165, -1.034209, 1.872344, 0.07843138, 0, 1, 1,
0.4909286, -1.855072, 3.913738, 0.08627451, 0, 1, 1,
0.492003, -0.6554004, 2.406922, 0.09019608, 0, 1, 1,
0.495541, 0.9967107, -0.2020366, 0.09803922, 0, 1, 1,
0.4985161, -1.043734, 3.40708, 0.1058824, 0, 1, 1,
0.5032133, -0.3205359, 2.633544, 0.1098039, 0, 1, 1,
0.5033069, 1.198772, -0.08019888, 0.1176471, 0, 1, 1,
0.5080687, 0.06410839, 1.821937, 0.1215686, 0, 1, 1,
0.5083737, 1.256114, 0.760818, 0.1294118, 0, 1, 1,
0.514291, -0.9094241, 2.523662, 0.1333333, 0, 1, 1,
0.524976, -1.85164, 1.922239, 0.1411765, 0, 1, 1,
0.5255955, 2.203564, 0.5443145, 0.145098, 0, 1, 1,
0.5272023, -1.626691, 3.934171, 0.1529412, 0, 1, 1,
0.5310853, 1.342912, 0.9536154, 0.1568628, 0, 1, 1,
0.5314214, -0.2306631, 2.904252, 0.1647059, 0, 1, 1,
0.5327052, 0.5784369, 1.890523, 0.1686275, 0, 1, 1,
0.5330374, 1.186708, -1.774303, 0.1764706, 0, 1, 1,
0.5410847, 0.7074825, 0.3344809, 0.1803922, 0, 1, 1,
0.5426211, 0.1930323, 0.4425472, 0.1882353, 0, 1, 1,
0.5426267, 2.37545, -1.200997, 0.1921569, 0, 1, 1,
0.5428216, 1.177734, -0.06690875, 0.2, 0, 1, 1,
0.5443305, -2.320973, 2.613775, 0.2078431, 0, 1, 1,
0.5461537, 0.2985715, 2.159532, 0.2117647, 0, 1, 1,
0.5477151, -1.115083, 3.114028, 0.2196078, 0, 1, 1,
0.5487729, 0.3681089, 1.376601, 0.2235294, 0, 1, 1,
0.5515701, 0.1602082, 1.409068, 0.2313726, 0, 1, 1,
0.5551928, -0.4174924, 2.8851, 0.2352941, 0, 1, 1,
0.5566022, 0.01090512, 0.06319743, 0.2431373, 0, 1, 1,
0.5580922, -0.5940586, 0.212272, 0.2470588, 0, 1, 1,
0.5614284, -2.13633, 3.38593, 0.254902, 0, 1, 1,
0.5638574, -1.555597, 3.070471, 0.2588235, 0, 1, 1,
0.5646719, -0.6391674, 2.840826, 0.2666667, 0, 1, 1,
0.5647334, 0.02570912, 2.009515, 0.2705882, 0, 1, 1,
0.5660183, -1.52617, 2.092973, 0.2784314, 0, 1, 1,
0.5676898, -0.4049224, -0.01343869, 0.282353, 0, 1, 1,
0.5736986, 1.192918, -0.2509846, 0.2901961, 0, 1, 1,
0.5742238, 0.2392712, 2.54248, 0.2941177, 0, 1, 1,
0.5756296, -1.235219, 3.763289, 0.3019608, 0, 1, 1,
0.5810939, -0.4522245, 1.655389, 0.3098039, 0, 1, 1,
0.5861822, 0.4566289, 0.2861286, 0.3137255, 0, 1, 1,
0.5865211, -0.01602728, -0.1547231, 0.3215686, 0, 1, 1,
0.5907561, -0.34964, 2.815334, 0.3254902, 0, 1, 1,
0.5913115, -0.2510203, 1.730598, 0.3333333, 0, 1, 1,
0.5922567, -0.5802745, 2.03415, 0.3372549, 0, 1, 1,
0.5941291, -0.2238736, 1.203763, 0.345098, 0, 1, 1,
0.5954435, -1.815074, 2.645168, 0.3490196, 0, 1, 1,
0.6005431, 0.05294244, 1.041019, 0.3568628, 0, 1, 1,
0.600634, -0.2548104, 1.687659, 0.3607843, 0, 1, 1,
0.6077017, 0.1274622, -0.1200286, 0.3686275, 0, 1, 1,
0.6177951, 0.4998158, 0.8634197, 0.372549, 0, 1, 1,
0.6184917, 0.7769521, 0.8663357, 0.3803922, 0, 1, 1,
0.6193544, 0.146615, 1.033947, 0.3843137, 0, 1, 1,
0.620287, 0.01675433, 1.540237, 0.3921569, 0, 1, 1,
0.6244645, -0.4583387, 2.127254, 0.3960784, 0, 1, 1,
0.6250106, 1.322751, 0.1778572, 0.4039216, 0, 1, 1,
0.6268885, -1.333622, 1.436968, 0.4117647, 0, 1, 1,
0.6270226, 0.3654599, 1.151962, 0.4156863, 0, 1, 1,
0.6328264, 0.3492473, 1.052058, 0.4235294, 0, 1, 1,
0.634399, -0.1410054, 0.1797631, 0.427451, 0, 1, 1,
0.6361887, -0.8452173, 2.543301, 0.4352941, 0, 1, 1,
0.6366696, 1.046914, 0.2716651, 0.4392157, 0, 1, 1,
0.6379685, -0.7954212, 3.299654, 0.4470588, 0, 1, 1,
0.639595, 0.9875919, -0.5649884, 0.4509804, 0, 1, 1,
0.6458508, 0.6990919, 0.003715936, 0.4588235, 0, 1, 1,
0.6462079, -0.3986394, 1.078207, 0.4627451, 0, 1, 1,
0.6466526, 0.2670229, 2.086363, 0.4705882, 0, 1, 1,
0.6514221, 0.623446, 0.9333966, 0.4745098, 0, 1, 1,
0.6525066, 0.2591428, 1.318895, 0.4823529, 0, 1, 1,
0.6564789, 0.0900974, 2.285478, 0.4862745, 0, 1, 1,
0.6632327, 0.6910842, -1.340696, 0.4941176, 0, 1, 1,
0.6641803, 1.16378, 1.612138, 0.5019608, 0, 1, 1,
0.6668766, 1.469784, -1.203679, 0.5058824, 0, 1, 1,
0.6688598, 0.1141441, 2.532333, 0.5137255, 0, 1, 1,
0.6735829, -0.5826432, 1.623117, 0.5176471, 0, 1, 1,
0.6739809, 1.026066, 1.303215, 0.5254902, 0, 1, 1,
0.6751947, 2.029588, 0.901682, 0.5294118, 0, 1, 1,
0.676898, -1.112137, 3.592456, 0.5372549, 0, 1, 1,
0.6816036, 0.0388186, 3.721119, 0.5411765, 0, 1, 1,
0.6823344, -1.810033, 2.602935, 0.5490196, 0, 1, 1,
0.682807, -1.018768, 2.444568, 0.5529412, 0, 1, 1,
0.684459, 0.9275148, -0.812248, 0.5607843, 0, 1, 1,
0.6865172, -0.5872516, 3.424802, 0.5647059, 0, 1, 1,
0.6885207, -1.922167, 2.592887, 0.572549, 0, 1, 1,
0.6968354, -0.7781775, 1.887101, 0.5764706, 0, 1, 1,
0.698575, -1.504765, 2.231895, 0.5843138, 0, 1, 1,
0.7036862, -0.1925908, -0.6149642, 0.5882353, 0, 1, 1,
0.7052225, -1.420114, 4.376878, 0.5960785, 0, 1, 1,
0.7055289, 1.424943, 0.6589907, 0.6039216, 0, 1, 1,
0.711068, -0.7517767, 4.411936, 0.6078432, 0, 1, 1,
0.7163571, 1.920574, -0.6041182, 0.6156863, 0, 1, 1,
0.7182896, 0.1176593, 1.500221, 0.6196079, 0, 1, 1,
0.7253073, -1.457517, 3.263561, 0.627451, 0, 1, 1,
0.7266884, -0.1247742, 1.788439, 0.6313726, 0, 1, 1,
0.7273504, 0.08645849, 2.078752, 0.6392157, 0, 1, 1,
0.7316132, -0.405901, 3.848757, 0.6431373, 0, 1, 1,
0.7329491, -1.276272, 2.94769, 0.6509804, 0, 1, 1,
0.7333468, -0.6456597, 2.908524, 0.654902, 0, 1, 1,
0.734138, 0.1251952, 1.399081, 0.6627451, 0, 1, 1,
0.7361846, -0.09711963, 1.70674, 0.6666667, 0, 1, 1,
0.7451465, -0.1567659, 2.616581, 0.6745098, 0, 1, 1,
0.745531, -0.08430054, 1.671046, 0.6784314, 0, 1, 1,
0.7649657, -0.07330999, 1.33846, 0.6862745, 0, 1, 1,
0.7707598, 0.9082712, 0.3224092, 0.6901961, 0, 1, 1,
0.7744671, -0.6398454, 1.158026, 0.6980392, 0, 1, 1,
0.776784, 0.0460185, 2.892113, 0.7058824, 0, 1, 1,
0.782626, -0.03752374, 1.234017, 0.7098039, 0, 1, 1,
0.782869, 0.3149822, 1.693526, 0.7176471, 0, 1, 1,
0.7829859, 1.430261, 0.02344144, 0.7215686, 0, 1, 1,
0.7948259, -1.007126, 3.249099, 0.7294118, 0, 1, 1,
0.7953501, 2.863453, 0.1219244, 0.7333333, 0, 1, 1,
0.8024489, 0.3295198, -0.07041664, 0.7411765, 0, 1, 1,
0.8025896, -0.9558485, 1.777694, 0.7450981, 0, 1, 1,
0.8026809, 1.977509, 1.410137, 0.7529412, 0, 1, 1,
0.8112878, -0.1270956, 2.332999, 0.7568628, 0, 1, 1,
0.8126622, 0.04701975, 3.194653, 0.7647059, 0, 1, 1,
0.8144491, -0.4480094, 1.393421, 0.7686275, 0, 1, 1,
0.8158639, 0.6087272, 1.179574, 0.7764706, 0, 1, 1,
0.8180098, -0.661241, 1.117795, 0.7803922, 0, 1, 1,
0.8234685, 0.09692895, 1.056454, 0.7882353, 0, 1, 1,
0.8250906, -0.8267884, 1.834344, 0.7921569, 0, 1, 1,
0.8256129, -0.9738463, 3.380063, 0.8, 0, 1, 1,
0.8258379, -0.2677643, 1.914694, 0.8078431, 0, 1, 1,
0.8260791, -1.513188, 2.279199, 0.8117647, 0, 1, 1,
0.8295882, -0.02497171, 0.950459, 0.8196079, 0, 1, 1,
0.8331549, -1.876008, 4.179326, 0.8235294, 0, 1, 1,
0.8338463, -1.86796, 2.753601, 0.8313726, 0, 1, 1,
0.8362511, -0.113958, 2.545657, 0.8352941, 0, 1, 1,
0.8383442, -0.02155114, -0.255672, 0.8431373, 0, 1, 1,
0.8537889, -0.7911881, 1.659733, 0.8470588, 0, 1, 1,
0.8550881, -0.2168006, 1.900019, 0.854902, 0, 1, 1,
0.8562029, -0.1171962, 2.557331, 0.8588235, 0, 1, 1,
0.8595396, -0.2772962, 2.494889, 0.8666667, 0, 1, 1,
0.8607907, 0.1485277, 1.178416, 0.8705882, 0, 1, 1,
0.8648877, -1.285074, 3.015913, 0.8784314, 0, 1, 1,
0.867353, 0.3161882, 1.930784, 0.8823529, 0, 1, 1,
0.8780566, -0.7991459, 2.528833, 0.8901961, 0, 1, 1,
0.8785027, 1.33264, 2.14327, 0.8941177, 0, 1, 1,
0.8811772, 0.2178597, 2.302544, 0.9019608, 0, 1, 1,
0.8848588, -0.7438418, 0.9935912, 0.9098039, 0, 1, 1,
0.886283, 0.1059546, 3.206573, 0.9137255, 0, 1, 1,
0.8877932, 1.318767, 1.719239, 0.9215686, 0, 1, 1,
0.9026946, -0.5409982, 0.6337148, 0.9254902, 0, 1, 1,
0.9034353, 0.4070126, 2.888506, 0.9333333, 0, 1, 1,
0.9095386, 1.533891, 0.1390001, 0.9372549, 0, 1, 1,
0.9142303, 0.1718794, 0.8816474, 0.945098, 0, 1, 1,
0.9161632, -0.2046571, 3.096387, 0.9490196, 0, 1, 1,
0.921854, -0.1017514, -0.7551776, 0.9568627, 0, 1, 1,
0.9249058, -1.340348, 3.796085, 0.9607843, 0, 1, 1,
0.9326732, -0.139866, -0.3030917, 0.9686275, 0, 1, 1,
0.9373553, 1.54283, 1.243787, 0.972549, 0, 1, 1,
0.9401905, -0.3207287, 2.714897, 0.9803922, 0, 1, 1,
0.9450044, -0.8283334, 1.620262, 0.9843137, 0, 1, 1,
0.9541268, 0.3203298, 1.399915, 0.9921569, 0, 1, 1,
0.9565986, 0.3396014, 1.724076, 0.9960784, 0, 1, 1,
0.9583372, -0.7711058, 4.383781, 1, 0, 0.9960784, 1,
0.9592987, 0.2834576, 1.714403, 1, 0, 0.9882353, 1,
0.9601769, 1.872388, 0.2747054, 1, 0, 0.9843137, 1,
0.9704029, -1.458098, 3.944127, 1, 0, 0.9764706, 1,
0.9709811, 0.7192203, 1.333813, 1, 0, 0.972549, 1,
0.9808485, -0.3064277, 2.317202, 1, 0, 0.9647059, 1,
0.9820867, -1.182155, 2.337782, 1, 0, 0.9607843, 1,
0.9840024, 0.2933095, 2.12506, 1, 0, 0.9529412, 1,
0.9843143, -1.437028, 1.496182, 1, 0, 0.9490196, 1,
0.9889693, -0.8613419, 1.76095, 1, 0, 0.9411765, 1,
0.9933088, -1.009168, 1.286427, 1, 0, 0.9372549, 1,
1.006338, -1.137753, 2.005535, 1, 0, 0.9294118, 1,
1.007619, 0.4032374, 0.4249398, 1, 0, 0.9254902, 1,
1.008836, -0.06301933, 2.18572, 1, 0, 0.9176471, 1,
1.009298, 1.510237, 1.662869, 1, 0, 0.9137255, 1,
1.019076, -0.241947, 2.838215, 1, 0, 0.9058824, 1,
1.019775, 1.655146, 0.6902658, 1, 0, 0.9019608, 1,
1.021393, -0.4994364, 3.217816, 1, 0, 0.8941177, 1,
1.024354, 0.003713282, 2.047831, 1, 0, 0.8862745, 1,
1.02625, -1.016027, 3.377043, 1, 0, 0.8823529, 1,
1.026405, 0.4318499, 2.887054, 1, 0, 0.8745098, 1,
1.029603, 0.0146697, 1.626729, 1, 0, 0.8705882, 1,
1.029908, -3.207289, 1.728384, 1, 0, 0.8627451, 1,
1.031657, -1.178089, 0.4227053, 1, 0, 0.8588235, 1,
1.035472, 0.6137959, 1.087717, 1, 0, 0.8509804, 1,
1.035912, -1.179262, 2.423506, 1, 0, 0.8470588, 1,
1.039864, 0.5510478, 0.6402014, 1, 0, 0.8392157, 1,
1.049644, -0.3341, 0.5905824, 1, 0, 0.8352941, 1,
1.052491, 1.06102, 0.7050928, 1, 0, 0.827451, 1,
1.055751, 1.462961, 3.807557, 1, 0, 0.8235294, 1,
1.057247, 0.5397533, 1.02744, 1, 0, 0.8156863, 1,
1.06018, 1.643322, 2.634173, 1, 0, 0.8117647, 1,
1.062026, -0.7271158, 2.359841, 1, 0, 0.8039216, 1,
1.075814, -2.097137, 3.545825, 1, 0, 0.7960784, 1,
1.075822, 0.4311757, 1.250366, 1, 0, 0.7921569, 1,
1.076078, -1.23449, 3.308363, 1, 0, 0.7843137, 1,
1.078127, -0.06942152, 1.853937, 1, 0, 0.7803922, 1,
1.0802, -1.498195, 2.318748, 1, 0, 0.772549, 1,
1.085312, 0.2155199, 1.163894, 1, 0, 0.7686275, 1,
1.099826, -1.210027, 4.745036, 1, 0, 0.7607843, 1,
1.102333, 1.651035, 0.2018501, 1, 0, 0.7568628, 1,
1.106271, 0.5013607, -0.4990053, 1, 0, 0.7490196, 1,
1.114631, -1.210793, 3.20437, 1, 0, 0.7450981, 1,
1.120188, -0.7878793, 0.4133995, 1, 0, 0.7372549, 1,
1.120785, -1.194789, 0.7778502, 1, 0, 0.7333333, 1,
1.12325, -0.07303607, 2.199788, 1, 0, 0.7254902, 1,
1.136206, 0.3978544, 1.414359, 1, 0, 0.7215686, 1,
1.138584, -0.5810219, 2.16418, 1, 0, 0.7137255, 1,
1.161259, 0.2109388, 0.8640003, 1, 0, 0.7098039, 1,
1.16809, -0.31319, 1.750976, 1, 0, 0.7019608, 1,
1.169769, 0.0445531, 0.646181, 1, 0, 0.6941177, 1,
1.170349, 0.6363306, 0.4181337, 1, 0, 0.6901961, 1,
1.171145, 0.08691285, 1.740504, 1, 0, 0.682353, 1,
1.175587, 0.2491116, 2.154422, 1, 0, 0.6784314, 1,
1.176142, -0.7200805, 2.349403, 1, 0, 0.6705883, 1,
1.194335, -0.8660869, 2.258872, 1, 0, 0.6666667, 1,
1.200254, 0.6936979, 1.587912, 1, 0, 0.6588235, 1,
1.203618, 0.8047097, 1.42588, 1, 0, 0.654902, 1,
1.207181, 1.011215, 3.070723, 1, 0, 0.6470588, 1,
1.211145, 2.104319, 0.319315, 1, 0, 0.6431373, 1,
1.213951, 0.8961973, -0.6419753, 1, 0, 0.6352941, 1,
1.214894, -2.867279, 1.658092, 1, 0, 0.6313726, 1,
1.216269, 0.8860096, 0.7089675, 1, 0, 0.6235294, 1,
1.21772, -1.767403, 2.843416, 1, 0, 0.6196079, 1,
1.223768, 0.7146865, 0.1018053, 1, 0, 0.6117647, 1,
1.229449, 0.2157408, 1.013819, 1, 0, 0.6078432, 1,
1.238696, 0.6414569, -0.09471711, 1, 0, 0.6, 1,
1.247755, 2.039336, 1.158944, 1, 0, 0.5921569, 1,
1.259355, -0.9074975, 2.271494, 1, 0, 0.5882353, 1,
1.260144, 1.387321, -0.827283, 1, 0, 0.5803922, 1,
1.262453, 0.2450621, 0.09953412, 1, 0, 0.5764706, 1,
1.264778, 0.7796655, 0.631983, 1, 0, 0.5686275, 1,
1.264971, 0.5478877, 2.059474, 1, 0, 0.5647059, 1,
1.275004, -0.1599561, 0.4038563, 1, 0, 0.5568628, 1,
1.281828, -0.003036032, 1.117399, 1, 0, 0.5529412, 1,
1.290992, 0.04123095, 2.093331, 1, 0, 0.5450981, 1,
1.304429, -0.1576367, 1.501642, 1, 0, 0.5411765, 1,
1.33371, -0.9113958, 4.187042, 1, 0, 0.5333334, 1,
1.345681, -0.5617024, 2.638782, 1, 0, 0.5294118, 1,
1.367187, 1.531957, 0.1884434, 1, 0, 0.5215687, 1,
1.370216, -0.01975325, 2.179237, 1, 0, 0.5176471, 1,
1.404904, 0.05050512, 1.124331, 1, 0, 0.509804, 1,
1.407165, 1.979007, 1.154561, 1, 0, 0.5058824, 1,
1.40739, -0.5495135, 2.312304, 1, 0, 0.4980392, 1,
1.411088, -0.009110934, 2.196543, 1, 0, 0.4901961, 1,
1.419558, 0.9861406, 0.8564557, 1, 0, 0.4862745, 1,
1.423256, 1.425802, -0.3245037, 1, 0, 0.4784314, 1,
1.444985, -0.699865, 2.825659, 1, 0, 0.4745098, 1,
1.44623, 0.3633589, 0.3028792, 1, 0, 0.4666667, 1,
1.449638, 0.7423139, -0.1744025, 1, 0, 0.4627451, 1,
1.464334, 0.5436869, 1.218452, 1, 0, 0.454902, 1,
1.472096, -0.4622907, 0.9139687, 1, 0, 0.4509804, 1,
1.478745, -1.109587, 1.469191, 1, 0, 0.4431373, 1,
1.487472, 0.1291188, 3.268412, 1, 0, 0.4392157, 1,
1.502491, -0.757578, 2.939833, 1, 0, 0.4313726, 1,
1.504303, -0.569657, 2.657218, 1, 0, 0.427451, 1,
1.504423, -0.1959089, 2.202498, 1, 0, 0.4196078, 1,
1.51169, -0.1781263, 0.08499351, 1, 0, 0.4156863, 1,
1.528545, 1.520891, 1.736483, 1, 0, 0.4078431, 1,
1.534336, -0.9959166, 2.738334, 1, 0, 0.4039216, 1,
1.53802, -0.6917749, -0.01052555, 1, 0, 0.3960784, 1,
1.541443, -0.5090824, 1.425532, 1, 0, 0.3882353, 1,
1.544836, -0.7089666, 2.770425, 1, 0, 0.3843137, 1,
1.545067, 1.802886, 0.2447549, 1, 0, 0.3764706, 1,
1.558273, -0.0880186, 2.888614, 1, 0, 0.372549, 1,
1.563202, -0.8983724, 3.192004, 1, 0, 0.3647059, 1,
1.566964, -1.17269, 2.37597, 1, 0, 0.3607843, 1,
1.584596, 0.9519792, 1.624543, 1, 0, 0.3529412, 1,
1.588815, 0.7367869, 0.813264, 1, 0, 0.3490196, 1,
1.589521, 0.2738593, 2.066535, 1, 0, 0.3411765, 1,
1.591792, -0.9602793, 1.105639, 1, 0, 0.3372549, 1,
1.594894, 0.2269426, 0.4130676, 1, 0, 0.3294118, 1,
1.603964, 0.8487431, 2.094856, 1, 0, 0.3254902, 1,
1.627277, -1.605559, 3.764466, 1, 0, 0.3176471, 1,
1.650399, 1.173851, 0.3783503, 1, 0, 0.3137255, 1,
1.650476, -0.9554301, 2.511551, 1, 0, 0.3058824, 1,
1.653118, -0.3119889, 0.426176, 1, 0, 0.2980392, 1,
1.656678, 0.1851081, 3.551672, 1, 0, 0.2941177, 1,
1.659062, 0.9943568, 0.1317118, 1, 0, 0.2862745, 1,
1.677912, 1.569023, 0.9149826, 1, 0, 0.282353, 1,
1.686671, 0.08745636, 2.364501, 1, 0, 0.2745098, 1,
1.705832, -0.34804, 3.311042, 1, 0, 0.2705882, 1,
1.72539, 0.400487, 0.06875735, 1, 0, 0.2627451, 1,
1.75421, -1.434989, 2.072501, 1, 0, 0.2588235, 1,
1.776293, 0.9421048, 2.006482, 1, 0, 0.2509804, 1,
1.783275, 0.3929259, 1.047304, 1, 0, 0.2470588, 1,
1.793504, 1.332885, 1.651318, 1, 0, 0.2392157, 1,
1.799276, -1.751849, 2.19987, 1, 0, 0.2352941, 1,
1.804551, 1.435423, 1.108835, 1, 0, 0.227451, 1,
1.813904, 0.1135073, 0.3129279, 1, 0, 0.2235294, 1,
1.813909, -0.4928281, 1.916093, 1, 0, 0.2156863, 1,
1.835889, -2.09342, 2.499739, 1, 0, 0.2117647, 1,
1.842156, -0.5826825, 1.198556, 1, 0, 0.2039216, 1,
1.843605, 1.256744, 0.5628911, 1, 0, 0.1960784, 1,
1.85181, 0.04141921, 0.6703477, 1, 0, 0.1921569, 1,
1.876091, 0.2603431, -1.093392, 1, 0, 0.1843137, 1,
1.890101, 1.934504, 0.8184281, 1, 0, 0.1803922, 1,
1.932803, -0.6339112, 1.764258, 1, 0, 0.172549, 1,
1.940322, 1.009023, 2.356585, 1, 0, 0.1686275, 1,
1.957125, 0.2103125, -0.8524123, 1, 0, 0.1607843, 1,
2.035962, 0.6090389, 1.098925, 1, 0, 0.1568628, 1,
2.081546, -0.360603, -0.5148643, 1, 0, 0.1490196, 1,
2.08398, -1.197037, 1.526569, 1, 0, 0.145098, 1,
2.131113, -0.2844185, 0.473628, 1, 0, 0.1372549, 1,
2.17129, 1.797264, 1.516235, 1, 0, 0.1333333, 1,
2.17687, 0.424953, 2.121368, 1, 0, 0.1254902, 1,
2.194709, -0.1244272, 2.944582, 1, 0, 0.1215686, 1,
2.214647, 2.214229, -1.573758, 1, 0, 0.1137255, 1,
2.216924, 0.5216296, 2.28648, 1, 0, 0.1098039, 1,
2.220641, 0.4508666, 2.302532, 1, 0, 0.1019608, 1,
2.27336, 0.4695578, 1.905295, 1, 0, 0.09411765, 1,
2.276768, -0.4786992, 2.969749, 1, 0, 0.09019608, 1,
2.318291, -0.5736766, 0.8958906, 1, 0, 0.08235294, 1,
2.342158, 0.8352787, 1.399139, 1, 0, 0.07843138, 1,
2.371152, -1.426806, 0.9452336, 1, 0, 0.07058824, 1,
2.371525, -0.4861821, 2.221401, 1, 0, 0.06666667, 1,
2.377058, -0.9605839, 2.450026, 1, 0, 0.05882353, 1,
2.413528, -0.3998356, 0.9031228, 1, 0, 0.05490196, 1,
2.455796, -1.630122, 1.705834, 1, 0, 0.04705882, 1,
2.500981, 0.1179403, 1.936563, 1, 0, 0.04313726, 1,
2.705993, -0.1751456, 1.831289, 1, 0, 0.03529412, 1,
2.765799, 0.252175, -0.2699869, 1, 0, 0.03137255, 1,
2.917411, 0.4510468, 1.296207, 1, 0, 0.02352941, 1,
2.975584, 0.7594694, 1.324911, 1, 0, 0.01960784, 1,
2.980197, -0.7304504, -0.361083, 1, 0, 0.01176471, 1,
3.03188, 1.815208, 0.3531081, 1, 0, 0.007843138, 1
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
-0.122344, -4.296002, -7.634812, 0, -0.5, 0.5, 0.5,
-0.122344, -4.296002, -7.634812, 1, -0.5, 0.5, 0.5,
-0.122344, -4.296002, -7.634812, 1, 1.5, 0.5, 0.5,
-0.122344, -4.296002, -7.634812, 0, 1.5, 0.5, 0.5
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
-4.34585, 0.004254341, -7.634812, 0, -0.5, 0.5, 0.5,
-4.34585, 0.004254341, -7.634812, 1, -0.5, 0.5, 0.5,
-4.34585, 0.004254341, -7.634812, 1, 1.5, 0.5, 0.5,
-4.34585, 0.004254341, -7.634812, 0, 1.5, 0.5, 0.5
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
-4.34585, -4.296002, 0.1261969, 0, -0.5, 0.5, 0.5,
-4.34585, -4.296002, 0.1261969, 1, -0.5, 0.5, 0.5,
-4.34585, -4.296002, 0.1261969, 1, 1.5, 0.5, 0.5,
-4.34585, -4.296002, 0.1261969, 0, 1.5, 0.5, 0.5
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
-3, -3.303635, -5.843811,
3, -3.303635, -5.843811,
-3, -3.303635, -5.843811,
-3, -3.469029, -6.142311,
-2, -3.303635, -5.843811,
-2, -3.469029, -6.142311,
-1, -3.303635, -5.843811,
-1, -3.469029, -6.142311,
0, -3.303635, -5.843811,
0, -3.469029, -6.142311,
1, -3.303635, -5.843811,
1, -3.469029, -6.142311,
2, -3.303635, -5.843811,
2, -3.469029, -6.142311,
3, -3.303635, -5.843811,
3, -3.469029, -6.142311
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
-3, -3.799819, -6.739311, 0, -0.5, 0.5, 0.5,
-3, -3.799819, -6.739311, 1, -0.5, 0.5, 0.5,
-3, -3.799819, -6.739311, 1, 1.5, 0.5, 0.5,
-3, -3.799819, -6.739311, 0, 1.5, 0.5, 0.5,
-2, -3.799819, -6.739311, 0, -0.5, 0.5, 0.5,
-2, -3.799819, -6.739311, 1, -0.5, 0.5, 0.5,
-2, -3.799819, -6.739311, 1, 1.5, 0.5, 0.5,
-2, -3.799819, -6.739311, 0, 1.5, 0.5, 0.5,
-1, -3.799819, -6.739311, 0, -0.5, 0.5, 0.5,
-1, -3.799819, -6.739311, 1, -0.5, 0.5, 0.5,
-1, -3.799819, -6.739311, 1, 1.5, 0.5, 0.5,
-1, -3.799819, -6.739311, 0, 1.5, 0.5, 0.5,
0, -3.799819, -6.739311, 0, -0.5, 0.5, 0.5,
0, -3.799819, -6.739311, 1, -0.5, 0.5, 0.5,
0, -3.799819, -6.739311, 1, 1.5, 0.5, 0.5,
0, -3.799819, -6.739311, 0, 1.5, 0.5, 0.5,
1, -3.799819, -6.739311, 0, -0.5, 0.5, 0.5,
1, -3.799819, -6.739311, 1, -0.5, 0.5, 0.5,
1, -3.799819, -6.739311, 1, 1.5, 0.5, 0.5,
1, -3.799819, -6.739311, 0, 1.5, 0.5, 0.5,
2, -3.799819, -6.739311, 0, -0.5, 0.5, 0.5,
2, -3.799819, -6.739311, 1, -0.5, 0.5, 0.5,
2, -3.799819, -6.739311, 1, 1.5, 0.5, 0.5,
2, -3.799819, -6.739311, 0, 1.5, 0.5, 0.5,
3, -3.799819, -6.739311, 0, -0.5, 0.5, 0.5,
3, -3.799819, -6.739311, 1, -0.5, 0.5, 0.5,
3, -3.799819, -6.739311, 1, 1.5, 0.5, 0.5,
3, -3.799819, -6.739311, 0, 1.5, 0.5, 0.5
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
-3.371194, -3, -5.843811,
-3.371194, 3, -5.843811,
-3.371194, -3, -5.843811,
-3.533637, -3, -6.142311,
-3.371194, -2, -5.843811,
-3.533637, -2, -6.142311,
-3.371194, -1, -5.843811,
-3.533637, -1, -6.142311,
-3.371194, 0, -5.843811,
-3.533637, 0, -6.142311,
-3.371194, 1, -5.843811,
-3.533637, 1, -6.142311,
-3.371194, 2, -5.843811,
-3.533637, 2, -6.142311,
-3.371194, 3, -5.843811,
-3.533637, 3, -6.142311
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
-3.858522, -3, -6.739311, 0, -0.5, 0.5, 0.5,
-3.858522, -3, -6.739311, 1, -0.5, 0.5, 0.5,
-3.858522, -3, -6.739311, 1, 1.5, 0.5, 0.5,
-3.858522, -3, -6.739311, 0, 1.5, 0.5, 0.5,
-3.858522, -2, -6.739311, 0, -0.5, 0.5, 0.5,
-3.858522, -2, -6.739311, 1, -0.5, 0.5, 0.5,
-3.858522, -2, -6.739311, 1, 1.5, 0.5, 0.5,
-3.858522, -2, -6.739311, 0, 1.5, 0.5, 0.5,
-3.858522, -1, -6.739311, 0, -0.5, 0.5, 0.5,
-3.858522, -1, -6.739311, 1, -0.5, 0.5, 0.5,
-3.858522, -1, -6.739311, 1, 1.5, 0.5, 0.5,
-3.858522, -1, -6.739311, 0, 1.5, 0.5, 0.5,
-3.858522, 0, -6.739311, 0, -0.5, 0.5, 0.5,
-3.858522, 0, -6.739311, 1, -0.5, 0.5, 0.5,
-3.858522, 0, -6.739311, 1, 1.5, 0.5, 0.5,
-3.858522, 0, -6.739311, 0, 1.5, 0.5, 0.5,
-3.858522, 1, -6.739311, 0, -0.5, 0.5, 0.5,
-3.858522, 1, -6.739311, 1, -0.5, 0.5, 0.5,
-3.858522, 1, -6.739311, 1, 1.5, 0.5, 0.5,
-3.858522, 1, -6.739311, 0, 1.5, 0.5, 0.5,
-3.858522, 2, -6.739311, 0, -0.5, 0.5, 0.5,
-3.858522, 2, -6.739311, 1, -0.5, 0.5, 0.5,
-3.858522, 2, -6.739311, 1, 1.5, 0.5, 0.5,
-3.858522, 2, -6.739311, 0, 1.5, 0.5, 0.5,
-3.858522, 3, -6.739311, 0, -0.5, 0.5, 0.5,
-3.858522, 3, -6.739311, 1, -0.5, 0.5, 0.5,
-3.858522, 3, -6.739311, 1, 1.5, 0.5, 0.5,
-3.858522, 3, -6.739311, 0, 1.5, 0.5, 0.5
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
-3.371194, -3.303635, -4,
-3.371194, -3.303635, 4,
-3.371194, -3.303635, -4,
-3.533637, -3.469029, -4,
-3.371194, -3.303635, -2,
-3.533637, -3.469029, -2,
-3.371194, -3.303635, 0,
-3.533637, -3.469029, 0,
-3.371194, -3.303635, 2,
-3.533637, -3.469029, 2,
-3.371194, -3.303635, 4,
-3.533637, -3.469029, 4
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
-3.858522, -3.799819, -4, 0, -0.5, 0.5, 0.5,
-3.858522, -3.799819, -4, 1, -0.5, 0.5, 0.5,
-3.858522, -3.799819, -4, 1, 1.5, 0.5, 0.5,
-3.858522, -3.799819, -4, 0, 1.5, 0.5, 0.5,
-3.858522, -3.799819, -2, 0, -0.5, 0.5, 0.5,
-3.858522, -3.799819, -2, 1, -0.5, 0.5, 0.5,
-3.858522, -3.799819, -2, 1, 1.5, 0.5, 0.5,
-3.858522, -3.799819, -2, 0, 1.5, 0.5, 0.5,
-3.858522, -3.799819, 0, 0, -0.5, 0.5, 0.5,
-3.858522, -3.799819, 0, 1, -0.5, 0.5, 0.5,
-3.858522, -3.799819, 0, 1, 1.5, 0.5, 0.5,
-3.858522, -3.799819, 0, 0, 1.5, 0.5, 0.5,
-3.858522, -3.799819, 2, 0, -0.5, 0.5, 0.5,
-3.858522, -3.799819, 2, 1, -0.5, 0.5, 0.5,
-3.858522, -3.799819, 2, 1, 1.5, 0.5, 0.5,
-3.858522, -3.799819, 2, 0, 1.5, 0.5, 0.5,
-3.858522, -3.799819, 4, 0, -0.5, 0.5, 0.5,
-3.858522, -3.799819, 4, 1, -0.5, 0.5, 0.5,
-3.858522, -3.799819, 4, 1, 1.5, 0.5, 0.5,
-3.858522, -3.799819, 4, 0, 1.5, 0.5, 0.5
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
-3.371194, -3.303635, -5.843811,
-3.371194, 3.312144, -5.843811,
-3.371194, -3.303635, 6.096204,
-3.371194, 3.312144, 6.096204,
-3.371194, -3.303635, -5.843811,
-3.371194, -3.303635, 6.096204,
-3.371194, 3.312144, -5.843811,
-3.371194, 3.312144, 6.096204,
-3.371194, -3.303635, -5.843811,
3.126506, -3.303635, -5.843811,
-3.371194, -3.303635, 6.096204,
3.126506, -3.303635, 6.096204,
-3.371194, 3.312144, -5.843811,
3.126506, 3.312144, -5.843811,
-3.371194, 3.312144, 6.096204,
3.126506, 3.312144, 6.096204,
3.126506, -3.303635, -5.843811,
3.126506, 3.312144, -5.843811,
3.126506, -3.303635, 6.096204,
3.126506, 3.312144, 6.096204,
3.126506, -3.303635, -5.843811,
3.126506, -3.303635, 6.096204,
3.126506, 3.312144, -5.843811,
3.126506, 3.312144, 6.096204
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
var radius = 8.072695;
var distance = 35.91633;
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
mvMatrix.translate( 0.122344, -0.004254341, -0.1261969 );
mvMatrix.scale( 1.343299, 1.319324, 0.7310172 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.91633);
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
carfentrazone<-read.table("carfentrazone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carfentrazone$V2
```

```
## Error in eval(expr, envir, enclos): object 'carfentrazone' not found
```

```r
y<-carfentrazone$V3
```

```
## Error in eval(expr, envir, enclos): object 'carfentrazone' not found
```

```r
z<-carfentrazone$V4
```

```
## Error in eval(expr, envir, enclos): object 'carfentrazone' not found
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
-3.276568, -0.9316277, -2.231338, 0, 0, 1, 1, 1,
-2.908918, 0.2145081, -1.017261, 1, 0, 0, 1, 1,
-2.901264, 1.280392, -0.9740404, 1, 0, 0, 1, 1,
-2.740309, -0.625917, -2.776159, 1, 0, 0, 1, 1,
-2.60913, 0.7915966, -1.808002, 1, 0, 0, 1, 1,
-2.548176, 1.069181, -1.066381, 1, 0, 0, 1, 1,
-2.474566, -0.05745346, -2.684087, 0, 0, 0, 1, 1,
-2.180179, -1.528737, -2.570361, 0, 0, 0, 1, 1,
-2.16483, -0.9353323, -2.486153, 0, 0, 0, 1, 1,
-2.160794, 0.3314132, -1.959905, 0, 0, 0, 1, 1,
-2.138673, 1.04134, -0.6001031, 0, 0, 0, 1, 1,
-2.116857, -1.239888, -1.570539, 0, 0, 0, 1, 1,
-2.068655, 0.9191875, -1.529556, 0, 0, 0, 1, 1,
-2.066891, 0.287105, -0.3021106, 1, 1, 1, 1, 1,
-2.058951, 0.6482416, -0.6953748, 1, 1, 1, 1, 1,
-2.043837, -1.646736, -1.514004, 1, 1, 1, 1, 1,
-2.040634, 2.124041, -1.876155, 1, 1, 1, 1, 1,
-2.036138, -1.516964, -0.960105, 1, 1, 1, 1, 1,
-1.983029, 0.4895943, -1.50914, 1, 1, 1, 1, 1,
-1.932291, 1.344877, -1.168135, 1, 1, 1, 1, 1,
-1.910882, 0.2332285, -3.646603, 1, 1, 1, 1, 1,
-1.895647, 2.251589, -2.121925, 1, 1, 1, 1, 1,
-1.8884, 1.227468, -0.6896997, 1, 1, 1, 1, 1,
-1.873504, -1.193946, -2.661351, 1, 1, 1, 1, 1,
-1.873018, -0.007419045, -2.012795, 1, 1, 1, 1, 1,
-1.862222, -0.3375836, -0.4904669, 1, 1, 1, 1, 1,
-1.850862, 0.4222892, -2.002447, 1, 1, 1, 1, 1,
-1.825039, -0.146739, -1.879579, 1, 1, 1, 1, 1,
-1.818494, -2.762827, -2.475439, 0, 0, 1, 1, 1,
-1.80945, -0.1687618, -1.279029, 1, 0, 0, 1, 1,
-1.809024, 0.3145896, -1.638202, 1, 0, 0, 1, 1,
-1.807673, 0.8826616, 0.7156603, 1, 0, 0, 1, 1,
-1.774, 0.8568426, 1.008437, 1, 0, 0, 1, 1,
-1.76689, -0.1270444, 0.788185, 1, 0, 0, 1, 1,
-1.756416, 0.5002576, -3.514025, 0, 0, 0, 1, 1,
-1.722598, 0.8699245, -1.779749, 0, 0, 0, 1, 1,
-1.715506, -1.357468, -2.829566, 0, 0, 0, 1, 1,
-1.714503, 0.8238069, -1.093334, 0, 0, 0, 1, 1,
-1.713199, 0.9532037, 0.09240547, 0, 0, 0, 1, 1,
-1.711136, -2.421741, -0.6531768, 0, 0, 0, 1, 1,
-1.706497, 0.4357046, -0.4365794, 0, 0, 0, 1, 1,
-1.688619, 0.8914837, -0.8223671, 1, 1, 1, 1, 1,
-1.687354, -1.195246, 0.7425853, 1, 1, 1, 1, 1,
-1.686769, -0.474759, -2.008677, 1, 1, 1, 1, 1,
-1.681572, 0.2949642, -1.665984, 1, 1, 1, 1, 1,
-1.658077, 0.6750386, -0.9489241, 1, 1, 1, 1, 1,
-1.657395, 0.3440512, -2.063796, 1, 1, 1, 1, 1,
-1.648972, -2.126559, -2.803638, 1, 1, 1, 1, 1,
-1.64845, -0.6402864, -2.224658, 1, 1, 1, 1, 1,
-1.648074, -0.7220894, 0.4462195, 1, 1, 1, 1, 1,
-1.632885, -1.018211, -2.381698, 1, 1, 1, 1, 1,
-1.632193, 1.976754, -1.020915, 1, 1, 1, 1, 1,
-1.619648, -0.2288809, -1.366714, 1, 1, 1, 1, 1,
-1.613356, 1.367548, -0.241148, 1, 1, 1, 1, 1,
-1.595827, 0.9840725, -1.862745, 1, 1, 1, 1, 1,
-1.592201, -1.596532, -2.131449, 1, 1, 1, 1, 1,
-1.587429, 1.589356, -1.969083, 0, 0, 1, 1, 1,
-1.584026, -1.0885, -1.63612, 1, 0, 0, 1, 1,
-1.5812, -1.043683, -2.453852, 1, 0, 0, 1, 1,
-1.555508, 0.5189938, -0.6741523, 1, 0, 0, 1, 1,
-1.549979, 0.7780992, -1.210873, 1, 0, 0, 1, 1,
-1.548471, -2.494034, -4.15754, 1, 0, 0, 1, 1,
-1.547548, -1.134139, -0.4472481, 0, 0, 0, 1, 1,
-1.541258, -2.059562, -2.653094, 0, 0, 0, 1, 1,
-1.540947, 0.7716711, -2.373619, 0, 0, 0, 1, 1,
-1.537149, -2.140076, -3.215675, 0, 0, 0, 1, 1,
-1.520041, -0.2732283, -3.104436, 0, 0, 0, 1, 1,
-1.518132, 0.6587983, -0.7337915, 0, 0, 0, 1, 1,
-1.481514, -0.7191803, -1.221574, 0, 0, 0, 1, 1,
-1.47982, 1.051981, -1.298072, 1, 1, 1, 1, 1,
-1.47247, 1.10831, -0.6853094, 1, 1, 1, 1, 1,
-1.471343, -0.8583111, -2.013773, 1, 1, 1, 1, 1,
-1.456036, 0.07759428, -0.9475531, 1, 1, 1, 1, 1,
-1.449618, -0.6461442, -3.025968, 1, 1, 1, 1, 1,
-1.445756, 1.578529, 0.9901991, 1, 1, 1, 1, 1,
-1.435946, -0.0433671, -3.087616, 1, 1, 1, 1, 1,
-1.430985, -0.5722085, -3.353034, 1, 1, 1, 1, 1,
-1.416711, 0.2821013, -3.476577, 1, 1, 1, 1, 1,
-1.402726, -0.5001402, -3.311579, 1, 1, 1, 1, 1,
-1.396411, 0.5669718, -1.693696, 1, 1, 1, 1, 1,
-1.394427, 0.6112657, -0.2511123, 1, 1, 1, 1, 1,
-1.390348, 0.7018322, -1.477018, 1, 1, 1, 1, 1,
-1.381057, 1.79421, 0.4225219, 1, 1, 1, 1, 1,
-1.373166, -1.02371, -0.02665933, 1, 1, 1, 1, 1,
-1.366011, -2.229513, -2.327881, 0, 0, 1, 1, 1,
-1.36103, -0.7313201, -2.09839, 1, 0, 0, 1, 1,
-1.344863, -0.2702567, -3.227584, 1, 0, 0, 1, 1,
-1.340482, -1.129479, -2.602079, 1, 0, 0, 1, 1,
-1.336924, -0.02586782, -1.137211, 1, 0, 0, 1, 1,
-1.328997, 3.215797, -1.079746, 1, 0, 0, 1, 1,
-1.323145, -0.8790569, -1.413934, 0, 0, 0, 1, 1,
-1.318719, 0.09674509, -2.814775, 0, 0, 0, 1, 1,
-1.309806, -2.087276, -2.196582, 0, 0, 0, 1, 1,
-1.304988, 2.16067, 0.3100051, 0, 0, 0, 1, 1,
-1.294345, -0.651356, -0.493674, 0, 0, 0, 1, 1,
-1.286982, -0.02034501, -1.615209, 0, 0, 0, 1, 1,
-1.278691, -0.6349542, -1.27484, 0, 0, 0, 1, 1,
-1.270604, 0.4454435, -1.974593, 1, 1, 1, 1, 1,
-1.266103, -0.6023119, -0.9772499, 1, 1, 1, 1, 1,
-1.261196, 1.111694, -0.405248, 1, 1, 1, 1, 1,
-1.260785, 2.128002, -0.4528033, 1, 1, 1, 1, 1,
-1.259074, 0.787701, -1.740623, 1, 1, 1, 1, 1,
-1.258045, -0.936712, -0.7265945, 1, 1, 1, 1, 1,
-1.251198, -0.825229, -2.092226, 1, 1, 1, 1, 1,
-1.250601, -1.412178, -3.809882, 1, 1, 1, 1, 1,
-1.245762, 1.420697, -1.551404, 1, 1, 1, 1, 1,
-1.233722, 0.1235285, 0.01517151, 1, 1, 1, 1, 1,
-1.23351, 1.623157, 0.3053474, 1, 1, 1, 1, 1,
-1.230515, -1.504264, -1.591437, 1, 1, 1, 1, 1,
-1.229208, -0.8461075, -1.416798, 1, 1, 1, 1, 1,
-1.206785, -1.166467, -2.447105, 1, 1, 1, 1, 1,
-1.190641, 0.9127452, 0.786086, 1, 1, 1, 1, 1,
-1.186916, -1.911764, -3.021826, 0, 0, 1, 1, 1,
-1.17868, -0.4224853, -1.964665, 1, 0, 0, 1, 1,
-1.174482, -1.521546, -0.5476773, 1, 0, 0, 1, 1,
-1.172886, 0.413834, -2.32151, 1, 0, 0, 1, 1,
-1.167816, -0.1355183, -0.478227, 1, 0, 0, 1, 1,
-1.151312, -1.702156, -1.725025, 1, 0, 0, 1, 1,
-1.147605, -0.05145488, 1.043358, 0, 0, 0, 1, 1,
-1.133615, -0.5982213, -3.435232, 0, 0, 0, 1, 1,
-1.128415, 1.406526, -0.4041217, 0, 0, 0, 1, 1,
-1.115825, -1.334484, -1.887199, 0, 0, 0, 1, 1,
-1.112091, -1.857105, -2.70055, 0, 0, 0, 1, 1,
-1.11193, 0.4546136, 0.274567, 0, 0, 0, 1, 1,
-1.107478, -0.4128042, -3.7519, 0, 0, 0, 1, 1,
-1.106059, 0.2311989, -2.822435, 1, 1, 1, 1, 1,
-1.097306, 0.02161131, -0.1752628, 1, 1, 1, 1, 1,
-1.092417, 1.776979, -0.6097869, 1, 1, 1, 1, 1,
-1.090693, -0.4671636, -2.266101, 1, 1, 1, 1, 1,
-1.087206, -0.7922316, -0.6662309, 1, 1, 1, 1, 1,
-1.086934, -0.2357499, -1.796137, 1, 1, 1, 1, 1,
-1.082552, -1.639593, -1.500943, 1, 1, 1, 1, 1,
-1.081583, -1.514027, -4.201299, 1, 1, 1, 1, 1,
-1.079889, -0.3927218, -1.122902, 1, 1, 1, 1, 1,
-1.077824, -1.103334, -1.509791, 1, 1, 1, 1, 1,
-1.07086, -1.37532, -2.92579, 1, 1, 1, 1, 1,
-1.070594, 0.08315634, -2.593974, 1, 1, 1, 1, 1,
-1.067058, -0.156868, -0.2699875, 1, 1, 1, 1, 1,
-1.062556, 0.5071687, -1.505923, 1, 1, 1, 1, 1,
-1.056793, 1.181588, -2.220571, 1, 1, 1, 1, 1,
-1.050845, -0.1427758, -1.78227, 0, 0, 1, 1, 1,
-1.046465, 1.114019, -1.543499, 1, 0, 0, 1, 1,
-1.040861, -0.9982877, -1.881734, 1, 0, 0, 1, 1,
-1.039555, 1.198515, -1.491914, 1, 0, 0, 1, 1,
-1.038257, -1.107797, -1.934676, 1, 0, 0, 1, 1,
-1.03557, 0.0290624, -1.995916, 1, 0, 0, 1, 1,
-1.035242, 0.4434613, -0.305255, 0, 0, 0, 1, 1,
-1.029449, 0.6828268, -1.295782, 0, 0, 0, 1, 1,
-1.023014, -0.2914419, -4.05448, 0, 0, 0, 1, 1,
-1.013686, -0.006637254, -2.21559, 0, 0, 0, 1, 1,
-1.012106, -0.1903212, -2.72153, 0, 0, 0, 1, 1,
-1.006008, 0.1149047, -0.2563809, 0, 0, 0, 1, 1,
-1.0044, 1.311609, 1.425695, 0, 0, 0, 1, 1,
-1.002068, 0.4165861, -1.231521, 1, 1, 1, 1, 1,
-1.000942, -0.4509308, -1.388141, 1, 1, 1, 1, 1,
-0.9929978, 0.1750165, -1.387785, 1, 1, 1, 1, 1,
-0.9929896, 1.241942, 0.4794815, 1, 1, 1, 1, 1,
-0.9923721, -0.03299665, -1.437589, 1, 1, 1, 1, 1,
-0.992214, -0.3829439, -1.14618, 1, 1, 1, 1, 1,
-0.9890282, -0.8035673, -3.771753, 1, 1, 1, 1, 1,
-0.9870703, -2.465125, -2.350714, 1, 1, 1, 1, 1,
-0.9864432, -0.3657517, 1.029203, 1, 1, 1, 1, 1,
-0.9824984, -0.2928667, -1.818062, 1, 1, 1, 1, 1,
-0.9689219, -2.02455, -4.032785, 1, 1, 1, 1, 1,
-0.9640282, 1.567768, -1.764428, 1, 1, 1, 1, 1,
-0.9618992, 0.3873613, -0.4722443, 1, 1, 1, 1, 1,
-0.961613, -0.5915555, -0.6786683, 1, 1, 1, 1, 1,
-0.9585021, 0.9067531, -2.219748, 1, 1, 1, 1, 1,
-0.9576575, -1.335519, -0.7998036, 0, 0, 1, 1, 1,
-0.9562798, -0.7603079, -2.110281, 1, 0, 0, 1, 1,
-0.9471219, 2.754498, 0.00162136, 1, 0, 0, 1, 1,
-0.9423146, 0.3200589, -2.597542, 1, 0, 0, 1, 1,
-0.9317406, -1.482219, -3.46129, 1, 0, 0, 1, 1,
-0.924936, -1.320967, -3.593056, 1, 0, 0, 1, 1,
-0.9246268, -1.075118, -3.800574, 0, 0, 0, 1, 1,
-0.9114531, 0.5075873, 0.1187343, 0, 0, 0, 1, 1,
-0.9075837, 0.1450217, -2.42886, 0, 0, 0, 1, 1,
-0.9067201, -1.505437, -3.082773, 0, 0, 0, 1, 1,
-0.8980309, -0.9503901, -2.871497, 0, 0, 0, 1, 1,
-0.8885615, -1.739189, -1.313949, 0, 0, 0, 1, 1,
-0.8884143, -2.068364, -2.230121, 0, 0, 0, 1, 1,
-0.8835696, 0.3759745, -0.724413, 1, 1, 1, 1, 1,
-0.8795896, -0.7131288, -2.081137, 1, 1, 1, 1, 1,
-0.8768434, -1.224355, -3.406217, 1, 1, 1, 1, 1,
-0.8733951, 1.900013, -0.7397247, 1, 1, 1, 1, 1,
-0.8725618, 0.7286413, -1.467601, 1, 1, 1, 1, 1,
-0.8713793, -0.05991365, -1.645098, 1, 1, 1, 1, 1,
-0.8692821, -0.779286, -2.183084, 1, 1, 1, 1, 1,
-0.8606573, -1.153284, -2.238748, 1, 1, 1, 1, 1,
-0.8548518, -0.5753781, -1.999107, 1, 1, 1, 1, 1,
-0.8481899, -0.5646153, -2.654351, 1, 1, 1, 1, 1,
-0.8449409, 0.2350446, -1.476105, 1, 1, 1, 1, 1,
-0.8445385, -0.09473862, -1.346804, 1, 1, 1, 1, 1,
-0.8444672, 0.1423448, -1.391113, 1, 1, 1, 1, 1,
-0.8347481, -0.5385389, -2.528549, 1, 1, 1, 1, 1,
-0.8261734, 0.3616283, -0.4212936, 1, 1, 1, 1, 1,
-0.8195042, -0.6351438, -2.65465, 0, 0, 1, 1, 1,
-0.8181855, -0.451323, -1.486048, 1, 0, 0, 1, 1,
-0.8148231, -0.3161816, -1.003405, 1, 0, 0, 1, 1,
-0.8133053, 1.987812, -0.2627167, 1, 0, 0, 1, 1,
-0.8108571, 0.5349569, -0.8705133, 1, 0, 0, 1, 1,
-0.8059905, -0.8132616, -2.095643, 1, 0, 0, 1, 1,
-0.801633, -0.184725, -1.831104, 0, 0, 0, 1, 1,
-0.7851186, -0.7257829, -2.702446, 0, 0, 0, 1, 1,
-0.7849717, -0.7240324, -1.212468, 0, 0, 0, 1, 1,
-0.7803497, 1.40658, -2.283466, 0, 0, 0, 1, 1,
-0.7793766, 1.165561, -1.623896, 0, 0, 0, 1, 1,
-0.7740234, 0.0684075, -0.1841761, 0, 0, 0, 1, 1,
-0.7707292, 2.634924, 0.6876366, 0, 0, 0, 1, 1,
-0.7673767, -1.039052, -2.042099, 1, 1, 1, 1, 1,
-0.7663392, 0.3567316, -2.3132, 1, 1, 1, 1, 1,
-0.7659512, 0.4921892, -1.224041, 1, 1, 1, 1, 1,
-0.759232, 1.862797, -0.3634635, 1, 1, 1, 1, 1,
-0.7592134, -0.5662454, -2.224716, 1, 1, 1, 1, 1,
-0.7585772, -1.574887, -3.047244, 1, 1, 1, 1, 1,
-0.7581734, -0.09873725, -2.502374, 1, 1, 1, 1, 1,
-0.751325, 0.8943816, -0.4476029, 1, 1, 1, 1, 1,
-0.7508608, 1.502898, -0.8851199, 1, 1, 1, 1, 1,
-0.7466695, 0.4468982, -1.516913, 1, 1, 1, 1, 1,
-0.7447149, -1.535267, -2.707393, 1, 1, 1, 1, 1,
-0.7392232, -0.7797571, -2.413738, 1, 1, 1, 1, 1,
-0.7345926, 0.5043035, -2.02596, 1, 1, 1, 1, 1,
-0.7345457, -0.3653841, -1.573256, 1, 1, 1, 1, 1,
-0.7274541, -0.4870391, -2.153613, 1, 1, 1, 1, 1,
-0.7262658, -0.6959335, -1.536997, 0, 0, 1, 1, 1,
-0.7243229, 1.463733, -2.213266, 1, 0, 0, 1, 1,
-0.7172465, -0.6402738, -2.634564, 1, 0, 0, 1, 1,
-0.7170385, -0.05354412, -1.172983, 1, 0, 0, 1, 1,
-0.7160353, 1.363241, -0.4140835, 1, 0, 0, 1, 1,
-0.7146077, -0.3050267, -2.458505, 1, 0, 0, 1, 1,
-0.7126457, 0.1019888, -2.410693, 0, 0, 0, 1, 1,
-0.7022344, -0.7009518, -1.470826, 0, 0, 0, 1, 1,
-0.6980566, -0.3883071, -0.4886897, 0, 0, 0, 1, 1,
-0.6952083, 2.616913, -0.07754264, 0, 0, 0, 1, 1,
-0.6879048, 0.03685316, -0.2724363, 0, 0, 0, 1, 1,
-0.6841393, -1.580163, -1.855682, 0, 0, 0, 1, 1,
-0.6800197, 2.500968, -0.6934221, 0, 0, 0, 1, 1,
-0.6768073, 1.696291, -0.8808157, 1, 1, 1, 1, 1,
-0.675341, -1.10042, -5.02163, 1, 1, 1, 1, 1,
-0.6735771, -0.7007837, -1.395689, 1, 1, 1, 1, 1,
-0.6733191, -0.3213485, -0.03829338, 1, 1, 1, 1, 1,
-0.6652837, 0.4611301, -1.83762, 1, 1, 1, 1, 1,
-0.6625656, -0.320385, -2.375593, 1, 1, 1, 1, 1,
-0.6617078, -0.2915422, -0.2829621, 1, 1, 1, 1, 1,
-0.659461, -1.20504, -2.981666, 1, 1, 1, 1, 1,
-0.6579338, -0.1997065, -1.540045, 1, 1, 1, 1, 1,
-0.6561447, 0.3853188, -0.3011056, 1, 1, 1, 1, 1,
-0.6543251, 1.102295, 2.094092, 1, 1, 1, 1, 1,
-0.651929, 1.188794, -1.611333, 1, 1, 1, 1, 1,
-0.648751, -1.022493, -2.250535, 1, 1, 1, 1, 1,
-0.6463205, -1.631313, -3.422822, 1, 1, 1, 1, 1,
-0.6441749, 0.5234048, -2.527229, 1, 1, 1, 1, 1,
-0.6428371, -0.01655002, -2.902374, 0, 0, 1, 1, 1,
-0.6400082, 0.7180255, -1.522498, 1, 0, 0, 1, 1,
-0.6383659, 0.03090102, -0.6696929, 1, 0, 0, 1, 1,
-0.6261783, -0.8070124, -2.681613, 1, 0, 0, 1, 1,
-0.6213769, -1.309634, -1.615529, 1, 0, 0, 1, 1,
-0.6179789, 0.5959244, -1.263323, 1, 0, 0, 1, 1,
-0.6164551, 0.07804848, -1.005967, 0, 0, 0, 1, 1,
-0.6093559, -0.5737984, -2.547681, 0, 0, 0, 1, 1,
-0.6070542, -1.298776, -3.537341, 0, 0, 0, 1, 1,
-0.6069275, 0.5887432, -1.5795, 0, 0, 0, 1, 1,
-0.6053602, 0.6049036, -1.101285, 0, 0, 0, 1, 1,
-0.6049041, -0.2542882, 0.6593502, 0, 0, 0, 1, 1,
-0.6029949, 0.4672692, -1.159978, 0, 0, 0, 1, 1,
-0.5972517, 1.459232, -0.6275886, 1, 1, 1, 1, 1,
-0.5968875, 0.3642453, -1.379709, 1, 1, 1, 1, 1,
-0.5926217, -0.6814548, -0.7410889, 1, 1, 1, 1, 1,
-0.5871067, -0.3299542, -0.9413475, 1, 1, 1, 1, 1,
-0.5823011, 0.4326669, -2.263535, 1, 1, 1, 1, 1,
-0.563623, 2.23971, -1.264821, 1, 1, 1, 1, 1,
-0.5636123, 0.4647461, -0.7262276, 1, 1, 1, 1, 1,
-0.5612233, 0.2339547, -1.30946, 1, 1, 1, 1, 1,
-0.5609329, -0.4241154, -4.568057, 1, 1, 1, 1, 1,
-0.5588683, 1.55906, 2.436056, 1, 1, 1, 1, 1,
-0.5585235, -0.4520243, -2.016064, 1, 1, 1, 1, 1,
-0.5571001, 0.3856509, -1.019621, 1, 1, 1, 1, 1,
-0.5484634, 2.50508, -0.6902621, 1, 1, 1, 1, 1,
-0.5429564, -0.9967337, -3.397577, 1, 1, 1, 1, 1,
-0.5410942, 1.23291, -0.6279389, 1, 1, 1, 1, 1,
-0.5397322, 0.1107946, -3.576229, 0, 0, 1, 1, 1,
-0.5338047, -0.9145705, -1.850765, 1, 0, 0, 1, 1,
-0.5276818, 0.172296, -0.8473803, 1, 0, 0, 1, 1,
-0.5220191, -0.4118336, -1.842494, 1, 0, 0, 1, 1,
-0.519236, 0.9318011, -1.601637, 1, 0, 0, 1, 1,
-0.5184124, 1.500551, 1.177268, 1, 0, 0, 1, 1,
-0.5155267, 0.2939159, -2.245175, 0, 0, 0, 1, 1,
-0.5131274, 0.2079742, -0.6939626, 0, 0, 0, 1, 1,
-0.5031478, 2.675096, -2.184984, 0, 0, 0, 1, 1,
-0.5005548, 0.4611422, -0.4191615, 0, 0, 0, 1, 1,
-0.4970014, 1.10827, -1.297255, 0, 0, 0, 1, 1,
-0.4956392, -0.3711964, -2.682948, 0, 0, 0, 1, 1,
-0.48604, -1.044357, -2.81907, 0, 0, 0, 1, 1,
-0.4841586, 1.556174, -1.104003, 1, 1, 1, 1, 1,
-0.4828163, 1.079528, -1.486789, 1, 1, 1, 1, 1,
-0.4801993, -1.876611, -3.285104, 1, 1, 1, 1, 1,
-0.4784186, 0.4708868, -1.540147, 1, 1, 1, 1, 1,
-0.4782687, 0.2421361, -2.722853, 1, 1, 1, 1, 1,
-0.4778776, 1.404261, 0.7828291, 1, 1, 1, 1, 1,
-0.4772034, -0.05269234, -1.095159, 1, 1, 1, 1, 1,
-0.4741231, -1.45269, -4.458786, 1, 1, 1, 1, 1,
-0.4730155, 0.9719347, -1.461277, 1, 1, 1, 1, 1,
-0.467549, 0.490826, -1.646357, 1, 1, 1, 1, 1,
-0.466264, -1.699249, -5.669927, 1, 1, 1, 1, 1,
-0.4648346, -0.6934667, -2.576804, 1, 1, 1, 1, 1,
-0.4612685, 1.042636, 0.205349, 1, 1, 1, 1, 1,
-0.4589049, -0.8551146, -2.42511, 1, 1, 1, 1, 1,
-0.4585626, -0.6395127, -4.579873, 1, 1, 1, 1, 1,
-0.4571867, -0.9947779, 0.03247786, 0, 0, 1, 1, 1,
-0.4560901, 0.2791278, -1.974387, 1, 0, 0, 1, 1,
-0.4537719, -0.2663349, -1.973596, 1, 0, 0, 1, 1,
-0.4508755, 1.195949, 0.7364473, 1, 0, 0, 1, 1,
-0.4505071, 0.1051609, 0.0578153, 1, 0, 0, 1, 1,
-0.4487396, -1.290674, -2.974475, 1, 0, 0, 1, 1,
-0.4482318, 2.744761, -0.8771928, 0, 0, 0, 1, 1,
-0.4427056, 0.7159283, -1.88353, 0, 0, 0, 1, 1,
-0.4410583, -1.633348, -2.033517, 0, 0, 0, 1, 1,
-0.4395211, 0.766656, -2.8738, 0, 0, 0, 1, 1,
-0.4360917, -0.4235903, -4.278261, 0, 0, 0, 1, 1,
-0.430964, -1.9248, -3.320068, 0, 0, 0, 1, 1,
-0.4296861, -1.171776, -1.046465, 0, 0, 0, 1, 1,
-0.4248371, 1.847971, 0.5954165, 1, 1, 1, 1, 1,
-0.4205754, 0.1300504, -0.6219822, 1, 1, 1, 1, 1,
-0.4185284, 1.893354, -0.270007, 1, 1, 1, 1, 1,
-0.4179585, -1.172149, -3.687071, 1, 1, 1, 1, 1,
-0.4170043, -1.482389, -2.56621, 1, 1, 1, 1, 1,
-0.4018267, -0.5284787, -2.570042, 1, 1, 1, 1, 1,
-0.3991152, 0.3130095, -0.9630061, 1, 1, 1, 1, 1,
-0.3964733, -1.416023, -3.011486, 1, 1, 1, 1, 1,
-0.3875187, -1.140094, -4.34832, 1, 1, 1, 1, 1,
-0.3864658, 0.634037, -0.5646527, 1, 1, 1, 1, 1,
-0.3858069, -0.05947132, -1.369052, 1, 1, 1, 1, 1,
-0.3852024, -0.9868055, -2.74332, 1, 1, 1, 1, 1,
-0.3759318, 0.7813991, -2.80728, 1, 1, 1, 1, 1,
-0.3752444, -0.4869893, -2.106469, 1, 1, 1, 1, 1,
-0.3738043, 0.6962557, -0.6352756, 1, 1, 1, 1, 1,
-0.3710072, 0.7385075, 0.7888323, 0, 0, 1, 1, 1,
-0.3709757, 0.4586471, -1.304293, 1, 0, 0, 1, 1,
-0.3702331, 0.2697208, -0.5521889, 1, 0, 0, 1, 1,
-0.3684349, -0.4236668, -1.450836, 1, 0, 0, 1, 1,
-0.3680352, -1.582553, -3.554709, 1, 0, 0, 1, 1,
-0.3605795, 0.9549375, -0.6982341, 1, 0, 0, 1, 1,
-0.35934, 0.1563528, -2.634481, 0, 0, 0, 1, 1,
-0.3592199, -0.5073741, -2.595425, 0, 0, 0, 1, 1,
-0.3517212, 0.8574923, -0.2667887, 0, 0, 0, 1, 1,
-0.3503444, 1.131901, 0.2894866, 0, 0, 0, 1, 1,
-0.3476688, -1.607821, -1.907521, 0, 0, 0, 1, 1,
-0.3449662, -0.2819327, -0.5865333, 0, 0, 0, 1, 1,
-0.3415262, 0.3982618, 0.827205, 0, 0, 0, 1, 1,
-0.3365588, -0.8097876, -3.432415, 1, 1, 1, 1, 1,
-0.3325919, 0.2294109, -0.7643375, 1, 1, 1, 1, 1,
-0.3325334, 1.124573, -1.613663, 1, 1, 1, 1, 1,
-0.3300413, 0.2536393, -1.003877, 1, 1, 1, 1, 1,
-0.3296472, -1.089638, -2.395873, 1, 1, 1, 1, 1,
-0.3266639, -2.036311, -4.8439, 1, 1, 1, 1, 1,
-0.3243445, -0.01845349, 0.0169456, 1, 1, 1, 1, 1,
-0.3207161, 0.04165031, -0.2542294, 1, 1, 1, 1, 1,
-0.3170526, -0.4172896, -2.304644, 1, 1, 1, 1, 1,
-0.313638, -0.6628293, -3.735521, 1, 1, 1, 1, 1,
-0.3129953, -1.145134, -2.284078, 1, 1, 1, 1, 1,
-0.3124657, -0.3169114, -2.427148, 1, 1, 1, 1, 1,
-0.3106785, 0.708181, 0.8238627, 1, 1, 1, 1, 1,
-0.3094752, -1.810879, -2.544916, 1, 1, 1, 1, 1,
-0.309343, -0.221254, -2.415036, 1, 1, 1, 1, 1,
-0.3082799, -0.8904871, -3.022276, 0, 0, 1, 1, 1,
-0.3048624, 0.1355712, -1.840613, 1, 0, 0, 1, 1,
-0.2982673, 0.008532863, -2.343415, 1, 0, 0, 1, 1,
-0.2977838, 0.6139796, 0.8196937, 1, 0, 0, 1, 1,
-0.2929009, -1.027706, -3.828754, 1, 0, 0, 1, 1,
-0.2928864, 0.1440699, -0.9247548, 1, 0, 0, 1, 1,
-0.2916288, 0.6352952, -0.506758, 0, 0, 0, 1, 1,
-0.2897669, -0.738934, -1.080171, 0, 0, 0, 1, 1,
-0.2878546, -0.1292189, -1.274089, 0, 0, 0, 1, 1,
-0.2853717, 0.3649023, -0.5901335, 0, 0, 0, 1, 1,
-0.2791854, 0.341068, 0.1502622, 0, 0, 0, 1, 1,
-0.277409, 1.35866, -0.8255534, 0, 0, 0, 1, 1,
-0.2735942, -0.1377597, -2.246577, 0, 0, 0, 1, 1,
-0.2730322, -1.051009, -2.85377, 1, 1, 1, 1, 1,
-0.270045, -0.4908553, -2.062247, 1, 1, 1, 1, 1,
-0.2649882, 0.7205927, -0.8029048, 1, 1, 1, 1, 1,
-0.2632635, 2.572809, 0.7415024, 1, 1, 1, 1, 1,
-0.2629934, -0.3237023, -2.867128, 1, 1, 1, 1, 1,
-0.262123, 0.009581722, -3.051325, 1, 1, 1, 1, 1,
-0.2607424, 0.7041125, 0.4080849, 1, 1, 1, 1, 1,
-0.259946, 0.1653984, -1.030094, 1, 1, 1, 1, 1,
-0.2533169, 0.1858831, 0.1881022, 1, 1, 1, 1, 1,
-0.2473636, 0.9621504, 0.6800962, 1, 1, 1, 1, 1,
-0.2463138, -1.220651, -3.909456, 1, 1, 1, 1, 1,
-0.2443218, -1.214682, -2.292526, 1, 1, 1, 1, 1,
-0.2438619, 0.1226771, 0.2071928, 1, 1, 1, 1, 1,
-0.2407187, -0.9029128, -2.595683, 1, 1, 1, 1, 1,
-0.2396913, -1.05725, -2.835873, 1, 1, 1, 1, 1,
-0.2394511, -1.229593, -2.906825, 0, 0, 1, 1, 1,
-0.2389298, 0.9498383, -0.4313096, 1, 0, 0, 1, 1,
-0.2368266, 0.1369556, -1.850729, 1, 0, 0, 1, 1,
-0.2364016, 0.8405863, -2.406574, 1, 0, 0, 1, 1,
-0.234157, 1.399533, 0.6289388, 1, 0, 0, 1, 1,
-0.233213, -0.05900574, -2.985076, 1, 0, 0, 1, 1,
-0.2311928, -0.8082304, -2.449881, 0, 0, 0, 1, 1,
-0.2310799, 0.7025095, -0.4925306, 0, 0, 0, 1, 1,
-0.227692, -1.50591, -4.576343, 0, 0, 0, 1, 1,
-0.2272812, -0.1793336, -0.7832031, 0, 0, 0, 1, 1,
-0.2265026, 0.3907253, 0.1364034, 0, 0, 0, 1, 1,
-0.2260695, -1.210611, -3.624912, 0, 0, 0, 1, 1,
-0.2199757, 1.305282, 1.406011, 0, 0, 0, 1, 1,
-0.2193199, 0.3522636, 0.916157, 1, 1, 1, 1, 1,
-0.2133553, 0.6103332, 0.002493555, 1, 1, 1, 1, 1,
-0.209529, 0.309608, -1.219544, 1, 1, 1, 1, 1,
-0.2074803, -0.4516744, -4.101902, 1, 1, 1, 1, 1,
-0.2070703, -1.720937, -2.986904, 1, 1, 1, 1, 1,
-0.2035561, -0.4974897, -2.245802, 1, 1, 1, 1, 1,
-0.2025734, 1.167767, 0.4767959, 1, 1, 1, 1, 1,
-0.1979612, 0.9673188, 0.6092572, 1, 1, 1, 1, 1,
-0.1969176, 0.8020212, -0.2743957, 1, 1, 1, 1, 1,
-0.1966222, 0.7294155, -0.8486159, 1, 1, 1, 1, 1,
-0.1941808, -1.181353, -2.890684, 1, 1, 1, 1, 1,
-0.1924194, 1.056599, 0.1546512, 1, 1, 1, 1, 1,
-0.1876987, 0.3201469, 0.9826469, 1, 1, 1, 1, 1,
-0.1864641, -1.366417, -3.762305, 1, 1, 1, 1, 1,
-0.1847767, 0.9184406, 0.4132095, 1, 1, 1, 1, 1,
-0.1810549, 1.146295, 1.052649, 0, 0, 1, 1, 1,
-0.1805687, 0.1703644, -0.009298612, 1, 0, 0, 1, 1,
-0.1730998, 0.08416976, 1.113487, 1, 0, 0, 1, 1,
-0.1727952, 0.1927594, -1.048298, 1, 0, 0, 1, 1,
-0.1691423, 1.916034, -0.7555579, 1, 0, 0, 1, 1,
-0.1680052, 1.756264, -0.04701482, 1, 0, 0, 1, 1,
-0.1678946, 0.7221032, 0.6083416, 0, 0, 0, 1, 1,
-0.1606552, -0.4627452, -1.684566, 0, 0, 0, 1, 1,
-0.1583922, 1.651802, -0.6483378, 0, 0, 0, 1, 1,
-0.1573937, -0.8522306, -3.290785, 0, 0, 0, 1, 1,
-0.1547162, 1.543006, 0.6293104, 0, 0, 0, 1, 1,
-0.1529918, 0.3543422, 0.4513958, 0, 0, 0, 1, 1,
-0.1507278, -0.4994186, -1.643518, 0, 0, 0, 1, 1,
-0.1492023, -0.5834216, -1.322407, 1, 1, 1, 1, 1,
-0.1484432, -0.1525857, -2.207896, 1, 1, 1, 1, 1,
-0.1449, -0.3040714, -3.608365, 1, 1, 1, 1, 1,
-0.144847, -0.3005894, -2.345938, 1, 1, 1, 1, 1,
-0.1427473, 0.08084153, -1.672815, 1, 1, 1, 1, 1,
-0.1410051, -0.2440206, -2.121909, 1, 1, 1, 1, 1,
-0.138785, 0.2282873, -1.715165, 1, 1, 1, 1, 1,
-0.1386691, -0.4113005, -2.209527, 1, 1, 1, 1, 1,
-0.1353069, 2.373769, -2.403291, 1, 1, 1, 1, 1,
-0.1319971, 0.09751865, -0.1461671, 1, 1, 1, 1, 1,
-0.1308291, -0.7347753, -2.034944, 1, 1, 1, 1, 1,
-0.1302148, 0.8551268, -0.4438905, 1, 1, 1, 1, 1,
-0.1258653, -0.9581841, -3.694628, 1, 1, 1, 1, 1,
-0.124636, -0.8241695, -4.39317, 1, 1, 1, 1, 1,
-0.123625, -0.1800475, -2.346134, 1, 1, 1, 1, 1,
-0.1225359, 1.083825, -0.4285826, 0, 0, 1, 1, 1,
-0.1216734, 2.301028, -0.000951572, 1, 0, 0, 1, 1,
-0.1193668, 0.04324263, -1.282972, 1, 0, 0, 1, 1,
-0.1159712, -1.006394, -2.83004, 1, 0, 0, 1, 1,
-0.1156351, -0.5741397, -2.24193, 1, 0, 0, 1, 1,
-0.113485, -0.9463967, -3.329588, 1, 0, 0, 1, 1,
-0.1111659, 0.6587458, 1.197983, 0, 0, 0, 1, 1,
-0.1109544, -0.4541358, -2.520731, 0, 0, 0, 1, 1,
-0.1101517, -0.367193, -1.572481, 0, 0, 0, 1, 1,
-0.1085677, 0.4266968, 1.528125, 0, 0, 0, 1, 1,
-0.1079993, -0.2553147, -2.604407, 0, 0, 0, 1, 1,
-0.1003965, 0.9897605, 0.01962789, 0, 0, 0, 1, 1,
-0.1002797, -0.8112018, -2.613547, 0, 0, 0, 1, 1,
-0.0979424, -0.5104013, -4.20287, 1, 1, 1, 1, 1,
-0.09447095, 0.802163, -1.85412, 1, 1, 1, 1, 1,
-0.09434053, 1.49942, -0.5779166, 1, 1, 1, 1, 1,
-0.092918, -0.6928146, -3.05838, 1, 1, 1, 1, 1,
-0.08764114, -0.008198305, -0.5213214, 1, 1, 1, 1, 1,
-0.08525073, -0.652099, -2.336024, 1, 1, 1, 1, 1,
-0.08450094, 0.7186944, -0.0209121, 1, 1, 1, 1, 1,
-0.08247764, -0.1047718, -2.788866, 1, 1, 1, 1, 1,
-0.0805501, 0.4785394, -0.8761147, 1, 1, 1, 1, 1,
-0.08045721, 1.068962, -0.4398325, 1, 1, 1, 1, 1,
-0.07868911, -0.1715319, -2.893585, 1, 1, 1, 1, 1,
-0.0697743, 0.8087943, 0.6864553, 1, 1, 1, 1, 1,
-0.06623583, 0.3813626, 0.5125086, 1, 1, 1, 1, 1,
-0.06454773, -0.2498278, -3.332576, 1, 1, 1, 1, 1,
-0.06389976, -0.2187384, -1.788304, 1, 1, 1, 1, 1,
-0.0604873, 2.007872, 0.7683234, 0, 0, 1, 1, 1,
-0.05768938, -1.312898, -3.212995, 1, 0, 0, 1, 1,
-0.05334793, -1.211255, -3.468427, 1, 0, 0, 1, 1,
-0.04954553, 0.9906242, -1.414023, 1, 0, 0, 1, 1,
-0.04798402, -0.02542639, -1.525793, 1, 0, 0, 1, 1,
-0.04476759, -0.07913238, -1.697377, 1, 0, 0, 1, 1,
-0.04374112, -0.3389604, -2.810922, 0, 0, 0, 1, 1,
-0.04020912, -1.154898, -1.721404, 0, 0, 0, 1, 1,
-0.03614634, -0.234362, -2.858744, 0, 0, 0, 1, 1,
-0.03516156, -1.310761, -0.5801544, 0, 0, 0, 1, 1,
-0.0329874, 0.9520717, 0.7576693, 0, 0, 0, 1, 1,
-0.03076738, -0.4129484, -3.2611, 0, 0, 0, 1, 1,
-0.02241166, 0.2858858, -0.01787307, 0, 0, 0, 1, 1,
-0.01911932, 1.285559, 1.680513, 1, 1, 1, 1, 1,
-0.01743417, -0.2636908, -3.706619, 1, 1, 1, 1, 1,
-0.01520636, -0.8651674, -2.316614, 1, 1, 1, 1, 1,
-0.0140024, 0.003877243, -1.99702, 1, 1, 1, 1, 1,
-0.01250501, 0.2131155, -1.898804, 1, 1, 1, 1, 1,
-0.006976373, -0.3915015, -2.493082, 1, 1, 1, 1, 1,
-0.00638389, -0.6288124, -2.82434, 1, 1, 1, 1, 1,
-0.00604365, -0.7004571, -3.651351, 1, 1, 1, 1, 1,
-0.005726697, 0.2198484, -0.9826246, 1, 1, 1, 1, 1,
-0.005587987, -0.1175875, -3.136199, 1, 1, 1, 1, 1,
-0.003670133, -0.002094826, -1.374447, 1, 1, 1, 1, 1,
5.77897e-05, -1.413216, 3.56693, 1, 1, 1, 1, 1,
0.001495433, -0.8960614, 2.297153, 1, 1, 1, 1, 1,
0.001709179, 0.422666, -2.021935, 1, 1, 1, 1, 1,
0.0019221, -1.162403, 1.724693, 1, 1, 1, 1, 1,
0.003014673, 0.9069235, -1.088631, 0, 0, 1, 1, 1,
0.006012591, 1.355882, 0.5699043, 1, 0, 0, 1, 1,
0.006557727, -0.6589299, 3.289362, 1, 0, 0, 1, 1,
0.007974177, -0.1224607, 4.250025, 1, 0, 0, 1, 1,
0.009086656, -0.1708151, 3.131321, 1, 0, 0, 1, 1,
0.009323199, 0.4706944, -0.9494365, 1, 0, 0, 1, 1,
0.01504714, -0.1245149, 4.949801, 0, 0, 0, 1, 1,
0.01570761, 0.8090656, -2.043717, 0, 0, 0, 1, 1,
0.02226346, -0.1311656, 2.757809, 0, 0, 0, 1, 1,
0.02318561, 0.8058823, 0.01770019, 0, 0, 0, 1, 1,
0.02428243, -1.101092, 4.506336, 0, 0, 0, 1, 1,
0.02457243, -0.01806012, 1.801725, 0, 0, 0, 1, 1,
0.02501217, -0.1811937, 3.880807, 0, 0, 0, 1, 1,
0.02656172, 1.547388, 1.656786, 1, 1, 1, 1, 1,
0.02756666, 0.1124703, 0.6782321, 1, 1, 1, 1, 1,
0.03073617, 2.871206, -0.05906198, 1, 1, 1, 1, 1,
0.03102038, 3.015671, 0.4483814, 1, 1, 1, 1, 1,
0.03228644, 0.1663094, 0.4498546, 1, 1, 1, 1, 1,
0.03586137, -2.024555, 3.557103, 1, 1, 1, 1, 1,
0.0414089, 0.3251815, -0.7211362, 1, 1, 1, 1, 1,
0.04330771, -0.2063851, 3.018376, 1, 1, 1, 1, 1,
0.04447081, 0.8867242, -0.08022687, 1, 1, 1, 1, 1,
0.04453075, 1.332505, -0.9713538, 1, 1, 1, 1, 1,
0.04529795, -0.4679321, 3.591295, 1, 1, 1, 1, 1,
0.05158479, 1.259963, 0.772553, 1, 1, 1, 1, 1,
0.05283164, 0.915062, 0.2755105, 1, 1, 1, 1, 1,
0.05363589, -1.448017, 1.724456, 1, 1, 1, 1, 1,
0.05370943, 0.01755146, -0.4144262, 1, 1, 1, 1, 1,
0.05937262, -0.3715843, 0.6004438, 0, 0, 1, 1, 1,
0.06953456, -0.1049094, 1.151394, 1, 0, 0, 1, 1,
0.07190576, -1.343096, 4.27137, 1, 0, 0, 1, 1,
0.07210881, -0.2363443, 3.21657, 1, 0, 0, 1, 1,
0.07918084, 0.4702853, -0.02511054, 1, 0, 0, 1, 1,
0.07965055, -0.4659296, 3.227856, 1, 0, 0, 1, 1,
0.08354504, -1.462975, 2.448117, 0, 0, 0, 1, 1,
0.08439534, 0.1279954, 1.35503, 0, 0, 0, 1, 1,
0.09050385, 0.722118, -1.631434, 0, 0, 0, 1, 1,
0.09376219, 0.8766191, 1.464472, 0, 0, 0, 1, 1,
0.09637086, 1.016445, -1.925345, 0, 0, 0, 1, 1,
0.09671445, 0.7057781, 0.5237699, 0, 0, 0, 1, 1,
0.1011944, -1.198006, 3.395133, 0, 0, 0, 1, 1,
0.1017633, 1.250333, 0.5540602, 1, 1, 1, 1, 1,
0.102583, -1.071969, 4.254084, 1, 1, 1, 1, 1,
0.1062547, 3.096157, -1.04465, 1, 1, 1, 1, 1,
0.1071708, 1.131914, -0.3750016, 1, 1, 1, 1, 1,
0.1094177, -0.2212674, 1.199521, 1, 1, 1, 1, 1,
0.1101157, 0.4805664, -1.036486, 1, 1, 1, 1, 1,
0.1124973, 0.9594983, 1.248877, 1, 1, 1, 1, 1,
0.1140721, -1.169458, 2.194054, 1, 1, 1, 1, 1,
0.1188362, 0.6237014, 0.005636403, 1, 1, 1, 1, 1,
0.1206252, 1.18159, 1.529159, 1, 1, 1, 1, 1,
0.122007, 0.874077, 2.125389, 1, 1, 1, 1, 1,
0.1222912, -0.7318345, 3.835182, 1, 1, 1, 1, 1,
0.1247091, 1.185526, 2.313611, 1, 1, 1, 1, 1,
0.1288075, 0.8757851, -0.7096388, 1, 1, 1, 1, 1,
0.130594, -1.327324, 1.798022, 1, 1, 1, 1, 1,
0.1319021, -1.203914, 3.301056, 0, 0, 1, 1, 1,
0.1323304, -1.567898, 3.09597, 1, 0, 0, 1, 1,
0.1360496, 0.1386131, 0.9130677, 1, 0, 0, 1, 1,
0.1376569, 1.12865, 0.22554, 1, 0, 0, 1, 1,
0.1456238, 1.449849, 0.2836123, 1, 0, 0, 1, 1,
0.1470028, -1.109614, 2.444257, 1, 0, 0, 1, 1,
0.1488081, 1.569727, -1.211145, 0, 0, 0, 1, 1,
0.1595548, 0.2995787, -0.3899277, 0, 0, 0, 1, 1,
0.1653568, 0.08342792, 0.8825932, 0, 0, 0, 1, 1,
0.1660808, 0.1953955, -0.4642562, 0, 0, 0, 1, 1,
0.1709011, 1.490652, -0.7319804, 0, 0, 0, 1, 1,
0.1738685, -0.03461252, 2.176531, 0, 0, 0, 1, 1,
0.1757778, -0.6230484, 3.671332, 0, 0, 0, 1, 1,
0.1799216, -0.7023612, 2.765759, 1, 1, 1, 1, 1,
0.1802731, 0.05764472, 0.4237686, 1, 1, 1, 1, 1,
0.18145, 1.184815, -1.015845, 1, 1, 1, 1, 1,
0.1827105, 0.06543478, 1.008091, 1, 1, 1, 1, 1,
0.1834904, 0.8974206, 0.1913994, 1, 1, 1, 1, 1,
0.1837634, -1.921602, 3.0475, 1, 1, 1, 1, 1,
0.1921854, -0.02365486, 2.697378, 1, 1, 1, 1, 1,
0.1922341, -1.156149, 4.36324, 1, 1, 1, 1, 1,
0.1959939, -0.8334362, 2.369048, 1, 1, 1, 1, 1,
0.1970984, -0.3424587, 3.371253, 1, 1, 1, 1, 1,
0.2019145, 1.354091, 2.469669, 1, 1, 1, 1, 1,
0.2033094, 2.004134, 1.213393, 1, 1, 1, 1, 1,
0.2044188, 0.2993559, 0.8334189, 1, 1, 1, 1, 1,
0.2060279, 0.01529151, 2.59808, 1, 1, 1, 1, 1,
0.208272, 0.08983584, 1.93732, 1, 1, 1, 1, 1,
0.2150993, -0.5232929, 3.001826, 0, 0, 1, 1, 1,
0.2189875, 1.126385, -0.8546239, 1, 0, 0, 1, 1,
0.2208002, -0.2615088, 1.678477, 1, 0, 0, 1, 1,
0.2346802, 1.162223, -0.8975643, 1, 0, 0, 1, 1,
0.2352829, 1.482248, 1.032647, 1, 0, 0, 1, 1,
0.2353185, -0.5502707, 3.299161, 1, 0, 0, 1, 1,
0.2391342, -0.4321468, 2.276936, 0, 0, 0, 1, 1,
0.2425066, 0.1580438, 0.2916494, 0, 0, 0, 1, 1,
0.2453328, -0.6084872, 2.098295, 0, 0, 0, 1, 1,
0.2460872, 1.719223, -0.04333109, 0, 0, 0, 1, 1,
0.246131, 0.644555, -0.5052899, 0, 0, 0, 1, 1,
0.2464044, 0.4091886, -0.3432099, 0, 0, 0, 1, 1,
0.250691, -0.6659358, 2.702734, 0, 0, 0, 1, 1,
0.256744, -0.04137738, 2.988012, 1, 1, 1, 1, 1,
0.2575126, 0.7340147, 1.493737, 1, 1, 1, 1, 1,
0.2592274, 0.07577407, 0.2819737, 1, 1, 1, 1, 1,
0.2600962, -1.863206, 5.92232, 1, 1, 1, 1, 1,
0.2623526, 1.929255, -1.31734, 1, 1, 1, 1, 1,
0.2682988, -0.3197507, 3.202617, 1, 1, 1, 1, 1,
0.2685006, 0.7491626, 0.3220511, 1, 1, 1, 1, 1,
0.2752829, 0.442834, 0.6757829, 1, 1, 1, 1, 1,
0.2848459, -0.1780834, 3.152897, 1, 1, 1, 1, 1,
0.2865486, 0.470641, 1.494993, 1, 1, 1, 1, 1,
0.2889358, 1.15786, 0.769963, 1, 1, 1, 1, 1,
0.2992569, 1.324739, -0.4960375, 1, 1, 1, 1, 1,
0.3006801, 0.9917371, 0.06351342, 1, 1, 1, 1, 1,
0.301838, 0.7141297, 0.157757, 1, 1, 1, 1, 1,
0.303093, 1.564505, 1.465554, 1, 1, 1, 1, 1,
0.3038951, 0.5699512, 2.622691, 0, 0, 1, 1, 1,
0.3062697, 0.9898378, 0.8815309, 1, 0, 0, 1, 1,
0.3087644, -0.5422438, 2.934417, 1, 0, 0, 1, 1,
0.3118585, 0.1016663, 0.8783841, 1, 0, 0, 1, 1,
0.3129444, 0.8035003, 1.307656, 1, 0, 0, 1, 1,
0.3131236, 0.8903949, -0.3940129, 1, 0, 0, 1, 1,
0.3132263, -0.9133825, 0.5942121, 0, 0, 0, 1, 1,
0.3164914, 0.9400534, -0.4419002, 0, 0, 0, 1, 1,
0.3256234, 0.1812015, 0.9043514, 0, 0, 0, 1, 1,
0.3361872, -0.6459999, 2.467683, 0, 0, 0, 1, 1,
0.3373049, -0.2109451, 2.06846, 0, 0, 0, 1, 1,
0.3377021, 1.246655, 0.1991269, 0, 0, 0, 1, 1,
0.3392885, -0.3924757, 3.281028, 0, 0, 0, 1, 1,
0.3428152, 1.720377, 0.122306, 1, 1, 1, 1, 1,
0.3435432, 0.9198258, 1.587548, 1, 1, 1, 1, 1,
0.3462074, -0.5777383, 2.288317, 1, 1, 1, 1, 1,
0.3465892, -0.663266, 3.104897, 1, 1, 1, 1, 1,
0.3485554, 1.431312, 0.5966495, 1, 1, 1, 1, 1,
0.3525257, 0.980265, 1.863963, 1, 1, 1, 1, 1,
0.3537506, 1.267888, 2.599365, 1, 1, 1, 1, 1,
0.3540297, 1.248044, 0.8337529, 1, 1, 1, 1, 1,
0.3634107, -1.003728, 2.854175, 1, 1, 1, 1, 1,
0.3635865, 0.6304086, 1.573856, 1, 1, 1, 1, 1,
0.3661083, 0.9226599, 0.9319579, 1, 1, 1, 1, 1,
0.3668461, 0.9275842, 1.093002, 1, 1, 1, 1, 1,
0.376364, -1.383031, 3.053665, 1, 1, 1, 1, 1,
0.3764282, 0.03071485, 2.231136, 1, 1, 1, 1, 1,
0.3767911, -0.3479615, 2.01061, 1, 1, 1, 1, 1,
0.3791841, -0.5654528, 3.055221, 0, 0, 1, 1, 1,
0.3843239, 0.05184994, 2.502224, 1, 0, 0, 1, 1,
0.3867764, -1.197288, 3.051888, 1, 0, 0, 1, 1,
0.3879339, -0.244229, 1.976655, 1, 0, 0, 1, 1,
0.3896949, 0.9123637, 0.9189906, 1, 0, 0, 1, 1,
0.3972163, -0.4809306, 0.905075, 1, 0, 0, 1, 1,
0.3977323, -0.9945189, 3.335041, 0, 0, 0, 1, 1,
0.398175, -0.2081973, 1.434675, 0, 0, 0, 1, 1,
0.400519, 1.557527, -1.371614, 0, 0, 0, 1, 1,
0.4039126, 0.9321767, 0.2684154, 0, 0, 0, 1, 1,
0.4060422, 0.1291452, 1.598582, 0, 0, 0, 1, 1,
0.4097472, 0.334442, -0.1078253, 0, 0, 0, 1, 1,
0.4106956, -0.3628601, 1.430402, 0, 0, 0, 1, 1,
0.41125, 0.1792121, 2.530666, 1, 1, 1, 1, 1,
0.4113771, 0.2756197, 2.838207, 1, 1, 1, 1, 1,
0.4168879, -0.6910895, 3.557401, 1, 1, 1, 1, 1,
0.4171041, 0.2737979, 1.036042, 1, 1, 1, 1, 1,
0.4188091, 1.871828, -0.2950794, 1, 1, 1, 1, 1,
0.4215459, 1.475613, 0.4389512, 1, 1, 1, 1, 1,
0.4247948, 1.214278, -0.3274024, 1, 1, 1, 1, 1,
0.4315124, -1.179793, 3.355275, 1, 1, 1, 1, 1,
0.4385535, 1.445754, -0.1254922, 1, 1, 1, 1, 1,
0.4390561, -1.431719, 4.294352, 1, 1, 1, 1, 1,
0.4424261, 1.195005, -0.5421014, 1, 1, 1, 1, 1,
0.4558584, -0.810804, 1.865817, 1, 1, 1, 1, 1,
0.4559256, -0.5498819, 3.381358, 1, 1, 1, 1, 1,
0.4576005, -0.6633813, 2.726624, 1, 1, 1, 1, 1,
0.4621249, -2.826246, 2.594495, 1, 1, 1, 1, 1,
0.4691427, -0.1113915, 1.322407, 0, 0, 1, 1, 1,
0.4693874, -2.039078, 3.334243, 1, 0, 0, 1, 1,
0.470755, -0.1096266, 1.212424, 1, 0, 0, 1, 1,
0.4715588, -0.7417603, 3.30112, 1, 0, 0, 1, 1,
0.4738778, 0.6919255, 0.07760965, 1, 0, 0, 1, 1,
0.4797713, 0.8672169, 1.694619, 1, 0, 0, 1, 1,
0.4873984, 0.6728122, 0.7809966, 0, 0, 0, 1, 1,
0.4875654, 0.2445555, 0.3694434, 0, 0, 0, 1, 1,
0.4907165, -1.034209, 1.872344, 0, 0, 0, 1, 1,
0.4909286, -1.855072, 3.913738, 0, 0, 0, 1, 1,
0.492003, -0.6554004, 2.406922, 0, 0, 0, 1, 1,
0.495541, 0.9967107, -0.2020366, 0, 0, 0, 1, 1,
0.4985161, -1.043734, 3.40708, 0, 0, 0, 1, 1,
0.5032133, -0.3205359, 2.633544, 1, 1, 1, 1, 1,
0.5033069, 1.198772, -0.08019888, 1, 1, 1, 1, 1,
0.5080687, 0.06410839, 1.821937, 1, 1, 1, 1, 1,
0.5083737, 1.256114, 0.760818, 1, 1, 1, 1, 1,
0.514291, -0.9094241, 2.523662, 1, 1, 1, 1, 1,
0.524976, -1.85164, 1.922239, 1, 1, 1, 1, 1,
0.5255955, 2.203564, 0.5443145, 1, 1, 1, 1, 1,
0.5272023, -1.626691, 3.934171, 1, 1, 1, 1, 1,
0.5310853, 1.342912, 0.9536154, 1, 1, 1, 1, 1,
0.5314214, -0.2306631, 2.904252, 1, 1, 1, 1, 1,
0.5327052, 0.5784369, 1.890523, 1, 1, 1, 1, 1,
0.5330374, 1.186708, -1.774303, 1, 1, 1, 1, 1,
0.5410847, 0.7074825, 0.3344809, 1, 1, 1, 1, 1,
0.5426211, 0.1930323, 0.4425472, 1, 1, 1, 1, 1,
0.5426267, 2.37545, -1.200997, 1, 1, 1, 1, 1,
0.5428216, 1.177734, -0.06690875, 0, 0, 1, 1, 1,
0.5443305, -2.320973, 2.613775, 1, 0, 0, 1, 1,
0.5461537, 0.2985715, 2.159532, 1, 0, 0, 1, 1,
0.5477151, -1.115083, 3.114028, 1, 0, 0, 1, 1,
0.5487729, 0.3681089, 1.376601, 1, 0, 0, 1, 1,
0.5515701, 0.1602082, 1.409068, 1, 0, 0, 1, 1,
0.5551928, -0.4174924, 2.8851, 0, 0, 0, 1, 1,
0.5566022, 0.01090512, 0.06319743, 0, 0, 0, 1, 1,
0.5580922, -0.5940586, 0.212272, 0, 0, 0, 1, 1,
0.5614284, -2.13633, 3.38593, 0, 0, 0, 1, 1,
0.5638574, -1.555597, 3.070471, 0, 0, 0, 1, 1,
0.5646719, -0.6391674, 2.840826, 0, 0, 0, 1, 1,
0.5647334, 0.02570912, 2.009515, 0, 0, 0, 1, 1,
0.5660183, -1.52617, 2.092973, 1, 1, 1, 1, 1,
0.5676898, -0.4049224, -0.01343869, 1, 1, 1, 1, 1,
0.5736986, 1.192918, -0.2509846, 1, 1, 1, 1, 1,
0.5742238, 0.2392712, 2.54248, 1, 1, 1, 1, 1,
0.5756296, -1.235219, 3.763289, 1, 1, 1, 1, 1,
0.5810939, -0.4522245, 1.655389, 1, 1, 1, 1, 1,
0.5861822, 0.4566289, 0.2861286, 1, 1, 1, 1, 1,
0.5865211, -0.01602728, -0.1547231, 1, 1, 1, 1, 1,
0.5907561, -0.34964, 2.815334, 1, 1, 1, 1, 1,
0.5913115, -0.2510203, 1.730598, 1, 1, 1, 1, 1,
0.5922567, -0.5802745, 2.03415, 1, 1, 1, 1, 1,
0.5941291, -0.2238736, 1.203763, 1, 1, 1, 1, 1,
0.5954435, -1.815074, 2.645168, 1, 1, 1, 1, 1,
0.6005431, 0.05294244, 1.041019, 1, 1, 1, 1, 1,
0.600634, -0.2548104, 1.687659, 1, 1, 1, 1, 1,
0.6077017, 0.1274622, -0.1200286, 0, 0, 1, 1, 1,
0.6177951, 0.4998158, 0.8634197, 1, 0, 0, 1, 1,
0.6184917, 0.7769521, 0.8663357, 1, 0, 0, 1, 1,
0.6193544, 0.146615, 1.033947, 1, 0, 0, 1, 1,
0.620287, 0.01675433, 1.540237, 1, 0, 0, 1, 1,
0.6244645, -0.4583387, 2.127254, 1, 0, 0, 1, 1,
0.6250106, 1.322751, 0.1778572, 0, 0, 0, 1, 1,
0.6268885, -1.333622, 1.436968, 0, 0, 0, 1, 1,
0.6270226, 0.3654599, 1.151962, 0, 0, 0, 1, 1,
0.6328264, 0.3492473, 1.052058, 0, 0, 0, 1, 1,
0.634399, -0.1410054, 0.1797631, 0, 0, 0, 1, 1,
0.6361887, -0.8452173, 2.543301, 0, 0, 0, 1, 1,
0.6366696, 1.046914, 0.2716651, 0, 0, 0, 1, 1,
0.6379685, -0.7954212, 3.299654, 1, 1, 1, 1, 1,
0.639595, 0.9875919, -0.5649884, 1, 1, 1, 1, 1,
0.6458508, 0.6990919, 0.003715936, 1, 1, 1, 1, 1,
0.6462079, -0.3986394, 1.078207, 1, 1, 1, 1, 1,
0.6466526, 0.2670229, 2.086363, 1, 1, 1, 1, 1,
0.6514221, 0.623446, 0.9333966, 1, 1, 1, 1, 1,
0.6525066, 0.2591428, 1.318895, 1, 1, 1, 1, 1,
0.6564789, 0.0900974, 2.285478, 1, 1, 1, 1, 1,
0.6632327, 0.6910842, -1.340696, 1, 1, 1, 1, 1,
0.6641803, 1.16378, 1.612138, 1, 1, 1, 1, 1,
0.6668766, 1.469784, -1.203679, 1, 1, 1, 1, 1,
0.6688598, 0.1141441, 2.532333, 1, 1, 1, 1, 1,
0.6735829, -0.5826432, 1.623117, 1, 1, 1, 1, 1,
0.6739809, 1.026066, 1.303215, 1, 1, 1, 1, 1,
0.6751947, 2.029588, 0.901682, 1, 1, 1, 1, 1,
0.676898, -1.112137, 3.592456, 0, 0, 1, 1, 1,
0.6816036, 0.0388186, 3.721119, 1, 0, 0, 1, 1,
0.6823344, -1.810033, 2.602935, 1, 0, 0, 1, 1,
0.682807, -1.018768, 2.444568, 1, 0, 0, 1, 1,
0.684459, 0.9275148, -0.812248, 1, 0, 0, 1, 1,
0.6865172, -0.5872516, 3.424802, 1, 0, 0, 1, 1,
0.6885207, -1.922167, 2.592887, 0, 0, 0, 1, 1,
0.6968354, -0.7781775, 1.887101, 0, 0, 0, 1, 1,
0.698575, -1.504765, 2.231895, 0, 0, 0, 1, 1,
0.7036862, -0.1925908, -0.6149642, 0, 0, 0, 1, 1,
0.7052225, -1.420114, 4.376878, 0, 0, 0, 1, 1,
0.7055289, 1.424943, 0.6589907, 0, 0, 0, 1, 1,
0.711068, -0.7517767, 4.411936, 0, 0, 0, 1, 1,
0.7163571, 1.920574, -0.6041182, 1, 1, 1, 1, 1,
0.7182896, 0.1176593, 1.500221, 1, 1, 1, 1, 1,
0.7253073, -1.457517, 3.263561, 1, 1, 1, 1, 1,
0.7266884, -0.1247742, 1.788439, 1, 1, 1, 1, 1,
0.7273504, 0.08645849, 2.078752, 1, 1, 1, 1, 1,
0.7316132, -0.405901, 3.848757, 1, 1, 1, 1, 1,
0.7329491, -1.276272, 2.94769, 1, 1, 1, 1, 1,
0.7333468, -0.6456597, 2.908524, 1, 1, 1, 1, 1,
0.734138, 0.1251952, 1.399081, 1, 1, 1, 1, 1,
0.7361846, -0.09711963, 1.70674, 1, 1, 1, 1, 1,
0.7451465, -0.1567659, 2.616581, 1, 1, 1, 1, 1,
0.745531, -0.08430054, 1.671046, 1, 1, 1, 1, 1,
0.7649657, -0.07330999, 1.33846, 1, 1, 1, 1, 1,
0.7707598, 0.9082712, 0.3224092, 1, 1, 1, 1, 1,
0.7744671, -0.6398454, 1.158026, 1, 1, 1, 1, 1,
0.776784, 0.0460185, 2.892113, 0, 0, 1, 1, 1,
0.782626, -0.03752374, 1.234017, 1, 0, 0, 1, 1,
0.782869, 0.3149822, 1.693526, 1, 0, 0, 1, 1,
0.7829859, 1.430261, 0.02344144, 1, 0, 0, 1, 1,
0.7948259, -1.007126, 3.249099, 1, 0, 0, 1, 1,
0.7953501, 2.863453, 0.1219244, 1, 0, 0, 1, 1,
0.8024489, 0.3295198, -0.07041664, 0, 0, 0, 1, 1,
0.8025896, -0.9558485, 1.777694, 0, 0, 0, 1, 1,
0.8026809, 1.977509, 1.410137, 0, 0, 0, 1, 1,
0.8112878, -0.1270956, 2.332999, 0, 0, 0, 1, 1,
0.8126622, 0.04701975, 3.194653, 0, 0, 0, 1, 1,
0.8144491, -0.4480094, 1.393421, 0, 0, 0, 1, 1,
0.8158639, 0.6087272, 1.179574, 0, 0, 0, 1, 1,
0.8180098, -0.661241, 1.117795, 1, 1, 1, 1, 1,
0.8234685, 0.09692895, 1.056454, 1, 1, 1, 1, 1,
0.8250906, -0.8267884, 1.834344, 1, 1, 1, 1, 1,
0.8256129, -0.9738463, 3.380063, 1, 1, 1, 1, 1,
0.8258379, -0.2677643, 1.914694, 1, 1, 1, 1, 1,
0.8260791, -1.513188, 2.279199, 1, 1, 1, 1, 1,
0.8295882, -0.02497171, 0.950459, 1, 1, 1, 1, 1,
0.8331549, -1.876008, 4.179326, 1, 1, 1, 1, 1,
0.8338463, -1.86796, 2.753601, 1, 1, 1, 1, 1,
0.8362511, -0.113958, 2.545657, 1, 1, 1, 1, 1,
0.8383442, -0.02155114, -0.255672, 1, 1, 1, 1, 1,
0.8537889, -0.7911881, 1.659733, 1, 1, 1, 1, 1,
0.8550881, -0.2168006, 1.900019, 1, 1, 1, 1, 1,
0.8562029, -0.1171962, 2.557331, 1, 1, 1, 1, 1,
0.8595396, -0.2772962, 2.494889, 1, 1, 1, 1, 1,
0.8607907, 0.1485277, 1.178416, 0, 0, 1, 1, 1,
0.8648877, -1.285074, 3.015913, 1, 0, 0, 1, 1,
0.867353, 0.3161882, 1.930784, 1, 0, 0, 1, 1,
0.8780566, -0.7991459, 2.528833, 1, 0, 0, 1, 1,
0.8785027, 1.33264, 2.14327, 1, 0, 0, 1, 1,
0.8811772, 0.2178597, 2.302544, 1, 0, 0, 1, 1,
0.8848588, -0.7438418, 0.9935912, 0, 0, 0, 1, 1,
0.886283, 0.1059546, 3.206573, 0, 0, 0, 1, 1,
0.8877932, 1.318767, 1.719239, 0, 0, 0, 1, 1,
0.9026946, -0.5409982, 0.6337148, 0, 0, 0, 1, 1,
0.9034353, 0.4070126, 2.888506, 0, 0, 0, 1, 1,
0.9095386, 1.533891, 0.1390001, 0, 0, 0, 1, 1,
0.9142303, 0.1718794, 0.8816474, 0, 0, 0, 1, 1,
0.9161632, -0.2046571, 3.096387, 1, 1, 1, 1, 1,
0.921854, -0.1017514, -0.7551776, 1, 1, 1, 1, 1,
0.9249058, -1.340348, 3.796085, 1, 1, 1, 1, 1,
0.9326732, -0.139866, -0.3030917, 1, 1, 1, 1, 1,
0.9373553, 1.54283, 1.243787, 1, 1, 1, 1, 1,
0.9401905, -0.3207287, 2.714897, 1, 1, 1, 1, 1,
0.9450044, -0.8283334, 1.620262, 1, 1, 1, 1, 1,
0.9541268, 0.3203298, 1.399915, 1, 1, 1, 1, 1,
0.9565986, 0.3396014, 1.724076, 1, 1, 1, 1, 1,
0.9583372, -0.7711058, 4.383781, 1, 1, 1, 1, 1,
0.9592987, 0.2834576, 1.714403, 1, 1, 1, 1, 1,
0.9601769, 1.872388, 0.2747054, 1, 1, 1, 1, 1,
0.9704029, -1.458098, 3.944127, 1, 1, 1, 1, 1,
0.9709811, 0.7192203, 1.333813, 1, 1, 1, 1, 1,
0.9808485, -0.3064277, 2.317202, 1, 1, 1, 1, 1,
0.9820867, -1.182155, 2.337782, 0, 0, 1, 1, 1,
0.9840024, 0.2933095, 2.12506, 1, 0, 0, 1, 1,
0.9843143, -1.437028, 1.496182, 1, 0, 0, 1, 1,
0.9889693, -0.8613419, 1.76095, 1, 0, 0, 1, 1,
0.9933088, -1.009168, 1.286427, 1, 0, 0, 1, 1,
1.006338, -1.137753, 2.005535, 1, 0, 0, 1, 1,
1.007619, 0.4032374, 0.4249398, 0, 0, 0, 1, 1,
1.008836, -0.06301933, 2.18572, 0, 0, 0, 1, 1,
1.009298, 1.510237, 1.662869, 0, 0, 0, 1, 1,
1.019076, -0.241947, 2.838215, 0, 0, 0, 1, 1,
1.019775, 1.655146, 0.6902658, 0, 0, 0, 1, 1,
1.021393, -0.4994364, 3.217816, 0, 0, 0, 1, 1,
1.024354, 0.003713282, 2.047831, 0, 0, 0, 1, 1,
1.02625, -1.016027, 3.377043, 1, 1, 1, 1, 1,
1.026405, 0.4318499, 2.887054, 1, 1, 1, 1, 1,
1.029603, 0.0146697, 1.626729, 1, 1, 1, 1, 1,
1.029908, -3.207289, 1.728384, 1, 1, 1, 1, 1,
1.031657, -1.178089, 0.4227053, 1, 1, 1, 1, 1,
1.035472, 0.6137959, 1.087717, 1, 1, 1, 1, 1,
1.035912, -1.179262, 2.423506, 1, 1, 1, 1, 1,
1.039864, 0.5510478, 0.6402014, 1, 1, 1, 1, 1,
1.049644, -0.3341, 0.5905824, 1, 1, 1, 1, 1,
1.052491, 1.06102, 0.7050928, 1, 1, 1, 1, 1,
1.055751, 1.462961, 3.807557, 1, 1, 1, 1, 1,
1.057247, 0.5397533, 1.02744, 1, 1, 1, 1, 1,
1.06018, 1.643322, 2.634173, 1, 1, 1, 1, 1,
1.062026, -0.7271158, 2.359841, 1, 1, 1, 1, 1,
1.075814, -2.097137, 3.545825, 1, 1, 1, 1, 1,
1.075822, 0.4311757, 1.250366, 0, 0, 1, 1, 1,
1.076078, -1.23449, 3.308363, 1, 0, 0, 1, 1,
1.078127, -0.06942152, 1.853937, 1, 0, 0, 1, 1,
1.0802, -1.498195, 2.318748, 1, 0, 0, 1, 1,
1.085312, 0.2155199, 1.163894, 1, 0, 0, 1, 1,
1.099826, -1.210027, 4.745036, 1, 0, 0, 1, 1,
1.102333, 1.651035, 0.2018501, 0, 0, 0, 1, 1,
1.106271, 0.5013607, -0.4990053, 0, 0, 0, 1, 1,
1.114631, -1.210793, 3.20437, 0, 0, 0, 1, 1,
1.120188, -0.7878793, 0.4133995, 0, 0, 0, 1, 1,
1.120785, -1.194789, 0.7778502, 0, 0, 0, 1, 1,
1.12325, -0.07303607, 2.199788, 0, 0, 0, 1, 1,
1.136206, 0.3978544, 1.414359, 0, 0, 0, 1, 1,
1.138584, -0.5810219, 2.16418, 1, 1, 1, 1, 1,
1.161259, 0.2109388, 0.8640003, 1, 1, 1, 1, 1,
1.16809, -0.31319, 1.750976, 1, 1, 1, 1, 1,
1.169769, 0.0445531, 0.646181, 1, 1, 1, 1, 1,
1.170349, 0.6363306, 0.4181337, 1, 1, 1, 1, 1,
1.171145, 0.08691285, 1.740504, 1, 1, 1, 1, 1,
1.175587, 0.2491116, 2.154422, 1, 1, 1, 1, 1,
1.176142, -0.7200805, 2.349403, 1, 1, 1, 1, 1,
1.194335, -0.8660869, 2.258872, 1, 1, 1, 1, 1,
1.200254, 0.6936979, 1.587912, 1, 1, 1, 1, 1,
1.203618, 0.8047097, 1.42588, 1, 1, 1, 1, 1,
1.207181, 1.011215, 3.070723, 1, 1, 1, 1, 1,
1.211145, 2.104319, 0.319315, 1, 1, 1, 1, 1,
1.213951, 0.8961973, -0.6419753, 1, 1, 1, 1, 1,
1.214894, -2.867279, 1.658092, 1, 1, 1, 1, 1,
1.216269, 0.8860096, 0.7089675, 0, 0, 1, 1, 1,
1.21772, -1.767403, 2.843416, 1, 0, 0, 1, 1,
1.223768, 0.7146865, 0.1018053, 1, 0, 0, 1, 1,
1.229449, 0.2157408, 1.013819, 1, 0, 0, 1, 1,
1.238696, 0.6414569, -0.09471711, 1, 0, 0, 1, 1,
1.247755, 2.039336, 1.158944, 1, 0, 0, 1, 1,
1.259355, -0.9074975, 2.271494, 0, 0, 0, 1, 1,
1.260144, 1.387321, -0.827283, 0, 0, 0, 1, 1,
1.262453, 0.2450621, 0.09953412, 0, 0, 0, 1, 1,
1.264778, 0.7796655, 0.631983, 0, 0, 0, 1, 1,
1.264971, 0.5478877, 2.059474, 0, 0, 0, 1, 1,
1.275004, -0.1599561, 0.4038563, 0, 0, 0, 1, 1,
1.281828, -0.003036032, 1.117399, 0, 0, 0, 1, 1,
1.290992, 0.04123095, 2.093331, 1, 1, 1, 1, 1,
1.304429, -0.1576367, 1.501642, 1, 1, 1, 1, 1,
1.33371, -0.9113958, 4.187042, 1, 1, 1, 1, 1,
1.345681, -0.5617024, 2.638782, 1, 1, 1, 1, 1,
1.367187, 1.531957, 0.1884434, 1, 1, 1, 1, 1,
1.370216, -0.01975325, 2.179237, 1, 1, 1, 1, 1,
1.404904, 0.05050512, 1.124331, 1, 1, 1, 1, 1,
1.407165, 1.979007, 1.154561, 1, 1, 1, 1, 1,
1.40739, -0.5495135, 2.312304, 1, 1, 1, 1, 1,
1.411088, -0.009110934, 2.196543, 1, 1, 1, 1, 1,
1.419558, 0.9861406, 0.8564557, 1, 1, 1, 1, 1,
1.423256, 1.425802, -0.3245037, 1, 1, 1, 1, 1,
1.444985, -0.699865, 2.825659, 1, 1, 1, 1, 1,
1.44623, 0.3633589, 0.3028792, 1, 1, 1, 1, 1,
1.449638, 0.7423139, -0.1744025, 1, 1, 1, 1, 1,
1.464334, 0.5436869, 1.218452, 0, 0, 1, 1, 1,
1.472096, -0.4622907, 0.9139687, 1, 0, 0, 1, 1,
1.478745, -1.109587, 1.469191, 1, 0, 0, 1, 1,
1.487472, 0.1291188, 3.268412, 1, 0, 0, 1, 1,
1.502491, -0.757578, 2.939833, 1, 0, 0, 1, 1,
1.504303, -0.569657, 2.657218, 1, 0, 0, 1, 1,
1.504423, -0.1959089, 2.202498, 0, 0, 0, 1, 1,
1.51169, -0.1781263, 0.08499351, 0, 0, 0, 1, 1,
1.528545, 1.520891, 1.736483, 0, 0, 0, 1, 1,
1.534336, -0.9959166, 2.738334, 0, 0, 0, 1, 1,
1.53802, -0.6917749, -0.01052555, 0, 0, 0, 1, 1,
1.541443, -0.5090824, 1.425532, 0, 0, 0, 1, 1,
1.544836, -0.7089666, 2.770425, 0, 0, 0, 1, 1,
1.545067, 1.802886, 0.2447549, 1, 1, 1, 1, 1,
1.558273, -0.0880186, 2.888614, 1, 1, 1, 1, 1,
1.563202, -0.8983724, 3.192004, 1, 1, 1, 1, 1,
1.566964, -1.17269, 2.37597, 1, 1, 1, 1, 1,
1.584596, 0.9519792, 1.624543, 1, 1, 1, 1, 1,
1.588815, 0.7367869, 0.813264, 1, 1, 1, 1, 1,
1.589521, 0.2738593, 2.066535, 1, 1, 1, 1, 1,
1.591792, -0.9602793, 1.105639, 1, 1, 1, 1, 1,
1.594894, 0.2269426, 0.4130676, 1, 1, 1, 1, 1,
1.603964, 0.8487431, 2.094856, 1, 1, 1, 1, 1,
1.627277, -1.605559, 3.764466, 1, 1, 1, 1, 1,
1.650399, 1.173851, 0.3783503, 1, 1, 1, 1, 1,
1.650476, -0.9554301, 2.511551, 1, 1, 1, 1, 1,
1.653118, -0.3119889, 0.426176, 1, 1, 1, 1, 1,
1.656678, 0.1851081, 3.551672, 1, 1, 1, 1, 1,
1.659062, 0.9943568, 0.1317118, 0, 0, 1, 1, 1,
1.677912, 1.569023, 0.9149826, 1, 0, 0, 1, 1,
1.686671, 0.08745636, 2.364501, 1, 0, 0, 1, 1,
1.705832, -0.34804, 3.311042, 1, 0, 0, 1, 1,
1.72539, 0.400487, 0.06875735, 1, 0, 0, 1, 1,
1.75421, -1.434989, 2.072501, 1, 0, 0, 1, 1,
1.776293, 0.9421048, 2.006482, 0, 0, 0, 1, 1,
1.783275, 0.3929259, 1.047304, 0, 0, 0, 1, 1,
1.793504, 1.332885, 1.651318, 0, 0, 0, 1, 1,
1.799276, -1.751849, 2.19987, 0, 0, 0, 1, 1,
1.804551, 1.435423, 1.108835, 0, 0, 0, 1, 1,
1.813904, 0.1135073, 0.3129279, 0, 0, 0, 1, 1,
1.813909, -0.4928281, 1.916093, 0, 0, 0, 1, 1,
1.835889, -2.09342, 2.499739, 1, 1, 1, 1, 1,
1.842156, -0.5826825, 1.198556, 1, 1, 1, 1, 1,
1.843605, 1.256744, 0.5628911, 1, 1, 1, 1, 1,
1.85181, 0.04141921, 0.6703477, 1, 1, 1, 1, 1,
1.876091, 0.2603431, -1.093392, 1, 1, 1, 1, 1,
1.890101, 1.934504, 0.8184281, 1, 1, 1, 1, 1,
1.932803, -0.6339112, 1.764258, 1, 1, 1, 1, 1,
1.940322, 1.009023, 2.356585, 1, 1, 1, 1, 1,
1.957125, 0.2103125, -0.8524123, 1, 1, 1, 1, 1,
2.035962, 0.6090389, 1.098925, 1, 1, 1, 1, 1,
2.081546, -0.360603, -0.5148643, 1, 1, 1, 1, 1,
2.08398, -1.197037, 1.526569, 1, 1, 1, 1, 1,
2.131113, -0.2844185, 0.473628, 1, 1, 1, 1, 1,
2.17129, 1.797264, 1.516235, 1, 1, 1, 1, 1,
2.17687, 0.424953, 2.121368, 1, 1, 1, 1, 1,
2.194709, -0.1244272, 2.944582, 0, 0, 1, 1, 1,
2.214647, 2.214229, -1.573758, 1, 0, 0, 1, 1,
2.216924, 0.5216296, 2.28648, 1, 0, 0, 1, 1,
2.220641, 0.4508666, 2.302532, 1, 0, 0, 1, 1,
2.27336, 0.4695578, 1.905295, 1, 0, 0, 1, 1,
2.276768, -0.4786992, 2.969749, 1, 0, 0, 1, 1,
2.318291, -0.5736766, 0.8958906, 0, 0, 0, 1, 1,
2.342158, 0.8352787, 1.399139, 0, 0, 0, 1, 1,
2.371152, -1.426806, 0.9452336, 0, 0, 0, 1, 1,
2.371525, -0.4861821, 2.221401, 0, 0, 0, 1, 1,
2.377058, -0.9605839, 2.450026, 0, 0, 0, 1, 1,
2.413528, -0.3998356, 0.9031228, 0, 0, 0, 1, 1,
2.455796, -1.630122, 1.705834, 0, 0, 0, 1, 1,
2.500981, 0.1179403, 1.936563, 1, 1, 1, 1, 1,
2.705993, -0.1751456, 1.831289, 1, 1, 1, 1, 1,
2.765799, 0.252175, -0.2699869, 1, 1, 1, 1, 1,
2.917411, 0.4510468, 1.296207, 1, 1, 1, 1, 1,
2.975584, 0.7594694, 1.324911, 1, 1, 1, 1, 1,
2.980197, -0.7304504, -0.361083, 1, 1, 1, 1, 1,
3.03188, 1.815208, 0.3531081, 1, 1, 1, 1, 1
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
var radius = 9.911114;
var distance = 34.81237;
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
mvMatrix.translate( 0.122344, -0.004254341, -0.1261969 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.81237);
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
