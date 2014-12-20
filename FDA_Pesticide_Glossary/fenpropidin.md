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
-3.405662, -0.5054649, -0.6256949, 1, 0, 0, 1,
-3.100194, -2.537917, -3.373685, 1, 0.007843138, 0, 1,
-2.906514, -0.8087404, -2.444612, 1, 0.01176471, 0, 1,
-2.568272, 0.4904744, -2.424086, 1, 0.01960784, 0, 1,
-2.3373, -0.6526103, -1.745026, 1, 0.02352941, 0, 1,
-2.245816, -0.4088068, -1.884822, 1, 0.03137255, 0, 1,
-2.219716, 1.738035, -1.849348, 1, 0.03529412, 0, 1,
-2.144107, 0.2660608, -3.301312, 1, 0.04313726, 0, 1,
-2.142191, -1.205209, -2.114043, 1, 0.04705882, 0, 1,
-2.110346, -1.289476, -3.238692, 1, 0.05490196, 0, 1,
-2.050701, -0.4342299, -1.813439, 1, 0.05882353, 0, 1,
-2.048988, 4.002159, -0.0667751, 1, 0.06666667, 0, 1,
-2.001608, 0.8369493, 0.04778664, 1, 0.07058824, 0, 1,
-1.985694, 0.4610417, -3.08645, 1, 0.07843138, 0, 1,
-1.963036, 1.553731, -0.467677, 1, 0.08235294, 0, 1,
-1.915128, -0.08645982, -1.821071, 1, 0.09019608, 0, 1,
-1.913898, 0.5870364, 0.7900487, 1, 0.09411765, 0, 1,
-1.908057, 0.5223792, -3.725097, 1, 0.1019608, 0, 1,
-1.903232, -0.04754678, -1.524878, 1, 0.1098039, 0, 1,
-1.89374, 1.321705, -0.7375014, 1, 0.1137255, 0, 1,
-1.875605, -0.4513096, -3.058106, 1, 0.1215686, 0, 1,
-1.870277, 0.5936056, 1.492192, 1, 0.1254902, 0, 1,
-1.844666, -0.5389207, -2.344301, 1, 0.1333333, 0, 1,
-1.835543, 0.4358534, -0.6239343, 1, 0.1372549, 0, 1,
-1.821529, 0.2581703, -1.216292, 1, 0.145098, 0, 1,
-1.785421, 0.2311642, 0.1415663, 1, 0.1490196, 0, 1,
-1.776803, -1.093866, -1.219919, 1, 0.1568628, 0, 1,
-1.773455, -0.2800831, -0.4815908, 1, 0.1607843, 0, 1,
-1.761112, 1.328823, -0.6722834, 1, 0.1686275, 0, 1,
-1.752711, -1.193724, -1.966442, 1, 0.172549, 0, 1,
-1.746996, -0.6561722, -2.987403, 1, 0.1803922, 0, 1,
-1.735178, -0.1510766, -3.004212, 1, 0.1843137, 0, 1,
-1.731034, 0.05177025, -2.61747, 1, 0.1921569, 0, 1,
-1.69941, 0.7955049, -1.916692, 1, 0.1960784, 0, 1,
-1.688382, 0.6009418, -0.1903567, 1, 0.2039216, 0, 1,
-1.671743, 1.002761, -2.511337, 1, 0.2117647, 0, 1,
-1.661697, 0.3770381, -0.976479, 1, 0.2156863, 0, 1,
-1.649659, 1.115629, -0.9638985, 1, 0.2235294, 0, 1,
-1.645253, 1.391733, -1.994971, 1, 0.227451, 0, 1,
-1.629566, 0.7309761, -2.10345, 1, 0.2352941, 0, 1,
-1.624849, 1.04803, -2.309633, 1, 0.2392157, 0, 1,
-1.599719, 1.280394, -0.5922837, 1, 0.2470588, 0, 1,
-1.587292, 0.6898198, -2.077901, 1, 0.2509804, 0, 1,
-1.576004, 0.5547545, -2.534606, 1, 0.2588235, 0, 1,
-1.570132, -0.66632, -1.300289, 1, 0.2627451, 0, 1,
-1.568408, 1.930856, 0.3647185, 1, 0.2705882, 0, 1,
-1.563666, 1.632943, -1.491759, 1, 0.2745098, 0, 1,
-1.561068, 1.299865, 0.7799689, 1, 0.282353, 0, 1,
-1.548903, 0.04282965, -1.45075, 1, 0.2862745, 0, 1,
-1.544605, -0.3605753, -2.341612, 1, 0.2941177, 0, 1,
-1.525603, 0.3172452, -0.9958887, 1, 0.3019608, 0, 1,
-1.525096, -0.5092331, -1.32703, 1, 0.3058824, 0, 1,
-1.522033, -0.6781821, -0.8506288, 1, 0.3137255, 0, 1,
-1.497069, -0.6102936, -3.520982, 1, 0.3176471, 0, 1,
-1.493377, 1.099735, 0.06105707, 1, 0.3254902, 0, 1,
-1.489201, 1.852021, -0.8945045, 1, 0.3294118, 0, 1,
-1.485629, 1.484309, -0.4199153, 1, 0.3372549, 0, 1,
-1.483905, 1.669054, -0.560478, 1, 0.3411765, 0, 1,
-1.481179, -0.09756194, -1.840153, 1, 0.3490196, 0, 1,
-1.468716, 1.728825, -0.576355, 1, 0.3529412, 0, 1,
-1.466899, -0.8789934, -3.327356, 1, 0.3607843, 0, 1,
-1.466136, -0.7625415, -2.119518, 1, 0.3647059, 0, 1,
-1.461962, 0.3442865, -0.3901373, 1, 0.372549, 0, 1,
-1.459903, -1.11123, -3.723223, 1, 0.3764706, 0, 1,
-1.44558, -0.3890568, -2.858567, 1, 0.3843137, 0, 1,
-1.443186, 0.8391091, -1.442938, 1, 0.3882353, 0, 1,
-1.44137, 1.102815, -0.4669171, 1, 0.3960784, 0, 1,
-1.441177, 0.5605898, -0.6552836, 1, 0.4039216, 0, 1,
-1.431573, -1.079, -2.067147, 1, 0.4078431, 0, 1,
-1.423424, -0.342795, -1.767652, 1, 0.4156863, 0, 1,
-1.422868, -1.05146, -4.430512, 1, 0.4196078, 0, 1,
-1.413112, 0.4151142, -3.310003, 1, 0.427451, 0, 1,
-1.406262, -0.7602601, -1.097077, 1, 0.4313726, 0, 1,
-1.401728, 0.7542675, -1.459678, 1, 0.4392157, 0, 1,
-1.400233, -0.269848, -1.180195, 1, 0.4431373, 0, 1,
-1.396218, 0.7880927, -2.235963, 1, 0.4509804, 0, 1,
-1.393399, 0.4229722, -0.01230843, 1, 0.454902, 0, 1,
-1.389034, 1.400703, -0.4023966, 1, 0.4627451, 0, 1,
-1.388182, 0.1471111, -1.942115, 1, 0.4666667, 0, 1,
-1.379002, -0.7023098, -1.432556, 1, 0.4745098, 0, 1,
-1.378308, 1.670454, -1.095811, 1, 0.4784314, 0, 1,
-1.377344, 0.04257344, -1.744986, 1, 0.4862745, 0, 1,
-1.371174, 0.001619055, -0.1161489, 1, 0.4901961, 0, 1,
-1.340947, -0.8666664, -3.685354, 1, 0.4980392, 0, 1,
-1.340099, 0.6009145, -2.114595, 1, 0.5058824, 0, 1,
-1.333046, -1.213033, -3.646013, 1, 0.509804, 0, 1,
-1.330863, -1.955595, -0.562293, 1, 0.5176471, 0, 1,
-1.327114, 0.3708007, -0.555146, 1, 0.5215687, 0, 1,
-1.325362, -0.2755203, -1.314856, 1, 0.5294118, 0, 1,
-1.320861, 1.019669, -1.073521, 1, 0.5333334, 0, 1,
-1.312996, -0.09171181, -1.320026, 1, 0.5411765, 0, 1,
-1.308447, -0.07092687, -0.9644937, 1, 0.5450981, 0, 1,
-1.307148, -0.6114054, -1.501398, 1, 0.5529412, 0, 1,
-1.305649, -0.8359948, -3.418186, 1, 0.5568628, 0, 1,
-1.305576, -1.958461, -0.6495122, 1, 0.5647059, 0, 1,
-1.304106, 0.05411953, -2.571525, 1, 0.5686275, 0, 1,
-1.279472, 0.7302694, -0.2731684, 1, 0.5764706, 0, 1,
-1.27844, -0.9322753, -2.149144, 1, 0.5803922, 0, 1,
-1.273384, 0.8279747, -0.4991005, 1, 0.5882353, 0, 1,
-1.26697, 0.5193444, -1.678283, 1, 0.5921569, 0, 1,
-1.26365, -0.7138745, -4.244104, 1, 0.6, 0, 1,
-1.261971, 0.4405249, -1.02525, 1, 0.6078432, 0, 1,
-1.256745, -0.07997639, -0.1673063, 1, 0.6117647, 0, 1,
-1.249316, 0.482276, -0.2145673, 1, 0.6196079, 0, 1,
-1.248864, -1.870849, -2.341671, 1, 0.6235294, 0, 1,
-1.244085, 0.9869545, -2.193997, 1, 0.6313726, 0, 1,
-1.243731, 0.2655408, -1.111833, 1, 0.6352941, 0, 1,
-1.24334, -0.08843449, -3.027439, 1, 0.6431373, 0, 1,
-1.242276, -0.3517293, -2.841144, 1, 0.6470588, 0, 1,
-1.236262, 0.3179457, -2.552842, 1, 0.654902, 0, 1,
-1.230073, -0.4424056, -2.551192, 1, 0.6588235, 0, 1,
-1.225858, 0.2229888, -1.416701, 1, 0.6666667, 0, 1,
-1.218574, 0.7437425, -1.675016, 1, 0.6705883, 0, 1,
-1.21591, -0.1844481, 0.07189246, 1, 0.6784314, 0, 1,
-1.214759, 0.02041855, -2.253456, 1, 0.682353, 0, 1,
-1.20639, -0.06058849, -1.771847, 1, 0.6901961, 0, 1,
-1.204895, 1.063041, 0.4687432, 1, 0.6941177, 0, 1,
-1.194875, -0.7079598, -1.313805, 1, 0.7019608, 0, 1,
-1.192168, 0.09982757, -1.054281, 1, 0.7098039, 0, 1,
-1.191802, 0.9278786, 0.5378345, 1, 0.7137255, 0, 1,
-1.182105, 2.181077, 0.1153454, 1, 0.7215686, 0, 1,
-1.180849, 0.3796019, -0.6122468, 1, 0.7254902, 0, 1,
-1.180611, -1.319016, -2.557906, 1, 0.7333333, 0, 1,
-1.168787, 0.5652819, -1.54286, 1, 0.7372549, 0, 1,
-1.167224, 0.9301301, -0.4128611, 1, 0.7450981, 0, 1,
-1.164939, -0.4639614, -1.745325, 1, 0.7490196, 0, 1,
-1.159304, 2.337861, -2.62446, 1, 0.7568628, 0, 1,
-1.158303, 0.3466695, -1.395477, 1, 0.7607843, 0, 1,
-1.158129, -0.1153535, -0.3611076, 1, 0.7686275, 0, 1,
-1.156152, 1.238346, -1.94141, 1, 0.772549, 0, 1,
-1.15088, 1.119274, -0.1656048, 1, 0.7803922, 0, 1,
-1.147408, 1.477599, -2.409339, 1, 0.7843137, 0, 1,
-1.146997, -0.08306162, -0.9926865, 1, 0.7921569, 0, 1,
-1.142386, -0.6680657, -2.930165, 1, 0.7960784, 0, 1,
-1.137193, 2.098562, -1.27587, 1, 0.8039216, 0, 1,
-1.137131, -1.132231, -2.740874, 1, 0.8117647, 0, 1,
-1.109498, -2.529806, -2.730367, 1, 0.8156863, 0, 1,
-1.098206, -1.543488, -1.985393, 1, 0.8235294, 0, 1,
-1.097932, -0.225173, -0.4066273, 1, 0.827451, 0, 1,
-1.097598, -1.016096, -0.6857479, 1, 0.8352941, 0, 1,
-1.095359, 0.645018, -0.2693994, 1, 0.8392157, 0, 1,
-1.088819, 2.147324, -0.846666, 1, 0.8470588, 0, 1,
-1.087812, -0.7609666, -2.508531, 1, 0.8509804, 0, 1,
-1.087649, 0.5397052, -0.425871, 1, 0.8588235, 0, 1,
-1.085157, 1.193628, -1.498923, 1, 0.8627451, 0, 1,
-1.084712, 0.334838, 0.2027381, 1, 0.8705882, 0, 1,
-1.083609, -1.018028, -3.308035, 1, 0.8745098, 0, 1,
-1.083379, 2.481832, -2.947014, 1, 0.8823529, 0, 1,
-1.078349, -0.03669604, -1.291443, 1, 0.8862745, 0, 1,
-1.060191, 0.4252698, -2.19189, 1, 0.8941177, 0, 1,
-1.058061, -1.070263, -0.5185117, 1, 0.8980392, 0, 1,
-1.056172, -0.1318111, -0.641652, 1, 0.9058824, 0, 1,
-1.047894, 0.5411843, -2.077915, 1, 0.9137255, 0, 1,
-1.042081, 0.9120122, -2.997399, 1, 0.9176471, 0, 1,
-1.039085, 1.587582, -0.009454685, 1, 0.9254902, 0, 1,
-1.031963, -0.2130238, -1.234771, 1, 0.9294118, 0, 1,
-1.030675, -0.8686848, -2.698996, 1, 0.9372549, 0, 1,
-1.029528, -0.05898122, -1.679608, 1, 0.9411765, 0, 1,
-1.022159, -0.2015895, 0.478276, 1, 0.9490196, 0, 1,
-1.022147, -0.1092497, -1.692052, 1, 0.9529412, 0, 1,
-1.016285, -0.081451, 0.4456985, 1, 0.9607843, 0, 1,
-1.011459, 0.01981597, -1.358546, 1, 0.9647059, 0, 1,
-1.008645, -0.7975183, -3.656543, 1, 0.972549, 0, 1,
-1.008232, 0.6399567, -0.9430609, 1, 0.9764706, 0, 1,
-1.003723, 0.6382732, -3.385054, 1, 0.9843137, 0, 1,
-0.9976409, 1.151369, 0.02816278, 1, 0.9882353, 0, 1,
-0.9922476, -0.8051671, -1.779433, 1, 0.9960784, 0, 1,
-0.9919432, -1.540841, -2.30776, 0.9960784, 1, 0, 1,
-0.9885628, -0.3350602, -1.788382, 0.9921569, 1, 0, 1,
-0.9858247, 0.1475758, 0.2366124, 0.9843137, 1, 0, 1,
-0.9848031, 0.9175234, -0.2039795, 0.9803922, 1, 0, 1,
-0.9843232, -1.098122, -3.628828, 0.972549, 1, 0, 1,
-0.9762685, 1.813813, -1.250367, 0.9686275, 1, 0, 1,
-0.9707552, 1.071284, -0.3136064, 0.9607843, 1, 0, 1,
-0.9620256, 0.9618213, 0.8112463, 0.9568627, 1, 0, 1,
-0.9619559, -1.636622, -2.47574, 0.9490196, 1, 0, 1,
-0.9593477, 0.645171, -0.5612848, 0.945098, 1, 0, 1,
-0.9561625, -0.2904328, -2.140791, 0.9372549, 1, 0, 1,
-0.951948, 0.2703178, -3.957303, 0.9333333, 1, 0, 1,
-0.95144, -0.6350796, -2.942436, 0.9254902, 1, 0, 1,
-0.9453548, -0.9827228, -1.968329, 0.9215686, 1, 0, 1,
-0.9399217, 0.6892809, -0.1790306, 0.9137255, 1, 0, 1,
-0.9396531, -0.555512, -1.491838, 0.9098039, 1, 0, 1,
-0.9256365, 1.222654, -2.024175, 0.9019608, 1, 0, 1,
-0.917699, 0.1064458, -0.8199034, 0.8941177, 1, 0, 1,
-0.9165347, -0.6729171, -2.155113, 0.8901961, 1, 0, 1,
-0.9144585, 0.5596091, -1.42839, 0.8823529, 1, 0, 1,
-0.9052208, -2.227313, -2.967528, 0.8784314, 1, 0, 1,
-0.9024414, -1.578416, -4.66844, 0.8705882, 1, 0, 1,
-0.8943244, -2.028122, -4.476257, 0.8666667, 1, 0, 1,
-0.8924292, -1.428423, -2.071753, 0.8588235, 1, 0, 1,
-0.8820573, 0.3677529, -1.37663, 0.854902, 1, 0, 1,
-0.8810118, 0.1869826, -2.388364, 0.8470588, 1, 0, 1,
-0.8805597, 0.7066167, -1.993903, 0.8431373, 1, 0, 1,
-0.8766354, 0.02958155, -0.8582247, 0.8352941, 1, 0, 1,
-0.8764874, -2.039201, -2.738146, 0.8313726, 1, 0, 1,
-0.8763499, -0.008922683, -2.223175, 0.8235294, 1, 0, 1,
-0.8678573, -0.09843691, -2.845934, 0.8196079, 1, 0, 1,
-0.8634157, -1.021039, -1.851561, 0.8117647, 1, 0, 1,
-0.8585989, 0.3278616, 0.2591377, 0.8078431, 1, 0, 1,
-0.85217, 0.1384316, -1.544807, 0.8, 1, 0, 1,
-0.8508304, 0.6938062, -2.430511, 0.7921569, 1, 0, 1,
-0.8493726, 1.766529, -0.6567018, 0.7882353, 1, 0, 1,
-0.8429832, 0.2102663, -0.3391676, 0.7803922, 1, 0, 1,
-0.8409881, 0.1704841, 0.3726012, 0.7764706, 1, 0, 1,
-0.8375511, 0.6806359, 0.3295845, 0.7686275, 1, 0, 1,
-0.8305364, 0.4792551, -1.901985, 0.7647059, 1, 0, 1,
-0.8280832, 1.766704, 0.1299403, 0.7568628, 1, 0, 1,
-0.82348, 1.371747, -0.1969671, 0.7529412, 1, 0, 1,
-0.8220088, -0.6515852, -3.034431, 0.7450981, 1, 0, 1,
-0.8200765, -0.381441, -2.983022, 0.7411765, 1, 0, 1,
-0.8192781, -1.359973, -2.969658, 0.7333333, 1, 0, 1,
-0.8167788, -0.6331947, -3.745841, 0.7294118, 1, 0, 1,
-0.8097256, 0.001239358, -2.061718, 0.7215686, 1, 0, 1,
-0.8096904, -2.261896, -2.824168, 0.7176471, 1, 0, 1,
-0.8064542, 1.773544, -0.7200741, 0.7098039, 1, 0, 1,
-0.8064118, -0.5513478, -2.442584, 0.7058824, 1, 0, 1,
-0.8006411, 0.2547634, -0.5176966, 0.6980392, 1, 0, 1,
-0.7996964, 1.511548, 0.4635304, 0.6901961, 1, 0, 1,
-0.7993187, -0.7890533, -1.180802, 0.6862745, 1, 0, 1,
-0.7989474, 0.7079455, -0.6708362, 0.6784314, 1, 0, 1,
-0.7983533, 0.1696325, -4.126977, 0.6745098, 1, 0, 1,
-0.7943621, -0.004904067, -0.3435684, 0.6666667, 1, 0, 1,
-0.7905651, -0.2545856, -2.204079, 0.6627451, 1, 0, 1,
-0.7876963, -0.941297, -3.196905, 0.654902, 1, 0, 1,
-0.7838684, -1.413421, -2.842494, 0.6509804, 1, 0, 1,
-0.7817907, 1.123642, -2.471566, 0.6431373, 1, 0, 1,
-0.7814679, -0.7313991, -1.72148, 0.6392157, 1, 0, 1,
-0.7758446, -1.17473, -5.584621, 0.6313726, 1, 0, 1,
-0.7733022, -0.6957005, -0.8957638, 0.627451, 1, 0, 1,
-0.7700747, -0.8579304, -3.341384, 0.6196079, 1, 0, 1,
-0.759469, 1.518146, -0.06368165, 0.6156863, 1, 0, 1,
-0.7580215, 0.02932213, -3.296053, 0.6078432, 1, 0, 1,
-0.7560641, 1.598927, -1.395592, 0.6039216, 1, 0, 1,
-0.7559587, 1.166194, -1.146876, 0.5960785, 1, 0, 1,
-0.7542558, -0.5948544, -2.278232, 0.5882353, 1, 0, 1,
-0.7512352, 0.342412, -0.3342133, 0.5843138, 1, 0, 1,
-0.7506068, 1.108896, -0.4963673, 0.5764706, 1, 0, 1,
-0.7468721, -0.1895612, 0.1931761, 0.572549, 1, 0, 1,
-0.7450473, -0.2640018, -3.077215, 0.5647059, 1, 0, 1,
-0.7372261, -0.4819414, -2.1607, 0.5607843, 1, 0, 1,
-0.7367994, -0.03720814, -0.3089341, 0.5529412, 1, 0, 1,
-0.729988, 0.2528825, -2.163953, 0.5490196, 1, 0, 1,
-0.729569, 0.4957859, -1.689566, 0.5411765, 1, 0, 1,
-0.7258901, 0.7655216, -0.4120817, 0.5372549, 1, 0, 1,
-0.7222967, 0.7289254, -1.128749, 0.5294118, 1, 0, 1,
-0.7217021, -0.7602638, -1.105201, 0.5254902, 1, 0, 1,
-0.7194461, -1.382114, -0.7173511, 0.5176471, 1, 0, 1,
-0.7170355, 0.1408833, -1.984807, 0.5137255, 1, 0, 1,
-0.7128425, -0.8416792, -0.9637892, 0.5058824, 1, 0, 1,
-0.7107621, 0.7332067, -1.349366, 0.5019608, 1, 0, 1,
-0.7093056, 0.7252577, -1.015113, 0.4941176, 1, 0, 1,
-0.7069091, 0.5834936, -1.821727, 0.4862745, 1, 0, 1,
-0.7026351, -1.390617, -3.313531, 0.4823529, 1, 0, 1,
-0.7013013, 1.235364, -2.158895, 0.4745098, 1, 0, 1,
-0.7001532, -0.3162176, -1.462548, 0.4705882, 1, 0, 1,
-0.6998034, 0.9181767, -0.673129, 0.4627451, 1, 0, 1,
-0.6971082, 0.15609, -0.1070904, 0.4588235, 1, 0, 1,
-0.6852573, -2.017448, -3.630353, 0.4509804, 1, 0, 1,
-0.6808028, -1.657825, -3.957185, 0.4470588, 1, 0, 1,
-0.67483, 0.7114715, -1.02538, 0.4392157, 1, 0, 1,
-0.6747218, 0.2679104, -3.681536, 0.4352941, 1, 0, 1,
-0.6721025, -0.463756, -1.13653, 0.427451, 1, 0, 1,
-0.6699837, -1.301385, -3.12396, 0.4235294, 1, 0, 1,
-0.6641293, 0.4909975, 0.08989077, 0.4156863, 1, 0, 1,
-0.6638744, -0.657654, -2.861316, 0.4117647, 1, 0, 1,
-0.6608737, -0.1907638, -2.496361, 0.4039216, 1, 0, 1,
-0.6599184, 0.9268963, -0.8696147, 0.3960784, 1, 0, 1,
-0.6576917, -0.2532645, -3.101388, 0.3921569, 1, 0, 1,
-0.6447034, 0.6547608, -0.3217878, 0.3843137, 1, 0, 1,
-0.6429542, 0.4432791, 0.6346238, 0.3803922, 1, 0, 1,
-0.6396576, -0.9638078, -1.871101, 0.372549, 1, 0, 1,
-0.6383089, 0.2648773, 0.5606887, 0.3686275, 1, 0, 1,
-0.6363175, -1.735991, -2.175275, 0.3607843, 1, 0, 1,
-0.6358283, -0.08592942, -1.101086, 0.3568628, 1, 0, 1,
-0.6266908, 0.01622638, -2.833332, 0.3490196, 1, 0, 1,
-0.6253017, 0.9988352, -1.402121, 0.345098, 1, 0, 1,
-0.6162106, 0.9348565, 0.6093469, 0.3372549, 1, 0, 1,
-0.6073186, 0.0008111866, 0.60883, 0.3333333, 1, 0, 1,
-0.6063681, -0.7036846, -1.51815, 0.3254902, 1, 0, 1,
-0.6043234, 1.146923, 0.6122928, 0.3215686, 1, 0, 1,
-0.6031988, 0.9678676, 1.024904, 0.3137255, 1, 0, 1,
-0.5974348, -1.541956, -2.467102, 0.3098039, 1, 0, 1,
-0.5956575, 0.01134635, -2.679137, 0.3019608, 1, 0, 1,
-0.5900924, -0.6798642, -2.589528, 0.2941177, 1, 0, 1,
-0.5855914, -0.6055797, -1.934952, 0.2901961, 1, 0, 1,
-0.5836824, -0.3153811, -1.724857, 0.282353, 1, 0, 1,
-0.5822341, -1.914955, -0.8507732, 0.2784314, 1, 0, 1,
-0.5794006, 0.9467379, -1.258034, 0.2705882, 1, 0, 1,
-0.5782422, -0.04953138, -1.500486, 0.2666667, 1, 0, 1,
-0.577411, -0.4628164, -4.094129, 0.2588235, 1, 0, 1,
-0.5771922, -0.9996492, -3.438264, 0.254902, 1, 0, 1,
-0.5754113, -0.5749509, -3.76453, 0.2470588, 1, 0, 1,
-0.5712072, 1.382217, 1.648675, 0.2431373, 1, 0, 1,
-0.5694586, 0.2805772, -1.362227, 0.2352941, 1, 0, 1,
-0.5656659, 0.4939916, -1.223426, 0.2313726, 1, 0, 1,
-0.5573725, -0.4569922, -2.614234, 0.2235294, 1, 0, 1,
-0.5567871, 0.3584805, -1.390906, 0.2196078, 1, 0, 1,
-0.553345, 0.5032895, -0.02350186, 0.2117647, 1, 0, 1,
-0.550709, 1.93451, -0.5098142, 0.2078431, 1, 0, 1,
-0.5456448, -1.075009, -3.234121, 0.2, 1, 0, 1,
-0.5437896, 0.6518552, -0.00452929, 0.1921569, 1, 0, 1,
-0.5302523, 1.251583, -1.207268, 0.1882353, 1, 0, 1,
-0.5257215, -0.09438219, -2.65697, 0.1803922, 1, 0, 1,
-0.5178231, 0.6028124, -0.9565939, 0.1764706, 1, 0, 1,
-0.5170741, 1.08811, 0.5279464, 0.1686275, 1, 0, 1,
-0.5134997, -0.0855244, -2.107261, 0.1647059, 1, 0, 1,
-0.5130811, -0.2882648, -2.298297, 0.1568628, 1, 0, 1,
-0.5109797, -0.8617204, -2.837687, 0.1529412, 1, 0, 1,
-0.5106433, -0.9343329, -2.812553, 0.145098, 1, 0, 1,
-0.4950172, 0.3774532, -1.838697, 0.1411765, 1, 0, 1,
-0.4948069, 1.177853, 0.09804754, 0.1333333, 1, 0, 1,
-0.4884854, -1.765316, -3.399595, 0.1294118, 1, 0, 1,
-0.4875245, -2.302392, -2.648208, 0.1215686, 1, 0, 1,
-0.4870783, 0.5856873, -0.5461872, 0.1176471, 1, 0, 1,
-0.4828893, -0.9025285, -1.656328, 0.1098039, 1, 0, 1,
-0.4817368, 0.1380133, -0.0778764, 0.1058824, 1, 0, 1,
-0.481572, 1.230793, 0.01925179, 0.09803922, 1, 0, 1,
-0.4802836, -0.1264141, -0.912189, 0.09019608, 1, 0, 1,
-0.4767258, 0.7401571, -0.9514673, 0.08627451, 1, 0, 1,
-0.4725185, 0.3478931, -2.44141, 0.07843138, 1, 0, 1,
-0.4696986, -0.5780242, -2.176345, 0.07450981, 1, 0, 1,
-0.4606366, -1.570477, -1.817631, 0.06666667, 1, 0, 1,
-0.4566996, 0.4590887, -2.517509, 0.0627451, 1, 0, 1,
-0.4537171, -1.695895, -1.918275, 0.05490196, 1, 0, 1,
-0.4531682, -0.4044769, -1.023201, 0.05098039, 1, 0, 1,
-0.4517075, -0.01448707, 0.4833986, 0.04313726, 1, 0, 1,
-0.4509644, 0.04629308, -3.148847, 0.03921569, 1, 0, 1,
-0.4506882, -1.496301, -3.314989, 0.03137255, 1, 0, 1,
-0.4486468, 1.302435, -2.149362, 0.02745098, 1, 0, 1,
-0.4404896, 0.5944559, -0.6240255, 0.01960784, 1, 0, 1,
-0.4393971, -2.562294, -3.182533, 0.01568628, 1, 0, 1,
-0.4391475, 0.7595809, 0.4839868, 0.007843138, 1, 0, 1,
-0.4351232, -0.6723023, -2.49473, 0.003921569, 1, 0, 1,
-0.4341597, -0.6732462, -3.655006, 0, 1, 0.003921569, 1,
-0.4332421, -1.007038, -3.357296, 0, 1, 0.01176471, 1,
-0.4265875, 3.588232, 0.3734839, 0, 1, 0.01568628, 1,
-0.4259216, -0.5989525, -1.793868, 0, 1, 0.02352941, 1,
-0.4164026, -0.9639375, -2.96154, 0, 1, 0.02745098, 1,
-0.415356, 1.04366, -0.8353581, 0, 1, 0.03529412, 1,
-0.4126821, 0.3800964, -0.3095709, 0, 1, 0.03921569, 1,
-0.4056382, 1.860794, 0.3200179, 0, 1, 0.04705882, 1,
-0.4041987, 1.772732, -0.20604, 0, 1, 0.05098039, 1,
-0.4003175, -0.2127596, -3.187014, 0, 1, 0.05882353, 1,
-0.4002926, 0.5784818, -2.005816, 0, 1, 0.0627451, 1,
-0.3936369, -1.065399, -1.708997, 0, 1, 0.07058824, 1,
-0.3931681, -2.26916, -3.732101, 0, 1, 0.07450981, 1,
-0.3914374, -0.05258328, -1.612452, 0, 1, 0.08235294, 1,
-0.386299, 0.04773407, -1.368867, 0, 1, 0.08627451, 1,
-0.3859462, 0.7968519, 0.3683652, 0, 1, 0.09411765, 1,
-0.3830803, 0.3329498, -0.5772116, 0, 1, 0.1019608, 1,
-0.3823834, -0.9605967, -3.808294, 0, 1, 0.1058824, 1,
-0.3777319, 1.528708, -0.589101, 0, 1, 0.1137255, 1,
-0.3757542, 1.081949, -3.256817, 0, 1, 0.1176471, 1,
-0.3634793, 0.9887195, -0.4987911, 0, 1, 0.1254902, 1,
-0.3630981, 0.9652864, 0.5689245, 0, 1, 0.1294118, 1,
-0.3582089, -0.2349639, -2.591125, 0, 1, 0.1372549, 1,
-0.3580517, -0.01841829, -0.8098578, 0, 1, 0.1411765, 1,
-0.3538348, 1.587004, -1.914443, 0, 1, 0.1490196, 1,
-0.3516497, -0.1094938, -1.502548, 0, 1, 0.1529412, 1,
-0.3494106, -0.7356731, -1.860215, 0, 1, 0.1607843, 1,
-0.3453343, 0.6936129, -1.520319, 0, 1, 0.1647059, 1,
-0.3417054, -1.972051, -4.294543, 0, 1, 0.172549, 1,
-0.3351343, 0.2500924, -1.451963, 0, 1, 0.1764706, 1,
-0.3338116, -1.812529, -4.156635, 0, 1, 0.1843137, 1,
-0.3314534, -0.4414429, -2.661716, 0, 1, 0.1882353, 1,
-0.3298242, 0.9525029, -1.140167, 0, 1, 0.1960784, 1,
-0.32721, 1.27777, -0.2280805, 0, 1, 0.2039216, 1,
-0.3262173, -2.384242, -2.302343, 0, 1, 0.2078431, 1,
-0.3226953, -0.1300906, -0.872745, 0, 1, 0.2156863, 1,
-0.3214384, -0.9422779, -0.9786209, 0, 1, 0.2196078, 1,
-0.3180476, -1.121312, -3.050759, 0, 1, 0.227451, 1,
-0.3178521, 0.07959737, 1.666271, 0, 1, 0.2313726, 1,
-0.316072, 2.207705, 0.8143194, 0, 1, 0.2392157, 1,
-0.3145599, -2.385369, -3.129863, 0, 1, 0.2431373, 1,
-0.3131697, 0.9410931, -0.6889334, 0, 1, 0.2509804, 1,
-0.3101803, -1.731684, -4.530507, 0, 1, 0.254902, 1,
-0.3068798, 0.7322319, 1.058605, 0, 1, 0.2627451, 1,
-0.3050887, -1.898325, -3.410622, 0, 1, 0.2666667, 1,
-0.3022887, -0.515357, -3.347569, 0, 1, 0.2745098, 1,
-0.3012323, 0.7892818, -1.980448, 0, 1, 0.2784314, 1,
-0.3008725, -0.5895708, -2.150334, 0, 1, 0.2862745, 1,
-0.2963306, -0.6352623, -2.858095, 0, 1, 0.2901961, 1,
-0.2943682, 2.569722, -0.2249872, 0, 1, 0.2980392, 1,
-0.293232, -0.03886041, -0.494605, 0, 1, 0.3058824, 1,
-0.2916487, 1.225885, -1.201703, 0, 1, 0.3098039, 1,
-0.2870262, -0.5697184, -3.442271, 0, 1, 0.3176471, 1,
-0.2851335, -0.925122, -5.044295, 0, 1, 0.3215686, 1,
-0.2846749, -1.533408, -5.481316, 0, 1, 0.3294118, 1,
-0.2796758, -0.03112563, -2.41622, 0, 1, 0.3333333, 1,
-0.272676, -0.3404916, -3.203599, 0, 1, 0.3411765, 1,
-0.2702858, 1.08381, 0.3284781, 0, 1, 0.345098, 1,
-0.2672455, 0.6316603, -0.1063929, 0, 1, 0.3529412, 1,
-0.2571292, -0.7530829, -3.686904, 0, 1, 0.3568628, 1,
-0.2571168, -1.370074, -3.310821, 0, 1, 0.3647059, 1,
-0.2546489, 0.3306668, -1.308488, 0, 1, 0.3686275, 1,
-0.2530342, -0.5100155, -1.759699, 0, 1, 0.3764706, 1,
-0.2490357, -0.8367474, -2.29996, 0, 1, 0.3803922, 1,
-0.2470177, -0.3175736, -3.691272, 0, 1, 0.3882353, 1,
-0.2465593, 0.9143106, 0.4763672, 0, 1, 0.3921569, 1,
-0.243603, 1.087353, 0.2709267, 0, 1, 0.4, 1,
-0.2432325, -0.9457588, -3.040949, 0, 1, 0.4078431, 1,
-0.2399336, 1.124921, -0.1664812, 0, 1, 0.4117647, 1,
-0.2386249, -1.208391, -2.537789, 0, 1, 0.4196078, 1,
-0.238318, 0.7175032, 1.373929, 0, 1, 0.4235294, 1,
-0.23531, 0.8870036, -1.224379, 0, 1, 0.4313726, 1,
-0.2345349, 1.370406, 0.7270389, 0, 1, 0.4352941, 1,
-0.2339199, -0.7727302, -3.055482, 0, 1, 0.4431373, 1,
-0.2137993, 1.296822, -0.4422868, 0, 1, 0.4470588, 1,
-0.2114116, -0.006776786, -0.6497902, 0, 1, 0.454902, 1,
-0.2045495, 0.6122003, 1.01036, 0, 1, 0.4588235, 1,
-0.2032894, 0.1362086, -0.6751257, 0, 1, 0.4666667, 1,
-0.1895643, 1.635544, 0.5205223, 0, 1, 0.4705882, 1,
-0.1880703, 0.6909081, -0.4081078, 0, 1, 0.4784314, 1,
-0.1873292, -0.1668721, -1.777896, 0, 1, 0.4823529, 1,
-0.1844258, -0.7586771, -1.79688, 0, 1, 0.4901961, 1,
-0.1742258, -1.308984, -2.797212, 0, 1, 0.4941176, 1,
-0.169995, -0.5202376, -2.997499, 0, 1, 0.5019608, 1,
-0.1684479, -0.8706083, -1.664268, 0, 1, 0.509804, 1,
-0.1635818, -0.3822593, -3.580961, 0, 1, 0.5137255, 1,
-0.1629556, -0.6867296, -4.106585, 0, 1, 0.5215687, 1,
-0.162882, -1.204146, -4.08907, 0, 1, 0.5254902, 1,
-0.1604135, -0.279633, -2.413119, 0, 1, 0.5333334, 1,
-0.1516988, -2.111583, -4.282325, 0, 1, 0.5372549, 1,
-0.149731, -0.001000229, -2.322159, 0, 1, 0.5450981, 1,
-0.1452219, 1.458041, -0.1515963, 0, 1, 0.5490196, 1,
-0.1430661, 2.001659, 1.491362, 0, 1, 0.5568628, 1,
-0.1420326, -0.05389231, -1.680643, 0, 1, 0.5607843, 1,
-0.1420288, 0.5803743, -0.2067882, 0, 1, 0.5686275, 1,
-0.140883, 0.5567222, 0.2255873, 0, 1, 0.572549, 1,
-0.1402548, -1.095261, -3.068744, 0, 1, 0.5803922, 1,
-0.1371911, 0.7343116, -0.4999768, 0, 1, 0.5843138, 1,
-0.1344364, 0.1666434, -1.079578, 0, 1, 0.5921569, 1,
-0.1338779, -2.225304, -2.715654, 0, 1, 0.5960785, 1,
-0.1321912, -0.06506335, -2.461343, 0, 1, 0.6039216, 1,
-0.1304121, -0.48811, -2.950143, 0, 1, 0.6117647, 1,
-0.1270122, -1.534615, -1.742464, 0, 1, 0.6156863, 1,
-0.1255331, -0.2938599, -5.055512, 0, 1, 0.6235294, 1,
-0.1253736, 0.5384607, -0.7118028, 0, 1, 0.627451, 1,
-0.1195171, 0.6265881, -1.488938, 0, 1, 0.6352941, 1,
-0.1142938, -2.267278, -3.258658, 0, 1, 0.6392157, 1,
-0.1139766, 0.823292, -1.598855, 0, 1, 0.6470588, 1,
-0.113518, -0.1879773, -3.229069, 0, 1, 0.6509804, 1,
-0.1131201, -0.9762619, -5.416326, 0, 1, 0.6588235, 1,
-0.1082431, 0.6151822, -0.5918806, 0, 1, 0.6627451, 1,
-0.106546, 0.3413472, -0.787787, 0, 1, 0.6705883, 1,
-0.1053805, 0.5623384, 0.4225472, 0, 1, 0.6745098, 1,
-0.09945702, 0.6559055, 1.853163, 0, 1, 0.682353, 1,
-0.09864888, 0.9139634, 0.1711475, 0, 1, 0.6862745, 1,
-0.0981827, -0.3978799, -3.689793, 0, 1, 0.6941177, 1,
-0.09591798, 0.3105544, 0.9058988, 0, 1, 0.7019608, 1,
-0.09452327, -1.113387, -3.897489, 0, 1, 0.7058824, 1,
-0.09075958, 1.43017, -0.372972, 0, 1, 0.7137255, 1,
-0.08901481, -0.2230658, -2.299032, 0, 1, 0.7176471, 1,
-0.0889456, 0.3783742, -1.194433, 0, 1, 0.7254902, 1,
-0.08876652, 1.203663, -0.2374589, 0, 1, 0.7294118, 1,
-0.08437434, -0.9142045, -1.688045, 0, 1, 0.7372549, 1,
-0.08338216, -0.1040002, -1.50057, 0, 1, 0.7411765, 1,
-0.08128808, -1.260966, -0.6361986, 0, 1, 0.7490196, 1,
-0.076989, 1.479736, 0.3582535, 0, 1, 0.7529412, 1,
-0.06994809, -0.6641749, -3.327255, 0, 1, 0.7607843, 1,
-0.06697165, -0.750056, -4.262963, 0, 1, 0.7647059, 1,
-0.06640658, -1.402856, -2.050509, 0, 1, 0.772549, 1,
-0.0619128, 0.8751967, -1.069904, 0, 1, 0.7764706, 1,
-0.05931823, -0.321229, -1.777408, 0, 1, 0.7843137, 1,
-0.05627437, -0.7668953, -4.446826, 0, 1, 0.7882353, 1,
-0.05431742, 0.837903, 0.4285137, 0, 1, 0.7960784, 1,
-0.05396578, -1.309258, -1.359833, 0, 1, 0.8039216, 1,
-0.05236443, 0.9427865, -0.1679493, 0, 1, 0.8078431, 1,
-0.04958351, -0.9249648, -3.725417, 0, 1, 0.8156863, 1,
-0.04954934, -1.311579, -0.8423204, 0, 1, 0.8196079, 1,
-0.0423011, -2.251395, -2.472631, 0, 1, 0.827451, 1,
-0.04115988, 0.245011, -0.6549273, 0, 1, 0.8313726, 1,
-0.04000503, 0.7350766, 0.5879752, 0, 1, 0.8392157, 1,
-0.03466425, 1.557981, -1.439745, 0, 1, 0.8431373, 1,
-0.03130907, 1.720463, -0.107594, 0, 1, 0.8509804, 1,
-0.03027605, -1.362059, -1.394785, 0, 1, 0.854902, 1,
-0.02974859, -1.034787, -2.472806, 0, 1, 0.8627451, 1,
-0.02645113, -0.00737782, -2.638079, 0, 1, 0.8666667, 1,
-0.02379454, -0.7870448, -3.407454, 0, 1, 0.8745098, 1,
-0.02278449, -0.8034035, -1.193851, 0, 1, 0.8784314, 1,
-0.02182264, 2.680668, -0.1107354, 0, 1, 0.8862745, 1,
-0.02162269, 0.09696487, 0.08424716, 0, 1, 0.8901961, 1,
-0.02013753, 1.19635, 1.247451, 0, 1, 0.8980392, 1,
-0.01621589, -1.041195, -2.461515, 0, 1, 0.9058824, 1,
-0.01467689, -1.140206, -1.688276, 0, 1, 0.9098039, 1,
-0.01025227, 0.04008109, 1.411028, 0, 1, 0.9176471, 1,
-0.006751874, 0.3258284, -1.42441, 0, 1, 0.9215686, 1,
-0.005701694, -3.000965, -2.445029, 0, 1, 0.9294118, 1,
-0.004060862, 2.020733, 0.9054845, 0, 1, 0.9333333, 1,
-0.003831111, -1.287259, -3.344048, 0, 1, 0.9411765, 1,
0.003236052, 0.8706982, 0.802754, 0, 1, 0.945098, 1,
0.003595966, -0.7720044, 3.63155, 0, 1, 0.9529412, 1,
0.003638885, 0.8254115, 1.27034, 0, 1, 0.9568627, 1,
0.007169483, 0.5805284, 0.475956, 0, 1, 0.9647059, 1,
0.008514634, -0.06961013, 4.522848, 0, 1, 0.9686275, 1,
0.0100276, -0.4442607, 4.938118, 0, 1, 0.9764706, 1,
0.01080473, -1.448101, 3.508912, 0, 1, 0.9803922, 1,
0.01447274, -0.9826131, 5.087547, 0, 1, 0.9882353, 1,
0.01511246, -1.411806, 1.544413, 0, 1, 0.9921569, 1,
0.02134062, -0.043329, 4.325242, 0, 1, 1, 1,
0.02171908, -0.1193583, 2.928829, 0, 0.9921569, 1, 1,
0.03208848, -1.105602, 3.441932, 0, 0.9882353, 1, 1,
0.03512871, 1.649588, 0.9644892, 0, 0.9803922, 1, 1,
0.03528654, 0.3931663, -0.5087264, 0, 0.9764706, 1, 1,
0.03621545, 1.364367, 0.9523632, 0, 0.9686275, 1, 1,
0.03654417, 1.541283, -0.2728884, 0, 0.9647059, 1, 1,
0.03933406, 0.1387069, 1.29367, 0, 0.9568627, 1, 1,
0.04369213, 1.285565, 0.4044122, 0, 0.9529412, 1, 1,
0.04375812, -0.7879664, 3.527992, 0, 0.945098, 1, 1,
0.04493974, -0.2883541, 2.996193, 0, 0.9411765, 1, 1,
0.05679215, -0.07255239, 2.11656, 0, 0.9333333, 1, 1,
0.05969825, -0.5545135, 1.190898, 0, 0.9294118, 1, 1,
0.06069239, -0.5083368, 3.501281, 0, 0.9215686, 1, 1,
0.06232615, -0.6096517, 5.25261, 0, 0.9176471, 1, 1,
0.06326089, -0.4784951, 3.037044, 0, 0.9098039, 1, 1,
0.06405713, 0.7118652, 0.929931, 0, 0.9058824, 1, 1,
0.06497576, 0.7632869, 0.42899, 0, 0.8980392, 1, 1,
0.06805457, -3.890701, 2.92596, 0, 0.8901961, 1, 1,
0.07378963, 0.9642413, -0.8501599, 0, 0.8862745, 1, 1,
0.07748549, -1.374478, 3.940291, 0, 0.8784314, 1, 1,
0.08596021, -0.2790835, 2.078651, 0, 0.8745098, 1, 1,
0.08829793, -0.02796374, 0.9524645, 0, 0.8666667, 1, 1,
0.09008911, 1.453506, -1.259396, 0, 0.8627451, 1, 1,
0.09221646, -0.4120981, 3.913505, 0, 0.854902, 1, 1,
0.09258493, -0.1784592, 2.140122, 0, 0.8509804, 1, 1,
0.09328821, -0.308563, 0.6612851, 0, 0.8431373, 1, 1,
0.09360278, 1.787869, -0.171948, 0, 0.8392157, 1, 1,
0.09530676, 1.813762, -0.6490552, 0, 0.8313726, 1, 1,
0.09611879, -0.3745369, 2.710494, 0, 0.827451, 1, 1,
0.1024794, 0.2312215, -0.2278585, 0, 0.8196079, 1, 1,
0.1029394, -2.579208, 2.828316, 0, 0.8156863, 1, 1,
0.1071091, 2.772881, -0.1641864, 0, 0.8078431, 1, 1,
0.1106265, -0.5195355, 2.794409, 0, 0.8039216, 1, 1,
0.1161243, -0.3727011, 1.996149, 0, 0.7960784, 1, 1,
0.1183209, -1.804418, 3.504062, 0, 0.7882353, 1, 1,
0.121379, 0.374201, -1.105463, 0, 0.7843137, 1, 1,
0.1262458, 0.1621063, 0.5127306, 0, 0.7764706, 1, 1,
0.133331, 1.488261, -0.3658125, 0, 0.772549, 1, 1,
0.1386405, 2.094309, -2.151394, 0, 0.7647059, 1, 1,
0.1394602, 1.079751, -0.7507761, 0, 0.7607843, 1, 1,
0.1419302, -0.5070009, 3.066525, 0, 0.7529412, 1, 1,
0.1469773, 1.701861, 0.8850545, 0, 0.7490196, 1, 1,
0.1485179, -0.6181217, 3.371845, 0, 0.7411765, 1, 1,
0.1510096, -0.6789671, 3.382497, 0, 0.7372549, 1, 1,
0.1556115, 0.730898, 0.8186436, 0, 0.7294118, 1, 1,
0.1569265, -0.3232691, 4.203001, 0, 0.7254902, 1, 1,
0.1585024, -0.5174178, 3.470416, 0, 0.7176471, 1, 1,
0.1660847, 1.056862, 1.006773, 0, 0.7137255, 1, 1,
0.1678725, -0.01427613, -0.4746971, 0, 0.7058824, 1, 1,
0.1682594, -1.363156, 3.635125, 0, 0.6980392, 1, 1,
0.1735157, 0.07632097, -0.360764, 0, 0.6941177, 1, 1,
0.1777801, 0.198098, 1.330188, 0, 0.6862745, 1, 1,
0.1787561, 0.8468161, -0.8765646, 0, 0.682353, 1, 1,
0.1835841, -1.207648, 3.659621, 0, 0.6745098, 1, 1,
0.184558, 0.06326856, 0.7162382, 0, 0.6705883, 1, 1,
0.1928815, -0.983282, 2.191756, 0, 0.6627451, 1, 1,
0.193168, -1.102729, 2.094654, 0, 0.6588235, 1, 1,
0.1938098, 0.8251004, -2.002964, 0, 0.6509804, 1, 1,
0.194034, 0.03924843, 2.400146, 0, 0.6470588, 1, 1,
0.1966174, -0.2048901, 3.327862, 0, 0.6392157, 1, 1,
0.1988545, 0.608176, -2.349937, 0, 0.6352941, 1, 1,
0.1991563, 1.368007, -0.9489941, 0, 0.627451, 1, 1,
0.2023225, 0.6609082, 1.010381, 0, 0.6235294, 1, 1,
0.2053003, -2.125801, 1.781253, 0, 0.6156863, 1, 1,
0.2087331, -0.469445, 2.170318, 0, 0.6117647, 1, 1,
0.2092506, 0.1908221, -0.9888963, 0, 0.6039216, 1, 1,
0.2096868, 0.156506, 0.8800017, 0, 0.5960785, 1, 1,
0.2122293, -1.302145, 2.91003, 0, 0.5921569, 1, 1,
0.2123421, -0.9649488, 2.608964, 0, 0.5843138, 1, 1,
0.212601, 0.03612885, 1.315744, 0, 0.5803922, 1, 1,
0.2135378, 0.5302024, 1.752083, 0, 0.572549, 1, 1,
0.2173163, 1.462045, 0.0324355, 0, 0.5686275, 1, 1,
0.2178411, 0.2542157, -0.1819765, 0, 0.5607843, 1, 1,
0.2227363, -0.2260796, 2.423975, 0, 0.5568628, 1, 1,
0.2230177, -0.4914596, 4.60093, 0, 0.5490196, 1, 1,
0.2270941, -1.316119, 5.450365, 0, 0.5450981, 1, 1,
0.2289226, 2.195894, -1.270071, 0, 0.5372549, 1, 1,
0.2298334, -0.2504179, 2.848144, 0, 0.5333334, 1, 1,
0.2328839, 0.9390266, 0.1957718, 0, 0.5254902, 1, 1,
0.2381988, -0.8544077, 1.255863, 0, 0.5215687, 1, 1,
0.2402392, 0.3840562, -0.05223946, 0, 0.5137255, 1, 1,
0.2405548, 0.114349, 1.444768, 0, 0.509804, 1, 1,
0.254329, 1.063062, 0.06657817, 0, 0.5019608, 1, 1,
0.2551179, -0.466994, 3.489944, 0, 0.4941176, 1, 1,
0.257884, 0.0133242, 2.161453, 0, 0.4901961, 1, 1,
0.2640051, 0.8090125, 1.381064, 0, 0.4823529, 1, 1,
0.2661723, -0.862392, 2.165666, 0, 0.4784314, 1, 1,
0.2666826, -1.562679, 1.882422, 0, 0.4705882, 1, 1,
0.2673315, -2.310951, 4.337777, 0, 0.4666667, 1, 1,
0.2681717, 0.8676879, -0.1735525, 0, 0.4588235, 1, 1,
0.2767525, 0.4589374, 0.6930183, 0, 0.454902, 1, 1,
0.2806249, -0.9088295, 2.594318, 0, 0.4470588, 1, 1,
0.2852734, 0.4392347, -0.1775981, 0, 0.4431373, 1, 1,
0.2855873, -2.089885, 2.822144, 0, 0.4352941, 1, 1,
0.2868576, -0.2713735, 1.70069, 0, 0.4313726, 1, 1,
0.2869624, 0.9184113, 0.6979203, 0, 0.4235294, 1, 1,
0.2876164, -0.4975783, 0.9420565, 0, 0.4196078, 1, 1,
0.2878945, 0.02794828, 1.543992, 0, 0.4117647, 1, 1,
0.289047, -0.1412266, 1.248779, 0, 0.4078431, 1, 1,
0.2929235, -0.4053981, 2.930405, 0, 0.4, 1, 1,
0.2937157, -0.1078359, 3.354453, 0, 0.3921569, 1, 1,
0.2953716, 0.06604464, 0.9654242, 0, 0.3882353, 1, 1,
0.2953973, 0.31559, 0.5305864, 0, 0.3803922, 1, 1,
0.296112, -0.7661498, 3.797781, 0, 0.3764706, 1, 1,
0.2973882, 1.450235, 0.3503833, 0, 0.3686275, 1, 1,
0.3001397, -1.658439, 2.451001, 0, 0.3647059, 1, 1,
0.3007903, 0.1256678, -0.1026485, 0, 0.3568628, 1, 1,
0.3042421, 0.2897179, 0.5857462, 0, 0.3529412, 1, 1,
0.3093792, -0.201408, 1.415962, 0, 0.345098, 1, 1,
0.3098458, 0.05828917, 0.6348049, 0, 0.3411765, 1, 1,
0.3119683, 0.8667395, 1.052857, 0, 0.3333333, 1, 1,
0.3123514, 0.2636899, 2.552809, 0, 0.3294118, 1, 1,
0.3153817, -0.6966042, 2.91631, 0, 0.3215686, 1, 1,
0.3167297, -1.444826, 0.3370335, 0, 0.3176471, 1, 1,
0.3168709, 1.874392, 1.09776, 0, 0.3098039, 1, 1,
0.3197054, -0.4526763, 2.091353, 0, 0.3058824, 1, 1,
0.320287, -1.290848, 3.366644, 0, 0.2980392, 1, 1,
0.3206017, 1.347316, 0.5176229, 0, 0.2901961, 1, 1,
0.3255079, -1.821078, 1.873118, 0, 0.2862745, 1, 1,
0.3332961, 0.1391355, 0.2298177, 0, 0.2784314, 1, 1,
0.3334345, 0.08777967, 0.8273972, 0, 0.2745098, 1, 1,
0.3356633, -1.309488, 3.316749, 0, 0.2666667, 1, 1,
0.3357155, 0.5564798, 0.168904, 0, 0.2627451, 1, 1,
0.3378161, -0.4975415, 1.501894, 0, 0.254902, 1, 1,
0.3387353, -1.049352, 1.442929, 0, 0.2509804, 1, 1,
0.3438697, 1.706817, -0.5518119, 0, 0.2431373, 1, 1,
0.3494132, 0.402022, 0.274437, 0, 0.2392157, 1, 1,
0.3523768, 1.122051, 2.368384, 0, 0.2313726, 1, 1,
0.3567213, 0.9767209, 1.744017, 0, 0.227451, 1, 1,
0.3614869, -2.592059, 5.318064, 0, 0.2196078, 1, 1,
0.3625195, -0.6517677, 2.943596, 0, 0.2156863, 1, 1,
0.372317, 0.2391145, 1.931455, 0, 0.2078431, 1, 1,
0.3740137, 1.840584, -0.6709525, 0, 0.2039216, 1, 1,
0.3744751, 1.073085, 0.9745677, 0, 0.1960784, 1, 1,
0.3755777, 0.05722933, 2.685799, 0, 0.1882353, 1, 1,
0.3779972, 0.1420871, 2.24718, 0, 0.1843137, 1, 1,
0.3793631, -1.313719, 4.198802, 0, 0.1764706, 1, 1,
0.3804419, -1.608513, 2.995309, 0, 0.172549, 1, 1,
0.3813716, 1.374554, -0.7045379, 0, 0.1647059, 1, 1,
0.3867985, -1.068036, 3.05486, 0, 0.1607843, 1, 1,
0.3909646, 0.8827426, -1.267976, 0, 0.1529412, 1, 1,
0.3995389, 0.818876, 1.587616, 0, 0.1490196, 1, 1,
0.3998595, 0.009271208, 1.178791, 0, 0.1411765, 1, 1,
0.4037805, 2.140963, -0.1155139, 0, 0.1372549, 1, 1,
0.414226, 2.455033, -0.9178874, 0, 0.1294118, 1, 1,
0.4143163, -0.4722333, 0.05213778, 0, 0.1254902, 1, 1,
0.4155374, -0.1342867, 2.612287, 0, 0.1176471, 1, 1,
0.4192494, -0.4510263, 0.6346027, 0, 0.1137255, 1, 1,
0.4217159, 0.5486705, -0.7449248, 0, 0.1058824, 1, 1,
0.4258626, 0.8895159, -1.292166, 0, 0.09803922, 1, 1,
0.4283324, 1.437916, 0.2409662, 0, 0.09411765, 1, 1,
0.4285974, -0.3421276, 2.345434, 0, 0.08627451, 1, 1,
0.4327607, -1.397948, 2.757911, 0, 0.08235294, 1, 1,
0.4400714, 0.6771241, 0.772029, 0, 0.07450981, 1, 1,
0.4413615, 2.200539, 0.6486773, 0, 0.07058824, 1, 1,
0.4417116, -0.5379032, 1.638935, 0, 0.0627451, 1, 1,
0.4423836, -1.458036, 3.664111, 0, 0.05882353, 1, 1,
0.4514484, -1.687955, 4.095996, 0, 0.05098039, 1, 1,
0.4535893, 1.192723, -1.853788, 0, 0.04705882, 1, 1,
0.4541193, -0.7300967, 1.389883, 0, 0.03921569, 1, 1,
0.4607826, 1.120242, -0.08583781, 0, 0.03529412, 1, 1,
0.462962, -1.61575, 0.8485935, 0, 0.02745098, 1, 1,
0.4641735, 0.8653469, 2.15948, 0, 0.02352941, 1, 1,
0.4644228, 0.5347701, -0.5788626, 0, 0.01568628, 1, 1,
0.4649023, 0.3124836, 1.499579, 0, 0.01176471, 1, 1,
0.4681293, -1.708994, 4.523771, 0, 0.003921569, 1, 1,
0.4767005, 0.5357039, 1.617612, 0.003921569, 0, 1, 1,
0.4774816, 0.07340711, 2.315206, 0.007843138, 0, 1, 1,
0.4791845, 2.232986, 0.7974183, 0.01568628, 0, 1, 1,
0.4796972, -0.1994201, 0.6165435, 0.01960784, 0, 1, 1,
0.4816564, 1.724554, -1.102801, 0.02745098, 0, 1, 1,
0.4851529, 0.6426882, 0.9503761, 0.03137255, 0, 1, 1,
0.4856344, -0.4461187, 3.542558, 0.03921569, 0, 1, 1,
0.4860297, 1.262044, 0.399148, 0.04313726, 0, 1, 1,
0.4864296, -1.142469, 1.321969, 0.05098039, 0, 1, 1,
0.4895073, -0.2491528, 2.740378, 0.05490196, 0, 1, 1,
0.491491, 0.1165122, 1.373413, 0.0627451, 0, 1, 1,
0.50051, 0.06278709, 2.345405, 0.06666667, 0, 1, 1,
0.5021585, 1.541192, 1.048702, 0.07450981, 0, 1, 1,
0.5085677, 0.9606378, 1.801101, 0.07843138, 0, 1, 1,
0.5102974, 0.09425993, -0.6420547, 0.08627451, 0, 1, 1,
0.5131229, 0.8247866, 1.051446, 0.09019608, 0, 1, 1,
0.5191068, 0.3500197, 0.491182, 0.09803922, 0, 1, 1,
0.5279502, -0.7851765, 2.711232, 0.1058824, 0, 1, 1,
0.5295309, 0.3169171, 0.2752272, 0.1098039, 0, 1, 1,
0.5295998, -0.8003975, 3.03925, 0.1176471, 0, 1, 1,
0.5299969, -1.229556, 2.547291, 0.1215686, 0, 1, 1,
0.5311292, 1.364308, 0.4378735, 0.1294118, 0, 1, 1,
0.5330156, 1.796018, 0.06605127, 0.1333333, 0, 1, 1,
0.5351682, -0.8779715, 3.368978, 0.1411765, 0, 1, 1,
0.5359768, 0.8883822, -0.1829987, 0.145098, 0, 1, 1,
0.5401772, 0.2441538, 0.596646, 0.1529412, 0, 1, 1,
0.5446259, -0.06300949, 2.382864, 0.1568628, 0, 1, 1,
0.5490941, 0.1135801, 0.05169558, 0.1647059, 0, 1, 1,
0.5612473, 1.179552, 1.478746, 0.1686275, 0, 1, 1,
0.5634155, 0.6004831, 1.965976, 0.1764706, 0, 1, 1,
0.5639412, -0.1076425, 2.947833, 0.1803922, 0, 1, 1,
0.5639526, 0.4695663, 2.446356, 0.1882353, 0, 1, 1,
0.5701231, -0.3447929, 1.648928, 0.1921569, 0, 1, 1,
0.5741602, 0.1872458, 2.901196, 0.2, 0, 1, 1,
0.5743672, -0.8394597, 3.273173, 0.2078431, 0, 1, 1,
0.5784118, -0.7668187, 3.484786, 0.2117647, 0, 1, 1,
0.5785266, -1.306313, 3.794752, 0.2196078, 0, 1, 1,
0.5873687, -1.794825, 2.892075, 0.2235294, 0, 1, 1,
0.5892616, -0.1839709, 1.459508, 0.2313726, 0, 1, 1,
0.589443, 1.246789, -1.085853, 0.2352941, 0, 1, 1,
0.5894446, 0.09651532, 0.4852248, 0.2431373, 0, 1, 1,
0.5959111, -0.1956313, 0.2779844, 0.2470588, 0, 1, 1,
0.596722, -0.6942098, 1.085142, 0.254902, 0, 1, 1,
0.5992367, 0.6509724, 0.1320659, 0.2588235, 0, 1, 1,
0.5992891, -0.02492502, -0.3238893, 0.2666667, 0, 1, 1,
0.6004514, -0.8986874, 3.717072, 0.2705882, 0, 1, 1,
0.600901, 0.1134704, 0.8043699, 0.2784314, 0, 1, 1,
0.6027424, 2.275244, 0.08436042, 0.282353, 0, 1, 1,
0.6046243, 1.102745, 1.29709, 0.2901961, 0, 1, 1,
0.6056767, -1.699134, 1.993397, 0.2941177, 0, 1, 1,
0.6059334, 0.9805768, 3.067683, 0.3019608, 0, 1, 1,
0.6062325, -1.018122, 3.127579, 0.3098039, 0, 1, 1,
0.6121571, 1.567077, 1.25143, 0.3137255, 0, 1, 1,
0.6138121, -0.4987952, 2.260072, 0.3215686, 0, 1, 1,
0.6146783, -0.1042039, 2.414068, 0.3254902, 0, 1, 1,
0.617757, -1.147834, 3.377376, 0.3333333, 0, 1, 1,
0.626153, -0.6376595, 2.375156, 0.3372549, 0, 1, 1,
0.6264983, 0.3850568, -0.6100601, 0.345098, 0, 1, 1,
0.6268923, -0.6031312, 2.843034, 0.3490196, 0, 1, 1,
0.6286104, -0.9509708, 0.8980364, 0.3568628, 0, 1, 1,
0.6331505, -1.189733, 2.438107, 0.3607843, 0, 1, 1,
0.6333839, 0.1478287, 0.7329338, 0.3686275, 0, 1, 1,
0.6340213, -0.3737456, 0.9454575, 0.372549, 0, 1, 1,
0.6425792, 0.5921164, -0.05338188, 0.3803922, 0, 1, 1,
0.6429461, -0.5762514, 1.299057, 0.3843137, 0, 1, 1,
0.6473591, -0.8311805, 2.508867, 0.3921569, 0, 1, 1,
0.6478401, 0.3416638, 0.2382296, 0.3960784, 0, 1, 1,
0.6512908, 0.008586658, 1.756936, 0.4039216, 0, 1, 1,
0.6605194, 1.138632, -0.5550171, 0.4117647, 0, 1, 1,
0.6652414, 0.9016236, 1.025602, 0.4156863, 0, 1, 1,
0.6678903, 1.511791, -1.272323, 0.4235294, 0, 1, 1,
0.6749085, -0.6830544, 2.077052, 0.427451, 0, 1, 1,
0.6766442, 0.3302466, -0.1254217, 0.4352941, 0, 1, 1,
0.6827662, 1.690459, -1.988854, 0.4392157, 0, 1, 1,
0.6835085, 1.038497, -0.5677504, 0.4470588, 0, 1, 1,
0.6841614, 0.1648801, 0.9660736, 0.4509804, 0, 1, 1,
0.6863842, -0.5699751, 2.520487, 0.4588235, 0, 1, 1,
0.6875398, 1.854444, 2.111771, 0.4627451, 0, 1, 1,
0.687562, 0.4625335, 2.027328, 0.4705882, 0, 1, 1,
0.6903154, 0.6368139, 1.041891, 0.4745098, 0, 1, 1,
0.6907443, 0.3944862, 1.776456, 0.4823529, 0, 1, 1,
0.6909731, -1.39533, 3.155946, 0.4862745, 0, 1, 1,
0.6917982, -0.5621445, 2.728306, 0.4941176, 0, 1, 1,
0.6956022, 1.246645, -0.3971753, 0.5019608, 0, 1, 1,
0.6968283, 0.9650419, 1.532564, 0.5058824, 0, 1, 1,
0.7054949, 2.017028, -0.798088, 0.5137255, 0, 1, 1,
0.7069913, 0.473829, 1.001135, 0.5176471, 0, 1, 1,
0.7086674, 0.04019402, 0.9013691, 0.5254902, 0, 1, 1,
0.7088246, -1.538627, 2.114306, 0.5294118, 0, 1, 1,
0.7093177, 0.8862597, 0.3514705, 0.5372549, 0, 1, 1,
0.7119804, 0.4565115, 0.6892995, 0.5411765, 0, 1, 1,
0.7172387, -0.7007201, 1.676402, 0.5490196, 0, 1, 1,
0.7200416, -0.1455235, 2.270358, 0.5529412, 0, 1, 1,
0.7275002, 1.061439, 1.197934, 0.5607843, 0, 1, 1,
0.7283797, 0.868472, 2.426439, 0.5647059, 0, 1, 1,
0.7288601, -0.3676838, 0.851204, 0.572549, 0, 1, 1,
0.7319567, 2.23436, 0.4542387, 0.5764706, 0, 1, 1,
0.7427601, 0.4648013, 0.02048541, 0.5843138, 0, 1, 1,
0.7465534, 0.6408044, -0.1908646, 0.5882353, 0, 1, 1,
0.7506881, -2.107791, 2.470266, 0.5960785, 0, 1, 1,
0.7522672, 0.1885629, 0.5329694, 0.6039216, 0, 1, 1,
0.7549102, -3.436519, 3.922075, 0.6078432, 0, 1, 1,
0.7556219, -0.5191779, 2.201512, 0.6156863, 0, 1, 1,
0.7609702, 0.2614588, 1.910005, 0.6196079, 0, 1, 1,
0.7621714, 0.3500871, 1.806588, 0.627451, 0, 1, 1,
0.7688419, 0.3062113, 0.3083966, 0.6313726, 0, 1, 1,
0.7692415, -0.4474331, 2.68464, 0.6392157, 0, 1, 1,
0.7693712, 0.07529327, -0.4393636, 0.6431373, 0, 1, 1,
0.7735217, -0.01962279, 3.83573, 0.6509804, 0, 1, 1,
0.7768871, -0.4951052, 0.8436899, 0.654902, 0, 1, 1,
0.7881231, -0.3699361, 1.524059, 0.6627451, 0, 1, 1,
0.7884332, -1.305013, 2.339182, 0.6666667, 0, 1, 1,
0.7900987, -0.8097844, 1.818873, 0.6745098, 0, 1, 1,
0.7908343, -0.786275, 1.323306, 0.6784314, 0, 1, 1,
0.7965983, 1.220908, 2.197163, 0.6862745, 0, 1, 1,
0.7998705, 0.5396187, 0.8135081, 0.6901961, 0, 1, 1,
0.8026753, 2.538747, -0.2737491, 0.6980392, 0, 1, 1,
0.8078238, -0.2066227, 1.06831, 0.7058824, 0, 1, 1,
0.8085405, 0.03040394, 2.823721, 0.7098039, 0, 1, 1,
0.8173784, 1.22903, -1.916415, 0.7176471, 0, 1, 1,
0.818423, -2.086071, 3.931172, 0.7215686, 0, 1, 1,
0.8206985, 1.164008, 1.310258, 0.7294118, 0, 1, 1,
0.8230296, -0.6670898, 0.8152382, 0.7333333, 0, 1, 1,
0.8260849, 1.161826, 0.8604922, 0.7411765, 0, 1, 1,
0.8261443, 0.1664005, 1.581608, 0.7450981, 0, 1, 1,
0.8286278, -0.09033953, 2.577598, 0.7529412, 0, 1, 1,
0.8293229, 0.7788049, 0.7276528, 0.7568628, 0, 1, 1,
0.8318435, -0.1534236, 2.053032, 0.7647059, 0, 1, 1,
0.8336459, 1.331304, -0.7896146, 0.7686275, 0, 1, 1,
0.8368135, 1.978674, 1.064161, 0.7764706, 0, 1, 1,
0.8411714, 0.5529199, 0.9479755, 0.7803922, 0, 1, 1,
0.8426886, 0.160615, 0.3396557, 0.7882353, 0, 1, 1,
0.8439209, 0.944366, 0.2242786, 0.7921569, 0, 1, 1,
0.8447939, 0.8092358, -1.706836, 0.8, 0, 1, 1,
0.8609931, 0.9878582, 1.15388, 0.8078431, 0, 1, 1,
0.8703597, 0.2387565, 0.2300716, 0.8117647, 0, 1, 1,
0.8860851, -0.457573, 4.318268, 0.8196079, 0, 1, 1,
0.8894619, 1.025346, -0.2535152, 0.8235294, 0, 1, 1,
0.8913597, 0.7498763, -0.1660922, 0.8313726, 0, 1, 1,
0.9036211, 0.02706654, 2.702373, 0.8352941, 0, 1, 1,
0.9038253, 0.1998789, -0.04479651, 0.8431373, 0, 1, 1,
0.9045054, -0.4449411, 2.713995, 0.8470588, 0, 1, 1,
0.9062802, 0.3619913, 0.8950061, 0.854902, 0, 1, 1,
0.9082005, -0.5149142, 3.007586, 0.8588235, 0, 1, 1,
0.910292, -0.8326496, 1.561491, 0.8666667, 0, 1, 1,
0.9154429, -0.2739403, 0.9162595, 0.8705882, 0, 1, 1,
0.9185055, -0.3049081, 0.8155591, 0.8784314, 0, 1, 1,
0.9222405, 0.447545, 0.995911, 0.8823529, 0, 1, 1,
0.9237185, -0.8665708, 3.143394, 0.8901961, 0, 1, 1,
0.9242696, 0.07366285, 1.998116, 0.8941177, 0, 1, 1,
0.927299, -0.1766454, 2.444413, 0.9019608, 0, 1, 1,
0.9330387, 0.358368, 0.950484, 0.9098039, 0, 1, 1,
0.9408416, -0.6137561, 1.242229, 0.9137255, 0, 1, 1,
0.9409567, 0.1970304, 3.938648, 0.9215686, 0, 1, 1,
0.943924, -0.2324918, 3.057503, 0.9254902, 0, 1, 1,
0.9445004, -0.5419412, 2.056996, 0.9333333, 0, 1, 1,
0.9546744, -0.8900816, 4.103305, 0.9372549, 0, 1, 1,
0.958602, -1.284695, 4.861557, 0.945098, 0, 1, 1,
0.9590548, -1.079492, 1.297101, 0.9490196, 0, 1, 1,
0.9604697, 0.5529086, 0.533806, 0.9568627, 0, 1, 1,
0.9790293, 1.152404, 1.630594, 0.9607843, 0, 1, 1,
0.9799131, 0.1626423, 2.901835, 0.9686275, 0, 1, 1,
0.9839492, 0.1802207, -0.08858482, 0.972549, 0, 1, 1,
0.9870046, 0.1228572, 2.371923, 0.9803922, 0, 1, 1,
0.9953412, 0.9358798, -1.324653, 0.9843137, 0, 1, 1,
0.9963921, 0.3650385, -1.064668, 0.9921569, 0, 1, 1,
0.998154, 1.365954, 1.294048, 0.9960784, 0, 1, 1,
1.001892, 0.8959785, 1.476352, 1, 0, 0.9960784, 1,
1.002414, 1.654021, -0.5030836, 1, 0, 0.9882353, 1,
1.008354, 3.547031, -0.08121208, 1, 0, 0.9843137, 1,
1.014992, 0.280591, 2.325007, 1, 0, 0.9764706, 1,
1.018321, 1.814557, -0.124077, 1, 0, 0.972549, 1,
1.022296, -0.0310783, 2.062686, 1, 0, 0.9647059, 1,
1.0321, 0.7909601, 1.341408, 1, 0, 0.9607843, 1,
1.039364, 0.7849697, 1.156851, 1, 0, 0.9529412, 1,
1.0403, -0.3673659, 2.00479, 1, 0, 0.9490196, 1,
1.04158, -0.5593346, 1.25887, 1, 0, 0.9411765, 1,
1.043087, 0.5983855, 0.605863, 1, 0, 0.9372549, 1,
1.045383, -1.229566, 1.880869, 1, 0, 0.9294118, 1,
1.05091, 0.3103943, 0.8312688, 1, 0, 0.9254902, 1,
1.051705, 0.760428, 1.782265, 1, 0, 0.9176471, 1,
1.055344, -0.5322644, 2.872373, 1, 0, 0.9137255, 1,
1.059692, 1.547087, 0.9869668, 1, 0, 0.9058824, 1,
1.063667, -0.7966061, 2.580373, 1, 0, 0.9019608, 1,
1.064434, 1.133401, 1.451472, 1, 0, 0.8941177, 1,
1.065519, 0.6877891, 1.008928, 1, 0, 0.8862745, 1,
1.066626, -0.1055849, 2.674442, 1, 0, 0.8823529, 1,
1.066748, 0.2284646, 2.064372, 1, 0, 0.8745098, 1,
1.075872, 0.5539195, 0.135685, 1, 0, 0.8705882, 1,
1.078331, -0.4453415, 0.8058333, 1, 0, 0.8627451, 1,
1.080774, -1.023461, 2.584518, 1, 0, 0.8588235, 1,
1.083254, 1.084551, 1.327919, 1, 0, 0.8509804, 1,
1.084329, -0.1118435, 2.514867, 1, 0, 0.8470588, 1,
1.09251, 0.9809251, 0.997439, 1, 0, 0.8392157, 1,
1.093028, -0.1721315, 1.397201, 1, 0, 0.8352941, 1,
1.094372, -1.528852, 2.974964, 1, 0, 0.827451, 1,
1.108251, 0.7684077, 1.893731, 1, 0, 0.8235294, 1,
1.110344, 1.391136, 0.7502588, 1, 0, 0.8156863, 1,
1.116072, -1.47427, 2.42325, 1, 0, 0.8117647, 1,
1.122728, -1.496573, 2.374289, 1, 0, 0.8039216, 1,
1.123755, -1.204517, 2.401384, 1, 0, 0.7960784, 1,
1.124876, -0.5071684, 3.050323, 1, 0, 0.7921569, 1,
1.129562, 0.2101405, 0.740536, 1, 0, 0.7843137, 1,
1.133472, 0.995414, 0.9106467, 1, 0, 0.7803922, 1,
1.135126, 1.00042, 0.8136558, 1, 0, 0.772549, 1,
1.138307, -1.361154, 1.161156, 1, 0, 0.7686275, 1,
1.149307, 1.028388, 2.130335, 1, 0, 0.7607843, 1,
1.153857, 0.7869671, 1.010528, 1, 0, 0.7568628, 1,
1.154093, -0.184983, 1.757801, 1, 0, 0.7490196, 1,
1.157768, -1.445341, 1.285976, 1, 0, 0.7450981, 1,
1.159674, 1.651037, 1.268576, 1, 0, 0.7372549, 1,
1.161, 0.7479627, 0.07917115, 1, 0, 0.7333333, 1,
1.17149, -0.04563864, 2.66536, 1, 0, 0.7254902, 1,
1.177091, -0.07134652, 0.4862085, 1, 0, 0.7215686, 1,
1.183949, -0.1992859, 1.867253, 1, 0, 0.7137255, 1,
1.19718, -0.1677115, 1.339423, 1, 0, 0.7098039, 1,
1.203565, -0.8931199, 1.97569, 1, 0, 0.7019608, 1,
1.205471, 0.8828937, 1.074217, 1, 0, 0.6941177, 1,
1.210634, -0.6606697, 2.400478, 1, 0, 0.6901961, 1,
1.21064, 0.4073875, 0.2677928, 1, 0, 0.682353, 1,
1.222822, -0.5337382, 3.56794, 1, 0, 0.6784314, 1,
1.22925, 1.699816, 0.3017701, 1, 0, 0.6705883, 1,
1.235381, 0.1490719, 1.056228, 1, 0, 0.6666667, 1,
1.243591, 1.270463, -0.07342945, 1, 0, 0.6588235, 1,
1.246437, -1.138226, 1.673766, 1, 0, 0.654902, 1,
1.246737, 1.371061, 0.6827169, 1, 0, 0.6470588, 1,
1.257533, 0.06474048, 1.838427, 1, 0, 0.6431373, 1,
1.269815, 1.017445, 0.7719799, 1, 0, 0.6352941, 1,
1.270851, -1.854349, 1.711689, 1, 0, 0.6313726, 1,
1.282287, -1.072599, 3.885571, 1, 0, 0.6235294, 1,
1.286606, 1.315927, 1.75219, 1, 0, 0.6196079, 1,
1.288299, -0.8477279, 3.45988, 1, 0, 0.6117647, 1,
1.296064, 1.10483, 0.9601734, 1, 0, 0.6078432, 1,
1.303814, 1.378246, 0.3010176, 1, 0, 0.6, 1,
1.311189, 0.1787712, 1.967726, 1, 0, 0.5921569, 1,
1.315988, 2.256208, 0.5354577, 1, 0, 0.5882353, 1,
1.319709, 0.7063684, 0.5801115, 1, 0, 0.5803922, 1,
1.321572, 0.3436554, -0.9151418, 1, 0, 0.5764706, 1,
1.321825, -0.1250004, 1.828056, 1, 0, 0.5686275, 1,
1.359305, -1.553498, 2.887762, 1, 0, 0.5647059, 1,
1.375666, -0.8273401, 3.676493, 1, 0, 0.5568628, 1,
1.376457, 0.7754752, 0.06827315, 1, 0, 0.5529412, 1,
1.378145, -2.908311, 2.238983, 1, 0, 0.5450981, 1,
1.39071, -0.6921761, 2.689543, 1, 0, 0.5411765, 1,
1.395163, 0.9778057, 0.426788, 1, 0, 0.5333334, 1,
1.398024, -0.2219959, 1.209048, 1, 0, 0.5294118, 1,
1.39908, 1.560639, 1.546332, 1, 0, 0.5215687, 1,
1.404508, -2.00261, 3.485715, 1, 0, 0.5176471, 1,
1.447861, -0.06092027, 0.626566, 1, 0, 0.509804, 1,
1.449921, -0.6480224, 4.122595, 1, 0, 0.5058824, 1,
1.45538, -0.3877778, 2.302526, 1, 0, 0.4980392, 1,
1.460096, 0.04581671, 0.8152693, 1, 0, 0.4901961, 1,
1.468697, -0.2747727, -0.4780099, 1, 0, 0.4862745, 1,
1.47413, -0.375268, 2.446922, 1, 0, 0.4784314, 1,
1.476705, -1.721693, 2.715226, 1, 0, 0.4745098, 1,
1.478703, -2.674467, 2.355865, 1, 0, 0.4666667, 1,
1.482379, -1.068991, 2.384254, 1, 0, 0.4627451, 1,
1.483066, 0.06229606, 3.02583, 1, 0, 0.454902, 1,
1.491888, 0.5294986, 1.480358, 1, 0, 0.4509804, 1,
1.501183, 2.100414, 2.472781, 1, 0, 0.4431373, 1,
1.503451, 2.065378, 0.3913383, 1, 0, 0.4392157, 1,
1.504882, -0.7599058, 2.50868, 1, 0, 0.4313726, 1,
1.508329, -1.242524, 2.163007, 1, 0, 0.427451, 1,
1.512304, -1.811024, 2.184512, 1, 0, 0.4196078, 1,
1.523261, 0.138148, 1.950416, 1, 0, 0.4156863, 1,
1.567413, 0.9735691, 0.6887972, 1, 0, 0.4078431, 1,
1.569715, 1.523711, 0.2849686, 1, 0, 0.4039216, 1,
1.578873, -0.04624633, 0.07890247, 1, 0, 0.3960784, 1,
1.594083, 0.3492803, 0.7009881, 1, 0, 0.3882353, 1,
1.59752, -0.1217735, 0.6915817, 1, 0, 0.3843137, 1,
1.601208, 0.8514801, 2.116874, 1, 0, 0.3764706, 1,
1.606327, 0.3991514, -0.01105327, 1, 0, 0.372549, 1,
1.617705, 0.689118, -0.6548816, 1, 0, 0.3647059, 1,
1.620183, -0.03290086, 1.504175, 1, 0, 0.3607843, 1,
1.629, 0.4210806, 0.7477144, 1, 0, 0.3529412, 1,
1.630289, -0.8399022, 3.926794, 1, 0, 0.3490196, 1,
1.630627, 0.09386215, 1.905068, 1, 0, 0.3411765, 1,
1.638194, 0.6744363, 2.730806, 1, 0, 0.3372549, 1,
1.638271, 0.4854258, 0.9844301, 1, 0, 0.3294118, 1,
1.653344, -0.8447683, 0.11602, 1, 0, 0.3254902, 1,
1.664486, 1.644268, 1.499433, 1, 0, 0.3176471, 1,
1.679146, -1.196915, 2.84403, 1, 0, 0.3137255, 1,
1.685193, 1.097649, -0.3858791, 1, 0, 0.3058824, 1,
1.69074, -1.145131, 2.411724, 1, 0, 0.2980392, 1,
1.699818, -1.314928, 2.288192, 1, 0, 0.2941177, 1,
1.726619, 0.9569965, 1.329842, 1, 0, 0.2862745, 1,
1.727442, -1.351793, 4.595596, 1, 0, 0.282353, 1,
1.733016, 0.8339432, 2.065728, 1, 0, 0.2745098, 1,
1.768933, 1.193297, 3.062539, 1, 0, 0.2705882, 1,
1.775201, -1.436674, 2.204147, 1, 0, 0.2627451, 1,
1.785837, 0.6936818, 0.5575686, 1, 0, 0.2588235, 1,
1.792307, -0.6895732, 1.413934, 1, 0, 0.2509804, 1,
1.79436, 1.167186, -0.01777537, 1, 0, 0.2470588, 1,
1.796458, -1.26925, 4.084307, 1, 0, 0.2392157, 1,
1.804522, -0.4900602, 3.723904, 1, 0, 0.2352941, 1,
1.816216, 0.3821636, 0.2582267, 1, 0, 0.227451, 1,
1.840676, 1.757621, 0.8148711, 1, 0, 0.2235294, 1,
1.841632, 1.387087, 0.4232545, 1, 0, 0.2156863, 1,
1.84633, -0.2365409, 0.9260815, 1, 0, 0.2117647, 1,
1.860384, -1.39765, 2.525743, 1, 0, 0.2039216, 1,
1.860844, 0.1102678, 1.17871, 1, 0, 0.1960784, 1,
1.873714, -0.1954714, 0.4827311, 1, 0, 0.1921569, 1,
1.911688, 0.9886177, 0.7727118, 1, 0, 0.1843137, 1,
1.92278, -0.8474463, 2.218829, 1, 0, 0.1803922, 1,
1.937664, 0.1128934, 2.119256, 1, 0, 0.172549, 1,
1.98549, -0.5435498, 2.384867, 1, 0, 0.1686275, 1,
1.999315, -0.1901017, 1.869441, 1, 0, 0.1607843, 1,
2.029972, 0.1619335, 2.735587, 1, 0, 0.1568628, 1,
2.041101, 0.6242997, -0.5044967, 1, 0, 0.1490196, 1,
2.070835, -0.6423492, 4.029006, 1, 0, 0.145098, 1,
2.074082, -0.7359093, 0.8851085, 1, 0, 0.1372549, 1,
2.099051, -0.5167756, 2.64295, 1, 0, 0.1333333, 1,
2.108173, 1.171976, 0.7750834, 1, 0, 0.1254902, 1,
2.114022, 0.7553012, 3.012366, 1, 0, 0.1215686, 1,
2.132229, 1.319998, 1.418786, 1, 0, 0.1137255, 1,
2.133292, 0.2365776, 0.766695, 1, 0, 0.1098039, 1,
2.163264, 0.8188862, 2.231956, 1, 0, 0.1019608, 1,
2.178862, 0.5922143, 1.042255, 1, 0, 0.09411765, 1,
2.181166, 0.4456352, 2.024779, 1, 0, 0.09019608, 1,
2.204423, 0.1970812, 1.783264, 1, 0, 0.08235294, 1,
2.284993, 0.2811337, 0.1021376, 1, 0, 0.07843138, 1,
2.310369, -1.36591, 1.02411, 1, 0, 0.07058824, 1,
2.365561, 0.1643961, -0.5147403, 1, 0, 0.06666667, 1,
2.369311, -0.9504878, 0.09861739, 1, 0, 0.05882353, 1,
2.403262, -0.9018353, 2.856867, 1, 0, 0.05490196, 1,
2.480379, 0.5971283, -0.01357942, 1, 0, 0.04705882, 1,
2.519542, -0.3643505, 0.6098009, 1, 0, 0.04313726, 1,
2.523788, 0.9269934, 1.788045, 1, 0, 0.03529412, 1,
2.54338, -0.9127138, 3.724552, 1, 0, 0.03137255, 1,
2.550457, 0.3972533, 3.635361, 1, 0, 0.02352941, 1,
2.628013, 0.9830049, 0.6476637, 1, 0, 0.01960784, 1,
2.718525, 1.791804, 0.9740516, 1, 0, 0.01176471, 1,
3.021049, -0.04647756, 2.001409, 1, 0, 0.007843138, 1
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
-0.1923062, -5.22854, -7.455051, 0, -0.5, 0.5, 0.5,
-0.1923062, -5.22854, -7.455051, 1, -0.5, 0.5, 0.5,
-0.1923062, -5.22854, -7.455051, 1, 1.5, 0.5, 0.5,
-0.1923062, -5.22854, -7.455051, 0, 1.5, 0.5, 0.5
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
-4.494989, 0.05572903, -7.455051, 0, -0.5, 0.5, 0.5,
-4.494989, 0.05572903, -7.455051, 1, -0.5, 0.5, 0.5,
-4.494989, 0.05572903, -7.455051, 1, 1.5, 0.5, 0.5,
-4.494989, 0.05572903, -7.455051, 0, 1.5, 0.5, 0.5
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
-4.494989, -5.22854, -0.06712794, 0, -0.5, 0.5, 0.5,
-4.494989, -5.22854, -0.06712794, 1, -0.5, 0.5, 0.5,
-4.494989, -5.22854, -0.06712794, 1, 1.5, 0.5, 0.5,
-4.494989, -5.22854, -0.06712794, 0, 1.5, 0.5, 0.5
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
-3, -4.009093, -5.750146,
3, -4.009093, -5.750146,
-3, -4.009093, -5.750146,
-3, -4.212335, -6.034297,
-2, -4.009093, -5.750146,
-2, -4.212335, -6.034297,
-1, -4.009093, -5.750146,
-1, -4.212335, -6.034297,
0, -4.009093, -5.750146,
0, -4.212335, -6.034297,
1, -4.009093, -5.750146,
1, -4.212335, -6.034297,
2, -4.009093, -5.750146,
2, -4.212335, -6.034297,
3, -4.009093, -5.750146,
3, -4.212335, -6.034297
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
-3, -4.618817, -6.602598, 0, -0.5, 0.5, 0.5,
-3, -4.618817, -6.602598, 1, -0.5, 0.5, 0.5,
-3, -4.618817, -6.602598, 1, 1.5, 0.5, 0.5,
-3, -4.618817, -6.602598, 0, 1.5, 0.5, 0.5,
-2, -4.618817, -6.602598, 0, -0.5, 0.5, 0.5,
-2, -4.618817, -6.602598, 1, -0.5, 0.5, 0.5,
-2, -4.618817, -6.602598, 1, 1.5, 0.5, 0.5,
-2, -4.618817, -6.602598, 0, 1.5, 0.5, 0.5,
-1, -4.618817, -6.602598, 0, -0.5, 0.5, 0.5,
-1, -4.618817, -6.602598, 1, -0.5, 0.5, 0.5,
-1, -4.618817, -6.602598, 1, 1.5, 0.5, 0.5,
-1, -4.618817, -6.602598, 0, 1.5, 0.5, 0.5,
0, -4.618817, -6.602598, 0, -0.5, 0.5, 0.5,
0, -4.618817, -6.602598, 1, -0.5, 0.5, 0.5,
0, -4.618817, -6.602598, 1, 1.5, 0.5, 0.5,
0, -4.618817, -6.602598, 0, 1.5, 0.5, 0.5,
1, -4.618817, -6.602598, 0, -0.5, 0.5, 0.5,
1, -4.618817, -6.602598, 1, -0.5, 0.5, 0.5,
1, -4.618817, -6.602598, 1, 1.5, 0.5, 0.5,
1, -4.618817, -6.602598, 0, 1.5, 0.5, 0.5,
2, -4.618817, -6.602598, 0, -0.5, 0.5, 0.5,
2, -4.618817, -6.602598, 1, -0.5, 0.5, 0.5,
2, -4.618817, -6.602598, 1, 1.5, 0.5, 0.5,
2, -4.618817, -6.602598, 0, 1.5, 0.5, 0.5,
3, -4.618817, -6.602598, 0, -0.5, 0.5, 0.5,
3, -4.618817, -6.602598, 1, -0.5, 0.5, 0.5,
3, -4.618817, -6.602598, 1, 1.5, 0.5, 0.5,
3, -4.618817, -6.602598, 0, 1.5, 0.5, 0.5
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
-3.502063, -2, -5.750146,
-3.502063, 4, -5.750146,
-3.502063, -2, -5.750146,
-3.66755, -2, -6.034297,
-3.502063, 0, -5.750146,
-3.66755, 0, -6.034297,
-3.502063, 2, -5.750146,
-3.66755, 2, -6.034297,
-3.502063, 4, -5.750146,
-3.66755, 4, -6.034297
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
-3.998526, -2, -6.602598, 0, -0.5, 0.5, 0.5,
-3.998526, -2, -6.602598, 1, -0.5, 0.5, 0.5,
-3.998526, -2, -6.602598, 1, 1.5, 0.5, 0.5,
-3.998526, -2, -6.602598, 0, 1.5, 0.5, 0.5,
-3.998526, 0, -6.602598, 0, -0.5, 0.5, 0.5,
-3.998526, 0, -6.602598, 1, -0.5, 0.5, 0.5,
-3.998526, 0, -6.602598, 1, 1.5, 0.5, 0.5,
-3.998526, 0, -6.602598, 0, 1.5, 0.5, 0.5,
-3.998526, 2, -6.602598, 0, -0.5, 0.5, 0.5,
-3.998526, 2, -6.602598, 1, -0.5, 0.5, 0.5,
-3.998526, 2, -6.602598, 1, 1.5, 0.5, 0.5,
-3.998526, 2, -6.602598, 0, 1.5, 0.5, 0.5,
-3.998526, 4, -6.602598, 0, -0.5, 0.5, 0.5,
-3.998526, 4, -6.602598, 1, -0.5, 0.5, 0.5,
-3.998526, 4, -6.602598, 1, 1.5, 0.5, 0.5,
-3.998526, 4, -6.602598, 0, 1.5, 0.5, 0.5
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
-3.502063, -4.009093, -4,
-3.502063, -4.009093, 4,
-3.502063, -4.009093, -4,
-3.66755, -4.212335, -4,
-3.502063, -4.009093, -2,
-3.66755, -4.212335, -2,
-3.502063, -4.009093, 0,
-3.66755, -4.212335, 0,
-3.502063, -4.009093, 2,
-3.66755, -4.212335, 2,
-3.502063, -4.009093, 4,
-3.66755, -4.212335, 4
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
-3.998526, -4.618817, -4, 0, -0.5, 0.5, 0.5,
-3.998526, -4.618817, -4, 1, -0.5, 0.5, 0.5,
-3.998526, -4.618817, -4, 1, 1.5, 0.5, 0.5,
-3.998526, -4.618817, -4, 0, 1.5, 0.5, 0.5,
-3.998526, -4.618817, -2, 0, -0.5, 0.5, 0.5,
-3.998526, -4.618817, -2, 1, -0.5, 0.5, 0.5,
-3.998526, -4.618817, -2, 1, 1.5, 0.5, 0.5,
-3.998526, -4.618817, -2, 0, 1.5, 0.5, 0.5,
-3.998526, -4.618817, 0, 0, -0.5, 0.5, 0.5,
-3.998526, -4.618817, 0, 1, -0.5, 0.5, 0.5,
-3.998526, -4.618817, 0, 1, 1.5, 0.5, 0.5,
-3.998526, -4.618817, 0, 0, 1.5, 0.5, 0.5,
-3.998526, -4.618817, 2, 0, -0.5, 0.5, 0.5,
-3.998526, -4.618817, 2, 1, -0.5, 0.5, 0.5,
-3.998526, -4.618817, 2, 1, 1.5, 0.5, 0.5,
-3.998526, -4.618817, 2, 0, 1.5, 0.5, 0.5,
-3.998526, -4.618817, 4, 0, -0.5, 0.5, 0.5,
-3.998526, -4.618817, 4, 1, -0.5, 0.5, 0.5,
-3.998526, -4.618817, 4, 1, 1.5, 0.5, 0.5,
-3.998526, -4.618817, 4, 0, 1.5, 0.5, 0.5
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
-3.502063, -4.009093, -5.750146,
-3.502063, 4.120552, -5.750146,
-3.502063, -4.009093, 5.61589,
-3.502063, 4.120552, 5.61589,
-3.502063, -4.009093, -5.750146,
-3.502063, -4.009093, 5.61589,
-3.502063, 4.120552, -5.750146,
-3.502063, 4.120552, 5.61589,
-3.502063, -4.009093, -5.750146,
3.11745, -4.009093, -5.750146,
-3.502063, -4.009093, 5.61589,
3.11745, -4.009093, 5.61589,
-3.502063, 4.120552, -5.750146,
3.11745, 4.120552, -5.750146,
-3.502063, 4.120552, 5.61589,
3.11745, 4.120552, 5.61589,
3.11745, -4.009093, -5.750146,
3.11745, 4.120552, -5.750146,
3.11745, -4.009093, 5.61589,
3.11745, 4.120552, 5.61589,
3.11745, -4.009093, -5.750146,
3.11745, -4.009093, 5.61589,
3.11745, 4.120552, -5.750146,
3.11745, 4.120552, 5.61589
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
var radius = 8.256794;
var distance = 36.73541;
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
mvMatrix.translate( 0.1923062, -0.05572903, 0.06712794 );
mvMatrix.scale( 1.34865, 1.09813, 0.785446 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.73541);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
fenpropidin<-read.table("fenpropidin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenpropidin$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpropidin' not found
```

```r
y<-fenpropidin$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpropidin' not found
```

```r
z<-fenpropidin$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpropidin' not found
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
-3.405662, -0.5054649, -0.6256949, 0, 0, 1, 1, 1,
-3.100194, -2.537917, -3.373685, 1, 0, 0, 1, 1,
-2.906514, -0.8087404, -2.444612, 1, 0, 0, 1, 1,
-2.568272, 0.4904744, -2.424086, 1, 0, 0, 1, 1,
-2.3373, -0.6526103, -1.745026, 1, 0, 0, 1, 1,
-2.245816, -0.4088068, -1.884822, 1, 0, 0, 1, 1,
-2.219716, 1.738035, -1.849348, 0, 0, 0, 1, 1,
-2.144107, 0.2660608, -3.301312, 0, 0, 0, 1, 1,
-2.142191, -1.205209, -2.114043, 0, 0, 0, 1, 1,
-2.110346, -1.289476, -3.238692, 0, 0, 0, 1, 1,
-2.050701, -0.4342299, -1.813439, 0, 0, 0, 1, 1,
-2.048988, 4.002159, -0.0667751, 0, 0, 0, 1, 1,
-2.001608, 0.8369493, 0.04778664, 0, 0, 0, 1, 1,
-1.985694, 0.4610417, -3.08645, 1, 1, 1, 1, 1,
-1.963036, 1.553731, -0.467677, 1, 1, 1, 1, 1,
-1.915128, -0.08645982, -1.821071, 1, 1, 1, 1, 1,
-1.913898, 0.5870364, 0.7900487, 1, 1, 1, 1, 1,
-1.908057, 0.5223792, -3.725097, 1, 1, 1, 1, 1,
-1.903232, -0.04754678, -1.524878, 1, 1, 1, 1, 1,
-1.89374, 1.321705, -0.7375014, 1, 1, 1, 1, 1,
-1.875605, -0.4513096, -3.058106, 1, 1, 1, 1, 1,
-1.870277, 0.5936056, 1.492192, 1, 1, 1, 1, 1,
-1.844666, -0.5389207, -2.344301, 1, 1, 1, 1, 1,
-1.835543, 0.4358534, -0.6239343, 1, 1, 1, 1, 1,
-1.821529, 0.2581703, -1.216292, 1, 1, 1, 1, 1,
-1.785421, 0.2311642, 0.1415663, 1, 1, 1, 1, 1,
-1.776803, -1.093866, -1.219919, 1, 1, 1, 1, 1,
-1.773455, -0.2800831, -0.4815908, 1, 1, 1, 1, 1,
-1.761112, 1.328823, -0.6722834, 0, 0, 1, 1, 1,
-1.752711, -1.193724, -1.966442, 1, 0, 0, 1, 1,
-1.746996, -0.6561722, -2.987403, 1, 0, 0, 1, 1,
-1.735178, -0.1510766, -3.004212, 1, 0, 0, 1, 1,
-1.731034, 0.05177025, -2.61747, 1, 0, 0, 1, 1,
-1.69941, 0.7955049, -1.916692, 1, 0, 0, 1, 1,
-1.688382, 0.6009418, -0.1903567, 0, 0, 0, 1, 1,
-1.671743, 1.002761, -2.511337, 0, 0, 0, 1, 1,
-1.661697, 0.3770381, -0.976479, 0, 0, 0, 1, 1,
-1.649659, 1.115629, -0.9638985, 0, 0, 0, 1, 1,
-1.645253, 1.391733, -1.994971, 0, 0, 0, 1, 1,
-1.629566, 0.7309761, -2.10345, 0, 0, 0, 1, 1,
-1.624849, 1.04803, -2.309633, 0, 0, 0, 1, 1,
-1.599719, 1.280394, -0.5922837, 1, 1, 1, 1, 1,
-1.587292, 0.6898198, -2.077901, 1, 1, 1, 1, 1,
-1.576004, 0.5547545, -2.534606, 1, 1, 1, 1, 1,
-1.570132, -0.66632, -1.300289, 1, 1, 1, 1, 1,
-1.568408, 1.930856, 0.3647185, 1, 1, 1, 1, 1,
-1.563666, 1.632943, -1.491759, 1, 1, 1, 1, 1,
-1.561068, 1.299865, 0.7799689, 1, 1, 1, 1, 1,
-1.548903, 0.04282965, -1.45075, 1, 1, 1, 1, 1,
-1.544605, -0.3605753, -2.341612, 1, 1, 1, 1, 1,
-1.525603, 0.3172452, -0.9958887, 1, 1, 1, 1, 1,
-1.525096, -0.5092331, -1.32703, 1, 1, 1, 1, 1,
-1.522033, -0.6781821, -0.8506288, 1, 1, 1, 1, 1,
-1.497069, -0.6102936, -3.520982, 1, 1, 1, 1, 1,
-1.493377, 1.099735, 0.06105707, 1, 1, 1, 1, 1,
-1.489201, 1.852021, -0.8945045, 1, 1, 1, 1, 1,
-1.485629, 1.484309, -0.4199153, 0, 0, 1, 1, 1,
-1.483905, 1.669054, -0.560478, 1, 0, 0, 1, 1,
-1.481179, -0.09756194, -1.840153, 1, 0, 0, 1, 1,
-1.468716, 1.728825, -0.576355, 1, 0, 0, 1, 1,
-1.466899, -0.8789934, -3.327356, 1, 0, 0, 1, 1,
-1.466136, -0.7625415, -2.119518, 1, 0, 0, 1, 1,
-1.461962, 0.3442865, -0.3901373, 0, 0, 0, 1, 1,
-1.459903, -1.11123, -3.723223, 0, 0, 0, 1, 1,
-1.44558, -0.3890568, -2.858567, 0, 0, 0, 1, 1,
-1.443186, 0.8391091, -1.442938, 0, 0, 0, 1, 1,
-1.44137, 1.102815, -0.4669171, 0, 0, 0, 1, 1,
-1.441177, 0.5605898, -0.6552836, 0, 0, 0, 1, 1,
-1.431573, -1.079, -2.067147, 0, 0, 0, 1, 1,
-1.423424, -0.342795, -1.767652, 1, 1, 1, 1, 1,
-1.422868, -1.05146, -4.430512, 1, 1, 1, 1, 1,
-1.413112, 0.4151142, -3.310003, 1, 1, 1, 1, 1,
-1.406262, -0.7602601, -1.097077, 1, 1, 1, 1, 1,
-1.401728, 0.7542675, -1.459678, 1, 1, 1, 1, 1,
-1.400233, -0.269848, -1.180195, 1, 1, 1, 1, 1,
-1.396218, 0.7880927, -2.235963, 1, 1, 1, 1, 1,
-1.393399, 0.4229722, -0.01230843, 1, 1, 1, 1, 1,
-1.389034, 1.400703, -0.4023966, 1, 1, 1, 1, 1,
-1.388182, 0.1471111, -1.942115, 1, 1, 1, 1, 1,
-1.379002, -0.7023098, -1.432556, 1, 1, 1, 1, 1,
-1.378308, 1.670454, -1.095811, 1, 1, 1, 1, 1,
-1.377344, 0.04257344, -1.744986, 1, 1, 1, 1, 1,
-1.371174, 0.001619055, -0.1161489, 1, 1, 1, 1, 1,
-1.340947, -0.8666664, -3.685354, 1, 1, 1, 1, 1,
-1.340099, 0.6009145, -2.114595, 0, 0, 1, 1, 1,
-1.333046, -1.213033, -3.646013, 1, 0, 0, 1, 1,
-1.330863, -1.955595, -0.562293, 1, 0, 0, 1, 1,
-1.327114, 0.3708007, -0.555146, 1, 0, 0, 1, 1,
-1.325362, -0.2755203, -1.314856, 1, 0, 0, 1, 1,
-1.320861, 1.019669, -1.073521, 1, 0, 0, 1, 1,
-1.312996, -0.09171181, -1.320026, 0, 0, 0, 1, 1,
-1.308447, -0.07092687, -0.9644937, 0, 0, 0, 1, 1,
-1.307148, -0.6114054, -1.501398, 0, 0, 0, 1, 1,
-1.305649, -0.8359948, -3.418186, 0, 0, 0, 1, 1,
-1.305576, -1.958461, -0.6495122, 0, 0, 0, 1, 1,
-1.304106, 0.05411953, -2.571525, 0, 0, 0, 1, 1,
-1.279472, 0.7302694, -0.2731684, 0, 0, 0, 1, 1,
-1.27844, -0.9322753, -2.149144, 1, 1, 1, 1, 1,
-1.273384, 0.8279747, -0.4991005, 1, 1, 1, 1, 1,
-1.26697, 0.5193444, -1.678283, 1, 1, 1, 1, 1,
-1.26365, -0.7138745, -4.244104, 1, 1, 1, 1, 1,
-1.261971, 0.4405249, -1.02525, 1, 1, 1, 1, 1,
-1.256745, -0.07997639, -0.1673063, 1, 1, 1, 1, 1,
-1.249316, 0.482276, -0.2145673, 1, 1, 1, 1, 1,
-1.248864, -1.870849, -2.341671, 1, 1, 1, 1, 1,
-1.244085, 0.9869545, -2.193997, 1, 1, 1, 1, 1,
-1.243731, 0.2655408, -1.111833, 1, 1, 1, 1, 1,
-1.24334, -0.08843449, -3.027439, 1, 1, 1, 1, 1,
-1.242276, -0.3517293, -2.841144, 1, 1, 1, 1, 1,
-1.236262, 0.3179457, -2.552842, 1, 1, 1, 1, 1,
-1.230073, -0.4424056, -2.551192, 1, 1, 1, 1, 1,
-1.225858, 0.2229888, -1.416701, 1, 1, 1, 1, 1,
-1.218574, 0.7437425, -1.675016, 0, 0, 1, 1, 1,
-1.21591, -0.1844481, 0.07189246, 1, 0, 0, 1, 1,
-1.214759, 0.02041855, -2.253456, 1, 0, 0, 1, 1,
-1.20639, -0.06058849, -1.771847, 1, 0, 0, 1, 1,
-1.204895, 1.063041, 0.4687432, 1, 0, 0, 1, 1,
-1.194875, -0.7079598, -1.313805, 1, 0, 0, 1, 1,
-1.192168, 0.09982757, -1.054281, 0, 0, 0, 1, 1,
-1.191802, 0.9278786, 0.5378345, 0, 0, 0, 1, 1,
-1.182105, 2.181077, 0.1153454, 0, 0, 0, 1, 1,
-1.180849, 0.3796019, -0.6122468, 0, 0, 0, 1, 1,
-1.180611, -1.319016, -2.557906, 0, 0, 0, 1, 1,
-1.168787, 0.5652819, -1.54286, 0, 0, 0, 1, 1,
-1.167224, 0.9301301, -0.4128611, 0, 0, 0, 1, 1,
-1.164939, -0.4639614, -1.745325, 1, 1, 1, 1, 1,
-1.159304, 2.337861, -2.62446, 1, 1, 1, 1, 1,
-1.158303, 0.3466695, -1.395477, 1, 1, 1, 1, 1,
-1.158129, -0.1153535, -0.3611076, 1, 1, 1, 1, 1,
-1.156152, 1.238346, -1.94141, 1, 1, 1, 1, 1,
-1.15088, 1.119274, -0.1656048, 1, 1, 1, 1, 1,
-1.147408, 1.477599, -2.409339, 1, 1, 1, 1, 1,
-1.146997, -0.08306162, -0.9926865, 1, 1, 1, 1, 1,
-1.142386, -0.6680657, -2.930165, 1, 1, 1, 1, 1,
-1.137193, 2.098562, -1.27587, 1, 1, 1, 1, 1,
-1.137131, -1.132231, -2.740874, 1, 1, 1, 1, 1,
-1.109498, -2.529806, -2.730367, 1, 1, 1, 1, 1,
-1.098206, -1.543488, -1.985393, 1, 1, 1, 1, 1,
-1.097932, -0.225173, -0.4066273, 1, 1, 1, 1, 1,
-1.097598, -1.016096, -0.6857479, 1, 1, 1, 1, 1,
-1.095359, 0.645018, -0.2693994, 0, 0, 1, 1, 1,
-1.088819, 2.147324, -0.846666, 1, 0, 0, 1, 1,
-1.087812, -0.7609666, -2.508531, 1, 0, 0, 1, 1,
-1.087649, 0.5397052, -0.425871, 1, 0, 0, 1, 1,
-1.085157, 1.193628, -1.498923, 1, 0, 0, 1, 1,
-1.084712, 0.334838, 0.2027381, 1, 0, 0, 1, 1,
-1.083609, -1.018028, -3.308035, 0, 0, 0, 1, 1,
-1.083379, 2.481832, -2.947014, 0, 0, 0, 1, 1,
-1.078349, -0.03669604, -1.291443, 0, 0, 0, 1, 1,
-1.060191, 0.4252698, -2.19189, 0, 0, 0, 1, 1,
-1.058061, -1.070263, -0.5185117, 0, 0, 0, 1, 1,
-1.056172, -0.1318111, -0.641652, 0, 0, 0, 1, 1,
-1.047894, 0.5411843, -2.077915, 0, 0, 0, 1, 1,
-1.042081, 0.9120122, -2.997399, 1, 1, 1, 1, 1,
-1.039085, 1.587582, -0.009454685, 1, 1, 1, 1, 1,
-1.031963, -0.2130238, -1.234771, 1, 1, 1, 1, 1,
-1.030675, -0.8686848, -2.698996, 1, 1, 1, 1, 1,
-1.029528, -0.05898122, -1.679608, 1, 1, 1, 1, 1,
-1.022159, -0.2015895, 0.478276, 1, 1, 1, 1, 1,
-1.022147, -0.1092497, -1.692052, 1, 1, 1, 1, 1,
-1.016285, -0.081451, 0.4456985, 1, 1, 1, 1, 1,
-1.011459, 0.01981597, -1.358546, 1, 1, 1, 1, 1,
-1.008645, -0.7975183, -3.656543, 1, 1, 1, 1, 1,
-1.008232, 0.6399567, -0.9430609, 1, 1, 1, 1, 1,
-1.003723, 0.6382732, -3.385054, 1, 1, 1, 1, 1,
-0.9976409, 1.151369, 0.02816278, 1, 1, 1, 1, 1,
-0.9922476, -0.8051671, -1.779433, 1, 1, 1, 1, 1,
-0.9919432, -1.540841, -2.30776, 1, 1, 1, 1, 1,
-0.9885628, -0.3350602, -1.788382, 0, 0, 1, 1, 1,
-0.9858247, 0.1475758, 0.2366124, 1, 0, 0, 1, 1,
-0.9848031, 0.9175234, -0.2039795, 1, 0, 0, 1, 1,
-0.9843232, -1.098122, -3.628828, 1, 0, 0, 1, 1,
-0.9762685, 1.813813, -1.250367, 1, 0, 0, 1, 1,
-0.9707552, 1.071284, -0.3136064, 1, 0, 0, 1, 1,
-0.9620256, 0.9618213, 0.8112463, 0, 0, 0, 1, 1,
-0.9619559, -1.636622, -2.47574, 0, 0, 0, 1, 1,
-0.9593477, 0.645171, -0.5612848, 0, 0, 0, 1, 1,
-0.9561625, -0.2904328, -2.140791, 0, 0, 0, 1, 1,
-0.951948, 0.2703178, -3.957303, 0, 0, 0, 1, 1,
-0.95144, -0.6350796, -2.942436, 0, 0, 0, 1, 1,
-0.9453548, -0.9827228, -1.968329, 0, 0, 0, 1, 1,
-0.9399217, 0.6892809, -0.1790306, 1, 1, 1, 1, 1,
-0.9396531, -0.555512, -1.491838, 1, 1, 1, 1, 1,
-0.9256365, 1.222654, -2.024175, 1, 1, 1, 1, 1,
-0.917699, 0.1064458, -0.8199034, 1, 1, 1, 1, 1,
-0.9165347, -0.6729171, -2.155113, 1, 1, 1, 1, 1,
-0.9144585, 0.5596091, -1.42839, 1, 1, 1, 1, 1,
-0.9052208, -2.227313, -2.967528, 1, 1, 1, 1, 1,
-0.9024414, -1.578416, -4.66844, 1, 1, 1, 1, 1,
-0.8943244, -2.028122, -4.476257, 1, 1, 1, 1, 1,
-0.8924292, -1.428423, -2.071753, 1, 1, 1, 1, 1,
-0.8820573, 0.3677529, -1.37663, 1, 1, 1, 1, 1,
-0.8810118, 0.1869826, -2.388364, 1, 1, 1, 1, 1,
-0.8805597, 0.7066167, -1.993903, 1, 1, 1, 1, 1,
-0.8766354, 0.02958155, -0.8582247, 1, 1, 1, 1, 1,
-0.8764874, -2.039201, -2.738146, 1, 1, 1, 1, 1,
-0.8763499, -0.008922683, -2.223175, 0, 0, 1, 1, 1,
-0.8678573, -0.09843691, -2.845934, 1, 0, 0, 1, 1,
-0.8634157, -1.021039, -1.851561, 1, 0, 0, 1, 1,
-0.8585989, 0.3278616, 0.2591377, 1, 0, 0, 1, 1,
-0.85217, 0.1384316, -1.544807, 1, 0, 0, 1, 1,
-0.8508304, 0.6938062, -2.430511, 1, 0, 0, 1, 1,
-0.8493726, 1.766529, -0.6567018, 0, 0, 0, 1, 1,
-0.8429832, 0.2102663, -0.3391676, 0, 0, 0, 1, 1,
-0.8409881, 0.1704841, 0.3726012, 0, 0, 0, 1, 1,
-0.8375511, 0.6806359, 0.3295845, 0, 0, 0, 1, 1,
-0.8305364, 0.4792551, -1.901985, 0, 0, 0, 1, 1,
-0.8280832, 1.766704, 0.1299403, 0, 0, 0, 1, 1,
-0.82348, 1.371747, -0.1969671, 0, 0, 0, 1, 1,
-0.8220088, -0.6515852, -3.034431, 1, 1, 1, 1, 1,
-0.8200765, -0.381441, -2.983022, 1, 1, 1, 1, 1,
-0.8192781, -1.359973, -2.969658, 1, 1, 1, 1, 1,
-0.8167788, -0.6331947, -3.745841, 1, 1, 1, 1, 1,
-0.8097256, 0.001239358, -2.061718, 1, 1, 1, 1, 1,
-0.8096904, -2.261896, -2.824168, 1, 1, 1, 1, 1,
-0.8064542, 1.773544, -0.7200741, 1, 1, 1, 1, 1,
-0.8064118, -0.5513478, -2.442584, 1, 1, 1, 1, 1,
-0.8006411, 0.2547634, -0.5176966, 1, 1, 1, 1, 1,
-0.7996964, 1.511548, 0.4635304, 1, 1, 1, 1, 1,
-0.7993187, -0.7890533, -1.180802, 1, 1, 1, 1, 1,
-0.7989474, 0.7079455, -0.6708362, 1, 1, 1, 1, 1,
-0.7983533, 0.1696325, -4.126977, 1, 1, 1, 1, 1,
-0.7943621, -0.004904067, -0.3435684, 1, 1, 1, 1, 1,
-0.7905651, -0.2545856, -2.204079, 1, 1, 1, 1, 1,
-0.7876963, -0.941297, -3.196905, 0, 0, 1, 1, 1,
-0.7838684, -1.413421, -2.842494, 1, 0, 0, 1, 1,
-0.7817907, 1.123642, -2.471566, 1, 0, 0, 1, 1,
-0.7814679, -0.7313991, -1.72148, 1, 0, 0, 1, 1,
-0.7758446, -1.17473, -5.584621, 1, 0, 0, 1, 1,
-0.7733022, -0.6957005, -0.8957638, 1, 0, 0, 1, 1,
-0.7700747, -0.8579304, -3.341384, 0, 0, 0, 1, 1,
-0.759469, 1.518146, -0.06368165, 0, 0, 0, 1, 1,
-0.7580215, 0.02932213, -3.296053, 0, 0, 0, 1, 1,
-0.7560641, 1.598927, -1.395592, 0, 0, 0, 1, 1,
-0.7559587, 1.166194, -1.146876, 0, 0, 0, 1, 1,
-0.7542558, -0.5948544, -2.278232, 0, 0, 0, 1, 1,
-0.7512352, 0.342412, -0.3342133, 0, 0, 0, 1, 1,
-0.7506068, 1.108896, -0.4963673, 1, 1, 1, 1, 1,
-0.7468721, -0.1895612, 0.1931761, 1, 1, 1, 1, 1,
-0.7450473, -0.2640018, -3.077215, 1, 1, 1, 1, 1,
-0.7372261, -0.4819414, -2.1607, 1, 1, 1, 1, 1,
-0.7367994, -0.03720814, -0.3089341, 1, 1, 1, 1, 1,
-0.729988, 0.2528825, -2.163953, 1, 1, 1, 1, 1,
-0.729569, 0.4957859, -1.689566, 1, 1, 1, 1, 1,
-0.7258901, 0.7655216, -0.4120817, 1, 1, 1, 1, 1,
-0.7222967, 0.7289254, -1.128749, 1, 1, 1, 1, 1,
-0.7217021, -0.7602638, -1.105201, 1, 1, 1, 1, 1,
-0.7194461, -1.382114, -0.7173511, 1, 1, 1, 1, 1,
-0.7170355, 0.1408833, -1.984807, 1, 1, 1, 1, 1,
-0.7128425, -0.8416792, -0.9637892, 1, 1, 1, 1, 1,
-0.7107621, 0.7332067, -1.349366, 1, 1, 1, 1, 1,
-0.7093056, 0.7252577, -1.015113, 1, 1, 1, 1, 1,
-0.7069091, 0.5834936, -1.821727, 0, 0, 1, 1, 1,
-0.7026351, -1.390617, -3.313531, 1, 0, 0, 1, 1,
-0.7013013, 1.235364, -2.158895, 1, 0, 0, 1, 1,
-0.7001532, -0.3162176, -1.462548, 1, 0, 0, 1, 1,
-0.6998034, 0.9181767, -0.673129, 1, 0, 0, 1, 1,
-0.6971082, 0.15609, -0.1070904, 1, 0, 0, 1, 1,
-0.6852573, -2.017448, -3.630353, 0, 0, 0, 1, 1,
-0.6808028, -1.657825, -3.957185, 0, 0, 0, 1, 1,
-0.67483, 0.7114715, -1.02538, 0, 0, 0, 1, 1,
-0.6747218, 0.2679104, -3.681536, 0, 0, 0, 1, 1,
-0.6721025, -0.463756, -1.13653, 0, 0, 0, 1, 1,
-0.6699837, -1.301385, -3.12396, 0, 0, 0, 1, 1,
-0.6641293, 0.4909975, 0.08989077, 0, 0, 0, 1, 1,
-0.6638744, -0.657654, -2.861316, 1, 1, 1, 1, 1,
-0.6608737, -0.1907638, -2.496361, 1, 1, 1, 1, 1,
-0.6599184, 0.9268963, -0.8696147, 1, 1, 1, 1, 1,
-0.6576917, -0.2532645, -3.101388, 1, 1, 1, 1, 1,
-0.6447034, 0.6547608, -0.3217878, 1, 1, 1, 1, 1,
-0.6429542, 0.4432791, 0.6346238, 1, 1, 1, 1, 1,
-0.6396576, -0.9638078, -1.871101, 1, 1, 1, 1, 1,
-0.6383089, 0.2648773, 0.5606887, 1, 1, 1, 1, 1,
-0.6363175, -1.735991, -2.175275, 1, 1, 1, 1, 1,
-0.6358283, -0.08592942, -1.101086, 1, 1, 1, 1, 1,
-0.6266908, 0.01622638, -2.833332, 1, 1, 1, 1, 1,
-0.6253017, 0.9988352, -1.402121, 1, 1, 1, 1, 1,
-0.6162106, 0.9348565, 0.6093469, 1, 1, 1, 1, 1,
-0.6073186, 0.0008111866, 0.60883, 1, 1, 1, 1, 1,
-0.6063681, -0.7036846, -1.51815, 1, 1, 1, 1, 1,
-0.6043234, 1.146923, 0.6122928, 0, 0, 1, 1, 1,
-0.6031988, 0.9678676, 1.024904, 1, 0, 0, 1, 1,
-0.5974348, -1.541956, -2.467102, 1, 0, 0, 1, 1,
-0.5956575, 0.01134635, -2.679137, 1, 0, 0, 1, 1,
-0.5900924, -0.6798642, -2.589528, 1, 0, 0, 1, 1,
-0.5855914, -0.6055797, -1.934952, 1, 0, 0, 1, 1,
-0.5836824, -0.3153811, -1.724857, 0, 0, 0, 1, 1,
-0.5822341, -1.914955, -0.8507732, 0, 0, 0, 1, 1,
-0.5794006, 0.9467379, -1.258034, 0, 0, 0, 1, 1,
-0.5782422, -0.04953138, -1.500486, 0, 0, 0, 1, 1,
-0.577411, -0.4628164, -4.094129, 0, 0, 0, 1, 1,
-0.5771922, -0.9996492, -3.438264, 0, 0, 0, 1, 1,
-0.5754113, -0.5749509, -3.76453, 0, 0, 0, 1, 1,
-0.5712072, 1.382217, 1.648675, 1, 1, 1, 1, 1,
-0.5694586, 0.2805772, -1.362227, 1, 1, 1, 1, 1,
-0.5656659, 0.4939916, -1.223426, 1, 1, 1, 1, 1,
-0.5573725, -0.4569922, -2.614234, 1, 1, 1, 1, 1,
-0.5567871, 0.3584805, -1.390906, 1, 1, 1, 1, 1,
-0.553345, 0.5032895, -0.02350186, 1, 1, 1, 1, 1,
-0.550709, 1.93451, -0.5098142, 1, 1, 1, 1, 1,
-0.5456448, -1.075009, -3.234121, 1, 1, 1, 1, 1,
-0.5437896, 0.6518552, -0.00452929, 1, 1, 1, 1, 1,
-0.5302523, 1.251583, -1.207268, 1, 1, 1, 1, 1,
-0.5257215, -0.09438219, -2.65697, 1, 1, 1, 1, 1,
-0.5178231, 0.6028124, -0.9565939, 1, 1, 1, 1, 1,
-0.5170741, 1.08811, 0.5279464, 1, 1, 1, 1, 1,
-0.5134997, -0.0855244, -2.107261, 1, 1, 1, 1, 1,
-0.5130811, -0.2882648, -2.298297, 1, 1, 1, 1, 1,
-0.5109797, -0.8617204, -2.837687, 0, 0, 1, 1, 1,
-0.5106433, -0.9343329, -2.812553, 1, 0, 0, 1, 1,
-0.4950172, 0.3774532, -1.838697, 1, 0, 0, 1, 1,
-0.4948069, 1.177853, 0.09804754, 1, 0, 0, 1, 1,
-0.4884854, -1.765316, -3.399595, 1, 0, 0, 1, 1,
-0.4875245, -2.302392, -2.648208, 1, 0, 0, 1, 1,
-0.4870783, 0.5856873, -0.5461872, 0, 0, 0, 1, 1,
-0.4828893, -0.9025285, -1.656328, 0, 0, 0, 1, 1,
-0.4817368, 0.1380133, -0.0778764, 0, 0, 0, 1, 1,
-0.481572, 1.230793, 0.01925179, 0, 0, 0, 1, 1,
-0.4802836, -0.1264141, -0.912189, 0, 0, 0, 1, 1,
-0.4767258, 0.7401571, -0.9514673, 0, 0, 0, 1, 1,
-0.4725185, 0.3478931, -2.44141, 0, 0, 0, 1, 1,
-0.4696986, -0.5780242, -2.176345, 1, 1, 1, 1, 1,
-0.4606366, -1.570477, -1.817631, 1, 1, 1, 1, 1,
-0.4566996, 0.4590887, -2.517509, 1, 1, 1, 1, 1,
-0.4537171, -1.695895, -1.918275, 1, 1, 1, 1, 1,
-0.4531682, -0.4044769, -1.023201, 1, 1, 1, 1, 1,
-0.4517075, -0.01448707, 0.4833986, 1, 1, 1, 1, 1,
-0.4509644, 0.04629308, -3.148847, 1, 1, 1, 1, 1,
-0.4506882, -1.496301, -3.314989, 1, 1, 1, 1, 1,
-0.4486468, 1.302435, -2.149362, 1, 1, 1, 1, 1,
-0.4404896, 0.5944559, -0.6240255, 1, 1, 1, 1, 1,
-0.4393971, -2.562294, -3.182533, 1, 1, 1, 1, 1,
-0.4391475, 0.7595809, 0.4839868, 1, 1, 1, 1, 1,
-0.4351232, -0.6723023, -2.49473, 1, 1, 1, 1, 1,
-0.4341597, -0.6732462, -3.655006, 1, 1, 1, 1, 1,
-0.4332421, -1.007038, -3.357296, 1, 1, 1, 1, 1,
-0.4265875, 3.588232, 0.3734839, 0, 0, 1, 1, 1,
-0.4259216, -0.5989525, -1.793868, 1, 0, 0, 1, 1,
-0.4164026, -0.9639375, -2.96154, 1, 0, 0, 1, 1,
-0.415356, 1.04366, -0.8353581, 1, 0, 0, 1, 1,
-0.4126821, 0.3800964, -0.3095709, 1, 0, 0, 1, 1,
-0.4056382, 1.860794, 0.3200179, 1, 0, 0, 1, 1,
-0.4041987, 1.772732, -0.20604, 0, 0, 0, 1, 1,
-0.4003175, -0.2127596, -3.187014, 0, 0, 0, 1, 1,
-0.4002926, 0.5784818, -2.005816, 0, 0, 0, 1, 1,
-0.3936369, -1.065399, -1.708997, 0, 0, 0, 1, 1,
-0.3931681, -2.26916, -3.732101, 0, 0, 0, 1, 1,
-0.3914374, -0.05258328, -1.612452, 0, 0, 0, 1, 1,
-0.386299, 0.04773407, -1.368867, 0, 0, 0, 1, 1,
-0.3859462, 0.7968519, 0.3683652, 1, 1, 1, 1, 1,
-0.3830803, 0.3329498, -0.5772116, 1, 1, 1, 1, 1,
-0.3823834, -0.9605967, -3.808294, 1, 1, 1, 1, 1,
-0.3777319, 1.528708, -0.589101, 1, 1, 1, 1, 1,
-0.3757542, 1.081949, -3.256817, 1, 1, 1, 1, 1,
-0.3634793, 0.9887195, -0.4987911, 1, 1, 1, 1, 1,
-0.3630981, 0.9652864, 0.5689245, 1, 1, 1, 1, 1,
-0.3582089, -0.2349639, -2.591125, 1, 1, 1, 1, 1,
-0.3580517, -0.01841829, -0.8098578, 1, 1, 1, 1, 1,
-0.3538348, 1.587004, -1.914443, 1, 1, 1, 1, 1,
-0.3516497, -0.1094938, -1.502548, 1, 1, 1, 1, 1,
-0.3494106, -0.7356731, -1.860215, 1, 1, 1, 1, 1,
-0.3453343, 0.6936129, -1.520319, 1, 1, 1, 1, 1,
-0.3417054, -1.972051, -4.294543, 1, 1, 1, 1, 1,
-0.3351343, 0.2500924, -1.451963, 1, 1, 1, 1, 1,
-0.3338116, -1.812529, -4.156635, 0, 0, 1, 1, 1,
-0.3314534, -0.4414429, -2.661716, 1, 0, 0, 1, 1,
-0.3298242, 0.9525029, -1.140167, 1, 0, 0, 1, 1,
-0.32721, 1.27777, -0.2280805, 1, 0, 0, 1, 1,
-0.3262173, -2.384242, -2.302343, 1, 0, 0, 1, 1,
-0.3226953, -0.1300906, -0.872745, 1, 0, 0, 1, 1,
-0.3214384, -0.9422779, -0.9786209, 0, 0, 0, 1, 1,
-0.3180476, -1.121312, -3.050759, 0, 0, 0, 1, 1,
-0.3178521, 0.07959737, 1.666271, 0, 0, 0, 1, 1,
-0.316072, 2.207705, 0.8143194, 0, 0, 0, 1, 1,
-0.3145599, -2.385369, -3.129863, 0, 0, 0, 1, 1,
-0.3131697, 0.9410931, -0.6889334, 0, 0, 0, 1, 1,
-0.3101803, -1.731684, -4.530507, 0, 0, 0, 1, 1,
-0.3068798, 0.7322319, 1.058605, 1, 1, 1, 1, 1,
-0.3050887, -1.898325, -3.410622, 1, 1, 1, 1, 1,
-0.3022887, -0.515357, -3.347569, 1, 1, 1, 1, 1,
-0.3012323, 0.7892818, -1.980448, 1, 1, 1, 1, 1,
-0.3008725, -0.5895708, -2.150334, 1, 1, 1, 1, 1,
-0.2963306, -0.6352623, -2.858095, 1, 1, 1, 1, 1,
-0.2943682, 2.569722, -0.2249872, 1, 1, 1, 1, 1,
-0.293232, -0.03886041, -0.494605, 1, 1, 1, 1, 1,
-0.2916487, 1.225885, -1.201703, 1, 1, 1, 1, 1,
-0.2870262, -0.5697184, -3.442271, 1, 1, 1, 1, 1,
-0.2851335, -0.925122, -5.044295, 1, 1, 1, 1, 1,
-0.2846749, -1.533408, -5.481316, 1, 1, 1, 1, 1,
-0.2796758, -0.03112563, -2.41622, 1, 1, 1, 1, 1,
-0.272676, -0.3404916, -3.203599, 1, 1, 1, 1, 1,
-0.2702858, 1.08381, 0.3284781, 1, 1, 1, 1, 1,
-0.2672455, 0.6316603, -0.1063929, 0, 0, 1, 1, 1,
-0.2571292, -0.7530829, -3.686904, 1, 0, 0, 1, 1,
-0.2571168, -1.370074, -3.310821, 1, 0, 0, 1, 1,
-0.2546489, 0.3306668, -1.308488, 1, 0, 0, 1, 1,
-0.2530342, -0.5100155, -1.759699, 1, 0, 0, 1, 1,
-0.2490357, -0.8367474, -2.29996, 1, 0, 0, 1, 1,
-0.2470177, -0.3175736, -3.691272, 0, 0, 0, 1, 1,
-0.2465593, 0.9143106, 0.4763672, 0, 0, 0, 1, 1,
-0.243603, 1.087353, 0.2709267, 0, 0, 0, 1, 1,
-0.2432325, -0.9457588, -3.040949, 0, 0, 0, 1, 1,
-0.2399336, 1.124921, -0.1664812, 0, 0, 0, 1, 1,
-0.2386249, -1.208391, -2.537789, 0, 0, 0, 1, 1,
-0.238318, 0.7175032, 1.373929, 0, 0, 0, 1, 1,
-0.23531, 0.8870036, -1.224379, 1, 1, 1, 1, 1,
-0.2345349, 1.370406, 0.7270389, 1, 1, 1, 1, 1,
-0.2339199, -0.7727302, -3.055482, 1, 1, 1, 1, 1,
-0.2137993, 1.296822, -0.4422868, 1, 1, 1, 1, 1,
-0.2114116, -0.006776786, -0.6497902, 1, 1, 1, 1, 1,
-0.2045495, 0.6122003, 1.01036, 1, 1, 1, 1, 1,
-0.2032894, 0.1362086, -0.6751257, 1, 1, 1, 1, 1,
-0.1895643, 1.635544, 0.5205223, 1, 1, 1, 1, 1,
-0.1880703, 0.6909081, -0.4081078, 1, 1, 1, 1, 1,
-0.1873292, -0.1668721, -1.777896, 1, 1, 1, 1, 1,
-0.1844258, -0.7586771, -1.79688, 1, 1, 1, 1, 1,
-0.1742258, -1.308984, -2.797212, 1, 1, 1, 1, 1,
-0.169995, -0.5202376, -2.997499, 1, 1, 1, 1, 1,
-0.1684479, -0.8706083, -1.664268, 1, 1, 1, 1, 1,
-0.1635818, -0.3822593, -3.580961, 1, 1, 1, 1, 1,
-0.1629556, -0.6867296, -4.106585, 0, 0, 1, 1, 1,
-0.162882, -1.204146, -4.08907, 1, 0, 0, 1, 1,
-0.1604135, -0.279633, -2.413119, 1, 0, 0, 1, 1,
-0.1516988, -2.111583, -4.282325, 1, 0, 0, 1, 1,
-0.149731, -0.001000229, -2.322159, 1, 0, 0, 1, 1,
-0.1452219, 1.458041, -0.1515963, 1, 0, 0, 1, 1,
-0.1430661, 2.001659, 1.491362, 0, 0, 0, 1, 1,
-0.1420326, -0.05389231, -1.680643, 0, 0, 0, 1, 1,
-0.1420288, 0.5803743, -0.2067882, 0, 0, 0, 1, 1,
-0.140883, 0.5567222, 0.2255873, 0, 0, 0, 1, 1,
-0.1402548, -1.095261, -3.068744, 0, 0, 0, 1, 1,
-0.1371911, 0.7343116, -0.4999768, 0, 0, 0, 1, 1,
-0.1344364, 0.1666434, -1.079578, 0, 0, 0, 1, 1,
-0.1338779, -2.225304, -2.715654, 1, 1, 1, 1, 1,
-0.1321912, -0.06506335, -2.461343, 1, 1, 1, 1, 1,
-0.1304121, -0.48811, -2.950143, 1, 1, 1, 1, 1,
-0.1270122, -1.534615, -1.742464, 1, 1, 1, 1, 1,
-0.1255331, -0.2938599, -5.055512, 1, 1, 1, 1, 1,
-0.1253736, 0.5384607, -0.7118028, 1, 1, 1, 1, 1,
-0.1195171, 0.6265881, -1.488938, 1, 1, 1, 1, 1,
-0.1142938, -2.267278, -3.258658, 1, 1, 1, 1, 1,
-0.1139766, 0.823292, -1.598855, 1, 1, 1, 1, 1,
-0.113518, -0.1879773, -3.229069, 1, 1, 1, 1, 1,
-0.1131201, -0.9762619, -5.416326, 1, 1, 1, 1, 1,
-0.1082431, 0.6151822, -0.5918806, 1, 1, 1, 1, 1,
-0.106546, 0.3413472, -0.787787, 1, 1, 1, 1, 1,
-0.1053805, 0.5623384, 0.4225472, 1, 1, 1, 1, 1,
-0.09945702, 0.6559055, 1.853163, 1, 1, 1, 1, 1,
-0.09864888, 0.9139634, 0.1711475, 0, 0, 1, 1, 1,
-0.0981827, -0.3978799, -3.689793, 1, 0, 0, 1, 1,
-0.09591798, 0.3105544, 0.9058988, 1, 0, 0, 1, 1,
-0.09452327, -1.113387, -3.897489, 1, 0, 0, 1, 1,
-0.09075958, 1.43017, -0.372972, 1, 0, 0, 1, 1,
-0.08901481, -0.2230658, -2.299032, 1, 0, 0, 1, 1,
-0.0889456, 0.3783742, -1.194433, 0, 0, 0, 1, 1,
-0.08876652, 1.203663, -0.2374589, 0, 0, 0, 1, 1,
-0.08437434, -0.9142045, -1.688045, 0, 0, 0, 1, 1,
-0.08338216, -0.1040002, -1.50057, 0, 0, 0, 1, 1,
-0.08128808, -1.260966, -0.6361986, 0, 0, 0, 1, 1,
-0.076989, 1.479736, 0.3582535, 0, 0, 0, 1, 1,
-0.06994809, -0.6641749, -3.327255, 0, 0, 0, 1, 1,
-0.06697165, -0.750056, -4.262963, 1, 1, 1, 1, 1,
-0.06640658, -1.402856, -2.050509, 1, 1, 1, 1, 1,
-0.0619128, 0.8751967, -1.069904, 1, 1, 1, 1, 1,
-0.05931823, -0.321229, -1.777408, 1, 1, 1, 1, 1,
-0.05627437, -0.7668953, -4.446826, 1, 1, 1, 1, 1,
-0.05431742, 0.837903, 0.4285137, 1, 1, 1, 1, 1,
-0.05396578, -1.309258, -1.359833, 1, 1, 1, 1, 1,
-0.05236443, 0.9427865, -0.1679493, 1, 1, 1, 1, 1,
-0.04958351, -0.9249648, -3.725417, 1, 1, 1, 1, 1,
-0.04954934, -1.311579, -0.8423204, 1, 1, 1, 1, 1,
-0.0423011, -2.251395, -2.472631, 1, 1, 1, 1, 1,
-0.04115988, 0.245011, -0.6549273, 1, 1, 1, 1, 1,
-0.04000503, 0.7350766, 0.5879752, 1, 1, 1, 1, 1,
-0.03466425, 1.557981, -1.439745, 1, 1, 1, 1, 1,
-0.03130907, 1.720463, -0.107594, 1, 1, 1, 1, 1,
-0.03027605, -1.362059, -1.394785, 0, 0, 1, 1, 1,
-0.02974859, -1.034787, -2.472806, 1, 0, 0, 1, 1,
-0.02645113, -0.00737782, -2.638079, 1, 0, 0, 1, 1,
-0.02379454, -0.7870448, -3.407454, 1, 0, 0, 1, 1,
-0.02278449, -0.8034035, -1.193851, 1, 0, 0, 1, 1,
-0.02182264, 2.680668, -0.1107354, 1, 0, 0, 1, 1,
-0.02162269, 0.09696487, 0.08424716, 0, 0, 0, 1, 1,
-0.02013753, 1.19635, 1.247451, 0, 0, 0, 1, 1,
-0.01621589, -1.041195, -2.461515, 0, 0, 0, 1, 1,
-0.01467689, -1.140206, -1.688276, 0, 0, 0, 1, 1,
-0.01025227, 0.04008109, 1.411028, 0, 0, 0, 1, 1,
-0.006751874, 0.3258284, -1.42441, 0, 0, 0, 1, 1,
-0.005701694, -3.000965, -2.445029, 0, 0, 0, 1, 1,
-0.004060862, 2.020733, 0.9054845, 1, 1, 1, 1, 1,
-0.003831111, -1.287259, -3.344048, 1, 1, 1, 1, 1,
0.003236052, 0.8706982, 0.802754, 1, 1, 1, 1, 1,
0.003595966, -0.7720044, 3.63155, 1, 1, 1, 1, 1,
0.003638885, 0.8254115, 1.27034, 1, 1, 1, 1, 1,
0.007169483, 0.5805284, 0.475956, 1, 1, 1, 1, 1,
0.008514634, -0.06961013, 4.522848, 1, 1, 1, 1, 1,
0.0100276, -0.4442607, 4.938118, 1, 1, 1, 1, 1,
0.01080473, -1.448101, 3.508912, 1, 1, 1, 1, 1,
0.01447274, -0.9826131, 5.087547, 1, 1, 1, 1, 1,
0.01511246, -1.411806, 1.544413, 1, 1, 1, 1, 1,
0.02134062, -0.043329, 4.325242, 1, 1, 1, 1, 1,
0.02171908, -0.1193583, 2.928829, 1, 1, 1, 1, 1,
0.03208848, -1.105602, 3.441932, 1, 1, 1, 1, 1,
0.03512871, 1.649588, 0.9644892, 1, 1, 1, 1, 1,
0.03528654, 0.3931663, -0.5087264, 0, 0, 1, 1, 1,
0.03621545, 1.364367, 0.9523632, 1, 0, 0, 1, 1,
0.03654417, 1.541283, -0.2728884, 1, 0, 0, 1, 1,
0.03933406, 0.1387069, 1.29367, 1, 0, 0, 1, 1,
0.04369213, 1.285565, 0.4044122, 1, 0, 0, 1, 1,
0.04375812, -0.7879664, 3.527992, 1, 0, 0, 1, 1,
0.04493974, -0.2883541, 2.996193, 0, 0, 0, 1, 1,
0.05679215, -0.07255239, 2.11656, 0, 0, 0, 1, 1,
0.05969825, -0.5545135, 1.190898, 0, 0, 0, 1, 1,
0.06069239, -0.5083368, 3.501281, 0, 0, 0, 1, 1,
0.06232615, -0.6096517, 5.25261, 0, 0, 0, 1, 1,
0.06326089, -0.4784951, 3.037044, 0, 0, 0, 1, 1,
0.06405713, 0.7118652, 0.929931, 0, 0, 0, 1, 1,
0.06497576, 0.7632869, 0.42899, 1, 1, 1, 1, 1,
0.06805457, -3.890701, 2.92596, 1, 1, 1, 1, 1,
0.07378963, 0.9642413, -0.8501599, 1, 1, 1, 1, 1,
0.07748549, -1.374478, 3.940291, 1, 1, 1, 1, 1,
0.08596021, -0.2790835, 2.078651, 1, 1, 1, 1, 1,
0.08829793, -0.02796374, 0.9524645, 1, 1, 1, 1, 1,
0.09008911, 1.453506, -1.259396, 1, 1, 1, 1, 1,
0.09221646, -0.4120981, 3.913505, 1, 1, 1, 1, 1,
0.09258493, -0.1784592, 2.140122, 1, 1, 1, 1, 1,
0.09328821, -0.308563, 0.6612851, 1, 1, 1, 1, 1,
0.09360278, 1.787869, -0.171948, 1, 1, 1, 1, 1,
0.09530676, 1.813762, -0.6490552, 1, 1, 1, 1, 1,
0.09611879, -0.3745369, 2.710494, 1, 1, 1, 1, 1,
0.1024794, 0.2312215, -0.2278585, 1, 1, 1, 1, 1,
0.1029394, -2.579208, 2.828316, 1, 1, 1, 1, 1,
0.1071091, 2.772881, -0.1641864, 0, 0, 1, 1, 1,
0.1106265, -0.5195355, 2.794409, 1, 0, 0, 1, 1,
0.1161243, -0.3727011, 1.996149, 1, 0, 0, 1, 1,
0.1183209, -1.804418, 3.504062, 1, 0, 0, 1, 1,
0.121379, 0.374201, -1.105463, 1, 0, 0, 1, 1,
0.1262458, 0.1621063, 0.5127306, 1, 0, 0, 1, 1,
0.133331, 1.488261, -0.3658125, 0, 0, 0, 1, 1,
0.1386405, 2.094309, -2.151394, 0, 0, 0, 1, 1,
0.1394602, 1.079751, -0.7507761, 0, 0, 0, 1, 1,
0.1419302, -0.5070009, 3.066525, 0, 0, 0, 1, 1,
0.1469773, 1.701861, 0.8850545, 0, 0, 0, 1, 1,
0.1485179, -0.6181217, 3.371845, 0, 0, 0, 1, 1,
0.1510096, -0.6789671, 3.382497, 0, 0, 0, 1, 1,
0.1556115, 0.730898, 0.8186436, 1, 1, 1, 1, 1,
0.1569265, -0.3232691, 4.203001, 1, 1, 1, 1, 1,
0.1585024, -0.5174178, 3.470416, 1, 1, 1, 1, 1,
0.1660847, 1.056862, 1.006773, 1, 1, 1, 1, 1,
0.1678725, -0.01427613, -0.4746971, 1, 1, 1, 1, 1,
0.1682594, -1.363156, 3.635125, 1, 1, 1, 1, 1,
0.1735157, 0.07632097, -0.360764, 1, 1, 1, 1, 1,
0.1777801, 0.198098, 1.330188, 1, 1, 1, 1, 1,
0.1787561, 0.8468161, -0.8765646, 1, 1, 1, 1, 1,
0.1835841, -1.207648, 3.659621, 1, 1, 1, 1, 1,
0.184558, 0.06326856, 0.7162382, 1, 1, 1, 1, 1,
0.1928815, -0.983282, 2.191756, 1, 1, 1, 1, 1,
0.193168, -1.102729, 2.094654, 1, 1, 1, 1, 1,
0.1938098, 0.8251004, -2.002964, 1, 1, 1, 1, 1,
0.194034, 0.03924843, 2.400146, 1, 1, 1, 1, 1,
0.1966174, -0.2048901, 3.327862, 0, 0, 1, 1, 1,
0.1988545, 0.608176, -2.349937, 1, 0, 0, 1, 1,
0.1991563, 1.368007, -0.9489941, 1, 0, 0, 1, 1,
0.2023225, 0.6609082, 1.010381, 1, 0, 0, 1, 1,
0.2053003, -2.125801, 1.781253, 1, 0, 0, 1, 1,
0.2087331, -0.469445, 2.170318, 1, 0, 0, 1, 1,
0.2092506, 0.1908221, -0.9888963, 0, 0, 0, 1, 1,
0.2096868, 0.156506, 0.8800017, 0, 0, 0, 1, 1,
0.2122293, -1.302145, 2.91003, 0, 0, 0, 1, 1,
0.2123421, -0.9649488, 2.608964, 0, 0, 0, 1, 1,
0.212601, 0.03612885, 1.315744, 0, 0, 0, 1, 1,
0.2135378, 0.5302024, 1.752083, 0, 0, 0, 1, 1,
0.2173163, 1.462045, 0.0324355, 0, 0, 0, 1, 1,
0.2178411, 0.2542157, -0.1819765, 1, 1, 1, 1, 1,
0.2227363, -0.2260796, 2.423975, 1, 1, 1, 1, 1,
0.2230177, -0.4914596, 4.60093, 1, 1, 1, 1, 1,
0.2270941, -1.316119, 5.450365, 1, 1, 1, 1, 1,
0.2289226, 2.195894, -1.270071, 1, 1, 1, 1, 1,
0.2298334, -0.2504179, 2.848144, 1, 1, 1, 1, 1,
0.2328839, 0.9390266, 0.1957718, 1, 1, 1, 1, 1,
0.2381988, -0.8544077, 1.255863, 1, 1, 1, 1, 1,
0.2402392, 0.3840562, -0.05223946, 1, 1, 1, 1, 1,
0.2405548, 0.114349, 1.444768, 1, 1, 1, 1, 1,
0.254329, 1.063062, 0.06657817, 1, 1, 1, 1, 1,
0.2551179, -0.466994, 3.489944, 1, 1, 1, 1, 1,
0.257884, 0.0133242, 2.161453, 1, 1, 1, 1, 1,
0.2640051, 0.8090125, 1.381064, 1, 1, 1, 1, 1,
0.2661723, -0.862392, 2.165666, 1, 1, 1, 1, 1,
0.2666826, -1.562679, 1.882422, 0, 0, 1, 1, 1,
0.2673315, -2.310951, 4.337777, 1, 0, 0, 1, 1,
0.2681717, 0.8676879, -0.1735525, 1, 0, 0, 1, 1,
0.2767525, 0.4589374, 0.6930183, 1, 0, 0, 1, 1,
0.2806249, -0.9088295, 2.594318, 1, 0, 0, 1, 1,
0.2852734, 0.4392347, -0.1775981, 1, 0, 0, 1, 1,
0.2855873, -2.089885, 2.822144, 0, 0, 0, 1, 1,
0.2868576, -0.2713735, 1.70069, 0, 0, 0, 1, 1,
0.2869624, 0.9184113, 0.6979203, 0, 0, 0, 1, 1,
0.2876164, -0.4975783, 0.9420565, 0, 0, 0, 1, 1,
0.2878945, 0.02794828, 1.543992, 0, 0, 0, 1, 1,
0.289047, -0.1412266, 1.248779, 0, 0, 0, 1, 1,
0.2929235, -0.4053981, 2.930405, 0, 0, 0, 1, 1,
0.2937157, -0.1078359, 3.354453, 1, 1, 1, 1, 1,
0.2953716, 0.06604464, 0.9654242, 1, 1, 1, 1, 1,
0.2953973, 0.31559, 0.5305864, 1, 1, 1, 1, 1,
0.296112, -0.7661498, 3.797781, 1, 1, 1, 1, 1,
0.2973882, 1.450235, 0.3503833, 1, 1, 1, 1, 1,
0.3001397, -1.658439, 2.451001, 1, 1, 1, 1, 1,
0.3007903, 0.1256678, -0.1026485, 1, 1, 1, 1, 1,
0.3042421, 0.2897179, 0.5857462, 1, 1, 1, 1, 1,
0.3093792, -0.201408, 1.415962, 1, 1, 1, 1, 1,
0.3098458, 0.05828917, 0.6348049, 1, 1, 1, 1, 1,
0.3119683, 0.8667395, 1.052857, 1, 1, 1, 1, 1,
0.3123514, 0.2636899, 2.552809, 1, 1, 1, 1, 1,
0.3153817, -0.6966042, 2.91631, 1, 1, 1, 1, 1,
0.3167297, -1.444826, 0.3370335, 1, 1, 1, 1, 1,
0.3168709, 1.874392, 1.09776, 1, 1, 1, 1, 1,
0.3197054, -0.4526763, 2.091353, 0, 0, 1, 1, 1,
0.320287, -1.290848, 3.366644, 1, 0, 0, 1, 1,
0.3206017, 1.347316, 0.5176229, 1, 0, 0, 1, 1,
0.3255079, -1.821078, 1.873118, 1, 0, 0, 1, 1,
0.3332961, 0.1391355, 0.2298177, 1, 0, 0, 1, 1,
0.3334345, 0.08777967, 0.8273972, 1, 0, 0, 1, 1,
0.3356633, -1.309488, 3.316749, 0, 0, 0, 1, 1,
0.3357155, 0.5564798, 0.168904, 0, 0, 0, 1, 1,
0.3378161, -0.4975415, 1.501894, 0, 0, 0, 1, 1,
0.3387353, -1.049352, 1.442929, 0, 0, 0, 1, 1,
0.3438697, 1.706817, -0.5518119, 0, 0, 0, 1, 1,
0.3494132, 0.402022, 0.274437, 0, 0, 0, 1, 1,
0.3523768, 1.122051, 2.368384, 0, 0, 0, 1, 1,
0.3567213, 0.9767209, 1.744017, 1, 1, 1, 1, 1,
0.3614869, -2.592059, 5.318064, 1, 1, 1, 1, 1,
0.3625195, -0.6517677, 2.943596, 1, 1, 1, 1, 1,
0.372317, 0.2391145, 1.931455, 1, 1, 1, 1, 1,
0.3740137, 1.840584, -0.6709525, 1, 1, 1, 1, 1,
0.3744751, 1.073085, 0.9745677, 1, 1, 1, 1, 1,
0.3755777, 0.05722933, 2.685799, 1, 1, 1, 1, 1,
0.3779972, 0.1420871, 2.24718, 1, 1, 1, 1, 1,
0.3793631, -1.313719, 4.198802, 1, 1, 1, 1, 1,
0.3804419, -1.608513, 2.995309, 1, 1, 1, 1, 1,
0.3813716, 1.374554, -0.7045379, 1, 1, 1, 1, 1,
0.3867985, -1.068036, 3.05486, 1, 1, 1, 1, 1,
0.3909646, 0.8827426, -1.267976, 1, 1, 1, 1, 1,
0.3995389, 0.818876, 1.587616, 1, 1, 1, 1, 1,
0.3998595, 0.009271208, 1.178791, 1, 1, 1, 1, 1,
0.4037805, 2.140963, -0.1155139, 0, 0, 1, 1, 1,
0.414226, 2.455033, -0.9178874, 1, 0, 0, 1, 1,
0.4143163, -0.4722333, 0.05213778, 1, 0, 0, 1, 1,
0.4155374, -0.1342867, 2.612287, 1, 0, 0, 1, 1,
0.4192494, -0.4510263, 0.6346027, 1, 0, 0, 1, 1,
0.4217159, 0.5486705, -0.7449248, 1, 0, 0, 1, 1,
0.4258626, 0.8895159, -1.292166, 0, 0, 0, 1, 1,
0.4283324, 1.437916, 0.2409662, 0, 0, 0, 1, 1,
0.4285974, -0.3421276, 2.345434, 0, 0, 0, 1, 1,
0.4327607, -1.397948, 2.757911, 0, 0, 0, 1, 1,
0.4400714, 0.6771241, 0.772029, 0, 0, 0, 1, 1,
0.4413615, 2.200539, 0.6486773, 0, 0, 0, 1, 1,
0.4417116, -0.5379032, 1.638935, 0, 0, 0, 1, 1,
0.4423836, -1.458036, 3.664111, 1, 1, 1, 1, 1,
0.4514484, -1.687955, 4.095996, 1, 1, 1, 1, 1,
0.4535893, 1.192723, -1.853788, 1, 1, 1, 1, 1,
0.4541193, -0.7300967, 1.389883, 1, 1, 1, 1, 1,
0.4607826, 1.120242, -0.08583781, 1, 1, 1, 1, 1,
0.462962, -1.61575, 0.8485935, 1, 1, 1, 1, 1,
0.4641735, 0.8653469, 2.15948, 1, 1, 1, 1, 1,
0.4644228, 0.5347701, -0.5788626, 1, 1, 1, 1, 1,
0.4649023, 0.3124836, 1.499579, 1, 1, 1, 1, 1,
0.4681293, -1.708994, 4.523771, 1, 1, 1, 1, 1,
0.4767005, 0.5357039, 1.617612, 1, 1, 1, 1, 1,
0.4774816, 0.07340711, 2.315206, 1, 1, 1, 1, 1,
0.4791845, 2.232986, 0.7974183, 1, 1, 1, 1, 1,
0.4796972, -0.1994201, 0.6165435, 1, 1, 1, 1, 1,
0.4816564, 1.724554, -1.102801, 1, 1, 1, 1, 1,
0.4851529, 0.6426882, 0.9503761, 0, 0, 1, 1, 1,
0.4856344, -0.4461187, 3.542558, 1, 0, 0, 1, 1,
0.4860297, 1.262044, 0.399148, 1, 0, 0, 1, 1,
0.4864296, -1.142469, 1.321969, 1, 0, 0, 1, 1,
0.4895073, -0.2491528, 2.740378, 1, 0, 0, 1, 1,
0.491491, 0.1165122, 1.373413, 1, 0, 0, 1, 1,
0.50051, 0.06278709, 2.345405, 0, 0, 0, 1, 1,
0.5021585, 1.541192, 1.048702, 0, 0, 0, 1, 1,
0.5085677, 0.9606378, 1.801101, 0, 0, 0, 1, 1,
0.5102974, 0.09425993, -0.6420547, 0, 0, 0, 1, 1,
0.5131229, 0.8247866, 1.051446, 0, 0, 0, 1, 1,
0.5191068, 0.3500197, 0.491182, 0, 0, 0, 1, 1,
0.5279502, -0.7851765, 2.711232, 0, 0, 0, 1, 1,
0.5295309, 0.3169171, 0.2752272, 1, 1, 1, 1, 1,
0.5295998, -0.8003975, 3.03925, 1, 1, 1, 1, 1,
0.5299969, -1.229556, 2.547291, 1, 1, 1, 1, 1,
0.5311292, 1.364308, 0.4378735, 1, 1, 1, 1, 1,
0.5330156, 1.796018, 0.06605127, 1, 1, 1, 1, 1,
0.5351682, -0.8779715, 3.368978, 1, 1, 1, 1, 1,
0.5359768, 0.8883822, -0.1829987, 1, 1, 1, 1, 1,
0.5401772, 0.2441538, 0.596646, 1, 1, 1, 1, 1,
0.5446259, -0.06300949, 2.382864, 1, 1, 1, 1, 1,
0.5490941, 0.1135801, 0.05169558, 1, 1, 1, 1, 1,
0.5612473, 1.179552, 1.478746, 1, 1, 1, 1, 1,
0.5634155, 0.6004831, 1.965976, 1, 1, 1, 1, 1,
0.5639412, -0.1076425, 2.947833, 1, 1, 1, 1, 1,
0.5639526, 0.4695663, 2.446356, 1, 1, 1, 1, 1,
0.5701231, -0.3447929, 1.648928, 1, 1, 1, 1, 1,
0.5741602, 0.1872458, 2.901196, 0, 0, 1, 1, 1,
0.5743672, -0.8394597, 3.273173, 1, 0, 0, 1, 1,
0.5784118, -0.7668187, 3.484786, 1, 0, 0, 1, 1,
0.5785266, -1.306313, 3.794752, 1, 0, 0, 1, 1,
0.5873687, -1.794825, 2.892075, 1, 0, 0, 1, 1,
0.5892616, -0.1839709, 1.459508, 1, 0, 0, 1, 1,
0.589443, 1.246789, -1.085853, 0, 0, 0, 1, 1,
0.5894446, 0.09651532, 0.4852248, 0, 0, 0, 1, 1,
0.5959111, -0.1956313, 0.2779844, 0, 0, 0, 1, 1,
0.596722, -0.6942098, 1.085142, 0, 0, 0, 1, 1,
0.5992367, 0.6509724, 0.1320659, 0, 0, 0, 1, 1,
0.5992891, -0.02492502, -0.3238893, 0, 0, 0, 1, 1,
0.6004514, -0.8986874, 3.717072, 0, 0, 0, 1, 1,
0.600901, 0.1134704, 0.8043699, 1, 1, 1, 1, 1,
0.6027424, 2.275244, 0.08436042, 1, 1, 1, 1, 1,
0.6046243, 1.102745, 1.29709, 1, 1, 1, 1, 1,
0.6056767, -1.699134, 1.993397, 1, 1, 1, 1, 1,
0.6059334, 0.9805768, 3.067683, 1, 1, 1, 1, 1,
0.6062325, -1.018122, 3.127579, 1, 1, 1, 1, 1,
0.6121571, 1.567077, 1.25143, 1, 1, 1, 1, 1,
0.6138121, -0.4987952, 2.260072, 1, 1, 1, 1, 1,
0.6146783, -0.1042039, 2.414068, 1, 1, 1, 1, 1,
0.617757, -1.147834, 3.377376, 1, 1, 1, 1, 1,
0.626153, -0.6376595, 2.375156, 1, 1, 1, 1, 1,
0.6264983, 0.3850568, -0.6100601, 1, 1, 1, 1, 1,
0.6268923, -0.6031312, 2.843034, 1, 1, 1, 1, 1,
0.6286104, -0.9509708, 0.8980364, 1, 1, 1, 1, 1,
0.6331505, -1.189733, 2.438107, 1, 1, 1, 1, 1,
0.6333839, 0.1478287, 0.7329338, 0, 0, 1, 1, 1,
0.6340213, -0.3737456, 0.9454575, 1, 0, 0, 1, 1,
0.6425792, 0.5921164, -0.05338188, 1, 0, 0, 1, 1,
0.6429461, -0.5762514, 1.299057, 1, 0, 0, 1, 1,
0.6473591, -0.8311805, 2.508867, 1, 0, 0, 1, 1,
0.6478401, 0.3416638, 0.2382296, 1, 0, 0, 1, 1,
0.6512908, 0.008586658, 1.756936, 0, 0, 0, 1, 1,
0.6605194, 1.138632, -0.5550171, 0, 0, 0, 1, 1,
0.6652414, 0.9016236, 1.025602, 0, 0, 0, 1, 1,
0.6678903, 1.511791, -1.272323, 0, 0, 0, 1, 1,
0.6749085, -0.6830544, 2.077052, 0, 0, 0, 1, 1,
0.6766442, 0.3302466, -0.1254217, 0, 0, 0, 1, 1,
0.6827662, 1.690459, -1.988854, 0, 0, 0, 1, 1,
0.6835085, 1.038497, -0.5677504, 1, 1, 1, 1, 1,
0.6841614, 0.1648801, 0.9660736, 1, 1, 1, 1, 1,
0.6863842, -0.5699751, 2.520487, 1, 1, 1, 1, 1,
0.6875398, 1.854444, 2.111771, 1, 1, 1, 1, 1,
0.687562, 0.4625335, 2.027328, 1, 1, 1, 1, 1,
0.6903154, 0.6368139, 1.041891, 1, 1, 1, 1, 1,
0.6907443, 0.3944862, 1.776456, 1, 1, 1, 1, 1,
0.6909731, -1.39533, 3.155946, 1, 1, 1, 1, 1,
0.6917982, -0.5621445, 2.728306, 1, 1, 1, 1, 1,
0.6956022, 1.246645, -0.3971753, 1, 1, 1, 1, 1,
0.6968283, 0.9650419, 1.532564, 1, 1, 1, 1, 1,
0.7054949, 2.017028, -0.798088, 1, 1, 1, 1, 1,
0.7069913, 0.473829, 1.001135, 1, 1, 1, 1, 1,
0.7086674, 0.04019402, 0.9013691, 1, 1, 1, 1, 1,
0.7088246, -1.538627, 2.114306, 1, 1, 1, 1, 1,
0.7093177, 0.8862597, 0.3514705, 0, 0, 1, 1, 1,
0.7119804, 0.4565115, 0.6892995, 1, 0, 0, 1, 1,
0.7172387, -0.7007201, 1.676402, 1, 0, 0, 1, 1,
0.7200416, -0.1455235, 2.270358, 1, 0, 0, 1, 1,
0.7275002, 1.061439, 1.197934, 1, 0, 0, 1, 1,
0.7283797, 0.868472, 2.426439, 1, 0, 0, 1, 1,
0.7288601, -0.3676838, 0.851204, 0, 0, 0, 1, 1,
0.7319567, 2.23436, 0.4542387, 0, 0, 0, 1, 1,
0.7427601, 0.4648013, 0.02048541, 0, 0, 0, 1, 1,
0.7465534, 0.6408044, -0.1908646, 0, 0, 0, 1, 1,
0.7506881, -2.107791, 2.470266, 0, 0, 0, 1, 1,
0.7522672, 0.1885629, 0.5329694, 0, 0, 0, 1, 1,
0.7549102, -3.436519, 3.922075, 0, 0, 0, 1, 1,
0.7556219, -0.5191779, 2.201512, 1, 1, 1, 1, 1,
0.7609702, 0.2614588, 1.910005, 1, 1, 1, 1, 1,
0.7621714, 0.3500871, 1.806588, 1, 1, 1, 1, 1,
0.7688419, 0.3062113, 0.3083966, 1, 1, 1, 1, 1,
0.7692415, -0.4474331, 2.68464, 1, 1, 1, 1, 1,
0.7693712, 0.07529327, -0.4393636, 1, 1, 1, 1, 1,
0.7735217, -0.01962279, 3.83573, 1, 1, 1, 1, 1,
0.7768871, -0.4951052, 0.8436899, 1, 1, 1, 1, 1,
0.7881231, -0.3699361, 1.524059, 1, 1, 1, 1, 1,
0.7884332, -1.305013, 2.339182, 1, 1, 1, 1, 1,
0.7900987, -0.8097844, 1.818873, 1, 1, 1, 1, 1,
0.7908343, -0.786275, 1.323306, 1, 1, 1, 1, 1,
0.7965983, 1.220908, 2.197163, 1, 1, 1, 1, 1,
0.7998705, 0.5396187, 0.8135081, 1, 1, 1, 1, 1,
0.8026753, 2.538747, -0.2737491, 1, 1, 1, 1, 1,
0.8078238, -0.2066227, 1.06831, 0, 0, 1, 1, 1,
0.8085405, 0.03040394, 2.823721, 1, 0, 0, 1, 1,
0.8173784, 1.22903, -1.916415, 1, 0, 0, 1, 1,
0.818423, -2.086071, 3.931172, 1, 0, 0, 1, 1,
0.8206985, 1.164008, 1.310258, 1, 0, 0, 1, 1,
0.8230296, -0.6670898, 0.8152382, 1, 0, 0, 1, 1,
0.8260849, 1.161826, 0.8604922, 0, 0, 0, 1, 1,
0.8261443, 0.1664005, 1.581608, 0, 0, 0, 1, 1,
0.8286278, -0.09033953, 2.577598, 0, 0, 0, 1, 1,
0.8293229, 0.7788049, 0.7276528, 0, 0, 0, 1, 1,
0.8318435, -0.1534236, 2.053032, 0, 0, 0, 1, 1,
0.8336459, 1.331304, -0.7896146, 0, 0, 0, 1, 1,
0.8368135, 1.978674, 1.064161, 0, 0, 0, 1, 1,
0.8411714, 0.5529199, 0.9479755, 1, 1, 1, 1, 1,
0.8426886, 0.160615, 0.3396557, 1, 1, 1, 1, 1,
0.8439209, 0.944366, 0.2242786, 1, 1, 1, 1, 1,
0.8447939, 0.8092358, -1.706836, 1, 1, 1, 1, 1,
0.8609931, 0.9878582, 1.15388, 1, 1, 1, 1, 1,
0.8703597, 0.2387565, 0.2300716, 1, 1, 1, 1, 1,
0.8860851, -0.457573, 4.318268, 1, 1, 1, 1, 1,
0.8894619, 1.025346, -0.2535152, 1, 1, 1, 1, 1,
0.8913597, 0.7498763, -0.1660922, 1, 1, 1, 1, 1,
0.9036211, 0.02706654, 2.702373, 1, 1, 1, 1, 1,
0.9038253, 0.1998789, -0.04479651, 1, 1, 1, 1, 1,
0.9045054, -0.4449411, 2.713995, 1, 1, 1, 1, 1,
0.9062802, 0.3619913, 0.8950061, 1, 1, 1, 1, 1,
0.9082005, -0.5149142, 3.007586, 1, 1, 1, 1, 1,
0.910292, -0.8326496, 1.561491, 1, 1, 1, 1, 1,
0.9154429, -0.2739403, 0.9162595, 0, 0, 1, 1, 1,
0.9185055, -0.3049081, 0.8155591, 1, 0, 0, 1, 1,
0.9222405, 0.447545, 0.995911, 1, 0, 0, 1, 1,
0.9237185, -0.8665708, 3.143394, 1, 0, 0, 1, 1,
0.9242696, 0.07366285, 1.998116, 1, 0, 0, 1, 1,
0.927299, -0.1766454, 2.444413, 1, 0, 0, 1, 1,
0.9330387, 0.358368, 0.950484, 0, 0, 0, 1, 1,
0.9408416, -0.6137561, 1.242229, 0, 0, 0, 1, 1,
0.9409567, 0.1970304, 3.938648, 0, 0, 0, 1, 1,
0.943924, -0.2324918, 3.057503, 0, 0, 0, 1, 1,
0.9445004, -0.5419412, 2.056996, 0, 0, 0, 1, 1,
0.9546744, -0.8900816, 4.103305, 0, 0, 0, 1, 1,
0.958602, -1.284695, 4.861557, 0, 0, 0, 1, 1,
0.9590548, -1.079492, 1.297101, 1, 1, 1, 1, 1,
0.9604697, 0.5529086, 0.533806, 1, 1, 1, 1, 1,
0.9790293, 1.152404, 1.630594, 1, 1, 1, 1, 1,
0.9799131, 0.1626423, 2.901835, 1, 1, 1, 1, 1,
0.9839492, 0.1802207, -0.08858482, 1, 1, 1, 1, 1,
0.9870046, 0.1228572, 2.371923, 1, 1, 1, 1, 1,
0.9953412, 0.9358798, -1.324653, 1, 1, 1, 1, 1,
0.9963921, 0.3650385, -1.064668, 1, 1, 1, 1, 1,
0.998154, 1.365954, 1.294048, 1, 1, 1, 1, 1,
1.001892, 0.8959785, 1.476352, 1, 1, 1, 1, 1,
1.002414, 1.654021, -0.5030836, 1, 1, 1, 1, 1,
1.008354, 3.547031, -0.08121208, 1, 1, 1, 1, 1,
1.014992, 0.280591, 2.325007, 1, 1, 1, 1, 1,
1.018321, 1.814557, -0.124077, 1, 1, 1, 1, 1,
1.022296, -0.0310783, 2.062686, 1, 1, 1, 1, 1,
1.0321, 0.7909601, 1.341408, 0, 0, 1, 1, 1,
1.039364, 0.7849697, 1.156851, 1, 0, 0, 1, 1,
1.0403, -0.3673659, 2.00479, 1, 0, 0, 1, 1,
1.04158, -0.5593346, 1.25887, 1, 0, 0, 1, 1,
1.043087, 0.5983855, 0.605863, 1, 0, 0, 1, 1,
1.045383, -1.229566, 1.880869, 1, 0, 0, 1, 1,
1.05091, 0.3103943, 0.8312688, 0, 0, 0, 1, 1,
1.051705, 0.760428, 1.782265, 0, 0, 0, 1, 1,
1.055344, -0.5322644, 2.872373, 0, 0, 0, 1, 1,
1.059692, 1.547087, 0.9869668, 0, 0, 0, 1, 1,
1.063667, -0.7966061, 2.580373, 0, 0, 0, 1, 1,
1.064434, 1.133401, 1.451472, 0, 0, 0, 1, 1,
1.065519, 0.6877891, 1.008928, 0, 0, 0, 1, 1,
1.066626, -0.1055849, 2.674442, 1, 1, 1, 1, 1,
1.066748, 0.2284646, 2.064372, 1, 1, 1, 1, 1,
1.075872, 0.5539195, 0.135685, 1, 1, 1, 1, 1,
1.078331, -0.4453415, 0.8058333, 1, 1, 1, 1, 1,
1.080774, -1.023461, 2.584518, 1, 1, 1, 1, 1,
1.083254, 1.084551, 1.327919, 1, 1, 1, 1, 1,
1.084329, -0.1118435, 2.514867, 1, 1, 1, 1, 1,
1.09251, 0.9809251, 0.997439, 1, 1, 1, 1, 1,
1.093028, -0.1721315, 1.397201, 1, 1, 1, 1, 1,
1.094372, -1.528852, 2.974964, 1, 1, 1, 1, 1,
1.108251, 0.7684077, 1.893731, 1, 1, 1, 1, 1,
1.110344, 1.391136, 0.7502588, 1, 1, 1, 1, 1,
1.116072, -1.47427, 2.42325, 1, 1, 1, 1, 1,
1.122728, -1.496573, 2.374289, 1, 1, 1, 1, 1,
1.123755, -1.204517, 2.401384, 1, 1, 1, 1, 1,
1.124876, -0.5071684, 3.050323, 0, 0, 1, 1, 1,
1.129562, 0.2101405, 0.740536, 1, 0, 0, 1, 1,
1.133472, 0.995414, 0.9106467, 1, 0, 0, 1, 1,
1.135126, 1.00042, 0.8136558, 1, 0, 0, 1, 1,
1.138307, -1.361154, 1.161156, 1, 0, 0, 1, 1,
1.149307, 1.028388, 2.130335, 1, 0, 0, 1, 1,
1.153857, 0.7869671, 1.010528, 0, 0, 0, 1, 1,
1.154093, -0.184983, 1.757801, 0, 0, 0, 1, 1,
1.157768, -1.445341, 1.285976, 0, 0, 0, 1, 1,
1.159674, 1.651037, 1.268576, 0, 0, 0, 1, 1,
1.161, 0.7479627, 0.07917115, 0, 0, 0, 1, 1,
1.17149, -0.04563864, 2.66536, 0, 0, 0, 1, 1,
1.177091, -0.07134652, 0.4862085, 0, 0, 0, 1, 1,
1.183949, -0.1992859, 1.867253, 1, 1, 1, 1, 1,
1.19718, -0.1677115, 1.339423, 1, 1, 1, 1, 1,
1.203565, -0.8931199, 1.97569, 1, 1, 1, 1, 1,
1.205471, 0.8828937, 1.074217, 1, 1, 1, 1, 1,
1.210634, -0.6606697, 2.400478, 1, 1, 1, 1, 1,
1.21064, 0.4073875, 0.2677928, 1, 1, 1, 1, 1,
1.222822, -0.5337382, 3.56794, 1, 1, 1, 1, 1,
1.22925, 1.699816, 0.3017701, 1, 1, 1, 1, 1,
1.235381, 0.1490719, 1.056228, 1, 1, 1, 1, 1,
1.243591, 1.270463, -0.07342945, 1, 1, 1, 1, 1,
1.246437, -1.138226, 1.673766, 1, 1, 1, 1, 1,
1.246737, 1.371061, 0.6827169, 1, 1, 1, 1, 1,
1.257533, 0.06474048, 1.838427, 1, 1, 1, 1, 1,
1.269815, 1.017445, 0.7719799, 1, 1, 1, 1, 1,
1.270851, -1.854349, 1.711689, 1, 1, 1, 1, 1,
1.282287, -1.072599, 3.885571, 0, 0, 1, 1, 1,
1.286606, 1.315927, 1.75219, 1, 0, 0, 1, 1,
1.288299, -0.8477279, 3.45988, 1, 0, 0, 1, 1,
1.296064, 1.10483, 0.9601734, 1, 0, 0, 1, 1,
1.303814, 1.378246, 0.3010176, 1, 0, 0, 1, 1,
1.311189, 0.1787712, 1.967726, 1, 0, 0, 1, 1,
1.315988, 2.256208, 0.5354577, 0, 0, 0, 1, 1,
1.319709, 0.7063684, 0.5801115, 0, 0, 0, 1, 1,
1.321572, 0.3436554, -0.9151418, 0, 0, 0, 1, 1,
1.321825, -0.1250004, 1.828056, 0, 0, 0, 1, 1,
1.359305, -1.553498, 2.887762, 0, 0, 0, 1, 1,
1.375666, -0.8273401, 3.676493, 0, 0, 0, 1, 1,
1.376457, 0.7754752, 0.06827315, 0, 0, 0, 1, 1,
1.378145, -2.908311, 2.238983, 1, 1, 1, 1, 1,
1.39071, -0.6921761, 2.689543, 1, 1, 1, 1, 1,
1.395163, 0.9778057, 0.426788, 1, 1, 1, 1, 1,
1.398024, -0.2219959, 1.209048, 1, 1, 1, 1, 1,
1.39908, 1.560639, 1.546332, 1, 1, 1, 1, 1,
1.404508, -2.00261, 3.485715, 1, 1, 1, 1, 1,
1.447861, -0.06092027, 0.626566, 1, 1, 1, 1, 1,
1.449921, -0.6480224, 4.122595, 1, 1, 1, 1, 1,
1.45538, -0.3877778, 2.302526, 1, 1, 1, 1, 1,
1.460096, 0.04581671, 0.8152693, 1, 1, 1, 1, 1,
1.468697, -0.2747727, -0.4780099, 1, 1, 1, 1, 1,
1.47413, -0.375268, 2.446922, 1, 1, 1, 1, 1,
1.476705, -1.721693, 2.715226, 1, 1, 1, 1, 1,
1.478703, -2.674467, 2.355865, 1, 1, 1, 1, 1,
1.482379, -1.068991, 2.384254, 1, 1, 1, 1, 1,
1.483066, 0.06229606, 3.02583, 0, 0, 1, 1, 1,
1.491888, 0.5294986, 1.480358, 1, 0, 0, 1, 1,
1.501183, 2.100414, 2.472781, 1, 0, 0, 1, 1,
1.503451, 2.065378, 0.3913383, 1, 0, 0, 1, 1,
1.504882, -0.7599058, 2.50868, 1, 0, 0, 1, 1,
1.508329, -1.242524, 2.163007, 1, 0, 0, 1, 1,
1.512304, -1.811024, 2.184512, 0, 0, 0, 1, 1,
1.523261, 0.138148, 1.950416, 0, 0, 0, 1, 1,
1.567413, 0.9735691, 0.6887972, 0, 0, 0, 1, 1,
1.569715, 1.523711, 0.2849686, 0, 0, 0, 1, 1,
1.578873, -0.04624633, 0.07890247, 0, 0, 0, 1, 1,
1.594083, 0.3492803, 0.7009881, 0, 0, 0, 1, 1,
1.59752, -0.1217735, 0.6915817, 0, 0, 0, 1, 1,
1.601208, 0.8514801, 2.116874, 1, 1, 1, 1, 1,
1.606327, 0.3991514, -0.01105327, 1, 1, 1, 1, 1,
1.617705, 0.689118, -0.6548816, 1, 1, 1, 1, 1,
1.620183, -0.03290086, 1.504175, 1, 1, 1, 1, 1,
1.629, 0.4210806, 0.7477144, 1, 1, 1, 1, 1,
1.630289, -0.8399022, 3.926794, 1, 1, 1, 1, 1,
1.630627, 0.09386215, 1.905068, 1, 1, 1, 1, 1,
1.638194, 0.6744363, 2.730806, 1, 1, 1, 1, 1,
1.638271, 0.4854258, 0.9844301, 1, 1, 1, 1, 1,
1.653344, -0.8447683, 0.11602, 1, 1, 1, 1, 1,
1.664486, 1.644268, 1.499433, 1, 1, 1, 1, 1,
1.679146, -1.196915, 2.84403, 1, 1, 1, 1, 1,
1.685193, 1.097649, -0.3858791, 1, 1, 1, 1, 1,
1.69074, -1.145131, 2.411724, 1, 1, 1, 1, 1,
1.699818, -1.314928, 2.288192, 1, 1, 1, 1, 1,
1.726619, 0.9569965, 1.329842, 0, 0, 1, 1, 1,
1.727442, -1.351793, 4.595596, 1, 0, 0, 1, 1,
1.733016, 0.8339432, 2.065728, 1, 0, 0, 1, 1,
1.768933, 1.193297, 3.062539, 1, 0, 0, 1, 1,
1.775201, -1.436674, 2.204147, 1, 0, 0, 1, 1,
1.785837, 0.6936818, 0.5575686, 1, 0, 0, 1, 1,
1.792307, -0.6895732, 1.413934, 0, 0, 0, 1, 1,
1.79436, 1.167186, -0.01777537, 0, 0, 0, 1, 1,
1.796458, -1.26925, 4.084307, 0, 0, 0, 1, 1,
1.804522, -0.4900602, 3.723904, 0, 0, 0, 1, 1,
1.816216, 0.3821636, 0.2582267, 0, 0, 0, 1, 1,
1.840676, 1.757621, 0.8148711, 0, 0, 0, 1, 1,
1.841632, 1.387087, 0.4232545, 0, 0, 0, 1, 1,
1.84633, -0.2365409, 0.9260815, 1, 1, 1, 1, 1,
1.860384, -1.39765, 2.525743, 1, 1, 1, 1, 1,
1.860844, 0.1102678, 1.17871, 1, 1, 1, 1, 1,
1.873714, -0.1954714, 0.4827311, 1, 1, 1, 1, 1,
1.911688, 0.9886177, 0.7727118, 1, 1, 1, 1, 1,
1.92278, -0.8474463, 2.218829, 1, 1, 1, 1, 1,
1.937664, 0.1128934, 2.119256, 1, 1, 1, 1, 1,
1.98549, -0.5435498, 2.384867, 1, 1, 1, 1, 1,
1.999315, -0.1901017, 1.869441, 1, 1, 1, 1, 1,
2.029972, 0.1619335, 2.735587, 1, 1, 1, 1, 1,
2.041101, 0.6242997, -0.5044967, 1, 1, 1, 1, 1,
2.070835, -0.6423492, 4.029006, 1, 1, 1, 1, 1,
2.074082, -0.7359093, 0.8851085, 1, 1, 1, 1, 1,
2.099051, -0.5167756, 2.64295, 1, 1, 1, 1, 1,
2.108173, 1.171976, 0.7750834, 1, 1, 1, 1, 1,
2.114022, 0.7553012, 3.012366, 0, 0, 1, 1, 1,
2.132229, 1.319998, 1.418786, 1, 0, 0, 1, 1,
2.133292, 0.2365776, 0.766695, 1, 0, 0, 1, 1,
2.163264, 0.8188862, 2.231956, 1, 0, 0, 1, 1,
2.178862, 0.5922143, 1.042255, 1, 0, 0, 1, 1,
2.181166, 0.4456352, 2.024779, 1, 0, 0, 1, 1,
2.204423, 0.1970812, 1.783264, 0, 0, 0, 1, 1,
2.284993, 0.2811337, 0.1021376, 0, 0, 0, 1, 1,
2.310369, -1.36591, 1.02411, 0, 0, 0, 1, 1,
2.365561, 0.1643961, -0.5147403, 0, 0, 0, 1, 1,
2.369311, -0.9504878, 0.09861739, 0, 0, 0, 1, 1,
2.403262, -0.9018353, 2.856867, 0, 0, 0, 1, 1,
2.480379, 0.5971283, -0.01357942, 0, 0, 0, 1, 1,
2.519542, -0.3643505, 0.6098009, 1, 1, 1, 1, 1,
2.523788, 0.9269934, 1.788045, 1, 1, 1, 1, 1,
2.54338, -0.9127138, 3.724552, 1, 1, 1, 1, 1,
2.550457, 0.3972533, 3.635361, 1, 1, 1, 1, 1,
2.628013, 0.9830049, 0.6476637, 1, 1, 1, 1, 1,
2.718525, 1.791804, 0.9740516, 1, 1, 1, 1, 1,
3.021049, -0.04647756, 2.001409, 1, 1, 1, 1, 1
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
var radius = 10.12342;
var distance = 35.55809;
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
mvMatrix.translate( 0.192306, -0.05572915, 0.06712794 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.55809);
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
