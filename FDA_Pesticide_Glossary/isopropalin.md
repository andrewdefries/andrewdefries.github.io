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
-3.376163, -0.9718569, -0.9447598, 1, 0, 0, 1,
-3.151388, 0.7604458, -1.055159, 1, 0.007843138, 0, 1,
-2.968318, 0.2773556, -1.019085, 1, 0.01176471, 0, 1,
-2.739907, 1.132351, -0.2679945, 1, 0.01960784, 0, 1,
-2.716107, 0.04678292, -1.830109, 1, 0.02352941, 0, 1,
-2.715226, -1.558382, -2.761454, 1, 0.03137255, 0, 1,
-2.50773, -0.7278294, -0.9714034, 1, 0.03529412, 0, 1,
-2.442654, 1.934359, 0.4547237, 1, 0.04313726, 0, 1,
-2.354288, 0.7793692, -0.2652568, 1, 0.04705882, 0, 1,
-2.348909, 0.6852077, -1.13855, 1, 0.05490196, 0, 1,
-2.289643, 0.4580843, -2.533166, 1, 0.05882353, 0, 1,
-2.231165, 1.402458, -0.4377449, 1, 0.06666667, 0, 1,
-2.195534, 0.1026304, -1.733661, 1, 0.07058824, 0, 1,
-2.186855, 0.03697859, -0.8833306, 1, 0.07843138, 0, 1,
-2.147574, 0.4415629, -0.487795, 1, 0.08235294, 0, 1,
-2.104465, 0.2153109, -2.258507, 1, 0.09019608, 0, 1,
-2.078558, 0.7367584, -1.218443, 1, 0.09411765, 0, 1,
-2.061092, -1.224943, -0.4936374, 1, 0.1019608, 0, 1,
-2.010608, -0.05098585, -3.768841, 1, 0.1098039, 0, 1,
-2.002021, -1.4814, -1.718021, 1, 0.1137255, 0, 1,
-2.000952, -0.8883802, -1.543611, 1, 0.1215686, 0, 1,
-1.986589, 0.08356823, -1.550078, 1, 0.1254902, 0, 1,
-1.981786, -1.506835, -0.6157098, 1, 0.1333333, 0, 1,
-1.97528, 0.1395032, -0.5249255, 1, 0.1372549, 0, 1,
-1.967734, -0.3360501, -2.041471, 1, 0.145098, 0, 1,
-1.95944, -0.7120819, -3.331833, 1, 0.1490196, 0, 1,
-1.924353, 0.8247348, -1.052224, 1, 0.1568628, 0, 1,
-1.897304, 0.7752429, -1.674922, 1, 0.1607843, 0, 1,
-1.887316, 1.954153, -2.024791, 1, 0.1686275, 0, 1,
-1.880516, 1.60358, -1.352746, 1, 0.172549, 0, 1,
-1.876002, -0.2468774, -0.02543649, 1, 0.1803922, 0, 1,
-1.848702, -1.822015, -1.648769, 1, 0.1843137, 0, 1,
-1.843242, 0.3113721, -2.693158, 1, 0.1921569, 0, 1,
-1.841265, -0.2179042, -2.225893, 1, 0.1960784, 0, 1,
-1.83251, -0.6514688, -2.301626, 1, 0.2039216, 0, 1,
-1.820385, 1.894821, 0.07533801, 1, 0.2117647, 0, 1,
-1.815324, 0.2401185, -0.7022682, 1, 0.2156863, 0, 1,
-1.802748, 0.6955288, -1.037086, 1, 0.2235294, 0, 1,
-1.802073, 0.8886665, -1.172576, 1, 0.227451, 0, 1,
-1.780958, 0.4618486, -1.962606, 1, 0.2352941, 0, 1,
-1.775508, 0.9214421, -1.268559, 1, 0.2392157, 0, 1,
-1.772888, 0.8416469, -1.681106, 1, 0.2470588, 0, 1,
-1.764327, -1.362165, -2.571183, 1, 0.2509804, 0, 1,
-1.763638, -0.9063431, -1.583359, 1, 0.2588235, 0, 1,
-1.762633, -0.7316958, -1.858948, 1, 0.2627451, 0, 1,
-1.758234, -1.727538, -1.524689, 1, 0.2705882, 0, 1,
-1.737723, -0.6172768, -2.772747, 1, 0.2745098, 0, 1,
-1.737346, -0.05291387, -1.905658, 1, 0.282353, 0, 1,
-1.736117, 0.5567581, -1.603113, 1, 0.2862745, 0, 1,
-1.735516, -0.826512, -1.772715, 1, 0.2941177, 0, 1,
-1.710934, 0.3946667, -1.757265, 1, 0.3019608, 0, 1,
-1.702929, -0.4592242, -0.707153, 1, 0.3058824, 0, 1,
-1.692868, -0.3258995, -2.599565, 1, 0.3137255, 0, 1,
-1.68805, 1.30994, -2.439946, 1, 0.3176471, 0, 1,
-1.684363, -1.057494, -1.994979, 1, 0.3254902, 0, 1,
-1.682507, 0.7150483, -2.002168, 1, 0.3294118, 0, 1,
-1.680158, -1.089807, -0.01028975, 1, 0.3372549, 0, 1,
-1.654229, -0.3040339, -2.788688, 1, 0.3411765, 0, 1,
-1.629423, 1.439915, -2.38156, 1, 0.3490196, 0, 1,
-1.615499, -0.6286169, -1.28174, 1, 0.3529412, 0, 1,
-1.606658, -1.118073, 0.2990745, 1, 0.3607843, 0, 1,
-1.601877, 0.004512276, -0.5047454, 1, 0.3647059, 0, 1,
-1.59953, -0.2494928, -1.253823, 1, 0.372549, 0, 1,
-1.593145, -0.7193609, -1.561854, 1, 0.3764706, 0, 1,
-1.58809, 0.340667, -2.054583, 1, 0.3843137, 0, 1,
-1.565459, -0.1661801, -2.026237, 1, 0.3882353, 0, 1,
-1.563181, -0.04867717, -2.413706, 1, 0.3960784, 0, 1,
-1.549648, -0.7542685, -2.452116, 1, 0.4039216, 0, 1,
-1.525983, 0.09745794, -1.297779, 1, 0.4078431, 0, 1,
-1.519236, -0.1268899, -0.5837359, 1, 0.4156863, 0, 1,
-1.515675, -0.3486741, -2.112641, 1, 0.4196078, 0, 1,
-1.509809, 1.396, -0.4253635, 1, 0.427451, 0, 1,
-1.495981, 0.4958443, 0.7750133, 1, 0.4313726, 0, 1,
-1.493166, -0.2873556, -0.9741504, 1, 0.4392157, 0, 1,
-1.487525, -0.3759858, -0.5546273, 1, 0.4431373, 0, 1,
-1.483491, 1.156842, 0.3123148, 1, 0.4509804, 0, 1,
-1.476457, 0.2843781, -0.5845483, 1, 0.454902, 0, 1,
-1.475726, -1.801314, -3.109398, 1, 0.4627451, 0, 1,
-1.465584, -1.078924, -1.196481, 1, 0.4666667, 0, 1,
-1.465546, -0.3723773, -2.46802, 1, 0.4745098, 0, 1,
-1.457532, 1.679146, -1.168432, 1, 0.4784314, 0, 1,
-1.44951, -0.01532476, -2.249498, 1, 0.4862745, 0, 1,
-1.439636, -0.1868705, -1.342055, 1, 0.4901961, 0, 1,
-1.439427, -0.8440306, -2.114615, 1, 0.4980392, 0, 1,
-1.437186, -0.3082283, -2.288838, 1, 0.5058824, 0, 1,
-1.414771, 1.837382, -0.6910785, 1, 0.509804, 0, 1,
-1.413408, -1.468412, -2.182922, 1, 0.5176471, 0, 1,
-1.405803, -1.282256, -2.048684, 1, 0.5215687, 0, 1,
-1.403555, 0.3495315, -0.159306, 1, 0.5294118, 0, 1,
-1.400923, 0.5238987, 0.3771961, 1, 0.5333334, 0, 1,
-1.399519, -0.3236581, -1.957949, 1, 0.5411765, 0, 1,
-1.398641, -1.076897, -2.384959, 1, 0.5450981, 0, 1,
-1.397926, -0.7473978, -0.6039343, 1, 0.5529412, 0, 1,
-1.39477, 1.395017, 0.5727332, 1, 0.5568628, 0, 1,
-1.39043, -0.7281224, -2.603954, 1, 0.5647059, 0, 1,
-1.388652, -0.1842798, -1.882203, 1, 0.5686275, 0, 1,
-1.384458, -1.562642, -2.474342, 1, 0.5764706, 0, 1,
-1.377599, 2.823437, -1.503324, 1, 0.5803922, 0, 1,
-1.373845, -0.12675, -0.578743, 1, 0.5882353, 0, 1,
-1.370052, -1.495376, -2.802038, 1, 0.5921569, 0, 1,
-1.366773, 1.129286, -1.724903, 1, 0.6, 0, 1,
-1.353102, 2.39799, -3.404263, 1, 0.6078432, 0, 1,
-1.34361, 1.87958, -1.245404, 1, 0.6117647, 0, 1,
-1.339897, 0.6341559, 0.1040321, 1, 0.6196079, 0, 1,
-1.339361, 1.285284, -1.48105, 1, 0.6235294, 0, 1,
-1.338789, -0.07736736, -0.2027159, 1, 0.6313726, 0, 1,
-1.332365, 0.7829891, -0.2331201, 1, 0.6352941, 0, 1,
-1.327635, -0.252564, -1.009104, 1, 0.6431373, 0, 1,
-1.323354, 1.117712, -0.1146748, 1, 0.6470588, 0, 1,
-1.318868, 1.444747, -0.532849, 1, 0.654902, 0, 1,
-1.317015, 1.134514, 0.8825189, 1, 0.6588235, 0, 1,
-1.315746, -1.091419, -1.690408, 1, 0.6666667, 0, 1,
-1.307948, -0.2825829, -0.556511, 1, 0.6705883, 0, 1,
-1.299516, 0.0711223, -1.795348, 1, 0.6784314, 0, 1,
-1.298826, 0.8897431, -1.172914, 1, 0.682353, 0, 1,
-1.292976, -0.5379499, -2.13864, 1, 0.6901961, 0, 1,
-1.279898, -1.119833, -3.391695, 1, 0.6941177, 0, 1,
-1.278936, -1.077723, -1.898909, 1, 0.7019608, 0, 1,
-1.275038, 0.3127241, -0.6313596, 1, 0.7098039, 0, 1,
-1.270048, 0.2957822, 1.332993, 1, 0.7137255, 0, 1,
-1.269375, -0.2691857, -0.8970012, 1, 0.7215686, 0, 1,
-1.244745, 2.186822, -1.26286, 1, 0.7254902, 0, 1,
-1.241545, 0.7677652, -1.543118, 1, 0.7333333, 0, 1,
-1.239014, 0.2872476, -1.244637, 1, 0.7372549, 0, 1,
-1.224857, -0.2649358, -1.589209, 1, 0.7450981, 0, 1,
-1.220573, 2.057819, -0.7997431, 1, 0.7490196, 0, 1,
-1.218178, 1.717783, -3.629344, 1, 0.7568628, 0, 1,
-1.209339, 0.03973969, -1.487748, 1, 0.7607843, 0, 1,
-1.193791, 0.6938957, -1.553904, 1, 0.7686275, 0, 1,
-1.184157, -0.1274933, -1.46273, 1, 0.772549, 0, 1,
-1.181263, 0.3326696, -1.931191, 1, 0.7803922, 0, 1,
-1.176503, 0.5015996, -1.390705, 1, 0.7843137, 0, 1,
-1.175098, -0.6782139, -1.499997, 1, 0.7921569, 0, 1,
-1.156774, -0.1341346, -1.036923, 1, 0.7960784, 0, 1,
-1.152894, 1.312136, -0.5110241, 1, 0.8039216, 0, 1,
-1.137886, -1.651955, -1.726472, 1, 0.8117647, 0, 1,
-1.136627, -0.3020178, -3.56645, 1, 0.8156863, 0, 1,
-1.132183, 1.318239, -2.702813, 1, 0.8235294, 0, 1,
-1.117888, -1.174347, -0.6958448, 1, 0.827451, 0, 1,
-1.113926, -1.636712, -1.687773, 1, 0.8352941, 0, 1,
-1.111528, 0.6540227, -2.33019, 1, 0.8392157, 0, 1,
-1.111027, -0.4252309, -2.089864, 1, 0.8470588, 0, 1,
-1.110509, 0.3670397, -3.268789, 1, 0.8509804, 0, 1,
-1.103775, -0.04339669, -3.309493, 1, 0.8588235, 0, 1,
-1.102171, 1.219601, -0.4645795, 1, 0.8627451, 0, 1,
-1.101302, -0.873556, -3.089376, 1, 0.8705882, 0, 1,
-1.099821, -0.3162828, -0.5613956, 1, 0.8745098, 0, 1,
-1.092605, -1.237537, -1.971035, 1, 0.8823529, 0, 1,
-1.084968, -0.5534827, -3.282916, 1, 0.8862745, 0, 1,
-1.082399, 1.879098, -0.8247597, 1, 0.8941177, 0, 1,
-1.076587, -0.01391379, -1.781173, 1, 0.8980392, 0, 1,
-1.07541, -0.5931649, -2.145413, 1, 0.9058824, 0, 1,
-1.071619, 0.7707423, -0.5410206, 1, 0.9137255, 0, 1,
-1.068788, 0.7021291, -1.030102, 1, 0.9176471, 0, 1,
-1.062655, -0.2347329, -0.8054401, 1, 0.9254902, 0, 1,
-1.055363, -0.5226065, -1.467585, 1, 0.9294118, 0, 1,
-1.053577, -0.8402463, -1.28693, 1, 0.9372549, 0, 1,
-1.051534, -0.09960898, -1.501606, 1, 0.9411765, 0, 1,
-1.051047, 2.99179, 0.08616628, 1, 0.9490196, 0, 1,
-1.043051, -1.065435, -1.790556, 1, 0.9529412, 0, 1,
-1.042793, -0.1293932, -0.6833431, 1, 0.9607843, 0, 1,
-1.042235, 1.233332, 0.5537366, 1, 0.9647059, 0, 1,
-1.040375, -1.357399, -2.096577, 1, 0.972549, 0, 1,
-1.029792, 0.8497176, 0.2848093, 1, 0.9764706, 0, 1,
-1.02902, 1.59139, -0.3407015, 1, 0.9843137, 0, 1,
-1.023335, -1.677323, -2.632887, 1, 0.9882353, 0, 1,
-1.023298, -2.562497, -2.934424, 1, 0.9960784, 0, 1,
-1.018475, -0.5851521, -3.232711, 0.9960784, 1, 0, 1,
-1.012842, 0.9932701, -3.209022, 0.9921569, 1, 0, 1,
-1.009225, -0.2212639, -2.489698, 0.9843137, 1, 0, 1,
-0.9968835, 0.5360636, -2.231881, 0.9803922, 1, 0, 1,
-0.9957808, -0.09777774, -2.296074, 0.972549, 1, 0, 1,
-0.9943469, 1.375965, -1.093346, 0.9686275, 1, 0, 1,
-0.984401, 0.6488101, -0.7598419, 0.9607843, 1, 0, 1,
-0.9815981, -1.711778, -2.503764, 0.9568627, 1, 0, 1,
-0.977763, -2.029381, -2.740102, 0.9490196, 1, 0, 1,
-0.9715103, 0.4736625, -0.4470704, 0.945098, 1, 0, 1,
-0.9695688, -0.3892715, -2.314886, 0.9372549, 1, 0, 1,
-0.9670886, 1.78176, -1.359637, 0.9333333, 1, 0, 1,
-0.9662176, -2.611005, -5.103766, 0.9254902, 1, 0, 1,
-0.9649315, -1.198615, -4.548201, 0.9215686, 1, 0, 1,
-0.9579384, -0.5317308, 0.2694267, 0.9137255, 1, 0, 1,
-0.9403545, -0.4220375, -4.039495, 0.9098039, 1, 0, 1,
-0.9183292, 0.1912565, -2.096019, 0.9019608, 1, 0, 1,
-0.9147298, 0.9261734, -1.558802, 0.8941177, 1, 0, 1,
-0.9066623, -0.4052667, -1.995383, 0.8901961, 1, 0, 1,
-0.9050762, -0.000128239, -2.938809, 0.8823529, 1, 0, 1,
-0.8958008, -1.154489, -1.655029, 0.8784314, 1, 0, 1,
-0.8850853, 0.9329306, -0.2903819, 0.8705882, 1, 0, 1,
-0.884102, 0.08000617, -0.06070146, 0.8666667, 1, 0, 1,
-0.8798656, -0.1934357, -2.455036, 0.8588235, 1, 0, 1,
-0.8786751, -0.2213586, -1.121408, 0.854902, 1, 0, 1,
-0.8732844, -0.04685513, -0.3955396, 0.8470588, 1, 0, 1,
-0.8577994, -0.1645412, -3.547477, 0.8431373, 1, 0, 1,
-0.8565379, -0.03546116, -0.8712046, 0.8352941, 1, 0, 1,
-0.8562821, 2.611684, -0.1548054, 0.8313726, 1, 0, 1,
-0.8546848, 1.434748, -1.220885, 0.8235294, 1, 0, 1,
-0.8471104, -2.070277, -3.859819, 0.8196079, 1, 0, 1,
-0.8433154, 0.01113783, -2.712579, 0.8117647, 1, 0, 1,
-0.8430257, 1.660263, 1.679242, 0.8078431, 1, 0, 1,
-0.8363495, -0.2424089, 0.1390193, 0.8, 1, 0, 1,
-0.8343616, -1.369915, -2.905133, 0.7921569, 1, 0, 1,
-0.8342457, -0.9322456, -3.1994, 0.7882353, 1, 0, 1,
-0.834063, 2.133433, -0.1923783, 0.7803922, 1, 0, 1,
-0.8238347, -0.666822, -3.115416, 0.7764706, 1, 0, 1,
-0.8138325, -0.4918847, -2.943467, 0.7686275, 1, 0, 1,
-0.8035402, -0.2111989, -1.901781, 0.7647059, 1, 0, 1,
-0.8023853, 1.060893, -0.7803255, 0.7568628, 1, 0, 1,
-0.8012125, -0.1689748, -1.898912, 0.7529412, 1, 0, 1,
-0.8008638, 0.5367812, -1.396098, 0.7450981, 1, 0, 1,
-0.8003752, -1.866484, -3.327385, 0.7411765, 1, 0, 1,
-0.7939652, 0.1604935, -2.484431, 0.7333333, 1, 0, 1,
-0.7937847, 0.7228668, -1.017298, 0.7294118, 1, 0, 1,
-0.7917212, -0.622054, -1.655648, 0.7215686, 1, 0, 1,
-0.7901284, -0.1740505, -1.431134, 0.7176471, 1, 0, 1,
-0.7859782, 0.6987956, 2.104153, 0.7098039, 1, 0, 1,
-0.7839361, 0.1780025, -2.766465, 0.7058824, 1, 0, 1,
-0.7834394, 2.080668, 0.3399276, 0.6980392, 1, 0, 1,
-0.7813588, -0.8086548, -3.279212, 0.6901961, 1, 0, 1,
-0.7794387, -0.2139923, -0.5509304, 0.6862745, 1, 0, 1,
-0.7770586, -0.6279384, -3.836042, 0.6784314, 1, 0, 1,
-0.7677354, 0.08205352, -1.804439, 0.6745098, 1, 0, 1,
-0.7670561, 0.1321732, 0.1951866, 0.6666667, 1, 0, 1,
-0.7627228, 1.480832, -0.5461537, 0.6627451, 1, 0, 1,
-0.7550248, -0.6220965, -2.092967, 0.654902, 1, 0, 1,
-0.7533345, 2.130638, 1.372051, 0.6509804, 1, 0, 1,
-0.7532882, 1.27834, -1.049612, 0.6431373, 1, 0, 1,
-0.7527096, -0.3360252, -4.158275, 0.6392157, 1, 0, 1,
-0.7518966, 0.1777394, 1.362882, 0.6313726, 1, 0, 1,
-0.7502638, -0.7500207, -2.004122, 0.627451, 1, 0, 1,
-0.7487922, -0.5407491, -2.713921, 0.6196079, 1, 0, 1,
-0.7485288, 0.5079448, -1.967408, 0.6156863, 1, 0, 1,
-0.7482637, 0.706287, -1.776925, 0.6078432, 1, 0, 1,
-0.747524, -0.4886981, -2.970197, 0.6039216, 1, 0, 1,
-0.7376167, 0.5739418, 0.622127, 0.5960785, 1, 0, 1,
-0.7303067, -0.009005342, -1.837704, 0.5882353, 1, 0, 1,
-0.7280319, -0.2268018, -1.800286, 0.5843138, 1, 0, 1,
-0.7270448, -0.4507464, -1.819021, 0.5764706, 1, 0, 1,
-0.7261328, 0.1167357, -1.931805, 0.572549, 1, 0, 1,
-0.7178548, 1.15137, 1.881999, 0.5647059, 1, 0, 1,
-0.7127012, 1.255906, -0.5872847, 0.5607843, 1, 0, 1,
-0.7087901, -1.22796, -3.682615, 0.5529412, 1, 0, 1,
-0.707096, -0.4031397, -1.475659, 0.5490196, 1, 0, 1,
-0.704015, 0.6101046, -0.1651054, 0.5411765, 1, 0, 1,
-0.7036875, 0.4026411, -0.07413056, 0.5372549, 1, 0, 1,
-0.6995551, 0.8227263, -0.182862, 0.5294118, 1, 0, 1,
-0.6980303, 1.481433, 0.453481, 0.5254902, 1, 0, 1,
-0.6958529, 1.985253, -1.519652, 0.5176471, 1, 0, 1,
-0.6927556, 0.7332137, -3.693506, 0.5137255, 1, 0, 1,
-0.6882887, -1.684096, -1.630458, 0.5058824, 1, 0, 1,
-0.6878057, 0.02772082, -0.2587305, 0.5019608, 1, 0, 1,
-0.6854935, -1.176907, -1.8062, 0.4941176, 1, 0, 1,
-0.6849391, 1.169834, -0.2017647, 0.4862745, 1, 0, 1,
-0.6822635, 0.9146171, 0.3059508, 0.4823529, 1, 0, 1,
-0.6783032, -0.0164502, -0.2337549, 0.4745098, 1, 0, 1,
-0.6774639, -0.6718768, -2.209643, 0.4705882, 1, 0, 1,
-0.6757138, 0.6612327, 0.6997622, 0.4627451, 1, 0, 1,
-0.6708103, 0.8904072, -1.199229, 0.4588235, 1, 0, 1,
-0.6678539, -0.7545288, -2.905333, 0.4509804, 1, 0, 1,
-0.657863, 0.2955437, -2.194401, 0.4470588, 1, 0, 1,
-0.6573759, -0.3566291, -2.509182, 0.4392157, 1, 0, 1,
-0.6553589, -0.7877992, -3.569626, 0.4352941, 1, 0, 1,
-0.6492749, 0.3577188, -3.174167, 0.427451, 1, 0, 1,
-0.6475561, -1.267185, -3.205404, 0.4235294, 1, 0, 1,
-0.6460491, 0.4718416, -0.4028157, 0.4156863, 1, 0, 1,
-0.6441067, 0.4213848, -0.4234962, 0.4117647, 1, 0, 1,
-0.6418871, 0.4773856, 0.4897448, 0.4039216, 1, 0, 1,
-0.6399966, 0.1589223, -2.100478, 0.3960784, 1, 0, 1,
-0.6395395, -0.5256721, -2.794809, 0.3921569, 1, 0, 1,
-0.639147, 0.7103501, 0.1543947, 0.3843137, 1, 0, 1,
-0.6371769, 0.2709861, -2.266409, 0.3803922, 1, 0, 1,
-0.6318253, 2.03449, 0.462727, 0.372549, 1, 0, 1,
-0.6298023, 1.082828, -0.6592669, 0.3686275, 1, 0, 1,
-0.6290081, -0.02958151, -2.722296, 0.3607843, 1, 0, 1,
-0.6274495, -1.133389, -1.252813, 0.3568628, 1, 0, 1,
-0.6271064, -1.098606, -2.118977, 0.3490196, 1, 0, 1,
-0.6251476, -0.3490357, -1.619335, 0.345098, 1, 0, 1,
-0.6229027, 1.306578, -0.5183918, 0.3372549, 1, 0, 1,
-0.6148638, -0.6460955, -2.242042, 0.3333333, 1, 0, 1,
-0.6144879, 1.338622, 2.002872, 0.3254902, 1, 0, 1,
-0.6139359, 0.2513867, -3.183357, 0.3215686, 1, 0, 1,
-0.6119133, 0.5953258, -2.385314, 0.3137255, 1, 0, 1,
-0.611643, 1.461436, -0.3802797, 0.3098039, 1, 0, 1,
-0.6108258, -0.002652569, -3.675411, 0.3019608, 1, 0, 1,
-0.6083792, -1.049008, -2.002742, 0.2941177, 1, 0, 1,
-0.6077778, 1.368871, -0.8684487, 0.2901961, 1, 0, 1,
-0.603265, -0.1569986, -2.574256, 0.282353, 1, 0, 1,
-0.6032342, -0.4934656, -2.287368, 0.2784314, 1, 0, 1,
-0.5941409, 1.190641, 1.103868, 0.2705882, 1, 0, 1,
-0.5934491, -1.028114, -2.744091, 0.2666667, 1, 0, 1,
-0.5863364, 0.7690104, 0.2801903, 0.2588235, 1, 0, 1,
-0.5829415, -2.976188, -2.85485, 0.254902, 1, 0, 1,
-0.5809843, 0.4858707, -1.700467, 0.2470588, 1, 0, 1,
-0.5804872, 1.538158, 0.8116776, 0.2431373, 1, 0, 1,
-0.5758709, -2.167767, -3.838825, 0.2352941, 1, 0, 1,
-0.5754756, -0.08563654, -2.235905, 0.2313726, 1, 0, 1,
-0.5733857, 1.013405, -0.5468178, 0.2235294, 1, 0, 1,
-0.5714925, 0.009506301, -1.482952, 0.2196078, 1, 0, 1,
-0.5698069, -2.133071, -3.409602, 0.2117647, 1, 0, 1,
-0.5623367, -0.358247, -1.697463, 0.2078431, 1, 0, 1,
-0.5608208, 1.853753, -0.8302103, 0.2, 1, 0, 1,
-0.5601845, 0.6274368, 0.06789779, 0.1921569, 1, 0, 1,
-0.5527897, 1.309444, 0.09989324, 0.1882353, 1, 0, 1,
-0.5523835, 0.6949885, -1.42704, 0.1803922, 1, 0, 1,
-0.5517064, 1.086168, -0.4481722, 0.1764706, 1, 0, 1,
-0.5511858, -0.552353, -2.049909, 0.1686275, 1, 0, 1,
-0.5456525, -1.04111, -2.46561, 0.1647059, 1, 0, 1,
-0.5435943, 0.4412892, -0.2712122, 0.1568628, 1, 0, 1,
-0.5430644, 0.9445562, 0.6250541, 0.1529412, 1, 0, 1,
-0.5419993, -0.244874, -2.137352, 0.145098, 1, 0, 1,
-0.5370802, -0.3635882, -2.691445, 0.1411765, 1, 0, 1,
-0.531922, 0.7575052, 0.5449678, 0.1333333, 1, 0, 1,
-0.5291575, -1.402701, -4.238034, 0.1294118, 1, 0, 1,
-0.5256241, 0.4851213, 0.6058547, 0.1215686, 1, 0, 1,
-0.5253074, 0.0007239839, -2.387064, 0.1176471, 1, 0, 1,
-0.5199607, -0.4510077, -3.191374, 0.1098039, 1, 0, 1,
-0.5022278, 0.6852484, -0.6004462, 0.1058824, 1, 0, 1,
-0.5018989, 0.9122515, -1.67321, 0.09803922, 1, 0, 1,
-0.5018378, -0.5066502, -3.621324, 0.09019608, 1, 0, 1,
-0.5008833, -2.084743, -2.330889, 0.08627451, 1, 0, 1,
-0.494675, 0.6116943, -0.7985609, 0.07843138, 1, 0, 1,
-0.4898684, 1.218493, -0.2312428, 0.07450981, 1, 0, 1,
-0.4897872, 1.143293, -0.06516656, 0.06666667, 1, 0, 1,
-0.4859774, 1.147103, -2.596294, 0.0627451, 1, 0, 1,
-0.4842289, 1.326499, 0.7910696, 0.05490196, 1, 0, 1,
-0.4816581, -0.9078825, -0.6751701, 0.05098039, 1, 0, 1,
-0.4803095, -1.46144, -1.412773, 0.04313726, 1, 0, 1,
-0.4777881, -0.4997389, -2.812732, 0.03921569, 1, 0, 1,
-0.4700749, 0.1325037, -2.0295, 0.03137255, 1, 0, 1,
-0.4648507, -0.4540417, -3.91749, 0.02745098, 1, 0, 1,
-0.4613403, -1.044848, -2.854581, 0.01960784, 1, 0, 1,
-0.4612969, 0.5110933, -1.74809, 0.01568628, 1, 0, 1,
-0.4610055, 0.2380704, -0.9571362, 0.007843138, 1, 0, 1,
-0.4579788, -0.5034043, -2.66666, 0.003921569, 1, 0, 1,
-0.4570082, 1.271438, -0.9083413, 0, 1, 0.003921569, 1,
-0.4559609, -0.07395579, -2.509989, 0, 1, 0.01176471, 1,
-0.4544871, 0.7291747, -0.6225585, 0, 1, 0.01568628, 1,
-0.4535649, 0.133371, 0.03538398, 0, 1, 0.02352941, 1,
-0.4525843, 0.4372908, -1.459521, 0, 1, 0.02745098, 1,
-0.4471833, 1.558378, -1.542175, 0, 1, 0.03529412, 1,
-0.4445508, -1.363553, -4.50361, 0, 1, 0.03921569, 1,
-0.4415703, -0.4015979, -1.867445, 0, 1, 0.04705882, 1,
-0.4403583, -2.407588, -1.961788, 0, 1, 0.05098039, 1,
-0.4353696, -1.567104, -3.803417, 0, 1, 0.05882353, 1,
-0.4350987, -0.6156235, -1.667345, 0, 1, 0.0627451, 1,
-0.4343818, -0.2609155, -0.3804621, 0, 1, 0.07058824, 1,
-0.431766, 0.3552219, 0.4618139, 0, 1, 0.07450981, 1,
-0.4281608, 0.2240872, -0.8297804, 0, 1, 0.08235294, 1,
-0.4270235, -1.675289, -1.386093, 0, 1, 0.08627451, 1,
-0.4259021, -0.174418, -3.242692, 0, 1, 0.09411765, 1,
-0.4202585, 0.9204054, -1.396432, 0, 1, 0.1019608, 1,
-0.412039, 0.665234, 0.6891294, 0, 1, 0.1058824, 1,
-0.3994597, 0.1685489, -2.069869, 0, 1, 0.1137255, 1,
-0.3947415, -0.411191, -1.093541, 0, 1, 0.1176471, 1,
-0.3852711, 0.8167941, 2.150566, 0, 1, 0.1254902, 1,
-0.3822472, 0.4458339, -1.943277, 0, 1, 0.1294118, 1,
-0.3806204, -0.2984332, -1.802483, 0, 1, 0.1372549, 1,
-0.3790785, -0.6479228, -0.7677881, 0, 1, 0.1411765, 1,
-0.372794, -0.87576, -3.36428, 0, 1, 0.1490196, 1,
-0.3704368, -1.029985, -3.023094, 0, 1, 0.1529412, 1,
-0.3693007, -1.41416, -4.118424, 0, 1, 0.1607843, 1,
-0.3677998, -0.9466799, -3.908349, 0, 1, 0.1647059, 1,
-0.3674117, 1.009241, -0.752291, 0, 1, 0.172549, 1,
-0.3664719, 2.454401, -1.552314, 0, 1, 0.1764706, 1,
-0.3640611, -0.1903743, -1.63894, 0, 1, 0.1843137, 1,
-0.3599315, 1.232239, -1.688929, 0, 1, 0.1882353, 1,
-0.3588866, 0.1676892, -2.01153, 0, 1, 0.1960784, 1,
-0.3569697, -0.7075049, -4.022603, 0, 1, 0.2039216, 1,
-0.3501261, -0.06480603, -0.5610974, 0, 1, 0.2078431, 1,
-0.3500809, 0.04543954, -1.555817, 0, 1, 0.2156863, 1,
-0.3494183, -1.281693, -3.919871, 0, 1, 0.2196078, 1,
-0.3390137, -1.867347, -6.701697, 0, 1, 0.227451, 1,
-0.3319827, -0.4883747, -4.274734, 0, 1, 0.2313726, 1,
-0.3316479, -0.02219942, -1.123498, 0, 1, 0.2392157, 1,
-0.3288712, 0.1906636, -1.536363, 0, 1, 0.2431373, 1,
-0.3203987, -0.3289534, -0.8878078, 0, 1, 0.2509804, 1,
-0.3188104, 0.8483632, -0.7202396, 0, 1, 0.254902, 1,
-0.3147827, -0.2448356, -2.214556, 0, 1, 0.2627451, 1,
-0.3102314, -0.2440052, -1.557186, 0, 1, 0.2666667, 1,
-0.3064066, 0.3162653, -2.373318, 0, 1, 0.2745098, 1,
-0.3058872, 0.9540647, 0.2163467, 0, 1, 0.2784314, 1,
-0.2917817, 0.5790039, -1.126413, 0, 1, 0.2862745, 1,
-0.2916358, 1.455969, -1.531018, 0, 1, 0.2901961, 1,
-0.289667, -1.008615, -2.705558, 0, 1, 0.2980392, 1,
-0.2883905, 0.4866289, 0.8764818, 0, 1, 0.3058824, 1,
-0.2842002, 0.7214032, 0.07967545, 0, 1, 0.3098039, 1,
-0.2830866, -0.5330812, -3.317515, 0, 1, 0.3176471, 1,
-0.2817859, 1.028364, 1.978793, 0, 1, 0.3215686, 1,
-0.2764509, -0.6667061, -3.454304, 0, 1, 0.3294118, 1,
-0.2723708, 0.05721486, -2.034935, 0, 1, 0.3333333, 1,
-0.2694183, -0.8130469, -0.6002949, 0, 1, 0.3411765, 1,
-0.2632094, 0.4590067, -0.9254795, 0, 1, 0.345098, 1,
-0.2617078, -0.2771079, -2.44661, 0, 1, 0.3529412, 1,
-0.2612703, 0.6122668, 0.07884046, 0, 1, 0.3568628, 1,
-0.2573422, -0.4161153, -2.404969, 0, 1, 0.3647059, 1,
-0.256864, 2.059682, 0.6617228, 0, 1, 0.3686275, 1,
-0.2566908, -0.5903957, -2.362509, 0, 1, 0.3764706, 1,
-0.2547477, 1.020894, 0.5088652, 0, 1, 0.3803922, 1,
-0.2539405, -0.2606763, -2.217827, 0, 1, 0.3882353, 1,
-0.253597, 1.272605, 0.9671829, 0, 1, 0.3921569, 1,
-0.2495195, -0.6336048, -2.078588, 0, 1, 0.4, 1,
-0.2492583, -1.059444, -3.023962, 0, 1, 0.4078431, 1,
-0.246184, 0.9262736, -0.8091893, 0, 1, 0.4117647, 1,
-0.2392066, 0.3257068, -1.50936, 0, 1, 0.4196078, 1,
-0.237395, 1.19969, -1.264127, 0, 1, 0.4235294, 1,
-0.2372083, 0.272352, -0.8493357, 0, 1, 0.4313726, 1,
-0.2291514, 0.7525302, 0.2804857, 0, 1, 0.4352941, 1,
-0.2279216, 0.2041267, -2.255611, 0, 1, 0.4431373, 1,
-0.2201063, 0.7842215, -1.0698, 0, 1, 0.4470588, 1,
-0.218014, -0.09924278, -3.448444, 0, 1, 0.454902, 1,
-0.2177083, 0.3891746, 2.012151, 0, 1, 0.4588235, 1,
-0.214945, 0.07237228, -1.400178, 0, 1, 0.4666667, 1,
-0.2143833, -1.809503, -4.140349, 0, 1, 0.4705882, 1,
-0.2131986, 0.1978079, 0.1642628, 0, 1, 0.4784314, 1,
-0.2121176, -0.5961693, -2.126333, 0, 1, 0.4823529, 1,
-0.2087701, 2.283352, -3.186464, 0, 1, 0.4901961, 1,
-0.2027377, 1.402257, -0.6127092, 0, 1, 0.4941176, 1,
-0.2005687, 1.957589, 0.2836468, 0, 1, 0.5019608, 1,
-0.2004927, -1.495319, -2.751508, 0, 1, 0.509804, 1,
-0.1954921, -0.2692401, -1.92329, 0, 1, 0.5137255, 1,
-0.1934994, -1.04512, -1.426481, 0, 1, 0.5215687, 1,
-0.1907016, -1.386817, -2.35523, 0, 1, 0.5254902, 1,
-0.1871304, -0.9366749, -4.982457, 0, 1, 0.5333334, 1,
-0.183984, 0.4081083, 0.335341, 0, 1, 0.5372549, 1,
-0.1820145, -1.191971, -2.661576, 0, 1, 0.5450981, 1,
-0.1798239, -0.3867334, -2.639633, 0, 1, 0.5490196, 1,
-0.1798048, 0.6641146, 0.5658706, 0, 1, 0.5568628, 1,
-0.177645, -0.3651742, -3.326352, 0, 1, 0.5607843, 1,
-0.1769926, 0.8921149, -2.06424, 0, 1, 0.5686275, 1,
-0.1740816, 0.2099566, 1.167385, 0, 1, 0.572549, 1,
-0.174055, 0.6229425, 0.4554787, 0, 1, 0.5803922, 1,
-0.158473, 0.3944393, 0.02728037, 0, 1, 0.5843138, 1,
-0.1534951, -1.641292, -2.184896, 0, 1, 0.5921569, 1,
-0.1532358, -2.640228, -2.760432, 0, 1, 0.5960785, 1,
-0.1487978, -0.1427471, -3.692363, 0, 1, 0.6039216, 1,
-0.1482374, -0.4313222, -3.20002, 0, 1, 0.6117647, 1,
-0.14696, 1.836914, -1.490228, 0, 1, 0.6156863, 1,
-0.1420389, -1.5611, -4.163456, 0, 1, 0.6235294, 1,
-0.1417442, 0.0935888, -1.59987, 0, 1, 0.627451, 1,
-0.1409936, -0.9003723, -3.551344, 0, 1, 0.6352941, 1,
-0.1363106, -1.027851, -4.990406, 0, 1, 0.6392157, 1,
-0.1358898, -0.803838, -2.510518, 0, 1, 0.6470588, 1,
-0.1346363, 1.5294, -0.03214253, 0, 1, 0.6509804, 1,
-0.1334907, 1.265615, -3.75733, 0, 1, 0.6588235, 1,
-0.1303662, -0.03349619, -0.5755268, 0, 1, 0.6627451, 1,
-0.1281636, 0.7451503, 1.540048, 0, 1, 0.6705883, 1,
-0.1256086, -1.585873, -3.138635, 0, 1, 0.6745098, 1,
-0.122273, 0.1500528, 1.980122, 0, 1, 0.682353, 1,
-0.1144855, -0.05188367, -2.193489, 0, 1, 0.6862745, 1,
-0.114434, 0.1047462, -1.394638, 0, 1, 0.6941177, 1,
-0.1137418, -0.4245043, -1.98436, 0, 1, 0.7019608, 1,
-0.1127522, -0.8871684, -5.05182, 0, 1, 0.7058824, 1,
-0.09243122, -0.04072984, -1.767704, 0, 1, 0.7137255, 1,
-0.0906359, 0.2470701, -0.6937459, 0, 1, 0.7176471, 1,
-0.08221078, -0.8833581, -2.719617, 0, 1, 0.7254902, 1,
-0.08046403, 2.012396, -0.9701083, 0, 1, 0.7294118, 1,
-0.07947428, -0.2540645, -2.103113, 0, 1, 0.7372549, 1,
-0.07909367, -0.5335752, -1.85164, 0, 1, 0.7411765, 1,
-0.07843918, -1.467871, -2.601699, 0, 1, 0.7490196, 1,
-0.07740369, -0.5559213, -2.393521, 0, 1, 0.7529412, 1,
-0.0764349, 0.4318783, -0.5927358, 0, 1, 0.7607843, 1,
-0.07639055, 1.317138, -1.363937, 0, 1, 0.7647059, 1,
-0.07317845, 0.05962221, -1.371672, 0, 1, 0.772549, 1,
-0.07108153, 0.4536379, -0.8077157, 0, 1, 0.7764706, 1,
-0.07076728, -1.280455, -5.315149, 0, 1, 0.7843137, 1,
-0.06879167, -1.160277, -2.367389, 0, 1, 0.7882353, 1,
-0.06271923, 0.216936, -0.5334672, 0, 1, 0.7960784, 1,
-0.05936787, 1.765017, -0.3179573, 0, 1, 0.8039216, 1,
-0.05797708, -0.484388, -2.685993, 0, 1, 0.8078431, 1,
-0.04740182, -0.6477237, -0.7032324, 0, 1, 0.8156863, 1,
-0.04616218, -0.02880959, -1.389459, 0, 1, 0.8196079, 1,
-0.04489829, -2.166335, -3.883329, 0, 1, 0.827451, 1,
-0.03795142, 0.2946253, -1.427259, 0, 1, 0.8313726, 1,
-0.03751127, 0.2306903, -0.3809345, 0, 1, 0.8392157, 1,
-0.03658829, 1.313281, 1.204641, 0, 1, 0.8431373, 1,
-0.03408621, 0.9407223, 0.9478009, 0, 1, 0.8509804, 1,
-0.03066815, -1.113324, -4.558727, 0, 1, 0.854902, 1,
-0.01827792, 0.09220204, -0.4494424, 0, 1, 0.8627451, 1,
-0.01371114, 0.6109927, 0.1933658, 0, 1, 0.8666667, 1,
-0.01018472, -0.3174391, -3.687973, 0, 1, 0.8745098, 1,
-0.00293955, -0.7300014, -4.004569, 0, 1, 0.8784314, 1,
-0.001879031, -1.523891, -2.257723, 0, 1, 0.8862745, 1,
-0.001045166, -0.3320591, -3.001907, 0, 1, 0.8901961, 1,
-0.000728593, -1.273934, -2.666399, 0, 1, 0.8980392, 1,
-0.0006238824, -0.05559814, -2.145169, 0, 1, 0.9058824, 1,
-0.0004390097, 0.5193959, -0.1990222, 0, 1, 0.9098039, 1,
-0.0004334351, 0.002358031, 1.603459, 0, 1, 0.9176471, 1,
0.0001459217, 0.9963104, 1.109247, 0, 1, 0.9215686, 1,
0.003731891, -2.299833, 2.113158, 0, 1, 0.9294118, 1,
0.007614969, 0.6520197, 0.3872578, 0, 1, 0.9333333, 1,
0.009590324, 0.2918116, -0.7487429, 0, 1, 0.9411765, 1,
0.01142871, 0.05640803, -0.2247367, 0, 1, 0.945098, 1,
0.01153366, 0.7677841, 1.570293, 0, 1, 0.9529412, 1,
0.01177064, 0.5728284, -0.7459599, 0, 1, 0.9568627, 1,
0.01256392, 0.07015102, 0.2650996, 0, 1, 0.9647059, 1,
0.01325441, 0.2191162, 0.04559863, 0, 1, 0.9686275, 1,
0.01325757, 0.8360423, 1.60622, 0, 1, 0.9764706, 1,
0.01602067, -0.8272019, 3.642205, 0, 1, 0.9803922, 1,
0.01918787, 1.122944, -0.9343317, 0, 1, 0.9882353, 1,
0.0211542, 0.09376238, -0.7237376, 0, 1, 0.9921569, 1,
0.02629456, 0.897249, -1.015178, 0, 1, 1, 1,
0.02676575, 0.7920125, -1.24594, 0, 0.9921569, 1, 1,
0.03428179, 0.8676435, -0.9507937, 0, 0.9882353, 1, 1,
0.04132215, -0.8834412, 2.725329, 0, 0.9803922, 1, 1,
0.04163147, -1.441406, 2.126154, 0, 0.9764706, 1, 1,
0.04234324, -1.016976, 3.04177, 0, 0.9686275, 1, 1,
0.04820556, 0.08790869, 1.430507, 0, 0.9647059, 1, 1,
0.04931147, -0.5488556, 4.695203, 0, 0.9568627, 1, 1,
0.05063426, -0.9420069, 3.296838, 0, 0.9529412, 1, 1,
0.05166739, -1.90498, 4.198899, 0, 0.945098, 1, 1,
0.06060382, 0.6042327, -0.9444886, 0, 0.9411765, 1, 1,
0.0606195, -2.348314, 2.867898, 0, 0.9333333, 1, 1,
0.06421097, 1.157192, 0.5304155, 0, 0.9294118, 1, 1,
0.06477349, -0.1756773, 3.61599, 0, 0.9215686, 1, 1,
0.06649542, 1.071763, 0.6630799, 0, 0.9176471, 1, 1,
0.06730483, 0.03243617, 1.923591, 0, 0.9098039, 1, 1,
0.06744581, -0.034993, 2.054857, 0, 0.9058824, 1, 1,
0.0719403, -0.2135493, 2.485007, 0, 0.8980392, 1, 1,
0.0724423, -0.5775114, 4.34481, 0, 0.8901961, 1, 1,
0.0784434, 0.1529634, 2.061747, 0, 0.8862745, 1, 1,
0.08028214, -2.348914, 2.17938, 0, 0.8784314, 1, 1,
0.09386873, 0.532225, 0.3424847, 0, 0.8745098, 1, 1,
0.09557816, -1.043477, 2.549592, 0, 0.8666667, 1, 1,
0.09645085, 0.3553981, 0.844974, 0, 0.8627451, 1, 1,
0.1005282, -0.9422533, 3.809626, 0, 0.854902, 1, 1,
0.1008913, -1.283899, 4.809742, 0, 0.8509804, 1, 1,
0.1017686, -0.6089216, 3.261453, 0, 0.8431373, 1, 1,
0.1032317, 1.396739, 0.7128896, 0, 0.8392157, 1, 1,
0.1072525, -0.6808137, 2.395907, 0, 0.8313726, 1, 1,
0.1080556, -0.2639826, 3.48754, 0, 0.827451, 1, 1,
0.1117416, -0.7695791, 3.043161, 0, 0.8196079, 1, 1,
0.1200087, -0.1640676, 4.065606, 0, 0.8156863, 1, 1,
0.1228132, -0.4208085, 3.852574, 0, 0.8078431, 1, 1,
0.1262857, 0.7682147, -0.3100818, 0, 0.8039216, 1, 1,
0.1282122, 2.902728, 0.4646747, 0, 0.7960784, 1, 1,
0.1301271, 0.6696528, 0.707014, 0, 0.7882353, 1, 1,
0.1344258, 0.1836193, 0.8868065, 0, 0.7843137, 1, 1,
0.1348606, -0.9576948, 3.039103, 0, 0.7764706, 1, 1,
0.1360267, -0.404532, 3.755095, 0, 0.772549, 1, 1,
0.1378025, -1.018462, 2.309143, 0, 0.7647059, 1, 1,
0.1406889, -0.2740774, 2.400205, 0, 0.7607843, 1, 1,
0.1446424, -0.7439662, 4.086487, 0, 0.7529412, 1, 1,
0.1475133, 0.765987, 0.9835526, 0, 0.7490196, 1, 1,
0.1503591, -0.9854054, 4.078654, 0, 0.7411765, 1, 1,
0.1509821, 1.687214, 0.6513113, 0, 0.7372549, 1, 1,
0.1514466, -0.1780526, 1.609473, 0, 0.7294118, 1, 1,
0.1542967, 0.9570011, 1.381939, 0, 0.7254902, 1, 1,
0.1544151, -0.5119392, 2.055636, 0, 0.7176471, 1, 1,
0.1555321, -0.8133088, 2.559016, 0, 0.7137255, 1, 1,
0.1563793, 1.655207, -0.9829164, 0, 0.7058824, 1, 1,
0.1577751, 0.1267706, 1.744861, 0, 0.6980392, 1, 1,
0.1591471, 0.6163862, 0.311804, 0, 0.6941177, 1, 1,
0.161248, -0.6803409, 2.852012, 0, 0.6862745, 1, 1,
0.1634898, 1.004737, -0.4091644, 0, 0.682353, 1, 1,
0.1644565, -1.216597, 1.470106, 0, 0.6745098, 1, 1,
0.1666242, -0.9160939, 1.966794, 0, 0.6705883, 1, 1,
0.1752793, -2.640569, 1.273708, 0, 0.6627451, 1, 1,
0.1754306, 0.5563886, 0.4510072, 0, 0.6588235, 1, 1,
0.1834834, 0.3338515, 0.5523093, 0, 0.6509804, 1, 1,
0.1877765, 1.869057, 0.8571189, 0, 0.6470588, 1, 1,
0.189718, -1.869943, 3.244625, 0, 0.6392157, 1, 1,
0.1977295, -0.452244, 2.356246, 0, 0.6352941, 1, 1,
0.2077173, -0.9927326, 4.055198, 0, 0.627451, 1, 1,
0.2105718, 0.105853, 2.017806, 0, 0.6235294, 1, 1,
0.2175308, 0.8314492, -0.6454383, 0, 0.6156863, 1, 1,
0.2179037, 0.0600806, 1.551615, 0, 0.6117647, 1, 1,
0.2194325, 1.429038, -0.4678361, 0, 0.6039216, 1, 1,
0.2194872, -0.5464789, 2.886357, 0, 0.5960785, 1, 1,
0.2202368, -0.260112, 0.6399543, 0, 0.5921569, 1, 1,
0.2210467, -0.1272189, 0.4255739, 0, 0.5843138, 1, 1,
0.222214, 0.8073422, 1.498455, 0, 0.5803922, 1, 1,
0.2224995, -0.5790552, 3.045789, 0, 0.572549, 1, 1,
0.2254149, 0.5392281, 1.302504, 0, 0.5686275, 1, 1,
0.2255495, 0.04973814, 1.063134, 0, 0.5607843, 1, 1,
0.2258195, -1.11426, 3.28818, 0, 0.5568628, 1, 1,
0.2274722, 0.09861767, -1.028374, 0, 0.5490196, 1, 1,
0.2313594, 0.9703588, -0.4876623, 0, 0.5450981, 1, 1,
0.2398498, 0.4726487, -0.07412694, 0, 0.5372549, 1, 1,
0.2442012, 0.7761599, 0.9981557, 0, 0.5333334, 1, 1,
0.2483508, 0.5000387, 0.0599514, 0, 0.5254902, 1, 1,
0.2519411, -0.03719915, 0.931953, 0, 0.5215687, 1, 1,
0.2579667, 0.4905377, -0.3621541, 0, 0.5137255, 1, 1,
0.2589372, -0.1467956, 1.109627, 0, 0.509804, 1, 1,
0.2603074, -0.4778413, 1.586546, 0, 0.5019608, 1, 1,
0.2603317, 1.224974, -0.996278, 0, 0.4941176, 1, 1,
0.2605329, -0.2765349, 3.711751, 0, 0.4901961, 1, 1,
0.2640787, -0.9723098, 3.460412, 0, 0.4823529, 1, 1,
0.2664136, 0.475374, -1.940222, 0, 0.4784314, 1, 1,
0.2703927, 1.438999, -0.9228129, 0, 0.4705882, 1, 1,
0.273162, -1.806436, 2.564822, 0, 0.4666667, 1, 1,
0.2731622, -0.109712, 1.972307, 0, 0.4588235, 1, 1,
0.2775702, 0.9791907, 1.386961, 0, 0.454902, 1, 1,
0.2780921, 0.2045372, 1.538564, 0, 0.4470588, 1, 1,
0.2814461, 0.4525892, -0.3454514, 0, 0.4431373, 1, 1,
0.2832699, 0.3037484, 2.093566, 0, 0.4352941, 1, 1,
0.2833566, 0.1870532, 1.222277, 0, 0.4313726, 1, 1,
0.2843784, -0.1591589, 1.508204, 0, 0.4235294, 1, 1,
0.288751, 0.1609936, 1.326321, 0, 0.4196078, 1, 1,
0.2898878, -0.7462418, 3.153533, 0, 0.4117647, 1, 1,
0.2928832, -0.371235, 2.49227, 0, 0.4078431, 1, 1,
0.2935368, 0.05165615, 1.486588, 0, 0.4, 1, 1,
0.3000159, -0.3919392, 2.021283, 0, 0.3921569, 1, 1,
0.3023145, 0.6172072, 1.162519, 0, 0.3882353, 1, 1,
0.3065333, -0.3297951, 1.5025, 0, 0.3803922, 1, 1,
0.3087398, -0.3160881, 0.1458601, 0, 0.3764706, 1, 1,
0.3090806, 0.8144221, -0.8518403, 0, 0.3686275, 1, 1,
0.3110065, -0.7937799, 2.799154, 0, 0.3647059, 1, 1,
0.3119042, 0.2525514, 2.268209, 0, 0.3568628, 1, 1,
0.3169456, -1.600866, 2.986561, 0, 0.3529412, 1, 1,
0.3201182, 0.2760713, -1.698445, 0, 0.345098, 1, 1,
0.3203966, 0.2673948, 0.8192225, 0, 0.3411765, 1, 1,
0.3266948, -0.8370587, 4.252676, 0, 0.3333333, 1, 1,
0.3269734, -0.6290744, 2.609927, 0, 0.3294118, 1, 1,
0.3284512, 0.04425161, 1.894649, 0, 0.3215686, 1, 1,
0.3364061, -0.7072579, 0.6654915, 0, 0.3176471, 1, 1,
0.3423565, 0.8678381, 1.229721, 0, 0.3098039, 1, 1,
0.3427494, 0.6645918, 1.945814, 0, 0.3058824, 1, 1,
0.3444289, -0.9510483, 2.100414, 0, 0.2980392, 1, 1,
0.3447493, 0.1914905, 0.9680045, 0, 0.2901961, 1, 1,
0.3545069, 1.676217, 0.4251794, 0, 0.2862745, 1, 1,
0.3554949, -0.1497746, 3.233672, 0, 0.2784314, 1, 1,
0.3592338, 0.7369426, 1.520866, 0, 0.2745098, 1, 1,
0.3618681, 0.1301175, 1.506158, 0, 0.2666667, 1, 1,
0.3624903, 0.6821274, 1.458477, 0, 0.2627451, 1, 1,
0.3631187, -0.4851352, 2.612115, 0, 0.254902, 1, 1,
0.3646894, 0.165257, 0.9101745, 0, 0.2509804, 1, 1,
0.3713949, -1.27816, 2.177057, 0, 0.2431373, 1, 1,
0.3741775, -1.171549, 2.562529, 0, 0.2392157, 1, 1,
0.3763165, 0.2108887, 1.570498, 0, 0.2313726, 1, 1,
0.3769794, -0.1770235, 2.862199, 0, 0.227451, 1, 1,
0.3826104, 0.9102145, 0.4675516, 0, 0.2196078, 1, 1,
0.3855398, 0.5256276, 1.820029, 0, 0.2156863, 1, 1,
0.3880025, -1.702951, 3.432508, 0, 0.2078431, 1, 1,
0.3902503, -0.4134872, 3.704564, 0, 0.2039216, 1, 1,
0.3914359, -0.4831261, 2.652015, 0, 0.1960784, 1, 1,
0.3947753, 1.187054, 0.6559516, 0, 0.1882353, 1, 1,
0.3958057, 1.304172, 0.38918, 0, 0.1843137, 1, 1,
0.3971557, 0.2166455, 1.504527, 0, 0.1764706, 1, 1,
0.4086086, -1.235319, 4.535873, 0, 0.172549, 1, 1,
0.4129499, 0.6102443, -0.1443099, 0, 0.1647059, 1, 1,
0.4189411, -0.1157881, 1.823972, 0, 0.1607843, 1, 1,
0.4233049, -2.171989, 2.667579, 0, 0.1529412, 1, 1,
0.4308218, -0.8979384, 4.247795, 0, 0.1490196, 1, 1,
0.4314628, 0.3090424, 0.7172657, 0, 0.1411765, 1, 1,
0.4344173, 0.560581, 0.3327672, 0, 0.1372549, 1, 1,
0.4365027, 1.309709, 1.039603, 0, 0.1294118, 1, 1,
0.437494, -0.3096396, 2.386406, 0, 0.1254902, 1, 1,
0.439039, -0.828043, 1.467095, 0, 0.1176471, 1, 1,
0.4415938, -0.3899106, 2.843448, 0, 0.1137255, 1, 1,
0.4429347, -0.3162875, 2.387657, 0, 0.1058824, 1, 1,
0.4476858, -0.5798233, 2.183982, 0, 0.09803922, 1, 1,
0.4479916, 1.229544, 3.193295, 0, 0.09411765, 1, 1,
0.4501865, 0.3086557, 0.6510254, 0, 0.08627451, 1, 1,
0.4509153, 0.09928925, 2.097355, 0, 0.08235294, 1, 1,
0.450996, -0.8291751, 2.936424, 0, 0.07450981, 1, 1,
0.451757, 0.7274463, -0.1194538, 0, 0.07058824, 1, 1,
0.4536057, -0.5345779, 2.167753, 0, 0.0627451, 1, 1,
0.4552415, -0.6077593, 3.364217, 0, 0.05882353, 1, 1,
0.4564076, 0.2132988, 2.460615, 0, 0.05098039, 1, 1,
0.4574312, 0.3123185, -0.3723022, 0, 0.04705882, 1, 1,
0.4600523, 1.328832, 1.002055, 0, 0.03921569, 1, 1,
0.4613133, 0.3208782, 0.4527238, 0, 0.03529412, 1, 1,
0.4736935, 0.441649, 1.163654, 0, 0.02745098, 1, 1,
0.4739208, 0.2286327, 2.250849, 0, 0.02352941, 1, 1,
0.4787802, 2.132369, 0.5485749, 0, 0.01568628, 1, 1,
0.479146, 1.492384, 1.203686, 0, 0.01176471, 1, 1,
0.4799302, 1.082753, -1.208684, 0, 0.003921569, 1, 1,
0.4817956, -0.0524378, 0.8275833, 0.003921569, 0, 1, 1,
0.4894138, 0.3910038, 0.4490153, 0.007843138, 0, 1, 1,
0.4894766, -0.3356503, 2.261908, 0.01568628, 0, 1, 1,
0.4958814, 0.5432195, 0.8518767, 0.01960784, 0, 1, 1,
0.4978735, -0.4532313, 1.68968, 0.02745098, 0, 1, 1,
0.503785, -0.3319777, 1.304773, 0.03137255, 0, 1, 1,
0.5052762, -0.492, 3.040788, 0.03921569, 0, 1, 1,
0.5143612, -1.229542, 3.302269, 0.04313726, 0, 1, 1,
0.5202547, 0.817798, -0.2253672, 0.05098039, 0, 1, 1,
0.538935, -0.8010563, 2.469931, 0.05490196, 0, 1, 1,
0.5392022, 0.6537455, 1.109342, 0.0627451, 0, 1, 1,
0.5413734, 0.277178, 1.413475, 0.06666667, 0, 1, 1,
0.5417135, 0.3036701, 2.375093, 0.07450981, 0, 1, 1,
0.5425937, 0.0834254, 1.055622, 0.07843138, 0, 1, 1,
0.544108, -0.7782204, 2.761221, 0.08627451, 0, 1, 1,
0.5457807, -0.1649781, 1.424336, 0.09019608, 0, 1, 1,
0.5460781, -0.8878781, 2.809017, 0.09803922, 0, 1, 1,
0.5489456, 0.3168269, 0.360094, 0.1058824, 0, 1, 1,
0.5518829, 0.0005513424, 2.614113, 0.1098039, 0, 1, 1,
0.5554686, -0.462195, 0.609389, 0.1176471, 0, 1, 1,
0.5562911, 0.8947874, 1.411881, 0.1215686, 0, 1, 1,
0.5586693, -1.472297, 2.969275, 0.1294118, 0, 1, 1,
0.5618275, 0.1064254, -0.5181451, 0.1333333, 0, 1, 1,
0.5673141, -1.015459, 2.99992, 0.1411765, 0, 1, 1,
0.569669, -0.1964875, 2.10009, 0.145098, 0, 1, 1,
0.5729955, 0.892399, 3.093333, 0.1529412, 0, 1, 1,
0.5773398, 0.5299487, 1.049799, 0.1568628, 0, 1, 1,
0.5789371, -0.4312007, 2.487204, 0.1647059, 0, 1, 1,
0.5805246, 0.5207265, -0.03984721, 0.1686275, 0, 1, 1,
0.5809246, -0.6105419, 2.669695, 0.1764706, 0, 1, 1,
0.5829665, 1.808069, 0.5101083, 0.1803922, 0, 1, 1,
0.5839677, -0.5347929, 3.1705, 0.1882353, 0, 1, 1,
0.5849849, -0.2802915, 1.827465, 0.1921569, 0, 1, 1,
0.5887262, -0.9177336, 2.382338, 0.2, 0, 1, 1,
0.5896019, 0.4425809, 1.501815, 0.2078431, 0, 1, 1,
0.5908527, 0.2868809, 1.894106, 0.2117647, 0, 1, 1,
0.5908802, -0.5805756, 0.4951894, 0.2196078, 0, 1, 1,
0.5920588, 0.4662656, 3.19042, 0.2235294, 0, 1, 1,
0.592225, -0.4024155, 1.108223, 0.2313726, 0, 1, 1,
0.5926231, 0.730082, 0.3304279, 0.2352941, 0, 1, 1,
0.5985479, 1.024508, 0.1380675, 0.2431373, 0, 1, 1,
0.599218, -2.124928, 1.322556, 0.2470588, 0, 1, 1,
0.600201, -0.3018417, 1.279195, 0.254902, 0, 1, 1,
0.6068456, -0.4804241, 1.295184, 0.2588235, 0, 1, 1,
0.6084614, 0.8557885, 1.362461, 0.2666667, 0, 1, 1,
0.6161638, -0.557464, 1.917125, 0.2705882, 0, 1, 1,
0.6203931, 0.4669282, 0.178531, 0.2784314, 0, 1, 1,
0.6302812, 0.4551203, 0.3578592, 0.282353, 0, 1, 1,
0.6319977, -0.2126521, 2.662086, 0.2901961, 0, 1, 1,
0.6374002, -0.1711909, 1.577428, 0.2941177, 0, 1, 1,
0.642424, -0.01727694, 1.66627, 0.3019608, 0, 1, 1,
0.6432055, 0.8957117, 0.6827571, 0.3098039, 0, 1, 1,
0.6467002, -0.7355354, 2.887373, 0.3137255, 0, 1, 1,
0.6485223, 1.103702, 2.32957, 0.3215686, 0, 1, 1,
0.6495907, -0.9176902, 2.712044, 0.3254902, 0, 1, 1,
0.6520467, 0.09458377, 2.396981, 0.3333333, 0, 1, 1,
0.6520587, -0.05575388, 1.055801, 0.3372549, 0, 1, 1,
0.6530673, 1.215086, 0.8157558, 0.345098, 0, 1, 1,
0.6583983, 0.7108734, 1.060092, 0.3490196, 0, 1, 1,
0.6748212, 0.1028463, 2.598452, 0.3568628, 0, 1, 1,
0.6750996, 0.6697145, -0.9701461, 0.3607843, 0, 1, 1,
0.6769655, 0.9906068, 0.7416087, 0.3686275, 0, 1, 1,
0.6819741, -1.201411, 4.055108, 0.372549, 0, 1, 1,
0.6904538, -0.4617803, 4.111117, 0.3803922, 0, 1, 1,
0.6919227, -1.652972, 2.107229, 0.3843137, 0, 1, 1,
0.6946494, 1.479824, 0.2210052, 0.3921569, 0, 1, 1,
0.6949312, -0.5437436, 2.151793, 0.3960784, 0, 1, 1,
0.6956496, 0.157226, 0.3692272, 0.4039216, 0, 1, 1,
0.696883, -1.629092, 4.023471, 0.4117647, 0, 1, 1,
0.6991638, 0.1432964, 1.308126, 0.4156863, 0, 1, 1,
0.7005019, -0.3950002, -0.5031243, 0.4235294, 0, 1, 1,
0.7064696, -0.8527795, 1.274159, 0.427451, 0, 1, 1,
0.7109428, 1.254158, 2.470484, 0.4352941, 0, 1, 1,
0.7112849, -1.169952, 1.702658, 0.4392157, 0, 1, 1,
0.7122735, 0.2107669, 0.3384229, 0.4470588, 0, 1, 1,
0.71311, 0.8872945, 2.061188, 0.4509804, 0, 1, 1,
0.7135973, -0.4445466, 1.467548, 0.4588235, 0, 1, 1,
0.7138435, -0.4894751, 2.509477, 0.4627451, 0, 1, 1,
0.7158618, 0.1537197, 1.596313, 0.4705882, 0, 1, 1,
0.7159631, 0.7291786, 1.426677, 0.4745098, 0, 1, 1,
0.7203708, 0.5701373, 0.6439724, 0.4823529, 0, 1, 1,
0.7249704, 0.6476542, 0.6032681, 0.4862745, 0, 1, 1,
0.7268664, 1.210362, 0.8607259, 0.4941176, 0, 1, 1,
0.7273877, 0.09527028, -0.1518413, 0.5019608, 0, 1, 1,
0.729679, 1.501117, 1.681192, 0.5058824, 0, 1, 1,
0.7298399, -1.145635, 3.002735, 0.5137255, 0, 1, 1,
0.7334417, -0.2013111, 0.5581371, 0.5176471, 0, 1, 1,
0.7341873, 1.095739, 2.97395, 0.5254902, 0, 1, 1,
0.7405707, 0.1634447, 0.1877905, 0.5294118, 0, 1, 1,
0.7411107, 0.7379128, 1.448935, 0.5372549, 0, 1, 1,
0.7427607, 0.7811493, -0.1082827, 0.5411765, 0, 1, 1,
0.7455755, 2.071463, 1.22345, 0.5490196, 0, 1, 1,
0.7469645, 0.1181564, 1.51238, 0.5529412, 0, 1, 1,
0.7470806, -0.05744379, -0.2554455, 0.5607843, 0, 1, 1,
0.7482815, 2.357828, 0.09942174, 0.5647059, 0, 1, 1,
0.7506409, -1.298193, 2.880203, 0.572549, 0, 1, 1,
0.7513476, -0.8572164, 3.3758, 0.5764706, 0, 1, 1,
0.756285, -0.1475797, 4.411921, 0.5843138, 0, 1, 1,
0.7589196, 1.242292, -0.7921902, 0.5882353, 0, 1, 1,
0.7605324, 1.2222, 1.390059, 0.5960785, 0, 1, 1,
0.7656174, -0.8304583, 3.662608, 0.6039216, 0, 1, 1,
0.7678515, 0.3431686, 1.419235, 0.6078432, 0, 1, 1,
0.7704753, -1.083031, 2.157842, 0.6156863, 0, 1, 1,
0.7741559, -0.05832273, 2.159393, 0.6196079, 0, 1, 1,
0.7770934, 0.1737702, 0.4373251, 0.627451, 0, 1, 1,
0.7784855, -1.466246, 3.378201, 0.6313726, 0, 1, 1,
0.7791039, 1.168428, 0.07454836, 0.6392157, 0, 1, 1,
0.7849419, 1.085035, 0.8826849, 0.6431373, 0, 1, 1,
0.786727, 1.358585, 1.206753, 0.6509804, 0, 1, 1,
0.7909572, 1.168538, 0.9679445, 0.654902, 0, 1, 1,
0.7912883, -0.5082722, 1.686113, 0.6627451, 0, 1, 1,
0.7930562, -1.132403, 2.543525, 0.6666667, 0, 1, 1,
0.7960737, 1.910269, 0.8166863, 0.6745098, 0, 1, 1,
0.7974737, -1.085186, 3.149895, 0.6784314, 0, 1, 1,
0.7977833, 0.4948364, 2.865744, 0.6862745, 0, 1, 1,
0.8092184, -0.6393797, 1.906467, 0.6901961, 0, 1, 1,
0.8188109, -1.009674, 3.846478, 0.6980392, 0, 1, 1,
0.821636, 0.5061786, 1.414171, 0.7058824, 0, 1, 1,
0.8361012, 0.002371822, 0.9044984, 0.7098039, 0, 1, 1,
0.8374454, -0.9433585, 2.60724, 0.7176471, 0, 1, 1,
0.8412354, -0.5306445, 2.635632, 0.7215686, 0, 1, 1,
0.8454438, 1.421749, 0.1666596, 0.7294118, 0, 1, 1,
0.8457886, -0.5778931, 3.126036, 0.7333333, 0, 1, 1,
0.8462719, 0.5586641, -0.3533294, 0.7411765, 0, 1, 1,
0.8479119, 1.986053, 0.2839085, 0.7450981, 0, 1, 1,
0.8516107, -0.0255022, 0.8930153, 0.7529412, 0, 1, 1,
0.8533561, 0.8386203, -0.4217184, 0.7568628, 0, 1, 1,
0.8537049, -0.1671892, 0.3996339, 0.7647059, 0, 1, 1,
0.855742, -1.335101, 3.769452, 0.7686275, 0, 1, 1,
0.8570641, -1.146546, -0.017575, 0.7764706, 0, 1, 1,
0.8585911, -0.001200185, 0.8506952, 0.7803922, 0, 1, 1,
0.861407, -1.293918, 3.902015, 0.7882353, 0, 1, 1,
0.8618299, -1.866189, 2.724098, 0.7921569, 0, 1, 1,
0.8625853, 1.482521, 1.396155, 0.8, 0, 1, 1,
0.8657449, -0.598987, 3.409546, 0.8078431, 0, 1, 1,
0.8660254, -0.7659693, 1.134085, 0.8117647, 0, 1, 1,
0.8666806, 0.1001821, 2.842673, 0.8196079, 0, 1, 1,
0.8672908, 0.1117779, 0.1214899, 0.8235294, 0, 1, 1,
0.8728327, -0.4443073, 0.5272952, 0.8313726, 0, 1, 1,
0.8769471, -0.05799266, 2.527415, 0.8352941, 0, 1, 1,
0.8798233, -0.9860041, 3.823477, 0.8431373, 0, 1, 1,
0.8924236, 0.8475752, 0.9595746, 0.8470588, 0, 1, 1,
0.8991466, -0.2601855, 2.348547, 0.854902, 0, 1, 1,
0.8992003, -0.7766977, 1.780702, 0.8588235, 0, 1, 1,
0.8996706, -0.03834751, 1.145566, 0.8666667, 0, 1, 1,
0.8998532, -0.1550384, 2.07929, 0.8705882, 0, 1, 1,
0.9001252, 0.5616513, 1.229833, 0.8784314, 0, 1, 1,
0.9078229, 0.4031467, 1.964548, 0.8823529, 0, 1, 1,
0.9112722, -1.409652, 1.824131, 0.8901961, 0, 1, 1,
0.9118168, 0.3072275, 1.236574, 0.8941177, 0, 1, 1,
0.9131247, -2.261974, 2.54772, 0.9019608, 0, 1, 1,
0.9145685, 0.7822657, 2.117317, 0.9098039, 0, 1, 1,
0.9210693, 0.0856755, 2.408726, 0.9137255, 0, 1, 1,
0.9234022, -0.04586764, 1.822451, 0.9215686, 0, 1, 1,
0.9267947, -1.211032, 1.706815, 0.9254902, 0, 1, 1,
0.9279269, 0.3446622, 0.5988904, 0.9333333, 0, 1, 1,
0.9315978, -0.4025211, 1.330069, 0.9372549, 0, 1, 1,
0.9338517, 2.135083, -0.4425107, 0.945098, 0, 1, 1,
0.9372941, -0.0738342, 2.144828, 0.9490196, 0, 1, 1,
0.9405426, 0.6686322, 0.3596863, 0.9568627, 0, 1, 1,
0.9450371, 0.7715536, 1.947985, 0.9607843, 0, 1, 1,
0.9580056, -1.780331, 2.21943, 0.9686275, 0, 1, 1,
0.9589459, -1.282191, 3.563374, 0.972549, 0, 1, 1,
0.9594476, 0.001836058, 2.533243, 0.9803922, 0, 1, 1,
0.9629095, -0.1925117, 2.413198, 0.9843137, 0, 1, 1,
0.9641061, -0.3464631, 0.868844, 0.9921569, 0, 1, 1,
0.9674602, 0.1928137, 2.44424, 0.9960784, 0, 1, 1,
0.9710584, -0.114188, 2.191827, 1, 0, 0.9960784, 1,
0.972953, 0.1820227, 1.576131, 1, 0, 0.9882353, 1,
0.97728, -0.6728125, 1.68796, 1, 0, 0.9843137, 1,
0.9832414, 0.4564722, 1.804185, 1, 0, 0.9764706, 1,
0.988825, 0.1324729, 1.088359, 1, 0, 0.972549, 1,
0.9902477, 0.7980982, -0.3371088, 1, 0, 0.9647059, 1,
0.9903554, 1.307914, 1.780378, 1, 0, 0.9607843, 1,
0.991475, 0.7615428, 0.9426953, 1, 0, 0.9529412, 1,
0.9930351, -0.3601517, 0.7629254, 1, 0, 0.9490196, 1,
0.9943414, 0.2763667, 2.817835, 1, 0, 0.9411765, 1,
1.002607, 0.5591835, 1.16989, 1, 0, 0.9372549, 1,
1.003729, -0.6582879, 0.961249, 1, 0, 0.9294118, 1,
1.00759, 1.41272, 0.1651658, 1, 0, 0.9254902, 1,
1.008478, 0.2185194, 0.6078519, 1, 0, 0.9176471, 1,
1.009366, 0.0343046, 1.196052, 1, 0, 0.9137255, 1,
1.016558, 2.17479, 2.636091, 1, 0, 0.9058824, 1,
1.017624, 0.4837932, 0.8594776, 1, 0, 0.9019608, 1,
1.032395, 0.2779797, 2.316615, 1, 0, 0.8941177, 1,
1.03395, 0.7317508, 0.5308174, 1, 0, 0.8862745, 1,
1.038882, 0.3836651, 3.05724, 1, 0, 0.8823529, 1,
1.044394, -0.3424604, -0.4874052, 1, 0, 0.8745098, 1,
1.047528, -0.1577853, 1.807157, 1, 0, 0.8705882, 1,
1.048681, -0.7468038, 2.882584, 1, 0, 0.8627451, 1,
1.054995, 0.1826008, 2.54904, 1, 0, 0.8588235, 1,
1.055297, 0.4797892, -0.1273859, 1, 0, 0.8509804, 1,
1.061952, -0.2680504, 1.769635, 1, 0, 0.8470588, 1,
1.064506, 0.3350551, 0.9037714, 1, 0, 0.8392157, 1,
1.064946, -0.2720888, 1.727912, 1, 0, 0.8352941, 1,
1.065417, -0.8224339, 1.286693, 1, 0, 0.827451, 1,
1.065924, -1.700825, 1.681332, 1, 0, 0.8235294, 1,
1.06773, -1.653937, 1.488811, 1, 0, 0.8156863, 1,
1.068128, 0.6485779, 2.064657, 1, 0, 0.8117647, 1,
1.072835, -0.4514894, 3.045838, 1, 0, 0.8039216, 1,
1.074156, 0.3552383, 2.899642, 1, 0, 0.7960784, 1,
1.076844, -0.1315107, 2.181023, 1, 0, 0.7921569, 1,
1.085819, 0.1785982, 1.227286, 1, 0, 0.7843137, 1,
1.089852, -0.8954336, 3.014597, 1, 0, 0.7803922, 1,
1.092355, 0.4541273, 0.1044473, 1, 0, 0.772549, 1,
1.100501, 1.539314, 0.8477593, 1, 0, 0.7686275, 1,
1.104095, 1.16609, 0.4427405, 1, 0, 0.7607843, 1,
1.104686, -0.05777122, 1.934925, 1, 0, 0.7568628, 1,
1.112581, 0.698274, 1.465465, 1, 0, 0.7490196, 1,
1.11321, 0.1953221, 0.6919119, 1, 0, 0.7450981, 1,
1.115124, -0.8743458, 2.785725, 1, 0, 0.7372549, 1,
1.117355, 0.7744455, 0.4799905, 1, 0, 0.7333333, 1,
1.120793, 1.262109, 0.1913884, 1, 0, 0.7254902, 1,
1.121415, 0.416577, 1.243103, 1, 0, 0.7215686, 1,
1.126178, -0.4010974, 1.058297, 1, 0, 0.7137255, 1,
1.129597, 0.9582841, 0.9878239, 1, 0, 0.7098039, 1,
1.129829, 1.345282, 0.8906097, 1, 0, 0.7019608, 1,
1.136438, -1.351541, 4.572228, 1, 0, 0.6941177, 1,
1.138885, 1.817583, 1.069261, 1, 0, 0.6901961, 1,
1.144168, -0.2528697, 1.854675, 1, 0, 0.682353, 1,
1.164095, -0.8124014, 2.16028, 1, 0, 0.6784314, 1,
1.166426, -1.64319, 1.85035, 1, 0, 0.6705883, 1,
1.179983, -0.9902151, 2.132256, 1, 0, 0.6666667, 1,
1.182981, 0.4802083, 1.519521, 1, 0, 0.6588235, 1,
1.183128, -0.6894039, 2.718271, 1, 0, 0.654902, 1,
1.20678, 0.6673052, 0.3170252, 1, 0, 0.6470588, 1,
1.208862, -0.580885, 3.449876, 1, 0, 0.6431373, 1,
1.210686, 0.7379563, 0.8840752, 1, 0, 0.6352941, 1,
1.220419, -0.5823373, 1.233813, 1, 0, 0.6313726, 1,
1.224774, 0.283279, 2.479291, 1, 0, 0.6235294, 1,
1.225015, -2.857189, 3.277501, 1, 0, 0.6196079, 1,
1.231291, -0.7974159, 2.674521, 1, 0, 0.6117647, 1,
1.235276, 0.05445426, 0.5583186, 1, 0, 0.6078432, 1,
1.243107, -1.916301, 3.225728, 1, 0, 0.6, 1,
1.244117, -0.278236, 1.678803, 1, 0, 0.5921569, 1,
1.247819, 1.326931, 0.2392371, 1, 0, 0.5882353, 1,
1.248063, -0.1578951, 2.391756, 1, 0, 0.5803922, 1,
1.255418, -1.197461, 2.837746, 1, 0, 0.5764706, 1,
1.262865, -0.4133135, 4.16751, 1, 0, 0.5686275, 1,
1.268504, -0.04065792, 1.210525, 1, 0, 0.5647059, 1,
1.285876, 1.103427, 1.225922, 1, 0, 0.5568628, 1,
1.296359, -1.067846, 1.934212, 1, 0, 0.5529412, 1,
1.300599, 0.2550793, 1.248378, 1, 0, 0.5450981, 1,
1.304399, -0.08069099, 1.416825, 1, 0, 0.5411765, 1,
1.307965, 2.242392, 0.7884366, 1, 0, 0.5333334, 1,
1.322502, -0.2502632, 2.696582, 1, 0, 0.5294118, 1,
1.336965, 1.411068, 0.944078, 1, 0, 0.5215687, 1,
1.341164, 0.6317019, 0.356584, 1, 0, 0.5176471, 1,
1.343697, 0.5597141, 0.4236001, 1, 0, 0.509804, 1,
1.357231, -0.1916232, 2.728431, 1, 0, 0.5058824, 1,
1.364035, -0.004280255, 1.105766, 1, 0, 0.4980392, 1,
1.368457, 1.677069, 1.901369, 1, 0, 0.4901961, 1,
1.381257, 0.44844, 1.904968, 1, 0, 0.4862745, 1,
1.389792, 1.10956, -0.6552116, 1, 0, 0.4784314, 1,
1.391771, 0.2096236, 0.9618122, 1, 0, 0.4745098, 1,
1.409384, 0.5836235, 3.626105, 1, 0, 0.4666667, 1,
1.409549, -1.351698, 1.125626, 1, 0, 0.4627451, 1,
1.413824, -1.397464, 2.713835, 1, 0, 0.454902, 1,
1.418551, 0.7905766, 2.374248, 1, 0, 0.4509804, 1,
1.421207, -1.573119, 2.982777, 1, 0, 0.4431373, 1,
1.425732, -1.12931, 0.3431884, 1, 0, 0.4392157, 1,
1.428296, 0.6175188, 0.8494805, 1, 0, 0.4313726, 1,
1.428938, -0.6590601, 0.4436815, 1, 0, 0.427451, 1,
1.442747, -0.1944206, 1.847662, 1, 0, 0.4196078, 1,
1.444515, 1.455347, 1.066191, 1, 0, 0.4156863, 1,
1.447791, -1.667124, 1.223376, 1, 0, 0.4078431, 1,
1.453708, 0.7845384, 0.09178739, 1, 0, 0.4039216, 1,
1.457098, -1.395125, 1.909176, 1, 0, 0.3960784, 1,
1.460182, -0.978693, 1.639458, 1, 0, 0.3882353, 1,
1.466427, 0.1428242, 0.8266406, 1, 0, 0.3843137, 1,
1.483422, -0.04568189, 2.388328, 1, 0, 0.3764706, 1,
1.499772, 0.7322788, 0.9469725, 1, 0, 0.372549, 1,
1.530631, -1.091318, 2.184851, 1, 0, 0.3647059, 1,
1.534549, 1.28096, 2.188007, 1, 0, 0.3607843, 1,
1.53497, 1.35497, 1.781902, 1, 0, 0.3529412, 1,
1.550177, -0.898626, 2.307932, 1, 0, 0.3490196, 1,
1.563834, -0.9913946, 2.127813, 1, 0, 0.3411765, 1,
1.567905, -0.9994776, 1.589348, 1, 0, 0.3372549, 1,
1.581748, 0.6567487, 0.06889979, 1, 0, 0.3294118, 1,
1.584264, -0.1055688, 1.778901, 1, 0, 0.3254902, 1,
1.584463, -1.11815, 1.61619, 1, 0, 0.3176471, 1,
1.598998, -0.2900979, 0.1892257, 1, 0, 0.3137255, 1,
1.600264, -0.4566011, 2.138387, 1, 0, 0.3058824, 1,
1.601209, -1.076127, 2.931345, 1, 0, 0.2980392, 1,
1.625733, -2.163438, 3.147612, 1, 0, 0.2941177, 1,
1.651157, 1.075328, 0.7024603, 1, 0, 0.2862745, 1,
1.661358, 0.6503944, 1.064278, 1, 0, 0.282353, 1,
1.666587, 1.105118, 0.7877187, 1, 0, 0.2745098, 1,
1.66793, 0.1484186, 1.69697, 1, 0, 0.2705882, 1,
1.674863, 0.8514321, 0.9748242, 1, 0, 0.2627451, 1,
1.681566, -1.202142, 1.205028, 1, 0, 0.2588235, 1,
1.705828, -0.3860737, 1.745911, 1, 0, 0.2509804, 1,
1.707695, 1.268257, 2.175704, 1, 0, 0.2470588, 1,
1.741458, -1.873433, 3.477582, 1, 0, 0.2392157, 1,
1.761786, 0.5871062, 2.439745, 1, 0, 0.2352941, 1,
1.763409, 1.417847, 1.025466, 1, 0, 0.227451, 1,
1.763974, -0.5754246, 1.718794, 1, 0, 0.2235294, 1,
1.766274, -0.6598352, 2.561363, 1, 0, 0.2156863, 1,
1.780463, -0.1234165, 2.131857, 1, 0, 0.2117647, 1,
1.792943, 1.40124, 0.5982491, 1, 0, 0.2039216, 1,
1.794578, -0.3668861, 0.929859, 1, 0, 0.1960784, 1,
1.816289, -2.07118, 1.801989, 1, 0, 0.1921569, 1,
1.830121, -0.8500668, 1.350316, 1, 0, 0.1843137, 1,
1.836769, 0.311875, 1.417817, 1, 0, 0.1803922, 1,
1.837531, 0.08506836, 2.445372, 1, 0, 0.172549, 1,
1.873123, -1.479164, 1.19522, 1, 0, 0.1686275, 1,
1.890961, -0.4922712, 2.676843, 1, 0, 0.1607843, 1,
1.89651, 1.320361, -1.293791, 1, 0, 0.1568628, 1,
1.902046, -2.477119, 1.460077, 1, 0, 0.1490196, 1,
1.907027, -1.50997, 1.115932, 1, 0, 0.145098, 1,
1.915332, -0.01872249, 0.7840134, 1, 0, 0.1372549, 1,
1.915847, -0.6555827, 3.057966, 1, 0, 0.1333333, 1,
1.918923, 0.9209189, 0.6603905, 1, 0, 0.1254902, 1,
1.925709, 1.952087, 1.476535, 1, 0, 0.1215686, 1,
1.976615, 0.5964397, 1.770421, 1, 0, 0.1137255, 1,
2.015918, 0.3909273, 2.179564, 1, 0, 0.1098039, 1,
2.055211, 1.177806, -0.1766399, 1, 0, 0.1019608, 1,
2.06731, -1.347776, 1.31547, 1, 0, 0.09411765, 1,
2.122728, -0.1226219, 1.014957, 1, 0, 0.09019608, 1,
2.14615, -0.3944119, -0.1715093, 1, 0, 0.08235294, 1,
2.236133, 0.02841251, 2.252434, 1, 0, 0.07843138, 1,
2.261974, 0.5114741, 3.204114, 1, 0, 0.07058824, 1,
2.278037, -0.3529031, 3.529215, 1, 0, 0.06666667, 1,
2.282092, -1.241209, 2.818695, 1, 0, 0.05882353, 1,
2.306591, 0.1090398, 1.125306, 1, 0, 0.05490196, 1,
2.380918, -0.0304253, 0.7387231, 1, 0, 0.04705882, 1,
2.390721, 0.07655894, 2.229913, 1, 0, 0.04313726, 1,
2.414117, -1.11003, 1.711819, 1, 0, 0.03529412, 1,
2.46036, 0.6100317, 1.456464, 1, 0, 0.03137255, 1,
2.480713, -0.2108286, 0.6223943, 1, 0, 0.02352941, 1,
2.482465, 0.01313114, -1.345688, 1, 0, 0.01960784, 1,
2.715741, 0.5781558, 1.837583, 1, 0, 0.01176471, 1,
3.325743, 0.3355529, 1.022484, 1, 0, 0.007843138, 1
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
-0.02521014, -3.98776, -8.652886, 0, -0.5, 0.5, 0.5,
-0.02521014, -3.98776, -8.652886, 1, -0.5, 0.5, 0.5,
-0.02521014, -3.98776, -8.652886, 1, 1.5, 0.5, 0.5,
-0.02521014, -3.98776, -8.652886, 0, 1.5, 0.5, 0.5
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
-4.512136, 0.007801294, -8.652886, 0, -0.5, 0.5, 0.5,
-4.512136, 0.007801294, -8.652886, 1, -0.5, 0.5, 0.5,
-4.512136, 0.007801294, -8.652886, 1, 1.5, 0.5, 0.5,
-4.512136, 0.007801294, -8.652886, 0, 1.5, 0.5, 0.5
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
-4.512136, -3.98776, -0.9459777, 0, -0.5, 0.5, 0.5,
-4.512136, -3.98776, -0.9459777, 1, -0.5, 0.5, 0.5,
-4.512136, -3.98776, -0.9459777, 1, 1.5, 0.5, 0.5,
-4.512136, -3.98776, -0.9459777, 0, 1.5, 0.5, 0.5
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
-3, -3.065707, -6.874369,
3, -3.065707, -6.874369,
-3, -3.065707, -6.874369,
-3, -3.219383, -7.170788,
-2, -3.065707, -6.874369,
-2, -3.219383, -7.170788,
-1, -3.065707, -6.874369,
-1, -3.219383, -7.170788,
0, -3.065707, -6.874369,
0, -3.219383, -7.170788,
1, -3.065707, -6.874369,
1, -3.219383, -7.170788,
2, -3.065707, -6.874369,
2, -3.219383, -7.170788,
3, -3.065707, -6.874369,
3, -3.219383, -7.170788
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
-3, -3.526734, -7.763628, 0, -0.5, 0.5, 0.5,
-3, -3.526734, -7.763628, 1, -0.5, 0.5, 0.5,
-3, -3.526734, -7.763628, 1, 1.5, 0.5, 0.5,
-3, -3.526734, -7.763628, 0, 1.5, 0.5, 0.5,
-2, -3.526734, -7.763628, 0, -0.5, 0.5, 0.5,
-2, -3.526734, -7.763628, 1, -0.5, 0.5, 0.5,
-2, -3.526734, -7.763628, 1, 1.5, 0.5, 0.5,
-2, -3.526734, -7.763628, 0, 1.5, 0.5, 0.5,
-1, -3.526734, -7.763628, 0, -0.5, 0.5, 0.5,
-1, -3.526734, -7.763628, 1, -0.5, 0.5, 0.5,
-1, -3.526734, -7.763628, 1, 1.5, 0.5, 0.5,
-1, -3.526734, -7.763628, 0, 1.5, 0.5, 0.5,
0, -3.526734, -7.763628, 0, -0.5, 0.5, 0.5,
0, -3.526734, -7.763628, 1, -0.5, 0.5, 0.5,
0, -3.526734, -7.763628, 1, 1.5, 0.5, 0.5,
0, -3.526734, -7.763628, 0, 1.5, 0.5, 0.5,
1, -3.526734, -7.763628, 0, -0.5, 0.5, 0.5,
1, -3.526734, -7.763628, 1, -0.5, 0.5, 0.5,
1, -3.526734, -7.763628, 1, 1.5, 0.5, 0.5,
1, -3.526734, -7.763628, 0, 1.5, 0.5, 0.5,
2, -3.526734, -7.763628, 0, -0.5, 0.5, 0.5,
2, -3.526734, -7.763628, 1, -0.5, 0.5, 0.5,
2, -3.526734, -7.763628, 1, 1.5, 0.5, 0.5,
2, -3.526734, -7.763628, 0, 1.5, 0.5, 0.5,
3, -3.526734, -7.763628, 0, -0.5, 0.5, 0.5,
3, -3.526734, -7.763628, 1, -0.5, 0.5, 0.5,
3, -3.526734, -7.763628, 1, 1.5, 0.5, 0.5,
3, -3.526734, -7.763628, 0, 1.5, 0.5, 0.5
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
-3.476692, -2, -6.874369,
-3.476692, 2, -6.874369,
-3.476692, -2, -6.874369,
-3.649266, -2, -7.170788,
-3.476692, -1, -6.874369,
-3.649266, -1, -7.170788,
-3.476692, 0, -6.874369,
-3.649266, 0, -7.170788,
-3.476692, 1, -6.874369,
-3.649266, 1, -7.170788,
-3.476692, 2, -6.874369,
-3.649266, 2, -7.170788
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
-3.994414, -2, -7.763628, 0, -0.5, 0.5, 0.5,
-3.994414, -2, -7.763628, 1, -0.5, 0.5, 0.5,
-3.994414, -2, -7.763628, 1, 1.5, 0.5, 0.5,
-3.994414, -2, -7.763628, 0, 1.5, 0.5, 0.5,
-3.994414, -1, -7.763628, 0, -0.5, 0.5, 0.5,
-3.994414, -1, -7.763628, 1, -0.5, 0.5, 0.5,
-3.994414, -1, -7.763628, 1, 1.5, 0.5, 0.5,
-3.994414, -1, -7.763628, 0, 1.5, 0.5, 0.5,
-3.994414, 0, -7.763628, 0, -0.5, 0.5, 0.5,
-3.994414, 0, -7.763628, 1, -0.5, 0.5, 0.5,
-3.994414, 0, -7.763628, 1, 1.5, 0.5, 0.5,
-3.994414, 0, -7.763628, 0, 1.5, 0.5, 0.5,
-3.994414, 1, -7.763628, 0, -0.5, 0.5, 0.5,
-3.994414, 1, -7.763628, 1, -0.5, 0.5, 0.5,
-3.994414, 1, -7.763628, 1, 1.5, 0.5, 0.5,
-3.994414, 1, -7.763628, 0, 1.5, 0.5, 0.5,
-3.994414, 2, -7.763628, 0, -0.5, 0.5, 0.5,
-3.994414, 2, -7.763628, 1, -0.5, 0.5, 0.5,
-3.994414, 2, -7.763628, 1, 1.5, 0.5, 0.5,
-3.994414, 2, -7.763628, 0, 1.5, 0.5, 0.5
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
-3.476692, -3.065707, -6,
-3.476692, -3.065707, 4,
-3.476692, -3.065707, -6,
-3.649266, -3.219383, -6,
-3.476692, -3.065707, -4,
-3.649266, -3.219383, -4,
-3.476692, -3.065707, -2,
-3.649266, -3.219383, -2,
-3.476692, -3.065707, 0,
-3.649266, -3.219383, 0,
-3.476692, -3.065707, 2,
-3.649266, -3.219383, 2,
-3.476692, -3.065707, 4,
-3.649266, -3.219383, 4
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
-3.994414, -3.526734, -6, 0, -0.5, 0.5, 0.5,
-3.994414, -3.526734, -6, 1, -0.5, 0.5, 0.5,
-3.994414, -3.526734, -6, 1, 1.5, 0.5, 0.5,
-3.994414, -3.526734, -6, 0, 1.5, 0.5, 0.5,
-3.994414, -3.526734, -4, 0, -0.5, 0.5, 0.5,
-3.994414, -3.526734, -4, 1, -0.5, 0.5, 0.5,
-3.994414, -3.526734, -4, 1, 1.5, 0.5, 0.5,
-3.994414, -3.526734, -4, 0, 1.5, 0.5, 0.5,
-3.994414, -3.526734, -2, 0, -0.5, 0.5, 0.5,
-3.994414, -3.526734, -2, 1, -0.5, 0.5, 0.5,
-3.994414, -3.526734, -2, 1, 1.5, 0.5, 0.5,
-3.994414, -3.526734, -2, 0, 1.5, 0.5, 0.5,
-3.994414, -3.526734, 0, 0, -0.5, 0.5, 0.5,
-3.994414, -3.526734, 0, 1, -0.5, 0.5, 0.5,
-3.994414, -3.526734, 0, 1, 1.5, 0.5, 0.5,
-3.994414, -3.526734, 0, 0, 1.5, 0.5, 0.5,
-3.994414, -3.526734, 2, 0, -0.5, 0.5, 0.5,
-3.994414, -3.526734, 2, 1, -0.5, 0.5, 0.5,
-3.994414, -3.526734, 2, 1, 1.5, 0.5, 0.5,
-3.994414, -3.526734, 2, 0, 1.5, 0.5, 0.5,
-3.994414, -3.526734, 4, 0, -0.5, 0.5, 0.5,
-3.994414, -3.526734, 4, 1, -0.5, 0.5, 0.5,
-3.994414, -3.526734, 4, 1, 1.5, 0.5, 0.5,
-3.994414, -3.526734, 4, 0, 1.5, 0.5, 0.5
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
-3.476692, -3.065707, -6.874369,
-3.476692, 3.08131, -6.874369,
-3.476692, -3.065707, 4.982414,
-3.476692, 3.08131, 4.982414,
-3.476692, -3.065707, -6.874369,
-3.476692, -3.065707, 4.982414,
-3.476692, 3.08131, -6.874369,
-3.476692, 3.08131, 4.982414,
-3.476692, -3.065707, -6.874369,
3.426272, -3.065707, -6.874369,
-3.476692, -3.065707, 4.982414,
3.426272, -3.065707, 4.982414,
-3.476692, 3.08131, -6.874369,
3.426272, 3.08131, -6.874369,
-3.476692, 3.08131, 4.982414,
3.426272, 3.08131, 4.982414,
3.426272, -3.065707, -6.874369,
3.426272, 3.08131, -6.874369,
3.426272, -3.065707, 4.982414,
3.426272, 3.08131, 4.982414,
3.426272, -3.065707, -6.874369,
3.426272, -3.065707, 4.982414,
3.426272, 3.08131, -6.874369,
3.426272, 3.08131, 4.982414
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
var radius = 8.027844;
var distance = 35.71679;
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
mvMatrix.translate( 0.02521014, -0.007801294, 0.9459777 );
mvMatrix.scale( 1.257411, 1.412045, 0.7320588 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.71679);
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
isopropalin<-read.table("isopropalin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isopropalin$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropalin' not found
```

```r
y<-isopropalin$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropalin' not found
```

```r
z<-isopropalin$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropalin' not found
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
-3.376163, -0.9718569, -0.9447598, 0, 0, 1, 1, 1,
-3.151388, 0.7604458, -1.055159, 1, 0, 0, 1, 1,
-2.968318, 0.2773556, -1.019085, 1, 0, 0, 1, 1,
-2.739907, 1.132351, -0.2679945, 1, 0, 0, 1, 1,
-2.716107, 0.04678292, -1.830109, 1, 0, 0, 1, 1,
-2.715226, -1.558382, -2.761454, 1, 0, 0, 1, 1,
-2.50773, -0.7278294, -0.9714034, 0, 0, 0, 1, 1,
-2.442654, 1.934359, 0.4547237, 0, 0, 0, 1, 1,
-2.354288, 0.7793692, -0.2652568, 0, 0, 0, 1, 1,
-2.348909, 0.6852077, -1.13855, 0, 0, 0, 1, 1,
-2.289643, 0.4580843, -2.533166, 0, 0, 0, 1, 1,
-2.231165, 1.402458, -0.4377449, 0, 0, 0, 1, 1,
-2.195534, 0.1026304, -1.733661, 0, 0, 0, 1, 1,
-2.186855, 0.03697859, -0.8833306, 1, 1, 1, 1, 1,
-2.147574, 0.4415629, -0.487795, 1, 1, 1, 1, 1,
-2.104465, 0.2153109, -2.258507, 1, 1, 1, 1, 1,
-2.078558, 0.7367584, -1.218443, 1, 1, 1, 1, 1,
-2.061092, -1.224943, -0.4936374, 1, 1, 1, 1, 1,
-2.010608, -0.05098585, -3.768841, 1, 1, 1, 1, 1,
-2.002021, -1.4814, -1.718021, 1, 1, 1, 1, 1,
-2.000952, -0.8883802, -1.543611, 1, 1, 1, 1, 1,
-1.986589, 0.08356823, -1.550078, 1, 1, 1, 1, 1,
-1.981786, -1.506835, -0.6157098, 1, 1, 1, 1, 1,
-1.97528, 0.1395032, -0.5249255, 1, 1, 1, 1, 1,
-1.967734, -0.3360501, -2.041471, 1, 1, 1, 1, 1,
-1.95944, -0.7120819, -3.331833, 1, 1, 1, 1, 1,
-1.924353, 0.8247348, -1.052224, 1, 1, 1, 1, 1,
-1.897304, 0.7752429, -1.674922, 1, 1, 1, 1, 1,
-1.887316, 1.954153, -2.024791, 0, 0, 1, 1, 1,
-1.880516, 1.60358, -1.352746, 1, 0, 0, 1, 1,
-1.876002, -0.2468774, -0.02543649, 1, 0, 0, 1, 1,
-1.848702, -1.822015, -1.648769, 1, 0, 0, 1, 1,
-1.843242, 0.3113721, -2.693158, 1, 0, 0, 1, 1,
-1.841265, -0.2179042, -2.225893, 1, 0, 0, 1, 1,
-1.83251, -0.6514688, -2.301626, 0, 0, 0, 1, 1,
-1.820385, 1.894821, 0.07533801, 0, 0, 0, 1, 1,
-1.815324, 0.2401185, -0.7022682, 0, 0, 0, 1, 1,
-1.802748, 0.6955288, -1.037086, 0, 0, 0, 1, 1,
-1.802073, 0.8886665, -1.172576, 0, 0, 0, 1, 1,
-1.780958, 0.4618486, -1.962606, 0, 0, 0, 1, 1,
-1.775508, 0.9214421, -1.268559, 0, 0, 0, 1, 1,
-1.772888, 0.8416469, -1.681106, 1, 1, 1, 1, 1,
-1.764327, -1.362165, -2.571183, 1, 1, 1, 1, 1,
-1.763638, -0.9063431, -1.583359, 1, 1, 1, 1, 1,
-1.762633, -0.7316958, -1.858948, 1, 1, 1, 1, 1,
-1.758234, -1.727538, -1.524689, 1, 1, 1, 1, 1,
-1.737723, -0.6172768, -2.772747, 1, 1, 1, 1, 1,
-1.737346, -0.05291387, -1.905658, 1, 1, 1, 1, 1,
-1.736117, 0.5567581, -1.603113, 1, 1, 1, 1, 1,
-1.735516, -0.826512, -1.772715, 1, 1, 1, 1, 1,
-1.710934, 0.3946667, -1.757265, 1, 1, 1, 1, 1,
-1.702929, -0.4592242, -0.707153, 1, 1, 1, 1, 1,
-1.692868, -0.3258995, -2.599565, 1, 1, 1, 1, 1,
-1.68805, 1.30994, -2.439946, 1, 1, 1, 1, 1,
-1.684363, -1.057494, -1.994979, 1, 1, 1, 1, 1,
-1.682507, 0.7150483, -2.002168, 1, 1, 1, 1, 1,
-1.680158, -1.089807, -0.01028975, 0, 0, 1, 1, 1,
-1.654229, -0.3040339, -2.788688, 1, 0, 0, 1, 1,
-1.629423, 1.439915, -2.38156, 1, 0, 0, 1, 1,
-1.615499, -0.6286169, -1.28174, 1, 0, 0, 1, 1,
-1.606658, -1.118073, 0.2990745, 1, 0, 0, 1, 1,
-1.601877, 0.004512276, -0.5047454, 1, 0, 0, 1, 1,
-1.59953, -0.2494928, -1.253823, 0, 0, 0, 1, 1,
-1.593145, -0.7193609, -1.561854, 0, 0, 0, 1, 1,
-1.58809, 0.340667, -2.054583, 0, 0, 0, 1, 1,
-1.565459, -0.1661801, -2.026237, 0, 0, 0, 1, 1,
-1.563181, -0.04867717, -2.413706, 0, 0, 0, 1, 1,
-1.549648, -0.7542685, -2.452116, 0, 0, 0, 1, 1,
-1.525983, 0.09745794, -1.297779, 0, 0, 0, 1, 1,
-1.519236, -0.1268899, -0.5837359, 1, 1, 1, 1, 1,
-1.515675, -0.3486741, -2.112641, 1, 1, 1, 1, 1,
-1.509809, 1.396, -0.4253635, 1, 1, 1, 1, 1,
-1.495981, 0.4958443, 0.7750133, 1, 1, 1, 1, 1,
-1.493166, -0.2873556, -0.9741504, 1, 1, 1, 1, 1,
-1.487525, -0.3759858, -0.5546273, 1, 1, 1, 1, 1,
-1.483491, 1.156842, 0.3123148, 1, 1, 1, 1, 1,
-1.476457, 0.2843781, -0.5845483, 1, 1, 1, 1, 1,
-1.475726, -1.801314, -3.109398, 1, 1, 1, 1, 1,
-1.465584, -1.078924, -1.196481, 1, 1, 1, 1, 1,
-1.465546, -0.3723773, -2.46802, 1, 1, 1, 1, 1,
-1.457532, 1.679146, -1.168432, 1, 1, 1, 1, 1,
-1.44951, -0.01532476, -2.249498, 1, 1, 1, 1, 1,
-1.439636, -0.1868705, -1.342055, 1, 1, 1, 1, 1,
-1.439427, -0.8440306, -2.114615, 1, 1, 1, 1, 1,
-1.437186, -0.3082283, -2.288838, 0, 0, 1, 1, 1,
-1.414771, 1.837382, -0.6910785, 1, 0, 0, 1, 1,
-1.413408, -1.468412, -2.182922, 1, 0, 0, 1, 1,
-1.405803, -1.282256, -2.048684, 1, 0, 0, 1, 1,
-1.403555, 0.3495315, -0.159306, 1, 0, 0, 1, 1,
-1.400923, 0.5238987, 0.3771961, 1, 0, 0, 1, 1,
-1.399519, -0.3236581, -1.957949, 0, 0, 0, 1, 1,
-1.398641, -1.076897, -2.384959, 0, 0, 0, 1, 1,
-1.397926, -0.7473978, -0.6039343, 0, 0, 0, 1, 1,
-1.39477, 1.395017, 0.5727332, 0, 0, 0, 1, 1,
-1.39043, -0.7281224, -2.603954, 0, 0, 0, 1, 1,
-1.388652, -0.1842798, -1.882203, 0, 0, 0, 1, 1,
-1.384458, -1.562642, -2.474342, 0, 0, 0, 1, 1,
-1.377599, 2.823437, -1.503324, 1, 1, 1, 1, 1,
-1.373845, -0.12675, -0.578743, 1, 1, 1, 1, 1,
-1.370052, -1.495376, -2.802038, 1, 1, 1, 1, 1,
-1.366773, 1.129286, -1.724903, 1, 1, 1, 1, 1,
-1.353102, 2.39799, -3.404263, 1, 1, 1, 1, 1,
-1.34361, 1.87958, -1.245404, 1, 1, 1, 1, 1,
-1.339897, 0.6341559, 0.1040321, 1, 1, 1, 1, 1,
-1.339361, 1.285284, -1.48105, 1, 1, 1, 1, 1,
-1.338789, -0.07736736, -0.2027159, 1, 1, 1, 1, 1,
-1.332365, 0.7829891, -0.2331201, 1, 1, 1, 1, 1,
-1.327635, -0.252564, -1.009104, 1, 1, 1, 1, 1,
-1.323354, 1.117712, -0.1146748, 1, 1, 1, 1, 1,
-1.318868, 1.444747, -0.532849, 1, 1, 1, 1, 1,
-1.317015, 1.134514, 0.8825189, 1, 1, 1, 1, 1,
-1.315746, -1.091419, -1.690408, 1, 1, 1, 1, 1,
-1.307948, -0.2825829, -0.556511, 0, 0, 1, 1, 1,
-1.299516, 0.0711223, -1.795348, 1, 0, 0, 1, 1,
-1.298826, 0.8897431, -1.172914, 1, 0, 0, 1, 1,
-1.292976, -0.5379499, -2.13864, 1, 0, 0, 1, 1,
-1.279898, -1.119833, -3.391695, 1, 0, 0, 1, 1,
-1.278936, -1.077723, -1.898909, 1, 0, 0, 1, 1,
-1.275038, 0.3127241, -0.6313596, 0, 0, 0, 1, 1,
-1.270048, 0.2957822, 1.332993, 0, 0, 0, 1, 1,
-1.269375, -0.2691857, -0.8970012, 0, 0, 0, 1, 1,
-1.244745, 2.186822, -1.26286, 0, 0, 0, 1, 1,
-1.241545, 0.7677652, -1.543118, 0, 0, 0, 1, 1,
-1.239014, 0.2872476, -1.244637, 0, 0, 0, 1, 1,
-1.224857, -0.2649358, -1.589209, 0, 0, 0, 1, 1,
-1.220573, 2.057819, -0.7997431, 1, 1, 1, 1, 1,
-1.218178, 1.717783, -3.629344, 1, 1, 1, 1, 1,
-1.209339, 0.03973969, -1.487748, 1, 1, 1, 1, 1,
-1.193791, 0.6938957, -1.553904, 1, 1, 1, 1, 1,
-1.184157, -0.1274933, -1.46273, 1, 1, 1, 1, 1,
-1.181263, 0.3326696, -1.931191, 1, 1, 1, 1, 1,
-1.176503, 0.5015996, -1.390705, 1, 1, 1, 1, 1,
-1.175098, -0.6782139, -1.499997, 1, 1, 1, 1, 1,
-1.156774, -0.1341346, -1.036923, 1, 1, 1, 1, 1,
-1.152894, 1.312136, -0.5110241, 1, 1, 1, 1, 1,
-1.137886, -1.651955, -1.726472, 1, 1, 1, 1, 1,
-1.136627, -0.3020178, -3.56645, 1, 1, 1, 1, 1,
-1.132183, 1.318239, -2.702813, 1, 1, 1, 1, 1,
-1.117888, -1.174347, -0.6958448, 1, 1, 1, 1, 1,
-1.113926, -1.636712, -1.687773, 1, 1, 1, 1, 1,
-1.111528, 0.6540227, -2.33019, 0, 0, 1, 1, 1,
-1.111027, -0.4252309, -2.089864, 1, 0, 0, 1, 1,
-1.110509, 0.3670397, -3.268789, 1, 0, 0, 1, 1,
-1.103775, -0.04339669, -3.309493, 1, 0, 0, 1, 1,
-1.102171, 1.219601, -0.4645795, 1, 0, 0, 1, 1,
-1.101302, -0.873556, -3.089376, 1, 0, 0, 1, 1,
-1.099821, -0.3162828, -0.5613956, 0, 0, 0, 1, 1,
-1.092605, -1.237537, -1.971035, 0, 0, 0, 1, 1,
-1.084968, -0.5534827, -3.282916, 0, 0, 0, 1, 1,
-1.082399, 1.879098, -0.8247597, 0, 0, 0, 1, 1,
-1.076587, -0.01391379, -1.781173, 0, 0, 0, 1, 1,
-1.07541, -0.5931649, -2.145413, 0, 0, 0, 1, 1,
-1.071619, 0.7707423, -0.5410206, 0, 0, 0, 1, 1,
-1.068788, 0.7021291, -1.030102, 1, 1, 1, 1, 1,
-1.062655, -0.2347329, -0.8054401, 1, 1, 1, 1, 1,
-1.055363, -0.5226065, -1.467585, 1, 1, 1, 1, 1,
-1.053577, -0.8402463, -1.28693, 1, 1, 1, 1, 1,
-1.051534, -0.09960898, -1.501606, 1, 1, 1, 1, 1,
-1.051047, 2.99179, 0.08616628, 1, 1, 1, 1, 1,
-1.043051, -1.065435, -1.790556, 1, 1, 1, 1, 1,
-1.042793, -0.1293932, -0.6833431, 1, 1, 1, 1, 1,
-1.042235, 1.233332, 0.5537366, 1, 1, 1, 1, 1,
-1.040375, -1.357399, -2.096577, 1, 1, 1, 1, 1,
-1.029792, 0.8497176, 0.2848093, 1, 1, 1, 1, 1,
-1.02902, 1.59139, -0.3407015, 1, 1, 1, 1, 1,
-1.023335, -1.677323, -2.632887, 1, 1, 1, 1, 1,
-1.023298, -2.562497, -2.934424, 1, 1, 1, 1, 1,
-1.018475, -0.5851521, -3.232711, 1, 1, 1, 1, 1,
-1.012842, 0.9932701, -3.209022, 0, 0, 1, 1, 1,
-1.009225, -0.2212639, -2.489698, 1, 0, 0, 1, 1,
-0.9968835, 0.5360636, -2.231881, 1, 0, 0, 1, 1,
-0.9957808, -0.09777774, -2.296074, 1, 0, 0, 1, 1,
-0.9943469, 1.375965, -1.093346, 1, 0, 0, 1, 1,
-0.984401, 0.6488101, -0.7598419, 1, 0, 0, 1, 1,
-0.9815981, -1.711778, -2.503764, 0, 0, 0, 1, 1,
-0.977763, -2.029381, -2.740102, 0, 0, 0, 1, 1,
-0.9715103, 0.4736625, -0.4470704, 0, 0, 0, 1, 1,
-0.9695688, -0.3892715, -2.314886, 0, 0, 0, 1, 1,
-0.9670886, 1.78176, -1.359637, 0, 0, 0, 1, 1,
-0.9662176, -2.611005, -5.103766, 0, 0, 0, 1, 1,
-0.9649315, -1.198615, -4.548201, 0, 0, 0, 1, 1,
-0.9579384, -0.5317308, 0.2694267, 1, 1, 1, 1, 1,
-0.9403545, -0.4220375, -4.039495, 1, 1, 1, 1, 1,
-0.9183292, 0.1912565, -2.096019, 1, 1, 1, 1, 1,
-0.9147298, 0.9261734, -1.558802, 1, 1, 1, 1, 1,
-0.9066623, -0.4052667, -1.995383, 1, 1, 1, 1, 1,
-0.9050762, -0.000128239, -2.938809, 1, 1, 1, 1, 1,
-0.8958008, -1.154489, -1.655029, 1, 1, 1, 1, 1,
-0.8850853, 0.9329306, -0.2903819, 1, 1, 1, 1, 1,
-0.884102, 0.08000617, -0.06070146, 1, 1, 1, 1, 1,
-0.8798656, -0.1934357, -2.455036, 1, 1, 1, 1, 1,
-0.8786751, -0.2213586, -1.121408, 1, 1, 1, 1, 1,
-0.8732844, -0.04685513, -0.3955396, 1, 1, 1, 1, 1,
-0.8577994, -0.1645412, -3.547477, 1, 1, 1, 1, 1,
-0.8565379, -0.03546116, -0.8712046, 1, 1, 1, 1, 1,
-0.8562821, 2.611684, -0.1548054, 1, 1, 1, 1, 1,
-0.8546848, 1.434748, -1.220885, 0, 0, 1, 1, 1,
-0.8471104, -2.070277, -3.859819, 1, 0, 0, 1, 1,
-0.8433154, 0.01113783, -2.712579, 1, 0, 0, 1, 1,
-0.8430257, 1.660263, 1.679242, 1, 0, 0, 1, 1,
-0.8363495, -0.2424089, 0.1390193, 1, 0, 0, 1, 1,
-0.8343616, -1.369915, -2.905133, 1, 0, 0, 1, 1,
-0.8342457, -0.9322456, -3.1994, 0, 0, 0, 1, 1,
-0.834063, 2.133433, -0.1923783, 0, 0, 0, 1, 1,
-0.8238347, -0.666822, -3.115416, 0, 0, 0, 1, 1,
-0.8138325, -0.4918847, -2.943467, 0, 0, 0, 1, 1,
-0.8035402, -0.2111989, -1.901781, 0, 0, 0, 1, 1,
-0.8023853, 1.060893, -0.7803255, 0, 0, 0, 1, 1,
-0.8012125, -0.1689748, -1.898912, 0, 0, 0, 1, 1,
-0.8008638, 0.5367812, -1.396098, 1, 1, 1, 1, 1,
-0.8003752, -1.866484, -3.327385, 1, 1, 1, 1, 1,
-0.7939652, 0.1604935, -2.484431, 1, 1, 1, 1, 1,
-0.7937847, 0.7228668, -1.017298, 1, 1, 1, 1, 1,
-0.7917212, -0.622054, -1.655648, 1, 1, 1, 1, 1,
-0.7901284, -0.1740505, -1.431134, 1, 1, 1, 1, 1,
-0.7859782, 0.6987956, 2.104153, 1, 1, 1, 1, 1,
-0.7839361, 0.1780025, -2.766465, 1, 1, 1, 1, 1,
-0.7834394, 2.080668, 0.3399276, 1, 1, 1, 1, 1,
-0.7813588, -0.8086548, -3.279212, 1, 1, 1, 1, 1,
-0.7794387, -0.2139923, -0.5509304, 1, 1, 1, 1, 1,
-0.7770586, -0.6279384, -3.836042, 1, 1, 1, 1, 1,
-0.7677354, 0.08205352, -1.804439, 1, 1, 1, 1, 1,
-0.7670561, 0.1321732, 0.1951866, 1, 1, 1, 1, 1,
-0.7627228, 1.480832, -0.5461537, 1, 1, 1, 1, 1,
-0.7550248, -0.6220965, -2.092967, 0, 0, 1, 1, 1,
-0.7533345, 2.130638, 1.372051, 1, 0, 0, 1, 1,
-0.7532882, 1.27834, -1.049612, 1, 0, 0, 1, 1,
-0.7527096, -0.3360252, -4.158275, 1, 0, 0, 1, 1,
-0.7518966, 0.1777394, 1.362882, 1, 0, 0, 1, 1,
-0.7502638, -0.7500207, -2.004122, 1, 0, 0, 1, 1,
-0.7487922, -0.5407491, -2.713921, 0, 0, 0, 1, 1,
-0.7485288, 0.5079448, -1.967408, 0, 0, 0, 1, 1,
-0.7482637, 0.706287, -1.776925, 0, 0, 0, 1, 1,
-0.747524, -0.4886981, -2.970197, 0, 0, 0, 1, 1,
-0.7376167, 0.5739418, 0.622127, 0, 0, 0, 1, 1,
-0.7303067, -0.009005342, -1.837704, 0, 0, 0, 1, 1,
-0.7280319, -0.2268018, -1.800286, 0, 0, 0, 1, 1,
-0.7270448, -0.4507464, -1.819021, 1, 1, 1, 1, 1,
-0.7261328, 0.1167357, -1.931805, 1, 1, 1, 1, 1,
-0.7178548, 1.15137, 1.881999, 1, 1, 1, 1, 1,
-0.7127012, 1.255906, -0.5872847, 1, 1, 1, 1, 1,
-0.7087901, -1.22796, -3.682615, 1, 1, 1, 1, 1,
-0.707096, -0.4031397, -1.475659, 1, 1, 1, 1, 1,
-0.704015, 0.6101046, -0.1651054, 1, 1, 1, 1, 1,
-0.7036875, 0.4026411, -0.07413056, 1, 1, 1, 1, 1,
-0.6995551, 0.8227263, -0.182862, 1, 1, 1, 1, 1,
-0.6980303, 1.481433, 0.453481, 1, 1, 1, 1, 1,
-0.6958529, 1.985253, -1.519652, 1, 1, 1, 1, 1,
-0.6927556, 0.7332137, -3.693506, 1, 1, 1, 1, 1,
-0.6882887, -1.684096, -1.630458, 1, 1, 1, 1, 1,
-0.6878057, 0.02772082, -0.2587305, 1, 1, 1, 1, 1,
-0.6854935, -1.176907, -1.8062, 1, 1, 1, 1, 1,
-0.6849391, 1.169834, -0.2017647, 0, 0, 1, 1, 1,
-0.6822635, 0.9146171, 0.3059508, 1, 0, 0, 1, 1,
-0.6783032, -0.0164502, -0.2337549, 1, 0, 0, 1, 1,
-0.6774639, -0.6718768, -2.209643, 1, 0, 0, 1, 1,
-0.6757138, 0.6612327, 0.6997622, 1, 0, 0, 1, 1,
-0.6708103, 0.8904072, -1.199229, 1, 0, 0, 1, 1,
-0.6678539, -0.7545288, -2.905333, 0, 0, 0, 1, 1,
-0.657863, 0.2955437, -2.194401, 0, 0, 0, 1, 1,
-0.6573759, -0.3566291, -2.509182, 0, 0, 0, 1, 1,
-0.6553589, -0.7877992, -3.569626, 0, 0, 0, 1, 1,
-0.6492749, 0.3577188, -3.174167, 0, 0, 0, 1, 1,
-0.6475561, -1.267185, -3.205404, 0, 0, 0, 1, 1,
-0.6460491, 0.4718416, -0.4028157, 0, 0, 0, 1, 1,
-0.6441067, 0.4213848, -0.4234962, 1, 1, 1, 1, 1,
-0.6418871, 0.4773856, 0.4897448, 1, 1, 1, 1, 1,
-0.6399966, 0.1589223, -2.100478, 1, 1, 1, 1, 1,
-0.6395395, -0.5256721, -2.794809, 1, 1, 1, 1, 1,
-0.639147, 0.7103501, 0.1543947, 1, 1, 1, 1, 1,
-0.6371769, 0.2709861, -2.266409, 1, 1, 1, 1, 1,
-0.6318253, 2.03449, 0.462727, 1, 1, 1, 1, 1,
-0.6298023, 1.082828, -0.6592669, 1, 1, 1, 1, 1,
-0.6290081, -0.02958151, -2.722296, 1, 1, 1, 1, 1,
-0.6274495, -1.133389, -1.252813, 1, 1, 1, 1, 1,
-0.6271064, -1.098606, -2.118977, 1, 1, 1, 1, 1,
-0.6251476, -0.3490357, -1.619335, 1, 1, 1, 1, 1,
-0.6229027, 1.306578, -0.5183918, 1, 1, 1, 1, 1,
-0.6148638, -0.6460955, -2.242042, 1, 1, 1, 1, 1,
-0.6144879, 1.338622, 2.002872, 1, 1, 1, 1, 1,
-0.6139359, 0.2513867, -3.183357, 0, 0, 1, 1, 1,
-0.6119133, 0.5953258, -2.385314, 1, 0, 0, 1, 1,
-0.611643, 1.461436, -0.3802797, 1, 0, 0, 1, 1,
-0.6108258, -0.002652569, -3.675411, 1, 0, 0, 1, 1,
-0.6083792, -1.049008, -2.002742, 1, 0, 0, 1, 1,
-0.6077778, 1.368871, -0.8684487, 1, 0, 0, 1, 1,
-0.603265, -0.1569986, -2.574256, 0, 0, 0, 1, 1,
-0.6032342, -0.4934656, -2.287368, 0, 0, 0, 1, 1,
-0.5941409, 1.190641, 1.103868, 0, 0, 0, 1, 1,
-0.5934491, -1.028114, -2.744091, 0, 0, 0, 1, 1,
-0.5863364, 0.7690104, 0.2801903, 0, 0, 0, 1, 1,
-0.5829415, -2.976188, -2.85485, 0, 0, 0, 1, 1,
-0.5809843, 0.4858707, -1.700467, 0, 0, 0, 1, 1,
-0.5804872, 1.538158, 0.8116776, 1, 1, 1, 1, 1,
-0.5758709, -2.167767, -3.838825, 1, 1, 1, 1, 1,
-0.5754756, -0.08563654, -2.235905, 1, 1, 1, 1, 1,
-0.5733857, 1.013405, -0.5468178, 1, 1, 1, 1, 1,
-0.5714925, 0.009506301, -1.482952, 1, 1, 1, 1, 1,
-0.5698069, -2.133071, -3.409602, 1, 1, 1, 1, 1,
-0.5623367, -0.358247, -1.697463, 1, 1, 1, 1, 1,
-0.5608208, 1.853753, -0.8302103, 1, 1, 1, 1, 1,
-0.5601845, 0.6274368, 0.06789779, 1, 1, 1, 1, 1,
-0.5527897, 1.309444, 0.09989324, 1, 1, 1, 1, 1,
-0.5523835, 0.6949885, -1.42704, 1, 1, 1, 1, 1,
-0.5517064, 1.086168, -0.4481722, 1, 1, 1, 1, 1,
-0.5511858, -0.552353, -2.049909, 1, 1, 1, 1, 1,
-0.5456525, -1.04111, -2.46561, 1, 1, 1, 1, 1,
-0.5435943, 0.4412892, -0.2712122, 1, 1, 1, 1, 1,
-0.5430644, 0.9445562, 0.6250541, 0, 0, 1, 1, 1,
-0.5419993, -0.244874, -2.137352, 1, 0, 0, 1, 1,
-0.5370802, -0.3635882, -2.691445, 1, 0, 0, 1, 1,
-0.531922, 0.7575052, 0.5449678, 1, 0, 0, 1, 1,
-0.5291575, -1.402701, -4.238034, 1, 0, 0, 1, 1,
-0.5256241, 0.4851213, 0.6058547, 1, 0, 0, 1, 1,
-0.5253074, 0.0007239839, -2.387064, 0, 0, 0, 1, 1,
-0.5199607, -0.4510077, -3.191374, 0, 0, 0, 1, 1,
-0.5022278, 0.6852484, -0.6004462, 0, 0, 0, 1, 1,
-0.5018989, 0.9122515, -1.67321, 0, 0, 0, 1, 1,
-0.5018378, -0.5066502, -3.621324, 0, 0, 0, 1, 1,
-0.5008833, -2.084743, -2.330889, 0, 0, 0, 1, 1,
-0.494675, 0.6116943, -0.7985609, 0, 0, 0, 1, 1,
-0.4898684, 1.218493, -0.2312428, 1, 1, 1, 1, 1,
-0.4897872, 1.143293, -0.06516656, 1, 1, 1, 1, 1,
-0.4859774, 1.147103, -2.596294, 1, 1, 1, 1, 1,
-0.4842289, 1.326499, 0.7910696, 1, 1, 1, 1, 1,
-0.4816581, -0.9078825, -0.6751701, 1, 1, 1, 1, 1,
-0.4803095, -1.46144, -1.412773, 1, 1, 1, 1, 1,
-0.4777881, -0.4997389, -2.812732, 1, 1, 1, 1, 1,
-0.4700749, 0.1325037, -2.0295, 1, 1, 1, 1, 1,
-0.4648507, -0.4540417, -3.91749, 1, 1, 1, 1, 1,
-0.4613403, -1.044848, -2.854581, 1, 1, 1, 1, 1,
-0.4612969, 0.5110933, -1.74809, 1, 1, 1, 1, 1,
-0.4610055, 0.2380704, -0.9571362, 1, 1, 1, 1, 1,
-0.4579788, -0.5034043, -2.66666, 1, 1, 1, 1, 1,
-0.4570082, 1.271438, -0.9083413, 1, 1, 1, 1, 1,
-0.4559609, -0.07395579, -2.509989, 1, 1, 1, 1, 1,
-0.4544871, 0.7291747, -0.6225585, 0, 0, 1, 1, 1,
-0.4535649, 0.133371, 0.03538398, 1, 0, 0, 1, 1,
-0.4525843, 0.4372908, -1.459521, 1, 0, 0, 1, 1,
-0.4471833, 1.558378, -1.542175, 1, 0, 0, 1, 1,
-0.4445508, -1.363553, -4.50361, 1, 0, 0, 1, 1,
-0.4415703, -0.4015979, -1.867445, 1, 0, 0, 1, 1,
-0.4403583, -2.407588, -1.961788, 0, 0, 0, 1, 1,
-0.4353696, -1.567104, -3.803417, 0, 0, 0, 1, 1,
-0.4350987, -0.6156235, -1.667345, 0, 0, 0, 1, 1,
-0.4343818, -0.2609155, -0.3804621, 0, 0, 0, 1, 1,
-0.431766, 0.3552219, 0.4618139, 0, 0, 0, 1, 1,
-0.4281608, 0.2240872, -0.8297804, 0, 0, 0, 1, 1,
-0.4270235, -1.675289, -1.386093, 0, 0, 0, 1, 1,
-0.4259021, -0.174418, -3.242692, 1, 1, 1, 1, 1,
-0.4202585, 0.9204054, -1.396432, 1, 1, 1, 1, 1,
-0.412039, 0.665234, 0.6891294, 1, 1, 1, 1, 1,
-0.3994597, 0.1685489, -2.069869, 1, 1, 1, 1, 1,
-0.3947415, -0.411191, -1.093541, 1, 1, 1, 1, 1,
-0.3852711, 0.8167941, 2.150566, 1, 1, 1, 1, 1,
-0.3822472, 0.4458339, -1.943277, 1, 1, 1, 1, 1,
-0.3806204, -0.2984332, -1.802483, 1, 1, 1, 1, 1,
-0.3790785, -0.6479228, -0.7677881, 1, 1, 1, 1, 1,
-0.372794, -0.87576, -3.36428, 1, 1, 1, 1, 1,
-0.3704368, -1.029985, -3.023094, 1, 1, 1, 1, 1,
-0.3693007, -1.41416, -4.118424, 1, 1, 1, 1, 1,
-0.3677998, -0.9466799, -3.908349, 1, 1, 1, 1, 1,
-0.3674117, 1.009241, -0.752291, 1, 1, 1, 1, 1,
-0.3664719, 2.454401, -1.552314, 1, 1, 1, 1, 1,
-0.3640611, -0.1903743, -1.63894, 0, 0, 1, 1, 1,
-0.3599315, 1.232239, -1.688929, 1, 0, 0, 1, 1,
-0.3588866, 0.1676892, -2.01153, 1, 0, 0, 1, 1,
-0.3569697, -0.7075049, -4.022603, 1, 0, 0, 1, 1,
-0.3501261, -0.06480603, -0.5610974, 1, 0, 0, 1, 1,
-0.3500809, 0.04543954, -1.555817, 1, 0, 0, 1, 1,
-0.3494183, -1.281693, -3.919871, 0, 0, 0, 1, 1,
-0.3390137, -1.867347, -6.701697, 0, 0, 0, 1, 1,
-0.3319827, -0.4883747, -4.274734, 0, 0, 0, 1, 1,
-0.3316479, -0.02219942, -1.123498, 0, 0, 0, 1, 1,
-0.3288712, 0.1906636, -1.536363, 0, 0, 0, 1, 1,
-0.3203987, -0.3289534, -0.8878078, 0, 0, 0, 1, 1,
-0.3188104, 0.8483632, -0.7202396, 0, 0, 0, 1, 1,
-0.3147827, -0.2448356, -2.214556, 1, 1, 1, 1, 1,
-0.3102314, -0.2440052, -1.557186, 1, 1, 1, 1, 1,
-0.3064066, 0.3162653, -2.373318, 1, 1, 1, 1, 1,
-0.3058872, 0.9540647, 0.2163467, 1, 1, 1, 1, 1,
-0.2917817, 0.5790039, -1.126413, 1, 1, 1, 1, 1,
-0.2916358, 1.455969, -1.531018, 1, 1, 1, 1, 1,
-0.289667, -1.008615, -2.705558, 1, 1, 1, 1, 1,
-0.2883905, 0.4866289, 0.8764818, 1, 1, 1, 1, 1,
-0.2842002, 0.7214032, 0.07967545, 1, 1, 1, 1, 1,
-0.2830866, -0.5330812, -3.317515, 1, 1, 1, 1, 1,
-0.2817859, 1.028364, 1.978793, 1, 1, 1, 1, 1,
-0.2764509, -0.6667061, -3.454304, 1, 1, 1, 1, 1,
-0.2723708, 0.05721486, -2.034935, 1, 1, 1, 1, 1,
-0.2694183, -0.8130469, -0.6002949, 1, 1, 1, 1, 1,
-0.2632094, 0.4590067, -0.9254795, 1, 1, 1, 1, 1,
-0.2617078, -0.2771079, -2.44661, 0, 0, 1, 1, 1,
-0.2612703, 0.6122668, 0.07884046, 1, 0, 0, 1, 1,
-0.2573422, -0.4161153, -2.404969, 1, 0, 0, 1, 1,
-0.256864, 2.059682, 0.6617228, 1, 0, 0, 1, 1,
-0.2566908, -0.5903957, -2.362509, 1, 0, 0, 1, 1,
-0.2547477, 1.020894, 0.5088652, 1, 0, 0, 1, 1,
-0.2539405, -0.2606763, -2.217827, 0, 0, 0, 1, 1,
-0.253597, 1.272605, 0.9671829, 0, 0, 0, 1, 1,
-0.2495195, -0.6336048, -2.078588, 0, 0, 0, 1, 1,
-0.2492583, -1.059444, -3.023962, 0, 0, 0, 1, 1,
-0.246184, 0.9262736, -0.8091893, 0, 0, 0, 1, 1,
-0.2392066, 0.3257068, -1.50936, 0, 0, 0, 1, 1,
-0.237395, 1.19969, -1.264127, 0, 0, 0, 1, 1,
-0.2372083, 0.272352, -0.8493357, 1, 1, 1, 1, 1,
-0.2291514, 0.7525302, 0.2804857, 1, 1, 1, 1, 1,
-0.2279216, 0.2041267, -2.255611, 1, 1, 1, 1, 1,
-0.2201063, 0.7842215, -1.0698, 1, 1, 1, 1, 1,
-0.218014, -0.09924278, -3.448444, 1, 1, 1, 1, 1,
-0.2177083, 0.3891746, 2.012151, 1, 1, 1, 1, 1,
-0.214945, 0.07237228, -1.400178, 1, 1, 1, 1, 1,
-0.2143833, -1.809503, -4.140349, 1, 1, 1, 1, 1,
-0.2131986, 0.1978079, 0.1642628, 1, 1, 1, 1, 1,
-0.2121176, -0.5961693, -2.126333, 1, 1, 1, 1, 1,
-0.2087701, 2.283352, -3.186464, 1, 1, 1, 1, 1,
-0.2027377, 1.402257, -0.6127092, 1, 1, 1, 1, 1,
-0.2005687, 1.957589, 0.2836468, 1, 1, 1, 1, 1,
-0.2004927, -1.495319, -2.751508, 1, 1, 1, 1, 1,
-0.1954921, -0.2692401, -1.92329, 1, 1, 1, 1, 1,
-0.1934994, -1.04512, -1.426481, 0, 0, 1, 1, 1,
-0.1907016, -1.386817, -2.35523, 1, 0, 0, 1, 1,
-0.1871304, -0.9366749, -4.982457, 1, 0, 0, 1, 1,
-0.183984, 0.4081083, 0.335341, 1, 0, 0, 1, 1,
-0.1820145, -1.191971, -2.661576, 1, 0, 0, 1, 1,
-0.1798239, -0.3867334, -2.639633, 1, 0, 0, 1, 1,
-0.1798048, 0.6641146, 0.5658706, 0, 0, 0, 1, 1,
-0.177645, -0.3651742, -3.326352, 0, 0, 0, 1, 1,
-0.1769926, 0.8921149, -2.06424, 0, 0, 0, 1, 1,
-0.1740816, 0.2099566, 1.167385, 0, 0, 0, 1, 1,
-0.174055, 0.6229425, 0.4554787, 0, 0, 0, 1, 1,
-0.158473, 0.3944393, 0.02728037, 0, 0, 0, 1, 1,
-0.1534951, -1.641292, -2.184896, 0, 0, 0, 1, 1,
-0.1532358, -2.640228, -2.760432, 1, 1, 1, 1, 1,
-0.1487978, -0.1427471, -3.692363, 1, 1, 1, 1, 1,
-0.1482374, -0.4313222, -3.20002, 1, 1, 1, 1, 1,
-0.14696, 1.836914, -1.490228, 1, 1, 1, 1, 1,
-0.1420389, -1.5611, -4.163456, 1, 1, 1, 1, 1,
-0.1417442, 0.0935888, -1.59987, 1, 1, 1, 1, 1,
-0.1409936, -0.9003723, -3.551344, 1, 1, 1, 1, 1,
-0.1363106, -1.027851, -4.990406, 1, 1, 1, 1, 1,
-0.1358898, -0.803838, -2.510518, 1, 1, 1, 1, 1,
-0.1346363, 1.5294, -0.03214253, 1, 1, 1, 1, 1,
-0.1334907, 1.265615, -3.75733, 1, 1, 1, 1, 1,
-0.1303662, -0.03349619, -0.5755268, 1, 1, 1, 1, 1,
-0.1281636, 0.7451503, 1.540048, 1, 1, 1, 1, 1,
-0.1256086, -1.585873, -3.138635, 1, 1, 1, 1, 1,
-0.122273, 0.1500528, 1.980122, 1, 1, 1, 1, 1,
-0.1144855, -0.05188367, -2.193489, 0, 0, 1, 1, 1,
-0.114434, 0.1047462, -1.394638, 1, 0, 0, 1, 1,
-0.1137418, -0.4245043, -1.98436, 1, 0, 0, 1, 1,
-0.1127522, -0.8871684, -5.05182, 1, 0, 0, 1, 1,
-0.09243122, -0.04072984, -1.767704, 1, 0, 0, 1, 1,
-0.0906359, 0.2470701, -0.6937459, 1, 0, 0, 1, 1,
-0.08221078, -0.8833581, -2.719617, 0, 0, 0, 1, 1,
-0.08046403, 2.012396, -0.9701083, 0, 0, 0, 1, 1,
-0.07947428, -0.2540645, -2.103113, 0, 0, 0, 1, 1,
-0.07909367, -0.5335752, -1.85164, 0, 0, 0, 1, 1,
-0.07843918, -1.467871, -2.601699, 0, 0, 0, 1, 1,
-0.07740369, -0.5559213, -2.393521, 0, 0, 0, 1, 1,
-0.0764349, 0.4318783, -0.5927358, 0, 0, 0, 1, 1,
-0.07639055, 1.317138, -1.363937, 1, 1, 1, 1, 1,
-0.07317845, 0.05962221, -1.371672, 1, 1, 1, 1, 1,
-0.07108153, 0.4536379, -0.8077157, 1, 1, 1, 1, 1,
-0.07076728, -1.280455, -5.315149, 1, 1, 1, 1, 1,
-0.06879167, -1.160277, -2.367389, 1, 1, 1, 1, 1,
-0.06271923, 0.216936, -0.5334672, 1, 1, 1, 1, 1,
-0.05936787, 1.765017, -0.3179573, 1, 1, 1, 1, 1,
-0.05797708, -0.484388, -2.685993, 1, 1, 1, 1, 1,
-0.04740182, -0.6477237, -0.7032324, 1, 1, 1, 1, 1,
-0.04616218, -0.02880959, -1.389459, 1, 1, 1, 1, 1,
-0.04489829, -2.166335, -3.883329, 1, 1, 1, 1, 1,
-0.03795142, 0.2946253, -1.427259, 1, 1, 1, 1, 1,
-0.03751127, 0.2306903, -0.3809345, 1, 1, 1, 1, 1,
-0.03658829, 1.313281, 1.204641, 1, 1, 1, 1, 1,
-0.03408621, 0.9407223, 0.9478009, 1, 1, 1, 1, 1,
-0.03066815, -1.113324, -4.558727, 0, 0, 1, 1, 1,
-0.01827792, 0.09220204, -0.4494424, 1, 0, 0, 1, 1,
-0.01371114, 0.6109927, 0.1933658, 1, 0, 0, 1, 1,
-0.01018472, -0.3174391, -3.687973, 1, 0, 0, 1, 1,
-0.00293955, -0.7300014, -4.004569, 1, 0, 0, 1, 1,
-0.001879031, -1.523891, -2.257723, 1, 0, 0, 1, 1,
-0.001045166, -0.3320591, -3.001907, 0, 0, 0, 1, 1,
-0.000728593, -1.273934, -2.666399, 0, 0, 0, 1, 1,
-0.0006238824, -0.05559814, -2.145169, 0, 0, 0, 1, 1,
-0.0004390097, 0.5193959, -0.1990222, 0, 0, 0, 1, 1,
-0.0004334351, 0.002358031, 1.603459, 0, 0, 0, 1, 1,
0.0001459217, 0.9963104, 1.109247, 0, 0, 0, 1, 1,
0.003731891, -2.299833, 2.113158, 0, 0, 0, 1, 1,
0.007614969, 0.6520197, 0.3872578, 1, 1, 1, 1, 1,
0.009590324, 0.2918116, -0.7487429, 1, 1, 1, 1, 1,
0.01142871, 0.05640803, -0.2247367, 1, 1, 1, 1, 1,
0.01153366, 0.7677841, 1.570293, 1, 1, 1, 1, 1,
0.01177064, 0.5728284, -0.7459599, 1, 1, 1, 1, 1,
0.01256392, 0.07015102, 0.2650996, 1, 1, 1, 1, 1,
0.01325441, 0.2191162, 0.04559863, 1, 1, 1, 1, 1,
0.01325757, 0.8360423, 1.60622, 1, 1, 1, 1, 1,
0.01602067, -0.8272019, 3.642205, 1, 1, 1, 1, 1,
0.01918787, 1.122944, -0.9343317, 1, 1, 1, 1, 1,
0.0211542, 0.09376238, -0.7237376, 1, 1, 1, 1, 1,
0.02629456, 0.897249, -1.015178, 1, 1, 1, 1, 1,
0.02676575, 0.7920125, -1.24594, 1, 1, 1, 1, 1,
0.03428179, 0.8676435, -0.9507937, 1, 1, 1, 1, 1,
0.04132215, -0.8834412, 2.725329, 1, 1, 1, 1, 1,
0.04163147, -1.441406, 2.126154, 0, 0, 1, 1, 1,
0.04234324, -1.016976, 3.04177, 1, 0, 0, 1, 1,
0.04820556, 0.08790869, 1.430507, 1, 0, 0, 1, 1,
0.04931147, -0.5488556, 4.695203, 1, 0, 0, 1, 1,
0.05063426, -0.9420069, 3.296838, 1, 0, 0, 1, 1,
0.05166739, -1.90498, 4.198899, 1, 0, 0, 1, 1,
0.06060382, 0.6042327, -0.9444886, 0, 0, 0, 1, 1,
0.0606195, -2.348314, 2.867898, 0, 0, 0, 1, 1,
0.06421097, 1.157192, 0.5304155, 0, 0, 0, 1, 1,
0.06477349, -0.1756773, 3.61599, 0, 0, 0, 1, 1,
0.06649542, 1.071763, 0.6630799, 0, 0, 0, 1, 1,
0.06730483, 0.03243617, 1.923591, 0, 0, 0, 1, 1,
0.06744581, -0.034993, 2.054857, 0, 0, 0, 1, 1,
0.0719403, -0.2135493, 2.485007, 1, 1, 1, 1, 1,
0.0724423, -0.5775114, 4.34481, 1, 1, 1, 1, 1,
0.0784434, 0.1529634, 2.061747, 1, 1, 1, 1, 1,
0.08028214, -2.348914, 2.17938, 1, 1, 1, 1, 1,
0.09386873, 0.532225, 0.3424847, 1, 1, 1, 1, 1,
0.09557816, -1.043477, 2.549592, 1, 1, 1, 1, 1,
0.09645085, 0.3553981, 0.844974, 1, 1, 1, 1, 1,
0.1005282, -0.9422533, 3.809626, 1, 1, 1, 1, 1,
0.1008913, -1.283899, 4.809742, 1, 1, 1, 1, 1,
0.1017686, -0.6089216, 3.261453, 1, 1, 1, 1, 1,
0.1032317, 1.396739, 0.7128896, 1, 1, 1, 1, 1,
0.1072525, -0.6808137, 2.395907, 1, 1, 1, 1, 1,
0.1080556, -0.2639826, 3.48754, 1, 1, 1, 1, 1,
0.1117416, -0.7695791, 3.043161, 1, 1, 1, 1, 1,
0.1200087, -0.1640676, 4.065606, 1, 1, 1, 1, 1,
0.1228132, -0.4208085, 3.852574, 0, 0, 1, 1, 1,
0.1262857, 0.7682147, -0.3100818, 1, 0, 0, 1, 1,
0.1282122, 2.902728, 0.4646747, 1, 0, 0, 1, 1,
0.1301271, 0.6696528, 0.707014, 1, 0, 0, 1, 1,
0.1344258, 0.1836193, 0.8868065, 1, 0, 0, 1, 1,
0.1348606, -0.9576948, 3.039103, 1, 0, 0, 1, 1,
0.1360267, -0.404532, 3.755095, 0, 0, 0, 1, 1,
0.1378025, -1.018462, 2.309143, 0, 0, 0, 1, 1,
0.1406889, -0.2740774, 2.400205, 0, 0, 0, 1, 1,
0.1446424, -0.7439662, 4.086487, 0, 0, 0, 1, 1,
0.1475133, 0.765987, 0.9835526, 0, 0, 0, 1, 1,
0.1503591, -0.9854054, 4.078654, 0, 0, 0, 1, 1,
0.1509821, 1.687214, 0.6513113, 0, 0, 0, 1, 1,
0.1514466, -0.1780526, 1.609473, 1, 1, 1, 1, 1,
0.1542967, 0.9570011, 1.381939, 1, 1, 1, 1, 1,
0.1544151, -0.5119392, 2.055636, 1, 1, 1, 1, 1,
0.1555321, -0.8133088, 2.559016, 1, 1, 1, 1, 1,
0.1563793, 1.655207, -0.9829164, 1, 1, 1, 1, 1,
0.1577751, 0.1267706, 1.744861, 1, 1, 1, 1, 1,
0.1591471, 0.6163862, 0.311804, 1, 1, 1, 1, 1,
0.161248, -0.6803409, 2.852012, 1, 1, 1, 1, 1,
0.1634898, 1.004737, -0.4091644, 1, 1, 1, 1, 1,
0.1644565, -1.216597, 1.470106, 1, 1, 1, 1, 1,
0.1666242, -0.9160939, 1.966794, 1, 1, 1, 1, 1,
0.1752793, -2.640569, 1.273708, 1, 1, 1, 1, 1,
0.1754306, 0.5563886, 0.4510072, 1, 1, 1, 1, 1,
0.1834834, 0.3338515, 0.5523093, 1, 1, 1, 1, 1,
0.1877765, 1.869057, 0.8571189, 1, 1, 1, 1, 1,
0.189718, -1.869943, 3.244625, 0, 0, 1, 1, 1,
0.1977295, -0.452244, 2.356246, 1, 0, 0, 1, 1,
0.2077173, -0.9927326, 4.055198, 1, 0, 0, 1, 1,
0.2105718, 0.105853, 2.017806, 1, 0, 0, 1, 1,
0.2175308, 0.8314492, -0.6454383, 1, 0, 0, 1, 1,
0.2179037, 0.0600806, 1.551615, 1, 0, 0, 1, 1,
0.2194325, 1.429038, -0.4678361, 0, 0, 0, 1, 1,
0.2194872, -0.5464789, 2.886357, 0, 0, 0, 1, 1,
0.2202368, -0.260112, 0.6399543, 0, 0, 0, 1, 1,
0.2210467, -0.1272189, 0.4255739, 0, 0, 0, 1, 1,
0.222214, 0.8073422, 1.498455, 0, 0, 0, 1, 1,
0.2224995, -0.5790552, 3.045789, 0, 0, 0, 1, 1,
0.2254149, 0.5392281, 1.302504, 0, 0, 0, 1, 1,
0.2255495, 0.04973814, 1.063134, 1, 1, 1, 1, 1,
0.2258195, -1.11426, 3.28818, 1, 1, 1, 1, 1,
0.2274722, 0.09861767, -1.028374, 1, 1, 1, 1, 1,
0.2313594, 0.9703588, -0.4876623, 1, 1, 1, 1, 1,
0.2398498, 0.4726487, -0.07412694, 1, 1, 1, 1, 1,
0.2442012, 0.7761599, 0.9981557, 1, 1, 1, 1, 1,
0.2483508, 0.5000387, 0.0599514, 1, 1, 1, 1, 1,
0.2519411, -0.03719915, 0.931953, 1, 1, 1, 1, 1,
0.2579667, 0.4905377, -0.3621541, 1, 1, 1, 1, 1,
0.2589372, -0.1467956, 1.109627, 1, 1, 1, 1, 1,
0.2603074, -0.4778413, 1.586546, 1, 1, 1, 1, 1,
0.2603317, 1.224974, -0.996278, 1, 1, 1, 1, 1,
0.2605329, -0.2765349, 3.711751, 1, 1, 1, 1, 1,
0.2640787, -0.9723098, 3.460412, 1, 1, 1, 1, 1,
0.2664136, 0.475374, -1.940222, 1, 1, 1, 1, 1,
0.2703927, 1.438999, -0.9228129, 0, 0, 1, 1, 1,
0.273162, -1.806436, 2.564822, 1, 0, 0, 1, 1,
0.2731622, -0.109712, 1.972307, 1, 0, 0, 1, 1,
0.2775702, 0.9791907, 1.386961, 1, 0, 0, 1, 1,
0.2780921, 0.2045372, 1.538564, 1, 0, 0, 1, 1,
0.2814461, 0.4525892, -0.3454514, 1, 0, 0, 1, 1,
0.2832699, 0.3037484, 2.093566, 0, 0, 0, 1, 1,
0.2833566, 0.1870532, 1.222277, 0, 0, 0, 1, 1,
0.2843784, -0.1591589, 1.508204, 0, 0, 0, 1, 1,
0.288751, 0.1609936, 1.326321, 0, 0, 0, 1, 1,
0.2898878, -0.7462418, 3.153533, 0, 0, 0, 1, 1,
0.2928832, -0.371235, 2.49227, 0, 0, 0, 1, 1,
0.2935368, 0.05165615, 1.486588, 0, 0, 0, 1, 1,
0.3000159, -0.3919392, 2.021283, 1, 1, 1, 1, 1,
0.3023145, 0.6172072, 1.162519, 1, 1, 1, 1, 1,
0.3065333, -0.3297951, 1.5025, 1, 1, 1, 1, 1,
0.3087398, -0.3160881, 0.1458601, 1, 1, 1, 1, 1,
0.3090806, 0.8144221, -0.8518403, 1, 1, 1, 1, 1,
0.3110065, -0.7937799, 2.799154, 1, 1, 1, 1, 1,
0.3119042, 0.2525514, 2.268209, 1, 1, 1, 1, 1,
0.3169456, -1.600866, 2.986561, 1, 1, 1, 1, 1,
0.3201182, 0.2760713, -1.698445, 1, 1, 1, 1, 1,
0.3203966, 0.2673948, 0.8192225, 1, 1, 1, 1, 1,
0.3266948, -0.8370587, 4.252676, 1, 1, 1, 1, 1,
0.3269734, -0.6290744, 2.609927, 1, 1, 1, 1, 1,
0.3284512, 0.04425161, 1.894649, 1, 1, 1, 1, 1,
0.3364061, -0.7072579, 0.6654915, 1, 1, 1, 1, 1,
0.3423565, 0.8678381, 1.229721, 1, 1, 1, 1, 1,
0.3427494, 0.6645918, 1.945814, 0, 0, 1, 1, 1,
0.3444289, -0.9510483, 2.100414, 1, 0, 0, 1, 1,
0.3447493, 0.1914905, 0.9680045, 1, 0, 0, 1, 1,
0.3545069, 1.676217, 0.4251794, 1, 0, 0, 1, 1,
0.3554949, -0.1497746, 3.233672, 1, 0, 0, 1, 1,
0.3592338, 0.7369426, 1.520866, 1, 0, 0, 1, 1,
0.3618681, 0.1301175, 1.506158, 0, 0, 0, 1, 1,
0.3624903, 0.6821274, 1.458477, 0, 0, 0, 1, 1,
0.3631187, -0.4851352, 2.612115, 0, 0, 0, 1, 1,
0.3646894, 0.165257, 0.9101745, 0, 0, 0, 1, 1,
0.3713949, -1.27816, 2.177057, 0, 0, 0, 1, 1,
0.3741775, -1.171549, 2.562529, 0, 0, 0, 1, 1,
0.3763165, 0.2108887, 1.570498, 0, 0, 0, 1, 1,
0.3769794, -0.1770235, 2.862199, 1, 1, 1, 1, 1,
0.3826104, 0.9102145, 0.4675516, 1, 1, 1, 1, 1,
0.3855398, 0.5256276, 1.820029, 1, 1, 1, 1, 1,
0.3880025, -1.702951, 3.432508, 1, 1, 1, 1, 1,
0.3902503, -0.4134872, 3.704564, 1, 1, 1, 1, 1,
0.3914359, -0.4831261, 2.652015, 1, 1, 1, 1, 1,
0.3947753, 1.187054, 0.6559516, 1, 1, 1, 1, 1,
0.3958057, 1.304172, 0.38918, 1, 1, 1, 1, 1,
0.3971557, 0.2166455, 1.504527, 1, 1, 1, 1, 1,
0.4086086, -1.235319, 4.535873, 1, 1, 1, 1, 1,
0.4129499, 0.6102443, -0.1443099, 1, 1, 1, 1, 1,
0.4189411, -0.1157881, 1.823972, 1, 1, 1, 1, 1,
0.4233049, -2.171989, 2.667579, 1, 1, 1, 1, 1,
0.4308218, -0.8979384, 4.247795, 1, 1, 1, 1, 1,
0.4314628, 0.3090424, 0.7172657, 1, 1, 1, 1, 1,
0.4344173, 0.560581, 0.3327672, 0, 0, 1, 1, 1,
0.4365027, 1.309709, 1.039603, 1, 0, 0, 1, 1,
0.437494, -0.3096396, 2.386406, 1, 0, 0, 1, 1,
0.439039, -0.828043, 1.467095, 1, 0, 0, 1, 1,
0.4415938, -0.3899106, 2.843448, 1, 0, 0, 1, 1,
0.4429347, -0.3162875, 2.387657, 1, 0, 0, 1, 1,
0.4476858, -0.5798233, 2.183982, 0, 0, 0, 1, 1,
0.4479916, 1.229544, 3.193295, 0, 0, 0, 1, 1,
0.4501865, 0.3086557, 0.6510254, 0, 0, 0, 1, 1,
0.4509153, 0.09928925, 2.097355, 0, 0, 0, 1, 1,
0.450996, -0.8291751, 2.936424, 0, 0, 0, 1, 1,
0.451757, 0.7274463, -0.1194538, 0, 0, 0, 1, 1,
0.4536057, -0.5345779, 2.167753, 0, 0, 0, 1, 1,
0.4552415, -0.6077593, 3.364217, 1, 1, 1, 1, 1,
0.4564076, 0.2132988, 2.460615, 1, 1, 1, 1, 1,
0.4574312, 0.3123185, -0.3723022, 1, 1, 1, 1, 1,
0.4600523, 1.328832, 1.002055, 1, 1, 1, 1, 1,
0.4613133, 0.3208782, 0.4527238, 1, 1, 1, 1, 1,
0.4736935, 0.441649, 1.163654, 1, 1, 1, 1, 1,
0.4739208, 0.2286327, 2.250849, 1, 1, 1, 1, 1,
0.4787802, 2.132369, 0.5485749, 1, 1, 1, 1, 1,
0.479146, 1.492384, 1.203686, 1, 1, 1, 1, 1,
0.4799302, 1.082753, -1.208684, 1, 1, 1, 1, 1,
0.4817956, -0.0524378, 0.8275833, 1, 1, 1, 1, 1,
0.4894138, 0.3910038, 0.4490153, 1, 1, 1, 1, 1,
0.4894766, -0.3356503, 2.261908, 1, 1, 1, 1, 1,
0.4958814, 0.5432195, 0.8518767, 1, 1, 1, 1, 1,
0.4978735, -0.4532313, 1.68968, 1, 1, 1, 1, 1,
0.503785, -0.3319777, 1.304773, 0, 0, 1, 1, 1,
0.5052762, -0.492, 3.040788, 1, 0, 0, 1, 1,
0.5143612, -1.229542, 3.302269, 1, 0, 0, 1, 1,
0.5202547, 0.817798, -0.2253672, 1, 0, 0, 1, 1,
0.538935, -0.8010563, 2.469931, 1, 0, 0, 1, 1,
0.5392022, 0.6537455, 1.109342, 1, 0, 0, 1, 1,
0.5413734, 0.277178, 1.413475, 0, 0, 0, 1, 1,
0.5417135, 0.3036701, 2.375093, 0, 0, 0, 1, 1,
0.5425937, 0.0834254, 1.055622, 0, 0, 0, 1, 1,
0.544108, -0.7782204, 2.761221, 0, 0, 0, 1, 1,
0.5457807, -0.1649781, 1.424336, 0, 0, 0, 1, 1,
0.5460781, -0.8878781, 2.809017, 0, 0, 0, 1, 1,
0.5489456, 0.3168269, 0.360094, 0, 0, 0, 1, 1,
0.5518829, 0.0005513424, 2.614113, 1, 1, 1, 1, 1,
0.5554686, -0.462195, 0.609389, 1, 1, 1, 1, 1,
0.5562911, 0.8947874, 1.411881, 1, 1, 1, 1, 1,
0.5586693, -1.472297, 2.969275, 1, 1, 1, 1, 1,
0.5618275, 0.1064254, -0.5181451, 1, 1, 1, 1, 1,
0.5673141, -1.015459, 2.99992, 1, 1, 1, 1, 1,
0.569669, -0.1964875, 2.10009, 1, 1, 1, 1, 1,
0.5729955, 0.892399, 3.093333, 1, 1, 1, 1, 1,
0.5773398, 0.5299487, 1.049799, 1, 1, 1, 1, 1,
0.5789371, -0.4312007, 2.487204, 1, 1, 1, 1, 1,
0.5805246, 0.5207265, -0.03984721, 1, 1, 1, 1, 1,
0.5809246, -0.6105419, 2.669695, 1, 1, 1, 1, 1,
0.5829665, 1.808069, 0.5101083, 1, 1, 1, 1, 1,
0.5839677, -0.5347929, 3.1705, 1, 1, 1, 1, 1,
0.5849849, -0.2802915, 1.827465, 1, 1, 1, 1, 1,
0.5887262, -0.9177336, 2.382338, 0, 0, 1, 1, 1,
0.5896019, 0.4425809, 1.501815, 1, 0, 0, 1, 1,
0.5908527, 0.2868809, 1.894106, 1, 0, 0, 1, 1,
0.5908802, -0.5805756, 0.4951894, 1, 0, 0, 1, 1,
0.5920588, 0.4662656, 3.19042, 1, 0, 0, 1, 1,
0.592225, -0.4024155, 1.108223, 1, 0, 0, 1, 1,
0.5926231, 0.730082, 0.3304279, 0, 0, 0, 1, 1,
0.5985479, 1.024508, 0.1380675, 0, 0, 0, 1, 1,
0.599218, -2.124928, 1.322556, 0, 0, 0, 1, 1,
0.600201, -0.3018417, 1.279195, 0, 0, 0, 1, 1,
0.6068456, -0.4804241, 1.295184, 0, 0, 0, 1, 1,
0.6084614, 0.8557885, 1.362461, 0, 0, 0, 1, 1,
0.6161638, -0.557464, 1.917125, 0, 0, 0, 1, 1,
0.6203931, 0.4669282, 0.178531, 1, 1, 1, 1, 1,
0.6302812, 0.4551203, 0.3578592, 1, 1, 1, 1, 1,
0.6319977, -0.2126521, 2.662086, 1, 1, 1, 1, 1,
0.6374002, -0.1711909, 1.577428, 1, 1, 1, 1, 1,
0.642424, -0.01727694, 1.66627, 1, 1, 1, 1, 1,
0.6432055, 0.8957117, 0.6827571, 1, 1, 1, 1, 1,
0.6467002, -0.7355354, 2.887373, 1, 1, 1, 1, 1,
0.6485223, 1.103702, 2.32957, 1, 1, 1, 1, 1,
0.6495907, -0.9176902, 2.712044, 1, 1, 1, 1, 1,
0.6520467, 0.09458377, 2.396981, 1, 1, 1, 1, 1,
0.6520587, -0.05575388, 1.055801, 1, 1, 1, 1, 1,
0.6530673, 1.215086, 0.8157558, 1, 1, 1, 1, 1,
0.6583983, 0.7108734, 1.060092, 1, 1, 1, 1, 1,
0.6748212, 0.1028463, 2.598452, 1, 1, 1, 1, 1,
0.6750996, 0.6697145, -0.9701461, 1, 1, 1, 1, 1,
0.6769655, 0.9906068, 0.7416087, 0, 0, 1, 1, 1,
0.6819741, -1.201411, 4.055108, 1, 0, 0, 1, 1,
0.6904538, -0.4617803, 4.111117, 1, 0, 0, 1, 1,
0.6919227, -1.652972, 2.107229, 1, 0, 0, 1, 1,
0.6946494, 1.479824, 0.2210052, 1, 0, 0, 1, 1,
0.6949312, -0.5437436, 2.151793, 1, 0, 0, 1, 1,
0.6956496, 0.157226, 0.3692272, 0, 0, 0, 1, 1,
0.696883, -1.629092, 4.023471, 0, 0, 0, 1, 1,
0.6991638, 0.1432964, 1.308126, 0, 0, 0, 1, 1,
0.7005019, -0.3950002, -0.5031243, 0, 0, 0, 1, 1,
0.7064696, -0.8527795, 1.274159, 0, 0, 0, 1, 1,
0.7109428, 1.254158, 2.470484, 0, 0, 0, 1, 1,
0.7112849, -1.169952, 1.702658, 0, 0, 0, 1, 1,
0.7122735, 0.2107669, 0.3384229, 1, 1, 1, 1, 1,
0.71311, 0.8872945, 2.061188, 1, 1, 1, 1, 1,
0.7135973, -0.4445466, 1.467548, 1, 1, 1, 1, 1,
0.7138435, -0.4894751, 2.509477, 1, 1, 1, 1, 1,
0.7158618, 0.1537197, 1.596313, 1, 1, 1, 1, 1,
0.7159631, 0.7291786, 1.426677, 1, 1, 1, 1, 1,
0.7203708, 0.5701373, 0.6439724, 1, 1, 1, 1, 1,
0.7249704, 0.6476542, 0.6032681, 1, 1, 1, 1, 1,
0.7268664, 1.210362, 0.8607259, 1, 1, 1, 1, 1,
0.7273877, 0.09527028, -0.1518413, 1, 1, 1, 1, 1,
0.729679, 1.501117, 1.681192, 1, 1, 1, 1, 1,
0.7298399, -1.145635, 3.002735, 1, 1, 1, 1, 1,
0.7334417, -0.2013111, 0.5581371, 1, 1, 1, 1, 1,
0.7341873, 1.095739, 2.97395, 1, 1, 1, 1, 1,
0.7405707, 0.1634447, 0.1877905, 1, 1, 1, 1, 1,
0.7411107, 0.7379128, 1.448935, 0, 0, 1, 1, 1,
0.7427607, 0.7811493, -0.1082827, 1, 0, 0, 1, 1,
0.7455755, 2.071463, 1.22345, 1, 0, 0, 1, 1,
0.7469645, 0.1181564, 1.51238, 1, 0, 0, 1, 1,
0.7470806, -0.05744379, -0.2554455, 1, 0, 0, 1, 1,
0.7482815, 2.357828, 0.09942174, 1, 0, 0, 1, 1,
0.7506409, -1.298193, 2.880203, 0, 0, 0, 1, 1,
0.7513476, -0.8572164, 3.3758, 0, 0, 0, 1, 1,
0.756285, -0.1475797, 4.411921, 0, 0, 0, 1, 1,
0.7589196, 1.242292, -0.7921902, 0, 0, 0, 1, 1,
0.7605324, 1.2222, 1.390059, 0, 0, 0, 1, 1,
0.7656174, -0.8304583, 3.662608, 0, 0, 0, 1, 1,
0.7678515, 0.3431686, 1.419235, 0, 0, 0, 1, 1,
0.7704753, -1.083031, 2.157842, 1, 1, 1, 1, 1,
0.7741559, -0.05832273, 2.159393, 1, 1, 1, 1, 1,
0.7770934, 0.1737702, 0.4373251, 1, 1, 1, 1, 1,
0.7784855, -1.466246, 3.378201, 1, 1, 1, 1, 1,
0.7791039, 1.168428, 0.07454836, 1, 1, 1, 1, 1,
0.7849419, 1.085035, 0.8826849, 1, 1, 1, 1, 1,
0.786727, 1.358585, 1.206753, 1, 1, 1, 1, 1,
0.7909572, 1.168538, 0.9679445, 1, 1, 1, 1, 1,
0.7912883, -0.5082722, 1.686113, 1, 1, 1, 1, 1,
0.7930562, -1.132403, 2.543525, 1, 1, 1, 1, 1,
0.7960737, 1.910269, 0.8166863, 1, 1, 1, 1, 1,
0.7974737, -1.085186, 3.149895, 1, 1, 1, 1, 1,
0.7977833, 0.4948364, 2.865744, 1, 1, 1, 1, 1,
0.8092184, -0.6393797, 1.906467, 1, 1, 1, 1, 1,
0.8188109, -1.009674, 3.846478, 1, 1, 1, 1, 1,
0.821636, 0.5061786, 1.414171, 0, 0, 1, 1, 1,
0.8361012, 0.002371822, 0.9044984, 1, 0, 0, 1, 1,
0.8374454, -0.9433585, 2.60724, 1, 0, 0, 1, 1,
0.8412354, -0.5306445, 2.635632, 1, 0, 0, 1, 1,
0.8454438, 1.421749, 0.1666596, 1, 0, 0, 1, 1,
0.8457886, -0.5778931, 3.126036, 1, 0, 0, 1, 1,
0.8462719, 0.5586641, -0.3533294, 0, 0, 0, 1, 1,
0.8479119, 1.986053, 0.2839085, 0, 0, 0, 1, 1,
0.8516107, -0.0255022, 0.8930153, 0, 0, 0, 1, 1,
0.8533561, 0.8386203, -0.4217184, 0, 0, 0, 1, 1,
0.8537049, -0.1671892, 0.3996339, 0, 0, 0, 1, 1,
0.855742, -1.335101, 3.769452, 0, 0, 0, 1, 1,
0.8570641, -1.146546, -0.017575, 0, 0, 0, 1, 1,
0.8585911, -0.001200185, 0.8506952, 1, 1, 1, 1, 1,
0.861407, -1.293918, 3.902015, 1, 1, 1, 1, 1,
0.8618299, -1.866189, 2.724098, 1, 1, 1, 1, 1,
0.8625853, 1.482521, 1.396155, 1, 1, 1, 1, 1,
0.8657449, -0.598987, 3.409546, 1, 1, 1, 1, 1,
0.8660254, -0.7659693, 1.134085, 1, 1, 1, 1, 1,
0.8666806, 0.1001821, 2.842673, 1, 1, 1, 1, 1,
0.8672908, 0.1117779, 0.1214899, 1, 1, 1, 1, 1,
0.8728327, -0.4443073, 0.5272952, 1, 1, 1, 1, 1,
0.8769471, -0.05799266, 2.527415, 1, 1, 1, 1, 1,
0.8798233, -0.9860041, 3.823477, 1, 1, 1, 1, 1,
0.8924236, 0.8475752, 0.9595746, 1, 1, 1, 1, 1,
0.8991466, -0.2601855, 2.348547, 1, 1, 1, 1, 1,
0.8992003, -0.7766977, 1.780702, 1, 1, 1, 1, 1,
0.8996706, -0.03834751, 1.145566, 1, 1, 1, 1, 1,
0.8998532, -0.1550384, 2.07929, 0, 0, 1, 1, 1,
0.9001252, 0.5616513, 1.229833, 1, 0, 0, 1, 1,
0.9078229, 0.4031467, 1.964548, 1, 0, 0, 1, 1,
0.9112722, -1.409652, 1.824131, 1, 0, 0, 1, 1,
0.9118168, 0.3072275, 1.236574, 1, 0, 0, 1, 1,
0.9131247, -2.261974, 2.54772, 1, 0, 0, 1, 1,
0.9145685, 0.7822657, 2.117317, 0, 0, 0, 1, 1,
0.9210693, 0.0856755, 2.408726, 0, 0, 0, 1, 1,
0.9234022, -0.04586764, 1.822451, 0, 0, 0, 1, 1,
0.9267947, -1.211032, 1.706815, 0, 0, 0, 1, 1,
0.9279269, 0.3446622, 0.5988904, 0, 0, 0, 1, 1,
0.9315978, -0.4025211, 1.330069, 0, 0, 0, 1, 1,
0.9338517, 2.135083, -0.4425107, 0, 0, 0, 1, 1,
0.9372941, -0.0738342, 2.144828, 1, 1, 1, 1, 1,
0.9405426, 0.6686322, 0.3596863, 1, 1, 1, 1, 1,
0.9450371, 0.7715536, 1.947985, 1, 1, 1, 1, 1,
0.9580056, -1.780331, 2.21943, 1, 1, 1, 1, 1,
0.9589459, -1.282191, 3.563374, 1, 1, 1, 1, 1,
0.9594476, 0.001836058, 2.533243, 1, 1, 1, 1, 1,
0.9629095, -0.1925117, 2.413198, 1, 1, 1, 1, 1,
0.9641061, -0.3464631, 0.868844, 1, 1, 1, 1, 1,
0.9674602, 0.1928137, 2.44424, 1, 1, 1, 1, 1,
0.9710584, -0.114188, 2.191827, 1, 1, 1, 1, 1,
0.972953, 0.1820227, 1.576131, 1, 1, 1, 1, 1,
0.97728, -0.6728125, 1.68796, 1, 1, 1, 1, 1,
0.9832414, 0.4564722, 1.804185, 1, 1, 1, 1, 1,
0.988825, 0.1324729, 1.088359, 1, 1, 1, 1, 1,
0.9902477, 0.7980982, -0.3371088, 1, 1, 1, 1, 1,
0.9903554, 1.307914, 1.780378, 0, 0, 1, 1, 1,
0.991475, 0.7615428, 0.9426953, 1, 0, 0, 1, 1,
0.9930351, -0.3601517, 0.7629254, 1, 0, 0, 1, 1,
0.9943414, 0.2763667, 2.817835, 1, 0, 0, 1, 1,
1.002607, 0.5591835, 1.16989, 1, 0, 0, 1, 1,
1.003729, -0.6582879, 0.961249, 1, 0, 0, 1, 1,
1.00759, 1.41272, 0.1651658, 0, 0, 0, 1, 1,
1.008478, 0.2185194, 0.6078519, 0, 0, 0, 1, 1,
1.009366, 0.0343046, 1.196052, 0, 0, 0, 1, 1,
1.016558, 2.17479, 2.636091, 0, 0, 0, 1, 1,
1.017624, 0.4837932, 0.8594776, 0, 0, 0, 1, 1,
1.032395, 0.2779797, 2.316615, 0, 0, 0, 1, 1,
1.03395, 0.7317508, 0.5308174, 0, 0, 0, 1, 1,
1.038882, 0.3836651, 3.05724, 1, 1, 1, 1, 1,
1.044394, -0.3424604, -0.4874052, 1, 1, 1, 1, 1,
1.047528, -0.1577853, 1.807157, 1, 1, 1, 1, 1,
1.048681, -0.7468038, 2.882584, 1, 1, 1, 1, 1,
1.054995, 0.1826008, 2.54904, 1, 1, 1, 1, 1,
1.055297, 0.4797892, -0.1273859, 1, 1, 1, 1, 1,
1.061952, -0.2680504, 1.769635, 1, 1, 1, 1, 1,
1.064506, 0.3350551, 0.9037714, 1, 1, 1, 1, 1,
1.064946, -0.2720888, 1.727912, 1, 1, 1, 1, 1,
1.065417, -0.8224339, 1.286693, 1, 1, 1, 1, 1,
1.065924, -1.700825, 1.681332, 1, 1, 1, 1, 1,
1.06773, -1.653937, 1.488811, 1, 1, 1, 1, 1,
1.068128, 0.6485779, 2.064657, 1, 1, 1, 1, 1,
1.072835, -0.4514894, 3.045838, 1, 1, 1, 1, 1,
1.074156, 0.3552383, 2.899642, 1, 1, 1, 1, 1,
1.076844, -0.1315107, 2.181023, 0, 0, 1, 1, 1,
1.085819, 0.1785982, 1.227286, 1, 0, 0, 1, 1,
1.089852, -0.8954336, 3.014597, 1, 0, 0, 1, 1,
1.092355, 0.4541273, 0.1044473, 1, 0, 0, 1, 1,
1.100501, 1.539314, 0.8477593, 1, 0, 0, 1, 1,
1.104095, 1.16609, 0.4427405, 1, 0, 0, 1, 1,
1.104686, -0.05777122, 1.934925, 0, 0, 0, 1, 1,
1.112581, 0.698274, 1.465465, 0, 0, 0, 1, 1,
1.11321, 0.1953221, 0.6919119, 0, 0, 0, 1, 1,
1.115124, -0.8743458, 2.785725, 0, 0, 0, 1, 1,
1.117355, 0.7744455, 0.4799905, 0, 0, 0, 1, 1,
1.120793, 1.262109, 0.1913884, 0, 0, 0, 1, 1,
1.121415, 0.416577, 1.243103, 0, 0, 0, 1, 1,
1.126178, -0.4010974, 1.058297, 1, 1, 1, 1, 1,
1.129597, 0.9582841, 0.9878239, 1, 1, 1, 1, 1,
1.129829, 1.345282, 0.8906097, 1, 1, 1, 1, 1,
1.136438, -1.351541, 4.572228, 1, 1, 1, 1, 1,
1.138885, 1.817583, 1.069261, 1, 1, 1, 1, 1,
1.144168, -0.2528697, 1.854675, 1, 1, 1, 1, 1,
1.164095, -0.8124014, 2.16028, 1, 1, 1, 1, 1,
1.166426, -1.64319, 1.85035, 1, 1, 1, 1, 1,
1.179983, -0.9902151, 2.132256, 1, 1, 1, 1, 1,
1.182981, 0.4802083, 1.519521, 1, 1, 1, 1, 1,
1.183128, -0.6894039, 2.718271, 1, 1, 1, 1, 1,
1.20678, 0.6673052, 0.3170252, 1, 1, 1, 1, 1,
1.208862, -0.580885, 3.449876, 1, 1, 1, 1, 1,
1.210686, 0.7379563, 0.8840752, 1, 1, 1, 1, 1,
1.220419, -0.5823373, 1.233813, 1, 1, 1, 1, 1,
1.224774, 0.283279, 2.479291, 0, 0, 1, 1, 1,
1.225015, -2.857189, 3.277501, 1, 0, 0, 1, 1,
1.231291, -0.7974159, 2.674521, 1, 0, 0, 1, 1,
1.235276, 0.05445426, 0.5583186, 1, 0, 0, 1, 1,
1.243107, -1.916301, 3.225728, 1, 0, 0, 1, 1,
1.244117, -0.278236, 1.678803, 1, 0, 0, 1, 1,
1.247819, 1.326931, 0.2392371, 0, 0, 0, 1, 1,
1.248063, -0.1578951, 2.391756, 0, 0, 0, 1, 1,
1.255418, -1.197461, 2.837746, 0, 0, 0, 1, 1,
1.262865, -0.4133135, 4.16751, 0, 0, 0, 1, 1,
1.268504, -0.04065792, 1.210525, 0, 0, 0, 1, 1,
1.285876, 1.103427, 1.225922, 0, 0, 0, 1, 1,
1.296359, -1.067846, 1.934212, 0, 0, 0, 1, 1,
1.300599, 0.2550793, 1.248378, 1, 1, 1, 1, 1,
1.304399, -0.08069099, 1.416825, 1, 1, 1, 1, 1,
1.307965, 2.242392, 0.7884366, 1, 1, 1, 1, 1,
1.322502, -0.2502632, 2.696582, 1, 1, 1, 1, 1,
1.336965, 1.411068, 0.944078, 1, 1, 1, 1, 1,
1.341164, 0.6317019, 0.356584, 1, 1, 1, 1, 1,
1.343697, 0.5597141, 0.4236001, 1, 1, 1, 1, 1,
1.357231, -0.1916232, 2.728431, 1, 1, 1, 1, 1,
1.364035, -0.004280255, 1.105766, 1, 1, 1, 1, 1,
1.368457, 1.677069, 1.901369, 1, 1, 1, 1, 1,
1.381257, 0.44844, 1.904968, 1, 1, 1, 1, 1,
1.389792, 1.10956, -0.6552116, 1, 1, 1, 1, 1,
1.391771, 0.2096236, 0.9618122, 1, 1, 1, 1, 1,
1.409384, 0.5836235, 3.626105, 1, 1, 1, 1, 1,
1.409549, -1.351698, 1.125626, 1, 1, 1, 1, 1,
1.413824, -1.397464, 2.713835, 0, 0, 1, 1, 1,
1.418551, 0.7905766, 2.374248, 1, 0, 0, 1, 1,
1.421207, -1.573119, 2.982777, 1, 0, 0, 1, 1,
1.425732, -1.12931, 0.3431884, 1, 0, 0, 1, 1,
1.428296, 0.6175188, 0.8494805, 1, 0, 0, 1, 1,
1.428938, -0.6590601, 0.4436815, 1, 0, 0, 1, 1,
1.442747, -0.1944206, 1.847662, 0, 0, 0, 1, 1,
1.444515, 1.455347, 1.066191, 0, 0, 0, 1, 1,
1.447791, -1.667124, 1.223376, 0, 0, 0, 1, 1,
1.453708, 0.7845384, 0.09178739, 0, 0, 0, 1, 1,
1.457098, -1.395125, 1.909176, 0, 0, 0, 1, 1,
1.460182, -0.978693, 1.639458, 0, 0, 0, 1, 1,
1.466427, 0.1428242, 0.8266406, 0, 0, 0, 1, 1,
1.483422, -0.04568189, 2.388328, 1, 1, 1, 1, 1,
1.499772, 0.7322788, 0.9469725, 1, 1, 1, 1, 1,
1.530631, -1.091318, 2.184851, 1, 1, 1, 1, 1,
1.534549, 1.28096, 2.188007, 1, 1, 1, 1, 1,
1.53497, 1.35497, 1.781902, 1, 1, 1, 1, 1,
1.550177, -0.898626, 2.307932, 1, 1, 1, 1, 1,
1.563834, -0.9913946, 2.127813, 1, 1, 1, 1, 1,
1.567905, -0.9994776, 1.589348, 1, 1, 1, 1, 1,
1.581748, 0.6567487, 0.06889979, 1, 1, 1, 1, 1,
1.584264, -0.1055688, 1.778901, 1, 1, 1, 1, 1,
1.584463, -1.11815, 1.61619, 1, 1, 1, 1, 1,
1.598998, -0.2900979, 0.1892257, 1, 1, 1, 1, 1,
1.600264, -0.4566011, 2.138387, 1, 1, 1, 1, 1,
1.601209, -1.076127, 2.931345, 1, 1, 1, 1, 1,
1.625733, -2.163438, 3.147612, 1, 1, 1, 1, 1,
1.651157, 1.075328, 0.7024603, 0, 0, 1, 1, 1,
1.661358, 0.6503944, 1.064278, 1, 0, 0, 1, 1,
1.666587, 1.105118, 0.7877187, 1, 0, 0, 1, 1,
1.66793, 0.1484186, 1.69697, 1, 0, 0, 1, 1,
1.674863, 0.8514321, 0.9748242, 1, 0, 0, 1, 1,
1.681566, -1.202142, 1.205028, 1, 0, 0, 1, 1,
1.705828, -0.3860737, 1.745911, 0, 0, 0, 1, 1,
1.707695, 1.268257, 2.175704, 0, 0, 0, 1, 1,
1.741458, -1.873433, 3.477582, 0, 0, 0, 1, 1,
1.761786, 0.5871062, 2.439745, 0, 0, 0, 1, 1,
1.763409, 1.417847, 1.025466, 0, 0, 0, 1, 1,
1.763974, -0.5754246, 1.718794, 0, 0, 0, 1, 1,
1.766274, -0.6598352, 2.561363, 0, 0, 0, 1, 1,
1.780463, -0.1234165, 2.131857, 1, 1, 1, 1, 1,
1.792943, 1.40124, 0.5982491, 1, 1, 1, 1, 1,
1.794578, -0.3668861, 0.929859, 1, 1, 1, 1, 1,
1.816289, -2.07118, 1.801989, 1, 1, 1, 1, 1,
1.830121, -0.8500668, 1.350316, 1, 1, 1, 1, 1,
1.836769, 0.311875, 1.417817, 1, 1, 1, 1, 1,
1.837531, 0.08506836, 2.445372, 1, 1, 1, 1, 1,
1.873123, -1.479164, 1.19522, 1, 1, 1, 1, 1,
1.890961, -0.4922712, 2.676843, 1, 1, 1, 1, 1,
1.89651, 1.320361, -1.293791, 1, 1, 1, 1, 1,
1.902046, -2.477119, 1.460077, 1, 1, 1, 1, 1,
1.907027, -1.50997, 1.115932, 1, 1, 1, 1, 1,
1.915332, -0.01872249, 0.7840134, 1, 1, 1, 1, 1,
1.915847, -0.6555827, 3.057966, 1, 1, 1, 1, 1,
1.918923, 0.9209189, 0.6603905, 1, 1, 1, 1, 1,
1.925709, 1.952087, 1.476535, 0, 0, 1, 1, 1,
1.976615, 0.5964397, 1.770421, 1, 0, 0, 1, 1,
2.015918, 0.3909273, 2.179564, 1, 0, 0, 1, 1,
2.055211, 1.177806, -0.1766399, 1, 0, 0, 1, 1,
2.06731, -1.347776, 1.31547, 1, 0, 0, 1, 1,
2.122728, -0.1226219, 1.014957, 1, 0, 0, 1, 1,
2.14615, -0.3944119, -0.1715093, 0, 0, 0, 1, 1,
2.236133, 0.02841251, 2.252434, 0, 0, 0, 1, 1,
2.261974, 0.5114741, 3.204114, 0, 0, 0, 1, 1,
2.278037, -0.3529031, 3.529215, 0, 0, 0, 1, 1,
2.282092, -1.241209, 2.818695, 0, 0, 0, 1, 1,
2.306591, 0.1090398, 1.125306, 0, 0, 0, 1, 1,
2.380918, -0.0304253, 0.7387231, 0, 0, 0, 1, 1,
2.390721, 0.07655894, 2.229913, 1, 1, 1, 1, 1,
2.414117, -1.11003, 1.711819, 1, 1, 1, 1, 1,
2.46036, 0.6100317, 1.456464, 1, 1, 1, 1, 1,
2.480713, -0.2108286, 0.6223943, 1, 1, 1, 1, 1,
2.482465, 0.01313114, -1.345688, 1, 1, 1, 1, 1,
2.715741, 0.5781558, 1.837583, 1, 1, 1, 1, 1,
3.325743, 0.3355529, 1.022484, 1, 1, 1, 1, 1
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
var radius = 9.865885;
var distance = 34.6535;
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
mvMatrix.translate( 0.02521014, -0.007801294, 0.9459777 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.6535);
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
