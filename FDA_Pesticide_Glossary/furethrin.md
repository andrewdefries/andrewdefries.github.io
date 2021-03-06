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
-3.759126, -0.1683695, -1.476356, 1, 0, 0, 1,
-3.105331, 1.32469, -1.638378, 1, 0.007843138, 0, 1,
-3.093277, -0.8550483, -0.8378417, 1, 0.01176471, 0, 1,
-2.866039, -0.1865221, -0.882311, 1, 0.01960784, 0, 1,
-2.837346, -0.8618037, -1.732229, 1, 0.02352941, 0, 1,
-2.725575, -2.025215, -0.772823, 1, 0.03137255, 0, 1,
-2.716777, -0.1820574, -0.1993083, 1, 0.03529412, 0, 1,
-2.563944, -0.7569311, -1.502547, 1, 0.04313726, 0, 1,
-2.515678, 0.6140532, -0.6076601, 1, 0.04705882, 0, 1,
-2.452549, 0.4434009, -0.8016176, 1, 0.05490196, 0, 1,
-2.410831, -0.5907331, -1.316721, 1, 0.05882353, 0, 1,
-2.405486, -0.6880248, -2.878176, 1, 0.06666667, 0, 1,
-2.298697, -1.114435, -1.699998, 1, 0.07058824, 0, 1,
-2.29844, -0.5261309, -1.768587, 1, 0.07843138, 0, 1,
-2.270015, -0.6390734, -2.249692, 1, 0.08235294, 0, 1,
-2.159554, 0.2795317, -1.320982, 1, 0.09019608, 0, 1,
-2.065983, 0.6054001, -0.2653904, 1, 0.09411765, 0, 1,
-2.058465, 0.6452329, 0.1269271, 1, 0.1019608, 0, 1,
-2.008541, -1.750512, -3.317779, 1, 0.1098039, 0, 1,
-1.991385, -0.7157508, -1.519421, 1, 0.1137255, 0, 1,
-1.959559, 0.1617211, -1.37318, 1, 0.1215686, 0, 1,
-1.925376, 0.4252076, -2.613924, 1, 0.1254902, 0, 1,
-1.858007, -1.303418, -4.86405, 1, 0.1333333, 0, 1,
-1.843342, 0.798086, -0.2417635, 1, 0.1372549, 0, 1,
-1.818666, 1.08475, -2.223945, 1, 0.145098, 0, 1,
-1.81146, 0.4332751, -0.5707934, 1, 0.1490196, 0, 1,
-1.745364, 0.1069183, -0.9318649, 1, 0.1568628, 0, 1,
-1.744203, -0.02483721, -0.4629129, 1, 0.1607843, 0, 1,
-1.708362, 0.3678814, -1.70446, 1, 0.1686275, 0, 1,
-1.707148, 0.02242963, -1.760685, 1, 0.172549, 0, 1,
-1.701605, 0.6825751, -1.28306, 1, 0.1803922, 0, 1,
-1.70112, -0.06648334, -3.302644, 1, 0.1843137, 0, 1,
-1.685034, 0.2888125, -1.372614, 1, 0.1921569, 0, 1,
-1.680789, -2.131413, -1.804532, 1, 0.1960784, 0, 1,
-1.667982, -1.592614, 0.03821147, 1, 0.2039216, 0, 1,
-1.663623, -1.013494, -3.086447, 1, 0.2117647, 0, 1,
-1.657176, 1.890471, -1.354728, 1, 0.2156863, 0, 1,
-1.647036, -1.028475, -2.051459, 1, 0.2235294, 0, 1,
-1.640109, 1.895342, -0.7580953, 1, 0.227451, 0, 1,
-1.629428, 0.7128244, -1.073895, 1, 0.2352941, 0, 1,
-1.624569, -1.271382, -0.6036776, 1, 0.2392157, 0, 1,
-1.60505, -0.8742979, -3.517119, 1, 0.2470588, 0, 1,
-1.569331, 0.2956269, -1.561297, 1, 0.2509804, 0, 1,
-1.566908, 0.4934701, -0.8695195, 1, 0.2588235, 0, 1,
-1.532994, -0.79281, 0.4054303, 1, 0.2627451, 0, 1,
-1.528487, 0.2620863, 0.3191251, 1, 0.2705882, 0, 1,
-1.52225, 0.03849442, -1.855785, 1, 0.2745098, 0, 1,
-1.495537, -0.8038963, -1.976354, 1, 0.282353, 0, 1,
-1.481411, 0.7967159, -0.2120854, 1, 0.2862745, 0, 1,
-1.479527, 0.07366684, -1.897121, 1, 0.2941177, 0, 1,
-1.46752, 0.2267066, -2.886011, 1, 0.3019608, 0, 1,
-1.462075, -0.4337165, -2.44227, 1, 0.3058824, 0, 1,
-1.449229, -0.9376166, -3.002544, 1, 0.3137255, 0, 1,
-1.439696, -0.1200195, -1.643223, 1, 0.3176471, 0, 1,
-1.433857, -0.2954239, -3.623332, 1, 0.3254902, 0, 1,
-1.428708, 1.514354, -1.011394, 1, 0.3294118, 0, 1,
-1.428058, 1.169232, -0.4916145, 1, 0.3372549, 0, 1,
-1.419346, -0.000951024, -2.995431, 1, 0.3411765, 0, 1,
-1.419111, 2.056182, -0.8609112, 1, 0.3490196, 0, 1,
-1.4144, 0.5173546, -1.236467, 1, 0.3529412, 0, 1,
-1.399811, -0.2558729, -1.039094, 1, 0.3607843, 0, 1,
-1.388062, -0.02330968, -2.232665, 1, 0.3647059, 0, 1,
-1.38801, 0.2216655, -1.568565, 1, 0.372549, 0, 1,
-1.386594, -1.308274, -0.6877208, 1, 0.3764706, 0, 1,
-1.384736, -1.426719, -1.473558, 1, 0.3843137, 0, 1,
-1.378627, 0.7594172, -1.026083, 1, 0.3882353, 0, 1,
-1.372144, -0.371249, -2.735251, 1, 0.3960784, 0, 1,
-1.365553, -0.5554076, -1.19771, 1, 0.4039216, 0, 1,
-1.361068, 0.3048154, -3.159497, 1, 0.4078431, 0, 1,
-1.349409, -1.935848, -2.168304, 1, 0.4156863, 0, 1,
-1.347514, -0.5422662, -2.58962, 1, 0.4196078, 0, 1,
-1.344121, 0.2479985, -1.573792, 1, 0.427451, 0, 1,
-1.34397, 0.3635088, -1.322674, 1, 0.4313726, 0, 1,
-1.342162, 0.9676155, -3.352876, 1, 0.4392157, 0, 1,
-1.338682, 2.411795, -0.794725, 1, 0.4431373, 0, 1,
-1.320085, 1.162634, -0.2140447, 1, 0.4509804, 0, 1,
-1.318323, 0.5096412, -2.387781, 1, 0.454902, 0, 1,
-1.316279, 0.1677778, -0.9057892, 1, 0.4627451, 0, 1,
-1.312097, -1.215736, -2.796827, 1, 0.4666667, 0, 1,
-1.30637, 0.7020414, -1.054244, 1, 0.4745098, 0, 1,
-1.30143, -1.610267, -1.863367, 1, 0.4784314, 0, 1,
-1.297454, -1.551728, -3.47346, 1, 0.4862745, 0, 1,
-1.294007, 1.492688, -1.604905, 1, 0.4901961, 0, 1,
-1.283668, 0.1915665, -0.3395194, 1, 0.4980392, 0, 1,
-1.258175, 0.48267, -0.7861128, 1, 0.5058824, 0, 1,
-1.256025, -0.5884098, -0.8696504, 1, 0.509804, 0, 1,
-1.255335, -0.1043544, -1.523804, 1, 0.5176471, 0, 1,
-1.250505, 0.8532528, -1.182934, 1, 0.5215687, 0, 1,
-1.248351, -0.2458926, -0.7733368, 1, 0.5294118, 0, 1,
-1.247494, 1.374553, -1.533345, 1, 0.5333334, 0, 1,
-1.246358, 0.5359046, -0.715458, 1, 0.5411765, 0, 1,
-1.237415, 1.500263, 0.02557723, 1, 0.5450981, 0, 1,
-1.237198, -0.5199913, -3.982279, 1, 0.5529412, 0, 1,
-1.226758, -1.375697, -3.128275, 1, 0.5568628, 0, 1,
-1.224312, -0.5422264, -3.889671, 1, 0.5647059, 0, 1,
-1.220619, 1.734205, -2.413578, 1, 0.5686275, 0, 1,
-1.208895, -0.537949, -2.097654, 1, 0.5764706, 0, 1,
-1.208309, 0.4269213, 0.1083498, 1, 0.5803922, 0, 1,
-1.206809, 0.03933356, -2.952921, 1, 0.5882353, 0, 1,
-1.200539, 0.9683847, -1.106569, 1, 0.5921569, 0, 1,
-1.193833, -0.5779911, -1.315377, 1, 0.6, 0, 1,
-1.192249, -1.218215, -1.328014, 1, 0.6078432, 0, 1,
-1.184965, 0.4132878, -1.723024, 1, 0.6117647, 0, 1,
-1.176317, 0.5998113, -2.953809, 1, 0.6196079, 0, 1,
-1.176198, -0.06299773, -3.458927, 1, 0.6235294, 0, 1,
-1.172972, -0.05632162, -2.051708, 1, 0.6313726, 0, 1,
-1.169225, -1.212964, -1.887304, 1, 0.6352941, 0, 1,
-1.160824, -0.6445915, -2.223214, 1, 0.6431373, 0, 1,
-1.156663, -0.9955083, -2.367674, 1, 0.6470588, 0, 1,
-1.15179, -0.2548003, -2.944134, 1, 0.654902, 0, 1,
-1.150288, -2.069622, -2.53566, 1, 0.6588235, 0, 1,
-1.144944, -1.074157, -2.624198, 1, 0.6666667, 0, 1,
-1.143911, -1.205117, -3.756114, 1, 0.6705883, 0, 1,
-1.141004, 0.4221901, -1.526069, 1, 0.6784314, 0, 1,
-1.137208, 0.966763, 1.045311, 1, 0.682353, 0, 1,
-1.135563, 2.273681, -1.05181, 1, 0.6901961, 0, 1,
-1.133785, 0.2466437, -1.384004, 1, 0.6941177, 0, 1,
-1.131852, 0.06738763, 0.3845789, 1, 0.7019608, 0, 1,
-1.130935, 1.872778, -0.9746848, 1, 0.7098039, 0, 1,
-1.128743, 0.2110183, -0.819607, 1, 0.7137255, 0, 1,
-1.126595, -1.621217, -3.920486, 1, 0.7215686, 0, 1,
-1.116901, -0.857096, -2.853683, 1, 0.7254902, 0, 1,
-1.112444, -0.1994338, -2.872731, 1, 0.7333333, 0, 1,
-1.107713, -0.0458007, -0.9293067, 1, 0.7372549, 0, 1,
-1.096975, 0.09748279, -0.9811135, 1, 0.7450981, 0, 1,
-1.093885, 0.7369629, 0.186858, 1, 0.7490196, 0, 1,
-1.083314, 0.5929564, -1.183902, 1, 0.7568628, 0, 1,
-1.082795, -0.6584869, -1.226537, 1, 0.7607843, 0, 1,
-1.076331, -1.575711, -1.858139, 1, 0.7686275, 0, 1,
-1.071213, -0.4307153, -1.787193, 1, 0.772549, 0, 1,
-1.070837, 0.8965503, -1.937435, 1, 0.7803922, 0, 1,
-1.066574, 0.2723113, -1.030232, 1, 0.7843137, 0, 1,
-1.066034, -0.3628238, -2.098288, 1, 0.7921569, 0, 1,
-1.053415, 0.8088549, -1.233378, 1, 0.7960784, 0, 1,
-1.051179, 1.320967, 0.3649677, 1, 0.8039216, 0, 1,
-1.045154, 0.9239826, -0.2459175, 1, 0.8117647, 0, 1,
-1.043263, -0.854219, -2.469123, 1, 0.8156863, 0, 1,
-1.042717, 1.084094, 0.5215206, 1, 0.8235294, 0, 1,
-1.024439, -0.1138822, -1.654414, 1, 0.827451, 0, 1,
-1.020393, 0.1346379, -1.555796, 1, 0.8352941, 0, 1,
-1.018744, 0.2568699, -3.362898, 1, 0.8392157, 0, 1,
-1.010753, 0.1254596, -0.7598479, 1, 0.8470588, 0, 1,
-1.010612, 0.2928644, -2.0979, 1, 0.8509804, 0, 1,
-1.005555, -0.3684058, -2.493272, 1, 0.8588235, 0, 1,
-0.9954395, 0.3205186, 0.2583517, 1, 0.8627451, 0, 1,
-0.993999, 0.03217316, -0.5724484, 1, 0.8705882, 0, 1,
-0.9898927, -0.3394186, -1.677998, 1, 0.8745098, 0, 1,
-0.9836652, -0.5276596, -2.322375, 1, 0.8823529, 0, 1,
-0.9836603, 0.1090293, -0.8359108, 1, 0.8862745, 0, 1,
-0.9820459, 0.9946296, -0.1393767, 1, 0.8941177, 0, 1,
-0.9796885, 1.451036, 0.5773444, 1, 0.8980392, 0, 1,
-0.9759776, -0.1844681, -1.267312, 1, 0.9058824, 0, 1,
-0.9722003, 0.3566923, -1.508165, 1, 0.9137255, 0, 1,
-0.9692456, -1.808527, -1.709142, 1, 0.9176471, 0, 1,
-0.9667811, 0.4547198, -1.095469, 1, 0.9254902, 0, 1,
-0.9619447, 0.2388813, -0.3962101, 1, 0.9294118, 0, 1,
-0.9604929, 0.5117305, 0.5737312, 1, 0.9372549, 0, 1,
-0.9470034, 0.1113397, -3.135444, 1, 0.9411765, 0, 1,
-0.9460896, -0.8308683, -4.202056, 1, 0.9490196, 0, 1,
-0.943275, 1.07527, -1.373049, 1, 0.9529412, 0, 1,
-0.9430498, -0.5100043, -1.676882, 1, 0.9607843, 0, 1,
-0.9335898, -1.956917, -4.162172, 1, 0.9647059, 0, 1,
-0.92242, 1.949094, -0.1300503, 1, 0.972549, 0, 1,
-0.9221334, -1.190634, -3.03767, 1, 0.9764706, 0, 1,
-0.9153, -2.115456, -3.057779, 1, 0.9843137, 0, 1,
-0.9145445, 2.04442, -1.135445, 1, 0.9882353, 0, 1,
-0.9101849, -1.54133, -0.8733378, 1, 0.9960784, 0, 1,
-0.9043678, 0.7218186, -0.3269583, 0.9960784, 1, 0, 1,
-0.8958369, -0.8209729, -1.703091, 0.9921569, 1, 0, 1,
-0.891916, 1.70612, -0.5886636, 0.9843137, 1, 0, 1,
-0.8883688, -0.3329258, -1.334824, 0.9803922, 1, 0, 1,
-0.8848016, 0.1262914, -0.3893883, 0.972549, 1, 0, 1,
-0.8817007, -1.574135, -2.62564, 0.9686275, 1, 0, 1,
-0.8813117, 0.223922, -0.8152772, 0.9607843, 1, 0, 1,
-0.8789577, -0.2563282, -1.272691, 0.9568627, 1, 0, 1,
-0.8787843, -0.589469, -3.055356, 0.9490196, 1, 0, 1,
-0.8760691, -0.7583814, -1.855723, 0.945098, 1, 0, 1,
-0.8677027, -0.3159435, -0.2867166, 0.9372549, 1, 0, 1,
-0.8643558, -1.356292, -1.278965, 0.9333333, 1, 0, 1,
-0.8636658, -0.5161178, -1.154953, 0.9254902, 1, 0, 1,
-0.8579895, -1.472966, -2.790979, 0.9215686, 1, 0, 1,
-0.8538691, 0.9953963, -1.906304, 0.9137255, 1, 0, 1,
-0.8526228, -0.4521319, -2.142407, 0.9098039, 1, 0, 1,
-0.8510976, 0.5337927, -1.562373, 0.9019608, 1, 0, 1,
-0.8486394, -1.18071, -3.226468, 0.8941177, 1, 0, 1,
-0.8478047, -0.9699731, -1.935933, 0.8901961, 1, 0, 1,
-0.8469106, -0.1025525, -3.074524, 0.8823529, 1, 0, 1,
-0.8451625, 2.880155, -0.7118158, 0.8784314, 1, 0, 1,
-0.8415136, -1.278515, -3.758783, 0.8705882, 1, 0, 1,
-0.8337066, -1.333069, -2.403538, 0.8666667, 1, 0, 1,
-0.818708, -1.05159, -2.67396, 0.8588235, 1, 0, 1,
-0.807517, 0.6177403, -0.3054878, 0.854902, 1, 0, 1,
-0.805733, -1.17306, -2.918465, 0.8470588, 1, 0, 1,
-0.8055803, 0.655269, -0.206843, 0.8431373, 1, 0, 1,
-0.805351, 0.04560735, -0.8941662, 0.8352941, 1, 0, 1,
-0.7975582, -0.4525137, -1.31491, 0.8313726, 1, 0, 1,
-0.7910788, 0.7797065, -1.24065, 0.8235294, 1, 0, 1,
-0.7880133, 1.316027, -0.1362843, 0.8196079, 1, 0, 1,
-0.7869459, 0.07918899, -1.459953, 0.8117647, 1, 0, 1,
-0.7850156, 2.254646, 1.446088, 0.8078431, 1, 0, 1,
-0.7822521, -0.1498554, -0.3056934, 0.8, 1, 0, 1,
-0.780246, -2.274556, -2.555594, 0.7921569, 1, 0, 1,
-0.7751905, -0.3909239, -2.645283, 0.7882353, 1, 0, 1,
-0.7748154, -0.9732997, -2.745601, 0.7803922, 1, 0, 1,
-0.774232, -0.02723904, -1.377607, 0.7764706, 1, 0, 1,
-0.7610302, -0.8803437, -2.063473, 0.7686275, 1, 0, 1,
-0.7602638, -0.1367472, -1.110581, 0.7647059, 1, 0, 1,
-0.7592353, 1.30745, -0.02277704, 0.7568628, 1, 0, 1,
-0.7559974, 0.04059132, 0.3472508, 0.7529412, 1, 0, 1,
-0.7555671, -0.4056504, -1.470952, 0.7450981, 1, 0, 1,
-0.7505499, -0.7402948, -0.3001684, 0.7411765, 1, 0, 1,
-0.745787, -0.3723888, -1.19729, 0.7333333, 1, 0, 1,
-0.7336382, 2.022647, -3.311409, 0.7294118, 1, 0, 1,
-0.7275574, -1.074083, -3.829813, 0.7215686, 1, 0, 1,
-0.7216367, -0.3705517, -4.249032, 0.7176471, 1, 0, 1,
-0.7212389, -1.093873, -3.275999, 0.7098039, 1, 0, 1,
-0.7196551, 1.956668, 0.5831929, 0.7058824, 1, 0, 1,
-0.7107852, -0.3852729, -2.204625, 0.6980392, 1, 0, 1,
-0.6999855, 0.8119385, 0.8361278, 0.6901961, 1, 0, 1,
-0.6972192, -1.035558, -1.449179, 0.6862745, 1, 0, 1,
-0.6943368, 0.07755261, -2.101619, 0.6784314, 1, 0, 1,
-0.6895486, -0.9372107, -1.528066, 0.6745098, 1, 0, 1,
-0.6834605, -0.9141057, -2.264868, 0.6666667, 1, 0, 1,
-0.6829709, 0.603606, -1.322543, 0.6627451, 1, 0, 1,
-0.6823148, -0.09513171, -1.477969, 0.654902, 1, 0, 1,
-0.6775135, -0.1247459, -1.264876, 0.6509804, 1, 0, 1,
-0.6721145, -0.03769495, -1.251525, 0.6431373, 1, 0, 1,
-0.6700145, 0.2893654, -1.837786, 0.6392157, 1, 0, 1,
-0.6665881, -0.6418377, -5.084614, 0.6313726, 1, 0, 1,
-0.6613622, 0.006119457, -0.1106889, 0.627451, 1, 0, 1,
-0.660334, 0.2290967, -1.219381, 0.6196079, 1, 0, 1,
-0.657429, -0.5982293, -2.493957, 0.6156863, 1, 0, 1,
-0.6552944, 0.2104915, -0.7830437, 0.6078432, 1, 0, 1,
-0.6440519, -1.262469, -2.489566, 0.6039216, 1, 0, 1,
-0.6432484, 0.2834866, -2.208707, 0.5960785, 1, 0, 1,
-0.63977, 0.4607315, -0.56307, 0.5882353, 1, 0, 1,
-0.6390248, -0.07121728, -1.162357, 0.5843138, 1, 0, 1,
-0.6306544, -1.169952, -5.166748, 0.5764706, 1, 0, 1,
-0.6170212, 0.76625, -0.8118349, 0.572549, 1, 0, 1,
-0.6148961, -0.2146793, -0.4595388, 0.5647059, 1, 0, 1,
-0.6133807, 1.241082, -1.134286, 0.5607843, 1, 0, 1,
-0.6031229, 0.2119828, -0.4699882, 0.5529412, 1, 0, 1,
-0.5986725, 0.6262439, 0.2314313, 0.5490196, 1, 0, 1,
-0.5977899, -0.2710845, -0.9439571, 0.5411765, 1, 0, 1,
-0.5950443, 1.072495, -0.0005332095, 0.5372549, 1, 0, 1,
-0.5948713, 0.1999169, -2.035739, 0.5294118, 1, 0, 1,
-0.5939829, -0.5714328, -2.445204, 0.5254902, 1, 0, 1,
-0.5928759, -1.599115, -2.786614, 0.5176471, 1, 0, 1,
-0.5884199, -1.36305, -2.847472, 0.5137255, 1, 0, 1,
-0.5832652, -3.567308, -2.280283, 0.5058824, 1, 0, 1,
-0.5790504, -1.53913, -3.826824, 0.5019608, 1, 0, 1,
-0.5723967, -1.090599, -3.182118, 0.4941176, 1, 0, 1,
-0.5691683, -1.49592, -1.555947, 0.4862745, 1, 0, 1,
-0.5672454, 0.7358827, -2.625406, 0.4823529, 1, 0, 1,
-0.5629137, 0.4468533, -0.3179503, 0.4745098, 1, 0, 1,
-0.5628792, -0.3044099, -2.490645, 0.4705882, 1, 0, 1,
-0.5541381, -0.3202521, -0.860066, 0.4627451, 1, 0, 1,
-0.5537779, 1.842225, -1.181936, 0.4588235, 1, 0, 1,
-0.5262501, -1.152281, -1.512005, 0.4509804, 1, 0, 1,
-0.5240169, 1.815283, 1.328802, 0.4470588, 1, 0, 1,
-0.5183844, -0.9202182, -3.738852, 0.4392157, 1, 0, 1,
-0.5178121, -0.388586, -2.432641, 0.4352941, 1, 0, 1,
-0.5151304, -0.5770863, -2.26521, 0.427451, 1, 0, 1,
-0.5139663, -0.1236034, -1.147807, 0.4235294, 1, 0, 1,
-0.5139334, -2.012047, -2.291621, 0.4156863, 1, 0, 1,
-0.5052332, 0.6050623, 0.4091662, 0.4117647, 1, 0, 1,
-0.4978267, 0.6550612, -0.9285442, 0.4039216, 1, 0, 1,
-0.4961263, 1.865526, -0.4317173, 0.3960784, 1, 0, 1,
-0.4942265, 0.9023765, -0.9708834, 0.3921569, 1, 0, 1,
-0.4872899, 1.2841, 1.221811, 0.3843137, 1, 0, 1,
-0.4869542, 1.647812, -0.4422998, 0.3803922, 1, 0, 1,
-0.485211, -0.4682867, -1.422529, 0.372549, 1, 0, 1,
-0.4846502, 0.3702157, -1.468856, 0.3686275, 1, 0, 1,
-0.4828388, 0.2353932, -0.5034185, 0.3607843, 1, 0, 1,
-0.4815045, 0.5649138, -0.3837152, 0.3568628, 1, 0, 1,
-0.4799879, -0.4970864, -2.833382, 0.3490196, 1, 0, 1,
-0.4797476, -0.3106319, -1.054176, 0.345098, 1, 0, 1,
-0.4777819, 0.7254744, -1.621361, 0.3372549, 1, 0, 1,
-0.4721175, 0.03885655, 0.438881, 0.3333333, 1, 0, 1,
-0.4681819, 0.5046934, -0.1334462, 0.3254902, 1, 0, 1,
-0.4648393, -0.4682156, -1.291895, 0.3215686, 1, 0, 1,
-0.453298, 1.793293, 0.03506747, 0.3137255, 1, 0, 1,
-0.4502248, -0.1767931, -2.3786, 0.3098039, 1, 0, 1,
-0.449799, -2.487364, -2.952905, 0.3019608, 1, 0, 1,
-0.4490224, 0.5343634, -1.182987, 0.2941177, 1, 0, 1,
-0.4419439, -0.9845182, -3.194004, 0.2901961, 1, 0, 1,
-0.4329987, 0.5076957, 0.1378635, 0.282353, 1, 0, 1,
-0.4300928, 1.84313, -2.94957, 0.2784314, 1, 0, 1,
-0.4296485, 0.9411628, 0.09499606, 0.2705882, 1, 0, 1,
-0.4289797, 0.1782912, -0.8865487, 0.2666667, 1, 0, 1,
-0.4268703, -0.9983345, -2.651183, 0.2588235, 1, 0, 1,
-0.425823, -2.704773, -5.507888, 0.254902, 1, 0, 1,
-0.416207, 0.0347309, -0.5762185, 0.2470588, 1, 0, 1,
-0.4154375, 0.5712413, -1.73965, 0.2431373, 1, 0, 1,
-0.4083334, -0.004670628, -1.227517, 0.2352941, 1, 0, 1,
-0.3968839, 1.873592, -0.7298112, 0.2313726, 1, 0, 1,
-0.3967923, 1.152255, -0.165393, 0.2235294, 1, 0, 1,
-0.3964918, 0.6099138, -0.6614924, 0.2196078, 1, 0, 1,
-0.3956728, 1.079378, -0.9992445, 0.2117647, 1, 0, 1,
-0.3925208, -1.227532, -2.552055, 0.2078431, 1, 0, 1,
-0.3915938, -0.5057037, -4.152456, 0.2, 1, 0, 1,
-0.3911134, -0.7697751, -2.867413, 0.1921569, 1, 0, 1,
-0.390894, -0.3643348, -1.448234, 0.1882353, 1, 0, 1,
-0.3843978, -0.4168335, -2.869251, 0.1803922, 1, 0, 1,
-0.3834428, 0.5156387, -1.096174, 0.1764706, 1, 0, 1,
-0.3806561, 0.6638033, 0.1469477, 0.1686275, 1, 0, 1,
-0.3788805, -1.027788, -2.604636, 0.1647059, 1, 0, 1,
-0.3783579, -0.2460768, -1.930092, 0.1568628, 1, 0, 1,
-0.3763449, -0.18666, -3.173244, 0.1529412, 1, 0, 1,
-0.3751523, -0.4101868, -4.338368, 0.145098, 1, 0, 1,
-0.3749421, 0.01364759, -1.059318, 0.1411765, 1, 0, 1,
-0.3735773, 1.170233, -1.325914, 0.1333333, 1, 0, 1,
-0.3730019, 2.024462, 0.06750215, 0.1294118, 1, 0, 1,
-0.3662516, 0.1711704, -0.8726948, 0.1215686, 1, 0, 1,
-0.3642491, 2.218714, 1.29472, 0.1176471, 1, 0, 1,
-0.3636925, -2.01757, -3.724225, 0.1098039, 1, 0, 1,
-0.3606853, 1.315052, -2.22111, 0.1058824, 1, 0, 1,
-0.3581878, 0.6499124, -0.1081493, 0.09803922, 1, 0, 1,
-0.3533349, 0.3513945, 0.5081766, 0.09019608, 1, 0, 1,
-0.3513269, 0.6921122, -1.945239, 0.08627451, 1, 0, 1,
-0.3496936, 0.3695202, -1.633785, 0.07843138, 1, 0, 1,
-0.3487839, -0.7152748, -2.350723, 0.07450981, 1, 0, 1,
-0.3439687, -0.0887296, -0.7744666, 0.06666667, 1, 0, 1,
-0.3432611, 1.664508, -1.499848, 0.0627451, 1, 0, 1,
-0.3422152, 1.71753, 0.9762525, 0.05490196, 1, 0, 1,
-0.3376807, -2.260693, -2.967779, 0.05098039, 1, 0, 1,
-0.3373481, -1.068435, -0.835539, 0.04313726, 1, 0, 1,
-0.3329647, -0.9799602, -3.012426, 0.03921569, 1, 0, 1,
-0.3327964, 1.311871, 0.4481227, 0.03137255, 1, 0, 1,
-0.328347, -1.565012, -2.532865, 0.02745098, 1, 0, 1,
-0.3249716, -0.6515129, -3.655966, 0.01960784, 1, 0, 1,
-0.3249028, 0.8913983, -0.5877743, 0.01568628, 1, 0, 1,
-0.3227946, -0.9637305, -1.101059, 0.007843138, 1, 0, 1,
-0.3208143, -0.1771613, -3.634507, 0.003921569, 1, 0, 1,
-0.3195529, -1.386994, -1.725869, 0, 1, 0.003921569, 1,
-0.3172777, 1.772624, 1.054031, 0, 1, 0.01176471, 1,
-0.3160876, 0.8636397, -1.886072, 0, 1, 0.01568628, 1,
-0.315788, 0.1978475, -1.795226, 0, 1, 0.02352941, 1,
-0.3147939, -1.015838, -3.312394, 0, 1, 0.02745098, 1,
-0.3146341, -2.058403, -3.793506, 0, 1, 0.03529412, 1,
-0.3126229, -0.5146208, -1.475146, 0, 1, 0.03921569, 1,
-0.3093491, -0.604938, -1.626443, 0, 1, 0.04705882, 1,
-0.307212, 1.444225, 0.3359769, 0, 1, 0.05098039, 1,
-0.3023601, -0.6523355, -2.501554, 0, 1, 0.05882353, 1,
-0.2998252, 0.07065511, -1.955424, 0, 1, 0.0627451, 1,
-0.2983626, -1.479618, -3.087545, 0, 1, 0.07058824, 1,
-0.2979724, -0.9277586, -2.386505, 0, 1, 0.07450981, 1,
-0.2961496, -0.800001, -3.2865, 0, 1, 0.08235294, 1,
-0.2949312, -0.5937956, -1.028739, 0, 1, 0.08627451, 1,
-0.2930969, -1.416893, -2.013845, 0, 1, 0.09411765, 1,
-0.2930714, 0.6268784, 0.8051066, 0, 1, 0.1019608, 1,
-0.2833362, 1.023917, -0.8347093, 0, 1, 0.1058824, 1,
-0.2830051, -0.0840646, -4.536104, 0, 1, 0.1137255, 1,
-0.2819356, 1.416807, 1.108104, 0, 1, 0.1176471, 1,
-0.268721, 0.04340024, 1.067149, 0, 1, 0.1254902, 1,
-0.266267, 1.762849, 2.22017, 0, 1, 0.1294118, 1,
-0.2654118, -0.4254485, -0.7773291, 0, 1, 0.1372549, 1,
-0.265106, -0.3176945, -2.298668, 0, 1, 0.1411765, 1,
-0.2575916, -1.590629, -4.070959, 0, 1, 0.1490196, 1,
-0.2570137, -0.4327264, -3.780264, 0, 1, 0.1529412, 1,
-0.256885, 0.258781, -1.538725, 0, 1, 0.1607843, 1,
-0.2557853, 0.2014828, -3.021686, 0, 1, 0.1647059, 1,
-0.2514278, -1.870658, -2.020214, 0, 1, 0.172549, 1,
-0.2512272, 0.4328951, 0.4376674, 0, 1, 0.1764706, 1,
-0.2432601, 1.741548, -0.02074332, 0, 1, 0.1843137, 1,
-0.2421179, 0.8580835, -1.714351, 0, 1, 0.1882353, 1,
-0.2399798, -1.492435, -2.312344, 0, 1, 0.1960784, 1,
-0.2343485, 1.62609, -2.522862, 0, 1, 0.2039216, 1,
-0.2333027, -0.2759833, -2.185892, 0, 1, 0.2078431, 1,
-0.2322164, 0.01121658, -1.536414, 0, 1, 0.2156863, 1,
-0.2314615, -0.6940726, -0.3463705, 0, 1, 0.2196078, 1,
-0.2296246, 1.817849, -1.038465, 0, 1, 0.227451, 1,
-0.2268194, 1.744537, 0.4754839, 0, 1, 0.2313726, 1,
-0.2234862, 1.693879, 0.1277455, 0, 1, 0.2392157, 1,
-0.2201987, 1.847232, -0.2809551, 0, 1, 0.2431373, 1,
-0.2187922, 0.3291216, 0.4811512, 0, 1, 0.2509804, 1,
-0.2184849, 1.403242, -0.4470191, 0, 1, 0.254902, 1,
-0.2184539, -2.248531, -1.844276, 0, 1, 0.2627451, 1,
-0.2178006, -1.451759, -2.820063, 0, 1, 0.2666667, 1,
-0.2127909, 0.4287488, -0.1838385, 0, 1, 0.2745098, 1,
-0.2098607, -0.1297741, -3.189607, 0, 1, 0.2784314, 1,
-0.2092244, 0.1994534, -1.034202, 0, 1, 0.2862745, 1,
-0.2042733, 1.290607, -0.7474835, 0, 1, 0.2901961, 1,
-0.2040082, 0.5243206, -0.4536581, 0, 1, 0.2980392, 1,
-0.1986343, -1.408031, -2.225235, 0, 1, 0.3058824, 1,
-0.1955886, -0.9521416, -3.640835, 0, 1, 0.3098039, 1,
-0.1913565, 0.3929952, 0.9300858, 0, 1, 0.3176471, 1,
-0.1905572, -0.5299935, -2.465157, 0, 1, 0.3215686, 1,
-0.1889815, 0.2597897, -0.1068725, 0, 1, 0.3294118, 1,
-0.1876134, 1.027828, -0.3523229, 0, 1, 0.3333333, 1,
-0.1858251, 0.9708194, 0.6978866, 0, 1, 0.3411765, 1,
-0.184759, 1.104885, 1.460915, 0, 1, 0.345098, 1,
-0.1843231, -0.9007969, -2.275865, 0, 1, 0.3529412, 1,
-0.1841564, -1.4427, -1.340575, 0, 1, 0.3568628, 1,
-0.1795037, 1.421416, -0.06809745, 0, 1, 0.3647059, 1,
-0.178496, -0.7416697, -2.047412, 0, 1, 0.3686275, 1,
-0.1762165, 0.5910856, -0.7101754, 0, 1, 0.3764706, 1,
-0.175738, 1.453909, -1.698776, 0, 1, 0.3803922, 1,
-0.1744006, 0.8873222, 0.1139323, 0, 1, 0.3882353, 1,
-0.1667065, -1.447893, -3.372288, 0, 1, 0.3921569, 1,
-0.1621433, 0.5566146, -0.831951, 0, 1, 0.4, 1,
-0.1621044, -0.1504498, -0.5357408, 0, 1, 0.4078431, 1,
-0.160679, -1.269061, -4.414311, 0, 1, 0.4117647, 1,
-0.1587793, 0.1166811, -0.4994464, 0, 1, 0.4196078, 1,
-0.1549587, 0.7562413, 0.4672825, 0, 1, 0.4235294, 1,
-0.1548297, -1.716704, -3.12214, 0, 1, 0.4313726, 1,
-0.1544075, -0.05436139, -0.2261479, 0, 1, 0.4352941, 1,
-0.154208, -0.05791317, -3.50898, 0, 1, 0.4431373, 1,
-0.1537725, 1.272297, -1.670779, 0, 1, 0.4470588, 1,
-0.1504882, -0.5494683, -1.23528, 0, 1, 0.454902, 1,
-0.1447996, -1.944049, -3.55746, 0, 1, 0.4588235, 1,
-0.1442636, -0.6926355, -3.749673, 0, 1, 0.4666667, 1,
-0.1440135, 1.472995, 0.1910252, 0, 1, 0.4705882, 1,
-0.1439887, 0.3886704, 0.857138, 0, 1, 0.4784314, 1,
-0.1398083, 0.3279485, -0.6314303, 0, 1, 0.4823529, 1,
-0.1393134, -1.533321, -2.322727, 0, 1, 0.4901961, 1,
-0.1361267, 0.1987964, -1.348619, 0, 1, 0.4941176, 1,
-0.1343464, -0.2164827, -3.344475, 0, 1, 0.5019608, 1,
-0.1343174, 0.7125808, -0.9845663, 0, 1, 0.509804, 1,
-0.1313541, 0.1537164, -2.54423, 0, 1, 0.5137255, 1,
-0.1310572, -2.149831, -3.559109, 0, 1, 0.5215687, 1,
-0.1221232, 1.486675, 0.9128101, 0, 1, 0.5254902, 1,
-0.1190199, -0.2888492, -0.8848743, 0, 1, 0.5333334, 1,
-0.1186678, -0.4436691, -4.257092, 0, 1, 0.5372549, 1,
-0.1139249, 2.322602, -1.759938, 0, 1, 0.5450981, 1,
-0.1109792, -1.432219, -2.371019, 0, 1, 0.5490196, 1,
-0.1108127, -1.033802, -3.140914, 0, 1, 0.5568628, 1,
-0.1078022, 1.934601, 1.218777, 0, 1, 0.5607843, 1,
-0.1057312, -0.5739734, -3.93565, 0, 1, 0.5686275, 1,
-0.105605, 0.2945082, -1.149428, 0, 1, 0.572549, 1,
-0.1049025, -0.02401735, -2.287635, 0, 1, 0.5803922, 1,
-0.1017075, 0.78004, -0.05003115, 0, 1, 0.5843138, 1,
-0.1002487, -0.2770225, -3.586239, 0, 1, 0.5921569, 1,
-0.09707216, 1.130589, 0.7969135, 0, 1, 0.5960785, 1,
-0.09523485, 1.17694, -2.55413, 0, 1, 0.6039216, 1,
-0.09159181, -0.8081124, -2.80056, 0, 1, 0.6117647, 1,
-0.08617712, -0.02456335, -1.056284, 0, 1, 0.6156863, 1,
-0.0854414, -0.8370544, -2.615301, 0, 1, 0.6235294, 1,
-0.08448407, 0.188738, -1.263659, 0, 1, 0.627451, 1,
-0.07894296, 0.003982005, -1.251494, 0, 1, 0.6352941, 1,
-0.0759382, 0.2013011, -0.2291819, 0, 1, 0.6392157, 1,
-0.07383943, -1.954818, -3.278165, 0, 1, 0.6470588, 1,
-0.0714561, -0.8802447, -1.821468, 0, 1, 0.6509804, 1,
-0.06802379, 0.372371, 0.6099612, 0, 1, 0.6588235, 1,
-0.06418173, 0.5506977, -1.103869, 0, 1, 0.6627451, 1,
-0.06390549, 1.376233, 0.9088268, 0, 1, 0.6705883, 1,
-0.06224078, 1.422207, 1.416627, 0, 1, 0.6745098, 1,
-0.06076913, 1.441888, -0.9775158, 0, 1, 0.682353, 1,
-0.05617232, 0.9613032, 1.182265, 0, 1, 0.6862745, 1,
-0.05606922, 1.086723, 2.209649, 0, 1, 0.6941177, 1,
-0.05371, 0.798997, 0.485946, 0, 1, 0.7019608, 1,
-0.05353917, 0.04350739, -1.94807, 0, 1, 0.7058824, 1,
-0.05084779, -1.77899, -1.739841, 0, 1, 0.7137255, 1,
-0.04789293, -0.7351304, -2.608524, 0, 1, 0.7176471, 1,
-0.04599383, 1.107513, -0.1309255, 0, 1, 0.7254902, 1,
-0.04508822, -0.8189358, -4.639924, 0, 1, 0.7294118, 1,
-0.04312114, -0.2960235, -4.344303, 0, 1, 0.7372549, 1,
-0.0425283, -0.3714936, -1.866489, 0, 1, 0.7411765, 1,
-0.04027034, -0.7878034, -3.736996, 0, 1, 0.7490196, 1,
-0.03954902, 0.009202545, -0.3215036, 0, 1, 0.7529412, 1,
-0.03764208, 0.2650512, -1.556863, 0, 1, 0.7607843, 1,
-0.0334783, -0.1518757, -2.763213, 0, 1, 0.7647059, 1,
-0.03167063, -1.163844, -4.953514, 0, 1, 0.772549, 1,
-0.02978147, -0.09609704, -2.230705, 0, 1, 0.7764706, 1,
-0.02832162, 0.1171963, 0.1072346, 0, 1, 0.7843137, 1,
-0.02548394, -0.01995779, -2.969883, 0, 1, 0.7882353, 1,
-0.02192769, -1.085633, -2.040178, 0, 1, 0.7960784, 1,
-0.01930996, -2.258792, -4.067214, 0, 1, 0.8039216, 1,
-0.01760467, -1.452896, -2.004039, 0, 1, 0.8078431, 1,
-0.01442659, -0.5408556, -2.374969, 0, 1, 0.8156863, 1,
-0.01108395, -0.1131956, -4.126628, 0, 1, 0.8196079, 1,
-0.01085904, -0.08644089, -4.172528, 0, 1, 0.827451, 1,
-0.009819279, 0.2611563, -0.6438431, 0, 1, 0.8313726, 1,
-0.009235588, 0.750238, 0.4423198, 0, 1, 0.8392157, 1,
-0.007143659, -0.221377, -4.619177, 0, 1, 0.8431373, 1,
-0.006270316, -0.8313296, -3.847189, 0, 1, 0.8509804, 1,
-0.00359705, 1.230041, 1.43785, 0, 1, 0.854902, 1,
-0.002051033, -0.1494647, -3.374812, 0, 1, 0.8627451, 1,
-0.002026314, -0.3504444, -1.651135, 0, 1, 0.8666667, 1,
-0.001445124, 0.8340816, 0.6381195, 0, 1, 0.8745098, 1,
0.002127417, 1.279096, 1.64403, 0, 1, 0.8784314, 1,
0.006991116, -0.7759311, 1.873427, 0, 1, 0.8862745, 1,
0.007764876, 0.4132018, 0.003078812, 0, 1, 0.8901961, 1,
0.01376691, 0.3976849, -0.2719941, 0, 1, 0.8980392, 1,
0.02067731, 0.9966443, 2.012147, 0, 1, 0.9058824, 1,
0.02209649, -1.56017, 3.750662, 0, 1, 0.9098039, 1,
0.02442065, 1.185271, 1.06643, 0, 1, 0.9176471, 1,
0.02504818, -0.0293752, 3.368349, 0, 1, 0.9215686, 1,
0.03205452, -0.4722706, 3.873847, 0, 1, 0.9294118, 1,
0.03442525, -0.9345145, 2.653254, 0, 1, 0.9333333, 1,
0.03958238, 0.7067767, -1.355842, 0, 1, 0.9411765, 1,
0.0401128, -0.07245964, 2.535386, 0, 1, 0.945098, 1,
0.04355255, -1.221494, 4.803009, 0, 1, 0.9529412, 1,
0.04533789, -0.06244375, 3.424364, 0, 1, 0.9568627, 1,
0.04673561, 2.066849, 0.9245356, 0, 1, 0.9647059, 1,
0.04707907, 2.097293, 0.4425715, 0, 1, 0.9686275, 1,
0.05494754, -0.1415424, 2.697955, 0, 1, 0.9764706, 1,
0.05847538, 1.434412, -0.4534316, 0, 1, 0.9803922, 1,
0.0590369, 2.366255, -0.8684632, 0, 1, 0.9882353, 1,
0.06124509, -1.975747, 0.7423098, 0, 1, 0.9921569, 1,
0.06697641, -0.8243851, 1.725196, 0, 1, 1, 1,
0.07633884, -0.8898278, 3.559473, 0, 0.9921569, 1, 1,
0.07670106, 0.02497345, 0.1987812, 0, 0.9882353, 1, 1,
0.07674648, -0.5547855, 2.539388, 0, 0.9803922, 1, 1,
0.07857015, -1.238321, 2.563858, 0, 0.9764706, 1, 1,
0.08048023, -0.2028018, 3.930025, 0, 0.9686275, 1, 1,
0.08067932, -1.741834, 2.134367, 0, 0.9647059, 1, 1,
0.08110655, 1.077213, 1.320952, 0, 0.9568627, 1, 1,
0.08177826, -0.704631, 3.06941, 0, 0.9529412, 1, 1,
0.08364946, -0.6500483, 4.551177, 0, 0.945098, 1, 1,
0.08410464, 2.220611, 0.1510611, 0, 0.9411765, 1, 1,
0.09005865, 0.9007981, 0.5553879, 0, 0.9333333, 1, 1,
0.0902086, 1.516245, 1.361387, 0, 0.9294118, 1, 1,
0.09301655, 1.647258, 0.5572437, 0, 0.9215686, 1, 1,
0.09361748, 0.4276339, -0.9553366, 0, 0.9176471, 1, 1,
0.09656747, -0.3897509, 2.94945, 0, 0.9098039, 1, 1,
0.09755744, 0.3135133, 0.8091742, 0, 0.9058824, 1, 1,
0.09863766, -0.4733016, -0.03700338, 0, 0.8980392, 1, 1,
0.1015152, -1.009604, 4.578022, 0, 0.8901961, 1, 1,
0.1043828, -0.3297789, 1.101576, 0, 0.8862745, 1, 1,
0.1045342, -0.000274225, 0.4553109, 0, 0.8784314, 1, 1,
0.1065772, 0.233022, 1.714235, 0, 0.8745098, 1, 1,
0.1101652, 0.2878636, 0.7526307, 0, 0.8666667, 1, 1,
0.1105886, -1.323066, 1.289782, 0, 0.8627451, 1, 1,
0.1132054, -0.5296859, 3.344338, 0, 0.854902, 1, 1,
0.1135391, 0.3106256, 0.05831768, 0, 0.8509804, 1, 1,
0.1140038, 1.350933, -1.310699, 0, 0.8431373, 1, 1,
0.114429, -0.2603069, 2.625845, 0, 0.8392157, 1, 1,
0.1165812, -0.3145976, 1.949999, 0, 0.8313726, 1, 1,
0.1172709, 0.6066915, -0.5721708, 0, 0.827451, 1, 1,
0.1198291, -1.298723, 2.022216, 0, 0.8196079, 1, 1,
0.1221422, -1.014999, 3.61731, 0, 0.8156863, 1, 1,
0.123051, -0.3395405, 2.149458, 0, 0.8078431, 1, 1,
0.1268478, 1.526276, 1.310783, 0, 0.8039216, 1, 1,
0.1275408, -0.2909276, 2.636742, 0, 0.7960784, 1, 1,
0.1308194, -0.0948625, 0.8869598, 0, 0.7882353, 1, 1,
0.1336107, 0.8673154, -1.315305, 0, 0.7843137, 1, 1,
0.1353785, 1.53338, 0.8661509, 0, 0.7764706, 1, 1,
0.1384916, -0.3779045, 1.529645, 0, 0.772549, 1, 1,
0.1452325, -0.454066, 1.721385, 0, 0.7647059, 1, 1,
0.1466142, -1.639841, 3.500517, 0, 0.7607843, 1, 1,
0.1470562, -0.2785687, 2.318101, 0, 0.7529412, 1, 1,
0.1565364, 0.170594, 0.4312505, 0, 0.7490196, 1, 1,
0.160282, 0.8996487, -0.927461, 0, 0.7411765, 1, 1,
0.1634949, 0.5376543, 0.05302104, 0, 0.7372549, 1, 1,
0.1648619, 2.145476, -0.06573769, 0, 0.7294118, 1, 1,
0.1701542, 2.350745, -0.1983554, 0, 0.7254902, 1, 1,
0.1723318, 0.06068148, 1.601262, 0, 0.7176471, 1, 1,
0.1794612, -0.8725411, 3.300532, 0, 0.7137255, 1, 1,
0.1802293, -0.4389796, 1.055197, 0, 0.7058824, 1, 1,
0.180669, -0.104834, 0.8472195, 0, 0.6980392, 1, 1,
0.1837387, 0.3375805, -2.076303, 0, 0.6941177, 1, 1,
0.1847845, -1.264138, 5.373259, 0, 0.6862745, 1, 1,
0.1913975, -0.3525845, 2.376055, 0, 0.682353, 1, 1,
0.1982697, -0.3849261, 3.505743, 0, 0.6745098, 1, 1,
0.1987167, -0.0219959, 0.1884934, 0, 0.6705883, 1, 1,
0.201853, 1.204772, 0.4922581, 0, 0.6627451, 1, 1,
0.2019448, 0.005624451, 2.573633, 0, 0.6588235, 1, 1,
0.2042036, -0.4613588, 2.858788, 0, 0.6509804, 1, 1,
0.2070398, -1.593438, 3.035046, 0, 0.6470588, 1, 1,
0.207072, 0.1175116, 0.8099442, 0, 0.6392157, 1, 1,
0.2072868, -0.2446171, 2.418065, 0, 0.6352941, 1, 1,
0.2074548, 0.2969625, 0.8745204, 0, 0.627451, 1, 1,
0.2124727, -0.7102299, 2.097268, 0, 0.6235294, 1, 1,
0.2161527, -0.4261868, 3.316612, 0, 0.6156863, 1, 1,
0.2194665, -1.558293, 6.252211, 0, 0.6117647, 1, 1,
0.2198299, -1.066913, 2.707359, 0, 0.6039216, 1, 1,
0.2205151, -0.05453457, 0.8171783, 0, 0.5960785, 1, 1,
0.222172, 1.132344, 0.5280851, 0, 0.5921569, 1, 1,
0.2237343, 0.1207841, 0.1034971, 0, 0.5843138, 1, 1,
0.226201, 1.579195, -0.2102168, 0, 0.5803922, 1, 1,
0.2273003, 0.1937974, -0.4342405, 0, 0.572549, 1, 1,
0.2280781, 0.8714132, 1.964633, 0, 0.5686275, 1, 1,
0.2284404, -0.1894243, 1.312497, 0, 0.5607843, 1, 1,
0.229069, -0.4683661, 0.3698483, 0, 0.5568628, 1, 1,
0.2298126, 0.8670633, 2.14503, 0, 0.5490196, 1, 1,
0.230802, -1.952446, 1.379792, 0, 0.5450981, 1, 1,
0.2352015, -0.09737129, 3.12295, 0, 0.5372549, 1, 1,
0.2371052, 0.747161, -1.218981, 0, 0.5333334, 1, 1,
0.2403941, 1.264053, -0.4985765, 0, 0.5254902, 1, 1,
0.2408883, -1.188778, 2.559289, 0, 0.5215687, 1, 1,
0.2479062, 1.334657, -0.220339, 0, 0.5137255, 1, 1,
0.2585381, -0.3462501, 2.203886, 0, 0.509804, 1, 1,
0.2595353, -0.8984159, 2.815871, 0, 0.5019608, 1, 1,
0.2602976, 0.3245852, 1.795961, 0, 0.4941176, 1, 1,
0.2614133, -0.4901955, 2.93788, 0, 0.4901961, 1, 1,
0.2651805, -0.1956306, 1.492233, 0, 0.4823529, 1, 1,
0.2690985, 0.06809527, 2.909479, 0, 0.4784314, 1, 1,
0.2704022, 2.421484, -0.3180515, 0, 0.4705882, 1, 1,
0.2709226, 0.6366144, 0.03109499, 0, 0.4666667, 1, 1,
0.2713218, 0.4537418, 2.630721, 0, 0.4588235, 1, 1,
0.2767106, -0.4379264, 2.525816, 0, 0.454902, 1, 1,
0.2779187, 0.3038023, 1.439751, 0, 0.4470588, 1, 1,
0.2784185, 1.517814, -0.1167481, 0, 0.4431373, 1, 1,
0.2830104, -0.7425441, 2.673721, 0, 0.4352941, 1, 1,
0.2843809, 0.329239, 0.8878185, 0, 0.4313726, 1, 1,
0.2872478, 0.6951128, 0.773006, 0, 0.4235294, 1, 1,
0.2886885, 1.365923, 0.06097459, 0, 0.4196078, 1, 1,
0.2898659, 0.03126661, 1.324839, 0, 0.4117647, 1, 1,
0.2939501, 2.237516, -0.03779276, 0, 0.4078431, 1, 1,
0.2949031, 1.171709, -1.48168, 0, 0.4, 1, 1,
0.3002202, 0.1528614, -0.7054347, 0, 0.3921569, 1, 1,
0.3025399, 0.6768485, -1.143853, 0, 0.3882353, 1, 1,
0.3054174, 0.5198473, 1.636846, 0, 0.3803922, 1, 1,
0.305529, 0.5527694, 1.079741, 0, 0.3764706, 1, 1,
0.3099412, 0.01804784, 2.769899, 0, 0.3686275, 1, 1,
0.3124657, 0.1996751, 0.9022957, 0, 0.3647059, 1, 1,
0.3172664, -2.353734, 2.782351, 0, 0.3568628, 1, 1,
0.3186168, 0.1186577, 0.8586078, 0, 0.3529412, 1, 1,
0.3187391, -0.2552756, 1.79542, 0, 0.345098, 1, 1,
0.3214435, -3.125738, 3.257982, 0, 0.3411765, 1, 1,
0.3241961, -0.5968288, 2.313935, 0, 0.3333333, 1, 1,
0.3284062, -0.459709, 2.823379, 0, 0.3294118, 1, 1,
0.3287369, 0.7635657, 0.9671428, 0, 0.3215686, 1, 1,
0.3295675, -0.5196522, 3.167061, 0, 0.3176471, 1, 1,
0.3321139, -0.4190545, 1.270141, 0, 0.3098039, 1, 1,
0.3322635, -0.04007622, 1.548387, 0, 0.3058824, 1, 1,
0.3334905, -1.119732, 3.923368, 0, 0.2980392, 1, 1,
0.3341366, 0.5172981, 3.957646, 0, 0.2901961, 1, 1,
0.3347434, 0.9672601, -1.246495, 0, 0.2862745, 1, 1,
0.3356391, -0.3355689, 2.671191, 0, 0.2784314, 1, 1,
0.3398418, -1.595627, 3.36547, 0, 0.2745098, 1, 1,
0.3427366, -0.5011458, 4.921081, 0, 0.2666667, 1, 1,
0.3449636, -0.3357258, 2.481102, 0, 0.2627451, 1, 1,
0.346905, 1.093666, 1.171134, 0, 0.254902, 1, 1,
0.3475852, 0.293339, 1.053499, 0, 0.2509804, 1, 1,
0.3555219, 0.8770151, 2.882563, 0, 0.2431373, 1, 1,
0.3600554, 1.069361, -0.4520871, 0, 0.2392157, 1, 1,
0.3622717, 0.3274144, -0.9214522, 0, 0.2313726, 1, 1,
0.3631662, -1.155393, 2.202367, 0, 0.227451, 1, 1,
0.3659848, -0.4420704, 2.56032, 0, 0.2196078, 1, 1,
0.3665988, -0.4568417, 2.111552, 0, 0.2156863, 1, 1,
0.3697901, 0.6839254, 0.3521788, 0, 0.2078431, 1, 1,
0.3702051, -0.3774479, 1.157203, 0, 0.2039216, 1, 1,
0.3732924, 0.8119332, 0.01188689, 0, 0.1960784, 1, 1,
0.3745137, -0.3041137, 3.211129, 0, 0.1882353, 1, 1,
0.38214, 1.615696, -3.259333, 0, 0.1843137, 1, 1,
0.3837954, -0.3501751, 2.037821, 0, 0.1764706, 1, 1,
0.3894365, -0.3022448, 4.007837, 0, 0.172549, 1, 1,
0.3910658, 0.5702449, 0.2308712, 0, 0.1647059, 1, 1,
0.3936346, -1.575427, 3.553277, 0, 0.1607843, 1, 1,
0.3944584, 1.362099, 0.6482704, 0, 0.1529412, 1, 1,
0.3964313, 0.7780865, -0.2343088, 0, 0.1490196, 1, 1,
0.3975212, 0.1761578, 0.2519088, 0, 0.1411765, 1, 1,
0.3978954, 1.008383, 0.1700073, 0, 0.1372549, 1, 1,
0.405017, -0.8566523, 2.605214, 0, 0.1294118, 1, 1,
0.4057157, 1.22705, 0.3017393, 0, 0.1254902, 1, 1,
0.4059327, 2.276593, -1.302453, 0, 0.1176471, 1, 1,
0.4075941, -0.1023543, 3.06027, 0, 0.1137255, 1, 1,
0.4097982, 0.1446024, 3.344647, 0, 0.1058824, 1, 1,
0.4132335, -0.04374192, 1.237252, 0, 0.09803922, 1, 1,
0.4132876, 1.278866, -1.042406, 0, 0.09411765, 1, 1,
0.4181922, 0.7972357, 1.779676, 0, 0.08627451, 1, 1,
0.422166, 1.458888, 1.153215, 0, 0.08235294, 1, 1,
0.4261134, 0.4281204, -1.07099, 0, 0.07450981, 1, 1,
0.4277962, 0.2506208, 1.876454, 0, 0.07058824, 1, 1,
0.4281142, 0.1549402, 1.954834, 0, 0.0627451, 1, 1,
0.4415329, 0.6413235, -0.05343482, 0, 0.05882353, 1, 1,
0.4448964, -0.3856847, 2.573328, 0, 0.05098039, 1, 1,
0.4486326, -0.6036201, 3.620311, 0, 0.04705882, 1, 1,
0.4511465, -0.07318059, 2.91825, 0, 0.03921569, 1, 1,
0.453548, -0.4874945, 3.622335, 0, 0.03529412, 1, 1,
0.4538372, -0.7797047, 2.304206, 0, 0.02745098, 1, 1,
0.4561192, -0.6406546, 2.682826, 0, 0.02352941, 1, 1,
0.4799687, -0.1758377, 3.192136, 0, 0.01568628, 1, 1,
0.4869907, 2.123824, -1.694463, 0, 0.01176471, 1, 1,
0.4871202, 1.481321, 0.2870361, 0, 0.003921569, 1, 1,
0.4893675, -0.1895168, 0.05111518, 0.003921569, 0, 1, 1,
0.4898021, -2.321089, 3.934421, 0.007843138, 0, 1, 1,
0.4905957, -0.9420851, 3.311147, 0.01568628, 0, 1, 1,
0.4909938, -1.274339, 1.578886, 0.01960784, 0, 1, 1,
0.49244, -0.5407749, 2.083832, 0.02745098, 0, 1, 1,
0.4924793, 0.4764273, 2.293463, 0.03137255, 0, 1, 1,
0.5014912, 0.8257381, -1.57628, 0.03921569, 0, 1, 1,
0.5079899, -0.09217865, 2.122818, 0.04313726, 0, 1, 1,
0.5121961, -0.267078, 3.976618, 0.05098039, 0, 1, 1,
0.5165149, -1.371081, 2.117758, 0.05490196, 0, 1, 1,
0.5215419, 2.769092, 2.691417, 0.0627451, 0, 1, 1,
0.5229567, 2.152094, -2.7442, 0.06666667, 0, 1, 1,
0.5232479, -0.7359667, 3.587898, 0.07450981, 0, 1, 1,
0.5239618, -0.4194458, 0.601682, 0.07843138, 0, 1, 1,
0.524919, 0.1958581, -0.191944, 0.08627451, 0, 1, 1,
0.5273714, -0.3525316, 2.432227, 0.09019608, 0, 1, 1,
0.5284535, 0.03061188, 1.732881, 0.09803922, 0, 1, 1,
0.5317745, 2.214388, -1.415027, 0.1058824, 0, 1, 1,
0.5394942, 1.220337, 0.5304627, 0.1098039, 0, 1, 1,
0.5398088, -0.6204259, 3.390411, 0.1176471, 0, 1, 1,
0.5432229, 1.636695, 1.202294, 0.1215686, 0, 1, 1,
0.5449896, -0.355511, 2.116918, 0.1294118, 0, 1, 1,
0.5457394, 0.3596883, 1.347258, 0.1333333, 0, 1, 1,
0.5467458, 0.7931852, 1.132381, 0.1411765, 0, 1, 1,
0.5561604, -1.961488, 4.291473, 0.145098, 0, 1, 1,
0.5570077, 2.430691, 0.5447212, 0.1529412, 0, 1, 1,
0.5576122, 1.273217, -0.7177259, 0.1568628, 0, 1, 1,
0.5592588, -1.985906, 1.477587, 0.1647059, 0, 1, 1,
0.5608526, 0.7087105, 2.176286, 0.1686275, 0, 1, 1,
0.5639696, 0.8701806, 0.8198479, 0.1764706, 0, 1, 1,
0.5646913, 0.363319, -0.1802643, 0.1803922, 0, 1, 1,
0.5663092, 2.774966, 0.1907132, 0.1882353, 0, 1, 1,
0.5675015, -2.590661, 3.110673, 0.1921569, 0, 1, 1,
0.5677153, 1.101872, 1.927788, 0.2, 0, 1, 1,
0.577472, -0.08285592, 2.66102, 0.2078431, 0, 1, 1,
0.5779033, 0.2985782, 0.6210145, 0.2117647, 0, 1, 1,
0.5854934, -2.162666, 2.012928, 0.2196078, 0, 1, 1,
0.5912288, 0.01023656, 1.423054, 0.2235294, 0, 1, 1,
0.5915229, 0.5668217, 1.110819, 0.2313726, 0, 1, 1,
0.5922774, -1.485128, 2.733246, 0.2352941, 0, 1, 1,
0.5951141, 0.7904366, -0.9813752, 0.2431373, 0, 1, 1,
0.5978301, 1.749883, 1.867325, 0.2470588, 0, 1, 1,
0.6025839, 0.9282831, 0.3317826, 0.254902, 0, 1, 1,
0.6037624, 0.9084101, 0.9972062, 0.2588235, 0, 1, 1,
0.6061778, 0.5206656, 1.915108, 0.2666667, 0, 1, 1,
0.6063724, -0.694177, 1.365732, 0.2705882, 0, 1, 1,
0.6082703, -1.953613, 2.862183, 0.2784314, 0, 1, 1,
0.60897, 0.4906566, 2.304487, 0.282353, 0, 1, 1,
0.6102154, 0.2555778, 0.9290424, 0.2901961, 0, 1, 1,
0.6130632, 0.1083151, 2.448363, 0.2941177, 0, 1, 1,
0.613413, -1.899278, 3.532432, 0.3019608, 0, 1, 1,
0.6207135, 0.09611381, 0.3496805, 0.3098039, 0, 1, 1,
0.6218392, -0.256605, 1.658791, 0.3137255, 0, 1, 1,
0.6235903, 0.2521067, 1.332414, 0.3215686, 0, 1, 1,
0.6248214, 0.6041952, 0.9932334, 0.3254902, 0, 1, 1,
0.6248423, 1.239959, 0.3494059, 0.3333333, 0, 1, 1,
0.6256152, 2.144088, 0.8718613, 0.3372549, 0, 1, 1,
0.6275283, -1.849676, 2.463541, 0.345098, 0, 1, 1,
0.6312158, 0.2206367, 1.648365, 0.3490196, 0, 1, 1,
0.63399, -0.3174549, 3.154365, 0.3568628, 0, 1, 1,
0.6359707, -0.06420689, 2.090801, 0.3607843, 0, 1, 1,
0.6361471, -0.03423432, 2.926807, 0.3686275, 0, 1, 1,
0.6367569, -0.1839424, 2.572794, 0.372549, 0, 1, 1,
0.6369202, -1.410861, -0.5129371, 0.3803922, 0, 1, 1,
0.6372609, 0.03527314, 0.7738912, 0.3843137, 0, 1, 1,
0.6411476, -0.5151545, 1.716108, 0.3921569, 0, 1, 1,
0.6417068, 1.491892, -0.7911102, 0.3960784, 0, 1, 1,
0.6472137, -0.678531, 3.460146, 0.4039216, 0, 1, 1,
0.6571524, -0.8082266, 1.308549, 0.4117647, 0, 1, 1,
0.6575085, 1.471626, 0.9055958, 0.4156863, 0, 1, 1,
0.6589096, 0.6274647, -0.3350215, 0.4235294, 0, 1, 1,
0.661671, 0.7757882, 0.4111668, 0.427451, 0, 1, 1,
0.6633201, 0.5076685, 1.849096, 0.4352941, 0, 1, 1,
0.6636918, 1.26771, 0.2165064, 0.4392157, 0, 1, 1,
0.6694657, -1.036433, 3.603757, 0.4470588, 0, 1, 1,
0.6726639, 1.644983, 2.368806, 0.4509804, 0, 1, 1,
0.6732242, -1.771583, 1.675977, 0.4588235, 0, 1, 1,
0.6736071, 1.255882, 2.369052, 0.4627451, 0, 1, 1,
0.6753426, -0.01390191, 1.937182, 0.4705882, 0, 1, 1,
0.6781446, 1.059338, 0.520574, 0.4745098, 0, 1, 1,
0.6813549, -0.5195063, 1.995078, 0.4823529, 0, 1, 1,
0.6878082, -0.8006378, 3.781433, 0.4862745, 0, 1, 1,
0.6906536, 1.7891, -0.8911335, 0.4941176, 0, 1, 1,
0.6911196, -1.37864, 1.225277, 0.5019608, 0, 1, 1,
0.6949846, 0.5749738, 1.218373, 0.5058824, 0, 1, 1,
0.6972239, -0.4150973, 2.282313, 0.5137255, 0, 1, 1,
0.6977967, 1.408879, 0.8883163, 0.5176471, 0, 1, 1,
0.7024327, -0.5856168, 2.778391, 0.5254902, 0, 1, 1,
0.7033947, -1.282234, 0.7787481, 0.5294118, 0, 1, 1,
0.712657, -0.8581339, 3.137128, 0.5372549, 0, 1, 1,
0.7170116, 0.2739854, 1.751637, 0.5411765, 0, 1, 1,
0.717643, 0.03631277, 2.738026, 0.5490196, 0, 1, 1,
0.7181453, 1.327659, 1.711444, 0.5529412, 0, 1, 1,
0.7252183, -1.305319, 2.688262, 0.5607843, 0, 1, 1,
0.7259576, -1.050759, 1.591414, 0.5647059, 0, 1, 1,
0.72676, -0.1215477, 3.548878, 0.572549, 0, 1, 1,
0.7288181, 1.625701, -0.09994129, 0.5764706, 0, 1, 1,
0.7296205, -0.2775786, 2.791184, 0.5843138, 0, 1, 1,
0.7343262, -0.7694542, 1.023944, 0.5882353, 0, 1, 1,
0.7349736, 0.6334258, 1.834073, 0.5960785, 0, 1, 1,
0.7488242, -0.5200311, 3.283455, 0.6039216, 0, 1, 1,
0.7529881, 0.07270699, 1.667386, 0.6078432, 0, 1, 1,
0.7610134, 0.09588797, 0.9362786, 0.6156863, 0, 1, 1,
0.7622666, 0.5431795, -0.7477905, 0.6196079, 0, 1, 1,
0.771692, -1.273053, 3.180382, 0.627451, 0, 1, 1,
0.7792895, -0.6445882, 3.192994, 0.6313726, 0, 1, 1,
0.7815135, -0.3021516, 1.748475, 0.6392157, 0, 1, 1,
0.7818948, 1.299244, 0.6878522, 0.6431373, 0, 1, 1,
0.8040355, -0.7179203, 2.837106, 0.6509804, 0, 1, 1,
0.8049941, -0.2884342, 1.925194, 0.654902, 0, 1, 1,
0.8105524, 0.7929284, 0.7568204, 0.6627451, 0, 1, 1,
0.8110731, 2.451573, -1.210329, 0.6666667, 0, 1, 1,
0.8114891, -1.261963, 1.026254, 0.6745098, 0, 1, 1,
0.8153886, 0.5945886, 1.722985, 0.6784314, 0, 1, 1,
0.8190656, 0.725125, 0.1425188, 0.6862745, 0, 1, 1,
0.8216431, -0.9908804, 2.272603, 0.6901961, 0, 1, 1,
0.8223734, 0.2646696, -0.5205356, 0.6980392, 0, 1, 1,
0.8273339, 0.7340855, 2.283667, 0.7058824, 0, 1, 1,
0.8287144, 0.2540266, 0.4780949, 0.7098039, 0, 1, 1,
0.8341693, -0.4999479, 4.200446, 0.7176471, 0, 1, 1,
0.8360149, -0.2188488, 1.928141, 0.7215686, 0, 1, 1,
0.8438792, 0.8310006, -0.7714663, 0.7294118, 0, 1, 1,
0.8471104, 0.4007467, 2.063518, 0.7333333, 0, 1, 1,
0.8497592, -0.9911803, 3.675579, 0.7411765, 0, 1, 1,
0.8558992, 1.765159, -0.1934361, 0.7450981, 0, 1, 1,
0.8561673, -0.6725586, 3.141876, 0.7529412, 0, 1, 1,
0.8575162, -1.392986, 2.17516, 0.7568628, 0, 1, 1,
0.8608152, -0.7497485, 2.051308, 0.7647059, 0, 1, 1,
0.8615651, -1.139301, 3.398468, 0.7686275, 0, 1, 1,
0.8628148, -0.4358506, 0.650134, 0.7764706, 0, 1, 1,
0.8628927, -0.8390344, 2.567976, 0.7803922, 0, 1, 1,
0.8646054, 0.6778696, 1.129944, 0.7882353, 0, 1, 1,
0.8685616, -0.2146533, 1.287399, 0.7921569, 0, 1, 1,
0.8826439, -1.174733, 2.229909, 0.8, 0, 1, 1,
0.8827578, 0.4264004, 0.8349583, 0.8078431, 0, 1, 1,
0.8862707, 0.3733813, 1.747891, 0.8117647, 0, 1, 1,
0.8874219, 0.1430783, 1.221534, 0.8196079, 0, 1, 1,
0.8897425, -0.1392034, 2.533268, 0.8235294, 0, 1, 1,
0.889809, 0.1052842, 1.668905, 0.8313726, 0, 1, 1,
0.8970802, -2.352048, 1.827435, 0.8352941, 0, 1, 1,
0.9022776, -0.6684856, 2.609435, 0.8431373, 0, 1, 1,
0.9090522, 1.545129, 0.7543681, 0.8470588, 0, 1, 1,
0.916962, -0.4834737, 3.258896, 0.854902, 0, 1, 1,
0.9170887, 1.078414, 1.508793, 0.8588235, 0, 1, 1,
0.9210033, 0.07316657, 0.4011576, 0.8666667, 0, 1, 1,
0.9267759, 0.8615153, 1.231848, 0.8705882, 0, 1, 1,
0.9299691, -0.3958569, 2.537299, 0.8784314, 0, 1, 1,
0.9331393, -2.029032, 3.429205, 0.8823529, 0, 1, 1,
0.9397566, -0.0682126, 2.278693, 0.8901961, 0, 1, 1,
0.9441874, -0.6921276, 2.473492, 0.8941177, 0, 1, 1,
0.95305, 0.8662756, 1.183456, 0.9019608, 0, 1, 1,
0.9601144, 1.637846, -0.1689318, 0.9098039, 0, 1, 1,
0.9601305, -1.073228, 3.728362, 0.9137255, 0, 1, 1,
0.966163, 0.8519459, -1.243684, 0.9215686, 0, 1, 1,
0.9719611, -1.192755, 1.429946, 0.9254902, 0, 1, 1,
0.9747326, 0.08143319, 1.615844, 0.9333333, 0, 1, 1,
0.9896306, 0.9751765, 1.236827, 0.9372549, 0, 1, 1,
0.9924567, 0.8878596, -0.0276151, 0.945098, 0, 1, 1,
0.9963881, 1.291945, 3.457144, 0.9490196, 0, 1, 1,
1.008756, 0.0356618, 1.159379, 0.9568627, 0, 1, 1,
1.010925, -1.270472, 3.485002, 0.9607843, 0, 1, 1,
1.012241, -0.3229121, 2.745348, 0.9686275, 0, 1, 1,
1.014161, -0.596269, 1.84833, 0.972549, 0, 1, 1,
1.015781, 2.398156, 0.2825261, 0.9803922, 0, 1, 1,
1.016918, 0.06948287, 0.19956, 0.9843137, 0, 1, 1,
1.020653, -0.7515773, 2.387166, 0.9921569, 0, 1, 1,
1.021259, -1.260757, 2.224647, 0.9960784, 0, 1, 1,
1.021363, 0.4716985, 0.3373445, 1, 0, 0.9960784, 1,
1.021693, -2.256503, 1.732848, 1, 0, 0.9882353, 1,
1.022077, -1.172758, 2.631661, 1, 0, 0.9843137, 1,
1.033714, -0.4063266, 2.151207, 1, 0, 0.9764706, 1,
1.038813, 0.8596522, 0.2149188, 1, 0, 0.972549, 1,
1.040584, -0.4349766, 2.0962, 1, 0, 0.9647059, 1,
1.041431, 0.635896, 0.9577726, 1, 0, 0.9607843, 1,
1.042725, 0.3464227, 1.074583, 1, 0, 0.9529412, 1,
1.043591, -0.2692207, 2.806389, 1, 0, 0.9490196, 1,
1.051738, -0.3441151, 0.6114417, 1, 0, 0.9411765, 1,
1.06082, 1.548709, 1.256876, 1, 0, 0.9372549, 1,
1.063487, -2.149924, 2.590283, 1, 0, 0.9294118, 1,
1.06708, -0.2086037, 2.411875, 1, 0, 0.9254902, 1,
1.069766, 0.8518945, 1.532182, 1, 0, 0.9176471, 1,
1.073366, 0.8827871, 2.034056, 1, 0, 0.9137255, 1,
1.075614, 0.1649725, 2.111909, 1, 0, 0.9058824, 1,
1.075871, -1.891157, 2.856044, 1, 0, 0.9019608, 1,
1.07973, -0.6642962, 1.837657, 1, 0, 0.8941177, 1,
1.080925, -1.178174, 2.244048, 1, 0, 0.8862745, 1,
1.083631, 0.6657301, 0.250356, 1, 0, 0.8823529, 1,
1.084431, 0.7594178, 0.4530388, 1, 0, 0.8745098, 1,
1.093075, 0.4276468, 0.135271, 1, 0, 0.8705882, 1,
1.095288, 0.6495483, 0.3724677, 1, 0, 0.8627451, 1,
1.102559, -0.5194679, 1.868195, 1, 0, 0.8588235, 1,
1.108875, -0.4016123, 1.663, 1, 0, 0.8509804, 1,
1.112644, 0.857421, 0.2076737, 1, 0, 0.8470588, 1,
1.116758, 0.4447997, 1.582094, 1, 0, 0.8392157, 1,
1.135737, -1.568793, 2.666663, 1, 0, 0.8352941, 1,
1.137528, 0.2973712, 1.648194, 1, 0, 0.827451, 1,
1.14009, -1.814078, 2.353933, 1, 0, 0.8235294, 1,
1.148428, -0.7491873, 0.9636109, 1, 0, 0.8156863, 1,
1.151129, 0.1177236, 0.4061862, 1, 0, 0.8117647, 1,
1.154566, -0.7591016, 1.831536, 1, 0, 0.8039216, 1,
1.169166, -0.2670844, 0.7011812, 1, 0, 0.7960784, 1,
1.171239, 0.2224704, 2.383748, 1, 0, 0.7921569, 1,
1.171962, -0.0312756, 2.104527, 1, 0, 0.7843137, 1,
1.179768, -0.7892985, 1.90215, 1, 0, 0.7803922, 1,
1.194033, 1.896976, -0.3967996, 1, 0, 0.772549, 1,
1.196204, -2.647618, 4.183848, 1, 0, 0.7686275, 1,
1.200831, 0.4937011, 0.8248283, 1, 0, 0.7607843, 1,
1.201011, 0.2386754, 1.413716, 1, 0, 0.7568628, 1,
1.203176, 1.613342, -1.313066, 1, 0, 0.7490196, 1,
1.20348, -0.1275774, 2.515313, 1, 0, 0.7450981, 1,
1.207471, 0.745749, 1.149971, 1, 0, 0.7372549, 1,
1.207767, -1.816152, 2.74677, 1, 0, 0.7333333, 1,
1.228692, 0.04236213, 0.6058286, 1, 0, 0.7254902, 1,
1.235793, -0.4374588, 1.021237, 1, 0, 0.7215686, 1,
1.246678, 0.5793914, 1.459778, 1, 0, 0.7137255, 1,
1.249115, 0.4494433, 0.325708, 1, 0, 0.7098039, 1,
1.257062, -0.2408432, 1.010646, 1, 0, 0.7019608, 1,
1.261137, 0.2227857, 2.740367, 1, 0, 0.6941177, 1,
1.265324, -0.4032746, 3.375669, 1, 0, 0.6901961, 1,
1.265785, -0.3965288, 2.080811, 1, 0, 0.682353, 1,
1.275092, 1.116003, 2.076815, 1, 0, 0.6784314, 1,
1.275403, -0.4217155, 2.340021, 1, 0, 0.6705883, 1,
1.285442, 1.249977, -0.1558705, 1, 0, 0.6666667, 1,
1.286734, -0.2511557, 1.240322, 1, 0, 0.6588235, 1,
1.291089, -2.671223, 3.130781, 1, 0, 0.654902, 1,
1.293064, -0.3124534, 3.281579, 1, 0, 0.6470588, 1,
1.296226, 1.219573, 1.996939, 1, 0, 0.6431373, 1,
1.301404, -0.1854435, 1.895891, 1, 0, 0.6352941, 1,
1.308064, -0.4166631, 2.826414, 1, 0, 0.6313726, 1,
1.313843, -0.201917, 1.381608, 1, 0, 0.6235294, 1,
1.314745, 0.5196162, 0.1885999, 1, 0, 0.6196079, 1,
1.317551, -0.3903389, -0.1803439, 1, 0, 0.6117647, 1,
1.328556, 0.590624, 2.253442, 1, 0, 0.6078432, 1,
1.331299, -1.31853, 3.466426, 1, 0, 0.6, 1,
1.338003, 0.06967394, -0.2306717, 1, 0, 0.5921569, 1,
1.358724, -0.7241704, 1.379294, 1, 0, 0.5882353, 1,
1.363254, -0.8458072, 2.463404, 1, 0, 0.5803922, 1,
1.368738, 0.4473288, 1.693908, 1, 0, 0.5764706, 1,
1.37538, -0.4133899, 1.872365, 1, 0, 0.5686275, 1,
1.37668, -2.124814, 2.439431, 1, 0, 0.5647059, 1,
1.387203, 1.043543, 2.660556, 1, 0, 0.5568628, 1,
1.389772, 1.462875, -0.2415673, 1, 0, 0.5529412, 1,
1.402469, -0.2896228, 2.189758, 1, 0, 0.5450981, 1,
1.408378, 0.7464854, 1.22193, 1, 0, 0.5411765, 1,
1.409673, 0.001541606, 1.84561, 1, 0, 0.5333334, 1,
1.414037, -0.3943322, 3.241045, 1, 0, 0.5294118, 1,
1.418171, 1.968179, -0.8733237, 1, 0, 0.5215687, 1,
1.427331, -0.5789288, 2.374767, 1, 0, 0.5176471, 1,
1.430952, -1.593649, 4.227198, 1, 0, 0.509804, 1,
1.433493, -0.5721205, 1.809084, 1, 0, 0.5058824, 1,
1.435372, 1.304965, 0.4764401, 1, 0, 0.4980392, 1,
1.44182, -0.0657884, 0.8599298, 1, 0, 0.4901961, 1,
1.447466, -0.3273059, 3.163357, 1, 0, 0.4862745, 1,
1.45181, -1.016514, 1.216065, 1, 0, 0.4784314, 1,
1.454876, -1.027772, 1.672536, 1, 0, 0.4745098, 1,
1.455768, 0.3156042, 1.312951, 1, 0, 0.4666667, 1,
1.475862, 0.4773014, 1.364057, 1, 0, 0.4627451, 1,
1.499061, -1.12714, 2.759831, 1, 0, 0.454902, 1,
1.501672, -0.5853087, 2.908507, 1, 0, 0.4509804, 1,
1.503948, -1.164648, 1.882187, 1, 0, 0.4431373, 1,
1.51036, -0.1783907, 1.432721, 1, 0, 0.4392157, 1,
1.510701, -1.640829, 2.068622, 1, 0, 0.4313726, 1,
1.517757, 1.092443, 0.7079642, 1, 0, 0.427451, 1,
1.522978, -0.2268409, 1.824174, 1, 0, 0.4196078, 1,
1.523073, 1.411747, 1.207293, 1, 0, 0.4156863, 1,
1.528522, 0.4219311, 0.6443195, 1, 0, 0.4078431, 1,
1.540862, -0.4470687, 1.478587, 1, 0, 0.4039216, 1,
1.549395, 0.7963155, 1.665639, 1, 0, 0.3960784, 1,
1.549801, -0.2076961, 2.463132, 1, 0, 0.3882353, 1,
1.550205, -1.117105, 1.199845, 1, 0, 0.3843137, 1,
1.573875, -0.490266, 2.538009, 1, 0, 0.3764706, 1,
1.582549, -0.004339412, 1.327839, 1, 0, 0.372549, 1,
1.584382, -1.676571, 1.184686, 1, 0, 0.3647059, 1,
1.585453, -1.202624, 4.417067, 1, 0, 0.3607843, 1,
1.588035, 1.255203, 1.386371, 1, 0, 0.3529412, 1,
1.591797, -0.9947876, 1.456047, 1, 0, 0.3490196, 1,
1.606018, -0.2723798, 0.8350717, 1, 0, 0.3411765, 1,
1.611335, 0.3645395, 3.253453, 1, 0, 0.3372549, 1,
1.622129, 0.05515629, 1.458758, 1, 0, 0.3294118, 1,
1.639448, 0.5767021, 2.46968, 1, 0, 0.3254902, 1,
1.671711, -0.4979901, 2.331338, 1, 0, 0.3176471, 1,
1.683796, 1.795866, 1.714429, 1, 0, 0.3137255, 1,
1.686291, -0.8214332, 1.708888, 1, 0, 0.3058824, 1,
1.69348, -0.3851775, 1.409165, 1, 0, 0.2980392, 1,
1.726283, 0.612791, 1.052996, 1, 0, 0.2941177, 1,
1.73376, -0.1466679, 2.81249, 1, 0, 0.2862745, 1,
1.735239, -0.9218871, 0.5272156, 1, 0, 0.282353, 1,
1.73843, 0.006307718, 2.298003, 1, 0, 0.2745098, 1,
1.742065, 1.312286, 1.10023, 1, 0, 0.2705882, 1,
1.748746, 0.9142966, -0.2172258, 1, 0, 0.2627451, 1,
1.759251, -1.064338, 2.698406, 1, 0, 0.2588235, 1,
1.782834, 0.1362235, 1.614301, 1, 0, 0.2509804, 1,
1.787551, -1.328642, 3.28421, 1, 0, 0.2470588, 1,
1.813848, 0.2782955, 0.8083391, 1, 0, 0.2392157, 1,
1.824377, -0.89292, -0.7578467, 1, 0, 0.2352941, 1,
1.845741, -0.3604404, 0.03278042, 1, 0, 0.227451, 1,
1.865323, 0.9253776, 1.194631, 1, 0, 0.2235294, 1,
1.874303, -0.2938862, 2.462122, 1, 0, 0.2156863, 1,
1.877621, -0.6318734, 1.363965, 1, 0, 0.2117647, 1,
1.890904, -0.3846746, 1.573181, 1, 0, 0.2039216, 1,
1.896313, 1.156273, 1.829738, 1, 0, 0.1960784, 1,
1.909227, 0.8720475, 0.7546273, 1, 0, 0.1921569, 1,
1.913706, -1.502681, 0.9439716, 1, 0, 0.1843137, 1,
1.968562, 0.4219236, 1.93123, 1, 0, 0.1803922, 1,
1.972121, -0.7338597, 1.19194, 1, 0, 0.172549, 1,
1.972644, 0.7889748, 2.034679, 1, 0, 0.1686275, 1,
1.986057, 0.06444869, 1.291461, 1, 0, 0.1607843, 1,
2.007419, -0.6872954, 2.559349, 1, 0, 0.1568628, 1,
2.008457, 1.365501, 0.5651585, 1, 0, 0.1490196, 1,
2.022367, 0.6365502, 1.090231, 1, 0, 0.145098, 1,
2.058033, 0.610798, 0.6850769, 1, 0, 0.1372549, 1,
2.073258, -0.3648278, 1.296459, 1, 0, 0.1333333, 1,
2.097055, 1.019813, 2.042334, 1, 0, 0.1254902, 1,
2.196176, 0.2362308, 1.594892, 1, 0, 0.1215686, 1,
2.203546, -0.9347047, 3.024045, 1, 0, 0.1137255, 1,
2.207907, 0.1908643, 2.743558, 1, 0, 0.1098039, 1,
2.237342, 0.02087106, 1.768104, 1, 0, 0.1019608, 1,
2.247335, 0.3465819, 0.8194643, 1, 0, 0.09411765, 1,
2.277479, 0.4655494, 2.465678, 1, 0, 0.09019608, 1,
2.284723, 0.6467385, 0.3241707, 1, 0, 0.08235294, 1,
2.299571, -0.2050563, 1.928659, 1, 0, 0.07843138, 1,
2.301395, -2.786522, 2.448776, 1, 0, 0.07058824, 1,
2.344244, 0.1070768, 1.341967, 1, 0, 0.06666667, 1,
2.368433, 0.4656073, 2.469091, 1, 0, 0.05882353, 1,
2.370374, 0.5106334, 1.661965, 1, 0, 0.05490196, 1,
2.531406, 0.9717982, 2.685431, 1, 0, 0.04705882, 1,
2.660449, 1.269565, 1.519814, 1, 0, 0.04313726, 1,
2.711808, 2.566493, 1.146841, 1, 0, 0.03529412, 1,
2.959874, 0.6804529, 1.624561, 1, 0, 0.03137255, 1,
3.044153, 1.276727, 1.763052, 1, 0, 0.02352941, 1,
3.052774, -1.220152, 2.455165, 1, 0, 0.01960784, 1,
3.183289, -0.1878091, -0.01655194, 1, 0, 0.01176471, 1,
3.772748, 0.3745579, 0.3901863, 1, 0, 0.007843138, 1
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
0.006811261, -4.660153, -7.501225, 0, -0.5, 0.5, 0.5,
0.006811261, -4.660153, -7.501225, 1, -0.5, 0.5, 0.5,
0.006811261, -4.660153, -7.501225, 1, 1.5, 0.5, 0.5,
0.006811261, -4.660153, -7.501225, 0, 1.5, 0.5, 0.5
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
-5.035779, -0.3435762, -7.501225, 0, -0.5, 0.5, 0.5,
-5.035779, -0.3435762, -7.501225, 1, -0.5, 0.5, 0.5,
-5.035779, -0.3435762, -7.501225, 1, 1.5, 0.5, 0.5,
-5.035779, -0.3435762, -7.501225, 0, 1.5, 0.5, 0.5
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
-5.035779, -4.660153, 0.3721614, 0, -0.5, 0.5, 0.5,
-5.035779, -4.660153, 0.3721614, 1, -0.5, 0.5, 0.5,
-5.035779, -4.660153, 0.3721614, 1, 1.5, 0.5, 0.5,
-5.035779, -4.660153, 0.3721614, 0, 1.5, 0.5, 0.5
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
-2, -3.66402, -5.68429,
2, -3.66402, -5.68429,
-2, -3.66402, -5.68429,
-2, -3.830042, -5.987113,
0, -3.66402, -5.68429,
0, -3.830042, -5.987113,
2, -3.66402, -5.68429,
2, -3.830042, -5.987113
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
"0",
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
-2, -4.162086, -6.592758, 0, -0.5, 0.5, 0.5,
-2, -4.162086, -6.592758, 1, -0.5, 0.5, 0.5,
-2, -4.162086, -6.592758, 1, 1.5, 0.5, 0.5,
-2, -4.162086, -6.592758, 0, 1.5, 0.5, 0.5,
0, -4.162086, -6.592758, 0, -0.5, 0.5, 0.5,
0, -4.162086, -6.592758, 1, -0.5, 0.5, 0.5,
0, -4.162086, -6.592758, 1, 1.5, 0.5, 0.5,
0, -4.162086, -6.592758, 0, 1.5, 0.5, 0.5,
2, -4.162086, -6.592758, 0, -0.5, 0.5, 0.5,
2, -4.162086, -6.592758, 1, -0.5, 0.5, 0.5,
2, -4.162086, -6.592758, 1, 1.5, 0.5, 0.5,
2, -4.162086, -6.592758, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.872104, -3, -5.68429,
-3.872104, 2, -5.68429,
-3.872104, -3, -5.68429,
-4.06605, -3, -5.987113,
-3.872104, -2, -5.68429,
-4.06605, -2, -5.987113,
-3.872104, -1, -5.68429,
-4.06605, -1, -5.987113,
-3.872104, 0, -5.68429,
-4.06605, 0, -5.987113,
-3.872104, 1, -5.68429,
-4.06605, 1, -5.987113,
-3.872104, 2, -5.68429,
-4.06605, 2, -5.987113
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
-4.453941, -3, -6.592758, 0, -0.5, 0.5, 0.5,
-4.453941, -3, -6.592758, 1, -0.5, 0.5, 0.5,
-4.453941, -3, -6.592758, 1, 1.5, 0.5, 0.5,
-4.453941, -3, -6.592758, 0, 1.5, 0.5, 0.5,
-4.453941, -2, -6.592758, 0, -0.5, 0.5, 0.5,
-4.453941, -2, -6.592758, 1, -0.5, 0.5, 0.5,
-4.453941, -2, -6.592758, 1, 1.5, 0.5, 0.5,
-4.453941, -2, -6.592758, 0, 1.5, 0.5, 0.5,
-4.453941, -1, -6.592758, 0, -0.5, 0.5, 0.5,
-4.453941, -1, -6.592758, 1, -0.5, 0.5, 0.5,
-4.453941, -1, -6.592758, 1, 1.5, 0.5, 0.5,
-4.453941, -1, -6.592758, 0, 1.5, 0.5, 0.5,
-4.453941, 0, -6.592758, 0, -0.5, 0.5, 0.5,
-4.453941, 0, -6.592758, 1, -0.5, 0.5, 0.5,
-4.453941, 0, -6.592758, 1, 1.5, 0.5, 0.5,
-4.453941, 0, -6.592758, 0, 1.5, 0.5, 0.5,
-4.453941, 1, -6.592758, 0, -0.5, 0.5, 0.5,
-4.453941, 1, -6.592758, 1, -0.5, 0.5, 0.5,
-4.453941, 1, -6.592758, 1, 1.5, 0.5, 0.5,
-4.453941, 1, -6.592758, 0, 1.5, 0.5, 0.5,
-4.453941, 2, -6.592758, 0, -0.5, 0.5, 0.5,
-4.453941, 2, -6.592758, 1, -0.5, 0.5, 0.5,
-4.453941, 2, -6.592758, 1, 1.5, 0.5, 0.5,
-4.453941, 2, -6.592758, 0, 1.5, 0.5, 0.5
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
-3.872104, -3.66402, -4,
-3.872104, -3.66402, 6,
-3.872104, -3.66402, -4,
-4.06605, -3.830042, -4,
-3.872104, -3.66402, -2,
-4.06605, -3.830042, -2,
-3.872104, -3.66402, 0,
-4.06605, -3.830042, 0,
-3.872104, -3.66402, 2,
-4.06605, -3.830042, 2,
-3.872104, -3.66402, 4,
-4.06605, -3.830042, 4,
-3.872104, -3.66402, 6,
-4.06605, -3.830042, 6
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
-4.453941, -4.162086, -4, 0, -0.5, 0.5, 0.5,
-4.453941, -4.162086, -4, 1, -0.5, 0.5, 0.5,
-4.453941, -4.162086, -4, 1, 1.5, 0.5, 0.5,
-4.453941, -4.162086, -4, 0, 1.5, 0.5, 0.5,
-4.453941, -4.162086, -2, 0, -0.5, 0.5, 0.5,
-4.453941, -4.162086, -2, 1, -0.5, 0.5, 0.5,
-4.453941, -4.162086, -2, 1, 1.5, 0.5, 0.5,
-4.453941, -4.162086, -2, 0, 1.5, 0.5, 0.5,
-4.453941, -4.162086, 0, 0, -0.5, 0.5, 0.5,
-4.453941, -4.162086, 0, 1, -0.5, 0.5, 0.5,
-4.453941, -4.162086, 0, 1, 1.5, 0.5, 0.5,
-4.453941, -4.162086, 0, 0, 1.5, 0.5, 0.5,
-4.453941, -4.162086, 2, 0, -0.5, 0.5, 0.5,
-4.453941, -4.162086, 2, 1, -0.5, 0.5, 0.5,
-4.453941, -4.162086, 2, 1, 1.5, 0.5, 0.5,
-4.453941, -4.162086, 2, 0, 1.5, 0.5, 0.5,
-4.453941, -4.162086, 4, 0, -0.5, 0.5, 0.5,
-4.453941, -4.162086, 4, 1, -0.5, 0.5, 0.5,
-4.453941, -4.162086, 4, 1, 1.5, 0.5, 0.5,
-4.453941, -4.162086, 4, 0, 1.5, 0.5, 0.5,
-4.453941, -4.162086, 6, 0, -0.5, 0.5, 0.5,
-4.453941, -4.162086, 6, 1, -0.5, 0.5, 0.5,
-4.453941, -4.162086, 6, 1, 1.5, 0.5, 0.5,
-4.453941, -4.162086, 6, 0, 1.5, 0.5, 0.5
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
-3.872104, -3.66402, -5.68429,
-3.872104, 2.976867, -5.68429,
-3.872104, -3.66402, 6.428613,
-3.872104, 2.976867, 6.428613,
-3.872104, -3.66402, -5.68429,
-3.872104, -3.66402, 6.428613,
-3.872104, 2.976867, -5.68429,
-3.872104, 2.976867, 6.428613,
-3.872104, -3.66402, -5.68429,
3.885726, -3.66402, -5.68429,
-3.872104, -3.66402, 6.428613,
3.885726, -3.66402, 6.428613,
-3.872104, 2.976867, -5.68429,
3.885726, 2.976867, -5.68429,
-3.872104, 2.976867, 6.428613,
3.885726, 2.976867, 6.428613,
3.885726, -3.66402, -5.68429,
3.885726, 2.976867, -5.68429,
3.885726, -3.66402, 6.428613,
3.885726, 2.976867, 6.428613,
3.885726, -3.66402, -5.68429,
3.885726, -3.66402, 6.428613,
3.885726, 2.976867, -5.68429,
3.885726, 2.976867, 6.428613
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
var radius = 8.459973;
var distance = 37.63937;
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
mvMatrix.translate( -0.006811261, 0.3435762, -0.3721614 );
mvMatrix.scale( 1.179078, 1.37739, 0.7551525 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.63937);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
furethrin<-read.table("furethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-furethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'furethrin' not found
```

```r
y<-furethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'furethrin' not found
```

```r
z<-furethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'furethrin' not found
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
-3.759126, -0.1683695, -1.476356, 0, 0, 1, 1, 1,
-3.105331, 1.32469, -1.638378, 1, 0, 0, 1, 1,
-3.093277, -0.8550483, -0.8378417, 1, 0, 0, 1, 1,
-2.866039, -0.1865221, -0.882311, 1, 0, 0, 1, 1,
-2.837346, -0.8618037, -1.732229, 1, 0, 0, 1, 1,
-2.725575, -2.025215, -0.772823, 1, 0, 0, 1, 1,
-2.716777, -0.1820574, -0.1993083, 0, 0, 0, 1, 1,
-2.563944, -0.7569311, -1.502547, 0, 0, 0, 1, 1,
-2.515678, 0.6140532, -0.6076601, 0, 0, 0, 1, 1,
-2.452549, 0.4434009, -0.8016176, 0, 0, 0, 1, 1,
-2.410831, -0.5907331, -1.316721, 0, 0, 0, 1, 1,
-2.405486, -0.6880248, -2.878176, 0, 0, 0, 1, 1,
-2.298697, -1.114435, -1.699998, 0, 0, 0, 1, 1,
-2.29844, -0.5261309, -1.768587, 1, 1, 1, 1, 1,
-2.270015, -0.6390734, -2.249692, 1, 1, 1, 1, 1,
-2.159554, 0.2795317, -1.320982, 1, 1, 1, 1, 1,
-2.065983, 0.6054001, -0.2653904, 1, 1, 1, 1, 1,
-2.058465, 0.6452329, 0.1269271, 1, 1, 1, 1, 1,
-2.008541, -1.750512, -3.317779, 1, 1, 1, 1, 1,
-1.991385, -0.7157508, -1.519421, 1, 1, 1, 1, 1,
-1.959559, 0.1617211, -1.37318, 1, 1, 1, 1, 1,
-1.925376, 0.4252076, -2.613924, 1, 1, 1, 1, 1,
-1.858007, -1.303418, -4.86405, 1, 1, 1, 1, 1,
-1.843342, 0.798086, -0.2417635, 1, 1, 1, 1, 1,
-1.818666, 1.08475, -2.223945, 1, 1, 1, 1, 1,
-1.81146, 0.4332751, -0.5707934, 1, 1, 1, 1, 1,
-1.745364, 0.1069183, -0.9318649, 1, 1, 1, 1, 1,
-1.744203, -0.02483721, -0.4629129, 1, 1, 1, 1, 1,
-1.708362, 0.3678814, -1.70446, 0, 0, 1, 1, 1,
-1.707148, 0.02242963, -1.760685, 1, 0, 0, 1, 1,
-1.701605, 0.6825751, -1.28306, 1, 0, 0, 1, 1,
-1.70112, -0.06648334, -3.302644, 1, 0, 0, 1, 1,
-1.685034, 0.2888125, -1.372614, 1, 0, 0, 1, 1,
-1.680789, -2.131413, -1.804532, 1, 0, 0, 1, 1,
-1.667982, -1.592614, 0.03821147, 0, 0, 0, 1, 1,
-1.663623, -1.013494, -3.086447, 0, 0, 0, 1, 1,
-1.657176, 1.890471, -1.354728, 0, 0, 0, 1, 1,
-1.647036, -1.028475, -2.051459, 0, 0, 0, 1, 1,
-1.640109, 1.895342, -0.7580953, 0, 0, 0, 1, 1,
-1.629428, 0.7128244, -1.073895, 0, 0, 0, 1, 1,
-1.624569, -1.271382, -0.6036776, 0, 0, 0, 1, 1,
-1.60505, -0.8742979, -3.517119, 1, 1, 1, 1, 1,
-1.569331, 0.2956269, -1.561297, 1, 1, 1, 1, 1,
-1.566908, 0.4934701, -0.8695195, 1, 1, 1, 1, 1,
-1.532994, -0.79281, 0.4054303, 1, 1, 1, 1, 1,
-1.528487, 0.2620863, 0.3191251, 1, 1, 1, 1, 1,
-1.52225, 0.03849442, -1.855785, 1, 1, 1, 1, 1,
-1.495537, -0.8038963, -1.976354, 1, 1, 1, 1, 1,
-1.481411, 0.7967159, -0.2120854, 1, 1, 1, 1, 1,
-1.479527, 0.07366684, -1.897121, 1, 1, 1, 1, 1,
-1.46752, 0.2267066, -2.886011, 1, 1, 1, 1, 1,
-1.462075, -0.4337165, -2.44227, 1, 1, 1, 1, 1,
-1.449229, -0.9376166, -3.002544, 1, 1, 1, 1, 1,
-1.439696, -0.1200195, -1.643223, 1, 1, 1, 1, 1,
-1.433857, -0.2954239, -3.623332, 1, 1, 1, 1, 1,
-1.428708, 1.514354, -1.011394, 1, 1, 1, 1, 1,
-1.428058, 1.169232, -0.4916145, 0, 0, 1, 1, 1,
-1.419346, -0.000951024, -2.995431, 1, 0, 0, 1, 1,
-1.419111, 2.056182, -0.8609112, 1, 0, 0, 1, 1,
-1.4144, 0.5173546, -1.236467, 1, 0, 0, 1, 1,
-1.399811, -0.2558729, -1.039094, 1, 0, 0, 1, 1,
-1.388062, -0.02330968, -2.232665, 1, 0, 0, 1, 1,
-1.38801, 0.2216655, -1.568565, 0, 0, 0, 1, 1,
-1.386594, -1.308274, -0.6877208, 0, 0, 0, 1, 1,
-1.384736, -1.426719, -1.473558, 0, 0, 0, 1, 1,
-1.378627, 0.7594172, -1.026083, 0, 0, 0, 1, 1,
-1.372144, -0.371249, -2.735251, 0, 0, 0, 1, 1,
-1.365553, -0.5554076, -1.19771, 0, 0, 0, 1, 1,
-1.361068, 0.3048154, -3.159497, 0, 0, 0, 1, 1,
-1.349409, -1.935848, -2.168304, 1, 1, 1, 1, 1,
-1.347514, -0.5422662, -2.58962, 1, 1, 1, 1, 1,
-1.344121, 0.2479985, -1.573792, 1, 1, 1, 1, 1,
-1.34397, 0.3635088, -1.322674, 1, 1, 1, 1, 1,
-1.342162, 0.9676155, -3.352876, 1, 1, 1, 1, 1,
-1.338682, 2.411795, -0.794725, 1, 1, 1, 1, 1,
-1.320085, 1.162634, -0.2140447, 1, 1, 1, 1, 1,
-1.318323, 0.5096412, -2.387781, 1, 1, 1, 1, 1,
-1.316279, 0.1677778, -0.9057892, 1, 1, 1, 1, 1,
-1.312097, -1.215736, -2.796827, 1, 1, 1, 1, 1,
-1.30637, 0.7020414, -1.054244, 1, 1, 1, 1, 1,
-1.30143, -1.610267, -1.863367, 1, 1, 1, 1, 1,
-1.297454, -1.551728, -3.47346, 1, 1, 1, 1, 1,
-1.294007, 1.492688, -1.604905, 1, 1, 1, 1, 1,
-1.283668, 0.1915665, -0.3395194, 1, 1, 1, 1, 1,
-1.258175, 0.48267, -0.7861128, 0, 0, 1, 1, 1,
-1.256025, -0.5884098, -0.8696504, 1, 0, 0, 1, 1,
-1.255335, -0.1043544, -1.523804, 1, 0, 0, 1, 1,
-1.250505, 0.8532528, -1.182934, 1, 0, 0, 1, 1,
-1.248351, -0.2458926, -0.7733368, 1, 0, 0, 1, 1,
-1.247494, 1.374553, -1.533345, 1, 0, 0, 1, 1,
-1.246358, 0.5359046, -0.715458, 0, 0, 0, 1, 1,
-1.237415, 1.500263, 0.02557723, 0, 0, 0, 1, 1,
-1.237198, -0.5199913, -3.982279, 0, 0, 0, 1, 1,
-1.226758, -1.375697, -3.128275, 0, 0, 0, 1, 1,
-1.224312, -0.5422264, -3.889671, 0, 0, 0, 1, 1,
-1.220619, 1.734205, -2.413578, 0, 0, 0, 1, 1,
-1.208895, -0.537949, -2.097654, 0, 0, 0, 1, 1,
-1.208309, 0.4269213, 0.1083498, 1, 1, 1, 1, 1,
-1.206809, 0.03933356, -2.952921, 1, 1, 1, 1, 1,
-1.200539, 0.9683847, -1.106569, 1, 1, 1, 1, 1,
-1.193833, -0.5779911, -1.315377, 1, 1, 1, 1, 1,
-1.192249, -1.218215, -1.328014, 1, 1, 1, 1, 1,
-1.184965, 0.4132878, -1.723024, 1, 1, 1, 1, 1,
-1.176317, 0.5998113, -2.953809, 1, 1, 1, 1, 1,
-1.176198, -0.06299773, -3.458927, 1, 1, 1, 1, 1,
-1.172972, -0.05632162, -2.051708, 1, 1, 1, 1, 1,
-1.169225, -1.212964, -1.887304, 1, 1, 1, 1, 1,
-1.160824, -0.6445915, -2.223214, 1, 1, 1, 1, 1,
-1.156663, -0.9955083, -2.367674, 1, 1, 1, 1, 1,
-1.15179, -0.2548003, -2.944134, 1, 1, 1, 1, 1,
-1.150288, -2.069622, -2.53566, 1, 1, 1, 1, 1,
-1.144944, -1.074157, -2.624198, 1, 1, 1, 1, 1,
-1.143911, -1.205117, -3.756114, 0, 0, 1, 1, 1,
-1.141004, 0.4221901, -1.526069, 1, 0, 0, 1, 1,
-1.137208, 0.966763, 1.045311, 1, 0, 0, 1, 1,
-1.135563, 2.273681, -1.05181, 1, 0, 0, 1, 1,
-1.133785, 0.2466437, -1.384004, 1, 0, 0, 1, 1,
-1.131852, 0.06738763, 0.3845789, 1, 0, 0, 1, 1,
-1.130935, 1.872778, -0.9746848, 0, 0, 0, 1, 1,
-1.128743, 0.2110183, -0.819607, 0, 0, 0, 1, 1,
-1.126595, -1.621217, -3.920486, 0, 0, 0, 1, 1,
-1.116901, -0.857096, -2.853683, 0, 0, 0, 1, 1,
-1.112444, -0.1994338, -2.872731, 0, 0, 0, 1, 1,
-1.107713, -0.0458007, -0.9293067, 0, 0, 0, 1, 1,
-1.096975, 0.09748279, -0.9811135, 0, 0, 0, 1, 1,
-1.093885, 0.7369629, 0.186858, 1, 1, 1, 1, 1,
-1.083314, 0.5929564, -1.183902, 1, 1, 1, 1, 1,
-1.082795, -0.6584869, -1.226537, 1, 1, 1, 1, 1,
-1.076331, -1.575711, -1.858139, 1, 1, 1, 1, 1,
-1.071213, -0.4307153, -1.787193, 1, 1, 1, 1, 1,
-1.070837, 0.8965503, -1.937435, 1, 1, 1, 1, 1,
-1.066574, 0.2723113, -1.030232, 1, 1, 1, 1, 1,
-1.066034, -0.3628238, -2.098288, 1, 1, 1, 1, 1,
-1.053415, 0.8088549, -1.233378, 1, 1, 1, 1, 1,
-1.051179, 1.320967, 0.3649677, 1, 1, 1, 1, 1,
-1.045154, 0.9239826, -0.2459175, 1, 1, 1, 1, 1,
-1.043263, -0.854219, -2.469123, 1, 1, 1, 1, 1,
-1.042717, 1.084094, 0.5215206, 1, 1, 1, 1, 1,
-1.024439, -0.1138822, -1.654414, 1, 1, 1, 1, 1,
-1.020393, 0.1346379, -1.555796, 1, 1, 1, 1, 1,
-1.018744, 0.2568699, -3.362898, 0, 0, 1, 1, 1,
-1.010753, 0.1254596, -0.7598479, 1, 0, 0, 1, 1,
-1.010612, 0.2928644, -2.0979, 1, 0, 0, 1, 1,
-1.005555, -0.3684058, -2.493272, 1, 0, 0, 1, 1,
-0.9954395, 0.3205186, 0.2583517, 1, 0, 0, 1, 1,
-0.993999, 0.03217316, -0.5724484, 1, 0, 0, 1, 1,
-0.9898927, -0.3394186, -1.677998, 0, 0, 0, 1, 1,
-0.9836652, -0.5276596, -2.322375, 0, 0, 0, 1, 1,
-0.9836603, 0.1090293, -0.8359108, 0, 0, 0, 1, 1,
-0.9820459, 0.9946296, -0.1393767, 0, 0, 0, 1, 1,
-0.9796885, 1.451036, 0.5773444, 0, 0, 0, 1, 1,
-0.9759776, -0.1844681, -1.267312, 0, 0, 0, 1, 1,
-0.9722003, 0.3566923, -1.508165, 0, 0, 0, 1, 1,
-0.9692456, -1.808527, -1.709142, 1, 1, 1, 1, 1,
-0.9667811, 0.4547198, -1.095469, 1, 1, 1, 1, 1,
-0.9619447, 0.2388813, -0.3962101, 1, 1, 1, 1, 1,
-0.9604929, 0.5117305, 0.5737312, 1, 1, 1, 1, 1,
-0.9470034, 0.1113397, -3.135444, 1, 1, 1, 1, 1,
-0.9460896, -0.8308683, -4.202056, 1, 1, 1, 1, 1,
-0.943275, 1.07527, -1.373049, 1, 1, 1, 1, 1,
-0.9430498, -0.5100043, -1.676882, 1, 1, 1, 1, 1,
-0.9335898, -1.956917, -4.162172, 1, 1, 1, 1, 1,
-0.92242, 1.949094, -0.1300503, 1, 1, 1, 1, 1,
-0.9221334, -1.190634, -3.03767, 1, 1, 1, 1, 1,
-0.9153, -2.115456, -3.057779, 1, 1, 1, 1, 1,
-0.9145445, 2.04442, -1.135445, 1, 1, 1, 1, 1,
-0.9101849, -1.54133, -0.8733378, 1, 1, 1, 1, 1,
-0.9043678, 0.7218186, -0.3269583, 1, 1, 1, 1, 1,
-0.8958369, -0.8209729, -1.703091, 0, 0, 1, 1, 1,
-0.891916, 1.70612, -0.5886636, 1, 0, 0, 1, 1,
-0.8883688, -0.3329258, -1.334824, 1, 0, 0, 1, 1,
-0.8848016, 0.1262914, -0.3893883, 1, 0, 0, 1, 1,
-0.8817007, -1.574135, -2.62564, 1, 0, 0, 1, 1,
-0.8813117, 0.223922, -0.8152772, 1, 0, 0, 1, 1,
-0.8789577, -0.2563282, -1.272691, 0, 0, 0, 1, 1,
-0.8787843, -0.589469, -3.055356, 0, 0, 0, 1, 1,
-0.8760691, -0.7583814, -1.855723, 0, 0, 0, 1, 1,
-0.8677027, -0.3159435, -0.2867166, 0, 0, 0, 1, 1,
-0.8643558, -1.356292, -1.278965, 0, 0, 0, 1, 1,
-0.8636658, -0.5161178, -1.154953, 0, 0, 0, 1, 1,
-0.8579895, -1.472966, -2.790979, 0, 0, 0, 1, 1,
-0.8538691, 0.9953963, -1.906304, 1, 1, 1, 1, 1,
-0.8526228, -0.4521319, -2.142407, 1, 1, 1, 1, 1,
-0.8510976, 0.5337927, -1.562373, 1, 1, 1, 1, 1,
-0.8486394, -1.18071, -3.226468, 1, 1, 1, 1, 1,
-0.8478047, -0.9699731, -1.935933, 1, 1, 1, 1, 1,
-0.8469106, -0.1025525, -3.074524, 1, 1, 1, 1, 1,
-0.8451625, 2.880155, -0.7118158, 1, 1, 1, 1, 1,
-0.8415136, -1.278515, -3.758783, 1, 1, 1, 1, 1,
-0.8337066, -1.333069, -2.403538, 1, 1, 1, 1, 1,
-0.818708, -1.05159, -2.67396, 1, 1, 1, 1, 1,
-0.807517, 0.6177403, -0.3054878, 1, 1, 1, 1, 1,
-0.805733, -1.17306, -2.918465, 1, 1, 1, 1, 1,
-0.8055803, 0.655269, -0.206843, 1, 1, 1, 1, 1,
-0.805351, 0.04560735, -0.8941662, 1, 1, 1, 1, 1,
-0.7975582, -0.4525137, -1.31491, 1, 1, 1, 1, 1,
-0.7910788, 0.7797065, -1.24065, 0, 0, 1, 1, 1,
-0.7880133, 1.316027, -0.1362843, 1, 0, 0, 1, 1,
-0.7869459, 0.07918899, -1.459953, 1, 0, 0, 1, 1,
-0.7850156, 2.254646, 1.446088, 1, 0, 0, 1, 1,
-0.7822521, -0.1498554, -0.3056934, 1, 0, 0, 1, 1,
-0.780246, -2.274556, -2.555594, 1, 0, 0, 1, 1,
-0.7751905, -0.3909239, -2.645283, 0, 0, 0, 1, 1,
-0.7748154, -0.9732997, -2.745601, 0, 0, 0, 1, 1,
-0.774232, -0.02723904, -1.377607, 0, 0, 0, 1, 1,
-0.7610302, -0.8803437, -2.063473, 0, 0, 0, 1, 1,
-0.7602638, -0.1367472, -1.110581, 0, 0, 0, 1, 1,
-0.7592353, 1.30745, -0.02277704, 0, 0, 0, 1, 1,
-0.7559974, 0.04059132, 0.3472508, 0, 0, 0, 1, 1,
-0.7555671, -0.4056504, -1.470952, 1, 1, 1, 1, 1,
-0.7505499, -0.7402948, -0.3001684, 1, 1, 1, 1, 1,
-0.745787, -0.3723888, -1.19729, 1, 1, 1, 1, 1,
-0.7336382, 2.022647, -3.311409, 1, 1, 1, 1, 1,
-0.7275574, -1.074083, -3.829813, 1, 1, 1, 1, 1,
-0.7216367, -0.3705517, -4.249032, 1, 1, 1, 1, 1,
-0.7212389, -1.093873, -3.275999, 1, 1, 1, 1, 1,
-0.7196551, 1.956668, 0.5831929, 1, 1, 1, 1, 1,
-0.7107852, -0.3852729, -2.204625, 1, 1, 1, 1, 1,
-0.6999855, 0.8119385, 0.8361278, 1, 1, 1, 1, 1,
-0.6972192, -1.035558, -1.449179, 1, 1, 1, 1, 1,
-0.6943368, 0.07755261, -2.101619, 1, 1, 1, 1, 1,
-0.6895486, -0.9372107, -1.528066, 1, 1, 1, 1, 1,
-0.6834605, -0.9141057, -2.264868, 1, 1, 1, 1, 1,
-0.6829709, 0.603606, -1.322543, 1, 1, 1, 1, 1,
-0.6823148, -0.09513171, -1.477969, 0, 0, 1, 1, 1,
-0.6775135, -0.1247459, -1.264876, 1, 0, 0, 1, 1,
-0.6721145, -0.03769495, -1.251525, 1, 0, 0, 1, 1,
-0.6700145, 0.2893654, -1.837786, 1, 0, 0, 1, 1,
-0.6665881, -0.6418377, -5.084614, 1, 0, 0, 1, 1,
-0.6613622, 0.006119457, -0.1106889, 1, 0, 0, 1, 1,
-0.660334, 0.2290967, -1.219381, 0, 0, 0, 1, 1,
-0.657429, -0.5982293, -2.493957, 0, 0, 0, 1, 1,
-0.6552944, 0.2104915, -0.7830437, 0, 0, 0, 1, 1,
-0.6440519, -1.262469, -2.489566, 0, 0, 0, 1, 1,
-0.6432484, 0.2834866, -2.208707, 0, 0, 0, 1, 1,
-0.63977, 0.4607315, -0.56307, 0, 0, 0, 1, 1,
-0.6390248, -0.07121728, -1.162357, 0, 0, 0, 1, 1,
-0.6306544, -1.169952, -5.166748, 1, 1, 1, 1, 1,
-0.6170212, 0.76625, -0.8118349, 1, 1, 1, 1, 1,
-0.6148961, -0.2146793, -0.4595388, 1, 1, 1, 1, 1,
-0.6133807, 1.241082, -1.134286, 1, 1, 1, 1, 1,
-0.6031229, 0.2119828, -0.4699882, 1, 1, 1, 1, 1,
-0.5986725, 0.6262439, 0.2314313, 1, 1, 1, 1, 1,
-0.5977899, -0.2710845, -0.9439571, 1, 1, 1, 1, 1,
-0.5950443, 1.072495, -0.0005332095, 1, 1, 1, 1, 1,
-0.5948713, 0.1999169, -2.035739, 1, 1, 1, 1, 1,
-0.5939829, -0.5714328, -2.445204, 1, 1, 1, 1, 1,
-0.5928759, -1.599115, -2.786614, 1, 1, 1, 1, 1,
-0.5884199, -1.36305, -2.847472, 1, 1, 1, 1, 1,
-0.5832652, -3.567308, -2.280283, 1, 1, 1, 1, 1,
-0.5790504, -1.53913, -3.826824, 1, 1, 1, 1, 1,
-0.5723967, -1.090599, -3.182118, 1, 1, 1, 1, 1,
-0.5691683, -1.49592, -1.555947, 0, 0, 1, 1, 1,
-0.5672454, 0.7358827, -2.625406, 1, 0, 0, 1, 1,
-0.5629137, 0.4468533, -0.3179503, 1, 0, 0, 1, 1,
-0.5628792, -0.3044099, -2.490645, 1, 0, 0, 1, 1,
-0.5541381, -0.3202521, -0.860066, 1, 0, 0, 1, 1,
-0.5537779, 1.842225, -1.181936, 1, 0, 0, 1, 1,
-0.5262501, -1.152281, -1.512005, 0, 0, 0, 1, 1,
-0.5240169, 1.815283, 1.328802, 0, 0, 0, 1, 1,
-0.5183844, -0.9202182, -3.738852, 0, 0, 0, 1, 1,
-0.5178121, -0.388586, -2.432641, 0, 0, 0, 1, 1,
-0.5151304, -0.5770863, -2.26521, 0, 0, 0, 1, 1,
-0.5139663, -0.1236034, -1.147807, 0, 0, 0, 1, 1,
-0.5139334, -2.012047, -2.291621, 0, 0, 0, 1, 1,
-0.5052332, 0.6050623, 0.4091662, 1, 1, 1, 1, 1,
-0.4978267, 0.6550612, -0.9285442, 1, 1, 1, 1, 1,
-0.4961263, 1.865526, -0.4317173, 1, 1, 1, 1, 1,
-0.4942265, 0.9023765, -0.9708834, 1, 1, 1, 1, 1,
-0.4872899, 1.2841, 1.221811, 1, 1, 1, 1, 1,
-0.4869542, 1.647812, -0.4422998, 1, 1, 1, 1, 1,
-0.485211, -0.4682867, -1.422529, 1, 1, 1, 1, 1,
-0.4846502, 0.3702157, -1.468856, 1, 1, 1, 1, 1,
-0.4828388, 0.2353932, -0.5034185, 1, 1, 1, 1, 1,
-0.4815045, 0.5649138, -0.3837152, 1, 1, 1, 1, 1,
-0.4799879, -0.4970864, -2.833382, 1, 1, 1, 1, 1,
-0.4797476, -0.3106319, -1.054176, 1, 1, 1, 1, 1,
-0.4777819, 0.7254744, -1.621361, 1, 1, 1, 1, 1,
-0.4721175, 0.03885655, 0.438881, 1, 1, 1, 1, 1,
-0.4681819, 0.5046934, -0.1334462, 1, 1, 1, 1, 1,
-0.4648393, -0.4682156, -1.291895, 0, 0, 1, 1, 1,
-0.453298, 1.793293, 0.03506747, 1, 0, 0, 1, 1,
-0.4502248, -0.1767931, -2.3786, 1, 0, 0, 1, 1,
-0.449799, -2.487364, -2.952905, 1, 0, 0, 1, 1,
-0.4490224, 0.5343634, -1.182987, 1, 0, 0, 1, 1,
-0.4419439, -0.9845182, -3.194004, 1, 0, 0, 1, 1,
-0.4329987, 0.5076957, 0.1378635, 0, 0, 0, 1, 1,
-0.4300928, 1.84313, -2.94957, 0, 0, 0, 1, 1,
-0.4296485, 0.9411628, 0.09499606, 0, 0, 0, 1, 1,
-0.4289797, 0.1782912, -0.8865487, 0, 0, 0, 1, 1,
-0.4268703, -0.9983345, -2.651183, 0, 0, 0, 1, 1,
-0.425823, -2.704773, -5.507888, 0, 0, 0, 1, 1,
-0.416207, 0.0347309, -0.5762185, 0, 0, 0, 1, 1,
-0.4154375, 0.5712413, -1.73965, 1, 1, 1, 1, 1,
-0.4083334, -0.004670628, -1.227517, 1, 1, 1, 1, 1,
-0.3968839, 1.873592, -0.7298112, 1, 1, 1, 1, 1,
-0.3967923, 1.152255, -0.165393, 1, 1, 1, 1, 1,
-0.3964918, 0.6099138, -0.6614924, 1, 1, 1, 1, 1,
-0.3956728, 1.079378, -0.9992445, 1, 1, 1, 1, 1,
-0.3925208, -1.227532, -2.552055, 1, 1, 1, 1, 1,
-0.3915938, -0.5057037, -4.152456, 1, 1, 1, 1, 1,
-0.3911134, -0.7697751, -2.867413, 1, 1, 1, 1, 1,
-0.390894, -0.3643348, -1.448234, 1, 1, 1, 1, 1,
-0.3843978, -0.4168335, -2.869251, 1, 1, 1, 1, 1,
-0.3834428, 0.5156387, -1.096174, 1, 1, 1, 1, 1,
-0.3806561, 0.6638033, 0.1469477, 1, 1, 1, 1, 1,
-0.3788805, -1.027788, -2.604636, 1, 1, 1, 1, 1,
-0.3783579, -0.2460768, -1.930092, 1, 1, 1, 1, 1,
-0.3763449, -0.18666, -3.173244, 0, 0, 1, 1, 1,
-0.3751523, -0.4101868, -4.338368, 1, 0, 0, 1, 1,
-0.3749421, 0.01364759, -1.059318, 1, 0, 0, 1, 1,
-0.3735773, 1.170233, -1.325914, 1, 0, 0, 1, 1,
-0.3730019, 2.024462, 0.06750215, 1, 0, 0, 1, 1,
-0.3662516, 0.1711704, -0.8726948, 1, 0, 0, 1, 1,
-0.3642491, 2.218714, 1.29472, 0, 0, 0, 1, 1,
-0.3636925, -2.01757, -3.724225, 0, 0, 0, 1, 1,
-0.3606853, 1.315052, -2.22111, 0, 0, 0, 1, 1,
-0.3581878, 0.6499124, -0.1081493, 0, 0, 0, 1, 1,
-0.3533349, 0.3513945, 0.5081766, 0, 0, 0, 1, 1,
-0.3513269, 0.6921122, -1.945239, 0, 0, 0, 1, 1,
-0.3496936, 0.3695202, -1.633785, 0, 0, 0, 1, 1,
-0.3487839, -0.7152748, -2.350723, 1, 1, 1, 1, 1,
-0.3439687, -0.0887296, -0.7744666, 1, 1, 1, 1, 1,
-0.3432611, 1.664508, -1.499848, 1, 1, 1, 1, 1,
-0.3422152, 1.71753, 0.9762525, 1, 1, 1, 1, 1,
-0.3376807, -2.260693, -2.967779, 1, 1, 1, 1, 1,
-0.3373481, -1.068435, -0.835539, 1, 1, 1, 1, 1,
-0.3329647, -0.9799602, -3.012426, 1, 1, 1, 1, 1,
-0.3327964, 1.311871, 0.4481227, 1, 1, 1, 1, 1,
-0.328347, -1.565012, -2.532865, 1, 1, 1, 1, 1,
-0.3249716, -0.6515129, -3.655966, 1, 1, 1, 1, 1,
-0.3249028, 0.8913983, -0.5877743, 1, 1, 1, 1, 1,
-0.3227946, -0.9637305, -1.101059, 1, 1, 1, 1, 1,
-0.3208143, -0.1771613, -3.634507, 1, 1, 1, 1, 1,
-0.3195529, -1.386994, -1.725869, 1, 1, 1, 1, 1,
-0.3172777, 1.772624, 1.054031, 1, 1, 1, 1, 1,
-0.3160876, 0.8636397, -1.886072, 0, 0, 1, 1, 1,
-0.315788, 0.1978475, -1.795226, 1, 0, 0, 1, 1,
-0.3147939, -1.015838, -3.312394, 1, 0, 0, 1, 1,
-0.3146341, -2.058403, -3.793506, 1, 0, 0, 1, 1,
-0.3126229, -0.5146208, -1.475146, 1, 0, 0, 1, 1,
-0.3093491, -0.604938, -1.626443, 1, 0, 0, 1, 1,
-0.307212, 1.444225, 0.3359769, 0, 0, 0, 1, 1,
-0.3023601, -0.6523355, -2.501554, 0, 0, 0, 1, 1,
-0.2998252, 0.07065511, -1.955424, 0, 0, 0, 1, 1,
-0.2983626, -1.479618, -3.087545, 0, 0, 0, 1, 1,
-0.2979724, -0.9277586, -2.386505, 0, 0, 0, 1, 1,
-0.2961496, -0.800001, -3.2865, 0, 0, 0, 1, 1,
-0.2949312, -0.5937956, -1.028739, 0, 0, 0, 1, 1,
-0.2930969, -1.416893, -2.013845, 1, 1, 1, 1, 1,
-0.2930714, 0.6268784, 0.8051066, 1, 1, 1, 1, 1,
-0.2833362, 1.023917, -0.8347093, 1, 1, 1, 1, 1,
-0.2830051, -0.0840646, -4.536104, 1, 1, 1, 1, 1,
-0.2819356, 1.416807, 1.108104, 1, 1, 1, 1, 1,
-0.268721, 0.04340024, 1.067149, 1, 1, 1, 1, 1,
-0.266267, 1.762849, 2.22017, 1, 1, 1, 1, 1,
-0.2654118, -0.4254485, -0.7773291, 1, 1, 1, 1, 1,
-0.265106, -0.3176945, -2.298668, 1, 1, 1, 1, 1,
-0.2575916, -1.590629, -4.070959, 1, 1, 1, 1, 1,
-0.2570137, -0.4327264, -3.780264, 1, 1, 1, 1, 1,
-0.256885, 0.258781, -1.538725, 1, 1, 1, 1, 1,
-0.2557853, 0.2014828, -3.021686, 1, 1, 1, 1, 1,
-0.2514278, -1.870658, -2.020214, 1, 1, 1, 1, 1,
-0.2512272, 0.4328951, 0.4376674, 1, 1, 1, 1, 1,
-0.2432601, 1.741548, -0.02074332, 0, 0, 1, 1, 1,
-0.2421179, 0.8580835, -1.714351, 1, 0, 0, 1, 1,
-0.2399798, -1.492435, -2.312344, 1, 0, 0, 1, 1,
-0.2343485, 1.62609, -2.522862, 1, 0, 0, 1, 1,
-0.2333027, -0.2759833, -2.185892, 1, 0, 0, 1, 1,
-0.2322164, 0.01121658, -1.536414, 1, 0, 0, 1, 1,
-0.2314615, -0.6940726, -0.3463705, 0, 0, 0, 1, 1,
-0.2296246, 1.817849, -1.038465, 0, 0, 0, 1, 1,
-0.2268194, 1.744537, 0.4754839, 0, 0, 0, 1, 1,
-0.2234862, 1.693879, 0.1277455, 0, 0, 0, 1, 1,
-0.2201987, 1.847232, -0.2809551, 0, 0, 0, 1, 1,
-0.2187922, 0.3291216, 0.4811512, 0, 0, 0, 1, 1,
-0.2184849, 1.403242, -0.4470191, 0, 0, 0, 1, 1,
-0.2184539, -2.248531, -1.844276, 1, 1, 1, 1, 1,
-0.2178006, -1.451759, -2.820063, 1, 1, 1, 1, 1,
-0.2127909, 0.4287488, -0.1838385, 1, 1, 1, 1, 1,
-0.2098607, -0.1297741, -3.189607, 1, 1, 1, 1, 1,
-0.2092244, 0.1994534, -1.034202, 1, 1, 1, 1, 1,
-0.2042733, 1.290607, -0.7474835, 1, 1, 1, 1, 1,
-0.2040082, 0.5243206, -0.4536581, 1, 1, 1, 1, 1,
-0.1986343, -1.408031, -2.225235, 1, 1, 1, 1, 1,
-0.1955886, -0.9521416, -3.640835, 1, 1, 1, 1, 1,
-0.1913565, 0.3929952, 0.9300858, 1, 1, 1, 1, 1,
-0.1905572, -0.5299935, -2.465157, 1, 1, 1, 1, 1,
-0.1889815, 0.2597897, -0.1068725, 1, 1, 1, 1, 1,
-0.1876134, 1.027828, -0.3523229, 1, 1, 1, 1, 1,
-0.1858251, 0.9708194, 0.6978866, 1, 1, 1, 1, 1,
-0.184759, 1.104885, 1.460915, 1, 1, 1, 1, 1,
-0.1843231, -0.9007969, -2.275865, 0, 0, 1, 1, 1,
-0.1841564, -1.4427, -1.340575, 1, 0, 0, 1, 1,
-0.1795037, 1.421416, -0.06809745, 1, 0, 0, 1, 1,
-0.178496, -0.7416697, -2.047412, 1, 0, 0, 1, 1,
-0.1762165, 0.5910856, -0.7101754, 1, 0, 0, 1, 1,
-0.175738, 1.453909, -1.698776, 1, 0, 0, 1, 1,
-0.1744006, 0.8873222, 0.1139323, 0, 0, 0, 1, 1,
-0.1667065, -1.447893, -3.372288, 0, 0, 0, 1, 1,
-0.1621433, 0.5566146, -0.831951, 0, 0, 0, 1, 1,
-0.1621044, -0.1504498, -0.5357408, 0, 0, 0, 1, 1,
-0.160679, -1.269061, -4.414311, 0, 0, 0, 1, 1,
-0.1587793, 0.1166811, -0.4994464, 0, 0, 0, 1, 1,
-0.1549587, 0.7562413, 0.4672825, 0, 0, 0, 1, 1,
-0.1548297, -1.716704, -3.12214, 1, 1, 1, 1, 1,
-0.1544075, -0.05436139, -0.2261479, 1, 1, 1, 1, 1,
-0.154208, -0.05791317, -3.50898, 1, 1, 1, 1, 1,
-0.1537725, 1.272297, -1.670779, 1, 1, 1, 1, 1,
-0.1504882, -0.5494683, -1.23528, 1, 1, 1, 1, 1,
-0.1447996, -1.944049, -3.55746, 1, 1, 1, 1, 1,
-0.1442636, -0.6926355, -3.749673, 1, 1, 1, 1, 1,
-0.1440135, 1.472995, 0.1910252, 1, 1, 1, 1, 1,
-0.1439887, 0.3886704, 0.857138, 1, 1, 1, 1, 1,
-0.1398083, 0.3279485, -0.6314303, 1, 1, 1, 1, 1,
-0.1393134, -1.533321, -2.322727, 1, 1, 1, 1, 1,
-0.1361267, 0.1987964, -1.348619, 1, 1, 1, 1, 1,
-0.1343464, -0.2164827, -3.344475, 1, 1, 1, 1, 1,
-0.1343174, 0.7125808, -0.9845663, 1, 1, 1, 1, 1,
-0.1313541, 0.1537164, -2.54423, 1, 1, 1, 1, 1,
-0.1310572, -2.149831, -3.559109, 0, 0, 1, 1, 1,
-0.1221232, 1.486675, 0.9128101, 1, 0, 0, 1, 1,
-0.1190199, -0.2888492, -0.8848743, 1, 0, 0, 1, 1,
-0.1186678, -0.4436691, -4.257092, 1, 0, 0, 1, 1,
-0.1139249, 2.322602, -1.759938, 1, 0, 0, 1, 1,
-0.1109792, -1.432219, -2.371019, 1, 0, 0, 1, 1,
-0.1108127, -1.033802, -3.140914, 0, 0, 0, 1, 1,
-0.1078022, 1.934601, 1.218777, 0, 0, 0, 1, 1,
-0.1057312, -0.5739734, -3.93565, 0, 0, 0, 1, 1,
-0.105605, 0.2945082, -1.149428, 0, 0, 0, 1, 1,
-0.1049025, -0.02401735, -2.287635, 0, 0, 0, 1, 1,
-0.1017075, 0.78004, -0.05003115, 0, 0, 0, 1, 1,
-0.1002487, -0.2770225, -3.586239, 0, 0, 0, 1, 1,
-0.09707216, 1.130589, 0.7969135, 1, 1, 1, 1, 1,
-0.09523485, 1.17694, -2.55413, 1, 1, 1, 1, 1,
-0.09159181, -0.8081124, -2.80056, 1, 1, 1, 1, 1,
-0.08617712, -0.02456335, -1.056284, 1, 1, 1, 1, 1,
-0.0854414, -0.8370544, -2.615301, 1, 1, 1, 1, 1,
-0.08448407, 0.188738, -1.263659, 1, 1, 1, 1, 1,
-0.07894296, 0.003982005, -1.251494, 1, 1, 1, 1, 1,
-0.0759382, 0.2013011, -0.2291819, 1, 1, 1, 1, 1,
-0.07383943, -1.954818, -3.278165, 1, 1, 1, 1, 1,
-0.0714561, -0.8802447, -1.821468, 1, 1, 1, 1, 1,
-0.06802379, 0.372371, 0.6099612, 1, 1, 1, 1, 1,
-0.06418173, 0.5506977, -1.103869, 1, 1, 1, 1, 1,
-0.06390549, 1.376233, 0.9088268, 1, 1, 1, 1, 1,
-0.06224078, 1.422207, 1.416627, 1, 1, 1, 1, 1,
-0.06076913, 1.441888, -0.9775158, 1, 1, 1, 1, 1,
-0.05617232, 0.9613032, 1.182265, 0, 0, 1, 1, 1,
-0.05606922, 1.086723, 2.209649, 1, 0, 0, 1, 1,
-0.05371, 0.798997, 0.485946, 1, 0, 0, 1, 1,
-0.05353917, 0.04350739, -1.94807, 1, 0, 0, 1, 1,
-0.05084779, -1.77899, -1.739841, 1, 0, 0, 1, 1,
-0.04789293, -0.7351304, -2.608524, 1, 0, 0, 1, 1,
-0.04599383, 1.107513, -0.1309255, 0, 0, 0, 1, 1,
-0.04508822, -0.8189358, -4.639924, 0, 0, 0, 1, 1,
-0.04312114, -0.2960235, -4.344303, 0, 0, 0, 1, 1,
-0.0425283, -0.3714936, -1.866489, 0, 0, 0, 1, 1,
-0.04027034, -0.7878034, -3.736996, 0, 0, 0, 1, 1,
-0.03954902, 0.009202545, -0.3215036, 0, 0, 0, 1, 1,
-0.03764208, 0.2650512, -1.556863, 0, 0, 0, 1, 1,
-0.0334783, -0.1518757, -2.763213, 1, 1, 1, 1, 1,
-0.03167063, -1.163844, -4.953514, 1, 1, 1, 1, 1,
-0.02978147, -0.09609704, -2.230705, 1, 1, 1, 1, 1,
-0.02832162, 0.1171963, 0.1072346, 1, 1, 1, 1, 1,
-0.02548394, -0.01995779, -2.969883, 1, 1, 1, 1, 1,
-0.02192769, -1.085633, -2.040178, 1, 1, 1, 1, 1,
-0.01930996, -2.258792, -4.067214, 1, 1, 1, 1, 1,
-0.01760467, -1.452896, -2.004039, 1, 1, 1, 1, 1,
-0.01442659, -0.5408556, -2.374969, 1, 1, 1, 1, 1,
-0.01108395, -0.1131956, -4.126628, 1, 1, 1, 1, 1,
-0.01085904, -0.08644089, -4.172528, 1, 1, 1, 1, 1,
-0.009819279, 0.2611563, -0.6438431, 1, 1, 1, 1, 1,
-0.009235588, 0.750238, 0.4423198, 1, 1, 1, 1, 1,
-0.007143659, -0.221377, -4.619177, 1, 1, 1, 1, 1,
-0.006270316, -0.8313296, -3.847189, 1, 1, 1, 1, 1,
-0.00359705, 1.230041, 1.43785, 0, 0, 1, 1, 1,
-0.002051033, -0.1494647, -3.374812, 1, 0, 0, 1, 1,
-0.002026314, -0.3504444, -1.651135, 1, 0, 0, 1, 1,
-0.001445124, 0.8340816, 0.6381195, 1, 0, 0, 1, 1,
0.002127417, 1.279096, 1.64403, 1, 0, 0, 1, 1,
0.006991116, -0.7759311, 1.873427, 1, 0, 0, 1, 1,
0.007764876, 0.4132018, 0.003078812, 0, 0, 0, 1, 1,
0.01376691, 0.3976849, -0.2719941, 0, 0, 0, 1, 1,
0.02067731, 0.9966443, 2.012147, 0, 0, 0, 1, 1,
0.02209649, -1.56017, 3.750662, 0, 0, 0, 1, 1,
0.02442065, 1.185271, 1.06643, 0, 0, 0, 1, 1,
0.02504818, -0.0293752, 3.368349, 0, 0, 0, 1, 1,
0.03205452, -0.4722706, 3.873847, 0, 0, 0, 1, 1,
0.03442525, -0.9345145, 2.653254, 1, 1, 1, 1, 1,
0.03958238, 0.7067767, -1.355842, 1, 1, 1, 1, 1,
0.0401128, -0.07245964, 2.535386, 1, 1, 1, 1, 1,
0.04355255, -1.221494, 4.803009, 1, 1, 1, 1, 1,
0.04533789, -0.06244375, 3.424364, 1, 1, 1, 1, 1,
0.04673561, 2.066849, 0.9245356, 1, 1, 1, 1, 1,
0.04707907, 2.097293, 0.4425715, 1, 1, 1, 1, 1,
0.05494754, -0.1415424, 2.697955, 1, 1, 1, 1, 1,
0.05847538, 1.434412, -0.4534316, 1, 1, 1, 1, 1,
0.0590369, 2.366255, -0.8684632, 1, 1, 1, 1, 1,
0.06124509, -1.975747, 0.7423098, 1, 1, 1, 1, 1,
0.06697641, -0.8243851, 1.725196, 1, 1, 1, 1, 1,
0.07633884, -0.8898278, 3.559473, 1, 1, 1, 1, 1,
0.07670106, 0.02497345, 0.1987812, 1, 1, 1, 1, 1,
0.07674648, -0.5547855, 2.539388, 1, 1, 1, 1, 1,
0.07857015, -1.238321, 2.563858, 0, 0, 1, 1, 1,
0.08048023, -0.2028018, 3.930025, 1, 0, 0, 1, 1,
0.08067932, -1.741834, 2.134367, 1, 0, 0, 1, 1,
0.08110655, 1.077213, 1.320952, 1, 0, 0, 1, 1,
0.08177826, -0.704631, 3.06941, 1, 0, 0, 1, 1,
0.08364946, -0.6500483, 4.551177, 1, 0, 0, 1, 1,
0.08410464, 2.220611, 0.1510611, 0, 0, 0, 1, 1,
0.09005865, 0.9007981, 0.5553879, 0, 0, 0, 1, 1,
0.0902086, 1.516245, 1.361387, 0, 0, 0, 1, 1,
0.09301655, 1.647258, 0.5572437, 0, 0, 0, 1, 1,
0.09361748, 0.4276339, -0.9553366, 0, 0, 0, 1, 1,
0.09656747, -0.3897509, 2.94945, 0, 0, 0, 1, 1,
0.09755744, 0.3135133, 0.8091742, 0, 0, 0, 1, 1,
0.09863766, -0.4733016, -0.03700338, 1, 1, 1, 1, 1,
0.1015152, -1.009604, 4.578022, 1, 1, 1, 1, 1,
0.1043828, -0.3297789, 1.101576, 1, 1, 1, 1, 1,
0.1045342, -0.000274225, 0.4553109, 1, 1, 1, 1, 1,
0.1065772, 0.233022, 1.714235, 1, 1, 1, 1, 1,
0.1101652, 0.2878636, 0.7526307, 1, 1, 1, 1, 1,
0.1105886, -1.323066, 1.289782, 1, 1, 1, 1, 1,
0.1132054, -0.5296859, 3.344338, 1, 1, 1, 1, 1,
0.1135391, 0.3106256, 0.05831768, 1, 1, 1, 1, 1,
0.1140038, 1.350933, -1.310699, 1, 1, 1, 1, 1,
0.114429, -0.2603069, 2.625845, 1, 1, 1, 1, 1,
0.1165812, -0.3145976, 1.949999, 1, 1, 1, 1, 1,
0.1172709, 0.6066915, -0.5721708, 1, 1, 1, 1, 1,
0.1198291, -1.298723, 2.022216, 1, 1, 1, 1, 1,
0.1221422, -1.014999, 3.61731, 1, 1, 1, 1, 1,
0.123051, -0.3395405, 2.149458, 0, 0, 1, 1, 1,
0.1268478, 1.526276, 1.310783, 1, 0, 0, 1, 1,
0.1275408, -0.2909276, 2.636742, 1, 0, 0, 1, 1,
0.1308194, -0.0948625, 0.8869598, 1, 0, 0, 1, 1,
0.1336107, 0.8673154, -1.315305, 1, 0, 0, 1, 1,
0.1353785, 1.53338, 0.8661509, 1, 0, 0, 1, 1,
0.1384916, -0.3779045, 1.529645, 0, 0, 0, 1, 1,
0.1452325, -0.454066, 1.721385, 0, 0, 0, 1, 1,
0.1466142, -1.639841, 3.500517, 0, 0, 0, 1, 1,
0.1470562, -0.2785687, 2.318101, 0, 0, 0, 1, 1,
0.1565364, 0.170594, 0.4312505, 0, 0, 0, 1, 1,
0.160282, 0.8996487, -0.927461, 0, 0, 0, 1, 1,
0.1634949, 0.5376543, 0.05302104, 0, 0, 0, 1, 1,
0.1648619, 2.145476, -0.06573769, 1, 1, 1, 1, 1,
0.1701542, 2.350745, -0.1983554, 1, 1, 1, 1, 1,
0.1723318, 0.06068148, 1.601262, 1, 1, 1, 1, 1,
0.1794612, -0.8725411, 3.300532, 1, 1, 1, 1, 1,
0.1802293, -0.4389796, 1.055197, 1, 1, 1, 1, 1,
0.180669, -0.104834, 0.8472195, 1, 1, 1, 1, 1,
0.1837387, 0.3375805, -2.076303, 1, 1, 1, 1, 1,
0.1847845, -1.264138, 5.373259, 1, 1, 1, 1, 1,
0.1913975, -0.3525845, 2.376055, 1, 1, 1, 1, 1,
0.1982697, -0.3849261, 3.505743, 1, 1, 1, 1, 1,
0.1987167, -0.0219959, 0.1884934, 1, 1, 1, 1, 1,
0.201853, 1.204772, 0.4922581, 1, 1, 1, 1, 1,
0.2019448, 0.005624451, 2.573633, 1, 1, 1, 1, 1,
0.2042036, -0.4613588, 2.858788, 1, 1, 1, 1, 1,
0.2070398, -1.593438, 3.035046, 1, 1, 1, 1, 1,
0.207072, 0.1175116, 0.8099442, 0, 0, 1, 1, 1,
0.2072868, -0.2446171, 2.418065, 1, 0, 0, 1, 1,
0.2074548, 0.2969625, 0.8745204, 1, 0, 0, 1, 1,
0.2124727, -0.7102299, 2.097268, 1, 0, 0, 1, 1,
0.2161527, -0.4261868, 3.316612, 1, 0, 0, 1, 1,
0.2194665, -1.558293, 6.252211, 1, 0, 0, 1, 1,
0.2198299, -1.066913, 2.707359, 0, 0, 0, 1, 1,
0.2205151, -0.05453457, 0.8171783, 0, 0, 0, 1, 1,
0.222172, 1.132344, 0.5280851, 0, 0, 0, 1, 1,
0.2237343, 0.1207841, 0.1034971, 0, 0, 0, 1, 1,
0.226201, 1.579195, -0.2102168, 0, 0, 0, 1, 1,
0.2273003, 0.1937974, -0.4342405, 0, 0, 0, 1, 1,
0.2280781, 0.8714132, 1.964633, 0, 0, 0, 1, 1,
0.2284404, -0.1894243, 1.312497, 1, 1, 1, 1, 1,
0.229069, -0.4683661, 0.3698483, 1, 1, 1, 1, 1,
0.2298126, 0.8670633, 2.14503, 1, 1, 1, 1, 1,
0.230802, -1.952446, 1.379792, 1, 1, 1, 1, 1,
0.2352015, -0.09737129, 3.12295, 1, 1, 1, 1, 1,
0.2371052, 0.747161, -1.218981, 1, 1, 1, 1, 1,
0.2403941, 1.264053, -0.4985765, 1, 1, 1, 1, 1,
0.2408883, -1.188778, 2.559289, 1, 1, 1, 1, 1,
0.2479062, 1.334657, -0.220339, 1, 1, 1, 1, 1,
0.2585381, -0.3462501, 2.203886, 1, 1, 1, 1, 1,
0.2595353, -0.8984159, 2.815871, 1, 1, 1, 1, 1,
0.2602976, 0.3245852, 1.795961, 1, 1, 1, 1, 1,
0.2614133, -0.4901955, 2.93788, 1, 1, 1, 1, 1,
0.2651805, -0.1956306, 1.492233, 1, 1, 1, 1, 1,
0.2690985, 0.06809527, 2.909479, 1, 1, 1, 1, 1,
0.2704022, 2.421484, -0.3180515, 0, 0, 1, 1, 1,
0.2709226, 0.6366144, 0.03109499, 1, 0, 0, 1, 1,
0.2713218, 0.4537418, 2.630721, 1, 0, 0, 1, 1,
0.2767106, -0.4379264, 2.525816, 1, 0, 0, 1, 1,
0.2779187, 0.3038023, 1.439751, 1, 0, 0, 1, 1,
0.2784185, 1.517814, -0.1167481, 1, 0, 0, 1, 1,
0.2830104, -0.7425441, 2.673721, 0, 0, 0, 1, 1,
0.2843809, 0.329239, 0.8878185, 0, 0, 0, 1, 1,
0.2872478, 0.6951128, 0.773006, 0, 0, 0, 1, 1,
0.2886885, 1.365923, 0.06097459, 0, 0, 0, 1, 1,
0.2898659, 0.03126661, 1.324839, 0, 0, 0, 1, 1,
0.2939501, 2.237516, -0.03779276, 0, 0, 0, 1, 1,
0.2949031, 1.171709, -1.48168, 0, 0, 0, 1, 1,
0.3002202, 0.1528614, -0.7054347, 1, 1, 1, 1, 1,
0.3025399, 0.6768485, -1.143853, 1, 1, 1, 1, 1,
0.3054174, 0.5198473, 1.636846, 1, 1, 1, 1, 1,
0.305529, 0.5527694, 1.079741, 1, 1, 1, 1, 1,
0.3099412, 0.01804784, 2.769899, 1, 1, 1, 1, 1,
0.3124657, 0.1996751, 0.9022957, 1, 1, 1, 1, 1,
0.3172664, -2.353734, 2.782351, 1, 1, 1, 1, 1,
0.3186168, 0.1186577, 0.8586078, 1, 1, 1, 1, 1,
0.3187391, -0.2552756, 1.79542, 1, 1, 1, 1, 1,
0.3214435, -3.125738, 3.257982, 1, 1, 1, 1, 1,
0.3241961, -0.5968288, 2.313935, 1, 1, 1, 1, 1,
0.3284062, -0.459709, 2.823379, 1, 1, 1, 1, 1,
0.3287369, 0.7635657, 0.9671428, 1, 1, 1, 1, 1,
0.3295675, -0.5196522, 3.167061, 1, 1, 1, 1, 1,
0.3321139, -0.4190545, 1.270141, 1, 1, 1, 1, 1,
0.3322635, -0.04007622, 1.548387, 0, 0, 1, 1, 1,
0.3334905, -1.119732, 3.923368, 1, 0, 0, 1, 1,
0.3341366, 0.5172981, 3.957646, 1, 0, 0, 1, 1,
0.3347434, 0.9672601, -1.246495, 1, 0, 0, 1, 1,
0.3356391, -0.3355689, 2.671191, 1, 0, 0, 1, 1,
0.3398418, -1.595627, 3.36547, 1, 0, 0, 1, 1,
0.3427366, -0.5011458, 4.921081, 0, 0, 0, 1, 1,
0.3449636, -0.3357258, 2.481102, 0, 0, 0, 1, 1,
0.346905, 1.093666, 1.171134, 0, 0, 0, 1, 1,
0.3475852, 0.293339, 1.053499, 0, 0, 0, 1, 1,
0.3555219, 0.8770151, 2.882563, 0, 0, 0, 1, 1,
0.3600554, 1.069361, -0.4520871, 0, 0, 0, 1, 1,
0.3622717, 0.3274144, -0.9214522, 0, 0, 0, 1, 1,
0.3631662, -1.155393, 2.202367, 1, 1, 1, 1, 1,
0.3659848, -0.4420704, 2.56032, 1, 1, 1, 1, 1,
0.3665988, -0.4568417, 2.111552, 1, 1, 1, 1, 1,
0.3697901, 0.6839254, 0.3521788, 1, 1, 1, 1, 1,
0.3702051, -0.3774479, 1.157203, 1, 1, 1, 1, 1,
0.3732924, 0.8119332, 0.01188689, 1, 1, 1, 1, 1,
0.3745137, -0.3041137, 3.211129, 1, 1, 1, 1, 1,
0.38214, 1.615696, -3.259333, 1, 1, 1, 1, 1,
0.3837954, -0.3501751, 2.037821, 1, 1, 1, 1, 1,
0.3894365, -0.3022448, 4.007837, 1, 1, 1, 1, 1,
0.3910658, 0.5702449, 0.2308712, 1, 1, 1, 1, 1,
0.3936346, -1.575427, 3.553277, 1, 1, 1, 1, 1,
0.3944584, 1.362099, 0.6482704, 1, 1, 1, 1, 1,
0.3964313, 0.7780865, -0.2343088, 1, 1, 1, 1, 1,
0.3975212, 0.1761578, 0.2519088, 1, 1, 1, 1, 1,
0.3978954, 1.008383, 0.1700073, 0, 0, 1, 1, 1,
0.405017, -0.8566523, 2.605214, 1, 0, 0, 1, 1,
0.4057157, 1.22705, 0.3017393, 1, 0, 0, 1, 1,
0.4059327, 2.276593, -1.302453, 1, 0, 0, 1, 1,
0.4075941, -0.1023543, 3.06027, 1, 0, 0, 1, 1,
0.4097982, 0.1446024, 3.344647, 1, 0, 0, 1, 1,
0.4132335, -0.04374192, 1.237252, 0, 0, 0, 1, 1,
0.4132876, 1.278866, -1.042406, 0, 0, 0, 1, 1,
0.4181922, 0.7972357, 1.779676, 0, 0, 0, 1, 1,
0.422166, 1.458888, 1.153215, 0, 0, 0, 1, 1,
0.4261134, 0.4281204, -1.07099, 0, 0, 0, 1, 1,
0.4277962, 0.2506208, 1.876454, 0, 0, 0, 1, 1,
0.4281142, 0.1549402, 1.954834, 0, 0, 0, 1, 1,
0.4415329, 0.6413235, -0.05343482, 1, 1, 1, 1, 1,
0.4448964, -0.3856847, 2.573328, 1, 1, 1, 1, 1,
0.4486326, -0.6036201, 3.620311, 1, 1, 1, 1, 1,
0.4511465, -0.07318059, 2.91825, 1, 1, 1, 1, 1,
0.453548, -0.4874945, 3.622335, 1, 1, 1, 1, 1,
0.4538372, -0.7797047, 2.304206, 1, 1, 1, 1, 1,
0.4561192, -0.6406546, 2.682826, 1, 1, 1, 1, 1,
0.4799687, -0.1758377, 3.192136, 1, 1, 1, 1, 1,
0.4869907, 2.123824, -1.694463, 1, 1, 1, 1, 1,
0.4871202, 1.481321, 0.2870361, 1, 1, 1, 1, 1,
0.4893675, -0.1895168, 0.05111518, 1, 1, 1, 1, 1,
0.4898021, -2.321089, 3.934421, 1, 1, 1, 1, 1,
0.4905957, -0.9420851, 3.311147, 1, 1, 1, 1, 1,
0.4909938, -1.274339, 1.578886, 1, 1, 1, 1, 1,
0.49244, -0.5407749, 2.083832, 1, 1, 1, 1, 1,
0.4924793, 0.4764273, 2.293463, 0, 0, 1, 1, 1,
0.5014912, 0.8257381, -1.57628, 1, 0, 0, 1, 1,
0.5079899, -0.09217865, 2.122818, 1, 0, 0, 1, 1,
0.5121961, -0.267078, 3.976618, 1, 0, 0, 1, 1,
0.5165149, -1.371081, 2.117758, 1, 0, 0, 1, 1,
0.5215419, 2.769092, 2.691417, 1, 0, 0, 1, 1,
0.5229567, 2.152094, -2.7442, 0, 0, 0, 1, 1,
0.5232479, -0.7359667, 3.587898, 0, 0, 0, 1, 1,
0.5239618, -0.4194458, 0.601682, 0, 0, 0, 1, 1,
0.524919, 0.1958581, -0.191944, 0, 0, 0, 1, 1,
0.5273714, -0.3525316, 2.432227, 0, 0, 0, 1, 1,
0.5284535, 0.03061188, 1.732881, 0, 0, 0, 1, 1,
0.5317745, 2.214388, -1.415027, 0, 0, 0, 1, 1,
0.5394942, 1.220337, 0.5304627, 1, 1, 1, 1, 1,
0.5398088, -0.6204259, 3.390411, 1, 1, 1, 1, 1,
0.5432229, 1.636695, 1.202294, 1, 1, 1, 1, 1,
0.5449896, -0.355511, 2.116918, 1, 1, 1, 1, 1,
0.5457394, 0.3596883, 1.347258, 1, 1, 1, 1, 1,
0.5467458, 0.7931852, 1.132381, 1, 1, 1, 1, 1,
0.5561604, -1.961488, 4.291473, 1, 1, 1, 1, 1,
0.5570077, 2.430691, 0.5447212, 1, 1, 1, 1, 1,
0.5576122, 1.273217, -0.7177259, 1, 1, 1, 1, 1,
0.5592588, -1.985906, 1.477587, 1, 1, 1, 1, 1,
0.5608526, 0.7087105, 2.176286, 1, 1, 1, 1, 1,
0.5639696, 0.8701806, 0.8198479, 1, 1, 1, 1, 1,
0.5646913, 0.363319, -0.1802643, 1, 1, 1, 1, 1,
0.5663092, 2.774966, 0.1907132, 1, 1, 1, 1, 1,
0.5675015, -2.590661, 3.110673, 1, 1, 1, 1, 1,
0.5677153, 1.101872, 1.927788, 0, 0, 1, 1, 1,
0.577472, -0.08285592, 2.66102, 1, 0, 0, 1, 1,
0.5779033, 0.2985782, 0.6210145, 1, 0, 0, 1, 1,
0.5854934, -2.162666, 2.012928, 1, 0, 0, 1, 1,
0.5912288, 0.01023656, 1.423054, 1, 0, 0, 1, 1,
0.5915229, 0.5668217, 1.110819, 1, 0, 0, 1, 1,
0.5922774, -1.485128, 2.733246, 0, 0, 0, 1, 1,
0.5951141, 0.7904366, -0.9813752, 0, 0, 0, 1, 1,
0.5978301, 1.749883, 1.867325, 0, 0, 0, 1, 1,
0.6025839, 0.9282831, 0.3317826, 0, 0, 0, 1, 1,
0.6037624, 0.9084101, 0.9972062, 0, 0, 0, 1, 1,
0.6061778, 0.5206656, 1.915108, 0, 0, 0, 1, 1,
0.6063724, -0.694177, 1.365732, 0, 0, 0, 1, 1,
0.6082703, -1.953613, 2.862183, 1, 1, 1, 1, 1,
0.60897, 0.4906566, 2.304487, 1, 1, 1, 1, 1,
0.6102154, 0.2555778, 0.9290424, 1, 1, 1, 1, 1,
0.6130632, 0.1083151, 2.448363, 1, 1, 1, 1, 1,
0.613413, -1.899278, 3.532432, 1, 1, 1, 1, 1,
0.6207135, 0.09611381, 0.3496805, 1, 1, 1, 1, 1,
0.6218392, -0.256605, 1.658791, 1, 1, 1, 1, 1,
0.6235903, 0.2521067, 1.332414, 1, 1, 1, 1, 1,
0.6248214, 0.6041952, 0.9932334, 1, 1, 1, 1, 1,
0.6248423, 1.239959, 0.3494059, 1, 1, 1, 1, 1,
0.6256152, 2.144088, 0.8718613, 1, 1, 1, 1, 1,
0.6275283, -1.849676, 2.463541, 1, 1, 1, 1, 1,
0.6312158, 0.2206367, 1.648365, 1, 1, 1, 1, 1,
0.63399, -0.3174549, 3.154365, 1, 1, 1, 1, 1,
0.6359707, -0.06420689, 2.090801, 1, 1, 1, 1, 1,
0.6361471, -0.03423432, 2.926807, 0, 0, 1, 1, 1,
0.6367569, -0.1839424, 2.572794, 1, 0, 0, 1, 1,
0.6369202, -1.410861, -0.5129371, 1, 0, 0, 1, 1,
0.6372609, 0.03527314, 0.7738912, 1, 0, 0, 1, 1,
0.6411476, -0.5151545, 1.716108, 1, 0, 0, 1, 1,
0.6417068, 1.491892, -0.7911102, 1, 0, 0, 1, 1,
0.6472137, -0.678531, 3.460146, 0, 0, 0, 1, 1,
0.6571524, -0.8082266, 1.308549, 0, 0, 0, 1, 1,
0.6575085, 1.471626, 0.9055958, 0, 0, 0, 1, 1,
0.6589096, 0.6274647, -0.3350215, 0, 0, 0, 1, 1,
0.661671, 0.7757882, 0.4111668, 0, 0, 0, 1, 1,
0.6633201, 0.5076685, 1.849096, 0, 0, 0, 1, 1,
0.6636918, 1.26771, 0.2165064, 0, 0, 0, 1, 1,
0.6694657, -1.036433, 3.603757, 1, 1, 1, 1, 1,
0.6726639, 1.644983, 2.368806, 1, 1, 1, 1, 1,
0.6732242, -1.771583, 1.675977, 1, 1, 1, 1, 1,
0.6736071, 1.255882, 2.369052, 1, 1, 1, 1, 1,
0.6753426, -0.01390191, 1.937182, 1, 1, 1, 1, 1,
0.6781446, 1.059338, 0.520574, 1, 1, 1, 1, 1,
0.6813549, -0.5195063, 1.995078, 1, 1, 1, 1, 1,
0.6878082, -0.8006378, 3.781433, 1, 1, 1, 1, 1,
0.6906536, 1.7891, -0.8911335, 1, 1, 1, 1, 1,
0.6911196, -1.37864, 1.225277, 1, 1, 1, 1, 1,
0.6949846, 0.5749738, 1.218373, 1, 1, 1, 1, 1,
0.6972239, -0.4150973, 2.282313, 1, 1, 1, 1, 1,
0.6977967, 1.408879, 0.8883163, 1, 1, 1, 1, 1,
0.7024327, -0.5856168, 2.778391, 1, 1, 1, 1, 1,
0.7033947, -1.282234, 0.7787481, 1, 1, 1, 1, 1,
0.712657, -0.8581339, 3.137128, 0, 0, 1, 1, 1,
0.7170116, 0.2739854, 1.751637, 1, 0, 0, 1, 1,
0.717643, 0.03631277, 2.738026, 1, 0, 0, 1, 1,
0.7181453, 1.327659, 1.711444, 1, 0, 0, 1, 1,
0.7252183, -1.305319, 2.688262, 1, 0, 0, 1, 1,
0.7259576, -1.050759, 1.591414, 1, 0, 0, 1, 1,
0.72676, -0.1215477, 3.548878, 0, 0, 0, 1, 1,
0.7288181, 1.625701, -0.09994129, 0, 0, 0, 1, 1,
0.7296205, -0.2775786, 2.791184, 0, 0, 0, 1, 1,
0.7343262, -0.7694542, 1.023944, 0, 0, 0, 1, 1,
0.7349736, 0.6334258, 1.834073, 0, 0, 0, 1, 1,
0.7488242, -0.5200311, 3.283455, 0, 0, 0, 1, 1,
0.7529881, 0.07270699, 1.667386, 0, 0, 0, 1, 1,
0.7610134, 0.09588797, 0.9362786, 1, 1, 1, 1, 1,
0.7622666, 0.5431795, -0.7477905, 1, 1, 1, 1, 1,
0.771692, -1.273053, 3.180382, 1, 1, 1, 1, 1,
0.7792895, -0.6445882, 3.192994, 1, 1, 1, 1, 1,
0.7815135, -0.3021516, 1.748475, 1, 1, 1, 1, 1,
0.7818948, 1.299244, 0.6878522, 1, 1, 1, 1, 1,
0.8040355, -0.7179203, 2.837106, 1, 1, 1, 1, 1,
0.8049941, -0.2884342, 1.925194, 1, 1, 1, 1, 1,
0.8105524, 0.7929284, 0.7568204, 1, 1, 1, 1, 1,
0.8110731, 2.451573, -1.210329, 1, 1, 1, 1, 1,
0.8114891, -1.261963, 1.026254, 1, 1, 1, 1, 1,
0.8153886, 0.5945886, 1.722985, 1, 1, 1, 1, 1,
0.8190656, 0.725125, 0.1425188, 1, 1, 1, 1, 1,
0.8216431, -0.9908804, 2.272603, 1, 1, 1, 1, 1,
0.8223734, 0.2646696, -0.5205356, 1, 1, 1, 1, 1,
0.8273339, 0.7340855, 2.283667, 0, 0, 1, 1, 1,
0.8287144, 0.2540266, 0.4780949, 1, 0, 0, 1, 1,
0.8341693, -0.4999479, 4.200446, 1, 0, 0, 1, 1,
0.8360149, -0.2188488, 1.928141, 1, 0, 0, 1, 1,
0.8438792, 0.8310006, -0.7714663, 1, 0, 0, 1, 1,
0.8471104, 0.4007467, 2.063518, 1, 0, 0, 1, 1,
0.8497592, -0.9911803, 3.675579, 0, 0, 0, 1, 1,
0.8558992, 1.765159, -0.1934361, 0, 0, 0, 1, 1,
0.8561673, -0.6725586, 3.141876, 0, 0, 0, 1, 1,
0.8575162, -1.392986, 2.17516, 0, 0, 0, 1, 1,
0.8608152, -0.7497485, 2.051308, 0, 0, 0, 1, 1,
0.8615651, -1.139301, 3.398468, 0, 0, 0, 1, 1,
0.8628148, -0.4358506, 0.650134, 0, 0, 0, 1, 1,
0.8628927, -0.8390344, 2.567976, 1, 1, 1, 1, 1,
0.8646054, 0.6778696, 1.129944, 1, 1, 1, 1, 1,
0.8685616, -0.2146533, 1.287399, 1, 1, 1, 1, 1,
0.8826439, -1.174733, 2.229909, 1, 1, 1, 1, 1,
0.8827578, 0.4264004, 0.8349583, 1, 1, 1, 1, 1,
0.8862707, 0.3733813, 1.747891, 1, 1, 1, 1, 1,
0.8874219, 0.1430783, 1.221534, 1, 1, 1, 1, 1,
0.8897425, -0.1392034, 2.533268, 1, 1, 1, 1, 1,
0.889809, 0.1052842, 1.668905, 1, 1, 1, 1, 1,
0.8970802, -2.352048, 1.827435, 1, 1, 1, 1, 1,
0.9022776, -0.6684856, 2.609435, 1, 1, 1, 1, 1,
0.9090522, 1.545129, 0.7543681, 1, 1, 1, 1, 1,
0.916962, -0.4834737, 3.258896, 1, 1, 1, 1, 1,
0.9170887, 1.078414, 1.508793, 1, 1, 1, 1, 1,
0.9210033, 0.07316657, 0.4011576, 1, 1, 1, 1, 1,
0.9267759, 0.8615153, 1.231848, 0, 0, 1, 1, 1,
0.9299691, -0.3958569, 2.537299, 1, 0, 0, 1, 1,
0.9331393, -2.029032, 3.429205, 1, 0, 0, 1, 1,
0.9397566, -0.0682126, 2.278693, 1, 0, 0, 1, 1,
0.9441874, -0.6921276, 2.473492, 1, 0, 0, 1, 1,
0.95305, 0.8662756, 1.183456, 1, 0, 0, 1, 1,
0.9601144, 1.637846, -0.1689318, 0, 0, 0, 1, 1,
0.9601305, -1.073228, 3.728362, 0, 0, 0, 1, 1,
0.966163, 0.8519459, -1.243684, 0, 0, 0, 1, 1,
0.9719611, -1.192755, 1.429946, 0, 0, 0, 1, 1,
0.9747326, 0.08143319, 1.615844, 0, 0, 0, 1, 1,
0.9896306, 0.9751765, 1.236827, 0, 0, 0, 1, 1,
0.9924567, 0.8878596, -0.0276151, 0, 0, 0, 1, 1,
0.9963881, 1.291945, 3.457144, 1, 1, 1, 1, 1,
1.008756, 0.0356618, 1.159379, 1, 1, 1, 1, 1,
1.010925, -1.270472, 3.485002, 1, 1, 1, 1, 1,
1.012241, -0.3229121, 2.745348, 1, 1, 1, 1, 1,
1.014161, -0.596269, 1.84833, 1, 1, 1, 1, 1,
1.015781, 2.398156, 0.2825261, 1, 1, 1, 1, 1,
1.016918, 0.06948287, 0.19956, 1, 1, 1, 1, 1,
1.020653, -0.7515773, 2.387166, 1, 1, 1, 1, 1,
1.021259, -1.260757, 2.224647, 1, 1, 1, 1, 1,
1.021363, 0.4716985, 0.3373445, 1, 1, 1, 1, 1,
1.021693, -2.256503, 1.732848, 1, 1, 1, 1, 1,
1.022077, -1.172758, 2.631661, 1, 1, 1, 1, 1,
1.033714, -0.4063266, 2.151207, 1, 1, 1, 1, 1,
1.038813, 0.8596522, 0.2149188, 1, 1, 1, 1, 1,
1.040584, -0.4349766, 2.0962, 1, 1, 1, 1, 1,
1.041431, 0.635896, 0.9577726, 0, 0, 1, 1, 1,
1.042725, 0.3464227, 1.074583, 1, 0, 0, 1, 1,
1.043591, -0.2692207, 2.806389, 1, 0, 0, 1, 1,
1.051738, -0.3441151, 0.6114417, 1, 0, 0, 1, 1,
1.06082, 1.548709, 1.256876, 1, 0, 0, 1, 1,
1.063487, -2.149924, 2.590283, 1, 0, 0, 1, 1,
1.06708, -0.2086037, 2.411875, 0, 0, 0, 1, 1,
1.069766, 0.8518945, 1.532182, 0, 0, 0, 1, 1,
1.073366, 0.8827871, 2.034056, 0, 0, 0, 1, 1,
1.075614, 0.1649725, 2.111909, 0, 0, 0, 1, 1,
1.075871, -1.891157, 2.856044, 0, 0, 0, 1, 1,
1.07973, -0.6642962, 1.837657, 0, 0, 0, 1, 1,
1.080925, -1.178174, 2.244048, 0, 0, 0, 1, 1,
1.083631, 0.6657301, 0.250356, 1, 1, 1, 1, 1,
1.084431, 0.7594178, 0.4530388, 1, 1, 1, 1, 1,
1.093075, 0.4276468, 0.135271, 1, 1, 1, 1, 1,
1.095288, 0.6495483, 0.3724677, 1, 1, 1, 1, 1,
1.102559, -0.5194679, 1.868195, 1, 1, 1, 1, 1,
1.108875, -0.4016123, 1.663, 1, 1, 1, 1, 1,
1.112644, 0.857421, 0.2076737, 1, 1, 1, 1, 1,
1.116758, 0.4447997, 1.582094, 1, 1, 1, 1, 1,
1.135737, -1.568793, 2.666663, 1, 1, 1, 1, 1,
1.137528, 0.2973712, 1.648194, 1, 1, 1, 1, 1,
1.14009, -1.814078, 2.353933, 1, 1, 1, 1, 1,
1.148428, -0.7491873, 0.9636109, 1, 1, 1, 1, 1,
1.151129, 0.1177236, 0.4061862, 1, 1, 1, 1, 1,
1.154566, -0.7591016, 1.831536, 1, 1, 1, 1, 1,
1.169166, -0.2670844, 0.7011812, 1, 1, 1, 1, 1,
1.171239, 0.2224704, 2.383748, 0, 0, 1, 1, 1,
1.171962, -0.0312756, 2.104527, 1, 0, 0, 1, 1,
1.179768, -0.7892985, 1.90215, 1, 0, 0, 1, 1,
1.194033, 1.896976, -0.3967996, 1, 0, 0, 1, 1,
1.196204, -2.647618, 4.183848, 1, 0, 0, 1, 1,
1.200831, 0.4937011, 0.8248283, 1, 0, 0, 1, 1,
1.201011, 0.2386754, 1.413716, 0, 0, 0, 1, 1,
1.203176, 1.613342, -1.313066, 0, 0, 0, 1, 1,
1.20348, -0.1275774, 2.515313, 0, 0, 0, 1, 1,
1.207471, 0.745749, 1.149971, 0, 0, 0, 1, 1,
1.207767, -1.816152, 2.74677, 0, 0, 0, 1, 1,
1.228692, 0.04236213, 0.6058286, 0, 0, 0, 1, 1,
1.235793, -0.4374588, 1.021237, 0, 0, 0, 1, 1,
1.246678, 0.5793914, 1.459778, 1, 1, 1, 1, 1,
1.249115, 0.4494433, 0.325708, 1, 1, 1, 1, 1,
1.257062, -0.2408432, 1.010646, 1, 1, 1, 1, 1,
1.261137, 0.2227857, 2.740367, 1, 1, 1, 1, 1,
1.265324, -0.4032746, 3.375669, 1, 1, 1, 1, 1,
1.265785, -0.3965288, 2.080811, 1, 1, 1, 1, 1,
1.275092, 1.116003, 2.076815, 1, 1, 1, 1, 1,
1.275403, -0.4217155, 2.340021, 1, 1, 1, 1, 1,
1.285442, 1.249977, -0.1558705, 1, 1, 1, 1, 1,
1.286734, -0.2511557, 1.240322, 1, 1, 1, 1, 1,
1.291089, -2.671223, 3.130781, 1, 1, 1, 1, 1,
1.293064, -0.3124534, 3.281579, 1, 1, 1, 1, 1,
1.296226, 1.219573, 1.996939, 1, 1, 1, 1, 1,
1.301404, -0.1854435, 1.895891, 1, 1, 1, 1, 1,
1.308064, -0.4166631, 2.826414, 1, 1, 1, 1, 1,
1.313843, -0.201917, 1.381608, 0, 0, 1, 1, 1,
1.314745, 0.5196162, 0.1885999, 1, 0, 0, 1, 1,
1.317551, -0.3903389, -0.1803439, 1, 0, 0, 1, 1,
1.328556, 0.590624, 2.253442, 1, 0, 0, 1, 1,
1.331299, -1.31853, 3.466426, 1, 0, 0, 1, 1,
1.338003, 0.06967394, -0.2306717, 1, 0, 0, 1, 1,
1.358724, -0.7241704, 1.379294, 0, 0, 0, 1, 1,
1.363254, -0.8458072, 2.463404, 0, 0, 0, 1, 1,
1.368738, 0.4473288, 1.693908, 0, 0, 0, 1, 1,
1.37538, -0.4133899, 1.872365, 0, 0, 0, 1, 1,
1.37668, -2.124814, 2.439431, 0, 0, 0, 1, 1,
1.387203, 1.043543, 2.660556, 0, 0, 0, 1, 1,
1.389772, 1.462875, -0.2415673, 0, 0, 0, 1, 1,
1.402469, -0.2896228, 2.189758, 1, 1, 1, 1, 1,
1.408378, 0.7464854, 1.22193, 1, 1, 1, 1, 1,
1.409673, 0.001541606, 1.84561, 1, 1, 1, 1, 1,
1.414037, -0.3943322, 3.241045, 1, 1, 1, 1, 1,
1.418171, 1.968179, -0.8733237, 1, 1, 1, 1, 1,
1.427331, -0.5789288, 2.374767, 1, 1, 1, 1, 1,
1.430952, -1.593649, 4.227198, 1, 1, 1, 1, 1,
1.433493, -0.5721205, 1.809084, 1, 1, 1, 1, 1,
1.435372, 1.304965, 0.4764401, 1, 1, 1, 1, 1,
1.44182, -0.0657884, 0.8599298, 1, 1, 1, 1, 1,
1.447466, -0.3273059, 3.163357, 1, 1, 1, 1, 1,
1.45181, -1.016514, 1.216065, 1, 1, 1, 1, 1,
1.454876, -1.027772, 1.672536, 1, 1, 1, 1, 1,
1.455768, 0.3156042, 1.312951, 1, 1, 1, 1, 1,
1.475862, 0.4773014, 1.364057, 1, 1, 1, 1, 1,
1.499061, -1.12714, 2.759831, 0, 0, 1, 1, 1,
1.501672, -0.5853087, 2.908507, 1, 0, 0, 1, 1,
1.503948, -1.164648, 1.882187, 1, 0, 0, 1, 1,
1.51036, -0.1783907, 1.432721, 1, 0, 0, 1, 1,
1.510701, -1.640829, 2.068622, 1, 0, 0, 1, 1,
1.517757, 1.092443, 0.7079642, 1, 0, 0, 1, 1,
1.522978, -0.2268409, 1.824174, 0, 0, 0, 1, 1,
1.523073, 1.411747, 1.207293, 0, 0, 0, 1, 1,
1.528522, 0.4219311, 0.6443195, 0, 0, 0, 1, 1,
1.540862, -0.4470687, 1.478587, 0, 0, 0, 1, 1,
1.549395, 0.7963155, 1.665639, 0, 0, 0, 1, 1,
1.549801, -0.2076961, 2.463132, 0, 0, 0, 1, 1,
1.550205, -1.117105, 1.199845, 0, 0, 0, 1, 1,
1.573875, -0.490266, 2.538009, 1, 1, 1, 1, 1,
1.582549, -0.004339412, 1.327839, 1, 1, 1, 1, 1,
1.584382, -1.676571, 1.184686, 1, 1, 1, 1, 1,
1.585453, -1.202624, 4.417067, 1, 1, 1, 1, 1,
1.588035, 1.255203, 1.386371, 1, 1, 1, 1, 1,
1.591797, -0.9947876, 1.456047, 1, 1, 1, 1, 1,
1.606018, -0.2723798, 0.8350717, 1, 1, 1, 1, 1,
1.611335, 0.3645395, 3.253453, 1, 1, 1, 1, 1,
1.622129, 0.05515629, 1.458758, 1, 1, 1, 1, 1,
1.639448, 0.5767021, 2.46968, 1, 1, 1, 1, 1,
1.671711, -0.4979901, 2.331338, 1, 1, 1, 1, 1,
1.683796, 1.795866, 1.714429, 1, 1, 1, 1, 1,
1.686291, -0.8214332, 1.708888, 1, 1, 1, 1, 1,
1.69348, -0.3851775, 1.409165, 1, 1, 1, 1, 1,
1.726283, 0.612791, 1.052996, 1, 1, 1, 1, 1,
1.73376, -0.1466679, 2.81249, 0, 0, 1, 1, 1,
1.735239, -0.9218871, 0.5272156, 1, 0, 0, 1, 1,
1.73843, 0.006307718, 2.298003, 1, 0, 0, 1, 1,
1.742065, 1.312286, 1.10023, 1, 0, 0, 1, 1,
1.748746, 0.9142966, -0.2172258, 1, 0, 0, 1, 1,
1.759251, -1.064338, 2.698406, 1, 0, 0, 1, 1,
1.782834, 0.1362235, 1.614301, 0, 0, 0, 1, 1,
1.787551, -1.328642, 3.28421, 0, 0, 0, 1, 1,
1.813848, 0.2782955, 0.8083391, 0, 0, 0, 1, 1,
1.824377, -0.89292, -0.7578467, 0, 0, 0, 1, 1,
1.845741, -0.3604404, 0.03278042, 0, 0, 0, 1, 1,
1.865323, 0.9253776, 1.194631, 0, 0, 0, 1, 1,
1.874303, -0.2938862, 2.462122, 0, 0, 0, 1, 1,
1.877621, -0.6318734, 1.363965, 1, 1, 1, 1, 1,
1.890904, -0.3846746, 1.573181, 1, 1, 1, 1, 1,
1.896313, 1.156273, 1.829738, 1, 1, 1, 1, 1,
1.909227, 0.8720475, 0.7546273, 1, 1, 1, 1, 1,
1.913706, -1.502681, 0.9439716, 1, 1, 1, 1, 1,
1.968562, 0.4219236, 1.93123, 1, 1, 1, 1, 1,
1.972121, -0.7338597, 1.19194, 1, 1, 1, 1, 1,
1.972644, 0.7889748, 2.034679, 1, 1, 1, 1, 1,
1.986057, 0.06444869, 1.291461, 1, 1, 1, 1, 1,
2.007419, -0.6872954, 2.559349, 1, 1, 1, 1, 1,
2.008457, 1.365501, 0.5651585, 1, 1, 1, 1, 1,
2.022367, 0.6365502, 1.090231, 1, 1, 1, 1, 1,
2.058033, 0.610798, 0.6850769, 1, 1, 1, 1, 1,
2.073258, -0.3648278, 1.296459, 1, 1, 1, 1, 1,
2.097055, 1.019813, 2.042334, 1, 1, 1, 1, 1,
2.196176, 0.2362308, 1.594892, 0, 0, 1, 1, 1,
2.203546, -0.9347047, 3.024045, 1, 0, 0, 1, 1,
2.207907, 0.1908643, 2.743558, 1, 0, 0, 1, 1,
2.237342, 0.02087106, 1.768104, 1, 0, 0, 1, 1,
2.247335, 0.3465819, 0.8194643, 1, 0, 0, 1, 1,
2.277479, 0.4655494, 2.465678, 1, 0, 0, 1, 1,
2.284723, 0.6467385, 0.3241707, 0, 0, 0, 1, 1,
2.299571, -0.2050563, 1.928659, 0, 0, 0, 1, 1,
2.301395, -2.786522, 2.448776, 0, 0, 0, 1, 1,
2.344244, 0.1070768, 1.341967, 0, 0, 0, 1, 1,
2.368433, 0.4656073, 2.469091, 0, 0, 0, 1, 1,
2.370374, 0.5106334, 1.661965, 0, 0, 0, 1, 1,
2.531406, 0.9717982, 2.685431, 0, 0, 0, 1, 1,
2.660449, 1.269565, 1.519814, 1, 1, 1, 1, 1,
2.711808, 2.566493, 1.146841, 1, 1, 1, 1, 1,
2.959874, 0.6804529, 1.624561, 1, 1, 1, 1, 1,
3.044153, 1.276727, 1.763052, 1, 1, 1, 1, 1,
3.052774, -1.220152, 2.455165, 1, 1, 1, 1, 1,
3.183289, -0.1878091, -0.01655194, 1, 1, 1, 1, 1,
3.772748, 0.3745579, 0.3901863, 1, 1, 1, 1, 1
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
var radius = 10.31241;
var distance = 36.22191;
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
mvMatrix.translate( -0.006811142, 0.3435761, -0.3721614 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.22191);
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
