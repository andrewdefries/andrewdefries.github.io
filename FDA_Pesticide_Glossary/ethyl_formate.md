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
-3.535842, 0.3396648, -1.051682, 1, 0, 0, 1,
-3.335857, -0.27422, -2.206577, 1, 0.007843138, 0, 1,
-3.238695, 0.6615583, -1.286817, 1, 0.01176471, 0, 1,
-2.94656, -0.6561031, -3.477994, 1, 0.01960784, 0, 1,
-2.776604, 1.482348, -3.167361, 1, 0.02352941, 0, 1,
-2.763125, 0.4354101, -0.5134826, 1, 0.03137255, 0, 1,
-2.558913, -1.132116, -1.375571, 1, 0.03529412, 0, 1,
-2.452799, 0.7724094, -1.799065, 1, 0.04313726, 0, 1,
-2.399092, 0.1839144, -2.698706, 1, 0.04705882, 0, 1,
-2.196197, 0.4392775, -0.8670706, 1, 0.05490196, 0, 1,
-2.177663, -0.3101742, -2.673094, 1, 0.05882353, 0, 1,
-2.110048, -1.623159, -2.233772, 1, 0.06666667, 0, 1,
-2.109401, -0.5769709, -2.073096, 1, 0.07058824, 0, 1,
-2.004817, -0.560523, -1.748814, 1, 0.07843138, 0, 1,
-1.990097, 1.419961, -1.106085, 1, 0.08235294, 0, 1,
-1.976805, 2.014465, -1.946336, 1, 0.09019608, 0, 1,
-1.97385, 1.045019, 0.4545079, 1, 0.09411765, 0, 1,
-1.960109, 0.300047, -1.585054, 1, 0.1019608, 0, 1,
-1.955804, 0.7768157, -0.5343953, 1, 0.1098039, 0, 1,
-1.954703, 0.7015585, -0.1038313, 1, 0.1137255, 0, 1,
-1.951381, -0.7535784, -1.376543, 1, 0.1215686, 0, 1,
-1.924883, -0.06516354, -0.4990388, 1, 0.1254902, 0, 1,
-1.904663, -1.396159, -0.7719217, 1, 0.1333333, 0, 1,
-1.900467, -1.583829, -1.719056, 1, 0.1372549, 0, 1,
-1.887413, 0.2984823, -1.644547, 1, 0.145098, 0, 1,
-1.878091, -0.6931404, -2.156229, 1, 0.1490196, 0, 1,
-1.870128, -0.1710204, -4.290831, 1, 0.1568628, 0, 1,
-1.857278, 0.5513373, -0.5378223, 1, 0.1607843, 0, 1,
-1.837964, 0.8396172, 0.2998608, 1, 0.1686275, 0, 1,
-1.822511, 0.7270941, -2.636425, 1, 0.172549, 0, 1,
-1.817767, -0.5513766, -4.250978, 1, 0.1803922, 0, 1,
-1.810068, -0.5881736, -0.7650996, 1, 0.1843137, 0, 1,
-1.748843, 0.04314345, -4.34398, 1, 0.1921569, 0, 1,
-1.724785, 0.3143629, -1.335115, 1, 0.1960784, 0, 1,
-1.723008, 2.102002, -1.39165, 1, 0.2039216, 0, 1,
-1.711028, 1.505399, -0.3905016, 1, 0.2117647, 0, 1,
-1.704961, -1.000767, -0.8638816, 1, 0.2156863, 0, 1,
-1.686956, 0.8787208, -0.8773374, 1, 0.2235294, 0, 1,
-1.683995, -0.4698151, -2.611044, 1, 0.227451, 0, 1,
-1.679465, -0.9731459, -1.874014, 1, 0.2352941, 0, 1,
-1.661898, -0.1391439, -1.143393, 1, 0.2392157, 0, 1,
-1.65724, -0.4705395, -2.921345, 1, 0.2470588, 0, 1,
-1.63582, 1.00443, -0.5088199, 1, 0.2509804, 0, 1,
-1.632495, -0.6899526, -2.684792, 1, 0.2588235, 0, 1,
-1.627179, -0.4215273, -0.0001142176, 1, 0.2627451, 0, 1,
-1.610447, 1.543601, -0.9188818, 1, 0.2705882, 0, 1,
-1.604469, 0.284103, -0.280706, 1, 0.2745098, 0, 1,
-1.59624, -0.5828363, -2.532336, 1, 0.282353, 0, 1,
-1.587318, 1.267749, -0.6380727, 1, 0.2862745, 0, 1,
-1.5844, -0.2553284, -2.528403, 1, 0.2941177, 0, 1,
-1.557288, -1.050559, -1.66774, 1, 0.3019608, 0, 1,
-1.550725, 0.6446601, -0.6179327, 1, 0.3058824, 0, 1,
-1.539919, -1.599089, -0.4372848, 1, 0.3137255, 0, 1,
-1.52693, -0.1037771, -2.437017, 1, 0.3176471, 0, 1,
-1.523357, -0.4196179, -1.633997, 1, 0.3254902, 0, 1,
-1.514905, 0.9109581, -1.271641, 1, 0.3294118, 0, 1,
-1.505459, -0.8600606, -1.097441, 1, 0.3372549, 0, 1,
-1.498097, 0.5956163, -0.2166322, 1, 0.3411765, 0, 1,
-1.47253, -1.120014, -2.099821, 1, 0.3490196, 0, 1,
-1.471328, 0.355848, -2.496204, 1, 0.3529412, 0, 1,
-1.470588, 1.178095, -0.641079, 1, 0.3607843, 0, 1,
-1.460822, -0.9737746, -2.598696, 1, 0.3647059, 0, 1,
-1.454082, 0.05796704, -0.8734522, 1, 0.372549, 0, 1,
-1.447371, -0.6443939, -0.5731509, 1, 0.3764706, 0, 1,
-1.444541, -1.226493, -2.869772, 1, 0.3843137, 0, 1,
-1.438358, -0.2174758, -3.498055, 1, 0.3882353, 0, 1,
-1.42451, 0.1317202, -0.06463378, 1, 0.3960784, 0, 1,
-1.423871, -0.2330414, -0.6947034, 1, 0.4039216, 0, 1,
-1.421997, -1.122758, -2.106761, 1, 0.4078431, 0, 1,
-1.414735, -1.03513, -3.049098, 1, 0.4156863, 0, 1,
-1.409715, 1.417631, -0.8077231, 1, 0.4196078, 0, 1,
-1.408402, 0.7365725, -0.5704179, 1, 0.427451, 0, 1,
-1.401447, 0.6312045, -1.645386, 1, 0.4313726, 0, 1,
-1.39264, 0.2827795, -2.98499, 1, 0.4392157, 0, 1,
-1.391925, -0.183552, -1.26722, 1, 0.4431373, 0, 1,
-1.389909, -0.4832574, -1.509995, 1, 0.4509804, 0, 1,
-1.38734, 0.9617086, -2.886545, 1, 0.454902, 0, 1,
-1.375444, -1.926457, -1.974975, 1, 0.4627451, 0, 1,
-1.37237, -2.234013, -3.588905, 1, 0.4666667, 0, 1,
-1.37027, -0.3008341, -2.108395, 1, 0.4745098, 0, 1,
-1.352078, -0.205754, -3.236797, 1, 0.4784314, 0, 1,
-1.340506, -1.213932, -3.78041, 1, 0.4862745, 0, 1,
-1.33026, 0.646602, -0.7565365, 1, 0.4901961, 0, 1,
-1.324589, -0.7348755, -2.151562, 1, 0.4980392, 0, 1,
-1.322217, 0.2005963, -1.670818, 1, 0.5058824, 0, 1,
-1.314541, 0.6093129, 0.5502941, 1, 0.509804, 0, 1,
-1.306422, -0.125629, -0.8620278, 1, 0.5176471, 0, 1,
-1.306214, -1.310604, -3.388438, 1, 0.5215687, 0, 1,
-1.302078, -2.183123, -1.973585, 1, 0.5294118, 0, 1,
-1.299765, 0.09225137, -0.9952489, 1, 0.5333334, 0, 1,
-1.299649, 1.977479, 1.715917, 1, 0.5411765, 0, 1,
-1.2843, 1.551791, -0.9805276, 1, 0.5450981, 0, 1,
-1.261417, 0.8286972, -2.174073, 1, 0.5529412, 0, 1,
-1.259532, -1.325564, -3.496542, 1, 0.5568628, 0, 1,
-1.258139, -0.8080376, -2.836825, 1, 0.5647059, 0, 1,
-1.256519, -1.816868, -0.6622369, 1, 0.5686275, 0, 1,
-1.252677, -0.4393677, -2.064893, 1, 0.5764706, 0, 1,
-1.244644, 1.609434, -0.4715453, 1, 0.5803922, 0, 1,
-1.236741, 0.2454248, -1.978554, 1, 0.5882353, 0, 1,
-1.236115, -0.8104951, -2.521312, 1, 0.5921569, 0, 1,
-1.233484, -0.2380518, -0.8608632, 1, 0.6, 0, 1,
-1.227896, -0.3113656, -3.231702, 1, 0.6078432, 0, 1,
-1.203586, 1.081272, -2.224978, 1, 0.6117647, 0, 1,
-1.188921, 0.645825, -0.06379527, 1, 0.6196079, 0, 1,
-1.184077, 1.365486, -1.176611, 1, 0.6235294, 0, 1,
-1.183911, -1.371696, -3.851052, 1, 0.6313726, 0, 1,
-1.181365, -0.7016949, -2.747973, 1, 0.6352941, 0, 1,
-1.168069, -1.180541, -0.8880193, 1, 0.6431373, 0, 1,
-1.161152, 0.9162208, -1.337471, 1, 0.6470588, 0, 1,
-1.161045, 0.6022084, -0.3238976, 1, 0.654902, 0, 1,
-1.160293, -2.269113, -1.49818, 1, 0.6588235, 0, 1,
-1.150737, 0.0404567, -1.929621, 1, 0.6666667, 0, 1,
-1.15028, 0.3520668, -2.054908, 1, 0.6705883, 0, 1,
-1.146725, -1.32611, -3.538548, 1, 0.6784314, 0, 1,
-1.141173, 0.4887784, -1.511373, 1, 0.682353, 0, 1,
-1.134534, -0.3959205, -2.209155, 1, 0.6901961, 0, 1,
-1.131594, 0.50533, -2.015047, 1, 0.6941177, 0, 1,
-1.128925, 1.126603, 0.170078, 1, 0.7019608, 0, 1,
-1.12875, -0.5589172, -3.063404, 1, 0.7098039, 0, 1,
-1.123381, 0.06756297, -2.76328, 1, 0.7137255, 0, 1,
-1.113569, 1.347836, -1.66999, 1, 0.7215686, 0, 1,
-1.111874, 0.4354304, -1.782169, 1, 0.7254902, 0, 1,
-1.110832, -0.917035, -3.609804, 1, 0.7333333, 0, 1,
-1.101674, 0.2162361, -1.051322, 1, 0.7372549, 0, 1,
-1.093556, -0.5838764, -2.288053, 1, 0.7450981, 0, 1,
-1.09017, -0.4826182, -0.1800821, 1, 0.7490196, 0, 1,
-1.084412, -1.782075, -1.923185, 1, 0.7568628, 0, 1,
-1.077976, -0.9302585, -3.315422, 1, 0.7607843, 0, 1,
-1.075491, -0.1040962, -1.103191, 1, 0.7686275, 0, 1,
-1.065902, -0.3284318, -1.196176, 1, 0.772549, 0, 1,
-1.065562, 0.6473985, -1.692611, 1, 0.7803922, 0, 1,
-1.062483, 0.7379553, -0.5228775, 1, 0.7843137, 0, 1,
-1.055219, -0.02965629, -0.8493066, 1, 0.7921569, 0, 1,
-1.052264, -1.350436, -1.263837, 1, 0.7960784, 0, 1,
-1.05003, -0.5244896, -3.136249, 1, 0.8039216, 0, 1,
-1.03085, -1.204224, -2.209079, 1, 0.8117647, 0, 1,
-1.019855, -0.02863641, -1.347112, 1, 0.8156863, 0, 1,
-1.016543, 0.8341633, 0.6768723, 1, 0.8235294, 0, 1,
-1.015526, -0.4380397, -1.664272, 1, 0.827451, 0, 1,
-1.015093, 1.104859, 0.1429507, 1, 0.8352941, 0, 1,
-1.013032, 0.5557705, 0.01294759, 1, 0.8392157, 0, 1,
-1.012734, -0.124967, -1.380742, 1, 0.8470588, 0, 1,
-0.9965982, -0.2092933, -0.3666475, 1, 0.8509804, 0, 1,
-0.9957182, 1.057298, -0.08662743, 1, 0.8588235, 0, 1,
-0.9930224, 0.7506692, -2.610071, 1, 0.8627451, 0, 1,
-0.9904781, -0.9081919, -2.401459, 1, 0.8705882, 0, 1,
-0.9899987, 1.202902, -0.00816505, 1, 0.8745098, 0, 1,
-0.9883195, -0.9704244, -2.487261, 1, 0.8823529, 0, 1,
-0.9860726, 2.075481, -0.003308382, 1, 0.8862745, 0, 1,
-0.9839447, -1.476756, -1.69892, 1, 0.8941177, 0, 1,
-0.9800877, 0.8596834, -0.9208651, 1, 0.8980392, 0, 1,
-0.979885, 0.9122035, 0.8524751, 1, 0.9058824, 0, 1,
-0.9765083, 0.5065244, 0.3895285, 1, 0.9137255, 0, 1,
-0.9744658, 0.6117324, -1.200663, 1, 0.9176471, 0, 1,
-0.9702763, 2.674462, 0.7033187, 1, 0.9254902, 0, 1,
-0.9633192, -0.3615109, -3.442633, 1, 0.9294118, 0, 1,
-0.9569713, 2.103721, -1.29361, 1, 0.9372549, 0, 1,
-0.9540938, -1.235788, -2.748312, 1, 0.9411765, 0, 1,
-0.9505944, -0.176535, -1.484045, 1, 0.9490196, 0, 1,
-0.9464602, 1.382504, -2.063794, 1, 0.9529412, 0, 1,
-0.9430853, -0.524706, -2.692447, 1, 0.9607843, 0, 1,
-0.9430721, -0.466473, -1.413574, 1, 0.9647059, 0, 1,
-0.9420255, -0.0480903, -1.201398, 1, 0.972549, 0, 1,
-0.939474, -3.162594, -3.388259, 1, 0.9764706, 0, 1,
-0.938651, -0.6384422, -2.379558, 1, 0.9843137, 0, 1,
-0.9361784, -0.3889814, -2.518979, 1, 0.9882353, 0, 1,
-0.9360055, 1.425034, -0.2983898, 1, 0.9960784, 0, 1,
-0.935451, -0.1318276, -3.08716, 0.9960784, 1, 0, 1,
-0.9333059, -0.684469, -2.380374, 0.9921569, 1, 0, 1,
-0.9297319, 0.1713831, -1.853003, 0.9843137, 1, 0, 1,
-0.9293752, -0.3124936, -2.362062, 0.9803922, 1, 0, 1,
-0.9282491, -1.461774, -0.912989, 0.972549, 1, 0, 1,
-0.9270191, 0.02349666, -1.911356, 0.9686275, 1, 0, 1,
-0.9260684, 1.19556, -0.9578567, 0.9607843, 1, 0, 1,
-0.9234298, 0.2963929, -0.8966978, 0.9568627, 1, 0, 1,
-0.9214772, -1.601069, -2.926746, 0.9490196, 1, 0, 1,
-0.9169855, -0.4323545, -0.85077, 0.945098, 1, 0, 1,
-0.9151407, -1.357157, -4.353071, 0.9372549, 1, 0, 1,
-0.9056051, -0.6626729, -1.738469, 0.9333333, 1, 0, 1,
-0.9012485, -0.75553, -0.3383864, 0.9254902, 1, 0, 1,
-0.8974437, 0.3389421, -1.18406, 0.9215686, 1, 0, 1,
-0.8960644, 1.825594, 0.0494526, 0.9137255, 1, 0, 1,
-0.8912393, 0.9387243, -0.2975705, 0.9098039, 1, 0, 1,
-0.8899209, 1.063468, 1.228683, 0.9019608, 1, 0, 1,
-0.8858313, 0.09403652, -2.021366, 0.8941177, 1, 0, 1,
-0.8824456, -0.2104191, -1.304759, 0.8901961, 1, 0, 1,
-0.8817145, 0.7519841, -1.236374, 0.8823529, 1, 0, 1,
-0.8808782, -0.292982, -0.962162, 0.8784314, 1, 0, 1,
-0.8782008, -0.4936194, -1.759705, 0.8705882, 1, 0, 1,
-0.8684845, -0.155951, -1.462997, 0.8666667, 1, 0, 1,
-0.8642576, -0.1170802, -0.9888461, 0.8588235, 1, 0, 1,
-0.8628536, 0.1223932, -0.9432074, 0.854902, 1, 0, 1,
-0.8562238, 0.2913836, -1.401399, 0.8470588, 1, 0, 1,
-0.856141, -0.8765479, -2.222003, 0.8431373, 1, 0, 1,
-0.8538603, -1.361312, -3.413035, 0.8352941, 1, 0, 1,
-0.8527215, -1.010605, -3.283525, 0.8313726, 1, 0, 1,
-0.8515716, 0.6550947, -0.1825915, 0.8235294, 1, 0, 1,
-0.8480065, -0.6038802, -2.404038, 0.8196079, 1, 0, 1,
-0.8420789, 0.1861296, -1.533014, 0.8117647, 1, 0, 1,
-0.8408905, 1.511393, -1.120807, 0.8078431, 1, 0, 1,
-0.8340133, 0.3494325, -2.238278, 0.8, 1, 0, 1,
-0.8330108, -0.3568221, -1.946083, 0.7921569, 1, 0, 1,
-0.8327366, 0.5815145, -0.6706022, 0.7882353, 1, 0, 1,
-0.8322623, 1.960692, -0.8549945, 0.7803922, 1, 0, 1,
-0.8311065, 0.02326629, -1.250846, 0.7764706, 1, 0, 1,
-0.8295633, 0.143629, -1.73686, 0.7686275, 1, 0, 1,
-0.8274353, -0.5841099, -1.543821, 0.7647059, 1, 0, 1,
-0.8230767, 1.904538, 0.6227794, 0.7568628, 1, 0, 1,
-0.8179204, -0.5562639, -0.5561511, 0.7529412, 1, 0, 1,
-0.8163607, -1.109237, -3.442548, 0.7450981, 1, 0, 1,
-0.814015, 0.2672022, -3.635875, 0.7411765, 1, 0, 1,
-0.8118759, 0.66618, -0.8858467, 0.7333333, 1, 0, 1,
-0.8076152, -0.2347978, -1.727536, 0.7294118, 1, 0, 1,
-0.8071887, 0.3664008, -2.193702, 0.7215686, 1, 0, 1,
-0.8036761, -1.186622, -3.181173, 0.7176471, 1, 0, 1,
-0.8003579, 0.1544619, -1.369404, 0.7098039, 1, 0, 1,
-0.8000225, -0.1226379, -2.201121, 0.7058824, 1, 0, 1,
-0.7937201, -1.017431, -3.628057, 0.6980392, 1, 0, 1,
-0.7927898, 0.8704823, -0.7720013, 0.6901961, 1, 0, 1,
-0.7918012, -0.3404835, -0.3566888, 0.6862745, 1, 0, 1,
-0.7900544, 0.5225285, -1.574587, 0.6784314, 1, 0, 1,
-0.7891924, -1.175482, -2.12816, 0.6745098, 1, 0, 1,
-0.7828858, 0.8099549, -0.07430992, 0.6666667, 1, 0, 1,
-0.7818501, 0.5094869, 1.305132, 0.6627451, 1, 0, 1,
-0.7798637, -0.3874853, -2.236623, 0.654902, 1, 0, 1,
-0.7776118, -1.158392, -3.518453, 0.6509804, 1, 0, 1,
-0.7735285, -0.2358535, -1.889625, 0.6431373, 1, 0, 1,
-0.7733275, -0.9385023, -2.445546, 0.6392157, 1, 0, 1,
-0.7608284, 0.9464737, -2.370083, 0.6313726, 1, 0, 1,
-0.7602594, 1.218235, -0.3711731, 0.627451, 1, 0, 1,
-0.7563425, 0.1945162, -0.9209199, 0.6196079, 1, 0, 1,
-0.7542145, -0.4886996, -1.930328, 0.6156863, 1, 0, 1,
-0.7490894, 0.3123136, -0.9120935, 0.6078432, 1, 0, 1,
-0.7440287, 1.243541, -0.5455486, 0.6039216, 1, 0, 1,
-0.7439203, -1.013554, -4.850413, 0.5960785, 1, 0, 1,
-0.7419246, 1.006695, -0.09787153, 0.5882353, 1, 0, 1,
-0.734561, 0.3262381, -3.416432, 0.5843138, 1, 0, 1,
-0.7341009, 0.2222266, -0.7741466, 0.5764706, 1, 0, 1,
-0.7322648, -0.6069543, -4.14884, 0.572549, 1, 0, 1,
-0.7295452, 0.7582765, -0.2224319, 0.5647059, 1, 0, 1,
-0.7290807, -0.530217, -3.033806, 0.5607843, 1, 0, 1,
-0.7271383, 0.83446, -2.192148, 0.5529412, 1, 0, 1,
-0.7265342, -0.3878021, 0.9179782, 0.5490196, 1, 0, 1,
-0.7249405, 0.1913939, -0.463052, 0.5411765, 1, 0, 1,
-0.724337, -3.116173, -2.142045, 0.5372549, 1, 0, 1,
-0.7210969, 0.4034776, -0.6651189, 0.5294118, 1, 0, 1,
-0.7194189, 0.06341645, -1.054627, 0.5254902, 1, 0, 1,
-0.7010916, 0.6213522, -2.076197, 0.5176471, 1, 0, 1,
-0.6930022, 0.1210392, -0.9558927, 0.5137255, 1, 0, 1,
-0.6896226, -0.8892062, -1.539902, 0.5058824, 1, 0, 1,
-0.6891922, -2.100116, -0.4460821, 0.5019608, 1, 0, 1,
-0.688015, 0.1908818, -1.121115, 0.4941176, 1, 0, 1,
-0.685745, -0.3101039, -0.5398045, 0.4862745, 1, 0, 1,
-0.6777521, 0.3023411, -1.151736, 0.4823529, 1, 0, 1,
-0.6728714, -0.5857062, -1.582197, 0.4745098, 1, 0, 1,
-0.6658038, 0.4706017, -2.843185, 0.4705882, 1, 0, 1,
-0.6655164, -0.4692801, -1.528923, 0.4627451, 1, 0, 1,
-0.6632476, -1.568701, -1.987725, 0.4588235, 1, 0, 1,
-0.6626876, -2.105593, -3.912138, 0.4509804, 1, 0, 1,
-0.6621111, -0.2240346, -2.257909, 0.4470588, 1, 0, 1,
-0.6602439, -0.1303481, -1.197104, 0.4392157, 1, 0, 1,
-0.6602078, 0.07086755, -3.295732, 0.4352941, 1, 0, 1,
-0.6549674, 0.7257294, -0.2931863, 0.427451, 1, 0, 1,
-0.6530278, 1.09767, -1.878779, 0.4235294, 1, 0, 1,
-0.649206, 0.7120612, 0.2764397, 0.4156863, 1, 0, 1,
-0.6478907, -0.8714523, -1.246132, 0.4117647, 1, 0, 1,
-0.6468325, -0.44137, -2.750558, 0.4039216, 1, 0, 1,
-0.6411327, -0.4207156, -2.436163, 0.3960784, 1, 0, 1,
-0.6404276, -0.8066, -1.752563, 0.3921569, 1, 0, 1,
-0.6361409, 0.7488595, -0.5026283, 0.3843137, 1, 0, 1,
-0.6351233, 4.315596, -1.085631, 0.3803922, 1, 0, 1,
-0.632718, 0.0877988, -0.6519726, 0.372549, 1, 0, 1,
-0.6246721, 1.353655, -0.7060783, 0.3686275, 1, 0, 1,
-0.6232872, 0.1182773, -1.847404, 0.3607843, 1, 0, 1,
-0.6219776, 0.4253659, -2.565799, 0.3568628, 1, 0, 1,
-0.6209685, -0.6486406, -2.973192, 0.3490196, 1, 0, 1,
-0.6177579, 1.872782, 0.0001337463, 0.345098, 1, 0, 1,
-0.6168167, 0.7153298, -0.1065135, 0.3372549, 1, 0, 1,
-0.611562, 1.686028, -0.2731408, 0.3333333, 1, 0, 1,
-0.6092692, -0.7035187, -2.40342, 0.3254902, 1, 0, 1,
-0.6060974, 1.02991, -0.471284, 0.3215686, 1, 0, 1,
-0.6046661, 0.1838171, -1.03474, 0.3137255, 1, 0, 1,
-0.6036266, -0.4131417, -2.399964, 0.3098039, 1, 0, 1,
-0.6034933, 0.1928508, -1.445596, 0.3019608, 1, 0, 1,
-0.6010666, 0.5118819, -2.543667, 0.2941177, 1, 0, 1,
-0.5977999, -1.057544, -2.572685, 0.2901961, 1, 0, 1,
-0.5975634, -0.09328527, -1.532263, 0.282353, 1, 0, 1,
-0.5950977, -0.1233973, -0.5217031, 0.2784314, 1, 0, 1,
-0.5921586, -1.490744, -4.554929, 0.2705882, 1, 0, 1,
-0.5895765, -0.367926, -3.775121, 0.2666667, 1, 0, 1,
-0.5865583, -0.5114736, -1.721565, 0.2588235, 1, 0, 1,
-0.583603, 0.7429343, -2.219052, 0.254902, 1, 0, 1,
-0.5769464, 0.7049906, -0.3540902, 0.2470588, 1, 0, 1,
-0.5747517, 0.3667574, -0.5320599, 0.2431373, 1, 0, 1,
-0.569465, -0.08188356, -0.9675124, 0.2352941, 1, 0, 1,
-0.5642908, 2.113961, -0.1288349, 0.2313726, 1, 0, 1,
-0.5626891, 0.3557853, -0.6627576, 0.2235294, 1, 0, 1,
-0.5536276, 2.287319, -0.3157407, 0.2196078, 1, 0, 1,
-0.553417, -1.00543, -2.944999, 0.2117647, 1, 0, 1,
-0.5523015, 1.560434, 0.8353198, 0.2078431, 1, 0, 1,
-0.5517699, 0.3178179, -1.136211, 0.2, 1, 0, 1,
-0.55044, -1.945336, -3.977783, 0.1921569, 1, 0, 1,
-0.5490609, -1.217925, 0.2292866, 0.1882353, 1, 0, 1,
-0.5489559, -0.08136126, -1.188596, 0.1803922, 1, 0, 1,
-0.5479254, -0.6726868, -0.8329799, 0.1764706, 1, 0, 1,
-0.5424896, 1.072217, -0.8686286, 0.1686275, 1, 0, 1,
-0.537955, 1.570656, 0.1787905, 0.1647059, 1, 0, 1,
-0.5318664, 0.3513428, -1.706827, 0.1568628, 1, 0, 1,
-0.5317144, 0.1597698, -1.973145, 0.1529412, 1, 0, 1,
-0.5316781, -0.7032206, -1.317838, 0.145098, 1, 0, 1,
-0.531489, -0.2107506, -1.807913, 0.1411765, 1, 0, 1,
-0.5294856, 0.03662355, -2.48655, 0.1333333, 1, 0, 1,
-0.5287339, 1.422633, -0.645749, 0.1294118, 1, 0, 1,
-0.5281663, 0.8727202, -0.7515728, 0.1215686, 1, 0, 1,
-0.5213661, -1.504291, -4.149742, 0.1176471, 1, 0, 1,
-0.5187582, -0.4674149, -4.17172, 0.1098039, 1, 0, 1,
-0.5176789, 0.4466194, -1.283241, 0.1058824, 1, 0, 1,
-0.5148714, 0.3715908, -0.937595, 0.09803922, 1, 0, 1,
-0.513811, -0.493203, -3.616149, 0.09019608, 1, 0, 1,
-0.5071236, 1.179056, 0.03878573, 0.08627451, 1, 0, 1,
-0.5056449, 2.18148, 0.3347941, 0.07843138, 1, 0, 1,
-0.5052673, -0.4703847, -1.875801, 0.07450981, 1, 0, 1,
-0.5044538, -1.048797, -2.405468, 0.06666667, 1, 0, 1,
-0.5027505, -0.629536, -1.915412, 0.0627451, 1, 0, 1,
-0.5009472, -0.1363549, -2.111099, 0.05490196, 1, 0, 1,
-0.5006891, -0.07608906, -1.066812, 0.05098039, 1, 0, 1,
-0.4929946, -0.3117893, -3.240531, 0.04313726, 1, 0, 1,
-0.4916714, 1.048791, 0.6566464, 0.03921569, 1, 0, 1,
-0.4897889, -2.227072, -3.347059, 0.03137255, 1, 0, 1,
-0.4858948, 0.8506109, -2.042238, 0.02745098, 1, 0, 1,
-0.4857901, -1.575034, -3.603128, 0.01960784, 1, 0, 1,
-0.4854113, -0.8723496, -2.360194, 0.01568628, 1, 0, 1,
-0.4847174, -1.626923, -1.903297, 0.007843138, 1, 0, 1,
-0.4794954, 0.4080763, -0.832358, 0.003921569, 1, 0, 1,
-0.4761286, -0.835005, -2.874469, 0, 1, 0.003921569, 1,
-0.4755432, -0.02005981, -1.530013, 0, 1, 0.01176471, 1,
-0.4723481, -0.4729731, 0.8881922, 0, 1, 0.01568628, 1,
-0.4714574, -0.3482905, -2.411599, 0, 1, 0.02352941, 1,
-0.4701878, 0.4401015, -0.6430798, 0, 1, 0.02745098, 1,
-0.4685298, 0.9393783, -1.054214, 0, 1, 0.03529412, 1,
-0.465988, -1.223525, -2.403051, 0, 1, 0.03921569, 1,
-0.4656449, 0.3042478, -1.780485, 0, 1, 0.04705882, 1,
-0.4633452, -0.2023268, -1.938983, 0, 1, 0.05098039, 1,
-0.4616353, -0.1686351, -1.201909, 0, 1, 0.05882353, 1,
-0.457559, -0.412607, -2.551939, 0, 1, 0.0627451, 1,
-0.4548228, 0.1892522, -2.640531, 0, 1, 0.07058824, 1,
-0.4537178, 0.2970976, -0.6947075, 0, 1, 0.07450981, 1,
-0.4535452, 0.2979477, -1.422683, 0, 1, 0.08235294, 1,
-0.4528067, 0.5066911, -0.3247601, 0, 1, 0.08627451, 1,
-0.4465386, 0.3058342, -0.9851037, 0, 1, 0.09411765, 1,
-0.4429424, -1.663105, -1.616319, 0, 1, 0.1019608, 1,
-0.439138, -0.4469842, -3.845916, 0, 1, 0.1058824, 1,
-0.4347296, -0.2517517, -1.855908, 0, 1, 0.1137255, 1,
-0.4331148, -2.218119, -3.430349, 0, 1, 0.1176471, 1,
-0.4327433, -0.04391855, 0.1131717, 0, 1, 0.1254902, 1,
-0.4325834, 0.3206272, -1.781331, 0, 1, 0.1294118, 1,
-0.4322133, 0.6792137, -1.697661, 0, 1, 0.1372549, 1,
-0.4217245, 0.593432, -2.001521, 0, 1, 0.1411765, 1,
-0.4216223, -0.04944241, -0.8719494, 0, 1, 0.1490196, 1,
-0.415162, 1.633766, 0.7512553, 0, 1, 0.1529412, 1,
-0.4110322, -0.2682999, -3.57741, 0, 1, 0.1607843, 1,
-0.4086401, 0.7912392, -0.4589497, 0, 1, 0.1647059, 1,
-0.4049672, 0.5830966, -2.746333, 0, 1, 0.172549, 1,
-0.3936583, -2.370425, -2.858024, 0, 1, 0.1764706, 1,
-0.3931224, 0.2553471, -0.9476198, 0, 1, 0.1843137, 1,
-0.3914425, 2.511815, -1.099422, 0, 1, 0.1882353, 1,
-0.3907589, 0.1825197, 0.2896038, 0, 1, 0.1960784, 1,
-0.3895959, 0.3044277, -0.8893422, 0, 1, 0.2039216, 1,
-0.3857588, 0.7156736, -1.706838, 0, 1, 0.2078431, 1,
-0.3857052, -1.100551, -1.056649, 0, 1, 0.2156863, 1,
-0.3851396, 1.692303, -1.34538, 0, 1, 0.2196078, 1,
-0.3842506, 0.3531831, -1.078963, 0, 1, 0.227451, 1,
-0.3772523, -0.4229428, -2.120929, 0, 1, 0.2313726, 1,
-0.3759383, 1.138181, 0.006488082, 0, 1, 0.2392157, 1,
-0.3722932, -1.186845, -3.068566, 0, 1, 0.2431373, 1,
-0.3713195, 0.1660965, -2.083579, 0, 1, 0.2509804, 1,
-0.3704812, -0.2911467, -1.715289, 0, 1, 0.254902, 1,
-0.3704438, -0.8605983, -2.83728, 0, 1, 0.2627451, 1,
-0.3646483, -0.6781424, -1.423393, 0, 1, 0.2666667, 1,
-0.3627827, -1.168029, -2.653884, 0, 1, 0.2745098, 1,
-0.3603764, 0.7738271, 0.2283748, 0, 1, 0.2784314, 1,
-0.358347, -0.6998199, -3.464462, 0, 1, 0.2862745, 1,
-0.356079, -0.5383474, -2.647264, 0, 1, 0.2901961, 1,
-0.3529589, -0.4797019, -3.550313, 0, 1, 0.2980392, 1,
-0.3484588, -0.6238229, -1.784205, 0, 1, 0.3058824, 1,
-0.3480654, 1.283183, 0.04985192, 0, 1, 0.3098039, 1,
-0.343846, 0.5697482, -1.376127, 0, 1, 0.3176471, 1,
-0.3413717, 1.578482, -0.07782616, 0, 1, 0.3215686, 1,
-0.3326175, 1.394871, -1.171054, 0, 1, 0.3294118, 1,
-0.3321593, -0.133546, -1.834009, 0, 1, 0.3333333, 1,
-0.3305176, 0.1076398, -2.532497, 0, 1, 0.3411765, 1,
-0.3293454, 0.339091, 0.2798563, 0, 1, 0.345098, 1,
-0.3283896, -0.7758875, -2.313612, 0, 1, 0.3529412, 1,
-0.3264542, -0.2108326, -2.888092, 0, 1, 0.3568628, 1,
-0.3237352, 1.288109, -1.133353, 0, 1, 0.3647059, 1,
-0.3226601, 0.5388224, -0.3258355, 0, 1, 0.3686275, 1,
-0.3214303, -0.7150319, -2.029698, 0, 1, 0.3764706, 1,
-0.3200041, -2.230834, -4.18693, 0, 1, 0.3803922, 1,
-0.3197122, -1.423678, -1.670966, 0, 1, 0.3882353, 1,
-0.3187132, 0.1736775, 2.595685, 0, 1, 0.3921569, 1,
-0.3130185, -0.2226802, -2.384081, 0, 1, 0.4, 1,
-0.3096345, 0.00630511, 0.2964326, 0, 1, 0.4078431, 1,
-0.309393, 1.251828, -1.22263, 0, 1, 0.4117647, 1,
-0.3049096, 0.8985991, -0.4983386, 0, 1, 0.4196078, 1,
-0.3039264, 0.5022976, 0.4568683, 0, 1, 0.4235294, 1,
-0.3028624, 0.9831535, -2.033077, 0, 1, 0.4313726, 1,
-0.3003729, -0.6833457, -3.556219, 0, 1, 0.4352941, 1,
-0.2995749, -0.4931982, -0.4150092, 0, 1, 0.4431373, 1,
-0.2979938, 2.454447, 0.2118511, 0, 1, 0.4470588, 1,
-0.2973537, -0.3147941, -1.810018, 0, 1, 0.454902, 1,
-0.2844918, 0.3466929, -0.2227677, 0, 1, 0.4588235, 1,
-0.2783508, 1.202728, -0.1586306, 0, 1, 0.4666667, 1,
-0.2770249, 0.3902085, 0.9075906, 0, 1, 0.4705882, 1,
-0.2750692, -0.5252379, -3.061937, 0, 1, 0.4784314, 1,
-0.2731182, -1.699841, -2.784246, 0, 1, 0.4823529, 1,
-0.2658141, 0.3214467, -1.13111, 0, 1, 0.4901961, 1,
-0.2601081, 0.1117346, -0.5052196, 0, 1, 0.4941176, 1,
-0.2560994, -0.9995186, -1.281486, 0, 1, 0.5019608, 1,
-0.2552773, -0.7845287, -2.03579, 0, 1, 0.509804, 1,
-0.254337, -0.6382905, -3.146179, 0, 1, 0.5137255, 1,
-0.2520543, -1.636231, -4.330164, 0, 1, 0.5215687, 1,
-0.2515694, 0.216984, -1.099112, 0, 1, 0.5254902, 1,
-0.249857, 0.0901105, -0.6533336, 0, 1, 0.5333334, 1,
-0.2487809, -0.2264275, -1.704055, 0, 1, 0.5372549, 1,
-0.2428737, -1.178951, -3.952042, 0, 1, 0.5450981, 1,
-0.2420239, 0.7153098, 0.2408935, 0, 1, 0.5490196, 1,
-0.2420053, -1.530424, -2.859397, 0, 1, 0.5568628, 1,
-0.240905, -0.1642686, -3.581502, 0, 1, 0.5607843, 1,
-0.2381323, 0.4289332, -0.1331981, 0, 1, 0.5686275, 1,
-0.2302247, 0.3089805, -0.925341, 0, 1, 0.572549, 1,
-0.2281257, -0.9813116, -3.41576, 0, 1, 0.5803922, 1,
-0.2230249, -0.2150903, -0.3789773, 0, 1, 0.5843138, 1,
-0.2220584, -0.4943549, -3.806755, 0, 1, 0.5921569, 1,
-0.2191272, 1.300222, -0.8875463, 0, 1, 0.5960785, 1,
-0.2145386, 0.5079894, -1.597576, 0, 1, 0.6039216, 1,
-0.2142429, 0.1620165, -0.004333382, 0, 1, 0.6117647, 1,
-0.2132059, -1.378594, -3.388817, 0, 1, 0.6156863, 1,
-0.2123349, 1.222695, -0.1236551, 0, 1, 0.6235294, 1,
-0.206414, 2.071256, 0.1965441, 0, 1, 0.627451, 1,
-0.2048211, 0.4715021, -1.112628, 0, 1, 0.6352941, 1,
-0.2032079, 0.8178972, 0.118305, 0, 1, 0.6392157, 1,
-0.2027399, 0.3435232, -0.2932775, 0, 1, 0.6470588, 1,
-0.2012358, -0.8505402, -4.610303, 0, 1, 0.6509804, 1,
-0.1998152, -0.3442125, -1.215301, 0, 1, 0.6588235, 1,
-0.1975789, 1.295454, 0.4800114, 0, 1, 0.6627451, 1,
-0.1943288, 0.5575323, -0.0165964, 0, 1, 0.6705883, 1,
-0.1862876, -0.530765, -1.465961, 0, 1, 0.6745098, 1,
-0.1845781, -2.118176, -2.426305, 0, 1, 0.682353, 1,
-0.1840682, 0.3683553, -1.122947, 0, 1, 0.6862745, 1,
-0.1789071, 1.301394, -1.145179, 0, 1, 0.6941177, 1,
-0.178669, 0.7753823, -1.540285, 0, 1, 0.7019608, 1,
-0.1746731, -0.4365794, -1.632372, 0, 1, 0.7058824, 1,
-0.1742555, -0.196691, -3.259425, 0, 1, 0.7137255, 1,
-0.1733606, -1.433659, -2.578434, 0, 1, 0.7176471, 1,
-0.1622227, 0.1452878, -1.428941, 0, 1, 0.7254902, 1,
-0.1604017, 2.088598, -0.1342407, 0, 1, 0.7294118, 1,
-0.1603541, 0.8721119, -0.5702009, 0, 1, 0.7372549, 1,
-0.1601423, -0.6901214, -3.73117, 0, 1, 0.7411765, 1,
-0.14988, -0.3993917, -3.667579, 0, 1, 0.7490196, 1,
-0.148435, -0.1585123, -1.648984, 0, 1, 0.7529412, 1,
-0.1438885, 2.759434, -3.655914, 0, 1, 0.7607843, 1,
-0.1420372, -0.9503728, -2.444262, 0, 1, 0.7647059, 1,
-0.1387987, 1.737529, -0.4905376, 0, 1, 0.772549, 1,
-0.1387803, 1.49236, 0.1777876, 0, 1, 0.7764706, 1,
-0.1344231, -0.50361, -2.587203, 0, 1, 0.7843137, 1,
-0.1341841, 0.06367104, -1.799006, 0, 1, 0.7882353, 1,
-0.130549, 0.8574228, -0.4294061, 0, 1, 0.7960784, 1,
-0.1295733, 1.981728, -0.2402363, 0, 1, 0.8039216, 1,
-0.1264663, -0.9151924, -3.705088, 0, 1, 0.8078431, 1,
-0.1259217, 0.3601676, 0.9186176, 0, 1, 0.8156863, 1,
-0.125689, 0.5120016, -2.004115, 0, 1, 0.8196079, 1,
-0.1233505, 0.2741734, -2.254729, 0, 1, 0.827451, 1,
-0.1226193, 0.6847381, -0.00958903, 0, 1, 0.8313726, 1,
-0.1220209, -0.6688957, -2.124336, 0, 1, 0.8392157, 1,
-0.1213153, -2.726457, -4.753636, 0, 1, 0.8431373, 1,
-0.1205929, 0.8342053, -1.995609, 0, 1, 0.8509804, 1,
-0.1201268, -0.6107401, -2.718405, 0, 1, 0.854902, 1,
-0.1191164, 2.201826, -0.6000782, 0, 1, 0.8627451, 1,
-0.1174614, 0.04788376, -0.6410999, 0, 1, 0.8666667, 1,
-0.1141288, 0.2040254, -2.011749, 0, 1, 0.8745098, 1,
-0.1121621, 0.1310127, -0.01442568, 0, 1, 0.8784314, 1,
-0.1113496, -0.9127157, -4.237611, 0, 1, 0.8862745, 1,
-0.1026845, 0.5357522, -1.090803, 0, 1, 0.8901961, 1,
-0.09984317, 1.769844, -0.4925017, 0, 1, 0.8980392, 1,
-0.09902469, 0.188692, 0.905091, 0, 1, 0.9058824, 1,
-0.09836765, 0.1183124, -1.62833, 0, 1, 0.9098039, 1,
-0.09384728, 1.167582, 1.613315, 0, 1, 0.9176471, 1,
-0.09325016, -1.323016, -3.391079, 0, 1, 0.9215686, 1,
-0.09297468, 0.5335837, -1.214254, 0, 1, 0.9294118, 1,
-0.0927365, -0.2393402, -2.11947, 0, 1, 0.9333333, 1,
-0.09070677, -1.097515, -3.687622, 0, 1, 0.9411765, 1,
-0.09022527, 0.8427988, -0.9156907, 0, 1, 0.945098, 1,
-0.08176041, 0.903387, -0.04578081, 0, 1, 0.9529412, 1,
-0.080288, -0.6767281, -2.34525, 0, 1, 0.9568627, 1,
-0.07940546, 2.404353, 0.006787199, 0, 1, 0.9647059, 1,
-0.07686862, 1.094505, -1.289709, 0, 1, 0.9686275, 1,
-0.07534634, 1.202031, 0.03114076, 0, 1, 0.9764706, 1,
-0.0744782, 0.02981624, -3.336092, 0, 1, 0.9803922, 1,
-0.07047179, 0.01453686, -0.9120135, 0, 1, 0.9882353, 1,
-0.06833487, -0.0675395, -2.775935, 0, 1, 0.9921569, 1,
-0.06728026, 0.4696676, 0.9049673, 0, 1, 1, 1,
-0.06664386, 0.658337, -0.3254406, 0, 0.9921569, 1, 1,
-0.06505959, -0.3781934, -4.609315, 0, 0.9882353, 1, 1,
-0.06349672, -0.4251251, -2.210407, 0, 0.9803922, 1, 1,
-0.06122072, -0.7234266, -2.941237, 0, 0.9764706, 1, 1,
-0.05949613, 0.10238, -1.716246, 0, 0.9686275, 1, 1,
-0.05472263, 0.9216379, -0.3111765, 0, 0.9647059, 1, 1,
-0.05200365, 1.657279, 0.5379062, 0, 0.9568627, 1, 1,
-0.05182146, 0.7629559, 1.043509, 0, 0.9529412, 1, 1,
-0.04858478, 0.4175457, -1.815895, 0, 0.945098, 1, 1,
-0.04844169, 0.5631481, -2.191762, 0, 0.9411765, 1, 1,
-0.0461848, 2.097956, 1.12515, 0, 0.9333333, 1, 1,
-0.0422217, 0.1658102, 0.2870143, 0, 0.9294118, 1, 1,
-0.0418493, 1.366573, -0.6780556, 0, 0.9215686, 1, 1,
-0.02838519, 0.4592721, 0.2111675, 0, 0.9176471, 1, 1,
-0.02804443, 0.7117288, -1.294987, 0, 0.9098039, 1, 1,
-0.01887151, 0.1815483, -0.06868264, 0, 0.9058824, 1, 1,
-0.01817608, 0.08609129, -0.0775675, 0, 0.8980392, 1, 1,
-0.01615779, -0.4828587, -3.152237, 0, 0.8901961, 1, 1,
-0.01249271, -0.06456179, -3.038811, 0, 0.8862745, 1, 1,
-0.004321325, 0.3702198, -0.02820441, 0, 0.8784314, 1, 1,
-0.004051363, 0.630689, -0.3043922, 0, 0.8745098, 1, 1,
-0.0007841357, -1.32227, -2.135417, 0, 0.8666667, 1, 1,
0.006271995, 0.6745914, 1.128601, 0, 0.8627451, 1, 1,
0.007361926, 0.2954713, 0.4032768, 0, 0.854902, 1, 1,
0.01352084, -0.08865126, 2.288839, 0, 0.8509804, 1, 1,
0.01882439, 0.03193269, -0.02401185, 0, 0.8431373, 1, 1,
0.0193128, -1.552329, 3.467615, 0, 0.8392157, 1, 1,
0.02738523, 1.611756, -0.499829, 0, 0.8313726, 1, 1,
0.02897196, 0.1678196, 1.450969, 0, 0.827451, 1, 1,
0.03114455, 1.917644, 0.6330013, 0, 0.8196079, 1, 1,
0.03371824, -0.0446839, 3.121241, 0, 0.8156863, 1, 1,
0.03668092, -0.8658259, 1.907505, 0, 0.8078431, 1, 1,
0.04362484, -0.09675268, 3.732757, 0, 0.8039216, 1, 1,
0.04743835, -0.3134152, 2.87454, 0, 0.7960784, 1, 1,
0.0514055, 1.675911, 0.4464424, 0, 0.7882353, 1, 1,
0.05163749, 1.237292, 0.81151, 0, 0.7843137, 1, 1,
0.05395408, -0.7982684, 4.761288, 0, 0.7764706, 1, 1,
0.05403573, -1.618614, 5.001411, 0, 0.772549, 1, 1,
0.05560242, -0.9711083, 4.798981, 0, 0.7647059, 1, 1,
0.05662685, -0.6264346, 4.192904, 0, 0.7607843, 1, 1,
0.06277455, 0.2062421, 0.716402, 0, 0.7529412, 1, 1,
0.06926516, -0.02242308, 1.404904, 0, 0.7490196, 1, 1,
0.07207952, -0.4129954, 3.671932, 0, 0.7411765, 1, 1,
0.07644043, -0.06836832, 2.128569, 0, 0.7372549, 1, 1,
0.07668926, 0.7442382, -0.7670478, 0, 0.7294118, 1, 1,
0.08015334, 0.1708872, 0.5541805, 0, 0.7254902, 1, 1,
0.0817606, 0.311302, -0.2760179, 0, 0.7176471, 1, 1,
0.08419593, 0.05769566, 1.836406, 0, 0.7137255, 1, 1,
0.08780565, 0.1252384, 0.5573002, 0, 0.7058824, 1, 1,
0.0893759, -0.1682774, 2.632699, 0, 0.6980392, 1, 1,
0.0896799, -0.1047225, 2.998975, 0, 0.6941177, 1, 1,
0.09060352, 1.243857, -0.06866715, 0, 0.6862745, 1, 1,
0.09698303, -0.4336272, 1.942433, 0, 0.682353, 1, 1,
0.105734, 1.658205, 0.3838211, 0, 0.6745098, 1, 1,
0.1059054, 0.4294325, -1.176101, 0, 0.6705883, 1, 1,
0.1076755, -0.4805499, 2.303173, 0, 0.6627451, 1, 1,
0.1140344, -0.4182054, 2.656964, 0, 0.6588235, 1, 1,
0.1169524, -0.7437654, 3.766369, 0, 0.6509804, 1, 1,
0.117962, 0.06848615, 1.123754, 0, 0.6470588, 1, 1,
0.118477, 2.117791, -1.291125, 0, 0.6392157, 1, 1,
0.1185051, 0.119432, -0.2946702, 0, 0.6352941, 1, 1,
0.1190235, 0.4988826, -0.667239, 0, 0.627451, 1, 1,
0.1202692, 1.077108, 0.02400447, 0, 0.6235294, 1, 1,
0.1220678, -0.9593163, 3.666544, 0, 0.6156863, 1, 1,
0.1244344, 0.7774036, 1.536987, 0, 0.6117647, 1, 1,
0.1271549, 0.576879, 0.694334, 0, 0.6039216, 1, 1,
0.1276485, -0.2975065, 3.607076, 0, 0.5960785, 1, 1,
0.1277623, -0.7834888, 4.18398, 0, 0.5921569, 1, 1,
0.1298134, 0.03460947, 0.4166382, 0, 0.5843138, 1, 1,
0.1301155, -0.1192861, -0.4100102, 0, 0.5803922, 1, 1,
0.1304833, -0.1672374, 2.638064, 0, 0.572549, 1, 1,
0.1317193, -0.4238383, 2.139498, 0, 0.5686275, 1, 1,
0.136043, 0.2931861, 0.9686662, 0, 0.5607843, 1, 1,
0.1367253, -1.091424, 4.113568, 0, 0.5568628, 1, 1,
0.1375895, 0.5329421, -1.446513, 0, 0.5490196, 1, 1,
0.1384277, -0.4172952, 3.670469, 0, 0.5450981, 1, 1,
0.1389843, 0.5368515, 0.08400197, 0, 0.5372549, 1, 1,
0.1400146, -0.7897646, 3.473774, 0, 0.5333334, 1, 1,
0.1446786, 0.5161132, 0.4823314, 0, 0.5254902, 1, 1,
0.1448379, -1.312922, 3.836641, 0, 0.5215687, 1, 1,
0.1485309, -0.1783984, 3.525622, 0, 0.5137255, 1, 1,
0.1493298, 2.673214, 0.6577082, 0, 0.509804, 1, 1,
0.1537409, -0.6168329, 3.282817, 0, 0.5019608, 1, 1,
0.164602, -0.9577556, 1.243924, 0, 0.4941176, 1, 1,
0.1653635, 1.002795, -0.7161601, 0, 0.4901961, 1, 1,
0.1692585, -0.4019797, 2.325472, 0, 0.4823529, 1, 1,
0.176592, 0.123912, 3.069238, 0, 0.4784314, 1, 1,
0.1777868, -0.7293697, 2.219459, 0, 0.4705882, 1, 1,
0.1803824, -0.2539226, 1.520403, 0, 0.4666667, 1, 1,
0.1841002, -0.4473657, 1.177559, 0, 0.4588235, 1, 1,
0.1853958, -1.916754, 3.155956, 0, 0.454902, 1, 1,
0.1858006, 0.7773443, -0.6913742, 0, 0.4470588, 1, 1,
0.1890842, -0.6142931, 4.041657, 0, 0.4431373, 1, 1,
0.1901836, 1.557118, 0.8216223, 0, 0.4352941, 1, 1,
0.1908303, -2.154275, 2.341304, 0, 0.4313726, 1, 1,
0.1913287, -0.910632, 3.33868, 0, 0.4235294, 1, 1,
0.1972782, 0.6619756, 0.146823, 0, 0.4196078, 1, 1,
0.2044178, 0.1322609, 0.9458545, 0, 0.4117647, 1, 1,
0.2044278, 0.6895882, 1.261733, 0, 0.4078431, 1, 1,
0.213182, 0.4717889, 1.185851, 0, 0.4, 1, 1,
0.2157595, -1.956398, 1.946661, 0, 0.3921569, 1, 1,
0.2187598, -0.2189986, 3.419296, 0, 0.3882353, 1, 1,
0.2217267, -1.214101, 4.232396, 0, 0.3803922, 1, 1,
0.2228649, 1.686941, 0.2444853, 0, 0.3764706, 1, 1,
0.2235396, -1.385995, 4.071275, 0, 0.3686275, 1, 1,
0.230301, -0.3740842, 2.34713, 0, 0.3647059, 1, 1,
0.2318786, -0.3148829, 2.764785, 0, 0.3568628, 1, 1,
0.2331515, 0.1964093, 0.7906418, 0, 0.3529412, 1, 1,
0.2383573, 2.381817, 0.1617742, 0, 0.345098, 1, 1,
0.2387176, 1.471272, -0.0970998, 0, 0.3411765, 1, 1,
0.2388555, 1.110199, 0.3540262, 0, 0.3333333, 1, 1,
0.2409387, 1.434777, -1.464856, 0, 0.3294118, 1, 1,
0.2499329, -0.7523018, 1.573755, 0, 0.3215686, 1, 1,
0.25187, -1.176493, 2.095941, 0, 0.3176471, 1, 1,
0.254309, 0.9536002, 0.8537527, 0, 0.3098039, 1, 1,
0.258073, 0.204836, 1.751832, 0, 0.3058824, 1, 1,
0.2607668, 0.2308905, -0.400649, 0, 0.2980392, 1, 1,
0.2614075, -0.6947733, 2.1992, 0, 0.2901961, 1, 1,
0.2648912, 2.761098, -0.2181877, 0, 0.2862745, 1, 1,
0.2661549, -2.266673, 2.235136, 0, 0.2784314, 1, 1,
0.2667979, -0.8229083, 1.981033, 0, 0.2745098, 1, 1,
0.2673446, -1.18521, 2.464461, 0, 0.2666667, 1, 1,
0.2701034, 0.8621447, 0.4674391, 0, 0.2627451, 1, 1,
0.2733116, -1.113647, 2.086173, 0, 0.254902, 1, 1,
0.2756342, -0.4041667, 2.913619, 0, 0.2509804, 1, 1,
0.2776997, -0.6152279, 1.796863, 0, 0.2431373, 1, 1,
0.2797663, 0.5173876, -1.201707, 0, 0.2392157, 1, 1,
0.2802185, -1.981486, 1.611642, 0, 0.2313726, 1, 1,
0.280414, 0.956367, -0.04839044, 0, 0.227451, 1, 1,
0.2807346, 1.542486, -0.3907799, 0, 0.2196078, 1, 1,
0.2817889, -0.3176105, 1.384723, 0, 0.2156863, 1, 1,
0.2845721, -0.02465126, 1.244081, 0, 0.2078431, 1, 1,
0.2871603, 1.858163, 0.7102313, 0, 0.2039216, 1, 1,
0.2939842, -2.568368, 2.714725, 0, 0.1960784, 1, 1,
0.2993979, 1.263025, 2.381239, 0, 0.1882353, 1, 1,
0.3000855, 1.26051, -0.003870167, 0, 0.1843137, 1, 1,
0.3024586, -0.8890663, 2.801281, 0, 0.1764706, 1, 1,
0.3026203, 1.448879, -0.08700117, 0, 0.172549, 1, 1,
0.3030868, -0.8590229, 3.181857, 0, 0.1647059, 1, 1,
0.3109783, -2.191523, 2.642899, 0, 0.1607843, 1, 1,
0.3126748, 1.477312, -0.7050176, 0, 0.1529412, 1, 1,
0.3272759, -0.1112489, 0.9348977, 0, 0.1490196, 1, 1,
0.3281884, 0.7875911, -1.164059, 0, 0.1411765, 1, 1,
0.3289648, 0.6869663, 0.9039549, 0, 0.1372549, 1, 1,
0.3305531, 0.2088629, 0.4076246, 0, 0.1294118, 1, 1,
0.3324856, -0.6975071, 2.568931, 0, 0.1254902, 1, 1,
0.3332533, -0.3902192, 1.378484, 0, 0.1176471, 1, 1,
0.3351716, 0.08277787, 3.303204, 0, 0.1137255, 1, 1,
0.3352239, 1.074075, -1.52635, 0, 0.1058824, 1, 1,
0.3365068, -0.05605043, 3.130142, 0, 0.09803922, 1, 1,
0.3382913, 1.129418, -0.2942292, 0, 0.09411765, 1, 1,
0.3395922, -0.5072855, 1.152206, 0, 0.08627451, 1, 1,
0.3400585, -1.392779, 4.919636, 0, 0.08235294, 1, 1,
0.3406837, 0.5686544, 0.1668852, 0, 0.07450981, 1, 1,
0.3440274, -0.259712, 2.083936, 0, 0.07058824, 1, 1,
0.3461131, -2.006367, 2.500442, 0, 0.0627451, 1, 1,
0.3466306, 0.9042013, 0.7158294, 0, 0.05882353, 1, 1,
0.347856, 0.3923348, -0.224749, 0, 0.05098039, 1, 1,
0.3515219, 1.436419, 0.2404475, 0, 0.04705882, 1, 1,
0.354899, -0.08633378, 2.616822, 0, 0.03921569, 1, 1,
0.3555672, -0.2424507, 2.612842, 0, 0.03529412, 1, 1,
0.3573491, -2.203192, 3.517173, 0, 0.02745098, 1, 1,
0.3613355, -1.19903, 2.603167, 0, 0.02352941, 1, 1,
0.3664775, -0.7422071, 4.001701, 0, 0.01568628, 1, 1,
0.3752274, 0.5907099, 0.0008648764, 0, 0.01176471, 1, 1,
0.3800604, 1.563062, 1.197965, 0, 0.003921569, 1, 1,
0.3803709, 0.05388355, 0.8956061, 0.003921569, 0, 1, 1,
0.3822239, 0.438592, 1.115119, 0.007843138, 0, 1, 1,
0.3846773, -0.187986, 1.410465, 0.01568628, 0, 1, 1,
0.3870233, 0.6927697, -0.6954543, 0.01960784, 0, 1, 1,
0.3879226, 0.1856846, 2.735215, 0.02745098, 0, 1, 1,
0.3902554, -0.3282373, 2.035922, 0.03137255, 0, 1, 1,
0.3936656, -0.5526875, 2.763725, 0.03921569, 0, 1, 1,
0.3947893, 0.8879295, 1.718239, 0.04313726, 0, 1, 1,
0.4044057, 0.9248389, -0.8027943, 0.05098039, 0, 1, 1,
0.4048003, 1.541016, 0.5602673, 0.05490196, 0, 1, 1,
0.4059658, 0.1248641, 1.382098, 0.0627451, 0, 1, 1,
0.4119776, -0.4437172, 1.9907, 0.06666667, 0, 1, 1,
0.4128256, 1.207426, -1.461066, 0.07450981, 0, 1, 1,
0.4148985, 0.4120225, 3.058777, 0.07843138, 0, 1, 1,
0.4299014, -0.3476751, 2.361335, 0.08627451, 0, 1, 1,
0.4302286, 1.072491, 0.05853911, 0.09019608, 0, 1, 1,
0.4316136, 0.008473892, 0.6761522, 0.09803922, 0, 1, 1,
0.4332891, -1.138711, 2.092962, 0.1058824, 0, 1, 1,
0.4343255, 0.05478521, 3.763761, 0.1098039, 0, 1, 1,
0.4345768, -0.0265956, 2.042853, 0.1176471, 0, 1, 1,
0.4347416, 0.1993139, 0.7712111, 0.1215686, 0, 1, 1,
0.4349466, -1.443625, 3.651203, 0.1294118, 0, 1, 1,
0.4349569, 0.2154667, 3.183609, 0.1333333, 0, 1, 1,
0.4425959, 0.7633664, -2.478128, 0.1411765, 0, 1, 1,
0.4429951, -0.3144935, 1.065107, 0.145098, 0, 1, 1,
0.4437808, -0.4841283, 3.449493, 0.1529412, 0, 1, 1,
0.4463724, -0.5157226, 2.540382, 0.1568628, 0, 1, 1,
0.4551583, 1.908601, 0.9328647, 0.1647059, 0, 1, 1,
0.4554986, 1.136411, 0.5628631, 0.1686275, 0, 1, 1,
0.459278, -1.343438, 3.42283, 0.1764706, 0, 1, 1,
0.461731, -1.284471, 3.107787, 0.1803922, 0, 1, 1,
0.4646707, 1.050035, -0.1409078, 0.1882353, 0, 1, 1,
0.4671445, -0.4108754, 1.553042, 0.1921569, 0, 1, 1,
0.4760399, -0.6324665, 1.919361, 0.2, 0, 1, 1,
0.4770651, -0.6758891, 3.294586, 0.2078431, 0, 1, 1,
0.4774281, -0.8542978, 2.673943, 0.2117647, 0, 1, 1,
0.4781984, 0.335023, 1.775933, 0.2196078, 0, 1, 1,
0.4795523, 0.08165911, -0.4836195, 0.2235294, 0, 1, 1,
0.4796552, 1.660653, 1.124795, 0.2313726, 0, 1, 1,
0.4814974, 0.297788, 2.168899, 0.2352941, 0, 1, 1,
0.4886692, -0.09377601, 2.449772, 0.2431373, 0, 1, 1,
0.4941852, 0.1212646, 0.444718, 0.2470588, 0, 1, 1,
0.4953102, 1.236061, -0.4778029, 0.254902, 0, 1, 1,
0.4956095, -0.04938901, 2.410704, 0.2588235, 0, 1, 1,
0.4980747, -0.5453731, 3.514422, 0.2666667, 0, 1, 1,
0.4985846, -0.7260549, 2.576708, 0.2705882, 0, 1, 1,
0.5051118, 0.05124669, 2.174619, 0.2784314, 0, 1, 1,
0.5051796, 0.4292672, 0.2134043, 0.282353, 0, 1, 1,
0.5160499, 0.2582528, -0.3710268, 0.2901961, 0, 1, 1,
0.5171916, -0.4502717, 1.836024, 0.2941177, 0, 1, 1,
0.5199142, -1.943661, 3.407503, 0.3019608, 0, 1, 1,
0.5210948, 0.7429525, 0.7980142, 0.3098039, 0, 1, 1,
0.5278618, 1.488221, -1.743933, 0.3137255, 0, 1, 1,
0.5309075, -1.363286, 2.250409, 0.3215686, 0, 1, 1,
0.5475624, 0.5344992, 2.833251, 0.3254902, 0, 1, 1,
0.5477951, -1.293894, 4.710217, 0.3333333, 0, 1, 1,
0.5492569, 1.731662, -0.9060357, 0.3372549, 0, 1, 1,
0.5495853, -2.706273, 2.420869, 0.345098, 0, 1, 1,
0.5598223, 0.9407766, -0.3299088, 0.3490196, 0, 1, 1,
0.5626404, 1.231385, -1.899179, 0.3568628, 0, 1, 1,
0.5639062, 0.2751371, 1.198844, 0.3607843, 0, 1, 1,
0.5665988, 1.088654, 0.3986479, 0.3686275, 0, 1, 1,
0.5707486, 0.01859217, 5.367752, 0.372549, 0, 1, 1,
0.5717754, -0.9556322, 3.38245, 0.3803922, 0, 1, 1,
0.5723727, -0.2874746, -0.3987179, 0.3843137, 0, 1, 1,
0.5733441, -1.503681, 2.113979, 0.3921569, 0, 1, 1,
0.5746911, 1.510932, 0.9798197, 0.3960784, 0, 1, 1,
0.5761034, 0.2138416, 1.82645, 0.4039216, 0, 1, 1,
0.5788007, 1.285083, 1.014831, 0.4117647, 0, 1, 1,
0.5817202, -0.05595751, 2.921124, 0.4156863, 0, 1, 1,
0.5907836, -1.197422, 1.030615, 0.4235294, 0, 1, 1,
0.5917168, -1.679376, 2.208615, 0.427451, 0, 1, 1,
0.5940762, 1.212874, 0.8954505, 0.4352941, 0, 1, 1,
0.5965245, -0.6368963, 1.639119, 0.4392157, 0, 1, 1,
0.6011924, 1.249811, 0.8353835, 0.4470588, 0, 1, 1,
0.6019761, 0.8106005, 0.3937827, 0.4509804, 0, 1, 1,
0.6040257, 0.6239843, 0.9777166, 0.4588235, 0, 1, 1,
0.6044784, -0.6681138, 1.941754, 0.4627451, 0, 1, 1,
0.6149687, -0.7787707, 2.689663, 0.4705882, 0, 1, 1,
0.6178734, 0.7783618, 1.110339, 0.4745098, 0, 1, 1,
0.6193557, -0.02524659, 2.103517, 0.4823529, 0, 1, 1,
0.6216514, -0.2587001, 1.47252, 0.4862745, 0, 1, 1,
0.6216892, -0.5823871, 2.109684, 0.4941176, 0, 1, 1,
0.6220193, -0.2790925, 1.333003, 0.5019608, 0, 1, 1,
0.6293588, -0.6803583, 2.899391, 0.5058824, 0, 1, 1,
0.6297952, -2.206926, 1.986513, 0.5137255, 0, 1, 1,
0.6299849, -0.832957, 0.9211341, 0.5176471, 0, 1, 1,
0.6315457, 1.404966, -0.4561083, 0.5254902, 0, 1, 1,
0.6317033, 0.5970532, 1.334627, 0.5294118, 0, 1, 1,
0.6339209, -0.3385571, 1.155031, 0.5372549, 0, 1, 1,
0.634859, 0.01971048, 2.292616, 0.5411765, 0, 1, 1,
0.6356853, 0.7894135, 1.459283, 0.5490196, 0, 1, 1,
0.637108, 0.4707886, 2.340808, 0.5529412, 0, 1, 1,
0.6380705, 0.2467569, -0.2048868, 0.5607843, 0, 1, 1,
0.638185, -0.3721587, 1.374531, 0.5647059, 0, 1, 1,
0.6390896, 1.68533, -0.08719867, 0.572549, 0, 1, 1,
0.64088, -0.3043182, 1.826274, 0.5764706, 0, 1, 1,
0.656245, 1.49905, 1.945236, 0.5843138, 0, 1, 1,
0.6583918, 1.233011, 1.110218, 0.5882353, 0, 1, 1,
0.6631595, -0.01312551, 1.570548, 0.5960785, 0, 1, 1,
0.6685556, -0.5999528, 4.163651, 0.6039216, 0, 1, 1,
0.6747082, -0.6592572, 1.95896, 0.6078432, 0, 1, 1,
0.6748244, 0.1356331, 1.396001, 0.6156863, 0, 1, 1,
0.675603, -0.5123672, 1.899995, 0.6196079, 0, 1, 1,
0.6767603, -0.8739013, 4.094418, 0.627451, 0, 1, 1,
0.6794574, -0.9116111, 3.356246, 0.6313726, 0, 1, 1,
0.6944965, -1.363762, 4.108137, 0.6392157, 0, 1, 1,
0.7010236, -0.950545, 2.082989, 0.6431373, 0, 1, 1,
0.7031228, -0.003153528, 2.121629, 0.6509804, 0, 1, 1,
0.712311, 0.2249052, 2.461032, 0.654902, 0, 1, 1,
0.7150827, -0.6035206, 1.259647, 0.6627451, 0, 1, 1,
0.7156222, -0.3613116, 1.576363, 0.6666667, 0, 1, 1,
0.7165045, 1.432891, 0.7640945, 0.6745098, 0, 1, 1,
0.7170019, -0.5798318, 2.498768, 0.6784314, 0, 1, 1,
0.7234671, 0.3977108, 0.6248096, 0.6862745, 0, 1, 1,
0.7300063, -0.5906593, 1.922133, 0.6901961, 0, 1, 1,
0.7399514, -0.9976919, 2.292549, 0.6980392, 0, 1, 1,
0.7410832, 0.792991, 2.026739, 0.7058824, 0, 1, 1,
0.7480664, 0.6369641, -1.359248, 0.7098039, 0, 1, 1,
0.7538202, -1.373165, 1.982707, 0.7176471, 0, 1, 1,
0.7552488, -0.8835208, 2.936483, 0.7215686, 0, 1, 1,
0.7560725, 0.9988434, 2.17046, 0.7294118, 0, 1, 1,
0.7561213, 0.741729, 0.4458585, 0.7333333, 0, 1, 1,
0.7577271, -0.4303896, 2.672674, 0.7411765, 0, 1, 1,
0.7612287, -0.1999822, 2.836714, 0.7450981, 0, 1, 1,
0.7628642, -1.702475, 2.696793, 0.7529412, 0, 1, 1,
0.76895, -0.5612336, 2.522596, 0.7568628, 0, 1, 1,
0.7700228, 1.160641, 1.994146, 0.7647059, 0, 1, 1,
0.7754619, 1.481627, 1.102393, 0.7686275, 0, 1, 1,
0.7789768, -1.485257, 4.282823, 0.7764706, 0, 1, 1,
0.7834533, 0.3115257, 1.458051, 0.7803922, 0, 1, 1,
0.7856625, -0.9762513, 3.175238, 0.7882353, 0, 1, 1,
0.7867045, 1.069515, -0.2924513, 0.7921569, 0, 1, 1,
0.7924845, -0.7484486, 3.010628, 0.8, 0, 1, 1,
0.7943152, -0.7766104, 3.784611, 0.8078431, 0, 1, 1,
0.8069918, -0.3185361, 0.2485407, 0.8117647, 0, 1, 1,
0.8181926, 0.2622842, 0.3657735, 0.8196079, 0, 1, 1,
0.8209947, -0.7832691, 1.77159, 0.8235294, 0, 1, 1,
0.8218773, 0.6923927, -0.3390113, 0.8313726, 0, 1, 1,
0.8289937, -0.2253622, 2.501104, 0.8352941, 0, 1, 1,
0.8305238, -1.615554, 3.751023, 0.8431373, 0, 1, 1,
0.8326943, 0.4009309, -0.151686, 0.8470588, 0, 1, 1,
0.8380128, 0.1146019, 2.421617, 0.854902, 0, 1, 1,
0.8390234, -0.4783867, 2.257492, 0.8588235, 0, 1, 1,
0.8429762, 0.1516497, 1.915619, 0.8666667, 0, 1, 1,
0.8484839, 0.09718725, 1.331634, 0.8705882, 0, 1, 1,
0.8501206, 1.53329, 1.74494, 0.8784314, 0, 1, 1,
0.8580445, -0.8126699, 1.54497, 0.8823529, 0, 1, 1,
0.8598039, -0.5060067, 2.099839, 0.8901961, 0, 1, 1,
0.8606218, -1.290062, 2.903665, 0.8941177, 0, 1, 1,
0.8704976, 1.002154, 0.07926784, 0.9019608, 0, 1, 1,
0.8711628, -0.1601734, 2.570736, 0.9098039, 0, 1, 1,
0.8756688, 0.7317981, 0.4969527, 0.9137255, 0, 1, 1,
0.8783854, 1.157134, 1.512555, 0.9215686, 0, 1, 1,
0.8828726, -0.0757001, 1.811153, 0.9254902, 0, 1, 1,
0.8843991, 1.112654, 1.020195, 0.9333333, 0, 1, 1,
0.8937009, 1.015498, 1.43429, 0.9372549, 0, 1, 1,
0.8964781, -0.1000066, 1.282931, 0.945098, 0, 1, 1,
0.897382, 1.557372, 0.9607973, 0.9490196, 0, 1, 1,
0.8997658, 2.791518, 1.04875, 0.9568627, 0, 1, 1,
0.9022125, -0.9746575, 2.282621, 0.9607843, 0, 1, 1,
0.9078673, -0.5064238, 3.481257, 0.9686275, 0, 1, 1,
0.9082624, 0.8259628, 0.756588, 0.972549, 0, 1, 1,
0.910314, -0.5439751, 4.128108, 0.9803922, 0, 1, 1,
0.9217749, -0.6600158, 1.209996, 0.9843137, 0, 1, 1,
0.9219714, 0.2459537, 2.232368, 0.9921569, 0, 1, 1,
0.922597, -2.046766, 2.603976, 0.9960784, 0, 1, 1,
0.9232112, -1.238319, 3.82156, 1, 0, 0.9960784, 1,
0.9248064, 0.3521238, 0.7846509, 1, 0, 0.9882353, 1,
0.9265756, 1.824332, 0.5230061, 1, 0, 0.9843137, 1,
0.9335119, -0.5149959, -0.1480935, 1, 0, 0.9764706, 1,
0.9441783, 0.6838366, 1.926594, 1, 0, 0.972549, 1,
0.9617717, 1.101031, 1.150167, 1, 0, 0.9647059, 1,
0.9638171, 1.389477, 1.575266, 1, 0, 0.9607843, 1,
0.9717881, -0.9016556, 1.878359, 1, 0, 0.9529412, 1,
0.9773756, 1.929476, 1.415362, 1, 0, 0.9490196, 1,
0.985976, 1.181619, 0.5881001, 1, 0, 0.9411765, 1,
0.9896767, 0.4173408, 0.9304075, 1, 0, 0.9372549, 1,
0.9914971, 1.729232, 1.006798, 1, 0, 0.9294118, 1,
0.9925922, 0.6435495, 0.9684798, 1, 0, 0.9254902, 1,
0.9953228, 0.2881803, 0.5977929, 1, 0, 0.9176471, 1,
0.9983814, -0.7636041, 1.441198, 1, 0, 0.9137255, 1,
1.000874, 0.4683477, 2.048876, 1, 0, 0.9058824, 1,
1.009362, -0.7585999, -0.15094, 1, 0, 0.9019608, 1,
1.01283, -2.000405, 3.82903, 1, 0, 0.8941177, 1,
1.015385, 0.6766479, 0.5576011, 1, 0, 0.8862745, 1,
1.019056, -0.2950042, 1.191296, 1, 0, 0.8823529, 1,
1.030018, -0.5174588, -0.09142741, 1, 0, 0.8745098, 1,
1.031228, 0.2752722, 2.516104, 1, 0, 0.8705882, 1,
1.031498, 0.376316, 1.16302, 1, 0, 0.8627451, 1,
1.031856, 0.9653052, 2.086558, 1, 0, 0.8588235, 1,
1.045565, 1.405972, 1.132945, 1, 0, 0.8509804, 1,
1.048665, -0.2982059, 2.661308, 1, 0, 0.8470588, 1,
1.052936, 0.4137939, -0.03185285, 1, 0, 0.8392157, 1,
1.057381, 1.499127, 3.10529, 1, 0, 0.8352941, 1,
1.065183, 0.2418448, 1.553101, 1, 0, 0.827451, 1,
1.06533, -0.04518141, 1.173912, 1, 0, 0.8235294, 1,
1.068775, 0.07512689, 1.40044, 1, 0, 0.8156863, 1,
1.070126, 0.5203221, 0.4901206, 1, 0, 0.8117647, 1,
1.077471, 0.735441, 0.747449, 1, 0, 0.8039216, 1,
1.0837, -0.9092265, 3.536556, 1, 0, 0.7960784, 1,
1.083874, 0.4788868, 2.691581, 1, 0, 0.7921569, 1,
1.084129, 0.3292386, 1.999031, 1, 0, 0.7843137, 1,
1.095342, -0.7712189, 1.908379, 1, 0, 0.7803922, 1,
1.097335, 0.8403524, 1.136151, 1, 0, 0.772549, 1,
1.099925, -0.1462535, 0.5273521, 1, 0, 0.7686275, 1,
1.103087, 1.124823, 0.6182103, 1, 0, 0.7607843, 1,
1.104966, -0.2817536, 1.502659, 1, 0, 0.7568628, 1,
1.108242, -2.235805, 3.624169, 1, 0, 0.7490196, 1,
1.108878, -0.3194811, 3.409766, 1, 0, 0.7450981, 1,
1.112655, 0.335407, 2.906507, 1, 0, 0.7372549, 1,
1.114045, 0.7490474, 2.020944, 1, 0, 0.7333333, 1,
1.118355, -0.124857, 0.1604108, 1, 0, 0.7254902, 1,
1.125937, 0.2368673, 1.86317, 1, 0, 0.7215686, 1,
1.126579, -2.307103, 4.00753, 1, 0, 0.7137255, 1,
1.132078, 0.7304617, 0.9060948, 1, 0, 0.7098039, 1,
1.139994, -0.2109278, 1.131637, 1, 0, 0.7019608, 1,
1.148429, 0.5197698, 1.286999, 1, 0, 0.6941177, 1,
1.149675, 2.066107, 0.01886714, 1, 0, 0.6901961, 1,
1.160918, 0.3805394, 0.2872271, 1, 0, 0.682353, 1,
1.162787, 1.426151, 0.5979001, 1, 0, 0.6784314, 1,
1.180738, -2.932704, 1.615099, 1, 0, 0.6705883, 1,
1.192159, -0.5170752, 1.401981, 1, 0, 0.6666667, 1,
1.196295, 0.5217587, 0.8964921, 1, 0, 0.6588235, 1,
1.204061, -1.909337, 2.292259, 1, 0, 0.654902, 1,
1.214696, 0.4869374, 2.191442, 1, 0, 0.6470588, 1,
1.221213, -1.442268, 1.005536, 1, 0, 0.6431373, 1,
1.240741, 0.5490695, 0.7958794, 1, 0, 0.6352941, 1,
1.265141, 0.3616882, 3.076275, 1, 0, 0.6313726, 1,
1.265868, -0.9293871, 1.857261, 1, 0, 0.6235294, 1,
1.288668, 0.3581393, 2.567096, 1, 0, 0.6196079, 1,
1.292925, -0.4120994, 1.786226, 1, 0, 0.6117647, 1,
1.293369, 0.3981633, 2.100174, 1, 0, 0.6078432, 1,
1.314769, -0.1597606, 1.97018, 1, 0, 0.6, 1,
1.315451, -1.355324, 2.04001, 1, 0, 0.5921569, 1,
1.318928, 0.6923156, -0.4638829, 1, 0, 0.5882353, 1,
1.325416, 0.8134451, -0.1411113, 1, 0, 0.5803922, 1,
1.337524, -0.3721429, 2.643932, 1, 0, 0.5764706, 1,
1.344205, 1.610655, 0.3824752, 1, 0, 0.5686275, 1,
1.349289, 1.4545, 2.264502, 1, 0, 0.5647059, 1,
1.389442, -1.59832, 2.904031, 1, 0, 0.5568628, 1,
1.395706, -1.169188, 3.521103, 1, 0, 0.5529412, 1,
1.402347, -1.345746, 2.078345, 1, 0, 0.5450981, 1,
1.403435, 0.4904535, 2.174232, 1, 0, 0.5411765, 1,
1.408174, -0.6865738, 1.072487, 1, 0, 0.5333334, 1,
1.425257, -1.305746, 1.059866, 1, 0, 0.5294118, 1,
1.425935, -0.6402289, 2.958779, 1, 0, 0.5215687, 1,
1.437983, -0.959988, 3.684877, 1, 0, 0.5176471, 1,
1.438588, 0.5044636, 2.614047, 1, 0, 0.509804, 1,
1.443937, 2.739005, -0.1699418, 1, 0, 0.5058824, 1,
1.460092, 1.253027, 0.1520101, 1, 0, 0.4980392, 1,
1.460717, 0.2478502, 1.803527, 1, 0, 0.4901961, 1,
1.463004, -0.4146656, 2.987313, 1, 0, 0.4862745, 1,
1.466316, -0.389688, 1.379435, 1, 0, 0.4784314, 1,
1.472608, -0.3434211, 1.818836, 1, 0, 0.4745098, 1,
1.476294, -1.177464, 2.584846, 1, 0, 0.4666667, 1,
1.476735, -0.06738394, 0.5181563, 1, 0, 0.4627451, 1,
1.477456, -0.2611795, 2.6352, 1, 0, 0.454902, 1,
1.481152, -0.8065605, 3.150782, 1, 0, 0.4509804, 1,
1.481729, 0.07493314, 2.845185, 1, 0, 0.4431373, 1,
1.48516, -0.04484141, 1.813655, 1, 0, 0.4392157, 1,
1.489872, 0.4627843, 1.398767, 1, 0, 0.4313726, 1,
1.49279, -0.4565461, 1.550956, 1, 0, 0.427451, 1,
1.502086, -0.1859967, 3.193902, 1, 0, 0.4196078, 1,
1.503607, 0.001712333, 1.645661, 1, 0, 0.4156863, 1,
1.510689, 0.4556702, 0.7619835, 1, 0, 0.4078431, 1,
1.525005, -0.1594271, 2.871127, 1, 0, 0.4039216, 1,
1.525723, -0.5534338, 1.630111, 1, 0, 0.3960784, 1,
1.556433, -0.6418104, 2.092682, 1, 0, 0.3882353, 1,
1.561857, -0.2929655, 0.9862821, 1, 0, 0.3843137, 1,
1.565522, -2.031781, 2.791568, 1, 0, 0.3764706, 1,
1.567807, 0.3006413, 2.128855, 1, 0, 0.372549, 1,
1.589814, 0.4488749, 1.229416, 1, 0, 0.3647059, 1,
1.591387, -0.2125963, 1.762314, 1, 0, 0.3607843, 1,
1.596156, 2.146097, -0.3491537, 1, 0, 0.3529412, 1,
1.609133, 0.3661809, 1.333173, 1, 0, 0.3490196, 1,
1.615107, 0.09954557, 0.4433864, 1, 0, 0.3411765, 1,
1.627929, 0.6760521, 2.033053, 1, 0, 0.3372549, 1,
1.633586, -2.093013, 2.053972, 1, 0, 0.3294118, 1,
1.640263, -0.5699907, 1.4065, 1, 0, 0.3254902, 1,
1.650144, 0.06784589, 1.768566, 1, 0, 0.3176471, 1,
1.65524, -0.7622839, 4.234608, 1, 0, 0.3137255, 1,
1.673051, 1.013623, 0.6440697, 1, 0, 0.3058824, 1,
1.67592, 0.6729939, 1.068588, 1, 0, 0.2980392, 1,
1.677, -0.9916599, 2.251476, 1, 0, 0.2941177, 1,
1.685439, 1.536749, 2.61175, 1, 0, 0.2862745, 1,
1.695347, 0.8361245, 0.7903917, 1, 0, 0.282353, 1,
1.700742, -0.2369673, 2.881646, 1, 0, 0.2745098, 1,
1.701159, 0.2982733, 0.7571115, 1, 0, 0.2705882, 1,
1.710858, 0.8537565, 0.5952181, 1, 0, 0.2627451, 1,
1.726563, -0.1165305, 2.597283, 1, 0, 0.2588235, 1,
1.775497, -0.3792244, 1.908363, 1, 0, 0.2509804, 1,
1.781472, 0.5584112, 0.1889124, 1, 0, 0.2470588, 1,
1.785287, 1.03088, 1.51657, 1, 0, 0.2392157, 1,
1.785717, -0.7712945, 2.678189, 1, 0, 0.2352941, 1,
1.787011, 2.434327, 2.304823, 1, 0, 0.227451, 1,
1.806744, -0.4545877, -0.08942093, 1, 0, 0.2235294, 1,
1.859266, -0.3199918, 0.6155301, 1, 0, 0.2156863, 1,
1.861336, -1.181936, 4.456509, 1, 0, 0.2117647, 1,
1.868435, -0.09836939, 1.841243, 1, 0, 0.2039216, 1,
1.894175, -0.7998453, 2.165156, 1, 0, 0.1960784, 1,
1.896163, 0.410376, 3.724251, 1, 0, 0.1921569, 1,
1.900021, -0.2079176, 2.6016, 1, 0, 0.1843137, 1,
2.023448, 2.202557, 1.214845, 1, 0, 0.1803922, 1,
2.039043, 0.2817304, 0.09258949, 1, 0, 0.172549, 1,
2.066974, -0.6217881, 3.220652, 1, 0, 0.1686275, 1,
2.078053, 0.2131975, 1.06768, 1, 0, 0.1607843, 1,
2.10454, 1.214248, 0.2088283, 1, 0, 0.1568628, 1,
2.141832, 1.192873, 4.193635, 1, 0, 0.1490196, 1,
2.144129, 0.8732772, 2.349303, 1, 0, 0.145098, 1,
2.154232, -0.8655326, 2.009732, 1, 0, 0.1372549, 1,
2.172087, 0.4931322, 1.099634, 1, 0, 0.1333333, 1,
2.17885, 0.8698887, 1.794131, 1, 0, 0.1254902, 1,
2.196042, 0.731554, 1.543365, 1, 0, 0.1215686, 1,
2.199015, 0.9723435, 2.082036, 1, 0, 0.1137255, 1,
2.201601, 0.3554614, 0.7506514, 1, 0, 0.1098039, 1,
2.207571, -1.330228, 1.538056, 1, 0, 0.1019608, 1,
2.21106, -2.53587, 3.143592, 1, 0, 0.09411765, 1,
2.21979, 0.3211731, 1.714986, 1, 0, 0.09019608, 1,
2.234298, 0.2125572, 1.184282, 1, 0, 0.08235294, 1,
2.234822, -1.050668, 1.464013, 1, 0, 0.07843138, 1,
2.240062, 0.323244, 0.5031579, 1, 0, 0.07058824, 1,
2.292319, 1.378873, 1.094424, 1, 0, 0.06666667, 1,
2.317559, 0.4260785, 1.285947, 1, 0, 0.05882353, 1,
2.380283, 0.8473847, 2.115356, 1, 0, 0.05490196, 1,
2.477449, 0.3677036, -0.1294857, 1, 0, 0.04705882, 1,
2.569427, 0.275142, 1.747391, 1, 0, 0.04313726, 1,
2.747467, 0.1372101, 1.684744, 1, 0, 0.03529412, 1,
2.747835, 0.5469051, 0.7031758, 1, 0, 0.03137255, 1,
2.750769, 0.7936506, 0.783318, 1, 0, 0.02352941, 1,
2.795958, -2.011368, 3.617306, 1, 0, 0.01960784, 1,
2.81913, -0.9687784, 1.585529, 1, 0, 0.01176471, 1,
2.825923, 0.1618361, 1.563972, 1, 0, 0.007843138, 1
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
-0.3549592, -4.430148, -6.582392, 0, -0.5, 0.5, 0.5,
-0.3549592, -4.430148, -6.582392, 1, -0.5, 0.5, 0.5,
-0.3549592, -4.430148, -6.582392, 1, 1.5, 0.5, 0.5,
-0.3549592, -4.430148, -6.582392, 0, 1.5, 0.5, 0.5
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
-4.614161, 0.5765007, -6.582392, 0, -0.5, 0.5, 0.5,
-4.614161, 0.5765007, -6.582392, 1, -0.5, 0.5, 0.5,
-4.614161, 0.5765007, -6.582392, 1, 1.5, 0.5, 0.5,
-4.614161, 0.5765007, -6.582392, 0, 1.5, 0.5, 0.5
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
-4.614161, -4.430148, 0.2586694, 0, -0.5, 0.5, 0.5,
-4.614161, -4.430148, 0.2586694, 1, -0.5, 0.5, 0.5,
-4.614161, -4.430148, 0.2586694, 1, 1.5, 0.5, 0.5,
-4.614161, -4.430148, 0.2586694, 0, 1.5, 0.5, 0.5
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
-3, -3.274767, -5.003685,
2, -3.274767, -5.003685,
-3, -3.274767, -5.003685,
-3, -3.46733, -5.266803,
-2, -3.274767, -5.003685,
-2, -3.46733, -5.266803,
-1, -3.274767, -5.003685,
-1, -3.46733, -5.266803,
0, -3.274767, -5.003685,
0, -3.46733, -5.266803,
1, -3.274767, -5.003685,
1, -3.46733, -5.266803,
2, -3.274767, -5.003685,
2, -3.46733, -5.266803
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
-3, -3.852457, -5.793038, 0, -0.5, 0.5, 0.5,
-3, -3.852457, -5.793038, 1, -0.5, 0.5, 0.5,
-3, -3.852457, -5.793038, 1, 1.5, 0.5, 0.5,
-3, -3.852457, -5.793038, 0, 1.5, 0.5, 0.5,
-2, -3.852457, -5.793038, 0, -0.5, 0.5, 0.5,
-2, -3.852457, -5.793038, 1, -0.5, 0.5, 0.5,
-2, -3.852457, -5.793038, 1, 1.5, 0.5, 0.5,
-2, -3.852457, -5.793038, 0, 1.5, 0.5, 0.5,
-1, -3.852457, -5.793038, 0, -0.5, 0.5, 0.5,
-1, -3.852457, -5.793038, 1, -0.5, 0.5, 0.5,
-1, -3.852457, -5.793038, 1, 1.5, 0.5, 0.5,
-1, -3.852457, -5.793038, 0, 1.5, 0.5, 0.5,
0, -3.852457, -5.793038, 0, -0.5, 0.5, 0.5,
0, -3.852457, -5.793038, 1, -0.5, 0.5, 0.5,
0, -3.852457, -5.793038, 1, 1.5, 0.5, 0.5,
0, -3.852457, -5.793038, 0, 1.5, 0.5, 0.5,
1, -3.852457, -5.793038, 0, -0.5, 0.5, 0.5,
1, -3.852457, -5.793038, 1, -0.5, 0.5, 0.5,
1, -3.852457, -5.793038, 1, 1.5, 0.5, 0.5,
1, -3.852457, -5.793038, 0, 1.5, 0.5, 0.5,
2, -3.852457, -5.793038, 0, -0.5, 0.5, 0.5,
2, -3.852457, -5.793038, 1, -0.5, 0.5, 0.5,
2, -3.852457, -5.793038, 1, 1.5, 0.5, 0.5,
2, -3.852457, -5.793038, 0, 1.5, 0.5, 0.5
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
-3.631269, -2, -5.003685,
-3.631269, 4, -5.003685,
-3.631269, -2, -5.003685,
-3.795084, -2, -5.266803,
-3.631269, 0, -5.003685,
-3.795084, 0, -5.266803,
-3.631269, 2, -5.003685,
-3.795084, 2, -5.266803,
-3.631269, 4, -5.003685,
-3.795084, 4, -5.266803
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
-4.122715, -2, -5.793038, 0, -0.5, 0.5, 0.5,
-4.122715, -2, -5.793038, 1, -0.5, 0.5, 0.5,
-4.122715, -2, -5.793038, 1, 1.5, 0.5, 0.5,
-4.122715, -2, -5.793038, 0, 1.5, 0.5, 0.5,
-4.122715, 0, -5.793038, 0, -0.5, 0.5, 0.5,
-4.122715, 0, -5.793038, 1, -0.5, 0.5, 0.5,
-4.122715, 0, -5.793038, 1, 1.5, 0.5, 0.5,
-4.122715, 0, -5.793038, 0, 1.5, 0.5, 0.5,
-4.122715, 2, -5.793038, 0, -0.5, 0.5, 0.5,
-4.122715, 2, -5.793038, 1, -0.5, 0.5, 0.5,
-4.122715, 2, -5.793038, 1, 1.5, 0.5, 0.5,
-4.122715, 2, -5.793038, 0, 1.5, 0.5, 0.5,
-4.122715, 4, -5.793038, 0, -0.5, 0.5, 0.5,
-4.122715, 4, -5.793038, 1, -0.5, 0.5, 0.5,
-4.122715, 4, -5.793038, 1, 1.5, 0.5, 0.5,
-4.122715, 4, -5.793038, 0, 1.5, 0.5, 0.5
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
-3.631269, -3.274767, -4,
-3.631269, -3.274767, 4,
-3.631269, -3.274767, -4,
-3.795084, -3.46733, -4,
-3.631269, -3.274767, -2,
-3.795084, -3.46733, -2,
-3.631269, -3.274767, 0,
-3.795084, -3.46733, 0,
-3.631269, -3.274767, 2,
-3.795084, -3.46733, 2,
-3.631269, -3.274767, 4,
-3.795084, -3.46733, 4
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
-4.122715, -3.852457, -4, 0, -0.5, 0.5, 0.5,
-4.122715, -3.852457, -4, 1, -0.5, 0.5, 0.5,
-4.122715, -3.852457, -4, 1, 1.5, 0.5, 0.5,
-4.122715, -3.852457, -4, 0, 1.5, 0.5, 0.5,
-4.122715, -3.852457, -2, 0, -0.5, 0.5, 0.5,
-4.122715, -3.852457, -2, 1, -0.5, 0.5, 0.5,
-4.122715, -3.852457, -2, 1, 1.5, 0.5, 0.5,
-4.122715, -3.852457, -2, 0, 1.5, 0.5, 0.5,
-4.122715, -3.852457, 0, 0, -0.5, 0.5, 0.5,
-4.122715, -3.852457, 0, 1, -0.5, 0.5, 0.5,
-4.122715, -3.852457, 0, 1, 1.5, 0.5, 0.5,
-4.122715, -3.852457, 0, 0, 1.5, 0.5, 0.5,
-4.122715, -3.852457, 2, 0, -0.5, 0.5, 0.5,
-4.122715, -3.852457, 2, 1, -0.5, 0.5, 0.5,
-4.122715, -3.852457, 2, 1, 1.5, 0.5, 0.5,
-4.122715, -3.852457, 2, 0, 1.5, 0.5, 0.5,
-4.122715, -3.852457, 4, 0, -0.5, 0.5, 0.5,
-4.122715, -3.852457, 4, 1, -0.5, 0.5, 0.5,
-4.122715, -3.852457, 4, 1, 1.5, 0.5, 0.5,
-4.122715, -3.852457, 4, 0, 1.5, 0.5, 0.5
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
-3.631269, -3.274767, -5.003685,
-3.631269, 4.427769, -5.003685,
-3.631269, -3.274767, 5.521024,
-3.631269, 4.427769, 5.521024,
-3.631269, -3.274767, -5.003685,
-3.631269, -3.274767, 5.521024,
-3.631269, 4.427769, -5.003685,
-3.631269, 4.427769, 5.521024,
-3.631269, -3.274767, -5.003685,
2.92135, -3.274767, -5.003685,
-3.631269, -3.274767, 5.521024,
2.92135, -3.274767, 5.521024,
-3.631269, 4.427769, -5.003685,
2.92135, 4.427769, -5.003685,
-3.631269, 4.427769, 5.521024,
2.92135, 4.427769, 5.521024,
2.92135, -3.274767, -5.003685,
2.92135, 4.427769, -5.003685,
2.92135, -3.274767, 5.521024,
2.92135, 4.427769, 5.521024,
2.92135, -3.274767, -5.003685,
2.92135, -3.274767, 5.521024,
2.92135, 4.427769, -5.003685,
2.92135, 4.427769, 5.521024
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
var radius = 7.793837;
var distance = 34.67566;
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
mvMatrix.translate( 0.3549592, -0.5765007, -0.2586694 );
mvMatrix.scale( 1.286028, 1.094036, 0.8006729 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.67566);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
ethyl_formate<-read.table("ethyl_formate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethyl_formate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_formate' not found
```

```r
y<-ethyl_formate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_formate' not found
```

```r
z<-ethyl_formate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_formate' not found
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
-3.535842, 0.3396648, -1.051682, 0, 0, 1, 1, 1,
-3.335857, -0.27422, -2.206577, 1, 0, 0, 1, 1,
-3.238695, 0.6615583, -1.286817, 1, 0, 0, 1, 1,
-2.94656, -0.6561031, -3.477994, 1, 0, 0, 1, 1,
-2.776604, 1.482348, -3.167361, 1, 0, 0, 1, 1,
-2.763125, 0.4354101, -0.5134826, 1, 0, 0, 1, 1,
-2.558913, -1.132116, -1.375571, 0, 0, 0, 1, 1,
-2.452799, 0.7724094, -1.799065, 0, 0, 0, 1, 1,
-2.399092, 0.1839144, -2.698706, 0, 0, 0, 1, 1,
-2.196197, 0.4392775, -0.8670706, 0, 0, 0, 1, 1,
-2.177663, -0.3101742, -2.673094, 0, 0, 0, 1, 1,
-2.110048, -1.623159, -2.233772, 0, 0, 0, 1, 1,
-2.109401, -0.5769709, -2.073096, 0, 0, 0, 1, 1,
-2.004817, -0.560523, -1.748814, 1, 1, 1, 1, 1,
-1.990097, 1.419961, -1.106085, 1, 1, 1, 1, 1,
-1.976805, 2.014465, -1.946336, 1, 1, 1, 1, 1,
-1.97385, 1.045019, 0.4545079, 1, 1, 1, 1, 1,
-1.960109, 0.300047, -1.585054, 1, 1, 1, 1, 1,
-1.955804, 0.7768157, -0.5343953, 1, 1, 1, 1, 1,
-1.954703, 0.7015585, -0.1038313, 1, 1, 1, 1, 1,
-1.951381, -0.7535784, -1.376543, 1, 1, 1, 1, 1,
-1.924883, -0.06516354, -0.4990388, 1, 1, 1, 1, 1,
-1.904663, -1.396159, -0.7719217, 1, 1, 1, 1, 1,
-1.900467, -1.583829, -1.719056, 1, 1, 1, 1, 1,
-1.887413, 0.2984823, -1.644547, 1, 1, 1, 1, 1,
-1.878091, -0.6931404, -2.156229, 1, 1, 1, 1, 1,
-1.870128, -0.1710204, -4.290831, 1, 1, 1, 1, 1,
-1.857278, 0.5513373, -0.5378223, 1, 1, 1, 1, 1,
-1.837964, 0.8396172, 0.2998608, 0, 0, 1, 1, 1,
-1.822511, 0.7270941, -2.636425, 1, 0, 0, 1, 1,
-1.817767, -0.5513766, -4.250978, 1, 0, 0, 1, 1,
-1.810068, -0.5881736, -0.7650996, 1, 0, 0, 1, 1,
-1.748843, 0.04314345, -4.34398, 1, 0, 0, 1, 1,
-1.724785, 0.3143629, -1.335115, 1, 0, 0, 1, 1,
-1.723008, 2.102002, -1.39165, 0, 0, 0, 1, 1,
-1.711028, 1.505399, -0.3905016, 0, 0, 0, 1, 1,
-1.704961, -1.000767, -0.8638816, 0, 0, 0, 1, 1,
-1.686956, 0.8787208, -0.8773374, 0, 0, 0, 1, 1,
-1.683995, -0.4698151, -2.611044, 0, 0, 0, 1, 1,
-1.679465, -0.9731459, -1.874014, 0, 0, 0, 1, 1,
-1.661898, -0.1391439, -1.143393, 0, 0, 0, 1, 1,
-1.65724, -0.4705395, -2.921345, 1, 1, 1, 1, 1,
-1.63582, 1.00443, -0.5088199, 1, 1, 1, 1, 1,
-1.632495, -0.6899526, -2.684792, 1, 1, 1, 1, 1,
-1.627179, -0.4215273, -0.0001142176, 1, 1, 1, 1, 1,
-1.610447, 1.543601, -0.9188818, 1, 1, 1, 1, 1,
-1.604469, 0.284103, -0.280706, 1, 1, 1, 1, 1,
-1.59624, -0.5828363, -2.532336, 1, 1, 1, 1, 1,
-1.587318, 1.267749, -0.6380727, 1, 1, 1, 1, 1,
-1.5844, -0.2553284, -2.528403, 1, 1, 1, 1, 1,
-1.557288, -1.050559, -1.66774, 1, 1, 1, 1, 1,
-1.550725, 0.6446601, -0.6179327, 1, 1, 1, 1, 1,
-1.539919, -1.599089, -0.4372848, 1, 1, 1, 1, 1,
-1.52693, -0.1037771, -2.437017, 1, 1, 1, 1, 1,
-1.523357, -0.4196179, -1.633997, 1, 1, 1, 1, 1,
-1.514905, 0.9109581, -1.271641, 1, 1, 1, 1, 1,
-1.505459, -0.8600606, -1.097441, 0, 0, 1, 1, 1,
-1.498097, 0.5956163, -0.2166322, 1, 0, 0, 1, 1,
-1.47253, -1.120014, -2.099821, 1, 0, 0, 1, 1,
-1.471328, 0.355848, -2.496204, 1, 0, 0, 1, 1,
-1.470588, 1.178095, -0.641079, 1, 0, 0, 1, 1,
-1.460822, -0.9737746, -2.598696, 1, 0, 0, 1, 1,
-1.454082, 0.05796704, -0.8734522, 0, 0, 0, 1, 1,
-1.447371, -0.6443939, -0.5731509, 0, 0, 0, 1, 1,
-1.444541, -1.226493, -2.869772, 0, 0, 0, 1, 1,
-1.438358, -0.2174758, -3.498055, 0, 0, 0, 1, 1,
-1.42451, 0.1317202, -0.06463378, 0, 0, 0, 1, 1,
-1.423871, -0.2330414, -0.6947034, 0, 0, 0, 1, 1,
-1.421997, -1.122758, -2.106761, 0, 0, 0, 1, 1,
-1.414735, -1.03513, -3.049098, 1, 1, 1, 1, 1,
-1.409715, 1.417631, -0.8077231, 1, 1, 1, 1, 1,
-1.408402, 0.7365725, -0.5704179, 1, 1, 1, 1, 1,
-1.401447, 0.6312045, -1.645386, 1, 1, 1, 1, 1,
-1.39264, 0.2827795, -2.98499, 1, 1, 1, 1, 1,
-1.391925, -0.183552, -1.26722, 1, 1, 1, 1, 1,
-1.389909, -0.4832574, -1.509995, 1, 1, 1, 1, 1,
-1.38734, 0.9617086, -2.886545, 1, 1, 1, 1, 1,
-1.375444, -1.926457, -1.974975, 1, 1, 1, 1, 1,
-1.37237, -2.234013, -3.588905, 1, 1, 1, 1, 1,
-1.37027, -0.3008341, -2.108395, 1, 1, 1, 1, 1,
-1.352078, -0.205754, -3.236797, 1, 1, 1, 1, 1,
-1.340506, -1.213932, -3.78041, 1, 1, 1, 1, 1,
-1.33026, 0.646602, -0.7565365, 1, 1, 1, 1, 1,
-1.324589, -0.7348755, -2.151562, 1, 1, 1, 1, 1,
-1.322217, 0.2005963, -1.670818, 0, 0, 1, 1, 1,
-1.314541, 0.6093129, 0.5502941, 1, 0, 0, 1, 1,
-1.306422, -0.125629, -0.8620278, 1, 0, 0, 1, 1,
-1.306214, -1.310604, -3.388438, 1, 0, 0, 1, 1,
-1.302078, -2.183123, -1.973585, 1, 0, 0, 1, 1,
-1.299765, 0.09225137, -0.9952489, 1, 0, 0, 1, 1,
-1.299649, 1.977479, 1.715917, 0, 0, 0, 1, 1,
-1.2843, 1.551791, -0.9805276, 0, 0, 0, 1, 1,
-1.261417, 0.8286972, -2.174073, 0, 0, 0, 1, 1,
-1.259532, -1.325564, -3.496542, 0, 0, 0, 1, 1,
-1.258139, -0.8080376, -2.836825, 0, 0, 0, 1, 1,
-1.256519, -1.816868, -0.6622369, 0, 0, 0, 1, 1,
-1.252677, -0.4393677, -2.064893, 0, 0, 0, 1, 1,
-1.244644, 1.609434, -0.4715453, 1, 1, 1, 1, 1,
-1.236741, 0.2454248, -1.978554, 1, 1, 1, 1, 1,
-1.236115, -0.8104951, -2.521312, 1, 1, 1, 1, 1,
-1.233484, -0.2380518, -0.8608632, 1, 1, 1, 1, 1,
-1.227896, -0.3113656, -3.231702, 1, 1, 1, 1, 1,
-1.203586, 1.081272, -2.224978, 1, 1, 1, 1, 1,
-1.188921, 0.645825, -0.06379527, 1, 1, 1, 1, 1,
-1.184077, 1.365486, -1.176611, 1, 1, 1, 1, 1,
-1.183911, -1.371696, -3.851052, 1, 1, 1, 1, 1,
-1.181365, -0.7016949, -2.747973, 1, 1, 1, 1, 1,
-1.168069, -1.180541, -0.8880193, 1, 1, 1, 1, 1,
-1.161152, 0.9162208, -1.337471, 1, 1, 1, 1, 1,
-1.161045, 0.6022084, -0.3238976, 1, 1, 1, 1, 1,
-1.160293, -2.269113, -1.49818, 1, 1, 1, 1, 1,
-1.150737, 0.0404567, -1.929621, 1, 1, 1, 1, 1,
-1.15028, 0.3520668, -2.054908, 0, 0, 1, 1, 1,
-1.146725, -1.32611, -3.538548, 1, 0, 0, 1, 1,
-1.141173, 0.4887784, -1.511373, 1, 0, 0, 1, 1,
-1.134534, -0.3959205, -2.209155, 1, 0, 0, 1, 1,
-1.131594, 0.50533, -2.015047, 1, 0, 0, 1, 1,
-1.128925, 1.126603, 0.170078, 1, 0, 0, 1, 1,
-1.12875, -0.5589172, -3.063404, 0, 0, 0, 1, 1,
-1.123381, 0.06756297, -2.76328, 0, 0, 0, 1, 1,
-1.113569, 1.347836, -1.66999, 0, 0, 0, 1, 1,
-1.111874, 0.4354304, -1.782169, 0, 0, 0, 1, 1,
-1.110832, -0.917035, -3.609804, 0, 0, 0, 1, 1,
-1.101674, 0.2162361, -1.051322, 0, 0, 0, 1, 1,
-1.093556, -0.5838764, -2.288053, 0, 0, 0, 1, 1,
-1.09017, -0.4826182, -0.1800821, 1, 1, 1, 1, 1,
-1.084412, -1.782075, -1.923185, 1, 1, 1, 1, 1,
-1.077976, -0.9302585, -3.315422, 1, 1, 1, 1, 1,
-1.075491, -0.1040962, -1.103191, 1, 1, 1, 1, 1,
-1.065902, -0.3284318, -1.196176, 1, 1, 1, 1, 1,
-1.065562, 0.6473985, -1.692611, 1, 1, 1, 1, 1,
-1.062483, 0.7379553, -0.5228775, 1, 1, 1, 1, 1,
-1.055219, -0.02965629, -0.8493066, 1, 1, 1, 1, 1,
-1.052264, -1.350436, -1.263837, 1, 1, 1, 1, 1,
-1.05003, -0.5244896, -3.136249, 1, 1, 1, 1, 1,
-1.03085, -1.204224, -2.209079, 1, 1, 1, 1, 1,
-1.019855, -0.02863641, -1.347112, 1, 1, 1, 1, 1,
-1.016543, 0.8341633, 0.6768723, 1, 1, 1, 1, 1,
-1.015526, -0.4380397, -1.664272, 1, 1, 1, 1, 1,
-1.015093, 1.104859, 0.1429507, 1, 1, 1, 1, 1,
-1.013032, 0.5557705, 0.01294759, 0, 0, 1, 1, 1,
-1.012734, -0.124967, -1.380742, 1, 0, 0, 1, 1,
-0.9965982, -0.2092933, -0.3666475, 1, 0, 0, 1, 1,
-0.9957182, 1.057298, -0.08662743, 1, 0, 0, 1, 1,
-0.9930224, 0.7506692, -2.610071, 1, 0, 0, 1, 1,
-0.9904781, -0.9081919, -2.401459, 1, 0, 0, 1, 1,
-0.9899987, 1.202902, -0.00816505, 0, 0, 0, 1, 1,
-0.9883195, -0.9704244, -2.487261, 0, 0, 0, 1, 1,
-0.9860726, 2.075481, -0.003308382, 0, 0, 0, 1, 1,
-0.9839447, -1.476756, -1.69892, 0, 0, 0, 1, 1,
-0.9800877, 0.8596834, -0.9208651, 0, 0, 0, 1, 1,
-0.979885, 0.9122035, 0.8524751, 0, 0, 0, 1, 1,
-0.9765083, 0.5065244, 0.3895285, 0, 0, 0, 1, 1,
-0.9744658, 0.6117324, -1.200663, 1, 1, 1, 1, 1,
-0.9702763, 2.674462, 0.7033187, 1, 1, 1, 1, 1,
-0.9633192, -0.3615109, -3.442633, 1, 1, 1, 1, 1,
-0.9569713, 2.103721, -1.29361, 1, 1, 1, 1, 1,
-0.9540938, -1.235788, -2.748312, 1, 1, 1, 1, 1,
-0.9505944, -0.176535, -1.484045, 1, 1, 1, 1, 1,
-0.9464602, 1.382504, -2.063794, 1, 1, 1, 1, 1,
-0.9430853, -0.524706, -2.692447, 1, 1, 1, 1, 1,
-0.9430721, -0.466473, -1.413574, 1, 1, 1, 1, 1,
-0.9420255, -0.0480903, -1.201398, 1, 1, 1, 1, 1,
-0.939474, -3.162594, -3.388259, 1, 1, 1, 1, 1,
-0.938651, -0.6384422, -2.379558, 1, 1, 1, 1, 1,
-0.9361784, -0.3889814, -2.518979, 1, 1, 1, 1, 1,
-0.9360055, 1.425034, -0.2983898, 1, 1, 1, 1, 1,
-0.935451, -0.1318276, -3.08716, 1, 1, 1, 1, 1,
-0.9333059, -0.684469, -2.380374, 0, 0, 1, 1, 1,
-0.9297319, 0.1713831, -1.853003, 1, 0, 0, 1, 1,
-0.9293752, -0.3124936, -2.362062, 1, 0, 0, 1, 1,
-0.9282491, -1.461774, -0.912989, 1, 0, 0, 1, 1,
-0.9270191, 0.02349666, -1.911356, 1, 0, 0, 1, 1,
-0.9260684, 1.19556, -0.9578567, 1, 0, 0, 1, 1,
-0.9234298, 0.2963929, -0.8966978, 0, 0, 0, 1, 1,
-0.9214772, -1.601069, -2.926746, 0, 0, 0, 1, 1,
-0.9169855, -0.4323545, -0.85077, 0, 0, 0, 1, 1,
-0.9151407, -1.357157, -4.353071, 0, 0, 0, 1, 1,
-0.9056051, -0.6626729, -1.738469, 0, 0, 0, 1, 1,
-0.9012485, -0.75553, -0.3383864, 0, 0, 0, 1, 1,
-0.8974437, 0.3389421, -1.18406, 0, 0, 0, 1, 1,
-0.8960644, 1.825594, 0.0494526, 1, 1, 1, 1, 1,
-0.8912393, 0.9387243, -0.2975705, 1, 1, 1, 1, 1,
-0.8899209, 1.063468, 1.228683, 1, 1, 1, 1, 1,
-0.8858313, 0.09403652, -2.021366, 1, 1, 1, 1, 1,
-0.8824456, -0.2104191, -1.304759, 1, 1, 1, 1, 1,
-0.8817145, 0.7519841, -1.236374, 1, 1, 1, 1, 1,
-0.8808782, -0.292982, -0.962162, 1, 1, 1, 1, 1,
-0.8782008, -0.4936194, -1.759705, 1, 1, 1, 1, 1,
-0.8684845, -0.155951, -1.462997, 1, 1, 1, 1, 1,
-0.8642576, -0.1170802, -0.9888461, 1, 1, 1, 1, 1,
-0.8628536, 0.1223932, -0.9432074, 1, 1, 1, 1, 1,
-0.8562238, 0.2913836, -1.401399, 1, 1, 1, 1, 1,
-0.856141, -0.8765479, -2.222003, 1, 1, 1, 1, 1,
-0.8538603, -1.361312, -3.413035, 1, 1, 1, 1, 1,
-0.8527215, -1.010605, -3.283525, 1, 1, 1, 1, 1,
-0.8515716, 0.6550947, -0.1825915, 0, 0, 1, 1, 1,
-0.8480065, -0.6038802, -2.404038, 1, 0, 0, 1, 1,
-0.8420789, 0.1861296, -1.533014, 1, 0, 0, 1, 1,
-0.8408905, 1.511393, -1.120807, 1, 0, 0, 1, 1,
-0.8340133, 0.3494325, -2.238278, 1, 0, 0, 1, 1,
-0.8330108, -0.3568221, -1.946083, 1, 0, 0, 1, 1,
-0.8327366, 0.5815145, -0.6706022, 0, 0, 0, 1, 1,
-0.8322623, 1.960692, -0.8549945, 0, 0, 0, 1, 1,
-0.8311065, 0.02326629, -1.250846, 0, 0, 0, 1, 1,
-0.8295633, 0.143629, -1.73686, 0, 0, 0, 1, 1,
-0.8274353, -0.5841099, -1.543821, 0, 0, 0, 1, 1,
-0.8230767, 1.904538, 0.6227794, 0, 0, 0, 1, 1,
-0.8179204, -0.5562639, -0.5561511, 0, 0, 0, 1, 1,
-0.8163607, -1.109237, -3.442548, 1, 1, 1, 1, 1,
-0.814015, 0.2672022, -3.635875, 1, 1, 1, 1, 1,
-0.8118759, 0.66618, -0.8858467, 1, 1, 1, 1, 1,
-0.8076152, -0.2347978, -1.727536, 1, 1, 1, 1, 1,
-0.8071887, 0.3664008, -2.193702, 1, 1, 1, 1, 1,
-0.8036761, -1.186622, -3.181173, 1, 1, 1, 1, 1,
-0.8003579, 0.1544619, -1.369404, 1, 1, 1, 1, 1,
-0.8000225, -0.1226379, -2.201121, 1, 1, 1, 1, 1,
-0.7937201, -1.017431, -3.628057, 1, 1, 1, 1, 1,
-0.7927898, 0.8704823, -0.7720013, 1, 1, 1, 1, 1,
-0.7918012, -0.3404835, -0.3566888, 1, 1, 1, 1, 1,
-0.7900544, 0.5225285, -1.574587, 1, 1, 1, 1, 1,
-0.7891924, -1.175482, -2.12816, 1, 1, 1, 1, 1,
-0.7828858, 0.8099549, -0.07430992, 1, 1, 1, 1, 1,
-0.7818501, 0.5094869, 1.305132, 1, 1, 1, 1, 1,
-0.7798637, -0.3874853, -2.236623, 0, 0, 1, 1, 1,
-0.7776118, -1.158392, -3.518453, 1, 0, 0, 1, 1,
-0.7735285, -0.2358535, -1.889625, 1, 0, 0, 1, 1,
-0.7733275, -0.9385023, -2.445546, 1, 0, 0, 1, 1,
-0.7608284, 0.9464737, -2.370083, 1, 0, 0, 1, 1,
-0.7602594, 1.218235, -0.3711731, 1, 0, 0, 1, 1,
-0.7563425, 0.1945162, -0.9209199, 0, 0, 0, 1, 1,
-0.7542145, -0.4886996, -1.930328, 0, 0, 0, 1, 1,
-0.7490894, 0.3123136, -0.9120935, 0, 0, 0, 1, 1,
-0.7440287, 1.243541, -0.5455486, 0, 0, 0, 1, 1,
-0.7439203, -1.013554, -4.850413, 0, 0, 0, 1, 1,
-0.7419246, 1.006695, -0.09787153, 0, 0, 0, 1, 1,
-0.734561, 0.3262381, -3.416432, 0, 0, 0, 1, 1,
-0.7341009, 0.2222266, -0.7741466, 1, 1, 1, 1, 1,
-0.7322648, -0.6069543, -4.14884, 1, 1, 1, 1, 1,
-0.7295452, 0.7582765, -0.2224319, 1, 1, 1, 1, 1,
-0.7290807, -0.530217, -3.033806, 1, 1, 1, 1, 1,
-0.7271383, 0.83446, -2.192148, 1, 1, 1, 1, 1,
-0.7265342, -0.3878021, 0.9179782, 1, 1, 1, 1, 1,
-0.7249405, 0.1913939, -0.463052, 1, 1, 1, 1, 1,
-0.724337, -3.116173, -2.142045, 1, 1, 1, 1, 1,
-0.7210969, 0.4034776, -0.6651189, 1, 1, 1, 1, 1,
-0.7194189, 0.06341645, -1.054627, 1, 1, 1, 1, 1,
-0.7010916, 0.6213522, -2.076197, 1, 1, 1, 1, 1,
-0.6930022, 0.1210392, -0.9558927, 1, 1, 1, 1, 1,
-0.6896226, -0.8892062, -1.539902, 1, 1, 1, 1, 1,
-0.6891922, -2.100116, -0.4460821, 1, 1, 1, 1, 1,
-0.688015, 0.1908818, -1.121115, 1, 1, 1, 1, 1,
-0.685745, -0.3101039, -0.5398045, 0, 0, 1, 1, 1,
-0.6777521, 0.3023411, -1.151736, 1, 0, 0, 1, 1,
-0.6728714, -0.5857062, -1.582197, 1, 0, 0, 1, 1,
-0.6658038, 0.4706017, -2.843185, 1, 0, 0, 1, 1,
-0.6655164, -0.4692801, -1.528923, 1, 0, 0, 1, 1,
-0.6632476, -1.568701, -1.987725, 1, 0, 0, 1, 1,
-0.6626876, -2.105593, -3.912138, 0, 0, 0, 1, 1,
-0.6621111, -0.2240346, -2.257909, 0, 0, 0, 1, 1,
-0.6602439, -0.1303481, -1.197104, 0, 0, 0, 1, 1,
-0.6602078, 0.07086755, -3.295732, 0, 0, 0, 1, 1,
-0.6549674, 0.7257294, -0.2931863, 0, 0, 0, 1, 1,
-0.6530278, 1.09767, -1.878779, 0, 0, 0, 1, 1,
-0.649206, 0.7120612, 0.2764397, 0, 0, 0, 1, 1,
-0.6478907, -0.8714523, -1.246132, 1, 1, 1, 1, 1,
-0.6468325, -0.44137, -2.750558, 1, 1, 1, 1, 1,
-0.6411327, -0.4207156, -2.436163, 1, 1, 1, 1, 1,
-0.6404276, -0.8066, -1.752563, 1, 1, 1, 1, 1,
-0.6361409, 0.7488595, -0.5026283, 1, 1, 1, 1, 1,
-0.6351233, 4.315596, -1.085631, 1, 1, 1, 1, 1,
-0.632718, 0.0877988, -0.6519726, 1, 1, 1, 1, 1,
-0.6246721, 1.353655, -0.7060783, 1, 1, 1, 1, 1,
-0.6232872, 0.1182773, -1.847404, 1, 1, 1, 1, 1,
-0.6219776, 0.4253659, -2.565799, 1, 1, 1, 1, 1,
-0.6209685, -0.6486406, -2.973192, 1, 1, 1, 1, 1,
-0.6177579, 1.872782, 0.0001337463, 1, 1, 1, 1, 1,
-0.6168167, 0.7153298, -0.1065135, 1, 1, 1, 1, 1,
-0.611562, 1.686028, -0.2731408, 1, 1, 1, 1, 1,
-0.6092692, -0.7035187, -2.40342, 1, 1, 1, 1, 1,
-0.6060974, 1.02991, -0.471284, 0, 0, 1, 1, 1,
-0.6046661, 0.1838171, -1.03474, 1, 0, 0, 1, 1,
-0.6036266, -0.4131417, -2.399964, 1, 0, 0, 1, 1,
-0.6034933, 0.1928508, -1.445596, 1, 0, 0, 1, 1,
-0.6010666, 0.5118819, -2.543667, 1, 0, 0, 1, 1,
-0.5977999, -1.057544, -2.572685, 1, 0, 0, 1, 1,
-0.5975634, -0.09328527, -1.532263, 0, 0, 0, 1, 1,
-0.5950977, -0.1233973, -0.5217031, 0, 0, 0, 1, 1,
-0.5921586, -1.490744, -4.554929, 0, 0, 0, 1, 1,
-0.5895765, -0.367926, -3.775121, 0, 0, 0, 1, 1,
-0.5865583, -0.5114736, -1.721565, 0, 0, 0, 1, 1,
-0.583603, 0.7429343, -2.219052, 0, 0, 0, 1, 1,
-0.5769464, 0.7049906, -0.3540902, 0, 0, 0, 1, 1,
-0.5747517, 0.3667574, -0.5320599, 1, 1, 1, 1, 1,
-0.569465, -0.08188356, -0.9675124, 1, 1, 1, 1, 1,
-0.5642908, 2.113961, -0.1288349, 1, 1, 1, 1, 1,
-0.5626891, 0.3557853, -0.6627576, 1, 1, 1, 1, 1,
-0.5536276, 2.287319, -0.3157407, 1, 1, 1, 1, 1,
-0.553417, -1.00543, -2.944999, 1, 1, 1, 1, 1,
-0.5523015, 1.560434, 0.8353198, 1, 1, 1, 1, 1,
-0.5517699, 0.3178179, -1.136211, 1, 1, 1, 1, 1,
-0.55044, -1.945336, -3.977783, 1, 1, 1, 1, 1,
-0.5490609, -1.217925, 0.2292866, 1, 1, 1, 1, 1,
-0.5489559, -0.08136126, -1.188596, 1, 1, 1, 1, 1,
-0.5479254, -0.6726868, -0.8329799, 1, 1, 1, 1, 1,
-0.5424896, 1.072217, -0.8686286, 1, 1, 1, 1, 1,
-0.537955, 1.570656, 0.1787905, 1, 1, 1, 1, 1,
-0.5318664, 0.3513428, -1.706827, 1, 1, 1, 1, 1,
-0.5317144, 0.1597698, -1.973145, 0, 0, 1, 1, 1,
-0.5316781, -0.7032206, -1.317838, 1, 0, 0, 1, 1,
-0.531489, -0.2107506, -1.807913, 1, 0, 0, 1, 1,
-0.5294856, 0.03662355, -2.48655, 1, 0, 0, 1, 1,
-0.5287339, 1.422633, -0.645749, 1, 0, 0, 1, 1,
-0.5281663, 0.8727202, -0.7515728, 1, 0, 0, 1, 1,
-0.5213661, -1.504291, -4.149742, 0, 0, 0, 1, 1,
-0.5187582, -0.4674149, -4.17172, 0, 0, 0, 1, 1,
-0.5176789, 0.4466194, -1.283241, 0, 0, 0, 1, 1,
-0.5148714, 0.3715908, -0.937595, 0, 0, 0, 1, 1,
-0.513811, -0.493203, -3.616149, 0, 0, 0, 1, 1,
-0.5071236, 1.179056, 0.03878573, 0, 0, 0, 1, 1,
-0.5056449, 2.18148, 0.3347941, 0, 0, 0, 1, 1,
-0.5052673, -0.4703847, -1.875801, 1, 1, 1, 1, 1,
-0.5044538, -1.048797, -2.405468, 1, 1, 1, 1, 1,
-0.5027505, -0.629536, -1.915412, 1, 1, 1, 1, 1,
-0.5009472, -0.1363549, -2.111099, 1, 1, 1, 1, 1,
-0.5006891, -0.07608906, -1.066812, 1, 1, 1, 1, 1,
-0.4929946, -0.3117893, -3.240531, 1, 1, 1, 1, 1,
-0.4916714, 1.048791, 0.6566464, 1, 1, 1, 1, 1,
-0.4897889, -2.227072, -3.347059, 1, 1, 1, 1, 1,
-0.4858948, 0.8506109, -2.042238, 1, 1, 1, 1, 1,
-0.4857901, -1.575034, -3.603128, 1, 1, 1, 1, 1,
-0.4854113, -0.8723496, -2.360194, 1, 1, 1, 1, 1,
-0.4847174, -1.626923, -1.903297, 1, 1, 1, 1, 1,
-0.4794954, 0.4080763, -0.832358, 1, 1, 1, 1, 1,
-0.4761286, -0.835005, -2.874469, 1, 1, 1, 1, 1,
-0.4755432, -0.02005981, -1.530013, 1, 1, 1, 1, 1,
-0.4723481, -0.4729731, 0.8881922, 0, 0, 1, 1, 1,
-0.4714574, -0.3482905, -2.411599, 1, 0, 0, 1, 1,
-0.4701878, 0.4401015, -0.6430798, 1, 0, 0, 1, 1,
-0.4685298, 0.9393783, -1.054214, 1, 0, 0, 1, 1,
-0.465988, -1.223525, -2.403051, 1, 0, 0, 1, 1,
-0.4656449, 0.3042478, -1.780485, 1, 0, 0, 1, 1,
-0.4633452, -0.2023268, -1.938983, 0, 0, 0, 1, 1,
-0.4616353, -0.1686351, -1.201909, 0, 0, 0, 1, 1,
-0.457559, -0.412607, -2.551939, 0, 0, 0, 1, 1,
-0.4548228, 0.1892522, -2.640531, 0, 0, 0, 1, 1,
-0.4537178, 0.2970976, -0.6947075, 0, 0, 0, 1, 1,
-0.4535452, 0.2979477, -1.422683, 0, 0, 0, 1, 1,
-0.4528067, 0.5066911, -0.3247601, 0, 0, 0, 1, 1,
-0.4465386, 0.3058342, -0.9851037, 1, 1, 1, 1, 1,
-0.4429424, -1.663105, -1.616319, 1, 1, 1, 1, 1,
-0.439138, -0.4469842, -3.845916, 1, 1, 1, 1, 1,
-0.4347296, -0.2517517, -1.855908, 1, 1, 1, 1, 1,
-0.4331148, -2.218119, -3.430349, 1, 1, 1, 1, 1,
-0.4327433, -0.04391855, 0.1131717, 1, 1, 1, 1, 1,
-0.4325834, 0.3206272, -1.781331, 1, 1, 1, 1, 1,
-0.4322133, 0.6792137, -1.697661, 1, 1, 1, 1, 1,
-0.4217245, 0.593432, -2.001521, 1, 1, 1, 1, 1,
-0.4216223, -0.04944241, -0.8719494, 1, 1, 1, 1, 1,
-0.415162, 1.633766, 0.7512553, 1, 1, 1, 1, 1,
-0.4110322, -0.2682999, -3.57741, 1, 1, 1, 1, 1,
-0.4086401, 0.7912392, -0.4589497, 1, 1, 1, 1, 1,
-0.4049672, 0.5830966, -2.746333, 1, 1, 1, 1, 1,
-0.3936583, -2.370425, -2.858024, 1, 1, 1, 1, 1,
-0.3931224, 0.2553471, -0.9476198, 0, 0, 1, 1, 1,
-0.3914425, 2.511815, -1.099422, 1, 0, 0, 1, 1,
-0.3907589, 0.1825197, 0.2896038, 1, 0, 0, 1, 1,
-0.3895959, 0.3044277, -0.8893422, 1, 0, 0, 1, 1,
-0.3857588, 0.7156736, -1.706838, 1, 0, 0, 1, 1,
-0.3857052, -1.100551, -1.056649, 1, 0, 0, 1, 1,
-0.3851396, 1.692303, -1.34538, 0, 0, 0, 1, 1,
-0.3842506, 0.3531831, -1.078963, 0, 0, 0, 1, 1,
-0.3772523, -0.4229428, -2.120929, 0, 0, 0, 1, 1,
-0.3759383, 1.138181, 0.006488082, 0, 0, 0, 1, 1,
-0.3722932, -1.186845, -3.068566, 0, 0, 0, 1, 1,
-0.3713195, 0.1660965, -2.083579, 0, 0, 0, 1, 1,
-0.3704812, -0.2911467, -1.715289, 0, 0, 0, 1, 1,
-0.3704438, -0.8605983, -2.83728, 1, 1, 1, 1, 1,
-0.3646483, -0.6781424, -1.423393, 1, 1, 1, 1, 1,
-0.3627827, -1.168029, -2.653884, 1, 1, 1, 1, 1,
-0.3603764, 0.7738271, 0.2283748, 1, 1, 1, 1, 1,
-0.358347, -0.6998199, -3.464462, 1, 1, 1, 1, 1,
-0.356079, -0.5383474, -2.647264, 1, 1, 1, 1, 1,
-0.3529589, -0.4797019, -3.550313, 1, 1, 1, 1, 1,
-0.3484588, -0.6238229, -1.784205, 1, 1, 1, 1, 1,
-0.3480654, 1.283183, 0.04985192, 1, 1, 1, 1, 1,
-0.343846, 0.5697482, -1.376127, 1, 1, 1, 1, 1,
-0.3413717, 1.578482, -0.07782616, 1, 1, 1, 1, 1,
-0.3326175, 1.394871, -1.171054, 1, 1, 1, 1, 1,
-0.3321593, -0.133546, -1.834009, 1, 1, 1, 1, 1,
-0.3305176, 0.1076398, -2.532497, 1, 1, 1, 1, 1,
-0.3293454, 0.339091, 0.2798563, 1, 1, 1, 1, 1,
-0.3283896, -0.7758875, -2.313612, 0, 0, 1, 1, 1,
-0.3264542, -0.2108326, -2.888092, 1, 0, 0, 1, 1,
-0.3237352, 1.288109, -1.133353, 1, 0, 0, 1, 1,
-0.3226601, 0.5388224, -0.3258355, 1, 0, 0, 1, 1,
-0.3214303, -0.7150319, -2.029698, 1, 0, 0, 1, 1,
-0.3200041, -2.230834, -4.18693, 1, 0, 0, 1, 1,
-0.3197122, -1.423678, -1.670966, 0, 0, 0, 1, 1,
-0.3187132, 0.1736775, 2.595685, 0, 0, 0, 1, 1,
-0.3130185, -0.2226802, -2.384081, 0, 0, 0, 1, 1,
-0.3096345, 0.00630511, 0.2964326, 0, 0, 0, 1, 1,
-0.309393, 1.251828, -1.22263, 0, 0, 0, 1, 1,
-0.3049096, 0.8985991, -0.4983386, 0, 0, 0, 1, 1,
-0.3039264, 0.5022976, 0.4568683, 0, 0, 0, 1, 1,
-0.3028624, 0.9831535, -2.033077, 1, 1, 1, 1, 1,
-0.3003729, -0.6833457, -3.556219, 1, 1, 1, 1, 1,
-0.2995749, -0.4931982, -0.4150092, 1, 1, 1, 1, 1,
-0.2979938, 2.454447, 0.2118511, 1, 1, 1, 1, 1,
-0.2973537, -0.3147941, -1.810018, 1, 1, 1, 1, 1,
-0.2844918, 0.3466929, -0.2227677, 1, 1, 1, 1, 1,
-0.2783508, 1.202728, -0.1586306, 1, 1, 1, 1, 1,
-0.2770249, 0.3902085, 0.9075906, 1, 1, 1, 1, 1,
-0.2750692, -0.5252379, -3.061937, 1, 1, 1, 1, 1,
-0.2731182, -1.699841, -2.784246, 1, 1, 1, 1, 1,
-0.2658141, 0.3214467, -1.13111, 1, 1, 1, 1, 1,
-0.2601081, 0.1117346, -0.5052196, 1, 1, 1, 1, 1,
-0.2560994, -0.9995186, -1.281486, 1, 1, 1, 1, 1,
-0.2552773, -0.7845287, -2.03579, 1, 1, 1, 1, 1,
-0.254337, -0.6382905, -3.146179, 1, 1, 1, 1, 1,
-0.2520543, -1.636231, -4.330164, 0, 0, 1, 1, 1,
-0.2515694, 0.216984, -1.099112, 1, 0, 0, 1, 1,
-0.249857, 0.0901105, -0.6533336, 1, 0, 0, 1, 1,
-0.2487809, -0.2264275, -1.704055, 1, 0, 0, 1, 1,
-0.2428737, -1.178951, -3.952042, 1, 0, 0, 1, 1,
-0.2420239, 0.7153098, 0.2408935, 1, 0, 0, 1, 1,
-0.2420053, -1.530424, -2.859397, 0, 0, 0, 1, 1,
-0.240905, -0.1642686, -3.581502, 0, 0, 0, 1, 1,
-0.2381323, 0.4289332, -0.1331981, 0, 0, 0, 1, 1,
-0.2302247, 0.3089805, -0.925341, 0, 0, 0, 1, 1,
-0.2281257, -0.9813116, -3.41576, 0, 0, 0, 1, 1,
-0.2230249, -0.2150903, -0.3789773, 0, 0, 0, 1, 1,
-0.2220584, -0.4943549, -3.806755, 0, 0, 0, 1, 1,
-0.2191272, 1.300222, -0.8875463, 1, 1, 1, 1, 1,
-0.2145386, 0.5079894, -1.597576, 1, 1, 1, 1, 1,
-0.2142429, 0.1620165, -0.004333382, 1, 1, 1, 1, 1,
-0.2132059, -1.378594, -3.388817, 1, 1, 1, 1, 1,
-0.2123349, 1.222695, -0.1236551, 1, 1, 1, 1, 1,
-0.206414, 2.071256, 0.1965441, 1, 1, 1, 1, 1,
-0.2048211, 0.4715021, -1.112628, 1, 1, 1, 1, 1,
-0.2032079, 0.8178972, 0.118305, 1, 1, 1, 1, 1,
-0.2027399, 0.3435232, -0.2932775, 1, 1, 1, 1, 1,
-0.2012358, -0.8505402, -4.610303, 1, 1, 1, 1, 1,
-0.1998152, -0.3442125, -1.215301, 1, 1, 1, 1, 1,
-0.1975789, 1.295454, 0.4800114, 1, 1, 1, 1, 1,
-0.1943288, 0.5575323, -0.0165964, 1, 1, 1, 1, 1,
-0.1862876, -0.530765, -1.465961, 1, 1, 1, 1, 1,
-0.1845781, -2.118176, -2.426305, 1, 1, 1, 1, 1,
-0.1840682, 0.3683553, -1.122947, 0, 0, 1, 1, 1,
-0.1789071, 1.301394, -1.145179, 1, 0, 0, 1, 1,
-0.178669, 0.7753823, -1.540285, 1, 0, 0, 1, 1,
-0.1746731, -0.4365794, -1.632372, 1, 0, 0, 1, 1,
-0.1742555, -0.196691, -3.259425, 1, 0, 0, 1, 1,
-0.1733606, -1.433659, -2.578434, 1, 0, 0, 1, 1,
-0.1622227, 0.1452878, -1.428941, 0, 0, 0, 1, 1,
-0.1604017, 2.088598, -0.1342407, 0, 0, 0, 1, 1,
-0.1603541, 0.8721119, -0.5702009, 0, 0, 0, 1, 1,
-0.1601423, -0.6901214, -3.73117, 0, 0, 0, 1, 1,
-0.14988, -0.3993917, -3.667579, 0, 0, 0, 1, 1,
-0.148435, -0.1585123, -1.648984, 0, 0, 0, 1, 1,
-0.1438885, 2.759434, -3.655914, 0, 0, 0, 1, 1,
-0.1420372, -0.9503728, -2.444262, 1, 1, 1, 1, 1,
-0.1387987, 1.737529, -0.4905376, 1, 1, 1, 1, 1,
-0.1387803, 1.49236, 0.1777876, 1, 1, 1, 1, 1,
-0.1344231, -0.50361, -2.587203, 1, 1, 1, 1, 1,
-0.1341841, 0.06367104, -1.799006, 1, 1, 1, 1, 1,
-0.130549, 0.8574228, -0.4294061, 1, 1, 1, 1, 1,
-0.1295733, 1.981728, -0.2402363, 1, 1, 1, 1, 1,
-0.1264663, -0.9151924, -3.705088, 1, 1, 1, 1, 1,
-0.1259217, 0.3601676, 0.9186176, 1, 1, 1, 1, 1,
-0.125689, 0.5120016, -2.004115, 1, 1, 1, 1, 1,
-0.1233505, 0.2741734, -2.254729, 1, 1, 1, 1, 1,
-0.1226193, 0.6847381, -0.00958903, 1, 1, 1, 1, 1,
-0.1220209, -0.6688957, -2.124336, 1, 1, 1, 1, 1,
-0.1213153, -2.726457, -4.753636, 1, 1, 1, 1, 1,
-0.1205929, 0.8342053, -1.995609, 1, 1, 1, 1, 1,
-0.1201268, -0.6107401, -2.718405, 0, 0, 1, 1, 1,
-0.1191164, 2.201826, -0.6000782, 1, 0, 0, 1, 1,
-0.1174614, 0.04788376, -0.6410999, 1, 0, 0, 1, 1,
-0.1141288, 0.2040254, -2.011749, 1, 0, 0, 1, 1,
-0.1121621, 0.1310127, -0.01442568, 1, 0, 0, 1, 1,
-0.1113496, -0.9127157, -4.237611, 1, 0, 0, 1, 1,
-0.1026845, 0.5357522, -1.090803, 0, 0, 0, 1, 1,
-0.09984317, 1.769844, -0.4925017, 0, 0, 0, 1, 1,
-0.09902469, 0.188692, 0.905091, 0, 0, 0, 1, 1,
-0.09836765, 0.1183124, -1.62833, 0, 0, 0, 1, 1,
-0.09384728, 1.167582, 1.613315, 0, 0, 0, 1, 1,
-0.09325016, -1.323016, -3.391079, 0, 0, 0, 1, 1,
-0.09297468, 0.5335837, -1.214254, 0, 0, 0, 1, 1,
-0.0927365, -0.2393402, -2.11947, 1, 1, 1, 1, 1,
-0.09070677, -1.097515, -3.687622, 1, 1, 1, 1, 1,
-0.09022527, 0.8427988, -0.9156907, 1, 1, 1, 1, 1,
-0.08176041, 0.903387, -0.04578081, 1, 1, 1, 1, 1,
-0.080288, -0.6767281, -2.34525, 1, 1, 1, 1, 1,
-0.07940546, 2.404353, 0.006787199, 1, 1, 1, 1, 1,
-0.07686862, 1.094505, -1.289709, 1, 1, 1, 1, 1,
-0.07534634, 1.202031, 0.03114076, 1, 1, 1, 1, 1,
-0.0744782, 0.02981624, -3.336092, 1, 1, 1, 1, 1,
-0.07047179, 0.01453686, -0.9120135, 1, 1, 1, 1, 1,
-0.06833487, -0.0675395, -2.775935, 1, 1, 1, 1, 1,
-0.06728026, 0.4696676, 0.9049673, 1, 1, 1, 1, 1,
-0.06664386, 0.658337, -0.3254406, 1, 1, 1, 1, 1,
-0.06505959, -0.3781934, -4.609315, 1, 1, 1, 1, 1,
-0.06349672, -0.4251251, -2.210407, 1, 1, 1, 1, 1,
-0.06122072, -0.7234266, -2.941237, 0, 0, 1, 1, 1,
-0.05949613, 0.10238, -1.716246, 1, 0, 0, 1, 1,
-0.05472263, 0.9216379, -0.3111765, 1, 0, 0, 1, 1,
-0.05200365, 1.657279, 0.5379062, 1, 0, 0, 1, 1,
-0.05182146, 0.7629559, 1.043509, 1, 0, 0, 1, 1,
-0.04858478, 0.4175457, -1.815895, 1, 0, 0, 1, 1,
-0.04844169, 0.5631481, -2.191762, 0, 0, 0, 1, 1,
-0.0461848, 2.097956, 1.12515, 0, 0, 0, 1, 1,
-0.0422217, 0.1658102, 0.2870143, 0, 0, 0, 1, 1,
-0.0418493, 1.366573, -0.6780556, 0, 0, 0, 1, 1,
-0.02838519, 0.4592721, 0.2111675, 0, 0, 0, 1, 1,
-0.02804443, 0.7117288, -1.294987, 0, 0, 0, 1, 1,
-0.01887151, 0.1815483, -0.06868264, 0, 0, 0, 1, 1,
-0.01817608, 0.08609129, -0.0775675, 1, 1, 1, 1, 1,
-0.01615779, -0.4828587, -3.152237, 1, 1, 1, 1, 1,
-0.01249271, -0.06456179, -3.038811, 1, 1, 1, 1, 1,
-0.004321325, 0.3702198, -0.02820441, 1, 1, 1, 1, 1,
-0.004051363, 0.630689, -0.3043922, 1, 1, 1, 1, 1,
-0.0007841357, -1.32227, -2.135417, 1, 1, 1, 1, 1,
0.006271995, 0.6745914, 1.128601, 1, 1, 1, 1, 1,
0.007361926, 0.2954713, 0.4032768, 1, 1, 1, 1, 1,
0.01352084, -0.08865126, 2.288839, 1, 1, 1, 1, 1,
0.01882439, 0.03193269, -0.02401185, 1, 1, 1, 1, 1,
0.0193128, -1.552329, 3.467615, 1, 1, 1, 1, 1,
0.02738523, 1.611756, -0.499829, 1, 1, 1, 1, 1,
0.02897196, 0.1678196, 1.450969, 1, 1, 1, 1, 1,
0.03114455, 1.917644, 0.6330013, 1, 1, 1, 1, 1,
0.03371824, -0.0446839, 3.121241, 1, 1, 1, 1, 1,
0.03668092, -0.8658259, 1.907505, 0, 0, 1, 1, 1,
0.04362484, -0.09675268, 3.732757, 1, 0, 0, 1, 1,
0.04743835, -0.3134152, 2.87454, 1, 0, 0, 1, 1,
0.0514055, 1.675911, 0.4464424, 1, 0, 0, 1, 1,
0.05163749, 1.237292, 0.81151, 1, 0, 0, 1, 1,
0.05395408, -0.7982684, 4.761288, 1, 0, 0, 1, 1,
0.05403573, -1.618614, 5.001411, 0, 0, 0, 1, 1,
0.05560242, -0.9711083, 4.798981, 0, 0, 0, 1, 1,
0.05662685, -0.6264346, 4.192904, 0, 0, 0, 1, 1,
0.06277455, 0.2062421, 0.716402, 0, 0, 0, 1, 1,
0.06926516, -0.02242308, 1.404904, 0, 0, 0, 1, 1,
0.07207952, -0.4129954, 3.671932, 0, 0, 0, 1, 1,
0.07644043, -0.06836832, 2.128569, 0, 0, 0, 1, 1,
0.07668926, 0.7442382, -0.7670478, 1, 1, 1, 1, 1,
0.08015334, 0.1708872, 0.5541805, 1, 1, 1, 1, 1,
0.0817606, 0.311302, -0.2760179, 1, 1, 1, 1, 1,
0.08419593, 0.05769566, 1.836406, 1, 1, 1, 1, 1,
0.08780565, 0.1252384, 0.5573002, 1, 1, 1, 1, 1,
0.0893759, -0.1682774, 2.632699, 1, 1, 1, 1, 1,
0.0896799, -0.1047225, 2.998975, 1, 1, 1, 1, 1,
0.09060352, 1.243857, -0.06866715, 1, 1, 1, 1, 1,
0.09698303, -0.4336272, 1.942433, 1, 1, 1, 1, 1,
0.105734, 1.658205, 0.3838211, 1, 1, 1, 1, 1,
0.1059054, 0.4294325, -1.176101, 1, 1, 1, 1, 1,
0.1076755, -0.4805499, 2.303173, 1, 1, 1, 1, 1,
0.1140344, -0.4182054, 2.656964, 1, 1, 1, 1, 1,
0.1169524, -0.7437654, 3.766369, 1, 1, 1, 1, 1,
0.117962, 0.06848615, 1.123754, 1, 1, 1, 1, 1,
0.118477, 2.117791, -1.291125, 0, 0, 1, 1, 1,
0.1185051, 0.119432, -0.2946702, 1, 0, 0, 1, 1,
0.1190235, 0.4988826, -0.667239, 1, 0, 0, 1, 1,
0.1202692, 1.077108, 0.02400447, 1, 0, 0, 1, 1,
0.1220678, -0.9593163, 3.666544, 1, 0, 0, 1, 1,
0.1244344, 0.7774036, 1.536987, 1, 0, 0, 1, 1,
0.1271549, 0.576879, 0.694334, 0, 0, 0, 1, 1,
0.1276485, -0.2975065, 3.607076, 0, 0, 0, 1, 1,
0.1277623, -0.7834888, 4.18398, 0, 0, 0, 1, 1,
0.1298134, 0.03460947, 0.4166382, 0, 0, 0, 1, 1,
0.1301155, -0.1192861, -0.4100102, 0, 0, 0, 1, 1,
0.1304833, -0.1672374, 2.638064, 0, 0, 0, 1, 1,
0.1317193, -0.4238383, 2.139498, 0, 0, 0, 1, 1,
0.136043, 0.2931861, 0.9686662, 1, 1, 1, 1, 1,
0.1367253, -1.091424, 4.113568, 1, 1, 1, 1, 1,
0.1375895, 0.5329421, -1.446513, 1, 1, 1, 1, 1,
0.1384277, -0.4172952, 3.670469, 1, 1, 1, 1, 1,
0.1389843, 0.5368515, 0.08400197, 1, 1, 1, 1, 1,
0.1400146, -0.7897646, 3.473774, 1, 1, 1, 1, 1,
0.1446786, 0.5161132, 0.4823314, 1, 1, 1, 1, 1,
0.1448379, -1.312922, 3.836641, 1, 1, 1, 1, 1,
0.1485309, -0.1783984, 3.525622, 1, 1, 1, 1, 1,
0.1493298, 2.673214, 0.6577082, 1, 1, 1, 1, 1,
0.1537409, -0.6168329, 3.282817, 1, 1, 1, 1, 1,
0.164602, -0.9577556, 1.243924, 1, 1, 1, 1, 1,
0.1653635, 1.002795, -0.7161601, 1, 1, 1, 1, 1,
0.1692585, -0.4019797, 2.325472, 1, 1, 1, 1, 1,
0.176592, 0.123912, 3.069238, 1, 1, 1, 1, 1,
0.1777868, -0.7293697, 2.219459, 0, 0, 1, 1, 1,
0.1803824, -0.2539226, 1.520403, 1, 0, 0, 1, 1,
0.1841002, -0.4473657, 1.177559, 1, 0, 0, 1, 1,
0.1853958, -1.916754, 3.155956, 1, 0, 0, 1, 1,
0.1858006, 0.7773443, -0.6913742, 1, 0, 0, 1, 1,
0.1890842, -0.6142931, 4.041657, 1, 0, 0, 1, 1,
0.1901836, 1.557118, 0.8216223, 0, 0, 0, 1, 1,
0.1908303, -2.154275, 2.341304, 0, 0, 0, 1, 1,
0.1913287, -0.910632, 3.33868, 0, 0, 0, 1, 1,
0.1972782, 0.6619756, 0.146823, 0, 0, 0, 1, 1,
0.2044178, 0.1322609, 0.9458545, 0, 0, 0, 1, 1,
0.2044278, 0.6895882, 1.261733, 0, 0, 0, 1, 1,
0.213182, 0.4717889, 1.185851, 0, 0, 0, 1, 1,
0.2157595, -1.956398, 1.946661, 1, 1, 1, 1, 1,
0.2187598, -0.2189986, 3.419296, 1, 1, 1, 1, 1,
0.2217267, -1.214101, 4.232396, 1, 1, 1, 1, 1,
0.2228649, 1.686941, 0.2444853, 1, 1, 1, 1, 1,
0.2235396, -1.385995, 4.071275, 1, 1, 1, 1, 1,
0.230301, -0.3740842, 2.34713, 1, 1, 1, 1, 1,
0.2318786, -0.3148829, 2.764785, 1, 1, 1, 1, 1,
0.2331515, 0.1964093, 0.7906418, 1, 1, 1, 1, 1,
0.2383573, 2.381817, 0.1617742, 1, 1, 1, 1, 1,
0.2387176, 1.471272, -0.0970998, 1, 1, 1, 1, 1,
0.2388555, 1.110199, 0.3540262, 1, 1, 1, 1, 1,
0.2409387, 1.434777, -1.464856, 1, 1, 1, 1, 1,
0.2499329, -0.7523018, 1.573755, 1, 1, 1, 1, 1,
0.25187, -1.176493, 2.095941, 1, 1, 1, 1, 1,
0.254309, 0.9536002, 0.8537527, 1, 1, 1, 1, 1,
0.258073, 0.204836, 1.751832, 0, 0, 1, 1, 1,
0.2607668, 0.2308905, -0.400649, 1, 0, 0, 1, 1,
0.2614075, -0.6947733, 2.1992, 1, 0, 0, 1, 1,
0.2648912, 2.761098, -0.2181877, 1, 0, 0, 1, 1,
0.2661549, -2.266673, 2.235136, 1, 0, 0, 1, 1,
0.2667979, -0.8229083, 1.981033, 1, 0, 0, 1, 1,
0.2673446, -1.18521, 2.464461, 0, 0, 0, 1, 1,
0.2701034, 0.8621447, 0.4674391, 0, 0, 0, 1, 1,
0.2733116, -1.113647, 2.086173, 0, 0, 0, 1, 1,
0.2756342, -0.4041667, 2.913619, 0, 0, 0, 1, 1,
0.2776997, -0.6152279, 1.796863, 0, 0, 0, 1, 1,
0.2797663, 0.5173876, -1.201707, 0, 0, 0, 1, 1,
0.2802185, -1.981486, 1.611642, 0, 0, 0, 1, 1,
0.280414, 0.956367, -0.04839044, 1, 1, 1, 1, 1,
0.2807346, 1.542486, -0.3907799, 1, 1, 1, 1, 1,
0.2817889, -0.3176105, 1.384723, 1, 1, 1, 1, 1,
0.2845721, -0.02465126, 1.244081, 1, 1, 1, 1, 1,
0.2871603, 1.858163, 0.7102313, 1, 1, 1, 1, 1,
0.2939842, -2.568368, 2.714725, 1, 1, 1, 1, 1,
0.2993979, 1.263025, 2.381239, 1, 1, 1, 1, 1,
0.3000855, 1.26051, -0.003870167, 1, 1, 1, 1, 1,
0.3024586, -0.8890663, 2.801281, 1, 1, 1, 1, 1,
0.3026203, 1.448879, -0.08700117, 1, 1, 1, 1, 1,
0.3030868, -0.8590229, 3.181857, 1, 1, 1, 1, 1,
0.3109783, -2.191523, 2.642899, 1, 1, 1, 1, 1,
0.3126748, 1.477312, -0.7050176, 1, 1, 1, 1, 1,
0.3272759, -0.1112489, 0.9348977, 1, 1, 1, 1, 1,
0.3281884, 0.7875911, -1.164059, 1, 1, 1, 1, 1,
0.3289648, 0.6869663, 0.9039549, 0, 0, 1, 1, 1,
0.3305531, 0.2088629, 0.4076246, 1, 0, 0, 1, 1,
0.3324856, -0.6975071, 2.568931, 1, 0, 0, 1, 1,
0.3332533, -0.3902192, 1.378484, 1, 0, 0, 1, 1,
0.3351716, 0.08277787, 3.303204, 1, 0, 0, 1, 1,
0.3352239, 1.074075, -1.52635, 1, 0, 0, 1, 1,
0.3365068, -0.05605043, 3.130142, 0, 0, 0, 1, 1,
0.3382913, 1.129418, -0.2942292, 0, 0, 0, 1, 1,
0.3395922, -0.5072855, 1.152206, 0, 0, 0, 1, 1,
0.3400585, -1.392779, 4.919636, 0, 0, 0, 1, 1,
0.3406837, 0.5686544, 0.1668852, 0, 0, 0, 1, 1,
0.3440274, -0.259712, 2.083936, 0, 0, 0, 1, 1,
0.3461131, -2.006367, 2.500442, 0, 0, 0, 1, 1,
0.3466306, 0.9042013, 0.7158294, 1, 1, 1, 1, 1,
0.347856, 0.3923348, -0.224749, 1, 1, 1, 1, 1,
0.3515219, 1.436419, 0.2404475, 1, 1, 1, 1, 1,
0.354899, -0.08633378, 2.616822, 1, 1, 1, 1, 1,
0.3555672, -0.2424507, 2.612842, 1, 1, 1, 1, 1,
0.3573491, -2.203192, 3.517173, 1, 1, 1, 1, 1,
0.3613355, -1.19903, 2.603167, 1, 1, 1, 1, 1,
0.3664775, -0.7422071, 4.001701, 1, 1, 1, 1, 1,
0.3752274, 0.5907099, 0.0008648764, 1, 1, 1, 1, 1,
0.3800604, 1.563062, 1.197965, 1, 1, 1, 1, 1,
0.3803709, 0.05388355, 0.8956061, 1, 1, 1, 1, 1,
0.3822239, 0.438592, 1.115119, 1, 1, 1, 1, 1,
0.3846773, -0.187986, 1.410465, 1, 1, 1, 1, 1,
0.3870233, 0.6927697, -0.6954543, 1, 1, 1, 1, 1,
0.3879226, 0.1856846, 2.735215, 1, 1, 1, 1, 1,
0.3902554, -0.3282373, 2.035922, 0, 0, 1, 1, 1,
0.3936656, -0.5526875, 2.763725, 1, 0, 0, 1, 1,
0.3947893, 0.8879295, 1.718239, 1, 0, 0, 1, 1,
0.4044057, 0.9248389, -0.8027943, 1, 0, 0, 1, 1,
0.4048003, 1.541016, 0.5602673, 1, 0, 0, 1, 1,
0.4059658, 0.1248641, 1.382098, 1, 0, 0, 1, 1,
0.4119776, -0.4437172, 1.9907, 0, 0, 0, 1, 1,
0.4128256, 1.207426, -1.461066, 0, 0, 0, 1, 1,
0.4148985, 0.4120225, 3.058777, 0, 0, 0, 1, 1,
0.4299014, -0.3476751, 2.361335, 0, 0, 0, 1, 1,
0.4302286, 1.072491, 0.05853911, 0, 0, 0, 1, 1,
0.4316136, 0.008473892, 0.6761522, 0, 0, 0, 1, 1,
0.4332891, -1.138711, 2.092962, 0, 0, 0, 1, 1,
0.4343255, 0.05478521, 3.763761, 1, 1, 1, 1, 1,
0.4345768, -0.0265956, 2.042853, 1, 1, 1, 1, 1,
0.4347416, 0.1993139, 0.7712111, 1, 1, 1, 1, 1,
0.4349466, -1.443625, 3.651203, 1, 1, 1, 1, 1,
0.4349569, 0.2154667, 3.183609, 1, 1, 1, 1, 1,
0.4425959, 0.7633664, -2.478128, 1, 1, 1, 1, 1,
0.4429951, -0.3144935, 1.065107, 1, 1, 1, 1, 1,
0.4437808, -0.4841283, 3.449493, 1, 1, 1, 1, 1,
0.4463724, -0.5157226, 2.540382, 1, 1, 1, 1, 1,
0.4551583, 1.908601, 0.9328647, 1, 1, 1, 1, 1,
0.4554986, 1.136411, 0.5628631, 1, 1, 1, 1, 1,
0.459278, -1.343438, 3.42283, 1, 1, 1, 1, 1,
0.461731, -1.284471, 3.107787, 1, 1, 1, 1, 1,
0.4646707, 1.050035, -0.1409078, 1, 1, 1, 1, 1,
0.4671445, -0.4108754, 1.553042, 1, 1, 1, 1, 1,
0.4760399, -0.6324665, 1.919361, 0, 0, 1, 1, 1,
0.4770651, -0.6758891, 3.294586, 1, 0, 0, 1, 1,
0.4774281, -0.8542978, 2.673943, 1, 0, 0, 1, 1,
0.4781984, 0.335023, 1.775933, 1, 0, 0, 1, 1,
0.4795523, 0.08165911, -0.4836195, 1, 0, 0, 1, 1,
0.4796552, 1.660653, 1.124795, 1, 0, 0, 1, 1,
0.4814974, 0.297788, 2.168899, 0, 0, 0, 1, 1,
0.4886692, -0.09377601, 2.449772, 0, 0, 0, 1, 1,
0.4941852, 0.1212646, 0.444718, 0, 0, 0, 1, 1,
0.4953102, 1.236061, -0.4778029, 0, 0, 0, 1, 1,
0.4956095, -0.04938901, 2.410704, 0, 0, 0, 1, 1,
0.4980747, -0.5453731, 3.514422, 0, 0, 0, 1, 1,
0.4985846, -0.7260549, 2.576708, 0, 0, 0, 1, 1,
0.5051118, 0.05124669, 2.174619, 1, 1, 1, 1, 1,
0.5051796, 0.4292672, 0.2134043, 1, 1, 1, 1, 1,
0.5160499, 0.2582528, -0.3710268, 1, 1, 1, 1, 1,
0.5171916, -0.4502717, 1.836024, 1, 1, 1, 1, 1,
0.5199142, -1.943661, 3.407503, 1, 1, 1, 1, 1,
0.5210948, 0.7429525, 0.7980142, 1, 1, 1, 1, 1,
0.5278618, 1.488221, -1.743933, 1, 1, 1, 1, 1,
0.5309075, -1.363286, 2.250409, 1, 1, 1, 1, 1,
0.5475624, 0.5344992, 2.833251, 1, 1, 1, 1, 1,
0.5477951, -1.293894, 4.710217, 1, 1, 1, 1, 1,
0.5492569, 1.731662, -0.9060357, 1, 1, 1, 1, 1,
0.5495853, -2.706273, 2.420869, 1, 1, 1, 1, 1,
0.5598223, 0.9407766, -0.3299088, 1, 1, 1, 1, 1,
0.5626404, 1.231385, -1.899179, 1, 1, 1, 1, 1,
0.5639062, 0.2751371, 1.198844, 1, 1, 1, 1, 1,
0.5665988, 1.088654, 0.3986479, 0, 0, 1, 1, 1,
0.5707486, 0.01859217, 5.367752, 1, 0, 0, 1, 1,
0.5717754, -0.9556322, 3.38245, 1, 0, 0, 1, 1,
0.5723727, -0.2874746, -0.3987179, 1, 0, 0, 1, 1,
0.5733441, -1.503681, 2.113979, 1, 0, 0, 1, 1,
0.5746911, 1.510932, 0.9798197, 1, 0, 0, 1, 1,
0.5761034, 0.2138416, 1.82645, 0, 0, 0, 1, 1,
0.5788007, 1.285083, 1.014831, 0, 0, 0, 1, 1,
0.5817202, -0.05595751, 2.921124, 0, 0, 0, 1, 1,
0.5907836, -1.197422, 1.030615, 0, 0, 0, 1, 1,
0.5917168, -1.679376, 2.208615, 0, 0, 0, 1, 1,
0.5940762, 1.212874, 0.8954505, 0, 0, 0, 1, 1,
0.5965245, -0.6368963, 1.639119, 0, 0, 0, 1, 1,
0.6011924, 1.249811, 0.8353835, 1, 1, 1, 1, 1,
0.6019761, 0.8106005, 0.3937827, 1, 1, 1, 1, 1,
0.6040257, 0.6239843, 0.9777166, 1, 1, 1, 1, 1,
0.6044784, -0.6681138, 1.941754, 1, 1, 1, 1, 1,
0.6149687, -0.7787707, 2.689663, 1, 1, 1, 1, 1,
0.6178734, 0.7783618, 1.110339, 1, 1, 1, 1, 1,
0.6193557, -0.02524659, 2.103517, 1, 1, 1, 1, 1,
0.6216514, -0.2587001, 1.47252, 1, 1, 1, 1, 1,
0.6216892, -0.5823871, 2.109684, 1, 1, 1, 1, 1,
0.6220193, -0.2790925, 1.333003, 1, 1, 1, 1, 1,
0.6293588, -0.6803583, 2.899391, 1, 1, 1, 1, 1,
0.6297952, -2.206926, 1.986513, 1, 1, 1, 1, 1,
0.6299849, -0.832957, 0.9211341, 1, 1, 1, 1, 1,
0.6315457, 1.404966, -0.4561083, 1, 1, 1, 1, 1,
0.6317033, 0.5970532, 1.334627, 1, 1, 1, 1, 1,
0.6339209, -0.3385571, 1.155031, 0, 0, 1, 1, 1,
0.634859, 0.01971048, 2.292616, 1, 0, 0, 1, 1,
0.6356853, 0.7894135, 1.459283, 1, 0, 0, 1, 1,
0.637108, 0.4707886, 2.340808, 1, 0, 0, 1, 1,
0.6380705, 0.2467569, -0.2048868, 1, 0, 0, 1, 1,
0.638185, -0.3721587, 1.374531, 1, 0, 0, 1, 1,
0.6390896, 1.68533, -0.08719867, 0, 0, 0, 1, 1,
0.64088, -0.3043182, 1.826274, 0, 0, 0, 1, 1,
0.656245, 1.49905, 1.945236, 0, 0, 0, 1, 1,
0.6583918, 1.233011, 1.110218, 0, 0, 0, 1, 1,
0.6631595, -0.01312551, 1.570548, 0, 0, 0, 1, 1,
0.6685556, -0.5999528, 4.163651, 0, 0, 0, 1, 1,
0.6747082, -0.6592572, 1.95896, 0, 0, 0, 1, 1,
0.6748244, 0.1356331, 1.396001, 1, 1, 1, 1, 1,
0.675603, -0.5123672, 1.899995, 1, 1, 1, 1, 1,
0.6767603, -0.8739013, 4.094418, 1, 1, 1, 1, 1,
0.6794574, -0.9116111, 3.356246, 1, 1, 1, 1, 1,
0.6944965, -1.363762, 4.108137, 1, 1, 1, 1, 1,
0.7010236, -0.950545, 2.082989, 1, 1, 1, 1, 1,
0.7031228, -0.003153528, 2.121629, 1, 1, 1, 1, 1,
0.712311, 0.2249052, 2.461032, 1, 1, 1, 1, 1,
0.7150827, -0.6035206, 1.259647, 1, 1, 1, 1, 1,
0.7156222, -0.3613116, 1.576363, 1, 1, 1, 1, 1,
0.7165045, 1.432891, 0.7640945, 1, 1, 1, 1, 1,
0.7170019, -0.5798318, 2.498768, 1, 1, 1, 1, 1,
0.7234671, 0.3977108, 0.6248096, 1, 1, 1, 1, 1,
0.7300063, -0.5906593, 1.922133, 1, 1, 1, 1, 1,
0.7399514, -0.9976919, 2.292549, 1, 1, 1, 1, 1,
0.7410832, 0.792991, 2.026739, 0, 0, 1, 1, 1,
0.7480664, 0.6369641, -1.359248, 1, 0, 0, 1, 1,
0.7538202, -1.373165, 1.982707, 1, 0, 0, 1, 1,
0.7552488, -0.8835208, 2.936483, 1, 0, 0, 1, 1,
0.7560725, 0.9988434, 2.17046, 1, 0, 0, 1, 1,
0.7561213, 0.741729, 0.4458585, 1, 0, 0, 1, 1,
0.7577271, -0.4303896, 2.672674, 0, 0, 0, 1, 1,
0.7612287, -0.1999822, 2.836714, 0, 0, 0, 1, 1,
0.7628642, -1.702475, 2.696793, 0, 0, 0, 1, 1,
0.76895, -0.5612336, 2.522596, 0, 0, 0, 1, 1,
0.7700228, 1.160641, 1.994146, 0, 0, 0, 1, 1,
0.7754619, 1.481627, 1.102393, 0, 0, 0, 1, 1,
0.7789768, -1.485257, 4.282823, 0, 0, 0, 1, 1,
0.7834533, 0.3115257, 1.458051, 1, 1, 1, 1, 1,
0.7856625, -0.9762513, 3.175238, 1, 1, 1, 1, 1,
0.7867045, 1.069515, -0.2924513, 1, 1, 1, 1, 1,
0.7924845, -0.7484486, 3.010628, 1, 1, 1, 1, 1,
0.7943152, -0.7766104, 3.784611, 1, 1, 1, 1, 1,
0.8069918, -0.3185361, 0.2485407, 1, 1, 1, 1, 1,
0.8181926, 0.2622842, 0.3657735, 1, 1, 1, 1, 1,
0.8209947, -0.7832691, 1.77159, 1, 1, 1, 1, 1,
0.8218773, 0.6923927, -0.3390113, 1, 1, 1, 1, 1,
0.8289937, -0.2253622, 2.501104, 1, 1, 1, 1, 1,
0.8305238, -1.615554, 3.751023, 1, 1, 1, 1, 1,
0.8326943, 0.4009309, -0.151686, 1, 1, 1, 1, 1,
0.8380128, 0.1146019, 2.421617, 1, 1, 1, 1, 1,
0.8390234, -0.4783867, 2.257492, 1, 1, 1, 1, 1,
0.8429762, 0.1516497, 1.915619, 1, 1, 1, 1, 1,
0.8484839, 0.09718725, 1.331634, 0, 0, 1, 1, 1,
0.8501206, 1.53329, 1.74494, 1, 0, 0, 1, 1,
0.8580445, -0.8126699, 1.54497, 1, 0, 0, 1, 1,
0.8598039, -0.5060067, 2.099839, 1, 0, 0, 1, 1,
0.8606218, -1.290062, 2.903665, 1, 0, 0, 1, 1,
0.8704976, 1.002154, 0.07926784, 1, 0, 0, 1, 1,
0.8711628, -0.1601734, 2.570736, 0, 0, 0, 1, 1,
0.8756688, 0.7317981, 0.4969527, 0, 0, 0, 1, 1,
0.8783854, 1.157134, 1.512555, 0, 0, 0, 1, 1,
0.8828726, -0.0757001, 1.811153, 0, 0, 0, 1, 1,
0.8843991, 1.112654, 1.020195, 0, 0, 0, 1, 1,
0.8937009, 1.015498, 1.43429, 0, 0, 0, 1, 1,
0.8964781, -0.1000066, 1.282931, 0, 0, 0, 1, 1,
0.897382, 1.557372, 0.9607973, 1, 1, 1, 1, 1,
0.8997658, 2.791518, 1.04875, 1, 1, 1, 1, 1,
0.9022125, -0.9746575, 2.282621, 1, 1, 1, 1, 1,
0.9078673, -0.5064238, 3.481257, 1, 1, 1, 1, 1,
0.9082624, 0.8259628, 0.756588, 1, 1, 1, 1, 1,
0.910314, -0.5439751, 4.128108, 1, 1, 1, 1, 1,
0.9217749, -0.6600158, 1.209996, 1, 1, 1, 1, 1,
0.9219714, 0.2459537, 2.232368, 1, 1, 1, 1, 1,
0.922597, -2.046766, 2.603976, 1, 1, 1, 1, 1,
0.9232112, -1.238319, 3.82156, 1, 1, 1, 1, 1,
0.9248064, 0.3521238, 0.7846509, 1, 1, 1, 1, 1,
0.9265756, 1.824332, 0.5230061, 1, 1, 1, 1, 1,
0.9335119, -0.5149959, -0.1480935, 1, 1, 1, 1, 1,
0.9441783, 0.6838366, 1.926594, 1, 1, 1, 1, 1,
0.9617717, 1.101031, 1.150167, 1, 1, 1, 1, 1,
0.9638171, 1.389477, 1.575266, 0, 0, 1, 1, 1,
0.9717881, -0.9016556, 1.878359, 1, 0, 0, 1, 1,
0.9773756, 1.929476, 1.415362, 1, 0, 0, 1, 1,
0.985976, 1.181619, 0.5881001, 1, 0, 0, 1, 1,
0.9896767, 0.4173408, 0.9304075, 1, 0, 0, 1, 1,
0.9914971, 1.729232, 1.006798, 1, 0, 0, 1, 1,
0.9925922, 0.6435495, 0.9684798, 0, 0, 0, 1, 1,
0.9953228, 0.2881803, 0.5977929, 0, 0, 0, 1, 1,
0.9983814, -0.7636041, 1.441198, 0, 0, 0, 1, 1,
1.000874, 0.4683477, 2.048876, 0, 0, 0, 1, 1,
1.009362, -0.7585999, -0.15094, 0, 0, 0, 1, 1,
1.01283, -2.000405, 3.82903, 0, 0, 0, 1, 1,
1.015385, 0.6766479, 0.5576011, 0, 0, 0, 1, 1,
1.019056, -0.2950042, 1.191296, 1, 1, 1, 1, 1,
1.030018, -0.5174588, -0.09142741, 1, 1, 1, 1, 1,
1.031228, 0.2752722, 2.516104, 1, 1, 1, 1, 1,
1.031498, 0.376316, 1.16302, 1, 1, 1, 1, 1,
1.031856, 0.9653052, 2.086558, 1, 1, 1, 1, 1,
1.045565, 1.405972, 1.132945, 1, 1, 1, 1, 1,
1.048665, -0.2982059, 2.661308, 1, 1, 1, 1, 1,
1.052936, 0.4137939, -0.03185285, 1, 1, 1, 1, 1,
1.057381, 1.499127, 3.10529, 1, 1, 1, 1, 1,
1.065183, 0.2418448, 1.553101, 1, 1, 1, 1, 1,
1.06533, -0.04518141, 1.173912, 1, 1, 1, 1, 1,
1.068775, 0.07512689, 1.40044, 1, 1, 1, 1, 1,
1.070126, 0.5203221, 0.4901206, 1, 1, 1, 1, 1,
1.077471, 0.735441, 0.747449, 1, 1, 1, 1, 1,
1.0837, -0.9092265, 3.536556, 1, 1, 1, 1, 1,
1.083874, 0.4788868, 2.691581, 0, 0, 1, 1, 1,
1.084129, 0.3292386, 1.999031, 1, 0, 0, 1, 1,
1.095342, -0.7712189, 1.908379, 1, 0, 0, 1, 1,
1.097335, 0.8403524, 1.136151, 1, 0, 0, 1, 1,
1.099925, -0.1462535, 0.5273521, 1, 0, 0, 1, 1,
1.103087, 1.124823, 0.6182103, 1, 0, 0, 1, 1,
1.104966, -0.2817536, 1.502659, 0, 0, 0, 1, 1,
1.108242, -2.235805, 3.624169, 0, 0, 0, 1, 1,
1.108878, -0.3194811, 3.409766, 0, 0, 0, 1, 1,
1.112655, 0.335407, 2.906507, 0, 0, 0, 1, 1,
1.114045, 0.7490474, 2.020944, 0, 0, 0, 1, 1,
1.118355, -0.124857, 0.1604108, 0, 0, 0, 1, 1,
1.125937, 0.2368673, 1.86317, 0, 0, 0, 1, 1,
1.126579, -2.307103, 4.00753, 1, 1, 1, 1, 1,
1.132078, 0.7304617, 0.9060948, 1, 1, 1, 1, 1,
1.139994, -0.2109278, 1.131637, 1, 1, 1, 1, 1,
1.148429, 0.5197698, 1.286999, 1, 1, 1, 1, 1,
1.149675, 2.066107, 0.01886714, 1, 1, 1, 1, 1,
1.160918, 0.3805394, 0.2872271, 1, 1, 1, 1, 1,
1.162787, 1.426151, 0.5979001, 1, 1, 1, 1, 1,
1.180738, -2.932704, 1.615099, 1, 1, 1, 1, 1,
1.192159, -0.5170752, 1.401981, 1, 1, 1, 1, 1,
1.196295, 0.5217587, 0.8964921, 1, 1, 1, 1, 1,
1.204061, -1.909337, 2.292259, 1, 1, 1, 1, 1,
1.214696, 0.4869374, 2.191442, 1, 1, 1, 1, 1,
1.221213, -1.442268, 1.005536, 1, 1, 1, 1, 1,
1.240741, 0.5490695, 0.7958794, 1, 1, 1, 1, 1,
1.265141, 0.3616882, 3.076275, 1, 1, 1, 1, 1,
1.265868, -0.9293871, 1.857261, 0, 0, 1, 1, 1,
1.288668, 0.3581393, 2.567096, 1, 0, 0, 1, 1,
1.292925, -0.4120994, 1.786226, 1, 0, 0, 1, 1,
1.293369, 0.3981633, 2.100174, 1, 0, 0, 1, 1,
1.314769, -0.1597606, 1.97018, 1, 0, 0, 1, 1,
1.315451, -1.355324, 2.04001, 1, 0, 0, 1, 1,
1.318928, 0.6923156, -0.4638829, 0, 0, 0, 1, 1,
1.325416, 0.8134451, -0.1411113, 0, 0, 0, 1, 1,
1.337524, -0.3721429, 2.643932, 0, 0, 0, 1, 1,
1.344205, 1.610655, 0.3824752, 0, 0, 0, 1, 1,
1.349289, 1.4545, 2.264502, 0, 0, 0, 1, 1,
1.389442, -1.59832, 2.904031, 0, 0, 0, 1, 1,
1.395706, -1.169188, 3.521103, 0, 0, 0, 1, 1,
1.402347, -1.345746, 2.078345, 1, 1, 1, 1, 1,
1.403435, 0.4904535, 2.174232, 1, 1, 1, 1, 1,
1.408174, -0.6865738, 1.072487, 1, 1, 1, 1, 1,
1.425257, -1.305746, 1.059866, 1, 1, 1, 1, 1,
1.425935, -0.6402289, 2.958779, 1, 1, 1, 1, 1,
1.437983, -0.959988, 3.684877, 1, 1, 1, 1, 1,
1.438588, 0.5044636, 2.614047, 1, 1, 1, 1, 1,
1.443937, 2.739005, -0.1699418, 1, 1, 1, 1, 1,
1.460092, 1.253027, 0.1520101, 1, 1, 1, 1, 1,
1.460717, 0.2478502, 1.803527, 1, 1, 1, 1, 1,
1.463004, -0.4146656, 2.987313, 1, 1, 1, 1, 1,
1.466316, -0.389688, 1.379435, 1, 1, 1, 1, 1,
1.472608, -0.3434211, 1.818836, 1, 1, 1, 1, 1,
1.476294, -1.177464, 2.584846, 1, 1, 1, 1, 1,
1.476735, -0.06738394, 0.5181563, 1, 1, 1, 1, 1,
1.477456, -0.2611795, 2.6352, 0, 0, 1, 1, 1,
1.481152, -0.8065605, 3.150782, 1, 0, 0, 1, 1,
1.481729, 0.07493314, 2.845185, 1, 0, 0, 1, 1,
1.48516, -0.04484141, 1.813655, 1, 0, 0, 1, 1,
1.489872, 0.4627843, 1.398767, 1, 0, 0, 1, 1,
1.49279, -0.4565461, 1.550956, 1, 0, 0, 1, 1,
1.502086, -0.1859967, 3.193902, 0, 0, 0, 1, 1,
1.503607, 0.001712333, 1.645661, 0, 0, 0, 1, 1,
1.510689, 0.4556702, 0.7619835, 0, 0, 0, 1, 1,
1.525005, -0.1594271, 2.871127, 0, 0, 0, 1, 1,
1.525723, -0.5534338, 1.630111, 0, 0, 0, 1, 1,
1.556433, -0.6418104, 2.092682, 0, 0, 0, 1, 1,
1.561857, -0.2929655, 0.9862821, 0, 0, 0, 1, 1,
1.565522, -2.031781, 2.791568, 1, 1, 1, 1, 1,
1.567807, 0.3006413, 2.128855, 1, 1, 1, 1, 1,
1.589814, 0.4488749, 1.229416, 1, 1, 1, 1, 1,
1.591387, -0.2125963, 1.762314, 1, 1, 1, 1, 1,
1.596156, 2.146097, -0.3491537, 1, 1, 1, 1, 1,
1.609133, 0.3661809, 1.333173, 1, 1, 1, 1, 1,
1.615107, 0.09954557, 0.4433864, 1, 1, 1, 1, 1,
1.627929, 0.6760521, 2.033053, 1, 1, 1, 1, 1,
1.633586, -2.093013, 2.053972, 1, 1, 1, 1, 1,
1.640263, -0.5699907, 1.4065, 1, 1, 1, 1, 1,
1.650144, 0.06784589, 1.768566, 1, 1, 1, 1, 1,
1.65524, -0.7622839, 4.234608, 1, 1, 1, 1, 1,
1.673051, 1.013623, 0.6440697, 1, 1, 1, 1, 1,
1.67592, 0.6729939, 1.068588, 1, 1, 1, 1, 1,
1.677, -0.9916599, 2.251476, 1, 1, 1, 1, 1,
1.685439, 1.536749, 2.61175, 0, 0, 1, 1, 1,
1.695347, 0.8361245, 0.7903917, 1, 0, 0, 1, 1,
1.700742, -0.2369673, 2.881646, 1, 0, 0, 1, 1,
1.701159, 0.2982733, 0.7571115, 1, 0, 0, 1, 1,
1.710858, 0.8537565, 0.5952181, 1, 0, 0, 1, 1,
1.726563, -0.1165305, 2.597283, 1, 0, 0, 1, 1,
1.775497, -0.3792244, 1.908363, 0, 0, 0, 1, 1,
1.781472, 0.5584112, 0.1889124, 0, 0, 0, 1, 1,
1.785287, 1.03088, 1.51657, 0, 0, 0, 1, 1,
1.785717, -0.7712945, 2.678189, 0, 0, 0, 1, 1,
1.787011, 2.434327, 2.304823, 0, 0, 0, 1, 1,
1.806744, -0.4545877, -0.08942093, 0, 0, 0, 1, 1,
1.859266, -0.3199918, 0.6155301, 0, 0, 0, 1, 1,
1.861336, -1.181936, 4.456509, 1, 1, 1, 1, 1,
1.868435, -0.09836939, 1.841243, 1, 1, 1, 1, 1,
1.894175, -0.7998453, 2.165156, 1, 1, 1, 1, 1,
1.896163, 0.410376, 3.724251, 1, 1, 1, 1, 1,
1.900021, -0.2079176, 2.6016, 1, 1, 1, 1, 1,
2.023448, 2.202557, 1.214845, 1, 1, 1, 1, 1,
2.039043, 0.2817304, 0.09258949, 1, 1, 1, 1, 1,
2.066974, -0.6217881, 3.220652, 1, 1, 1, 1, 1,
2.078053, 0.2131975, 1.06768, 1, 1, 1, 1, 1,
2.10454, 1.214248, 0.2088283, 1, 1, 1, 1, 1,
2.141832, 1.192873, 4.193635, 1, 1, 1, 1, 1,
2.144129, 0.8732772, 2.349303, 1, 1, 1, 1, 1,
2.154232, -0.8655326, 2.009732, 1, 1, 1, 1, 1,
2.172087, 0.4931322, 1.099634, 1, 1, 1, 1, 1,
2.17885, 0.8698887, 1.794131, 1, 1, 1, 1, 1,
2.196042, 0.731554, 1.543365, 0, 0, 1, 1, 1,
2.199015, 0.9723435, 2.082036, 1, 0, 0, 1, 1,
2.201601, 0.3554614, 0.7506514, 1, 0, 0, 1, 1,
2.207571, -1.330228, 1.538056, 1, 0, 0, 1, 1,
2.21106, -2.53587, 3.143592, 1, 0, 0, 1, 1,
2.21979, 0.3211731, 1.714986, 1, 0, 0, 1, 1,
2.234298, 0.2125572, 1.184282, 0, 0, 0, 1, 1,
2.234822, -1.050668, 1.464013, 0, 0, 0, 1, 1,
2.240062, 0.323244, 0.5031579, 0, 0, 0, 1, 1,
2.292319, 1.378873, 1.094424, 0, 0, 0, 1, 1,
2.317559, 0.4260785, 1.285947, 0, 0, 0, 1, 1,
2.380283, 0.8473847, 2.115356, 0, 0, 0, 1, 1,
2.477449, 0.3677036, -0.1294857, 0, 0, 0, 1, 1,
2.569427, 0.275142, 1.747391, 1, 1, 1, 1, 1,
2.747467, 0.1372101, 1.684744, 1, 1, 1, 1, 1,
2.747835, 0.5469051, 0.7031758, 1, 1, 1, 1, 1,
2.750769, 0.7936506, 0.783318, 1, 1, 1, 1, 1,
2.795958, -2.011368, 3.617306, 1, 1, 1, 1, 1,
2.81913, -0.9687784, 1.585529, 1, 1, 1, 1, 1,
2.825923, 0.1618361, 1.563972, 1, 1, 1, 1, 1
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
var radius = 9.668724;
var distance = 33.96098;
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
mvMatrix.translate( 0.3549592, -0.5765007, -0.2586694 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96098);
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
