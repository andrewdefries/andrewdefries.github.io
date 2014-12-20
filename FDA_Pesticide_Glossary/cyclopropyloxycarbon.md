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
-3.070029, 1.075936, -1.638661, 1, 0, 0, 1,
-3.036823, -0.1098992, -1.344937, 1, 0.007843138, 0, 1,
-2.953384, -0.2743421, -1.80474, 1, 0.01176471, 0, 1,
-2.818165, 0.8670505, -2.94959, 1, 0.01960784, 0, 1,
-2.727559, -1.790713, -1.23811, 1, 0.02352941, 0, 1,
-2.509282, 0.8613386, -0.4938163, 1, 0.03137255, 0, 1,
-2.496309, -1.860027, -2.118188, 1, 0.03529412, 0, 1,
-2.392739, -0.3717077, -1.683148, 1, 0.04313726, 0, 1,
-2.354257, -0.2350913, -2.559264, 1, 0.04705882, 0, 1,
-2.343103, 0.279753, -2.221135, 1, 0.05490196, 0, 1,
-2.260647, -0.6646055, -2.869697, 1, 0.05882353, 0, 1,
-2.227687, 0.1849698, -0.4370876, 1, 0.06666667, 0, 1,
-2.226992, 0.3889346, -1.669295, 1, 0.07058824, 0, 1,
-2.208675, 0.2865905, -3.087179, 1, 0.07843138, 0, 1,
-2.199621, -0.7112384, -2.902702, 1, 0.08235294, 0, 1,
-2.191327, 1.452637, -2.389237, 1, 0.09019608, 0, 1,
-2.181642, -1.265417, -2.447035, 1, 0.09411765, 0, 1,
-2.15637, 0.1790673, -2.109288, 1, 0.1019608, 0, 1,
-2.154744, -1.060041, -2.511403, 1, 0.1098039, 0, 1,
-2.114753, 0.5033625, -0.489948, 1, 0.1137255, 0, 1,
-2.106098, 0.6650808, -0.2572807, 1, 0.1215686, 0, 1,
-2.085746, -0.06295095, -1.309772, 1, 0.1254902, 0, 1,
-2.041119, 0.06413686, -2.487638, 1, 0.1333333, 0, 1,
-2.040187, 0.04975986, -3.476222, 1, 0.1372549, 0, 1,
-2.020694, 0.2743334, -0.551141, 1, 0.145098, 0, 1,
-2.010202, -0.7532021, -2.439327, 1, 0.1490196, 0, 1,
-2.007441, 0.01109592, -1.337129, 1, 0.1568628, 0, 1,
-1.995956, 1.121743, -1.937499, 1, 0.1607843, 0, 1,
-1.985476, 0.8126289, 0.4754926, 1, 0.1686275, 0, 1,
-1.982283, -1.249702, -3.048611, 1, 0.172549, 0, 1,
-1.982211, -0.2893832, -2.681811, 1, 0.1803922, 0, 1,
-1.955427, -1.056982, -2.553075, 1, 0.1843137, 0, 1,
-1.955419, -0.7347179, -2.490388, 1, 0.1921569, 0, 1,
-1.949978, 0.8669732, -1.154793, 1, 0.1960784, 0, 1,
-1.930071, 0.6741166, -0.376228, 1, 0.2039216, 0, 1,
-1.930053, 0.8079644, -1.489584, 1, 0.2117647, 0, 1,
-1.904699, -0.4474838, -1.782688, 1, 0.2156863, 0, 1,
-1.899956, -0.3040116, -0.9873133, 1, 0.2235294, 0, 1,
-1.884915, -1.068816, -2.175757, 1, 0.227451, 0, 1,
-1.884365, 0.6831986, -2.319227, 1, 0.2352941, 0, 1,
-1.881513, -1.815576, -3.998742, 1, 0.2392157, 0, 1,
-1.869304, -1.894512, -3.444601, 1, 0.2470588, 0, 1,
-1.820255, 0.8022715, -1.211426, 1, 0.2509804, 0, 1,
-1.796602, 2.716205, -0.282384, 1, 0.2588235, 0, 1,
-1.78045, -1.339223, -1.458521, 1, 0.2627451, 0, 1,
-1.749081, 1.050091, 0.1031142, 1, 0.2705882, 0, 1,
-1.736406, 0.7096737, -1.350687, 1, 0.2745098, 0, 1,
-1.669813, -0.2551508, -2.311734, 1, 0.282353, 0, 1,
-1.668531, 0.633661, -1.343367, 1, 0.2862745, 0, 1,
-1.648359, 1.69452, -1.884387, 1, 0.2941177, 0, 1,
-1.638527, -0.6652462, -4.684449, 1, 0.3019608, 0, 1,
-1.634418, -1.187652, -2.27229, 1, 0.3058824, 0, 1,
-1.619065, 1.276788, 0.1589198, 1, 0.3137255, 0, 1,
-1.612517, 0.7345622, -1.300128, 1, 0.3176471, 0, 1,
-1.602613, -1.983054, -3.608769, 1, 0.3254902, 0, 1,
-1.597547, -1.355018, -1.865963, 1, 0.3294118, 0, 1,
-1.595917, 1.705589, -0.1695494, 1, 0.3372549, 0, 1,
-1.593106, 0.04550822, -0.7777793, 1, 0.3411765, 0, 1,
-1.5747, -0.7058427, -0.8968604, 1, 0.3490196, 0, 1,
-1.56819, -0.3201851, -1.647717, 1, 0.3529412, 0, 1,
-1.557847, -1.498436, -1.946541, 1, 0.3607843, 0, 1,
-1.556446, -1.010783, -1.93107, 1, 0.3647059, 0, 1,
-1.553083, 1.207806, -2.25376, 1, 0.372549, 0, 1,
-1.551574, 0.2947086, -2.522362, 1, 0.3764706, 0, 1,
-1.534285, -0.1532626, -1.922302, 1, 0.3843137, 0, 1,
-1.533405, -0.002079184, -0.7650356, 1, 0.3882353, 0, 1,
-1.490533, 0.3763172, -0.6214037, 1, 0.3960784, 0, 1,
-1.47716, -0.0687266, -2.665933, 1, 0.4039216, 0, 1,
-1.474204, -0.4551249, -2.34727, 1, 0.4078431, 0, 1,
-1.469686, -0.7149661, -1.541935, 1, 0.4156863, 0, 1,
-1.464118, -0.877175, -1.267523, 1, 0.4196078, 0, 1,
-1.460327, -0.9316643, -1.288308, 1, 0.427451, 0, 1,
-1.444889, 1.953432, -1.716792, 1, 0.4313726, 0, 1,
-1.437149, 1.515307, -0.4844539, 1, 0.4392157, 0, 1,
-1.429307, -2.152712, -4.374666, 1, 0.4431373, 0, 1,
-1.422835, -0.725522, -0.1327447, 1, 0.4509804, 0, 1,
-1.421302, 0.4302185, -1.142652, 1, 0.454902, 0, 1,
-1.407719, -0.4783691, -1.699105, 1, 0.4627451, 0, 1,
-1.403733, 1.293611, -1.181062, 1, 0.4666667, 0, 1,
-1.384008, 1.747004, -1.739244, 1, 0.4745098, 0, 1,
-1.382403, 0.4518184, -0.374208, 1, 0.4784314, 0, 1,
-1.376663, 2.031578, -1.666696, 1, 0.4862745, 0, 1,
-1.374156, -0.7944766, -0.1367841, 1, 0.4901961, 0, 1,
-1.370414, 0.7692537, -1.664328, 1, 0.4980392, 0, 1,
-1.367565, -0.5193425, -0.9548439, 1, 0.5058824, 0, 1,
-1.366891, -0.2584752, -2.393531, 1, 0.509804, 0, 1,
-1.348433, 0.9038522, -0.3033262, 1, 0.5176471, 0, 1,
-1.341999, -0.1709288, -3.911422, 1, 0.5215687, 0, 1,
-1.330043, -0.8856799, -2.36629, 1, 0.5294118, 0, 1,
-1.328079, -0.03388544, -2.302919, 1, 0.5333334, 0, 1,
-1.326512, 0.4173858, -0.3728903, 1, 0.5411765, 0, 1,
-1.325987, 1.459156, -1.056912, 1, 0.5450981, 0, 1,
-1.293634, 0.3363582, -2.249465, 1, 0.5529412, 0, 1,
-1.290025, 0.06470624, -1.381404, 1, 0.5568628, 0, 1,
-1.289075, 1.30742, 0.2598806, 1, 0.5647059, 0, 1,
-1.284515, -0.2338726, -2.404223, 1, 0.5686275, 0, 1,
-1.278295, -0.1805146, -1.06831, 1, 0.5764706, 0, 1,
-1.275102, 1.490215, 0.5293469, 1, 0.5803922, 0, 1,
-1.269137, 0.1673971, -1.194204, 1, 0.5882353, 0, 1,
-1.266539, -1.360407, -1.293177, 1, 0.5921569, 0, 1,
-1.26469, -0.2896393, -1.215385, 1, 0.6, 0, 1,
-1.263415, 0.7560818, -1.451847, 1, 0.6078432, 0, 1,
-1.261229, 0.8312011, -1.848555, 1, 0.6117647, 0, 1,
-1.256617, 0.01848546, -0.4880951, 1, 0.6196079, 0, 1,
-1.255229, 1.13099, -0.9232578, 1, 0.6235294, 0, 1,
-1.250513, -0.3822573, -1.633937, 1, 0.6313726, 0, 1,
-1.237089, 1.052999, -0.7946267, 1, 0.6352941, 0, 1,
-1.236873, 0.7160393, -0.8188277, 1, 0.6431373, 0, 1,
-1.208239, -0.8659527, -4.354806, 1, 0.6470588, 0, 1,
-1.207796, -0.241279, -2.449911, 1, 0.654902, 0, 1,
-1.206718, 1.624317, -0.9438869, 1, 0.6588235, 0, 1,
-1.201427, 0.1354624, -1.069779, 1, 0.6666667, 0, 1,
-1.198472, -1.72002, -3.256572, 1, 0.6705883, 0, 1,
-1.195863, -2.211297, -1.154292, 1, 0.6784314, 0, 1,
-1.184724, 0.06182597, -1.946583, 1, 0.682353, 0, 1,
-1.176715, -1.211315, -2.840826, 1, 0.6901961, 0, 1,
-1.173217, -0.1924844, -1.215307, 1, 0.6941177, 0, 1,
-1.149763, 0.008797621, -1.864437, 1, 0.7019608, 0, 1,
-1.147879, -0.4538981, -0.9916499, 1, 0.7098039, 0, 1,
-1.146206, 2.3077, -1.710441, 1, 0.7137255, 0, 1,
-1.14501, -0.5764591, -2.606574, 1, 0.7215686, 0, 1,
-1.133121, -1.980481, -3.010613, 1, 0.7254902, 0, 1,
-1.119632, -1.399025, -5.354007, 1, 0.7333333, 0, 1,
-1.116495, 1.357572, -0.3866682, 1, 0.7372549, 0, 1,
-1.113901, 2.269766, -0.2611857, 1, 0.7450981, 0, 1,
-1.109568, -0.3029425, -3.480259, 1, 0.7490196, 0, 1,
-1.107799, -0.6576235, -1.411816, 1, 0.7568628, 0, 1,
-1.10434, -0.03285577, -2.585325, 1, 0.7607843, 0, 1,
-1.096811, -0.02971699, -2.13019, 1, 0.7686275, 0, 1,
-1.096042, 1.191345, 0.5027521, 1, 0.772549, 0, 1,
-1.084768, -0.2787183, -1.717098, 1, 0.7803922, 0, 1,
-1.081574, 0.5876598, -2.113865, 1, 0.7843137, 0, 1,
-1.076654, -0.3537193, -1.929971, 1, 0.7921569, 0, 1,
-1.073002, 0.8577257, -0.5710197, 1, 0.7960784, 0, 1,
-1.070934, -0.5299708, -0.5448722, 1, 0.8039216, 0, 1,
-1.068528, 0.3961323, 0.2848347, 1, 0.8117647, 0, 1,
-1.06656, -0.2134456, -0.5354363, 1, 0.8156863, 0, 1,
-1.064159, -0.7487743, -2.881288, 1, 0.8235294, 0, 1,
-1.061137, 0.4005213, -1.715501, 1, 0.827451, 0, 1,
-1.060902, -0.619898, -2.427203, 1, 0.8352941, 0, 1,
-1.059128, 3.080583, -0.5822809, 1, 0.8392157, 0, 1,
-1.058407, -0.8166345, -2.913071, 1, 0.8470588, 0, 1,
-1.056734, -1.563301, -3.058547, 1, 0.8509804, 0, 1,
-1.052626, 1.127724, -1.354017, 1, 0.8588235, 0, 1,
-1.049409, -1.048277, -1.46512, 1, 0.8627451, 0, 1,
-1.043173, 0.8883045, -1.003997, 1, 0.8705882, 0, 1,
-1.042606, -0.0545963, -1.715127, 1, 0.8745098, 0, 1,
-1.040935, 1.418809, -1.468934, 1, 0.8823529, 0, 1,
-1.04083, 0.6453549, 0.4209408, 1, 0.8862745, 0, 1,
-1.039377, 0.1623379, -0.7921701, 1, 0.8941177, 0, 1,
-1.038949, -0.9110549, -3.059632, 1, 0.8980392, 0, 1,
-1.037199, -0.04557342, -4.2406, 1, 0.9058824, 0, 1,
-1.025046, 0.5085492, -1.079736, 1, 0.9137255, 0, 1,
-1.024092, 0.5927581, -1.211131, 1, 0.9176471, 0, 1,
-1.01544, 0.7463174, -1.782286, 1, 0.9254902, 0, 1,
-1.014444, -0.3638988, -1.905982, 1, 0.9294118, 0, 1,
-1.004641, 0.166304, -2.607795, 1, 0.9372549, 0, 1,
-0.9807889, 0.5074022, 0.1208715, 1, 0.9411765, 0, 1,
-0.9735994, 0.3447928, -1.047622, 1, 0.9490196, 0, 1,
-0.9727426, -0.339234, -2.327618, 1, 0.9529412, 0, 1,
-0.9716762, -0.05193421, -1.033358, 1, 0.9607843, 0, 1,
-0.9671156, 1.014083, 0.52507, 1, 0.9647059, 0, 1,
-0.960953, -0.3559299, -2.328021, 1, 0.972549, 0, 1,
-0.9583479, -0.314307, -2.810649, 1, 0.9764706, 0, 1,
-0.9570606, -0.2718399, -1.374648, 1, 0.9843137, 0, 1,
-0.9489177, 0.4887759, 0.6867632, 1, 0.9882353, 0, 1,
-0.9466813, -0.5061957, -3.136441, 1, 0.9960784, 0, 1,
-0.9441088, -1.316946, -2.800042, 0.9960784, 1, 0, 1,
-0.9437636, -0.7445322, -2.425774, 0.9921569, 1, 0, 1,
-0.9429775, -1.118718, -2.687667, 0.9843137, 1, 0, 1,
-0.9366127, 0.9482536, -1.909782, 0.9803922, 1, 0, 1,
-0.9351459, -0.04546555, -1.972202, 0.972549, 1, 0, 1,
-0.9344313, 0.9521449, -0.01418067, 0.9686275, 1, 0, 1,
-0.9263102, 1.317853, 1.266904, 0.9607843, 1, 0, 1,
-0.9254472, -1.70929, -2.742152, 0.9568627, 1, 0, 1,
-0.923137, -0.3829709, -3.296196, 0.9490196, 1, 0, 1,
-0.922806, -0.691716, -2.121932, 0.945098, 1, 0, 1,
-0.9217304, 0.7267265, -0.3302782, 0.9372549, 1, 0, 1,
-0.9168571, 1.18533, -0.4910379, 0.9333333, 1, 0, 1,
-0.9101885, 0.7031656, -1.765031, 0.9254902, 1, 0, 1,
-0.9058355, 0.5745633, -1.483577, 0.9215686, 1, 0, 1,
-0.9036936, -2.477852, -1.61704, 0.9137255, 1, 0, 1,
-0.9013082, 1.797417, -0.03660146, 0.9098039, 1, 0, 1,
-0.8967226, -0.007474631, 0.4340834, 0.9019608, 1, 0, 1,
-0.8952979, 0.3208224, -2.476967, 0.8941177, 1, 0, 1,
-0.8909218, 0.02353712, -0.6562489, 0.8901961, 1, 0, 1,
-0.8906978, -0.6541483, -2.422718, 0.8823529, 1, 0, 1,
-0.8892235, -0.6542993, -2.079274, 0.8784314, 1, 0, 1,
-0.8856582, 1.151044, -2.780319, 0.8705882, 1, 0, 1,
-0.8839725, 0.1578627, -2.122175, 0.8666667, 1, 0, 1,
-0.8825539, 1.46129, -1.363781, 0.8588235, 1, 0, 1,
-0.8814383, -1.4932, -2.098991, 0.854902, 1, 0, 1,
-0.8737342, 2.20706, 0.4587509, 0.8470588, 1, 0, 1,
-0.8719542, 1.625864, 0.07813971, 0.8431373, 1, 0, 1,
-0.8674338, 1.038992, 0.01046544, 0.8352941, 1, 0, 1,
-0.8656225, 0.6212839, -1.090261, 0.8313726, 1, 0, 1,
-0.8623841, -0.2219165, -2.09222, 0.8235294, 1, 0, 1,
-0.8599243, 0.3767709, -0.750296, 0.8196079, 1, 0, 1,
-0.852746, -2.406036, -3.256156, 0.8117647, 1, 0, 1,
-0.8420324, 0.5227265, -0.7108462, 0.8078431, 1, 0, 1,
-0.8414987, -0.6815817, -2.679848, 0.8, 1, 0, 1,
-0.8364443, 0.4239017, -0.983775, 0.7921569, 1, 0, 1,
-0.8356423, -0.8395852, -2.000543, 0.7882353, 1, 0, 1,
-0.8340272, -0.2627363, -1.604533, 0.7803922, 1, 0, 1,
-0.8330961, -0.7768848, -2.674896, 0.7764706, 1, 0, 1,
-0.8220426, -1.088915, -2.285861, 0.7686275, 1, 0, 1,
-0.8183365, 0.7277347, -0.2858254, 0.7647059, 1, 0, 1,
-0.8173198, -0.005109811, -0.4764853, 0.7568628, 1, 0, 1,
-0.8148165, -1.798663, -2.63291, 0.7529412, 1, 0, 1,
-0.8123785, 0.5627506, 0.03295833, 0.7450981, 1, 0, 1,
-0.810208, 0.4554828, -0.4421718, 0.7411765, 1, 0, 1,
-0.8094338, -0.1732516, -1.793997, 0.7333333, 1, 0, 1,
-0.8093808, -0.8196604, -1.999325, 0.7294118, 1, 0, 1,
-0.8005782, -0.2905945, -2.784758, 0.7215686, 1, 0, 1,
-0.799844, -0.2763754, -1.203389, 0.7176471, 1, 0, 1,
-0.7940254, 0.3059966, -2.911963, 0.7098039, 1, 0, 1,
-0.7905873, -0.3624473, 0.1150898, 0.7058824, 1, 0, 1,
-0.789816, -1.414379, -2.298934, 0.6980392, 1, 0, 1,
-0.7888921, -0.7262416, -1.561126, 0.6901961, 1, 0, 1,
-0.7836707, 0.07738744, 0.8519964, 0.6862745, 1, 0, 1,
-0.7778426, 0.03467257, -2.566228, 0.6784314, 1, 0, 1,
-0.7689049, 0.2286283, -3.131707, 0.6745098, 1, 0, 1,
-0.7630988, 0.8200595, 0.6523975, 0.6666667, 1, 0, 1,
-0.7621368, 0.7922092, -0.7347167, 0.6627451, 1, 0, 1,
-0.760919, 0.2520521, -1.238427, 0.654902, 1, 0, 1,
-0.7603855, -1.155608, -2.339076, 0.6509804, 1, 0, 1,
-0.7583628, 0.1086223, 0.1474814, 0.6431373, 1, 0, 1,
-0.7486288, -0.170053, -2.632915, 0.6392157, 1, 0, 1,
-0.7472788, 0.3134996, -1.407741, 0.6313726, 1, 0, 1,
-0.7472605, 0.7271296, -1.013766, 0.627451, 1, 0, 1,
-0.7425044, -0.7672441, -5.423366, 0.6196079, 1, 0, 1,
-0.7423791, 1.214717, -0.2023766, 0.6156863, 1, 0, 1,
-0.7418358, 2.367148, -0.8019441, 0.6078432, 1, 0, 1,
-0.7410029, 0.4606518, -2.101614, 0.6039216, 1, 0, 1,
-0.7388712, -0.9401143, -2.318935, 0.5960785, 1, 0, 1,
-0.7364566, 0.7780035, -1.100461, 0.5882353, 1, 0, 1,
-0.7345468, -0.2362229, -0.4116144, 0.5843138, 1, 0, 1,
-0.7307978, 0.126442, -0.5057024, 0.5764706, 1, 0, 1,
-0.7268167, -1.76381, -3.011986, 0.572549, 1, 0, 1,
-0.7267196, 0.9523414, -0.4764735, 0.5647059, 1, 0, 1,
-0.7249511, 0.6307333, -2.054081, 0.5607843, 1, 0, 1,
-0.7220375, -0.4298372, -2.77002, 0.5529412, 1, 0, 1,
-0.7208613, -0.6248334, -1.722489, 0.5490196, 1, 0, 1,
-0.7206283, -1.034143, -3.27252, 0.5411765, 1, 0, 1,
-0.7109983, 1.553304, -2.126158, 0.5372549, 1, 0, 1,
-0.7022493, 1.81864, 0.2657317, 0.5294118, 1, 0, 1,
-0.6973324, 0.1646837, -2.26035, 0.5254902, 1, 0, 1,
-0.68716, 0.1530139, -1.618629, 0.5176471, 1, 0, 1,
-0.6739652, -0.1840814, -2.37358, 0.5137255, 1, 0, 1,
-0.6716278, 1.868492, 0.9769714, 0.5058824, 1, 0, 1,
-0.6705851, 1.395963, -0.2493264, 0.5019608, 1, 0, 1,
-0.6689131, -0.6526909, -0.6978885, 0.4941176, 1, 0, 1,
-0.6681489, 0.2787781, -0.3441373, 0.4862745, 1, 0, 1,
-0.6650621, -1.381426, -3.430095, 0.4823529, 1, 0, 1,
-0.6596352, 1.848791, -0.5352379, 0.4745098, 1, 0, 1,
-0.6585515, 0.1444726, -0.7251437, 0.4705882, 1, 0, 1,
-0.6545601, -0.8873447, -3.26389, 0.4627451, 1, 0, 1,
-0.6512342, -0.8471103, -3.440939, 0.4588235, 1, 0, 1,
-0.6462948, 0.1048607, -1.315298, 0.4509804, 1, 0, 1,
-0.6415834, -1.137241, -3.232343, 0.4470588, 1, 0, 1,
-0.6382456, -0.4790194, -1.762803, 0.4392157, 1, 0, 1,
-0.6300058, 0.7497788, -0.5266037, 0.4352941, 1, 0, 1,
-0.6286703, -0.2282503, -1.836805, 0.427451, 1, 0, 1,
-0.624498, 1.764936, 0.3121581, 0.4235294, 1, 0, 1,
-0.6219201, -0.2470495, -2.974284, 0.4156863, 1, 0, 1,
-0.6155492, 1.346985, -0.8941584, 0.4117647, 1, 0, 1,
-0.6134513, 0.1129154, -0.1589217, 0.4039216, 1, 0, 1,
-0.6114075, -0.4049613, -1.60983, 0.3960784, 1, 0, 1,
-0.6055457, -0.872914, -0.6999652, 0.3921569, 1, 0, 1,
-0.6014452, -0.4982631, -2.223973, 0.3843137, 1, 0, 1,
-0.6013117, 1.097903, -0.4948516, 0.3803922, 1, 0, 1,
-0.5980907, 0.4837265, -1.30365, 0.372549, 1, 0, 1,
-0.5966671, -0.4978547, -1.311001, 0.3686275, 1, 0, 1,
-0.5930345, -1.004945, -3.608639, 0.3607843, 1, 0, 1,
-0.5897148, 0.7280581, -1.067947, 0.3568628, 1, 0, 1,
-0.5888289, 1.108346, -1.248096, 0.3490196, 1, 0, 1,
-0.588686, 0.2690256, -0.4062672, 0.345098, 1, 0, 1,
-0.5851839, 0.6737574, -1.393125, 0.3372549, 1, 0, 1,
-0.5777713, 0.6392708, -0.1836669, 0.3333333, 1, 0, 1,
-0.5705285, 0.7494458, -0.3452724, 0.3254902, 1, 0, 1,
-0.5624757, 0.2254796, -1.399679, 0.3215686, 1, 0, 1,
-0.5559029, -0.1473205, -2.28845, 0.3137255, 1, 0, 1,
-0.5548164, 0.6294793, 0.4190284, 0.3098039, 1, 0, 1,
-0.5518135, -1.161065, -2.835361, 0.3019608, 1, 0, 1,
-0.5492712, -0.06324504, -1.269033, 0.2941177, 1, 0, 1,
-0.5447655, -1.317, -2.578896, 0.2901961, 1, 0, 1,
-0.5437949, -0.7041232, -2.063544, 0.282353, 1, 0, 1,
-0.5372851, 0.3133394, -1.769454, 0.2784314, 1, 0, 1,
-0.5368615, 0.9531335, -0.2209515, 0.2705882, 1, 0, 1,
-0.5348306, -0.6115381, -2.34142, 0.2666667, 1, 0, 1,
-0.5342553, -0.7896715, -0.8981208, 0.2588235, 1, 0, 1,
-0.532731, 1.412364, 0.1882709, 0.254902, 1, 0, 1,
-0.5289333, 0.5647714, 0.8176054, 0.2470588, 1, 0, 1,
-0.52882, 0.6514815, -2.411586, 0.2431373, 1, 0, 1,
-0.5265129, -1.221141, -0.2984801, 0.2352941, 1, 0, 1,
-0.5253343, -0.3471516, -0.6402119, 0.2313726, 1, 0, 1,
-0.525126, -2.239033, -2.337739, 0.2235294, 1, 0, 1,
-0.5225947, -0.1414569, -0.3034951, 0.2196078, 1, 0, 1,
-0.5223565, -0.09067627, -0.6310483, 0.2117647, 1, 0, 1,
-0.5219141, 1.611099, -0.1310397, 0.2078431, 1, 0, 1,
-0.5191488, -1.561938, -2.214146, 0.2, 1, 0, 1,
-0.5185713, 0.5164908, -0.8306318, 0.1921569, 1, 0, 1,
-0.5168918, 0.1998355, -1.664673, 0.1882353, 1, 0, 1,
-0.515866, 1.444955, -1.042323, 0.1803922, 1, 0, 1,
-0.5130941, -0.1131, -0.8544774, 0.1764706, 1, 0, 1,
-0.5109976, 1.33899, -1.25842, 0.1686275, 1, 0, 1,
-0.5102718, -0.2478861, -0.7889274, 0.1647059, 1, 0, 1,
-0.5101773, -0.9781904, -2.201848, 0.1568628, 1, 0, 1,
-0.50617, 0.3851514, 0.2378929, 0.1529412, 1, 0, 1,
-0.5059766, 2.303933, -2.643489, 0.145098, 1, 0, 1,
-0.5052719, 0.6936397, -1.199653, 0.1411765, 1, 0, 1,
-0.5052546, 0.959883, -0.141573, 0.1333333, 1, 0, 1,
-0.492409, -0.5093817, -3.330041, 0.1294118, 1, 0, 1,
-0.4917101, -0.446755, -0.8236545, 0.1215686, 1, 0, 1,
-0.48817, 0.1584379, -1.291921, 0.1176471, 1, 0, 1,
-0.4871091, -0.01752242, -1.907001, 0.1098039, 1, 0, 1,
-0.4852633, -0.4380253, -2.249515, 0.1058824, 1, 0, 1,
-0.4832244, 0.6081408, -1.135651, 0.09803922, 1, 0, 1,
-0.4827058, -0.3696384, -2.06916, 0.09019608, 1, 0, 1,
-0.4783118, 1.022458, -0.988903, 0.08627451, 1, 0, 1,
-0.478265, 0.1996354, -1.971945, 0.07843138, 1, 0, 1,
-0.4761611, -0.5723875, -2.87947, 0.07450981, 1, 0, 1,
-0.4761165, 1.113113, -1.310073, 0.06666667, 1, 0, 1,
-0.4760689, -1.575311, -1.39486, 0.0627451, 1, 0, 1,
-0.4744805, 0.08338971, 0.4988832, 0.05490196, 1, 0, 1,
-0.4727112, -0.3696213, 0.1586389, 0.05098039, 1, 0, 1,
-0.4667313, -0.1653591, 0.4654793, 0.04313726, 1, 0, 1,
-0.4655987, -2.290487, -1.762267, 0.03921569, 1, 0, 1,
-0.4646727, 1.181194, 0.3190264, 0.03137255, 1, 0, 1,
-0.4640432, -0.1784078, -1.377936, 0.02745098, 1, 0, 1,
-0.4636008, -0.6359015, -2.984908, 0.01960784, 1, 0, 1,
-0.4605858, -1.118509, -3.498522, 0.01568628, 1, 0, 1,
-0.4592887, 0.09474615, -0.8977302, 0.007843138, 1, 0, 1,
-0.4567043, -0.3808291, -2.268202, 0.003921569, 1, 0, 1,
-0.4547811, 0.2526642, -0.3284159, 0, 1, 0.003921569, 1,
-0.4541081, 2.056128, 0.6085164, 0, 1, 0.01176471, 1,
-0.4513257, 0.1163406, 0.02202506, 0, 1, 0.01568628, 1,
-0.4459003, 2.098609, -0.1564612, 0, 1, 0.02352941, 1,
-0.4452652, 0.4074355, -1.226359, 0, 1, 0.02745098, 1,
-0.4350573, 0.5489523, -1.754785, 0, 1, 0.03529412, 1,
-0.4336492, 1.454146, 0.7163309, 0, 1, 0.03921569, 1,
-0.4335507, -0.1128304, -1.919985, 0, 1, 0.04705882, 1,
-0.4333191, 0.8160752, 0.8104814, 0, 1, 0.05098039, 1,
-0.4265538, -1.290556, -4.318458, 0, 1, 0.05882353, 1,
-0.4260532, 1.12823, -2.711373, 0, 1, 0.0627451, 1,
-0.4216612, 0.3715945, -1.773757, 0, 1, 0.07058824, 1,
-0.417049, 1.094429, -2.572429, 0, 1, 0.07450981, 1,
-0.4169451, 0.4275325, -0.8881493, 0, 1, 0.08235294, 1,
-0.4107512, 0.7997494, 0.4968268, 0, 1, 0.08627451, 1,
-0.4101449, 0.3247499, -0.6219634, 0, 1, 0.09411765, 1,
-0.409635, 0.4684414, 0.1340769, 0, 1, 0.1019608, 1,
-0.4071522, 0.7341443, -0.07959154, 0, 1, 0.1058824, 1,
-0.4052581, -0.5641156, -3.000912, 0, 1, 0.1137255, 1,
-0.3964808, -1.484303, -3.398194, 0, 1, 0.1176471, 1,
-0.3872022, -0.1594118, -2.048184, 0, 1, 0.1254902, 1,
-0.3846378, 0.3062592, 0.9002959, 0, 1, 0.1294118, 1,
-0.3769008, -1.020451, -5.010626, 0, 1, 0.1372549, 1,
-0.3768848, 1.894062, -0.7874339, 0, 1, 0.1411765, 1,
-0.3724405, 0.1510519, -0.6009423, 0, 1, 0.1490196, 1,
-0.3688006, 0.2790014, -0.3096013, 0, 1, 0.1529412, 1,
-0.353695, -0.4624418, -2.296657, 0, 1, 0.1607843, 1,
-0.3501319, -0.7644638, -4.68145, 0, 1, 0.1647059, 1,
-0.3481408, -0.4526795, -2.774822, 0, 1, 0.172549, 1,
-0.3479333, -0.1976192, -3.009488, 0, 1, 0.1764706, 1,
-0.3473226, -1.385544, -3.161441, 0, 1, 0.1843137, 1,
-0.3458662, 0.9831808, -1.026742, 0, 1, 0.1882353, 1,
-0.3454792, -0.8377298, -3.218859, 0, 1, 0.1960784, 1,
-0.3440112, 2.259598, 0.4468859, 0, 1, 0.2039216, 1,
-0.3404068, 1.692466, 0.3669495, 0, 1, 0.2078431, 1,
-0.3391275, 0.4048424, -2.272834, 0, 1, 0.2156863, 1,
-0.3371333, 0.005456165, -1.737623, 0, 1, 0.2196078, 1,
-0.3349489, 1.751617, 0.2392049, 0, 1, 0.227451, 1,
-0.3326235, 1.114332, 0.03904795, 0, 1, 0.2313726, 1,
-0.3240733, 1.268364, 0.4514266, 0, 1, 0.2392157, 1,
-0.3239134, -0.984383, -3.097992, 0, 1, 0.2431373, 1,
-0.3226983, 0.7498894, -0.6391355, 0, 1, 0.2509804, 1,
-0.319868, 0.1571906, -0.4189304, 0, 1, 0.254902, 1,
-0.3185687, 0.2882662, -1.065609, 0, 1, 0.2627451, 1,
-0.3185186, 0.0414585, -2.243476, 0, 1, 0.2666667, 1,
-0.3136061, -1.05149, -3.485588, 0, 1, 0.2745098, 1,
-0.3114754, 0.4938978, -1.184052, 0, 1, 0.2784314, 1,
-0.3097868, 0.2086037, -0.6673772, 0, 1, 0.2862745, 1,
-0.3097396, 0.007080891, 0.1527359, 0, 1, 0.2901961, 1,
-0.3043372, -0.201766, -2.020993, 0, 1, 0.2980392, 1,
-0.2971172, -0.3681091, -1.316142, 0, 1, 0.3058824, 1,
-0.2956003, 1.618997, 0.4257104, 0, 1, 0.3098039, 1,
-0.2927356, -0.09034967, -1.514951, 0, 1, 0.3176471, 1,
-0.2871761, 0.04878304, -1.945935, 0, 1, 0.3215686, 1,
-0.2868678, -0.104147, -3.858433, 0, 1, 0.3294118, 1,
-0.2868574, -1.18196, -3.263611, 0, 1, 0.3333333, 1,
-0.2864969, -0.5970045, -3.014705, 0, 1, 0.3411765, 1,
-0.2854664, 0.4233385, -0.4412525, 0, 1, 0.345098, 1,
-0.2797775, 2.35334, 0.7541254, 0, 1, 0.3529412, 1,
-0.2747542, -0.7234338, -3.398666, 0, 1, 0.3568628, 1,
-0.2696262, -0.3759793, -0.2950943, 0, 1, 0.3647059, 1,
-0.2680336, 0.5687071, 1.370728, 0, 1, 0.3686275, 1,
-0.2642553, -1.648956, -2.05462, 0, 1, 0.3764706, 1,
-0.2639289, -0.861989, -3.098008, 0, 1, 0.3803922, 1,
-0.2638642, 1.734943, -0.654789, 0, 1, 0.3882353, 1,
-0.2600197, 0.4073829, -1.237594, 0, 1, 0.3921569, 1,
-0.2593259, -1.470486, -5.678337, 0, 1, 0.4, 1,
-0.251157, 0.5609362, 1.080431, 0, 1, 0.4078431, 1,
-0.2478432, -0.9159616, -2.144246, 0, 1, 0.4117647, 1,
-0.2466334, 0.3713912, 0.0530261, 0, 1, 0.4196078, 1,
-0.2445175, 1.177842, 0.1792749, 0, 1, 0.4235294, 1,
-0.2411463, 0.1190297, -0.8147462, 0, 1, 0.4313726, 1,
-0.2380796, 0.7655554, -0.07331758, 0, 1, 0.4352941, 1,
-0.2340233, 0.1177616, 0.1543231, 0, 1, 0.4431373, 1,
-0.2317499, -1.147884, -4.144891, 0, 1, 0.4470588, 1,
-0.2309678, -0.1839433, -1.136723, 0, 1, 0.454902, 1,
-0.2298489, -1.09679, -2.501463, 0, 1, 0.4588235, 1,
-0.2242821, 0.1138523, -0.6418429, 0, 1, 0.4666667, 1,
-0.2173728, 0.1090764, -2.38594, 0, 1, 0.4705882, 1,
-0.2155922, -0.6110313, -1.976203, 0, 1, 0.4784314, 1,
-0.214159, 0.7330626, 0.6332943, 0, 1, 0.4823529, 1,
-0.2103822, -1.95555, -2.479853, 0, 1, 0.4901961, 1,
-0.208689, -0.5073304, -2.244801, 0, 1, 0.4941176, 1,
-0.2073151, -1.046532, -4.579235, 0, 1, 0.5019608, 1,
-0.2070237, -1.285467, -4.32738, 0, 1, 0.509804, 1,
-0.2057512, 0.659541, 0.4166636, 0, 1, 0.5137255, 1,
-0.205725, 1.675397, -0.8582125, 0, 1, 0.5215687, 1,
-0.2049907, -0.05525781, -1.862596, 0, 1, 0.5254902, 1,
-0.2047512, 0.4473323, -0.278144, 0, 1, 0.5333334, 1,
-0.2011789, -0.496612, -2.796795, 0, 1, 0.5372549, 1,
-0.2009612, 0.5101185, 2.387093, 0, 1, 0.5450981, 1,
-0.2006222, -0.003470747, -1.731846, 0, 1, 0.5490196, 1,
-0.1991266, -0.1933255, -1.062176, 0, 1, 0.5568628, 1,
-0.1937355, -0.2400542, -2.280316, 0, 1, 0.5607843, 1,
-0.1902333, -0.9254358, -2.429804, 0, 1, 0.5686275, 1,
-0.1901583, -0.003059029, -1.429453, 0, 1, 0.572549, 1,
-0.1870498, 0.9288839, 0.2604331, 0, 1, 0.5803922, 1,
-0.1855072, 0.9852399, 0.4578113, 0, 1, 0.5843138, 1,
-0.1832068, -0.8640764, -2.254763, 0, 1, 0.5921569, 1,
-0.1811751, 0.8173162, 0.7654684, 0, 1, 0.5960785, 1,
-0.1810984, 1.397353, -1.124723, 0, 1, 0.6039216, 1,
-0.1788761, -0.1084528, -3.428737, 0, 1, 0.6117647, 1,
-0.1787786, -0.1108523, -2.501628, 0, 1, 0.6156863, 1,
-0.1742404, -0.4431392, -3.308274, 0, 1, 0.6235294, 1,
-0.1737656, -1.289645, -3.288376, 0, 1, 0.627451, 1,
-0.1730436, 0.7595958, 0.5706003, 0, 1, 0.6352941, 1,
-0.1684632, -0.6958297, -4.96426, 0, 1, 0.6392157, 1,
-0.1668184, 1.398785, -0.3011793, 0, 1, 0.6470588, 1,
-0.1627878, -0.3043462, -2.565959, 0, 1, 0.6509804, 1,
-0.1625565, 0.06350607, 0.2690941, 0, 1, 0.6588235, 1,
-0.1623284, -0.1991206, -3.217768, 0, 1, 0.6627451, 1,
-0.1576385, 0.2082458, -1.280014, 0, 1, 0.6705883, 1,
-0.1555303, 1.259168, -1.389882, 0, 1, 0.6745098, 1,
-0.1540313, -0.7428855, -3.462683, 0, 1, 0.682353, 1,
-0.1484873, 0.6343117, 0.5377174, 0, 1, 0.6862745, 1,
-0.1483571, -0.7725186, -2.082462, 0, 1, 0.6941177, 1,
-0.1449247, 0.2897698, -1.821617, 0, 1, 0.7019608, 1,
-0.139571, -0.09889512, -2.30092, 0, 1, 0.7058824, 1,
-0.1373163, 0.07644188, -1.386413, 0, 1, 0.7137255, 1,
-0.1358214, 0.5209501, 0.9520808, 0, 1, 0.7176471, 1,
-0.1336943, -1.28388, -3.810461, 0, 1, 0.7254902, 1,
-0.1307888, -1.817736, -2.263699, 0, 1, 0.7294118, 1,
-0.1273602, 0.1647643, -1.915891, 0, 1, 0.7372549, 1,
-0.1266013, -0.6337295, -2.765295, 0, 1, 0.7411765, 1,
-0.1265289, -1.093606, -4.478175, 0, 1, 0.7490196, 1,
-0.1263142, 1.156339, -0.8125846, 0, 1, 0.7529412, 1,
-0.1251746, 0.2660934, -2.494643, 0, 1, 0.7607843, 1,
-0.123626, -0.9286178, -3.051377, 0, 1, 0.7647059, 1,
-0.1232011, -0.198179, -0.911509, 0, 1, 0.772549, 1,
-0.1230202, 2.415278, 0.04118168, 0, 1, 0.7764706, 1,
-0.121465, -1.731462, -3.02031, 0, 1, 0.7843137, 1,
-0.1189967, 1.401725, 0.01947788, 0, 1, 0.7882353, 1,
-0.1171185, 0.2913839, -0.0898979, 0, 1, 0.7960784, 1,
-0.1167114, 1.384943, 0.618191, 0, 1, 0.8039216, 1,
-0.1128825, -0.3363887, -2.63304, 0, 1, 0.8078431, 1,
-0.1092828, 0.8451433, 0.004605973, 0, 1, 0.8156863, 1,
-0.1034686, 0.001964008, -2.354961, 0, 1, 0.8196079, 1,
-0.1031989, -0.7926309, -3.174735, 0, 1, 0.827451, 1,
-0.1031073, 0.4456293, -0.5618197, 0, 1, 0.8313726, 1,
-0.1026692, 1.624859, -0.3637171, 0, 1, 0.8392157, 1,
-0.09739884, 0.874862, 1.689188, 0, 1, 0.8431373, 1,
-0.09448977, -0.4709723, -2.821361, 0, 1, 0.8509804, 1,
-0.09361126, 0.731865, 0.5501485, 0, 1, 0.854902, 1,
-0.08548165, 1.064608, -1.071619, 0, 1, 0.8627451, 1,
-0.0820322, 1.31593, -1.074414, 0, 1, 0.8666667, 1,
-0.08123196, 0.1792911, -1.047555, 0, 1, 0.8745098, 1,
-0.07910152, 0.01428531, -2.221573, 0, 1, 0.8784314, 1,
-0.07893661, 0.5107745, 1.388344, 0, 1, 0.8862745, 1,
-0.07873632, -0.4222612, -3.977679, 0, 1, 0.8901961, 1,
-0.07826531, -0.04980716, -1.166906, 0, 1, 0.8980392, 1,
-0.0782178, -0.252273, -4.255111, 0, 1, 0.9058824, 1,
-0.07818294, 0.7967983, 1.210698, 0, 1, 0.9098039, 1,
-0.07538973, -0.5744269, -3.863388, 0, 1, 0.9176471, 1,
-0.06779931, 0.4416711, 0.06070712, 0, 1, 0.9215686, 1,
-0.06492665, 1.436245, -0.6188451, 0, 1, 0.9294118, 1,
-0.06297128, 0.02987257, -2.28817, 0, 1, 0.9333333, 1,
-0.06128107, -0.4965695, -3.116165, 0, 1, 0.9411765, 1,
-0.05562307, 0.6860927, -0.05631293, 0, 1, 0.945098, 1,
-0.04863887, -0.6830149, -4.441926, 0, 1, 0.9529412, 1,
-0.04665368, 1.391492, -0.3107192, 0, 1, 0.9568627, 1,
-0.04563757, -0.62929, -2.65284, 0, 1, 0.9647059, 1,
-0.04474403, 0.6889925, 1.856354, 0, 1, 0.9686275, 1,
-0.04069862, -0.4964695, -3.759959, 0, 1, 0.9764706, 1,
-0.04060942, -0.4549432, -3.217728, 0, 1, 0.9803922, 1,
-0.04024652, 1.274056, -0.146881, 0, 1, 0.9882353, 1,
-0.03888369, -0.5196702, -5.032769, 0, 1, 0.9921569, 1,
-0.03704617, -0.1670553, -1.609769, 0, 1, 1, 1,
-0.034538, -0.4614415, -2.982585, 0, 0.9921569, 1, 1,
-0.0298598, 1.128826, -0.9353219, 0, 0.9882353, 1, 1,
-0.02715361, 0.259433, 0.8423141, 0, 0.9803922, 1, 1,
-0.02379926, 0.5217713, -0.03280077, 0, 0.9764706, 1, 1,
-0.02242426, 0.6628336, -0.7286155, 0, 0.9686275, 1, 1,
-0.01602941, -0.7469435, -2.420793, 0, 0.9647059, 1, 1,
-0.01343211, -1.065743, -3.599825, 0, 0.9568627, 1, 1,
-0.01063408, 0.0945493, -0.5201283, 0, 0.9529412, 1, 1,
-0.01009858, -0.1231135, -4.28463, 0, 0.945098, 1, 1,
-0.006276428, 1.998896, -1.036605, 0, 0.9411765, 1, 1,
0.006311119, 0.3101385, -0.3124775, 0, 0.9333333, 1, 1,
0.01771037, 0.8698387, -1.244861, 0, 0.9294118, 1, 1,
0.01832512, 0.495734, -1.325092, 0, 0.9215686, 1, 1,
0.01854256, -0.6844225, 3.087681, 0, 0.9176471, 1, 1,
0.02440458, -1.708069, 2.748664, 0, 0.9098039, 1, 1,
0.02490451, 0.5875201, -0.9356499, 0, 0.9058824, 1, 1,
0.02515878, 0.4694308, 0.5798666, 0, 0.8980392, 1, 1,
0.02702089, -0.03180621, 2.394417, 0, 0.8901961, 1, 1,
0.02865049, 0.9014145, 0.3001964, 0, 0.8862745, 1, 1,
0.0308517, 1.136057, -0.0619276, 0, 0.8784314, 1, 1,
0.03108829, 0.824292, -0.1010117, 0, 0.8745098, 1, 1,
0.03194366, 0.5007512, 0.636867, 0, 0.8666667, 1, 1,
0.03261085, -0.2835213, 4.675617, 0, 0.8627451, 1, 1,
0.03749242, 1.424314, -1.194212, 0, 0.854902, 1, 1,
0.03835169, -0.426789, 2.560504, 0, 0.8509804, 1, 1,
0.04336638, 0.6954998, 0.9168249, 0, 0.8431373, 1, 1,
0.04539668, -0.5161526, 3.920835, 0, 0.8392157, 1, 1,
0.04645724, -0.2115309, 3.284534, 0, 0.8313726, 1, 1,
0.04883079, 0.9718059, 0.3798274, 0, 0.827451, 1, 1,
0.05833393, 1.306865, 0.1236114, 0, 0.8196079, 1, 1,
0.0600796, -0.8636487, 3.332346, 0, 0.8156863, 1, 1,
0.06551544, -0.3612316, 1.946124, 0, 0.8078431, 1, 1,
0.06702797, 0.9596588, -0.9136473, 0, 0.8039216, 1, 1,
0.06794676, 0.7716754, -0.3449704, 0, 0.7960784, 1, 1,
0.07495086, -2.313207, 1.462249, 0, 0.7882353, 1, 1,
0.07562213, -0.8893741, 1.397215, 0, 0.7843137, 1, 1,
0.07854319, 0.7659566, 0.6769096, 0, 0.7764706, 1, 1,
0.08079091, -0.3088225, 4.357372, 0, 0.772549, 1, 1,
0.08828584, -0.1682084, 1.491858, 0, 0.7647059, 1, 1,
0.09022951, 1.469275, -0.4624248, 0, 0.7607843, 1, 1,
0.09189125, 1.468825, -1.652654, 0, 0.7529412, 1, 1,
0.09612558, -1.319522, 2.116848, 0, 0.7490196, 1, 1,
0.09687693, -1.249793, 0.8902107, 0, 0.7411765, 1, 1,
0.09724899, -2.053453, 4.090059, 0, 0.7372549, 1, 1,
0.1000526, -1.083147, 2.029687, 0, 0.7294118, 1, 1,
0.1011436, -0.6841317, 3.614754, 0, 0.7254902, 1, 1,
0.1038575, 0.1044843, -0.4435342, 0, 0.7176471, 1, 1,
0.1049627, 0.1707127, 2.815001, 0, 0.7137255, 1, 1,
0.1095788, -1.890466, 2.305238, 0, 0.7058824, 1, 1,
0.1105989, -1.135349, 4.30819, 0, 0.6980392, 1, 1,
0.1124887, 2.236529, 1.755004, 0, 0.6941177, 1, 1,
0.1134105, -0.7954644, 4.284961, 0, 0.6862745, 1, 1,
0.1136128, 0.2320273, 0.8686724, 0, 0.682353, 1, 1,
0.1137174, 0.5160339, -0.2700813, 0, 0.6745098, 1, 1,
0.1137264, 0.1909878, 1.178909, 0, 0.6705883, 1, 1,
0.1157164, 1.036177, -0.9232972, 0, 0.6627451, 1, 1,
0.1205796, -0.8571069, 2.196956, 0, 0.6588235, 1, 1,
0.1254797, -1.245496, 4.933033, 0, 0.6509804, 1, 1,
0.1313607, -1.301084, 2.216326, 0, 0.6470588, 1, 1,
0.1318353, -1.305304, 2.788835, 0, 0.6392157, 1, 1,
0.1365254, 1.803814, 2.411654, 0, 0.6352941, 1, 1,
0.1397779, -0.4298702, 2.063773, 0, 0.627451, 1, 1,
0.1400499, 0.7393793, 1.067969, 0, 0.6235294, 1, 1,
0.1409407, 2.074185, 1.114112, 0, 0.6156863, 1, 1,
0.1466435, 0.554154, -0.83922, 0, 0.6117647, 1, 1,
0.1466442, 0.02488663, -0.9542888, 0, 0.6039216, 1, 1,
0.1486899, 0.4114097, 1.534636, 0, 0.5960785, 1, 1,
0.1490805, 0.3707487, -1.087629, 0, 0.5921569, 1, 1,
0.1532103, -0.1544338, -0.1106598, 0, 0.5843138, 1, 1,
0.1533144, -0.01435333, 0.1457937, 0, 0.5803922, 1, 1,
0.153936, -0.3834893, 3.777101, 0, 0.572549, 1, 1,
0.1590192, 1.537196, -0.09082566, 0, 0.5686275, 1, 1,
0.1607846, -0.1250658, 2.035434, 0, 0.5607843, 1, 1,
0.1629211, 1.389472, 0.3055353, 0, 0.5568628, 1, 1,
0.1646761, 0.5059177, -0.5996331, 0, 0.5490196, 1, 1,
0.1655608, -2.807406, 3.1541, 0, 0.5450981, 1, 1,
0.1669521, -0.6324024, 2.755285, 0, 0.5372549, 1, 1,
0.1694143, -1.644845, 3.316712, 0, 0.5333334, 1, 1,
0.1736877, 0.1742492, 1.22695, 0, 0.5254902, 1, 1,
0.175881, -1.331258, 4.320437, 0, 0.5215687, 1, 1,
0.1771621, -0.9423606, 2.273487, 0, 0.5137255, 1, 1,
0.1846689, -0.4032551, 1.287164, 0, 0.509804, 1, 1,
0.1855291, 0.5339394, -0.02004657, 0, 0.5019608, 1, 1,
0.1858847, -0.4605645, 3.220079, 0, 0.4941176, 1, 1,
0.1860162, 1.79577, -0.2252778, 0, 0.4901961, 1, 1,
0.1925356, -0.7674598, 1.757904, 0, 0.4823529, 1, 1,
0.1935732, 1.911757, 0.7811108, 0, 0.4784314, 1, 1,
0.1938803, 0.5672154, -0.3205663, 0, 0.4705882, 1, 1,
0.1952237, -0.01194809, 0.5101257, 0, 0.4666667, 1, 1,
0.2009717, 0.008015244, 2.533566, 0, 0.4588235, 1, 1,
0.2033502, 0.628642, -0.1437954, 0, 0.454902, 1, 1,
0.2050215, -0.8197145, 4.99555, 0, 0.4470588, 1, 1,
0.2061568, -1.047521, 3.316244, 0, 0.4431373, 1, 1,
0.2092568, 0.01130491, 2.008892, 0, 0.4352941, 1, 1,
0.2092832, 1.180369, -1.778751, 0, 0.4313726, 1, 1,
0.2132788, 1.151553, 2.691401, 0, 0.4235294, 1, 1,
0.214332, -0.6490052, 4.620233, 0, 0.4196078, 1, 1,
0.218926, -0.3307423, 1.725476, 0, 0.4117647, 1, 1,
0.2194207, 0.5644315, 1.217874, 0, 0.4078431, 1, 1,
0.2211269, -0.1340439, 3.058222, 0, 0.4, 1, 1,
0.2258982, -0.1197537, 1.431901, 0, 0.3921569, 1, 1,
0.22632, -0.9659908, 1.014551, 0, 0.3882353, 1, 1,
0.2276621, -1.253648, 2.761467, 0, 0.3803922, 1, 1,
0.2288055, -0.9568737, 2.161445, 0, 0.3764706, 1, 1,
0.2299175, -0.7469083, 2.147969, 0, 0.3686275, 1, 1,
0.2317316, 1.593975, -0.8313049, 0, 0.3647059, 1, 1,
0.2343116, -0.4857616, 3.926027, 0, 0.3568628, 1, 1,
0.2363895, -1.54586, 3.690767, 0, 0.3529412, 1, 1,
0.2392272, -0.6057805, 3.461051, 0, 0.345098, 1, 1,
0.2394596, 1.155545, 0.9296401, 0, 0.3411765, 1, 1,
0.2405764, 0.4676987, -0.3354241, 0, 0.3333333, 1, 1,
0.2406286, 0.3271276, 1.527002, 0, 0.3294118, 1, 1,
0.2454571, 0.8294301, 0.4819215, 0, 0.3215686, 1, 1,
0.246169, 0.9551831, 0.373162, 0, 0.3176471, 1, 1,
0.2464993, 1.590314, 0.5044899, 0, 0.3098039, 1, 1,
0.2472924, 0.2913523, 0.6763901, 0, 0.3058824, 1, 1,
0.2532262, -1.044397, 2.119584, 0, 0.2980392, 1, 1,
0.2544827, 0.273765, -1.421333, 0, 0.2901961, 1, 1,
0.2548486, -0.5036848, 2.078312, 0, 0.2862745, 1, 1,
0.2557991, -0.1058954, 2.887715, 0, 0.2784314, 1, 1,
0.2610714, 0.01956551, 2.358595, 0, 0.2745098, 1, 1,
0.2661457, 0.7348729, 0.3545438, 0, 0.2666667, 1, 1,
0.2676478, -1.048836, 2.372165, 0, 0.2627451, 1, 1,
0.2677162, 0.4334754, 0.4594, 0, 0.254902, 1, 1,
0.2707475, 0.6627563, 2.246782, 0, 0.2509804, 1, 1,
0.2756245, 0.1407274, 2.405796, 0, 0.2431373, 1, 1,
0.2769147, 0.4754064, 1.264705, 0, 0.2392157, 1, 1,
0.2836328, 0.646453, 0.2245489, 0, 0.2313726, 1, 1,
0.286202, 0.02299484, 1.408559, 0, 0.227451, 1, 1,
0.2872173, -0.3692299, 2.373884, 0, 0.2196078, 1, 1,
0.2881908, -0.7227962, 1.235634, 0, 0.2156863, 1, 1,
0.2930752, 1.28026, 0.4308618, 0, 0.2078431, 1, 1,
0.294062, 0.3732449, 0.3887677, 0, 0.2039216, 1, 1,
0.2942418, -0.9431447, 3.054888, 0, 0.1960784, 1, 1,
0.2973626, -0.2870027, 1.219805, 0, 0.1882353, 1, 1,
0.2973848, 0.279732, 0.5530939, 0, 0.1843137, 1, 1,
0.2973914, 0.3716537, 0.5249905, 0, 0.1764706, 1, 1,
0.3012669, 0.6276147, -0.05614739, 0, 0.172549, 1, 1,
0.3031431, 1.085645, -2.454077, 0, 0.1647059, 1, 1,
0.3073311, 2.487354, 0.9245586, 0, 0.1607843, 1, 1,
0.307488, -0.2625688, 3.654125, 0, 0.1529412, 1, 1,
0.3089635, -0.2420067, 2.208547, 0, 0.1490196, 1, 1,
0.3124843, -0.4546438, 3.965089, 0, 0.1411765, 1, 1,
0.3125168, 0.3136568, 1.124639, 0, 0.1372549, 1, 1,
0.3177005, 0.4518846, 1.465807, 0, 0.1294118, 1, 1,
0.3243443, -1.422154, 3.470605, 0, 0.1254902, 1, 1,
0.3245739, -1.104246, 3.578694, 0, 0.1176471, 1, 1,
0.3252176, 0.4438793, 0.7187866, 0, 0.1137255, 1, 1,
0.3284281, -0.650031, 4.889833, 0, 0.1058824, 1, 1,
0.3295757, -1.063331, 3.495169, 0, 0.09803922, 1, 1,
0.338714, -1.610804, 1.872673, 0, 0.09411765, 1, 1,
0.3409255, 0.2090458, 0.1955049, 0, 0.08627451, 1, 1,
0.3453477, 0.1987637, 1.451144, 0, 0.08235294, 1, 1,
0.3458132, -0.8301371, 2.81217, 0, 0.07450981, 1, 1,
0.3539354, -1.222644, 1.962107, 0, 0.07058824, 1, 1,
0.3545966, 0.05301273, 2.552668, 0, 0.0627451, 1, 1,
0.3582901, 0.2581293, -1.185144, 0, 0.05882353, 1, 1,
0.3585525, -0.4738617, 1.133016, 0, 0.05098039, 1, 1,
0.3610906, -0.7815998, 2.654841, 0, 0.04705882, 1, 1,
0.3652124, 0.4363966, -0.1047536, 0, 0.03921569, 1, 1,
0.3668987, 0.5428893, -0.6316909, 0, 0.03529412, 1, 1,
0.3686027, 0.272986, 0.2598507, 0, 0.02745098, 1, 1,
0.3706923, 1.28603, 0.2247378, 0, 0.02352941, 1, 1,
0.3727223, -0.02872153, 2.340773, 0, 0.01568628, 1, 1,
0.3735544, 0.700952, 1.657848, 0, 0.01176471, 1, 1,
0.3744543, -0.5721366, 3.380228, 0, 0.003921569, 1, 1,
0.3754607, 2.558309, 0.2902123, 0.003921569, 0, 1, 1,
0.3763348, -1.072008, 2.832522, 0.007843138, 0, 1, 1,
0.3834836, 0.8299569, 1.056627, 0.01568628, 0, 1, 1,
0.3836679, -0.2201007, 1.683706, 0.01960784, 0, 1, 1,
0.3858549, -0.6740749, 0.9942622, 0.02745098, 0, 1, 1,
0.3947035, -0.2853129, 0.9981533, 0.03137255, 0, 1, 1,
0.395796, -2.541177, 3.369159, 0.03921569, 0, 1, 1,
0.4000743, 0.9514243, -0.1001104, 0.04313726, 0, 1, 1,
0.4081955, -0.6553515, 4.554904, 0.05098039, 0, 1, 1,
0.4082809, -1.130336, 2.235325, 0.05490196, 0, 1, 1,
0.4084452, 0.4954336, 1.713474, 0.0627451, 0, 1, 1,
0.4142089, 0.9190061, 1.629368, 0.06666667, 0, 1, 1,
0.4177029, 0.9832398, 0.9494148, 0.07450981, 0, 1, 1,
0.4315381, 0.4690582, 0.007348966, 0.07843138, 0, 1, 1,
0.433713, 0.3102482, 0.9257683, 0.08627451, 0, 1, 1,
0.4347365, -2.461933, 2.846952, 0.09019608, 0, 1, 1,
0.4372481, 0.8064979, -2.35283, 0.09803922, 0, 1, 1,
0.4373529, 0.3093136, 0.91292, 0.1058824, 0, 1, 1,
0.4434158, -0.6938158, 2.676798, 0.1098039, 0, 1, 1,
0.4454629, 1.467588, -0.907675, 0.1176471, 0, 1, 1,
0.4567438, 2.160035, 1.396109, 0.1215686, 0, 1, 1,
0.4666, -0.6113889, 2.859046, 0.1294118, 0, 1, 1,
0.4687205, 0.004033448, 3.310502, 0.1333333, 0, 1, 1,
0.4691974, 0.2960209, -0.05151692, 0.1411765, 0, 1, 1,
0.4710333, 0.3910157, 1.466063, 0.145098, 0, 1, 1,
0.4746227, 0.4407625, 1.105788, 0.1529412, 0, 1, 1,
0.4885127, 0.435791, -0.4026803, 0.1568628, 0, 1, 1,
0.4916116, -0.1794093, 2.152382, 0.1647059, 0, 1, 1,
0.4942311, 1.006751, 2.402074, 0.1686275, 0, 1, 1,
0.498935, 0.9531338, 0.452669, 0.1764706, 0, 1, 1,
0.4999051, 0.720834, 2.869946, 0.1803922, 0, 1, 1,
0.5007067, -0.9485129, 4.562779, 0.1882353, 0, 1, 1,
0.5132184, 0.408881, 0.21111, 0.1921569, 0, 1, 1,
0.5162545, -1.319837, 3.240569, 0.2, 0, 1, 1,
0.5193184, 2.030821, -1.48946, 0.2078431, 0, 1, 1,
0.5200189, -0.4881988, 3.221958, 0.2117647, 0, 1, 1,
0.5237223, -0.02849108, 1.186702, 0.2196078, 0, 1, 1,
0.5265377, 1.365722, 1.492423, 0.2235294, 0, 1, 1,
0.530425, 1.274912, 0.3561863, 0.2313726, 0, 1, 1,
0.5308082, 0.2415966, 1.503732, 0.2352941, 0, 1, 1,
0.532615, 0.2883553, 1.097615, 0.2431373, 0, 1, 1,
0.533387, -0.7313504, 0.5975015, 0.2470588, 0, 1, 1,
0.5337628, 0.5498657, 0.4187613, 0.254902, 0, 1, 1,
0.5353512, 0.7185277, -1.577578, 0.2588235, 0, 1, 1,
0.5382744, 0.4603111, -1.107415, 0.2666667, 0, 1, 1,
0.54198, 1.199221, 0.7872973, 0.2705882, 0, 1, 1,
0.5442412, -0.1062016, 0.9187744, 0.2784314, 0, 1, 1,
0.5443355, 2.457727, 1.270143, 0.282353, 0, 1, 1,
0.5472018, 0.04801952, 1.435984, 0.2901961, 0, 1, 1,
0.5506566, 0.360532, 1.821061, 0.2941177, 0, 1, 1,
0.5528793, 0.7990838, 0.2243715, 0.3019608, 0, 1, 1,
0.5535135, 1.000627, 1.549999, 0.3098039, 0, 1, 1,
0.5670567, 0.4666207, 2.673068, 0.3137255, 0, 1, 1,
0.5707038, -0.1083608, 0.372967, 0.3215686, 0, 1, 1,
0.5719872, 0.6087254, 0.932803, 0.3254902, 0, 1, 1,
0.5757802, -1.585355, 3.38667, 0.3333333, 0, 1, 1,
0.5759627, 0.3190426, -0.4373498, 0.3372549, 0, 1, 1,
0.5781577, -0.4452136, 1.524049, 0.345098, 0, 1, 1,
0.5832603, -2.139096, 3.012231, 0.3490196, 0, 1, 1,
0.5852075, 1.015395, 2.190039, 0.3568628, 0, 1, 1,
0.5886012, -1.679317, 1.884512, 0.3607843, 0, 1, 1,
0.5895309, -0.2461024, 1.834239, 0.3686275, 0, 1, 1,
0.599622, -1.081674, 3.077934, 0.372549, 0, 1, 1,
0.607263, -0.8563448, 2.321666, 0.3803922, 0, 1, 1,
0.6083736, -1.491737, 4.378179, 0.3843137, 0, 1, 1,
0.6089062, 0.04539806, 0.7974916, 0.3921569, 0, 1, 1,
0.6162556, -0.2634013, 2.711287, 0.3960784, 0, 1, 1,
0.6163604, -0.7027858, 2.807775, 0.4039216, 0, 1, 1,
0.6182215, 0.9008569, 1.178371, 0.4117647, 0, 1, 1,
0.6182944, 0.2922947, 1.532078, 0.4156863, 0, 1, 1,
0.6191202, -0.9015181, 3.312604, 0.4235294, 0, 1, 1,
0.6203189, -0.9313225, 2.514979, 0.427451, 0, 1, 1,
0.6281173, 0.554823, 0.7987081, 0.4352941, 0, 1, 1,
0.6398251, -1.11727, 2.37166, 0.4392157, 0, 1, 1,
0.6409957, -0.6258829, 1.633195, 0.4470588, 0, 1, 1,
0.6420615, 0.6815919, 0.8229334, 0.4509804, 0, 1, 1,
0.6437984, 0.02825619, 2.157378, 0.4588235, 0, 1, 1,
0.6438234, 1.298797, 0.003659899, 0.4627451, 0, 1, 1,
0.6507593, -0.7130213, 3.581263, 0.4705882, 0, 1, 1,
0.6514539, 0.777909, 0.8548998, 0.4745098, 0, 1, 1,
0.6560924, 0.09221719, 1.940816, 0.4823529, 0, 1, 1,
0.6564413, 0.7940313, 1.099293, 0.4862745, 0, 1, 1,
0.6565906, 0.1793494, 0.385765, 0.4941176, 0, 1, 1,
0.6578866, -0.7852556, 2.25713, 0.5019608, 0, 1, 1,
0.660867, -1.660008, 4.10425, 0.5058824, 0, 1, 1,
0.6645058, 0.9743503, 1.655834, 0.5137255, 0, 1, 1,
0.6731599, 1.502155, -0.004607057, 0.5176471, 0, 1, 1,
0.6786601, 1.156039, 0.03675308, 0.5254902, 0, 1, 1,
0.6795657, 0.1417062, 0.4994448, 0.5294118, 0, 1, 1,
0.6898513, -1.570087, 2.04338, 0.5372549, 0, 1, 1,
0.6900545, -1.192863, 5.163311, 0.5411765, 0, 1, 1,
0.6940109, 0.04771244, 1.721074, 0.5490196, 0, 1, 1,
0.6951562, 0.789703, 0.7617013, 0.5529412, 0, 1, 1,
0.6982749, -0.3632912, 2.924332, 0.5607843, 0, 1, 1,
0.6985713, 0.01176357, 3.40555, 0.5647059, 0, 1, 1,
0.6988051, -0.7907065, 3.106619, 0.572549, 0, 1, 1,
0.7011285, 1.30545, -0.1616839, 0.5764706, 0, 1, 1,
0.7027659, -0.7590926, 0.8841226, 0.5843138, 0, 1, 1,
0.7041929, 1.777132, 1.259797, 0.5882353, 0, 1, 1,
0.7052647, 0.1008019, 3.811716, 0.5960785, 0, 1, 1,
0.7056751, 1.067263, 1.227695, 0.6039216, 0, 1, 1,
0.7057531, 0.3191043, 0.542349, 0.6078432, 0, 1, 1,
0.7163973, -2.566758, 2.440707, 0.6156863, 0, 1, 1,
0.7169911, 0.2977653, 1.189382, 0.6196079, 0, 1, 1,
0.7170605, 0.08414181, 1.753092, 0.627451, 0, 1, 1,
0.7257932, 0.4813807, 3.002607, 0.6313726, 0, 1, 1,
0.7293204, -0.7693973, 2.630696, 0.6392157, 0, 1, 1,
0.7296435, -1.882082, 3.919389, 0.6431373, 0, 1, 1,
0.7333264, -0.2184725, 2.257315, 0.6509804, 0, 1, 1,
0.7391939, 0.88173, 0.8276919, 0.654902, 0, 1, 1,
0.7395041, -1.445047, 2.902375, 0.6627451, 0, 1, 1,
0.7408994, 0.2970265, 1.108413, 0.6666667, 0, 1, 1,
0.7490484, 1.084447, 0.02425385, 0.6745098, 0, 1, 1,
0.7533137, 0.5548044, 0.1621484, 0.6784314, 0, 1, 1,
0.7669926, -0.3128898, 4.541971, 0.6862745, 0, 1, 1,
0.7678118, 0.128631, 4.156887, 0.6901961, 0, 1, 1,
0.7694592, -0.6336705, 1.980245, 0.6980392, 0, 1, 1,
0.7754883, -0.6719502, 4.652895, 0.7058824, 0, 1, 1,
0.7764753, 0.02284156, 0.9709374, 0.7098039, 0, 1, 1,
0.7780907, 0.87714, 0.3932788, 0.7176471, 0, 1, 1,
0.7836689, -0.1812095, 1.380899, 0.7215686, 0, 1, 1,
0.7858583, 0.3074026, 1.181898, 0.7294118, 0, 1, 1,
0.7933891, 0.3154335, 0.5791473, 0.7333333, 0, 1, 1,
0.7980639, -1.084014, 3.333508, 0.7411765, 0, 1, 1,
0.804567, -0.06286738, 0.974273, 0.7450981, 0, 1, 1,
0.8074416, 1.756761, 1.258936, 0.7529412, 0, 1, 1,
0.8083119, 1.718559, 0.2171258, 0.7568628, 0, 1, 1,
0.8140326, -0.1476873, 0.4826176, 0.7647059, 0, 1, 1,
0.8153012, 1.05581, -1.054143, 0.7686275, 0, 1, 1,
0.8215792, -1.009892, 3.343612, 0.7764706, 0, 1, 1,
0.833494, -0.6909771, 3.038653, 0.7803922, 0, 1, 1,
0.8396404, 0.9330139, 0.4109327, 0.7882353, 0, 1, 1,
0.8444712, 0.09391057, 1.457585, 0.7921569, 0, 1, 1,
0.8581991, -0.6994588, 2.745505, 0.8, 0, 1, 1,
0.8840831, -0.1270821, 1.80911, 0.8078431, 0, 1, 1,
0.8913231, 0.7894548, 0.663673, 0.8117647, 0, 1, 1,
0.8915029, 0.04130719, 1.487191, 0.8196079, 0, 1, 1,
0.8928049, 2.11024, -0.5130456, 0.8235294, 0, 1, 1,
0.8929922, 0.9801852, 0.7708293, 0.8313726, 0, 1, 1,
0.9034533, 0.02970991, 1.28624, 0.8352941, 0, 1, 1,
0.9140138, -1.853612, 2.613494, 0.8431373, 0, 1, 1,
0.919944, -1.056205, 1.819667, 0.8470588, 0, 1, 1,
0.9236106, -1.10402, 2.46861, 0.854902, 0, 1, 1,
0.9313343, 1.525774, 0.2001166, 0.8588235, 0, 1, 1,
0.9420456, -0.2033642, 1.5609, 0.8666667, 0, 1, 1,
0.9428259, 1.31096, 0.06144786, 0.8705882, 0, 1, 1,
0.9462938, -0.1946415, 2.032325, 0.8784314, 0, 1, 1,
0.9521899, -0.790929, 1.720096, 0.8823529, 0, 1, 1,
0.9543022, -0.2236661, -1.230203, 0.8901961, 0, 1, 1,
0.9605661, 0.953063, 1.646826, 0.8941177, 0, 1, 1,
0.9613681, 1.961959, 0.6456226, 0.9019608, 0, 1, 1,
0.9629493, 0.5132142, -0.2731234, 0.9098039, 0, 1, 1,
0.9629869, -0.6382782, 2.632026, 0.9137255, 0, 1, 1,
0.9645197, -0.2696187, 3.390674, 0.9215686, 0, 1, 1,
0.9667392, 1.101808, -0.5846615, 0.9254902, 0, 1, 1,
0.9678153, -0.3600625, 2.122747, 0.9333333, 0, 1, 1,
0.9678381, 0.9000061, 0.3440275, 0.9372549, 0, 1, 1,
0.9736794, -0.9688882, 2.026818, 0.945098, 0, 1, 1,
0.9819376, -0.1880151, 0.3904731, 0.9490196, 0, 1, 1,
0.9831724, 0.8944346, 2.926089, 0.9568627, 0, 1, 1,
0.9877876, -0.652732, 2.80521, 0.9607843, 0, 1, 1,
0.9908277, 0.3071163, 1.162057, 0.9686275, 0, 1, 1,
0.993451, 0.06953635, 1.418535, 0.972549, 0, 1, 1,
0.9953514, 0.06755715, 1.899873, 0.9803922, 0, 1, 1,
0.9971587, -0.2862721, 3.484426, 0.9843137, 0, 1, 1,
1.004562, 0.4381773, 1.786768, 0.9921569, 0, 1, 1,
1.010786, 0.3940921, 0.9594033, 0.9960784, 0, 1, 1,
1.012229, -0.8818109, 1.75059, 1, 0, 0.9960784, 1,
1.017414, -0.6272227, 3.130988, 1, 0, 0.9882353, 1,
1.018236, 0.2661402, 2.703033, 1, 0, 0.9843137, 1,
1.018894, 0.1941243, 2.926628, 1, 0, 0.9764706, 1,
1.019562, 0.6617444, 2.336832, 1, 0, 0.972549, 1,
1.021244, 1.841817, 1.293427, 1, 0, 0.9647059, 1,
1.02534, -0.4019294, 1.583802, 1, 0, 0.9607843, 1,
1.028576, -0.4724221, 0.8638597, 1, 0, 0.9529412, 1,
1.031686, -0.7113932, 0.2409874, 1, 0, 0.9490196, 1,
1.033129, -1.960018, 2.080891, 1, 0, 0.9411765, 1,
1.038345, 0.4165885, 1.293193, 1, 0, 0.9372549, 1,
1.042101, -0.6827038, 0.6377271, 1, 0, 0.9294118, 1,
1.058511, -1.234304, 0.7306978, 1, 0, 0.9254902, 1,
1.06712, -0.4602256, 0.9098156, 1, 0, 0.9176471, 1,
1.070751, -0.4184808, 1.629599, 1, 0, 0.9137255, 1,
1.075848, -0.02985846, 1.231809, 1, 0, 0.9058824, 1,
1.078827, -0.2579225, 2.665834, 1, 0, 0.9019608, 1,
1.08157, -1.389005, 2.092871, 1, 0, 0.8941177, 1,
1.081931, -0.05453438, 1.300173, 1, 0, 0.8862745, 1,
1.088233, 0.1417683, 2.102957, 1, 0, 0.8823529, 1,
1.091906, 2.079819, 0.2085101, 1, 0, 0.8745098, 1,
1.098902, 0.08482593, 2.786001, 1, 0, 0.8705882, 1,
1.102721, -0.1837475, 0.5765972, 1, 0, 0.8627451, 1,
1.107068, -0.3975349, 1.973584, 1, 0, 0.8588235, 1,
1.110621, -0.1990247, 1.113837, 1, 0, 0.8509804, 1,
1.110698, 0.006729994, 0.7102689, 1, 0, 0.8470588, 1,
1.116743, 1.587996, -0.3458448, 1, 0, 0.8392157, 1,
1.121925, 0.2124685, 0.04854864, 1, 0, 0.8352941, 1,
1.125559, -0.5189725, 1.957883, 1, 0, 0.827451, 1,
1.134622, 0.1305016, 1.010935, 1, 0, 0.8235294, 1,
1.135994, 1.279974, 2.5367, 1, 0, 0.8156863, 1,
1.1597, 0.05329958, 1.534926, 1, 0, 0.8117647, 1,
1.161635, -0.03253548, 2.410157, 1, 0, 0.8039216, 1,
1.16581, 0.6771104, 0.3264889, 1, 0, 0.7960784, 1,
1.166345, -0.7282676, 1.285024, 1, 0, 0.7921569, 1,
1.168079, -0.04550324, 0.9912083, 1, 0, 0.7843137, 1,
1.176794, 1.784752, -0.4030695, 1, 0, 0.7803922, 1,
1.177305, 1.550405, 1.180173, 1, 0, 0.772549, 1,
1.17831, 0.3997695, 2.186158, 1, 0, 0.7686275, 1,
1.179986, 0.1852336, 1.617969, 1, 0, 0.7607843, 1,
1.180993, 0.3162439, 2.117908, 1, 0, 0.7568628, 1,
1.187634, 0.4331526, 1.413244, 1, 0, 0.7490196, 1,
1.199541, 0.9664332, 0.8984534, 1, 0, 0.7450981, 1,
1.200914, 0.1111074, -0.282984, 1, 0, 0.7372549, 1,
1.20216, 0.3386481, 1.253686, 1, 0, 0.7333333, 1,
1.207608, 0.03101718, 2.431021, 1, 0, 0.7254902, 1,
1.212147, 1.484955, 0.2360408, 1, 0, 0.7215686, 1,
1.21492, 0.9355801, -0.257775, 1, 0, 0.7137255, 1,
1.215147, 1.319157, 0.6174531, 1, 0, 0.7098039, 1,
1.215586, -0.5312585, 2.08547, 1, 0, 0.7019608, 1,
1.223287, 0.05389142, 1.797054, 1, 0, 0.6941177, 1,
1.229101, -0.2519141, 2.291945, 1, 0, 0.6901961, 1,
1.23779, 0.5576857, 2.798315, 1, 0, 0.682353, 1,
1.246142, 0.3690484, 2.366355, 1, 0, 0.6784314, 1,
1.249819, 1.276562, 1.953187, 1, 0, 0.6705883, 1,
1.258838, 0.6644872, 0.2376302, 1, 0, 0.6666667, 1,
1.267076, 0.2999419, 1.777599, 1, 0, 0.6588235, 1,
1.269154, -0.2882459, 1.803613, 1, 0, 0.654902, 1,
1.278409, 2.031904, 0.9389504, 1, 0, 0.6470588, 1,
1.285434, -0.5411555, 2.607153, 1, 0, 0.6431373, 1,
1.287968, -0.7444205, 2.531498, 1, 0, 0.6352941, 1,
1.291945, -0.1692818, -0.9995666, 1, 0, 0.6313726, 1,
1.298887, 0.4226828, 0.9124193, 1, 0, 0.6235294, 1,
1.301816, 0.2468688, 0.6466853, 1, 0, 0.6196079, 1,
1.30854, -2.809954, 1.705516, 1, 0, 0.6117647, 1,
1.318059, -0.7635794, 2.576939, 1, 0, 0.6078432, 1,
1.325704, -1.473592, 2.375346, 1, 0, 0.6, 1,
1.3278, 1.779117, 0.6661819, 1, 0, 0.5921569, 1,
1.348981, -0.6714538, 1.659581, 1, 0, 0.5882353, 1,
1.349726, 0.8222544, 1.021551, 1, 0, 0.5803922, 1,
1.349917, 0.9587181, 4.168118, 1, 0, 0.5764706, 1,
1.352397, -0.4307921, 1.686326, 1, 0, 0.5686275, 1,
1.366115, 1.093796, 1.805893, 1, 0, 0.5647059, 1,
1.366557, -0.9165499, 1.937164, 1, 0, 0.5568628, 1,
1.367739, 0.837835, 1.814563, 1, 0, 0.5529412, 1,
1.369526, 1.932106, 2.426125, 1, 0, 0.5450981, 1,
1.371805, -1.233057, 3.013183, 1, 0, 0.5411765, 1,
1.390851, -0.2063933, 1.159323, 1, 0, 0.5333334, 1,
1.395821, -0.4541532, 1.70174, 1, 0, 0.5294118, 1,
1.404996, 0.2276554, 2.158326, 1, 0, 0.5215687, 1,
1.411155, 0.02126763, 1.393809, 1, 0, 0.5176471, 1,
1.413445, -1.164904, 3.385325, 1, 0, 0.509804, 1,
1.415383, 0.5233907, 0.9812537, 1, 0, 0.5058824, 1,
1.420576, 0.6130238, 0.02692226, 1, 0, 0.4980392, 1,
1.425067, -0.5502216, 1.418324, 1, 0, 0.4901961, 1,
1.434653, 1.4613, 0.6342505, 1, 0, 0.4862745, 1,
1.441131, -2.546792, 3.014453, 1, 0, 0.4784314, 1,
1.445367, 0.7092266, 1.511247, 1, 0, 0.4745098, 1,
1.446152, 0.4076941, 1.212562, 1, 0, 0.4666667, 1,
1.456008, 2.232384, 0.3686273, 1, 0, 0.4627451, 1,
1.459363, 1.238161, 0.569768, 1, 0, 0.454902, 1,
1.465983, 1.765277, -0.9911521, 1, 0, 0.4509804, 1,
1.487239, 0.5558742, 1.971073, 1, 0, 0.4431373, 1,
1.493176, -2.337295, 0.905675, 1, 0, 0.4392157, 1,
1.493281, 0.6276327, 0.8960205, 1, 0, 0.4313726, 1,
1.503245, 0.2842537, 3.076911, 1, 0, 0.427451, 1,
1.504825, 0.05955185, 2.096138, 1, 0, 0.4196078, 1,
1.511809, 1.64453, 0.8651554, 1, 0, 0.4156863, 1,
1.51368, 1.29865, 0.4633612, 1, 0, 0.4078431, 1,
1.514974, -0.217955, 2.804489, 1, 0, 0.4039216, 1,
1.518919, -1.062428, 2.06733, 1, 0, 0.3960784, 1,
1.52696, 1.304924, 1.934315, 1, 0, 0.3882353, 1,
1.554485, -0.2958016, 1.860437, 1, 0, 0.3843137, 1,
1.573665, 1.486974, -0.3412738, 1, 0, 0.3764706, 1,
1.581032, 1.060022, 1.121379, 1, 0, 0.372549, 1,
1.596846, 0.6347319, 0.9115332, 1, 0, 0.3647059, 1,
1.604508, 0.3336576, 1.804787, 1, 0, 0.3607843, 1,
1.609303, -0.9374852, 1.308338, 1, 0, 0.3529412, 1,
1.628619, -0.393539, 0.6482147, 1, 0, 0.3490196, 1,
1.639706, 0.844322, -0.4412711, 1, 0, 0.3411765, 1,
1.647434, -1.896209, 2.180033, 1, 0, 0.3372549, 1,
1.650358, 1.11463, 1.442363, 1, 0, 0.3294118, 1,
1.652157, 0.3841388, 0.0105158, 1, 0, 0.3254902, 1,
1.658558, 2.829892, 0.182396, 1, 0, 0.3176471, 1,
1.672323, -0.5220846, 1.94641, 1, 0, 0.3137255, 1,
1.674829, -1.125189, 1.305134, 1, 0, 0.3058824, 1,
1.696995, 1.619394, 1.524863, 1, 0, 0.2980392, 1,
1.706618, 0.286314, 1.010145, 1, 0, 0.2941177, 1,
1.708132, -0.4345613, 2.40861, 1, 0, 0.2862745, 1,
1.712216, 0.39972, 1.685098, 1, 0, 0.282353, 1,
1.716643, -0.6918346, 1.43117, 1, 0, 0.2745098, 1,
1.723128, -1.4496, 2.922501, 1, 0, 0.2705882, 1,
1.731386, 1.46944, 1.017767, 1, 0, 0.2627451, 1,
1.758058, -0.9701865, 1.225114, 1, 0, 0.2588235, 1,
1.790469, 0.7434932, 0.02652807, 1, 0, 0.2509804, 1,
1.799246, 0.5182887, 1.972657, 1, 0, 0.2470588, 1,
1.801685, 0.8340304, 0.3399994, 1, 0, 0.2392157, 1,
1.822631, -0.1930924, 0.05778543, 1, 0, 0.2352941, 1,
1.836671, 0.6195905, 2.24308, 1, 0, 0.227451, 1,
1.844097, -1.73943, 2.17579, 1, 0, 0.2235294, 1,
1.84637, 1.081274, 2.565412, 1, 0, 0.2156863, 1,
1.851641, -1.405615, 3.179218, 1, 0, 0.2117647, 1,
1.890015, 0.9113677, 2.186922, 1, 0, 0.2039216, 1,
1.903394, 0.6186308, 2.411394, 1, 0, 0.1960784, 1,
1.915163, -0.2653921, 2.612705, 1, 0, 0.1921569, 1,
1.92078, -0.1657795, 1.821021, 1, 0, 0.1843137, 1,
1.926056, -0.6490138, 0.2741157, 1, 0, 0.1803922, 1,
1.935398, 0.3119576, 1.18679, 1, 0, 0.172549, 1,
1.939548, 0.4610219, 1.378408, 1, 0, 0.1686275, 1,
1.945982, -0.5177885, 1.981412, 1, 0, 0.1607843, 1,
1.94737, 1.164037, 0.6252069, 1, 0, 0.1568628, 1,
1.954821, -0.8798167, 3.543941, 1, 0, 0.1490196, 1,
1.990334, 0.03163004, -0.6567979, 1, 0, 0.145098, 1,
2.013442, -1.097091, 2.8592, 1, 0, 0.1372549, 1,
2.030982, -1.176072, 4.264505, 1, 0, 0.1333333, 1,
2.079489, 0.8770323, 1.642545, 1, 0, 0.1254902, 1,
2.08499, -0.3124475, 1.184345, 1, 0, 0.1215686, 1,
2.10867, -0.1486231, 2.901037, 1, 0, 0.1137255, 1,
2.116285, 0.3547951, 1.278824, 1, 0, 0.1098039, 1,
2.139334, -0.497776, 2.329057, 1, 0, 0.1019608, 1,
2.166018, 1.19164, -0.7369908, 1, 0, 0.09411765, 1,
2.188824, -0.4132263, 0.4522642, 1, 0, 0.09019608, 1,
2.225315, -1.605389, 2.964184, 1, 0, 0.08235294, 1,
2.246612, 0.5411144, 0.6930674, 1, 0, 0.07843138, 1,
2.274124, -1.847992, 2.375221, 1, 0, 0.07058824, 1,
2.296026, 0.2553194, 1.653807, 1, 0, 0.06666667, 1,
2.336505, -0.8322358, 3.467138, 1, 0, 0.05882353, 1,
2.390861, -0.355919, 1.868801, 1, 0, 0.05490196, 1,
2.446058, 0.3056552, 1.840634, 1, 0, 0.04705882, 1,
2.451337, 0.3438602, 1.212453, 1, 0, 0.04313726, 1,
2.501757, 0.2568921, -0.7146924, 1, 0, 0.03529412, 1,
2.575755, -0.9343128, 1.130114, 1, 0, 0.03137255, 1,
2.607269, -2.126048, 3.076537, 1, 0, 0.02352941, 1,
2.68878, -1.57461, 2.288179, 1, 0, 0.01960784, 1,
2.929453, -0.5577445, 0.7911905, 1, 0, 0.01176471, 1,
3.099055, -0.2687437, 2.735799, 1, 0, 0.007843138, 1
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
0.01451313, -3.8084, -7.515996, 0, -0.5, 0.5, 0.5,
0.01451313, -3.8084, -7.515996, 1, -0.5, 0.5, 0.5,
0.01451313, -3.8084, -7.515996, 1, 1.5, 0.5, 0.5,
0.01451313, -3.8084, -7.515996, 0, 1.5, 0.5, 0.5
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
-4.115688, 0.1353146, -7.515996, 0, -0.5, 0.5, 0.5,
-4.115688, 0.1353146, -7.515996, 1, -0.5, 0.5, 0.5,
-4.115688, 0.1353146, -7.515996, 1, 1.5, 0.5, 0.5,
-4.115688, 0.1353146, -7.515996, 0, 1.5, 0.5, 0.5
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
-4.115688, -3.8084, -0.2575126, 0, -0.5, 0.5, 0.5,
-4.115688, -3.8084, -0.2575126, 1, -0.5, 0.5, 0.5,
-4.115688, -3.8084, -0.2575126, 1, 1.5, 0.5, 0.5,
-4.115688, -3.8084, -0.2575126, 0, 1.5, 0.5, 0.5
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
-3, -2.898312, -5.840961,
3, -2.898312, -5.840961,
-3, -2.898312, -5.840961,
-3, -3.049994, -6.120134,
-2, -2.898312, -5.840961,
-2, -3.049994, -6.120134,
-1, -2.898312, -5.840961,
-1, -3.049994, -6.120134,
0, -2.898312, -5.840961,
0, -3.049994, -6.120134,
1, -2.898312, -5.840961,
1, -3.049994, -6.120134,
2, -2.898312, -5.840961,
2, -3.049994, -6.120134,
3, -2.898312, -5.840961,
3, -3.049994, -6.120134
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
-3, -3.353356, -6.678479, 0, -0.5, 0.5, 0.5,
-3, -3.353356, -6.678479, 1, -0.5, 0.5, 0.5,
-3, -3.353356, -6.678479, 1, 1.5, 0.5, 0.5,
-3, -3.353356, -6.678479, 0, 1.5, 0.5, 0.5,
-2, -3.353356, -6.678479, 0, -0.5, 0.5, 0.5,
-2, -3.353356, -6.678479, 1, -0.5, 0.5, 0.5,
-2, -3.353356, -6.678479, 1, 1.5, 0.5, 0.5,
-2, -3.353356, -6.678479, 0, 1.5, 0.5, 0.5,
-1, -3.353356, -6.678479, 0, -0.5, 0.5, 0.5,
-1, -3.353356, -6.678479, 1, -0.5, 0.5, 0.5,
-1, -3.353356, -6.678479, 1, 1.5, 0.5, 0.5,
-1, -3.353356, -6.678479, 0, 1.5, 0.5, 0.5,
0, -3.353356, -6.678479, 0, -0.5, 0.5, 0.5,
0, -3.353356, -6.678479, 1, -0.5, 0.5, 0.5,
0, -3.353356, -6.678479, 1, 1.5, 0.5, 0.5,
0, -3.353356, -6.678479, 0, 1.5, 0.5, 0.5,
1, -3.353356, -6.678479, 0, -0.5, 0.5, 0.5,
1, -3.353356, -6.678479, 1, -0.5, 0.5, 0.5,
1, -3.353356, -6.678479, 1, 1.5, 0.5, 0.5,
1, -3.353356, -6.678479, 0, 1.5, 0.5, 0.5,
2, -3.353356, -6.678479, 0, -0.5, 0.5, 0.5,
2, -3.353356, -6.678479, 1, -0.5, 0.5, 0.5,
2, -3.353356, -6.678479, 1, 1.5, 0.5, 0.5,
2, -3.353356, -6.678479, 0, 1.5, 0.5, 0.5,
3, -3.353356, -6.678479, 0, -0.5, 0.5, 0.5,
3, -3.353356, -6.678479, 1, -0.5, 0.5, 0.5,
3, -3.353356, -6.678479, 1, 1.5, 0.5, 0.5,
3, -3.353356, -6.678479, 0, 1.5, 0.5, 0.5
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
-3.162565, -2, -5.840961,
-3.162565, 3, -5.840961,
-3.162565, -2, -5.840961,
-3.321419, -2, -6.120134,
-3.162565, -1, -5.840961,
-3.321419, -1, -6.120134,
-3.162565, 0, -5.840961,
-3.321419, 0, -6.120134,
-3.162565, 1, -5.840961,
-3.321419, 1, -6.120134,
-3.162565, 2, -5.840961,
-3.321419, 2, -6.120134,
-3.162565, 3, -5.840961,
-3.321419, 3, -6.120134
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
-3.639127, -2, -6.678479, 0, -0.5, 0.5, 0.5,
-3.639127, -2, -6.678479, 1, -0.5, 0.5, 0.5,
-3.639127, -2, -6.678479, 1, 1.5, 0.5, 0.5,
-3.639127, -2, -6.678479, 0, 1.5, 0.5, 0.5,
-3.639127, -1, -6.678479, 0, -0.5, 0.5, 0.5,
-3.639127, -1, -6.678479, 1, -0.5, 0.5, 0.5,
-3.639127, -1, -6.678479, 1, 1.5, 0.5, 0.5,
-3.639127, -1, -6.678479, 0, 1.5, 0.5, 0.5,
-3.639127, 0, -6.678479, 0, -0.5, 0.5, 0.5,
-3.639127, 0, -6.678479, 1, -0.5, 0.5, 0.5,
-3.639127, 0, -6.678479, 1, 1.5, 0.5, 0.5,
-3.639127, 0, -6.678479, 0, 1.5, 0.5, 0.5,
-3.639127, 1, -6.678479, 0, -0.5, 0.5, 0.5,
-3.639127, 1, -6.678479, 1, -0.5, 0.5, 0.5,
-3.639127, 1, -6.678479, 1, 1.5, 0.5, 0.5,
-3.639127, 1, -6.678479, 0, 1.5, 0.5, 0.5,
-3.639127, 2, -6.678479, 0, -0.5, 0.5, 0.5,
-3.639127, 2, -6.678479, 1, -0.5, 0.5, 0.5,
-3.639127, 2, -6.678479, 1, 1.5, 0.5, 0.5,
-3.639127, 2, -6.678479, 0, 1.5, 0.5, 0.5,
-3.639127, 3, -6.678479, 0, -0.5, 0.5, 0.5,
-3.639127, 3, -6.678479, 1, -0.5, 0.5, 0.5,
-3.639127, 3, -6.678479, 1, 1.5, 0.5, 0.5,
-3.639127, 3, -6.678479, 0, 1.5, 0.5, 0.5
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
-3.162565, -2.898312, -4,
-3.162565, -2.898312, 4,
-3.162565, -2.898312, -4,
-3.321419, -3.049994, -4,
-3.162565, -2.898312, -2,
-3.321419, -3.049994, -2,
-3.162565, -2.898312, 0,
-3.321419, -3.049994, 0,
-3.162565, -2.898312, 2,
-3.321419, -3.049994, 2,
-3.162565, -2.898312, 4,
-3.321419, -3.049994, 4
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
-3.639127, -3.353356, -4, 0, -0.5, 0.5, 0.5,
-3.639127, -3.353356, -4, 1, -0.5, 0.5, 0.5,
-3.639127, -3.353356, -4, 1, 1.5, 0.5, 0.5,
-3.639127, -3.353356, -4, 0, 1.5, 0.5, 0.5,
-3.639127, -3.353356, -2, 0, -0.5, 0.5, 0.5,
-3.639127, -3.353356, -2, 1, -0.5, 0.5, 0.5,
-3.639127, -3.353356, -2, 1, 1.5, 0.5, 0.5,
-3.639127, -3.353356, -2, 0, 1.5, 0.5, 0.5,
-3.639127, -3.353356, 0, 0, -0.5, 0.5, 0.5,
-3.639127, -3.353356, 0, 1, -0.5, 0.5, 0.5,
-3.639127, -3.353356, 0, 1, 1.5, 0.5, 0.5,
-3.639127, -3.353356, 0, 0, 1.5, 0.5, 0.5,
-3.639127, -3.353356, 2, 0, -0.5, 0.5, 0.5,
-3.639127, -3.353356, 2, 1, -0.5, 0.5, 0.5,
-3.639127, -3.353356, 2, 1, 1.5, 0.5, 0.5,
-3.639127, -3.353356, 2, 0, 1.5, 0.5, 0.5,
-3.639127, -3.353356, 4, 0, -0.5, 0.5, 0.5,
-3.639127, -3.353356, 4, 1, -0.5, 0.5, 0.5,
-3.639127, -3.353356, 4, 1, 1.5, 0.5, 0.5,
-3.639127, -3.353356, 4, 0, 1.5, 0.5, 0.5
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
-3.162565, -2.898312, -5.840961,
-3.162565, 3.168941, -5.840961,
-3.162565, -2.898312, 5.325936,
-3.162565, 3.168941, 5.325936,
-3.162565, -2.898312, -5.840961,
-3.162565, -2.898312, 5.325936,
-3.162565, 3.168941, -5.840961,
-3.162565, 3.168941, 5.325936,
-3.162565, -2.898312, -5.840961,
3.191591, -2.898312, -5.840961,
-3.162565, -2.898312, 5.325936,
3.191591, -2.898312, 5.325936,
-3.162565, 3.168941, -5.840961,
3.191591, 3.168941, -5.840961,
-3.162565, 3.168941, 5.325936,
3.191591, 3.168941, 5.325936,
3.191591, -2.898312, -5.840961,
3.191591, 3.168941, -5.840961,
3.191591, -2.898312, 5.325936,
3.191591, 3.168941, 5.325936,
3.191591, -2.898312, -5.840961,
3.191591, -2.898312, 5.325936,
3.191591, 3.168941, -5.840961,
3.191591, 3.168941, 5.325936
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
var radius = 7.587157;
var distance = 33.75611;
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
mvMatrix.translate( -0.01451313, -0.1353146, 0.2575126 );
mvMatrix.scale( 1.291026, 1.352075, 0.7346161 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.75611);
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
cyclopropyloxycarbon<-read.table("cyclopropyloxycarbon.xyz")
```

```
## Error in read.table("cyclopropyloxycarbon.xyz"): no lines available in input
```

```r
x<-cyclopropyloxycarbon$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropyloxycarbon' not found
```

```r
y<-cyclopropyloxycarbon$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropyloxycarbon' not found
```

```r
z<-cyclopropyloxycarbon$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropyloxycarbon' not found
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
-3.070029, 1.075936, -1.638661, 0, 0, 1, 1, 1,
-3.036823, -0.1098992, -1.344937, 1, 0, 0, 1, 1,
-2.953384, -0.2743421, -1.80474, 1, 0, 0, 1, 1,
-2.818165, 0.8670505, -2.94959, 1, 0, 0, 1, 1,
-2.727559, -1.790713, -1.23811, 1, 0, 0, 1, 1,
-2.509282, 0.8613386, -0.4938163, 1, 0, 0, 1, 1,
-2.496309, -1.860027, -2.118188, 0, 0, 0, 1, 1,
-2.392739, -0.3717077, -1.683148, 0, 0, 0, 1, 1,
-2.354257, -0.2350913, -2.559264, 0, 0, 0, 1, 1,
-2.343103, 0.279753, -2.221135, 0, 0, 0, 1, 1,
-2.260647, -0.6646055, -2.869697, 0, 0, 0, 1, 1,
-2.227687, 0.1849698, -0.4370876, 0, 0, 0, 1, 1,
-2.226992, 0.3889346, -1.669295, 0, 0, 0, 1, 1,
-2.208675, 0.2865905, -3.087179, 1, 1, 1, 1, 1,
-2.199621, -0.7112384, -2.902702, 1, 1, 1, 1, 1,
-2.191327, 1.452637, -2.389237, 1, 1, 1, 1, 1,
-2.181642, -1.265417, -2.447035, 1, 1, 1, 1, 1,
-2.15637, 0.1790673, -2.109288, 1, 1, 1, 1, 1,
-2.154744, -1.060041, -2.511403, 1, 1, 1, 1, 1,
-2.114753, 0.5033625, -0.489948, 1, 1, 1, 1, 1,
-2.106098, 0.6650808, -0.2572807, 1, 1, 1, 1, 1,
-2.085746, -0.06295095, -1.309772, 1, 1, 1, 1, 1,
-2.041119, 0.06413686, -2.487638, 1, 1, 1, 1, 1,
-2.040187, 0.04975986, -3.476222, 1, 1, 1, 1, 1,
-2.020694, 0.2743334, -0.551141, 1, 1, 1, 1, 1,
-2.010202, -0.7532021, -2.439327, 1, 1, 1, 1, 1,
-2.007441, 0.01109592, -1.337129, 1, 1, 1, 1, 1,
-1.995956, 1.121743, -1.937499, 1, 1, 1, 1, 1,
-1.985476, 0.8126289, 0.4754926, 0, 0, 1, 1, 1,
-1.982283, -1.249702, -3.048611, 1, 0, 0, 1, 1,
-1.982211, -0.2893832, -2.681811, 1, 0, 0, 1, 1,
-1.955427, -1.056982, -2.553075, 1, 0, 0, 1, 1,
-1.955419, -0.7347179, -2.490388, 1, 0, 0, 1, 1,
-1.949978, 0.8669732, -1.154793, 1, 0, 0, 1, 1,
-1.930071, 0.6741166, -0.376228, 0, 0, 0, 1, 1,
-1.930053, 0.8079644, -1.489584, 0, 0, 0, 1, 1,
-1.904699, -0.4474838, -1.782688, 0, 0, 0, 1, 1,
-1.899956, -0.3040116, -0.9873133, 0, 0, 0, 1, 1,
-1.884915, -1.068816, -2.175757, 0, 0, 0, 1, 1,
-1.884365, 0.6831986, -2.319227, 0, 0, 0, 1, 1,
-1.881513, -1.815576, -3.998742, 0, 0, 0, 1, 1,
-1.869304, -1.894512, -3.444601, 1, 1, 1, 1, 1,
-1.820255, 0.8022715, -1.211426, 1, 1, 1, 1, 1,
-1.796602, 2.716205, -0.282384, 1, 1, 1, 1, 1,
-1.78045, -1.339223, -1.458521, 1, 1, 1, 1, 1,
-1.749081, 1.050091, 0.1031142, 1, 1, 1, 1, 1,
-1.736406, 0.7096737, -1.350687, 1, 1, 1, 1, 1,
-1.669813, -0.2551508, -2.311734, 1, 1, 1, 1, 1,
-1.668531, 0.633661, -1.343367, 1, 1, 1, 1, 1,
-1.648359, 1.69452, -1.884387, 1, 1, 1, 1, 1,
-1.638527, -0.6652462, -4.684449, 1, 1, 1, 1, 1,
-1.634418, -1.187652, -2.27229, 1, 1, 1, 1, 1,
-1.619065, 1.276788, 0.1589198, 1, 1, 1, 1, 1,
-1.612517, 0.7345622, -1.300128, 1, 1, 1, 1, 1,
-1.602613, -1.983054, -3.608769, 1, 1, 1, 1, 1,
-1.597547, -1.355018, -1.865963, 1, 1, 1, 1, 1,
-1.595917, 1.705589, -0.1695494, 0, 0, 1, 1, 1,
-1.593106, 0.04550822, -0.7777793, 1, 0, 0, 1, 1,
-1.5747, -0.7058427, -0.8968604, 1, 0, 0, 1, 1,
-1.56819, -0.3201851, -1.647717, 1, 0, 0, 1, 1,
-1.557847, -1.498436, -1.946541, 1, 0, 0, 1, 1,
-1.556446, -1.010783, -1.93107, 1, 0, 0, 1, 1,
-1.553083, 1.207806, -2.25376, 0, 0, 0, 1, 1,
-1.551574, 0.2947086, -2.522362, 0, 0, 0, 1, 1,
-1.534285, -0.1532626, -1.922302, 0, 0, 0, 1, 1,
-1.533405, -0.002079184, -0.7650356, 0, 0, 0, 1, 1,
-1.490533, 0.3763172, -0.6214037, 0, 0, 0, 1, 1,
-1.47716, -0.0687266, -2.665933, 0, 0, 0, 1, 1,
-1.474204, -0.4551249, -2.34727, 0, 0, 0, 1, 1,
-1.469686, -0.7149661, -1.541935, 1, 1, 1, 1, 1,
-1.464118, -0.877175, -1.267523, 1, 1, 1, 1, 1,
-1.460327, -0.9316643, -1.288308, 1, 1, 1, 1, 1,
-1.444889, 1.953432, -1.716792, 1, 1, 1, 1, 1,
-1.437149, 1.515307, -0.4844539, 1, 1, 1, 1, 1,
-1.429307, -2.152712, -4.374666, 1, 1, 1, 1, 1,
-1.422835, -0.725522, -0.1327447, 1, 1, 1, 1, 1,
-1.421302, 0.4302185, -1.142652, 1, 1, 1, 1, 1,
-1.407719, -0.4783691, -1.699105, 1, 1, 1, 1, 1,
-1.403733, 1.293611, -1.181062, 1, 1, 1, 1, 1,
-1.384008, 1.747004, -1.739244, 1, 1, 1, 1, 1,
-1.382403, 0.4518184, -0.374208, 1, 1, 1, 1, 1,
-1.376663, 2.031578, -1.666696, 1, 1, 1, 1, 1,
-1.374156, -0.7944766, -0.1367841, 1, 1, 1, 1, 1,
-1.370414, 0.7692537, -1.664328, 1, 1, 1, 1, 1,
-1.367565, -0.5193425, -0.9548439, 0, 0, 1, 1, 1,
-1.366891, -0.2584752, -2.393531, 1, 0, 0, 1, 1,
-1.348433, 0.9038522, -0.3033262, 1, 0, 0, 1, 1,
-1.341999, -0.1709288, -3.911422, 1, 0, 0, 1, 1,
-1.330043, -0.8856799, -2.36629, 1, 0, 0, 1, 1,
-1.328079, -0.03388544, -2.302919, 1, 0, 0, 1, 1,
-1.326512, 0.4173858, -0.3728903, 0, 0, 0, 1, 1,
-1.325987, 1.459156, -1.056912, 0, 0, 0, 1, 1,
-1.293634, 0.3363582, -2.249465, 0, 0, 0, 1, 1,
-1.290025, 0.06470624, -1.381404, 0, 0, 0, 1, 1,
-1.289075, 1.30742, 0.2598806, 0, 0, 0, 1, 1,
-1.284515, -0.2338726, -2.404223, 0, 0, 0, 1, 1,
-1.278295, -0.1805146, -1.06831, 0, 0, 0, 1, 1,
-1.275102, 1.490215, 0.5293469, 1, 1, 1, 1, 1,
-1.269137, 0.1673971, -1.194204, 1, 1, 1, 1, 1,
-1.266539, -1.360407, -1.293177, 1, 1, 1, 1, 1,
-1.26469, -0.2896393, -1.215385, 1, 1, 1, 1, 1,
-1.263415, 0.7560818, -1.451847, 1, 1, 1, 1, 1,
-1.261229, 0.8312011, -1.848555, 1, 1, 1, 1, 1,
-1.256617, 0.01848546, -0.4880951, 1, 1, 1, 1, 1,
-1.255229, 1.13099, -0.9232578, 1, 1, 1, 1, 1,
-1.250513, -0.3822573, -1.633937, 1, 1, 1, 1, 1,
-1.237089, 1.052999, -0.7946267, 1, 1, 1, 1, 1,
-1.236873, 0.7160393, -0.8188277, 1, 1, 1, 1, 1,
-1.208239, -0.8659527, -4.354806, 1, 1, 1, 1, 1,
-1.207796, -0.241279, -2.449911, 1, 1, 1, 1, 1,
-1.206718, 1.624317, -0.9438869, 1, 1, 1, 1, 1,
-1.201427, 0.1354624, -1.069779, 1, 1, 1, 1, 1,
-1.198472, -1.72002, -3.256572, 0, 0, 1, 1, 1,
-1.195863, -2.211297, -1.154292, 1, 0, 0, 1, 1,
-1.184724, 0.06182597, -1.946583, 1, 0, 0, 1, 1,
-1.176715, -1.211315, -2.840826, 1, 0, 0, 1, 1,
-1.173217, -0.1924844, -1.215307, 1, 0, 0, 1, 1,
-1.149763, 0.008797621, -1.864437, 1, 0, 0, 1, 1,
-1.147879, -0.4538981, -0.9916499, 0, 0, 0, 1, 1,
-1.146206, 2.3077, -1.710441, 0, 0, 0, 1, 1,
-1.14501, -0.5764591, -2.606574, 0, 0, 0, 1, 1,
-1.133121, -1.980481, -3.010613, 0, 0, 0, 1, 1,
-1.119632, -1.399025, -5.354007, 0, 0, 0, 1, 1,
-1.116495, 1.357572, -0.3866682, 0, 0, 0, 1, 1,
-1.113901, 2.269766, -0.2611857, 0, 0, 0, 1, 1,
-1.109568, -0.3029425, -3.480259, 1, 1, 1, 1, 1,
-1.107799, -0.6576235, -1.411816, 1, 1, 1, 1, 1,
-1.10434, -0.03285577, -2.585325, 1, 1, 1, 1, 1,
-1.096811, -0.02971699, -2.13019, 1, 1, 1, 1, 1,
-1.096042, 1.191345, 0.5027521, 1, 1, 1, 1, 1,
-1.084768, -0.2787183, -1.717098, 1, 1, 1, 1, 1,
-1.081574, 0.5876598, -2.113865, 1, 1, 1, 1, 1,
-1.076654, -0.3537193, -1.929971, 1, 1, 1, 1, 1,
-1.073002, 0.8577257, -0.5710197, 1, 1, 1, 1, 1,
-1.070934, -0.5299708, -0.5448722, 1, 1, 1, 1, 1,
-1.068528, 0.3961323, 0.2848347, 1, 1, 1, 1, 1,
-1.06656, -0.2134456, -0.5354363, 1, 1, 1, 1, 1,
-1.064159, -0.7487743, -2.881288, 1, 1, 1, 1, 1,
-1.061137, 0.4005213, -1.715501, 1, 1, 1, 1, 1,
-1.060902, -0.619898, -2.427203, 1, 1, 1, 1, 1,
-1.059128, 3.080583, -0.5822809, 0, 0, 1, 1, 1,
-1.058407, -0.8166345, -2.913071, 1, 0, 0, 1, 1,
-1.056734, -1.563301, -3.058547, 1, 0, 0, 1, 1,
-1.052626, 1.127724, -1.354017, 1, 0, 0, 1, 1,
-1.049409, -1.048277, -1.46512, 1, 0, 0, 1, 1,
-1.043173, 0.8883045, -1.003997, 1, 0, 0, 1, 1,
-1.042606, -0.0545963, -1.715127, 0, 0, 0, 1, 1,
-1.040935, 1.418809, -1.468934, 0, 0, 0, 1, 1,
-1.04083, 0.6453549, 0.4209408, 0, 0, 0, 1, 1,
-1.039377, 0.1623379, -0.7921701, 0, 0, 0, 1, 1,
-1.038949, -0.9110549, -3.059632, 0, 0, 0, 1, 1,
-1.037199, -0.04557342, -4.2406, 0, 0, 0, 1, 1,
-1.025046, 0.5085492, -1.079736, 0, 0, 0, 1, 1,
-1.024092, 0.5927581, -1.211131, 1, 1, 1, 1, 1,
-1.01544, 0.7463174, -1.782286, 1, 1, 1, 1, 1,
-1.014444, -0.3638988, -1.905982, 1, 1, 1, 1, 1,
-1.004641, 0.166304, -2.607795, 1, 1, 1, 1, 1,
-0.9807889, 0.5074022, 0.1208715, 1, 1, 1, 1, 1,
-0.9735994, 0.3447928, -1.047622, 1, 1, 1, 1, 1,
-0.9727426, -0.339234, -2.327618, 1, 1, 1, 1, 1,
-0.9716762, -0.05193421, -1.033358, 1, 1, 1, 1, 1,
-0.9671156, 1.014083, 0.52507, 1, 1, 1, 1, 1,
-0.960953, -0.3559299, -2.328021, 1, 1, 1, 1, 1,
-0.9583479, -0.314307, -2.810649, 1, 1, 1, 1, 1,
-0.9570606, -0.2718399, -1.374648, 1, 1, 1, 1, 1,
-0.9489177, 0.4887759, 0.6867632, 1, 1, 1, 1, 1,
-0.9466813, -0.5061957, -3.136441, 1, 1, 1, 1, 1,
-0.9441088, -1.316946, -2.800042, 1, 1, 1, 1, 1,
-0.9437636, -0.7445322, -2.425774, 0, 0, 1, 1, 1,
-0.9429775, -1.118718, -2.687667, 1, 0, 0, 1, 1,
-0.9366127, 0.9482536, -1.909782, 1, 0, 0, 1, 1,
-0.9351459, -0.04546555, -1.972202, 1, 0, 0, 1, 1,
-0.9344313, 0.9521449, -0.01418067, 1, 0, 0, 1, 1,
-0.9263102, 1.317853, 1.266904, 1, 0, 0, 1, 1,
-0.9254472, -1.70929, -2.742152, 0, 0, 0, 1, 1,
-0.923137, -0.3829709, -3.296196, 0, 0, 0, 1, 1,
-0.922806, -0.691716, -2.121932, 0, 0, 0, 1, 1,
-0.9217304, 0.7267265, -0.3302782, 0, 0, 0, 1, 1,
-0.9168571, 1.18533, -0.4910379, 0, 0, 0, 1, 1,
-0.9101885, 0.7031656, -1.765031, 0, 0, 0, 1, 1,
-0.9058355, 0.5745633, -1.483577, 0, 0, 0, 1, 1,
-0.9036936, -2.477852, -1.61704, 1, 1, 1, 1, 1,
-0.9013082, 1.797417, -0.03660146, 1, 1, 1, 1, 1,
-0.8967226, -0.007474631, 0.4340834, 1, 1, 1, 1, 1,
-0.8952979, 0.3208224, -2.476967, 1, 1, 1, 1, 1,
-0.8909218, 0.02353712, -0.6562489, 1, 1, 1, 1, 1,
-0.8906978, -0.6541483, -2.422718, 1, 1, 1, 1, 1,
-0.8892235, -0.6542993, -2.079274, 1, 1, 1, 1, 1,
-0.8856582, 1.151044, -2.780319, 1, 1, 1, 1, 1,
-0.8839725, 0.1578627, -2.122175, 1, 1, 1, 1, 1,
-0.8825539, 1.46129, -1.363781, 1, 1, 1, 1, 1,
-0.8814383, -1.4932, -2.098991, 1, 1, 1, 1, 1,
-0.8737342, 2.20706, 0.4587509, 1, 1, 1, 1, 1,
-0.8719542, 1.625864, 0.07813971, 1, 1, 1, 1, 1,
-0.8674338, 1.038992, 0.01046544, 1, 1, 1, 1, 1,
-0.8656225, 0.6212839, -1.090261, 1, 1, 1, 1, 1,
-0.8623841, -0.2219165, -2.09222, 0, 0, 1, 1, 1,
-0.8599243, 0.3767709, -0.750296, 1, 0, 0, 1, 1,
-0.852746, -2.406036, -3.256156, 1, 0, 0, 1, 1,
-0.8420324, 0.5227265, -0.7108462, 1, 0, 0, 1, 1,
-0.8414987, -0.6815817, -2.679848, 1, 0, 0, 1, 1,
-0.8364443, 0.4239017, -0.983775, 1, 0, 0, 1, 1,
-0.8356423, -0.8395852, -2.000543, 0, 0, 0, 1, 1,
-0.8340272, -0.2627363, -1.604533, 0, 0, 0, 1, 1,
-0.8330961, -0.7768848, -2.674896, 0, 0, 0, 1, 1,
-0.8220426, -1.088915, -2.285861, 0, 0, 0, 1, 1,
-0.8183365, 0.7277347, -0.2858254, 0, 0, 0, 1, 1,
-0.8173198, -0.005109811, -0.4764853, 0, 0, 0, 1, 1,
-0.8148165, -1.798663, -2.63291, 0, 0, 0, 1, 1,
-0.8123785, 0.5627506, 0.03295833, 1, 1, 1, 1, 1,
-0.810208, 0.4554828, -0.4421718, 1, 1, 1, 1, 1,
-0.8094338, -0.1732516, -1.793997, 1, 1, 1, 1, 1,
-0.8093808, -0.8196604, -1.999325, 1, 1, 1, 1, 1,
-0.8005782, -0.2905945, -2.784758, 1, 1, 1, 1, 1,
-0.799844, -0.2763754, -1.203389, 1, 1, 1, 1, 1,
-0.7940254, 0.3059966, -2.911963, 1, 1, 1, 1, 1,
-0.7905873, -0.3624473, 0.1150898, 1, 1, 1, 1, 1,
-0.789816, -1.414379, -2.298934, 1, 1, 1, 1, 1,
-0.7888921, -0.7262416, -1.561126, 1, 1, 1, 1, 1,
-0.7836707, 0.07738744, 0.8519964, 1, 1, 1, 1, 1,
-0.7778426, 0.03467257, -2.566228, 1, 1, 1, 1, 1,
-0.7689049, 0.2286283, -3.131707, 1, 1, 1, 1, 1,
-0.7630988, 0.8200595, 0.6523975, 1, 1, 1, 1, 1,
-0.7621368, 0.7922092, -0.7347167, 1, 1, 1, 1, 1,
-0.760919, 0.2520521, -1.238427, 0, 0, 1, 1, 1,
-0.7603855, -1.155608, -2.339076, 1, 0, 0, 1, 1,
-0.7583628, 0.1086223, 0.1474814, 1, 0, 0, 1, 1,
-0.7486288, -0.170053, -2.632915, 1, 0, 0, 1, 1,
-0.7472788, 0.3134996, -1.407741, 1, 0, 0, 1, 1,
-0.7472605, 0.7271296, -1.013766, 1, 0, 0, 1, 1,
-0.7425044, -0.7672441, -5.423366, 0, 0, 0, 1, 1,
-0.7423791, 1.214717, -0.2023766, 0, 0, 0, 1, 1,
-0.7418358, 2.367148, -0.8019441, 0, 0, 0, 1, 1,
-0.7410029, 0.4606518, -2.101614, 0, 0, 0, 1, 1,
-0.7388712, -0.9401143, -2.318935, 0, 0, 0, 1, 1,
-0.7364566, 0.7780035, -1.100461, 0, 0, 0, 1, 1,
-0.7345468, -0.2362229, -0.4116144, 0, 0, 0, 1, 1,
-0.7307978, 0.126442, -0.5057024, 1, 1, 1, 1, 1,
-0.7268167, -1.76381, -3.011986, 1, 1, 1, 1, 1,
-0.7267196, 0.9523414, -0.4764735, 1, 1, 1, 1, 1,
-0.7249511, 0.6307333, -2.054081, 1, 1, 1, 1, 1,
-0.7220375, -0.4298372, -2.77002, 1, 1, 1, 1, 1,
-0.7208613, -0.6248334, -1.722489, 1, 1, 1, 1, 1,
-0.7206283, -1.034143, -3.27252, 1, 1, 1, 1, 1,
-0.7109983, 1.553304, -2.126158, 1, 1, 1, 1, 1,
-0.7022493, 1.81864, 0.2657317, 1, 1, 1, 1, 1,
-0.6973324, 0.1646837, -2.26035, 1, 1, 1, 1, 1,
-0.68716, 0.1530139, -1.618629, 1, 1, 1, 1, 1,
-0.6739652, -0.1840814, -2.37358, 1, 1, 1, 1, 1,
-0.6716278, 1.868492, 0.9769714, 1, 1, 1, 1, 1,
-0.6705851, 1.395963, -0.2493264, 1, 1, 1, 1, 1,
-0.6689131, -0.6526909, -0.6978885, 1, 1, 1, 1, 1,
-0.6681489, 0.2787781, -0.3441373, 0, 0, 1, 1, 1,
-0.6650621, -1.381426, -3.430095, 1, 0, 0, 1, 1,
-0.6596352, 1.848791, -0.5352379, 1, 0, 0, 1, 1,
-0.6585515, 0.1444726, -0.7251437, 1, 0, 0, 1, 1,
-0.6545601, -0.8873447, -3.26389, 1, 0, 0, 1, 1,
-0.6512342, -0.8471103, -3.440939, 1, 0, 0, 1, 1,
-0.6462948, 0.1048607, -1.315298, 0, 0, 0, 1, 1,
-0.6415834, -1.137241, -3.232343, 0, 0, 0, 1, 1,
-0.6382456, -0.4790194, -1.762803, 0, 0, 0, 1, 1,
-0.6300058, 0.7497788, -0.5266037, 0, 0, 0, 1, 1,
-0.6286703, -0.2282503, -1.836805, 0, 0, 0, 1, 1,
-0.624498, 1.764936, 0.3121581, 0, 0, 0, 1, 1,
-0.6219201, -0.2470495, -2.974284, 0, 0, 0, 1, 1,
-0.6155492, 1.346985, -0.8941584, 1, 1, 1, 1, 1,
-0.6134513, 0.1129154, -0.1589217, 1, 1, 1, 1, 1,
-0.6114075, -0.4049613, -1.60983, 1, 1, 1, 1, 1,
-0.6055457, -0.872914, -0.6999652, 1, 1, 1, 1, 1,
-0.6014452, -0.4982631, -2.223973, 1, 1, 1, 1, 1,
-0.6013117, 1.097903, -0.4948516, 1, 1, 1, 1, 1,
-0.5980907, 0.4837265, -1.30365, 1, 1, 1, 1, 1,
-0.5966671, -0.4978547, -1.311001, 1, 1, 1, 1, 1,
-0.5930345, -1.004945, -3.608639, 1, 1, 1, 1, 1,
-0.5897148, 0.7280581, -1.067947, 1, 1, 1, 1, 1,
-0.5888289, 1.108346, -1.248096, 1, 1, 1, 1, 1,
-0.588686, 0.2690256, -0.4062672, 1, 1, 1, 1, 1,
-0.5851839, 0.6737574, -1.393125, 1, 1, 1, 1, 1,
-0.5777713, 0.6392708, -0.1836669, 1, 1, 1, 1, 1,
-0.5705285, 0.7494458, -0.3452724, 1, 1, 1, 1, 1,
-0.5624757, 0.2254796, -1.399679, 0, 0, 1, 1, 1,
-0.5559029, -0.1473205, -2.28845, 1, 0, 0, 1, 1,
-0.5548164, 0.6294793, 0.4190284, 1, 0, 0, 1, 1,
-0.5518135, -1.161065, -2.835361, 1, 0, 0, 1, 1,
-0.5492712, -0.06324504, -1.269033, 1, 0, 0, 1, 1,
-0.5447655, -1.317, -2.578896, 1, 0, 0, 1, 1,
-0.5437949, -0.7041232, -2.063544, 0, 0, 0, 1, 1,
-0.5372851, 0.3133394, -1.769454, 0, 0, 0, 1, 1,
-0.5368615, 0.9531335, -0.2209515, 0, 0, 0, 1, 1,
-0.5348306, -0.6115381, -2.34142, 0, 0, 0, 1, 1,
-0.5342553, -0.7896715, -0.8981208, 0, 0, 0, 1, 1,
-0.532731, 1.412364, 0.1882709, 0, 0, 0, 1, 1,
-0.5289333, 0.5647714, 0.8176054, 0, 0, 0, 1, 1,
-0.52882, 0.6514815, -2.411586, 1, 1, 1, 1, 1,
-0.5265129, -1.221141, -0.2984801, 1, 1, 1, 1, 1,
-0.5253343, -0.3471516, -0.6402119, 1, 1, 1, 1, 1,
-0.525126, -2.239033, -2.337739, 1, 1, 1, 1, 1,
-0.5225947, -0.1414569, -0.3034951, 1, 1, 1, 1, 1,
-0.5223565, -0.09067627, -0.6310483, 1, 1, 1, 1, 1,
-0.5219141, 1.611099, -0.1310397, 1, 1, 1, 1, 1,
-0.5191488, -1.561938, -2.214146, 1, 1, 1, 1, 1,
-0.5185713, 0.5164908, -0.8306318, 1, 1, 1, 1, 1,
-0.5168918, 0.1998355, -1.664673, 1, 1, 1, 1, 1,
-0.515866, 1.444955, -1.042323, 1, 1, 1, 1, 1,
-0.5130941, -0.1131, -0.8544774, 1, 1, 1, 1, 1,
-0.5109976, 1.33899, -1.25842, 1, 1, 1, 1, 1,
-0.5102718, -0.2478861, -0.7889274, 1, 1, 1, 1, 1,
-0.5101773, -0.9781904, -2.201848, 1, 1, 1, 1, 1,
-0.50617, 0.3851514, 0.2378929, 0, 0, 1, 1, 1,
-0.5059766, 2.303933, -2.643489, 1, 0, 0, 1, 1,
-0.5052719, 0.6936397, -1.199653, 1, 0, 0, 1, 1,
-0.5052546, 0.959883, -0.141573, 1, 0, 0, 1, 1,
-0.492409, -0.5093817, -3.330041, 1, 0, 0, 1, 1,
-0.4917101, -0.446755, -0.8236545, 1, 0, 0, 1, 1,
-0.48817, 0.1584379, -1.291921, 0, 0, 0, 1, 1,
-0.4871091, -0.01752242, -1.907001, 0, 0, 0, 1, 1,
-0.4852633, -0.4380253, -2.249515, 0, 0, 0, 1, 1,
-0.4832244, 0.6081408, -1.135651, 0, 0, 0, 1, 1,
-0.4827058, -0.3696384, -2.06916, 0, 0, 0, 1, 1,
-0.4783118, 1.022458, -0.988903, 0, 0, 0, 1, 1,
-0.478265, 0.1996354, -1.971945, 0, 0, 0, 1, 1,
-0.4761611, -0.5723875, -2.87947, 1, 1, 1, 1, 1,
-0.4761165, 1.113113, -1.310073, 1, 1, 1, 1, 1,
-0.4760689, -1.575311, -1.39486, 1, 1, 1, 1, 1,
-0.4744805, 0.08338971, 0.4988832, 1, 1, 1, 1, 1,
-0.4727112, -0.3696213, 0.1586389, 1, 1, 1, 1, 1,
-0.4667313, -0.1653591, 0.4654793, 1, 1, 1, 1, 1,
-0.4655987, -2.290487, -1.762267, 1, 1, 1, 1, 1,
-0.4646727, 1.181194, 0.3190264, 1, 1, 1, 1, 1,
-0.4640432, -0.1784078, -1.377936, 1, 1, 1, 1, 1,
-0.4636008, -0.6359015, -2.984908, 1, 1, 1, 1, 1,
-0.4605858, -1.118509, -3.498522, 1, 1, 1, 1, 1,
-0.4592887, 0.09474615, -0.8977302, 1, 1, 1, 1, 1,
-0.4567043, -0.3808291, -2.268202, 1, 1, 1, 1, 1,
-0.4547811, 0.2526642, -0.3284159, 1, 1, 1, 1, 1,
-0.4541081, 2.056128, 0.6085164, 1, 1, 1, 1, 1,
-0.4513257, 0.1163406, 0.02202506, 0, 0, 1, 1, 1,
-0.4459003, 2.098609, -0.1564612, 1, 0, 0, 1, 1,
-0.4452652, 0.4074355, -1.226359, 1, 0, 0, 1, 1,
-0.4350573, 0.5489523, -1.754785, 1, 0, 0, 1, 1,
-0.4336492, 1.454146, 0.7163309, 1, 0, 0, 1, 1,
-0.4335507, -0.1128304, -1.919985, 1, 0, 0, 1, 1,
-0.4333191, 0.8160752, 0.8104814, 0, 0, 0, 1, 1,
-0.4265538, -1.290556, -4.318458, 0, 0, 0, 1, 1,
-0.4260532, 1.12823, -2.711373, 0, 0, 0, 1, 1,
-0.4216612, 0.3715945, -1.773757, 0, 0, 0, 1, 1,
-0.417049, 1.094429, -2.572429, 0, 0, 0, 1, 1,
-0.4169451, 0.4275325, -0.8881493, 0, 0, 0, 1, 1,
-0.4107512, 0.7997494, 0.4968268, 0, 0, 0, 1, 1,
-0.4101449, 0.3247499, -0.6219634, 1, 1, 1, 1, 1,
-0.409635, 0.4684414, 0.1340769, 1, 1, 1, 1, 1,
-0.4071522, 0.7341443, -0.07959154, 1, 1, 1, 1, 1,
-0.4052581, -0.5641156, -3.000912, 1, 1, 1, 1, 1,
-0.3964808, -1.484303, -3.398194, 1, 1, 1, 1, 1,
-0.3872022, -0.1594118, -2.048184, 1, 1, 1, 1, 1,
-0.3846378, 0.3062592, 0.9002959, 1, 1, 1, 1, 1,
-0.3769008, -1.020451, -5.010626, 1, 1, 1, 1, 1,
-0.3768848, 1.894062, -0.7874339, 1, 1, 1, 1, 1,
-0.3724405, 0.1510519, -0.6009423, 1, 1, 1, 1, 1,
-0.3688006, 0.2790014, -0.3096013, 1, 1, 1, 1, 1,
-0.353695, -0.4624418, -2.296657, 1, 1, 1, 1, 1,
-0.3501319, -0.7644638, -4.68145, 1, 1, 1, 1, 1,
-0.3481408, -0.4526795, -2.774822, 1, 1, 1, 1, 1,
-0.3479333, -0.1976192, -3.009488, 1, 1, 1, 1, 1,
-0.3473226, -1.385544, -3.161441, 0, 0, 1, 1, 1,
-0.3458662, 0.9831808, -1.026742, 1, 0, 0, 1, 1,
-0.3454792, -0.8377298, -3.218859, 1, 0, 0, 1, 1,
-0.3440112, 2.259598, 0.4468859, 1, 0, 0, 1, 1,
-0.3404068, 1.692466, 0.3669495, 1, 0, 0, 1, 1,
-0.3391275, 0.4048424, -2.272834, 1, 0, 0, 1, 1,
-0.3371333, 0.005456165, -1.737623, 0, 0, 0, 1, 1,
-0.3349489, 1.751617, 0.2392049, 0, 0, 0, 1, 1,
-0.3326235, 1.114332, 0.03904795, 0, 0, 0, 1, 1,
-0.3240733, 1.268364, 0.4514266, 0, 0, 0, 1, 1,
-0.3239134, -0.984383, -3.097992, 0, 0, 0, 1, 1,
-0.3226983, 0.7498894, -0.6391355, 0, 0, 0, 1, 1,
-0.319868, 0.1571906, -0.4189304, 0, 0, 0, 1, 1,
-0.3185687, 0.2882662, -1.065609, 1, 1, 1, 1, 1,
-0.3185186, 0.0414585, -2.243476, 1, 1, 1, 1, 1,
-0.3136061, -1.05149, -3.485588, 1, 1, 1, 1, 1,
-0.3114754, 0.4938978, -1.184052, 1, 1, 1, 1, 1,
-0.3097868, 0.2086037, -0.6673772, 1, 1, 1, 1, 1,
-0.3097396, 0.007080891, 0.1527359, 1, 1, 1, 1, 1,
-0.3043372, -0.201766, -2.020993, 1, 1, 1, 1, 1,
-0.2971172, -0.3681091, -1.316142, 1, 1, 1, 1, 1,
-0.2956003, 1.618997, 0.4257104, 1, 1, 1, 1, 1,
-0.2927356, -0.09034967, -1.514951, 1, 1, 1, 1, 1,
-0.2871761, 0.04878304, -1.945935, 1, 1, 1, 1, 1,
-0.2868678, -0.104147, -3.858433, 1, 1, 1, 1, 1,
-0.2868574, -1.18196, -3.263611, 1, 1, 1, 1, 1,
-0.2864969, -0.5970045, -3.014705, 1, 1, 1, 1, 1,
-0.2854664, 0.4233385, -0.4412525, 1, 1, 1, 1, 1,
-0.2797775, 2.35334, 0.7541254, 0, 0, 1, 1, 1,
-0.2747542, -0.7234338, -3.398666, 1, 0, 0, 1, 1,
-0.2696262, -0.3759793, -0.2950943, 1, 0, 0, 1, 1,
-0.2680336, 0.5687071, 1.370728, 1, 0, 0, 1, 1,
-0.2642553, -1.648956, -2.05462, 1, 0, 0, 1, 1,
-0.2639289, -0.861989, -3.098008, 1, 0, 0, 1, 1,
-0.2638642, 1.734943, -0.654789, 0, 0, 0, 1, 1,
-0.2600197, 0.4073829, -1.237594, 0, 0, 0, 1, 1,
-0.2593259, -1.470486, -5.678337, 0, 0, 0, 1, 1,
-0.251157, 0.5609362, 1.080431, 0, 0, 0, 1, 1,
-0.2478432, -0.9159616, -2.144246, 0, 0, 0, 1, 1,
-0.2466334, 0.3713912, 0.0530261, 0, 0, 0, 1, 1,
-0.2445175, 1.177842, 0.1792749, 0, 0, 0, 1, 1,
-0.2411463, 0.1190297, -0.8147462, 1, 1, 1, 1, 1,
-0.2380796, 0.7655554, -0.07331758, 1, 1, 1, 1, 1,
-0.2340233, 0.1177616, 0.1543231, 1, 1, 1, 1, 1,
-0.2317499, -1.147884, -4.144891, 1, 1, 1, 1, 1,
-0.2309678, -0.1839433, -1.136723, 1, 1, 1, 1, 1,
-0.2298489, -1.09679, -2.501463, 1, 1, 1, 1, 1,
-0.2242821, 0.1138523, -0.6418429, 1, 1, 1, 1, 1,
-0.2173728, 0.1090764, -2.38594, 1, 1, 1, 1, 1,
-0.2155922, -0.6110313, -1.976203, 1, 1, 1, 1, 1,
-0.214159, 0.7330626, 0.6332943, 1, 1, 1, 1, 1,
-0.2103822, -1.95555, -2.479853, 1, 1, 1, 1, 1,
-0.208689, -0.5073304, -2.244801, 1, 1, 1, 1, 1,
-0.2073151, -1.046532, -4.579235, 1, 1, 1, 1, 1,
-0.2070237, -1.285467, -4.32738, 1, 1, 1, 1, 1,
-0.2057512, 0.659541, 0.4166636, 1, 1, 1, 1, 1,
-0.205725, 1.675397, -0.8582125, 0, 0, 1, 1, 1,
-0.2049907, -0.05525781, -1.862596, 1, 0, 0, 1, 1,
-0.2047512, 0.4473323, -0.278144, 1, 0, 0, 1, 1,
-0.2011789, -0.496612, -2.796795, 1, 0, 0, 1, 1,
-0.2009612, 0.5101185, 2.387093, 1, 0, 0, 1, 1,
-0.2006222, -0.003470747, -1.731846, 1, 0, 0, 1, 1,
-0.1991266, -0.1933255, -1.062176, 0, 0, 0, 1, 1,
-0.1937355, -0.2400542, -2.280316, 0, 0, 0, 1, 1,
-0.1902333, -0.9254358, -2.429804, 0, 0, 0, 1, 1,
-0.1901583, -0.003059029, -1.429453, 0, 0, 0, 1, 1,
-0.1870498, 0.9288839, 0.2604331, 0, 0, 0, 1, 1,
-0.1855072, 0.9852399, 0.4578113, 0, 0, 0, 1, 1,
-0.1832068, -0.8640764, -2.254763, 0, 0, 0, 1, 1,
-0.1811751, 0.8173162, 0.7654684, 1, 1, 1, 1, 1,
-0.1810984, 1.397353, -1.124723, 1, 1, 1, 1, 1,
-0.1788761, -0.1084528, -3.428737, 1, 1, 1, 1, 1,
-0.1787786, -0.1108523, -2.501628, 1, 1, 1, 1, 1,
-0.1742404, -0.4431392, -3.308274, 1, 1, 1, 1, 1,
-0.1737656, -1.289645, -3.288376, 1, 1, 1, 1, 1,
-0.1730436, 0.7595958, 0.5706003, 1, 1, 1, 1, 1,
-0.1684632, -0.6958297, -4.96426, 1, 1, 1, 1, 1,
-0.1668184, 1.398785, -0.3011793, 1, 1, 1, 1, 1,
-0.1627878, -0.3043462, -2.565959, 1, 1, 1, 1, 1,
-0.1625565, 0.06350607, 0.2690941, 1, 1, 1, 1, 1,
-0.1623284, -0.1991206, -3.217768, 1, 1, 1, 1, 1,
-0.1576385, 0.2082458, -1.280014, 1, 1, 1, 1, 1,
-0.1555303, 1.259168, -1.389882, 1, 1, 1, 1, 1,
-0.1540313, -0.7428855, -3.462683, 1, 1, 1, 1, 1,
-0.1484873, 0.6343117, 0.5377174, 0, 0, 1, 1, 1,
-0.1483571, -0.7725186, -2.082462, 1, 0, 0, 1, 1,
-0.1449247, 0.2897698, -1.821617, 1, 0, 0, 1, 1,
-0.139571, -0.09889512, -2.30092, 1, 0, 0, 1, 1,
-0.1373163, 0.07644188, -1.386413, 1, 0, 0, 1, 1,
-0.1358214, 0.5209501, 0.9520808, 1, 0, 0, 1, 1,
-0.1336943, -1.28388, -3.810461, 0, 0, 0, 1, 1,
-0.1307888, -1.817736, -2.263699, 0, 0, 0, 1, 1,
-0.1273602, 0.1647643, -1.915891, 0, 0, 0, 1, 1,
-0.1266013, -0.6337295, -2.765295, 0, 0, 0, 1, 1,
-0.1265289, -1.093606, -4.478175, 0, 0, 0, 1, 1,
-0.1263142, 1.156339, -0.8125846, 0, 0, 0, 1, 1,
-0.1251746, 0.2660934, -2.494643, 0, 0, 0, 1, 1,
-0.123626, -0.9286178, -3.051377, 1, 1, 1, 1, 1,
-0.1232011, -0.198179, -0.911509, 1, 1, 1, 1, 1,
-0.1230202, 2.415278, 0.04118168, 1, 1, 1, 1, 1,
-0.121465, -1.731462, -3.02031, 1, 1, 1, 1, 1,
-0.1189967, 1.401725, 0.01947788, 1, 1, 1, 1, 1,
-0.1171185, 0.2913839, -0.0898979, 1, 1, 1, 1, 1,
-0.1167114, 1.384943, 0.618191, 1, 1, 1, 1, 1,
-0.1128825, -0.3363887, -2.63304, 1, 1, 1, 1, 1,
-0.1092828, 0.8451433, 0.004605973, 1, 1, 1, 1, 1,
-0.1034686, 0.001964008, -2.354961, 1, 1, 1, 1, 1,
-0.1031989, -0.7926309, -3.174735, 1, 1, 1, 1, 1,
-0.1031073, 0.4456293, -0.5618197, 1, 1, 1, 1, 1,
-0.1026692, 1.624859, -0.3637171, 1, 1, 1, 1, 1,
-0.09739884, 0.874862, 1.689188, 1, 1, 1, 1, 1,
-0.09448977, -0.4709723, -2.821361, 1, 1, 1, 1, 1,
-0.09361126, 0.731865, 0.5501485, 0, 0, 1, 1, 1,
-0.08548165, 1.064608, -1.071619, 1, 0, 0, 1, 1,
-0.0820322, 1.31593, -1.074414, 1, 0, 0, 1, 1,
-0.08123196, 0.1792911, -1.047555, 1, 0, 0, 1, 1,
-0.07910152, 0.01428531, -2.221573, 1, 0, 0, 1, 1,
-0.07893661, 0.5107745, 1.388344, 1, 0, 0, 1, 1,
-0.07873632, -0.4222612, -3.977679, 0, 0, 0, 1, 1,
-0.07826531, -0.04980716, -1.166906, 0, 0, 0, 1, 1,
-0.0782178, -0.252273, -4.255111, 0, 0, 0, 1, 1,
-0.07818294, 0.7967983, 1.210698, 0, 0, 0, 1, 1,
-0.07538973, -0.5744269, -3.863388, 0, 0, 0, 1, 1,
-0.06779931, 0.4416711, 0.06070712, 0, 0, 0, 1, 1,
-0.06492665, 1.436245, -0.6188451, 0, 0, 0, 1, 1,
-0.06297128, 0.02987257, -2.28817, 1, 1, 1, 1, 1,
-0.06128107, -0.4965695, -3.116165, 1, 1, 1, 1, 1,
-0.05562307, 0.6860927, -0.05631293, 1, 1, 1, 1, 1,
-0.04863887, -0.6830149, -4.441926, 1, 1, 1, 1, 1,
-0.04665368, 1.391492, -0.3107192, 1, 1, 1, 1, 1,
-0.04563757, -0.62929, -2.65284, 1, 1, 1, 1, 1,
-0.04474403, 0.6889925, 1.856354, 1, 1, 1, 1, 1,
-0.04069862, -0.4964695, -3.759959, 1, 1, 1, 1, 1,
-0.04060942, -0.4549432, -3.217728, 1, 1, 1, 1, 1,
-0.04024652, 1.274056, -0.146881, 1, 1, 1, 1, 1,
-0.03888369, -0.5196702, -5.032769, 1, 1, 1, 1, 1,
-0.03704617, -0.1670553, -1.609769, 1, 1, 1, 1, 1,
-0.034538, -0.4614415, -2.982585, 1, 1, 1, 1, 1,
-0.0298598, 1.128826, -0.9353219, 1, 1, 1, 1, 1,
-0.02715361, 0.259433, 0.8423141, 1, 1, 1, 1, 1,
-0.02379926, 0.5217713, -0.03280077, 0, 0, 1, 1, 1,
-0.02242426, 0.6628336, -0.7286155, 1, 0, 0, 1, 1,
-0.01602941, -0.7469435, -2.420793, 1, 0, 0, 1, 1,
-0.01343211, -1.065743, -3.599825, 1, 0, 0, 1, 1,
-0.01063408, 0.0945493, -0.5201283, 1, 0, 0, 1, 1,
-0.01009858, -0.1231135, -4.28463, 1, 0, 0, 1, 1,
-0.006276428, 1.998896, -1.036605, 0, 0, 0, 1, 1,
0.006311119, 0.3101385, -0.3124775, 0, 0, 0, 1, 1,
0.01771037, 0.8698387, -1.244861, 0, 0, 0, 1, 1,
0.01832512, 0.495734, -1.325092, 0, 0, 0, 1, 1,
0.01854256, -0.6844225, 3.087681, 0, 0, 0, 1, 1,
0.02440458, -1.708069, 2.748664, 0, 0, 0, 1, 1,
0.02490451, 0.5875201, -0.9356499, 0, 0, 0, 1, 1,
0.02515878, 0.4694308, 0.5798666, 1, 1, 1, 1, 1,
0.02702089, -0.03180621, 2.394417, 1, 1, 1, 1, 1,
0.02865049, 0.9014145, 0.3001964, 1, 1, 1, 1, 1,
0.0308517, 1.136057, -0.0619276, 1, 1, 1, 1, 1,
0.03108829, 0.824292, -0.1010117, 1, 1, 1, 1, 1,
0.03194366, 0.5007512, 0.636867, 1, 1, 1, 1, 1,
0.03261085, -0.2835213, 4.675617, 1, 1, 1, 1, 1,
0.03749242, 1.424314, -1.194212, 1, 1, 1, 1, 1,
0.03835169, -0.426789, 2.560504, 1, 1, 1, 1, 1,
0.04336638, 0.6954998, 0.9168249, 1, 1, 1, 1, 1,
0.04539668, -0.5161526, 3.920835, 1, 1, 1, 1, 1,
0.04645724, -0.2115309, 3.284534, 1, 1, 1, 1, 1,
0.04883079, 0.9718059, 0.3798274, 1, 1, 1, 1, 1,
0.05833393, 1.306865, 0.1236114, 1, 1, 1, 1, 1,
0.0600796, -0.8636487, 3.332346, 1, 1, 1, 1, 1,
0.06551544, -0.3612316, 1.946124, 0, 0, 1, 1, 1,
0.06702797, 0.9596588, -0.9136473, 1, 0, 0, 1, 1,
0.06794676, 0.7716754, -0.3449704, 1, 0, 0, 1, 1,
0.07495086, -2.313207, 1.462249, 1, 0, 0, 1, 1,
0.07562213, -0.8893741, 1.397215, 1, 0, 0, 1, 1,
0.07854319, 0.7659566, 0.6769096, 1, 0, 0, 1, 1,
0.08079091, -0.3088225, 4.357372, 0, 0, 0, 1, 1,
0.08828584, -0.1682084, 1.491858, 0, 0, 0, 1, 1,
0.09022951, 1.469275, -0.4624248, 0, 0, 0, 1, 1,
0.09189125, 1.468825, -1.652654, 0, 0, 0, 1, 1,
0.09612558, -1.319522, 2.116848, 0, 0, 0, 1, 1,
0.09687693, -1.249793, 0.8902107, 0, 0, 0, 1, 1,
0.09724899, -2.053453, 4.090059, 0, 0, 0, 1, 1,
0.1000526, -1.083147, 2.029687, 1, 1, 1, 1, 1,
0.1011436, -0.6841317, 3.614754, 1, 1, 1, 1, 1,
0.1038575, 0.1044843, -0.4435342, 1, 1, 1, 1, 1,
0.1049627, 0.1707127, 2.815001, 1, 1, 1, 1, 1,
0.1095788, -1.890466, 2.305238, 1, 1, 1, 1, 1,
0.1105989, -1.135349, 4.30819, 1, 1, 1, 1, 1,
0.1124887, 2.236529, 1.755004, 1, 1, 1, 1, 1,
0.1134105, -0.7954644, 4.284961, 1, 1, 1, 1, 1,
0.1136128, 0.2320273, 0.8686724, 1, 1, 1, 1, 1,
0.1137174, 0.5160339, -0.2700813, 1, 1, 1, 1, 1,
0.1137264, 0.1909878, 1.178909, 1, 1, 1, 1, 1,
0.1157164, 1.036177, -0.9232972, 1, 1, 1, 1, 1,
0.1205796, -0.8571069, 2.196956, 1, 1, 1, 1, 1,
0.1254797, -1.245496, 4.933033, 1, 1, 1, 1, 1,
0.1313607, -1.301084, 2.216326, 1, 1, 1, 1, 1,
0.1318353, -1.305304, 2.788835, 0, 0, 1, 1, 1,
0.1365254, 1.803814, 2.411654, 1, 0, 0, 1, 1,
0.1397779, -0.4298702, 2.063773, 1, 0, 0, 1, 1,
0.1400499, 0.7393793, 1.067969, 1, 0, 0, 1, 1,
0.1409407, 2.074185, 1.114112, 1, 0, 0, 1, 1,
0.1466435, 0.554154, -0.83922, 1, 0, 0, 1, 1,
0.1466442, 0.02488663, -0.9542888, 0, 0, 0, 1, 1,
0.1486899, 0.4114097, 1.534636, 0, 0, 0, 1, 1,
0.1490805, 0.3707487, -1.087629, 0, 0, 0, 1, 1,
0.1532103, -0.1544338, -0.1106598, 0, 0, 0, 1, 1,
0.1533144, -0.01435333, 0.1457937, 0, 0, 0, 1, 1,
0.153936, -0.3834893, 3.777101, 0, 0, 0, 1, 1,
0.1590192, 1.537196, -0.09082566, 0, 0, 0, 1, 1,
0.1607846, -0.1250658, 2.035434, 1, 1, 1, 1, 1,
0.1629211, 1.389472, 0.3055353, 1, 1, 1, 1, 1,
0.1646761, 0.5059177, -0.5996331, 1, 1, 1, 1, 1,
0.1655608, -2.807406, 3.1541, 1, 1, 1, 1, 1,
0.1669521, -0.6324024, 2.755285, 1, 1, 1, 1, 1,
0.1694143, -1.644845, 3.316712, 1, 1, 1, 1, 1,
0.1736877, 0.1742492, 1.22695, 1, 1, 1, 1, 1,
0.175881, -1.331258, 4.320437, 1, 1, 1, 1, 1,
0.1771621, -0.9423606, 2.273487, 1, 1, 1, 1, 1,
0.1846689, -0.4032551, 1.287164, 1, 1, 1, 1, 1,
0.1855291, 0.5339394, -0.02004657, 1, 1, 1, 1, 1,
0.1858847, -0.4605645, 3.220079, 1, 1, 1, 1, 1,
0.1860162, 1.79577, -0.2252778, 1, 1, 1, 1, 1,
0.1925356, -0.7674598, 1.757904, 1, 1, 1, 1, 1,
0.1935732, 1.911757, 0.7811108, 1, 1, 1, 1, 1,
0.1938803, 0.5672154, -0.3205663, 0, 0, 1, 1, 1,
0.1952237, -0.01194809, 0.5101257, 1, 0, 0, 1, 1,
0.2009717, 0.008015244, 2.533566, 1, 0, 0, 1, 1,
0.2033502, 0.628642, -0.1437954, 1, 0, 0, 1, 1,
0.2050215, -0.8197145, 4.99555, 1, 0, 0, 1, 1,
0.2061568, -1.047521, 3.316244, 1, 0, 0, 1, 1,
0.2092568, 0.01130491, 2.008892, 0, 0, 0, 1, 1,
0.2092832, 1.180369, -1.778751, 0, 0, 0, 1, 1,
0.2132788, 1.151553, 2.691401, 0, 0, 0, 1, 1,
0.214332, -0.6490052, 4.620233, 0, 0, 0, 1, 1,
0.218926, -0.3307423, 1.725476, 0, 0, 0, 1, 1,
0.2194207, 0.5644315, 1.217874, 0, 0, 0, 1, 1,
0.2211269, -0.1340439, 3.058222, 0, 0, 0, 1, 1,
0.2258982, -0.1197537, 1.431901, 1, 1, 1, 1, 1,
0.22632, -0.9659908, 1.014551, 1, 1, 1, 1, 1,
0.2276621, -1.253648, 2.761467, 1, 1, 1, 1, 1,
0.2288055, -0.9568737, 2.161445, 1, 1, 1, 1, 1,
0.2299175, -0.7469083, 2.147969, 1, 1, 1, 1, 1,
0.2317316, 1.593975, -0.8313049, 1, 1, 1, 1, 1,
0.2343116, -0.4857616, 3.926027, 1, 1, 1, 1, 1,
0.2363895, -1.54586, 3.690767, 1, 1, 1, 1, 1,
0.2392272, -0.6057805, 3.461051, 1, 1, 1, 1, 1,
0.2394596, 1.155545, 0.9296401, 1, 1, 1, 1, 1,
0.2405764, 0.4676987, -0.3354241, 1, 1, 1, 1, 1,
0.2406286, 0.3271276, 1.527002, 1, 1, 1, 1, 1,
0.2454571, 0.8294301, 0.4819215, 1, 1, 1, 1, 1,
0.246169, 0.9551831, 0.373162, 1, 1, 1, 1, 1,
0.2464993, 1.590314, 0.5044899, 1, 1, 1, 1, 1,
0.2472924, 0.2913523, 0.6763901, 0, 0, 1, 1, 1,
0.2532262, -1.044397, 2.119584, 1, 0, 0, 1, 1,
0.2544827, 0.273765, -1.421333, 1, 0, 0, 1, 1,
0.2548486, -0.5036848, 2.078312, 1, 0, 0, 1, 1,
0.2557991, -0.1058954, 2.887715, 1, 0, 0, 1, 1,
0.2610714, 0.01956551, 2.358595, 1, 0, 0, 1, 1,
0.2661457, 0.7348729, 0.3545438, 0, 0, 0, 1, 1,
0.2676478, -1.048836, 2.372165, 0, 0, 0, 1, 1,
0.2677162, 0.4334754, 0.4594, 0, 0, 0, 1, 1,
0.2707475, 0.6627563, 2.246782, 0, 0, 0, 1, 1,
0.2756245, 0.1407274, 2.405796, 0, 0, 0, 1, 1,
0.2769147, 0.4754064, 1.264705, 0, 0, 0, 1, 1,
0.2836328, 0.646453, 0.2245489, 0, 0, 0, 1, 1,
0.286202, 0.02299484, 1.408559, 1, 1, 1, 1, 1,
0.2872173, -0.3692299, 2.373884, 1, 1, 1, 1, 1,
0.2881908, -0.7227962, 1.235634, 1, 1, 1, 1, 1,
0.2930752, 1.28026, 0.4308618, 1, 1, 1, 1, 1,
0.294062, 0.3732449, 0.3887677, 1, 1, 1, 1, 1,
0.2942418, -0.9431447, 3.054888, 1, 1, 1, 1, 1,
0.2973626, -0.2870027, 1.219805, 1, 1, 1, 1, 1,
0.2973848, 0.279732, 0.5530939, 1, 1, 1, 1, 1,
0.2973914, 0.3716537, 0.5249905, 1, 1, 1, 1, 1,
0.3012669, 0.6276147, -0.05614739, 1, 1, 1, 1, 1,
0.3031431, 1.085645, -2.454077, 1, 1, 1, 1, 1,
0.3073311, 2.487354, 0.9245586, 1, 1, 1, 1, 1,
0.307488, -0.2625688, 3.654125, 1, 1, 1, 1, 1,
0.3089635, -0.2420067, 2.208547, 1, 1, 1, 1, 1,
0.3124843, -0.4546438, 3.965089, 1, 1, 1, 1, 1,
0.3125168, 0.3136568, 1.124639, 0, 0, 1, 1, 1,
0.3177005, 0.4518846, 1.465807, 1, 0, 0, 1, 1,
0.3243443, -1.422154, 3.470605, 1, 0, 0, 1, 1,
0.3245739, -1.104246, 3.578694, 1, 0, 0, 1, 1,
0.3252176, 0.4438793, 0.7187866, 1, 0, 0, 1, 1,
0.3284281, -0.650031, 4.889833, 1, 0, 0, 1, 1,
0.3295757, -1.063331, 3.495169, 0, 0, 0, 1, 1,
0.338714, -1.610804, 1.872673, 0, 0, 0, 1, 1,
0.3409255, 0.2090458, 0.1955049, 0, 0, 0, 1, 1,
0.3453477, 0.1987637, 1.451144, 0, 0, 0, 1, 1,
0.3458132, -0.8301371, 2.81217, 0, 0, 0, 1, 1,
0.3539354, -1.222644, 1.962107, 0, 0, 0, 1, 1,
0.3545966, 0.05301273, 2.552668, 0, 0, 0, 1, 1,
0.3582901, 0.2581293, -1.185144, 1, 1, 1, 1, 1,
0.3585525, -0.4738617, 1.133016, 1, 1, 1, 1, 1,
0.3610906, -0.7815998, 2.654841, 1, 1, 1, 1, 1,
0.3652124, 0.4363966, -0.1047536, 1, 1, 1, 1, 1,
0.3668987, 0.5428893, -0.6316909, 1, 1, 1, 1, 1,
0.3686027, 0.272986, 0.2598507, 1, 1, 1, 1, 1,
0.3706923, 1.28603, 0.2247378, 1, 1, 1, 1, 1,
0.3727223, -0.02872153, 2.340773, 1, 1, 1, 1, 1,
0.3735544, 0.700952, 1.657848, 1, 1, 1, 1, 1,
0.3744543, -0.5721366, 3.380228, 1, 1, 1, 1, 1,
0.3754607, 2.558309, 0.2902123, 1, 1, 1, 1, 1,
0.3763348, -1.072008, 2.832522, 1, 1, 1, 1, 1,
0.3834836, 0.8299569, 1.056627, 1, 1, 1, 1, 1,
0.3836679, -0.2201007, 1.683706, 1, 1, 1, 1, 1,
0.3858549, -0.6740749, 0.9942622, 1, 1, 1, 1, 1,
0.3947035, -0.2853129, 0.9981533, 0, 0, 1, 1, 1,
0.395796, -2.541177, 3.369159, 1, 0, 0, 1, 1,
0.4000743, 0.9514243, -0.1001104, 1, 0, 0, 1, 1,
0.4081955, -0.6553515, 4.554904, 1, 0, 0, 1, 1,
0.4082809, -1.130336, 2.235325, 1, 0, 0, 1, 1,
0.4084452, 0.4954336, 1.713474, 1, 0, 0, 1, 1,
0.4142089, 0.9190061, 1.629368, 0, 0, 0, 1, 1,
0.4177029, 0.9832398, 0.9494148, 0, 0, 0, 1, 1,
0.4315381, 0.4690582, 0.007348966, 0, 0, 0, 1, 1,
0.433713, 0.3102482, 0.9257683, 0, 0, 0, 1, 1,
0.4347365, -2.461933, 2.846952, 0, 0, 0, 1, 1,
0.4372481, 0.8064979, -2.35283, 0, 0, 0, 1, 1,
0.4373529, 0.3093136, 0.91292, 0, 0, 0, 1, 1,
0.4434158, -0.6938158, 2.676798, 1, 1, 1, 1, 1,
0.4454629, 1.467588, -0.907675, 1, 1, 1, 1, 1,
0.4567438, 2.160035, 1.396109, 1, 1, 1, 1, 1,
0.4666, -0.6113889, 2.859046, 1, 1, 1, 1, 1,
0.4687205, 0.004033448, 3.310502, 1, 1, 1, 1, 1,
0.4691974, 0.2960209, -0.05151692, 1, 1, 1, 1, 1,
0.4710333, 0.3910157, 1.466063, 1, 1, 1, 1, 1,
0.4746227, 0.4407625, 1.105788, 1, 1, 1, 1, 1,
0.4885127, 0.435791, -0.4026803, 1, 1, 1, 1, 1,
0.4916116, -0.1794093, 2.152382, 1, 1, 1, 1, 1,
0.4942311, 1.006751, 2.402074, 1, 1, 1, 1, 1,
0.498935, 0.9531338, 0.452669, 1, 1, 1, 1, 1,
0.4999051, 0.720834, 2.869946, 1, 1, 1, 1, 1,
0.5007067, -0.9485129, 4.562779, 1, 1, 1, 1, 1,
0.5132184, 0.408881, 0.21111, 1, 1, 1, 1, 1,
0.5162545, -1.319837, 3.240569, 0, 0, 1, 1, 1,
0.5193184, 2.030821, -1.48946, 1, 0, 0, 1, 1,
0.5200189, -0.4881988, 3.221958, 1, 0, 0, 1, 1,
0.5237223, -0.02849108, 1.186702, 1, 0, 0, 1, 1,
0.5265377, 1.365722, 1.492423, 1, 0, 0, 1, 1,
0.530425, 1.274912, 0.3561863, 1, 0, 0, 1, 1,
0.5308082, 0.2415966, 1.503732, 0, 0, 0, 1, 1,
0.532615, 0.2883553, 1.097615, 0, 0, 0, 1, 1,
0.533387, -0.7313504, 0.5975015, 0, 0, 0, 1, 1,
0.5337628, 0.5498657, 0.4187613, 0, 0, 0, 1, 1,
0.5353512, 0.7185277, -1.577578, 0, 0, 0, 1, 1,
0.5382744, 0.4603111, -1.107415, 0, 0, 0, 1, 1,
0.54198, 1.199221, 0.7872973, 0, 0, 0, 1, 1,
0.5442412, -0.1062016, 0.9187744, 1, 1, 1, 1, 1,
0.5443355, 2.457727, 1.270143, 1, 1, 1, 1, 1,
0.5472018, 0.04801952, 1.435984, 1, 1, 1, 1, 1,
0.5506566, 0.360532, 1.821061, 1, 1, 1, 1, 1,
0.5528793, 0.7990838, 0.2243715, 1, 1, 1, 1, 1,
0.5535135, 1.000627, 1.549999, 1, 1, 1, 1, 1,
0.5670567, 0.4666207, 2.673068, 1, 1, 1, 1, 1,
0.5707038, -0.1083608, 0.372967, 1, 1, 1, 1, 1,
0.5719872, 0.6087254, 0.932803, 1, 1, 1, 1, 1,
0.5757802, -1.585355, 3.38667, 1, 1, 1, 1, 1,
0.5759627, 0.3190426, -0.4373498, 1, 1, 1, 1, 1,
0.5781577, -0.4452136, 1.524049, 1, 1, 1, 1, 1,
0.5832603, -2.139096, 3.012231, 1, 1, 1, 1, 1,
0.5852075, 1.015395, 2.190039, 1, 1, 1, 1, 1,
0.5886012, -1.679317, 1.884512, 1, 1, 1, 1, 1,
0.5895309, -0.2461024, 1.834239, 0, 0, 1, 1, 1,
0.599622, -1.081674, 3.077934, 1, 0, 0, 1, 1,
0.607263, -0.8563448, 2.321666, 1, 0, 0, 1, 1,
0.6083736, -1.491737, 4.378179, 1, 0, 0, 1, 1,
0.6089062, 0.04539806, 0.7974916, 1, 0, 0, 1, 1,
0.6162556, -0.2634013, 2.711287, 1, 0, 0, 1, 1,
0.6163604, -0.7027858, 2.807775, 0, 0, 0, 1, 1,
0.6182215, 0.9008569, 1.178371, 0, 0, 0, 1, 1,
0.6182944, 0.2922947, 1.532078, 0, 0, 0, 1, 1,
0.6191202, -0.9015181, 3.312604, 0, 0, 0, 1, 1,
0.6203189, -0.9313225, 2.514979, 0, 0, 0, 1, 1,
0.6281173, 0.554823, 0.7987081, 0, 0, 0, 1, 1,
0.6398251, -1.11727, 2.37166, 0, 0, 0, 1, 1,
0.6409957, -0.6258829, 1.633195, 1, 1, 1, 1, 1,
0.6420615, 0.6815919, 0.8229334, 1, 1, 1, 1, 1,
0.6437984, 0.02825619, 2.157378, 1, 1, 1, 1, 1,
0.6438234, 1.298797, 0.003659899, 1, 1, 1, 1, 1,
0.6507593, -0.7130213, 3.581263, 1, 1, 1, 1, 1,
0.6514539, 0.777909, 0.8548998, 1, 1, 1, 1, 1,
0.6560924, 0.09221719, 1.940816, 1, 1, 1, 1, 1,
0.6564413, 0.7940313, 1.099293, 1, 1, 1, 1, 1,
0.6565906, 0.1793494, 0.385765, 1, 1, 1, 1, 1,
0.6578866, -0.7852556, 2.25713, 1, 1, 1, 1, 1,
0.660867, -1.660008, 4.10425, 1, 1, 1, 1, 1,
0.6645058, 0.9743503, 1.655834, 1, 1, 1, 1, 1,
0.6731599, 1.502155, -0.004607057, 1, 1, 1, 1, 1,
0.6786601, 1.156039, 0.03675308, 1, 1, 1, 1, 1,
0.6795657, 0.1417062, 0.4994448, 1, 1, 1, 1, 1,
0.6898513, -1.570087, 2.04338, 0, 0, 1, 1, 1,
0.6900545, -1.192863, 5.163311, 1, 0, 0, 1, 1,
0.6940109, 0.04771244, 1.721074, 1, 0, 0, 1, 1,
0.6951562, 0.789703, 0.7617013, 1, 0, 0, 1, 1,
0.6982749, -0.3632912, 2.924332, 1, 0, 0, 1, 1,
0.6985713, 0.01176357, 3.40555, 1, 0, 0, 1, 1,
0.6988051, -0.7907065, 3.106619, 0, 0, 0, 1, 1,
0.7011285, 1.30545, -0.1616839, 0, 0, 0, 1, 1,
0.7027659, -0.7590926, 0.8841226, 0, 0, 0, 1, 1,
0.7041929, 1.777132, 1.259797, 0, 0, 0, 1, 1,
0.7052647, 0.1008019, 3.811716, 0, 0, 0, 1, 1,
0.7056751, 1.067263, 1.227695, 0, 0, 0, 1, 1,
0.7057531, 0.3191043, 0.542349, 0, 0, 0, 1, 1,
0.7163973, -2.566758, 2.440707, 1, 1, 1, 1, 1,
0.7169911, 0.2977653, 1.189382, 1, 1, 1, 1, 1,
0.7170605, 0.08414181, 1.753092, 1, 1, 1, 1, 1,
0.7257932, 0.4813807, 3.002607, 1, 1, 1, 1, 1,
0.7293204, -0.7693973, 2.630696, 1, 1, 1, 1, 1,
0.7296435, -1.882082, 3.919389, 1, 1, 1, 1, 1,
0.7333264, -0.2184725, 2.257315, 1, 1, 1, 1, 1,
0.7391939, 0.88173, 0.8276919, 1, 1, 1, 1, 1,
0.7395041, -1.445047, 2.902375, 1, 1, 1, 1, 1,
0.7408994, 0.2970265, 1.108413, 1, 1, 1, 1, 1,
0.7490484, 1.084447, 0.02425385, 1, 1, 1, 1, 1,
0.7533137, 0.5548044, 0.1621484, 1, 1, 1, 1, 1,
0.7669926, -0.3128898, 4.541971, 1, 1, 1, 1, 1,
0.7678118, 0.128631, 4.156887, 1, 1, 1, 1, 1,
0.7694592, -0.6336705, 1.980245, 1, 1, 1, 1, 1,
0.7754883, -0.6719502, 4.652895, 0, 0, 1, 1, 1,
0.7764753, 0.02284156, 0.9709374, 1, 0, 0, 1, 1,
0.7780907, 0.87714, 0.3932788, 1, 0, 0, 1, 1,
0.7836689, -0.1812095, 1.380899, 1, 0, 0, 1, 1,
0.7858583, 0.3074026, 1.181898, 1, 0, 0, 1, 1,
0.7933891, 0.3154335, 0.5791473, 1, 0, 0, 1, 1,
0.7980639, -1.084014, 3.333508, 0, 0, 0, 1, 1,
0.804567, -0.06286738, 0.974273, 0, 0, 0, 1, 1,
0.8074416, 1.756761, 1.258936, 0, 0, 0, 1, 1,
0.8083119, 1.718559, 0.2171258, 0, 0, 0, 1, 1,
0.8140326, -0.1476873, 0.4826176, 0, 0, 0, 1, 1,
0.8153012, 1.05581, -1.054143, 0, 0, 0, 1, 1,
0.8215792, -1.009892, 3.343612, 0, 0, 0, 1, 1,
0.833494, -0.6909771, 3.038653, 1, 1, 1, 1, 1,
0.8396404, 0.9330139, 0.4109327, 1, 1, 1, 1, 1,
0.8444712, 0.09391057, 1.457585, 1, 1, 1, 1, 1,
0.8581991, -0.6994588, 2.745505, 1, 1, 1, 1, 1,
0.8840831, -0.1270821, 1.80911, 1, 1, 1, 1, 1,
0.8913231, 0.7894548, 0.663673, 1, 1, 1, 1, 1,
0.8915029, 0.04130719, 1.487191, 1, 1, 1, 1, 1,
0.8928049, 2.11024, -0.5130456, 1, 1, 1, 1, 1,
0.8929922, 0.9801852, 0.7708293, 1, 1, 1, 1, 1,
0.9034533, 0.02970991, 1.28624, 1, 1, 1, 1, 1,
0.9140138, -1.853612, 2.613494, 1, 1, 1, 1, 1,
0.919944, -1.056205, 1.819667, 1, 1, 1, 1, 1,
0.9236106, -1.10402, 2.46861, 1, 1, 1, 1, 1,
0.9313343, 1.525774, 0.2001166, 1, 1, 1, 1, 1,
0.9420456, -0.2033642, 1.5609, 1, 1, 1, 1, 1,
0.9428259, 1.31096, 0.06144786, 0, 0, 1, 1, 1,
0.9462938, -0.1946415, 2.032325, 1, 0, 0, 1, 1,
0.9521899, -0.790929, 1.720096, 1, 0, 0, 1, 1,
0.9543022, -0.2236661, -1.230203, 1, 0, 0, 1, 1,
0.9605661, 0.953063, 1.646826, 1, 0, 0, 1, 1,
0.9613681, 1.961959, 0.6456226, 1, 0, 0, 1, 1,
0.9629493, 0.5132142, -0.2731234, 0, 0, 0, 1, 1,
0.9629869, -0.6382782, 2.632026, 0, 0, 0, 1, 1,
0.9645197, -0.2696187, 3.390674, 0, 0, 0, 1, 1,
0.9667392, 1.101808, -0.5846615, 0, 0, 0, 1, 1,
0.9678153, -0.3600625, 2.122747, 0, 0, 0, 1, 1,
0.9678381, 0.9000061, 0.3440275, 0, 0, 0, 1, 1,
0.9736794, -0.9688882, 2.026818, 0, 0, 0, 1, 1,
0.9819376, -0.1880151, 0.3904731, 1, 1, 1, 1, 1,
0.9831724, 0.8944346, 2.926089, 1, 1, 1, 1, 1,
0.9877876, -0.652732, 2.80521, 1, 1, 1, 1, 1,
0.9908277, 0.3071163, 1.162057, 1, 1, 1, 1, 1,
0.993451, 0.06953635, 1.418535, 1, 1, 1, 1, 1,
0.9953514, 0.06755715, 1.899873, 1, 1, 1, 1, 1,
0.9971587, -0.2862721, 3.484426, 1, 1, 1, 1, 1,
1.004562, 0.4381773, 1.786768, 1, 1, 1, 1, 1,
1.010786, 0.3940921, 0.9594033, 1, 1, 1, 1, 1,
1.012229, -0.8818109, 1.75059, 1, 1, 1, 1, 1,
1.017414, -0.6272227, 3.130988, 1, 1, 1, 1, 1,
1.018236, 0.2661402, 2.703033, 1, 1, 1, 1, 1,
1.018894, 0.1941243, 2.926628, 1, 1, 1, 1, 1,
1.019562, 0.6617444, 2.336832, 1, 1, 1, 1, 1,
1.021244, 1.841817, 1.293427, 1, 1, 1, 1, 1,
1.02534, -0.4019294, 1.583802, 0, 0, 1, 1, 1,
1.028576, -0.4724221, 0.8638597, 1, 0, 0, 1, 1,
1.031686, -0.7113932, 0.2409874, 1, 0, 0, 1, 1,
1.033129, -1.960018, 2.080891, 1, 0, 0, 1, 1,
1.038345, 0.4165885, 1.293193, 1, 0, 0, 1, 1,
1.042101, -0.6827038, 0.6377271, 1, 0, 0, 1, 1,
1.058511, -1.234304, 0.7306978, 0, 0, 0, 1, 1,
1.06712, -0.4602256, 0.9098156, 0, 0, 0, 1, 1,
1.070751, -0.4184808, 1.629599, 0, 0, 0, 1, 1,
1.075848, -0.02985846, 1.231809, 0, 0, 0, 1, 1,
1.078827, -0.2579225, 2.665834, 0, 0, 0, 1, 1,
1.08157, -1.389005, 2.092871, 0, 0, 0, 1, 1,
1.081931, -0.05453438, 1.300173, 0, 0, 0, 1, 1,
1.088233, 0.1417683, 2.102957, 1, 1, 1, 1, 1,
1.091906, 2.079819, 0.2085101, 1, 1, 1, 1, 1,
1.098902, 0.08482593, 2.786001, 1, 1, 1, 1, 1,
1.102721, -0.1837475, 0.5765972, 1, 1, 1, 1, 1,
1.107068, -0.3975349, 1.973584, 1, 1, 1, 1, 1,
1.110621, -0.1990247, 1.113837, 1, 1, 1, 1, 1,
1.110698, 0.006729994, 0.7102689, 1, 1, 1, 1, 1,
1.116743, 1.587996, -0.3458448, 1, 1, 1, 1, 1,
1.121925, 0.2124685, 0.04854864, 1, 1, 1, 1, 1,
1.125559, -0.5189725, 1.957883, 1, 1, 1, 1, 1,
1.134622, 0.1305016, 1.010935, 1, 1, 1, 1, 1,
1.135994, 1.279974, 2.5367, 1, 1, 1, 1, 1,
1.1597, 0.05329958, 1.534926, 1, 1, 1, 1, 1,
1.161635, -0.03253548, 2.410157, 1, 1, 1, 1, 1,
1.16581, 0.6771104, 0.3264889, 1, 1, 1, 1, 1,
1.166345, -0.7282676, 1.285024, 0, 0, 1, 1, 1,
1.168079, -0.04550324, 0.9912083, 1, 0, 0, 1, 1,
1.176794, 1.784752, -0.4030695, 1, 0, 0, 1, 1,
1.177305, 1.550405, 1.180173, 1, 0, 0, 1, 1,
1.17831, 0.3997695, 2.186158, 1, 0, 0, 1, 1,
1.179986, 0.1852336, 1.617969, 1, 0, 0, 1, 1,
1.180993, 0.3162439, 2.117908, 0, 0, 0, 1, 1,
1.187634, 0.4331526, 1.413244, 0, 0, 0, 1, 1,
1.199541, 0.9664332, 0.8984534, 0, 0, 0, 1, 1,
1.200914, 0.1111074, -0.282984, 0, 0, 0, 1, 1,
1.20216, 0.3386481, 1.253686, 0, 0, 0, 1, 1,
1.207608, 0.03101718, 2.431021, 0, 0, 0, 1, 1,
1.212147, 1.484955, 0.2360408, 0, 0, 0, 1, 1,
1.21492, 0.9355801, -0.257775, 1, 1, 1, 1, 1,
1.215147, 1.319157, 0.6174531, 1, 1, 1, 1, 1,
1.215586, -0.5312585, 2.08547, 1, 1, 1, 1, 1,
1.223287, 0.05389142, 1.797054, 1, 1, 1, 1, 1,
1.229101, -0.2519141, 2.291945, 1, 1, 1, 1, 1,
1.23779, 0.5576857, 2.798315, 1, 1, 1, 1, 1,
1.246142, 0.3690484, 2.366355, 1, 1, 1, 1, 1,
1.249819, 1.276562, 1.953187, 1, 1, 1, 1, 1,
1.258838, 0.6644872, 0.2376302, 1, 1, 1, 1, 1,
1.267076, 0.2999419, 1.777599, 1, 1, 1, 1, 1,
1.269154, -0.2882459, 1.803613, 1, 1, 1, 1, 1,
1.278409, 2.031904, 0.9389504, 1, 1, 1, 1, 1,
1.285434, -0.5411555, 2.607153, 1, 1, 1, 1, 1,
1.287968, -0.7444205, 2.531498, 1, 1, 1, 1, 1,
1.291945, -0.1692818, -0.9995666, 1, 1, 1, 1, 1,
1.298887, 0.4226828, 0.9124193, 0, 0, 1, 1, 1,
1.301816, 0.2468688, 0.6466853, 1, 0, 0, 1, 1,
1.30854, -2.809954, 1.705516, 1, 0, 0, 1, 1,
1.318059, -0.7635794, 2.576939, 1, 0, 0, 1, 1,
1.325704, -1.473592, 2.375346, 1, 0, 0, 1, 1,
1.3278, 1.779117, 0.6661819, 1, 0, 0, 1, 1,
1.348981, -0.6714538, 1.659581, 0, 0, 0, 1, 1,
1.349726, 0.8222544, 1.021551, 0, 0, 0, 1, 1,
1.349917, 0.9587181, 4.168118, 0, 0, 0, 1, 1,
1.352397, -0.4307921, 1.686326, 0, 0, 0, 1, 1,
1.366115, 1.093796, 1.805893, 0, 0, 0, 1, 1,
1.366557, -0.9165499, 1.937164, 0, 0, 0, 1, 1,
1.367739, 0.837835, 1.814563, 0, 0, 0, 1, 1,
1.369526, 1.932106, 2.426125, 1, 1, 1, 1, 1,
1.371805, -1.233057, 3.013183, 1, 1, 1, 1, 1,
1.390851, -0.2063933, 1.159323, 1, 1, 1, 1, 1,
1.395821, -0.4541532, 1.70174, 1, 1, 1, 1, 1,
1.404996, 0.2276554, 2.158326, 1, 1, 1, 1, 1,
1.411155, 0.02126763, 1.393809, 1, 1, 1, 1, 1,
1.413445, -1.164904, 3.385325, 1, 1, 1, 1, 1,
1.415383, 0.5233907, 0.9812537, 1, 1, 1, 1, 1,
1.420576, 0.6130238, 0.02692226, 1, 1, 1, 1, 1,
1.425067, -0.5502216, 1.418324, 1, 1, 1, 1, 1,
1.434653, 1.4613, 0.6342505, 1, 1, 1, 1, 1,
1.441131, -2.546792, 3.014453, 1, 1, 1, 1, 1,
1.445367, 0.7092266, 1.511247, 1, 1, 1, 1, 1,
1.446152, 0.4076941, 1.212562, 1, 1, 1, 1, 1,
1.456008, 2.232384, 0.3686273, 1, 1, 1, 1, 1,
1.459363, 1.238161, 0.569768, 0, 0, 1, 1, 1,
1.465983, 1.765277, -0.9911521, 1, 0, 0, 1, 1,
1.487239, 0.5558742, 1.971073, 1, 0, 0, 1, 1,
1.493176, -2.337295, 0.905675, 1, 0, 0, 1, 1,
1.493281, 0.6276327, 0.8960205, 1, 0, 0, 1, 1,
1.503245, 0.2842537, 3.076911, 1, 0, 0, 1, 1,
1.504825, 0.05955185, 2.096138, 0, 0, 0, 1, 1,
1.511809, 1.64453, 0.8651554, 0, 0, 0, 1, 1,
1.51368, 1.29865, 0.4633612, 0, 0, 0, 1, 1,
1.514974, -0.217955, 2.804489, 0, 0, 0, 1, 1,
1.518919, -1.062428, 2.06733, 0, 0, 0, 1, 1,
1.52696, 1.304924, 1.934315, 0, 0, 0, 1, 1,
1.554485, -0.2958016, 1.860437, 0, 0, 0, 1, 1,
1.573665, 1.486974, -0.3412738, 1, 1, 1, 1, 1,
1.581032, 1.060022, 1.121379, 1, 1, 1, 1, 1,
1.596846, 0.6347319, 0.9115332, 1, 1, 1, 1, 1,
1.604508, 0.3336576, 1.804787, 1, 1, 1, 1, 1,
1.609303, -0.9374852, 1.308338, 1, 1, 1, 1, 1,
1.628619, -0.393539, 0.6482147, 1, 1, 1, 1, 1,
1.639706, 0.844322, -0.4412711, 1, 1, 1, 1, 1,
1.647434, -1.896209, 2.180033, 1, 1, 1, 1, 1,
1.650358, 1.11463, 1.442363, 1, 1, 1, 1, 1,
1.652157, 0.3841388, 0.0105158, 1, 1, 1, 1, 1,
1.658558, 2.829892, 0.182396, 1, 1, 1, 1, 1,
1.672323, -0.5220846, 1.94641, 1, 1, 1, 1, 1,
1.674829, -1.125189, 1.305134, 1, 1, 1, 1, 1,
1.696995, 1.619394, 1.524863, 1, 1, 1, 1, 1,
1.706618, 0.286314, 1.010145, 1, 1, 1, 1, 1,
1.708132, -0.4345613, 2.40861, 0, 0, 1, 1, 1,
1.712216, 0.39972, 1.685098, 1, 0, 0, 1, 1,
1.716643, -0.6918346, 1.43117, 1, 0, 0, 1, 1,
1.723128, -1.4496, 2.922501, 1, 0, 0, 1, 1,
1.731386, 1.46944, 1.017767, 1, 0, 0, 1, 1,
1.758058, -0.9701865, 1.225114, 1, 0, 0, 1, 1,
1.790469, 0.7434932, 0.02652807, 0, 0, 0, 1, 1,
1.799246, 0.5182887, 1.972657, 0, 0, 0, 1, 1,
1.801685, 0.8340304, 0.3399994, 0, 0, 0, 1, 1,
1.822631, -0.1930924, 0.05778543, 0, 0, 0, 1, 1,
1.836671, 0.6195905, 2.24308, 0, 0, 0, 1, 1,
1.844097, -1.73943, 2.17579, 0, 0, 0, 1, 1,
1.84637, 1.081274, 2.565412, 0, 0, 0, 1, 1,
1.851641, -1.405615, 3.179218, 1, 1, 1, 1, 1,
1.890015, 0.9113677, 2.186922, 1, 1, 1, 1, 1,
1.903394, 0.6186308, 2.411394, 1, 1, 1, 1, 1,
1.915163, -0.2653921, 2.612705, 1, 1, 1, 1, 1,
1.92078, -0.1657795, 1.821021, 1, 1, 1, 1, 1,
1.926056, -0.6490138, 0.2741157, 1, 1, 1, 1, 1,
1.935398, 0.3119576, 1.18679, 1, 1, 1, 1, 1,
1.939548, 0.4610219, 1.378408, 1, 1, 1, 1, 1,
1.945982, -0.5177885, 1.981412, 1, 1, 1, 1, 1,
1.94737, 1.164037, 0.6252069, 1, 1, 1, 1, 1,
1.954821, -0.8798167, 3.543941, 1, 1, 1, 1, 1,
1.990334, 0.03163004, -0.6567979, 1, 1, 1, 1, 1,
2.013442, -1.097091, 2.8592, 1, 1, 1, 1, 1,
2.030982, -1.176072, 4.264505, 1, 1, 1, 1, 1,
2.079489, 0.8770323, 1.642545, 1, 1, 1, 1, 1,
2.08499, -0.3124475, 1.184345, 0, 0, 1, 1, 1,
2.10867, -0.1486231, 2.901037, 1, 0, 0, 1, 1,
2.116285, 0.3547951, 1.278824, 1, 0, 0, 1, 1,
2.139334, -0.497776, 2.329057, 1, 0, 0, 1, 1,
2.166018, 1.19164, -0.7369908, 1, 0, 0, 1, 1,
2.188824, -0.4132263, 0.4522642, 1, 0, 0, 1, 1,
2.225315, -1.605389, 2.964184, 0, 0, 0, 1, 1,
2.246612, 0.5411144, 0.6930674, 0, 0, 0, 1, 1,
2.274124, -1.847992, 2.375221, 0, 0, 0, 1, 1,
2.296026, 0.2553194, 1.653807, 0, 0, 0, 1, 1,
2.336505, -0.8322358, 3.467138, 0, 0, 0, 1, 1,
2.390861, -0.355919, 1.868801, 0, 0, 0, 1, 1,
2.446058, 0.3056552, 1.840634, 0, 0, 0, 1, 1,
2.451337, 0.3438602, 1.212453, 1, 1, 1, 1, 1,
2.501757, 0.2568921, -0.7146924, 1, 1, 1, 1, 1,
2.575755, -0.9343128, 1.130114, 1, 1, 1, 1, 1,
2.607269, -2.126048, 3.076537, 1, 1, 1, 1, 1,
2.68878, -1.57461, 2.288179, 1, 1, 1, 1, 1,
2.929453, -0.5577445, 0.7911905, 1, 1, 1, 1, 1,
3.099055, -0.2687437, 2.735799, 1, 1, 1, 1, 1
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
var radius = 9.428971;
var distance = 33.11885;
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
mvMatrix.translate( -0.01451325, -0.1353147, 0.2575126 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.11885);
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
