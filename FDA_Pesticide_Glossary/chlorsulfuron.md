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
-2.748187, -1.758354, -3.688215, 1, 0, 0, 1,
-2.631933, -0.1353012, 0.02893369, 1, 0.007843138, 0, 1,
-2.50857, -0.2425931, -1.481883, 1, 0.01176471, 0, 1,
-2.48342, 0.2650509, -0.7688619, 1, 0.01960784, 0, 1,
-2.465588, -0.1678682, -1.640626, 1, 0.02352941, 0, 1,
-2.450714, 0.9102567, -1.565426, 1, 0.03137255, 0, 1,
-2.432066, 1.419074, -0.4672073, 1, 0.03529412, 0, 1,
-2.424816, -1.127298, -4.154606, 1, 0.04313726, 0, 1,
-2.414962, -0.8444791, -1.908675, 1, 0.04705882, 0, 1,
-2.405032, -1.128656, -1.421082, 1, 0.05490196, 0, 1,
-2.390611, 0.5245914, -2.428981, 1, 0.05882353, 0, 1,
-2.38418, 0.8213832, -0.5326486, 1, 0.06666667, 0, 1,
-2.344043, -0.6139478, -1.071137, 1, 0.07058824, 0, 1,
-2.297958, -0.3813731, -1.655374, 1, 0.07843138, 0, 1,
-2.257994, 0.005094218, -1.700078, 1, 0.08235294, 0, 1,
-2.24283, -0.6306624, -1.676875, 1, 0.09019608, 0, 1,
-2.124081, 1.566373, 1.032443, 1, 0.09411765, 0, 1,
-2.107701, -0.1545192, -3.181305, 1, 0.1019608, 0, 1,
-2.050605, 0.02128702, -2.419365, 1, 0.1098039, 0, 1,
-2.042268, 0.5088558, -1.099215, 1, 0.1137255, 0, 1,
-2.0007, 0.08258227, -3.602702, 1, 0.1215686, 0, 1,
-1.988419, 1.596872, -1.030676, 1, 0.1254902, 0, 1,
-1.956867, -0.04390623, -2.358239, 1, 0.1333333, 0, 1,
-1.88479, 1.214584, -0.1854886, 1, 0.1372549, 0, 1,
-1.875278, -1.123159, -0.9300616, 1, 0.145098, 0, 1,
-1.871186, 1.046197, -0.8464991, 1, 0.1490196, 0, 1,
-1.863215, -1.920064, -2.152572, 1, 0.1568628, 0, 1,
-1.821629, 0.9921328, -2.697631, 1, 0.1607843, 0, 1,
-1.819894, 1.644541, -1.944091, 1, 0.1686275, 0, 1,
-1.807844, 0.7564492, -2.043535, 1, 0.172549, 0, 1,
-1.800363, -0.9240587, -3.890131, 1, 0.1803922, 0, 1,
-1.794683, -1.030721, -1.908488, 1, 0.1843137, 0, 1,
-1.759839, -0.1188087, -2.539752, 1, 0.1921569, 0, 1,
-1.757746, 0.05041374, -1.680284, 1, 0.1960784, 0, 1,
-1.752624, -0.5306976, -1.311512, 1, 0.2039216, 0, 1,
-1.730185, -0.7631711, -2.825359, 1, 0.2117647, 0, 1,
-1.725709, 2.711859, -2.026478, 1, 0.2156863, 0, 1,
-1.718467, 0.5708272, -1.197191, 1, 0.2235294, 0, 1,
-1.704045, 0.2607706, -0.3282225, 1, 0.227451, 0, 1,
-1.697429, -0.792827, -1.042351, 1, 0.2352941, 0, 1,
-1.694486, 0.9528069, -0.8661073, 1, 0.2392157, 0, 1,
-1.679553, 1.102344, -0.9114316, 1, 0.2470588, 0, 1,
-1.676082, 0.1894097, -2.979705, 1, 0.2509804, 0, 1,
-1.657659, 1.185112, 0.1997868, 1, 0.2588235, 0, 1,
-1.638336, 1.688636, -1.893465, 1, 0.2627451, 0, 1,
-1.634547, 0.1599302, -3.199287, 1, 0.2705882, 0, 1,
-1.628375, -0.3962873, -0.5054029, 1, 0.2745098, 0, 1,
-1.617942, -0.8356456, -2.352912, 1, 0.282353, 0, 1,
-1.616054, -0.03909732, -1.928772, 1, 0.2862745, 0, 1,
-1.601455, -0.09504288, -1.984098, 1, 0.2941177, 0, 1,
-1.588052, 1.014091, -1.109601, 1, 0.3019608, 0, 1,
-1.576209, 0.912287, -1.107505, 1, 0.3058824, 0, 1,
-1.571877, 0.1139734, -0.6443946, 1, 0.3137255, 0, 1,
-1.565347, 0.7896272, -0.05943677, 1, 0.3176471, 0, 1,
-1.547, 1.597329, -2.468352, 1, 0.3254902, 0, 1,
-1.544183, 0.4456055, -2.742384, 1, 0.3294118, 0, 1,
-1.538958, -0.4779794, -0.8792664, 1, 0.3372549, 0, 1,
-1.530476, -1.713233, -1.83152, 1, 0.3411765, 0, 1,
-1.501759, 0.01571394, -2.658895, 1, 0.3490196, 0, 1,
-1.494941, -0.5999552, -1.613898, 1, 0.3529412, 0, 1,
-1.48821, 0.3405228, -1.243764, 1, 0.3607843, 0, 1,
-1.472575, -0.2257809, -1.722812, 1, 0.3647059, 0, 1,
-1.46395, 1.701155, 0.1330799, 1, 0.372549, 0, 1,
-1.462741, 1.38045, -0.2679521, 1, 0.3764706, 0, 1,
-1.453137, 1.805104, -1.206344, 1, 0.3843137, 0, 1,
-1.43725, 0.959802, -1.421628, 1, 0.3882353, 0, 1,
-1.428703, 0.4178278, -2.481261, 1, 0.3960784, 0, 1,
-1.426311, -0.8729138, -3.114433, 1, 0.4039216, 0, 1,
-1.410707, 0.67277, -0.9538465, 1, 0.4078431, 0, 1,
-1.406191, 0.8801742, -1.557346, 1, 0.4156863, 0, 1,
-1.403457, -0.9533393, -0.4500726, 1, 0.4196078, 0, 1,
-1.397278, 0.9160679, -1.810388, 1, 0.427451, 0, 1,
-1.390497, 0.09250426, -0.4553336, 1, 0.4313726, 0, 1,
-1.389259, -1.701226, -2.31674, 1, 0.4392157, 0, 1,
-1.37841, -0.5180346, -2.483569, 1, 0.4431373, 0, 1,
-1.372586, -0.3880076, -1.417818, 1, 0.4509804, 0, 1,
-1.35963, 3.059482, -0.3291505, 1, 0.454902, 0, 1,
-1.35821, 0.4341106, -2.053299, 1, 0.4627451, 0, 1,
-1.353738, 0.7399205, -0.2528592, 1, 0.4666667, 0, 1,
-1.353405, 0.5847201, -2.102509, 1, 0.4745098, 0, 1,
-1.353299, -0.2317712, -2.773599, 1, 0.4784314, 0, 1,
-1.34655, -0.9217882, -5.570339, 1, 0.4862745, 0, 1,
-1.335377, -2.02902, -2.065272, 1, 0.4901961, 0, 1,
-1.329594, 0.5057886, -2.157101, 1, 0.4980392, 0, 1,
-1.31827, 0.1309773, -0.4522134, 1, 0.5058824, 0, 1,
-1.311985, 0.008593843, -0.9313409, 1, 0.509804, 0, 1,
-1.309336, 1.450353, -0.3551175, 1, 0.5176471, 0, 1,
-1.297787, -0.006821855, -0.5245146, 1, 0.5215687, 0, 1,
-1.295589, -0.8367869, -1.152023, 1, 0.5294118, 0, 1,
-1.293665, 0.3599347, -2.227267, 1, 0.5333334, 0, 1,
-1.289943, -0.6391932, 0.1087625, 1, 0.5411765, 0, 1,
-1.270173, 1.506346, 0.1141954, 1, 0.5450981, 0, 1,
-1.26707, 0.5646519, -1.031219, 1, 0.5529412, 0, 1,
-1.252877, 1.047231, -1.715387, 1, 0.5568628, 0, 1,
-1.240422, 0.1264767, -2.364823, 1, 0.5647059, 0, 1,
-1.240257, -0.3887814, -2.849253, 1, 0.5686275, 0, 1,
-1.233436, 0.7014546, -1.044185, 1, 0.5764706, 0, 1,
-1.226581, -0.3238559, -3.513988, 1, 0.5803922, 0, 1,
-1.218385, 1.495806, -0.2561782, 1, 0.5882353, 0, 1,
-1.212465, 0.8176441, -0.8867605, 1, 0.5921569, 0, 1,
-1.200554, -0.01567322, -0.4996781, 1, 0.6, 0, 1,
-1.198843, 0.5867243, -2.006307, 1, 0.6078432, 0, 1,
-1.192222, -1.176156, -2.044071, 1, 0.6117647, 0, 1,
-1.182775, 0.1147917, -1.630851, 1, 0.6196079, 0, 1,
-1.182494, -0.546231, -1.674653, 1, 0.6235294, 0, 1,
-1.179971, -1.355014, -2.738971, 1, 0.6313726, 0, 1,
-1.168341, -0.0804346, -2.908803, 1, 0.6352941, 0, 1,
-1.164002, -0.8049098, -1.884578, 1, 0.6431373, 0, 1,
-1.161934, -1.555158, -0.8564445, 1, 0.6470588, 0, 1,
-1.159792, 0.0773357, -0.8645169, 1, 0.654902, 0, 1,
-1.156737, -0.03728509, -1.75454, 1, 0.6588235, 0, 1,
-1.145461, 0.05394838, 0.9298037, 1, 0.6666667, 0, 1,
-1.140995, 1.108315, -2.72516, 1, 0.6705883, 0, 1,
-1.14088, -1.289333, -2.952036, 1, 0.6784314, 0, 1,
-1.132033, 2.067052, -1.63888, 1, 0.682353, 0, 1,
-1.130871, -0.05021079, -0.1158154, 1, 0.6901961, 0, 1,
-1.1236, 0.04261051, -0.7429978, 1, 0.6941177, 0, 1,
-1.121557, -1.646245, -3.187873, 1, 0.7019608, 0, 1,
-1.120357, 0.2244105, 0.07866166, 1, 0.7098039, 0, 1,
-1.103717, -1.596924, -1.241394, 1, 0.7137255, 0, 1,
-1.094513, -1.812213, -3.588617, 1, 0.7215686, 0, 1,
-1.093059, -0.9731612, -1.16619, 1, 0.7254902, 0, 1,
-1.083294, -1.302196, -2.36638, 1, 0.7333333, 0, 1,
-1.081431, -0.2349413, -1.101669, 1, 0.7372549, 0, 1,
-1.056705, 0.0892784, -0.5648257, 1, 0.7450981, 0, 1,
-1.049209, 0.4238205, -0.6216273, 1, 0.7490196, 0, 1,
-1.047636, -2.497035, -3.749458, 1, 0.7568628, 0, 1,
-1.045544, 0.2621312, -1.653613, 1, 0.7607843, 0, 1,
-1.045349, -1.783189, -1.240106, 1, 0.7686275, 0, 1,
-1.037697, -0.3735386, -1.199337, 1, 0.772549, 0, 1,
-1.03619, 1.296962, -0.5447215, 1, 0.7803922, 0, 1,
-1.034111, 0.07728815, -1.471667, 1, 0.7843137, 0, 1,
-1.033297, -2.77238e-05, -0.01325568, 1, 0.7921569, 0, 1,
-1.028432, 1.138401, 1.178869, 1, 0.7960784, 0, 1,
-1.024946, -0.8626367, -1.045143, 1, 0.8039216, 0, 1,
-1.023875, 0.08841918, -1.168322, 1, 0.8117647, 0, 1,
-1.020184, -0.003709022, -1.824371, 1, 0.8156863, 0, 1,
-1.014583, 0.3118254, -0.2154372, 1, 0.8235294, 0, 1,
-1.009681, -0.696043, -2.387039, 1, 0.827451, 0, 1,
-0.9983891, -0.2639026, -1.16526, 1, 0.8352941, 0, 1,
-0.9929806, 0.1750986, -1.767871, 1, 0.8392157, 0, 1,
-0.9896805, -1.306162, -2.068677, 1, 0.8470588, 0, 1,
-0.9888651, -0.06735156, -0.8374455, 1, 0.8509804, 0, 1,
-0.9886297, -1.486554, -3.213172, 1, 0.8588235, 0, 1,
-0.9878963, -0.372085, -0.5827119, 1, 0.8627451, 0, 1,
-0.983896, -0.5415915, -2.238717, 1, 0.8705882, 0, 1,
-0.9838405, 1.386211, -0.2109742, 1, 0.8745098, 0, 1,
-0.9828038, 1.296101, 0.5428337, 1, 0.8823529, 0, 1,
-0.9815484, -0.8256375, -1.893131, 1, 0.8862745, 0, 1,
-0.9703141, 0.8971791, 1.132694, 1, 0.8941177, 0, 1,
-0.966695, 0.4586637, -1.702063, 1, 0.8980392, 0, 1,
-0.9552499, 0.09265108, -1.611444, 1, 0.9058824, 0, 1,
-0.9521774, 0.2084513, -1.996227, 1, 0.9137255, 0, 1,
-0.9521729, -1.189335, -0.5788425, 1, 0.9176471, 0, 1,
-0.9507346, -1.326252, -3.988304, 1, 0.9254902, 0, 1,
-0.9499874, 1.051332, 0.3096891, 1, 0.9294118, 0, 1,
-0.9491441, -0.04226092, -1.729258, 1, 0.9372549, 0, 1,
-0.9457796, -1.699736, -2.008754, 1, 0.9411765, 0, 1,
-0.9360129, 1.268443, 0.1955292, 1, 0.9490196, 0, 1,
-0.9352071, -0.6215545, -3.838576, 1, 0.9529412, 0, 1,
-0.9318333, 1.349211, -1.109343, 1, 0.9607843, 0, 1,
-0.928363, 0.2948849, -2.730572, 1, 0.9647059, 0, 1,
-0.9261224, -0.1900664, -1.168971, 1, 0.972549, 0, 1,
-0.9225416, 0.6097514, -1.461819, 1, 0.9764706, 0, 1,
-0.922332, 0.4938993, -1.645808, 1, 0.9843137, 0, 1,
-0.9208924, 1.052961, -1.706564, 1, 0.9882353, 0, 1,
-0.92075, 0.4554309, 0.4385678, 1, 0.9960784, 0, 1,
-0.9191444, -0.3304214, -1.421262, 0.9960784, 1, 0, 1,
-0.9175672, 1.018859, -0.1288061, 0.9921569, 1, 0, 1,
-0.9154164, 0.8186877, -4.003181, 0.9843137, 1, 0, 1,
-0.9114626, -2.407169, -2.618692, 0.9803922, 1, 0, 1,
-0.903621, 1.110769, -0.7049507, 0.972549, 1, 0, 1,
-0.8983352, -0.6619275, -2.863212, 0.9686275, 1, 0, 1,
-0.8964137, -0.8386073, -2.911712, 0.9607843, 1, 0, 1,
-0.8948244, 0.5072073, -1.727437, 0.9568627, 1, 0, 1,
-0.886596, -1.207574, -3.304507, 0.9490196, 1, 0, 1,
-0.8785962, 1.211459, -1.57508, 0.945098, 1, 0, 1,
-0.8720136, 1.355451, 0.6210625, 0.9372549, 1, 0, 1,
-0.8691604, 0.4190188, -1.433459, 0.9333333, 1, 0, 1,
-0.8662233, -2.590553, -1.820402, 0.9254902, 1, 0, 1,
-0.865258, 0.4013019, -2.826752, 0.9215686, 1, 0, 1,
-0.8598387, -0.8024219, -1.511359, 0.9137255, 1, 0, 1,
-0.8575074, 0.2673725, -1.501216, 0.9098039, 1, 0, 1,
-0.8568397, -0.4554993, -2.600432, 0.9019608, 1, 0, 1,
-0.8542396, 0.2016503, -0.2614941, 0.8941177, 1, 0, 1,
-0.8537086, 0.3001918, 1.225013, 0.8901961, 1, 0, 1,
-0.8441023, 2.341854, -0.2168786, 0.8823529, 1, 0, 1,
-0.8399926, 1.262902, -0.01248076, 0.8784314, 1, 0, 1,
-0.836588, 1.568739, -2.001727, 0.8705882, 1, 0, 1,
-0.8359753, -1.501176, -2.748038, 0.8666667, 1, 0, 1,
-0.8200927, -0.5088092, -3.06434, 0.8588235, 1, 0, 1,
-0.8191851, 1.325248, 0.1083627, 0.854902, 1, 0, 1,
-0.8083124, 0.1468766, -1.432215, 0.8470588, 1, 0, 1,
-0.8028767, 0.2210534, -1.85584, 0.8431373, 1, 0, 1,
-0.8010398, 0.7548469, -0.8570477, 0.8352941, 1, 0, 1,
-0.792107, -0.7892929, -2.320427, 0.8313726, 1, 0, 1,
-0.7885684, -0.6738996, -2.12358, 0.8235294, 1, 0, 1,
-0.7863536, -0.6393515, -1.891444, 0.8196079, 1, 0, 1,
-0.7855991, 1.028143, -0.1881477, 0.8117647, 1, 0, 1,
-0.7795048, -0.3985194, -1.681843, 0.8078431, 1, 0, 1,
-0.776799, 1.061343, -1.553493, 0.8, 1, 0, 1,
-0.7765192, 0.626294, -0.7203535, 0.7921569, 1, 0, 1,
-0.772807, 0.9615039, 0.4884996, 0.7882353, 1, 0, 1,
-0.7711033, 0.7770007, 1.305981, 0.7803922, 1, 0, 1,
-0.7690832, 0.03026907, -1.379793, 0.7764706, 1, 0, 1,
-0.7640727, 0.6257129, -1.152695, 0.7686275, 1, 0, 1,
-0.7625306, -0.3100707, -1.309554, 0.7647059, 1, 0, 1,
-0.7611088, 1.791189, 0.3400795, 0.7568628, 1, 0, 1,
-0.7579371, 1.077037, -0.9596238, 0.7529412, 1, 0, 1,
-0.750646, -0.4879062, -0.7416201, 0.7450981, 1, 0, 1,
-0.7414759, -0.6091636, -1.495496, 0.7411765, 1, 0, 1,
-0.7404185, 0.3043444, -1.114375, 0.7333333, 1, 0, 1,
-0.7271016, -0.3688878, -2.133984, 0.7294118, 1, 0, 1,
-0.7255415, -0.9040247, -2.345637, 0.7215686, 1, 0, 1,
-0.7234701, 1.772197, -0.5688297, 0.7176471, 1, 0, 1,
-0.7207241, 0.9045506, -0.9024462, 0.7098039, 1, 0, 1,
-0.7198673, -0.6504957, -4.512136, 0.7058824, 1, 0, 1,
-0.7186056, 1.411487, -1.411951, 0.6980392, 1, 0, 1,
-0.7152582, 0.002684009, -2.635574, 0.6901961, 1, 0, 1,
-0.7134022, 0.6318887, -1.415313, 0.6862745, 1, 0, 1,
-0.7127597, 0.2311942, -1.233168, 0.6784314, 1, 0, 1,
-0.7119549, -1.165607, -2.755128, 0.6745098, 1, 0, 1,
-0.7097164, 0.7617549, -2.260084, 0.6666667, 1, 0, 1,
-0.708985, 0.2373098, -2.043573, 0.6627451, 1, 0, 1,
-0.7082487, 0.6364487, -2.829844, 0.654902, 1, 0, 1,
-0.7078129, -2.226537, -1.627262, 0.6509804, 1, 0, 1,
-0.7077981, -0.4210274, -3.092489, 0.6431373, 1, 0, 1,
-0.7051832, -0.2206873, -1.650753, 0.6392157, 1, 0, 1,
-0.7033121, 1.48552, 0.1079518, 0.6313726, 1, 0, 1,
-0.7015941, 0.8873947, -0.5129097, 0.627451, 1, 0, 1,
-0.7011686, 0.8743985, -0.05756855, 0.6196079, 1, 0, 1,
-0.6958988, 0.8102698, -0.7526315, 0.6156863, 1, 0, 1,
-0.6932743, -0.1056804, -2.511625, 0.6078432, 1, 0, 1,
-0.6929839, 0.5687427, -1.572777, 0.6039216, 1, 0, 1,
-0.6830515, 2.309828, -0.1913585, 0.5960785, 1, 0, 1,
-0.6801908, 0.9222028, -1.481319, 0.5882353, 1, 0, 1,
-0.6790541, 0.5207475, -2.695516, 0.5843138, 1, 0, 1,
-0.673646, -0.3539789, -1.448982, 0.5764706, 1, 0, 1,
-0.6641414, -1.437862, -2.381021, 0.572549, 1, 0, 1,
-0.6638011, 1.177478, -0.2050687, 0.5647059, 1, 0, 1,
-0.6592151, -0.227922, -1.770334, 0.5607843, 1, 0, 1,
-0.6500806, 0.0004214603, -1.571373, 0.5529412, 1, 0, 1,
-0.643282, 0.6110479, -1.551158, 0.5490196, 1, 0, 1,
-0.6406702, 1.278942, -1.071561, 0.5411765, 1, 0, 1,
-0.6357154, 0.4294642, -0.4348401, 0.5372549, 1, 0, 1,
-0.6325732, 1.139386, 0.6402059, 0.5294118, 1, 0, 1,
-0.6316358, -0.766266, -1.474857, 0.5254902, 1, 0, 1,
-0.6302462, -0.2089483, -0.5244279, 0.5176471, 1, 0, 1,
-0.6245649, 1.683467, -2.314313, 0.5137255, 1, 0, 1,
-0.6163173, -0.3060538, -1.375658, 0.5058824, 1, 0, 1,
-0.6096427, 0.02733281, -2.488283, 0.5019608, 1, 0, 1,
-0.609259, -0.4208766, -3.616179, 0.4941176, 1, 0, 1,
-0.6053191, 1.133633, -1.714847, 0.4862745, 1, 0, 1,
-0.5993006, -0.4399932, -3.1034, 0.4823529, 1, 0, 1,
-0.5944365, 1.811694, 0.4957169, 0.4745098, 1, 0, 1,
-0.5931117, -0.04778977, -2.550664, 0.4705882, 1, 0, 1,
-0.5916268, 1.674444, -0.006002244, 0.4627451, 1, 0, 1,
-0.5884436, 0.6132142, -1.365243, 0.4588235, 1, 0, 1,
-0.5869634, -1.493826, -0.9115291, 0.4509804, 1, 0, 1,
-0.5815347, -1.188401, -2.04991, 0.4470588, 1, 0, 1,
-0.5795726, 3.783043, 0.1387483, 0.4392157, 1, 0, 1,
-0.5716496, -0.2244379, -2.080158, 0.4352941, 1, 0, 1,
-0.5708782, -1.039283, -2.843437, 0.427451, 1, 0, 1,
-0.5690801, -0.1042642, -1.902744, 0.4235294, 1, 0, 1,
-0.5681227, -1.143898, -2.143096, 0.4156863, 1, 0, 1,
-0.5662784, 0.8843899, 0.1479202, 0.4117647, 1, 0, 1,
-0.5645868, -0.2821496, -3.16411, 0.4039216, 1, 0, 1,
-0.5619109, 0.8630243, 1.48962, 0.3960784, 1, 0, 1,
-0.5619007, -1.225262, -2.507494, 0.3921569, 1, 0, 1,
-0.5595056, -0.6173961, -1.871877, 0.3843137, 1, 0, 1,
-0.5585595, 1.492659, -0.6569853, 0.3803922, 1, 0, 1,
-0.5547265, -0.3413639, -2.652938, 0.372549, 1, 0, 1,
-0.5544698, -1.472628, -1.865588, 0.3686275, 1, 0, 1,
-0.5518674, 0.3885408, -1.752365, 0.3607843, 1, 0, 1,
-0.5513446, 0.4395731, -1.889597, 0.3568628, 1, 0, 1,
-0.5501368, -0.9681609, -3.995673, 0.3490196, 1, 0, 1,
-0.547312, -0.8219085, -2.240765, 0.345098, 1, 0, 1,
-0.5464007, 1.485316, 0.1621753, 0.3372549, 1, 0, 1,
-0.5454138, -0.9398559, -2.309899, 0.3333333, 1, 0, 1,
-0.5431846, -0.7231092, -3.478955, 0.3254902, 1, 0, 1,
-0.5413867, 0.6430181, -1.614187, 0.3215686, 1, 0, 1,
-0.5408587, 1.389888, -1.184226, 0.3137255, 1, 0, 1,
-0.537113, -1.107059, -3.156769, 0.3098039, 1, 0, 1,
-0.5353309, -1.078524, -2.08249, 0.3019608, 1, 0, 1,
-0.5302831, 0.6807563, -1.224984, 0.2941177, 1, 0, 1,
-0.5300275, 0.3852064, -0.427579, 0.2901961, 1, 0, 1,
-0.5277451, -0.3530676, -3.470285, 0.282353, 1, 0, 1,
-0.524513, 1.054664, 1.455422, 0.2784314, 1, 0, 1,
-0.5175386, 0.4073758, -0.2915996, 0.2705882, 1, 0, 1,
-0.5148916, -0.1760318, -1.015859, 0.2666667, 1, 0, 1,
-0.5099275, -1.703098, -2.323024, 0.2588235, 1, 0, 1,
-0.509046, -2.008294, -2.13529, 0.254902, 1, 0, 1,
-0.5079583, 0.8096575, 0.1636848, 0.2470588, 1, 0, 1,
-0.5014817, -1.167881, -2.107059, 0.2431373, 1, 0, 1,
-0.4996046, 0.8710307, -0.9339176, 0.2352941, 1, 0, 1,
-0.4981214, 0.9689062, -0.840076, 0.2313726, 1, 0, 1,
-0.4929749, 0.3640476, -2.380162, 0.2235294, 1, 0, 1,
-0.4904937, 1.450107, 0.3514515, 0.2196078, 1, 0, 1,
-0.4891887, -0.2559728, -2.797868, 0.2117647, 1, 0, 1,
-0.4831905, 0.3745438, -2.326497, 0.2078431, 1, 0, 1,
-0.482133, 1.760056, 0.08795749, 0.2, 1, 0, 1,
-0.4795623, -0.7008848, -2.043922, 0.1921569, 1, 0, 1,
-0.4787285, 0.2264849, -2.788095, 0.1882353, 1, 0, 1,
-0.4781725, -1.347576, -3.67893, 0.1803922, 1, 0, 1,
-0.4725956, -0.0975089, -1.423597, 0.1764706, 1, 0, 1,
-0.4712067, -1.041114, -2.140873, 0.1686275, 1, 0, 1,
-0.4683141, -1.803644, -1.770651, 0.1647059, 1, 0, 1,
-0.4573661, 0.007970153, -1.208872, 0.1568628, 1, 0, 1,
-0.4519199, -0.3827884, -1.362535, 0.1529412, 1, 0, 1,
-0.450369, -0.5880445, -2.147531, 0.145098, 1, 0, 1,
-0.4450534, 0.6463584, -0.07271579, 0.1411765, 1, 0, 1,
-0.4412765, -1.243168, -1.877801, 0.1333333, 1, 0, 1,
-0.4369798, -0.4459329, -2.669855, 0.1294118, 1, 0, 1,
-0.4326692, 0.07906026, -0.5282892, 0.1215686, 1, 0, 1,
-0.4320996, -0.4199134, -1.562643, 0.1176471, 1, 0, 1,
-0.4311599, 0.1315671, -0.9480368, 0.1098039, 1, 0, 1,
-0.4271732, 0.3393044, -0.7788777, 0.1058824, 1, 0, 1,
-0.4250752, -2.204081, -4.026751, 0.09803922, 1, 0, 1,
-0.4215454, 0.03571929, -2.614569, 0.09019608, 1, 0, 1,
-0.4148298, 1.595852, -1.607428, 0.08627451, 1, 0, 1,
-0.4142385, 1.625769, -0.7069376, 0.07843138, 1, 0, 1,
-0.41204, -0.4070309, -1.78011, 0.07450981, 1, 0, 1,
-0.411454, 0.7613159, -0.8447462, 0.06666667, 1, 0, 1,
-0.4098473, 0.7463569, -0.5569073, 0.0627451, 1, 0, 1,
-0.4092585, 1.328089, -1.092196, 0.05490196, 1, 0, 1,
-0.4034501, -1.372295, -2.955102, 0.05098039, 1, 0, 1,
-0.3997402, 1.515233, -0.8517208, 0.04313726, 1, 0, 1,
-0.3996297, 1.427231, 0.2240723, 0.03921569, 1, 0, 1,
-0.3964487, 0.6194785, -1.508977, 0.03137255, 1, 0, 1,
-0.3886256, 0.5396773, 0.8104249, 0.02745098, 1, 0, 1,
-0.3885851, -0.3311305, -1.275247, 0.01960784, 1, 0, 1,
-0.3885022, 0.7524784, -1.441803, 0.01568628, 1, 0, 1,
-0.3873435, -0.9485265, -1.784254, 0.007843138, 1, 0, 1,
-0.3872883, 1.58657, -2.639993, 0.003921569, 1, 0, 1,
-0.3770921, 0.9970822, -0.9078743, 0, 1, 0.003921569, 1,
-0.3735268, -0.08934801, -1.001089, 0, 1, 0.01176471, 1,
-0.3715445, 0.09352519, -0.5261056, 0, 1, 0.01568628, 1,
-0.3706662, -0.7673315, -2.6944, 0, 1, 0.02352941, 1,
-0.3691014, 0.7840489, -1.772038, 0, 1, 0.02745098, 1,
-0.3689449, -0.2765104, -1.777331, 0, 1, 0.03529412, 1,
-0.3670534, -1.2666, -2.58805, 0, 1, 0.03921569, 1,
-0.3668243, 0.9996725, -1.490367, 0, 1, 0.04705882, 1,
-0.3599159, -0.1572852, -2.33128, 0, 1, 0.05098039, 1,
-0.3585408, 0.06072508, -2.081413, 0, 1, 0.05882353, 1,
-0.3578741, 0.0577762, -1.69751, 0, 1, 0.0627451, 1,
-0.3569832, 1.298626, -1.416997, 0, 1, 0.07058824, 1,
-0.3567357, 2.580752, -0.5832545, 0, 1, 0.07450981, 1,
-0.3507158, 0.8033005, -1.830569, 0, 1, 0.08235294, 1,
-0.350144, 0.836825, 0.8671427, 0, 1, 0.08627451, 1,
-0.3478319, 1.875428, 0.534883, 0, 1, 0.09411765, 1,
-0.3453708, -0.3632954, -2.405409, 0, 1, 0.1019608, 1,
-0.3444909, 1.545108, -1.832765, 0, 1, 0.1058824, 1,
-0.3354526, -1.614068, -2.879761, 0, 1, 0.1137255, 1,
-0.3333714, -2.02737, -1.865992, 0, 1, 0.1176471, 1,
-0.3309918, -0.06633554, -3.287146, 0, 1, 0.1254902, 1,
-0.3286633, 0.7392179, -0.3316277, 0, 1, 0.1294118, 1,
-0.327608, 0.297769, -2.027126, 0, 1, 0.1372549, 1,
-0.3273083, 1.045473, 0.4784474, 0, 1, 0.1411765, 1,
-0.3267483, -1.458838, -6.01956, 0, 1, 0.1490196, 1,
-0.326642, 0.9053944, -0.8714561, 0, 1, 0.1529412, 1,
-0.3255528, 0.006308996, -3.083926, 0, 1, 0.1607843, 1,
-0.3242749, 0.2605974, -0.2380951, 0, 1, 0.1647059, 1,
-0.3227147, -0.534178, -3.621924, 0, 1, 0.172549, 1,
-0.3209441, -0.671618, -3.757363, 0, 1, 0.1764706, 1,
-0.320567, 1.068188, 0.07312903, 0, 1, 0.1843137, 1,
-0.3169974, -0.144757, -0.9209415, 0, 1, 0.1882353, 1,
-0.3103065, 0.4544151, -1.98904, 0, 1, 0.1960784, 1,
-0.3102255, -2.116183, -2.752961, 0, 1, 0.2039216, 1,
-0.3085634, 0.399513, -0.5300142, 0, 1, 0.2078431, 1,
-0.2993588, -0.1097155, -2.636074, 0, 1, 0.2156863, 1,
-0.298388, 0.4662384, 1.245477, 0, 1, 0.2196078, 1,
-0.2969373, -0.9928412, -2.568092, 0, 1, 0.227451, 1,
-0.292951, 0.3652026, -0.4344884, 0, 1, 0.2313726, 1,
-0.2903996, -0.2980657, -0.3145515, 0, 1, 0.2392157, 1,
-0.2885211, -0.02614163, -1.255153, 0, 1, 0.2431373, 1,
-0.2845358, 0.3696492, -1.146927, 0, 1, 0.2509804, 1,
-0.2840735, -0.1139352, 0.3068665, 0, 1, 0.254902, 1,
-0.2826501, -0.06386191, -0.8875811, 0, 1, 0.2627451, 1,
-0.2820709, 0.01027768, -1.253204, 0, 1, 0.2666667, 1,
-0.2751435, 0.009142522, -2.276004, 0, 1, 0.2745098, 1,
-0.2735298, -1.469509, -2.314481, 0, 1, 0.2784314, 1,
-0.2720459, 0.4403098, -1.806535, 0, 1, 0.2862745, 1,
-0.2674893, -0.2506252, -1.118638, 0, 1, 0.2901961, 1,
-0.2620907, -0.5869935, -2.715174, 0, 1, 0.2980392, 1,
-0.260008, 0.8056165, -0.6991104, 0, 1, 0.3058824, 1,
-0.2590826, -0.09266414, -2.448891, 0, 1, 0.3098039, 1,
-0.254335, 0.2135954, -0.8881145, 0, 1, 0.3176471, 1,
-0.2529619, 0.2279829, -0.1805159, 0, 1, 0.3215686, 1,
-0.2513692, -0.6045749, -4.44639, 0, 1, 0.3294118, 1,
-0.2512798, 0.3730564, 0.4229741, 0, 1, 0.3333333, 1,
-0.2449099, 0.3703555, -0.4527382, 0, 1, 0.3411765, 1,
-0.2424441, -1.006166, -1.130963, 0, 1, 0.345098, 1,
-0.2421805, 1.582394, -1.664849, 0, 1, 0.3529412, 1,
-0.2374988, -0.4346989, -4.077234, 0, 1, 0.3568628, 1,
-0.2363018, 0.2932418, 0.2252624, 0, 1, 0.3647059, 1,
-0.234957, 2.367305, -1.141759, 0, 1, 0.3686275, 1,
-0.2344607, -1.634457, -3.3686, 0, 1, 0.3764706, 1,
-0.2304968, 0.3286553, -0.5824967, 0, 1, 0.3803922, 1,
-0.2287073, 0.8671545, 0.923017, 0, 1, 0.3882353, 1,
-0.227114, 0.7391905, -2.1403, 0, 1, 0.3921569, 1,
-0.2183794, -0.1654483, -1.638169, 0, 1, 0.4, 1,
-0.2168762, 1.229212, -1.619155, 0, 1, 0.4078431, 1,
-0.2162318, -0.1275353, -0.4088726, 0, 1, 0.4117647, 1,
-0.2149314, -1.571801, -3.0992, 0, 1, 0.4196078, 1,
-0.2136481, -0.5117767, -1.983286, 0, 1, 0.4235294, 1,
-0.204823, -0.2582823, -3.039369, 0, 1, 0.4313726, 1,
-0.2047882, -0.9290946, -1.920749, 0, 1, 0.4352941, 1,
-0.2040262, -0.05072013, -3.757488, 0, 1, 0.4431373, 1,
-0.2033416, 0.1201343, -1.973208, 0, 1, 0.4470588, 1,
-0.2017164, 2.402322, 1.595139, 0, 1, 0.454902, 1,
-0.2015884, 0.5803849, -0.7459669, 0, 1, 0.4588235, 1,
-0.2004523, 2.082527, 0.01305914, 0, 1, 0.4666667, 1,
-0.1982939, 1.755764, -0.9373328, 0, 1, 0.4705882, 1,
-0.1900138, 0.7513165, -0.3203702, 0, 1, 0.4784314, 1,
-0.1768135, 1.221049, -0.5311754, 0, 1, 0.4823529, 1,
-0.1755824, -0.6033185, -1.667372, 0, 1, 0.4901961, 1,
-0.1730615, -1.573935, -3.939107, 0, 1, 0.4941176, 1,
-0.1729154, -0.2681408, -3.340824, 0, 1, 0.5019608, 1,
-0.1694151, 1.319365, -0.7060241, 0, 1, 0.509804, 1,
-0.1679864, -0.1334151, -1.894416, 0, 1, 0.5137255, 1,
-0.1657813, -2.167474, -3.41527, 0, 1, 0.5215687, 1,
-0.157285, -0.4189571, -4.042051, 0, 1, 0.5254902, 1,
-0.1561398, -1.059595, -3.11229, 0, 1, 0.5333334, 1,
-0.1539307, 0.447058, -1.714875, 0, 1, 0.5372549, 1,
-0.1506768, 1.891071, -0.6962514, 0, 1, 0.5450981, 1,
-0.1500792, 1.037915, 0.265574, 0, 1, 0.5490196, 1,
-0.1446249, -0.8944196, -2.363294, 0, 1, 0.5568628, 1,
-0.1445068, -2.337861, -2.155864, 0, 1, 0.5607843, 1,
-0.1430971, -0.1769821, -2.918443, 0, 1, 0.5686275, 1,
-0.1404419, 0.9038765, -1.920543, 0, 1, 0.572549, 1,
-0.1403296, -0.4019169, -2.521245, 0, 1, 0.5803922, 1,
-0.1374605, 1.296482, 0.7507439, 0, 1, 0.5843138, 1,
-0.1317224, 0.1600057, -1.857171, 0, 1, 0.5921569, 1,
-0.1296606, -1.788931, -3.832581, 0, 1, 0.5960785, 1,
-0.1283052, 0.2701031, -0.6015303, 0, 1, 0.6039216, 1,
-0.1234075, -1.771246, -2.094598, 0, 1, 0.6117647, 1,
-0.1230181, -0.2474937, -1.486192, 0, 1, 0.6156863, 1,
-0.1212055, -0.5861271, -1.780728, 0, 1, 0.6235294, 1,
-0.1177137, -0.8289798, -2.887194, 0, 1, 0.627451, 1,
-0.1163701, -0.6893632, -3.417734, 0, 1, 0.6352941, 1,
-0.1141837, 1.37111, -0.1402568, 0, 1, 0.6392157, 1,
-0.1112724, -1.249703, -0.9543031, 0, 1, 0.6470588, 1,
-0.1026117, 0.1250028, -0.2943501, 0, 1, 0.6509804, 1,
-0.1019633, 0.5505459, 0.3730281, 0, 1, 0.6588235, 1,
-0.09826857, -0.698314, -2.954612, 0, 1, 0.6627451, 1,
-0.09596501, -0.6562372, -2.123129, 0, 1, 0.6705883, 1,
-0.09108841, -1.202109, -2.504924, 0, 1, 0.6745098, 1,
-0.08719619, 0.9119421, -0.0462164, 0, 1, 0.682353, 1,
-0.08595643, -0.3781249, -3.78314, 0, 1, 0.6862745, 1,
-0.08564883, 1.447924, 1.047612, 0, 1, 0.6941177, 1,
-0.08458338, -0.1213815, -2.682121, 0, 1, 0.7019608, 1,
-0.08078739, -0.6253487, -2.316931, 0, 1, 0.7058824, 1,
-0.0800385, 0.02338627, -2.193708, 0, 1, 0.7137255, 1,
-0.07641803, -0.8637323, -4.80923, 0, 1, 0.7176471, 1,
-0.0762293, -0.521373, -1.700027, 0, 1, 0.7254902, 1,
-0.07594185, 0.4160013, 0.3051297, 0, 1, 0.7294118, 1,
-0.07219104, -0.228347, -4.742602, 0, 1, 0.7372549, 1,
-0.06984638, 0.6638187, -0.5158122, 0, 1, 0.7411765, 1,
-0.05505921, 1.189386, 0.1208025, 0, 1, 0.7490196, 1,
-0.05176022, -0.205506, -2.225589, 0, 1, 0.7529412, 1,
-0.04683398, 1.290766, 0.850305, 0, 1, 0.7607843, 1,
-0.04594536, -1.844231, -1.935475, 0, 1, 0.7647059, 1,
-0.03808203, -1.263732, -2.968384, 0, 1, 0.772549, 1,
-0.03142797, -0.1000258, -1.87133, 0, 1, 0.7764706, 1,
-0.02641477, -0.4855193, -2.012482, 0, 1, 0.7843137, 1,
-0.02608573, -1.813293, -2.141875, 0, 1, 0.7882353, 1,
-0.024864, 0.3366029, 1.10252, 0, 1, 0.7960784, 1,
-0.02450601, 0.01440736, 0.2491807, 0, 1, 0.8039216, 1,
-0.02396794, 0.2263731, -1.156546, 0, 1, 0.8078431, 1,
-0.02359244, -1.530979, -1.722659, 0, 1, 0.8156863, 1,
-0.0220182, -0.8403426, -2.88668, 0, 1, 0.8196079, 1,
-0.02093508, -1.99636, -3.54248, 0, 1, 0.827451, 1,
-0.01981106, 0.349028, -1.89675, 0, 1, 0.8313726, 1,
-0.01954011, -0.8103672, -3.960365, 0, 1, 0.8392157, 1,
-0.01648915, -0.9493691, -2.84921, 0, 1, 0.8431373, 1,
-0.01261101, -0.7614872, -3.45576, 0, 1, 0.8509804, 1,
-0.009686426, -1.388222, -3.471931, 0, 1, 0.854902, 1,
-0.008566692, -0.5792924, -1.861222, 0, 1, 0.8627451, 1,
-0.008199335, -0.8552063, -3.140938, 0, 1, 0.8666667, 1,
-0.004663702, 0.2820646, -0.555715, 0, 1, 0.8745098, 1,
-0.003237949, 0.1713573, 1.837643, 0, 1, 0.8784314, 1,
-0.002328841, -0.07314005, -4.507815, 0, 1, 0.8862745, 1,
0.001303542, -0.7463688, 0.5210496, 0, 1, 0.8901961, 1,
0.002642582, 1.105416, 0.4773036, 0, 1, 0.8980392, 1,
0.005313773, -0.9860558, 3.291546, 0, 1, 0.9058824, 1,
0.00599706, -1.479973, 3.220371, 0, 1, 0.9098039, 1,
0.006677918, 1.280537, -0.6137843, 0, 1, 0.9176471, 1,
0.01112609, -0.5193347, 2.866388, 0, 1, 0.9215686, 1,
0.01187637, -1.322933, 2.452364, 0, 1, 0.9294118, 1,
0.02069826, -3.095495, 1.96686, 0, 1, 0.9333333, 1,
0.02186259, -0.4059964, 2.256143, 0, 1, 0.9411765, 1,
0.02260149, 1.409352, -0.3666524, 0, 1, 0.945098, 1,
0.02361203, 0.02288618, 2.185356, 0, 1, 0.9529412, 1,
0.02471821, -2.252512, 3.502712, 0, 1, 0.9568627, 1,
0.02973565, -0.3824543, 2.177112, 0, 1, 0.9647059, 1,
0.03003864, -0.3388292, 2.661668, 0, 1, 0.9686275, 1,
0.0400601, 2.081215, 0.5568741, 0, 1, 0.9764706, 1,
0.04022567, -0.06147142, 3.149135, 0, 1, 0.9803922, 1,
0.04408497, 0.2075025, 0.7195129, 0, 1, 0.9882353, 1,
0.05061216, 0.02936574, 1.56744, 0, 1, 0.9921569, 1,
0.05288469, -0.6057638, 2.509938, 0, 1, 1, 1,
0.05356553, 0.3280301, 1.003399, 0, 0.9921569, 1, 1,
0.0590869, 1.0964, -0.1225013, 0, 0.9882353, 1, 1,
0.06216425, -0.4040953, 5.191464, 0, 0.9803922, 1, 1,
0.06308577, 1.027456, 2.073841, 0, 0.9764706, 1, 1,
0.06391059, 0.06865852, 0.303855, 0, 0.9686275, 1, 1,
0.07700098, 0.03144577, 0.9723221, 0, 0.9647059, 1, 1,
0.07816757, -1.32942, 3.092516, 0, 0.9568627, 1, 1,
0.08244458, -0.6243545, 2.50367, 0, 0.9529412, 1, 1,
0.09210047, -0.535353, 1.724943, 0, 0.945098, 1, 1,
0.09449179, -0.9032754, 1.815007, 0, 0.9411765, 1, 1,
0.09460129, -1.277245, 2.406444, 0, 0.9333333, 1, 1,
0.09614272, 0.1234581, -1.045141, 0, 0.9294118, 1, 1,
0.09705886, -0.5826722, 1.717184, 0, 0.9215686, 1, 1,
0.09707893, 1.01619, -0.5699829, 0, 0.9176471, 1, 1,
0.0996042, -0.1211531, 1.570777, 0, 0.9098039, 1, 1,
0.1016536, 0.6169624, -0.1567183, 0, 0.9058824, 1, 1,
0.1036777, -0.6893864, 1.538753, 0, 0.8980392, 1, 1,
0.1135981, 0.6051376, 0.7217337, 0, 0.8901961, 1, 1,
0.115668, -0.3189647, 2.62337, 0, 0.8862745, 1, 1,
0.1167062, -1.948359, 1.472902, 0, 0.8784314, 1, 1,
0.1224176, -0.3486286, 3.443835, 0, 0.8745098, 1, 1,
0.1237821, 0.1311222, 2.194776, 0, 0.8666667, 1, 1,
0.1244443, -0.9040874, 2.283175, 0, 0.8627451, 1, 1,
0.1324002, 0.7280672, 0.008024785, 0, 0.854902, 1, 1,
0.1447316, -0.7872149, 3.583815, 0, 0.8509804, 1, 1,
0.1465845, -1.741805, 4.203662, 0, 0.8431373, 1, 1,
0.1480297, 0.4151851, 0.7065173, 0, 0.8392157, 1, 1,
0.1481524, 1.81082, -0.8976853, 0, 0.8313726, 1, 1,
0.1489358, -0.198477, 3.078458, 0, 0.827451, 1, 1,
0.1531717, -0.703719, 1.608247, 0, 0.8196079, 1, 1,
0.1550303, -0.05352909, 1.601998, 0, 0.8156863, 1, 1,
0.1591594, 2.291056, -0.4275399, 0, 0.8078431, 1, 1,
0.160617, 0.1128772, 0.6285405, 0, 0.8039216, 1, 1,
0.1615192, 0.1444221, 2.841665, 0, 0.7960784, 1, 1,
0.1620148, -1.084757, 1.951852, 0, 0.7882353, 1, 1,
0.1657269, -0.2925216, 4.798307, 0, 0.7843137, 1, 1,
0.1670841, -1.999614, 2.963467, 0, 0.7764706, 1, 1,
0.1724715, 0.4691428, 0.4073775, 0, 0.772549, 1, 1,
0.1746026, 0.2079102, 0.1065145, 0, 0.7647059, 1, 1,
0.1757911, -1.009341, 1.689848, 0, 0.7607843, 1, 1,
0.1767034, -0.775929, 2.427737, 0, 0.7529412, 1, 1,
0.17712, 1.208631, 0.5963678, 0, 0.7490196, 1, 1,
0.1774395, 1.544002, 0.9094416, 0, 0.7411765, 1, 1,
0.1788087, -0.7606554, 1.006065, 0, 0.7372549, 1, 1,
0.1802999, -0.001204262, 1.854839, 0, 0.7294118, 1, 1,
0.1809344, -0.05087441, 1.762531, 0, 0.7254902, 1, 1,
0.1817564, -0.3624937, 3.595838, 0, 0.7176471, 1, 1,
0.1860538, 1.892257, 0.2132342, 0, 0.7137255, 1, 1,
0.1894988, -0.7565908, 0.06650059, 0, 0.7058824, 1, 1,
0.1911411, -0.06746683, 0.4454581, 0, 0.6980392, 1, 1,
0.1913906, 1.104902, 0.1392211, 0, 0.6941177, 1, 1,
0.1939076, 0.3679564, 0.5840451, 0, 0.6862745, 1, 1,
0.1951627, -0.3486737, 2.251759, 0, 0.682353, 1, 1,
0.1989352, 0.2302333, 0.4629458, 0, 0.6745098, 1, 1,
0.1994828, 0.06841502, 1.74034, 0, 0.6705883, 1, 1,
0.211107, -0.7673137, 1.847496, 0, 0.6627451, 1, 1,
0.2139497, 0.8853953, -0.372631, 0, 0.6588235, 1, 1,
0.2159589, -1.6191, 3.856836, 0, 0.6509804, 1, 1,
0.2223935, -0.2765901, 3.220282, 0, 0.6470588, 1, 1,
0.2231983, -2.521207, 1.636358, 0, 0.6392157, 1, 1,
0.2260409, -0.4152323, 3.276702, 0, 0.6352941, 1, 1,
0.2333646, 0.1133838, 1.355563, 0, 0.627451, 1, 1,
0.2386727, 0.4077078, 0.935333, 0, 0.6235294, 1, 1,
0.2389213, 0.2649078, 0.5862107, 0, 0.6156863, 1, 1,
0.2405328, 0.5860373, 1.147071, 0, 0.6117647, 1, 1,
0.240618, 0.2757092, -0.1037052, 0, 0.6039216, 1, 1,
0.2470866, -0.7771742, 3.034616, 0, 0.5960785, 1, 1,
0.2471676, 0.7975375, 0.06650186, 0, 0.5921569, 1, 1,
0.2474766, 0.1760229, 2.027613, 0, 0.5843138, 1, 1,
0.2478445, -1.461323, 3.757148, 0, 0.5803922, 1, 1,
0.2483743, -1.018073, 2.342067, 0, 0.572549, 1, 1,
0.2489192, -0.03637709, 2.639465, 0, 0.5686275, 1, 1,
0.2495539, -0.05347084, 1.707249, 0, 0.5607843, 1, 1,
0.2503891, -0.4100379, 4.094152, 0, 0.5568628, 1, 1,
0.2507511, -0.992814, 3.437157, 0, 0.5490196, 1, 1,
0.2552609, -1.11085, 5.875262, 0, 0.5450981, 1, 1,
0.2560611, -0.4264414, 1.903732, 0, 0.5372549, 1, 1,
0.2568948, -0.7310433, 4.371106, 0, 0.5333334, 1, 1,
0.26347, -0.1338709, 2.564837, 0, 0.5254902, 1, 1,
0.2657439, 1.214352, -0.3254037, 0, 0.5215687, 1, 1,
0.269608, 0.1993868, 0.6823999, 0, 0.5137255, 1, 1,
0.270577, 1.858752, 1.039254, 0, 0.509804, 1, 1,
0.2741812, -0.4620948, 4.175642, 0, 0.5019608, 1, 1,
0.2752307, 1.870787, -0.5495456, 0, 0.4941176, 1, 1,
0.279276, 0.1355244, 1.206404, 0, 0.4901961, 1, 1,
0.2808897, -1.269427, 3.586685, 0, 0.4823529, 1, 1,
0.2842138, 0.4965778, 0.7010068, 0, 0.4784314, 1, 1,
0.2864248, -0.646063, 2.022035, 0, 0.4705882, 1, 1,
0.2865051, 0.1162298, 0.56106, 0, 0.4666667, 1, 1,
0.2869155, -0.8836229, 4.272757, 0, 0.4588235, 1, 1,
0.2906818, 1.737864, 0.4271451, 0, 0.454902, 1, 1,
0.2967561, 0.185753, 1.869966, 0, 0.4470588, 1, 1,
0.2989343, 0.4008884, 0.9234741, 0, 0.4431373, 1, 1,
0.3078434, -0.2019591, 2.585531, 0, 0.4352941, 1, 1,
0.3094841, 1.041586, -0.9971979, 0, 0.4313726, 1, 1,
0.3118551, 0.07099135, 1.899516, 0, 0.4235294, 1, 1,
0.3132482, 0.5380409, 1.414207, 0, 0.4196078, 1, 1,
0.3148971, -0.9890102, 3.030083, 0, 0.4117647, 1, 1,
0.3185488, -1.695989, 4.118554, 0, 0.4078431, 1, 1,
0.3191811, -0.8132016, 1.852349, 0, 0.4, 1, 1,
0.3229133, 0.3302787, 2.134884, 0, 0.3921569, 1, 1,
0.323866, 1.193098, 0.233829, 0, 0.3882353, 1, 1,
0.3255344, -0.04910674, 0.6374045, 0, 0.3803922, 1, 1,
0.3268575, -1.450374, 3.044535, 0, 0.3764706, 1, 1,
0.3281148, 0.6803339, -1.000313, 0, 0.3686275, 1, 1,
0.330181, 0.8712453, 1.611046, 0, 0.3647059, 1, 1,
0.3325467, 0.6308227, 0.5845544, 0, 0.3568628, 1, 1,
0.3328936, 0.4263553, -0.7543693, 0, 0.3529412, 1, 1,
0.3338968, 0.1784856, 2.389527, 0, 0.345098, 1, 1,
0.3370384, -1.101842, 5.092579, 0, 0.3411765, 1, 1,
0.3390519, -1.147344, 2.86223, 0, 0.3333333, 1, 1,
0.3390833, 0.1731261, 0.8084115, 0, 0.3294118, 1, 1,
0.3421314, -1.260161, 3.666777, 0, 0.3215686, 1, 1,
0.3442199, 1.012304, 1.024133, 0, 0.3176471, 1, 1,
0.3445985, -0.8372332, 2.819566, 0, 0.3098039, 1, 1,
0.3465003, 0.1111727, 1.693954, 0, 0.3058824, 1, 1,
0.3480982, 1.364964, -0.5419548, 0, 0.2980392, 1, 1,
0.3499287, 1.989248, 0.1887004, 0, 0.2901961, 1, 1,
0.354154, 0.1423748, 2.794134, 0, 0.2862745, 1, 1,
0.356779, 1.45615, -0.08174194, 0, 0.2784314, 1, 1,
0.3570158, 0.1834353, 1.648733, 0, 0.2745098, 1, 1,
0.3581926, 0.6716061, -1.228493, 0, 0.2666667, 1, 1,
0.3604262, -0.7673156, 2.819989, 0, 0.2627451, 1, 1,
0.3624744, -0.2938308, 2.413158, 0, 0.254902, 1, 1,
0.3684079, 0.4560142, 1.916421, 0, 0.2509804, 1, 1,
0.3687691, -0.3201627, 3.236077, 0, 0.2431373, 1, 1,
0.3712408, -1.501465, 3.061854, 0, 0.2392157, 1, 1,
0.3725252, -0.5957333, 1.954172, 0, 0.2313726, 1, 1,
0.3750944, 0.2463045, 2.492168, 0, 0.227451, 1, 1,
0.3792388, 1.988272, 0.411422, 0, 0.2196078, 1, 1,
0.3864079, -2.204505, 2.829592, 0, 0.2156863, 1, 1,
0.3952496, 1.166523, -0.8993921, 0, 0.2078431, 1, 1,
0.398308, 0.4205072, 2.323247, 0, 0.2039216, 1, 1,
0.399604, -2.123941, 2.047515, 0, 0.1960784, 1, 1,
0.4036412, -0.2826588, 1.385462, 0, 0.1882353, 1, 1,
0.4063835, 0.1553411, -0.05598762, 0, 0.1843137, 1, 1,
0.4123723, -0.1900248, 2.317244, 0, 0.1764706, 1, 1,
0.4123834, -0.03836073, -0.9945534, 0, 0.172549, 1, 1,
0.4133081, -1.087956, 1.350238, 0, 0.1647059, 1, 1,
0.414658, 0.5032189, 1.801339, 0, 0.1607843, 1, 1,
0.4199949, 2.095682, 1.99213, 0, 0.1529412, 1, 1,
0.4200984, -0.9914685, 0.3382275, 0, 0.1490196, 1, 1,
0.421778, 1.123097, 2.597203, 0, 0.1411765, 1, 1,
0.4288019, -0.8686772, 3.66203, 0, 0.1372549, 1, 1,
0.4321236, -1.831173, 3.393185, 0, 0.1294118, 1, 1,
0.4326384, 0.09815548, 1.205741, 0, 0.1254902, 1, 1,
0.434227, 0.1274538, 0.4950054, 0, 0.1176471, 1, 1,
0.4347109, 0.1026549, 1.547605, 0, 0.1137255, 1, 1,
0.4368417, 0.1876138, 1.708425, 0, 0.1058824, 1, 1,
0.4373049, -0.9971517, 3.026898, 0, 0.09803922, 1, 1,
0.4387637, -0.4183968, 2.43837, 0, 0.09411765, 1, 1,
0.4448473, -1.629058, 3.024352, 0, 0.08627451, 1, 1,
0.4478755, -1.212855, 4.867718, 0, 0.08235294, 1, 1,
0.4481723, 0.7897155, 0.1511823, 0, 0.07450981, 1, 1,
0.4482885, 0.5170981, 1.151516, 0, 0.07058824, 1, 1,
0.4509638, -2.951313, 3.883097, 0, 0.0627451, 1, 1,
0.4513459, 0.01797165, 1.273703, 0, 0.05882353, 1, 1,
0.4540128, 0.6739988, 1.959824, 0, 0.05098039, 1, 1,
0.4541663, 0.02053917, 0.7351944, 0, 0.04705882, 1, 1,
0.4597688, 1.588527, -0.605, 0, 0.03921569, 1, 1,
0.4598593, -1.49691, 1.920088, 0, 0.03529412, 1, 1,
0.4616862, 1.502837, -0.1127344, 0, 0.02745098, 1, 1,
0.4672999, 0.2043429, 2.97225, 0, 0.02352941, 1, 1,
0.4734508, -1.241211, 0.8928066, 0, 0.01568628, 1, 1,
0.4818454, -1.376647, 2.170967, 0, 0.01176471, 1, 1,
0.4849251, 0.4975286, -0.77048, 0, 0.003921569, 1, 1,
0.4851844, 1.725558, 0.2581407, 0.003921569, 0, 1, 1,
0.4859603, -0.6549055, 3.447508, 0.007843138, 0, 1, 1,
0.4861381, 1.182674, 0.6639812, 0.01568628, 0, 1, 1,
0.4876118, 0.8788079, -0.3630929, 0.01960784, 0, 1, 1,
0.4893916, 0.649183, 0.8664275, 0.02745098, 0, 1, 1,
0.4899675, 0.8422584, -0.9483567, 0.03137255, 0, 1, 1,
0.4900843, 0.8631003, 1.65793, 0.03921569, 0, 1, 1,
0.5002943, 0.7797458, 2.617128, 0.04313726, 0, 1, 1,
0.5018826, 2.589869, 0.4551319, 0.05098039, 0, 1, 1,
0.5076184, 1.538403, 0.4649869, 0.05490196, 0, 1, 1,
0.5078269, 1.210999, -0.6364336, 0.0627451, 0, 1, 1,
0.5088874, 0.952727, 1.761013, 0.06666667, 0, 1, 1,
0.5101125, -0.1102504, 0.2559555, 0.07450981, 0, 1, 1,
0.5113406, -0.8966127, 3.44645, 0.07843138, 0, 1, 1,
0.5167634, 0.259342, -0.2397439, 0.08627451, 0, 1, 1,
0.5185462, 1.274526, -1.283478, 0.09019608, 0, 1, 1,
0.5243793, -0.5886714, 3.667165, 0.09803922, 0, 1, 1,
0.5243872, 0.960556, -1.426217, 0.1058824, 0, 1, 1,
0.5292422, 1.275054, 1.328413, 0.1098039, 0, 1, 1,
0.5298144, 0.2860734, 1.771441, 0.1176471, 0, 1, 1,
0.533159, -0.635232, 2.999505, 0.1215686, 0, 1, 1,
0.539083, 0.2033687, 0.2162969, 0.1294118, 0, 1, 1,
0.5411448, 0.6665525, 0.5719956, 0.1333333, 0, 1, 1,
0.5469138, 2.068288, 0.3141627, 0.1411765, 0, 1, 1,
0.5477839, -0.3660143, 2.345992, 0.145098, 0, 1, 1,
0.5520244, -0.5159234, 1.014094, 0.1529412, 0, 1, 1,
0.5608371, -0.3079293, 1.7542, 0.1568628, 0, 1, 1,
0.5636875, 2.142014, 1.49567, 0.1647059, 0, 1, 1,
0.565816, -1.202255, 4.546403, 0.1686275, 0, 1, 1,
0.5666586, 1.485841, -0.09241552, 0.1764706, 0, 1, 1,
0.5671906, 0.5241961, 1.233455, 0.1803922, 0, 1, 1,
0.5681013, 0.009452179, 0.5417844, 0.1882353, 0, 1, 1,
0.5731593, 0.6218897, -0.619284, 0.1921569, 0, 1, 1,
0.5792161, -0.5749124, 3.403441, 0.2, 0, 1, 1,
0.5794865, 0.8045698, -0.6404849, 0.2078431, 0, 1, 1,
0.5985653, 1.671091, 0.230563, 0.2117647, 0, 1, 1,
0.6002096, 0.04375459, 2.281416, 0.2196078, 0, 1, 1,
0.6022693, -0.7666789, 3.070247, 0.2235294, 0, 1, 1,
0.6035504, -0.05987178, 1.467641, 0.2313726, 0, 1, 1,
0.6071044, 0.1815096, -0.4635817, 0.2352941, 0, 1, 1,
0.6076058, -0.7297536, 3.2685, 0.2431373, 0, 1, 1,
0.6116396, -1.241738, 3.924663, 0.2470588, 0, 1, 1,
0.6183643, -1.874659, 3.54552, 0.254902, 0, 1, 1,
0.6232343, -0.5079997, 2.165471, 0.2588235, 0, 1, 1,
0.6236119, -0.5985444, 2.107562, 0.2666667, 0, 1, 1,
0.632961, 0.832751, -0.462004, 0.2705882, 0, 1, 1,
0.6331614, -0.920159, 1.828353, 0.2784314, 0, 1, 1,
0.6334691, 1.584595, -0.00947221, 0.282353, 0, 1, 1,
0.6344262, 0.8322757, -0.5080593, 0.2901961, 0, 1, 1,
0.6366968, 1.494425, -0.7157223, 0.2941177, 0, 1, 1,
0.6371515, 2.013724, -1.024277, 0.3019608, 0, 1, 1,
0.6379308, 1.61693, 1.048756, 0.3098039, 0, 1, 1,
0.6392894, 0.3613246, 1.970104, 0.3137255, 0, 1, 1,
0.6406298, 0.81869, 1.795053, 0.3215686, 0, 1, 1,
0.6481562, 1.139474, -0.5453977, 0.3254902, 0, 1, 1,
0.6497045, 0.5159737, -0.7914506, 0.3333333, 0, 1, 1,
0.6505244, 0.04983154, 2.672878, 0.3372549, 0, 1, 1,
0.6588704, 1.446073, -1.20074, 0.345098, 0, 1, 1,
0.6597401, -0.4139021, 1.559965, 0.3490196, 0, 1, 1,
0.663194, 2.166532, 0.5626194, 0.3568628, 0, 1, 1,
0.6663657, 0.9599454, 1.760536, 0.3607843, 0, 1, 1,
0.6671476, -0.4814592, 2.513034, 0.3686275, 0, 1, 1,
0.6671596, 0.7578001, 0.2999681, 0.372549, 0, 1, 1,
0.6719604, -0.976534, 2.736607, 0.3803922, 0, 1, 1,
0.6739768, -0.5790799, 2.880522, 0.3843137, 0, 1, 1,
0.6818917, 0.2811524, 0.4310914, 0.3921569, 0, 1, 1,
0.6823297, -0.2669055, 2.560325, 0.3960784, 0, 1, 1,
0.6860974, 0.1910106, 1.240422, 0.4039216, 0, 1, 1,
0.6921837, -0.2286018, 2.489435, 0.4117647, 0, 1, 1,
0.6928594, -1.092465, 1.379204, 0.4156863, 0, 1, 1,
0.6949454, -0.44451, 2.229666, 0.4235294, 0, 1, 1,
0.697398, 0.114048, 2.07971, 0.427451, 0, 1, 1,
0.6983683, 0.6257872, 0.1784683, 0.4352941, 0, 1, 1,
0.7015482, -0.7255663, 3.601307, 0.4392157, 0, 1, 1,
0.7020445, -0.3727947, 1.116765, 0.4470588, 0, 1, 1,
0.7075313, 0.5921586, 1.853731, 0.4509804, 0, 1, 1,
0.709222, -0.4650714, 3.368003, 0.4588235, 0, 1, 1,
0.710492, 2.0391, 0.895382, 0.4627451, 0, 1, 1,
0.7126755, -0.06246357, 1.665074, 0.4705882, 0, 1, 1,
0.7151438, -0.5840601, 3.901528, 0.4745098, 0, 1, 1,
0.719784, 1.924118, 3.25578, 0.4823529, 0, 1, 1,
0.7198933, -0.4186649, 3.668567, 0.4862745, 0, 1, 1,
0.7226166, 1.133207, -0.4026678, 0.4941176, 0, 1, 1,
0.7243072, 0.7390366, 1.972325, 0.5019608, 0, 1, 1,
0.724436, -0.0177314, 0.6322767, 0.5058824, 0, 1, 1,
0.726465, 0.06480451, -0.01677398, 0.5137255, 0, 1, 1,
0.7270837, 1.284958, -0.1811, 0.5176471, 0, 1, 1,
0.7300129, 1.055305, -1.366981, 0.5254902, 0, 1, 1,
0.7315482, -1.553307, 1.516698, 0.5294118, 0, 1, 1,
0.736667, -0.2406436, 1.152302, 0.5372549, 0, 1, 1,
0.7396075, -0.2314599, -0.05134418, 0.5411765, 0, 1, 1,
0.7419382, -0.1108876, 2.045527, 0.5490196, 0, 1, 1,
0.7427355, -1.210666, 1.538051, 0.5529412, 0, 1, 1,
0.7444276, 0.7660298, 2.235472, 0.5607843, 0, 1, 1,
0.7458645, 1.190427, -0.4085526, 0.5647059, 0, 1, 1,
0.7552667, -0.5978347, 1.984565, 0.572549, 0, 1, 1,
0.7553427, -0.1686734, 2.787601, 0.5764706, 0, 1, 1,
0.75609, 1.107318, -1.213216, 0.5843138, 0, 1, 1,
0.7565696, -1.154536, 2.288396, 0.5882353, 0, 1, 1,
0.760079, -0.2438399, 2.249605, 0.5960785, 0, 1, 1,
0.7620364, -0.6502687, 1.122115, 0.6039216, 0, 1, 1,
0.7654925, -0.3352233, 2.44971, 0.6078432, 0, 1, 1,
0.774429, -0.4930327, 1.020416, 0.6156863, 0, 1, 1,
0.7773271, -0.363768, 1.944714, 0.6196079, 0, 1, 1,
0.7774063, -0.7194217, 2.82286, 0.627451, 0, 1, 1,
0.7785818, -0.03917504, 2.592848, 0.6313726, 0, 1, 1,
0.7842664, 1.975122, 1.240017, 0.6392157, 0, 1, 1,
0.7846416, -1.7, 3.725879, 0.6431373, 0, 1, 1,
0.7851906, -0.6504727, 3.467861, 0.6509804, 0, 1, 1,
0.7882115, 0.3571989, 2.908286, 0.654902, 0, 1, 1,
0.7900433, -0.03117019, 0.3619042, 0.6627451, 0, 1, 1,
0.80863, -0.5928053, 1.912053, 0.6666667, 0, 1, 1,
0.8093117, -1.046514, 2.711372, 0.6745098, 0, 1, 1,
0.8108039, -0.7325807, 2.055883, 0.6784314, 0, 1, 1,
0.8249035, 0.6655487, 0.4845876, 0.6862745, 0, 1, 1,
0.8299592, 0.988983, 0.4423927, 0.6901961, 0, 1, 1,
0.8368661, -0.6312684, 1.69734, 0.6980392, 0, 1, 1,
0.8403927, 0.6644671, 2.491144, 0.7058824, 0, 1, 1,
0.8404776, -0.06858305, 1.826412, 0.7098039, 0, 1, 1,
0.8415772, 0.6240481, 0.2518815, 0.7176471, 0, 1, 1,
0.841931, -0.2523152, 1.701601, 0.7215686, 0, 1, 1,
0.8422133, 0.07284416, 2.588264, 0.7294118, 0, 1, 1,
0.845973, 0.2633299, 0.3895886, 0.7333333, 0, 1, 1,
0.8504694, -1.048155, 2.993284, 0.7411765, 0, 1, 1,
0.8548677, 0.2746713, 1.327661, 0.7450981, 0, 1, 1,
0.8571109, -1.678066, 1.717773, 0.7529412, 0, 1, 1,
0.8576847, 0.09202173, 1.669107, 0.7568628, 0, 1, 1,
0.8588822, 1.660025, 0.5745785, 0.7647059, 0, 1, 1,
0.8687534, -0.4010541, 3.42381, 0.7686275, 0, 1, 1,
0.8709285, 1.481566, -0.882633, 0.7764706, 0, 1, 1,
0.8711661, 0.9774771, -1.381738, 0.7803922, 0, 1, 1,
0.8734899, -0.57992, -0.3883057, 0.7882353, 0, 1, 1,
0.8739245, -0.5198827, 2.026822, 0.7921569, 0, 1, 1,
0.8747209, 0.5425797, 0.3533947, 0.8, 0, 1, 1,
0.8769637, -1.269041, 3.07072, 0.8078431, 0, 1, 1,
0.876992, 0.9159281, 0.6703676, 0.8117647, 0, 1, 1,
0.8801048, 0.08703742, 0.7785905, 0.8196079, 0, 1, 1,
0.880785, -1.180474, 2.08722, 0.8235294, 0, 1, 1,
0.882782, 0.6286788, -2.03547, 0.8313726, 0, 1, 1,
0.8890328, 1.511284, 0.4775271, 0.8352941, 0, 1, 1,
0.8906507, 0.1830579, 1.646784, 0.8431373, 0, 1, 1,
0.8953729, 1.264062, 0.06537049, 0.8470588, 0, 1, 1,
0.8964299, -1.399445, 2.102389, 0.854902, 0, 1, 1,
0.8964932, -0.1343553, 0.5342824, 0.8588235, 0, 1, 1,
0.9025632, 0.2470294, 0.9804542, 0.8666667, 0, 1, 1,
0.9061297, 2.145282, -0.787982, 0.8705882, 0, 1, 1,
0.907765, 0.9639247, 0.7136671, 0.8784314, 0, 1, 1,
0.9133937, -2.02038, 1.843722, 0.8823529, 0, 1, 1,
0.9171721, -0.2019684, 2.08397, 0.8901961, 0, 1, 1,
0.9200128, 1.361905, -1.650073, 0.8941177, 0, 1, 1,
0.9217399, -0.7549087, 1.582312, 0.9019608, 0, 1, 1,
0.921935, -0.1635805, 1.220377, 0.9098039, 0, 1, 1,
0.9355243, -0.4755614, 3.764235, 0.9137255, 0, 1, 1,
0.9456984, -0.3583608, 2.159911, 0.9215686, 0, 1, 1,
0.9457531, 1.017138, 1.527237, 0.9254902, 0, 1, 1,
0.9651369, 0.5569827, 1.245835, 0.9333333, 0, 1, 1,
0.9702876, -1.395836, 1.963724, 0.9372549, 0, 1, 1,
0.9706195, 0.3831725, 1.003525, 0.945098, 0, 1, 1,
0.9768245, 2.134043, 0.805187, 0.9490196, 0, 1, 1,
0.9773333, -0.004743485, 0.6524056, 0.9568627, 0, 1, 1,
0.987931, 1.177676, -1.954901, 0.9607843, 0, 1, 1,
0.9886606, 0.6298068, 0.2241529, 0.9686275, 0, 1, 1,
0.993266, -1.15325, 2.45518, 0.972549, 0, 1, 1,
0.9950192, 0.8681304, 2.151737, 0.9803922, 0, 1, 1,
0.9976767, 1.780148, -0.9757161, 0.9843137, 0, 1, 1,
0.9979424, 1.21632, 2.234146, 0.9921569, 0, 1, 1,
0.9998207, -1.186105, 4.402732, 0.9960784, 0, 1, 1,
1.006278, -0.4912084, 1.669337, 1, 0, 0.9960784, 1,
1.011822, 1.178899, 0.06030932, 1, 0, 0.9882353, 1,
1.012416, 0.2154115, 2.425406, 1, 0, 0.9843137, 1,
1.023136, 1.459449, 0.4760615, 1, 0, 0.9764706, 1,
1.025036, 0.24318, 0.8620579, 1, 0, 0.972549, 1,
1.025999, 0.8925623, 0.1044655, 1, 0, 0.9647059, 1,
1.026169, 0.08501253, 0.2209187, 1, 0, 0.9607843, 1,
1.031379, 0.4670207, 3.117685, 1, 0, 0.9529412, 1,
1.040173, -1.098321, 2.704511, 1, 0, 0.9490196, 1,
1.045564, -0.2494046, 2.898575, 1, 0, 0.9411765, 1,
1.048799, -0.0002986836, 1.313052, 1, 0, 0.9372549, 1,
1.05161, -1.157283, 4.359653, 1, 0, 0.9294118, 1,
1.072318, -0.2379461, 1.285326, 1, 0, 0.9254902, 1,
1.074165, -0.6812323, 0.2115401, 1, 0, 0.9176471, 1,
1.078413, 1.268283, 1.351552, 1, 0, 0.9137255, 1,
1.092048, -1.091222, 0.7288425, 1, 0, 0.9058824, 1,
1.09663, 0.8486936, -0.397595, 1, 0, 0.9019608, 1,
1.101058, 0.425482, 1.388712, 1, 0, 0.8941177, 1,
1.103607, 0.8935401, -0.5773487, 1, 0, 0.8862745, 1,
1.108137, 0.0458276, 2.046099, 1, 0, 0.8823529, 1,
1.111202, 0.1861212, 0.3508695, 1, 0, 0.8745098, 1,
1.112672, 0.09416568, 1.299293, 1, 0, 0.8705882, 1,
1.115294, 1.224869, 0.8407843, 1, 0, 0.8627451, 1,
1.115548, 1.902872, 1.093004, 1, 0, 0.8588235, 1,
1.118461, -0.892892, 1.337389, 1, 0, 0.8509804, 1,
1.118826, 0.4127174, 2.484199, 1, 0, 0.8470588, 1,
1.123824, 2.279875, -0.8927958, 1, 0, 0.8392157, 1,
1.124569, -0.9721134, 1.29817, 1, 0, 0.8352941, 1,
1.125946, 0.3660693, 1.880614, 1, 0, 0.827451, 1,
1.129596, 0.2127195, 0.9484378, 1, 0, 0.8235294, 1,
1.133572, -2.438659, 2.279622, 1, 0, 0.8156863, 1,
1.133595, -0.6248299, 1.399001, 1, 0, 0.8117647, 1,
1.142627, 0.4657148, 1.577835, 1, 0, 0.8039216, 1,
1.143386, -0.5821919, 1.857332, 1, 0, 0.7960784, 1,
1.149018, 1.196561, -0.197839, 1, 0, 0.7921569, 1,
1.158511, 1.33818, -0.4681151, 1, 0, 0.7843137, 1,
1.16817, 1.264528, 0.03351634, 1, 0, 0.7803922, 1,
1.172951, 1.759961, 1.708106, 1, 0, 0.772549, 1,
1.177614, 0.08984334, 1.18301, 1, 0, 0.7686275, 1,
1.204738, 0.5742568, 2.020084, 1, 0, 0.7607843, 1,
1.207985, -0.9150399, 3.017767, 1, 0, 0.7568628, 1,
1.212088, 1.723272, 0.79783, 1, 0, 0.7490196, 1,
1.21271, 1.941398, 1.736074, 1, 0, 0.7450981, 1,
1.215669, -0.3190903, 2.783219, 1, 0, 0.7372549, 1,
1.219349, 0.3865332, 2.186505, 1, 0, 0.7333333, 1,
1.221172, 1.709269, -0.9541981, 1, 0, 0.7254902, 1,
1.236036, -0.3364458, 1.800785, 1, 0, 0.7215686, 1,
1.240583, 0.4179012, -0.01874032, 1, 0, 0.7137255, 1,
1.255987, -0.6558116, 3.178107, 1, 0, 0.7098039, 1,
1.263528, 0.8416432, 1.280885, 1, 0, 0.7019608, 1,
1.264829, -0.5980397, 2.887207, 1, 0, 0.6941177, 1,
1.266765, 0.5356776, 2.023253, 1, 0, 0.6901961, 1,
1.269179, -0.01486086, 1.306345, 1, 0, 0.682353, 1,
1.283732, -0.9890195, 1.820887, 1, 0, 0.6784314, 1,
1.285648, 0.2424768, 1.167524, 1, 0, 0.6705883, 1,
1.288538, -0.1265564, 2.398246, 1, 0, 0.6666667, 1,
1.289095, 0.1524427, 2.296924, 1, 0, 0.6588235, 1,
1.292667, -1.061926, 0.7425033, 1, 0, 0.654902, 1,
1.307033, -0.5715261, 2.030843, 1, 0, 0.6470588, 1,
1.309542, 1.412136, 0.3235783, 1, 0, 0.6431373, 1,
1.314814, -0.3533618, 1.799695, 1, 0, 0.6352941, 1,
1.316513, 0.7126383, 2.221322, 1, 0, 0.6313726, 1,
1.317098, 0.9717433, 1.241616, 1, 0, 0.6235294, 1,
1.320279, 0.6021292, 0.2029716, 1, 0, 0.6196079, 1,
1.322806, 0.8738639, 0.8813085, 1, 0, 0.6117647, 1,
1.329174, 0.1865928, 3.198201, 1, 0, 0.6078432, 1,
1.334873, -0.2956105, 0.05499271, 1, 0, 0.6, 1,
1.335098, 0.64813, 1.870386, 1, 0, 0.5921569, 1,
1.343354, 1.818352, 0.1652838, 1, 0, 0.5882353, 1,
1.346973, 0.09125579, 0.2907654, 1, 0, 0.5803922, 1,
1.347394, -1.038698, 2.546296, 1, 0, 0.5764706, 1,
1.349113, 0.6446541, -0.3733222, 1, 0, 0.5686275, 1,
1.353261, 0.2476373, 1.662381, 1, 0, 0.5647059, 1,
1.356508, -0.6526833, 3.104842, 1, 0, 0.5568628, 1,
1.357799, -0.4836491, 1.873667, 1, 0, 0.5529412, 1,
1.370916, 0.3140509, 0.3704552, 1, 0, 0.5450981, 1,
1.372473, -0.2026157, 1.782635, 1, 0, 0.5411765, 1,
1.375461, 0.1619436, 0.5466573, 1, 0, 0.5333334, 1,
1.384893, 0.5181308, 2.546028, 1, 0, 0.5294118, 1,
1.394005, -1.509596, 1.287708, 1, 0, 0.5215687, 1,
1.398206, -2.831689, 2.957934, 1, 0, 0.5176471, 1,
1.398387, 2.512981, 1.849585, 1, 0, 0.509804, 1,
1.400459, -0.2608525, 1.615873, 1, 0, 0.5058824, 1,
1.416182, 1.127128, 0.1770708, 1, 0, 0.4980392, 1,
1.41702, -0.7081627, 0.7324403, 1, 0, 0.4901961, 1,
1.42417, -0.1016247, 1.580862, 1, 0, 0.4862745, 1,
1.437237, -0.3443042, 1.807427, 1, 0, 0.4784314, 1,
1.438922, 0.3921788, 2.016448, 1, 0, 0.4745098, 1,
1.448432, -0.4796583, 3.35908, 1, 0, 0.4666667, 1,
1.448855, -0.03954946, 1.818923, 1, 0, 0.4627451, 1,
1.451935, 1.247843, 1.89411, 1, 0, 0.454902, 1,
1.467845, 2.994912, 0.6815636, 1, 0, 0.4509804, 1,
1.474662, 0.01688917, 1.04529, 1, 0, 0.4431373, 1,
1.479481, 0.659946, 2.948391, 1, 0, 0.4392157, 1,
1.481051, 1.260816, 2.726669, 1, 0, 0.4313726, 1,
1.484632, -0.2937671, 2.644434, 1, 0, 0.427451, 1,
1.485686, -1.861922, 3.223448, 1, 0, 0.4196078, 1,
1.491749, -1.409877, 2.042927, 1, 0, 0.4156863, 1,
1.491789, -0.3871674, 1.584157, 1, 0, 0.4078431, 1,
1.500118, -1.289322, 2.967894, 1, 0, 0.4039216, 1,
1.508347, 0.4623769, 2.457927, 1, 0, 0.3960784, 1,
1.511877, -0.8504384, 2.557202, 1, 0, 0.3882353, 1,
1.519882, 0.3734802, 1.470263, 1, 0, 0.3843137, 1,
1.522691, 0.4482813, 1.372456, 1, 0, 0.3764706, 1,
1.549817, -0.2554203, 2.933663, 1, 0, 0.372549, 1,
1.550765, -0.9768077, 1.528267, 1, 0, 0.3647059, 1,
1.559617, 0.09848296, 2.446691, 1, 0, 0.3607843, 1,
1.562989, 1.341381, 0.07392514, 1, 0, 0.3529412, 1,
1.571308, -0.002473808, 1.685277, 1, 0, 0.3490196, 1,
1.574853, 0.1327051, 0.3726708, 1, 0, 0.3411765, 1,
1.578409, -1.147059, 1.546641, 1, 0, 0.3372549, 1,
1.595898, 2.181164, -0.8804339, 1, 0, 0.3294118, 1,
1.59782, 0.8645477, 0.9877135, 1, 0, 0.3254902, 1,
1.610318, -1.499322, 4.18664, 1, 0, 0.3176471, 1,
1.628883, 1.031248, 0.7036414, 1, 0, 0.3137255, 1,
1.635862, 0.1027115, 1.511293, 1, 0, 0.3058824, 1,
1.662812, 1.33229, -0.6223974, 1, 0, 0.2980392, 1,
1.664109, -1.935206, 2.136789, 1, 0, 0.2941177, 1,
1.669421, -0.5319631, 3.808457, 1, 0, 0.2862745, 1,
1.677613, -0.3224894, 2.707175, 1, 0, 0.282353, 1,
1.681085, -0.4685554, 0.8948331, 1, 0, 0.2745098, 1,
1.68204, -0.3063028, 1.826921, 1, 0, 0.2705882, 1,
1.68611, 0.9553661, 0.4842664, 1, 0, 0.2627451, 1,
1.697813, -2.45453, 2.851885, 1, 0, 0.2588235, 1,
1.699967, -1.439877, 5.251768, 1, 0, 0.2509804, 1,
1.721712, -0.3407983, 2.148905, 1, 0, 0.2470588, 1,
1.723487, 0.3164078, 1.96086, 1, 0, 0.2392157, 1,
1.733776, -1.222279, 3.2384, 1, 0, 0.2352941, 1,
1.751818, -0.3639621, 1.573135, 1, 0, 0.227451, 1,
1.775432, -0.1346453, 2.821007, 1, 0, 0.2235294, 1,
1.778545, 0.2684933, -0.3083387, 1, 0, 0.2156863, 1,
1.781309, 0.3455368, 1.388241, 1, 0, 0.2117647, 1,
1.805831, -1.633414, 2.085499, 1, 0, 0.2039216, 1,
1.811206, 0.5172857, 2.133543, 1, 0, 0.1960784, 1,
1.837192, -0.1324163, 3.480456, 1, 0, 0.1921569, 1,
1.840182, -0.1743067, 1.647348, 1, 0, 0.1843137, 1,
1.841392, -0.8322276, 1.301076, 1, 0, 0.1803922, 1,
1.841946, -1.169629, 2.151732, 1, 0, 0.172549, 1,
1.849783, 0.05948148, 0.7902275, 1, 0, 0.1686275, 1,
1.872828, -1.721337, 2.349587, 1, 0, 0.1607843, 1,
1.891299, -0.2484036, 0.2617107, 1, 0, 0.1568628, 1,
1.912357, 1.06884, 1.903097, 1, 0, 0.1490196, 1,
1.913846, -0.7124634, 0.7421363, 1, 0, 0.145098, 1,
1.958648, 1.826827, 1.451858, 1, 0, 0.1372549, 1,
1.991212, 0.6171346, 2.162904, 1, 0, 0.1333333, 1,
2.01393, -1.415664, 1.551501, 1, 0, 0.1254902, 1,
2.014834, 0.8761972, 3.032091, 1, 0, 0.1215686, 1,
2.019302, 1.297951, 0.9326665, 1, 0, 0.1137255, 1,
2.027597, -0.1092576, 1.677408, 1, 0, 0.1098039, 1,
2.067566, 0.4356058, 1.385438, 1, 0, 0.1019608, 1,
2.072485, -0.3641483, 2.575742, 1, 0, 0.09411765, 1,
2.082839, -0.2019313, 2.874744, 1, 0, 0.09019608, 1,
2.090957, 0.8278703, 1.766721, 1, 0, 0.08235294, 1,
2.097711, -1.594434, 2.67473, 1, 0, 0.07843138, 1,
2.169291, 1.739031, 0.1119907, 1, 0, 0.07058824, 1,
2.292508, -0.808381, 2.849433, 1, 0, 0.06666667, 1,
2.297817, 0.1559869, 2.905908, 1, 0, 0.05882353, 1,
2.300724, 1.213059, 1.648893, 1, 0, 0.05490196, 1,
2.323665, 0.7507609, 1.291647, 1, 0, 0.04705882, 1,
2.374021, -1.140254, 2.454876, 1, 0, 0.04313726, 1,
2.395916, -1.402987, 3.012657, 1, 0, 0.03529412, 1,
2.463988, 0.3972283, 0.8383361, 1, 0, 0.03137255, 1,
2.479851, -2.725346, 1.629191, 1, 0, 0.02352941, 1,
2.602551, -0.4816543, 2.334746, 1, 0, 0.01960784, 1,
2.846121, -0.4203802, 2.739854, 1, 0, 0.01176471, 1,
2.911722, 0.1346568, 1.665599, 1, 0, 0.007843138, 1
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
0.08176756, -4.261408, -8.035732, 0, -0.5, 0.5, 0.5,
0.08176756, -4.261408, -8.035732, 1, -0.5, 0.5, 0.5,
0.08176756, -4.261408, -8.035732, 1, 1.5, 0.5, 0.5,
0.08176756, -4.261408, -8.035732, 0, 1.5, 0.5, 0.5
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
-3.707542, 0.3437738, -8.035732, 0, -0.5, 0.5, 0.5,
-3.707542, 0.3437738, -8.035732, 1, -0.5, 0.5, 0.5,
-3.707542, 0.3437738, -8.035732, 1, 1.5, 0.5, 0.5,
-3.707542, 0.3437738, -8.035732, 0, 1.5, 0.5, 0.5
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
-3.707542, -4.261408, -0.07214928, 0, -0.5, 0.5, 0.5,
-3.707542, -4.261408, -0.07214928, 1, -0.5, 0.5, 0.5,
-3.707542, -4.261408, -0.07214928, 1, 1.5, 0.5, 0.5,
-3.707542, -4.261408, -0.07214928, 0, 1.5, 0.5, 0.5
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
-2, -3.198673, -6.197983,
2, -3.198673, -6.197983,
-2, -3.198673, -6.197983,
-2, -3.375796, -6.504274,
-1, -3.198673, -6.197983,
-1, -3.375796, -6.504274,
0, -3.198673, -6.197983,
0, -3.375796, -6.504274,
1, -3.198673, -6.197983,
1, -3.375796, -6.504274,
2, -3.198673, -6.197983,
2, -3.375796, -6.504274
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
-2, -3.730041, -7.116858, 0, -0.5, 0.5, 0.5,
-2, -3.730041, -7.116858, 1, -0.5, 0.5, 0.5,
-2, -3.730041, -7.116858, 1, 1.5, 0.5, 0.5,
-2, -3.730041, -7.116858, 0, 1.5, 0.5, 0.5,
-1, -3.730041, -7.116858, 0, -0.5, 0.5, 0.5,
-1, -3.730041, -7.116858, 1, -0.5, 0.5, 0.5,
-1, -3.730041, -7.116858, 1, 1.5, 0.5, 0.5,
-1, -3.730041, -7.116858, 0, 1.5, 0.5, 0.5,
0, -3.730041, -7.116858, 0, -0.5, 0.5, 0.5,
0, -3.730041, -7.116858, 1, -0.5, 0.5, 0.5,
0, -3.730041, -7.116858, 1, 1.5, 0.5, 0.5,
0, -3.730041, -7.116858, 0, 1.5, 0.5, 0.5,
1, -3.730041, -7.116858, 0, -0.5, 0.5, 0.5,
1, -3.730041, -7.116858, 1, -0.5, 0.5, 0.5,
1, -3.730041, -7.116858, 1, 1.5, 0.5, 0.5,
1, -3.730041, -7.116858, 0, 1.5, 0.5, 0.5,
2, -3.730041, -7.116858, 0, -0.5, 0.5, 0.5,
2, -3.730041, -7.116858, 1, -0.5, 0.5, 0.5,
2, -3.730041, -7.116858, 1, 1.5, 0.5, 0.5,
2, -3.730041, -7.116858, 0, 1.5, 0.5, 0.5
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
-2.833086, -3, -6.197983,
-2.833086, 3, -6.197983,
-2.833086, -3, -6.197983,
-2.978829, -3, -6.504274,
-2.833086, -2, -6.197983,
-2.978829, -2, -6.504274,
-2.833086, -1, -6.197983,
-2.978829, -1, -6.504274,
-2.833086, 0, -6.197983,
-2.978829, 0, -6.504274,
-2.833086, 1, -6.197983,
-2.978829, 1, -6.504274,
-2.833086, 2, -6.197983,
-2.978829, 2, -6.504274,
-2.833086, 3, -6.197983,
-2.978829, 3, -6.504274
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
-3.270314, -3, -7.116858, 0, -0.5, 0.5, 0.5,
-3.270314, -3, -7.116858, 1, -0.5, 0.5, 0.5,
-3.270314, -3, -7.116858, 1, 1.5, 0.5, 0.5,
-3.270314, -3, -7.116858, 0, 1.5, 0.5, 0.5,
-3.270314, -2, -7.116858, 0, -0.5, 0.5, 0.5,
-3.270314, -2, -7.116858, 1, -0.5, 0.5, 0.5,
-3.270314, -2, -7.116858, 1, 1.5, 0.5, 0.5,
-3.270314, -2, -7.116858, 0, 1.5, 0.5, 0.5,
-3.270314, -1, -7.116858, 0, -0.5, 0.5, 0.5,
-3.270314, -1, -7.116858, 1, -0.5, 0.5, 0.5,
-3.270314, -1, -7.116858, 1, 1.5, 0.5, 0.5,
-3.270314, -1, -7.116858, 0, 1.5, 0.5, 0.5,
-3.270314, 0, -7.116858, 0, -0.5, 0.5, 0.5,
-3.270314, 0, -7.116858, 1, -0.5, 0.5, 0.5,
-3.270314, 0, -7.116858, 1, 1.5, 0.5, 0.5,
-3.270314, 0, -7.116858, 0, 1.5, 0.5, 0.5,
-3.270314, 1, -7.116858, 0, -0.5, 0.5, 0.5,
-3.270314, 1, -7.116858, 1, -0.5, 0.5, 0.5,
-3.270314, 1, -7.116858, 1, 1.5, 0.5, 0.5,
-3.270314, 1, -7.116858, 0, 1.5, 0.5, 0.5,
-3.270314, 2, -7.116858, 0, -0.5, 0.5, 0.5,
-3.270314, 2, -7.116858, 1, -0.5, 0.5, 0.5,
-3.270314, 2, -7.116858, 1, 1.5, 0.5, 0.5,
-3.270314, 2, -7.116858, 0, 1.5, 0.5, 0.5,
-3.270314, 3, -7.116858, 0, -0.5, 0.5, 0.5,
-3.270314, 3, -7.116858, 1, -0.5, 0.5, 0.5,
-3.270314, 3, -7.116858, 1, 1.5, 0.5, 0.5,
-3.270314, 3, -7.116858, 0, 1.5, 0.5, 0.5
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
-2.833086, -3.198673, -6,
-2.833086, -3.198673, 4,
-2.833086, -3.198673, -6,
-2.978829, -3.375796, -6,
-2.833086, -3.198673, -4,
-2.978829, -3.375796, -4,
-2.833086, -3.198673, -2,
-2.978829, -3.375796, -2,
-2.833086, -3.198673, 0,
-2.978829, -3.375796, 0,
-2.833086, -3.198673, 2,
-2.978829, -3.375796, 2,
-2.833086, -3.198673, 4,
-2.978829, -3.375796, 4
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
-3.270314, -3.730041, -6, 0, -0.5, 0.5, 0.5,
-3.270314, -3.730041, -6, 1, -0.5, 0.5, 0.5,
-3.270314, -3.730041, -6, 1, 1.5, 0.5, 0.5,
-3.270314, -3.730041, -6, 0, 1.5, 0.5, 0.5,
-3.270314, -3.730041, -4, 0, -0.5, 0.5, 0.5,
-3.270314, -3.730041, -4, 1, -0.5, 0.5, 0.5,
-3.270314, -3.730041, -4, 1, 1.5, 0.5, 0.5,
-3.270314, -3.730041, -4, 0, 1.5, 0.5, 0.5,
-3.270314, -3.730041, -2, 0, -0.5, 0.5, 0.5,
-3.270314, -3.730041, -2, 1, -0.5, 0.5, 0.5,
-3.270314, -3.730041, -2, 1, 1.5, 0.5, 0.5,
-3.270314, -3.730041, -2, 0, 1.5, 0.5, 0.5,
-3.270314, -3.730041, 0, 0, -0.5, 0.5, 0.5,
-3.270314, -3.730041, 0, 1, -0.5, 0.5, 0.5,
-3.270314, -3.730041, 0, 1, 1.5, 0.5, 0.5,
-3.270314, -3.730041, 0, 0, 1.5, 0.5, 0.5,
-3.270314, -3.730041, 2, 0, -0.5, 0.5, 0.5,
-3.270314, -3.730041, 2, 1, -0.5, 0.5, 0.5,
-3.270314, -3.730041, 2, 1, 1.5, 0.5, 0.5,
-3.270314, -3.730041, 2, 0, 1.5, 0.5, 0.5,
-3.270314, -3.730041, 4, 0, -0.5, 0.5, 0.5,
-3.270314, -3.730041, 4, 1, -0.5, 0.5, 0.5,
-3.270314, -3.730041, 4, 1, 1.5, 0.5, 0.5,
-3.270314, -3.730041, 4, 0, 1.5, 0.5, 0.5
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
-2.833086, -3.198673, -6.197983,
-2.833086, 3.886221, -6.197983,
-2.833086, -3.198673, 6.053684,
-2.833086, 3.886221, 6.053684,
-2.833086, -3.198673, -6.197983,
-2.833086, -3.198673, 6.053684,
-2.833086, 3.886221, -6.197983,
-2.833086, 3.886221, 6.053684,
-2.833086, -3.198673, -6.197983,
2.996621, -3.198673, -6.197983,
-2.833086, -3.198673, 6.053684,
2.996621, -3.198673, 6.053684,
-2.833086, 3.886221, -6.197983,
2.996621, 3.886221, -6.197983,
-2.833086, 3.886221, 6.053684,
2.996621, 3.886221, 6.053684,
2.996621, -3.198673, -6.197983,
2.996621, 3.886221, -6.197983,
2.996621, -3.198673, 6.053684,
2.996621, 3.886221, 6.053684,
2.996621, -3.198673, -6.197983,
2.996621, -3.198673, 6.053684,
2.996621, 3.886221, -6.197983,
2.996621, 3.886221, 6.053684
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
var radius = 8.173297;
var distance = 36.36392;
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
mvMatrix.translate( -0.08176756, -0.3437738, 0.07214928 );
mvMatrix.scale( 1.515879, 1.24732, 0.7213002 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.36392);
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
chlorsulfuron<-read.table("chlorsulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorsulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorsulfuron' not found
```

```r
y<-chlorsulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorsulfuron' not found
```

```r
z<-chlorsulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorsulfuron' not found
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
-2.748187, -1.758354, -3.688215, 0, 0, 1, 1, 1,
-2.631933, -0.1353012, 0.02893369, 1, 0, 0, 1, 1,
-2.50857, -0.2425931, -1.481883, 1, 0, 0, 1, 1,
-2.48342, 0.2650509, -0.7688619, 1, 0, 0, 1, 1,
-2.465588, -0.1678682, -1.640626, 1, 0, 0, 1, 1,
-2.450714, 0.9102567, -1.565426, 1, 0, 0, 1, 1,
-2.432066, 1.419074, -0.4672073, 0, 0, 0, 1, 1,
-2.424816, -1.127298, -4.154606, 0, 0, 0, 1, 1,
-2.414962, -0.8444791, -1.908675, 0, 0, 0, 1, 1,
-2.405032, -1.128656, -1.421082, 0, 0, 0, 1, 1,
-2.390611, 0.5245914, -2.428981, 0, 0, 0, 1, 1,
-2.38418, 0.8213832, -0.5326486, 0, 0, 0, 1, 1,
-2.344043, -0.6139478, -1.071137, 0, 0, 0, 1, 1,
-2.297958, -0.3813731, -1.655374, 1, 1, 1, 1, 1,
-2.257994, 0.005094218, -1.700078, 1, 1, 1, 1, 1,
-2.24283, -0.6306624, -1.676875, 1, 1, 1, 1, 1,
-2.124081, 1.566373, 1.032443, 1, 1, 1, 1, 1,
-2.107701, -0.1545192, -3.181305, 1, 1, 1, 1, 1,
-2.050605, 0.02128702, -2.419365, 1, 1, 1, 1, 1,
-2.042268, 0.5088558, -1.099215, 1, 1, 1, 1, 1,
-2.0007, 0.08258227, -3.602702, 1, 1, 1, 1, 1,
-1.988419, 1.596872, -1.030676, 1, 1, 1, 1, 1,
-1.956867, -0.04390623, -2.358239, 1, 1, 1, 1, 1,
-1.88479, 1.214584, -0.1854886, 1, 1, 1, 1, 1,
-1.875278, -1.123159, -0.9300616, 1, 1, 1, 1, 1,
-1.871186, 1.046197, -0.8464991, 1, 1, 1, 1, 1,
-1.863215, -1.920064, -2.152572, 1, 1, 1, 1, 1,
-1.821629, 0.9921328, -2.697631, 1, 1, 1, 1, 1,
-1.819894, 1.644541, -1.944091, 0, 0, 1, 1, 1,
-1.807844, 0.7564492, -2.043535, 1, 0, 0, 1, 1,
-1.800363, -0.9240587, -3.890131, 1, 0, 0, 1, 1,
-1.794683, -1.030721, -1.908488, 1, 0, 0, 1, 1,
-1.759839, -0.1188087, -2.539752, 1, 0, 0, 1, 1,
-1.757746, 0.05041374, -1.680284, 1, 0, 0, 1, 1,
-1.752624, -0.5306976, -1.311512, 0, 0, 0, 1, 1,
-1.730185, -0.7631711, -2.825359, 0, 0, 0, 1, 1,
-1.725709, 2.711859, -2.026478, 0, 0, 0, 1, 1,
-1.718467, 0.5708272, -1.197191, 0, 0, 0, 1, 1,
-1.704045, 0.2607706, -0.3282225, 0, 0, 0, 1, 1,
-1.697429, -0.792827, -1.042351, 0, 0, 0, 1, 1,
-1.694486, 0.9528069, -0.8661073, 0, 0, 0, 1, 1,
-1.679553, 1.102344, -0.9114316, 1, 1, 1, 1, 1,
-1.676082, 0.1894097, -2.979705, 1, 1, 1, 1, 1,
-1.657659, 1.185112, 0.1997868, 1, 1, 1, 1, 1,
-1.638336, 1.688636, -1.893465, 1, 1, 1, 1, 1,
-1.634547, 0.1599302, -3.199287, 1, 1, 1, 1, 1,
-1.628375, -0.3962873, -0.5054029, 1, 1, 1, 1, 1,
-1.617942, -0.8356456, -2.352912, 1, 1, 1, 1, 1,
-1.616054, -0.03909732, -1.928772, 1, 1, 1, 1, 1,
-1.601455, -0.09504288, -1.984098, 1, 1, 1, 1, 1,
-1.588052, 1.014091, -1.109601, 1, 1, 1, 1, 1,
-1.576209, 0.912287, -1.107505, 1, 1, 1, 1, 1,
-1.571877, 0.1139734, -0.6443946, 1, 1, 1, 1, 1,
-1.565347, 0.7896272, -0.05943677, 1, 1, 1, 1, 1,
-1.547, 1.597329, -2.468352, 1, 1, 1, 1, 1,
-1.544183, 0.4456055, -2.742384, 1, 1, 1, 1, 1,
-1.538958, -0.4779794, -0.8792664, 0, 0, 1, 1, 1,
-1.530476, -1.713233, -1.83152, 1, 0, 0, 1, 1,
-1.501759, 0.01571394, -2.658895, 1, 0, 0, 1, 1,
-1.494941, -0.5999552, -1.613898, 1, 0, 0, 1, 1,
-1.48821, 0.3405228, -1.243764, 1, 0, 0, 1, 1,
-1.472575, -0.2257809, -1.722812, 1, 0, 0, 1, 1,
-1.46395, 1.701155, 0.1330799, 0, 0, 0, 1, 1,
-1.462741, 1.38045, -0.2679521, 0, 0, 0, 1, 1,
-1.453137, 1.805104, -1.206344, 0, 0, 0, 1, 1,
-1.43725, 0.959802, -1.421628, 0, 0, 0, 1, 1,
-1.428703, 0.4178278, -2.481261, 0, 0, 0, 1, 1,
-1.426311, -0.8729138, -3.114433, 0, 0, 0, 1, 1,
-1.410707, 0.67277, -0.9538465, 0, 0, 0, 1, 1,
-1.406191, 0.8801742, -1.557346, 1, 1, 1, 1, 1,
-1.403457, -0.9533393, -0.4500726, 1, 1, 1, 1, 1,
-1.397278, 0.9160679, -1.810388, 1, 1, 1, 1, 1,
-1.390497, 0.09250426, -0.4553336, 1, 1, 1, 1, 1,
-1.389259, -1.701226, -2.31674, 1, 1, 1, 1, 1,
-1.37841, -0.5180346, -2.483569, 1, 1, 1, 1, 1,
-1.372586, -0.3880076, -1.417818, 1, 1, 1, 1, 1,
-1.35963, 3.059482, -0.3291505, 1, 1, 1, 1, 1,
-1.35821, 0.4341106, -2.053299, 1, 1, 1, 1, 1,
-1.353738, 0.7399205, -0.2528592, 1, 1, 1, 1, 1,
-1.353405, 0.5847201, -2.102509, 1, 1, 1, 1, 1,
-1.353299, -0.2317712, -2.773599, 1, 1, 1, 1, 1,
-1.34655, -0.9217882, -5.570339, 1, 1, 1, 1, 1,
-1.335377, -2.02902, -2.065272, 1, 1, 1, 1, 1,
-1.329594, 0.5057886, -2.157101, 1, 1, 1, 1, 1,
-1.31827, 0.1309773, -0.4522134, 0, 0, 1, 1, 1,
-1.311985, 0.008593843, -0.9313409, 1, 0, 0, 1, 1,
-1.309336, 1.450353, -0.3551175, 1, 0, 0, 1, 1,
-1.297787, -0.006821855, -0.5245146, 1, 0, 0, 1, 1,
-1.295589, -0.8367869, -1.152023, 1, 0, 0, 1, 1,
-1.293665, 0.3599347, -2.227267, 1, 0, 0, 1, 1,
-1.289943, -0.6391932, 0.1087625, 0, 0, 0, 1, 1,
-1.270173, 1.506346, 0.1141954, 0, 0, 0, 1, 1,
-1.26707, 0.5646519, -1.031219, 0, 0, 0, 1, 1,
-1.252877, 1.047231, -1.715387, 0, 0, 0, 1, 1,
-1.240422, 0.1264767, -2.364823, 0, 0, 0, 1, 1,
-1.240257, -0.3887814, -2.849253, 0, 0, 0, 1, 1,
-1.233436, 0.7014546, -1.044185, 0, 0, 0, 1, 1,
-1.226581, -0.3238559, -3.513988, 1, 1, 1, 1, 1,
-1.218385, 1.495806, -0.2561782, 1, 1, 1, 1, 1,
-1.212465, 0.8176441, -0.8867605, 1, 1, 1, 1, 1,
-1.200554, -0.01567322, -0.4996781, 1, 1, 1, 1, 1,
-1.198843, 0.5867243, -2.006307, 1, 1, 1, 1, 1,
-1.192222, -1.176156, -2.044071, 1, 1, 1, 1, 1,
-1.182775, 0.1147917, -1.630851, 1, 1, 1, 1, 1,
-1.182494, -0.546231, -1.674653, 1, 1, 1, 1, 1,
-1.179971, -1.355014, -2.738971, 1, 1, 1, 1, 1,
-1.168341, -0.0804346, -2.908803, 1, 1, 1, 1, 1,
-1.164002, -0.8049098, -1.884578, 1, 1, 1, 1, 1,
-1.161934, -1.555158, -0.8564445, 1, 1, 1, 1, 1,
-1.159792, 0.0773357, -0.8645169, 1, 1, 1, 1, 1,
-1.156737, -0.03728509, -1.75454, 1, 1, 1, 1, 1,
-1.145461, 0.05394838, 0.9298037, 1, 1, 1, 1, 1,
-1.140995, 1.108315, -2.72516, 0, 0, 1, 1, 1,
-1.14088, -1.289333, -2.952036, 1, 0, 0, 1, 1,
-1.132033, 2.067052, -1.63888, 1, 0, 0, 1, 1,
-1.130871, -0.05021079, -0.1158154, 1, 0, 0, 1, 1,
-1.1236, 0.04261051, -0.7429978, 1, 0, 0, 1, 1,
-1.121557, -1.646245, -3.187873, 1, 0, 0, 1, 1,
-1.120357, 0.2244105, 0.07866166, 0, 0, 0, 1, 1,
-1.103717, -1.596924, -1.241394, 0, 0, 0, 1, 1,
-1.094513, -1.812213, -3.588617, 0, 0, 0, 1, 1,
-1.093059, -0.9731612, -1.16619, 0, 0, 0, 1, 1,
-1.083294, -1.302196, -2.36638, 0, 0, 0, 1, 1,
-1.081431, -0.2349413, -1.101669, 0, 0, 0, 1, 1,
-1.056705, 0.0892784, -0.5648257, 0, 0, 0, 1, 1,
-1.049209, 0.4238205, -0.6216273, 1, 1, 1, 1, 1,
-1.047636, -2.497035, -3.749458, 1, 1, 1, 1, 1,
-1.045544, 0.2621312, -1.653613, 1, 1, 1, 1, 1,
-1.045349, -1.783189, -1.240106, 1, 1, 1, 1, 1,
-1.037697, -0.3735386, -1.199337, 1, 1, 1, 1, 1,
-1.03619, 1.296962, -0.5447215, 1, 1, 1, 1, 1,
-1.034111, 0.07728815, -1.471667, 1, 1, 1, 1, 1,
-1.033297, -2.77238e-05, -0.01325568, 1, 1, 1, 1, 1,
-1.028432, 1.138401, 1.178869, 1, 1, 1, 1, 1,
-1.024946, -0.8626367, -1.045143, 1, 1, 1, 1, 1,
-1.023875, 0.08841918, -1.168322, 1, 1, 1, 1, 1,
-1.020184, -0.003709022, -1.824371, 1, 1, 1, 1, 1,
-1.014583, 0.3118254, -0.2154372, 1, 1, 1, 1, 1,
-1.009681, -0.696043, -2.387039, 1, 1, 1, 1, 1,
-0.9983891, -0.2639026, -1.16526, 1, 1, 1, 1, 1,
-0.9929806, 0.1750986, -1.767871, 0, 0, 1, 1, 1,
-0.9896805, -1.306162, -2.068677, 1, 0, 0, 1, 1,
-0.9888651, -0.06735156, -0.8374455, 1, 0, 0, 1, 1,
-0.9886297, -1.486554, -3.213172, 1, 0, 0, 1, 1,
-0.9878963, -0.372085, -0.5827119, 1, 0, 0, 1, 1,
-0.983896, -0.5415915, -2.238717, 1, 0, 0, 1, 1,
-0.9838405, 1.386211, -0.2109742, 0, 0, 0, 1, 1,
-0.9828038, 1.296101, 0.5428337, 0, 0, 0, 1, 1,
-0.9815484, -0.8256375, -1.893131, 0, 0, 0, 1, 1,
-0.9703141, 0.8971791, 1.132694, 0, 0, 0, 1, 1,
-0.966695, 0.4586637, -1.702063, 0, 0, 0, 1, 1,
-0.9552499, 0.09265108, -1.611444, 0, 0, 0, 1, 1,
-0.9521774, 0.2084513, -1.996227, 0, 0, 0, 1, 1,
-0.9521729, -1.189335, -0.5788425, 1, 1, 1, 1, 1,
-0.9507346, -1.326252, -3.988304, 1, 1, 1, 1, 1,
-0.9499874, 1.051332, 0.3096891, 1, 1, 1, 1, 1,
-0.9491441, -0.04226092, -1.729258, 1, 1, 1, 1, 1,
-0.9457796, -1.699736, -2.008754, 1, 1, 1, 1, 1,
-0.9360129, 1.268443, 0.1955292, 1, 1, 1, 1, 1,
-0.9352071, -0.6215545, -3.838576, 1, 1, 1, 1, 1,
-0.9318333, 1.349211, -1.109343, 1, 1, 1, 1, 1,
-0.928363, 0.2948849, -2.730572, 1, 1, 1, 1, 1,
-0.9261224, -0.1900664, -1.168971, 1, 1, 1, 1, 1,
-0.9225416, 0.6097514, -1.461819, 1, 1, 1, 1, 1,
-0.922332, 0.4938993, -1.645808, 1, 1, 1, 1, 1,
-0.9208924, 1.052961, -1.706564, 1, 1, 1, 1, 1,
-0.92075, 0.4554309, 0.4385678, 1, 1, 1, 1, 1,
-0.9191444, -0.3304214, -1.421262, 1, 1, 1, 1, 1,
-0.9175672, 1.018859, -0.1288061, 0, 0, 1, 1, 1,
-0.9154164, 0.8186877, -4.003181, 1, 0, 0, 1, 1,
-0.9114626, -2.407169, -2.618692, 1, 0, 0, 1, 1,
-0.903621, 1.110769, -0.7049507, 1, 0, 0, 1, 1,
-0.8983352, -0.6619275, -2.863212, 1, 0, 0, 1, 1,
-0.8964137, -0.8386073, -2.911712, 1, 0, 0, 1, 1,
-0.8948244, 0.5072073, -1.727437, 0, 0, 0, 1, 1,
-0.886596, -1.207574, -3.304507, 0, 0, 0, 1, 1,
-0.8785962, 1.211459, -1.57508, 0, 0, 0, 1, 1,
-0.8720136, 1.355451, 0.6210625, 0, 0, 0, 1, 1,
-0.8691604, 0.4190188, -1.433459, 0, 0, 0, 1, 1,
-0.8662233, -2.590553, -1.820402, 0, 0, 0, 1, 1,
-0.865258, 0.4013019, -2.826752, 0, 0, 0, 1, 1,
-0.8598387, -0.8024219, -1.511359, 1, 1, 1, 1, 1,
-0.8575074, 0.2673725, -1.501216, 1, 1, 1, 1, 1,
-0.8568397, -0.4554993, -2.600432, 1, 1, 1, 1, 1,
-0.8542396, 0.2016503, -0.2614941, 1, 1, 1, 1, 1,
-0.8537086, 0.3001918, 1.225013, 1, 1, 1, 1, 1,
-0.8441023, 2.341854, -0.2168786, 1, 1, 1, 1, 1,
-0.8399926, 1.262902, -0.01248076, 1, 1, 1, 1, 1,
-0.836588, 1.568739, -2.001727, 1, 1, 1, 1, 1,
-0.8359753, -1.501176, -2.748038, 1, 1, 1, 1, 1,
-0.8200927, -0.5088092, -3.06434, 1, 1, 1, 1, 1,
-0.8191851, 1.325248, 0.1083627, 1, 1, 1, 1, 1,
-0.8083124, 0.1468766, -1.432215, 1, 1, 1, 1, 1,
-0.8028767, 0.2210534, -1.85584, 1, 1, 1, 1, 1,
-0.8010398, 0.7548469, -0.8570477, 1, 1, 1, 1, 1,
-0.792107, -0.7892929, -2.320427, 1, 1, 1, 1, 1,
-0.7885684, -0.6738996, -2.12358, 0, 0, 1, 1, 1,
-0.7863536, -0.6393515, -1.891444, 1, 0, 0, 1, 1,
-0.7855991, 1.028143, -0.1881477, 1, 0, 0, 1, 1,
-0.7795048, -0.3985194, -1.681843, 1, 0, 0, 1, 1,
-0.776799, 1.061343, -1.553493, 1, 0, 0, 1, 1,
-0.7765192, 0.626294, -0.7203535, 1, 0, 0, 1, 1,
-0.772807, 0.9615039, 0.4884996, 0, 0, 0, 1, 1,
-0.7711033, 0.7770007, 1.305981, 0, 0, 0, 1, 1,
-0.7690832, 0.03026907, -1.379793, 0, 0, 0, 1, 1,
-0.7640727, 0.6257129, -1.152695, 0, 0, 0, 1, 1,
-0.7625306, -0.3100707, -1.309554, 0, 0, 0, 1, 1,
-0.7611088, 1.791189, 0.3400795, 0, 0, 0, 1, 1,
-0.7579371, 1.077037, -0.9596238, 0, 0, 0, 1, 1,
-0.750646, -0.4879062, -0.7416201, 1, 1, 1, 1, 1,
-0.7414759, -0.6091636, -1.495496, 1, 1, 1, 1, 1,
-0.7404185, 0.3043444, -1.114375, 1, 1, 1, 1, 1,
-0.7271016, -0.3688878, -2.133984, 1, 1, 1, 1, 1,
-0.7255415, -0.9040247, -2.345637, 1, 1, 1, 1, 1,
-0.7234701, 1.772197, -0.5688297, 1, 1, 1, 1, 1,
-0.7207241, 0.9045506, -0.9024462, 1, 1, 1, 1, 1,
-0.7198673, -0.6504957, -4.512136, 1, 1, 1, 1, 1,
-0.7186056, 1.411487, -1.411951, 1, 1, 1, 1, 1,
-0.7152582, 0.002684009, -2.635574, 1, 1, 1, 1, 1,
-0.7134022, 0.6318887, -1.415313, 1, 1, 1, 1, 1,
-0.7127597, 0.2311942, -1.233168, 1, 1, 1, 1, 1,
-0.7119549, -1.165607, -2.755128, 1, 1, 1, 1, 1,
-0.7097164, 0.7617549, -2.260084, 1, 1, 1, 1, 1,
-0.708985, 0.2373098, -2.043573, 1, 1, 1, 1, 1,
-0.7082487, 0.6364487, -2.829844, 0, 0, 1, 1, 1,
-0.7078129, -2.226537, -1.627262, 1, 0, 0, 1, 1,
-0.7077981, -0.4210274, -3.092489, 1, 0, 0, 1, 1,
-0.7051832, -0.2206873, -1.650753, 1, 0, 0, 1, 1,
-0.7033121, 1.48552, 0.1079518, 1, 0, 0, 1, 1,
-0.7015941, 0.8873947, -0.5129097, 1, 0, 0, 1, 1,
-0.7011686, 0.8743985, -0.05756855, 0, 0, 0, 1, 1,
-0.6958988, 0.8102698, -0.7526315, 0, 0, 0, 1, 1,
-0.6932743, -0.1056804, -2.511625, 0, 0, 0, 1, 1,
-0.6929839, 0.5687427, -1.572777, 0, 0, 0, 1, 1,
-0.6830515, 2.309828, -0.1913585, 0, 0, 0, 1, 1,
-0.6801908, 0.9222028, -1.481319, 0, 0, 0, 1, 1,
-0.6790541, 0.5207475, -2.695516, 0, 0, 0, 1, 1,
-0.673646, -0.3539789, -1.448982, 1, 1, 1, 1, 1,
-0.6641414, -1.437862, -2.381021, 1, 1, 1, 1, 1,
-0.6638011, 1.177478, -0.2050687, 1, 1, 1, 1, 1,
-0.6592151, -0.227922, -1.770334, 1, 1, 1, 1, 1,
-0.6500806, 0.0004214603, -1.571373, 1, 1, 1, 1, 1,
-0.643282, 0.6110479, -1.551158, 1, 1, 1, 1, 1,
-0.6406702, 1.278942, -1.071561, 1, 1, 1, 1, 1,
-0.6357154, 0.4294642, -0.4348401, 1, 1, 1, 1, 1,
-0.6325732, 1.139386, 0.6402059, 1, 1, 1, 1, 1,
-0.6316358, -0.766266, -1.474857, 1, 1, 1, 1, 1,
-0.6302462, -0.2089483, -0.5244279, 1, 1, 1, 1, 1,
-0.6245649, 1.683467, -2.314313, 1, 1, 1, 1, 1,
-0.6163173, -0.3060538, -1.375658, 1, 1, 1, 1, 1,
-0.6096427, 0.02733281, -2.488283, 1, 1, 1, 1, 1,
-0.609259, -0.4208766, -3.616179, 1, 1, 1, 1, 1,
-0.6053191, 1.133633, -1.714847, 0, 0, 1, 1, 1,
-0.5993006, -0.4399932, -3.1034, 1, 0, 0, 1, 1,
-0.5944365, 1.811694, 0.4957169, 1, 0, 0, 1, 1,
-0.5931117, -0.04778977, -2.550664, 1, 0, 0, 1, 1,
-0.5916268, 1.674444, -0.006002244, 1, 0, 0, 1, 1,
-0.5884436, 0.6132142, -1.365243, 1, 0, 0, 1, 1,
-0.5869634, -1.493826, -0.9115291, 0, 0, 0, 1, 1,
-0.5815347, -1.188401, -2.04991, 0, 0, 0, 1, 1,
-0.5795726, 3.783043, 0.1387483, 0, 0, 0, 1, 1,
-0.5716496, -0.2244379, -2.080158, 0, 0, 0, 1, 1,
-0.5708782, -1.039283, -2.843437, 0, 0, 0, 1, 1,
-0.5690801, -0.1042642, -1.902744, 0, 0, 0, 1, 1,
-0.5681227, -1.143898, -2.143096, 0, 0, 0, 1, 1,
-0.5662784, 0.8843899, 0.1479202, 1, 1, 1, 1, 1,
-0.5645868, -0.2821496, -3.16411, 1, 1, 1, 1, 1,
-0.5619109, 0.8630243, 1.48962, 1, 1, 1, 1, 1,
-0.5619007, -1.225262, -2.507494, 1, 1, 1, 1, 1,
-0.5595056, -0.6173961, -1.871877, 1, 1, 1, 1, 1,
-0.5585595, 1.492659, -0.6569853, 1, 1, 1, 1, 1,
-0.5547265, -0.3413639, -2.652938, 1, 1, 1, 1, 1,
-0.5544698, -1.472628, -1.865588, 1, 1, 1, 1, 1,
-0.5518674, 0.3885408, -1.752365, 1, 1, 1, 1, 1,
-0.5513446, 0.4395731, -1.889597, 1, 1, 1, 1, 1,
-0.5501368, -0.9681609, -3.995673, 1, 1, 1, 1, 1,
-0.547312, -0.8219085, -2.240765, 1, 1, 1, 1, 1,
-0.5464007, 1.485316, 0.1621753, 1, 1, 1, 1, 1,
-0.5454138, -0.9398559, -2.309899, 1, 1, 1, 1, 1,
-0.5431846, -0.7231092, -3.478955, 1, 1, 1, 1, 1,
-0.5413867, 0.6430181, -1.614187, 0, 0, 1, 1, 1,
-0.5408587, 1.389888, -1.184226, 1, 0, 0, 1, 1,
-0.537113, -1.107059, -3.156769, 1, 0, 0, 1, 1,
-0.5353309, -1.078524, -2.08249, 1, 0, 0, 1, 1,
-0.5302831, 0.6807563, -1.224984, 1, 0, 0, 1, 1,
-0.5300275, 0.3852064, -0.427579, 1, 0, 0, 1, 1,
-0.5277451, -0.3530676, -3.470285, 0, 0, 0, 1, 1,
-0.524513, 1.054664, 1.455422, 0, 0, 0, 1, 1,
-0.5175386, 0.4073758, -0.2915996, 0, 0, 0, 1, 1,
-0.5148916, -0.1760318, -1.015859, 0, 0, 0, 1, 1,
-0.5099275, -1.703098, -2.323024, 0, 0, 0, 1, 1,
-0.509046, -2.008294, -2.13529, 0, 0, 0, 1, 1,
-0.5079583, 0.8096575, 0.1636848, 0, 0, 0, 1, 1,
-0.5014817, -1.167881, -2.107059, 1, 1, 1, 1, 1,
-0.4996046, 0.8710307, -0.9339176, 1, 1, 1, 1, 1,
-0.4981214, 0.9689062, -0.840076, 1, 1, 1, 1, 1,
-0.4929749, 0.3640476, -2.380162, 1, 1, 1, 1, 1,
-0.4904937, 1.450107, 0.3514515, 1, 1, 1, 1, 1,
-0.4891887, -0.2559728, -2.797868, 1, 1, 1, 1, 1,
-0.4831905, 0.3745438, -2.326497, 1, 1, 1, 1, 1,
-0.482133, 1.760056, 0.08795749, 1, 1, 1, 1, 1,
-0.4795623, -0.7008848, -2.043922, 1, 1, 1, 1, 1,
-0.4787285, 0.2264849, -2.788095, 1, 1, 1, 1, 1,
-0.4781725, -1.347576, -3.67893, 1, 1, 1, 1, 1,
-0.4725956, -0.0975089, -1.423597, 1, 1, 1, 1, 1,
-0.4712067, -1.041114, -2.140873, 1, 1, 1, 1, 1,
-0.4683141, -1.803644, -1.770651, 1, 1, 1, 1, 1,
-0.4573661, 0.007970153, -1.208872, 1, 1, 1, 1, 1,
-0.4519199, -0.3827884, -1.362535, 0, 0, 1, 1, 1,
-0.450369, -0.5880445, -2.147531, 1, 0, 0, 1, 1,
-0.4450534, 0.6463584, -0.07271579, 1, 0, 0, 1, 1,
-0.4412765, -1.243168, -1.877801, 1, 0, 0, 1, 1,
-0.4369798, -0.4459329, -2.669855, 1, 0, 0, 1, 1,
-0.4326692, 0.07906026, -0.5282892, 1, 0, 0, 1, 1,
-0.4320996, -0.4199134, -1.562643, 0, 0, 0, 1, 1,
-0.4311599, 0.1315671, -0.9480368, 0, 0, 0, 1, 1,
-0.4271732, 0.3393044, -0.7788777, 0, 0, 0, 1, 1,
-0.4250752, -2.204081, -4.026751, 0, 0, 0, 1, 1,
-0.4215454, 0.03571929, -2.614569, 0, 0, 0, 1, 1,
-0.4148298, 1.595852, -1.607428, 0, 0, 0, 1, 1,
-0.4142385, 1.625769, -0.7069376, 0, 0, 0, 1, 1,
-0.41204, -0.4070309, -1.78011, 1, 1, 1, 1, 1,
-0.411454, 0.7613159, -0.8447462, 1, 1, 1, 1, 1,
-0.4098473, 0.7463569, -0.5569073, 1, 1, 1, 1, 1,
-0.4092585, 1.328089, -1.092196, 1, 1, 1, 1, 1,
-0.4034501, -1.372295, -2.955102, 1, 1, 1, 1, 1,
-0.3997402, 1.515233, -0.8517208, 1, 1, 1, 1, 1,
-0.3996297, 1.427231, 0.2240723, 1, 1, 1, 1, 1,
-0.3964487, 0.6194785, -1.508977, 1, 1, 1, 1, 1,
-0.3886256, 0.5396773, 0.8104249, 1, 1, 1, 1, 1,
-0.3885851, -0.3311305, -1.275247, 1, 1, 1, 1, 1,
-0.3885022, 0.7524784, -1.441803, 1, 1, 1, 1, 1,
-0.3873435, -0.9485265, -1.784254, 1, 1, 1, 1, 1,
-0.3872883, 1.58657, -2.639993, 1, 1, 1, 1, 1,
-0.3770921, 0.9970822, -0.9078743, 1, 1, 1, 1, 1,
-0.3735268, -0.08934801, -1.001089, 1, 1, 1, 1, 1,
-0.3715445, 0.09352519, -0.5261056, 0, 0, 1, 1, 1,
-0.3706662, -0.7673315, -2.6944, 1, 0, 0, 1, 1,
-0.3691014, 0.7840489, -1.772038, 1, 0, 0, 1, 1,
-0.3689449, -0.2765104, -1.777331, 1, 0, 0, 1, 1,
-0.3670534, -1.2666, -2.58805, 1, 0, 0, 1, 1,
-0.3668243, 0.9996725, -1.490367, 1, 0, 0, 1, 1,
-0.3599159, -0.1572852, -2.33128, 0, 0, 0, 1, 1,
-0.3585408, 0.06072508, -2.081413, 0, 0, 0, 1, 1,
-0.3578741, 0.0577762, -1.69751, 0, 0, 0, 1, 1,
-0.3569832, 1.298626, -1.416997, 0, 0, 0, 1, 1,
-0.3567357, 2.580752, -0.5832545, 0, 0, 0, 1, 1,
-0.3507158, 0.8033005, -1.830569, 0, 0, 0, 1, 1,
-0.350144, 0.836825, 0.8671427, 0, 0, 0, 1, 1,
-0.3478319, 1.875428, 0.534883, 1, 1, 1, 1, 1,
-0.3453708, -0.3632954, -2.405409, 1, 1, 1, 1, 1,
-0.3444909, 1.545108, -1.832765, 1, 1, 1, 1, 1,
-0.3354526, -1.614068, -2.879761, 1, 1, 1, 1, 1,
-0.3333714, -2.02737, -1.865992, 1, 1, 1, 1, 1,
-0.3309918, -0.06633554, -3.287146, 1, 1, 1, 1, 1,
-0.3286633, 0.7392179, -0.3316277, 1, 1, 1, 1, 1,
-0.327608, 0.297769, -2.027126, 1, 1, 1, 1, 1,
-0.3273083, 1.045473, 0.4784474, 1, 1, 1, 1, 1,
-0.3267483, -1.458838, -6.01956, 1, 1, 1, 1, 1,
-0.326642, 0.9053944, -0.8714561, 1, 1, 1, 1, 1,
-0.3255528, 0.006308996, -3.083926, 1, 1, 1, 1, 1,
-0.3242749, 0.2605974, -0.2380951, 1, 1, 1, 1, 1,
-0.3227147, -0.534178, -3.621924, 1, 1, 1, 1, 1,
-0.3209441, -0.671618, -3.757363, 1, 1, 1, 1, 1,
-0.320567, 1.068188, 0.07312903, 0, 0, 1, 1, 1,
-0.3169974, -0.144757, -0.9209415, 1, 0, 0, 1, 1,
-0.3103065, 0.4544151, -1.98904, 1, 0, 0, 1, 1,
-0.3102255, -2.116183, -2.752961, 1, 0, 0, 1, 1,
-0.3085634, 0.399513, -0.5300142, 1, 0, 0, 1, 1,
-0.2993588, -0.1097155, -2.636074, 1, 0, 0, 1, 1,
-0.298388, 0.4662384, 1.245477, 0, 0, 0, 1, 1,
-0.2969373, -0.9928412, -2.568092, 0, 0, 0, 1, 1,
-0.292951, 0.3652026, -0.4344884, 0, 0, 0, 1, 1,
-0.2903996, -0.2980657, -0.3145515, 0, 0, 0, 1, 1,
-0.2885211, -0.02614163, -1.255153, 0, 0, 0, 1, 1,
-0.2845358, 0.3696492, -1.146927, 0, 0, 0, 1, 1,
-0.2840735, -0.1139352, 0.3068665, 0, 0, 0, 1, 1,
-0.2826501, -0.06386191, -0.8875811, 1, 1, 1, 1, 1,
-0.2820709, 0.01027768, -1.253204, 1, 1, 1, 1, 1,
-0.2751435, 0.009142522, -2.276004, 1, 1, 1, 1, 1,
-0.2735298, -1.469509, -2.314481, 1, 1, 1, 1, 1,
-0.2720459, 0.4403098, -1.806535, 1, 1, 1, 1, 1,
-0.2674893, -0.2506252, -1.118638, 1, 1, 1, 1, 1,
-0.2620907, -0.5869935, -2.715174, 1, 1, 1, 1, 1,
-0.260008, 0.8056165, -0.6991104, 1, 1, 1, 1, 1,
-0.2590826, -0.09266414, -2.448891, 1, 1, 1, 1, 1,
-0.254335, 0.2135954, -0.8881145, 1, 1, 1, 1, 1,
-0.2529619, 0.2279829, -0.1805159, 1, 1, 1, 1, 1,
-0.2513692, -0.6045749, -4.44639, 1, 1, 1, 1, 1,
-0.2512798, 0.3730564, 0.4229741, 1, 1, 1, 1, 1,
-0.2449099, 0.3703555, -0.4527382, 1, 1, 1, 1, 1,
-0.2424441, -1.006166, -1.130963, 1, 1, 1, 1, 1,
-0.2421805, 1.582394, -1.664849, 0, 0, 1, 1, 1,
-0.2374988, -0.4346989, -4.077234, 1, 0, 0, 1, 1,
-0.2363018, 0.2932418, 0.2252624, 1, 0, 0, 1, 1,
-0.234957, 2.367305, -1.141759, 1, 0, 0, 1, 1,
-0.2344607, -1.634457, -3.3686, 1, 0, 0, 1, 1,
-0.2304968, 0.3286553, -0.5824967, 1, 0, 0, 1, 1,
-0.2287073, 0.8671545, 0.923017, 0, 0, 0, 1, 1,
-0.227114, 0.7391905, -2.1403, 0, 0, 0, 1, 1,
-0.2183794, -0.1654483, -1.638169, 0, 0, 0, 1, 1,
-0.2168762, 1.229212, -1.619155, 0, 0, 0, 1, 1,
-0.2162318, -0.1275353, -0.4088726, 0, 0, 0, 1, 1,
-0.2149314, -1.571801, -3.0992, 0, 0, 0, 1, 1,
-0.2136481, -0.5117767, -1.983286, 0, 0, 0, 1, 1,
-0.204823, -0.2582823, -3.039369, 1, 1, 1, 1, 1,
-0.2047882, -0.9290946, -1.920749, 1, 1, 1, 1, 1,
-0.2040262, -0.05072013, -3.757488, 1, 1, 1, 1, 1,
-0.2033416, 0.1201343, -1.973208, 1, 1, 1, 1, 1,
-0.2017164, 2.402322, 1.595139, 1, 1, 1, 1, 1,
-0.2015884, 0.5803849, -0.7459669, 1, 1, 1, 1, 1,
-0.2004523, 2.082527, 0.01305914, 1, 1, 1, 1, 1,
-0.1982939, 1.755764, -0.9373328, 1, 1, 1, 1, 1,
-0.1900138, 0.7513165, -0.3203702, 1, 1, 1, 1, 1,
-0.1768135, 1.221049, -0.5311754, 1, 1, 1, 1, 1,
-0.1755824, -0.6033185, -1.667372, 1, 1, 1, 1, 1,
-0.1730615, -1.573935, -3.939107, 1, 1, 1, 1, 1,
-0.1729154, -0.2681408, -3.340824, 1, 1, 1, 1, 1,
-0.1694151, 1.319365, -0.7060241, 1, 1, 1, 1, 1,
-0.1679864, -0.1334151, -1.894416, 1, 1, 1, 1, 1,
-0.1657813, -2.167474, -3.41527, 0, 0, 1, 1, 1,
-0.157285, -0.4189571, -4.042051, 1, 0, 0, 1, 1,
-0.1561398, -1.059595, -3.11229, 1, 0, 0, 1, 1,
-0.1539307, 0.447058, -1.714875, 1, 0, 0, 1, 1,
-0.1506768, 1.891071, -0.6962514, 1, 0, 0, 1, 1,
-0.1500792, 1.037915, 0.265574, 1, 0, 0, 1, 1,
-0.1446249, -0.8944196, -2.363294, 0, 0, 0, 1, 1,
-0.1445068, -2.337861, -2.155864, 0, 0, 0, 1, 1,
-0.1430971, -0.1769821, -2.918443, 0, 0, 0, 1, 1,
-0.1404419, 0.9038765, -1.920543, 0, 0, 0, 1, 1,
-0.1403296, -0.4019169, -2.521245, 0, 0, 0, 1, 1,
-0.1374605, 1.296482, 0.7507439, 0, 0, 0, 1, 1,
-0.1317224, 0.1600057, -1.857171, 0, 0, 0, 1, 1,
-0.1296606, -1.788931, -3.832581, 1, 1, 1, 1, 1,
-0.1283052, 0.2701031, -0.6015303, 1, 1, 1, 1, 1,
-0.1234075, -1.771246, -2.094598, 1, 1, 1, 1, 1,
-0.1230181, -0.2474937, -1.486192, 1, 1, 1, 1, 1,
-0.1212055, -0.5861271, -1.780728, 1, 1, 1, 1, 1,
-0.1177137, -0.8289798, -2.887194, 1, 1, 1, 1, 1,
-0.1163701, -0.6893632, -3.417734, 1, 1, 1, 1, 1,
-0.1141837, 1.37111, -0.1402568, 1, 1, 1, 1, 1,
-0.1112724, -1.249703, -0.9543031, 1, 1, 1, 1, 1,
-0.1026117, 0.1250028, -0.2943501, 1, 1, 1, 1, 1,
-0.1019633, 0.5505459, 0.3730281, 1, 1, 1, 1, 1,
-0.09826857, -0.698314, -2.954612, 1, 1, 1, 1, 1,
-0.09596501, -0.6562372, -2.123129, 1, 1, 1, 1, 1,
-0.09108841, -1.202109, -2.504924, 1, 1, 1, 1, 1,
-0.08719619, 0.9119421, -0.0462164, 1, 1, 1, 1, 1,
-0.08595643, -0.3781249, -3.78314, 0, 0, 1, 1, 1,
-0.08564883, 1.447924, 1.047612, 1, 0, 0, 1, 1,
-0.08458338, -0.1213815, -2.682121, 1, 0, 0, 1, 1,
-0.08078739, -0.6253487, -2.316931, 1, 0, 0, 1, 1,
-0.0800385, 0.02338627, -2.193708, 1, 0, 0, 1, 1,
-0.07641803, -0.8637323, -4.80923, 1, 0, 0, 1, 1,
-0.0762293, -0.521373, -1.700027, 0, 0, 0, 1, 1,
-0.07594185, 0.4160013, 0.3051297, 0, 0, 0, 1, 1,
-0.07219104, -0.228347, -4.742602, 0, 0, 0, 1, 1,
-0.06984638, 0.6638187, -0.5158122, 0, 0, 0, 1, 1,
-0.05505921, 1.189386, 0.1208025, 0, 0, 0, 1, 1,
-0.05176022, -0.205506, -2.225589, 0, 0, 0, 1, 1,
-0.04683398, 1.290766, 0.850305, 0, 0, 0, 1, 1,
-0.04594536, -1.844231, -1.935475, 1, 1, 1, 1, 1,
-0.03808203, -1.263732, -2.968384, 1, 1, 1, 1, 1,
-0.03142797, -0.1000258, -1.87133, 1, 1, 1, 1, 1,
-0.02641477, -0.4855193, -2.012482, 1, 1, 1, 1, 1,
-0.02608573, -1.813293, -2.141875, 1, 1, 1, 1, 1,
-0.024864, 0.3366029, 1.10252, 1, 1, 1, 1, 1,
-0.02450601, 0.01440736, 0.2491807, 1, 1, 1, 1, 1,
-0.02396794, 0.2263731, -1.156546, 1, 1, 1, 1, 1,
-0.02359244, -1.530979, -1.722659, 1, 1, 1, 1, 1,
-0.0220182, -0.8403426, -2.88668, 1, 1, 1, 1, 1,
-0.02093508, -1.99636, -3.54248, 1, 1, 1, 1, 1,
-0.01981106, 0.349028, -1.89675, 1, 1, 1, 1, 1,
-0.01954011, -0.8103672, -3.960365, 1, 1, 1, 1, 1,
-0.01648915, -0.9493691, -2.84921, 1, 1, 1, 1, 1,
-0.01261101, -0.7614872, -3.45576, 1, 1, 1, 1, 1,
-0.009686426, -1.388222, -3.471931, 0, 0, 1, 1, 1,
-0.008566692, -0.5792924, -1.861222, 1, 0, 0, 1, 1,
-0.008199335, -0.8552063, -3.140938, 1, 0, 0, 1, 1,
-0.004663702, 0.2820646, -0.555715, 1, 0, 0, 1, 1,
-0.003237949, 0.1713573, 1.837643, 1, 0, 0, 1, 1,
-0.002328841, -0.07314005, -4.507815, 1, 0, 0, 1, 1,
0.001303542, -0.7463688, 0.5210496, 0, 0, 0, 1, 1,
0.002642582, 1.105416, 0.4773036, 0, 0, 0, 1, 1,
0.005313773, -0.9860558, 3.291546, 0, 0, 0, 1, 1,
0.00599706, -1.479973, 3.220371, 0, 0, 0, 1, 1,
0.006677918, 1.280537, -0.6137843, 0, 0, 0, 1, 1,
0.01112609, -0.5193347, 2.866388, 0, 0, 0, 1, 1,
0.01187637, -1.322933, 2.452364, 0, 0, 0, 1, 1,
0.02069826, -3.095495, 1.96686, 1, 1, 1, 1, 1,
0.02186259, -0.4059964, 2.256143, 1, 1, 1, 1, 1,
0.02260149, 1.409352, -0.3666524, 1, 1, 1, 1, 1,
0.02361203, 0.02288618, 2.185356, 1, 1, 1, 1, 1,
0.02471821, -2.252512, 3.502712, 1, 1, 1, 1, 1,
0.02973565, -0.3824543, 2.177112, 1, 1, 1, 1, 1,
0.03003864, -0.3388292, 2.661668, 1, 1, 1, 1, 1,
0.0400601, 2.081215, 0.5568741, 1, 1, 1, 1, 1,
0.04022567, -0.06147142, 3.149135, 1, 1, 1, 1, 1,
0.04408497, 0.2075025, 0.7195129, 1, 1, 1, 1, 1,
0.05061216, 0.02936574, 1.56744, 1, 1, 1, 1, 1,
0.05288469, -0.6057638, 2.509938, 1, 1, 1, 1, 1,
0.05356553, 0.3280301, 1.003399, 1, 1, 1, 1, 1,
0.0590869, 1.0964, -0.1225013, 1, 1, 1, 1, 1,
0.06216425, -0.4040953, 5.191464, 1, 1, 1, 1, 1,
0.06308577, 1.027456, 2.073841, 0, 0, 1, 1, 1,
0.06391059, 0.06865852, 0.303855, 1, 0, 0, 1, 1,
0.07700098, 0.03144577, 0.9723221, 1, 0, 0, 1, 1,
0.07816757, -1.32942, 3.092516, 1, 0, 0, 1, 1,
0.08244458, -0.6243545, 2.50367, 1, 0, 0, 1, 1,
0.09210047, -0.535353, 1.724943, 1, 0, 0, 1, 1,
0.09449179, -0.9032754, 1.815007, 0, 0, 0, 1, 1,
0.09460129, -1.277245, 2.406444, 0, 0, 0, 1, 1,
0.09614272, 0.1234581, -1.045141, 0, 0, 0, 1, 1,
0.09705886, -0.5826722, 1.717184, 0, 0, 0, 1, 1,
0.09707893, 1.01619, -0.5699829, 0, 0, 0, 1, 1,
0.0996042, -0.1211531, 1.570777, 0, 0, 0, 1, 1,
0.1016536, 0.6169624, -0.1567183, 0, 0, 0, 1, 1,
0.1036777, -0.6893864, 1.538753, 1, 1, 1, 1, 1,
0.1135981, 0.6051376, 0.7217337, 1, 1, 1, 1, 1,
0.115668, -0.3189647, 2.62337, 1, 1, 1, 1, 1,
0.1167062, -1.948359, 1.472902, 1, 1, 1, 1, 1,
0.1224176, -0.3486286, 3.443835, 1, 1, 1, 1, 1,
0.1237821, 0.1311222, 2.194776, 1, 1, 1, 1, 1,
0.1244443, -0.9040874, 2.283175, 1, 1, 1, 1, 1,
0.1324002, 0.7280672, 0.008024785, 1, 1, 1, 1, 1,
0.1447316, -0.7872149, 3.583815, 1, 1, 1, 1, 1,
0.1465845, -1.741805, 4.203662, 1, 1, 1, 1, 1,
0.1480297, 0.4151851, 0.7065173, 1, 1, 1, 1, 1,
0.1481524, 1.81082, -0.8976853, 1, 1, 1, 1, 1,
0.1489358, -0.198477, 3.078458, 1, 1, 1, 1, 1,
0.1531717, -0.703719, 1.608247, 1, 1, 1, 1, 1,
0.1550303, -0.05352909, 1.601998, 1, 1, 1, 1, 1,
0.1591594, 2.291056, -0.4275399, 0, 0, 1, 1, 1,
0.160617, 0.1128772, 0.6285405, 1, 0, 0, 1, 1,
0.1615192, 0.1444221, 2.841665, 1, 0, 0, 1, 1,
0.1620148, -1.084757, 1.951852, 1, 0, 0, 1, 1,
0.1657269, -0.2925216, 4.798307, 1, 0, 0, 1, 1,
0.1670841, -1.999614, 2.963467, 1, 0, 0, 1, 1,
0.1724715, 0.4691428, 0.4073775, 0, 0, 0, 1, 1,
0.1746026, 0.2079102, 0.1065145, 0, 0, 0, 1, 1,
0.1757911, -1.009341, 1.689848, 0, 0, 0, 1, 1,
0.1767034, -0.775929, 2.427737, 0, 0, 0, 1, 1,
0.17712, 1.208631, 0.5963678, 0, 0, 0, 1, 1,
0.1774395, 1.544002, 0.9094416, 0, 0, 0, 1, 1,
0.1788087, -0.7606554, 1.006065, 0, 0, 0, 1, 1,
0.1802999, -0.001204262, 1.854839, 1, 1, 1, 1, 1,
0.1809344, -0.05087441, 1.762531, 1, 1, 1, 1, 1,
0.1817564, -0.3624937, 3.595838, 1, 1, 1, 1, 1,
0.1860538, 1.892257, 0.2132342, 1, 1, 1, 1, 1,
0.1894988, -0.7565908, 0.06650059, 1, 1, 1, 1, 1,
0.1911411, -0.06746683, 0.4454581, 1, 1, 1, 1, 1,
0.1913906, 1.104902, 0.1392211, 1, 1, 1, 1, 1,
0.1939076, 0.3679564, 0.5840451, 1, 1, 1, 1, 1,
0.1951627, -0.3486737, 2.251759, 1, 1, 1, 1, 1,
0.1989352, 0.2302333, 0.4629458, 1, 1, 1, 1, 1,
0.1994828, 0.06841502, 1.74034, 1, 1, 1, 1, 1,
0.211107, -0.7673137, 1.847496, 1, 1, 1, 1, 1,
0.2139497, 0.8853953, -0.372631, 1, 1, 1, 1, 1,
0.2159589, -1.6191, 3.856836, 1, 1, 1, 1, 1,
0.2223935, -0.2765901, 3.220282, 1, 1, 1, 1, 1,
0.2231983, -2.521207, 1.636358, 0, 0, 1, 1, 1,
0.2260409, -0.4152323, 3.276702, 1, 0, 0, 1, 1,
0.2333646, 0.1133838, 1.355563, 1, 0, 0, 1, 1,
0.2386727, 0.4077078, 0.935333, 1, 0, 0, 1, 1,
0.2389213, 0.2649078, 0.5862107, 1, 0, 0, 1, 1,
0.2405328, 0.5860373, 1.147071, 1, 0, 0, 1, 1,
0.240618, 0.2757092, -0.1037052, 0, 0, 0, 1, 1,
0.2470866, -0.7771742, 3.034616, 0, 0, 0, 1, 1,
0.2471676, 0.7975375, 0.06650186, 0, 0, 0, 1, 1,
0.2474766, 0.1760229, 2.027613, 0, 0, 0, 1, 1,
0.2478445, -1.461323, 3.757148, 0, 0, 0, 1, 1,
0.2483743, -1.018073, 2.342067, 0, 0, 0, 1, 1,
0.2489192, -0.03637709, 2.639465, 0, 0, 0, 1, 1,
0.2495539, -0.05347084, 1.707249, 1, 1, 1, 1, 1,
0.2503891, -0.4100379, 4.094152, 1, 1, 1, 1, 1,
0.2507511, -0.992814, 3.437157, 1, 1, 1, 1, 1,
0.2552609, -1.11085, 5.875262, 1, 1, 1, 1, 1,
0.2560611, -0.4264414, 1.903732, 1, 1, 1, 1, 1,
0.2568948, -0.7310433, 4.371106, 1, 1, 1, 1, 1,
0.26347, -0.1338709, 2.564837, 1, 1, 1, 1, 1,
0.2657439, 1.214352, -0.3254037, 1, 1, 1, 1, 1,
0.269608, 0.1993868, 0.6823999, 1, 1, 1, 1, 1,
0.270577, 1.858752, 1.039254, 1, 1, 1, 1, 1,
0.2741812, -0.4620948, 4.175642, 1, 1, 1, 1, 1,
0.2752307, 1.870787, -0.5495456, 1, 1, 1, 1, 1,
0.279276, 0.1355244, 1.206404, 1, 1, 1, 1, 1,
0.2808897, -1.269427, 3.586685, 1, 1, 1, 1, 1,
0.2842138, 0.4965778, 0.7010068, 1, 1, 1, 1, 1,
0.2864248, -0.646063, 2.022035, 0, 0, 1, 1, 1,
0.2865051, 0.1162298, 0.56106, 1, 0, 0, 1, 1,
0.2869155, -0.8836229, 4.272757, 1, 0, 0, 1, 1,
0.2906818, 1.737864, 0.4271451, 1, 0, 0, 1, 1,
0.2967561, 0.185753, 1.869966, 1, 0, 0, 1, 1,
0.2989343, 0.4008884, 0.9234741, 1, 0, 0, 1, 1,
0.3078434, -0.2019591, 2.585531, 0, 0, 0, 1, 1,
0.3094841, 1.041586, -0.9971979, 0, 0, 0, 1, 1,
0.3118551, 0.07099135, 1.899516, 0, 0, 0, 1, 1,
0.3132482, 0.5380409, 1.414207, 0, 0, 0, 1, 1,
0.3148971, -0.9890102, 3.030083, 0, 0, 0, 1, 1,
0.3185488, -1.695989, 4.118554, 0, 0, 0, 1, 1,
0.3191811, -0.8132016, 1.852349, 0, 0, 0, 1, 1,
0.3229133, 0.3302787, 2.134884, 1, 1, 1, 1, 1,
0.323866, 1.193098, 0.233829, 1, 1, 1, 1, 1,
0.3255344, -0.04910674, 0.6374045, 1, 1, 1, 1, 1,
0.3268575, -1.450374, 3.044535, 1, 1, 1, 1, 1,
0.3281148, 0.6803339, -1.000313, 1, 1, 1, 1, 1,
0.330181, 0.8712453, 1.611046, 1, 1, 1, 1, 1,
0.3325467, 0.6308227, 0.5845544, 1, 1, 1, 1, 1,
0.3328936, 0.4263553, -0.7543693, 1, 1, 1, 1, 1,
0.3338968, 0.1784856, 2.389527, 1, 1, 1, 1, 1,
0.3370384, -1.101842, 5.092579, 1, 1, 1, 1, 1,
0.3390519, -1.147344, 2.86223, 1, 1, 1, 1, 1,
0.3390833, 0.1731261, 0.8084115, 1, 1, 1, 1, 1,
0.3421314, -1.260161, 3.666777, 1, 1, 1, 1, 1,
0.3442199, 1.012304, 1.024133, 1, 1, 1, 1, 1,
0.3445985, -0.8372332, 2.819566, 1, 1, 1, 1, 1,
0.3465003, 0.1111727, 1.693954, 0, 0, 1, 1, 1,
0.3480982, 1.364964, -0.5419548, 1, 0, 0, 1, 1,
0.3499287, 1.989248, 0.1887004, 1, 0, 0, 1, 1,
0.354154, 0.1423748, 2.794134, 1, 0, 0, 1, 1,
0.356779, 1.45615, -0.08174194, 1, 0, 0, 1, 1,
0.3570158, 0.1834353, 1.648733, 1, 0, 0, 1, 1,
0.3581926, 0.6716061, -1.228493, 0, 0, 0, 1, 1,
0.3604262, -0.7673156, 2.819989, 0, 0, 0, 1, 1,
0.3624744, -0.2938308, 2.413158, 0, 0, 0, 1, 1,
0.3684079, 0.4560142, 1.916421, 0, 0, 0, 1, 1,
0.3687691, -0.3201627, 3.236077, 0, 0, 0, 1, 1,
0.3712408, -1.501465, 3.061854, 0, 0, 0, 1, 1,
0.3725252, -0.5957333, 1.954172, 0, 0, 0, 1, 1,
0.3750944, 0.2463045, 2.492168, 1, 1, 1, 1, 1,
0.3792388, 1.988272, 0.411422, 1, 1, 1, 1, 1,
0.3864079, -2.204505, 2.829592, 1, 1, 1, 1, 1,
0.3952496, 1.166523, -0.8993921, 1, 1, 1, 1, 1,
0.398308, 0.4205072, 2.323247, 1, 1, 1, 1, 1,
0.399604, -2.123941, 2.047515, 1, 1, 1, 1, 1,
0.4036412, -0.2826588, 1.385462, 1, 1, 1, 1, 1,
0.4063835, 0.1553411, -0.05598762, 1, 1, 1, 1, 1,
0.4123723, -0.1900248, 2.317244, 1, 1, 1, 1, 1,
0.4123834, -0.03836073, -0.9945534, 1, 1, 1, 1, 1,
0.4133081, -1.087956, 1.350238, 1, 1, 1, 1, 1,
0.414658, 0.5032189, 1.801339, 1, 1, 1, 1, 1,
0.4199949, 2.095682, 1.99213, 1, 1, 1, 1, 1,
0.4200984, -0.9914685, 0.3382275, 1, 1, 1, 1, 1,
0.421778, 1.123097, 2.597203, 1, 1, 1, 1, 1,
0.4288019, -0.8686772, 3.66203, 0, 0, 1, 1, 1,
0.4321236, -1.831173, 3.393185, 1, 0, 0, 1, 1,
0.4326384, 0.09815548, 1.205741, 1, 0, 0, 1, 1,
0.434227, 0.1274538, 0.4950054, 1, 0, 0, 1, 1,
0.4347109, 0.1026549, 1.547605, 1, 0, 0, 1, 1,
0.4368417, 0.1876138, 1.708425, 1, 0, 0, 1, 1,
0.4373049, -0.9971517, 3.026898, 0, 0, 0, 1, 1,
0.4387637, -0.4183968, 2.43837, 0, 0, 0, 1, 1,
0.4448473, -1.629058, 3.024352, 0, 0, 0, 1, 1,
0.4478755, -1.212855, 4.867718, 0, 0, 0, 1, 1,
0.4481723, 0.7897155, 0.1511823, 0, 0, 0, 1, 1,
0.4482885, 0.5170981, 1.151516, 0, 0, 0, 1, 1,
0.4509638, -2.951313, 3.883097, 0, 0, 0, 1, 1,
0.4513459, 0.01797165, 1.273703, 1, 1, 1, 1, 1,
0.4540128, 0.6739988, 1.959824, 1, 1, 1, 1, 1,
0.4541663, 0.02053917, 0.7351944, 1, 1, 1, 1, 1,
0.4597688, 1.588527, -0.605, 1, 1, 1, 1, 1,
0.4598593, -1.49691, 1.920088, 1, 1, 1, 1, 1,
0.4616862, 1.502837, -0.1127344, 1, 1, 1, 1, 1,
0.4672999, 0.2043429, 2.97225, 1, 1, 1, 1, 1,
0.4734508, -1.241211, 0.8928066, 1, 1, 1, 1, 1,
0.4818454, -1.376647, 2.170967, 1, 1, 1, 1, 1,
0.4849251, 0.4975286, -0.77048, 1, 1, 1, 1, 1,
0.4851844, 1.725558, 0.2581407, 1, 1, 1, 1, 1,
0.4859603, -0.6549055, 3.447508, 1, 1, 1, 1, 1,
0.4861381, 1.182674, 0.6639812, 1, 1, 1, 1, 1,
0.4876118, 0.8788079, -0.3630929, 1, 1, 1, 1, 1,
0.4893916, 0.649183, 0.8664275, 1, 1, 1, 1, 1,
0.4899675, 0.8422584, -0.9483567, 0, 0, 1, 1, 1,
0.4900843, 0.8631003, 1.65793, 1, 0, 0, 1, 1,
0.5002943, 0.7797458, 2.617128, 1, 0, 0, 1, 1,
0.5018826, 2.589869, 0.4551319, 1, 0, 0, 1, 1,
0.5076184, 1.538403, 0.4649869, 1, 0, 0, 1, 1,
0.5078269, 1.210999, -0.6364336, 1, 0, 0, 1, 1,
0.5088874, 0.952727, 1.761013, 0, 0, 0, 1, 1,
0.5101125, -0.1102504, 0.2559555, 0, 0, 0, 1, 1,
0.5113406, -0.8966127, 3.44645, 0, 0, 0, 1, 1,
0.5167634, 0.259342, -0.2397439, 0, 0, 0, 1, 1,
0.5185462, 1.274526, -1.283478, 0, 0, 0, 1, 1,
0.5243793, -0.5886714, 3.667165, 0, 0, 0, 1, 1,
0.5243872, 0.960556, -1.426217, 0, 0, 0, 1, 1,
0.5292422, 1.275054, 1.328413, 1, 1, 1, 1, 1,
0.5298144, 0.2860734, 1.771441, 1, 1, 1, 1, 1,
0.533159, -0.635232, 2.999505, 1, 1, 1, 1, 1,
0.539083, 0.2033687, 0.2162969, 1, 1, 1, 1, 1,
0.5411448, 0.6665525, 0.5719956, 1, 1, 1, 1, 1,
0.5469138, 2.068288, 0.3141627, 1, 1, 1, 1, 1,
0.5477839, -0.3660143, 2.345992, 1, 1, 1, 1, 1,
0.5520244, -0.5159234, 1.014094, 1, 1, 1, 1, 1,
0.5608371, -0.3079293, 1.7542, 1, 1, 1, 1, 1,
0.5636875, 2.142014, 1.49567, 1, 1, 1, 1, 1,
0.565816, -1.202255, 4.546403, 1, 1, 1, 1, 1,
0.5666586, 1.485841, -0.09241552, 1, 1, 1, 1, 1,
0.5671906, 0.5241961, 1.233455, 1, 1, 1, 1, 1,
0.5681013, 0.009452179, 0.5417844, 1, 1, 1, 1, 1,
0.5731593, 0.6218897, -0.619284, 1, 1, 1, 1, 1,
0.5792161, -0.5749124, 3.403441, 0, 0, 1, 1, 1,
0.5794865, 0.8045698, -0.6404849, 1, 0, 0, 1, 1,
0.5985653, 1.671091, 0.230563, 1, 0, 0, 1, 1,
0.6002096, 0.04375459, 2.281416, 1, 0, 0, 1, 1,
0.6022693, -0.7666789, 3.070247, 1, 0, 0, 1, 1,
0.6035504, -0.05987178, 1.467641, 1, 0, 0, 1, 1,
0.6071044, 0.1815096, -0.4635817, 0, 0, 0, 1, 1,
0.6076058, -0.7297536, 3.2685, 0, 0, 0, 1, 1,
0.6116396, -1.241738, 3.924663, 0, 0, 0, 1, 1,
0.6183643, -1.874659, 3.54552, 0, 0, 0, 1, 1,
0.6232343, -0.5079997, 2.165471, 0, 0, 0, 1, 1,
0.6236119, -0.5985444, 2.107562, 0, 0, 0, 1, 1,
0.632961, 0.832751, -0.462004, 0, 0, 0, 1, 1,
0.6331614, -0.920159, 1.828353, 1, 1, 1, 1, 1,
0.6334691, 1.584595, -0.00947221, 1, 1, 1, 1, 1,
0.6344262, 0.8322757, -0.5080593, 1, 1, 1, 1, 1,
0.6366968, 1.494425, -0.7157223, 1, 1, 1, 1, 1,
0.6371515, 2.013724, -1.024277, 1, 1, 1, 1, 1,
0.6379308, 1.61693, 1.048756, 1, 1, 1, 1, 1,
0.6392894, 0.3613246, 1.970104, 1, 1, 1, 1, 1,
0.6406298, 0.81869, 1.795053, 1, 1, 1, 1, 1,
0.6481562, 1.139474, -0.5453977, 1, 1, 1, 1, 1,
0.6497045, 0.5159737, -0.7914506, 1, 1, 1, 1, 1,
0.6505244, 0.04983154, 2.672878, 1, 1, 1, 1, 1,
0.6588704, 1.446073, -1.20074, 1, 1, 1, 1, 1,
0.6597401, -0.4139021, 1.559965, 1, 1, 1, 1, 1,
0.663194, 2.166532, 0.5626194, 1, 1, 1, 1, 1,
0.6663657, 0.9599454, 1.760536, 1, 1, 1, 1, 1,
0.6671476, -0.4814592, 2.513034, 0, 0, 1, 1, 1,
0.6671596, 0.7578001, 0.2999681, 1, 0, 0, 1, 1,
0.6719604, -0.976534, 2.736607, 1, 0, 0, 1, 1,
0.6739768, -0.5790799, 2.880522, 1, 0, 0, 1, 1,
0.6818917, 0.2811524, 0.4310914, 1, 0, 0, 1, 1,
0.6823297, -0.2669055, 2.560325, 1, 0, 0, 1, 1,
0.6860974, 0.1910106, 1.240422, 0, 0, 0, 1, 1,
0.6921837, -0.2286018, 2.489435, 0, 0, 0, 1, 1,
0.6928594, -1.092465, 1.379204, 0, 0, 0, 1, 1,
0.6949454, -0.44451, 2.229666, 0, 0, 0, 1, 1,
0.697398, 0.114048, 2.07971, 0, 0, 0, 1, 1,
0.6983683, 0.6257872, 0.1784683, 0, 0, 0, 1, 1,
0.7015482, -0.7255663, 3.601307, 0, 0, 0, 1, 1,
0.7020445, -0.3727947, 1.116765, 1, 1, 1, 1, 1,
0.7075313, 0.5921586, 1.853731, 1, 1, 1, 1, 1,
0.709222, -0.4650714, 3.368003, 1, 1, 1, 1, 1,
0.710492, 2.0391, 0.895382, 1, 1, 1, 1, 1,
0.7126755, -0.06246357, 1.665074, 1, 1, 1, 1, 1,
0.7151438, -0.5840601, 3.901528, 1, 1, 1, 1, 1,
0.719784, 1.924118, 3.25578, 1, 1, 1, 1, 1,
0.7198933, -0.4186649, 3.668567, 1, 1, 1, 1, 1,
0.7226166, 1.133207, -0.4026678, 1, 1, 1, 1, 1,
0.7243072, 0.7390366, 1.972325, 1, 1, 1, 1, 1,
0.724436, -0.0177314, 0.6322767, 1, 1, 1, 1, 1,
0.726465, 0.06480451, -0.01677398, 1, 1, 1, 1, 1,
0.7270837, 1.284958, -0.1811, 1, 1, 1, 1, 1,
0.7300129, 1.055305, -1.366981, 1, 1, 1, 1, 1,
0.7315482, -1.553307, 1.516698, 1, 1, 1, 1, 1,
0.736667, -0.2406436, 1.152302, 0, 0, 1, 1, 1,
0.7396075, -0.2314599, -0.05134418, 1, 0, 0, 1, 1,
0.7419382, -0.1108876, 2.045527, 1, 0, 0, 1, 1,
0.7427355, -1.210666, 1.538051, 1, 0, 0, 1, 1,
0.7444276, 0.7660298, 2.235472, 1, 0, 0, 1, 1,
0.7458645, 1.190427, -0.4085526, 1, 0, 0, 1, 1,
0.7552667, -0.5978347, 1.984565, 0, 0, 0, 1, 1,
0.7553427, -0.1686734, 2.787601, 0, 0, 0, 1, 1,
0.75609, 1.107318, -1.213216, 0, 0, 0, 1, 1,
0.7565696, -1.154536, 2.288396, 0, 0, 0, 1, 1,
0.760079, -0.2438399, 2.249605, 0, 0, 0, 1, 1,
0.7620364, -0.6502687, 1.122115, 0, 0, 0, 1, 1,
0.7654925, -0.3352233, 2.44971, 0, 0, 0, 1, 1,
0.774429, -0.4930327, 1.020416, 1, 1, 1, 1, 1,
0.7773271, -0.363768, 1.944714, 1, 1, 1, 1, 1,
0.7774063, -0.7194217, 2.82286, 1, 1, 1, 1, 1,
0.7785818, -0.03917504, 2.592848, 1, 1, 1, 1, 1,
0.7842664, 1.975122, 1.240017, 1, 1, 1, 1, 1,
0.7846416, -1.7, 3.725879, 1, 1, 1, 1, 1,
0.7851906, -0.6504727, 3.467861, 1, 1, 1, 1, 1,
0.7882115, 0.3571989, 2.908286, 1, 1, 1, 1, 1,
0.7900433, -0.03117019, 0.3619042, 1, 1, 1, 1, 1,
0.80863, -0.5928053, 1.912053, 1, 1, 1, 1, 1,
0.8093117, -1.046514, 2.711372, 1, 1, 1, 1, 1,
0.8108039, -0.7325807, 2.055883, 1, 1, 1, 1, 1,
0.8249035, 0.6655487, 0.4845876, 1, 1, 1, 1, 1,
0.8299592, 0.988983, 0.4423927, 1, 1, 1, 1, 1,
0.8368661, -0.6312684, 1.69734, 1, 1, 1, 1, 1,
0.8403927, 0.6644671, 2.491144, 0, 0, 1, 1, 1,
0.8404776, -0.06858305, 1.826412, 1, 0, 0, 1, 1,
0.8415772, 0.6240481, 0.2518815, 1, 0, 0, 1, 1,
0.841931, -0.2523152, 1.701601, 1, 0, 0, 1, 1,
0.8422133, 0.07284416, 2.588264, 1, 0, 0, 1, 1,
0.845973, 0.2633299, 0.3895886, 1, 0, 0, 1, 1,
0.8504694, -1.048155, 2.993284, 0, 0, 0, 1, 1,
0.8548677, 0.2746713, 1.327661, 0, 0, 0, 1, 1,
0.8571109, -1.678066, 1.717773, 0, 0, 0, 1, 1,
0.8576847, 0.09202173, 1.669107, 0, 0, 0, 1, 1,
0.8588822, 1.660025, 0.5745785, 0, 0, 0, 1, 1,
0.8687534, -0.4010541, 3.42381, 0, 0, 0, 1, 1,
0.8709285, 1.481566, -0.882633, 0, 0, 0, 1, 1,
0.8711661, 0.9774771, -1.381738, 1, 1, 1, 1, 1,
0.8734899, -0.57992, -0.3883057, 1, 1, 1, 1, 1,
0.8739245, -0.5198827, 2.026822, 1, 1, 1, 1, 1,
0.8747209, 0.5425797, 0.3533947, 1, 1, 1, 1, 1,
0.8769637, -1.269041, 3.07072, 1, 1, 1, 1, 1,
0.876992, 0.9159281, 0.6703676, 1, 1, 1, 1, 1,
0.8801048, 0.08703742, 0.7785905, 1, 1, 1, 1, 1,
0.880785, -1.180474, 2.08722, 1, 1, 1, 1, 1,
0.882782, 0.6286788, -2.03547, 1, 1, 1, 1, 1,
0.8890328, 1.511284, 0.4775271, 1, 1, 1, 1, 1,
0.8906507, 0.1830579, 1.646784, 1, 1, 1, 1, 1,
0.8953729, 1.264062, 0.06537049, 1, 1, 1, 1, 1,
0.8964299, -1.399445, 2.102389, 1, 1, 1, 1, 1,
0.8964932, -0.1343553, 0.5342824, 1, 1, 1, 1, 1,
0.9025632, 0.2470294, 0.9804542, 1, 1, 1, 1, 1,
0.9061297, 2.145282, -0.787982, 0, 0, 1, 1, 1,
0.907765, 0.9639247, 0.7136671, 1, 0, 0, 1, 1,
0.9133937, -2.02038, 1.843722, 1, 0, 0, 1, 1,
0.9171721, -0.2019684, 2.08397, 1, 0, 0, 1, 1,
0.9200128, 1.361905, -1.650073, 1, 0, 0, 1, 1,
0.9217399, -0.7549087, 1.582312, 1, 0, 0, 1, 1,
0.921935, -0.1635805, 1.220377, 0, 0, 0, 1, 1,
0.9355243, -0.4755614, 3.764235, 0, 0, 0, 1, 1,
0.9456984, -0.3583608, 2.159911, 0, 0, 0, 1, 1,
0.9457531, 1.017138, 1.527237, 0, 0, 0, 1, 1,
0.9651369, 0.5569827, 1.245835, 0, 0, 0, 1, 1,
0.9702876, -1.395836, 1.963724, 0, 0, 0, 1, 1,
0.9706195, 0.3831725, 1.003525, 0, 0, 0, 1, 1,
0.9768245, 2.134043, 0.805187, 1, 1, 1, 1, 1,
0.9773333, -0.004743485, 0.6524056, 1, 1, 1, 1, 1,
0.987931, 1.177676, -1.954901, 1, 1, 1, 1, 1,
0.9886606, 0.6298068, 0.2241529, 1, 1, 1, 1, 1,
0.993266, -1.15325, 2.45518, 1, 1, 1, 1, 1,
0.9950192, 0.8681304, 2.151737, 1, 1, 1, 1, 1,
0.9976767, 1.780148, -0.9757161, 1, 1, 1, 1, 1,
0.9979424, 1.21632, 2.234146, 1, 1, 1, 1, 1,
0.9998207, -1.186105, 4.402732, 1, 1, 1, 1, 1,
1.006278, -0.4912084, 1.669337, 1, 1, 1, 1, 1,
1.011822, 1.178899, 0.06030932, 1, 1, 1, 1, 1,
1.012416, 0.2154115, 2.425406, 1, 1, 1, 1, 1,
1.023136, 1.459449, 0.4760615, 1, 1, 1, 1, 1,
1.025036, 0.24318, 0.8620579, 1, 1, 1, 1, 1,
1.025999, 0.8925623, 0.1044655, 1, 1, 1, 1, 1,
1.026169, 0.08501253, 0.2209187, 0, 0, 1, 1, 1,
1.031379, 0.4670207, 3.117685, 1, 0, 0, 1, 1,
1.040173, -1.098321, 2.704511, 1, 0, 0, 1, 1,
1.045564, -0.2494046, 2.898575, 1, 0, 0, 1, 1,
1.048799, -0.0002986836, 1.313052, 1, 0, 0, 1, 1,
1.05161, -1.157283, 4.359653, 1, 0, 0, 1, 1,
1.072318, -0.2379461, 1.285326, 0, 0, 0, 1, 1,
1.074165, -0.6812323, 0.2115401, 0, 0, 0, 1, 1,
1.078413, 1.268283, 1.351552, 0, 0, 0, 1, 1,
1.092048, -1.091222, 0.7288425, 0, 0, 0, 1, 1,
1.09663, 0.8486936, -0.397595, 0, 0, 0, 1, 1,
1.101058, 0.425482, 1.388712, 0, 0, 0, 1, 1,
1.103607, 0.8935401, -0.5773487, 0, 0, 0, 1, 1,
1.108137, 0.0458276, 2.046099, 1, 1, 1, 1, 1,
1.111202, 0.1861212, 0.3508695, 1, 1, 1, 1, 1,
1.112672, 0.09416568, 1.299293, 1, 1, 1, 1, 1,
1.115294, 1.224869, 0.8407843, 1, 1, 1, 1, 1,
1.115548, 1.902872, 1.093004, 1, 1, 1, 1, 1,
1.118461, -0.892892, 1.337389, 1, 1, 1, 1, 1,
1.118826, 0.4127174, 2.484199, 1, 1, 1, 1, 1,
1.123824, 2.279875, -0.8927958, 1, 1, 1, 1, 1,
1.124569, -0.9721134, 1.29817, 1, 1, 1, 1, 1,
1.125946, 0.3660693, 1.880614, 1, 1, 1, 1, 1,
1.129596, 0.2127195, 0.9484378, 1, 1, 1, 1, 1,
1.133572, -2.438659, 2.279622, 1, 1, 1, 1, 1,
1.133595, -0.6248299, 1.399001, 1, 1, 1, 1, 1,
1.142627, 0.4657148, 1.577835, 1, 1, 1, 1, 1,
1.143386, -0.5821919, 1.857332, 1, 1, 1, 1, 1,
1.149018, 1.196561, -0.197839, 0, 0, 1, 1, 1,
1.158511, 1.33818, -0.4681151, 1, 0, 0, 1, 1,
1.16817, 1.264528, 0.03351634, 1, 0, 0, 1, 1,
1.172951, 1.759961, 1.708106, 1, 0, 0, 1, 1,
1.177614, 0.08984334, 1.18301, 1, 0, 0, 1, 1,
1.204738, 0.5742568, 2.020084, 1, 0, 0, 1, 1,
1.207985, -0.9150399, 3.017767, 0, 0, 0, 1, 1,
1.212088, 1.723272, 0.79783, 0, 0, 0, 1, 1,
1.21271, 1.941398, 1.736074, 0, 0, 0, 1, 1,
1.215669, -0.3190903, 2.783219, 0, 0, 0, 1, 1,
1.219349, 0.3865332, 2.186505, 0, 0, 0, 1, 1,
1.221172, 1.709269, -0.9541981, 0, 0, 0, 1, 1,
1.236036, -0.3364458, 1.800785, 0, 0, 0, 1, 1,
1.240583, 0.4179012, -0.01874032, 1, 1, 1, 1, 1,
1.255987, -0.6558116, 3.178107, 1, 1, 1, 1, 1,
1.263528, 0.8416432, 1.280885, 1, 1, 1, 1, 1,
1.264829, -0.5980397, 2.887207, 1, 1, 1, 1, 1,
1.266765, 0.5356776, 2.023253, 1, 1, 1, 1, 1,
1.269179, -0.01486086, 1.306345, 1, 1, 1, 1, 1,
1.283732, -0.9890195, 1.820887, 1, 1, 1, 1, 1,
1.285648, 0.2424768, 1.167524, 1, 1, 1, 1, 1,
1.288538, -0.1265564, 2.398246, 1, 1, 1, 1, 1,
1.289095, 0.1524427, 2.296924, 1, 1, 1, 1, 1,
1.292667, -1.061926, 0.7425033, 1, 1, 1, 1, 1,
1.307033, -0.5715261, 2.030843, 1, 1, 1, 1, 1,
1.309542, 1.412136, 0.3235783, 1, 1, 1, 1, 1,
1.314814, -0.3533618, 1.799695, 1, 1, 1, 1, 1,
1.316513, 0.7126383, 2.221322, 1, 1, 1, 1, 1,
1.317098, 0.9717433, 1.241616, 0, 0, 1, 1, 1,
1.320279, 0.6021292, 0.2029716, 1, 0, 0, 1, 1,
1.322806, 0.8738639, 0.8813085, 1, 0, 0, 1, 1,
1.329174, 0.1865928, 3.198201, 1, 0, 0, 1, 1,
1.334873, -0.2956105, 0.05499271, 1, 0, 0, 1, 1,
1.335098, 0.64813, 1.870386, 1, 0, 0, 1, 1,
1.343354, 1.818352, 0.1652838, 0, 0, 0, 1, 1,
1.346973, 0.09125579, 0.2907654, 0, 0, 0, 1, 1,
1.347394, -1.038698, 2.546296, 0, 0, 0, 1, 1,
1.349113, 0.6446541, -0.3733222, 0, 0, 0, 1, 1,
1.353261, 0.2476373, 1.662381, 0, 0, 0, 1, 1,
1.356508, -0.6526833, 3.104842, 0, 0, 0, 1, 1,
1.357799, -0.4836491, 1.873667, 0, 0, 0, 1, 1,
1.370916, 0.3140509, 0.3704552, 1, 1, 1, 1, 1,
1.372473, -0.2026157, 1.782635, 1, 1, 1, 1, 1,
1.375461, 0.1619436, 0.5466573, 1, 1, 1, 1, 1,
1.384893, 0.5181308, 2.546028, 1, 1, 1, 1, 1,
1.394005, -1.509596, 1.287708, 1, 1, 1, 1, 1,
1.398206, -2.831689, 2.957934, 1, 1, 1, 1, 1,
1.398387, 2.512981, 1.849585, 1, 1, 1, 1, 1,
1.400459, -0.2608525, 1.615873, 1, 1, 1, 1, 1,
1.416182, 1.127128, 0.1770708, 1, 1, 1, 1, 1,
1.41702, -0.7081627, 0.7324403, 1, 1, 1, 1, 1,
1.42417, -0.1016247, 1.580862, 1, 1, 1, 1, 1,
1.437237, -0.3443042, 1.807427, 1, 1, 1, 1, 1,
1.438922, 0.3921788, 2.016448, 1, 1, 1, 1, 1,
1.448432, -0.4796583, 3.35908, 1, 1, 1, 1, 1,
1.448855, -0.03954946, 1.818923, 1, 1, 1, 1, 1,
1.451935, 1.247843, 1.89411, 0, 0, 1, 1, 1,
1.467845, 2.994912, 0.6815636, 1, 0, 0, 1, 1,
1.474662, 0.01688917, 1.04529, 1, 0, 0, 1, 1,
1.479481, 0.659946, 2.948391, 1, 0, 0, 1, 1,
1.481051, 1.260816, 2.726669, 1, 0, 0, 1, 1,
1.484632, -0.2937671, 2.644434, 1, 0, 0, 1, 1,
1.485686, -1.861922, 3.223448, 0, 0, 0, 1, 1,
1.491749, -1.409877, 2.042927, 0, 0, 0, 1, 1,
1.491789, -0.3871674, 1.584157, 0, 0, 0, 1, 1,
1.500118, -1.289322, 2.967894, 0, 0, 0, 1, 1,
1.508347, 0.4623769, 2.457927, 0, 0, 0, 1, 1,
1.511877, -0.8504384, 2.557202, 0, 0, 0, 1, 1,
1.519882, 0.3734802, 1.470263, 0, 0, 0, 1, 1,
1.522691, 0.4482813, 1.372456, 1, 1, 1, 1, 1,
1.549817, -0.2554203, 2.933663, 1, 1, 1, 1, 1,
1.550765, -0.9768077, 1.528267, 1, 1, 1, 1, 1,
1.559617, 0.09848296, 2.446691, 1, 1, 1, 1, 1,
1.562989, 1.341381, 0.07392514, 1, 1, 1, 1, 1,
1.571308, -0.002473808, 1.685277, 1, 1, 1, 1, 1,
1.574853, 0.1327051, 0.3726708, 1, 1, 1, 1, 1,
1.578409, -1.147059, 1.546641, 1, 1, 1, 1, 1,
1.595898, 2.181164, -0.8804339, 1, 1, 1, 1, 1,
1.59782, 0.8645477, 0.9877135, 1, 1, 1, 1, 1,
1.610318, -1.499322, 4.18664, 1, 1, 1, 1, 1,
1.628883, 1.031248, 0.7036414, 1, 1, 1, 1, 1,
1.635862, 0.1027115, 1.511293, 1, 1, 1, 1, 1,
1.662812, 1.33229, -0.6223974, 1, 1, 1, 1, 1,
1.664109, -1.935206, 2.136789, 1, 1, 1, 1, 1,
1.669421, -0.5319631, 3.808457, 0, 0, 1, 1, 1,
1.677613, -0.3224894, 2.707175, 1, 0, 0, 1, 1,
1.681085, -0.4685554, 0.8948331, 1, 0, 0, 1, 1,
1.68204, -0.3063028, 1.826921, 1, 0, 0, 1, 1,
1.68611, 0.9553661, 0.4842664, 1, 0, 0, 1, 1,
1.697813, -2.45453, 2.851885, 1, 0, 0, 1, 1,
1.699967, -1.439877, 5.251768, 0, 0, 0, 1, 1,
1.721712, -0.3407983, 2.148905, 0, 0, 0, 1, 1,
1.723487, 0.3164078, 1.96086, 0, 0, 0, 1, 1,
1.733776, -1.222279, 3.2384, 0, 0, 0, 1, 1,
1.751818, -0.3639621, 1.573135, 0, 0, 0, 1, 1,
1.775432, -0.1346453, 2.821007, 0, 0, 0, 1, 1,
1.778545, 0.2684933, -0.3083387, 0, 0, 0, 1, 1,
1.781309, 0.3455368, 1.388241, 1, 1, 1, 1, 1,
1.805831, -1.633414, 2.085499, 1, 1, 1, 1, 1,
1.811206, 0.5172857, 2.133543, 1, 1, 1, 1, 1,
1.837192, -0.1324163, 3.480456, 1, 1, 1, 1, 1,
1.840182, -0.1743067, 1.647348, 1, 1, 1, 1, 1,
1.841392, -0.8322276, 1.301076, 1, 1, 1, 1, 1,
1.841946, -1.169629, 2.151732, 1, 1, 1, 1, 1,
1.849783, 0.05948148, 0.7902275, 1, 1, 1, 1, 1,
1.872828, -1.721337, 2.349587, 1, 1, 1, 1, 1,
1.891299, -0.2484036, 0.2617107, 1, 1, 1, 1, 1,
1.912357, 1.06884, 1.903097, 1, 1, 1, 1, 1,
1.913846, -0.7124634, 0.7421363, 1, 1, 1, 1, 1,
1.958648, 1.826827, 1.451858, 1, 1, 1, 1, 1,
1.991212, 0.6171346, 2.162904, 1, 1, 1, 1, 1,
2.01393, -1.415664, 1.551501, 1, 1, 1, 1, 1,
2.014834, 0.8761972, 3.032091, 0, 0, 1, 1, 1,
2.019302, 1.297951, 0.9326665, 1, 0, 0, 1, 1,
2.027597, -0.1092576, 1.677408, 1, 0, 0, 1, 1,
2.067566, 0.4356058, 1.385438, 1, 0, 0, 1, 1,
2.072485, -0.3641483, 2.575742, 1, 0, 0, 1, 1,
2.082839, -0.2019313, 2.874744, 1, 0, 0, 1, 1,
2.090957, 0.8278703, 1.766721, 0, 0, 0, 1, 1,
2.097711, -1.594434, 2.67473, 0, 0, 0, 1, 1,
2.169291, 1.739031, 0.1119907, 0, 0, 0, 1, 1,
2.292508, -0.808381, 2.849433, 0, 0, 0, 1, 1,
2.297817, 0.1559869, 2.905908, 0, 0, 0, 1, 1,
2.300724, 1.213059, 1.648893, 0, 0, 0, 1, 1,
2.323665, 0.7507609, 1.291647, 0, 0, 0, 1, 1,
2.374021, -1.140254, 2.454876, 1, 1, 1, 1, 1,
2.395916, -1.402987, 3.012657, 1, 1, 1, 1, 1,
2.463988, 0.3972283, 0.8383361, 1, 1, 1, 1, 1,
2.479851, -2.725346, 1.629191, 1, 1, 1, 1, 1,
2.602551, -0.4816543, 2.334746, 1, 1, 1, 1, 1,
2.846121, -0.4203802, 2.739854, 1, 1, 1, 1, 1,
2.911722, 0.1346568, 1.665599, 1, 1, 1, 1, 1
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
var radius = 9.999852;
var distance = 35.12405;
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
mvMatrix.translate( -0.08176756, -0.3437738, 0.07214928 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.12405);
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
