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
-3.653783, -0.7987581, -0.5647963, 1, 0, 0, 1,
-2.918201, -0.2029998, -2.653971, 1, 0.007843138, 0, 1,
-2.54705, 1.006798, -0.5022016, 1, 0.01176471, 0, 1,
-2.488837, -1.172109, -1.874916, 1, 0.01960784, 0, 1,
-2.450177, 1.222281, -0.3599645, 1, 0.02352941, 0, 1,
-2.411139, -0.5101538, -0.949976, 1, 0.03137255, 0, 1,
-2.389349, 1.054638, -1.328441, 1, 0.03529412, 0, 1,
-2.370976, 0.5544347, -2.296679, 1, 0.04313726, 0, 1,
-2.342854, -0.02556966, 0.9877275, 1, 0.04705882, 0, 1,
-2.327949, 1.232965, -2.473461, 1, 0.05490196, 0, 1,
-2.320079, 0.07220286, -2.967715, 1, 0.05882353, 0, 1,
-2.299973, 0.75189, -1.26065, 1, 0.06666667, 0, 1,
-2.250165, 0.9070179, -0.3389699, 1, 0.07058824, 0, 1,
-2.169962, 2.776376, 1.482112, 1, 0.07843138, 0, 1,
-2.153706, 0.471346, -2.206917, 1, 0.08235294, 0, 1,
-2.116689, 1.049542, -2.662002, 1, 0.09019608, 0, 1,
-2.044815, -1.598532, 0.5329933, 1, 0.09411765, 0, 1,
-2.021257, 1.453769, 1.228291, 1, 0.1019608, 0, 1,
-2.011452, 0.1199683, -0.7567345, 1, 0.1098039, 0, 1,
-1.996986, 0.3324008, -1.973628, 1, 0.1137255, 0, 1,
-1.988388, 1.609031, -0.5779662, 1, 0.1215686, 0, 1,
-1.96566, 1.784227, -0.667833, 1, 0.1254902, 0, 1,
-1.962376, -0.8662336, -1.951111, 1, 0.1333333, 0, 1,
-1.959985, -1.777542, -2.648604, 1, 0.1372549, 0, 1,
-1.943625, 0.06533781, -1.902991, 1, 0.145098, 0, 1,
-1.918818, 1.30344, -3.200514, 1, 0.1490196, 0, 1,
-1.898869, 2.452924, -1.14854, 1, 0.1568628, 0, 1,
-1.889156, -0.7398621, -0.9665635, 1, 0.1607843, 0, 1,
-1.879331, -0.2351093, -1.870043, 1, 0.1686275, 0, 1,
-1.877048, 1.898449, -0.3252165, 1, 0.172549, 0, 1,
-1.873971, 1.036507, -1.720241, 1, 0.1803922, 0, 1,
-1.870101, -0.3613636, -1.852789, 1, 0.1843137, 0, 1,
-1.856637, -0.6667091, -1.869074, 1, 0.1921569, 0, 1,
-1.852632, -0.749533, -1.690392, 1, 0.1960784, 0, 1,
-1.833613, -0.9316411, -1.543275, 1, 0.2039216, 0, 1,
-1.803382, -0.08990361, -3.175563, 1, 0.2117647, 0, 1,
-1.802542, -0.2212959, -1.932331, 1, 0.2156863, 0, 1,
-1.800626, 0.8067885, -2.093083, 1, 0.2235294, 0, 1,
-1.792908, -1.248979, -3.944536, 1, 0.227451, 0, 1,
-1.773268, -0.4495356, -4.672021, 1, 0.2352941, 0, 1,
-1.756688, -0.4765983, -1.874936, 1, 0.2392157, 0, 1,
-1.744271, 2.064069, -0.1360282, 1, 0.2470588, 0, 1,
-1.737786, -1.035239, -1.368166, 1, 0.2509804, 0, 1,
-1.711925, -0.2122408, -1.327531, 1, 0.2588235, 0, 1,
-1.70659, 0.2542394, -1.723761, 1, 0.2627451, 0, 1,
-1.699764, 0.37087, -3.47887, 1, 0.2705882, 0, 1,
-1.687876, 1.250896, 0.06721755, 1, 0.2745098, 0, 1,
-1.684229, -0.9391767, -2.604249, 1, 0.282353, 0, 1,
-1.668343, -1.657559, -2.878596, 1, 0.2862745, 0, 1,
-1.638893, 2.146154, -0.05779332, 1, 0.2941177, 0, 1,
-1.633642, -1.04847, -1.793483, 1, 0.3019608, 0, 1,
-1.607465, -0.197605, -2.583295, 1, 0.3058824, 0, 1,
-1.593575, 0.6285535, 0.3753086, 1, 0.3137255, 0, 1,
-1.58363, 1.465155, -1.186736, 1, 0.3176471, 0, 1,
-1.581837, 0.2866581, -0.5234183, 1, 0.3254902, 0, 1,
-1.579093, 1.371504, -0.4119376, 1, 0.3294118, 0, 1,
-1.578413, 0.2507983, -1.620821, 1, 0.3372549, 0, 1,
-1.566155, 0.3392279, -1.117697, 1, 0.3411765, 0, 1,
-1.543576, 1.413469, 0.20423, 1, 0.3490196, 0, 1,
-1.532784, 0.1100554, -1.366836, 1, 0.3529412, 0, 1,
-1.523198, -0.4314398, -1.043954, 1, 0.3607843, 0, 1,
-1.522818, -0.2722333, -1.426986, 1, 0.3647059, 0, 1,
-1.509803, 2.023625, -1.38756, 1, 0.372549, 0, 1,
-1.480417, 1.327214, 0.1311768, 1, 0.3764706, 0, 1,
-1.471468, -0.2840676, -1.731372, 1, 0.3843137, 0, 1,
-1.456922, 0.8778965, -0.9421346, 1, 0.3882353, 0, 1,
-1.456396, 0.2867968, -2.333312, 1, 0.3960784, 0, 1,
-1.451751, 1.886086, -0.2065107, 1, 0.4039216, 0, 1,
-1.450233, 0.137472, -3.864838, 1, 0.4078431, 0, 1,
-1.446832, -0.2215839, -1.713841, 1, 0.4156863, 0, 1,
-1.425607, 1.526314, -1.357078, 1, 0.4196078, 0, 1,
-1.42482, 0.6259494, -1.838009, 1, 0.427451, 0, 1,
-1.406789, 2.477574, -1.589553, 1, 0.4313726, 0, 1,
-1.401498, 0.5042195, -2.725376, 1, 0.4392157, 0, 1,
-1.400745, -1.013097, -2.445167, 1, 0.4431373, 0, 1,
-1.392512, 2.201491, -0.3045736, 1, 0.4509804, 0, 1,
-1.388574, -0.3719477, -2.196928, 1, 0.454902, 0, 1,
-1.386129, -0.262664, -1.420276, 1, 0.4627451, 0, 1,
-1.379619, -1.284576, -1.160934, 1, 0.4666667, 0, 1,
-1.36913, 1.681786, 0.2344404, 1, 0.4745098, 0, 1,
-1.368857, -0.6477994, -1.700581, 1, 0.4784314, 0, 1,
-1.35684, -1.122437, -2.257403, 1, 0.4862745, 0, 1,
-1.350625, 0.4819707, -2.768325, 1, 0.4901961, 0, 1,
-1.347733, 0.3321545, -1.157195, 1, 0.4980392, 0, 1,
-1.343491, -0.4576954, 0.420686, 1, 0.5058824, 0, 1,
-1.341324, 0.1573274, -3.390867, 1, 0.509804, 0, 1,
-1.331496, 0.4494705, -1.524529, 1, 0.5176471, 0, 1,
-1.32149, 1.451863, -0.09443326, 1, 0.5215687, 0, 1,
-1.318371, 0.4082224, -2.414907, 1, 0.5294118, 0, 1,
-1.317076, -0.1781857, -2.949404, 1, 0.5333334, 0, 1,
-1.31654, 0.7473035, -1.216283, 1, 0.5411765, 0, 1,
-1.314795, 0.1186735, -4.063027, 1, 0.5450981, 0, 1,
-1.302404, 1.07245, -1.533834, 1, 0.5529412, 0, 1,
-1.301691, 0.6597037, -0.5385115, 1, 0.5568628, 0, 1,
-1.300138, 0.3250332, -1.56977, 1, 0.5647059, 0, 1,
-1.291252, 0.7842094, -2.152261, 1, 0.5686275, 0, 1,
-1.275106, 0.2779328, -0.4014124, 1, 0.5764706, 0, 1,
-1.268372, 0.2611035, -2.543345, 1, 0.5803922, 0, 1,
-1.26163, -0.5967985, -1.014901, 1, 0.5882353, 0, 1,
-1.243063, -1.410768, -1.894596, 1, 0.5921569, 0, 1,
-1.232034, -0.4058933, -2.013348, 1, 0.6, 0, 1,
-1.231926, 0.8988321, -0.3947284, 1, 0.6078432, 0, 1,
-1.229668, -0.09208106, -0.09902003, 1, 0.6117647, 0, 1,
-1.21941, 1.560515, -0.2065169, 1, 0.6196079, 0, 1,
-1.201773, -0.4104473, -2.098086, 1, 0.6235294, 0, 1,
-1.20114, 0.194618, -1.971481, 1, 0.6313726, 0, 1,
-1.193262, 1.335805, -1.845366, 1, 0.6352941, 0, 1,
-1.185908, 0.3928612, -1.458592, 1, 0.6431373, 0, 1,
-1.182465, -0.5532557, -1.114441, 1, 0.6470588, 0, 1,
-1.177462, 1.495709, -1.108327, 1, 0.654902, 0, 1,
-1.175324, -0.09667328, -1.421093, 1, 0.6588235, 0, 1,
-1.162619, -0.7900541, -2.393768, 1, 0.6666667, 0, 1,
-1.156383, 0.9541549, -0.910323, 1, 0.6705883, 0, 1,
-1.144988, 0.9787749, -0.05239167, 1, 0.6784314, 0, 1,
-1.130727, 1.118072, -2.53092, 1, 0.682353, 0, 1,
-1.129018, -1.05968, -3.058605, 1, 0.6901961, 0, 1,
-1.123362, -1.425482, -6.112141, 1, 0.6941177, 0, 1,
-1.11742, -1.272978, -2.179354, 1, 0.7019608, 0, 1,
-1.114678, -0.463486, -1.728931, 1, 0.7098039, 0, 1,
-1.101712, 0.9427906, -2.496912, 1, 0.7137255, 0, 1,
-1.098429, -0.5877585, -2.509324, 1, 0.7215686, 0, 1,
-1.097863, -1.763278, -2.410792, 1, 0.7254902, 0, 1,
-1.08954, 1.040712, -0.2011205, 1, 0.7333333, 0, 1,
-1.087152, -2.510849, -2.044094, 1, 0.7372549, 0, 1,
-1.08621, 1.446902, -0.03114776, 1, 0.7450981, 0, 1,
-1.076883, -0.136053, -0.9699215, 1, 0.7490196, 0, 1,
-1.076088, -2.135993, -2.345058, 1, 0.7568628, 0, 1,
-1.073701, 1.188389, 0.8097602, 1, 0.7607843, 0, 1,
-1.070372, -1.927422, -2.431596, 1, 0.7686275, 0, 1,
-1.058446, 0.488355, -1.441501, 1, 0.772549, 0, 1,
-1.040818, -1.633881, -1.512739, 1, 0.7803922, 0, 1,
-1.040538, -1.630018, -3.726994, 1, 0.7843137, 0, 1,
-1.039241, 0.4895383, -3.320779, 1, 0.7921569, 0, 1,
-1.034229, -1.65625, -2.095269, 1, 0.7960784, 0, 1,
-1.028861, 1.849011, 0.6219717, 1, 0.8039216, 0, 1,
-1.024761, 2.656067, 0.4441556, 1, 0.8117647, 0, 1,
-1.024201, -2.191075, -2.042305, 1, 0.8156863, 0, 1,
-1.02346, 0.1963918, -2.321826, 1, 0.8235294, 0, 1,
-1.018211, 0.6306092, 0.3984772, 1, 0.827451, 0, 1,
-1.018089, 0.3803074, -1.339106, 1, 0.8352941, 0, 1,
-1.005765, 2.3237, 1.483335, 1, 0.8392157, 0, 1,
-1.005313, 0.2532907, -1.659257, 1, 0.8470588, 0, 1,
-1.000875, -0.09242692, -3.55737, 1, 0.8509804, 0, 1,
-0.9963449, 1.135912, 0.180367, 1, 0.8588235, 0, 1,
-0.9902358, 0.2120989, -2.063397, 1, 0.8627451, 0, 1,
-0.9886094, -0.3682236, -2.983871, 1, 0.8705882, 0, 1,
-0.9866598, 0.450635, -2.463059, 1, 0.8745098, 0, 1,
-0.9864066, 1.718015, 0.1875806, 1, 0.8823529, 0, 1,
-0.9771361, 1.286161, -0.7449947, 1, 0.8862745, 0, 1,
-0.9770404, -1.017129, -1.873582, 1, 0.8941177, 0, 1,
-0.9753197, 0.6618351, -0.5851006, 1, 0.8980392, 0, 1,
-0.9619443, 2.207786, 0.6145341, 1, 0.9058824, 0, 1,
-0.9606261, -1.205784, -2.100642, 1, 0.9137255, 0, 1,
-0.9439395, 0.9106682, -1.981615, 1, 0.9176471, 0, 1,
-0.9388598, -0.7387075, -2.066282, 1, 0.9254902, 0, 1,
-0.9378896, 0.7266085, -0.2343308, 1, 0.9294118, 0, 1,
-0.9347147, 0.7399383, -0.2500094, 1, 0.9372549, 0, 1,
-0.9336301, 1.205887, -0.4641717, 1, 0.9411765, 0, 1,
-0.9279379, -0.1646147, -2.173445, 1, 0.9490196, 0, 1,
-0.924291, -1.156565, -3.915881, 1, 0.9529412, 0, 1,
-0.9226823, -0.5661498, -3.258038, 1, 0.9607843, 0, 1,
-0.9202664, -0.3665562, -1.315742, 1, 0.9647059, 0, 1,
-0.9197733, 0.682956, -1.450277, 1, 0.972549, 0, 1,
-0.9190897, 0.9895505, -1.288188, 1, 0.9764706, 0, 1,
-0.9173644, -0.5727057, -3.238362, 1, 0.9843137, 0, 1,
-0.9172222, 1.109309, 0.6568168, 1, 0.9882353, 0, 1,
-0.9108583, -0.5137414, -2.392934, 1, 0.9960784, 0, 1,
-0.9082708, -0.6951897, -2.627152, 0.9960784, 1, 0, 1,
-0.9005231, -0.9807738, -2.597528, 0.9921569, 1, 0, 1,
-0.8991778, 0.6899922, -0.09201083, 0.9843137, 1, 0, 1,
-0.896997, 1.08054, -0.7397589, 0.9803922, 1, 0, 1,
-0.8936931, -1.307466, -0.762742, 0.972549, 1, 0, 1,
-0.8923659, 0.006946415, -1.236841, 0.9686275, 1, 0, 1,
-0.8909815, 0.3835508, -1.082999, 0.9607843, 1, 0, 1,
-0.8902699, -0.1889116, -1.360355, 0.9568627, 1, 0, 1,
-0.8886989, -0.3961329, -1.855443, 0.9490196, 1, 0, 1,
-0.8864392, 0.5159626, 0.2744708, 0.945098, 1, 0, 1,
-0.8812507, 1.07493, 0.8529477, 0.9372549, 1, 0, 1,
-0.8752283, -0.9593052, -1.852958, 0.9333333, 1, 0, 1,
-0.8693308, 0.05031357, -0.5203562, 0.9254902, 1, 0, 1,
-0.8644879, 1.106558, -1.14947, 0.9215686, 1, 0, 1,
-0.8609109, 0.1773475, -1.219594, 0.9137255, 1, 0, 1,
-0.8536475, -0.1431411, -1.353146, 0.9098039, 1, 0, 1,
-0.8528056, -1.151914, -1.526658, 0.9019608, 1, 0, 1,
-0.8516704, 2.190132, 0.7960278, 0.8941177, 1, 0, 1,
-0.8478152, 0.08620879, -1.469437, 0.8901961, 1, 0, 1,
-0.8448542, 0.0981678, -1.522823, 0.8823529, 1, 0, 1,
-0.8333552, -1.974475, -2.464588, 0.8784314, 1, 0, 1,
-0.8330167, 0.318022, -0.5774644, 0.8705882, 1, 0, 1,
-0.8295963, 0.5950688, -3.425513, 0.8666667, 1, 0, 1,
-0.8295221, -0.7637076, -1.452301, 0.8588235, 1, 0, 1,
-0.8213934, 0.6582904, -1.010318, 0.854902, 1, 0, 1,
-0.8204668, 1.135678, -1.32619, 0.8470588, 1, 0, 1,
-0.8189086, -2.596468, -3.496482, 0.8431373, 1, 0, 1,
-0.8167904, -0.9737737, -2.767901, 0.8352941, 1, 0, 1,
-0.8102165, 1.034065, -0.1320709, 0.8313726, 1, 0, 1,
-0.7984652, -0.38721, 0.03922457, 0.8235294, 1, 0, 1,
-0.7881892, -0.1252805, -1.925903, 0.8196079, 1, 0, 1,
-0.7880727, 2.286892, -1.602201, 0.8117647, 1, 0, 1,
-0.781685, 0.2882801, 0.687443, 0.8078431, 1, 0, 1,
-0.7816519, 0.4675075, -0.3605253, 0.8, 1, 0, 1,
-0.7803642, 0.07059788, -1.72346, 0.7921569, 1, 0, 1,
-0.7775771, -0.5885409, -1.166206, 0.7882353, 1, 0, 1,
-0.7694185, 0.7275531, 0.3472598, 0.7803922, 1, 0, 1,
-0.7667903, 0.09347263, -1.310754, 0.7764706, 1, 0, 1,
-0.7577899, -0.2504528, -2.733644, 0.7686275, 1, 0, 1,
-0.751545, 1.517431, 0.5271586, 0.7647059, 1, 0, 1,
-0.749068, -0.6384949, -2.34254, 0.7568628, 1, 0, 1,
-0.7395628, 2.144302, 1.029398, 0.7529412, 1, 0, 1,
-0.7379935, -0.7547227, -0.3234915, 0.7450981, 1, 0, 1,
-0.7372187, 0.413752, -0.6962038, 0.7411765, 1, 0, 1,
-0.7352952, -1.228218, -1.814311, 0.7333333, 1, 0, 1,
-0.7350894, -0.8128734, -4.119556, 0.7294118, 1, 0, 1,
-0.7350894, -0.4141554, -4.324997, 0.7215686, 1, 0, 1,
-0.7277851, 0.5620769, -0.3231739, 0.7176471, 1, 0, 1,
-0.7262289, 0.01994878, -1.349674, 0.7098039, 1, 0, 1,
-0.7189162, 0.527635, -1.983237, 0.7058824, 1, 0, 1,
-0.7178476, -0.3641644, -3.650454, 0.6980392, 1, 0, 1,
-0.716277, 1.674319, -0.4123448, 0.6901961, 1, 0, 1,
-0.7151095, -0.7219453, -3.518437, 0.6862745, 1, 0, 1,
-0.7061492, -0.4988035, -3.975902, 0.6784314, 1, 0, 1,
-0.7036166, -0.03205698, -1.113821, 0.6745098, 1, 0, 1,
-0.7015664, -0.5413703, -1.516424, 0.6666667, 1, 0, 1,
-0.7007265, 0.1756502, -1.798432, 0.6627451, 1, 0, 1,
-0.6990254, 0.2557599, -0.7400746, 0.654902, 1, 0, 1,
-0.6869347, -0.5655678, -0.5372463, 0.6509804, 1, 0, 1,
-0.6827661, 0.9508182, -2.396382, 0.6431373, 1, 0, 1,
-0.6820367, -0.488605, -2.844045, 0.6392157, 1, 0, 1,
-0.677371, -1.951437, -4.609639, 0.6313726, 1, 0, 1,
-0.6656994, 2.805635, 2.196843, 0.627451, 1, 0, 1,
-0.6631092, -1.551173, -2.681609, 0.6196079, 1, 0, 1,
-0.6593099, -0.1375699, -1.720405, 0.6156863, 1, 0, 1,
-0.6590388, 0.07682434, -1.343089, 0.6078432, 1, 0, 1,
-0.6564175, 0.4305069, -0.9337904, 0.6039216, 1, 0, 1,
-0.6564022, 0.5633885, 0.3233542, 0.5960785, 1, 0, 1,
-0.6562567, 1.109388, -1.2327, 0.5882353, 1, 0, 1,
-0.6521505, -1.716838, -4.241216, 0.5843138, 1, 0, 1,
-0.6493798, 0.3428716, -1.903813, 0.5764706, 1, 0, 1,
-0.6343645, 0.4049003, -1.872848, 0.572549, 1, 0, 1,
-0.6312852, 0.4363568, -1.153513, 0.5647059, 1, 0, 1,
-0.630706, 1.049744, -0.450123, 0.5607843, 1, 0, 1,
-0.6299854, -0.1671353, -1.058284, 0.5529412, 1, 0, 1,
-0.6297945, -0.3084023, -3.145751, 0.5490196, 1, 0, 1,
-0.6212218, 0.212214, -0.3037733, 0.5411765, 1, 0, 1,
-0.6174296, 1.181789, 1.211837, 0.5372549, 1, 0, 1,
-0.6155481, -0.01600807, -2.620178, 0.5294118, 1, 0, 1,
-0.6138954, -1.011925, -4.978764, 0.5254902, 1, 0, 1,
-0.6123728, 1.488347, -1.473523, 0.5176471, 1, 0, 1,
-0.6066685, -0.7027466, -3.428033, 0.5137255, 1, 0, 1,
-0.6064414, 0.2154747, -1.14651, 0.5058824, 1, 0, 1,
-0.6063462, -0.9681531, -3.178424, 0.5019608, 1, 0, 1,
-0.6017082, -0.3579411, -2.360175, 0.4941176, 1, 0, 1,
-0.6007616, 0.6140924, 0.59662, 0.4862745, 1, 0, 1,
-0.5983546, -0.556179, -1.962908, 0.4823529, 1, 0, 1,
-0.5969861, -0.1586459, 0.2852911, 0.4745098, 1, 0, 1,
-0.5909432, 2.594268, -0.585842, 0.4705882, 1, 0, 1,
-0.5885429, -0.6558947, -2.488714, 0.4627451, 1, 0, 1,
-0.5883103, -0.2850774, -3.433721, 0.4588235, 1, 0, 1,
-0.5808379, -2.486977, -2.802392, 0.4509804, 1, 0, 1,
-0.5772488, 0.6000605, -2.549819, 0.4470588, 1, 0, 1,
-0.5763131, 1.024139, 1.332037, 0.4392157, 1, 0, 1,
-0.5662969, -1.021425, -1.877491, 0.4352941, 1, 0, 1,
-0.5656224, -2.310371, -4.260509, 0.427451, 1, 0, 1,
-0.5645034, 0.2792563, -0.8922802, 0.4235294, 1, 0, 1,
-0.5627844, 1.406704, -0.00262225, 0.4156863, 1, 0, 1,
-0.559051, -0.6992394, -3.250321, 0.4117647, 1, 0, 1,
-0.5590119, 0.6776564, -2.529335, 0.4039216, 1, 0, 1,
-0.5551435, -1.752503, -2.818499, 0.3960784, 1, 0, 1,
-0.5528792, 1.201567, 0.144886, 0.3921569, 1, 0, 1,
-0.545271, -0.04122287, -1.43073, 0.3843137, 1, 0, 1,
-0.5417896, -1.324185, -4.158751, 0.3803922, 1, 0, 1,
-0.5369893, 0.3434749, 0.02702083, 0.372549, 1, 0, 1,
-0.5299321, 0.3321884, -3.663794, 0.3686275, 1, 0, 1,
-0.5298507, -0.3588579, -2.182331, 0.3607843, 1, 0, 1,
-0.5296528, -0.1109529, -1.700755, 0.3568628, 1, 0, 1,
-0.5281245, 0.9122041, 0.0728863, 0.3490196, 1, 0, 1,
-0.5257197, -1.765554, -2.458063, 0.345098, 1, 0, 1,
-0.5254933, -0.9451308, -2.181084, 0.3372549, 1, 0, 1,
-0.5175368, -0.5784788, -1.980891, 0.3333333, 1, 0, 1,
-0.5158096, 0.3824941, -0.6239588, 0.3254902, 1, 0, 1,
-0.5128014, -0.891632, -4.561551, 0.3215686, 1, 0, 1,
-0.5118954, -1.703724, -0.5265304, 0.3137255, 1, 0, 1,
-0.5081908, 0.854514, -0.6393676, 0.3098039, 1, 0, 1,
-0.507188, -0.7799992, -1.554598, 0.3019608, 1, 0, 1,
-0.505021, -0.7868483, -2.218788, 0.2941177, 1, 0, 1,
-0.5047421, 1.807308, 1.36611, 0.2901961, 1, 0, 1,
-0.4934115, -0.7922758, -3.59766, 0.282353, 1, 0, 1,
-0.4927878, -0.5325015, -2.080926, 0.2784314, 1, 0, 1,
-0.4871831, 0.1243212, -0.6591062, 0.2705882, 1, 0, 1,
-0.4837952, 0.1053824, -1.115119, 0.2666667, 1, 0, 1,
-0.4825964, -0.8278016, -2.120875, 0.2588235, 1, 0, 1,
-0.4815203, -0.08806685, -1.202954, 0.254902, 1, 0, 1,
-0.4782091, 1.541187, -1.040989, 0.2470588, 1, 0, 1,
-0.4775383, -1.852106, -1.496822, 0.2431373, 1, 0, 1,
-0.4757528, 0.4752742, -1.064723, 0.2352941, 1, 0, 1,
-0.4752566, -2.247242, -1.802576, 0.2313726, 1, 0, 1,
-0.4744698, -1.188745, -1.251384, 0.2235294, 1, 0, 1,
-0.4727964, 0.8167914, -1.006866, 0.2196078, 1, 0, 1,
-0.4722086, 2.015836, 0.6121237, 0.2117647, 1, 0, 1,
-0.4646445, 0.2843113, -0.3269814, 0.2078431, 1, 0, 1,
-0.4621896, -1.479318, -1.135692, 0.2, 1, 0, 1,
-0.4541132, 1.384056, 0.8226545, 0.1921569, 1, 0, 1,
-0.4522514, 0.9937846, -2.046979, 0.1882353, 1, 0, 1,
-0.4510081, 1.271177, -0.5560269, 0.1803922, 1, 0, 1,
-0.4495352, 0.3403936, -1.376362, 0.1764706, 1, 0, 1,
-0.4494404, 0.7010246, -1.255086, 0.1686275, 1, 0, 1,
-0.443731, 1.206575, 0.5404512, 0.1647059, 1, 0, 1,
-0.4416349, 0.01964219, -3.500475, 0.1568628, 1, 0, 1,
-0.4407299, 0.1636081, -0.9695354, 0.1529412, 1, 0, 1,
-0.4394045, -0.2724936, -1.402722, 0.145098, 1, 0, 1,
-0.4383655, 0.3950939, -0.1074674, 0.1411765, 1, 0, 1,
-0.4337192, -1.265981, -3.063153, 0.1333333, 1, 0, 1,
-0.4286036, 1.714492, -0.7053753, 0.1294118, 1, 0, 1,
-0.4281613, 1.294256, 0.1376348, 0.1215686, 1, 0, 1,
-0.4230483, 0.05590212, -2.537147, 0.1176471, 1, 0, 1,
-0.4229296, 0.6287671, -0.6242492, 0.1098039, 1, 0, 1,
-0.4225507, -2.282153, -3.368487, 0.1058824, 1, 0, 1,
-0.4210528, -0.554086, -3.113667, 0.09803922, 1, 0, 1,
-0.4198644, 0.2725005, -0.8213667, 0.09019608, 1, 0, 1,
-0.4198372, 1.21961, -0.4710859, 0.08627451, 1, 0, 1,
-0.4187868, 0.07586162, -0.6621208, 0.07843138, 1, 0, 1,
-0.4170758, 1.111261, 1.03167, 0.07450981, 1, 0, 1,
-0.4094565, -0.5554625, -3.706231, 0.06666667, 1, 0, 1,
-0.4007185, 0.3976715, 0.3683057, 0.0627451, 1, 0, 1,
-0.397558, 0.4562372, -1.34902, 0.05490196, 1, 0, 1,
-0.3962891, 0.8010767, 0.2791265, 0.05098039, 1, 0, 1,
-0.3945464, 0.536931, -1.168393, 0.04313726, 1, 0, 1,
-0.3933148, 1.670937, -0.4401651, 0.03921569, 1, 0, 1,
-0.3928166, -1.428063, -4.413003, 0.03137255, 1, 0, 1,
-0.390103, 1.323488, -0.6612009, 0.02745098, 1, 0, 1,
-0.3875804, -0.3360215, -0.02307739, 0.01960784, 1, 0, 1,
-0.3864974, -1.226324, -3.888849, 0.01568628, 1, 0, 1,
-0.3861734, -0.8766677, -1.106716, 0.007843138, 1, 0, 1,
-0.385049, 0.1021969, -2.042161, 0.003921569, 1, 0, 1,
-0.383466, 0.2466807, -1.886232, 0, 1, 0.003921569, 1,
-0.3786989, 1.158504, -0.8914638, 0, 1, 0.01176471, 1,
-0.3779192, -0.7291383, -2.236145, 0, 1, 0.01568628, 1,
-0.3760754, -0.3328176, -1.73528, 0, 1, 0.02352941, 1,
-0.3749276, -0.8682224, -2.02826, 0, 1, 0.02745098, 1,
-0.37114, -0.4731643, -1.602726, 0, 1, 0.03529412, 1,
-0.3711321, -0.8005723, -2.215371, 0, 1, 0.03921569, 1,
-0.365142, 1.008815, 0.8295439, 0, 1, 0.04705882, 1,
-0.3586522, -0.3318938, -1.565455, 0, 1, 0.05098039, 1,
-0.3567163, -0.1036396, -0.3993883, 0, 1, 0.05882353, 1,
-0.3523199, 0.3127302, -2.30362, 0, 1, 0.0627451, 1,
-0.3522256, -0.05344548, -1.3989, 0, 1, 0.07058824, 1,
-0.350367, 0.2492517, -1.591584, 0, 1, 0.07450981, 1,
-0.3494012, -0.5568756, -1.039464, 0, 1, 0.08235294, 1,
-0.3461092, -0.08103317, -2.985928, 0, 1, 0.08627451, 1,
-0.343915, -0.9289854, -3.398998, 0, 1, 0.09411765, 1,
-0.3429744, 0.6733572, -1.517158, 0, 1, 0.1019608, 1,
-0.3398304, 1.01074, -0.8215662, 0, 1, 0.1058824, 1,
-0.3398109, 0.1421289, -2.682428, 0, 1, 0.1137255, 1,
-0.3371744, -0.3973402, -0.8451645, 0, 1, 0.1176471, 1,
-0.3318627, 2.375964, 0.618857, 0, 1, 0.1254902, 1,
-0.3307149, -2.673254, -3.828341, 0, 1, 0.1294118, 1,
-0.3229281, 1.491758, -1.655691, 0, 1, 0.1372549, 1,
-0.3203245, -0.1507005, -4.387148, 0, 1, 0.1411765, 1,
-0.320008, 1.92854, -2.633588, 0, 1, 0.1490196, 1,
-0.3194845, 1.133649, -1.117319, 0, 1, 0.1529412, 1,
-0.3158802, -1.195657, -2.740584, 0, 1, 0.1607843, 1,
-0.3154366, 1.261009, -1.935784, 0, 1, 0.1647059, 1,
-0.3151586, -1.243635, -3.069825, 0, 1, 0.172549, 1,
-0.3143082, 2.507412, 0.851378, 0, 1, 0.1764706, 1,
-0.3099589, 0.0660791, -1.028489, 0, 1, 0.1843137, 1,
-0.3076064, -0.6106231, -1.951709, 0, 1, 0.1882353, 1,
-0.3023243, 0.5995695, 0.8945894, 0, 1, 0.1960784, 1,
-0.3006393, -0.2318626, -2.094533, 0, 1, 0.2039216, 1,
-0.294384, 0.01330803, -0.6196071, 0, 1, 0.2078431, 1,
-0.2933864, -0.4811862, -1.914627, 0, 1, 0.2156863, 1,
-0.2909831, 0.7300507, -0.7332473, 0, 1, 0.2196078, 1,
-0.2904846, 1.161616, 1.471773, 0, 1, 0.227451, 1,
-0.2898262, 0.5764001, -0.7388154, 0, 1, 0.2313726, 1,
-0.2886561, -0.2882093, -2.413775, 0, 1, 0.2392157, 1,
-0.2878064, 1.905016, 1.135743, 0, 1, 0.2431373, 1,
-0.2871359, -2.742413, -2.943988, 0, 1, 0.2509804, 1,
-0.2856754, -1.348527, -4.253357, 0, 1, 0.254902, 1,
-0.285047, -1.113086, -2.344206, 0, 1, 0.2627451, 1,
-0.2818984, -1.193397, -4.244577, 0, 1, 0.2666667, 1,
-0.2791804, 0.4484139, -1.651108, 0, 1, 0.2745098, 1,
-0.2740328, 0.2031379, -0.8197192, 0, 1, 0.2784314, 1,
-0.2732774, -0.05531878, -2.587418, 0, 1, 0.2862745, 1,
-0.2696439, -0.8332267, -2.759655, 0, 1, 0.2901961, 1,
-0.2694364, 0.5946034, -0.3925831, 0, 1, 0.2980392, 1,
-0.2674181, 0.8637929, -1.693631, 0, 1, 0.3058824, 1,
-0.2658322, -0.2668055, -3.258563, 0, 1, 0.3098039, 1,
-0.2641073, 1.496115, -0.9370175, 0, 1, 0.3176471, 1,
-0.2603755, -0.7280253, -2.556192, 0, 1, 0.3215686, 1,
-0.2583109, -0.613377, -4.797522, 0, 1, 0.3294118, 1,
-0.251146, 0.05663171, -3.52565, 0, 1, 0.3333333, 1,
-0.2485427, -1.229776, -2.628109, 0, 1, 0.3411765, 1,
-0.2479823, -0.3844371, -3.170043, 0, 1, 0.345098, 1,
-0.2461357, 0.5567839, 1.695796, 0, 1, 0.3529412, 1,
-0.2441315, -1.365421, -2.507734, 0, 1, 0.3568628, 1,
-0.240464, -0.8528731, -3.3636, 0, 1, 0.3647059, 1,
-0.2376801, -0.4078985, -1.317286, 0, 1, 0.3686275, 1,
-0.2345882, 0.2230108, -0.6864103, 0, 1, 0.3764706, 1,
-0.2330052, -1.940873, -3.43387, 0, 1, 0.3803922, 1,
-0.2323608, -2.125572, -4.337598, 0, 1, 0.3882353, 1,
-0.2316398, -0.4831611, -2.585577, 0, 1, 0.3921569, 1,
-0.2305113, -0.3642155, -2.547496, 0, 1, 0.4, 1,
-0.2295955, -0.4305475, -3.563101, 0, 1, 0.4078431, 1,
-0.2236784, -0.5922072, -2.559642, 0, 1, 0.4117647, 1,
-0.2210677, 1.031956, 0.2974176, 0, 1, 0.4196078, 1,
-0.2178743, -0.7411901, -2.586972, 0, 1, 0.4235294, 1,
-0.216831, -1.279435, -3.406312, 0, 1, 0.4313726, 1,
-0.2135047, 1.401373, -0.1879218, 0, 1, 0.4352941, 1,
-0.2130285, -0.7123209, -2.187522, 0, 1, 0.4431373, 1,
-0.2123405, 0.3494578, -0.6494397, 0, 1, 0.4470588, 1,
-0.2119865, 0.7952371, -0.2949223, 0, 1, 0.454902, 1,
-0.211697, 0.2369562, -0.7186226, 0, 1, 0.4588235, 1,
-0.2097331, -0.0893373, -2.053781, 0, 1, 0.4666667, 1,
-0.2085684, 0.5100374, -0.3279528, 0, 1, 0.4705882, 1,
-0.2085339, 0.3161368, -1.493588, 0, 1, 0.4784314, 1,
-0.2079699, 1.582449, -0.01358457, 0, 1, 0.4823529, 1,
-0.2059137, -0.04562726, -0.9549777, 0, 1, 0.4901961, 1,
-0.2055781, -0.438272, -2.743486, 0, 1, 0.4941176, 1,
-0.2054487, 0.4104225, 0.05778938, 0, 1, 0.5019608, 1,
-0.2008789, -0.5659138, -3.009419, 0, 1, 0.509804, 1,
-0.2004209, 0.2003657, -1.708964, 0, 1, 0.5137255, 1,
-0.1994298, -0.589913, -2.7147, 0, 1, 0.5215687, 1,
-0.1985241, 0.4517896, -2.127596, 0, 1, 0.5254902, 1,
-0.1931818, 0.04358756, -2.095318, 0, 1, 0.5333334, 1,
-0.1911001, 1.578276, 0.3165284, 0, 1, 0.5372549, 1,
-0.1870648, 1.52298, -1.18496, 0, 1, 0.5450981, 1,
-0.1863083, -0.1546183, -3.331997, 0, 1, 0.5490196, 1,
-0.1860713, 0.9903358, -1.4609, 0, 1, 0.5568628, 1,
-0.1846147, -0.701448, -3.243058, 0, 1, 0.5607843, 1,
-0.1831827, -1.291847, -3.80767, 0, 1, 0.5686275, 1,
-0.1817573, -0.9235066, -3.747159, 0, 1, 0.572549, 1,
-0.1799805, 1.216396, -1.239396, 0, 1, 0.5803922, 1,
-0.1722014, 0.1821222, -0.3087794, 0, 1, 0.5843138, 1,
-0.1718559, -0.3914753, -4.344009, 0, 1, 0.5921569, 1,
-0.1713331, 0.3098374, 0.1926909, 0, 1, 0.5960785, 1,
-0.1703727, 0.08753802, -1.066471, 0, 1, 0.6039216, 1,
-0.1699419, 1.441571, -1.123045, 0, 1, 0.6117647, 1,
-0.1677162, -0.1511932, -2.016566, 0, 1, 0.6156863, 1,
-0.1634228, 0.3784036, 0.3439504, 0, 1, 0.6235294, 1,
-0.1614937, -0.7629426, -1.737024, 0, 1, 0.627451, 1,
-0.16136, 1.313856, -1.296055, 0, 1, 0.6352941, 1,
-0.1591364, -0.6258359, -3.840214, 0, 1, 0.6392157, 1,
-0.1582262, -0.5992702, -3.379988, 0, 1, 0.6470588, 1,
-0.156762, 1.443042, -0.769803, 0, 1, 0.6509804, 1,
-0.1557587, -0.1266382, -3.081643, 0, 1, 0.6588235, 1,
-0.1551695, 0.5123786, 0.3768359, 0, 1, 0.6627451, 1,
-0.1537217, -0.9433998, -3.252132, 0, 1, 0.6705883, 1,
-0.1501279, -1.597192, -1.084788, 0, 1, 0.6745098, 1,
-0.1459244, 0.2042986, 1.179983, 0, 1, 0.682353, 1,
-0.1433223, 0.8332675, -0.46109, 0, 1, 0.6862745, 1,
-0.1397405, 1.060066, -0.5401312, 0, 1, 0.6941177, 1,
-0.1377634, 0.367118, 0.6558579, 0, 1, 0.7019608, 1,
-0.1361726, -2.076186, -1.767562, 0, 1, 0.7058824, 1,
-0.1341297, 0.8136391, -1.528389, 0, 1, 0.7137255, 1,
-0.12334, 1.116544, -0.1799703, 0, 1, 0.7176471, 1,
-0.1229921, -0.08878739, -1.237662, 0, 1, 0.7254902, 1,
-0.122561, -0.2715615, -3.917848, 0, 1, 0.7294118, 1,
-0.1193044, 0.7653825, 0.2608446, 0, 1, 0.7372549, 1,
-0.1161136, 0.6246048, -0.2399893, 0, 1, 0.7411765, 1,
-0.1158693, -0.9094564, -2.230407, 0, 1, 0.7490196, 1,
-0.1056278, 0.1432273, -1.392179, 0, 1, 0.7529412, 1,
-0.1033843, -0.3194745, -2.578165, 0, 1, 0.7607843, 1,
-0.1024117, 0.3340337, -1.52206, 0, 1, 0.7647059, 1,
-0.09508176, -0.8760158, -2.97863, 0, 1, 0.772549, 1,
-0.09470227, -0.5101544, -2.274933, 0, 1, 0.7764706, 1,
-0.09244587, 0.1671222, -0.7832611, 0, 1, 0.7843137, 1,
-0.0919081, -1.279331, -2.995304, 0, 1, 0.7882353, 1,
-0.08784239, 0.0924225, -0.4519757, 0, 1, 0.7960784, 1,
-0.08629067, -0.8112617, -2.685448, 0, 1, 0.8039216, 1,
-0.08529519, -0.3051354, -2.296229, 0, 1, 0.8078431, 1,
-0.08273588, -0.3470104, -4.144527, 0, 1, 0.8156863, 1,
-0.08048142, 1.201683, 0.1184342, 0, 1, 0.8196079, 1,
-0.07917647, -0.5954443, -2.484695, 0, 1, 0.827451, 1,
-0.07820833, -0.8900355, -1.87106, 0, 1, 0.8313726, 1,
-0.07719557, -2.222979, -4.560079, 0, 1, 0.8392157, 1,
-0.072711, 0.994435, -0.7382118, 0, 1, 0.8431373, 1,
-0.07101901, 0.0936911, -0.1134586, 0, 1, 0.8509804, 1,
-0.0707495, -0.9951892, -2.398971, 0, 1, 0.854902, 1,
-0.07045919, 1.44346, -0.4780294, 0, 1, 0.8627451, 1,
-0.06728609, -1.73413, -3.191911, 0, 1, 0.8666667, 1,
-0.06723414, -1.28807, -3.517067, 0, 1, 0.8745098, 1,
-0.06551172, -0.5953837, -3.189328, 0, 1, 0.8784314, 1,
-0.06344594, 0.0363822, -0.6698527, 0, 1, 0.8862745, 1,
-0.06291209, 0.6889004, 0.7995579, 0, 1, 0.8901961, 1,
-0.05864893, 0.9377079, -1.109122, 0, 1, 0.8980392, 1,
-0.05645011, -0.9806011, -2.80176, 0, 1, 0.9058824, 1,
-0.04541337, -0.01529134, -0.6896549, 0, 1, 0.9098039, 1,
-0.04539836, -0.885327, -2.215631, 0, 1, 0.9176471, 1,
-0.0442525, 0.4881591, -1.233794, 0, 1, 0.9215686, 1,
-0.04408026, 1.340014, 2.605543, 0, 1, 0.9294118, 1,
-0.04337079, -0.4964243, -3.00528, 0, 1, 0.9333333, 1,
-0.03594215, 0.2406072, -1.946488, 0, 1, 0.9411765, 1,
-0.03321656, -0.5007285, -1.536244, 0, 1, 0.945098, 1,
-0.03157527, -0.1714588, -1.084255, 0, 1, 0.9529412, 1,
-0.02861999, 0.06385668, -0.5181202, 0, 1, 0.9568627, 1,
-0.02790119, -0.2332986, -2.520961, 0, 1, 0.9647059, 1,
-0.02705178, 0.9987656, 0.2618263, 0, 1, 0.9686275, 1,
-0.02605059, 0.6018529, -1.112764, 0, 1, 0.9764706, 1,
-0.02161208, 0.001255317, -0.08459, 0, 1, 0.9803922, 1,
-0.01277523, -0.09150633, -1.712381, 0, 1, 0.9882353, 1,
-0.01051868, 1.902407, 0.1196343, 0, 1, 0.9921569, 1,
-0.008671177, -1.29546, -3.199191, 0, 1, 1, 1,
-0.006466234, 0.8267973, -0.6547995, 0, 0.9921569, 1, 1,
-0.004186811, -1.47347, -1.90654, 0, 0.9882353, 1, 1,
-0.002326446, 0.08635353, 1.18135, 0, 0.9803922, 1, 1,
-0.001473702, -0.7997526, -3.936458, 0, 0.9764706, 1, 1,
0.0007232179, 1.679821, -0.610153, 0, 0.9686275, 1, 1,
0.003811288, -0.5753953, 4.939704, 0, 0.9647059, 1, 1,
0.005280236, 0.2757365, -1.547591, 0, 0.9568627, 1, 1,
0.006752119, 0.07004533, -0.5505198, 0, 0.9529412, 1, 1,
0.007763589, -1.24672, 3.66382, 0, 0.945098, 1, 1,
0.01153993, 0.1003587, -0.7243206, 0, 0.9411765, 1, 1,
0.01211858, 0.9787279, -0.9891238, 0, 0.9333333, 1, 1,
0.02805784, 0.212685, 0.8230647, 0, 0.9294118, 1, 1,
0.02826741, 0.9563726, -0.9153168, 0, 0.9215686, 1, 1,
0.02932226, -0.04276142, 1.793881, 0, 0.9176471, 1, 1,
0.03118326, -0.5368161, 4.242458, 0, 0.9098039, 1, 1,
0.03218049, -0.1974035, 3.488179, 0, 0.9058824, 1, 1,
0.03439308, 0.3913501, 0.7193496, 0, 0.8980392, 1, 1,
0.03482918, -1.212539, 3.29826, 0, 0.8901961, 1, 1,
0.04712362, -0.2596465, 2.279728, 0, 0.8862745, 1, 1,
0.04825929, -1.292974, 4.981237, 0, 0.8784314, 1, 1,
0.05124933, -0.8536609, 4.174397, 0, 0.8745098, 1, 1,
0.05375365, 0.1277304, 0.6880943, 0, 0.8666667, 1, 1,
0.05878362, -0.07647983, 1.863313, 0, 0.8627451, 1, 1,
0.06016342, -3.364462, 3.675717, 0, 0.854902, 1, 1,
0.06135491, -1.174188, 2.259773, 0, 0.8509804, 1, 1,
0.06309322, 0.6973599, -0.2484566, 0, 0.8431373, 1, 1,
0.0663508, 0.6807625, 1.691799, 0, 0.8392157, 1, 1,
0.06823479, 1.019504, -0.08259981, 0, 0.8313726, 1, 1,
0.07128724, 0.1950514, -1.322304, 0, 0.827451, 1, 1,
0.07386541, 0.4750261, 0.0451958, 0, 0.8196079, 1, 1,
0.07432505, -1.020633, 3.232945, 0, 0.8156863, 1, 1,
0.07738529, -0.7999294, 1.716442, 0, 0.8078431, 1, 1,
0.07922138, 0.4211706, 2.284119, 0, 0.8039216, 1, 1,
0.0815528, 1.151525, 0.6133506, 0, 0.7960784, 1, 1,
0.08329997, -0.1576349, 3.129367, 0, 0.7882353, 1, 1,
0.08687193, -1.919644, 3.24089, 0, 0.7843137, 1, 1,
0.09052829, -0.5438522, 3.682105, 0, 0.7764706, 1, 1,
0.09337387, -1.933601, 3.265776, 0, 0.772549, 1, 1,
0.09497113, -2.40371, 4.27583, 0, 0.7647059, 1, 1,
0.09540573, 0.2340622, 0.2481904, 0, 0.7607843, 1, 1,
0.09555268, 0.05429766, -0.6151835, 0, 0.7529412, 1, 1,
0.0979647, 0.08044975, 2.7133, 0, 0.7490196, 1, 1,
0.09855914, 0.7021962, -0.5182926, 0, 0.7411765, 1, 1,
0.1013787, -0.6265618, 2.718843, 0, 0.7372549, 1, 1,
0.1021253, -1.516299, 5.949063, 0, 0.7294118, 1, 1,
0.1077169, -0.8462357, 3.795736, 0, 0.7254902, 1, 1,
0.1179838, -2.256645, 4.431238, 0, 0.7176471, 1, 1,
0.1203835, 0.7399159, 0.5114793, 0, 0.7137255, 1, 1,
0.1244876, 0.09752051, 1.122513, 0, 0.7058824, 1, 1,
0.1270108, -0.5703079, 3.355333, 0, 0.6980392, 1, 1,
0.1300371, 2.124985, -1.002075, 0, 0.6941177, 1, 1,
0.1321835, 0.5676562, -0.01079323, 0, 0.6862745, 1, 1,
0.1325818, -1.9043, 1.049235, 0, 0.682353, 1, 1,
0.1400515, -0.8651603, 3.65791, 0, 0.6745098, 1, 1,
0.1488311, 0.01002657, 2.338063, 0, 0.6705883, 1, 1,
0.1536906, -0.4692034, 3.35988, 0, 0.6627451, 1, 1,
0.154058, 0.07979272, 2.383713, 0, 0.6588235, 1, 1,
0.1590803, 0.1878776, 0.8475726, 0, 0.6509804, 1, 1,
0.1605421, -0.2308201, 2.888412, 0, 0.6470588, 1, 1,
0.1618096, 0.4211157, -0.07195226, 0, 0.6392157, 1, 1,
0.1642489, -0.2474838, 3.04385, 0, 0.6352941, 1, 1,
0.1658884, -0.3114488, 1.783692, 0, 0.627451, 1, 1,
0.1681243, -1.069922, 2.48329, 0, 0.6235294, 1, 1,
0.1681902, -0.7282923, 2.803554, 0, 0.6156863, 1, 1,
0.1683106, -0.9531196, 2.204062, 0, 0.6117647, 1, 1,
0.1684533, -0.1977458, 2.363606, 0, 0.6039216, 1, 1,
0.1704699, 0.153739, 0.6221399, 0, 0.5960785, 1, 1,
0.1729837, -0.4240581, 2.997613, 0, 0.5921569, 1, 1,
0.1768894, 1.031274, 1.429462, 0, 0.5843138, 1, 1,
0.1776694, -0.9524354, 1.602211, 0, 0.5803922, 1, 1,
0.1786405, -0.2388167, 1.192294, 0, 0.572549, 1, 1,
0.1847956, 1.048752, 0.1856865, 0, 0.5686275, 1, 1,
0.1863306, -1.257087, 3.935869, 0, 0.5607843, 1, 1,
0.186813, 0.2625853, 0.1214262, 0, 0.5568628, 1, 1,
0.1873803, 0.1647349, 0.5732533, 0, 0.5490196, 1, 1,
0.1884595, 0.4166669, 1.870332, 0, 0.5450981, 1, 1,
0.1904915, 1.524372, -0.8108178, 0, 0.5372549, 1, 1,
0.1909618, 1.509512, -0.8437305, 0, 0.5333334, 1, 1,
0.1914295, -0.8460131, 1.652006, 0, 0.5254902, 1, 1,
0.1917549, -0.8143567, 3.176389, 0, 0.5215687, 1, 1,
0.1919923, -0.3888866, 1.625361, 0, 0.5137255, 1, 1,
0.1920579, -0.7493119, 4.501473, 0, 0.509804, 1, 1,
0.1932027, 0.7117051, 1.112098, 0, 0.5019608, 1, 1,
0.1935218, -0.3143186, 1.819084, 0, 0.4941176, 1, 1,
0.195218, 0.7436217, 2.564834, 0, 0.4901961, 1, 1,
0.1955341, 0.8419789, -1.154366, 0, 0.4823529, 1, 1,
0.198431, -2.346862, 2.91274, 0, 0.4784314, 1, 1,
0.1985152, -0.4751177, 3.020703, 0, 0.4705882, 1, 1,
0.2005508, -0.6164322, 2.878188, 0, 0.4666667, 1, 1,
0.2042615, 1.511623, -0.2849197, 0, 0.4588235, 1, 1,
0.206589, 0.7757483, -0.656613, 0, 0.454902, 1, 1,
0.2098546, 0.6549306, -0.5709746, 0, 0.4470588, 1, 1,
0.2135278, -0.1541317, 1.674358, 0, 0.4431373, 1, 1,
0.2142904, -2.052067, 3.50733, 0, 0.4352941, 1, 1,
0.2151844, 0.413194, 0.7150113, 0, 0.4313726, 1, 1,
0.2260563, -1.455769, 3.320757, 0, 0.4235294, 1, 1,
0.2272511, 0.294856, 1.778417, 0, 0.4196078, 1, 1,
0.2291594, 0.3961283, -0.6837532, 0, 0.4117647, 1, 1,
0.2325113, -0.5270177, 2.390072, 0, 0.4078431, 1, 1,
0.234955, -1.684499, 3.657151, 0, 0.4, 1, 1,
0.2379677, 1.216328, 0.7394022, 0, 0.3921569, 1, 1,
0.2398181, 0.4400412, 1.077375, 0, 0.3882353, 1, 1,
0.2417934, 0.7758616, 1.352634, 0, 0.3803922, 1, 1,
0.2439861, -0.0288533, 2.592092, 0, 0.3764706, 1, 1,
0.2564721, 0.5776927, -0.6927587, 0, 0.3686275, 1, 1,
0.2564967, -1.977171, 3.26434, 0, 0.3647059, 1, 1,
0.2633562, -0.7423543, 2.103461, 0, 0.3568628, 1, 1,
0.2725435, 0.176907, 2.352855, 0, 0.3529412, 1, 1,
0.2769347, -1.283215, 6.321119, 0, 0.345098, 1, 1,
0.2801526, 2.852891, 1.563768, 0, 0.3411765, 1, 1,
0.2875151, 1.73441, -1.187557, 0, 0.3333333, 1, 1,
0.2880459, 0.501601, 0.7560694, 0, 0.3294118, 1, 1,
0.2918215, -0.6746086, 2.467813, 0, 0.3215686, 1, 1,
0.2957296, 0.0393561, 0.5220683, 0, 0.3176471, 1, 1,
0.2968826, -0.9143959, 4.346039, 0, 0.3098039, 1, 1,
0.2971325, -0.0006492813, 1.313981, 0, 0.3058824, 1, 1,
0.298128, -0.3522126, 2.186528, 0, 0.2980392, 1, 1,
0.2995526, -0.2012311, 2.456484, 0, 0.2901961, 1, 1,
0.3007264, -1.543095, 3.709265, 0, 0.2862745, 1, 1,
0.3011161, -0.9526625, 3.312306, 0, 0.2784314, 1, 1,
0.3016493, -1.856663, 3.637967, 0, 0.2745098, 1, 1,
0.3053643, 1.2198, -0.2661287, 0, 0.2666667, 1, 1,
0.3071182, 1.222182, 0.8439383, 0, 0.2627451, 1, 1,
0.310339, -0.8422027, 3.264436, 0, 0.254902, 1, 1,
0.3116664, -0.09885108, 1.07849, 0, 0.2509804, 1, 1,
0.3133475, -0.2762501, 2.844232, 0, 0.2431373, 1, 1,
0.3150641, -0.4344359, 2.502956, 0, 0.2392157, 1, 1,
0.3176135, 1.159505, 0.4774052, 0, 0.2313726, 1, 1,
0.3230484, 0.5073362, -0.06903885, 0, 0.227451, 1, 1,
0.3298629, 1.382333, -0.9441775, 0, 0.2196078, 1, 1,
0.3298734, 1.276981, 1.058193, 0, 0.2156863, 1, 1,
0.3312134, -0.3741048, 1.584901, 0, 0.2078431, 1, 1,
0.3340518, -0.2844734, 2.605207, 0, 0.2039216, 1, 1,
0.3341934, 0.2121738, 1.897711, 0, 0.1960784, 1, 1,
0.3365702, 0.6832038, 0.2632365, 0, 0.1882353, 1, 1,
0.3440778, 0.6856899, 0.50912, 0, 0.1843137, 1, 1,
0.3490219, 0.7153127, 2.840145, 0, 0.1764706, 1, 1,
0.3506128, 0.3865828, 0.5178826, 0, 0.172549, 1, 1,
0.3509667, 1.112477, -0.06092636, 0, 0.1647059, 1, 1,
0.3531116, -0.2936445, 0.826443, 0, 0.1607843, 1, 1,
0.3569649, 0.4617358, 0.9044691, 0, 0.1529412, 1, 1,
0.3578888, 0.1918102, 3.659108, 0, 0.1490196, 1, 1,
0.3599531, -0.00795802, 2.303354, 0, 0.1411765, 1, 1,
0.3608347, 1.040739, -0.5073892, 0, 0.1372549, 1, 1,
0.3654121, 0.8576909, 1.13903, 0, 0.1294118, 1, 1,
0.3663895, -0.5234903, -0.1779529, 0, 0.1254902, 1, 1,
0.3679517, -1.375802, 3.305194, 0, 0.1176471, 1, 1,
0.3730756, -3.334433, 1.905737, 0, 0.1137255, 1, 1,
0.3868362, -1.025935, 2.335903, 0, 0.1058824, 1, 1,
0.391657, -1.67151, 3.728775, 0, 0.09803922, 1, 1,
0.3954604, 1.469086, 0.7066687, 0, 0.09411765, 1, 1,
0.4001483, 1.09619, -0.165995, 0, 0.08627451, 1, 1,
0.4005197, -0.40131, 3.254797, 0, 0.08235294, 1, 1,
0.4006788, -0.7623785, 1.753796, 0, 0.07450981, 1, 1,
0.4013549, 0.2831326, 1.021026, 0, 0.07058824, 1, 1,
0.4022968, 0.7927645, 0.9761589, 0, 0.0627451, 1, 1,
0.4097361, 0.6631342, 0.990938, 0, 0.05882353, 1, 1,
0.4104972, -0.6438218, 2.221553, 0, 0.05098039, 1, 1,
0.4113275, -1.410282, 2.018422, 0, 0.04705882, 1, 1,
0.411374, 1.452078, -0.3961186, 0, 0.03921569, 1, 1,
0.4116641, 0.1182651, 1.445389, 0, 0.03529412, 1, 1,
0.4144603, 0.5979633, -0.9342306, 0, 0.02745098, 1, 1,
0.4157501, 1.107274, -0.8439651, 0, 0.02352941, 1, 1,
0.4168566, 2.204283, 0.9118938, 0, 0.01568628, 1, 1,
0.4174908, -0.05309655, 2.602273, 0, 0.01176471, 1, 1,
0.4218932, -0.3959028, 0.8224495, 0, 0.003921569, 1, 1,
0.4285499, 0.02087655, 1.289065, 0.003921569, 0, 1, 1,
0.4289705, -1.574363, 3.230363, 0.007843138, 0, 1, 1,
0.4300598, 0.2109131, 2.048569, 0.01568628, 0, 1, 1,
0.435177, -0.04532582, 2.121891, 0.01960784, 0, 1, 1,
0.4357138, -1.083249, 1.68664, 0.02745098, 0, 1, 1,
0.4422015, -1.196282, 3.378407, 0.03137255, 0, 1, 1,
0.4444608, -0.5786014, 1.721561, 0.03921569, 0, 1, 1,
0.4478283, -0.4571755, 1.881438, 0.04313726, 0, 1, 1,
0.4490645, 0.7019383, 2.537193, 0.05098039, 0, 1, 1,
0.4587333, 0.2930612, 1.588954, 0.05490196, 0, 1, 1,
0.4619615, 1.301023, 1.856625, 0.0627451, 0, 1, 1,
0.4673859, -0.2046539, 3.303379, 0.06666667, 0, 1, 1,
0.4707621, -0.4660918, 1.832475, 0.07450981, 0, 1, 1,
0.4720111, -1.375227, 1.666312, 0.07843138, 0, 1, 1,
0.4754966, 0.09507779, 1.39086, 0.08627451, 0, 1, 1,
0.4813127, 1.141011, -0.734549, 0.09019608, 0, 1, 1,
0.4816592, 1.420679, 0.6300879, 0.09803922, 0, 1, 1,
0.4858425, 1.097958, 0.4879942, 0.1058824, 0, 1, 1,
0.4860013, 1.893068, 1.437466, 0.1098039, 0, 1, 1,
0.4886255, -0.8054397, 2.728856, 0.1176471, 0, 1, 1,
0.4887217, -0.08520205, 1.343165, 0.1215686, 0, 1, 1,
0.4905013, 0.2728146, 0.6866241, 0.1294118, 0, 1, 1,
0.4906975, 0.4057614, 1.222047, 0.1333333, 0, 1, 1,
0.4949418, -0.9892466, 2.572735, 0.1411765, 0, 1, 1,
0.4950785, 0.469642, 2.027907, 0.145098, 0, 1, 1,
0.495726, 1.266552, -1.811099, 0.1529412, 0, 1, 1,
0.4978758, -0.4433887, 2.00441, 0.1568628, 0, 1, 1,
0.4981893, -0.5486087, 1.854147, 0.1647059, 0, 1, 1,
0.4982174, -0.3619585, 1.743218, 0.1686275, 0, 1, 1,
0.4992254, -0.8594483, 2.591193, 0.1764706, 0, 1, 1,
0.5003127, -0.2705288, 3.768083, 0.1803922, 0, 1, 1,
0.501712, -0.8869275, 3.034976, 0.1882353, 0, 1, 1,
0.5053046, -0.3114006, 2.645576, 0.1921569, 0, 1, 1,
0.5162429, 0.2827632, 2.225446, 0.2, 0, 1, 1,
0.5195749, 2.204025, 0.03499019, 0.2078431, 0, 1, 1,
0.524059, -0.644879, 0.9611533, 0.2117647, 0, 1, 1,
0.5254534, -1.506942, 3.017599, 0.2196078, 0, 1, 1,
0.5301017, -1.316766, 2.370208, 0.2235294, 0, 1, 1,
0.5310196, -1.061094, 2.257098, 0.2313726, 0, 1, 1,
0.5390927, -0.3672028, 2.64976, 0.2352941, 0, 1, 1,
0.5414779, -0.5909172, 2.240134, 0.2431373, 0, 1, 1,
0.5433726, 0.8241608, 1.816301, 0.2470588, 0, 1, 1,
0.5450245, 0.5942143, 1.531239, 0.254902, 0, 1, 1,
0.5453641, 0.2330683, 0.344581, 0.2588235, 0, 1, 1,
0.5514286, 0.1400298, 1.512617, 0.2666667, 0, 1, 1,
0.5538174, -0.5258282, 2.211194, 0.2705882, 0, 1, 1,
0.5581858, -0.2976202, 1.412079, 0.2784314, 0, 1, 1,
0.558651, -3.672477, 3.324219, 0.282353, 0, 1, 1,
0.561116, -0.3285942, 2.258544, 0.2901961, 0, 1, 1,
0.572699, 0.1336688, 2.826782, 0.2941177, 0, 1, 1,
0.5750113, -0.3858591, 2.555608, 0.3019608, 0, 1, 1,
0.5763181, -0.03047806, 1.741948, 0.3098039, 0, 1, 1,
0.5797883, -0.1600299, 2.635767, 0.3137255, 0, 1, 1,
0.5843404, -1.206966, 3.787104, 0.3215686, 0, 1, 1,
0.5858781, 0.01346217, 2.247415, 0.3254902, 0, 1, 1,
0.5872404, 0.8738009, 0.6829359, 0.3333333, 0, 1, 1,
0.5887452, 0.204729, 1.322642, 0.3372549, 0, 1, 1,
0.5893976, -1.030465, 3.364258, 0.345098, 0, 1, 1,
0.5899145, 0.8803295, 0.7420208, 0.3490196, 0, 1, 1,
0.593524, -1.319317, 4.46897, 0.3568628, 0, 1, 1,
0.5936945, 0.5477569, 1.493012, 0.3607843, 0, 1, 1,
0.5998726, -0.8058318, 3.755884, 0.3686275, 0, 1, 1,
0.6022018, 0.4583953, 2.073609, 0.372549, 0, 1, 1,
0.6028612, -0.3158327, -0.4845215, 0.3803922, 0, 1, 1,
0.6031182, 0.2926541, 0.8374014, 0.3843137, 0, 1, 1,
0.6031681, 0.3346286, 3.014007, 0.3921569, 0, 1, 1,
0.6058528, 0.3261359, 1.28314, 0.3960784, 0, 1, 1,
0.6063759, 1.550598, 0.4409283, 0.4039216, 0, 1, 1,
0.6125954, -1.006329, 2.576946, 0.4117647, 0, 1, 1,
0.6161548, -0.660645, 1.768236, 0.4156863, 0, 1, 1,
0.6176113, 0.3919827, 1.34463, 0.4235294, 0, 1, 1,
0.6180497, 0.3070805, 0.93317, 0.427451, 0, 1, 1,
0.6220756, -1.025665, 2.049787, 0.4352941, 0, 1, 1,
0.6237832, 0.9159748, 0.6243678, 0.4392157, 0, 1, 1,
0.6296582, -1.342705, 3.704766, 0.4470588, 0, 1, 1,
0.6307098, -0.0004097525, 0.8212326, 0.4509804, 0, 1, 1,
0.6313189, 0.7974634, 0.4722307, 0.4588235, 0, 1, 1,
0.6321504, 0.3937946, 0.4844091, 0.4627451, 0, 1, 1,
0.6334512, 0.3268734, -0.5212358, 0.4705882, 0, 1, 1,
0.6341219, 0.480081, -1.225726, 0.4745098, 0, 1, 1,
0.6395193, -0.551719, 1.616262, 0.4823529, 0, 1, 1,
0.6434293, 0.2350557, 1.204433, 0.4862745, 0, 1, 1,
0.6452793, -0.5856469, 1.785282, 0.4941176, 0, 1, 1,
0.6511129, -0.1207856, 1.050879, 0.5019608, 0, 1, 1,
0.6521494, -0.05589224, 0.3462435, 0.5058824, 0, 1, 1,
0.6591496, 2.029067, 0.8183982, 0.5137255, 0, 1, 1,
0.6636612, -0.4984424, 2.404545, 0.5176471, 0, 1, 1,
0.6650028, 0.1885291, 2.27227, 0.5254902, 0, 1, 1,
0.6666317, -0.5827137, 4.505312, 0.5294118, 0, 1, 1,
0.6676192, -1.323635, 2.176163, 0.5372549, 0, 1, 1,
0.6766148, -0.5011325, 2.30861, 0.5411765, 0, 1, 1,
0.6792293, -0.006389888, 2.629141, 0.5490196, 0, 1, 1,
0.6909428, 1.342759, 1.614233, 0.5529412, 0, 1, 1,
0.6966687, 1.263391, 1.163939, 0.5607843, 0, 1, 1,
0.6971489, -0.4129587, 3.56313, 0.5647059, 0, 1, 1,
0.7037154, -1.266445, 2.334316, 0.572549, 0, 1, 1,
0.7039185, 0.2640592, 0.8481467, 0.5764706, 0, 1, 1,
0.704929, 1.271101, 1.938884, 0.5843138, 0, 1, 1,
0.7149547, -1.39179, 4.671769, 0.5882353, 0, 1, 1,
0.7153025, -0.4358088, 1.221939, 0.5960785, 0, 1, 1,
0.7153343, -0.9595014, 3.128113, 0.6039216, 0, 1, 1,
0.7206112, -1.304147, 3.203002, 0.6078432, 0, 1, 1,
0.723724, -1.071705, 4.620232, 0.6156863, 0, 1, 1,
0.7257189, -0.09393078, 0.6347706, 0.6196079, 0, 1, 1,
0.7264329, 2.806597, -0.4441154, 0.627451, 0, 1, 1,
0.7264405, -1.133226, 2.37109, 0.6313726, 0, 1, 1,
0.7315388, 0.7201099, -1.339639, 0.6392157, 0, 1, 1,
0.7337476, -0.2850114, 2.445127, 0.6431373, 0, 1, 1,
0.7417766, -1.14643, 3.302458, 0.6509804, 0, 1, 1,
0.7472978, -0.884629, 2.963841, 0.654902, 0, 1, 1,
0.7605039, 2.187845, 0.05701866, 0.6627451, 0, 1, 1,
0.7607953, -0.4517528, 1.918641, 0.6666667, 0, 1, 1,
0.7641131, 1.400633, 2.172976, 0.6745098, 0, 1, 1,
0.7674795, 1.434879, 0.7263625, 0.6784314, 0, 1, 1,
0.7686194, 0.924027, 1.411393, 0.6862745, 0, 1, 1,
0.770477, -0.345858, 0.8438424, 0.6901961, 0, 1, 1,
0.771354, -1.880969, 3.945824, 0.6980392, 0, 1, 1,
0.7758427, -1.116225, 2.610635, 0.7058824, 0, 1, 1,
0.7774267, -0.6847529, 1.776651, 0.7098039, 0, 1, 1,
0.7804629, -0.340116, 0.7013178, 0.7176471, 0, 1, 1,
0.7846, 0.1289945, 2.400094, 0.7215686, 0, 1, 1,
0.7847193, -0.1449337, 2.917588, 0.7294118, 0, 1, 1,
0.7925261, -2.321894, 2.649575, 0.7333333, 0, 1, 1,
0.7930491, -0.2754492, 1.794388, 0.7411765, 0, 1, 1,
0.8004299, 1.412288, 0.02188035, 0.7450981, 0, 1, 1,
0.8013639, 0.1910995, 0.05367268, 0.7529412, 0, 1, 1,
0.8028601, 0.4997148, 0.5981121, 0.7568628, 0, 1, 1,
0.8096668, 1.139625, 1.457455, 0.7647059, 0, 1, 1,
0.8159618, 1.113313, 0.8103373, 0.7686275, 0, 1, 1,
0.816934, 0.7312356, 3.014634, 0.7764706, 0, 1, 1,
0.8172258, 0.6681744, 0.8829163, 0.7803922, 0, 1, 1,
0.8202499, 0.2045124, 0.675127, 0.7882353, 0, 1, 1,
0.8274744, 0.3914597, 0.2187486, 0.7921569, 0, 1, 1,
0.8298885, 0.6022598, -0.4825405, 0.8, 0, 1, 1,
0.8314649, 1.334921, 0.8379831, 0.8078431, 0, 1, 1,
0.8353313, -0.5617027, 1.442862, 0.8117647, 0, 1, 1,
0.8365434, -0.896412, 2.762434, 0.8196079, 0, 1, 1,
0.8369047, 1.251763, 0.4172209, 0.8235294, 0, 1, 1,
0.8401706, 0.6429475, 1.553684, 0.8313726, 0, 1, 1,
0.8562519, 0.7703398, 3.307627, 0.8352941, 0, 1, 1,
0.8581522, -1.305621, 1.939447, 0.8431373, 0, 1, 1,
0.8621714, 0.01206578, 1.760409, 0.8470588, 0, 1, 1,
0.8684633, 1.057816, 0.4309034, 0.854902, 0, 1, 1,
0.8699584, 0.4968244, 3.650701, 0.8588235, 0, 1, 1,
0.8699609, 0.4706428, 1.737736, 0.8666667, 0, 1, 1,
0.8713717, 0.2991906, 3.356237, 0.8705882, 0, 1, 1,
0.8801458, -0.1169335, 0.4089855, 0.8784314, 0, 1, 1,
0.8839034, 0.6325134, 0.5665337, 0.8823529, 0, 1, 1,
0.8839346, -1.080584, 2.193474, 0.8901961, 0, 1, 1,
0.8860517, -1.003744, 0.9968854, 0.8941177, 0, 1, 1,
0.8913167, -0.2238964, 1.849168, 0.9019608, 0, 1, 1,
0.9018755, 0.8153988, 0.6300136, 0.9098039, 0, 1, 1,
0.9021695, 0.08605962, 2.008934, 0.9137255, 0, 1, 1,
0.9054887, 1.89018, 1.669177, 0.9215686, 0, 1, 1,
0.907154, 1.136409, -0.1692813, 0.9254902, 0, 1, 1,
0.9085518, 1.6755, 0.1749478, 0.9333333, 0, 1, 1,
0.9145396, -1.181815, 3.286268, 0.9372549, 0, 1, 1,
0.9186146, 0.5573452, 3.004988, 0.945098, 0, 1, 1,
0.9221384, 0.7072069, 1.805442, 0.9490196, 0, 1, 1,
0.9226091, -1.745843, 2.168819, 0.9568627, 0, 1, 1,
0.92547, -0.05709791, 1.56486, 0.9607843, 0, 1, 1,
0.9267882, 0.5576965, 0.5173129, 0.9686275, 0, 1, 1,
0.9365737, 1.284467, 0.4250676, 0.972549, 0, 1, 1,
0.9377204, -2.037184, 2.643767, 0.9803922, 0, 1, 1,
0.9423919, -1.735348, 2.186116, 0.9843137, 0, 1, 1,
0.9460166, 1.439517, 0.2450867, 0.9921569, 0, 1, 1,
0.9569589, -1.86471, 4.936081, 0.9960784, 0, 1, 1,
0.9618068, -1.170444, 1.632825, 1, 0, 0.9960784, 1,
0.9623005, 0.5678484, 1.921489, 1, 0, 0.9882353, 1,
0.9655156, -0.7051538, 2.497448, 1, 0, 0.9843137, 1,
0.9706996, 0.9756026, -1.635676, 1, 0, 0.9764706, 1,
0.9779929, 0.3448725, 0.291059, 1, 0, 0.972549, 1,
0.9872304, 1.110934, 0.4960628, 1, 0, 0.9647059, 1,
0.9875026, -1.002195, 2.508979, 1, 0, 0.9607843, 1,
0.9933427, 0.8803818, 0.523913, 1, 0, 0.9529412, 1,
0.9974948, 2.038812, -0.1589132, 1, 0, 0.9490196, 1,
0.9989848, -2.335292, 3.963567, 1, 0, 0.9411765, 1,
1.012171, -0.1814529, 1.860916, 1, 0, 0.9372549, 1,
1.016587, 0.660088, 0.3575157, 1, 0, 0.9294118, 1,
1.021978, 1.189585, 1.924742, 1, 0, 0.9254902, 1,
1.024897, 1.194399, 1.588427, 1, 0, 0.9176471, 1,
1.025463, -0.1003145, 1.52429, 1, 0, 0.9137255, 1,
1.027392, -1.404111, 2.094827, 1, 0, 0.9058824, 1,
1.030945, 0.03932848, 1.590378, 1, 0, 0.9019608, 1,
1.031983, 0.2979275, 0.9618686, 1, 0, 0.8941177, 1,
1.03684, -2.273454, 4.473236, 1, 0, 0.8862745, 1,
1.040729, 0.6454625, 2.847028, 1, 0, 0.8823529, 1,
1.043424, 0.4528182, 1.673892, 1, 0, 0.8745098, 1,
1.044265, 2.097225, 0.5609121, 1, 0, 0.8705882, 1,
1.049085, -1.054593, 2.616168, 1, 0, 0.8627451, 1,
1.049584, -1.284986, 2.138144, 1, 0, 0.8588235, 1,
1.051379, -0.5851567, 3.200438, 1, 0, 0.8509804, 1,
1.05189, 1.583355, 1.254453, 1, 0, 0.8470588, 1,
1.051904, 1.426694, 0.798757, 1, 0, 0.8392157, 1,
1.05543, 0.3649913, 2.227772, 1, 0, 0.8352941, 1,
1.057078, -0.4787597, 2.812368, 1, 0, 0.827451, 1,
1.058666, 0.9449538, 0.7774748, 1, 0, 0.8235294, 1,
1.060414, -0.2717129, 2.622641, 1, 0, 0.8156863, 1,
1.065015, -1.79632, 2.31926, 1, 0, 0.8117647, 1,
1.078639, -1.158383, 1.160578, 1, 0, 0.8039216, 1,
1.079957, 2.500157, 0.1180582, 1, 0, 0.7960784, 1,
1.086136, 2.602304, 1.251425, 1, 0, 0.7921569, 1,
1.087173, 0.5634366, 1.609264, 1, 0, 0.7843137, 1,
1.090613, -1.04434, 0.471657, 1, 0, 0.7803922, 1,
1.099707, -0.4041167, 2.473897, 1, 0, 0.772549, 1,
1.119505, -0.04050362, 1.419479, 1, 0, 0.7686275, 1,
1.121846, -0.3590182, 1.245017, 1, 0, 0.7607843, 1,
1.124256, 0.8886179, 0.124323, 1, 0, 0.7568628, 1,
1.124711, -0.08895802, 1.898396, 1, 0, 0.7490196, 1,
1.12572, -0.6287709, 2.394869, 1, 0, 0.7450981, 1,
1.133372, -0.3608575, 0.8507202, 1, 0, 0.7372549, 1,
1.139055, -0.4066572, 2.473033, 1, 0, 0.7333333, 1,
1.141134, -0.8504826, 3.007682, 1, 0, 0.7254902, 1,
1.148853, 0.8586271, 0.8219568, 1, 0, 0.7215686, 1,
1.149271, -0.1971469, 0.1777015, 1, 0, 0.7137255, 1,
1.160164, 0.4194345, 2.687398, 1, 0, 0.7098039, 1,
1.162528, -0.3116023, 3.55654, 1, 0, 0.7019608, 1,
1.164358, 0.2006685, 3.581726, 1, 0, 0.6941177, 1,
1.165711, -0.8281981, 2.565959, 1, 0, 0.6901961, 1,
1.176521, -0.5916584, 2.770093, 1, 0, 0.682353, 1,
1.186565, -0.04798704, 3.309288, 1, 0, 0.6784314, 1,
1.195986, -1.597079, 1.845531, 1, 0, 0.6705883, 1,
1.198645, 0.07163269, 1.7551, 1, 0, 0.6666667, 1,
1.207712, -0.09003246, 1.209113, 1, 0, 0.6588235, 1,
1.211237, -2.22636, 2.232788, 1, 0, 0.654902, 1,
1.21254, -0.02665882, 2.869679, 1, 0, 0.6470588, 1,
1.22385, -0.02464001, -0.1825319, 1, 0, 0.6431373, 1,
1.224101, 1.22924, -0.2601829, 1, 0, 0.6352941, 1,
1.228437, -1.338363, 1.918273, 1, 0, 0.6313726, 1,
1.232807, 1.262125, 0.6417955, 1, 0, 0.6235294, 1,
1.249733, 0.7760973, 0.8200996, 1, 0, 0.6196079, 1,
1.25283, 0.02260051, 0.2040441, 1, 0, 0.6117647, 1,
1.267683, -0.7628165, 1.082664, 1, 0, 0.6078432, 1,
1.268608, 0.7185208, 2.207552, 1, 0, 0.6, 1,
1.269653, -0.7806896, 2.006863, 1, 0, 0.5921569, 1,
1.283795, -0.7774788, 1.472908, 1, 0, 0.5882353, 1,
1.284873, 0.4544427, 1.118872, 1, 0, 0.5803922, 1,
1.290486, -1.008828, 2.997644, 1, 0, 0.5764706, 1,
1.304935, -0.2302371, 2.059386, 1, 0, 0.5686275, 1,
1.315799, -1.535015, 2.934911, 1, 0, 0.5647059, 1,
1.321219, -0.5683955, 1.428519, 1, 0, 0.5568628, 1,
1.321565, -1.051694, 3.077088, 1, 0, 0.5529412, 1,
1.330956, -0.01485464, 1.118986, 1, 0, 0.5450981, 1,
1.355332, 1.273314, 0.7659525, 1, 0, 0.5411765, 1,
1.369574, 0.9409069, 3.474094, 1, 0, 0.5333334, 1,
1.384264, -1.086772, 3.607261, 1, 0, 0.5294118, 1,
1.391202, -0.5888033, 3.353946, 1, 0, 0.5215687, 1,
1.392336, 1.908726, 1.256732, 1, 0, 0.5176471, 1,
1.395548, 1.736191, 1.127059, 1, 0, 0.509804, 1,
1.399937, -0.6422067, -0.5568755, 1, 0, 0.5058824, 1,
1.402572, 1.441338, 3.219366, 1, 0, 0.4980392, 1,
1.403986, 0.2303216, -0.1665868, 1, 0, 0.4901961, 1,
1.404124, -0.4848114, 2.284616, 1, 0, 0.4862745, 1,
1.406751, -0.9728277, 4.257022, 1, 0, 0.4784314, 1,
1.407543, 0.3895838, 1.162763, 1, 0, 0.4745098, 1,
1.419801, 0.9037008, 1.267535, 1, 0, 0.4666667, 1,
1.427526, -2.462274, 0.7497899, 1, 0, 0.4627451, 1,
1.437031, 0.5030925, 0.8656893, 1, 0, 0.454902, 1,
1.437116, -0.4622591, -0.6152925, 1, 0, 0.4509804, 1,
1.441977, 0.7012618, 0.7958816, 1, 0, 0.4431373, 1,
1.445924, 0.8464916, 0.2106519, 1, 0, 0.4392157, 1,
1.45429, -0.611211, 1.412371, 1, 0, 0.4313726, 1,
1.455486, 1.562359, 0.2289632, 1, 0, 0.427451, 1,
1.460433, -0.886054, 3.262057, 1, 0, 0.4196078, 1,
1.462495, 1.01447, -0.9273388, 1, 0, 0.4156863, 1,
1.464563, 0.3551308, 3.948547, 1, 0, 0.4078431, 1,
1.465448, -0.3313923, 1.197374, 1, 0, 0.4039216, 1,
1.468575, 0.4511825, 2.529486, 1, 0, 0.3960784, 1,
1.476343, 0.1245774, 0.6373124, 1, 0, 0.3882353, 1,
1.479282, 1.195134, 1.81687, 1, 0, 0.3843137, 1,
1.480963, -0.3468753, 2.119402, 1, 0, 0.3764706, 1,
1.485991, -0.6469371, 1.823782, 1, 0, 0.372549, 1,
1.489685, 1.86042, 2.198914, 1, 0, 0.3647059, 1,
1.510514, -0.1988466, -0.2561344, 1, 0, 0.3607843, 1,
1.511664, 0.4323467, 1.800228, 1, 0, 0.3529412, 1,
1.521202, 0.4376844, 3.70357, 1, 0, 0.3490196, 1,
1.523512, 0.9681705, -0.1858147, 1, 0, 0.3411765, 1,
1.527887, 1.047707, 1.430821, 1, 0, 0.3372549, 1,
1.541107, -0.7710729, 3.782394, 1, 0, 0.3294118, 1,
1.553244, -2.447955, 2.195666, 1, 0, 0.3254902, 1,
1.566181, -0.1195444, 1.825808, 1, 0, 0.3176471, 1,
1.571736, 1.044176, 1.532556, 1, 0, 0.3137255, 1,
1.58922, -0.1443046, -0.6059732, 1, 0, 0.3058824, 1,
1.59446, -0.5064413, 0.2225512, 1, 0, 0.2980392, 1,
1.636136, 0.1663914, -0.01731894, 1, 0, 0.2941177, 1,
1.64709, -1.722652, 2.981157, 1, 0, 0.2862745, 1,
1.648253, -1.263832, 1.007465, 1, 0, 0.282353, 1,
1.679217, 0.7453737, 0.8006376, 1, 0, 0.2745098, 1,
1.679557, 1.377145, 0.3412217, 1, 0, 0.2705882, 1,
1.681018, -1.441009, 0.8843377, 1, 0, 0.2627451, 1,
1.704017, -0.3909061, 2.28021, 1, 0, 0.2588235, 1,
1.713206, 1.382194, 2.211191, 1, 0, 0.2509804, 1,
1.72601, 0.9694533, 1.791145, 1, 0, 0.2470588, 1,
1.735204, 0.9288244, 0.4242026, 1, 0, 0.2392157, 1,
1.737343, 1.425631, 1.731645, 1, 0, 0.2352941, 1,
1.740348, 1.276303, 1.274143, 1, 0, 0.227451, 1,
1.77906, -0.2656103, 4.163315, 1, 0, 0.2235294, 1,
1.782468, 2.103324, -1.259755, 1, 0, 0.2156863, 1,
1.798008, 1.151924, 0.1998971, 1, 0, 0.2117647, 1,
1.802979, 0.5120306, 1.610215, 1, 0, 0.2039216, 1,
1.823562, 1.052183, 0.06238876, 1, 0, 0.1960784, 1,
1.841609, 0.4434698, 2.088313, 1, 0, 0.1921569, 1,
1.851561, -1.566859, 1.853355, 1, 0, 0.1843137, 1,
1.853187, -0.2979819, 1.149316, 1, 0, 0.1803922, 1,
1.867559, 1.45175, 3.170357, 1, 0, 0.172549, 1,
1.892308, -1.324847, 1.783187, 1, 0, 0.1686275, 1,
1.897273, 0.06585439, 3.215562, 1, 0, 0.1607843, 1,
1.909789, 1.107335, 0.8945507, 1, 0, 0.1568628, 1,
1.911989, 0.7315009, 1.621731, 1, 0, 0.1490196, 1,
1.936164, -0.1757105, 2.098359, 1, 0, 0.145098, 1,
1.966762, 1.657047, -1.275123, 1, 0, 0.1372549, 1,
1.975132, -0.1218074, 1.424626, 1, 0, 0.1333333, 1,
1.984088, 1.432526, 0.2821812, 1, 0, 0.1254902, 1,
2.019848, -1.015665, 1.165219, 1, 0, 0.1215686, 1,
2.046965, 1.613993, -1.292145, 1, 0, 0.1137255, 1,
2.050827, 0.1753224, 0.3334624, 1, 0, 0.1098039, 1,
2.053428, -1.501718, 2.000583, 1, 0, 0.1019608, 1,
2.061852, 0.1960993, 1.562674, 1, 0, 0.09411765, 1,
2.068036, -1.845043, 2.111347, 1, 0, 0.09019608, 1,
2.088096, 0.559359, 1.12825, 1, 0, 0.08235294, 1,
2.094815, 1.156919, 2.200634, 1, 0, 0.07843138, 1,
2.101068, -0.2576556, 1.930752, 1, 0, 0.07058824, 1,
2.263519, 0.2801626, 2.012266, 1, 0, 0.06666667, 1,
2.285983, -0.8563856, 2.359788, 1, 0, 0.05882353, 1,
2.289554, -0.06865567, 1.661496, 1, 0, 0.05490196, 1,
2.2986, -0.1167992, 0.7578952, 1, 0, 0.04705882, 1,
2.365407, 1.226978, -0.09828984, 1, 0, 0.04313726, 1,
2.476121, 0.1914445, 2.741023, 1, 0, 0.03529412, 1,
2.55889, -0.8000471, 1.926208, 1, 0, 0.03137255, 1,
2.570518, -0.260899, 1.526804, 1, 0, 0.02352941, 1,
2.586255, -0.1032044, 1.268481, 1, 0, 0.01960784, 1,
2.612713, 0.4379094, 2.181228, 1, 0, 0.01176471, 1,
2.665058, -1.077489, 0.4508036, 1, 0, 0.007843138, 1
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
-0.4943627, -4.778527, -8.219579, 0, -0.5, 0.5, 0.5,
-0.4943627, -4.778527, -8.219579, 1, -0.5, 0.5, 0.5,
-0.4943627, -4.778527, -8.219579, 1, 1.5, 0.5, 0.5,
-0.4943627, -4.778527, -8.219579, 0, 1.5, 0.5, 0.5
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
-4.724827, -0.4097933, -8.219579, 0, -0.5, 0.5, 0.5,
-4.724827, -0.4097933, -8.219579, 1, -0.5, 0.5, 0.5,
-4.724827, -0.4097933, -8.219579, 1, 1.5, 0.5, 0.5,
-4.724827, -0.4097933, -8.219579, 0, 1.5, 0.5, 0.5
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
-4.724827, -4.778527, 0.1044891, 0, -0.5, 0.5, 0.5,
-4.724827, -4.778527, 0.1044891, 1, -0.5, 0.5, 0.5,
-4.724827, -4.778527, 0.1044891, 1, 1.5, 0.5, 0.5,
-4.724827, -4.778527, 0.1044891, 0, 1.5, 0.5, 0.5
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
-3, -3.770358, -6.29864,
2, -3.770358, -6.29864,
-3, -3.770358, -6.29864,
-3, -3.938386, -6.618796,
-2, -3.770358, -6.29864,
-2, -3.938386, -6.618796,
-1, -3.770358, -6.29864,
-1, -3.938386, -6.618796,
0, -3.770358, -6.29864,
0, -3.938386, -6.618796,
1, -3.770358, -6.29864,
1, -3.938386, -6.618796,
2, -3.770358, -6.29864,
2, -3.938386, -6.618796
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
-3, -4.274443, -7.259109, 0, -0.5, 0.5, 0.5,
-3, -4.274443, -7.259109, 1, -0.5, 0.5, 0.5,
-3, -4.274443, -7.259109, 1, 1.5, 0.5, 0.5,
-3, -4.274443, -7.259109, 0, 1.5, 0.5, 0.5,
-2, -4.274443, -7.259109, 0, -0.5, 0.5, 0.5,
-2, -4.274443, -7.259109, 1, -0.5, 0.5, 0.5,
-2, -4.274443, -7.259109, 1, 1.5, 0.5, 0.5,
-2, -4.274443, -7.259109, 0, 1.5, 0.5, 0.5,
-1, -4.274443, -7.259109, 0, -0.5, 0.5, 0.5,
-1, -4.274443, -7.259109, 1, -0.5, 0.5, 0.5,
-1, -4.274443, -7.259109, 1, 1.5, 0.5, 0.5,
-1, -4.274443, -7.259109, 0, 1.5, 0.5, 0.5,
0, -4.274443, -7.259109, 0, -0.5, 0.5, 0.5,
0, -4.274443, -7.259109, 1, -0.5, 0.5, 0.5,
0, -4.274443, -7.259109, 1, 1.5, 0.5, 0.5,
0, -4.274443, -7.259109, 0, 1.5, 0.5, 0.5,
1, -4.274443, -7.259109, 0, -0.5, 0.5, 0.5,
1, -4.274443, -7.259109, 1, -0.5, 0.5, 0.5,
1, -4.274443, -7.259109, 1, 1.5, 0.5, 0.5,
1, -4.274443, -7.259109, 0, 1.5, 0.5, 0.5,
2, -4.274443, -7.259109, 0, -0.5, 0.5, 0.5,
2, -4.274443, -7.259109, 1, -0.5, 0.5, 0.5,
2, -4.274443, -7.259109, 1, 1.5, 0.5, 0.5,
2, -4.274443, -7.259109, 0, 1.5, 0.5, 0.5
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
-3.748566, -3, -6.29864,
-3.748566, 2, -6.29864,
-3.748566, -3, -6.29864,
-3.911276, -3, -6.618796,
-3.748566, -2, -6.29864,
-3.911276, -2, -6.618796,
-3.748566, -1, -6.29864,
-3.911276, -1, -6.618796,
-3.748566, 0, -6.29864,
-3.911276, 0, -6.618796,
-3.748566, 1, -6.29864,
-3.911276, 1, -6.618796,
-3.748566, 2, -6.29864,
-3.911276, 2, -6.618796
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
-4.236696, -3, -7.259109, 0, -0.5, 0.5, 0.5,
-4.236696, -3, -7.259109, 1, -0.5, 0.5, 0.5,
-4.236696, -3, -7.259109, 1, 1.5, 0.5, 0.5,
-4.236696, -3, -7.259109, 0, 1.5, 0.5, 0.5,
-4.236696, -2, -7.259109, 0, -0.5, 0.5, 0.5,
-4.236696, -2, -7.259109, 1, -0.5, 0.5, 0.5,
-4.236696, -2, -7.259109, 1, 1.5, 0.5, 0.5,
-4.236696, -2, -7.259109, 0, 1.5, 0.5, 0.5,
-4.236696, -1, -7.259109, 0, -0.5, 0.5, 0.5,
-4.236696, -1, -7.259109, 1, -0.5, 0.5, 0.5,
-4.236696, -1, -7.259109, 1, 1.5, 0.5, 0.5,
-4.236696, -1, -7.259109, 0, 1.5, 0.5, 0.5,
-4.236696, 0, -7.259109, 0, -0.5, 0.5, 0.5,
-4.236696, 0, -7.259109, 1, -0.5, 0.5, 0.5,
-4.236696, 0, -7.259109, 1, 1.5, 0.5, 0.5,
-4.236696, 0, -7.259109, 0, 1.5, 0.5, 0.5,
-4.236696, 1, -7.259109, 0, -0.5, 0.5, 0.5,
-4.236696, 1, -7.259109, 1, -0.5, 0.5, 0.5,
-4.236696, 1, -7.259109, 1, 1.5, 0.5, 0.5,
-4.236696, 1, -7.259109, 0, 1.5, 0.5, 0.5,
-4.236696, 2, -7.259109, 0, -0.5, 0.5, 0.5,
-4.236696, 2, -7.259109, 1, -0.5, 0.5, 0.5,
-4.236696, 2, -7.259109, 1, 1.5, 0.5, 0.5,
-4.236696, 2, -7.259109, 0, 1.5, 0.5, 0.5
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
-3.748566, -3.770358, -6,
-3.748566, -3.770358, 6,
-3.748566, -3.770358, -6,
-3.911276, -3.938386, -6,
-3.748566, -3.770358, -4,
-3.911276, -3.938386, -4,
-3.748566, -3.770358, -2,
-3.911276, -3.938386, -2,
-3.748566, -3.770358, 0,
-3.911276, -3.938386, 0,
-3.748566, -3.770358, 2,
-3.911276, -3.938386, 2,
-3.748566, -3.770358, 4,
-3.911276, -3.938386, 4,
-3.748566, -3.770358, 6,
-3.911276, -3.938386, 6
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
"4",
"6"
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
-4.236696, -4.274443, -6, 0, -0.5, 0.5, 0.5,
-4.236696, -4.274443, -6, 1, -0.5, 0.5, 0.5,
-4.236696, -4.274443, -6, 1, 1.5, 0.5, 0.5,
-4.236696, -4.274443, -6, 0, 1.5, 0.5, 0.5,
-4.236696, -4.274443, -4, 0, -0.5, 0.5, 0.5,
-4.236696, -4.274443, -4, 1, -0.5, 0.5, 0.5,
-4.236696, -4.274443, -4, 1, 1.5, 0.5, 0.5,
-4.236696, -4.274443, -4, 0, 1.5, 0.5, 0.5,
-4.236696, -4.274443, -2, 0, -0.5, 0.5, 0.5,
-4.236696, -4.274443, -2, 1, -0.5, 0.5, 0.5,
-4.236696, -4.274443, -2, 1, 1.5, 0.5, 0.5,
-4.236696, -4.274443, -2, 0, 1.5, 0.5, 0.5,
-4.236696, -4.274443, 0, 0, -0.5, 0.5, 0.5,
-4.236696, -4.274443, 0, 1, -0.5, 0.5, 0.5,
-4.236696, -4.274443, 0, 1, 1.5, 0.5, 0.5,
-4.236696, -4.274443, 0, 0, 1.5, 0.5, 0.5,
-4.236696, -4.274443, 2, 0, -0.5, 0.5, 0.5,
-4.236696, -4.274443, 2, 1, -0.5, 0.5, 0.5,
-4.236696, -4.274443, 2, 1, 1.5, 0.5, 0.5,
-4.236696, -4.274443, 2, 0, 1.5, 0.5, 0.5,
-4.236696, -4.274443, 4, 0, -0.5, 0.5, 0.5,
-4.236696, -4.274443, 4, 1, -0.5, 0.5, 0.5,
-4.236696, -4.274443, 4, 1, 1.5, 0.5, 0.5,
-4.236696, -4.274443, 4, 0, 1.5, 0.5, 0.5,
-4.236696, -4.274443, 6, 0, -0.5, 0.5, 0.5,
-4.236696, -4.274443, 6, 1, -0.5, 0.5, 0.5,
-4.236696, -4.274443, 6, 1, 1.5, 0.5, 0.5,
-4.236696, -4.274443, 6, 0, 1.5, 0.5, 0.5
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
-3.748566, -3.770358, -6.29864,
-3.748566, 2.950772, -6.29864,
-3.748566, -3.770358, 6.507618,
-3.748566, 2.950772, 6.507618,
-3.748566, -3.770358, -6.29864,
-3.748566, -3.770358, 6.507618,
-3.748566, 2.950772, -6.29864,
-3.748566, 2.950772, 6.507618,
-3.748566, -3.770358, -6.29864,
2.75984, -3.770358, -6.29864,
-3.748566, -3.770358, 6.507618,
2.75984, -3.770358, 6.507618,
-3.748566, 2.950772, -6.29864,
2.75984, 2.950772, -6.29864,
-3.748566, 2.950772, 6.507618,
2.75984, 2.950772, 6.507618,
2.75984, -3.770358, -6.29864,
2.75984, 2.950772, -6.29864,
2.75984, -3.770358, 6.507618,
2.75984, 2.950772, 6.507618,
2.75984, -3.770358, -6.29864,
2.75984, -3.770358, 6.507618,
2.75984, 2.950772, -6.29864,
2.75984, 2.950772, 6.507618
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
var radius = 8.468824;
var distance = 37.67875;
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
mvMatrix.translate( 0.4943627, 0.4097933, -0.1044891 );
mvMatrix.scale( 1.406897, 1.362369, 0.7150143 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.67875);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
ethalfluralin<-read.table("ethalfluralin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethalfluralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethalfluralin' not found
```

```r
y<-ethalfluralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethalfluralin' not found
```

```r
z<-ethalfluralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethalfluralin' not found
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
-3.653783, -0.7987581, -0.5647963, 0, 0, 1, 1, 1,
-2.918201, -0.2029998, -2.653971, 1, 0, 0, 1, 1,
-2.54705, 1.006798, -0.5022016, 1, 0, 0, 1, 1,
-2.488837, -1.172109, -1.874916, 1, 0, 0, 1, 1,
-2.450177, 1.222281, -0.3599645, 1, 0, 0, 1, 1,
-2.411139, -0.5101538, -0.949976, 1, 0, 0, 1, 1,
-2.389349, 1.054638, -1.328441, 0, 0, 0, 1, 1,
-2.370976, 0.5544347, -2.296679, 0, 0, 0, 1, 1,
-2.342854, -0.02556966, 0.9877275, 0, 0, 0, 1, 1,
-2.327949, 1.232965, -2.473461, 0, 0, 0, 1, 1,
-2.320079, 0.07220286, -2.967715, 0, 0, 0, 1, 1,
-2.299973, 0.75189, -1.26065, 0, 0, 0, 1, 1,
-2.250165, 0.9070179, -0.3389699, 0, 0, 0, 1, 1,
-2.169962, 2.776376, 1.482112, 1, 1, 1, 1, 1,
-2.153706, 0.471346, -2.206917, 1, 1, 1, 1, 1,
-2.116689, 1.049542, -2.662002, 1, 1, 1, 1, 1,
-2.044815, -1.598532, 0.5329933, 1, 1, 1, 1, 1,
-2.021257, 1.453769, 1.228291, 1, 1, 1, 1, 1,
-2.011452, 0.1199683, -0.7567345, 1, 1, 1, 1, 1,
-1.996986, 0.3324008, -1.973628, 1, 1, 1, 1, 1,
-1.988388, 1.609031, -0.5779662, 1, 1, 1, 1, 1,
-1.96566, 1.784227, -0.667833, 1, 1, 1, 1, 1,
-1.962376, -0.8662336, -1.951111, 1, 1, 1, 1, 1,
-1.959985, -1.777542, -2.648604, 1, 1, 1, 1, 1,
-1.943625, 0.06533781, -1.902991, 1, 1, 1, 1, 1,
-1.918818, 1.30344, -3.200514, 1, 1, 1, 1, 1,
-1.898869, 2.452924, -1.14854, 1, 1, 1, 1, 1,
-1.889156, -0.7398621, -0.9665635, 1, 1, 1, 1, 1,
-1.879331, -0.2351093, -1.870043, 0, 0, 1, 1, 1,
-1.877048, 1.898449, -0.3252165, 1, 0, 0, 1, 1,
-1.873971, 1.036507, -1.720241, 1, 0, 0, 1, 1,
-1.870101, -0.3613636, -1.852789, 1, 0, 0, 1, 1,
-1.856637, -0.6667091, -1.869074, 1, 0, 0, 1, 1,
-1.852632, -0.749533, -1.690392, 1, 0, 0, 1, 1,
-1.833613, -0.9316411, -1.543275, 0, 0, 0, 1, 1,
-1.803382, -0.08990361, -3.175563, 0, 0, 0, 1, 1,
-1.802542, -0.2212959, -1.932331, 0, 0, 0, 1, 1,
-1.800626, 0.8067885, -2.093083, 0, 0, 0, 1, 1,
-1.792908, -1.248979, -3.944536, 0, 0, 0, 1, 1,
-1.773268, -0.4495356, -4.672021, 0, 0, 0, 1, 1,
-1.756688, -0.4765983, -1.874936, 0, 0, 0, 1, 1,
-1.744271, 2.064069, -0.1360282, 1, 1, 1, 1, 1,
-1.737786, -1.035239, -1.368166, 1, 1, 1, 1, 1,
-1.711925, -0.2122408, -1.327531, 1, 1, 1, 1, 1,
-1.70659, 0.2542394, -1.723761, 1, 1, 1, 1, 1,
-1.699764, 0.37087, -3.47887, 1, 1, 1, 1, 1,
-1.687876, 1.250896, 0.06721755, 1, 1, 1, 1, 1,
-1.684229, -0.9391767, -2.604249, 1, 1, 1, 1, 1,
-1.668343, -1.657559, -2.878596, 1, 1, 1, 1, 1,
-1.638893, 2.146154, -0.05779332, 1, 1, 1, 1, 1,
-1.633642, -1.04847, -1.793483, 1, 1, 1, 1, 1,
-1.607465, -0.197605, -2.583295, 1, 1, 1, 1, 1,
-1.593575, 0.6285535, 0.3753086, 1, 1, 1, 1, 1,
-1.58363, 1.465155, -1.186736, 1, 1, 1, 1, 1,
-1.581837, 0.2866581, -0.5234183, 1, 1, 1, 1, 1,
-1.579093, 1.371504, -0.4119376, 1, 1, 1, 1, 1,
-1.578413, 0.2507983, -1.620821, 0, 0, 1, 1, 1,
-1.566155, 0.3392279, -1.117697, 1, 0, 0, 1, 1,
-1.543576, 1.413469, 0.20423, 1, 0, 0, 1, 1,
-1.532784, 0.1100554, -1.366836, 1, 0, 0, 1, 1,
-1.523198, -0.4314398, -1.043954, 1, 0, 0, 1, 1,
-1.522818, -0.2722333, -1.426986, 1, 0, 0, 1, 1,
-1.509803, 2.023625, -1.38756, 0, 0, 0, 1, 1,
-1.480417, 1.327214, 0.1311768, 0, 0, 0, 1, 1,
-1.471468, -0.2840676, -1.731372, 0, 0, 0, 1, 1,
-1.456922, 0.8778965, -0.9421346, 0, 0, 0, 1, 1,
-1.456396, 0.2867968, -2.333312, 0, 0, 0, 1, 1,
-1.451751, 1.886086, -0.2065107, 0, 0, 0, 1, 1,
-1.450233, 0.137472, -3.864838, 0, 0, 0, 1, 1,
-1.446832, -0.2215839, -1.713841, 1, 1, 1, 1, 1,
-1.425607, 1.526314, -1.357078, 1, 1, 1, 1, 1,
-1.42482, 0.6259494, -1.838009, 1, 1, 1, 1, 1,
-1.406789, 2.477574, -1.589553, 1, 1, 1, 1, 1,
-1.401498, 0.5042195, -2.725376, 1, 1, 1, 1, 1,
-1.400745, -1.013097, -2.445167, 1, 1, 1, 1, 1,
-1.392512, 2.201491, -0.3045736, 1, 1, 1, 1, 1,
-1.388574, -0.3719477, -2.196928, 1, 1, 1, 1, 1,
-1.386129, -0.262664, -1.420276, 1, 1, 1, 1, 1,
-1.379619, -1.284576, -1.160934, 1, 1, 1, 1, 1,
-1.36913, 1.681786, 0.2344404, 1, 1, 1, 1, 1,
-1.368857, -0.6477994, -1.700581, 1, 1, 1, 1, 1,
-1.35684, -1.122437, -2.257403, 1, 1, 1, 1, 1,
-1.350625, 0.4819707, -2.768325, 1, 1, 1, 1, 1,
-1.347733, 0.3321545, -1.157195, 1, 1, 1, 1, 1,
-1.343491, -0.4576954, 0.420686, 0, 0, 1, 1, 1,
-1.341324, 0.1573274, -3.390867, 1, 0, 0, 1, 1,
-1.331496, 0.4494705, -1.524529, 1, 0, 0, 1, 1,
-1.32149, 1.451863, -0.09443326, 1, 0, 0, 1, 1,
-1.318371, 0.4082224, -2.414907, 1, 0, 0, 1, 1,
-1.317076, -0.1781857, -2.949404, 1, 0, 0, 1, 1,
-1.31654, 0.7473035, -1.216283, 0, 0, 0, 1, 1,
-1.314795, 0.1186735, -4.063027, 0, 0, 0, 1, 1,
-1.302404, 1.07245, -1.533834, 0, 0, 0, 1, 1,
-1.301691, 0.6597037, -0.5385115, 0, 0, 0, 1, 1,
-1.300138, 0.3250332, -1.56977, 0, 0, 0, 1, 1,
-1.291252, 0.7842094, -2.152261, 0, 0, 0, 1, 1,
-1.275106, 0.2779328, -0.4014124, 0, 0, 0, 1, 1,
-1.268372, 0.2611035, -2.543345, 1, 1, 1, 1, 1,
-1.26163, -0.5967985, -1.014901, 1, 1, 1, 1, 1,
-1.243063, -1.410768, -1.894596, 1, 1, 1, 1, 1,
-1.232034, -0.4058933, -2.013348, 1, 1, 1, 1, 1,
-1.231926, 0.8988321, -0.3947284, 1, 1, 1, 1, 1,
-1.229668, -0.09208106, -0.09902003, 1, 1, 1, 1, 1,
-1.21941, 1.560515, -0.2065169, 1, 1, 1, 1, 1,
-1.201773, -0.4104473, -2.098086, 1, 1, 1, 1, 1,
-1.20114, 0.194618, -1.971481, 1, 1, 1, 1, 1,
-1.193262, 1.335805, -1.845366, 1, 1, 1, 1, 1,
-1.185908, 0.3928612, -1.458592, 1, 1, 1, 1, 1,
-1.182465, -0.5532557, -1.114441, 1, 1, 1, 1, 1,
-1.177462, 1.495709, -1.108327, 1, 1, 1, 1, 1,
-1.175324, -0.09667328, -1.421093, 1, 1, 1, 1, 1,
-1.162619, -0.7900541, -2.393768, 1, 1, 1, 1, 1,
-1.156383, 0.9541549, -0.910323, 0, 0, 1, 1, 1,
-1.144988, 0.9787749, -0.05239167, 1, 0, 0, 1, 1,
-1.130727, 1.118072, -2.53092, 1, 0, 0, 1, 1,
-1.129018, -1.05968, -3.058605, 1, 0, 0, 1, 1,
-1.123362, -1.425482, -6.112141, 1, 0, 0, 1, 1,
-1.11742, -1.272978, -2.179354, 1, 0, 0, 1, 1,
-1.114678, -0.463486, -1.728931, 0, 0, 0, 1, 1,
-1.101712, 0.9427906, -2.496912, 0, 0, 0, 1, 1,
-1.098429, -0.5877585, -2.509324, 0, 0, 0, 1, 1,
-1.097863, -1.763278, -2.410792, 0, 0, 0, 1, 1,
-1.08954, 1.040712, -0.2011205, 0, 0, 0, 1, 1,
-1.087152, -2.510849, -2.044094, 0, 0, 0, 1, 1,
-1.08621, 1.446902, -0.03114776, 0, 0, 0, 1, 1,
-1.076883, -0.136053, -0.9699215, 1, 1, 1, 1, 1,
-1.076088, -2.135993, -2.345058, 1, 1, 1, 1, 1,
-1.073701, 1.188389, 0.8097602, 1, 1, 1, 1, 1,
-1.070372, -1.927422, -2.431596, 1, 1, 1, 1, 1,
-1.058446, 0.488355, -1.441501, 1, 1, 1, 1, 1,
-1.040818, -1.633881, -1.512739, 1, 1, 1, 1, 1,
-1.040538, -1.630018, -3.726994, 1, 1, 1, 1, 1,
-1.039241, 0.4895383, -3.320779, 1, 1, 1, 1, 1,
-1.034229, -1.65625, -2.095269, 1, 1, 1, 1, 1,
-1.028861, 1.849011, 0.6219717, 1, 1, 1, 1, 1,
-1.024761, 2.656067, 0.4441556, 1, 1, 1, 1, 1,
-1.024201, -2.191075, -2.042305, 1, 1, 1, 1, 1,
-1.02346, 0.1963918, -2.321826, 1, 1, 1, 1, 1,
-1.018211, 0.6306092, 0.3984772, 1, 1, 1, 1, 1,
-1.018089, 0.3803074, -1.339106, 1, 1, 1, 1, 1,
-1.005765, 2.3237, 1.483335, 0, 0, 1, 1, 1,
-1.005313, 0.2532907, -1.659257, 1, 0, 0, 1, 1,
-1.000875, -0.09242692, -3.55737, 1, 0, 0, 1, 1,
-0.9963449, 1.135912, 0.180367, 1, 0, 0, 1, 1,
-0.9902358, 0.2120989, -2.063397, 1, 0, 0, 1, 1,
-0.9886094, -0.3682236, -2.983871, 1, 0, 0, 1, 1,
-0.9866598, 0.450635, -2.463059, 0, 0, 0, 1, 1,
-0.9864066, 1.718015, 0.1875806, 0, 0, 0, 1, 1,
-0.9771361, 1.286161, -0.7449947, 0, 0, 0, 1, 1,
-0.9770404, -1.017129, -1.873582, 0, 0, 0, 1, 1,
-0.9753197, 0.6618351, -0.5851006, 0, 0, 0, 1, 1,
-0.9619443, 2.207786, 0.6145341, 0, 0, 0, 1, 1,
-0.9606261, -1.205784, -2.100642, 0, 0, 0, 1, 1,
-0.9439395, 0.9106682, -1.981615, 1, 1, 1, 1, 1,
-0.9388598, -0.7387075, -2.066282, 1, 1, 1, 1, 1,
-0.9378896, 0.7266085, -0.2343308, 1, 1, 1, 1, 1,
-0.9347147, 0.7399383, -0.2500094, 1, 1, 1, 1, 1,
-0.9336301, 1.205887, -0.4641717, 1, 1, 1, 1, 1,
-0.9279379, -0.1646147, -2.173445, 1, 1, 1, 1, 1,
-0.924291, -1.156565, -3.915881, 1, 1, 1, 1, 1,
-0.9226823, -0.5661498, -3.258038, 1, 1, 1, 1, 1,
-0.9202664, -0.3665562, -1.315742, 1, 1, 1, 1, 1,
-0.9197733, 0.682956, -1.450277, 1, 1, 1, 1, 1,
-0.9190897, 0.9895505, -1.288188, 1, 1, 1, 1, 1,
-0.9173644, -0.5727057, -3.238362, 1, 1, 1, 1, 1,
-0.9172222, 1.109309, 0.6568168, 1, 1, 1, 1, 1,
-0.9108583, -0.5137414, -2.392934, 1, 1, 1, 1, 1,
-0.9082708, -0.6951897, -2.627152, 1, 1, 1, 1, 1,
-0.9005231, -0.9807738, -2.597528, 0, 0, 1, 1, 1,
-0.8991778, 0.6899922, -0.09201083, 1, 0, 0, 1, 1,
-0.896997, 1.08054, -0.7397589, 1, 0, 0, 1, 1,
-0.8936931, -1.307466, -0.762742, 1, 0, 0, 1, 1,
-0.8923659, 0.006946415, -1.236841, 1, 0, 0, 1, 1,
-0.8909815, 0.3835508, -1.082999, 1, 0, 0, 1, 1,
-0.8902699, -0.1889116, -1.360355, 0, 0, 0, 1, 1,
-0.8886989, -0.3961329, -1.855443, 0, 0, 0, 1, 1,
-0.8864392, 0.5159626, 0.2744708, 0, 0, 0, 1, 1,
-0.8812507, 1.07493, 0.8529477, 0, 0, 0, 1, 1,
-0.8752283, -0.9593052, -1.852958, 0, 0, 0, 1, 1,
-0.8693308, 0.05031357, -0.5203562, 0, 0, 0, 1, 1,
-0.8644879, 1.106558, -1.14947, 0, 0, 0, 1, 1,
-0.8609109, 0.1773475, -1.219594, 1, 1, 1, 1, 1,
-0.8536475, -0.1431411, -1.353146, 1, 1, 1, 1, 1,
-0.8528056, -1.151914, -1.526658, 1, 1, 1, 1, 1,
-0.8516704, 2.190132, 0.7960278, 1, 1, 1, 1, 1,
-0.8478152, 0.08620879, -1.469437, 1, 1, 1, 1, 1,
-0.8448542, 0.0981678, -1.522823, 1, 1, 1, 1, 1,
-0.8333552, -1.974475, -2.464588, 1, 1, 1, 1, 1,
-0.8330167, 0.318022, -0.5774644, 1, 1, 1, 1, 1,
-0.8295963, 0.5950688, -3.425513, 1, 1, 1, 1, 1,
-0.8295221, -0.7637076, -1.452301, 1, 1, 1, 1, 1,
-0.8213934, 0.6582904, -1.010318, 1, 1, 1, 1, 1,
-0.8204668, 1.135678, -1.32619, 1, 1, 1, 1, 1,
-0.8189086, -2.596468, -3.496482, 1, 1, 1, 1, 1,
-0.8167904, -0.9737737, -2.767901, 1, 1, 1, 1, 1,
-0.8102165, 1.034065, -0.1320709, 1, 1, 1, 1, 1,
-0.7984652, -0.38721, 0.03922457, 0, 0, 1, 1, 1,
-0.7881892, -0.1252805, -1.925903, 1, 0, 0, 1, 1,
-0.7880727, 2.286892, -1.602201, 1, 0, 0, 1, 1,
-0.781685, 0.2882801, 0.687443, 1, 0, 0, 1, 1,
-0.7816519, 0.4675075, -0.3605253, 1, 0, 0, 1, 1,
-0.7803642, 0.07059788, -1.72346, 1, 0, 0, 1, 1,
-0.7775771, -0.5885409, -1.166206, 0, 0, 0, 1, 1,
-0.7694185, 0.7275531, 0.3472598, 0, 0, 0, 1, 1,
-0.7667903, 0.09347263, -1.310754, 0, 0, 0, 1, 1,
-0.7577899, -0.2504528, -2.733644, 0, 0, 0, 1, 1,
-0.751545, 1.517431, 0.5271586, 0, 0, 0, 1, 1,
-0.749068, -0.6384949, -2.34254, 0, 0, 0, 1, 1,
-0.7395628, 2.144302, 1.029398, 0, 0, 0, 1, 1,
-0.7379935, -0.7547227, -0.3234915, 1, 1, 1, 1, 1,
-0.7372187, 0.413752, -0.6962038, 1, 1, 1, 1, 1,
-0.7352952, -1.228218, -1.814311, 1, 1, 1, 1, 1,
-0.7350894, -0.8128734, -4.119556, 1, 1, 1, 1, 1,
-0.7350894, -0.4141554, -4.324997, 1, 1, 1, 1, 1,
-0.7277851, 0.5620769, -0.3231739, 1, 1, 1, 1, 1,
-0.7262289, 0.01994878, -1.349674, 1, 1, 1, 1, 1,
-0.7189162, 0.527635, -1.983237, 1, 1, 1, 1, 1,
-0.7178476, -0.3641644, -3.650454, 1, 1, 1, 1, 1,
-0.716277, 1.674319, -0.4123448, 1, 1, 1, 1, 1,
-0.7151095, -0.7219453, -3.518437, 1, 1, 1, 1, 1,
-0.7061492, -0.4988035, -3.975902, 1, 1, 1, 1, 1,
-0.7036166, -0.03205698, -1.113821, 1, 1, 1, 1, 1,
-0.7015664, -0.5413703, -1.516424, 1, 1, 1, 1, 1,
-0.7007265, 0.1756502, -1.798432, 1, 1, 1, 1, 1,
-0.6990254, 0.2557599, -0.7400746, 0, 0, 1, 1, 1,
-0.6869347, -0.5655678, -0.5372463, 1, 0, 0, 1, 1,
-0.6827661, 0.9508182, -2.396382, 1, 0, 0, 1, 1,
-0.6820367, -0.488605, -2.844045, 1, 0, 0, 1, 1,
-0.677371, -1.951437, -4.609639, 1, 0, 0, 1, 1,
-0.6656994, 2.805635, 2.196843, 1, 0, 0, 1, 1,
-0.6631092, -1.551173, -2.681609, 0, 0, 0, 1, 1,
-0.6593099, -0.1375699, -1.720405, 0, 0, 0, 1, 1,
-0.6590388, 0.07682434, -1.343089, 0, 0, 0, 1, 1,
-0.6564175, 0.4305069, -0.9337904, 0, 0, 0, 1, 1,
-0.6564022, 0.5633885, 0.3233542, 0, 0, 0, 1, 1,
-0.6562567, 1.109388, -1.2327, 0, 0, 0, 1, 1,
-0.6521505, -1.716838, -4.241216, 0, 0, 0, 1, 1,
-0.6493798, 0.3428716, -1.903813, 1, 1, 1, 1, 1,
-0.6343645, 0.4049003, -1.872848, 1, 1, 1, 1, 1,
-0.6312852, 0.4363568, -1.153513, 1, 1, 1, 1, 1,
-0.630706, 1.049744, -0.450123, 1, 1, 1, 1, 1,
-0.6299854, -0.1671353, -1.058284, 1, 1, 1, 1, 1,
-0.6297945, -0.3084023, -3.145751, 1, 1, 1, 1, 1,
-0.6212218, 0.212214, -0.3037733, 1, 1, 1, 1, 1,
-0.6174296, 1.181789, 1.211837, 1, 1, 1, 1, 1,
-0.6155481, -0.01600807, -2.620178, 1, 1, 1, 1, 1,
-0.6138954, -1.011925, -4.978764, 1, 1, 1, 1, 1,
-0.6123728, 1.488347, -1.473523, 1, 1, 1, 1, 1,
-0.6066685, -0.7027466, -3.428033, 1, 1, 1, 1, 1,
-0.6064414, 0.2154747, -1.14651, 1, 1, 1, 1, 1,
-0.6063462, -0.9681531, -3.178424, 1, 1, 1, 1, 1,
-0.6017082, -0.3579411, -2.360175, 1, 1, 1, 1, 1,
-0.6007616, 0.6140924, 0.59662, 0, 0, 1, 1, 1,
-0.5983546, -0.556179, -1.962908, 1, 0, 0, 1, 1,
-0.5969861, -0.1586459, 0.2852911, 1, 0, 0, 1, 1,
-0.5909432, 2.594268, -0.585842, 1, 0, 0, 1, 1,
-0.5885429, -0.6558947, -2.488714, 1, 0, 0, 1, 1,
-0.5883103, -0.2850774, -3.433721, 1, 0, 0, 1, 1,
-0.5808379, -2.486977, -2.802392, 0, 0, 0, 1, 1,
-0.5772488, 0.6000605, -2.549819, 0, 0, 0, 1, 1,
-0.5763131, 1.024139, 1.332037, 0, 0, 0, 1, 1,
-0.5662969, -1.021425, -1.877491, 0, 0, 0, 1, 1,
-0.5656224, -2.310371, -4.260509, 0, 0, 0, 1, 1,
-0.5645034, 0.2792563, -0.8922802, 0, 0, 0, 1, 1,
-0.5627844, 1.406704, -0.00262225, 0, 0, 0, 1, 1,
-0.559051, -0.6992394, -3.250321, 1, 1, 1, 1, 1,
-0.5590119, 0.6776564, -2.529335, 1, 1, 1, 1, 1,
-0.5551435, -1.752503, -2.818499, 1, 1, 1, 1, 1,
-0.5528792, 1.201567, 0.144886, 1, 1, 1, 1, 1,
-0.545271, -0.04122287, -1.43073, 1, 1, 1, 1, 1,
-0.5417896, -1.324185, -4.158751, 1, 1, 1, 1, 1,
-0.5369893, 0.3434749, 0.02702083, 1, 1, 1, 1, 1,
-0.5299321, 0.3321884, -3.663794, 1, 1, 1, 1, 1,
-0.5298507, -0.3588579, -2.182331, 1, 1, 1, 1, 1,
-0.5296528, -0.1109529, -1.700755, 1, 1, 1, 1, 1,
-0.5281245, 0.9122041, 0.0728863, 1, 1, 1, 1, 1,
-0.5257197, -1.765554, -2.458063, 1, 1, 1, 1, 1,
-0.5254933, -0.9451308, -2.181084, 1, 1, 1, 1, 1,
-0.5175368, -0.5784788, -1.980891, 1, 1, 1, 1, 1,
-0.5158096, 0.3824941, -0.6239588, 1, 1, 1, 1, 1,
-0.5128014, -0.891632, -4.561551, 0, 0, 1, 1, 1,
-0.5118954, -1.703724, -0.5265304, 1, 0, 0, 1, 1,
-0.5081908, 0.854514, -0.6393676, 1, 0, 0, 1, 1,
-0.507188, -0.7799992, -1.554598, 1, 0, 0, 1, 1,
-0.505021, -0.7868483, -2.218788, 1, 0, 0, 1, 1,
-0.5047421, 1.807308, 1.36611, 1, 0, 0, 1, 1,
-0.4934115, -0.7922758, -3.59766, 0, 0, 0, 1, 1,
-0.4927878, -0.5325015, -2.080926, 0, 0, 0, 1, 1,
-0.4871831, 0.1243212, -0.6591062, 0, 0, 0, 1, 1,
-0.4837952, 0.1053824, -1.115119, 0, 0, 0, 1, 1,
-0.4825964, -0.8278016, -2.120875, 0, 0, 0, 1, 1,
-0.4815203, -0.08806685, -1.202954, 0, 0, 0, 1, 1,
-0.4782091, 1.541187, -1.040989, 0, 0, 0, 1, 1,
-0.4775383, -1.852106, -1.496822, 1, 1, 1, 1, 1,
-0.4757528, 0.4752742, -1.064723, 1, 1, 1, 1, 1,
-0.4752566, -2.247242, -1.802576, 1, 1, 1, 1, 1,
-0.4744698, -1.188745, -1.251384, 1, 1, 1, 1, 1,
-0.4727964, 0.8167914, -1.006866, 1, 1, 1, 1, 1,
-0.4722086, 2.015836, 0.6121237, 1, 1, 1, 1, 1,
-0.4646445, 0.2843113, -0.3269814, 1, 1, 1, 1, 1,
-0.4621896, -1.479318, -1.135692, 1, 1, 1, 1, 1,
-0.4541132, 1.384056, 0.8226545, 1, 1, 1, 1, 1,
-0.4522514, 0.9937846, -2.046979, 1, 1, 1, 1, 1,
-0.4510081, 1.271177, -0.5560269, 1, 1, 1, 1, 1,
-0.4495352, 0.3403936, -1.376362, 1, 1, 1, 1, 1,
-0.4494404, 0.7010246, -1.255086, 1, 1, 1, 1, 1,
-0.443731, 1.206575, 0.5404512, 1, 1, 1, 1, 1,
-0.4416349, 0.01964219, -3.500475, 1, 1, 1, 1, 1,
-0.4407299, 0.1636081, -0.9695354, 0, 0, 1, 1, 1,
-0.4394045, -0.2724936, -1.402722, 1, 0, 0, 1, 1,
-0.4383655, 0.3950939, -0.1074674, 1, 0, 0, 1, 1,
-0.4337192, -1.265981, -3.063153, 1, 0, 0, 1, 1,
-0.4286036, 1.714492, -0.7053753, 1, 0, 0, 1, 1,
-0.4281613, 1.294256, 0.1376348, 1, 0, 0, 1, 1,
-0.4230483, 0.05590212, -2.537147, 0, 0, 0, 1, 1,
-0.4229296, 0.6287671, -0.6242492, 0, 0, 0, 1, 1,
-0.4225507, -2.282153, -3.368487, 0, 0, 0, 1, 1,
-0.4210528, -0.554086, -3.113667, 0, 0, 0, 1, 1,
-0.4198644, 0.2725005, -0.8213667, 0, 0, 0, 1, 1,
-0.4198372, 1.21961, -0.4710859, 0, 0, 0, 1, 1,
-0.4187868, 0.07586162, -0.6621208, 0, 0, 0, 1, 1,
-0.4170758, 1.111261, 1.03167, 1, 1, 1, 1, 1,
-0.4094565, -0.5554625, -3.706231, 1, 1, 1, 1, 1,
-0.4007185, 0.3976715, 0.3683057, 1, 1, 1, 1, 1,
-0.397558, 0.4562372, -1.34902, 1, 1, 1, 1, 1,
-0.3962891, 0.8010767, 0.2791265, 1, 1, 1, 1, 1,
-0.3945464, 0.536931, -1.168393, 1, 1, 1, 1, 1,
-0.3933148, 1.670937, -0.4401651, 1, 1, 1, 1, 1,
-0.3928166, -1.428063, -4.413003, 1, 1, 1, 1, 1,
-0.390103, 1.323488, -0.6612009, 1, 1, 1, 1, 1,
-0.3875804, -0.3360215, -0.02307739, 1, 1, 1, 1, 1,
-0.3864974, -1.226324, -3.888849, 1, 1, 1, 1, 1,
-0.3861734, -0.8766677, -1.106716, 1, 1, 1, 1, 1,
-0.385049, 0.1021969, -2.042161, 1, 1, 1, 1, 1,
-0.383466, 0.2466807, -1.886232, 1, 1, 1, 1, 1,
-0.3786989, 1.158504, -0.8914638, 1, 1, 1, 1, 1,
-0.3779192, -0.7291383, -2.236145, 0, 0, 1, 1, 1,
-0.3760754, -0.3328176, -1.73528, 1, 0, 0, 1, 1,
-0.3749276, -0.8682224, -2.02826, 1, 0, 0, 1, 1,
-0.37114, -0.4731643, -1.602726, 1, 0, 0, 1, 1,
-0.3711321, -0.8005723, -2.215371, 1, 0, 0, 1, 1,
-0.365142, 1.008815, 0.8295439, 1, 0, 0, 1, 1,
-0.3586522, -0.3318938, -1.565455, 0, 0, 0, 1, 1,
-0.3567163, -0.1036396, -0.3993883, 0, 0, 0, 1, 1,
-0.3523199, 0.3127302, -2.30362, 0, 0, 0, 1, 1,
-0.3522256, -0.05344548, -1.3989, 0, 0, 0, 1, 1,
-0.350367, 0.2492517, -1.591584, 0, 0, 0, 1, 1,
-0.3494012, -0.5568756, -1.039464, 0, 0, 0, 1, 1,
-0.3461092, -0.08103317, -2.985928, 0, 0, 0, 1, 1,
-0.343915, -0.9289854, -3.398998, 1, 1, 1, 1, 1,
-0.3429744, 0.6733572, -1.517158, 1, 1, 1, 1, 1,
-0.3398304, 1.01074, -0.8215662, 1, 1, 1, 1, 1,
-0.3398109, 0.1421289, -2.682428, 1, 1, 1, 1, 1,
-0.3371744, -0.3973402, -0.8451645, 1, 1, 1, 1, 1,
-0.3318627, 2.375964, 0.618857, 1, 1, 1, 1, 1,
-0.3307149, -2.673254, -3.828341, 1, 1, 1, 1, 1,
-0.3229281, 1.491758, -1.655691, 1, 1, 1, 1, 1,
-0.3203245, -0.1507005, -4.387148, 1, 1, 1, 1, 1,
-0.320008, 1.92854, -2.633588, 1, 1, 1, 1, 1,
-0.3194845, 1.133649, -1.117319, 1, 1, 1, 1, 1,
-0.3158802, -1.195657, -2.740584, 1, 1, 1, 1, 1,
-0.3154366, 1.261009, -1.935784, 1, 1, 1, 1, 1,
-0.3151586, -1.243635, -3.069825, 1, 1, 1, 1, 1,
-0.3143082, 2.507412, 0.851378, 1, 1, 1, 1, 1,
-0.3099589, 0.0660791, -1.028489, 0, 0, 1, 1, 1,
-0.3076064, -0.6106231, -1.951709, 1, 0, 0, 1, 1,
-0.3023243, 0.5995695, 0.8945894, 1, 0, 0, 1, 1,
-0.3006393, -0.2318626, -2.094533, 1, 0, 0, 1, 1,
-0.294384, 0.01330803, -0.6196071, 1, 0, 0, 1, 1,
-0.2933864, -0.4811862, -1.914627, 1, 0, 0, 1, 1,
-0.2909831, 0.7300507, -0.7332473, 0, 0, 0, 1, 1,
-0.2904846, 1.161616, 1.471773, 0, 0, 0, 1, 1,
-0.2898262, 0.5764001, -0.7388154, 0, 0, 0, 1, 1,
-0.2886561, -0.2882093, -2.413775, 0, 0, 0, 1, 1,
-0.2878064, 1.905016, 1.135743, 0, 0, 0, 1, 1,
-0.2871359, -2.742413, -2.943988, 0, 0, 0, 1, 1,
-0.2856754, -1.348527, -4.253357, 0, 0, 0, 1, 1,
-0.285047, -1.113086, -2.344206, 1, 1, 1, 1, 1,
-0.2818984, -1.193397, -4.244577, 1, 1, 1, 1, 1,
-0.2791804, 0.4484139, -1.651108, 1, 1, 1, 1, 1,
-0.2740328, 0.2031379, -0.8197192, 1, 1, 1, 1, 1,
-0.2732774, -0.05531878, -2.587418, 1, 1, 1, 1, 1,
-0.2696439, -0.8332267, -2.759655, 1, 1, 1, 1, 1,
-0.2694364, 0.5946034, -0.3925831, 1, 1, 1, 1, 1,
-0.2674181, 0.8637929, -1.693631, 1, 1, 1, 1, 1,
-0.2658322, -0.2668055, -3.258563, 1, 1, 1, 1, 1,
-0.2641073, 1.496115, -0.9370175, 1, 1, 1, 1, 1,
-0.2603755, -0.7280253, -2.556192, 1, 1, 1, 1, 1,
-0.2583109, -0.613377, -4.797522, 1, 1, 1, 1, 1,
-0.251146, 0.05663171, -3.52565, 1, 1, 1, 1, 1,
-0.2485427, -1.229776, -2.628109, 1, 1, 1, 1, 1,
-0.2479823, -0.3844371, -3.170043, 1, 1, 1, 1, 1,
-0.2461357, 0.5567839, 1.695796, 0, 0, 1, 1, 1,
-0.2441315, -1.365421, -2.507734, 1, 0, 0, 1, 1,
-0.240464, -0.8528731, -3.3636, 1, 0, 0, 1, 1,
-0.2376801, -0.4078985, -1.317286, 1, 0, 0, 1, 1,
-0.2345882, 0.2230108, -0.6864103, 1, 0, 0, 1, 1,
-0.2330052, -1.940873, -3.43387, 1, 0, 0, 1, 1,
-0.2323608, -2.125572, -4.337598, 0, 0, 0, 1, 1,
-0.2316398, -0.4831611, -2.585577, 0, 0, 0, 1, 1,
-0.2305113, -0.3642155, -2.547496, 0, 0, 0, 1, 1,
-0.2295955, -0.4305475, -3.563101, 0, 0, 0, 1, 1,
-0.2236784, -0.5922072, -2.559642, 0, 0, 0, 1, 1,
-0.2210677, 1.031956, 0.2974176, 0, 0, 0, 1, 1,
-0.2178743, -0.7411901, -2.586972, 0, 0, 0, 1, 1,
-0.216831, -1.279435, -3.406312, 1, 1, 1, 1, 1,
-0.2135047, 1.401373, -0.1879218, 1, 1, 1, 1, 1,
-0.2130285, -0.7123209, -2.187522, 1, 1, 1, 1, 1,
-0.2123405, 0.3494578, -0.6494397, 1, 1, 1, 1, 1,
-0.2119865, 0.7952371, -0.2949223, 1, 1, 1, 1, 1,
-0.211697, 0.2369562, -0.7186226, 1, 1, 1, 1, 1,
-0.2097331, -0.0893373, -2.053781, 1, 1, 1, 1, 1,
-0.2085684, 0.5100374, -0.3279528, 1, 1, 1, 1, 1,
-0.2085339, 0.3161368, -1.493588, 1, 1, 1, 1, 1,
-0.2079699, 1.582449, -0.01358457, 1, 1, 1, 1, 1,
-0.2059137, -0.04562726, -0.9549777, 1, 1, 1, 1, 1,
-0.2055781, -0.438272, -2.743486, 1, 1, 1, 1, 1,
-0.2054487, 0.4104225, 0.05778938, 1, 1, 1, 1, 1,
-0.2008789, -0.5659138, -3.009419, 1, 1, 1, 1, 1,
-0.2004209, 0.2003657, -1.708964, 1, 1, 1, 1, 1,
-0.1994298, -0.589913, -2.7147, 0, 0, 1, 1, 1,
-0.1985241, 0.4517896, -2.127596, 1, 0, 0, 1, 1,
-0.1931818, 0.04358756, -2.095318, 1, 0, 0, 1, 1,
-0.1911001, 1.578276, 0.3165284, 1, 0, 0, 1, 1,
-0.1870648, 1.52298, -1.18496, 1, 0, 0, 1, 1,
-0.1863083, -0.1546183, -3.331997, 1, 0, 0, 1, 1,
-0.1860713, 0.9903358, -1.4609, 0, 0, 0, 1, 1,
-0.1846147, -0.701448, -3.243058, 0, 0, 0, 1, 1,
-0.1831827, -1.291847, -3.80767, 0, 0, 0, 1, 1,
-0.1817573, -0.9235066, -3.747159, 0, 0, 0, 1, 1,
-0.1799805, 1.216396, -1.239396, 0, 0, 0, 1, 1,
-0.1722014, 0.1821222, -0.3087794, 0, 0, 0, 1, 1,
-0.1718559, -0.3914753, -4.344009, 0, 0, 0, 1, 1,
-0.1713331, 0.3098374, 0.1926909, 1, 1, 1, 1, 1,
-0.1703727, 0.08753802, -1.066471, 1, 1, 1, 1, 1,
-0.1699419, 1.441571, -1.123045, 1, 1, 1, 1, 1,
-0.1677162, -0.1511932, -2.016566, 1, 1, 1, 1, 1,
-0.1634228, 0.3784036, 0.3439504, 1, 1, 1, 1, 1,
-0.1614937, -0.7629426, -1.737024, 1, 1, 1, 1, 1,
-0.16136, 1.313856, -1.296055, 1, 1, 1, 1, 1,
-0.1591364, -0.6258359, -3.840214, 1, 1, 1, 1, 1,
-0.1582262, -0.5992702, -3.379988, 1, 1, 1, 1, 1,
-0.156762, 1.443042, -0.769803, 1, 1, 1, 1, 1,
-0.1557587, -0.1266382, -3.081643, 1, 1, 1, 1, 1,
-0.1551695, 0.5123786, 0.3768359, 1, 1, 1, 1, 1,
-0.1537217, -0.9433998, -3.252132, 1, 1, 1, 1, 1,
-0.1501279, -1.597192, -1.084788, 1, 1, 1, 1, 1,
-0.1459244, 0.2042986, 1.179983, 1, 1, 1, 1, 1,
-0.1433223, 0.8332675, -0.46109, 0, 0, 1, 1, 1,
-0.1397405, 1.060066, -0.5401312, 1, 0, 0, 1, 1,
-0.1377634, 0.367118, 0.6558579, 1, 0, 0, 1, 1,
-0.1361726, -2.076186, -1.767562, 1, 0, 0, 1, 1,
-0.1341297, 0.8136391, -1.528389, 1, 0, 0, 1, 1,
-0.12334, 1.116544, -0.1799703, 1, 0, 0, 1, 1,
-0.1229921, -0.08878739, -1.237662, 0, 0, 0, 1, 1,
-0.122561, -0.2715615, -3.917848, 0, 0, 0, 1, 1,
-0.1193044, 0.7653825, 0.2608446, 0, 0, 0, 1, 1,
-0.1161136, 0.6246048, -0.2399893, 0, 0, 0, 1, 1,
-0.1158693, -0.9094564, -2.230407, 0, 0, 0, 1, 1,
-0.1056278, 0.1432273, -1.392179, 0, 0, 0, 1, 1,
-0.1033843, -0.3194745, -2.578165, 0, 0, 0, 1, 1,
-0.1024117, 0.3340337, -1.52206, 1, 1, 1, 1, 1,
-0.09508176, -0.8760158, -2.97863, 1, 1, 1, 1, 1,
-0.09470227, -0.5101544, -2.274933, 1, 1, 1, 1, 1,
-0.09244587, 0.1671222, -0.7832611, 1, 1, 1, 1, 1,
-0.0919081, -1.279331, -2.995304, 1, 1, 1, 1, 1,
-0.08784239, 0.0924225, -0.4519757, 1, 1, 1, 1, 1,
-0.08629067, -0.8112617, -2.685448, 1, 1, 1, 1, 1,
-0.08529519, -0.3051354, -2.296229, 1, 1, 1, 1, 1,
-0.08273588, -0.3470104, -4.144527, 1, 1, 1, 1, 1,
-0.08048142, 1.201683, 0.1184342, 1, 1, 1, 1, 1,
-0.07917647, -0.5954443, -2.484695, 1, 1, 1, 1, 1,
-0.07820833, -0.8900355, -1.87106, 1, 1, 1, 1, 1,
-0.07719557, -2.222979, -4.560079, 1, 1, 1, 1, 1,
-0.072711, 0.994435, -0.7382118, 1, 1, 1, 1, 1,
-0.07101901, 0.0936911, -0.1134586, 1, 1, 1, 1, 1,
-0.0707495, -0.9951892, -2.398971, 0, 0, 1, 1, 1,
-0.07045919, 1.44346, -0.4780294, 1, 0, 0, 1, 1,
-0.06728609, -1.73413, -3.191911, 1, 0, 0, 1, 1,
-0.06723414, -1.28807, -3.517067, 1, 0, 0, 1, 1,
-0.06551172, -0.5953837, -3.189328, 1, 0, 0, 1, 1,
-0.06344594, 0.0363822, -0.6698527, 1, 0, 0, 1, 1,
-0.06291209, 0.6889004, 0.7995579, 0, 0, 0, 1, 1,
-0.05864893, 0.9377079, -1.109122, 0, 0, 0, 1, 1,
-0.05645011, -0.9806011, -2.80176, 0, 0, 0, 1, 1,
-0.04541337, -0.01529134, -0.6896549, 0, 0, 0, 1, 1,
-0.04539836, -0.885327, -2.215631, 0, 0, 0, 1, 1,
-0.0442525, 0.4881591, -1.233794, 0, 0, 0, 1, 1,
-0.04408026, 1.340014, 2.605543, 0, 0, 0, 1, 1,
-0.04337079, -0.4964243, -3.00528, 1, 1, 1, 1, 1,
-0.03594215, 0.2406072, -1.946488, 1, 1, 1, 1, 1,
-0.03321656, -0.5007285, -1.536244, 1, 1, 1, 1, 1,
-0.03157527, -0.1714588, -1.084255, 1, 1, 1, 1, 1,
-0.02861999, 0.06385668, -0.5181202, 1, 1, 1, 1, 1,
-0.02790119, -0.2332986, -2.520961, 1, 1, 1, 1, 1,
-0.02705178, 0.9987656, 0.2618263, 1, 1, 1, 1, 1,
-0.02605059, 0.6018529, -1.112764, 1, 1, 1, 1, 1,
-0.02161208, 0.001255317, -0.08459, 1, 1, 1, 1, 1,
-0.01277523, -0.09150633, -1.712381, 1, 1, 1, 1, 1,
-0.01051868, 1.902407, 0.1196343, 1, 1, 1, 1, 1,
-0.008671177, -1.29546, -3.199191, 1, 1, 1, 1, 1,
-0.006466234, 0.8267973, -0.6547995, 1, 1, 1, 1, 1,
-0.004186811, -1.47347, -1.90654, 1, 1, 1, 1, 1,
-0.002326446, 0.08635353, 1.18135, 1, 1, 1, 1, 1,
-0.001473702, -0.7997526, -3.936458, 0, 0, 1, 1, 1,
0.0007232179, 1.679821, -0.610153, 1, 0, 0, 1, 1,
0.003811288, -0.5753953, 4.939704, 1, 0, 0, 1, 1,
0.005280236, 0.2757365, -1.547591, 1, 0, 0, 1, 1,
0.006752119, 0.07004533, -0.5505198, 1, 0, 0, 1, 1,
0.007763589, -1.24672, 3.66382, 1, 0, 0, 1, 1,
0.01153993, 0.1003587, -0.7243206, 0, 0, 0, 1, 1,
0.01211858, 0.9787279, -0.9891238, 0, 0, 0, 1, 1,
0.02805784, 0.212685, 0.8230647, 0, 0, 0, 1, 1,
0.02826741, 0.9563726, -0.9153168, 0, 0, 0, 1, 1,
0.02932226, -0.04276142, 1.793881, 0, 0, 0, 1, 1,
0.03118326, -0.5368161, 4.242458, 0, 0, 0, 1, 1,
0.03218049, -0.1974035, 3.488179, 0, 0, 0, 1, 1,
0.03439308, 0.3913501, 0.7193496, 1, 1, 1, 1, 1,
0.03482918, -1.212539, 3.29826, 1, 1, 1, 1, 1,
0.04712362, -0.2596465, 2.279728, 1, 1, 1, 1, 1,
0.04825929, -1.292974, 4.981237, 1, 1, 1, 1, 1,
0.05124933, -0.8536609, 4.174397, 1, 1, 1, 1, 1,
0.05375365, 0.1277304, 0.6880943, 1, 1, 1, 1, 1,
0.05878362, -0.07647983, 1.863313, 1, 1, 1, 1, 1,
0.06016342, -3.364462, 3.675717, 1, 1, 1, 1, 1,
0.06135491, -1.174188, 2.259773, 1, 1, 1, 1, 1,
0.06309322, 0.6973599, -0.2484566, 1, 1, 1, 1, 1,
0.0663508, 0.6807625, 1.691799, 1, 1, 1, 1, 1,
0.06823479, 1.019504, -0.08259981, 1, 1, 1, 1, 1,
0.07128724, 0.1950514, -1.322304, 1, 1, 1, 1, 1,
0.07386541, 0.4750261, 0.0451958, 1, 1, 1, 1, 1,
0.07432505, -1.020633, 3.232945, 1, 1, 1, 1, 1,
0.07738529, -0.7999294, 1.716442, 0, 0, 1, 1, 1,
0.07922138, 0.4211706, 2.284119, 1, 0, 0, 1, 1,
0.0815528, 1.151525, 0.6133506, 1, 0, 0, 1, 1,
0.08329997, -0.1576349, 3.129367, 1, 0, 0, 1, 1,
0.08687193, -1.919644, 3.24089, 1, 0, 0, 1, 1,
0.09052829, -0.5438522, 3.682105, 1, 0, 0, 1, 1,
0.09337387, -1.933601, 3.265776, 0, 0, 0, 1, 1,
0.09497113, -2.40371, 4.27583, 0, 0, 0, 1, 1,
0.09540573, 0.2340622, 0.2481904, 0, 0, 0, 1, 1,
0.09555268, 0.05429766, -0.6151835, 0, 0, 0, 1, 1,
0.0979647, 0.08044975, 2.7133, 0, 0, 0, 1, 1,
0.09855914, 0.7021962, -0.5182926, 0, 0, 0, 1, 1,
0.1013787, -0.6265618, 2.718843, 0, 0, 0, 1, 1,
0.1021253, -1.516299, 5.949063, 1, 1, 1, 1, 1,
0.1077169, -0.8462357, 3.795736, 1, 1, 1, 1, 1,
0.1179838, -2.256645, 4.431238, 1, 1, 1, 1, 1,
0.1203835, 0.7399159, 0.5114793, 1, 1, 1, 1, 1,
0.1244876, 0.09752051, 1.122513, 1, 1, 1, 1, 1,
0.1270108, -0.5703079, 3.355333, 1, 1, 1, 1, 1,
0.1300371, 2.124985, -1.002075, 1, 1, 1, 1, 1,
0.1321835, 0.5676562, -0.01079323, 1, 1, 1, 1, 1,
0.1325818, -1.9043, 1.049235, 1, 1, 1, 1, 1,
0.1400515, -0.8651603, 3.65791, 1, 1, 1, 1, 1,
0.1488311, 0.01002657, 2.338063, 1, 1, 1, 1, 1,
0.1536906, -0.4692034, 3.35988, 1, 1, 1, 1, 1,
0.154058, 0.07979272, 2.383713, 1, 1, 1, 1, 1,
0.1590803, 0.1878776, 0.8475726, 1, 1, 1, 1, 1,
0.1605421, -0.2308201, 2.888412, 1, 1, 1, 1, 1,
0.1618096, 0.4211157, -0.07195226, 0, 0, 1, 1, 1,
0.1642489, -0.2474838, 3.04385, 1, 0, 0, 1, 1,
0.1658884, -0.3114488, 1.783692, 1, 0, 0, 1, 1,
0.1681243, -1.069922, 2.48329, 1, 0, 0, 1, 1,
0.1681902, -0.7282923, 2.803554, 1, 0, 0, 1, 1,
0.1683106, -0.9531196, 2.204062, 1, 0, 0, 1, 1,
0.1684533, -0.1977458, 2.363606, 0, 0, 0, 1, 1,
0.1704699, 0.153739, 0.6221399, 0, 0, 0, 1, 1,
0.1729837, -0.4240581, 2.997613, 0, 0, 0, 1, 1,
0.1768894, 1.031274, 1.429462, 0, 0, 0, 1, 1,
0.1776694, -0.9524354, 1.602211, 0, 0, 0, 1, 1,
0.1786405, -0.2388167, 1.192294, 0, 0, 0, 1, 1,
0.1847956, 1.048752, 0.1856865, 0, 0, 0, 1, 1,
0.1863306, -1.257087, 3.935869, 1, 1, 1, 1, 1,
0.186813, 0.2625853, 0.1214262, 1, 1, 1, 1, 1,
0.1873803, 0.1647349, 0.5732533, 1, 1, 1, 1, 1,
0.1884595, 0.4166669, 1.870332, 1, 1, 1, 1, 1,
0.1904915, 1.524372, -0.8108178, 1, 1, 1, 1, 1,
0.1909618, 1.509512, -0.8437305, 1, 1, 1, 1, 1,
0.1914295, -0.8460131, 1.652006, 1, 1, 1, 1, 1,
0.1917549, -0.8143567, 3.176389, 1, 1, 1, 1, 1,
0.1919923, -0.3888866, 1.625361, 1, 1, 1, 1, 1,
0.1920579, -0.7493119, 4.501473, 1, 1, 1, 1, 1,
0.1932027, 0.7117051, 1.112098, 1, 1, 1, 1, 1,
0.1935218, -0.3143186, 1.819084, 1, 1, 1, 1, 1,
0.195218, 0.7436217, 2.564834, 1, 1, 1, 1, 1,
0.1955341, 0.8419789, -1.154366, 1, 1, 1, 1, 1,
0.198431, -2.346862, 2.91274, 1, 1, 1, 1, 1,
0.1985152, -0.4751177, 3.020703, 0, 0, 1, 1, 1,
0.2005508, -0.6164322, 2.878188, 1, 0, 0, 1, 1,
0.2042615, 1.511623, -0.2849197, 1, 0, 0, 1, 1,
0.206589, 0.7757483, -0.656613, 1, 0, 0, 1, 1,
0.2098546, 0.6549306, -0.5709746, 1, 0, 0, 1, 1,
0.2135278, -0.1541317, 1.674358, 1, 0, 0, 1, 1,
0.2142904, -2.052067, 3.50733, 0, 0, 0, 1, 1,
0.2151844, 0.413194, 0.7150113, 0, 0, 0, 1, 1,
0.2260563, -1.455769, 3.320757, 0, 0, 0, 1, 1,
0.2272511, 0.294856, 1.778417, 0, 0, 0, 1, 1,
0.2291594, 0.3961283, -0.6837532, 0, 0, 0, 1, 1,
0.2325113, -0.5270177, 2.390072, 0, 0, 0, 1, 1,
0.234955, -1.684499, 3.657151, 0, 0, 0, 1, 1,
0.2379677, 1.216328, 0.7394022, 1, 1, 1, 1, 1,
0.2398181, 0.4400412, 1.077375, 1, 1, 1, 1, 1,
0.2417934, 0.7758616, 1.352634, 1, 1, 1, 1, 1,
0.2439861, -0.0288533, 2.592092, 1, 1, 1, 1, 1,
0.2564721, 0.5776927, -0.6927587, 1, 1, 1, 1, 1,
0.2564967, -1.977171, 3.26434, 1, 1, 1, 1, 1,
0.2633562, -0.7423543, 2.103461, 1, 1, 1, 1, 1,
0.2725435, 0.176907, 2.352855, 1, 1, 1, 1, 1,
0.2769347, -1.283215, 6.321119, 1, 1, 1, 1, 1,
0.2801526, 2.852891, 1.563768, 1, 1, 1, 1, 1,
0.2875151, 1.73441, -1.187557, 1, 1, 1, 1, 1,
0.2880459, 0.501601, 0.7560694, 1, 1, 1, 1, 1,
0.2918215, -0.6746086, 2.467813, 1, 1, 1, 1, 1,
0.2957296, 0.0393561, 0.5220683, 1, 1, 1, 1, 1,
0.2968826, -0.9143959, 4.346039, 1, 1, 1, 1, 1,
0.2971325, -0.0006492813, 1.313981, 0, 0, 1, 1, 1,
0.298128, -0.3522126, 2.186528, 1, 0, 0, 1, 1,
0.2995526, -0.2012311, 2.456484, 1, 0, 0, 1, 1,
0.3007264, -1.543095, 3.709265, 1, 0, 0, 1, 1,
0.3011161, -0.9526625, 3.312306, 1, 0, 0, 1, 1,
0.3016493, -1.856663, 3.637967, 1, 0, 0, 1, 1,
0.3053643, 1.2198, -0.2661287, 0, 0, 0, 1, 1,
0.3071182, 1.222182, 0.8439383, 0, 0, 0, 1, 1,
0.310339, -0.8422027, 3.264436, 0, 0, 0, 1, 1,
0.3116664, -0.09885108, 1.07849, 0, 0, 0, 1, 1,
0.3133475, -0.2762501, 2.844232, 0, 0, 0, 1, 1,
0.3150641, -0.4344359, 2.502956, 0, 0, 0, 1, 1,
0.3176135, 1.159505, 0.4774052, 0, 0, 0, 1, 1,
0.3230484, 0.5073362, -0.06903885, 1, 1, 1, 1, 1,
0.3298629, 1.382333, -0.9441775, 1, 1, 1, 1, 1,
0.3298734, 1.276981, 1.058193, 1, 1, 1, 1, 1,
0.3312134, -0.3741048, 1.584901, 1, 1, 1, 1, 1,
0.3340518, -0.2844734, 2.605207, 1, 1, 1, 1, 1,
0.3341934, 0.2121738, 1.897711, 1, 1, 1, 1, 1,
0.3365702, 0.6832038, 0.2632365, 1, 1, 1, 1, 1,
0.3440778, 0.6856899, 0.50912, 1, 1, 1, 1, 1,
0.3490219, 0.7153127, 2.840145, 1, 1, 1, 1, 1,
0.3506128, 0.3865828, 0.5178826, 1, 1, 1, 1, 1,
0.3509667, 1.112477, -0.06092636, 1, 1, 1, 1, 1,
0.3531116, -0.2936445, 0.826443, 1, 1, 1, 1, 1,
0.3569649, 0.4617358, 0.9044691, 1, 1, 1, 1, 1,
0.3578888, 0.1918102, 3.659108, 1, 1, 1, 1, 1,
0.3599531, -0.00795802, 2.303354, 1, 1, 1, 1, 1,
0.3608347, 1.040739, -0.5073892, 0, 0, 1, 1, 1,
0.3654121, 0.8576909, 1.13903, 1, 0, 0, 1, 1,
0.3663895, -0.5234903, -0.1779529, 1, 0, 0, 1, 1,
0.3679517, -1.375802, 3.305194, 1, 0, 0, 1, 1,
0.3730756, -3.334433, 1.905737, 1, 0, 0, 1, 1,
0.3868362, -1.025935, 2.335903, 1, 0, 0, 1, 1,
0.391657, -1.67151, 3.728775, 0, 0, 0, 1, 1,
0.3954604, 1.469086, 0.7066687, 0, 0, 0, 1, 1,
0.4001483, 1.09619, -0.165995, 0, 0, 0, 1, 1,
0.4005197, -0.40131, 3.254797, 0, 0, 0, 1, 1,
0.4006788, -0.7623785, 1.753796, 0, 0, 0, 1, 1,
0.4013549, 0.2831326, 1.021026, 0, 0, 0, 1, 1,
0.4022968, 0.7927645, 0.9761589, 0, 0, 0, 1, 1,
0.4097361, 0.6631342, 0.990938, 1, 1, 1, 1, 1,
0.4104972, -0.6438218, 2.221553, 1, 1, 1, 1, 1,
0.4113275, -1.410282, 2.018422, 1, 1, 1, 1, 1,
0.411374, 1.452078, -0.3961186, 1, 1, 1, 1, 1,
0.4116641, 0.1182651, 1.445389, 1, 1, 1, 1, 1,
0.4144603, 0.5979633, -0.9342306, 1, 1, 1, 1, 1,
0.4157501, 1.107274, -0.8439651, 1, 1, 1, 1, 1,
0.4168566, 2.204283, 0.9118938, 1, 1, 1, 1, 1,
0.4174908, -0.05309655, 2.602273, 1, 1, 1, 1, 1,
0.4218932, -0.3959028, 0.8224495, 1, 1, 1, 1, 1,
0.4285499, 0.02087655, 1.289065, 1, 1, 1, 1, 1,
0.4289705, -1.574363, 3.230363, 1, 1, 1, 1, 1,
0.4300598, 0.2109131, 2.048569, 1, 1, 1, 1, 1,
0.435177, -0.04532582, 2.121891, 1, 1, 1, 1, 1,
0.4357138, -1.083249, 1.68664, 1, 1, 1, 1, 1,
0.4422015, -1.196282, 3.378407, 0, 0, 1, 1, 1,
0.4444608, -0.5786014, 1.721561, 1, 0, 0, 1, 1,
0.4478283, -0.4571755, 1.881438, 1, 0, 0, 1, 1,
0.4490645, 0.7019383, 2.537193, 1, 0, 0, 1, 1,
0.4587333, 0.2930612, 1.588954, 1, 0, 0, 1, 1,
0.4619615, 1.301023, 1.856625, 1, 0, 0, 1, 1,
0.4673859, -0.2046539, 3.303379, 0, 0, 0, 1, 1,
0.4707621, -0.4660918, 1.832475, 0, 0, 0, 1, 1,
0.4720111, -1.375227, 1.666312, 0, 0, 0, 1, 1,
0.4754966, 0.09507779, 1.39086, 0, 0, 0, 1, 1,
0.4813127, 1.141011, -0.734549, 0, 0, 0, 1, 1,
0.4816592, 1.420679, 0.6300879, 0, 0, 0, 1, 1,
0.4858425, 1.097958, 0.4879942, 0, 0, 0, 1, 1,
0.4860013, 1.893068, 1.437466, 1, 1, 1, 1, 1,
0.4886255, -0.8054397, 2.728856, 1, 1, 1, 1, 1,
0.4887217, -0.08520205, 1.343165, 1, 1, 1, 1, 1,
0.4905013, 0.2728146, 0.6866241, 1, 1, 1, 1, 1,
0.4906975, 0.4057614, 1.222047, 1, 1, 1, 1, 1,
0.4949418, -0.9892466, 2.572735, 1, 1, 1, 1, 1,
0.4950785, 0.469642, 2.027907, 1, 1, 1, 1, 1,
0.495726, 1.266552, -1.811099, 1, 1, 1, 1, 1,
0.4978758, -0.4433887, 2.00441, 1, 1, 1, 1, 1,
0.4981893, -0.5486087, 1.854147, 1, 1, 1, 1, 1,
0.4982174, -0.3619585, 1.743218, 1, 1, 1, 1, 1,
0.4992254, -0.8594483, 2.591193, 1, 1, 1, 1, 1,
0.5003127, -0.2705288, 3.768083, 1, 1, 1, 1, 1,
0.501712, -0.8869275, 3.034976, 1, 1, 1, 1, 1,
0.5053046, -0.3114006, 2.645576, 1, 1, 1, 1, 1,
0.5162429, 0.2827632, 2.225446, 0, 0, 1, 1, 1,
0.5195749, 2.204025, 0.03499019, 1, 0, 0, 1, 1,
0.524059, -0.644879, 0.9611533, 1, 0, 0, 1, 1,
0.5254534, -1.506942, 3.017599, 1, 0, 0, 1, 1,
0.5301017, -1.316766, 2.370208, 1, 0, 0, 1, 1,
0.5310196, -1.061094, 2.257098, 1, 0, 0, 1, 1,
0.5390927, -0.3672028, 2.64976, 0, 0, 0, 1, 1,
0.5414779, -0.5909172, 2.240134, 0, 0, 0, 1, 1,
0.5433726, 0.8241608, 1.816301, 0, 0, 0, 1, 1,
0.5450245, 0.5942143, 1.531239, 0, 0, 0, 1, 1,
0.5453641, 0.2330683, 0.344581, 0, 0, 0, 1, 1,
0.5514286, 0.1400298, 1.512617, 0, 0, 0, 1, 1,
0.5538174, -0.5258282, 2.211194, 0, 0, 0, 1, 1,
0.5581858, -0.2976202, 1.412079, 1, 1, 1, 1, 1,
0.558651, -3.672477, 3.324219, 1, 1, 1, 1, 1,
0.561116, -0.3285942, 2.258544, 1, 1, 1, 1, 1,
0.572699, 0.1336688, 2.826782, 1, 1, 1, 1, 1,
0.5750113, -0.3858591, 2.555608, 1, 1, 1, 1, 1,
0.5763181, -0.03047806, 1.741948, 1, 1, 1, 1, 1,
0.5797883, -0.1600299, 2.635767, 1, 1, 1, 1, 1,
0.5843404, -1.206966, 3.787104, 1, 1, 1, 1, 1,
0.5858781, 0.01346217, 2.247415, 1, 1, 1, 1, 1,
0.5872404, 0.8738009, 0.6829359, 1, 1, 1, 1, 1,
0.5887452, 0.204729, 1.322642, 1, 1, 1, 1, 1,
0.5893976, -1.030465, 3.364258, 1, 1, 1, 1, 1,
0.5899145, 0.8803295, 0.7420208, 1, 1, 1, 1, 1,
0.593524, -1.319317, 4.46897, 1, 1, 1, 1, 1,
0.5936945, 0.5477569, 1.493012, 1, 1, 1, 1, 1,
0.5998726, -0.8058318, 3.755884, 0, 0, 1, 1, 1,
0.6022018, 0.4583953, 2.073609, 1, 0, 0, 1, 1,
0.6028612, -0.3158327, -0.4845215, 1, 0, 0, 1, 1,
0.6031182, 0.2926541, 0.8374014, 1, 0, 0, 1, 1,
0.6031681, 0.3346286, 3.014007, 1, 0, 0, 1, 1,
0.6058528, 0.3261359, 1.28314, 1, 0, 0, 1, 1,
0.6063759, 1.550598, 0.4409283, 0, 0, 0, 1, 1,
0.6125954, -1.006329, 2.576946, 0, 0, 0, 1, 1,
0.6161548, -0.660645, 1.768236, 0, 0, 0, 1, 1,
0.6176113, 0.3919827, 1.34463, 0, 0, 0, 1, 1,
0.6180497, 0.3070805, 0.93317, 0, 0, 0, 1, 1,
0.6220756, -1.025665, 2.049787, 0, 0, 0, 1, 1,
0.6237832, 0.9159748, 0.6243678, 0, 0, 0, 1, 1,
0.6296582, -1.342705, 3.704766, 1, 1, 1, 1, 1,
0.6307098, -0.0004097525, 0.8212326, 1, 1, 1, 1, 1,
0.6313189, 0.7974634, 0.4722307, 1, 1, 1, 1, 1,
0.6321504, 0.3937946, 0.4844091, 1, 1, 1, 1, 1,
0.6334512, 0.3268734, -0.5212358, 1, 1, 1, 1, 1,
0.6341219, 0.480081, -1.225726, 1, 1, 1, 1, 1,
0.6395193, -0.551719, 1.616262, 1, 1, 1, 1, 1,
0.6434293, 0.2350557, 1.204433, 1, 1, 1, 1, 1,
0.6452793, -0.5856469, 1.785282, 1, 1, 1, 1, 1,
0.6511129, -0.1207856, 1.050879, 1, 1, 1, 1, 1,
0.6521494, -0.05589224, 0.3462435, 1, 1, 1, 1, 1,
0.6591496, 2.029067, 0.8183982, 1, 1, 1, 1, 1,
0.6636612, -0.4984424, 2.404545, 1, 1, 1, 1, 1,
0.6650028, 0.1885291, 2.27227, 1, 1, 1, 1, 1,
0.6666317, -0.5827137, 4.505312, 1, 1, 1, 1, 1,
0.6676192, -1.323635, 2.176163, 0, 0, 1, 1, 1,
0.6766148, -0.5011325, 2.30861, 1, 0, 0, 1, 1,
0.6792293, -0.006389888, 2.629141, 1, 0, 0, 1, 1,
0.6909428, 1.342759, 1.614233, 1, 0, 0, 1, 1,
0.6966687, 1.263391, 1.163939, 1, 0, 0, 1, 1,
0.6971489, -0.4129587, 3.56313, 1, 0, 0, 1, 1,
0.7037154, -1.266445, 2.334316, 0, 0, 0, 1, 1,
0.7039185, 0.2640592, 0.8481467, 0, 0, 0, 1, 1,
0.704929, 1.271101, 1.938884, 0, 0, 0, 1, 1,
0.7149547, -1.39179, 4.671769, 0, 0, 0, 1, 1,
0.7153025, -0.4358088, 1.221939, 0, 0, 0, 1, 1,
0.7153343, -0.9595014, 3.128113, 0, 0, 0, 1, 1,
0.7206112, -1.304147, 3.203002, 0, 0, 0, 1, 1,
0.723724, -1.071705, 4.620232, 1, 1, 1, 1, 1,
0.7257189, -0.09393078, 0.6347706, 1, 1, 1, 1, 1,
0.7264329, 2.806597, -0.4441154, 1, 1, 1, 1, 1,
0.7264405, -1.133226, 2.37109, 1, 1, 1, 1, 1,
0.7315388, 0.7201099, -1.339639, 1, 1, 1, 1, 1,
0.7337476, -0.2850114, 2.445127, 1, 1, 1, 1, 1,
0.7417766, -1.14643, 3.302458, 1, 1, 1, 1, 1,
0.7472978, -0.884629, 2.963841, 1, 1, 1, 1, 1,
0.7605039, 2.187845, 0.05701866, 1, 1, 1, 1, 1,
0.7607953, -0.4517528, 1.918641, 1, 1, 1, 1, 1,
0.7641131, 1.400633, 2.172976, 1, 1, 1, 1, 1,
0.7674795, 1.434879, 0.7263625, 1, 1, 1, 1, 1,
0.7686194, 0.924027, 1.411393, 1, 1, 1, 1, 1,
0.770477, -0.345858, 0.8438424, 1, 1, 1, 1, 1,
0.771354, -1.880969, 3.945824, 1, 1, 1, 1, 1,
0.7758427, -1.116225, 2.610635, 0, 0, 1, 1, 1,
0.7774267, -0.6847529, 1.776651, 1, 0, 0, 1, 1,
0.7804629, -0.340116, 0.7013178, 1, 0, 0, 1, 1,
0.7846, 0.1289945, 2.400094, 1, 0, 0, 1, 1,
0.7847193, -0.1449337, 2.917588, 1, 0, 0, 1, 1,
0.7925261, -2.321894, 2.649575, 1, 0, 0, 1, 1,
0.7930491, -0.2754492, 1.794388, 0, 0, 0, 1, 1,
0.8004299, 1.412288, 0.02188035, 0, 0, 0, 1, 1,
0.8013639, 0.1910995, 0.05367268, 0, 0, 0, 1, 1,
0.8028601, 0.4997148, 0.5981121, 0, 0, 0, 1, 1,
0.8096668, 1.139625, 1.457455, 0, 0, 0, 1, 1,
0.8159618, 1.113313, 0.8103373, 0, 0, 0, 1, 1,
0.816934, 0.7312356, 3.014634, 0, 0, 0, 1, 1,
0.8172258, 0.6681744, 0.8829163, 1, 1, 1, 1, 1,
0.8202499, 0.2045124, 0.675127, 1, 1, 1, 1, 1,
0.8274744, 0.3914597, 0.2187486, 1, 1, 1, 1, 1,
0.8298885, 0.6022598, -0.4825405, 1, 1, 1, 1, 1,
0.8314649, 1.334921, 0.8379831, 1, 1, 1, 1, 1,
0.8353313, -0.5617027, 1.442862, 1, 1, 1, 1, 1,
0.8365434, -0.896412, 2.762434, 1, 1, 1, 1, 1,
0.8369047, 1.251763, 0.4172209, 1, 1, 1, 1, 1,
0.8401706, 0.6429475, 1.553684, 1, 1, 1, 1, 1,
0.8562519, 0.7703398, 3.307627, 1, 1, 1, 1, 1,
0.8581522, -1.305621, 1.939447, 1, 1, 1, 1, 1,
0.8621714, 0.01206578, 1.760409, 1, 1, 1, 1, 1,
0.8684633, 1.057816, 0.4309034, 1, 1, 1, 1, 1,
0.8699584, 0.4968244, 3.650701, 1, 1, 1, 1, 1,
0.8699609, 0.4706428, 1.737736, 1, 1, 1, 1, 1,
0.8713717, 0.2991906, 3.356237, 0, 0, 1, 1, 1,
0.8801458, -0.1169335, 0.4089855, 1, 0, 0, 1, 1,
0.8839034, 0.6325134, 0.5665337, 1, 0, 0, 1, 1,
0.8839346, -1.080584, 2.193474, 1, 0, 0, 1, 1,
0.8860517, -1.003744, 0.9968854, 1, 0, 0, 1, 1,
0.8913167, -0.2238964, 1.849168, 1, 0, 0, 1, 1,
0.9018755, 0.8153988, 0.6300136, 0, 0, 0, 1, 1,
0.9021695, 0.08605962, 2.008934, 0, 0, 0, 1, 1,
0.9054887, 1.89018, 1.669177, 0, 0, 0, 1, 1,
0.907154, 1.136409, -0.1692813, 0, 0, 0, 1, 1,
0.9085518, 1.6755, 0.1749478, 0, 0, 0, 1, 1,
0.9145396, -1.181815, 3.286268, 0, 0, 0, 1, 1,
0.9186146, 0.5573452, 3.004988, 0, 0, 0, 1, 1,
0.9221384, 0.7072069, 1.805442, 1, 1, 1, 1, 1,
0.9226091, -1.745843, 2.168819, 1, 1, 1, 1, 1,
0.92547, -0.05709791, 1.56486, 1, 1, 1, 1, 1,
0.9267882, 0.5576965, 0.5173129, 1, 1, 1, 1, 1,
0.9365737, 1.284467, 0.4250676, 1, 1, 1, 1, 1,
0.9377204, -2.037184, 2.643767, 1, 1, 1, 1, 1,
0.9423919, -1.735348, 2.186116, 1, 1, 1, 1, 1,
0.9460166, 1.439517, 0.2450867, 1, 1, 1, 1, 1,
0.9569589, -1.86471, 4.936081, 1, 1, 1, 1, 1,
0.9618068, -1.170444, 1.632825, 1, 1, 1, 1, 1,
0.9623005, 0.5678484, 1.921489, 1, 1, 1, 1, 1,
0.9655156, -0.7051538, 2.497448, 1, 1, 1, 1, 1,
0.9706996, 0.9756026, -1.635676, 1, 1, 1, 1, 1,
0.9779929, 0.3448725, 0.291059, 1, 1, 1, 1, 1,
0.9872304, 1.110934, 0.4960628, 1, 1, 1, 1, 1,
0.9875026, -1.002195, 2.508979, 0, 0, 1, 1, 1,
0.9933427, 0.8803818, 0.523913, 1, 0, 0, 1, 1,
0.9974948, 2.038812, -0.1589132, 1, 0, 0, 1, 1,
0.9989848, -2.335292, 3.963567, 1, 0, 0, 1, 1,
1.012171, -0.1814529, 1.860916, 1, 0, 0, 1, 1,
1.016587, 0.660088, 0.3575157, 1, 0, 0, 1, 1,
1.021978, 1.189585, 1.924742, 0, 0, 0, 1, 1,
1.024897, 1.194399, 1.588427, 0, 0, 0, 1, 1,
1.025463, -0.1003145, 1.52429, 0, 0, 0, 1, 1,
1.027392, -1.404111, 2.094827, 0, 0, 0, 1, 1,
1.030945, 0.03932848, 1.590378, 0, 0, 0, 1, 1,
1.031983, 0.2979275, 0.9618686, 0, 0, 0, 1, 1,
1.03684, -2.273454, 4.473236, 0, 0, 0, 1, 1,
1.040729, 0.6454625, 2.847028, 1, 1, 1, 1, 1,
1.043424, 0.4528182, 1.673892, 1, 1, 1, 1, 1,
1.044265, 2.097225, 0.5609121, 1, 1, 1, 1, 1,
1.049085, -1.054593, 2.616168, 1, 1, 1, 1, 1,
1.049584, -1.284986, 2.138144, 1, 1, 1, 1, 1,
1.051379, -0.5851567, 3.200438, 1, 1, 1, 1, 1,
1.05189, 1.583355, 1.254453, 1, 1, 1, 1, 1,
1.051904, 1.426694, 0.798757, 1, 1, 1, 1, 1,
1.05543, 0.3649913, 2.227772, 1, 1, 1, 1, 1,
1.057078, -0.4787597, 2.812368, 1, 1, 1, 1, 1,
1.058666, 0.9449538, 0.7774748, 1, 1, 1, 1, 1,
1.060414, -0.2717129, 2.622641, 1, 1, 1, 1, 1,
1.065015, -1.79632, 2.31926, 1, 1, 1, 1, 1,
1.078639, -1.158383, 1.160578, 1, 1, 1, 1, 1,
1.079957, 2.500157, 0.1180582, 1, 1, 1, 1, 1,
1.086136, 2.602304, 1.251425, 0, 0, 1, 1, 1,
1.087173, 0.5634366, 1.609264, 1, 0, 0, 1, 1,
1.090613, -1.04434, 0.471657, 1, 0, 0, 1, 1,
1.099707, -0.4041167, 2.473897, 1, 0, 0, 1, 1,
1.119505, -0.04050362, 1.419479, 1, 0, 0, 1, 1,
1.121846, -0.3590182, 1.245017, 1, 0, 0, 1, 1,
1.124256, 0.8886179, 0.124323, 0, 0, 0, 1, 1,
1.124711, -0.08895802, 1.898396, 0, 0, 0, 1, 1,
1.12572, -0.6287709, 2.394869, 0, 0, 0, 1, 1,
1.133372, -0.3608575, 0.8507202, 0, 0, 0, 1, 1,
1.139055, -0.4066572, 2.473033, 0, 0, 0, 1, 1,
1.141134, -0.8504826, 3.007682, 0, 0, 0, 1, 1,
1.148853, 0.8586271, 0.8219568, 0, 0, 0, 1, 1,
1.149271, -0.1971469, 0.1777015, 1, 1, 1, 1, 1,
1.160164, 0.4194345, 2.687398, 1, 1, 1, 1, 1,
1.162528, -0.3116023, 3.55654, 1, 1, 1, 1, 1,
1.164358, 0.2006685, 3.581726, 1, 1, 1, 1, 1,
1.165711, -0.8281981, 2.565959, 1, 1, 1, 1, 1,
1.176521, -0.5916584, 2.770093, 1, 1, 1, 1, 1,
1.186565, -0.04798704, 3.309288, 1, 1, 1, 1, 1,
1.195986, -1.597079, 1.845531, 1, 1, 1, 1, 1,
1.198645, 0.07163269, 1.7551, 1, 1, 1, 1, 1,
1.207712, -0.09003246, 1.209113, 1, 1, 1, 1, 1,
1.211237, -2.22636, 2.232788, 1, 1, 1, 1, 1,
1.21254, -0.02665882, 2.869679, 1, 1, 1, 1, 1,
1.22385, -0.02464001, -0.1825319, 1, 1, 1, 1, 1,
1.224101, 1.22924, -0.2601829, 1, 1, 1, 1, 1,
1.228437, -1.338363, 1.918273, 1, 1, 1, 1, 1,
1.232807, 1.262125, 0.6417955, 0, 0, 1, 1, 1,
1.249733, 0.7760973, 0.8200996, 1, 0, 0, 1, 1,
1.25283, 0.02260051, 0.2040441, 1, 0, 0, 1, 1,
1.267683, -0.7628165, 1.082664, 1, 0, 0, 1, 1,
1.268608, 0.7185208, 2.207552, 1, 0, 0, 1, 1,
1.269653, -0.7806896, 2.006863, 1, 0, 0, 1, 1,
1.283795, -0.7774788, 1.472908, 0, 0, 0, 1, 1,
1.284873, 0.4544427, 1.118872, 0, 0, 0, 1, 1,
1.290486, -1.008828, 2.997644, 0, 0, 0, 1, 1,
1.304935, -0.2302371, 2.059386, 0, 0, 0, 1, 1,
1.315799, -1.535015, 2.934911, 0, 0, 0, 1, 1,
1.321219, -0.5683955, 1.428519, 0, 0, 0, 1, 1,
1.321565, -1.051694, 3.077088, 0, 0, 0, 1, 1,
1.330956, -0.01485464, 1.118986, 1, 1, 1, 1, 1,
1.355332, 1.273314, 0.7659525, 1, 1, 1, 1, 1,
1.369574, 0.9409069, 3.474094, 1, 1, 1, 1, 1,
1.384264, -1.086772, 3.607261, 1, 1, 1, 1, 1,
1.391202, -0.5888033, 3.353946, 1, 1, 1, 1, 1,
1.392336, 1.908726, 1.256732, 1, 1, 1, 1, 1,
1.395548, 1.736191, 1.127059, 1, 1, 1, 1, 1,
1.399937, -0.6422067, -0.5568755, 1, 1, 1, 1, 1,
1.402572, 1.441338, 3.219366, 1, 1, 1, 1, 1,
1.403986, 0.2303216, -0.1665868, 1, 1, 1, 1, 1,
1.404124, -0.4848114, 2.284616, 1, 1, 1, 1, 1,
1.406751, -0.9728277, 4.257022, 1, 1, 1, 1, 1,
1.407543, 0.3895838, 1.162763, 1, 1, 1, 1, 1,
1.419801, 0.9037008, 1.267535, 1, 1, 1, 1, 1,
1.427526, -2.462274, 0.7497899, 1, 1, 1, 1, 1,
1.437031, 0.5030925, 0.8656893, 0, 0, 1, 1, 1,
1.437116, -0.4622591, -0.6152925, 1, 0, 0, 1, 1,
1.441977, 0.7012618, 0.7958816, 1, 0, 0, 1, 1,
1.445924, 0.8464916, 0.2106519, 1, 0, 0, 1, 1,
1.45429, -0.611211, 1.412371, 1, 0, 0, 1, 1,
1.455486, 1.562359, 0.2289632, 1, 0, 0, 1, 1,
1.460433, -0.886054, 3.262057, 0, 0, 0, 1, 1,
1.462495, 1.01447, -0.9273388, 0, 0, 0, 1, 1,
1.464563, 0.3551308, 3.948547, 0, 0, 0, 1, 1,
1.465448, -0.3313923, 1.197374, 0, 0, 0, 1, 1,
1.468575, 0.4511825, 2.529486, 0, 0, 0, 1, 1,
1.476343, 0.1245774, 0.6373124, 0, 0, 0, 1, 1,
1.479282, 1.195134, 1.81687, 0, 0, 0, 1, 1,
1.480963, -0.3468753, 2.119402, 1, 1, 1, 1, 1,
1.485991, -0.6469371, 1.823782, 1, 1, 1, 1, 1,
1.489685, 1.86042, 2.198914, 1, 1, 1, 1, 1,
1.510514, -0.1988466, -0.2561344, 1, 1, 1, 1, 1,
1.511664, 0.4323467, 1.800228, 1, 1, 1, 1, 1,
1.521202, 0.4376844, 3.70357, 1, 1, 1, 1, 1,
1.523512, 0.9681705, -0.1858147, 1, 1, 1, 1, 1,
1.527887, 1.047707, 1.430821, 1, 1, 1, 1, 1,
1.541107, -0.7710729, 3.782394, 1, 1, 1, 1, 1,
1.553244, -2.447955, 2.195666, 1, 1, 1, 1, 1,
1.566181, -0.1195444, 1.825808, 1, 1, 1, 1, 1,
1.571736, 1.044176, 1.532556, 1, 1, 1, 1, 1,
1.58922, -0.1443046, -0.6059732, 1, 1, 1, 1, 1,
1.59446, -0.5064413, 0.2225512, 1, 1, 1, 1, 1,
1.636136, 0.1663914, -0.01731894, 1, 1, 1, 1, 1,
1.64709, -1.722652, 2.981157, 0, 0, 1, 1, 1,
1.648253, -1.263832, 1.007465, 1, 0, 0, 1, 1,
1.679217, 0.7453737, 0.8006376, 1, 0, 0, 1, 1,
1.679557, 1.377145, 0.3412217, 1, 0, 0, 1, 1,
1.681018, -1.441009, 0.8843377, 1, 0, 0, 1, 1,
1.704017, -0.3909061, 2.28021, 1, 0, 0, 1, 1,
1.713206, 1.382194, 2.211191, 0, 0, 0, 1, 1,
1.72601, 0.9694533, 1.791145, 0, 0, 0, 1, 1,
1.735204, 0.9288244, 0.4242026, 0, 0, 0, 1, 1,
1.737343, 1.425631, 1.731645, 0, 0, 0, 1, 1,
1.740348, 1.276303, 1.274143, 0, 0, 0, 1, 1,
1.77906, -0.2656103, 4.163315, 0, 0, 0, 1, 1,
1.782468, 2.103324, -1.259755, 0, 0, 0, 1, 1,
1.798008, 1.151924, 0.1998971, 1, 1, 1, 1, 1,
1.802979, 0.5120306, 1.610215, 1, 1, 1, 1, 1,
1.823562, 1.052183, 0.06238876, 1, 1, 1, 1, 1,
1.841609, 0.4434698, 2.088313, 1, 1, 1, 1, 1,
1.851561, -1.566859, 1.853355, 1, 1, 1, 1, 1,
1.853187, -0.2979819, 1.149316, 1, 1, 1, 1, 1,
1.867559, 1.45175, 3.170357, 1, 1, 1, 1, 1,
1.892308, -1.324847, 1.783187, 1, 1, 1, 1, 1,
1.897273, 0.06585439, 3.215562, 1, 1, 1, 1, 1,
1.909789, 1.107335, 0.8945507, 1, 1, 1, 1, 1,
1.911989, 0.7315009, 1.621731, 1, 1, 1, 1, 1,
1.936164, -0.1757105, 2.098359, 1, 1, 1, 1, 1,
1.966762, 1.657047, -1.275123, 1, 1, 1, 1, 1,
1.975132, -0.1218074, 1.424626, 1, 1, 1, 1, 1,
1.984088, 1.432526, 0.2821812, 1, 1, 1, 1, 1,
2.019848, -1.015665, 1.165219, 0, 0, 1, 1, 1,
2.046965, 1.613993, -1.292145, 1, 0, 0, 1, 1,
2.050827, 0.1753224, 0.3334624, 1, 0, 0, 1, 1,
2.053428, -1.501718, 2.000583, 1, 0, 0, 1, 1,
2.061852, 0.1960993, 1.562674, 1, 0, 0, 1, 1,
2.068036, -1.845043, 2.111347, 1, 0, 0, 1, 1,
2.088096, 0.559359, 1.12825, 0, 0, 0, 1, 1,
2.094815, 1.156919, 2.200634, 0, 0, 0, 1, 1,
2.101068, -0.2576556, 1.930752, 0, 0, 0, 1, 1,
2.263519, 0.2801626, 2.012266, 0, 0, 0, 1, 1,
2.285983, -0.8563856, 2.359788, 0, 0, 0, 1, 1,
2.289554, -0.06865567, 1.661496, 0, 0, 0, 1, 1,
2.2986, -0.1167992, 0.7578952, 0, 0, 0, 1, 1,
2.365407, 1.226978, -0.09828984, 1, 1, 1, 1, 1,
2.476121, 0.1914445, 2.741023, 1, 1, 1, 1, 1,
2.55889, -0.8000471, 1.926208, 1, 1, 1, 1, 1,
2.570518, -0.260899, 1.526804, 1, 1, 1, 1, 1,
2.586255, -0.1032044, 1.268481, 1, 1, 1, 1, 1,
2.612713, 0.4379094, 2.181228, 1, 1, 1, 1, 1,
2.665058, -1.077489, 0.4508036, 1, 1, 1, 1, 1
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
var radius = 10.29256;
var distance = 36.15217;
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
mvMatrix.translate( 0.4943627, 0.4097934, -0.1044891 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.15217);
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
