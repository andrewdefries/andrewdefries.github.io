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
-2.928923, -0.8942429, -1.359217, 1, 0, 0, 1,
-2.654052, -0.5557476, -2.184447, 1, 0.007843138, 0, 1,
-2.554538, -0.7984519, -0.9256812, 1, 0.01176471, 0, 1,
-2.539842, 1.674695, -1.44579, 1, 0.01960784, 0, 1,
-2.515407, -1.224889, -2.534146, 1, 0.02352941, 0, 1,
-2.514141, -0.2994401, -1.721533, 1, 0.03137255, 0, 1,
-2.435039, 1.71167, -0.2676236, 1, 0.03529412, 0, 1,
-2.384963, -0.4282513, -2.791262, 1, 0.04313726, 0, 1,
-2.340546, -0.08453634, -0.6263545, 1, 0.04705882, 0, 1,
-2.333152, 0.5052487, 0.3572068, 1, 0.05490196, 0, 1,
-2.323799, -1.81134, -4.121427, 1, 0.05882353, 0, 1,
-2.300884, -1.050923, -3.521108, 1, 0.06666667, 0, 1,
-2.233392, -0.5334403, -3.579541, 1, 0.07058824, 0, 1,
-2.21879, 0.03041391, -2.627735, 1, 0.07843138, 0, 1,
-2.211378, 1.464488, -2.833875, 1, 0.08235294, 0, 1,
-2.182193, 1.219572, -0.5349825, 1, 0.09019608, 0, 1,
-2.155324, -0.1924021, -2.417773, 1, 0.09411765, 0, 1,
-2.144959, 1.469498, -0.2255334, 1, 0.1019608, 0, 1,
-2.139549, 1.880253, -0.9104319, 1, 0.1098039, 0, 1,
-2.136848, -0.02869394, -0.2755449, 1, 0.1137255, 0, 1,
-2.134977, 1.075489, -0.9735023, 1, 0.1215686, 0, 1,
-2.126575, 0.4216955, -1.552625, 1, 0.1254902, 0, 1,
-2.105832, -0.3820487, -3.191069, 1, 0.1333333, 0, 1,
-2.095577, 0.7513359, -0.5449253, 1, 0.1372549, 0, 1,
-2.093209, 1.525295, 0.1989416, 1, 0.145098, 0, 1,
-2.090745, 0.9262928, -1.818799, 1, 0.1490196, 0, 1,
-2.068729, -1.059026, -2.845613, 1, 0.1568628, 0, 1,
-1.969969, 0.1282927, -0.9123127, 1, 0.1607843, 0, 1,
-1.945764, 0.8640641, -1.332611, 1, 0.1686275, 0, 1,
-1.935938, -0.353212, -2.394487, 1, 0.172549, 0, 1,
-1.922205, -0.2166537, 0.2863285, 1, 0.1803922, 0, 1,
-1.921537, -1.072881, -2.190206, 1, 0.1843137, 0, 1,
-1.898022, 0.4754041, -1.427193, 1, 0.1921569, 0, 1,
-1.892254, -1.438863, -1.549404, 1, 0.1960784, 0, 1,
-1.884042, 0.3049519, -2.6842, 1, 0.2039216, 0, 1,
-1.876307, 2.036452, -0.4346586, 1, 0.2117647, 0, 1,
-1.867674, 0.696982, -2.50926, 1, 0.2156863, 0, 1,
-1.85182, -0.8920591, -2.746781, 1, 0.2235294, 0, 1,
-1.844204, 0.00980367, -2.447307, 1, 0.227451, 0, 1,
-1.843255, 0.5110306, -1.01928, 1, 0.2352941, 0, 1,
-1.833047, 1.40586, 0.4422461, 1, 0.2392157, 0, 1,
-1.829154, 1.294115, -1.0958, 1, 0.2470588, 0, 1,
-1.754421, -0.2382684, -2.662337, 1, 0.2509804, 0, 1,
-1.720382, -0.931389, -1.35889, 1, 0.2588235, 0, 1,
-1.716581, 0.400797, -3.053837, 1, 0.2627451, 0, 1,
-1.708462, 0.6322533, -1.327346, 1, 0.2705882, 0, 1,
-1.703118, -0.1958372, -1.057083, 1, 0.2745098, 0, 1,
-1.701548, -1.933728, -1.445713, 1, 0.282353, 0, 1,
-1.695873, -0.7375314, -2.384674, 1, 0.2862745, 0, 1,
-1.683844, 0.2262235, -2.552653, 1, 0.2941177, 0, 1,
-1.663319, -1.624479, -1.042463, 1, 0.3019608, 0, 1,
-1.661539, 1.266186, -0.9902195, 1, 0.3058824, 0, 1,
-1.660318, -0.712322, -1.763, 1, 0.3137255, 0, 1,
-1.652013, 1.208581, -1.097494, 1, 0.3176471, 0, 1,
-1.649384, 1.423984, -1.446214, 1, 0.3254902, 0, 1,
-1.643419, -0.1112716, -2.234455, 1, 0.3294118, 0, 1,
-1.632231, 1.630882, -0.1421162, 1, 0.3372549, 0, 1,
-1.630098, 0.7543832, -0.6864988, 1, 0.3411765, 0, 1,
-1.621906, 0.922437, 0.3956527, 1, 0.3490196, 0, 1,
-1.617241, -0.1844366, 0.4776628, 1, 0.3529412, 0, 1,
-1.615436, 0.8925263, 0.4298068, 1, 0.3607843, 0, 1,
-1.608417, 0.4636661, -1.388199, 1, 0.3647059, 0, 1,
-1.602731, -1.600737, -2.823103, 1, 0.372549, 0, 1,
-1.598836, -2.420741, -2.668351, 1, 0.3764706, 0, 1,
-1.593523, 0.5337561, -1.065182, 1, 0.3843137, 0, 1,
-1.59333, -0.7643905, -2.135406, 1, 0.3882353, 0, 1,
-1.552244, -0.8206809, 0.2653524, 1, 0.3960784, 0, 1,
-1.543228, 0.4133192, 1.240156, 1, 0.4039216, 0, 1,
-1.532335, 1.625805, 0.09697966, 1, 0.4078431, 0, 1,
-1.521202, -0.3142663, -0.4942148, 1, 0.4156863, 0, 1,
-1.517897, 0.6582408, -1.464889, 1, 0.4196078, 0, 1,
-1.511781, 2.707089, -0.1687298, 1, 0.427451, 0, 1,
-1.510052, 0.4873938, 0.1845794, 1, 0.4313726, 0, 1,
-1.506222, 0.05318923, -0.9394119, 1, 0.4392157, 0, 1,
-1.485783, -0.8949233, -2.014655, 1, 0.4431373, 0, 1,
-1.484877, -0.3353575, -1.572047, 1, 0.4509804, 0, 1,
-1.47277, 0.8398907, 1.666891, 1, 0.454902, 0, 1,
-1.469297, -0.3048405, -1.698682, 1, 0.4627451, 0, 1,
-1.465257, -0.1071799, -1.481304, 1, 0.4666667, 0, 1,
-1.46364, 0.08675749, -2.407674, 1, 0.4745098, 0, 1,
-1.461577, 0.9402364, -1.082723, 1, 0.4784314, 0, 1,
-1.448525, 0.3118769, 1.345665, 1, 0.4862745, 0, 1,
-1.43881, -0.3332891, -0.6138622, 1, 0.4901961, 0, 1,
-1.438522, 0.09273364, -3.236259, 1, 0.4980392, 0, 1,
-1.437929, 1.284315, -1.228158, 1, 0.5058824, 0, 1,
-1.437766, 0.3976676, -0.7928577, 1, 0.509804, 0, 1,
-1.42432, 0.1787351, -2.732133, 1, 0.5176471, 0, 1,
-1.416152, 1.431823, 1.188855, 1, 0.5215687, 0, 1,
-1.414218, 0.3016349, -1.012088, 1, 0.5294118, 0, 1,
-1.412382, 0.3174027, -2.045605, 1, 0.5333334, 0, 1,
-1.404113, 2.736123, -1.13774, 1, 0.5411765, 0, 1,
-1.398751, 0.794598, -1.860129, 1, 0.5450981, 0, 1,
-1.398394, 0.2020247, -4.136978, 1, 0.5529412, 0, 1,
-1.397446, 0.1200401, -1.098957, 1, 0.5568628, 0, 1,
-1.394832, 1.763308, -1.694478, 1, 0.5647059, 0, 1,
-1.391781, 0.1104801, -2.411085, 1, 0.5686275, 0, 1,
-1.390583, -0.6511182, -1.310676, 1, 0.5764706, 0, 1,
-1.385078, -0.07307877, -1.881878, 1, 0.5803922, 0, 1,
-1.384138, 1.023127, -0.8989032, 1, 0.5882353, 0, 1,
-1.381985, 1.421927, -0.3998093, 1, 0.5921569, 0, 1,
-1.364681, -0.7329111, -2.152989, 1, 0.6, 0, 1,
-1.332356, 1.240704, 0.3951245, 1, 0.6078432, 0, 1,
-1.328753, 0.07721571, -0.5609946, 1, 0.6117647, 0, 1,
-1.326494, -1.479883, -1.606782, 1, 0.6196079, 0, 1,
-1.314926, 1.551411, -0.9610126, 1, 0.6235294, 0, 1,
-1.303802, 0.4726658, -0.5518151, 1, 0.6313726, 0, 1,
-1.299345, 0.8683029, 0.8208944, 1, 0.6352941, 0, 1,
-1.291677, 1.131007, -0.9428061, 1, 0.6431373, 0, 1,
-1.289036, 0.08042424, -1.034054, 1, 0.6470588, 0, 1,
-1.287204, -0.7824793, -1.548843, 1, 0.654902, 0, 1,
-1.285296, -1.146916, -3.496727, 1, 0.6588235, 0, 1,
-1.275974, -0.6225176, -2.744034, 1, 0.6666667, 0, 1,
-1.275582, -1.190193, -2.535322, 1, 0.6705883, 0, 1,
-1.274367, -0.8357783, -3.349575, 1, 0.6784314, 0, 1,
-1.271117, -0.6382669, -1.665658, 1, 0.682353, 0, 1,
-1.271062, -0.6895646, -2.881133, 1, 0.6901961, 0, 1,
-1.264008, -0.6778128, -2.304586, 1, 0.6941177, 0, 1,
-1.261765, 0.589151, -2.301111, 1, 0.7019608, 0, 1,
-1.25542, -1.730824, -1.348981, 1, 0.7098039, 0, 1,
-1.247697, 0.5332482, -1.95908, 1, 0.7137255, 0, 1,
-1.246881, 0.5916983, -0.9053887, 1, 0.7215686, 0, 1,
-1.242502, 0.07447093, -0.3929986, 1, 0.7254902, 0, 1,
-1.230097, 2.894547, -0.6721958, 1, 0.7333333, 0, 1,
-1.202177, 0.3700673, -0.5411816, 1, 0.7372549, 0, 1,
-1.196269, 0.2685196, -2.346014, 1, 0.7450981, 0, 1,
-1.163247, 1.925747, -3.033163, 1, 0.7490196, 0, 1,
-1.159452, -0.0791578, -1.884488, 1, 0.7568628, 0, 1,
-1.155208, -0.7467689, -1.739626, 1, 0.7607843, 0, 1,
-1.14795, -0.02375885, -1.569197, 1, 0.7686275, 0, 1,
-1.145719, 0.5920857, -0.1673333, 1, 0.772549, 0, 1,
-1.145359, 0.1766499, -1.612365, 1, 0.7803922, 0, 1,
-1.144699, 0.3519416, -1.133409, 1, 0.7843137, 0, 1,
-1.129692, 0.7744627, -0.2893573, 1, 0.7921569, 0, 1,
-1.123214, 0.6715679, -1.573378, 1, 0.7960784, 0, 1,
-1.122183, 0.3347661, -1.05983, 1, 0.8039216, 0, 1,
-1.121709, 0.19177, 1.831752, 1, 0.8117647, 0, 1,
-1.121406, -0.698518, -2.660539, 1, 0.8156863, 0, 1,
-1.116098, -0.743817, -1.547227, 1, 0.8235294, 0, 1,
-1.098476, 0.03648054, -4.187986, 1, 0.827451, 0, 1,
-1.09427, 0.9949409, 0.01241707, 1, 0.8352941, 0, 1,
-1.090951, -0.3322762, -1.501937, 1, 0.8392157, 0, 1,
-1.0904, 1.273341, 0.1044028, 1, 0.8470588, 0, 1,
-1.087593, 0.0412982, -1.91894, 1, 0.8509804, 0, 1,
-1.087578, -0.3605992, -0.4353341, 1, 0.8588235, 0, 1,
-1.072466, -0.7104427, -1.763525, 1, 0.8627451, 0, 1,
-1.067135, 0.0779442, -1.781678, 1, 0.8705882, 0, 1,
-1.065474, -1.182834, -3.197792, 1, 0.8745098, 0, 1,
-1.057792, -0.3369462, -1.184199, 1, 0.8823529, 0, 1,
-1.051489, -1.959174, -1.047435, 1, 0.8862745, 0, 1,
-1.045062, -0.1993648, -3.295022, 1, 0.8941177, 0, 1,
-1.044264, -1.746032, -3.315753, 1, 0.8980392, 0, 1,
-1.039684, -0.7139636, -2.044672, 1, 0.9058824, 0, 1,
-1.035944, -1.121794, -1.633088, 1, 0.9137255, 0, 1,
-1.032047, 0.2567472, 0.8314235, 1, 0.9176471, 0, 1,
-1.019585, -1.523886, -2.662229, 1, 0.9254902, 0, 1,
-1.016672, 1.179079, -0.1915038, 1, 0.9294118, 0, 1,
-1.011997, 0.5692645, -2.277009, 1, 0.9372549, 0, 1,
-1.01009, -0.4710688, -1.306832, 1, 0.9411765, 0, 1,
-1.008073, -0.7629974, -2.636577, 1, 0.9490196, 0, 1,
-1.005537, -1.16178, -2.329618, 1, 0.9529412, 0, 1,
-1.00478, -0.2839622, -3.798905, 1, 0.9607843, 0, 1,
-1.000237, -0.2683477, -2.143872, 1, 0.9647059, 0, 1,
-0.986314, 1.347008, 0.06406152, 1, 0.972549, 0, 1,
-0.9763957, 0.7808704, -1.862226, 1, 0.9764706, 0, 1,
-0.9707287, -0.4168374, -2.617922, 1, 0.9843137, 0, 1,
-0.9669884, 1.318865, -0.8115734, 1, 0.9882353, 0, 1,
-0.9624823, 0.9574531, -1.246486, 1, 0.9960784, 0, 1,
-0.9601394, 0.01107898, -2.077265, 0.9960784, 1, 0, 1,
-0.958164, 0.4472178, -0.186682, 0.9921569, 1, 0, 1,
-0.9470134, -0.4065694, 0.4739559, 0.9843137, 1, 0, 1,
-0.9466051, -0.5713283, -1.083737, 0.9803922, 1, 0, 1,
-0.9462206, 0.4256993, 0.3906377, 0.972549, 1, 0, 1,
-0.945847, -0.2044493, -1.234807, 0.9686275, 1, 0, 1,
-0.9450048, -0.7475963, -4.348176, 0.9607843, 1, 0, 1,
-0.9448864, 0.09703442, -1.277031, 0.9568627, 1, 0, 1,
-0.9431566, 0.3547604, -1.713565, 0.9490196, 1, 0, 1,
-0.9407784, -1.066273, -2.640928, 0.945098, 1, 0, 1,
-0.9404125, 0.9896123, -1.365465, 0.9372549, 1, 0, 1,
-0.9399748, -0.2298031, -1.750497, 0.9333333, 1, 0, 1,
-0.9313245, 0.01782299, -1.656283, 0.9254902, 1, 0, 1,
-0.9269558, -0.7051377, -0.8858054, 0.9215686, 1, 0, 1,
-0.9234269, 0.1012559, -0.755473, 0.9137255, 1, 0, 1,
-0.9185076, 0.7820545, -0.8986608, 0.9098039, 1, 0, 1,
-0.9110941, 1.151309, -1.381395, 0.9019608, 1, 0, 1,
-0.9034974, 0.508385, -0.2849917, 0.8941177, 1, 0, 1,
-0.9001757, 0.4884103, -1.74247, 0.8901961, 1, 0, 1,
-0.8986363, 1.572534, -0.2439004, 0.8823529, 1, 0, 1,
-0.8977601, -0.3445064, -2.03899, 0.8784314, 1, 0, 1,
-0.8969883, -0.7084506, -1.343362, 0.8705882, 1, 0, 1,
-0.8907181, -0.01894287, -1.520232, 0.8666667, 1, 0, 1,
-0.885861, 0.5205722, -2.28557, 0.8588235, 1, 0, 1,
-0.8841041, 0.3775356, -1.877534, 0.854902, 1, 0, 1,
-0.8833011, 1.336069, -1.699989, 0.8470588, 1, 0, 1,
-0.8780479, -0.701074, -2.597954, 0.8431373, 1, 0, 1,
-0.8774289, -0.5939696, -0.4207751, 0.8352941, 1, 0, 1,
-0.8772295, -0.93261, -1.997818, 0.8313726, 1, 0, 1,
-0.8765851, 2.480903, -1.42384, 0.8235294, 1, 0, 1,
-0.8694053, -1.26828, -1.500417, 0.8196079, 1, 0, 1,
-0.8679162, -1.534333, -3.748724, 0.8117647, 1, 0, 1,
-0.8660855, -0.02993645, -2.566344, 0.8078431, 1, 0, 1,
-0.8611847, 0.4544186, 0.9364255, 0.8, 1, 0, 1,
-0.8603434, 1.010537, -2.369124, 0.7921569, 1, 0, 1,
-0.8580644, -2.211345, -2.767889, 0.7882353, 1, 0, 1,
-0.8497643, -0.1161202, -2.42995, 0.7803922, 1, 0, 1,
-0.8474376, 0.4323264, -0.6343892, 0.7764706, 1, 0, 1,
-0.8421052, 1.380181, -0.5141569, 0.7686275, 1, 0, 1,
-0.8226272, 1.872295, 0.2306126, 0.7647059, 1, 0, 1,
-0.8223879, -2.414093, -3.951484, 0.7568628, 1, 0, 1,
-0.8219475, 0.9607975, -0.6358833, 0.7529412, 1, 0, 1,
-0.8216121, 0.3538672, -2.745597, 0.7450981, 1, 0, 1,
-0.8161091, -0.4829634, -0.5368997, 0.7411765, 1, 0, 1,
-0.814466, 1.868863, -0.152855, 0.7333333, 1, 0, 1,
-0.8115217, 0.4653313, -2.521927, 0.7294118, 1, 0, 1,
-0.809193, -0.721297, -2.20155, 0.7215686, 1, 0, 1,
-0.8077352, -1.05787, -3.152895, 0.7176471, 1, 0, 1,
-0.8058778, -0.2829468, -1.916472, 0.7098039, 1, 0, 1,
-0.8019831, -0.3653308, -1.724286, 0.7058824, 1, 0, 1,
-0.8005698, 0.7540435, -0.8237388, 0.6980392, 1, 0, 1,
-0.7930738, 2.128243, -0.8057153, 0.6901961, 1, 0, 1,
-0.7888122, 0.3729008, -2.560695, 0.6862745, 1, 0, 1,
-0.7873833, -1.440719, -1.729778, 0.6784314, 1, 0, 1,
-0.7859479, 1.411143, 1.117077, 0.6745098, 1, 0, 1,
-0.7851644, 0.06707232, -1.927362, 0.6666667, 1, 0, 1,
-0.7851641, -0.1083699, -1.353983, 0.6627451, 1, 0, 1,
-0.7821568, -0.05894889, -1.101082, 0.654902, 1, 0, 1,
-0.7755909, -1.802282, -2.741075, 0.6509804, 1, 0, 1,
-0.7713264, 0.1485799, 0.7294359, 0.6431373, 1, 0, 1,
-0.7707465, 0.8170056, -0.6245334, 0.6392157, 1, 0, 1,
-0.7580859, 1.649782, 0.1795691, 0.6313726, 1, 0, 1,
-0.7579281, 0.9058639, -0.07436913, 0.627451, 1, 0, 1,
-0.7442476, -3.705953, -2.163246, 0.6196079, 1, 0, 1,
-0.7426071, -0.3500018, -1.895783, 0.6156863, 1, 0, 1,
-0.7382871, 0.3064128, -1.036206, 0.6078432, 1, 0, 1,
-0.7306744, 2.314701, 0.09939254, 0.6039216, 1, 0, 1,
-0.7303599, 0.1613913, -1.982901, 0.5960785, 1, 0, 1,
-0.7301984, 0.2574926, -1.52028, 0.5882353, 1, 0, 1,
-0.7245495, -0.412975, -1.813295, 0.5843138, 1, 0, 1,
-0.720417, -0.8874561, -3.48154, 0.5764706, 1, 0, 1,
-0.7196742, 0.8256658, -1.925687, 0.572549, 1, 0, 1,
-0.7087948, 0.2383621, -1.601884, 0.5647059, 1, 0, 1,
-0.7082851, -0.1327516, -1.350931, 0.5607843, 1, 0, 1,
-0.6988708, -0.1779723, -3.04194, 0.5529412, 1, 0, 1,
-0.6976804, -0.6428062, -1.576401, 0.5490196, 1, 0, 1,
-0.6916495, 0.4426855, -1.733149, 0.5411765, 1, 0, 1,
-0.6914338, -1.007229, -2.573487, 0.5372549, 1, 0, 1,
-0.6775253, 1.413802, 0.9122198, 0.5294118, 1, 0, 1,
-0.6766292, 1.570306, 0.04310178, 0.5254902, 1, 0, 1,
-0.6568579, -1.163267, -2.227271, 0.5176471, 1, 0, 1,
-0.6557488, -0.6480178, -1.522043, 0.5137255, 1, 0, 1,
-0.6526736, 0.09982482, 0.2148505, 0.5058824, 1, 0, 1,
-0.6521723, -0.0619634, -1.362566, 0.5019608, 1, 0, 1,
-0.6482304, 1.567095, -1.477419, 0.4941176, 1, 0, 1,
-0.6445193, -1.483468, -3.135942, 0.4862745, 1, 0, 1,
-0.6419444, 1.475114, -0.5800105, 0.4823529, 1, 0, 1,
-0.6389825, -0.3388044, -1.958686, 0.4745098, 1, 0, 1,
-0.6344245, 0.07024128, 0.5074661, 0.4705882, 1, 0, 1,
-0.6343409, -0.53846, -1.999542, 0.4627451, 1, 0, 1,
-0.6277723, 0.3415219, -1.319476, 0.4588235, 1, 0, 1,
-0.6229065, 1.35317, 1.27363, 0.4509804, 1, 0, 1,
-0.6211655, 0.4403749, -1.737355, 0.4470588, 1, 0, 1,
-0.6114191, -0.3447592, -2.100998, 0.4392157, 1, 0, 1,
-0.6109722, -1.683045, -2.337724, 0.4352941, 1, 0, 1,
-0.6107672, -0.7617381, -1.386924, 0.427451, 1, 0, 1,
-0.6101406, 1.643753, -1.146103, 0.4235294, 1, 0, 1,
-0.602502, -0.7281064, -3.75454, 0.4156863, 1, 0, 1,
-0.6023048, 1.291048, -1.673546, 0.4117647, 1, 0, 1,
-0.5985038, 1.92056, -0.6036798, 0.4039216, 1, 0, 1,
-0.5973762, 2.457945, 0.5750574, 0.3960784, 1, 0, 1,
-0.5854977, 0.3296681, -0.1073874, 0.3921569, 1, 0, 1,
-0.5846695, -1.032367, -1.490652, 0.3843137, 1, 0, 1,
-0.5807417, 2.150839, -0.9627904, 0.3803922, 1, 0, 1,
-0.5786876, 1.425399, -1.504414, 0.372549, 1, 0, 1,
-0.5767695, 1.38413, 0.6992838, 0.3686275, 1, 0, 1,
-0.5763523, -0.01454046, -2.591096, 0.3607843, 1, 0, 1,
-0.5718497, 0.01990126, -1.110185, 0.3568628, 1, 0, 1,
-0.5697574, 0.9655313, 1.080577, 0.3490196, 1, 0, 1,
-0.5696577, 0.01672994, -0.8371815, 0.345098, 1, 0, 1,
-0.5652533, 1.185283, -1.1283, 0.3372549, 1, 0, 1,
-0.564806, 0.4757988, -0.4350489, 0.3333333, 1, 0, 1,
-0.5609553, 0.2374994, -1.029755, 0.3254902, 1, 0, 1,
-0.5607998, -0.5618677, -2.130872, 0.3215686, 1, 0, 1,
-0.5584908, 0.05410364, -1.559334, 0.3137255, 1, 0, 1,
-0.5559795, -0.8726032, -0.5919935, 0.3098039, 1, 0, 1,
-0.5519076, 0.67056, 0.3950997, 0.3019608, 1, 0, 1,
-0.5491042, -1.633029, -2.306976, 0.2941177, 1, 0, 1,
-0.5486175, 0.3552154, -0.509204, 0.2901961, 1, 0, 1,
-0.5486054, -0.5965052, -0.5410484, 0.282353, 1, 0, 1,
-0.5455788, -0.4766928, -2.051, 0.2784314, 1, 0, 1,
-0.5398343, -1.522797, -1.387835, 0.2705882, 1, 0, 1,
-0.5395002, 1.657451, -0.9105116, 0.2666667, 1, 0, 1,
-0.5350339, -0.1969953, -2.923801, 0.2588235, 1, 0, 1,
-0.5346171, -1.31229, -0.9170143, 0.254902, 1, 0, 1,
-0.5331228, -1.08785, -3.203168, 0.2470588, 1, 0, 1,
-0.5302924, -1.787939, -3.441669, 0.2431373, 1, 0, 1,
-0.5216855, 0.2827778, -0.4918211, 0.2352941, 1, 0, 1,
-0.5179316, 0.6653005, 0.02308992, 0.2313726, 1, 0, 1,
-0.5176504, -1.48522, -4.044909, 0.2235294, 1, 0, 1,
-0.5147774, -0.8786015, -2.175341, 0.2196078, 1, 0, 1,
-0.5108097, 0.05809912, -1.598109, 0.2117647, 1, 0, 1,
-0.5061065, -0.6975328, -3.210713, 0.2078431, 1, 0, 1,
-0.5025371, 0.5057426, -0.9351488, 0.2, 1, 0, 1,
-0.5018402, 0.6365715, -1.292449, 0.1921569, 1, 0, 1,
-0.5010646, -0.3413005, -2.100936, 0.1882353, 1, 0, 1,
-0.4942529, -0.1206457, -0.8643229, 0.1803922, 1, 0, 1,
-0.4935548, 0.08562325, -0.5778936, 0.1764706, 1, 0, 1,
-0.4900762, 1.706678, -1.469229, 0.1686275, 1, 0, 1,
-0.4853028, 2.098876, -1.069089, 0.1647059, 1, 0, 1,
-0.4800876, -0.04082291, -0.7289713, 0.1568628, 1, 0, 1,
-0.4790235, -1.353211, -2.809164, 0.1529412, 1, 0, 1,
-0.4755532, -0.5987675, -2.019789, 0.145098, 1, 0, 1,
-0.4742222, 1.524623, -1.290363, 0.1411765, 1, 0, 1,
-0.474103, 1.7197, -0.665511, 0.1333333, 1, 0, 1,
-0.4665174, 0.328564, -1.765604, 0.1294118, 1, 0, 1,
-0.4660687, -0.319213, -1.304585, 0.1215686, 1, 0, 1,
-0.4590801, 1.311259, -0.5523702, 0.1176471, 1, 0, 1,
-0.4578109, 0.1610505, -1.958044, 0.1098039, 1, 0, 1,
-0.4546437, -0.5607257, -3.27898, 0.1058824, 1, 0, 1,
-0.4535287, 0.6716079, -2.034889, 0.09803922, 1, 0, 1,
-0.4513948, 1.611698, 1.122264, 0.09019608, 1, 0, 1,
-0.4509489, 0.7315252, 0.726927, 0.08627451, 1, 0, 1,
-0.439404, 0.1497453, -1.335982, 0.07843138, 1, 0, 1,
-0.4387772, -0.03741167, -2.091879, 0.07450981, 1, 0, 1,
-0.4381365, -0.8560051, -2.597954, 0.06666667, 1, 0, 1,
-0.4286789, 0.009096567, -1.215429, 0.0627451, 1, 0, 1,
-0.4134887, 2.202147, -0.8721483, 0.05490196, 1, 0, 1,
-0.4092404, 1.142664, -0.2788808, 0.05098039, 1, 0, 1,
-0.40633, 0.8729247, -0.2384743, 0.04313726, 1, 0, 1,
-0.3972818, -1.45761, -3.139062, 0.03921569, 1, 0, 1,
-0.3968889, 1.195002, 0.919835, 0.03137255, 1, 0, 1,
-0.3910238, -0.1386426, -1.838635, 0.02745098, 1, 0, 1,
-0.3902559, -0.5349951, -3.154216, 0.01960784, 1, 0, 1,
-0.3841482, 0.9351454, -0.1527298, 0.01568628, 1, 0, 1,
-0.3828233, 0.8550539, -0.9809062, 0.007843138, 1, 0, 1,
-0.3823508, -0.6252257, -3.096296, 0.003921569, 1, 0, 1,
-0.3822075, -0.06047957, -0.846414, 0, 1, 0.003921569, 1,
-0.3794379, 0.5259479, 0.8779412, 0, 1, 0.01176471, 1,
-0.3793564, -0.3402548, -2.302363, 0, 1, 0.01568628, 1,
-0.3792679, -1.414007, -1.607011, 0, 1, 0.02352941, 1,
-0.3744227, 0.08205198, -0.5528706, 0, 1, 0.02745098, 1,
-0.3742965, 0.5755011, -1.648492, 0, 1, 0.03529412, 1,
-0.3642406, 0.3602385, -1.469605, 0, 1, 0.03921569, 1,
-0.3556973, -0.1545083, -1.322571, 0, 1, 0.04705882, 1,
-0.3556844, 0.4925844, -0.934085, 0, 1, 0.05098039, 1,
-0.3548769, -0.09393547, -1.65854, 0, 1, 0.05882353, 1,
-0.3525691, -1.315499, -2.802266, 0, 1, 0.0627451, 1,
-0.3503697, 2.303409, 0.2143388, 0, 1, 0.07058824, 1,
-0.350324, 1.635808, 0.1126895, 0, 1, 0.07450981, 1,
-0.3452218, 0.6989399, -0.07371044, 0, 1, 0.08235294, 1,
-0.3445959, 1.146092, 1.605544, 0, 1, 0.08627451, 1,
-0.3396875, -0.7358564, -2.293059, 0, 1, 0.09411765, 1,
-0.3370984, 1.742878, -0.4278053, 0, 1, 0.1019608, 1,
-0.3368562, -0.2568704, -1.236878, 0, 1, 0.1058824, 1,
-0.3368488, 2.291514, -0.2401781, 0, 1, 0.1137255, 1,
-0.3361109, -0.1667136, -0.7934445, 0, 1, 0.1176471, 1,
-0.3359594, 1.034078, -1.023802, 0, 1, 0.1254902, 1,
-0.3337534, 0.1794578, 0.1475335, 0, 1, 0.1294118, 1,
-0.3310588, -0.2199657, -2.424166, 0, 1, 0.1372549, 1,
-0.3299115, -1.347782, -2.806786, 0, 1, 0.1411765, 1,
-0.3282305, -0.2968277, -1.939271, 0, 1, 0.1490196, 1,
-0.3258508, 0.3194684, -2.043181, 0, 1, 0.1529412, 1,
-0.3252005, -2.378806, -3.014009, 0, 1, 0.1607843, 1,
-0.3164686, -1.414617, -2.086643, 0, 1, 0.1647059, 1,
-0.314381, -0.7540551, -5.017113, 0, 1, 0.172549, 1,
-0.2992057, 2.052691, 0.07876624, 0, 1, 0.1764706, 1,
-0.2983305, 0.01034396, -0.9640301, 0, 1, 0.1843137, 1,
-0.2937267, -1.525095, -1.048996, 0, 1, 0.1882353, 1,
-0.2889143, -1.869755, -3.519796, 0, 1, 0.1960784, 1,
-0.2840793, 0.9286234, 0.3351967, 0, 1, 0.2039216, 1,
-0.2774845, 0.09818429, -2.749054, 0, 1, 0.2078431, 1,
-0.2753358, -0.04346368, -1.468051, 0, 1, 0.2156863, 1,
-0.273238, -0.489026, -0.3501117, 0, 1, 0.2196078, 1,
-0.2731296, 2.000773, 0.5199632, 0, 1, 0.227451, 1,
-0.2726647, -0.9664777, -2.511865, 0, 1, 0.2313726, 1,
-0.2685015, 0.6820365, 1.982505, 0, 1, 0.2392157, 1,
-0.2615964, -0.3945384, -3.523448, 0, 1, 0.2431373, 1,
-0.2607715, -1.415276, -2.192104, 0, 1, 0.2509804, 1,
-0.2548007, 2.028578, -1.48762, 0, 1, 0.254902, 1,
-0.2546401, -0.1229921, -1.224087, 0, 1, 0.2627451, 1,
-0.2493107, -0.0540205, -1.989963, 0, 1, 0.2666667, 1,
-0.2486878, 2.463667, 0.3062374, 0, 1, 0.2745098, 1,
-0.2466717, 0.7124557, -0.9030179, 0, 1, 0.2784314, 1,
-0.2463655, -0.4763435, -2.730613, 0, 1, 0.2862745, 1,
-0.2462866, -0.001630159, -1.455626, 0, 1, 0.2901961, 1,
-0.2427372, 0.7624671, -0.9136617, 0, 1, 0.2980392, 1,
-0.2376395, -1.02099, -3.639788, 0, 1, 0.3058824, 1,
-0.2371968, 0.6018435, -2.122311, 0, 1, 0.3098039, 1,
-0.2318635, 1.084036, -0.7234298, 0, 1, 0.3176471, 1,
-0.2274082, 0.1582701, -0.1352192, 0, 1, 0.3215686, 1,
-0.2266816, 0.2046757, 0.429034, 0, 1, 0.3294118, 1,
-0.2261575, -0.5094984, -2.1243, 0, 1, 0.3333333, 1,
-0.2248252, 1.20691, -1.076617, 0, 1, 0.3411765, 1,
-0.2200938, -0.1531616, -1.187217, 0, 1, 0.345098, 1,
-0.2197874, -3.003215, -3.392378, 0, 1, 0.3529412, 1,
-0.2188106, 0.7201065, 0.341454, 0, 1, 0.3568628, 1,
-0.2170452, 2.141396, -0.4350641, 0, 1, 0.3647059, 1,
-0.216547, 1.306833, -0.1587189, 0, 1, 0.3686275, 1,
-0.2139396, 0.03924024, -0.9293699, 0, 1, 0.3764706, 1,
-0.2135898, 0.8284576, 0.08326668, 0, 1, 0.3803922, 1,
-0.2134593, -0.4840736, -2.906899, 0, 1, 0.3882353, 1,
-0.2133263, 0.6884185, 0.8529264, 0, 1, 0.3921569, 1,
-0.2085963, 0.8503909, 0.1428146, 0, 1, 0.4, 1,
-0.2073424, 0.05275134, 0.7174869, 0, 1, 0.4078431, 1,
-0.2054199, 0.5721521, -1.1609, 0, 1, 0.4117647, 1,
-0.2030557, 0.3240489, -1.943124, 0, 1, 0.4196078, 1,
-0.2027371, 0.2109998, -0.4309358, 0, 1, 0.4235294, 1,
-0.1928619, -0.349498, -1.525822, 0, 1, 0.4313726, 1,
-0.1859488, 0.8226197, 0.558576, 0, 1, 0.4352941, 1,
-0.1857121, -1.199179, -3.084993, 0, 1, 0.4431373, 1,
-0.1826448, -0.3769758, -3.872492, 0, 1, 0.4470588, 1,
-0.1813492, -0.9821408, -2.604308, 0, 1, 0.454902, 1,
-0.1795341, 1.880043, 1.949439, 0, 1, 0.4588235, 1,
-0.1756497, 0.1901614, -1.710732, 0, 1, 0.4666667, 1,
-0.1744612, -1.533257, -3.925465, 0, 1, 0.4705882, 1,
-0.1735083, 0.9032018, -1.723807, 0, 1, 0.4784314, 1,
-0.1726454, 2.276485, 0.281532, 0, 1, 0.4823529, 1,
-0.1618365, 1.709349, 0.9438692, 0, 1, 0.4901961, 1,
-0.1540763, 0.4575429, -0.8734035, 0, 1, 0.4941176, 1,
-0.149023, 1.257285, 0.4224916, 0, 1, 0.5019608, 1,
-0.1467009, -1.074243, -3.950438, 0, 1, 0.509804, 1,
-0.1372564, -2.084876, -2.558072, 0, 1, 0.5137255, 1,
-0.1365256, 0.1629996, -2.701251, 0, 1, 0.5215687, 1,
-0.1331205, 0.2108164, -2.015486, 0, 1, 0.5254902, 1,
-0.1315184, -1.103557, -2.596344, 0, 1, 0.5333334, 1,
-0.1292515, 0.03412285, -1.285582, 0, 1, 0.5372549, 1,
-0.1273246, 0.05265639, 0.1527724, 0, 1, 0.5450981, 1,
-0.1266932, 0.03576554, 0.621512, 0, 1, 0.5490196, 1,
-0.1262445, 0.2161369, -0.2114477, 0, 1, 0.5568628, 1,
-0.1260419, 1.371341, 0.0870655, 0, 1, 0.5607843, 1,
-0.1254502, 0.09987847, -1.455027, 0, 1, 0.5686275, 1,
-0.1238854, 0.5762511, 0.2325346, 0, 1, 0.572549, 1,
-0.1197868, 0.8762654, 0.9657348, 0, 1, 0.5803922, 1,
-0.1160689, -0.5298352, -2.647782, 0, 1, 0.5843138, 1,
-0.1119145, 0.6864574, -0.2144891, 0, 1, 0.5921569, 1,
-0.1118357, 0.6174165, 2.967779, 0, 1, 0.5960785, 1,
-0.1094443, 0.9120634, 0.1474702, 0, 1, 0.6039216, 1,
-0.1087313, -0.148697, -3.196859, 0, 1, 0.6117647, 1,
-0.1057363, 0.03358429, -0.1601542, 0, 1, 0.6156863, 1,
-0.101818, 0.1745589, 0.9739692, 0, 1, 0.6235294, 1,
-0.0996334, -0.6101804, -1.28165, 0, 1, 0.627451, 1,
-0.09855598, -1.219765, -1.674333, 0, 1, 0.6352941, 1,
-0.09506688, 1.385228, 0.1941063, 0, 1, 0.6392157, 1,
-0.09275977, -1.525654, -3.524327, 0, 1, 0.6470588, 1,
-0.09263952, -0.8047401, -2.10423, 0, 1, 0.6509804, 1,
-0.09241959, -0.96203, -3.762599, 0, 1, 0.6588235, 1,
-0.09219652, -0.4208775, -2.678358, 0, 1, 0.6627451, 1,
-0.09086107, 1.736375, 1.570459, 0, 1, 0.6705883, 1,
-0.08724324, -1.140038, -2.261625, 0, 1, 0.6745098, 1,
-0.08258244, -1.601275, -2.956306, 0, 1, 0.682353, 1,
-0.08172321, -0.7717685, -1.282161, 0, 1, 0.6862745, 1,
-0.08138707, 1.032142, 0.8478408, 0, 1, 0.6941177, 1,
-0.07846382, -1.285023, -3.286409, 0, 1, 0.7019608, 1,
-0.07518898, -0.6718165, -3.492333, 0, 1, 0.7058824, 1,
-0.07259043, 1.29859, 0.6001299, 0, 1, 0.7137255, 1,
-0.06895944, 0.2950998, 0.05333184, 0, 1, 0.7176471, 1,
-0.06863537, -0.6440177, -2.205962, 0, 1, 0.7254902, 1,
-0.06748629, 1.391252, -0.7027868, 0, 1, 0.7294118, 1,
-0.06651582, 0.004075666, -2.672581, 0, 1, 0.7372549, 1,
-0.0599579, -0.4811213, -2.36401, 0, 1, 0.7411765, 1,
-0.0583217, -0.2308108, -1.607771, 0, 1, 0.7490196, 1,
-0.05518881, -0.1385027, -3.039425, 0, 1, 0.7529412, 1,
-0.05169307, 0.1781083, 0.6729639, 0, 1, 0.7607843, 1,
-0.05159321, -0.5462928, -4.865215, 0, 1, 0.7647059, 1,
-0.04901808, -1.166378, -1.948281, 0, 1, 0.772549, 1,
-0.04848654, 0.6060375, -0.5583879, 0, 1, 0.7764706, 1,
-0.04627322, -0.322054, -3.307005, 0, 1, 0.7843137, 1,
-0.04593047, 1.16465, -2.092813, 0, 1, 0.7882353, 1,
-0.0448015, -1.712449, -4.159241, 0, 1, 0.7960784, 1,
-0.04106745, -0.6964233, -3.312655, 0, 1, 0.8039216, 1,
-0.03775461, 0.4135188, -0.009252347, 0, 1, 0.8078431, 1,
-0.0361301, -1.804054, -3.094945, 0, 1, 0.8156863, 1,
-0.02687918, 1.628266, -2.102756, 0, 1, 0.8196079, 1,
-0.02615257, -1.429101, -2.867655, 0, 1, 0.827451, 1,
-0.02058, 0.6085229, -0.394429, 0, 1, 0.8313726, 1,
-0.02051285, -0.9831709, -4.868467, 0, 1, 0.8392157, 1,
-0.01749647, 0.3914227, -0.2426814, 0, 1, 0.8431373, 1,
-0.01419219, -0.6324567, -4.071103, 0, 1, 0.8509804, 1,
-0.0101511, -0.1759495, -2.598123, 0, 1, 0.854902, 1,
-0.009759129, 0.05524018, 0.8555976, 0, 1, 0.8627451, 1,
-0.004745468, 0.1266765, -0.7315457, 0, 1, 0.8666667, 1,
-0.004206426, 1.101905, 2.249244, 0, 1, 0.8745098, 1,
-0.001854198, 0.5969981, 0.3718172, 0, 1, 0.8784314, 1,
-0.0008824182, -1.166481, -4.863473, 0, 1, 0.8862745, 1,
-0.0001268139, 0.2014219, -0.6614097, 0, 1, 0.8901961, 1,
0.002269794, -0.04022431, 3.31773, 0, 1, 0.8980392, 1,
0.002561098, -0.9078609, 1.967459, 0, 1, 0.9058824, 1,
0.003990334, -2.046932, 3.436347, 0, 1, 0.9098039, 1,
0.005539801, 0.494829, -1.975093, 0, 1, 0.9176471, 1,
0.01309294, -0.3346919, 3.120561, 0, 1, 0.9215686, 1,
0.01399067, -0.9079831, 2.474551, 0, 1, 0.9294118, 1,
0.02226888, -0.3438683, 3.332647, 0, 1, 0.9333333, 1,
0.02458321, -0.0665003, 0.835178, 0, 1, 0.9411765, 1,
0.02496697, -1.401789, 3.200371, 0, 1, 0.945098, 1,
0.03331116, -2.049486, 1.584817, 0, 1, 0.9529412, 1,
0.03354511, -1.396467, 0.784562, 0, 1, 0.9568627, 1,
0.03499996, 0.7874429, 1.491439, 0, 1, 0.9647059, 1,
0.03756671, -0.08291795, 2.705807, 0, 1, 0.9686275, 1,
0.03778405, 0.7805602, -0.922981, 0, 1, 0.9764706, 1,
0.03980785, -0.6243798, 2.653951, 0, 1, 0.9803922, 1,
0.04185471, -1.447155, 0.9688874, 0, 1, 0.9882353, 1,
0.04594877, 0.6732774, -0.0170573, 0, 1, 0.9921569, 1,
0.04649422, 0.08031419, 1.048326, 0, 1, 1, 1,
0.05488642, 0.5763953, -0.04376041, 0, 0.9921569, 1, 1,
0.05900647, 0.3361571, -0.3112348, 0, 0.9882353, 1, 1,
0.06689016, 2.514429, -0.1257933, 0, 0.9803922, 1, 1,
0.07023983, -1.901, 3.223299, 0, 0.9764706, 1, 1,
0.07029447, 1.13149, -0.0971907, 0, 0.9686275, 1, 1,
0.07275452, 0.3204636, -0.2728013, 0, 0.9647059, 1, 1,
0.07358301, 0.2999365, 0.6049412, 0, 0.9568627, 1, 1,
0.07972772, 0.7241948, 0.4069377, 0, 0.9529412, 1, 1,
0.08203929, 0.7231453, 2.011784, 0, 0.945098, 1, 1,
0.08233707, 0.5431948, 0.6157761, 0, 0.9411765, 1, 1,
0.0866207, 0.7540757, 1.054345, 0, 0.9333333, 1, 1,
0.08983029, -0.9803841, 3.49541, 0, 0.9294118, 1, 1,
0.09032148, 0.4792587, -0.5795878, 0, 0.9215686, 1, 1,
0.0914425, -0.1291793, 2.126527, 0, 0.9176471, 1, 1,
0.09213728, -0.4708922, 4.764363, 0, 0.9098039, 1, 1,
0.09230877, -1.352482, 2.761666, 0, 0.9058824, 1, 1,
0.09255367, -0.8874485, 4.347945, 0, 0.8980392, 1, 1,
0.09466197, -1.576068, 4.336669, 0, 0.8901961, 1, 1,
0.09760712, -0.07135873, 0.9345283, 0, 0.8862745, 1, 1,
0.1040368, 1.856794, -0.990613, 0, 0.8784314, 1, 1,
0.1074984, 1.174189, 0.4057078, 0, 0.8745098, 1, 1,
0.1076396, 1.985127, -0.6942608, 0, 0.8666667, 1, 1,
0.1128691, -0.5291777, 2.704024, 0, 0.8627451, 1, 1,
0.1129794, 0.7564964, -0.4718161, 0, 0.854902, 1, 1,
0.1130584, 0.6218687, 1.229944, 0, 0.8509804, 1, 1,
0.1160341, 1.398709, 0.3373296, 0, 0.8431373, 1, 1,
0.1170756, -0.4652254, 3.96578, 0, 0.8392157, 1, 1,
0.1207693, 1.561558, 1.628564, 0, 0.8313726, 1, 1,
0.1215307, 0.001229864, 2.369783, 0, 0.827451, 1, 1,
0.1227844, 0.5871068, 0.08631512, 0, 0.8196079, 1, 1,
0.1231789, -1.967179, 4.260174, 0, 0.8156863, 1, 1,
0.1246414, -0.3199261, 4.327968, 0, 0.8078431, 1, 1,
0.1271208, -0.1203625, 2.692944, 0, 0.8039216, 1, 1,
0.1303217, 0.061708, -0.2739237, 0, 0.7960784, 1, 1,
0.1315821, -1.258111, 4.101141, 0, 0.7882353, 1, 1,
0.1410773, 0.6804382, -0.03663047, 0, 0.7843137, 1, 1,
0.1411783, -1.358028, 2.654482, 0, 0.7764706, 1, 1,
0.1426727, 0.1219835, 1.206422, 0, 0.772549, 1, 1,
0.1427758, 0.1176987, 0.6241436, 0, 0.7647059, 1, 1,
0.1453425, -1.142393, 3.942592, 0, 0.7607843, 1, 1,
0.1456055, 0.1699517, 0.9339081, 0, 0.7529412, 1, 1,
0.1493227, -0.551466, 1.74173, 0, 0.7490196, 1, 1,
0.1501207, 0.4100696, 0.5887265, 0, 0.7411765, 1, 1,
0.1634761, 1.093374, 0.4525246, 0, 0.7372549, 1, 1,
0.1651891, -0.2845088, 1.979189, 0, 0.7294118, 1, 1,
0.1678489, -0.07738066, 3.252075, 0, 0.7254902, 1, 1,
0.1690987, 0.3877584, -1.99316, 0, 0.7176471, 1, 1,
0.1735631, 0.9849512, 0.3262793, 0, 0.7137255, 1, 1,
0.1748258, -0.2587994, 1.87776, 0, 0.7058824, 1, 1,
0.1753526, -0.835561, 2.400167, 0, 0.6980392, 1, 1,
0.1756031, 0.7373318, 0.7797496, 0, 0.6941177, 1, 1,
0.1790293, 0.4356569, 0.3896693, 0, 0.6862745, 1, 1,
0.1831058, -0.2132403, 2.203524, 0, 0.682353, 1, 1,
0.1843548, 0.5783427, -0.06532844, 0, 0.6745098, 1, 1,
0.1878745, -1.308921, 2.03423, 0, 0.6705883, 1, 1,
0.1895239, 0.2005132, 1.305423, 0, 0.6627451, 1, 1,
0.1904238, 0.5772864, 1.28597, 0, 0.6588235, 1, 1,
0.1963777, -0.9231182, 3.389172, 0, 0.6509804, 1, 1,
0.1980751, -0.8225827, 3.604053, 0, 0.6470588, 1, 1,
0.2047404, -1.05346, 4.00322, 0, 0.6392157, 1, 1,
0.2049457, -0.8649928, 2.939017, 0, 0.6352941, 1, 1,
0.2073392, -0.7433944, 1.520248, 0, 0.627451, 1, 1,
0.2090953, -1.950272, 1.952785, 0, 0.6235294, 1, 1,
0.2097286, 0.02342516, 2.862739, 0, 0.6156863, 1, 1,
0.2119373, 1.034798, 1.101331, 0, 0.6117647, 1, 1,
0.2126422, -0.7196976, 3.850608, 0, 0.6039216, 1, 1,
0.2140669, -1.727897, 2.874365, 0, 0.5960785, 1, 1,
0.214338, 0.9523539, -1.088401, 0, 0.5921569, 1, 1,
0.217535, 0.411222, 1.164101, 0, 0.5843138, 1, 1,
0.2204589, -0.1898043, 1.109209, 0, 0.5803922, 1, 1,
0.2215556, 0.277428, 0.5367744, 0, 0.572549, 1, 1,
0.2224521, 0.3732059, 1.677178, 0, 0.5686275, 1, 1,
0.2237253, -0.6885203, 3.156611, 0, 0.5607843, 1, 1,
0.2256356, 0.4618061, 0.7735763, 0, 0.5568628, 1, 1,
0.2272385, -0.3687626, 1.60902, 0, 0.5490196, 1, 1,
0.2287876, -0.3653578, -0.3781181, 0, 0.5450981, 1, 1,
0.2319532, -0.478891, 3.619845, 0, 0.5372549, 1, 1,
0.2344721, 0.9506626, 0.7273571, 0, 0.5333334, 1, 1,
0.2363386, -1.646514, 1.422318, 0, 0.5254902, 1, 1,
0.2386325, 1.035215, 0.4133709, 0, 0.5215687, 1, 1,
0.2395836, 0.4124336, 0.4346568, 0, 0.5137255, 1, 1,
0.2399545, 1.299328, 0.6575028, 0, 0.509804, 1, 1,
0.240596, -0.4190274, 3.712298, 0, 0.5019608, 1, 1,
0.2438092, 0.4092855, -1.211962, 0, 0.4941176, 1, 1,
0.246248, 1.298104, -0.5024697, 0, 0.4901961, 1, 1,
0.2506024, 0.4177925, 0.100985, 0, 0.4823529, 1, 1,
0.2527827, 0.6511518, -0.5281731, 0, 0.4784314, 1, 1,
0.2528819, 0.1190746, 0.9539962, 0, 0.4705882, 1, 1,
0.2534712, -0.06150542, 1.676718, 0, 0.4666667, 1, 1,
0.2591987, -2.875982, 2.132551, 0, 0.4588235, 1, 1,
0.2608629, -1.800615, 5.062816, 0, 0.454902, 1, 1,
0.2611142, 0.5056711, -1.807595, 0, 0.4470588, 1, 1,
0.261605, 0.1422176, 0.4943959, 0, 0.4431373, 1, 1,
0.2638322, -0.5246321, 1.643394, 0, 0.4352941, 1, 1,
0.2681527, 0.1008236, 2.687715, 0, 0.4313726, 1, 1,
0.2682238, 1.168037, -0.2593909, 0, 0.4235294, 1, 1,
0.2700377, -0.3873709, 3.62304, 0, 0.4196078, 1, 1,
0.2747867, 1.04892, -0.5144324, 0, 0.4117647, 1, 1,
0.2749, 0.5752048, 0.9086485, 0, 0.4078431, 1, 1,
0.2760917, -0.03504404, 2.191247, 0, 0.4, 1, 1,
0.2772761, -1.945473, 2.973828, 0, 0.3921569, 1, 1,
0.2809595, 0.2070954, 1.762996, 0, 0.3882353, 1, 1,
0.2809708, -1.689715, 2.903696, 0, 0.3803922, 1, 1,
0.2813099, 0.2624502, -2.021508, 0, 0.3764706, 1, 1,
0.2817767, -0.9230966, 2.279166, 0, 0.3686275, 1, 1,
0.2833309, 0.1054596, 1.176302, 0, 0.3647059, 1, 1,
0.290033, 0.2413845, 0.9420112, 0, 0.3568628, 1, 1,
0.2902487, 0.4524583, 1.4243, 0, 0.3529412, 1, 1,
0.2913429, -0.4996146, 3.927854, 0, 0.345098, 1, 1,
0.2916877, -0.009212969, 1.988186, 0, 0.3411765, 1, 1,
0.2944158, -0.6904597, 3.042567, 0, 0.3333333, 1, 1,
0.2961208, 2.010059, 0.181831, 0, 0.3294118, 1, 1,
0.298311, -1.389952, 2.001324, 0, 0.3215686, 1, 1,
0.3024839, -1.217003, 2.551628, 0, 0.3176471, 1, 1,
0.3036875, 0.5700066, 1.590818, 0, 0.3098039, 1, 1,
0.3042144, -1.344992, 0.6997461, 0, 0.3058824, 1, 1,
0.309298, 0.6717442, 0.3821672, 0, 0.2980392, 1, 1,
0.311193, 1.039678, -0.1444542, 0, 0.2901961, 1, 1,
0.3124962, 0.06459171, 1.053816, 0, 0.2862745, 1, 1,
0.3162492, 0.7718848, 1.04876, 0, 0.2784314, 1, 1,
0.3167687, 1.203673, 1.017272, 0, 0.2745098, 1, 1,
0.3177781, -1.15254, 2.976288, 0, 0.2666667, 1, 1,
0.3189195, -0.2680006, 2.664201, 0, 0.2627451, 1, 1,
0.3196366, 0.1237952, 1.570701, 0, 0.254902, 1, 1,
0.3225015, 0.7432233, -0.7112895, 0, 0.2509804, 1, 1,
0.3233651, 0.1034316, 1.01564, 0, 0.2431373, 1, 1,
0.3302027, 0.5039762, 0.286483, 0, 0.2392157, 1, 1,
0.3306771, -0.8941636, 2.452016, 0, 0.2313726, 1, 1,
0.3345163, 0.3365952, 1.430641, 0, 0.227451, 1, 1,
0.3353068, -0.5350361, 2.954298, 0, 0.2196078, 1, 1,
0.3387702, -0.7318655, 2.6847, 0, 0.2156863, 1, 1,
0.3429013, -0.5962747, 3.135288, 0, 0.2078431, 1, 1,
0.3533494, -0.9441864, 3.430398, 0, 0.2039216, 1, 1,
0.3555617, 1.114065, 1.194806, 0, 0.1960784, 1, 1,
0.3563417, -0.3176773, 1.034253, 0, 0.1882353, 1, 1,
0.3610216, -1.334415, 1.878891, 0, 0.1843137, 1, 1,
0.3670445, 1.000077, 1.224545, 0, 0.1764706, 1, 1,
0.3671584, -0.4265829, 0.9035671, 0, 0.172549, 1, 1,
0.3695908, 2.763747, 0.2728564, 0, 0.1647059, 1, 1,
0.3716043, 0.7299106, 2.583898, 0, 0.1607843, 1, 1,
0.3724897, 1.253416, 1.387511, 0, 0.1529412, 1, 1,
0.3726172, 0.2046405, 1.750356, 0, 0.1490196, 1, 1,
0.3727601, -1.261322, 4.30287, 0, 0.1411765, 1, 1,
0.3733085, -1.024727, 3.788723, 0, 0.1372549, 1, 1,
0.3782887, 0.5753496, 0.04731426, 0, 0.1294118, 1, 1,
0.3788992, 0.9219208, 0.3889271, 0, 0.1254902, 1, 1,
0.3798673, 0.9927116, 3.012318, 0, 0.1176471, 1, 1,
0.3811119, -0.6913336, 4.050244, 0, 0.1137255, 1, 1,
0.3882822, 1.266698, -1.20174, 0, 0.1058824, 1, 1,
0.3912369, 1.037584, 0.2956659, 0, 0.09803922, 1, 1,
0.3950459, 0.929689, -0.5759708, 0, 0.09411765, 1, 1,
0.3966428, 0.1210848, 2.513657, 0, 0.08627451, 1, 1,
0.4095908, -1.956882, 3.027467, 0, 0.08235294, 1, 1,
0.4128893, 0.667129, 1.328222, 0, 0.07450981, 1, 1,
0.4148359, 0.03065292, 2.678439, 0, 0.07058824, 1, 1,
0.4230509, 0.9343289, 0.3394355, 0, 0.0627451, 1, 1,
0.4239033, 1.353644, -1.34418, 0, 0.05882353, 1, 1,
0.4293685, -0.9269316, 0.7505556, 0, 0.05098039, 1, 1,
0.4338554, -0.7419603, 2.054471, 0, 0.04705882, 1, 1,
0.4343691, 0.2734898, -0.3040772, 0, 0.03921569, 1, 1,
0.4345724, -0.1694003, 1.052256, 0, 0.03529412, 1, 1,
0.4436505, 0.5027316, 0.3044495, 0, 0.02745098, 1, 1,
0.4443237, 0.8123965, 1.795076, 0, 0.02352941, 1, 1,
0.4454854, 0.4906394, 2.11028, 0, 0.01568628, 1, 1,
0.4467838, -1.505566, 1.110109, 0, 0.01176471, 1, 1,
0.4518307, 0.4022973, 1.245025, 0, 0.003921569, 1, 1,
0.4584765, 1.657669, -0.01808495, 0.003921569, 0, 1, 1,
0.4605998, -0.5190712, 2.006293, 0.007843138, 0, 1, 1,
0.4638041, -0.3768612, 2.458955, 0.01568628, 0, 1, 1,
0.4852682, 0.05338897, 2.240769, 0.01960784, 0, 1, 1,
0.487615, -0.9010056, 2.423954, 0.02745098, 0, 1, 1,
0.4922824, 1.406037, 1.55951, 0.03137255, 0, 1, 1,
0.4922835, -0.2878469, 2.890667, 0.03921569, 0, 1, 1,
0.5002545, 0.1856698, 2.043016, 0.04313726, 0, 1, 1,
0.5042346, 0.2740855, 1.593226, 0.05098039, 0, 1, 1,
0.5078688, 0.4089622, -0.4219254, 0.05490196, 0, 1, 1,
0.507957, 1.236778, 0.8761216, 0.0627451, 0, 1, 1,
0.5144833, -0.5506981, 2.41726, 0.06666667, 0, 1, 1,
0.5255295, 0.9597078, 0.2738615, 0.07450981, 0, 1, 1,
0.5261176, 0.2581678, 2.612423, 0.07843138, 0, 1, 1,
0.5265098, 1.633663, -0.5308577, 0.08627451, 0, 1, 1,
0.5285894, -2.272702, 5.136497, 0.09019608, 0, 1, 1,
0.5295675, 0.6683078, 0.1744961, 0.09803922, 0, 1, 1,
0.5314631, -1.147074, 4.400115, 0.1058824, 0, 1, 1,
0.532371, -0.3780061, 0.2721115, 0.1098039, 0, 1, 1,
0.5337538, 1.995341, 1.021742, 0.1176471, 0, 1, 1,
0.5364981, 0.8391064, 2.956935, 0.1215686, 0, 1, 1,
0.5373516, 0.3224171, 0.4462642, 0.1294118, 0, 1, 1,
0.5379162, -1.222615, 2.515344, 0.1333333, 0, 1, 1,
0.5397772, -0.8282848, 0.8730368, 0.1411765, 0, 1, 1,
0.5586556, 0.6511355, -1.01586, 0.145098, 0, 1, 1,
0.5620116, 2.115756, -0.1284084, 0.1529412, 0, 1, 1,
0.5642782, -0.6628535, 4.211716, 0.1568628, 0, 1, 1,
0.5676384, 0.7176698, 0.2858036, 0.1647059, 0, 1, 1,
0.5691542, -0.3066801, 0.2441649, 0.1686275, 0, 1, 1,
0.5800282, 1.535023, -1.5056, 0.1764706, 0, 1, 1,
0.5825243, 0.9410369, 1.788754, 0.1803922, 0, 1, 1,
0.5846773, -1.929448, 1.395628, 0.1882353, 0, 1, 1,
0.584879, -1.766099, 2.580311, 0.1921569, 0, 1, 1,
0.5872622, -0.6470577, 2.19506, 0.2, 0, 1, 1,
0.5900816, -0.7216251, 1.955517, 0.2078431, 0, 1, 1,
0.5922874, 0.6217443, 0.6534262, 0.2117647, 0, 1, 1,
0.5932555, 0.5396273, 2.200048, 0.2196078, 0, 1, 1,
0.5938123, -1.152774, 2.738112, 0.2235294, 0, 1, 1,
0.5942713, -0.827066, 2.310029, 0.2313726, 0, 1, 1,
0.5955198, -1.884522, 3.419096, 0.2352941, 0, 1, 1,
0.5986014, -0.6257923, 2.975765, 0.2431373, 0, 1, 1,
0.6027287, -0.644872, 3.707963, 0.2470588, 0, 1, 1,
0.6073869, -1.045079, 2.489804, 0.254902, 0, 1, 1,
0.6102431, -1.850899, 3.268502, 0.2588235, 0, 1, 1,
0.6115384, -1.117188, 2.433382, 0.2666667, 0, 1, 1,
0.6129441, 0.1030015, 2.431071, 0.2705882, 0, 1, 1,
0.6152588, -0.4535136, 2.531193, 0.2784314, 0, 1, 1,
0.6209299, 1.282007, 0.6955824, 0.282353, 0, 1, 1,
0.6236142, -1.657825, 3.518623, 0.2901961, 0, 1, 1,
0.6289245, -1.045917, 1.879174, 0.2941177, 0, 1, 1,
0.6328401, -0.5731439, 0.8107374, 0.3019608, 0, 1, 1,
0.633432, 0.8022849, 1.747991, 0.3098039, 0, 1, 1,
0.6336763, -0.8773814, 3.559819, 0.3137255, 0, 1, 1,
0.6353537, -0.04231563, 0.6739551, 0.3215686, 0, 1, 1,
0.6399831, 1.034339, 0.4524646, 0.3254902, 0, 1, 1,
0.6469315, -0.8639951, 1.736311, 0.3333333, 0, 1, 1,
0.6473898, 0.02703943, 0.7603204, 0.3372549, 0, 1, 1,
0.6529362, -1.929186, 4.208794, 0.345098, 0, 1, 1,
0.6571313, 1.554575, 1.359491, 0.3490196, 0, 1, 1,
0.6581532, -1.239806, 1.696787, 0.3568628, 0, 1, 1,
0.6583636, -0.2401508, 2.250246, 0.3607843, 0, 1, 1,
0.6588192, 1.453174, -0.2309958, 0.3686275, 0, 1, 1,
0.6605076, 1.127032, 1.647724, 0.372549, 0, 1, 1,
0.6627402, -2.394967, 4.294915, 0.3803922, 0, 1, 1,
0.6663335, -1.453108, 3.807281, 0.3843137, 0, 1, 1,
0.6680754, 0.9777663, -0.0204253, 0.3921569, 0, 1, 1,
0.6709318, -0.34054, 2.089614, 0.3960784, 0, 1, 1,
0.6770899, -0.673175, 2.869613, 0.4039216, 0, 1, 1,
0.6778851, -0.2108236, 3.440602, 0.4117647, 0, 1, 1,
0.6778863, 0.1328935, 3.732664, 0.4156863, 0, 1, 1,
0.6882313, -0.5614405, 1.038162, 0.4235294, 0, 1, 1,
0.6897495, 0.7197095, 1.329707, 0.427451, 0, 1, 1,
0.6922666, -0.2369853, 2.425897, 0.4352941, 0, 1, 1,
0.6968658, -1.419841, 3.861838, 0.4392157, 0, 1, 1,
0.69874, 0.4586833, 1.06143, 0.4470588, 0, 1, 1,
0.7017202, 0.2170031, 0.6117828, 0.4509804, 0, 1, 1,
0.7020013, 1.33662, -1.609169, 0.4588235, 0, 1, 1,
0.7030003, -0.6745021, 3.228117, 0.4627451, 0, 1, 1,
0.7037756, 0.8207866, 1.996154, 0.4705882, 0, 1, 1,
0.7052143, -0.06077967, 3.009324, 0.4745098, 0, 1, 1,
0.7078657, -0.03799628, 3.223231, 0.4823529, 0, 1, 1,
0.7081693, 1.399941, 0.2264386, 0.4862745, 0, 1, 1,
0.7084937, 1.389407, 1.210692, 0.4941176, 0, 1, 1,
0.7098256, 0.4013964, 3.583539, 0.5019608, 0, 1, 1,
0.7134691, 0.5767492, 0.5787964, 0.5058824, 0, 1, 1,
0.7160103, 0.7844942, 0.1105941, 0.5137255, 0, 1, 1,
0.7200027, -0.33617, 2.83693, 0.5176471, 0, 1, 1,
0.7232349, -1.519792, 4.640727, 0.5254902, 0, 1, 1,
0.7236984, 0.2816123, 3.525733, 0.5294118, 0, 1, 1,
0.7279126, 0.04603812, 0.9129089, 0.5372549, 0, 1, 1,
0.7310892, 0.4391527, 1.509996, 0.5411765, 0, 1, 1,
0.7383827, -1.218075, 0.7530361, 0.5490196, 0, 1, 1,
0.7405204, -1.476134, 4.302728, 0.5529412, 0, 1, 1,
0.7415541, 0.9494904, -0.6685294, 0.5607843, 0, 1, 1,
0.7452739, -0.02217521, 2.593853, 0.5647059, 0, 1, 1,
0.746201, 1.00504, 0.8670778, 0.572549, 0, 1, 1,
0.7513076, 0.4116868, 0.9523385, 0.5764706, 0, 1, 1,
0.7521626, 2.022524, 0.2043732, 0.5843138, 0, 1, 1,
0.754811, -1.053973, 1.175219, 0.5882353, 0, 1, 1,
0.7569852, 0.2672454, 2.113894, 0.5960785, 0, 1, 1,
0.76069, -1.738832, 3.347804, 0.6039216, 0, 1, 1,
0.7648327, -3.036915, 2.155398, 0.6078432, 0, 1, 1,
0.778975, 0.1305712, 1.919721, 0.6156863, 0, 1, 1,
0.7856078, -1.180119, 3.126078, 0.6196079, 0, 1, 1,
0.7903259, -0.8037954, 1.597236, 0.627451, 0, 1, 1,
0.7930527, 0.8092459, 0.08147999, 0.6313726, 0, 1, 1,
0.7977917, -2.152771, 2.909853, 0.6392157, 0, 1, 1,
0.7994832, -2.167155, 3.250205, 0.6431373, 0, 1, 1,
0.8002191, -0.02719098, 1.209091, 0.6509804, 0, 1, 1,
0.801675, 2.193765, 1.566278, 0.654902, 0, 1, 1,
0.8035282, 0.7822824, 0.2321814, 0.6627451, 0, 1, 1,
0.8054563, -1.561439, 1.568213, 0.6666667, 0, 1, 1,
0.8077963, 2.049908, 0.9700012, 0.6745098, 0, 1, 1,
0.8090287, -1.129643, 3.894936, 0.6784314, 0, 1, 1,
0.8094994, -1.067064, 2.920726, 0.6862745, 0, 1, 1,
0.8105223, 1.314995, 1.429873, 0.6901961, 0, 1, 1,
0.8106065, 1.571773, 0.8952665, 0.6980392, 0, 1, 1,
0.8212093, -0.8965245, 1.672261, 0.7058824, 0, 1, 1,
0.8253918, -0.6683472, 0.9255776, 0.7098039, 0, 1, 1,
0.8274773, 0.4317937, 1.264606, 0.7176471, 0, 1, 1,
0.8342624, 0.3280577, 1.308908, 0.7215686, 0, 1, 1,
0.8357124, -0.5022687, 2.094349, 0.7294118, 0, 1, 1,
0.8372688, 0.9213121, 0.1809047, 0.7333333, 0, 1, 1,
0.8398411, -0.8951931, 1.71249, 0.7411765, 0, 1, 1,
0.8407076, -1.376385, 2.197293, 0.7450981, 0, 1, 1,
0.8420366, 0.4481069, 0.7616974, 0.7529412, 0, 1, 1,
0.8462512, -1.822084, 3.879789, 0.7568628, 0, 1, 1,
0.8469983, 0.5842239, 0.9338963, 0.7647059, 0, 1, 1,
0.848779, -0.1473561, 2.487667, 0.7686275, 0, 1, 1,
0.8530591, 0.785365, 1.708762, 0.7764706, 0, 1, 1,
0.8567589, -0.7811976, 1.244096, 0.7803922, 0, 1, 1,
0.8579966, -0.7798461, 3.462077, 0.7882353, 0, 1, 1,
0.8614812, -0.3434627, 2.863406, 0.7921569, 0, 1, 1,
0.8630784, 1.786855, 0.2850721, 0.8, 0, 1, 1,
0.8732674, -2.517463, 2.183554, 0.8078431, 0, 1, 1,
0.8738554, -0.05114467, 2.042198, 0.8117647, 0, 1, 1,
0.8768148, -1.440269, 2.557287, 0.8196079, 0, 1, 1,
0.8772219, -2.352522, 1.571123, 0.8235294, 0, 1, 1,
0.8875931, 0.4390994, 3.672302, 0.8313726, 0, 1, 1,
0.8919288, -2.508415, 3.940932, 0.8352941, 0, 1, 1,
0.8975465, -2.232555, 3.480465, 0.8431373, 0, 1, 1,
0.8987092, -0.6598033, 2.834099, 0.8470588, 0, 1, 1,
0.8989466, 0.4284739, -0.8760343, 0.854902, 0, 1, 1,
0.9005066, 0.7700689, -0.041851, 0.8588235, 0, 1, 1,
0.9045166, -0.3242324, 2.361868, 0.8666667, 0, 1, 1,
0.9092234, -1.789655, 1.949461, 0.8705882, 0, 1, 1,
0.9106497, -0.1904411, 1.178158, 0.8784314, 0, 1, 1,
0.9130327, -0.3270382, 2.591793, 0.8823529, 0, 1, 1,
0.9153129, 1.070753, 1.662007, 0.8901961, 0, 1, 1,
0.9156855, 0.634125, 2.448551, 0.8941177, 0, 1, 1,
0.9188026, 0.682772, 0.01182033, 0.9019608, 0, 1, 1,
0.9212441, -1.730649, 3.294626, 0.9098039, 0, 1, 1,
0.9285315, 1.274415, -0.7550406, 0.9137255, 0, 1, 1,
0.931996, 0.4976819, 1.302228, 0.9215686, 0, 1, 1,
0.9342983, 0.08473424, 0.5608476, 0.9254902, 0, 1, 1,
0.9416711, 0.4842236, 0.5133464, 0.9333333, 0, 1, 1,
0.9544395, 1.148254, -0.3807874, 0.9372549, 0, 1, 1,
0.9633866, -0.438828, 3.051627, 0.945098, 0, 1, 1,
0.9651211, -0.2072351, 2.088481, 0.9490196, 0, 1, 1,
0.9677205, -1.499812, 3.694785, 0.9568627, 0, 1, 1,
0.9742393, -0.9321173, 2.967256, 0.9607843, 0, 1, 1,
0.9823418, 0.8143412, 2.117268, 0.9686275, 0, 1, 1,
0.9824342, -0.8907317, 1.665353, 0.972549, 0, 1, 1,
0.9831333, 1.018839, 0.1090778, 0.9803922, 0, 1, 1,
0.989271, -0.4758216, 2.048014, 0.9843137, 0, 1, 1,
0.9935333, -0.8334739, 0.9100891, 0.9921569, 0, 1, 1,
0.9978145, 2.887849, 0.9196005, 0.9960784, 0, 1, 1,
0.9983157, 0.2224365, 2.518892, 1, 0, 0.9960784, 1,
1.001421, -1.393749, 2.497997, 1, 0, 0.9882353, 1,
1.009838, -0.07959723, 1.236559, 1, 0, 0.9843137, 1,
1.010467, 0.3204519, 2.272761, 1, 0, 0.9764706, 1,
1.013285, -0.08261962, 1.692082, 1, 0, 0.972549, 1,
1.014387, -1.126455, 2.188741, 1, 0, 0.9647059, 1,
1.016241, 0.5564581, 0.9594598, 1, 0, 0.9607843, 1,
1.016371, 0.2256788, 0.6062027, 1, 0, 0.9529412, 1,
1.020747, 1.142508, 0.5896597, 1, 0, 0.9490196, 1,
1.027058, 0.5402542, 1.066433, 1, 0, 0.9411765, 1,
1.031776, -0.03689006, 1.535681, 1, 0, 0.9372549, 1,
1.03382, 1.162073, 1.19901, 1, 0, 0.9294118, 1,
1.034798, 0.9610884, -0.1728042, 1, 0, 0.9254902, 1,
1.035222, -1.208381, 4.101619, 1, 0, 0.9176471, 1,
1.035466, 0.06120142, 3.38713, 1, 0, 0.9137255, 1,
1.04183, -1.421705, 1.160045, 1, 0, 0.9058824, 1,
1.044875, 1.518569, 1.115053, 1, 0, 0.9019608, 1,
1.046376, -1.485082, 1.993168, 1, 0, 0.8941177, 1,
1.051159, -0.2740625, 1.55118, 1, 0, 0.8862745, 1,
1.051599, 0.2281378, 1.823971, 1, 0, 0.8823529, 1,
1.057071, -0.5629112, 1.263594, 1, 0, 0.8745098, 1,
1.06275, -0.4348823, 3.04792, 1, 0, 0.8705882, 1,
1.063844, -0.5225591, -0.04972682, 1, 0, 0.8627451, 1,
1.064533, 1.16784, 2.006671, 1, 0, 0.8588235, 1,
1.073177, -0.2536207, 4.399266, 1, 0, 0.8509804, 1,
1.073634, -0.8705117, 3.646664, 1, 0, 0.8470588, 1,
1.082598, -0.491751, -0.5991913, 1, 0, 0.8392157, 1,
1.083821, -0.1067801, 1.553583, 1, 0, 0.8352941, 1,
1.10189, -0.148701, 1.666693, 1, 0, 0.827451, 1,
1.103291, -0.9015791, 1.983995, 1, 0, 0.8235294, 1,
1.109788, 0.1794762, 2.265845, 1, 0, 0.8156863, 1,
1.111109, 1.241822, 0.8210363, 1, 0, 0.8117647, 1,
1.112129, 1.079132, -0.3825519, 1, 0, 0.8039216, 1,
1.123031, -0.5684953, 1.799299, 1, 0, 0.7960784, 1,
1.12783, 1.31238, 0.6526863, 1, 0, 0.7921569, 1,
1.133751, -1.776499, 3.345346, 1, 0, 0.7843137, 1,
1.139551, -1.213653, 3.275025, 1, 0, 0.7803922, 1,
1.142716, 1.375984, 0.02167805, 1, 0, 0.772549, 1,
1.143348, -0.9603534, 3.884777, 1, 0, 0.7686275, 1,
1.15256, -1.03219, 3.680588, 1, 0, 0.7607843, 1,
1.157717, 0.2053861, 0.4601334, 1, 0, 0.7568628, 1,
1.16996, -0.6675697, 1.639566, 1, 0, 0.7490196, 1,
1.181583, -1.45113, 2.652414, 1, 0, 0.7450981, 1,
1.185438, -0.9428226, 1.750017, 1, 0, 0.7372549, 1,
1.193948, 0.7409415, 1.974344, 1, 0, 0.7333333, 1,
1.196329, 0.8633548, 2.892816, 1, 0, 0.7254902, 1,
1.200171, 0.3815248, -0.1853904, 1, 0, 0.7215686, 1,
1.202764, 0.6052228, -1.439407, 1, 0, 0.7137255, 1,
1.205151, 0.8141013, 0.3134281, 1, 0, 0.7098039, 1,
1.209129, 0.4607538, 3.079715, 1, 0, 0.7019608, 1,
1.213261, -2.486302, 3.54257, 1, 0, 0.6941177, 1,
1.217846, -1.394764, 3.312424, 1, 0, 0.6901961, 1,
1.220438, -1.353709, 4.26888, 1, 0, 0.682353, 1,
1.229801, -1.272197, 2.411392, 1, 0, 0.6784314, 1,
1.243587, 0.09136081, 1.770674, 1, 0, 0.6705883, 1,
1.253034, -1.035339, 2.98016, 1, 0, 0.6666667, 1,
1.253685, 1.393481, 0.4380453, 1, 0, 0.6588235, 1,
1.259916, 0.3570106, 0.3825798, 1, 0, 0.654902, 1,
1.26499, -1.026574, 0.8128815, 1, 0, 0.6470588, 1,
1.267201, 1.309803, 1.226, 1, 0, 0.6431373, 1,
1.267539, 0.9639041, -1.121834, 1, 0, 0.6352941, 1,
1.267594, 1.21753, 1.325739, 1, 0, 0.6313726, 1,
1.269107, 0.6994923, 3.9417, 1, 0, 0.6235294, 1,
1.271013, 1.193948, 0.8728397, 1, 0, 0.6196079, 1,
1.278443, -0.2278492, 2.666396, 1, 0, 0.6117647, 1,
1.282034, -1.710108, 2.64539, 1, 0, 0.6078432, 1,
1.284636, 0.9542398, -0.2696554, 1, 0, 0.6, 1,
1.306268, 0.4743612, 1.531686, 1, 0, 0.5921569, 1,
1.308701, -0.3728398, 1.266184, 1, 0, 0.5882353, 1,
1.310361, 0.9996793, 1.430781, 1, 0, 0.5803922, 1,
1.332816, 0.3598729, 0.3424834, 1, 0, 0.5764706, 1,
1.338833, 0.5642655, 0.8447477, 1, 0, 0.5686275, 1,
1.342693, -2.247814, 2.120737, 1, 0, 0.5647059, 1,
1.349023, -0.2298213, -0.5976177, 1, 0, 0.5568628, 1,
1.349345, -0.8090765, 1.413957, 1, 0, 0.5529412, 1,
1.356757, 1.369768, 1.366655, 1, 0, 0.5450981, 1,
1.370015, -0.2110788, 2.611958, 1, 0, 0.5411765, 1,
1.371321, 0.4126151, 0.6204131, 1, 0, 0.5333334, 1,
1.378331, -0.6258364, 0.7494734, 1, 0, 0.5294118, 1,
1.380843, 0.9159613, 0.9509139, 1, 0, 0.5215687, 1,
1.387227, 1.891101, -0.003998327, 1, 0, 0.5176471, 1,
1.391901, 0.2123684, 1.791997, 1, 0, 0.509804, 1,
1.402254, -0.8097147, 3.433595, 1, 0, 0.5058824, 1,
1.405265, -0.9316849, 2.045024, 1, 0, 0.4980392, 1,
1.410729, -1.640885, 3.966052, 1, 0, 0.4901961, 1,
1.416676, 0.4692117, 1.081105, 1, 0, 0.4862745, 1,
1.425356, 0.2506672, 3.580491, 1, 0, 0.4784314, 1,
1.430252, 1.109244, 1.917738, 1, 0, 0.4745098, 1,
1.444173, -0.1528723, -0.1623686, 1, 0, 0.4666667, 1,
1.445787, -1.156497, 4.375212, 1, 0, 0.4627451, 1,
1.447743, -1.477074, 3.40821, 1, 0, 0.454902, 1,
1.449639, 0.3233651, 2.500514, 1, 0, 0.4509804, 1,
1.476142, 1.605698, -0.5817435, 1, 0, 0.4431373, 1,
1.47808, 1.634677, 1.258559, 1, 0, 0.4392157, 1,
1.494833, 1.094038, 1.622354, 1, 0, 0.4313726, 1,
1.496122, 0.10032, 1.248708, 1, 0, 0.427451, 1,
1.520212, -1.469898, 3.802993, 1, 0, 0.4196078, 1,
1.521199, -0.696615, 0.1091219, 1, 0, 0.4156863, 1,
1.522133, -0.3610488, 1.620726, 1, 0, 0.4078431, 1,
1.52237, -0.713448, 2.771399, 1, 0, 0.4039216, 1,
1.524779, 1.043198, 3.339004, 1, 0, 0.3960784, 1,
1.532942, -0.06120096, 0.5766789, 1, 0, 0.3882353, 1,
1.535087, 0.8510527, 1.820775, 1, 0, 0.3843137, 1,
1.546537, 1.398368, 0.8925321, 1, 0, 0.3764706, 1,
1.546669, -0.6777304, 2.038728, 1, 0, 0.372549, 1,
1.559626, 0.8358009, 1.474614, 1, 0, 0.3647059, 1,
1.581699, 0.3620393, 2.484156, 1, 0, 0.3607843, 1,
1.582586, -0.7017063, 3.271672, 1, 0, 0.3529412, 1,
1.58717, 0.2644412, 0.6129724, 1, 0, 0.3490196, 1,
1.593964, 1.195979, 0.1748426, 1, 0, 0.3411765, 1,
1.59511, -0.4841886, 4.022892, 1, 0, 0.3372549, 1,
1.596069, -1.022191, 1.920224, 1, 0, 0.3294118, 1,
1.606608, 0.2992318, 1.920226, 1, 0, 0.3254902, 1,
1.612425, 1.04434, 1.629551, 1, 0, 0.3176471, 1,
1.630248, -0.5183868, 1.155239, 1, 0, 0.3137255, 1,
1.632895, -0.3679051, 2.612831, 1, 0, 0.3058824, 1,
1.639162, 1.359907, 0.6346544, 1, 0, 0.2980392, 1,
1.642354, 0.142368, -0.1915387, 1, 0, 0.2941177, 1,
1.675353, -2.921625, 1.318676, 1, 0, 0.2862745, 1,
1.691393, -0.0365585, 2.064189, 1, 0, 0.282353, 1,
1.705554, -1.277753, 1.152737, 1, 0, 0.2745098, 1,
1.737359, 1.761347, 1.388667, 1, 0, 0.2705882, 1,
1.739781, 0.09116779, 2.877299, 1, 0, 0.2627451, 1,
1.759696, 0.4065768, 1.332477, 1, 0, 0.2588235, 1,
1.783941, -0.04466058, 1.889527, 1, 0, 0.2509804, 1,
1.799418, -1.408086, 3.514852, 1, 0, 0.2470588, 1,
1.804504, -0.5684162, 1.692986, 1, 0, 0.2392157, 1,
1.806604, 1.047994, 1.158388, 1, 0, 0.2352941, 1,
1.814813, -1.417302, 0.9155187, 1, 0, 0.227451, 1,
1.815591, -0.08565131, 1.865998, 1, 0, 0.2235294, 1,
1.83885, -0.249479, 1.626603, 1, 0, 0.2156863, 1,
1.84274, 1.623837, 0.7409783, 1, 0, 0.2117647, 1,
1.845927, -0.2062144, 1.015723, 1, 0, 0.2039216, 1,
1.856449, 1.078899, 0.2621715, 1, 0, 0.1960784, 1,
1.857544, 1.911973, 0.4296323, 1, 0, 0.1921569, 1,
1.858649, 1.949407, 0.4825377, 1, 0, 0.1843137, 1,
1.874937, 0.804996, 0.06059561, 1, 0, 0.1803922, 1,
1.897139, -0.03703715, 1.790905, 1, 0, 0.172549, 1,
1.920712, -0.4382254, 2.61018, 1, 0, 0.1686275, 1,
1.922205, -0.6869079, 0.2233318, 1, 0, 0.1607843, 1,
1.941173, -1.338873, 1.152291, 1, 0, 0.1568628, 1,
1.977408, -0.1081168, 1.273156, 1, 0, 0.1490196, 1,
1.983109, -0.3501709, 1.211429, 1, 0, 0.145098, 1,
1.994535, -0.5768868, 1.494369, 1, 0, 0.1372549, 1,
2.034396, -0.986492, 0.6430398, 1, 0, 0.1333333, 1,
2.072078, 1.906477, -0.2392029, 1, 0, 0.1254902, 1,
2.113971, -0.8962273, 3.081083, 1, 0, 0.1215686, 1,
2.139601, -0.5681239, 2.325552, 1, 0, 0.1137255, 1,
2.159538, -1.135481, 1.362707, 1, 0, 0.1098039, 1,
2.190655, -0.2039849, 0.7074264, 1, 0, 0.1019608, 1,
2.226841, -2.14856, 2.744201, 1, 0, 0.09411765, 1,
2.284583, 1.193271, 1.899128, 1, 0, 0.09019608, 1,
2.307957, -1.893634, 4.230614, 1, 0, 0.08235294, 1,
2.367715, -1.387265, 1.229815, 1, 0, 0.07843138, 1,
2.408297, -1.719191, 2.792948, 1, 0, 0.07058824, 1,
2.411323, -1.507106, 2.413205, 1, 0, 0.06666667, 1,
2.4889, 0.5658752, 0.7086542, 1, 0, 0.05882353, 1,
2.490328, -0.1187908, 1.659857, 1, 0, 0.05490196, 1,
2.54213, 0.7605577, -0.2123283, 1, 0, 0.04705882, 1,
2.554921, 0.4625238, 0.4656695, 1, 0, 0.04313726, 1,
2.561885, 0.5722851, 2.338019, 1, 0, 0.03529412, 1,
2.578601, 0.3634968, 2.961266, 1, 0, 0.03137255, 1,
2.621995, 0.6771403, 0.63242, 1, 0, 0.02352941, 1,
2.645487, 1.40008, 3.115777, 1, 0, 0.01960784, 1,
2.67892, 0.1782117, -0.1553117, 1, 0, 0.01176471, 1,
3.178638, 0.2908313, 2.309378, 1, 0, 0.007843138, 1
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
0.1248574, -4.824738, -6.73815, 0, -0.5, 0.5, 0.5,
0.1248574, -4.824738, -6.73815, 1, -0.5, 0.5, 0.5,
0.1248574, -4.824738, -6.73815, 1, 1.5, 0.5, 0.5,
0.1248574, -4.824738, -6.73815, 0, 1.5, 0.5, 0.5
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
-3.964155, -0.4057029, -6.73815, 0, -0.5, 0.5, 0.5,
-3.964155, -0.4057029, -6.73815, 1, -0.5, 0.5, 0.5,
-3.964155, -0.4057029, -6.73815, 1, 1.5, 0.5, 0.5,
-3.964155, -0.4057029, -6.73815, 0, 1.5, 0.5, 0.5
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
-3.964155, -4.824738, 0.05969238, 0, -0.5, 0.5, 0.5,
-3.964155, -4.824738, 0.05969238, 1, -0.5, 0.5, 0.5,
-3.964155, -4.824738, 0.05969238, 1, 1.5, 0.5, 0.5,
-3.964155, -4.824738, 0.05969238, 0, 1.5, 0.5, 0.5
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
-2, -3.80496, -5.169417,
3, -3.80496, -5.169417,
-2, -3.80496, -5.169417,
-2, -3.974923, -5.430872,
-1, -3.80496, -5.169417,
-1, -3.974923, -5.430872,
0, -3.80496, -5.169417,
0, -3.974923, -5.430872,
1, -3.80496, -5.169417,
1, -3.974923, -5.430872,
2, -3.80496, -5.169417,
2, -3.974923, -5.430872,
3, -3.80496, -5.169417,
3, -3.974923, -5.430872
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
-2, -4.314849, -5.953784, 0, -0.5, 0.5, 0.5,
-2, -4.314849, -5.953784, 1, -0.5, 0.5, 0.5,
-2, -4.314849, -5.953784, 1, 1.5, 0.5, 0.5,
-2, -4.314849, -5.953784, 0, 1.5, 0.5, 0.5,
-1, -4.314849, -5.953784, 0, -0.5, 0.5, 0.5,
-1, -4.314849, -5.953784, 1, -0.5, 0.5, 0.5,
-1, -4.314849, -5.953784, 1, 1.5, 0.5, 0.5,
-1, -4.314849, -5.953784, 0, 1.5, 0.5, 0.5,
0, -4.314849, -5.953784, 0, -0.5, 0.5, 0.5,
0, -4.314849, -5.953784, 1, -0.5, 0.5, 0.5,
0, -4.314849, -5.953784, 1, 1.5, 0.5, 0.5,
0, -4.314849, -5.953784, 0, 1.5, 0.5, 0.5,
1, -4.314849, -5.953784, 0, -0.5, 0.5, 0.5,
1, -4.314849, -5.953784, 1, -0.5, 0.5, 0.5,
1, -4.314849, -5.953784, 1, 1.5, 0.5, 0.5,
1, -4.314849, -5.953784, 0, 1.5, 0.5, 0.5,
2, -4.314849, -5.953784, 0, -0.5, 0.5, 0.5,
2, -4.314849, -5.953784, 1, -0.5, 0.5, 0.5,
2, -4.314849, -5.953784, 1, 1.5, 0.5, 0.5,
2, -4.314849, -5.953784, 0, 1.5, 0.5, 0.5,
3, -4.314849, -5.953784, 0, -0.5, 0.5, 0.5,
3, -4.314849, -5.953784, 1, -0.5, 0.5, 0.5,
3, -4.314849, -5.953784, 1, 1.5, 0.5, 0.5,
3, -4.314849, -5.953784, 0, 1.5, 0.5, 0.5
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
-3.020537, -3, -5.169417,
-3.020537, 2, -5.169417,
-3.020537, -3, -5.169417,
-3.177807, -3, -5.430872,
-3.020537, -2, -5.169417,
-3.177807, -2, -5.430872,
-3.020537, -1, -5.169417,
-3.177807, -1, -5.430872,
-3.020537, 0, -5.169417,
-3.177807, 0, -5.430872,
-3.020537, 1, -5.169417,
-3.177807, 1, -5.430872,
-3.020537, 2, -5.169417,
-3.177807, 2, -5.430872
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
-3.492346, -3, -5.953784, 0, -0.5, 0.5, 0.5,
-3.492346, -3, -5.953784, 1, -0.5, 0.5, 0.5,
-3.492346, -3, -5.953784, 1, 1.5, 0.5, 0.5,
-3.492346, -3, -5.953784, 0, 1.5, 0.5, 0.5,
-3.492346, -2, -5.953784, 0, -0.5, 0.5, 0.5,
-3.492346, -2, -5.953784, 1, -0.5, 0.5, 0.5,
-3.492346, -2, -5.953784, 1, 1.5, 0.5, 0.5,
-3.492346, -2, -5.953784, 0, 1.5, 0.5, 0.5,
-3.492346, -1, -5.953784, 0, -0.5, 0.5, 0.5,
-3.492346, -1, -5.953784, 1, -0.5, 0.5, 0.5,
-3.492346, -1, -5.953784, 1, 1.5, 0.5, 0.5,
-3.492346, -1, -5.953784, 0, 1.5, 0.5, 0.5,
-3.492346, 0, -5.953784, 0, -0.5, 0.5, 0.5,
-3.492346, 0, -5.953784, 1, -0.5, 0.5, 0.5,
-3.492346, 0, -5.953784, 1, 1.5, 0.5, 0.5,
-3.492346, 0, -5.953784, 0, 1.5, 0.5, 0.5,
-3.492346, 1, -5.953784, 0, -0.5, 0.5, 0.5,
-3.492346, 1, -5.953784, 1, -0.5, 0.5, 0.5,
-3.492346, 1, -5.953784, 1, 1.5, 0.5, 0.5,
-3.492346, 1, -5.953784, 0, 1.5, 0.5, 0.5,
-3.492346, 2, -5.953784, 0, -0.5, 0.5, 0.5,
-3.492346, 2, -5.953784, 1, -0.5, 0.5, 0.5,
-3.492346, 2, -5.953784, 1, 1.5, 0.5, 0.5,
-3.492346, 2, -5.953784, 0, 1.5, 0.5, 0.5
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
-3.020537, -3.80496, -4,
-3.020537, -3.80496, 4,
-3.020537, -3.80496, -4,
-3.177807, -3.974923, -4,
-3.020537, -3.80496, -2,
-3.177807, -3.974923, -2,
-3.020537, -3.80496, 0,
-3.177807, -3.974923, 0,
-3.020537, -3.80496, 2,
-3.177807, -3.974923, 2,
-3.020537, -3.80496, 4,
-3.177807, -3.974923, 4
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
-3.492346, -4.314849, -4, 0, -0.5, 0.5, 0.5,
-3.492346, -4.314849, -4, 1, -0.5, 0.5, 0.5,
-3.492346, -4.314849, -4, 1, 1.5, 0.5, 0.5,
-3.492346, -4.314849, -4, 0, 1.5, 0.5, 0.5,
-3.492346, -4.314849, -2, 0, -0.5, 0.5, 0.5,
-3.492346, -4.314849, -2, 1, -0.5, 0.5, 0.5,
-3.492346, -4.314849, -2, 1, 1.5, 0.5, 0.5,
-3.492346, -4.314849, -2, 0, 1.5, 0.5, 0.5,
-3.492346, -4.314849, 0, 0, -0.5, 0.5, 0.5,
-3.492346, -4.314849, 0, 1, -0.5, 0.5, 0.5,
-3.492346, -4.314849, 0, 1, 1.5, 0.5, 0.5,
-3.492346, -4.314849, 0, 0, 1.5, 0.5, 0.5,
-3.492346, -4.314849, 2, 0, -0.5, 0.5, 0.5,
-3.492346, -4.314849, 2, 1, -0.5, 0.5, 0.5,
-3.492346, -4.314849, 2, 1, 1.5, 0.5, 0.5,
-3.492346, -4.314849, 2, 0, 1.5, 0.5, 0.5,
-3.492346, -4.314849, 4, 0, -0.5, 0.5, 0.5,
-3.492346, -4.314849, 4, 1, -0.5, 0.5, 0.5,
-3.492346, -4.314849, 4, 1, 1.5, 0.5, 0.5,
-3.492346, -4.314849, 4, 0, 1.5, 0.5, 0.5
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
-3.020537, -3.80496, -5.169417,
-3.020537, 2.993555, -5.169417,
-3.020537, -3.80496, 5.288802,
-3.020537, 2.993555, 5.288802,
-3.020537, -3.80496, -5.169417,
-3.020537, -3.80496, 5.288802,
-3.020537, 2.993555, -5.169417,
-3.020537, 2.993555, 5.288802,
-3.020537, -3.80496, -5.169417,
3.270252, -3.80496, -5.169417,
-3.020537, -3.80496, 5.288802,
3.270252, -3.80496, 5.288802,
-3.020537, 2.993555, -5.169417,
3.270252, 2.993555, -5.169417,
-3.020537, 2.993555, 5.288802,
3.270252, 2.993555, 5.288802,
3.270252, -3.80496, -5.169417,
3.270252, 2.993555, -5.169417,
3.270252, -3.80496, 5.288802,
3.270252, 2.993555, 5.288802,
3.270252, -3.80496, -5.169417,
3.270252, -3.80496, 5.288802,
3.270252, 2.993555, -5.169417,
3.270252, 2.993555, 5.288802
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
var radius = 7.459847;
var distance = 33.1897;
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
mvMatrix.translate( -0.1248574, 0.4057029, -0.05969238 );
mvMatrix.scale( 1.28215, 1.186396, 0.771234 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.1897);
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
flurenol-butyl<-read.table("flurenol-butyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flurenol-butyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'flurenol' not found
```

```r
y<-flurenol-butyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'flurenol' not found
```

```r
z<-flurenol-butyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'flurenol' not found
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
-2.928923, -0.8942429, -1.359217, 0, 0, 1, 1, 1,
-2.654052, -0.5557476, -2.184447, 1, 0, 0, 1, 1,
-2.554538, -0.7984519, -0.9256812, 1, 0, 0, 1, 1,
-2.539842, 1.674695, -1.44579, 1, 0, 0, 1, 1,
-2.515407, -1.224889, -2.534146, 1, 0, 0, 1, 1,
-2.514141, -0.2994401, -1.721533, 1, 0, 0, 1, 1,
-2.435039, 1.71167, -0.2676236, 0, 0, 0, 1, 1,
-2.384963, -0.4282513, -2.791262, 0, 0, 0, 1, 1,
-2.340546, -0.08453634, -0.6263545, 0, 0, 0, 1, 1,
-2.333152, 0.5052487, 0.3572068, 0, 0, 0, 1, 1,
-2.323799, -1.81134, -4.121427, 0, 0, 0, 1, 1,
-2.300884, -1.050923, -3.521108, 0, 0, 0, 1, 1,
-2.233392, -0.5334403, -3.579541, 0, 0, 0, 1, 1,
-2.21879, 0.03041391, -2.627735, 1, 1, 1, 1, 1,
-2.211378, 1.464488, -2.833875, 1, 1, 1, 1, 1,
-2.182193, 1.219572, -0.5349825, 1, 1, 1, 1, 1,
-2.155324, -0.1924021, -2.417773, 1, 1, 1, 1, 1,
-2.144959, 1.469498, -0.2255334, 1, 1, 1, 1, 1,
-2.139549, 1.880253, -0.9104319, 1, 1, 1, 1, 1,
-2.136848, -0.02869394, -0.2755449, 1, 1, 1, 1, 1,
-2.134977, 1.075489, -0.9735023, 1, 1, 1, 1, 1,
-2.126575, 0.4216955, -1.552625, 1, 1, 1, 1, 1,
-2.105832, -0.3820487, -3.191069, 1, 1, 1, 1, 1,
-2.095577, 0.7513359, -0.5449253, 1, 1, 1, 1, 1,
-2.093209, 1.525295, 0.1989416, 1, 1, 1, 1, 1,
-2.090745, 0.9262928, -1.818799, 1, 1, 1, 1, 1,
-2.068729, -1.059026, -2.845613, 1, 1, 1, 1, 1,
-1.969969, 0.1282927, -0.9123127, 1, 1, 1, 1, 1,
-1.945764, 0.8640641, -1.332611, 0, 0, 1, 1, 1,
-1.935938, -0.353212, -2.394487, 1, 0, 0, 1, 1,
-1.922205, -0.2166537, 0.2863285, 1, 0, 0, 1, 1,
-1.921537, -1.072881, -2.190206, 1, 0, 0, 1, 1,
-1.898022, 0.4754041, -1.427193, 1, 0, 0, 1, 1,
-1.892254, -1.438863, -1.549404, 1, 0, 0, 1, 1,
-1.884042, 0.3049519, -2.6842, 0, 0, 0, 1, 1,
-1.876307, 2.036452, -0.4346586, 0, 0, 0, 1, 1,
-1.867674, 0.696982, -2.50926, 0, 0, 0, 1, 1,
-1.85182, -0.8920591, -2.746781, 0, 0, 0, 1, 1,
-1.844204, 0.00980367, -2.447307, 0, 0, 0, 1, 1,
-1.843255, 0.5110306, -1.01928, 0, 0, 0, 1, 1,
-1.833047, 1.40586, 0.4422461, 0, 0, 0, 1, 1,
-1.829154, 1.294115, -1.0958, 1, 1, 1, 1, 1,
-1.754421, -0.2382684, -2.662337, 1, 1, 1, 1, 1,
-1.720382, -0.931389, -1.35889, 1, 1, 1, 1, 1,
-1.716581, 0.400797, -3.053837, 1, 1, 1, 1, 1,
-1.708462, 0.6322533, -1.327346, 1, 1, 1, 1, 1,
-1.703118, -0.1958372, -1.057083, 1, 1, 1, 1, 1,
-1.701548, -1.933728, -1.445713, 1, 1, 1, 1, 1,
-1.695873, -0.7375314, -2.384674, 1, 1, 1, 1, 1,
-1.683844, 0.2262235, -2.552653, 1, 1, 1, 1, 1,
-1.663319, -1.624479, -1.042463, 1, 1, 1, 1, 1,
-1.661539, 1.266186, -0.9902195, 1, 1, 1, 1, 1,
-1.660318, -0.712322, -1.763, 1, 1, 1, 1, 1,
-1.652013, 1.208581, -1.097494, 1, 1, 1, 1, 1,
-1.649384, 1.423984, -1.446214, 1, 1, 1, 1, 1,
-1.643419, -0.1112716, -2.234455, 1, 1, 1, 1, 1,
-1.632231, 1.630882, -0.1421162, 0, 0, 1, 1, 1,
-1.630098, 0.7543832, -0.6864988, 1, 0, 0, 1, 1,
-1.621906, 0.922437, 0.3956527, 1, 0, 0, 1, 1,
-1.617241, -0.1844366, 0.4776628, 1, 0, 0, 1, 1,
-1.615436, 0.8925263, 0.4298068, 1, 0, 0, 1, 1,
-1.608417, 0.4636661, -1.388199, 1, 0, 0, 1, 1,
-1.602731, -1.600737, -2.823103, 0, 0, 0, 1, 1,
-1.598836, -2.420741, -2.668351, 0, 0, 0, 1, 1,
-1.593523, 0.5337561, -1.065182, 0, 0, 0, 1, 1,
-1.59333, -0.7643905, -2.135406, 0, 0, 0, 1, 1,
-1.552244, -0.8206809, 0.2653524, 0, 0, 0, 1, 1,
-1.543228, 0.4133192, 1.240156, 0, 0, 0, 1, 1,
-1.532335, 1.625805, 0.09697966, 0, 0, 0, 1, 1,
-1.521202, -0.3142663, -0.4942148, 1, 1, 1, 1, 1,
-1.517897, 0.6582408, -1.464889, 1, 1, 1, 1, 1,
-1.511781, 2.707089, -0.1687298, 1, 1, 1, 1, 1,
-1.510052, 0.4873938, 0.1845794, 1, 1, 1, 1, 1,
-1.506222, 0.05318923, -0.9394119, 1, 1, 1, 1, 1,
-1.485783, -0.8949233, -2.014655, 1, 1, 1, 1, 1,
-1.484877, -0.3353575, -1.572047, 1, 1, 1, 1, 1,
-1.47277, 0.8398907, 1.666891, 1, 1, 1, 1, 1,
-1.469297, -0.3048405, -1.698682, 1, 1, 1, 1, 1,
-1.465257, -0.1071799, -1.481304, 1, 1, 1, 1, 1,
-1.46364, 0.08675749, -2.407674, 1, 1, 1, 1, 1,
-1.461577, 0.9402364, -1.082723, 1, 1, 1, 1, 1,
-1.448525, 0.3118769, 1.345665, 1, 1, 1, 1, 1,
-1.43881, -0.3332891, -0.6138622, 1, 1, 1, 1, 1,
-1.438522, 0.09273364, -3.236259, 1, 1, 1, 1, 1,
-1.437929, 1.284315, -1.228158, 0, 0, 1, 1, 1,
-1.437766, 0.3976676, -0.7928577, 1, 0, 0, 1, 1,
-1.42432, 0.1787351, -2.732133, 1, 0, 0, 1, 1,
-1.416152, 1.431823, 1.188855, 1, 0, 0, 1, 1,
-1.414218, 0.3016349, -1.012088, 1, 0, 0, 1, 1,
-1.412382, 0.3174027, -2.045605, 1, 0, 0, 1, 1,
-1.404113, 2.736123, -1.13774, 0, 0, 0, 1, 1,
-1.398751, 0.794598, -1.860129, 0, 0, 0, 1, 1,
-1.398394, 0.2020247, -4.136978, 0, 0, 0, 1, 1,
-1.397446, 0.1200401, -1.098957, 0, 0, 0, 1, 1,
-1.394832, 1.763308, -1.694478, 0, 0, 0, 1, 1,
-1.391781, 0.1104801, -2.411085, 0, 0, 0, 1, 1,
-1.390583, -0.6511182, -1.310676, 0, 0, 0, 1, 1,
-1.385078, -0.07307877, -1.881878, 1, 1, 1, 1, 1,
-1.384138, 1.023127, -0.8989032, 1, 1, 1, 1, 1,
-1.381985, 1.421927, -0.3998093, 1, 1, 1, 1, 1,
-1.364681, -0.7329111, -2.152989, 1, 1, 1, 1, 1,
-1.332356, 1.240704, 0.3951245, 1, 1, 1, 1, 1,
-1.328753, 0.07721571, -0.5609946, 1, 1, 1, 1, 1,
-1.326494, -1.479883, -1.606782, 1, 1, 1, 1, 1,
-1.314926, 1.551411, -0.9610126, 1, 1, 1, 1, 1,
-1.303802, 0.4726658, -0.5518151, 1, 1, 1, 1, 1,
-1.299345, 0.8683029, 0.8208944, 1, 1, 1, 1, 1,
-1.291677, 1.131007, -0.9428061, 1, 1, 1, 1, 1,
-1.289036, 0.08042424, -1.034054, 1, 1, 1, 1, 1,
-1.287204, -0.7824793, -1.548843, 1, 1, 1, 1, 1,
-1.285296, -1.146916, -3.496727, 1, 1, 1, 1, 1,
-1.275974, -0.6225176, -2.744034, 1, 1, 1, 1, 1,
-1.275582, -1.190193, -2.535322, 0, 0, 1, 1, 1,
-1.274367, -0.8357783, -3.349575, 1, 0, 0, 1, 1,
-1.271117, -0.6382669, -1.665658, 1, 0, 0, 1, 1,
-1.271062, -0.6895646, -2.881133, 1, 0, 0, 1, 1,
-1.264008, -0.6778128, -2.304586, 1, 0, 0, 1, 1,
-1.261765, 0.589151, -2.301111, 1, 0, 0, 1, 1,
-1.25542, -1.730824, -1.348981, 0, 0, 0, 1, 1,
-1.247697, 0.5332482, -1.95908, 0, 0, 0, 1, 1,
-1.246881, 0.5916983, -0.9053887, 0, 0, 0, 1, 1,
-1.242502, 0.07447093, -0.3929986, 0, 0, 0, 1, 1,
-1.230097, 2.894547, -0.6721958, 0, 0, 0, 1, 1,
-1.202177, 0.3700673, -0.5411816, 0, 0, 0, 1, 1,
-1.196269, 0.2685196, -2.346014, 0, 0, 0, 1, 1,
-1.163247, 1.925747, -3.033163, 1, 1, 1, 1, 1,
-1.159452, -0.0791578, -1.884488, 1, 1, 1, 1, 1,
-1.155208, -0.7467689, -1.739626, 1, 1, 1, 1, 1,
-1.14795, -0.02375885, -1.569197, 1, 1, 1, 1, 1,
-1.145719, 0.5920857, -0.1673333, 1, 1, 1, 1, 1,
-1.145359, 0.1766499, -1.612365, 1, 1, 1, 1, 1,
-1.144699, 0.3519416, -1.133409, 1, 1, 1, 1, 1,
-1.129692, 0.7744627, -0.2893573, 1, 1, 1, 1, 1,
-1.123214, 0.6715679, -1.573378, 1, 1, 1, 1, 1,
-1.122183, 0.3347661, -1.05983, 1, 1, 1, 1, 1,
-1.121709, 0.19177, 1.831752, 1, 1, 1, 1, 1,
-1.121406, -0.698518, -2.660539, 1, 1, 1, 1, 1,
-1.116098, -0.743817, -1.547227, 1, 1, 1, 1, 1,
-1.098476, 0.03648054, -4.187986, 1, 1, 1, 1, 1,
-1.09427, 0.9949409, 0.01241707, 1, 1, 1, 1, 1,
-1.090951, -0.3322762, -1.501937, 0, 0, 1, 1, 1,
-1.0904, 1.273341, 0.1044028, 1, 0, 0, 1, 1,
-1.087593, 0.0412982, -1.91894, 1, 0, 0, 1, 1,
-1.087578, -0.3605992, -0.4353341, 1, 0, 0, 1, 1,
-1.072466, -0.7104427, -1.763525, 1, 0, 0, 1, 1,
-1.067135, 0.0779442, -1.781678, 1, 0, 0, 1, 1,
-1.065474, -1.182834, -3.197792, 0, 0, 0, 1, 1,
-1.057792, -0.3369462, -1.184199, 0, 0, 0, 1, 1,
-1.051489, -1.959174, -1.047435, 0, 0, 0, 1, 1,
-1.045062, -0.1993648, -3.295022, 0, 0, 0, 1, 1,
-1.044264, -1.746032, -3.315753, 0, 0, 0, 1, 1,
-1.039684, -0.7139636, -2.044672, 0, 0, 0, 1, 1,
-1.035944, -1.121794, -1.633088, 0, 0, 0, 1, 1,
-1.032047, 0.2567472, 0.8314235, 1, 1, 1, 1, 1,
-1.019585, -1.523886, -2.662229, 1, 1, 1, 1, 1,
-1.016672, 1.179079, -0.1915038, 1, 1, 1, 1, 1,
-1.011997, 0.5692645, -2.277009, 1, 1, 1, 1, 1,
-1.01009, -0.4710688, -1.306832, 1, 1, 1, 1, 1,
-1.008073, -0.7629974, -2.636577, 1, 1, 1, 1, 1,
-1.005537, -1.16178, -2.329618, 1, 1, 1, 1, 1,
-1.00478, -0.2839622, -3.798905, 1, 1, 1, 1, 1,
-1.000237, -0.2683477, -2.143872, 1, 1, 1, 1, 1,
-0.986314, 1.347008, 0.06406152, 1, 1, 1, 1, 1,
-0.9763957, 0.7808704, -1.862226, 1, 1, 1, 1, 1,
-0.9707287, -0.4168374, -2.617922, 1, 1, 1, 1, 1,
-0.9669884, 1.318865, -0.8115734, 1, 1, 1, 1, 1,
-0.9624823, 0.9574531, -1.246486, 1, 1, 1, 1, 1,
-0.9601394, 0.01107898, -2.077265, 1, 1, 1, 1, 1,
-0.958164, 0.4472178, -0.186682, 0, 0, 1, 1, 1,
-0.9470134, -0.4065694, 0.4739559, 1, 0, 0, 1, 1,
-0.9466051, -0.5713283, -1.083737, 1, 0, 0, 1, 1,
-0.9462206, 0.4256993, 0.3906377, 1, 0, 0, 1, 1,
-0.945847, -0.2044493, -1.234807, 1, 0, 0, 1, 1,
-0.9450048, -0.7475963, -4.348176, 1, 0, 0, 1, 1,
-0.9448864, 0.09703442, -1.277031, 0, 0, 0, 1, 1,
-0.9431566, 0.3547604, -1.713565, 0, 0, 0, 1, 1,
-0.9407784, -1.066273, -2.640928, 0, 0, 0, 1, 1,
-0.9404125, 0.9896123, -1.365465, 0, 0, 0, 1, 1,
-0.9399748, -0.2298031, -1.750497, 0, 0, 0, 1, 1,
-0.9313245, 0.01782299, -1.656283, 0, 0, 0, 1, 1,
-0.9269558, -0.7051377, -0.8858054, 0, 0, 0, 1, 1,
-0.9234269, 0.1012559, -0.755473, 1, 1, 1, 1, 1,
-0.9185076, 0.7820545, -0.8986608, 1, 1, 1, 1, 1,
-0.9110941, 1.151309, -1.381395, 1, 1, 1, 1, 1,
-0.9034974, 0.508385, -0.2849917, 1, 1, 1, 1, 1,
-0.9001757, 0.4884103, -1.74247, 1, 1, 1, 1, 1,
-0.8986363, 1.572534, -0.2439004, 1, 1, 1, 1, 1,
-0.8977601, -0.3445064, -2.03899, 1, 1, 1, 1, 1,
-0.8969883, -0.7084506, -1.343362, 1, 1, 1, 1, 1,
-0.8907181, -0.01894287, -1.520232, 1, 1, 1, 1, 1,
-0.885861, 0.5205722, -2.28557, 1, 1, 1, 1, 1,
-0.8841041, 0.3775356, -1.877534, 1, 1, 1, 1, 1,
-0.8833011, 1.336069, -1.699989, 1, 1, 1, 1, 1,
-0.8780479, -0.701074, -2.597954, 1, 1, 1, 1, 1,
-0.8774289, -0.5939696, -0.4207751, 1, 1, 1, 1, 1,
-0.8772295, -0.93261, -1.997818, 1, 1, 1, 1, 1,
-0.8765851, 2.480903, -1.42384, 0, 0, 1, 1, 1,
-0.8694053, -1.26828, -1.500417, 1, 0, 0, 1, 1,
-0.8679162, -1.534333, -3.748724, 1, 0, 0, 1, 1,
-0.8660855, -0.02993645, -2.566344, 1, 0, 0, 1, 1,
-0.8611847, 0.4544186, 0.9364255, 1, 0, 0, 1, 1,
-0.8603434, 1.010537, -2.369124, 1, 0, 0, 1, 1,
-0.8580644, -2.211345, -2.767889, 0, 0, 0, 1, 1,
-0.8497643, -0.1161202, -2.42995, 0, 0, 0, 1, 1,
-0.8474376, 0.4323264, -0.6343892, 0, 0, 0, 1, 1,
-0.8421052, 1.380181, -0.5141569, 0, 0, 0, 1, 1,
-0.8226272, 1.872295, 0.2306126, 0, 0, 0, 1, 1,
-0.8223879, -2.414093, -3.951484, 0, 0, 0, 1, 1,
-0.8219475, 0.9607975, -0.6358833, 0, 0, 0, 1, 1,
-0.8216121, 0.3538672, -2.745597, 1, 1, 1, 1, 1,
-0.8161091, -0.4829634, -0.5368997, 1, 1, 1, 1, 1,
-0.814466, 1.868863, -0.152855, 1, 1, 1, 1, 1,
-0.8115217, 0.4653313, -2.521927, 1, 1, 1, 1, 1,
-0.809193, -0.721297, -2.20155, 1, 1, 1, 1, 1,
-0.8077352, -1.05787, -3.152895, 1, 1, 1, 1, 1,
-0.8058778, -0.2829468, -1.916472, 1, 1, 1, 1, 1,
-0.8019831, -0.3653308, -1.724286, 1, 1, 1, 1, 1,
-0.8005698, 0.7540435, -0.8237388, 1, 1, 1, 1, 1,
-0.7930738, 2.128243, -0.8057153, 1, 1, 1, 1, 1,
-0.7888122, 0.3729008, -2.560695, 1, 1, 1, 1, 1,
-0.7873833, -1.440719, -1.729778, 1, 1, 1, 1, 1,
-0.7859479, 1.411143, 1.117077, 1, 1, 1, 1, 1,
-0.7851644, 0.06707232, -1.927362, 1, 1, 1, 1, 1,
-0.7851641, -0.1083699, -1.353983, 1, 1, 1, 1, 1,
-0.7821568, -0.05894889, -1.101082, 0, 0, 1, 1, 1,
-0.7755909, -1.802282, -2.741075, 1, 0, 0, 1, 1,
-0.7713264, 0.1485799, 0.7294359, 1, 0, 0, 1, 1,
-0.7707465, 0.8170056, -0.6245334, 1, 0, 0, 1, 1,
-0.7580859, 1.649782, 0.1795691, 1, 0, 0, 1, 1,
-0.7579281, 0.9058639, -0.07436913, 1, 0, 0, 1, 1,
-0.7442476, -3.705953, -2.163246, 0, 0, 0, 1, 1,
-0.7426071, -0.3500018, -1.895783, 0, 0, 0, 1, 1,
-0.7382871, 0.3064128, -1.036206, 0, 0, 0, 1, 1,
-0.7306744, 2.314701, 0.09939254, 0, 0, 0, 1, 1,
-0.7303599, 0.1613913, -1.982901, 0, 0, 0, 1, 1,
-0.7301984, 0.2574926, -1.52028, 0, 0, 0, 1, 1,
-0.7245495, -0.412975, -1.813295, 0, 0, 0, 1, 1,
-0.720417, -0.8874561, -3.48154, 1, 1, 1, 1, 1,
-0.7196742, 0.8256658, -1.925687, 1, 1, 1, 1, 1,
-0.7087948, 0.2383621, -1.601884, 1, 1, 1, 1, 1,
-0.7082851, -0.1327516, -1.350931, 1, 1, 1, 1, 1,
-0.6988708, -0.1779723, -3.04194, 1, 1, 1, 1, 1,
-0.6976804, -0.6428062, -1.576401, 1, 1, 1, 1, 1,
-0.6916495, 0.4426855, -1.733149, 1, 1, 1, 1, 1,
-0.6914338, -1.007229, -2.573487, 1, 1, 1, 1, 1,
-0.6775253, 1.413802, 0.9122198, 1, 1, 1, 1, 1,
-0.6766292, 1.570306, 0.04310178, 1, 1, 1, 1, 1,
-0.6568579, -1.163267, -2.227271, 1, 1, 1, 1, 1,
-0.6557488, -0.6480178, -1.522043, 1, 1, 1, 1, 1,
-0.6526736, 0.09982482, 0.2148505, 1, 1, 1, 1, 1,
-0.6521723, -0.0619634, -1.362566, 1, 1, 1, 1, 1,
-0.6482304, 1.567095, -1.477419, 1, 1, 1, 1, 1,
-0.6445193, -1.483468, -3.135942, 0, 0, 1, 1, 1,
-0.6419444, 1.475114, -0.5800105, 1, 0, 0, 1, 1,
-0.6389825, -0.3388044, -1.958686, 1, 0, 0, 1, 1,
-0.6344245, 0.07024128, 0.5074661, 1, 0, 0, 1, 1,
-0.6343409, -0.53846, -1.999542, 1, 0, 0, 1, 1,
-0.6277723, 0.3415219, -1.319476, 1, 0, 0, 1, 1,
-0.6229065, 1.35317, 1.27363, 0, 0, 0, 1, 1,
-0.6211655, 0.4403749, -1.737355, 0, 0, 0, 1, 1,
-0.6114191, -0.3447592, -2.100998, 0, 0, 0, 1, 1,
-0.6109722, -1.683045, -2.337724, 0, 0, 0, 1, 1,
-0.6107672, -0.7617381, -1.386924, 0, 0, 0, 1, 1,
-0.6101406, 1.643753, -1.146103, 0, 0, 0, 1, 1,
-0.602502, -0.7281064, -3.75454, 0, 0, 0, 1, 1,
-0.6023048, 1.291048, -1.673546, 1, 1, 1, 1, 1,
-0.5985038, 1.92056, -0.6036798, 1, 1, 1, 1, 1,
-0.5973762, 2.457945, 0.5750574, 1, 1, 1, 1, 1,
-0.5854977, 0.3296681, -0.1073874, 1, 1, 1, 1, 1,
-0.5846695, -1.032367, -1.490652, 1, 1, 1, 1, 1,
-0.5807417, 2.150839, -0.9627904, 1, 1, 1, 1, 1,
-0.5786876, 1.425399, -1.504414, 1, 1, 1, 1, 1,
-0.5767695, 1.38413, 0.6992838, 1, 1, 1, 1, 1,
-0.5763523, -0.01454046, -2.591096, 1, 1, 1, 1, 1,
-0.5718497, 0.01990126, -1.110185, 1, 1, 1, 1, 1,
-0.5697574, 0.9655313, 1.080577, 1, 1, 1, 1, 1,
-0.5696577, 0.01672994, -0.8371815, 1, 1, 1, 1, 1,
-0.5652533, 1.185283, -1.1283, 1, 1, 1, 1, 1,
-0.564806, 0.4757988, -0.4350489, 1, 1, 1, 1, 1,
-0.5609553, 0.2374994, -1.029755, 1, 1, 1, 1, 1,
-0.5607998, -0.5618677, -2.130872, 0, 0, 1, 1, 1,
-0.5584908, 0.05410364, -1.559334, 1, 0, 0, 1, 1,
-0.5559795, -0.8726032, -0.5919935, 1, 0, 0, 1, 1,
-0.5519076, 0.67056, 0.3950997, 1, 0, 0, 1, 1,
-0.5491042, -1.633029, -2.306976, 1, 0, 0, 1, 1,
-0.5486175, 0.3552154, -0.509204, 1, 0, 0, 1, 1,
-0.5486054, -0.5965052, -0.5410484, 0, 0, 0, 1, 1,
-0.5455788, -0.4766928, -2.051, 0, 0, 0, 1, 1,
-0.5398343, -1.522797, -1.387835, 0, 0, 0, 1, 1,
-0.5395002, 1.657451, -0.9105116, 0, 0, 0, 1, 1,
-0.5350339, -0.1969953, -2.923801, 0, 0, 0, 1, 1,
-0.5346171, -1.31229, -0.9170143, 0, 0, 0, 1, 1,
-0.5331228, -1.08785, -3.203168, 0, 0, 0, 1, 1,
-0.5302924, -1.787939, -3.441669, 1, 1, 1, 1, 1,
-0.5216855, 0.2827778, -0.4918211, 1, 1, 1, 1, 1,
-0.5179316, 0.6653005, 0.02308992, 1, 1, 1, 1, 1,
-0.5176504, -1.48522, -4.044909, 1, 1, 1, 1, 1,
-0.5147774, -0.8786015, -2.175341, 1, 1, 1, 1, 1,
-0.5108097, 0.05809912, -1.598109, 1, 1, 1, 1, 1,
-0.5061065, -0.6975328, -3.210713, 1, 1, 1, 1, 1,
-0.5025371, 0.5057426, -0.9351488, 1, 1, 1, 1, 1,
-0.5018402, 0.6365715, -1.292449, 1, 1, 1, 1, 1,
-0.5010646, -0.3413005, -2.100936, 1, 1, 1, 1, 1,
-0.4942529, -0.1206457, -0.8643229, 1, 1, 1, 1, 1,
-0.4935548, 0.08562325, -0.5778936, 1, 1, 1, 1, 1,
-0.4900762, 1.706678, -1.469229, 1, 1, 1, 1, 1,
-0.4853028, 2.098876, -1.069089, 1, 1, 1, 1, 1,
-0.4800876, -0.04082291, -0.7289713, 1, 1, 1, 1, 1,
-0.4790235, -1.353211, -2.809164, 0, 0, 1, 1, 1,
-0.4755532, -0.5987675, -2.019789, 1, 0, 0, 1, 1,
-0.4742222, 1.524623, -1.290363, 1, 0, 0, 1, 1,
-0.474103, 1.7197, -0.665511, 1, 0, 0, 1, 1,
-0.4665174, 0.328564, -1.765604, 1, 0, 0, 1, 1,
-0.4660687, -0.319213, -1.304585, 1, 0, 0, 1, 1,
-0.4590801, 1.311259, -0.5523702, 0, 0, 0, 1, 1,
-0.4578109, 0.1610505, -1.958044, 0, 0, 0, 1, 1,
-0.4546437, -0.5607257, -3.27898, 0, 0, 0, 1, 1,
-0.4535287, 0.6716079, -2.034889, 0, 0, 0, 1, 1,
-0.4513948, 1.611698, 1.122264, 0, 0, 0, 1, 1,
-0.4509489, 0.7315252, 0.726927, 0, 0, 0, 1, 1,
-0.439404, 0.1497453, -1.335982, 0, 0, 0, 1, 1,
-0.4387772, -0.03741167, -2.091879, 1, 1, 1, 1, 1,
-0.4381365, -0.8560051, -2.597954, 1, 1, 1, 1, 1,
-0.4286789, 0.009096567, -1.215429, 1, 1, 1, 1, 1,
-0.4134887, 2.202147, -0.8721483, 1, 1, 1, 1, 1,
-0.4092404, 1.142664, -0.2788808, 1, 1, 1, 1, 1,
-0.40633, 0.8729247, -0.2384743, 1, 1, 1, 1, 1,
-0.3972818, -1.45761, -3.139062, 1, 1, 1, 1, 1,
-0.3968889, 1.195002, 0.919835, 1, 1, 1, 1, 1,
-0.3910238, -0.1386426, -1.838635, 1, 1, 1, 1, 1,
-0.3902559, -0.5349951, -3.154216, 1, 1, 1, 1, 1,
-0.3841482, 0.9351454, -0.1527298, 1, 1, 1, 1, 1,
-0.3828233, 0.8550539, -0.9809062, 1, 1, 1, 1, 1,
-0.3823508, -0.6252257, -3.096296, 1, 1, 1, 1, 1,
-0.3822075, -0.06047957, -0.846414, 1, 1, 1, 1, 1,
-0.3794379, 0.5259479, 0.8779412, 1, 1, 1, 1, 1,
-0.3793564, -0.3402548, -2.302363, 0, 0, 1, 1, 1,
-0.3792679, -1.414007, -1.607011, 1, 0, 0, 1, 1,
-0.3744227, 0.08205198, -0.5528706, 1, 0, 0, 1, 1,
-0.3742965, 0.5755011, -1.648492, 1, 0, 0, 1, 1,
-0.3642406, 0.3602385, -1.469605, 1, 0, 0, 1, 1,
-0.3556973, -0.1545083, -1.322571, 1, 0, 0, 1, 1,
-0.3556844, 0.4925844, -0.934085, 0, 0, 0, 1, 1,
-0.3548769, -0.09393547, -1.65854, 0, 0, 0, 1, 1,
-0.3525691, -1.315499, -2.802266, 0, 0, 0, 1, 1,
-0.3503697, 2.303409, 0.2143388, 0, 0, 0, 1, 1,
-0.350324, 1.635808, 0.1126895, 0, 0, 0, 1, 1,
-0.3452218, 0.6989399, -0.07371044, 0, 0, 0, 1, 1,
-0.3445959, 1.146092, 1.605544, 0, 0, 0, 1, 1,
-0.3396875, -0.7358564, -2.293059, 1, 1, 1, 1, 1,
-0.3370984, 1.742878, -0.4278053, 1, 1, 1, 1, 1,
-0.3368562, -0.2568704, -1.236878, 1, 1, 1, 1, 1,
-0.3368488, 2.291514, -0.2401781, 1, 1, 1, 1, 1,
-0.3361109, -0.1667136, -0.7934445, 1, 1, 1, 1, 1,
-0.3359594, 1.034078, -1.023802, 1, 1, 1, 1, 1,
-0.3337534, 0.1794578, 0.1475335, 1, 1, 1, 1, 1,
-0.3310588, -0.2199657, -2.424166, 1, 1, 1, 1, 1,
-0.3299115, -1.347782, -2.806786, 1, 1, 1, 1, 1,
-0.3282305, -0.2968277, -1.939271, 1, 1, 1, 1, 1,
-0.3258508, 0.3194684, -2.043181, 1, 1, 1, 1, 1,
-0.3252005, -2.378806, -3.014009, 1, 1, 1, 1, 1,
-0.3164686, -1.414617, -2.086643, 1, 1, 1, 1, 1,
-0.314381, -0.7540551, -5.017113, 1, 1, 1, 1, 1,
-0.2992057, 2.052691, 0.07876624, 1, 1, 1, 1, 1,
-0.2983305, 0.01034396, -0.9640301, 0, 0, 1, 1, 1,
-0.2937267, -1.525095, -1.048996, 1, 0, 0, 1, 1,
-0.2889143, -1.869755, -3.519796, 1, 0, 0, 1, 1,
-0.2840793, 0.9286234, 0.3351967, 1, 0, 0, 1, 1,
-0.2774845, 0.09818429, -2.749054, 1, 0, 0, 1, 1,
-0.2753358, -0.04346368, -1.468051, 1, 0, 0, 1, 1,
-0.273238, -0.489026, -0.3501117, 0, 0, 0, 1, 1,
-0.2731296, 2.000773, 0.5199632, 0, 0, 0, 1, 1,
-0.2726647, -0.9664777, -2.511865, 0, 0, 0, 1, 1,
-0.2685015, 0.6820365, 1.982505, 0, 0, 0, 1, 1,
-0.2615964, -0.3945384, -3.523448, 0, 0, 0, 1, 1,
-0.2607715, -1.415276, -2.192104, 0, 0, 0, 1, 1,
-0.2548007, 2.028578, -1.48762, 0, 0, 0, 1, 1,
-0.2546401, -0.1229921, -1.224087, 1, 1, 1, 1, 1,
-0.2493107, -0.0540205, -1.989963, 1, 1, 1, 1, 1,
-0.2486878, 2.463667, 0.3062374, 1, 1, 1, 1, 1,
-0.2466717, 0.7124557, -0.9030179, 1, 1, 1, 1, 1,
-0.2463655, -0.4763435, -2.730613, 1, 1, 1, 1, 1,
-0.2462866, -0.001630159, -1.455626, 1, 1, 1, 1, 1,
-0.2427372, 0.7624671, -0.9136617, 1, 1, 1, 1, 1,
-0.2376395, -1.02099, -3.639788, 1, 1, 1, 1, 1,
-0.2371968, 0.6018435, -2.122311, 1, 1, 1, 1, 1,
-0.2318635, 1.084036, -0.7234298, 1, 1, 1, 1, 1,
-0.2274082, 0.1582701, -0.1352192, 1, 1, 1, 1, 1,
-0.2266816, 0.2046757, 0.429034, 1, 1, 1, 1, 1,
-0.2261575, -0.5094984, -2.1243, 1, 1, 1, 1, 1,
-0.2248252, 1.20691, -1.076617, 1, 1, 1, 1, 1,
-0.2200938, -0.1531616, -1.187217, 1, 1, 1, 1, 1,
-0.2197874, -3.003215, -3.392378, 0, 0, 1, 1, 1,
-0.2188106, 0.7201065, 0.341454, 1, 0, 0, 1, 1,
-0.2170452, 2.141396, -0.4350641, 1, 0, 0, 1, 1,
-0.216547, 1.306833, -0.1587189, 1, 0, 0, 1, 1,
-0.2139396, 0.03924024, -0.9293699, 1, 0, 0, 1, 1,
-0.2135898, 0.8284576, 0.08326668, 1, 0, 0, 1, 1,
-0.2134593, -0.4840736, -2.906899, 0, 0, 0, 1, 1,
-0.2133263, 0.6884185, 0.8529264, 0, 0, 0, 1, 1,
-0.2085963, 0.8503909, 0.1428146, 0, 0, 0, 1, 1,
-0.2073424, 0.05275134, 0.7174869, 0, 0, 0, 1, 1,
-0.2054199, 0.5721521, -1.1609, 0, 0, 0, 1, 1,
-0.2030557, 0.3240489, -1.943124, 0, 0, 0, 1, 1,
-0.2027371, 0.2109998, -0.4309358, 0, 0, 0, 1, 1,
-0.1928619, -0.349498, -1.525822, 1, 1, 1, 1, 1,
-0.1859488, 0.8226197, 0.558576, 1, 1, 1, 1, 1,
-0.1857121, -1.199179, -3.084993, 1, 1, 1, 1, 1,
-0.1826448, -0.3769758, -3.872492, 1, 1, 1, 1, 1,
-0.1813492, -0.9821408, -2.604308, 1, 1, 1, 1, 1,
-0.1795341, 1.880043, 1.949439, 1, 1, 1, 1, 1,
-0.1756497, 0.1901614, -1.710732, 1, 1, 1, 1, 1,
-0.1744612, -1.533257, -3.925465, 1, 1, 1, 1, 1,
-0.1735083, 0.9032018, -1.723807, 1, 1, 1, 1, 1,
-0.1726454, 2.276485, 0.281532, 1, 1, 1, 1, 1,
-0.1618365, 1.709349, 0.9438692, 1, 1, 1, 1, 1,
-0.1540763, 0.4575429, -0.8734035, 1, 1, 1, 1, 1,
-0.149023, 1.257285, 0.4224916, 1, 1, 1, 1, 1,
-0.1467009, -1.074243, -3.950438, 1, 1, 1, 1, 1,
-0.1372564, -2.084876, -2.558072, 1, 1, 1, 1, 1,
-0.1365256, 0.1629996, -2.701251, 0, 0, 1, 1, 1,
-0.1331205, 0.2108164, -2.015486, 1, 0, 0, 1, 1,
-0.1315184, -1.103557, -2.596344, 1, 0, 0, 1, 1,
-0.1292515, 0.03412285, -1.285582, 1, 0, 0, 1, 1,
-0.1273246, 0.05265639, 0.1527724, 1, 0, 0, 1, 1,
-0.1266932, 0.03576554, 0.621512, 1, 0, 0, 1, 1,
-0.1262445, 0.2161369, -0.2114477, 0, 0, 0, 1, 1,
-0.1260419, 1.371341, 0.0870655, 0, 0, 0, 1, 1,
-0.1254502, 0.09987847, -1.455027, 0, 0, 0, 1, 1,
-0.1238854, 0.5762511, 0.2325346, 0, 0, 0, 1, 1,
-0.1197868, 0.8762654, 0.9657348, 0, 0, 0, 1, 1,
-0.1160689, -0.5298352, -2.647782, 0, 0, 0, 1, 1,
-0.1119145, 0.6864574, -0.2144891, 0, 0, 0, 1, 1,
-0.1118357, 0.6174165, 2.967779, 1, 1, 1, 1, 1,
-0.1094443, 0.9120634, 0.1474702, 1, 1, 1, 1, 1,
-0.1087313, -0.148697, -3.196859, 1, 1, 1, 1, 1,
-0.1057363, 0.03358429, -0.1601542, 1, 1, 1, 1, 1,
-0.101818, 0.1745589, 0.9739692, 1, 1, 1, 1, 1,
-0.0996334, -0.6101804, -1.28165, 1, 1, 1, 1, 1,
-0.09855598, -1.219765, -1.674333, 1, 1, 1, 1, 1,
-0.09506688, 1.385228, 0.1941063, 1, 1, 1, 1, 1,
-0.09275977, -1.525654, -3.524327, 1, 1, 1, 1, 1,
-0.09263952, -0.8047401, -2.10423, 1, 1, 1, 1, 1,
-0.09241959, -0.96203, -3.762599, 1, 1, 1, 1, 1,
-0.09219652, -0.4208775, -2.678358, 1, 1, 1, 1, 1,
-0.09086107, 1.736375, 1.570459, 1, 1, 1, 1, 1,
-0.08724324, -1.140038, -2.261625, 1, 1, 1, 1, 1,
-0.08258244, -1.601275, -2.956306, 1, 1, 1, 1, 1,
-0.08172321, -0.7717685, -1.282161, 0, 0, 1, 1, 1,
-0.08138707, 1.032142, 0.8478408, 1, 0, 0, 1, 1,
-0.07846382, -1.285023, -3.286409, 1, 0, 0, 1, 1,
-0.07518898, -0.6718165, -3.492333, 1, 0, 0, 1, 1,
-0.07259043, 1.29859, 0.6001299, 1, 0, 0, 1, 1,
-0.06895944, 0.2950998, 0.05333184, 1, 0, 0, 1, 1,
-0.06863537, -0.6440177, -2.205962, 0, 0, 0, 1, 1,
-0.06748629, 1.391252, -0.7027868, 0, 0, 0, 1, 1,
-0.06651582, 0.004075666, -2.672581, 0, 0, 0, 1, 1,
-0.0599579, -0.4811213, -2.36401, 0, 0, 0, 1, 1,
-0.0583217, -0.2308108, -1.607771, 0, 0, 0, 1, 1,
-0.05518881, -0.1385027, -3.039425, 0, 0, 0, 1, 1,
-0.05169307, 0.1781083, 0.6729639, 0, 0, 0, 1, 1,
-0.05159321, -0.5462928, -4.865215, 1, 1, 1, 1, 1,
-0.04901808, -1.166378, -1.948281, 1, 1, 1, 1, 1,
-0.04848654, 0.6060375, -0.5583879, 1, 1, 1, 1, 1,
-0.04627322, -0.322054, -3.307005, 1, 1, 1, 1, 1,
-0.04593047, 1.16465, -2.092813, 1, 1, 1, 1, 1,
-0.0448015, -1.712449, -4.159241, 1, 1, 1, 1, 1,
-0.04106745, -0.6964233, -3.312655, 1, 1, 1, 1, 1,
-0.03775461, 0.4135188, -0.009252347, 1, 1, 1, 1, 1,
-0.0361301, -1.804054, -3.094945, 1, 1, 1, 1, 1,
-0.02687918, 1.628266, -2.102756, 1, 1, 1, 1, 1,
-0.02615257, -1.429101, -2.867655, 1, 1, 1, 1, 1,
-0.02058, 0.6085229, -0.394429, 1, 1, 1, 1, 1,
-0.02051285, -0.9831709, -4.868467, 1, 1, 1, 1, 1,
-0.01749647, 0.3914227, -0.2426814, 1, 1, 1, 1, 1,
-0.01419219, -0.6324567, -4.071103, 1, 1, 1, 1, 1,
-0.0101511, -0.1759495, -2.598123, 0, 0, 1, 1, 1,
-0.009759129, 0.05524018, 0.8555976, 1, 0, 0, 1, 1,
-0.004745468, 0.1266765, -0.7315457, 1, 0, 0, 1, 1,
-0.004206426, 1.101905, 2.249244, 1, 0, 0, 1, 1,
-0.001854198, 0.5969981, 0.3718172, 1, 0, 0, 1, 1,
-0.0008824182, -1.166481, -4.863473, 1, 0, 0, 1, 1,
-0.0001268139, 0.2014219, -0.6614097, 0, 0, 0, 1, 1,
0.002269794, -0.04022431, 3.31773, 0, 0, 0, 1, 1,
0.002561098, -0.9078609, 1.967459, 0, 0, 0, 1, 1,
0.003990334, -2.046932, 3.436347, 0, 0, 0, 1, 1,
0.005539801, 0.494829, -1.975093, 0, 0, 0, 1, 1,
0.01309294, -0.3346919, 3.120561, 0, 0, 0, 1, 1,
0.01399067, -0.9079831, 2.474551, 0, 0, 0, 1, 1,
0.02226888, -0.3438683, 3.332647, 1, 1, 1, 1, 1,
0.02458321, -0.0665003, 0.835178, 1, 1, 1, 1, 1,
0.02496697, -1.401789, 3.200371, 1, 1, 1, 1, 1,
0.03331116, -2.049486, 1.584817, 1, 1, 1, 1, 1,
0.03354511, -1.396467, 0.784562, 1, 1, 1, 1, 1,
0.03499996, 0.7874429, 1.491439, 1, 1, 1, 1, 1,
0.03756671, -0.08291795, 2.705807, 1, 1, 1, 1, 1,
0.03778405, 0.7805602, -0.922981, 1, 1, 1, 1, 1,
0.03980785, -0.6243798, 2.653951, 1, 1, 1, 1, 1,
0.04185471, -1.447155, 0.9688874, 1, 1, 1, 1, 1,
0.04594877, 0.6732774, -0.0170573, 1, 1, 1, 1, 1,
0.04649422, 0.08031419, 1.048326, 1, 1, 1, 1, 1,
0.05488642, 0.5763953, -0.04376041, 1, 1, 1, 1, 1,
0.05900647, 0.3361571, -0.3112348, 1, 1, 1, 1, 1,
0.06689016, 2.514429, -0.1257933, 1, 1, 1, 1, 1,
0.07023983, -1.901, 3.223299, 0, 0, 1, 1, 1,
0.07029447, 1.13149, -0.0971907, 1, 0, 0, 1, 1,
0.07275452, 0.3204636, -0.2728013, 1, 0, 0, 1, 1,
0.07358301, 0.2999365, 0.6049412, 1, 0, 0, 1, 1,
0.07972772, 0.7241948, 0.4069377, 1, 0, 0, 1, 1,
0.08203929, 0.7231453, 2.011784, 1, 0, 0, 1, 1,
0.08233707, 0.5431948, 0.6157761, 0, 0, 0, 1, 1,
0.0866207, 0.7540757, 1.054345, 0, 0, 0, 1, 1,
0.08983029, -0.9803841, 3.49541, 0, 0, 0, 1, 1,
0.09032148, 0.4792587, -0.5795878, 0, 0, 0, 1, 1,
0.0914425, -0.1291793, 2.126527, 0, 0, 0, 1, 1,
0.09213728, -0.4708922, 4.764363, 0, 0, 0, 1, 1,
0.09230877, -1.352482, 2.761666, 0, 0, 0, 1, 1,
0.09255367, -0.8874485, 4.347945, 1, 1, 1, 1, 1,
0.09466197, -1.576068, 4.336669, 1, 1, 1, 1, 1,
0.09760712, -0.07135873, 0.9345283, 1, 1, 1, 1, 1,
0.1040368, 1.856794, -0.990613, 1, 1, 1, 1, 1,
0.1074984, 1.174189, 0.4057078, 1, 1, 1, 1, 1,
0.1076396, 1.985127, -0.6942608, 1, 1, 1, 1, 1,
0.1128691, -0.5291777, 2.704024, 1, 1, 1, 1, 1,
0.1129794, 0.7564964, -0.4718161, 1, 1, 1, 1, 1,
0.1130584, 0.6218687, 1.229944, 1, 1, 1, 1, 1,
0.1160341, 1.398709, 0.3373296, 1, 1, 1, 1, 1,
0.1170756, -0.4652254, 3.96578, 1, 1, 1, 1, 1,
0.1207693, 1.561558, 1.628564, 1, 1, 1, 1, 1,
0.1215307, 0.001229864, 2.369783, 1, 1, 1, 1, 1,
0.1227844, 0.5871068, 0.08631512, 1, 1, 1, 1, 1,
0.1231789, -1.967179, 4.260174, 1, 1, 1, 1, 1,
0.1246414, -0.3199261, 4.327968, 0, 0, 1, 1, 1,
0.1271208, -0.1203625, 2.692944, 1, 0, 0, 1, 1,
0.1303217, 0.061708, -0.2739237, 1, 0, 0, 1, 1,
0.1315821, -1.258111, 4.101141, 1, 0, 0, 1, 1,
0.1410773, 0.6804382, -0.03663047, 1, 0, 0, 1, 1,
0.1411783, -1.358028, 2.654482, 1, 0, 0, 1, 1,
0.1426727, 0.1219835, 1.206422, 0, 0, 0, 1, 1,
0.1427758, 0.1176987, 0.6241436, 0, 0, 0, 1, 1,
0.1453425, -1.142393, 3.942592, 0, 0, 0, 1, 1,
0.1456055, 0.1699517, 0.9339081, 0, 0, 0, 1, 1,
0.1493227, -0.551466, 1.74173, 0, 0, 0, 1, 1,
0.1501207, 0.4100696, 0.5887265, 0, 0, 0, 1, 1,
0.1634761, 1.093374, 0.4525246, 0, 0, 0, 1, 1,
0.1651891, -0.2845088, 1.979189, 1, 1, 1, 1, 1,
0.1678489, -0.07738066, 3.252075, 1, 1, 1, 1, 1,
0.1690987, 0.3877584, -1.99316, 1, 1, 1, 1, 1,
0.1735631, 0.9849512, 0.3262793, 1, 1, 1, 1, 1,
0.1748258, -0.2587994, 1.87776, 1, 1, 1, 1, 1,
0.1753526, -0.835561, 2.400167, 1, 1, 1, 1, 1,
0.1756031, 0.7373318, 0.7797496, 1, 1, 1, 1, 1,
0.1790293, 0.4356569, 0.3896693, 1, 1, 1, 1, 1,
0.1831058, -0.2132403, 2.203524, 1, 1, 1, 1, 1,
0.1843548, 0.5783427, -0.06532844, 1, 1, 1, 1, 1,
0.1878745, -1.308921, 2.03423, 1, 1, 1, 1, 1,
0.1895239, 0.2005132, 1.305423, 1, 1, 1, 1, 1,
0.1904238, 0.5772864, 1.28597, 1, 1, 1, 1, 1,
0.1963777, -0.9231182, 3.389172, 1, 1, 1, 1, 1,
0.1980751, -0.8225827, 3.604053, 1, 1, 1, 1, 1,
0.2047404, -1.05346, 4.00322, 0, 0, 1, 1, 1,
0.2049457, -0.8649928, 2.939017, 1, 0, 0, 1, 1,
0.2073392, -0.7433944, 1.520248, 1, 0, 0, 1, 1,
0.2090953, -1.950272, 1.952785, 1, 0, 0, 1, 1,
0.2097286, 0.02342516, 2.862739, 1, 0, 0, 1, 1,
0.2119373, 1.034798, 1.101331, 1, 0, 0, 1, 1,
0.2126422, -0.7196976, 3.850608, 0, 0, 0, 1, 1,
0.2140669, -1.727897, 2.874365, 0, 0, 0, 1, 1,
0.214338, 0.9523539, -1.088401, 0, 0, 0, 1, 1,
0.217535, 0.411222, 1.164101, 0, 0, 0, 1, 1,
0.2204589, -0.1898043, 1.109209, 0, 0, 0, 1, 1,
0.2215556, 0.277428, 0.5367744, 0, 0, 0, 1, 1,
0.2224521, 0.3732059, 1.677178, 0, 0, 0, 1, 1,
0.2237253, -0.6885203, 3.156611, 1, 1, 1, 1, 1,
0.2256356, 0.4618061, 0.7735763, 1, 1, 1, 1, 1,
0.2272385, -0.3687626, 1.60902, 1, 1, 1, 1, 1,
0.2287876, -0.3653578, -0.3781181, 1, 1, 1, 1, 1,
0.2319532, -0.478891, 3.619845, 1, 1, 1, 1, 1,
0.2344721, 0.9506626, 0.7273571, 1, 1, 1, 1, 1,
0.2363386, -1.646514, 1.422318, 1, 1, 1, 1, 1,
0.2386325, 1.035215, 0.4133709, 1, 1, 1, 1, 1,
0.2395836, 0.4124336, 0.4346568, 1, 1, 1, 1, 1,
0.2399545, 1.299328, 0.6575028, 1, 1, 1, 1, 1,
0.240596, -0.4190274, 3.712298, 1, 1, 1, 1, 1,
0.2438092, 0.4092855, -1.211962, 1, 1, 1, 1, 1,
0.246248, 1.298104, -0.5024697, 1, 1, 1, 1, 1,
0.2506024, 0.4177925, 0.100985, 1, 1, 1, 1, 1,
0.2527827, 0.6511518, -0.5281731, 1, 1, 1, 1, 1,
0.2528819, 0.1190746, 0.9539962, 0, 0, 1, 1, 1,
0.2534712, -0.06150542, 1.676718, 1, 0, 0, 1, 1,
0.2591987, -2.875982, 2.132551, 1, 0, 0, 1, 1,
0.2608629, -1.800615, 5.062816, 1, 0, 0, 1, 1,
0.2611142, 0.5056711, -1.807595, 1, 0, 0, 1, 1,
0.261605, 0.1422176, 0.4943959, 1, 0, 0, 1, 1,
0.2638322, -0.5246321, 1.643394, 0, 0, 0, 1, 1,
0.2681527, 0.1008236, 2.687715, 0, 0, 0, 1, 1,
0.2682238, 1.168037, -0.2593909, 0, 0, 0, 1, 1,
0.2700377, -0.3873709, 3.62304, 0, 0, 0, 1, 1,
0.2747867, 1.04892, -0.5144324, 0, 0, 0, 1, 1,
0.2749, 0.5752048, 0.9086485, 0, 0, 0, 1, 1,
0.2760917, -0.03504404, 2.191247, 0, 0, 0, 1, 1,
0.2772761, -1.945473, 2.973828, 1, 1, 1, 1, 1,
0.2809595, 0.2070954, 1.762996, 1, 1, 1, 1, 1,
0.2809708, -1.689715, 2.903696, 1, 1, 1, 1, 1,
0.2813099, 0.2624502, -2.021508, 1, 1, 1, 1, 1,
0.2817767, -0.9230966, 2.279166, 1, 1, 1, 1, 1,
0.2833309, 0.1054596, 1.176302, 1, 1, 1, 1, 1,
0.290033, 0.2413845, 0.9420112, 1, 1, 1, 1, 1,
0.2902487, 0.4524583, 1.4243, 1, 1, 1, 1, 1,
0.2913429, -0.4996146, 3.927854, 1, 1, 1, 1, 1,
0.2916877, -0.009212969, 1.988186, 1, 1, 1, 1, 1,
0.2944158, -0.6904597, 3.042567, 1, 1, 1, 1, 1,
0.2961208, 2.010059, 0.181831, 1, 1, 1, 1, 1,
0.298311, -1.389952, 2.001324, 1, 1, 1, 1, 1,
0.3024839, -1.217003, 2.551628, 1, 1, 1, 1, 1,
0.3036875, 0.5700066, 1.590818, 1, 1, 1, 1, 1,
0.3042144, -1.344992, 0.6997461, 0, 0, 1, 1, 1,
0.309298, 0.6717442, 0.3821672, 1, 0, 0, 1, 1,
0.311193, 1.039678, -0.1444542, 1, 0, 0, 1, 1,
0.3124962, 0.06459171, 1.053816, 1, 0, 0, 1, 1,
0.3162492, 0.7718848, 1.04876, 1, 0, 0, 1, 1,
0.3167687, 1.203673, 1.017272, 1, 0, 0, 1, 1,
0.3177781, -1.15254, 2.976288, 0, 0, 0, 1, 1,
0.3189195, -0.2680006, 2.664201, 0, 0, 0, 1, 1,
0.3196366, 0.1237952, 1.570701, 0, 0, 0, 1, 1,
0.3225015, 0.7432233, -0.7112895, 0, 0, 0, 1, 1,
0.3233651, 0.1034316, 1.01564, 0, 0, 0, 1, 1,
0.3302027, 0.5039762, 0.286483, 0, 0, 0, 1, 1,
0.3306771, -0.8941636, 2.452016, 0, 0, 0, 1, 1,
0.3345163, 0.3365952, 1.430641, 1, 1, 1, 1, 1,
0.3353068, -0.5350361, 2.954298, 1, 1, 1, 1, 1,
0.3387702, -0.7318655, 2.6847, 1, 1, 1, 1, 1,
0.3429013, -0.5962747, 3.135288, 1, 1, 1, 1, 1,
0.3533494, -0.9441864, 3.430398, 1, 1, 1, 1, 1,
0.3555617, 1.114065, 1.194806, 1, 1, 1, 1, 1,
0.3563417, -0.3176773, 1.034253, 1, 1, 1, 1, 1,
0.3610216, -1.334415, 1.878891, 1, 1, 1, 1, 1,
0.3670445, 1.000077, 1.224545, 1, 1, 1, 1, 1,
0.3671584, -0.4265829, 0.9035671, 1, 1, 1, 1, 1,
0.3695908, 2.763747, 0.2728564, 1, 1, 1, 1, 1,
0.3716043, 0.7299106, 2.583898, 1, 1, 1, 1, 1,
0.3724897, 1.253416, 1.387511, 1, 1, 1, 1, 1,
0.3726172, 0.2046405, 1.750356, 1, 1, 1, 1, 1,
0.3727601, -1.261322, 4.30287, 1, 1, 1, 1, 1,
0.3733085, -1.024727, 3.788723, 0, 0, 1, 1, 1,
0.3782887, 0.5753496, 0.04731426, 1, 0, 0, 1, 1,
0.3788992, 0.9219208, 0.3889271, 1, 0, 0, 1, 1,
0.3798673, 0.9927116, 3.012318, 1, 0, 0, 1, 1,
0.3811119, -0.6913336, 4.050244, 1, 0, 0, 1, 1,
0.3882822, 1.266698, -1.20174, 1, 0, 0, 1, 1,
0.3912369, 1.037584, 0.2956659, 0, 0, 0, 1, 1,
0.3950459, 0.929689, -0.5759708, 0, 0, 0, 1, 1,
0.3966428, 0.1210848, 2.513657, 0, 0, 0, 1, 1,
0.4095908, -1.956882, 3.027467, 0, 0, 0, 1, 1,
0.4128893, 0.667129, 1.328222, 0, 0, 0, 1, 1,
0.4148359, 0.03065292, 2.678439, 0, 0, 0, 1, 1,
0.4230509, 0.9343289, 0.3394355, 0, 0, 0, 1, 1,
0.4239033, 1.353644, -1.34418, 1, 1, 1, 1, 1,
0.4293685, -0.9269316, 0.7505556, 1, 1, 1, 1, 1,
0.4338554, -0.7419603, 2.054471, 1, 1, 1, 1, 1,
0.4343691, 0.2734898, -0.3040772, 1, 1, 1, 1, 1,
0.4345724, -0.1694003, 1.052256, 1, 1, 1, 1, 1,
0.4436505, 0.5027316, 0.3044495, 1, 1, 1, 1, 1,
0.4443237, 0.8123965, 1.795076, 1, 1, 1, 1, 1,
0.4454854, 0.4906394, 2.11028, 1, 1, 1, 1, 1,
0.4467838, -1.505566, 1.110109, 1, 1, 1, 1, 1,
0.4518307, 0.4022973, 1.245025, 1, 1, 1, 1, 1,
0.4584765, 1.657669, -0.01808495, 1, 1, 1, 1, 1,
0.4605998, -0.5190712, 2.006293, 1, 1, 1, 1, 1,
0.4638041, -0.3768612, 2.458955, 1, 1, 1, 1, 1,
0.4852682, 0.05338897, 2.240769, 1, 1, 1, 1, 1,
0.487615, -0.9010056, 2.423954, 1, 1, 1, 1, 1,
0.4922824, 1.406037, 1.55951, 0, 0, 1, 1, 1,
0.4922835, -0.2878469, 2.890667, 1, 0, 0, 1, 1,
0.5002545, 0.1856698, 2.043016, 1, 0, 0, 1, 1,
0.5042346, 0.2740855, 1.593226, 1, 0, 0, 1, 1,
0.5078688, 0.4089622, -0.4219254, 1, 0, 0, 1, 1,
0.507957, 1.236778, 0.8761216, 1, 0, 0, 1, 1,
0.5144833, -0.5506981, 2.41726, 0, 0, 0, 1, 1,
0.5255295, 0.9597078, 0.2738615, 0, 0, 0, 1, 1,
0.5261176, 0.2581678, 2.612423, 0, 0, 0, 1, 1,
0.5265098, 1.633663, -0.5308577, 0, 0, 0, 1, 1,
0.5285894, -2.272702, 5.136497, 0, 0, 0, 1, 1,
0.5295675, 0.6683078, 0.1744961, 0, 0, 0, 1, 1,
0.5314631, -1.147074, 4.400115, 0, 0, 0, 1, 1,
0.532371, -0.3780061, 0.2721115, 1, 1, 1, 1, 1,
0.5337538, 1.995341, 1.021742, 1, 1, 1, 1, 1,
0.5364981, 0.8391064, 2.956935, 1, 1, 1, 1, 1,
0.5373516, 0.3224171, 0.4462642, 1, 1, 1, 1, 1,
0.5379162, -1.222615, 2.515344, 1, 1, 1, 1, 1,
0.5397772, -0.8282848, 0.8730368, 1, 1, 1, 1, 1,
0.5586556, 0.6511355, -1.01586, 1, 1, 1, 1, 1,
0.5620116, 2.115756, -0.1284084, 1, 1, 1, 1, 1,
0.5642782, -0.6628535, 4.211716, 1, 1, 1, 1, 1,
0.5676384, 0.7176698, 0.2858036, 1, 1, 1, 1, 1,
0.5691542, -0.3066801, 0.2441649, 1, 1, 1, 1, 1,
0.5800282, 1.535023, -1.5056, 1, 1, 1, 1, 1,
0.5825243, 0.9410369, 1.788754, 1, 1, 1, 1, 1,
0.5846773, -1.929448, 1.395628, 1, 1, 1, 1, 1,
0.584879, -1.766099, 2.580311, 1, 1, 1, 1, 1,
0.5872622, -0.6470577, 2.19506, 0, 0, 1, 1, 1,
0.5900816, -0.7216251, 1.955517, 1, 0, 0, 1, 1,
0.5922874, 0.6217443, 0.6534262, 1, 0, 0, 1, 1,
0.5932555, 0.5396273, 2.200048, 1, 0, 0, 1, 1,
0.5938123, -1.152774, 2.738112, 1, 0, 0, 1, 1,
0.5942713, -0.827066, 2.310029, 1, 0, 0, 1, 1,
0.5955198, -1.884522, 3.419096, 0, 0, 0, 1, 1,
0.5986014, -0.6257923, 2.975765, 0, 0, 0, 1, 1,
0.6027287, -0.644872, 3.707963, 0, 0, 0, 1, 1,
0.6073869, -1.045079, 2.489804, 0, 0, 0, 1, 1,
0.6102431, -1.850899, 3.268502, 0, 0, 0, 1, 1,
0.6115384, -1.117188, 2.433382, 0, 0, 0, 1, 1,
0.6129441, 0.1030015, 2.431071, 0, 0, 0, 1, 1,
0.6152588, -0.4535136, 2.531193, 1, 1, 1, 1, 1,
0.6209299, 1.282007, 0.6955824, 1, 1, 1, 1, 1,
0.6236142, -1.657825, 3.518623, 1, 1, 1, 1, 1,
0.6289245, -1.045917, 1.879174, 1, 1, 1, 1, 1,
0.6328401, -0.5731439, 0.8107374, 1, 1, 1, 1, 1,
0.633432, 0.8022849, 1.747991, 1, 1, 1, 1, 1,
0.6336763, -0.8773814, 3.559819, 1, 1, 1, 1, 1,
0.6353537, -0.04231563, 0.6739551, 1, 1, 1, 1, 1,
0.6399831, 1.034339, 0.4524646, 1, 1, 1, 1, 1,
0.6469315, -0.8639951, 1.736311, 1, 1, 1, 1, 1,
0.6473898, 0.02703943, 0.7603204, 1, 1, 1, 1, 1,
0.6529362, -1.929186, 4.208794, 1, 1, 1, 1, 1,
0.6571313, 1.554575, 1.359491, 1, 1, 1, 1, 1,
0.6581532, -1.239806, 1.696787, 1, 1, 1, 1, 1,
0.6583636, -0.2401508, 2.250246, 1, 1, 1, 1, 1,
0.6588192, 1.453174, -0.2309958, 0, 0, 1, 1, 1,
0.6605076, 1.127032, 1.647724, 1, 0, 0, 1, 1,
0.6627402, -2.394967, 4.294915, 1, 0, 0, 1, 1,
0.6663335, -1.453108, 3.807281, 1, 0, 0, 1, 1,
0.6680754, 0.9777663, -0.0204253, 1, 0, 0, 1, 1,
0.6709318, -0.34054, 2.089614, 1, 0, 0, 1, 1,
0.6770899, -0.673175, 2.869613, 0, 0, 0, 1, 1,
0.6778851, -0.2108236, 3.440602, 0, 0, 0, 1, 1,
0.6778863, 0.1328935, 3.732664, 0, 0, 0, 1, 1,
0.6882313, -0.5614405, 1.038162, 0, 0, 0, 1, 1,
0.6897495, 0.7197095, 1.329707, 0, 0, 0, 1, 1,
0.6922666, -0.2369853, 2.425897, 0, 0, 0, 1, 1,
0.6968658, -1.419841, 3.861838, 0, 0, 0, 1, 1,
0.69874, 0.4586833, 1.06143, 1, 1, 1, 1, 1,
0.7017202, 0.2170031, 0.6117828, 1, 1, 1, 1, 1,
0.7020013, 1.33662, -1.609169, 1, 1, 1, 1, 1,
0.7030003, -0.6745021, 3.228117, 1, 1, 1, 1, 1,
0.7037756, 0.8207866, 1.996154, 1, 1, 1, 1, 1,
0.7052143, -0.06077967, 3.009324, 1, 1, 1, 1, 1,
0.7078657, -0.03799628, 3.223231, 1, 1, 1, 1, 1,
0.7081693, 1.399941, 0.2264386, 1, 1, 1, 1, 1,
0.7084937, 1.389407, 1.210692, 1, 1, 1, 1, 1,
0.7098256, 0.4013964, 3.583539, 1, 1, 1, 1, 1,
0.7134691, 0.5767492, 0.5787964, 1, 1, 1, 1, 1,
0.7160103, 0.7844942, 0.1105941, 1, 1, 1, 1, 1,
0.7200027, -0.33617, 2.83693, 1, 1, 1, 1, 1,
0.7232349, -1.519792, 4.640727, 1, 1, 1, 1, 1,
0.7236984, 0.2816123, 3.525733, 1, 1, 1, 1, 1,
0.7279126, 0.04603812, 0.9129089, 0, 0, 1, 1, 1,
0.7310892, 0.4391527, 1.509996, 1, 0, 0, 1, 1,
0.7383827, -1.218075, 0.7530361, 1, 0, 0, 1, 1,
0.7405204, -1.476134, 4.302728, 1, 0, 0, 1, 1,
0.7415541, 0.9494904, -0.6685294, 1, 0, 0, 1, 1,
0.7452739, -0.02217521, 2.593853, 1, 0, 0, 1, 1,
0.746201, 1.00504, 0.8670778, 0, 0, 0, 1, 1,
0.7513076, 0.4116868, 0.9523385, 0, 0, 0, 1, 1,
0.7521626, 2.022524, 0.2043732, 0, 0, 0, 1, 1,
0.754811, -1.053973, 1.175219, 0, 0, 0, 1, 1,
0.7569852, 0.2672454, 2.113894, 0, 0, 0, 1, 1,
0.76069, -1.738832, 3.347804, 0, 0, 0, 1, 1,
0.7648327, -3.036915, 2.155398, 0, 0, 0, 1, 1,
0.778975, 0.1305712, 1.919721, 1, 1, 1, 1, 1,
0.7856078, -1.180119, 3.126078, 1, 1, 1, 1, 1,
0.7903259, -0.8037954, 1.597236, 1, 1, 1, 1, 1,
0.7930527, 0.8092459, 0.08147999, 1, 1, 1, 1, 1,
0.7977917, -2.152771, 2.909853, 1, 1, 1, 1, 1,
0.7994832, -2.167155, 3.250205, 1, 1, 1, 1, 1,
0.8002191, -0.02719098, 1.209091, 1, 1, 1, 1, 1,
0.801675, 2.193765, 1.566278, 1, 1, 1, 1, 1,
0.8035282, 0.7822824, 0.2321814, 1, 1, 1, 1, 1,
0.8054563, -1.561439, 1.568213, 1, 1, 1, 1, 1,
0.8077963, 2.049908, 0.9700012, 1, 1, 1, 1, 1,
0.8090287, -1.129643, 3.894936, 1, 1, 1, 1, 1,
0.8094994, -1.067064, 2.920726, 1, 1, 1, 1, 1,
0.8105223, 1.314995, 1.429873, 1, 1, 1, 1, 1,
0.8106065, 1.571773, 0.8952665, 1, 1, 1, 1, 1,
0.8212093, -0.8965245, 1.672261, 0, 0, 1, 1, 1,
0.8253918, -0.6683472, 0.9255776, 1, 0, 0, 1, 1,
0.8274773, 0.4317937, 1.264606, 1, 0, 0, 1, 1,
0.8342624, 0.3280577, 1.308908, 1, 0, 0, 1, 1,
0.8357124, -0.5022687, 2.094349, 1, 0, 0, 1, 1,
0.8372688, 0.9213121, 0.1809047, 1, 0, 0, 1, 1,
0.8398411, -0.8951931, 1.71249, 0, 0, 0, 1, 1,
0.8407076, -1.376385, 2.197293, 0, 0, 0, 1, 1,
0.8420366, 0.4481069, 0.7616974, 0, 0, 0, 1, 1,
0.8462512, -1.822084, 3.879789, 0, 0, 0, 1, 1,
0.8469983, 0.5842239, 0.9338963, 0, 0, 0, 1, 1,
0.848779, -0.1473561, 2.487667, 0, 0, 0, 1, 1,
0.8530591, 0.785365, 1.708762, 0, 0, 0, 1, 1,
0.8567589, -0.7811976, 1.244096, 1, 1, 1, 1, 1,
0.8579966, -0.7798461, 3.462077, 1, 1, 1, 1, 1,
0.8614812, -0.3434627, 2.863406, 1, 1, 1, 1, 1,
0.8630784, 1.786855, 0.2850721, 1, 1, 1, 1, 1,
0.8732674, -2.517463, 2.183554, 1, 1, 1, 1, 1,
0.8738554, -0.05114467, 2.042198, 1, 1, 1, 1, 1,
0.8768148, -1.440269, 2.557287, 1, 1, 1, 1, 1,
0.8772219, -2.352522, 1.571123, 1, 1, 1, 1, 1,
0.8875931, 0.4390994, 3.672302, 1, 1, 1, 1, 1,
0.8919288, -2.508415, 3.940932, 1, 1, 1, 1, 1,
0.8975465, -2.232555, 3.480465, 1, 1, 1, 1, 1,
0.8987092, -0.6598033, 2.834099, 1, 1, 1, 1, 1,
0.8989466, 0.4284739, -0.8760343, 1, 1, 1, 1, 1,
0.9005066, 0.7700689, -0.041851, 1, 1, 1, 1, 1,
0.9045166, -0.3242324, 2.361868, 1, 1, 1, 1, 1,
0.9092234, -1.789655, 1.949461, 0, 0, 1, 1, 1,
0.9106497, -0.1904411, 1.178158, 1, 0, 0, 1, 1,
0.9130327, -0.3270382, 2.591793, 1, 0, 0, 1, 1,
0.9153129, 1.070753, 1.662007, 1, 0, 0, 1, 1,
0.9156855, 0.634125, 2.448551, 1, 0, 0, 1, 1,
0.9188026, 0.682772, 0.01182033, 1, 0, 0, 1, 1,
0.9212441, -1.730649, 3.294626, 0, 0, 0, 1, 1,
0.9285315, 1.274415, -0.7550406, 0, 0, 0, 1, 1,
0.931996, 0.4976819, 1.302228, 0, 0, 0, 1, 1,
0.9342983, 0.08473424, 0.5608476, 0, 0, 0, 1, 1,
0.9416711, 0.4842236, 0.5133464, 0, 0, 0, 1, 1,
0.9544395, 1.148254, -0.3807874, 0, 0, 0, 1, 1,
0.9633866, -0.438828, 3.051627, 0, 0, 0, 1, 1,
0.9651211, -0.2072351, 2.088481, 1, 1, 1, 1, 1,
0.9677205, -1.499812, 3.694785, 1, 1, 1, 1, 1,
0.9742393, -0.9321173, 2.967256, 1, 1, 1, 1, 1,
0.9823418, 0.8143412, 2.117268, 1, 1, 1, 1, 1,
0.9824342, -0.8907317, 1.665353, 1, 1, 1, 1, 1,
0.9831333, 1.018839, 0.1090778, 1, 1, 1, 1, 1,
0.989271, -0.4758216, 2.048014, 1, 1, 1, 1, 1,
0.9935333, -0.8334739, 0.9100891, 1, 1, 1, 1, 1,
0.9978145, 2.887849, 0.9196005, 1, 1, 1, 1, 1,
0.9983157, 0.2224365, 2.518892, 1, 1, 1, 1, 1,
1.001421, -1.393749, 2.497997, 1, 1, 1, 1, 1,
1.009838, -0.07959723, 1.236559, 1, 1, 1, 1, 1,
1.010467, 0.3204519, 2.272761, 1, 1, 1, 1, 1,
1.013285, -0.08261962, 1.692082, 1, 1, 1, 1, 1,
1.014387, -1.126455, 2.188741, 1, 1, 1, 1, 1,
1.016241, 0.5564581, 0.9594598, 0, 0, 1, 1, 1,
1.016371, 0.2256788, 0.6062027, 1, 0, 0, 1, 1,
1.020747, 1.142508, 0.5896597, 1, 0, 0, 1, 1,
1.027058, 0.5402542, 1.066433, 1, 0, 0, 1, 1,
1.031776, -0.03689006, 1.535681, 1, 0, 0, 1, 1,
1.03382, 1.162073, 1.19901, 1, 0, 0, 1, 1,
1.034798, 0.9610884, -0.1728042, 0, 0, 0, 1, 1,
1.035222, -1.208381, 4.101619, 0, 0, 0, 1, 1,
1.035466, 0.06120142, 3.38713, 0, 0, 0, 1, 1,
1.04183, -1.421705, 1.160045, 0, 0, 0, 1, 1,
1.044875, 1.518569, 1.115053, 0, 0, 0, 1, 1,
1.046376, -1.485082, 1.993168, 0, 0, 0, 1, 1,
1.051159, -0.2740625, 1.55118, 0, 0, 0, 1, 1,
1.051599, 0.2281378, 1.823971, 1, 1, 1, 1, 1,
1.057071, -0.5629112, 1.263594, 1, 1, 1, 1, 1,
1.06275, -0.4348823, 3.04792, 1, 1, 1, 1, 1,
1.063844, -0.5225591, -0.04972682, 1, 1, 1, 1, 1,
1.064533, 1.16784, 2.006671, 1, 1, 1, 1, 1,
1.073177, -0.2536207, 4.399266, 1, 1, 1, 1, 1,
1.073634, -0.8705117, 3.646664, 1, 1, 1, 1, 1,
1.082598, -0.491751, -0.5991913, 1, 1, 1, 1, 1,
1.083821, -0.1067801, 1.553583, 1, 1, 1, 1, 1,
1.10189, -0.148701, 1.666693, 1, 1, 1, 1, 1,
1.103291, -0.9015791, 1.983995, 1, 1, 1, 1, 1,
1.109788, 0.1794762, 2.265845, 1, 1, 1, 1, 1,
1.111109, 1.241822, 0.8210363, 1, 1, 1, 1, 1,
1.112129, 1.079132, -0.3825519, 1, 1, 1, 1, 1,
1.123031, -0.5684953, 1.799299, 1, 1, 1, 1, 1,
1.12783, 1.31238, 0.6526863, 0, 0, 1, 1, 1,
1.133751, -1.776499, 3.345346, 1, 0, 0, 1, 1,
1.139551, -1.213653, 3.275025, 1, 0, 0, 1, 1,
1.142716, 1.375984, 0.02167805, 1, 0, 0, 1, 1,
1.143348, -0.9603534, 3.884777, 1, 0, 0, 1, 1,
1.15256, -1.03219, 3.680588, 1, 0, 0, 1, 1,
1.157717, 0.2053861, 0.4601334, 0, 0, 0, 1, 1,
1.16996, -0.6675697, 1.639566, 0, 0, 0, 1, 1,
1.181583, -1.45113, 2.652414, 0, 0, 0, 1, 1,
1.185438, -0.9428226, 1.750017, 0, 0, 0, 1, 1,
1.193948, 0.7409415, 1.974344, 0, 0, 0, 1, 1,
1.196329, 0.8633548, 2.892816, 0, 0, 0, 1, 1,
1.200171, 0.3815248, -0.1853904, 0, 0, 0, 1, 1,
1.202764, 0.6052228, -1.439407, 1, 1, 1, 1, 1,
1.205151, 0.8141013, 0.3134281, 1, 1, 1, 1, 1,
1.209129, 0.4607538, 3.079715, 1, 1, 1, 1, 1,
1.213261, -2.486302, 3.54257, 1, 1, 1, 1, 1,
1.217846, -1.394764, 3.312424, 1, 1, 1, 1, 1,
1.220438, -1.353709, 4.26888, 1, 1, 1, 1, 1,
1.229801, -1.272197, 2.411392, 1, 1, 1, 1, 1,
1.243587, 0.09136081, 1.770674, 1, 1, 1, 1, 1,
1.253034, -1.035339, 2.98016, 1, 1, 1, 1, 1,
1.253685, 1.393481, 0.4380453, 1, 1, 1, 1, 1,
1.259916, 0.3570106, 0.3825798, 1, 1, 1, 1, 1,
1.26499, -1.026574, 0.8128815, 1, 1, 1, 1, 1,
1.267201, 1.309803, 1.226, 1, 1, 1, 1, 1,
1.267539, 0.9639041, -1.121834, 1, 1, 1, 1, 1,
1.267594, 1.21753, 1.325739, 1, 1, 1, 1, 1,
1.269107, 0.6994923, 3.9417, 0, 0, 1, 1, 1,
1.271013, 1.193948, 0.8728397, 1, 0, 0, 1, 1,
1.278443, -0.2278492, 2.666396, 1, 0, 0, 1, 1,
1.282034, -1.710108, 2.64539, 1, 0, 0, 1, 1,
1.284636, 0.9542398, -0.2696554, 1, 0, 0, 1, 1,
1.306268, 0.4743612, 1.531686, 1, 0, 0, 1, 1,
1.308701, -0.3728398, 1.266184, 0, 0, 0, 1, 1,
1.310361, 0.9996793, 1.430781, 0, 0, 0, 1, 1,
1.332816, 0.3598729, 0.3424834, 0, 0, 0, 1, 1,
1.338833, 0.5642655, 0.8447477, 0, 0, 0, 1, 1,
1.342693, -2.247814, 2.120737, 0, 0, 0, 1, 1,
1.349023, -0.2298213, -0.5976177, 0, 0, 0, 1, 1,
1.349345, -0.8090765, 1.413957, 0, 0, 0, 1, 1,
1.356757, 1.369768, 1.366655, 1, 1, 1, 1, 1,
1.370015, -0.2110788, 2.611958, 1, 1, 1, 1, 1,
1.371321, 0.4126151, 0.6204131, 1, 1, 1, 1, 1,
1.378331, -0.6258364, 0.7494734, 1, 1, 1, 1, 1,
1.380843, 0.9159613, 0.9509139, 1, 1, 1, 1, 1,
1.387227, 1.891101, -0.003998327, 1, 1, 1, 1, 1,
1.391901, 0.2123684, 1.791997, 1, 1, 1, 1, 1,
1.402254, -0.8097147, 3.433595, 1, 1, 1, 1, 1,
1.405265, -0.9316849, 2.045024, 1, 1, 1, 1, 1,
1.410729, -1.640885, 3.966052, 1, 1, 1, 1, 1,
1.416676, 0.4692117, 1.081105, 1, 1, 1, 1, 1,
1.425356, 0.2506672, 3.580491, 1, 1, 1, 1, 1,
1.430252, 1.109244, 1.917738, 1, 1, 1, 1, 1,
1.444173, -0.1528723, -0.1623686, 1, 1, 1, 1, 1,
1.445787, -1.156497, 4.375212, 1, 1, 1, 1, 1,
1.447743, -1.477074, 3.40821, 0, 0, 1, 1, 1,
1.449639, 0.3233651, 2.500514, 1, 0, 0, 1, 1,
1.476142, 1.605698, -0.5817435, 1, 0, 0, 1, 1,
1.47808, 1.634677, 1.258559, 1, 0, 0, 1, 1,
1.494833, 1.094038, 1.622354, 1, 0, 0, 1, 1,
1.496122, 0.10032, 1.248708, 1, 0, 0, 1, 1,
1.520212, -1.469898, 3.802993, 0, 0, 0, 1, 1,
1.521199, -0.696615, 0.1091219, 0, 0, 0, 1, 1,
1.522133, -0.3610488, 1.620726, 0, 0, 0, 1, 1,
1.52237, -0.713448, 2.771399, 0, 0, 0, 1, 1,
1.524779, 1.043198, 3.339004, 0, 0, 0, 1, 1,
1.532942, -0.06120096, 0.5766789, 0, 0, 0, 1, 1,
1.535087, 0.8510527, 1.820775, 0, 0, 0, 1, 1,
1.546537, 1.398368, 0.8925321, 1, 1, 1, 1, 1,
1.546669, -0.6777304, 2.038728, 1, 1, 1, 1, 1,
1.559626, 0.8358009, 1.474614, 1, 1, 1, 1, 1,
1.581699, 0.3620393, 2.484156, 1, 1, 1, 1, 1,
1.582586, -0.7017063, 3.271672, 1, 1, 1, 1, 1,
1.58717, 0.2644412, 0.6129724, 1, 1, 1, 1, 1,
1.593964, 1.195979, 0.1748426, 1, 1, 1, 1, 1,
1.59511, -0.4841886, 4.022892, 1, 1, 1, 1, 1,
1.596069, -1.022191, 1.920224, 1, 1, 1, 1, 1,
1.606608, 0.2992318, 1.920226, 1, 1, 1, 1, 1,
1.612425, 1.04434, 1.629551, 1, 1, 1, 1, 1,
1.630248, -0.5183868, 1.155239, 1, 1, 1, 1, 1,
1.632895, -0.3679051, 2.612831, 1, 1, 1, 1, 1,
1.639162, 1.359907, 0.6346544, 1, 1, 1, 1, 1,
1.642354, 0.142368, -0.1915387, 1, 1, 1, 1, 1,
1.675353, -2.921625, 1.318676, 0, 0, 1, 1, 1,
1.691393, -0.0365585, 2.064189, 1, 0, 0, 1, 1,
1.705554, -1.277753, 1.152737, 1, 0, 0, 1, 1,
1.737359, 1.761347, 1.388667, 1, 0, 0, 1, 1,
1.739781, 0.09116779, 2.877299, 1, 0, 0, 1, 1,
1.759696, 0.4065768, 1.332477, 1, 0, 0, 1, 1,
1.783941, -0.04466058, 1.889527, 0, 0, 0, 1, 1,
1.799418, -1.408086, 3.514852, 0, 0, 0, 1, 1,
1.804504, -0.5684162, 1.692986, 0, 0, 0, 1, 1,
1.806604, 1.047994, 1.158388, 0, 0, 0, 1, 1,
1.814813, -1.417302, 0.9155187, 0, 0, 0, 1, 1,
1.815591, -0.08565131, 1.865998, 0, 0, 0, 1, 1,
1.83885, -0.249479, 1.626603, 0, 0, 0, 1, 1,
1.84274, 1.623837, 0.7409783, 1, 1, 1, 1, 1,
1.845927, -0.2062144, 1.015723, 1, 1, 1, 1, 1,
1.856449, 1.078899, 0.2621715, 1, 1, 1, 1, 1,
1.857544, 1.911973, 0.4296323, 1, 1, 1, 1, 1,
1.858649, 1.949407, 0.4825377, 1, 1, 1, 1, 1,
1.874937, 0.804996, 0.06059561, 1, 1, 1, 1, 1,
1.897139, -0.03703715, 1.790905, 1, 1, 1, 1, 1,
1.920712, -0.4382254, 2.61018, 1, 1, 1, 1, 1,
1.922205, -0.6869079, 0.2233318, 1, 1, 1, 1, 1,
1.941173, -1.338873, 1.152291, 1, 1, 1, 1, 1,
1.977408, -0.1081168, 1.273156, 1, 1, 1, 1, 1,
1.983109, -0.3501709, 1.211429, 1, 1, 1, 1, 1,
1.994535, -0.5768868, 1.494369, 1, 1, 1, 1, 1,
2.034396, -0.986492, 0.6430398, 1, 1, 1, 1, 1,
2.072078, 1.906477, -0.2392029, 1, 1, 1, 1, 1,
2.113971, -0.8962273, 3.081083, 0, 0, 1, 1, 1,
2.139601, -0.5681239, 2.325552, 1, 0, 0, 1, 1,
2.159538, -1.135481, 1.362707, 1, 0, 0, 1, 1,
2.190655, -0.2039849, 0.7074264, 1, 0, 0, 1, 1,
2.226841, -2.14856, 2.744201, 1, 0, 0, 1, 1,
2.284583, 1.193271, 1.899128, 1, 0, 0, 1, 1,
2.307957, -1.893634, 4.230614, 0, 0, 0, 1, 1,
2.367715, -1.387265, 1.229815, 0, 0, 0, 1, 1,
2.408297, -1.719191, 2.792948, 0, 0, 0, 1, 1,
2.411323, -1.507106, 2.413205, 0, 0, 0, 1, 1,
2.4889, 0.5658752, 0.7086542, 0, 0, 0, 1, 1,
2.490328, -0.1187908, 1.659857, 0, 0, 0, 1, 1,
2.54213, 0.7605577, -0.2123283, 0, 0, 0, 1, 1,
2.554921, 0.4625238, 0.4656695, 1, 1, 1, 1, 1,
2.561885, 0.5722851, 2.338019, 1, 1, 1, 1, 1,
2.578601, 0.3634968, 2.961266, 1, 1, 1, 1, 1,
2.621995, 0.6771403, 0.63242, 1, 1, 1, 1, 1,
2.645487, 1.40008, 3.115777, 1, 1, 1, 1, 1,
2.67892, 0.1782117, -0.1553117, 1, 1, 1, 1, 1,
3.178638, 0.2908313, 2.309378, 1, 1, 1, 1, 1
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
var radius = 9.324267;
var distance = 32.75109;
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
mvMatrix.translate( -0.1248575, 0.4057028, -0.05969238 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.75109);
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
