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
-3.175749, -0.13962, -1.363254, 1, 0, 0, 1,
-3.117453, -0.5854627, -2.221978, 1, 0.007843138, 0, 1,
-2.820123, -0.3416101, -1.447149, 1, 0.01176471, 0, 1,
-2.574221, -0.1024739, -2.478289, 1, 0.01960784, 0, 1,
-2.466419, 0.5356824, -1.026124, 1, 0.02352941, 0, 1,
-2.423164, 0.003945106, -1.481859, 1, 0.03137255, 0, 1,
-2.378096, 1.290009, -3.1912, 1, 0.03529412, 0, 1,
-2.287337, 1.861961, -1.173913, 1, 0.04313726, 0, 1,
-2.27333, 1.152468, -0.995272, 1, 0.04705882, 0, 1,
-2.244504, -0.7093217, 0.2811656, 1, 0.05490196, 0, 1,
-2.236764, 0.4452926, -0.8914586, 1, 0.05882353, 0, 1,
-2.181914, -0.08604708, -1.166916, 1, 0.06666667, 0, 1,
-2.157561, -0.4038371, -1.767221, 1, 0.07058824, 0, 1,
-2.156776, 0.4063078, -0.4861617, 1, 0.07843138, 0, 1,
-2.084548, 1.229034, -0.310621, 1, 0.08235294, 0, 1,
-2.055893, 0.9931452, -1.984257, 1, 0.09019608, 0, 1,
-2.040199, -0.6318994, -3.119418, 1, 0.09411765, 0, 1,
-2.036108, -2.07752, -3.052299, 1, 0.1019608, 0, 1,
-2.002486, -0.4026021, -2.124672, 1, 0.1098039, 0, 1,
-1.977849, -0.9936619, -1.308553, 1, 0.1137255, 0, 1,
-1.967785, 0.6150393, -1.501055, 1, 0.1215686, 0, 1,
-1.963476, 0.6616916, 0.2678054, 1, 0.1254902, 0, 1,
-1.940911, 1.162864, -1.845031, 1, 0.1333333, 0, 1,
-1.92568, -1.531864, -1.250365, 1, 0.1372549, 0, 1,
-1.923391, 0.1821414, -2.896139, 1, 0.145098, 0, 1,
-1.918372, 0.9910015, -1.182662, 1, 0.1490196, 0, 1,
-1.90463, -0.2492025, -0.3518124, 1, 0.1568628, 0, 1,
-1.891459, 0.2319714, -2.706347, 1, 0.1607843, 0, 1,
-1.861481, 0.1521101, -3.697677, 1, 0.1686275, 0, 1,
-1.850823, -1.454781, -4.174468, 1, 0.172549, 0, 1,
-1.838743, 0.7772271, -0.4038233, 1, 0.1803922, 0, 1,
-1.833283, 0.184298, -1.66592, 1, 0.1843137, 0, 1,
-1.801471, 1.112715, -1.215967, 1, 0.1921569, 0, 1,
-1.798234, 1.051441, -2.091649, 1, 0.1960784, 0, 1,
-1.797288, -1.634369, -1.448973, 1, 0.2039216, 0, 1,
-1.79723, 0.5230228, -1.099644, 1, 0.2117647, 0, 1,
-1.774842, -0.9286726, -0.8763985, 1, 0.2156863, 0, 1,
-1.770361, 0.4284937, -1.703746, 1, 0.2235294, 0, 1,
-1.764006, 1.197535, -0.1119171, 1, 0.227451, 0, 1,
-1.757994, -0.4422952, -1.120203, 1, 0.2352941, 0, 1,
-1.737655, 0.1700998, -3.909822, 1, 0.2392157, 0, 1,
-1.734395, -0.1670571, -1.682201, 1, 0.2470588, 0, 1,
-1.733973, 0.3213937, -1.076629, 1, 0.2509804, 0, 1,
-1.72941, 0.2036873, 0.6109512, 1, 0.2588235, 0, 1,
-1.725913, -0.115049, -2.352014, 1, 0.2627451, 0, 1,
-1.719014, -0.6843182, -1.555112, 1, 0.2705882, 0, 1,
-1.67456, -0.1913547, -1.575539, 1, 0.2745098, 0, 1,
-1.673591, 1.703073, -2.096294, 1, 0.282353, 0, 1,
-1.672403, 0.2884926, -1.240364, 1, 0.2862745, 0, 1,
-1.656593, 0.9502331, -0.6248307, 1, 0.2941177, 0, 1,
-1.654986, 1.725382, -1.261914, 1, 0.3019608, 0, 1,
-1.652302, -0.5138355, -1.890005, 1, 0.3058824, 0, 1,
-1.651986, 1.089643, -2.224124, 1, 0.3137255, 0, 1,
-1.642153, 0.2835417, -1.947125, 1, 0.3176471, 0, 1,
-1.641965, 0.9730778, -0.5135989, 1, 0.3254902, 0, 1,
-1.641486, 1.579953, -0.4793725, 1, 0.3294118, 0, 1,
-1.638786, -0.5361949, -1.049127, 1, 0.3372549, 0, 1,
-1.630982, -0.3879043, -1.673432, 1, 0.3411765, 0, 1,
-1.612247, -0.5587748, -2.256893, 1, 0.3490196, 0, 1,
-1.610817, 0.4872415, -1.452585, 1, 0.3529412, 0, 1,
-1.610267, 0.830694, -0.63644, 1, 0.3607843, 0, 1,
-1.555243, 0.5752204, -2.029887, 1, 0.3647059, 0, 1,
-1.553749, 0.04711775, 0.2324694, 1, 0.372549, 0, 1,
-1.529357, -0.2871269, 0.02704586, 1, 0.3764706, 0, 1,
-1.526153, -0.2087537, -0.2508642, 1, 0.3843137, 0, 1,
-1.521444, 0.01338107, -0.7752945, 1, 0.3882353, 0, 1,
-1.514461, -0.02186951, -3.329589, 1, 0.3960784, 0, 1,
-1.513566, -0.4466819, -0.7979696, 1, 0.4039216, 0, 1,
-1.503854, -0.4694282, -2.38896, 1, 0.4078431, 0, 1,
-1.489121, 0.06330833, -0.8461582, 1, 0.4156863, 0, 1,
-1.484915, 1.523935, -0.3462738, 1, 0.4196078, 0, 1,
-1.484377, -0.9121982, -0.8812453, 1, 0.427451, 0, 1,
-1.483777, -0.5009336, -3.246418, 1, 0.4313726, 0, 1,
-1.480752, -1.002269, -3.455667, 1, 0.4392157, 0, 1,
-1.46321, 0.6020579, -0.8851575, 1, 0.4431373, 0, 1,
-1.457476, -0.7067887, -0.6550531, 1, 0.4509804, 0, 1,
-1.439859, -0.04985692, 0.725227, 1, 0.454902, 0, 1,
-1.437319, 0.585524, 0.21012, 1, 0.4627451, 0, 1,
-1.436086, -0.2160986, -0.9392456, 1, 0.4666667, 0, 1,
-1.435065, 2.015728, -1.699502, 1, 0.4745098, 0, 1,
-1.422033, 0.4413778, -2.122133, 1, 0.4784314, 0, 1,
-1.414592, -0.4650911, -1.404101, 1, 0.4862745, 0, 1,
-1.405855, -0.2990665, -1.463938, 1, 0.4901961, 0, 1,
-1.396406, -1.067825, -1.363203, 1, 0.4980392, 0, 1,
-1.393846, 0.1871886, -1.962374, 1, 0.5058824, 0, 1,
-1.391581, -1.496993, -1.710462, 1, 0.509804, 0, 1,
-1.387159, 2.1057, -1.096614, 1, 0.5176471, 0, 1,
-1.380969, -0.2884758, -1.452862, 1, 0.5215687, 0, 1,
-1.341786, -0.4028395, -2.598553, 1, 0.5294118, 0, 1,
-1.341501, -1.288556, -1.636938, 1, 0.5333334, 0, 1,
-1.338773, -0.210162, -2.880653, 1, 0.5411765, 0, 1,
-1.337566, 1.780712, 0.8242776, 1, 0.5450981, 0, 1,
-1.321282, -1.2921, -2.917683, 1, 0.5529412, 0, 1,
-1.295234, -0.7463082, -1.446396, 1, 0.5568628, 0, 1,
-1.284761, 0.9498443, -0.9183263, 1, 0.5647059, 0, 1,
-1.284712, -0.1686524, -3.310882, 1, 0.5686275, 0, 1,
-1.28272, -0.05179876, -0.934085, 1, 0.5764706, 0, 1,
-1.279808, -0.9169365, -1.530273, 1, 0.5803922, 0, 1,
-1.277125, -1.07249, -1.562423, 1, 0.5882353, 0, 1,
-1.266879, -1.451982, -1.815561, 1, 0.5921569, 0, 1,
-1.258461, -0.783563, -3.972465, 1, 0.6, 0, 1,
-1.254344, 1.119748, 0.0509687, 1, 0.6078432, 0, 1,
-1.248902, -1.079893, -3.77574, 1, 0.6117647, 0, 1,
-1.248375, -0.174215, -2.88084, 1, 0.6196079, 0, 1,
-1.247813, -0.7977358, -0.1696565, 1, 0.6235294, 0, 1,
-1.233173, -1.859815, -3.28565, 1, 0.6313726, 0, 1,
-1.232495, -1.126623, -2.626861, 1, 0.6352941, 0, 1,
-1.23096, -0.6537161, -0.5318335, 1, 0.6431373, 0, 1,
-1.226137, 0.8861665, -3.173795, 1, 0.6470588, 0, 1,
-1.216432, -0.5027671, -1.688805, 1, 0.654902, 0, 1,
-1.207031, 0.8017758, -0.1707013, 1, 0.6588235, 0, 1,
-1.205599, -0.216498, -2.541253, 1, 0.6666667, 0, 1,
-1.20546, -0.3184744, -0.7646634, 1, 0.6705883, 0, 1,
-1.199718, -0.3121913, -3.809588, 1, 0.6784314, 0, 1,
-1.199381, 0.5220018, -0.5608279, 1, 0.682353, 0, 1,
-1.191232, 0.3696418, -3.047363, 1, 0.6901961, 0, 1,
-1.187767, -0.2188196, -1.728145, 1, 0.6941177, 0, 1,
-1.185949, 0.4122627, -0.4769942, 1, 0.7019608, 0, 1,
-1.18308, 0.09948376, -0.688848, 1, 0.7098039, 0, 1,
-1.173818, -0.5625196, -3.962191, 1, 0.7137255, 0, 1,
-1.172768, -0.8198386, -1.554302, 1, 0.7215686, 0, 1,
-1.172311, 0.2252683, -0.7799565, 1, 0.7254902, 0, 1,
-1.171757, 0.9416898, -0.6828005, 1, 0.7333333, 0, 1,
-1.168142, 0.9800007, -0.03467378, 1, 0.7372549, 0, 1,
-1.167873, -1.428312, -1.322883, 1, 0.7450981, 0, 1,
-1.167412, 1.023651, -1.781269, 1, 0.7490196, 0, 1,
-1.166682, 0.37619, -1.777073, 1, 0.7568628, 0, 1,
-1.157596, 0.3325236, 0.2930639, 1, 0.7607843, 0, 1,
-1.15463, -0.7589802, -1.964415, 1, 0.7686275, 0, 1,
-1.143612, -1.650903, -3.647209, 1, 0.772549, 0, 1,
-1.139202, -0.8643989, -1.498649, 1, 0.7803922, 0, 1,
-1.138872, 0.4532257, -2.606411, 1, 0.7843137, 0, 1,
-1.136683, -0.4692932, -1.051459, 1, 0.7921569, 0, 1,
-1.133449, -0.7544508, -3.021905, 1, 0.7960784, 0, 1,
-1.131212, -0.08870587, -0.251536, 1, 0.8039216, 0, 1,
-1.130087, 0.3982434, -1.697846, 1, 0.8117647, 0, 1,
-1.121186, 0.6800676, -1.859529, 1, 0.8156863, 0, 1,
-1.11951, -1.394997, -1.925934, 1, 0.8235294, 0, 1,
-1.117262, 0.3985491, -1.818079, 1, 0.827451, 0, 1,
-1.106589, 2.156319, -0.123308, 1, 0.8352941, 0, 1,
-1.101502, -1.416919, -2.898404, 1, 0.8392157, 0, 1,
-1.099399, -0.1678578, -2.200184, 1, 0.8470588, 0, 1,
-1.098851, 1.720938, -0.4741204, 1, 0.8509804, 0, 1,
-1.098279, 0.06989002, -0.1695597, 1, 0.8588235, 0, 1,
-1.096404, -2.317338, -2.953124, 1, 0.8627451, 0, 1,
-1.08568, 1.128006, -1.052382, 1, 0.8705882, 0, 1,
-1.080703, -0.91364, -2.797642, 1, 0.8745098, 0, 1,
-1.080168, -2.854587, -1.113714, 1, 0.8823529, 0, 1,
-1.078419, 0.2642584, -1.017977, 1, 0.8862745, 0, 1,
-1.078113, 1.534051, 0.3138133, 1, 0.8941177, 0, 1,
-1.076194, 0.6936465, -0.5633329, 1, 0.8980392, 0, 1,
-1.072199, 0.4932067, -0.2795976, 1, 0.9058824, 0, 1,
-1.071294, 1.002176, -0.7654147, 1, 0.9137255, 0, 1,
-1.069438, 1.452131, 0.2592942, 1, 0.9176471, 0, 1,
-1.064415, 0.1219202, -3.872666, 1, 0.9254902, 0, 1,
-1.06355, 0.07092408, -1.433515, 1, 0.9294118, 0, 1,
-1.056661, -1.080793, -2.609951, 1, 0.9372549, 0, 1,
-1.046051, -0.380148, -3.056446, 1, 0.9411765, 0, 1,
-1.041445, 1.868829, -0.9438189, 1, 0.9490196, 0, 1,
-1.041087, -0.7738752, -3.0523, 1, 0.9529412, 0, 1,
-1.040723, -1.389575, -3.865088, 1, 0.9607843, 0, 1,
-1.033472, -0.3416052, -2.197071, 1, 0.9647059, 0, 1,
-1.031259, 1.295106, 0.6438236, 1, 0.972549, 0, 1,
-1.024084, 0.7675045, -0.8542763, 1, 0.9764706, 0, 1,
-1.019746, 0.4972599, -0.3567969, 1, 0.9843137, 0, 1,
-1.013404, -0.0132753, -1.948497, 1, 0.9882353, 0, 1,
-1.012441, 0.8130509, -0.6103232, 1, 0.9960784, 0, 1,
-1.011853, 0.09558813, -1.143732, 0.9960784, 1, 0, 1,
-1.010147, 1.547053, -1.063932, 0.9921569, 1, 0, 1,
-1.00606, -1.260022, -1.829045, 0.9843137, 1, 0, 1,
-1.002714, 1.954127, -0.8767968, 0.9803922, 1, 0, 1,
-0.9839845, -1.493059, -3.629205, 0.972549, 1, 0, 1,
-0.9762023, -0.406762, -0.8779339, 0.9686275, 1, 0, 1,
-0.9750211, -1.32155, -2.504287, 0.9607843, 1, 0, 1,
-0.9680022, 2.206935, -1.104443, 0.9568627, 1, 0, 1,
-0.9596831, -0.806125, -1.685329, 0.9490196, 1, 0, 1,
-0.9586383, -0.941542, -0.9309937, 0.945098, 1, 0, 1,
-0.9578032, -0.2365317, -1.490597, 0.9372549, 1, 0, 1,
-0.9572943, 2.116498, -1.544884, 0.9333333, 1, 0, 1,
-0.9528969, -1.267153, -0.5899904, 0.9254902, 1, 0, 1,
-0.9512681, 0.5389161, -0.3173465, 0.9215686, 1, 0, 1,
-0.9494159, 1.278427, -1.487055, 0.9137255, 1, 0, 1,
-0.9485648, 1.289514, -1.80386, 0.9098039, 1, 0, 1,
-0.9395795, 0.4276993, -1.069543, 0.9019608, 1, 0, 1,
-0.9285751, 0.08921447, 0.5893188, 0.8941177, 1, 0, 1,
-0.9218466, -2.045663, -0.6622235, 0.8901961, 1, 0, 1,
-0.9166368, -1.170078, -3.322913, 0.8823529, 1, 0, 1,
-0.9106374, 1.109678, 0.1294721, 0.8784314, 1, 0, 1,
-0.9043001, 0.5508227, -1.887547, 0.8705882, 1, 0, 1,
-0.9023788, -0.04679759, -1.53824, 0.8666667, 1, 0, 1,
-0.8985825, 0.1507531, -0.7342658, 0.8588235, 1, 0, 1,
-0.8903155, 2.743789, 0.4597995, 0.854902, 1, 0, 1,
-0.8871004, 0.6914505, -0.4738376, 0.8470588, 1, 0, 1,
-0.879863, 0.08287543, -3.89154, 0.8431373, 1, 0, 1,
-0.8795068, 0.06847736, -0.4843293, 0.8352941, 1, 0, 1,
-0.8718089, -2.446864, -2.166552, 0.8313726, 1, 0, 1,
-0.8680769, -0.3988543, -1.704615, 0.8235294, 1, 0, 1,
-0.867084, -0.7277163, -2.196343, 0.8196079, 1, 0, 1,
-0.8583845, 0.1956466, -1.665859, 0.8117647, 1, 0, 1,
-0.8556958, -1.864476, -4.612857, 0.8078431, 1, 0, 1,
-0.8494905, 0.8719082, -1.429, 0.8, 1, 0, 1,
-0.8472614, -0.7895885, -3.677222, 0.7921569, 1, 0, 1,
-0.8467265, 0.5314733, 0.1910359, 0.7882353, 1, 0, 1,
-0.8439317, 0.3794867, -0.7432715, 0.7803922, 1, 0, 1,
-0.8361511, 1.563406, -0.8458516, 0.7764706, 1, 0, 1,
-0.8354137, 1.507074, -0.6290256, 0.7686275, 1, 0, 1,
-0.8318611, -2.412418, -2.542449, 0.7647059, 1, 0, 1,
-0.8242335, 0.2839759, -3.029511, 0.7568628, 1, 0, 1,
-0.82416, -1.440646, -2.807766, 0.7529412, 1, 0, 1,
-0.8098413, 0.2029228, 1.031465, 0.7450981, 1, 0, 1,
-0.8023314, 0.1862364, -2.329577, 0.7411765, 1, 0, 1,
-0.7981177, -0.1917444, -0.3057511, 0.7333333, 1, 0, 1,
-0.7968217, 1.80857, -2.029854, 0.7294118, 1, 0, 1,
-0.7967277, 1.474805, -1.007502, 0.7215686, 1, 0, 1,
-0.7947447, -1.497786, -2.323355, 0.7176471, 1, 0, 1,
-0.7922901, -0.141119, -1.891484, 0.7098039, 1, 0, 1,
-0.7870613, 1.034831, -0.3654273, 0.7058824, 1, 0, 1,
-0.7856596, -0.6475196, -3.982152, 0.6980392, 1, 0, 1,
-0.7845103, 2.365897, -1.388191, 0.6901961, 1, 0, 1,
-0.7827375, 1.238325, -0.2875392, 0.6862745, 1, 0, 1,
-0.7786689, 0.04084583, 0.9890369, 0.6784314, 1, 0, 1,
-0.7758968, -0.7792934, -4.690076, 0.6745098, 1, 0, 1,
-0.7756348, 1.286892, -0.07544922, 0.6666667, 1, 0, 1,
-0.7738084, 0.9738347, -2.462601, 0.6627451, 1, 0, 1,
-0.7667846, -1.550238, -1.71662, 0.654902, 1, 0, 1,
-0.7640647, 1.334712, 0.7038673, 0.6509804, 1, 0, 1,
-0.7625802, 0.4367304, -2.557559, 0.6431373, 1, 0, 1,
-0.7615629, 1.098805, -0.5364719, 0.6392157, 1, 0, 1,
-0.7582591, -0.2561294, -1.626952, 0.6313726, 1, 0, 1,
-0.7459537, -2.548937, -2.421196, 0.627451, 1, 0, 1,
-0.7349926, -0.1384207, -1.496179, 0.6196079, 1, 0, 1,
-0.7304401, 1.456183, 0.3009217, 0.6156863, 1, 0, 1,
-0.7109497, 0.3414927, -1.708816, 0.6078432, 1, 0, 1,
-0.7101613, 0.276279, -0.4176857, 0.6039216, 1, 0, 1,
-0.7094158, -0.2268843, 1.030511, 0.5960785, 1, 0, 1,
-0.708795, -0.9000437, -1.588608, 0.5882353, 1, 0, 1,
-0.7054372, 0.6200715, 0.4341561, 0.5843138, 1, 0, 1,
-0.7035479, -1.496657, -2.303605, 0.5764706, 1, 0, 1,
-0.7012082, 0.2077276, -2.737327, 0.572549, 1, 0, 1,
-0.7011796, 1.07791, 0.6720831, 0.5647059, 1, 0, 1,
-0.6984345, 0.4431788, -0.7322553, 0.5607843, 1, 0, 1,
-0.695608, -1.086712, -0.6063157, 0.5529412, 1, 0, 1,
-0.692998, 0.4500661, -2.257099, 0.5490196, 1, 0, 1,
-0.6927601, 0.3287166, -0.1597081, 0.5411765, 1, 0, 1,
-0.6918374, -0.299507, -1.83335, 0.5372549, 1, 0, 1,
-0.6917769, 1.90389, -3.444536, 0.5294118, 1, 0, 1,
-0.6900885, 2.584715, -2.36402, 0.5254902, 1, 0, 1,
-0.6885337, -0.006811848, -1.716056, 0.5176471, 1, 0, 1,
-0.6872444, -0.8758978, -1.077162, 0.5137255, 1, 0, 1,
-0.6835901, -0.0493873, 0.06883504, 0.5058824, 1, 0, 1,
-0.6832492, -0.4125887, -1.008156, 0.5019608, 1, 0, 1,
-0.6797828, -0.4999912, -2.218105, 0.4941176, 1, 0, 1,
-0.6786109, -0.8268254, -2.346425, 0.4862745, 1, 0, 1,
-0.6730124, 0.6837331, -0.9905802, 0.4823529, 1, 0, 1,
-0.6722563, -0.4277083, -0.7771341, 0.4745098, 1, 0, 1,
-0.670413, -1.566548, -1.887744, 0.4705882, 1, 0, 1,
-0.6659067, -0.9249747, -3.379383, 0.4627451, 1, 0, 1,
-0.6638306, 0.3149512, -1.065179, 0.4588235, 1, 0, 1,
-0.6569862, 2.007415, -1.845688, 0.4509804, 1, 0, 1,
-0.654046, 0.9594681, -0.6133342, 0.4470588, 1, 0, 1,
-0.6496116, -0.8567346, -2.524813, 0.4392157, 1, 0, 1,
-0.6459896, 0.1465711, -2.445311, 0.4352941, 1, 0, 1,
-0.6437174, 0.1437593, -1.659177, 0.427451, 1, 0, 1,
-0.6430227, 0.4646969, -3.785637, 0.4235294, 1, 0, 1,
-0.6409059, 0.3356459, -2.104116, 0.4156863, 1, 0, 1,
-0.6352195, -0.9192173, -0.5000822, 0.4117647, 1, 0, 1,
-0.6343678, 0.9448856, -1.284111, 0.4039216, 1, 0, 1,
-0.6343495, 0.09546822, -1.966145, 0.3960784, 1, 0, 1,
-0.6339415, -0.1145986, -1.201388, 0.3921569, 1, 0, 1,
-0.6296815, 1.940716, -0.2339443, 0.3843137, 1, 0, 1,
-0.6286443, -0.1782253, -1.849412, 0.3803922, 1, 0, 1,
-0.6198983, -0.7026247, -2.410014, 0.372549, 1, 0, 1,
-0.6160468, 0.08117419, -4.050619, 0.3686275, 1, 0, 1,
-0.6156771, -0.04868115, -2.118542, 0.3607843, 1, 0, 1,
-0.6135115, 0.4474784, -0.7357478, 0.3568628, 1, 0, 1,
-0.6127975, 1.757975, 0.1230133, 0.3490196, 1, 0, 1,
-0.610275, -1.06877, -2.838787, 0.345098, 1, 0, 1,
-0.610109, -0.2982203, -0.495084, 0.3372549, 1, 0, 1,
-0.6095907, 0.1308512, -1.491299, 0.3333333, 1, 0, 1,
-0.6094874, 0.1680106, -0.9947807, 0.3254902, 1, 0, 1,
-0.6082578, -1.001642, -3.01018, 0.3215686, 1, 0, 1,
-0.6065485, -1.355253, -2.923316, 0.3137255, 1, 0, 1,
-0.6065054, 1.609376, 2.077282, 0.3098039, 1, 0, 1,
-0.6025559, -0.4256671, -0.4748598, 0.3019608, 1, 0, 1,
-0.6007272, 0.1773123, -1.724519, 0.2941177, 1, 0, 1,
-0.5992953, -0.8928801, -3.944716, 0.2901961, 1, 0, 1,
-0.5988258, -0.2909012, -1.488238, 0.282353, 1, 0, 1,
-0.597119, -1.241335, -1.859138, 0.2784314, 1, 0, 1,
-0.595031, 0.3299477, -1.008159, 0.2705882, 1, 0, 1,
-0.5922269, -0.8374991, -1.276671, 0.2666667, 1, 0, 1,
-0.5898232, -0.6527011, -2.005501, 0.2588235, 1, 0, 1,
-0.5893506, 0.4706831, -0.6657514, 0.254902, 1, 0, 1,
-0.587102, -1.865497, -4.76028, 0.2470588, 1, 0, 1,
-0.5840019, 1.349938, 0.8600449, 0.2431373, 1, 0, 1,
-0.5835888, 0.4140412, -2.298284, 0.2352941, 1, 0, 1,
-0.5687506, -0.5756153, -2.436437, 0.2313726, 1, 0, 1,
-0.5682867, 0.3133231, -1.340082, 0.2235294, 1, 0, 1,
-0.5625782, 0.6042312, 0.4727056, 0.2196078, 1, 0, 1,
-0.5479935, 0.2379895, 0.06315138, 0.2117647, 1, 0, 1,
-0.5478334, 0.1434465, -1.782061, 0.2078431, 1, 0, 1,
-0.5441604, 0.3777828, -1.797878, 0.2, 1, 0, 1,
-0.5248827, 0.4980303, -0.9318251, 0.1921569, 1, 0, 1,
-0.5247753, -0.6562505, -3.357802, 0.1882353, 1, 0, 1,
-0.5241004, 0.7336888, -0.2659543, 0.1803922, 1, 0, 1,
-0.5239757, -1.801296, -3.293172, 0.1764706, 1, 0, 1,
-0.503804, -1.061994, -3.401744, 0.1686275, 1, 0, 1,
-0.5017499, -0.9229056, -1.211812, 0.1647059, 1, 0, 1,
-0.5013244, -0.2298947, -1.777011, 0.1568628, 1, 0, 1,
-0.4974267, 1.716776, -0.7776052, 0.1529412, 1, 0, 1,
-0.4922318, -0.3143918, -1.597664, 0.145098, 1, 0, 1,
-0.487065, 0.5293588, -0.7239795, 0.1411765, 1, 0, 1,
-0.4833646, 1.143104, -2.043684, 0.1333333, 1, 0, 1,
-0.4827557, -0.4799626, -1.85857, 0.1294118, 1, 0, 1,
-0.4794925, 0.3774933, 0.1563404, 0.1215686, 1, 0, 1,
-0.4759141, 0.4083756, -0.7707323, 0.1176471, 1, 0, 1,
-0.4706297, 0.3122252, -1.767487, 0.1098039, 1, 0, 1,
-0.4700192, 1.047476, -0.5272813, 0.1058824, 1, 0, 1,
-0.4623788, 0.2214229, 1.172689, 0.09803922, 1, 0, 1,
-0.4503505, 0.244923, -1.350185, 0.09019608, 1, 0, 1,
-0.4490959, 1.374241, 0.4934984, 0.08627451, 1, 0, 1,
-0.4436476, -0.4585525, -2.540226, 0.07843138, 1, 0, 1,
-0.4417667, 0.0664454, -1.146736, 0.07450981, 1, 0, 1,
-0.4410316, 0.6554206, 0.3678779, 0.06666667, 1, 0, 1,
-0.4392734, -0.7374563, -1.521267, 0.0627451, 1, 0, 1,
-0.4387168, -0.7940091, -3.141669, 0.05490196, 1, 0, 1,
-0.4382647, -1.040469, -3.668128, 0.05098039, 1, 0, 1,
-0.4329719, -0.05644648, -1.89427, 0.04313726, 1, 0, 1,
-0.4283818, 0.6852628, -0.4447776, 0.03921569, 1, 0, 1,
-0.4261608, -0.05250852, -1.640628, 0.03137255, 1, 0, 1,
-0.4197682, -1.082687, -2.918188, 0.02745098, 1, 0, 1,
-0.4161749, -0.8819739, -3.421286, 0.01960784, 1, 0, 1,
-0.4150442, 1.080603, 0.1944082, 0.01568628, 1, 0, 1,
-0.4046927, 0.3881475, -0.9286426, 0.007843138, 1, 0, 1,
-0.4023968, 0.909476, -1.521502, 0.003921569, 1, 0, 1,
-0.4019344, 0.1997208, -0.9365678, 0, 1, 0.003921569, 1,
-0.3959826, -0.7734652, -1.901661, 0, 1, 0.01176471, 1,
-0.395804, -0.4611186, -2.640324, 0, 1, 0.01568628, 1,
-0.3937443, 0.3066614, -0.6535941, 0, 1, 0.02352941, 1,
-0.3930966, -1.167828, -0.2994705, 0, 1, 0.02745098, 1,
-0.3922332, 0.8367922, -0.4173163, 0, 1, 0.03529412, 1,
-0.3912551, 0.6381572, 0.02971758, 0, 1, 0.03921569, 1,
-0.3889858, 0.394921, -2.074348, 0, 1, 0.04705882, 1,
-0.3870138, 1.738638, 0.1060276, 0, 1, 0.05098039, 1,
-0.3856551, -0.5503773, -1.420658, 0, 1, 0.05882353, 1,
-0.3854364, 0.6457888, -0.02906902, 0, 1, 0.0627451, 1,
-0.3850724, -1.404181, -1.512611, 0, 1, 0.07058824, 1,
-0.3848372, -0.9432814, -4.282979, 0, 1, 0.07450981, 1,
-0.3838818, -2.598713, -4.840587, 0, 1, 0.08235294, 1,
-0.3790058, 0.734769, -0.7063828, 0, 1, 0.08627451, 1,
-0.3781054, 0.3600345, -0.2662055, 0, 1, 0.09411765, 1,
-0.3687357, 0.03528224, -1.794377, 0, 1, 0.1019608, 1,
-0.3572648, -0.1672172, -2.602306, 0, 1, 0.1058824, 1,
-0.3505216, 0.9812853, -2.110674, 0, 1, 0.1137255, 1,
-0.3486551, 1.701599, 0.1770205, 0, 1, 0.1176471, 1,
-0.3477171, 0.3396984, -0.5022535, 0, 1, 0.1254902, 1,
-0.3475341, 2.173288, 1.007011, 0, 1, 0.1294118, 1,
-0.3462211, -0.3086081, -2.924134, 0, 1, 0.1372549, 1,
-0.3452545, 0.7378995, 0.2006515, 0, 1, 0.1411765, 1,
-0.3424585, -0.3244418, -2.648266, 0, 1, 0.1490196, 1,
-0.3411401, -0.9525782, -3.355659, 0, 1, 0.1529412, 1,
-0.3393095, 0.6355581, 0.6464651, 0, 1, 0.1607843, 1,
-0.3377375, 1.061059, -0.4001522, 0, 1, 0.1647059, 1,
-0.3374053, 0.8926681, 0.3266465, 0, 1, 0.172549, 1,
-0.3330922, -0.7044789, -1.913828, 0, 1, 0.1764706, 1,
-0.3276448, 0.6194217, 0.428775, 0, 1, 0.1843137, 1,
-0.3271894, -1.147562, -3.859305, 0, 1, 0.1882353, 1,
-0.3254007, 0.612035, -0.6062872, 0, 1, 0.1960784, 1,
-0.3187995, -0.1876734, -1.305477, 0, 1, 0.2039216, 1,
-0.312364, 0.211912, 1.328699, 0, 1, 0.2078431, 1,
-0.3079823, 1.581961, -0.25209, 0, 1, 0.2156863, 1,
-0.3068411, 1.123394, 0.2085786, 0, 1, 0.2196078, 1,
-0.3019426, -0.1185551, -0.6302999, 0, 1, 0.227451, 1,
-0.3017744, 1.002089, 0.4855072, 0, 1, 0.2313726, 1,
-0.299982, 0.416371, -1.225464, 0, 1, 0.2392157, 1,
-0.2935848, -0.03566549, -0.8884832, 0, 1, 0.2431373, 1,
-0.2910587, -0.8828677, -2.651702, 0, 1, 0.2509804, 1,
-0.2834588, -0.1278991, -1.221162, 0, 1, 0.254902, 1,
-0.2769291, 0.8837664, 1.337149, 0, 1, 0.2627451, 1,
-0.276241, -0.6631569, -2.672107, 0, 1, 0.2666667, 1,
-0.2755301, -0.2312589, -2.403453, 0, 1, 0.2745098, 1,
-0.272951, 1.200197, -1.112354, 0, 1, 0.2784314, 1,
-0.2708001, 0.3645929, -1.458548, 0, 1, 0.2862745, 1,
-0.2654008, -1.988327, -3.553857, 0, 1, 0.2901961, 1,
-0.261778, 1.800985, -0.9313458, 0, 1, 0.2980392, 1,
-0.2594344, 0.4529542, 1.625112, 0, 1, 0.3058824, 1,
-0.2558132, 0.4664887, 0.1238789, 0, 1, 0.3098039, 1,
-0.2536393, 1.363815, -0.799362, 0, 1, 0.3176471, 1,
-0.2534338, -0.2844847, -1.430214, 0, 1, 0.3215686, 1,
-0.2523312, -0.08503618, -1.547835, 0, 1, 0.3294118, 1,
-0.2464653, 1.27694, 0.1058685, 0, 1, 0.3333333, 1,
-0.2441271, 0.2840083, -0.1246085, 0, 1, 0.3411765, 1,
-0.2339751, -0.7001895, -2.784053, 0, 1, 0.345098, 1,
-0.2298045, 0.2981808, -0.2682079, 0, 1, 0.3529412, 1,
-0.2269418, -0.2506748, -3.4019, 0, 1, 0.3568628, 1,
-0.2269257, 0.2227826, -0.8256215, 0, 1, 0.3647059, 1,
-0.2260125, -0.3961333, -3.194098, 0, 1, 0.3686275, 1,
-0.2191769, 0.913896, 1.341258, 0, 1, 0.3764706, 1,
-0.218479, -0.1327397, -3.290461, 0, 1, 0.3803922, 1,
-0.2183621, 0.2587597, -2.530243, 0, 1, 0.3882353, 1,
-0.2167047, 0.5520481, -1.66716, 0, 1, 0.3921569, 1,
-0.2143347, 0.0881282, -2.53461, 0, 1, 0.4, 1,
-0.2127974, -0.6232586, -1.885624, 0, 1, 0.4078431, 1,
-0.2095976, -0.368732, -2.693638, 0, 1, 0.4117647, 1,
-0.206397, 1.57019, 1.57771, 0, 1, 0.4196078, 1,
-0.1974763, 2.499543, -0.9311253, 0, 1, 0.4235294, 1,
-0.1946712, 2.11114, 0.7519857, 0, 1, 0.4313726, 1,
-0.1882707, 0.4010008, -0.3217449, 0, 1, 0.4352941, 1,
-0.1863048, 0.5456002, -0.6445401, 0, 1, 0.4431373, 1,
-0.1839201, -1.29544, -1.870018, 0, 1, 0.4470588, 1,
-0.1837774, -0.2623147, -1.55118, 0, 1, 0.454902, 1,
-0.1795348, 0.1278055, -3.927868, 0, 1, 0.4588235, 1,
-0.1780819, 0.6177133, -0.9565213, 0, 1, 0.4666667, 1,
-0.1767538, -0.05935726, -1.034592, 0, 1, 0.4705882, 1,
-0.1746218, -1.607011, -3.665972, 0, 1, 0.4784314, 1,
-0.1718825, 0.6643252, -0.1113556, 0, 1, 0.4823529, 1,
-0.1717547, -0.4802304, -2.080371, 0, 1, 0.4901961, 1,
-0.1674541, -2.149469, -2.723854, 0, 1, 0.4941176, 1,
-0.1671416, -0.2044889, -3.19227, 0, 1, 0.5019608, 1,
-0.1664584, -0.2083735, -2.715063, 0, 1, 0.509804, 1,
-0.166444, -0.7613468, -2.123379, 0, 1, 0.5137255, 1,
-0.1657622, 0.2809781, 1.30082, 0, 1, 0.5215687, 1,
-0.1616604, -1.260457, -4.021913, 0, 1, 0.5254902, 1,
-0.1601413, -1.491582, -2.664222, 0, 1, 0.5333334, 1,
-0.1539304, 2.209803, -1.377847, 0, 1, 0.5372549, 1,
-0.1518279, 0.1329371, 0.2404044, 0, 1, 0.5450981, 1,
-0.1481632, -0.28646, -3.767035, 0, 1, 0.5490196, 1,
-0.1432488, 0.2944076, 0.5181499, 0, 1, 0.5568628, 1,
-0.143026, 1.014202, 1.912271, 0, 1, 0.5607843, 1,
-0.1372986, -0.8040176, -3.420681, 0, 1, 0.5686275, 1,
-0.1238214, -0.6678383, -4.807306, 0, 1, 0.572549, 1,
-0.1227698, 0.1796658, -0.7932108, 0, 1, 0.5803922, 1,
-0.1212828, 0.447604, 0.7541883, 0, 1, 0.5843138, 1,
-0.1208329, -0.01556013, -1.388088, 0, 1, 0.5921569, 1,
-0.1178121, 1.005624, 0.8296891, 0, 1, 0.5960785, 1,
-0.1156434, -0.3955392, -3.209452, 0, 1, 0.6039216, 1,
-0.115131, 0.1756126, -0.1192688, 0, 1, 0.6117647, 1,
-0.1125427, -0.2278188, -2.120054, 0, 1, 0.6156863, 1,
-0.1107426, 0.3745867, -0.2365026, 0, 1, 0.6235294, 1,
-0.1106941, -0.3971845, -4.510571, 0, 1, 0.627451, 1,
-0.1105394, 0.7752639, 1.21194, 0, 1, 0.6352941, 1,
-0.1085976, 0.0670118, -1.410129, 0, 1, 0.6392157, 1,
-0.1082143, -1.100247, -3.506918, 0, 1, 0.6470588, 1,
-0.1077197, -0.9048657, -3.131838, 0, 1, 0.6509804, 1,
-0.1069636, 0.1803329, -0.6583328, 0, 1, 0.6588235, 1,
-0.1003118, -0.01833168, -2.266429, 0, 1, 0.6627451, 1,
-0.0980349, -0.6941333, -2.104014, 0, 1, 0.6705883, 1,
-0.09595062, -0.5909023, -2.254718, 0, 1, 0.6745098, 1,
-0.09424453, 0.7722643, 0.1357644, 0, 1, 0.682353, 1,
-0.08749063, 1.78099, 0.9564835, 0, 1, 0.6862745, 1,
-0.08682834, -0.7255273, -3.059045, 0, 1, 0.6941177, 1,
-0.08211674, 0.8114479, 0.6148835, 0, 1, 0.7019608, 1,
-0.07974819, -0.6792104, -2.000974, 0, 1, 0.7058824, 1,
-0.07965062, 0.6278307, -1.448532, 0, 1, 0.7137255, 1,
-0.0779284, -1.384712, -4.473835, 0, 1, 0.7176471, 1,
-0.0778052, -0.6742807, -1.990355, 0, 1, 0.7254902, 1,
-0.07665274, 0.1651307, -1.950588, 0, 1, 0.7294118, 1,
-0.07659183, 0.3981704, -0.4549283, 0, 1, 0.7372549, 1,
-0.07562445, -0.2060339, -3.327204, 0, 1, 0.7411765, 1,
-0.07114132, 0.09190279, -0.3428804, 0, 1, 0.7490196, 1,
-0.0700928, -0.04124407, -2.995638, 0, 1, 0.7529412, 1,
-0.06881968, -0.1518425, -3.201186, 0, 1, 0.7607843, 1,
-0.06819969, -1.110954, -3.242419, 0, 1, 0.7647059, 1,
-0.06765125, -0.2467535, -3.482748, 0, 1, 0.772549, 1,
-0.0670177, -0.2937048, -1.754209, 0, 1, 0.7764706, 1,
-0.06603864, 1.239554, -0.00459113, 0, 1, 0.7843137, 1,
-0.06502379, -1.242817, -2.983303, 0, 1, 0.7882353, 1,
-0.05505269, -0.6829846, -3.521574, 0, 1, 0.7960784, 1,
-0.05314574, -0.1087289, -2.781249, 0, 1, 0.8039216, 1,
-0.04942888, -0.1208794, -2.000623, 0, 1, 0.8078431, 1,
-0.04654676, -1.039756, -2.58044, 0, 1, 0.8156863, 1,
-0.03916204, 0.8734016, 0.8428948, 0, 1, 0.8196079, 1,
-0.03519766, -0.6220535, -3.105786, 0, 1, 0.827451, 1,
-0.03214227, 0.5281317, 0.3004596, 0, 1, 0.8313726, 1,
-0.03066234, -0.7754288, -2.98257, 0, 1, 0.8392157, 1,
-0.03018373, 0.8374825, -0.8080629, 0, 1, 0.8431373, 1,
-0.02516382, -0.5509263, -2.874476, 0, 1, 0.8509804, 1,
-0.02420457, -0.9488813, -4.473068, 0, 1, 0.854902, 1,
-0.02274279, -1.102752, -4.404472, 0, 1, 0.8627451, 1,
-0.02215332, 0.7082506, -0.1398621, 0, 1, 0.8666667, 1,
-0.02210003, 1.205743, -0.08267279, 0, 1, 0.8745098, 1,
-0.01468167, 0.07148164, -0.7660394, 0, 1, 0.8784314, 1,
-0.01368118, 1.557489, 0.8882621, 0, 1, 0.8862745, 1,
-0.01271021, -0.8722665, -2.926139, 0, 1, 0.8901961, 1,
-0.00876947, -0.9130837, -3.998356, 0, 1, 0.8980392, 1,
-0.002580717, -0.6287207, -2.293568, 0, 1, 0.9058824, 1,
0.002755863, 0.2989994, -0.06683584, 0, 1, 0.9098039, 1,
0.003012347, -0.6295105, 3.13256, 0, 1, 0.9176471, 1,
0.01938567, -1.508363, 3.833133, 0, 1, 0.9215686, 1,
0.02159069, -1.645224, 4.369268, 0, 1, 0.9294118, 1,
0.02212487, -0.01629231, 3.219112, 0, 1, 0.9333333, 1,
0.02486139, 1.540527, -1.276802, 0, 1, 0.9411765, 1,
0.03056937, 0.5881452, 0.3943393, 0, 1, 0.945098, 1,
0.03064511, -0.3651521, 2.221107, 0, 1, 0.9529412, 1,
0.03449139, -0.8692275, 3.309768, 0, 1, 0.9568627, 1,
0.03454768, 0.3087602, -0.1282089, 0, 1, 0.9647059, 1,
0.03768123, -0.4401571, 4.16038, 0, 1, 0.9686275, 1,
0.03786781, 0.2019078, 0.004902587, 0, 1, 0.9764706, 1,
0.03967147, 0.9049238, 0.3498366, 0, 1, 0.9803922, 1,
0.04316312, 0.03212817, 0.1622249, 0, 1, 0.9882353, 1,
0.04507458, -1.738332, 5.3766, 0, 1, 0.9921569, 1,
0.04616308, -0.5505706, 2.492158, 0, 1, 1, 1,
0.05091893, 1.354447, 0.4865523, 0, 0.9921569, 1, 1,
0.05142577, -2.103567, 1.431913, 0, 0.9882353, 1, 1,
0.0595163, -0.4837238, 1.982414, 0, 0.9803922, 1, 1,
0.05993157, -1.051975, 3.683614, 0, 0.9764706, 1, 1,
0.06401385, -0.8720729, 3.181441, 0, 0.9686275, 1, 1,
0.06808519, -0.268499, 2.669816, 0, 0.9647059, 1, 1,
0.07261924, -0.7761255, 2.782682, 0, 0.9568627, 1, 1,
0.07527475, 0.8829785, -0.007835141, 0, 0.9529412, 1, 1,
0.07836869, -0.1240704, 1.076676, 0, 0.945098, 1, 1,
0.07947168, -0.4151897, 1.935359, 0, 0.9411765, 1, 1,
0.08352964, 0.9129867, 1.455607, 0, 0.9333333, 1, 1,
0.08420969, -0.6334423, 2.597043, 0, 0.9294118, 1, 1,
0.0867697, -0.5916145, 3.043936, 0, 0.9215686, 1, 1,
0.09060727, 1.287832, -0.4461253, 0, 0.9176471, 1, 1,
0.09467598, 0.6181535, -0.6608582, 0, 0.9098039, 1, 1,
0.09484888, -0.3600318, 4.85568, 0, 0.9058824, 1, 1,
0.1020111, 1.039992, -0.9952236, 0, 0.8980392, 1, 1,
0.1037545, 1.350864, -1.654723, 0, 0.8901961, 1, 1,
0.1045024, 1.856609, 0.3118589, 0, 0.8862745, 1, 1,
0.1078497, 0.9378728, 1.295963, 0, 0.8784314, 1, 1,
0.1092075, 1.171829, 0.1751471, 0, 0.8745098, 1, 1,
0.1106422, -0.9492458, 2.38558, 0, 0.8666667, 1, 1,
0.1126005, 1.245139, 0.5503592, 0, 0.8627451, 1, 1,
0.1133008, -0.9082602, 2.118773, 0, 0.854902, 1, 1,
0.114627, -1.830971, 2.621544, 0, 0.8509804, 1, 1,
0.1161432, 0.1418124, 1.033457, 0, 0.8431373, 1, 1,
0.1170018, -0.5319028, 3.139325, 0, 0.8392157, 1, 1,
0.1174516, -0.9159075, 5.170894, 0, 0.8313726, 1, 1,
0.1193079, -0.8531064, 2.144968, 0, 0.827451, 1, 1,
0.1208855, 0.13097, 0.01873569, 0, 0.8196079, 1, 1,
0.1216772, 1.390787, -1.175963, 0, 0.8156863, 1, 1,
0.1258176, -1.470538, 1.883192, 0, 0.8078431, 1, 1,
0.1258841, 1.58798, -1.094801, 0, 0.8039216, 1, 1,
0.1262026, 2.136086, -1.728645, 0, 0.7960784, 1, 1,
0.1285832, -0.3377406, 1.683715, 0, 0.7882353, 1, 1,
0.1349851, -0.7968177, 4.467583, 0, 0.7843137, 1, 1,
0.1358039, -0.6566494, 3.260801, 0, 0.7764706, 1, 1,
0.1359693, 0.6774528, 1.142443, 0, 0.772549, 1, 1,
0.1365564, -0.8654379, 3.156178, 0, 0.7647059, 1, 1,
0.1422367, 0.6093641, -1.640152, 0, 0.7607843, 1, 1,
0.1435779, -1.358126, 3.763331, 0, 0.7529412, 1, 1,
0.1440639, -0.436157, 1.879414, 0, 0.7490196, 1, 1,
0.1467518, 0.1615712, 2.141601, 0, 0.7411765, 1, 1,
0.1487903, 1.041803, 0.5577877, 0, 0.7372549, 1, 1,
0.1506204, 0.09891701, 3.091872, 0, 0.7294118, 1, 1,
0.1563579, 1.585772, 0.6137814, 0, 0.7254902, 1, 1,
0.163316, 0.7185685, -0.4083272, 0, 0.7176471, 1, 1,
0.1652188, -0.07554071, 2.716579, 0, 0.7137255, 1, 1,
0.1679088, 0.3610346, 1.153468, 0, 0.7058824, 1, 1,
0.1724402, -0.2372363, 3.850326, 0, 0.6980392, 1, 1,
0.1753819, 0.1438421, 0.7810354, 0, 0.6941177, 1, 1,
0.1776383, -1.63738, 4.738357, 0, 0.6862745, 1, 1,
0.1852775, 0.1879431, 1.196353, 0, 0.682353, 1, 1,
0.1881272, 0.5071092, 0.06412132, 0, 0.6745098, 1, 1,
0.1913341, -0.2195603, 0.651089, 0, 0.6705883, 1, 1,
0.2020942, 1.178316, 0.5490494, 0, 0.6627451, 1, 1,
0.2105521, 0.4437883, -1.86678, 0, 0.6588235, 1, 1,
0.2120284, -0.4746929, 3.481485, 0, 0.6509804, 1, 1,
0.2127649, -1.364729, 2.738904, 0, 0.6470588, 1, 1,
0.2203376, 1.311682, 1.22802, 0, 0.6392157, 1, 1,
0.2231754, -1.678948, 3.444384, 0, 0.6352941, 1, 1,
0.2299397, 0.6126636, 1.879594, 0, 0.627451, 1, 1,
0.2330723, -0.4666536, 3.505301, 0, 0.6235294, 1, 1,
0.2359349, -0.4051358, 0.3289829, 0, 0.6156863, 1, 1,
0.236013, -0.001347285, 1.324187, 0, 0.6117647, 1, 1,
0.239776, 2.254166, 0.3439919, 0, 0.6039216, 1, 1,
0.2403334, -0.550994, 1.923904, 0, 0.5960785, 1, 1,
0.2403608, 0.2878231, 2.592817, 0, 0.5921569, 1, 1,
0.2423565, 0.3724414, 0.3837746, 0, 0.5843138, 1, 1,
0.247628, 1.640828, -0.08109116, 0, 0.5803922, 1, 1,
0.2484488, -2.608949, 3.877235, 0, 0.572549, 1, 1,
0.2526215, 2.338853, -0.746018, 0, 0.5686275, 1, 1,
0.2553804, 0.03570728, 2.172974, 0, 0.5607843, 1, 1,
0.2580339, -2.71407, 3.403306, 0, 0.5568628, 1, 1,
0.2644607, -0.06285073, -0.7234593, 0, 0.5490196, 1, 1,
0.2680686, 2.113359, 2.003956, 0, 0.5450981, 1, 1,
0.2688771, -1.107688, 3.560692, 0, 0.5372549, 1, 1,
0.2700396, 0.3562416, -0.158995, 0, 0.5333334, 1, 1,
0.2739885, -0.3916823, 4.220057, 0, 0.5254902, 1, 1,
0.2766033, -1.037047, 4.160699, 0, 0.5215687, 1, 1,
0.2856796, -1.340901, 2.172563, 0, 0.5137255, 1, 1,
0.287053, 0.0822714, 0.6119661, 0, 0.509804, 1, 1,
0.2871638, 2.050793, -0.3983793, 0, 0.5019608, 1, 1,
0.2968282, 0.5875946, 0.253507, 0, 0.4941176, 1, 1,
0.2969811, 0.4301658, 0.9059407, 0, 0.4901961, 1, 1,
0.3014732, 0.624878, 0.6632292, 0, 0.4823529, 1, 1,
0.3071822, 1.186043, 0.8001387, 0, 0.4784314, 1, 1,
0.3079717, 0.06234056, 1.671538, 0, 0.4705882, 1, 1,
0.3138791, -0.7272087, 2.128817, 0, 0.4666667, 1, 1,
0.3262341, -0.1207368, 2.806598, 0, 0.4588235, 1, 1,
0.3310359, -0.01997146, 1.267167, 0, 0.454902, 1, 1,
0.3311344, -1.379898, 0.2710541, 0, 0.4470588, 1, 1,
0.3311815, 1.218351, 0.7325575, 0, 0.4431373, 1, 1,
0.332801, -0.83542, 3.381249, 0, 0.4352941, 1, 1,
0.3337813, -1.683833, 3.055695, 0, 0.4313726, 1, 1,
0.3352922, 1.223072, 2.380693, 0, 0.4235294, 1, 1,
0.3379415, 0.8794688, 0.8677294, 0, 0.4196078, 1, 1,
0.3380789, -0.02981226, 1.912244, 0, 0.4117647, 1, 1,
0.3401106, 0.9297546, 0.3759614, 0, 0.4078431, 1, 1,
0.34633, 1.130681, -0.7537016, 0, 0.4, 1, 1,
0.3496789, 0.1188179, -1.8825, 0, 0.3921569, 1, 1,
0.3527346, -0.2690097, 3.020418, 0, 0.3882353, 1, 1,
0.3541103, -0.4918332, 4.686584, 0, 0.3803922, 1, 1,
0.3547284, 0.2634709, -0.223218, 0, 0.3764706, 1, 1,
0.3583319, -0.03590974, 1.324468, 0, 0.3686275, 1, 1,
0.3584431, -0.7434429, 3.202985, 0, 0.3647059, 1, 1,
0.3599226, -0.8899744, 2.740038, 0, 0.3568628, 1, 1,
0.3618581, -0.0085861, 3.36445, 0, 0.3529412, 1, 1,
0.3636694, 1.718142, 0.1108414, 0, 0.345098, 1, 1,
0.3658412, -0.7423353, 4.403912, 0, 0.3411765, 1, 1,
0.3689339, -0.7212306, 2.20235, 0, 0.3333333, 1, 1,
0.3693859, -0.03016582, 1.529208, 0, 0.3294118, 1, 1,
0.3710786, -0.150181, 3.34702, 0, 0.3215686, 1, 1,
0.3740357, 1.047153, 0.440116, 0, 0.3176471, 1, 1,
0.3873069, -0.6358858, 1.914384, 0, 0.3098039, 1, 1,
0.3898389, -1.209966, 2.212029, 0, 0.3058824, 1, 1,
0.3903448, 0.5468357, 1.159603, 0, 0.2980392, 1, 1,
0.3926356, 1.568599, 0.5549306, 0, 0.2901961, 1, 1,
0.396482, -0.43539, 1.2615, 0, 0.2862745, 1, 1,
0.3975551, 0.1756692, 0.4735013, 0, 0.2784314, 1, 1,
0.3979065, 0.07176674, 1.682246, 0, 0.2745098, 1, 1,
0.3981704, 1.111167, 0.7466959, 0, 0.2666667, 1, 1,
0.3987606, 0.7012713, 1.123388, 0, 0.2627451, 1, 1,
0.4027195, 0.1905732, 2.213205, 0, 0.254902, 1, 1,
0.4075041, 0.3250577, 1.307036, 0, 0.2509804, 1, 1,
0.4100742, 0.7952137, 2.079927, 0, 0.2431373, 1, 1,
0.4202428, 0.2881608, 0.2670534, 0, 0.2392157, 1, 1,
0.4275329, 0.5809494, 0.01564989, 0, 0.2313726, 1, 1,
0.4290612, 2.862749, 0.8356992, 0, 0.227451, 1, 1,
0.4314365, -0.6035429, 5.193152, 0, 0.2196078, 1, 1,
0.4376334, 0.4047143, 1.958481, 0, 0.2156863, 1, 1,
0.4480419, -0.3155781, 2.548141, 0, 0.2078431, 1, 1,
0.4525712, 0.3197055, -0.858218, 0, 0.2039216, 1, 1,
0.4538967, 0.002489557, 2.862175, 0, 0.1960784, 1, 1,
0.4543746, -0.2991723, 3.486065, 0, 0.1882353, 1, 1,
0.4615261, -1.385575, 3.743665, 0, 0.1843137, 1, 1,
0.4637645, 0.4555349, 0.03292269, 0, 0.1764706, 1, 1,
0.465714, 1.962124, 0.6951127, 0, 0.172549, 1, 1,
0.471523, -0.1409711, 2.530953, 0, 0.1647059, 1, 1,
0.4725877, -0.3523507, 3.25027, 0, 0.1607843, 1, 1,
0.4754254, 1.330002, -0.3747799, 0, 0.1529412, 1, 1,
0.4833514, 0.8469322, 1.268568, 0, 0.1490196, 1, 1,
0.492007, -0.4241942, 3.079743, 0, 0.1411765, 1, 1,
0.4924524, -0.2847042, 2.56658, 0, 0.1372549, 1, 1,
0.5011306, 0.3324204, 0.6729923, 0, 0.1294118, 1, 1,
0.5014738, 0.538461, 2.008999, 0, 0.1254902, 1, 1,
0.5031242, -2.228641, 2.930318, 0, 0.1176471, 1, 1,
0.5042975, 0.4968412, -0.01126869, 0, 0.1137255, 1, 1,
0.5047625, 0.05208279, -0.1668275, 0, 0.1058824, 1, 1,
0.5048997, -0.3089622, 1.835436, 0, 0.09803922, 1, 1,
0.5080799, -0.4564148, 1.849775, 0, 0.09411765, 1, 1,
0.508652, -0.1189932, 1.796124, 0, 0.08627451, 1, 1,
0.5104132, 0.6552728, -1.615534, 0, 0.08235294, 1, 1,
0.5134789, 1.617898, 0.8912352, 0, 0.07450981, 1, 1,
0.5143142, 1.269517, 0.972579, 0, 0.07058824, 1, 1,
0.5151568, 1.480461, 0.9466791, 0, 0.0627451, 1, 1,
0.5160286, 0.2213262, 2.572302, 0, 0.05882353, 1, 1,
0.5165746, 0.2956913, 0.3778939, 0, 0.05098039, 1, 1,
0.517055, -2.000983, 3.729932, 0, 0.04705882, 1, 1,
0.5207835, -0.4127963, 3.691289, 0, 0.03921569, 1, 1,
0.5213457, -0.4903144, 2.337596, 0, 0.03529412, 1, 1,
0.5220624, 1.102501, -0.9081182, 0, 0.02745098, 1, 1,
0.522491, -1.250288, 3.79363, 0, 0.02352941, 1, 1,
0.5234591, 0.6624585, 0.1915881, 0, 0.01568628, 1, 1,
0.5234723, 1.003396, 1.137428, 0, 0.01176471, 1, 1,
0.5239493, -0.2381626, 2.311109, 0, 0.003921569, 1, 1,
0.5253524, 1.434672, 1.582485, 0.003921569, 0, 1, 1,
0.5265713, 0.444944, 1.422905, 0.007843138, 0, 1, 1,
0.5278221, -0.351229, 2.754185, 0.01568628, 0, 1, 1,
0.5298674, 0.5225032, 1.815023, 0.01960784, 0, 1, 1,
0.5317682, 0.09113838, 0.3532004, 0.02745098, 0, 1, 1,
0.5326282, -0.1755058, 2.83439, 0.03137255, 0, 1, 1,
0.5364263, -1.298817, 3.727198, 0.03921569, 0, 1, 1,
0.5381097, 0.8762941, 0.05286676, 0.04313726, 0, 1, 1,
0.5437465, -1.015684, 1.859813, 0.05098039, 0, 1, 1,
0.5457667, 0.5033107, 0.7736434, 0.05490196, 0, 1, 1,
0.5462788, -1.667603, 4.075592, 0.0627451, 0, 1, 1,
0.558889, 0.0217407, -0.7227795, 0.06666667, 0, 1, 1,
0.5628174, -1.94619, 3.829738, 0.07450981, 0, 1, 1,
0.5646843, 0.5636797, 2.512969, 0.07843138, 0, 1, 1,
0.5732407, 1.210183, -0.7326649, 0.08627451, 0, 1, 1,
0.5745952, 0.04644209, 2.2679, 0.09019608, 0, 1, 1,
0.5752249, 2.757037, -0.3501603, 0.09803922, 0, 1, 1,
0.5786358, -1.073401, 2.304743, 0.1058824, 0, 1, 1,
0.5789472, -0.8164141, 3.553906, 0.1098039, 0, 1, 1,
0.5804874, 1.125826, 0.9469943, 0.1176471, 0, 1, 1,
0.5818491, -0.9217977, 2.482182, 0.1215686, 0, 1, 1,
0.5821959, -1.408148, 2.92276, 0.1294118, 0, 1, 1,
0.5826418, -0.5683824, 0.6985752, 0.1333333, 0, 1, 1,
0.5860356, -0.9858955, 3.797932, 0.1411765, 0, 1, 1,
0.5909756, 2.406251, 1.741478, 0.145098, 0, 1, 1,
0.5950624, 0.002133868, 0.2609706, 0.1529412, 0, 1, 1,
0.5966492, 0.2736133, 4.342817, 0.1568628, 0, 1, 1,
0.5975989, 0.3821418, -0.3191364, 0.1647059, 0, 1, 1,
0.6032473, 0.003847397, 3.069189, 0.1686275, 0, 1, 1,
0.6074523, -1.021955, 3.09921, 0.1764706, 0, 1, 1,
0.6074986, -0.2506907, 0.5182377, 0.1803922, 0, 1, 1,
0.6094169, -0.879142, 1.789954, 0.1882353, 0, 1, 1,
0.6126847, 0.8236555, 1.281388, 0.1921569, 0, 1, 1,
0.6220189, -0.7985004, 2.901991, 0.2, 0, 1, 1,
0.6244807, -0.9821811, 4.790275, 0.2078431, 0, 1, 1,
0.6307844, -0.5570408, 3.98805, 0.2117647, 0, 1, 1,
0.6310577, -0.03174018, 0.7878709, 0.2196078, 0, 1, 1,
0.631305, -1.664693, 3.672576, 0.2235294, 0, 1, 1,
0.631893, -0.6154414, 3.260283, 0.2313726, 0, 1, 1,
0.6344972, 1.115048, 1.605901, 0.2352941, 0, 1, 1,
0.6356943, 0.1408706, 0.3293738, 0.2431373, 0, 1, 1,
0.6359937, 1.028673, 0.4004653, 0.2470588, 0, 1, 1,
0.6426536, -0.3312672, 3.441125, 0.254902, 0, 1, 1,
0.6448854, 0.6321083, -0.3060167, 0.2588235, 0, 1, 1,
0.646506, 0.02976663, -1.064069, 0.2666667, 0, 1, 1,
0.6470912, -2.083444, 2.915234, 0.2705882, 0, 1, 1,
0.6475713, 0.9723239, 2.701541, 0.2784314, 0, 1, 1,
0.6482931, -0.117304, 2.657038, 0.282353, 0, 1, 1,
0.6495314, 0.0571061, 1.78361, 0.2901961, 0, 1, 1,
0.6548637, -0.5669711, 3.772938, 0.2941177, 0, 1, 1,
0.6570271, 2.471965, 0.1445282, 0.3019608, 0, 1, 1,
0.6583174, -0.687011, 2.147432, 0.3098039, 0, 1, 1,
0.6612993, -1.441248, 2.558097, 0.3137255, 0, 1, 1,
0.6655883, -0.1531101, 2.944282, 0.3215686, 0, 1, 1,
0.670511, -1.256929, 2.822856, 0.3254902, 0, 1, 1,
0.6749545, 0.4728186, 0.001172878, 0.3333333, 0, 1, 1,
0.6754235, 0.3069795, -0.07220089, 0.3372549, 0, 1, 1,
0.67617, -0.7021388, 0.4352405, 0.345098, 0, 1, 1,
0.6796399, -0.1276497, 2.194319, 0.3490196, 0, 1, 1,
0.6823244, 0.7377871, -0.04639108, 0.3568628, 0, 1, 1,
0.691936, -0.9182401, 2.847256, 0.3607843, 0, 1, 1,
0.6922164, 0.3194433, 2.531324, 0.3686275, 0, 1, 1,
0.6925847, 0.2701919, 1.938228, 0.372549, 0, 1, 1,
0.6967177, -0.6462377, 1.568954, 0.3803922, 0, 1, 1,
0.6967776, 1.222041, 1.101052, 0.3843137, 0, 1, 1,
0.6968707, -1.038696, 2.093323, 0.3921569, 0, 1, 1,
0.6996379, -1.769308, 2.290062, 0.3960784, 0, 1, 1,
0.7014299, -1.849239, 3.226556, 0.4039216, 0, 1, 1,
0.7033179, 0.162951, 2.179805, 0.4117647, 0, 1, 1,
0.7051732, -0.9646447, 2.514312, 0.4156863, 0, 1, 1,
0.7122884, 0.0227259, 1.729084, 0.4235294, 0, 1, 1,
0.7123029, 0.379242, 2.708223, 0.427451, 0, 1, 1,
0.7126602, 0.004856751, 0.9873168, 0.4352941, 0, 1, 1,
0.7169064, -0.6308061, 4.159176, 0.4392157, 0, 1, 1,
0.7176988, 1.017965, -0.8937322, 0.4470588, 0, 1, 1,
0.7236352, -1.502932, 3.687608, 0.4509804, 0, 1, 1,
0.7258184, -0.7041261, 5.420743, 0.4588235, 0, 1, 1,
0.7361395, 0.9751452, 1.275706, 0.4627451, 0, 1, 1,
0.7390987, -1.178503, 3.414126, 0.4705882, 0, 1, 1,
0.7405514, 0.6286518, 0.4384749, 0.4745098, 0, 1, 1,
0.7415927, 1.45802, 2.71261, 0.4823529, 0, 1, 1,
0.7438688, 1.178135, 1.143287, 0.4862745, 0, 1, 1,
0.7439942, 0.2427551, 1.461171, 0.4941176, 0, 1, 1,
0.7457522, -0.9260592, 3.035573, 0.5019608, 0, 1, 1,
0.7491425, -0.8332431, 1.709452, 0.5058824, 0, 1, 1,
0.7546462, 1.164763, 1.645574, 0.5137255, 0, 1, 1,
0.7547385, -0.5886126, 2.265342, 0.5176471, 0, 1, 1,
0.7588539, 0.703088, 0.1369113, 0.5254902, 0, 1, 1,
0.7595004, -0.4279954, 3.70672, 0.5294118, 0, 1, 1,
0.7653696, -0.4492481, 1.601773, 0.5372549, 0, 1, 1,
0.7715568, -1.415067, 2.228057, 0.5411765, 0, 1, 1,
0.772855, 0.6986123, 1.354881, 0.5490196, 0, 1, 1,
0.7738382, -0.01453209, 2.251898, 0.5529412, 0, 1, 1,
0.7747526, -0.5662447, 1.513036, 0.5607843, 0, 1, 1,
0.7751607, 1.120459, -0.2511662, 0.5647059, 0, 1, 1,
0.7873579, -1.369189, 3.014924, 0.572549, 0, 1, 1,
0.7927155, -0.569921, 1.418856, 0.5764706, 0, 1, 1,
0.7947624, -0.4514524, 2.680353, 0.5843138, 0, 1, 1,
0.7965481, 1.729297, -0.5243648, 0.5882353, 0, 1, 1,
0.7970475, -1.858158, 2.985427, 0.5960785, 0, 1, 1,
0.8112092, 0.9648543, 1.568671, 0.6039216, 0, 1, 1,
0.8131905, -0.9071148, 2.573492, 0.6078432, 0, 1, 1,
0.8134915, -0.06011025, 0.02511841, 0.6156863, 0, 1, 1,
0.8175373, 0.994249, 1.799918, 0.6196079, 0, 1, 1,
0.8212406, 0.1059328, 1.34149, 0.627451, 0, 1, 1,
0.8326891, 0.1158032, 2.138442, 0.6313726, 0, 1, 1,
0.8393292, -0.2730259, 4.600692, 0.6392157, 0, 1, 1,
0.8404075, -1.485816, 3.102751, 0.6431373, 0, 1, 1,
0.8434505, 0.8185422, 0.5155004, 0.6509804, 0, 1, 1,
0.8440809, -1.514542, 2.437887, 0.654902, 0, 1, 1,
0.8512576, -0.1930733, 2.882023, 0.6627451, 0, 1, 1,
0.8529975, -1.577267, 2.974827, 0.6666667, 0, 1, 1,
0.8537011, -0.7787296, 1.843763, 0.6745098, 0, 1, 1,
0.8539138, 0.8712439, 1.341091, 0.6784314, 0, 1, 1,
0.8649431, 0.2840578, 3.204192, 0.6862745, 0, 1, 1,
0.8686209, 1.902777, 0.2138732, 0.6901961, 0, 1, 1,
0.8708327, 0.3470316, -1.059366, 0.6980392, 0, 1, 1,
0.8737231, -0.3728441, 1.75712, 0.7058824, 0, 1, 1,
0.8798226, 1.590165, 0.06169489, 0.7098039, 0, 1, 1,
0.8845481, 0.4044058, 1.647743, 0.7176471, 0, 1, 1,
0.8878748, 1.182026, 1.604697, 0.7215686, 0, 1, 1,
0.8902007, -0.3512135, 1.484542, 0.7294118, 0, 1, 1,
0.8910354, -0.13333, 2.816298, 0.7333333, 0, 1, 1,
0.8947326, 1.180174, 0.478076, 0.7411765, 0, 1, 1,
0.8951403, 0.3372169, 1.111118, 0.7450981, 0, 1, 1,
0.897103, 0.05528796, 0.652422, 0.7529412, 0, 1, 1,
0.8998534, 0.4245868, 1.017386, 0.7568628, 0, 1, 1,
0.9018978, 0.6275599, 0.6836212, 0.7647059, 0, 1, 1,
0.906117, 0.415193, 0.5890794, 0.7686275, 0, 1, 1,
0.9065196, 0.4070436, 0.6495866, 0.7764706, 0, 1, 1,
0.9118658, 1.441524, 1.650164, 0.7803922, 0, 1, 1,
0.9175082, 0.6339074, 1.505782, 0.7882353, 0, 1, 1,
0.9188984, 0.02380539, 2.445508, 0.7921569, 0, 1, 1,
0.9224775, 0.9383484, 0.7271282, 0.8, 0, 1, 1,
0.9230442, 0.2272638, 1.223339, 0.8078431, 0, 1, 1,
0.9237363, 1.642437, 0.06466473, 0.8117647, 0, 1, 1,
0.9248918, -0.1528612, 3.020811, 0.8196079, 0, 1, 1,
0.9388912, 1.467409, 0.7734785, 0.8235294, 0, 1, 1,
0.9396299, 1.333322, 0.4631797, 0.8313726, 0, 1, 1,
0.9434415, 0.3558058, 0.03343832, 0.8352941, 0, 1, 1,
0.9435211, -1.067603, 2.186427, 0.8431373, 0, 1, 1,
0.9476545, -0.6140462, 2.273821, 0.8470588, 0, 1, 1,
0.9522111, 0.4592013, -1.238183, 0.854902, 0, 1, 1,
0.9522584, 0.5781189, 0.1719592, 0.8588235, 0, 1, 1,
0.9620594, -0.3691424, 1.664945, 0.8666667, 0, 1, 1,
0.9703003, 0.3675015, 1.660471, 0.8705882, 0, 1, 1,
0.971379, 0.227883, 1.557349, 0.8784314, 0, 1, 1,
0.9800875, 0.1150763, -0.4824106, 0.8823529, 0, 1, 1,
0.9855137, -1.43537, 2.15101, 0.8901961, 0, 1, 1,
0.9862255, 0.2641785, 0.8479007, 0.8941177, 0, 1, 1,
0.987069, -0.931459, 2.255672, 0.9019608, 0, 1, 1,
0.9873251, -0.2876057, 1.782602, 0.9098039, 0, 1, 1,
0.991587, 0.02654065, 2.209805, 0.9137255, 0, 1, 1,
0.9943969, 1.260384, 2.247024, 0.9215686, 0, 1, 1,
0.9958844, 0.7894843, 0.3929685, 0.9254902, 0, 1, 1,
0.9999778, -0.06798783, 2.023042, 0.9333333, 0, 1, 1,
1.005294, -0.02630337, 1.801659, 0.9372549, 0, 1, 1,
1.009007, -1.590827, 2.524099, 0.945098, 0, 1, 1,
1.009773, 1.216464, 2.237582, 0.9490196, 0, 1, 1,
1.0103, 0.1716549, 0.6520809, 0.9568627, 0, 1, 1,
1.017599, 1.438487, -0.5175024, 0.9607843, 0, 1, 1,
1.018121, -0.1707813, 1.260994, 0.9686275, 0, 1, 1,
1.022425, 1.100342, 1.680962, 0.972549, 0, 1, 1,
1.031574, -0.9963664, 1.650717, 0.9803922, 0, 1, 1,
1.031585, -0.1434482, -0.0733403, 0.9843137, 0, 1, 1,
1.035274, -0.1444851, 0.7728869, 0.9921569, 0, 1, 1,
1.040247, -0.83796, 4.226972, 0.9960784, 0, 1, 1,
1.044025, -0.07236204, 1.65711, 1, 0, 0.9960784, 1,
1.044825, -0.9932154, 0.9170547, 1, 0, 0.9882353, 1,
1.053732, -0.6309853, 1.840433, 1, 0, 0.9843137, 1,
1.0594, -0.5152457, 3.379456, 1, 0, 0.9764706, 1,
1.065011, -0.6048833, 1.607631, 1, 0, 0.972549, 1,
1.066856, -2.255279, 3.878308, 1, 0, 0.9647059, 1,
1.070885, 0.09344872, 1.659446, 1, 0, 0.9607843, 1,
1.083192, -0.6770149, 1.694311, 1, 0, 0.9529412, 1,
1.085386, 0.3363452, 0.2518306, 1, 0, 0.9490196, 1,
1.087617, -0.16875, 0.4911215, 1, 0, 0.9411765, 1,
1.089782, -0.8586935, 2.552361, 1, 0, 0.9372549, 1,
1.091455, 0.5601456, 3.110887, 1, 0, 0.9294118, 1,
1.092626, 1.491305, 1.18232, 1, 0, 0.9254902, 1,
1.09353, -0.3123143, -0.5002756, 1, 0, 0.9176471, 1,
1.100832, 2.231668, 0.2451824, 1, 0, 0.9137255, 1,
1.101104, 0.4860123, 1.106428, 1, 0, 0.9058824, 1,
1.101447, -0.1320934, 0.33343, 1, 0, 0.9019608, 1,
1.108595, -0.9318284, 0.7051265, 1, 0, 0.8941177, 1,
1.114966, -0.2258587, 1.241899, 1, 0, 0.8862745, 1,
1.1183, 0.1147071, 1.078687, 1, 0, 0.8823529, 1,
1.124468, 1.187442, -0.9826369, 1, 0, 0.8745098, 1,
1.13401, 1.200276, 0.6465254, 1, 0, 0.8705882, 1,
1.143351, -0.1623645, 0.8301923, 1, 0, 0.8627451, 1,
1.15061, 1.435246, 1.140733, 1, 0, 0.8588235, 1,
1.154268, -1.096228, 2.11597, 1, 0, 0.8509804, 1,
1.155285, -0.35877, 3.148296, 1, 0, 0.8470588, 1,
1.156447, -0.2069077, 1.288027, 1, 0, 0.8392157, 1,
1.158745, -0.6496134, 1.67139, 1, 0, 0.8352941, 1,
1.161802, -1.709013, 3.796589, 1, 0, 0.827451, 1,
1.166135, -2.179138, 2.455912, 1, 0, 0.8235294, 1,
1.166556, 0.7128707, 0.7815544, 1, 0, 0.8156863, 1,
1.168007, -0.2458258, 1.362736, 1, 0, 0.8117647, 1,
1.172975, -0.5820676, 2.305098, 1, 0, 0.8039216, 1,
1.176591, -0.08262176, 1.541613, 1, 0, 0.7960784, 1,
1.176692, 0.9552158, -0.187048, 1, 0, 0.7921569, 1,
1.189295, 0.5156304, 1.36996, 1, 0, 0.7843137, 1,
1.190809, -1.429989, 3.87928, 1, 0, 0.7803922, 1,
1.202519, 1.680755, 1.504448, 1, 0, 0.772549, 1,
1.202799, 0.4095795, 0.245663, 1, 0, 0.7686275, 1,
1.203735, 0.275165, 1.064986, 1, 0, 0.7607843, 1,
1.204287, -0.5383075, 1.927393, 1, 0, 0.7568628, 1,
1.211028, -1.3503, 0.9341381, 1, 0, 0.7490196, 1,
1.212337, -0.5218802, 1.821134, 1, 0, 0.7450981, 1,
1.215473, 0.03549855, 2.072698, 1, 0, 0.7372549, 1,
1.218918, 1.091361, 1.626829, 1, 0, 0.7333333, 1,
1.226841, -0.1228821, 4.104968, 1, 0, 0.7254902, 1,
1.234931, -2.21092, 3.216982, 1, 0, 0.7215686, 1,
1.247523, -1.085988, 3.099308, 1, 0, 0.7137255, 1,
1.247775, 0.2295132, 0.9938934, 1, 0, 0.7098039, 1,
1.250955, -0.6279389, 1.546969, 1, 0, 0.7019608, 1,
1.265751, 0.2643852, 0.184124, 1, 0, 0.6941177, 1,
1.267727, 0.8020152, 0.03005653, 1, 0, 0.6901961, 1,
1.273557, 0.6910183, 0.2128902, 1, 0, 0.682353, 1,
1.277451, 1.054014, 1.407554, 1, 0, 0.6784314, 1,
1.279146, 1.449405, 0.6542251, 1, 0, 0.6705883, 1,
1.281422, -0.3232666, 2.060386, 1, 0, 0.6666667, 1,
1.2839, -0.2909145, 2.1453, 1, 0, 0.6588235, 1,
1.285417, -1.691107, 2.603613, 1, 0, 0.654902, 1,
1.287436, 1.002701, 2.151648, 1, 0, 0.6470588, 1,
1.306255, 0.3638074, 1.783208, 1, 0, 0.6431373, 1,
1.312527, 1.200875, 1.325043, 1, 0, 0.6352941, 1,
1.31523, -0.8302035, 2.622775, 1, 0, 0.6313726, 1,
1.319453, -0.2179585, 3.252525, 1, 0, 0.6235294, 1,
1.321286, 1.237055, 0.0619925, 1, 0, 0.6196079, 1,
1.327145, -0.8165184, 2.09004, 1, 0, 0.6117647, 1,
1.328111, -1.212466, 3.558838, 1, 0, 0.6078432, 1,
1.336813, 0.2119121, 1.2077, 1, 0, 0.6, 1,
1.339284, 1.070191, 2.358978, 1, 0, 0.5921569, 1,
1.339905, 0.8453, 2.582135, 1, 0, 0.5882353, 1,
1.341517, 1.396483, 3.928746, 1, 0, 0.5803922, 1,
1.344857, 0.3536913, 0.9477326, 1, 0, 0.5764706, 1,
1.345144, 1.228072, 1.494023, 1, 0, 0.5686275, 1,
1.358006, -0.793628, 1.801587, 1, 0, 0.5647059, 1,
1.358051, -0.6996332, 2.349965, 1, 0, 0.5568628, 1,
1.35866, 0.899408, -0.152055, 1, 0, 0.5529412, 1,
1.361789, -0.5238376, 2.179035, 1, 0, 0.5450981, 1,
1.373858, 0.9477597, 3.010611, 1, 0, 0.5411765, 1,
1.37423, 0.984024, 0.2215173, 1, 0, 0.5333334, 1,
1.381403, 0.4700504, 2.146613, 1, 0, 0.5294118, 1,
1.385315, -1.11527, 3.096471, 1, 0, 0.5215687, 1,
1.400863, -0.3616349, 1.16123, 1, 0, 0.5176471, 1,
1.406283, -0.1596942, 2.079405, 1, 0, 0.509804, 1,
1.406476, -0.4827474, 1.069688, 1, 0, 0.5058824, 1,
1.421509, -0.1754942, 1.63311, 1, 0, 0.4980392, 1,
1.422257, 0.3049241, 2.71911, 1, 0, 0.4901961, 1,
1.439563, 0.6758575, 1.705842, 1, 0, 0.4862745, 1,
1.440912, 1.308481, 1.073252, 1, 0, 0.4784314, 1,
1.454214, 1.171559, 1.231277, 1, 0, 0.4745098, 1,
1.455531, 0.2364707, 1.092214, 1, 0, 0.4666667, 1,
1.471094, 0.7986393, 0.6168164, 1, 0, 0.4627451, 1,
1.471209, -0.654932, 1.249597, 1, 0, 0.454902, 1,
1.473745, -0.4235661, 0.9988586, 1, 0, 0.4509804, 1,
1.478825, -1.285683, 1.129773, 1, 0, 0.4431373, 1,
1.479322, -0.3651874, 2.017885, 1, 0, 0.4392157, 1,
1.479988, 2.299576, -0.6522045, 1, 0, 0.4313726, 1,
1.482711, -1.494007, 1.962858, 1, 0, 0.427451, 1,
1.483004, 0.1579238, 0.6520133, 1, 0, 0.4196078, 1,
1.496724, 0.04327352, 2.011107, 1, 0, 0.4156863, 1,
1.497801, 0.697551, 2.471938, 1, 0, 0.4078431, 1,
1.50243, -0.6489365, 2.718282, 1, 0, 0.4039216, 1,
1.511745, 0.423098, 1.272951, 1, 0, 0.3960784, 1,
1.546165, -0.2729124, 1.521464, 1, 0, 0.3882353, 1,
1.557433, 0.2891329, 1.354974, 1, 0, 0.3843137, 1,
1.558933, -0.1295658, 0.428656, 1, 0, 0.3764706, 1,
1.577666, 0.2975605, 1.954898, 1, 0, 0.372549, 1,
1.582903, -0.6346669, 3.341945, 1, 0, 0.3647059, 1,
1.610807, -0.9552583, 0.297716, 1, 0, 0.3607843, 1,
1.614137, 1.204737, 2.180664, 1, 0, 0.3529412, 1,
1.61965, 0.9545744, -0.2301817, 1, 0, 0.3490196, 1,
1.625513, 1.076265, 0.1436562, 1, 0, 0.3411765, 1,
1.630565, -1.049595, 2.642571, 1, 0, 0.3372549, 1,
1.683314, 0.3468046, 1.938162, 1, 0, 0.3294118, 1,
1.693605, 0.8656456, 1.225865, 1, 0, 0.3254902, 1,
1.706854, -1.382451, 3.943094, 1, 0, 0.3176471, 1,
1.713438, 0.9443034, 1.79635, 1, 0, 0.3137255, 1,
1.718853, -1.510713, 2.931442, 1, 0, 0.3058824, 1,
1.727717, 0.3107857, 1.70414, 1, 0, 0.2980392, 1,
1.72788, -0.5993458, 2.739514, 1, 0, 0.2941177, 1,
1.73341, 0.5028089, 1.44458, 1, 0, 0.2862745, 1,
1.744623, -0.2460653, 1.598751, 1, 0, 0.282353, 1,
1.77582, 0.9145575, 0.3919193, 1, 0, 0.2745098, 1,
1.781361, 2.367873, 1.462948, 1, 0, 0.2705882, 1,
1.781638, -0.9233906, 1.695736, 1, 0, 0.2627451, 1,
1.800007, -0.169609, 1.936168, 1, 0, 0.2588235, 1,
1.8097, -0.894913, 0.8403032, 1, 0, 0.2509804, 1,
1.838263, -0.5694157, 2.569282, 1, 0, 0.2470588, 1,
1.853151, -1.225287, 2.865477, 1, 0, 0.2392157, 1,
1.867534, 0.06616242, 2.133504, 1, 0, 0.2352941, 1,
1.880565, -1.720089, 2.852584, 1, 0, 0.227451, 1,
1.88557, -1.166816, 2.528844, 1, 0, 0.2235294, 1,
1.892954, 0.3579585, 0.6892752, 1, 0, 0.2156863, 1,
1.90783, 1.248449, 0.6779464, 1, 0, 0.2117647, 1,
1.913726, 0.6039788, 1.092445, 1, 0, 0.2039216, 1,
1.922193, -2.261849, 2.778743, 1, 0, 0.1960784, 1,
1.922702, -0.816048, 2.356249, 1, 0, 0.1921569, 1,
1.92643, -0.4848322, 3.981643, 1, 0, 0.1843137, 1,
1.93982, 1.337458, 1.108101, 1, 0, 0.1803922, 1,
1.954522, 0.6261746, 0.6505539, 1, 0, 0.172549, 1,
1.970778, 0.6668071, 2.16682, 1, 0, 0.1686275, 1,
1.980835, 0.6650622, 0.3856278, 1, 0, 0.1607843, 1,
1.986453, -0.4185304, 0.2257129, 1, 0, 0.1568628, 1,
1.992744, 0.4896814, 1.689018, 1, 0, 0.1490196, 1,
2.023042, -0.7892215, 2.329443, 1, 0, 0.145098, 1,
2.02611, 0.6069027, 1.545933, 1, 0, 0.1372549, 1,
2.03791, 0.1541995, 2.97028, 1, 0, 0.1333333, 1,
2.041835, -1.66981, 1.187729, 1, 0, 0.1254902, 1,
2.06079, 2.535889, -0.05309499, 1, 0, 0.1215686, 1,
2.080269, 1.588041, 1.742843, 1, 0, 0.1137255, 1,
2.090455, 0.2826267, 0.9654036, 1, 0, 0.1098039, 1,
2.094504, -0.3281008, 1.45462, 1, 0, 0.1019608, 1,
2.09651, 1.448567, 1.762384, 1, 0, 0.09411765, 1,
2.10702, -1.545198, 1.21189, 1, 0, 0.09019608, 1,
2.128717, -0.5635525, 2.26813, 1, 0, 0.08235294, 1,
2.145565, -1.376764, 1.071226, 1, 0, 0.07843138, 1,
2.164687, 0.3943403, 0.2421189, 1, 0, 0.07058824, 1,
2.29964, -0.03615034, -0.4443193, 1, 0, 0.06666667, 1,
2.349377, -0.04685999, 1.197597, 1, 0, 0.05882353, 1,
2.377497, 0.9190832, 1.369838, 1, 0, 0.05490196, 1,
2.483538, -2.448988, 1.469752, 1, 0, 0.04705882, 1,
2.589146, -0.2096597, 2.663203, 1, 0, 0.04313726, 1,
2.679352, 1.168406, 3.111297, 1, 0, 0.03529412, 1,
2.688743, -0.6475464, 1.246305, 1, 0, 0.03137255, 1,
2.716486, 0.9792455, 1.092725, 1, 0, 0.02352941, 1,
2.949557, 0.7595664, 2.20072, 1, 0, 0.01960784, 1,
3.23347, -1.798765, 1.472554, 1, 0, 0.01176471, 1,
3.456831, -0.1099252, 1.107932, 1, 0, 0.007843138, 1
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
0.1405408, -3.823676, -6.579882, 0, -0.5, 0.5, 0.5,
0.1405408, -3.823676, -6.579882, 1, -0.5, 0.5, 0.5,
0.1405408, -3.823676, -6.579882, 1, 1.5, 0.5, 0.5,
0.1405408, -3.823676, -6.579882, 0, 1.5, 0.5, 0.5
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
-4.299971, 0.004080892, -6.579882, 0, -0.5, 0.5, 0.5,
-4.299971, 0.004080892, -6.579882, 1, -0.5, 0.5, 0.5,
-4.299971, 0.004080892, -6.579882, 1, 1.5, 0.5, 0.5,
-4.299971, 0.004080892, -6.579882, 0, 1.5, 0.5, 0.5
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
-4.299971, -3.823676, 0.2900779, 0, -0.5, 0.5, 0.5,
-4.299971, -3.823676, 0.2900779, 1, -0.5, 0.5, 0.5,
-4.299971, -3.823676, 0.2900779, 1, 1.5, 0.5, 0.5,
-4.299971, -3.823676, 0.2900779, 0, 1.5, 0.5, 0.5
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
-3, -2.940347, -4.994507,
3, -2.940347, -4.994507,
-3, -2.940347, -4.994507,
-3, -3.087569, -5.258736,
-2, -2.940347, -4.994507,
-2, -3.087569, -5.258736,
-1, -2.940347, -4.994507,
-1, -3.087569, -5.258736,
0, -2.940347, -4.994507,
0, -3.087569, -5.258736,
1, -2.940347, -4.994507,
1, -3.087569, -5.258736,
2, -2.940347, -4.994507,
2, -3.087569, -5.258736,
3, -2.940347, -4.994507,
3, -3.087569, -5.258736
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
-3, -3.382011, -5.787194, 0, -0.5, 0.5, 0.5,
-3, -3.382011, -5.787194, 1, -0.5, 0.5, 0.5,
-3, -3.382011, -5.787194, 1, 1.5, 0.5, 0.5,
-3, -3.382011, -5.787194, 0, 1.5, 0.5, 0.5,
-2, -3.382011, -5.787194, 0, -0.5, 0.5, 0.5,
-2, -3.382011, -5.787194, 1, -0.5, 0.5, 0.5,
-2, -3.382011, -5.787194, 1, 1.5, 0.5, 0.5,
-2, -3.382011, -5.787194, 0, 1.5, 0.5, 0.5,
-1, -3.382011, -5.787194, 0, -0.5, 0.5, 0.5,
-1, -3.382011, -5.787194, 1, -0.5, 0.5, 0.5,
-1, -3.382011, -5.787194, 1, 1.5, 0.5, 0.5,
-1, -3.382011, -5.787194, 0, 1.5, 0.5, 0.5,
0, -3.382011, -5.787194, 0, -0.5, 0.5, 0.5,
0, -3.382011, -5.787194, 1, -0.5, 0.5, 0.5,
0, -3.382011, -5.787194, 1, 1.5, 0.5, 0.5,
0, -3.382011, -5.787194, 0, 1.5, 0.5, 0.5,
1, -3.382011, -5.787194, 0, -0.5, 0.5, 0.5,
1, -3.382011, -5.787194, 1, -0.5, 0.5, 0.5,
1, -3.382011, -5.787194, 1, 1.5, 0.5, 0.5,
1, -3.382011, -5.787194, 0, 1.5, 0.5, 0.5,
2, -3.382011, -5.787194, 0, -0.5, 0.5, 0.5,
2, -3.382011, -5.787194, 1, -0.5, 0.5, 0.5,
2, -3.382011, -5.787194, 1, 1.5, 0.5, 0.5,
2, -3.382011, -5.787194, 0, 1.5, 0.5, 0.5,
3, -3.382011, -5.787194, 0, -0.5, 0.5, 0.5,
3, -3.382011, -5.787194, 1, -0.5, 0.5, 0.5,
3, -3.382011, -5.787194, 1, 1.5, 0.5, 0.5,
3, -3.382011, -5.787194, 0, 1.5, 0.5, 0.5
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
-3.275238, -2, -4.994507,
-3.275238, 2, -4.994507,
-3.275238, -2, -4.994507,
-3.446026, -2, -5.258736,
-3.275238, -1, -4.994507,
-3.446026, -1, -5.258736,
-3.275238, 0, -4.994507,
-3.446026, 0, -5.258736,
-3.275238, 1, -4.994507,
-3.446026, 1, -5.258736,
-3.275238, 2, -4.994507,
-3.446026, 2, -5.258736
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
-3.787604, -2, -5.787194, 0, -0.5, 0.5, 0.5,
-3.787604, -2, -5.787194, 1, -0.5, 0.5, 0.5,
-3.787604, -2, -5.787194, 1, 1.5, 0.5, 0.5,
-3.787604, -2, -5.787194, 0, 1.5, 0.5, 0.5,
-3.787604, -1, -5.787194, 0, -0.5, 0.5, 0.5,
-3.787604, -1, -5.787194, 1, -0.5, 0.5, 0.5,
-3.787604, -1, -5.787194, 1, 1.5, 0.5, 0.5,
-3.787604, -1, -5.787194, 0, 1.5, 0.5, 0.5,
-3.787604, 0, -5.787194, 0, -0.5, 0.5, 0.5,
-3.787604, 0, -5.787194, 1, -0.5, 0.5, 0.5,
-3.787604, 0, -5.787194, 1, 1.5, 0.5, 0.5,
-3.787604, 0, -5.787194, 0, 1.5, 0.5, 0.5,
-3.787604, 1, -5.787194, 0, -0.5, 0.5, 0.5,
-3.787604, 1, -5.787194, 1, -0.5, 0.5, 0.5,
-3.787604, 1, -5.787194, 1, 1.5, 0.5, 0.5,
-3.787604, 1, -5.787194, 0, 1.5, 0.5, 0.5,
-3.787604, 2, -5.787194, 0, -0.5, 0.5, 0.5,
-3.787604, 2, -5.787194, 1, -0.5, 0.5, 0.5,
-3.787604, 2, -5.787194, 1, 1.5, 0.5, 0.5,
-3.787604, 2, -5.787194, 0, 1.5, 0.5, 0.5
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
-3.275238, -2.940347, -4,
-3.275238, -2.940347, 4,
-3.275238, -2.940347, -4,
-3.446026, -3.087569, -4,
-3.275238, -2.940347, -2,
-3.446026, -3.087569, -2,
-3.275238, -2.940347, 0,
-3.446026, -3.087569, 0,
-3.275238, -2.940347, 2,
-3.446026, -3.087569, 2,
-3.275238, -2.940347, 4,
-3.446026, -3.087569, 4
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
-3.787604, -3.382011, -4, 0, -0.5, 0.5, 0.5,
-3.787604, -3.382011, -4, 1, -0.5, 0.5, 0.5,
-3.787604, -3.382011, -4, 1, 1.5, 0.5, 0.5,
-3.787604, -3.382011, -4, 0, 1.5, 0.5, 0.5,
-3.787604, -3.382011, -2, 0, -0.5, 0.5, 0.5,
-3.787604, -3.382011, -2, 1, -0.5, 0.5, 0.5,
-3.787604, -3.382011, -2, 1, 1.5, 0.5, 0.5,
-3.787604, -3.382011, -2, 0, 1.5, 0.5, 0.5,
-3.787604, -3.382011, 0, 0, -0.5, 0.5, 0.5,
-3.787604, -3.382011, 0, 1, -0.5, 0.5, 0.5,
-3.787604, -3.382011, 0, 1, 1.5, 0.5, 0.5,
-3.787604, -3.382011, 0, 0, 1.5, 0.5, 0.5,
-3.787604, -3.382011, 2, 0, -0.5, 0.5, 0.5,
-3.787604, -3.382011, 2, 1, -0.5, 0.5, 0.5,
-3.787604, -3.382011, 2, 1, 1.5, 0.5, 0.5,
-3.787604, -3.382011, 2, 0, 1.5, 0.5, 0.5,
-3.787604, -3.382011, 4, 0, -0.5, 0.5, 0.5,
-3.787604, -3.382011, 4, 1, -0.5, 0.5, 0.5,
-3.787604, -3.382011, 4, 1, 1.5, 0.5, 0.5,
-3.787604, -3.382011, 4, 0, 1.5, 0.5, 0.5
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
-3.275238, -2.940347, -4.994507,
-3.275238, 2.948509, -4.994507,
-3.275238, -2.940347, 5.574663,
-3.275238, 2.948509, 5.574663,
-3.275238, -2.940347, -4.994507,
-3.275238, -2.940347, 5.574663,
-3.275238, 2.948509, -4.994507,
-3.275238, 2.948509, 5.574663,
-3.275238, -2.940347, -4.994507,
3.556319, -2.940347, -4.994507,
-3.275238, -2.940347, 5.574663,
3.556319, -2.940347, 5.574663,
-3.275238, 2.948509, -4.994507,
3.556319, 2.948509, -4.994507,
-3.275238, 2.948509, 5.574663,
3.556319, 2.948509, 5.574663,
3.556319, -2.940347, -4.994507,
3.556319, 2.948509, -4.994507,
3.556319, -2.940347, 5.574663,
3.556319, 2.948509, 5.574663,
3.556319, -2.940347, -4.994507,
3.556319, -2.940347, 5.574663,
3.556319, 2.948509, -4.994507,
3.556319, 2.948509, 5.574663
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
var radius = 7.419374;
var distance = 33.00963;
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
mvMatrix.translate( -0.1405408, -0.004080892, -0.2900779 );
mvMatrix.scale( 1.174253, 1.362229, 0.7589974 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.00963);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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


