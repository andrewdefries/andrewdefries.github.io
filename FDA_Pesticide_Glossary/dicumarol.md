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
-3.091164, 2.118131, -0.134419, 1, 0, 0, 1,
-2.876708, 1.75619, -1.967096, 1, 0.007843138, 0, 1,
-2.796319, 0.2574498, -2.164673, 1, 0.01176471, 0, 1,
-2.683547, -0.677057, -0.5920647, 1, 0.01960784, 0, 1,
-2.6768, -0.5355872, -2.063062, 1, 0.02352941, 0, 1,
-2.557544, 0.541904, -1.755149, 1, 0.03137255, 0, 1,
-2.314441, -1.431048, -1.589436, 1, 0.03529412, 0, 1,
-2.239185, -0.1674265, -1.750869, 1, 0.04313726, 0, 1,
-2.219266, 0.4071591, -0.5829626, 1, 0.04705882, 0, 1,
-2.218355, 0.6601005, -1.409018, 1, 0.05490196, 0, 1,
-2.214419, 0.6910774, -0.2720926, 1, 0.05882353, 0, 1,
-2.188479, 1.253511, -1.063803, 1, 0.06666667, 0, 1,
-2.187849, -1.469892, -2.342319, 1, 0.07058824, 0, 1,
-2.184819, 0.4244775, -1.959322, 1, 0.07843138, 0, 1,
-2.150056, 0.0502729, -1.803743, 1, 0.08235294, 0, 1,
-2.051898, -1.390129, -1.911283, 1, 0.09019608, 0, 1,
-2.051012, 0.8764758, -4.055853, 1, 0.09411765, 0, 1,
-2.033886, -0.1059368, -2.461029, 1, 0.1019608, 0, 1,
-2.020414, -0.4367877, -1.025284, 1, 0.1098039, 0, 1,
-1.999911, -0.06775095, -2.436328, 1, 0.1137255, 0, 1,
-1.990108, -0.01563049, -1.495446, 1, 0.1215686, 0, 1,
-1.93537, -1.331484, -3.608193, 1, 0.1254902, 0, 1,
-1.932497, -0.1340761, -0.3812612, 1, 0.1333333, 0, 1,
-1.900715, -2.035946, -4.080516, 1, 0.1372549, 0, 1,
-1.894754, -1.149904, -2.158545, 1, 0.145098, 0, 1,
-1.827329, 0.5029476, 0.04414091, 1, 0.1490196, 0, 1,
-1.78528, -0.8314848, -2.536182, 1, 0.1568628, 0, 1,
-1.785196, 1.483661, -1.465682, 1, 0.1607843, 0, 1,
-1.780219, -1.374744, -2.140147, 1, 0.1686275, 0, 1,
-1.760215, -0.7480819, -2.57832, 1, 0.172549, 0, 1,
-1.759234, -0.5630414, 0.03924415, 1, 0.1803922, 0, 1,
-1.7402, 0.1539684, -0.7191141, 1, 0.1843137, 0, 1,
-1.728137, -0.5257618, -0.5314113, 1, 0.1921569, 0, 1,
-1.725831, -1.787686, -5.294968, 1, 0.1960784, 0, 1,
-1.725558, -0.00696249, -0.04249047, 1, 0.2039216, 0, 1,
-1.718166, 0.9264641, -1.648222, 1, 0.2117647, 0, 1,
-1.716847, 0.8735473, -0.2271197, 1, 0.2156863, 0, 1,
-1.709149, 0.5752152, -1.984826, 1, 0.2235294, 0, 1,
-1.695837, -1.693689, -1.84059, 1, 0.227451, 0, 1,
-1.679248, 1.094272, -0.1828144, 1, 0.2352941, 0, 1,
-1.631604, 0.7134491, 0.06144672, 1, 0.2392157, 0, 1,
-1.608537, 0.9271232, -0.6230186, 1, 0.2470588, 0, 1,
-1.596841, -1.371907, -3.168275, 1, 0.2509804, 0, 1,
-1.591075, 0.06787611, -1.688803, 1, 0.2588235, 0, 1,
-1.590278, -0.3217148, -0.4539932, 1, 0.2627451, 0, 1,
-1.574501, 0.2145776, -1.302566, 1, 0.2705882, 0, 1,
-1.572661, 0.9432516, -0.08203763, 1, 0.2745098, 0, 1,
-1.571933, 0.07384223, -1.333607, 1, 0.282353, 0, 1,
-1.569707, 1.87758, -1.438626, 1, 0.2862745, 0, 1,
-1.565366, -0.3691042, -0.8723095, 1, 0.2941177, 0, 1,
-1.535408, -0.8295483, -1.981305, 1, 0.3019608, 0, 1,
-1.517105, -0.7040206, -3.197179, 1, 0.3058824, 0, 1,
-1.51282, -1.403995, -3.044236, 1, 0.3137255, 0, 1,
-1.505409, 1.282184, -0.2714998, 1, 0.3176471, 0, 1,
-1.501111, 1.341639, -2.599648, 1, 0.3254902, 0, 1,
-1.496714, 0.9384564, -0.1928102, 1, 0.3294118, 0, 1,
-1.476439, -0.5650954, -1.002632, 1, 0.3372549, 0, 1,
-1.47334, 0.3184522, -3.064434, 1, 0.3411765, 0, 1,
-1.462068, 0.3993101, -0.9702694, 1, 0.3490196, 0, 1,
-1.461861, -1.072308, -1.968964, 1, 0.3529412, 0, 1,
-1.458818, 1.364144, -1.572382, 1, 0.3607843, 0, 1,
-1.458026, -0.1903798, -2.302022, 1, 0.3647059, 0, 1,
-1.456509, 1.944466, -0.1149861, 1, 0.372549, 0, 1,
-1.444731, 0.6533962, -2.200029, 1, 0.3764706, 0, 1,
-1.443724, -0.8791774, -2.465717, 1, 0.3843137, 0, 1,
-1.441722, -0.6675672, -1.767459, 1, 0.3882353, 0, 1,
-1.441345, 0.3836018, -2.941763, 1, 0.3960784, 0, 1,
-1.438186, 0.1125591, -0.7035912, 1, 0.4039216, 0, 1,
-1.424336, 0.1758097, -1.156086, 1, 0.4078431, 0, 1,
-1.419739, -0.2263286, -2.867849, 1, 0.4156863, 0, 1,
-1.41783, -0.153054, -1.316542, 1, 0.4196078, 0, 1,
-1.400643, -0.3936279, -0.04586535, 1, 0.427451, 0, 1,
-1.398206, -0.1380175, -1.701394, 1, 0.4313726, 0, 1,
-1.395211, 1.152944, -0.659278, 1, 0.4392157, 0, 1,
-1.393279, 0.2522946, -1.877656, 1, 0.4431373, 0, 1,
-1.391651, -0.8665832, -1.437546, 1, 0.4509804, 0, 1,
-1.390919, 0.9308079, -2.064719, 1, 0.454902, 0, 1,
-1.390714, 0.4764717, -0.5960875, 1, 0.4627451, 0, 1,
-1.388704, 0.7492188, -2.105629, 1, 0.4666667, 0, 1,
-1.385044, 0.9560151, -0.5141987, 1, 0.4745098, 0, 1,
-1.380245, 2.780138, 0.7920467, 1, 0.4784314, 0, 1,
-1.377613, 0.4277832, -0.8238576, 1, 0.4862745, 0, 1,
-1.375843, -0.9994205, -2.974864, 1, 0.4901961, 0, 1,
-1.374083, 0.1551467, -1.462267, 1, 0.4980392, 0, 1,
-1.37228, -0.5500016, -1.236591, 1, 0.5058824, 0, 1,
-1.364012, 0.4099595, -1.148111, 1, 0.509804, 0, 1,
-1.36245, 0.7266364, -1.642982, 1, 0.5176471, 0, 1,
-1.361491, 0.6625121, -0.6891505, 1, 0.5215687, 0, 1,
-1.344474, -0.3285249, -1.342296, 1, 0.5294118, 0, 1,
-1.344416, 0.2966815, -0.9518207, 1, 0.5333334, 0, 1,
-1.339997, 1.408995, -0.5162244, 1, 0.5411765, 0, 1,
-1.325809, -0.9319071, -2.95892, 1, 0.5450981, 0, 1,
-1.320533, 0.6673334, 0.09978274, 1, 0.5529412, 0, 1,
-1.313647, -0.3847612, -2.819566, 1, 0.5568628, 0, 1,
-1.310889, -0.9077594, -2.9071, 1, 0.5647059, 0, 1,
-1.289431, 0.9150801, -0.7325407, 1, 0.5686275, 0, 1,
-1.275202, 1.470377, -0.6384325, 1, 0.5764706, 0, 1,
-1.268731, 1.703964, -0.2518709, 1, 0.5803922, 0, 1,
-1.267078, 0.8718923, -0.02150096, 1, 0.5882353, 0, 1,
-1.261939, 1.509425, -0.02429192, 1, 0.5921569, 0, 1,
-1.261902, -0.2542701, -0.7575592, 1, 0.6, 0, 1,
-1.259604, -0.9347316, -0.7102136, 1, 0.6078432, 0, 1,
-1.258034, 0.08892544, -2.620928, 1, 0.6117647, 0, 1,
-1.256638, 1.283963, -1.621381, 1, 0.6196079, 0, 1,
-1.255035, 0.616295, -2.62691, 1, 0.6235294, 0, 1,
-1.254485, 2.445935, -0.7526289, 1, 0.6313726, 0, 1,
-1.239914, 0.30656, -1.229121, 1, 0.6352941, 0, 1,
-1.23896, -0.1133303, -1.571195, 1, 0.6431373, 0, 1,
-1.234132, -1.345214, -1.465023, 1, 0.6470588, 0, 1,
-1.229159, -0.53358, -1.002451, 1, 0.654902, 0, 1,
-1.228866, 0.8772092, -1.442638, 1, 0.6588235, 0, 1,
-1.218736, 0.0135404, -1.600004, 1, 0.6666667, 0, 1,
-1.216218, 1.413248, -0.5104222, 1, 0.6705883, 0, 1,
-1.214832, -0.9173078, -1.807401, 1, 0.6784314, 0, 1,
-1.207369, 1.001368, -2.273744, 1, 0.682353, 0, 1,
-1.201802, 0.9564046, -2.388053, 1, 0.6901961, 0, 1,
-1.196404, 1.725015, 0.8561241, 1, 0.6941177, 0, 1,
-1.193808, -0.03391194, -1.561364, 1, 0.7019608, 0, 1,
-1.184777, 1.255099, -0.6471117, 1, 0.7098039, 0, 1,
-1.184615, 0.1183056, -0.6715596, 1, 0.7137255, 0, 1,
-1.18262, -0.2585226, -1.735618, 1, 0.7215686, 0, 1,
-1.17552, -2.012331, -3.646578, 1, 0.7254902, 0, 1,
-1.175412, -0.6253777, -2.360073, 1, 0.7333333, 0, 1,
-1.173516, -1.062962, -1.880388, 1, 0.7372549, 0, 1,
-1.157578, 0.8357163, -1.031513, 1, 0.7450981, 0, 1,
-1.156351, -0.9666564, -1.749784, 1, 0.7490196, 0, 1,
-1.15559, -0.1165419, -0.4593599, 1, 0.7568628, 0, 1,
-1.15082, 1.243734, -1.429848, 1, 0.7607843, 0, 1,
-1.138028, -1.267439, -1.0746, 1, 0.7686275, 0, 1,
-1.123576, 0.7193983, -1.876972, 1, 0.772549, 0, 1,
-1.123075, -0.671263, -2.52827, 1, 0.7803922, 0, 1,
-1.111276, 0.9396448, 0.7136181, 1, 0.7843137, 0, 1,
-1.109033, 0.2638576, -1.810018, 1, 0.7921569, 0, 1,
-1.101006, 1.420458, -2.059999, 1, 0.7960784, 0, 1,
-1.100035, -0.6351271, -2.082583, 1, 0.8039216, 0, 1,
-1.096422, -0.5814556, -2.427002, 1, 0.8117647, 0, 1,
-1.094585, -0.9531907, -0.592141, 1, 0.8156863, 0, 1,
-1.088655, 0.8090419, -0.4523438, 1, 0.8235294, 0, 1,
-1.087816, 2.580531, -0.2020481, 1, 0.827451, 0, 1,
-1.087281, 1.243287, -1.671364, 1, 0.8352941, 0, 1,
-1.083419, 1.063177, 1.008168, 1, 0.8392157, 0, 1,
-1.082786, -1.575341, -1.741641, 1, 0.8470588, 0, 1,
-1.077606, -0.2538732, -2.554009, 1, 0.8509804, 0, 1,
-1.067823, -0.2255663, -3.470707, 1, 0.8588235, 0, 1,
-1.0631, 0.8696522, -0.7275639, 1, 0.8627451, 0, 1,
-1.054912, -2.930094, -2.226879, 1, 0.8705882, 0, 1,
-1.051249, 1.984224, 0.942897, 1, 0.8745098, 0, 1,
-1.04966, 1.035664, -0.7340225, 1, 0.8823529, 0, 1,
-1.046738, 1.861457, -0.07721652, 1, 0.8862745, 0, 1,
-1.043888, -0.7078254, -2.079178, 1, 0.8941177, 0, 1,
-1.042215, 0.6284356, -0.3462451, 1, 0.8980392, 0, 1,
-1.034627, 2.588879, -0.5757745, 1, 0.9058824, 0, 1,
-1.03281, 0.4063608, -2.311142, 1, 0.9137255, 0, 1,
-1.031151, -0.6135449, -1.655785, 1, 0.9176471, 0, 1,
-1.02892, -0.4609701, 0.231704, 1, 0.9254902, 0, 1,
-1.026535, 1.803232, -1.195568, 1, 0.9294118, 0, 1,
-1.026035, -2.031338, -3.332471, 1, 0.9372549, 0, 1,
-1.014507, 0.5548565, -0.6985389, 1, 0.9411765, 0, 1,
-1.012257, 0.2348117, 1.578244, 1, 0.9490196, 0, 1,
-1.011589, -0.0001945397, -2.012809, 1, 0.9529412, 0, 1,
-1.006359, -0.07298554, -0.6184978, 1, 0.9607843, 0, 1,
-1.003244, 0.3556044, -1.326327, 1, 0.9647059, 0, 1,
-1.001388, -0.457782, -2.207025, 1, 0.972549, 0, 1,
-1.001191, 1.111955, -0.5891147, 1, 0.9764706, 0, 1,
-1.000347, 0.2854049, -1.763542, 1, 0.9843137, 0, 1,
-0.9932963, -1.206283, -2.53085, 1, 0.9882353, 0, 1,
-0.9814159, -0.353001, -2.82658, 1, 0.9960784, 0, 1,
-0.9737468, 1.06681, -1.083158, 0.9960784, 1, 0, 1,
-0.9732804, -1.776913, -2.979388, 0.9921569, 1, 0, 1,
-0.9725952, 1.62299, -0.1368753, 0.9843137, 1, 0, 1,
-0.9481691, -1.525556, -1.719708, 0.9803922, 1, 0, 1,
-0.9456796, 0.06032606, -0.2709119, 0.972549, 1, 0, 1,
-0.9390979, 1.389477, -1.431321, 0.9686275, 1, 0, 1,
-0.9358492, -0.6328048, -0.8121006, 0.9607843, 1, 0, 1,
-0.9313285, 0.6142949, -0.03658845, 0.9568627, 1, 0, 1,
-0.9303855, 0.4861428, -1.00988, 0.9490196, 1, 0, 1,
-0.9223568, -0.1306444, -1.943601, 0.945098, 1, 0, 1,
-0.9191443, -1.438263, -3.378708, 0.9372549, 1, 0, 1,
-0.9164994, -1.021934, -1.627241, 0.9333333, 1, 0, 1,
-0.914157, -0.2733645, -1.776921, 0.9254902, 1, 0, 1,
-0.9059471, 0.429387, -1.022556, 0.9215686, 1, 0, 1,
-0.9011223, -1.419495, -2.604054, 0.9137255, 1, 0, 1,
-0.9002495, -0.2707216, -1.833827, 0.9098039, 1, 0, 1,
-0.8970051, 1.18887, 1.254331, 0.9019608, 1, 0, 1,
-0.8961014, 1.448599, -0.4570887, 0.8941177, 1, 0, 1,
-0.8925945, -0.7757756, -3.254681, 0.8901961, 1, 0, 1,
-0.8909713, -0.7175527, -3.469994, 0.8823529, 1, 0, 1,
-0.8898128, -0.3675264, -3.517118, 0.8784314, 1, 0, 1,
-0.880046, 0.8961261, -1.21707, 0.8705882, 1, 0, 1,
-0.878131, 2.497394, -0.8013871, 0.8666667, 1, 0, 1,
-0.8751924, -0.2615558, -0.4151483, 0.8588235, 1, 0, 1,
-0.8626452, 1.477112, -0.1658017, 0.854902, 1, 0, 1,
-0.8611889, 0.1260683, -2.731651, 0.8470588, 1, 0, 1,
-0.8579787, -1.457141, -3.533653, 0.8431373, 1, 0, 1,
-0.8566238, 1.160197, -0.09160633, 0.8352941, 1, 0, 1,
-0.8496364, -1.109655, -3.536177, 0.8313726, 1, 0, 1,
-0.8462994, 0.1067718, -0.1226014, 0.8235294, 1, 0, 1,
-0.840396, 0.7579656, -1.168904, 0.8196079, 1, 0, 1,
-0.8382697, -0.8555993, -3.305455, 0.8117647, 1, 0, 1,
-0.8376334, 0.9400397, -0.3479069, 0.8078431, 1, 0, 1,
-0.8315912, 1.127192, -0.8908513, 0.8, 1, 0, 1,
-0.8301293, -0.5354219, -2.669738, 0.7921569, 1, 0, 1,
-0.8300849, 0.2737175, -2.449917, 0.7882353, 1, 0, 1,
-0.8265577, 0.1319156, -1.387276, 0.7803922, 1, 0, 1,
-0.8238856, 0.1346526, -1.392906, 0.7764706, 1, 0, 1,
-0.8235164, 0.4317708, 0.05471397, 0.7686275, 1, 0, 1,
-0.8138328, -0.8544523, -2.465409, 0.7647059, 1, 0, 1,
-0.8045691, -0.9483669, -2.668422, 0.7568628, 1, 0, 1,
-0.8035793, 1.162566, -1.54624, 0.7529412, 1, 0, 1,
-0.7974716, 1.132096, 0.5192745, 0.7450981, 1, 0, 1,
-0.7959665, -0.4646709, -0.3444231, 0.7411765, 1, 0, 1,
-0.7956524, 1.557118, -0.9047965, 0.7333333, 1, 0, 1,
-0.7915996, -0.1265136, -2.521001, 0.7294118, 1, 0, 1,
-0.7877411, -1.480763, -3.731547, 0.7215686, 1, 0, 1,
-0.7812529, -0.04066796, -0.5489772, 0.7176471, 1, 0, 1,
-0.7801678, 0.02770531, -1.945616, 0.7098039, 1, 0, 1,
-0.779381, 0.425238, -1.071328, 0.7058824, 1, 0, 1,
-0.7780293, -2.169312, -4.244147, 0.6980392, 1, 0, 1,
-0.77421, -0.4350874, -1.068928, 0.6901961, 1, 0, 1,
-0.7724806, -0.3812034, -1.242242, 0.6862745, 1, 0, 1,
-0.7708151, -0.8393364, -2.549267, 0.6784314, 1, 0, 1,
-0.7680799, 1.186308, -3.176517, 0.6745098, 1, 0, 1,
-0.76385, -1.458214, -3.095397, 0.6666667, 1, 0, 1,
-0.7583871, -0.9845588, -3.122059, 0.6627451, 1, 0, 1,
-0.7547486, -0.00680133, -2.594936, 0.654902, 1, 0, 1,
-0.7490621, -0.3241672, -2.480417, 0.6509804, 1, 0, 1,
-0.7488201, 1.067986, -0.6407913, 0.6431373, 1, 0, 1,
-0.7439673, 1.488947, 0.2362158, 0.6392157, 1, 0, 1,
-0.7417397, 1.274749, -0.7262322, 0.6313726, 1, 0, 1,
-0.7395201, 0.2855873, -1.070846, 0.627451, 1, 0, 1,
-0.7393006, -0.5390891, -0.4408946, 0.6196079, 1, 0, 1,
-0.7376919, -0.01236613, -0.06834028, 0.6156863, 1, 0, 1,
-0.7346927, -1.269943, -2.639848, 0.6078432, 1, 0, 1,
-0.725806, -1.005488, -1.532245, 0.6039216, 1, 0, 1,
-0.7250548, 0.6454999, -2.384402, 0.5960785, 1, 0, 1,
-0.7153019, -0.2244731, -4.030017, 0.5882353, 1, 0, 1,
-0.7117075, -0.9164408, -2.820857, 0.5843138, 1, 0, 1,
-0.706918, 1.852153, -0.2340369, 0.5764706, 1, 0, 1,
-0.695667, -1.041949, -3.368827, 0.572549, 1, 0, 1,
-0.6938725, -0.02669461, -0.8001451, 0.5647059, 1, 0, 1,
-0.6913776, 0.05362853, -2.738447, 0.5607843, 1, 0, 1,
-0.6911021, 1.235308, -0.6226065, 0.5529412, 1, 0, 1,
-0.6879546, -0.01136758, -3.026176, 0.5490196, 1, 0, 1,
-0.684379, -0.258464, -2.911625, 0.5411765, 1, 0, 1,
-0.6841754, -0.1836368, -2.855639, 0.5372549, 1, 0, 1,
-0.6727092, 0.3226018, -0.2243278, 0.5294118, 1, 0, 1,
-0.6714462, -1.649592, -2.327574, 0.5254902, 1, 0, 1,
-0.6699636, 0.7824857, -1.449382, 0.5176471, 1, 0, 1,
-0.6679764, -2.238663, -4.072377, 0.5137255, 1, 0, 1,
-0.6620867, 1.08668, -2.031109, 0.5058824, 1, 0, 1,
-0.6510083, 0.9577336, -0.5010523, 0.5019608, 1, 0, 1,
-0.647216, -0.4323187, -0.2942066, 0.4941176, 1, 0, 1,
-0.6365696, -0.1800543, -2.461515, 0.4862745, 1, 0, 1,
-0.636319, 1.700778, 1.473167, 0.4823529, 1, 0, 1,
-0.6344494, -1.665439, -3.798586, 0.4745098, 1, 0, 1,
-0.6336363, 0.3612732, 0.2899282, 0.4705882, 1, 0, 1,
-0.6278064, -0.4320152, -2.054453, 0.4627451, 1, 0, 1,
-0.6268452, -0.8993908, -3.291415, 0.4588235, 1, 0, 1,
-0.6236085, -0.2523746, -2.308374, 0.4509804, 1, 0, 1,
-0.6207565, -0.6929821, -3.892772, 0.4470588, 1, 0, 1,
-0.6188626, 0.2935274, 0.01007732, 0.4392157, 1, 0, 1,
-0.6184501, -1.427634, -2.089175, 0.4352941, 1, 0, 1,
-0.6168306, 1.562576, -1.580495, 0.427451, 1, 0, 1,
-0.6151227, -0.2486915, -1.766776, 0.4235294, 1, 0, 1,
-0.6114278, 0.2441973, -1.781061, 0.4156863, 1, 0, 1,
-0.6100277, -0.5656286, -1.304568, 0.4117647, 1, 0, 1,
-0.6008729, -1.772252, -2.622163, 0.4039216, 1, 0, 1,
-0.6000311, 0.006843237, -2.372436, 0.3960784, 1, 0, 1,
-0.5990377, -0.9164472, -2.850227, 0.3921569, 1, 0, 1,
-0.5959139, 1.506855, -0.4518985, 0.3843137, 1, 0, 1,
-0.5931955, 0.05995641, -3.977167, 0.3803922, 1, 0, 1,
-0.5914733, 1.64597, -0.5684688, 0.372549, 1, 0, 1,
-0.5875623, -0.4817577, -1.874133, 0.3686275, 1, 0, 1,
-0.5865134, 1.336126, -0.7460794, 0.3607843, 1, 0, 1,
-0.5801712, -0.235977, -2.315033, 0.3568628, 1, 0, 1,
-0.5788077, 1.497873, -0.5541063, 0.3490196, 1, 0, 1,
-0.5779945, -0.08195239, -3.486678, 0.345098, 1, 0, 1,
-0.57487, -0.254084, -1.634241, 0.3372549, 1, 0, 1,
-0.5741748, -1.741107, -2.416001, 0.3333333, 1, 0, 1,
-0.5717409, 0.06947704, -1.409315, 0.3254902, 1, 0, 1,
-0.5713642, 0.6274177, -2.256513, 0.3215686, 1, 0, 1,
-0.5618514, 0.0957711, -1.91503, 0.3137255, 1, 0, 1,
-0.5614861, 0.7212929, -2.215632, 0.3098039, 1, 0, 1,
-0.5501602, 0.06391864, -3.50575, 0.3019608, 1, 0, 1,
-0.5467419, 0.7245248, -1.474839, 0.2941177, 1, 0, 1,
-0.5432575, -0.3080622, -1.74881, 0.2901961, 1, 0, 1,
-0.5413285, -0.3472665, -2.493644, 0.282353, 1, 0, 1,
-0.5402816, -0.3818883, -2.534312, 0.2784314, 1, 0, 1,
-0.5372102, -1.819688, -2.402302, 0.2705882, 1, 0, 1,
-0.532329, -0.9619076, -1.437683, 0.2666667, 1, 0, 1,
-0.528839, 0.5256373, -1.522594, 0.2588235, 1, 0, 1,
-0.5232168, 1.126841, -1.150659, 0.254902, 1, 0, 1,
-0.5211093, 0.9714769, -2.031539, 0.2470588, 1, 0, 1,
-0.5206156, 0.001155671, -2.542047, 0.2431373, 1, 0, 1,
-0.5177838, -0.3512566, -1.411286, 0.2352941, 1, 0, 1,
-0.5159323, 0.5639566, -0.5431865, 0.2313726, 1, 0, 1,
-0.5156766, 2.325312, -0.5303014, 0.2235294, 1, 0, 1,
-0.5120452, -0.612309, -0.564457, 0.2196078, 1, 0, 1,
-0.5086524, 0.2232349, -2.264591, 0.2117647, 1, 0, 1,
-0.5082946, 0.01865009, -0.1209306, 0.2078431, 1, 0, 1,
-0.5074834, 0.2938632, -0.6980936, 0.2, 1, 0, 1,
-0.5042583, -0.6533927, -2.726017, 0.1921569, 1, 0, 1,
-0.4982396, -0.4258439, -2.837341, 0.1882353, 1, 0, 1,
-0.4958895, -0.04305438, -2.304432, 0.1803922, 1, 0, 1,
-0.4879723, 0.3721971, -1.576757, 0.1764706, 1, 0, 1,
-0.485813, -0.07163046, -1.099974, 0.1686275, 1, 0, 1,
-0.4840047, 2.661732, -0.7538609, 0.1647059, 1, 0, 1,
-0.4756064, -1.989208, -3.376338, 0.1568628, 1, 0, 1,
-0.4723579, 0.7313278, -0.6358842, 0.1529412, 1, 0, 1,
-0.4680492, 0.6693554, -0.4617524, 0.145098, 1, 0, 1,
-0.4671234, -2.159602, -1.360447, 0.1411765, 1, 0, 1,
-0.4658244, -0.1479401, -0.2042716, 0.1333333, 1, 0, 1,
-0.4610828, 0.7358943, 0.01155927, 0.1294118, 1, 0, 1,
-0.4484565, 0.3202431, -1.106057, 0.1215686, 1, 0, 1,
-0.4473548, -1.111473, -2.242784, 0.1176471, 1, 0, 1,
-0.4468053, 0.7547342, -0.0733511, 0.1098039, 1, 0, 1,
-0.443757, 0.7593436, -0.980818, 0.1058824, 1, 0, 1,
-0.4427997, -0.1899223, -1.828486, 0.09803922, 1, 0, 1,
-0.4421384, -0.2092126, 0.01153229, 0.09019608, 1, 0, 1,
-0.440047, 0.1700024, -1.145298, 0.08627451, 1, 0, 1,
-0.4392895, 0.1683386, 1.132522, 0.07843138, 1, 0, 1,
-0.4386044, -0.8630858, -2.104717, 0.07450981, 1, 0, 1,
-0.4218966, 0.5348601, -1.349891, 0.06666667, 1, 0, 1,
-0.4190058, -0.5303138, -2.271229, 0.0627451, 1, 0, 1,
-0.4118567, -0.2687675, -1.917177, 0.05490196, 1, 0, 1,
-0.4079578, 0.205795, 0.07363679, 0.05098039, 1, 0, 1,
-0.4075739, 0.4637534, -0.1716771, 0.04313726, 1, 0, 1,
-0.4002872, 0.1178589, -1.491295, 0.03921569, 1, 0, 1,
-0.4001204, -1.304178, -2.63738, 0.03137255, 1, 0, 1,
-0.3912272, -0.01436529, -2.47985, 0.02745098, 1, 0, 1,
-0.3908837, -1.658855, -3.117483, 0.01960784, 1, 0, 1,
-0.3908561, 0.02130116, -2.860552, 0.01568628, 1, 0, 1,
-0.3863175, -0.4883856, -2.518458, 0.007843138, 1, 0, 1,
-0.385851, 0.7704757, 2.164865, 0.003921569, 1, 0, 1,
-0.3858149, 2.000386, -0.206468, 0, 1, 0.003921569, 1,
-0.3833946, -1.316006, -2.832298, 0, 1, 0.01176471, 1,
-0.37376, 0.4737687, -0.1839532, 0, 1, 0.01568628, 1,
-0.3718913, -0.9762828, -3.835469, 0, 1, 0.02352941, 1,
-0.3718616, -0.5088217, -2.863675, 0, 1, 0.02745098, 1,
-0.3708317, 0.1189305, -1.321345, 0, 1, 0.03529412, 1,
-0.3662366, 2.357396, 0.1030742, 0, 1, 0.03921569, 1,
-0.3654512, -0.1192397, -2.353026, 0, 1, 0.04705882, 1,
-0.3642587, -1.284723, -1.562826, 0, 1, 0.05098039, 1,
-0.3622147, 1.755172, -0.460962, 0, 1, 0.05882353, 1,
-0.3617641, 2.207062, -0.3308519, 0, 1, 0.0627451, 1,
-0.3589348, 0.417242, -1.095249, 0, 1, 0.07058824, 1,
-0.354772, -0.7937698, -2.814778, 0, 1, 0.07450981, 1,
-0.3546791, -0.8683586, -3.795191, 0, 1, 0.08235294, 1,
-0.3517776, -1.313051, -1.775612, 0, 1, 0.08627451, 1,
-0.3513528, -2.487398, -4.951098, 0, 1, 0.09411765, 1,
-0.3450493, -0.8758075, -3.094982, 0, 1, 0.1019608, 1,
-0.3410351, 0.3415236, -2.020925, 0, 1, 0.1058824, 1,
-0.3378994, -2.207052, -2.995823, 0, 1, 0.1137255, 1,
-0.3340927, 1.101104, -1.247925, 0, 1, 0.1176471, 1,
-0.3316769, -1.507765, -0.830552, 0, 1, 0.1254902, 1,
-0.3297709, 0.7628551, -0.02741396, 0, 1, 0.1294118, 1,
-0.3263606, -1.062698, -3.907123, 0, 1, 0.1372549, 1,
-0.322696, -1.47137, -2.690192, 0, 1, 0.1411765, 1,
-0.3208071, 0.01048875, -2.799117, 0, 1, 0.1490196, 1,
-0.3167195, 1.120491, -0.3874077, 0, 1, 0.1529412, 1,
-0.3131901, -1.277434, -1.210268, 0, 1, 0.1607843, 1,
-0.307651, 0.3042181, 0.1347923, 0, 1, 0.1647059, 1,
-0.3045214, 0.01063452, -3.549902, 0, 1, 0.172549, 1,
-0.3045075, -0.7986956, -3.169032, 0, 1, 0.1764706, 1,
-0.3031479, 1.154066, 0.2000105, 0, 1, 0.1843137, 1,
-0.2955934, 0.6021515, -1.31117, 0, 1, 0.1882353, 1,
-0.2946521, 0.4255804, -0.06461823, 0, 1, 0.1960784, 1,
-0.289741, -1.227248, -0.8813809, 0, 1, 0.2039216, 1,
-0.282701, -0.09257012, -2.11615, 0, 1, 0.2078431, 1,
-0.281258, -0.09845299, -2.87759, 0, 1, 0.2156863, 1,
-0.2785296, -1.142865, -5.082675, 0, 1, 0.2196078, 1,
-0.2764128, 0.09929822, -2.591927, 0, 1, 0.227451, 1,
-0.2708946, 2.366932, -0.5793769, 0, 1, 0.2313726, 1,
-0.2702212, 0.9719931, -0.1357548, 0, 1, 0.2392157, 1,
-0.2696277, -0.1541339, -1.531308, 0, 1, 0.2431373, 1,
-0.2684302, -0.4177823, -2.671899, 0, 1, 0.2509804, 1,
-0.2683361, 0.1756173, -1.707966, 0, 1, 0.254902, 1,
-0.2604662, -1.44288, -4.090643, 0, 1, 0.2627451, 1,
-0.2602286, 0.3271242, -1.372802, 0, 1, 0.2666667, 1,
-0.2557552, -0.6515529, -3.472514, 0, 1, 0.2745098, 1,
-0.2487294, 2.153623, 0.4702927, 0, 1, 0.2784314, 1,
-0.2481486, 0.8547971, -0.2844197, 0, 1, 0.2862745, 1,
-0.2420067, -1.310464, -2.91513, 0, 1, 0.2901961, 1,
-0.2406084, -0.1869495, -2.900026, 0, 1, 0.2980392, 1,
-0.2387742, -2.185837, -1.954755, 0, 1, 0.3058824, 1,
-0.2375868, 0.4736605, -1.650945, 0, 1, 0.3098039, 1,
-0.2355522, 0.7118666, -0.1489795, 0, 1, 0.3176471, 1,
-0.2328874, -0.3609022, -2.089779, 0, 1, 0.3215686, 1,
-0.2311359, 0.430899, -1.199792, 0, 1, 0.3294118, 1,
-0.2292152, 0.3616298, -1.222317, 0, 1, 0.3333333, 1,
-0.2282176, 1.972281, 0.07371933, 0, 1, 0.3411765, 1,
-0.225663, -1.256903, -1.479648, 0, 1, 0.345098, 1,
-0.2253411, 0.1984885, -0.7471032, 0, 1, 0.3529412, 1,
-0.2252139, 0.03353121, -1.122947, 0, 1, 0.3568628, 1,
-0.2199391, 0.3619553, -0.3082976, 0, 1, 0.3647059, 1,
-0.2191008, -0.4996305, -2.650277, 0, 1, 0.3686275, 1,
-0.2181769, 0.414385, 1.343598, 0, 1, 0.3764706, 1,
-0.2164536, -1.28754, -3.847415, 0, 1, 0.3803922, 1,
-0.212092, -0.05862923, -3.47005, 0, 1, 0.3882353, 1,
-0.2105973, 0.2478681, 0.500937, 0, 1, 0.3921569, 1,
-0.2035217, -0.0390886, -3.219858, 0, 1, 0.4, 1,
-0.2033798, 1.50287, 0.9866923, 0, 1, 0.4078431, 1,
-0.2025302, -0.0113415, -0.3544544, 0, 1, 0.4117647, 1,
-0.2022271, 1.086275, 0.105402, 0, 1, 0.4196078, 1,
-0.2012866, -0.5053696, -2.248948, 0, 1, 0.4235294, 1,
-0.197263, 0.5266389, -1.892348, 0, 1, 0.4313726, 1,
-0.1883353, -1.514389, -3.54544, 0, 1, 0.4352941, 1,
-0.1877173, 0.09728248, -0.1970288, 0, 1, 0.4431373, 1,
-0.1846744, 0.06389429, -0.7171542, 0, 1, 0.4470588, 1,
-0.1837184, -0.6010345, -3.795053, 0, 1, 0.454902, 1,
-0.1823825, -0.4103424, -1.580261, 0, 1, 0.4588235, 1,
-0.1802457, 0.8688622, -0.6001052, 0, 1, 0.4666667, 1,
-0.179689, 1.208482, -0.05124377, 0, 1, 0.4705882, 1,
-0.1791069, 1.387676, -0.2679907, 0, 1, 0.4784314, 1,
-0.1769508, 1.587159, 0.7219554, 0, 1, 0.4823529, 1,
-0.1758002, -0.6944183, -2.486889, 0, 1, 0.4901961, 1,
-0.1708022, 1.714836, -0.4450444, 0, 1, 0.4941176, 1,
-0.1707655, -0.2071197, -2.095098, 0, 1, 0.5019608, 1,
-0.1678984, -1.192785, -2.810589, 0, 1, 0.509804, 1,
-0.1674936, 0.2606505, 1.423094, 0, 1, 0.5137255, 1,
-0.165547, -1.121998, -3.134319, 0, 1, 0.5215687, 1,
-0.1649146, 0.30331, -1.552297, 0, 1, 0.5254902, 1,
-0.1632418, -0.04680504, -2.83501, 0, 1, 0.5333334, 1,
-0.1546715, 0.3092259, -1.068205, 0, 1, 0.5372549, 1,
-0.1532317, 0.3124438, -0.05472506, 0, 1, 0.5450981, 1,
-0.1510682, -1.411824, -2.976058, 0, 1, 0.5490196, 1,
-0.1422682, 0.1191086, 0.03536785, 0, 1, 0.5568628, 1,
-0.1375608, 0.8679723, -1.595767, 0, 1, 0.5607843, 1,
-0.1352963, 0.07279531, -1.417792, 0, 1, 0.5686275, 1,
-0.1329093, -0.4345247, -2.138955, 0, 1, 0.572549, 1,
-0.1315075, -0.3411037, -2.144681, 0, 1, 0.5803922, 1,
-0.1314492, 0.1772763, 0.9609154, 0, 1, 0.5843138, 1,
-0.1305278, -2.000784, -3.33539, 0, 1, 0.5921569, 1,
-0.1241282, 0.772229, -1.381999, 0, 1, 0.5960785, 1,
-0.1190738, 2.03943, -2.421262, 0, 1, 0.6039216, 1,
-0.1166787, -0.7144485, -2.773103, 0, 1, 0.6117647, 1,
-0.1156846, -0.3546433, -2.657587, 0, 1, 0.6156863, 1,
-0.1140612, 2.769201, -0.5230513, 0, 1, 0.6235294, 1,
-0.1061071, 0.4718063, 0.2854125, 0, 1, 0.627451, 1,
-0.1053383, 0.3543644, -0.773516, 0, 1, 0.6352941, 1,
-0.1043581, -0.6602723, -2.7192, 0, 1, 0.6392157, 1,
-0.1004813, -0.01528939, -1.388791, 0, 1, 0.6470588, 1,
-0.09977992, 1.351991, -0.3723879, 0, 1, 0.6509804, 1,
-0.0992147, -1.271872, -1.30607, 0, 1, 0.6588235, 1,
-0.0990188, -1.974982, -3.757592, 0, 1, 0.6627451, 1,
-0.09684683, -0.7363577, -4.204645, 0, 1, 0.6705883, 1,
-0.09524602, -0.2101989, -3.138725, 0, 1, 0.6745098, 1,
-0.09329502, 0.8554848, -0.9671867, 0, 1, 0.682353, 1,
-0.09324569, -0.9963602, -3.600722, 0, 1, 0.6862745, 1,
-0.09063002, 0.2654944, -0.1146143, 0, 1, 0.6941177, 1,
-0.08728745, -0.5576633, -1.522074, 0, 1, 0.7019608, 1,
-0.08623974, 0.1494579, 0.08201969, 0, 1, 0.7058824, 1,
-0.07726359, -0.6887006, -5.194547, 0, 1, 0.7137255, 1,
-0.07697928, -1.612257, -2.684823, 0, 1, 0.7176471, 1,
-0.07612246, -1.414031, -4.057079, 0, 1, 0.7254902, 1,
-0.07303575, -1.613161, -3.069874, 0, 1, 0.7294118, 1,
-0.07233871, 1.028569, 0.3169836, 0, 1, 0.7372549, 1,
-0.0720017, 1.380832, 0.1244535, 0, 1, 0.7411765, 1,
-0.07082222, 0.02413692, 1.175129, 0, 1, 0.7490196, 1,
-0.07023806, 1.078125, -0.4419075, 0, 1, 0.7529412, 1,
-0.06997718, 0.564742, -0.05445388, 0, 1, 0.7607843, 1,
-0.06722657, -1.918538, -4.011507, 0, 1, 0.7647059, 1,
-0.06678332, 0.2893347, 0.1417295, 0, 1, 0.772549, 1,
-0.06147334, 0.09587887, -0.6211455, 0, 1, 0.7764706, 1,
-0.06136303, 0.6515653, -0.07612959, 0, 1, 0.7843137, 1,
-0.05880054, -0.2468336, -3.508553, 0, 1, 0.7882353, 1,
-0.055439, -0.5199675, -5.386702, 0, 1, 0.7960784, 1,
-0.04860015, 0.5794761, 1.484309, 0, 1, 0.8039216, 1,
-0.04820946, -0.6248417, -3.980748, 0, 1, 0.8078431, 1,
-0.04632556, 2.095124, -1.199168, 0, 1, 0.8156863, 1,
-0.04545438, -1.117435, -3.909999, 0, 1, 0.8196079, 1,
-0.04396317, -0.7183312, -2.412418, 0, 1, 0.827451, 1,
-0.03148899, 0.8439367, -0.1603368, 0, 1, 0.8313726, 1,
-0.02426314, -1.357879, -2.982092, 0, 1, 0.8392157, 1,
-0.02289937, 0.2973779, -0.5617723, 0, 1, 0.8431373, 1,
-0.02164985, 1.781175, 0.5770925, 0, 1, 0.8509804, 1,
-0.02111654, 0.9440757, 0.3842747, 0, 1, 0.854902, 1,
-0.01907492, -0.1857842, -2.538964, 0, 1, 0.8627451, 1,
-0.01785097, -1.049973, -3.407648, 0, 1, 0.8666667, 1,
-0.01501325, 0.7059988, -0.4216063, 0, 1, 0.8745098, 1,
-0.01013911, 2.881322, 1.561549, 0, 1, 0.8784314, 1,
-0.009345414, -1.195144, -2.423752, 0, 1, 0.8862745, 1,
-0.00822295, -1.288043, -3.275687, 0, 1, 0.8901961, 1,
-0.004979676, -1.970747, -2.307086, 0, 1, 0.8980392, 1,
-0.004691743, -1.018888, -3.012108, 0, 1, 0.9058824, 1,
-0.003280182, -0.5872838, -3.898765, 0, 1, 0.9098039, 1,
-0.002262932, -0.9044732, -4.099772, 0, 1, 0.9176471, 1,
-0.000634734, 1.419806, 0.3306426, 0, 1, 0.9215686, 1,
-0.0004693767, -0.3615758, -3.888519, 0, 1, 0.9294118, 1,
0.01045222, 1.268139, 0.2234499, 0, 1, 0.9333333, 1,
0.01070712, 1.063392, -1.010257, 0, 1, 0.9411765, 1,
0.01254597, -1.375768, 4.947649, 0, 1, 0.945098, 1,
0.01994702, 1.222212, -0.1053646, 0, 1, 0.9529412, 1,
0.02010757, -0.7772406, 3.014056, 0, 1, 0.9568627, 1,
0.02132107, 0.110416, 1.804451, 0, 1, 0.9647059, 1,
0.02425035, -0.6833037, 3.04217, 0, 1, 0.9686275, 1,
0.02514237, -0.2955576, 3.0677, 0, 1, 0.9764706, 1,
0.02895354, -0.1300807, 3.70729, 0, 1, 0.9803922, 1,
0.03280682, 0.2329341, -0.327564, 0, 1, 0.9882353, 1,
0.04615686, 1.092212, -0.3115947, 0, 1, 0.9921569, 1,
0.04752853, -0.7218611, 4.601221, 0, 1, 1, 1,
0.05148154, -0.793687, 3.90084, 0, 0.9921569, 1, 1,
0.05709143, 1.435418, -1.497985, 0, 0.9882353, 1, 1,
0.05729294, 1.277166, 0.2945661, 0, 0.9803922, 1, 1,
0.0595232, 0.6343867, 0.5417834, 0, 0.9764706, 1, 1,
0.05956793, -1.699674, 0.8580671, 0, 0.9686275, 1, 1,
0.0596421, -0.4410256, 2.963356, 0, 0.9647059, 1, 1,
0.06091087, -1.366248, 1.766592, 0, 0.9568627, 1, 1,
0.06093876, 0.1955978, 0.1454927, 0, 0.9529412, 1, 1,
0.06477807, -0.8925194, 4.167312, 0, 0.945098, 1, 1,
0.06540058, 0.7834871, 1.189523, 0, 0.9411765, 1, 1,
0.06690036, 0.9218828, 1.09441, 0, 0.9333333, 1, 1,
0.06713948, -1.236104, 2.587088, 0, 0.9294118, 1, 1,
0.06755439, 1.339856, -1.026686, 0, 0.9215686, 1, 1,
0.07081021, 0.5867118, -0.2706101, 0, 0.9176471, 1, 1,
0.0720269, 0.7487118, 1.161795, 0, 0.9098039, 1, 1,
0.0727603, -0.9353296, 3.795728, 0, 0.9058824, 1, 1,
0.07524306, 0.7382481, 0.7228904, 0, 0.8980392, 1, 1,
0.07752076, -0.05163105, 1.492897, 0, 0.8901961, 1, 1,
0.0813526, 0.03680805, 2.457365, 0, 0.8862745, 1, 1,
0.08401374, -0.5282047, 2.687029, 0, 0.8784314, 1, 1,
0.08970536, 1.496043, -0.4058199, 0, 0.8745098, 1, 1,
0.09560545, -1.019515, 1.664686, 0, 0.8666667, 1, 1,
0.09893267, -1.667592, 2.545266, 0, 0.8627451, 1, 1,
0.09968535, 1.284495, -0.3862354, 0, 0.854902, 1, 1,
0.1014902, 1.673171, 0.6053854, 0, 0.8509804, 1, 1,
0.1074348, 0.6457043, 0.9417123, 0, 0.8431373, 1, 1,
0.1088259, 0.2700762, -1.161529, 0, 0.8392157, 1, 1,
0.1109829, -0.1875375, 3.159083, 0, 0.8313726, 1, 1,
0.1149394, 0.4086456, -0.7131326, 0, 0.827451, 1, 1,
0.1164228, 0.412137, 2.425083, 0, 0.8196079, 1, 1,
0.1193284, -0.601334, 2.816009, 0, 0.8156863, 1, 1,
0.11936, -0.4709422, 2.655354, 0, 0.8078431, 1, 1,
0.1201625, 0.4363738, 1.278315, 0, 0.8039216, 1, 1,
0.1208722, -0.8140548, 2.490284, 0, 0.7960784, 1, 1,
0.124204, 0.3651614, 0.5997592, 0, 0.7882353, 1, 1,
0.1259892, -0.8499328, 2.552222, 0, 0.7843137, 1, 1,
0.1336704, -0.149292, 2.513304, 0, 0.7764706, 1, 1,
0.1340314, -0.3822024, 2.438181, 0, 0.772549, 1, 1,
0.139075, 0.4593324, -0.2967316, 0, 0.7647059, 1, 1,
0.1411964, -0.254138, 3.835473, 0, 0.7607843, 1, 1,
0.1449079, -0.1193076, 2.548614, 0, 0.7529412, 1, 1,
0.1462356, -0.4092808, 2.351115, 0, 0.7490196, 1, 1,
0.1476608, -0.05303758, -0.5353788, 0, 0.7411765, 1, 1,
0.152204, -0.3858278, 3.70932, 0, 0.7372549, 1, 1,
0.1551756, -0.1018973, 3.46162, 0, 0.7294118, 1, 1,
0.156674, -0.7116253, 2.688106, 0, 0.7254902, 1, 1,
0.1578017, -0.2871508, -0.4659714, 0, 0.7176471, 1, 1,
0.1690784, -1.05816, 2.987523, 0, 0.7137255, 1, 1,
0.1738387, -1.754629, 3.294275, 0, 0.7058824, 1, 1,
0.1742921, -0.1142027, 3.497681, 0, 0.6980392, 1, 1,
0.1760986, 1.190955, 0.5879762, 0, 0.6941177, 1, 1,
0.1784369, 0.4145385, 2.62238, 0, 0.6862745, 1, 1,
0.178636, 0.6940398, 0.0327315, 0, 0.682353, 1, 1,
0.1795377, -0.4371108, 3.358521, 0, 0.6745098, 1, 1,
0.1814473, 0.1181873, -0.8628904, 0, 0.6705883, 1, 1,
0.1840564, -1.46652, 3.201127, 0, 0.6627451, 1, 1,
0.1851657, 0.2415902, -2.143731, 0, 0.6588235, 1, 1,
0.191846, 0.7099864, -0.075504, 0, 0.6509804, 1, 1,
0.1952635, -0.004876811, 1.498768, 0, 0.6470588, 1, 1,
0.1995704, 0.7485807, 1.069637, 0, 0.6392157, 1, 1,
0.2001828, -0.6672476, 1.611666, 0, 0.6352941, 1, 1,
0.2004174, 0.7496384, -1.042606, 0, 0.627451, 1, 1,
0.2044018, 0.6388122, -1.085798, 0, 0.6235294, 1, 1,
0.204539, -1.017786, 3.238346, 0, 0.6156863, 1, 1,
0.2108235, 0.618405, 0.1938575, 0, 0.6117647, 1, 1,
0.213952, -0.1077333, -1.21224, 0, 0.6039216, 1, 1,
0.2154914, -1.671013, 3.117877, 0, 0.5960785, 1, 1,
0.2158469, -1.723811, 3.04614, 0, 0.5921569, 1, 1,
0.2252643, -0.4139315, 0.5622575, 0, 0.5843138, 1, 1,
0.22661, -0.422575, 3.825813, 0, 0.5803922, 1, 1,
0.2293947, 0.2800018, 1.667122, 0, 0.572549, 1, 1,
0.2296286, 0.2553628, 1.421379, 0, 0.5686275, 1, 1,
0.2298783, -0.936959, 2.719048, 0, 0.5607843, 1, 1,
0.2312346, 1.273975, -0.4014385, 0, 0.5568628, 1, 1,
0.2331854, -1.388005, 3.262364, 0, 0.5490196, 1, 1,
0.2331866, 1.08475, 0.100564, 0, 0.5450981, 1, 1,
0.2340668, 1.976095, 0.3223219, 0, 0.5372549, 1, 1,
0.2348713, 0.103277, 2.8865, 0, 0.5333334, 1, 1,
0.2355781, -1.185273, 2.971526, 0, 0.5254902, 1, 1,
0.2379329, 0.9816065, 0.5014675, 0, 0.5215687, 1, 1,
0.2414882, -1.56745, 3.703139, 0, 0.5137255, 1, 1,
0.2431493, -0.5517072, 1.23253, 0, 0.509804, 1, 1,
0.2451229, 0.2246923, 1.508406, 0, 0.5019608, 1, 1,
0.2468338, -1.323712, 3.977141, 0, 0.4941176, 1, 1,
0.2475824, -0.2230179, 1.00016, 0, 0.4901961, 1, 1,
0.2488326, 0.8384451, 2.737925, 0, 0.4823529, 1, 1,
0.2512315, 0.2476936, 0.6271572, 0, 0.4784314, 1, 1,
0.2532057, -0.08910292, 1.850438, 0, 0.4705882, 1, 1,
0.2533435, 0.1726916, -0.1948453, 0, 0.4666667, 1, 1,
0.2675698, 0.6060256, 1.099654, 0, 0.4588235, 1, 1,
0.267716, -2.00989, 2.586226, 0, 0.454902, 1, 1,
0.2680511, -0.3465629, 3.183948, 0, 0.4470588, 1, 1,
0.2682931, 1.456038, 0.1142794, 0, 0.4431373, 1, 1,
0.2688266, -0.1192152, 1.314457, 0, 0.4352941, 1, 1,
0.2784353, 1.15546, 1.274065, 0, 0.4313726, 1, 1,
0.2790887, -0.5497961, 2.656261, 0, 0.4235294, 1, 1,
0.2801307, 0.1835692, 1.763932, 0, 0.4196078, 1, 1,
0.2807574, 0.3520205, 1.543156, 0, 0.4117647, 1, 1,
0.2825511, 1.116526, -0.03044545, 0, 0.4078431, 1, 1,
0.2881603, 0.6092277, 1.300031, 0, 0.4, 1, 1,
0.2920333, 1.231276, 0.2542537, 0, 0.3921569, 1, 1,
0.2934317, 0.5444198, -0.677778, 0, 0.3882353, 1, 1,
0.2941702, 0.6130664, 0.8795475, 0, 0.3803922, 1, 1,
0.2947733, -1.363273, 3.529614, 0, 0.3764706, 1, 1,
0.2960122, -1.580656, 1.683859, 0, 0.3686275, 1, 1,
0.2988858, 0.4917836, 2.79042, 0, 0.3647059, 1, 1,
0.300475, 1.216223, -0.4295183, 0, 0.3568628, 1, 1,
0.3165054, 1.040423, 1.075141, 0, 0.3529412, 1, 1,
0.3187373, -0.1344, 3.992323, 0, 0.345098, 1, 1,
0.3265347, 0.09739297, 1.704263, 0, 0.3411765, 1, 1,
0.3281708, -1.14725, 3.80144, 0, 0.3333333, 1, 1,
0.3282449, -0.2657179, 2.893056, 0, 0.3294118, 1, 1,
0.3295088, 0.2939934, 1.183355, 0, 0.3215686, 1, 1,
0.3301297, 0.4515533, -1.082546, 0, 0.3176471, 1, 1,
0.3327443, 1.306582, 0.302287, 0, 0.3098039, 1, 1,
0.3339703, -0.673358, 2.402871, 0, 0.3058824, 1, 1,
0.3394217, -0.26223, 3.41407, 0, 0.2980392, 1, 1,
0.3415675, 1.728939, -1.029356, 0, 0.2901961, 1, 1,
0.342858, 0.2599415, 1.731095, 0, 0.2862745, 1, 1,
0.3428756, 0.834213, -1.031088, 0, 0.2784314, 1, 1,
0.3432304, 0.7368473, -1.360937, 0, 0.2745098, 1, 1,
0.348535, 1.67802, 0.6129439, 0, 0.2666667, 1, 1,
0.3501595, 1.011112, -0.5235437, 0, 0.2627451, 1, 1,
0.3594921, -1.157104, 3.608536, 0, 0.254902, 1, 1,
0.3641631, -0.7677132, 3.212066, 0, 0.2509804, 1, 1,
0.3643203, 0.4594329, -0.2510806, 0, 0.2431373, 1, 1,
0.3649791, -1.425373, 3.502121, 0, 0.2392157, 1, 1,
0.3668836, -0.4796619, 4.326963, 0, 0.2313726, 1, 1,
0.3684428, 0.205074, 1.976044, 0, 0.227451, 1, 1,
0.3749297, -0.5529087, 3.179193, 0, 0.2196078, 1, 1,
0.3753608, 0.2725057, 0.6888535, 0, 0.2156863, 1, 1,
0.3758818, 1.684785, 0.5561778, 0, 0.2078431, 1, 1,
0.3783068, 0.8023612, -0.5052984, 0, 0.2039216, 1, 1,
0.3786822, -0.4191116, 2.630257, 0, 0.1960784, 1, 1,
0.3811785, -0.1152789, 1.688332, 0, 0.1882353, 1, 1,
0.3857479, 0.3605384, 3.381654, 0, 0.1843137, 1, 1,
0.3857938, 1.372591, -0.6664931, 0, 0.1764706, 1, 1,
0.3865646, 0.05049892, 2.127348, 0, 0.172549, 1, 1,
0.3931767, -0.4201311, 2.414088, 0, 0.1647059, 1, 1,
0.393249, 0.7739844, 0.6420222, 0, 0.1607843, 1, 1,
0.3998158, -0.7770309, 2.610152, 0, 0.1529412, 1, 1,
0.4007655, -1.110514, 3.407607, 0, 0.1490196, 1, 1,
0.4030057, 1.562945, 0.8657577, 0, 0.1411765, 1, 1,
0.4054559, 0.1420934, 2.711871, 0, 0.1372549, 1, 1,
0.4066055, -1.422577, 3.39361, 0, 0.1294118, 1, 1,
0.4077381, 0.1322838, 2.159477, 0, 0.1254902, 1, 1,
0.40817, 0.4644534, 1.989199, 0, 0.1176471, 1, 1,
0.4087155, 1.138355, -2.145715, 0, 0.1137255, 1, 1,
0.4107588, -1.250635, 2.170593, 0, 0.1058824, 1, 1,
0.4127476, 0.7034478, 0.7184203, 0, 0.09803922, 1, 1,
0.413994, 0.3661081, 0.9230328, 0, 0.09411765, 1, 1,
0.4181724, -0.8297719, 2.170187, 0, 0.08627451, 1, 1,
0.4220597, 0.8882684, 0.04327785, 0, 0.08235294, 1, 1,
0.4262366, 1.280765, 1.26739, 0, 0.07450981, 1, 1,
0.4264927, -0.4162863, 4.109716, 0, 0.07058824, 1, 1,
0.4268004, -0.8291087, 0.6519117, 0, 0.0627451, 1, 1,
0.4271788, 0.5246338, 0.389825, 0, 0.05882353, 1, 1,
0.4279817, 0.3333583, 0.01847986, 0, 0.05098039, 1, 1,
0.4309813, -0.9577054, 3.086477, 0, 0.04705882, 1, 1,
0.4316564, -2.529328, 4.722117, 0, 0.03921569, 1, 1,
0.43335, -0.1603547, 1.476665, 0, 0.03529412, 1, 1,
0.435327, 0.9102665, -0.004422095, 0, 0.02745098, 1, 1,
0.4358175, 0.744616, 0.3067752, 0, 0.02352941, 1, 1,
0.4415005, 0.9014473, 0.2262674, 0, 0.01568628, 1, 1,
0.4450622, 1.032399, -0.9620925, 0, 0.01176471, 1, 1,
0.4450927, -0.01310099, 1.190707, 0, 0.003921569, 1, 1,
0.4526426, -0.01116007, 1.663448, 0.003921569, 0, 1, 1,
0.456562, -0.5438654, 2.767432, 0.007843138, 0, 1, 1,
0.4590497, 0.3809235, 2.482613, 0.01568628, 0, 1, 1,
0.4726723, 0.05840228, 1.184681, 0.01960784, 0, 1, 1,
0.4728136, 1.084887, 0.8374636, 0.02745098, 0, 1, 1,
0.4745533, -0.4138439, 1.546502, 0.03137255, 0, 1, 1,
0.4778287, -0.138779, 2.211691, 0.03921569, 0, 1, 1,
0.4779984, 0.9494184, 0.8393399, 0.04313726, 0, 1, 1,
0.484498, -1.089625, 4.074683, 0.05098039, 0, 1, 1,
0.4879937, 0.8193859, -1.267642, 0.05490196, 0, 1, 1,
0.4884641, 0.6609334, 1.193994, 0.0627451, 0, 1, 1,
0.491656, -1.462384, 3.65767, 0.06666667, 0, 1, 1,
0.4918326, -2.050363, 2.545873, 0.07450981, 0, 1, 1,
0.4921731, -0.599597, 2.004458, 0.07843138, 0, 1, 1,
0.492505, 1.161185, 1.193531, 0.08627451, 0, 1, 1,
0.5044811, -0.1950749, 2.176347, 0.09019608, 0, 1, 1,
0.5074609, 0.5085814, -1.135227, 0.09803922, 0, 1, 1,
0.5099168, -0.05973951, 0.9586681, 0.1058824, 0, 1, 1,
0.5119363, 0.6047119, 1.289245, 0.1098039, 0, 1, 1,
0.5137047, -0.2271471, 3.478381, 0.1176471, 0, 1, 1,
0.5138385, -1.336361, 1.88933, 0.1215686, 0, 1, 1,
0.5152912, -0.6858001, 2.347124, 0.1294118, 0, 1, 1,
0.5155107, 0.9904217, 0.2291864, 0.1333333, 0, 1, 1,
0.5165244, -0.00920866, 1.906611, 0.1411765, 0, 1, 1,
0.5177177, 0.6078846, 0.7866732, 0.145098, 0, 1, 1,
0.5203232, -2.172079, 3.499392, 0.1529412, 0, 1, 1,
0.5207215, 1.105192, 0.8050211, 0.1568628, 0, 1, 1,
0.5226861, -1.277486, 4.742119, 0.1647059, 0, 1, 1,
0.5257084, -0.09891986, 2.326206, 0.1686275, 0, 1, 1,
0.5271639, 1.047411, 1.400291, 0.1764706, 0, 1, 1,
0.5294162, -0.4906299, 3.461779, 0.1803922, 0, 1, 1,
0.5306664, -0.8117955, 1.292241, 0.1882353, 0, 1, 1,
0.5309289, -0.05913617, 1.961712, 0.1921569, 0, 1, 1,
0.5391141, 1.215312, -0.1992395, 0.2, 0, 1, 1,
0.5406045, 0.4002864, 1.217233, 0.2078431, 0, 1, 1,
0.5416045, -0.1099752, 2.308433, 0.2117647, 0, 1, 1,
0.544944, -0.8873793, 2.996963, 0.2196078, 0, 1, 1,
0.5452021, -0.4624806, 1.498692, 0.2235294, 0, 1, 1,
0.5488763, -0.7637357, 1.990599, 0.2313726, 0, 1, 1,
0.5508723, 0.3606503, 1.723933, 0.2352941, 0, 1, 1,
0.5518759, -0.8197967, 3.937672, 0.2431373, 0, 1, 1,
0.5565259, 1.421164, 1.402301, 0.2470588, 0, 1, 1,
0.5589332, 0.4979478, -0.4544255, 0.254902, 0, 1, 1,
0.5610793, 1.719466, 2.057449, 0.2588235, 0, 1, 1,
0.5672294, 1.236603, -0.9851253, 0.2666667, 0, 1, 1,
0.5728914, -0.5994427, 2.992455, 0.2705882, 0, 1, 1,
0.5743442, -1.583421, 2.91834, 0.2784314, 0, 1, 1,
0.5765306, 1.01896, -1.337409, 0.282353, 0, 1, 1,
0.5784917, -2.208774, 3.104126, 0.2901961, 0, 1, 1,
0.5834538, 1.174538, 1.812125, 0.2941177, 0, 1, 1,
0.5843341, 0.1509319, 2.520585, 0.3019608, 0, 1, 1,
0.5907767, -0.4630758, 3.462332, 0.3098039, 0, 1, 1,
0.5908518, -1.453191, 3.815907, 0.3137255, 0, 1, 1,
0.594312, 1.220192, 0.2902152, 0.3215686, 0, 1, 1,
0.5946211, 0.7333803, 0.475827, 0.3254902, 0, 1, 1,
0.5962833, 0.9668853, -0.5956085, 0.3333333, 0, 1, 1,
0.596733, -0.7639349, 3.946476, 0.3372549, 0, 1, 1,
0.5985708, 0.4521799, 0.5272524, 0.345098, 0, 1, 1,
0.5990475, -1.369747, 4.183305, 0.3490196, 0, 1, 1,
0.6035786, -0.4108, 1.267031, 0.3568628, 0, 1, 1,
0.6078529, -0.3556228, 1.13323, 0.3607843, 0, 1, 1,
0.6087756, -0.7167051, 2.50763, 0.3686275, 0, 1, 1,
0.615813, -0.7094932, 3.893746, 0.372549, 0, 1, 1,
0.6171926, -1.810239, 2.515536, 0.3803922, 0, 1, 1,
0.6181862, 0.6081584, 1.045035, 0.3843137, 0, 1, 1,
0.618241, 1.161324, 0.5557187, 0.3921569, 0, 1, 1,
0.6207061, 0.0360852, 0.5108936, 0.3960784, 0, 1, 1,
0.6249542, 0.8469673, 1.018666, 0.4039216, 0, 1, 1,
0.6262807, 1.072079, 2.381618, 0.4117647, 0, 1, 1,
0.62651, -1.455145, 3.971033, 0.4156863, 0, 1, 1,
0.6288151, -1.052163, 3.14961, 0.4235294, 0, 1, 1,
0.629227, 0.2032933, 1.661576, 0.427451, 0, 1, 1,
0.6326793, -1.772898, 2.604274, 0.4352941, 0, 1, 1,
0.6352981, 0.3471152, -0.1550776, 0.4392157, 0, 1, 1,
0.6368552, 1.873706, -1.028909, 0.4470588, 0, 1, 1,
0.6393127, -0.8334106, 4.715885, 0.4509804, 0, 1, 1,
0.6393358, 0.721503, 0.03739376, 0.4588235, 0, 1, 1,
0.6480988, -0.6426645, 1.914403, 0.4627451, 0, 1, 1,
0.6498437, -0.4609633, 2.528478, 0.4705882, 0, 1, 1,
0.6570449, -1.908333, 3.238759, 0.4745098, 0, 1, 1,
0.6579974, -0.1573441, 1.457052, 0.4823529, 0, 1, 1,
0.6609966, 0.868357, 1.730281, 0.4862745, 0, 1, 1,
0.6635882, 0.85888, 0.9793183, 0.4941176, 0, 1, 1,
0.6655894, -0.7484764, 2.302086, 0.5019608, 0, 1, 1,
0.6688486, 0.6601835, 1.971168, 0.5058824, 0, 1, 1,
0.6700763, 0.04924597, 1.635426, 0.5137255, 0, 1, 1,
0.6707761, 0.347868, 1.669684, 0.5176471, 0, 1, 1,
0.6773611, -1.720467, 2.998986, 0.5254902, 0, 1, 1,
0.6774856, 0.1846878, 0.4199076, 0.5294118, 0, 1, 1,
0.6823115, 2.223485, -0.08561219, 0.5372549, 0, 1, 1,
0.685968, -0.2342655, 2.31803, 0.5411765, 0, 1, 1,
0.6869024, -0.34278, 3.984358, 0.5490196, 0, 1, 1,
0.7043976, -0.7475532, 4.442062, 0.5529412, 0, 1, 1,
0.7089667, 0.6681369, 0.04841607, 0.5607843, 0, 1, 1,
0.7157126, -1.643902, 1.964509, 0.5647059, 0, 1, 1,
0.7159083, -0.4841117, 4.063721, 0.572549, 0, 1, 1,
0.7208037, 0.4469005, 0.2033292, 0.5764706, 0, 1, 1,
0.7222365, -0.752185, 1.895451, 0.5843138, 0, 1, 1,
0.7379121, -0.04453126, 0.6132186, 0.5882353, 0, 1, 1,
0.7402625, 0.6985688, -0.4564476, 0.5960785, 0, 1, 1,
0.7428383, 1.43224, 0.8803381, 0.6039216, 0, 1, 1,
0.7450423, 0.2489184, 1.877627, 0.6078432, 0, 1, 1,
0.7505778, -0.2989935, 1.867653, 0.6156863, 0, 1, 1,
0.7549654, -0.09313159, 0.6959032, 0.6196079, 0, 1, 1,
0.7615747, 1.812198, -1.602287, 0.627451, 0, 1, 1,
0.7687719, 0.9980201, 0.01408084, 0.6313726, 0, 1, 1,
0.7714055, 0.6227437, -0.8911731, 0.6392157, 0, 1, 1,
0.7740543, -0.9419543, 1.302845, 0.6431373, 0, 1, 1,
0.7787539, 0.1588922, 0.1550335, 0.6509804, 0, 1, 1,
0.7821212, 0.1709529, 2.873296, 0.654902, 0, 1, 1,
0.7875702, -0.8083366, 1.727935, 0.6627451, 0, 1, 1,
0.7879278, 0.1884845, 1.426511, 0.6666667, 0, 1, 1,
0.7890686, 0.320857, 1.465795, 0.6745098, 0, 1, 1,
0.7968861, -1.513402, 2.62955, 0.6784314, 0, 1, 1,
0.7976462, -0.9619568, 2.21355, 0.6862745, 0, 1, 1,
0.8018953, -1.085992, 2.765088, 0.6901961, 0, 1, 1,
0.8034662, 0.4363309, 2.614998, 0.6980392, 0, 1, 1,
0.8082651, 1.138269, -0.2361624, 0.7058824, 0, 1, 1,
0.8084491, 0.6866057, -0.3048387, 0.7098039, 0, 1, 1,
0.8107219, 1.100735, -0.2066426, 0.7176471, 0, 1, 1,
0.8114403, 0.5472001, 1.849226, 0.7215686, 0, 1, 1,
0.817636, 1.06036, 1.515403, 0.7294118, 0, 1, 1,
0.8195047, 0.05092043, 2.023826, 0.7333333, 0, 1, 1,
0.8315631, 0.5085225, -1.333495, 0.7411765, 0, 1, 1,
0.8355289, -1.059718, 2.095347, 0.7450981, 0, 1, 1,
0.8428398, -0.09620918, 1.271554, 0.7529412, 0, 1, 1,
0.8502052, -0.5310761, 1.802638, 0.7568628, 0, 1, 1,
0.853379, 0.1674218, -0.2527127, 0.7647059, 0, 1, 1,
0.8543758, 0.02535343, 1.574448, 0.7686275, 0, 1, 1,
0.8546221, -0.2099776, 3.993801, 0.7764706, 0, 1, 1,
0.8548264, -0.03326552, 1.689798, 0.7803922, 0, 1, 1,
0.8563851, -0.6099991, 1.738148, 0.7882353, 0, 1, 1,
0.8649769, -0.5439307, 1.422293, 0.7921569, 0, 1, 1,
0.8672742, 2.531053, -0.6248956, 0.8, 0, 1, 1,
0.8675725, 0.9327675, -0.01372646, 0.8078431, 0, 1, 1,
0.8708254, -0.8695196, 3.968808, 0.8117647, 0, 1, 1,
0.875898, 0.002929408, 1.834742, 0.8196079, 0, 1, 1,
0.8762071, 1.088244, 2.912127, 0.8235294, 0, 1, 1,
0.8766066, -0.8477776, 0.4140706, 0.8313726, 0, 1, 1,
0.8820733, -0.5039569, 0.4683681, 0.8352941, 0, 1, 1,
0.8824211, 0.3892546, 2.396031, 0.8431373, 0, 1, 1,
0.8851808, -0.5558987, 0.1185598, 0.8470588, 0, 1, 1,
0.8854141, 1.393403, 1.464454, 0.854902, 0, 1, 1,
0.8877639, -0.3094699, 2.451228, 0.8588235, 0, 1, 1,
0.8928884, -1.497761, 3.37446, 0.8666667, 0, 1, 1,
0.8931847, -1.013405, 3.347769, 0.8705882, 0, 1, 1,
0.9055089, 0.05016847, 1.498237, 0.8784314, 0, 1, 1,
0.9076655, 0.556394, 0.4047853, 0.8823529, 0, 1, 1,
0.9082732, -0.09161805, 1.491992, 0.8901961, 0, 1, 1,
0.9192766, 0.413653, 3.466444, 0.8941177, 0, 1, 1,
0.9223853, 0.08562607, 1.179539, 0.9019608, 0, 1, 1,
0.9234944, -0.9095935, 0.9294316, 0.9098039, 0, 1, 1,
0.9253402, 0.7464227, 4.611041, 0.9137255, 0, 1, 1,
0.9266441, 0.904748, -0.8374425, 0.9215686, 0, 1, 1,
0.9306046, -0.3321022, 3.211396, 0.9254902, 0, 1, 1,
0.9308135, 0.6584621, 1.424348, 0.9333333, 0, 1, 1,
0.9322641, 0.7100936, 0.0172352, 0.9372549, 0, 1, 1,
0.9377951, -0.916724, 1.179492, 0.945098, 0, 1, 1,
0.945675, -2.054146, 1.901795, 0.9490196, 0, 1, 1,
0.9501548, -0.7815617, 2.200462, 0.9568627, 0, 1, 1,
0.9528019, -2.229962, 3.823972, 0.9607843, 0, 1, 1,
0.9651613, 0.7604163, 0.6184362, 0.9686275, 0, 1, 1,
0.9652688, -1.066283, 3.975701, 0.972549, 0, 1, 1,
0.9655717, 0.9354456, 0.4841353, 0.9803922, 0, 1, 1,
0.9695894, -0.8832963, 1.902917, 0.9843137, 0, 1, 1,
0.9745847, -0.3498871, 1.965082, 0.9921569, 0, 1, 1,
0.9889278, 0.1208917, 0.2097051, 0.9960784, 0, 1, 1,
0.9936623, 0.7264421, 1.486517, 1, 0, 0.9960784, 1,
0.995298, -0.9177791, 3.446474, 1, 0, 0.9882353, 1,
0.9991678, -1.419307, 2.69018, 1, 0, 0.9843137, 1,
1.004421, -0.5168191, 2.83729, 1, 0, 0.9764706, 1,
1.005512, 0.1603264, 0.9386653, 1, 0, 0.972549, 1,
1.013413, -0.8184983, 2.950436, 1, 0, 0.9647059, 1,
1.017064, 1.958796, 1.977034, 1, 0, 0.9607843, 1,
1.020023, 0.970816, 0.9127864, 1, 0, 0.9529412, 1,
1.022923, -0.3280644, 1.985308, 1, 0, 0.9490196, 1,
1.025521, 0.05656961, 1.305668, 1, 0, 0.9411765, 1,
1.02684, -0.7742167, 0.5313755, 1, 0, 0.9372549, 1,
1.030954, -0.6965364, 2.751755, 1, 0, 0.9294118, 1,
1.046178, 2.248217, -0.6895509, 1, 0, 0.9254902, 1,
1.055679, 0.02613335, 1.15726, 1, 0, 0.9176471, 1,
1.056392, -0.7771641, 3.716037, 1, 0, 0.9137255, 1,
1.077899, 1.138255, 0.8709866, 1, 0, 0.9058824, 1,
1.078197, 1.753711, 1.461805, 1, 0, 0.9019608, 1,
1.079615, -0.2899533, 0.2862986, 1, 0, 0.8941177, 1,
1.081866, 0.9595222, 0.160399, 1, 0, 0.8862745, 1,
1.085052, 1.264953, 0.4123832, 1, 0, 0.8823529, 1,
1.087429, 0.4868976, 1.829896, 1, 0, 0.8745098, 1,
1.094732, 0.8718061, 2.028347, 1, 0, 0.8705882, 1,
1.09501, 0.4027219, 0.255875, 1, 0, 0.8627451, 1,
1.096951, -0.8198645, 2.478754, 1, 0, 0.8588235, 1,
1.098784, 0.6868296, 1.027632, 1, 0, 0.8509804, 1,
1.099553, 0.2077051, 1.866603, 1, 0, 0.8470588, 1,
1.101274, -1.007193, 2.438311, 1, 0, 0.8392157, 1,
1.104057, 0.08101907, 0.9685732, 1, 0, 0.8352941, 1,
1.111928, 0.9872925, 0.7394035, 1, 0, 0.827451, 1,
1.117737, 0.4870229, 2.820925, 1, 0, 0.8235294, 1,
1.11809, -0.002643545, 2.302816, 1, 0, 0.8156863, 1,
1.11857, -0.05458285, 2.236873, 1, 0, 0.8117647, 1,
1.125273, -1.506858, 4.082059, 1, 0, 0.8039216, 1,
1.128528, -0.5765982, 1.386153, 1, 0, 0.7960784, 1,
1.130395, 0.4610156, 0.017468, 1, 0, 0.7921569, 1,
1.132734, 1.904146, -0.2619279, 1, 0, 0.7843137, 1,
1.133536, -0.4499036, 1.692729, 1, 0, 0.7803922, 1,
1.13847, -0.8744916, 1.594626, 1, 0, 0.772549, 1,
1.139591, 0.858989, 1.658901, 1, 0, 0.7686275, 1,
1.141304, -0.3116108, 1.142253, 1, 0, 0.7607843, 1,
1.147808, -0.3692071, 1.255906, 1, 0, 0.7568628, 1,
1.172226, 1.47408, 0.5631264, 1, 0, 0.7490196, 1,
1.17524, 1.182628, 0.5305447, 1, 0, 0.7450981, 1,
1.180077, 1.558368, 2.029581, 1, 0, 0.7372549, 1,
1.182428, 0.3642564, 1.43758, 1, 0, 0.7333333, 1,
1.184963, 0.2310275, 0.8782892, 1, 0, 0.7254902, 1,
1.189328, -0.543793, 2.039419, 1, 0, 0.7215686, 1,
1.200809, 3.295469, 0.7830029, 1, 0, 0.7137255, 1,
1.201961, -1.460806, 3.02167, 1, 0, 0.7098039, 1,
1.202505, 1.650157, -0.6325721, 1, 0, 0.7019608, 1,
1.207798, -0.8698289, 1.442453, 1, 0, 0.6941177, 1,
1.212128, -1.442737, 1.592832, 1, 0, 0.6901961, 1,
1.218872, 0.06413541, 0.7735865, 1, 0, 0.682353, 1,
1.224057, 0.136827, 1.164683, 1, 0, 0.6784314, 1,
1.226471, 0.9967271, -1.298862, 1, 0, 0.6705883, 1,
1.236421, -0.7953088, 2.026536, 1, 0, 0.6666667, 1,
1.244731, 0.2440017, 1.082025, 1, 0, 0.6588235, 1,
1.245852, -0.01995889, 1.415321, 1, 0, 0.654902, 1,
1.248597, 0.5806655, 3.899305, 1, 0, 0.6470588, 1,
1.250852, -0.5512949, 1.658542, 1, 0, 0.6431373, 1,
1.258494, -1.815524, 1.347816, 1, 0, 0.6352941, 1,
1.259038, 0.06788149, 3.73961, 1, 0, 0.6313726, 1,
1.261716, -0.8473709, 4.168796, 1, 0, 0.6235294, 1,
1.263997, 0.6870196, 1.539744, 1, 0, 0.6196079, 1,
1.274408, 0.6083076, 0.6927863, 1, 0, 0.6117647, 1,
1.276978, -1.834693, 1.816972, 1, 0, 0.6078432, 1,
1.279193, 1.483907, 0.1947934, 1, 0, 0.6, 1,
1.283668, 0.9823378, 0.6617144, 1, 0, 0.5921569, 1,
1.284404, -0.301908, 2.183634, 1, 0, 0.5882353, 1,
1.285188, -0.1943937, 1.849708, 1, 0, 0.5803922, 1,
1.286057, -1.322368, 1.615343, 1, 0, 0.5764706, 1,
1.292968, 0.06302152, 0.9418995, 1, 0, 0.5686275, 1,
1.296261, 0.6495601, 0.7341498, 1, 0, 0.5647059, 1,
1.300305, 0.2728117, 0.7069908, 1, 0, 0.5568628, 1,
1.303679, 1.088414, -0.8083689, 1, 0, 0.5529412, 1,
1.305994, -0.3183947, 2.540511, 1, 0, 0.5450981, 1,
1.338261, 0.5364308, -1.121505, 1, 0, 0.5411765, 1,
1.341765, -0.7646533, 0.01891088, 1, 0, 0.5333334, 1,
1.343519, -1.258767, 2.049987, 1, 0, 0.5294118, 1,
1.346738, -1.518865, 1.767589, 1, 0, 0.5215687, 1,
1.347938, -0.04350007, 2.214387, 1, 0, 0.5176471, 1,
1.363501, -0.4931607, 0.8329011, 1, 0, 0.509804, 1,
1.373126, -0.2582271, 2.775554, 1, 0, 0.5058824, 1,
1.375722, -1.600859, 2.991421, 1, 0, 0.4980392, 1,
1.376547, -0.05824975, 2.693335, 1, 0, 0.4901961, 1,
1.380218, -0.4973331, 1.656078, 1, 0, 0.4862745, 1,
1.381235, 0.684536, 1.281757, 1, 0, 0.4784314, 1,
1.385478, -0.6816497, 1.039387, 1, 0, 0.4745098, 1,
1.387095, 0.3540145, 0.4268935, 1, 0, 0.4666667, 1,
1.402552, -0.8118432, 1.489858, 1, 0, 0.4627451, 1,
1.417627, 0.2721086, 3.144603, 1, 0, 0.454902, 1,
1.418878, -1.100305, 0.6711668, 1, 0, 0.4509804, 1,
1.425719, -1.339732, 0.7311443, 1, 0, 0.4431373, 1,
1.430045, 1.245582, 1.252613, 1, 0, 0.4392157, 1,
1.450203, -1.461457, 0.9004158, 1, 0, 0.4313726, 1,
1.455768, -0.3546408, 2.437946, 1, 0, 0.427451, 1,
1.468436, 1.235187, 1.887091, 1, 0, 0.4196078, 1,
1.469516, -0.25047, 0.7032081, 1, 0, 0.4156863, 1,
1.472815, -0.07166477, 0.9147173, 1, 0, 0.4078431, 1,
1.479484, 1.672817, 1.341553, 1, 0, 0.4039216, 1,
1.488163, -0.4051605, 3.617725, 1, 0, 0.3960784, 1,
1.506825, -0.5702114, 1.232962, 1, 0, 0.3882353, 1,
1.515294, 0.04834504, 1.718918, 1, 0, 0.3843137, 1,
1.51749, -0.390224, 3.602633, 1, 0, 0.3764706, 1,
1.524235, 1.047465, 1.041522, 1, 0, 0.372549, 1,
1.537928, 0.3131889, 0.2200467, 1, 0, 0.3647059, 1,
1.544234, 1.741595, 1.175869, 1, 0, 0.3607843, 1,
1.553985, -1.403036, 2.3441, 1, 0, 0.3529412, 1,
1.562987, -0.7450485, 2.26116, 1, 0, 0.3490196, 1,
1.566437, 2.308567, -1.110845, 1, 0, 0.3411765, 1,
1.569999, 1.660876, -0.8569639, 1, 0, 0.3372549, 1,
1.583983, 0.9244703, 2.689692, 1, 0, 0.3294118, 1,
1.593962, -0.2516885, 1.444412, 1, 0, 0.3254902, 1,
1.598495, 0.2525741, 0.5936916, 1, 0, 0.3176471, 1,
1.600311, 0.3469203, 3.439214, 1, 0, 0.3137255, 1,
1.601998, 1.474731, 1.050294, 1, 0, 0.3058824, 1,
1.602761, 0.9648864, 3.146381, 1, 0, 0.2980392, 1,
1.624419, 0.9737214, 0.4534899, 1, 0, 0.2941177, 1,
1.663779, -0.5843694, 2.817433, 1, 0, 0.2862745, 1,
1.69713, 0.1931569, 3.208884, 1, 0, 0.282353, 1,
1.697538, -1.674969, 1.445124, 1, 0, 0.2745098, 1,
1.698408, 0.297525, -0.2240816, 1, 0, 0.2705882, 1,
1.711812, 1.089152, 2.972443, 1, 0, 0.2627451, 1,
1.743579, -1.306051, 0.7882872, 1, 0, 0.2588235, 1,
1.748302, -0.1236468, 1.186775, 1, 0, 0.2509804, 1,
1.750965, -0.01245809, 2.874604, 1, 0, 0.2470588, 1,
1.766763, -1.655756, 2.092705, 1, 0, 0.2392157, 1,
1.778028, 0.4835004, 1.961038, 1, 0, 0.2352941, 1,
1.789398, 0.550675, 1.828461, 1, 0, 0.227451, 1,
1.812682, -1.333659, 1.747833, 1, 0, 0.2235294, 1,
1.819241, 1.633571, -0.09274756, 1, 0, 0.2156863, 1,
1.88537, 0.6849776, 0.5247869, 1, 0, 0.2117647, 1,
1.902434, -0.3214433, 3.461498, 1, 0, 0.2039216, 1,
1.908433, -1.178955, 1.711173, 1, 0, 0.1960784, 1,
1.912989, -0.5274043, 2.637424, 1, 0, 0.1921569, 1,
1.91841, -0.1584071, 0.9259273, 1, 0, 0.1843137, 1,
1.919131, -1.670118, 1.547409, 1, 0, 0.1803922, 1,
1.934857, 2.524755, 3.970322, 1, 0, 0.172549, 1,
1.968258, -0.0988729, 1.743146, 1, 0, 0.1686275, 1,
1.973651, 0.4963134, -0.520936, 1, 0, 0.1607843, 1,
2.037878, 2.524412, -0.9937077, 1, 0, 0.1568628, 1,
2.03847, -0.7618685, 1.792005, 1, 0, 0.1490196, 1,
2.045348, -0.1767158, 1.916247, 1, 0, 0.145098, 1,
2.058381, 1.759113, 0.6369603, 1, 0, 0.1372549, 1,
2.077758, -0.7422026, 2.147796, 1, 0, 0.1333333, 1,
2.093259, 0.7068334, 0.459117, 1, 0, 0.1254902, 1,
2.109479, 1.886632, 1.615707, 1, 0, 0.1215686, 1,
2.113854, 0.6413414, 1.238048, 1, 0, 0.1137255, 1,
2.121264, 0.7650515, 1.51783, 1, 0, 0.1098039, 1,
2.152488, -0.7146664, 0.234724, 1, 0, 0.1019608, 1,
2.238364, -0.5417051, -0.03032384, 1, 0, 0.09411765, 1,
2.246566, 0.8157125, 2.794536, 1, 0, 0.09019608, 1,
2.291756, 1.296977, 2.423195, 1, 0, 0.08235294, 1,
2.334393, -0.1778668, 0.7251254, 1, 0, 0.07843138, 1,
2.335674, 0.009205434, 2.320346, 1, 0, 0.07058824, 1,
2.338986, 0.9072594, 2.04947, 1, 0, 0.06666667, 1,
2.369434, 0.3806418, 1.578775, 1, 0, 0.05882353, 1,
2.485434, 0.7304628, 2.340535, 1, 0, 0.05490196, 1,
2.502609, 0.0618563, 1.948406, 1, 0, 0.04705882, 1,
2.58487, -0.1135951, 1.331182, 1, 0, 0.04313726, 1,
2.615942, 0.5544497, 0.9852437, 1, 0, 0.03529412, 1,
2.633433, 2.042203, 0.459044, 1, 0, 0.03137255, 1,
2.713228, -0.7826687, 1.179705, 1, 0, 0.02352941, 1,
3.255865, -0.5733243, 2.256269, 1, 0, 0.01960784, 1,
3.257288, 0.9450503, 1.863492, 1, 0, 0.01176471, 1,
3.315049, -0.6392485, 1.418543, 1, 0, 0.007843138, 1
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
0.1119425, -3.985327, -7.138375, 0, -0.5, 0.5, 0.5,
0.1119425, -3.985327, -7.138375, 1, -0.5, 0.5, 0.5,
0.1119425, -3.985327, -7.138375, 1, 1.5, 0.5, 0.5,
0.1119425, -3.985327, -7.138375, 0, 1.5, 0.5, 0.5
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
-4.177018, 0.1826876, -7.138375, 0, -0.5, 0.5, 0.5,
-4.177018, 0.1826876, -7.138375, 1, -0.5, 0.5, 0.5,
-4.177018, 0.1826876, -7.138375, 1, 1.5, 0.5, 0.5,
-4.177018, 0.1826876, -7.138375, 0, 1.5, 0.5, 0.5
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
-4.177018, -3.985327, -0.2195263, 0, -0.5, 0.5, 0.5,
-4.177018, -3.985327, -0.2195263, 1, -0.5, 0.5, 0.5,
-4.177018, -3.985327, -0.2195263, 1, 1.5, 0.5, 0.5,
-4.177018, -3.985327, -0.2195263, 0, 1.5, 0.5, 0.5
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
-3, -3.023478, -5.541718,
3, -3.023478, -5.541718,
-3, -3.023478, -5.541718,
-3, -3.183786, -5.807827,
-2, -3.023478, -5.541718,
-2, -3.183786, -5.807827,
-1, -3.023478, -5.541718,
-1, -3.183786, -5.807827,
0, -3.023478, -5.541718,
0, -3.183786, -5.807827,
1, -3.023478, -5.541718,
1, -3.183786, -5.807827,
2, -3.023478, -5.541718,
2, -3.183786, -5.807827,
3, -3.023478, -5.541718,
3, -3.183786, -5.807827
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
-3, -3.504402, -6.340046, 0, -0.5, 0.5, 0.5,
-3, -3.504402, -6.340046, 1, -0.5, 0.5, 0.5,
-3, -3.504402, -6.340046, 1, 1.5, 0.5, 0.5,
-3, -3.504402, -6.340046, 0, 1.5, 0.5, 0.5,
-2, -3.504402, -6.340046, 0, -0.5, 0.5, 0.5,
-2, -3.504402, -6.340046, 1, -0.5, 0.5, 0.5,
-2, -3.504402, -6.340046, 1, 1.5, 0.5, 0.5,
-2, -3.504402, -6.340046, 0, 1.5, 0.5, 0.5,
-1, -3.504402, -6.340046, 0, -0.5, 0.5, 0.5,
-1, -3.504402, -6.340046, 1, -0.5, 0.5, 0.5,
-1, -3.504402, -6.340046, 1, 1.5, 0.5, 0.5,
-1, -3.504402, -6.340046, 0, 1.5, 0.5, 0.5,
0, -3.504402, -6.340046, 0, -0.5, 0.5, 0.5,
0, -3.504402, -6.340046, 1, -0.5, 0.5, 0.5,
0, -3.504402, -6.340046, 1, 1.5, 0.5, 0.5,
0, -3.504402, -6.340046, 0, 1.5, 0.5, 0.5,
1, -3.504402, -6.340046, 0, -0.5, 0.5, 0.5,
1, -3.504402, -6.340046, 1, -0.5, 0.5, 0.5,
1, -3.504402, -6.340046, 1, 1.5, 0.5, 0.5,
1, -3.504402, -6.340046, 0, 1.5, 0.5, 0.5,
2, -3.504402, -6.340046, 0, -0.5, 0.5, 0.5,
2, -3.504402, -6.340046, 1, -0.5, 0.5, 0.5,
2, -3.504402, -6.340046, 1, 1.5, 0.5, 0.5,
2, -3.504402, -6.340046, 0, 1.5, 0.5, 0.5,
3, -3.504402, -6.340046, 0, -0.5, 0.5, 0.5,
3, -3.504402, -6.340046, 1, -0.5, 0.5, 0.5,
3, -3.504402, -6.340046, 1, 1.5, 0.5, 0.5,
3, -3.504402, -6.340046, 0, 1.5, 0.5, 0.5
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
-3.187258, -2, -5.541718,
-3.187258, 3, -5.541718,
-3.187258, -2, -5.541718,
-3.352218, -2, -5.807827,
-3.187258, -1, -5.541718,
-3.352218, -1, -5.807827,
-3.187258, 0, -5.541718,
-3.352218, 0, -5.807827,
-3.187258, 1, -5.541718,
-3.352218, 1, -5.807827,
-3.187258, 2, -5.541718,
-3.352218, 2, -5.807827,
-3.187258, 3, -5.541718,
-3.352218, 3, -5.807827
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
-3.682137, -2, -6.340046, 0, -0.5, 0.5, 0.5,
-3.682137, -2, -6.340046, 1, -0.5, 0.5, 0.5,
-3.682137, -2, -6.340046, 1, 1.5, 0.5, 0.5,
-3.682137, -2, -6.340046, 0, 1.5, 0.5, 0.5,
-3.682137, -1, -6.340046, 0, -0.5, 0.5, 0.5,
-3.682137, -1, -6.340046, 1, -0.5, 0.5, 0.5,
-3.682137, -1, -6.340046, 1, 1.5, 0.5, 0.5,
-3.682137, -1, -6.340046, 0, 1.5, 0.5, 0.5,
-3.682137, 0, -6.340046, 0, -0.5, 0.5, 0.5,
-3.682137, 0, -6.340046, 1, -0.5, 0.5, 0.5,
-3.682137, 0, -6.340046, 1, 1.5, 0.5, 0.5,
-3.682137, 0, -6.340046, 0, 1.5, 0.5, 0.5,
-3.682137, 1, -6.340046, 0, -0.5, 0.5, 0.5,
-3.682137, 1, -6.340046, 1, -0.5, 0.5, 0.5,
-3.682137, 1, -6.340046, 1, 1.5, 0.5, 0.5,
-3.682137, 1, -6.340046, 0, 1.5, 0.5, 0.5,
-3.682137, 2, -6.340046, 0, -0.5, 0.5, 0.5,
-3.682137, 2, -6.340046, 1, -0.5, 0.5, 0.5,
-3.682137, 2, -6.340046, 1, 1.5, 0.5, 0.5,
-3.682137, 2, -6.340046, 0, 1.5, 0.5, 0.5,
-3.682137, 3, -6.340046, 0, -0.5, 0.5, 0.5,
-3.682137, 3, -6.340046, 1, -0.5, 0.5, 0.5,
-3.682137, 3, -6.340046, 1, 1.5, 0.5, 0.5,
-3.682137, 3, -6.340046, 0, 1.5, 0.5, 0.5
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
-3.187258, -3.023478, -4,
-3.187258, -3.023478, 4,
-3.187258, -3.023478, -4,
-3.352218, -3.183786, -4,
-3.187258, -3.023478, -2,
-3.352218, -3.183786, -2,
-3.187258, -3.023478, 0,
-3.352218, -3.183786, 0,
-3.187258, -3.023478, 2,
-3.352218, -3.183786, 2,
-3.187258, -3.023478, 4,
-3.352218, -3.183786, 4
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
-3.682137, -3.504402, -4, 0, -0.5, 0.5, 0.5,
-3.682137, -3.504402, -4, 1, -0.5, 0.5, 0.5,
-3.682137, -3.504402, -4, 1, 1.5, 0.5, 0.5,
-3.682137, -3.504402, -4, 0, 1.5, 0.5, 0.5,
-3.682137, -3.504402, -2, 0, -0.5, 0.5, 0.5,
-3.682137, -3.504402, -2, 1, -0.5, 0.5, 0.5,
-3.682137, -3.504402, -2, 1, 1.5, 0.5, 0.5,
-3.682137, -3.504402, -2, 0, 1.5, 0.5, 0.5,
-3.682137, -3.504402, 0, 0, -0.5, 0.5, 0.5,
-3.682137, -3.504402, 0, 1, -0.5, 0.5, 0.5,
-3.682137, -3.504402, 0, 1, 1.5, 0.5, 0.5,
-3.682137, -3.504402, 0, 0, 1.5, 0.5, 0.5,
-3.682137, -3.504402, 2, 0, -0.5, 0.5, 0.5,
-3.682137, -3.504402, 2, 1, -0.5, 0.5, 0.5,
-3.682137, -3.504402, 2, 1, 1.5, 0.5, 0.5,
-3.682137, -3.504402, 2, 0, 1.5, 0.5, 0.5,
-3.682137, -3.504402, 4, 0, -0.5, 0.5, 0.5,
-3.682137, -3.504402, 4, 1, -0.5, 0.5, 0.5,
-3.682137, -3.504402, 4, 1, 1.5, 0.5, 0.5,
-3.682137, -3.504402, 4, 0, 1.5, 0.5, 0.5
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
-3.187258, -3.023478, -5.541718,
-3.187258, 3.388853, -5.541718,
-3.187258, -3.023478, 5.102665,
-3.187258, 3.388853, 5.102665,
-3.187258, -3.023478, -5.541718,
-3.187258, -3.023478, 5.102665,
-3.187258, 3.388853, -5.541718,
-3.187258, 3.388853, 5.102665,
-3.187258, -3.023478, -5.541718,
3.411143, -3.023478, -5.541718,
-3.187258, -3.023478, 5.102665,
3.411143, -3.023478, 5.102665,
-3.187258, 3.388853, -5.541718,
3.411143, 3.388853, -5.541718,
-3.187258, 3.388853, 5.102665,
3.411143, 3.388853, 5.102665,
3.411143, -3.023478, -5.541718,
3.411143, 3.388853, -5.541718,
3.411143, -3.023478, 5.102665,
3.411143, 3.388853, 5.102665,
3.411143, -3.023478, -5.541718,
3.411143, -3.023478, 5.102665,
3.411143, 3.388853, -5.541718,
3.411143, 3.388853, 5.102665
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
var radius = 7.513009;
var distance = 33.42622;
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
mvMatrix.translate( -0.1119425, -0.1826876, 0.2195263 );
mvMatrix.scale( 1.231088, 1.266811, 0.7631455 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.42622);
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
dicumarol<-read.table("dicumarol.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dicumarol$V2
```

```
## Error in eval(expr, envir, enclos): object 'dicumarol' not found
```

```r
y<-dicumarol$V3
```

```
## Error in eval(expr, envir, enclos): object 'dicumarol' not found
```

```r
z<-dicumarol$V4
```

```
## Error in eval(expr, envir, enclos): object 'dicumarol' not found
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
-3.091164, 2.118131, -0.134419, 0, 0, 1, 1, 1,
-2.876708, 1.75619, -1.967096, 1, 0, 0, 1, 1,
-2.796319, 0.2574498, -2.164673, 1, 0, 0, 1, 1,
-2.683547, -0.677057, -0.5920647, 1, 0, 0, 1, 1,
-2.6768, -0.5355872, -2.063062, 1, 0, 0, 1, 1,
-2.557544, 0.541904, -1.755149, 1, 0, 0, 1, 1,
-2.314441, -1.431048, -1.589436, 0, 0, 0, 1, 1,
-2.239185, -0.1674265, -1.750869, 0, 0, 0, 1, 1,
-2.219266, 0.4071591, -0.5829626, 0, 0, 0, 1, 1,
-2.218355, 0.6601005, -1.409018, 0, 0, 0, 1, 1,
-2.214419, 0.6910774, -0.2720926, 0, 0, 0, 1, 1,
-2.188479, 1.253511, -1.063803, 0, 0, 0, 1, 1,
-2.187849, -1.469892, -2.342319, 0, 0, 0, 1, 1,
-2.184819, 0.4244775, -1.959322, 1, 1, 1, 1, 1,
-2.150056, 0.0502729, -1.803743, 1, 1, 1, 1, 1,
-2.051898, -1.390129, -1.911283, 1, 1, 1, 1, 1,
-2.051012, 0.8764758, -4.055853, 1, 1, 1, 1, 1,
-2.033886, -0.1059368, -2.461029, 1, 1, 1, 1, 1,
-2.020414, -0.4367877, -1.025284, 1, 1, 1, 1, 1,
-1.999911, -0.06775095, -2.436328, 1, 1, 1, 1, 1,
-1.990108, -0.01563049, -1.495446, 1, 1, 1, 1, 1,
-1.93537, -1.331484, -3.608193, 1, 1, 1, 1, 1,
-1.932497, -0.1340761, -0.3812612, 1, 1, 1, 1, 1,
-1.900715, -2.035946, -4.080516, 1, 1, 1, 1, 1,
-1.894754, -1.149904, -2.158545, 1, 1, 1, 1, 1,
-1.827329, 0.5029476, 0.04414091, 1, 1, 1, 1, 1,
-1.78528, -0.8314848, -2.536182, 1, 1, 1, 1, 1,
-1.785196, 1.483661, -1.465682, 1, 1, 1, 1, 1,
-1.780219, -1.374744, -2.140147, 0, 0, 1, 1, 1,
-1.760215, -0.7480819, -2.57832, 1, 0, 0, 1, 1,
-1.759234, -0.5630414, 0.03924415, 1, 0, 0, 1, 1,
-1.7402, 0.1539684, -0.7191141, 1, 0, 0, 1, 1,
-1.728137, -0.5257618, -0.5314113, 1, 0, 0, 1, 1,
-1.725831, -1.787686, -5.294968, 1, 0, 0, 1, 1,
-1.725558, -0.00696249, -0.04249047, 0, 0, 0, 1, 1,
-1.718166, 0.9264641, -1.648222, 0, 0, 0, 1, 1,
-1.716847, 0.8735473, -0.2271197, 0, 0, 0, 1, 1,
-1.709149, 0.5752152, -1.984826, 0, 0, 0, 1, 1,
-1.695837, -1.693689, -1.84059, 0, 0, 0, 1, 1,
-1.679248, 1.094272, -0.1828144, 0, 0, 0, 1, 1,
-1.631604, 0.7134491, 0.06144672, 0, 0, 0, 1, 1,
-1.608537, 0.9271232, -0.6230186, 1, 1, 1, 1, 1,
-1.596841, -1.371907, -3.168275, 1, 1, 1, 1, 1,
-1.591075, 0.06787611, -1.688803, 1, 1, 1, 1, 1,
-1.590278, -0.3217148, -0.4539932, 1, 1, 1, 1, 1,
-1.574501, 0.2145776, -1.302566, 1, 1, 1, 1, 1,
-1.572661, 0.9432516, -0.08203763, 1, 1, 1, 1, 1,
-1.571933, 0.07384223, -1.333607, 1, 1, 1, 1, 1,
-1.569707, 1.87758, -1.438626, 1, 1, 1, 1, 1,
-1.565366, -0.3691042, -0.8723095, 1, 1, 1, 1, 1,
-1.535408, -0.8295483, -1.981305, 1, 1, 1, 1, 1,
-1.517105, -0.7040206, -3.197179, 1, 1, 1, 1, 1,
-1.51282, -1.403995, -3.044236, 1, 1, 1, 1, 1,
-1.505409, 1.282184, -0.2714998, 1, 1, 1, 1, 1,
-1.501111, 1.341639, -2.599648, 1, 1, 1, 1, 1,
-1.496714, 0.9384564, -0.1928102, 1, 1, 1, 1, 1,
-1.476439, -0.5650954, -1.002632, 0, 0, 1, 1, 1,
-1.47334, 0.3184522, -3.064434, 1, 0, 0, 1, 1,
-1.462068, 0.3993101, -0.9702694, 1, 0, 0, 1, 1,
-1.461861, -1.072308, -1.968964, 1, 0, 0, 1, 1,
-1.458818, 1.364144, -1.572382, 1, 0, 0, 1, 1,
-1.458026, -0.1903798, -2.302022, 1, 0, 0, 1, 1,
-1.456509, 1.944466, -0.1149861, 0, 0, 0, 1, 1,
-1.444731, 0.6533962, -2.200029, 0, 0, 0, 1, 1,
-1.443724, -0.8791774, -2.465717, 0, 0, 0, 1, 1,
-1.441722, -0.6675672, -1.767459, 0, 0, 0, 1, 1,
-1.441345, 0.3836018, -2.941763, 0, 0, 0, 1, 1,
-1.438186, 0.1125591, -0.7035912, 0, 0, 0, 1, 1,
-1.424336, 0.1758097, -1.156086, 0, 0, 0, 1, 1,
-1.419739, -0.2263286, -2.867849, 1, 1, 1, 1, 1,
-1.41783, -0.153054, -1.316542, 1, 1, 1, 1, 1,
-1.400643, -0.3936279, -0.04586535, 1, 1, 1, 1, 1,
-1.398206, -0.1380175, -1.701394, 1, 1, 1, 1, 1,
-1.395211, 1.152944, -0.659278, 1, 1, 1, 1, 1,
-1.393279, 0.2522946, -1.877656, 1, 1, 1, 1, 1,
-1.391651, -0.8665832, -1.437546, 1, 1, 1, 1, 1,
-1.390919, 0.9308079, -2.064719, 1, 1, 1, 1, 1,
-1.390714, 0.4764717, -0.5960875, 1, 1, 1, 1, 1,
-1.388704, 0.7492188, -2.105629, 1, 1, 1, 1, 1,
-1.385044, 0.9560151, -0.5141987, 1, 1, 1, 1, 1,
-1.380245, 2.780138, 0.7920467, 1, 1, 1, 1, 1,
-1.377613, 0.4277832, -0.8238576, 1, 1, 1, 1, 1,
-1.375843, -0.9994205, -2.974864, 1, 1, 1, 1, 1,
-1.374083, 0.1551467, -1.462267, 1, 1, 1, 1, 1,
-1.37228, -0.5500016, -1.236591, 0, 0, 1, 1, 1,
-1.364012, 0.4099595, -1.148111, 1, 0, 0, 1, 1,
-1.36245, 0.7266364, -1.642982, 1, 0, 0, 1, 1,
-1.361491, 0.6625121, -0.6891505, 1, 0, 0, 1, 1,
-1.344474, -0.3285249, -1.342296, 1, 0, 0, 1, 1,
-1.344416, 0.2966815, -0.9518207, 1, 0, 0, 1, 1,
-1.339997, 1.408995, -0.5162244, 0, 0, 0, 1, 1,
-1.325809, -0.9319071, -2.95892, 0, 0, 0, 1, 1,
-1.320533, 0.6673334, 0.09978274, 0, 0, 0, 1, 1,
-1.313647, -0.3847612, -2.819566, 0, 0, 0, 1, 1,
-1.310889, -0.9077594, -2.9071, 0, 0, 0, 1, 1,
-1.289431, 0.9150801, -0.7325407, 0, 0, 0, 1, 1,
-1.275202, 1.470377, -0.6384325, 0, 0, 0, 1, 1,
-1.268731, 1.703964, -0.2518709, 1, 1, 1, 1, 1,
-1.267078, 0.8718923, -0.02150096, 1, 1, 1, 1, 1,
-1.261939, 1.509425, -0.02429192, 1, 1, 1, 1, 1,
-1.261902, -0.2542701, -0.7575592, 1, 1, 1, 1, 1,
-1.259604, -0.9347316, -0.7102136, 1, 1, 1, 1, 1,
-1.258034, 0.08892544, -2.620928, 1, 1, 1, 1, 1,
-1.256638, 1.283963, -1.621381, 1, 1, 1, 1, 1,
-1.255035, 0.616295, -2.62691, 1, 1, 1, 1, 1,
-1.254485, 2.445935, -0.7526289, 1, 1, 1, 1, 1,
-1.239914, 0.30656, -1.229121, 1, 1, 1, 1, 1,
-1.23896, -0.1133303, -1.571195, 1, 1, 1, 1, 1,
-1.234132, -1.345214, -1.465023, 1, 1, 1, 1, 1,
-1.229159, -0.53358, -1.002451, 1, 1, 1, 1, 1,
-1.228866, 0.8772092, -1.442638, 1, 1, 1, 1, 1,
-1.218736, 0.0135404, -1.600004, 1, 1, 1, 1, 1,
-1.216218, 1.413248, -0.5104222, 0, 0, 1, 1, 1,
-1.214832, -0.9173078, -1.807401, 1, 0, 0, 1, 1,
-1.207369, 1.001368, -2.273744, 1, 0, 0, 1, 1,
-1.201802, 0.9564046, -2.388053, 1, 0, 0, 1, 1,
-1.196404, 1.725015, 0.8561241, 1, 0, 0, 1, 1,
-1.193808, -0.03391194, -1.561364, 1, 0, 0, 1, 1,
-1.184777, 1.255099, -0.6471117, 0, 0, 0, 1, 1,
-1.184615, 0.1183056, -0.6715596, 0, 0, 0, 1, 1,
-1.18262, -0.2585226, -1.735618, 0, 0, 0, 1, 1,
-1.17552, -2.012331, -3.646578, 0, 0, 0, 1, 1,
-1.175412, -0.6253777, -2.360073, 0, 0, 0, 1, 1,
-1.173516, -1.062962, -1.880388, 0, 0, 0, 1, 1,
-1.157578, 0.8357163, -1.031513, 0, 0, 0, 1, 1,
-1.156351, -0.9666564, -1.749784, 1, 1, 1, 1, 1,
-1.15559, -0.1165419, -0.4593599, 1, 1, 1, 1, 1,
-1.15082, 1.243734, -1.429848, 1, 1, 1, 1, 1,
-1.138028, -1.267439, -1.0746, 1, 1, 1, 1, 1,
-1.123576, 0.7193983, -1.876972, 1, 1, 1, 1, 1,
-1.123075, -0.671263, -2.52827, 1, 1, 1, 1, 1,
-1.111276, 0.9396448, 0.7136181, 1, 1, 1, 1, 1,
-1.109033, 0.2638576, -1.810018, 1, 1, 1, 1, 1,
-1.101006, 1.420458, -2.059999, 1, 1, 1, 1, 1,
-1.100035, -0.6351271, -2.082583, 1, 1, 1, 1, 1,
-1.096422, -0.5814556, -2.427002, 1, 1, 1, 1, 1,
-1.094585, -0.9531907, -0.592141, 1, 1, 1, 1, 1,
-1.088655, 0.8090419, -0.4523438, 1, 1, 1, 1, 1,
-1.087816, 2.580531, -0.2020481, 1, 1, 1, 1, 1,
-1.087281, 1.243287, -1.671364, 1, 1, 1, 1, 1,
-1.083419, 1.063177, 1.008168, 0, 0, 1, 1, 1,
-1.082786, -1.575341, -1.741641, 1, 0, 0, 1, 1,
-1.077606, -0.2538732, -2.554009, 1, 0, 0, 1, 1,
-1.067823, -0.2255663, -3.470707, 1, 0, 0, 1, 1,
-1.0631, 0.8696522, -0.7275639, 1, 0, 0, 1, 1,
-1.054912, -2.930094, -2.226879, 1, 0, 0, 1, 1,
-1.051249, 1.984224, 0.942897, 0, 0, 0, 1, 1,
-1.04966, 1.035664, -0.7340225, 0, 0, 0, 1, 1,
-1.046738, 1.861457, -0.07721652, 0, 0, 0, 1, 1,
-1.043888, -0.7078254, -2.079178, 0, 0, 0, 1, 1,
-1.042215, 0.6284356, -0.3462451, 0, 0, 0, 1, 1,
-1.034627, 2.588879, -0.5757745, 0, 0, 0, 1, 1,
-1.03281, 0.4063608, -2.311142, 0, 0, 0, 1, 1,
-1.031151, -0.6135449, -1.655785, 1, 1, 1, 1, 1,
-1.02892, -0.4609701, 0.231704, 1, 1, 1, 1, 1,
-1.026535, 1.803232, -1.195568, 1, 1, 1, 1, 1,
-1.026035, -2.031338, -3.332471, 1, 1, 1, 1, 1,
-1.014507, 0.5548565, -0.6985389, 1, 1, 1, 1, 1,
-1.012257, 0.2348117, 1.578244, 1, 1, 1, 1, 1,
-1.011589, -0.0001945397, -2.012809, 1, 1, 1, 1, 1,
-1.006359, -0.07298554, -0.6184978, 1, 1, 1, 1, 1,
-1.003244, 0.3556044, -1.326327, 1, 1, 1, 1, 1,
-1.001388, -0.457782, -2.207025, 1, 1, 1, 1, 1,
-1.001191, 1.111955, -0.5891147, 1, 1, 1, 1, 1,
-1.000347, 0.2854049, -1.763542, 1, 1, 1, 1, 1,
-0.9932963, -1.206283, -2.53085, 1, 1, 1, 1, 1,
-0.9814159, -0.353001, -2.82658, 1, 1, 1, 1, 1,
-0.9737468, 1.06681, -1.083158, 1, 1, 1, 1, 1,
-0.9732804, -1.776913, -2.979388, 0, 0, 1, 1, 1,
-0.9725952, 1.62299, -0.1368753, 1, 0, 0, 1, 1,
-0.9481691, -1.525556, -1.719708, 1, 0, 0, 1, 1,
-0.9456796, 0.06032606, -0.2709119, 1, 0, 0, 1, 1,
-0.9390979, 1.389477, -1.431321, 1, 0, 0, 1, 1,
-0.9358492, -0.6328048, -0.8121006, 1, 0, 0, 1, 1,
-0.9313285, 0.6142949, -0.03658845, 0, 0, 0, 1, 1,
-0.9303855, 0.4861428, -1.00988, 0, 0, 0, 1, 1,
-0.9223568, -0.1306444, -1.943601, 0, 0, 0, 1, 1,
-0.9191443, -1.438263, -3.378708, 0, 0, 0, 1, 1,
-0.9164994, -1.021934, -1.627241, 0, 0, 0, 1, 1,
-0.914157, -0.2733645, -1.776921, 0, 0, 0, 1, 1,
-0.9059471, 0.429387, -1.022556, 0, 0, 0, 1, 1,
-0.9011223, -1.419495, -2.604054, 1, 1, 1, 1, 1,
-0.9002495, -0.2707216, -1.833827, 1, 1, 1, 1, 1,
-0.8970051, 1.18887, 1.254331, 1, 1, 1, 1, 1,
-0.8961014, 1.448599, -0.4570887, 1, 1, 1, 1, 1,
-0.8925945, -0.7757756, -3.254681, 1, 1, 1, 1, 1,
-0.8909713, -0.7175527, -3.469994, 1, 1, 1, 1, 1,
-0.8898128, -0.3675264, -3.517118, 1, 1, 1, 1, 1,
-0.880046, 0.8961261, -1.21707, 1, 1, 1, 1, 1,
-0.878131, 2.497394, -0.8013871, 1, 1, 1, 1, 1,
-0.8751924, -0.2615558, -0.4151483, 1, 1, 1, 1, 1,
-0.8626452, 1.477112, -0.1658017, 1, 1, 1, 1, 1,
-0.8611889, 0.1260683, -2.731651, 1, 1, 1, 1, 1,
-0.8579787, -1.457141, -3.533653, 1, 1, 1, 1, 1,
-0.8566238, 1.160197, -0.09160633, 1, 1, 1, 1, 1,
-0.8496364, -1.109655, -3.536177, 1, 1, 1, 1, 1,
-0.8462994, 0.1067718, -0.1226014, 0, 0, 1, 1, 1,
-0.840396, 0.7579656, -1.168904, 1, 0, 0, 1, 1,
-0.8382697, -0.8555993, -3.305455, 1, 0, 0, 1, 1,
-0.8376334, 0.9400397, -0.3479069, 1, 0, 0, 1, 1,
-0.8315912, 1.127192, -0.8908513, 1, 0, 0, 1, 1,
-0.8301293, -0.5354219, -2.669738, 1, 0, 0, 1, 1,
-0.8300849, 0.2737175, -2.449917, 0, 0, 0, 1, 1,
-0.8265577, 0.1319156, -1.387276, 0, 0, 0, 1, 1,
-0.8238856, 0.1346526, -1.392906, 0, 0, 0, 1, 1,
-0.8235164, 0.4317708, 0.05471397, 0, 0, 0, 1, 1,
-0.8138328, -0.8544523, -2.465409, 0, 0, 0, 1, 1,
-0.8045691, -0.9483669, -2.668422, 0, 0, 0, 1, 1,
-0.8035793, 1.162566, -1.54624, 0, 0, 0, 1, 1,
-0.7974716, 1.132096, 0.5192745, 1, 1, 1, 1, 1,
-0.7959665, -0.4646709, -0.3444231, 1, 1, 1, 1, 1,
-0.7956524, 1.557118, -0.9047965, 1, 1, 1, 1, 1,
-0.7915996, -0.1265136, -2.521001, 1, 1, 1, 1, 1,
-0.7877411, -1.480763, -3.731547, 1, 1, 1, 1, 1,
-0.7812529, -0.04066796, -0.5489772, 1, 1, 1, 1, 1,
-0.7801678, 0.02770531, -1.945616, 1, 1, 1, 1, 1,
-0.779381, 0.425238, -1.071328, 1, 1, 1, 1, 1,
-0.7780293, -2.169312, -4.244147, 1, 1, 1, 1, 1,
-0.77421, -0.4350874, -1.068928, 1, 1, 1, 1, 1,
-0.7724806, -0.3812034, -1.242242, 1, 1, 1, 1, 1,
-0.7708151, -0.8393364, -2.549267, 1, 1, 1, 1, 1,
-0.7680799, 1.186308, -3.176517, 1, 1, 1, 1, 1,
-0.76385, -1.458214, -3.095397, 1, 1, 1, 1, 1,
-0.7583871, -0.9845588, -3.122059, 1, 1, 1, 1, 1,
-0.7547486, -0.00680133, -2.594936, 0, 0, 1, 1, 1,
-0.7490621, -0.3241672, -2.480417, 1, 0, 0, 1, 1,
-0.7488201, 1.067986, -0.6407913, 1, 0, 0, 1, 1,
-0.7439673, 1.488947, 0.2362158, 1, 0, 0, 1, 1,
-0.7417397, 1.274749, -0.7262322, 1, 0, 0, 1, 1,
-0.7395201, 0.2855873, -1.070846, 1, 0, 0, 1, 1,
-0.7393006, -0.5390891, -0.4408946, 0, 0, 0, 1, 1,
-0.7376919, -0.01236613, -0.06834028, 0, 0, 0, 1, 1,
-0.7346927, -1.269943, -2.639848, 0, 0, 0, 1, 1,
-0.725806, -1.005488, -1.532245, 0, 0, 0, 1, 1,
-0.7250548, 0.6454999, -2.384402, 0, 0, 0, 1, 1,
-0.7153019, -0.2244731, -4.030017, 0, 0, 0, 1, 1,
-0.7117075, -0.9164408, -2.820857, 0, 0, 0, 1, 1,
-0.706918, 1.852153, -0.2340369, 1, 1, 1, 1, 1,
-0.695667, -1.041949, -3.368827, 1, 1, 1, 1, 1,
-0.6938725, -0.02669461, -0.8001451, 1, 1, 1, 1, 1,
-0.6913776, 0.05362853, -2.738447, 1, 1, 1, 1, 1,
-0.6911021, 1.235308, -0.6226065, 1, 1, 1, 1, 1,
-0.6879546, -0.01136758, -3.026176, 1, 1, 1, 1, 1,
-0.684379, -0.258464, -2.911625, 1, 1, 1, 1, 1,
-0.6841754, -0.1836368, -2.855639, 1, 1, 1, 1, 1,
-0.6727092, 0.3226018, -0.2243278, 1, 1, 1, 1, 1,
-0.6714462, -1.649592, -2.327574, 1, 1, 1, 1, 1,
-0.6699636, 0.7824857, -1.449382, 1, 1, 1, 1, 1,
-0.6679764, -2.238663, -4.072377, 1, 1, 1, 1, 1,
-0.6620867, 1.08668, -2.031109, 1, 1, 1, 1, 1,
-0.6510083, 0.9577336, -0.5010523, 1, 1, 1, 1, 1,
-0.647216, -0.4323187, -0.2942066, 1, 1, 1, 1, 1,
-0.6365696, -0.1800543, -2.461515, 0, 0, 1, 1, 1,
-0.636319, 1.700778, 1.473167, 1, 0, 0, 1, 1,
-0.6344494, -1.665439, -3.798586, 1, 0, 0, 1, 1,
-0.6336363, 0.3612732, 0.2899282, 1, 0, 0, 1, 1,
-0.6278064, -0.4320152, -2.054453, 1, 0, 0, 1, 1,
-0.6268452, -0.8993908, -3.291415, 1, 0, 0, 1, 1,
-0.6236085, -0.2523746, -2.308374, 0, 0, 0, 1, 1,
-0.6207565, -0.6929821, -3.892772, 0, 0, 0, 1, 1,
-0.6188626, 0.2935274, 0.01007732, 0, 0, 0, 1, 1,
-0.6184501, -1.427634, -2.089175, 0, 0, 0, 1, 1,
-0.6168306, 1.562576, -1.580495, 0, 0, 0, 1, 1,
-0.6151227, -0.2486915, -1.766776, 0, 0, 0, 1, 1,
-0.6114278, 0.2441973, -1.781061, 0, 0, 0, 1, 1,
-0.6100277, -0.5656286, -1.304568, 1, 1, 1, 1, 1,
-0.6008729, -1.772252, -2.622163, 1, 1, 1, 1, 1,
-0.6000311, 0.006843237, -2.372436, 1, 1, 1, 1, 1,
-0.5990377, -0.9164472, -2.850227, 1, 1, 1, 1, 1,
-0.5959139, 1.506855, -0.4518985, 1, 1, 1, 1, 1,
-0.5931955, 0.05995641, -3.977167, 1, 1, 1, 1, 1,
-0.5914733, 1.64597, -0.5684688, 1, 1, 1, 1, 1,
-0.5875623, -0.4817577, -1.874133, 1, 1, 1, 1, 1,
-0.5865134, 1.336126, -0.7460794, 1, 1, 1, 1, 1,
-0.5801712, -0.235977, -2.315033, 1, 1, 1, 1, 1,
-0.5788077, 1.497873, -0.5541063, 1, 1, 1, 1, 1,
-0.5779945, -0.08195239, -3.486678, 1, 1, 1, 1, 1,
-0.57487, -0.254084, -1.634241, 1, 1, 1, 1, 1,
-0.5741748, -1.741107, -2.416001, 1, 1, 1, 1, 1,
-0.5717409, 0.06947704, -1.409315, 1, 1, 1, 1, 1,
-0.5713642, 0.6274177, -2.256513, 0, 0, 1, 1, 1,
-0.5618514, 0.0957711, -1.91503, 1, 0, 0, 1, 1,
-0.5614861, 0.7212929, -2.215632, 1, 0, 0, 1, 1,
-0.5501602, 0.06391864, -3.50575, 1, 0, 0, 1, 1,
-0.5467419, 0.7245248, -1.474839, 1, 0, 0, 1, 1,
-0.5432575, -0.3080622, -1.74881, 1, 0, 0, 1, 1,
-0.5413285, -0.3472665, -2.493644, 0, 0, 0, 1, 1,
-0.5402816, -0.3818883, -2.534312, 0, 0, 0, 1, 1,
-0.5372102, -1.819688, -2.402302, 0, 0, 0, 1, 1,
-0.532329, -0.9619076, -1.437683, 0, 0, 0, 1, 1,
-0.528839, 0.5256373, -1.522594, 0, 0, 0, 1, 1,
-0.5232168, 1.126841, -1.150659, 0, 0, 0, 1, 1,
-0.5211093, 0.9714769, -2.031539, 0, 0, 0, 1, 1,
-0.5206156, 0.001155671, -2.542047, 1, 1, 1, 1, 1,
-0.5177838, -0.3512566, -1.411286, 1, 1, 1, 1, 1,
-0.5159323, 0.5639566, -0.5431865, 1, 1, 1, 1, 1,
-0.5156766, 2.325312, -0.5303014, 1, 1, 1, 1, 1,
-0.5120452, -0.612309, -0.564457, 1, 1, 1, 1, 1,
-0.5086524, 0.2232349, -2.264591, 1, 1, 1, 1, 1,
-0.5082946, 0.01865009, -0.1209306, 1, 1, 1, 1, 1,
-0.5074834, 0.2938632, -0.6980936, 1, 1, 1, 1, 1,
-0.5042583, -0.6533927, -2.726017, 1, 1, 1, 1, 1,
-0.4982396, -0.4258439, -2.837341, 1, 1, 1, 1, 1,
-0.4958895, -0.04305438, -2.304432, 1, 1, 1, 1, 1,
-0.4879723, 0.3721971, -1.576757, 1, 1, 1, 1, 1,
-0.485813, -0.07163046, -1.099974, 1, 1, 1, 1, 1,
-0.4840047, 2.661732, -0.7538609, 1, 1, 1, 1, 1,
-0.4756064, -1.989208, -3.376338, 1, 1, 1, 1, 1,
-0.4723579, 0.7313278, -0.6358842, 0, 0, 1, 1, 1,
-0.4680492, 0.6693554, -0.4617524, 1, 0, 0, 1, 1,
-0.4671234, -2.159602, -1.360447, 1, 0, 0, 1, 1,
-0.4658244, -0.1479401, -0.2042716, 1, 0, 0, 1, 1,
-0.4610828, 0.7358943, 0.01155927, 1, 0, 0, 1, 1,
-0.4484565, 0.3202431, -1.106057, 1, 0, 0, 1, 1,
-0.4473548, -1.111473, -2.242784, 0, 0, 0, 1, 1,
-0.4468053, 0.7547342, -0.0733511, 0, 0, 0, 1, 1,
-0.443757, 0.7593436, -0.980818, 0, 0, 0, 1, 1,
-0.4427997, -0.1899223, -1.828486, 0, 0, 0, 1, 1,
-0.4421384, -0.2092126, 0.01153229, 0, 0, 0, 1, 1,
-0.440047, 0.1700024, -1.145298, 0, 0, 0, 1, 1,
-0.4392895, 0.1683386, 1.132522, 0, 0, 0, 1, 1,
-0.4386044, -0.8630858, -2.104717, 1, 1, 1, 1, 1,
-0.4218966, 0.5348601, -1.349891, 1, 1, 1, 1, 1,
-0.4190058, -0.5303138, -2.271229, 1, 1, 1, 1, 1,
-0.4118567, -0.2687675, -1.917177, 1, 1, 1, 1, 1,
-0.4079578, 0.205795, 0.07363679, 1, 1, 1, 1, 1,
-0.4075739, 0.4637534, -0.1716771, 1, 1, 1, 1, 1,
-0.4002872, 0.1178589, -1.491295, 1, 1, 1, 1, 1,
-0.4001204, -1.304178, -2.63738, 1, 1, 1, 1, 1,
-0.3912272, -0.01436529, -2.47985, 1, 1, 1, 1, 1,
-0.3908837, -1.658855, -3.117483, 1, 1, 1, 1, 1,
-0.3908561, 0.02130116, -2.860552, 1, 1, 1, 1, 1,
-0.3863175, -0.4883856, -2.518458, 1, 1, 1, 1, 1,
-0.385851, 0.7704757, 2.164865, 1, 1, 1, 1, 1,
-0.3858149, 2.000386, -0.206468, 1, 1, 1, 1, 1,
-0.3833946, -1.316006, -2.832298, 1, 1, 1, 1, 1,
-0.37376, 0.4737687, -0.1839532, 0, 0, 1, 1, 1,
-0.3718913, -0.9762828, -3.835469, 1, 0, 0, 1, 1,
-0.3718616, -0.5088217, -2.863675, 1, 0, 0, 1, 1,
-0.3708317, 0.1189305, -1.321345, 1, 0, 0, 1, 1,
-0.3662366, 2.357396, 0.1030742, 1, 0, 0, 1, 1,
-0.3654512, -0.1192397, -2.353026, 1, 0, 0, 1, 1,
-0.3642587, -1.284723, -1.562826, 0, 0, 0, 1, 1,
-0.3622147, 1.755172, -0.460962, 0, 0, 0, 1, 1,
-0.3617641, 2.207062, -0.3308519, 0, 0, 0, 1, 1,
-0.3589348, 0.417242, -1.095249, 0, 0, 0, 1, 1,
-0.354772, -0.7937698, -2.814778, 0, 0, 0, 1, 1,
-0.3546791, -0.8683586, -3.795191, 0, 0, 0, 1, 1,
-0.3517776, -1.313051, -1.775612, 0, 0, 0, 1, 1,
-0.3513528, -2.487398, -4.951098, 1, 1, 1, 1, 1,
-0.3450493, -0.8758075, -3.094982, 1, 1, 1, 1, 1,
-0.3410351, 0.3415236, -2.020925, 1, 1, 1, 1, 1,
-0.3378994, -2.207052, -2.995823, 1, 1, 1, 1, 1,
-0.3340927, 1.101104, -1.247925, 1, 1, 1, 1, 1,
-0.3316769, -1.507765, -0.830552, 1, 1, 1, 1, 1,
-0.3297709, 0.7628551, -0.02741396, 1, 1, 1, 1, 1,
-0.3263606, -1.062698, -3.907123, 1, 1, 1, 1, 1,
-0.322696, -1.47137, -2.690192, 1, 1, 1, 1, 1,
-0.3208071, 0.01048875, -2.799117, 1, 1, 1, 1, 1,
-0.3167195, 1.120491, -0.3874077, 1, 1, 1, 1, 1,
-0.3131901, -1.277434, -1.210268, 1, 1, 1, 1, 1,
-0.307651, 0.3042181, 0.1347923, 1, 1, 1, 1, 1,
-0.3045214, 0.01063452, -3.549902, 1, 1, 1, 1, 1,
-0.3045075, -0.7986956, -3.169032, 1, 1, 1, 1, 1,
-0.3031479, 1.154066, 0.2000105, 0, 0, 1, 1, 1,
-0.2955934, 0.6021515, -1.31117, 1, 0, 0, 1, 1,
-0.2946521, 0.4255804, -0.06461823, 1, 0, 0, 1, 1,
-0.289741, -1.227248, -0.8813809, 1, 0, 0, 1, 1,
-0.282701, -0.09257012, -2.11615, 1, 0, 0, 1, 1,
-0.281258, -0.09845299, -2.87759, 1, 0, 0, 1, 1,
-0.2785296, -1.142865, -5.082675, 0, 0, 0, 1, 1,
-0.2764128, 0.09929822, -2.591927, 0, 0, 0, 1, 1,
-0.2708946, 2.366932, -0.5793769, 0, 0, 0, 1, 1,
-0.2702212, 0.9719931, -0.1357548, 0, 0, 0, 1, 1,
-0.2696277, -0.1541339, -1.531308, 0, 0, 0, 1, 1,
-0.2684302, -0.4177823, -2.671899, 0, 0, 0, 1, 1,
-0.2683361, 0.1756173, -1.707966, 0, 0, 0, 1, 1,
-0.2604662, -1.44288, -4.090643, 1, 1, 1, 1, 1,
-0.2602286, 0.3271242, -1.372802, 1, 1, 1, 1, 1,
-0.2557552, -0.6515529, -3.472514, 1, 1, 1, 1, 1,
-0.2487294, 2.153623, 0.4702927, 1, 1, 1, 1, 1,
-0.2481486, 0.8547971, -0.2844197, 1, 1, 1, 1, 1,
-0.2420067, -1.310464, -2.91513, 1, 1, 1, 1, 1,
-0.2406084, -0.1869495, -2.900026, 1, 1, 1, 1, 1,
-0.2387742, -2.185837, -1.954755, 1, 1, 1, 1, 1,
-0.2375868, 0.4736605, -1.650945, 1, 1, 1, 1, 1,
-0.2355522, 0.7118666, -0.1489795, 1, 1, 1, 1, 1,
-0.2328874, -0.3609022, -2.089779, 1, 1, 1, 1, 1,
-0.2311359, 0.430899, -1.199792, 1, 1, 1, 1, 1,
-0.2292152, 0.3616298, -1.222317, 1, 1, 1, 1, 1,
-0.2282176, 1.972281, 0.07371933, 1, 1, 1, 1, 1,
-0.225663, -1.256903, -1.479648, 1, 1, 1, 1, 1,
-0.2253411, 0.1984885, -0.7471032, 0, 0, 1, 1, 1,
-0.2252139, 0.03353121, -1.122947, 1, 0, 0, 1, 1,
-0.2199391, 0.3619553, -0.3082976, 1, 0, 0, 1, 1,
-0.2191008, -0.4996305, -2.650277, 1, 0, 0, 1, 1,
-0.2181769, 0.414385, 1.343598, 1, 0, 0, 1, 1,
-0.2164536, -1.28754, -3.847415, 1, 0, 0, 1, 1,
-0.212092, -0.05862923, -3.47005, 0, 0, 0, 1, 1,
-0.2105973, 0.2478681, 0.500937, 0, 0, 0, 1, 1,
-0.2035217, -0.0390886, -3.219858, 0, 0, 0, 1, 1,
-0.2033798, 1.50287, 0.9866923, 0, 0, 0, 1, 1,
-0.2025302, -0.0113415, -0.3544544, 0, 0, 0, 1, 1,
-0.2022271, 1.086275, 0.105402, 0, 0, 0, 1, 1,
-0.2012866, -0.5053696, -2.248948, 0, 0, 0, 1, 1,
-0.197263, 0.5266389, -1.892348, 1, 1, 1, 1, 1,
-0.1883353, -1.514389, -3.54544, 1, 1, 1, 1, 1,
-0.1877173, 0.09728248, -0.1970288, 1, 1, 1, 1, 1,
-0.1846744, 0.06389429, -0.7171542, 1, 1, 1, 1, 1,
-0.1837184, -0.6010345, -3.795053, 1, 1, 1, 1, 1,
-0.1823825, -0.4103424, -1.580261, 1, 1, 1, 1, 1,
-0.1802457, 0.8688622, -0.6001052, 1, 1, 1, 1, 1,
-0.179689, 1.208482, -0.05124377, 1, 1, 1, 1, 1,
-0.1791069, 1.387676, -0.2679907, 1, 1, 1, 1, 1,
-0.1769508, 1.587159, 0.7219554, 1, 1, 1, 1, 1,
-0.1758002, -0.6944183, -2.486889, 1, 1, 1, 1, 1,
-0.1708022, 1.714836, -0.4450444, 1, 1, 1, 1, 1,
-0.1707655, -0.2071197, -2.095098, 1, 1, 1, 1, 1,
-0.1678984, -1.192785, -2.810589, 1, 1, 1, 1, 1,
-0.1674936, 0.2606505, 1.423094, 1, 1, 1, 1, 1,
-0.165547, -1.121998, -3.134319, 0, 0, 1, 1, 1,
-0.1649146, 0.30331, -1.552297, 1, 0, 0, 1, 1,
-0.1632418, -0.04680504, -2.83501, 1, 0, 0, 1, 1,
-0.1546715, 0.3092259, -1.068205, 1, 0, 0, 1, 1,
-0.1532317, 0.3124438, -0.05472506, 1, 0, 0, 1, 1,
-0.1510682, -1.411824, -2.976058, 1, 0, 0, 1, 1,
-0.1422682, 0.1191086, 0.03536785, 0, 0, 0, 1, 1,
-0.1375608, 0.8679723, -1.595767, 0, 0, 0, 1, 1,
-0.1352963, 0.07279531, -1.417792, 0, 0, 0, 1, 1,
-0.1329093, -0.4345247, -2.138955, 0, 0, 0, 1, 1,
-0.1315075, -0.3411037, -2.144681, 0, 0, 0, 1, 1,
-0.1314492, 0.1772763, 0.9609154, 0, 0, 0, 1, 1,
-0.1305278, -2.000784, -3.33539, 0, 0, 0, 1, 1,
-0.1241282, 0.772229, -1.381999, 1, 1, 1, 1, 1,
-0.1190738, 2.03943, -2.421262, 1, 1, 1, 1, 1,
-0.1166787, -0.7144485, -2.773103, 1, 1, 1, 1, 1,
-0.1156846, -0.3546433, -2.657587, 1, 1, 1, 1, 1,
-0.1140612, 2.769201, -0.5230513, 1, 1, 1, 1, 1,
-0.1061071, 0.4718063, 0.2854125, 1, 1, 1, 1, 1,
-0.1053383, 0.3543644, -0.773516, 1, 1, 1, 1, 1,
-0.1043581, -0.6602723, -2.7192, 1, 1, 1, 1, 1,
-0.1004813, -0.01528939, -1.388791, 1, 1, 1, 1, 1,
-0.09977992, 1.351991, -0.3723879, 1, 1, 1, 1, 1,
-0.0992147, -1.271872, -1.30607, 1, 1, 1, 1, 1,
-0.0990188, -1.974982, -3.757592, 1, 1, 1, 1, 1,
-0.09684683, -0.7363577, -4.204645, 1, 1, 1, 1, 1,
-0.09524602, -0.2101989, -3.138725, 1, 1, 1, 1, 1,
-0.09329502, 0.8554848, -0.9671867, 1, 1, 1, 1, 1,
-0.09324569, -0.9963602, -3.600722, 0, 0, 1, 1, 1,
-0.09063002, 0.2654944, -0.1146143, 1, 0, 0, 1, 1,
-0.08728745, -0.5576633, -1.522074, 1, 0, 0, 1, 1,
-0.08623974, 0.1494579, 0.08201969, 1, 0, 0, 1, 1,
-0.07726359, -0.6887006, -5.194547, 1, 0, 0, 1, 1,
-0.07697928, -1.612257, -2.684823, 1, 0, 0, 1, 1,
-0.07612246, -1.414031, -4.057079, 0, 0, 0, 1, 1,
-0.07303575, -1.613161, -3.069874, 0, 0, 0, 1, 1,
-0.07233871, 1.028569, 0.3169836, 0, 0, 0, 1, 1,
-0.0720017, 1.380832, 0.1244535, 0, 0, 0, 1, 1,
-0.07082222, 0.02413692, 1.175129, 0, 0, 0, 1, 1,
-0.07023806, 1.078125, -0.4419075, 0, 0, 0, 1, 1,
-0.06997718, 0.564742, -0.05445388, 0, 0, 0, 1, 1,
-0.06722657, -1.918538, -4.011507, 1, 1, 1, 1, 1,
-0.06678332, 0.2893347, 0.1417295, 1, 1, 1, 1, 1,
-0.06147334, 0.09587887, -0.6211455, 1, 1, 1, 1, 1,
-0.06136303, 0.6515653, -0.07612959, 1, 1, 1, 1, 1,
-0.05880054, -0.2468336, -3.508553, 1, 1, 1, 1, 1,
-0.055439, -0.5199675, -5.386702, 1, 1, 1, 1, 1,
-0.04860015, 0.5794761, 1.484309, 1, 1, 1, 1, 1,
-0.04820946, -0.6248417, -3.980748, 1, 1, 1, 1, 1,
-0.04632556, 2.095124, -1.199168, 1, 1, 1, 1, 1,
-0.04545438, -1.117435, -3.909999, 1, 1, 1, 1, 1,
-0.04396317, -0.7183312, -2.412418, 1, 1, 1, 1, 1,
-0.03148899, 0.8439367, -0.1603368, 1, 1, 1, 1, 1,
-0.02426314, -1.357879, -2.982092, 1, 1, 1, 1, 1,
-0.02289937, 0.2973779, -0.5617723, 1, 1, 1, 1, 1,
-0.02164985, 1.781175, 0.5770925, 1, 1, 1, 1, 1,
-0.02111654, 0.9440757, 0.3842747, 0, 0, 1, 1, 1,
-0.01907492, -0.1857842, -2.538964, 1, 0, 0, 1, 1,
-0.01785097, -1.049973, -3.407648, 1, 0, 0, 1, 1,
-0.01501325, 0.7059988, -0.4216063, 1, 0, 0, 1, 1,
-0.01013911, 2.881322, 1.561549, 1, 0, 0, 1, 1,
-0.009345414, -1.195144, -2.423752, 1, 0, 0, 1, 1,
-0.00822295, -1.288043, -3.275687, 0, 0, 0, 1, 1,
-0.004979676, -1.970747, -2.307086, 0, 0, 0, 1, 1,
-0.004691743, -1.018888, -3.012108, 0, 0, 0, 1, 1,
-0.003280182, -0.5872838, -3.898765, 0, 0, 0, 1, 1,
-0.002262932, -0.9044732, -4.099772, 0, 0, 0, 1, 1,
-0.000634734, 1.419806, 0.3306426, 0, 0, 0, 1, 1,
-0.0004693767, -0.3615758, -3.888519, 0, 0, 0, 1, 1,
0.01045222, 1.268139, 0.2234499, 1, 1, 1, 1, 1,
0.01070712, 1.063392, -1.010257, 1, 1, 1, 1, 1,
0.01254597, -1.375768, 4.947649, 1, 1, 1, 1, 1,
0.01994702, 1.222212, -0.1053646, 1, 1, 1, 1, 1,
0.02010757, -0.7772406, 3.014056, 1, 1, 1, 1, 1,
0.02132107, 0.110416, 1.804451, 1, 1, 1, 1, 1,
0.02425035, -0.6833037, 3.04217, 1, 1, 1, 1, 1,
0.02514237, -0.2955576, 3.0677, 1, 1, 1, 1, 1,
0.02895354, -0.1300807, 3.70729, 1, 1, 1, 1, 1,
0.03280682, 0.2329341, -0.327564, 1, 1, 1, 1, 1,
0.04615686, 1.092212, -0.3115947, 1, 1, 1, 1, 1,
0.04752853, -0.7218611, 4.601221, 1, 1, 1, 1, 1,
0.05148154, -0.793687, 3.90084, 1, 1, 1, 1, 1,
0.05709143, 1.435418, -1.497985, 1, 1, 1, 1, 1,
0.05729294, 1.277166, 0.2945661, 1, 1, 1, 1, 1,
0.0595232, 0.6343867, 0.5417834, 0, 0, 1, 1, 1,
0.05956793, -1.699674, 0.8580671, 1, 0, 0, 1, 1,
0.0596421, -0.4410256, 2.963356, 1, 0, 0, 1, 1,
0.06091087, -1.366248, 1.766592, 1, 0, 0, 1, 1,
0.06093876, 0.1955978, 0.1454927, 1, 0, 0, 1, 1,
0.06477807, -0.8925194, 4.167312, 1, 0, 0, 1, 1,
0.06540058, 0.7834871, 1.189523, 0, 0, 0, 1, 1,
0.06690036, 0.9218828, 1.09441, 0, 0, 0, 1, 1,
0.06713948, -1.236104, 2.587088, 0, 0, 0, 1, 1,
0.06755439, 1.339856, -1.026686, 0, 0, 0, 1, 1,
0.07081021, 0.5867118, -0.2706101, 0, 0, 0, 1, 1,
0.0720269, 0.7487118, 1.161795, 0, 0, 0, 1, 1,
0.0727603, -0.9353296, 3.795728, 0, 0, 0, 1, 1,
0.07524306, 0.7382481, 0.7228904, 1, 1, 1, 1, 1,
0.07752076, -0.05163105, 1.492897, 1, 1, 1, 1, 1,
0.0813526, 0.03680805, 2.457365, 1, 1, 1, 1, 1,
0.08401374, -0.5282047, 2.687029, 1, 1, 1, 1, 1,
0.08970536, 1.496043, -0.4058199, 1, 1, 1, 1, 1,
0.09560545, -1.019515, 1.664686, 1, 1, 1, 1, 1,
0.09893267, -1.667592, 2.545266, 1, 1, 1, 1, 1,
0.09968535, 1.284495, -0.3862354, 1, 1, 1, 1, 1,
0.1014902, 1.673171, 0.6053854, 1, 1, 1, 1, 1,
0.1074348, 0.6457043, 0.9417123, 1, 1, 1, 1, 1,
0.1088259, 0.2700762, -1.161529, 1, 1, 1, 1, 1,
0.1109829, -0.1875375, 3.159083, 1, 1, 1, 1, 1,
0.1149394, 0.4086456, -0.7131326, 1, 1, 1, 1, 1,
0.1164228, 0.412137, 2.425083, 1, 1, 1, 1, 1,
0.1193284, -0.601334, 2.816009, 1, 1, 1, 1, 1,
0.11936, -0.4709422, 2.655354, 0, 0, 1, 1, 1,
0.1201625, 0.4363738, 1.278315, 1, 0, 0, 1, 1,
0.1208722, -0.8140548, 2.490284, 1, 0, 0, 1, 1,
0.124204, 0.3651614, 0.5997592, 1, 0, 0, 1, 1,
0.1259892, -0.8499328, 2.552222, 1, 0, 0, 1, 1,
0.1336704, -0.149292, 2.513304, 1, 0, 0, 1, 1,
0.1340314, -0.3822024, 2.438181, 0, 0, 0, 1, 1,
0.139075, 0.4593324, -0.2967316, 0, 0, 0, 1, 1,
0.1411964, -0.254138, 3.835473, 0, 0, 0, 1, 1,
0.1449079, -0.1193076, 2.548614, 0, 0, 0, 1, 1,
0.1462356, -0.4092808, 2.351115, 0, 0, 0, 1, 1,
0.1476608, -0.05303758, -0.5353788, 0, 0, 0, 1, 1,
0.152204, -0.3858278, 3.70932, 0, 0, 0, 1, 1,
0.1551756, -0.1018973, 3.46162, 1, 1, 1, 1, 1,
0.156674, -0.7116253, 2.688106, 1, 1, 1, 1, 1,
0.1578017, -0.2871508, -0.4659714, 1, 1, 1, 1, 1,
0.1690784, -1.05816, 2.987523, 1, 1, 1, 1, 1,
0.1738387, -1.754629, 3.294275, 1, 1, 1, 1, 1,
0.1742921, -0.1142027, 3.497681, 1, 1, 1, 1, 1,
0.1760986, 1.190955, 0.5879762, 1, 1, 1, 1, 1,
0.1784369, 0.4145385, 2.62238, 1, 1, 1, 1, 1,
0.178636, 0.6940398, 0.0327315, 1, 1, 1, 1, 1,
0.1795377, -0.4371108, 3.358521, 1, 1, 1, 1, 1,
0.1814473, 0.1181873, -0.8628904, 1, 1, 1, 1, 1,
0.1840564, -1.46652, 3.201127, 1, 1, 1, 1, 1,
0.1851657, 0.2415902, -2.143731, 1, 1, 1, 1, 1,
0.191846, 0.7099864, -0.075504, 1, 1, 1, 1, 1,
0.1952635, -0.004876811, 1.498768, 1, 1, 1, 1, 1,
0.1995704, 0.7485807, 1.069637, 0, 0, 1, 1, 1,
0.2001828, -0.6672476, 1.611666, 1, 0, 0, 1, 1,
0.2004174, 0.7496384, -1.042606, 1, 0, 0, 1, 1,
0.2044018, 0.6388122, -1.085798, 1, 0, 0, 1, 1,
0.204539, -1.017786, 3.238346, 1, 0, 0, 1, 1,
0.2108235, 0.618405, 0.1938575, 1, 0, 0, 1, 1,
0.213952, -0.1077333, -1.21224, 0, 0, 0, 1, 1,
0.2154914, -1.671013, 3.117877, 0, 0, 0, 1, 1,
0.2158469, -1.723811, 3.04614, 0, 0, 0, 1, 1,
0.2252643, -0.4139315, 0.5622575, 0, 0, 0, 1, 1,
0.22661, -0.422575, 3.825813, 0, 0, 0, 1, 1,
0.2293947, 0.2800018, 1.667122, 0, 0, 0, 1, 1,
0.2296286, 0.2553628, 1.421379, 0, 0, 0, 1, 1,
0.2298783, -0.936959, 2.719048, 1, 1, 1, 1, 1,
0.2312346, 1.273975, -0.4014385, 1, 1, 1, 1, 1,
0.2331854, -1.388005, 3.262364, 1, 1, 1, 1, 1,
0.2331866, 1.08475, 0.100564, 1, 1, 1, 1, 1,
0.2340668, 1.976095, 0.3223219, 1, 1, 1, 1, 1,
0.2348713, 0.103277, 2.8865, 1, 1, 1, 1, 1,
0.2355781, -1.185273, 2.971526, 1, 1, 1, 1, 1,
0.2379329, 0.9816065, 0.5014675, 1, 1, 1, 1, 1,
0.2414882, -1.56745, 3.703139, 1, 1, 1, 1, 1,
0.2431493, -0.5517072, 1.23253, 1, 1, 1, 1, 1,
0.2451229, 0.2246923, 1.508406, 1, 1, 1, 1, 1,
0.2468338, -1.323712, 3.977141, 1, 1, 1, 1, 1,
0.2475824, -0.2230179, 1.00016, 1, 1, 1, 1, 1,
0.2488326, 0.8384451, 2.737925, 1, 1, 1, 1, 1,
0.2512315, 0.2476936, 0.6271572, 1, 1, 1, 1, 1,
0.2532057, -0.08910292, 1.850438, 0, 0, 1, 1, 1,
0.2533435, 0.1726916, -0.1948453, 1, 0, 0, 1, 1,
0.2675698, 0.6060256, 1.099654, 1, 0, 0, 1, 1,
0.267716, -2.00989, 2.586226, 1, 0, 0, 1, 1,
0.2680511, -0.3465629, 3.183948, 1, 0, 0, 1, 1,
0.2682931, 1.456038, 0.1142794, 1, 0, 0, 1, 1,
0.2688266, -0.1192152, 1.314457, 0, 0, 0, 1, 1,
0.2784353, 1.15546, 1.274065, 0, 0, 0, 1, 1,
0.2790887, -0.5497961, 2.656261, 0, 0, 0, 1, 1,
0.2801307, 0.1835692, 1.763932, 0, 0, 0, 1, 1,
0.2807574, 0.3520205, 1.543156, 0, 0, 0, 1, 1,
0.2825511, 1.116526, -0.03044545, 0, 0, 0, 1, 1,
0.2881603, 0.6092277, 1.300031, 0, 0, 0, 1, 1,
0.2920333, 1.231276, 0.2542537, 1, 1, 1, 1, 1,
0.2934317, 0.5444198, -0.677778, 1, 1, 1, 1, 1,
0.2941702, 0.6130664, 0.8795475, 1, 1, 1, 1, 1,
0.2947733, -1.363273, 3.529614, 1, 1, 1, 1, 1,
0.2960122, -1.580656, 1.683859, 1, 1, 1, 1, 1,
0.2988858, 0.4917836, 2.79042, 1, 1, 1, 1, 1,
0.300475, 1.216223, -0.4295183, 1, 1, 1, 1, 1,
0.3165054, 1.040423, 1.075141, 1, 1, 1, 1, 1,
0.3187373, -0.1344, 3.992323, 1, 1, 1, 1, 1,
0.3265347, 0.09739297, 1.704263, 1, 1, 1, 1, 1,
0.3281708, -1.14725, 3.80144, 1, 1, 1, 1, 1,
0.3282449, -0.2657179, 2.893056, 1, 1, 1, 1, 1,
0.3295088, 0.2939934, 1.183355, 1, 1, 1, 1, 1,
0.3301297, 0.4515533, -1.082546, 1, 1, 1, 1, 1,
0.3327443, 1.306582, 0.302287, 1, 1, 1, 1, 1,
0.3339703, -0.673358, 2.402871, 0, 0, 1, 1, 1,
0.3394217, -0.26223, 3.41407, 1, 0, 0, 1, 1,
0.3415675, 1.728939, -1.029356, 1, 0, 0, 1, 1,
0.342858, 0.2599415, 1.731095, 1, 0, 0, 1, 1,
0.3428756, 0.834213, -1.031088, 1, 0, 0, 1, 1,
0.3432304, 0.7368473, -1.360937, 1, 0, 0, 1, 1,
0.348535, 1.67802, 0.6129439, 0, 0, 0, 1, 1,
0.3501595, 1.011112, -0.5235437, 0, 0, 0, 1, 1,
0.3594921, -1.157104, 3.608536, 0, 0, 0, 1, 1,
0.3641631, -0.7677132, 3.212066, 0, 0, 0, 1, 1,
0.3643203, 0.4594329, -0.2510806, 0, 0, 0, 1, 1,
0.3649791, -1.425373, 3.502121, 0, 0, 0, 1, 1,
0.3668836, -0.4796619, 4.326963, 0, 0, 0, 1, 1,
0.3684428, 0.205074, 1.976044, 1, 1, 1, 1, 1,
0.3749297, -0.5529087, 3.179193, 1, 1, 1, 1, 1,
0.3753608, 0.2725057, 0.6888535, 1, 1, 1, 1, 1,
0.3758818, 1.684785, 0.5561778, 1, 1, 1, 1, 1,
0.3783068, 0.8023612, -0.5052984, 1, 1, 1, 1, 1,
0.3786822, -0.4191116, 2.630257, 1, 1, 1, 1, 1,
0.3811785, -0.1152789, 1.688332, 1, 1, 1, 1, 1,
0.3857479, 0.3605384, 3.381654, 1, 1, 1, 1, 1,
0.3857938, 1.372591, -0.6664931, 1, 1, 1, 1, 1,
0.3865646, 0.05049892, 2.127348, 1, 1, 1, 1, 1,
0.3931767, -0.4201311, 2.414088, 1, 1, 1, 1, 1,
0.393249, 0.7739844, 0.6420222, 1, 1, 1, 1, 1,
0.3998158, -0.7770309, 2.610152, 1, 1, 1, 1, 1,
0.4007655, -1.110514, 3.407607, 1, 1, 1, 1, 1,
0.4030057, 1.562945, 0.8657577, 1, 1, 1, 1, 1,
0.4054559, 0.1420934, 2.711871, 0, 0, 1, 1, 1,
0.4066055, -1.422577, 3.39361, 1, 0, 0, 1, 1,
0.4077381, 0.1322838, 2.159477, 1, 0, 0, 1, 1,
0.40817, 0.4644534, 1.989199, 1, 0, 0, 1, 1,
0.4087155, 1.138355, -2.145715, 1, 0, 0, 1, 1,
0.4107588, -1.250635, 2.170593, 1, 0, 0, 1, 1,
0.4127476, 0.7034478, 0.7184203, 0, 0, 0, 1, 1,
0.413994, 0.3661081, 0.9230328, 0, 0, 0, 1, 1,
0.4181724, -0.8297719, 2.170187, 0, 0, 0, 1, 1,
0.4220597, 0.8882684, 0.04327785, 0, 0, 0, 1, 1,
0.4262366, 1.280765, 1.26739, 0, 0, 0, 1, 1,
0.4264927, -0.4162863, 4.109716, 0, 0, 0, 1, 1,
0.4268004, -0.8291087, 0.6519117, 0, 0, 0, 1, 1,
0.4271788, 0.5246338, 0.389825, 1, 1, 1, 1, 1,
0.4279817, 0.3333583, 0.01847986, 1, 1, 1, 1, 1,
0.4309813, -0.9577054, 3.086477, 1, 1, 1, 1, 1,
0.4316564, -2.529328, 4.722117, 1, 1, 1, 1, 1,
0.43335, -0.1603547, 1.476665, 1, 1, 1, 1, 1,
0.435327, 0.9102665, -0.004422095, 1, 1, 1, 1, 1,
0.4358175, 0.744616, 0.3067752, 1, 1, 1, 1, 1,
0.4415005, 0.9014473, 0.2262674, 1, 1, 1, 1, 1,
0.4450622, 1.032399, -0.9620925, 1, 1, 1, 1, 1,
0.4450927, -0.01310099, 1.190707, 1, 1, 1, 1, 1,
0.4526426, -0.01116007, 1.663448, 1, 1, 1, 1, 1,
0.456562, -0.5438654, 2.767432, 1, 1, 1, 1, 1,
0.4590497, 0.3809235, 2.482613, 1, 1, 1, 1, 1,
0.4726723, 0.05840228, 1.184681, 1, 1, 1, 1, 1,
0.4728136, 1.084887, 0.8374636, 1, 1, 1, 1, 1,
0.4745533, -0.4138439, 1.546502, 0, 0, 1, 1, 1,
0.4778287, -0.138779, 2.211691, 1, 0, 0, 1, 1,
0.4779984, 0.9494184, 0.8393399, 1, 0, 0, 1, 1,
0.484498, -1.089625, 4.074683, 1, 0, 0, 1, 1,
0.4879937, 0.8193859, -1.267642, 1, 0, 0, 1, 1,
0.4884641, 0.6609334, 1.193994, 1, 0, 0, 1, 1,
0.491656, -1.462384, 3.65767, 0, 0, 0, 1, 1,
0.4918326, -2.050363, 2.545873, 0, 0, 0, 1, 1,
0.4921731, -0.599597, 2.004458, 0, 0, 0, 1, 1,
0.492505, 1.161185, 1.193531, 0, 0, 0, 1, 1,
0.5044811, -0.1950749, 2.176347, 0, 0, 0, 1, 1,
0.5074609, 0.5085814, -1.135227, 0, 0, 0, 1, 1,
0.5099168, -0.05973951, 0.9586681, 0, 0, 0, 1, 1,
0.5119363, 0.6047119, 1.289245, 1, 1, 1, 1, 1,
0.5137047, -0.2271471, 3.478381, 1, 1, 1, 1, 1,
0.5138385, -1.336361, 1.88933, 1, 1, 1, 1, 1,
0.5152912, -0.6858001, 2.347124, 1, 1, 1, 1, 1,
0.5155107, 0.9904217, 0.2291864, 1, 1, 1, 1, 1,
0.5165244, -0.00920866, 1.906611, 1, 1, 1, 1, 1,
0.5177177, 0.6078846, 0.7866732, 1, 1, 1, 1, 1,
0.5203232, -2.172079, 3.499392, 1, 1, 1, 1, 1,
0.5207215, 1.105192, 0.8050211, 1, 1, 1, 1, 1,
0.5226861, -1.277486, 4.742119, 1, 1, 1, 1, 1,
0.5257084, -0.09891986, 2.326206, 1, 1, 1, 1, 1,
0.5271639, 1.047411, 1.400291, 1, 1, 1, 1, 1,
0.5294162, -0.4906299, 3.461779, 1, 1, 1, 1, 1,
0.5306664, -0.8117955, 1.292241, 1, 1, 1, 1, 1,
0.5309289, -0.05913617, 1.961712, 1, 1, 1, 1, 1,
0.5391141, 1.215312, -0.1992395, 0, 0, 1, 1, 1,
0.5406045, 0.4002864, 1.217233, 1, 0, 0, 1, 1,
0.5416045, -0.1099752, 2.308433, 1, 0, 0, 1, 1,
0.544944, -0.8873793, 2.996963, 1, 0, 0, 1, 1,
0.5452021, -0.4624806, 1.498692, 1, 0, 0, 1, 1,
0.5488763, -0.7637357, 1.990599, 1, 0, 0, 1, 1,
0.5508723, 0.3606503, 1.723933, 0, 0, 0, 1, 1,
0.5518759, -0.8197967, 3.937672, 0, 0, 0, 1, 1,
0.5565259, 1.421164, 1.402301, 0, 0, 0, 1, 1,
0.5589332, 0.4979478, -0.4544255, 0, 0, 0, 1, 1,
0.5610793, 1.719466, 2.057449, 0, 0, 0, 1, 1,
0.5672294, 1.236603, -0.9851253, 0, 0, 0, 1, 1,
0.5728914, -0.5994427, 2.992455, 0, 0, 0, 1, 1,
0.5743442, -1.583421, 2.91834, 1, 1, 1, 1, 1,
0.5765306, 1.01896, -1.337409, 1, 1, 1, 1, 1,
0.5784917, -2.208774, 3.104126, 1, 1, 1, 1, 1,
0.5834538, 1.174538, 1.812125, 1, 1, 1, 1, 1,
0.5843341, 0.1509319, 2.520585, 1, 1, 1, 1, 1,
0.5907767, -0.4630758, 3.462332, 1, 1, 1, 1, 1,
0.5908518, -1.453191, 3.815907, 1, 1, 1, 1, 1,
0.594312, 1.220192, 0.2902152, 1, 1, 1, 1, 1,
0.5946211, 0.7333803, 0.475827, 1, 1, 1, 1, 1,
0.5962833, 0.9668853, -0.5956085, 1, 1, 1, 1, 1,
0.596733, -0.7639349, 3.946476, 1, 1, 1, 1, 1,
0.5985708, 0.4521799, 0.5272524, 1, 1, 1, 1, 1,
0.5990475, -1.369747, 4.183305, 1, 1, 1, 1, 1,
0.6035786, -0.4108, 1.267031, 1, 1, 1, 1, 1,
0.6078529, -0.3556228, 1.13323, 1, 1, 1, 1, 1,
0.6087756, -0.7167051, 2.50763, 0, 0, 1, 1, 1,
0.615813, -0.7094932, 3.893746, 1, 0, 0, 1, 1,
0.6171926, -1.810239, 2.515536, 1, 0, 0, 1, 1,
0.6181862, 0.6081584, 1.045035, 1, 0, 0, 1, 1,
0.618241, 1.161324, 0.5557187, 1, 0, 0, 1, 1,
0.6207061, 0.0360852, 0.5108936, 1, 0, 0, 1, 1,
0.6249542, 0.8469673, 1.018666, 0, 0, 0, 1, 1,
0.6262807, 1.072079, 2.381618, 0, 0, 0, 1, 1,
0.62651, -1.455145, 3.971033, 0, 0, 0, 1, 1,
0.6288151, -1.052163, 3.14961, 0, 0, 0, 1, 1,
0.629227, 0.2032933, 1.661576, 0, 0, 0, 1, 1,
0.6326793, -1.772898, 2.604274, 0, 0, 0, 1, 1,
0.6352981, 0.3471152, -0.1550776, 0, 0, 0, 1, 1,
0.6368552, 1.873706, -1.028909, 1, 1, 1, 1, 1,
0.6393127, -0.8334106, 4.715885, 1, 1, 1, 1, 1,
0.6393358, 0.721503, 0.03739376, 1, 1, 1, 1, 1,
0.6480988, -0.6426645, 1.914403, 1, 1, 1, 1, 1,
0.6498437, -0.4609633, 2.528478, 1, 1, 1, 1, 1,
0.6570449, -1.908333, 3.238759, 1, 1, 1, 1, 1,
0.6579974, -0.1573441, 1.457052, 1, 1, 1, 1, 1,
0.6609966, 0.868357, 1.730281, 1, 1, 1, 1, 1,
0.6635882, 0.85888, 0.9793183, 1, 1, 1, 1, 1,
0.6655894, -0.7484764, 2.302086, 1, 1, 1, 1, 1,
0.6688486, 0.6601835, 1.971168, 1, 1, 1, 1, 1,
0.6700763, 0.04924597, 1.635426, 1, 1, 1, 1, 1,
0.6707761, 0.347868, 1.669684, 1, 1, 1, 1, 1,
0.6773611, -1.720467, 2.998986, 1, 1, 1, 1, 1,
0.6774856, 0.1846878, 0.4199076, 1, 1, 1, 1, 1,
0.6823115, 2.223485, -0.08561219, 0, 0, 1, 1, 1,
0.685968, -0.2342655, 2.31803, 1, 0, 0, 1, 1,
0.6869024, -0.34278, 3.984358, 1, 0, 0, 1, 1,
0.7043976, -0.7475532, 4.442062, 1, 0, 0, 1, 1,
0.7089667, 0.6681369, 0.04841607, 1, 0, 0, 1, 1,
0.7157126, -1.643902, 1.964509, 1, 0, 0, 1, 1,
0.7159083, -0.4841117, 4.063721, 0, 0, 0, 1, 1,
0.7208037, 0.4469005, 0.2033292, 0, 0, 0, 1, 1,
0.7222365, -0.752185, 1.895451, 0, 0, 0, 1, 1,
0.7379121, -0.04453126, 0.6132186, 0, 0, 0, 1, 1,
0.7402625, 0.6985688, -0.4564476, 0, 0, 0, 1, 1,
0.7428383, 1.43224, 0.8803381, 0, 0, 0, 1, 1,
0.7450423, 0.2489184, 1.877627, 0, 0, 0, 1, 1,
0.7505778, -0.2989935, 1.867653, 1, 1, 1, 1, 1,
0.7549654, -0.09313159, 0.6959032, 1, 1, 1, 1, 1,
0.7615747, 1.812198, -1.602287, 1, 1, 1, 1, 1,
0.7687719, 0.9980201, 0.01408084, 1, 1, 1, 1, 1,
0.7714055, 0.6227437, -0.8911731, 1, 1, 1, 1, 1,
0.7740543, -0.9419543, 1.302845, 1, 1, 1, 1, 1,
0.7787539, 0.1588922, 0.1550335, 1, 1, 1, 1, 1,
0.7821212, 0.1709529, 2.873296, 1, 1, 1, 1, 1,
0.7875702, -0.8083366, 1.727935, 1, 1, 1, 1, 1,
0.7879278, 0.1884845, 1.426511, 1, 1, 1, 1, 1,
0.7890686, 0.320857, 1.465795, 1, 1, 1, 1, 1,
0.7968861, -1.513402, 2.62955, 1, 1, 1, 1, 1,
0.7976462, -0.9619568, 2.21355, 1, 1, 1, 1, 1,
0.8018953, -1.085992, 2.765088, 1, 1, 1, 1, 1,
0.8034662, 0.4363309, 2.614998, 1, 1, 1, 1, 1,
0.8082651, 1.138269, -0.2361624, 0, 0, 1, 1, 1,
0.8084491, 0.6866057, -0.3048387, 1, 0, 0, 1, 1,
0.8107219, 1.100735, -0.2066426, 1, 0, 0, 1, 1,
0.8114403, 0.5472001, 1.849226, 1, 0, 0, 1, 1,
0.817636, 1.06036, 1.515403, 1, 0, 0, 1, 1,
0.8195047, 0.05092043, 2.023826, 1, 0, 0, 1, 1,
0.8315631, 0.5085225, -1.333495, 0, 0, 0, 1, 1,
0.8355289, -1.059718, 2.095347, 0, 0, 0, 1, 1,
0.8428398, -0.09620918, 1.271554, 0, 0, 0, 1, 1,
0.8502052, -0.5310761, 1.802638, 0, 0, 0, 1, 1,
0.853379, 0.1674218, -0.2527127, 0, 0, 0, 1, 1,
0.8543758, 0.02535343, 1.574448, 0, 0, 0, 1, 1,
0.8546221, -0.2099776, 3.993801, 0, 0, 0, 1, 1,
0.8548264, -0.03326552, 1.689798, 1, 1, 1, 1, 1,
0.8563851, -0.6099991, 1.738148, 1, 1, 1, 1, 1,
0.8649769, -0.5439307, 1.422293, 1, 1, 1, 1, 1,
0.8672742, 2.531053, -0.6248956, 1, 1, 1, 1, 1,
0.8675725, 0.9327675, -0.01372646, 1, 1, 1, 1, 1,
0.8708254, -0.8695196, 3.968808, 1, 1, 1, 1, 1,
0.875898, 0.002929408, 1.834742, 1, 1, 1, 1, 1,
0.8762071, 1.088244, 2.912127, 1, 1, 1, 1, 1,
0.8766066, -0.8477776, 0.4140706, 1, 1, 1, 1, 1,
0.8820733, -0.5039569, 0.4683681, 1, 1, 1, 1, 1,
0.8824211, 0.3892546, 2.396031, 1, 1, 1, 1, 1,
0.8851808, -0.5558987, 0.1185598, 1, 1, 1, 1, 1,
0.8854141, 1.393403, 1.464454, 1, 1, 1, 1, 1,
0.8877639, -0.3094699, 2.451228, 1, 1, 1, 1, 1,
0.8928884, -1.497761, 3.37446, 1, 1, 1, 1, 1,
0.8931847, -1.013405, 3.347769, 0, 0, 1, 1, 1,
0.9055089, 0.05016847, 1.498237, 1, 0, 0, 1, 1,
0.9076655, 0.556394, 0.4047853, 1, 0, 0, 1, 1,
0.9082732, -0.09161805, 1.491992, 1, 0, 0, 1, 1,
0.9192766, 0.413653, 3.466444, 1, 0, 0, 1, 1,
0.9223853, 0.08562607, 1.179539, 1, 0, 0, 1, 1,
0.9234944, -0.9095935, 0.9294316, 0, 0, 0, 1, 1,
0.9253402, 0.7464227, 4.611041, 0, 0, 0, 1, 1,
0.9266441, 0.904748, -0.8374425, 0, 0, 0, 1, 1,
0.9306046, -0.3321022, 3.211396, 0, 0, 0, 1, 1,
0.9308135, 0.6584621, 1.424348, 0, 0, 0, 1, 1,
0.9322641, 0.7100936, 0.0172352, 0, 0, 0, 1, 1,
0.9377951, -0.916724, 1.179492, 0, 0, 0, 1, 1,
0.945675, -2.054146, 1.901795, 1, 1, 1, 1, 1,
0.9501548, -0.7815617, 2.200462, 1, 1, 1, 1, 1,
0.9528019, -2.229962, 3.823972, 1, 1, 1, 1, 1,
0.9651613, 0.7604163, 0.6184362, 1, 1, 1, 1, 1,
0.9652688, -1.066283, 3.975701, 1, 1, 1, 1, 1,
0.9655717, 0.9354456, 0.4841353, 1, 1, 1, 1, 1,
0.9695894, -0.8832963, 1.902917, 1, 1, 1, 1, 1,
0.9745847, -0.3498871, 1.965082, 1, 1, 1, 1, 1,
0.9889278, 0.1208917, 0.2097051, 1, 1, 1, 1, 1,
0.9936623, 0.7264421, 1.486517, 1, 1, 1, 1, 1,
0.995298, -0.9177791, 3.446474, 1, 1, 1, 1, 1,
0.9991678, -1.419307, 2.69018, 1, 1, 1, 1, 1,
1.004421, -0.5168191, 2.83729, 1, 1, 1, 1, 1,
1.005512, 0.1603264, 0.9386653, 1, 1, 1, 1, 1,
1.013413, -0.8184983, 2.950436, 1, 1, 1, 1, 1,
1.017064, 1.958796, 1.977034, 0, 0, 1, 1, 1,
1.020023, 0.970816, 0.9127864, 1, 0, 0, 1, 1,
1.022923, -0.3280644, 1.985308, 1, 0, 0, 1, 1,
1.025521, 0.05656961, 1.305668, 1, 0, 0, 1, 1,
1.02684, -0.7742167, 0.5313755, 1, 0, 0, 1, 1,
1.030954, -0.6965364, 2.751755, 1, 0, 0, 1, 1,
1.046178, 2.248217, -0.6895509, 0, 0, 0, 1, 1,
1.055679, 0.02613335, 1.15726, 0, 0, 0, 1, 1,
1.056392, -0.7771641, 3.716037, 0, 0, 0, 1, 1,
1.077899, 1.138255, 0.8709866, 0, 0, 0, 1, 1,
1.078197, 1.753711, 1.461805, 0, 0, 0, 1, 1,
1.079615, -0.2899533, 0.2862986, 0, 0, 0, 1, 1,
1.081866, 0.9595222, 0.160399, 0, 0, 0, 1, 1,
1.085052, 1.264953, 0.4123832, 1, 1, 1, 1, 1,
1.087429, 0.4868976, 1.829896, 1, 1, 1, 1, 1,
1.094732, 0.8718061, 2.028347, 1, 1, 1, 1, 1,
1.09501, 0.4027219, 0.255875, 1, 1, 1, 1, 1,
1.096951, -0.8198645, 2.478754, 1, 1, 1, 1, 1,
1.098784, 0.6868296, 1.027632, 1, 1, 1, 1, 1,
1.099553, 0.2077051, 1.866603, 1, 1, 1, 1, 1,
1.101274, -1.007193, 2.438311, 1, 1, 1, 1, 1,
1.104057, 0.08101907, 0.9685732, 1, 1, 1, 1, 1,
1.111928, 0.9872925, 0.7394035, 1, 1, 1, 1, 1,
1.117737, 0.4870229, 2.820925, 1, 1, 1, 1, 1,
1.11809, -0.002643545, 2.302816, 1, 1, 1, 1, 1,
1.11857, -0.05458285, 2.236873, 1, 1, 1, 1, 1,
1.125273, -1.506858, 4.082059, 1, 1, 1, 1, 1,
1.128528, -0.5765982, 1.386153, 1, 1, 1, 1, 1,
1.130395, 0.4610156, 0.017468, 0, 0, 1, 1, 1,
1.132734, 1.904146, -0.2619279, 1, 0, 0, 1, 1,
1.133536, -0.4499036, 1.692729, 1, 0, 0, 1, 1,
1.13847, -0.8744916, 1.594626, 1, 0, 0, 1, 1,
1.139591, 0.858989, 1.658901, 1, 0, 0, 1, 1,
1.141304, -0.3116108, 1.142253, 1, 0, 0, 1, 1,
1.147808, -0.3692071, 1.255906, 0, 0, 0, 1, 1,
1.172226, 1.47408, 0.5631264, 0, 0, 0, 1, 1,
1.17524, 1.182628, 0.5305447, 0, 0, 0, 1, 1,
1.180077, 1.558368, 2.029581, 0, 0, 0, 1, 1,
1.182428, 0.3642564, 1.43758, 0, 0, 0, 1, 1,
1.184963, 0.2310275, 0.8782892, 0, 0, 0, 1, 1,
1.189328, -0.543793, 2.039419, 0, 0, 0, 1, 1,
1.200809, 3.295469, 0.7830029, 1, 1, 1, 1, 1,
1.201961, -1.460806, 3.02167, 1, 1, 1, 1, 1,
1.202505, 1.650157, -0.6325721, 1, 1, 1, 1, 1,
1.207798, -0.8698289, 1.442453, 1, 1, 1, 1, 1,
1.212128, -1.442737, 1.592832, 1, 1, 1, 1, 1,
1.218872, 0.06413541, 0.7735865, 1, 1, 1, 1, 1,
1.224057, 0.136827, 1.164683, 1, 1, 1, 1, 1,
1.226471, 0.9967271, -1.298862, 1, 1, 1, 1, 1,
1.236421, -0.7953088, 2.026536, 1, 1, 1, 1, 1,
1.244731, 0.2440017, 1.082025, 1, 1, 1, 1, 1,
1.245852, -0.01995889, 1.415321, 1, 1, 1, 1, 1,
1.248597, 0.5806655, 3.899305, 1, 1, 1, 1, 1,
1.250852, -0.5512949, 1.658542, 1, 1, 1, 1, 1,
1.258494, -1.815524, 1.347816, 1, 1, 1, 1, 1,
1.259038, 0.06788149, 3.73961, 1, 1, 1, 1, 1,
1.261716, -0.8473709, 4.168796, 0, 0, 1, 1, 1,
1.263997, 0.6870196, 1.539744, 1, 0, 0, 1, 1,
1.274408, 0.6083076, 0.6927863, 1, 0, 0, 1, 1,
1.276978, -1.834693, 1.816972, 1, 0, 0, 1, 1,
1.279193, 1.483907, 0.1947934, 1, 0, 0, 1, 1,
1.283668, 0.9823378, 0.6617144, 1, 0, 0, 1, 1,
1.284404, -0.301908, 2.183634, 0, 0, 0, 1, 1,
1.285188, -0.1943937, 1.849708, 0, 0, 0, 1, 1,
1.286057, -1.322368, 1.615343, 0, 0, 0, 1, 1,
1.292968, 0.06302152, 0.9418995, 0, 0, 0, 1, 1,
1.296261, 0.6495601, 0.7341498, 0, 0, 0, 1, 1,
1.300305, 0.2728117, 0.7069908, 0, 0, 0, 1, 1,
1.303679, 1.088414, -0.8083689, 0, 0, 0, 1, 1,
1.305994, -0.3183947, 2.540511, 1, 1, 1, 1, 1,
1.338261, 0.5364308, -1.121505, 1, 1, 1, 1, 1,
1.341765, -0.7646533, 0.01891088, 1, 1, 1, 1, 1,
1.343519, -1.258767, 2.049987, 1, 1, 1, 1, 1,
1.346738, -1.518865, 1.767589, 1, 1, 1, 1, 1,
1.347938, -0.04350007, 2.214387, 1, 1, 1, 1, 1,
1.363501, -0.4931607, 0.8329011, 1, 1, 1, 1, 1,
1.373126, -0.2582271, 2.775554, 1, 1, 1, 1, 1,
1.375722, -1.600859, 2.991421, 1, 1, 1, 1, 1,
1.376547, -0.05824975, 2.693335, 1, 1, 1, 1, 1,
1.380218, -0.4973331, 1.656078, 1, 1, 1, 1, 1,
1.381235, 0.684536, 1.281757, 1, 1, 1, 1, 1,
1.385478, -0.6816497, 1.039387, 1, 1, 1, 1, 1,
1.387095, 0.3540145, 0.4268935, 1, 1, 1, 1, 1,
1.402552, -0.8118432, 1.489858, 1, 1, 1, 1, 1,
1.417627, 0.2721086, 3.144603, 0, 0, 1, 1, 1,
1.418878, -1.100305, 0.6711668, 1, 0, 0, 1, 1,
1.425719, -1.339732, 0.7311443, 1, 0, 0, 1, 1,
1.430045, 1.245582, 1.252613, 1, 0, 0, 1, 1,
1.450203, -1.461457, 0.9004158, 1, 0, 0, 1, 1,
1.455768, -0.3546408, 2.437946, 1, 0, 0, 1, 1,
1.468436, 1.235187, 1.887091, 0, 0, 0, 1, 1,
1.469516, -0.25047, 0.7032081, 0, 0, 0, 1, 1,
1.472815, -0.07166477, 0.9147173, 0, 0, 0, 1, 1,
1.479484, 1.672817, 1.341553, 0, 0, 0, 1, 1,
1.488163, -0.4051605, 3.617725, 0, 0, 0, 1, 1,
1.506825, -0.5702114, 1.232962, 0, 0, 0, 1, 1,
1.515294, 0.04834504, 1.718918, 0, 0, 0, 1, 1,
1.51749, -0.390224, 3.602633, 1, 1, 1, 1, 1,
1.524235, 1.047465, 1.041522, 1, 1, 1, 1, 1,
1.537928, 0.3131889, 0.2200467, 1, 1, 1, 1, 1,
1.544234, 1.741595, 1.175869, 1, 1, 1, 1, 1,
1.553985, -1.403036, 2.3441, 1, 1, 1, 1, 1,
1.562987, -0.7450485, 2.26116, 1, 1, 1, 1, 1,
1.566437, 2.308567, -1.110845, 1, 1, 1, 1, 1,
1.569999, 1.660876, -0.8569639, 1, 1, 1, 1, 1,
1.583983, 0.9244703, 2.689692, 1, 1, 1, 1, 1,
1.593962, -0.2516885, 1.444412, 1, 1, 1, 1, 1,
1.598495, 0.2525741, 0.5936916, 1, 1, 1, 1, 1,
1.600311, 0.3469203, 3.439214, 1, 1, 1, 1, 1,
1.601998, 1.474731, 1.050294, 1, 1, 1, 1, 1,
1.602761, 0.9648864, 3.146381, 1, 1, 1, 1, 1,
1.624419, 0.9737214, 0.4534899, 1, 1, 1, 1, 1,
1.663779, -0.5843694, 2.817433, 0, 0, 1, 1, 1,
1.69713, 0.1931569, 3.208884, 1, 0, 0, 1, 1,
1.697538, -1.674969, 1.445124, 1, 0, 0, 1, 1,
1.698408, 0.297525, -0.2240816, 1, 0, 0, 1, 1,
1.711812, 1.089152, 2.972443, 1, 0, 0, 1, 1,
1.743579, -1.306051, 0.7882872, 1, 0, 0, 1, 1,
1.748302, -0.1236468, 1.186775, 0, 0, 0, 1, 1,
1.750965, -0.01245809, 2.874604, 0, 0, 0, 1, 1,
1.766763, -1.655756, 2.092705, 0, 0, 0, 1, 1,
1.778028, 0.4835004, 1.961038, 0, 0, 0, 1, 1,
1.789398, 0.550675, 1.828461, 0, 0, 0, 1, 1,
1.812682, -1.333659, 1.747833, 0, 0, 0, 1, 1,
1.819241, 1.633571, -0.09274756, 0, 0, 0, 1, 1,
1.88537, 0.6849776, 0.5247869, 1, 1, 1, 1, 1,
1.902434, -0.3214433, 3.461498, 1, 1, 1, 1, 1,
1.908433, -1.178955, 1.711173, 1, 1, 1, 1, 1,
1.912989, -0.5274043, 2.637424, 1, 1, 1, 1, 1,
1.91841, -0.1584071, 0.9259273, 1, 1, 1, 1, 1,
1.919131, -1.670118, 1.547409, 1, 1, 1, 1, 1,
1.934857, 2.524755, 3.970322, 1, 1, 1, 1, 1,
1.968258, -0.0988729, 1.743146, 1, 1, 1, 1, 1,
1.973651, 0.4963134, -0.520936, 1, 1, 1, 1, 1,
2.037878, 2.524412, -0.9937077, 1, 1, 1, 1, 1,
2.03847, -0.7618685, 1.792005, 1, 1, 1, 1, 1,
2.045348, -0.1767158, 1.916247, 1, 1, 1, 1, 1,
2.058381, 1.759113, 0.6369603, 1, 1, 1, 1, 1,
2.077758, -0.7422026, 2.147796, 1, 1, 1, 1, 1,
2.093259, 0.7068334, 0.459117, 1, 1, 1, 1, 1,
2.109479, 1.886632, 1.615707, 0, 0, 1, 1, 1,
2.113854, 0.6413414, 1.238048, 1, 0, 0, 1, 1,
2.121264, 0.7650515, 1.51783, 1, 0, 0, 1, 1,
2.152488, -0.7146664, 0.234724, 1, 0, 0, 1, 1,
2.238364, -0.5417051, -0.03032384, 1, 0, 0, 1, 1,
2.246566, 0.8157125, 2.794536, 1, 0, 0, 1, 1,
2.291756, 1.296977, 2.423195, 0, 0, 0, 1, 1,
2.334393, -0.1778668, 0.7251254, 0, 0, 0, 1, 1,
2.335674, 0.009205434, 2.320346, 0, 0, 0, 1, 1,
2.338986, 0.9072594, 2.04947, 0, 0, 0, 1, 1,
2.369434, 0.3806418, 1.578775, 0, 0, 0, 1, 1,
2.485434, 0.7304628, 2.340535, 0, 0, 0, 1, 1,
2.502609, 0.0618563, 1.948406, 0, 0, 0, 1, 1,
2.58487, -0.1135951, 1.331182, 1, 1, 1, 1, 1,
2.615942, 0.5544497, 0.9852437, 1, 1, 1, 1, 1,
2.633433, 2.042203, 0.459044, 1, 1, 1, 1, 1,
2.713228, -0.7826687, 1.179705, 1, 1, 1, 1, 1,
3.255865, -0.5733243, 2.256269, 1, 1, 1, 1, 1,
3.257288, 0.9450503, 1.863492, 1, 1, 1, 1, 1,
3.315049, -0.6392485, 1.418543, 1, 1, 1, 1, 1
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
var radius = 9.373597;
var distance = 32.92436;
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
mvMatrix.translate( -0.1119423, -0.1826876, 0.2195263 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.92436);
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
