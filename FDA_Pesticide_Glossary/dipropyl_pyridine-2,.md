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
-3.046572, 1.05902, -0.4579156, 1, 0, 0, 1,
-2.761226, 0.09813423, -3.499809, 1, 0.007843138, 0, 1,
-2.734812, -0.9194387, -2.295716, 1, 0.01176471, 0, 1,
-2.580946, 0.1147141, -1.179453, 1, 0.01960784, 0, 1,
-2.498362, -2.468659, -3.558083, 1, 0.02352941, 0, 1,
-2.472509, -0.8703311, -1.476325, 1, 0.03137255, 0, 1,
-2.467801, 0.5858213, -2.240453, 1, 0.03529412, 0, 1,
-2.463935, -0.3815573, -1.634017, 1, 0.04313726, 0, 1,
-2.419533, -0.08303679, -2.770681, 1, 0.04705882, 0, 1,
-2.350262, 0.5730969, -0.6499007, 1, 0.05490196, 0, 1,
-2.344123, 0.6762837, -1.396993, 1, 0.05882353, 0, 1,
-2.286673, -0.6801962, -2.14693, 1, 0.06666667, 0, 1,
-2.25882, -0.9529344, -1.40085, 1, 0.07058824, 0, 1,
-2.210783, 0.05255206, -1.92062, 1, 0.07843138, 0, 1,
-2.178641, 0.8163565, -2.002812, 1, 0.08235294, 0, 1,
-2.170949, 1.042811, 1.001188, 1, 0.09019608, 0, 1,
-2.147734, -0.4959881, -3.275643, 1, 0.09411765, 0, 1,
-2.123649, 0.04032233, 0.5164146, 1, 0.1019608, 0, 1,
-2.091069, -1.455051, -1.529168, 1, 0.1098039, 0, 1,
-2.090638, -0.4421451, -1.88097, 1, 0.1137255, 0, 1,
-2.063783, -0.7962984, -2.209003, 1, 0.1215686, 0, 1,
-2.036197, -1.598627, -2.062963, 1, 0.1254902, 0, 1,
-2.032816, -0.2709582, -2.638087, 1, 0.1333333, 0, 1,
-2.022998, 2.054787, -0.006650319, 1, 0.1372549, 0, 1,
-2.010279, 0.1060198, 0.0003321599, 1, 0.145098, 0, 1,
-1.995412, 0.5314476, -0.1217383, 1, 0.1490196, 0, 1,
-1.971813, 0.1984825, -0.88962, 1, 0.1568628, 0, 1,
-1.96431, 1.21351, -0.9744605, 1, 0.1607843, 0, 1,
-1.930188, 0.6066192, 0.006326139, 1, 0.1686275, 0, 1,
-1.918565, -0.7910925, -2.164861, 1, 0.172549, 0, 1,
-1.877119, 0.3280772, -2.162512, 1, 0.1803922, 0, 1,
-1.867022, -0.707622, -2.249513, 1, 0.1843137, 0, 1,
-1.863638, -0.4235671, -2.823755, 1, 0.1921569, 0, 1,
-1.856467, 1.320589, -0.9797801, 1, 0.1960784, 0, 1,
-1.854875, -1.529774, -2.693886, 1, 0.2039216, 0, 1,
-1.840919, 1.738868, -0.3479458, 1, 0.2117647, 0, 1,
-1.830878, -0.7572178, -2.560241, 1, 0.2156863, 0, 1,
-1.809143, 0.2846042, -0.9082468, 1, 0.2235294, 0, 1,
-1.774227, 0.3369206, -0.9611678, 1, 0.227451, 0, 1,
-1.771208, 0.6972113, -1.400727, 1, 0.2352941, 0, 1,
-1.768081, -0.8261119, -1.382659, 1, 0.2392157, 0, 1,
-1.746663, -1.858719, -3.233468, 1, 0.2470588, 0, 1,
-1.740701, -0.1693285, 0.5067713, 1, 0.2509804, 0, 1,
-1.721307, 0.1356183, -0.9285927, 1, 0.2588235, 0, 1,
-1.717215, -0.4399694, -2.287937, 1, 0.2627451, 0, 1,
-1.679765, 0.3247844, -1.061108, 1, 0.2705882, 0, 1,
-1.678332, -0.2330157, -3.197991, 1, 0.2745098, 0, 1,
-1.640919, 1.075191, -1.340044, 1, 0.282353, 0, 1,
-1.620699, -0.4108907, -0.5469849, 1, 0.2862745, 0, 1,
-1.605859, 1.079943, 0.9183856, 1, 0.2941177, 0, 1,
-1.604384, -0.8376237, -1.851975, 1, 0.3019608, 0, 1,
-1.601741, -0.2014866, -0.1118076, 1, 0.3058824, 0, 1,
-1.588794, 1.153469, -0.5870057, 1, 0.3137255, 0, 1,
-1.577396, -0.2716344, -0.07754041, 1, 0.3176471, 0, 1,
-1.569384, -1.893972, -2.56409, 1, 0.3254902, 0, 1,
-1.566874, 0.305788, -0.6321204, 1, 0.3294118, 0, 1,
-1.557141, 1.823083, -1.087533, 1, 0.3372549, 0, 1,
-1.55318, 0.927028, -0.5360845, 1, 0.3411765, 0, 1,
-1.549964, 0.6703308, -0.9570874, 1, 0.3490196, 0, 1,
-1.531938, -1.259711, -1.902924, 1, 0.3529412, 0, 1,
-1.528393, -0.2376856, -1.186691, 1, 0.3607843, 0, 1,
-1.513643, -1.193711, -3.214776, 1, 0.3647059, 0, 1,
-1.505427, -0.1830493, -2.271915, 1, 0.372549, 0, 1,
-1.497011, 0.1622241, -2.932337, 1, 0.3764706, 0, 1,
-1.489055, -2.600496, -1.491102, 1, 0.3843137, 0, 1,
-1.472633, -0.63459, -3.617366, 1, 0.3882353, 0, 1,
-1.460291, 0.186475, 1.416644, 1, 0.3960784, 0, 1,
-1.444919, 0.9735137, -1.897355, 1, 0.4039216, 0, 1,
-1.419282, -1.550096, -3.235301, 1, 0.4078431, 0, 1,
-1.414511, -2.084413, -4.050954, 1, 0.4156863, 0, 1,
-1.40589, 0.7129789, -0.6246309, 1, 0.4196078, 0, 1,
-1.403038, -0.6753513, -2.363068, 1, 0.427451, 0, 1,
-1.398529, -1.48758, -1.592482, 1, 0.4313726, 0, 1,
-1.380748, -0.6051502, -2.11883, 1, 0.4392157, 0, 1,
-1.376687, -1.255621, -2.547944, 1, 0.4431373, 0, 1,
-1.365075, 0.7454641, -0.811536, 1, 0.4509804, 0, 1,
-1.361999, 1.299305, -1.291305, 1, 0.454902, 0, 1,
-1.351177, -1.556293, -3.021939, 1, 0.4627451, 0, 1,
-1.342007, 1.226109, -1.144521, 1, 0.4666667, 0, 1,
-1.336662, 1.401202, -0.4462243, 1, 0.4745098, 0, 1,
-1.32975, -0.2004849, -2.419418, 1, 0.4784314, 0, 1,
-1.329038, 1.491463, -1.881022, 1, 0.4862745, 0, 1,
-1.32474, -0.2929942, -2.469276, 1, 0.4901961, 0, 1,
-1.324206, -0.02495746, -1.331672, 1, 0.4980392, 0, 1,
-1.318706, -2.002847, -2.092136, 1, 0.5058824, 0, 1,
-1.316319, 0.9995757, -1.401077, 1, 0.509804, 0, 1,
-1.314165, -0.8698536, -3.175525, 1, 0.5176471, 0, 1,
-1.313994, -1.269524, -1.507784, 1, 0.5215687, 0, 1,
-1.313219, 1.409354, 0.3334697, 1, 0.5294118, 0, 1,
-1.30805, -0.6442475, -0.5565814, 1, 0.5333334, 0, 1,
-1.304407, -1.19076, -0.950563, 1, 0.5411765, 0, 1,
-1.281701, 0.2236868, -1.932227, 1, 0.5450981, 0, 1,
-1.280652, -0.7694393, -0.5418363, 1, 0.5529412, 0, 1,
-1.272932, -0.4439955, -1.143779, 1, 0.5568628, 0, 1,
-1.272518, -0.802202, -2.464596, 1, 0.5647059, 0, 1,
-1.229051, 0.5403654, -0.4378928, 1, 0.5686275, 0, 1,
-1.22582, -1.455583, -1.339136, 1, 0.5764706, 0, 1,
-1.21717, 1.302865, -1.532199, 1, 0.5803922, 0, 1,
-1.213022, 0.09763179, -2.510689, 1, 0.5882353, 0, 1,
-1.210831, 3.622484, -0.5484648, 1, 0.5921569, 0, 1,
-1.203866, 0.7834569, -1.492219, 1, 0.6, 0, 1,
-1.202376, -0.3004032, -2.396657, 1, 0.6078432, 0, 1,
-1.191244, 1.121261, 0.1751795, 1, 0.6117647, 0, 1,
-1.186181, 1.1963, 0.9619719, 1, 0.6196079, 0, 1,
-1.185433, 1.041568, -0.2064705, 1, 0.6235294, 0, 1,
-1.185359, 1.869743, 0.1044303, 1, 0.6313726, 0, 1,
-1.183283, 0.7943678, -0.948112, 1, 0.6352941, 0, 1,
-1.174543, -0.4296348, -2.560857, 1, 0.6431373, 0, 1,
-1.163603, -0.4040191, -1.403109, 1, 0.6470588, 0, 1,
-1.161511, -0.6288808, -1.997851, 1, 0.654902, 0, 1,
-1.159696, -0.8474583, -3.100289, 1, 0.6588235, 0, 1,
-1.158304, -1.120061, -1.682055, 1, 0.6666667, 0, 1,
-1.158174, -0.3551686, -1.366386, 1, 0.6705883, 0, 1,
-1.157688, -0.2392872, -1.95348, 1, 0.6784314, 0, 1,
-1.153164, -0.6239229, -2.377565, 1, 0.682353, 0, 1,
-1.152054, -0.8793914, -1.493991, 1, 0.6901961, 0, 1,
-1.150009, -0.002232213, -1.014529, 1, 0.6941177, 0, 1,
-1.146798, -0.4705199, -1.888759, 1, 0.7019608, 0, 1,
-1.142754, -0.5513118, -3.019608, 1, 0.7098039, 0, 1,
-1.139209, 0.6746634, -1.243464, 1, 0.7137255, 0, 1,
-1.129856, 0.6137481, -1.480076, 1, 0.7215686, 0, 1,
-1.121327, -1.223456, -1.583048, 1, 0.7254902, 0, 1,
-1.118224, 0.1279298, -2.816643, 1, 0.7333333, 0, 1,
-1.112624, -2.250596, -3.000654, 1, 0.7372549, 0, 1,
-1.093452, 0.02775103, -2.889615, 1, 0.7450981, 0, 1,
-1.092503, 0.2322986, 0.2096535, 1, 0.7490196, 0, 1,
-1.081165, -0.5327191, -1.493025, 1, 0.7568628, 0, 1,
-1.078991, -0.09193783, -1.461733, 1, 0.7607843, 0, 1,
-1.077986, -0.506434, -0.9557571, 1, 0.7686275, 0, 1,
-1.07568, -0.9694545, -3.108349, 1, 0.772549, 0, 1,
-1.074601, -0.3680099, -1.787859, 1, 0.7803922, 0, 1,
-1.071275, -0.325034, -1.666215, 1, 0.7843137, 0, 1,
-1.064044, 0.6006243, -0.8387365, 1, 0.7921569, 0, 1,
-1.062996, 0.09252998, -2.773323, 1, 0.7960784, 0, 1,
-1.0608, 0.8028378, -1.643686, 1, 0.8039216, 0, 1,
-1.052759, 1.667885, 0.08661905, 1, 0.8117647, 0, 1,
-1.038532, 0.7898413, 0.8543982, 1, 0.8156863, 0, 1,
-1.033405, 0.4509392, -1.800665, 1, 0.8235294, 0, 1,
-1.033338, -0.5714767, -3.66781, 1, 0.827451, 0, 1,
-1.02964, -0.3975694, -1.025369, 1, 0.8352941, 0, 1,
-1.024553, 1.658844, -0.679707, 1, 0.8392157, 0, 1,
-1.023643, 0.9212472, -2.327039, 1, 0.8470588, 0, 1,
-1.019503, -0.02086337, -2.542011, 1, 0.8509804, 0, 1,
-1.014167, -0.8071737, -2.082067, 1, 0.8588235, 0, 1,
-1.012454, -0.4189247, -2.567418, 1, 0.8627451, 0, 1,
-1.01233, 0.2068247, -1.9255, 1, 0.8705882, 0, 1,
-1.007006, 0.1571025, -2.465569, 1, 0.8745098, 0, 1,
-1.004298, -2.151747, -2.180971, 1, 0.8823529, 0, 1,
-1.001995, 0.6573456, -1.577635, 1, 0.8862745, 0, 1,
-1.000521, 0.6625059, -0.4216804, 1, 0.8941177, 0, 1,
-0.9950738, 0.9112874, -0.2398248, 1, 0.8980392, 0, 1,
-0.9903761, 1.823751, -1.187049, 1, 0.9058824, 0, 1,
-0.9887091, 2.259407, -0.02199862, 1, 0.9137255, 0, 1,
-0.9854217, 0.2385806, -2.919316, 1, 0.9176471, 0, 1,
-0.9851343, -1.093616, -2.526925, 1, 0.9254902, 0, 1,
-0.9850914, -0.9507884, -1.278601, 1, 0.9294118, 0, 1,
-0.9842725, -0.2853799, -2.607504, 1, 0.9372549, 0, 1,
-0.9819711, -1.015103, -0.2699921, 1, 0.9411765, 0, 1,
-0.9760739, 2.370169, -0.2083749, 1, 0.9490196, 0, 1,
-0.9674765, -0.485245, -2.751701, 1, 0.9529412, 0, 1,
-0.96448, -0.329442, -0.09980401, 1, 0.9607843, 0, 1,
-0.9613402, 0.7672696, -3.776608, 1, 0.9647059, 0, 1,
-0.952823, 0.3729773, -1.127192, 1, 0.972549, 0, 1,
-0.9518633, -1.545702, -2.498346, 1, 0.9764706, 0, 1,
-0.9482937, -0.1001415, -1.340682, 1, 0.9843137, 0, 1,
-0.944667, -1.981791, -3.091136, 1, 0.9882353, 0, 1,
-0.942465, -0.6447536, -2.097458, 1, 0.9960784, 0, 1,
-0.9398341, 0.3191884, -1.88391, 0.9960784, 1, 0, 1,
-0.9397572, 0.3542838, -0.8545616, 0.9921569, 1, 0, 1,
-0.9388981, -0.1050937, -0.9698627, 0.9843137, 1, 0, 1,
-0.9343149, -0.4161725, -0.4890544, 0.9803922, 1, 0, 1,
-0.9338334, 0.4966264, -1.538154, 0.972549, 1, 0, 1,
-0.9318051, -0.771727, -3.129686, 0.9686275, 1, 0, 1,
-0.93077, 0.06105966, -0.5914866, 0.9607843, 1, 0, 1,
-0.9265171, 0.272022, -1.010583, 0.9568627, 1, 0, 1,
-0.9222941, -1.73105, -2.127253, 0.9490196, 1, 0, 1,
-0.9193434, 1.408664, 1.416782, 0.945098, 1, 0, 1,
-0.9173893, 0.3770529, -1.237435, 0.9372549, 1, 0, 1,
-0.9153208, -1.961684, -3.333683, 0.9333333, 1, 0, 1,
-0.9147033, 0.7974396, -0.9228787, 0.9254902, 1, 0, 1,
-0.9105997, 0.8381798, 0.04925239, 0.9215686, 1, 0, 1,
-0.9087294, 0.8719174, -0.06450538, 0.9137255, 1, 0, 1,
-0.9005095, -1.000847, -1.404736, 0.9098039, 1, 0, 1,
-0.8984057, -2.265681, -1.836778, 0.9019608, 1, 0, 1,
-0.88171, 0.3699133, -2.800607, 0.8941177, 1, 0, 1,
-0.8715002, -1.397935, -2.903155, 0.8901961, 1, 0, 1,
-0.8684466, -1.555241, -1.637972, 0.8823529, 1, 0, 1,
-0.8663068, -1.159588, -2.954365, 0.8784314, 1, 0, 1,
-0.8648673, 0.9165571, -0.06553005, 0.8705882, 1, 0, 1,
-0.8537357, 0.3704456, -1.258808, 0.8666667, 1, 0, 1,
-0.8524343, 1.586462, 0.2486413, 0.8588235, 1, 0, 1,
-0.8432611, 1.498731, -0.9119802, 0.854902, 1, 0, 1,
-0.8402897, -0.9483045, -3.106896, 0.8470588, 1, 0, 1,
-0.8357844, -0.4934587, -2.321662, 0.8431373, 1, 0, 1,
-0.826291, -0.04353791, -1.012579, 0.8352941, 1, 0, 1,
-0.8261276, -0.4167011, -2.932736, 0.8313726, 1, 0, 1,
-0.8209274, 0.9631101, -1.401736, 0.8235294, 1, 0, 1,
-0.8082877, -0.6535127, -1.627146, 0.8196079, 1, 0, 1,
-0.8065183, -0.3618367, -1.984228, 0.8117647, 1, 0, 1,
-0.8014542, -0.3159989, -3.031919, 0.8078431, 1, 0, 1,
-0.8004872, -0.827291, -3.637982, 0.8, 1, 0, 1,
-0.799772, -1.304746, -1.456175, 0.7921569, 1, 0, 1,
-0.7968096, 0.09434382, -1.059793, 0.7882353, 1, 0, 1,
-0.795409, 0.2198522, -1.721992, 0.7803922, 1, 0, 1,
-0.7828707, -0.741766, -3.328178, 0.7764706, 1, 0, 1,
-0.7778196, 0.08515574, -2.257047, 0.7686275, 1, 0, 1,
-0.7767793, 1.065811, -1.091059, 0.7647059, 1, 0, 1,
-0.7758246, 0.3006092, -0.8108945, 0.7568628, 1, 0, 1,
-0.7725752, 0.00788147, -1.177743, 0.7529412, 1, 0, 1,
-0.7704511, -0.231374, -0.6628079, 0.7450981, 1, 0, 1,
-0.7664164, -0.8131814, -1.745833, 0.7411765, 1, 0, 1,
-0.7628502, 0.7448773, -0.45443, 0.7333333, 1, 0, 1,
-0.7589492, 0.9682729, -0.7383402, 0.7294118, 1, 0, 1,
-0.7574084, 1.011518, -2.776714, 0.7215686, 1, 0, 1,
-0.7464469, -0.4896933, -0.4386823, 0.7176471, 1, 0, 1,
-0.7452681, -1.203773, -3.566313, 0.7098039, 1, 0, 1,
-0.7437174, 0.5765005, -0.4990865, 0.7058824, 1, 0, 1,
-0.743108, 0.1399257, -1.156086, 0.6980392, 1, 0, 1,
-0.7426769, -2.877913, -1.288095, 0.6901961, 1, 0, 1,
-0.7420704, 0.6205131, -0.3435988, 0.6862745, 1, 0, 1,
-0.7399503, 0.3224034, -2.498607, 0.6784314, 1, 0, 1,
-0.7398524, 0.6310959, -0.9671698, 0.6745098, 1, 0, 1,
-0.7349244, 0.6375915, -1.42861, 0.6666667, 1, 0, 1,
-0.7346352, -0.02564271, -2.121921, 0.6627451, 1, 0, 1,
-0.7333823, -0.1335418, -2.257384, 0.654902, 1, 0, 1,
-0.7311521, 0.1629836, -0.9484444, 0.6509804, 1, 0, 1,
-0.7264029, 1.995359, 0.5567151, 0.6431373, 1, 0, 1,
-0.7194369, 0.7269951, -0.5599904, 0.6392157, 1, 0, 1,
-0.7173564, 2.347933, -0.7353469, 0.6313726, 1, 0, 1,
-0.7078871, 1.988173, 0.6798376, 0.627451, 1, 0, 1,
-0.7050107, 0.8476294, -0.355256, 0.6196079, 1, 0, 1,
-0.7038784, 0.09062231, -0.5139592, 0.6156863, 1, 0, 1,
-0.7003617, -0.05299186, -1.266968, 0.6078432, 1, 0, 1,
-0.695883, 1.207704, 0.1832704, 0.6039216, 1, 0, 1,
-0.6951749, 0.04478223, -1.965414, 0.5960785, 1, 0, 1,
-0.6918213, 0.02911298, -1.703105, 0.5882353, 1, 0, 1,
-0.683616, -1.08989, -3.56619, 0.5843138, 1, 0, 1,
-0.6784487, 1.181184, 0.1524981, 0.5764706, 1, 0, 1,
-0.673757, 1.329674, 0.4241226, 0.572549, 1, 0, 1,
-0.669217, -2.36814, -3.576147, 0.5647059, 1, 0, 1,
-0.6679307, -1.010637, -1.938625, 0.5607843, 1, 0, 1,
-0.667013, -0.01569809, -2.565617, 0.5529412, 1, 0, 1,
-0.6667996, 0.3636586, 0.468323, 0.5490196, 1, 0, 1,
-0.6664602, 0.8233122, 0.3979525, 0.5411765, 1, 0, 1,
-0.6652793, 1.180521, -1.58816, 0.5372549, 1, 0, 1,
-0.6590499, -0.4663995, -2.764954, 0.5294118, 1, 0, 1,
-0.6548845, 1.147249, -0.5409427, 0.5254902, 1, 0, 1,
-0.6540861, -0.3121393, -1.860991, 0.5176471, 1, 0, 1,
-0.6490704, -1.70591, -2.313863, 0.5137255, 1, 0, 1,
-0.6486122, -1.049416, -2.152694, 0.5058824, 1, 0, 1,
-0.6472046, -0.1120974, -2.881104, 0.5019608, 1, 0, 1,
-0.6449946, 2.705768, -0.6893231, 0.4941176, 1, 0, 1,
-0.6413997, -0.8305643, -2.371984, 0.4862745, 1, 0, 1,
-0.6407298, -0.1761151, -0.1644581, 0.4823529, 1, 0, 1,
-0.6353865, -0.6109085, -1.894097, 0.4745098, 1, 0, 1,
-0.6317482, -0.2688382, -0.907037, 0.4705882, 1, 0, 1,
-0.6316257, 0.3034189, -0.6438449, 0.4627451, 1, 0, 1,
-0.6307506, 1.422627, 1.570583, 0.4588235, 1, 0, 1,
-0.628885, 0.2999913, -1.993997, 0.4509804, 1, 0, 1,
-0.6139108, 0.7527079, -1.21297, 0.4470588, 1, 0, 1,
-0.6092713, 0.712906, -1.434824, 0.4392157, 1, 0, 1,
-0.6082321, -0.1913716, -2.232544, 0.4352941, 1, 0, 1,
-0.6027116, 1.368839, -1.107596, 0.427451, 1, 0, 1,
-0.6024133, -1.427302, -3.224515, 0.4235294, 1, 0, 1,
-0.6005915, -0.2912478, -0.676155, 0.4156863, 1, 0, 1,
-0.5897781, -0.4669355, -2.206993, 0.4117647, 1, 0, 1,
-0.5809264, -0.04062323, -0.9117975, 0.4039216, 1, 0, 1,
-0.5786459, 0.2295492, -0.4046607, 0.3960784, 1, 0, 1,
-0.5776156, 0.3776558, -0.4292424, 0.3921569, 1, 0, 1,
-0.5757794, -0.3427537, -2.532898, 0.3843137, 1, 0, 1,
-0.569236, -1.288875, -2.729491, 0.3803922, 1, 0, 1,
-0.5672685, -0.2099356, -2.349122, 0.372549, 1, 0, 1,
-0.5664077, 0.7037743, -2.965072, 0.3686275, 1, 0, 1,
-0.5656923, 2.320706, -0.09932593, 0.3607843, 1, 0, 1,
-0.5604379, 1.019012, -0.920406, 0.3568628, 1, 0, 1,
-0.5601746, -1.33543, -2.93606, 0.3490196, 1, 0, 1,
-0.5580226, 1.140208, -0.8451976, 0.345098, 1, 0, 1,
-0.5562788, -0.5180231, -1.789348, 0.3372549, 1, 0, 1,
-0.5542977, -1.944511, -3.167469, 0.3333333, 1, 0, 1,
-0.553932, -0.5408803, -2.237665, 0.3254902, 1, 0, 1,
-0.5482874, -0.5808002, -2.489929, 0.3215686, 1, 0, 1,
-0.5453716, -1.708146, -3.006819, 0.3137255, 1, 0, 1,
-0.5450704, -0.9349813, -1.965557, 0.3098039, 1, 0, 1,
-0.5446928, 0.4434586, -2.339537, 0.3019608, 1, 0, 1,
-0.5444543, -0.4904051, -1.163685, 0.2941177, 1, 0, 1,
-0.5414079, -0.3984058, -1.586665, 0.2901961, 1, 0, 1,
-0.535072, -1.20024, -3.273625, 0.282353, 1, 0, 1,
-0.5335802, -0.5477007, -2.342564, 0.2784314, 1, 0, 1,
-0.5327491, 1.70869, 2.018072, 0.2705882, 1, 0, 1,
-0.5305958, 0.1490814, -2.218467, 0.2666667, 1, 0, 1,
-0.5218964, -0.5715357, -1.566455, 0.2588235, 1, 0, 1,
-0.5207246, -0.4864914, -1.91389, 0.254902, 1, 0, 1,
-0.5189329, 1.191388, -0.2420087, 0.2470588, 1, 0, 1,
-0.5181044, 0.5214705, -1.742473, 0.2431373, 1, 0, 1,
-0.5136939, 0.06216393, -1.096, 0.2352941, 1, 0, 1,
-0.5084201, -0.1005163, -3.248669, 0.2313726, 1, 0, 1,
-0.5043523, 1.125547, -1.659488, 0.2235294, 1, 0, 1,
-0.5035121, -1.28531, -3.937581, 0.2196078, 1, 0, 1,
-0.5014161, 0.8960798, -1.838353, 0.2117647, 1, 0, 1,
-0.5011528, 0.4616084, -0.1516755, 0.2078431, 1, 0, 1,
-0.4969999, 0.07083955, -1.533075, 0.2, 1, 0, 1,
-0.4964997, -0.234303, -1.996078, 0.1921569, 1, 0, 1,
-0.496166, -0.01863694, -3.344481, 0.1882353, 1, 0, 1,
-0.4938135, -0.04100195, -2.720016, 0.1803922, 1, 0, 1,
-0.4937643, -1.746152, -3.46219, 0.1764706, 1, 0, 1,
-0.4926877, -0.7738, -3.993444, 0.1686275, 1, 0, 1,
-0.4904253, 1.128111, -1.222843, 0.1647059, 1, 0, 1,
-0.4894319, 1.858353, 1.396188, 0.1568628, 1, 0, 1,
-0.4874898, 0.6145129, -0.4813184, 0.1529412, 1, 0, 1,
-0.4833041, 1.600934, 0.09603648, 0.145098, 1, 0, 1,
-0.4831157, 0.8034253, -0.3656072, 0.1411765, 1, 0, 1,
-0.4823708, -0.343926, -1.237083, 0.1333333, 1, 0, 1,
-0.4774667, 0.3922052, 0.4562325, 0.1294118, 1, 0, 1,
-0.4748731, 0.01435785, -1.586746, 0.1215686, 1, 0, 1,
-0.4730415, -0.2004278, -1.561239, 0.1176471, 1, 0, 1,
-0.4683592, -0.1909883, -2.982024, 0.1098039, 1, 0, 1,
-0.4670997, -0.1968211, -1.616951, 0.1058824, 1, 0, 1,
-0.4658634, 0.2648199, -0.6228256, 0.09803922, 1, 0, 1,
-0.4633227, 1.057841, -0.3818594, 0.09019608, 1, 0, 1,
-0.4609062, -0.4410516, -1.445545, 0.08627451, 1, 0, 1,
-0.4571974, -0.9420129, -3.244786, 0.07843138, 1, 0, 1,
-0.4513109, 1.06562, 0.4834225, 0.07450981, 1, 0, 1,
-0.4481704, -0.6680719, -1.784518, 0.06666667, 1, 0, 1,
-0.4467711, -0.3844249, -2.634545, 0.0627451, 1, 0, 1,
-0.4455835, -1.68642, -2.46372, 0.05490196, 1, 0, 1,
-0.4413209, 1.52558, 2.004432, 0.05098039, 1, 0, 1,
-0.4347791, 1.562192, -0.2501796, 0.04313726, 1, 0, 1,
-0.4315767, -0.4197528, -2.180022, 0.03921569, 1, 0, 1,
-0.4289628, 0.7794996, -0.2625832, 0.03137255, 1, 0, 1,
-0.4283812, -1.735917, -1.932408, 0.02745098, 1, 0, 1,
-0.4283172, 0.9635589, 0.8137035, 0.01960784, 1, 0, 1,
-0.4274803, -1.428786, -3.777654, 0.01568628, 1, 0, 1,
-0.4274172, 0.9789758, 0.9614505, 0.007843138, 1, 0, 1,
-0.4247609, -0.5656652, -3.020927, 0.003921569, 1, 0, 1,
-0.4220196, 0.1554473, -2.498211, 0, 1, 0.003921569, 1,
-0.4195852, -0.4552939, -2.292491, 0, 1, 0.01176471, 1,
-0.4188186, 1.387931, 0.8154635, 0, 1, 0.01568628, 1,
-0.4182777, 0.3504254, -1.998278, 0, 1, 0.02352941, 1,
-0.4181602, -0.5422276, -1.741987, 0, 1, 0.02745098, 1,
-0.4106836, -1.338462, -1.549417, 0, 1, 0.03529412, 1,
-0.4080414, 1.20602, 0.965, 0, 1, 0.03921569, 1,
-0.4032878, 0.03468344, -0.9992911, 0, 1, 0.04705882, 1,
-0.4027891, 1.590495, -3.503572, 0, 1, 0.05098039, 1,
-0.4017864, 0.2914837, 0.485543, 0, 1, 0.05882353, 1,
-0.3989768, 0.9494902, -1.601162, 0, 1, 0.0627451, 1,
-0.3881026, 0.3829665, -1.90981, 0, 1, 0.07058824, 1,
-0.3861222, -0.01027151, -1.852677, 0, 1, 0.07450981, 1,
-0.3815157, 1.040369, -0.3135613, 0, 1, 0.08235294, 1,
-0.3811285, 0.6397502, -0.8429466, 0, 1, 0.08627451, 1,
-0.3803281, -0.3937186, -0.5213255, 0, 1, 0.09411765, 1,
-0.3798201, -2.624871, -2.561292, 0, 1, 0.1019608, 1,
-0.3746875, -1.853644, -3.502243, 0, 1, 0.1058824, 1,
-0.3655508, 1.175444, -0.9841513, 0, 1, 0.1137255, 1,
-0.3646488, -0.07548948, -2.725256, 0, 1, 0.1176471, 1,
-0.3637021, -1.141035, -3.538075, 0, 1, 0.1254902, 1,
-0.3633412, -1.717105, -2.914045, 0, 1, 0.1294118, 1,
-0.3608767, -0.219521, -1.272164, 0, 1, 0.1372549, 1,
-0.3607051, 0.1488234, -1.12348, 0, 1, 0.1411765, 1,
-0.3578936, -0.07197143, -3.26051, 0, 1, 0.1490196, 1,
-0.3577586, 0.3237508, -1.081546, 0, 1, 0.1529412, 1,
-0.3573999, 0.4948377, -1.31936, 0, 1, 0.1607843, 1,
-0.3565606, 0.2192225, -0.7507637, 0, 1, 0.1647059, 1,
-0.3462311, 0.5035722, -0.8115379, 0, 1, 0.172549, 1,
-0.3456933, 1.161405, -0.6761612, 0, 1, 0.1764706, 1,
-0.3456079, -1.503538, -3.241397, 0, 1, 0.1843137, 1,
-0.3453256, 1.065332, 0.6404743, 0, 1, 0.1882353, 1,
-0.3442278, 1.141413, -0.6764019, 0, 1, 0.1960784, 1,
-0.3435332, -1.325712, -2.064202, 0, 1, 0.2039216, 1,
-0.3430624, 0.3011487, -1.738327, 0, 1, 0.2078431, 1,
-0.3310995, -0.261673, -2.389933, 0, 1, 0.2156863, 1,
-0.3303005, -1.68675, -1.684864, 0, 1, 0.2196078, 1,
-0.3249283, 0.2294339, -1.725415, 0, 1, 0.227451, 1,
-0.3241962, 0.9872575, -0.02837416, 0, 1, 0.2313726, 1,
-0.3192723, -2.41458, -2.100783, 0, 1, 0.2392157, 1,
-0.317564, 1.206851, -0.4201864, 0, 1, 0.2431373, 1,
-0.3167323, 0.920675, 0.5849922, 0, 1, 0.2509804, 1,
-0.3078023, -0.8112571, -4.87319, 0, 1, 0.254902, 1,
-0.3048158, 0.1753207, -1.526653, 0, 1, 0.2627451, 1,
-0.3036117, -1.476335, -0.7793639, 0, 1, 0.2666667, 1,
-0.3024123, 0.8761731, -0.6953445, 0, 1, 0.2745098, 1,
-0.3022657, -0.003000122, -2.504605, 0, 1, 0.2784314, 1,
-0.3014589, -0.8136172, -3.30178, 0, 1, 0.2862745, 1,
-0.2983938, 2.100226, -1.703283, 0, 1, 0.2901961, 1,
-0.2852315, 2.07654, 0.1952734, 0, 1, 0.2980392, 1,
-0.284437, -0.2273984, -1.589191, 0, 1, 0.3058824, 1,
-0.2841923, -0.469562, -4.535426, 0, 1, 0.3098039, 1,
-0.2824141, -1.714797, -3.33591, 0, 1, 0.3176471, 1,
-0.2795484, 0.09866099, -2.400348, 0, 1, 0.3215686, 1,
-0.2754491, -0.6604711, -2.800652, 0, 1, 0.3294118, 1,
-0.2730256, -0.3493335, -3.058257, 0, 1, 0.3333333, 1,
-0.2698642, -0.1426756, 0.2820984, 0, 1, 0.3411765, 1,
-0.2692113, 1.998667, 1.044477, 0, 1, 0.345098, 1,
-0.2650043, 0.9265846, -0.1789868, 0, 1, 0.3529412, 1,
-0.2638642, -1.348439, -2.790404, 0, 1, 0.3568628, 1,
-0.2631199, 0.05649073, -2.485002, 0, 1, 0.3647059, 1,
-0.2621512, -0.4633403, -2.598766, 0, 1, 0.3686275, 1,
-0.2464464, 1.403397, 0.5012117, 0, 1, 0.3764706, 1,
-0.2454739, 0.3791219, -0.8596408, 0, 1, 0.3803922, 1,
-0.2400074, 1.636286, 1.788834, 0, 1, 0.3882353, 1,
-0.2398523, -0.9281423, -3.735425, 0, 1, 0.3921569, 1,
-0.238927, 1.280085, -1.047713, 0, 1, 0.4, 1,
-0.2341659, -2.234321, -4.861422, 0, 1, 0.4078431, 1,
-0.2323481, 0.5723549, -0.6181647, 0, 1, 0.4117647, 1,
-0.2314981, -0.8995135, -2.12413, 0, 1, 0.4196078, 1,
-0.2310496, 2.089283, 0.2991518, 0, 1, 0.4235294, 1,
-0.2251192, -0.1768533, -1.309356, 0, 1, 0.4313726, 1,
-0.2230265, -0.8901917, -4.544917, 0, 1, 0.4352941, 1,
-0.2213232, -0.881848, -4.525197, 0, 1, 0.4431373, 1,
-0.2192697, -1.140651, -3.34584, 0, 1, 0.4470588, 1,
-0.2184414, 0.671319, -0.6598763, 0, 1, 0.454902, 1,
-0.2163809, 1.566776, -1.6419, 0, 1, 0.4588235, 1,
-0.2120203, 0.09141906, -1.312325, 0, 1, 0.4666667, 1,
-0.2104224, 0.4669349, 0.9313799, 0, 1, 0.4705882, 1,
-0.2103662, -1.875271, -2.635357, 0, 1, 0.4784314, 1,
-0.2069802, -0.883637, -2.610843, 0, 1, 0.4823529, 1,
-0.205957, 1.847222, 0.5966425, 0, 1, 0.4901961, 1,
-0.2048739, 1.484067, -0.03779786, 0, 1, 0.4941176, 1,
-0.204021, 2.176796, -0.9820833, 0, 1, 0.5019608, 1,
-0.1996471, -0.402966, -2.42797, 0, 1, 0.509804, 1,
-0.1973294, -0.3987141, -1.702219, 0, 1, 0.5137255, 1,
-0.1947775, 0.2028154, -2.00826, 0, 1, 0.5215687, 1,
-0.1914917, 0.2988736, -0.6040327, 0, 1, 0.5254902, 1,
-0.1900393, -1.059109, -4.685341, 0, 1, 0.5333334, 1,
-0.1890948, 1.138248, -0.3472935, 0, 1, 0.5372549, 1,
-0.1879869, 1.286915, -0.3014017, 0, 1, 0.5450981, 1,
-0.1879492, 0.3636935, -0.2914842, 0, 1, 0.5490196, 1,
-0.1856171, -1.845496, -3.055248, 0, 1, 0.5568628, 1,
-0.1839652, -1.089967, -3.375955, 0, 1, 0.5607843, 1,
-0.1763922, -1.741958, -3.990697, 0, 1, 0.5686275, 1,
-0.1757376, -1.624143, -3.590691, 0, 1, 0.572549, 1,
-0.1718105, 0.609503, -0.4068813, 0, 1, 0.5803922, 1,
-0.1685435, 0.2744326, -0.02009426, 0, 1, 0.5843138, 1,
-0.1675183, 0.2446068, 0.7791112, 0, 1, 0.5921569, 1,
-0.1669642, -0.622443, -2.920015, 0, 1, 0.5960785, 1,
-0.1596863, -0.8647155, -2.353498, 0, 1, 0.6039216, 1,
-0.1579078, -0.2513302, -3.37763, 0, 1, 0.6117647, 1,
-0.1570058, 1.032644, -0.4214785, 0, 1, 0.6156863, 1,
-0.1555965, -0.3980659, -1.050812, 0, 1, 0.6235294, 1,
-0.1546726, 0.1830761, -1.901114, 0, 1, 0.627451, 1,
-0.1543551, -1.399968, -2.517328, 0, 1, 0.6352941, 1,
-0.1504099, 0.2800601, 0.8827964, 0, 1, 0.6392157, 1,
-0.1497961, 0.6481225, 1.397999, 0, 1, 0.6470588, 1,
-0.1465491, 0.4809677, 0.193369, 0, 1, 0.6509804, 1,
-0.1458077, -1.111033, -3.528831, 0, 1, 0.6588235, 1,
-0.1442056, 0.991887, -0.1881029, 0, 1, 0.6627451, 1,
-0.143212, 0.4829504, -0.1015621, 0, 1, 0.6705883, 1,
-0.1415197, -1.301625, -3.944417, 0, 1, 0.6745098, 1,
-0.1409377, 0.1996937, -2.459642, 0, 1, 0.682353, 1,
-0.1382188, 0.8849149, 0.08868822, 0, 1, 0.6862745, 1,
-0.1342883, -0.2915222, -2.412075, 0, 1, 0.6941177, 1,
-0.1303128, -0.8387181, -3.54113, 0, 1, 0.7019608, 1,
-0.1292191, 0.8206617, 0.8849568, 0, 1, 0.7058824, 1,
-0.1289066, 0.4636935, -0.5161783, 0, 1, 0.7137255, 1,
-0.1278834, -0.797374, -2.628877, 0, 1, 0.7176471, 1,
-0.1246935, 1.383042, 0.4540027, 0, 1, 0.7254902, 1,
-0.1175139, 0.06150765, -1.540358, 0, 1, 0.7294118, 1,
-0.1172745, 1.211067, 1.347301, 0, 1, 0.7372549, 1,
-0.1119035, 1.403212, 0.5469374, 0, 1, 0.7411765, 1,
-0.1087721, -1.032103, -2.989423, 0, 1, 0.7490196, 1,
-0.1066971, 0.7694058, 0.9696481, 0, 1, 0.7529412, 1,
-0.1052108, -0.7416428, -1.29634, 0, 1, 0.7607843, 1,
-0.1008194, -0.3890199, -2.107853, 0, 1, 0.7647059, 1,
-0.1005759, 1.825133, -0.167268, 0, 1, 0.772549, 1,
-0.09674682, -0.9394161, -2.845047, 0, 1, 0.7764706, 1,
-0.09337693, 1.25951, 0.8727496, 0, 1, 0.7843137, 1,
-0.09263381, -0.1598063, -1.599514, 0, 1, 0.7882353, 1,
-0.09031203, -0.1657714, -1.82972, 0, 1, 0.7960784, 1,
-0.08905736, 0.2348779, -0.9929277, 0, 1, 0.8039216, 1,
-0.08743518, -1.246156, -3.754816, 0, 1, 0.8078431, 1,
-0.08700556, 0.2956009, -0.9191558, 0, 1, 0.8156863, 1,
-0.08154414, -0.5439679, -4.743274, 0, 1, 0.8196079, 1,
-0.07969885, 0.00107071, -0.9822506, 0, 1, 0.827451, 1,
-0.07957987, -0.2874363, -2.733475, 0, 1, 0.8313726, 1,
-0.07505267, 0.1992769, -0.2765784, 0, 1, 0.8392157, 1,
-0.07200954, -0.4362579, -2.250609, 0, 1, 0.8431373, 1,
-0.07190991, 0.7343446, -0.4629392, 0, 1, 0.8509804, 1,
-0.06993338, -0.9960468, -2.402756, 0, 1, 0.854902, 1,
-0.06853352, 0.3227486, -1.272544, 0, 1, 0.8627451, 1,
-0.06759812, 0.6724855, -0.8463279, 0, 1, 0.8666667, 1,
-0.06170713, 1.225336, 0.5740338, 0, 1, 0.8745098, 1,
-0.04934897, 0.2670214, 0.6462234, 0, 1, 0.8784314, 1,
-0.04219431, 1.197838, -0.7227935, 0, 1, 0.8862745, 1,
-0.04165607, 0.8475336, 1.256267, 0, 1, 0.8901961, 1,
-0.04076139, 0.4420844, 1.555068, 0, 1, 0.8980392, 1,
-0.03835655, 0.7072279, 0.3655108, 0, 1, 0.9058824, 1,
-0.03785541, -0.1852898, -2.867956, 0, 1, 0.9098039, 1,
-0.03777939, -0.7578364, -2.964553, 0, 1, 0.9176471, 1,
-0.03657175, -0.07968213, -2.596729, 0, 1, 0.9215686, 1,
-0.03573592, 1.847607, 0.2762683, 0, 1, 0.9294118, 1,
-0.03372075, 0.8919257, -1.50245, 0, 1, 0.9333333, 1,
-0.03150479, 1.449458, 0.7898627, 0, 1, 0.9411765, 1,
-0.02965484, -0.08179277, -1.836636, 0, 1, 0.945098, 1,
-0.02797378, 0.006610774, -0.4359471, 0, 1, 0.9529412, 1,
-0.02522965, 0.7674336, -0.1522092, 0, 1, 0.9568627, 1,
-0.01992518, 0.3681197, 1.255036, 0, 1, 0.9647059, 1,
-0.01980864, -0.04035144, -1.723488, 0, 1, 0.9686275, 1,
-0.01397284, -1.833724, -2.595434, 0, 1, 0.9764706, 1,
-0.009545037, 0.469104, -0.05086283, 0, 1, 0.9803922, 1,
-0.003271326, 1.840001, -0.5025209, 0, 1, 0.9882353, 1,
-0.002760079, 0.3252857, 0.5112188, 0, 1, 0.9921569, 1,
-0.002732079, 0.6201507, -1.019787, 0, 1, 1, 1,
-0.0004469506, -0.09970693, -2.802615, 0, 0.9921569, 1, 1,
-0.0001892343, -1.253488, -2.313694, 0, 0.9882353, 1, 1,
0.001110334, -0.8126292, 3.419057, 0, 0.9803922, 1, 1,
0.001942615, -0.628501, 2.07643, 0, 0.9764706, 1, 1,
0.00686873, -1.420524, 2.657517, 0, 0.9686275, 1, 1,
0.009868721, -0.7809353, 3.278788, 0, 0.9647059, 1, 1,
0.0109543, 1.027046, 0.3013991, 0, 0.9568627, 1, 1,
0.01480364, 1.172252, -0.2129072, 0, 0.9529412, 1, 1,
0.02148173, 1.695939, -0.5093735, 0, 0.945098, 1, 1,
0.0224902, -0.8662663, 4.77739, 0, 0.9411765, 1, 1,
0.02317725, -0.01346654, 1.095385, 0, 0.9333333, 1, 1,
0.02724664, 0.8813314, -0.3578747, 0, 0.9294118, 1, 1,
0.02990721, 0.07453461, 2.095931, 0, 0.9215686, 1, 1,
0.03213304, 0.3845938, 0.5383859, 0, 0.9176471, 1, 1,
0.0373245, 0.1480361, 0.319129, 0, 0.9098039, 1, 1,
0.04284181, 0.7898632, 1.015682, 0, 0.9058824, 1, 1,
0.04400461, -1.772339, 4.680742, 0, 0.8980392, 1, 1,
0.04414178, -0.4927985, 3.526927, 0, 0.8901961, 1, 1,
0.04685926, -0.6844704, 2.451544, 0, 0.8862745, 1, 1,
0.0484548, 0.2393911, 0.3231371, 0, 0.8784314, 1, 1,
0.04973608, -0.8051346, 2.396894, 0, 0.8745098, 1, 1,
0.05366946, -1.038544, 4.868653, 0, 0.8666667, 1, 1,
0.05381999, 1.434048, -0.462836, 0, 0.8627451, 1, 1,
0.05728371, -0.948186, 3.13422, 0, 0.854902, 1, 1,
0.06199856, 1.618633, -0.6276956, 0, 0.8509804, 1, 1,
0.06392389, -0.6464577, 4.069044, 0, 0.8431373, 1, 1,
0.0656089, -1.630277, 4.190459, 0, 0.8392157, 1, 1,
0.07056011, -2.106125, 2.933424, 0, 0.8313726, 1, 1,
0.07159645, 1.113634, -0.7409453, 0, 0.827451, 1, 1,
0.07588311, -1.108679, 2.901829, 0, 0.8196079, 1, 1,
0.07965001, 1.425395, -2.44593, 0, 0.8156863, 1, 1,
0.08133482, 1.605643, -0.631107, 0, 0.8078431, 1, 1,
0.08661925, -1.550207, 2.895167, 0, 0.8039216, 1, 1,
0.09106388, 0.1825324, 0.01661023, 0, 0.7960784, 1, 1,
0.09260193, -0.3466963, 4.312119, 0, 0.7882353, 1, 1,
0.0963778, -0.6749638, 1.809892, 0, 0.7843137, 1, 1,
0.09660015, 1.633871, 1.301988, 0, 0.7764706, 1, 1,
0.1018822, -0.4534488, 4.302071, 0, 0.772549, 1, 1,
0.1019399, 1.029701, -1.035184, 0, 0.7647059, 1, 1,
0.1112878, -1.342105, 3.498983, 0, 0.7607843, 1, 1,
0.1148743, 0.09366261, 2.579123, 0, 0.7529412, 1, 1,
0.1156013, 0.8727005, 2.002132, 0, 0.7490196, 1, 1,
0.1173667, -0.08251438, 2.044331, 0, 0.7411765, 1, 1,
0.1275297, -0.08494008, 2.863117, 0, 0.7372549, 1, 1,
0.129944, -0.3682422, 4.184301, 0, 0.7294118, 1, 1,
0.1325989, 0.130337, 1.555775, 0, 0.7254902, 1, 1,
0.1327463, -0.2172059, 1.94816, 0, 0.7176471, 1, 1,
0.1415963, 0.3216086, 0.8097417, 0, 0.7137255, 1, 1,
0.1416999, -0.2287151, 4.192801, 0, 0.7058824, 1, 1,
0.1418605, 1.169815, 0.3458676, 0, 0.6980392, 1, 1,
0.1483459, -0.368369, 3.350507, 0, 0.6941177, 1, 1,
0.1523554, 0.1537, -0.2520423, 0, 0.6862745, 1, 1,
0.1538609, 1.209784, -0.1150503, 0, 0.682353, 1, 1,
0.1564181, -1.073867, 2.443232, 0, 0.6745098, 1, 1,
0.1626249, 1.162186, 0.1045021, 0, 0.6705883, 1, 1,
0.1651363, -1.126986, 4.783312, 0, 0.6627451, 1, 1,
0.1652839, -0.9678937, 2.226785, 0, 0.6588235, 1, 1,
0.1658159, -0.6969697, 3.874218, 0, 0.6509804, 1, 1,
0.1669074, 0.6818232, 0.2971171, 0, 0.6470588, 1, 1,
0.1684061, -1.459617, 4.190777, 0, 0.6392157, 1, 1,
0.1693168, -0.2798193, 3.444882, 0, 0.6352941, 1, 1,
0.169926, -2.303067, 2.150406, 0, 0.627451, 1, 1,
0.1721094, -0.09783063, 2.706021, 0, 0.6235294, 1, 1,
0.1722798, 1.046039, -0.3188135, 0, 0.6156863, 1, 1,
0.1723575, 1.542575, -0.4014823, 0, 0.6117647, 1, 1,
0.1724712, -0.7712636, 2.016587, 0, 0.6039216, 1, 1,
0.1739916, -1.417835, 3.246419, 0, 0.5960785, 1, 1,
0.1749194, -2.993172, 3.213888, 0, 0.5921569, 1, 1,
0.1772537, -1.978233, 2.67856, 0, 0.5843138, 1, 1,
0.1799878, -0.7675725, 2.404821, 0, 0.5803922, 1, 1,
0.1851081, -0.2201878, 5.437305, 0, 0.572549, 1, 1,
0.1864976, -0.6477472, 2.638822, 0, 0.5686275, 1, 1,
0.1913386, 0.09750922, 0.269002, 0, 0.5607843, 1, 1,
0.1919016, -0.8793727, 2.319255, 0, 0.5568628, 1, 1,
0.1920778, 0.3642108, 1.286909, 0, 0.5490196, 1, 1,
0.1936016, 1.7394, -1.854738, 0, 0.5450981, 1, 1,
0.1938158, 0.2647611, 1.800437, 0, 0.5372549, 1, 1,
0.1950188, 0.1539557, 0.07789809, 0, 0.5333334, 1, 1,
0.1957671, -1.654269, 2.888568, 0, 0.5254902, 1, 1,
0.1976628, 1.343703, 0.605583, 0, 0.5215687, 1, 1,
0.2019463, -0.9246067, 3.373048, 0, 0.5137255, 1, 1,
0.2072127, 0.1957316, 0.248856, 0, 0.509804, 1, 1,
0.2082888, 1.257433, 0.3732501, 0, 0.5019608, 1, 1,
0.2115633, 0.4375608, -0.815899, 0, 0.4941176, 1, 1,
0.2116419, -0.7823502, 1.900132, 0, 0.4901961, 1, 1,
0.2135514, 0.2056028, 1.535838, 0, 0.4823529, 1, 1,
0.215685, -1.112675, 5.003615, 0, 0.4784314, 1, 1,
0.2157571, -0.6508416, 3.758174, 0, 0.4705882, 1, 1,
0.2167566, -0.8180487, 0.5279596, 0, 0.4666667, 1, 1,
0.2174999, -1.674513, 4.031346, 0, 0.4588235, 1, 1,
0.221341, 2.499843, 0.8942617, 0, 0.454902, 1, 1,
0.2237143, 1.808113, -0.6179115, 0, 0.4470588, 1, 1,
0.2272251, -0.1750625, 3.315194, 0, 0.4431373, 1, 1,
0.2295968, 1.513221, 0.2521709, 0, 0.4352941, 1, 1,
0.2306587, -0.7287341, 4.170547, 0, 0.4313726, 1, 1,
0.2308908, -0.2433804, 2.920346, 0, 0.4235294, 1, 1,
0.2316268, -0.4517344, 4.068542, 0, 0.4196078, 1, 1,
0.2318526, 2.588083, -0.8602931, 0, 0.4117647, 1, 1,
0.2327427, -0.06547859, 2.462009, 0, 0.4078431, 1, 1,
0.2390675, -1.105455, 3.272656, 0, 0.4, 1, 1,
0.2423087, 1.818213, -0.3704722, 0, 0.3921569, 1, 1,
0.2443105, -1.200762, 1.853618, 0, 0.3882353, 1, 1,
0.2484741, -1.505329, 1.656562, 0, 0.3803922, 1, 1,
0.2485296, -1.053027, 2.87165, 0, 0.3764706, 1, 1,
0.2527996, 0.1028546, 1.75851, 0, 0.3686275, 1, 1,
0.2545417, 1.623722, 0.7046397, 0, 0.3647059, 1, 1,
0.2595771, -1.053376, 1.950144, 0, 0.3568628, 1, 1,
0.260115, 1.169814, 0.3043391, 0, 0.3529412, 1, 1,
0.2612683, -0.2430372, 1.908961, 0, 0.345098, 1, 1,
0.2629408, -0.8556944, 4.284253, 0, 0.3411765, 1, 1,
0.2634517, -0.0159363, 2.126809, 0, 0.3333333, 1, 1,
0.2635466, -0.8687266, 2.095827, 0, 0.3294118, 1, 1,
0.2637835, -0.005625076, 0.02135831, 0, 0.3215686, 1, 1,
0.2657377, -0.1539263, 1.206366, 0, 0.3176471, 1, 1,
0.2695312, 1.552323, -0.9846662, 0, 0.3098039, 1, 1,
0.2754532, -0.9187346, 3.291917, 0, 0.3058824, 1, 1,
0.2785487, -0.2217807, 2.092108, 0, 0.2980392, 1, 1,
0.2819864, 0.1115314, 0.7677203, 0, 0.2901961, 1, 1,
0.2838831, -0.5240075, 0.293414, 0, 0.2862745, 1, 1,
0.2931034, 0.278621, -1.27054, 0, 0.2784314, 1, 1,
0.2955213, 1.408155, -0.7956268, 0, 0.2745098, 1, 1,
0.2966568, -1.32238, 3.149101, 0, 0.2666667, 1, 1,
0.2971886, -2.348222, 1.377754, 0, 0.2627451, 1, 1,
0.2975106, -1.087646, 2.116213, 0, 0.254902, 1, 1,
0.2999311, -0.4826795, 1.357766, 0, 0.2509804, 1, 1,
0.3008597, 0.4596415, 1.399035, 0, 0.2431373, 1, 1,
0.3046858, 0.245131, -0.1287462, 0, 0.2392157, 1, 1,
0.3051348, 0.3875324, 1.978144, 0, 0.2313726, 1, 1,
0.3163062, 0.9577903, -2.83617, 0, 0.227451, 1, 1,
0.3167737, -0.3902518, 1.082119, 0, 0.2196078, 1, 1,
0.3185708, 0.6527373, -0.3149847, 0, 0.2156863, 1, 1,
0.3224582, -0.9149049, 3.586384, 0, 0.2078431, 1, 1,
0.3301734, 0.6581404, 1.174967, 0, 0.2039216, 1, 1,
0.3302524, -0.3525341, 1.917577, 0, 0.1960784, 1, 1,
0.3315397, -0.1632301, 2.681376, 0, 0.1882353, 1, 1,
0.3373269, 1.046639, -0.1177443, 0, 0.1843137, 1, 1,
0.3392164, 0.3738521, -1.304543, 0, 0.1764706, 1, 1,
0.3445288, 0.8200374, 0.4045113, 0, 0.172549, 1, 1,
0.3466876, -0.3520199, 2.292162, 0, 0.1647059, 1, 1,
0.3482592, -0.5889006, 3.791313, 0, 0.1607843, 1, 1,
0.3489445, 0.008558237, 1.244245, 0, 0.1529412, 1, 1,
0.3515362, 1.086984, 1.164349, 0, 0.1490196, 1, 1,
0.3585609, 1.577639, 1.105144, 0, 0.1411765, 1, 1,
0.3618816, 0.1519786, 2.519305, 0, 0.1372549, 1, 1,
0.362382, -0.06727066, 3.154627, 0, 0.1294118, 1, 1,
0.3631793, 2.340597, -1.612669, 0, 0.1254902, 1, 1,
0.3668724, -1.327701, 2.058491, 0, 0.1176471, 1, 1,
0.3727911, -0.9230991, 3.735937, 0, 0.1137255, 1, 1,
0.3745279, -0.1234076, 1.284018, 0, 0.1058824, 1, 1,
0.3747077, 1.470874, 0.4633517, 0, 0.09803922, 1, 1,
0.3753724, 0.6297141, 0.2942738, 0, 0.09411765, 1, 1,
0.3818518, 1.094374, 1.568697, 0, 0.08627451, 1, 1,
0.3856746, -0.8071383, 2.544595, 0, 0.08235294, 1, 1,
0.3860977, 0.229463, -0.290471, 0, 0.07450981, 1, 1,
0.3870738, 0.4633063, 1.22685, 0, 0.07058824, 1, 1,
0.3883018, -1.0355, 2.349955, 0, 0.0627451, 1, 1,
0.3910212, 1.390128, -1.273881, 0, 0.05882353, 1, 1,
0.3952169, 1.044894, 1.500237, 0, 0.05098039, 1, 1,
0.3960457, 0.1525993, 0.5813671, 0, 0.04705882, 1, 1,
0.3973918, 0.6393561, 0.7155408, 0, 0.03921569, 1, 1,
0.4002154, 0.617484, 1.705826, 0, 0.03529412, 1, 1,
0.4047499, -0.01310879, 1.500795, 0, 0.02745098, 1, 1,
0.4107543, 0.8049277, 1.095857, 0, 0.02352941, 1, 1,
0.4125474, -1.162284, 1.920591, 0, 0.01568628, 1, 1,
0.4157941, -0.9958721, 0.2963337, 0, 0.01176471, 1, 1,
0.4188384, 1.175246, 0.2117632, 0, 0.003921569, 1, 1,
0.4192941, 0.744019, -1.79104, 0.003921569, 0, 1, 1,
0.4216933, -0.3521196, 2.011603, 0.007843138, 0, 1, 1,
0.4233305, 0.5961443, 3.354672, 0.01568628, 0, 1, 1,
0.4244641, -1.357473, 2.504466, 0.01960784, 0, 1, 1,
0.4254654, -0.4420753, 2.110588, 0.02745098, 0, 1, 1,
0.4301583, -0.621057, 2.785255, 0.03137255, 0, 1, 1,
0.4304687, -0.4133239, 2.985279, 0.03921569, 0, 1, 1,
0.4306948, 0.1330815, 1.384545, 0.04313726, 0, 1, 1,
0.4343307, -0.143908, 2.161566, 0.05098039, 0, 1, 1,
0.4405147, -1.332771, 2.258052, 0.05490196, 0, 1, 1,
0.4421955, 1.088164, 0.9576624, 0.0627451, 0, 1, 1,
0.4451071, 0.9275814, 0.7346423, 0.06666667, 0, 1, 1,
0.4499458, 0.224231, 0.4174435, 0.07450981, 0, 1, 1,
0.4501472, -0.8718431, 4.41913, 0.07843138, 0, 1, 1,
0.4575261, 0.5777602, 0.5474705, 0.08627451, 0, 1, 1,
0.4662298, -0.5239117, 2.286303, 0.09019608, 0, 1, 1,
0.4665897, -0.4722298, 0.9923984, 0.09803922, 0, 1, 1,
0.4700678, -0.2324653, 2.83315, 0.1058824, 0, 1, 1,
0.4707054, -0.2947442, 3.743475, 0.1098039, 0, 1, 1,
0.4755911, 0.2230463, 1.017968, 0.1176471, 0, 1, 1,
0.4833678, 0.8709504, -0.5389899, 0.1215686, 0, 1, 1,
0.4838637, -0.6763613, 2.501548, 0.1294118, 0, 1, 1,
0.4891214, 0.002512187, 2.532467, 0.1333333, 0, 1, 1,
0.4963342, 1.189816, 0.6489978, 0.1411765, 0, 1, 1,
0.4978801, -0.3577694, 1.624293, 0.145098, 0, 1, 1,
0.5045035, 0.123786, 0.4920029, 0.1529412, 0, 1, 1,
0.5046205, 0.6925976, -1.113413, 0.1568628, 0, 1, 1,
0.515683, -0.3149791, 3.008198, 0.1647059, 0, 1, 1,
0.5192051, -0.9642456, 2.131732, 0.1686275, 0, 1, 1,
0.520548, -0.3887014, 1.652331, 0.1764706, 0, 1, 1,
0.520938, -0.9690054, 2.475161, 0.1803922, 0, 1, 1,
0.5238916, 0.2490665, 1.547356, 0.1882353, 0, 1, 1,
0.5269721, 0.6442918, -0.5155824, 0.1921569, 0, 1, 1,
0.5349262, -0.450922, 2.141039, 0.2, 0, 1, 1,
0.5363819, -0.5185741, 1.957753, 0.2078431, 0, 1, 1,
0.5407673, 0.410287, -0.4207341, 0.2117647, 0, 1, 1,
0.5412579, 0.5756245, 1.194169, 0.2196078, 0, 1, 1,
0.5417559, -1.00741, 2.002338, 0.2235294, 0, 1, 1,
0.5418082, -1.093414, 2.894324, 0.2313726, 0, 1, 1,
0.5432073, 0.8139192, 0.7419977, 0.2352941, 0, 1, 1,
0.5443528, 0.06887517, 0.3565786, 0.2431373, 0, 1, 1,
0.5453832, -1.601563, 4.092235, 0.2470588, 0, 1, 1,
0.5461888, 1.382882, 0.6097939, 0.254902, 0, 1, 1,
0.5510945, -0.3789235, 4.242147, 0.2588235, 0, 1, 1,
0.552152, -0.9525229, 3.302386, 0.2666667, 0, 1, 1,
0.5559247, -0.7931683, 2.096045, 0.2705882, 0, 1, 1,
0.5579094, -0.3976879, 2.925495, 0.2784314, 0, 1, 1,
0.5591623, -0.00449992, 1.727656, 0.282353, 0, 1, 1,
0.5650097, 0.2687849, -0.2838618, 0.2901961, 0, 1, 1,
0.5730893, 0.8431898, -1.240948, 0.2941177, 0, 1, 1,
0.5844302, -0.2271708, 2.283757, 0.3019608, 0, 1, 1,
0.5900477, -1.492982, 2.671017, 0.3098039, 0, 1, 1,
0.5905665, -1.003996, 3.119342, 0.3137255, 0, 1, 1,
0.5922781, 0.5165685, -0.3954858, 0.3215686, 0, 1, 1,
0.5933042, -0.0124802, 1.584262, 0.3254902, 0, 1, 1,
0.5955758, 1.883332, 0.3176053, 0.3333333, 0, 1, 1,
0.5977258, 1.422187, 1.566433, 0.3372549, 0, 1, 1,
0.599938, 1.091267, 1.295894, 0.345098, 0, 1, 1,
0.6090427, 0.9928166, -1.028631, 0.3490196, 0, 1, 1,
0.6100823, -0.4305003, -0.6431099, 0.3568628, 0, 1, 1,
0.6127352, -1.163367, 3.071233, 0.3607843, 0, 1, 1,
0.6235156, 1.576123, 1.483807, 0.3686275, 0, 1, 1,
0.6278058, -1.317054, 2.62457, 0.372549, 0, 1, 1,
0.6319575, -1.440191, 3.18627, 0.3803922, 0, 1, 1,
0.6334232, -1.245916, 1.875816, 0.3843137, 0, 1, 1,
0.6339641, -0.4627163, 2.540493, 0.3921569, 0, 1, 1,
0.6397448, 0.4711032, 0.1891305, 0.3960784, 0, 1, 1,
0.6408337, 0.2687804, 0.6592539, 0.4039216, 0, 1, 1,
0.6422931, -0.08033672, 3.259327, 0.4117647, 0, 1, 1,
0.6431787, 0.9227588, 0.4449892, 0.4156863, 0, 1, 1,
0.6455997, -1.347902, 1.894737, 0.4235294, 0, 1, 1,
0.6464152, 0.4835479, 0.9550542, 0.427451, 0, 1, 1,
0.647993, 1.711621, 1.046355, 0.4352941, 0, 1, 1,
0.6489535, -0.6335728, 1.747814, 0.4392157, 0, 1, 1,
0.6492108, -1.285216, 2.04982, 0.4470588, 0, 1, 1,
0.6512887, -0.5199745, 1.5667, 0.4509804, 0, 1, 1,
0.6522411, -1.579469, 1.753046, 0.4588235, 0, 1, 1,
0.6529031, -1.432439, 2.946654, 0.4627451, 0, 1, 1,
0.653975, -0.1219439, 2.500528, 0.4705882, 0, 1, 1,
0.6582766, 0.387924, -1.255552, 0.4745098, 0, 1, 1,
0.6590102, 0.9886118, -0.7417155, 0.4823529, 0, 1, 1,
0.6626492, -1.25252, 1.308603, 0.4862745, 0, 1, 1,
0.6652983, -1.676002, 2.127509, 0.4941176, 0, 1, 1,
0.6659327, 0.3954628, 1.968585, 0.5019608, 0, 1, 1,
0.6749703, -0.6537905, 0.9560156, 0.5058824, 0, 1, 1,
0.6790103, 0.4287539, 0.684861, 0.5137255, 0, 1, 1,
0.6797273, -0.02114029, -0.2487893, 0.5176471, 0, 1, 1,
0.6822827, -0.4892714, 1.459058, 0.5254902, 0, 1, 1,
0.6826015, -1.459462, 3.069191, 0.5294118, 0, 1, 1,
0.6847803, -0.6399952, 2.706983, 0.5372549, 0, 1, 1,
0.687164, 0.8571298, -1.564605, 0.5411765, 0, 1, 1,
0.6878463, -0.127605, 0.3163228, 0.5490196, 0, 1, 1,
0.6886539, -0.2275788, 3.372993, 0.5529412, 0, 1, 1,
0.696481, -0.7630802, 1.41672, 0.5607843, 0, 1, 1,
0.6972277, 1.044221, -0.7131889, 0.5647059, 0, 1, 1,
0.701039, 1.394862, 1.024067, 0.572549, 0, 1, 1,
0.7090759, -0.165806, 2.458545, 0.5764706, 0, 1, 1,
0.7099557, 0.4638328, 1.231117, 0.5843138, 0, 1, 1,
0.7112859, 0.01393569, 2.302864, 0.5882353, 0, 1, 1,
0.7189483, -0.2204685, 2.244394, 0.5960785, 0, 1, 1,
0.7194518, -1.242342, 3.940655, 0.6039216, 0, 1, 1,
0.7214144, 0.7543249, 0.4157422, 0.6078432, 0, 1, 1,
0.7261068, -0.1138222, 3.563815, 0.6156863, 0, 1, 1,
0.7289636, -0.3245681, 2.627635, 0.6196079, 0, 1, 1,
0.7296365, 1.6155, 0.9204859, 0.627451, 0, 1, 1,
0.7327964, 0.1993409, -1.235131, 0.6313726, 0, 1, 1,
0.7376612, -0.5658287, 3.329798, 0.6392157, 0, 1, 1,
0.7397355, 1.305926, 0.0004008743, 0.6431373, 0, 1, 1,
0.7407866, 0.5791014, -0.1253484, 0.6509804, 0, 1, 1,
0.7436674, -0.6935335, 2.359317, 0.654902, 0, 1, 1,
0.7481048, -0.7516199, 2.561874, 0.6627451, 0, 1, 1,
0.7531584, 0.8788439, 0.726995, 0.6666667, 0, 1, 1,
0.7535656, 1.298445, 1.003391, 0.6745098, 0, 1, 1,
0.7537283, 0.04977094, 0.7654665, 0.6784314, 0, 1, 1,
0.7542473, -0.9650226, 2.947463, 0.6862745, 0, 1, 1,
0.7603234, -0.1232643, 0.2569534, 0.6901961, 0, 1, 1,
0.7643052, 1.060423, -1.573765, 0.6980392, 0, 1, 1,
0.7661175, 0.2692739, 3.236507, 0.7058824, 0, 1, 1,
0.7724722, 1.064219, 1.420359, 0.7098039, 0, 1, 1,
0.7759845, -0.7869144, 2.952689, 0.7176471, 0, 1, 1,
0.7777, 0.08518326, 1.648095, 0.7215686, 0, 1, 1,
0.7784845, -1.036211, 1.868866, 0.7294118, 0, 1, 1,
0.7807848, -0.1513352, 3.918002, 0.7333333, 0, 1, 1,
0.7836212, -0.626383, 1.657541, 0.7411765, 0, 1, 1,
0.7900259, 0.7685881, 0.7219408, 0.7450981, 0, 1, 1,
0.7948048, 1.463004, 0.1719996, 0.7529412, 0, 1, 1,
0.7952484, -0.6084581, 3.146559, 0.7568628, 0, 1, 1,
0.7963527, 1.045054, 0.800058, 0.7647059, 0, 1, 1,
0.7988412, -0.4704196, 2.247663, 0.7686275, 0, 1, 1,
0.8012589, -0.2315064, 2.184013, 0.7764706, 0, 1, 1,
0.8017978, 0.1059582, 0.4020571, 0.7803922, 0, 1, 1,
0.8024858, 2.415772, 0.1372688, 0.7882353, 0, 1, 1,
0.8025224, 1.192475, -0.3107964, 0.7921569, 0, 1, 1,
0.8038786, -0.06567583, 2.169573, 0.8, 0, 1, 1,
0.8063925, -1.782032, 3.661398, 0.8078431, 0, 1, 1,
0.8202165, -0.5068398, 3.243598, 0.8117647, 0, 1, 1,
0.8222708, 1.044499, -0.2455489, 0.8196079, 0, 1, 1,
0.8267112, -1.521925, 2.183578, 0.8235294, 0, 1, 1,
0.8269048, -0.9098418, 1.580688, 0.8313726, 0, 1, 1,
0.8514932, -0.7855341, 2.633723, 0.8352941, 0, 1, 1,
0.8540108, 0.2437888, 1.492593, 0.8431373, 0, 1, 1,
0.8546011, 0.3529119, 0.8079055, 0.8470588, 0, 1, 1,
0.8605096, -1.342548, 3.587412, 0.854902, 0, 1, 1,
0.8611702, -0.5595531, 2.180894, 0.8588235, 0, 1, 1,
0.8645714, -0.5025648, -0.1855409, 0.8666667, 0, 1, 1,
0.8647943, 0.491104, 1.007705, 0.8705882, 0, 1, 1,
0.8665569, -0.2558666, 0.7286865, 0.8784314, 0, 1, 1,
0.8696986, 0.6472864, 0.3547536, 0.8823529, 0, 1, 1,
0.8720928, 1.407749, 0.32493, 0.8901961, 0, 1, 1,
0.8799657, 1.099272, 0.2407868, 0.8941177, 0, 1, 1,
0.8867773, -0.3909455, 1.709717, 0.9019608, 0, 1, 1,
0.8936886, 0.997471, 0.7250209, 0.9098039, 0, 1, 1,
0.8986397, -0.810341, 2.613401, 0.9137255, 0, 1, 1,
0.899384, -0.7552657, 3.744498, 0.9215686, 0, 1, 1,
0.9015113, -0.1972066, 0.9207957, 0.9254902, 0, 1, 1,
0.9032975, -1.648138, 2.704751, 0.9333333, 0, 1, 1,
0.9101347, 0.7070709, 1.290383, 0.9372549, 0, 1, 1,
0.9145175, -0.07164725, 2.95582, 0.945098, 0, 1, 1,
0.9222694, 1.813184, 0.1314447, 0.9490196, 0, 1, 1,
0.9225867, 0.7441854, 2.44412, 0.9568627, 0, 1, 1,
0.9230155, -0.888062, 3.315161, 0.9607843, 0, 1, 1,
0.9243667, -0.3227813, 1.989365, 0.9686275, 0, 1, 1,
0.9281045, -1.052352, 2.925214, 0.972549, 0, 1, 1,
0.9302298, -0.5340819, 1.569308, 0.9803922, 0, 1, 1,
0.9335068, 0.1947082, 0.173661, 0.9843137, 0, 1, 1,
0.9350001, -0.1734267, 2.179782, 0.9921569, 0, 1, 1,
0.9386288, 1.058137, -0.72458, 0.9960784, 0, 1, 1,
0.9423357, 0.3879391, 1.61411, 1, 0, 0.9960784, 1,
0.9532043, -0.6199536, 3.363809, 1, 0, 0.9882353, 1,
0.9539027, 0.2063123, 2.276852, 1, 0, 0.9843137, 1,
0.9572501, -0.004592901, 1.232836, 1, 0, 0.9764706, 1,
0.9620677, 0.2835854, 0.8556144, 1, 0, 0.972549, 1,
0.965503, 0.1943441, 1.72342, 1, 0, 0.9647059, 1,
0.9661822, 1.120371, -0.4256149, 1, 0, 0.9607843, 1,
0.9669092, 0.4616101, 1.302201, 1, 0, 0.9529412, 1,
0.9774728, 0.4800504, 0.7512801, 1, 0, 0.9490196, 1,
0.9783805, -0.9258982, 2.351395, 1, 0, 0.9411765, 1,
0.9824014, -0.2022812, 0.595426, 1, 0, 0.9372549, 1,
0.9864773, 0.9193649, 1.672685, 1, 0, 0.9294118, 1,
0.986893, 0.1217597, 0.2968856, 1, 0, 0.9254902, 1,
0.9894763, 2.495922, 0.539766, 1, 0, 0.9176471, 1,
0.9906772, -1.17347, 1.985813, 1, 0, 0.9137255, 1,
0.9909265, -0.1946411, 0.3013481, 1, 0, 0.9058824, 1,
1.001232, 1.353312, -1.144295, 1, 0, 0.9019608, 1,
1.004271, -1.327132, 3.797914, 1, 0, 0.8941177, 1,
1.00757, 0.9558859, 3.502613, 1, 0, 0.8862745, 1,
1.010066, -0.8492948, 1.416199, 1, 0, 0.8823529, 1,
1.020184, 0.8237706, 0.1361282, 1, 0, 0.8745098, 1,
1.022516, -1.174539, 3.183735, 1, 0, 0.8705882, 1,
1.0293, -0.835212, 1.574007, 1, 0, 0.8627451, 1,
1.036845, -1.938313, 1.882119, 1, 0, 0.8588235, 1,
1.042016, -0.8794188, 1.183667, 1, 0, 0.8509804, 1,
1.046181, -1.095235, 1.688541, 1, 0, 0.8470588, 1,
1.049155, 1.074806, 1.020544, 1, 0, 0.8392157, 1,
1.054973, 0.1304083, 0.7186273, 1, 0, 0.8352941, 1,
1.059436, 0.4847158, 0.9477089, 1, 0, 0.827451, 1,
1.059731, 1.340175, 1.652929, 1, 0, 0.8235294, 1,
1.063119, 0.08737449, 2.19728, 1, 0, 0.8156863, 1,
1.064184, -1.794987, 3.118944, 1, 0, 0.8117647, 1,
1.079691, -1.002955, 2.036118, 1, 0, 0.8039216, 1,
1.081872, -0.8398587, 2.474343, 1, 0, 0.7960784, 1,
1.09315, 0.3712698, 2.371474, 1, 0, 0.7921569, 1,
1.098486, 1.510974, -0.3891011, 1, 0, 0.7843137, 1,
1.098708, 0.2764119, 0.01145523, 1, 0, 0.7803922, 1,
1.099707, -1.499315, 2.528644, 1, 0, 0.772549, 1,
1.104372, -0.7362604, 2.438039, 1, 0, 0.7686275, 1,
1.10447, -0.643481, 2.383213, 1, 0, 0.7607843, 1,
1.104603, -0.2647138, 2.156892, 1, 0, 0.7568628, 1,
1.106543, 1.121896, 1.443211, 1, 0, 0.7490196, 1,
1.107964, 0.5343691, -0.5241904, 1, 0, 0.7450981, 1,
1.110072, -0.4372809, 1.605795, 1, 0, 0.7372549, 1,
1.112777, 0.02741606, 1.921265, 1, 0, 0.7333333, 1,
1.114804, -0.4832142, 2.467448, 1, 0, 0.7254902, 1,
1.124016, -0.2523353, 2.82395, 1, 0, 0.7215686, 1,
1.128438, -1.382659, 2.665517, 1, 0, 0.7137255, 1,
1.134622, -0.5079263, 2.521247, 1, 0, 0.7098039, 1,
1.144548, -1.247631, 1.644598, 1, 0, 0.7019608, 1,
1.151213, 0.388368, 0.8007897, 1, 0, 0.6941177, 1,
1.164055, -0.521993, 0.9344488, 1, 0, 0.6901961, 1,
1.174935, 0.598425, -0.2736547, 1, 0, 0.682353, 1,
1.175493, 0.1528631, 1.787526, 1, 0, 0.6784314, 1,
1.177338, 0.4041591, 0.1386437, 1, 0, 0.6705883, 1,
1.178311, 0.484638, 1.894492, 1, 0, 0.6666667, 1,
1.185655, 0.4824452, 0.8265603, 1, 0, 0.6588235, 1,
1.186507, 0.7805741, 0.1932921, 1, 0, 0.654902, 1,
1.194397, 0.08271112, -0.2412102, 1, 0, 0.6470588, 1,
1.195542, -1.658392, 2.917214, 1, 0, 0.6431373, 1,
1.203848, 0.15814, 0.2393937, 1, 0, 0.6352941, 1,
1.20727, 1.097683, 0.0477506, 1, 0, 0.6313726, 1,
1.21323, 0.467299, 1.715706, 1, 0, 0.6235294, 1,
1.216731, -1.288131, 1.706116, 1, 0, 0.6196079, 1,
1.221482, -2.020314, 2.79208, 1, 0, 0.6117647, 1,
1.22233, -0.2212662, -1.113543, 1, 0, 0.6078432, 1,
1.242209, -0.6568858, 0.3867848, 1, 0, 0.6, 1,
1.247684, -0.2829272, 1.440852, 1, 0, 0.5921569, 1,
1.2522, 1.002925, 1.24697, 1, 0, 0.5882353, 1,
1.254472, -0.6445984, 2.220537, 1, 0, 0.5803922, 1,
1.258844, 0.5450472, 1.996076, 1, 0, 0.5764706, 1,
1.264828, -1.775736, 2.046472, 1, 0, 0.5686275, 1,
1.264961, -0.7979587, 2.925762, 1, 0, 0.5647059, 1,
1.27821, -0.5194812, 0.2677587, 1, 0, 0.5568628, 1,
1.284729, -0.0888954, 2.14501, 1, 0, 0.5529412, 1,
1.285913, 0.2479492, 1.02317, 1, 0, 0.5450981, 1,
1.290123, -0.1535676, 2.325012, 1, 0, 0.5411765, 1,
1.300124, 0.7033391, -0.2986456, 1, 0, 0.5333334, 1,
1.306582, 0.1449774, -0.3209359, 1, 0, 0.5294118, 1,
1.308812, 0.07546145, 0.4572111, 1, 0, 0.5215687, 1,
1.310738, 0.7336206, 1.567349, 1, 0, 0.5176471, 1,
1.321049, -0.3982241, 1.859068, 1, 0, 0.509804, 1,
1.322242, 0.4201012, 1.247568, 1, 0, 0.5058824, 1,
1.324025, -0.4703552, 2.003681, 1, 0, 0.4980392, 1,
1.328902, 1.291336, -0.1456424, 1, 0, 0.4901961, 1,
1.332229, -1.015772, 3.988296, 1, 0, 0.4862745, 1,
1.343358, -1.033458, 3.116441, 1, 0, 0.4784314, 1,
1.34841, -0.4197133, 1.488219, 1, 0, 0.4745098, 1,
1.354835, -0.02646522, 0.5469571, 1, 0, 0.4666667, 1,
1.361764, 0.3314356, 2.166014, 1, 0, 0.4627451, 1,
1.36299, 0.1228012, 2.1363, 1, 0, 0.454902, 1,
1.365108, -0.5018172, 2.20158, 1, 0, 0.4509804, 1,
1.368611, 0.3226168, 2.944812, 1, 0, 0.4431373, 1,
1.381619, -0.1516906, 1.755566, 1, 0, 0.4392157, 1,
1.390767, -0.3600293, -0.1193518, 1, 0, 0.4313726, 1,
1.399004, -0.5569282, 1.893044, 1, 0, 0.427451, 1,
1.400894, -0.7809916, 2.322075, 1, 0, 0.4196078, 1,
1.406891, -1.217096, 1.120279, 1, 0, 0.4156863, 1,
1.407015, -1.212912, 3.702655, 1, 0, 0.4078431, 1,
1.407738, 0.5103453, 1.185997, 1, 0, 0.4039216, 1,
1.413946, -0.7791144, 1.974306, 1, 0, 0.3960784, 1,
1.422868, -1.380305, 3.7263, 1, 0, 0.3882353, 1,
1.434046, -0.4004993, 1.858842, 1, 0, 0.3843137, 1,
1.437692, -0.4359449, 1.273754, 1, 0, 0.3764706, 1,
1.445919, -0.7297421, 0.6665583, 1, 0, 0.372549, 1,
1.446217, 0.9296788, 0.04346307, 1, 0, 0.3647059, 1,
1.453044, 1.001843, 1.957714, 1, 0, 0.3607843, 1,
1.464987, 0.02641059, 1.293867, 1, 0, 0.3529412, 1,
1.467533, 1.130896, -0.1958245, 1, 0, 0.3490196, 1,
1.475211, 0.2407494, 1.255835, 1, 0, 0.3411765, 1,
1.481919, -0.4703082, 2.085351, 1, 0, 0.3372549, 1,
1.484848, -0.2411374, 2.247101, 1, 0, 0.3294118, 1,
1.494427, 0.2286092, 0.3102694, 1, 0, 0.3254902, 1,
1.520048, -2.2283, 2.731108, 1, 0, 0.3176471, 1,
1.524314, -1.478571, 2.146449, 1, 0, 0.3137255, 1,
1.54535, 0.2231408, 0.2173725, 1, 0, 0.3058824, 1,
1.546131, 0.4009006, 2.107582, 1, 0, 0.2980392, 1,
1.560404, -0.5812553, 2.104291, 1, 0, 0.2941177, 1,
1.564994, -0.737213, 2.579658, 1, 0, 0.2862745, 1,
1.56689, 0.4564961, 3.280693, 1, 0, 0.282353, 1,
1.57307, 1.824432, -0.7221816, 1, 0, 0.2745098, 1,
1.606746, 0.6394879, 1.855338, 1, 0, 0.2705882, 1,
1.614385, -0.02773542, 2.55561, 1, 0, 0.2627451, 1,
1.625352, 0.6484682, 1.824444, 1, 0, 0.2588235, 1,
1.628599, -1.257278, 1.938438, 1, 0, 0.2509804, 1,
1.630343, 0.650228, 0.6538112, 1, 0, 0.2470588, 1,
1.630841, -1.642207, 2.875117, 1, 0, 0.2392157, 1,
1.667271, -0.57076, 1.708255, 1, 0, 0.2352941, 1,
1.735258, 0.5539653, 0.3094658, 1, 0, 0.227451, 1,
1.737514, -0.0644803, -0.5460605, 1, 0, 0.2235294, 1,
1.753362, -0.5618204, 0.9938478, 1, 0, 0.2156863, 1,
1.77885, 0.4597361, 3.659738, 1, 0, 0.2117647, 1,
1.779297, -0.4727773, 2.145539, 1, 0, 0.2039216, 1,
1.790247, 0.421159, 1.879143, 1, 0, 0.1960784, 1,
1.794356, 0.6409289, 0.468092, 1, 0, 0.1921569, 1,
1.799518, 0.3522713, 2.040185, 1, 0, 0.1843137, 1,
1.802956, -0.9612088, 3.465358, 1, 0, 0.1803922, 1,
1.805696, -1.065681, 1.962358, 1, 0, 0.172549, 1,
1.818246, 1.031195, 0.8010536, 1, 0, 0.1686275, 1,
1.831534, -1.103886, 2.214197, 1, 0, 0.1607843, 1,
1.853622, 0.3856297, -1.505927, 1, 0, 0.1568628, 1,
1.863158, -0.1012179, 3.166855, 1, 0, 0.1490196, 1,
1.899156, -0.6087624, 0.7467921, 1, 0, 0.145098, 1,
1.929113, -0.06884373, 3.426885, 1, 0, 0.1372549, 1,
1.930707, 0.8639724, 0.6090266, 1, 0, 0.1333333, 1,
1.971897, 0.6790624, 1.50873, 1, 0, 0.1254902, 1,
1.978002, -0.3092217, 1.993014, 1, 0, 0.1215686, 1,
1.992015, 0.3992592, 0.4750437, 1, 0, 0.1137255, 1,
2.071063, 0.7125268, 1.485278, 1, 0, 0.1098039, 1,
2.080669, -0.3395751, 0.9078329, 1, 0, 0.1019608, 1,
2.111817, 0.6758538, 0.7464923, 1, 0, 0.09411765, 1,
2.235297, 0.4255006, 2.549676, 1, 0, 0.09019608, 1,
2.261153, 1.375981, 0.8991671, 1, 0, 0.08235294, 1,
2.268565, 1.021127, 1.145409, 1, 0, 0.07843138, 1,
2.278646, 0.5068612, 1.726985, 1, 0, 0.07058824, 1,
2.32775, 0.108333, 2.251554, 1, 0, 0.06666667, 1,
2.369655, -0.07673731, 1.806475, 1, 0, 0.05882353, 1,
2.372008, -0.00777817, 1.608472, 1, 0, 0.05490196, 1,
2.483216, 0.5612967, 1.053204, 1, 0, 0.04705882, 1,
2.509913, -0.9368466, 2.192162, 1, 0, 0.04313726, 1,
2.535472, -0.3086581, 0.02086871, 1, 0, 0.03529412, 1,
2.594761, -0.6205829, 1.32371, 1, 0, 0.03137255, 1,
2.655742, -0.9603521, 3.00578, 1, 0, 0.02352941, 1,
2.816047, -0.8762446, 2.649601, 1, 0, 0.01960784, 1,
2.856106, 1.78772, -0.6306922, 1, 0, 0.01176471, 1,
3.047346, -1.152833, 0.3482022, 1, 0, 0.007843138, 1
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
0.000387311, -4.114526, -6.620819, 0, -0.5, 0.5, 0.5,
0.000387311, -4.114526, -6.620819, 1, -0.5, 0.5, 0.5,
0.000387311, -4.114526, -6.620819, 1, 1.5, 0.5, 0.5,
0.000387311, -4.114526, -6.620819, 0, 1.5, 0.5, 0.5
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
-4.079491, 0.3146559, -6.620819, 0, -0.5, 0.5, 0.5,
-4.079491, 0.3146559, -6.620819, 1, -0.5, 0.5, 0.5,
-4.079491, 0.3146559, -6.620819, 1, 1.5, 0.5, 0.5,
-4.079491, 0.3146559, -6.620819, 0, 1.5, 0.5, 0.5
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
-4.079491, -4.114526, 0.2820575, 0, -0.5, 0.5, 0.5,
-4.079491, -4.114526, 0.2820575, 1, -0.5, 0.5, 0.5,
-4.079491, -4.114526, 0.2820575, 1, 1.5, 0.5, 0.5,
-4.079491, -4.114526, 0.2820575, 0, 1.5, 0.5, 0.5
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
-3, -3.092407, -5.027847,
3, -3.092407, -5.027847,
-3, -3.092407, -5.027847,
-3, -3.26276, -5.293343,
-2, -3.092407, -5.027847,
-2, -3.26276, -5.293343,
-1, -3.092407, -5.027847,
-1, -3.26276, -5.293343,
0, -3.092407, -5.027847,
0, -3.26276, -5.293343,
1, -3.092407, -5.027847,
1, -3.26276, -5.293343,
2, -3.092407, -5.027847,
2, -3.26276, -5.293343,
3, -3.092407, -5.027847,
3, -3.26276, -5.293343
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
-3, -3.603467, -5.824333, 0, -0.5, 0.5, 0.5,
-3, -3.603467, -5.824333, 1, -0.5, 0.5, 0.5,
-3, -3.603467, -5.824333, 1, 1.5, 0.5, 0.5,
-3, -3.603467, -5.824333, 0, 1.5, 0.5, 0.5,
-2, -3.603467, -5.824333, 0, -0.5, 0.5, 0.5,
-2, -3.603467, -5.824333, 1, -0.5, 0.5, 0.5,
-2, -3.603467, -5.824333, 1, 1.5, 0.5, 0.5,
-2, -3.603467, -5.824333, 0, 1.5, 0.5, 0.5,
-1, -3.603467, -5.824333, 0, -0.5, 0.5, 0.5,
-1, -3.603467, -5.824333, 1, -0.5, 0.5, 0.5,
-1, -3.603467, -5.824333, 1, 1.5, 0.5, 0.5,
-1, -3.603467, -5.824333, 0, 1.5, 0.5, 0.5,
0, -3.603467, -5.824333, 0, -0.5, 0.5, 0.5,
0, -3.603467, -5.824333, 1, -0.5, 0.5, 0.5,
0, -3.603467, -5.824333, 1, 1.5, 0.5, 0.5,
0, -3.603467, -5.824333, 0, 1.5, 0.5, 0.5,
1, -3.603467, -5.824333, 0, -0.5, 0.5, 0.5,
1, -3.603467, -5.824333, 1, -0.5, 0.5, 0.5,
1, -3.603467, -5.824333, 1, 1.5, 0.5, 0.5,
1, -3.603467, -5.824333, 0, 1.5, 0.5, 0.5,
2, -3.603467, -5.824333, 0, -0.5, 0.5, 0.5,
2, -3.603467, -5.824333, 1, -0.5, 0.5, 0.5,
2, -3.603467, -5.824333, 1, 1.5, 0.5, 0.5,
2, -3.603467, -5.824333, 0, 1.5, 0.5, 0.5,
3, -3.603467, -5.824333, 0, -0.5, 0.5, 0.5,
3, -3.603467, -5.824333, 1, -0.5, 0.5, 0.5,
3, -3.603467, -5.824333, 1, 1.5, 0.5, 0.5,
3, -3.603467, -5.824333, 0, 1.5, 0.5, 0.5
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
-3.13798, -2, -5.027847,
-3.13798, 3, -5.027847,
-3.13798, -2, -5.027847,
-3.294899, -2, -5.293343,
-3.13798, -1, -5.027847,
-3.294899, -1, -5.293343,
-3.13798, 0, -5.027847,
-3.294899, 0, -5.293343,
-3.13798, 1, -5.027847,
-3.294899, 1, -5.293343,
-3.13798, 2, -5.027847,
-3.294899, 2, -5.293343,
-3.13798, 3, -5.027847,
-3.294899, 3, -5.293343
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
-3.608736, -2, -5.824333, 0, -0.5, 0.5, 0.5,
-3.608736, -2, -5.824333, 1, -0.5, 0.5, 0.5,
-3.608736, -2, -5.824333, 1, 1.5, 0.5, 0.5,
-3.608736, -2, -5.824333, 0, 1.5, 0.5, 0.5,
-3.608736, -1, -5.824333, 0, -0.5, 0.5, 0.5,
-3.608736, -1, -5.824333, 1, -0.5, 0.5, 0.5,
-3.608736, -1, -5.824333, 1, 1.5, 0.5, 0.5,
-3.608736, -1, -5.824333, 0, 1.5, 0.5, 0.5,
-3.608736, 0, -5.824333, 0, -0.5, 0.5, 0.5,
-3.608736, 0, -5.824333, 1, -0.5, 0.5, 0.5,
-3.608736, 0, -5.824333, 1, 1.5, 0.5, 0.5,
-3.608736, 0, -5.824333, 0, 1.5, 0.5, 0.5,
-3.608736, 1, -5.824333, 0, -0.5, 0.5, 0.5,
-3.608736, 1, -5.824333, 1, -0.5, 0.5, 0.5,
-3.608736, 1, -5.824333, 1, 1.5, 0.5, 0.5,
-3.608736, 1, -5.824333, 0, 1.5, 0.5, 0.5,
-3.608736, 2, -5.824333, 0, -0.5, 0.5, 0.5,
-3.608736, 2, -5.824333, 1, -0.5, 0.5, 0.5,
-3.608736, 2, -5.824333, 1, 1.5, 0.5, 0.5,
-3.608736, 2, -5.824333, 0, 1.5, 0.5, 0.5,
-3.608736, 3, -5.824333, 0, -0.5, 0.5, 0.5,
-3.608736, 3, -5.824333, 1, -0.5, 0.5, 0.5,
-3.608736, 3, -5.824333, 1, 1.5, 0.5, 0.5,
-3.608736, 3, -5.824333, 0, 1.5, 0.5, 0.5
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
-3.13798, -3.092407, -4,
-3.13798, -3.092407, 4,
-3.13798, -3.092407, -4,
-3.294899, -3.26276, -4,
-3.13798, -3.092407, -2,
-3.294899, -3.26276, -2,
-3.13798, -3.092407, 0,
-3.294899, -3.26276, 0,
-3.13798, -3.092407, 2,
-3.294899, -3.26276, 2,
-3.13798, -3.092407, 4,
-3.294899, -3.26276, 4
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
-3.608736, -3.603467, -4, 0, -0.5, 0.5, 0.5,
-3.608736, -3.603467, -4, 1, -0.5, 0.5, 0.5,
-3.608736, -3.603467, -4, 1, 1.5, 0.5, 0.5,
-3.608736, -3.603467, -4, 0, 1.5, 0.5, 0.5,
-3.608736, -3.603467, -2, 0, -0.5, 0.5, 0.5,
-3.608736, -3.603467, -2, 1, -0.5, 0.5, 0.5,
-3.608736, -3.603467, -2, 1, 1.5, 0.5, 0.5,
-3.608736, -3.603467, -2, 0, 1.5, 0.5, 0.5,
-3.608736, -3.603467, 0, 0, -0.5, 0.5, 0.5,
-3.608736, -3.603467, 0, 1, -0.5, 0.5, 0.5,
-3.608736, -3.603467, 0, 1, 1.5, 0.5, 0.5,
-3.608736, -3.603467, 0, 0, 1.5, 0.5, 0.5,
-3.608736, -3.603467, 2, 0, -0.5, 0.5, 0.5,
-3.608736, -3.603467, 2, 1, -0.5, 0.5, 0.5,
-3.608736, -3.603467, 2, 1, 1.5, 0.5, 0.5,
-3.608736, -3.603467, 2, 0, 1.5, 0.5, 0.5,
-3.608736, -3.603467, 4, 0, -0.5, 0.5, 0.5,
-3.608736, -3.603467, 4, 1, -0.5, 0.5, 0.5,
-3.608736, -3.603467, 4, 1, 1.5, 0.5, 0.5,
-3.608736, -3.603467, 4, 0, 1.5, 0.5, 0.5
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
-3.13798, -3.092407, -5.027847,
-3.13798, 3.721719, -5.027847,
-3.13798, -3.092407, 5.591962,
-3.13798, 3.721719, 5.591962,
-3.13798, -3.092407, -5.027847,
-3.13798, -3.092407, 5.591962,
-3.13798, 3.721719, -5.027847,
-3.13798, 3.721719, 5.591962,
-3.13798, -3.092407, -5.027847,
3.138755, -3.092407, -5.027847,
-3.13798, -3.092407, 5.591962,
3.138755, -3.092407, 5.591962,
-3.13798, 3.721719, -5.027847,
3.138755, 3.721719, -5.027847,
-3.13798, 3.721719, 5.591962,
3.138755, 3.721719, 5.591962,
3.138755, -3.092407, -5.027847,
3.138755, 3.721719, -5.027847,
3.138755, -3.092407, 5.591962,
3.138755, 3.721719, 5.591962,
3.138755, -3.092407, -5.027847,
3.138755, -3.092407, 5.591962,
3.138755, 3.721719, -5.027847,
3.138755, 3.721719, 5.591962
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
var radius = 7.52534;
var distance = 33.48109;
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
mvMatrix.translate( -0.000387311, -0.3146559, -0.2820575 );
mvMatrix.scale( 1.296302, 1.19407, 0.7661667 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.48109);
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


