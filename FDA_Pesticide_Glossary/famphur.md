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
-3.467882, -0.7461327, -1.074808, 1, 0, 0, 1,
-3.270335, -0.3136416, -2.96895, 1, 0.007843138, 0, 1,
-3.067886, 0.4101202, -1.870125, 1, 0.01176471, 0, 1,
-2.993127, 0.8259061, -2.060581, 1, 0.01960784, 0, 1,
-2.956246, -1.106755, -2.074137, 1, 0.02352941, 0, 1,
-2.912395, -1.337918, -1.409723, 1, 0.03137255, 0, 1,
-2.823042, 0.63348, -1.850924, 1, 0.03529412, 0, 1,
-2.664562, -1.238423, -0.923812, 1, 0.04313726, 0, 1,
-2.631801, 1.390467, -1.62692, 1, 0.04705882, 0, 1,
-2.505334, -0.1813077, -1.998431, 1, 0.05490196, 0, 1,
-2.426829, 1.654981, -1.672196, 1, 0.05882353, 0, 1,
-2.340279, 0.9381564, -1.140409, 1, 0.06666667, 0, 1,
-2.33503, -0.1864486, -1.17452, 1, 0.07058824, 0, 1,
-2.324513, -0.5063572, -3.593627, 1, 0.07843138, 0, 1,
-2.32362, -0.7185064, -3.155192, 1, 0.08235294, 0, 1,
-2.209894, 1.254025, -1.477655, 1, 0.09019608, 0, 1,
-2.183941, -0.6306857, -2.944624, 1, 0.09411765, 0, 1,
-2.175583, -0.2645008, -1.114285, 1, 0.1019608, 0, 1,
-2.14481, 0.9882251, -0.7083232, 1, 0.1098039, 0, 1,
-2.124987, -0.1544231, -3.86265, 1, 0.1137255, 0, 1,
-2.117582, -0.5902476, -2.136371, 1, 0.1215686, 0, 1,
-2.102654, 0.6133738, -1.390943, 1, 0.1254902, 0, 1,
-2.065094, 0.4938052, -0.5661141, 1, 0.1333333, 0, 1,
-2.053009, 1.369463, -1.55729, 1, 0.1372549, 0, 1,
-2.051663, -1.538384, -1.754792, 1, 0.145098, 0, 1,
-2.046155, -1.017323, -2.217698, 1, 0.1490196, 0, 1,
-2.042256, -2.948318, -1.558339, 1, 0.1568628, 0, 1,
-2.039743, -0.6915019, -0.3131156, 1, 0.1607843, 0, 1,
-2.018423, -0.360577, -1.740567, 1, 0.1686275, 0, 1,
-1.973262, 0.4289479, -1.200606, 1, 0.172549, 0, 1,
-1.93464, -1.535314, -1.771834, 1, 0.1803922, 0, 1,
-1.927278, -1.566125, -1.780445, 1, 0.1843137, 0, 1,
-1.920859, -0.3415462, -3.12225, 1, 0.1921569, 0, 1,
-1.919875, -0.7993296, -2.190625, 1, 0.1960784, 0, 1,
-1.908293, -1.820434, -3.858121, 1, 0.2039216, 0, 1,
-1.887875, -0.7704089, -3.099374, 1, 0.2117647, 0, 1,
-1.884231, -1.568136, -2.741417, 1, 0.2156863, 0, 1,
-1.867178, 0.5140964, -1.565785, 1, 0.2235294, 0, 1,
-1.841154, 0.1793829, -2.193342, 1, 0.227451, 0, 1,
-1.836568, 0.1244113, 0.3379402, 1, 0.2352941, 0, 1,
-1.817972, 1.982518, 0.8238334, 1, 0.2392157, 0, 1,
-1.80654, 0.93991, -1.038877, 1, 0.2470588, 0, 1,
-1.791999, 0.937085, 0.2916221, 1, 0.2509804, 0, 1,
-1.777416, -0.04083151, -1.149011, 1, 0.2588235, 0, 1,
-1.775753, 0.8813738, -1.925564, 1, 0.2627451, 0, 1,
-1.762569, 1.36335, -0.8214391, 1, 0.2705882, 0, 1,
-1.739748, -1.678916, -2.315878, 1, 0.2745098, 0, 1,
-1.736235, 0.9284935, 1.126178, 1, 0.282353, 0, 1,
-1.716059, 0.5458958, -2.118257, 1, 0.2862745, 0, 1,
-1.708055, 0.09068345, -0.6160153, 1, 0.2941177, 0, 1,
-1.694386, 0.786971, -1.693478, 1, 0.3019608, 0, 1,
-1.691221, -0.358532, -0.8223599, 1, 0.3058824, 0, 1,
-1.680596, 0.5075039, -1.733161, 1, 0.3137255, 0, 1,
-1.669007, 0.7400982, 0.1259283, 1, 0.3176471, 0, 1,
-1.667856, 0.009266013, -3.461045, 1, 0.3254902, 0, 1,
-1.665154, 0.9351906, -2.910104, 1, 0.3294118, 0, 1,
-1.661514, -0.3654847, -0.397566, 1, 0.3372549, 0, 1,
-1.598119, 0.8909199, -0.2830066, 1, 0.3411765, 0, 1,
-1.597003, 1.314826, 0.6884189, 1, 0.3490196, 0, 1,
-1.579851, -0.08416659, -0.7340915, 1, 0.3529412, 0, 1,
-1.563221, -0.4881287, -0.02874755, 1, 0.3607843, 0, 1,
-1.549627, -0.3593324, 0.02553781, 1, 0.3647059, 0, 1,
-1.529698, 0.6046861, -1.619609, 1, 0.372549, 0, 1,
-1.51635, 1.172482, -1.435902, 1, 0.3764706, 0, 1,
-1.513494, 0.8654477, -0.8974398, 1, 0.3843137, 0, 1,
-1.511179, 0.5453392, -1.661432, 1, 0.3882353, 0, 1,
-1.506893, -1.944005, -3.731828, 1, 0.3960784, 0, 1,
-1.506864, 0.9424422, 0.03862035, 1, 0.4039216, 0, 1,
-1.506173, 0.9007489, -2.188775, 1, 0.4078431, 0, 1,
-1.504721, -1.098195, -4.067363, 1, 0.4156863, 0, 1,
-1.496388, -1.877175, -2.277606, 1, 0.4196078, 0, 1,
-1.494148, 0.8755062, -2.449509, 1, 0.427451, 0, 1,
-1.491819, 0.9012814, -0.7189735, 1, 0.4313726, 0, 1,
-1.480188, 0.5470741, -1.548129, 1, 0.4392157, 0, 1,
-1.476192, -0.4075267, -1.242671, 1, 0.4431373, 0, 1,
-1.470445, -0.532191, -1.285235, 1, 0.4509804, 0, 1,
-1.451809, 0.4404057, -0.2784247, 1, 0.454902, 0, 1,
-1.45017, 1.658946, -1.577304, 1, 0.4627451, 0, 1,
-1.449136, -1.505001, -1.409051, 1, 0.4666667, 0, 1,
-1.444955, 2.210984, -0.4577947, 1, 0.4745098, 0, 1,
-1.439427, -0.3056679, -1.100312, 1, 0.4784314, 0, 1,
-1.439365, 0.08362167, -1.1478, 1, 0.4862745, 0, 1,
-1.438583, 0.5495123, -3.100285, 1, 0.4901961, 0, 1,
-1.436043, 0.08417612, -2.163625, 1, 0.4980392, 0, 1,
-1.43207, 0.2567225, -0.4436084, 1, 0.5058824, 0, 1,
-1.422826, -0.1087615, -0.3011279, 1, 0.509804, 0, 1,
-1.419386, -0.6982563, -2.526898, 1, 0.5176471, 0, 1,
-1.413626, -0.62212, -0.7769831, 1, 0.5215687, 0, 1,
-1.407496, 0.9491518, -1.754523, 1, 0.5294118, 0, 1,
-1.388791, -1.022982, -1.268899, 1, 0.5333334, 0, 1,
-1.388086, 0.3800828, -3.659679, 1, 0.5411765, 0, 1,
-1.368282, -0.7921109, -1.300763, 1, 0.5450981, 0, 1,
-1.365322, -0.35569, -2.895954, 1, 0.5529412, 0, 1,
-1.36278, 0.07144119, -0.2062561, 1, 0.5568628, 0, 1,
-1.347392, 0.8817515, -0.6744432, 1, 0.5647059, 0, 1,
-1.347304, -0.9498923, -2.898285, 1, 0.5686275, 0, 1,
-1.341643, 1.591676, -0.3708329, 1, 0.5764706, 0, 1,
-1.340189, 0.9742061, -1.554786, 1, 0.5803922, 0, 1,
-1.334367, -0.04273227, -3.263363, 1, 0.5882353, 0, 1,
-1.31925, 0.9345939, -0.632169, 1, 0.5921569, 0, 1,
-1.302521, 0.08918346, -1.731881, 1, 0.6, 0, 1,
-1.299667, 0.02060365, -1.952197, 1, 0.6078432, 0, 1,
-1.290082, -0.7107151, -2.814984, 1, 0.6117647, 0, 1,
-1.286515, -0.5412931, -2.335074, 1, 0.6196079, 0, 1,
-1.276501, 0.6732355, -1.343843, 1, 0.6235294, 0, 1,
-1.274517, 0.9215394, 0.08190801, 1, 0.6313726, 0, 1,
-1.269907, 0.1567585, -0.6921149, 1, 0.6352941, 0, 1,
-1.258992, 0.4789108, -0.5592066, 1, 0.6431373, 0, 1,
-1.250014, 1.518008, -0.01191162, 1, 0.6470588, 0, 1,
-1.247092, 1.107209, -0.05919103, 1, 0.654902, 0, 1,
-1.243026, 0.4897566, -0.6374473, 1, 0.6588235, 0, 1,
-1.234378, 0.6577808, 0.8328121, 1, 0.6666667, 0, 1,
-1.219042, -0.5189366, -0.2820944, 1, 0.6705883, 0, 1,
-1.208854, 0.4868687, -1.007915, 1, 0.6784314, 0, 1,
-1.198929, -1.501754, -1.323715, 1, 0.682353, 0, 1,
-1.196431, 0.1014448, -3.47216, 1, 0.6901961, 0, 1,
-1.189499, 0.7920447, -0.9363741, 1, 0.6941177, 0, 1,
-1.168602, 0.4954633, -2.67997, 1, 0.7019608, 0, 1,
-1.167784, -1.857329, -4.067928, 1, 0.7098039, 0, 1,
-1.165095, -0.2761377, -2.242286, 1, 0.7137255, 0, 1,
-1.164026, -0.1218797, -1.925996, 1, 0.7215686, 0, 1,
-1.156323, 0.1254251, -0.8088908, 1, 0.7254902, 0, 1,
-1.155153, 1.437922, 1.228621, 1, 0.7333333, 0, 1,
-1.154619, 0.6551361, -1.551095, 1, 0.7372549, 0, 1,
-1.149533, 0.4510043, 0.3698146, 1, 0.7450981, 0, 1,
-1.147053, -0.5657558, -2.402195, 1, 0.7490196, 0, 1,
-1.136897, 1.480449, 0.4475758, 1, 0.7568628, 0, 1,
-1.13505, 0.5260282, -1.32017, 1, 0.7607843, 0, 1,
-1.128152, -1.083673, -1.417885, 1, 0.7686275, 0, 1,
-1.120947, 1.582286, -1.175481, 1, 0.772549, 0, 1,
-1.116843, 0.637731, -2.446097, 1, 0.7803922, 0, 1,
-1.113668, 0.2417936, -3.326632, 1, 0.7843137, 0, 1,
-1.108488, -2.572882, -3.633792, 1, 0.7921569, 0, 1,
-1.101891, 0.2031054, -0.2646272, 1, 0.7960784, 0, 1,
-1.101406, -0.4679649, -2.986658, 1, 0.8039216, 0, 1,
-1.101253, 0.100466, -2.125106, 1, 0.8117647, 0, 1,
-1.089547, 1.663243, -1.558702, 1, 0.8156863, 0, 1,
-1.08731, -0.4058853, -2.976557, 1, 0.8235294, 0, 1,
-1.084064, -1.450523, -2.908978, 1, 0.827451, 0, 1,
-1.077395, 0.3786724, -3.076659, 1, 0.8352941, 0, 1,
-1.076123, 1.036685, 0.2646534, 1, 0.8392157, 0, 1,
-1.076008, 0.3979411, -3.52712, 1, 0.8470588, 0, 1,
-1.072901, 2.651073, -1.135077, 1, 0.8509804, 0, 1,
-1.072833, -0.5759003, -1.403928, 1, 0.8588235, 0, 1,
-1.071167, -0.8744145, -1.973463, 1, 0.8627451, 0, 1,
-1.070718, 0.1439746, -0.9870438, 1, 0.8705882, 0, 1,
-1.070551, 0.1327413, -0.8137864, 1, 0.8745098, 0, 1,
-1.066713, 0.4364125, 0.7378747, 1, 0.8823529, 0, 1,
-1.063414, -0.3645304, -2.683214, 1, 0.8862745, 0, 1,
-1.063351, -0.8018993, -1.247546, 1, 0.8941177, 0, 1,
-1.059664, 0.6531199, -0.6813209, 1, 0.8980392, 0, 1,
-1.057049, 0.2493754, -1.87206, 1, 0.9058824, 0, 1,
-1.05062, 1.034861, 0.5600198, 1, 0.9137255, 0, 1,
-1.045479, -0.5650168, -2.547198, 1, 0.9176471, 0, 1,
-1.042422, -1.102821, -4.315159, 1, 0.9254902, 0, 1,
-1.042404, -1.410712, -2.703018, 1, 0.9294118, 0, 1,
-1.041838, -0.669137, -0.560461, 1, 0.9372549, 0, 1,
-1.0412, 0.2935424, -0.5550556, 1, 0.9411765, 0, 1,
-1.040604, -0.4233096, -3.283447, 1, 0.9490196, 0, 1,
-1.039567, 0.1147437, 0.2322232, 1, 0.9529412, 0, 1,
-1.031395, -1.931827, -3.210976, 1, 0.9607843, 0, 1,
-1.028569, -2.791289, -2.9848, 1, 0.9647059, 0, 1,
-1.024402, 0.7064844, -0.5065853, 1, 0.972549, 0, 1,
-1.021801, -1.370317, -4.493894, 1, 0.9764706, 0, 1,
-1.021275, -0.3549795, -3.027359, 1, 0.9843137, 0, 1,
-1.017335, 0.1656365, 0.609109, 1, 0.9882353, 0, 1,
-1.016562, 0.5718977, -0.9134429, 1, 0.9960784, 0, 1,
-1.015429, -0.6859525, -0.5487317, 0.9960784, 1, 0, 1,
-1.007685, -0.1845756, -1.624661, 0.9921569, 1, 0, 1,
-1.003891, -1.015255, -2.150696, 0.9843137, 1, 0, 1,
-0.9986393, -2.406101, -2.408615, 0.9803922, 1, 0, 1,
-0.9962158, -0.1416643, -2.062396, 0.972549, 1, 0, 1,
-0.9924564, -0.2563012, -1.086841, 0.9686275, 1, 0, 1,
-0.9866242, -0.1668276, -2.350775, 0.9607843, 1, 0, 1,
-0.986196, 1.055261, -3.185199, 0.9568627, 1, 0, 1,
-0.9850945, -0.5594072, -2.800604, 0.9490196, 1, 0, 1,
-0.9804661, 0.03927749, -1.619069, 0.945098, 1, 0, 1,
-0.9797522, -0.3927183, -1.858556, 0.9372549, 1, 0, 1,
-0.9767652, 0.4871971, 0.2001603, 0.9333333, 1, 0, 1,
-0.9651834, -1.525124, -4.361421, 0.9254902, 1, 0, 1,
-0.9525163, -0.8223589, -2.226983, 0.9215686, 1, 0, 1,
-0.948476, -1.863262, -3.292844, 0.9137255, 1, 0, 1,
-0.9464831, 0.1264694, -0.6435211, 0.9098039, 1, 0, 1,
-0.9430978, 0.6203874, 0.199978, 0.9019608, 1, 0, 1,
-0.9386279, -1.062965, -2.751219, 0.8941177, 1, 0, 1,
-0.9379856, -0.3313944, -0.8583254, 0.8901961, 1, 0, 1,
-0.9317045, 0.3979159, 0.3714069, 0.8823529, 1, 0, 1,
-0.9284023, 0.7871909, -1.139017, 0.8784314, 1, 0, 1,
-0.9223689, -0.4046884, -1.347629, 0.8705882, 1, 0, 1,
-0.9203674, 0.552839, 0.8263189, 0.8666667, 1, 0, 1,
-0.9186894, -0.2634673, 0.6654471, 0.8588235, 1, 0, 1,
-0.9161249, -0.7725927, -0.5873531, 0.854902, 1, 0, 1,
-0.9155839, 0.990591, -1.752001, 0.8470588, 1, 0, 1,
-0.913686, -0.3437629, -2.716032, 0.8431373, 1, 0, 1,
-0.9136613, 0.7632897, -3.882853, 0.8352941, 1, 0, 1,
-0.9104242, 1.306472, -1.884448, 0.8313726, 1, 0, 1,
-0.9041378, 0.4266577, -0.657084, 0.8235294, 1, 0, 1,
-0.9011582, -1.044379, -0.8838941, 0.8196079, 1, 0, 1,
-0.893072, 1.479859, -0.173522, 0.8117647, 1, 0, 1,
-0.8849856, 1.845445, -1.329945, 0.8078431, 1, 0, 1,
-0.8715726, -0.1823974, -3.396715, 0.8, 1, 0, 1,
-0.8711929, -0.7630931, -3.753652, 0.7921569, 1, 0, 1,
-0.8637019, 0.5460076, -2.221569, 0.7882353, 1, 0, 1,
-0.8555317, -0.6851325, -2.47192, 0.7803922, 1, 0, 1,
-0.8498635, 0.7224504, -1.590147, 0.7764706, 1, 0, 1,
-0.8496445, 1.61305, -0.5821856, 0.7686275, 1, 0, 1,
-0.8432564, -0.5345069, -1.800384, 0.7647059, 1, 0, 1,
-0.8390436, 0.6692464, 0.02935604, 0.7568628, 1, 0, 1,
-0.8335789, -0.4183051, -1.139567, 0.7529412, 1, 0, 1,
-0.8319963, 0.660649, 0.3139457, 0.7450981, 1, 0, 1,
-0.8296508, 1.798847, -2.480358, 0.7411765, 1, 0, 1,
-0.8287282, -0.8500993, -2.171637, 0.7333333, 1, 0, 1,
-0.8212954, 1.200823, -0.8102654, 0.7294118, 1, 0, 1,
-0.8156271, -0.3713645, -1.040857, 0.7215686, 1, 0, 1,
-0.8091987, 0.06670249, -1.315225, 0.7176471, 1, 0, 1,
-0.8045366, -0.5219312, -1.765454, 0.7098039, 1, 0, 1,
-0.7983439, 0.1344302, -0.820193, 0.7058824, 1, 0, 1,
-0.7979858, 1.472337, -0.6224393, 0.6980392, 1, 0, 1,
-0.7975656, 0.1832112, -2.84091, 0.6901961, 1, 0, 1,
-0.7954269, 0.4701391, -0.658774, 0.6862745, 1, 0, 1,
-0.7785843, 0.5852422, -0.8617502, 0.6784314, 1, 0, 1,
-0.7767845, 0.9927664, -0.6660918, 0.6745098, 1, 0, 1,
-0.7706518, 0.1444682, -1.817459, 0.6666667, 1, 0, 1,
-0.7704429, 0.695182, -0.8905614, 0.6627451, 1, 0, 1,
-0.7689328, 2.065796, 0.8231086, 0.654902, 1, 0, 1,
-0.7686536, 0.7457616, -0.1196102, 0.6509804, 1, 0, 1,
-0.7679031, 3.504469, 1.228404, 0.6431373, 1, 0, 1,
-0.7678698, -0.2743481, -2.612926, 0.6392157, 1, 0, 1,
-0.7625823, -0.3731763, -1.924647, 0.6313726, 1, 0, 1,
-0.7613577, 0.4377007, -1.830944, 0.627451, 1, 0, 1,
-0.7607989, -2.203961, -2.193971, 0.6196079, 1, 0, 1,
-0.7593896, 0.2862007, -1.528102, 0.6156863, 1, 0, 1,
-0.7576105, -0.1129161, -0.2274459, 0.6078432, 1, 0, 1,
-0.7513597, -0.6226666, -3.18105, 0.6039216, 1, 0, 1,
-0.7509003, -0.9273688, -1.540818, 0.5960785, 1, 0, 1,
-0.7457854, 1.031989, -2.305654, 0.5882353, 1, 0, 1,
-0.7451762, -0.5863242, -0.9713744, 0.5843138, 1, 0, 1,
-0.7448216, 0.8832268, -0.5680538, 0.5764706, 1, 0, 1,
-0.7445393, 2.848233, 0.620542, 0.572549, 1, 0, 1,
-0.7422705, 0.8309986, -1.344491, 0.5647059, 1, 0, 1,
-0.7414607, 0.05149564, 0.7880312, 0.5607843, 1, 0, 1,
-0.7409192, -0.6958008, -0.9279674, 0.5529412, 1, 0, 1,
-0.7357544, 1.579919, 1.439378, 0.5490196, 1, 0, 1,
-0.7357258, 0.002753208, -2.212945, 0.5411765, 1, 0, 1,
-0.7356406, 0.03388174, 0.07494032, 0.5372549, 1, 0, 1,
-0.7300823, 1.69674, -2.284618, 0.5294118, 1, 0, 1,
-0.7246181, 0.6441851, -0.2957576, 0.5254902, 1, 0, 1,
-0.7243272, 0.02497525, -0.7490663, 0.5176471, 1, 0, 1,
-0.7203372, -0.3920857, -2.622982, 0.5137255, 1, 0, 1,
-0.7169384, -0.5418582, -1.945853, 0.5058824, 1, 0, 1,
-0.7129852, -0.7497392, -2.827745, 0.5019608, 1, 0, 1,
-0.7124886, 0.8014542, -0.9103251, 0.4941176, 1, 0, 1,
-0.7093412, 0.8122854, -2.393753, 0.4862745, 1, 0, 1,
-0.7090151, 0.1276697, -0.9924968, 0.4823529, 1, 0, 1,
-0.7076892, -0.3874698, -3.470617, 0.4745098, 1, 0, 1,
-0.705113, -0.3861313, -2.127969, 0.4705882, 1, 0, 1,
-0.702501, 0.3652562, -1.323452, 0.4627451, 1, 0, 1,
-0.7014122, -1.742235, -1.326739, 0.4588235, 1, 0, 1,
-0.6992012, 1.325117, -0.2778541, 0.4509804, 1, 0, 1,
-0.6954851, -0.2013174, -2.969019, 0.4470588, 1, 0, 1,
-0.6933016, -0.2027747, -3.335877, 0.4392157, 1, 0, 1,
-0.6864562, 2.033207, 0.1225337, 0.4352941, 1, 0, 1,
-0.6839932, -0.8772303, -1.983162, 0.427451, 1, 0, 1,
-0.6811273, -0.2056335, -1.505962, 0.4235294, 1, 0, 1,
-0.6775766, 0.6227509, -1.045721, 0.4156863, 1, 0, 1,
-0.6693959, 0.1287681, 0.09758113, 0.4117647, 1, 0, 1,
-0.6677924, 0.3135621, 0.4811417, 0.4039216, 1, 0, 1,
-0.6517026, 0.1106925, -2.354973, 0.3960784, 1, 0, 1,
-0.6506181, 1.337594, 0.9628785, 0.3921569, 1, 0, 1,
-0.6494166, -2.336726, -3.499134, 0.3843137, 1, 0, 1,
-0.6491226, 2.171312, -0.1034375, 0.3803922, 1, 0, 1,
-0.6486808, -0.4930772, -2.84768, 0.372549, 1, 0, 1,
-0.6439494, -0.4172825, -1.470262, 0.3686275, 1, 0, 1,
-0.637958, -0.05956003, -0.2407964, 0.3607843, 1, 0, 1,
-0.63648, -0.8783801, -2.04853, 0.3568628, 1, 0, 1,
-0.6345149, -1.766517, -3.05402, 0.3490196, 1, 0, 1,
-0.6320623, -0.03161972, -2.586633, 0.345098, 1, 0, 1,
-0.6154958, -0.2029344, -1.370915, 0.3372549, 1, 0, 1,
-0.6152709, -0.1044943, 0.2401139, 0.3333333, 1, 0, 1,
-0.6148409, -0.3044591, -3.451092, 0.3254902, 1, 0, 1,
-0.6112693, -0.3687884, -1.037041, 0.3215686, 1, 0, 1,
-0.6112374, -0.4958014, -1.915534, 0.3137255, 1, 0, 1,
-0.6095605, -0.1708333, -1.712759, 0.3098039, 1, 0, 1,
-0.6087997, -1.772711, -3.203036, 0.3019608, 1, 0, 1,
-0.6081448, -1.394228, -3.867079, 0.2941177, 1, 0, 1,
-0.6049964, -0.3005104, 0.7084798, 0.2901961, 1, 0, 1,
-0.6049815, -0.4744871, -0.4164291, 0.282353, 1, 0, 1,
-0.6032761, 0.347818, 2.394762, 0.2784314, 1, 0, 1,
-0.600324, -1.062746, -1.684946, 0.2705882, 1, 0, 1,
-0.598025, 0.2160619, 0.4391346, 0.2666667, 1, 0, 1,
-0.5978675, -0.8449506, -3.136793, 0.2588235, 1, 0, 1,
-0.5943364, -0.8955532, -1.751439, 0.254902, 1, 0, 1,
-0.5941486, 2.045478, 0.4590057, 0.2470588, 1, 0, 1,
-0.5941115, 0.7578027, -1.577217, 0.2431373, 1, 0, 1,
-0.5928371, -0.2637783, -1.67279, 0.2352941, 1, 0, 1,
-0.589166, 0.1585136, -2.181003, 0.2313726, 1, 0, 1,
-0.5878766, 0.7377561, -0.9251221, 0.2235294, 1, 0, 1,
-0.5867001, -0.7477433, -3.249728, 0.2196078, 1, 0, 1,
-0.585295, -0.6001482, -3.342145, 0.2117647, 1, 0, 1,
-0.58445, -0.9021724, -1.523189, 0.2078431, 1, 0, 1,
-0.5823659, 1.282177, 0.09807014, 0.2, 1, 0, 1,
-0.5789942, 0.339052, -0.7976885, 0.1921569, 1, 0, 1,
-0.5727058, 1.314866, -2.128947, 0.1882353, 1, 0, 1,
-0.5705369, 1.534787, 0.5076781, 0.1803922, 1, 0, 1,
-0.5684113, -0.4905213, -2.004046, 0.1764706, 1, 0, 1,
-0.5618767, -0.7855417, -1.699859, 0.1686275, 1, 0, 1,
-0.5603662, -0.001933618, -2.156813, 0.1647059, 1, 0, 1,
-0.5594563, -1.123986, -3.319192, 0.1568628, 1, 0, 1,
-0.5594477, -0.2866836, -2.491547, 0.1529412, 1, 0, 1,
-0.5565868, -1.085267, -3.428862, 0.145098, 1, 0, 1,
-0.5541742, -0.2621466, -1.113084, 0.1411765, 1, 0, 1,
-0.5533982, 1.242089, 0.6628454, 0.1333333, 1, 0, 1,
-0.5529419, 1.036955, -2.340916, 0.1294118, 1, 0, 1,
-0.5500519, -0.8938726, -3.624122, 0.1215686, 1, 0, 1,
-0.5467141, -1.474558, -2.392811, 0.1176471, 1, 0, 1,
-0.5460449, -0.09473254, -0.8356012, 0.1098039, 1, 0, 1,
-0.5409011, -1.874316, -1.1068, 0.1058824, 1, 0, 1,
-0.5349084, 1.012069, -1.365073, 0.09803922, 1, 0, 1,
-0.5338206, 0.1791872, -2.156006, 0.09019608, 1, 0, 1,
-0.5317377, -0.2164323, -1.392829, 0.08627451, 1, 0, 1,
-0.5309551, 0.288551, 0.4123576, 0.07843138, 1, 0, 1,
-0.5256813, -1.240428, -2.198332, 0.07450981, 1, 0, 1,
-0.5256791, 1.991977, 1.469066, 0.06666667, 1, 0, 1,
-0.5246505, -0.04991356, -2.464217, 0.0627451, 1, 0, 1,
-0.5245278, 0.6689265, -1.213928, 0.05490196, 1, 0, 1,
-0.5239173, 1.181911, -1.370391, 0.05098039, 1, 0, 1,
-0.5239028, 0.8760332, -1.207713, 0.04313726, 1, 0, 1,
-0.5221956, -0.5922039, -4.170482, 0.03921569, 1, 0, 1,
-0.5205465, 0.1548608, 1.282823, 0.03137255, 1, 0, 1,
-0.5173854, -0.4961863, -3.541584, 0.02745098, 1, 0, 1,
-0.5163838, -0.1618207, -0.5120573, 0.01960784, 1, 0, 1,
-0.5144975, 0.1341939, -0.494852, 0.01568628, 1, 0, 1,
-0.5139245, -0.8026162, -4.745362, 0.007843138, 1, 0, 1,
-0.5137056, 1.483901, -0.4540206, 0.003921569, 1, 0, 1,
-0.5130701, -0.4418395, -3.178679, 0, 1, 0.003921569, 1,
-0.5105314, 1.471159, -0.02216761, 0, 1, 0.01176471, 1,
-0.5054791, -0.807108, -2.663657, 0, 1, 0.01568628, 1,
-0.5041513, 0.2224874, -1.20013, 0, 1, 0.02352941, 1,
-0.5036553, -0.4280146, 0.604741, 0, 1, 0.02745098, 1,
-0.4989682, 0.9781001, -0.1320489, 0, 1, 0.03529412, 1,
-0.4931988, -0.6801075, -1.674107, 0, 1, 0.03921569, 1,
-0.4861194, -1.280598, -2.656133, 0, 1, 0.04705882, 1,
-0.4834585, 0.3183008, -1.480664, 0, 1, 0.05098039, 1,
-0.4823107, -0.3772239, -1.03953, 0, 1, 0.05882353, 1,
-0.4808749, 1.535173, -1.975663, 0, 1, 0.0627451, 1,
-0.4768615, 1.157472, -0.1085972, 0, 1, 0.07058824, 1,
-0.4727304, -2.005519, -4.015166, 0, 1, 0.07450981, 1,
-0.4645624, -0.5675969, -2.048925, 0, 1, 0.08235294, 1,
-0.4628137, 0.9524242, -1.745965, 0, 1, 0.08627451, 1,
-0.4624117, -1.234591, -2.909749, 0, 1, 0.09411765, 1,
-0.4557748, 0.1854566, -1.215647, 0, 1, 0.1019608, 1,
-0.4537122, -0.7770201, -3.446295, 0, 1, 0.1058824, 1,
-0.4519736, -0.6158147, -3.243225, 0, 1, 0.1137255, 1,
-0.4481342, -0.7993941, -2.81367, 0, 1, 0.1176471, 1,
-0.4481206, 0.9279138, 0.1431671, 0, 1, 0.1254902, 1,
-0.443188, -0.02493314, -1.413626, 0, 1, 0.1294118, 1,
-0.438836, 0.6594256, -0.6099502, 0, 1, 0.1372549, 1,
-0.4303023, -0.575135, -1.86842, 0, 1, 0.1411765, 1,
-0.4254659, 0.5603074, -2.622843, 0, 1, 0.1490196, 1,
-0.4247712, 1.024711, 1.092466, 0, 1, 0.1529412, 1,
-0.4216299, 1.539837, -1.757637, 0, 1, 0.1607843, 1,
-0.4170526, 1.282315, 0.9869558, 0, 1, 0.1647059, 1,
-0.4164489, -0.5094054, -3.021698, 0, 1, 0.172549, 1,
-0.4076786, -1.326944, -3.427543, 0, 1, 0.1764706, 1,
-0.4074993, -1.715994, -3.871265, 0, 1, 0.1843137, 1,
-0.4041923, 0.7450086, 0.3371902, 0, 1, 0.1882353, 1,
-0.4041309, -0.6717244, -3.658123, 0, 1, 0.1960784, 1,
-0.4003361, 1.715055, 0.8449082, 0, 1, 0.2039216, 1,
-0.3965013, 0.07863647, -0.9325445, 0, 1, 0.2078431, 1,
-0.3934534, 0.1558437, -2.169881, 0, 1, 0.2156863, 1,
-0.3886845, 0.2592095, 0.2327189, 0, 1, 0.2196078, 1,
-0.3880766, -0.2861608, -2.464432, 0, 1, 0.227451, 1,
-0.3767167, -0.9239506, -1.998686, 0, 1, 0.2313726, 1,
-0.3745243, 0.5409021, 0.2071525, 0, 1, 0.2392157, 1,
-0.3732786, -0.8502653, -2.000022, 0, 1, 0.2431373, 1,
-0.3721901, 0.5972791, -1.12615, 0, 1, 0.2509804, 1,
-0.3701708, 1.763748, -1.423217, 0, 1, 0.254902, 1,
-0.3683183, 1.41777, -0.588496, 0, 1, 0.2627451, 1,
-0.3674956, -0.3409753, -2.409031, 0, 1, 0.2666667, 1,
-0.3656246, 0.1021109, -1.633446, 0, 1, 0.2745098, 1,
-0.3630171, -0.9984624, -0.5482752, 0, 1, 0.2784314, 1,
-0.3627573, 0.6817042, 0.7178178, 0, 1, 0.2862745, 1,
-0.3606383, -1.225583, -3.06443, 0, 1, 0.2901961, 1,
-0.3560378, 0.03246125, -2.955773, 0, 1, 0.2980392, 1,
-0.3552385, 0.05683116, -1.072214, 0, 1, 0.3058824, 1,
-0.353707, -0.04339669, -1.633907, 0, 1, 0.3098039, 1,
-0.350501, 1.655658, -1.400833, 0, 1, 0.3176471, 1,
-0.3490787, 0.7010223, 0.9375505, 0, 1, 0.3215686, 1,
-0.3470127, -1.115171, -4.251078, 0, 1, 0.3294118, 1,
-0.3446555, -0.5717523, -3.309602, 0, 1, 0.3333333, 1,
-0.3434162, -1.014616, -4.498931, 0, 1, 0.3411765, 1,
-0.3423868, -0.2461599, -1.312296, 0, 1, 0.345098, 1,
-0.3422186, 0.04593359, -4.171132, 0, 1, 0.3529412, 1,
-0.3348113, -3.272016, -2.729823, 0, 1, 0.3568628, 1,
-0.3321753, -0.3197411, -3.94102, 0, 1, 0.3647059, 1,
-0.3284807, -0.1020335, -2.20143, 0, 1, 0.3686275, 1,
-0.3255934, -0.8037742, -2.545065, 0, 1, 0.3764706, 1,
-0.3214283, 1.008891, 0.2066358, 0, 1, 0.3803922, 1,
-0.3211835, -0.7316239, -0.5212871, 0, 1, 0.3882353, 1,
-0.3196157, 1.958179, 0.1040119, 0, 1, 0.3921569, 1,
-0.3188392, -0.6241191, -2.514427, 0, 1, 0.4, 1,
-0.3154452, -0.6071888, -2.929427, 0, 1, 0.4078431, 1,
-0.3123475, -0.3605914, -3.009624, 0, 1, 0.4117647, 1,
-0.3037308, -1.405928, -3.362474, 0, 1, 0.4196078, 1,
-0.3012482, 1.088549, 1.053387, 0, 1, 0.4235294, 1,
-0.2991014, 0.4342934, 0.07570919, 0, 1, 0.4313726, 1,
-0.2957941, 0.2243156, -1.298307, 0, 1, 0.4352941, 1,
-0.2956244, -1.303147, -1.247027, 0, 1, 0.4431373, 1,
-0.2946127, -0.8045531, -2.801379, 0, 1, 0.4470588, 1,
-0.2939752, -1.698781, -2.768102, 0, 1, 0.454902, 1,
-0.2893206, 0.2085789, 0.1453336, 0, 1, 0.4588235, 1,
-0.286992, -1.275544, -3.622587, 0, 1, 0.4666667, 1,
-0.2809815, 0.5446191, 0.5014257, 0, 1, 0.4705882, 1,
-0.2809621, -0.9172878, -3.287997, 0, 1, 0.4784314, 1,
-0.2807982, 1.506537, -0.7051614, 0, 1, 0.4823529, 1,
-0.2761591, 0.8608968, -0.7063097, 0, 1, 0.4901961, 1,
-0.2725503, -0.4084859, -1.826324, 0, 1, 0.4941176, 1,
-0.268764, -0.1939118, -2.416202, 0, 1, 0.5019608, 1,
-0.2618701, -0.8818104, -2.206851, 0, 1, 0.509804, 1,
-0.2567044, 0.5032806, 1.296234, 0, 1, 0.5137255, 1,
-0.2558722, -0.5858382, -3.796702, 0, 1, 0.5215687, 1,
-0.248826, -0.9814066, -1.062402, 0, 1, 0.5254902, 1,
-0.2443054, 0.7857116, -0.6381552, 0, 1, 0.5333334, 1,
-0.2432461, -0.1914417, -2.332296, 0, 1, 0.5372549, 1,
-0.242326, -0.2370011, -2.043695, 0, 1, 0.5450981, 1,
-0.2408196, -1.175366, -3.568387, 0, 1, 0.5490196, 1,
-0.2396177, -1.617192, -4.107487, 0, 1, 0.5568628, 1,
-0.2382378, 1.588389, 1.119065, 0, 1, 0.5607843, 1,
-0.2353706, -0.4631536, -3.466457, 0, 1, 0.5686275, 1,
-0.2343962, 1.604002, -0.8001537, 0, 1, 0.572549, 1,
-0.2322349, -1.028683, -1.532189, 0, 1, 0.5803922, 1,
-0.231188, -0.08959313, -3.60058, 0, 1, 0.5843138, 1,
-0.2309263, 0.9358388, -0.2079649, 0, 1, 0.5921569, 1,
-0.2301155, -0.3916914, -1.436571, 0, 1, 0.5960785, 1,
-0.2260468, 1.019408, -1.461113, 0, 1, 0.6039216, 1,
-0.2217977, 0.725833, 0.3829024, 0, 1, 0.6117647, 1,
-0.219424, -0.1874345, -2.369175, 0, 1, 0.6156863, 1,
-0.2182803, 1.130499, -0.9288427, 0, 1, 0.6235294, 1,
-0.2175886, -1.655337, -1.097742, 0, 1, 0.627451, 1,
-0.2158463, -1.296246, -3.767312, 0, 1, 0.6352941, 1,
-0.2154634, -0.1319443, -2.313875, 0, 1, 0.6392157, 1,
-0.2141222, -1.101244, -1.393806, 0, 1, 0.6470588, 1,
-0.2124337, 0.8249652, 0.838045, 0, 1, 0.6509804, 1,
-0.2095194, 0.7524057, 0.08556738, 0, 1, 0.6588235, 1,
-0.2064789, -0.1568021, -1.042415, 0, 1, 0.6627451, 1,
-0.2057767, -0.3264056, 0.07899311, 0, 1, 0.6705883, 1,
-0.1941025, 0.9408443, -0.1783, 0, 1, 0.6745098, 1,
-0.1881516, -0.8614276, -2.34251, 0, 1, 0.682353, 1,
-0.181012, 1.685117, 1.498881, 0, 1, 0.6862745, 1,
-0.1809935, -1.651294, -2.587144, 0, 1, 0.6941177, 1,
-0.1805618, 1.300388, 0.9783224, 0, 1, 0.7019608, 1,
-0.1786589, -1.362666, -3.31604, 0, 1, 0.7058824, 1,
-0.174122, -2.102578, -2.597417, 0, 1, 0.7137255, 1,
-0.1705226, -0.1244985, -0.8095383, 0, 1, 0.7176471, 1,
-0.1691023, 0.8661128, -0.5619898, 0, 1, 0.7254902, 1,
-0.1644353, -0.6212622, -5.014523, 0, 1, 0.7294118, 1,
-0.1597691, -0.6154726, -2.151727, 0, 1, 0.7372549, 1,
-0.1575119, 0.1260019, -1.746484, 0, 1, 0.7411765, 1,
-0.1541775, 0.7047694, 1.410176, 0, 1, 0.7490196, 1,
-0.1476224, 0.625935, -0.5240483, 0, 1, 0.7529412, 1,
-0.1432441, 1.153425, 1.10565, 0, 1, 0.7607843, 1,
-0.1429007, 0.4222122, -1.897659, 0, 1, 0.7647059, 1,
-0.1421515, 0.5103453, 1.670289, 0, 1, 0.772549, 1,
-0.1405306, -0.009336219, -0.1845443, 0, 1, 0.7764706, 1,
-0.1404226, -0.2184346, -1.414764, 0, 1, 0.7843137, 1,
-0.1399386, -1.082683, -1.646545, 0, 1, 0.7882353, 1,
-0.138687, 1.121007, 0.1540524, 0, 1, 0.7960784, 1,
-0.1342289, -0.9649841, -3.870985, 0, 1, 0.8039216, 1,
-0.1318491, -0.1877646, -4.360634, 0, 1, 0.8078431, 1,
-0.1272907, 0.842074, 0.5583233, 0, 1, 0.8156863, 1,
-0.1272093, 0.2101829, -2.348224, 0, 1, 0.8196079, 1,
-0.1271605, -0.1337778, -2.131865, 0, 1, 0.827451, 1,
-0.1240696, 0.2944469, -0.384019, 0, 1, 0.8313726, 1,
-0.123601, 1.503603, 1.096004, 0, 1, 0.8392157, 1,
-0.1230858, 1.123979, 0.4116235, 0, 1, 0.8431373, 1,
-0.1228523, -1.429396, -1.516285, 0, 1, 0.8509804, 1,
-0.1171778, 0.406671, -1.26157, 0, 1, 0.854902, 1,
-0.1104939, 2.199952, -0.2711621, 0, 1, 0.8627451, 1,
-0.1079853, -1.385876, -2.64835, 0, 1, 0.8666667, 1,
-0.1069133, -0.619882, -2.327878, 0, 1, 0.8745098, 1,
-0.1053008, -0.7483248, -0.9668835, 0, 1, 0.8784314, 1,
-0.1012788, 1.228266, -1.534666, 0, 1, 0.8862745, 1,
-0.09897607, 0.07710706, -1.012833, 0, 1, 0.8901961, 1,
-0.09656313, 1.103824, -1.79815, 0, 1, 0.8980392, 1,
-0.08404882, -0.02887455, -2.596806, 0, 1, 0.9058824, 1,
-0.08346942, 0.02090021, -2.56848, 0, 1, 0.9098039, 1,
-0.08079617, -0.8324044, -2.746327, 0, 1, 0.9176471, 1,
-0.07966622, 0.4106551, -0.8350138, 0, 1, 0.9215686, 1,
-0.078608, 0.4323534, 1.216183, 0, 1, 0.9294118, 1,
-0.07812078, 0.3630209, -0.5944608, 0, 1, 0.9333333, 1,
-0.07524036, -0.1864533, -4.078976, 0, 1, 0.9411765, 1,
-0.06877434, -0.7882359, -3.552432, 0, 1, 0.945098, 1,
-0.06821951, -1.656228, -3.971169, 0, 1, 0.9529412, 1,
-0.06555609, -1.112402, -2.336137, 0, 1, 0.9568627, 1,
-0.06172519, -0.08768845, -2.639456, 0, 1, 0.9647059, 1,
-0.06056317, 0.6611997, 0.8503743, 0, 1, 0.9686275, 1,
-0.05933957, 1.101672, -0.06343216, 0, 1, 0.9764706, 1,
-0.05839362, -1.396719, -3.049293, 0, 1, 0.9803922, 1,
-0.05621694, -0.4257991, -0.3356874, 0, 1, 0.9882353, 1,
-0.05458657, 1.320229, 0.3834347, 0, 1, 0.9921569, 1,
-0.05284848, 0.1654366, -0.3848633, 0, 1, 1, 1,
-0.05016441, -0.8309965, -3.145883, 0, 0.9921569, 1, 1,
-0.04706556, 1.063653, 0.0191912, 0, 0.9882353, 1, 1,
-0.04616396, 0.9305928, 0.07064132, 0, 0.9803922, 1, 1,
-0.04460189, -1.147345, -5.179509, 0, 0.9764706, 1, 1,
-0.0427089, 0.9975423, -0.1171291, 0, 0.9686275, 1, 1,
-0.04046886, -0.8898672, -3.711969, 0, 0.9647059, 1, 1,
-0.0399643, 0.4557107, -0.7332429, 0, 0.9568627, 1, 1,
-0.03748036, 2.437784, 0.1022744, 0, 0.9529412, 1, 1,
-0.0360551, 0.9470829, 0.3630347, 0, 0.945098, 1, 1,
-0.03504736, -1.248465, -3.744423, 0, 0.9411765, 1, 1,
-0.02965555, 0.3069099, -1.601397, 0, 0.9333333, 1, 1,
-0.02841742, 1.361651, 0.04945193, 0, 0.9294118, 1, 1,
-0.02718524, -0.05104058, -1.5601, 0, 0.9215686, 1, 1,
-0.02373207, -0.2643174, -3.096061, 0, 0.9176471, 1, 1,
-0.01874242, 0.1905305, 0.0748715, 0, 0.9098039, 1, 1,
-0.01827052, -0.6147532, -2.383594, 0, 0.9058824, 1, 1,
-0.01775251, 0.9289068, 1.34961, 0, 0.8980392, 1, 1,
-0.01563796, -0.9247336, -2.487985, 0, 0.8901961, 1, 1,
-0.01391189, -2.482933, -2.947395, 0, 0.8862745, 1, 1,
-0.01301621, 0.2419722, 2.024356, 0, 0.8784314, 1, 1,
-0.01220493, -0.7136469, -3.885324, 0, 0.8745098, 1, 1,
-0.00981934, 0.7051936, 1.88377, 0, 0.8666667, 1, 1,
-0.009102304, 0.4317219, -0.5780604, 0, 0.8627451, 1, 1,
-0.00303595, -0.3372454, -5.017445, 0, 0.854902, 1, 1,
-0.002566712, 1.195881, -0.04173581, 0, 0.8509804, 1, 1,
-0.00213932, 0.5858476, -0.5710388, 0, 0.8431373, 1, 1,
-0.002043932, -0.4403054, -3.066869, 0, 0.8392157, 1, 1,
0.001357935, -0.6446859, 4.581559, 0, 0.8313726, 1, 1,
0.005485171, -1.022106, 1.518208, 0, 0.827451, 1, 1,
0.00700076, -0.3700845, 4.209862, 0, 0.8196079, 1, 1,
0.007023987, -1.116403, 2.676199, 0, 0.8156863, 1, 1,
0.01097648, -2.24051, 1.964013, 0, 0.8078431, 1, 1,
0.0116686, -0.9059463, 1.005067, 0, 0.8039216, 1, 1,
0.01936655, 1.154266, -0.2738827, 0, 0.7960784, 1, 1,
0.01962833, 1.458961, 0.1208104, 0, 0.7882353, 1, 1,
0.02269692, -0.8103868, 3.059948, 0, 0.7843137, 1, 1,
0.02411341, 0.08150072, -0.6734986, 0, 0.7764706, 1, 1,
0.02657424, -0.4541233, 3.85667, 0, 0.772549, 1, 1,
0.02690475, 0.1107677, -0.5441559, 0, 0.7647059, 1, 1,
0.03041406, 1.528648, 1.528797, 0, 0.7607843, 1, 1,
0.0380023, -0.3274906, 4.222708, 0, 0.7529412, 1, 1,
0.040507, -0.7809137, 3.619556, 0, 0.7490196, 1, 1,
0.04212691, -0.2877327, 3.141678, 0, 0.7411765, 1, 1,
0.04449657, -1.399751, 1.163317, 0, 0.7372549, 1, 1,
0.05369839, -1.696198, 2.798045, 0, 0.7294118, 1, 1,
0.05445211, 1.821967, 0.6906666, 0, 0.7254902, 1, 1,
0.05478063, -0.3796398, 1.000807, 0, 0.7176471, 1, 1,
0.05494309, -0.6282261, 2.64419, 0, 0.7137255, 1, 1,
0.05509393, -1.900554, 3.661587, 0, 0.7058824, 1, 1,
0.05761536, -0.9076919, 3.472375, 0, 0.6980392, 1, 1,
0.05792894, 1.713939, 1.63801, 0, 0.6941177, 1, 1,
0.05903662, 0.3451777, 0.1506055, 0, 0.6862745, 1, 1,
0.06213385, 1.136609, -0.1208998, 0, 0.682353, 1, 1,
0.06465437, -0.9639904, 3.221119, 0, 0.6745098, 1, 1,
0.07247541, -0.7177058, 1.695908, 0, 0.6705883, 1, 1,
0.0760041, -1.730137, 4.222041, 0, 0.6627451, 1, 1,
0.08499797, -1.668659, 4.518756, 0, 0.6588235, 1, 1,
0.0863601, 0.5900292, 1.002318, 0, 0.6509804, 1, 1,
0.08676238, -0.3511241, 1.408653, 0, 0.6470588, 1, 1,
0.08994007, -0.6162741, 3.8704, 0, 0.6392157, 1, 1,
0.09003954, -0.07909827, 4.329082, 0, 0.6352941, 1, 1,
0.09016877, -0.2017898, 2.32234, 0, 0.627451, 1, 1,
0.09237372, 0.8112743, 0.5341451, 0, 0.6235294, 1, 1,
0.09414627, -1.83513, 4.295998, 0, 0.6156863, 1, 1,
0.09418969, -0.4785797, 1.941777, 0, 0.6117647, 1, 1,
0.09559901, 0.03564414, 4.206241, 0, 0.6039216, 1, 1,
0.09796638, 0.9859455, 1.661896, 0, 0.5960785, 1, 1,
0.1000134, 1.454699, 0.6174278, 0, 0.5921569, 1, 1,
0.1007454, -1.551051, 2.220907, 0, 0.5843138, 1, 1,
0.1064197, 1.251957, -0.8902444, 0, 0.5803922, 1, 1,
0.1064388, -0.6523728, 3.178578, 0, 0.572549, 1, 1,
0.112673, 0.8288677, 0.9264407, 0, 0.5686275, 1, 1,
0.1127765, 0.4326671, 1.24224, 0, 0.5607843, 1, 1,
0.1178542, 0.6520557, -0.2819004, 0, 0.5568628, 1, 1,
0.121801, 1.22678, -0.916096, 0, 0.5490196, 1, 1,
0.1220246, -0.9340104, 3.898962, 0, 0.5450981, 1, 1,
0.1220558, -0.03955082, 2.048035, 0, 0.5372549, 1, 1,
0.1244887, 0.4597029, 1.122833, 0, 0.5333334, 1, 1,
0.1244922, 0.7008764, 0.6507193, 0, 0.5254902, 1, 1,
0.1245369, -1.853946, 2.492802, 0, 0.5215687, 1, 1,
0.1252925, -1.121441, 3.010441, 0, 0.5137255, 1, 1,
0.1263416, -0.8841009, 2.654188, 0, 0.509804, 1, 1,
0.1267974, -0.3927818, 3.673788, 0, 0.5019608, 1, 1,
0.1302764, 0.979242, 0.8257, 0, 0.4941176, 1, 1,
0.1313355, 0.9661692, -0.7531454, 0, 0.4901961, 1, 1,
0.1315026, 1.025174, -0.1120414, 0, 0.4823529, 1, 1,
0.1330132, -1.327948, 3.04765, 0, 0.4784314, 1, 1,
0.1373725, 0.7674327, 0.8349828, 0, 0.4705882, 1, 1,
0.1377715, -0.3948887, 3.9779, 0, 0.4666667, 1, 1,
0.1416461, -0.4788264, 2.377743, 0, 0.4588235, 1, 1,
0.1429811, -0.7961956, 3.298297, 0, 0.454902, 1, 1,
0.1459668, 0.04549976, 2.419954, 0, 0.4470588, 1, 1,
0.1482405, 0.1859546, 1.339403, 0, 0.4431373, 1, 1,
0.1497338, -0.1576927, 4.428835, 0, 0.4352941, 1, 1,
0.1500545, -1.413349, 2.88686, 0, 0.4313726, 1, 1,
0.1543378, -0.5190383, 1.231538, 0, 0.4235294, 1, 1,
0.1575483, -1.562126, 3.109936, 0, 0.4196078, 1, 1,
0.1614657, 0.3499818, -0.2677549, 0, 0.4117647, 1, 1,
0.1649603, -0.2239743, 1.660917, 0, 0.4078431, 1, 1,
0.1672091, -1.26656, 3.172983, 0, 0.4, 1, 1,
0.1730216, -0.523318, 3.500232, 0, 0.3921569, 1, 1,
0.1736596, 0.5983869, -1.114238, 0, 0.3882353, 1, 1,
0.1751067, -0.8519921, 1.190377, 0, 0.3803922, 1, 1,
0.1783921, 0.1745185, 2.490323, 0, 0.3764706, 1, 1,
0.178955, 1.386323, 1.18466, 0, 0.3686275, 1, 1,
0.1793838, -0.5137458, 3.692938, 0, 0.3647059, 1, 1,
0.1794052, 0.2498538, -0.04434355, 0, 0.3568628, 1, 1,
0.1796289, -0.4747592, 3.988526, 0, 0.3529412, 1, 1,
0.1824828, 0.9921926, 1.495717, 0, 0.345098, 1, 1,
0.1832078, 0.8496412, 1.128205, 0, 0.3411765, 1, 1,
0.1855085, -0.3710099, 2.045426, 0, 0.3333333, 1, 1,
0.1867239, -1.05142, 3.010592, 0, 0.3294118, 1, 1,
0.1874777, -0.0276214, 2.277825, 0, 0.3215686, 1, 1,
0.1951466, -2.521283, 2.934903, 0, 0.3176471, 1, 1,
0.1954795, 1.130427, -0.4626296, 0, 0.3098039, 1, 1,
0.1999978, -1.187106, 4.060315, 0, 0.3058824, 1, 1,
0.2053832, -0.6122394, 3.583392, 0, 0.2980392, 1, 1,
0.2121944, 0.8588017, 0.8783551, 0, 0.2901961, 1, 1,
0.2136783, -0.3645013, 2.855063, 0, 0.2862745, 1, 1,
0.2249845, 0.484786, 0.03561699, 0, 0.2784314, 1, 1,
0.233101, 0.131274, 1.51666, 0, 0.2745098, 1, 1,
0.2355339, -0.3725401, 3.681496, 0, 0.2666667, 1, 1,
0.2360709, -0.02859825, 1.981995, 0, 0.2627451, 1, 1,
0.2366582, 1.146734, 1.089044, 0, 0.254902, 1, 1,
0.2374991, -1.520045, 3.10342, 0, 0.2509804, 1, 1,
0.2375663, 0.04410848, -0.9687486, 0, 0.2431373, 1, 1,
0.2386987, -1.056355, 1.676349, 0, 0.2392157, 1, 1,
0.2395573, -1.29708, 1.549946, 0, 0.2313726, 1, 1,
0.2429565, 0.727095, -0.7282731, 0, 0.227451, 1, 1,
0.2464846, 1.181285, 1.293333, 0, 0.2196078, 1, 1,
0.2481415, 1.584983, 0.3330866, 0, 0.2156863, 1, 1,
0.2491892, 0.2691827, 0.1779777, 0, 0.2078431, 1, 1,
0.2507728, -1.905296, 3.698668, 0, 0.2039216, 1, 1,
0.2515285, 0.1854628, -0.2724988, 0, 0.1960784, 1, 1,
0.2561715, -0.05999684, 2.531826, 0, 0.1882353, 1, 1,
0.259283, -0.1003354, 2.05508, 0, 0.1843137, 1, 1,
0.2605406, 1.612598, 1.096842, 0, 0.1764706, 1, 1,
0.2640281, -0.7771099, 0.6467089, 0, 0.172549, 1, 1,
0.2674628, 1.161977, 0.7322955, 0, 0.1647059, 1, 1,
0.2677623, 2.048041, 2.120545, 0, 0.1607843, 1, 1,
0.2691823, -0.003025382, 0.9853261, 0, 0.1529412, 1, 1,
0.2751558, 0.8426619, -0.478663, 0, 0.1490196, 1, 1,
0.2840956, -0.6646969, 3.889486, 0, 0.1411765, 1, 1,
0.2881822, -0.4687745, 1.67366, 0, 0.1372549, 1, 1,
0.2893855, -2.574765, 3.977922, 0, 0.1294118, 1, 1,
0.2926067, -2.341458, 1.470469, 0, 0.1254902, 1, 1,
0.292749, -0.2622235, 3.140347, 0, 0.1176471, 1, 1,
0.2971392, 1.438056, -0.06789733, 0, 0.1137255, 1, 1,
0.2988755, 0.1041449, 1.816204, 0, 0.1058824, 1, 1,
0.2995226, 0.2412033, 1.311797, 0, 0.09803922, 1, 1,
0.3028796, -0.03641927, 3.674711, 0, 0.09411765, 1, 1,
0.3056281, -0.1693248, 3.292063, 0, 0.08627451, 1, 1,
0.3060307, 0.1292428, 1.011778, 0, 0.08235294, 1, 1,
0.3106337, 0.4088719, 1.503414, 0, 0.07450981, 1, 1,
0.3117444, -0.04162303, 1.871468, 0, 0.07058824, 1, 1,
0.3158301, 0.799589, 1.211291, 0, 0.0627451, 1, 1,
0.3163106, -1.32422, 5.036256, 0, 0.05882353, 1, 1,
0.31635, -1.773554, 2.411706, 0, 0.05098039, 1, 1,
0.3214375, -0.3628832, 1.502636, 0, 0.04705882, 1, 1,
0.3236946, -0.0413761, 1.172709, 0, 0.03921569, 1, 1,
0.3251691, 1.386781, 1.309883, 0, 0.03529412, 1, 1,
0.3270203, 1.32224, -0.7190214, 0, 0.02745098, 1, 1,
0.327131, -1.358415, 2.153543, 0, 0.02352941, 1, 1,
0.3277986, 0.5056052, 0.7137386, 0, 0.01568628, 1, 1,
0.3297544, 1.242558, -0.4380283, 0, 0.01176471, 1, 1,
0.3307769, 0.5761493, 1.173018, 0, 0.003921569, 1, 1,
0.3363781, -0.1280018, 2.553469, 0.003921569, 0, 1, 1,
0.3389055, 0.395318, 1.931343, 0.007843138, 0, 1, 1,
0.3437321, -0.8596439, 2.393197, 0.01568628, 0, 1, 1,
0.3464441, 0.3540804, -1.035559, 0.01960784, 0, 1, 1,
0.3516704, 0.1489848, 1.21358, 0.02745098, 0, 1, 1,
0.3536921, -1.480657, 3.782702, 0.03137255, 0, 1, 1,
0.3636461, -0.1501512, 2.425199, 0.03921569, 0, 1, 1,
0.3643129, -1.616247, 5.278327, 0.04313726, 0, 1, 1,
0.3711628, 0.2433114, 2.337479, 0.05098039, 0, 1, 1,
0.3718686, 0.01431922, 1.234438, 0.05490196, 0, 1, 1,
0.3722374, -0.6611838, 1.828271, 0.0627451, 0, 1, 1,
0.3809347, 0.014785, 0.4966353, 0.06666667, 0, 1, 1,
0.3814556, -0.3763393, 1.067215, 0.07450981, 0, 1, 1,
0.3826249, -0.3687329, 1.669349, 0.07843138, 0, 1, 1,
0.3836637, -0.9154797, 3.931569, 0.08627451, 0, 1, 1,
0.384602, 0.8121113, -0.3646014, 0.09019608, 0, 1, 1,
0.3885514, 0.5664485, 2.265479, 0.09803922, 0, 1, 1,
0.3914682, 0.304138, 0.4763815, 0.1058824, 0, 1, 1,
0.3925167, 2.385198, 1.441428, 0.1098039, 0, 1, 1,
0.3999644, 0.8855466, -1.841905, 0.1176471, 0, 1, 1,
0.4013926, -0.9532088, 2.959812, 0.1215686, 0, 1, 1,
0.4015326, -2.098123, 2.615547, 0.1294118, 0, 1, 1,
0.4016522, 0.5772355, 0.4605961, 0.1333333, 0, 1, 1,
0.4043132, -0.383535, 3.206622, 0.1411765, 0, 1, 1,
0.4052912, -0.5800911, 3.100899, 0.145098, 0, 1, 1,
0.405821, 0.3028059, -0.4150041, 0.1529412, 0, 1, 1,
0.4068542, 0.0363782, 1.753895, 0.1568628, 0, 1, 1,
0.4120846, 0.9391775, 1.18771, 0.1647059, 0, 1, 1,
0.4154866, -1.673766, 2.461442, 0.1686275, 0, 1, 1,
0.416821, -0.9016899, 2.823195, 0.1764706, 0, 1, 1,
0.4219076, -0.5862012, 3.909621, 0.1803922, 0, 1, 1,
0.4310424, 0.1800679, 0.9222583, 0.1882353, 0, 1, 1,
0.4361544, -0.5769494, 4.239211, 0.1921569, 0, 1, 1,
0.4370648, 0.4128239, 1.239471, 0.2, 0, 1, 1,
0.4374291, 0.3346211, 0.3886206, 0.2078431, 0, 1, 1,
0.4382039, -0.8871062, 1.451779, 0.2117647, 0, 1, 1,
0.439142, 0.8162623, 1.478877, 0.2196078, 0, 1, 1,
0.440506, 0.3746585, 1.819879, 0.2235294, 0, 1, 1,
0.4410904, -0.753484, 3.000041, 0.2313726, 0, 1, 1,
0.4420681, 0.415462, 0.7229109, 0.2352941, 0, 1, 1,
0.4438068, -0.3173992, 2.907923, 0.2431373, 0, 1, 1,
0.4490743, -0.9817559, 2.349786, 0.2470588, 0, 1, 1,
0.4566398, 0.6707215, 0.004531683, 0.254902, 0, 1, 1,
0.4656958, 0.5566393, 0.04224031, 0.2588235, 0, 1, 1,
0.4675335, 0.709596, -1.626675, 0.2666667, 0, 1, 1,
0.469535, -0.7177795, 2.055152, 0.2705882, 0, 1, 1,
0.4713701, -1.035844, 3.390086, 0.2784314, 0, 1, 1,
0.4717465, -0.6783035, 3.609088, 0.282353, 0, 1, 1,
0.4722014, 1.246158, 0.3592044, 0.2901961, 0, 1, 1,
0.4730221, -0.5720024, 2.026436, 0.2941177, 0, 1, 1,
0.4774297, -0.432582, 2.741176, 0.3019608, 0, 1, 1,
0.4797632, 0.4473417, 1.980803, 0.3098039, 0, 1, 1,
0.4843397, -1.779683, 3.041482, 0.3137255, 0, 1, 1,
0.486892, 0.1598589, 2.123587, 0.3215686, 0, 1, 1,
0.4901668, -1.82895, 2.695089, 0.3254902, 0, 1, 1,
0.4940052, -0.5019729, 2.771986, 0.3333333, 0, 1, 1,
0.4956049, 0.2422077, 0.9312514, 0.3372549, 0, 1, 1,
0.4971896, -0.2987789, 1.838053, 0.345098, 0, 1, 1,
0.4980597, 0.7274832, 0.2569929, 0.3490196, 0, 1, 1,
0.4999112, 1.28716, 0.1072208, 0.3568628, 0, 1, 1,
0.5065501, -0.4790614, 4.529253, 0.3607843, 0, 1, 1,
0.5105707, 0.2478727, 1.786191, 0.3686275, 0, 1, 1,
0.5141695, 0.5169042, 1.448224, 0.372549, 0, 1, 1,
0.5147756, -1.641928, 1.26372, 0.3803922, 0, 1, 1,
0.5209031, -0.004487475, 0.1048778, 0.3843137, 0, 1, 1,
0.5250214, -0.02072164, 2.85484, 0.3921569, 0, 1, 1,
0.5434242, -1.039985, 3.574953, 0.3960784, 0, 1, 1,
0.5443987, 1.338917, 2.005359, 0.4039216, 0, 1, 1,
0.545723, 0.6665408, 1.150629, 0.4117647, 0, 1, 1,
0.5459123, -0.506111, 2.065242, 0.4156863, 0, 1, 1,
0.5487962, 0.2223137, 0.9656234, 0.4235294, 0, 1, 1,
0.5488222, 1.175114, 0.2960486, 0.427451, 0, 1, 1,
0.552998, 0.5280495, -0.1275728, 0.4352941, 0, 1, 1,
0.5534503, 0.4746575, 0.6953077, 0.4392157, 0, 1, 1,
0.5551205, 1.111292, 0.251655, 0.4470588, 0, 1, 1,
0.5553297, 1.038192, 0.5533321, 0.4509804, 0, 1, 1,
0.5578991, 0.4933843, -0.2689262, 0.4588235, 0, 1, 1,
0.5594066, 0.4590685, 1.420908, 0.4627451, 0, 1, 1,
0.5606482, -0.08463275, 2.251456, 0.4705882, 0, 1, 1,
0.5630917, -0.5998056, 1.67878, 0.4745098, 0, 1, 1,
0.5644739, 1.627982, 1.114346, 0.4823529, 0, 1, 1,
0.5657088, 1.394083, -1.454228, 0.4862745, 0, 1, 1,
0.567633, -0.3202998, 3.695439, 0.4941176, 0, 1, 1,
0.5706599, -1.044428, 2.892558, 0.5019608, 0, 1, 1,
0.5724246, -0.5202996, 0.5125391, 0.5058824, 0, 1, 1,
0.5770566, 1.036674, 0.7496678, 0.5137255, 0, 1, 1,
0.5858017, -0.5260594, 2.831539, 0.5176471, 0, 1, 1,
0.5859973, 0.7382105, 0.8066509, 0.5254902, 0, 1, 1,
0.586476, 1.669751, -0.4452753, 0.5294118, 0, 1, 1,
0.5875136, -0.9548764, 3.154629, 0.5372549, 0, 1, 1,
0.5886208, 2.123523, -0.6258696, 0.5411765, 0, 1, 1,
0.5888618, -0.1991211, 0.3442498, 0.5490196, 0, 1, 1,
0.5910707, 0.698483, 1.162924, 0.5529412, 0, 1, 1,
0.5919287, -1.444564, 1.673564, 0.5607843, 0, 1, 1,
0.6066622, -1.396385, 1.899163, 0.5647059, 0, 1, 1,
0.607423, -0.4255427, 3.488655, 0.572549, 0, 1, 1,
0.6089224, -2.236194, 3.145861, 0.5764706, 0, 1, 1,
0.612589, -1.683806, 2.189106, 0.5843138, 0, 1, 1,
0.6178824, -0.06332487, -0.7320619, 0.5882353, 0, 1, 1,
0.6179057, -0.178403, 1.007162, 0.5960785, 0, 1, 1,
0.6186542, -0.04474067, 0.565581, 0.6039216, 0, 1, 1,
0.6259311, -0.2355383, 2.977905, 0.6078432, 0, 1, 1,
0.6316531, -0.8911623, 2.850986, 0.6156863, 0, 1, 1,
0.6344937, -0.7350799, 2.694355, 0.6196079, 0, 1, 1,
0.6375097, -0.0309518, 0.6932516, 0.627451, 0, 1, 1,
0.6405624, 0.04420062, -0.417403, 0.6313726, 0, 1, 1,
0.6456013, -0.2991027, 1.649702, 0.6392157, 0, 1, 1,
0.6518945, 1.303353, 1.161417, 0.6431373, 0, 1, 1,
0.6599239, 0.4103762, 3.021744, 0.6509804, 0, 1, 1,
0.661543, -0.316104, 1.723404, 0.654902, 0, 1, 1,
0.6628731, -1.066673, 1.498943, 0.6627451, 0, 1, 1,
0.6637468, -0.3894835, 2.050699, 0.6666667, 0, 1, 1,
0.6646194, 0.6233239, -0.5095443, 0.6745098, 0, 1, 1,
0.6666683, 1.485159, -0.335887, 0.6784314, 0, 1, 1,
0.6694159, -0.9771493, 2.364272, 0.6862745, 0, 1, 1,
0.676476, -1.151567, 3.411125, 0.6901961, 0, 1, 1,
0.6792011, 1.153613, -0.6310542, 0.6980392, 0, 1, 1,
0.6792848, -0.8296314, 2.488847, 0.7058824, 0, 1, 1,
0.6884248, 1.133224, 0.4517708, 0.7098039, 0, 1, 1,
0.6887926, -1.390136, 2.734757, 0.7176471, 0, 1, 1,
0.6938402, -0.4779214, 1.745898, 0.7215686, 0, 1, 1,
0.6945654, 1.867852, -0.06852029, 0.7294118, 0, 1, 1,
0.7189789, -0.4959267, 1.915521, 0.7333333, 0, 1, 1,
0.7327746, -1.608721, 2.74585, 0.7411765, 0, 1, 1,
0.7386467, -0.7313527, 0.489354, 0.7450981, 0, 1, 1,
0.7415672, -0.1566003, 2.689139, 0.7529412, 0, 1, 1,
0.7427039, 0.9304819, 1.597865, 0.7568628, 0, 1, 1,
0.7443134, 1.216309, 0.822508, 0.7647059, 0, 1, 1,
0.7446634, -2.383991, 3.484555, 0.7686275, 0, 1, 1,
0.7457699, 0.2971314, 2.06995, 0.7764706, 0, 1, 1,
0.7500945, 0.04072647, -0.1344936, 0.7803922, 0, 1, 1,
0.7538579, 1.470396, 1.945207, 0.7882353, 0, 1, 1,
0.7546327, -0.9777539, 2.696262, 0.7921569, 0, 1, 1,
0.7558296, 0.9565903, -0.9347741, 0.8, 0, 1, 1,
0.7574306, -0.9489309, 1.251843, 0.8078431, 0, 1, 1,
0.7576355, -2.896684, 2.455236, 0.8117647, 0, 1, 1,
0.7577351, 1.113227, 1.067044, 0.8196079, 0, 1, 1,
0.7632074, 0.9844859, 1.042383, 0.8235294, 0, 1, 1,
0.7660497, -1.262712, 3.725387, 0.8313726, 0, 1, 1,
0.766915, 1.636788, 0.5799367, 0.8352941, 0, 1, 1,
0.7672842, -0.3158364, 2.522323, 0.8431373, 0, 1, 1,
0.7696294, -1.642176, 1.427526, 0.8470588, 0, 1, 1,
0.7701133, -0.5648615, 3.401114, 0.854902, 0, 1, 1,
0.7716829, -2.121131, 1.698366, 0.8588235, 0, 1, 1,
0.7750787, 1.054784, 1.313753, 0.8666667, 0, 1, 1,
0.7796285, -1.738694, 4.631948, 0.8705882, 0, 1, 1,
0.7799805, -0.1748316, 2.302148, 0.8784314, 0, 1, 1,
0.7869906, 1.992494, 0.1264566, 0.8823529, 0, 1, 1,
0.7873535, 0.8069679, 0.7116473, 0.8901961, 0, 1, 1,
0.7920989, -0.05039244, 2.411075, 0.8941177, 0, 1, 1,
0.7956486, -0.4872666, 0.1185324, 0.9019608, 0, 1, 1,
0.7999065, 1.582487, -1.434787, 0.9098039, 0, 1, 1,
0.8028863, 1.218498, 0.1168224, 0.9137255, 0, 1, 1,
0.8041992, -1.308429, 1.172492, 0.9215686, 0, 1, 1,
0.8244725, -0.2316423, 2.022143, 0.9254902, 0, 1, 1,
0.8274441, -0.9479141, 3.250574, 0.9333333, 0, 1, 1,
0.8308581, 0.07252261, 1.764782, 0.9372549, 0, 1, 1,
0.8311509, -0.3671333, 1.619776, 0.945098, 0, 1, 1,
0.8346437, 0.3752519, 3.178703, 0.9490196, 0, 1, 1,
0.8411959, 0.8955348, -0.8765843, 0.9568627, 0, 1, 1,
0.8415785, 0.16923, 2.066725, 0.9607843, 0, 1, 1,
0.8424661, -0.73906, 1.59551, 0.9686275, 0, 1, 1,
0.8567301, 1.178892, 0.4904251, 0.972549, 0, 1, 1,
0.8611386, -0.2405088, 2.275277, 0.9803922, 0, 1, 1,
0.8739383, -0.5757514, 3.163663, 0.9843137, 0, 1, 1,
0.883074, 1.301897, 1.833912, 0.9921569, 0, 1, 1,
0.8888577, -0.8163466, 3.353997, 0.9960784, 0, 1, 1,
0.89486, -0.1372174, 1.313837, 1, 0, 0.9960784, 1,
0.8959734, 0.4282433, 1.113909, 1, 0, 0.9882353, 1,
0.8970105, 0.2109759, -0.414008, 1, 0, 0.9843137, 1,
0.8976453, 0.0371318, 2.408241, 1, 0, 0.9764706, 1,
0.9005339, -0.2109555, 3.658688, 1, 0, 0.972549, 1,
0.9013796, -1.030335, 5.115794, 1, 0, 0.9647059, 1,
0.9033864, 1.040183, 0.9712833, 1, 0, 0.9607843, 1,
0.9070342, -0.5584188, 2.094879, 1, 0, 0.9529412, 1,
0.9134105, 1.64527, -1.42633, 1, 0, 0.9490196, 1,
0.9186609, -1.360934, 2.335279, 1, 0, 0.9411765, 1,
0.9217476, -1.951875, 1.765063, 1, 0, 0.9372549, 1,
0.9263908, 0.7899607, 2.663978, 1, 0, 0.9294118, 1,
0.9280301, -1.100821, 2.214922, 1, 0, 0.9254902, 1,
0.9386232, -0.7412665, 2.801943, 1, 0, 0.9176471, 1,
0.9407738, 0.6182153, 0.2509404, 1, 0, 0.9137255, 1,
0.9429901, -0.03026751, 3.156529, 1, 0, 0.9058824, 1,
0.9452859, -0.9937069, 2.317048, 1, 0, 0.9019608, 1,
0.949487, 0.6536975, 2.412924, 1, 0, 0.8941177, 1,
0.9509169, -1.194955, 0.08445176, 1, 0, 0.8862745, 1,
0.9635248, 0.351157, 0.5166848, 1, 0, 0.8823529, 1,
0.9645124, 0.8856406, 2.927972, 1, 0, 0.8745098, 1,
0.9647968, 0.2378585, 2.706599, 1, 0, 0.8705882, 1,
0.9663755, -0.4979188, 0.8332953, 1, 0, 0.8627451, 1,
0.9667405, 1.170649, -0.8576142, 1, 0, 0.8588235, 1,
0.9669968, 0.02464566, 2.22616, 1, 0, 0.8509804, 1,
0.9722802, 0.5898941, 1.725267, 1, 0, 0.8470588, 1,
0.9764137, 1.103094, -0.6934465, 1, 0, 0.8392157, 1,
0.9798291, -0.296191, 1.536343, 1, 0, 0.8352941, 1,
0.9896786, -0.3914488, 1.663981, 1, 0, 0.827451, 1,
1.001823, -1.461104, 1.270942, 1, 0, 0.8235294, 1,
1.007213, -1.868913, 2.092383, 1, 0, 0.8156863, 1,
1.031048, -0.5479757, 1.821234, 1, 0, 0.8117647, 1,
1.036507, -0.6715712, 2.414429, 1, 0, 0.8039216, 1,
1.041986, 0.8881195, 0.3313978, 1, 0, 0.7960784, 1,
1.043765, -1.63206, 3.957861, 1, 0, 0.7921569, 1,
1.049394, -0.7035252, 2.298027, 1, 0, 0.7843137, 1,
1.053159, 0.03441219, 0.6125945, 1, 0, 0.7803922, 1,
1.056606, 0.4925006, 2.644701, 1, 0, 0.772549, 1,
1.056683, 0.4902052, 1.254364, 1, 0, 0.7686275, 1,
1.063852, 0.5888392, 1.576696, 1, 0, 0.7607843, 1,
1.067986, 0.4919066, 2.557087, 1, 0, 0.7568628, 1,
1.07729, 0.4718919, 1.791837, 1, 0, 0.7490196, 1,
1.080805, -0.8164366, 1.802373, 1, 0, 0.7450981, 1,
1.081624, 0.5558448, -0.5282274, 1, 0, 0.7372549, 1,
1.088169, -0.6117098, 0.5425724, 1, 0, 0.7333333, 1,
1.097626, 1.384069, 1.191016, 1, 0, 0.7254902, 1,
1.097932, -1.078035, 2.908139, 1, 0, 0.7215686, 1,
1.11125, 1.532083, 0.8686429, 1, 0, 0.7137255, 1,
1.125628, 0.07133853, 1.84867, 1, 0, 0.7098039, 1,
1.131724, 0.5985172, 2.272019, 1, 0, 0.7019608, 1,
1.14169, -0.9392587, 2.609996, 1, 0, 0.6941177, 1,
1.150431, 0.05239749, 2.140104, 1, 0, 0.6901961, 1,
1.153896, -0.5745307, 0.2342448, 1, 0, 0.682353, 1,
1.164395, -0.02382163, 1.209386, 1, 0, 0.6784314, 1,
1.164917, -0.8058835, 1.489933, 1, 0, 0.6705883, 1,
1.166137, -0.6309528, 2.476951, 1, 0, 0.6666667, 1,
1.177219, 0.5415385, 2.391884, 1, 0, 0.6588235, 1,
1.179299, 0.04961225, 0.8661979, 1, 0, 0.654902, 1,
1.182374, -1.36002, 1.209253, 1, 0, 0.6470588, 1,
1.18307, 0.2585811, 0.573662, 1, 0, 0.6431373, 1,
1.183382, -0.460601, 2.443032, 1, 0, 0.6352941, 1,
1.183744, -0.303761, 0.5260333, 1, 0, 0.6313726, 1,
1.192548, 0.3687984, -0.003603436, 1, 0, 0.6235294, 1,
1.196566, 0.9107549, 0.5708206, 1, 0, 0.6196079, 1,
1.200896, 0.07711829, 0.0001257595, 1, 0, 0.6117647, 1,
1.204614, -0.7114715, 1.93595, 1, 0, 0.6078432, 1,
1.204663, -0.7373703, 3.07498, 1, 0, 0.6, 1,
1.219161, 0.5019586, 1.069112, 1, 0, 0.5921569, 1,
1.23835, -0.8173494, 1.61063, 1, 0, 0.5882353, 1,
1.241973, 0.1561019, 1.313363, 1, 0, 0.5803922, 1,
1.2441, -0.1279223, 0.7675756, 1, 0, 0.5764706, 1,
1.24841, 1.425237, 1.470978, 1, 0, 0.5686275, 1,
1.253549, 0.5126243, 1.839866, 1, 0, 0.5647059, 1,
1.267426, -0.719012, 1.048656, 1, 0, 0.5568628, 1,
1.286432, -0.8500312, 3.256754, 1, 0, 0.5529412, 1,
1.287932, 0.5809334, 0.9039136, 1, 0, 0.5450981, 1,
1.304131, 0.2740712, 0.03237989, 1, 0, 0.5411765, 1,
1.320148, 0.5215257, -0.7832571, 1, 0, 0.5333334, 1,
1.326906, 0.3065378, 1.813911, 1, 0, 0.5294118, 1,
1.33408, -0.3203138, 1.302081, 1, 0, 0.5215687, 1,
1.338994, 1.269257, 1.230817, 1, 0, 0.5176471, 1,
1.350806, -0.2915483, 0.721522, 1, 0, 0.509804, 1,
1.359968, -0.597006, 1.329662, 1, 0, 0.5058824, 1,
1.362647, -0.4976914, 1.093108, 1, 0, 0.4980392, 1,
1.384237, 0.2038287, 1.343456, 1, 0, 0.4901961, 1,
1.385402, 1.920519, -0.006612736, 1, 0, 0.4862745, 1,
1.387332, -2.280201, 2.249784, 1, 0, 0.4784314, 1,
1.389484, 0.9959521, 0.4152842, 1, 0, 0.4745098, 1,
1.398394, -0.1712926, 2.589187, 1, 0, 0.4666667, 1,
1.400684, -0.671217, 4.165828, 1, 0, 0.4627451, 1,
1.401017, -0.6431769, 1.253043, 1, 0, 0.454902, 1,
1.402573, -1.481472, 4.431212, 1, 0, 0.4509804, 1,
1.405953, 0.1244791, 2.340759, 1, 0, 0.4431373, 1,
1.406371, 0.005470119, 2.597625, 1, 0, 0.4392157, 1,
1.416292, 0.3085444, 1.729129, 1, 0, 0.4313726, 1,
1.418254, -1.402838, 2.819607, 1, 0, 0.427451, 1,
1.428132, -1.297178, 1.792006, 1, 0, 0.4196078, 1,
1.431192, 0.3337005, 3.084772, 1, 0, 0.4156863, 1,
1.445179, 0.2552588, 0.9529144, 1, 0, 0.4078431, 1,
1.451838, 2.840308, -0.1438348, 1, 0, 0.4039216, 1,
1.458941, 0.53122, 0.7911627, 1, 0, 0.3960784, 1,
1.46014, -1.956372, 1.466634, 1, 0, 0.3882353, 1,
1.46667, -0.5427634, 2.63352, 1, 0, 0.3843137, 1,
1.469487, 1.419926, 1.104535, 1, 0, 0.3764706, 1,
1.473103, -0.812849, 1.994825, 1, 0, 0.372549, 1,
1.477389, 0.6250818, 0.7482721, 1, 0, 0.3647059, 1,
1.48604, 0.750947, 0.747627, 1, 0, 0.3607843, 1,
1.505761, -1.238706, 2.242152, 1, 0, 0.3529412, 1,
1.508021, -0.07077061, 0.9341027, 1, 0, 0.3490196, 1,
1.513441, 0.3843625, 1.610859, 1, 0, 0.3411765, 1,
1.51548, 0.2209772, 1.179758, 1, 0, 0.3372549, 1,
1.52535, 1.376804, 2.691768, 1, 0, 0.3294118, 1,
1.525482, 0.5206329, 1.51568, 1, 0, 0.3254902, 1,
1.528811, 1.370755, 0.9638325, 1, 0, 0.3176471, 1,
1.528905, 0.2163878, 0.7091031, 1, 0, 0.3137255, 1,
1.551745, -1.877717, 2.42207, 1, 0, 0.3058824, 1,
1.581005, -0.4607736, 1.148669, 1, 0, 0.2980392, 1,
1.583598, 0.5842069, 1.933635, 1, 0, 0.2941177, 1,
1.584718, -1.342069, 0.9385158, 1, 0, 0.2862745, 1,
1.585244, -0.2437716, 2.647322, 1, 0, 0.282353, 1,
1.587257, 0.4487668, 1.014039, 1, 0, 0.2745098, 1,
1.597678, -0.3799795, 2.602982, 1, 0, 0.2705882, 1,
1.605913, -2.399355, 4.400944, 1, 0, 0.2627451, 1,
1.616116, 0.3648566, 3.64243, 1, 0, 0.2588235, 1,
1.62988, -0.3373467, 0.7335778, 1, 0, 0.2509804, 1,
1.638529, 0.6083103, 0.4037302, 1, 0, 0.2470588, 1,
1.652662, -0.5371991, -0.7863225, 1, 0, 0.2392157, 1,
1.677033, 1.415679, 0.4785826, 1, 0, 0.2352941, 1,
1.700897, 0.1934949, 1.874386, 1, 0, 0.227451, 1,
1.701543, -0.9318565, 3.294561, 1, 0, 0.2235294, 1,
1.709767, -0.1469256, 1.932181, 1, 0, 0.2156863, 1,
1.72441, 1.644335, 0.9387453, 1, 0, 0.2117647, 1,
1.741272, -1.047239, 3.60486, 1, 0, 0.2039216, 1,
1.749174, 1.274791, 1.830777, 1, 0, 0.1960784, 1,
1.751922, 0.7600478, 1.635744, 1, 0, 0.1921569, 1,
1.784397, -0.1173296, 1.205464, 1, 0, 0.1843137, 1,
1.790278, 0.4140211, 1.600851, 1, 0, 0.1803922, 1,
1.810949, 0.2080986, 0.5406024, 1, 0, 0.172549, 1,
1.816631, -1.57798, 3.16606, 1, 0, 0.1686275, 1,
1.841345, -0.6295393, 1.641146, 1, 0, 0.1607843, 1,
1.873779, 0.001379051, 0.6423779, 1, 0, 0.1568628, 1,
1.879825, -0.6253948, 1.059753, 1, 0, 0.1490196, 1,
1.914407, -0.6414201, 1.981469, 1, 0, 0.145098, 1,
1.928172, -0.4748181, 1.205384, 1, 0, 0.1372549, 1,
1.939818, -0.420367, 3.580501, 1, 0, 0.1333333, 1,
1.954713, 0.5912032, 0.4562014, 1, 0, 0.1254902, 1,
1.97589, -2.725235, 3.340556, 1, 0, 0.1215686, 1,
2.016786, 0.4084662, 1.910538, 1, 0, 0.1137255, 1,
2.05924, 0.6187993, 1.152428, 1, 0, 0.1098039, 1,
2.063099, -0.7143603, 2.214377, 1, 0, 0.1019608, 1,
2.073258, 1.572841, 1.262238, 1, 0, 0.09411765, 1,
2.108557, -0.7288298, 3.062539, 1, 0, 0.09019608, 1,
2.125101, -1.7802, 2.853364, 1, 0, 0.08235294, 1,
2.127893, -0.1065239, 2.383885, 1, 0, 0.07843138, 1,
2.131246, -0.1058082, 3.106468, 1, 0, 0.07058824, 1,
2.19056, -0.07082966, 2.479944, 1, 0, 0.06666667, 1,
2.214512, 1.092158, 2.907677, 1, 0, 0.05882353, 1,
2.270102, -0.5145367, 1.523471, 1, 0, 0.05490196, 1,
2.273523, -0.423779, 1.489104, 1, 0, 0.04705882, 1,
2.300204, -1.395008, 0.4965799, 1, 0, 0.04313726, 1,
2.323702, -0.7341968, 0.8852242, 1, 0, 0.03529412, 1,
2.363668, -0.8406867, 2.140221, 1, 0, 0.03137255, 1,
2.38944, -0.727071, 1.680326, 1, 0, 0.02352941, 1,
2.736382, 0.543653, 2.277277, 1, 0, 0.01960784, 1,
2.740657, -1.894629, 1.429638, 1, 0, 0.01176471, 1,
2.867696, 0.9892382, 1.269674, 1, 0, 0.007843138, 1
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
-0.3000929, -4.42063, -6.952112, 0, -0.5, 0.5, 0.5,
-0.3000929, -4.42063, -6.952112, 1, -0.5, 0.5, 0.5,
-0.3000929, -4.42063, -6.952112, 1, 1.5, 0.5, 0.5,
-0.3000929, -4.42063, -6.952112, 0, 1.5, 0.5, 0.5
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
-4.541762, 0.1162264, -6.952112, 0, -0.5, 0.5, 0.5,
-4.541762, 0.1162264, -6.952112, 1, -0.5, 0.5, 0.5,
-4.541762, 0.1162264, -6.952112, 1, 1.5, 0.5, 0.5,
-4.541762, 0.1162264, -6.952112, 0, 1.5, 0.5, 0.5
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
-4.541762, -4.42063, 0.04940939, 0, -0.5, 0.5, 0.5,
-4.541762, -4.42063, 0.04940939, 1, -0.5, 0.5, 0.5,
-4.541762, -4.42063, 0.04940939, 1, 1.5, 0.5, 0.5,
-4.541762, -4.42063, 0.04940939, 0, 1.5, 0.5, 0.5
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
-3, -3.373664, -5.336376,
2, -3.373664, -5.336376,
-3, -3.373664, -5.336376,
-3, -3.548158, -5.605666,
-2, -3.373664, -5.336376,
-2, -3.548158, -5.605666,
-1, -3.373664, -5.336376,
-1, -3.548158, -5.605666,
0, -3.373664, -5.336376,
0, -3.548158, -5.605666,
1, -3.373664, -5.336376,
1, -3.548158, -5.605666,
2, -3.373664, -5.336376,
2, -3.548158, -5.605666
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
-3, -3.897147, -6.144244, 0, -0.5, 0.5, 0.5,
-3, -3.897147, -6.144244, 1, -0.5, 0.5, 0.5,
-3, -3.897147, -6.144244, 1, 1.5, 0.5, 0.5,
-3, -3.897147, -6.144244, 0, 1.5, 0.5, 0.5,
-2, -3.897147, -6.144244, 0, -0.5, 0.5, 0.5,
-2, -3.897147, -6.144244, 1, -0.5, 0.5, 0.5,
-2, -3.897147, -6.144244, 1, 1.5, 0.5, 0.5,
-2, -3.897147, -6.144244, 0, 1.5, 0.5, 0.5,
-1, -3.897147, -6.144244, 0, -0.5, 0.5, 0.5,
-1, -3.897147, -6.144244, 1, -0.5, 0.5, 0.5,
-1, -3.897147, -6.144244, 1, 1.5, 0.5, 0.5,
-1, -3.897147, -6.144244, 0, 1.5, 0.5, 0.5,
0, -3.897147, -6.144244, 0, -0.5, 0.5, 0.5,
0, -3.897147, -6.144244, 1, -0.5, 0.5, 0.5,
0, -3.897147, -6.144244, 1, 1.5, 0.5, 0.5,
0, -3.897147, -6.144244, 0, 1.5, 0.5, 0.5,
1, -3.897147, -6.144244, 0, -0.5, 0.5, 0.5,
1, -3.897147, -6.144244, 1, -0.5, 0.5, 0.5,
1, -3.897147, -6.144244, 1, 1.5, 0.5, 0.5,
1, -3.897147, -6.144244, 0, 1.5, 0.5, 0.5,
2, -3.897147, -6.144244, 0, -0.5, 0.5, 0.5,
2, -3.897147, -6.144244, 1, -0.5, 0.5, 0.5,
2, -3.897147, -6.144244, 1, 1.5, 0.5, 0.5,
2, -3.897147, -6.144244, 0, 1.5, 0.5, 0.5
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
-3.562916, -3, -5.336376,
-3.562916, 3, -5.336376,
-3.562916, -3, -5.336376,
-3.726057, -3, -5.605666,
-3.562916, -2, -5.336376,
-3.726057, -2, -5.605666,
-3.562916, -1, -5.336376,
-3.726057, -1, -5.605666,
-3.562916, 0, -5.336376,
-3.726057, 0, -5.605666,
-3.562916, 1, -5.336376,
-3.726057, 1, -5.605666,
-3.562916, 2, -5.336376,
-3.726057, 2, -5.605666,
-3.562916, 3, -5.336376,
-3.726057, 3, -5.605666
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
-4.052339, -3, -6.144244, 0, -0.5, 0.5, 0.5,
-4.052339, -3, -6.144244, 1, -0.5, 0.5, 0.5,
-4.052339, -3, -6.144244, 1, 1.5, 0.5, 0.5,
-4.052339, -3, -6.144244, 0, 1.5, 0.5, 0.5,
-4.052339, -2, -6.144244, 0, -0.5, 0.5, 0.5,
-4.052339, -2, -6.144244, 1, -0.5, 0.5, 0.5,
-4.052339, -2, -6.144244, 1, 1.5, 0.5, 0.5,
-4.052339, -2, -6.144244, 0, 1.5, 0.5, 0.5,
-4.052339, -1, -6.144244, 0, -0.5, 0.5, 0.5,
-4.052339, -1, -6.144244, 1, -0.5, 0.5, 0.5,
-4.052339, -1, -6.144244, 1, 1.5, 0.5, 0.5,
-4.052339, -1, -6.144244, 0, 1.5, 0.5, 0.5,
-4.052339, 0, -6.144244, 0, -0.5, 0.5, 0.5,
-4.052339, 0, -6.144244, 1, -0.5, 0.5, 0.5,
-4.052339, 0, -6.144244, 1, 1.5, 0.5, 0.5,
-4.052339, 0, -6.144244, 0, 1.5, 0.5, 0.5,
-4.052339, 1, -6.144244, 0, -0.5, 0.5, 0.5,
-4.052339, 1, -6.144244, 1, -0.5, 0.5, 0.5,
-4.052339, 1, -6.144244, 1, 1.5, 0.5, 0.5,
-4.052339, 1, -6.144244, 0, 1.5, 0.5, 0.5,
-4.052339, 2, -6.144244, 0, -0.5, 0.5, 0.5,
-4.052339, 2, -6.144244, 1, -0.5, 0.5, 0.5,
-4.052339, 2, -6.144244, 1, 1.5, 0.5, 0.5,
-4.052339, 2, -6.144244, 0, 1.5, 0.5, 0.5,
-4.052339, 3, -6.144244, 0, -0.5, 0.5, 0.5,
-4.052339, 3, -6.144244, 1, -0.5, 0.5, 0.5,
-4.052339, 3, -6.144244, 1, 1.5, 0.5, 0.5,
-4.052339, 3, -6.144244, 0, 1.5, 0.5, 0.5
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
-3.562916, -3.373664, -4,
-3.562916, -3.373664, 4,
-3.562916, -3.373664, -4,
-3.726057, -3.548158, -4,
-3.562916, -3.373664, -2,
-3.726057, -3.548158, -2,
-3.562916, -3.373664, 0,
-3.726057, -3.548158, 0,
-3.562916, -3.373664, 2,
-3.726057, -3.548158, 2,
-3.562916, -3.373664, 4,
-3.726057, -3.548158, 4
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
-4.052339, -3.897147, -4, 0, -0.5, 0.5, 0.5,
-4.052339, -3.897147, -4, 1, -0.5, 0.5, 0.5,
-4.052339, -3.897147, -4, 1, 1.5, 0.5, 0.5,
-4.052339, -3.897147, -4, 0, 1.5, 0.5, 0.5,
-4.052339, -3.897147, -2, 0, -0.5, 0.5, 0.5,
-4.052339, -3.897147, -2, 1, -0.5, 0.5, 0.5,
-4.052339, -3.897147, -2, 1, 1.5, 0.5, 0.5,
-4.052339, -3.897147, -2, 0, 1.5, 0.5, 0.5,
-4.052339, -3.897147, 0, 0, -0.5, 0.5, 0.5,
-4.052339, -3.897147, 0, 1, -0.5, 0.5, 0.5,
-4.052339, -3.897147, 0, 1, 1.5, 0.5, 0.5,
-4.052339, -3.897147, 0, 0, 1.5, 0.5, 0.5,
-4.052339, -3.897147, 2, 0, -0.5, 0.5, 0.5,
-4.052339, -3.897147, 2, 1, -0.5, 0.5, 0.5,
-4.052339, -3.897147, 2, 1, 1.5, 0.5, 0.5,
-4.052339, -3.897147, 2, 0, 1.5, 0.5, 0.5,
-4.052339, -3.897147, 4, 0, -0.5, 0.5, 0.5,
-4.052339, -3.897147, 4, 1, -0.5, 0.5, 0.5,
-4.052339, -3.897147, 4, 1, 1.5, 0.5, 0.5,
-4.052339, -3.897147, 4, 0, 1.5, 0.5, 0.5
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
-3.562916, -3.373664, -5.336376,
-3.562916, 3.606117, -5.336376,
-3.562916, -3.373664, 5.435195,
-3.562916, 3.606117, 5.435195,
-3.562916, -3.373664, -5.336376,
-3.562916, -3.373664, 5.435195,
-3.562916, 3.606117, -5.336376,
-3.562916, 3.606117, 5.435195,
-3.562916, -3.373664, -5.336376,
2.96273, -3.373664, -5.336376,
-3.562916, -3.373664, 5.435195,
2.96273, -3.373664, 5.435195,
-3.562916, 3.606117, -5.336376,
2.96273, 3.606117, -5.336376,
-3.562916, 3.606117, 5.435195,
2.96273, 3.606117, 5.435195,
2.96273, -3.373664, -5.336376,
2.96273, 3.606117, -5.336376,
2.96273, -3.373664, 5.435195,
2.96273, 3.606117, 5.435195,
2.96273, -3.373664, -5.336376,
2.96273, -3.373664, 5.435195,
2.96273, 3.606117, -5.336376,
2.96273, 3.606117, 5.435195
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
var radius = 7.688729;
var distance = 34.20802;
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
mvMatrix.translate( 0.3000929, -0.1162264, -0.04940939 );
mvMatrix.scale( 1.273928, 1.191041, 0.7717727 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.20802);
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
famphur<-read.table("famphur.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-famphur$V2
```

```
## Error in eval(expr, envir, enclos): object 'famphur' not found
```

```r
y<-famphur$V3
```

```
## Error in eval(expr, envir, enclos): object 'famphur' not found
```

```r
z<-famphur$V4
```

```
## Error in eval(expr, envir, enclos): object 'famphur' not found
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
-3.467882, -0.7461327, -1.074808, 0, 0, 1, 1, 1,
-3.270335, -0.3136416, -2.96895, 1, 0, 0, 1, 1,
-3.067886, 0.4101202, -1.870125, 1, 0, 0, 1, 1,
-2.993127, 0.8259061, -2.060581, 1, 0, 0, 1, 1,
-2.956246, -1.106755, -2.074137, 1, 0, 0, 1, 1,
-2.912395, -1.337918, -1.409723, 1, 0, 0, 1, 1,
-2.823042, 0.63348, -1.850924, 0, 0, 0, 1, 1,
-2.664562, -1.238423, -0.923812, 0, 0, 0, 1, 1,
-2.631801, 1.390467, -1.62692, 0, 0, 0, 1, 1,
-2.505334, -0.1813077, -1.998431, 0, 0, 0, 1, 1,
-2.426829, 1.654981, -1.672196, 0, 0, 0, 1, 1,
-2.340279, 0.9381564, -1.140409, 0, 0, 0, 1, 1,
-2.33503, -0.1864486, -1.17452, 0, 0, 0, 1, 1,
-2.324513, -0.5063572, -3.593627, 1, 1, 1, 1, 1,
-2.32362, -0.7185064, -3.155192, 1, 1, 1, 1, 1,
-2.209894, 1.254025, -1.477655, 1, 1, 1, 1, 1,
-2.183941, -0.6306857, -2.944624, 1, 1, 1, 1, 1,
-2.175583, -0.2645008, -1.114285, 1, 1, 1, 1, 1,
-2.14481, 0.9882251, -0.7083232, 1, 1, 1, 1, 1,
-2.124987, -0.1544231, -3.86265, 1, 1, 1, 1, 1,
-2.117582, -0.5902476, -2.136371, 1, 1, 1, 1, 1,
-2.102654, 0.6133738, -1.390943, 1, 1, 1, 1, 1,
-2.065094, 0.4938052, -0.5661141, 1, 1, 1, 1, 1,
-2.053009, 1.369463, -1.55729, 1, 1, 1, 1, 1,
-2.051663, -1.538384, -1.754792, 1, 1, 1, 1, 1,
-2.046155, -1.017323, -2.217698, 1, 1, 1, 1, 1,
-2.042256, -2.948318, -1.558339, 1, 1, 1, 1, 1,
-2.039743, -0.6915019, -0.3131156, 1, 1, 1, 1, 1,
-2.018423, -0.360577, -1.740567, 0, 0, 1, 1, 1,
-1.973262, 0.4289479, -1.200606, 1, 0, 0, 1, 1,
-1.93464, -1.535314, -1.771834, 1, 0, 0, 1, 1,
-1.927278, -1.566125, -1.780445, 1, 0, 0, 1, 1,
-1.920859, -0.3415462, -3.12225, 1, 0, 0, 1, 1,
-1.919875, -0.7993296, -2.190625, 1, 0, 0, 1, 1,
-1.908293, -1.820434, -3.858121, 0, 0, 0, 1, 1,
-1.887875, -0.7704089, -3.099374, 0, 0, 0, 1, 1,
-1.884231, -1.568136, -2.741417, 0, 0, 0, 1, 1,
-1.867178, 0.5140964, -1.565785, 0, 0, 0, 1, 1,
-1.841154, 0.1793829, -2.193342, 0, 0, 0, 1, 1,
-1.836568, 0.1244113, 0.3379402, 0, 0, 0, 1, 1,
-1.817972, 1.982518, 0.8238334, 0, 0, 0, 1, 1,
-1.80654, 0.93991, -1.038877, 1, 1, 1, 1, 1,
-1.791999, 0.937085, 0.2916221, 1, 1, 1, 1, 1,
-1.777416, -0.04083151, -1.149011, 1, 1, 1, 1, 1,
-1.775753, 0.8813738, -1.925564, 1, 1, 1, 1, 1,
-1.762569, 1.36335, -0.8214391, 1, 1, 1, 1, 1,
-1.739748, -1.678916, -2.315878, 1, 1, 1, 1, 1,
-1.736235, 0.9284935, 1.126178, 1, 1, 1, 1, 1,
-1.716059, 0.5458958, -2.118257, 1, 1, 1, 1, 1,
-1.708055, 0.09068345, -0.6160153, 1, 1, 1, 1, 1,
-1.694386, 0.786971, -1.693478, 1, 1, 1, 1, 1,
-1.691221, -0.358532, -0.8223599, 1, 1, 1, 1, 1,
-1.680596, 0.5075039, -1.733161, 1, 1, 1, 1, 1,
-1.669007, 0.7400982, 0.1259283, 1, 1, 1, 1, 1,
-1.667856, 0.009266013, -3.461045, 1, 1, 1, 1, 1,
-1.665154, 0.9351906, -2.910104, 1, 1, 1, 1, 1,
-1.661514, -0.3654847, -0.397566, 0, 0, 1, 1, 1,
-1.598119, 0.8909199, -0.2830066, 1, 0, 0, 1, 1,
-1.597003, 1.314826, 0.6884189, 1, 0, 0, 1, 1,
-1.579851, -0.08416659, -0.7340915, 1, 0, 0, 1, 1,
-1.563221, -0.4881287, -0.02874755, 1, 0, 0, 1, 1,
-1.549627, -0.3593324, 0.02553781, 1, 0, 0, 1, 1,
-1.529698, 0.6046861, -1.619609, 0, 0, 0, 1, 1,
-1.51635, 1.172482, -1.435902, 0, 0, 0, 1, 1,
-1.513494, 0.8654477, -0.8974398, 0, 0, 0, 1, 1,
-1.511179, 0.5453392, -1.661432, 0, 0, 0, 1, 1,
-1.506893, -1.944005, -3.731828, 0, 0, 0, 1, 1,
-1.506864, 0.9424422, 0.03862035, 0, 0, 0, 1, 1,
-1.506173, 0.9007489, -2.188775, 0, 0, 0, 1, 1,
-1.504721, -1.098195, -4.067363, 1, 1, 1, 1, 1,
-1.496388, -1.877175, -2.277606, 1, 1, 1, 1, 1,
-1.494148, 0.8755062, -2.449509, 1, 1, 1, 1, 1,
-1.491819, 0.9012814, -0.7189735, 1, 1, 1, 1, 1,
-1.480188, 0.5470741, -1.548129, 1, 1, 1, 1, 1,
-1.476192, -0.4075267, -1.242671, 1, 1, 1, 1, 1,
-1.470445, -0.532191, -1.285235, 1, 1, 1, 1, 1,
-1.451809, 0.4404057, -0.2784247, 1, 1, 1, 1, 1,
-1.45017, 1.658946, -1.577304, 1, 1, 1, 1, 1,
-1.449136, -1.505001, -1.409051, 1, 1, 1, 1, 1,
-1.444955, 2.210984, -0.4577947, 1, 1, 1, 1, 1,
-1.439427, -0.3056679, -1.100312, 1, 1, 1, 1, 1,
-1.439365, 0.08362167, -1.1478, 1, 1, 1, 1, 1,
-1.438583, 0.5495123, -3.100285, 1, 1, 1, 1, 1,
-1.436043, 0.08417612, -2.163625, 1, 1, 1, 1, 1,
-1.43207, 0.2567225, -0.4436084, 0, 0, 1, 1, 1,
-1.422826, -0.1087615, -0.3011279, 1, 0, 0, 1, 1,
-1.419386, -0.6982563, -2.526898, 1, 0, 0, 1, 1,
-1.413626, -0.62212, -0.7769831, 1, 0, 0, 1, 1,
-1.407496, 0.9491518, -1.754523, 1, 0, 0, 1, 1,
-1.388791, -1.022982, -1.268899, 1, 0, 0, 1, 1,
-1.388086, 0.3800828, -3.659679, 0, 0, 0, 1, 1,
-1.368282, -0.7921109, -1.300763, 0, 0, 0, 1, 1,
-1.365322, -0.35569, -2.895954, 0, 0, 0, 1, 1,
-1.36278, 0.07144119, -0.2062561, 0, 0, 0, 1, 1,
-1.347392, 0.8817515, -0.6744432, 0, 0, 0, 1, 1,
-1.347304, -0.9498923, -2.898285, 0, 0, 0, 1, 1,
-1.341643, 1.591676, -0.3708329, 0, 0, 0, 1, 1,
-1.340189, 0.9742061, -1.554786, 1, 1, 1, 1, 1,
-1.334367, -0.04273227, -3.263363, 1, 1, 1, 1, 1,
-1.31925, 0.9345939, -0.632169, 1, 1, 1, 1, 1,
-1.302521, 0.08918346, -1.731881, 1, 1, 1, 1, 1,
-1.299667, 0.02060365, -1.952197, 1, 1, 1, 1, 1,
-1.290082, -0.7107151, -2.814984, 1, 1, 1, 1, 1,
-1.286515, -0.5412931, -2.335074, 1, 1, 1, 1, 1,
-1.276501, 0.6732355, -1.343843, 1, 1, 1, 1, 1,
-1.274517, 0.9215394, 0.08190801, 1, 1, 1, 1, 1,
-1.269907, 0.1567585, -0.6921149, 1, 1, 1, 1, 1,
-1.258992, 0.4789108, -0.5592066, 1, 1, 1, 1, 1,
-1.250014, 1.518008, -0.01191162, 1, 1, 1, 1, 1,
-1.247092, 1.107209, -0.05919103, 1, 1, 1, 1, 1,
-1.243026, 0.4897566, -0.6374473, 1, 1, 1, 1, 1,
-1.234378, 0.6577808, 0.8328121, 1, 1, 1, 1, 1,
-1.219042, -0.5189366, -0.2820944, 0, 0, 1, 1, 1,
-1.208854, 0.4868687, -1.007915, 1, 0, 0, 1, 1,
-1.198929, -1.501754, -1.323715, 1, 0, 0, 1, 1,
-1.196431, 0.1014448, -3.47216, 1, 0, 0, 1, 1,
-1.189499, 0.7920447, -0.9363741, 1, 0, 0, 1, 1,
-1.168602, 0.4954633, -2.67997, 1, 0, 0, 1, 1,
-1.167784, -1.857329, -4.067928, 0, 0, 0, 1, 1,
-1.165095, -0.2761377, -2.242286, 0, 0, 0, 1, 1,
-1.164026, -0.1218797, -1.925996, 0, 0, 0, 1, 1,
-1.156323, 0.1254251, -0.8088908, 0, 0, 0, 1, 1,
-1.155153, 1.437922, 1.228621, 0, 0, 0, 1, 1,
-1.154619, 0.6551361, -1.551095, 0, 0, 0, 1, 1,
-1.149533, 0.4510043, 0.3698146, 0, 0, 0, 1, 1,
-1.147053, -0.5657558, -2.402195, 1, 1, 1, 1, 1,
-1.136897, 1.480449, 0.4475758, 1, 1, 1, 1, 1,
-1.13505, 0.5260282, -1.32017, 1, 1, 1, 1, 1,
-1.128152, -1.083673, -1.417885, 1, 1, 1, 1, 1,
-1.120947, 1.582286, -1.175481, 1, 1, 1, 1, 1,
-1.116843, 0.637731, -2.446097, 1, 1, 1, 1, 1,
-1.113668, 0.2417936, -3.326632, 1, 1, 1, 1, 1,
-1.108488, -2.572882, -3.633792, 1, 1, 1, 1, 1,
-1.101891, 0.2031054, -0.2646272, 1, 1, 1, 1, 1,
-1.101406, -0.4679649, -2.986658, 1, 1, 1, 1, 1,
-1.101253, 0.100466, -2.125106, 1, 1, 1, 1, 1,
-1.089547, 1.663243, -1.558702, 1, 1, 1, 1, 1,
-1.08731, -0.4058853, -2.976557, 1, 1, 1, 1, 1,
-1.084064, -1.450523, -2.908978, 1, 1, 1, 1, 1,
-1.077395, 0.3786724, -3.076659, 1, 1, 1, 1, 1,
-1.076123, 1.036685, 0.2646534, 0, 0, 1, 1, 1,
-1.076008, 0.3979411, -3.52712, 1, 0, 0, 1, 1,
-1.072901, 2.651073, -1.135077, 1, 0, 0, 1, 1,
-1.072833, -0.5759003, -1.403928, 1, 0, 0, 1, 1,
-1.071167, -0.8744145, -1.973463, 1, 0, 0, 1, 1,
-1.070718, 0.1439746, -0.9870438, 1, 0, 0, 1, 1,
-1.070551, 0.1327413, -0.8137864, 0, 0, 0, 1, 1,
-1.066713, 0.4364125, 0.7378747, 0, 0, 0, 1, 1,
-1.063414, -0.3645304, -2.683214, 0, 0, 0, 1, 1,
-1.063351, -0.8018993, -1.247546, 0, 0, 0, 1, 1,
-1.059664, 0.6531199, -0.6813209, 0, 0, 0, 1, 1,
-1.057049, 0.2493754, -1.87206, 0, 0, 0, 1, 1,
-1.05062, 1.034861, 0.5600198, 0, 0, 0, 1, 1,
-1.045479, -0.5650168, -2.547198, 1, 1, 1, 1, 1,
-1.042422, -1.102821, -4.315159, 1, 1, 1, 1, 1,
-1.042404, -1.410712, -2.703018, 1, 1, 1, 1, 1,
-1.041838, -0.669137, -0.560461, 1, 1, 1, 1, 1,
-1.0412, 0.2935424, -0.5550556, 1, 1, 1, 1, 1,
-1.040604, -0.4233096, -3.283447, 1, 1, 1, 1, 1,
-1.039567, 0.1147437, 0.2322232, 1, 1, 1, 1, 1,
-1.031395, -1.931827, -3.210976, 1, 1, 1, 1, 1,
-1.028569, -2.791289, -2.9848, 1, 1, 1, 1, 1,
-1.024402, 0.7064844, -0.5065853, 1, 1, 1, 1, 1,
-1.021801, -1.370317, -4.493894, 1, 1, 1, 1, 1,
-1.021275, -0.3549795, -3.027359, 1, 1, 1, 1, 1,
-1.017335, 0.1656365, 0.609109, 1, 1, 1, 1, 1,
-1.016562, 0.5718977, -0.9134429, 1, 1, 1, 1, 1,
-1.015429, -0.6859525, -0.5487317, 1, 1, 1, 1, 1,
-1.007685, -0.1845756, -1.624661, 0, 0, 1, 1, 1,
-1.003891, -1.015255, -2.150696, 1, 0, 0, 1, 1,
-0.9986393, -2.406101, -2.408615, 1, 0, 0, 1, 1,
-0.9962158, -0.1416643, -2.062396, 1, 0, 0, 1, 1,
-0.9924564, -0.2563012, -1.086841, 1, 0, 0, 1, 1,
-0.9866242, -0.1668276, -2.350775, 1, 0, 0, 1, 1,
-0.986196, 1.055261, -3.185199, 0, 0, 0, 1, 1,
-0.9850945, -0.5594072, -2.800604, 0, 0, 0, 1, 1,
-0.9804661, 0.03927749, -1.619069, 0, 0, 0, 1, 1,
-0.9797522, -0.3927183, -1.858556, 0, 0, 0, 1, 1,
-0.9767652, 0.4871971, 0.2001603, 0, 0, 0, 1, 1,
-0.9651834, -1.525124, -4.361421, 0, 0, 0, 1, 1,
-0.9525163, -0.8223589, -2.226983, 0, 0, 0, 1, 1,
-0.948476, -1.863262, -3.292844, 1, 1, 1, 1, 1,
-0.9464831, 0.1264694, -0.6435211, 1, 1, 1, 1, 1,
-0.9430978, 0.6203874, 0.199978, 1, 1, 1, 1, 1,
-0.9386279, -1.062965, -2.751219, 1, 1, 1, 1, 1,
-0.9379856, -0.3313944, -0.8583254, 1, 1, 1, 1, 1,
-0.9317045, 0.3979159, 0.3714069, 1, 1, 1, 1, 1,
-0.9284023, 0.7871909, -1.139017, 1, 1, 1, 1, 1,
-0.9223689, -0.4046884, -1.347629, 1, 1, 1, 1, 1,
-0.9203674, 0.552839, 0.8263189, 1, 1, 1, 1, 1,
-0.9186894, -0.2634673, 0.6654471, 1, 1, 1, 1, 1,
-0.9161249, -0.7725927, -0.5873531, 1, 1, 1, 1, 1,
-0.9155839, 0.990591, -1.752001, 1, 1, 1, 1, 1,
-0.913686, -0.3437629, -2.716032, 1, 1, 1, 1, 1,
-0.9136613, 0.7632897, -3.882853, 1, 1, 1, 1, 1,
-0.9104242, 1.306472, -1.884448, 1, 1, 1, 1, 1,
-0.9041378, 0.4266577, -0.657084, 0, 0, 1, 1, 1,
-0.9011582, -1.044379, -0.8838941, 1, 0, 0, 1, 1,
-0.893072, 1.479859, -0.173522, 1, 0, 0, 1, 1,
-0.8849856, 1.845445, -1.329945, 1, 0, 0, 1, 1,
-0.8715726, -0.1823974, -3.396715, 1, 0, 0, 1, 1,
-0.8711929, -0.7630931, -3.753652, 1, 0, 0, 1, 1,
-0.8637019, 0.5460076, -2.221569, 0, 0, 0, 1, 1,
-0.8555317, -0.6851325, -2.47192, 0, 0, 0, 1, 1,
-0.8498635, 0.7224504, -1.590147, 0, 0, 0, 1, 1,
-0.8496445, 1.61305, -0.5821856, 0, 0, 0, 1, 1,
-0.8432564, -0.5345069, -1.800384, 0, 0, 0, 1, 1,
-0.8390436, 0.6692464, 0.02935604, 0, 0, 0, 1, 1,
-0.8335789, -0.4183051, -1.139567, 0, 0, 0, 1, 1,
-0.8319963, 0.660649, 0.3139457, 1, 1, 1, 1, 1,
-0.8296508, 1.798847, -2.480358, 1, 1, 1, 1, 1,
-0.8287282, -0.8500993, -2.171637, 1, 1, 1, 1, 1,
-0.8212954, 1.200823, -0.8102654, 1, 1, 1, 1, 1,
-0.8156271, -0.3713645, -1.040857, 1, 1, 1, 1, 1,
-0.8091987, 0.06670249, -1.315225, 1, 1, 1, 1, 1,
-0.8045366, -0.5219312, -1.765454, 1, 1, 1, 1, 1,
-0.7983439, 0.1344302, -0.820193, 1, 1, 1, 1, 1,
-0.7979858, 1.472337, -0.6224393, 1, 1, 1, 1, 1,
-0.7975656, 0.1832112, -2.84091, 1, 1, 1, 1, 1,
-0.7954269, 0.4701391, -0.658774, 1, 1, 1, 1, 1,
-0.7785843, 0.5852422, -0.8617502, 1, 1, 1, 1, 1,
-0.7767845, 0.9927664, -0.6660918, 1, 1, 1, 1, 1,
-0.7706518, 0.1444682, -1.817459, 1, 1, 1, 1, 1,
-0.7704429, 0.695182, -0.8905614, 1, 1, 1, 1, 1,
-0.7689328, 2.065796, 0.8231086, 0, 0, 1, 1, 1,
-0.7686536, 0.7457616, -0.1196102, 1, 0, 0, 1, 1,
-0.7679031, 3.504469, 1.228404, 1, 0, 0, 1, 1,
-0.7678698, -0.2743481, -2.612926, 1, 0, 0, 1, 1,
-0.7625823, -0.3731763, -1.924647, 1, 0, 0, 1, 1,
-0.7613577, 0.4377007, -1.830944, 1, 0, 0, 1, 1,
-0.7607989, -2.203961, -2.193971, 0, 0, 0, 1, 1,
-0.7593896, 0.2862007, -1.528102, 0, 0, 0, 1, 1,
-0.7576105, -0.1129161, -0.2274459, 0, 0, 0, 1, 1,
-0.7513597, -0.6226666, -3.18105, 0, 0, 0, 1, 1,
-0.7509003, -0.9273688, -1.540818, 0, 0, 0, 1, 1,
-0.7457854, 1.031989, -2.305654, 0, 0, 0, 1, 1,
-0.7451762, -0.5863242, -0.9713744, 0, 0, 0, 1, 1,
-0.7448216, 0.8832268, -0.5680538, 1, 1, 1, 1, 1,
-0.7445393, 2.848233, 0.620542, 1, 1, 1, 1, 1,
-0.7422705, 0.8309986, -1.344491, 1, 1, 1, 1, 1,
-0.7414607, 0.05149564, 0.7880312, 1, 1, 1, 1, 1,
-0.7409192, -0.6958008, -0.9279674, 1, 1, 1, 1, 1,
-0.7357544, 1.579919, 1.439378, 1, 1, 1, 1, 1,
-0.7357258, 0.002753208, -2.212945, 1, 1, 1, 1, 1,
-0.7356406, 0.03388174, 0.07494032, 1, 1, 1, 1, 1,
-0.7300823, 1.69674, -2.284618, 1, 1, 1, 1, 1,
-0.7246181, 0.6441851, -0.2957576, 1, 1, 1, 1, 1,
-0.7243272, 0.02497525, -0.7490663, 1, 1, 1, 1, 1,
-0.7203372, -0.3920857, -2.622982, 1, 1, 1, 1, 1,
-0.7169384, -0.5418582, -1.945853, 1, 1, 1, 1, 1,
-0.7129852, -0.7497392, -2.827745, 1, 1, 1, 1, 1,
-0.7124886, 0.8014542, -0.9103251, 1, 1, 1, 1, 1,
-0.7093412, 0.8122854, -2.393753, 0, 0, 1, 1, 1,
-0.7090151, 0.1276697, -0.9924968, 1, 0, 0, 1, 1,
-0.7076892, -0.3874698, -3.470617, 1, 0, 0, 1, 1,
-0.705113, -0.3861313, -2.127969, 1, 0, 0, 1, 1,
-0.702501, 0.3652562, -1.323452, 1, 0, 0, 1, 1,
-0.7014122, -1.742235, -1.326739, 1, 0, 0, 1, 1,
-0.6992012, 1.325117, -0.2778541, 0, 0, 0, 1, 1,
-0.6954851, -0.2013174, -2.969019, 0, 0, 0, 1, 1,
-0.6933016, -0.2027747, -3.335877, 0, 0, 0, 1, 1,
-0.6864562, 2.033207, 0.1225337, 0, 0, 0, 1, 1,
-0.6839932, -0.8772303, -1.983162, 0, 0, 0, 1, 1,
-0.6811273, -0.2056335, -1.505962, 0, 0, 0, 1, 1,
-0.6775766, 0.6227509, -1.045721, 0, 0, 0, 1, 1,
-0.6693959, 0.1287681, 0.09758113, 1, 1, 1, 1, 1,
-0.6677924, 0.3135621, 0.4811417, 1, 1, 1, 1, 1,
-0.6517026, 0.1106925, -2.354973, 1, 1, 1, 1, 1,
-0.6506181, 1.337594, 0.9628785, 1, 1, 1, 1, 1,
-0.6494166, -2.336726, -3.499134, 1, 1, 1, 1, 1,
-0.6491226, 2.171312, -0.1034375, 1, 1, 1, 1, 1,
-0.6486808, -0.4930772, -2.84768, 1, 1, 1, 1, 1,
-0.6439494, -0.4172825, -1.470262, 1, 1, 1, 1, 1,
-0.637958, -0.05956003, -0.2407964, 1, 1, 1, 1, 1,
-0.63648, -0.8783801, -2.04853, 1, 1, 1, 1, 1,
-0.6345149, -1.766517, -3.05402, 1, 1, 1, 1, 1,
-0.6320623, -0.03161972, -2.586633, 1, 1, 1, 1, 1,
-0.6154958, -0.2029344, -1.370915, 1, 1, 1, 1, 1,
-0.6152709, -0.1044943, 0.2401139, 1, 1, 1, 1, 1,
-0.6148409, -0.3044591, -3.451092, 1, 1, 1, 1, 1,
-0.6112693, -0.3687884, -1.037041, 0, 0, 1, 1, 1,
-0.6112374, -0.4958014, -1.915534, 1, 0, 0, 1, 1,
-0.6095605, -0.1708333, -1.712759, 1, 0, 0, 1, 1,
-0.6087997, -1.772711, -3.203036, 1, 0, 0, 1, 1,
-0.6081448, -1.394228, -3.867079, 1, 0, 0, 1, 1,
-0.6049964, -0.3005104, 0.7084798, 1, 0, 0, 1, 1,
-0.6049815, -0.4744871, -0.4164291, 0, 0, 0, 1, 1,
-0.6032761, 0.347818, 2.394762, 0, 0, 0, 1, 1,
-0.600324, -1.062746, -1.684946, 0, 0, 0, 1, 1,
-0.598025, 0.2160619, 0.4391346, 0, 0, 0, 1, 1,
-0.5978675, -0.8449506, -3.136793, 0, 0, 0, 1, 1,
-0.5943364, -0.8955532, -1.751439, 0, 0, 0, 1, 1,
-0.5941486, 2.045478, 0.4590057, 0, 0, 0, 1, 1,
-0.5941115, 0.7578027, -1.577217, 1, 1, 1, 1, 1,
-0.5928371, -0.2637783, -1.67279, 1, 1, 1, 1, 1,
-0.589166, 0.1585136, -2.181003, 1, 1, 1, 1, 1,
-0.5878766, 0.7377561, -0.9251221, 1, 1, 1, 1, 1,
-0.5867001, -0.7477433, -3.249728, 1, 1, 1, 1, 1,
-0.585295, -0.6001482, -3.342145, 1, 1, 1, 1, 1,
-0.58445, -0.9021724, -1.523189, 1, 1, 1, 1, 1,
-0.5823659, 1.282177, 0.09807014, 1, 1, 1, 1, 1,
-0.5789942, 0.339052, -0.7976885, 1, 1, 1, 1, 1,
-0.5727058, 1.314866, -2.128947, 1, 1, 1, 1, 1,
-0.5705369, 1.534787, 0.5076781, 1, 1, 1, 1, 1,
-0.5684113, -0.4905213, -2.004046, 1, 1, 1, 1, 1,
-0.5618767, -0.7855417, -1.699859, 1, 1, 1, 1, 1,
-0.5603662, -0.001933618, -2.156813, 1, 1, 1, 1, 1,
-0.5594563, -1.123986, -3.319192, 1, 1, 1, 1, 1,
-0.5594477, -0.2866836, -2.491547, 0, 0, 1, 1, 1,
-0.5565868, -1.085267, -3.428862, 1, 0, 0, 1, 1,
-0.5541742, -0.2621466, -1.113084, 1, 0, 0, 1, 1,
-0.5533982, 1.242089, 0.6628454, 1, 0, 0, 1, 1,
-0.5529419, 1.036955, -2.340916, 1, 0, 0, 1, 1,
-0.5500519, -0.8938726, -3.624122, 1, 0, 0, 1, 1,
-0.5467141, -1.474558, -2.392811, 0, 0, 0, 1, 1,
-0.5460449, -0.09473254, -0.8356012, 0, 0, 0, 1, 1,
-0.5409011, -1.874316, -1.1068, 0, 0, 0, 1, 1,
-0.5349084, 1.012069, -1.365073, 0, 0, 0, 1, 1,
-0.5338206, 0.1791872, -2.156006, 0, 0, 0, 1, 1,
-0.5317377, -0.2164323, -1.392829, 0, 0, 0, 1, 1,
-0.5309551, 0.288551, 0.4123576, 0, 0, 0, 1, 1,
-0.5256813, -1.240428, -2.198332, 1, 1, 1, 1, 1,
-0.5256791, 1.991977, 1.469066, 1, 1, 1, 1, 1,
-0.5246505, -0.04991356, -2.464217, 1, 1, 1, 1, 1,
-0.5245278, 0.6689265, -1.213928, 1, 1, 1, 1, 1,
-0.5239173, 1.181911, -1.370391, 1, 1, 1, 1, 1,
-0.5239028, 0.8760332, -1.207713, 1, 1, 1, 1, 1,
-0.5221956, -0.5922039, -4.170482, 1, 1, 1, 1, 1,
-0.5205465, 0.1548608, 1.282823, 1, 1, 1, 1, 1,
-0.5173854, -0.4961863, -3.541584, 1, 1, 1, 1, 1,
-0.5163838, -0.1618207, -0.5120573, 1, 1, 1, 1, 1,
-0.5144975, 0.1341939, -0.494852, 1, 1, 1, 1, 1,
-0.5139245, -0.8026162, -4.745362, 1, 1, 1, 1, 1,
-0.5137056, 1.483901, -0.4540206, 1, 1, 1, 1, 1,
-0.5130701, -0.4418395, -3.178679, 1, 1, 1, 1, 1,
-0.5105314, 1.471159, -0.02216761, 1, 1, 1, 1, 1,
-0.5054791, -0.807108, -2.663657, 0, 0, 1, 1, 1,
-0.5041513, 0.2224874, -1.20013, 1, 0, 0, 1, 1,
-0.5036553, -0.4280146, 0.604741, 1, 0, 0, 1, 1,
-0.4989682, 0.9781001, -0.1320489, 1, 0, 0, 1, 1,
-0.4931988, -0.6801075, -1.674107, 1, 0, 0, 1, 1,
-0.4861194, -1.280598, -2.656133, 1, 0, 0, 1, 1,
-0.4834585, 0.3183008, -1.480664, 0, 0, 0, 1, 1,
-0.4823107, -0.3772239, -1.03953, 0, 0, 0, 1, 1,
-0.4808749, 1.535173, -1.975663, 0, 0, 0, 1, 1,
-0.4768615, 1.157472, -0.1085972, 0, 0, 0, 1, 1,
-0.4727304, -2.005519, -4.015166, 0, 0, 0, 1, 1,
-0.4645624, -0.5675969, -2.048925, 0, 0, 0, 1, 1,
-0.4628137, 0.9524242, -1.745965, 0, 0, 0, 1, 1,
-0.4624117, -1.234591, -2.909749, 1, 1, 1, 1, 1,
-0.4557748, 0.1854566, -1.215647, 1, 1, 1, 1, 1,
-0.4537122, -0.7770201, -3.446295, 1, 1, 1, 1, 1,
-0.4519736, -0.6158147, -3.243225, 1, 1, 1, 1, 1,
-0.4481342, -0.7993941, -2.81367, 1, 1, 1, 1, 1,
-0.4481206, 0.9279138, 0.1431671, 1, 1, 1, 1, 1,
-0.443188, -0.02493314, -1.413626, 1, 1, 1, 1, 1,
-0.438836, 0.6594256, -0.6099502, 1, 1, 1, 1, 1,
-0.4303023, -0.575135, -1.86842, 1, 1, 1, 1, 1,
-0.4254659, 0.5603074, -2.622843, 1, 1, 1, 1, 1,
-0.4247712, 1.024711, 1.092466, 1, 1, 1, 1, 1,
-0.4216299, 1.539837, -1.757637, 1, 1, 1, 1, 1,
-0.4170526, 1.282315, 0.9869558, 1, 1, 1, 1, 1,
-0.4164489, -0.5094054, -3.021698, 1, 1, 1, 1, 1,
-0.4076786, -1.326944, -3.427543, 1, 1, 1, 1, 1,
-0.4074993, -1.715994, -3.871265, 0, 0, 1, 1, 1,
-0.4041923, 0.7450086, 0.3371902, 1, 0, 0, 1, 1,
-0.4041309, -0.6717244, -3.658123, 1, 0, 0, 1, 1,
-0.4003361, 1.715055, 0.8449082, 1, 0, 0, 1, 1,
-0.3965013, 0.07863647, -0.9325445, 1, 0, 0, 1, 1,
-0.3934534, 0.1558437, -2.169881, 1, 0, 0, 1, 1,
-0.3886845, 0.2592095, 0.2327189, 0, 0, 0, 1, 1,
-0.3880766, -0.2861608, -2.464432, 0, 0, 0, 1, 1,
-0.3767167, -0.9239506, -1.998686, 0, 0, 0, 1, 1,
-0.3745243, 0.5409021, 0.2071525, 0, 0, 0, 1, 1,
-0.3732786, -0.8502653, -2.000022, 0, 0, 0, 1, 1,
-0.3721901, 0.5972791, -1.12615, 0, 0, 0, 1, 1,
-0.3701708, 1.763748, -1.423217, 0, 0, 0, 1, 1,
-0.3683183, 1.41777, -0.588496, 1, 1, 1, 1, 1,
-0.3674956, -0.3409753, -2.409031, 1, 1, 1, 1, 1,
-0.3656246, 0.1021109, -1.633446, 1, 1, 1, 1, 1,
-0.3630171, -0.9984624, -0.5482752, 1, 1, 1, 1, 1,
-0.3627573, 0.6817042, 0.7178178, 1, 1, 1, 1, 1,
-0.3606383, -1.225583, -3.06443, 1, 1, 1, 1, 1,
-0.3560378, 0.03246125, -2.955773, 1, 1, 1, 1, 1,
-0.3552385, 0.05683116, -1.072214, 1, 1, 1, 1, 1,
-0.353707, -0.04339669, -1.633907, 1, 1, 1, 1, 1,
-0.350501, 1.655658, -1.400833, 1, 1, 1, 1, 1,
-0.3490787, 0.7010223, 0.9375505, 1, 1, 1, 1, 1,
-0.3470127, -1.115171, -4.251078, 1, 1, 1, 1, 1,
-0.3446555, -0.5717523, -3.309602, 1, 1, 1, 1, 1,
-0.3434162, -1.014616, -4.498931, 1, 1, 1, 1, 1,
-0.3423868, -0.2461599, -1.312296, 1, 1, 1, 1, 1,
-0.3422186, 0.04593359, -4.171132, 0, 0, 1, 1, 1,
-0.3348113, -3.272016, -2.729823, 1, 0, 0, 1, 1,
-0.3321753, -0.3197411, -3.94102, 1, 0, 0, 1, 1,
-0.3284807, -0.1020335, -2.20143, 1, 0, 0, 1, 1,
-0.3255934, -0.8037742, -2.545065, 1, 0, 0, 1, 1,
-0.3214283, 1.008891, 0.2066358, 1, 0, 0, 1, 1,
-0.3211835, -0.7316239, -0.5212871, 0, 0, 0, 1, 1,
-0.3196157, 1.958179, 0.1040119, 0, 0, 0, 1, 1,
-0.3188392, -0.6241191, -2.514427, 0, 0, 0, 1, 1,
-0.3154452, -0.6071888, -2.929427, 0, 0, 0, 1, 1,
-0.3123475, -0.3605914, -3.009624, 0, 0, 0, 1, 1,
-0.3037308, -1.405928, -3.362474, 0, 0, 0, 1, 1,
-0.3012482, 1.088549, 1.053387, 0, 0, 0, 1, 1,
-0.2991014, 0.4342934, 0.07570919, 1, 1, 1, 1, 1,
-0.2957941, 0.2243156, -1.298307, 1, 1, 1, 1, 1,
-0.2956244, -1.303147, -1.247027, 1, 1, 1, 1, 1,
-0.2946127, -0.8045531, -2.801379, 1, 1, 1, 1, 1,
-0.2939752, -1.698781, -2.768102, 1, 1, 1, 1, 1,
-0.2893206, 0.2085789, 0.1453336, 1, 1, 1, 1, 1,
-0.286992, -1.275544, -3.622587, 1, 1, 1, 1, 1,
-0.2809815, 0.5446191, 0.5014257, 1, 1, 1, 1, 1,
-0.2809621, -0.9172878, -3.287997, 1, 1, 1, 1, 1,
-0.2807982, 1.506537, -0.7051614, 1, 1, 1, 1, 1,
-0.2761591, 0.8608968, -0.7063097, 1, 1, 1, 1, 1,
-0.2725503, -0.4084859, -1.826324, 1, 1, 1, 1, 1,
-0.268764, -0.1939118, -2.416202, 1, 1, 1, 1, 1,
-0.2618701, -0.8818104, -2.206851, 1, 1, 1, 1, 1,
-0.2567044, 0.5032806, 1.296234, 1, 1, 1, 1, 1,
-0.2558722, -0.5858382, -3.796702, 0, 0, 1, 1, 1,
-0.248826, -0.9814066, -1.062402, 1, 0, 0, 1, 1,
-0.2443054, 0.7857116, -0.6381552, 1, 0, 0, 1, 1,
-0.2432461, -0.1914417, -2.332296, 1, 0, 0, 1, 1,
-0.242326, -0.2370011, -2.043695, 1, 0, 0, 1, 1,
-0.2408196, -1.175366, -3.568387, 1, 0, 0, 1, 1,
-0.2396177, -1.617192, -4.107487, 0, 0, 0, 1, 1,
-0.2382378, 1.588389, 1.119065, 0, 0, 0, 1, 1,
-0.2353706, -0.4631536, -3.466457, 0, 0, 0, 1, 1,
-0.2343962, 1.604002, -0.8001537, 0, 0, 0, 1, 1,
-0.2322349, -1.028683, -1.532189, 0, 0, 0, 1, 1,
-0.231188, -0.08959313, -3.60058, 0, 0, 0, 1, 1,
-0.2309263, 0.9358388, -0.2079649, 0, 0, 0, 1, 1,
-0.2301155, -0.3916914, -1.436571, 1, 1, 1, 1, 1,
-0.2260468, 1.019408, -1.461113, 1, 1, 1, 1, 1,
-0.2217977, 0.725833, 0.3829024, 1, 1, 1, 1, 1,
-0.219424, -0.1874345, -2.369175, 1, 1, 1, 1, 1,
-0.2182803, 1.130499, -0.9288427, 1, 1, 1, 1, 1,
-0.2175886, -1.655337, -1.097742, 1, 1, 1, 1, 1,
-0.2158463, -1.296246, -3.767312, 1, 1, 1, 1, 1,
-0.2154634, -0.1319443, -2.313875, 1, 1, 1, 1, 1,
-0.2141222, -1.101244, -1.393806, 1, 1, 1, 1, 1,
-0.2124337, 0.8249652, 0.838045, 1, 1, 1, 1, 1,
-0.2095194, 0.7524057, 0.08556738, 1, 1, 1, 1, 1,
-0.2064789, -0.1568021, -1.042415, 1, 1, 1, 1, 1,
-0.2057767, -0.3264056, 0.07899311, 1, 1, 1, 1, 1,
-0.1941025, 0.9408443, -0.1783, 1, 1, 1, 1, 1,
-0.1881516, -0.8614276, -2.34251, 1, 1, 1, 1, 1,
-0.181012, 1.685117, 1.498881, 0, 0, 1, 1, 1,
-0.1809935, -1.651294, -2.587144, 1, 0, 0, 1, 1,
-0.1805618, 1.300388, 0.9783224, 1, 0, 0, 1, 1,
-0.1786589, -1.362666, -3.31604, 1, 0, 0, 1, 1,
-0.174122, -2.102578, -2.597417, 1, 0, 0, 1, 1,
-0.1705226, -0.1244985, -0.8095383, 1, 0, 0, 1, 1,
-0.1691023, 0.8661128, -0.5619898, 0, 0, 0, 1, 1,
-0.1644353, -0.6212622, -5.014523, 0, 0, 0, 1, 1,
-0.1597691, -0.6154726, -2.151727, 0, 0, 0, 1, 1,
-0.1575119, 0.1260019, -1.746484, 0, 0, 0, 1, 1,
-0.1541775, 0.7047694, 1.410176, 0, 0, 0, 1, 1,
-0.1476224, 0.625935, -0.5240483, 0, 0, 0, 1, 1,
-0.1432441, 1.153425, 1.10565, 0, 0, 0, 1, 1,
-0.1429007, 0.4222122, -1.897659, 1, 1, 1, 1, 1,
-0.1421515, 0.5103453, 1.670289, 1, 1, 1, 1, 1,
-0.1405306, -0.009336219, -0.1845443, 1, 1, 1, 1, 1,
-0.1404226, -0.2184346, -1.414764, 1, 1, 1, 1, 1,
-0.1399386, -1.082683, -1.646545, 1, 1, 1, 1, 1,
-0.138687, 1.121007, 0.1540524, 1, 1, 1, 1, 1,
-0.1342289, -0.9649841, -3.870985, 1, 1, 1, 1, 1,
-0.1318491, -0.1877646, -4.360634, 1, 1, 1, 1, 1,
-0.1272907, 0.842074, 0.5583233, 1, 1, 1, 1, 1,
-0.1272093, 0.2101829, -2.348224, 1, 1, 1, 1, 1,
-0.1271605, -0.1337778, -2.131865, 1, 1, 1, 1, 1,
-0.1240696, 0.2944469, -0.384019, 1, 1, 1, 1, 1,
-0.123601, 1.503603, 1.096004, 1, 1, 1, 1, 1,
-0.1230858, 1.123979, 0.4116235, 1, 1, 1, 1, 1,
-0.1228523, -1.429396, -1.516285, 1, 1, 1, 1, 1,
-0.1171778, 0.406671, -1.26157, 0, 0, 1, 1, 1,
-0.1104939, 2.199952, -0.2711621, 1, 0, 0, 1, 1,
-0.1079853, -1.385876, -2.64835, 1, 0, 0, 1, 1,
-0.1069133, -0.619882, -2.327878, 1, 0, 0, 1, 1,
-0.1053008, -0.7483248, -0.9668835, 1, 0, 0, 1, 1,
-0.1012788, 1.228266, -1.534666, 1, 0, 0, 1, 1,
-0.09897607, 0.07710706, -1.012833, 0, 0, 0, 1, 1,
-0.09656313, 1.103824, -1.79815, 0, 0, 0, 1, 1,
-0.08404882, -0.02887455, -2.596806, 0, 0, 0, 1, 1,
-0.08346942, 0.02090021, -2.56848, 0, 0, 0, 1, 1,
-0.08079617, -0.8324044, -2.746327, 0, 0, 0, 1, 1,
-0.07966622, 0.4106551, -0.8350138, 0, 0, 0, 1, 1,
-0.078608, 0.4323534, 1.216183, 0, 0, 0, 1, 1,
-0.07812078, 0.3630209, -0.5944608, 1, 1, 1, 1, 1,
-0.07524036, -0.1864533, -4.078976, 1, 1, 1, 1, 1,
-0.06877434, -0.7882359, -3.552432, 1, 1, 1, 1, 1,
-0.06821951, -1.656228, -3.971169, 1, 1, 1, 1, 1,
-0.06555609, -1.112402, -2.336137, 1, 1, 1, 1, 1,
-0.06172519, -0.08768845, -2.639456, 1, 1, 1, 1, 1,
-0.06056317, 0.6611997, 0.8503743, 1, 1, 1, 1, 1,
-0.05933957, 1.101672, -0.06343216, 1, 1, 1, 1, 1,
-0.05839362, -1.396719, -3.049293, 1, 1, 1, 1, 1,
-0.05621694, -0.4257991, -0.3356874, 1, 1, 1, 1, 1,
-0.05458657, 1.320229, 0.3834347, 1, 1, 1, 1, 1,
-0.05284848, 0.1654366, -0.3848633, 1, 1, 1, 1, 1,
-0.05016441, -0.8309965, -3.145883, 1, 1, 1, 1, 1,
-0.04706556, 1.063653, 0.0191912, 1, 1, 1, 1, 1,
-0.04616396, 0.9305928, 0.07064132, 1, 1, 1, 1, 1,
-0.04460189, -1.147345, -5.179509, 0, 0, 1, 1, 1,
-0.0427089, 0.9975423, -0.1171291, 1, 0, 0, 1, 1,
-0.04046886, -0.8898672, -3.711969, 1, 0, 0, 1, 1,
-0.0399643, 0.4557107, -0.7332429, 1, 0, 0, 1, 1,
-0.03748036, 2.437784, 0.1022744, 1, 0, 0, 1, 1,
-0.0360551, 0.9470829, 0.3630347, 1, 0, 0, 1, 1,
-0.03504736, -1.248465, -3.744423, 0, 0, 0, 1, 1,
-0.02965555, 0.3069099, -1.601397, 0, 0, 0, 1, 1,
-0.02841742, 1.361651, 0.04945193, 0, 0, 0, 1, 1,
-0.02718524, -0.05104058, -1.5601, 0, 0, 0, 1, 1,
-0.02373207, -0.2643174, -3.096061, 0, 0, 0, 1, 1,
-0.01874242, 0.1905305, 0.0748715, 0, 0, 0, 1, 1,
-0.01827052, -0.6147532, -2.383594, 0, 0, 0, 1, 1,
-0.01775251, 0.9289068, 1.34961, 1, 1, 1, 1, 1,
-0.01563796, -0.9247336, -2.487985, 1, 1, 1, 1, 1,
-0.01391189, -2.482933, -2.947395, 1, 1, 1, 1, 1,
-0.01301621, 0.2419722, 2.024356, 1, 1, 1, 1, 1,
-0.01220493, -0.7136469, -3.885324, 1, 1, 1, 1, 1,
-0.00981934, 0.7051936, 1.88377, 1, 1, 1, 1, 1,
-0.009102304, 0.4317219, -0.5780604, 1, 1, 1, 1, 1,
-0.00303595, -0.3372454, -5.017445, 1, 1, 1, 1, 1,
-0.002566712, 1.195881, -0.04173581, 1, 1, 1, 1, 1,
-0.00213932, 0.5858476, -0.5710388, 1, 1, 1, 1, 1,
-0.002043932, -0.4403054, -3.066869, 1, 1, 1, 1, 1,
0.001357935, -0.6446859, 4.581559, 1, 1, 1, 1, 1,
0.005485171, -1.022106, 1.518208, 1, 1, 1, 1, 1,
0.00700076, -0.3700845, 4.209862, 1, 1, 1, 1, 1,
0.007023987, -1.116403, 2.676199, 1, 1, 1, 1, 1,
0.01097648, -2.24051, 1.964013, 0, 0, 1, 1, 1,
0.0116686, -0.9059463, 1.005067, 1, 0, 0, 1, 1,
0.01936655, 1.154266, -0.2738827, 1, 0, 0, 1, 1,
0.01962833, 1.458961, 0.1208104, 1, 0, 0, 1, 1,
0.02269692, -0.8103868, 3.059948, 1, 0, 0, 1, 1,
0.02411341, 0.08150072, -0.6734986, 1, 0, 0, 1, 1,
0.02657424, -0.4541233, 3.85667, 0, 0, 0, 1, 1,
0.02690475, 0.1107677, -0.5441559, 0, 0, 0, 1, 1,
0.03041406, 1.528648, 1.528797, 0, 0, 0, 1, 1,
0.0380023, -0.3274906, 4.222708, 0, 0, 0, 1, 1,
0.040507, -0.7809137, 3.619556, 0, 0, 0, 1, 1,
0.04212691, -0.2877327, 3.141678, 0, 0, 0, 1, 1,
0.04449657, -1.399751, 1.163317, 0, 0, 0, 1, 1,
0.05369839, -1.696198, 2.798045, 1, 1, 1, 1, 1,
0.05445211, 1.821967, 0.6906666, 1, 1, 1, 1, 1,
0.05478063, -0.3796398, 1.000807, 1, 1, 1, 1, 1,
0.05494309, -0.6282261, 2.64419, 1, 1, 1, 1, 1,
0.05509393, -1.900554, 3.661587, 1, 1, 1, 1, 1,
0.05761536, -0.9076919, 3.472375, 1, 1, 1, 1, 1,
0.05792894, 1.713939, 1.63801, 1, 1, 1, 1, 1,
0.05903662, 0.3451777, 0.1506055, 1, 1, 1, 1, 1,
0.06213385, 1.136609, -0.1208998, 1, 1, 1, 1, 1,
0.06465437, -0.9639904, 3.221119, 1, 1, 1, 1, 1,
0.07247541, -0.7177058, 1.695908, 1, 1, 1, 1, 1,
0.0760041, -1.730137, 4.222041, 1, 1, 1, 1, 1,
0.08499797, -1.668659, 4.518756, 1, 1, 1, 1, 1,
0.0863601, 0.5900292, 1.002318, 1, 1, 1, 1, 1,
0.08676238, -0.3511241, 1.408653, 1, 1, 1, 1, 1,
0.08994007, -0.6162741, 3.8704, 0, 0, 1, 1, 1,
0.09003954, -0.07909827, 4.329082, 1, 0, 0, 1, 1,
0.09016877, -0.2017898, 2.32234, 1, 0, 0, 1, 1,
0.09237372, 0.8112743, 0.5341451, 1, 0, 0, 1, 1,
0.09414627, -1.83513, 4.295998, 1, 0, 0, 1, 1,
0.09418969, -0.4785797, 1.941777, 1, 0, 0, 1, 1,
0.09559901, 0.03564414, 4.206241, 0, 0, 0, 1, 1,
0.09796638, 0.9859455, 1.661896, 0, 0, 0, 1, 1,
0.1000134, 1.454699, 0.6174278, 0, 0, 0, 1, 1,
0.1007454, -1.551051, 2.220907, 0, 0, 0, 1, 1,
0.1064197, 1.251957, -0.8902444, 0, 0, 0, 1, 1,
0.1064388, -0.6523728, 3.178578, 0, 0, 0, 1, 1,
0.112673, 0.8288677, 0.9264407, 0, 0, 0, 1, 1,
0.1127765, 0.4326671, 1.24224, 1, 1, 1, 1, 1,
0.1178542, 0.6520557, -0.2819004, 1, 1, 1, 1, 1,
0.121801, 1.22678, -0.916096, 1, 1, 1, 1, 1,
0.1220246, -0.9340104, 3.898962, 1, 1, 1, 1, 1,
0.1220558, -0.03955082, 2.048035, 1, 1, 1, 1, 1,
0.1244887, 0.4597029, 1.122833, 1, 1, 1, 1, 1,
0.1244922, 0.7008764, 0.6507193, 1, 1, 1, 1, 1,
0.1245369, -1.853946, 2.492802, 1, 1, 1, 1, 1,
0.1252925, -1.121441, 3.010441, 1, 1, 1, 1, 1,
0.1263416, -0.8841009, 2.654188, 1, 1, 1, 1, 1,
0.1267974, -0.3927818, 3.673788, 1, 1, 1, 1, 1,
0.1302764, 0.979242, 0.8257, 1, 1, 1, 1, 1,
0.1313355, 0.9661692, -0.7531454, 1, 1, 1, 1, 1,
0.1315026, 1.025174, -0.1120414, 1, 1, 1, 1, 1,
0.1330132, -1.327948, 3.04765, 1, 1, 1, 1, 1,
0.1373725, 0.7674327, 0.8349828, 0, 0, 1, 1, 1,
0.1377715, -0.3948887, 3.9779, 1, 0, 0, 1, 1,
0.1416461, -0.4788264, 2.377743, 1, 0, 0, 1, 1,
0.1429811, -0.7961956, 3.298297, 1, 0, 0, 1, 1,
0.1459668, 0.04549976, 2.419954, 1, 0, 0, 1, 1,
0.1482405, 0.1859546, 1.339403, 1, 0, 0, 1, 1,
0.1497338, -0.1576927, 4.428835, 0, 0, 0, 1, 1,
0.1500545, -1.413349, 2.88686, 0, 0, 0, 1, 1,
0.1543378, -0.5190383, 1.231538, 0, 0, 0, 1, 1,
0.1575483, -1.562126, 3.109936, 0, 0, 0, 1, 1,
0.1614657, 0.3499818, -0.2677549, 0, 0, 0, 1, 1,
0.1649603, -0.2239743, 1.660917, 0, 0, 0, 1, 1,
0.1672091, -1.26656, 3.172983, 0, 0, 0, 1, 1,
0.1730216, -0.523318, 3.500232, 1, 1, 1, 1, 1,
0.1736596, 0.5983869, -1.114238, 1, 1, 1, 1, 1,
0.1751067, -0.8519921, 1.190377, 1, 1, 1, 1, 1,
0.1783921, 0.1745185, 2.490323, 1, 1, 1, 1, 1,
0.178955, 1.386323, 1.18466, 1, 1, 1, 1, 1,
0.1793838, -0.5137458, 3.692938, 1, 1, 1, 1, 1,
0.1794052, 0.2498538, -0.04434355, 1, 1, 1, 1, 1,
0.1796289, -0.4747592, 3.988526, 1, 1, 1, 1, 1,
0.1824828, 0.9921926, 1.495717, 1, 1, 1, 1, 1,
0.1832078, 0.8496412, 1.128205, 1, 1, 1, 1, 1,
0.1855085, -0.3710099, 2.045426, 1, 1, 1, 1, 1,
0.1867239, -1.05142, 3.010592, 1, 1, 1, 1, 1,
0.1874777, -0.0276214, 2.277825, 1, 1, 1, 1, 1,
0.1951466, -2.521283, 2.934903, 1, 1, 1, 1, 1,
0.1954795, 1.130427, -0.4626296, 1, 1, 1, 1, 1,
0.1999978, -1.187106, 4.060315, 0, 0, 1, 1, 1,
0.2053832, -0.6122394, 3.583392, 1, 0, 0, 1, 1,
0.2121944, 0.8588017, 0.8783551, 1, 0, 0, 1, 1,
0.2136783, -0.3645013, 2.855063, 1, 0, 0, 1, 1,
0.2249845, 0.484786, 0.03561699, 1, 0, 0, 1, 1,
0.233101, 0.131274, 1.51666, 1, 0, 0, 1, 1,
0.2355339, -0.3725401, 3.681496, 0, 0, 0, 1, 1,
0.2360709, -0.02859825, 1.981995, 0, 0, 0, 1, 1,
0.2366582, 1.146734, 1.089044, 0, 0, 0, 1, 1,
0.2374991, -1.520045, 3.10342, 0, 0, 0, 1, 1,
0.2375663, 0.04410848, -0.9687486, 0, 0, 0, 1, 1,
0.2386987, -1.056355, 1.676349, 0, 0, 0, 1, 1,
0.2395573, -1.29708, 1.549946, 0, 0, 0, 1, 1,
0.2429565, 0.727095, -0.7282731, 1, 1, 1, 1, 1,
0.2464846, 1.181285, 1.293333, 1, 1, 1, 1, 1,
0.2481415, 1.584983, 0.3330866, 1, 1, 1, 1, 1,
0.2491892, 0.2691827, 0.1779777, 1, 1, 1, 1, 1,
0.2507728, -1.905296, 3.698668, 1, 1, 1, 1, 1,
0.2515285, 0.1854628, -0.2724988, 1, 1, 1, 1, 1,
0.2561715, -0.05999684, 2.531826, 1, 1, 1, 1, 1,
0.259283, -0.1003354, 2.05508, 1, 1, 1, 1, 1,
0.2605406, 1.612598, 1.096842, 1, 1, 1, 1, 1,
0.2640281, -0.7771099, 0.6467089, 1, 1, 1, 1, 1,
0.2674628, 1.161977, 0.7322955, 1, 1, 1, 1, 1,
0.2677623, 2.048041, 2.120545, 1, 1, 1, 1, 1,
0.2691823, -0.003025382, 0.9853261, 1, 1, 1, 1, 1,
0.2751558, 0.8426619, -0.478663, 1, 1, 1, 1, 1,
0.2840956, -0.6646969, 3.889486, 1, 1, 1, 1, 1,
0.2881822, -0.4687745, 1.67366, 0, 0, 1, 1, 1,
0.2893855, -2.574765, 3.977922, 1, 0, 0, 1, 1,
0.2926067, -2.341458, 1.470469, 1, 0, 0, 1, 1,
0.292749, -0.2622235, 3.140347, 1, 0, 0, 1, 1,
0.2971392, 1.438056, -0.06789733, 1, 0, 0, 1, 1,
0.2988755, 0.1041449, 1.816204, 1, 0, 0, 1, 1,
0.2995226, 0.2412033, 1.311797, 0, 0, 0, 1, 1,
0.3028796, -0.03641927, 3.674711, 0, 0, 0, 1, 1,
0.3056281, -0.1693248, 3.292063, 0, 0, 0, 1, 1,
0.3060307, 0.1292428, 1.011778, 0, 0, 0, 1, 1,
0.3106337, 0.4088719, 1.503414, 0, 0, 0, 1, 1,
0.3117444, -0.04162303, 1.871468, 0, 0, 0, 1, 1,
0.3158301, 0.799589, 1.211291, 0, 0, 0, 1, 1,
0.3163106, -1.32422, 5.036256, 1, 1, 1, 1, 1,
0.31635, -1.773554, 2.411706, 1, 1, 1, 1, 1,
0.3214375, -0.3628832, 1.502636, 1, 1, 1, 1, 1,
0.3236946, -0.0413761, 1.172709, 1, 1, 1, 1, 1,
0.3251691, 1.386781, 1.309883, 1, 1, 1, 1, 1,
0.3270203, 1.32224, -0.7190214, 1, 1, 1, 1, 1,
0.327131, -1.358415, 2.153543, 1, 1, 1, 1, 1,
0.3277986, 0.5056052, 0.7137386, 1, 1, 1, 1, 1,
0.3297544, 1.242558, -0.4380283, 1, 1, 1, 1, 1,
0.3307769, 0.5761493, 1.173018, 1, 1, 1, 1, 1,
0.3363781, -0.1280018, 2.553469, 1, 1, 1, 1, 1,
0.3389055, 0.395318, 1.931343, 1, 1, 1, 1, 1,
0.3437321, -0.8596439, 2.393197, 1, 1, 1, 1, 1,
0.3464441, 0.3540804, -1.035559, 1, 1, 1, 1, 1,
0.3516704, 0.1489848, 1.21358, 1, 1, 1, 1, 1,
0.3536921, -1.480657, 3.782702, 0, 0, 1, 1, 1,
0.3636461, -0.1501512, 2.425199, 1, 0, 0, 1, 1,
0.3643129, -1.616247, 5.278327, 1, 0, 0, 1, 1,
0.3711628, 0.2433114, 2.337479, 1, 0, 0, 1, 1,
0.3718686, 0.01431922, 1.234438, 1, 0, 0, 1, 1,
0.3722374, -0.6611838, 1.828271, 1, 0, 0, 1, 1,
0.3809347, 0.014785, 0.4966353, 0, 0, 0, 1, 1,
0.3814556, -0.3763393, 1.067215, 0, 0, 0, 1, 1,
0.3826249, -0.3687329, 1.669349, 0, 0, 0, 1, 1,
0.3836637, -0.9154797, 3.931569, 0, 0, 0, 1, 1,
0.384602, 0.8121113, -0.3646014, 0, 0, 0, 1, 1,
0.3885514, 0.5664485, 2.265479, 0, 0, 0, 1, 1,
0.3914682, 0.304138, 0.4763815, 0, 0, 0, 1, 1,
0.3925167, 2.385198, 1.441428, 1, 1, 1, 1, 1,
0.3999644, 0.8855466, -1.841905, 1, 1, 1, 1, 1,
0.4013926, -0.9532088, 2.959812, 1, 1, 1, 1, 1,
0.4015326, -2.098123, 2.615547, 1, 1, 1, 1, 1,
0.4016522, 0.5772355, 0.4605961, 1, 1, 1, 1, 1,
0.4043132, -0.383535, 3.206622, 1, 1, 1, 1, 1,
0.4052912, -0.5800911, 3.100899, 1, 1, 1, 1, 1,
0.405821, 0.3028059, -0.4150041, 1, 1, 1, 1, 1,
0.4068542, 0.0363782, 1.753895, 1, 1, 1, 1, 1,
0.4120846, 0.9391775, 1.18771, 1, 1, 1, 1, 1,
0.4154866, -1.673766, 2.461442, 1, 1, 1, 1, 1,
0.416821, -0.9016899, 2.823195, 1, 1, 1, 1, 1,
0.4219076, -0.5862012, 3.909621, 1, 1, 1, 1, 1,
0.4310424, 0.1800679, 0.9222583, 1, 1, 1, 1, 1,
0.4361544, -0.5769494, 4.239211, 1, 1, 1, 1, 1,
0.4370648, 0.4128239, 1.239471, 0, 0, 1, 1, 1,
0.4374291, 0.3346211, 0.3886206, 1, 0, 0, 1, 1,
0.4382039, -0.8871062, 1.451779, 1, 0, 0, 1, 1,
0.439142, 0.8162623, 1.478877, 1, 0, 0, 1, 1,
0.440506, 0.3746585, 1.819879, 1, 0, 0, 1, 1,
0.4410904, -0.753484, 3.000041, 1, 0, 0, 1, 1,
0.4420681, 0.415462, 0.7229109, 0, 0, 0, 1, 1,
0.4438068, -0.3173992, 2.907923, 0, 0, 0, 1, 1,
0.4490743, -0.9817559, 2.349786, 0, 0, 0, 1, 1,
0.4566398, 0.6707215, 0.004531683, 0, 0, 0, 1, 1,
0.4656958, 0.5566393, 0.04224031, 0, 0, 0, 1, 1,
0.4675335, 0.709596, -1.626675, 0, 0, 0, 1, 1,
0.469535, -0.7177795, 2.055152, 0, 0, 0, 1, 1,
0.4713701, -1.035844, 3.390086, 1, 1, 1, 1, 1,
0.4717465, -0.6783035, 3.609088, 1, 1, 1, 1, 1,
0.4722014, 1.246158, 0.3592044, 1, 1, 1, 1, 1,
0.4730221, -0.5720024, 2.026436, 1, 1, 1, 1, 1,
0.4774297, -0.432582, 2.741176, 1, 1, 1, 1, 1,
0.4797632, 0.4473417, 1.980803, 1, 1, 1, 1, 1,
0.4843397, -1.779683, 3.041482, 1, 1, 1, 1, 1,
0.486892, 0.1598589, 2.123587, 1, 1, 1, 1, 1,
0.4901668, -1.82895, 2.695089, 1, 1, 1, 1, 1,
0.4940052, -0.5019729, 2.771986, 1, 1, 1, 1, 1,
0.4956049, 0.2422077, 0.9312514, 1, 1, 1, 1, 1,
0.4971896, -0.2987789, 1.838053, 1, 1, 1, 1, 1,
0.4980597, 0.7274832, 0.2569929, 1, 1, 1, 1, 1,
0.4999112, 1.28716, 0.1072208, 1, 1, 1, 1, 1,
0.5065501, -0.4790614, 4.529253, 1, 1, 1, 1, 1,
0.5105707, 0.2478727, 1.786191, 0, 0, 1, 1, 1,
0.5141695, 0.5169042, 1.448224, 1, 0, 0, 1, 1,
0.5147756, -1.641928, 1.26372, 1, 0, 0, 1, 1,
0.5209031, -0.004487475, 0.1048778, 1, 0, 0, 1, 1,
0.5250214, -0.02072164, 2.85484, 1, 0, 0, 1, 1,
0.5434242, -1.039985, 3.574953, 1, 0, 0, 1, 1,
0.5443987, 1.338917, 2.005359, 0, 0, 0, 1, 1,
0.545723, 0.6665408, 1.150629, 0, 0, 0, 1, 1,
0.5459123, -0.506111, 2.065242, 0, 0, 0, 1, 1,
0.5487962, 0.2223137, 0.9656234, 0, 0, 0, 1, 1,
0.5488222, 1.175114, 0.2960486, 0, 0, 0, 1, 1,
0.552998, 0.5280495, -0.1275728, 0, 0, 0, 1, 1,
0.5534503, 0.4746575, 0.6953077, 0, 0, 0, 1, 1,
0.5551205, 1.111292, 0.251655, 1, 1, 1, 1, 1,
0.5553297, 1.038192, 0.5533321, 1, 1, 1, 1, 1,
0.5578991, 0.4933843, -0.2689262, 1, 1, 1, 1, 1,
0.5594066, 0.4590685, 1.420908, 1, 1, 1, 1, 1,
0.5606482, -0.08463275, 2.251456, 1, 1, 1, 1, 1,
0.5630917, -0.5998056, 1.67878, 1, 1, 1, 1, 1,
0.5644739, 1.627982, 1.114346, 1, 1, 1, 1, 1,
0.5657088, 1.394083, -1.454228, 1, 1, 1, 1, 1,
0.567633, -0.3202998, 3.695439, 1, 1, 1, 1, 1,
0.5706599, -1.044428, 2.892558, 1, 1, 1, 1, 1,
0.5724246, -0.5202996, 0.5125391, 1, 1, 1, 1, 1,
0.5770566, 1.036674, 0.7496678, 1, 1, 1, 1, 1,
0.5858017, -0.5260594, 2.831539, 1, 1, 1, 1, 1,
0.5859973, 0.7382105, 0.8066509, 1, 1, 1, 1, 1,
0.586476, 1.669751, -0.4452753, 1, 1, 1, 1, 1,
0.5875136, -0.9548764, 3.154629, 0, 0, 1, 1, 1,
0.5886208, 2.123523, -0.6258696, 1, 0, 0, 1, 1,
0.5888618, -0.1991211, 0.3442498, 1, 0, 0, 1, 1,
0.5910707, 0.698483, 1.162924, 1, 0, 0, 1, 1,
0.5919287, -1.444564, 1.673564, 1, 0, 0, 1, 1,
0.6066622, -1.396385, 1.899163, 1, 0, 0, 1, 1,
0.607423, -0.4255427, 3.488655, 0, 0, 0, 1, 1,
0.6089224, -2.236194, 3.145861, 0, 0, 0, 1, 1,
0.612589, -1.683806, 2.189106, 0, 0, 0, 1, 1,
0.6178824, -0.06332487, -0.7320619, 0, 0, 0, 1, 1,
0.6179057, -0.178403, 1.007162, 0, 0, 0, 1, 1,
0.6186542, -0.04474067, 0.565581, 0, 0, 0, 1, 1,
0.6259311, -0.2355383, 2.977905, 0, 0, 0, 1, 1,
0.6316531, -0.8911623, 2.850986, 1, 1, 1, 1, 1,
0.6344937, -0.7350799, 2.694355, 1, 1, 1, 1, 1,
0.6375097, -0.0309518, 0.6932516, 1, 1, 1, 1, 1,
0.6405624, 0.04420062, -0.417403, 1, 1, 1, 1, 1,
0.6456013, -0.2991027, 1.649702, 1, 1, 1, 1, 1,
0.6518945, 1.303353, 1.161417, 1, 1, 1, 1, 1,
0.6599239, 0.4103762, 3.021744, 1, 1, 1, 1, 1,
0.661543, -0.316104, 1.723404, 1, 1, 1, 1, 1,
0.6628731, -1.066673, 1.498943, 1, 1, 1, 1, 1,
0.6637468, -0.3894835, 2.050699, 1, 1, 1, 1, 1,
0.6646194, 0.6233239, -0.5095443, 1, 1, 1, 1, 1,
0.6666683, 1.485159, -0.335887, 1, 1, 1, 1, 1,
0.6694159, -0.9771493, 2.364272, 1, 1, 1, 1, 1,
0.676476, -1.151567, 3.411125, 1, 1, 1, 1, 1,
0.6792011, 1.153613, -0.6310542, 1, 1, 1, 1, 1,
0.6792848, -0.8296314, 2.488847, 0, 0, 1, 1, 1,
0.6884248, 1.133224, 0.4517708, 1, 0, 0, 1, 1,
0.6887926, -1.390136, 2.734757, 1, 0, 0, 1, 1,
0.6938402, -0.4779214, 1.745898, 1, 0, 0, 1, 1,
0.6945654, 1.867852, -0.06852029, 1, 0, 0, 1, 1,
0.7189789, -0.4959267, 1.915521, 1, 0, 0, 1, 1,
0.7327746, -1.608721, 2.74585, 0, 0, 0, 1, 1,
0.7386467, -0.7313527, 0.489354, 0, 0, 0, 1, 1,
0.7415672, -0.1566003, 2.689139, 0, 0, 0, 1, 1,
0.7427039, 0.9304819, 1.597865, 0, 0, 0, 1, 1,
0.7443134, 1.216309, 0.822508, 0, 0, 0, 1, 1,
0.7446634, -2.383991, 3.484555, 0, 0, 0, 1, 1,
0.7457699, 0.2971314, 2.06995, 0, 0, 0, 1, 1,
0.7500945, 0.04072647, -0.1344936, 1, 1, 1, 1, 1,
0.7538579, 1.470396, 1.945207, 1, 1, 1, 1, 1,
0.7546327, -0.9777539, 2.696262, 1, 1, 1, 1, 1,
0.7558296, 0.9565903, -0.9347741, 1, 1, 1, 1, 1,
0.7574306, -0.9489309, 1.251843, 1, 1, 1, 1, 1,
0.7576355, -2.896684, 2.455236, 1, 1, 1, 1, 1,
0.7577351, 1.113227, 1.067044, 1, 1, 1, 1, 1,
0.7632074, 0.9844859, 1.042383, 1, 1, 1, 1, 1,
0.7660497, -1.262712, 3.725387, 1, 1, 1, 1, 1,
0.766915, 1.636788, 0.5799367, 1, 1, 1, 1, 1,
0.7672842, -0.3158364, 2.522323, 1, 1, 1, 1, 1,
0.7696294, -1.642176, 1.427526, 1, 1, 1, 1, 1,
0.7701133, -0.5648615, 3.401114, 1, 1, 1, 1, 1,
0.7716829, -2.121131, 1.698366, 1, 1, 1, 1, 1,
0.7750787, 1.054784, 1.313753, 1, 1, 1, 1, 1,
0.7796285, -1.738694, 4.631948, 0, 0, 1, 1, 1,
0.7799805, -0.1748316, 2.302148, 1, 0, 0, 1, 1,
0.7869906, 1.992494, 0.1264566, 1, 0, 0, 1, 1,
0.7873535, 0.8069679, 0.7116473, 1, 0, 0, 1, 1,
0.7920989, -0.05039244, 2.411075, 1, 0, 0, 1, 1,
0.7956486, -0.4872666, 0.1185324, 1, 0, 0, 1, 1,
0.7999065, 1.582487, -1.434787, 0, 0, 0, 1, 1,
0.8028863, 1.218498, 0.1168224, 0, 0, 0, 1, 1,
0.8041992, -1.308429, 1.172492, 0, 0, 0, 1, 1,
0.8244725, -0.2316423, 2.022143, 0, 0, 0, 1, 1,
0.8274441, -0.9479141, 3.250574, 0, 0, 0, 1, 1,
0.8308581, 0.07252261, 1.764782, 0, 0, 0, 1, 1,
0.8311509, -0.3671333, 1.619776, 0, 0, 0, 1, 1,
0.8346437, 0.3752519, 3.178703, 1, 1, 1, 1, 1,
0.8411959, 0.8955348, -0.8765843, 1, 1, 1, 1, 1,
0.8415785, 0.16923, 2.066725, 1, 1, 1, 1, 1,
0.8424661, -0.73906, 1.59551, 1, 1, 1, 1, 1,
0.8567301, 1.178892, 0.4904251, 1, 1, 1, 1, 1,
0.8611386, -0.2405088, 2.275277, 1, 1, 1, 1, 1,
0.8739383, -0.5757514, 3.163663, 1, 1, 1, 1, 1,
0.883074, 1.301897, 1.833912, 1, 1, 1, 1, 1,
0.8888577, -0.8163466, 3.353997, 1, 1, 1, 1, 1,
0.89486, -0.1372174, 1.313837, 1, 1, 1, 1, 1,
0.8959734, 0.4282433, 1.113909, 1, 1, 1, 1, 1,
0.8970105, 0.2109759, -0.414008, 1, 1, 1, 1, 1,
0.8976453, 0.0371318, 2.408241, 1, 1, 1, 1, 1,
0.9005339, -0.2109555, 3.658688, 1, 1, 1, 1, 1,
0.9013796, -1.030335, 5.115794, 1, 1, 1, 1, 1,
0.9033864, 1.040183, 0.9712833, 0, 0, 1, 1, 1,
0.9070342, -0.5584188, 2.094879, 1, 0, 0, 1, 1,
0.9134105, 1.64527, -1.42633, 1, 0, 0, 1, 1,
0.9186609, -1.360934, 2.335279, 1, 0, 0, 1, 1,
0.9217476, -1.951875, 1.765063, 1, 0, 0, 1, 1,
0.9263908, 0.7899607, 2.663978, 1, 0, 0, 1, 1,
0.9280301, -1.100821, 2.214922, 0, 0, 0, 1, 1,
0.9386232, -0.7412665, 2.801943, 0, 0, 0, 1, 1,
0.9407738, 0.6182153, 0.2509404, 0, 0, 0, 1, 1,
0.9429901, -0.03026751, 3.156529, 0, 0, 0, 1, 1,
0.9452859, -0.9937069, 2.317048, 0, 0, 0, 1, 1,
0.949487, 0.6536975, 2.412924, 0, 0, 0, 1, 1,
0.9509169, -1.194955, 0.08445176, 0, 0, 0, 1, 1,
0.9635248, 0.351157, 0.5166848, 1, 1, 1, 1, 1,
0.9645124, 0.8856406, 2.927972, 1, 1, 1, 1, 1,
0.9647968, 0.2378585, 2.706599, 1, 1, 1, 1, 1,
0.9663755, -0.4979188, 0.8332953, 1, 1, 1, 1, 1,
0.9667405, 1.170649, -0.8576142, 1, 1, 1, 1, 1,
0.9669968, 0.02464566, 2.22616, 1, 1, 1, 1, 1,
0.9722802, 0.5898941, 1.725267, 1, 1, 1, 1, 1,
0.9764137, 1.103094, -0.6934465, 1, 1, 1, 1, 1,
0.9798291, -0.296191, 1.536343, 1, 1, 1, 1, 1,
0.9896786, -0.3914488, 1.663981, 1, 1, 1, 1, 1,
1.001823, -1.461104, 1.270942, 1, 1, 1, 1, 1,
1.007213, -1.868913, 2.092383, 1, 1, 1, 1, 1,
1.031048, -0.5479757, 1.821234, 1, 1, 1, 1, 1,
1.036507, -0.6715712, 2.414429, 1, 1, 1, 1, 1,
1.041986, 0.8881195, 0.3313978, 1, 1, 1, 1, 1,
1.043765, -1.63206, 3.957861, 0, 0, 1, 1, 1,
1.049394, -0.7035252, 2.298027, 1, 0, 0, 1, 1,
1.053159, 0.03441219, 0.6125945, 1, 0, 0, 1, 1,
1.056606, 0.4925006, 2.644701, 1, 0, 0, 1, 1,
1.056683, 0.4902052, 1.254364, 1, 0, 0, 1, 1,
1.063852, 0.5888392, 1.576696, 1, 0, 0, 1, 1,
1.067986, 0.4919066, 2.557087, 0, 0, 0, 1, 1,
1.07729, 0.4718919, 1.791837, 0, 0, 0, 1, 1,
1.080805, -0.8164366, 1.802373, 0, 0, 0, 1, 1,
1.081624, 0.5558448, -0.5282274, 0, 0, 0, 1, 1,
1.088169, -0.6117098, 0.5425724, 0, 0, 0, 1, 1,
1.097626, 1.384069, 1.191016, 0, 0, 0, 1, 1,
1.097932, -1.078035, 2.908139, 0, 0, 0, 1, 1,
1.11125, 1.532083, 0.8686429, 1, 1, 1, 1, 1,
1.125628, 0.07133853, 1.84867, 1, 1, 1, 1, 1,
1.131724, 0.5985172, 2.272019, 1, 1, 1, 1, 1,
1.14169, -0.9392587, 2.609996, 1, 1, 1, 1, 1,
1.150431, 0.05239749, 2.140104, 1, 1, 1, 1, 1,
1.153896, -0.5745307, 0.2342448, 1, 1, 1, 1, 1,
1.164395, -0.02382163, 1.209386, 1, 1, 1, 1, 1,
1.164917, -0.8058835, 1.489933, 1, 1, 1, 1, 1,
1.166137, -0.6309528, 2.476951, 1, 1, 1, 1, 1,
1.177219, 0.5415385, 2.391884, 1, 1, 1, 1, 1,
1.179299, 0.04961225, 0.8661979, 1, 1, 1, 1, 1,
1.182374, -1.36002, 1.209253, 1, 1, 1, 1, 1,
1.18307, 0.2585811, 0.573662, 1, 1, 1, 1, 1,
1.183382, -0.460601, 2.443032, 1, 1, 1, 1, 1,
1.183744, -0.303761, 0.5260333, 1, 1, 1, 1, 1,
1.192548, 0.3687984, -0.003603436, 0, 0, 1, 1, 1,
1.196566, 0.9107549, 0.5708206, 1, 0, 0, 1, 1,
1.200896, 0.07711829, 0.0001257595, 1, 0, 0, 1, 1,
1.204614, -0.7114715, 1.93595, 1, 0, 0, 1, 1,
1.204663, -0.7373703, 3.07498, 1, 0, 0, 1, 1,
1.219161, 0.5019586, 1.069112, 1, 0, 0, 1, 1,
1.23835, -0.8173494, 1.61063, 0, 0, 0, 1, 1,
1.241973, 0.1561019, 1.313363, 0, 0, 0, 1, 1,
1.2441, -0.1279223, 0.7675756, 0, 0, 0, 1, 1,
1.24841, 1.425237, 1.470978, 0, 0, 0, 1, 1,
1.253549, 0.5126243, 1.839866, 0, 0, 0, 1, 1,
1.267426, -0.719012, 1.048656, 0, 0, 0, 1, 1,
1.286432, -0.8500312, 3.256754, 0, 0, 0, 1, 1,
1.287932, 0.5809334, 0.9039136, 1, 1, 1, 1, 1,
1.304131, 0.2740712, 0.03237989, 1, 1, 1, 1, 1,
1.320148, 0.5215257, -0.7832571, 1, 1, 1, 1, 1,
1.326906, 0.3065378, 1.813911, 1, 1, 1, 1, 1,
1.33408, -0.3203138, 1.302081, 1, 1, 1, 1, 1,
1.338994, 1.269257, 1.230817, 1, 1, 1, 1, 1,
1.350806, -0.2915483, 0.721522, 1, 1, 1, 1, 1,
1.359968, -0.597006, 1.329662, 1, 1, 1, 1, 1,
1.362647, -0.4976914, 1.093108, 1, 1, 1, 1, 1,
1.384237, 0.2038287, 1.343456, 1, 1, 1, 1, 1,
1.385402, 1.920519, -0.006612736, 1, 1, 1, 1, 1,
1.387332, -2.280201, 2.249784, 1, 1, 1, 1, 1,
1.389484, 0.9959521, 0.4152842, 1, 1, 1, 1, 1,
1.398394, -0.1712926, 2.589187, 1, 1, 1, 1, 1,
1.400684, -0.671217, 4.165828, 1, 1, 1, 1, 1,
1.401017, -0.6431769, 1.253043, 0, 0, 1, 1, 1,
1.402573, -1.481472, 4.431212, 1, 0, 0, 1, 1,
1.405953, 0.1244791, 2.340759, 1, 0, 0, 1, 1,
1.406371, 0.005470119, 2.597625, 1, 0, 0, 1, 1,
1.416292, 0.3085444, 1.729129, 1, 0, 0, 1, 1,
1.418254, -1.402838, 2.819607, 1, 0, 0, 1, 1,
1.428132, -1.297178, 1.792006, 0, 0, 0, 1, 1,
1.431192, 0.3337005, 3.084772, 0, 0, 0, 1, 1,
1.445179, 0.2552588, 0.9529144, 0, 0, 0, 1, 1,
1.451838, 2.840308, -0.1438348, 0, 0, 0, 1, 1,
1.458941, 0.53122, 0.7911627, 0, 0, 0, 1, 1,
1.46014, -1.956372, 1.466634, 0, 0, 0, 1, 1,
1.46667, -0.5427634, 2.63352, 0, 0, 0, 1, 1,
1.469487, 1.419926, 1.104535, 1, 1, 1, 1, 1,
1.473103, -0.812849, 1.994825, 1, 1, 1, 1, 1,
1.477389, 0.6250818, 0.7482721, 1, 1, 1, 1, 1,
1.48604, 0.750947, 0.747627, 1, 1, 1, 1, 1,
1.505761, -1.238706, 2.242152, 1, 1, 1, 1, 1,
1.508021, -0.07077061, 0.9341027, 1, 1, 1, 1, 1,
1.513441, 0.3843625, 1.610859, 1, 1, 1, 1, 1,
1.51548, 0.2209772, 1.179758, 1, 1, 1, 1, 1,
1.52535, 1.376804, 2.691768, 1, 1, 1, 1, 1,
1.525482, 0.5206329, 1.51568, 1, 1, 1, 1, 1,
1.528811, 1.370755, 0.9638325, 1, 1, 1, 1, 1,
1.528905, 0.2163878, 0.7091031, 1, 1, 1, 1, 1,
1.551745, -1.877717, 2.42207, 1, 1, 1, 1, 1,
1.581005, -0.4607736, 1.148669, 1, 1, 1, 1, 1,
1.583598, 0.5842069, 1.933635, 1, 1, 1, 1, 1,
1.584718, -1.342069, 0.9385158, 0, 0, 1, 1, 1,
1.585244, -0.2437716, 2.647322, 1, 0, 0, 1, 1,
1.587257, 0.4487668, 1.014039, 1, 0, 0, 1, 1,
1.597678, -0.3799795, 2.602982, 1, 0, 0, 1, 1,
1.605913, -2.399355, 4.400944, 1, 0, 0, 1, 1,
1.616116, 0.3648566, 3.64243, 1, 0, 0, 1, 1,
1.62988, -0.3373467, 0.7335778, 0, 0, 0, 1, 1,
1.638529, 0.6083103, 0.4037302, 0, 0, 0, 1, 1,
1.652662, -0.5371991, -0.7863225, 0, 0, 0, 1, 1,
1.677033, 1.415679, 0.4785826, 0, 0, 0, 1, 1,
1.700897, 0.1934949, 1.874386, 0, 0, 0, 1, 1,
1.701543, -0.9318565, 3.294561, 0, 0, 0, 1, 1,
1.709767, -0.1469256, 1.932181, 0, 0, 0, 1, 1,
1.72441, 1.644335, 0.9387453, 1, 1, 1, 1, 1,
1.741272, -1.047239, 3.60486, 1, 1, 1, 1, 1,
1.749174, 1.274791, 1.830777, 1, 1, 1, 1, 1,
1.751922, 0.7600478, 1.635744, 1, 1, 1, 1, 1,
1.784397, -0.1173296, 1.205464, 1, 1, 1, 1, 1,
1.790278, 0.4140211, 1.600851, 1, 1, 1, 1, 1,
1.810949, 0.2080986, 0.5406024, 1, 1, 1, 1, 1,
1.816631, -1.57798, 3.16606, 1, 1, 1, 1, 1,
1.841345, -0.6295393, 1.641146, 1, 1, 1, 1, 1,
1.873779, 0.001379051, 0.6423779, 1, 1, 1, 1, 1,
1.879825, -0.6253948, 1.059753, 1, 1, 1, 1, 1,
1.914407, -0.6414201, 1.981469, 1, 1, 1, 1, 1,
1.928172, -0.4748181, 1.205384, 1, 1, 1, 1, 1,
1.939818, -0.420367, 3.580501, 1, 1, 1, 1, 1,
1.954713, 0.5912032, 0.4562014, 1, 1, 1, 1, 1,
1.97589, -2.725235, 3.340556, 0, 0, 1, 1, 1,
2.016786, 0.4084662, 1.910538, 1, 0, 0, 1, 1,
2.05924, 0.6187993, 1.152428, 1, 0, 0, 1, 1,
2.063099, -0.7143603, 2.214377, 1, 0, 0, 1, 1,
2.073258, 1.572841, 1.262238, 1, 0, 0, 1, 1,
2.108557, -0.7288298, 3.062539, 1, 0, 0, 1, 1,
2.125101, -1.7802, 2.853364, 0, 0, 0, 1, 1,
2.127893, -0.1065239, 2.383885, 0, 0, 0, 1, 1,
2.131246, -0.1058082, 3.106468, 0, 0, 0, 1, 1,
2.19056, -0.07082966, 2.479944, 0, 0, 0, 1, 1,
2.214512, 1.092158, 2.907677, 0, 0, 0, 1, 1,
2.270102, -0.5145367, 1.523471, 0, 0, 0, 1, 1,
2.273523, -0.423779, 1.489104, 0, 0, 0, 1, 1,
2.300204, -1.395008, 0.4965799, 1, 1, 1, 1, 1,
2.323702, -0.7341968, 0.8852242, 1, 1, 1, 1, 1,
2.363668, -0.8406867, 2.140221, 1, 1, 1, 1, 1,
2.38944, -0.727071, 1.680326, 1, 1, 1, 1, 1,
2.736382, 0.543653, 2.277277, 1, 1, 1, 1, 1,
2.740657, -1.894629, 1.429638, 1, 1, 1, 1, 1,
2.867696, 0.9892382, 1.269674, 1, 1, 1, 1, 1
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
var radius = 9.553331;
var distance = 33.55567;
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
mvMatrix.translate( 0.3000931, -0.1162262, -0.04940939 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.55567);
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