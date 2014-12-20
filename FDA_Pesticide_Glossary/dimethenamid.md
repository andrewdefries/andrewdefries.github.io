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
-2.920624, -0.5025775, -0.3552711, 1, 0, 0, 1,
-2.895572, -1.012075, -1.685032, 1, 0.007843138, 0, 1,
-2.874836, 0.5055655, -1.595835, 1, 0.01176471, 0, 1,
-2.743418, -0.7583826, -1.625434, 1, 0.01960784, 0, 1,
-2.678161, -0.820807, -1.442896, 1, 0.02352941, 0, 1,
-2.56738, -1.233311, -0.9302964, 1, 0.03137255, 0, 1,
-2.514702, -1.466137, -0.4940198, 1, 0.03529412, 0, 1,
-2.430124, 1.351924, -1.601013, 1, 0.04313726, 0, 1,
-2.381121, -0.2654329, -4.228623, 1, 0.04705882, 0, 1,
-2.326551, 1.546996, -1.967319, 1, 0.05490196, 0, 1,
-2.31593, -0.2445942, -1.29319, 1, 0.05882353, 0, 1,
-2.277296, 0.4114999, -1.062167, 1, 0.06666667, 0, 1,
-2.251268, -1.040423, -2.70129, 1, 0.07058824, 0, 1,
-2.226811, -0.2665064, -1.410001, 1, 0.07843138, 0, 1,
-2.224393, -0.1308798, -0.02856541, 1, 0.08235294, 0, 1,
-2.207222, -0.2529809, -1.337617, 1, 0.09019608, 0, 1,
-2.196547, 1.887471, 0.3722381, 1, 0.09411765, 0, 1,
-2.162552, -1.450366, -1.020672, 1, 0.1019608, 0, 1,
-2.139604, 0.1690173, -3.978563, 1, 0.1098039, 0, 1,
-2.11968, 1.68903, 0.3926255, 1, 0.1137255, 0, 1,
-2.118001, 1.603598, 0.1093842, 1, 0.1215686, 0, 1,
-2.057921, -0.7726008, -2.463413, 1, 0.1254902, 0, 1,
-2.054144, -0.2275042, -1.701962, 1, 0.1333333, 0, 1,
-2.045393, -0.07769062, -2.234889, 1, 0.1372549, 0, 1,
-2.00409, -0.5575692, -2.458954, 1, 0.145098, 0, 1,
-1.970187, 0.7091758, -2.081461, 1, 0.1490196, 0, 1,
-1.955223, -0.6675359, -1.110232, 1, 0.1568628, 0, 1,
-1.949486, 1.219561, -0.2482173, 1, 0.1607843, 0, 1,
-1.930229, -0.5801079, -2.318274, 1, 0.1686275, 0, 1,
-1.895421, -0.4505699, -2.353523, 1, 0.172549, 0, 1,
-1.857415, -2.091782, -1.147923, 1, 0.1803922, 0, 1,
-1.856161, -0.3427386, -1.624498, 1, 0.1843137, 0, 1,
-1.852771, -1.212204, -3.168525, 1, 0.1921569, 0, 1,
-1.846244, 0.3425653, -1.038236, 1, 0.1960784, 0, 1,
-1.824828, -0.2586502, -1.576439, 1, 0.2039216, 0, 1,
-1.815931, -0.4776929, -2.083937, 1, 0.2117647, 0, 1,
-1.807958, 1.162227, -1.476922, 1, 0.2156863, 0, 1,
-1.806233, -0.1073218, -2.096159, 1, 0.2235294, 0, 1,
-1.795792, 0.1692752, -0.3291296, 1, 0.227451, 0, 1,
-1.780012, 1.194893, -2.335151, 1, 0.2352941, 0, 1,
-1.773483, 0.6049932, -1.428689, 1, 0.2392157, 0, 1,
-1.770263, -1.484983, -2.415414, 1, 0.2470588, 0, 1,
-1.741676, 1.826828, 0.04590036, 1, 0.2509804, 0, 1,
-1.736849, 1.147675, -1.421089, 1, 0.2588235, 0, 1,
-1.724619, -1.118862, -1.176446, 1, 0.2627451, 0, 1,
-1.715436, -0.7865785, -1.33934, 1, 0.2705882, 0, 1,
-1.711442, -0.5966861, -1.910534, 1, 0.2745098, 0, 1,
-1.708725, 1.467546, -1.051818, 1, 0.282353, 0, 1,
-1.693561, 0.07740366, -0.9118556, 1, 0.2862745, 0, 1,
-1.687367, 0.1442631, -1.555034, 1, 0.2941177, 0, 1,
-1.687034, -0.5314555, -0.9533973, 1, 0.3019608, 0, 1,
-1.640666, -0.04578963, -2.24528, 1, 0.3058824, 0, 1,
-1.633196, 0.389059, -1.4868, 1, 0.3137255, 0, 1,
-1.622558, -0.2111931, 0.4359779, 1, 0.3176471, 0, 1,
-1.618847, 0.3409226, -3.170012, 1, 0.3254902, 0, 1,
-1.617473, -1.461504, -3.217112, 1, 0.3294118, 0, 1,
-1.616702, 0.614852, 0.3761763, 1, 0.3372549, 0, 1,
-1.599334, 0.9640042, -3.21829, 1, 0.3411765, 0, 1,
-1.599313, -0.6907233, -1.713637, 1, 0.3490196, 0, 1,
-1.598323, -0.6341487, -1.088522, 1, 0.3529412, 0, 1,
-1.587688, -1.486682, -4.575416, 1, 0.3607843, 0, 1,
-1.581531, -0.3003895, -2.331045, 1, 0.3647059, 0, 1,
-1.578126, 0.5523679, -1.687526, 1, 0.372549, 0, 1,
-1.572467, -0.9209719, -0.7778435, 1, 0.3764706, 0, 1,
-1.539199, -0.09856959, -1.918005, 1, 0.3843137, 0, 1,
-1.530947, -1.42266, -3.017427, 1, 0.3882353, 0, 1,
-1.524956, -0.6520504, -2.133805, 1, 0.3960784, 0, 1,
-1.520079, -0.4685307, -2.500213, 1, 0.4039216, 0, 1,
-1.514109, -1.388921, -1.928917, 1, 0.4078431, 0, 1,
-1.512248, -1.163939, -0.3503805, 1, 0.4156863, 0, 1,
-1.503253, 0.8117414, -0.7961362, 1, 0.4196078, 0, 1,
-1.498809, 0.5312426, -1.443555, 1, 0.427451, 0, 1,
-1.492196, 1.694942, -1.480668, 1, 0.4313726, 0, 1,
-1.482862, -0.4642416, -2.773306, 1, 0.4392157, 0, 1,
-1.475132, 0.2432762, 0.05736965, 1, 0.4431373, 0, 1,
-1.457459, -1.000948, -4.117421, 1, 0.4509804, 0, 1,
-1.450445, 2.495354, 2.300205, 1, 0.454902, 0, 1,
-1.439134, -1.034075, -1.093723, 1, 0.4627451, 0, 1,
-1.431893, -1.133785, -3.194469, 1, 0.4666667, 0, 1,
-1.431051, 0.6420509, -0.6661198, 1, 0.4745098, 0, 1,
-1.422787, 0.03152996, -1.933754, 1, 0.4784314, 0, 1,
-1.370892, 0.610291, -1.147195, 1, 0.4862745, 0, 1,
-1.368995, -0.3424342, -3.251798, 1, 0.4901961, 0, 1,
-1.367051, 1.195965, 1.82782, 1, 0.4980392, 0, 1,
-1.362433, -1.618177, -2.618826, 1, 0.5058824, 0, 1,
-1.358864, -0.7793759, -1.076251, 1, 0.509804, 0, 1,
-1.351236, -0.9039136, -2.223458, 1, 0.5176471, 0, 1,
-1.336221, -1.369277, -3.033476, 1, 0.5215687, 0, 1,
-1.32846, 1.435393, 0.5865337, 1, 0.5294118, 0, 1,
-1.328454, 0.1679949, 0.1922538, 1, 0.5333334, 0, 1,
-1.327422, 1.806418, -1.163691, 1, 0.5411765, 0, 1,
-1.323325, 0.04078252, -1.2343, 1, 0.5450981, 0, 1,
-1.321285, 2.086714, -0.8993953, 1, 0.5529412, 0, 1,
-1.312423, 1.138675, -1.444168, 1, 0.5568628, 0, 1,
-1.309399, 0.1920624, -1.130472, 1, 0.5647059, 0, 1,
-1.300151, 0.536818, -3.182088, 1, 0.5686275, 0, 1,
-1.298702, 0.6270528, -3.022457, 1, 0.5764706, 0, 1,
-1.284004, -0.514893, -1.004264, 1, 0.5803922, 0, 1,
-1.281059, 1.660345, 0.4916531, 1, 0.5882353, 0, 1,
-1.277707, -0.5764567, -3.486947, 1, 0.5921569, 0, 1,
-1.27712, 1.022922, -0.2020673, 1, 0.6, 0, 1,
-1.26827, -0.6984394, -1.980493, 1, 0.6078432, 0, 1,
-1.25612, 2.846013, -0.3319679, 1, 0.6117647, 0, 1,
-1.252836, 0.6605554, -0.3930295, 1, 0.6196079, 0, 1,
-1.25115, 0.009771732, 0.145881, 1, 0.6235294, 0, 1,
-1.250285, 0.7339947, -1.283374, 1, 0.6313726, 0, 1,
-1.241498, 0.8613075, -2.130658, 1, 0.6352941, 0, 1,
-1.239438, 1.462791, -1.333854, 1, 0.6431373, 0, 1,
-1.232188, -0.1199551, -2.422097, 1, 0.6470588, 0, 1,
-1.231644, -0.7631496, -2.948662, 1, 0.654902, 0, 1,
-1.2311, 0.5418953, -2.15169, 1, 0.6588235, 0, 1,
-1.224179, 1.258147, -0.9059575, 1, 0.6666667, 0, 1,
-1.221401, 1.589632, 0.4416765, 1, 0.6705883, 0, 1,
-1.208046, -0.006560958, -1.928498, 1, 0.6784314, 0, 1,
-1.204997, 0.7903081, -0.4573226, 1, 0.682353, 0, 1,
-1.191505, 0.3054143, -2.712398, 1, 0.6901961, 0, 1,
-1.191059, -0.04666796, -3.872107, 1, 0.6941177, 0, 1,
-1.186705, 0.4628285, -0.5283206, 1, 0.7019608, 0, 1,
-1.183346, 1.035002, -0.5124125, 1, 0.7098039, 0, 1,
-1.181181, -1.581895, -2.668596, 1, 0.7137255, 0, 1,
-1.180832, 0.3967593, -3.620841, 1, 0.7215686, 0, 1,
-1.180724, 0.1209397, -1.480126, 1, 0.7254902, 0, 1,
-1.176458, -0.1538825, -1.306946, 1, 0.7333333, 0, 1,
-1.171673, 0.7524117, -3.812354, 1, 0.7372549, 0, 1,
-1.170089, 0.1191816, -0.6252041, 1, 0.7450981, 0, 1,
-1.169016, -1.801723, -2.597343, 1, 0.7490196, 0, 1,
-1.162115, 0.6363794, -0.1212225, 1, 0.7568628, 0, 1,
-1.16171, -0.8092389, -2.189172, 1, 0.7607843, 0, 1,
-1.158192, -0.675403, -2.26407, 1, 0.7686275, 0, 1,
-1.150533, 1.759318, -0.5532239, 1, 0.772549, 0, 1,
-1.143657, 0.1717714, -1.888167, 1, 0.7803922, 0, 1,
-1.136365, 0.3218379, -0.9578004, 1, 0.7843137, 0, 1,
-1.12654, -1.477718, -1.364588, 1, 0.7921569, 0, 1,
-1.115337, -0.6878958, -2.812811, 1, 0.7960784, 0, 1,
-1.114437, -1.16031, -2.9733, 1, 0.8039216, 0, 1,
-1.099469, 0.1014134, 0.2680536, 1, 0.8117647, 0, 1,
-1.095504, 0.4893691, -1.115986, 1, 0.8156863, 0, 1,
-1.093611, -1.528269, -1.794758, 1, 0.8235294, 0, 1,
-1.091499, 0.2763316, -0.3540397, 1, 0.827451, 0, 1,
-1.091006, 2.247532, -1.030057, 1, 0.8352941, 0, 1,
-1.089771, 0.6369267, -2.266201, 1, 0.8392157, 0, 1,
-1.088731, -0.2849882, -2.127784, 1, 0.8470588, 0, 1,
-1.087921, 0.04707867, -1.89336, 1, 0.8509804, 0, 1,
-1.087551, 0.4507711, 0.6539169, 1, 0.8588235, 0, 1,
-1.076231, 1.081742, -0.8454272, 1, 0.8627451, 0, 1,
-1.075777, 0.09740862, -1.012655, 1, 0.8705882, 0, 1,
-1.066218, 0.7755887, -0.9835976, 1, 0.8745098, 0, 1,
-1.063126, 1.354304, -0.9504412, 1, 0.8823529, 0, 1,
-1.057864, -1.270235, -2.955384, 1, 0.8862745, 0, 1,
-1.056118, 0.01271135, -1.842765, 1, 0.8941177, 0, 1,
-1.055468, 1.093789, -1.022193, 1, 0.8980392, 0, 1,
-1.053047, 0.119057, -0.7718759, 1, 0.9058824, 0, 1,
-1.052795, 0.4515188, -2.945366, 1, 0.9137255, 0, 1,
-1.03916, -0.4202002, -3.474167, 1, 0.9176471, 0, 1,
-1.036283, 0.06726746, -1.331672, 1, 0.9254902, 0, 1,
-1.034808, 0.7436261, 0.06683364, 1, 0.9294118, 0, 1,
-1.033652, 0.6088204, -1.472148, 1, 0.9372549, 0, 1,
-1.031013, 1.974743, -0.441834, 1, 0.9411765, 0, 1,
-1.02672, -0.2909308, -2.304569, 1, 0.9490196, 0, 1,
-1.024995, -2.10939, -2.547657, 1, 0.9529412, 0, 1,
-1.018474, -1.414181, -1.394645, 1, 0.9607843, 0, 1,
-1.013176, -2.017965, -3.163042, 1, 0.9647059, 0, 1,
-1.009372, -0.2341103, -1.057308, 1, 0.972549, 0, 1,
-1.004849, 0.8919742, 0.23798, 1, 0.9764706, 0, 1,
-1.003745, 1.258983, -0.6366321, 1, 0.9843137, 0, 1,
-0.9985297, 2.076369, -0.5051317, 1, 0.9882353, 0, 1,
-0.9801791, 0.2788614, -2.301323, 1, 0.9960784, 0, 1,
-0.9630426, 1.148969, -2.773208, 0.9960784, 1, 0, 1,
-0.9629775, 0.1728419, -1.725665, 0.9921569, 1, 0, 1,
-0.9619591, 1.644066, -2.406239, 0.9843137, 1, 0, 1,
-0.9609724, 0.1172046, 0.1140813, 0.9803922, 1, 0, 1,
-0.9536896, 1.176583, 0.3265256, 0.972549, 1, 0, 1,
-0.9511679, 0.4124951, -0.4699751, 0.9686275, 1, 0, 1,
-0.9404469, 0.712091, -1.029099, 0.9607843, 1, 0, 1,
-0.935202, -1.042797, -2.926701, 0.9568627, 1, 0, 1,
-0.9291774, -1.628409, -3.462229, 0.9490196, 1, 0, 1,
-0.9198095, 1.125448, 0.1820275, 0.945098, 1, 0, 1,
-0.9175057, -0.9026149, -1.224753, 0.9372549, 1, 0, 1,
-0.9111236, 0.7405013, -0.6101865, 0.9333333, 1, 0, 1,
-0.8994589, 0.02359533, -2.37328, 0.9254902, 1, 0, 1,
-0.8976783, -0.8359126, -2.474215, 0.9215686, 1, 0, 1,
-0.8960911, 0.6320669, -0.3994577, 0.9137255, 1, 0, 1,
-0.8907135, -0.2976167, -1.706501, 0.9098039, 1, 0, 1,
-0.8896282, -0.9151871, -3.387835, 0.9019608, 1, 0, 1,
-0.886371, 0.1434869, -1.409413, 0.8941177, 1, 0, 1,
-0.8862694, -0.5178887, -2.559514, 0.8901961, 1, 0, 1,
-0.8791021, -1.35324, -2.077336, 0.8823529, 1, 0, 1,
-0.8763676, 0.753758, -0.9507608, 0.8784314, 1, 0, 1,
-0.8741838, -0.9261428, -2.357639, 0.8705882, 1, 0, 1,
-0.8714582, 0.4761968, -2.145965, 0.8666667, 1, 0, 1,
-0.8713749, 0.4256098, -0.4885233, 0.8588235, 1, 0, 1,
-0.8713728, -0.205807, 0.8846258, 0.854902, 1, 0, 1,
-0.8711605, -0.1183974, -2.284677, 0.8470588, 1, 0, 1,
-0.8704974, 0.8363092, -2.246097, 0.8431373, 1, 0, 1,
-0.867816, -0.5256815, -1.417884, 0.8352941, 1, 0, 1,
-0.8587168, 1.630315, -1.552176, 0.8313726, 1, 0, 1,
-0.8544564, -1.224032, -3.913168, 0.8235294, 1, 0, 1,
-0.8537406, -0.4033749, -1.272747, 0.8196079, 1, 0, 1,
-0.849807, -0.9619667, -1.494463, 0.8117647, 1, 0, 1,
-0.8485724, 0.8567651, -2.043918, 0.8078431, 1, 0, 1,
-0.8472434, -0.8964489, -2.599244, 0.8, 1, 0, 1,
-0.8446535, 0.1088434, -2.355857, 0.7921569, 1, 0, 1,
-0.8396732, -0.4430691, -2.40367, 0.7882353, 1, 0, 1,
-0.8392876, -0.4246406, -3.156501, 0.7803922, 1, 0, 1,
-0.8372614, -0.2072639, -3.749195, 0.7764706, 1, 0, 1,
-0.8296357, -0.3718642, -2.733684, 0.7686275, 1, 0, 1,
-0.8288161, -0.7896853, -3.350104, 0.7647059, 1, 0, 1,
-0.8201291, 1.253062, -0.2884569, 0.7568628, 1, 0, 1,
-0.8168133, -0.2230666, -2.232408, 0.7529412, 1, 0, 1,
-0.8160411, 0.7939215, -1.670757, 0.7450981, 1, 0, 1,
-0.8087463, -0.5790813, -2.214801, 0.7411765, 1, 0, 1,
-0.8079126, 1.057368, -0.9021385, 0.7333333, 1, 0, 1,
-0.8036141, 0.9010308, -0.29088, 0.7294118, 1, 0, 1,
-0.8003761, -1.663689, -2.566873, 0.7215686, 1, 0, 1,
-0.7999031, 0.5927928, -0.1042387, 0.7176471, 1, 0, 1,
-0.7996218, 0.5718621, -1.736049, 0.7098039, 1, 0, 1,
-0.7980854, 1.023321, -1.063879, 0.7058824, 1, 0, 1,
-0.7971154, -0.536437, -2.984735, 0.6980392, 1, 0, 1,
-0.7721038, 2.185193, 0.5260007, 0.6901961, 1, 0, 1,
-0.7559472, -0.4089548, -2.57009, 0.6862745, 1, 0, 1,
-0.7523521, 0.4549764, -0.9381725, 0.6784314, 1, 0, 1,
-0.7517592, -0.3647301, -2.697121, 0.6745098, 1, 0, 1,
-0.7487772, 0.5343065, -1.785504, 0.6666667, 1, 0, 1,
-0.7434872, -0.4639505, -0.5374618, 0.6627451, 1, 0, 1,
-0.7430245, -0.4925144, -2.786307, 0.654902, 1, 0, 1,
-0.7409171, -0.4670294, -2.043045, 0.6509804, 1, 0, 1,
-0.7317737, -1.24973, -2.64723, 0.6431373, 1, 0, 1,
-0.7270043, 0.5703067, -0.7092608, 0.6392157, 1, 0, 1,
-0.7255763, -0.5420608, -3.979374, 0.6313726, 1, 0, 1,
-0.7219416, 0.1347538, 0.3338006, 0.627451, 1, 0, 1,
-0.7151903, 1.196982, -1.19212, 0.6196079, 1, 0, 1,
-0.7136664, 0.1621941, 0.2839904, 0.6156863, 1, 0, 1,
-0.7005839, 0.4763014, -1.000381, 0.6078432, 1, 0, 1,
-0.6997425, 0.5752439, -1.787099, 0.6039216, 1, 0, 1,
-0.6985426, 0.7188158, -0.9844831, 0.5960785, 1, 0, 1,
-0.6981518, -0.4002599, -3.279499, 0.5882353, 1, 0, 1,
-0.6906598, 0.3588034, -2.234804, 0.5843138, 1, 0, 1,
-0.6778666, 0.3168691, 1.533552, 0.5764706, 1, 0, 1,
-0.6775201, -0.5176935, -2.741007, 0.572549, 1, 0, 1,
-0.6757433, 0.3885455, -1.473451, 0.5647059, 1, 0, 1,
-0.6752523, 1.161655, -0.7833507, 0.5607843, 1, 0, 1,
-0.6732405, 0.4322785, -0.5922698, 0.5529412, 1, 0, 1,
-0.6723837, 0.1250789, 1.348231, 0.5490196, 1, 0, 1,
-0.6630332, 0.5717256, -1.647297, 0.5411765, 1, 0, 1,
-0.6615491, -0.4796427, -2.242437, 0.5372549, 1, 0, 1,
-0.6611053, 0.5472791, -2.63658, 0.5294118, 1, 0, 1,
-0.6607775, -0.5521778, -2.893261, 0.5254902, 1, 0, 1,
-0.6589213, 1.94673, -0.2315788, 0.5176471, 1, 0, 1,
-0.6479264, 0.07027949, -2.184932, 0.5137255, 1, 0, 1,
-0.6415558, 0.1497734, -1.491879, 0.5058824, 1, 0, 1,
-0.6351061, -0.5686511, -0.8505737, 0.5019608, 1, 0, 1,
-0.6305129, 0.6522009, -3.058475, 0.4941176, 1, 0, 1,
-0.6215877, -0.4414281, -3.215316, 0.4862745, 1, 0, 1,
-0.618153, -1.575477, -1.515496, 0.4823529, 1, 0, 1,
-0.6156551, -1.12776, -2.952399, 0.4745098, 1, 0, 1,
-0.6137605, -0.1999051, -0.9136884, 0.4705882, 1, 0, 1,
-0.6123998, -1.986313, -2.229364, 0.4627451, 1, 0, 1,
-0.6090469, -0.1897681, -1.890634, 0.4588235, 1, 0, 1,
-0.6086195, 0.7844066, -0.706701, 0.4509804, 1, 0, 1,
-0.6081012, -0.7467413, -3.795132, 0.4470588, 1, 0, 1,
-0.607847, 0.05840242, -1.103779, 0.4392157, 1, 0, 1,
-0.607148, -1.019036, -3.551228, 0.4352941, 1, 0, 1,
-0.6043043, -0.4311042, -1.397847, 0.427451, 1, 0, 1,
-0.5986733, 0.5917873, -2.110346, 0.4235294, 1, 0, 1,
-0.5937498, 1.347646, -0.4544744, 0.4156863, 1, 0, 1,
-0.5898711, -1.143584, -2.093859, 0.4117647, 1, 0, 1,
-0.5873212, -0.764609, -2.70041, 0.4039216, 1, 0, 1,
-0.5831279, 0.3010392, -1.119452, 0.3960784, 1, 0, 1,
-0.5825232, 1.451652, 0.06080282, 0.3921569, 1, 0, 1,
-0.5815005, -0.267738, -0.9153035, 0.3843137, 1, 0, 1,
-0.5805646, -0.09592086, -1.868232, 0.3803922, 1, 0, 1,
-0.5792608, 1.014858, -0.7460659, 0.372549, 1, 0, 1,
-0.5744104, -0.8614158, -2.949252, 0.3686275, 1, 0, 1,
-0.5691227, -0.5369098, -2.73802, 0.3607843, 1, 0, 1,
-0.5676256, -0.9881196, -0.9904467, 0.3568628, 1, 0, 1,
-0.5642935, 1.184891, -2.101296, 0.3490196, 1, 0, 1,
-0.560316, 0.5521742, -1.475651, 0.345098, 1, 0, 1,
-0.5548309, 0.3356462, -2.298785, 0.3372549, 1, 0, 1,
-0.5496302, -0.9407784, -1.602283, 0.3333333, 1, 0, 1,
-0.5488892, -0.2680096, -1.476998, 0.3254902, 1, 0, 1,
-0.5487288, -1.299045, -4.031135, 0.3215686, 1, 0, 1,
-0.5477547, 0.9355824, -1.533802, 0.3137255, 1, 0, 1,
-0.5446361, 0.5680718, -0.839592, 0.3098039, 1, 0, 1,
-0.5428441, -1.468548, -3.092514, 0.3019608, 1, 0, 1,
-0.5411054, -0.06012391, -3.011674, 0.2941177, 1, 0, 1,
-0.538238, 0.3463103, -2.811042, 0.2901961, 1, 0, 1,
-0.5261125, -1.248416, -3.372527, 0.282353, 1, 0, 1,
-0.5260699, -0.4923398, -2.001996, 0.2784314, 1, 0, 1,
-0.5258145, 0.6012359, -0.6702583, 0.2705882, 1, 0, 1,
-0.5241098, -1.737147, -3.341826, 0.2666667, 1, 0, 1,
-0.519668, 0.7191427, 0.1724106, 0.2588235, 1, 0, 1,
-0.5180047, -1.45436, -6.172495, 0.254902, 1, 0, 1,
-0.5152779, -0.7523489, -3.047648, 0.2470588, 1, 0, 1,
-0.5149329, -0.7336885, -3.273463, 0.2431373, 1, 0, 1,
-0.5117812, -0.9853956, -3.193255, 0.2352941, 1, 0, 1,
-0.5113941, 0.4005811, -0.9066414, 0.2313726, 1, 0, 1,
-0.5082705, -1.240948, -2.94444, 0.2235294, 1, 0, 1,
-0.5042917, 1.064539, 0.9250281, 0.2196078, 1, 0, 1,
-0.4945088, 0.5520248, -0.6431105, 0.2117647, 1, 0, 1,
-0.4913682, 0.3812783, 1.295987, 0.2078431, 1, 0, 1,
-0.4873815, -0.28952, -2.756457, 0.2, 1, 0, 1,
-0.4831319, -1.762296, -2.643951, 0.1921569, 1, 0, 1,
-0.4826676, 0.3871477, -0.2833902, 0.1882353, 1, 0, 1,
-0.4819006, -1.435513, -2.252675, 0.1803922, 1, 0, 1,
-0.4801891, 0.5583145, -1.358497, 0.1764706, 1, 0, 1,
-0.4793892, 0.1537837, -0.6718119, 0.1686275, 1, 0, 1,
-0.4787072, 0.4866961, -1.169371, 0.1647059, 1, 0, 1,
-0.4742957, -0.023654, -1.900446, 0.1568628, 1, 0, 1,
-0.4718267, 0.8637874, -0.491428, 0.1529412, 1, 0, 1,
-0.4708545, 0.2613783, 0.6342638, 0.145098, 1, 0, 1,
-0.4641406, 0.8172809, -1.74579, 0.1411765, 1, 0, 1,
-0.4557583, -0.2191865, 1.002252, 0.1333333, 1, 0, 1,
-0.4543354, -1.565385, -2.70003, 0.1294118, 1, 0, 1,
-0.4524575, -1.966351, -4.486341, 0.1215686, 1, 0, 1,
-0.4509836, 1.709194, -1.492448, 0.1176471, 1, 0, 1,
-0.4409293, -0.5277719, -1.01023, 0.1098039, 1, 0, 1,
-0.4383984, -1.594092, -2.105904, 0.1058824, 1, 0, 1,
-0.4378453, 0.6864481, -1.112298, 0.09803922, 1, 0, 1,
-0.4359814, 0.4740182, 1.051099, 0.09019608, 1, 0, 1,
-0.4353522, -0.551122, -1.060911, 0.08627451, 1, 0, 1,
-0.434846, 0.6514599, -2.887059, 0.07843138, 1, 0, 1,
-0.4323, -0.6822041, -3.105153, 0.07450981, 1, 0, 1,
-0.423491, 1.232462, -2.05097, 0.06666667, 1, 0, 1,
-0.4217288, -0.8294075, -2.362247, 0.0627451, 1, 0, 1,
-0.4207338, 0.1698121, -2.45491, 0.05490196, 1, 0, 1,
-0.4189095, -0.5745714, -3.08126, 0.05098039, 1, 0, 1,
-0.4121299, 0.8352475, 0.00365361, 0.04313726, 1, 0, 1,
-0.4084778, -0.3463802, -0.9351029, 0.03921569, 1, 0, 1,
-0.3935731, -1.56964, -4.795403, 0.03137255, 1, 0, 1,
-0.3912167, -1.051775, -3.222, 0.02745098, 1, 0, 1,
-0.3899287, -0.1510973, -0.9355168, 0.01960784, 1, 0, 1,
-0.3876379, -0.7499446, -3.121909, 0.01568628, 1, 0, 1,
-0.3843935, -0.002115349, -0.913515, 0.007843138, 1, 0, 1,
-0.3843509, 0.8327558, 0.9492563, 0.003921569, 1, 0, 1,
-0.3804353, 0.2066557, -0.3082056, 0, 1, 0.003921569, 1,
-0.3786192, -1.134164, -1.435048, 0, 1, 0.01176471, 1,
-0.3714807, -1.627438, -2.522151, 0, 1, 0.01568628, 1,
-0.3697593, -0.4852451, -1.30979, 0, 1, 0.02352941, 1,
-0.3661059, 1.791535, -0.9723307, 0, 1, 0.02745098, 1,
-0.3660032, -0.8270071, -2.170004, 0, 1, 0.03529412, 1,
-0.360089, 1.13701, -0.8903142, 0, 1, 0.03921569, 1,
-0.3549033, 1.450919, -0.4348416, 0, 1, 0.04705882, 1,
-0.3528712, 0.03890178, -1.693675, 0, 1, 0.05098039, 1,
-0.3463162, -1.71992, -3.508259, 0, 1, 0.05882353, 1,
-0.3446468, -0.6084256, -3.754156, 0, 1, 0.0627451, 1,
-0.3415267, -1.118259, -3.929054, 0, 1, 0.07058824, 1,
-0.3364057, -2.029852, -3.497742, 0, 1, 0.07450981, 1,
-0.33202, -0.3364978, -3.757427, 0, 1, 0.08235294, 1,
-0.331836, -0.2373338, -0.9226754, 0, 1, 0.08627451, 1,
-0.3268373, -0.2439567, -3.598195, 0, 1, 0.09411765, 1,
-0.3244172, -0.6947536, -1.513703, 0, 1, 0.1019608, 1,
-0.3240933, 0.9252024, -0.03656844, 0, 1, 0.1058824, 1,
-0.3240882, 0.9865205, 0.3885427, 0, 1, 0.1137255, 1,
-0.3184274, 0.1357031, -1.171382, 0, 1, 0.1176471, 1,
-0.3177002, -0.0212609, -1.32082, 0, 1, 0.1254902, 1,
-0.3159134, 1.358567, -0.7740571, 0, 1, 0.1294118, 1,
-0.3084632, -0.4062198, -1.683092, 0, 1, 0.1372549, 1,
-0.307799, 1.523229, -0.8030035, 0, 1, 0.1411765, 1,
-0.307762, 1.598985, 0.6609953, 0, 1, 0.1490196, 1,
-0.3043315, -0.5216922, -3.246884, 0, 1, 0.1529412, 1,
-0.30427, 0.3577413, -0.003463675, 0, 1, 0.1607843, 1,
-0.3041386, -1.206232, -2.659456, 0, 1, 0.1647059, 1,
-0.3034298, -1.55035, -3.495233, 0, 1, 0.172549, 1,
-0.3028649, 1.420026, 0.2691637, 0, 1, 0.1764706, 1,
-0.300275, -0.2134812, -2.21572, 0, 1, 0.1843137, 1,
-0.2997604, 0.001307414, -0.9753709, 0, 1, 0.1882353, 1,
-0.2977613, 0.7338375, 0.9315609, 0, 1, 0.1960784, 1,
-0.2937475, 0.799082, 0.9052418, 0, 1, 0.2039216, 1,
-0.2921796, 0.3444584, -0.6256714, 0, 1, 0.2078431, 1,
-0.2913404, -1.441172, -3.829722, 0, 1, 0.2156863, 1,
-0.2907242, 1.169487, 2.98064, 0, 1, 0.2196078, 1,
-0.286315, -0.4868897, -1.803021, 0, 1, 0.227451, 1,
-0.2856649, 0.8566772, 0.5455559, 0, 1, 0.2313726, 1,
-0.2854483, -0.01543575, -0.3783078, 0, 1, 0.2392157, 1,
-0.2820063, -1.422545, -3.235758, 0, 1, 0.2431373, 1,
-0.2819339, 0.9494586, -0.9088241, 0, 1, 0.2509804, 1,
-0.2812654, -1.53349, -4.584078, 0, 1, 0.254902, 1,
-0.2794019, 0.9463432, -0.5556579, 0, 1, 0.2627451, 1,
-0.2784705, 0.4841062, 0.004492058, 0, 1, 0.2666667, 1,
-0.2749587, -0.2754103, -2.078558, 0, 1, 0.2745098, 1,
-0.2739497, 0.3024262, -1.582764, 0, 1, 0.2784314, 1,
-0.273205, -0.7215303, -3.900345, 0, 1, 0.2862745, 1,
-0.2727672, 1.531326, -2.371166, 0, 1, 0.2901961, 1,
-0.2712461, 0.2770935, -0.5480916, 0, 1, 0.2980392, 1,
-0.2710295, 0.5292598, -1.335198, 0, 1, 0.3058824, 1,
-0.2689829, 1.08915, -1.6062, 0, 1, 0.3098039, 1,
-0.2679296, 0.4173143, -0.9221023, 0, 1, 0.3176471, 1,
-0.2665547, 0.679379, -0.1647917, 0, 1, 0.3215686, 1,
-0.2657914, 0.4036467, -0.2415394, 0, 1, 0.3294118, 1,
-0.264786, -0.8053325, -3.413281, 0, 1, 0.3333333, 1,
-0.2640747, 2.240438, -1.035778, 0, 1, 0.3411765, 1,
-0.2621236, -0.2457142, -2.837295, 0, 1, 0.345098, 1,
-0.2592355, -1.059416, -2.548272, 0, 1, 0.3529412, 1,
-0.2563737, 0.8214663, -1.526068, 0, 1, 0.3568628, 1,
-0.25619, -0.01377511, -1.438052, 0, 1, 0.3647059, 1,
-0.2519079, -1.420677, -2.971322, 0, 1, 0.3686275, 1,
-0.2507148, 1.205523, 2.293251, 0, 1, 0.3764706, 1,
-0.249795, -0.7232832, -3.062775, 0, 1, 0.3803922, 1,
-0.249179, 0.2805049, -1.497122, 0, 1, 0.3882353, 1,
-0.2486505, 0.5169426, -0.5709882, 0, 1, 0.3921569, 1,
-0.2393184, -0.5458128, -3.234247, 0, 1, 0.4, 1,
-0.2377017, -0.1878588, -2.049366, 0, 1, 0.4078431, 1,
-0.236037, -0.3495224, -2.928193, 0, 1, 0.4117647, 1,
-0.2329645, -0.3602509, -1.693664, 0, 1, 0.4196078, 1,
-0.2323346, 0.5556938, -0.8597352, 0, 1, 0.4235294, 1,
-0.2307088, 0.404337, 0.8521549, 0, 1, 0.4313726, 1,
-0.2293841, -0.4880027, -0.6946343, 0, 1, 0.4352941, 1,
-0.2283979, -0.4259081, -2.856465, 0, 1, 0.4431373, 1,
-0.2280475, 0.4917105, 0.1478454, 0, 1, 0.4470588, 1,
-0.2250922, 1.566433, 0.2544758, 0, 1, 0.454902, 1,
-0.2236327, -0.03124906, -1.942929, 0, 1, 0.4588235, 1,
-0.2225789, -0.3664958, -3.038119, 0, 1, 0.4666667, 1,
-0.2218527, -0.2623969, -2.141243, 0, 1, 0.4705882, 1,
-0.2101184, 0.4339881, -0.09068645, 0, 1, 0.4784314, 1,
-0.2084762, -0.197906, -3.447308, 0, 1, 0.4823529, 1,
-0.2070843, -0.7036861, -2.977742, 0, 1, 0.4901961, 1,
-0.2062426, 0.3988289, -0.9408984, 0, 1, 0.4941176, 1,
-0.2044263, -0.886543, -1.961216, 0, 1, 0.5019608, 1,
-0.1973684, 0.09557843, 0.09081414, 0, 1, 0.509804, 1,
-0.19645, 0.603118, -0.3280777, 0, 1, 0.5137255, 1,
-0.194724, 0.6069301, -0.3901301, 0, 1, 0.5215687, 1,
-0.1851546, -0.442473, -2.892695, 0, 1, 0.5254902, 1,
-0.1841188, -1.528546, -2.337413, 0, 1, 0.5333334, 1,
-0.182373, -0.54242, -4.139299, 0, 1, 0.5372549, 1,
-0.1815468, -0.3308196, -2.186628, 0, 1, 0.5450981, 1,
-0.1807934, 0.4401066, 0.1195363, 0, 1, 0.5490196, 1,
-0.1726991, 1.9716, -1.02214, 0, 1, 0.5568628, 1,
-0.1713734, 0.1542844, 0.05323689, 0, 1, 0.5607843, 1,
-0.1709644, 0.7503337, -1.057051, 0, 1, 0.5686275, 1,
-0.1706656, 0.6862205, 0.823897, 0, 1, 0.572549, 1,
-0.1702229, -1.729338, -2.32535, 0, 1, 0.5803922, 1,
-0.1656424, 0.2191331, 0.4626215, 0, 1, 0.5843138, 1,
-0.1646147, 0.856267, -0.3586294, 0, 1, 0.5921569, 1,
-0.1579844, -1.539305, -1.234869, 0, 1, 0.5960785, 1,
-0.156093, 1.437998, -1.521587, 0, 1, 0.6039216, 1,
-0.1532752, 0.6223954, -0.6193114, 0, 1, 0.6117647, 1,
-0.1442406, -1.103909, -2.917981, 0, 1, 0.6156863, 1,
-0.1435708, -1.777147, -1.279366, 0, 1, 0.6235294, 1,
-0.1411108, 0.5145457, -0.2565565, 0, 1, 0.627451, 1,
-0.1336041, -0.9985034, -2.997276, 0, 1, 0.6352941, 1,
-0.1285673, -1.114483, -2.71805, 0, 1, 0.6392157, 1,
-0.123907, 0.7911258, -0.1029826, 0, 1, 0.6470588, 1,
-0.1238574, -1.756395, -4.384799, 0, 1, 0.6509804, 1,
-0.1226524, 2.330639, -0.3485443, 0, 1, 0.6588235, 1,
-0.1209679, 0.2671615, -1.168136, 0, 1, 0.6627451, 1,
-0.1188178, -0.01632873, -0.8616048, 0, 1, 0.6705883, 1,
-0.1168607, 2.257443, 0.4166878, 0, 1, 0.6745098, 1,
-0.1166668, 0.1900938, -0.6055354, 0, 1, 0.682353, 1,
-0.1151062, -0.7048206, -2.989928, 0, 1, 0.6862745, 1,
-0.1145069, -1.35165, -2.831215, 0, 1, 0.6941177, 1,
-0.1123555, -1.480296, -2.35076, 0, 1, 0.7019608, 1,
-0.1078885, -0.5757682, -2.954084, 0, 1, 0.7058824, 1,
-0.1050509, 0.1404316, -3.247716, 0, 1, 0.7137255, 1,
-0.1044717, 0.5419705, -0.2674182, 0, 1, 0.7176471, 1,
-0.09952812, -0.1057493, -2.328339, 0, 1, 0.7254902, 1,
-0.09830904, 0.9047742, -1.215467, 0, 1, 0.7294118, 1,
-0.09697856, 0.06290918, -0.6724951, 0, 1, 0.7372549, 1,
-0.09273009, -0.3930959, -1.219642, 0, 1, 0.7411765, 1,
-0.08542304, -0.2714376, -4.776187, 0, 1, 0.7490196, 1,
-0.0845044, -0.964415, -2.698888, 0, 1, 0.7529412, 1,
-0.08382495, -0.7504062, -3.530387, 0, 1, 0.7607843, 1,
-0.08288661, 0.8944274, 0.5474492, 0, 1, 0.7647059, 1,
-0.08265245, -0.5186346, -2.810935, 0, 1, 0.772549, 1,
-0.08009369, 2.240022, 0.3165615, 0, 1, 0.7764706, 1,
-0.07933669, 1.051732, -0.9098939, 0, 1, 0.7843137, 1,
-0.07817879, 0.8015856, -1.327385, 0, 1, 0.7882353, 1,
-0.07524312, 1.346649, -0.8487872, 0, 1, 0.7960784, 1,
-0.07512827, 0.2654728, -1.18771, 0, 1, 0.8039216, 1,
-0.07327532, -0.8647929, -3.635769, 0, 1, 0.8078431, 1,
-0.07292721, 0.3829832, -1.915136, 0, 1, 0.8156863, 1,
-0.07040534, -0.06929806, -2.254537, 0, 1, 0.8196079, 1,
-0.06612808, -0.7556607, -2.991913, 0, 1, 0.827451, 1,
-0.06437762, 0.293995, -0.6667299, 0, 1, 0.8313726, 1,
-0.05828027, 1.77712, 0.9152493, 0, 1, 0.8392157, 1,
-0.05809669, -0.8259144, -3.733499, 0, 1, 0.8431373, 1,
-0.05014012, 0.04650157, -1.487762, 0, 1, 0.8509804, 1,
-0.04926016, 0.799697, 0.8130602, 0, 1, 0.854902, 1,
-0.04720219, -1.727568, -3.785127, 0, 1, 0.8627451, 1,
-0.04709321, 1.743866, 0.007667535, 0, 1, 0.8666667, 1,
-0.04679339, 0.254333, -0.04843057, 0, 1, 0.8745098, 1,
-0.0423058, 0.399335, -0.5503847, 0, 1, 0.8784314, 1,
-0.0377875, -0.6090564, -2.928657, 0, 1, 0.8862745, 1,
-0.03470577, 1.4536, -1.622764, 0, 1, 0.8901961, 1,
-0.03002862, 0.2471947, 0.2098472, 0, 1, 0.8980392, 1,
-0.02979947, 1.928763, -0.8236315, 0, 1, 0.9058824, 1,
-0.02882975, 0.9101086, -0.3409309, 0, 1, 0.9098039, 1,
-0.02845792, 0.3625072, 1.107374, 0, 1, 0.9176471, 1,
-0.02668471, 0.6449818, -0.01387668, 0, 1, 0.9215686, 1,
-0.02636841, 1.609377, -0.2178817, 0, 1, 0.9294118, 1,
-0.02495758, 0.4639766, -1.026103, 0, 1, 0.9333333, 1,
-0.02131358, -0.796103, -3.679971, 0, 1, 0.9411765, 1,
-0.02130762, -0.6845582, -2.639885, 0, 1, 0.945098, 1,
-0.01838555, -1.980502, -3.330281, 0, 1, 0.9529412, 1,
-0.01532622, 1.043966, 0.8064118, 0, 1, 0.9568627, 1,
-0.007000807, 0.07897997, 0.8803431, 0, 1, 0.9647059, 1,
-0.005488775, 0.194423, -0.5091181, 0, 1, 0.9686275, 1,
0.001732032, 0.02521546, 0.9485299, 0, 1, 0.9764706, 1,
0.003054071, -0.8100685, 3.275421, 0, 1, 0.9803922, 1,
0.005550445, 1.683275, -0.4159873, 0, 1, 0.9882353, 1,
0.006163105, -0.06473715, 2.866949, 0, 1, 0.9921569, 1,
0.007989479, 0.8270569, 2.382299, 0, 1, 1, 1,
0.01566157, 0.8164194, -0.7067564, 0, 0.9921569, 1, 1,
0.02470259, -1.620098, 3.661898, 0, 0.9882353, 1, 1,
0.0251896, -0.5788547, 2.657823, 0, 0.9803922, 1, 1,
0.02754689, 0.1778205, -0.5764267, 0, 0.9764706, 1, 1,
0.02988188, -1.684504, 4.183118, 0, 0.9686275, 1, 1,
0.03268439, 0.4861297, 0.7447652, 0, 0.9647059, 1, 1,
0.03384825, 0.102125, -0.3331133, 0, 0.9568627, 1, 1,
0.03460908, 1.63582, 1.054232, 0, 0.9529412, 1, 1,
0.03482532, 0.4677111, 0.9944032, 0, 0.945098, 1, 1,
0.03884328, -0.7256369, 3.570284, 0, 0.9411765, 1, 1,
0.04558767, -0.3866192, 1.501879, 0, 0.9333333, 1, 1,
0.04927382, 1.351789, 0.3815402, 0, 0.9294118, 1, 1,
0.05012808, 0.4684277, 0.4793856, 0, 0.9215686, 1, 1,
0.05315374, 1.305051, -1.337876, 0, 0.9176471, 1, 1,
0.05839893, -0.6046275, 5.704878, 0, 0.9098039, 1, 1,
0.05879255, 0.3075698, 0.7549939, 0, 0.9058824, 1, 1,
0.06026256, -1.302334, 2.005041, 0, 0.8980392, 1, 1,
0.06266519, 0.04372392, 1.123911, 0, 0.8901961, 1, 1,
0.0629107, 1.445001, -0.6963552, 0, 0.8862745, 1, 1,
0.06749032, 0.5616146, 0.376611, 0, 0.8784314, 1, 1,
0.07031687, 0.04480901, 1.350827, 0, 0.8745098, 1, 1,
0.07193156, 0.2008801, 1.439374, 0, 0.8666667, 1, 1,
0.07618004, 2.705167, 0.5018277, 0, 0.8627451, 1, 1,
0.07743635, 0.120269, 0.2235556, 0, 0.854902, 1, 1,
0.07817283, -0.9845947, 3.166939, 0, 0.8509804, 1, 1,
0.07905279, -1.578043, 2.92947, 0, 0.8431373, 1, 1,
0.08128041, 0.42992, -0.7594283, 0, 0.8392157, 1, 1,
0.08159368, 0.8920148, -0.4506997, 0, 0.8313726, 1, 1,
0.08382095, 0.6956286, -1.494623, 0, 0.827451, 1, 1,
0.08410622, 0.1861019, 0.5615367, 0, 0.8196079, 1, 1,
0.08510426, 0.8527427, -0.2080622, 0, 0.8156863, 1, 1,
0.08516089, 0.5978723, -0.2767338, 0, 0.8078431, 1, 1,
0.08608825, 1.156117, -1.250279, 0, 0.8039216, 1, 1,
0.08818778, 1.217257, 0.1949095, 0, 0.7960784, 1, 1,
0.08878241, -0.9808167, 4.455336, 0, 0.7882353, 1, 1,
0.09078617, 0.7973141, 0.650546, 0, 0.7843137, 1, 1,
0.09420086, -0.396856, 1.479153, 0, 0.7764706, 1, 1,
0.09988318, 1.024682, 0.5490979, 0, 0.772549, 1, 1,
0.1032277, -0.05829086, 2.709972, 0, 0.7647059, 1, 1,
0.1035974, -0.02218613, 2.870642, 0, 0.7607843, 1, 1,
0.1072951, -1.156057, 3.38912, 0, 0.7529412, 1, 1,
0.1086662, -0.2257768, 1.573983, 0, 0.7490196, 1, 1,
0.1105582, 0.9248577, 2.193229, 0, 0.7411765, 1, 1,
0.1231766, -0.6880212, 2.640018, 0, 0.7372549, 1, 1,
0.1257713, -0.4092264, 3.291398, 0, 0.7294118, 1, 1,
0.1281743, 0.4768128, -0.2167549, 0, 0.7254902, 1, 1,
0.1284754, 0.4082764, 0.5264688, 0, 0.7176471, 1, 1,
0.129233, -1.835472, 2.104685, 0, 0.7137255, 1, 1,
0.1329934, -1.027854, 4.916925, 0, 0.7058824, 1, 1,
0.1368001, -0.15738, 1.182784, 0, 0.6980392, 1, 1,
0.138423, -2.835298, 4.157043, 0, 0.6941177, 1, 1,
0.1402146, 0.9882026, 0.2383925, 0, 0.6862745, 1, 1,
0.1412562, 0.5368115, -2.47747, 0, 0.682353, 1, 1,
0.1413262, -1.569624, 3.971792, 0, 0.6745098, 1, 1,
0.1470824, 0.4043066, 1.25233, 0, 0.6705883, 1, 1,
0.1482337, -1.155585, 2.430665, 0, 0.6627451, 1, 1,
0.1515421, -3.056741, 4.047021, 0, 0.6588235, 1, 1,
0.1538566, -2.398532, 2.601247, 0, 0.6509804, 1, 1,
0.1548092, 0.2642518, 0.2864489, 0, 0.6470588, 1, 1,
0.1548364, -1.519866, 1.998133, 0, 0.6392157, 1, 1,
0.1552005, -0.986137, 2.028696, 0, 0.6352941, 1, 1,
0.1603931, 1.329743, 0.4862515, 0, 0.627451, 1, 1,
0.1616211, -0.6024811, 0.6585965, 0, 0.6235294, 1, 1,
0.1622804, 0.8165132, -0.3562662, 0, 0.6156863, 1, 1,
0.1632642, 1.454792, 1.604397, 0, 0.6117647, 1, 1,
0.1655629, -0.2973261, 3.665543, 0, 0.6039216, 1, 1,
0.1666919, -1.453616, 2.080055, 0, 0.5960785, 1, 1,
0.1687076, -1.592716, 1.912823, 0, 0.5921569, 1, 1,
0.1710791, -0.316625, 3.67425, 0, 0.5843138, 1, 1,
0.1749173, -1.919526, 3.886391, 0, 0.5803922, 1, 1,
0.1761321, 1.897171, 1.246213, 0, 0.572549, 1, 1,
0.1788072, -0.8385113, 1.465691, 0, 0.5686275, 1, 1,
0.1793463, 1.92888, 0.3609746, 0, 0.5607843, 1, 1,
0.1858307, -1.237167, 3.817042, 0, 0.5568628, 1, 1,
0.1872732, -1.027958, 2.377077, 0, 0.5490196, 1, 1,
0.1914057, 0.2539831, 0.307067, 0, 0.5450981, 1, 1,
0.1954414, 0.4102482, -1.43514, 0, 0.5372549, 1, 1,
0.1982189, 1.392672, 0.4743344, 0, 0.5333334, 1, 1,
0.1996614, -0.08581244, 0.9258562, 0, 0.5254902, 1, 1,
0.1996625, 0.6704803, -0.217952, 0, 0.5215687, 1, 1,
0.2017859, 0.4278112, -0.3221352, 0, 0.5137255, 1, 1,
0.2017944, -0.3888083, 2.125895, 0, 0.509804, 1, 1,
0.2027475, -0.2251707, 2.53117, 0, 0.5019608, 1, 1,
0.2032617, -0.5874535, 1.889115, 0, 0.4941176, 1, 1,
0.2033893, 0.5144014, 0.7431959, 0, 0.4901961, 1, 1,
0.2051164, 0.2617149, 0.6325812, 0, 0.4823529, 1, 1,
0.2055547, -0.1089723, 1.682711, 0, 0.4784314, 1, 1,
0.2109779, 0.06404873, -0.01071403, 0, 0.4705882, 1, 1,
0.2134234, 3.108783, -0.6090488, 0, 0.4666667, 1, 1,
0.2138396, 0.9046142, 1.526597, 0, 0.4588235, 1, 1,
0.2153986, 0.124587, 1.663553, 0, 0.454902, 1, 1,
0.2165281, -0.5766486, 3.653835, 0, 0.4470588, 1, 1,
0.2170132, -0.206558, 0.7748242, 0, 0.4431373, 1, 1,
0.2178971, -0.917956, 3.024871, 0, 0.4352941, 1, 1,
0.2210761, 0.1125741, 3.167883, 0, 0.4313726, 1, 1,
0.2238512, 0.7349466, 1.104957, 0, 0.4235294, 1, 1,
0.2241181, 0.6870887, 0.8756725, 0, 0.4196078, 1, 1,
0.2251308, -0.4935886, 3.292602, 0, 0.4117647, 1, 1,
0.2254513, 0.5369241, 0.4587617, 0, 0.4078431, 1, 1,
0.2282108, 0.4790015, 1.547871, 0, 0.4, 1, 1,
0.2297002, 1.21253, 0.244768, 0, 0.3921569, 1, 1,
0.233046, -0.2039533, 2.291664, 0, 0.3882353, 1, 1,
0.2361907, -2.038533, 4.582877, 0, 0.3803922, 1, 1,
0.2363574, -0.7896405, 1.335955, 0, 0.3764706, 1, 1,
0.238845, 0.9997298, 0.6956644, 0, 0.3686275, 1, 1,
0.2421178, 0.02568619, -0.3909594, 0, 0.3647059, 1, 1,
0.2426726, -0.899069, 3.229523, 0, 0.3568628, 1, 1,
0.2447323, 0.1448005, 0.1877111, 0, 0.3529412, 1, 1,
0.2451363, -0.08755878, 0.4243656, 0, 0.345098, 1, 1,
0.2476416, -0.01018089, 2.064896, 0, 0.3411765, 1, 1,
0.2503246, 0.02268755, 2.948967, 0, 0.3333333, 1, 1,
0.2536337, 0.5527679, -0.5155157, 0, 0.3294118, 1, 1,
0.2541173, -0.3105242, 1.959396, 0, 0.3215686, 1, 1,
0.255068, -0.1262899, 0.7603186, 0, 0.3176471, 1, 1,
0.2578337, -1.283177, 2.394414, 0, 0.3098039, 1, 1,
0.2585225, 1.93696, 0.2142721, 0, 0.3058824, 1, 1,
0.2603207, -0.5957376, 1.124525, 0, 0.2980392, 1, 1,
0.2620069, 0.1169419, 1.40254, 0, 0.2901961, 1, 1,
0.2621357, 0.7085848, 0.4987811, 0, 0.2862745, 1, 1,
0.2624296, 1.491403, -1.378412, 0, 0.2784314, 1, 1,
0.2678163, 0.1648939, 1.902549, 0, 0.2745098, 1, 1,
0.2685248, 0.05763768, 2.733151, 0, 0.2666667, 1, 1,
0.2831856, 0.3327944, 0.1880126, 0, 0.2627451, 1, 1,
0.2833546, 1.156929, -0.5191916, 0, 0.254902, 1, 1,
0.2847583, -0.05408616, 1.754417, 0, 0.2509804, 1, 1,
0.2848681, -0.2278457, 2.794724, 0, 0.2431373, 1, 1,
0.2853774, 0.5377287, -0.8148593, 0, 0.2392157, 1, 1,
0.2903908, 1.978878, -1.806772, 0, 0.2313726, 1, 1,
0.294043, -1.088967, 3.636444, 0, 0.227451, 1, 1,
0.294965, -1.790798, 4.776362, 0, 0.2196078, 1, 1,
0.2973131, -0.6216363, 2.878078, 0, 0.2156863, 1, 1,
0.2983435, -0.8575671, 2.125532, 0, 0.2078431, 1, 1,
0.3015853, 0.5368856, 1.578107, 0, 0.2039216, 1, 1,
0.3039885, -0.7767477, 2.318946, 0, 0.1960784, 1, 1,
0.3041887, -0.08361133, 2.984303, 0, 0.1882353, 1, 1,
0.309523, 0.2987483, -1.568999, 0, 0.1843137, 1, 1,
0.3168133, 0.4932672, 1.508279, 0, 0.1764706, 1, 1,
0.320806, -0.077325, 4.519984, 0, 0.172549, 1, 1,
0.3240845, -0.6462236, 3.73419, 0, 0.1647059, 1, 1,
0.3249671, 0.4691656, -0.03461712, 0, 0.1607843, 1, 1,
0.3250005, 0.456099, 0.7341902, 0, 0.1529412, 1, 1,
0.3286571, -0.02459935, 1.681718, 0, 0.1490196, 1, 1,
0.3305235, 0.2666991, 0.2851647, 0, 0.1411765, 1, 1,
0.3308331, -1.285179, 4.023694, 0, 0.1372549, 1, 1,
0.3322949, 0.751225, 0.6775108, 0, 0.1294118, 1, 1,
0.3416929, -1.002136, 4.555407, 0, 0.1254902, 1, 1,
0.3522238, -1.668606, 3.712173, 0, 0.1176471, 1, 1,
0.3621906, 0.3766042, 1.30273, 0, 0.1137255, 1, 1,
0.3647618, 1.454055, -0.2056894, 0, 0.1058824, 1, 1,
0.3652732, -2.284905, 1.409071, 0, 0.09803922, 1, 1,
0.3722825, 0.6525042, 0.254802, 0, 0.09411765, 1, 1,
0.3743027, -0.105871, 3.131709, 0, 0.08627451, 1, 1,
0.376912, 0.5418649, -1.369495, 0, 0.08235294, 1, 1,
0.3793677, -0.7135245, 2.348843, 0, 0.07450981, 1, 1,
0.3802346, 0.5046288, 0.6780072, 0, 0.07058824, 1, 1,
0.391648, -0.4152578, 3.560276, 0, 0.0627451, 1, 1,
0.3970592, 0.6610282, 0.9715573, 0, 0.05882353, 1, 1,
0.3997694, -0.07865531, 1.938271, 0, 0.05098039, 1, 1,
0.4003854, 0.09070554, 1.186767, 0, 0.04705882, 1, 1,
0.4016064, 0.8191739, -0.6238193, 0, 0.03921569, 1, 1,
0.4062003, 1.433718, 0.3130925, 0, 0.03529412, 1, 1,
0.4079749, 0.1343441, 0.4265923, 0, 0.02745098, 1, 1,
0.4113618, -0.9789286, 0.9055182, 0, 0.02352941, 1, 1,
0.4117103, 0.2030337, 1.180805, 0, 0.01568628, 1, 1,
0.4134487, -1.624085, 3.820718, 0, 0.01176471, 1, 1,
0.4137248, 2.482687, -2.799304, 0, 0.003921569, 1, 1,
0.4141483, 1.492874, -0.6911614, 0.003921569, 0, 1, 1,
0.4228019, -0.6040783, 4.449235, 0.007843138, 0, 1, 1,
0.4248992, 0.4845078, 0.348312, 0.01568628, 0, 1, 1,
0.4250661, -0.4618562, 2.886481, 0.01960784, 0, 1, 1,
0.4269332, -2.406343, 3.292842, 0.02745098, 0, 1, 1,
0.4295901, 1.139949, 0.3821799, 0.03137255, 0, 1, 1,
0.4304559, 0.3925095, 0.7756, 0.03921569, 0, 1, 1,
0.4308017, 1.105175, 0.3948664, 0.04313726, 0, 1, 1,
0.4348069, 0.5653742, -0.9795822, 0.05098039, 0, 1, 1,
0.4453653, 1.15039, 1.078746, 0.05490196, 0, 1, 1,
0.450217, -0.7988108, 5.415435, 0.0627451, 0, 1, 1,
0.4507248, 1.027337, 0.315984, 0.06666667, 0, 1, 1,
0.4511659, 0.4405403, 1.158288, 0.07450981, 0, 1, 1,
0.4518267, -0.3030224, 0.3346116, 0.07843138, 0, 1, 1,
0.4530225, 0.5846756, 0.3347726, 0.08627451, 0, 1, 1,
0.4531919, 1.145731, 0.5035913, 0.09019608, 0, 1, 1,
0.4583845, -1.941711, 2.180179, 0.09803922, 0, 1, 1,
0.4659813, -0.3795116, 0.9986401, 0.1058824, 0, 1, 1,
0.470738, 0.06636089, 2.592727, 0.1098039, 0, 1, 1,
0.4778152, 0.4547806, 0.8110552, 0.1176471, 0, 1, 1,
0.4822635, 0.05967645, 2.088964, 0.1215686, 0, 1, 1,
0.4851032, 1.065996, -0.7362039, 0.1294118, 0, 1, 1,
0.4857865, -1.281794, 2.986185, 0.1333333, 0, 1, 1,
0.4947635, 1.93066, 0.3700506, 0.1411765, 0, 1, 1,
0.5037978, 0.3835981, 0.543804, 0.145098, 0, 1, 1,
0.5083916, -1.527787, 2.193992, 0.1529412, 0, 1, 1,
0.512997, 0.5096704, 0.572324, 0.1568628, 0, 1, 1,
0.5138283, 0.07108083, 1.346644, 0.1647059, 0, 1, 1,
0.520506, 1.388606, -0.9310194, 0.1686275, 0, 1, 1,
0.5221305, -1.572457, 2.332242, 0.1764706, 0, 1, 1,
0.5275381, -0.1183688, 1.515337, 0.1803922, 0, 1, 1,
0.5334365, -0.8857753, 3.299843, 0.1882353, 0, 1, 1,
0.5345445, -0.8694858, 4.337197, 0.1921569, 0, 1, 1,
0.5464816, 0.7455707, -0.6617499, 0.2, 0, 1, 1,
0.5464816, 2.02336, 0.1383765, 0.2078431, 0, 1, 1,
0.5533668, -0.1434074, 2.850969, 0.2117647, 0, 1, 1,
0.5654002, 0.9888026, -0.392518, 0.2196078, 0, 1, 1,
0.5667904, 1.257008, 2.252866, 0.2235294, 0, 1, 1,
0.5769412, -1.670922, 2.282704, 0.2313726, 0, 1, 1,
0.5805985, -0.1217006, 3.975004, 0.2352941, 0, 1, 1,
0.5836918, -0.5688698, 2.619906, 0.2431373, 0, 1, 1,
0.5843916, 0.3552258, 0.8986356, 0.2470588, 0, 1, 1,
0.5886042, -0.3092932, 1.961651, 0.254902, 0, 1, 1,
0.5998236, -0.7556185, 3.123249, 0.2588235, 0, 1, 1,
0.6020627, -0.7988714, 2.898338, 0.2666667, 0, 1, 1,
0.6050031, 0.8622967, 0.9978708, 0.2705882, 0, 1, 1,
0.6055813, -0.6962193, 2.90501, 0.2784314, 0, 1, 1,
0.6066285, -1.464665, 3.066968, 0.282353, 0, 1, 1,
0.608371, -1.158658, 2.280943, 0.2901961, 0, 1, 1,
0.6084656, -1.724239, 2.730019, 0.2941177, 0, 1, 1,
0.609899, 0.9627458, 0.1808977, 0.3019608, 0, 1, 1,
0.6172773, -0.03701202, 0.4860411, 0.3098039, 0, 1, 1,
0.6180829, 0.320195, 0.2718683, 0.3137255, 0, 1, 1,
0.6252659, 0.1118785, 2.781572, 0.3215686, 0, 1, 1,
0.6302084, 0.1126483, 0.6958777, 0.3254902, 0, 1, 1,
0.6393739, -2.154688, 3.628907, 0.3333333, 0, 1, 1,
0.6396724, -1.242826, 3.259191, 0.3372549, 0, 1, 1,
0.6410376, -0.5662295, 1.556185, 0.345098, 0, 1, 1,
0.6452452, -1.148368, 1.228825, 0.3490196, 0, 1, 1,
0.6495035, 0.139816, 1.3178, 0.3568628, 0, 1, 1,
0.6630893, -0.07769048, 1.741076, 0.3607843, 0, 1, 1,
0.6699921, 0.06756689, 0.585097, 0.3686275, 0, 1, 1,
0.6750222, 1.177132, 1.203952, 0.372549, 0, 1, 1,
0.6776069, -0.3473402, 2.14056, 0.3803922, 0, 1, 1,
0.6785108, -0.4636033, 2.165176, 0.3843137, 0, 1, 1,
0.6808048, -0.2809255, 2.251631, 0.3921569, 0, 1, 1,
0.6833499, 1.85226, -0.7898593, 0.3960784, 0, 1, 1,
0.6851931, -2.792669, 4.413958, 0.4039216, 0, 1, 1,
0.6912232, -1.534811, 5.102456, 0.4117647, 0, 1, 1,
0.692663, 0.5390208, 3.1348, 0.4156863, 0, 1, 1,
0.6932331, -0.7021337, 2.735915, 0.4235294, 0, 1, 1,
0.6937497, 1.728213, 0.3099791, 0.427451, 0, 1, 1,
0.6990271, 0.5802196, 1.617049, 0.4352941, 0, 1, 1,
0.7018014, 1.741345, 0.1645738, 0.4392157, 0, 1, 1,
0.7057412, -1.841398, 1.130776, 0.4470588, 0, 1, 1,
0.7088493, 0.4669152, 0.3826329, 0.4509804, 0, 1, 1,
0.7098699, 0.6651865, 2.401353, 0.4588235, 0, 1, 1,
0.7117424, 0.3494015, 1.766611, 0.4627451, 0, 1, 1,
0.7117602, -0.1637216, 2.317297, 0.4705882, 0, 1, 1,
0.7209727, -0.5335912, 0.9839673, 0.4745098, 0, 1, 1,
0.7284661, 0.06227831, 2.658537, 0.4823529, 0, 1, 1,
0.7326564, 1.159804, 1.665943, 0.4862745, 0, 1, 1,
0.7351401, -1.02321, 1.196826, 0.4941176, 0, 1, 1,
0.7381526, -0.330837, 1.850155, 0.5019608, 0, 1, 1,
0.7386854, 1.119778, 0.4352322, 0.5058824, 0, 1, 1,
0.7407702, -0.940965, 2.246639, 0.5137255, 0, 1, 1,
0.7424365, -2.532906, 0.7093571, 0.5176471, 0, 1, 1,
0.7434421, 0.9653238, -1.016129, 0.5254902, 0, 1, 1,
0.7454097, 1.288197, 0.2738694, 0.5294118, 0, 1, 1,
0.7482894, 1.1054, 1.803707, 0.5372549, 0, 1, 1,
0.7540182, 0.1456424, 3.119797, 0.5411765, 0, 1, 1,
0.7550808, 0.7718978, 1.764694, 0.5490196, 0, 1, 1,
0.7551816, 0.0292031, 1.553068, 0.5529412, 0, 1, 1,
0.7566485, -0.2658451, 1.546446, 0.5607843, 0, 1, 1,
0.7591494, 0.1859128, -1.184326, 0.5647059, 0, 1, 1,
0.767084, -1.75545, 1.524533, 0.572549, 0, 1, 1,
0.7690883, -0.8954471, 2.997449, 0.5764706, 0, 1, 1,
0.7707705, -0.5891978, 1.174394, 0.5843138, 0, 1, 1,
0.7721348, -0.5632155, 2.54261, 0.5882353, 0, 1, 1,
0.7758896, -2.061973, 3.276633, 0.5960785, 0, 1, 1,
0.7766825, -0.8816416, 0.6850731, 0.6039216, 0, 1, 1,
0.7770803, 0.9054553, 1.56762, 0.6078432, 0, 1, 1,
0.7781848, -0.9602267, 2.701718, 0.6156863, 0, 1, 1,
0.7837532, -1.754662, 1.672577, 0.6196079, 0, 1, 1,
0.785212, -0.1341064, 2.922498, 0.627451, 0, 1, 1,
0.7947341, -0.2220138, 2.439138, 0.6313726, 0, 1, 1,
0.7950028, -1.710593, 2.588816, 0.6392157, 0, 1, 1,
0.7951451, -0.3044637, 2.806089, 0.6431373, 0, 1, 1,
0.7973123, -0.5719175, 2.977382, 0.6509804, 0, 1, 1,
0.8098315, 0.2699577, 1.282692, 0.654902, 0, 1, 1,
0.8128538, -1.28472, 4.150165, 0.6627451, 0, 1, 1,
0.8168439, -0.04737276, 2.80364, 0.6666667, 0, 1, 1,
0.8244873, -0.7241064, 1.792109, 0.6745098, 0, 1, 1,
0.8273308, 1.086797, 0.607347, 0.6784314, 0, 1, 1,
0.8320184, -0.1863783, 2.9771, 0.6862745, 0, 1, 1,
0.8464608, -0.3451202, 2.933068, 0.6901961, 0, 1, 1,
0.8536221, -0.1272247, 2.606223, 0.6980392, 0, 1, 1,
0.8579724, -0.2189288, 2.110885, 0.7058824, 0, 1, 1,
0.8591557, -0.3864239, 3.303762, 0.7098039, 0, 1, 1,
0.8595873, -0.8375462, 1.586459, 0.7176471, 0, 1, 1,
0.8634676, -0.04682466, 0.6359015, 0.7215686, 0, 1, 1,
0.8645995, 0.3677727, -0.1199345, 0.7294118, 0, 1, 1,
0.8656735, -0.313291, 0.3164248, 0.7333333, 0, 1, 1,
0.8667231, -1.181147, 2.088729, 0.7411765, 0, 1, 1,
0.8676901, 1.112461, 1.877058, 0.7450981, 0, 1, 1,
0.8708526, 0.7597485, 1.109749, 0.7529412, 0, 1, 1,
0.8724909, -0.3208442, 1.449328, 0.7568628, 0, 1, 1,
0.8725069, 0.2633988, -0.1063436, 0.7647059, 0, 1, 1,
0.8763797, 2.674278, -0.3824819, 0.7686275, 0, 1, 1,
0.8779782, -0.4874163, 1.97777, 0.7764706, 0, 1, 1,
0.8813569, -0.2795957, 1.831286, 0.7803922, 0, 1, 1,
0.8867425, 0.2656368, 0.5026816, 0.7882353, 0, 1, 1,
0.8874686, 0.6048459, 1.046516, 0.7921569, 0, 1, 1,
0.8904756, 0.397827, 0.4976569, 0.8, 0, 1, 1,
0.8920885, 0.2055687, 2.878571, 0.8078431, 0, 1, 1,
0.8935551, 0.9186387, 1.115503, 0.8117647, 0, 1, 1,
0.8936763, -1.920055, 3.780762, 0.8196079, 0, 1, 1,
0.8948283, -1.668052, 1.829511, 0.8235294, 0, 1, 1,
0.903337, 0.5861043, 1.377674, 0.8313726, 0, 1, 1,
0.9039454, -0.1188173, 1.367549, 0.8352941, 0, 1, 1,
0.9049642, 0.4728525, -1.08748, 0.8431373, 0, 1, 1,
0.9095561, -1.361114, 3.630414, 0.8470588, 0, 1, 1,
0.9116399, -0.233273, 2.521328, 0.854902, 0, 1, 1,
0.9124344, 0.1320278, 3.502279, 0.8588235, 0, 1, 1,
0.9228592, -0.4470865, 1.161436, 0.8666667, 0, 1, 1,
0.924397, 0.8365229, 0.8864351, 0.8705882, 0, 1, 1,
0.9251643, 0.9003093, -0.2083218, 0.8784314, 0, 1, 1,
0.9275412, 0.1376498, 0.3372142, 0.8823529, 0, 1, 1,
0.9371098, -0.4107273, 0.7434148, 0.8901961, 0, 1, 1,
0.9386889, -0.2449169, 2.64258, 0.8941177, 0, 1, 1,
0.9451746, -1.073617, 3.643615, 0.9019608, 0, 1, 1,
0.9497964, 0.8185865, 0.9638181, 0.9098039, 0, 1, 1,
0.954957, 0.2699742, -0.3044544, 0.9137255, 0, 1, 1,
0.9725671, 1.582742, 0.1041538, 0.9215686, 0, 1, 1,
0.9737185, -0.2952948, 0.9407176, 0.9254902, 0, 1, 1,
0.9778082, 0.4300554, 0.8925907, 0.9333333, 0, 1, 1,
0.9802356, 0.2747146, 1.3523, 0.9372549, 0, 1, 1,
0.9810306, -1.45174, 3.432467, 0.945098, 0, 1, 1,
0.9863474, 0.9684103, 0.3743922, 0.9490196, 0, 1, 1,
0.9911615, 0.6838465, -0.1369347, 0.9568627, 0, 1, 1,
0.9949695, 1.3798, 0.486075, 0.9607843, 0, 1, 1,
0.9950496, -0.2284889, 1.191233, 0.9686275, 0, 1, 1,
0.9985659, 0.1319209, 3.049763, 0.972549, 0, 1, 1,
0.9989158, 0.09721067, 2.659244, 0.9803922, 0, 1, 1,
1.010126, 0.991513, -0.1749975, 0.9843137, 0, 1, 1,
1.011024, -0.5149521, 2.284302, 0.9921569, 0, 1, 1,
1.033442, -0.1858268, 1.984574, 0.9960784, 0, 1, 1,
1.034834, -1.814315, 3.51531, 1, 0, 0.9960784, 1,
1.054123, 0.9208542, 0.2545604, 1, 0, 0.9882353, 1,
1.055753, -0.0215275, 1.966421, 1, 0, 0.9843137, 1,
1.058748, -0.574598, 2.561502, 1, 0, 0.9764706, 1,
1.059332, -0.802668, 2.711637, 1, 0, 0.972549, 1,
1.059737, 0.6486806, 1.685138, 1, 0, 0.9647059, 1,
1.071176, 1.243046, 0.6066157, 1, 0, 0.9607843, 1,
1.07545, 0.209545, -0.4657805, 1, 0, 0.9529412, 1,
1.076336, 1.655522, 0.6972946, 1, 0, 0.9490196, 1,
1.079843, 0.7986742, 1.649276, 1, 0, 0.9411765, 1,
1.08443, -0.0374734, 2.537409, 1, 0, 0.9372549, 1,
1.090615, 0.04415328, 1.371258, 1, 0, 0.9294118, 1,
1.091008, -0.861101, 2.611663, 1, 0, 0.9254902, 1,
1.093147, 0.9665625, 0.3945266, 1, 0, 0.9176471, 1,
1.093436, 2.2805, -0.173355, 1, 0, 0.9137255, 1,
1.101095, 1.399719, 1.231287, 1, 0, 0.9058824, 1,
1.104947, 0.232207, 0.6339926, 1, 0, 0.9019608, 1,
1.105484, -0.6913148, 1.426172, 1, 0, 0.8941177, 1,
1.106428, 0.5014048, 1.27218, 1, 0, 0.8862745, 1,
1.10939, -1.400877, 2.860022, 1, 0, 0.8823529, 1,
1.112181, -1.359072, 1.985193, 1, 0, 0.8745098, 1,
1.112399, -1.112507, 1.682853, 1, 0, 0.8705882, 1,
1.112753, 0.4215851, 2.720703, 1, 0, 0.8627451, 1,
1.122544, -0.5573575, 2.836961, 1, 0, 0.8588235, 1,
1.123082, 1.004473, 0.3647268, 1, 0, 0.8509804, 1,
1.123952, 0.2787339, 2.028534, 1, 0, 0.8470588, 1,
1.14429, 0.6093188, 2.68516, 1, 0, 0.8392157, 1,
1.145534, -0.2028805, 1.719465, 1, 0, 0.8352941, 1,
1.147811, -1.747203, 3.503436, 1, 0, 0.827451, 1,
1.157395, -0.5106634, 2.549353, 1, 0, 0.8235294, 1,
1.158801, -0.3444483, 2.099782, 1, 0, 0.8156863, 1,
1.163171, -0.722952, 3.214961, 1, 0, 0.8117647, 1,
1.178121, -1.160184, 2.74762, 1, 0, 0.8039216, 1,
1.179527, 1.638099, 2.088068, 1, 0, 0.7960784, 1,
1.181789, 0.0999639, -0.2895674, 1, 0, 0.7921569, 1,
1.191842, 1.029881, 3.10997, 1, 0, 0.7843137, 1,
1.19352, -0.3513839, 2.240103, 1, 0, 0.7803922, 1,
1.193851, -0.94021, 2.881808, 1, 0, 0.772549, 1,
1.196343, -1.419287, 2.380537, 1, 0, 0.7686275, 1,
1.214166, 1.135515, 0.5453374, 1, 0, 0.7607843, 1,
1.217647, 1.550796, -1.095426, 1, 0, 0.7568628, 1,
1.218678, -0.3415661, 2.456941, 1, 0, 0.7490196, 1,
1.227498, 0.2990307, 0.3622519, 1, 0, 0.7450981, 1,
1.238776, -0.4409316, 1.59429, 1, 0, 0.7372549, 1,
1.24083, -1.026844, 4.05441, 1, 0, 0.7333333, 1,
1.25226, 0.3700867, 0.9490394, 1, 0, 0.7254902, 1,
1.256813, -0.9651363, 1.357859, 1, 0, 0.7215686, 1,
1.263266, -0.5947696, 1.494447, 1, 0, 0.7137255, 1,
1.264321, 1.344846, -0.2059492, 1, 0, 0.7098039, 1,
1.268721, 0.2993766, 3.146781, 1, 0, 0.7019608, 1,
1.273711, 0.2058753, 1.346419, 1, 0, 0.6941177, 1,
1.274638, 2.111451, -1.195755, 1, 0, 0.6901961, 1,
1.281789, 1.634039, 0.8489555, 1, 0, 0.682353, 1,
1.284642, -0.6226779, 3.184152, 1, 0, 0.6784314, 1,
1.298667, 1.004958, 1.498794, 1, 0, 0.6705883, 1,
1.306656, 1.07445, 0.7725623, 1, 0, 0.6666667, 1,
1.313171, 0.7598788, 1.918968, 1, 0, 0.6588235, 1,
1.313475, 0.3825586, 3.546907, 1, 0, 0.654902, 1,
1.323603, 0.0660369, -0.3459781, 1, 0, 0.6470588, 1,
1.331676, -0.7713159, 2.286291, 1, 0, 0.6431373, 1,
1.333331, 1.162209, 0.9420277, 1, 0, 0.6352941, 1,
1.337931, -0.7701305, 2.65373, 1, 0, 0.6313726, 1,
1.343023, 1.150046, -0.4284618, 1, 0, 0.6235294, 1,
1.354042, -0.4920147, 2.753438, 1, 0, 0.6196079, 1,
1.358145, 0.2638593, 0.8352659, 1, 0, 0.6117647, 1,
1.36551, 1.282562, -0.7819501, 1, 0, 0.6078432, 1,
1.375855, -0.4985681, 0.7982831, 1, 0, 0.6, 1,
1.398679, 0.6213387, 0.09393294, 1, 0, 0.5921569, 1,
1.400044, 0.04352197, 0.7838865, 1, 0, 0.5882353, 1,
1.408335, -2.276525, 2.364956, 1, 0, 0.5803922, 1,
1.429846, -0.1194255, 1.261781, 1, 0, 0.5764706, 1,
1.431182, -1.671071, 2.571099, 1, 0, 0.5686275, 1,
1.444961, -0.7107666, 1.416809, 1, 0, 0.5647059, 1,
1.453819, -0.4023519, 1.22612, 1, 0, 0.5568628, 1,
1.454785, -0.7560135, 2.323919, 1, 0, 0.5529412, 1,
1.465047, 1.557549, -0.297392, 1, 0, 0.5450981, 1,
1.474825, 0.6139295, 3.061193, 1, 0, 0.5411765, 1,
1.477858, 0.152135, 0.8404847, 1, 0, 0.5333334, 1,
1.479757, -0.8113994, 2.154591, 1, 0, 0.5294118, 1,
1.482306, -0.08087379, 1.266811, 1, 0, 0.5215687, 1,
1.485167, -0.3222537, 1.724552, 1, 0, 0.5176471, 1,
1.492567, -1.599703, 2.115847, 1, 0, 0.509804, 1,
1.508148, -0.08843569, 1.950893, 1, 0, 0.5058824, 1,
1.516063, 0.5749261, 1.239812, 1, 0, 0.4980392, 1,
1.524672, 0.02971988, -1.012007, 1, 0, 0.4901961, 1,
1.525435, 0.4860963, 1.949419, 1, 0, 0.4862745, 1,
1.535087, 1.204501, 0.8763334, 1, 0, 0.4784314, 1,
1.538656, 1.395154, 1.118132, 1, 0, 0.4745098, 1,
1.540415, -0.584245, 1.067494, 1, 0, 0.4666667, 1,
1.541374, 0.294881, 1.469699, 1, 0, 0.4627451, 1,
1.546727, 0.4429329, 1.786326, 1, 0, 0.454902, 1,
1.547933, -0.5154702, 2.144001, 1, 0, 0.4509804, 1,
1.553653, 0.6657257, 1.86777, 1, 0, 0.4431373, 1,
1.56311, 0.6058814, 2.674524, 1, 0, 0.4392157, 1,
1.578024, -0.4816859, 1.897025, 1, 0, 0.4313726, 1,
1.57862, 0.652101, 0.9769801, 1, 0, 0.427451, 1,
1.596461, -0.1057011, 1.603775, 1, 0, 0.4196078, 1,
1.606447, -1.233414, 3.253709, 1, 0, 0.4156863, 1,
1.620309, 0.2742769, 1.905316, 1, 0, 0.4078431, 1,
1.638433, -1.801092, 3.714723, 1, 0, 0.4039216, 1,
1.641061, -0.09789011, 2.915483, 1, 0, 0.3960784, 1,
1.651735, 1.158135, 0.5291774, 1, 0, 0.3882353, 1,
1.652143, -0.04564279, 0.3028777, 1, 0, 0.3843137, 1,
1.652408, -0.1276383, 0.8264461, 1, 0, 0.3764706, 1,
1.652798, -1.305443, 1.041834, 1, 0, 0.372549, 1,
1.655429, 0.4877223, 2.516414, 1, 0, 0.3647059, 1,
1.658253, 0.2825216, -0.4317392, 1, 0, 0.3607843, 1,
1.662192, -1.069796, 3.238458, 1, 0, 0.3529412, 1,
1.66514, 0.08396959, 2.563425, 1, 0, 0.3490196, 1,
1.670506, -0.5883969, 2.02473, 1, 0, 0.3411765, 1,
1.671513, 0.5371041, 1.128948, 1, 0, 0.3372549, 1,
1.681352, 0.4770449, 1.481958, 1, 0, 0.3294118, 1,
1.683882, -0.4936158, 2.940532, 1, 0, 0.3254902, 1,
1.694306, 0.7160989, 1.314167, 1, 0, 0.3176471, 1,
1.699483, -0.9340038, 2.450708, 1, 0, 0.3137255, 1,
1.703067, 0.2003064, 0.7510781, 1, 0, 0.3058824, 1,
1.712498, 0.5301705, 1.167782, 1, 0, 0.2980392, 1,
1.734433, 1.017293, 0.2674947, 1, 0, 0.2941177, 1,
1.736504, 1.163162, 0.9494621, 1, 0, 0.2862745, 1,
1.752323, -0.5951431, 0.6521761, 1, 0, 0.282353, 1,
1.758388, 0.2536864, -0.7025841, 1, 0, 0.2745098, 1,
1.765635, -1.680127, 3.413589, 1, 0, 0.2705882, 1,
1.767844, 0.002849368, 2.865017, 1, 0, 0.2627451, 1,
1.780174, -1.147559, 1.526166, 1, 0, 0.2588235, 1,
1.804549, -0.2308221, 1.604461, 1, 0, 0.2509804, 1,
1.810903, -1.232513, 3.56314, 1, 0, 0.2470588, 1,
1.834866, 0.6167338, 0.8952075, 1, 0, 0.2392157, 1,
1.850381, 0.3715084, 1.612477, 1, 0, 0.2352941, 1,
1.860874, -0.3482675, 3.265703, 1, 0, 0.227451, 1,
1.874171, -0.638217, 0.74994, 1, 0, 0.2235294, 1,
1.890629, 0.4258432, 1.483301, 1, 0, 0.2156863, 1,
1.892973, -0.6374904, 0.1265259, 1, 0, 0.2117647, 1,
1.905685, -0.1520928, 2.441117, 1, 0, 0.2039216, 1,
1.906015, -1.153245, 1.649073, 1, 0, 0.1960784, 1,
1.9317, 1.707691, 1.994589, 1, 0, 0.1921569, 1,
1.98661, 0.6832208, 0.2564302, 1, 0, 0.1843137, 1,
2.005137, 1.011201, 1.044988, 1, 0, 0.1803922, 1,
2.027309, 1.140544, 2.00759, 1, 0, 0.172549, 1,
2.059577, 1.268768, 1.834392, 1, 0, 0.1686275, 1,
2.082827, -0.6232257, 3.489806, 1, 0, 0.1607843, 1,
2.088966, 1.827812, 1.231933, 1, 0, 0.1568628, 1,
2.11734, -1.401972, 1.764023, 1, 0, 0.1490196, 1,
2.125471, 0.09619824, 0.7664376, 1, 0, 0.145098, 1,
2.128684, -0.6264402, 3.477547, 1, 0, 0.1372549, 1,
2.161782, -0.9009989, 0.1046351, 1, 0, 0.1333333, 1,
2.192959, -0.5951882, 2.275758, 1, 0, 0.1254902, 1,
2.22954, -0.2122478, 1.167553, 1, 0, 0.1215686, 1,
2.23064, -0.8285226, 2.521549, 1, 0, 0.1137255, 1,
2.234439, 0.9614756, 1.340594, 1, 0, 0.1098039, 1,
2.243229, -2.100874, 1.565277, 1, 0, 0.1019608, 1,
2.246145, -0.1578128, 3.819683, 1, 0, 0.09411765, 1,
2.269675, 2.08419, 0.5836652, 1, 0, 0.09019608, 1,
2.273193, -0.3369789, 1.781169, 1, 0, 0.08235294, 1,
2.276347, 0.3965404, 2.140726, 1, 0, 0.07843138, 1,
2.285877, 0.04953511, 1.021891, 1, 0, 0.07058824, 1,
2.341878, 1.590722, 2.041311, 1, 0, 0.06666667, 1,
2.364881, -1.205651, 2.424907, 1, 0, 0.05882353, 1,
2.365684, 0.5546881, 1.441863, 1, 0, 0.05490196, 1,
2.380068, 0.6535074, 2.271279, 1, 0, 0.04705882, 1,
2.479642, -0.2665233, 0.9613091, 1, 0, 0.04313726, 1,
2.620657, -0.8559327, 1.636955, 1, 0, 0.03529412, 1,
2.677434, 0.1136034, 1.026761, 1, 0, 0.03137255, 1,
2.85694, -0.6886308, -0.06667662, 1, 0, 0.02352941, 1,
3.011081, -1.879655, 1.091974, 1, 0, 0.01960784, 1,
3.093122, 1.302432, 2.132804, 1, 0, 0.01176471, 1,
3.302307, -0.2832279, 2.20286, 1, 0, 0.007843138, 1
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
0.1908413, -4.101797, -8.18571, 0, -0.5, 0.5, 0.5,
0.1908413, -4.101797, -8.18571, 1, -0.5, 0.5, 0.5,
0.1908413, -4.101797, -8.18571, 1, 1.5, 0.5, 0.5,
0.1908413, -4.101797, -8.18571, 0, 1.5, 0.5, 0.5
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
-3.975411, 0.02602088, -8.18571, 0, -0.5, 0.5, 0.5,
-3.975411, 0.02602088, -8.18571, 1, -0.5, 0.5, 0.5,
-3.975411, 0.02602088, -8.18571, 1, 1.5, 0.5, 0.5,
-3.975411, 0.02602088, -8.18571, 0, 1.5, 0.5, 0.5
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
-3.975411, -4.101797, -0.2338085, 0, -0.5, 0.5, 0.5,
-3.975411, -4.101797, -0.2338085, 1, -0.5, 0.5, 0.5,
-3.975411, -4.101797, -0.2338085, 1, 1.5, 0.5, 0.5,
-3.975411, -4.101797, -0.2338085, 0, 1.5, 0.5, 0.5
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
-2, -3.149224, -6.350656,
3, -3.149224, -6.350656,
-2, -3.149224, -6.350656,
-2, -3.307986, -6.656498,
-1, -3.149224, -6.350656,
-1, -3.307986, -6.656498,
0, -3.149224, -6.350656,
0, -3.307986, -6.656498,
1, -3.149224, -6.350656,
1, -3.307986, -6.656498,
2, -3.149224, -6.350656,
2, -3.307986, -6.656498,
3, -3.149224, -6.350656,
3, -3.307986, -6.656498
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
-2, -3.62551, -7.268183, 0, -0.5, 0.5, 0.5,
-2, -3.62551, -7.268183, 1, -0.5, 0.5, 0.5,
-2, -3.62551, -7.268183, 1, 1.5, 0.5, 0.5,
-2, -3.62551, -7.268183, 0, 1.5, 0.5, 0.5,
-1, -3.62551, -7.268183, 0, -0.5, 0.5, 0.5,
-1, -3.62551, -7.268183, 1, -0.5, 0.5, 0.5,
-1, -3.62551, -7.268183, 1, 1.5, 0.5, 0.5,
-1, -3.62551, -7.268183, 0, 1.5, 0.5, 0.5,
0, -3.62551, -7.268183, 0, -0.5, 0.5, 0.5,
0, -3.62551, -7.268183, 1, -0.5, 0.5, 0.5,
0, -3.62551, -7.268183, 1, 1.5, 0.5, 0.5,
0, -3.62551, -7.268183, 0, 1.5, 0.5, 0.5,
1, -3.62551, -7.268183, 0, -0.5, 0.5, 0.5,
1, -3.62551, -7.268183, 1, -0.5, 0.5, 0.5,
1, -3.62551, -7.268183, 1, 1.5, 0.5, 0.5,
1, -3.62551, -7.268183, 0, 1.5, 0.5, 0.5,
2, -3.62551, -7.268183, 0, -0.5, 0.5, 0.5,
2, -3.62551, -7.268183, 1, -0.5, 0.5, 0.5,
2, -3.62551, -7.268183, 1, 1.5, 0.5, 0.5,
2, -3.62551, -7.268183, 0, 1.5, 0.5, 0.5,
3, -3.62551, -7.268183, 0, -0.5, 0.5, 0.5,
3, -3.62551, -7.268183, 1, -0.5, 0.5, 0.5,
3, -3.62551, -7.268183, 1, 1.5, 0.5, 0.5,
3, -3.62551, -7.268183, 0, 1.5, 0.5, 0.5
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
-3.013968, -3, -6.350656,
-3.013968, 3, -6.350656,
-3.013968, -3, -6.350656,
-3.174209, -3, -6.656498,
-3.013968, -2, -6.350656,
-3.174209, -2, -6.656498,
-3.013968, -1, -6.350656,
-3.174209, -1, -6.656498,
-3.013968, 0, -6.350656,
-3.174209, 0, -6.656498,
-3.013968, 1, -6.350656,
-3.174209, 1, -6.656498,
-3.013968, 2, -6.350656,
-3.174209, 2, -6.656498,
-3.013968, 3, -6.350656,
-3.174209, 3, -6.656498
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
-3.49469, -3, -7.268183, 0, -0.5, 0.5, 0.5,
-3.49469, -3, -7.268183, 1, -0.5, 0.5, 0.5,
-3.49469, -3, -7.268183, 1, 1.5, 0.5, 0.5,
-3.49469, -3, -7.268183, 0, 1.5, 0.5, 0.5,
-3.49469, -2, -7.268183, 0, -0.5, 0.5, 0.5,
-3.49469, -2, -7.268183, 1, -0.5, 0.5, 0.5,
-3.49469, -2, -7.268183, 1, 1.5, 0.5, 0.5,
-3.49469, -2, -7.268183, 0, 1.5, 0.5, 0.5,
-3.49469, -1, -7.268183, 0, -0.5, 0.5, 0.5,
-3.49469, -1, -7.268183, 1, -0.5, 0.5, 0.5,
-3.49469, -1, -7.268183, 1, 1.5, 0.5, 0.5,
-3.49469, -1, -7.268183, 0, 1.5, 0.5, 0.5,
-3.49469, 0, -7.268183, 0, -0.5, 0.5, 0.5,
-3.49469, 0, -7.268183, 1, -0.5, 0.5, 0.5,
-3.49469, 0, -7.268183, 1, 1.5, 0.5, 0.5,
-3.49469, 0, -7.268183, 0, 1.5, 0.5, 0.5,
-3.49469, 1, -7.268183, 0, -0.5, 0.5, 0.5,
-3.49469, 1, -7.268183, 1, -0.5, 0.5, 0.5,
-3.49469, 1, -7.268183, 1, 1.5, 0.5, 0.5,
-3.49469, 1, -7.268183, 0, 1.5, 0.5, 0.5,
-3.49469, 2, -7.268183, 0, -0.5, 0.5, 0.5,
-3.49469, 2, -7.268183, 1, -0.5, 0.5, 0.5,
-3.49469, 2, -7.268183, 1, 1.5, 0.5, 0.5,
-3.49469, 2, -7.268183, 0, 1.5, 0.5, 0.5,
-3.49469, 3, -7.268183, 0, -0.5, 0.5, 0.5,
-3.49469, 3, -7.268183, 1, -0.5, 0.5, 0.5,
-3.49469, 3, -7.268183, 1, 1.5, 0.5, 0.5,
-3.49469, 3, -7.268183, 0, 1.5, 0.5, 0.5
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
-3.013968, -3.149224, -6,
-3.013968, -3.149224, 4,
-3.013968, -3.149224, -6,
-3.174209, -3.307986, -6,
-3.013968, -3.149224, -4,
-3.174209, -3.307986, -4,
-3.013968, -3.149224, -2,
-3.174209, -3.307986, -2,
-3.013968, -3.149224, 0,
-3.174209, -3.307986, 0,
-3.013968, -3.149224, 2,
-3.174209, -3.307986, 2,
-3.013968, -3.149224, 4,
-3.174209, -3.307986, 4
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
-3.49469, -3.62551, -6, 0, -0.5, 0.5, 0.5,
-3.49469, -3.62551, -6, 1, -0.5, 0.5, 0.5,
-3.49469, -3.62551, -6, 1, 1.5, 0.5, 0.5,
-3.49469, -3.62551, -6, 0, 1.5, 0.5, 0.5,
-3.49469, -3.62551, -4, 0, -0.5, 0.5, 0.5,
-3.49469, -3.62551, -4, 1, -0.5, 0.5, 0.5,
-3.49469, -3.62551, -4, 1, 1.5, 0.5, 0.5,
-3.49469, -3.62551, -4, 0, 1.5, 0.5, 0.5,
-3.49469, -3.62551, -2, 0, -0.5, 0.5, 0.5,
-3.49469, -3.62551, -2, 1, -0.5, 0.5, 0.5,
-3.49469, -3.62551, -2, 1, 1.5, 0.5, 0.5,
-3.49469, -3.62551, -2, 0, 1.5, 0.5, 0.5,
-3.49469, -3.62551, 0, 0, -0.5, 0.5, 0.5,
-3.49469, -3.62551, 0, 1, -0.5, 0.5, 0.5,
-3.49469, -3.62551, 0, 1, 1.5, 0.5, 0.5,
-3.49469, -3.62551, 0, 0, 1.5, 0.5, 0.5,
-3.49469, -3.62551, 2, 0, -0.5, 0.5, 0.5,
-3.49469, -3.62551, 2, 1, -0.5, 0.5, 0.5,
-3.49469, -3.62551, 2, 1, 1.5, 0.5, 0.5,
-3.49469, -3.62551, 2, 0, 1.5, 0.5, 0.5,
-3.49469, -3.62551, 4, 0, -0.5, 0.5, 0.5,
-3.49469, -3.62551, 4, 1, -0.5, 0.5, 0.5,
-3.49469, -3.62551, 4, 1, 1.5, 0.5, 0.5,
-3.49469, -3.62551, 4, 0, 1.5, 0.5, 0.5
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
-3.013968, -3.149224, -6.350656,
-3.013968, 3.201265, -6.350656,
-3.013968, -3.149224, 5.883039,
-3.013968, 3.201265, 5.883039,
-3.013968, -3.149224, -6.350656,
-3.013968, -3.149224, 5.883039,
-3.013968, 3.201265, -6.350656,
-3.013968, 3.201265, 5.883039,
-3.013968, -3.149224, -6.350656,
3.395651, -3.149224, -6.350656,
-3.013968, -3.149224, 5.883039,
3.395651, -3.149224, 5.883039,
-3.013968, 3.201265, -6.350656,
3.395651, 3.201265, -6.350656,
-3.013968, 3.201265, 5.883039,
3.395651, 3.201265, 5.883039,
3.395651, -3.149224, -6.350656,
3.395651, 3.201265, -6.350656,
3.395651, -3.149224, 5.883039,
3.395651, 3.201265, 5.883039,
3.395651, -3.149224, -6.350656,
3.395651, -3.149224, 5.883039,
3.395651, 3.201265, -6.350656,
3.395651, 3.201265, 5.883039
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
var radius = 8.117123;
var distance = 36.114;
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
mvMatrix.translate( -0.1908413, -0.02602088, 0.2338085 );
mvMatrix.scale( 1.369253, 1.382003, 0.7173951 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.114);
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
dimethenamid<-read.table("dimethenamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethenamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethenamid' not found
```

```r
y<-dimethenamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethenamid' not found
```

```r
z<-dimethenamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethenamid' not found
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
-2.920624, -0.5025775, -0.3552711, 0, 0, 1, 1, 1,
-2.895572, -1.012075, -1.685032, 1, 0, 0, 1, 1,
-2.874836, 0.5055655, -1.595835, 1, 0, 0, 1, 1,
-2.743418, -0.7583826, -1.625434, 1, 0, 0, 1, 1,
-2.678161, -0.820807, -1.442896, 1, 0, 0, 1, 1,
-2.56738, -1.233311, -0.9302964, 1, 0, 0, 1, 1,
-2.514702, -1.466137, -0.4940198, 0, 0, 0, 1, 1,
-2.430124, 1.351924, -1.601013, 0, 0, 0, 1, 1,
-2.381121, -0.2654329, -4.228623, 0, 0, 0, 1, 1,
-2.326551, 1.546996, -1.967319, 0, 0, 0, 1, 1,
-2.31593, -0.2445942, -1.29319, 0, 0, 0, 1, 1,
-2.277296, 0.4114999, -1.062167, 0, 0, 0, 1, 1,
-2.251268, -1.040423, -2.70129, 0, 0, 0, 1, 1,
-2.226811, -0.2665064, -1.410001, 1, 1, 1, 1, 1,
-2.224393, -0.1308798, -0.02856541, 1, 1, 1, 1, 1,
-2.207222, -0.2529809, -1.337617, 1, 1, 1, 1, 1,
-2.196547, 1.887471, 0.3722381, 1, 1, 1, 1, 1,
-2.162552, -1.450366, -1.020672, 1, 1, 1, 1, 1,
-2.139604, 0.1690173, -3.978563, 1, 1, 1, 1, 1,
-2.11968, 1.68903, 0.3926255, 1, 1, 1, 1, 1,
-2.118001, 1.603598, 0.1093842, 1, 1, 1, 1, 1,
-2.057921, -0.7726008, -2.463413, 1, 1, 1, 1, 1,
-2.054144, -0.2275042, -1.701962, 1, 1, 1, 1, 1,
-2.045393, -0.07769062, -2.234889, 1, 1, 1, 1, 1,
-2.00409, -0.5575692, -2.458954, 1, 1, 1, 1, 1,
-1.970187, 0.7091758, -2.081461, 1, 1, 1, 1, 1,
-1.955223, -0.6675359, -1.110232, 1, 1, 1, 1, 1,
-1.949486, 1.219561, -0.2482173, 1, 1, 1, 1, 1,
-1.930229, -0.5801079, -2.318274, 0, 0, 1, 1, 1,
-1.895421, -0.4505699, -2.353523, 1, 0, 0, 1, 1,
-1.857415, -2.091782, -1.147923, 1, 0, 0, 1, 1,
-1.856161, -0.3427386, -1.624498, 1, 0, 0, 1, 1,
-1.852771, -1.212204, -3.168525, 1, 0, 0, 1, 1,
-1.846244, 0.3425653, -1.038236, 1, 0, 0, 1, 1,
-1.824828, -0.2586502, -1.576439, 0, 0, 0, 1, 1,
-1.815931, -0.4776929, -2.083937, 0, 0, 0, 1, 1,
-1.807958, 1.162227, -1.476922, 0, 0, 0, 1, 1,
-1.806233, -0.1073218, -2.096159, 0, 0, 0, 1, 1,
-1.795792, 0.1692752, -0.3291296, 0, 0, 0, 1, 1,
-1.780012, 1.194893, -2.335151, 0, 0, 0, 1, 1,
-1.773483, 0.6049932, -1.428689, 0, 0, 0, 1, 1,
-1.770263, -1.484983, -2.415414, 1, 1, 1, 1, 1,
-1.741676, 1.826828, 0.04590036, 1, 1, 1, 1, 1,
-1.736849, 1.147675, -1.421089, 1, 1, 1, 1, 1,
-1.724619, -1.118862, -1.176446, 1, 1, 1, 1, 1,
-1.715436, -0.7865785, -1.33934, 1, 1, 1, 1, 1,
-1.711442, -0.5966861, -1.910534, 1, 1, 1, 1, 1,
-1.708725, 1.467546, -1.051818, 1, 1, 1, 1, 1,
-1.693561, 0.07740366, -0.9118556, 1, 1, 1, 1, 1,
-1.687367, 0.1442631, -1.555034, 1, 1, 1, 1, 1,
-1.687034, -0.5314555, -0.9533973, 1, 1, 1, 1, 1,
-1.640666, -0.04578963, -2.24528, 1, 1, 1, 1, 1,
-1.633196, 0.389059, -1.4868, 1, 1, 1, 1, 1,
-1.622558, -0.2111931, 0.4359779, 1, 1, 1, 1, 1,
-1.618847, 0.3409226, -3.170012, 1, 1, 1, 1, 1,
-1.617473, -1.461504, -3.217112, 1, 1, 1, 1, 1,
-1.616702, 0.614852, 0.3761763, 0, 0, 1, 1, 1,
-1.599334, 0.9640042, -3.21829, 1, 0, 0, 1, 1,
-1.599313, -0.6907233, -1.713637, 1, 0, 0, 1, 1,
-1.598323, -0.6341487, -1.088522, 1, 0, 0, 1, 1,
-1.587688, -1.486682, -4.575416, 1, 0, 0, 1, 1,
-1.581531, -0.3003895, -2.331045, 1, 0, 0, 1, 1,
-1.578126, 0.5523679, -1.687526, 0, 0, 0, 1, 1,
-1.572467, -0.9209719, -0.7778435, 0, 0, 0, 1, 1,
-1.539199, -0.09856959, -1.918005, 0, 0, 0, 1, 1,
-1.530947, -1.42266, -3.017427, 0, 0, 0, 1, 1,
-1.524956, -0.6520504, -2.133805, 0, 0, 0, 1, 1,
-1.520079, -0.4685307, -2.500213, 0, 0, 0, 1, 1,
-1.514109, -1.388921, -1.928917, 0, 0, 0, 1, 1,
-1.512248, -1.163939, -0.3503805, 1, 1, 1, 1, 1,
-1.503253, 0.8117414, -0.7961362, 1, 1, 1, 1, 1,
-1.498809, 0.5312426, -1.443555, 1, 1, 1, 1, 1,
-1.492196, 1.694942, -1.480668, 1, 1, 1, 1, 1,
-1.482862, -0.4642416, -2.773306, 1, 1, 1, 1, 1,
-1.475132, 0.2432762, 0.05736965, 1, 1, 1, 1, 1,
-1.457459, -1.000948, -4.117421, 1, 1, 1, 1, 1,
-1.450445, 2.495354, 2.300205, 1, 1, 1, 1, 1,
-1.439134, -1.034075, -1.093723, 1, 1, 1, 1, 1,
-1.431893, -1.133785, -3.194469, 1, 1, 1, 1, 1,
-1.431051, 0.6420509, -0.6661198, 1, 1, 1, 1, 1,
-1.422787, 0.03152996, -1.933754, 1, 1, 1, 1, 1,
-1.370892, 0.610291, -1.147195, 1, 1, 1, 1, 1,
-1.368995, -0.3424342, -3.251798, 1, 1, 1, 1, 1,
-1.367051, 1.195965, 1.82782, 1, 1, 1, 1, 1,
-1.362433, -1.618177, -2.618826, 0, 0, 1, 1, 1,
-1.358864, -0.7793759, -1.076251, 1, 0, 0, 1, 1,
-1.351236, -0.9039136, -2.223458, 1, 0, 0, 1, 1,
-1.336221, -1.369277, -3.033476, 1, 0, 0, 1, 1,
-1.32846, 1.435393, 0.5865337, 1, 0, 0, 1, 1,
-1.328454, 0.1679949, 0.1922538, 1, 0, 0, 1, 1,
-1.327422, 1.806418, -1.163691, 0, 0, 0, 1, 1,
-1.323325, 0.04078252, -1.2343, 0, 0, 0, 1, 1,
-1.321285, 2.086714, -0.8993953, 0, 0, 0, 1, 1,
-1.312423, 1.138675, -1.444168, 0, 0, 0, 1, 1,
-1.309399, 0.1920624, -1.130472, 0, 0, 0, 1, 1,
-1.300151, 0.536818, -3.182088, 0, 0, 0, 1, 1,
-1.298702, 0.6270528, -3.022457, 0, 0, 0, 1, 1,
-1.284004, -0.514893, -1.004264, 1, 1, 1, 1, 1,
-1.281059, 1.660345, 0.4916531, 1, 1, 1, 1, 1,
-1.277707, -0.5764567, -3.486947, 1, 1, 1, 1, 1,
-1.27712, 1.022922, -0.2020673, 1, 1, 1, 1, 1,
-1.26827, -0.6984394, -1.980493, 1, 1, 1, 1, 1,
-1.25612, 2.846013, -0.3319679, 1, 1, 1, 1, 1,
-1.252836, 0.6605554, -0.3930295, 1, 1, 1, 1, 1,
-1.25115, 0.009771732, 0.145881, 1, 1, 1, 1, 1,
-1.250285, 0.7339947, -1.283374, 1, 1, 1, 1, 1,
-1.241498, 0.8613075, -2.130658, 1, 1, 1, 1, 1,
-1.239438, 1.462791, -1.333854, 1, 1, 1, 1, 1,
-1.232188, -0.1199551, -2.422097, 1, 1, 1, 1, 1,
-1.231644, -0.7631496, -2.948662, 1, 1, 1, 1, 1,
-1.2311, 0.5418953, -2.15169, 1, 1, 1, 1, 1,
-1.224179, 1.258147, -0.9059575, 1, 1, 1, 1, 1,
-1.221401, 1.589632, 0.4416765, 0, 0, 1, 1, 1,
-1.208046, -0.006560958, -1.928498, 1, 0, 0, 1, 1,
-1.204997, 0.7903081, -0.4573226, 1, 0, 0, 1, 1,
-1.191505, 0.3054143, -2.712398, 1, 0, 0, 1, 1,
-1.191059, -0.04666796, -3.872107, 1, 0, 0, 1, 1,
-1.186705, 0.4628285, -0.5283206, 1, 0, 0, 1, 1,
-1.183346, 1.035002, -0.5124125, 0, 0, 0, 1, 1,
-1.181181, -1.581895, -2.668596, 0, 0, 0, 1, 1,
-1.180832, 0.3967593, -3.620841, 0, 0, 0, 1, 1,
-1.180724, 0.1209397, -1.480126, 0, 0, 0, 1, 1,
-1.176458, -0.1538825, -1.306946, 0, 0, 0, 1, 1,
-1.171673, 0.7524117, -3.812354, 0, 0, 0, 1, 1,
-1.170089, 0.1191816, -0.6252041, 0, 0, 0, 1, 1,
-1.169016, -1.801723, -2.597343, 1, 1, 1, 1, 1,
-1.162115, 0.6363794, -0.1212225, 1, 1, 1, 1, 1,
-1.16171, -0.8092389, -2.189172, 1, 1, 1, 1, 1,
-1.158192, -0.675403, -2.26407, 1, 1, 1, 1, 1,
-1.150533, 1.759318, -0.5532239, 1, 1, 1, 1, 1,
-1.143657, 0.1717714, -1.888167, 1, 1, 1, 1, 1,
-1.136365, 0.3218379, -0.9578004, 1, 1, 1, 1, 1,
-1.12654, -1.477718, -1.364588, 1, 1, 1, 1, 1,
-1.115337, -0.6878958, -2.812811, 1, 1, 1, 1, 1,
-1.114437, -1.16031, -2.9733, 1, 1, 1, 1, 1,
-1.099469, 0.1014134, 0.2680536, 1, 1, 1, 1, 1,
-1.095504, 0.4893691, -1.115986, 1, 1, 1, 1, 1,
-1.093611, -1.528269, -1.794758, 1, 1, 1, 1, 1,
-1.091499, 0.2763316, -0.3540397, 1, 1, 1, 1, 1,
-1.091006, 2.247532, -1.030057, 1, 1, 1, 1, 1,
-1.089771, 0.6369267, -2.266201, 0, 0, 1, 1, 1,
-1.088731, -0.2849882, -2.127784, 1, 0, 0, 1, 1,
-1.087921, 0.04707867, -1.89336, 1, 0, 0, 1, 1,
-1.087551, 0.4507711, 0.6539169, 1, 0, 0, 1, 1,
-1.076231, 1.081742, -0.8454272, 1, 0, 0, 1, 1,
-1.075777, 0.09740862, -1.012655, 1, 0, 0, 1, 1,
-1.066218, 0.7755887, -0.9835976, 0, 0, 0, 1, 1,
-1.063126, 1.354304, -0.9504412, 0, 0, 0, 1, 1,
-1.057864, -1.270235, -2.955384, 0, 0, 0, 1, 1,
-1.056118, 0.01271135, -1.842765, 0, 0, 0, 1, 1,
-1.055468, 1.093789, -1.022193, 0, 0, 0, 1, 1,
-1.053047, 0.119057, -0.7718759, 0, 0, 0, 1, 1,
-1.052795, 0.4515188, -2.945366, 0, 0, 0, 1, 1,
-1.03916, -0.4202002, -3.474167, 1, 1, 1, 1, 1,
-1.036283, 0.06726746, -1.331672, 1, 1, 1, 1, 1,
-1.034808, 0.7436261, 0.06683364, 1, 1, 1, 1, 1,
-1.033652, 0.6088204, -1.472148, 1, 1, 1, 1, 1,
-1.031013, 1.974743, -0.441834, 1, 1, 1, 1, 1,
-1.02672, -0.2909308, -2.304569, 1, 1, 1, 1, 1,
-1.024995, -2.10939, -2.547657, 1, 1, 1, 1, 1,
-1.018474, -1.414181, -1.394645, 1, 1, 1, 1, 1,
-1.013176, -2.017965, -3.163042, 1, 1, 1, 1, 1,
-1.009372, -0.2341103, -1.057308, 1, 1, 1, 1, 1,
-1.004849, 0.8919742, 0.23798, 1, 1, 1, 1, 1,
-1.003745, 1.258983, -0.6366321, 1, 1, 1, 1, 1,
-0.9985297, 2.076369, -0.5051317, 1, 1, 1, 1, 1,
-0.9801791, 0.2788614, -2.301323, 1, 1, 1, 1, 1,
-0.9630426, 1.148969, -2.773208, 1, 1, 1, 1, 1,
-0.9629775, 0.1728419, -1.725665, 0, 0, 1, 1, 1,
-0.9619591, 1.644066, -2.406239, 1, 0, 0, 1, 1,
-0.9609724, 0.1172046, 0.1140813, 1, 0, 0, 1, 1,
-0.9536896, 1.176583, 0.3265256, 1, 0, 0, 1, 1,
-0.9511679, 0.4124951, -0.4699751, 1, 0, 0, 1, 1,
-0.9404469, 0.712091, -1.029099, 1, 0, 0, 1, 1,
-0.935202, -1.042797, -2.926701, 0, 0, 0, 1, 1,
-0.9291774, -1.628409, -3.462229, 0, 0, 0, 1, 1,
-0.9198095, 1.125448, 0.1820275, 0, 0, 0, 1, 1,
-0.9175057, -0.9026149, -1.224753, 0, 0, 0, 1, 1,
-0.9111236, 0.7405013, -0.6101865, 0, 0, 0, 1, 1,
-0.8994589, 0.02359533, -2.37328, 0, 0, 0, 1, 1,
-0.8976783, -0.8359126, -2.474215, 0, 0, 0, 1, 1,
-0.8960911, 0.6320669, -0.3994577, 1, 1, 1, 1, 1,
-0.8907135, -0.2976167, -1.706501, 1, 1, 1, 1, 1,
-0.8896282, -0.9151871, -3.387835, 1, 1, 1, 1, 1,
-0.886371, 0.1434869, -1.409413, 1, 1, 1, 1, 1,
-0.8862694, -0.5178887, -2.559514, 1, 1, 1, 1, 1,
-0.8791021, -1.35324, -2.077336, 1, 1, 1, 1, 1,
-0.8763676, 0.753758, -0.9507608, 1, 1, 1, 1, 1,
-0.8741838, -0.9261428, -2.357639, 1, 1, 1, 1, 1,
-0.8714582, 0.4761968, -2.145965, 1, 1, 1, 1, 1,
-0.8713749, 0.4256098, -0.4885233, 1, 1, 1, 1, 1,
-0.8713728, -0.205807, 0.8846258, 1, 1, 1, 1, 1,
-0.8711605, -0.1183974, -2.284677, 1, 1, 1, 1, 1,
-0.8704974, 0.8363092, -2.246097, 1, 1, 1, 1, 1,
-0.867816, -0.5256815, -1.417884, 1, 1, 1, 1, 1,
-0.8587168, 1.630315, -1.552176, 1, 1, 1, 1, 1,
-0.8544564, -1.224032, -3.913168, 0, 0, 1, 1, 1,
-0.8537406, -0.4033749, -1.272747, 1, 0, 0, 1, 1,
-0.849807, -0.9619667, -1.494463, 1, 0, 0, 1, 1,
-0.8485724, 0.8567651, -2.043918, 1, 0, 0, 1, 1,
-0.8472434, -0.8964489, -2.599244, 1, 0, 0, 1, 1,
-0.8446535, 0.1088434, -2.355857, 1, 0, 0, 1, 1,
-0.8396732, -0.4430691, -2.40367, 0, 0, 0, 1, 1,
-0.8392876, -0.4246406, -3.156501, 0, 0, 0, 1, 1,
-0.8372614, -0.2072639, -3.749195, 0, 0, 0, 1, 1,
-0.8296357, -0.3718642, -2.733684, 0, 0, 0, 1, 1,
-0.8288161, -0.7896853, -3.350104, 0, 0, 0, 1, 1,
-0.8201291, 1.253062, -0.2884569, 0, 0, 0, 1, 1,
-0.8168133, -0.2230666, -2.232408, 0, 0, 0, 1, 1,
-0.8160411, 0.7939215, -1.670757, 1, 1, 1, 1, 1,
-0.8087463, -0.5790813, -2.214801, 1, 1, 1, 1, 1,
-0.8079126, 1.057368, -0.9021385, 1, 1, 1, 1, 1,
-0.8036141, 0.9010308, -0.29088, 1, 1, 1, 1, 1,
-0.8003761, -1.663689, -2.566873, 1, 1, 1, 1, 1,
-0.7999031, 0.5927928, -0.1042387, 1, 1, 1, 1, 1,
-0.7996218, 0.5718621, -1.736049, 1, 1, 1, 1, 1,
-0.7980854, 1.023321, -1.063879, 1, 1, 1, 1, 1,
-0.7971154, -0.536437, -2.984735, 1, 1, 1, 1, 1,
-0.7721038, 2.185193, 0.5260007, 1, 1, 1, 1, 1,
-0.7559472, -0.4089548, -2.57009, 1, 1, 1, 1, 1,
-0.7523521, 0.4549764, -0.9381725, 1, 1, 1, 1, 1,
-0.7517592, -0.3647301, -2.697121, 1, 1, 1, 1, 1,
-0.7487772, 0.5343065, -1.785504, 1, 1, 1, 1, 1,
-0.7434872, -0.4639505, -0.5374618, 1, 1, 1, 1, 1,
-0.7430245, -0.4925144, -2.786307, 0, 0, 1, 1, 1,
-0.7409171, -0.4670294, -2.043045, 1, 0, 0, 1, 1,
-0.7317737, -1.24973, -2.64723, 1, 0, 0, 1, 1,
-0.7270043, 0.5703067, -0.7092608, 1, 0, 0, 1, 1,
-0.7255763, -0.5420608, -3.979374, 1, 0, 0, 1, 1,
-0.7219416, 0.1347538, 0.3338006, 1, 0, 0, 1, 1,
-0.7151903, 1.196982, -1.19212, 0, 0, 0, 1, 1,
-0.7136664, 0.1621941, 0.2839904, 0, 0, 0, 1, 1,
-0.7005839, 0.4763014, -1.000381, 0, 0, 0, 1, 1,
-0.6997425, 0.5752439, -1.787099, 0, 0, 0, 1, 1,
-0.6985426, 0.7188158, -0.9844831, 0, 0, 0, 1, 1,
-0.6981518, -0.4002599, -3.279499, 0, 0, 0, 1, 1,
-0.6906598, 0.3588034, -2.234804, 0, 0, 0, 1, 1,
-0.6778666, 0.3168691, 1.533552, 1, 1, 1, 1, 1,
-0.6775201, -0.5176935, -2.741007, 1, 1, 1, 1, 1,
-0.6757433, 0.3885455, -1.473451, 1, 1, 1, 1, 1,
-0.6752523, 1.161655, -0.7833507, 1, 1, 1, 1, 1,
-0.6732405, 0.4322785, -0.5922698, 1, 1, 1, 1, 1,
-0.6723837, 0.1250789, 1.348231, 1, 1, 1, 1, 1,
-0.6630332, 0.5717256, -1.647297, 1, 1, 1, 1, 1,
-0.6615491, -0.4796427, -2.242437, 1, 1, 1, 1, 1,
-0.6611053, 0.5472791, -2.63658, 1, 1, 1, 1, 1,
-0.6607775, -0.5521778, -2.893261, 1, 1, 1, 1, 1,
-0.6589213, 1.94673, -0.2315788, 1, 1, 1, 1, 1,
-0.6479264, 0.07027949, -2.184932, 1, 1, 1, 1, 1,
-0.6415558, 0.1497734, -1.491879, 1, 1, 1, 1, 1,
-0.6351061, -0.5686511, -0.8505737, 1, 1, 1, 1, 1,
-0.6305129, 0.6522009, -3.058475, 1, 1, 1, 1, 1,
-0.6215877, -0.4414281, -3.215316, 0, 0, 1, 1, 1,
-0.618153, -1.575477, -1.515496, 1, 0, 0, 1, 1,
-0.6156551, -1.12776, -2.952399, 1, 0, 0, 1, 1,
-0.6137605, -0.1999051, -0.9136884, 1, 0, 0, 1, 1,
-0.6123998, -1.986313, -2.229364, 1, 0, 0, 1, 1,
-0.6090469, -0.1897681, -1.890634, 1, 0, 0, 1, 1,
-0.6086195, 0.7844066, -0.706701, 0, 0, 0, 1, 1,
-0.6081012, -0.7467413, -3.795132, 0, 0, 0, 1, 1,
-0.607847, 0.05840242, -1.103779, 0, 0, 0, 1, 1,
-0.607148, -1.019036, -3.551228, 0, 0, 0, 1, 1,
-0.6043043, -0.4311042, -1.397847, 0, 0, 0, 1, 1,
-0.5986733, 0.5917873, -2.110346, 0, 0, 0, 1, 1,
-0.5937498, 1.347646, -0.4544744, 0, 0, 0, 1, 1,
-0.5898711, -1.143584, -2.093859, 1, 1, 1, 1, 1,
-0.5873212, -0.764609, -2.70041, 1, 1, 1, 1, 1,
-0.5831279, 0.3010392, -1.119452, 1, 1, 1, 1, 1,
-0.5825232, 1.451652, 0.06080282, 1, 1, 1, 1, 1,
-0.5815005, -0.267738, -0.9153035, 1, 1, 1, 1, 1,
-0.5805646, -0.09592086, -1.868232, 1, 1, 1, 1, 1,
-0.5792608, 1.014858, -0.7460659, 1, 1, 1, 1, 1,
-0.5744104, -0.8614158, -2.949252, 1, 1, 1, 1, 1,
-0.5691227, -0.5369098, -2.73802, 1, 1, 1, 1, 1,
-0.5676256, -0.9881196, -0.9904467, 1, 1, 1, 1, 1,
-0.5642935, 1.184891, -2.101296, 1, 1, 1, 1, 1,
-0.560316, 0.5521742, -1.475651, 1, 1, 1, 1, 1,
-0.5548309, 0.3356462, -2.298785, 1, 1, 1, 1, 1,
-0.5496302, -0.9407784, -1.602283, 1, 1, 1, 1, 1,
-0.5488892, -0.2680096, -1.476998, 1, 1, 1, 1, 1,
-0.5487288, -1.299045, -4.031135, 0, 0, 1, 1, 1,
-0.5477547, 0.9355824, -1.533802, 1, 0, 0, 1, 1,
-0.5446361, 0.5680718, -0.839592, 1, 0, 0, 1, 1,
-0.5428441, -1.468548, -3.092514, 1, 0, 0, 1, 1,
-0.5411054, -0.06012391, -3.011674, 1, 0, 0, 1, 1,
-0.538238, 0.3463103, -2.811042, 1, 0, 0, 1, 1,
-0.5261125, -1.248416, -3.372527, 0, 0, 0, 1, 1,
-0.5260699, -0.4923398, -2.001996, 0, 0, 0, 1, 1,
-0.5258145, 0.6012359, -0.6702583, 0, 0, 0, 1, 1,
-0.5241098, -1.737147, -3.341826, 0, 0, 0, 1, 1,
-0.519668, 0.7191427, 0.1724106, 0, 0, 0, 1, 1,
-0.5180047, -1.45436, -6.172495, 0, 0, 0, 1, 1,
-0.5152779, -0.7523489, -3.047648, 0, 0, 0, 1, 1,
-0.5149329, -0.7336885, -3.273463, 1, 1, 1, 1, 1,
-0.5117812, -0.9853956, -3.193255, 1, 1, 1, 1, 1,
-0.5113941, 0.4005811, -0.9066414, 1, 1, 1, 1, 1,
-0.5082705, -1.240948, -2.94444, 1, 1, 1, 1, 1,
-0.5042917, 1.064539, 0.9250281, 1, 1, 1, 1, 1,
-0.4945088, 0.5520248, -0.6431105, 1, 1, 1, 1, 1,
-0.4913682, 0.3812783, 1.295987, 1, 1, 1, 1, 1,
-0.4873815, -0.28952, -2.756457, 1, 1, 1, 1, 1,
-0.4831319, -1.762296, -2.643951, 1, 1, 1, 1, 1,
-0.4826676, 0.3871477, -0.2833902, 1, 1, 1, 1, 1,
-0.4819006, -1.435513, -2.252675, 1, 1, 1, 1, 1,
-0.4801891, 0.5583145, -1.358497, 1, 1, 1, 1, 1,
-0.4793892, 0.1537837, -0.6718119, 1, 1, 1, 1, 1,
-0.4787072, 0.4866961, -1.169371, 1, 1, 1, 1, 1,
-0.4742957, -0.023654, -1.900446, 1, 1, 1, 1, 1,
-0.4718267, 0.8637874, -0.491428, 0, 0, 1, 1, 1,
-0.4708545, 0.2613783, 0.6342638, 1, 0, 0, 1, 1,
-0.4641406, 0.8172809, -1.74579, 1, 0, 0, 1, 1,
-0.4557583, -0.2191865, 1.002252, 1, 0, 0, 1, 1,
-0.4543354, -1.565385, -2.70003, 1, 0, 0, 1, 1,
-0.4524575, -1.966351, -4.486341, 1, 0, 0, 1, 1,
-0.4509836, 1.709194, -1.492448, 0, 0, 0, 1, 1,
-0.4409293, -0.5277719, -1.01023, 0, 0, 0, 1, 1,
-0.4383984, -1.594092, -2.105904, 0, 0, 0, 1, 1,
-0.4378453, 0.6864481, -1.112298, 0, 0, 0, 1, 1,
-0.4359814, 0.4740182, 1.051099, 0, 0, 0, 1, 1,
-0.4353522, -0.551122, -1.060911, 0, 0, 0, 1, 1,
-0.434846, 0.6514599, -2.887059, 0, 0, 0, 1, 1,
-0.4323, -0.6822041, -3.105153, 1, 1, 1, 1, 1,
-0.423491, 1.232462, -2.05097, 1, 1, 1, 1, 1,
-0.4217288, -0.8294075, -2.362247, 1, 1, 1, 1, 1,
-0.4207338, 0.1698121, -2.45491, 1, 1, 1, 1, 1,
-0.4189095, -0.5745714, -3.08126, 1, 1, 1, 1, 1,
-0.4121299, 0.8352475, 0.00365361, 1, 1, 1, 1, 1,
-0.4084778, -0.3463802, -0.9351029, 1, 1, 1, 1, 1,
-0.3935731, -1.56964, -4.795403, 1, 1, 1, 1, 1,
-0.3912167, -1.051775, -3.222, 1, 1, 1, 1, 1,
-0.3899287, -0.1510973, -0.9355168, 1, 1, 1, 1, 1,
-0.3876379, -0.7499446, -3.121909, 1, 1, 1, 1, 1,
-0.3843935, -0.002115349, -0.913515, 1, 1, 1, 1, 1,
-0.3843509, 0.8327558, 0.9492563, 1, 1, 1, 1, 1,
-0.3804353, 0.2066557, -0.3082056, 1, 1, 1, 1, 1,
-0.3786192, -1.134164, -1.435048, 1, 1, 1, 1, 1,
-0.3714807, -1.627438, -2.522151, 0, 0, 1, 1, 1,
-0.3697593, -0.4852451, -1.30979, 1, 0, 0, 1, 1,
-0.3661059, 1.791535, -0.9723307, 1, 0, 0, 1, 1,
-0.3660032, -0.8270071, -2.170004, 1, 0, 0, 1, 1,
-0.360089, 1.13701, -0.8903142, 1, 0, 0, 1, 1,
-0.3549033, 1.450919, -0.4348416, 1, 0, 0, 1, 1,
-0.3528712, 0.03890178, -1.693675, 0, 0, 0, 1, 1,
-0.3463162, -1.71992, -3.508259, 0, 0, 0, 1, 1,
-0.3446468, -0.6084256, -3.754156, 0, 0, 0, 1, 1,
-0.3415267, -1.118259, -3.929054, 0, 0, 0, 1, 1,
-0.3364057, -2.029852, -3.497742, 0, 0, 0, 1, 1,
-0.33202, -0.3364978, -3.757427, 0, 0, 0, 1, 1,
-0.331836, -0.2373338, -0.9226754, 0, 0, 0, 1, 1,
-0.3268373, -0.2439567, -3.598195, 1, 1, 1, 1, 1,
-0.3244172, -0.6947536, -1.513703, 1, 1, 1, 1, 1,
-0.3240933, 0.9252024, -0.03656844, 1, 1, 1, 1, 1,
-0.3240882, 0.9865205, 0.3885427, 1, 1, 1, 1, 1,
-0.3184274, 0.1357031, -1.171382, 1, 1, 1, 1, 1,
-0.3177002, -0.0212609, -1.32082, 1, 1, 1, 1, 1,
-0.3159134, 1.358567, -0.7740571, 1, 1, 1, 1, 1,
-0.3084632, -0.4062198, -1.683092, 1, 1, 1, 1, 1,
-0.307799, 1.523229, -0.8030035, 1, 1, 1, 1, 1,
-0.307762, 1.598985, 0.6609953, 1, 1, 1, 1, 1,
-0.3043315, -0.5216922, -3.246884, 1, 1, 1, 1, 1,
-0.30427, 0.3577413, -0.003463675, 1, 1, 1, 1, 1,
-0.3041386, -1.206232, -2.659456, 1, 1, 1, 1, 1,
-0.3034298, -1.55035, -3.495233, 1, 1, 1, 1, 1,
-0.3028649, 1.420026, 0.2691637, 1, 1, 1, 1, 1,
-0.300275, -0.2134812, -2.21572, 0, 0, 1, 1, 1,
-0.2997604, 0.001307414, -0.9753709, 1, 0, 0, 1, 1,
-0.2977613, 0.7338375, 0.9315609, 1, 0, 0, 1, 1,
-0.2937475, 0.799082, 0.9052418, 1, 0, 0, 1, 1,
-0.2921796, 0.3444584, -0.6256714, 1, 0, 0, 1, 1,
-0.2913404, -1.441172, -3.829722, 1, 0, 0, 1, 1,
-0.2907242, 1.169487, 2.98064, 0, 0, 0, 1, 1,
-0.286315, -0.4868897, -1.803021, 0, 0, 0, 1, 1,
-0.2856649, 0.8566772, 0.5455559, 0, 0, 0, 1, 1,
-0.2854483, -0.01543575, -0.3783078, 0, 0, 0, 1, 1,
-0.2820063, -1.422545, -3.235758, 0, 0, 0, 1, 1,
-0.2819339, 0.9494586, -0.9088241, 0, 0, 0, 1, 1,
-0.2812654, -1.53349, -4.584078, 0, 0, 0, 1, 1,
-0.2794019, 0.9463432, -0.5556579, 1, 1, 1, 1, 1,
-0.2784705, 0.4841062, 0.004492058, 1, 1, 1, 1, 1,
-0.2749587, -0.2754103, -2.078558, 1, 1, 1, 1, 1,
-0.2739497, 0.3024262, -1.582764, 1, 1, 1, 1, 1,
-0.273205, -0.7215303, -3.900345, 1, 1, 1, 1, 1,
-0.2727672, 1.531326, -2.371166, 1, 1, 1, 1, 1,
-0.2712461, 0.2770935, -0.5480916, 1, 1, 1, 1, 1,
-0.2710295, 0.5292598, -1.335198, 1, 1, 1, 1, 1,
-0.2689829, 1.08915, -1.6062, 1, 1, 1, 1, 1,
-0.2679296, 0.4173143, -0.9221023, 1, 1, 1, 1, 1,
-0.2665547, 0.679379, -0.1647917, 1, 1, 1, 1, 1,
-0.2657914, 0.4036467, -0.2415394, 1, 1, 1, 1, 1,
-0.264786, -0.8053325, -3.413281, 1, 1, 1, 1, 1,
-0.2640747, 2.240438, -1.035778, 1, 1, 1, 1, 1,
-0.2621236, -0.2457142, -2.837295, 1, 1, 1, 1, 1,
-0.2592355, -1.059416, -2.548272, 0, 0, 1, 1, 1,
-0.2563737, 0.8214663, -1.526068, 1, 0, 0, 1, 1,
-0.25619, -0.01377511, -1.438052, 1, 0, 0, 1, 1,
-0.2519079, -1.420677, -2.971322, 1, 0, 0, 1, 1,
-0.2507148, 1.205523, 2.293251, 1, 0, 0, 1, 1,
-0.249795, -0.7232832, -3.062775, 1, 0, 0, 1, 1,
-0.249179, 0.2805049, -1.497122, 0, 0, 0, 1, 1,
-0.2486505, 0.5169426, -0.5709882, 0, 0, 0, 1, 1,
-0.2393184, -0.5458128, -3.234247, 0, 0, 0, 1, 1,
-0.2377017, -0.1878588, -2.049366, 0, 0, 0, 1, 1,
-0.236037, -0.3495224, -2.928193, 0, 0, 0, 1, 1,
-0.2329645, -0.3602509, -1.693664, 0, 0, 0, 1, 1,
-0.2323346, 0.5556938, -0.8597352, 0, 0, 0, 1, 1,
-0.2307088, 0.404337, 0.8521549, 1, 1, 1, 1, 1,
-0.2293841, -0.4880027, -0.6946343, 1, 1, 1, 1, 1,
-0.2283979, -0.4259081, -2.856465, 1, 1, 1, 1, 1,
-0.2280475, 0.4917105, 0.1478454, 1, 1, 1, 1, 1,
-0.2250922, 1.566433, 0.2544758, 1, 1, 1, 1, 1,
-0.2236327, -0.03124906, -1.942929, 1, 1, 1, 1, 1,
-0.2225789, -0.3664958, -3.038119, 1, 1, 1, 1, 1,
-0.2218527, -0.2623969, -2.141243, 1, 1, 1, 1, 1,
-0.2101184, 0.4339881, -0.09068645, 1, 1, 1, 1, 1,
-0.2084762, -0.197906, -3.447308, 1, 1, 1, 1, 1,
-0.2070843, -0.7036861, -2.977742, 1, 1, 1, 1, 1,
-0.2062426, 0.3988289, -0.9408984, 1, 1, 1, 1, 1,
-0.2044263, -0.886543, -1.961216, 1, 1, 1, 1, 1,
-0.1973684, 0.09557843, 0.09081414, 1, 1, 1, 1, 1,
-0.19645, 0.603118, -0.3280777, 1, 1, 1, 1, 1,
-0.194724, 0.6069301, -0.3901301, 0, 0, 1, 1, 1,
-0.1851546, -0.442473, -2.892695, 1, 0, 0, 1, 1,
-0.1841188, -1.528546, -2.337413, 1, 0, 0, 1, 1,
-0.182373, -0.54242, -4.139299, 1, 0, 0, 1, 1,
-0.1815468, -0.3308196, -2.186628, 1, 0, 0, 1, 1,
-0.1807934, 0.4401066, 0.1195363, 1, 0, 0, 1, 1,
-0.1726991, 1.9716, -1.02214, 0, 0, 0, 1, 1,
-0.1713734, 0.1542844, 0.05323689, 0, 0, 0, 1, 1,
-0.1709644, 0.7503337, -1.057051, 0, 0, 0, 1, 1,
-0.1706656, 0.6862205, 0.823897, 0, 0, 0, 1, 1,
-0.1702229, -1.729338, -2.32535, 0, 0, 0, 1, 1,
-0.1656424, 0.2191331, 0.4626215, 0, 0, 0, 1, 1,
-0.1646147, 0.856267, -0.3586294, 0, 0, 0, 1, 1,
-0.1579844, -1.539305, -1.234869, 1, 1, 1, 1, 1,
-0.156093, 1.437998, -1.521587, 1, 1, 1, 1, 1,
-0.1532752, 0.6223954, -0.6193114, 1, 1, 1, 1, 1,
-0.1442406, -1.103909, -2.917981, 1, 1, 1, 1, 1,
-0.1435708, -1.777147, -1.279366, 1, 1, 1, 1, 1,
-0.1411108, 0.5145457, -0.2565565, 1, 1, 1, 1, 1,
-0.1336041, -0.9985034, -2.997276, 1, 1, 1, 1, 1,
-0.1285673, -1.114483, -2.71805, 1, 1, 1, 1, 1,
-0.123907, 0.7911258, -0.1029826, 1, 1, 1, 1, 1,
-0.1238574, -1.756395, -4.384799, 1, 1, 1, 1, 1,
-0.1226524, 2.330639, -0.3485443, 1, 1, 1, 1, 1,
-0.1209679, 0.2671615, -1.168136, 1, 1, 1, 1, 1,
-0.1188178, -0.01632873, -0.8616048, 1, 1, 1, 1, 1,
-0.1168607, 2.257443, 0.4166878, 1, 1, 1, 1, 1,
-0.1166668, 0.1900938, -0.6055354, 1, 1, 1, 1, 1,
-0.1151062, -0.7048206, -2.989928, 0, 0, 1, 1, 1,
-0.1145069, -1.35165, -2.831215, 1, 0, 0, 1, 1,
-0.1123555, -1.480296, -2.35076, 1, 0, 0, 1, 1,
-0.1078885, -0.5757682, -2.954084, 1, 0, 0, 1, 1,
-0.1050509, 0.1404316, -3.247716, 1, 0, 0, 1, 1,
-0.1044717, 0.5419705, -0.2674182, 1, 0, 0, 1, 1,
-0.09952812, -0.1057493, -2.328339, 0, 0, 0, 1, 1,
-0.09830904, 0.9047742, -1.215467, 0, 0, 0, 1, 1,
-0.09697856, 0.06290918, -0.6724951, 0, 0, 0, 1, 1,
-0.09273009, -0.3930959, -1.219642, 0, 0, 0, 1, 1,
-0.08542304, -0.2714376, -4.776187, 0, 0, 0, 1, 1,
-0.0845044, -0.964415, -2.698888, 0, 0, 0, 1, 1,
-0.08382495, -0.7504062, -3.530387, 0, 0, 0, 1, 1,
-0.08288661, 0.8944274, 0.5474492, 1, 1, 1, 1, 1,
-0.08265245, -0.5186346, -2.810935, 1, 1, 1, 1, 1,
-0.08009369, 2.240022, 0.3165615, 1, 1, 1, 1, 1,
-0.07933669, 1.051732, -0.9098939, 1, 1, 1, 1, 1,
-0.07817879, 0.8015856, -1.327385, 1, 1, 1, 1, 1,
-0.07524312, 1.346649, -0.8487872, 1, 1, 1, 1, 1,
-0.07512827, 0.2654728, -1.18771, 1, 1, 1, 1, 1,
-0.07327532, -0.8647929, -3.635769, 1, 1, 1, 1, 1,
-0.07292721, 0.3829832, -1.915136, 1, 1, 1, 1, 1,
-0.07040534, -0.06929806, -2.254537, 1, 1, 1, 1, 1,
-0.06612808, -0.7556607, -2.991913, 1, 1, 1, 1, 1,
-0.06437762, 0.293995, -0.6667299, 1, 1, 1, 1, 1,
-0.05828027, 1.77712, 0.9152493, 1, 1, 1, 1, 1,
-0.05809669, -0.8259144, -3.733499, 1, 1, 1, 1, 1,
-0.05014012, 0.04650157, -1.487762, 1, 1, 1, 1, 1,
-0.04926016, 0.799697, 0.8130602, 0, 0, 1, 1, 1,
-0.04720219, -1.727568, -3.785127, 1, 0, 0, 1, 1,
-0.04709321, 1.743866, 0.007667535, 1, 0, 0, 1, 1,
-0.04679339, 0.254333, -0.04843057, 1, 0, 0, 1, 1,
-0.0423058, 0.399335, -0.5503847, 1, 0, 0, 1, 1,
-0.0377875, -0.6090564, -2.928657, 1, 0, 0, 1, 1,
-0.03470577, 1.4536, -1.622764, 0, 0, 0, 1, 1,
-0.03002862, 0.2471947, 0.2098472, 0, 0, 0, 1, 1,
-0.02979947, 1.928763, -0.8236315, 0, 0, 0, 1, 1,
-0.02882975, 0.9101086, -0.3409309, 0, 0, 0, 1, 1,
-0.02845792, 0.3625072, 1.107374, 0, 0, 0, 1, 1,
-0.02668471, 0.6449818, -0.01387668, 0, 0, 0, 1, 1,
-0.02636841, 1.609377, -0.2178817, 0, 0, 0, 1, 1,
-0.02495758, 0.4639766, -1.026103, 1, 1, 1, 1, 1,
-0.02131358, -0.796103, -3.679971, 1, 1, 1, 1, 1,
-0.02130762, -0.6845582, -2.639885, 1, 1, 1, 1, 1,
-0.01838555, -1.980502, -3.330281, 1, 1, 1, 1, 1,
-0.01532622, 1.043966, 0.8064118, 1, 1, 1, 1, 1,
-0.007000807, 0.07897997, 0.8803431, 1, 1, 1, 1, 1,
-0.005488775, 0.194423, -0.5091181, 1, 1, 1, 1, 1,
0.001732032, 0.02521546, 0.9485299, 1, 1, 1, 1, 1,
0.003054071, -0.8100685, 3.275421, 1, 1, 1, 1, 1,
0.005550445, 1.683275, -0.4159873, 1, 1, 1, 1, 1,
0.006163105, -0.06473715, 2.866949, 1, 1, 1, 1, 1,
0.007989479, 0.8270569, 2.382299, 1, 1, 1, 1, 1,
0.01566157, 0.8164194, -0.7067564, 1, 1, 1, 1, 1,
0.02470259, -1.620098, 3.661898, 1, 1, 1, 1, 1,
0.0251896, -0.5788547, 2.657823, 1, 1, 1, 1, 1,
0.02754689, 0.1778205, -0.5764267, 0, 0, 1, 1, 1,
0.02988188, -1.684504, 4.183118, 1, 0, 0, 1, 1,
0.03268439, 0.4861297, 0.7447652, 1, 0, 0, 1, 1,
0.03384825, 0.102125, -0.3331133, 1, 0, 0, 1, 1,
0.03460908, 1.63582, 1.054232, 1, 0, 0, 1, 1,
0.03482532, 0.4677111, 0.9944032, 1, 0, 0, 1, 1,
0.03884328, -0.7256369, 3.570284, 0, 0, 0, 1, 1,
0.04558767, -0.3866192, 1.501879, 0, 0, 0, 1, 1,
0.04927382, 1.351789, 0.3815402, 0, 0, 0, 1, 1,
0.05012808, 0.4684277, 0.4793856, 0, 0, 0, 1, 1,
0.05315374, 1.305051, -1.337876, 0, 0, 0, 1, 1,
0.05839893, -0.6046275, 5.704878, 0, 0, 0, 1, 1,
0.05879255, 0.3075698, 0.7549939, 0, 0, 0, 1, 1,
0.06026256, -1.302334, 2.005041, 1, 1, 1, 1, 1,
0.06266519, 0.04372392, 1.123911, 1, 1, 1, 1, 1,
0.0629107, 1.445001, -0.6963552, 1, 1, 1, 1, 1,
0.06749032, 0.5616146, 0.376611, 1, 1, 1, 1, 1,
0.07031687, 0.04480901, 1.350827, 1, 1, 1, 1, 1,
0.07193156, 0.2008801, 1.439374, 1, 1, 1, 1, 1,
0.07618004, 2.705167, 0.5018277, 1, 1, 1, 1, 1,
0.07743635, 0.120269, 0.2235556, 1, 1, 1, 1, 1,
0.07817283, -0.9845947, 3.166939, 1, 1, 1, 1, 1,
0.07905279, -1.578043, 2.92947, 1, 1, 1, 1, 1,
0.08128041, 0.42992, -0.7594283, 1, 1, 1, 1, 1,
0.08159368, 0.8920148, -0.4506997, 1, 1, 1, 1, 1,
0.08382095, 0.6956286, -1.494623, 1, 1, 1, 1, 1,
0.08410622, 0.1861019, 0.5615367, 1, 1, 1, 1, 1,
0.08510426, 0.8527427, -0.2080622, 1, 1, 1, 1, 1,
0.08516089, 0.5978723, -0.2767338, 0, 0, 1, 1, 1,
0.08608825, 1.156117, -1.250279, 1, 0, 0, 1, 1,
0.08818778, 1.217257, 0.1949095, 1, 0, 0, 1, 1,
0.08878241, -0.9808167, 4.455336, 1, 0, 0, 1, 1,
0.09078617, 0.7973141, 0.650546, 1, 0, 0, 1, 1,
0.09420086, -0.396856, 1.479153, 1, 0, 0, 1, 1,
0.09988318, 1.024682, 0.5490979, 0, 0, 0, 1, 1,
0.1032277, -0.05829086, 2.709972, 0, 0, 0, 1, 1,
0.1035974, -0.02218613, 2.870642, 0, 0, 0, 1, 1,
0.1072951, -1.156057, 3.38912, 0, 0, 0, 1, 1,
0.1086662, -0.2257768, 1.573983, 0, 0, 0, 1, 1,
0.1105582, 0.9248577, 2.193229, 0, 0, 0, 1, 1,
0.1231766, -0.6880212, 2.640018, 0, 0, 0, 1, 1,
0.1257713, -0.4092264, 3.291398, 1, 1, 1, 1, 1,
0.1281743, 0.4768128, -0.2167549, 1, 1, 1, 1, 1,
0.1284754, 0.4082764, 0.5264688, 1, 1, 1, 1, 1,
0.129233, -1.835472, 2.104685, 1, 1, 1, 1, 1,
0.1329934, -1.027854, 4.916925, 1, 1, 1, 1, 1,
0.1368001, -0.15738, 1.182784, 1, 1, 1, 1, 1,
0.138423, -2.835298, 4.157043, 1, 1, 1, 1, 1,
0.1402146, 0.9882026, 0.2383925, 1, 1, 1, 1, 1,
0.1412562, 0.5368115, -2.47747, 1, 1, 1, 1, 1,
0.1413262, -1.569624, 3.971792, 1, 1, 1, 1, 1,
0.1470824, 0.4043066, 1.25233, 1, 1, 1, 1, 1,
0.1482337, -1.155585, 2.430665, 1, 1, 1, 1, 1,
0.1515421, -3.056741, 4.047021, 1, 1, 1, 1, 1,
0.1538566, -2.398532, 2.601247, 1, 1, 1, 1, 1,
0.1548092, 0.2642518, 0.2864489, 1, 1, 1, 1, 1,
0.1548364, -1.519866, 1.998133, 0, 0, 1, 1, 1,
0.1552005, -0.986137, 2.028696, 1, 0, 0, 1, 1,
0.1603931, 1.329743, 0.4862515, 1, 0, 0, 1, 1,
0.1616211, -0.6024811, 0.6585965, 1, 0, 0, 1, 1,
0.1622804, 0.8165132, -0.3562662, 1, 0, 0, 1, 1,
0.1632642, 1.454792, 1.604397, 1, 0, 0, 1, 1,
0.1655629, -0.2973261, 3.665543, 0, 0, 0, 1, 1,
0.1666919, -1.453616, 2.080055, 0, 0, 0, 1, 1,
0.1687076, -1.592716, 1.912823, 0, 0, 0, 1, 1,
0.1710791, -0.316625, 3.67425, 0, 0, 0, 1, 1,
0.1749173, -1.919526, 3.886391, 0, 0, 0, 1, 1,
0.1761321, 1.897171, 1.246213, 0, 0, 0, 1, 1,
0.1788072, -0.8385113, 1.465691, 0, 0, 0, 1, 1,
0.1793463, 1.92888, 0.3609746, 1, 1, 1, 1, 1,
0.1858307, -1.237167, 3.817042, 1, 1, 1, 1, 1,
0.1872732, -1.027958, 2.377077, 1, 1, 1, 1, 1,
0.1914057, 0.2539831, 0.307067, 1, 1, 1, 1, 1,
0.1954414, 0.4102482, -1.43514, 1, 1, 1, 1, 1,
0.1982189, 1.392672, 0.4743344, 1, 1, 1, 1, 1,
0.1996614, -0.08581244, 0.9258562, 1, 1, 1, 1, 1,
0.1996625, 0.6704803, -0.217952, 1, 1, 1, 1, 1,
0.2017859, 0.4278112, -0.3221352, 1, 1, 1, 1, 1,
0.2017944, -0.3888083, 2.125895, 1, 1, 1, 1, 1,
0.2027475, -0.2251707, 2.53117, 1, 1, 1, 1, 1,
0.2032617, -0.5874535, 1.889115, 1, 1, 1, 1, 1,
0.2033893, 0.5144014, 0.7431959, 1, 1, 1, 1, 1,
0.2051164, 0.2617149, 0.6325812, 1, 1, 1, 1, 1,
0.2055547, -0.1089723, 1.682711, 1, 1, 1, 1, 1,
0.2109779, 0.06404873, -0.01071403, 0, 0, 1, 1, 1,
0.2134234, 3.108783, -0.6090488, 1, 0, 0, 1, 1,
0.2138396, 0.9046142, 1.526597, 1, 0, 0, 1, 1,
0.2153986, 0.124587, 1.663553, 1, 0, 0, 1, 1,
0.2165281, -0.5766486, 3.653835, 1, 0, 0, 1, 1,
0.2170132, -0.206558, 0.7748242, 1, 0, 0, 1, 1,
0.2178971, -0.917956, 3.024871, 0, 0, 0, 1, 1,
0.2210761, 0.1125741, 3.167883, 0, 0, 0, 1, 1,
0.2238512, 0.7349466, 1.104957, 0, 0, 0, 1, 1,
0.2241181, 0.6870887, 0.8756725, 0, 0, 0, 1, 1,
0.2251308, -0.4935886, 3.292602, 0, 0, 0, 1, 1,
0.2254513, 0.5369241, 0.4587617, 0, 0, 0, 1, 1,
0.2282108, 0.4790015, 1.547871, 0, 0, 0, 1, 1,
0.2297002, 1.21253, 0.244768, 1, 1, 1, 1, 1,
0.233046, -0.2039533, 2.291664, 1, 1, 1, 1, 1,
0.2361907, -2.038533, 4.582877, 1, 1, 1, 1, 1,
0.2363574, -0.7896405, 1.335955, 1, 1, 1, 1, 1,
0.238845, 0.9997298, 0.6956644, 1, 1, 1, 1, 1,
0.2421178, 0.02568619, -0.3909594, 1, 1, 1, 1, 1,
0.2426726, -0.899069, 3.229523, 1, 1, 1, 1, 1,
0.2447323, 0.1448005, 0.1877111, 1, 1, 1, 1, 1,
0.2451363, -0.08755878, 0.4243656, 1, 1, 1, 1, 1,
0.2476416, -0.01018089, 2.064896, 1, 1, 1, 1, 1,
0.2503246, 0.02268755, 2.948967, 1, 1, 1, 1, 1,
0.2536337, 0.5527679, -0.5155157, 1, 1, 1, 1, 1,
0.2541173, -0.3105242, 1.959396, 1, 1, 1, 1, 1,
0.255068, -0.1262899, 0.7603186, 1, 1, 1, 1, 1,
0.2578337, -1.283177, 2.394414, 1, 1, 1, 1, 1,
0.2585225, 1.93696, 0.2142721, 0, 0, 1, 1, 1,
0.2603207, -0.5957376, 1.124525, 1, 0, 0, 1, 1,
0.2620069, 0.1169419, 1.40254, 1, 0, 0, 1, 1,
0.2621357, 0.7085848, 0.4987811, 1, 0, 0, 1, 1,
0.2624296, 1.491403, -1.378412, 1, 0, 0, 1, 1,
0.2678163, 0.1648939, 1.902549, 1, 0, 0, 1, 1,
0.2685248, 0.05763768, 2.733151, 0, 0, 0, 1, 1,
0.2831856, 0.3327944, 0.1880126, 0, 0, 0, 1, 1,
0.2833546, 1.156929, -0.5191916, 0, 0, 0, 1, 1,
0.2847583, -0.05408616, 1.754417, 0, 0, 0, 1, 1,
0.2848681, -0.2278457, 2.794724, 0, 0, 0, 1, 1,
0.2853774, 0.5377287, -0.8148593, 0, 0, 0, 1, 1,
0.2903908, 1.978878, -1.806772, 0, 0, 0, 1, 1,
0.294043, -1.088967, 3.636444, 1, 1, 1, 1, 1,
0.294965, -1.790798, 4.776362, 1, 1, 1, 1, 1,
0.2973131, -0.6216363, 2.878078, 1, 1, 1, 1, 1,
0.2983435, -0.8575671, 2.125532, 1, 1, 1, 1, 1,
0.3015853, 0.5368856, 1.578107, 1, 1, 1, 1, 1,
0.3039885, -0.7767477, 2.318946, 1, 1, 1, 1, 1,
0.3041887, -0.08361133, 2.984303, 1, 1, 1, 1, 1,
0.309523, 0.2987483, -1.568999, 1, 1, 1, 1, 1,
0.3168133, 0.4932672, 1.508279, 1, 1, 1, 1, 1,
0.320806, -0.077325, 4.519984, 1, 1, 1, 1, 1,
0.3240845, -0.6462236, 3.73419, 1, 1, 1, 1, 1,
0.3249671, 0.4691656, -0.03461712, 1, 1, 1, 1, 1,
0.3250005, 0.456099, 0.7341902, 1, 1, 1, 1, 1,
0.3286571, -0.02459935, 1.681718, 1, 1, 1, 1, 1,
0.3305235, 0.2666991, 0.2851647, 1, 1, 1, 1, 1,
0.3308331, -1.285179, 4.023694, 0, 0, 1, 1, 1,
0.3322949, 0.751225, 0.6775108, 1, 0, 0, 1, 1,
0.3416929, -1.002136, 4.555407, 1, 0, 0, 1, 1,
0.3522238, -1.668606, 3.712173, 1, 0, 0, 1, 1,
0.3621906, 0.3766042, 1.30273, 1, 0, 0, 1, 1,
0.3647618, 1.454055, -0.2056894, 1, 0, 0, 1, 1,
0.3652732, -2.284905, 1.409071, 0, 0, 0, 1, 1,
0.3722825, 0.6525042, 0.254802, 0, 0, 0, 1, 1,
0.3743027, -0.105871, 3.131709, 0, 0, 0, 1, 1,
0.376912, 0.5418649, -1.369495, 0, 0, 0, 1, 1,
0.3793677, -0.7135245, 2.348843, 0, 0, 0, 1, 1,
0.3802346, 0.5046288, 0.6780072, 0, 0, 0, 1, 1,
0.391648, -0.4152578, 3.560276, 0, 0, 0, 1, 1,
0.3970592, 0.6610282, 0.9715573, 1, 1, 1, 1, 1,
0.3997694, -0.07865531, 1.938271, 1, 1, 1, 1, 1,
0.4003854, 0.09070554, 1.186767, 1, 1, 1, 1, 1,
0.4016064, 0.8191739, -0.6238193, 1, 1, 1, 1, 1,
0.4062003, 1.433718, 0.3130925, 1, 1, 1, 1, 1,
0.4079749, 0.1343441, 0.4265923, 1, 1, 1, 1, 1,
0.4113618, -0.9789286, 0.9055182, 1, 1, 1, 1, 1,
0.4117103, 0.2030337, 1.180805, 1, 1, 1, 1, 1,
0.4134487, -1.624085, 3.820718, 1, 1, 1, 1, 1,
0.4137248, 2.482687, -2.799304, 1, 1, 1, 1, 1,
0.4141483, 1.492874, -0.6911614, 1, 1, 1, 1, 1,
0.4228019, -0.6040783, 4.449235, 1, 1, 1, 1, 1,
0.4248992, 0.4845078, 0.348312, 1, 1, 1, 1, 1,
0.4250661, -0.4618562, 2.886481, 1, 1, 1, 1, 1,
0.4269332, -2.406343, 3.292842, 1, 1, 1, 1, 1,
0.4295901, 1.139949, 0.3821799, 0, 0, 1, 1, 1,
0.4304559, 0.3925095, 0.7756, 1, 0, 0, 1, 1,
0.4308017, 1.105175, 0.3948664, 1, 0, 0, 1, 1,
0.4348069, 0.5653742, -0.9795822, 1, 0, 0, 1, 1,
0.4453653, 1.15039, 1.078746, 1, 0, 0, 1, 1,
0.450217, -0.7988108, 5.415435, 1, 0, 0, 1, 1,
0.4507248, 1.027337, 0.315984, 0, 0, 0, 1, 1,
0.4511659, 0.4405403, 1.158288, 0, 0, 0, 1, 1,
0.4518267, -0.3030224, 0.3346116, 0, 0, 0, 1, 1,
0.4530225, 0.5846756, 0.3347726, 0, 0, 0, 1, 1,
0.4531919, 1.145731, 0.5035913, 0, 0, 0, 1, 1,
0.4583845, -1.941711, 2.180179, 0, 0, 0, 1, 1,
0.4659813, -0.3795116, 0.9986401, 0, 0, 0, 1, 1,
0.470738, 0.06636089, 2.592727, 1, 1, 1, 1, 1,
0.4778152, 0.4547806, 0.8110552, 1, 1, 1, 1, 1,
0.4822635, 0.05967645, 2.088964, 1, 1, 1, 1, 1,
0.4851032, 1.065996, -0.7362039, 1, 1, 1, 1, 1,
0.4857865, -1.281794, 2.986185, 1, 1, 1, 1, 1,
0.4947635, 1.93066, 0.3700506, 1, 1, 1, 1, 1,
0.5037978, 0.3835981, 0.543804, 1, 1, 1, 1, 1,
0.5083916, -1.527787, 2.193992, 1, 1, 1, 1, 1,
0.512997, 0.5096704, 0.572324, 1, 1, 1, 1, 1,
0.5138283, 0.07108083, 1.346644, 1, 1, 1, 1, 1,
0.520506, 1.388606, -0.9310194, 1, 1, 1, 1, 1,
0.5221305, -1.572457, 2.332242, 1, 1, 1, 1, 1,
0.5275381, -0.1183688, 1.515337, 1, 1, 1, 1, 1,
0.5334365, -0.8857753, 3.299843, 1, 1, 1, 1, 1,
0.5345445, -0.8694858, 4.337197, 1, 1, 1, 1, 1,
0.5464816, 0.7455707, -0.6617499, 0, 0, 1, 1, 1,
0.5464816, 2.02336, 0.1383765, 1, 0, 0, 1, 1,
0.5533668, -0.1434074, 2.850969, 1, 0, 0, 1, 1,
0.5654002, 0.9888026, -0.392518, 1, 0, 0, 1, 1,
0.5667904, 1.257008, 2.252866, 1, 0, 0, 1, 1,
0.5769412, -1.670922, 2.282704, 1, 0, 0, 1, 1,
0.5805985, -0.1217006, 3.975004, 0, 0, 0, 1, 1,
0.5836918, -0.5688698, 2.619906, 0, 0, 0, 1, 1,
0.5843916, 0.3552258, 0.8986356, 0, 0, 0, 1, 1,
0.5886042, -0.3092932, 1.961651, 0, 0, 0, 1, 1,
0.5998236, -0.7556185, 3.123249, 0, 0, 0, 1, 1,
0.6020627, -0.7988714, 2.898338, 0, 0, 0, 1, 1,
0.6050031, 0.8622967, 0.9978708, 0, 0, 0, 1, 1,
0.6055813, -0.6962193, 2.90501, 1, 1, 1, 1, 1,
0.6066285, -1.464665, 3.066968, 1, 1, 1, 1, 1,
0.608371, -1.158658, 2.280943, 1, 1, 1, 1, 1,
0.6084656, -1.724239, 2.730019, 1, 1, 1, 1, 1,
0.609899, 0.9627458, 0.1808977, 1, 1, 1, 1, 1,
0.6172773, -0.03701202, 0.4860411, 1, 1, 1, 1, 1,
0.6180829, 0.320195, 0.2718683, 1, 1, 1, 1, 1,
0.6252659, 0.1118785, 2.781572, 1, 1, 1, 1, 1,
0.6302084, 0.1126483, 0.6958777, 1, 1, 1, 1, 1,
0.6393739, -2.154688, 3.628907, 1, 1, 1, 1, 1,
0.6396724, -1.242826, 3.259191, 1, 1, 1, 1, 1,
0.6410376, -0.5662295, 1.556185, 1, 1, 1, 1, 1,
0.6452452, -1.148368, 1.228825, 1, 1, 1, 1, 1,
0.6495035, 0.139816, 1.3178, 1, 1, 1, 1, 1,
0.6630893, -0.07769048, 1.741076, 1, 1, 1, 1, 1,
0.6699921, 0.06756689, 0.585097, 0, 0, 1, 1, 1,
0.6750222, 1.177132, 1.203952, 1, 0, 0, 1, 1,
0.6776069, -0.3473402, 2.14056, 1, 0, 0, 1, 1,
0.6785108, -0.4636033, 2.165176, 1, 0, 0, 1, 1,
0.6808048, -0.2809255, 2.251631, 1, 0, 0, 1, 1,
0.6833499, 1.85226, -0.7898593, 1, 0, 0, 1, 1,
0.6851931, -2.792669, 4.413958, 0, 0, 0, 1, 1,
0.6912232, -1.534811, 5.102456, 0, 0, 0, 1, 1,
0.692663, 0.5390208, 3.1348, 0, 0, 0, 1, 1,
0.6932331, -0.7021337, 2.735915, 0, 0, 0, 1, 1,
0.6937497, 1.728213, 0.3099791, 0, 0, 0, 1, 1,
0.6990271, 0.5802196, 1.617049, 0, 0, 0, 1, 1,
0.7018014, 1.741345, 0.1645738, 0, 0, 0, 1, 1,
0.7057412, -1.841398, 1.130776, 1, 1, 1, 1, 1,
0.7088493, 0.4669152, 0.3826329, 1, 1, 1, 1, 1,
0.7098699, 0.6651865, 2.401353, 1, 1, 1, 1, 1,
0.7117424, 0.3494015, 1.766611, 1, 1, 1, 1, 1,
0.7117602, -0.1637216, 2.317297, 1, 1, 1, 1, 1,
0.7209727, -0.5335912, 0.9839673, 1, 1, 1, 1, 1,
0.7284661, 0.06227831, 2.658537, 1, 1, 1, 1, 1,
0.7326564, 1.159804, 1.665943, 1, 1, 1, 1, 1,
0.7351401, -1.02321, 1.196826, 1, 1, 1, 1, 1,
0.7381526, -0.330837, 1.850155, 1, 1, 1, 1, 1,
0.7386854, 1.119778, 0.4352322, 1, 1, 1, 1, 1,
0.7407702, -0.940965, 2.246639, 1, 1, 1, 1, 1,
0.7424365, -2.532906, 0.7093571, 1, 1, 1, 1, 1,
0.7434421, 0.9653238, -1.016129, 1, 1, 1, 1, 1,
0.7454097, 1.288197, 0.2738694, 1, 1, 1, 1, 1,
0.7482894, 1.1054, 1.803707, 0, 0, 1, 1, 1,
0.7540182, 0.1456424, 3.119797, 1, 0, 0, 1, 1,
0.7550808, 0.7718978, 1.764694, 1, 0, 0, 1, 1,
0.7551816, 0.0292031, 1.553068, 1, 0, 0, 1, 1,
0.7566485, -0.2658451, 1.546446, 1, 0, 0, 1, 1,
0.7591494, 0.1859128, -1.184326, 1, 0, 0, 1, 1,
0.767084, -1.75545, 1.524533, 0, 0, 0, 1, 1,
0.7690883, -0.8954471, 2.997449, 0, 0, 0, 1, 1,
0.7707705, -0.5891978, 1.174394, 0, 0, 0, 1, 1,
0.7721348, -0.5632155, 2.54261, 0, 0, 0, 1, 1,
0.7758896, -2.061973, 3.276633, 0, 0, 0, 1, 1,
0.7766825, -0.8816416, 0.6850731, 0, 0, 0, 1, 1,
0.7770803, 0.9054553, 1.56762, 0, 0, 0, 1, 1,
0.7781848, -0.9602267, 2.701718, 1, 1, 1, 1, 1,
0.7837532, -1.754662, 1.672577, 1, 1, 1, 1, 1,
0.785212, -0.1341064, 2.922498, 1, 1, 1, 1, 1,
0.7947341, -0.2220138, 2.439138, 1, 1, 1, 1, 1,
0.7950028, -1.710593, 2.588816, 1, 1, 1, 1, 1,
0.7951451, -0.3044637, 2.806089, 1, 1, 1, 1, 1,
0.7973123, -0.5719175, 2.977382, 1, 1, 1, 1, 1,
0.8098315, 0.2699577, 1.282692, 1, 1, 1, 1, 1,
0.8128538, -1.28472, 4.150165, 1, 1, 1, 1, 1,
0.8168439, -0.04737276, 2.80364, 1, 1, 1, 1, 1,
0.8244873, -0.7241064, 1.792109, 1, 1, 1, 1, 1,
0.8273308, 1.086797, 0.607347, 1, 1, 1, 1, 1,
0.8320184, -0.1863783, 2.9771, 1, 1, 1, 1, 1,
0.8464608, -0.3451202, 2.933068, 1, 1, 1, 1, 1,
0.8536221, -0.1272247, 2.606223, 1, 1, 1, 1, 1,
0.8579724, -0.2189288, 2.110885, 0, 0, 1, 1, 1,
0.8591557, -0.3864239, 3.303762, 1, 0, 0, 1, 1,
0.8595873, -0.8375462, 1.586459, 1, 0, 0, 1, 1,
0.8634676, -0.04682466, 0.6359015, 1, 0, 0, 1, 1,
0.8645995, 0.3677727, -0.1199345, 1, 0, 0, 1, 1,
0.8656735, -0.313291, 0.3164248, 1, 0, 0, 1, 1,
0.8667231, -1.181147, 2.088729, 0, 0, 0, 1, 1,
0.8676901, 1.112461, 1.877058, 0, 0, 0, 1, 1,
0.8708526, 0.7597485, 1.109749, 0, 0, 0, 1, 1,
0.8724909, -0.3208442, 1.449328, 0, 0, 0, 1, 1,
0.8725069, 0.2633988, -0.1063436, 0, 0, 0, 1, 1,
0.8763797, 2.674278, -0.3824819, 0, 0, 0, 1, 1,
0.8779782, -0.4874163, 1.97777, 0, 0, 0, 1, 1,
0.8813569, -0.2795957, 1.831286, 1, 1, 1, 1, 1,
0.8867425, 0.2656368, 0.5026816, 1, 1, 1, 1, 1,
0.8874686, 0.6048459, 1.046516, 1, 1, 1, 1, 1,
0.8904756, 0.397827, 0.4976569, 1, 1, 1, 1, 1,
0.8920885, 0.2055687, 2.878571, 1, 1, 1, 1, 1,
0.8935551, 0.9186387, 1.115503, 1, 1, 1, 1, 1,
0.8936763, -1.920055, 3.780762, 1, 1, 1, 1, 1,
0.8948283, -1.668052, 1.829511, 1, 1, 1, 1, 1,
0.903337, 0.5861043, 1.377674, 1, 1, 1, 1, 1,
0.9039454, -0.1188173, 1.367549, 1, 1, 1, 1, 1,
0.9049642, 0.4728525, -1.08748, 1, 1, 1, 1, 1,
0.9095561, -1.361114, 3.630414, 1, 1, 1, 1, 1,
0.9116399, -0.233273, 2.521328, 1, 1, 1, 1, 1,
0.9124344, 0.1320278, 3.502279, 1, 1, 1, 1, 1,
0.9228592, -0.4470865, 1.161436, 1, 1, 1, 1, 1,
0.924397, 0.8365229, 0.8864351, 0, 0, 1, 1, 1,
0.9251643, 0.9003093, -0.2083218, 1, 0, 0, 1, 1,
0.9275412, 0.1376498, 0.3372142, 1, 0, 0, 1, 1,
0.9371098, -0.4107273, 0.7434148, 1, 0, 0, 1, 1,
0.9386889, -0.2449169, 2.64258, 1, 0, 0, 1, 1,
0.9451746, -1.073617, 3.643615, 1, 0, 0, 1, 1,
0.9497964, 0.8185865, 0.9638181, 0, 0, 0, 1, 1,
0.954957, 0.2699742, -0.3044544, 0, 0, 0, 1, 1,
0.9725671, 1.582742, 0.1041538, 0, 0, 0, 1, 1,
0.9737185, -0.2952948, 0.9407176, 0, 0, 0, 1, 1,
0.9778082, 0.4300554, 0.8925907, 0, 0, 0, 1, 1,
0.9802356, 0.2747146, 1.3523, 0, 0, 0, 1, 1,
0.9810306, -1.45174, 3.432467, 0, 0, 0, 1, 1,
0.9863474, 0.9684103, 0.3743922, 1, 1, 1, 1, 1,
0.9911615, 0.6838465, -0.1369347, 1, 1, 1, 1, 1,
0.9949695, 1.3798, 0.486075, 1, 1, 1, 1, 1,
0.9950496, -0.2284889, 1.191233, 1, 1, 1, 1, 1,
0.9985659, 0.1319209, 3.049763, 1, 1, 1, 1, 1,
0.9989158, 0.09721067, 2.659244, 1, 1, 1, 1, 1,
1.010126, 0.991513, -0.1749975, 1, 1, 1, 1, 1,
1.011024, -0.5149521, 2.284302, 1, 1, 1, 1, 1,
1.033442, -0.1858268, 1.984574, 1, 1, 1, 1, 1,
1.034834, -1.814315, 3.51531, 1, 1, 1, 1, 1,
1.054123, 0.9208542, 0.2545604, 1, 1, 1, 1, 1,
1.055753, -0.0215275, 1.966421, 1, 1, 1, 1, 1,
1.058748, -0.574598, 2.561502, 1, 1, 1, 1, 1,
1.059332, -0.802668, 2.711637, 1, 1, 1, 1, 1,
1.059737, 0.6486806, 1.685138, 1, 1, 1, 1, 1,
1.071176, 1.243046, 0.6066157, 0, 0, 1, 1, 1,
1.07545, 0.209545, -0.4657805, 1, 0, 0, 1, 1,
1.076336, 1.655522, 0.6972946, 1, 0, 0, 1, 1,
1.079843, 0.7986742, 1.649276, 1, 0, 0, 1, 1,
1.08443, -0.0374734, 2.537409, 1, 0, 0, 1, 1,
1.090615, 0.04415328, 1.371258, 1, 0, 0, 1, 1,
1.091008, -0.861101, 2.611663, 0, 0, 0, 1, 1,
1.093147, 0.9665625, 0.3945266, 0, 0, 0, 1, 1,
1.093436, 2.2805, -0.173355, 0, 0, 0, 1, 1,
1.101095, 1.399719, 1.231287, 0, 0, 0, 1, 1,
1.104947, 0.232207, 0.6339926, 0, 0, 0, 1, 1,
1.105484, -0.6913148, 1.426172, 0, 0, 0, 1, 1,
1.106428, 0.5014048, 1.27218, 0, 0, 0, 1, 1,
1.10939, -1.400877, 2.860022, 1, 1, 1, 1, 1,
1.112181, -1.359072, 1.985193, 1, 1, 1, 1, 1,
1.112399, -1.112507, 1.682853, 1, 1, 1, 1, 1,
1.112753, 0.4215851, 2.720703, 1, 1, 1, 1, 1,
1.122544, -0.5573575, 2.836961, 1, 1, 1, 1, 1,
1.123082, 1.004473, 0.3647268, 1, 1, 1, 1, 1,
1.123952, 0.2787339, 2.028534, 1, 1, 1, 1, 1,
1.14429, 0.6093188, 2.68516, 1, 1, 1, 1, 1,
1.145534, -0.2028805, 1.719465, 1, 1, 1, 1, 1,
1.147811, -1.747203, 3.503436, 1, 1, 1, 1, 1,
1.157395, -0.5106634, 2.549353, 1, 1, 1, 1, 1,
1.158801, -0.3444483, 2.099782, 1, 1, 1, 1, 1,
1.163171, -0.722952, 3.214961, 1, 1, 1, 1, 1,
1.178121, -1.160184, 2.74762, 1, 1, 1, 1, 1,
1.179527, 1.638099, 2.088068, 1, 1, 1, 1, 1,
1.181789, 0.0999639, -0.2895674, 0, 0, 1, 1, 1,
1.191842, 1.029881, 3.10997, 1, 0, 0, 1, 1,
1.19352, -0.3513839, 2.240103, 1, 0, 0, 1, 1,
1.193851, -0.94021, 2.881808, 1, 0, 0, 1, 1,
1.196343, -1.419287, 2.380537, 1, 0, 0, 1, 1,
1.214166, 1.135515, 0.5453374, 1, 0, 0, 1, 1,
1.217647, 1.550796, -1.095426, 0, 0, 0, 1, 1,
1.218678, -0.3415661, 2.456941, 0, 0, 0, 1, 1,
1.227498, 0.2990307, 0.3622519, 0, 0, 0, 1, 1,
1.238776, -0.4409316, 1.59429, 0, 0, 0, 1, 1,
1.24083, -1.026844, 4.05441, 0, 0, 0, 1, 1,
1.25226, 0.3700867, 0.9490394, 0, 0, 0, 1, 1,
1.256813, -0.9651363, 1.357859, 0, 0, 0, 1, 1,
1.263266, -0.5947696, 1.494447, 1, 1, 1, 1, 1,
1.264321, 1.344846, -0.2059492, 1, 1, 1, 1, 1,
1.268721, 0.2993766, 3.146781, 1, 1, 1, 1, 1,
1.273711, 0.2058753, 1.346419, 1, 1, 1, 1, 1,
1.274638, 2.111451, -1.195755, 1, 1, 1, 1, 1,
1.281789, 1.634039, 0.8489555, 1, 1, 1, 1, 1,
1.284642, -0.6226779, 3.184152, 1, 1, 1, 1, 1,
1.298667, 1.004958, 1.498794, 1, 1, 1, 1, 1,
1.306656, 1.07445, 0.7725623, 1, 1, 1, 1, 1,
1.313171, 0.7598788, 1.918968, 1, 1, 1, 1, 1,
1.313475, 0.3825586, 3.546907, 1, 1, 1, 1, 1,
1.323603, 0.0660369, -0.3459781, 1, 1, 1, 1, 1,
1.331676, -0.7713159, 2.286291, 1, 1, 1, 1, 1,
1.333331, 1.162209, 0.9420277, 1, 1, 1, 1, 1,
1.337931, -0.7701305, 2.65373, 1, 1, 1, 1, 1,
1.343023, 1.150046, -0.4284618, 0, 0, 1, 1, 1,
1.354042, -0.4920147, 2.753438, 1, 0, 0, 1, 1,
1.358145, 0.2638593, 0.8352659, 1, 0, 0, 1, 1,
1.36551, 1.282562, -0.7819501, 1, 0, 0, 1, 1,
1.375855, -0.4985681, 0.7982831, 1, 0, 0, 1, 1,
1.398679, 0.6213387, 0.09393294, 1, 0, 0, 1, 1,
1.400044, 0.04352197, 0.7838865, 0, 0, 0, 1, 1,
1.408335, -2.276525, 2.364956, 0, 0, 0, 1, 1,
1.429846, -0.1194255, 1.261781, 0, 0, 0, 1, 1,
1.431182, -1.671071, 2.571099, 0, 0, 0, 1, 1,
1.444961, -0.7107666, 1.416809, 0, 0, 0, 1, 1,
1.453819, -0.4023519, 1.22612, 0, 0, 0, 1, 1,
1.454785, -0.7560135, 2.323919, 0, 0, 0, 1, 1,
1.465047, 1.557549, -0.297392, 1, 1, 1, 1, 1,
1.474825, 0.6139295, 3.061193, 1, 1, 1, 1, 1,
1.477858, 0.152135, 0.8404847, 1, 1, 1, 1, 1,
1.479757, -0.8113994, 2.154591, 1, 1, 1, 1, 1,
1.482306, -0.08087379, 1.266811, 1, 1, 1, 1, 1,
1.485167, -0.3222537, 1.724552, 1, 1, 1, 1, 1,
1.492567, -1.599703, 2.115847, 1, 1, 1, 1, 1,
1.508148, -0.08843569, 1.950893, 1, 1, 1, 1, 1,
1.516063, 0.5749261, 1.239812, 1, 1, 1, 1, 1,
1.524672, 0.02971988, -1.012007, 1, 1, 1, 1, 1,
1.525435, 0.4860963, 1.949419, 1, 1, 1, 1, 1,
1.535087, 1.204501, 0.8763334, 1, 1, 1, 1, 1,
1.538656, 1.395154, 1.118132, 1, 1, 1, 1, 1,
1.540415, -0.584245, 1.067494, 1, 1, 1, 1, 1,
1.541374, 0.294881, 1.469699, 1, 1, 1, 1, 1,
1.546727, 0.4429329, 1.786326, 0, 0, 1, 1, 1,
1.547933, -0.5154702, 2.144001, 1, 0, 0, 1, 1,
1.553653, 0.6657257, 1.86777, 1, 0, 0, 1, 1,
1.56311, 0.6058814, 2.674524, 1, 0, 0, 1, 1,
1.578024, -0.4816859, 1.897025, 1, 0, 0, 1, 1,
1.57862, 0.652101, 0.9769801, 1, 0, 0, 1, 1,
1.596461, -0.1057011, 1.603775, 0, 0, 0, 1, 1,
1.606447, -1.233414, 3.253709, 0, 0, 0, 1, 1,
1.620309, 0.2742769, 1.905316, 0, 0, 0, 1, 1,
1.638433, -1.801092, 3.714723, 0, 0, 0, 1, 1,
1.641061, -0.09789011, 2.915483, 0, 0, 0, 1, 1,
1.651735, 1.158135, 0.5291774, 0, 0, 0, 1, 1,
1.652143, -0.04564279, 0.3028777, 0, 0, 0, 1, 1,
1.652408, -0.1276383, 0.8264461, 1, 1, 1, 1, 1,
1.652798, -1.305443, 1.041834, 1, 1, 1, 1, 1,
1.655429, 0.4877223, 2.516414, 1, 1, 1, 1, 1,
1.658253, 0.2825216, -0.4317392, 1, 1, 1, 1, 1,
1.662192, -1.069796, 3.238458, 1, 1, 1, 1, 1,
1.66514, 0.08396959, 2.563425, 1, 1, 1, 1, 1,
1.670506, -0.5883969, 2.02473, 1, 1, 1, 1, 1,
1.671513, 0.5371041, 1.128948, 1, 1, 1, 1, 1,
1.681352, 0.4770449, 1.481958, 1, 1, 1, 1, 1,
1.683882, -0.4936158, 2.940532, 1, 1, 1, 1, 1,
1.694306, 0.7160989, 1.314167, 1, 1, 1, 1, 1,
1.699483, -0.9340038, 2.450708, 1, 1, 1, 1, 1,
1.703067, 0.2003064, 0.7510781, 1, 1, 1, 1, 1,
1.712498, 0.5301705, 1.167782, 1, 1, 1, 1, 1,
1.734433, 1.017293, 0.2674947, 1, 1, 1, 1, 1,
1.736504, 1.163162, 0.9494621, 0, 0, 1, 1, 1,
1.752323, -0.5951431, 0.6521761, 1, 0, 0, 1, 1,
1.758388, 0.2536864, -0.7025841, 1, 0, 0, 1, 1,
1.765635, -1.680127, 3.413589, 1, 0, 0, 1, 1,
1.767844, 0.002849368, 2.865017, 1, 0, 0, 1, 1,
1.780174, -1.147559, 1.526166, 1, 0, 0, 1, 1,
1.804549, -0.2308221, 1.604461, 0, 0, 0, 1, 1,
1.810903, -1.232513, 3.56314, 0, 0, 0, 1, 1,
1.834866, 0.6167338, 0.8952075, 0, 0, 0, 1, 1,
1.850381, 0.3715084, 1.612477, 0, 0, 0, 1, 1,
1.860874, -0.3482675, 3.265703, 0, 0, 0, 1, 1,
1.874171, -0.638217, 0.74994, 0, 0, 0, 1, 1,
1.890629, 0.4258432, 1.483301, 0, 0, 0, 1, 1,
1.892973, -0.6374904, 0.1265259, 1, 1, 1, 1, 1,
1.905685, -0.1520928, 2.441117, 1, 1, 1, 1, 1,
1.906015, -1.153245, 1.649073, 1, 1, 1, 1, 1,
1.9317, 1.707691, 1.994589, 1, 1, 1, 1, 1,
1.98661, 0.6832208, 0.2564302, 1, 1, 1, 1, 1,
2.005137, 1.011201, 1.044988, 1, 1, 1, 1, 1,
2.027309, 1.140544, 2.00759, 1, 1, 1, 1, 1,
2.059577, 1.268768, 1.834392, 1, 1, 1, 1, 1,
2.082827, -0.6232257, 3.489806, 1, 1, 1, 1, 1,
2.088966, 1.827812, 1.231933, 1, 1, 1, 1, 1,
2.11734, -1.401972, 1.764023, 1, 1, 1, 1, 1,
2.125471, 0.09619824, 0.7664376, 1, 1, 1, 1, 1,
2.128684, -0.6264402, 3.477547, 1, 1, 1, 1, 1,
2.161782, -0.9009989, 0.1046351, 1, 1, 1, 1, 1,
2.192959, -0.5951882, 2.275758, 1, 1, 1, 1, 1,
2.22954, -0.2122478, 1.167553, 0, 0, 1, 1, 1,
2.23064, -0.8285226, 2.521549, 1, 0, 0, 1, 1,
2.234439, 0.9614756, 1.340594, 1, 0, 0, 1, 1,
2.243229, -2.100874, 1.565277, 1, 0, 0, 1, 1,
2.246145, -0.1578128, 3.819683, 1, 0, 0, 1, 1,
2.269675, 2.08419, 0.5836652, 1, 0, 0, 1, 1,
2.273193, -0.3369789, 1.781169, 0, 0, 0, 1, 1,
2.276347, 0.3965404, 2.140726, 0, 0, 0, 1, 1,
2.285877, 0.04953511, 1.021891, 0, 0, 0, 1, 1,
2.341878, 1.590722, 2.041311, 0, 0, 0, 1, 1,
2.364881, -1.205651, 2.424907, 0, 0, 0, 1, 1,
2.365684, 0.5546881, 1.441863, 0, 0, 0, 1, 1,
2.380068, 0.6535074, 2.271279, 0, 0, 0, 1, 1,
2.479642, -0.2665233, 0.9613091, 1, 1, 1, 1, 1,
2.620657, -0.8559327, 1.636955, 1, 1, 1, 1, 1,
2.677434, 0.1136034, 1.026761, 1, 1, 1, 1, 1,
2.85694, -0.6886308, -0.06667662, 1, 1, 1, 1, 1,
3.011081, -1.879655, 1.091974, 1, 1, 1, 1, 1,
3.093122, 1.302432, 2.132804, 1, 1, 1, 1, 1,
3.302307, -0.2832279, 2.20286, 1, 1, 1, 1, 1
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
var radius = 9.943809;
var distance = 34.92721;
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
mvMatrix.translate( -0.1908414, -0.026021, 0.2338085 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.92721);
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
