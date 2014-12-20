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
-2.825005, 2.404835, -1.175825, 1, 0, 0, 1,
-2.763323, 0.459078, -1.940289, 1, 0.007843138, 0, 1,
-2.732859, -0.145387, -1.161248, 1, 0.01176471, 0, 1,
-2.697055, -1.408591, -2.950373, 1, 0.01960784, 0, 1,
-2.669418, 1.435859, -3.17154, 1, 0.02352941, 0, 1,
-2.655826, -0.06560585, -1.73786, 1, 0.03137255, 0, 1,
-2.621052, -2.04293, -2.458095, 1, 0.03529412, 0, 1,
-2.557089, 0.5888148, -0.2799979, 1, 0.04313726, 0, 1,
-2.541524, -0.4031165, -0.219151, 1, 0.04705882, 0, 1,
-2.497854, -0.9144045, -1.527759, 1, 0.05490196, 0, 1,
-2.465415, 0.5661224, -2.293452, 1, 0.05882353, 0, 1,
-2.347678, 0.8400115, -1.168643, 1, 0.06666667, 0, 1,
-2.342569, -0.6146502, -2.093921, 1, 0.07058824, 0, 1,
-2.323316, 1.081158, -1.611533, 1, 0.07843138, 0, 1,
-2.318152, -0.2338408, -0.9418415, 1, 0.08235294, 0, 1,
-2.292682, -1.098808, -2.522068, 1, 0.09019608, 0, 1,
-2.256953, -0.9208233, -1.851979, 1, 0.09411765, 0, 1,
-2.256317, 0.4375616, -2.124794, 1, 0.1019608, 0, 1,
-2.237457, 1.04668, -1.196623, 1, 0.1098039, 0, 1,
-2.19989, -0.4737324, -2.612406, 1, 0.1137255, 0, 1,
-2.188777, -1.955299, -3.16515, 1, 0.1215686, 0, 1,
-2.188503, 0.2352921, -1.681777, 1, 0.1254902, 0, 1,
-2.184265, 0.5033658, -2.291539, 1, 0.1333333, 0, 1,
-2.17722, -1.781553, -2.06864, 1, 0.1372549, 0, 1,
-2.172306, -0.6417586, -2.951374, 1, 0.145098, 0, 1,
-2.169039, 0.7699775, -0.5970826, 1, 0.1490196, 0, 1,
-2.112288, -0.8480206, -3.578569, 1, 0.1568628, 0, 1,
-2.091969, 0.4003224, -0.1477194, 1, 0.1607843, 0, 1,
-2.074076, 0.230094, -1.511879, 1, 0.1686275, 0, 1,
-2.061329, -0.6686298, -1.57994, 1, 0.172549, 0, 1,
-2.058101, 0.5976262, -0.5506415, 1, 0.1803922, 0, 1,
-2.033221, 0.488879, -0.3557866, 1, 0.1843137, 0, 1,
-2.031573, -1.119683, -1.89423, 1, 0.1921569, 0, 1,
-2.017149, 0.8140457, -0.4183406, 1, 0.1960784, 0, 1,
-1.999812, -0.5420141, -1.759476, 1, 0.2039216, 0, 1,
-1.997603, -0.9195114, -1.556475, 1, 0.2117647, 0, 1,
-1.994462, 0.3839958, -2.373346, 1, 0.2156863, 0, 1,
-1.987671, 1.266524, -0.9398878, 1, 0.2235294, 0, 1,
-1.982437, -1.317413, -1.707902, 1, 0.227451, 0, 1,
-1.960382, -0.431949, -0.4987041, 1, 0.2352941, 0, 1,
-1.936127, -0.03326903, -3.437992, 1, 0.2392157, 0, 1,
-1.91175, 0.2823705, -2.399731, 1, 0.2470588, 0, 1,
-1.865693, -2.067821, -3.418057, 1, 0.2509804, 0, 1,
-1.82039, 0.0446246, -2.879426, 1, 0.2588235, 0, 1,
-1.802869, -0.436463, -1.712377, 1, 0.2627451, 0, 1,
-1.782379, -1.15947, -1.944994, 1, 0.2705882, 0, 1,
-1.772913, 0.2051351, -3.167263, 1, 0.2745098, 0, 1,
-1.768299, -0.4970855, -1.756969, 1, 0.282353, 0, 1,
-1.756019, 0.05066057, -3.179249, 1, 0.2862745, 0, 1,
-1.748319, -0.01298017, -1.609233, 1, 0.2941177, 0, 1,
-1.717925, -0.9501103, -1.987572, 1, 0.3019608, 0, 1,
-1.710467, -0.8487154, -1.99697, 1, 0.3058824, 0, 1,
-1.698843, 0.6265649, -0.2714617, 1, 0.3137255, 0, 1,
-1.668614, -1.705209, -3.153961, 1, 0.3176471, 0, 1,
-1.653205, -0.2401924, -2.731919, 1, 0.3254902, 0, 1,
-1.633339, -2.226639, -2.367493, 1, 0.3294118, 0, 1,
-1.632579, -0.5707519, -2.401085, 1, 0.3372549, 0, 1,
-1.612803, -0.3962543, -2.335763, 1, 0.3411765, 0, 1,
-1.611381, 0.1382455, -1.794336, 1, 0.3490196, 0, 1,
-1.607795, -0.9014981, -2.886434, 1, 0.3529412, 0, 1,
-1.590263, 0.3632469, -1.532208, 1, 0.3607843, 0, 1,
-1.581626, 0.4412104, -2.24311, 1, 0.3647059, 0, 1,
-1.580107, -1.589134, -0.8088686, 1, 0.372549, 0, 1,
-1.579789, 0.3403563, -0.9180494, 1, 0.3764706, 0, 1,
-1.571325, 2.975635, -2.210262, 1, 0.3843137, 0, 1,
-1.566407, -1.030496, -1.652167, 1, 0.3882353, 0, 1,
-1.55124, 0.9742005, -1.855904, 1, 0.3960784, 0, 1,
-1.543249, -1.27663, -3.304261, 1, 0.4039216, 0, 1,
-1.541063, 1.215498, -1.725256, 1, 0.4078431, 0, 1,
-1.535431, 0.2110592, -2.382699, 1, 0.4156863, 0, 1,
-1.528859, 0.8165051, -2.124104, 1, 0.4196078, 0, 1,
-1.51702, 0.07445695, -1.360279, 1, 0.427451, 0, 1,
-1.513022, 0.1546563, -1.789069, 1, 0.4313726, 0, 1,
-1.509003, -0.3969322, -2.424601, 1, 0.4392157, 0, 1,
-1.499079, -0.7974191, -0.7620888, 1, 0.4431373, 0, 1,
-1.498683, 0.6340564, -0.2109706, 1, 0.4509804, 0, 1,
-1.49535, 0.5995438, -0.1561968, 1, 0.454902, 0, 1,
-1.493376, -1.104429, -3.31235, 1, 0.4627451, 0, 1,
-1.489678, 0.266203, -3.778343, 1, 0.4666667, 0, 1,
-1.482991, -0.4125972, -2.10082, 1, 0.4745098, 0, 1,
-1.47822, 0.5689065, -1.765516, 1, 0.4784314, 0, 1,
-1.453917, -0.6442313, -1.544694, 1, 0.4862745, 0, 1,
-1.453005, -0.2001082, 0.06794659, 1, 0.4901961, 0, 1,
-1.441397, 0.3324867, 0.6103858, 1, 0.4980392, 0, 1,
-1.440635, 0.5409716, -3.009412, 1, 0.5058824, 0, 1,
-1.439639, -0.1292115, -3.310176, 1, 0.509804, 0, 1,
-1.436317, 0.8709232, -0.8280245, 1, 0.5176471, 0, 1,
-1.433167, 0.8771162, -1.136172, 1, 0.5215687, 0, 1,
-1.430319, -1.009581, -1.92057, 1, 0.5294118, 0, 1,
-1.427707, 2.054063, -0.01412456, 1, 0.5333334, 0, 1,
-1.424893, 1.220092, -1.097806, 1, 0.5411765, 0, 1,
-1.424824, 0.3468408, -2.563812, 1, 0.5450981, 0, 1,
-1.403649, 0.4793327, -1.390083, 1, 0.5529412, 0, 1,
-1.396318, -0.3027698, -0.5262753, 1, 0.5568628, 0, 1,
-1.387473, -0.3384318, -1.399963, 1, 0.5647059, 0, 1,
-1.385134, -1.407302, -3.751676, 1, 0.5686275, 0, 1,
-1.370729, 1.519993, 0.2393972, 1, 0.5764706, 0, 1,
-1.365021, -0.006051417, -1.173553, 1, 0.5803922, 0, 1,
-1.362687, 1.212862, -1.020076, 1, 0.5882353, 0, 1,
-1.359778, 0.5803673, -1.570267, 1, 0.5921569, 0, 1,
-1.352008, -1.474182, -2.418545, 1, 0.6, 0, 1,
-1.347699, 0.6798353, -0.866602, 1, 0.6078432, 0, 1,
-1.327664, 0.9359102, 0.001548602, 1, 0.6117647, 0, 1,
-1.324932, -1.961955, -3.86484, 1, 0.6196079, 0, 1,
-1.321687, -0.8349879, -1.878586, 1, 0.6235294, 0, 1,
-1.314875, 1.553845, -1.384316, 1, 0.6313726, 0, 1,
-1.312538, -0.373056, -1.962972, 1, 0.6352941, 0, 1,
-1.311104, -0.4183068, -0.8352188, 1, 0.6431373, 0, 1,
-1.308618, 1.76878, -2.014195, 1, 0.6470588, 0, 1,
-1.29312, -1.300604, -1.382299, 1, 0.654902, 0, 1,
-1.29056, 0.1138477, -2.983423, 1, 0.6588235, 0, 1,
-1.289868, -0.4840505, -0.3329273, 1, 0.6666667, 0, 1,
-1.283659, 3.003341, -0.6937137, 1, 0.6705883, 0, 1,
-1.28356, 0.2895439, -3.128295, 1, 0.6784314, 0, 1,
-1.282217, 0.6413218, -1.929289, 1, 0.682353, 0, 1,
-1.280614, -0.9327826, -3.257429, 1, 0.6901961, 0, 1,
-1.275802, -1.887943, -2.463493, 1, 0.6941177, 0, 1,
-1.273968, -1.576202, 0.1222578, 1, 0.7019608, 0, 1,
-1.245257, -1.148599, -2.01187, 1, 0.7098039, 0, 1,
-1.243827, -0.5379879, 0.2294677, 1, 0.7137255, 0, 1,
-1.243234, -1.684619, -3.782529, 1, 0.7215686, 0, 1,
-1.242365, -1.397302, -1.983617, 1, 0.7254902, 0, 1,
-1.240167, 0.3525808, -2.265872, 1, 0.7333333, 0, 1,
-1.239095, 0.08378541, -0.8650926, 1, 0.7372549, 0, 1,
-1.238592, -0.1779739, -1.479173, 1, 0.7450981, 0, 1,
-1.235238, -1.276661, -2.572147, 1, 0.7490196, 0, 1,
-1.230616, 0.306175, -1.000427, 1, 0.7568628, 0, 1,
-1.23004, -0.8978636, -2.491687, 1, 0.7607843, 0, 1,
-1.225314, 0.1567747, 0.7774745, 1, 0.7686275, 0, 1,
-1.224824, -0.4756561, -1.515123, 1, 0.772549, 0, 1,
-1.224459, -0.4768907, -2.808235, 1, 0.7803922, 0, 1,
-1.223301, 1.250301, 0.7004941, 1, 0.7843137, 0, 1,
-1.222944, -0.1137391, -0.01026607, 1, 0.7921569, 0, 1,
-1.209717, 0.639793, -0.793275, 1, 0.7960784, 0, 1,
-1.205099, -1.932427, -2.852934, 1, 0.8039216, 0, 1,
-1.200929, 0.105035, -0.3095981, 1, 0.8117647, 0, 1,
-1.19478, -0.4760585, -2.001665, 1, 0.8156863, 0, 1,
-1.18699, 0.7570469, -0.7043555, 1, 0.8235294, 0, 1,
-1.177036, 1.229666, -0.6254792, 1, 0.827451, 0, 1,
-1.169797, 0.516018, -0.5443307, 1, 0.8352941, 0, 1,
-1.164985, -0.2315688, 0.1097508, 1, 0.8392157, 0, 1,
-1.154233, -0.4126226, -1.628908, 1, 0.8470588, 0, 1,
-1.146969, 0.4644546, -1.774279, 1, 0.8509804, 0, 1,
-1.138789, 1.054274, 0.4784513, 1, 0.8588235, 0, 1,
-1.137504, 0.7036949, -0.07762925, 1, 0.8627451, 0, 1,
-1.127276, -1.776936, -1.569072, 1, 0.8705882, 0, 1,
-1.126861, -1.916924, -3.744133, 1, 0.8745098, 0, 1,
-1.124577, 0.5906087, -1.933758, 1, 0.8823529, 0, 1,
-1.124532, -0.685016, -2.185184, 1, 0.8862745, 0, 1,
-1.114508, -2.324941, -1.633697, 1, 0.8941177, 0, 1,
-1.107572, 1.043136, -0.1366126, 1, 0.8980392, 0, 1,
-1.103624, 1.788024, -0.514228, 1, 0.9058824, 0, 1,
-1.096984, -1.015437, -2.825184, 1, 0.9137255, 0, 1,
-1.089202, -0.270719, -2.246254, 1, 0.9176471, 0, 1,
-1.081407, -0.3135669, -0.8099321, 1, 0.9254902, 0, 1,
-1.074966, 0.5736923, -0.8836974, 1, 0.9294118, 0, 1,
-1.069048, 0.4697776, -3.388813, 1, 0.9372549, 0, 1,
-1.050249, 0.1128145, -0.05186813, 1, 0.9411765, 0, 1,
-1.043597, -2.355779, -2.325752, 1, 0.9490196, 0, 1,
-1.038739, -0.7839824, -0.2407292, 1, 0.9529412, 0, 1,
-1.023651, 0.3057971, -1.27316, 1, 0.9607843, 0, 1,
-1.023293, 0.1943952, -0.4298193, 1, 0.9647059, 0, 1,
-1.015798, 1.649722, -0.2066537, 1, 0.972549, 0, 1,
-1.015386, 0.04075281, -1.923038, 1, 0.9764706, 0, 1,
-1.014739, -1.224704, -3.19632, 1, 0.9843137, 0, 1,
-1.013203, 0.8345712, -2.447942, 1, 0.9882353, 0, 1,
-1.009866, -0.4745438, -3.81386, 1, 0.9960784, 0, 1,
-1.0098, -0.5219827, -2.952132, 0.9960784, 1, 0, 1,
-1.009512, -1.005425, -2.697971, 0.9921569, 1, 0, 1,
-0.9998534, -1.282391, -2.688146, 0.9843137, 1, 0, 1,
-0.9995329, -0.2252983, -2.165862, 0.9803922, 1, 0, 1,
-0.9893445, 1.08731, -1.706637, 0.972549, 1, 0, 1,
-0.9849588, -0.5190418, -3.693325, 0.9686275, 1, 0, 1,
-0.9778741, -1.743208, -1.004376, 0.9607843, 1, 0, 1,
-0.9772229, -0.1530752, -3.224627, 0.9568627, 1, 0, 1,
-0.9688314, -0.6863174, -2.167004, 0.9490196, 1, 0, 1,
-0.9687487, 0.08157223, -0.325838, 0.945098, 1, 0, 1,
-0.9644495, 1.063615, 0.4549491, 0.9372549, 1, 0, 1,
-0.9620103, -0.7242416, -2.416577, 0.9333333, 1, 0, 1,
-0.9577321, 0.4872142, -0.2915932, 0.9254902, 1, 0, 1,
-0.957095, -0.7760054, -2.906186, 0.9215686, 1, 0, 1,
-0.9490594, 0.4692984, -1.608543, 0.9137255, 1, 0, 1,
-0.9485977, 0.2838955, -0.0657194, 0.9098039, 1, 0, 1,
-0.9482438, -0.06995811, -1.403023, 0.9019608, 1, 0, 1,
-0.9425001, 2.164398, -3.275648, 0.8941177, 1, 0, 1,
-0.9404429, 0.2117198, -0.6340798, 0.8901961, 1, 0, 1,
-0.9349247, -0.3623606, -1.630955, 0.8823529, 1, 0, 1,
-0.933599, 0.3058961, -1.424154, 0.8784314, 1, 0, 1,
-0.9267223, 0.1343738, -3.088056, 0.8705882, 1, 0, 1,
-0.9227124, -2.23699, -3.516831, 0.8666667, 1, 0, 1,
-0.9183314, 2.047553, -0.7743841, 0.8588235, 1, 0, 1,
-0.9083445, 0.1806821, -1.470985, 0.854902, 1, 0, 1,
-0.9019079, 0.9182254, -1.975475, 0.8470588, 1, 0, 1,
-0.8968114, -0.3093109, -1.605062, 0.8431373, 1, 0, 1,
-0.8798241, -1.405386, -2.509162, 0.8352941, 1, 0, 1,
-0.8765126, 0.7365243, -0.4395385, 0.8313726, 1, 0, 1,
-0.8673837, -1.707504, -3.534772, 0.8235294, 1, 0, 1,
-0.8637561, -0.4971424, -3.294788, 0.8196079, 1, 0, 1,
-0.8544866, 0.698818, -0.2858215, 0.8117647, 1, 0, 1,
-0.8533558, 0.6267387, 0.02927605, 0.8078431, 1, 0, 1,
-0.8531168, 0.3503963, -0.2641866, 0.8, 1, 0, 1,
-0.8506163, -1.16636, -2.219395, 0.7921569, 1, 0, 1,
-0.8494339, -0.6052077, -2.902959, 0.7882353, 1, 0, 1,
-0.8334877, -0.9330774, -3.442612, 0.7803922, 1, 0, 1,
-0.8320143, -0.8454126, -3.656246, 0.7764706, 1, 0, 1,
-0.8290362, -0.3136568, -2.5224, 0.7686275, 1, 0, 1,
-0.8144732, 0.8177374, -0.4796625, 0.7647059, 1, 0, 1,
-0.8071977, 0.4836197, 0.4732683, 0.7568628, 1, 0, 1,
-0.806413, 1.096157, -0.6876153, 0.7529412, 1, 0, 1,
-0.8032308, 0.6215727, -0.5246744, 0.7450981, 1, 0, 1,
-0.7965196, -0.1721961, -2.377612, 0.7411765, 1, 0, 1,
-0.7923341, 1.001596, 1.548384, 0.7333333, 1, 0, 1,
-0.7892686, 0.2712018, 0.1939247, 0.7294118, 1, 0, 1,
-0.7778127, -0.680084, -0.5532613, 0.7215686, 1, 0, 1,
-0.77675, 1.245157, -0.5483882, 0.7176471, 1, 0, 1,
-0.7739267, 0.3661965, -1.099656, 0.7098039, 1, 0, 1,
-0.7734757, 0.8938527, 1.003225, 0.7058824, 1, 0, 1,
-0.769919, 0.5113385, -1.508228, 0.6980392, 1, 0, 1,
-0.768241, 0.4570082, -0.5085841, 0.6901961, 1, 0, 1,
-0.7603388, 0.5770233, -0.04178535, 0.6862745, 1, 0, 1,
-0.7537563, -1.440805, -2.980585, 0.6784314, 1, 0, 1,
-0.7479704, 0.1589167, -0.7667453, 0.6745098, 1, 0, 1,
-0.7452754, -0.9920738, -2.914914, 0.6666667, 1, 0, 1,
-0.7451369, -0.1886995, -1.221599, 0.6627451, 1, 0, 1,
-0.7405084, 0.4807619, -2.42211, 0.654902, 1, 0, 1,
-0.7305087, -0.408498, -3.329803, 0.6509804, 1, 0, 1,
-0.7300053, -0.3416485, -1.463942, 0.6431373, 1, 0, 1,
-0.7264811, -1.614159, -3.224131, 0.6392157, 1, 0, 1,
-0.7173381, -0.6472275, -2.259847, 0.6313726, 1, 0, 1,
-0.713678, -0.9750841, -3.319208, 0.627451, 1, 0, 1,
-0.7121978, -0.6173437, -2.560094, 0.6196079, 1, 0, 1,
-0.7062514, 0.7599115, -1.404742, 0.6156863, 1, 0, 1,
-0.703194, -0.521194, 0.1292313, 0.6078432, 1, 0, 1,
-0.7005745, 0.5048491, -0.7889182, 0.6039216, 1, 0, 1,
-0.6994663, 1.636318, -2.345689, 0.5960785, 1, 0, 1,
-0.6936407, 1.224086, -0.8231398, 0.5882353, 1, 0, 1,
-0.6916102, -1.248132, -2.128419, 0.5843138, 1, 0, 1,
-0.6864871, -0.1216018, -2.029866, 0.5764706, 1, 0, 1,
-0.6783968, 0.1138571, -0.4530248, 0.572549, 1, 0, 1,
-0.6754326, -0.4990999, -3.6238, 0.5647059, 1, 0, 1,
-0.6746173, 0.2994477, -1.023686, 0.5607843, 1, 0, 1,
-0.674428, -1.12614, -3.969145, 0.5529412, 1, 0, 1,
-0.6738219, -0.2828506, -2.73094, 0.5490196, 1, 0, 1,
-0.6729556, 0.4874286, -1.02898, 0.5411765, 1, 0, 1,
-0.672266, 1.325058, -2.336833, 0.5372549, 1, 0, 1,
-0.6639961, -0.2557178, -3.670513, 0.5294118, 1, 0, 1,
-0.6529936, 0.7783341, -0.9295262, 0.5254902, 1, 0, 1,
-0.6483987, -1.217198, -1.450923, 0.5176471, 1, 0, 1,
-0.6440356, 1.301505, -1.714275, 0.5137255, 1, 0, 1,
-0.6357008, 2.181513, -1.916733, 0.5058824, 1, 0, 1,
-0.633253, -1.131391, -0.3741613, 0.5019608, 1, 0, 1,
-0.6321114, 0.2392837, -0.3962362, 0.4941176, 1, 0, 1,
-0.6271397, -0.5148048, -3.836316, 0.4862745, 1, 0, 1,
-0.6242362, 0.08490429, -1.142289, 0.4823529, 1, 0, 1,
-0.6232738, -0.2293103, -1.82738, 0.4745098, 1, 0, 1,
-0.6227522, 1.301768, 0.7565408, 0.4705882, 1, 0, 1,
-0.6216185, 0.07114047, -3.77847, 0.4627451, 1, 0, 1,
-0.6199002, 0.832615, -1.694377, 0.4588235, 1, 0, 1,
-0.6182982, -2.835629, -2.557059, 0.4509804, 1, 0, 1,
-0.6126662, -0.08895103, -2.127563, 0.4470588, 1, 0, 1,
-0.60991, 0.8980761, -1.248411, 0.4392157, 1, 0, 1,
-0.609387, -1.872397, -0.8572288, 0.4352941, 1, 0, 1,
-0.6080827, -1.295326, -3.138994, 0.427451, 1, 0, 1,
-0.6068189, -0.03543169, -1.496029, 0.4235294, 1, 0, 1,
-0.603927, -1.575783, -1.791346, 0.4156863, 1, 0, 1,
-0.6027958, -1.754339, -3.64411, 0.4117647, 1, 0, 1,
-0.5935795, -1.677418, -4.421502, 0.4039216, 1, 0, 1,
-0.5927986, -1.463361, -2.875017, 0.3960784, 1, 0, 1,
-0.5920053, -0.3050597, -2.841059, 0.3921569, 1, 0, 1,
-0.5905414, -0.1047628, -2.357998, 0.3843137, 1, 0, 1,
-0.5837837, 1.508805, -1.182196, 0.3803922, 1, 0, 1,
-0.5836404, -0.3021704, -2.384232, 0.372549, 1, 0, 1,
-0.5799561, -1.179716, -4.413611, 0.3686275, 1, 0, 1,
-0.5687314, -0.6399912, -3.263003, 0.3607843, 1, 0, 1,
-0.5651404, 0.161277, -2.18455, 0.3568628, 1, 0, 1,
-0.5638478, 1.174581, 0.1944644, 0.3490196, 1, 0, 1,
-0.5615587, -0.534901, -0.9350695, 0.345098, 1, 0, 1,
-0.5611087, 0.6320252, -0.8490526, 0.3372549, 1, 0, 1,
-0.5601228, 0.05092166, -1.012964, 0.3333333, 1, 0, 1,
-0.559597, 1.453648, -0.009511264, 0.3254902, 1, 0, 1,
-0.5591174, -2.098032, -3.28528, 0.3215686, 1, 0, 1,
-0.5576633, -0.1356949, -1.700783, 0.3137255, 1, 0, 1,
-0.557421, -0.936218, -2.251871, 0.3098039, 1, 0, 1,
-0.5560005, 1.899256, 0.609121, 0.3019608, 1, 0, 1,
-0.5492911, 0.1548271, -1.56682, 0.2941177, 1, 0, 1,
-0.5478615, 1.631944, -0.1989479, 0.2901961, 1, 0, 1,
-0.5468026, -0.4220834, -3.344113, 0.282353, 1, 0, 1,
-0.5429033, 0.09704079, -2.416117, 0.2784314, 1, 0, 1,
-0.5417974, -0.2270376, -1.354193, 0.2705882, 1, 0, 1,
-0.535441, -0.657564, -2.70521, 0.2666667, 1, 0, 1,
-0.5191216, -1.865869, -2.612059, 0.2588235, 1, 0, 1,
-0.513463, -0.9085995, -2.471134, 0.254902, 1, 0, 1,
-0.5104921, -0.4127734, -1.431659, 0.2470588, 1, 0, 1,
-0.5083448, -0.8350262, -1.397748, 0.2431373, 1, 0, 1,
-0.5061628, 1.007301, -1.521925, 0.2352941, 1, 0, 1,
-0.5003487, 2.336995, 0.4112539, 0.2313726, 1, 0, 1,
-0.4950402, -0.5180627, -2.568587, 0.2235294, 1, 0, 1,
-0.4920568, -1.356153, -3.525119, 0.2196078, 1, 0, 1,
-0.4890306, 0.3207303, -2.586621, 0.2117647, 1, 0, 1,
-0.4863345, 0.7729799, -0.1547033, 0.2078431, 1, 0, 1,
-0.4848368, -0.8515904, -0.7400507, 0.2, 1, 0, 1,
-0.4753754, -0.8110512, -4.416872, 0.1921569, 1, 0, 1,
-0.4744364, 0.113721, 1.50067, 0.1882353, 1, 0, 1,
-0.4737716, 0.7514262, -2.127147, 0.1803922, 1, 0, 1,
-0.4684327, -1.155692, -0.7010146, 0.1764706, 1, 0, 1,
-0.4678783, -1.131639, -2.349766, 0.1686275, 1, 0, 1,
-0.4650385, 0.05497699, -0.8611781, 0.1647059, 1, 0, 1,
-0.4645447, -0.1436841, -3.912402, 0.1568628, 1, 0, 1,
-0.4644465, -1.189314, -2.005831, 0.1529412, 1, 0, 1,
-0.4623385, 0.004549632, -2.379886, 0.145098, 1, 0, 1,
-0.461936, 0.3469217, -0.2789812, 0.1411765, 1, 0, 1,
-0.4560397, -2.071562, -2.462431, 0.1333333, 1, 0, 1,
-0.4547609, 0.9159988, -0.6491831, 0.1294118, 1, 0, 1,
-0.4539803, -0.9460642, -2.13812, 0.1215686, 1, 0, 1,
-0.4506209, -0.51112, -3.439871, 0.1176471, 1, 0, 1,
-0.4442968, 0.2100704, -1.199401, 0.1098039, 1, 0, 1,
-0.4439505, -0.7653879, -4.66537, 0.1058824, 1, 0, 1,
-0.4427607, 0.4421093, -1.711494, 0.09803922, 1, 0, 1,
-0.4420277, -1.494532, -2.945951, 0.09019608, 1, 0, 1,
-0.4395862, 0.005726242, -0.07033333, 0.08627451, 1, 0, 1,
-0.4347795, 0.2825686, -1.427984, 0.07843138, 1, 0, 1,
-0.4332479, 0.09917301, -2.710187, 0.07450981, 1, 0, 1,
-0.4324654, 1.515396, -1.46494, 0.06666667, 1, 0, 1,
-0.4282847, -0.1988297, -0.6191024, 0.0627451, 1, 0, 1,
-0.4265144, 0.9175907, -1.046403, 0.05490196, 1, 0, 1,
-0.4102261, -1.280579, -2.529007, 0.05098039, 1, 0, 1,
-0.4102075, -0.8667886, -3.089293, 0.04313726, 1, 0, 1,
-0.4033196, 0.994668, -2.005698, 0.03921569, 1, 0, 1,
-0.3986736, -0.5190346, -4.327302, 0.03137255, 1, 0, 1,
-0.3956015, 0.3699306, 0.5885835, 0.02745098, 1, 0, 1,
-0.392302, -1.026967, -3.459562, 0.01960784, 1, 0, 1,
-0.3918689, -0.1177489, -2.511805, 0.01568628, 1, 0, 1,
-0.3882369, -0.1328057, -2.123239, 0.007843138, 1, 0, 1,
-0.3873614, 0.2098961, -0.8920736, 0.003921569, 1, 0, 1,
-0.3848035, 0.6513081, 0.04453933, 0, 1, 0.003921569, 1,
-0.3751454, 0.5178082, -1.56146, 0, 1, 0.01176471, 1,
-0.374007, 1.592225, 1.363743, 0, 1, 0.01568628, 1,
-0.3738155, -0.08911399, -1.586899, 0, 1, 0.02352941, 1,
-0.3696245, -0.4646936, -3.599746, 0, 1, 0.02745098, 1,
-0.3656873, -0.1307626, -1.137146, 0, 1, 0.03529412, 1,
-0.3646435, 0.1586819, -1.137261, 0, 1, 0.03921569, 1,
-0.3621798, -1.46332, -3.626692, 0, 1, 0.04705882, 1,
-0.3557347, 0.8790357, 0.09435672, 0, 1, 0.05098039, 1,
-0.3552496, -0.5229126, -4.275497, 0, 1, 0.05882353, 1,
-0.3509689, 2.010583, -1.501903, 0, 1, 0.0627451, 1,
-0.3508244, -0.848837, -2.204744, 0, 1, 0.07058824, 1,
-0.3450442, -2.113081, -4.083972, 0, 1, 0.07450981, 1,
-0.3403729, -0.449997, -2.568648, 0, 1, 0.08235294, 1,
-0.335438, 0.6173316, -0.9083784, 0, 1, 0.08627451, 1,
-0.3350112, 1.163994, 0.5585856, 0, 1, 0.09411765, 1,
-0.3303121, -0.3402366, -2.431604, 0, 1, 0.1019608, 1,
-0.3274049, -0.8052962, -2.991477, 0, 1, 0.1058824, 1,
-0.3270078, -1.496019, -3.144868, 0, 1, 0.1137255, 1,
-0.323706, 0.7642477, -0.2023271, 0, 1, 0.1176471, 1,
-0.3178626, 1.166557, 0.2968457, 0, 1, 0.1254902, 1,
-0.317489, 0.579582, -2.180347, 0, 1, 0.1294118, 1,
-0.3133504, 1.722569, -0.5656899, 0, 1, 0.1372549, 1,
-0.3108425, 0.8142192, 0.3045534, 0, 1, 0.1411765, 1,
-0.3076261, -0.9063472, -2.187015, 0, 1, 0.1490196, 1,
-0.3075845, -1.644686, -3.270272, 0, 1, 0.1529412, 1,
-0.3052226, -0.714812, -1.203703, 0, 1, 0.1607843, 1,
-0.298735, 0.8338974, 0.5682008, 0, 1, 0.1647059, 1,
-0.2965492, 0.9804114, -1.552976, 0, 1, 0.172549, 1,
-0.2952047, -1.658965, -3.848535, 0, 1, 0.1764706, 1,
-0.2934276, -0.7815314, -2.187329, 0, 1, 0.1843137, 1,
-0.2899974, -1.715883, -3.702856, 0, 1, 0.1882353, 1,
-0.2859622, -0.8343831, -1.841828, 0, 1, 0.1960784, 1,
-0.2844453, -0.2545544, -0.659064, 0, 1, 0.2039216, 1,
-0.2762015, 0.06540235, -2.49107, 0, 1, 0.2078431, 1,
-0.275201, -0.7940329, -5.095427, 0, 1, 0.2156863, 1,
-0.274727, 0.1433084, -1.33243, 0, 1, 0.2196078, 1,
-0.2746432, -0.2502873, -0.2660024, 0, 1, 0.227451, 1,
-0.2718328, 0.2054209, -1.666665, 0, 1, 0.2313726, 1,
-0.2709218, 0.7921864, -1.665237, 0, 1, 0.2392157, 1,
-0.2703194, -1.755527, -0.3955079, 0, 1, 0.2431373, 1,
-0.2684391, -0.7163355, -4.259199, 0, 1, 0.2509804, 1,
-0.2609145, -0.5704284, -1.620001, 0, 1, 0.254902, 1,
-0.2597347, 1.635814, -1.262217, 0, 1, 0.2627451, 1,
-0.2528933, -0.2254657, -2.513532, 0, 1, 0.2666667, 1,
-0.2526444, -0.009224382, -1.210113, 0, 1, 0.2745098, 1,
-0.2524725, 0.9780408, -0.1401301, 0, 1, 0.2784314, 1,
-0.2521041, -0.9547259, -2.733961, 0, 1, 0.2862745, 1,
-0.2498706, -1.160746, -2.874914, 0, 1, 0.2901961, 1,
-0.2489453, 0.4774092, -0.3199056, 0, 1, 0.2980392, 1,
-0.2470614, -2.151009, -2.957092, 0, 1, 0.3058824, 1,
-0.2404934, 1.648391, 0.3602231, 0, 1, 0.3098039, 1,
-0.2392937, 0.7904274, -1.054713, 0, 1, 0.3176471, 1,
-0.2382446, -0.2450143, -1.018498, 0, 1, 0.3215686, 1,
-0.232713, 0.7355049, -0.6469562, 0, 1, 0.3294118, 1,
-0.2311328, 0.5430639, -1.415, 0, 1, 0.3333333, 1,
-0.2294321, 1.674783, -0.1502438, 0, 1, 0.3411765, 1,
-0.2273679, 0.7060168, -1.546044, 0, 1, 0.345098, 1,
-0.2243173, 0.9979935, 0.5487993, 0, 1, 0.3529412, 1,
-0.215958, -0.5379239, -2.375831, 0, 1, 0.3568628, 1,
-0.2077957, -0.78974, -3.893632, 0, 1, 0.3647059, 1,
-0.2074801, -0.2965316, -3.130142, 0, 1, 0.3686275, 1,
-0.2064103, -0.7160284, -3.216325, 0, 1, 0.3764706, 1,
-0.2053513, -0.6070561, -4.075973, 0, 1, 0.3803922, 1,
-0.193412, -1.137769, -3.837169, 0, 1, 0.3882353, 1,
-0.1895888, 1.69262, 0.2057396, 0, 1, 0.3921569, 1,
-0.1889653, 1.837257, -2.482775, 0, 1, 0.4, 1,
-0.1882517, 0.2301909, -0.8602379, 0, 1, 0.4078431, 1,
-0.1861642, 0.2732038, -0.0455231, 0, 1, 0.4117647, 1,
-0.1840299, 0.7895006, 0.3382668, 0, 1, 0.4196078, 1,
-0.1837749, -1.687759, -2.201615, 0, 1, 0.4235294, 1,
-0.1831498, -0.2712204, -3.370177, 0, 1, 0.4313726, 1,
-0.1783522, 1.050075, -1.020165, 0, 1, 0.4352941, 1,
-0.167885, -0.06107488, -2.521183, 0, 1, 0.4431373, 1,
-0.1667749, 0.390052, 1.422943, 0, 1, 0.4470588, 1,
-0.1622643, 1.633699, 0.2099993, 0, 1, 0.454902, 1,
-0.159209, 0.6829351, -1.111824, 0, 1, 0.4588235, 1,
-0.1530316, 0.2135137, -1.876209, 0, 1, 0.4666667, 1,
-0.1504629, 0.3862447, -1.903469, 0, 1, 0.4705882, 1,
-0.1482432, -1.174307, -3.189058, 0, 1, 0.4784314, 1,
-0.1476248, -1.45596, -2.885387, 0, 1, 0.4823529, 1,
-0.1438342, -0.5838176, -4.040308, 0, 1, 0.4901961, 1,
-0.1432295, -0.09235152, -1.270759, 0, 1, 0.4941176, 1,
-0.1403269, -0.2081521, -1.40794, 0, 1, 0.5019608, 1,
-0.1388204, 0.2728951, -1.306561, 0, 1, 0.509804, 1,
-0.1387119, -1.390763, -2.998065, 0, 1, 0.5137255, 1,
-0.1287912, -0.2011019, -3.787318, 0, 1, 0.5215687, 1,
-0.1278665, 0.2048594, -0.8677605, 0, 1, 0.5254902, 1,
-0.1262666, 0.4895102, -0.09227023, 0, 1, 0.5333334, 1,
-0.1208366, 0.167661, -0.2867204, 0, 1, 0.5372549, 1,
-0.1173467, -2.127603, -2.373089, 0, 1, 0.5450981, 1,
-0.1128099, -0.1409642, -2.617757, 0, 1, 0.5490196, 1,
-0.1105149, 0.1472586, -0.4515592, 0, 1, 0.5568628, 1,
-0.1099948, -1.01826, -1.96722, 0, 1, 0.5607843, 1,
-0.1096601, -0.2340962, -2.839293, 0, 1, 0.5686275, 1,
-0.1083188, 1.206349, 0.05326289, 0, 1, 0.572549, 1,
-0.1082381, -0.2379622, -3.726592, 0, 1, 0.5803922, 1,
-0.1062401, 0.9375066, 0.2208969, 0, 1, 0.5843138, 1,
-0.1055508, -0.4872094, -3.31265, 0, 1, 0.5921569, 1,
-0.1032892, -0.8897415, -2.69336, 0, 1, 0.5960785, 1,
-0.1022068, 0.7940497, 1.202733, 0, 1, 0.6039216, 1,
-0.1001911, -0.4552027, -4.551112, 0, 1, 0.6117647, 1,
-0.09895147, -0.3336679, -2.759429, 0, 1, 0.6156863, 1,
-0.09875541, -0.548013, -3.045831, 0, 1, 0.6235294, 1,
-0.09830696, -1.267131, -3.384577, 0, 1, 0.627451, 1,
-0.09441286, -0.03472961, -1.289799, 0, 1, 0.6352941, 1,
-0.09377088, -0.8188965, -3.373144, 0, 1, 0.6392157, 1,
-0.09280005, -0.07007611, -0.7497222, 0, 1, 0.6470588, 1,
-0.09068501, -1.217518, -5.032618, 0, 1, 0.6509804, 1,
-0.08174703, -1.95574, -2.550929, 0, 1, 0.6588235, 1,
-0.0796619, -0.7803541, -3.238132, 0, 1, 0.6627451, 1,
-0.07575355, -0.7061674, -3.77967, 0, 1, 0.6705883, 1,
-0.072784, 1.265613, -1.117554, 0, 1, 0.6745098, 1,
-0.07181402, 0.3234669, -0.9835001, 0, 1, 0.682353, 1,
-0.07142647, 0.02725632, -1.356086, 0, 1, 0.6862745, 1,
-0.07073832, -0.5498357, -3.34531, 0, 1, 0.6941177, 1,
-0.0702243, 0.2412291, 1.240595, 0, 1, 0.7019608, 1,
-0.06944817, 2.324172, -0.5738475, 0, 1, 0.7058824, 1,
-0.06766996, -0.1669512, -3.007994, 0, 1, 0.7137255, 1,
-0.06641608, 0.2717285, -0.8583916, 0, 1, 0.7176471, 1,
-0.06460587, 1.623965, -0.5260609, 0, 1, 0.7254902, 1,
-0.06282403, 0.3670478, 0.6279874, 0, 1, 0.7294118, 1,
-0.06166002, 0.3753612, 1.292812, 0, 1, 0.7372549, 1,
-0.05983773, -2.509758, -2.100145, 0, 1, 0.7411765, 1,
-0.05772499, 0.5969257, -0.8302885, 0, 1, 0.7490196, 1,
-0.05623009, 1.650506, 1.682399, 0, 1, 0.7529412, 1,
-0.05595778, -0.7218061, -2.749849, 0, 1, 0.7607843, 1,
-0.05489142, 0.2408886, -0.5106714, 0, 1, 0.7647059, 1,
-0.05248454, 0.9213408, 0.5164962, 0, 1, 0.772549, 1,
-0.05238309, 0.407137, -0.5979484, 0, 1, 0.7764706, 1,
-0.05134667, -1.632323, -3.657984, 0, 1, 0.7843137, 1,
-0.05080571, 1.307521, 0.2200904, 0, 1, 0.7882353, 1,
-0.04839603, -0.1575372, -0.7677915, 0, 1, 0.7960784, 1,
-0.03700876, -1.513891, -3.046306, 0, 1, 0.8039216, 1,
-0.03213404, -0.287924, -2.431318, 0, 1, 0.8078431, 1,
-0.02988543, -1.665122, -0.9388014, 0, 1, 0.8156863, 1,
-0.02805368, -1.297676, -2.357256, 0, 1, 0.8196079, 1,
-0.02672435, -0.1147415, -4.44709, 0, 1, 0.827451, 1,
-0.02644948, 0.8863158, -1.012378, 0, 1, 0.8313726, 1,
-0.02528514, 0.03784067, 0.3171633, 0, 1, 0.8392157, 1,
-0.02505903, -0.4892024, -1.923752, 0, 1, 0.8431373, 1,
-0.02368746, -0.1570063, -2.039212, 0, 1, 0.8509804, 1,
-0.02016521, -0.3435315, -2.759359, 0, 1, 0.854902, 1,
-0.01705803, 0.2893687, -0.9142706, 0, 1, 0.8627451, 1,
-0.01496405, 1.201508, 1.220627, 0, 1, 0.8666667, 1,
-0.01476762, -0.9019575, -4.227931, 0, 1, 0.8745098, 1,
-0.008820109, -1.046999, -3.946463, 0, 1, 0.8784314, 1,
-0.007231653, 0.3052468, 0.4053912, 0, 1, 0.8862745, 1,
0.000878646, 0.2916643, 0.2943459, 0, 1, 0.8901961, 1,
0.002374321, -1.32693, 2.892493, 0, 1, 0.8980392, 1,
0.00348028, 0.4090011, 1.07458, 0, 1, 0.9058824, 1,
0.004428772, 0.8563458, -0.3093733, 0, 1, 0.9098039, 1,
0.007480107, 1.280973, 2.036056, 0, 1, 0.9176471, 1,
0.00842509, -2.024811, 4.057383, 0, 1, 0.9215686, 1,
0.009067137, 0.8596603, -0.8589929, 0, 1, 0.9294118, 1,
0.01421088, 1.589936, 1.129976, 0, 1, 0.9333333, 1,
0.01869929, 0.8423402, -0.05655864, 0, 1, 0.9411765, 1,
0.02154673, 0.1004349, 0.4095428, 0, 1, 0.945098, 1,
0.02157635, 0.9116067, -1.074478, 0, 1, 0.9529412, 1,
0.0233532, -0.607107, 3.62359, 0, 1, 0.9568627, 1,
0.02452477, 0.6617485, -1.10318, 0, 1, 0.9647059, 1,
0.024888, -0.1106757, 4.582544, 0, 1, 0.9686275, 1,
0.02527885, -0.02525796, 0.7563093, 0, 1, 0.9764706, 1,
0.03112939, -0.1219882, 2.424412, 0, 1, 0.9803922, 1,
0.03333433, 0.7664475, 1.200456, 0, 1, 0.9882353, 1,
0.03461464, -1.268561, 4.432829, 0, 1, 0.9921569, 1,
0.03540402, -0.1041919, 1.714914, 0, 1, 1, 1,
0.03575557, 0.01837504, 2.217342, 0, 0.9921569, 1, 1,
0.03933476, -0.1247707, 3.56067, 0, 0.9882353, 1, 1,
0.04363046, -0.1636145, 0.8389548, 0, 0.9803922, 1, 1,
0.04605453, 0.01999774, 3.716882, 0, 0.9764706, 1, 1,
0.05302647, 0.3729081, 0.1552986, 0, 0.9686275, 1, 1,
0.06402135, -2.01442, 2.81336, 0, 0.9647059, 1, 1,
0.06467275, -0.3973369, 3.493414, 0, 0.9568627, 1, 1,
0.06740732, 0.9779738, -0.2065843, 0, 0.9529412, 1, 1,
0.07186151, 0.1593585, 0.7098781, 0, 0.945098, 1, 1,
0.07216521, -0.9529962, 2.05632, 0, 0.9411765, 1, 1,
0.07234687, -0.4759403, 2.581543, 0, 0.9333333, 1, 1,
0.07486295, 0.8180098, -0.5886908, 0, 0.9294118, 1, 1,
0.07559558, 0.6730369, -0.3432488, 0, 0.9215686, 1, 1,
0.07582057, 0.4015654, 0.1919247, 0, 0.9176471, 1, 1,
0.08033599, -0.2460464, 3.167525, 0, 0.9098039, 1, 1,
0.0807507, 2.1068, 0.6274319, 0, 0.9058824, 1, 1,
0.08223299, 0.1528672, 1.374038, 0, 0.8980392, 1, 1,
0.08622964, -0.6564349, 3.217681, 0, 0.8901961, 1, 1,
0.08925407, -0.3736123, 2.296943, 0, 0.8862745, 1, 1,
0.09530398, -0.8062931, 4.285268, 0, 0.8784314, 1, 1,
0.09679479, -0.5587943, 3.945014, 0, 0.8745098, 1, 1,
0.101675, -1.235437, 5.617114, 0, 0.8666667, 1, 1,
0.1044624, 1.254654, -0.4789958, 0, 0.8627451, 1, 1,
0.1052241, -0.8686835, 4.146724, 0, 0.854902, 1, 1,
0.1052908, 0.7733495, -1.244217, 0, 0.8509804, 1, 1,
0.1061528, -1.998445, 4.910413, 0, 0.8431373, 1, 1,
0.1068681, 1.202669, -0.2393433, 0, 0.8392157, 1, 1,
0.1078562, -0.5270438, 1.625823, 0, 0.8313726, 1, 1,
0.1152424, 0.9768577, 0.7914544, 0, 0.827451, 1, 1,
0.1191093, -0.5190249, 2.529021, 0, 0.8196079, 1, 1,
0.1198287, -1.723417, 3.558178, 0, 0.8156863, 1, 1,
0.1213482, 0.3128543, -1.683857, 0, 0.8078431, 1, 1,
0.1255919, 0.2809182, 1.182335, 0, 0.8039216, 1, 1,
0.1282603, -0.1015524, 2.534041, 0, 0.7960784, 1, 1,
0.1295621, 0.6404586, -0.3773286, 0, 0.7882353, 1, 1,
0.132003, 0.8755709, -0.1749675, 0, 0.7843137, 1, 1,
0.1331193, -1.099553, 2.962386, 0, 0.7764706, 1, 1,
0.1341832, -1.046154, 2.554723, 0, 0.772549, 1, 1,
0.137876, 1.118997, 1.818532, 0, 0.7647059, 1, 1,
0.1381813, -1.382052, 4.933825, 0, 0.7607843, 1, 1,
0.1398372, 0.02498808, 2.950549, 0, 0.7529412, 1, 1,
0.140895, -1.126555, 3.42957, 0, 0.7490196, 1, 1,
0.1458568, 0.05009018, 0.3870413, 0, 0.7411765, 1, 1,
0.1467279, 0.3485959, 0.04574607, 0, 0.7372549, 1, 1,
0.1484331, -1.296893, 3.082194, 0, 0.7294118, 1, 1,
0.1518553, -0.3078629, 3.51017, 0, 0.7254902, 1, 1,
0.1533156, 1.237484, -0.9107853, 0, 0.7176471, 1, 1,
0.1554467, 0.01737127, 1.253337, 0, 0.7137255, 1, 1,
0.1559101, -0.03501247, 3.319313, 0, 0.7058824, 1, 1,
0.162898, -0.6964651, 5.596214, 0, 0.6980392, 1, 1,
0.1634555, -0.3836249, 1.458753, 0, 0.6941177, 1, 1,
0.1654741, 0.6211684, 0.1531106, 0, 0.6862745, 1, 1,
0.1671779, 1.580853, 1.378945, 0, 0.682353, 1, 1,
0.168769, 0.3022442, -2.082983, 0, 0.6745098, 1, 1,
0.1715187, 0.1382873, 2.34995, 0, 0.6705883, 1, 1,
0.1740859, -0.6778717, 3.289391, 0, 0.6627451, 1, 1,
0.1771023, 1.376639, 1.034008, 0, 0.6588235, 1, 1,
0.1786407, -0.714632, 3.401591, 0, 0.6509804, 1, 1,
0.183177, 0.3454545, 1.447821, 0, 0.6470588, 1, 1,
0.1884823, 0.5934932, -0.3044072, 0, 0.6392157, 1, 1,
0.1901145, 0.4908024, -1.770681, 0, 0.6352941, 1, 1,
0.1907176, 0.06741212, 0.2755632, 0, 0.627451, 1, 1,
0.196881, 0.2780744, 0.480598, 0, 0.6235294, 1, 1,
0.2013271, -0.07898602, 2.608815, 0, 0.6156863, 1, 1,
0.2027417, 0.2877614, -0.4953969, 0, 0.6117647, 1, 1,
0.2027954, 1.183231, -0.7816767, 0, 0.6039216, 1, 1,
0.2043252, 0.478875, 0.1078032, 0, 0.5960785, 1, 1,
0.2064306, -0.111899, 2.08912, 0, 0.5921569, 1, 1,
0.2065587, -2.052634, 2.979747, 0, 0.5843138, 1, 1,
0.207232, 0.9940127, 0.757608, 0, 0.5803922, 1, 1,
0.2086214, 1.179518, -0.8676, 0, 0.572549, 1, 1,
0.208703, 0.7765724, -1.58574, 0, 0.5686275, 1, 1,
0.2102679, 1.321356, -0.4604734, 0, 0.5607843, 1, 1,
0.2146122, 0.3693591, -0.8161293, 0, 0.5568628, 1, 1,
0.2147384, 1.017606, 0.92015, 0, 0.5490196, 1, 1,
0.2172702, 1.254966, -0.1279155, 0, 0.5450981, 1, 1,
0.2175011, -0.4686547, 3.008198, 0, 0.5372549, 1, 1,
0.2186742, -0.7283036, 4.134801, 0, 0.5333334, 1, 1,
0.2211836, 0.2227581, 0.9107778, 0, 0.5254902, 1, 1,
0.2225751, -0.4018149, 3.310896, 0, 0.5215687, 1, 1,
0.2242233, -0.8096134, 3.386492, 0, 0.5137255, 1, 1,
0.2266838, -1.925442, 3.373592, 0, 0.509804, 1, 1,
0.2290844, -2.306618, 2.156201, 0, 0.5019608, 1, 1,
0.2357053, -1.223663, 3.239603, 0, 0.4941176, 1, 1,
0.2417239, 0.5509258, -0.3106585, 0, 0.4901961, 1, 1,
0.2434436, 0.1506638, 1.648304, 0, 0.4823529, 1, 1,
0.2435745, -0.7052576, 2.290477, 0, 0.4784314, 1, 1,
0.2454829, 2.669848, -0.3191103, 0, 0.4705882, 1, 1,
0.2466221, 0.871288, 1.897603, 0, 0.4666667, 1, 1,
0.2468441, 0.03658755, 2.361105, 0, 0.4588235, 1, 1,
0.2481065, -0.4806875, 3.555864, 0, 0.454902, 1, 1,
0.2601843, -0.4950556, 2.892704, 0, 0.4470588, 1, 1,
0.26133, -0.02464636, 2.324841, 0, 0.4431373, 1, 1,
0.2695695, -0.466383, 2.951112, 0, 0.4352941, 1, 1,
0.2758035, -0.3823014, 3.700358, 0, 0.4313726, 1, 1,
0.2777762, -0.2132783, 4.585236, 0, 0.4235294, 1, 1,
0.2787791, -1.085173, 3.376339, 0, 0.4196078, 1, 1,
0.2814128, 0.7600664, 0.3946585, 0, 0.4117647, 1, 1,
0.2820111, -0.6292799, 2.774267, 0, 0.4078431, 1, 1,
0.2830044, 0.6344734, -0.8559323, 0, 0.4, 1, 1,
0.2877593, -1.865324, 4.333844, 0, 0.3921569, 1, 1,
0.2887764, -0.4679906, 2.789062, 0, 0.3882353, 1, 1,
0.2895921, 1.003859, 1.575961, 0, 0.3803922, 1, 1,
0.2907646, 0.4154935, 0.536225, 0, 0.3764706, 1, 1,
0.2918769, 0.2654429, 0.8024699, 0, 0.3686275, 1, 1,
0.2922774, -0.421549, 2.835745, 0, 0.3647059, 1, 1,
0.2980842, 0.2755144, -0.9053954, 0, 0.3568628, 1, 1,
0.2992958, -0.4312399, 4.056524, 0, 0.3529412, 1, 1,
0.3055043, 0.38404, 0.3915704, 0, 0.345098, 1, 1,
0.307442, -1.605568, 2.899958, 0, 0.3411765, 1, 1,
0.310176, 0.2779, 2.079993, 0, 0.3333333, 1, 1,
0.3109259, 2.261748, -0.007712272, 0, 0.3294118, 1, 1,
0.3116435, 1.346994, 0.6560968, 0, 0.3215686, 1, 1,
0.3133221, -0.7546838, 2.976851, 0, 0.3176471, 1, 1,
0.314928, 1.379191, 0.3250555, 0, 0.3098039, 1, 1,
0.3159018, -0.3120802, 1.16399, 0, 0.3058824, 1, 1,
0.3163817, 0.4732215, -0.6101326, 0, 0.2980392, 1, 1,
0.3176726, -0.2367697, 2.033223, 0, 0.2901961, 1, 1,
0.3179646, -0.9614947, 6.505377, 0, 0.2862745, 1, 1,
0.3216794, -0.9252282, 3.299606, 0, 0.2784314, 1, 1,
0.3260643, 0.1297041, 1.011256, 0, 0.2745098, 1, 1,
0.3283356, -1.280936, 2.268974, 0, 0.2666667, 1, 1,
0.3310663, 1.233303, 1.848187, 0, 0.2627451, 1, 1,
0.3315821, -0.1248234, 1.203909, 0, 0.254902, 1, 1,
0.3326262, -0.8154885, 2.030932, 0, 0.2509804, 1, 1,
0.3366918, 0.8636332, -1.487805, 0, 0.2431373, 1, 1,
0.3385598, 0.2908058, 1.435641, 0, 0.2392157, 1, 1,
0.3409528, -0.2308733, 3.836658, 0, 0.2313726, 1, 1,
0.3429697, 0.9555632, 1.519493, 0, 0.227451, 1, 1,
0.3443232, 0.2983015, 1.489484, 0, 0.2196078, 1, 1,
0.3455482, -0.5310411, 1.628194, 0, 0.2156863, 1, 1,
0.3477687, 0.159493, 0.01412006, 0, 0.2078431, 1, 1,
0.3545292, 0.9452928, -0.2702419, 0, 0.2039216, 1, 1,
0.3595298, 2.017334, 0.09636798, 0, 0.1960784, 1, 1,
0.3598592, -0.2271069, 2.652, 0, 0.1882353, 1, 1,
0.3625272, 3.804835, 0.5491769, 0, 0.1843137, 1, 1,
0.3653104, -1.082274, 1.703404, 0, 0.1764706, 1, 1,
0.3693336, -0.5445746, 1.255912, 0, 0.172549, 1, 1,
0.3699406, 0.3090753, 4.278307, 0, 0.1647059, 1, 1,
0.369985, -0.8367512, 2.308413, 0, 0.1607843, 1, 1,
0.3714027, -0.7197204, 3.554576, 0, 0.1529412, 1, 1,
0.3718626, -0.8766872, 2.960832, 0, 0.1490196, 1, 1,
0.3718873, -0.8959293, 2.998815, 0, 0.1411765, 1, 1,
0.3767832, -0.1104372, 0.9151948, 0, 0.1372549, 1, 1,
0.3856734, -0.1884322, 1.201953, 0, 0.1294118, 1, 1,
0.3866534, 0.1689867, 2.661062, 0, 0.1254902, 1, 1,
0.3870854, -0.03554073, 3.203901, 0, 0.1176471, 1, 1,
0.3908969, -0.09778649, 0.9790969, 0, 0.1137255, 1, 1,
0.3938063, 0.1026009, 1.200925, 0, 0.1058824, 1, 1,
0.3953605, -0.5530458, 1.921995, 0, 0.09803922, 1, 1,
0.395897, 1.633882, -0.4151442, 0, 0.09411765, 1, 1,
0.3985807, -0.6859803, 3.549476, 0, 0.08627451, 1, 1,
0.4028162, 0.0525045, 1.282577, 0, 0.08235294, 1, 1,
0.4058053, 0.30516, 0.9330319, 0, 0.07450981, 1, 1,
0.405878, -0.04302524, 2.894366, 0, 0.07058824, 1, 1,
0.4159652, 0.531802, 1.124284, 0, 0.0627451, 1, 1,
0.4194242, 0.1102829, 3.354605, 0, 0.05882353, 1, 1,
0.4227319, -0.8203416, 1.705461, 0, 0.05098039, 1, 1,
0.4232243, -2.053958, 2.966858, 0, 0.04705882, 1, 1,
0.4238716, -0.6308061, 1.578108, 0, 0.03921569, 1, 1,
0.4243627, -0.4609, 1.711953, 0, 0.03529412, 1, 1,
0.4253311, -0.3495023, 2.853765, 0, 0.02745098, 1, 1,
0.4310146, -0.1051025, 1.242352, 0, 0.02352941, 1, 1,
0.4310542, -0.6334679, 2.512996, 0, 0.01568628, 1, 1,
0.4334926, 0.1412356, 0.4162043, 0, 0.01176471, 1, 1,
0.438538, 0.329272, 0.7772557, 0, 0.003921569, 1, 1,
0.4402809, -1.263919, 3.333599, 0.003921569, 0, 1, 1,
0.4426674, -1.10383, 2.589749, 0.007843138, 0, 1, 1,
0.4429744, 1.491255, -0.2036522, 0.01568628, 0, 1, 1,
0.4440594, 0.3036543, 2.325383, 0.01960784, 0, 1, 1,
0.4458831, -0.7758442, 3.028108, 0.02745098, 0, 1, 1,
0.4481698, -0.6563176, 1.414239, 0.03137255, 0, 1, 1,
0.4489512, -0.06963537, 2.315236, 0.03921569, 0, 1, 1,
0.454388, -0.1558876, 2.558533, 0.04313726, 0, 1, 1,
0.4553724, 0.4928581, 1.77587, 0.05098039, 0, 1, 1,
0.4568314, -1.003621, 1.552598, 0.05490196, 0, 1, 1,
0.4583057, 0.6540716, 1.572367, 0.0627451, 0, 1, 1,
0.4611409, -0.07557446, 0.8144224, 0.06666667, 0, 1, 1,
0.4614198, -1.388671, 2.085859, 0.07450981, 0, 1, 1,
0.4655634, -1.590391, 3.451235, 0.07843138, 0, 1, 1,
0.466331, -0.6376892, 2.196726, 0.08627451, 0, 1, 1,
0.4694585, 0.3938797, -0.02462647, 0.09019608, 0, 1, 1,
0.4723477, 0.6511665, 2.500889, 0.09803922, 0, 1, 1,
0.4756097, 0.1069025, 0.478108, 0.1058824, 0, 1, 1,
0.4861462, 0.9637039, -0.7195507, 0.1098039, 0, 1, 1,
0.4863857, 2.79286, -1.296341, 0.1176471, 0, 1, 1,
0.488238, -1.266466, 4.611972, 0.1215686, 0, 1, 1,
0.4895684, -0.5643694, 3.092296, 0.1294118, 0, 1, 1,
0.4938709, -0.6645188, 2.39572, 0.1333333, 0, 1, 1,
0.4968692, 0.6377971, -0.7069747, 0.1411765, 0, 1, 1,
0.5037976, -1.532911, 3.118617, 0.145098, 0, 1, 1,
0.5039879, 1.004884, 0.7887653, 0.1529412, 0, 1, 1,
0.5067133, 0.0855641, 0.4286703, 0.1568628, 0, 1, 1,
0.5075667, -0.2916222, 1.796533, 0.1647059, 0, 1, 1,
0.5132087, -0.9083406, 3.903795, 0.1686275, 0, 1, 1,
0.5133145, 0.9537434, -0.8463888, 0.1764706, 0, 1, 1,
0.5135032, -2.02346, 3.018144, 0.1803922, 0, 1, 1,
0.5169665, -0.2389802, 4.025918, 0.1882353, 0, 1, 1,
0.5209815, 0.7051162, 0.1092843, 0.1921569, 0, 1, 1,
0.5209864, -1.162773, 2.732586, 0.2, 0, 1, 1,
0.5236455, -0.5421758, 2.42701, 0.2078431, 0, 1, 1,
0.5241984, -1.816898, 1.657197, 0.2117647, 0, 1, 1,
0.5266436, 0.8192939, -1.452845, 0.2196078, 0, 1, 1,
0.5299355, 1.441969, -0.3521855, 0.2235294, 0, 1, 1,
0.536282, -0.3212904, 2.329777, 0.2313726, 0, 1, 1,
0.5390234, -0.2946569, 0.9872038, 0.2352941, 0, 1, 1,
0.5425422, 0.3660303, 0.1930006, 0.2431373, 0, 1, 1,
0.5443127, 0.6641993, -0.7061585, 0.2470588, 0, 1, 1,
0.5464801, -0.5227785, 2.065817, 0.254902, 0, 1, 1,
0.5477358, -0.4240911, 2.350778, 0.2588235, 0, 1, 1,
0.547784, 0.0602584, 1.049722, 0.2666667, 0, 1, 1,
0.5494406, 0.4268555, 0.8483002, 0.2705882, 0, 1, 1,
0.5496501, -0.1864625, 2.351269, 0.2784314, 0, 1, 1,
0.5518575, -2.139152, 2.686344, 0.282353, 0, 1, 1,
0.5531338, 0.3586414, 0.4189896, 0.2901961, 0, 1, 1,
0.5531348, -0.1330715, 2.892311, 0.2941177, 0, 1, 1,
0.5544928, 0.5523045, 0.7467158, 0.3019608, 0, 1, 1,
0.5547687, -0.2621894, 1.959969, 0.3098039, 0, 1, 1,
0.5568568, 0.9083356, 1.499896, 0.3137255, 0, 1, 1,
0.5580651, -0.1176591, 1.221883, 0.3215686, 0, 1, 1,
0.5632448, 0.6071348, -0.7262913, 0.3254902, 0, 1, 1,
0.5672286, -2.386383, 3.618768, 0.3333333, 0, 1, 1,
0.5730448, 0.9311183, -1.538806, 0.3372549, 0, 1, 1,
0.5752831, 0.5120108, -0.3256237, 0.345098, 0, 1, 1,
0.5778562, -0.2487813, 2.21322, 0.3490196, 0, 1, 1,
0.589605, 1.040165, 0.2705166, 0.3568628, 0, 1, 1,
0.5971048, -0.186794, 3.39593, 0.3607843, 0, 1, 1,
0.5993329, -0.2373422, 2.413966, 0.3686275, 0, 1, 1,
0.6015562, 1.570965, -0.8783795, 0.372549, 0, 1, 1,
0.6078986, 0.4247137, 1.148337, 0.3803922, 0, 1, 1,
0.6097731, 0.568574, 1.308171, 0.3843137, 0, 1, 1,
0.6111058, -0.3297722, 0.4309608, 0.3921569, 0, 1, 1,
0.6143738, 3.078206, -0.1990956, 0.3960784, 0, 1, 1,
0.6170345, 0.5141645, 0.03893303, 0.4039216, 0, 1, 1,
0.6174152, -0.774106, 3.158517, 0.4117647, 0, 1, 1,
0.6187807, 2.726308, -0.6365703, 0.4156863, 0, 1, 1,
0.6249239, -0.8313142, 2.072693, 0.4235294, 0, 1, 1,
0.6251252, -0.6042863, 1.207761, 0.427451, 0, 1, 1,
0.6306292, 1.15082, 0.05448137, 0.4352941, 0, 1, 1,
0.6323717, -1.179207, 5.873268, 0.4392157, 0, 1, 1,
0.632625, 1.902232, 0.228421, 0.4470588, 0, 1, 1,
0.6326895, 0.2701856, -0.7750998, 0.4509804, 0, 1, 1,
0.6335388, 1.438782, 0.4121764, 0.4588235, 0, 1, 1,
0.6339956, -0.9293999, 2.43381, 0.4627451, 0, 1, 1,
0.6350385, -0.6713268, 3.195381, 0.4705882, 0, 1, 1,
0.6360274, 0.9375021, 0.4299963, 0.4745098, 0, 1, 1,
0.6411648, 0.878848, 0.7372414, 0.4823529, 0, 1, 1,
0.641221, 0.5426319, 1.803756, 0.4862745, 0, 1, 1,
0.6425689, -0.5767064, 2.598883, 0.4941176, 0, 1, 1,
0.6466813, 3.156204, -0.2391983, 0.5019608, 0, 1, 1,
0.6483973, -1.928889, 2.234462, 0.5058824, 0, 1, 1,
0.6575438, 2.233001, 0.3379168, 0.5137255, 0, 1, 1,
0.6588606, -0.04106735, 0.9236572, 0.5176471, 0, 1, 1,
0.6606828, -1.654868, 2.904531, 0.5254902, 0, 1, 1,
0.6623536, -0.2452672, 1.780832, 0.5294118, 0, 1, 1,
0.6638616, -0.9347547, 3.371934, 0.5372549, 0, 1, 1,
0.6647962, -0.07200217, 2.060775, 0.5411765, 0, 1, 1,
0.6696523, -1.199331, 2.499298, 0.5490196, 0, 1, 1,
0.6709111, -1.974833, 1.216511, 0.5529412, 0, 1, 1,
0.6709338, -0.2725853, 1.816906, 0.5607843, 0, 1, 1,
0.6759564, -0.280849, 1.927099, 0.5647059, 0, 1, 1,
0.6789194, 0.3980358, 0.02957796, 0.572549, 0, 1, 1,
0.6814932, 0.9213188, 0.4937713, 0.5764706, 0, 1, 1,
0.6855552, 1.114975, 3.271321, 0.5843138, 0, 1, 1,
0.6859112, -0.04301313, 2.01026, 0.5882353, 0, 1, 1,
0.6941468, -1.607315, 4.157021, 0.5960785, 0, 1, 1,
0.6943685, -1.333059, 1.842671, 0.6039216, 0, 1, 1,
0.7059791, -1.696228, 2.326172, 0.6078432, 0, 1, 1,
0.7068384, 0.5979067, 0.2348143, 0.6156863, 0, 1, 1,
0.7081524, 0.04338246, 0.812155, 0.6196079, 0, 1, 1,
0.7099566, -0.2741831, 2.233821, 0.627451, 0, 1, 1,
0.7147437, 0.9831395, 2.59907, 0.6313726, 0, 1, 1,
0.7154052, 0.1197194, 1.073031, 0.6392157, 0, 1, 1,
0.7170158, -0.1699005, 1.533813, 0.6431373, 0, 1, 1,
0.7228244, -0.8020291, 3.673154, 0.6509804, 0, 1, 1,
0.7234164, -0.355237, 1.666072, 0.654902, 0, 1, 1,
0.7248342, -1.603873, 2.938067, 0.6627451, 0, 1, 1,
0.7251258, 0.3003139, 1.772462, 0.6666667, 0, 1, 1,
0.7365165, -0.2331739, 1.729611, 0.6745098, 0, 1, 1,
0.7381153, -0.04566776, 0.3846048, 0.6784314, 0, 1, 1,
0.744725, -0.8517567, 3.807889, 0.6862745, 0, 1, 1,
0.7477642, -1.777005, 2.250971, 0.6901961, 0, 1, 1,
0.74957, 0.06769743, 1.95469, 0.6980392, 0, 1, 1,
0.7501755, 2.449455, -0.8920102, 0.7058824, 0, 1, 1,
0.751019, 0.9967957, 0.8631639, 0.7098039, 0, 1, 1,
0.7551645, 1.234654, 1.329104, 0.7176471, 0, 1, 1,
0.7587782, -0.7843557, 0.1851337, 0.7215686, 0, 1, 1,
0.7687746, 0.09310258, -0.07458524, 0.7294118, 0, 1, 1,
0.7723283, -0.8442331, 2.162133, 0.7333333, 0, 1, 1,
0.7751025, 1.26989, 0.5899983, 0.7411765, 0, 1, 1,
0.7851949, -0.7393135, 3.077356, 0.7450981, 0, 1, 1,
0.7859638, 0.1861527, 1.166764, 0.7529412, 0, 1, 1,
0.786801, -0.4846095, 2.334188, 0.7568628, 0, 1, 1,
0.7913008, 0.1251207, 2.050568, 0.7647059, 0, 1, 1,
0.796798, 0.3529592, -0.1406956, 0.7686275, 0, 1, 1,
0.7983989, 1.910577, 1.38319, 0.7764706, 0, 1, 1,
0.7999544, 0.9896344, -0.7883095, 0.7803922, 0, 1, 1,
0.8078965, 0.07329608, 2.842904, 0.7882353, 0, 1, 1,
0.8081395, -1.293997, 1.208648, 0.7921569, 0, 1, 1,
0.8087517, 1.747945, 2.175635, 0.8, 0, 1, 1,
0.8105656, 0.4484493, 1.147103, 0.8078431, 0, 1, 1,
0.8107214, 1.020459, 0.9235019, 0.8117647, 0, 1, 1,
0.8117592, 0.7916938, -1.070049, 0.8196079, 0, 1, 1,
0.8140283, -0.8131294, 2.173744, 0.8235294, 0, 1, 1,
0.8164001, -0.1834372, 0.08600592, 0.8313726, 0, 1, 1,
0.8181933, 0.2183659, 0.410945, 0.8352941, 0, 1, 1,
0.827529, 0.1263898, 4.101251, 0.8431373, 0, 1, 1,
0.83078, 0.8931531, 0.4726004, 0.8470588, 0, 1, 1,
0.835357, -2.084003, 2.676649, 0.854902, 0, 1, 1,
0.83808, 0.6944463, 1.675986, 0.8588235, 0, 1, 1,
0.8386721, -1.67396, 2.215368, 0.8666667, 0, 1, 1,
0.8412704, -2.202735, 3.766732, 0.8705882, 0, 1, 1,
0.8444168, -0.0849748, 1.506031, 0.8784314, 0, 1, 1,
0.8469534, 0.8503642, 0.5407721, 0.8823529, 0, 1, 1,
0.8507043, -1.228614, -0.447531, 0.8901961, 0, 1, 1,
0.8520548, 0.9962952, 0.8415204, 0.8941177, 0, 1, 1,
0.8537152, 0.6017157, 1.496016, 0.9019608, 0, 1, 1,
0.8564743, -0.5489799, 0.2219678, 0.9098039, 0, 1, 1,
0.8641542, 0.003465696, 0.3587755, 0.9137255, 0, 1, 1,
0.8708128, -1.849689, 1.358164, 0.9215686, 0, 1, 1,
0.8724035, -0.1174383, 2.532766, 0.9254902, 0, 1, 1,
0.874226, 2.129389, -1.706378, 0.9333333, 0, 1, 1,
0.8880159, -0.4059021, 2.35568, 0.9372549, 0, 1, 1,
0.8900928, -0.1450265, 1.346203, 0.945098, 0, 1, 1,
0.8938504, 1.070423, -0.3347828, 0.9490196, 0, 1, 1,
0.8945611, 0.2609479, 1.079014, 0.9568627, 0, 1, 1,
0.8969376, -0.5775594, 2.90488, 0.9607843, 0, 1, 1,
0.8993883, -0.5536534, -0.7861448, 0.9686275, 0, 1, 1,
0.9051178, -0.05662986, 2.380147, 0.972549, 0, 1, 1,
0.9062758, 1.292347, 1.164188, 0.9803922, 0, 1, 1,
0.9064533, -1.098647, 4.011023, 0.9843137, 0, 1, 1,
0.9105992, -0.07018988, 0.6299188, 0.9921569, 0, 1, 1,
0.9106395, -0.7668674, 1.957811, 0.9960784, 0, 1, 1,
0.911147, -2.660538, 2.645032, 1, 0, 0.9960784, 1,
0.9117541, -0.2847555, 2.510133, 1, 0, 0.9882353, 1,
0.9144034, -1.185932, 1.857379, 1, 0, 0.9843137, 1,
0.9165426, -1.481998, 3.342479, 1, 0, 0.9764706, 1,
0.925693, 2.204993, 1.626641, 1, 0, 0.972549, 1,
0.9259054, 0.6038417, 0.5887322, 1, 0, 0.9647059, 1,
0.9301848, 1.75509, -1.128105, 1, 0, 0.9607843, 1,
0.9324391, 0.7810194, 1.89046, 1, 0, 0.9529412, 1,
0.9341762, 1.672806, 1.559639, 1, 0, 0.9490196, 1,
0.9398159, -0.7906846, 2.256121, 1, 0, 0.9411765, 1,
0.9429457, -0.452612, 0.1857947, 1, 0, 0.9372549, 1,
0.9433447, 1.480296, 1.325511, 1, 0, 0.9294118, 1,
0.9451402, 0.01118753, 3.146084, 1, 0, 0.9254902, 1,
0.9526296, 0.2521286, 0.9809706, 1, 0, 0.9176471, 1,
0.9565274, 0.7200836, -1.469262, 1, 0, 0.9137255, 1,
0.9763989, 0.4591628, 1.16836, 1, 0, 0.9058824, 1,
0.976625, 1.104114, 0.2048958, 1, 0, 0.9019608, 1,
0.9786589, -0.5799789, 0.9832648, 1, 0, 0.8941177, 1,
0.9803773, -0.3602818, 3.214123, 1, 0, 0.8862745, 1,
0.9853035, 1.362281, -0.6039534, 1, 0, 0.8823529, 1,
0.9857025, 1.056708, -0.6707225, 1, 0, 0.8745098, 1,
0.9860714, 0.8889315, 3.116354, 1, 0, 0.8705882, 1,
0.9942802, 0.9362379, -0.7055188, 1, 0, 0.8627451, 1,
0.9943373, -0.2632768, 2.115543, 1, 0, 0.8588235, 1,
1.004738, 0.7430077, 0.347726, 1, 0, 0.8509804, 1,
1.010112, 0.2332523, 1.623245, 1, 0, 0.8470588, 1,
1.012738, 0.8751722, 1.179205, 1, 0, 0.8392157, 1,
1.01356, 0.5418777, 1.290184, 1, 0, 0.8352941, 1,
1.022344, 0.0933966, 0.8318295, 1, 0, 0.827451, 1,
1.023725, -1.868657, 1.675473, 1, 0, 0.8235294, 1,
1.02418, 0.9206322, -0.2444402, 1, 0, 0.8156863, 1,
1.03254, 1.682114, 1.382884, 1, 0, 0.8117647, 1,
1.036193, -1.314809, 2.358949, 1, 0, 0.8039216, 1,
1.037946, 0.2152337, 0.5083668, 1, 0, 0.7960784, 1,
1.038938, 0.4271873, 2.783529, 1, 0, 0.7921569, 1,
1.040306, 0.5369903, 1.905234, 1, 0, 0.7843137, 1,
1.042291, -0.9789246, 2.363445, 1, 0, 0.7803922, 1,
1.049953, -0.7026277, 1.336286, 1, 0, 0.772549, 1,
1.063019, -0.6705644, 2.779058, 1, 0, 0.7686275, 1,
1.063672, 0.0873212, 2.167432, 1, 0, 0.7607843, 1,
1.064236, -0.3147152, 2.895493, 1, 0, 0.7568628, 1,
1.067217, 2.117265, 1.279791, 1, 0, 0.7490196, 1,
1.067665, -0.06264663, 1.305345, 1, 0, 0.7450981, 1,
1.072978, 0.6679524, 0.863448, 1, 0, 0.7372549, 1,
1.082831, 1.832936, 0.7762058, 1, 0, 0.7333333, 1,
1.082944, -0.9261233, 2.387247, 1, 0, 0.7254902, 1,
1.083885, 0.01681018, 1.255324, 1, 0, 0.7215686, 1,
1.087975, -0.3251246, 0.03190538, 1, 0, 0.7137255, 1,
1.093378, 1.221193, 3.275251, 1, 0, 0.7098039, 1,
1.099163, 0.2132485, 2.886886, 1, 0, 0.7019608, 1,
1.126995, 0.1297354, -0.08004757, 1, 0, 0.6941177, 1,
1.128108, 1.219416, 1.50164, 1, 0, 0.6901961, 1,
1.134973, 0.1885757, 1.267979, 1, 0, 0.682353, 1,
1.135453, 0.06587255, 3.013065, 1, 0, 0.6784314, 1,
1.139502, -0.04441572, -0.1329352, 1, 0, 0.6705883, 1,
1.145517, 1.496205, 1.023287, 1, 0, 0.6666667, 1,
1.1499, -0.4758852, -0.5149403, 1, 0, 0.6588235, 1,
1.162458, -1.536395, 1.12985, 1, 0, 0.654902, 1,
1.164017, 0.02212201, 0.9546037, 1, 0, 0.6470588, 1,
1.16892, 0.8175374, 2.362948, 1, 0, 0.6431373, 1,
1.171449, -0.184878, 1.091694, 1, 0, 0.6352941, 1,
1.172651, -0.3576927, 1.555685, 1, 0, 0.6313726, 1,
1.176708, 0.835144, 1.424157, 1, 0, 0.6235294, 1,
1.182957, -0.7897606, 1.337884, 1, 0, 0.6196079, 1,
1.186452, -0.1173176, 2.439528, 1, 0, 0.6117647, 1,
1.187662, -2.299875, 1.422962, 1, 0, 0.6078432, 1,
1.190439, 0.08285014, 2.109994, 1, 0, 0.6, 1,
1.192281, -0.7268079, 2.747837, 1, 0, 0.5921569, 1,
1.203371, -0.5087152, 3.531409, 1, 0, 0.5882353, 1,
1.211502, 0.2005585, 2.667392, 1, 0, 0.5803922, 1,
1.226293, -0.2853544, 1.971814, 1, 0, 0.5764706, 1,
1.234154, -0.1984198, 0.7036598, 1, 0, 0.5686275, 1,
1.255843, -0.2111201, 2.689211, 1, 0, 0.5647059, 1,
1.256671, 1.796232, 2.589636, 1, 0, 0.5568628, 1,
1.267636, -0.05827415, 2.092516, 1, 0, 0.5529412, 1,
1.270198, -0.1781852, 1.459665, 1, 0, 0.5450981, 1,
1.273397, 0.07245271, 2.302229, 1, 0, 0.5411765, 1,
1.288141, -0.7093461, 1.805646, 1, 0, 0.5333334, 1,
1.290187, -2.833845, 3.871553, 1, 0, 0.5294118, 1,
1.31154, -0.3373233, 0.9372639, 1, 0, 0.5215687, 1,
1.34101, -0.4580449, 2.010305, 1, 0, 0.5176471, 1,
1.344355, -0.8785224, 3.146445, 1, 0, 0.509804, 1,
1.346993, -1.312994, 2.542226, 1, 0, 0.5058824, 1,
1.349398, -1.502307, 1.270361, 1, 0, 0.4980392, 1,
1.361053, 0.8955504, 1.813781, 1, 0, 0.4901961, 1,
1.362021, 0.979965, 0.3773367, 1, 0, 0.4862745, 1,
1.362437, 0.09168489, 0.4699057, 1, 0, 0.4784314, 1,
1.369278, -1.067504, 1.901668, 1, 0, 0.4745098, 1,
1.374108, 2.762998, 0.3089334, 1, 0, 0.4666667, 1,
1.398601, -0.4525521, 1.280466, 1, 0, 0.4627451, 1,
1.420136, 0.3545514, 0.4552664, 1, 0, 0.454902, 1,
1.435976, -0.7466653, 2.578785, 1, 0, 0.4509804, 1,
1.436158, -0.2613121, 3.762066, 1, 0, 0.4431373, 1,
1.465001, -0.1739029, 1.018004, 1, 0, 0.4392157, 1,
1.471702, -0.5402259, 1.821357, 1, 0, 0.4313726, 1,
1.478906, -1.410033, 3.097937, 1, 0, 0.427451, 1,
1.497167, 0.4531068, -0.003067156, 1, 0, 0.4196078, 1,
1.499469, 0.5514196, 0.8608702, 1, 0, 0.4156863, 1,
1.50196, -0.1078348, 1.9417, 1, 0, 0.4078431, 1,
1.503169, 0.3424287, 1.680349, 1, 0, 0.4039216, 1,
1.506651, -0.3272007, 1.384121, 1, 0, 0.3960784, 1,
1.511183, -1.848436, 2.123144, 1, 0, 0.3882353, 1,
1.526101, -0.4280176, 0.7031425, 1, 0, 0.3843137, 1,
1.54564, -0.7932634, 3.466604, 1, 0, 0.3764706, 1,
1.546874, -0.5536967, 2.308551, 1, 0, 0.372549, 1,
1.561715, -0.5734904, 2.874545, 1, 0, 0.3647059, 1,
1.56497, 0.6941616, 2.176872, 1, 0, 0.3607843, 1,
1.565167, -0.5325897, 3.242446, 1, 0, 0.3529412, 1,
1.57229, -0.3653362, 3.138856, 1, 0, 0.3490196, 1,
1.600638, -0.02077438, 0.5344366, 1, 0, 0.3411765, 1,
1.607144, 1.620986, 0.4167914, 1, 0, 0.3372549, 1,
1.613605, -1.056517, 1.926451, 1, 0, 0.3294118, 1,
1.625718, 0.2060712, 2.707334, 1, 0, 0.3254902, 1,
1.630409, 0.183726, 2.539423, 1, 0, 0.3176471, 1,
1.631613, -1.578863, 2.674552, 1, 0, 0.3137255, 1,
1.636134, -0.06487346, 2.771207, 1, 0, 0.3058824, 1,
1.638827, 0.3664458, 0.9828071, 1, 0, 0.2980392, 1,
1.643247, 0.7271736, 2.117451, 1, 0, 0.2941177, 1,
1.648167, -1.107657, 3.305146, 1, 0, 0.2862745, 1,
1.666497, 0.3109584, 2.86642, 1, 0, 0.282353, 1,
1.671596, 1.256871, 0.6310902, 1, 0, 0.2745098, 1,
1.676099, 0.03190409, 2.535963, 1, 0, 0.2705882, 1,
1.684278, 1.92771, 2.748972, 1, 0, 0.2627451, 1,
1.686302, -0.9389191, 3.12045, 1, 0, 0.2588235, 1,
1.686815, -1.858019, 1.517334, 1, 0, 0.2509804, 1,
1.69252, -1.394729, 3.590749, 1, 0, 0.2470588, 1,
1.697583, -0.7615029, 3.089606, 1, 0, 0.2392157, 1,
1.702174, -0.6780466, 1.279749, 1, 0, 0.2352941, 1,
1.71967, 1.295227, 1.973976, 1, 0, 0.227451, 1,
1.721676, -0.7511617, 2.099668, 1, 0, 0.2235294, 1,
1.721819, 0.1827796, 0.2815079, 1, 0, 0.2156863, 1,
1.728964, -0.3426378, 0.898311, 1, 0, 0.2117647, 1,
1.730914, -0.9245555, 1.708154, 1, 0, 0.2039216, 1,
1.731315, -0.5279863, 0.7446917, 1, 0, 0.1960784, 1,
1.73823, -0.1147099, 1.327759, 1, 0, 0.1921569, 1,
1.754873, 1.330066, 0.4325649, 1, 0, 0.1843137, 1,
1.762633, -0.04727619, 2.050092, 1, 0, 0.1803922, 1,
1.844281, -0.4181376, 0.4713251, 1, 0, 0.172549, 1,
1.855699, -0.03881064, -0.7539317, 1, 0, 0.1686275, 1,
1.892162, 0.1960083, 2.454811, 1, 0, 0.1607843, 1,
1.904601, -2.429948, 1.826778, 1, 0, 0.1568628, 1,
1.905295, -1.789127, 2.377845, 1, 0, 0.1490196, 1,
1.906871, 1.745744, 1.354918, 1, 0, 0.145098, 1,
1.92161, 1.087789, 2.001283, 1, 0, 0.1372549, 1,
1.948779, -0.4657396, 2.188408, 1, 0, 0.1333333, 1,
1.95935, -0.6988391, 0.1675085, 1, 0, 0.1254902, 1,
1.960788, -1.764701, 2.505343, 1, 0, 0.1215686, 1,
1.963183, -1.429656, 1.86289, 1, 0, 0.1137255, 1,
1.973036, 0.4051545, 0.0885227, 1, 0, 0.1098039, 1,
1.980022, 0.7667916, 0.4420286, 1, 0, 0.1019608, 1,
1.988986, -1.419008, 2.425149, 1, 0, 0.09411765, 1,
2.007638, 1.083753, 2.160712, 1, 0, 0.09019608, 1,
2.021822, -0.6109228, 2.798668, 1, 0, 0.08235294, 1,
2.023922, 0.2102641, 2.661379, 1, 0, 0.07843138, 1,
2.067317, -0.9773069, 2.114133, 1, 0, 0.07058824, 1,
2.086936, -0.8063884, 3.179837, 1, 0, 0.06666667, 1,
2.184357, -1.394432, 2.841145, 1, 0, 0.05882353, 1,
2.260031, 0.4137621, 1.868133, 1, 0, 0.05490196, 1,
2.288103, 0.1480059, 2.435627, 1, 0, 0.04705882, 1,
2.375605, -2.96434, 3.737858, 1, 0, 0.04313726, 1,
2.397588, 2.509971, 2.1343, 1, 0, 0.03529412, 1,
2.444707, 1.117079, 0.6238318, 1, 0, 0.03137255, 1,
2.587496, 0.2112804, 2.569362, 1, 0, 0.02352941, 1,
2.642831, 1.316527, 2.147086, 1, 0, 0.01960784, 1,
2.873294, 0.3528879, 0.6779115, 1, 0, 0.01176471, 1,
2.930866, 2.212747, 0.9800138, 1, 0, 0.007843138, 1
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
0.05293059, -4.111715, -7.061763, 0, -0.5, 0.5, 0.5,
0.05293059, -4.111715, -7.061763, 1, -0.5, 0.5, 0.5,
0.05293059, -4.111715, -7.061763, 1, 1.5, 0.5, 0.5,
0.05293059, -4.111715, -7.061763, 0, 1.5, 0.5, 0.5
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
-3.800625, 0.4202476, -7.061763, 0, -0.5, 0.5, 0.5,
-3.800625, 0.4202476, -7.061763, 1, -0.5, 0.5, 0.5,
-3.800625, 0.4202476, -7.061763, 1, 1.5, 0.5, 0.5,
-3.800625, 0.4202476, -7.061763, 0, 1.5, 0.5, 0.5
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
-3.800625, -4.111715, 0.7049749, 0, -0.5, 0.5, 0.5,
-3.800625, -4.111715, 0.7049749, 1, -0.5, 0.5, 0.5,
-3.800625, -4.111715, 0.7049749, 1, 1.5, 0.5, 0.5,
-3.800625, -4.111715, 0.7049749, 0, 1.5, 0.5, 0.5
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
-2, -3.065878, -5.269439,
2, -3.065878, -5.269439,
-2, -3.065878, -5.269439,
-2, -3.240184, -5.56816,
-1, -3.065878, -5.269439,
-1, -3.240184, -5.56816,
0, -3.065878, -5.269439,
0, -3.240184, -5.56816,
1, -3.065878, -5.269439,
1, -3.240184, -5.56816,
2, -3.065878, -5.269439,
2, -3.240184, -5.56816
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
-2, -3.588796, -6.165601, 0, -0.5, 0.5, 0.5,
-2, -3.588796, -6.165601, 1, -0.5, 0.5, 0.5,
-2, -3.588796, -6.165601, 1, 1.5, 0.5, 0.5,
-2, -3.588796, -6.165601, 0, 1.5, 0.5, 0.5,
-1, -3.588796, -6.165601, 0, -0.5, 0.5, 0.5,
-1, -3.588796, -6.165601, 1, -0.5, 0.5, 0.5,
-1, -3.588796, -6.165601, 1, 1.5, 0.5, 0.5,
-1, -3.588796, -6.165601, 0, 1.5, 0.5, 0.5,
0, -3.588796, -6.165601, 0, -0.5, 0.5, 0.5,
0, -3.588796, -6.165601, 1, -0.5, 0.5, 0.5,
0, -3.588796, -6.165601, 1, 1.5, 0.5, 0.5,
0, -3.588796, -6.165601, 0, 1.5, 0.5, 0.5,
1, -3.588796, -6.165601, 0, -0.5, 0.5, 0.5,
1, -3.588796, -6.165601, 1, -0.5, 0.5, 0.5,
1, -3.588796, -6.165601, 1, 1.5, 0.5, 0.5,
1, -3.588796, -6.165601, 0, 1.5, 0.5, 0.5,
2, -3.588796, -6.165601, 0, -0.5, 0.5, 0.5,
2, -3.588796, -6.165601, 1, -0.5, 0.5, 0.5,
2, -3.588796, -6.165601, 1, 1.5, 0.5, 0.5,
2, -3.588796, -6.165601, 0, 1.5, 0.5, 0.5
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
-2.911343, -2, -5.269439,
-2.911343, 3, -5.269439,
-2.911343, -2, -5.269439,
-3.059556, -2, -5.56816,
-2.911343, -1, -5.269439,
-3.059556, -1, -5.56816,
-2.911343, 0, -5.269439,
-3.059556, 0, -5.56816,
-2.911343, 1, -5.269439,
-3.059556, 1, -5.56816,
-2.911343, 2, -5.269439,
-3.059556, 2, -5.56816,
-2.911343, 3, -5.269439,
-3.059556, 3, -5.56816
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
-3.355984, -2, -6.165601, 0, -0.5, 0.5, 0.5,
-3.355984, -2, -6.165601, 1, -0.5, 0.5, 0.5,
-3.355984, -2, -6.165601, 1, 1.5, 0.5, 0.5,
-3.355984, -2, -6.165601, 0, 1.5, 0.5, 0.5,
-3.355984, -1, -6.165601, 0, -0.5, 0.5, 0.5,
-3.355984, -1, -6.165601, 1, -0.5, 0.5, 0.5,
-3.355984, -1, -6.165601, 1, 1.5, 0.5, 0.5,
-3.355984, -1, -6.165601, 0, 1.5, 0.5, 0.5,
-3.355984, 0, -6.165601, 0, -0.5, 0.5, 0.5,
-3.355984, 0, -6.165601, 1, -0.5, 0.5, 0.5,
-3.355984, 0, -6.165601, 1, 1.5, 0.5, 0.5,
-3.355984, 0, -6.165601, 0, 1.5, 0.5, 0.5,
-3.355984, 1, -6.165601, 0, -0.5, 0.5, 0.5,
-3.355984, 1, -6.165601, 1, -0.5, 0.5, 0.5,
-3.355984, 1, -6.165601, 1, 1.5, 0.5, 0.5,
-3.355984, 1, -6.165601, 0, 1.5, 0.5, 0.5,
-3.355984, 2, -6.165601, 0, -0.5, 0.5, 0.5,
-3.355984, 2, -6.165601, 1, -0.5, 0.5, 0.5,
-3.355984, 2, -6.165601, 1, 1.5, 0.5, 0.5,
-3.355984, 2, -6.165601, 0, 1.5, 0.5, 0.5,
-3.355984, 3, -6.165601, 0, -0.5, 0.5, 0.5,
-3.355984, 3, -6.165601, 1, -0.5, 0.5, 0.5,
-3.355984, 3, -6.165601, 1, 1.5, 0.5, 0.5,
-3.355984, 3, -6.165601, 0, 1.5, 0.5, 0.5
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
-2.911343, -3.065878, -4,
-2.911343, -3.065878, 6,
-2.911343, -3.065878, -4,
-3.059556, -3.240184, -4,
-2.911343, -3.065878, -2,
-3.059556, -3.240184, -2,
-2.911343, -3.065878, 0,
-3.059556, -3.240184, 0,
-2.911343, -3.065878, 2,
-3.059556, -3.240184, 2,
-2.911343, -3.065878, 4,
-3.059556, -3.240184, 4,
-2.911343, -3.065878, 6,
-3.059556, -3.240184, 6
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
-3.355984, -3.588796, -4, 0, -0.5, 0.5, 0.5,
-3.355984, -3.588796, -4, 1, -0.5, 0.5, 0.5,
-3.355984, -3.588796, -4, 1, 1.5, 0.5, 0.5,
-3.355984, -3.588796, -4, 0, 1.5, 0.5, 0.5,
-3.355984, -3.588796, -2, 0, -0.5, 0.5, 0.5,
-3.355984, -3.588796, -2, 1, -0.5, 0.5, 0.5,
-3.355984, -3.588796, -2, 1, 1.5, 0.5, 0.5,
-3.355984, -3.588796, -2, 0, 1.5, 0.5, 0.5,
-3.355984, -3.588796, 0, 0, -0.5, 0.5, 0.5,
-3.355984, -3.588796, 0, 1, -0.5, 0.5, 0.5,
-3.355984, -3.588796, 0, 1, 1.5, 0.5, 0.5,
-3.355984, -3.588796, 0, 0, 1.5, 0.5, 0.5,
-3.355984, -3.588796, 2, 0, -0.5, 0.5, 0.5,
-3.355984, -3.588796, 2, 1, -0.5, 0.5, 0.5,
-3.355984, -3.588796, 2, 1, 1.5, 0.5, 0.5,
-3.355984, -3.588796, 2, 0, 1.5, 0.5, 0.5,
-3.355984, -3.588796, 4, 0, -0.5, 0.5, 0.5,
-3.355984, -3.588796, 4, 1, -0.5, 0.5, 0.5,
-3.355984, -3.588796, 4, 1, 1.5, 0.5, 0.5,
-3.355984, -3.588796, 4, 0, 1.5, 0.5, 0.5,
-3.355984, -3.588796, 6, 0, -0.5, 0.5, 0.5,
-3.355984, -3.588796, 6, 1, -0.5, 0.5, 0.5,
-3.355984, -3.588796, 6, 1, 1.5, 0.5, 0.5,
-3.355984, -3.588796, 6, 0, 1.5, 0.5, 0.5
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
-2.911343, -3.065878, -5.269439,
-2.911343, 3.906373, -5.269439,
-2.911343, -3.065878, 6.679389,
-2.911343, 3.906373, 6.679389,
-2.911343, -3.065878, -5.269439,
-2.911343, -3.065878, 6.679389,
-2.911343, 3.906373, -5.269439,
-2.911343, 3.906373, 6.679389,
-2.911343, -3.065878, -5.269439,
3.017204, -3.065878, -5.269439,
-2.911343, -3.065878, 6.679389,
3.017204, -3.065878, 6.679389,
-2.911343, 3.906373, -5.269439,
3.017204, 3.906373, -5.269439,
-2.911343, 3.906373, 6.679389,
3.017204, 3.906373, 6.679389,
3.017204, -3.065878, -5.269439,
3.017204, 3.906373, -5.269439,
3.017204, -3.065878, 6.679389,
3.017204, 3.906373, 6.679389,
3.017204, -3.065878, -5.269439,
3.017204, -3.065878, 6.679389,
3.017204, 3.906373, -5.269439,
3.017204, 3.906373, 6.679389
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
var radius = 8.036974;
var distance = 35.75741;
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
mvMatrix.translate( -0.05293059, -0.4202476, -0.7049749 );
mvMatrix.scale( 1.465744, 1.246331, 0.7272457 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.75741);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
flubenzimine<-read.table("flubenzimine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flubenzimine$V2
```

```
## Error in eval(expr, envir, enclos): object 'flubenzimine' not found
```

```r
y<-flubenzimine$V3
```

```
## Error in eval(expr, envir, enclos): object 'flubenzimine' not found
```

```r
z<-flubenzimine$V4
```

```
## Error in eval(expr, envir, enclos): object 'flubenzimine' not found
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
-2.825005, 2.404835, -1.175825, 0, 0, 1, 1, 1,
-2.763323, 0.459078, -1.940289, 1, 0, 0, 1, 1,
-2.732859, -0.145387, -1.161248, 1, 0, 0, 1, 1,
-2.697055, -1.408591, -2.950373, 1, 0, 0, 1, 1,
-2.669418, 1.435859, -3.17154, 1, 0, 0, 1, 1,
-2.655826, -0.06560585, -1.73786, 1, 0, 0, 1, 1,
-2.621052, -2.04293, -2.458095, 0, 0, 0, 1, 1,
-2.557089, 0.5888148, -0.2799979, 0, 0, 0, 1, 1,
-2.541524, -0.4031165, -0.219151, 0, 0, 0, 1, 1,
-2.497854, -0.9144045, -1.527759, 0, 0, 0, 1, 1,
-2.465415, 0.5661224, -2.293452, 0, 0, 0, 1, 1,
-2.347678, 0.8400115, -1.168643, 0, 0, 0, 1, 1,
-2.342569, -0.6146502, -2.093921, 0, 0, 0, 1, 1,
-2.323316, 1.081158, -1.611533, 1, 1, 1, 1, 1,
-2.318152, -0.2338408, -0.9418415, 1, 1, 1, 1, 1,
-2.292682, -1.098808, -2.522068, 1, 1, 1, 1, 1,
-2.256953, -0.9208233, -1.851979, 1, 1, 1, 1, 1,
-2.256317, 0.4375616, -2.124794, 1, 1, 1, 1, 1,
-2.237457, 1.04668, -1.196623, 1, 1, 1, 1, 1,
-2.19989, -0.4737324, -2.612406, 1, 1, 1, 1, 1,
-2.188777, -1.955299, -3.16515, 1, 1, 1, 1, 1,
-2.188503, 0.2352921, -1.681777, 1, 1, 1, 1, 1,
-2.184265, 0.5033658, -2.291539, 1, 1, 1, 1, 1,
-2.17722, -1.781553, -2.06864, 1, 1, 1, 1, 1,
-2.172306, -0.6417586, -2.951374, 1, 1, 1, 1, 1,
-2.169039, 0.7699775, -0.5970826, 1, 1, 1, 1, 1,
-2.112288, -0.8480206, -3.578569, 1, 1, 1, 1, 1,
-2.091969, 0.4003224, -0.1477194, 1, 1, 1, 1, 1,
-2.074076, 0.230094, -1.511879, 0, 0, 1, 1, 1,
-2.061329, -0.6686298, -1.57994, 1, 0, 0, 1, 1,
-2.058101, 0.5976262, -0.5506415, 1, 0, 0, 1, 1,
-2.033221, 0.488879, -0.3557866, 1, 0, 0, 1, 1,
-2.031573, -1.119683, -1.89423, 1, 0, 0, 1, 1,
-2.017149, 0.8140457, -0.4183406, 1, 0, 0, 1, 1,
-1.999812, -0.5420141, -1.759476, 0, 0, 0, 1, 1,
-1.997603, -0.9195114, -1.556475, 0, 0, 0, 1, 1,
-1.994462, 0.3839958, -2.373346, 0, 0, 0, 1, 1,
-1.987671, 1.266524, -0.9398878, 0, 0, 0, 1, 1,
-1.982437, -1.317413, -1.707902, 0, 0, 0, 1, 1,
-1.960382, -0.431949, -0.4987041, 0, 0, 0, 1, 1,
-1.936127, -0.03326903, -3.437992, 0, 0, 0, 1, 1,
-1.91175, 0.2823705, -2.399731, 1, 1, 1, 1, 1,
-1.865693, -2.067821, -3.418057, 1, 1, 1, 1, 1,
-1.82039, 0.0446246, -2.879426, 1, 1, 1, 1, 1,
-1.802869, -0.436463, -1.712377, 1, 1, 1, 1, 1,
-1.782379, -1.15947, -1.944994, 1, 1, 1, 1, 1,
-1.772913, 0.2051351, -3.167263, 1, 1, 1, 1, 1,
-1.768299, -0.4970855, -1.756969, 1, 1, 1, 1, 1,
-1.756019, 0.05066057, -3.179249, 1, 1, 1, 1, 1,
-1.748319, -0.01298017, -1.609233, 1, 1, 1, 1, 1,
-1.717925, -0.9501103, -1.987572, 1, 1, 1, 1, 1,
-1.710467, -0.8487154, -1.99697, 1, 1, 1, 1, 1,
-1.698843, 0.6265649, -0.2714617, 1, 1, 1, 1, 1,
-1.668614, -1.705209, -3.153961, 1, 1, 1, 1, 1,
-1.653205, -0.2401924, -2.731919, 1, 1, 1, 1, 1,
-1.633339, -2.226639, -2.367493, 1, 1, 1, 1, 1,
-1.632579, -0.5707519, -2.401085, 0, 0, 1, 1, 1,
-1.612803, -0.3962543, -2.335763, 1, 0, 0, 1, 1,
-1.611381, 0.1382455, -1.794336, 1, 0, 0, 1, 1,
-1.607795, -0.9014981, -2.886434, 1, 0, 0, 1, 1,
-1.590263, 0.3632469, -1.532208, 1, 0, 0, 1, 1,
-1.581626, 0.4412104, -2.24311, 1, 0, 0, 1, 1,
-1.580107, -1.589134, -0.8088686, 0, 0, 0, 1, 1,
-1.579789, 0.3403563, -0.9180494, 0, 0, 0, 1, 1,
-1.571325, 2.975635, -2.210262, 0, 0, 0, 1, 1,
-1.566407, -1.030496, -1.652167, 0, 0, 0, 1, 1,
-1.55124, 0.9742005, -1.855904, 0, 0, 0, 1, 1,
-1.543249, -1.27663, -3.304261, 0, 0, 0, 1, 1,
-1.541063, 1.215498, -1.725256, 0, 0, 0, 1, 1,
-1.535431, 0.2110592, -2.382699, 1, 1, 1, 1, 1,
-1.528859, 0.8165051, -2.124104, 1, 1, 1, 1, 1,
-1.51702, 0.07445695, -1.360279, 1, 1, 1, 1, 1,
-1.513022, 0.1546563, -1.789069, 1, 1, 1, 1, 1,
-1.509003, -0.3969322, -2.424601, 1, 1, 1, 1, 1,
-1.499079, -0.7974191, -0.7620888, 1, 1, 1, 1, 1,
-1.498683, 0.6340564, -0.2109706, 1, 1, 1, 1, 1,
-1.49535, 0.5995438, -0.1561968, 1, 1, 1, 1, 1,
-1.493376, -1.104429, -3.31235, 1, 1, 1, 1, 1,
-1.489678, 0.266203, -3.778343, 1, 1, 1, 1, 1,
-1.482991, -0.4125972, -2.10082, 1, 1, 1, 1, 1,
-1.47822, 0.5689065, -1.765516, 1, 1, 1, 1, 1,
-1.453917, -0.6442313, -1.544694, 1, 1, 1, 1, 1,
-1.453005, -0.2001082, 0.06794659, 1, 1, 1, 1, 1,
-1.441397, 0.3324867, 0.6103858, 1, 1, 1, 1, 1,
-1.440635, 0.5409716, -3.009412, 0, 0, 1, 1, 1,
-1.439639, -0.1292115, -3.310176, 1, 0, 0, 1, 1,
-1.436317, 0.8709232, -0.8280245, 1, 0, 0, 1, 1,
-1.433167, 0.8771162, -1.136172, 1, 0, 0, 1, 1,
-1.430319, -1.009581, -1.92057, 1, 0, 0, 1, 1,
-1.427707, 2.054063, -0.01412456, 1, 0, 0, 1, 1,
-1.424893, 1.220092, -1.097806, 0, 0, 0, 1, 1,
-1.424824, 0.3468408, -2.563812, 0, 0, 0, 1, 1,
-1.403649, 0.4793327, -1.390083, 0, 0, 0, 1, 1,
-1.396318, -0.3027698, -0.5262753, 0, 0, 0, 1, 1,
-1.387473, -0.3384318, -1.399963, 0, 0, 0, 1, 1,
-1.385134, -1.407302, -3.751676, 0, 0, 0, 1, 1,
-1.370729, 1.519993, 0.2393972, 0, 0, 0, 1, 1,
-1.365021, -0.006051417, -1.173553, 1, 1, 1, 1, 1,
-1.362687, 1.212862, -1.020076, 1, 1, 1, 1, 1,
-1.359778, 0.5803673, -1.570267, 1, 1, 1, 1, 1,
-1.352008, -1.474182, -2.418545, 1, 1, 1, 1, 1,
-1.347699, 0.6798353, -0.866602, 1, 1, 1, 1, 1,
-1.327664, 0.9359102, 0.001548602, 1, 1, 1, 1, 1,
-1.324932, -1.961955, -3.86484, 1, 1, 1, 1, 1,
-1.321687, -0.8349879, -1.878586, 1, 1, 1, 1, 1,
-1.314875, 1.553845, -1.384316, 1, 1, 1, 1, 1,
-1.312538, -0.373056, -1.962972, 1, 1, 1, 1, 1,
-1.311104, -0.4183068, -0.8352188, 1, 1, 1, 1, 1,
-1.308618, 1.76878, -2.014195, 1, 1, 1, 1, 1,
-1.29312, -1.300604, -1.382299, 1, 1, 1, 1, 1,
-1.29056, 0.1138477, -2.983423, 1, 1, 1, 1, 1,
-1.289868, -0.4840505, -0.3329273, 1, 1, 1, 1, 1,
-1.283659, 3.003341, -0.6937137, 0, 0, 1, 1, 1,
-1.28356, 0.2895439, -3.128295, 1, 0, 0, 1, 1,
-1.282217, 0.6413218, -1.929289, 1, 0, 0, 1, 1,
-1.280614, -0.9327826, -3.257429, 1, 0, 0, 1, 1,
-1.275802, -1.887943, -2.463493, 1, 0, 0, 1, 1,
-1.273968, -1.576202, 0.1222578, 1, 0, 0, 1, 1,
-1.245257, -1.148599, -2.01187, 0, 0, 0, 1, 1,
-1.243827, -0.5379879, 0.2294677, 0, 0, 0, 1, 1,
-1.243234, -1.684619, -3.782529, 0, 0, 0, 1, 1,
-1.242365, -1.397302, -1.983617, 0, 0, 0, 1, 1,
-1.240167, 0.3525808, -2.265872, 0, 0, 0, 1, 1,
-1.239095, 0.08378541, -0.8650926, 0, 0, 0, 1, 1,
-1.238592, -0.1779739, -1.479173, 0, 0, 0, 1, 1,
-1.235238, -1.276661, -2.572147, 1, 1, 1, 1, 1,
-1.230616, 0.306175, -1.000427, 1, 1, 1, 1, 1,
-1.23004, -0.8978636, -2.491687, 1, 1, 1, 1, 1,
-1.225314, 0.1567747, 0.7774745, 1, 1, 1, 1, 1,
-1.224824, -0.4756561, -1.515123, 1, 1, 1, 1, 1,
-1.224459, -0.4768907, -2.808235, 1, 1, 1, 1, 1,
-1.223301, 1.250301, 0.7004941, 1, 1, 1, 1, 1,
-1.222944, -0.1137391, -0.01026607, 1, 1, 1, 1, 1,
-1.209717, 0.639793, -0.793275, 1, 1, 1, 1, 1,
-1.205099, -1.932427, -2.852934, 1, 1, 1, 1, 1,
-1.200929, 0.105035, -0.3095981, 1, 1, 1, 1, 1,
-1.19478, -0.4760585, -2.001665, 1, 1, 1, 1, 1,
-1.18699, 0.7570469, -0.7043555, 1, 1, 1, 1, 1,
-1.177036, 1.229666, -0.6254792, 1, 1, 1, 1, 1,
-1.169797, 0.516018, -0.5443307, 1, 1, 1, 1, 1,
-1.164985, -0.2315688, 0.1097508, 0, 0, 1, 1, 1,
-1.154233, -0.4126226, -1.628908, 1, 0, 0, 1, 1,
-1.146969, 0.4644546, -1.774279, 1, 0, 0, 1, 1,
-1.138789, 1.054274, 0.4784513, 1, 0, 0, 1, 1,
-1.137504, 0.7036949, -0.07762925, 1, 0, 0, 1, 1,
-1.127276, -1.776936, -1.569072, 1, 0, 0, 1, 1,
-1.126861, -1.916924, -3.744133, 0, 0, 0, 1, 1,
-1.124577, 0.5906087, -1.933758, 0, 0, 0, 1, 1,
-1.124532, -0.685016, -2.185184, 0, 0, 0, 1, 1,
-1.114508, -2.324941, -1.633697, 0, 0, 0, 1, 1,
-1.107572, 1.043136, -0.1366126, 0, 0, 0, 1, 1,
-1.103624, 1.788024, -0.514228, 0, 0, 0, 1, 1,
-1.096984, -1.015437, -2.825184, 0, 0, 0, 1, 1,
-1.089202, -0.270719, -2.246254, 1, 1, 1, 1, 1,
-1.081407, -0.3135669, -0.8099321, 1, 1, 1, 1, 1,
-1.074966, 0.5736923, -0.8836974, 1, 1, 1, 1, 1,
-1.069048, 0.4697776, -3.388813, 1, 1, 1, 1, 1,
-1.050249, 0.1128145, -0.05186813, 1, 1, 1, 1, 1,
-1.043597, -2.355779, -2.325752, 1, 1, 1, 1, 1,
-1.038739, -0.7839824, -0.2407292, 1, 1, 1, 1, 1,
-1.023651, 0.3057971, -1.27316, 1, 1, 1, 1, 1,
-1.023293, 0.1943952, -0.4298193, 1, 1, 1, 1, 1,
-1.015798, 1.649722, -0.2066537, 1, 1, 1, 1, 1,
-1.015386, 0.04075281, -1.923038, 1, 1, 1, 1, 1,
-1.014739, -1.224704, -3.19632, 1, 1, 1, 1, 1,
-1.013203, 0.8345712, -2.447942, 1, 1, 1, 1, 1,
-1.009866, -0.4745438, -3.81386, 1, 1, 1, 1, 1,
-1.0098, -0.5219827, -2.952132, 1, 1, 1, 1, 1,
-1.009512, -1.005425, -2.697971, 0, 0, 1, 1, 1,
-0.9998534, -1.282391, -2.688146, 1, 0, 0, 1, 1,
-0.9995329, -0.2252983, -2.165862, 1, 0, 0, 1, 1,
-0.9893445, 1.08731, -1.706637, 1, 0, 0, 1, 1,
-0.9849588, -0.5190418, -3.693325, 1, 0, 0, 1, 1,
-0.9778741, -1.743208, -1.004376, 1, 0, 0, 1, 1,
-0.9772229, -0.1530752, -3.224627, 0, 0, 0, 1, 1,
-0.9688314, -0.6863174, -2.167004, 0, 0, 0, 1, 1,
-0.9687487, 0.08157223, -0.325838, 0, 0, 0, 1, 1,
-0.9644495, 1.063615, 0.4549491, 0, 0, 0, 1, 1,
-0.9620103, -0.7242416, -2.416577, 0, 0, 0, 1, 1,
-0.9577321, 0.4872142, -0.2915932, 0, 0, 0, 1, 1,
-0.957095, -0.7760054, -2.906186, 0, 0, 0, 1, 1,
-0.9490594, 0.4692984, -1.608543, 1, 1, 1, 1, 1,
-0.9485977, 0.2838955, -0.0657194, 1, 1, 1, 1, 1,
-0.9482438, -0.06995811, -1.403023, 1, 1, 1, 1, 1,
-0.9425001, 2.164398, -3.275648, 1, 1, 1, 1, 1,
-0.9404429, 0.2117198, -0.6340798, 1, 1, 1, 1, 1,
-0.9349247, -0.3623606, -1.630955, 1, 1, 1, 1, 1,
-0.933599, 0.3058961, -1.424154, 1, 1, 1, 1, 1,
-0.9267223, 0.1343738, -3.088056, 1, 1, 1, 1, 1,
-0.9227124, -2.23699, -3.516831, 1, 1, 1, 1, 1,
-0.9183314, 2.047553, -0.7743841, 1, 1, 1, 1, 1,
-0.9083445, 0.1806821, -1.470985, 1, 1, 1, 1, 1,
-0.9019079, 0.9182254, -1.975475, 1, 1, 1, 1, 1,
-0.8968114, -0.3093109, -1.605062, 1, 1, 1, 1, 1,
-0.8798241, -1.405386, -2.509162, 1, 1, 1, 1, 1,
-0.8765126, 0.7365243, -0.4395385, 1, 1, 1, 1, 1,
-0.8673837, -1.707504, -3.534772, 0, 0, 1, 1, 1,
-0.8637561, -0.4971424, -3.294788, 1, 0, 0, 1, 1,
-0.8544866, 0.698818, -0.2858215, 1, 0, 0, 1, 1,
-0.8533558, 0.6267387, 0.02927605, 1, 0, 0, 1, 1,
-0.8531168, 0.3503963, -0.2641866, 1, 0, 0, 1, 1,
-0.8506163, -1.16636, -2.219395, 1, 0, 0, 1, 1,
-0.8494339, -0.6052077, -2.902959, 0, 0, 0, 1, 1,
-0.8334877, -0.9330774, -3.442612, 0, 0, 0, 1, 1,
-0.8320143, -0.8454126, -3.656246, 0, 0, 0, 1, 1,
-0.8290362, -0.3136568, -2.5224, 0, 0, 0, 1, 1,
-0.8144732, 0.8177374, -0.4796625, 0, 0, 0, 1, 1,
-0.8071977, 0.4836197, 0.4732683, 0, 0, 0, 1, 1,
-0.806413, 1.096157, -0.6876153, 0, 0, 0, 1, 1,
-0.8032308, 0.6215727, -0.5246744, 1, 1, 1, 1, 1,
-0.7965196, -0.1721961, -2.377612, 1, 1, 1, 1, 1,
-0.7923341, 1.001596, 1.548384, 1, 1, 1, 1, 1,
-0.7892686, 0.2712018, 0.1939247, 1, 1, 1, 1, 1,
-0.7778127, -0.680084, -0.5532613, 1, 1, 1, 1, 1,
-0.77675, 1.245157, -0.5483882, 1, 1, 1, 1, 1,
-0.7739267, 0.3661965, -1.099656, 1, 1, 1, 1, 1,
-0.7734757, 0.8938527, 1.003225, 1, 1, 1, 1, 1,
-0.769919, 0.5113385, -1.508228, 1, 1, 1, 1, 1,
-0.768241, 0.4570082, -0.5085841, 1, 1, 1, 1, 1,
-0.7603388, 0.5770233, -0.04178535, 1, 1, 1, 1, 1,
-0.7537563, -1.440805, -2.980585, 1, 1, 1, 1, 1,
-0.7479704, 0.1589167, -0.7667453, 1, 1, 1, 1, 1,
-0.7452754, -0.9920738, -2.914914, 1, 1, 1, 1, 1,
-0.7451369, -0.1886995, -1.221599, 1, 1, 1, 1, 1,
-0.7405084, 0.4807619, -2.42211, 0, 0, 1, 1, 1,
-0.7305087, -0.408498, -3.329803, 1, 0, 0, 1, 1,
-0.7300053, -0.3416485, -1.463942, 1, 0, 0, 1, 1,
-0.7264811, -1.614159, -3.224131, 1, 0, 0, 1, 1,
-0.7173381, -0.6472275, -2.259847, 1, 0, 0, 1, 1,
-0.713678, -0.9750841, -3.319208, 1, 0, 0, 1, 1,
-0.7121978, -0.6173437, -2.560094, 0, 0, 0, 1, 1,
-0.7062514, 0.7599115, -1.404742, 0, 0, 0, 1, 1,
-0.703194, -0.521194, 0.1292313, 0, 0, 0, 1, 1,
-0.7005745, 0.5048491, -0.7889182, 0, 0, 0, 1, 1,
-0.6994663, 1.636318, -2.345689, 0, 0, 0, 1, 1,
-0.6936407, 1.224086, -0.8231398, 0, 0, 0, 1, 1,
-0.6916102, -1.248132, -2.128419, 0, 0, 0, 1, 1,
-0.6864871, -0.1216018, -2.029866, 1, 1, 1, 1, 1,
-0.6783968, 0.1138571, -0.4530248, 1, 1, 1, 1, 1,
-0.6754326, -0.4990999, -3.6238, 1, 1, 1, 1, 1,
-0.6746173, 0.2994477, -1.023686, 1, 1, 1, 1, 1,
-0.674428, -1.12614, -3.969145, 1, 1, 1, 1, 1,
-0.6738219, -0.2828506, -2.73094, 1, 1, 1, 1, 1,
-0.6729556, 0.4874286, -1.02898, 1, 1, 1, 1, 1,
-0.672266, 1.325058, -2.336833, 1, 1, 1, 1, 1,
-0.6639961, -0.2557178, -3.670513, 1, 1, 1, 1, 1,
-0.6529936, 0.7783341, -0.9295262, 1, 1, 1, 1, 1,
-0.6483987, -1.217198, -1.450923, 1, 1, 1, 1, 1,
-0.6440356, 1.301505, -1.714275, 1, 1, 1, 1, 1,
-0.6357008, 2.181513, -1.916733, 1, 1, 1, 1, 1,
-0.633253, -1.131391, -0.3741613, 1, 1, 1, 1, 1,
-0.6321114, 0.2392837, -0.3962362, 1, 1, 1, 1, 1,
-0.6271397, -0.5148048, -3.836316, 0, 0, 1, 1, 1,
-0.6242362, 0.08490429, -1.142289, 1, 0, 0, 1, 1,
-0.6232738, -0.2293103, -1.82738, 1, 0, 0, 1, 1,
-0.6227522, 1.301768, 0.7565408, 1, 0, 0, 1, 1,
-0.6216185, 0.07114047, -3.77847, 1, 0, 0, 1, 1,
-0.6199002, 0.832615, -1.694377, 1, 0, 0, 1, 1,
-0.6182982, -2.835629, -2.557059, 0, 0, 0, 1, 1,
-0.6126662, -0.08895103, -2.127563, 0, 0, 0, 1, 1,
-0.60991, 0.8980761, -1.248411, 0, 0, 0, 1, 1,
-0.609387, -1.872397, -0.8572288, 0, 0, 0, 1, 1,
-0.6080827, -1.295326, -3.138994, 0, 0, 0, 1, 1,
-0.6068189, -0.03543169, -1.496029, 0, 0, 0, 1, 1,
-0.603927, -1.575783, -1.791346, 0, 0, 0, 1, 1,
-0.6027958, -1.754339, -3.64411, 1, 1, 1, 1, 1,
-0.5935795, -1.677418, -4.421502, 1, 1, 1, 1, 1,
-0.5927986, -1.463361, -2.875017, 1, 1, 1, 1, 1,
-0.5920053, -0.3050597, -2.841059, 1, 1, 1, 1, 1,
-0.5905414, -0.1047628, -2.357998, 1, 1, 1, 1, 1,
-0.5837837, 1.508805, -1.182196, 1, 1, 1, 1, 1,
-0.5836404, -0.3021704, -2.384232, 1, 1, 1, 1, 1,
-0.5799561, -1.179716, -4.413611, 1, 1, 1, 1, 1,
-0.5687314, -0.6399912, -3.263003, 1, 1, 1, 1, 1,
-0.5651404, 0.161277, -2.18455, 1, 1, 1, 1, 1,
-0.5638478, 1.174581, 0.1944644, 1, 1, 1, 1, 1,
-0.5615587, -0.534901, -0.9350695, 1, 1, 1, 1, 1,
-0.5611087, 0.6320252, -0.8490526, 1, 1, 1, 1, 1,
-0.5601228, 0.05092166, -1.012964, 1, 1, 1, 1, 1,
-0.559597, 1.453648, -0.009511264, 1, 1, 1, 1, 1,
-0.5591174, -2.098032, -3.28528, 0, 0, 1, 1, 1,
-0.5576633, -0.1356949, -1.700783, 1, 0, 0, 1, 1,
-0.557421, -0.936218, -2.251871, 1, 0, 0, 1, 1,
-0.5560005, 1.899256, 0.609121, 1, 0, 0, 1, 1,
-0.5492911, 0.1548271, -1.56682, 1, 0, 0, 1, 1,
-0.5478615, 1.631944, -0.1989479, 1, 0, 0, 1, 1,
-0.5468026, -0.4220834, -3.344113, 0, 0, 0, 1, 1,
-0.5429033, 0.09704079, -2.416117, 0, 0, 0, 1, 1,
-0.5417974, -0.2270376, -1.354193, 0, 0, 0, 1, 1,
-0.535441, -0.657564, -2.70521, 0, 0, 0, 1, 1,
-0.5191216, -1.865869, -2.612059, 0, 0, 0, 1, 1,
-0.513463, -0.9085995, -2.471134, 0, 0, 0, 1, 1,
-0.5104921, -0.4127734, -1.431659, 0, 0, 0, 1, 1,
-0.5083448, -0.8350262, -1.397748, 1, 1, 1, 1, 1,
-0.5061628, 1.007301, -1.521925, 1, 1, 1, 1, 1,
-0.5003487, 2.336995, 0.4112539, 1, 1, 1, 1, 1,
-0.4950402, -0.5180627, -2.568587, 1, 1, 1, 1, 1,
-0.4920568, -1.356153, -3.525119, 1, 1, 1, 1, 1,
-0.4890306, 0.3207303, -2.586621, 1, 1, 1, 1, 1,
-0.4863345, 0.7729799, -0.1547033, 1, 1, 1, 1, 1,
-0.4848368, -0.8515904, -0.7400507, 1, 1, 1, 1, 1,
-0.4753754, -0.8110512, -4.416872, 1, 1, 1, 1, 1,
-0.4744364, 0.113721, 1.50067, 1, 1, 1, 1, 1,
-0.4737716, 0.7514262, -2.127147, 1, 1, 1, 1, 1,
-0.4684327, -1.155692, -0.7010146, 1, 1, 1, 1, 1,
-0.4678783, -1.131639, -2.349766, 1, 1, 1, 1, 1,
-0.4650385, 0.05497699, -0.8611781, 1, 1, 1, 1, 1,
-0.4645447, -0.1436841, -3.912402, 1, 1, 1, 1, 1,
-0.4644465, -1.189314, -2.005831, 0, 0, 1, 1, 1,
-0.4623385, 0.004549632, -2.379886, 1, 0, 0, 1, 1,
-0.461936, 0.3469217, -0.2789812, 1, 0, 0, 1, 1,
-0.4560397, -2.071562, -2.462431, 1, 0, 0, 1, 1,
-0.4547609, 0.9159988, -0.6491831, 1, 0, 0, 1, 1,
-0.4539803, -0.9460642, -2.13812, 1, 0, 0, 1, 1,
-0.4506209, -0.51112, -3.439871, 0, 0, 0, 1, 1,
-0.4442968, 0.2100704, -1.199401, 0, 0, 0, 1, 1,
-0.4439505, -0.7653879, -4.66537, 0, 0, 0, 1, 1,
-0.4427607, 0.4421093, -1.711494, 0, 0, 0, 1, 1,
-0.4420277, -1.494532, -2.945951, 0, 0, 0, 1, 1,
-0.4395862, 0.005726242, -0.07033333, 0, 0, 0, 1, 1,
-0.4347795, 0.2825686, -1.427984, 0, 0, 0, 1, 1,
-0.4332479, 0.09917301, -2.710187, 1, 1, 1, 1, 1,
-0.4324654, 1.515396, -1.46494, 1, 1, 1, 1, 1,
-0.4282847, -0.1988297, -0.6191024, 1, 1, 1, 1, 1,
-0.4265144, 0.9175907, -1.046403, 1, 1, 1, 1, 1,
-0.4102261, -1.280579, -2.529007, 1, 1, 1, 1, 1,
-0.4102075, -0.8667886, -3.089293, 1, 1, 1, 1, 1,
-0.4033196, 0.994668, -2.005698, 1, 1, 1, 1, 1,
-0.3986736, -0.5190346, -4.327302, 1, 1, 1, 1, 1,
-0.3956015, 0.3699306, 0.5885835, 1, 1, 1, 1, 1,
-0.392302, -1.026967, -3.459562, 1, 1, 1, 1, 1,
-0.3918689, -0.1177489, -2.511805, 1, 1, 1, 1, 1,
-0.3882369, -0.1328057, -2.123239, 1, 1, 1, 1, 1,
-0.3873614, 0.2098961, -0.8920736, 1, 1, 1, 1, 1,
-0.3848035, 0.6513081, 0.04453933, 1, 1, 1, 1, 1,
-0.3751454, 0.5178082, -1.56146, 1, 1, 1, 1, 1,
-0.374007, 1.592225, 1.363743, 0, 0, 1, 1, 1,
-0.3738155, -0.08911399, -1.586899, 1, 0, 0, 1, 1,
-0.3696245, -0.4646936, -3.599746, 1, 0, 0, 1, 1,
-0.3656873, -0.1307626, -1.137146, 1, 0, 0, 1, 1,
-0.3646435, 0.1586819, -1.137261, 1, 0, 0, 1, 1,
-0.3621798, -1.46332, -3.626692, 1, 0, 0, 1, 1,
-0.3557347, 0.8790357, 0.09435672, 0, 0, 0, 1, 1,
-0.3552496, -0.5229126, -4.275497, 0, 0, 0, 1, 1,
-0.3509689, 2.010583, -1.501903, 0, 0, 0, 1, 1,
-0.3508244, -0.848837, -2.204744, 0, 0, 0, 1, 1,
-0.3450442, -2.113081, -4.083972, 0, 0, 0, 1, 1,
-0.3403729, -0.449997, -2.568648, 0, 0, 0, 1, 1,
-0.335438, 0.6173316, -0.9083784, 0, 0, 0, 1, 1,
-0.3350112, 1.163994, 0.5585856, 1, 1, 1, 1, 1,
-0.3303121, -0.3402366, -2.431604, 1, 1, 1, 1, 1,
-0.3274049, -0.8052962, -2.991477, 1, 1, 1, 1, 1,
-0.3270078, -1.496019, -3.144868, 1, 1, 1, 1, 1,
-0.323706, 0.7642477, -0.2023271, 1, 1, 1, 1, 1,
-0.3178626, 1.166557, 0.2968457, 1, 1, 1, 1, 1,
-0.317489, 0.579582, -2.180347, 1, 1, 1, 1, 1,
-0.3133504, 1.722569, -0.5656899, 1, 1, 1, 1, 1,
-0.3108425, 0.8142192, 0.3045534, 1, 1, 1, 1, 1,
-0.3076261, -0.9063472, -2.187015, 1, 1, 1, 1, 1,
-0.3075845, -1.644686, -3.270272, 1, 1, 1, 1, 1,
-0.3052226, -0.714812, -1.203703, 1, 1, 1, 1, 1,
-0.298735, 0.8338974, 0.5682008, 1, 1, 1, 1, 1,
-0.2965492, 0.9804114, -1.552976, 1, 1, 1, 1, 1,
-0.2952047, -1.658965, -3.848535, 1, 1, 1, 1, 1,
-0.2934276, -0.7815314, -2.187329, 0, 0, 1, 1, 1,
-0.2899974, -1.715883, -3.702856, 1, 0, 0, 1, 1,
-0.2859622, -0.8343831, -1.841828, 1, 0, 0, 1, 1,
-0.2844453, -0.2545544, -0.659064, 1, 0, 0, 1, 1,
-0.2762015, 0.06540235, -2.49107, 1, 0, 0, 1, 1,
-0.275201, -0.7940329, -5.095427, 1, 0, 0, 1, 1,
-0.274727, 0.1433084, -1.33243, 0, 0, 0, 1, 1,
-0.2746432, -0.2502873, -0.2660024, 0, 0, 0, 1, 1,
-0.2718328, 0.2054209, -1.666665, 0, 0, 0, 1, 1,
-0.2709218, 0.7921864, -1.665237, 0, 0, 0, 1, 1,
-0.2703194, -1.755527, -0.3955079, 0, 0, 0, 1, 1,
-0.2684391, -0.7163355, -4.259199, 0, 0, 0, 1, 1,
-0.2609145, -0.5704284, -1.620001, 0, 0, 0, 1, 1,
-0.2597347, 1.635814, -1.262217, 1, 1, 1, 1, 1,
-0.2528933, -0.2254657, -2.513532, 1, 1, 1, 1, 1,
-0.2526444, -0.009224382, -1.210113, 1, 1, 1, 1, 1,
-0.2524725, 0.9780408, -0.1401301, 1, 1, 1, 1, 1,
-0.2521041, -0.9547259, -2.733961, 1, 1, 1, 1, 1,
-0.2498706, -1.160746, -2.874914, 1, 1, 1, 1, 1,
-0.2489453, 0.4774092, -0.3199056, 1, 1, 1, 1, 1,
-0.2470614, -2.151009, -2.957092, 1, 1, 1, 1, 1,
-0.2404934, 1.648391, 0.3602231, 1, 1, 1, 1, 1,
-0.2392937, 0.7904274, -1.054713, 1, 1, 1, 1, 1,
-0.2382446, -0.2450143, -1.018498, 1, 1, 1, 1, 1,
-0.232713, 0.7355049, -0.6469562, 1, 1, 1, 1, 1,
-0.2311328, 0.5430639, -1.415, 1, 1, 1, 1, 1,
-0.2294321, 1.674783, -0.1502438, 1, 1, 1, 1, 1,
-0.2273679, 0.7060168, -1.546044, 1, 1, 1, 1, 1,
-0.2243173, 0.9979935, 0.5487993, 0, 0, 1, 1, 1,
-0.215958, -0.5379239, -2.375831, 1, 0, 0, 1, 1,
-0.2077957, -0.78974, -3.893632, 1, 0, 0, 1, 1,
-0.2074801, -0.2965316, -3.130142, 1, 0, 0, 1, 1,
-0.2064103, -0.7160284, -3.216325, 1, 0, 0, 1, 1,
-0.2053513, -0.6070561, -4.075973, 1, 0, 0, 1, 1,
-0.193412, -1.137769, -3.837169, 0, 0, 0, 1, 1,
-0.1895888, 1.69262, 0.2057396, 0, 0, 0, 1, 1,
-0.1889653, 1.837257, -2.482775, 0, 0, 0, 1, 1,
-0.1882517, 0.2301909, -0.8602379, 0, 0, 0, 1, 1,
-0.1861642, 0.2732038, -0.0455231, 0, 0, 0, 1, 1,
-0.1840299, 0.7895006, 0.3382668, 0, 0, 0, 1, 1,
-0.1837749, -1.687759, -2.201615, 0, 0, 0, 1, 1,
-0.1831498, -0.2712204, -3.370177, 1, 1, 1, 1, 1,
-0.1783522, 1.050075, -1.020165, 1, 1, 1, 1, 1,
-0.167885, -0.06107488, -2.521183, 1, 1, 1, 1, 1,
-0.1667749, 0.390052, 1.422943, 1, 1, 1, 1, 1,
-0.1622643, 1.633699, 0.2099993, 1, 1, 1, 1, 1,
-0.159209, 0.6829351, -1.111824, 1, 1, 1, 1, 1,
-0.1530316, 0.2135137, -1.876209, 1, 1, 1, 1, 1,
-0.1504629, 0.3862447, -1.903469, 1, 1, 1, 1, 1,
-0.1482432, -1.174307, -3.189058, 1, 1, 1, 1, 1,
-0.1476248, -1.45596, -2.885387, 1, 1, 1, 1, 1,
-0.1438342, -0.5838176, -4.040308, 1, 1, 1, 1, 1,
-0.1432295, -0.09235152, -1.270759, 1, 1, 1, 1, 1,
-0.1403269, -0.2081521, -1.40794, 1, 1, 1, 1, 1,
-0.1388204, 0.2728951, -1.306561, 1, 1, 1, 1, 1,
-0.1387119, -1.390763, -2.998065, 1, 1, 1, 1, 1,
-0.1287912, -0.2011019, -3.787318, 0, 0, 1, 1, 1,
-0.1278665, 0.2048594, -0.8677605, 1, 0, 0, 1, 1,
-0.1262666, 0.4895102, -0.09227023, 1, 0, 0, 1, 1,
-0.1208366, 0.167661, -0.2867204, 1, 0, 0, 1, 1,
-0.1173467, -2.127603, -2.373089, 1, 0, 0, 1, 1,
-0.1128099, -0.1409642, -2.617757, 1, 0, 0, 1, 1,
-0.1105149, 0.1472586, -0.4515592, 0, 0, 0, 1, 1,
-0.1099948, -1.01826, -1.96722, 0, 0, 0, 1, 1,
-0.1096601, -0.2340962, -2.839293, 0, 0, 0, 1, 1,
-0.1083188, 1.206349, 0.05326289, 0, 0, 0, 1, 1,
-0.1082381, -0.2379622, -3.726592, 0, 0, 0, 1, 1,
-0.1062401, 0.9375066, 0.2208969, 0, 0, 0, 1, 1,
-0.1055508, -0.4872094, -3.31265, 0, 0, 0, 1, 1,
-0.1032892, -0.8897415, -2.69336, 1, 1, 1, 1, 1,
-0.1022068, 0.7940497, 1.202733, 1, 1, 1, 1, 1,
-0.1001911, -0.4552027, -4.551112, 1, 1, 1, 1, 1,
-0.09895147, -0.3336679, -2.759429, 1, 1, 1, 1, 1,
-0.09875541, -0.548013, -3.045831, 1, 1, 1, 1, 1,
-0.09830696, -1.267131, -3.384577, 1, 1, 1, 1, 1,
-0.09441286, -0.03472961, -1.289799, 1, 1, 1, 1, 1,
-0.09377088, -0.8188965, -3.373144, 1, 1, 1, 1, 1,
-0.09280005, -0.07007611, -0.7497222, 1, 1, 1, 1, 1,
-0.09068501, -1.217518, -5.032618, 1, 1, 1, 1, 1,
-0.08174703, -1.95574, -2.550929, 1, 1, 1, 1, 1,
-0.0796619, -0.7803541, -3.238132, 1, 1, 1, 1, 1,
-0.07575355, -0.7061674, -3.77967, 1, 1, 1, 1, 1,
-0.072784, 1.265613, -1.117554, 1, 1, 1, 1, 1,
-0.07181402, 0.3234669, -0.9835001, 1, 1, 1, 1, 1,
-0.07142647, 0.02725632, -1.356086, 0, 0, 1, 1, 1,
-0.07073832, -0.5498357, -3.34531, 1, 0, 0, 1, 1,
-0.0702243, 0.2412291, 1.240595, 1, 0, 0, 1, 1,
-0.06944817, 2.324172, -0.5738475, 1, 0, 0, 1, 1,
-0.06766996, -0.1669512, -3.007994, 1, 0, 0, 1, 1,
-0.06641608, 0.2717285, -0.8583916, 1, 0, 0, 1, 1,
-0.06460587, 1.623965, -0.5260609, 0, 0, 0, 1, 1,
-0.06282403, 0.3670478, 0.6279874, 0, 0, 0, 1, 1,
-0.06166002, 0.3753612, 1.292812, 0, 0, 0, 1, 1,
-0.05983773, -2.509758, -2.100145, 0, 0, 0, 1, 1,
-0.05772499, 0.5969257, -0.8302885, 0, 0, 0, 1, 1,
-0.05623009, 1.650506, 1.682399, 0, 0, 0, 1, 1,
-0.05595778, -0.7218061, -2.749849, 0, 0, 0, 1, 1,
-0.05489142, 0.2408886, -0.5106714, 1, 1, 1, 1, 1,
-0.05248454, 0.9213408, 0.5164962, 1, 1, 1, 1, 1,
-0.05238309, 0.407137, -0.5979484, 1, 1, 1, 1, 1,
-0.05134667, -1.632323, -3.657984, 1, 1, 1, 1, 1,
-0.05080571, 1.307521, 0.2200904, 1, 1, 1, 1, 1,
-0.04839603, -0.1575372, -0.7677915, 1, 1, 1, 1, 1,
-0.03700876, -1.513891, -3.046306, 1, 1, 1, 1, 1,
-0.03213404, -0.287924, -2.431318, 1, 1, 1, 1, 1,
-0.02988543, -1.665122, -0.9388014, 1, 1, 1, 1, 1,
-0.02805368, -1.297676, -2.357256, 1, 1, 1, 1, 1,
-0.02672435, -0.1147415, -4.44709, 1, 1, 1, 1, 1,
-0.02644948, 0.8863158, -1.012378, 1, 1, 1, 1, 1,
-0.02528514, 0.03784067, 0.3171633, 1, 1, 1, 1, 1,
-0.02505903, -0.4892024, -1.923752, 1, 1, 1, 1, 1,
-0.02368746, -0.1570063, -2.039212, 1, 1, 1, 1, 1,
-0.02016521, -0.3435315, -2.759359, 0, 0, 1, 1, 1,
-0.01705803, 0.2893687, -0.9142706, 1, 0, 0, 1, 1,
-0.01496405, 1.201508, 1.220627, 1, 0, 0, 1, 1,
-0.01476762, -0.9019575, -4.227931, 1, 0, 0, 1, 1,
-0.008820109, -1.046999, -3.946463, 1, 0, 0, 1, 1,
-0.007231653, 0.3052468, 0.4053912, 1, 0, 0, 1, 1,
0.000878646, 0.2916643, 0.2943459, 0, 0, 0, 1, 1,
0.002374321, -1.32693, 2.892493, 0, 0, 0, 1, 1,
0.00348028, 0.4090011, 1.07458, 0, 0, 0, 1, 1,
0.004428772, 0.8563458, -0.3093733, 0, 0, 0, 1, 1,
0.007480107, 1.280973, 2.036056, 0, 0, 0, 1, 1,
0.00842509, -2.024811, 4.057383, 0, 0, 0, 1, 1,
0.009067137, 0.8596603, -0.8589929, 0, 0, 0, 1, 1,
0.01421088, 1.589936, 1.129976, 1, 1, 1, 1, 1,
0.01869929, 0.8423402, -0.05655864, 1, 1, 1, 1, 1,
0.02154673, 0.1004349, 0.4095428, 1, 1, 1, 1, 1,
0.02157635, 0.9116067, -1.074478, 1, 1, 1, 1, 1,
0.0233532, -0.607107, 3.62359, 1, 1, 1, 1, 1,
0.02452477, 0.6617485, -1.10318, 1, 1, 1, 1, 1,
0.024888, -0.1106757, 4.582544, 1, 1, 1, 1, 1,
0.02527885, -0.02525796, 0.7563093, 1, 1, 1, 1, 1,
0.03112939, -0.1219882, 2.424412, 1, 1, 1, 1, 1,
0.03333433, 0.7664475, 1.200456, 1, 1, 1, 1, 1,
0.03461464, -1.268561, 4.432829, 1, 1, 1, 1, 1,
0.03540402, -0.1041919, 1.714914, 1, 1, 1, 1, 1,
0.03575557, 0.01837504, 2.217342, 1, 1, 1, 1, 1,
0.03933476, -0.1247707, 3.56067, 1, 1, 1, 1, 1,
0.04363046, -0.1636145, 0.8389548, 1, 1, 1, 1, 1,
0.04605453, 0.01999774, 3.716882, 0, 0, 1, 1, 1,
0.05302647, 0.3729081, 0.1552986, 1, 0, 0, 1, 1,
0.06402135, -2.01442, 2.81336, 1, 0, 0, 1, 1,
0.06467275, -0.3973369, 3.493414, 1, 0, 0, 1, 1,
0.06740732, 0.9779738, -0.2065843, 1, 0, 0, 1, 1,
0.07186151, 0.1593585, 0.7098781, 1, 0, 0, 1, 1,
0.07216521, -0.9529962, 2.05632, 0, 0, 0, 1, 1,
0.07234687, -0.4759403, 2.581543, 0, 0, 0, 1, 1,
0.07486295, 0.8180098, -0.5886908, 0, 0, 0, 1, 1,
0.07559558, 0.6730369, -0.3432488, 0, 0, 0, 1, 1,
0.07582057, 0.4015654, 0.1919247, 0, 0, 0, 1, 1,
0.08033599, -0.2460464, 3.167525, 0, 0, 0, 1, 1,
0.0807507, 2.1068, 0.6274319, 0, 0, 0, 1, 1,
0.08223299, 0.1528672, 1.374038, 1, 1, 1, 1, 1,
0.08622964, -0.6564349, 3.217681, 1, 1, 1, 1, 1,
0.08925407, -0.3736123, 2.296943, 1, 1, 1, 1, 1,
0.09530398, -0.8062931, 4.285268, 1, 1, 1, 1, 1,
0.09679479, -0.5587943, 3.945014, 1, 1, 1, 1, 1,
0.101675, -1.235437, 5.617114, 1, 1, 1, 1, 1,
0.1044624, 1.254654, -0.4789958, 1, 1, 1, 1, 1,
0.1052241, -0.8686835, 4.146724, 1, 1, 1, 1, 1,
0.1052908, 0.7733495, -1.244217, 1, 1, 1, 1, 1,
0.1061528, -1.998445, 4.910413, 1, 1, 1, 1, 1,
0.1068681, 1.202669, -0.2393433, 1, 1, 1, 1, 1,
0.1078562, -0.5270438, 1.625823, 1, 1, 1, 1, 1,
0.1152424, 0.9768577, 0.7914544, 1, 1, 1, 1, 1,
0.1191093, -0.5190249, 2.529021, 1, 1, 1, 1, 1,
0.1198287, -1.723417, 3.558178, 1, 1, 1, 1, 1,
0.1213482, 0.3128543, -1.683857, 0, 0, 1, 1, 1,
0.1255919, 0.2809182, 1.182335, 1, 0, 0, 1, 1,
0.1282603, -0.1015524, 2.534041, 1, 0, 0, 1, 1,
0.1295621, 0.6404586, -0.3773286, 1, 0, 0, 1, 1,
0.132003, 0.8755709, -0.1749675, 1, 0, 0, 1, 1,
0.1331193, -1.099553, 2.962386, 1, 0, 0, 1, 1,
0.1341832, -1.046154, 2.554723, 0, 0, 0, 1, 1,
0.137876, 1.118997, 1.818532, 0, 0, 0, 1, 1,
0.1381813, -1.382052, 4.933825, 0, 0, 0, 1, 1,
0.1398372, 0.02498808, 2.950549, 0, 0, 0, 1, 1,
0.140895, -1.126555, 3.42957, 0, 0, 0, 1, 1,
0.1458568, 0.05009018, 0.3870413, 0, 0, 0, 1, 1,
0.1467279, 0.3485959, 0.04574607, 0, 0, 0, 1, 1,
0.1484331, -1.296893, 3.082194, 1, 1, 1, 1, 1,
0.1518553, -0.3078629, 3.51017, 1, 1, 1, 1, 1,
0.1533156, 1.237484, -0.9107853, 1, 1, 1, 1, 1,
0.1554467, 0.01737127, 1.253337, 1, 1, 1, 1, 1,
0.1559101, -0.03501247, 3.319313, 1, 1, 1, 1, 1,
0.162898, -0.6964651, 5.596214, 1, 1, 1, 1, 1,
0.1634555, -0.3836249, 1.458753, 1, 1, 1, 1, 1,
0.1654741, 0.6211684, 0.1531106, 1, 1, 1, 1, 1,
0.1671779, 1.580853, 1.378945, 1, 1, 1, 1, 1,
0.168769, 0.3022442, -2.082983, 1, 1, 1, 1, 1,
0.1715187, 0.1382873, 2.34995, 1, 1, 1, 1, 1,
0.1740859, -0.6778717, 3.289391, 1, 1, 1, 1, 1,
0.1771023, 1.376639, 1.034008, 1, 1, 1, 1, 1,
0.1786407, -0.714632, 3.401591, 1, 1, 1, 1, 1,
0.183177, 0.3454545, 1.447821, 1, 1, 1, 1, 1,
0.1884823, 0.5934932, -0.3044072, 0, 0, 1, 1, 1,
0.1901145, 0.4908024, -1.770681, 1, 0, 0, 1, 1,
0.1907176, 0.06741212, 0.2755632, 1, 0, 0, 1, 1,
0.196881, 0.2780744, 0.480598, 1, 0, 0, 1, 1,
0.2013271, -0.07898602, 2.608815, 1, 0, 0, 1, 1,
0.2027417, 0.2877614, -0.4953969, 1, 0, 0, 1, 1,
0.2027954, 1.183231, -0.7816767, 0, 0, 0, 1, 1,
0.2043252, 0.478875, 0.1078032, 0, 0, 0, 1, 1,
0.2064306, -0.111899, 2.08912, 0, 0, 0, 1, 1,
0.2065587, -2.052634, 2.979747, 0, 0, 0, 1, 1,
0.207232, 0.9940127, 0.757608, 0, 0, 0, 1, 1,
0.2086214, 1.179518, -0.8676, 0, 0, 0, 1, 1,
0.208703, 0.7765724, -1.58574, 0, 0, 0, 1, 1,
0.2102679, 1.321356, -0.4604734, 1, 1, 1, 1, 1,
0.2146122, 0.3693591, -0.8161293, 1, 1, 1, 1, 1,
0.2147384, 1.017606, 0.92015, 1, 1, 1, 1, 1,
0.2172702, 1.254966, -0.1279155, 1, 1, 1, 1, 1,
0.2175011, -0.4686547, 3.008198, 1, 1, 1, 1, 1,
0.2186742, -0.7283036, 4.134801, 1, 1, 1, 1, 1,
0.2211836, 0.2227581, 0.9107778, 1, 1, 1, 1, 1,
0.2225751, -0.4018149, 3.310896, 1, 1, 1, 1, 1,
0.2242233, -0.8096134, 3.386492, 1, 1, 1, 1, 1,
0.2266838, -1.925442, 3.373592, 1, 1, 1, 1, 1,
0.2290844, -2.306618, 2.156201, 1, 1, 1, 1, 1,
0.2357053, -1.223663, 3.239603, 1, 1, 1, 1, 1,
0.2417239, 0.5509258, -0.3106585, 1, 1, 1, 1, 1,
0.2434436, 0.1506638, 1.648304, 1, 1, 1, 1, 1,
0.2435745, -0.7052576, 2.290477, 1, 1, 1, 1, 1,
0.2454829, 2.669848, -0.3191103, 0, 0, 1, 1, 1,
0.2466221, 0.871288, 1.897603, 1, 0, 0, 1, 1,
0.2468441, 0.03658755, 2.361105, 1, 0, 0, 1, 1,
0.2481065, -0.4806875, 3.555864, 1, 0, 0, 1, 1,
0.2601843, -0.4950556, 2.892704, 1, 0, 0, 1, 1,
0.26133, -0.02464636, 2.324841, 1, 0, 0, 1, 1,
0.2695695, -0.466383, 2.951112, 0, 0, 0, 1, 1,
0.2758035, -0.3823014, 3.700358, 0, 0, 0, 1, 1,
0.2777762, -0.2132783, 4.585236, 0, 0, 0, 1, 1,
0.2787791, -1.085173, 3.376339, 0, 0, 0, 1, 1,
0.2814128, 0.7600664, 0.3946585, 0, 0, 0, 1, 1,
0.2820111, -0.6292799, 2.774267, 0, 0, 0, 1, 1,
0.2830044, 0.6344734, -0.8559323, 0, 0, 0, 1, 1,
0.2877593, -1.865324, 4.333844, 1, 1, 1, 1, 1,
0.2887764, -0.4679906, 2.789062, 1, 1, 1, 1, 1,
0.2895921, 1.003859, 1.575961, 1, 1, 1, 1, 1,
0.2907646, 0.4154935, 0.536225, 1, 1, 1, 1, 1,
0.2918769, 0.2654429, 0.8024699, 1, 1, 1, 1, 1,
0.2922774, -0.421549, 2.835745, 1, 1, 1, 1, 1,
0.2980842, 0.2755144, -0.9053954, 1, 1, 1, 1, 1,
0.2992958, -0.4312399, 4.056524, 1, 1, 1, 1, 1,
0.3055043, 0.38404, 0.3915704, 1, 1, 1, 1, 1,
0.307442, -1.605568, 2.899958, 1, 1, 1, 1, 1,
0.310176, 0.2779, 2.079993, 1, 1, 1, 1, 1,
0.3109259, 2.261748, -0.007712272, 1, 1, 1, 1, 1,
0.3116435, 1.346994, 0.6560968, 1, 1, 1, 1, 1,
0.3133221, -0.7546838, 2.976851, 1, 1, 1, 1, 1,
0.314928, 1.379191, 0.3250555, 1, 1, 1, 1, 1,
0.3159018, -0.3120802, 1.16399, 0, 0, 1, 1, 1,
0.3163817, 0.4732215, -0.6101326, 1, 0, 0, 1, 1,
0.3176726, -0.2367697, 2.033223, 1, 0, 0, 1, 1,
0.3179646, -0.9614947, 6.505377, 1, 0, 0, 1, 1,
0.3216794, -0.9252282, 3.299606, 1, 0, 0, 1, 1,
0.3260643, 0.1297041, 1.011256, 1, 0, 0, 1, 1,
0.3283356, -1.280936, 2.268974, 0, 0, 0, 1, 1,
0.3310663, 1.233303, 1.848187, 0, 0, 0, 1, 1,
0.3315821, -0.1248234, 1.203909, 0, 0, 0, 1, 1,
0.3326262, -0.8154885, 2.030932, 0, 0, 0, 1, 1,
0.3366918, 0.8636332, -1.487805, 0, 0, 0, 1, 1,
0.3385598, 0.2908058, 1.435641, 0, 0, 0, 1, 1,
0.3409528, -0.2308733, 3.836658, 0, 0, 0, 1, 1,
0.3429697, 0.9555632, 1.519493, 1, 1, 1, 1, 1,
0.3443232, 0.2983015, 1.489484, 1, 1, 1, 1, 1,
0.3455482, -0.5310411, 1.628194, 1, 1, 1, 1, 1,
0.3477687, 0.159493, 0.01412006, 1, 1, 1, 1, 1,
0.3545292, 0.9452928, -0.2702419, 1, 1, 1, 1, 1,
0.3595298, 2.017334, 0.09636798, 1, 1, 1, 1, 1,
0.3598592, -0.2271069, 2.652, 1, 1, 1, 1, 1,
0.3625272, 3.804835, 0.5491769, 1, 1, 1, 1, 1,
0.3653104, -1.082274, 1.703404, 1, 1, 1, 1, 1,
0.3693336, -0.5445746, 1.255912, 1, 1, 1, 1, 1,
0.3699406, 0.3090753, 4.278307, 1, 1, 1, 1, 1,
0.369985, -0.8367512, 2.308413, 1, 1, 1, 1, 1,
0.3714027, -0.7197204, 3.554576, 1, 1, 1, 1, 1,
0.3718626, -0.8766872, 2.960832, 1, 1, 1, 1, 1,
0.3718873, -0.8959293, 2.998815, 1, 1, 1, 1, 1,
0.3767832, -0.1104372, 0.9151948, 0, 0, 1, 1, 1,
0.3856734, -0.1884322, 1.201953, 1, 0, 0, 1, 1,
0.3866534, 0.1689867, 2.661062, 1, 0, 0, 1, 1,
0.3870854, -0.03554073, 3.203901, 1, 0, 0, 1, 1,
0.3908969, -0.09778649, 0.9790969, 1, 0, 0, 1, 1,
0.3938063, 0.1026009, 1.200925, 1, 0, 0, 1, 1,
0.3953605, -0.5530458, 1.921995, 0, 0, 0, 1, 1,
0.395897, 1.633882, -0.4151442, 0, 0, 0, 1, 1,
0.3985807, -0.6859803, 3.549476, 0, 0, 0, 1, 1,
0.4028162, 0.0525045, 1.282577, 0, 0, 0, 1, 1,
0.4058053, 0.30516, 0.9330319, 0, 0, 0, 1, 1,
0.405878, -0.04302524, 2.894366, 0, 0, 0, 1, 1,
0.4159652, 0.531802, 1.124284, 0, 0, 0, 1, 1,
0.4194242, 0.1102829, 3.354605, 1, 1, 1, 1, 1,
0.4227319, -0.8203416, 1.705461, 1, 1, 1, 1, 1,
0.4232243, -2.053958, 2.966858, 1, 1, 1, 1, 1,
0.4238716, -0.6308061, 1.578108, 1, 1, 1, 1, 1,
0.4243627, -0.4609, 1.711953, 1, 1, 1, 1, 1,
0.4253311, -0.3495023, 2.853765, 1, 1, 1, 1, 1,
0.4310146, -0.1051025, 1.242352, 1, 1, 1, 1, 1,
0.4310542, -0.6334679, 2.512996, 1, 1, 1, 1, 1,
0.4334926, 0.1412356, 0.4162043, 1, 1, 1, 1, 1,
0.438538, 0.329272, 0.7772557, 1, 1, 1, 1, 1,
0.4402809, -1.263919, 3.333599, 1, 1, 1, 1, 1,
0.4426674, -1.10383, 2.589749, 1, 1, 1, 1, 1,
0.4429744, 1.491255, -0.2036522, 1, 1, 1, 1, 1,
0.4440594, 0.3036543, 2.325383, 1, 1, 1, 1, 1,
0.4458831, -0.7758442, 3.028108, 1, 1, 1, 1, 1,
0.4481698, -0.6563176, 1.414239, 0, 0, 1, 1, 1,
0.4489512, -0.06963537, 2.315236, 1, 0, 0, 1, 1,
0.454388, -0.1558876, 2.558533, 1, 0, 0, 1, 1,
0.4553724, 0.4928581, 1.77587, 1, 0, 0, 1, 1,
0.4568314, -1.003621, 1.552598, 1, 0, 0, 1, 1,
0.4583057, 0.6540716, 1.572367, 1, 0, 0, 1, 1,
0.4611409, -0.07557446, 0.8144224, 0, 0, 0, 1, 1,
0.4614198, -1.388671, 2.085859, 0, 0, 0, 1, 1,
0.4655634, -1.590391, 3.451235, 0, 0, 0, 1, 1,
0.466331, -0.6376892, 2.196726, 0, 0, 0, 1, 1,
0.4694585, 0.3938797, -0.02462647, 0, 0, 0, 1, 1,
0.4723477, 0.6511665, 2.500889, 0, 0, 0, 1, 1,
0.4756097, 0.1069025, 0.478108, 0, 0, 0, 1, 1,
0.4861462, 0.9637039, -0.7195507, 1, 1, 1, 1, 1,
0.4863857, 2.79286, -1.296341, 1, 1, 1, 1, 1,
0.488238, -1.266466, 4.611972, 1, 1, 1, 1, 1,
0.4895684, -0.5643694, 3.092296, 1, 1, 1, 1, 1,
0.4938709, -0.6645188, 2.39572, 1, 1, 1, 1, 1,
0.4968692, 0.6377971, -0.7069747, 1, 1, 1, 1, 1,
0.5037976, -1.532911, 3.118617, 1, 1, 1, 1, 1,
0.5039879, 1.004884, 0.7887653, 1, 1, 1, 1, 1,
0.5067133, 0.0855641, 0.4286703, 1, 1, 1, 1, 1,
0.5075667, -0.2916222, 1.796533, 1, 1, 1, 1, 1,
0.5132087, -0.9083406, 3.903795, 1, 1, 1, 1, 1,
0.5133145, 0.9537434, -0.8463888, 1, 1, 1, 1, 1,
0.5135032, -2.02346, 3.018144, 1, 1, 1, 1, 1,
0.5169665, -0.2389802, 4.025918, 1, 1, 1, 1, 1,
0.5209815, 0.7051162, 0.1092843, 1, 1, 1, 1, 1,
0.5209864, -1.162773, 2.732586, 0, 0, 1, 1, 1,
0.5236455, -0.5421758, 2.42701, 1, 0, 0, 1, 1,
0.5241984, -1.816898, 1.657197, 1, 0, 0, 1, 1,
0.5266436, 0.8192939, -1.452845, 1, 0, 0, 1, 1,
0.5299355, 1.441969, -0.3521855, 1, 0, 0, 1, 1,
0.536282, -0.3212904, 2.329777, 1, 0, 0, 1, 1,
0.5390234, -0.2946569, 0.9872038, 0, 0, 0, 1, 1,
0.5425422, 0.3660303, 0.1930006, 0, 0, 0, 1, 1,
0.5443127, 0.6641993, -0.7061585, 0, 0, 0, 1, 1,
0.5464801, -0.5227785, 2.065817, 0, 0, 0, 1, 1,
0.5477358, -0.4240911, 2.350778, 0, 0, 0, 1, 1,
0.547784, 0.0602584, 1.049722, 0, 0, 0, 1, 1,
0.5494406, 0.4268555, 0.8483002, 0, 0, 0, 1, 1,
0.5496501, -0.1864625, 2.351269, 1, 1, 1, 1, 1,
0.5518575, -2.139152, 2.686344, 1, 1, 1, 1, 1,
0.5531338, 0.3586414, 0.4189896, 1, 1, 1, 1, 1,
0.5531348, -0.1330715, 2.892311, 1, 1, 1, 1, 1,
0.5544928, 0.5523045, 0.7467158, 1, 1, 1, 1, 1,
0.5547687, -0.2621894, 1.959969, 1, 1, 1, 1, 1,
0.5568568, 0.9083356, 1.499896, 1, 1, 1, 1, 1,
0.5580651, -0.1176591, 1.221883, 1, 1, 1, 1, 1,
0.5632448, 0.6071348, -0.7262913, 1, 1, 1, 1, 1,
0.5672286, -2.386383, 3.618768, 1, 1, 1, 1, 1,
0.5730448, 0.9311183, -1.538806, 1, 1, 1, 1, 1,
0.5752831, 0.5120108, -0.3256237, 1, 1, 1, 1, 1,
0.5778562, -0.2487813, 2.21322, 1, 1, 1, 1, 1,
0.589605, 1.040165, 0.2705166, 1, 1, 1, 1, 1,
0.5971048, -0.186794, 3.39593, 1, 1, 1, 1, 1,
0.5993329, -0.2373422, 2.413966, 0, 0, 1, 1, 1,
0.6015562, 1.570965, -0.8783795, 1, 0, 0, 1, 1,
0.6078986, 0.4247137, 1.148337, 1, 0, 0, 1, 1,
0.6097731, 0.568574, 1.308171, 1, 0, 0, 1, 1,
0.6111058, -0.3297722, 0.4309608, 1, 0, 0, 1, 1,
0.6143738, 3.078206, -0.1990956, 1, 0, 0, 1, 1,
0.6170345, 0.5141645, 0.03893303, 0, 0, 0, 1, 1,
0.6174152, -0.774106, 3.158517, 0, 0, 0, 1, 1,
0.6187807, 2.726308, -0.6365703, 0, 0, 0, 1, 1,
0.6249239, -0.8313142, 2.072693, 0, 0, 0, 1, 1,
0.6251252, -0.6042863, 1.207761, 0, 0, 0, 1, 1,
0.6306292, 1.15082, 0.05448137, 0, 0, 0, 1, 1,
0.6323717, -1.179207, 5.873268, 0, 0, 0, 1, 1,
0.632625, 1.902232, 0.228421, 1, 1, 1, 1, 1,
0.6326895, 0.2701856, -0.7750998, 1, 1, 1, 1, 1,
0.6335388, 1.438782, 0.4121764, 1, 1, 1, 1, 1,
0.6339956, -0.9293999, 2.43381, 1, 1, 1, 1, 1,
0.6350385, -0.6713268, 3.195381, 1, 1, 1, 1, 1,
0.6360274, 0.9375021, 0.4299963, 1, 1, 1, 1, 1,
0.6411648, 0.878848, 0.7372414, 1, 1, 1, 1, 1,
0.641221, 0.5426319, 1.803756, 1, 1, 1, 1, 1,
0.6425689, -0.5767064, 2.598883, 1, 1, 1, 1, 1,
0.6466813, 3.156204, -0.2391983, 1, 1, 1, 1, 1,
0.6483973, -1.928889, 2.234462, 1, 1, 1, 1, 1,
0.6575438, 2.233001, 0.3379168, 1, 1, 1, 1, 1,
0.6588606, -0.04106735, 0.9236572, 1, 1, 1, 1, 1,
0.6606828, -1.654868, 2.904531, 1, 1, 1, 1, 1,
0.6623536, -0.2452672, 1.780832, 1, 1, 1, 1, 1,
0.6638616, -0.9347547, 3.371934, 0, 0, 1, 1, 1,
0.6647962, -0.07200217, 2.060775, 1, 0, 0, 1, 1,
0.6696523, -1.199331, 2.499298, 1, 0, 0, 1, 1,
0.6709111, -1.974833, 1.216511, 1, 0, 0, 1, 1,
0.6709338, -0.2725853, 1.816906, 1, 0, 0, 1, 1,
0.6759564, -0.280849, 1.927099, 1, 0, 0, 1, 1,
0.6789194, 0.3980358, 0.02957796, 0, 0, 0, 1, 1,
0.6814932, 0.9213188, 0.4937713, 0, 0, 0, 1, 1,
0.6855552, 1.114975, 3.271321, 0, 0, 0, 1, 1,
0.6859112, -0.04301313, 2.01026, 0, 0, 0, 1, 1,
0.6941468, -1.607315, 4.157021, 0, 0, 0, 1, 1,
0.6943685, -1.333059, 1.842671, 0, 0, 0, 1, 1,
0.7059791, -1.696228, 2.326172, 0, 0, 0, 1, 1,
0.7068384, 0.5979067, 0.2348143, 1, 1, 1, 1, 1,
0.7081524, 0.04338246, 0.812155, 1, 1, 1, 1, 1,
0.7099566, -0.2741831, 2.233821, 1, 1, 1, 1, 1,
0.7147437, 0.9831395, 2.59907, 1, 1, 1, 1, 1,
0.7154052, 0.1197194, 1.073031, 1, 1, 1, 1, 1,
0.7170158, -0.1699005, 1.533813, 1, 1, 1, 1, 1,
0.7228244, -0.8020291, 3.673154, 1, 1, 1, 1, 1,
0.7234164, -0.355237, 1.666072, 1, 1, 1, 1, 1,
0.7248342, -1.603873, 2.938067, 1, 1, 1, 1, 1,
0.7251258, 0.3003139, 1.772462, 1, 1, 1, 1, 1,
0.7365165, -0.2331739, 1.729611, 1, 1, 1, 1, 1,
0.7381153, -0.04566776, 0.3846048, 1, 1, 1, 1, 1,
0.744725, -0.8517567, 3.807889, 1, 1, 1, 1, 1,
0.7477642, -1.777005, 2.250971, 1, 1, 1, 1, 1,
0.74957, 0.06769743, 1.95469, 1, 1, 1, 1, 1,
0.7501755, 2.449455, -0.8920102, 0, 0, 1, 1, 1,
0.751019, 0.9967957, 0.8631639, 1, 0, 0, 1, 1,
0.7551645, 1.234654, 1.329104, 1, 0, 0, 1, 1,
0.7587782, -0.7843557, 0.1851337, 1, 0, 0, 1, 1,
0.7687746, 0.09310258, -0.07458524, 1, 0, 0, 1, 1,
0.7723283, -0.8442331, 2.162133, 1, 0, 0, 1, 1,
0.7751025, 1.26989, 0.5899983, 0, 0, 0, 1, 1,
0.7851949, -0.7393135, 3.077356, 0, 0, 0, 1, 1,
0.7859638, 0.1861527, 1.166764, 0, 0, 0, 1, 1,
0.786801, -0.4846095, 2.334188, 0, 0, 0, 1, 1,
0.7913008, 0.1251207, 2.050568, 0, 0, 0, 1, 1,
0.796798, 0.3529592, -0.1406956, 0, 0, 0, 1, 1,
0.7983989, 1.910577, 1.38319, 0, 0, 0, 1, 1,
0.7999544, 0.9896344, -0.7883095, 1, 1, 1, 1, 1,
0.8078965, 0.07329608, 2.842904, 1, 1, 1, 1, 1,
0.8081395, -1.293997, 1.208648, 1, 1, 1, 1, 1,
0.8087517, 1.747945, 2.175635, 1, 1, 1, 1, 1,
0.8105656, 0.4484493, 1.147103, 1, 1, 1, 1, 1,
0.8107214, 1.020459, 0.9235019, 1, 1, 1, 1, 1,
0.8117592, 0.7916938, -1.070049, 1, 1, 1, 1, 1,
0.8140283, -0.8131294, 2.173744, 1, 1, 1, 1, 1,
0.8164001, -0.1834372, 0.08600592, 1, 1, 1, 1, 1,
0.8181933, 0.2183659, 0.410945, 1, 1, 1, 1, 1,
0.827529, 0.1263898, 4.101251, 1, 1, 1, 1, 1,
0.83078, 0.8931531, 0.4726004, 1, 1, 1, 1, 1,
0.835357, -2.084003, 2.676649, 1, 1, 1, 1, 1,
0.83808, 0.6944463, 1.675986, 1, 1, 1, 1, 1,
0.8386721, -1.67396, 2.215368, 1, 1, 1, 1, 1,
0.8412704, -2.202735, 3.766732, 0, 0, 1, 1, 1,
0.8444168, -0.0849748, 1.506031, 1, 0, 0, 1, 1,
0.8469534, 0.8503642, 0.5407721, 1, 0, 0, 1, 1,
0.8507043, -1.228614, -0.447531, 1, 0, 0, 1, 1,
0.8520548, 0.9962952, 0.8415204, 1, 0, 0, 1, 1,
0.8537152, 0.6017157, 1.496016, 1, 0, 0, 1, 1,
0.8564743, -0.5489799, 0.2219678, 0, 0, 0, 1, 1,
0.8641542, 0.003465696, 0.3587755, 0, 0, 0, 1, 1,
0.8708128, -1.849689, 1.358164, 0, 0, 0, 1, 1,
0.8724035, -0.1174383, 2.532766, 0, 0, 0, 1, 1,
0.874226, 2.129389, -1.706378, 0, 0, 0, 1, 1,
0.8880159, -0.4059021, 2.35568, 0, 0, 0, 1, 1,
0.8900928, -0.1450265, 1.346203, 0, 0, 0, 1, 1,
0.8938504, 1.070423, -0.3347828, 1, 1, 1, 1, 1,
0.8945611, 0.2609479, 1.079014, 1, 1, 1, 1, 1,
0.8969376, -0.5775594, 2.90488, 1, 1, 1, 1, 1,
0.8993883, -0.5536534, -0.7861448, 1, 1, 1, 1, 1,
0.9051178, -0.05662986, 2.380147, 1, 1, 1, 1, 1,
0.9062758, 1.292347, 1.164188, 1, 1, 1, 1, 1,
0.9064533, -1.098647, 4.011023, 1, 1, 1, 1, 1,
0.9105992, -0.07018988, 0.6299188, 1, 1, 1, 1, 1,
0.9106395, -0.7668674, 1.957811, 1, 1, 1, 1, 1,
0.911147, -2.660538, 2.645032, 1, 1, 1, 1, 1,
0.9117541, -0.2847555, 2.510133, 1, 1, 1, 1, 1,
0.9144034, -1.185932, 1.857379, 1, 1, 1, 1, 1,
0.9165426, -1.481998, 3.342479, 1, 1, 1, 1, 1,
0.925693, 2.204993, 1.626641, 1, 1, 1, 1, 1,
0.9259054, 0.6038417, 0.5887322, 1, 1, 1, 1, 1,
0.9301848, 1.75509, -1.128105, 0, 0, 1, 1, 1,
0.9324391, 0.7810194, 1.89046, 1, 0, 0, 1, 1,
0.9341762, 1.672806, 1.559639, 1, 0, 0, 1, 1,
0.9398159, -0.7906846, 2.256121, 1, 0, 0, 1, 1,
0.9429457, -0.452612, 0.1857947, 1, 0, 0, 1, 1,
0.9433447, 1.480296, 1.325511, 1, 0, 0, 1, 1,
0.9451402, 0.01118753, 3.146084, 0, 0, 0, 1, 1,
0.9526296, 0.2521286, 0.9809706, 0, 0, 0, 1, 1,
0.9565274, 0.7200836, -1.469262, 0, 0, 0, 1, 1,
0.9763989, 0.4591628, 1.16836, 0, 0, 0, 1, 1,
0.976625, 1.104114, 0.2048958, 0, 0, 0, 1, 1,
0.9786589, -0.5799789, 0.9832648, 0, 0, 0, 1, 1,
0.9803773, -0.3602818, 3.214123, 0, 0, 0, 1, 1,
0.9853035, 1.362281, -0.6039534, 1, 1, 1, 1, 1,
0.9857025, 1.056708, -0.6707225, 1, 1, 1, 1, 1,
0.9860714, 0.8889315, 3.116354, 1, 1, 1, 1, 1,
0.9942802, 0.9362379, -0.7055188, 1, 1, 1, 1, 1,
0.9943373, -0.2632768, 2.115543, 1, 1, 1, 1, 1,
1.004738, 0.7430077, 0.347726, 1, 1, 1, 1, 1,
1.010112, 0.2332523, 1.623245, 1, 1, 1, 1, 1,
1.012738, 0.8751722, 1.179205, 1, 1, 1, 1, 1,
1.01356, 0.5418777, 1.290184, 1, 1, 1, 1, 1,
1.022344, 0.0933966, 0.8318295, 1, 1, 1, 1, 1,
1.023725, -1.868657, 1.675473, 1, 1, 1, 1, 1,
1.02418, 0.9206322, -0.2444402, 1, 1, 1, 1, 1,
1.03254, 1.682114, 1.382884, 1, 1, 1, 1, 1,
1.036193, -1.314809, 2.358949, 1, 1, 1, 1, 1,
1.037946, 0.2152337, 0.5083668, 1, 1, 1, 1, 1,
1.038938, 0.4271873, 2.783529, 0, 0, 1, 1, 1,
1.040306, 0.5369903, 1.905234, 1, 0, 0, 1, 1,
1.042291, -0.9789246, 2.363445, 1, 0, 0, 1, 1,
1.049953, -0.7026277, 1.336286, 1, 0, 0, 1, 1,
1.063019, -0.6705644, 2.779058, 1, 0, 0, 1, 1,
1.063672, 0.0873212, 2.167432, 1, 0, 0, 1, 1,
1.064236, -0.3147152, 2.895493, 0, 0, 0, 1, 1,
1.067217, 2.117265, 1.279791, 0, 0, 0, 1, 1,
1.067665, -0.06264663, 1.305345, 0, 0, 0, 1, 1,
1.072978, 0.6679524, 0.863448, 0, 0, 0, 1, 1,
1.082831, 1.832936, 0.7762058, 0, 0, 0, 1, 1,
1.082944, -0.9261233, 2.387247, 0, 0, 0, 1, 1,
1.083885, 0.01681018, 1.255324, 0, 0, 0, 1, 1,
1.087975, -0.3251246, 0.03190538, 1, 1, 1, 1, 1,
1.093378, 1.221193, 3.275251, 1, 1, 1, 1, 1,
1.099163, 0.2132485, 2.886886, 1, 1, 1, 1, 1,
1.126995, 0.1297354, -0.08004757, 1, 1, 1, 1, 1,
1.128108, 1.219416, 1.50164, 1, 1, 1, 1, 1,
1.134973, 0.1885757, 1.267979, 1, 1, 1, 1, 1,
1.135453, 0.06587255, 3.013065, 1, 1, 1, 1, 1,
1.139502, -0.04441572, -0.1329352, 1, 1, 1, 1, 1,
1.145517, 1.496205, 1.023287, 1, 1, 1, 1, 1,
1.1499, -0.4758852, -0.5149403, 1, 1, 1, 1, 1,
1.162458, -1.536395, 1.12985, 1, 1, 1, 1, 1,
1.164017, 0.02212201, 0.9546037, 1, 1, 1, 1, 1,
1.16892, 0.8175374, 2.362948, 1, 1, 1, 1, 1,
1.171449, -0.184878, 1.091694, 1, 1, 1, 1, 1,
1.172651, -0.3576927, 1.555685, 1, 1, 1, 1, 1,
1.176708, 0.835144, 1.424157, 0, 0, 1, 1, 1,
1.182957, -0.7897606, 1.337884, 1, 0, 0, 1, 1,
1.186452, -0.1173176, 2.439528, 1, 0, 0, 1, 1,
1.187662, -2.299875, 1.422962, 1, 0, 0, 1, 1,
1.190439, 0.08285014, 2.109994, 1, 0, 0, 1, 1,
1.192281, -0.7268079, 2.747837, 1, 0, 0, 1, 1,
1.203371, -0.5087152, 3.531409, 0, 0, 0, 1, 1,
1.211502, 0.2005585, 2.667392, 0, 0, 0, 1, 1,
1.226293, -0.2853544, 1.971814, 0, 0, 0, 1, 1,
1.234154, -0.1984198, 0.7036598, 0, 0, 0, 1, 1,
1.255843, -0.2111201, 2.689211, 0, 0, 0, 1, 1,
1.256671, 1.796232, 2.589636, 0, 0, 0, 1, 1,
1.267636, -0.05827415, 2.092516, 0, 0, 0, 1, 1,
1.270198, -0.1781852, 1.459665, 1, 1, 1, 1, 1,
1.273397, 0.07245271, 2.302229, 1, 1, 1, 1, 1,
1.288141, -0.7093461, 1.805646, 1, 1, 1, 1, 1,
1.290187, -2.833845, 3.871553, 1, 1, 1, 1, 1,
1.31154, -0.3373233, 0.9372639, 1, 1, 1, 1, 1,
1.34101, -0.4580449, 2.010305, 1, 1, 1, 1, 1,
1.344355, -0.8785224, 3.146445, 1, 1, 1, 1, 1,
1.346993, -1.312994, 2.542226, 1, 1, 1, 1, 1,
1.349398, -1.502307, 1.270361, 1, 1, 1, 1, 1,
1.361053, 0.8955504, 1.813781, 1, 1, 1, 1, 1,
1.362021, 0.979965, 0.3773367, 1, 1, 1, 1, 1,
1.362437, 0.09168489, 0.4699057, 1, 1, 1, 1, 1,
1.369278, -1.067504, 1.901668, 1, 1, 1, 1, 1,
1.374108, 2.762998, 0.3089334, 1, 1, 1, 1, 1,
1.398601, -0.4525521, 1.280466, 1, 1, 1, 1, 1,
1.420136, 0.3545514, 0.4552664, 0, 0, 1, 1, 1,
1.435976, -0.7466653, 2.578785, 1, 0, 0, 1, 1,
1.436158, -0.2613121, 3.762066, 1, 0, 0, 1, 1,
1.465001, -0.1739029, 1.018004, 1, 0, 0, 1, 1,
1.471702, -0.5402259, 1.821357, 1, 0, 0, 1, 1,
1.478906, -1.410033, 3.097937, 1, 0, 0, 1, 1,
1.497167, 0.4531068, -0.003067156, 0, 0, 0, 1, 1,
1.499469, 0.5514196, 0.8608702, 0, 0, 0, 1, 1,
1.50196, -0.1078348, 1.9417, 0, 0, 0, 1, 1,
1.503169, 0.3424287, 1.680349, 0, 0, 0, 1, 1,
1.506651, -0.3272007, 1.384121, 0, 0, 0, 1, 1,
1.511183, -1.848436, 2.123144, 0, 0, 0, 1, 1,
1.526101, -0.4280176, 0.7031425, 0, 0, 0, 1, 1,
1.54564, -0.7932634, 3.466604, 1, 1, 1, 1, 1,
1.546874, -0.5536967, 2.308551, 1, 1, 1, 1, 1,
1.561715, -0.5734904, 2.874545, 1, 1, 1, 1, 1,
1.56497, 0.6941616, 2.176872, 1, 1, 1, 1, 1,
1.565167, -0.5325897, 3.242446, 1, 1, 1, 1, 1,
1.57229, -0.3653362, 3.138856, 1, 1, 1, 1, 1,
1.600638, -0.02077438, 0.5344366, 1, 1, 1, 1, 1,
1.607144, 1.620986, 0.4167914, 1, 1, 1, 1, 1,
1.613605, -1.056517, 1.926451, 1, 1, 1, 1, 1,
1.625718, 0.2060712, 2.707334, 1, 1, 1, 1, 1,
1.630409, 0.183726, 2.539423, 1, 1, 1, 1, 1,
1.631613, -1.578863, 2.674552, 1, 1, 1, 1, 1,
1.636134, -0.06487346, 2.771207, 1, 1, 1, 1, 1,
1.638827, 0.3664458, 0.9828071, 1, 1, 1, 1, 1,
1.643247, 0.7271736, 2.117451, 1, 1, 1, 1, 1,
1.648167, -1.107657, 3.305146, 0, 0, 1, 1, 1,
1.666497, 0.3109584, 2.86642, 1, 0, 0, 1, 1,
1.671596, 1.256871, 0.6310902, 1, 0, 0, 1, 1,
1.676099, 0.03190409, 2.535963, 1, 0, 0, 1, 1,
1.684278, 1.92771, 2.748972, 1, 0, 0, 1, 1,
1.686302, -0.9389191, 3.12045, 1, 0, 0, 1, 1,
1.686815, -1.858019, 1.517334, 0, 0, 0, 1, 1,
1.69252, -1.394729, 3.590749, 0, 0, 0, 1, 1,
1.697583, -0.7615029, 3.089606, 0, 0, 0, 1, 1,
1.702174, -0.6780466, 1.279749, 0, 0, 0, 1, 1,
1.71967, 1.295227, 1.973976, 0, 0, 0, 1, 1,
1.721676, -0.7511617, 2.099668, 0, 0, 0, 1, 1,
1.721819, 0.1827796, 0.2815079, 0, 0, 0, 1, 1,
1.728964, -0.3426378, 0.898311, 1, 1, 1, 1, 1,
1.730914, -0.9245555, 1.708154, 1, 1, 1, 1, 1,
1.731315, -0.5279863, 0.7446917, 1, 1, 1, 1, 1,
1.73823, -0.1147099, 1.327759, 1, 1, 1, 1, 1,
1.754873, 1.330066, 0.4325649, 1, 1, 1, 1, 1,
1.762633, -0.04727619, 2.050092, 1, 1, 1, 1, 1,
1.844281, -0.4181376, 0.4713251, 1, 1, 1, 1, 1,
1.855699, -0.03881064, -0.7539317, 1, 1, 1, 1, 1,
1.892162, 0.1960083, 2.454811, 1, 1, 1, 1, 1,
1.904601, -2.429948, 1.826778, 1, 1, 1, 1, 1,
1.905295, -1.789127, 2.377845, 1, 1, 1, 1, 1,
1.906871, 1.745744, 1.354918, 1, 1, 1, 1, 1,
1.92161, 1.087789, 2.001283, 1, 1, 1, 1, 1,
1.948779, -0.4657396, 2.188408, 1, 1, 1, 1, 1,
1.95935, -0.6988391, 0.1675085, 1, 1, 1, 1, 1,
1.960788, -1.764701, 2.505343, 0, 0, 1, 1, 1,
1.963183, -1.429656, 1.86289, 1, 0, 0, 1, 1,
1.973036, 0.4051545, 0.0885227, 1, 0, 0, 1, 1,
1.980022, 0.7667916, 0.4420286, 1, 0, 0, 1, 1,
1.988986, -1.419008, 2.425149, 1, 0, 0, 1, 1,
2.007638, 1.083753, 2.160712, 1, 0, 0, 1, 1,
2.021822, -0.6109228, 2.798668, 0, 0, 0, 1, 1,
2.023922, 0.2102641, 2.661379, 0, 0, 0, 1, 1,
2.067317, -0.9773069, 2.114133, 0, 0, 0, 1, 1,
2.086936, -0.8063884, 3.179837, 0, 0, 0, 1, 1,
2.184357, -1.394432, 2.841145, 0, 0, 0, 1, 1,
2.260031, 0.4137621, 1.868133, 0, 0, 0, 1, 1,
2.288103, 0.1480059, 2.435627, 0, 0, 0, 1, 1,
2.375605, -2.96434, 3.737858, 1, 1, 1, 1, 1,
2.397588, 2.509971, 2.1343, 1, 1, 1, 1, 1,
2.444707, 1.117079, 0.6238318, 1, 1, 1, 1, 1,
2.587496, 0.2112804, 2.569362, 1, 1, 1, 1, 1,
2.642831, 1.316527, 2.147086, 1, 1, 1, 1, 1,
2.873294, 0.3528879, 0.6779115, 1, 1, 1, 1, 1,
2.930866, 2.212747, 0.9800138, 1, 1, 1, 1, 1
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
var radius = 9.869916;
var distance = 34.66766;
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
mvMatrix.translate( -0.05293059, -0.4202477, -0.7049749 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.66766);
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
