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
-3.919063, -0.9589508, -1.99144, 1, 0, 0, 1,
-2.698224, -0.02481679, -2.742171, 1, 0.007843138, 0, 1,
-2.596012, -1.195931, -1.018828, 1, 0.01176471, 0, 1,
-2.490541, 0.662873, -0.1876886, 1, 0.01960784, 0, 1,
-2.410085, 1.058393, -0.5956522, 1, 0.02352941, 0, 1,
-2.402853, 0.02972358, -1.694595, 1, 0.03137255, 0, 1,
-2.359973, -0.5748154, -2.140337, 1, 0.03529412, 0, 1,
-2.343545, 0.9238918, -0.6731758, 1, 0.04313726, 0, 1,
-2.310447, -2.725267, -1.303198, 1, 0.04705882, 0, 1,
-2.28865, 1.142175, -2.282569, 1, 0.05490196, 0, 1,
-2.248147, -0.1968297, -2.741017, 1, 0.05882353, 0, 1,
-2.228831, 1.3156, -1.767255, 1, 0.06666667, 0, 1,
-2.198119, 0.6783942, 0.07249628, 1, 0.07058824, 0, 1,
-2.176728, 2.016998, -1.644729, 1, 0.07843138, 0, 1,
-2.069349, 1.721377, -0.4355423, 1, 0.08235294, 0, 1,
-2.011722, 1.25443, -0.3320717, 1, 0.09019608, 0, 1,
-1.962632, 0.1927397, -2.437254, 1, 0.09411765, 0, 1,
-1.962593, 0.1519245, -2.01509, 1, 0.1019608, 0, 1,
-1.960051, -0.06342936, -2.270027, 1, 0.1098039, 0, 1,
-1.952621, -0.7959253, -0.9601945, 1, 0.1137255, 0, 1,
-1.950735, -0.5555095, -1.694526, 1, 0.1215686, 0, 1,
-1.948204, 0.8796954, -2.085575, 1, 0.1254902, 0, 1,
-1.946513, 2.625925, -1.101908, 1, 0.1333333, 0, 1,
-1.933875, 0.5360433, -1.207762, 1, 0.1372549, 0, 1,
-1.932388, 0.5046858, -0.9410295, 1, 0.145098, 0, 1,
-1.928338, 2.33098, -1.47579, 1, 0.1490196, 0, 1,
-1.926153, 1.503407, -1.011663, 1, 0.1568628, 0, 1,
-1.924337, 0.2535212, -1.258373, 1, 0.1607843, 0, 1,
-1.911599, 0.01568398, -2.026944, 1, 0.1686275, 0, 1,
-1.908669, -0.6381787, -2.339947, 1, 0.172549, 0, 1,
-1.898416, -0.004393143, -0.4216716, 1, 0.1803922, 0, 1,
-1.854123, 1.653212, -0.4404337, 1, 0.1843137, 0, 1,
-1.84454, -0.6806651, -2.819289, 1, 0.1921569, 0, 1,
-1.840854, -1.448199, -0.8464277, 1, 0.1960784, 0, 1,
-1.811571, -0.04864492, -2.434286, 1, 0.2039216, 0, 1,
-1.809278, -1.319658, -2.158378, 1, 0.2117647, 0, 1,
-1.79338, -0.8999968, -2.093015, 1, 0.2156863, 0, 1,
-1.786221, -1.653052, -4.145264, 1, 0.2235294, 0, 1,
-1.78343, 0.5170823, -0.5010138, 1, 0.227451, 0, 1,
-1.781158, 0.1850343, -1.944849, 1, 0.2352941, 0, 1,
-1.770645, 0.04272452, 0.1635599, 1, 0.2392157, 0, 1,
-1.763985, -0.7761912, -1.697851, 1, 0.2470588, 0, 1,
-1.746194, 0.7487404, -1.154435, 1, 0.2509804, 0, 1,
-1.716182, -0.9631847, -3.850099, 1, 0.2588235, 0, 1,
-1.712481, -0.8125766, -1.306605, 1, 0.2627451, 0, 1,
-1.70963, 0.2148955, -2.074836, 1, 0.2705882, 0, 1,
-1.704781, -0.3495496, -0.4082717, 1, 0.2745098, 0, 1,
-1.701627, 2.642735, 1.959507, 1, 0.282353, 0, 1,
-1.695371, -1.160972, -2.543427, 1, 0.2862745, 0, 1,
-1.673281, -0.4246729, -3.120736, 1, 0.2941177, 0, 1,
-1.67106, 0.4669751, -1.550688, 1, 0.3019608, 0, 1,
-1.64598, -1.56466, -1.777277, 1, 0.3058824, 0, 1,
-1.632521, -0.04193896, -2.279152, 1, 0.3137255, 0, 1,
-1.626553, -1.762833, -3.055138, 1, 0.3176471, 0, 1,
-1.618445, 0.1182564, -1.887545, 1, 0.3254902, 0, 1,
-1.613368, -0.7171649, -2.557744, 1, 0.3294118, 0, 1,
-1.609855, -1.172587, -3.04239, 1, 0.3372549, 0, 1,
-1.608041, 0.3617587, -1.156765, 1, 0.3411765, 0, 1,
-1.605515, 0.1562717, -1.851525, 1, 0.3490196, 0, 1,
-1.598415, -0.7501568, -3.398156, 1, 0.3529412, 0, 1,
-1.596628, -0.499545, -0.460788, 1, 0.3607843, 0, 1,
-1.594928, -1.944363, -2.488788, 1, 0.3647059, 0, 1,
-1.594348, -1.334555, -1.345351, 1, 0.372549, 0, 1,
-1.593942, 0.5647725, -1.921387, 1, 0.3764706, 0, 1,
-1.589774, 0.9401432, -0.7138576, 1, 0.3843137, 0, 1,
-1.581569, -1.980173, -2.124907, 1, 0.3882353, 0, 1,
-1.581431, 0.1713241, -2.62745, 1, 0.3960784, 0, 1,
-1.576807, -0.1223397, -0.8947262, 1, 0.4039216, 0, 1,
-1.563133, -0.5814241, -0.8303606, 1, 0.4078431, 0, 1,
-1.561499, 0.8220794, -0.590596, 1, 0.4156863, 0, 1,
-1.534303, 0.837511, 0.3274072, 1, 0.4196078, 0, 1,
-1.507651, 0.4155761, -0.3217886, 1, 0.427451, 0, 1,
-1.498423, -0.8340836, -1.564232, 1, 0.4313726, 0, 1,
-1.497245, -0.46552, -2.19051, 1, 0.4392157, 0, 1,
-1.48584, -1.607443, -2.138473, 1, 0.4431373, 0, 1,
-1.476213, 1.230789, 0.5846674, 1, 0.4509804, 0, 1,
-1.472847, -0.9413421, -1.215816, 1, 0.454902, 0, 1,
-1.467423, 0.2635804, -1.213722, 1, 0.4627451, 0, 1,
-1.459625, 1.329809, -0.9350398, 1, 0.4666667, 0, 1,
-1.459506, -1.560836, -2.613707, 1, 0.4745098, 0, 1,
-1.451423, 0.2681196, -3.714497, 1, 0.4784314, 0, 1,
-1.446985, -1.155763, -1.927829, 1, 0.4862745, 0, 1,
-1.436221, 0.04949698, -1.687313, 1, 0.4901961, 0, 1,
-1.434278, -0.5170353, -1.817388, 1, 0.4980392, 0, 1,
-1.432209, 0.2331004, -1.911312, 1, 0.5058824, 0, 1,
-1.424656, -0.3517633, -1.349418, 1, 0.509804, 0, 1,
-1.419191, 1.299299, -0.9676692, 1, 0.5176471, 0, 1,
-1.394483, -0.9957885, -3.029462, 1, 0.5215687, 0, 1,
-1.391243, -1.134632, -4.097363, 1, 0.5294118, 0, 1,
-1.387829, 1.326059, -2.817102, 1, 0.5333334, 0, 1,
-1.384921, 1.020517, -2.0141, 1, 0.5411765, 0, 1,
-1.380637, 0.2339809, -1.253194, 1, 0.5450981, 0, 1,
-1.379135, 1.808682, -0.220867, 1, 0.5529412, 0, 1,
-1.36894, 0.6684876, -1.221622, 1, 0.5568628, 0, 1,
-1.354279, -1.474139, -1.237759, 1, 0.5647059, 0, 1,
-1.348147, -0.06215623, -0.7294583, 1, 0.5686275, 0, 1,
-1.3462, 0.1344209, -1.04353, 1, 0.5764706, 0, 1,
-1.339434, 1.348938, -2.637803, 1, 0.5803922, 0, 1,
-1.333946, 1.053453, -0.9268327, 1, 0.5882353, 0, 1,
-1.315122, 1.586365, -1.793391, 1, 0.5921569, 0, 1,
-1.314547, 2.00802, -0.1729927, 1, 0.6, 0, 1,
-1.312093, -0.7900999, -2.605804, 1, 0.6078432, 0, 1,
-1.310649, 0.7423922, -2.251714, 1, 0.6117647, 0, 1,
-1.308892, 0.6815038, -1.330577, 1, 0.6196079, 0, 1,
-1.301436, 0.5366767, -1.042465, 1, 0.6235294, 0, 1,
-1.299772, 0.2317165, -3.492176, 1, 0.6313726, 0, 1,
-1.299028, -1.015175, -0.4334446, 1, 0.6352941, 0, 1,
-1.29839, -0.0004886484, -1.734862, 1, 0.6431373, 0, 1,
-1.294886, 0.5088744, -2.085075, 1, 0.6470588, 0, 1,
-1.292679, 0.6530481, -1.933617, 1, 0.654902, 0, 1,
-1.292386, 0.9910631, -0.4054797, 1, 0.6588235, 0, 1,
-1.290146, -0.8595407, -2.646179, 1, 0.6666667, 0, 1,
-1.288645, 2.137121, -0.7863387, 1, 0.6705883, 0, 1,
-1.284351, 0.6028655, -1.295286, 1, 0.6784314, 0, 1,
-1.281461, 0.9161478, -0.3125267, 1, 0.682353, 0, 1,
-1.278708, -0.5878264, -3.919144, 1, 0.6901961, 0, 1,
-1.257786, 0.7673149, -1.604193, 1, 0.6941177, 0, 1,
-1.253919, -0.8016129, -1.310554, 1, 0.7019608, 0, 1,
-1.247532, 1.501599, -0.896138, 1, 0.7098039, 0, 1,
-1.235643, -0.8537631, -0.1601691, 1, 0.7137255, 0, 1,
-1.230659, 0.1553386, -1.166489, 1, 0.7215686, 0, 1,
-1.227883, -0.6773391, -1.159404, 1, 0.7254902, 0, 1,
-1.220224, 0.3558845, -1.371678, 1, 0.7333333, 0, 1,
-1.206977, 0.6358956, -1.244734, 1, 0.7372549, 0, 1,
-1.204287, -0.01689158, -1.657452, 1, 0.7450981, 0, 1,
-1.186496, 1.193377, -1.082044, 1, 0.7490196, 0, 1,
-1.184144, -0.7865325, -1.782334, 1, 0.7568628, 0, 1,
-1.179704, -0.07050995, -1.176853, 1, 0.7607843, 0, 1,
-1.168165, 0.5190876, -0.08277213, 1, 0.7686275, 0, 1,
-1.162672, -0.4047244, -3.174858, 1, 0.772549, 0, 1,
-1.161548, -0.3267715, -2.286333, 1, 0.7803922, 0, 1,
-1.161501, 0.3443752, -1.029709, 1, 0.7843137, 0, 1,
-1.141575, 0.8039393, -0.03017417, 1, 0.7921569, 0, 1,
-1.133703, -0.4781435, 0.4599882, 1, 0.7960784, 0, 1,
-1.130091, -0.08229264, -3.00345, 1, 0.8039216, 0, 1,
-1.129506, 0.2627806, -2.543062, 1, 0.8117647, 0, 1,
-1.128116, 0.5674236, -1.050234, 1, 0.8156863, 0, 1,
-1.125842, 0.1532609, -1.723225, 1, 0.8235294, 0, 1,
-1.121409, 0.7596303, -1.794662, 1, 0.827451, 0, 1,
-1.114424, 0.2636277, -0.6946455, 1, 0.8352941, 0, 1,
-1.114255, -2.151181, -2.694926, 1, 0.8392157, 0, 1,
-1.11181, 1.728513, -2.517579, 1, 0.8470588, 0, 1,
-1.110312, -1.232789, -2.477901, 1, 0.8509804, 0, 1,
-1.108549, -1.275101, -1.72638, 1, 0.8588235, 0, 1,
-1.106716, 0.0864181, -0.1521927, 1, 0.8627451, 0, 1,
-1.103874, -0.596642, -1.890615, 1, 0.8705882, 0, 1,
-1.099575, 1.855992, -0.5484413, 1, 0.8745098, 0, 1,
-1.096536, -0.1822365, -2.427413, 1, 0.8823529, 0, 1,
-1.076322, -1.264647, -1.864682, 1, 0.8862745, 0, 1,
-1.072266, -2.586667, -1.99838, 1, 0.8941177, 0, 1,
-1.066611, -0.3865764, -2.83581, 1, 0.8980392, 0, 1,
-1.063471, -2.098322, -2.018261, 1, 0.9058824, 0, 1,
-1.05739, 1.416562, -0.6927032, 1, 0.9137255, 0, 1,
-1.05674, -0.8452869, -3.421203, 1, 0.9176471, 0, 1,
-1.054838, 1.479439, -1.161234, 1, 0.9254902, 0, 1,
-1.051116, -0.39138, -1.387934, 1, 0.9294118, 0, 1,
-1.047338, 0.9810434, 0.2036487, 1, 0.9372549, 0, 1,
-1.044224, 1.500978, -2.292398, 1, 0.9411765, 0, 1,
-1.043497, 0.4430404, 1.09312, 1, 0.9490196, 0, 1,
-1.039366, -0.4984323, -2.957691, 1, 0.9529412, 0, 1,
-1.03625, 0.9303548, -1.880233, 1, 0.9607843, 0, 1,
-1.031413, 0.1072213, -1.371474, 1, 0.9647059, 0, 1,
-1.022723, 0.09545913, -1.854295, 1, 0.972549, 0, 1,
-1.021004, 1.12331, -1.129354, 1, 0.9764706, 0, 1,
-1.019576, 0.589681, -1.493608, 1, 0.9843137, 0, 1,
-1.016761, 0.357922, -1.60903, 1, 0.9882353, 0, 1,
-1.016726, 0.8482999, 0.06961937, 1, 0.9960784, 0, 1,
-1.013661, -1.336829, -3.184569, 0.9960784, 1, 0, 1,
-1.007972, 1.181923, 0.2504408, 0.9921569, 1, 0, 1,
-1.002782, -1.033898, -5.12845, 0.9843137, 1, 0, 1,
-1.002548, 0.3056753, 1.242817, 0.9803922, 1, 0, 1,
-1.001851, -0.3803218, -3.410334, 0.972549, 1, 0, 1,
-0.9987112, 1.8352, -0.246728, 0.9686275, 1, 0, 1,
-0.9948867, 0.8569946, -1.908493, 0.9607843, 1, 0, 1,
-0.991838, -0.5416999, -3.284184, 0.9568627, 1, 0, 1,
-0.9898742, -2.026864, -3.630162, 0.9490196, 1, 0, 1,
-0.9866824, -0.2039107, -0.4670067, 0.945098, 1, 0, 1,
-0.9752737, -1.311384, -1.415241, 0.9372549, 1, 0, 1,
-0.9712395, 1.983502, -0.8910537, 0.9333333, 1, 0, 1,
-0.9667715, 1.176251, -0.6202578, 0.9254902, 1, 0, 1,
-0.9648993, -1.85098, -4.203022, 0.9215686, 1, 0, 1,
-0.9632963, -0.805087, -1.696427, 0.9137255, 1, 0, 1,
-0.9625937, 0.8415588, -1.399294, 0.9098039, 1, 0, 1,
-0.9499842, -0.05943026, -0.006760979, 0.9019608, 1, 0, 1,
-0.949711, -0.746963, -1.315426, 0.8941177, 1, 0, 1,
-0.9458541, 0.4174447, 0.3854024, 0.8901961, 1, 0, 1,
-0.9453226, 0.894172, -0.6969855, 0.8823529, 1, 0, 1,
-0.9419506, 0.6859571, -0.8182696, 0.8784314, 1, 0, 1,
-0.9409564, 0.6976337, -1.558035, 0.8705882, 1, 0, 1,
-0.9368826, 0.1873023, -2.553763, 0.8666667, 1, 0, 1,
-0.9359483, 0.4225664, -0.9228858, 0.8588235, 1, 0, 1,
-0.9350848, -0.3426427, -1.85704, 0.854902, 1, 0, 1,
-0.9343054, 0.2540526, 0.1217128, 0.8470588, 1, 0, 1,
-0.9299057, -0.7686159, -0.87622, 0.8431373, 1, 0, 1,
-0.9247518, -0.6793009, -1.029775, 0.8352941, 1, 0, 1,
-0.9202108, -1.503458, -3.451759, 0.8313726, 1, 0, 1,
-0.9124928, -0.1732569, -0.3977365, 0.8235294, 1, 0, 1,
-0.9067308, 1.070199, 0.1705579, 0.8196079, 1, 0, 1,
-0.903941, -0.1420616, -0.4599658, 0.8117647, 1, 0, 1,
-0.9025552, 0.2460376, 0.586394, 0.8078431, 1, 0, 1,
-0.8945947, -0.6163665, -3.693989, 0.8, 1, 0, 1,
-0.8903694, 0.3937672, -1.439996, 0.7921569, 1, 0, 1,
-0.8901347, 0.2684605, -0.7026001, 0.7882353, 1, 0, 1,
-0.8849393, -0.3588603, -1.785178, 0.7803922, 1, 0, 1,
-0.881887, -0.4682393, -1.111971, 0.7764706, 1, 0, 1,
-0.8772914, 0.4436246, -0.5663928, 0.7686275, 1, 0, 1,
-0.8714128, -0.1939913, -0.4073196, 0.7647059, 1, 0, 1,
-0.8712657, -2.287726, -1.847937, 0.7568628, 1, 0, 1,
-0.8675203, 1.174433, -0.7439553, 0.7529412, 1, 0, 1,
-0.8659654, 1.666166, -0.9374449, 0.7450981, 1, 0, 1,
-0.8658295, -0.4899981, -0.7096029, 0.7411765, 1, 0, 1,
-0.8634434, -1.311586, -2.549447, 0.7333333, 1, 0, 1,
-0.8618744, -0.6985606, -2.365902, 0.7294118, 1, 0, 1,
-0.8573425, -0.4120977, -1.59669, 0.7215686, 1, 0, 1,
-0.8533193, -0.3477536, -1.8397, 0.7176471, 1, 0, 1,
-0.8521367, -0.7434832, -1.012189, 0.7098039, 1, 0, 1,
-0.8468764, 0.3263938, -1.990266, 0.7058824, 1, 0, 1,
-0.8468402, -0.1127948, 0.4968427, 0.6980392, 1, 0, 1,
-0.8467558, 1.221234, -0.8695895, 0.6901961, 1, 0, 1,
-0.8453049, 1.52581, -2.20502, 0.6862745, 1, 0, 1,
-0.8376505, 0.2953783, -0.5453787, 0.6784314, 1, 0, 1,
-0.8373301, -0.1944611, -0.3532924, 0.6745098, 1, 0, 1,
-0.83081, -0.4348928, -3.809271, 0.6666667, 1, 0, 1,
-0.8272915, -0.3282253, -1.638741, 0.6627451, 1, 0, 1,
-0.8184919, 1.561363, -0.540225, 0.654902, 1, 0, 1,
-0.8175313, -0.01116776, -2.637238, 0.6509804, 1, 0, 1,
-0.8164105, -1.100741, -1.480443, 0.6431373, 1, 0, 1,
-0.8058843, 0.2938571, 1.296484, 0.6392157, 1, 0, 1,
-0.8048409, 0.03143116, -2.331661, 0.6313726, 1, 0, 1,
-0.8001458, 1.242817, -2.322953, 0.627451, 1, 0, 1,
-0.7969945, -0.5000307, -2.397531, 0.6196079, 1, 0, 1,
-0.7968302, -0.05470356, -2.768095, 0.6156863, 1, 0, 1,
-0.7960145, 0.5338609, -0.9964949, 0.6078432, 1, 0, 1,
-0.7948163, -0.2141893, -1.673325, 0.6039216, 1, 0, 1,
-0.7946787, 0.733859, -1.544503, 0.5960785, 1, 0, 1,
-0.7941101, 1.641801, -0.8237241, 0.5882353, 1, 0, 1,
-0.7925789, 0.9950919, -0.9372702, 0.5843138, 1, 0, 1,
-0.7914017, -2.290025, -3.444507, 0.5764706, 1, 0, 1,
-0.790795, 1.263875, -0.8796012, 0.572549, 1, 0, 1,
-0.7876573, -0.4019141, -2.537375, 0.5647059, 1, 0, 1,
-0.7863271, -0.3008157, -2.536907, 0.5607843, 1, 0, 1,
-0.7853028, 1.831515, -1.190007, 0.5529412, 1, 0, 1,
-0.7800699, -0.6041421, -3.347535, 0.5490196, 1, 0, 1,
-0.7733891, -1.976006, -3.036832, 0.5411765, 1, 0, 1,
-0.772432, 1.294694, -1.569339, 0.5372549, 1, 0, 1,
-0.7694637, -1.221424, -3.116578, 0.5294118, 1, 0, 1,
-0.7690055, -0.2393327, -1.472801, 0.5254902, 1, 0, 1,
-0.7650652, 0.8106123, 0.3979627, 0.5176471, 1, 0, 1,
-0.7631983, -1.105552, -1.843261, 0.5137255, 1, 0, 1,
-0.7557232, -0.3917431, -0.6923086, 0.5058824, 1, 0, 1,
-0.7459558, -0.1884574, -1.961869, 0.5019608, 1, 0, 1,
-0.7404113, -1.785172, -2.108777, 0.4941176, 1, 0, 1,
-0.7389698, -1.375223, -3.725506, 0.4862745, 1, 0, 1,
-0.7360126, 0.9181315, -0.1492785, 0.4823529, 1, 0, 1,
-0.7350193, -1.215422, -2.252985, 0.4745098, 1, 0, 1,
-0.7220408, -0.808116, -1.342874, 0.4705882, 1, 0, 1,
-0.7136585, -0.1079523, -1.900286, 0.4627451, 1, 0, 1,
-0.713352, 0.6874201, -1.758565, 0.4588235, 1, 0, 1,
-0.71324, -1.246456, -2.487656, 0.4509804, 1, 0, 1,
-0.7124181, -0.1282176, -2.297495, 0.4470588, 1, 0, 1,
-0.7105217, 0.3668292, -0.1857339, 0.4392157, 1, 0, 1,
-0.7071578, -0.4877986, -1.972097, 0.4352941, 1, 0, 1,
-0.7028401, -0.2422713, -2.524749, 0.427451, 1, 0, 1,
-0.6961038, -1.554301, -0.7414931, 0.4235294, 1, 0, 1,
-0.6955453, 0.9388998, -0.7356518, 0.4156863, 1, 0, 1,
-0.6919147, 0.02506461, -1.619943, 0.4117647, 1, 0, 1,
-0.6915795, 1.304816, -1.210641, 0.4039216, 1, 0, 1,
-0.6886269, -0.2902108, -0.9439555, 0.3960784, 1, 0, 1,
-0.6845134, 0.1605264, -2.752121, 0.3921569, 1, 0, 1,
-0.6807663, -0.0962996, 0.1977093, 0.3843137, 1, 0, 1,
-0.6786308, -1.527933, -3.837881, 0.3803922, 1, 0, 1,
-0.6668262, 0.87019, -0.9541068, 0.372549, 1, 0, 1,
-0.6667926, 0.1061371, -1.026699, 0.3686275, 1, 0, 1,
-0.6642856, -0.9196712, -2.163121, 0.3607843, 1, 0, 1,
-0.663634, 0.3063402, -2.032715, 0.3568628, 1, 0, 1,
-0.6595666, -2.104316, -4.544902, 0.3490196, 1, 0, 1,
-0.656846, 0.8854743, 0.7188943, 0.345098, 1, 0, 1,
-0.6550637, -0.3307994, -0.6596835, 0.3372549, 1, 0, 1,
-0.6548862, -2.755123, -2.05147, 0.3333333, 1, 0, 1,
-0.6548001, -1.49042, -2.020934, 0.3254902, 1, 0, 1,
-0.6526708, -0.5574213, -0.4119499, 0.3215686, 1, 0, 1,
-0.6489502, -1.287369, -2.456042, 0.3137255, 1, 0, 1,
-0.6434516, -0.3523995, -2.382749, 0.3098039, 1, 0, 1,
-0.6410935, -1.267485, -4.241428, 0.3019608, 1, 0, 1,
-0.6363536, 1.666541, -0.04508565, 0.2941177, 1, 0, 1,
-0.6304837, -1.515397, -2.598118, 0.2901961, 1, 0, 1,
-0.628284, -0.888552, -2.913023, 0.282353, 1, 0, 1,
-0.6247513, 0.8939199, -0.005431003, 0.2784314, 1, 0, 1,
-0.6237771, 0.5136644, -0.9510073, 0.2705882, 1, 0, 1,
-0.6226932, 0.07760513, -1.696118, 0.2666667, 1, 0, 1,
-0.621003, 1.440968, -1.094025, 0.2588235, 1, 0, 1,
-0.620058, -0.7868336, -2.946002, 0.254902, 1, 0, 1,
-0.6162086, -0.9269318, -2.846797, 0.2470588, 1, 0, 1,
-0.6142083, -2.12107, -4.418104, 0.2431373, 1, 0, 1,
-0.6131086, -1.101224, -2.631145, 0.2352941, 1, 0, 1,
-0.6113588, 0.5813296, -1.004048, 0.2313726, 1, 0, 1,
-0.6085504, 0.4837793, -1.519476, 0.2235294, 1, 0, 1,
-0.6046526, 1.407995, -0.6549484, 0.2196078, 1, 0, 1,
-0.6031008, 1.064827, 1.5619, 0.2117647, 1, 0, 1,
-0.5999275, 1.060617, -1.237263, 0.2078431, 1, 0, 1,
-0.5963125, 0.1820742, -0.04402845, 0.2, 1, 0, 1,
-0.58833, -1.008211, -2.863787, 0.1921569, 1, 0, 1,
-0.5867836, -1.451726, -2.829839, 0.1882353, 1, 0, 1,
-0.5865116, -1.772205, -1.791907, 0.1803922, 1, 0, 1,
-0.5859533, 1.882214, -0.92256, 0.1764706, 1, 0, 1,
-0.5837421, 0.6849316, -0.7769861, 0.1686275, 1, 0, 1,
-0.5814293, -1.716367, -3.049579, 0.1647059, 1, 0, 1,
-0.5756576, -0.7815586, -2.432006, 0.1568628, 1, 0, 1,
-0.5705697, -0.8877037, -1.085499, 0.1529412, 1, 0, 1,
-0.5652354, 0.03892306, -2.541425, 0.145098, 1, 0, 1,
-0.5625367, 0.4947374, -1.293491, 0.1411765, 1, 0, 1,
-0.5624709, -1.118048, -2.280588, 0.1333333, 1, 0, 1,
-0.55673, 0.9767683, -1.461682, 0.1294118, 1, 0, 1,
-0.5548019, -0.7681992, -3.540085, 0.1215686, 1, 0, 1,
-0.5535452, -0.4572769, -2.470227, 0.1176471, 1, 0, 1,
-0.5528734, 0.5349705, -1.060063, 0.1098039, 1, 0, 1,
-0.5523392, -0.222181, -1.18865, 0.1058824, 1, 0, 1,
-0.5478756, 0.8502704, 0.9395658, 0.09803922, 1, 0, 1,
-0.5457187, -0.08366571, -3.016586, 0.09019608, 1, 0, 1,
-0.5435756, 0.688563, 0.0418692, 0.08627451, 1, 0, 1,
-0.5421731, -1.583024, -2.171598, 0.07843138, 1, 0, 1,
-0.5416251, 0.21527, -3.090252, 0.07450981, 1, 0, 1,
-0.5319035, -1.940064, -2.263126, 0.06666667, 1, 0, 1,
-0.5318733, -0.1033603, -2.880694, 0.0627451, 1, 0, 1,
-0.5285642, 1.843319, -0.5047201, 0.05490196, 1, 0, 1,
-0.5232595, 0.6823432, -0.3211793, 0.05098039, 1, 0, 1,
-0.5211109, -0.5225265, -4.44037, 0.04313726, 1, 0, 1,
-0.5187918, 0.1698748, 0.2601934, 0.03921569, 1, 0, 1,
-0.5143685, 1.41781, 0.5432169, 0.03137255, 1, 0, 1,
-0.5125308, 0.4132613, -0.9724955, 0.02745098, 1, 0, 1,
-0.5110122, -0.5300384, -2.89556, 0.01960784, 1, 0, 1,
-0.5100674, -1.007667, -2.149395, 0.01568628, 1, 0, 1,
-0.509309, -0.2565639, -1.684167, 0.007843138, 1, 0, 1,
-0.5092333, 1.233642, -0.9533924, 0.003921569, 1, 0, 1,
-0.5082908, -0.6079028, -3.774932, 0, 1, 0.003921569, 1,
-0.4949151, -0.9449495, -3.312058, 0, 1, 0.01176471, 1,
-0.4863971, -1.731689, -1.692463, 0, 1, 0.01568628, 1,
-0.4853104, -0.8190746, -2.36881, 0, 1, 0.02352941, 1,
-0.4820816, 0.2599215, -0.8198312, 0, 1, 0.02745098, 1,
-0.4808577, -0.987738, -2.84384, 0, 1, 0.03529412, 1,
-0.4793753, 0.5219175, -1.238567, 0, 1, 0.03921569, 1,
-0.4736916, 1.497879, -1.511701, 0, 1, 0.04705882, 1,
-0.47339, -0.2267106, -2.044304, 0, 1, 0.05098039, 1,
-0.4642424, 0.9248052, 0.8908758, 0, 1, 0.05882353, 1,
-0.4632531, -0.505843, -1.542334, 0, 1, 0.0627451, 1,
-0.4549939, -0.5078886, -2.030982, 0, 1, 0.07058824, 1,
-0.4489706, 2.18068, -1.481348, 0, 1, 0.07450981, 1,
-0.4459502, -2.138966, -1.800964, 0, 1, 0.08235294, 1,
-0.4417475, 0.3016862, -0.5318335, 0, 1, 0.08627451, 1,
-0.4406664, 1.021669, -1.034346, 0, 1, 0.09411765, 1,
-0.4397057, 0.1789975, -2.693933, 0, 1, 0.1019608, 1,
-0.4312927, 1.933756, -0.1265833, 0, 1, 0.1058824, 1,
-0.4279869, -0.8514791, -3.709561, 0, 1, 0.1137255, 1,
-0.4191379, -0.2375548, -2.083526, 0, 1, 0.1176471, 1,
-0.4174578, 0.870418, 0.2077956, 0, 1, 0.1254902, 1,
-0.4128422, 0.5484267, -0.2421481, 0, 1, 0.1294118, 1,
-0.4117997, -0.7490295, -3.559158, 0, 1, 0.1372549, 1,
-0.4077773, 0.9273845, -1.018881, 0, 1, 0.1411765, 1,
-0.402223, -0.7726694, -3.388162, 0, 1, 0.1490196, 1,
-0.3977237, -1.296007, -4.029453, 0, 1, 0.1529412, 1,
-0.3911281, -0.2751694, -0.6851279, 0, 1, 0.1607843, 1,
-0.3851457, -1.516719, -3.539315, 0, 1, 0.1647059, 1,
-0.382165, 0.2218464, 0.4141037, 0, 1, 0.172549, 1,
-0.3807653, 0.2838611, -0.4285019, 0, 1, 0.1764706, 1,
-0.3785875, 0.2668956, -0.2765984, 0, 1, 0.1843137, 1,
-0.3686512, -1.134173, -2.992074, 0, 1, 0.1882353, 1,
-0.3626669, -0.1125367, -3.052848, 0, 1, 0.1960784, 1,
-0.3600041, 0.1327188, -1.198734, 0, 1, 0.2039216, 1,
-0.3564672, 1.963709, -0.3122038, 0, 1, 0.2078431, 1,
-0.3527732, 1.141052, -0.7377521, 0, 1, 0.2156863, 1,
-0.3499117, -1.118485, -2.202233, 0, 1, 0.2196078, 1,
-0.3487235, -0.2487767, -2.362127, 0, 1, 0.227451, 1,
-0.3482875, 1.706929, 1.631922, 0, 1, 0.2313726, 1,
-0.3458034, 1.612811, -0.6314485, 0, 1, 0.2392157, 1,
-0.3413786, 0.5179608, 0.5156113, 0, 1, 0.2431373, 1,
-0.3401383, 0.1749494, -2.162631, 0, 1, 0.2509804, 1,
-0.3401138, -1.038129, -2.260835, 0, 1, 0.254902, 1,
-0.3367142, 1.048276, -0.1489125, 0, 1, 0.2627451, 1,
-0.3347916, 1.475727, 0.6514075, 0, 1, 0.2666667, 1,
-0.3330198, 0.9865567, -0.9546481, 0, 1, 0.2745098, 1,
-0.3301553, -1.17136, -2.682875, 0, 1, 0.2784314, 1,
-0.3296891, 1.209578, -1.735652, 0, 1, 0.2862745, 1,
-0.3261358, -1.391556, -3.670447, 0, 1, 0.2901961, 1,
-0.3260792, 0.9306848, 1.270735, 0, 1, 0.2980392, 1,
-0.3209058, -0.7422361, -2.712903, 0, 1, 0.3058824, 1,
-0.3184509, 0.2484088, -1.228206, 0, 1, 0.3098039, 1,
-0.3133552, 0.1307299, -1.028082, 0, 1, 0.3176471, 1,
-0.3126709, 0.8477855, 1.608887, 0, 1, 0.3215686, 1,
-0.3099015, -0.7766394, -1.103016, 0, 1, 0.3294118, 1,
-0.3084125, -1.917252, -2.88182, 0, 1, 0.3333333, 1,
-0.3082978, -0.4253493, -2.789797, 0, 1, 0.3411765, 1,
-0.3082942, -0.4908649, -1.268474, 0, 1, 0.345098, 1,
-0.306183, -0.5515803, -1.260735, 0, 1, 0.3529412, 1,
-0.3060204, 1.496428, 0.576691, 0, 1, 0.3568628, 1,
-0.3043956, -0.3006765, -1.609331, 0, 1, 0.3647059, 1,
-0.3025283, 1.282698, -0.3219655, 0, 1, 0.3686275, 1,
-0.3013119, -1.072863, -2.956795, 0, 1, 0.3764706, 1,
-0.299091, -0.9522128, -1.658542, 0, 1, 0.3803922, 1,
-0.2963662, 0.2797027, -0.7885811, 0, 1, 0.3882353, 1,
-0.282337, -1.782631, -2.436278, 0, 1, 0.3921569, 1,
-0.2779328, 1.513613, -0.9962947, 0, 1, 0.4, 1,
-0.2775792, -1.381399, -2.428923, 0, 1, 0.4078431, 1,
-0.2750306, 0.1759001, -2.442291, 0, 1, 0.4117647, 1,
-0.2704836, 0.7290347, 0.6279564, 0, 1, 0.4196078, 1,
-0.2636288, 0.3897127, -1.582767, 0, 1, 0.4235294, 1,
-0.2631828, -1.303923, -4.17117, 0, 1, 0.4313726, 1,
-0.2596825, -1.114227, -1.495344, 0, 1, 0.4352941, 1,
-0.2591546, 2.425503, 0.8298732, 0, 1, 0.4431373, 1,
-0.2567019, 1.416318, 1.77767, 0, 1, 0.4470588, 1,
-0.2561069, -0.3024027, -3.084971, 0, 1, 0.454902, 1,
-0.2502707, 0.3955343, 0.0825412, 0, 1, 0.4588235, 1,
-0.2490394, -0.03118704, -0.6309806, 0, 1, 0.4666667, 1,
-0.2469415, 0.3988716, -0.3524868, 0, 1, 0.4705882, 1,
-0.2450449, -1.214359, -4.158422, 0, 1, 0.4784314, 1,
-0.240733, -1.415324, -3.409217, 0, 1, 0.4823529, 1,
-0.2394672, 0.2789192, -0.5349401, 0, 1, 0.4901961, 1,
-0.2393382, 0.381708, 0.1017388, 0, 1, 0.4941176, 1,
-0.2369731, 0.415589, 1.170331, 0, 1, 0.5019608, 1,
-0.233268, 1.330576, 1.023451, 0, 1, 0.509804, 1,
-0.2331912, -1.289726, -2.872103, 0, 1, 0.5137255, 1,
-0.2240198, 0.8043433, -1.765344, 0, 1, 0.5215687, 1,
-0.2235013, 1.341245, -0.1046317, 0, 1, 0.5254902, 1,
-0.2198041, -0.698514, -2.679133, 0, 1, 0.5333334, 1,
-0.2153931, 1.284935, -2.105027, 0, 1, 0.5372549, 1,
-0.2150366, -0.5167336, -1.917843, 0, 1, 0.5450981, 1,
-0.2120416, 0.6475123, -1.603067, 0, 1, 0.5490196, 1,
-0.20786, 1.601041, -1.305066, 0, 1, 0.5568628, 1,
-0.2009938, -0.04310403, -3.293211, 0, 1, 0.5607843, 1,
-0.1986172, 2.003809, -1.177353, 0, 1, 0.5686275, 1,
-0.1976007, -0.07504833, -2.208756, 0, 1, 0.572549, 1,
-0.1970865, 1.783532, -0.1720248, 0, 1, 0.5803922, 1,
-0.1904131, -0.6059577, -3.076567, 0, 1, 0.5843138, 1,
-0.1821792, 0.6578058, -0.6771464, 0, 1, 0.5921569, 1,
-0.1819738, -0.7322162, -3.130627, 0, 1, 0.5960785, 1,
-0.1793948, -1.355112, -2.164319, 0, 1, 0.6039216, 1,
-0.1751001, 0.9074283, 0.04537868, 0, 1, 0.6117647, 1,
-0.1724803, -0.1264644, -2.666323, 0, 1, 0.6156863, 1,
-0.1720529, -1.050956, -3.474568, 0, 1, 0.6235294, 1,
-0.1677211, 1.125364, -0.1187366, 0, 1, 0.627451, 1,
-0.1655622, 0.5516679, -0.8417485, 0, 1, 0.6352941, 1,
-0.1592534, 1.033697, -0.9324888, 0, 1, 0.6392157, 1,
-0.1563195, 1.118645, -0.4571922, 0, 1, 0.6470588, 1,
-0.156021, -0.8691882, -4.595513, 0, 1, 0.6509804, 1,
-0.1554873, -1.351976, -3.913188, 0, 1, 0.6588235, 1,
-0.1517407, 0.2779863, 0.05136592, 0, 1, 0.6627451, 1,
-0.1495413, -0.5791668, -3.16065, 0, 1, 0.6705883, 1,
-0.1492064, 0.3423506, 0.6810075, 0, 1, 0.6745098, 1,
-0.1487872, -0.7456259, -3.345675, 0, 1, 0.682353, 1,
-0.1480414, 0.842665, 0.3867368, 0, 1, 0.6862745, 1,
-0.1473839, -0.8895594, -5.55558, 0, 1, 0.6941177, 1,
-0.1467538, 0.684799, -1.192577, 0, 1, 0.7019608, 1,
-0.1448289, 0.7810378, -0.007178211, 0, 1, 0.7058824, 1,
-0.142111, 1.040973, 0.6071649, 0, 1, 0.7137255, 1,
-0.1417148, -0.1933298, -2.777734, 0, 1, 0.7176471, 1,
-0.1407453, -0.4884625, -3.108667, 0, 1, 0.7254902, 1,
-0.1334864, -0.7377306, -2.526658, 0, 1, 0.7294118, 1,
-0.1324255, 0.4185425, 0.09691273, 0, 1, 0.7372549, 1,
-0.1314552, 1.064413, 0.7266647, 0, 1, 0.7411765, 1,
-0.1286823, 1.588132, -1.731191, 0, 1, 0.7490196, 1,
-0.1285013, -0.7823232, -2.353801, 0, 1, 0.7529412, 1,
-0.1278094, 1.321598, -0.8058773, 0, 1, 0.7607843, 1,
-0.1270771, 0.5294146, 0.8527859, 0, 1, 0.7647059, 1,
-0.1195344, -0.4197547, -0.3851611, 0, 1, 0.772549, 1,
-0.1181735, 0.1580045, 1.072723, 0, 1, 0.7764706, 1,
-0.1177085, -1.747366, -4.568957, 0, 1, 0.7843137, 1,
-0.1177018, 2.39783, 0.9847943, 0, 1, 0.7882353, 1,
-0.1131989, -1.127454, -4.154972, 0, 1, 0.7960784, 1,
-0.1086664, 0.7140356, -1.451907, 0, 1, 0.8039216, 1,
-0.106229, -0.08942998, -1.620875, 0, 1, 0.8078431, 1,
-0.1057586, 0.1026441, -1.96548, 0, 1, 0.8156863, 1,
-0.1048116, 0.839021, 0.219536, 0, 1, 0.8196079, 1,
-0.09981079, 0.9125415, -1.476833, 0, 1, 0.827451, 1,
-0.09975381, 0.7768953, -0.5765656, 0, 1, 0.8313726, 1,
-0.09881682, -0.1682143, -3.131542, 0, 1, 0.8392157, 1,
-0.09274346, 0.9361675, 1.420395, 0, 1, 0.8431373, 1,
-0.08768571, 0.7379336, 0.3519143, 0, 1, 0.8509804, 1,
-0.08138812, -0.5977219, -1.598094, 0, 1, 0.854902, 1,
-0.07890679, 0.6452867, 1.413991, 0, 1, 0.8627451, 1,
-0.07691242, 1.407267, 0.5017553, 0, 1, 0.8666667, 1,
-0.07237024, -1.793206, -3.581639, 0, 1, 0.8745098, 1,
-0.07191481, -0.9314106, -2.96414, 0, 1, 0.8784314, 1,
-0.06875972, 0.03009902, -0.6129181, 0, 1, 0.8862745, 1,
-0.06484509, -0.5337766, -4.762636, 0, 1, 0.8901961, 1,
-0.06319458, -0.8410043, -2.948942, 0, 1, 0.8980392, 1,
-0.06211359, -0.2151802, -1.440074, 0, 1, 0.9058824, 1,
-0.06022609, 0.1656985, 0.1855969, 0, 1, 0.9098039, 1,
-0.0577939, 1.259652, -0.4172936, 0, 1, 0.9176471, 1,
-0.05760851, -0.2854597, -3.744257, 0, 1, 0.9215686, 1,
-0.05423949, -0.9417545, -3.27833, 0, 1, 0.9294118, 1,
-0.05175512, 1.269358, 2.065872, 0, 1, 0.9333333, 1,
-0.05152943, 1.398166, -0.637189, 0, 1, 0.9411765, 1,
-0.04525543, 0.4889203, 0.338042, 0, 1, 0.945098, 1,
-0.04519654, 1.616079, 0.3820997, 0, 1, 0.9529412, 1,
-0.04438222, 0.1420751, 1.303048, 0, 1, 0.9568627, 1,
-0.04117554, 0.3453546, 1.121268, 0, 1, 0.9647059, 1,
-0.03987947, -0.59512, -3.437956, 0, 1, 0.9686275, 1,
-0.03780025, -0.02974935, -2.991746, 0, 1, 0.9764706, 1,
-0.03709698, 1.139551, 1.001846, 0, 1, 0.9803922, 1,
-0.03656792, -1.555386, -4.38871, 0, 1, 0.9882353, 1,
-0.03411109, 1.09701, -0.3549872, 0, 1, 0.9921569, 1,
-0.02947899, 0.8305551, 0.2723222, 0, 1, 1, 1,
-0.0294382, -0.4205186, -3.830177, 0, 0.9921569, 1, 1,
-0.02601254, 0.1290764, 1.406753, 0, 0.9882353, 1, 1,
-0.01535539, -0.3039456, -2.851391, 0, 0.9803922, 1, 1,
-0.01395724, -1.566476, -1.998048, 0, 0.9764706, 1, 1,
-0.01311761, -0.8729342, -1.288731, 0, 0.9686275, 1, 1,
-0.01280617, -0.4553779, -4.723945, 0, 0.9647059, 1, 1,
-0.009992015, -0.8349985, -2.659818, 0, 0.9568627, 1, 1,
-0.009036279, -1.366328, -2.171504, 0, 0.9529412, 1, 1,
-0.0005558361, -0.5830344, -3.015365, 0, 0.945098, 1, 1,
0.002097368, -0.4805863, 2.692103, 0, 0.9411765, 1, 1,
0.002202374, -0.05204815, 2.719682, 0, 0.9333333, 1, 1,
0.003101051, -0.9321, 2.250459, 0, 0.9294118, 1, 1,
0.004052857, -0.7171307, 3.288614, 0, 0.9215686, 1, 1,
0.008755865, -0.7307417, 2.942621, 0, 0.9176471, 1, 1,
0.01070327, 0.3101686, -1.162672, 0, 0.9098039, 1, 1,
0.01238392, 1.045551, -0.7445055, 0, 0.9058824, 1, 1,
0.01351106, -0.04068542, 4.420592, 0, 0.8980392, 1, 1,
0.01484097, 0.4618201, -0.6951346, 0, 0.8901961, 1, 1,
0.01516491, 0.7044584, -0.3959679, 0, 0.8862745, 1, 1,
0.01640565, -1.002321, 5.248703, 0, 0.8784314, 1, 1,
0.02013438, 1.59451, 0.8273317, 0, 0.8745098, 1, 1,
0.02103287, -0.5672176, 3.049994, 0, 0.8666667, 1, 1,
0.03051528, -1.757886, 3.776209, 0, 0.8627451, 1, 1,
0.03197637, -0.5101572, 2.762875, 0, 0.854902, 1, 1,
0.03489296, -1.519424, 3.583418, 0, 0.8509804, 1, 1,
0.04247177, -0.8231609, 1.407178, 0, 0.8431373, 1, 1,
0.04364299, 0.2353191, -0.07749111, 0, 0.8392157, 1, 1,
0.04500542, 0.6508399, -0.2217597, 0, 0.8313726, 1, 1,
0.05048892, -1.792542, 2.841383, 0, 0.827451, 1, 1,
0.05382396, -0.8394209, 2.829868, 0, 0.8196079, 1, 1,
0.05515323, -0.6840373, 1.020913, 0, 0.8156863, 1, 1,
0.05619848, -0.2456566, 3.084852, 0, 0.8078431, 1, 1,
0.05656305, 0.9580004, 0.3043554, 0, 0.8039216, 1, 1,
0.05811656, 0.7248583, 0.2273336, 0, 0.7960784, 1, 1,
0.06299094, -0.694867, 2.351954, 0, 0.7882353, 1, 1,
0.06322229, 0.8232298, 0.6473734, 0, 0.7843137, 1, 1,
0.06401806, 1.845269, 1.313886, 0, 0.7764706, 1, 1,
0.0647097, -0.7303527, 3.686192, 0, 0.772549, 1, 1,
0.06517383, -0.4830166, 4.016029, 0, 0.7647059, 1, 1,
0.06960045, -0.1165061, 2.113157, 0, 0.7607843, 1, 1,
0.07477131, -0.6727439, 2.80609, 0, 0.7529412, 1, 1,
0.07647737, 0.5064847, 1.443641, 0, 0.7490196, 1, 1,
0.08040106, 0.5947059, 1.108411, 0, 0.7411765, 1, 1,
0.08146091, 0.05684891, 2.31137, 0, 0.7372549, 1, 1,
0.08165021, -2.070636, 5.331405, 0, 0.7294118, 1, 1,
0.08198281, 0.7017805, -0.9243363, 0, 0.7254902, 1, 1,
0.08243478, -0.6067184, 2.544482, 0, 0.7176471, 1, 1,
0.08492278, -1.028005, 3.977242, 0, 0.7137255, 1, 1,
0.08891456, 0.06889267, 1.659836, 0, 0.7058824, 1, 1,
0.09106581, -0.9220418, 2.56298, 0, 0.6980392, 1, 1,
0.09170188, 0.39345, 0.5931938, 0, 0.6941177, 1, 1,
0.09826172, -0.5311197, 5.594099, 0, 0.6862745, 1, 1,
0.1021017, -0.8483557, 1.629792, 0, 0.682353, 1, 1,
0.1105509, 0.8514675, 0.6959744, 0, 0.6745098, 1, 1,
0.1114837, 0.7278541, -1.214841, 0, 0.6705883, 1, 1,
0.1122408, 0.5503825, 0.1197505, 0, 0.6627451, 1, 1,
0.1161771, -0.9540085, 4.217511, 0, 0.6588235, 1, 1,
0.1186815, -0.679499, 3.994814, 0, 0.6509804, 1, 1,
0.1194113, -1.212314, 2.886436, 0, 0.6470588, 1, 1,
0.1264679, 0.3005364, -0.5296946, 0, 0.6392157, 1, 1,
0.1282896, -1.198323, 2.101913, 0, 0.6352941, 1, 1,
0.1291795, 1.148759, 0.153548, 0, 0.627451, 1, 1,
0.1309855, 0.8559604, -1.528069, 0, 0.6235294, 1, 1,
0.1321826, -0.4003635, 3.60289, 0, 0.6156863, 1, 1,
0.1334956, 0.007072791, 0.8124251, 0, 0.6117647, 1, 1,
0.1370705, -0.1037622, 2.49436, 0, 0.6039216, 1, 1,
0.1390871, 0.2589535, 0.7500955, 0, 0.5960785, 1, 1,
0.1393145, -0.3560022, 3.624989, 0, 0.5921569, 1, 1,
0.1414305, -0.4866345, 2.12841, 0, 0.5843138, 1, 1,
0.1421255, -0.3060904, 2.907256, 0, 0.5803922, 1, 1,
0.1425831, -0.8075408, 3.352216, 0, 0.572549, 1, 1,
0.1429328, -1.272045, 2.864235, 0, 0.5686275, 1, 1,
0.1454689, -1.370578, 3.921358, 0, 0.5607843, 1, 1,
0.1490468, -2.742374, 3.398767, 0, 0.5568628, 1, 1,
0.1491885, -1.520301, 0.9101234, 0, 0.5490196, 1, 1,
0.151138, -0.5597259, 3.889974, 0, 0.5450981, 1, 1,
0.1552781, -0.6237498, 2.259944, 0, 0.5372549, 1, 1,
0.1560086, -0.7714497, 2.654853, 0, 0.5333334, 1, 1,
0.1561638, -0.8200857, 3.602499, 0, 0.5254902, 1, 1,
0.170328, 0.734717, -0.414317, 0, 0.5215687, 1, 1,
0.1762782, -0.02039196, 1.247077, 0, 0.5137255, 1, 1,
0.1800491, 0.4361656, 0.07538972, 0, 0.509804, 1, 1,
0.1811044, -1.146258, 4.161125, 0, 0.5019608, 1, 1,
0.1814634, -0.4634376, 1.348181, 0, 0.4941176, 1, 1,
0.1871486, -1.020874, 4.923828, 0, 0.4901961, 1, 1,
0.1907025, -0.01073979, 1.381118, 0, 0.4823529, 1, 1,
0.190739, 0.2002392, 0.148919, 0, 0.4784314, 1, 1,
0.1908168, 0.06773677, 0.2847863, 0, 0.4705882, 1, 1,
0.1916844, -1.726787, -0.01533561, 0, 0.4666667, 1, 1,
0.1918485, -0.6767902, 1.212772, 0, 0.4588235, 1, 1,
0.1919772, 0.07603492, 1.73145, 0, 0.454902, 1, 1,
0.1956861, -0.2360923, 2.78598, 0, 0.4470588, 1, 1,
0.1977266, -0.8862361, 1.774911, 0, 0.4431373, 1, 1,
0.2046773, 0.7390539, 0.260629, 0, 0.4352941, 1, 1,
0.2122943, -1.616811, 3.331529, 0, 0.4313726, 1, 1,
0.2185154, -0.5833859, 4.446249, 0, 0.4235294, 1, 1,
0.2191179, 0.2799482, -1.046105, 0, 0.4196078, 1, 1,
0.2193006, -3.014525, 3.162743, 0, 0.4117647, 1, 1,
0.2213782, 0.3548089, 0.114476, 0, 0.4078431, 1, 1,
0.2223888, -1.318318, 3.851545, 0, 0.4, 1, 1,
0.2239135, 0.5039617, 0.7130834, 0, 0.3921569, 1, 1,
0.2274364, 1.028027, 0.8279725, 0, 0.3882353, 1, 1,
0.2283876, 0.8357114, 0.5685692, 0, 0.3803922, 1, 1,
0.2310194, -0.1854, 2.49058, 0, 0.3764706, 1, 1,
0.2328981, -1.436171, 3.389269, 0, 0.3686275, 1, 1,
0.2424061, 1.434809, -1.314638, 0, 0.3647059, 1, 1,
0.2425436, 1.009493, 0.012644, 0, 0.3568628, 1, 1,
0.2436134, -0.05034675, 1.622002, 0, 0.3529412, 1, 1,
0.2453977, 0.9837823, 1.665336, 0, 0.345098, 1, 1,
0.2510704, 2.875048, 0.6026561, 0, 0.3411765, 1, 1,
0.2586828, -0.5376359, 1.578992, 0, 0.3333333, 1, 1,
0.2590444, 2.019389, -1.716915, 0, 0.3294118, 1, 1,
0.2602642, 0.9560049, 0.2654543, 0, 0.3215686, 1, 1,
0.2620862, 0.7037392, 1.896995, 0, 0.3176471, 1, 1,
0.2682437, -0.4051463, 4.121248, 0, 0.3098039, 1, 1,
0.2699749, -1.254204, 2.090131, 0, 0.3058824, 1, 1,
0.2708497, -0.4825422, 2.577821, 0, 0.2980392, 1, 1,
0.2722118, 0.3051522, -0.5588605, 0, 0.2901961, 1, 1,
0.2768141, 0.5130536, 2.206295, 0, 0.2862745, 1, 1,
0.2827923, 0.1048281, 1.393092, 0, 0.2784314, 1, 1,
0.2840351, -2.117857, 2.553842, 0, 0.2745098, 1, 1,
0.2853418, 0.6926088, 1.556574, 0, 0.2666667, 1, 1,
0.2928154, -0.1057967, 1.498713, 0, 0.2627451, 1, 1,
0.2936177, -2.29462, 1.842406, 0, 0.254902, 1, 1,
0.2942989, 0.7907516, -0.3635816, 0, 0.2509804, 1, 1,
0.2957227, 0.1785978, -0.3230877, 0, 0.2431373, 1, 1,
0.2972527, 0.1946738, 0.6902509, 0, 0.2392157, 1, 1,
0.3026389, -1.499068, 2.927881, 0, 0.2313726, 1, 1,
0.303445, -0.3561219, 3.539362, 0, 0.227451, 1, 1,
0.3057346, 1.138621, 0.2228411, 0, 0.2196078, 1, 1,
0.3076346, 1.003759, 0.5594429, 0, 0.2156863, 1, 1,
0.3078961, -1.359889, 5.007521, 0, 0.2078431, 1, 1,
0.3105415, -0.3722223, -0.2328434, 0, 0.2039216, 1, 1,
0.3129679, -0.5678714, 0.3583262, 0, 0.1960784, 1, 1,
0.3205745, 0.01998966, 0.3012097, 0, 0.1882353, 1, 1,
0.3298485, -0.2039538, 1.911088, 0, 0.1843137, 1, 1,
0.3315159, -0.9764742, 2.705129, 0, 0.1764706, 1, 1,
0.3340858, -1.726665, 3.822483, 0, 0.172549, 1, 1,
0.3468133, -0.4191527, 3.428665, 0, 0.1647059, 1, 1,
0.3469134, 0.268831, -0.2720603, 0, 0.1607843, 1, 1,
0.3504086, 1.283909, 2.534409, 0, 0.1529412, 1, 1,
0.3581049, 0.9679585, 1.058038, 0, 0.1490196, 1, 1,
0.3582207, 0.1493803, 2.547867, 0, 0.1411765, 1, 1,
0.364861, -1.026827, 0.9437969, 0, 0.1372549, 1, 1,
0.3659183, -0.1456987, 3.228206, 0, 0.1294118, 1, 1,
0.367231, 0.3729146, 1.676537, 0, 0.1254902, 1, 1,
0.3691649, -0.2858897, 3.466608, 0, 0.1176471, 1, 1,
0.3700849, -0.3270548, 2.114229, 0, 0.1137255, 1, 1,
0.3708948, 1.000814, 2.343014, 0, 0.1058824, 1, 1,
0.3712888, 0.856218, -0.3105409, 0, 0.09803922, 1, 1,
0.3713931, 0.2221968, 0.2590987, 0, 0.09411765, 1, 1,
0.3720215, 1.089348, 1.171077, 0, 0.08627451, 1, 1,
0.3777788, 0.3348066, 0.4372401, 0, 0.08235294, 1, 1,
0.3819763, 0.5970591, 0.3432217, 0, 0.07450981, 1, 1,
0.3861274, -1.11171, 2.6624, 0, 0.07058824, 1, 1,
0.3871127, -1.145179, 3.018801, 0, 0.0627451, 1, 1,
0.3879192, 2.059974, -0.9936208, 0, 0.05882353, 1, 1,
0.3897432, 1.317196, -0.3303448, 0, 0.05098039, 1, 1,
0.3906242, 0.5228233, 1.81261, 0, 0.04705882, 1, 1,
0.3933521, -2.224858, 3.895247, 0, 0.03921569, 1, 1,
0.3953355, -0.3514025, 2.953299, 0, 0.03529412, 1, 1,
0.3956765, -1.101264, 3.741682, 0, 0.02745098, 1, 1,
0.3973081, 1.931898, 0.6513112, 0, 0.02352941, 1, 1,
0.4019475, -0.2202918, 1.073019, 0, 0.01568628, 1, 1,
0.4074261, 0.6401759, -0.8762777, 0, 0.01176471, 1, 1,
0.4106378, 0.7518691, -1.210728, 0, 0.003921569, 1, 1,
0.4107582, -0.213363, 1.964326, 0.003921569, 0, 1, 1,
0.4113545, 0.07698605, -0.1771869, 0.007843138, 0, 1, 1,
0.4119589, 0.2449111, 1.989635, 0.01568628, 0, 1, 1,
0.4120278, -0.4029503, 0.7513548, 0.01960784, 0, 1, 1,
0.4123242, -0.1412235, 3.150128, 0.02745098, 0, 1, 1,
0.4187725, 0.1105701, -0.5659075, 0.03137255, 0, 1, 1,
0.419439, -0.323725, 1.563936, 0.03921569, 0, 1, 1,
0.4198654, 0.6047506, 0.869496, 0.04313726, 0, 1, 1,
0.4218219, 1.496141, 0.3647649, 0.05098039, 0, 1, 1,
0.4253241, 0.0830318, -0.2710611, 0.05490196, 0, 1, 1,
0.4303457, 0.005989144, 2.316118, 0.0627451, 0, 1, 1,
0.4326189, 0.6673884, -0.2528897, 0.06666667, 0, 1, 1,
0.4333179, -0.9866015, 2.157823, 0.07450981, 0, 1, 1,
0.4357055, -0.3070712, 1.704491, 0.07843138, 0, 1, 1,
0.4408977, 0.7395259, 1.449683, 0.08627451, 0, 1, 1,
0.442277, -0.006041221, 1.54654, 0.09019608, 0, 1, 1,
0.4458964, 2.064877, 0.6594481, 0.09803922, 0, 1, 1,
0.4460334, 0.8897222, 0.780101, 0.1058824, 0, 1, 1,
0.4493053, -0.769879, 4.283044, 0.1098039, 0, 1, 1,
0.4498892, 1.978792, 1.870983, 0.1176471, 0, 1, 1,
0.4499565, 0.1694126, 0.7637935, 0.1215686, 0, 1, 1,
0.4505532, 0.05302271, 1.722631, 0.1294118, 0, 1, 1,
0.4508582, -1.68494, 2.692958, 0.1333333, 0, 1, 1,
0.4581564, -0.3307331, 2.206739, 0.1411765, 0, 1, 1,
0.4654484, 0.4099997, -0.0573174, 0.145098, 0, 1, 1,
0.4655486, 0.1983091, 0.1669654, 0.1529412, 0, 1, 1,
0.4732242, 0.208972, 1.492056, 0.1568628, 0, 1, 1,
0.4745038, 0.08504175, 1.499526, 0.1647059, 0, 1, 1,
0.4779864, -0.1853519, 1.707336, 0.1686275, 0, 1, 1,
0.4800252, -0.5844366, 3.360445, 0.1764706, 0, 1, 1,
0.488717, 1.160237, -0.8635556, 0.1803922, 0, 1, 1,
0.4951624, -0.4369063, 2.492746, 0.1882353, 0, 1, 1,
0.4989586, 0.1972737, 1.430449, 0.1921569, 0, 1, 1,
0.5016233, -1.848559, 2.286152, 0.2, 0, 1, 1,
0.5020996, -0.8414705, 1.356695, 0.2078431, 0, 1, 1,
0.5037776, 0.3040304, -0.2074493, 0.2117647, 0, 1, 1,
0.5041095, 0.9320788, 1.329983, 0.2196078, 0, 1, 1,
0.5082582, -0.08659384, 2.208521, 0.2235294, 0, 1, 1,
0.5129941, -0.3356622, 0.953947, 0.2313726, 0, 1, 1,
0.513046, 1.172213, -0.007906456, 0.2352941, 0, 1, 1,
0.5175278, -0.8817656, 2.994728, 0.2431373, 0, 1, 1,
0.5203437, 0.1817386, 1.726198, 0.2470588, 0, 1, 1,
0.5219696, 0.9253898, 1.674048, 0.254902, 0, 1, 1,
0.5272883, -0.7604411, 4.542432, 0.2588235, 0, 1, 1,
0.5277628, -0.6699061, 0.9715236, 0.2666667, 0, 1, 1,
0.5283785, -0.2409259, 0.1973736, 0.2705882, 0, 1, 1,
0.5324202, -0.8508788, 2.279542, 0.2784314, 0, 1, 1,
0.5348666, 0.9383723, -0.3537529, 0.282353, 0, 1, 1,
0.5363557, -0.3495797, 3.045123, 0.2901961, 0, 1, 1,
0.5375931, -0.3408501, 2.461278, 0.2941177, 0, 1, 1,
0.5387264, -0.5357533, 3.439873, 0.3019608, 0, 1, 1,
0.5447043, -0.6536858, 3.719438, 0.3098039, 0, 1, 1,
0.5460261, -0.5922076, 3.751267, 0.3137255, 0, 1, 1,
0.5473152, -0.261251, 1.54575, 0.3215686, 0, 1, 1,
0.5488709, -0.04025032, 0.38647, 0.3254902, 0, 1, 1,
0.5506076, -0.7430778, -0.1753414, 0.3333333, 0, 1, 1,
0.5519413, -0.8709869, 4.308144, 0.3372549, 0, 1, 1,
0.5683956, -0.5737928, 3.460151, 0.345098, 0, 1, 1,
0.570902, -0.05325216, 1.142564, 0.3490196, 0, 1, 1,
0.5712863, 1.581123, 1.03336, 0.3568628, 0, 1, 1,
0.5744974, -0.3984626, 3.444423, 0.3607843, 0, 1, 1,
0.5809055, 0.1987809, 0.9913574, 0.3686275, 0, 1, 1,
0.5826579, 1.400862, 0.02226351, 0.372549, 0, 1, 1,
0.585718, -1.33717, 4.287242, 0.3803922, 0, 1, 1,
0.5893971, -0.5991269, 3.102418, 0.3843137, 0, 1, 1,
0.5913053, -0.05146633, 1.321335, 0.3921569, 0, 1, 1,
0.5949739, -1.287112, 2.911813, 0.3960784, 0, 1, 1,
0.5964286, -0.489664, 3.390707, 0.4039216, 0, 1, 1,
0.5992972, -0.2322331, 3.019272, 0.4117647, 0, 1, 1,
0.6033756, -0.3621893, 2.522717, 0.4156863, 0, 1, 1,
0.6042829, -0.4644133, 5.077733, 0.4235294, 0, 1, 1,
0.6096027, 0.8158559, 0.5748655, 0.427451, 0, 1, 1,
0.6101707, -1.074997, 2.203136, 0.4352941, 0, 1, 1,
0.6108894, -0.2399336, 1.011854, 0.4392157, 0, 1, 1,
0.6123673, 0.4233029, 1.279108, 0.4470588, 0, 1, 1,
0.617787, 1.004515, 0.2281984, 0.4509804, 0, 1, 1,
0.6246115, -0.1501129, 1.735667, 0.4588235, 0, 1, 1,
0.633445, 1.53745, 0.6915502, 0.4627451, 0, 1, 1,
0.6472265, -1.212981, 2.685066, 0.4705882, 0, 1, 1,
0.6499968, -0.06208626, 0.8974849, 0.4745098, 0, 1, 1,
0.6546488, -2.006927, 5.01709, 0.4823529, 0, 1, 1,
0.6554019, -0.01269111, 3.317198, 0.4862745, 0, 1, 1,
0.6575038, -1.850511, 3.282955, 0.4941176, 0, 1, 1,
0.6583577, -0.4414316, 3.4852, 0.5019608, 0, 1, 1,
0.6592005, 0.5704376, 2.236432, 0.5058824, 0, 1, 1,
0.6638231, -1.68571, 2.958828, 0.5137255, 0, 1, 1,
0.6646009, -0.03238853, 2.988775, 0.5176471, 0, 1, 1,
0.6656991, 1.686808, 0.9706929, 0.5254902, 0, 1, 1,
0.6769727, -1.318124, 1.852965, 0.5294118, 0, 1, 1,
0.6812785, 0.3890935, 2.082795, 0.5372549, 0, 1, 1,
0.6854981, -0.699748, 2.515175, 0.5411765, 0, 1, 1,
0.6873723, -0.9109951, 1.680601, 0.5490196, 0, 1, 1,
0.6913251, 0.2689848, 1.384304, 0.5529412, 0, 1, 1,
0.6976823, 1.39609, 1.078565, 0.5607843, 0, 1, 1,
0.6997078, -1.350249, 3.608032, 0.5647059, 0, 1, 1,
0.7035481, 1.353608, 1.392898, 0.572549, 0, 1, 1,
0.7038152, 1.347161, 0.4972511, 0.5764706, 0, 1, 1,
0.7038471, -0.8479219, 0.9902325, 0.5843138, 0, 1, 1,
0.703949, 0.9089133, -1.534536, 0.5882353, 0, 1, 1,
0.7078688, -0.7807155, 3.05806, 0.5960785, 0, 1, 1,
0.71226, -1.837866, 2.858594, 0.6039216, 0, 1, 1,
0.7132477, -1.563682, 3.768599, 0.6078432, 0, 1, 1,
0.7133712, -0.8721346, 2.665868, 0.6156863, 0, 1, 1,
0.7144227, 1.870318, 0.2930942, 0.6196079, 0, 1, 1,
0.7155126, -0.3538774, 2.807122, 0.627451, 0, 1, 1,
0.7195107, 0.2942168, 1.814044, 0.6313726, 0, 1, 1,
0.722719, -0.8070207, 3.493889, 0.6392157, 0, 1, 1,
0.7255033, 0.4773265, -0.9571698, 0.6431373, 0, 1, 1,
0.7279099, 0.9617352, 1.408374, 0.6509804, 0, 1, 1,
0.7346931, 0.5973014, 1.495489, 0.654902, 0, 1, 1,
0.7363027, -1.233122, 2.912514, 0.6627451, 0, 1, 1,
0.7406378, -0.2937871, 2.709298, 0.6666667, 0, 1, 1,
0.7441009, 0.382575, 0.3089549, 0.6745098, 0, 1, 1,
0.7479551, 1.150914, 0.1578813, 0.6784314, 0, 1, 1,
0.7521468, 1.353588, 1.015003, 0.6862745, 0, 1, 1,
0.7524447, 0.2747263, 1.108049, 0.6901961, 0, 1, 1,
0.7554567, -0.359928, 2.11692, 0.6980392, 0, 1, 1,
0.763334, 1.144108, 1.733836, 0.7058824, 0, 1, 1,
0.764939, -0.2047769, 2.280998, 0.7098039, 0, 1, 1,
0.7672405, 0.2684478, 0.08674899, 0.7176471, 0, 1, 1,
0.7706102, -0.1047889, 2.539788, 0.7215686, 0, 1, 1,
0.7737454, 0.3904276, 0.7908785, 0.7294118, 0, 1, 1,
0.7740405, 1.122634, -0.2746651, 0.7333333, 0, 1, 1,
0.7746848, 1.350355, 1.05066, 0.7411765, 0, 1, 1,
0.7790502, -1.429746, 3.34906, 0.7450981, 0, 1, 1,
0.7794014, -0.3244144, 1.95078, 0.7529412, 0, 1, 1,
0.7937036, -1.396803, 3.879835, 0.7568628, 0, 1, 1,
0.7973126, 1.92177, 0.6936385, 0.7647059, 0, 1, 1,
0.7985722, -1.525948, 4.79831, 0.7686275, 0, 1, 1,
0.8027422, -0.6668751, 2.56847, 0.7764706, 0, 1, 1,
0.8036264, 0.4318783, 1.599365, 0.7803922, 0, 1, 1,
0.8039232, -0.3188232, 3.585321, 0.7882353, 0, 1, 1,
0.8084344, -0.6271893, 2.102272, 0.7921569, 0, 1, 1,
0.810764, 0.1068034, 1.862485, 0.8, 0, 1, 1,
0.8110535, -1.255608, 3.133556, 0.8078431, 0, 1, 1,
0.8114728, -0.6947801, 1.842917, 0.8117647, 0, 1, 1,
0.8133786, -0.0120377, 2.473666, 0.8196079, 0, 1, 1,
0.8157778, 0.07947969, 1.296697, 0.8235294, 0, 1, 1,
0.8214103, -1.544414, 0.962647, 0.8313726, 0, 1, 1,
0.8280551, -1.996608, 2.012747, 0.8352941, 0, 1, 1,
0.8284329, 0.68026, 1.371571, 0.8431373, 0, 1, 1,
0.8421532, -1.81768, 2.047072, 0.8470588, 0, 1, 1,
0.8446014, 0.3744392, -0.07815491, 0.854902, 0, 1, 1,
0.8532726, 0.3648217, 1.129203, 0.8588235, 0, 1, 1,
0.8549204, -1.404192, 1.259138, 0.8666667, 0, 1, 1,
0.8576561, 0.8857165, 0.4254279, 0.8705882, 0, 1, 1,
0.8612297, 1.199221, 0.84916, 0.8784314, 0, 1, 1,
0.8690377, 0.8658115, 2.585898, 0.8823529, 0, 1, 1,
0.8694389, -0.8176547, 1.222621, 0.8901961, 0, 1, 1,
0.8764984, 1.160824, 1.493277, 0.8941177, 0, 1, 1,
0.8817407, -0.4642949, 2.839332, 0.9019608, 0, 1, 1,
0.8844293, -0.9681788, 2.510709, 0.9098039, 0, 1, 1,
0.8862476, 0.3743025, 0.4464247, 0.9137255, 0, 1, 1,
0.889637, 3.120113, -0.06475559, 0.9215686, 0, 1, 1,
0.8903344, 0.9176519, 2.250593, 0.9254902, 0, 1, 1,
0.893627, -0.8731953, 3.128211, 0.9333333, 0, 1, 1,
0.8937038, 1.307847, 1.922265, 0.9372549, 0, 1, 1,
0.894872, 0.3441583, 1.032627, 0.945098, 0, 1, 1,
0.8982857, 2.007771, -0.8157628, 0.9490196, 0, 1, 1,
0.9032119, 0.7462896, -0.9958137, 0.9568627, 0, 1, 1,
0.9062074, 0.08002092, 0.2135228, 0.9607843, 0, 1, 1,
0.9062771, 0.5180302, 1.144014, 0.9686275, 0, 1, 1,
0.9109713, -0.3992441, 2.266408, 0.972549, 0, 1, 1,
0.9120729, -1.010095, 3.17415, 0.9803922, 0, 1, 1,
0.9158605, 1.384442, -0.7785157, 0.9843137, 0, 1, 1,
0.916975, -0.4352327, 2.823541, 0.9921569, 0, 1, 1,
0.9195527, 0.1451969, 3.09151, 0.9960784, 0, 1, 1,
0.9231157, 0.642575, 0.6172381, 1, 0, 0.9960784, 1,
0.9268412, -0.8944075, 1.697902, 1, 0, 0.9882353, 1,
0.9306733, 1.871542, -0.3047564, 1, 0, 0.9843137, 1,
0.935429, 1.79328, -0.356182, 1, 0, 0.9764706, 1,
0.9368675, -0.915169, 0.3939222, 1, 0, 0.972549, 1,
0.9489132, 2.675643, 0.8456876, 1, 0, 0.9647059, 1,
0.953424, -0.9923633, 2.321665, 1, 0, 0.9607843, 1,
0.9624561, 0.4704194, 2.154598, 1, 0, 0.9529412, 1,
0.9764284, -0.6585097, 2.654403, 1, 0, 0.9490196, 1,
0.9780874, 1.276657, -0.7948418, 1, 0, 0.9411765, 1,
0.9782202, 0.163667, -0.3125418, 1, 0, 0.9372549, 1,
0.9799306, -1.087949, 1.048942, 1, 0, 0.9294118, 1,
0.9812206, 0.4930145, 1.954947, 1, 0, 0.9254902, 1,
0.9812711, 0.1935667, 0.8457983, 1, 0, 0.9176471, 1,
0.9840683, 1.279742, 0.3534338, 1, 0, 0.9137255, 1,
0.9881991, 1.267345, 1.628499, 1, 0, 0.9058824, 1,
0.9913312, -1.503403, 3.155077, 1, 0, 0.9019608, 1,
0.9923913, 0.1004954, 1.168336, 1, 0, 0.8941177, 1,
1.001346, 0.2217862, 2.21469, 1, 0, 0.8862745, 1,
1.015245, -0.1547198, 1.848559, 1, 0, 0.8823529, 1,
1.0167, 0.8645449, 1.138386, 1, 0, 0.8745098, 1,
1.019307, 0.5882717, 1.454836, 1, 0, 0.8705882, 1,
1.023742, -0.507476, 3.45865, 1, 0, 0.8627451, 1,
1.024987, 0.95003, 1.664844, 1, 0, 0.8588235, 1,
1.028647, 0.2990494, 1.774945, 1, 0, 0.8509804, 1,
1.029274, 0.1496813, 2.447743, 1, 0, 0.8470588, 1,
1.03126, 0.3734304, 0.6546065, 1, 0, 0.8392157, 1,
1.032663, 1.106629, 0.1606138, 1, 0, 0.8352941, 1,
1.036907, -1.350408, 3.620491, 1, 0, 0.827451, 1,
1.036926, 1.078283, 0.0456503, 1, 0, 0.8235294, 1,
1.038537, 0.1195151, 0.5598388, 1, 0, 0.8156863, 1,
1.040913, 0.5136302, 1.401575, 1, 0, 0.8117647, 1,
1.041838, -0.331698, 1.36583, 1, 0, 0.8039216, 1,
1.047305, -1.059463, 4.014181, 1, 0, 0.7960784, 1,
1.0487, -0.9629303, 1.174216, 1, 0, 0.7921569, 1,
1.050959, -1.393264, 3.249028, 1, 0, 0.7843137, 1,
1.05801, 0.1665632, 2.412445, 1, 0, 0.7803922, 1,
1.069014, 1.267256, 1.728285, 1, 0, 0.772549, 1,
1.070416, -0.7524187, 2.576285, 1, 0, 0.7686275, 1,
1.073609, 1.751907, 0.05594296, 1, 0, 0.7607843, 1,
1.074633, 1.154512, 2.196865, 1, 0, 0.7568628, 1,
1.080354, -1.15213, 1.159921, 1, 0, 0.7490196, 1,
1.08723, -0.08061037, 2.164436, 1, 0, 0.7450981, 1,
1.091765, -2.11724, 3.048118, 1, 0, 0.7372549, 1,
1.093382, 0.4387534, 1.512869, 1, 0, 0.7333333, 1,
1.094861, -1.983528, 3.593301, 1, 0, 0.7254902, 1,
1.095639, 0.7333025, 0.2694708, 1, 0, 0.7215686, 1,
1.102675, -1.014685, 1.199734, 1, 0, 0.7137255, 1,
1.103058, -0.9191589, 0.7259712, 1, 0, 0.7098039, 1,
1.108357, 1.379526, -0.08239762, 1, 0, 0.7019608, 1,
1.113023, -1.831257, 2.222149, 1, 0, 0.6941177, 1,
1.115622, -0.9455596, 3.044355, 1, 0, 0.6901961, 1,
1.125608, 0.5900959, 0.8093891, 1, 0, 0.682353, 1,
1.141523, 0.6473374, 0.188993, 1, 0, 0.6784314, 1,
1.143331, 0.1025519, 1.193394, 1, 0, 0.6705883, 1,
1.144634, -0.7081807, 1.683609, 1, 0, 0.6666667, 1,
1.159699, 0.5334169, 2.763581, 1, 0, 0.6588235, 1,
1.159942, -1.679341, 4.344058, 1, 0, 0.654902, 1,
1.16014, 1.094205, 0.6899187, 1, 0, 0.6470588, 1,
1.16064, 1.756647, 2.021629, 1, 0, 0.6431373, 1,
1.170457, 0.4042685, 1.920421, 1, 0, 0.6352941, 1,
1.174413, -0.1941317, 2.099822, 1, 0, 0.6313726, 1,
1.178284, 0.696891, 1.982796, 1, 0, 0.6235294, 1,
1.178765, -0.4719501, 1.298056, 1, 0, 0.6196079, 1,
1.19324, -0.8256927, 1.10134, 1, 0, 0.6117647, 1,
1.195648, 1.545695, 1.878569, 1, 0, 0.6078432, 1,
1.199297, 0.05750369, 1.413068, 1, 0, 0.6, 1,
1.216238, -0.7061203, 0.2564503, 1, 0, 0.5921569, 1,
1.216425, -0.1390236, 1.468807, 1, 0, 0.5882353, 1,
1.225454, -0.7437475, 1.097836, 1, 0, 0.5803922, 1,
1.226152, -0.6730497, 1.477585, 1, 0, 0.5764706, 1,
1.227399, -1.527754, 2.233872, 1, 0, 0.5686275, 1,
1.247464, -1.572263, 3.182427, 1, 0, 0.5647059, 1,
1.254012, 0.3479091, 0.9888403, 1, 0, 0.5568628, 1,
1.265952, -0.2580652, 2.703262, 1, 0, 0.5529412, 1,
1.278938, 1.620027, 0.4587301, 1, 0, 0.5450981, 1,
1.280929, 0.09599674, 0.7580538, 1, 0, 0.5411765, 1,
1.283447, 0.1412448, 2.601278, 1, 0, 0.5333334, 1,
1.294835, -1.30476, 2.692944, 1, 0, 0.5294118, 1,
1.29587, -0.07735534, 1.152267, 1, 0, 0.5215687, 1,
1.296056, 0.3385797, 1.838713, 1, 0, 0.5176471, 1,
1.300876, -0.3245924, 1.056623, 1, 0, 0.509804, 1,
1.304242, 0.2994546, 1.841147, 1, 0, 0.5058824, 1,
1.340236, 1.715824, 1.242513, 1, 0, 0.4980392, 1,
1.340634, -0.6943308, 1.919393, 1, 0, 0.4901961, 1,
1.350355, 1.230041, 1.691339, 1, 0, 0.4862745, 1,
1.375231, -0.1558648, 1.628926, 1, 0, 0.4784314, 1,
1.388258, -0.820586, 1.844337, 1, 0, 0.4745098, 1,
1.395774, -0.8802942, 3.159379, 1, 0, 0.4666667, 1,
1.398248, 2.11626, -0.07352256, 1, 0, 0.4627451, 1,
1.409009, -0.6817631, 0.8756446, 1, 0, 0.454902, 1,
1.429682, -0.03688872, 1.795192, 1, 0, 0.4509804, 1,
1.433084, 0.3536178, 1.521514, 1, 0, 0.4431373, 1,
1.456818, -0.9591606, 1.677256, 1, 0, 0.4392157, 1,
1.458676, -0.0337939, 1.686305, 1, 0, 0.4313726, 1,
1.461539, -0.9223513, 2.090115, 1, 0, 0.427451, 1,
1.472242, -1.047837, 2.942046, 1, 0, 0.4196078, 1,
1.494088, -0.5568842, 3.544558, 1, 0, 0.4156863, 1,
1.496984, -0.9611525, 0.9494469, 1, 0, 0.4078431, 1,
1.499726, -0.7113752, 2.458584, 1, 0, 0.4039216, 1,
1.507189, -0.4047491, 0.8553621, 1, 0, 0.3960784, 1,
1.517428, -1.276943, 2.687141, 1, 0, 0.3882353, 1,
1.524102, 1.434172, 2.494385, 1, 0, 0.3843137, 1,
1.525868, -1.671172, 1.795193, 1, 0, 0.3764706, 1,
1.529316, -0.7395596, 0.4394243, 1, 0, 0.372549, 1,
1.532689, 2.238174, 0.8346207, 1, 0, 0.3647059, 1,
1.535976, 0.5511251, 2.23338, 1, 0, 0.3607843, 1,
1.542924, 1.276007, 0.3409504, 1, 0, 0.3529412, 1,
1.565663, -1.549885, 3.179761, 1, 0, 0.3490196, 1,
1.595013, -1.332335, 1.467964, 1, 0, 0.3411765, 1,
1.602381, -0.1368504, 1.237417, 1, 0, 0.3372549, 1,
1.62347, -0.4532886, 2.987533, 1, 0, 0.3294118, 1,
1.633478, -0.5589576, 1.28346, 1, 0, 0.3254902, 1,
1.641127, 1.51806, 1.023785, 1, 0, 0.3176471, 1,
1.650851, 0.8032409, -0.07573308, 1, 0, 0.3137255, 1,
1.658098, -0.9679477, 2.4191, 1, 0, 0.3058824, 1,
1.685527, -0.2215405, 0.9480174, 1, 0, 0.2980392, 1,
1.709795, 1.300332, 2.246016, 1, 0, 0.2941177, 1,
1.726448, -2.595412, 1.841861, 1, 0, 0.2862745, 1,
1.743683, 1.361908, 1.339411, 1, 0, 0.282353, 1,
1.744945, -0.467058, 1.787387, 1, 0, 0.2745098, 1,
1.761438, -0.8715031, 1.820958, 1, 0, 0.2705882, 1,
1.788519, -0.07224414, 3.558927, 1, 0, 0.2627451, 1,
1.796583, 1.056632, 0.3160101, 1, 0, 0.2588235, 1,
1.828652, -2.179675, 3.079437, 1, 0, 0.2509804, 1,
1.832839, -1.068237, 0.6785275, 1, 0, 0.2470588, 1,
1.836687, 0.9578462, 2.538815, 1, 0, 0.2392157, 1,
1.848967, 1.600269, 1.52614, 1, 0, 0.2352941, 1,
1.849038, 1.260861, 1.77906, 1, 0, 0.227451, 1,
1.850497, -0.08187901, 2.392367, 1, 0, 0.2235294, 1,
1.862723, 0.8629324, 1.404212, 1, 0, 0.2156863, 1,
1.86612, -0.5815977, 1.65025, 1, 0, 0.2117647, 1,
1.879243, -1.555693, 1.967525, 1, 0, 0.2039216, 1,
1.880211, -0.6715569, 2.742737, 1, 0, 0.1960784, 1,
1.897201, 1.307227, -0.04226533, 1, 0, 0.1921569, 1,
1.903281, -0.4911664, 0.6938766, 1, 0, 0.1843137, 1,
1.912452, -0.6753299, 1.17157, 1, 0, 0.1803922, 1,
1.956823, 1.343222, 0.7528771, 1, 0, 0.172549, 1,
1.96442, -0.2509005, 1.517645, 1, 0, 0.1686275, 1,
2.027793, 0.9524951, 2.918641, 1, 0, 0.1607843, 1,
2.037525, 1.225154, 1.569038, 1, 0, 0.1568628, 1,
2.040451, 0.3390585, 1.198825, 1, 0, 0.1490196, 1,
2.075387, -0.7658907, 1.857895, 1, 0, 0.145098, 1,
2.092717, 0.5897875, 0.5143619, 1, 0, 0.1372549, 1,
2.104758, -0.07929774, 0.583012, 1, 0, 0.1333333, 1,
2.110886, -1.251678, 2.854359, 1, 0, 0.1254902, 1,
2.11812, 0.396202, 1.483594, 1, 0, 0.1215686, 1,
2.118522, -0.5026094, 2.154388, 1, 0, 0.1137255, 1,
2.120299, -1.80267, 1.561184, 1, 0, 0.1098039, 1,
2.127553, 0.7694212, 2.302994, 1, 0, 0.1019608, 1,
2.130216, 1.254081, 1.139853, 1, 0, 0.09411765, 1,
2.130553, 0.6273246, 2.657326, 1, 0, 0.09019608, 1,
2.162311, -0.5626765, 3.388099, 1, 0, 0.08235294, 1,
2.245558, 1.456167, 1.011805, 1, 0, 0.07843138, 1,
2.254911, 0.8787251, 2.458463, 1, 0, 0.07058824, 1,
2.390441, 1.669733, 1.020067, 1, 0, 0.06666667, 1,
2.409851, 1.259598, 3.198645, 1, 0, 0.05882353, 1,
2.432241, -1.663182, 2.064675, 1, 0, 0.05490196, 1,
2.446067, 0.5245687, 2.014615, 1, 0, 0.04705882, 1,
2.465444, -0.2562672, -0.1464974, 1, 0, 0.04313726, 1,
2.470104, 0.2119711, 1.724954, 1, 0, 0.03529412, 1,
2.615707, -1.255046, 2.646177, 1, 0, 0.03137255, 1,
2.616527, -0.3138664, 1.40002, 1, 0, 0.02352941, 1,
2.617133, -0.07023339, -0.007363756, 1, 0, 0.01960784, 1,
2.845678, -0.3242044, 3.488543, 1, 0, 0.01176471, 1,
3.033173, -0.3518552, 2.804415, 1, 0, 0.007843138, 1
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
-0.4429454, -4.054346, -7.44545, 0, -0.5, 0.5, 0.5,
-0.4429454, -4.054346, -7.44545, 1, -0.5, 0.5, 0.5,
-0.4429454, -4.054346, -7.44545, 1, 1.5, 0.5, 0.5,
-0.4429454, -4.054346, -7.44545, 0, 1.5, 0.5, 0.5
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
-5.097467, 0.05279374, -7.44545, 0, -0.5, 0.5, 0.5,
-5.097467, 0.05279374, -7.44545, 1, -0.5, 0.5, 0.5,
-5.097467, 0.05279374, -7.44545, 1, 1.5, 0.5, 0.5,
-5.097467, 0.05279374, -7.44545, 0, 1.5, 0.5, 0.5
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
-5.097467, -4.054346, 0.01925945, 0, -0.5, 0.5, 0.5,
-5.097467, -4.054346, 0.01925945, 1, -0.5, 0.5, 0.5,
-5.097467, -4.054346, 0.01925945, 1, 1.5, 0.5, 0.5,
-5.097467, -4.054346, 0.01925945, 0, 1.5, 0.5, 0.5
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
-3, -3.106545, -5.722825,
3, -3.106545, -5.722825,
-3, -3.106545, -5.722825,
-3, -3.264512, -6.009929,
-2, -3.106545, -5.722825,
-2, -3.264512, -6.009929,
-1, -3.106545, -5.722825,
-1, -3.264512, -6.009929,
0, -3.106545, -5.722825,
0, -3.264512, -6.009929,
1, -3.106545, -5.722825,
1, -3.264512, -6.009929,
2, -3.106545, -5.722825,
2, -3.264512, -6.009929,
3, -3.106545, -5.722825,
3, -3.264512, -6.009929
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
-3, -3.580446, -6.584137, 0, -0.5, 0.5, 0.5,
-3, -3.580446, -6.584137, 1, -0.5, 0.5, 0.5,
-3, -3.580446, -6.584137, 1, 1.5, 0.5, 0.5,
-3, -3.580446, -6.584137, 0, 1.5, 0.5, 0.5,
-2, -3.580446, -6.584137, 0, -0.5, 0.5, 0.5,
-2, -3.580446, -6.584137, 1, -0.5, 0.5, 0.5,
-2, -3.580446, -6.584137, 1, 1.5, 0.5, 0.5,
-2, -3.580446, -6.584137, 0, 1.5, 0.5, 0.5,
-1, -3.580446, -6.584137, 0, -0.5, 0.5, 0.5,
-1, -3.580446, -6.584137, 1, -0.5, 0.5, 0.5,
-1, -3.580446, -6.584137, 1, 1.5, 0.5, 0.5,
-1, -3.580446, -6.584137, 0, 1.5, 0.5, 0.5,
0, -3.580446, -6.584137, 0, -0.5, 0.5, 0.5,
0, -3.580446, -6.584137, 1, -0.5, 0.5, 0.5,
0, -3.580446, -6.584137, 1, 1.5, 0.5, 0.5,
0, -3.580446, -6.584137, 0, 1.5, 0.5, 0.5,
1, -3.580446, -6.584137, 0, -0.5, 0.5, 0.5,
1, -3.580446, -6.584137, 1, -0.5, 0.5, 0.5,
1, -3.580446, -6.584137, 1, 1.5, 0.5, 0.5,
1, -3.580446, -6.584137, 0, 1.5, 0.5, 0.5,
2, -3.580446, -6.584137, 0, -0.5, 0.5, 0.5,
2, -3.580446, -6.584137, 1, -0.5, 0.5, 0.5,
2, -3.580446, -6.584137, 1, 1.5, 0.5, 0.5,
2, -3.580446, -6.584137, 0, 1.5, 0.5, 0.5,
3, -3.580446, -6.584137, 0, -0.5, 0.5, 0.5,
3, -3.580446, -6.584137, 1, -0.5, 0.5, 0.5,
3, -3.580446, -6.584137, 1, 1.5, 0.5, 0.5,
3, -3.580446, -6.584137, 0, 1.5, 0.5, 0.5
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
-4.023347, -3, -5.722825,
-4.023347, 3, -5.722825,
-4.023347, -3, -5.722825,
-4.202367, -3, -6.009929,
-4.023347, -2, -5.722825,
-4.202367, -2, -6.009929,
-4.023347, -1, -5.722825,
-4.202367, -1, -6.009929,
-4.023347, 0, -5.722825,
-4.202367, 0, -6.009929,
-4.023347, 1, -5.722825,
-4.202367, 1, -6.009929,
-4.023347, 2, -5.722825,
-4.202367, 2, -6.009929,
-4.023347, 3, -5.722825,
-4.202367, 3, -6.009929
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
-4.560407, -3, -6.584137, 0, -0.5, 0.5, 0.5,
-4.560407, -3, -6.584137, 1, -0.5, 0.5, 0.5,
-4.560407, -3, -6.584137, 1, 1.5, 0.5, 0.5,
-4.560407, -3, -6.584137, 0, 1.5, 0.5, 0.5,
-4.560407, -2, -6.584137, 0, -0.5, 0.5, 0.5,
-4.560407, -2, -6.584137, 1, -0.5, 0.5, 0.5,
-4.560407, -2, -6.584137, 1, 1.5, 0.5, 0.5,
-4.560407, -2, -6.584137, 0, 1.5, 0.5, 0.5,
-4.560407, -1, -6.584137, 0, -0.5, 0.5, 0.5,
-4.560407, -1, -6.584137, 1, -0.5, 0.5, 0.5,
-4.560407, -1, -6.584137, 1, 1.5, 0.5, 0.5,
-4.560407, -1, -6.584137, 0, 1.5, 0.5, 0.5,
-4.560407, 0, -6.584137, 0, -0.5, 0.5, 0.5,
-4.560407, 0, -6.584137, 1, -0.5, 0.5, 0.5,
-4.560407, 0, -6.584137, 1, 1.5, 0.5, 0.5,
-4.560407, 0, -6.584137, 0, 1.5, 0.5, 0.5,
-4.560407, 1, -6.584137, 0, -0.5, 0.5, 0.5,
-4.560407, 1, -6.584137, 1, -0.5, 0.5, 0.5,
-4.560407, 1, -6.584137, 1, 1.5, 0.5, 0.5,
-4.560407, 1, -6.584137, 0, 1.5, 0.5, 0.5,
-4.560407, 2, -6.584137, 0, -0.5, 0.5, 0.5,
-4.560407, 2, -6.584137, 1, -0.5, 0.5, 0.5,
-4.560407, 2, -6.584137, 1, 1.5, 0.5, 0.5,
-4.560407, 2, -6.584137, 0, 1.5, 0.5, 0.5,
-4.560407, 3, -6.584137, 0, -0.5, 0.5, 0.5,
-4.560407, 3, -6.584137, 1, -0.5, 0.5, 0.5,
-4.560407, 3, -6.584137, 1, 1.5, 0.5, 0.5,
-4.560407, 3, -6.584137, 0, 1.5, 0.5, 0.5
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
-4.023347, -3.106545, -4,
-4.023347, -3.106545, 4,
-4.023347, -3.106545, -4,
-4.202367, -3.264512, -4,
-4.023347, -3.106545, -2,
-4.202367, -3.264512, -2,
-4.023347, -3.106545, 0,
-4.202367, -3.264512, 0,
-4.023347, -3.106545, 2,
-4.202367, -3.264512, 2,
-4.023347, -3.106545, 4,
-4.202367, -3.264512, 4
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
-4.560407, -3.580446, -4, 0, -0.5, 0.5, 0.5,
-4.560407, -3.580446, -4, 1, -0.5, 0.5, 0.5,
-4.560407, -3.580446, -4, 1, 1.5, 0.5, 0.5,
-4.560407, -3.580446, -4, 0, 1.5, 0.5, 0.5,
-4.560407, -3.580446, -2, 0, -0.5, 0.5, 0.5,
-4.560407, -3.580446, -2, 1, -0.5, 0.5, 0.5,
-4.560407, -3.580446, -2, 1, 1.5, 0.5, 0.5,
-4.560407, -3.580446, -2, 0, 1.5, 0.5, 0.5,
-4.560407, -3.580446, 0, 0, -0.5, 0.5, 0.5,
-4.560407, -3.580446, 0, 1, -0.5, 0.5, 0.5,
-4.560407, -3.580446, 0, 1, 1.5, 0.5, 0.5,
-4.560407, -3.580446, 0, 0, 1.5, 0.5, 0.5,
-4.560407, -3.580446, 2, 0, -0.5, 0.5, 0.5,
-4.560407, -3.580446, 2, 1, -0.5, 0.5, 0.5,
-4.560407, -3.580446, 2, 1, 1.5, 0.5, 0.5,
-4.560407, -3.580446, 2, 0, 1.5, 0.5, 0.5,
-4.560407, -3.580446, 4, 0, -0.5, 0.5, 0.5,
-4.560407, -3.580446, 4, 1, -0.5, 0.5, 0.5,
-4.560407, -3.580446, 4, 1, 1.5, 0.5, 0.5,
-4.560407, -3.580446, 4, 0, 1.5, 0.5, 0.5
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
-4.023347, -3.106545, -5.722825,
-4.023347, 3.212132, -5.722825,
-4.023347, -3.106545, 5.761344,
-4.023347, 3.212132, 5.761344,
-4.023347, -3.106545, -5.722825,
-4.023347, -3.106545, 5.761344,
-4.023347, 3.212132, -5.722825,
-4.023347, 3.212132, 5.761344,
-4.023347, -3.106545, -5.722825,
3.137456, -3.106545, -5.722825,
-4.023347, -3.106545, 5.761344,
3.137456, -3.106545, 5.761344,
-4.023347, 3.212132, -5.722825,
3.137456, 3.212132, -5.722825,
-4.023347, 3.212132, 5.761344,
3.137456, 3.212132, 5.761344,
3.137456, -3.106545, -5.722825,
3.137456, 3.212132, -5.722825,
3.137456, -3.106545, 5.761344,
3.137456, 3.212132, 5.761344,
3.137456, -3.106545, -5.722825,
3.137456, -3.106545, 5.761344,
3.137456, 3.212132, -5.722825,
3.137456, 3.212132, 5.761344
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
var radius = 7.97562;
var distance = 35.48444;
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
mvMatrix.translate( 0.4429454, -0.05279374, -0.01925945 );
mvMatrix.scale( 1.20425, 1.364747, 0.7508943 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.48444);
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
heptenophos<-read.table("heptenophos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-heptenophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'heptenophos' not found
```

```r
y<-heptenophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'heptenophos' not found
```

```r
z<-heptenophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'heptenophos' not found
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
-3.919063, -0.9589508, -1.99144, 0, 0, 1, 1, 1,
-2.698224, -0.02481679, -2.742171, 1, 0, 0, 1, 1,
-2.596012, -1.195931, -1.018828, 1, 0, 0, 1, 1,
-2.490541, 0.662873, -0.1876886, 1, 0, 0, 1, 1,
-2.410085, 1.058393, -0.5956522, 1, 0, 0, 1, 1,
-2.402853, 0.02972358, -1.694595, 1, 0, 0, 1, 1,
-2.359973, -0.5748154, -2.140337, 0, 0, 0, 1, 1,
-2.343545, 0.9238918, -0.6731758, 0, 0, 0, 1, 1,
-2.310447, -2.725267, -1.303198, 0, 0, 0, 1, 1,
-2.28865, 1.142175, -2.282569, 0, 0, 0, 1, 1,
-2.248147, -0.1968297, -2.741017, 0, 0, 0, 1, 1,
-2.228831, 1.3156, -1.767255, 0, 0, 0, 1, 1,
-2.198119, 0.6783942, 0.07249628, 0, 0, 0, 1, 1,
-2.176728, 2.016998, -1.644729, 1, 1, 1, 1, 1,
-2.069349, 1.721377, -0.4355423, 1, 1, 1, 1, 1,
-2.011722, 1.25443, -0.3320717, 1, 1, 1, 1, 1,
-1.962632, 0.1927397, -2.437254, 1, 1, 1, 1, 1,
-1.962593, 0.1519245, -2.01509, 1, 1, 1, 1, 1,
-1.960051, -0.06342936, -2.270027, 1, 1, 1, 1, 1,
-1.952621, -0.7959253, -0.9601945, 1, 1, 1, 1, 1,
-1.950735, -0.5555095, -1.694526, 1, 1, 1, 1, 1,
-1.948204, 0.8796954, -2.085575, 1, 1, 1, 1, 1,
-1.946513, 2.625925, -1.101908, 1, 1, 1, 1, 1,
-1.933875, 0.5360433, -1.207762, 1, 1, 1, 1, 1,
-1.932388, 0.5046858, -0.9410295, 1, 1, 1, 1, 1,
-1.928338, 2.33098, -1.47579, 1, 1, 1, 1, 1,
-1.926153, 1.503407, -1.011663, 1, 1, 1, 1, 1,
-1.924337, 0.2535212, -1.258373, 1, 1, 1, 1, 1,
-1.911599, 0.01568398, -2.026944, 0, 0, 1, 1, 1,
-1.908669, -0.6381787, -2.339947, 1, 0, 0, 1, 1,
-1.898416, -0.004393143, -0.4216716, 1, 0, 0, 1, 1,
-1.854123, 1.653212, -0.4404337, 1, 0, 0, 1, 1,
-1.84454, -0.6806651, -2.819289, 1, 0, 0, 1, 1,
-1.840854, -1.448199, -0.8464277, 1, 0, 0, 1, 1,
-1.811571, -0.04864492, -2.434286, 0, 0, 0, 1, 1,
-1.809278, -1.319658, -2.158378, 0, 0, 0, 1, 1,
-1.79338, -0.8999968, -2.093015, 0, 0, 0, 1, 1,
-1.786221, -1.653052, -4.145264, 0, 0, 0, 1, 1,
-1.78343, 0.5170823, -0.5010138, 0, 0, 0, 1, 1,
-1.781158, 0.1850343, -1.944849, 0, 0, 0, 1, 1,
-1.770645, 0.04272452, 0.1635599, 0, 0, 0, 1, 1,
-1.763985, -0.7761912, -1.697851, 1, 1, 1, 1, 1,
-1.746194, 0.7487404, -1.154435, 1, 1, 1, 1, 1,
-1.716182, -0.9631847, -3.850099, 1, 1, 1, 1, 1,
-1.712481, -0.8125766, -1.306605, 1, 1, 1, 1, 1,
-1.70963, 0.2148955, -2.074836, 1, 1, 1, 1, 1,
-1.704781, -0.3495496, -0.4082717, 1, 1, 1, 1, 1,
-1.701627, 2.642735, 1.959507, 1, 1, 1, 1, 1,
-1.695371, -1.160972, -2.543427, 1, 1, 1, 1, 1,
-1.673281, -0.4246729, -3.120736, 1, 1, 1, 1, 1,
-1.67106, 0.4669751, -1.550688, 1, 1, 1, 1, 1,
-1.64598, -1.56466, -1.777277, 1, 1, 1, 1, 1,
-1.632521, -0.04193896, -2.279152, 1, 1, 1, 1, 1,
-1.626553, -1.762833, -3.055138, 1, 1, 1, 1, 1,
-1.618445, 0.1182564, -1.887545, 1, 1, 1, 1, 1,
-1.613368, -0.7171649, -2.557744, 1, 1, 1, 1, 1,
-1.609855, -1.172587, -3.04239, 0, 0, 1, 1, 1,
-1.608041, 0.3617587, -1.156765, 1, 0, 0, 1, 1,
-1.605515, 0.1562717, -1.851525, 1, 0, 0, 1, 1,
-1.598415, -0.7501568, -3.398156, 1, 0, 0, 1, 1,
-1.596628, -0.499545, -0.460788, 1, 0, 0, 1, 1,
-1.594928, -1.944363, -2.488788, 1, 0, 0, 1, 1,
-1.594348, -1.334555, -1.345351, 0, 0, 0, 1, 1,
-1.593942, 0.5647725, -1.921387, 0, 0, 0, 1, 1,
-1.589774, 0.9401432, -0.7138576, 0, 0, 0, 1, 1,
-1.581569, -1.980173, -2.124907, 0, 0, 0, 1, 1,
-1.581431, 0.1713241, -2.62745, 0, 0, 0, 1, 1,
-1.576807, -0.1223397, -0.8947262, 0, 0, 0, 1, 1,
-1.563133, -0.5814241, -0.8303606, 0, 0, 0, 1, 1,
-1.561499, 0.8220794, -0.590596, 1, 1, 1, 1, 1,
-1.534303, 0.837511, 0.3274072, 1, 1, 1, 1, 1,
-1.507651, 0.4155761, -0.3217886, 1, 1, 1, 1, 1,
-1.498423, -0.8340836, -1.564232, 1, 1, 1, 1, 1,
-1.497245, -0.46552, -2.19051, 1, 1, 1, 1, 1,
-1.48584, -1.607443, -2.138473, 1, 1, 1, 1, 1,
-1.476213, 1.230789, 0.5846674, 1, 1, 1, 1, 1,
-1.472847, -0.9413421, -1.215816, 1, 1, 1, 1, 1,
-1.467423, 0.2635804, -1.213722, 1, 1, 1, 1, 1,
-1.459625, 1.329809, -0.9350398, 1, 1, 1, 1, 1,
-1.459506, -1.560836, -2.613707, 1, 1, 1, 1, 1,
-1.451423, 0.2681196, -3.714497, 1, 1, 1, 1, 1,
-1.446985, -1.155763, -1.927829, 1, 1, 1, 1, 1,
-1.436221, 0.04949698, -1.687313, 1, 1, 1, 1, 1,
-1.434278, -0.5170353, -1.817388, 1, 1, 1, 1, 1,
-1.432209, 0.2331004, -1.911312, 0, 0, 1, 1, 1,
-1.424656, -0.3517633, -1.349418, 1, 0, 0, 1, 1,
-1.419191, 1.299299, -0.9676692, 1, 0, 0, 1, 1,
-1.394483, -0.9957885, -3.029462, 1, 0, 0, 1, 1,
-1.391243, -1.134632, -4.097363, 1, 0, 0, 1, 1,
-1.387829, 1.326059, -2.817102, 1, 0, 0, 1, 1,
-1.384921, 1.020517, -2.0141, 0, 0, 0, 1, 1,
-1.380637, 0.2339809, -1.253194, 0, 0, 0, 1, 1,
-1.379135, 1.808682, -0.220867, 0, 0, 0, 1, 1,
-1.36894, 0.6684876, -1.221622, 0, 0, 0, 1, 1,
-1.354279, -1.474139, -1.237759, 0, 0, 0, 1, 1,
-1.348147, -0.06215623, -0.7294583, 0, 0, 0, 1, 1,
-1.3462, 0.1344209, -1.04353, 0, 0, 0, 1, 1,
-1.339434, 1.348938, -2.637803, 1, 1, 1, 1, 1,
-1.333946, 1.053453, -0.9268327, 1, 1, 1, 1, 1,
-1.315122, 1.586365, -1.793391, 1, 1, 1, 1, 1,
-1.314547, 2.00802, -0.1729927, 1, 1, 1, 1, 1,
-1.312093, -0.7900999, -2.605804, 1, 1, 1, 1, 1,
-1.310649, 0.7423922, -2.251714, 1, 1, 1, 1, 1,
-1.308892, 0.6815038, -1.330577, 1, 1, 1, 1, 1,
-1.301436, 0.5366767, -1.042465, 1, 1, 1, 1, 1,
-1.299772, 0.2317165, -3.492176, 1, 1, 1, 1, 1,
-1.299028, -1.015175, -0.4334446, 1, 1, 1, 1, 1,
-1.29839, -0.0004886484, -1.734862, 1, 1, 1, 1, 1,
-1.294886, 0.5088744, -2.085075, 1, 1, 1, 1, 1,
-1.292679, 0.6530481, -1.933617, 1, 1, 1, 1, 1,
-1.292386, 0.9910631, -0.4054797, 1, 1, 1, 1, 1,
-1.290146, -0.8595407, -2.646179, 1, 1, 1, 1, 1,
-1.288645, 2.137121, -0.7863387, 0, 0, 1, 1, 1,
-1.284351, 0.6028655, -1.295286, 1, 0, 0, 1, 1,
-1.281461, 0.9161478, -0.3125267, 1, 0, 0, 1, 1,
-1.278708, -0.5878264, -3.919144, 1, 0, 0, 1, 1,
-1.257786, 0.7673149, -1.604193, 1, 0, 0, 1, 1,
-1.253919, -0.8016129, -1.310554, 1, 0, 0, 1, 1,
-1.247532, 1.501599, -0.896138, 0, 0, 0, 1, 1,
-1.235643, -0.8537631, -0.1601691, 0, 0, 0, 1, 1,
-1.230659, 0.1553386, -1.166489, 0, 0, 0, 1, 1,
-1.227883, -0.6773391, -1.159404, 0, 0, 0, 1, 1,
-1.220224, 0.3558845, -1.371678, 0, 0, 0, 1, 1,
-1.206977, 0.6358956, -1.244734, 0, 0, 0, 1, 1,
-1.204287, -0.01689158, -1.657452, 0, 0, 0, 1, 1,
-1.186496, 1.193377, -1.082044, 1, 1, 1, 1, 1,
-1.184144, -0.7865325, -1.782334, 1, 1, 1, 1, 1,
-1.179704, -0.07050995, -1.176853, 1, 1, 1, 1, 1,
-1.168165, 0.5190876, -0.08277213, 1, 1, 1, 1, 1,
-1.162672, -0.4047244, -3.174858, 1, 1, 1, 1, 1,
-1.161548, -0.3267715, -2.286333, 1, 1, 1, 1, 1,
-1.161501, 0.3443752, -1.029709, 1, 1, 1, 1, 1,
-1.141575, 0.8039393, -0.03017417, 1, 1, 1, 1, 1,
-1.133703, -0.4781435, 0.4599882, 1, 1, 1, 1, 1,
-1.130091, -0.08229264, -3.00345, 1, 1, 1, 1, 1,
-1.129506, 0.2627806, -2.543062, 1, 1, 1, 1, 1,
-1.128116, 0.5674236, -1.050234, 1, 1, 1, 1, 1,
-1.125842, 0.1532609, -1.723225, 1, 1, 1, 1, 1,
-1.121409, 0.7596303, -1.794662, 1, 1, 1, 1, 1,
-1.114424, 0.2636277, -0.6946455, 1, 1, 1, 1, 1,
-1.114255, -2.151181, -2.694926, 0, 0, 1, 1, 1,
-1.11181, 1.728513, -2.517579, 1, 0, 0, 1, 1,
-1.110312, -1.232789, -2.477901, 1, 0, 0, 1, 1,
-1.108549, -1.275101, -1.72638, 1, 0, 0, 1, 1,
-1.106716, 0.0864181, -0.1521927, 1, 0, 0, 1, 1,
-1.103874, -0.596642, -1.890615, 1, 0, 0, 1, 1,
-1.099575, 1.855992, -0.5484413, 0, 0, 0, 1, 1,
-1.096536, -0.1822365, -2.427413, 0, 0, 0, 1, 1,
-1.076322, -1.264647, -1.864682, 0, 0, 0, 1, 1,
-1.072266, -2.586667, -1.99838, 0, 0, 0, 1, 1,
-1.066611, -0.3865764, -2.83581, 0, 0, 0, 1, 1,
-1.063471, -2.098322, -2.018261, 0, 0, 0, 1, 1,
-1.05739, 1.416562, -0.6927032, 0, 0, 0, 1, 1,
-1.05674, -0.8452869, -3.421203, 1, 1, 1, 1, 1,
-1.054838, 1.479439, -1.161234, 1, 1, 1, 1, 1,
-1.051116, -0.39138, -1.387934, 1, 1, 1, 1, 1,
-1.047338, 0.9810434, 0.2036487, 1, 1, 1, 1, 1,
-1.044224, 1.500978, -2.292398, 1, 1, 1, 1, 1,
-1.043497, 0.4430404, 1.09312, 1, 1, 1, 1, 1,
-1.039366, -0.4984323, -2.957691, 1, 1, 1, 1, 1,
-1.03625, 0.9303548, -1.880233, 1, 1, 1, 1, 1,
-1.031413, 0.1072213, -1.371474, 1, 1, 1, 1, 1,
-1.022723, 0.09545913, -1.854295, 1, 1, 1, 1, 1,
-1.021004, 1.12331, -1.129354, 1, 1, 1, 1, 1,
-1.019576, 0.589681, -1.493608, 1, 1, 1, 1, 1,
-1.016761, 0.357922, -1.60903, 1, 1, 1, 1, 1,
-1.016726, 0.8482999, 0.06961937, 1, 1, 1, 1, 1,
-1.013661, -1.336829, -3.184569, 1, 1, 1, 1, 1,
-1.007972, 1.181923, 0.2504408, 0, 0, 1, 1, 1,
-1.002782, -1.033898, -5.12845, 1, 0, 0, 1, 1,
-1.002548, 0.3056753, 1.242817, 1, 0, 0, 1, 1,
-1.001851, -0.3803218, -3.410334, 1, 0, 0, 1, 1,
-0.9987112, 1.8352, -0.246728, 1, 0, 0, 1, 1,
-0.9948867, 0.8569946, -1.908493, 1, 0, 0, 1, 1,
-0.991838, -0.5416999, -3.284184, 0, 0, 0, 1, 1,
-0.9898742, -2.026864, -3.630162, 0, 0, 0, 1, 1,
-0.9866824, -0.2039107, -0.4670067, 0, 0, 0, 1, 1,
-0.9752737, -1.311384, -1.415241, 0, 0, 0, 1, 1,
-0.9712395, 1.983502, -0.8910537, 0, 0, 0, 1, 1,
-0.9667715, 1.176251, -0.6202578, 0, 0, 0, 1, 1,
-0.9648993, -1.85098, -4.203022, 0, 0, 0, 1, 1,
-0.9632963, -0.805087, -1.696427, 1, 1, 1, 1, 1,
-0.9625937, 0.8415588, -1.399294, 1, 1, 1, 1, 1,
-0.9499842, -0.05943026, -0.006760979, 1, 1, 1, 1, 1,
-0.949711, -0.746963, -1.315426, 1, 1, 1, 1, 1,
-0.9458541, 0.4174447, 0.3854024, 1, 1, 1, 1, 1,
-0.9453226, 0.894172, -0.6969855, 1, 1, 1, 1, 1,
-0.9419506, 0.6859571, -0.8182696, 1, 1, 1, 1, 1,
-0.9409564, 0.6976337, -1.558035, 1, 1, 1, 1, 1,
-0.9368826, 0.1873023, -2.553763, 1, 1, 1, 1, 1,
-0.9359483, 0.4225664, -0.9228858, 1, 1, 1, 1, 1,
-0.9350848, -0.3426427, -1.85704, 1, 1, 1, 1, 1,
-0.9343054, 0.2540526, 0.1217128, 1, 1, 1, 1, 1,
-0.9299057, -0.7686159, -0.87622, 1, 1, 1, 1, 1,
-0.9247518, -0.6793009, -1.029775, 1, 1, 1, 1, 1,
-0.9202108, -1.503458, -3.451759, 1, 1, 1, 1, 1,
-0.9124928, -0.1732569, -0.3977365, 0, 0, 1, 1, 1,
-0.9067308, 1.070199, 0.1705579, 1, 0, 0, 1, 1,
-0.903941, -0.1420616, -0.4599658, 1, 0, 0, 1, 1,
-0.9025552, 0.2460376, 0.586394, 1, 0, 0, 1, 1,
-0.8945947, -0.6163665, -3.693989, 1, 0, 0, 1, 1,
-0.8903694, 0.3937672, -1.439996, 1, 0, 0, 1, 1,
-0.8901347, 0.2684605, -0.7026001, 0, 0, 0, 1, 1,
-0.8849393, -0.3588603, -1.785178, 0, 0, 0, 1, 1,
-0.881887, -0.4682393, -1.111971, 0, 0, 0, 1, 1,
-0.8772914, 0.4436246, -0.5663928, 0, 0, 0, 1, 1,
-0.8714128, -0.1939913, -0.4073196, 0, 0, 0, 1, 1,
-0.8712657, -2.287726, -1.847937, 0, 0, 0, 1, 1,
-0.8675203, 1.174433, -0.7439553, 0, 0, 0, 1, 1,
-0.8659654, 1.666166, -0.9374449, 1, 1, 1, 1, 1,
-0.8658295, -0.4899981, -0.7096029, 1, 1, 1, 1, 1,
-0.8634434, -1.311586, -2.549447, 1, 1, 1, 1, 1,
-0.8618744, -0.6985606, -2.365902, 1, 1, 1, 1, 1,
-0.8573425, -0.4120977, -1.59669, 1, 1, 1, 1, 1,
-0.8533193, -0.3477536, -1.8397, 1, 1, 1, 1, 1,
-0.8521367, -0.7434832, -1.012189, 1, 1, 1, 1, 1,
-0.8468764, 0.3263938, -1.990266, 1, 1, 1, 1, 1,
-0.8468402, -0.1127948, 0.4968427, 1, 1, 1, 1, 1,
-0.8467558, 1.221234, -0.8695895, 1, 1, 1, 1, 1,
-0.8453049, 1.52581, -2.20502, 1, 1, 1, 1, 1,
-0.8376505, 0.2953783, -0.5453787, 1, 1, 1, 1, 1,
-0.8373301, -0.1944611, -0.3532924, 1, 1, 1, 1, 1,
-0.83081, -0.4348928, -3.809271, 1, 1, 1, 1, 1,
-0.8272915, -0.3282253, -1.638741, 1, 1, 1, 1, 1,
-0.8184919, 1.561363, -0.540225, 0, 0, 1, 1, 1,
-0.8175313, -0.01116776, -2.637238, 1, 0, 0, 1, 1,
-0.8164105, -1.100741, -1.480443, 1, 0, 0, 1, 1,
-0.8058843, 0.2938571, 1.296484, 1, 0, 0, 1, 1,
-0.8048409, 0.03143116, -2.331661, 1, 0, 0, 1, 1,
-0.8001458, 1.242817, -2.322953, 1, 0, 0, 1, 1,
-0.7969945, -0.5000307, -2.397531, 0, 0, 0, 1, 1,
-0.7968302, -0.05470356, -2.768095, 0, 0, 0, 1, 1,
-0.7960145, 0.5338609, -0.9964949, 0, 0, 0, 1, 1,
-0.7948163, -0.2141893, -1.673325, 0, 0, 0, 1, 1,
-0.7946787, 0.733859, -1.544503, 0, 0, 0, 1, 1,
-0.7941101, 1.641801, -0.8237241, 0, 0, 0, 1, 1,
-0.7925789, 0.9950919, -0.9372702, 0, 0, 0, 1, 1,
-0.7914017, -2.290025, -3.444507, 1, 1, 1, 1, 1,
-0.790795, 1.263875, -0.8796012, 1, 1, 1, 1, 1,
-0.7876573, -0.4019141, -2.537375, 1, 1, 1, 1, 1,
-0.7863271, -0.3008157, -2.536907, 1, 1, 1, 1, 1,
-0.7853028, 1.831515, -1.190007, 1, 1, 1, 1, 1,
-0.7800699, -0.6041421, -3.347535, 1, 1, 1, 1, 1,
-0.7733891, -1.976006, -3.036832, 1, 1, 1, 1, 1,
-0.772432, 1.294694, -1.569339, 1, 1, 1, 1, 1,
-0.7694637, -1.221424, -3.116578, 1, 1, 1, 1, 1,
-0.7690055, -0.2393327, -1.472801, 1, 1, 1, 1, 1,
-0.7650652, 0.8106123, 0.3979627, 1, 1, 1, 1, 1,
-0.7631983, -1.105552, -1.843261, 1, 1, 1, 1, 1,
-0.7557232, -0.3917431, -0.6923086, 1, 1, 1, 1, 1,
-0.7459558, -0.1884574, -1.961869, 1, 1, 1, 1, 1,
-0.7404113, -1.785172, -2.108777, 1, 1, 1, 1, 1,
-0.7389698, -1.375223, -3.725506, 0, 0, 1, 1, 1,
-0.7360126, 0.9181315, -0.1492785, 1, 0, 0, 1, 1,
-0.7350193, -1.215422, -2.252985, 1, 0, 0, 1, 1,
-0.7220408, -0.808116, -1.342874, 1, 0, 0, 1, 1,
-0.7136585, -0.1079523, -1.900286, 1, 0, 0, 1, 1,
-0.713352, 0.6874201, -1.758565, 1, 0, 0, 1, 1,
-0.71324, -1.246456, -2.487656, 0, 0, 0, 1, 1,
-0.7124181, -0.1282176, -2.297495, 0, 0, 0, 1, 1,
-0.7105217, 0.3668292, -0.1857339, 0, 0, 0, 1, 1,
-0.7071578, -0.4877986, -1.972097, 0, 0, 0, 1, 1,
-0.7028401, -0.2422713, -2.524749, 0, 0, 0, 1, 1,
-0.6961038, -1.554301, -0.7414931, 0, 0, 0, 1, 1,
-0.6955453, 0.9388998, -0.7356518, 0, 0, 0, 1, 1,
-0.6919147, 0.02506461, -1.619943, 1, 1, 1, 1, 1,
-0.6915795, 1.304816, -1.210641, 1, 1, 1, 1, 1,
-0.6886269, -0.2902108, -0.9439555, 1, 1, 1, 1, 1,
-0.6845134, 0.1605264, -2.752121, 1, 1, 1, 1, 1,
-0.6807663, -0.0962996, 0.1977093, 1, 1, 1, 1, 1,
-0.6786308, -1.527933, -3.837881, 1, 1, 1, 1, 1,
-0.6668262, 0.87019, -0.9541068, 1, 1, 1, 1, 1,
-0.6667926, 0.1061371, -1.026699, 1, 1, 1, 1, 1,
-0.6642856, -0.9196712, -2.163121, 1, 1, 1, 1, 1,
-0.663634, 0.3063402, -2.032715, 1, 1, 1, 1, 1,
-0.6595666, -2.104316, -4.544902, 1, 1, 1, 1, 1,
-0.656846, 0.8854743, 0.7188943, 1, 1, 1, 1, 1,
-0.6550637, -0.3307994, -0.6596835, 1, 1, 1, 1, 1,
-0.6548862, -2.755123, -2.05147, 1, 1, 1, 1, 1,
-0.6548001, -1.49042, -2.020934, 1, 1, 1, 1, 1,
-0.6526708, -0.5574213, -0.4119499, 0, 0, 1, 1, 1,
-0.6489502, -1.287369, -2.456042, 1, 0, 0, 1, 1,
-0.6434516, -0.3523995, -2.382749, 1, 0, 0, 1, 1,
-0.6410935, -1.267485, -4.241428, 1, 0, 0, 1, 1,
-0.6363536, 1.666541, -0.04508565, 1, 0, 0, 1, 1,
-0.6304837, -1.515397, -2.598118, 1, 0, 0, 1, 1,
-0.628284, -0.888552, -2.913023, 0, 0, 0, 1, 1,
-0.6247513, 0.8939199, -0.005431003, 0, 0, 0, 1, 1,
-0.6237771, 0.5136644, -0.9510073, 0, 0, 0, 1, 1,
-0.6226932, 0.07760513, -1.696118, 0, 0, 0, 1, 1,
-0.621003, 1.440968, -1.094025, 0, 0, 0, 1, 1,
-0.620058, -0.7868336, -2.946002, 0, 0, 0, 1, 1,
-0.6162086, -0.9269318, -2.846797, 0, 0, 0, 1, 1,
-0.6142083, -2.12107, -4.418104, 1, 1, 1, 1, 1,
-0.6131086, -1.101224, -2.631145, 1, 1, 1, 1, 1,
-0.6113588, 0.5813296, -1.004048, 1, 1, 1, 1, 1,
-0.6085504, 0.4837793, -1.519476, 1, 1, 1, 1, 1,
-0.6046526, 1.407995, -0.6549484, 1, 1, 1, 1, 1,
-0.6031008, 1.064827, 1.5619, 1, 1, 1, 1, 1,
-0.5999275, 1.060617, -1.237263, 1, 1, 1, 1, 1,
-0.5963125, 0.1820742, -0.04402845, 1, 1, 1, 1, 1,
-0.58833, -1.008211, -2.863787, 1, 1, 1, 1, 1,
-0.5867836, -1.451726, -2.829839, 1, 1, 1, 1, 1,
-0.5865116, -1.772205, -1.791907, 1, 1, 1, 1, 1,
-0.5859533, 1.882214, -0.92256, 1, 1, 1, 1, 1,
-0.5837421, 0.6849316, -0.7769861, 1, 1, 1, 1, 1,
-0.5814293, -1.716367, -3.049579, 1, 1, 1, 1, 1,
-0.5756576, -0.7815586, -2.432006, 1, 1, 1, 1, 1,
-0.5705697, -0.8877037, -1.085499, 0, 0, 1, 1, 1,
-0.5652354, 0.03892306, -2.541425, 1, 0, 0, 1, 1,
-0.5625367, 0.4947374, -1.293491, 1, 0, 0, 1, 1,
-0.5624709, -1.118048, -2.280588, 1, 0, 0, 1, 1,
-0.55673, 0.9767683, -1.461682, 1, 0, 0, 1, 1,
-0.5548019, -0.7681992, -3.540085, 1, 0, 0, 1, 1,
-0.5535452, -0.4572769, -2.470227, 0, 0, 0, 1, 1,
-0.5528734, 0.5349705, -1.060063, 0, 0, 0, 1, 1,
-0.5523392, -0.222181, -1.18865, 0, 0, 0, 1, 1,
-0.5478756, 0.8502704, 0.9395658, 0, 0, 0, 1, 1,
-0.5457187, -0.08366571, -3.016586, 0, 0, 0, 1, 1,
-0.5435756, 0.688563, 0.0418692, 0, 0, 0, 1, 1,
-0.5421731, -1.583024, -2.171598, 0, 0, 0, 1, 1,
-0.5416251, 0.21527, -3.090252, 1, 1, 1, 1, 1,
-0.5319035, -1.940064, -2.263126, 1, 1, 1, 1, 1,
-0.5318733, -0.1033603, -2.880694, 1, 1, 1, 1, 1,
-0.5285642, 1.843319, -0.5047201, 1, 1, 1, 1, 1,
-0.5232595, 0.6823432, -0.3211793, 1, 1, 1, 1, 1,
-0.5211109, -0.5225265, -4.44037, 1, 1, 1, 1, 1,
-0.5187918, 0.1698748, 0.2601934, 1, 1, 1, 1, 1,
-0.5143685, 1.41781, 0.5432169, 1, 1, 1, 1, 1,
-0.5125308, 0.4132613, -0.9724955, 1, 1, 1, 1, 1,
-0.5110122, -0.5300384, -2.89556, 1, 1, 1, 1, 1,
-0.5100674, -1.007667, -2.149395, 1, 1, 1, 1, 1,
-0.509309, -0.2565639, -1.684167, 1, 1, 1, 1, 1,
-0.5092333, 1.233642, -0.9533924, 1, 1, 1, 1, 1,
-0.5082908, -0.6079028, -3.774932, 1, 1, 1, 1, 1,
-0.4949151, -0.9449495, -3.312058, 1, 1, 1, 1, 1,
-0.4863971, -1.731689, -1.692463, 0, 0, 1, 1, 1,
-0.4853104, -0.8190746, -2.36881, 1, 0, 0, 1, 1,
-0.4820816, 0.2599215, -0.8198312, 1, 0, 0, 1, 1,
-0.4808577, -0.987738, -2.84384, 1, 0, 0, 1, 1,
-0.4793753, 0.5219175, -1.238567, 1, 0, 0, 1, 1,
-0.4736916, 1.497879, -1.511701, 1, 0, 0, 1, 1,
-0.47339, -0.2267106, -2.044304, 0, 0, 0, 1, 1,
-0.4642424, 0.9248052, 0.8908758, 0, 0, 0, 1, 1,
-0.4632531, -0.505843, -1.542334, 0, 0, 0, 1, 1,
-0.4549939, -0.5078886, -2.030982, 0, 0, 0, 1, 1,
-0.4489706, 2.18068, -1.481348, 0, 0, 0, 1, 1,
-0.4459502, -2.138966, -1.800964, 0, 0, 0, 1, 1,
-0.4417475, 0.3016862, -0.5318335, 0, 0, 0, 1, 1,
-0.4406664, 1.021669, -1.034346, 1, 1, 1, 1, 1,
-0.4397057, 0.1789975, -2.693933, 1, 1, 1, 1, 1,
-0.4312927, 1.933756, -0.1265833, 1, 1, 1, 1, 1,
-0.4279869, -0.8514791, -3.709561, 1, 1, 1, 1, 1,
-0.4191379, -0.2375548, -2.083526, 1, 1, 1, 1, 1,
-0.4174578, 0.870418, 0.2077956, 1, 1, 1, 1, 1,
-0.4128422, 0.5484267, -0.2421481, 1, 1, 1, 1, 1,
-0.4117997, -0.7490295, -3.559158, 1, 1, 1, 1, 1,
-0.4077773, 0.9273845, -1.018881, 1, 1, 1, 1, 1,
-0.402223, -0.7726694, -3.388162, 1, 1, 1, 1, 1,
-0.3977237, -1.296007, -4.029453, 1, 1, 1, 1, 1,
-0.3911281, -0.2751694, -0.6851279, 1, 1, 1, 1, 1,
-0.3851457, -1.516719, -3.539315, 1, 1, 1, 1, 1,
-0.382165, 0.2218464, 0.4141037, 1, 1, 1, 1, 1,
-0.3807653, 0.2838611, -0.4285019, 1, 1, 1, 1, 1,
-0.3785875, 0.2668956, -0.2765984, 0, 0, 1, 1, 1,
-0.3686512, -1.134173, -2.992074, 1, 0, 0, 1, 1,
-0.3626669, -0.1125367, -3.052848, 1, 0, 0, 1, 1,
-0.3600041, 0.1327188, -1.198734, 1, 0, 0, 1, 1,
-0.3564672, 1.963709, -0.3122038, 1, 0, 0, 1, 1,
-0.3527732, 1.141052, -0.7377521, 1, 0, 0, 1, 1,
-0.3499117, -1.118485, -2.202233, 0, 0, 0, 1, 1,
-0.3487235, -0.2487767, -2.362127, 0, 0, 0, 1, 1,
-0.3482875, 1.706929, 1.631922, 0, 0, 0, 1, 1,
-0.3458034, 1.612811, -0.6314485, 0, 0, 0, 1, 1,
-0.3413786, 0.5179608, 0.5156113, 0, 0, 0, 1, 1,
-0.3401383, 0.1749494, -2.162631, 0, 0, 0, 1, 1,
-0.3401138, -1.038129, -2.260835, 0, 0, 0, 1, 1,
-0.3367142, 1.048276, -0.1489125, 1, 1, 1, 1, 1,
-0.3347916, 1.475727, 0.6514075, 1, 1, 1, 1, 1,
-0.3330198, 0.9865567, -0.9546481, 1, 1, 1, 1, 1,
-0.3301553, -1.17136, -2.682875, 1, 1, 1, 1, 1,
-0.3296891, 1.209578, -1.735652, 1, 1, 1, 1, 1,
-0.3261358, -1.391556, -3.670447, 1, 1, 1, 1, 1,
-0.3260792, 0.9306848, 1.270735, 1, 1, 1, 1, 1,
-0.3209058, -0.7422361, -2.712903, 1, 1, 1, 1, 1,
-0.3184509, 0.2484088, -1.228206, 1, 1, 1, 1, 1,
-0.3133552, 0.1307299, -1.028082, 1, 1, 1, 1, 1,
-0.3126709, 0.8477855, 1.608887, 1, 1, 1, 1, 1,
-0.3099015, -0.7766394, -1.103016, 1, 1, 1, 1, 1,
-0.3084125, -1.917252, -2.88182, 1, 1, 1, 1, 1,
-0.3082978, -0.4253493, -2.789797, 1, 1, 1, 1, 1,
-0.3082942, -0.4908649, -1.268474, 1, 1, 1, 1, 1,
-0.306183, -0.5515803, -1.260735, 0, 0, 1, 1, 1,
-0.3060204, 1.496428, 0.576691, 1, 0, 0, 1, 1,
-0.3043956, -0.3006765, -1.609331, 1, 0, 0, 1, 1,
-0.3025283, 1.282698, -0.3219655, 1, 0, 0, 1, 1,
-0.3013119, -1.072863, -2.956795, 1, 0, 0, 1, 1,
-0.299091, -0.9522128, -1.658542, 1, 0, 0, 1, 1,
-0.2963662, 0.2797027, -0.7885811, 0, 0, 0, 1, 1,
-0.282337, -1.782631, -2.436278, 0, 0, 0, 1, 1,
-0.2779328, 1.513613, -0.9962947, 0, 0, 0, 1, 1,
-0.2775792, -1.381399, -2.428923, 0, 0, 0, 1, 1,
-0.2750306, 0.1759001, -2.442291, 0, 0, 0, 1, 1,
-0.2704836, 0.7290347, 0.6279564, 0, 0, 0, 1, 1,
-0.2636288, 0.3897127, -1.582767, 0, 0, 0, 1, 1,
-0.2631828, -1.303923, -4.17117, 1, 1, 1, 1, 1,
-0.2596825, -1.114227, -1.495344, 1, 1, 1, 1, 1,
-0.2591546, 2.425503, 0.8298732, 1, 1, 1, 1, 1,
-0.2567019, 1.416318, 1.77767, 1, 1, 1, 1, 1,
-0.2561069, -0.3024027, -3.084971, 1, 1, 1, 1, 1,
-0.2502707, 0.3955343, 0.0825412, 1, 1, 1, 1, 1,
-0.2490394, -0.03118704, -0.6309806, 1, 1, 1, 1, 1,
-0.2469415, 0.3988716, -0.3524868, 1, 1, 1, 1, 1,
-0.2450449, -1.214359, -4.158422, 1, 1, 1, 1, 1,
-0.240733, -1.415324, -3.409217, 1, 1, 1, 1, 1,
-0.2394672, 0.2789192, -0.5349401, 1, 1, 1, 1, 1,
-0.2393382, 0.381708, 0.1017388, 1, 1, 1, 1, 1,
-0.2369731, 0.415589, 1.170331, 1, 1, 1, 1, 1,
-0.233268, 1.330576, 1.023451, 1, 1, 1, 1, 1,
-0.2331912, -1.289726, -2.872103, 1, 1, 1, 1, 1,
-0.2240198, 0.8043433, -1.765344, 0, 0, 1, 1, 1,
-0.2235013, 1.341245, -0.1046317, 1, 0, 0, 1, 1,
-0.2198041, -0.698514, -2.679133, 1, 0, 0, 1, 1,
-0.2153931, 1.284935, -2.105027, 1, 0, 0, 1, 1,
-0.2150366, -0.5167336, -1.917843, 1, 0, 0, 1, 1,
-0.2120416, 0.6475123, -1.603067, 1, 0, 0, 1, 1,
-0.20786, 1.601041, -1.305066, 0, 0, 0, 1, 1,
-0.2009938, -0.04310403, -3.293211, 0, 0, 0, 1, 1,
-0.1986172, 2.003809, -1.177353, 0, 0, 0, 1, 1,
-0.1976007, -0.07504833, -2.208756, 0, 0, 0, 1, 1,
-0.1970865, 1.783532, -0.1720248, 0, 0, 0, 1, 1,
-0.1904131, -0.6059577, -3.076567, 0, 0, 0, 1, 1,
-0.1821792, 0.6578058, -0.6771464, 0, 0, 0, 1, 1,
-0.1819738, -0.7322162, -3.130627, 1, 1, 1, 1, 1,
-0.1793948, -1.355112, -2.164319, 1, 1, 1, 1, 1,
-0.1751001, 0.9074283, 0.04537868, 1, 1, 1, 1, 1,
-0.1724803, -0.1264644, -2.666323, 1, 1, 1, 1, 1,
-0.1720529, -1.050956, -3.474568, 1, 1, 1, 1, 1,
-0.1677211, 1.125364, -0.1187366, 1, 1, 1, 1, 1,
-0.1655622, 0.5516679, -0.8417485, 1, 1, 1, 1, 1,
-0.1592534, 1.033697, -0.9324888, 1, 1, 1, 1, 1,
-0.1563195, 1.118645, -0.4571922, 1, 1, 1, 1, 1,
-0.156021, -0.8691882, -4.595513, 1, 1, 1, 1, 1,
-0.1554873, -1.351976, -3.913188, 1, 1, 1, 1, 1,
-0.1517407, 0.2779863, 0.05136592, 1, 1, 1, 1, 1,
-0.1495413, -0.5791668, -3.16065, 1, 1, 1, 1, 1,
-0.1492064, 0.3423506, 0.6810075, 1, 1, 1, 1, 1,
-0.1487872, -0.7456259, -3.345675, 1, 1, 1, 1, 1,
-0.1480414, 0.842665, 0.3867368, 0, 0, 1, 1, 1,
-0.1473839, -0.8895594, -5.55558, 1, 0, 0, 1, 1,
-0.1467538, 0.684799, -1.192577, 1, 0, 0, 1, 1,
-0.1448289, 0.7810378, -0.007178211, 1, 0, 0, 1, 1,
-0.142111, 1.040973, 0.6071649, 1, 0, 0, 1, 1,
-0.1417148, -0.1933298, -2.777734, 1, 0, 0, 1, 1,
-0.1407453, -0.4884625, -3.108667, 0, 0, 0, 1, 1,
-0.1334864, -0.7377306, -2.526658, 0, 0, 0, 1, 1,
-0.1324255, 0.4185425, 0.09691273, 0, 0, 0, 1, 1,
-0.1314552, 1.064413, 0.7266647, 0, 0, 0, 1, 1,
-0.1286823, 1.588132, -1.731191, 0, 0, 0, 1, 1,
-0.1285013, -0.7823232, -2.353801, 0, 0, 0, 1, 1,
-0.1278094, 1.321598, -0.8058773, 0, 0, 0, 1, 1,
-0.1270771, 0.5294146, 0.8527859, 1, 1, 1, 1, 1,
-0.1195344, -0.4197547, -0.3851611, 1, 1, 1, 1, 1,
-0.1181735, 0.1580045, 1.072723, 1, 1, 1, 1, 1,
-0.1177085, -1.747366, -4.568957, 1, 1, 1, 1, 1,
-0.1177018, 2.39783, 0.9847943, 1, 1, 1, 1, 1,
-0.1131989, -1.127454, -4.154972, 1, 1, 1, 1, 1,
-0.1086664, 0.7140356, -1.451907, 1, 1, 1, 1, 1,
-0.106229, -0.08942998, -1.620875, 1, 1, 1, 1, 1,
-0.1057586, 0.1026441, -1.96548, 1, 1, 1, 1, 1,
-0.1048116, 0.839021, 0.219536, 1, 1, 1, 1, 1,
-0.09981079, 0.9125415, -1.476833, 1, 1, 1, 1, 1,
-0.09975381, 0.7768953, -0.5765656, 1, 1, 1, 1, 1,
-0.09881682, -0.1682143, -3.131542, 1, 1, 1, 1, 1,
-0.09274346, 0.9361675, 1.420395, 1, 1, 1, 1, 1,
-0.08768571, 0.7379336, 0.3519143, 1, 1, 1, 1, 1,
-0.08138812, -0.5977219, -1.598094, 0, 0, 1, 1, 1,
-0.07890679, 0.6452867, 1.413991, 1, 0, 0, 1, 1,
-0.07691242, 1.407267, 0.5017553, 1, 0, 0, 1, 1,
-0.07237024, -1.793206, -3.581639, 1, 0, 0, 1, 1,
-0.07191481, -0.9314106, -2.96414, 1, 0, 0, 1, 1,
-0.06875972, 0.03009902, -0.6129181, 1, 0, 0, 1, 1,
-0.06484509, -0.5337766, -4.762636, 0, 0, 0, 1, 1,
-0.06319458, -0.8410043, -2.948942, 0, 0, 0, 1, 1,
-0.06211359, -0.2151802, -1.440074, 0, 0, 0, 1, 1,
-0.06022609, 0.1656985, 0.1855969, 0, 0, 0, 1, 1,
-0.0577939, 1.259652, -0.4172936, 0, 0, 0, 1, 1,
-0.05760851, -0.2854597, -3.744257, 0, 0, 0, 1, 1,
-0.05423949, -0.9417545, -3.27833, 0, 0, 0, 1, 1,
-0.05175512, 1.269358, 2.065872, 1, 1, 1, 1, 1,
-0.05152943, 1.398166, -0.637189, 1, 1, 1, 1, 1,
-0.04525543, 0.4889203, 0.338042, 1, 1, 1, 1, 1,
-0.04519654, 1.616079, 0.3820997, 1, 1, 1, 1, 1,
-0.04438222, 0.1420751, 1.303048, 1, 1, 1, 1, 1,
-0.04117554, 0.3453546, 1.121268, 1, 1, 1, 1, 1,
-0.03987947, -0.59512, -3.437956, 1, 1, 1, 1, 1,
-0.03780025, -0.02974935, -2.991746, 1, 1, 1, 1, 1,
-0.03709698, 1.139551, 1.001846, 1, 1, 1, 1, 1,
-0.03656792, -1.555386, -4.38871, 1, 1, 1, 1, 1,
-0.03411109, 1.09701, -0.3549872, 1, 1, 1, 1, 1,
-0.02947899, 0.8305551, 0.2723222, 1, 1, 1, 1, 1,
-0.0294382, -0.4205186, -3.830177, 1, 1, 1, 1, 1,
-0.02601254, 0.1290764, 1.406753, 1, 1, 1, 1, 1,
-0.01535539, -0.3039456, -2.851391, 1, 1, 1, 1, 1,
-0.01395724, -1.566476, -1.998048, 0, 0, 1, 1, 1,
-0.01311761, -0.8729342, -1.288731, 1, 0, 0, 1, 1,
-0.01280617, -0.4553779, -4.723945, 1, 0, 0, 1, 1,
-0.009992015, -0.8349985, -2.659818, 1, 0, 0, 1, 1,
-0.009036279, -1.366328, -2.171504, 1, 0, 0, 1, 1,
-0.0005558361, -0.5830344, -3.015365, 1, 0, 0, 1, 1,
0.002097368, -0.4805863, 2.692103, 0, 0, 0, 1, 1,
0.002202374, -0.05204815, 2.719682, 0, 0, 0, 1, 1,
0.003101051, -0.9321, 2.250459, 0, 0, 0, 1, 1,
0.004052857, -0.7171307, 3.288614, 0, 0, 0, 1, 1,
0.008755865, -0.7307417, 2.942621, 0, 0, 0, 1, 1,
0.01070327, 0.3101686, -1.162672, 0, 0, 0, 1, 1,
0.01238392, 1.045551, -0.7445055, 0, 0, 0, 1, 1,
0.01351106, -0.04068542, 4.420592, 1, 1, 1, 1, 1,
0.01484097, 0.4618201, -0.6951346, 1, 1, 1, 1, 1,
0.01516491, 0.7044584, -0.3959679, 1, 1, 1, 1, 1,
0.01640565, -1.002321, 5.248703, 1, 1, 1, 1, 1,
0.02013438, 1.59451, 0.8273317, 1, 1, 1, 1, 1,
0.02103287, -0.5672176, 3.049994, 1, 1, 1, 1, 1,
0.03051528, -1.757886, 3.776209, 1, 1, 1, 1, 1,
0.03197637, -0.5101572, 2.762875, 1, 1, 1, 1, 1,
0.03489296, -1.519424, 3.583418, 1, 1, 1, 1, 1,
0.04247177, -0.8231609, 1.407178, 1, 1, 1, 1, 1,
0.04364299, 0.2353191, -0.07749111, 1, 1, 1, 1, 1,
0.04500542, 0.6508399, -0.2217597, 1, 1, 1, 1, 1,
0.05048892, -1.792542, 2.841383, 1, 1, 1, 1, 1,
0.05382396, -0.8394209, 2.829868, 1, 1, 1, 1, 1,
0.05515323, -0.6840373, 1.020913, 1, 1, 1, 1, 1,
0.05619848, -0.2456566, 3.084852, 0, 0, 1, 1, 1,
0.05656305, 0.9580004, 0.3043554, 1, 0, 0, 1, 1,
0.05811656, 0.7248583, 0.2273336, 1, 0, 0, 1, 1,
0.06299094, -0.694867, 2.351954, 1, 0, 0, 1, 1,
0.06322229, 0.8232298, 0.6473734, 1, 0, 0, 1, 1,
0.06401806, 1.845269, 1.313886, 1, 0, 0, 1, 1,
0.0647097, -0.7303527, 3.686192, 0, 0, 0, 1, 1,
0.06517383, -0.4830166, 4.016029, 0, 0, 0, 1, 1,
0.06960045, -0.1165061, 2.113157, 0, 0, 0, 1, 1,
0.07477131, -0.6727439, 2.80609, 0, 0, 0, 1, 1,
0.07647737, 0.5064847, 1.443641, 0, 0, 0, 1, 1,
0.08040106, 0.5947059, 1.108411, 0, 0, 0, 1, 1,
0.08146091, 0.05684891, 2.31137, 0, 0, 0, 1, 1,
0.08165021, -2.070636, 5.331405, 1, 1, 1, 1, 1,
0.08198281, 0.7017805, -0.9243363, 1, 1, 1, 1, 1,
0.08243478, -0.6067184, 2.544482, 1, 1, 1, 1, 1,
0.08492278, -1.028005, 3.977242, 1, 1, 1, 1, 1,
0.08891456, 0.06889267, 1.659836, 1, 1, 1, 1, 1,
0.09106581, -0.9220418, 2.56298, 1, 1, 1, 1, 1,
0.09170188, 0.39345, 0.5931938, 1, 1, 1, 1, 1,
0.09826172, -0.5311197, 5.594099, 1, 1, 1, 1, 1,
0.1021017, -0.8483557, 1.629792, 1, 1, 1, 1, 1,
0.1105509, 0.8514675, 0.6959744, 1, 1, 1, 1, 1,
0.1114837, 0.7278541, -1.214841, 1, 1, 1, 1, 1,
0.1122408, 0.5503825, 0.1197505, 1, 1, 1, 1, 1,
0.1161771, -0.9540085, 4.217511, 1, 1, 1, 1, 1,
0.1186815, -0.679499, 3.994814, 1, 1, 1, 1, 1,
0.1194113, -1.212314, 2.886436, 1, 1, 1, 1, 1,
0.1264679, 0.3005364, -0.5296946, 0, 0, 1, 1, 1,
0.1282896, -1.198323, 2.101913, 1, 0, 0, 1, 1,
0.1291795, 1.148759, 0.153548, 1, 0, 0, 1, 1,
0.1309855, 0.8559604, -1.528069, 1, 0, 0, 1, 1,
0.1321826, -0.4003635, 3.60289, 1, 0, 0, 1, 1,
0.1334956, 0.007072791, 0.8124251, 1, 0, 0, 1, 1,
0.1370705, -0.1037622, 2.49436, 0, 0, 0, 1, 1,
0.1390871, 0.2589535, 0.7500955, 0, 0, 0, 1, 1,
0.1393145, -0.3560022, 3.624989, 0, 0, 0, 1, 1,
0.1414305, -0.4866345, 2.12841, 0, 0, 0, 1, 1,
0.1421255, -0.3060904, 2.907256, 0, 0, 0, 1, 1,
0.1425831, -0.8075408, 3.352216, 0, 0, 0, 1, 1,
0.1429328, -1.272045, 2.864235, 0, 0, 0, 1, 1,
0.1454689, -1.370578, 3.921358, 1, 1, 1, 1, 1,
0.1490468, -2.742374, 3.398767, 1, 1, 1, 1, 1,
0.1491885, -1.520301, 0.9101234, 1, 1, 1, 1, 1,
0.151138, -0.5597259, 3.889974, 1, 1, 1, 1, 1,
0.1552781, -0.6237498, 2.259944, 1, 1, 1, 1, 1,
0.1560086, -0.7714497, 2.654853, 1, 1, 1, 1, 1,
0.1561638, -0.8200857, 3.602499, 1, 1, 1, 1, 1,
0.170328, 0.734717, -0.414317, 1, 1, 1, 1, 1,
0.1762782, -0.02039196, 1.247077, 1, 1, 1, 1, 1,
0.1800491, 0.4361656, 0.07538972, 1, 1, 1, 1, 1,
0.1811044, -1.146258, 4.161125, 1, 1, 1, 1, 1,
0.1814634, -0.4634376, 1.348181, 1, 1, 1, 1, 1,
0.1871486, -1.020874, 4.923828, 1, 1, 1, 1, 1,
0.1907025, -0.01073979, 1.381118, 1, 1, 1, 1, 1,
0.190739, 0.2002392, 0.148919, 1, 1, 1, 1, 1,
0.1908168, 0.06773677, 0.2847863, 0, 0, 1, 1, 1,
0.1916844, -1.726787, -0.01533561, 1, 0, 0, 1, 1,
0.1918485, -0.6767902, 1.212772, 1, 0, 0, 1, 1,
0.1919772, 0.07603492, 1.73145, 1, 0, 0, 1, 1,
0.1956861, -0.2360923, 2.78598, 1, 0, 0, 1, 1,
0.1977266, -0.8862361, 1.774911, 1, 0, 0, 1, 1,
0.2046773, 0.7390539, 0.260629, 0, 0, 0, 1, 1,
0.2122943, -1.616811, 3.331529, 0, 0, 0, 1, 1,
0.2185154, -0.5833859, 4.446249, 0, 0, 0, 1, 1,
0.2191179, 0.2799482, -1.046105, 0, 0, 0, 1, 1,
0.2193006, -3.014525, 3.162743, 0, 0, 0, 1, 1,
0.2213782, 0.3548089, 0.114476, 0, 0, 0, 1, 1,
0.2223888, -1.318318, 3.851545, 0, 0, 0, 1, 1,
0.2239135, 0.5039617, 0.7130834, 1, 1, 1, 1, 1,
0.2274364, 1.028027, 0.8279725, 1, 1, 1, 1, 1,
0.2283876, 0.8357114, 0.5685692, 1, 1, 1, 1, 1,
0.2310194, -0.1854, 2.49058, 1, 1, 1, 1, 1,
0.2328981, -1.436171, 3.389269, 1, 1, 1, 1, 1,
0.2424061, 1.434809, -1.314638, 1, 1, 1, 1, 1,
0.2425436, 1.009493, 0.012644, 1, 1, 1, 1, 1,
0.2436134, -0.05034675, 1.622002, 1, 1, 1, 1, 1,
0.2453977, 0.9837823, 1.665336, 1, 1, 1, 1, 1,
0.2510704, 2.875048, 0.6026561, 1, 1, 1, 1, 1,
0.2586828, -0.5376359, 1.578992, 1, 1, 1, 1, 1,
0.2590444, 2.019389, -1.716915, 1, 1, 1, 1, 1,
0.2602642, 0.9560049, 0.2654543, 1, 1, 1, 1, 1,
0.2620862, 0.7037392, 1.896995, 1, 1, 1, 1, 1,
0.2682437, -0.4051463, 4.121248, 1, 1, 1, 1, 1,
0.2699749, -1.254204, 2.090131, 0, 0, 1, 1, 1,
0.2708497, -0.4825422, 2.577821, 1, 0, 0, 1, 1,
0.2722118, 0.3051522, -0.5588605, 1, 0, 0, 1, 1,
0.2768141, 0.5130536, 2.206295, 1, 0, 0, 1, 1,
0.2827923, 0.1048281, 1.393092, 1, 0, 0, 1, 1,
0.2840351, -2.117857, 2.553842, 1, 0, 0, 1, 1,
0.2853418, 0.6926088, 1.556574, 0, 0, 0, 1, 1,
0.2928154, -0.1057967, 1.498713, 0, 0, 0, 1, 1,
0.2936177, -2.29462, 1.842406, 0, 0, 0, 1, 1,
0.2942989, 0.7907516, -0.3635816, 0, 0, 0, 1, 1,
0.2957227, 0.1785978, -0.3230877, 0, 0, 0, 1, 1,
0.2972527, 0.1946738, 0.6902509, 0, 0, 0, 1, 1,
0.3026389, -1.499068, 2.927881, 0, 0, 0, 1, 1,
0.303445, -0.3561219, 3.539362, 1, 1, 1, 1, 1,
0.3057346, 1.138621, 0.2228411, 1, 1, 1, 1, 1,
0.3076346, 1.003759, 0.5594429, 1, 1, 1, 1, 1,
0.3078961, -1.359889, 5.007521, 1, 1, 1, 1, 1,
0.3105415, -0.3722223, -0.2328434, 1, 1, 1, 1, 1,
0.3129679, -0.5678714, 0.3583262, 1, 1, 1, 1, 1,
0.3205745, 0.01998966, 0.3012097, 1, 1, 1, 1, 1,
0.3298485, -0.2039538, 1.911088, 1, 1, 1, 1, 1,
0.3315159, -0.9764742, 2.705129, 1, 1, 1, 1, 1,
0.3340858, -1.726665, 3.822483, 1, 1, 1, 1, 1,
0.3468133, -0.4191527, 3.428665, 1, 1, 1, 1, 1,
0.3469134, 0.268831, -0.2720603, 1, 1, 1, 1, 1,
0.3504086, 1.283909, 2.534409, 1, 1, 1, 1, 1,
0.3581049, 0.9679585, 1.058038, 1, 1, 1, 1, 1,
0.3582207, 0.1493803, 2.547867, 1, 1, 1, 1, 1,
0.364861, -1.026827, 0.9437969, 0, 0, 1, 1, 1,
0.3659183, -0.1456987, 3.228206, 1, 0, 0, 1, 1,
0.367231, 0.3729146, 1.676537, 1, 0, 0, 1, 1,
0.3691649, -0.2858897, 3.466608, 1, 0, 0, 1, 1,
0.3700849, -0.3270548, 2.114229, 1, 0, 0, 1, 1,
0.3708948, 1.000814, 2.343014, 1, 0, 0, 1, 1,
0.3712888, 0.856218, -0.3105409, 0, 0, 0, 1, 1,
0.3713931, 0.2221968, 0.2590987, 0, 0, 0, 1, 1,
0.3720215, 1.089348, 1.171077, 0, 0, 0, 1, 1,
0.3777788, 0.3348066, 0.4372401, 0, 0, 0, 1, 1,
0.3819763, 0.5970591, 0.3432217, 0, 0, 0, 1, 1,
0.3861274, -1.11171, 2.6624, 0, 0, 0, 1, 1,
0.3871127, -1.145179, 3.018801, 0, 0, 0, 1, 1,
0.3879192, 2.059974, -0.9936208, 1, 1, 1, 1, 1,
0.3897432, 1.317196, -0.3303448, 1, 1, 1, 1, 1,
0.3906242, 0.5228233, 1.81261, 1, 1, 1, 1, 1,
0.3933521, -2.224858, 3.895247, 1, 1, 1, 1, 1,
0.3953355, -0.3514025, 2.953299, 1, 1, 1, 1, 1,
0.3956765, -1.101264, 3.741682, 1, 1, 1, 1, 1,
0.3973081, 1.931898, 0.6513112, 1, 1, 1, 1, 1,
0.4019475, -0.2202918, 1.073019, 1, 1, 1, 1, 1,
0.4074261, 0.6401759, -0.8762777, 1, 1, 1, 1, 1,
0.4106378, 0.7518691, -1.210728, 1, 1, 1, 1, 1,
0.4107582, -0.213363, 1.964326, 1, 1, 1, 1, 1,
0.4113545, 0.07698605, -0.1771869, 1, 1, 1, 1, 1,
0.4119589, 0.2449111, 1.989635, 1, 1, 1, 1, 1,
0.4120278, -0.4029503, 0.7513548, 1, 1, 1, 1, 1,
0.4123242, -0.1412235, 3.150128, 1, 1, 1, 1, 1,
0.4187725, 0.1105701, -0.5659075, 0, 0, 1, 1, 1,
0.419439, -0.323725, 1.563936, 1, 0, 0, 1, 1,
0.4198654, 0.6047506, 0.869496, 1, 0, 0, 1, 1,
0.4218219, 1.496141, 0.3647649, 1, 0, 0, 1, 1,
0.4253241, 0.0830318, -0.2710611, 1, 0, 0, 1, 1,
0.4303457, 0.005989144, 2.316118, 1, 0, 0, 1, 1,
0.4326189, 0.6673884, -0.2528897, 0, 0, 0, 1, 1,
0.4333179, -0.9866015, 2.157823, 0, 0, 0, 1, 1,
0.4357055, -0.3070712, 1.704491, 0, 0, 0, 1, 1,
0.4408977, 0.7395259, 1.449683, 0, 0, 0, 1, 1,
0.442277, -0.006041221, 1.54654, 0, 0, 0, 1, 1,
0.4458964, 2.064877, 0.6594481, 0, 0, 0, 1, 1,
0.4460334, 0.8897222, 0.780101, 0, 0, 0, 1, 1,
0.4493053, -0.769879, 4.283044, 1, 1, 1, 1, 1,
0.4498892, 1.978792, 1.870983, 1, 1, 1, 1, 1,
0.4499565, 0.1694126, 0.7637935, 1, 1, 1, 1, 1,
0.4505532, 0.05302271, 1.722631, 1, 1, 1, 1, 1,
0.4508582, -1.68494, 2.692958, 1, 1, 1, 1, 1,
0.4581564, -0.3307331, 2.206739, 1, 1, 1, 1, 1,
0.4654484, 0.4099997, -0.0573174, 1, 1, 1, 1, 1,
0.4655486, 0.1983091, 0.1669654, 1, 1, 1, 1, 1,
0.4732242, 0.208972, 1.492056, 1, 1, 1, 1, 1,
0.4745038, 0.08504175, 1.499526, 1, 1, 1, 1, 1,
0.4779864, -0.1853519, 1.707336, 1, 1, 1, 1, 1,
0.4800252, -0.5844366, 3.360445, 1, 1, 1, 1, 1,
0.488717, 1.160237, -0.8635556, 1, 1, 1, 1, 1,
0.4951624, -0.4369063, 2.492746, 1, 1, 1, 1, 1,
0.4989586, 0.1972737, 1.430449, 1, 1, 1, 1, 1,
0.5016233, -1.848559, 2.286152, 0, 0, 1, 1, 1,
0.5020996, -0.8414705, 1.356695, 1, 0, 0, 1, 1,
0.5037776, 0.3040304, -0.2074493, 1, 0, 0, 1, 1,
0.5041095, 0.9320788, 1.329983, 1, 0, 0, 1, 1,
0.5082582, -0.08659384, 2.208521, 1, 0, 0, 1, 1,
0.5129941, -0.3356622, 0.953947, 1, 0, 0, 1, 1,
0.513046, 1.172213, -0.007906456, 0, 0, 0, 1, 1,
0.5175278, -0.8817656, 2.994728, 0, 0, 0, 1, 1,
0.5203437, 0.1817386, 1.726198, 0, 0, 0, 1, 1,
0.5219696, 0.9253898, 1.674048, 0, 0, 0, 1, 1,
0.5272883, -0.7604411, 4.542432, 0, 0, 0, 1, 1,
0.5277628, -0.6699061, 0.9715236, 0, 0, 0, 1, 1,
0.5283785, -0.2409259, 0.1973736, 0, 0, 0, 1, 1,
0.5324202, -0.8508788, 2.279542, 1, 1, 1, 1, 1,
0.5348666, 0.9383723, -0.3537529, 1, 1, 1, 1, 1,
0.5363557, -0.3495797, 3.045123, 1, 1, 1, 1, 1,
0.5375931, -0.3408501, 2.461278, 1, 1, 1, 1, 1,
0.5387264, -0.5357533, 3.439873, 1, 1, 1, 1, 1,
0.5447043, -0.6536858, 3.719438, 1, 1, 1, 1, 1,
0.5460261, -0.5922076, 3.751267, 1, 1, 1, 1, 1,
0.5473152, -0.261251, 1.54575, 1, 1, 1, 1, 1,
0.5488709, -0.04025032, 0.38647, 1, 1, 1, 1, 1,
0.5506076, -0.7430778, -0.1753414, 1, 1, 1, 1, 1,
0.5519413, -0.8709869, 4.308144, 1, 1, 1, 1, 1,
0.5683956, -0.5737928, 3.460151, 1, 1, 1, 1, 1,
0.570902, -0.05325216, 1.142564, 1, 1, 1, 1, 1,
0.5712863, 1.581123, 1.03336, 1, 1, 1, 1, 1,
0.5744974, -0.3984626, 3.444423, 1, 1, 1, 1, 1,
0.5809055, 0.1987809, 0.9913574, 0, 0, 1, 1, 1,
0.5826579, 1.400862, 0.02226351, 1, 0, 0, 1, 1,
0.585718, -1.33717, 4.287242, 1, 0, 0, 1, 1,
0.5893971, -0.5991269, 3.102418, 1, 0, 0, 1, 1,
0.5913053, -0.05146633, 1.321335, 1, 0, 0, 1, 1,
0.5949739, -1.287112, 2.911813, 1, 0, 0, 1, 1,
0.5964286, -0.489664, 3.390707, 0, 0, 0, 1, 1,
0.5992972, -0.2322331, 3.019272, 0, 0, 0, 1, 1,
0.6033756, -0.3621893, 2.522717, 0, 0, 0, 1, 1,
0.6042829, -0.4644133, 5.077733, 0, 0, 0, 1, 1,
0.6096027, 0.8158559, 0.5748655, 0, 0, 0, 1, 1,
0.6101707, -1.074997, 2.203136, 0, 0, 0, 1, 1,
0.6108894, -0.2399336, 1.011854, 0, 0, 0, 1, 1,
0.6123673, 0.4233029, 1.279108, 1, 1, 1, 1, 1,
0.617787, 1.004515, 0.2281984, 1, 1, 1, 1, 1,
0.6246115, -0.1501129, 1.735667, 1, 1, 1, 1, 1,
0.633445, 1.53745, 0.6915502, 1, 1, 1, 1, 1,
0.6472265, -1.212981, 2.685066, 1, 1, 1, 1, 1,
0.6499968, -0.06208626, 0.8974849, 1, 1, 1, 1, 1,
0.6546488, -2.006927, 5.01709, 1, 1, 1, 1, 1,
0.6554019, -0.01269111, 3.317198, 1, 1, 1, 1, 1,
0.6575038, -1.850511, 3.282955, 1, 1, 1, 1, 1,
0.6583577, -0.4414316, 3.4852, 1, 1, 1, 1, 1,
0.6592005, 0.5704376, 2.236432, 1, 1, 1, 1, 1,
0.6638231, -1.68571, 2.958828, 1, 1, 1, 1, 1,
0.6646009, -0.03238853, 2.988775, 1, 1, 1, 1, 1,
0.6656991, 1.686808, 0.9706929, 1, 1, 1, 1, 1,
0.6769727, -1.318124, 1.852965, 1, 1, 1, 1, 1,
0.6812785, 0.3890935, 2.082795, 0, 0, 1, 1, 1,
0.6854981, -0.699748, 2.515175, 1, 0, 0, 1, 1,
0.6873723, -0.9109951, 1.680601, 1, 0, 0, 1, 1,
0.6913251, 0.2689848, 1.384304, 1, 0, 0, 1, 1,
0.6976823, 1.39609, 1.078565, 1, 0, 0, 1, 1,
0.6997078, -1.350249, 3.608032, 1, 0, 0, 1, 1,
0.7035481, 1.353608, 1.392898, 0, 0, 0, 1, 1,
0.7038152, 1.347161, 0.4972511, 0, 0, 0, 1, 1,
0.7038471, -0.8479219, 0.9902325, 0, 0, 0, 1, 1,
0.703949, 0.9089133, -1.534536, 0, 0, 0, 1, 1,
0.7078688, -0.7807155, 3.05806, 0, 0, 0, 1, 1,
0.71226, -1.837866, 2.858594, 0, 0, 0, 1, 1,
0.7132477, -1.563682, 3.768599, 0, 0, 0, 1, 1,
0.7133712, -0.8721346, 2.665868, 1, 1, 1, 1, 1,
0.7144227, 1.870318, 0.2930942, 1, 1, 1, 1, 1,
0.7155126, -0.3538774, 2.807122, 1, 1, 1, 1, 1,
0.7195107, 0.2942168, 1.814044, 1, 1, 1, 1, 1,
0.722719, -0.8070207, 3.493889, 1, 1, 1, 1, 1,
0.7255033, 0.4773265, -0.9571698, 1, 1, 1, 1, 1,
0.7279099, 0.9617352, 1.408374, 1, 1, 1, 1, 1,
0.7346931, 0.5973014, 1.495489, 1, 1, 1, 1, 1,
0.7363027, -1.233122, 2.912514, 1, 1, 1, 1, 1,
0.7406378, -0.2937871, 2.709298, 1, 1, 1, 1, 1,
0.7441009, 0.382575, 0.3089549, 1, 1, 1, 1, 1,
0.7479551, 1.150914, 0.1578813, 1, 1, 1, 1, 1,
0.7521468, 1.353588, 1.015003, 1, 1, 1, 1, 1,
0.7524447, 0.2747263, 1.108049, 1, 1, 1, 1, 1,
0.7554567, -0.359928, 2.11692, 1, 1, 1, 1, 1,
0.763334, 1.144108, 1.733836, 0, 0, 1, 1, 1,
0.764939, -0.2047769, 2.280998, 1, 0, 0, 1, 1,
0.7672405, 0.2684478, 0.08674899, 1, 0, 0, 1, 1,
0.7706102, -0.1047889, 2.539788, 1, 0, 0, 1, 1,
0.7737454, 0.3904276, 0.7908785, 1, 0, 0, 1, 1,
0.7740405, 1.122634, -0.2746651, 1, 0, 0, 1, 1,
0.7746848, 1.350355, 1.05066, 0, 0, 0, 1, 1,
0.7790502, -1.429746, 3.34906, 0, 0, 0, 1, 1,
0.7794014, -0.3244144, 1.95078, 0, 0, 0, 1, 1,
0.7937036, -1.396803, 3.879835, 0, 0, 0, 1, 1,
0.7973126, 1.92177, 0.6936385, 0, 0, 0, 1, 1,
0.7985722, -1.525948, 4.79831, 0, 0, 0, 1, 1,
0.8027422, -0.6668751, 2.56847, 0, 0, 0, 1, 1,
0.8036264, 0.4318783, 1.599365, 1, 1, 1, 1, 1,
0.8039232, -0.3188232, 3.585321, 1, 1, 1, 1, 1,
0.8084344, -0.6271893, 2.102272, 1, 1, 1, 1, 1,
0.810764, 0.1068034, 1.862485, 1, 1, 1, 1, 1,
0.8110535, -1.255608, 3.133556, 1, 1, 1, 1, 1,
0.8114728, -0.6947801, 1.842917, 1, 1, 1, 1, 1,
0.8133786, -0.0120377, 2.473666, 1, 1, 1, 1, 1,
0.8157778, 0.07947969, 1.296697, 1, 1, 1, 1, 1,
0.8214103, -1.544414, 0.962647, 1, 1, 1, 1, 1,
0.8280551, -1.996608, 2.012747, 1, 1, 1, 1, 1,
0.8284329, 0.68026, 1.371571, 1, 1, 1, 1, 1,
0.8421532, -1.81768, 2.047072, 1, 1, 1, 1, 1,
0.8446014, 0.3744392, -0.07815491, 1, 1, 1, 1, 1,
0.8532726, 0.3648217, 1.129203, 1, 1, 1, 1, 1,
0.8549204, -1.404192, 1.259138, 1, 1, 1, 1, 1,
0.8576561, 0.8857165, 0.4254279, 0, 0, 1, 1, 1,
0.8612297, 1.199221, 0.84916, 1, 0, 0, 1, 1,
0.8690377, 0.8658115, 2.585898, 1, 0, 0, 1, 1,
0.8694389, -0.8176547, 1.222621, 1, 0, 0, 1, 1,
0.8764984, 1.160824, 1.493277, 1, 0, 0, 1, 1,
0.8817407, -0.4642949, 2.839332, 1, 0, 0, 1, 1,
0.8844293, -0.9681788, 2.510709, 0, 0, 0, 1, 1,
0.8862476, 0.3743025, 0.4464247, 0, 0, 0, 1, 1,
0.889637, 3.120113, -0.06475559, 0, 0, 0, 1, 1,
0.8903344, 0.9176519, 2.250593, 0, 0, 0, 1, 1,
0.893627, -0.8731953, 3.128211, 0, 0, 0, 1, 1,
0.8937038, 1.307847, 1.922265, 0, 0, 0, 1, 1,
0.894872, 0.3441583, 1.032627, 0, 0, 0, 1, 1,
0.8982857, 2.007771, -0.8157628, 1, 1, 1, 1, 1,
0.9032119, 0.7462896, -0.9958137, 1, 1, 1, 1, 1,
0.9062074, 0.08002092, 0.2135228, 1, 1, 1, 1, 1,
0.9062771, 0.5180302, 1.144014, 1, 1, 1, 1, 1,
0.9109713, -0.3992441, 2.266408, 1, 1, 1, 1, 1,
0.9120729, -1.010095, 3.17415, 1, 1, 1, 1, 1,
0.9158605, 1.384442, -0.7785157, 1, 1, 1, 1, 1,
0.916975, -0.4352327, 2.823541, 1, 1, 1, 1, 1,
0.9195527, 0.1451969, 3.09151, 1, 1, 1, 1, 1,
0.9231157, 0.642575, 0.6172381, 1, 1, 1, 1, 1,
0.9268412, -0.8944075, 1.697902, 1, 1, 1, 1, 1,
0.9306733, 1.871542, -0.3047564, 1, 1, 1, 1, 1,
0.935429, 1.79328, -0.356182, 1, 1, 1, 1, 1,
0.9368675, -0.915169, 0.3939222, 1, 1, 1, 1, 1,
0.9489132, 2.675643, 0.8456876, 1, 1, 1, 1, 1,
0.953424, -0.9923633, 2.321665, 0, 0, 1, 1, 1,
0.9624561, 0.4704194, 2.154598, 1, 0, 0, 1, 1,
0.9764284, -0.6585097, 2.654403, 1, 0, 0, 1, 1,
0.9780874, 1.276657, -0.7948418, 1, 0, 0, 1, 1,
0.9782202, 0.163667, -0.3125418, 1, 0, 0, 1, 1,
0.9799306, -1.087949, 1.048942, 1, 0, 0, 1, 1,
0.9812206, 0.4930145, 1.954947, 0, 0, 0, 1, 1,
0.9812711, 0.1935667, 0.8457983, 0, 0, 0, 1, 1,
0.9840683, 1.279742, 0.3534338, 0, 0, 0, 1, 1,
0.9881991, 1.267345, 1.628499, 0, 0, 0, 1, 1,
0.9913312, -1.503403, 3.155077, 0, 0, 0, 1, 1,
0.9923913, 0.1004954, 1.168336, 0, 0, 0, 1, 1,
1.001346, 0.2217862, 2.21469, 0, 0, 0, 1, 1,
1.015245, -0.1547198, 1.848559, 1, 1, 1, 1, 1,
1.0167, 0.8645449, 1.138386, 1, 1, 1, 1, 1,
1.019307, 0.5882717, 1.454836, 1, 1, 1, 1, 1,
1.023742, -0.507476, 3.45865, 1, 1, 1, 1, 1,
1.024987, 0.95003, 1.664844, 1, 1, 1, 1, 1,
1.028647, 0.2990494, 1.774945, 1, 1, 1, 1, 1,
1.029274, 0.1496813, 2.447743, 1, 1, 1, 1, 1,
1.03126, 0.3734304, 0.6546065, 1, 1, 1, 1, 1,
1.032663, 1.106629, 0.1606138, 1, 1, 1, 1, 1,
1.036907, -1.350408, 3.620491, 1, 1, 1, 1, 1,
1.036926, 1.078283, 0.0456503, 1, 1, 1, 1, 1,
1.038537, 0.1195151, 0.5598388, 1, 1, 1, 1, 1,
1.040913, 0.5136302, 1.401575, 1, 1, 1, 1, 1,
1.041838, -0.331698, 1.36583, 1, 1, 1, 1, 1,
1.047305, -1.059463, 4.014181, 1, 1, 1, 1, 1,
1.0487, -0.9629303, 1.174216, 0, 0, 1, 1, 1,
1.050959, -1.393264, 3.249028, 1, 0, 0, 1, 1,
1.05801, 0.1665632, 2.412445, 1, 0, 0, 1, 1,
1.069014, 1.267256, 1.728285, 1, 0, 0, 1, 1,
1.070416, -0.7524187, 2.576285, 1, 0, 0, 1, 1,
1.073609, 1.751907, 0.05594296, 1, 0, 0, 1, 1,
1.074633, 1.154512, 2.196865, 0, 0, 0, 1, 1,
1.080354, -1.15213, 1.159921, 0, 0, 0, 1, 1,
1.08723, -0.08061037, 2.164436, 0, 0, 0, 1, 1,
1.091765, -2.11724, 3.048118, 0, 0, 0, 1, 1,
1.093382, 0.4387534, 1.512869, 0, 0, 0, 1, 1,
1.094861, -1.983528, 3.593301, 0, 0, 0, 1, 1,
1.095639, 0.7333025, 0.2694708, 0, 0, 0, 1, 1,
1.102675, -1.014685, 1.199734, 1, 1, 1, 1, 1,
1.103058, -0.9191589, 0.7259712, 1, 1, 1, 1, 1,
1.108357, 1.379526, -0.08239762, 1, 1, 1, 1, 1,
1.113023, -1.831257, 2.222149, 1, 1, 1, 1, 1,
1.115622, -0.9455596, 3.044355, 1, 1, 1, 1, 1,
1.125608, 0.5900959, 0.8093891, 1, 1, 1, 1, 1,
1.141523, 0.6473374, 0.188993, 1, 1, 1, 1, 1,
1.143331, 0.1025519, 1.193394, 1, 1, 1, 1, 1,
1.144634, -0.7081807, 1.683609, 1, 1, 1, 1, 1,
1.159699, 0.5334169, 2.763581, 1, 1, 1, 1, 1,
1.159942, -1.679341, 4.344058, 1, 1, 1, 1, 1,
1.16014, 1.094205, 0.6899187, 1, 1, 1, 1, 1,
1.16064, 1.756647, 2.021629, 1, 1, 1, 1, 1,
1.170457, 0.4042685, 1.920421, 1, 1, 1, 1, 1,
1.174413, -0.1941317, 2.099822, 1, 1, 1, 1, 1,
1.178284, 0.696891, 1.982796, 0, 0, 1, 1, 1,
1.178765, -0.4719501, 1.298056, 1, 0, 0, 1, 1,
1.19324, -0.8256927, 1.10134, 1, 0, 0, 1, 1,
1.195648, 1.545695, 1.878569, 1, 0, 0, 1, 1,
1.199297, 0.05750369, 1.413068, 1, 0, 0, 1, 1,
1.216238, -0.7061203, 0.2564503, 1, 0, 0, 1, 1,
1.216425, -0.1390236, 1.468807, 0, 0, 0, 1, 1,
1.225454, -0.7437475, 1.097836, 0, 0, 0, 1, 1,
1.226152, -0.6730497, 1.477585, 0, 0, 0, 1, 1,
1.227399, -1.527754, 2.233872, 0, 0, 0, 1, 1,
1.247464, -1.572263, 3.182427, 0, 0, 0, 1, 1,
1.254012, 0.3479091, 0.9888403, 0, 0, 0, 1, 1,
1.265952, -0.2580652, 2.703262, 0, 0, 0, 1, 1,
1.278938, 1.620027, 0.4587301, 1, 1, 1, 1, 1,
1.280929, 0.09599674, 0.7580538, 1, 1, 1, 1, 1,
1.283447, 0.1412448, 2.601278, 1, 1, 1, 1, 1,
1.294835, -1.30476, 2.692944, 1, 1, 1, 1, 1,
1.29587, -0.07735534, 1.152267, 1, 1, 1, 1, 1,
1.296056, 0.3385797, 1.838713, 1, 1, 1, 1, 1,
1.300876, -0.3245924, 1.056623, 1, 1, 1, 1, 1,
1.304242, 0.2994546, 1.841147, 1, 1, 1, 1, 1,
1.340236, 1.715824, 1.242513, 1, 1, 1, 1, 1,
1.340634, -0.6943308, 1.919393, 1, 1, 1, 1, 1,
1.350355, 1.230041, 1.691339, 1, 1, 1, 1, 1,
1.375231, -0.1558648, 1.628926, 1, 1, 1, 1, 1,
1.388258, -0.820586, 1.844337, 1, 1, 1, 1, 1,
1.395774, -0.8802942, 3.159379, 1, 1, 1, 1, 1,
1.398248, 2.11626, -0.07352256, 1, 1, 1, 1, 1,
1.409009, -0.6817631, 0.8756446, 0, 0, 1, 1, 1,
1.429682, -0.03688872, 1.795192, 1, 0, 0, 1, 1,
1.433084, 0.3536178, 1.521514, 1, 0, 0, 1, 1,
1.456818, -0.9591606, 1.677256, 1, 0, 0, 1, 1,
1.458676, -0.0337939, 1.686305, 1, 0, 0, 1, 1,
1.461539, -0.9223513, 2.090115, 1, 0, 0, 1, 1,
1.472242, -1.047837, 2.942046, 0, 0, 0, 1, 1,
1.494088, -0.5568842, 3.544558, 0, 0, 0, 1, 1,
1.496984, -0.9611525, 0.9494469, 0, 0, 0, 1, 1,
1.499726, -0.7113752, 2.458584, 0, 0, 0, 1, 1,
1.507189, -0.4047491, 0.8553621, 0, 0, 0, 1, 1,
1.517428, -1.276943, 2.687141, 0, 0, 0, 1, 1,
1.524102, 1.434172, 2.494385, 0, 0, 0, 1, 1,
1.525868, -1.671172, 1.795193, 1, 1, 1, 1, 1,
1.529316, -0.7395596, 0.4394243, 1, 1, 1, 1, 1,
1.532689, 2.238174, 0.8346207, 1, 1, 1, 1, 1,
1.535976, 0.5511251, 2.23338, 1, 1, 1, 1, 1,
1.542924, 1.276007, 0.3409504, 1, 1, 1, 1, 1,
1.565663, -1.549885, 3.179761, 1, 1, 1, 1, 1,
1.595013, -1.332335, 1.467964, 1, 1, 1, 1, 1,
1.602381, -0.1368504, 1.237417, 1, 1, 1, 1, 1,
1.62347, -0.4532886, 2.987533, 1, 1, 1, 1, 1,
1.633478, -0.5589576, 1.28346, 1, 1, 1, 1, 1,
1.641127, 1.51806, 1.023785, 1, 1, 1, 1, 1,
1.650851, 0.8032409, -0.07573308, 1, 1, 1, 1, 1,
1.658098, -0.9679477, 2.4191, 1, 1, 1, 1, 1,
1.685527, -0.2215405, 0.9480174, 1, 1, 1, 1, 1,
1.709795, 1.300332, 2.246016, 1, 1, 1, 1, 1,
1.726448, -2.595412, 1.841861, 0, 0, 1, 1, 1,
1.743683, 1.361908, 1.339411, 1, 0, 0, 1, 1,
1.744945, -0.467058, 1.787387, 1, 0, 0, 1, 1,
1.761438, -0.8715031, 1.820958, 1, 0, 0, 1, 1,
1.788519, -0.07224414, 3.558927, 1, 0, 0, 1, 1,
1.796583, 1.056632, 0.3160101, 1, 0, 0, 1, 1,
1.828652, -2.179675, 3.079437, 0, 0, 0, 1, 1,
1.832839, -1.068237, 0.6785275, 0, 0, 0, 1, 1,
1.836687, 0.9578462, 2.538815, 0, 0, 0, 1, 1,
1.848967, 1.600269, 1.52614, 0, 0, 0, 1, 1,
1.849038, 1.260861, 1.77906, 0, 0, 0, 1, 1,
1.850497, -0.08187901, 2.392367, 0, 0, 0, 1, 1,
1.862723, 0.8629324, 1.404212, 0, 0, 0, 1, 1,
1.86612, -0.5815977, 1.65025, 1, 1, 1, 1, 1,
1.879243, -1.555693, 1.967525, 1, 1, 1, 1, 1,
1.880211, -0.6715569, 2.742737, 1, 1, 1, 1, 1,
1.897201, 1.307227, -0.04226533, 1, 1, 1, 1, 1,
1.903281, -0.4911664, 0.6938766, 1, 1, 1, 1, 1,
1.912452, -0.6753299, 1.17157, 1, 1, 1, 1, 1,
1.956823, 1.343222, 0.7528771, 1, 1, 1, 1, 1,
1.96442, -0.2509005, 1.517645, 1, 1, 1, 1, 1,
2.027793, 0.9524951, 2.918641, 1, 1, 1, 1, 1,
2.037525, 1.225154, 1.569038, 1, 1, 1, 1, 1,
2.040451, 0.3390585, 1.198825, 1, 1, 1, 1, 1,
2.075387, -0.7658907, 1.857895, 1, 1, 1, 1, 1,
2.092717, 0.5897875, 0.5143619, 1, 1, 1, 1, 1,
2.104758, -0.07929774, 0.583012, 1, 1, 1, 1, 1,
2.110886, -1.251678, 2.854359, 1, 1, 1, 1, 1,
2.11812, 0.396202, 1.483594, 0, 0, 1, 1, 1,
2.118522, -0.5026094, 2.154388, 1, 0, 0, 1, 1,
2.120299, -1.80267, 1.561184, 1, 0, 0, 1, 1,
2.127553, 0.7694212, 2.302994, 1, 0, 0, 1, 1,
2.130216, 1.254081, 1.139853, 1, 0, 0, 1, 1,
2.130553, 0.6273246, 2.657326, 1, 0, 0, 1, 1,
2.162311, -0.5626765, 3.388099, 0, 0, 0, 1, 1,
2.245558, 1.456167, 1.011805, 0, 0, 0, 1, 1,
2.254911, 0.8787251, 2.458463, 0, 0, 0, 1, 1,
2.390441, 1.669733, 1.020067, 0, 0, 0, 1, 1,
2.409851, 1.259598, 3.198645, 0, 0, 0, 1, 1,
2.432241, -1.663182, 2.064675, 0, 0, 0, 1, 1,
2.446067, 0.5245687, 2.014615, 0, 0, 0, 1, 1,
2.465444, -0.2562672, -0.1464974, 1, 1, 1, 1, 1,
2.470104, 0.2119711, 1.724954, 1, 1, 1, 1, 1,
2.615707, -1.255046, 2.646177, 1, 1, 1, 1, 1,
2.616527, -0.3138664, 1.40002, 1, 1, 1, 1, 1,
2.617133, -0.07023339, -0.007363756, 1, 1, 1, 1, 1,
2.845678, -0.3242044, 3.488543, 1, 1, 1, 1, 1,
3.033173, -0.3518552, 2.804415, 1, 1, 1, 1, 1
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
var radius = 9.826838;
var distance = 34.51635;
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
mvMatrix.translate( 0.4429455, -0.0527935, -0.01925945 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.51635);
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