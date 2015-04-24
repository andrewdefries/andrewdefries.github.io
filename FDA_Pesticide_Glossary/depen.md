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
-3.075784, 0.01747972, -1.091633, 1, 0, 0, 1,
-2.871215, -0.3042728, -1.765052, 1, 0.007843138, 0, 1,
-2.852354, 1.553243, -0.7610207, 1, 0.01176471, 0, 1,
-2.690609, -1.395519, -1.890098, 1, 0.01960784, 0, 1,
-2.683177, -0.8053056, -2.930888, 1, 0.02352941, 0, 1,
-2.630813, -1.511535, -0.3672539, 1, 0.03137255, 0, 1,
-2.61041, 1.35934, -1.542192, 1, 0.03529412, 0, 1,
-2.471725, 0.07390797, -1.267572, 1, 0.04313726, 0, 1,
-2.392583, -0.5214124, -1.82559, 1, 0.04705882, 0, 1,
-2.365318, 1.013543, 0.4553526, 1, 0.05490196, 0, 1,
-2.362308, -0.6488689, -1.760425, 1, 0.05882353, 0, 1,
-2.346813, -1.095691, -3.192695, 1, 0.06666667, 0, 1,
-2.311932, -0.182511, -0.896304, 1, 0.07058824, 0, 1,
-2.298308, 0.1290489, -1.058266, 1, 0.07843138, 0, 1,
-2.291929, -0.06768022, -0.3259568, 1, 0.08235294, 0, 1,
-2.255208, 0.7350303, -2.3733, 1, 0.09019608, 0, 1,
-2.224556, -3.755015, -2.245063, 1, 0.09411765, 0, 1,
-2.16129, 0.5983939, -0.6746851, 1, 0.1019608, 0, 1,
-2.136167, -0.6934695, -2.236341, 1, 0.1098039, 0, 1,
-2.097013, 2.338331, -1.153879, 1, 0.1137255, 0, 1,
-2.085376, 0.06905296, -1.674736, 1, 0.1215686, 0, 1,
-2.024361, 0.0594537, -1.732148, 1, 0.1254902, 0, 1,
-2.012809, -1.933295, -4.438628, 1, 0.1333333, 0, 1,
-2.008073, 0.3956126, -1.014899, 1, 0.1372549, 0, 1,
-1.98747, -0.7145602, -1.853338, 1, 0.145098, 0, 1,
-1.97206, 0.9192163, -1.108271, 1, 0.1490196, 0, 1,
-1.933481, -2.147345, -3.316377, 1, 0.1568628, 0, 1,
-1.883219, 1.40966, -1.9538, 1, 0.1607843, 0, 1,
-1.854767, -0.4817496, -2.785178, 1, 0.1686275, 0, 1,
-1.850053, -1.531542, -2.616965, 1, 0.172549, 0, 1,
-1.845359, 0.7767311, -2.236145, 1, 0.1803922, 0, 1,
-1.830168, 1.08369, -1.976035, 1, 0.1843137, 0, 1,
-1.815649, 1.544509, -1.327306, 1, 0.1921569, 0, 1,
-1.811883, 0.003257733, -2.269351, 1, 0.1960784, 0, 1,
-1.807892, 2.150857, -1.469511, 1, 0.2039216, 0, 1,
-1.785526, -0.007553276, -0.7681081, 1, 0.2117647, 0, 1,
-1.77347, -0.5434832, 0.6374024, 1, 0.2156863, 0, 1,
-1.770586, 0.1419234, -2.857379, 1, 0.2235294, 0, 1,
-1.766988, 1.230238, -1.120729, 1, 0.227451, 0, 1,
-1.763577, -1.301396, -1.267472, 1, 0.2352941, 0, 1,
-1.75499, -0.7524018, -2.391152, 1, 0.2392157, 0, 1,
-1.751974, -2.042135, -1.46676, 1, 0.2470588, 0, 1,
-1.723604, -1.56397, -2.94081, 1, 0.2509804, 0, 1,
-1.722498, 0.07292112, -0.909573, 1, 0.2588235, 0, 1,
-1.721764, 0.4817791, -0.7031116, 1, 0.2627451, 0, 1,
-1.719419, 1.337713, -1.342762, 1, 0.2705882, 0, 1,
-1.718593, 1.966105, -0.9547621, 1, 0.2745098, 0, 1,
-1.716368, 0.1807047, -1.231599, 1, 0.282353, 0, 1,
-1.716254, 1.494961, -1.330504, 1, 0.2862745, 0, 1,
-1.706051, -1.263582, -2.731469, 1, 0.2941177, 0, 1,
-1.704463, -0.8182596, -0.323947, 1, 0.3019608, 0, 1,
-1.673537, -1.230503, -2.960792, 1, 0.3058824, 0, 1,
-1.664236, 1.224744, 1.191108, 1, 0.3137255, 0, 1,
-1.651711, 0.7186956, -0.9997565, 1, 0.3176471, 0, 1,
-1.640094, -1.198432, -2.393286, 1, 0.3254902, 0, 1,
-1.617858, 0.9923986, -2.399142, 1, 0.3294118, 0, 1,
-1.60974, -0.3465396, -2.10599, 1, 0.3372549, 0, 1,
-1.607704, 0.5656773, -1.937198, 1, 0.3411765, 0, 1,
-1.586318, 2.231203, 0.4622552, 1, 0.3490196, 0, 1,
-1.556647, -1.642479, -3.655899, 1, 0.3529412, 0, 1,
-1.543354, -0.05607685, -2.069218, 1, 0.3607843, 0, 1,
-1.542179, -1.729947, -2.891946, 1, 0.3647059, 0, 1,
-1.541631, -0.01345409, -0.769089, 1, 0.372549, 0, 1,
-1.530105, -0.8363845, -1.286727, 1, 0.3764706, 0, 1,
-1.509104, -1.266243, -2.555435, 1, 0.3843137, 0, 1,
-1.492305, -0.2423756, -1.793335, 1, 0.3882353, 0, 1,
-1.487929, -0.3058248, -1.234862, 1, 0.3960784, 0, 1,
-1.477854, -1.434474, -2.654843, 1, 0.4039216, 0, 1,
-1.457993, -1.691774, -1.362581, 1, 0.4078431, 0, 1,
-1.453191, 0.03519845, -2.363641, 1, 0.4156863, 0, 1,
-1.443622, -0.3702818, -3.183152, 1, 0.4196078, 0, 1,
-1.440402, 0.2047996, -1.529841, 1, 0.427451, 0, 1,
-1.435843, 1.183915, -0.8699202, 1, 0.4313726, 0, 1,
-1.429522, -0.5450633, -0.8178331, 1, 0.4392157, 0, 1,
-1.427678, 1.055304, -0.05361025, 1, 0.4431373, 0, 1,
-1.419662, -0.1073888, -2.666167, 1, 0.4509804, 0, 1,
-1.409075, -0.5091356, -3.672579, 1, 0.454902, 0, 1,
-1.406319, 0.3250093, -3.283293, 1, 0.4627451, 0, 1,
-1.396361, -0.3596115, -1.985037, 1, 0.4666667, 0, 1,
-1.3946, -0.3277161, -2.049202, 1, 0.4745098, 0, 1,
-1.356345, -0.7120489, -1.666851, 1, 0.4784314, 0, 1,
-1.35576, 1.72375, -0.6746114, 1, 0.4862745, 0, 1,
-1.346692, 0.5381359, -0.7348348, 1, 0.4901961, 0, 1,
-1.346612, -0.3310897, -0.3632341, 1, 0.4980392, 0, 1,
-1.33285, -0.136181, -1.831909, 1, 0.5058824, 0, 1,
-1.326965, -0.6798663, -4.428891, 1, 0.509804, 0, 1,
-1.324913, -0.7048839, -0.7712864, 1, 0.5176471, 0, 1,
-1.324435, -0.0148526, -1.406522, 1, 0.5215687, 0, 1,
-1.324147, 0.752687, 0.844026, 1, 0.5294118, 0, 1,
-1.32181, -0.0280728, -1.880738, 1, 0.5333334, 0, 1,
-1.318235, -0.644663, -1.439762, 1, 0.5411765, 0, 1,
-1.313136, -0.5766265, -1.836637, 1, 0.5450981, 0, 1,
-1.288459, -0.6093058, -0.9942212, 1, 0.5529412, 0, 1,
-1.287082, 1.569992, -2.047634, 1, 0.5568628, 0, 1,
-1.286406, -2.058721, -2.891119, 1, 0.5647059, 0, 1,
-1.280052, -1.14364, -3.13816, 1, 0.5686275, 0, 1,
-1.275364, -0.9003077, -3.534514, 1, 0.5764706, 0, 1,
-1.269919, -0.5080318, -2.465009, 1, 0.5803922, 0, 1,
-1.265164, -1.356018, -1.134875, 1, 0.5882353, 0, 1,
-1.261777, 1.385608, -1.699435, 1, 0.5921569, 0, 1,
-1.258497, -0.6110241, -1.295658, 1, 0.6, 0, 1,
-1.254917, -0.3961585, -4.067919, 1, 0.6078432, 0, 1,
-1.253094, -1.138215, -1.814954, 1, 0.6117647, 0, 1,
-1.24121, -1.600765, -2.172837, 1, 0.6196079, 0, 1,
-1.236798, -0.4003491, -0.7376929, 1, 0.6235294, 0, 1,
-1.230616, 0.04408072, -2.185163, 1, 0.6313726, 0, 1,
-1.23052, 0.3498094, -0.9908158, 1, 0.6352941, 0, 1,
-1.229325, 0.4213378, -1.810316, 1, 0.6431373, 0, 1,
-1.216739, -1.608654, -3.329648, 1, 0.6470588, 0, 1,
-1.207566, 0.1059598, -1.399875, 1, 0.654902, 0, 1,
-1.190009, 0.3412405, -1.117875, 1, 0.6588235, 0, 1,
-1.184985, 0.07707994, -2.937726, 1, 0.6666667, 0, 1,
-1.184726, -2.430516, -2.997682, 1, 0.6705883, 0, 1,
-1.17342, -0.4811724, -3.299886, 1, 0.6784314, 0, 1,
-1.166748, -0.1799326, -2.822995, 1, 0.682353, 0, 1,
-1.165322, -0.4254599, -2.683086, 1, 0.6901961, 0, 1,
-1.157333, 0.2015097, 0.5944569, 1, 0.6941177, 0, 1,
-1.148561, -0.3451485, -0.3481957, 1, 0.7019608, 0, 1,
-1.144253, -0.2517233, -2.092413, 1, 0.7098039, 0, 1,
-1.143201, 0.5804742, 0.08793948, 1, 0.7137255, 0, 1,
-1.138699, -1.47488, -2.262612, 1, 0.7215686, 0, 1,
-1.137765, 0.7599123, -1.864505, 1, 0.7254902, 0, 1,
-1.121482, -0.06875468, -1.729344, 1, 0.7333333, 0, 1,
-1.110293, -0.2481703, -1.876817, 1, 0.7372549, 0, 1,
-1.108934, 1.199074, 1.233752, 1, 0.7450981, 0, 1,
-1.105566, -0.07925358, -0.4261778, 1, 0.7490196, 0, 1,
-1.10437, 1.929466, -1.58748, 1, 0.7568628, 0, 1,
-1.09743, -0.09192816, 0.007966612, 1, 0.7607843, 0, 1,
-1.092017, -0.9168326, -1.838684, 1, 0.7686275, 0, 1,
-1.0893, -1.346635, -1.600994, 1, 0.772549, 0, 1,
-1.070606, -1.249601, -1.417139, 1, 0.7803922, 0, 1,
-1.068396, 0.3761015, -0.3616986, 1, 0.7843137, 0, 1,
-1.054354, -1.622583, -2.171753, 1, 0.7921569, 0, 1,
-1.052604, 0.1905277, -0.1778731, 1, 0.7960784, 0, 1,
-1.046845, -0.6936381, -2.596603, 1, 0.8039216, 0, 1,
-1.033734, -0.4082358, -0.5888219, 1, 0.8117647, 0, 1,
-1.03371, 0.8727923, -1.0351, 1, 0.8156863, 0, 1,
-1.030924, -1.939427, -3.338755, 1, 0.8235294, 0, 1,
-1.028059, -1.189939, -4.21486, 1, 0.827451, 0, 1,
-1.025881, -0.6878176, -2.629333, 1, 0.8352941, 0, 1,
-1.025792, -0.8152511, -3.293342, 1, 0.8392157, 0, 1,
-1.020871, -0.8392345, -2.592451, 1, 0.8470588, 0, 1,
-1.011468, 0.2823239, -1.166209, 1, 0.8509804, 0, 1,
-1.008298, 0.4064712, -1.589295, 1, 0.8588235, 0, 1,
-1.00737, 0.6689523, -2.100484, 1, 0.8627451, 0, 1,
-1.003393, 1.06146, -0.9851618, 1, 0.8705882, 0, 1,
-0.9977541, 0.05034817, -0.7524848, 1, 0.8745098, 0, 1,
-0.9971911, -0.9925489, -0.9327798, 1, 0.8823529, 0, 1,
-0.9922973, -0.1018856, -2.670006, 1, 0.8862745, 0, 1,
-0.9742411, 0.3820026, 0.753166, 1, 0.8941177, 0, 1,
-0.9705095, -2.639418, -0.9271616, 1, 0.8980392, 0, 1,
-0.9646194, 0.02454114, -1.828337, 1, 0.9058824, 0, 1,
-0.9612871, -0.8865991, 0.02747031, 1, 0.9137255, 0, 1,
-0.959985, -0.5731776, -2.766021, 1, 0.9176471, 0, 1,
-0.9591511, -0.8293326, -1.957267, 1, 0.9254902, 0, 1,
-0.956129, -2.40919, -4.083498, 1, 0.9294118, 0, 1,
-0.9532072, -0.642655, -3.687618, 1, 0.9372549, 0, 1,
-0.9529409, -0.6053098, -2.030979, 1, 0.9411765, 0, 1,
-0.952394, -1.284669, -2.900711, 1, 0.9490196, 0, 1,
-0.9479277, -0.4325078, -0.9673114, 1, 0.9529412, 0, 1,
-0.9459135, -1.711066, -3.110983, 1, 0.9607843, 0, 1,
-0.9443681, -2.793556, -2.74248, 1, 0.9647059, 0, 1,
-0.9431646, 0.6374699, -1.217511, 1, 0.972549, 0, 1,
-0.9409115, -1.151272, -2.105378, 1, 0.9764706, 0, 1,
-0.9408929, -1.493277, -2.161287, 1, 0.9843137, 0, 1,
-0.9373263, 0.5056104, -0.565895, 1, 0.9882353, 0, 1,
-0.9340125, -1.525361, -2.87485, 1, 0.9960784, 0, 1,
-0.9331556, -0.06833515, -1.165908, 0.9960784, 1, 0, 1,
-0.9309793, -0.3388381, -1.295429, 0.9921569, 1, 0, 1,
-0.9301869, -0.0526475, -1.675673, 0.9843137, 1, 0, 1,
-0.927969, -0.4381621, -2.216684, 0.9803922, 1, 0, 1,
-0.9101116, -0.7020217, -2.449796, 0.972549, 1, 0, 1,
-0.9017172, -1.289472, -2.822626, 0.9686275, 1, 0, 1,
-0.8978393, -0.7597415, -2.806516, 0.9607843, 1, 0, 1,
-0.8942389, -0.3279175, -2.795165, 0.9568627, 1, 0, 1,
-0.8929843, 0.1515829, -3.843536, 0.9490196, 1, 0, 1,
-0.8846831, -0.3788826, -1.433685, 0.945098, 1, 0, 1,
-0.8792285, 0.6513125, -1.384711, 0.9372549, 1, 0, 1,
-0.8791762, -0.2528453, -1.522224, 0.9333333, 1, 0, 1,
-0.875093, -1.520255, -1.928764, 0.9254902, 1, 0, 1,
-0.8709441, 1.064685, -0.9732551, 0.9215686, 1, 0, 1,
-0.8705201, 1.388824, -1.768023, 0.9137255, 1, 0, 1,
-0.8679096, -0.6534415, -4.875683, 0.9098039, 1, 0, 1,
-0.8635346, -0.4350349, -0.979897, 0.9019608, 1, 0, 1,
-0.8632503, -0.1234793, -1.11806, 0.8941177, 1, 0, 1,
-0.8486538, -0.3631555, -2.188514, 0.8901961, 1, 0, 1,
-0.8394157, -2.254105, -3.152469, 0.8823529, 1, 0, 1,
-0.8391767, -0.3324766, -3.572402, 0.8784314, 1, 0, 1,
-0.8313631, 0.6010267, -1.053626, 0.8705882, 1, 0, 1,
-0.8254267, 1.313637, -1.125743, 0.8666667, 1, 0, 1,
-0.8236123, 0.209788, 0.2832823, 0.8588235, 1, 0, 1,
-0.8212416, -0.2892807, -1.78753, 0.854902, 1, 0, 1,
-0.8116555, 0.3539425, -2.150934, 0.8470588, 1, 0, 1,
-0.8107995, 1.516782, -0.6064687, 0.8431373, 1, 0, 1,
-0.8093117, 2.073976, -1.095675, 0.8352941, 1, 0, 1,
-0.8079178, -0.2311233, -3.206566, 0.8313726, 1, 0, 1,
-0.8067028, -0.2993236, -2.913094, 0.8235294, 1, 0, 1,
-0.800151, 0.1573143, -1.711607, 0.8196079, 1, 0, 1,
-0.7990828, 0.2513729, -0.3778156, 0.8117647, 1, 0, 1,
-0.7931703, 0.9904199, 0.1321931, 0.8078431, 1, 0, 1,
-0.7914778, 0.2453884, 0.06253613, 0.8, 1, 0, 1,
-0.7890957, 1.763407, -0.000857366, 0.7921569, 1, 0, 1,
-0.7872818, -0.3271878, -2.606754, 0.7882353, 1, 0, 1,
-0.786302, -1.135246, -1.242485, 0.7803922, 1, 0, 1,
-0.7853762, 0.4219829, -0.9886377, 0.7764706, 1, 0, 1,
-0.784489, -0.3589344, -1.643901, 0.7686275, 1, 0, 1,
-0.7823872, 0.1434481, -1.236098, 0.7647059, 1, 0, 1,
-0.7822236, -0.4474699, -1.835241, 0.7568628, 1, 0, 1,
-0.7811036, 0.4855345, -2.232962, 0.7529412, 1, 0, 1,
-0.7709863, 1.000702, -0.7674774, 0.7450981, 1, 0, 1,
-0.7701907, 1.571583, -0.01262334, 0.7411765, 1, 0, 1,
-0.7688898, 2.057923, 0.2412885, 0.7333333, 1, 0, 1,
-0.7650447, -1.205388, -2.47233, 0.7294118, 1, 0, 1,
-0.7491909, 1.726747, -0.5678304, 0.7215686, 1, 0, 1,
-0.7460077, -0.2777129, -3.669489, 0.7176471, 1, 0, 1,
-0.7457862, 0.6001869, 0.0943997, 0.7098039, 1, 0, 1,
-0.7455812, -1.06794, -4.119277, 0.7058824, 1, 0, 1,
-0.743934, -0.160845, -3.163562, 0.6980392, 1, 0, 1,
-0.7413329, 0.789252, -1.289035, 0.6901961, 1, 0, 1,
-0.7384696, 0.7885233, 0.06270742, 0.6862745, 1, 0, 1,
-0.7361652, -3.206423, -4.577983, 0.6784314, 1, 0, 1,
-0.7334123, -0.636099, -1.312785, 0.6745098, 1, 0, 1,
-0.7286301, -0.03744609, -2.260109, 0.6666667, 1, 0, 1,
-0.727997, -0.4928696, -2.929761, 0.6627451, 1, 0, 1,
-0.7194493, 0.2538734, -1.278168, 0.654902, 1, 0, 1,
-0.7167086, 1.038383, -2.170892, 0.6509804, 1, 0, 1,
-0.7163776, -0.3304229, -4.502637, 0.6431373, 1, 0, 1,
-0.7131666, -1.039282, -2.886244, 0.6392157, 1, 0, 1,
-0.7123026, 0.9287443, -2.176441, 0.6313726, 1, 0, 1,
-0.7116688, 1.113412, -1.057661, 0.627451, 1, 0, 1,
-0.6955337, 0.8555243, -0.3900006, 0.6196079, 1, 0, 1,
-0.6929147, -0.4876395, -2.276804, 0.6156863, 1, 0, 1,
-0.6914735, -0.3553743, -2.131735, 0.6078432, 1, 0, 1,
-0.6901349, -1.255345, -4.088255, 0.6039216, 1, 0, 1,
-0.689661, 0.2326261, -2.682461, 0.5960785, 1, 0, 1,
-0.6879256, 1.533738, 0.2826349, 0.5882353, 1, 0, 1,
-0.6860614, 1.204571, 0.7167682, 0.5843138, 1, 0, 1,
-0.6828981, 1.421845, -0.6223038, 0.5764706, 1, 0, 1,
-0.681448, 0.1177518, -2.186744, 0.572549, 1, 0, 1,
-0.6787322, -0.01554684, -1.587408, 0.5647059, 1, 0, 1,
-0.6762066, 1.970611, -1.562479, 0.5607843, 1, 0, 1,
-0.6733519, -0.1247639, -2.432123, 0.5529412, 1, 0, 1,
-0.6731403, -2.153067, -2.865961, 0.5490196, 1, 0, 1,
-0.6633751, -1.031723, -1.191566, 0.5411765, 1, 0, 1,
-0.6579152, 1.019579, -1.619521, 0.5372549, 1, 0, 1,
-0.6570429, 0.7110717, 0.1588302, 0.5294118, 1, 0, 1,
-0.6568642, -0.6864828, -1.498862, 0.5254902, 1, 0, 1,
-0.6490973, 0.6329184, -1.457026, 0.5176471, 1, 0, 1,
-0.6469567, -0.2090585, -0.6164795, 0.5137255, 1, 0, 1,
-0.6437636, 0.2995349, -0.5698975, 0.5058824, 1, 0, 1,
-0.6373832, -0.822243, -2.584439, 0.5019608, 1, 0, 1,
-0.6354089, 0.7028306, -2.117287, 0.4941176, 1, 0, 1,
-0.6316878, -1.294608, -1.620834, 0.4862745, 1, 0, 1,
-0.6306687, 0.3145988, -0.07691673, 0.4823529, 1, 0, 1,
-0.627912, 0.06374101, -3.202559, 0.4745098, 1, 0, 1,
-0.627389, 0.6591638, -1.54524, 0.4705882, 1, 0, 1,
-0.6262774, 0.1260032, -0.9513646, 0.4627451, 1, 0, 1,
-0.623004, -0.5307704, -1.060264, 0.4588235, 1, 0, 1,
-0.6197845, -1.206358, -1.190261, 0.4509804, 1, 0, 1,
-0.6173829, -2.297977, -3.628114, 0.4470588, 1, 0, 1,
-0.6167136, 0.6709136, -1.621047, 0.4392157, 1, 0, 1,
-0.60956, -3.242223, -3.928333, 0.4352941, 1, 0, 1,
-0.608449, -0.264342, -1.045835, 0.427451, 1, 0, 1,
-0.6076925, -0.3157064, -1.652245, 0.4235294, 1, 0, 1,
-0.6073833, 0.7587345, 0.8912171, 0.4156863, 1, 0, 1,
-0.6045325, 1.677953, 1.330639, 0.4117647, 1, 0, 1,
-0.6031765, 0.9243636, -0.8040864, 0.4039216, 1, 0, 1,
-0.6006075, 0.1197484, -1.075606, 0.3960784, 1, 0, 1,
-0.5984699, 0.6368596, 0.5031609, 0.3921569, 1, 0, 1,
-0.5950927, 2.907484, 1.068405, 0.3843137, 1, 0, 1,
-0.5901394, 0.7163331, 0.07909991, 0.3803922, 1, 0, 1,
-0.5889409, 0.3706729, -0.3453803, 0.372549, 1, 0, 1,
-0.5831067, -0.9603711, -1.318905, 0.3686275, 1, 0, 1,
-0.580321, -0.7826229, -1.959266, 0.3607843, 1, 0, 1,
-0.5784984, 1.27996, 0.5974525, 0.3568628, 1, 0, 1,
-0.5761863, -0.9347774, -2.240359, 0.3490196, 1, 0, 1,
-0.572906, -0.4739868, -2.655581, 0.345098, 1, 0, 1,
-0.5705147, 1.617868, 0.04513831, 0.3372549, 1, 0, 1,
-0.5677475, -0.1411761, -1.864017, 0.3333333, 1, 0, 1,
-0.5675858, -0.06549864, -2.140537, 0.3254902, 1, 0, 1,
-0.5648042, 0.1433045, -1.069937, 0.3215686, 1, 0, 1,
-0.5633715, -0.3334593, -1.533992, 0.3137255, 1, 0, 1,
-0.5626867, 1.526707, -0.7423953, 0.3098039, 1, 0, 1,
-0.5624853, -1.972448, -3.511748, 0.3019608, 1, 0, 1,
-0.5556463, -0.9417597, -1.873579, 0.2941177, 1, 0, 1,
-0.5537242, 0.456268, -0.9351144, 0.2901961, 1, 0, 1,
-0.552391, 0.3645187, -0.9596167, 0.282353, 1, 0, 1,
-0.5487443, -0.02793685, -2.092839, 0.2784314, 1, 0, 1,
-0.548146, 0.4724048, -2.322459, 0.2705882, 1, 0, 1,
-0.5437367, 0.2350063, -2.004953, 0.2666667, 1, 0, 1,
-0.543301, 1.124292, -0.7375013, 0.2588235, 1, 0, 1,
-0.5424033, -0.9877279, -3.745384, 0.254902, 1, 0, 1,
-0.5420333, 1.98627, 0.8761759, 0.2470588, 1, 0, 1,
-0.5350639, 0.7452722, -1.31282, 0.2431373, 1, 0, 1,
-0.5319101, 0.7691693, -0.6981897, 0.2352941, 1, 0, 1,
-0.5313143, 0.03188907, -2.34234, 0.2313726, 1, 0, 1,
-0.5307416, -1.550902, -2.530079, 0.2235294, 1, 0, 1,
-0.52824, -0.3074104, -1.981555, 0.2196078, 1, 0, 1,
-0.5257819, 0.387443, -0.1019062, 0.2117647, 1, 0, 1,
-0.5229055, -0.8391433, -1.194132, 0.2078431, 1, 0, 1,
-0.515393, 0.8213886, -1.37269, 0.2, 1, 0, 1,
-0.5141225, 0.1764841, -1.657627, 0.1921569, 1, 0, 1,
-0.5054926, 0.7938137, 0.1534569, 0.1882353, 1, 0, 1,
-0.5030928, 0.02299928, -1.97637, 0.1803922, 1, 0, 1,
-0.5012977, -1.105121, -4.184793, 0.1764706, 1, 0, 1,
-0.5009471, -0.1320844, -2.065287, 0.1686275, 1, 0, 1,
-0.5008413, 0.05436109, 1.510413, 0.1647059, 1, 0, 1,
-0.4988777, -0.5987715, -2.865461, 0.1568628, 1, 0, 1,
-0.4985318, 0.8834763, -0.7453157, 0.1529412, 1, 0, 1,
-0.4807365, 0.6274714, -0.2632995, 0.145098, 1, 0, 1,
-0.4748143, 0.4566178, -2.089553, 0.1411765, 1, 0, 1,
-0.4745696, -0.20095, -1.396564, 0.1333333, 1, 0, 1,
-0.4733103, 0.2960437, -0.3848505, 0.1294118, 1, 0, 1,
-0.4732904, -0.5508921, -1.334306, 0.1215686, 1, 0, 1,
-0.4660291, 0.2211469, -1.553216, 0.1176471, 1, 0, 1,
-0.4627265, -0.3135062, -1.349286, 0.1098039, 1, 0, 1,
-0.4588516, -1.747476, -3.219417, 0.1058824, 1, 0, 1,
-0.4571471, -2.648252, -3.281065, 0.09803922, 1, 0, 1,
-0.4543661, 0.1559736, -1.137717, 0.09019608, 1, 0, 1,
-0.4523717, -0.09222769, -0.5934149, 0.08627451, 1, 0, 1,
-0.4518845, 2.442918, -0.2112735, 0.07843138, 1, 0, 1,
-0.448603, 0.321042, -1.879814, 0.07450981, 1, 0, 1,
-0.447795, 0.8399629, -0.8192595, 0.06666667, 1, 0, 1,
-0.4472223, 1.261832, -0.4997596, 0.0627451, 1, 0, 1,
-0.446876, -0.6961442, -1.598688, 0.05490196, 1, 0, 1,
-0.445882, -0.3684844, -2.39715, 0.05098039, 1, 0, 1,
-0.4396886, 0.2468468, -2.710639, 0.04313726, 1, 0, 1,
-0.4388168, 0.07284211, -1.534549, 0.03921569, 1, 0, 1,
-0.4388058, 0.1140883, -2.590216, 0.03137255, 1, 0, 1,
-0.437156, -0.1013368, -0.2020479, 0.02745098, 1, 0, 1,
-0.4356404, 0.0251156, -2.252191, 0.01960784, 1, 0, 1,
-0.4351079, 0.1593321, -0.7290351, 0.01568628, 1, 0, 1,
-0.4274822, 0.60453, 1.141076, 0.007843138, 1, 0, 1,
-0.4249856, -1.904643, -1.395476, 0.003921569, 1, 0, 1,
-0.4243672, 0.7142837, -1.525544, 0, 1, 0.003921569, 1,
-0.4204573, 1.148447, -2.130207, 0, 1, 0.01176471, 1,
-0.4185542, 1.203426, -0.1280557, 0, 1, 0.01568628, 1,
-0.4182879, -0.4885359, -4.384494, 0, 1, 0.02352941, 1,
-0.4180743, -0.739486, -2.071684, 0, 1, 0.02745098, 1,
-0.4173706, -0.1943361, -3.498696, 0, 1, 0.03529412, 1,
-0.4170291, -1.097727, -1.475851, 0, 1, 0.03921569, 1,
-0.4154725, 1.264008, -1.277049, 0, 1, 0.04705882, 1,
-0.4106732, 1.085097, 1.030589, 0, 1, 0.05098039, 1,
-0.4082146, 0.9782603, -0.6133976, 0, 1, 0.05882353, 1,
-0.4062847, -0.3873425, -2.42968, 0, 1, 0.0627451, 1,
-0.4047971, -0.8454647, -3.005246, 0, 1, 0.07058824, 1,
-0.404436, 0.8093393, -1.984287, 0, 1, 0.07450981, 1,
-0.4017175, -0.4189442, -2.417733, 0, 1, 0.08235294, 1,
-0.4001105, 0.3779232, -1.331168, 0, 1, 0.08627451, 1,
-0.3994955, 1.722012, -0.05069268, 0, 1, 0.09411765, 1,
-0.3956047, -0.5936052, -3.053987, 0, 1, 0.1019608, 1,
-0.3915656, -1.321729, -2.389675, 0, 1, 0.1058824, 1,
-0.3897552, -0.9027846, -3.196324, 0, 1, 0.1137255, 1,
-0.3888979, 0.6745095, 0.312227, 0, 1, 0.1176471, 1,
-0.3885822, 1.718664, -1.549509, 0, 1, 0.1254902, 1,
-0.3872993, 1.836902, -0.4674281, 0, 1, 0.1294118, 1,
-0.385478, -0.3344593, -1.706294, 0, 1, 0.1372549, 1,
-0.3777107, 0.2430723, 0.07433393, 0, 1, 0.1411765, 1,
-0.3753938, 1.261602, 0.8180286, 0, 1, 0.1490196, 1,
-0.3736752, 0.3205919, -2.584589, 0, 1, 0.1529412, 1,
-0.3734551, 1.989154, 1.1359, 0, 1, 0.1607843, 1,
-0.3724208, 1.563736, -0.1597507, 0, 1, 0.1647059, 1,
-0.3723494, -0.8262698, -1.925277, 0, 1, 0.172549, 1,
-0.3705777, -0.8318458, -3.030152, 0, 1, 0.1764706, 1,
-0.366802, 0.8045981, 0.1722803, 0, 1, 0.1843137, 1,
-0.3582509, 1.024458, 1.018753, 0, 1, 0.1882353, 1,
-0.3572993, 0.2110823, -0.823708, 0, 1, 0.1960784, 1,
-0.3561534, 1.695915, -1.547538, 0, 1, 0.2039216, 1,
-0.3537958, 0.5427641, -0.745346, 0, 1, 0.2078431, 1,
-0.3514966, 0.1688481, -1.109283, 0, 1, 0.2156863, 1,
-0.3512717, -0.4387577, -1.092029, 0, 1, 0.2196078, 1,
-0.348862, 0.2860362, -0.3838925, 0, 1, 0.227451, 1,
-0.3434799, 0.8120453, -1.137207, 0, 1, 0.2313726, 1,
-0.3308315, -2.461555, -2.268919, 0, 1, 0.2392157, 1,
-0.3290165, -0.9210222, -2.382778, 0, 1, 0.2431373, 1,
-0.328008, -0.8085801, -3.430195, 0, 1, 0.2509804, 1,
-0.3187532, -0.6990245, -3.549655, 0, 1, 0.254902, 1,
-0.3158177, 1.812701, 1.313541, 0, 1, 0.2627451, 1,
-0.3139477, -0.328706, -3.356238, 0, 1, 0.2666667, 1,
-0.3135491, 0.1675946, -1.265073, 0, 1, 0.2745098, 1,
-0.3090184, -0.4455642, -1.501129, 0, 1, 0.2784314, 1,
-0.2948005, -2.145944, -3.705146, 0, 1, 0.2862745, 1,
-0.287444, -0.1544293, -3.959078, 0, 1, 0.2901961, 1,
-0.2762368, -0.2992817, -1.685236, 0, 1, 0.2980392, 1,
-0.2679856, -0.1560884, -2.819381, 0, 1, 0.3058824, 1,
-0.2655604, 2.519849, 0.4864234, 0, 1, 0.3098039, 1,
-0.2605718, 1.132066, 0.3678363, 0, 1, 0.3176471, 1,
-0.2567823, 1.030978, -0.7769388, 0, 1, 0.3215686, 1,
-0.2535658, -0.1719421, -2.060603, 0, 1, 0.3294118, 1,
-0.2483394, -0.8758792, -2.4999, 0, 1, 0.3333333, 1,
-0.2473434, -1.791332, -2.59761, 0, 1, 0.3411765, 1,
-0.2444747, -0.3840001, -3.962583, 0, 1, 0.345098, 1,
-0.2429534, -1.161318, -3.709512, 0, 1, 0.3529412, 1,
-0.2407402, 1.654939, -1.357194, 0, 1, 0.3568628, 1,
-0.2403326, 1.94801, 0.4701673, 0, 1, 0.3647059, 1,
-0.2332593, 0.3435175, -1.518434, 0, 1, 0.3686275, 1,
-0.2312866, -0.2383675, -2.259312, 0, 1, 0.3764706, 1,
-0.2312499, 0.152443, -1.532499, 0, 1, 0.3803922, 1,
-0.2298596, 0.1333348, 0.3693322, 0, 1, 0.3882353, 1,
-0.2294077, -0.8930886, -3.287344, 0, 1, 0.3921569, 1,
-0.2284871, -1.588975, -2.7275, 0, 1, 0.4, 1,
-0.2269807, -0.9551125, -2.917057, 0, 1, 0.4078431, 1,
-0.224474, -0.2558236, -2.779049, 0, 1, 0.4117647, 1,
-0.2213394, -0.1382616, -2.266592, 0, 1, 0.4196078, 1,
-0.2212568, -1.070476, -1.876241, 0, 1, 0.4235294, 1,
-0.2134352, 0.8431532, -0.7629237, 0, 1, 0.4313726, 1,
-0.2124105, -0.9532151, -3.007001, 0, 1, 0.4352941, 1,
-0.2105975, -1.92153, -5.591363, 0, 1, 0.4431373, 1,
-0.2087171, -0.7418628, -2.196877, 0, 1, 0.4470588, 1,
-0.2044736, -0.09647669, -2.987639, 0, 1, 0.454902, 1,
-0.2040768, -0.1489569, -3.707505, 0, 1, 0.4588235, 1,
-0.2028978, -0.5646953, -1.949403, 0, 1, 0.4666667, 1,
-0.1990255, -0.5359243, -1.722666, 0, 1, 0.4705882, 1,
-0.1979266, 0.423085, -0.639854, 0, 1, 0.4784314, 1,
-0.1956311, 1.652647, 0.3192086, 0, 1, 0.4823529, 1,
-0.1950711, -0.1898874, -2.214338, 0, 1, 0.4901961, 1,
-0.1934798, 0.3660997, 0.1887831, 0, 1, 0.4941176, 1,
-0.1865835, 1.487512, -0.09183776, 0, 1, 0.5019608, 1,
-0.1810383, 1.480301, -1.291782, 0, 1, 0.509804, 1,
-0.1796809, 1.029754, 0.3224429, 0, 1, 0.5137255, 1,
-0.1714336, 0.0004783423, -2.660662, 0, 1, 0.5215687, 1,
-0.1670024, 0.7435985, -0.4734834, 0, 1, 0.5254902, 1,
-0.1613996, 1.068062, 0.5920728, 0, 1, 0.5333334, 1,
-0.1579144, 0.003125518, 0.09630728, 0, 1, 0.5372549, 1,
-0.1537633, -1.998921, -4.174272, 0, 1, 0.5450981, 1,
-0.1536004, 0.7061998, 0.2096689, 0, 1, 0.5490196, 1,
-0.1398405, 1.611835, -0.5174981, 0, 1, 0.5568628, 1,
-0.1391495, 0.554465, -0.6442981, 0, 1, 0.5607843, 1,
-0.1343068, -0.1546632, -2.223732, 0, 1, 0.5686275, 1,
-0.1325699, 0.2339932, 0.1646773, 0, 1, 0.572549, 1,
-0.1308824, 1.158663, 0.354375, 0, 1, 0.5803922, 1,
-0.1251027, -1.59437, -2.065002, 0, 1, 0.5843138, 1,
-0.1182349, -0.01026572, 0.1887152, 0, 1, 0.5921569, 1,
-0.1131407, 1.876006, -0.09837807, 0, 1, 0.5960785, 1,
-0.1126487, 0.2868846, 0.09805615, 0, 1, 0.6039216, 1,
-0.1119661, 1.471092, 1.121002, 0, 1, 0.6117647, 1,
-0.1109279, -0.8880566, -4.130756, 0, 1, 0.6156863, 1,
-0.1085414, 0.2238702, -1.585096, 0, 1, 0.6235294, 1,
-0.1019743, 0.1750478, 0.8346559, 0, 1, 0.627451, 1,
-0.09671945, 0.3933888, -0.3804319, 0, 1, 0.6352941, 1,
-0.09647085, 0.3635819, -1.649246, 0, 1, 0.6392157, 1,
-0.09285069, -0.265931, -1.848226, 0, 1, 0.6470588, 1,
-0.08824365, -0.1057756, -2.418818, 0, 1, 0.6509804, 1,
-0.08115588, -1.834422, -2.633324, 0, 1, 0.6588235, 1,
-0.07241248, 0.351897, -0.9239208, 0, 1, 0.6627451, 1,
-0.0713015, -0.5831022, -2.512861, 0, 1, 0.6705883, 1,
-0.06062764, -1.024922, -2.699543, 0, 1, 0.6745098, 1,
-0.0562396, -0.8775072, -4.955639, 0, 1, 0.682353, 1,
-0.05570596, 0.6843027, -0.5020223, 0, 1, 0.6862745, 1,
-0.05089529, 0.4710252, -0.2730155, 0, 1, 0.6941177, 1,
-0.04916543, -0.9086984, -0.7475403, 0, 1, 0.7019608, 1,
-0.04756628, 0.9489074, 0.5818776, 0, 1, 0.7058824, 1,
-0.04644577, -0.7552541, -1.938246, 0, 1, 0.7137255, 1,
-0.04472731, 1.86073, -1.081044, 0, 1, 0.7176471, 1,
-0.04355287, -0.5536559, -3.556371, 0, 1, 0.7254902, 1,
-0.04345026, 0.3794604, -2.443621, 0, 1, 0.7294118, 1,
-0.04197079, -1.711189, -4.754233, 0, 1, 0.7372549, 1,
-0.04103854, -1.020075, -3.328555, 0, 1, 0.7411765, 1,
-0.03865914, -0.5426348, -1.701195, 0, 1, 0.7490196, 1,
-0.03557843, -1.494499, -2.458985, 0, 1, 0.7529412, 1,
-0.0332792, -0.3299658, -2.868149, 0, 1, 0.7607843, 1,
-0.03136717, -0.7698095, -3.46464, 0, 1, 0.7647059, 1,
-0.03079615, -1.16633, -2.50033, 0, 1, 0.772549, 1,
-0.03011677, 1.422789, -0.6123716, 0, 1, 0.7764706, 1,
-0.02521281, -1.307823, -1.646271, 0, 1, 0.7843137, 1,
-0.02313749, 0.7402707, 2.310415, 0, 1, 0.7882353, 1,
-0.02281447, 1.657114, 0.9629445, 0, 1, 0.7960784, 1,
-0.02069817, -0.796681, -4.10343, 0, 1, 0.8039216, 1,
-0.02000498, 0.7643986, 1.102583, 0, 1, 0.8078431, 1,
-0.01901511, -0.5783749, -3.539636, 0, 1, 0.8156863, 1,
-0.01620977, 1.196442, -0.2221391, 0, 1, 0.8196079, 1,
-0.01535287, -0.2502397, -2.78082, 0, 1, 0.827451, 1,
-0.01405314, -0.619459, -3.513659, 0, 1, 0.8313726, 1,
-0.01392391, -1.147619, -2.108953, 0, 1, 0.8392157, 1,
-0.01316451, 1.515235, 0.7027453, 0, 1, 0.8431373, 1,
-0.00966658, 1.125065, 1.048168, 0, 1, 0.8509804, 1,
-0.009358151, -2.329222, -3.506223, 0, 1, 0.854902, 1,
-0.003687632, 1.874092, -0.6458564, 0, 1, 0.8627451, 1,
-0.002155857, -0.7444579, -4.95708, 0, 1, 0.8666667, 1,
-0.0009638402, -0.02062354, -2.4554, 0, 1, 0.8745098, 1,
-0.0009524254, -0.5754996, -4.539168, 0, 1, 0.8784314, 1,
0.004773322, -0.1955981, 3.136288, 0, 1, 0.8862745, 1,
0.004857001, 0.6474219, -0.2081818, 0, 1, 0.8901961, 1,
0.005078253, 0.1608664, -0.3476113, 0, 1, 0.8980392, 1,
0.00628539, -0.3359772, 3.013617, 0, 1, 0.9058824, 1,
0.007453073, -0.8363004, 4.302094, 0, 1, 0.9098039, 1,
0.008653339, 0.05181412, -0.3973825, 0, 1, 0.9176471, 1,
0.01034749, 2.176754, -0.8176105, 0, 1, 0.9215686, 1,
0.01176833, 0.6958916, -1.198512, 0, 1, 0.9294118, 1,
0.01818028, 0.7152578, 0.5214038, 0, 1, 0.9333333, 1,
0.02188553, -0.3525445, 4.190333, 0, 1, 0.9411765, 1,
0.02224673, -1.319864, 2.755388, 0, 1, 0.945098, 1,
0.02307383, -0.05983967, 0.8926928, 0, 1, 0.9529412, 1,
0.02712202, 1.421058, -1.049947, 0, 1, 0.9568627, 1,
0.02985213, -0.4848467, 2.720187, 0, 1, 0.9647059, 1,
0.03127608, 1.148537, 0.4299691, 0, 1, 0.9686275, 1,
0.03398487, 0.6910697, 0.237466, 0, 1, 0.9764706, 1,
0.03512171, -0.03463481, 0.601957, 0, 1, 0.9803922, 1,
0.03616425, -1.763581, 3.389464, 0, 1, 0.9882353, 1,
0.03637401, 0.3610032, -0.7519487, 0, 1, 0.9921569, 1,
0.03808954, -1.339227, 3.687662, 0, 1, 1, 1,
0.04805745, 1.154379, 0.2868495, 0, 0.9921569, 1, 1,
0.05151611, -0.4092498, 2.208255, 0, 0.9882353, 1, 1,
0.05205268, 3.023483, 0.5180793, 0, 0.9803922, 1, 1,
0.05253039, 0.4545306, 0.9317776, 0, 0.9764706, 1, 1,
0.05294481, -1.355051, 2.335486, 0, 0.9686275, 1, 1,
0.05476126, 1.793421, -0.429652, 0, 0.9647059, 1, 1,
0.05679158, 0.6098335, 0.7536824, 0, 0.9568627, 1, 1,
0.05681168, 2.47596, -1.474203, 0, 0.9529412, 1, 1,
0.0577282, 0.4335833, -1.646126, 0, 0.945098, 1, 1,
0.05876848, 1.993144, -1.899663, 0, 0.9411765, 1, 1,
0.06527461, -0.2532569, 1.495374, 0, 0.9333333, 1, 1,
0.06775589, -0.84641, 3.402804, 0, 0.9294118, 1, 1,
0.06926531, -0.07149571, 2.963789, 0, 0.9215686, 1, 1,
0.06943335, -0.9928684, 2.635953, 0, 0.9176471, 1, 1,
0.07002801, -0.2901221, 1.853354, 0, 0.9098039, 1, 1,
0.0735928, -1.392129, 3.913723, 0, 0.9058824, 1, 1,
0.07773179, 0.4751146, 1.903263, 0, 0.8980392, 1, 1,
0.08289947, -1.112843, 4.934881, 0, 0.8901961, 1, 1,
0.08338605, 2.650129, -1.550541, 0, 0.8862745, 1, 1,
0.08499885, -0.1223279, 3.363146, 0, 0.8784314, 1, 1,
0.0855825, -0.3411262, 3.066984, 0, 0.8745098, 1, 1,
0.08720812, -0.9857158, 2.211234, 0, 0.8666667, 1, 1,
0.08861612, -1.412197, 3.377475, 0, 0.8627451, 1, 1,
0.09286611, -0.8916587, 3.633919, 0, 0.854902, 1, 1,
0.09394883, -1.129799, 1.926527, 0, 0.8509804, 1, 1,
0.09534946, -0.234284, 1.729924, 0, 0.8431373, 1, 1,
0.09565534, 1.505996, 2.212366, 0, 0.8392157, 1, 1,
0.09622864, -1.713363, 2.794633, 0, 0.8313726, 1, 1,
0.09646582, 0.3246846, 1.49543, 0, 0.827451, 1, 1,
0.1017939, -2.017447, 1.73376, 0, 0.8196079, 1, 1,
0.1085258, 0.7936616, 0.06700591, 0, 0.8156863, 1, 1,
0.1105522, 0.03865919, -0.6599895, 0, 0.8078431, 1, 1,
0.1155331, -1.450267, 2.230813, 0, 0.8039216, 1, 1,
0.118943, 0.8322789, 1.083797, 0, 0.7960784, 1, 1,
0.1193959, 0.6032736, 0.9634376, 0, 0.7882353, 1, 1,
0.1239363, 0.4445273, -0.2715886, 0, 0.7843137, 1, 1,
0.1255674, -0.3452654, 2.659288, 0, 0.7764706, 1, 1,
0.1272231, -0.01159392, 3.058813, 0, 0.772549, 1, 1,
0.1316173, -0.1097622, 2.268606, 0, 0.7647059, 1, 1,
0.1359016, -0.6671497, 3.004098, 0, 0.7607843, 1, 1,
0.1381222, 0.08407173, 0.8249564, 0, 0.7529412, 1, 1,
0.1447866, 1.889781, 0.3454621, 0, 0.7490196, 1, 1,
0.1457413, -0.5439024, -0.202828, 0, 0.7411765, 1, 1,
0.1464781, -0.1936662, 3.018499, 0, 0.7372549, 1, 1,
0.1474878, -0.6325192, 2.840938, 0, 0.7294118, 1, 1,
0.1480627, 0.07044476, 2.562299, 0, 0.7254902, 1, 1,
0.1504951, -0.5672477, 2.9374, 0, 0.7176471, 1, 1,
0.1505436, -0.3630247, 2.646068, 0, 0.7137255, 1, 1,
0.1519107, -0.02586501, 2.300447, 0, 0.7058824, 1, 1,
0.1523818, -0.06979047, 3.357154, 0, 0.6980392, 1, 1,
0.1537487, -0.5444689, 3.116197, 0, 0.6941177, 1, 1,
0.1551854, -0.7239882, 2.209813, 0, 0.6862745, 1, 1,
0.1582712, -0.9712005, 2.522364, 0, 0.682353, 1, 1,
0.1599867, -0.7671843, 2.054059, 0, 0.6745098, 1, 1,
0.1609312, 1.636601, -0.6937422, 0, 0.6705883, 1, 1,
0.1627821, -0.6010208, 3.729279, 0, 0.6627451, 1, 1,
0.1703591, -0.2268761, 3.155597, 0, 0.6588235, 1, 1,
0.1713982, 0.1692093, 0.7006958, 0, 0.6509804, 1, 1,
0.1774786, -2.144686, 3.770314, 0, 0.6470588, 1, 1,
0.1793307, 1.14369, 1.285572, 0, 0.6392157, 1, 1,
0.1838696, -1.154449, 4.173692, 0, 0.6352941, 1, 1,
0.1868769, 0.1489446, 1.644998, 0, 0.627451, 1, 1,
0.1871902, 0.4813066, 1.133256, 0, 0.6235294, 1, 1,
0.1899515, -0.9236146, 2.02563, 0, 0.6156863, 1, 1,
0.1912331, -1.2687, 1.800593, 0, 0.6117647, 1, 1,
0.1918037, 0.7359635, 0.2083784, 0, 0.6039216, 1, 1,
0.2006551, -0.2708975, 1.324259, 0, 0.5960785, 1, 1,
0.2010282, -0.1440822, -0.03106244, 0, 0.5921569, 1, 1,
0.2038852, -0.09543509, 1.90958, 0, 0.5843138, 1, 1,
0.207145, -1.16163, 3.569667, 0, 0.5803922, 1, 1,
0.2099849, -0.6227125, 2.504864, 0, 0.572549, 1, 1,
0.2130329, 0.7038139, 1.160296, 0, 0.5686275, 1, 1,
0.215455, -1.260383, 1.453908, 0, 0.5607843, 1, 1,
0.2157713, 0.2048374, 0.3148105, 0, 0.5568628, 1, 1,
0.2162697, -1.052743, 1.08499, 0, 0.5490196, 1, 1,
0.2172402, -0.4127505, 4.392339, 0, 0.5450981, 1, 1,
0.2185131, 0.6108798, 0.419875, 0, 0.5372549, 1, 1,
0.2197617, 0.1960272, 0.5301448, 0, 0.5333334, 1, 1,
0.2218944, 0.06263275, 1.623399, 0, 0.5254902, 1, 1,
0.2305432, -2.077588, 4.141008, 0, 0.5215687, 1, 1,
0.2337921, 1.720644, -0.5080884, 0, 0.5137255, 1, 1,
0.2338041, -0.1323711, 3.767778, 0, 0.509804, 1, 1,
0.2349703, -0.9455373, 2.285721, 0, 0.5019608, 1, 1,
0.2382149, -0.4536279, 2.106133, 0, 0.4941176, 1, 1,
0.2406905, -0.07443381, 0.4068626, 0, 0.4901961, 1, 1,
0.2437054, -0.6868294, 2.73314, 0, 0.4823529, 1, 1,
0.2460833, -0.8050154, 1.482386, 0, 0.4784314, 1, 1,
0.2558457, -1.024371, 4.090947, 0, 0.4705882, 1, 1,
0.2560984, 0.7688193, 2.21146, 0, 0.4666667, 1, 1,
0.2576399, -0.211912, 3.31153, 0, 0.4588235, 1, 1,
0.2588007, -0.3852128, 3.610953, 0, 0.454902, 1, 1,
0.2588217, -1.519298, 2.267499, 0, 0.4470588, 1, 1,
0.261561, -1.930214, 2.846452, 0, 0.4431373, 1, 1,
0.2644572, -1.051553, 3.405518, 0, 0.4352941, 1, 1,
0.2695827, -0.8761174, 3.321719, 0, 0.4313726, 1, 1,
0.2714439, -0.6965763, 2.702784, 0, 0.4235294, 1, 1,
0.2716448, -1.622794, 2.887952, 0, 0.4196078, 1, 1,
0.2722022, 0.7407017, 0.3475626, 0, 0.4117647, 1, 1,
0.2744968, -1.709486, 3.430278, 0, 0.4078431, 1, 1,
0.2776992, -1.439278, 4.073088, 0, 0.4, 1, 1,
0.2785807, -0.3557706, 1.126025, 0, 0.3921569, 1, 1,
0.2810821, -0.5115861, 1.831183, 0, 0.3882353, 1, 1,
0.2866149, 0.8333201, 0.01262061, 0, 0.3803922, 1, 1,
0.2901295, 0.05329767, 1.838741, 0, 0.3764706, 1, 1,
0.2931525, 1.586556, -1.957499, 0, 0.3686275, 1, 1,
0.2940172, 0.5516702, 0.7695031, 0, 0.3647059, 1, 1,
0.2949, 0.8760664, 1.328954, 0, 0.3568628, 1, 1,
0.3073648, -1.20268, 3.14612, 0, 0.3529412, 1, 1,
0.3143501, -0.6779488, 1.846599, 0, 0.345098, 1, 1,
0.3143752, 0.4352779, -0.4219082, 0, 0.3411765, 1, 1,
0.3171876, -0.3329658, 0.9816831, 0, 0.3333333, 1, 1,
0.3219793, -0.8508546, 3.995987, 0, 0.3294118, 1, 1,
0.3224042, 0.1079414, 1.356049, 0, 0.3215686, 1, 1,
0.3259443, 0.1858474, 2.515264, 0, 0.3176471, 1, 1,
0.3345296, 0.6652811, 0.3740922, 0, 0.3098039, 1, 1,
0.3352917, 0.4140179, 1.363636, 0, 0.3058824, 1, 1,
0.3370104, -1.929026, 3.780211, 0, 0.2980392, 1, 1,
0.3428845, -0.1986653, 3.305391, 0, 0.2901961, 1, 1,
0.3485312, -0.4094059, 1.368531, 0, 0.2862745, 1, 1,
0.3497377, -1.797053, 2.514957, 0, 0.2784314, 1, 1,
0.3541821, -0.5659946, 1.492912, 0, 0.2745098, 1, 1,
0.354242, -0.08326204, 1.160429, 0, 0.2666667, 1, 1,
0.3552052, 1.703683, -0.5482554, 0, 0.2627451, 1, 1,
0.3565279, -1.407655, 2.894825, 0, 0.254902, 1, 1,
0.3569025, -0.6266816, 1.51723, 0, 0.2509804, 1, 1,
0.3578295, 0.9861754, -0.6377969, 0, 0.2431373, 1, 1,
0.3588978, -2.167577, 2.84095, 0, 0.2392157, 1, 1,
0.3593932, 0.5334914, 0.6085199, 0, 0.2313726, 1, 1,
0.364606, 0.1550214, 0.8385201, 0, 0.227451, 1, 1,
0.3646593, -0.9336167, 2.49288, 0, 0.2196078, 1, 1,
0.3703765, 2.022604, -0.1959249, 0, 0.2156863, 1, 1,
0.3719121, -0.9917403, 2.537065, 0, 0.2078431, 1, 1,
0.381395, 2.029182, 1.840439, 0, 0.2039216, 1, 1,
0.3888734, 0.6287776, 0.4530009, 0, 0.1960784, 1, 1,
0.3919943, 0.8792979, -1.495555, 0, 0.1882353, 1, 1,
0.3947597, -0.6980641, 3.295771, 0, 0.1843137, 1, 1,
0.3964568, 0.356309, 0.04664059, 0, 0.1764706, 1, 1,
0.399933, -1.21417, 2.428118, 0, 0.172549, 1, 1,
0.400096, -0.6218867, 0.989951, 0, 0.1647059, 1, 1,
0.400637, 0.01449816, 1.822648, 0, 0.1607843, 1, 1,
0.4019853, 0.1979885, 1.280303, 0, 0.1529412, 1, 1,
0.4053721, 0.5573715, 3.140443, 0, 0.1490196, 1, 1,
0.4076292, -0.09096205, 0.7120581, 0, 0.1411765, 1, 1,
0.4115512, -0.2455603, 2.821351, 0, 0.1372549, 1, 1,
0.4135414, 1.978423, 0.4595998, 0, 0.1294118, 1, 1,
0.4140449, -0.3285662, 2.241258, 0, 0.1254902, 1, 1,
0.41515, 1.488438, -0.8182616, 0, 0.1176471, 1, 1,
0.4189756, -1.370097, 4.144663, 0, 0.1137255, 1, 1,
0.4268759, -0.4882418, 2.668668, 0, 0.1058824, 1, 1,
0.4273838, -0.9689796, 1.846147, 0, 0.09803922, 1, 1,
0.4280769, 1.280487, 2.180868, 0, 0.09411765, 1, 1,
0.4350921, 0.09929982, 1.526782, 0, 0.08627451, 1, 1,
0.4370911, -0.7789865, 3.498503, 0, 0.08235294, 1, 1,
0.4383987, 0.6493258, 1.637259, 0, 0.07450981, 1, 1,
0.4413747, -0.1995873, 2.325371, 0, 0.07058824, 1, 1,
0.4427484, 0.6469163, 1.178258, 0, 0.0627451, 1, 1,
0.4464163, -0.4668915, 3.196381, 0, 0.05882353, 1, 1,
0.4476347, 0.4320906, 0.7797688, 0, 0.05098039, 1, 1,
0.448116, -0.4082699, 2.016785, 0, 0.04705882, 1, 1,
0.4620196, -0.1321943, -0.04680264, 0, 0.03921569, 1, 1,
0.4642107, 1.299265, 0.2873237, 0, 0.03529412, 1, 1,
0.4659911, 0.1317126, 1.366575, 0, 0.02745098, 1, 1,
0.4664225, -0.06248895, 3.303176, 0, 0.02352941, 1, 1,
0.4675567, 1.818229, -0.2978599, 0, 0.01568628, 1, 1,
0.4682542, -0.3551216, 0.7893898, 0, 0.01176471, 1, 1,
0.4696192, -0.9622554, 1.28959, 0, 0.003921569, 1, 1,
0.4704109, -0.6318573, 3.324423, 0.003921569, 0, 1, 1,
0.4712323, -1.159027, 2.759772, 0.007843138, 0, 1, 1,
0.4712337, -1.172545, 3.574659, 0.01568628, 0, 1, 1,
0.4714586, 0.5047049, -1.010331, 0.01960784, 0, 1, 1,
0.4735032, -0.450341, 2.524167, 0.02745098, 0, 1, 1,
0.474016, 0.3642901, 1.654993, 0.03137255, 0, 1, 1,
0.4785968, -0.6698354, 2.504656, 0.03921569, 0, 1, 1,
0.4851841, 1.19465, 0.4511215, 0.04313726, 0, 1, 1,
0.4893117, -0.4941689, 2.902787, 0.05098039, 0, 1, 1,
0.4949363, -1.549762, 2.281239, 0.05490196, 0, 1, 1,
0.4958623, -0.7131154, 3.389924, 0.0627451, 0, 1, 1,
0.4965792, -1.851786, 2.725347, 0.06666667, 0, 1, 1,
0.4977908, -1.501338, 3.077799, 0.07450981, 0, 1, 1,
0.499957, 0.3251336, 3.101105, 0.07843138, 0, 1, 1,
0.501955, -1.136398, 2.750639, 0.08627451, 0, 1, 1,
0.5024976, 0.08726113, 1.7134, 0.09019608, 0, 1, 1,
0.5078112, -0.3108934, 3.041805, 0.09803922, 0, 1, 1,
0.5104101, -1.285126, 2.651968, 0.1058824, 0, 1, 1,
0.5125827, -0.498645, 1.44547, 0.1098039, 0, 1, 1,
0.5128599, -1.210754, 1.825693, 0.1176471, 0, 1, 1,
0.5130663, 1.35507, 0.1506201, 0.1215686, 0, 1, 1,
0.5135983, 0.9766477, -0.9034328, 0.1294118, 0, 1, 1,
0.5167086, -0.682398, 2.334678, 0.1333333, 0, 1, 1,
0.5178472, -0.4172707, 3.799427, 0.1411765, 0, 1, 1,
0.518944, -1.437371, 1.161754, 0.145098, 0, 1, 1,
0.5210975, 2.169855, 0.6765554, 0.1529412, 0, 1, 1,
0.5235337, 0.7265307, -1.134177, 0.1568628, 0, 1, 1,
0.5250512, 0.7253819, 0.3578568, 0.1647059, 0, 1, 1,
0.5253387, 0.4208394, 2.0193, 0.1686275, 0, 1, 1,
0.5309764, 0.7470502, 1.200215, 0.1764706, 0, 1, 1,
0.5321435, 1.530189, -0.407732, 0.1803922, 0, 1, 1,
0.532802, -1.560107, 3.265711, 0.1882353, 0, 1, 1,
0.5345727, 0.5129221, 0.1155487, 0.1921569, 0, 1, 1,
0.5346628, 1.55004, -0.7773414, 0.2, 0, 1, 1,
0.5367031, 1.306112, 0.6710407, 0.2078431, 0, 1, 1,
0.5369229, -0.7290282, 2.954058, 0.2117647, 0, 1, 1,
0.5405889, -0.1746079, 1.580615, 0.2196078, 0, 1, 1,
0.5407867, 0.8611259, 0.8004993, 0.2235294, 0, 1, 1,
0.5415325, 0.9202419, 1.084628, 0.2313726, 0, 1, 1,
0.5431612, 0.4779182, 1.903379, 0.2352941, 0, 1, 1,
0.5463638, 1.109594, 0.3415177, 0.2431373, 0, 1, 1,
0.5487144, -0.173455, -0.5274538, 0.2470588, 0, 1, 1,
0.5508363, -0.1700068, 0.7201235, 0.254902, 0, 1, 1,
0.5545416, 1.895393, -0.08010747, 0.2588235, 0, 1, 1,
0.5549039, -0.2962543, 1.312161, 0.2666667, 0, 1, 1,
0.5639376, 1.443815, 0.2984214, 0.2705882, 0, 1, 1,
0.5690652, 0.744216, -0.1631128, 0.2784314, 0, 1, 1,
0.5708947, -1.416428, 2.466418, 0.282353, 0, 1, 1,
0.5758002, -0.1719973, 1.838558, 0.2901961, 0, 1, 1,
0.5782168, 0.3924381, 0.2431089, 0.2941177, 0, 1, 1,
0.5794696, 0.8701498, 1.415111, 0.3019608, 0, 1, 1,
0.582062, -0.1620542, 3.384011, 0.3098039, 0, 1, 1,
0.5832111, -0.2555877, 0.6310222, 0.3137255, 0, 1, 1,
0.5858429, -1.045264, 3.239466, 0.3215686, 0, 1, 1,
0.5865936, -0.8552803, 3.388078, 0.3254902, 0, 1, 1,
0.5904021, -1.420907, 1.53234, 0.3333333, 0, 1, 1,
0.6103916, 0.4633795, 2.750339, 0.3372549, 0, 1, 1,
0.611868, 0.5425844, 0.1757396, 0.345098, 0, 1, 1,
0.6130468, -0.6478323, 1.242382, 0.3490196, 0, 1, 1,
0.6140854, -0.1830707, 2.574086, 0.3568628, 0, 1, 1,
0.6144918, 0.6160944, -0.9475145, 0.3607843, 0, 1, 1,
0.6147562, -0.8502858, 1.321862, 0.3686275, 0, 1, 1,
0.6171796, 1.340229, 0.9202238, 0.372549, 0, 1, 1,
0.6182355, -1.024287, 3.620992, 0.3803922, 0, 1, 1,
0.6203826, -0.3015673, 1.982117, 0.3843137, 0, 1, 1,
0.6204296, 0.4956037, -0.4723538, 0.3921569, 0, 1, 1,
0.6263256, -0.3858051, 1.29049, 0.3960784, 0, 1, 1,
0.6267384, -0.02926384, 0.4262531, 0.4039216, 0, 1, 1,
0.6277618, 0.3652176, 1.423806, 0.4117647, 0, 1, 1,
0.6294484, -0.3312418, 1.412117, 0.4156863, 0, 1, 1,
0.6320912, -1.435914, 1.983811, 0.4235294, 0, 1, 1,
0.6323367, 0.9630728, 0.9994456, 0.427451, 0, 1, 1,
0.635252, 0.6685951, -0.3094562, 0.4352941, 0, 1, 1,
0.6391925, -1.187846, 2.267259, 0.4392157, 0, 1, 1,
0.6496909, 0.4719672, 0.993971, 0.4470588, 0, 1, 1,
0.6497847, -0.2219366, 2.21484, 0.4509804, 0, 1, 1,
0.6522546, 0.6973907, -0.5217403, 0.4588235, 0, 1, 1,
0.6558924, 0.0946544, 2.57563, 0.4627451, 0, 1, 1,
0.6604782, 1.404845, 0.2802703, 0.4705882, 0, 1, 1,
0.6618649, 0.3035309, 1.807529, 0.4745098, 0, 1, 1,
0.6622346, -1.055993, 5.099438, 0.4823529, 0, 1, 1,
0.6641202, -0.104582, 2.460378, 0.4862745, 0, 1, 1,
0.6680444, -0.5691611, 2.265625, 0.4941176, 0, 1, 1,
0.668955, -1.105745, 2.567715, 0.5019608, 0, 1, 1,
0.6699378, -0.2398371, 2.659193, 0.5058824, 0, 1, 1,
0.6708637, 0.4133004, 0.8159204, 0.5137255, 0, 1, 1,
0.6769337, 1.283558, 0.4133234, 0.5176471, 0, 1, 1,
0.6771402, -0.3858763, 3.289167, 0.5254902, 0, 1, 1,
0.6773357, -1.677671, 2.873054, 0.5294118, 0, 1, 1,
0.6786223, 0.4604278, 1.028991, 0.5372549, 0, 1, 1,
0.6846516, 0.7640094, 1.896686, 0.5411765, 0, 1, 1,
0.690624, -0.9777951, 2.387529, 0.5490196, 0, 1, 1,
0.6908963, 0.2157364, 1.119939, 0.5529412, 0, 1, 1,
0.6911982, 1.285288, -0.1218594, 0.5607843, 0, 1, 1,
0.692956, 0.8533242, 1.067575, 0.5647059, 0, 1, 1,
0.6969478, -0.2996935, 2.719927, 0.572549, 0, 1, 1,
0.7004502, -1.247037, 0.3115408, 0.5764706, 0, 1, 1,
0.7130721, -0.3081977, 2.532355, 0.5843138, 0, 1, 1,
0.7174764, 0.2480644, 1.807651, 0.5882353, 0, 1, 1,
0.731568, -0.1724555, 1.211617, 0.5960785, 0, 1, 1,
0.7556707, 0.3882937, 1.158909, 0.6039216, 0, 1, 1,
0.7561618, 0.1912914, 0.6638519, 0.6078432, 0, 1, 1,
0.7575967, -0.08783894, 2.706886, 0.6156863, 0, 1, 1,
0.7580777, 0.9696062, -0.2486511, 0.6196079, 0, 1, 1,
0.7702011, 0.2278932, 0.02401472, 0.627451, 0, 1, 1,
0.7719414, 0.4843567, 1.11261, 0.6313726, 0, 1, 1,
0.7757215, 1.261099, 1.500489, 0.6392157, 0, 1, 1,
0.7811447, -0.2291446, 0.7440868, 0.6431373, 0, 1, 1,
0.7812074, -0.5541543, 0.3926384, 0.6509804, 0, 1, 1,
0.7835157, 0.9336931, -1.385994, 0.654902, 0, 1, 1,
0.786393, 0.04570601, 2.973438, 0.6627451, 0, 1, 1,
0.7886422, -0.01956043, 2.397912, 0.6666667, 0, 1, 1,
0.7919487, -0.4606572, 2.40735, 0.6745098, 0, 1, 1,
0.8009973, -1.107171, 2.167347, 0.6784314, 0, 1, 1,
0.8039277, -1.969565, 2.835099, 0.6862745, 0, 1, 1,
0.8047115, 0.7128024, 1.309277, 0.6901961, 0, 1, 1,
0.8068096, -0.3123282, 0.6815866, 0.6980392, 0, 1, 1,
0.8085656, -0.1498935, 4.135611, 0.7058824, 0, 1, 1,
0.8156728, 0.1510349, 2.752446, 0.7098039, 0, 1, 1,
0.8179469, -0.4402902, 2.246858, 0.7176471, 0, 1, 1,
0.821369, -0.6593881, 3.919526, 0.7215686, 0, 1, 1,
0.8244411, 0.06250346, 0.4764442, 0.7294118, 0, 1, 1,
0.8278382, -0.2291102, 1.996237, 0.7333333, 0, 1, 1,
0.835916, 1.360756, 0.115927, 0.7411765, 0, 1, 1,
0.8382412, 0.4210869, 1.026317, 0.7450981, 0, 1, 1,
0.8394489, 0.3028181, 0.5407505, 0.7529412, 0, 1, 1,
0.8631429, 0.19764, 0.9134753, 0.7568628, 0, 1, 1,
0.8655487, -1.264217, 1.045019, 0.7647059, 0, 1, 1,
0.8677195, -0.6784168, 2.179159, 0.7686275, 0, 1, 1,
0.8678867, -1.511002, 3.781211, 0.7764706, 0, 1, 1,
0.8682818, 2.212749, 0.1514265, 0.7803922, 0, 1, 1,
0.8687649, 1.968279, 2.355741, 0.7882353, 0, 1, 1,
0.8759111, -0.3413702, 3.298504, 0.7921569, 0, 1, 1,
0.8790579, 0.4601467, 1.629289, 0.8, 0, 1, 1,
0.8813885, 0.7582231, -0.2870418, 0.8078431, 0, 1, 1,
0.8881083, 0.06135458, 1.986973, 0.8117647, 0, 1, 1,
0.9057363, -1.380997, 3.379887, 0.8196079, 0, 1, 1,
0.9064814, 0.1970247, 1.572855, 0.8235294, 0, 1, 1,
0.9097672, 0.2941262, 0.3989621, 0.8313726, 0, 1, 1,
0.9137229, -0.2910731, -0.3976876, 0.8352941, 0, 1, 1,
0.9143836, 1.287552, 0.1251644, 0.8431373, 0, 1, 1,
0.9144724, -0.648664, 1.778126, 0.8470588, 0, 1, 1,
0.9232508, 1.140891, 1.637102, 0.854902, 0, 1, 1,
0.9243296, 0.9681661, 0.3104607, 0.8588235, 0, 1, 1,
0.9246697, -0.1690673, 3.034456, 0.8666667, 0, 1, 1,
0.931881, 0.4176511, 0.7279829, 0.8705882, 0, 1, 1,
0.9340658, -0.6802281, 1.654228, 0.8784314, 0, 1, 1,
0.9345607, -0.2548511, 2.952098, 0.8823529, 0, 1, 1,
0.9413618, -1.686714, 1.97093, 0.8901961, 0, 1, 1,
0.9433196, -0.1803791, 1.682663, 0.8941177, 0, 1, 1,
0.9444111, -0.4142164, 1.728427, 0.9019608, 0, 1, 1,
0.9504804, 0.07677174, 1.38825, 0.9098039, 0, 1, 1,
0.955053, 1.316271, 1.94057, 0.9137255, 0, 1, 1,
0.9582517, 0.3196281, 0.804502, 0.9215686, 0, 1, 1,
0.9613013, -0.6260836, 0.2153794, 0.9254902, 0, 1, 1,
0.9633536, 1.0159, 0.8204609, 0.9333333, 0, 1, 1,
0.9670939, -0.1859432, 1.346858, 0.9372549, 0, 1, 1,
0.9681726, -0.8864028, 1.299225, 0.945098, 0, 1, 1,
0.9682164, -1.62904, 2.473931, 0.9490196, 0, 1, 1,
0.9725533, -0.7980043, 3.035725, 0.9568627, 0, 1, 1,
0.9756573, -0.1673204, -0.5741207, 0.9607843, 0, 1, 1,
0.9785248, -0.5756545, 4.41177, 0.9686275, 0, 1, 1,
0.9794611, 1.775379, -1.416314, 0.972549, 0, 1, 1,
0.9818025, -1.036645, 3.985074, 0.9803922, 0, 1, 1,
0.9971753, -1.185295, 3.315574, 0.9843137, 0, 1, 1,
0.9991446, 1.126979, 2.740135, 0.9921569, 0, 1, 1,
1.011819, 0.4892314, 0.5715819, 0.9960784, 0, 1, 1,
1.015957, 0.204429, 1.957235, 1, 0, 0.9960784, 1,
1.022146, 0.03085683, 0.01892698, 1, 0, 0.9882353, 1,
1.022755, -1.111885, 2.30394, 1, 0, 0.9843137, 1,
1.024375, 0.8994536, 1.370963, 1, 0, 0.9764706, 1,
1.026848, -0.7916018, 3.32735, 1, 0, 0.972549, 1,
1.032538, -0.1916865, 3.304053, 1, 0, 0.9647059, 1,
1.034073, -0.5538067, 2.004301, 1, 0, 0.9607843, 1,
1.034513, -0.7512479, 2.652806, 1, 0, 0.9529412, 1,
1.040741, 0.02340164, 0.614804, 1, 0, 0.9490196, 1,
1.051154, 0.8684155, 1.217578, 1, 0, 0.9411765, 1,
1.062692, 0.2472785, 0.31468, 1, 0, 0.9372549, 1,
1.066836, 0.8377404, -0.3356937, 1, 0, 0.9294118, 1,
1.07041, -0.9387901, 0.9713707, 1, 0, 0.9254902, 1,
1.070469, 0.2841268, 0.3490241, 1, 0, 0.9176471, 1,
1.071551, 0.4601685, 0.9471971, 1, 0, 0.9137255, 1,
1.073493, -0.07515613, 1.443596, 1, 0, 0.9058824, 1,
1.074745, 1.512083, 0.3670208, 1, 0, 0.9019608, 1,
1.079591, -0.1874632, 2.110951, 1, 0, 0.8941177, 1,
1.080881, -0.6523176, 2.418298, 1, 0, 0.8862745, 1,
1.082367, 0.6574795, 0.4998436, 1, 0, 0.8823529, 1,
1.08857, -0.1511358, 1.181994, 1, 0, 0.8745098, 1,
1.089738, 0.6081749, 0.6855971, 1, 0, 0.8705882, 1,
1.096674, 0.3284146, 0.6716431, 1, 0, 0.8627451, 1,
1.105312, -1.447541, 4.251767, 1, 0, 0.8588235, 1,
1.112797, 0.1756267, 0.2259, 1, 0, 0.8509804, 1,
1.115654, 0.612209, 1.934691, 1, 0, 0.8470588, 1,
1.118146, -1.058832, 1.978637, 1, 0, 0.8392157, 1,
1.118938, -1.265058, 2.181465, 1, 0, 0.8352941, 1,
1.121026, -0.3086344, 1.404931, 1, 0, 0.827451, 1,
1.12588, -0.703782, 1.194487, 1, 0, 0.8235294, 1,
1.144427, -0.8674399, 2.126515, 1, 0, 0.8156863, 1,
1.153363, -1.354245, 1.502583, 1, 0, 0.8117647, 1,
1.159485, 2.029274, -0.09524273, 1, 0, 0.8039216, 1,
1.161523, 0.3835815, 0.6377528, 1, 0, 0.7960784, 1,
1.164224, -0.9106274, 1.605128, 1, 0, 0.7921569, 1,
1.168426, -1.219676, 0.9958224, 1, 0, 0.7843137, 1,
1.173847, 0.4396545, 0.5678976, 1, 0, 0.7803922, 1,
1.176012, -0.3348348, -0.02488663, 1, 0, 0.772549, 1,
1.176197, -0.03358442, 1.949943, 1, 0, 0.7686275, 1,
1.176387, -0.857818, 4.879375, 1, 0, 0.7607843, 1,
1.201761, -0.6028777, 1.122482, 1, 0, 0.7568628, 1,
1.210007, 0.8100588, 1.917541, 1, 0, 0.7490196, 1,
1.210368, 1.792927, 0.5082083, 1, 0, 0.7450981, 1,
1.218835, -0.5083024, 0.6803285, 1, 0, 0.7372549, 1,
1.220721, 0.5018414, -0.5257676, 1, 0, 0.7333333, 1,
1.223322, -2.26142, 3.974326, 1, 0, 0.7254902, 1,
1.228098, 1.160523, 0.4187341, 1, 0, 0.7215686, 1,
1.229248, 0.1892543, 1.601966, 1, 0, 0.7137255, 1,
1.236462, 0.1403014, 2.602368, 1, 0, 0.7098039, 1,
1.242563, 0.08229446, 0.9237486, 1, 0, 0.7019608, 1,
1.246732, 0.1932196, 1.567048, 1, 0, 0.6941177, 1,
1.247317, 1.072875, 1.713134, 1, 0, 0.6901961, 1,
1.269518, 1.492395, -0.7514903, 1, 0, 0.682353, 1,
1.271799, 0.001455268, -0.1855119, 1, 0, 0.6784314, 1,
1.275104, 1.30512, 0.1685054, 1, 0, 0.6705883, 1,
1.279, -0.965847, 1.736507, 1, 0, 0.6666667, 1,
1.281358, -0.06871547, 2.50688, 1, 0, 0.6588235, 1,
1.298054, -0.4020358, 4.321676, 1, 0, 0.654902, 1,
1.30497, 0.6536575, 0.8696483, 1, 0, 0.6470588, 1,
1.307159, 0.8741201, 0.8152508, 1, 0, 0.6431373, 1,
1.30971, -1.67965, 3.124958, 1, 0, 0.6352941, 1,
1.328856, -0.3318477, 1.511505, 1, 0, 0.6313726, 1,
1.346976, 0.610424, 1.075315, 1, 0, 0.6235294, 1,
1.35175, 1.437943, 1.703513, 1, 0, 0.6196079, 1,
1.366541, 0.5952281, -0.3988188, 1, 0, 0.6117647, 1,
1.366614, -0.5312778, 2.231639, 1, 0, 0.6078432, 1,
1.379353, -0.3456527, 0.5508386, 1, 0, 0.6, 1,
1.3794, -1.743057, 1.872271, 1, 0, 0.5921569, 1,
1.385734, -0.1913992, 2.211507, 1, 0, 0.5882353, 1,
1.393789, -0.7445737, 0.08248005, 1, 0, 0.5803922, 1,
1.393999, -0.3115046, 2.395054, 1, 0, 0.5764706, 1,
1.400639, 0.1953167, -0.05044822, 1, 0, 0.5686275, 1,
1.414117, 0.573469, 2.488832, 1, 0, 0.5647059, 1,
1.41554, -0.2513945, 3.135433, 1, 0, 0.5568628, 1,
1.420373, -2.855958, 1.025135, 1, 0, 0.5529412, 1,
1.427065, -0.555371, 1.271081, 1, 0, 0.5450981, 1,
1.432466, -0.2054191, 1.720275, 1, 0, 0.5411765, 1,
1.434089, -0.07313302, 0.4889525, 1, 0, 0.5333334, 1,
1.441191, -0.3217767, 0.9248796, 1, 0, 0.5294118, 1,
1.45804, -1.166419, -0.3847454, 1, 0, 0.5215687, 1,
1.460977, -2.230954, 3.576757, 1, 0, 0.5176471, 1,
1.462774, -0.8839256, 0.6946937, 1, 0, 0.509804, 1,
1.471458, 0.1639569, 1.619424, 1, 0, 0.5058824, 1,
1.481326, -1.999779, 1.676979, 1, 0, 0.4980392, 1,
1.482458, -0.6226981, 1.63695, 1, 0, 0.4901961, 1,
1.485271, -0.4508197, 2.979989, 1, 0, 0.4862745, 1,
1.491694, 0.08260084, 2.635252, 1, 0, 0.4784314, 1,
1.49272, -1.091902, 0.8609908, 1, 0, 0.4745098, 1,
1.512277, 0.1057767, 1.931411, 1, 0, 0.4666667, 1,
1.512874, 0.04169839, 1.258186, 1, 0, 0.4627451, 1,
1.513535, -0.4937779, 2.588716, 1, 0, 0.454902, 1,
1.514684, -2.101925, 2.249801, 1, 0, 0.4509804, 1,
1.531386, 0.8356658, 0.9769618, 1, 0, 0.4431373, 1,
1.53283, -0.6584709, 2.695649, 1, 0, 0.4392157, 1,
1.54796, 1.32023, -0.7061043, 1, 0, 0.4313726, 1,
1.554478, -0.7494147, 2.205884, 1, 0, 0.427451, 1,
1.560943, -0.3640205, 1.05396, 1, 0, 0.4196078, 1,
1.566234, -1.311563, 0.9659402, 1, 0, 0.4156863, 1,
1.568838, -0.3039445, 2.490481, 1, 0, 0.4078431, 1,
1.570114, 0.6767563, 0.4456762, 1, 0, 0.4039216, 1,
1.571157, -0.1700334, 1.56886, 1, 0, 0.3960784, 1,
1.571471, -0.07604517, 1.90931, 1, 0, 0.3882353, 1,
1.577244, 1.728883, 0.4180878, 1, 0, 0.3843137, 1,
1.57748, 0.00416586, 2.298718, 1, 0, 0.3764706, 1,
1.614089, -0.9680386, 2.118484, 1, 0, 0.372549, 1,
1.621092, 1.160141, 0.9037637, 1, 0, 0.3647059, 1,
1.622357, -0.1675823, 1.844193, 1, 0, 0.3607843, 1,
1.625199, -1.332204, 2.179049, 1, 0, 0.3529412, 1,
1.631999, -0.2213223, -0.2406035, 1, 0, 0.3490196, 1,
1.638235, 1.394668, 0.18507, 1, 0, 0.3411765, 1,
1.645142, -0.7334745, 2.137393, 1, 0, 0.3372549, 1,
1.645926, 0.2453599, 3.031627, 1, 0, 0.3294118, 1,
1.666808, 1.664131, -0.2486777, 1, 0, 0.3254902, 1,
1.681605, 0.1069216, 1.126362, 1, 0, 0.3176471, 1,
1.688971, -0.6189779, 1.282122, 1, 0, 0.3137255, 1,
1.6909, -1.257046, 3.562611, 1, 0, 0.3058824, 1,
1.699995, 0.1705024, 0.7834765, 1, 0, 0.2980392, 1,
1.706196, -0.2364352, 0.3923618, 1, 0, 0.2941177, 1,
1.732016, -0.6303447, 1.349361, 1, 0, 0.2862745, 1,
1.734871, 0.9504702, 0.9368439, 1, 0, 0.282353, 1,
1.735757, -1.744348, 4.089034, 1, 0, 0.2745098, 1,
1.737913, 0.3408669, 0.7318903, 1, 0, 0.2705882, 1,
1.740295, -0.3784812, 1.950362, 1, 0, 0.2627451, 1,
1.740848, -1.230855, 2.992072, 1, 0, 0.2588235, 1,
1.755129, 0.1522438, 0.1592177, 1, 0, 0.2509804, 1,
1.758308, 0.2417375, 0.4185012, 1, 0, 0.2470588, 1,
1.771969, 1.548849, -1.088372, 1, 0, 0.2392157, 1,
1.781056, 0.4840351, 2.157843, 1, 0, 0.2352941, 1,
1.813924, -0.5396141, 2.169069, 1, 0, 0.227451, 1,
1.830556, -0.320014, 0.4847625, 1, 0, 0.2235294, 1,
1.845102, -0.945417, 1.59271, 1, 0, 0.2156863, 1,
1.847236, -0.1224469, 1.992526, 1, 0, 0.2117647, 1,
1.870603, -1.573986, 1.841408, 1, 0, 0.2039216, 1,
1.913321, 0.2459159, 2.909214, 1, 0, 0.1960784, 1,
1.915908, -1.256242, 3.10745, 1, 0, 0.1921569, 1,
1.930282, -2.55254, 1.714233, 1, 0, 0.1843137, 1,
1.960088, 1.861821, -0.8447523, 1, 0, 0.1803922, 1,
1.981539, -0.2761282, 1.45893, 1, 0, 0.172549, 1,
1.992029, 0.205159, 3.333786, 1, 0, 0.1686275, 1,
1.992495, -1.132315, 1.611716, 1, 0, 0.1607843, 1,
2.00901, -0.3210301, 1.525034, 1, 0, 0.1568628, 1,
2.027101, 0.539364, 2.187781, 1, 0, 0.1490196, 1,
2.073018, 0.8384604, -0.1707311, 1, 0, 0.145098, 1,
2.08074, 0.1783445, 1.882769, 1, 0, 0.1372549, 1,
2.09593, 0.6962034, 0.4572578, 1, 0, 0.1333333, 1,
2.149984, -1.168624, 2.277528, 1, 0, 0.1254902, 1,
2.177293, -0.07196497, 3.035617, 1, 0, 0.1215686, 1,
2.182095, -0.3512258, 2.298408, 1, 0, 0.1137255, 1,
2.240854, -0.1816365, 2.809757, 1, 0, 0.1098039, 1,
2.261967, -1.152901, 2.210337, 1, 0, 0.1019608, 1,
2.332555, -2.033635, 1.79662, 1, 0, 0.09411765, 1,
2.338532, -0.7362618, 1.584777, 1, 0, 0.09019608, 1,
2.371264, -0.6953047, 1.347055, 1, 0, 0.08235294, 1,
2.383185, -0.7696232, 2.787742, 1, 0, 0.07843138, 1,
2.432357, 0.261613, 0.478725, 1, 0, 0.07058824, 1,
2.435411, -1.308959, 2.293436, 1, 0, 0.06666667, 1,
2.462898, 0.08401805, 1.600138, 1, 0, 0.05882353, 1,
2.53581, -0.8603365, 2.50816, 1, 0, 0.05490196, 1,
2.546498, 1.215035, 2.069448, 1, 0, 0.04705882, 1,
2.555554, -1.271196, 1.922867, 1, 0, 0.04313726, 1,
2.588748, -1.028504, 0.8885975, 1, 0, 0.03529412, 1,
2.599704, -1.204721, 0.2015732, 1, 0, 0.03137255, 1,
2.618554, 0.3868597, 1.097046, 1, 0, 0.02352941, 1,
2.654324, 1.369013, -0.4227487, 1, 0, 0.01960784, 1,
2.664579, -1.564297, 3.619279, 1, 0, 0.01176471, 1,
2.813354, 0.1564998, -0.2973495, 1, 0, 0.007843138, 1
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
-0.1312151, -4.90397, -7.403454, 0, -0.5, 0.5, 0.5,
-0.1312151, -4.90397, -7.403454, 1, -0.5, 0.5, 0.5,
-0.1312151, -4.90397, -7.403454, 1, 1.5, 0.5, 0.5,
-0.1312151, -4.90397, -7.403454, 0, 1.5, 0.5, 0.5
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
-4.073993, -0.365766, -7.403454, 0, -0.5, 0.5, 0.5,
-4.073993, -0.365766, -7.403454, 1, -0.5, 0.5, 0.5,
-4.073993, -0.365766, -7.403454, 1, 1.5, 0.5, 0.5,
-4.073993, -0.365766, -7.403454, 0, 1.5, 0.5, 0.5
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
-4.073993, -4.90397, -0.2459629, 0, -0.5, 0.5, 0.5,
-4.073993, -4.90397, -0.2459629, 1, -0.5, 0.5, 0.5,
-4.073993, -4.90397, -0.2459629, 1, 1.5, 0.5, 0.5,
-4.073993, -4.90397, -0.2459629, 0, 1.5, 0.5, 0.5
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
-3, -3.856692, -5.751726,
2, -3.856692, -5.751726,
-3, -3.856692, -5.751726,
-3, -4.031239, -6.027014,
-2, -3.856692, -5.751726,
-2, -4.031239, -6.027014,
-1, -3.856692, -5.751726,
-1, -4.031239, -6.027014,
0, -3.856692, -5.751726,
0, -4.031239, -6.027014,
1, -3.856692, -5.751726,
1, -4.031239, -6.027014,
2, -3.856692, -5.751726,
2, -4.031239, -6.027014
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
-3, -4.380332, -6.57759, 0, -0.5, 0.5, 0.5,
-3, -4.380332, -6.57759, 1, -0.5, 0.5, 0.5,
-3, -4.380332, -6.57759, 1, 1.5, 0.5, 0.5,
-3, -4.380332, -6.57759, 0, 1.5, 0.5, 0.5,
-2, -4.380332, -6.57759, 0, -0.5, 0.5, 0.5,
-2, -4.380332, -6.57759, 1, -0.5, 0.5, 0.5,
-2, -4.380332, -6.57759, 1, 1.5, 0.5, 0.5,
-2, -4.380332, -6.57759, 0, 1.5, 0.5, 0.5,
-1, -4.380332, -6.57759, 0, -0.5, 0.5, 0.5,
-1, -4.380332, -6.57759, 1, -0.5, 0.5, 0.5,
-1, -4.380332, -6.57759, 1, 1.5, 0.5, 0.5,
-1, -4.380332, -6.57759, 0, 1.5, 0.5, 0.5,
0, -4.380332, -6.57759, 0, -0.5, 0.5, 0.5,
0, -4.380332, -6.57759, 1, -0.5, 0.5, 0.5,
0, -4.380332, -6.57759, 1, 1.5, 0.5, 0.5,
0, -4.380332, -6.57759, 0, 1.5, 0.5, 0.5,
1, -4.380332, -6.57759, 0, -0.5, 0.5, 0.5,
1, -4.380332, -6.57759, 1, -0.5, 0.5, 0.5,
1, -4.380332, -6.57759, 1, 1.5, 0.5, 0.5,
1, -4.380332, -6.57759, 0, 1.5, 0.5, 0.5,
2, -4.380332, -6.57759, 0, -0.5, 0.5, 0.5,
2, -4.380332, -6.57759, 1, -0.5, 0.5, 0.5,
2, -4.380332, -6.57759, 1, 1.5, 0.5, 0.5,
2, -4.380332, -6.57759, 0, 1.5, 0.5, 0.5
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
-3.164121, -3, -5.751726,
-3.164121, 3, -5.751726,
-3.164121, -3, -5.751726,
-3.315766, -3, -6.027014,
-3.164121, -2, -5.751726,
-3.315766, -2, -6.027014,
-3.164121, -1, -5.751726,
-3.315766, -1, -6.027014,
-3.164121, 0, -5.751726,
-3.315766, 0, -6.027014,
-3.164121, 1, -5.751726,
-3.315766, 1, -6.027014,
-3.164121, 2, -5.751726,
-3.315766, 2, -6.027014,
-3.164121, 3, -5.751726,
-3.315766, 3, -6.027014
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
-3.619057, -3, -6.57759, 0, -0.5, 0.5, 0.5,
-3.619057, -3, -6.57759, 1, -0.5, 0.5, 0.5,
-3.619057, -3, -6.57759, 1, 1.5, 0.5, 0.5,
-3.619057, -3, -6.57759, 0, 1.5, 0.5, 0.5,
-3.619057, -2, -6.57759, 0, -0.5, 0.5, 0.5,
-3.619057, -2, -6.57759, 1, -0.5, 0.5, 0.5,
-3.619057, -2, -6.57759, 1, 1.5, 0.5, 0.5,
-3.619057, -2, -6.57759, 0, 1.5, 0.5, 0.5,
-3.619057, -1, -6.57759, 0, -0.5, 0.5, 0.5,
-3.619057, -1, -6.57759, 1, -0.5, 0.5, 0.5,
-3.619057, -1, -6.57759, 1, 1.5, 0.5, 0.5,
-3.619057, -1, -6.57759, 0, 1.5, 0.5, 0.5,
-3.619057, 0, -6.57759, 0, -0.5, 0.5, 0.5,
-3.619057, 0, -6.57759, 1, -0.5, 0.5, 0.5,
-3.619057, 0, -6.57759, 1, 1.5, 0.5, 0.5,
-3.619057, 0, -6.57759, 0, 1.5, 0.5, 0.5,
-3.619057, 1, -6.57759, 0, -0.5, 0.5, 0.5,
-3.619057, 1, -6.57759, 1, -0.5, 0.5, 0.5,
-3.619057, 1, -6.57759, 1, 1.5, 0.5, 0.5,
-3.619057, 1, -6.57759, 0, 1.5, 0.5, 0.5,
-3.619057, 2, -6.57759, 0, -0.5, 0.5, 0.5,
-3.619057, 2, -6.57759, 1, -0.5, 0.5, 0.5,
-3.619057, 2, -6.57759, 1, 1.5, 0.5, 0.5,
-3.619057, 2, -6.57759, 0, 1.5, 0.5, 0.5,
-3.619057, 3, -6.57759, 0, -0.5, 0.5, 0.5,
-3.619057, 3, -6.57759, 1, -0.5, 0.5, 0.5,
-3.619057, 3, -6.57759, 1, 1.5, 0.5, 0.5,
-3.619057, 3, -6.57759, 0, 1.5, 0.5, 0.5
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
-3.164121, -3.856692, -4,
-3.164121, -3.856692, 4,
-3.164121, -3.856692, -4,
-3.315766, -4.031239, -4,
-3.164121, -3.856692, -2,
-3.315766, -4.031239, -2,
-3.164121, -3.856692, 0,
-3.315766, -4.031239, 0,
-3.164121, -3.856692, 2,
-3.315766, -4.031239, 2,
-3.164121, -3.856692, 4,
-3.315766, -4.031239, 4
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
-3.619057, -4.380332, -4, 0, -0.5, 0.5, 0.5,
-3.619057, -4.380332, -4, 1, -0.5, 0.5, 0.5,
-3.619057, -4.380332, -4, 1, 1.5, 0.5, 0.5,
-3.619057, -4.380332, -4, 0, 1.5, 0.5, 0.5,
-3.619057, -4.380332, -2, 0, -0.5, 0.5, 0.5,
-3.619057, -4.380332, -2, 1, -0.5, 0.5, 0.5,
-3.619057, -4.380332, -2, 1, 1.5, 0.5, 0.5,
-3.619057, -4.380332, -2, 0, 1.5, 0.5, 0.5,
-3.619057, -4.380332, 0, 0, -0.5, 0.5, 0.5,
-3.619057, -4.380332, 0, 1, -0.5, 0.5, 0.5,
-3.619057, -4.380332, 0, 1, 1.5, 0.5, 0.5,
-3.619057, -4.380332, 0, 0, 1.5, 0.5, 0.5,
-3.619057, -4.380332, 2, 0, -0.5, 0.5, 0.5,
-3.619057, -4.380332, 2, 1, -0.5, 0.5, 0.5,
-3.619057, -4.380332, 2, 1, 1.5, 0.5, 0.5,
-3.619057, -4.380332, 2, 0, 1.5, 0.5, 0.5,
-3.619057, -4.380332, 4, 0, -0.5, 0.5, 0.5,
-3.619057, -4.380332, 4, 1, -0.5, 0.5, 0.5,
-3.619057, -4.380332, 4, 1, 1.5, 0.5, 0.5,
-3.619057, -4.380332, 4, 0, 1.5, 0.5, 0.5
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
-3.164121, -3.856692, -5.751726,
-3.164121, 3.12516, -5.751726,
-3.164121, -3.856692, 5.2598,
-3.164121, 3.12516, 5.2598,
-3.164121, -3.856692, -5.751726,
-3.164121, -3.856692, 5.2598,
-3.164121, 3.12516, -5.751726,
-3.164121, 3.12516, 5.2598,
-3.164121, -3.856692, -5.751726,
2.90169, -3.856692, -5.751726,
-3.164121, -3.856692, 5.2598,
2.90169, -3.856692, 5.2598,
-3.164121, 3.12516, -5.751726,
2.90169, 3.12516, -5.751726,
-3.164121, 3.12516, 5.2598,
2.90169, 3.12516, 5.2598,
2.90169, -3.856692, -5.751726,
2.90169, 3.12516, -5.751726,
2.90169, -3.856692, 5.2598,
2.90169, 3.12516, 5.2598,
2.90169, -3.856692, -5.751726,
2.90169, -3.856692, 5.2598,
2.90169, 3.12516, -5.751726,
2.90169, 3.12516, 5.2598
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
var radius = 7.678819;
var distance = 34.16393;
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
mvMatrix.translate( 0.1312151, 0.365766, 0.2459629 );
mvMatrix.scale( 1.368735, 1.189153, 0.7539818 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16393);
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
depen<-read.table("depen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-depen$V2
```

```
## Error in eval(expr, envir, enclos): object 'depen' not found
```

```r
y<-depen$V3
```

```
## Error in eval(expr, envir, enclos): object 'depen' not found
```

```r
z<-depen$V4
```

```
## Error in eval(expr, envir, enclos): object 'depen' not found
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
-3.075784, 0.01747972, -1.091633, 0, 0, 1, 1, 1,
-2.871215, -0.3042728, -1.765052, 1, 0, 0, 1, 1,
-2.852354, 1.553243, -0.7610207, 1, 0, 0, 1, 1,
-2.690609, -1.395519, -1.890098, 1, 0, 0, 1, 1,
-2.683177, -0.8053056, -2.930888, 1, 0, 0, 1, 1,
-2.630813, -1.511535, -0.3672539, 1, 0, 0, 1, 1,
-2.61041, 1.35934, -1.542192, 0, 0, 0, 1, 1,
-2.471725, 0.07390797, -1.267572, 0, 0, 0, 1, 1,
-2.392583, -0.5214124, -1.82559, 0, 0, 0, 1, 1,
-2.365318, 1.013543, 0.4553526, 0, 0, 0, 1, 1,
-2.362308, -0.6488689, -1.760425, 0, 0, 0, 1, 1,
-2.346813, -1.095691, -3.192695, 0, 0, 0, 1, 1,
-2.311932, -0.182511, -0.896304, 0, 0, 0, 1, 1,
-2.298308, 0.1290489, -1.058266, 1, 1, 1, 1, 1,
-2.291929, -0.06768022, -0.3259568, 1, 1, 1, 1, 1,
-2.255208, 0.7350303, -2.3733, 1, 1, 1, 1, 1,
-2.224556, -3.755015, -2.245063, 1, 1, 1, 1, 1,
-2.16129, 0.5983939, -0.6746851, 1, 1, 1, 1, 1,
-2.136167, -0.6934695, -2.236341, 1, 1, 1, 1, 1,
-2.097013, 2.338331, -1.153879, 1, 1, 1, 1, 1,
-2.085376, 0.06905296, -1.674736, 1, 1, 1, 1, 1,
-2.024361, 0.0594537, -1.732148, 1, 1, 1, 1, 1,
-2.012809, -1.933295, -4.438628, 1, 1, 1, 1, 1,
-2.008073, 0.3956126, -1.014899, 1, 1, 1, 1, 1,
-1.98747, -0.7145602, -1.853338, 1, 1, 1, 1, 1,
-1.97206, 0.9192163, -1.108271, 1, 1, 1, 1, 1,
-1.933481, -2.147345, -3.316377, 1, 1, 1, 1, 1,
-1.883219, 1.40966, -1.9538, 1, 1, 1, 1, 1,
-1.854767, -0.4817496, -2.785178, 0, 0, 1, 1, 1,
-1.850053, -1.531542, -2.616965, 1, 0, 0, 1, 1,
-1.845359, 0.7767311, -2.236145, 1, 0, 0, 1, 1,
-1.830168, 1.08369, -1.976035, 1, 0, 0, 1, 1,
-1.815649, 1.544509, -1.327306, 1, 0, 0, 1, 1,
-1.811883, 0.003257733, -2.269351, 1, 0, 0, 1, 1,
-1.807892, 2.150857, -1.469511, 0, 0, 0, 1, 1,
-1.785526, -0.007553276, -0.7681081, 0, 0, 0, 1, 1,
-1.77347, -0.5434832, 0.6374024, 0, 0, 0, 1, 1,
-1.770586, 0.1419234, -2.857379, 0, 0, 0, 1, 1,
-1.766988, 1.230238, -1.120729, 0, 0, 0, 1, 1,
-1.763577, -1.301396, -1.267472, 0, 0, 0, 1, 1,
-1.75499, -0.7524018, -2.391152, 0, 0, 0, 1, 1,
-1.751974, -2.042135, -1.46676, 1, 1, 1, 1, 1,
-1.723604, -1.56397, -2.94081, 1, 1, 1, 1, 1,
-1.722498, 0.07292112, -0.909573, 1, 1, 1, 1, 1,
-1.721764, 0.4817791, -0.7031116, 1, 1, 1, 1, 1,
-1.719419, 1.337713, -1.342762, 1, 1, 1, 1, 1,
-1.718593, 1.966105, -0.9547621, 1, 1, 1, 1, 1,
-1.716368, 0.1807047, -1.231599, 1, 1, 1, 1, 1,
-1.716254, 1.494961, -1.330504, 1, 1, 1, 1, 1,
-1.706051, -1.263582, -2.731469, 1, 1, 1, 1, 1,
-1.704463, -0.8182596, -0.323947, 1, 1, 1, 1, 1,
-1.673537, -1.230503, -2.960792, 1, 1, 1, 1, 1,
-1.664236, 1.224744, 1.191108, 1, 1, 1, 1, 1,
-1.651711, 0.7186956, -0.9997565, 1, 1, 1, 1, 1,
-1.640094, -1.198432, -2.393286, 1, 1, 1, 1, 1,
-1.617858, 0.9923986, -2.399142, 1, 1, 1, 1, 1,
-1.60974, -0.3465396, -2.10599, 0, 0, 1, 1, 1,
-1.607704, 0.5656773, -1.937198, 1, 0, 0, 1, 1,
-1.586318, 2.231203, 0.4622552, 1, 0, 0, 1, 1,
-1.556647, -1.642479, -3.655899, 1, 0, 0, 1, 1,
-1.543354, -0.05607685, -2.069218, 1, 0, 0, 1, 1,
-1.542179, -1.729947, -2.891946, 1, 0, 0, 1, 1,
-1.541631, -0.01345409, -0.769089, 0, 0, 0, 1, 1,
-1.530105, -0.8363845, -1.286727, 0, 0, 0, 1, 1,
-1.509104, -1.266243, -2.555435, 0, 0, 0, 1, 1,
-1.492305, -0.2423756, -1.793335, 0, 0, 0, 1, 1,
-1.487929, -0.3058248, -1.234862, 0, 0, 0, 1, 1,
-1.477854, -1.434474, -2.654843, 0, 0, 0, 1, 1,
-1.457993, -1.691774, -1.362581, 0, 0, 0, 1, 1,
-1.453191, 0.03519845, -2.363641, 1, 1, 1, 1, 1,
-1.443622, -0.3702818, -3.183152, 1, 1, 1, 1, 1,
-1.440402, 0.2047996, -1.529841, 1, 1, 1, 1, 1,
-1.435843, 1.183915, -0.8699202, 1, 1, 1, 1, 1,
-1.429522, -0.5450633, -0.8178331, 1, 1, 1, 1, 1,
-1.427678, 1.055304, -0.05361025, 1, 1, 1, 1, 1,
-1.419662, -0.1073888, -2.666167, 1, 1, 1, 1, 1,
-1.409075, -0.5091356, -3.672579, 1, 1, 1, 1, 1,
-1.406319, 0.3250093, -3.283293, 1, 1, 1, 1, 1,
-1.396361, -0.3596115, -1.985037, 1, 1, 1, 1, 1,
-1.3946, -0.3277161, -2.049202, 1, 1, 1, 1, 1,
-1.356345, -0.7120489, -1.666851, 1, 1, 1, 1, 1,
-1.35576, 1.72375, -0.6746114, 1, 1, 1, 1, 1,
-1.346692, 0.5381359, -0.7348348, 1, 1, 1, 1, 1,
-1.346612, -0.3310897, -0.3632341, 1, 1, 1, 1, 1,
-1.33285, -0.136181, -1.831909, 0, 0, 1, 1, 1,
-1.326965, -0.6798663, -4.428891, 1, 0, 0, 1, 1,
-1.324913, -0.7048839, -0.7712864, 1, 0, 0, 1, 1,
-1.324435, -0.0148526, -1.406522, 1, 0, 0, 1, 1,
-1.324147, 0.752687, 0.844026, 1, 0, 0, 1, 1,
-1.32181, -0.0280728, -1.880738, 1, 0, 0, 1, 1,
-1.318235, -0.644663, -1.439762, 0, 0, 0, 1, 1,
-1.313136, -0.5766265, -1.836637, 0, 0, 0, 1, 1,
-1.288459, -0.6093058, -0.9942212, 0, 0, 0, 1, 1,
-1.287082, 1.569992, -2.047634, 0, 0, 0, 1, 1,
-1.286406, -2.058721, -2.891119, 0, 0, 0, 1, 1,
-1.280052, -1.14364, -3.13816, 0, 0, 0, 1, 1,
-1.275364, -0.9003077, -3.534514, 0, 0, 0, 1, 1,
-1.269919, -0.5080318, -2.465009, 1, 1, 1, 1, 1,
-1.265164, -1.356018, -1.134875, 1, 1, 1, 1, 1,
-1.261777, 1.385608, -1.699435, 1, 1, 1, 1, 1,
-1.258497, -0.6110241, -1.295658, 1, 1, 1, 1, 1,
-1.254917, -0.3961585, -4.067919, 1, 1, 1, 1, 1,
-1.253094, -1.138215, -1.814954, 1, 1, 1, 1, 1,
-1.24121, -1.600765, -2.172837, 1, 1, 1, 1, 1,
-1.236798, -0.4003491, -0.7376929, 1, 1, 1, 1, 1,
-1.230616, 0.04408072, -2.185163, 1, 1, 1, 1, 1,
-1.23052, 0.3498094, -0.9908158, 1, 1, 1, 1, 1,
-1.229325, 0.4213378, -1.810316, 1, 1, 1, 1, 1,
-1.216739, -1.608654, -3.329648, 1, 1, 1, 1, 1,
-1.207566, 0.1059598, -1.399875, 1, 1, 1, 1, 1,
-1.190009, 0.3412405, -1.117875, 1, 1, 1, 1, 1,
-1.184985, 0.07707994, -2.937726, 1, 1, 1, 1, 1,
-1.184726, -2.430516, -2.997682, 0, 0, 1, 1, 1,
-1.17342, -0.4811724, -3.299886, 1, 0, 0, 1, 1,
-1.166748, -0.1799326, -2.822995, 1, 0, 0, 1, 1,
-1.165322, -0.4254599, -2.683086, 1, 0, 0, 1, 1,
-1.157333, 0.2015097, 0.5944569, 1, 0, 0, 1, 1,
-1.148561, -0.3451485, -0.3481957, 1, 0, 0, 1, 1,
-1.144253, -0.2517233, -2.092413, 0, 0, 0, 1, 1,
-1.143201, 0.5804742, 0.08793948, 0, 0, 0, 1, 1,
-1.138699, -1.47488, -2.262612, 0, 0, 0, 1, 1,
-1.137765, 0.7599123, -1.864505, 0, 0, 0, 1, 1,
-1.121482, -0.06875468, -1.729344, 0, 0, 0, 1, 1,
-1.110293, -0.2481703, -1.876817, 0, 0, 0, 1, 1,
-1.108934, 1.199074, 1.233752, 0, 0, 0, 1, 1,
-1.105566, -0.07925358, -0.4261778, 1, 1, 1, 1, 1,
-1.10437, 1.929466, -1.58748, 1, 1, 1, 1, 1,
-1.09743, -0.09192816, 0.007966612, 1, 1, 1, 1, 1,
-1.092017, -0.9168326, -1.838684, 1, 1, 1, 1, 1,
-1.0893, -1.346635, -1.600994, 1, 1, 1, 1, 1,
-1.070606, -1.249601, -1.417139, 1, 1, 1, 1, 1,
-1.068396, 0.3761015, -0.3616986, 1, 1, 1, 1, 1,
-1.054354, -1.622583, -2.171753, 1, 1, 1, 1, 1,
-1.052604, 0.1905277, -0.1778731, 1, 1, 1, 1, 1,
-1.046845, -0.6936381, -2.596603, 1, 1, 1, 1, 1,
-1.033734, -0.4082358, -0.5888219, 1, 1, 1, 1, 1,
-1.03371, 0.8727923, -1.0351, 1, 1, 1, 1, 1,
-1.030924, -1.939427, -3.338755, 1, 1, 1, 1, 1,
-1.028059, -1.189939, -4.21486, 1, 1, 1, 1, 1,
-1.025881, -0.6878176, -2.629333, 1, 1, 1, 1, 1,
-1.025792, -0.8152511, -3.293342, 0, 0, 1, 1, 1,
-1.020871, -0.8392345, -2.592451, 1, 0, 0, 1, 1,
-1.011468, 0.2823239, -1.166209, 1, 0, 0, 1, 1,
-1.008298, 0.4064712, -1.589295, 1, 0, 0, 1, 1,
-1.00737, 0.6689523, -2.100484, 1, 0, 0, 1, 1,
-1.003393, 1.06146, -0.9851618, 1, 0, 0, 1, 1,
-0.9977541, 0.05034817, -0.7524848, 0, 0, 0, 1, 1,
-0.9971911, -0.9925489, -0.9327798, 0, 0, 0, 1, 1,
-0.9922973, -0.1018856, -2.670006, 0, 0, 0, 1, 1,
-0.9742411, 0.3820026, 0.753166, 0, 0, 0, 1, 1,
-0.9705095, -2.639418, -0.9271616, 0, 0, 0, 1, 1,
-0.9646194, 0.02454114, -1.828337, 0, 0, 0, 1, 1,
-0.9612871, -0.8865991, 0.02747031, 0, 0, 0, 1, 1,
-0.959985, -0.5731776, -2.766021, 1, 1, 1, 1, 1,
-0.9591511, -0.8293326, -1.957267, 1, 1, 1, 1, 1,
-0.956129, -2.40919, -4.083498, 1, 1, 1, 1, 1,
-0.9532072, -0.642655, -3.687618, 1, 1, 1, 1, 1,
-0.9529409, -0.6053098, -2.030979, 1, 1, 1, 1, 1,
-0.952394, -1.284669, -2.900711, 1, 1, 1, 1, 1,
-0.9479277, -0.4325078, -0.9673114, 1, 1, 1, 1, 1,
-0.9459135, -1.711066, -3.110983, 1, 1, 1, 1, 1,
-0.9443681, -2.793556, -2.74248, 1, 1, 1, 1, 1,
-0.9431646, 0.6374699, -1.217511, 1, 1, 1, 1, 1,
-0.9409115, -1.151272, -2.105378, 1, 1, 1, 1, 1,
-0.9408929, -1.493277, -2.161287, 1, 1, 1, 1, 1,
-0.9373263, 0.5056104, -0.565895, 1, 1, 1, 1, 1,
-0.9340125, -1.525361, -2.87485, 1, 1, 1, 1, 1,
-0.9331556, -0.06833515, -1.165908, 1, 1, 1, 1, 1,
-0.9309793, -0.3388381, -1.295429, 0, 0, 1, 1, 1,
-0.9301869, -0.0526475, -1.675673, 1, 0, 0, 1, 1,
-0.927969, -0.4381621, -2.216684, 1, 0, 0, 1, 1,
-0.9101116, -0.7020217, -2.449796, 1, 0, 0, 1, 1,
-0.9017172, -1.289472, -2.822626, 1, 0, 0, 1, 1,
-0.8978393, -0.7597415, -2.806516, 1, 0, 0, 1, 1,
-0.8942389, -0.3279175, -2.795165, 0, 0, 0, 1, 1,
-0.8929843, 0.1515829, -3.843536, 0, 0, 0, 1, 1,
-0.8846831, -0.3788826, -1.433685, 0, 0, 0, 1, 1,
-0.8792285, 0.6513125, -1.384711, 0, 0, 0, 1, 1,
-0.8791762, -0.2528453, -1.522224, 0, 0, 0, 1, 1,
-0.875093, -1.520255, -1.928764, 0, 0, 0, 1, 1,
-0.8709441, 1.064685, -0.9732551, 0, 0, 0, 1, 1,
-0.8705201, 1.388824, -1.768023, 1, 1, 1, 1, 1,
-0.8679096, -0.6534415, -4.875683, 1, 1, 1, 1, 1,
-0.8635346, -0.4350349, -0.979897, 1, 1, 1, 1, 1,
-0.8632503, -0.1234793, -1.11806, 1, 1, 1, 1, 1,
-0.8486538, -0.3631555, -2.188514, 1, 1, 1, 1, 1,
-0.8394157, -2.254105, -3.152469, 1, 1, 1, 1, 1,
-0.8391767, -0.3324766, -3.572402, 1, 1, 1, 1, 1,
-0.8313631, 0.6010267, -1.053626, 1, 1, 1, 1, 1,
-0.8254267, 1.313637, -1.125743, 1, 1, 1, 1, 1,
-0.8236123, 0.209788, 0.2832823, 1, 1, 1, 1, 1,
-0.8212416, -0.2892807, -1.78753, 1, 1, 1, 1, 1,
-0.8116555, 0.3539425, -2.150934, 1, 1, 1, 1, 1,
-0.8107995, 1.516782, -0.6064687, 1, 1, 1, 1, 1,
-0.8093117, 2.073976, -1.095675, 1, 1, 1, 1, 1,
-0.8079178, -0.2311233, -3.206566, 1, 1, 1, 1, 1,
-0.8067028, -0.2993236, -2.913094, 0, 0, 1, 1, 1,
-0.800151, 0.1573143, -1.711607, 1, 0, 0, 1, 1,
-0.7990828, 0.2513729, -0.3778156, 1, 0, 0, 1, 1,
-0.7931703, 0.9904199, 0.1321931, 1, 0, 0, 1, 1,
-0.7914778, 0.2453884, 0.06253613, 1, 0, 0, 1, 1,
-0.7890957, 1.763407, -0.000857366, 1, 0, 0, 1, 1,
-0.7872818, -0.3271878, -2.606754, 0, 0, 0, 1, 1,
-0.786302, -1.135246, -1.242485, 0, 0, 0, 1, 1,
-0.7853762, 0.4219829, -0.9886377, 0, 0, 0, 1, 1,
-0.784489, -0.3589344, -1.643901, 0, 0, 0, 1, 1,
-0.7823872, 0.1434481, -1.236098, 0, 0, 0, 1, 1,
-0.7822236, -0.4474699, -1.835241, 0, 0, 0, 1, 1,
-0.7811036, 0.4855345, -2.232962, 0, 0, 0, 1, 1,
-0.7709863, 1.000702, -0.7674774, 1, 1, 1, 1, 1,
-0.7701907, 1.571583, -0.01262334, 1, 1, 1, 1, 1,
-0.7688898, 2.057923, 0.2412885, 1, 1, 1, 1, 1,
-0.7650447, -1.205388, -2.47233, 1, 1, 1, 1, 1,
-0.7491909, 1.726747, -0.5678304, 1, 1, 1, 1, 1,
-0.7460077, -0.2777129, -3.669489, 1, 1, 1, 1, 1,
-0.7457862, 0.6001869, 0.0943997, 1, 1, 1, 1, 1,
-0.7455812, -1.06794, -4.119277, 1, 1, 1, 1, 1,
-0.743934, -0.160845, -3.163562, 1, 1, 1, 1, 1,
-0.7413329, 0.789252, -1.289035, 1, 1, 1, 1, 1,
-0.7384696, 0.7885233, 0.06270742, 1, 1, 1, 1, 1,
-0.7361652, -3.206423, -4.577983, 1, 1, 1, 1, 1,
-0.7334123, -0.636099, -1.312785, 1, 1, 1, 1, 1,
-0.7286301, -0.03744609, -2.260109, 1, 1, 1, 1, 1,
-0.727997, -0.4928696, -2.929761, 1, 1, 1, 1, 1,
-0.7194493, 0.2538734, -1.278168, 0, 0, 1, 1, 1,
-0.7167086, 1.038383, -2.170892, 1, 0, 0, 1, 1,
-0.7163776, -0.3304229, -4.502637, 1, 0, 0, 1, 1,
-0.7131666, -1.039282, -2.886244, 1, 0, 0, 1, 1,
-0.7123026, 0.9287443, -2.176441, 1, 0, 0, 1, 1,
-0.7116688, 1.113412, -1.057661, 1, 0, 0, 1, 1,
-0.6955337, 0.8555243, -0.3900006, 0, 0, 0, 1, 1,
-0.6929147, -0.4876395, -2.276804, 0, 0, 0, 1, 1,
-0.6914735, -0.3553743, -2.131735, 0, 0, 0, 1, 1,
-0.6901349, -1.255345, -4.088255, 0, 0, 0, 1, 1,
-0.689661, 0.2326261, -2.682461, 0, 0, 0, 1, 1,
-0.6879256, 1.533738, 0.2826349, 0, 0, 0, 1, 1,
-0.6860614, 1.204571, 0.7167682, 0, 0, 0, 1, 1,
-0.6828981, 1.421845, -0.6223038, 1, 1, 1, 1, 1,
-0.681448, 0.1177518, -2.186744, 1, 1, 1, 1, 1,
-0.6787322, -0.01554684, -1.587408, 1, 1, 1, 1, 1,
-0.6762066, 1.970611, -1.562479, 1, 1, 1, 1, 1,
-0.6733519, -0.1247639, -2.432123, 1, 1, 1, 1, 1,
-0.6731403, -2.153067, -2.865961, 1, 1, 1, 1, 1,
-0.6633751, -1.031723, -1.191566, 1, 1, 1, 1, 1,
-0.6579152, 1.019579, -1.619521, 1, 1, 1, 1, 1,
-0.6570429, 0.7110717, 0.1588302, 1, 1, 1, 1, 1,
-0.6568642, -0.6864828, -1.498862, 1, 1, 1, 1, 1,
-0.6490973, 0.6329184, -1.457026, 1, 1, 1, 1, 1,
-0.6469567, -0.2090585, -0.6164795, 1, 1, 1, 1, 1,
-0.6437636, 0.2995349, -0.5698975, 1, 1, 1, 1, 1,
-0.6373832, -0.822243, -2.584439, 1, 1, 1, 1, 1,
-0.6354089, 0.7028306, -2.117287, 1, 1, 1, 1, 1,
-0.6316878, -1.294608, -1.620834, 0, 0, 1, 1, 1,
-0.6306687, 0.3145988, -0.07691673, 1, 0, 0, 1, 1,
-0.627912, 0.06374101, -3.202559, 1, 0, 0, 1, 1,
-0.627389, 0.6591638, -1.54524, 1, 0, 0, 1, 1,
-0.6262774, 0.1260032, -0.9513646, 1, 0, 0, 1, 1,
-0.623004, -0.5307704, -1.060264, 1, 0, 0, 1, 1,
-0.6197845, -1.206358, -1.190261, 0, 0, 0, 1, 1,
-0.6173829, -2.297977, -3.628114, 0, 0, 0, 1, 1,
-0.6167136, 0.6709136, -1.621047, 0, 0, 0, 1, 1,
-0.60956, -3.242223, -3.928333, 0, 0, 0, 1, 1,
-0.608449, -0.264342, -1.045835, 0, 0, 0, 1, 1,
-0.6076925, -0.3157064, -1.652245, 0, 0, 0, 1, 1,
-0.6073833, 0.7587345, 0.8912171, 0, 0, 0, 1, 1,
-0.6045325, 1.677953, 1.330639, 1, 1, 1, 1, 1,
-0.6031765, 0.9243636, -0.8040864, 1, 1, 1, 1, 1,
-0.6006075, 0.1197484, -1.075606, 1, 1, 1, 1, 1,
-0.5984699, 0.6368596, 0.5031609, 1, 1, 1, 1, 1,
-0.5950927, 2.907484, 1.068405, 1, 1, 1, 1, 1,
-0.5901394, 0.7163331, 0.07909991, 1, 1, 1, 1, 1,
-0.5889409, 0.3706729, -0.3453803, 1, 1, 1, 1, 1,
-0.5831067, -0.9603711, -1.318905, 1, 1, 1, 1, 1,
-0.580321, -0.7826229, -1.959266, 1, 1, 1, 1, 1,
-0.5784984, 1.27996, 0.5974525, 1, 1, 1, 1, 1,
-0.5761863, -0.9347774, -2.240359, 1, 1, 1, 1, 1,
-0.572906, -0.4739868, -2.655581, 1, 1, 1, 1, 1,
-0.5705147, 1.617868, 0.04513831, 1, 1, 1, 1, 1,
-0.5677475, -0.1411761, -1.864017, 1, 1, 1, 1, 1,
-0.5675858, -0.06549864, -2.140537, 1, 1, 1, 1, 1,
-0.5648042, 0.1433045, -1.069937, 0, 0, 1, 1, 1,
-0.5633715, -0.3334593, -1.533992, 1, 0, 0, 1, 1,
-0.5626867, 1.526707, -0.7423953, 1, 0, 0, 1, 1,
-0.5624853, -1.972448, -3.511748, 1, 0, 0, 1, 1,
-0.5556463, -0.9417597, -1.873579, 1, 0, 0, 1, 1,
-0.5537242, 0.456268, -0.9351144, 1, 0, 0, 1, 1,
-0.552391, 0.3645187, -0.9596167, 0, 0, 0, 1, 1,
-0.5487443, -0.02793685, -2.092839, 0, 0, 0, 1, 1,
-0.548146, 0.4724048, -2.322459, 0, 0, 0, 1, 1,
-0.5437367, 0.2350063, -2.004953, 0, 0, 0, 1, 1,
-0.543301, 1.124292, -0.7375013, 0, 0, 0, 1, 1,
-0.5424033, -0.9877279, -3.745384, 0, 0, 0, 1, 1,
-0.5420333, 1.98627, 0.8761759, 0, 0, 0, 1, 1,
-0.5350639, 0.7452722, -1.31282, 1, 1, 1, 1, 1,
-0.5319101, 0.7691693, -0.6981897, 1, 1, 1, 1, 1,
-0.5313143, 0.03188907, -2.34234, 1, 1, 1, 1, 1,
-0.5307416, -1.550902, -2.530079, 1, 1, 1, 1, 1,
-0.52824, -0.3074104, -1.981555, 1, 1, 1, 1, 1,
-0.5257819, 0.387443, -0.1019062, 1, 1, 1, 1, 1,
-0.5229055, -0.8391433, -1.194132, 1, 1, 1, 1, 1,
-0.515393, 0.8213886, -1.37269, 1, 1, 1, 1, 1,
-0.5141225, 0.1764841, -1.657627, 1, 1, 1, 1, 1,
-0.5054926, 0.7938137, 0.1534569, 1, 1, 1, 1, 1,
-0.5030928, 0.02299928, -1.97637, 1, 1, 1, 1, 1,
-0.5012977, -1.105121, -4.184793, 1, 1, 1, 1, 1,
-0.5009471, -0.1320844, -2.065287, 1, 1, 1, 1, 1,
-0.5008413, 0.05436109, 1.510413, 1, 1, 1, 1, 1,
-0.4988777, -0.5987715, -2.865461, 1, 1, 1, 1, 1,
-0.4985318, 0.8834763, -0.7453157, 0, 0, 1, 1, 1,
-0.4807365, 0.6274714, -0.2632995, 1, 0, 0, 1, 1,
-0.4748143, 0.4566178, -2.089553, 1, 0, 0, 1, 1,
-0.4745696, -0.20095, -1.396564, 1, 0, 0, 1, 1,
-0.4733103, 0.2960437, -0.3848505, 1, 0, 0, 1, 1,
-0.4732904, -0.5508921, -1.334306, 1, 0, 0, 1, 1,
-0.4660291, 0.2211469, -1.553216, 0, 0, 0, 1, 1,
-0.4627265, -0.3135062, -1.349286, 0, 0, 0, 1, 1,
-0.4588516, -1.747476, -3.219417, 0, 0, 0, 1, 1,
-0.4571471, -2.648252, -3.281065, 0, 0, 0, 1, 1,
-0.4543661, 0.1559736, -1.137717, 0, 0, 0, 1, 1,
-0.4523717, -0.09222769, -0.5934149, 0, 0, 0, 1, 1,
-0.4518845, 2.442918, -0.2112735, 0, 0, 0, 1, 1,
-0.448603, 0.321042, -1.879814, 1, 1, 1, 1, 1,
-0.447795, 0.8399629, -0.8192595, 1, 1, 1, 1, 1,
-0.4472223, 1.261832, -0.4997596, 1, 1, 1, 1, 1,
-0.446876, -0.6961442, -1.598688, 1, 1, 1, 1, 1,
-0.445882, -0.3684844, -2.39715, 1, 1, 1, 1, 1,
-0.4396886, 0.2468468, -2.710639, 1, 1, 1, 1, 1,
-0.4388168, 0.07284211, -1.534549, 1, 1, 1, 1, 1,
-0.4388058, 0.1140883, -2.590216, 1, 1, 1, 1, 1,
-0.437156, -0.1013368, -0.2020479, 1, 1, 1, 1, 1,
-0.4356404, 0.0251156, -2.252191, 1, 1, 1, 1, 1,
-0.4351079, 0.1593321, -0.7290351, 1, 1, 1, 1, 1,
-0.4274822, 0.60453, 1.141076, 1, 1, 1, 1, 1,
-0.4249856, -1.904643, -1.395476, 1, 1, 1, 1, 1,
-0.4243672, 0.7142837, -1.525544, 1, 1, 1, 1, 1,
-0.4204573, 1.148447, -2.130207, 1, 1, 1, 1, 1,
-0.4185542, 1.203426, -0.1280557, 0, 0, 1, 1, 1,
-0.4182879, -0.4885359, -4.384494, 1, 0, 0, 1, 1,
-0.4180743, -0.739486, -2.071684, 1, 0, 0, 1, 1,
-0.4173706, -0.1943361, -3.498696, 1, 0, 0, 1, 1,
-0.4170291, -1.097727, -1.475851, 1, 0, 0, 1, 1,
-0.4154725, 1.264008, -1.277049, 1, 0, 0, 1, 1,
-0.4106732, 1.085097, 1.030589, 0, 0, 0, 1, 1,
-0.4082146, 0.9782603, -0.6133976, 0, 0, 0, 1, 1,
-0.4062847, -0.3873425, -2.42968, 0, 0, 0, 1, 1,
-0.4047971, -0.8454647, -3.005246, 0, 0, 0, 1, 1,
-0.404436, 0.8093393, -1.984287, 0, 0, 0, 1, 1,
-0.4017175, -0.4189442, -2.417733, 0, 0, 0, 1, 1,
-0.4001105, 0.3779232, -1.331168, 0, 0, 0, 1, 1,
-0.3994955, 1.722012, -0.05069268, 1, 1, 1, 1, 1,
-0.3956047, -0.5936052, -3.053987, 1, 1, 1, 1, 1,
-0.3915656, -1.321729, -2.389675, 1, 1, 1, 1, 1,
-0.3897552, -0.9027846, -3.196324, 1, 1, 1, 1, 1,
-0.3888979, 0.6745095, 0.312227, 1, 1, 1, 1, 1,
-0.3885822, 1.718664, -1.549509, 1, 1, 1, 1, 1,
-0.3872993, 1.836902, -0.4674281, 1, 1, 1, 1, 1,
-0.385478, -0.3344593, -1.706294, 1, 1, 1, 1, 1,
-0.3777107, 0.2430723, 0.07433393, 1, 1, 1, 1, 1,
-0.3753938, 1.261602, 0.8180286, 1, 1, 1, 1, 1,
-0.3736752, 0.3205919, -2.584589, 1, 1, 1, 1, 1,
-0.3734551, 1.989154, 1.1359, 1, 1, 1, 1, 1,
-0.3724208, 1.563736, -0.1597507, 1, 1, 1, 1, 1,
-0.3723494, -0.8262698, -1.925277, 1, 1, 1, 1, 1,
-0.3705777, -0.8318458, -3.030152, 1, 1, 1, 1, 1,
-0.366802, 0.8045981, 0.1722803, 0, 0, 1, 1, 1,
-0.3582509, 1.024458, 1.018753, 1, 0, 0, 1, 1,
-0.3572993, 0.2110823, -0.823708, 1, 0, 0, 1, 1,
-0.3561534, 1.695915, -1.547538, 1, 0, 0, 1, 1,
-0.3537958, 0.5427641, -0.745346, 1, 0, 0, 1, 1,
-0.3514966, 0.1688481, -1.109283, 1, 0, 0, 1, 1,
-0.3512717, -0.4387577, -1.092029, 0, 0, 0, 1, 1,
-0.348862, 0.2860362, -0.3838925, 0, 0, 0, 1, 1,
-0.3434799, 0.8120453, -1.137207, 0, 0, 0, 1, 1,
-0.3308315, -2.461555, -2.268919, 0, 0, 0, 1, 1,
-0.3290165, -0.9210222, -2.382778, 0, 0, 0, 1, 1,
-0.328008, -0.8085801, -3.430195, 0, 0, 0, 1, 1,
-0.3187532, -0.6990245, -3.549655, 0, 0, 0, 1, 1,
-0.3158177, 1.812701, 1.313541, 1, 1, 1, 1, 1,
-0.3139477, -0.328706, -3.356238, 1, 1, 1, 1, 1,
-0.3135491, 0.1675946, -1.265073, 1, 1, 1, 1, 1,
-0.3090184, -0.4455642, -1.501129, 1, 1, 1, 1, 1,
-0.2948005, -2.145944, -3.705146, 1, 1, 1, 1, 1,
-0.287444, -0.1544293, -3.959078, 1, 1, 1, 1, 1,
-0.2762368, -0.2992817, -1.685236, 1, 1, 1, 1, 1,
-0.2679856, -0.1560884, -2.819381, 1, 1, 1, 1, 1,
-0.2655604, 2.519849, 0.4864234, 1, 1, 1, 1, 1,
-0.2605718, 1.132066, 0.3678363, 1, 1, 1, 1, 1,
-0.2567823, 1.030978, -0.7769388, 1, 1, 1, 1, 1,
-0.2535658, -0.1719421, -2.060603, 1, 1, 1, 1, 1,
-0.2483394, -0.8758792, -2.4999, 1, 1, 1, 1, 1,
-0.2473434, -1.791332, -2.59761, 1, 1, 1, 1, 1,
-0.2444747, -0.3840001, -3.962583, 1, 1, 1, 1, 1,
-0.2429534, -1.161318, -3.709512, 0, 0, 1, 1, 1,
-0.2407402, 1.654939, -1.357194, 1, 0, 0, 1, 1,
-0.2403326, 1.94801, 0.4701673, 1, 0, 0, 1, 1,
-0.2332593, 0.3435175, -1.518434, 1, 0, 0, 1, 1,
-0.2312866, -0.2383675, -2.259312, 1, 0, 0, 1, 1,
-0.2312499, 0.152443, -1.532499, 1, 0, 0, 1, 1,
-0.2298596, 0.1333348, 0.3693322, 0, 0, 0, 1, 1,
-0.2294077, -0.8930886, -3.287344, 0, 0, 0, 1, 1,
-0.2284871, -1.588975, -2.7275, 0, 0, 0, 1, 1,
-0.2269807, -0.9551125, -2.917057, 0, 0, 0, 1, 1,
-0.224474, -0.2558236, -2.779049, 0, 0, 0, 1, 1,
-0.2213394, -0.1382616, -2.266592, 0, 0, 0, 1, 1,
-0.2212568, -1.070476, -1.876241, 0, 0, 0, 1, 1,
-0.2134352, 0.8431532, -0.7629237, 1, 1, 1, 1, 1,
-0.2124105, -0.9532151, -3.007001, 1, 1, 1, 1, 1,
-0.2105975, -1.92153, -5.591363, 1, 1, 1, 1, 1,
-0.2087171, -0.7418628, -2.196877, 1, 1, 1, 1, 1,
-0.2044736, -0.09647669, -2.987639, 1, 1, 1, 1, 1,
-0.2040768, -0.1489569, -3.707505, 1, 1, 1, 1, 1,
-0.2028978, -0.5646953, -1.949403, 1, 1, 1, 1, 1,
-0.1990255, -0.5359243, -1.722666, 1, 1, 1, 1, 1,
-0.1979266, 0.423085, -0.639854, 1, 1, 1, 1, 1,
-0.1956311, 1.652647, 0.3192086, 1, 1, 1, 1, 1,
-0.1950711, -0.1898874, -2.214338, 1, 1, 1, 1, 1,
-0.1934798, 0.3660997, 0.1887831, 1, 1, 1, 1, 1,
-0.1865835, 1.487512, -0.09183776, 1, 1, 1, 1, 1,
-0.1810383, 1.480301, -1.291782, 1, 1, 1, 1, 1,
-0.1796809, 1.029754, 0.3224429, 1, 1, 1, 1, 1,
-0.1714336, 0.0004783423, -2.660662, 0, 0, 1, 1, 1,
-0.1670024, 0.7435985, -0.4734834, 1, 0, 0, 1, 1,
-0.1613996, 1.068062, 0.5920728, 1, 0, 0, 1, 1,
-0.1579144, 0.003125518, 0.09630728, 1, 0, 0, 1, 1,
-0.1537633, -1.998921, -4.174272, 1, 0, 0, 1, 1,
-0.1536004, 0.7061998, 0.2096689, 1, 0, 0, 1, 1,
-0.1398405, 1.611835, -0.5174981, 0, 0, 0, 1, 1,
-0.1391495, 0.554465, -0.6442981, 0, 0, 0, 1, 1,
-0.1343068, -0.1546632, -2.223732, 0, 0, 0, 1, 1,
-0.1325699, 0.2339932, 0.1646773, 0, 0, 0, 1, 1,
-0.1308824, 1.158663, 0.354375, 0, 0, 0, 1, 1,
-0.1251027, -1.59437, -2.065002, 0, 0, 0, 1, 1,
-0.1182349, -0.01026572, 0.1887152, 0, 0, 0, 1, 1,
-0.1131407, 1.876006, -0.09837807, 1, 1, 1, 1, 1,
-0.1126487, 0.2868846, 0.09805615, 1, 1, 1, 1, 1,
-0.1119661, 1.471092, 1.121002, 1, 1, 1, 1, 1,
-0.1109279, -0.8880566, -4.130756, 1, 1, 1, 1, 1,
-0.1085414, 0.2238702, -1.585096, 1, 1, 1, 1, 1,
-0.1019743, 0.1750478, 0.8346559, 1, 1, 1, 1, 1,
-0.09671945, 0.3933888, -0.3804319, 1, 1, 1, 1, 1,
-0.09647085, 0.3635819, -1.649246, 1, 1, 1, 1, 1,
-0.09285069, -0.265931, -1.848226, 1, 1, 1, 1, 1,
-0.08824365, -0.1057756, -2.418818, 1, 1, 1, 1, 1,
-0.08115588, -1.834422, -2.633324, 1, 1, 1, 1, 1,
-0.07241248, 0.351897, -0.9239208, 1, 1, 1, 1, 1,
-0.0713015, -0.5831022, -2.512861, 1, 1, 1, 1, 1,
-0.06062764, -1.024922, -2.699543, 1, 1, 1, 1, 1,
-0.0562396, -0.8775072, -4.955639, 1, 1, 1, 1, 1,
-0.05570596, 0.6843027, -0.5020223, 0, 0, 1, 1, 1,
-0.05089529, 0.4710252, -0.2730155, 1, 0, 0, 1, 1,
-0.04916543, -0.9086984, -0.7475403, 1, 0, 0, 1, 1,
-0.04756628, 0.9489074, 0.5818776, 1, 0, 0, 1, 1,
-0.04644577, -0.7552541, -1.938246, 1, 0, 0, 1, 1,
-0.04472731, 1.86073, -1.081044, 1, 0, 0, 1, 1,
-0.04355287, -0.5536559, -3.556371, 0, 0, 0, 1, 1,
-0.04345026, 0.3794604, -2.443621, 0, 0, 0, 1, 1,
-0.04197079, -1.711189, -4.754233, 0, 0, 0, 1, 1,
-0.04103854, -1.020075, -3.328555, 0, 0, 0, 1, 1,
-0.03865914, -0.5426348, -1.701195, 0, 0, 0, 1, 1,
-0.03557843, -1.494499, -2.458985, 0, 0, 0, 1, 1,
-0.0332792, -0.3299658, -2.868149, 0, 0, 0, 1, 1,
-0.03136717, -0.7698095, -3.46464, 1, 1, 1, 1, 1,
-0.03079615, -1.16633, -2.50033, 1, 1, 1, 1, 1,
-0.03011677, 1.422789, -0.6123716, 1, 1, 1, 1, 1,
-0.02521281, -1.307823, -1.646271, 1, 1, 1, 1, 1,
-0.02313749, 0.7402707, 2.310415, 1, 1, 1, 1, 1,
-0.02281447, 1.657114, 0.9629445, 1, 1, 1, 1, 1,
-0.02069817, -0.796681, -4.10343, 1, 1, 1, 1, 1,
-0.02000498, 0.7643986, 1.102583, 1, 1, 1, 1, 1,
-0.01901511, -0.5783749, -3.539636, 1, 1, 1, 1, 1,
-0.01620977, 1.196442, -0.2221391, 1, 1, 1, 1, 1,
-0.01535287, -0.2502397, -2.78082, 1, 1, 1, 1, 1,
-0.01405314, -0.619459, -3.513659, 1, 1, 1, 1, 1,
-0.01392391, -1.147619, -2.108953, 1, 1, 1, 1, 1,
-0.01316451, 1.515235, 0.7027453, 1, 1, 1, 1, 1,
-0.00966658, 1.125065, 1.048168, 1, 1, 1, 1, 1,
-0.009358151, -2.329222, -3.506223, 0, 0, 1, 1, 1,
-0.003687632, 1.874092, -0.6458564, 1, 0, 0, 1, 1,
-0.002155857, -0.7444579, -4.95708, 1, 0, 0, 1, 1,
-0.0009638402, -0.02062354, -2.4554, 1, 0, 0, 1, 1,
-0.0009524254, -0.5754996, -4.539168, 1, 0, 0, 1, 1,
0.004773322, -0.1955981, 3.136288, 1, 0, 0, 1, 1,
0.004857001, 0.6474219, -0.2081818, 0, 0, 0, 1, 1,
0.005078253, 0.1608664, -0.3476113, 0, 0, 0, 1, 1,
0.00628539, -0.3359772, 3.013617, 0, 0, 0, 1, 1,
0.007453073, -0.8363004, 4.302094, 0, 0, 0, 1, 1,
0.008653339, 0.05181412, -0.3973825, 0, 0, 0, 1, 1,
0.01034749, 2.176754, -0.8176105, 0, 0, 0, 1, 1,
0.01176833, 0.6958916, -1.198512, 0, 0, 0, 1, 1,
0.01818028, 0.7152578, 0.5214038, 1, 1, 1, 1, 1,
0.02188553, -0.3525445, 4.190333, 1, 1, 1, 1, 1,
0.02224673, -1.319864, 2.755388, 1, 1, 1, 1, 1,
0.02307383, -0.05983967, 0.8926928, 1, 1, 1, 1, 1,
0.02712202, 1.421058, -1.049947, 1, 1, 1, 1, 1,
0.02985213, -0.4848467, 2.720187, 1, 1, 1, 1, 1,
0.03127608, 1.148537, 0.4299691, 1, 1, 1, 1, 1,
0.03398487, 0.6910697, 0.237466, 1, 1, 1, 1, 1,
0.03512171, -0.03463481, 0.601957, 1, 1, 1, 1, 1,
0.03616425, -1.763581, 3.389464, 1, 1, 1, 1, 1,
0.03637401, 0.3610032, -0.7519487, 1, 1, 1, 1, 1,
0.03808954, -1.339227, 3.687662, 1, 1, 1, 1, 1,
0.04805745, 1.154379, 0.2868495, 1, 1, 1, 1, 1,
0.05151611, -0.4092498, 2.208255, 1, 1, 1, 1, 1,
0.05205268, 3.023483, 0.5180793, 1, 1, 1, 1, 1,
0.05253039, 0.4545306, 0.9317776, 0, 0, 1, 1, 1,
0.05294481, -1.355051, 2.335486, 1, 0, 0, 1, 1,
0.05476126, 1.793421, -0.429652, 1, 0, 0, 1, 1,
0.05679158, 0.6098335, 0.7536824, 1, 0, 0, 1, 1,
0.05681168, 2.47596, -1.474203, 1, 0, 0, 1, 1,
0.0577282, 0.4335833, -1.646126, 1, 0, 0, 1, 1,
0.05876848, 1.993144, -1.899663, 0, 0, 0, 1, 1,
0.06527461, -0.2532569, 1.495374, 0, 0, 0, 1, 1,
0.06775589, -0.84641, 3.402804, 0, 0, 0, 1, 1,
0.06926531, -0.07149571, 2.963789, 0, 0, 0, 1, 1,
0.06943335, -0.9928684, 2.635953, 0, 0, 0, 1, 1,
0.07002801, -0.2901221, 1.853354, 0, 0, 0, 1, 1,
0.0735928, -1.392129, 3.913723, 0, 0, 0, 1, 1,
0.07773179, 0.4751146, 1.903263, 1, 1, 1, 1, 1,
0.08289947, -1.112843, 4.934881, 1, 1, 1, 1, 1,
0.08338605, 2.650129, -1.550541, 1, 1, 1, 1, 1,
0.08499885, -0.1223279, 3.363146, 1, 1, 1, 1, 1,
0.0855825, -0.3411262, 3.066984, 1, 1, 1, 1, 1,
0.08720812, -0.9857158, 2.211234, 1, 1, 1, 1, 1,
0.08861612, -1.412197, 3.377475, 1, 1, 1, 1, 1,
0.09286611, -0.8916587, 3.633919, 1, 1, 1, 1, 1,
0.09394883, -1.129799, 1.926527, 1, 1, 1, 1, 1,
0.09534946, -0.234284, 1.729924, 1, 1, 1, 1, 1,
0.09565534, 1.505996, 2.212366, 1, 1, 1, 1, 1,
0.09622864, -1.713363, 2.794633, 1, 1, 1, 1, 1,
0.09646582, 0.3246846, 1.49543, 1, 1, 1, 1, 1,
0.1017939, -2.017447, 1.73376, 1, 1, 1, 1, 1,
0.1085258, 0.7936616, 0.06700591, 1, 1, 1, 1, 1,
0.1105522, 0.03865919, -0.6599895, 0, 0, 1, 1, 1,
0.1155331, -1.450267, 2.230813, 1, 0, 0, 1, 1,
0.118943, 0.8322789, 1.083797, 1, 0, 0, 1, 1,
0.1193959, 0.6032736, 0.9634376, 1, 0, 0, 1, 1,
0.1239363, 0.4445273, -0.2715886, 1, 0, 0, 1, 1,
0.1255674, -0.3452654, 2.659288, 1, 0, 0, 1, 1,
0.1272231, -0.01159392, 3.058813, 0, 0, 0, 1, 1,
0.1316173, -0.1097622, 2.268606, 0, 0, 0, 1, 1,
0.1359016, -0.6671497, 3.004098, 0, 0, 0, 1, 1,
0.1381222, 0.08407173, 0.8249564, 0, 0, 0, 1, 1,
0.1447866, 1.889781, 0.3454621, 0, 0, 0, 1, 1,
0.1457413, -0.5439024, -0.202828, 0, 0, 0, 1, 1,
0.1464781, -0.1936662, 3.018499, 0, 0, 0, 1, 1,
0.1474878, -0.6325192, 2.840938, 1, 1, 1, 1, 1,
0.1480627, 0.07044476, 2.562299, 1, 1, 1, 1, 1,
0.1504951, -0.5672477, 2.9374, 1, 1, 1, 1, 1,
0.1505436, -0.3630247, 2.646068, 1, 1, 1, 1, 1,
0.1519107, -0.02586501, 2.300447, 1, 1, 1, 1, 1,
0.1523818, -0.06979047, 3.357154, 1, 1, 1, 1, 1,
0.1537487, -0.5444689, 3.116197, 1, 1, 1, 1, 1,
0.1551854, -0.7239882, 2.209813, 1, 1, 1, 1, 1,
0.1582712, -0.9712005, 2.522364, 1, 1, 1, 1, 1,
0.1599867, -0.7671843, 2.054059, 1, 1, 1, 1, 1,
0.1609312, 1.636601, -0.6937422, 1, 1, 1, 1, 1,
0.1627821, -0.6010208, 3.729279, 1, 1, 1, 1, 1,
0.1703591, -0.2268761, 3.155597, 1, 1, 1, 1, 1,
0.1713982, 0.1692093, 0.7006958, 1, 1, 1, 1, 1,
0.1774786, -2.144686, 3.770314, 1, 1, 1, 1, 1,
0.1793307, 1.14369, 1.285572, 0, 0, 1, 1, 1,
0.1838696, -1.154449, 4.173692, 1, 0, 0, 1, 1,
0.1868769, 0.1489446, 1.644998, 1, 0, 0, 1, 1,
0.1871902, 0.4813066, 1.133256, 1, 0, 0, 1, 1,
0.1899515, -0.9236146, 2.02563, 1, 0, 0, 1, 1,
0.1912331, -1.2687, 1.800593, 1, 0, 0, 1, 1,
0.1918037, 0.7359635, 0.2083784, 0, 0, 0, 1, 1,
0.2006551, -0.2708975, 1.324259, 0, 0, 0, 1, 1,
0.2010282, -0.1440822, -0.03106244, 0, 0, 0, 1, 1,
0.2038852, -0.09543509, 1.90958, 0, 0, 0, 1, 1,
0.207145, -1.16163, 3.569667, 0, 0, 0, 1, 1,
0.2099849, -0.6227125, 2.504864, 0, 0, 0, 1, 1,
0.2130329, 0.7038139, 1.160296, 0, 0, 0, 1, 1,
0.215455, -1.260383, 1.453908, 1, 1, 1, 1, 1,
0.2157713, 0.2048374, 0.3148105, 1, 1, 1, 1, 1,
0.2162697, -1.052743, 1.08499, 1, 1, 1, 1, 1,
0.2172402, -0.4127505, 4.392339, 1, 1, 1, 1, 1,
0.2185131, 0.6108798, 0.419875, 1, 1, 1, 1, 1,
0.2197617, 0.1960272, 0.5301448, 1, 1, 1, 1, 1,
0.2218944, 0.06263275, 1.623399, 1, 1, 1, 1, 1,
0.2305432, -2.077588, 4.141008, 1, 1, 1, 1, 1,
0.2337921, 1.720644, -0.5080884, 1, 1, 1, 1, 1,
0.2338041, -0.1323711, 3.767778, 1, 1, 1, 1, 1,
0.2349703, -0.9455373, 2.285721, 1, 1, 1, 1, 1,
0.2382149, -0.4536279, 2.106133, 1, 1, 1, 1, 1,
0.2406905, -0.07443381, 0.4068626, 1, 1, 1, 1, 1,
0.2437054, -0.6868294, 2.73314, 1, 1, 1, 1, 1,
0.2460833, -0.8050154, 1.482386, 1, 1, 1, 1, 1,
0.2558457, -1.024371, 4.090947, 0, 0, 1, 1, 1,
0.2560984, 0.7688193, 2.21146, 1, 0, 0, 1, 1,
0.2576399, -0.211912, 3.31153, 1, 0, 0, 1, 1,
0.2588007, -0.3852128, 3.610953, 1, 0, 0, 1, 1,
0.2588217, -1.519298, 2.267499, 1, 0, 0, 1, 1,
0.261561, -1.930214, 2.846452, 1, 0, 0, 1, 1,
0.2644572, -1.051553, 3.405518, 0, 0, 0, 1, 1,
0.2695827, -0.8761174, 3.321719, 0, 0, 0, 1, 1,
0.2714439, -0.6965763, 2.702784, 0, 0, 0, 1, 1,
0.2716448, -1.622794, 2.887952, 0, 0, 0, 1, 1,
0.2722022, 0.7407017, 0.3475626, 0, 0, 0, 1, 1,
0.2744968, -1.709486, 3.430278, 0, 0, 0, 1, 1,
0.2776992, -1.439278, 4.073088, 0, 0, 0, 1, 1,
0.2785807, -0.3557706, 1.126025, 1, 1, 1, 1, 1,
0.2810821, -0.5115861, 1.831183, 1, 1, 1, 1, 1,
0.2866149, 0.8333201, 0.01262061, 1, 1, 1, 1, 1,
0.2901295, 0.05329767, 1.838741, 1, 1, 1, 1, 1,
0.2931525, 1.586556, -1.957499, 1, 1, 1, 1, 1,
0.2940172, 0.5516702, 0.7695031, 1, 1, 1, 1, 1,
0.2949, 0.8760664, 1.328954, 1, 1, 1, 1, 1,
0.3073648, -1.20268, 3.14612, 1, 1, 1, 1, 1,
0.3143501, -0.6779488, 1.846599, 1, 1, 1, 1, 1,
0.3143752, 0.4352779, -0.4219082, 1, 1, 1, 1, 1,
0.3171876, -0.3329658, 0.9816831, 1, 1, 1, 1, 1,
0.3219793, -0.8508546, 3.995987, 1, 1, 1, 1, 1,
0.3224042, 0.1079414, 1.356049, 1, 1, 1, 1, 1,
0.3259443, 0.1858474, 2.515264, 1, 1, 1, 1, 1,
0.3345296, 0.6652811, 0.3740922, 1, 1, 1, 1, 1,
0.3352917, 0.4140179, 1.363636, 0, 0, 1, 1, 1,
0.3370104, -1.929026, 3.780211, 1, 0, 0, 1, 1,
0.3428845, -0.1986653, 3.305391, 1, 0, 0, 1, 1,
0.3485312, -0.4094059, 1.368531, 1, 0, 0, 1, 1,
0.3497377, -1.797053, 2.514957, 1, 0, 0, 1, 1,
0.3541821, -0.5659946, 1.492912, 1, 0, 0, 1, 1,
0.354242, -0.08326204, 1.160429, 0, 0, 0, 1, 1,
0.3552052, 1.703683, -0.5482554, 0, 0, 0, 1, 1,
0.3565279, -1.407655, 2.894825, 0, 0, 0, 1, 1,
0.3569025, -0.6266816, 1.51723, 0, 0, 0, 1, 1,
0.3578295, 0.9861754, -0.6377969, 0, 0, 0, 1, 1,
0.3588978, -2.167577, 2.84095, 0, 0, 0, 1, 1,
0.3593932, 0.5334914, 0.6085199, 0, 0, 0, 1, 1,
0.364606, 0.1550214, 0.8385201, 1, 1, 1, 1, 1,
0.3646593, -0.9336167, 2.49288, 1, 1, 1, 1, 1,
0.3703765, 2.022604, -0.1959249, 1, 1, 1, 1, 1,
0.3719121, -0.9917403, 2.537065, 1, 1, 1, 1, 1,
0.381395, 2.029182, 1.840439, 1, 1, 1, 1, 1,
0.3888734, 0.6287776, 0.4530009, 1, 1, 1, 1, 1,
0.3919943, 0.8792979, -1.495555, 1, 1, 1, 1, 1,
0.3947597, -0.6980641, 3.295771, 1, 1, 1, 1, 1,
0.3964568, 0.356309, 0.04664059, 1, 1, 1, 1, 1,
0.399933, -1.21417, 2.428118, 1, 1, 1, 1, 1,
0.400096, -0.6218867, 0.989951, 1, 1, 1, 1, 1,
0.400637, 0.01449816, 1.822648, 1, 1, 1, 1, 1,
0.4019853, 0.1979885, 1.280303, 1, 1, 1, 1, 1,
0.4053721, 0.5573715, 3.140443, 1, 1, 1, 1, 1,
0.4076292, -0.09096205, 0.7120581, 1, 1, 1, 1, 1,
0.4115512, -0.2455603, 2.821351, 0, 0, 1, 1, 1,
0.4135414, 1.978423, 0.4595998, 1, 0, 0, 1, 1,
0.4140449, -0.3285662, 2.241258, 1, 0, 0, 1, 1,
0.41515, 1.488438, -0.8182616, 1, 0, 0, 1, 1,
0.4189756, -1.370097, 4.144663, 1, 0, 0, 1, 1,
0.4268759, -0.4882418, 2.668668, 1, 0, 0, 1, 1,
0.4273838, -0.9689796, 1.846147, 0, 0, 0, 1, 1,
0.4280769, 1.280487, 2.180868, 0, 0, 0, 1, 1,
0.4350921, 0.09929982, 1.526782, 0, 0, 0, 1, 1,
0.4370911, -0.7789865, 3.498503, 0, 0, 0, 1, 1,
0.4383987, 0.6493258, 1.637259, 0, 0, 0, 1, 1,
0.4413747, -0.1995873, 2.325371, 0, 0, 0, 1, 1,
0.4427484, 0.6469163, 1.178258, 0, 0, 0, 1, 1,
0.4464163, -0.4668915, 3.196381, 1, 1, 1, 1, 1,
0.4476347, 0.4320906, 0.7797688, 1, 1, 1, 1, 1,
0.448116, -0.4082699, 2.016785, 1, 1, 1, 1, 1,
0.4620196, -0.1321943, -0.04680264, 1, 1, 1, 1, 1,
0.4642107, 1.299265, 0.2873237, 1, 1, 1, 1, 1,
0.4659911, 0.1317126, 1.366575, 1, 1, 1, 1, 1,
0.4664225, -0.06248895, 3.303176, 1, 1, 1, 1, 1,
0.4675567, 1.818229, -0.2978599, 1, 1, 1, 1, 1,
0.4682542, -0.3551216, 0.7893898, 1, 1, 1, 1, 1,
0.4696192, -0.9622554, 1.28959, 1, 1, 1, 1, 1,
0.4704109, -0.6318573, 3.324423, 1, 1, 1, 1, 1,
0.4712323, -1.159027, 2.759772, 1, 1, 1, 1, 1,
0.4712337, -1.172545, 3.574659, 1, 1, 1, 1, 1,
0.4714586, 0.5047049, -1.010331, 1, 1, 1, 1, 1,
0.4735032, -0.450341, 2.524167, 1, 1, 1, 1, 1,
0.474016, 0.3642901, 1.654993, 0, 0, 1, 1, 1,
0.4785968, -0.6698354, 2.504656, 1, 0, 0, 1, 1,
0.4851841, 1.19465, 0.4511215, 1, 0, 0, 1, 1,
0.4893117, -0.4941689, 2.902787, 1, 0, 0, 1, 1,
0.4949363, -1.549762, 2.281239, 1, 0, 0, 1, 1,
0.4958623, -0.7131154, 3.389924, 1, 0, 0, 1, 1,
0.4965792, -1.851786, 2.725347, 0, 0, 0, 1, 1,
0.4977908, -1.501338, 3.077799, 0, 0, 0, 1, 1,
0.499957, 0.3251336, 3.101105, 0, 0, 0, 1, 1,
0.501955, -1.136398, 2.750639, 0, 0, 0, 1, 1,
0.5024976, 0.08726113, 1.7134, 0, 0, 0, 1, 1,
0.5078112, -0.3108934, 3.041805, 0, 0, 0, 1, 1,
0.5104101, -1.285126, 2.651968, 0, 0, 0, 1, 1,
0.5125827, -0.498645, 1.44547, 1, 1, 1, 1, 1,
0.5128599, -1.210754, 1.825693, 1, 1, 1, 1, 1,
0.5130663, 1.35507, 0.1506201, 1, 1, 1, 1, 1,
0.5135983, 0.9766477, -0.9034328, 1, 1, 1, 1, 1,
0.5167086, -0.682398, 2.334678, 1, 1, 1, 1, 1,
0.5178472, -0.4172707, 3.799427, 1, 1, 1, 1, 1,
0.518944, -1.437371, 1.161754, 1, 1, 1, 1, 1,
0.5210975, 2.169855, 0.6765554, 1, 1, 1, 1, 1,
0.5235337, 0.7265307, -1.134177, 1, 1, 1, 1, 1,
0.5250512, 0.7253819, 0.3578568, 1, 1, 1, 1, 1,
0.5253387, 0.4208394, 2.0193, 1, 1, 1, 1, 1,
0.5309764, 0.7470502, 1.200215, 1, 1, 1, 1, 1,
0.5321435, 1.530189, -0.407732, 1, 1, 1, 1, 1,
0.532802, -1.560107, 3.265711, 1, 1, 1, 1, 1,
0.5345727, 0.5129221, 0.1155487, 1, 1, 1, 1, 1,
0.5346628, 1.55004, -0.7773414, 0, 0, 1, 1, 1,
0.5367031, 1.306112, 0.6710407, 1, 0, 0, 1, 1,
0.5369229, -0.7290282, 2.954058, 1, 0, 0, 1, 1,
0.5405889, -0.1746079, 1.580615, 1, 0, 0, 1, 1,
0.5407867, 0.8611259, 0.8004993, 1, 0, 0, 1, 1,
0.5415325, 0.9202419, 1.084628, 1, 0, 0, 1, 1,
0.5431612, 0.4779182, 1.903379, 0, 0, 0, 1, 1,
0.5463638, 1.109594, 0.3415177, 0, 0, 0, 1, 1,
0.5487144, -0.173455, -0.5274538, 0, 0, 0, 1, 1,
0.5508363, -0.1700068, 0.7201235, 0, 0, 0, 1, 1,
0.5545416, 1.895393, -0.08010747, 0, 0, 0, 1, 1,
0.5549039, -0.2962543, 1.312161, 0, 0, 0, 1, 1,
0.5639376, 1.443815, 0.2984214, 0, 0, 0, 1, 1,
0.5690652, 0.744216, -0.1631128, 1, 1, 1, 1, 1,
0.5708947, -1.416428, 2.466418, 1, 1, 1, 1, 1,
0.5758002, -0.1719973, 1.838558, 1, 1, 1, 1, 1,
0.5782168, 0.3924381, 0.2431089, 1, 1, 1, 1, 1,
0.5794696, 0.8701498, 1.415111, 1, 1, 1, 1, 1,
0.582062, -0.1620542, 3.384011, 1, 1, 1, 1, 1,
0.5832111, -0.2555877, 0.6310222, 1, 1, 1, 1, 1,
0.5858429, -1.045264, 3.239466, 1, 1, 1, 1, 1,
0.5865936, -0.8552803, 3.388078, 1, 1, 1, 1, 1,
0.5904021, -1.420907, 1.53234, 1, 1, 1, 1, 1,
0.6103916, 0.4633795, 2.750339, 1, 1, 1, 1, 1,
0.611868, 0.5425844, 0.1757396, 1, 1, 1, 1, 1,
0.6130468, -0.6478323, 1.242382, 1, 1, 1, 1, 1,
0.6140854, -0.1830707, 2.574086, 1, 1, 1, 1, 1,
0.6144918, 0.6160944, -0.9475145, 1, 1, 1, 1, 1,
0.6147562, -0.8502858, 1.321862, 0, 0, 1, 1, 1,
0.6171796, 1.340229, 0.9202238, 1, 0, 0, 1, 1,
0.6182355, -1.024287, 3.620992, 1, 0, 0, 1, 1,
0.6203826, -0.3015673, 1.982117, 1, 0, 0, 1, 1,
0.6204296, 0.4956037, -0.4723538, 1, 0, 0, 1, 1,
0.6263256, -0.3858051, 1.29049, 1, 0, 0, 1, 1,
0.6267384, -0.02926384, 0.4262531, 0, 0, 0, 1, 1,
0.6277618, 0.3652176, 1.423806, 0, 0, 0, 1, 1,
0.6294484, -0.3312418, 1.412117, 0, 0, 0, 1, 1,
0.6320912, -1.435914, 1.983811, 0, 0, 0, 1, 1,
0.6323367, 0.9630728, 0.9994456, 0, 0, 0, 1, 1,
0.635252, 0.6685951, -0.3094562, 0, 0, 0, 1, 1,
0.6391925, -1.187846, 2.267259, 0, 0, 0, 1, 1,
0.6496909, 0.4719672, 0.993971, 1, 1, 1, 1, 1,
0.6497847, -0.2219366, 2.21484, 1, 1, 1, 1, 1,
0.6522546, 0.6973907, -0.5217403, 1, 1, 1, 1, 1,
0.6558924, 0.0946544, 2.57563, 1, 1, 1, 1, 1,
0.6604782, 1.404845, 0.2802703, 1, 1, 1, 1, 1,
0.6618649, 0.3035309, 1.807529, 1, 1, 1, 1, 1,
0.6622346, -1.055993, 5.099438, 1, 1, 1, 1, 1,
0.6641202, -0.104582, 2.460378, 1, 1, 1, 1, 1,
0.6680444, -0.5691611, 2.265625, 1, 1, 1, 1, 1,
0.668955, -1.105745, 2.567715, 1, 1, 1, 1, 1,
0.6699378, -0.2398371, 2.659193, 1, 1, 1, 1, 1,
0.6708637, 0.4133004, 0.8159204, 1, 1, 1, 1, 1,
0.6769337, 1.283558, 0.4133234, 1, 1, 1, 1, 1,
0.6771402, -0.3858763, 3.289167, 1, 1, 1, 1, 1,
0.6773357, -1.677671, 2.873054, 1, 1, 1, 1, 1,
0.6786223, 0.4604278, 1.028991, 0, 0, 1, 1, 1,
0.6846516, 0.7640094, 1.896686, 1, 0, 0, 1, 1,
0.690624, -0.9777951, 2.387529, 1, 0, 0, 1, 1,
0.6908963, 0.2157364, 1.119939, 1, 0, 0, 1, 1,
0.6911982, 1.285288, -0.1218594, 1, 0, 0, 1, 1,
0.692956, 0.8533242, 1.067575, 1, 0, 0, 1, 1,
0.6969478, -0.2996935, 2.719927, 0, 0, 0, 1, 1,
0.7004502, -1.247037, 0.3115408, 0, 0, 0, 1, 1,
0.7130721, -0.3081977, 2.532355, 0, 0, 0, 1, 1,
0.7174764, 0.2480644, 1.807651, 0, 0, 0, 1, 1,
0.731568, -0.1724555, 1.211617, 0, 0, 0, 1, 1,
0.7556707, 0.3882937, 1.158909, 0, 0, 0, 1, 1,
0.7561618, 0.1912914, 0.6638519, 0, 0, 0, 1, 1,
0.7575967, -0.08783894, 2.706886, 1, 1, 1, 1, 1,
0.7580777, 0.9696062, -0.2486511, 1, 1, 1, 1, 1,
0.7702011, 0.2278932, 0.02401472, 1, 1, 1, 1, 1,
0.7719414, 0.4843567, 1.11261, 1, 1, 1, 1, 1,
0.7757215, 1.261099, 1.500489, 1, 1, 1, 1, 1,
0.7811447, -0.2291446, 0.7440868, 1, 1, 1, 1, 1,
0.7812074, -0.5541543, 0.3926384, 1, 1, 1, 1, 1,
0.7835157, 0.9336931, -1.385994, 1, 1, 1, 1, 1,
0.786393, 0.04570601, 2.973438, 1, 1, 1, 1, 1,
0.7886422, -0.01956043, 2.397912, 1, 1, 1, 1, 1,
0.7919487, -0.4606572, 2.40735, 1, 1, 1, 1, 1,
0.8009973, -1.107171, 2.167347, 1, 1, 1, 1, 1,
0.8039277, -1.969565, 2.835099, 1, 1, 1, 1, 1,
0.8047115, 0.7128024, 1.309277, 1, 1, 1, 1, 1,
0.8068096, -0.3123282, 0.6815866, 1, 1, 1, 1, 1,
0.8085656, -0.1498935, 4.135611, 0, 0, 1, 1, 1,
0.8156728, 0.1510349, 2.752446, 1, 0, 0, 1, 1,
0.8179469, -0.4402902, 2.246858, 1, 0, 0, 1, 1,
0.821369, -0.6593881, 3.919526, 1, 0, 0, 1, 1,
0.8244411, 0.06250346, 0.4764442, 1, 0, 0, 1, 1,
0.8278382, -0.2291102, 1.996237, 1, 0, 0, 1, 1,
0.835916, 1.360756, 0.115927, 0, 0, 0, 1, 1,
0.8382412, 0.4210869, 1.026317, 0, 0, 0, 1, 1,
0.8394489, 0.3028181, 0.5407505, 0, 0, 0, 1, 1,
0.8631429, 0.19764, 0.9134753, 0, 0, 0, 1, 1,
0.8655487, -1.264217, 1.045019, 0, 0, 0, 1, 1,
0.8677195, -0.6784168, 2.179159, 0, 0, 0, 1, 1,
0.8678867, -1.511002, 3.781211, 0, 0, 0, 1, 1,
0.8682818, 2.212749, 0.1514265, 1, 1, 1, 1, 1,
0.8687649, 1.968279, 2.355741, 1, 1, 1, 1, 1,
0.8759111, -0.3413702, 3.298504, 1, 1, 1, 1, 1,
0.8790579, 0.4601467, 1.629289, 1, 1, 1, 1, 1,
0.8813885, 0.7582231, -0.2870418, 1, 1, 1, 1, 1,
0.8881083, 0.06135458, 1.986973, 1, 1, 1, 1, 1,
0.9057363, -1.380997, 3.379887, 1, 1, 1, 1, 1,
0.9064814, 0.1970247, 1.572855, 1, 1, 1, 1, 1,
0.9097672, 0.2941262, 0.3989621, 1, 1, 1, 1, 1,
0.9137229, -0.2910731, -0.3976876, 1, 1, 1, 1, 1,
0.9143836, 1.287552, 0.1251644, 1, 1, 1, 1, 1,
0.9144724, -0.648664, 1.778126, 1, 1, 1, 1, 1,
0.9232508, 1.140891, 1.637102, 1, 1, 1, 1, 1,
0.9243296, 0.9681661, 0.3104607, 1, 1, 1, 1, 1,
0.9246697, -0.1690673, 3.034456, 1, 1, 1, 1, 1,
0.931881, 0.4176511, 0.7279829, 0, 0, 1, 1, 1,
0.9340658, -0.6802281, 1.654228, 1, 0, 0, 1, 1,
0.9345607, -0.2548511, 2.952098, 1, 0, 0, 1, 1,
0.9413618, -1.686714, 1.97093, 1, 0, 0, 1, 1,
0.9433196, -0.1803791, 1.682663, 1, 0, 0, 1, 1,
0.9444111, -0.4142164, 1.728427, 1, 0, 0, 1, 1,
0.9504804, 0.07677174, 1.38825, 0, 0, 0, 1, 1,
0.955053, 1.316271, 1.94057, 0, 0, 0, 1, 1,
0.9582517, 0.3196281, 0.804502, 0, 0, 0, 1, 1,
0.9613013, -0.6260836, 0.2153794, 0, 0, 0, 1, 1,
0.9633536, 1.0159, 0.8204609, 0, 0, 0, 1, 1,
0.9670939, -0.1859432, 1.346858, 0, 0, 0, 1, 1,
0.9681726, -0.8864028, 1.299225, 0, 0, 0, 1, 1,
0.9682164, -1.62904, 2.473931, 1, 1, 1, 1, 1,
0.9725533, -0.7980043, 3.035725, 1, 1, 1, 1, 1,
0.9756573, -0.1673204, -0.5741207, 1, 1, 1, 1, 1,
0.9785248, -0.5756545, 4.41177, 1, 1, 1, 1, 1,
0.9794611, 1.775379, -1.416314, 1, 1, 1, 1, 1,
0.9818025, -1.036645, 3.985074, 1, 1, 1, 1, 1,
0.9971753, -1.185295, 3.315574, 1, 1, 1, 1, 1,
0.9991446, 1.126979, 2.740135, 1, 1, 1, 1, 1,
1.011819, 0.4892314, 0.5715819, 1, 1, 1, 1, 1,
1.015957, 0.204429, 1.957235, 1, 1, 1, 1, 1,
1.022146, 0.03085683, 0.01892698, 1, 1, 1, 1, 1,
1.022755, -1.111885, 2.30394, 1, 1, 1, 1, 1,
1.024375, 0.8994536, 1.370963, 1, 1, 1, 1, 1,
1.026848, -0.7916018, 3.32735, 1, 1, 1, 1, 1,
1.032538, -0.1916865, 3.304053, 1, 1, 1, 1, 1,
1.034073, -0.5538067, 2.004301, 0, 0, 1, 1, 1,
1.034513, -0.7512479, 2.652806, 1, 0, 0, 1, 1,
1.040741, 0.02340164, 0.614804, 1, 0, 0, 1, 1,
1.051154, 0.8684155, 1.217578, 1, 0, 0, 1, 1,
1.062692, 0.2472785, 0.31468, 1, 0, 0, 1, 1,
1.066836, 0.8377404, -0.3356937, 1, 0, 0, 1, 1,
1.07041, -0.9387901, 0.9713707, 0, 0, 0, 1, 1,
1.070469, 0.2841268, 0.3490241, 0, 0, 0, 1, 1,
1.071551, 0.4601685, 0.9471971, 0, 0, 0, 1, 1,
1.073493, -0.07515613, 1.443596, 0, 0, 0, 1, 1,
1.074745, 1.512083, 0.3670208, 0, 0, 0, 1, 1,
1.079591, -0.1874632, 2.110951, 0, 0, 0, 1, 1,
1.080881, -0.6523176, 2.418298, 0, 0, 0, 1, 1,
1.082367, 0.6574795, 0.4998436, 1, 1, 1, 1, 1,
1.08857, -0.1511358, 1.181994, 1, 1, 1, 1, 1,
1.089738, 0.6081749, 0.6855971, 1, 1, 1, 1, 1,
1.096674, 0.3284146, 0.6716431, 1, 1, 1, 1, 1,
1.105312, -1.447541, 4.251767, 1, 1, 1, 1, 1,
1.112797, 0.1756267, 0.2259, 1, 1, 1, 1, 1,
1.115654, 0.612209, 1.934691, 1, 1, 1, 1, 1,
1.118146, -1.058832, 1.978637, 1, 1, 1, 1, 1,
1.118938, -1.265058, 2.181465, 1, 1, 1, 1, 1,
1.121026, -0.3086344, 1.404931, 1, 1, 1, 1, 1,
1.12588, -0.703782, 1.194487, 1, 1, 1, 1, 1,
1.144427, -0.8674399, 2.126515, 1, 1, 1, 1, 1,
1.153363, -1.354245, 1.502583, 1, 1, 1, 1, 1,
1.159485, 2.029274, -0.09524273, 1, 1, 1, 1, 1,
1.161523, 0.3835815, 0.6377528, 1, 1, 1, 1, 1,
1.164224, -0.9106274, 1.605128, 0, 0, 1, 1, 1,
1.168426, -1.219676, 0.9958224, 1, 0, 0, 1, 1,
1.173847, 0.4396545, 0.5678976, 1, 0, 0, 1, 1,
1.176012, -0.3348348, -0.02488663, 1, 0, 0, 1, 1,
1.176197, -0.03358442, 1.949943, 1, 0, 0, 1, 1,
1.176387, -0.857818, 4.879375, 1, 0, 0, 1, 1,
1.201761, -0.6028777, 1.122482, 0, 0, 0, 1, 1,
1.210007, 0.8100588, 1.917541, 0, 0, 0, 1, 1,
1.210368, 1.792927, 0.5082083, 0, 0, 0, 1, 1,
1.218835, -0.5083024, 0.6803285, 0, 0, 0, 1, 1,
1.220721, 0.5018414, -0.5257676, 0, 0, 0, 1, 1,
1.223322, -2.26142, 3.974326, 0, 0, 0, 1, 1,
1.228098, 1.160523, 0.4187341, 0, 0, 0, 1, 1,
1.229248, 0.1892543, 1.601966, 1, 1, 1, 1, 1,
1.236462, 0.1403014, 2.602368, 1, 1, 1, 1, 1,
1.242563, 0.08229446, 0.9237486, 1, 1, 1, 1, 1,
1.246732, 0.1932196, 1.567048, 1, 1, 1, 1, 1,
1.247317, 1.072875, 1.713134, 1, 1, 1, 1, 1,
1.269518, 1.492395, -0.7514903, 1, 1, 1, 1, 1,
1.271799, 0.001455268, -0.1855119, 1, 1, 1, 1, 1,
1.275104, 1.30512, 0.1685054, 1, 1, 1, 1, 1,
1.279, -0.965847, 1.736507, 1, 1, 1, 1, 1,
1.281358, -0.06871547, 2.50688, 1, 1, 1, 1, 1,
1.298054, -0.4020358, 4.321676, 1, 1, 1, 1, 1,
1.30497, 0.6536575, 0.8696483, 1, 1, 1, 1, 1,
1.307159, 0.8741201, 0.8152508, 1, 1, 1, 1, 1,
1.30971, -1.67965, 3.124958, 1, 1, 1, 1, 1,
1.328856, -0.3318477, 1.511505, 1, 1, 1, 1, 1,
1.346976, 0.610424, 1.075315, 0, 0, 1, 1, 1,
1.35175, 1.437943, 1.703513, 1, 0, 0, 1, 1,
1.366541, 0.5952281, -0.3988188, 1, 0, 0, 1, 1,
1.366614, -0.5312778, 2.231639, 1, 0, 0, 1, 1,
1.379353, -0.3456527, 0.5508386, 1, 0, 0, 1, 1,
1.3794, -1.743057, 1.872271, 1, 0, 0, 1, 1,
1.385734, -0.1913992, 2.211507, 0, 0, 0, 1, 1,
1.393789, -0.7445737, 0.08248005, 0, 0, 0, 1, 1,
1.393999, -0.3115046, 2.395054, 0, 0, 0, 1, 1,
1.400639, 0.1953167, -0.05044822, 0, 0, 0, 1, 1,
1.414117, 0.573469, 2.488832, 0, 0, 0, 1, 1,
1.41554, -0.2513945, 3.135433, 0, 0, 0, 1, 1,
1.420373, -2.855958, 1.025135, 0, 0, 0, 1, 1,
1.427065, -0.555371, 1.271081, 1, 1, 1, 1, 1,
1.432466, -0.2054191, 1.720275, 1, 1, 1, 1, 1,
1.434089, -0.07313302, 0.4889525, 1, 1, 1, 1, 1,
1.441191, -0.3217767, 0.9248796, 1, 1, 1, 1, 1,
1.45804, -1.166419, -0.3847454, 1, 1, 1, 1, 1,
1.460977, -2.230954, 3.576757, 1, 1, 1, 1, 1,
1.462774, -0.8839256, 0.6946937, 1, 1, 1, 1, 1,
1.471458, 0.1639569, 1.619424, 1, 1, 1, 1, 1,
1.481326, -1.999779, 1.676979, 1, 1, 1, 1, 1,
1.482458, -0.6226981, 1.63695, 1, 1, 1, 1, 1,
1.485271, -0.4508197, 2.979989, 1, 1, 1, 1, 1,
1.491694, 0.08260084, 2.635252, 1, 1, 1, 1, 1,
1.49272, -1.091902, 0.8609908, 1, 1, 1, 1, 1,
1.512277, 0.1057767, 1.931411, 1, 1, 1, 1, 1,
1.512874, 0.04169839, 1.258186, 1, 1, 1, 1, 1,
1.513535, -0.4937779, 2.588716, 0, 0, 1, 1, 1,
1.514684, -2.101925, 2.249801, 1, 0, 0, 1, 1,
1.531386, 0.8356658, 0.9769618, 1, 0, 0, 1, 1,
1.53283, -0.6584709, 2.695649, 1, 0, 0, 1, 1,
1.54796, 1.32023, -0.7061043, 1, 0, 0, 1, 1,
1.554478, -0.7494147, 2.205884, 1, 0, 0, 1, 1,
1.560943, -0.3640205, 1.05396, 0, 0, 0, 1, 1,
1.566234, -1.311563, 0.9659402, 0, 0, 0, 1, 1,
1.568838, -0.3039445, 2.490481, 0, 0, 0, 1, 1,
1.570114, 0.6767563, 0.4456762, 0, 0, 0, 1, 1,
1.571157, -0.1700334, 1.56886, 0, 0, 0, 1, 1,
1.571471, -0.07604517, 1.90931, 0, 0, 0, 1, 1,
1.577244, 1.728883, 0.4180878, 0, 0, 0, 1, 1,
1.57748, 0.00416586, 2.298718, 1, 1, 1, 1, 1,
1.614089, -0.9680386, 2.118484, 1, 1, 1, 1, 1,
1.621092, 1.160141, 0.9037637, 1, 1, 1, 1, 1,
1.622357, -0.1675823, 1.844193, 1, 1, 1, 1, 1,
1.625199, -1.332204, 2.179049, 1, 1, 1, 1, 1,
1.631999, -0.2213223, -0.2406035, 1, 1, 1, 1, 1,
1.638235, 1.394668, 0.18507, 1, 1, 1, 1, 1,
1.645142, -0.7334745, 2.137393, 1, 1, 1, 1, 1,
1.645926, 0.2453599, 3.031627, 1, 1, 1, 1, 1,
1.666808, 1.664131, -0.2486777, 1, 1, 1, 1, 1,
1.681605, 0.1069216, 1.126362, 1, 1, 1, 1, 1,
1.688971, -0.6189779, 1.282122, 1, 1, 1, 1, 1,
1.6909, -1.257046, 3.562611, 1, 1, 1, 1, 1,
1.699995, 0.1705024, 0.7834765, 1, 1, 1, 1, 1,
1.706196, -0.2364352, 0.3923618, 1, 1, 1, 1, 1,
1.732016, -0.6303447, 1.349361, 0, 0, 1, 1, 1,
1.734871, 0.9504702, 0.9368439, 1, 0, 0, 1, 1,
1.735757, -1.744348, 4.089034, 1, 0, 0, 1, 1,
1.737913, 0.3408669, 0.7318903, 1, 0, 0, 1, 1,
1.740295, -0.3784812, 1.950362, 1, 0, 0, 1, 1,
1.740848, -1.230855, 2.992072, 1, 0, 0, 1, 1,
1.755129, 0.1522438, 0.1592177, 0, 0, 0, 1, 1,
1.758308, 0.2417375, 0.4185012, 0, 0, 0, 1, 1,
1.771969, 1.548849, -1.088372, 0, 0, 0, 1, 1,
1.781056, 0.4840351, 2.157843, 0, 0, 0, 1, 1,
1.813924, -0.5396141, 2.169069, 0, 0, 0, 1, 1,
1.830556, -0.320014, 0.4847625, 0, 0, 0, 1, 1,
1.845102, -0.945417, 1.59271, 0, 0, 0, 1, 1,
1.847236, -0.1224469, 1.992526, 1, 1, 1, 1, 1,
1.870603, -1.573986, 1.841408, 1, 1, 1, 1, 1,
1.913321, 0.2459159, 2.909214, 1, 1, 1, 1, 1,
1.915908, -1.256242, 3.10745, 1, 1, 1, 1, 1,
1.930282, -2.55254, 1.714233, 1, 1, 1, 1, 1,
1.960088, 1.861821, -0.8447523, 1, 1, 1, 1, 1,
1.981539, -0.2761282, 1.45893, 1, 1, 1, 1, 1,
1.992029, 0.205159, 3.333786, 1, 1, 1, 1, 1,
1.992495, -1.132315, 1.611716, 1, 1, 1, 1, 1,
2.00901, -0.3210301, 1.525034, 1, 1, 1, 1, 1,
2.027101, 0.539364, 2.187781, 1, 1, 1, 1, 1,
2.073018, 0.8384604, -0.1707311, 1, 1, 1, 1, 1,
2.08074, 0.1783445, 1.882769, 1, 1, 1, 1, 1,
2.09593, 0.6962034, 0.4572578, 1, 1, 1, 1, 1,
2.149984, -1.168624, 2.277528, 1, 1, 1, 1, 1,
2.177293, -0.07196497, 3.035617, 0, 0, 1, 1, 1,
2.182095, -0.3512258, 2.298408, 1, 0, 0, 1, 1,
2.240854, -0.1816365, 2.809757, 1, 0, 0, 1, 1,
2.261967, -1.152901, 2.210337, 1, 0, 0, 1, 1,
2.332555, -2.033635, 1.79662, 1, 0, 0, 1, 1,
2.338532, -0.7362618, 1.584777, 1, 0, 0, 1, 1,
2.371264, -0.6953047, 1.347055, 0, 0, 0, 1, 1,
2.383185, -0.7696232, 2.787742, 0, 0, 0, 1, 1,
2.432357, 0.261613, 0.478725, 0, 0, 0, 1, 1,
2.435411, -1.308959, 2.293436, 0, 0, 0, 1, 1,
2.462898, 0.08401805, 1.600138, 0, 0, 0, 1, 1,
2.53581, -0.8603365, 2.50816, 0, 0, 0, 1, 1,
2.546498, 1.215035, 2.069448, 0, 0, 0, 1, 1,
2.555554, -1.271196, 1.922867, 1, 1, 1, 1, 1,
2.588748, -1.028504, 0.8885975, 1, 1, 1, 1, 1,
2.599704, -1.204721, 0.2015732, 1, 1, 1, 1, 1,
2.618554, 0.3868597, 1.097046, 1, 1, 1, 1, 1,
2.654324, 1.369013, -0.4227487, 1, 1, 1, 1, 1,
2.664579, -1.564297, 3.619279, 1, 1, 1, 1, 1,
2.813354, 0.1564998, -0.2973495, 1, 1, 1, 1, 1
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
var radius = 9.531945;
var distance = 33.48055;
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
mvMatrix.translate( 0.1312151, 0.365766, 0.2459629 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.48055);
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