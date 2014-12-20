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
-3.19864, -1.530289, -0.929929, 1, 0, 0, 1,
-2.926388, 0.7615218, -1.662227, 1, 0.007843138, 0, 1,
-2.831203, 0.1881319, -0.8866135, 1, 0.01176471, 0, 1,
-2.745571, 0.3928384, -2.310591, 1, 0.01960784, 0, 1,
-2.431603, -0.2349112, -2.091335, 1, 0.02352941, 0, 1,
-2.418715, -0.3265321, -0.6838977, 1, 0.03137255, 0, 1,
-2.361583, -1.01052, -3.21192, 1, 0.03529412, 0, 1,
-2.310686, -0.2633675, -2.269032, 1, 0.04313726, 0, 1,
-2.309272, -1.714387, -1.663706, 1, 0.04705882, 0, 1,
-2.302535, 1.520768, -2.196954, 1, 0.05490196, 0, 1,
-2.248364, -0.4437011, -0.3884253, 1, 0.05882353, 0, 1,
-2.238579, -0.6044264, -0.118495, 1, 0.06666667, 0, 1,
-2.222273, -0.3368951, 0.07644928, 1, 0.07058824, 0, 1,
-2.154209, -0.1791363, -1.24616, 1, 0.07843138, 0, 1,
-2.145508, 0.9780257, -0.9411486, 1, 0.08235294, 0, 1,
-2.11064, -2.359102, -2.957425, 1, 0.09019608, 0, 1,
-2.095758, -1.186278, -0.944819, 1, 0.09411765, 0, 1,
-2.081781, 0.5956919, -0.6087227, 1, 0.1019608, 0, 1,
-2.079527, -0.573971, -1.502985, 1, 0.1098039, 0, 1,
-2.019176, 0.3980351, 1.009818, 1, 0.1137255, 0, 1,
-2.003778, 1.030828, -3.513138, 1, 0.1215686, 0, 1,
-2.001767, -0.103255, -2.62372, 1, 0.1254902, 0, 1,
-1.979843, -0.6226047, -1.821236, 1, 0.1333333, 0, 1,
-1.977748, -0.19357, -0.8877427, 1, 0.1372549, 0, 1,
-1.972601, -0.7613722, -3.905634, 1, 0.145098, 0, 1,
-1.966596, 0.1192445, -1.711425, 1, 0.1490196, 0, 1,
-1.956994, 0.1170396, -0.09477076, 1, 0.1568628, 0, 1,
-1.951255, 0.1155452, -2.749667, 1, 0.1607843, 0, 1,
-1.924169, -0.8902221, -2.281544, 1, 0.1686275, 0, 1,
-1.91639, -1.065596, 0.2078236, 1, 0.172549, 0, 1,
-1.913252, -0.04016643, -1.251763, 1, 0.1803922, 0, 1,
-1.899205, -1.674435, -3.276003, 1, 0.1843137, 0, 1,
-1.891748, 2.215832, -1.857576, 1, 0.1921569, 0, 1,
-1.886947, 1.697135, -0.05555119, 1, 0.1960784, 0, 1,
-1.86974, -0.04607502, -0.7146491, 1, 0.2039216, 0, 1,
-1.8539, 0.5090938, -1.313442, 1, 0.2117647, 0, 1,
-1.853013, 0.007365933, -2.380915, 1, 0.2156863, 0, 1,
-1.847035, -0.3005771, -3.672671, 1, 0.2235294, 0, 1,
-1.836709, 1.236693, 0.4750952, 1, 0.227451, 0, 1,
-1.817094, -1.557043, -5.280771, 1, 0.2352941, 0, 1,
-1.798116, 0.425676, -1.250119, 1, 0.2392157, 0, 1,
-1.755144, -0.7933888, -1.87661, 1, 0.2470588, 0, 1,
-1.704226, 0.4148547, -0.7594453, 1, 0.2509804, 0, 1,
-1.703228, -0.3766395, -1.41915, 1, 0.2588235, 0, 1,
-1.698959, 2.072623, -1.776459, 1, 0.2627451, 0, 1,
-1.683316, 0.2649666, -2.661506, 1, 0.2705882, 0, 1,
-1.659514, 1.051306, -1.213374, 1, 0.2745098, 0, 1,
-1.647136, -0.03641234, -0.7910342, 1, 0.282353, 0, 1,
-1.640405, 0.4324449, -0.1961889, 1, 0.2862745, 0, 1,
-1.628567, -1.630231, -2.461202, 1, 0.2941177, 0, 1,
-1.623719, -1.440139, -3.10487, 1, 0.3019608, 0, 1,
-1.592196, 1.606304, -1.815812, 1, 0.3058824, 0, 1,
-1.576574, -0.3018869, -2.897333, 1, 0.3137255, 0, 1,
-1.572416, -0.4393074, -0.4359963, 1, 0.3176471, 0, 1,
-1.567783, -1.382461, -2.470389, 1, 0.3254902, 0, 1,
-1.554484, 1.032135, -0.8840315, 1, 0.3294118, 0, 1,
-1.54556, -0.260372, -2.06861, 1, 0.3372549, 0, 1,
-1.542436, 0.3374909, -2.364747, 1, 0.3411765, 0, 1,
-1.54015, -1.037546, -2.681973, 1, 0.3490196, 0, 1,
-1.521625, 0.1895702, -1.233701, 1, 0.3529412, 0, 1,
-1.519938, -0.6318578, -0.6272949, 1, 0.3607843, 0, 1,
-1.516294, -0.1304332, -1.470076, 1, 0.3647059, 0, 1,
-1.51572, 0.8501211, -1.420601, 1, 0.372549, 0, 1,
-1.510598, 0.8674284, 0.4145103, 1, 0.3764706, 0, 1,
-1.510196, 0.6680729, -1.296986, 1, 0.3843137, 0, 1,
-1.497235, 1.409604, -1.192481, 1, 0.3882353, 0, 1,
-1.48817, -1.511302, -3.027074, 1, 0.3960784, 0, 1,
-1.485273, -0.9549807, -1.395316, 1, 0.4039216, 0, 1,
-1.453222, 0.6595817, -1.239815, 1, 0.4078431, 0, 1,
-1.442741, 0.8028725, -1.156839, 1, 0.4156863, 0, 1,
-1.441687, -0.4207194, -0.6179605, 1, 0.4196078, 0, 1,
-1.439615, 0.5285098, -2.701816, 1, 0.427451, 0, 1,
-1.425669, -0.2600715, -1.981042, 1, 0.4313726, 0, 1,
-1.423865, 0.2312622, -0.2911895, 1, 0.4392157, 0, 1,
-1.411987, 1.782261, -1.347687, 1, 0.4431373, 0, 1,
-1.408363, 0.4868565, -1.836419, 1, 0.4509804, 0, 1,
-1.397809, 0.7059422, -3.335181, 1, 0.454902, 0, 1,
-1.378696, 0.1042719, 0.253359, 1, 0.4627451, 0, 1,
-1.378072, -0.3676408, -1.556865, 1, 0.4666667, 0, 1,
-1.372857, -1.59659, -3.094139, 1, 0.4745098, 0, 1,
-1.371098, -2.771605, -1.679885, 1, 0.4784314, 0, 1,
-1.370635, -0.5982789, -2.405577, 1, 0.4862745, 0, 1,
-1.370592, -1.137597, -1.827649, 1, 0.4901961, 0, 1,
-1.358331, -1.30114, -2.268747, 1, 0.4980392, 0, 1,
-1.357242, 0.921059, -1.612132, 1, 0.5058824, 0, 1,
-1.355594, -1.337686, -3.679965, 1, 0.509804, 0, 1,
-1.321672, -0.8547866, -1.487977, 1, 0.5176471, 0, 1,
-1.311684, 0.8710911, -1.115529, 1, 0.5215687, 0, 1,
-1.301993, 1.379097, -2.069206, 1, 0.5294118, 0, 1,
-1.294119, 2.650865, -0.9194422, 1, 0.5333334, 0, 1,
-1.29142, 0.1857361, -1.746757, 1, 0.5411765, 0, 1,
-1.282809, -2.093563, -1.298808, 1, 0.5450981, 0, 1,
-1.271169, -0.1957678, -2.574359, 1, 0.5529412, 0, 1,
-1.268256, 1.620894, -0.915151, 1, 0.5568628, 0, 1,
-1.251033, 1.671976, -0.444963, 1, 0.5647059, 0, 1,
-1.249661, 0.4368787, -2.13512, 1, 0.5686275, 0, 1,
-1.235614, -1.187847, -1.948227, 1, 0.5764706, 0, 1,
-1.232554, -0.7376784, -0.840906, 1, 0.5803922, 0, 1,
-1.232129, 0.090473, -0.8385047, 1, 0.5882353, 0, 1,
-1.231868, -1.656342, -1.662952, 1, 0.5921569, 0, 1,
-1.223133, -0.8203992, -1.071544, 1, 0.6, 0, 1,
-1.210931, -0.2040591, -1.506271, 1, 0.6078432, 0, 1,
-1.207043, 0.8741799, -0.4756247, 1, 0.6117647, 0, 1,
-1.206208, 1.350504, -0.3116978, 1, 0.6196079, 0, 1,
-1.202665, -0.9152209, -3.192352, 1, 0.6235294, 0, 1,
-1.199177, 0.343576, 0.192725, 1, 0.6313726, 0, 1,
-1.198388, -1.178223, -2.341572, 1, 0.6352941, 0, 1,
-1.184097, -1.05243, -1.790163, 1, 0.6431373, 0, 1,
-1.174189, 0.9418278, 1.330851, 1, 0.6470588, 0, 1,
-1.164058, -0.2575634, -3.137406, 1, 0.654902, 0, 1,
-1.161066, 1.379714, 0.03660521, 1, 0.6588235, 0, 1,
-1.160236, 0.4316985, -2.221699, 1, 0.6666667, 0, 1,
-1.157325, 0.494757, -1.94347, 1, 0.6705883, 0, 1,
-1.153743, -0.4639795, -2.815284, 1, 0.6784314, 0, 1,
-1.146778, -0.7816117, -0.3276733, 1, 0.682353, 0, 1,
-1.137682, -2.326437, -2.712044, 1, 0.6901961, 0, 1,
-1.131317, -0.09073223, -2.164649, 1, 0.6941177, 0, 1,
-1.124189, 0.2219487, -1.131905, 1, 0.7019608, 0, 1,
-1.118125, -1.139569, -1.60688, 1, 0.7098039, 0, 1,
-1.11576, 0.6025297, -0.8116035, 1, 0.7137255, 0, 1,
-1.113775, 0.566833, -0.7958921, 1, 0.7215686, 0, 1,
-1.104249, 0.5885506, -1.328084, 1, 0.7254902, 0, 1,
-1.100703, 0.6645949, -0.7064105, 1, 0.7333333, 0, 1,
-1.095954, -0.4439053, -0.5779313, 1, 0.7372549, 0, 1,
-1.095096, 1.607609, -2.291209, 1, 0.7450981, 0, 1,
-1.092849, -0.1488402, -1.923079, 1, 0.7490196, 0, 1,
-1.090193, -2.026095, -3.292301, 1, 0.7568628, 0, 1,
-1.087336, -0.7688611, -1.117232, 1, 0.7607843, 0, 1,
-1.069154, 1.792724, -0.6998696, 1, 0.7686275, 0, 1,
-1.067075, 0.701981, -2.23001, 1, 0.772549, 0, 1,
-1.054504, 0.6099059, -0.2118323, 1, 0.7803922, 0, 1,
-1.054195, -0.3891191, -0.8299381, 1, 0.7843137, 0, 1,
-1.049008, 0.5819142, -0.3166599, 1, 0.7921569, 0, 1,
-1.03818, -0.3942541, -2.609065, 1, 0.7960784, 0, 1,
-1.030845, 1.516047, -2.167629, 1, 0.8039216, 0, 1,
-1.014761, 0.05719606, -1.10902, 1, 0.8117647, 0, 1,
-1.012715, 0.8039252, -1.599635, 1, 0.8156863, 0, 1,
-1.01229, 0.2813935, -1.051746, 1, 0.8235294, 0, 1,
-1.008081, -2.265992, -2.015452, 1, 0.827451, 0, 1,
-0.9992348, 0.7482228, -0.7630976, 1, 0.8352941, 0, 1,
-0.9920685, -1.015163, -2.170785, 1, 0.8392157, 0, 1,
-0.9904748, -0.2540747, -1.06727, 1, 0.8470588, 0, 1,
-0.9793743, -2.195072, -3.20363, 1, 0.8509804, 0, 1,
-0.9678501, -2.438278, -2.066275, 1, 0.8588235, 0, 1,
-0.9674864, 0.09938794, -1.927128, 1, 0.8627451, 0, 1,
-0.9663867, 0.1587792, -0.1285039, 1, 0.8705882, 0, 1,
-0.9653857, 0.4244163, -1.07538, 1, 0.8745098, 0, 1,
-0.961498, 0.4300442, -0.5896388, 1, 0.8823529, 0, 1,
-0.9614705, 0.2000921, -2.05443, 1, 0.8862745, 0, 1,
-0.9612371, -1.531395, -1.531634, 1, 0.8941177, 0, 1,
-0.95045, -0.6796201, -0.7280427, 1, 0.8980392, 0, 1,
-0.9426822, -0.4649462, -1.804946, 1, 0.9058824, 0, 1,
-0.9335451, -0.356759, -2.638829, 1, 0.9137255, 0, 1,
-0.9331924, -0.4852395, -0.7744231, 1, 0.9176471, 0, 1,
-0.9324676, 0.2939645, -0.9808472, 1, 0.9254902, 0, 1,
-0.930832, -0.8814242, -1.590837, 1, 0.9294118, 0, 1,
-0.9283016, 0.9431479, -0.436413, 1, 0.9372549, 0, 1,
-0.9221746, -0.002895419, -1.323031, 1, 0.9411765, 0, 1,
-0.9213375, 2.289619, -1.591168, 1, 0.9490196, 0, 1,
-0.9195348, -0.9351737, -1.369934, 1, 0.9529412, 0, 1,
-0.9130268, -1.902169, -4.176847, 1, 0.9607843, 0, 1,
-0.9110066, -0.973041, -0.6722171, 1, 0.9647059, 0, 1,
-0.909264, 0.09785181, -1.720227, 1, 0.972549, 0, 1,
-0.9022485, -0.06690801, -1.975555, 1, 0.9764706, 0, 1,
-0.9012166, 0.306227, -2.086838, 1, 0.9843137, 0, 1,
-0.8982521, 0.1682047, -2.871646, 1, 0.9882353, 0, 1,
-0.8965194, 1.8085, -0.8064165, 1, 0.9960784, 0, 1,
-0.8916032, -0.394121, -1.618571, 0.9960784, 1, 0, 1,
-0.886765, 1.276707, 1.120682, 0.9921569, 1, 0, 1,
-0.8843074, 0.3465699, -2.416185, 0.9843137, 1, 0, 1,
-0.874683, -0.5603473, -1.889578, 0.9803922, 1, 0, 1,
-0.8745721, 0.03478892, -1.151775, 0.972549, 1, 0, 1,
-0.8715467, 1.658964, -1.093187, 0.9686275, 1, 0, 1,
-0.8692885, 0.02142302, -0.3858535, 0.9607843, 1, 0, 1,
-0.8669561, 0.4729422, 0.4530391, 0.9568627, 1, 0, 1,
-0.8665054, 0.3096742, -4.084647, 0.9490196, 1, 0, 1,
-0.8632258, -0.9503844, -0.7399737, 0.945098, 1, 0, 1,
-0.8607317, 0.4293806, -3.756758, 0.9372549, 1, 0, 1,
-0.8598524, -0.9321644, -0.7549725, 0.9333333, 1, 0, 1,
-0.8554266, -0.7162328, -2.674746, 0.9254902, 1, 0, 1,
-0.8510256, 1.642684, -1.015664, 0.9215686, 1, 0, 1,
-0.8500062, -1.122559, -1.001827, 0.9137255, 1, 0, 1,
-0.8459078, -1.304635, -1.607373, 0.9098039, 1, 0, 1,
-0.8456531, -0.8712215, -1.75014, 0.9019608, 1, 0, 1,
-0.8384228, -0.181266, -2.528785, 0.8941177, 1, 0, 1,
-0.8380359, -1.778784, -3.265869, 0.8901961, 1, 0, 1,
-0.8359767, -0.2531708, -2.314251, 0.8823529, 1, 0, 1,
-0.8322591, -0.000466251, -2.747598, 0.8784314, 1, 0, 1,
-0.8240861, -1.092059, -2.072791, 0.8705882, 1, 0, 1,
-0.8195524, 0.5616736, -1.296195, 0.8666667, 1, 0, 1,
-0.817627, -1.243373, -2.414805, 0.8588235, 1, 0, 1,
-0.8126205, -0.6255263, -2.903486, 0.854902, 1, 0, 1,
-0.8089142, -0.7558909, -2.337224, 0.8470588, 1, 0, 1,
-0.8050013, -1.883955, -3.208551, 0.8431373, 1, 0, 1,
-0.8026949, -1.18012, -3.874112, 0.8352941, 1, 0, 1,
-0.7938783, -0.1761631, -2.08585, 0.8313726, 1, 0, 1,
-0.7880909, 0.1332999, 0.7655268, 0.8235294, 1, 0, 1,
-0.7880269, -0.7964139, -2.90498, 0.8196079, 1, 0, 1,
-0.7837909, 0.6835076, -0.7931888, 0.8117647, 1, 0, 1,
-0.781058, 0.7988315, -1.514319, 0.8078431, 1, 0, 1,
-0.7803192, 1.212603, -0.6864426, 0.8, 1, 0, 1,
-0.7798544, -0.09046046, -2.171374, 0.7921569, 1, 0, 1,
-0.776996, 0.3170754, -2.958381, 0.7882353, 1, 0, 1,
-0.7767397, -1.416378, -1.73316, 0.7803922, 1, 0, 1,
-0.776279, 0.7169592, -1.188261, 0.7764706, 1, 0, 1,
-0.7626408, 0.6039771, -0.3650001, 0.7686275, 1, 0, 1,
-0.7626312, -0.8593791, -1.77309, 0.7647059, 1, 0, 1,
-0.7616342, 0.5389524, -0.7014931, 0.7568628, 1, 0, 1,
-0.7604638, 1.280874, -0.3744492, 0.7529412, 1, 0, 1,
-0.7560214, -1.288741, -1.470766, 0.7450981, 1, 0, 1,
-0.7531542, 0.9123175, 0.5089931, 0.7411765, 1, 0, 1,
-0.740513, 0.2141134, -3.319731, 0.7333333, 1, 0, 1,
-0.7404407, -1.01849, -2.585601, 0.7294118, 1, 0, 1,
-0.7321154, 1.703004, -0.445484, 0.7215686, 1, 0, 1,
-0.7296082, 1.735205, -2.073566, 0.7176471, 1, 0, 1,
-0.7234098, -0.4420533, -0.9768997, 0.7098039, 1, 0, 1,
-0.7222417, 0.2181807, -1.718769, 0.7058824, 1, 0, 1,
-0.7209222, -2.110802, -4.974828, 0.6980392, 1, 0, 1,
-0.7196531, 0.8433852, -1.890827, 0.6901961, 1, 0, 1,
-0.7170578, -2.986107, -2.477644, 0.6862745, 1, 0, 1,
-0.7153643, 0.6587799, -2.782504, 0.6784314, 1, 0, 1,
-0.7118514, -2.611315, -3.432633, 0.6745098, 1, 0, 1,
-0.7102556, 0.6227991, -0.3720565, 0.6666667, 1, 0, 1,
-0.7073252, -0.1122654, -1.445475, 0.6627451, 1, 0, 1,
-0.7028397, -1.716866, -3.254437, 0.654902, 1, 0, 1,
-0.7016914, -2.428479, -2.422647, 0.6509804, 1, 0, 1,
-0.6954026, -0.8275549, -3.295495, 0.6431373, 1, 0, 1,
-0.695371, -0.1051171, -2.030705, 0.6392157, 1, 0, 1,
-0.6915618, -2.428283, -3.329455, 0.6313726, 1, 0, 1,
-0.6892325, 1.914864, -0.06804668, 0.627451, 1, 0, 1,
-0.684571, -0.6133227, -3.215157, 0.6196079, 1, 0, 1,
-0.6778753, -0.8976775, -3.327831, 0.6156863, 1, 0, 1,
-0.6768136, -1.801458, -4.799349, 0.6078432, 1, 0, 1,
-0.6751607, 1.131015, -0.8255575, 0.6039216, 1, 0, 1,
-0.6742814, -0.9591589, -1.706516, 0.5960785, 1, 0, 1,
-0.6723763, -0.9878381, -3.217641, 0.5882353, 1, 0, 1,
-0.6677034, 0.7323835, -1.436463, 0.5843138, 1, 0, 1,
-0.6594397, 1.598127, -1.219159, 0.5764706, 1, 0, 1,
-0.6591862, -0.3156261, -1.431329, 0.572549, 1, 0, 1,
-0.658536, 0.4823178, -1.617198, 0.5647059, 1, 0, 1,
-0.6546903, -0.4376078, -1.982006, 0.5607843, 1, 0, 1,
-0.6476172, 0.8708689, 0.6160777, 0.5529412, 1, 0, 1,
-0.6465667, -0.5355067, -1.995158, 0.5490196, 1, 0, 1,
-0.6463521, -0.6367934, -2.305312, 0.5411765, 1, 0, 1,
-0.6440402, -1.238642, -1.951458, 0.5372549, 1, 0, 1,
-0.642074, -1.964907, -3.283756, 0.5294118, 1, 0, 1,
-0.6408399, -2.081955, -2.482418, 0.5254902, 1, 0, 1,
-0.6391391, 0.644761, -1.077815, 0.5176471, 1, 0, 1,
-0.6361474, 0.2213259, -1.415128, 0.5137255, 1, 0, 1,
-0.6345018, 0.737247, -2.514349, 0.5058824, 1, 0, 1,
-0.6330619, 1.108138, -0.8116001, 0.5019608, 1, 0, 1,
-0.6328139, -0.3245804, -3.674638, 0.4941176, 1, 0, 1,
-0.6324095, 0.2403606, -0.6434041, 0.4862745, 1, 0, 1,
-0.6321228, 0.5497251, -0.5118977, 0.4823529, 1, 0, 1,
-0.6310089, -0.5333782, -2.394148, 0.4745098, 1, 0, 1,
-0.624908, 0.1599396, -1.230308, 0.4705882, 1, 0, 1,
-0.624009, -1.021251, -1.406847, 0.4627451, 1, 0, 1,
-0.6220176, -0.8402953, -2.954368, 0.4588235, 1, 0, 1,
-0.6214973, 0.4588408, -1.588886, 0.4509804, 1, 0, 1,
-0.6213604, -1.412432, -2.25278, 0.4470588, 1, 0, 1,
-0.6207227, -0.4223661, -0.08426996, 0.4392157, 1, 0, 1,
-0.6164288, -1.217726, -2.20317, 0.4352941, 1, 0, 1,
-0.613448, -2.383788, -2.664266, 0.427451, 1, 0, 1,
-0.6123828, 0.05432002, -1.084888, 0.4235294, 1, 0, 1,
-0.6100332, 0.2666978, -2.088916, 0.4156863, 1, 0, 1,
-0.608632, -1.740595, -5.118494, 0.4117647, 1, 0, 1,
-0.6031594, 0.2339205, -1.194588, 0.4039216, 1, 0, 1,
-0.5947718, -0.4405348, -3.031161, 0.3960784, 1, 0, 1,
-0.5917748, 0.1421213, -2.405564, 0.3921569, 1, 0, 1,
-0.5916575, -1.351518, -3.395233, 0.3843137, 1, 0, 1,
-0.5912234, -1.07619, -2.287585, 0.3803922, 1, 0, 1,
-0.5881324, 0.8298153, -0.9433541, 0.372549, 1, 0, 1,
-0.5802242, 1.564672, -0.2014233, 0.3686275, 1, 0, 1,
-0.5796365, 0.4891634, -1.585745, 0.3607843, 1, 0, 1,
-0.5740612, 0.7324757, 0.4120038, 0.3568628, 1, 0, 1,
-0.5714257, 0.9532306, -1.420693, 0.3490196, 1, 0, 1,
-0.5706908, -0.2316574, -1.483756, 0.345098, 1, 0, 1,
-0.5692456, 1.543282, -0.5577875, 0.3372549, 1, 0, 1,
-0.5677519, 2.003204, -1.530053, 0.3333333, 1, 0, 1,
-0.5660365, -1.185769, -3.980197, 0.3254902, 1, 0, 1,
-0.5622401, -0.1913963, -0.6620545, 0.3215686, 1, 0, 1,
-0.5566987, -0.6080063, -1.92468, 0.3137255, 1, 0, 1,
-0.5553019, -0.6867068, -3.134183, 0.3098039, 1, 0, 1,
-0.5499322, 1.422659, -0.4677468, 0.3019608, 1, 0, 1,
-0.5485421, 0.1638706, -0.7499456, 0.2941177, 1, 0, 1,
-0.5473423, 0.2032818, -1.251359, 0.2901961, 1, 0, 1,
-0.5401366, 0.6160566, -1.011012, 0.282353, 1, 0, 1,
-0.5396428, 1.290442, 0.03537402, 0.2784314, 1, 0, 1,
-0.5387942, -1.462228, -1.679814, 0.2705882, 1, 0, 1,
-0.5323927, -2.259343, -2.876189, 0.2666667, 1, 0, 1,
-0.532182, -0.4633253, -2.123062, 0.2588235, 1, 0, 1,
-0.5306287, -0.2007074, -1.567106, 0.254902, 1, 0, 1,
-0.5304037, -0.3961002, -1.279486, 0.2470588, 1, 0, 1,
-0.5303642, -1.037416, -3.435509, 0.2431373, 1, 0, 1,
-0.5302907, -0.9093981, -3.487119, 0.2352941, 1, 0, 1,
-0.5231748, 0.1376708, -1.490933, 0.2313726, 1, 0, 1,
-0.5213352, -0.9567123, -2.992074, 0.2235294, 1, 0, 1,
-0.5203427, 0.4057939, -2.108966, 0.2196078, 1, 0, 1,
-0.5202038, 0.1859767, -1.801977, 0.2117647, 1, 0, 1,
-0.5188569, 0.8263785, -1.259989, 0.2078431, 1, 0, 1,
-0.5187886, -0.421355, -2.888189, 0.2, 1, 0, 1,
-0.5183857, 0.0242134, -2.880076, 0.1921569, 1, 0, 1,
-0.5177988, 1.513206, 1.055755, 0.1882353, 1, 0, 1,
-0.5162445, 2.331348, -1.307358, 0.1803922, 1, 0, 1,
-0.5150924, -0.1795984, -1.924585, 0.1764706, 1, 0, 1,
-0.5111926, 0.6584656, -2.138866, 0.1686275, 1, 0, 1,
-0.5085728, -0.7634403, -3.454654, 0.1647059, 1, 0, 1,
-0.5076091, 0.4049597, -2.559342, 0.1568628, 1, 0, 1,
-0.5052589, -0.1552525, -0.01948741, 0.1529412, 1, 0, 1,
-0.499503, 1.294372, 0.8918521, 0.145098, 1, 0, 1,
-0.4952361, -1.007229, -2.016902, 0.1411765, 1, 0, 1,
-0.4951029, -0.1791075, -2.54713, 0.1333333, 1, 0, 1,
-0.4946644, 0.1122564, -1.368217, 0.1294118, 1, 0, 1,
-0.4888783, 0.2067767, -0.7841398, 0.1215686, 1, 0, 1,
-0.4877212, 0.8376158, -0.4560909, 0.1176471, 1, 0, 1,
-0.4873124, 1.217082, 0.3244987, 0.1098039, 1, 0, 1,
-0.4842739, -0.7762267, -1.894691, 0.1058824, 1, 0, 1,
-0.4842676, 0.8313442, -1.225186, 0.09803922, 1, 0, 1,
-0.4834677, -0.1219405, -1.709699, 0.09019608, 1, 0, 1,
-0.4736137, -0.629755, -3.461, 0.08627451, 1, 0, 1,
-0.4723034, 0.6556669, 0.6034253, 0.07843138, 1, 0, 1,
-0.462243, -0.7386701, -2.371476, 0.07450981, 1, 0, 1,
-0.4574516, -1.331597, -3.50461, 0.06666667, 1, 0, 1,
-0.4521346, -2.124526, -1.759472, 0.0627451, 1, 0, 1,
-0.4510243, 2.596132, -0.5563074, 0.05490196, 1, 0, 1,
-0.447115, -0.9389005, -2.523401, 0.05098039, 1, 0, 1,
-0.4464786, -0.1828527, -1.724646, 0.04313726, 1, 0, 1,
-0.44425, 1.386712, -2.488414, 0.03921569, 1, 0, 1,
-0.4427436, 0.09351936, -1.014945, 0.03137255, 1, 0, 1,
-0.4401324, 1.50894, 0.1229925, 0.02745098, 1, 0, 1,
-0.4360817, 0.0929552, -1.499601, 0.01960784, 1, 0, 1,
-0.4357276, 1.078059, -2.18964, 0.01568628, 1, 0, 1,
-0.4330592, -0.2601617, -3.368334, 0.007843138, 1, 0, 1,
-0.4319369, -0.8183816, 0.5795197, 0.003921569, 1, 0, 1,
-0.4308308, -1.591197, -1.700882, 0, 1, 0.003921569, 1,
-0.4301912, -0.2369946, -2.014951, 0, 1, 0.01176471, 1,
-0.4299328, -0.9323188, -3.57772, 0, 1, 0.01568628, 1,
-0.4288822, 1.675163, -1.921719, 0, 1, 0.02352941, 1,
-0.4250837, -1.175327, -1.898839, 0, 1, 0.02745098, 1,
-0.4195229, 1.70334, -0.4681281, 0, 1, 0.03529412, 1,
-0.4174691, 0.07728609, -0.1506494, 0, 1, 0.03921569, 1,
-0.4157362, 1.500856, -1.597715, 0, 1, 0.04705882, 1,
-0.4093451, 0.3885141, -1.503397, 0, 1, 0.05098039, 1,
-0.4086567, 1.009516, -0.2498483, 0, 1, 0.05882353, 1,
-0.4085704, 0.7322891, -1.596882, 0, 1, 0.0627451, 1,
-0.4034587, -0.6487522, -2.719543, 0, 1, 0.07058824, 1,
-0.3982534, 0.7374231, -0.07287239, 0, 1, 0.07450981, 1,
-0.3891883, -0.2076182, -2.116257, 0, 1, 0.08235294, 1,
-0.3891803, 0.6896203, -0.2189951, 0, 1, 0.08627451, 1,
-0.3814285, -1.095125, -3.047299, 0, 1, 0.09411765, 1,
-0.3795629, 0.316589, -0.01740886, 0, 1, 0.1019608, 1,
-0.3792404, -0.4098667, -1.516173, 0, 1, 0.1058824, 1,
-0.377289, -0.3509502, -2.255599, 0, 1, 0.1137255, 1,
-0.3635576, -1.163892, -3.796463, 0, 1, 0.1176471, 1,
-0.3627696, -0.5326699, -1.263857, 0, 1, 0.1254902, 1,
-0.361388, 0.2699167, -0.2901084, 0, 1, 0.1294118, 1,
-0.3609526, 1.616668, 1.496083, 0, 1, 0.1372549, 1,
-0.3566785, -1.267533, -2.937846, 0, 1, 0.1411765, 1,
-0.3554607, -0.2772774, -0.7302732, 0, 1, 0.1490196, 1,
-0.3458132, 0.5324076, -1.151423, 0, 1, 0.1529412, 1,
-0.3443072, -0.2293067, -0.8724185, 0, 1, 0.1607843, 1,
-0.3440509, 2.023196, 0.3292305, 0, 1, 0.1647059, 1,
-0.3433277, -1.176829, -2.097564, 0, 1, 0.172549, 1,
-0.3401327, -0.8104481, -0.7646942, 0, 1, 0.1764706, 1,
-0.3355845, -1.728687, -3.892316, 0, 1, 0.1843137, 1,
-0.335461, -0.7727388, -2.567906, 0, 1, 0.1882353, 1,
-0.33509, 1.418682, 0.1151721, 0, 1, 0.1960784, 1,
-0.3317466, 0.4561785, -1.479029, 0, 1, 0.2039216, 1,
-0.3262737, 0.03286583, -2.534535, 0, 1, 0.2078431, 1,
-0.3251463, -1.207828, -4.745324, 0, 1, 0.2156863, 1,
-0.3213401, 1.222966, -0.2949765, 0, 1, 0.2196078, 1,
-0.3187797, -0.2808469, -3.793211, 0, 1, 0.227451, 1,
-0.3134148, 0.485462, -1.913769, 0, 1, 0.2313726, 1,
-0.3112174, -1.295959, -2.425304, 0, 1, 0.2392157, 1,
-0.3088914, -0.2007927, -3.708379, 0, 1, 0.2431373, 1,
-0.3059336, -0.9577012, -3.194539, 0, 1, 0.2509804, 1,
-0.3013218, -1.299976, -3.520395, 0, 1, 0.254902, 1,
-0.3012988, 4.001104, -0.8135165, 0, 1, 0.2627451, 1,
-0.2984234, 0.6165503, -1.903548, 0, 1, 0.2666667, 1,
-0.2943765, 0.7146975, -1.992057, 0, 1, 0.2745098, 1,
-0.2912663, 1.924013, 0.1019826, 0, 1, 0.2784314, 1,
-0.2908137, -0.9655987, -1.889867, 0, 1, 0.2862745, 1,
-0.2877059, 0.3021375, -2.013424, 0, 1, 0.2901961, 1,
-0.2864331, 0.1541057, -0.7221965, 0, 1, 0.2980392, 1,
-0.2859969, -0.1125837, 0.000222547, 0, 1, 0.3058824, 1,
-0.2845208, -1.098821, -3.761105, 0, 1, 0.3098039, 1,
-0.2786184, 1.254221, -1.229021, 0, 1, 0.3176471, 1,
-0.2773931, 0.4900953, -1.096065, 0, 1, 0.3215686, 1,
-0.2745888, -0.3167464, -2.584413, 0, 1, 0.3294118, 1,
-0.2742817, -0.7053569, -2.703951, 0, 1, 0.3333333, 1,
-0.2696521, -1.737417, -4.017925, 0, 1, 0.3411765, 1,
-0.2695934, -0.3911325, -1.149101, 0, 1, 0.345098, 1,
-0.2670377, -0.664017, -1.87507, 0, 1, 0.3529412, 1,
-0.2651712, 1.870862, 0.6698135, 0, 1, 0.3568628, 1,
-0.262226, 1.298952, 0.5994571, 0, 1, 0.3647059, 1,
-0.2520142, 3.004487, -1.298455, 0, 1, 0.3686275, 1,
-0.247866, 1.888702, -0.6108559, 0, 1, 0.3764706, 1,
-0.2472016, 0.3962845, 0.0703911, 0, 1, 0.3803922, 1,
-0.2450612, 0.6748493, 1.496423, 0, 1, 0.3882353, 1,
-0.2422624, -0.4563642, -3.026369, 0, 1, 0.3921569, 1,
-0.2407843, 0.6703279, -1.289266, 0, 1, 0.4, 1,
-0.2393243, -1.222615, -2.41623, 0, 1, 0.4078431, 1,
-0.2380472, 2.161479, -0.5114745, 0, 1, 0.4117647, 1,
-0.2374513, 0.6726368, -2.155266, 0, 1, 0.4196078, 1,
-0.2330614, -0.1663191, -0.632683, 0, 1, 0.4235294, 1,
-0.2323398, 0.3478851, 1.398746, 0, 1, 0.4313726, 1,
-0.2309707, -0.8921949, -2.710749, 0, 1, 0.4352941, 1,
-0.226163, 0.07324775, -2.316085, 0, 1, 0.4431373, 1,
-0.2242967, 0.3741923, -1.859596, 0, 1, 0.4470588, 1,
-0.2225963, -0.6086515, -3.620941, 0, 1, 0.454902, 1,
-0.2211712, -0.8778635, -4.532727, 0, 1, 0.4588235, 1,
-0.2192605, -0.4276968, -3.456462, 0, 1, 0.4666667, 1,
-0.2189525, -0.7265247, -3.343632, 0, 1, 0.4705882, 1,
-0.2187527, -0.9051425, -3.055094, 0, 1, 0.4784314, 1,
-0.2148972, 0.670513, 0.5018537, 0, 1, 0.4823529, 1,
-0.2132789, -2.043641, -2.139082, 0, 1, 0.4901961, 1,
-0.211411, -0.4685279, -3.632495, 0, 1, 0.4941176, 1,
-0.2107614, 1.764403, -0.995171, 0, 1, 0.5019608, 1,
-0.2090809, -0.5988744, -1.205333, 0, 1, 0.509804, 1,
-0.2030195, -0.5430906, -3.423106, 0, 1, 0.5137255, 1,
-0.2001578, 0.6020301, -0.7293358, 0, 1, 0.5215687, 1,
-0.1995269, 1.666013, -2.021484, 0, 1, 0.5254902, 1,
-0.1960152, 0.06119938, -1.190416, 0, 1, 0.5333334, 1,
-0.1952272, -0.9581618, -3.749225, 0, 1, 0.5372549, 1,
-0.1804064, 0.8738926, 1.158806, 0, 1, 0.5450981, 1,
-0.1786592, -0.2707087, -2.203976, 0, 1, 0.5490196, 1,
-0.1775718, -0.3317553, -2.962461, 0, 1, 0.5568628, 1,
-0.1769661, 0.07320006, -0.8862341, 0, 1, 0.5607843, 1,
-0.1766265, -0.5971715, -1.283122, 0, 1, 0.5686275, 1,
-0.1750567, 0.2979072, -0.2594395, 0, 1, 0.572549, 1,
-0.1738658, -0.4074769, -2.743492, 0, 1, 0.5803922, 1,
-0.1715667, 0.507975, 0.6916625, 0, 1, 0.5843138, 1,
-0.1650527, 0.7388858, -0.4330241, 0, 1, 0.5921569, 1,
-0.1630819, -0.8805715, -2.83243, 0, 1, 0.5960785, 1,
-0.1629942, 0.1803117, -1.938601, 0, 1, 0.6039216, 1,
-0.1616002, -0.05724977, -2.75094, 0, 1, 0.6117647, 1,
-0.1614824, 0.7353429, -1.962308, 0, 1, 0.6156863, 1,
-0.1555921, 1.571612, -1.644335, 0, 1, 0.6235294, 1,
-0.1514783, 2.277538, 0.560366, 0, 1, 0.627451, 1,
-0.1445542, -0.5358493, -2.930683, 0, 1, 0.6352941, 1,
-0.1445117, -0.7951685, -4.479091, 0, 1, 0.6392157, 1,
-0.1370607, 0.7231315, 0.9072864, 0, 1, 0.6470588, 1,
-0.1346288, 0.4929476, -1.185614, 0, 1, 0.6509804, 1,
-0.1326765, -0.4543893, -2.833556, 0, 1, 0.6588235, 1,
-0.1322835, -0.5279489, -3.009518, 0, 1, 0.6627451, 1,
-0.1296101, -1.002566, -3.584645, 0, 1, 0.6705883, 1,
-0.1262538, -0.9963882, -2.424069, 0, 1, 0.6745098, 1,
-0.1249482, 0.82857, -1.703364, 0, 1, 0.682353, 1,
-0.1216626, -1.043713, -0.06368001, 0, 1, 0.6862745, 1,
-0.1202308, -1.749676, -2.102413, 0, 1, 0.6941177, 1,
-0.119948, 0.1874488, -1.220548, 0, 1, 0.7019608, 1,
-0.1165982, -1.40581, -2.497261, 0, 1, 0.7058824, 1,
-0.1159351, 1.724356, -0.2965325, 0, 1, 0.7137255, 1,
-0.1153223, -0.8709784, -2.91782, 0, 1, 0.7176471, 1,
-0.110944, 0.2537255, -0.1585988, 0, 1, 0.7254902, 1,
-0.1103898, -1.342822, -5.071161, 0, 1, 0.7294118, 1,
-0.1095499, -0.5209211, -1.94458, 0, 1, 0.7372549, 1,
-0.1054217, 1.022291, 0.3331699, 0, 1, 0.7411765, 1,
-0.1043401, -0.9067162, -1.213401, 0, 1, 0.7490196, 1,
-0.1010452, 1.47248, 0.07431604, 0, 1, 0.7529412, 1,
-0.09356186, 0.2185433, -0.6463187, 0, 1, 0.7607843, 1,
-0.09261595, -1.313867, -1.979606, 0, 1, 0.7647059, 1,
-0.0893035, 0.9598793, -0.7923579, 0, 1, 0.772549, 1,
-0.08926132, 1.272937, -0.8979229, 0, 1, 0.7764706, 1,
-0.08881623, 1.111234, -1.025947, 0, 1, 0.7843137, 1,
-0.0876221, -1.227458, -2.987024, 0, 1, 0.7882353, 1,
-0.08733866, -0.3522872, -2.792069, 0, 1, 0.7960784, 1,
-0.08115685, -2.04083, -5.795589, 0, 1, 0.8039216, 1,
-0.08046946, 0.211372, 2.150789, 0, 1, 0.8078431, 1,
-0.06898908, -0.1595297, -1.813008, 0, 1, 0.8156863, 1,
-0.0655974, -1.074387, -2.84975, 0, 1, 0.8196079, 1,
-0.06382301, 0.8169162, -0.06182994, 0, 1, 0.827451, 1,
-0.0592689, -0.0674877, -1.373107, 0, 1, 0.8313726, 1,
-0.05913605, -2.209866, -3.965489, 0, 1, 0.8392157, 1,
-0.05760179, -0.8990955, -3.187551, 0, 1, 0.8431373, 1,
-0.05611561, -0.2208933, -3.629915, 0, 1, 0.8509804, 1,
-0.05181875, -1.723323, -3.716187, 0, 1, 0.854902, 1,
-0.04972822, 0.3150323, 0.08539267, 0, 1, 0.8627451, 1,
-0.04967038, 0.6513364, -0.6751547, 0, 1, 0.8666667, 1,
-0.04681937, 0.8426601, -0.5733052, 0, 1, 0.8745098, 1,
-0.04508528, 0.6001315, 0.007853976, 0, 1, 0.8784314, 1,
-0.04161748, -0.57204, -2.173952, 0, 1, 0.8862745, 1,
-0.04019108, 1.127887, 0.5421231, 0, 1, 0.8901961, 1,
-0.03700672, 0.2373104, 0.742874, 0, 1, 0.8980392, 1,
-0.03665687, 0.3073596, 1.264948, 0, 1, 0.9058824, 1,
-0.0329891, 0.651384, 1.525427, 0, 1, 0.9098039, 1,
-0.02676817, 0.3443051, -0.6716257, 0, 1, 0.9176471, 1,
-0.0252836, 1.429464, -0.2655692, 0, 1, 0.9215686, 1,
-0.02256624, 0.06244292, -0.1991231, 0, 1, 0.9294118, 1,
-0.02094326, 0.6259786, -1.836055, 0, 1, 0.9333333, 1,
-0.01806241, -0.3657386, -2.40615, 0, 1, 0.9411765, 1,
-0.01684807, -0.3175253, -1.612864, 0, 1, 0.945098, 1,
-0.0140717, 1.496326, -0.3621102, 0, 1, 0.9529412, 1,
-0.01370145, 0.4722138, -1.83868, 0, 1, 0.9568627, 1,
-0.01302573, 1.598643, -0.5083121, 0, 1, 0.9647059, 1,
-0.01004162, -0.1612133, -3.089047, 0, 1, 0.9686275, 1,
-0.00434032, -3.277283, -2.044476, 0, 1, 0.9764706, 1,
-0.003362397, -1.269467, -4.245691, 0, 1, 0.9803922, 1,
-0.002464595, 1.127542, 1.609816, 0, 1, 0.9882353, 1,
-0.001291126, 0.2052475, 0.8044831, 0, 1, 0.9921569, 1,
0.001861519, -0.7377449, 4.475626, 0, 1, 1, 1,
0.005622794, -0.3080916, 2.075054, 0, 0.9921569, 1, 1,
0.005708112, 0.1669084, -0.2958527, 0, 0.9882353, 1, 1,
0.005922765, 0.1349091, -1.085644, 0, 0.9803922, 1, 1,
0.006333433, -1.598868, 5.049971, 0, 0.9764706, 1, 1,
0.008551264, 1.389319, 1.396239, 0, 0.9686275, 1, 1,
0.01021492, -0.6667851, 3.335803, 0, 0.9647059, 1, 1,
0.01031879, 0.4652868, -1.31049, 0, 0.9568627, 1, 1,
0.01438191, 0.244347, 1.981169, 0, 0.9529412, 1, 1,
0.01499286, -1.248919, 1.737753, 0, 0.945098, 1, 1,
0.01694583, -1.131982, 4.516191, 0, 0.9411765, 1, 1,
0.0284011, -0.3019978, 1.982901, 0, 0.9333333, 1, 1,
0.02926572, 1.245826, 1.002809, 0, 0.9294118, 1, 1,
0.0323691, -1.655272, 2.552865, 0, 0.9215686, 1, 1,
0.03363096, 1.711141, -1.171251, 0, 0.9176471, 1, 1,
0.03448098, 1.452327, -1.665645, 0, 0.9098039, 1, 1,
0.03725087, 1.242383, -0.7574485, 0, 0.9058824, 1, 1,
0.04353377, -1.0878, 1.908597, 0, 0.8980392, 1, 1,
0.04362958, 1.430768, 0.1227909, 0, 0.8901961, 1, 1,
0.04368082, -1.327591, 4.517579, 0, 0.8862745, 1, 1,
0.04627113, -0.2529962, 3.199123, 0, 0.8784314, 1, 1,
0.04648842, 1.245277, -1.31475, 0, 0.8745098, 1, 1,
0.04671567, 1.07313, -0.7459591, 0, 0.8666667, 1, 1,
0.04997921, 0.08161553, -0.3100643, 0, 0.8627451, 1, 1,
0.05761074, 0.8629665, -1.344004, 0, 0.854902, 1, 1,
0.06068241, -0.8163922, 3.446561, 0, 0.8509804, 1, 1,
0.06138397, -0.6827417, 3.199422, 0, 0.8431373, 1, 1,
0.06177761, 0.9854687, 0.3755806, 0, 0.8392157, 1, 1,
0.06201753, 0.3038662, 1.958157, 0, 0.8313726, 1, 1,
0.06243173, 1.159281, -0.4461448, 0, 0.827451, 1, 1,
0.06658606, 1.852854, -0.9018476, 0, 0.8196079, 1, 1,
0.07506449, -1.00443, 3.191145, 0, 0.8156863, 1, 1,
0.0757839, -1.568403, 3.778614, 0, 0.8078431, 1, 1,
0.07632865, -0.8537225, 2.910412, 0, 0.8039216, 1, 1,
0.07692772, 2.197139, 0.6883565, 0, 0.7960784, 1, 1,
0.07847585, 0.4998836, 0.8485569, 0, 0.7882353, 1, 1,
0.0784914, 0.9957775, -0.4807516, 0, 0.7843137, 1, 1,
0.07850388, -0.9298307, 2.962337, 0, 0.7764706, 1, 1,
0.07964515, -0.1942472, 2.630205, 0, 0.772549, 1, 1,
0.08096528, 1.884826, 1.121011, 0, 0.7647059, 1, 1,
0.08783928, 0.1661541, 1.504676, 0, 0.7607843, 1, 1,
0.09245984, 0.3412196, 0.8667259, 0, 0.7529412, 1, 1,
0.09320184, -0.4069213, 3.609836, 0, 0.7490196, 1, 1,
0.0956687, -0.3449254, 4.256021, 0, 0.7411765, 1, 1,
0.0956859, 1.584464, -0.2770271, 0, 0.7372549, 1, 1,
0.09629129, 2.434931, -0.6828933, 0, 0.7294118, 1, 1,
0.09634529, -0.1619452, 3.282696, 0, 0.7254902, 1, 1,
0.1005535, 1.031071, 0.6260049, 0, 0.7176471, 1, 1,
0.1029809, 0.5232218, 0.03254971, 0, 0.7137255, 1, 1,
0.1029854, -0.3799897, 1.589386, 0, 0.7058824, 1, 1,
0.1038972, -0.9472786, 3.045469, 0, 0.6980392, 1, 1,
0.1063223, -1.225184, 4.980441, 0, 0.6941177, 1, 1,
0.1064309, 1.664295, -1.933718, 0, 0.6862745, 1, 1,
0.1113264, 0.001494083, 2.561112, 0, 0.682353, 1, 1,
0.1150093, -0.4811808, 0.5031493, 0, 0.6745098, 1, 1,
0.1171793, 0.3265107, 0.2610358, 0, 0.6705883, 1, 1,
0.1175921, 0.5120237, 0.1707412, 0, 0.6627451, 1, 1,
0.1198812, -1.496076, 3.758698, 0, 0.6588235, 1, 1,
0.1285295, -0.8485159, 4.239153, 0, 0.6509804, 1, 1,
0.1308377, -1.325903, 4.128811, 0, 0.6470588, 1, 1,
0.1315031, 0.9072148, -0.5892211, 0, 0.6392157, 1, 1,
0.1316942, 0.0402739, 2.900626, 0, 0.6352941, 1, 1,
0.1331671, -0.9421363, 4.054905, 0, 0.627451, 1, 1,
0.1366404, 0.726218, -0.05049079, 0, 0.6235294, 1, 1,
0.1382748, 0.3654439, -0.7675363, 0, 0.6156863, 1, 1,
0.1385666, -0.3226991, 3.651588, 0, 0.6117647, 1, 1,
0.1399194, -0.9105744, 4.078068, 0, 0.6039216, 1, 1,
0.1419273, -0.1301077, 1.662967, 0, 0.5960785, 1, 1,
0.1427504, -1.146155, 2.125603, 0, 0.5921569, 1, 1,
0.1439701, 0.09567098, 0.8837868, 0, 0.5843138, 1, 1,
0.144548, 1.283552, 0.03546884, 0, 0.5803922, 1, 1,
0.1560728, -0.3923545, 3.381659, 0, 0.572549, 1, 1,
0.1580854, 0.7520359, 1.307594, 0, 0.5686275, 1, 1,
0.1587831, -0.04902126, 2.236506, 0, 0.5607843, 1, 1,
0.1619869, -0.1001524, 0.946418, 0, 0.5568628, 1, 1,
0.1642816, -0.125598, 2.768493, 0, 0.5490196, 1, 1,
0.1662, -0.2813854, 3.206135, 0, 0.5450981, 1, 1,
0.1689251, 1.12815, 0.1429289, 0, 0.5372549, 1, 1,
0.1762792, 0.9859345, 0.4393526, 0, 0.5333334, 1, 1,
0.178633, -0.3905546, 1.277669, 0, 0.5254902, 1, 1,
0.1791342, 1.320879, -0.3461711, 0, 0.5215687, 1, 1,
0.1845423, -0.1809702, 0.2204947, 0, 0.5137255, 1, 1,
0.1894614, 1.139433, -0.4723494, 0, 0.509804, 1, 1,
0.1961182, -0.6246412, 4.538481, 0, 0.5019608, 1, 1,
0.2006043, 1.270369, 0.8368446, 0, 0.4941176, 1, 1,
0.2006789, -0.4096794, 1.24323, 0, 0.4901961, 1, 1,
0.2038222, 0.08099847, 2.066564, 0, 0.4823529, 1, 1,
0.2041147, -0.7508104, 2.541287, 0, 0.4784314, 1, 1,
0.2097677, 1.352199, 1.045164, 0, 0.4705882, 1, 1,
0.2124927, 0.7808098, 0.5367108, 0, 0.4666667, 1, 1,
0.2240091, 0.5231098, -0.6058497, 0, 0.4588235, 1, 1,
0.2249862, -1.261672, 2.58093, 0, 0.454902, 1, 1,
0.2255949, 0.3127059, 1.490578, 0, 0.4470588, 1, 1,
0.2333274, -0.3358905, 2.231503, 0, 0.4431373, 1, 1,
0.2367087, -0.7084046, 1.794094, 0, 0.4352941, 1, 1,
0.2380144, 1.18657, 1.452799, 0, 0.4313726, 1, 1,
0.2383768, -0.9759366, 1.844299, 0, 0.4235294, 1, 1,
0.2406958, -0.3040631, 1.83511, 0, 0.4196078, 1, 1,
0.2408713, 0.8925149, -0.1843222, 0, 0.4117647, 1, 1,
0.245369, -0.8895794, 1.969944, 0, 0.4078431, 1, 1,
0.2480123, 0.488525, -0.7203873, 0, 0.4, 1, 1,
0.2504639, -1.238324, 1.562788, 0, 0.3921569, 1, 1,
0.254139, 0.7528893, -1.900243, 0, 0.3882353, 1, 1,
0.256494, 0.9880252, 0.3411933, 0, 0.3803922, 1, 1,
0.2604601, -0.4816789, 2.660326, 0, 0.3764706, 1, 1,
0.2654727, 0.6898879, 0.9878108, 0, 0.3686275, 1, 1,
0.2659867, 0.3413136, -0.6266087, 0, 0.3647059, 1, 1,
0.2663255, -1.775663, 0.8626105, 0, 0.3568628, 1, 1,
0.2712603, 0.2811531, 2.113179, 0, 0.3529412, 1, 1,
0.2765546, -1.422323, 2.838413, 0, 0.345098, 1, 1,
0.2765651, 0.3580871, 0.8346249, 0, 0.3411765, 1, 1,
0.2778686, 3.06194, 0.1294148, 0, 0.3333333, 1, 1,
0.2782367, 0.1557363, 2.216461, 0, 0.3294118, 1, 1,
0.2793362, 1.586103, -0.5819588, 0, 0.3215686, 1, 1,
0.2800618, -0.08091844, 3.419038, 0, 0.3176471, 1, 1,
0.2803939, -1.025365, 2.647478, 0, 0.3098039, 1, 1,
0.283633, -0.7155082, 2.15688, 0, 0.3058824, 1, 1,
0.284418, 0.09848502, 2.567668, 0, 0.2980392, 1, 1,
0.287874, 0.3099187, 2.181961, 0, 0.2901961, 1, 1,
0.2894413, -0.305273, 1.814935, 0, 0.2862745, 1, 1,
0.2905837, -1.023547, 3.18469, 0, 0.2784314, 1, 1,
0.2943162, 2.279805, 3.60179, 0, 0.2745098, 1, 1,
0.3147691, -1.524843, 1.27457, 0, 0.2666667, 1, 1,
0.3165151, 0.1358668, 0.7365524, 0, 0.2627451, 1, 1,
0.3203004, -2.0023, 2.987701, 0, 0.254902, 1, 1,
0.3245641, -1.639243, 1.804403, 0, 0.2509804, 1, 1,
0.327204, 0.9766815, 1.089898, 0, 0.2431373, 1, 1,
0.3291264, -1.920061, 1.595596, 0, 0.2392157, 1, 1,
0.3291653, 0.7379303, 0.766942, 0, 0.2313726, 1, 1,
0.3302074, -0.1855243, 3.327202, 0, 0.227451, 1, 1,
0.3309032, 1.31373, 1.403374, 0, 0.2196078, 1, 1,
0.3309904, 0.5408732, 0.5860831, 0, 0.2156863, 1, 1,
0.3333789, 0.4971988, -0.7182217, 0, 0.2078431, 1, 1,
0.3351875, 0.1304653, 0.9421487, 0, 0.2039216, 1, 1,
0.3382922, -0.01289736, 1.418924, 0, 0.1960784, 1, 1,
0.3386405, -0.446525, 2.718352, 0, 0.1882353, 1, 1,
0.34622, -1.310456, 2.365444, 0, 0.1843137, 1, 1,
0.3474272, -0.6713775, 4.456733, 0, 0.1764706, 1, 1,
0.3474573, 0.6851747, 0.7716563, 0, 0.172549, 1, 1,
0.3556063, 0.3064786, -0.4442115, 0, 0.1647059, 1, 1,
0.3568842, 0.4058876, 0.7592412, 0, 0.1607843, 1, 1,
0.3581104, 0.4846968, 1.433949, 0, 0.1529412, 1, 1,
0.3637685, -0.8314603, 1.779156, 0, 0.1490196, 1, 1,
0.3712118, 0.4492018, 1.360502, 0, 0.1411765, 1, 1,
0.3713775, 0.0922817, 1.883015, 0, 0.1372549, 1, 1,
0.3728149, 0.8235784, 1.638364, 0, 0.1294118, 1, 1,
0.3766399, 1.061676, 2.755964, 0, 0.1254902, 1, 1,
0.37862, 2.300282, 0.4674053, 0, 0.1176471, 1, 1,
0.3800729, 0.9382307, 1.502154, 0, 0.1137255, 1, 1,
0.3853719, -0.9365528, 2.695171, 0, 0.1058824, 1, 1,
0.386874, -0.1379612, 2.632394, 0, 0.09803922, 1, 1,
0.3895563, 0.639861, 1.306795, 0, 0.09411765, 1, 1,
0.3896277, -0.2145631, 0.7640222, 0, 0.08627451, 1, 1,
0.390789, 1.091119, 1.158222, 0, 0.08235294, 1, 1,
0.3953935, -2.057281, 3.664884, 0, 0.07450981, 1, 1,
0.4009947, 0.6744454, 0.2513774, 0, 0.07058824, 1, 1,
0.4139615, -0.7933352, 3.381336, 0, 0.0627451, 1, 1,
0.4147798, -1.082233, 3.943289, 0, 0.05882353, 1, 1,
0.4182712, 1.021351, -0.7576777, 0, 0.05098039, 1, 1,
0.4231226, -0.25776, 3.158063, 0, 0.04705882, 1, 1,
0.4231817, 0.4749851, -0.01138026, 0, 0.03921569, 1, 1,
0.4242742, -2.115241, 3.69749, 0, 0.03529412, 1, 1,
0.4304947, -0.005867612, 1.696627, 0, 0.02745098, 1, 1,
0.4321724, 1.380929, 0.1637756, 0, 0.02352941, 1, 1,
0.4366853, -0.377027, 2.0351, 0, 0.01568628, 1, 1,
0.4385683, 0.2752424, -0.2254226, 0, 0.01176471, 1, 1,
0.4405701, 0.242298, -0.3164954, 0, 0.003921569, 1, 1,
0.4427744, 0.5768374, 0.03971983, 0.003921569, 0, 1, 1,
0.4466036, 0.2914291, 1.201166, 0.007843138, 0, 1, 1,
0.4472247, 0.856053, -0.4044665, 0.01568628, 0, 1, 1,
0.4483472, -0.247822, 1.540979, 0.01960784, 0, 1, 1,
0.4486009, 0.8378677, 0.1265671, 0.02745098, 0, 1, 1,
0.4499606, 0.2912417, 0.1832186, 0.03137255, 0, 1, 1,
0.4621888, -0.317184, 2.806153, 0.03921569, 0, 1, 1,
0.4627231, 0.2476007, 1.179834, 0.04313726, 0, 1, 1,
0.462938, 0.5769455, 0.1838868, 0.05098039, 0, 1, 1,
0.4643156, -1.854737, 2.47633, 0.05490196, 0, 1, 1,
0.4677309, -1.391283, 2.657788, 0.0627451, 0, 1, 1,
0.4691864, 0.9253941, 0.1485742, 0.06666667, 0, 1, 1,
0.4710047, -1.203825, 3.050162, 0.07450981, 0, 1, 1,
0.4763564, 0.3357598, -0.05167709, 0.07843138, 0, 1, 1,
0.4764355, 0.02367546, 0.8406512, 0.08627451, 0, 1, 1,
0.4790739, 0.349595, 0.2721947, 0.09019608, 0, 1, 1,
0.4794274, -0.8133435, 3.535804, 0.09803922, 0, 1, 1,
0.4803701, -0.5062949, 3.9876, 0.1058824, 0, 1, 1,
0.4808644, -0.4429725, 2.552296, 0.1098039, 0, 1, 1,
0.4818857, -0.7873294, 1.168724, 0.1176471, 0, 1, 1,
0.4845678, 2.560225, 0.6652042, 0.1215686, 0, 1, 1,
0.4877653, -0.7876613, 2.291431, 0.1294118, 0, 1, 1,
0.4888153, -0.517564, 2.316815, 0.1333333, 0, 1, 1,
0.4921402, 0.3821935, 0.9073736, 0.1411765, 0, 1, 1,
0.492722, -0.4529894, 2.138093, 0.145098, 0, 1, 1,
0.4961109, 0.5946676, -0.3782952, 0.1529412, 0, 1, 1,
0.4984312, -0.5898665, 3.479189, 0.1568628, 0, 1, 1,
0.5068467, 1.024768, -0.8395078, 0.1647059, 0, 1, 1,
0.5093902, 0.4848659, 0.870793, 0.1686275, 0, 1, 1,
0.5107197, 1.044141, -0.589684, 0.1764706, 0, 1, 1,
0.5132266, 2.761083, 0.8397624, 0.1803922, 0, 1, 1,
0.5149271, 0.1871675, 2.638405, 0.1882353, 0, 1, 1,
0.5218487, -0.1547831, 3.2103, 0.1921569, 0, 1, 1,
0.5256772, -2.026544, 0.3944924, 0.2, 0, 1, 1,
0.5275191, 0.5502072, 2.247295, 0.2078431, 0, 1, 1,
0.5281202, 1.081691, 0.2662376, 0.2117647, 0, 1, 1,
0.5340648, 0.9417583, 0.5469383, 0.2196078, 0, 1, 1,
0.5345991, 0.1429404, 0.8191354, 0.2235294, 0, 1, 1,
0.5373223, 0.2754974, 0.613578, 0.2313726, 0, 1, 1,
0.5378371, -2.652953, 2.86969, 0.2352941, 0, 1, 1,
0.5414224, 0.8017181, 0.608865, 0.2431373, 0, 1, 1,
0.5416058, 0.4718144, 0.7902212, 0.2470588, 0, 1, 1,
0.5466896, 1.393933, 2.290166, 0.254902, 0, 1, 1,
0.5477676, -0.6607544, 1.025217, 0.2588235, 0, 1, 1,
0.5503137, 0.3843116, 1.874612, 0.2666667, 0, 1, 1,
0.5528543, -0.7195461, 2.50483, 0.2705882, 0, 1, 1,
0.5585477, -0.36507, 1.218582, 0.2784314, 0, 1, 1,
0.5620064, -0.5512613, 4.837724, 0.282353, 0, 1, 1,
0.5662648, -0.4542084, 3.021821, 0.2901961, 0, 1, 1,
0.5693011, -0.435843, 1.78483, 0.2941177, 0, 1, 1,
0.5701185, 0.06832851, 1.675871, 0.3019608, 0, 1, 1,
0.5728179, -0.5915596, 2.762573, 0.3098039, 0, 1, 1,
0.5734764, -0.8445159, 0.4245285, 0.3137255, 0, 1, 1,
0.5744948, 0.1055319, 0.7527031, 0.3215686, 0, 1, 1,
0.579245, -0.2683928, 3.709175, 0.3254902, 0, 1, 1,
0.5815791, 1.775471, -0.658743, 0.3333333, 0, 1, 1,
0.5832402, 0.1979455, 1.528239, 0.3372549, 0, 1, 1,
0.5834883, 0.2593294, 1.161949, 0.345098, 0, 1, 1,
0.5839075, -0.2228165, 2.880074, 0.3490196, 0, 1, 1,
0.5850251, 1.207747, 2.532167, 0.3568628, 0, 1, 1,
0.5899336, 0.03530059, 2.972145, 0.3607843, 0, 1, 1,
0.5939783, 0.4385892, 2.752054, 0.3686275, 0, 1, 1,
0.5966688, -1.560791, 0.8385836, 0.372549, 0, 1, 1,
0.5970621, -1.788404, 1.68146, 0.3803922, 0, 1, 1,
0.5974768, 0.2538733, 1.833148, 0.3843137, 0, 1, 1,
0.6044566, 1.337973, -0.9169664, 0.3921569, 0, 1, 1,
0.6097368, 0.5357609, -0.348996, 0.3960784, 0, 1, 1,
0.6151265, 0.06081422, 1.99156, 0.4039216, 0, 1, 1,
0.6160665, -1.527683, 2.248114, 0.4117647, 0, 1, 1,
0.6163626, 0.9024068, 0.7844187, 0.4156863, 0, 1, 1,
0.6167793, 0.1910057, 1.425257, 0.4235294, 0, 1, 1,
0.6211664, -0.06608694, 0.5669977, 0.427451, 0, 1, 1,
0.6214451, -0.05573915, 1.952343, 0.4352941, 0, 1, 1,
0.6299437, 0.6459138, -0.5469612, 0.4392157, 0, 1, 1,
0.6321521, -0.08405145, 5.059448, 0.4470588, 0, 1, 1,
0.6346003, -0.3241777, 2.572082, 0.4509804, 0, 1, 1,
0.6408105, -1.455569, 3.445116, 0.4588235, 0, 1, 1,
0.6419709, 0.07971045, 1.521051, 0.4627451, 0, 1, 1,
0.6437795, -0.1597576, 1.545484, 0.4705882, 0, 1, 1,
0.6450621, -0.3299064, 1.52252, 0.4745098, 0, 1, 1,
0.6481698, -0.1605756, 3.512391, 0.4823529, 0, 1, 1,
0.6511764, -1.289735, 1.759237, 0.4862745, 0, 1, 1,
0.6524056, 0.05533576, 1.304664, 0.4941176, 0, 1, 1,
0.6527815, -1.578776, 3.048605, 0.5019608, 0, 1, 1,
0.6559263, 1.253482, -0.1034631, 0.5058824, 0, 1, 1,
0.6582875, -0.9477108, 2.184987, 0.5137255, 0, 1, 1,
0.6615089, 1.127691, -1.240703, 0.5176471, 0, 1, 1,
0.664674, -0.4066446, 1.032303, 0.5254902, 0, 1, 1,
0.6680754, -0.6455797, 1.704216, 0.5294118, 0, 1, 1,
0.674026, -0.4187031, 2.451537, 0.5372549, 0, 1, 1,
0.6758264, 1.008725, 0.7248173, 0.5411765, 0, 1, 1,
0.6770601, 2.480484, 0.09388116, 0.5490196, 0, 1, 1,
0.6780716, 0.5768429, -0.1880075, 0.5529412, 0, 1, 1,
0.6781205, -0.5303004, 1.112875, 0.5607843, 0, 1, 1,
0.6781943, -0.2820831, 0.8013783, 0.5647059, 0, 1, 1,
0.6807673, 0.7977757, -1.563129, 0.572549, 0, 1, 1,
0.6848209, 1.62115, -0.05157116, 0.5764706, 0, 1, 1,
0.688449, -0.7082779, 1.096836, 0.5843138, 0, 1, 1,
0.6899312, -1.039599, 2.666702, 0.5882353, 0, 1, 1,
0.690384, 0.9032417, -0.7600622, 0.5960785, 0, 1, 1,
0.6927198, 0.06873651, 1.63653, 0.6039216, 0, 1, 1,
0.6945977, 0.3488432, 2.388672, 0.6078432, 0, 1, 1,
0.700237, -0.5229248, 1.858381, 0.6156863, 0, 1, 1,
0.7006025, -0.005611745, 1.5414, 0.6196079, 0, 1, 1,
0.703426, 0.4610322, 1.925319, 0.627451, 0, 1, 1,
0.7035754, -0.1590976, 1.502544, 0.6313726, 0, 1, 1,
0.7083102, -0.6951805, 2.421041, 0.6392157, 0, 1, 1,
0.7103974, 1.237484, 0.4042532, 0.6431373, 0, 1, 1,
0.7144594, 0.4255117, 0.8415149, 0.6509804, 0, 1, 1,
0.7214951, -0.06624073, 2.221155, 0.654902, 0, 1, 1,
0.7225763, 0.5634567, -0.4034461, 0.6627451, 0, 1, 1,
0.7278787, -1.226617, 1.539759, 0.6666667, 0, 1, 1,
0.7349603, 2.81573, 3.22338, 0.6745098, 0, 1, 1,
0.7354642, 1.022299, 2.059256, 0.6784314, 0, 1, 1,
0.7360882, 0.5950539, 2.639295, 0.6862745, 0, 1, 1,
0.7380024, -0.445128, 1.54762, 0.6901961, 0, 1, 1,
0.7453603, -0.7301278, 1.220196, 0.6980392, 0, 1, 1,
0.7454001, 1.151258, 0.1841979, 0.7058824, 0, 1, 1,
0.7463053, -1.733216, 4.173041, 0.7098039, 0, 1, 1,
0.7488684, -0.4469967, 1.555232, 0.7176471, 0, 1, 1,
0.7521096, 0.04499438, 2.34742, 0.7215686, 0, 1, 1,
0.7542185, 0.6849661, 0.8342799, 0.7294118, 0, 1, 1,
0.7568969, -0.970586, 2.15402, 0.7333333, 0, 1, 1,
0.7592738, 1.335412, 0.2491957, 0.7411765, 0, 1, 1,
0.7626249, -0.3270693, 1.46599, 0.7450981, 0, 1, 1,
0.7739565, -0.278087, 1.318342, 0.7529412, 0, 1, 1,
0.783831, -0.03145937, 3.576637, 0.7568628, 0, 1, 1,
0.7845939, -0.1055834, 2.520367, 0.7647059, 0, 1, 1,
0.7852749, 0.5610247, 0.2340382, 0.7686275, 0, 1, 1,
0.7893523, 0.06723568, 3.75766, 0.7764706, 0, 1, 1,
0.7901996, 0.1443671, 4.33583, 0.7803922, 0, 1, 1,
0.7924607, 0.8015923, 2.861975, 0.7882353, 0, 1, 1,
0.7964166, 0.2118847, -0.6319388, 0.7921569, 0, 1, 1,
0.8023487, -0.4092499, 2.329158, 0.8, 0, 1, 1,
0.8037785, 0.7127131, 0.6265471, 0.8078431, 0, 1, 1,
0.8056335, -0.727784, 3.335564, 0.8117647, 0, 1, 1,
0.8091714, 0.2641433, -0.1207709, 0.8196079, 0, 1, 1,
0.81023, -0.8585297, 2.283935, 0.8235294, 0, 1, 1,
0.8196427, -0.7521956, 0.5673583, 0.8313726, 0, 1, 1,
0.8220611, 1.544774, 1.49337, 0.8352941, 0, 1, 1,
0.8258766, 0.5287973, 1.989838, 0.8431373, 0, 1, 1,
0.8270903, 1.053491, 0.140397, 0.8470588, 0, 1, 1,
0.8341517, 0.2223263, 0.6719931, 0.854902, 0, 1, 1,
0.837009, -0.07532912, 1.425926, 0.8588235, 0, 1, 1,
0.8423919, 1.587074, 1.202055, 0.8666667, 0, 1, 1,
0.8425648, 0.4107024, 1.51282, 0.8705882, 0, 1, 1,
0.8430545, 1.010773, 0.2043779, 0.8784314, 0, 1, 1,
0.8430858, -2.059206, 1.647299, 0.8823529, 0, 1, 1,
0.8433062, 0.5251726, -0.1701251, 0.8901961, 0, 1, 1,
0.8491519, -0.7823254, 2.329252, 0.8941177, 0, 1, 1,
0.8516093, -1.407969, 3.640789, 0.9019608, 0, 1, 1,
0.8535557, -0.1210034, 1.327168, 0.9098039, 0, 1, 1,
0.8571737, -0.4574665, -0.4820761, 0.9137255, 0, 1, 1,
0.8582678, 0.7463315, 0.6663509, 0.9215686, 0, 1, 1,
0.8663937, 0.5557429, 1.266728, 0.9254902, 0, 1, 1,
0.8666102, -0.8309816, 2.589184, 0.9333333, 0, 1, 1,
0.8685567, 0.9402231, -0.2198325, 0.9372549, 0, 1, 1,
0.8695084, 0.290443, 1.372536, 0.945098, 0, 1, 1,
0.8702283, -0.2305485, 1.621603, 0.9490196, 0, 1, 1,
0.8793218, 1.053137, 2.368338, 0.9568627, 0, 1, 1,
0.8946639, 0.2839998, 1.316183, 0.9607843, 0, 1, 1,
0.9006529, -0.3151751, 2.188788, 0.9686275, 0, 1, 1,
0.9110917, -1.248468, 2.554216, 0.972549, 0, 1, 1,
0.91273, 0.3913034, 0.1175944, 0.9803922, 0, 1, 1,
0.9168462, 0.04747052, 1.383723, 0.9843137, 0, 1, 1,
0.9230238, -1.765481, 2.195634, 0.9921569, 0, 1, 1,
0.925817, 0.3532715, 1.365127, 0.9960784, 0, 1, 1,
0.9276895, 0.2674578, -0.01524312, 1, 0, 0.9960784, 1,
0.92979, 0.1047719, 1.535932, 1, 0, 0.9882353, 1,
0.9335139, 1.045139, 2.050952, 1, 0, 0.9843137, 1,
0.9347461, 1.069384, 1.096483, 1, 0, 0.9764706, 1,
0.938884, -1.362173, 3.76182, 1, 0, 0.972549, 1,
0.9412742, -0.9622457, 2.849964, 1, 0, 0.9647059, 1,
0.9431912, 0.7271265, 2.328902, 1, 0, 0.9607843, 1,
0.9533136, 0.2052678, 1.542636, 1, 0, 0.9529412, 1,
0.9567997, 0.02271595, 2.067171, 1, 0, 0.9490196, 1,
0.958829, -0.1633971, 2.135199, 1, 0, 0.9411765, 1,
0.9590774, 0.5257871, 1.783579, 1, 0, 0.9372549, 1,
0.959766, 1.350258, 0.1426982, 1, 0, 0.9294118, 1,
0.9699645, 0.72702, 2.418035, 1, 0, 0.9254902, 1,
0.971678, 1.875518, -0.3172465, 1, 0, 0.9176471, 1,
0.9726062, -1.666579, 3.865406, 1, 0, 0.9137255, 1,
0.9760521, -0.7920691, 1.574067, 1, 0, 0.9058824, 1,
0.9764805, -0.6321108, 2.792938, 1, 0, 0.9019608, 1,
0.9780953, -1.37744, 1.098521, 1, 0, 0.8941177, 1,
0.9795312, 0.2676099, 1.105986, 1, 0, 0.8862745, 1,
0.9913235, 0.0557162, 0.5837534, 1, 0, 0.8823529, 1,
0.9915387, -1.318694, 2.547564, 1, 0, 0.8745098, 1,
0.9951032, 0.06664873, 3.265646, 1, 0, 0.8705882, 1,
0.9988419, -1.536178, 3.010869, 1, 0, 0.8627451, 1,
1.002425, -0.7425848, 0.7996173, 1, 0, 0.8588235, 1,
1.012118, -0.01682448, 2.232656, 1, 0, 0.8509804, 1,
1.041473, 1.975976, -0.6167452, 1, 0, 0.8470588, 1,
1.042667, -0.429959, 1.021853, 1, 0, 0.8392157, 1,
1.049123, 0.2235644, 1.615056, 1, 0, 0.8352941, 1,
1.050984, 1.092797, -0.8196441, 1, 0, 0.827451, 1,
1.052758, -1.035924, 2.598046, 1, 0, 0.8235294, 1,
1.066059, -1.144898, 3.862849, 1, 0, 0.8156863, 1,
1.067307, -1.778559, 1.404745, 1, 0, 0.8117647, 1,
1.067735, -2.243562, 2.2054, 1, 0, 0.8039216, 1,
1.075479, -0.188702, 3.266389, 1, 0, 0.7960784, 1,
1.077734, -1.25358, 1.954007, 1, 0, 0.7921569, 1,
1.078118, 0.08167387, 4.46529, 1, 0, 0.7843137, 1,
1.083662, -0.2336524, 1.220359, 1, 0, 0.7803922, 1,
1.085539, -0.5531902, 1.2834, 1, 0, 0.772549, 1,
1.088997, 1.514517, 0.4844195, 1, 0, 0.7686275, 1,
1.093238, -1.088214, 3.679057, 1, 0, 0.7607843, 1,
1.094965, 1.218225, 0.9111055, 1, 0, 0.7568628, 1,
1.099174, -2.197421, 3.478079, 1, 0, 0.7490196, 1,
1.103384, 0.1546131, 0.1721059, 1, 0, 0.7450981, 1,
1.106469, -1.398815, 3.363181, 1, 0, 0.7372549, 1,
1.107654, -0.2486074, 0.492016, 1, 0, 0.7333333, 1,
1.110737, -0.3724446, 0.9987874, 1, 0, 0.7254902, 1,
1.112639, -2.020876, 2.266162, 1, 0, 0.7215686, 1,
1.115089, 0.4491328, 1.910215, 1, 0, 0.7137255, 1,
1.118553, -1.254277, 2.688549, 1, 0, 0.7098039, 1,
1.13271, 1.408749, 1.5161, 1, 0, 0.7019608, 1,
1.134332, 1.659662, 0.7435193, 1, 0, 0.6941177, 1,
1.135383, -0.3604587, 3.401941, 1, 0, 0.6901961, 1,
1.140695, -0.2855255, 1.169859, 1, 0, 0.682353, 1,
1.141727, -0.1140239, 0.1089111, 1, 0, 0.6784314, 1,
1.149949, -0.3464227, 2.355473, 1, 0, 0.6705883, 1,
1.154379, 1.106698, 2.211621, 1, 0, 0.6666667, 1,
1.155312, 0.8199676, 2.067663, 1, 0, 0.6588235, 1,
1.169027, -0.6908152, 2.566624, 1, 0, 0.654902, 1,
1.183276, -3.122661, 3.730174, 1, 0, 0.6470588, 1,
1.186333, 0.6454779, -0.005135674, 1, 0, 0.6431373, 1,
1.192969, -0.7014771, 2.866426, 1, 0, 0.6352941, 1,
1.196822, -1.20315, 3.469615, 1, 0, 0.6313726, 1,
1.197926, 0.8746735, 0.9302726, 1, 0, 0.6235294, 1,
1.206064, 1.608553, -1.468048, 1, 0, 0.6196079, 1,
1.214837, -0.3583477, 2.945165, 1, 0, 0.6117647, 1,
1.222478, 0.8087389, 0.7072337, 1, 0, 0.6078432, 1,
1.232742, -0.1254129, 1.215408, 1, 0, 0.6, 1,
1.238059, -0.747077, 2.633302, 1, 0, 0.5921569, 1,
1.249349, 1.047028, -0.1534695, 1, 0, 0.5882353, 1,
1.250958, -0.9984562, 3.005146, 1, 0, 0.5803922, 1,
1.253155, 0.6315847, 1.1607, 1, 0, 0.5764706, 1,
1.256583, -1.197506, 2.364973, 1, 0, 0.5686275, 1,
1.259014, -0.08068655, 1.654631, 1, 0, 0.5647059, 1,
1.263151, -0.9905525, 2.161435, 1, 0, 0.5568628, 1,
1.268886, -0.5138294, 2.975537, 1, 0, 0.5529412, 1,
1.270476, 0.5029991, 1.075983, 1, 0, 0.5450981, 1,
1.273286, -1.679535, 1.836168, 1, 0, 0.5411765, 1,
1.275266, 0.4092369, 1.473517, 1, 0, 0.5333334, 1,
1.294423, 0.4255435, 1.319106, 1, 0, 0.5294118, 1,
1.300017, 1.02411, 0.6774422, 1, 0, 0.5215687, 1,
1.30177, 0.2084551, 2.671263, 1, 0, 0.5176471, 1,
1.307408, 0.5042653, 2.02198, 1, 0, 0.509804, 1,
1.307408, 0.07256895, 1.713331, 1, 0, 0.5058824, 1,
1.312622, 0.4273445, 0.5499768, 1, 0, 0.4980392, 1,
1.313149, -0.4758021, 1.702979, 1, 0, 0.4901961, 1,
1.318023, 1.247259, 1.443662, 1, 0, 0.4862745, 1,
1.324324, 0.8737907, 1.823814, 1, 0, 0.4784314, 1,
1.327876, -1.376318, 0.4484417, 1, 0, 0.4745098, 1,
1.335512, -1.348664, 2.247381, 1, 0, 0.4666667, 1,
1.33816, 1.015061, 0.4399914, 1, 0, 0.4627451, 1,
1.343919, 1.556405, 1.584622, 1, 0, 0.454902, 1,
1.349176, -0.9141808, 3.204216, 1, 0, 0.4509804, 1,
1.356209, 0.6278906, 0.7899541, 1, 0, 0.4431373, 1,
1.377278, -0.005257974, 1.711547, 1, 0, 0.4392157, 1,
1.384377, 0.05878826, 0.3211625, 1, 0, 0.4313726, 1,
1.398476, 0.6463287, 2.027617, 1, 0, 0.427451, 1,
1.402934, -1.009697, 1.597008, 1, 0, 0.4196078, 1,
1.42351, 0.5085855, 2.233274, 1, 0, 0.4156863, 1,
1.432492, 1.752882, 0.3696283, 1, 0, 0.4078431, 1,
1.433251, 0.8409942, 2.790396, 1, 0, 0.4039216, 1,
1.435594, 0.2101904, 3.655455, 1, 0, 0.3960784, 1,
1.461603, 1.767975, 1.092507, 1, 0, 0.3882353, 1,
1.466609, -0.4680141, 2.63488, 1, 0, 0.3843137, 1,
1.471522, -0.4714561, 3.073668, 1, 0, 0.3764706, 1,
1.472915, 0.1057626, 2.526855, 1, 0, 0.372549, 1,
1.476988, -1.306464, 2.018758, 1, 0, 0.3647059, 1,
1.48957, 0.4524311, 2.682136, 1, 0, 0.3607843, 1,
1.492128, -0.1214025, 1.905204, 1, 0, 0.3529412, 1,
1.493478, -0.6891423, 0.4370298, 1, 0, 0.3490196, 1,
1.505352, 1.02806, 0.2379783, 1, 0, 0.3411765, 1,
1.509576, -0.9431459, 1.5791, 1, 0, 0.3372549, 1,
1.53177, 0.7200986, 1.444688, 1, 0, 0.3294118, 1,
1.543109, 1.009252, 0.8445138, 1, 0, 0.3254902, 1,
1.573201, -0.9490047, 1.281441, 1, 0, 0.3176471, 1,
1.575989, 0.6895512, 1.906577, 1, 0, 0.3137255, 1,
1.578253, 0.9896541, 0.4376537, 1, 0, 0.3058824, 1,
1.585489, -1.522114, 0.9619066, 1, 0, 0.2980392, 1,
1.613372, -0.08156147, 1.687897, 1, 0, 0.2941177, 1,
1.619226, 0.3855199, 1.071398, 1, 0, 0.2862745, 1,
1.625409, -0.1123646, 0.8428183, 1, 0, 0.282353, 1,
1.625784, 1.536212, 1.374332, 1, 0, 0.2745098, 1,
1.627059, 0.4721478, 1.520663, 1, 0, 0.2705882, 1,
1.631383, 0.2568587, 2.341029, 1, 0, 0.2627451, 1,
1.645697, 0.06926819, 2.726686, 1, 0, 0.2588235, 1,
1.647752, 1.91964, 1.004164, 1, 0, 0.2509804, 1,
1.657757, -0.0106372, 1.285298, 1, 0, 0.2470588, 1,
1.665599, 0.2364959, 1.358018, 1, 0, 0.2392157, 1,
1.672758, -2.847235, 2.714879, 1, 0, 0.2352941, 1,
1.712792, -0.8213655, 1.628087, 1, 0, 0.227451, 1,
1.731535, -0.6194185, 2.555807, 1, 0, 0.2235294, 1,
1.746894, -0.3403284, 2.710537, 1, 0, 0.2156863, 1,
1.749368, 0.1284933, 2.357989, 1, 0, 0.2117647, 1,
1.779454, -1.166978, 3.72902, 1, 0, 0.2039216, 1,
1.790226, 0.7148189, 1.709673, 1, 0, 0.1960784, 1,
1.79392, -1.133819, 2.949154, 1, 0, 0.1921569, 1,
1.826318, 0.4433553, 1.945256, 1, 0, 0.1843137, 1,
1.83133, 0.6848733, 1.714971, 1, 0, 0.1803922, 1,
1.863736, 0.7020374, 2.184537, 1, 0, 0.172549, 1,
1.86819, -0.462289, 1.759637, 1, 0, 0.1686275, 1,
1.879135, 0.05385036, 0.9564016, 1, 0, 0.1607843, 1,
1.899987, 1.561425, -0.6978683, 1, 0, 0.1568628, 1,
1.928572, 0.1237525, -0.1745392, 1, 0, 0.1490196, 1,
1.931922, -1.51769, 2.809788, 1, 0, 0.145098, 1,
1.939853, -0.2918586, 1.209685, 1, 0, 0.1372549, 1,
2.003702, -1.871685, 1.094053, 1, 0, 0.1333333, 1,
2.037982, 1.06508, -0.2518779, 1, 0, 0.1254902, 1,
2.081643, -0.7370542, 3.729937, 1, 0, 0.1215686, 1,
2.105145, -2.569068, 3.00773, 1, 0, 0.1137255, 1,
2.114013, -1.362136, 3.222226, 1, 0, 0.1098039, 1,
2.140937, 0.3684915, -0.4514318, 1, 0, 0.1019608, 1,
2.212013, 1.351736, 0.5281405, 1, 0, 0.09411765, 1,
2.307071, -0.1786412, 1.136875, 1, 0, 0.09019608, 1,
2.320366, -0.8919325, 1.385315, 1, 0, 0.08235294, 1,
2.325358, 1.173346, -0.1310657, 1, 0, 0.07843138, 1,
2.355083, -0.3579035, 2.593431, 1, 0, 0.07058824, 1,
2.418604, -0.1202753, 0.5127015, 1, 0, 0.06666667, 1,
2.564792, -0.4093918, 3.124964, 1, 0, 0.05882353, 1,
2.567735, -0.3073132, 2.695415, 1, 0, 0.05490196, 1,
2.640715, 1.045649, 1.965431, 1, 0, 0.04705882, 1,
2.72349, -0.4502652, 1.217631, 1, 0, 0.04313726, 1,
2.750255, 0.4107485, 1.569982, 1, 0, 0.03529412, 1,
2.911406, 2.112181, 1.672141, 1, 0, 0.03137255, 1,
2.913911, 2.320873, 0.1129965, 1, 0, 0.02352941, 1,
3.129824, 0.1998964, 1.235101, 1, 0, 0.01960784, 1,
3.332685, 0.09563642, 2.143586, 1, 0, 0.01176471, 1,
3.740317, -0.5799451, 2.761918, 1, 0, 0.007843138, 1
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
0.2708386, -4.51097, -7.635519, 0, -0.5, 0.5, 0.5,
0.2708386, -4.51097, -7.635519, 1, -0.5, 0.5, 0.5,
0.2708386, -4.51097, -7.635519, 1, 1.5, 0.5, 0.5,
0.2708386, -4.51097, -7.635519, 0, 1.5, 0.5, 0.5
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
-4.374794, 0.3619107, -7.635519, 0, -0.5, 0.5, 0.5,
-4.374794, 0.3619107, -7.635519, 1, -0.5, 0.5, 0.5,
-4.374794, 0.3619107, -7.635519, 1, 1.5, 0.5, 0.5,
-4.374794, 0.3619107, -7.635519, 0, 1.5, 0.5, 0.5
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
-4.374794, -4.51097, -0.3680706, 0, -0.5, 0.5, 0.5,
-4.374794, -4.51097, -0.3680706, 1, -0.5, 0.5, 0.5,
-4.374794, -4.51097, -0.3680706, 1, 1.5, 0.5, 0.5,
-4.374794, -4.51097, -0.3680706, 0, 1.5, 0.5, 0.5
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
-3, -3.386459, -5.958415,
3, -3.386459, -5.958415,
-3, -3.386459, -5.958415,
-3, -3.573877, -6.237932,
-2, -3.386459, -5.958415,
-2, -3.573877, -6.237932,
-1, -3.386459, -5.958415,
-1, -3.573877, -6.237932,
0, -3.386459, -5.958415,
0, -3.573877, -6.237932,
1, -3.386459, -5.958415,
1, -3.573877, -6.237932,
2, -3.386459, -5.958415,
2, -3.573877, -6.237932,
3, -3.386459, -5.958415,
3, -3.573877, -6.237932
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
-3, -3.948714, -6.796967, 0, -0.5, 0.5, 0.5,
-3, -3.948714, -6.796967, 1, -0.5, 0.5, 0.5,
-3, -3.948714, -6.796967, 1, 1.5, 0.5, 0.5,
-3, -3.948714, -6.796967, 0, 1.5, 0.5, 0.5,
-2, -3.948714, -6.796967, 0, -0.5, 0.5, 0.5,
-2, -3.948714, -6.796967, 1, -0.5, 0.5, 0.5,
-2, -3.948714, -6.796967, 1, 1.5, 0.5, 0.5,
-2, -3.948714, -6.796967, 0, 1.5, 0.5, 0.5,
-1, -3.948714, -6.796967, 0, -0.5, 0.5, 0.5,
-1, -3.948714, -6.796967, 1, -0.5, 0.5, 0.5,
-1, -3.948714, -6.796967, 1, 1.5, 0.5, 0.5,
-1, -3.948714, -6.796967, 0, 1.5, 0.5, 0.5,
0, -3.948714, -6.796967, 0, -0.5, 0.5, 0.5,
0, -3.948714, -6.796967, 1, -0.5, 0.5, 0.5,
0, -3.948714, -6.796967, 1, 1.5, 0.5, 0.5,
0, -3.948714, -6.796967, 0, 1.5, 0.5, 0.5,
1, -3.948714, -6.796967, 0, -0.5, 0.5, 0.5,
1, -3.948714, -6.796967, 1, -0.5, 0.5, 0.5,
1, -3.948714, -6.796967, 1, 1.5, 0.5, 0.5,
1, -3.948714, -6.796967, 0, 1.5, 0.5, 0.5,
2, -3.948714, -6.796967, 0, -0.5, 0.5, 0.5,
2, -3.948714, -6.796967, 1, -0.5, 0.5, 0.5,
2, -3.948714, -6.796967, 1, 1.5, 0.5, 0.5,
2, -3.948714, -6.796967, 0, 1.5, 0.5, 0.5,
3, -3.948714, -6.796967, 0, -0.5, 0.5, 0.5,
3, -3.948714, -6.796967, 1, -0.5, 0.5, 0.5,
3, -3.948714, -6.796967, 1, 1.5, 0.5, 0.5,
3, -3.948714, -6.796967, 0, 1.5, 0.5, 0.5
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
-3.302724, -2, -5.958415,
-3.302724, 4, -5.958415,
-3.302724, -2, -5.958415,
-3.481403, -2, -6.237932,
-3.302724, 0, -5.958415,
-3.481403, 0, -6.237932,
-3.302724, 2, -5.958415,
-3.481403, 2, -6.237932,
-3.302724, 4, -5.958415,
-3.481403, 4, -6.237932
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
"0",
"2",
"4"
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
-3.838759, -2, -6.796967, 0, -0.5, 0.5, 0.5,
-3.838759, -2, -6.796967, 1, -0.5, 0.5, 0.5,
-3.838759, -2, -6.796967, 1, 1.5, 0.5, 0.5,
-3.838759, -2, -6.796967, 0, 1.5, 0.5, 0.5,
-3.838759, 0, -6.796967, 0, -0.5, 0.5, 0.5,
-3.838759, 0, -6.796967, 1, -0.5, 0.5, 0.5,
-3.838759, 0, -6.796967, 1, 1.5, 0.5, 0.5,
-3.838759, 0, -6.796967, 0, 1.5, 0.5, 0.5,
-3.838759, 2, -6.796967, 0, -0.5, 0.5, 0.5,
-3.838759, 2, -6.796967, 1, -0.5, 0.5, 0.5,
-3.838759, 2, -6.796967, 1, 1.5, 0.5, 0.5,
-3.838759, 2, -6.796967, 0, 1.5, 0.5, 0.5,
-3.838759, 4, -6.796967, 0, -0.5, 0.5, 0.5,
-3.838759, 4, -6.796967, 1, -0.5, 0.5, 0.5,
-3.838759, 4, -6.796967, 1, 1.5, 0.5, 0.5,
-3.838759, 4, -6.796967, 0, 1.5, 0.5, 0.5
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
-3.302724, -3.386459, -4,
-3.302724, -3.386459, 4,
-3.302724, -3.386459, -4,
-3.481403, -3.573877, -4,
-3.302724, -3.386459, -2,
-3.481403, -3.573877, -2,
-3.302724, -3.386459, 0,
-3.481403, -3.573877, 0,
-3.302724, -3.386459, 2,
-3.481403, -3.573877, 2,
-3.302724, -3.386459, 4,
-3.481403, -3.573877, 4
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
-3.838759, -3.948714, -4, 0, -0.5, 0.5, 0.5,
-3.838759, -3.948714, -4, 1, -0.5, 0.5, 0.5,
-3.838759, -3.948714, -4, 1, 1.5, 0.5, 0.5,
-3.838759, -3.948714, -4, 0, 1.5, 0.5, 0.5,
-3.838759, -3.948714, -2, 0, -0.5, 0.5, 0.5,
-3.838759, -3.948714, -2, 1, -0.5, 0.5, 0.5,
-3.838759, -3.948714, -2, 1, 1.5, 0.5, 0.5,
-3.838759, -3.948714, -2, 0, 1.5, 0.5, 0.5,
-3.838759, -3.948714, 0, 0, -0.5, 0.5, 0.5,
-3.838759, -3.948714, 0, 1, -0.5, 0.5, 0.5,
-3.838759, -3.948714, 0, 1, 1.5, 0.5, 0.5,
-3.838759, -3.948714, 0, 0, 1.5, 0.5, 0.5,
-3.838759, -3.948714, 2, 0, -0.5, 0.5, 0.5,
-3.838759, -3.948714, 2, 1, -0.5, 0.5, 0.5,
-3.838759, -3.948714, 2, 1, 1.5, 0.5, 0.5,
-3.838759, -3.948714, 2, 0, 1.5, 0.5, 0.5,
-3.838759, -3.948714, 4, 0, -0.5, 0.5, 0.5,
-3.838759, -3.948714, 4, 1, -0.5, 0.5, 0.5,
-3.838759, -3.948714, 4, 1, 1.5, 0.5, 0.5,
-3.838759, -3.948714, 4, 0, 1.5, 0.5, 0.5
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
-3.302724, -3.386459, -5.958415,
-3.302724, 4.11028, -5.958415,
-3.302724, -3.386459, 5.222274,
-3.302724, 4.11028, 5.222274,
-3.302724, -3.386459, -5.958415,
-3.302724, -3.386459, 5.222274,
-3.302724, 4.11028, -5.958415,
-3.302724, 4.11028, 5.222274,
-3.302724, -3.386459, -5.958415,
3.844402, -3.386459, -5.958415,
-3.302724, -3.386459, 5.222274,
3.844402, -3.386459, 5.222274,
-3.302724, 4.11028, -5.958415,
3.844402, 4.11028, -5.958415,
-3.302724, 4.11028, 5.222274,
3.844402, 4.11028, 5.222274,
3.844402, -3.386459, -5.958415,
3.844402, 4.11028, -5.958415,
3.844402, -3.386459, 5.222274,
3.844402, 4.11028, 5.222274,
3.844402, -3.386459, -5.958415,
3.844402, -3.386459, 5.222274,
3.844402, 4.11028, -5.958415,
3.844402, 4.11028, 5.222274
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
var radius = 8.138437;
var distance = 36.20883;
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
mvMatrix.translate( -0.2708386, -0.3619107, 0.3680706 );
mvMatrix.scale( 1.231185, 1.173769, 0.787021 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.20883);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


