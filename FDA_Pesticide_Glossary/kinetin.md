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
-3.317896, -0.8399422, -3.085358, 1, 0, 0, 1,
-3.299121, 0.5069334, -0.05026422, 1, 0.007843138, 0, 1,
-2.953491, 0.2877893, -0.4086732, 1, 0.01176471, 0, 1,
-2.867202, 0.4807497, -1.848655, 1, 0.01960784, 0, 1,
-2.678522, 0.2304656, -2.788649, 1, 0.02352941, 0, 1,
-2.527804, 0.5637838, -2.180567, 1, 0.03137255, 0, 1,
-2.50685, 0.1270382, -1.508864, 1, 0.03529412, 0, 1,
-2.472769, -1.193915, -1.108189, 1, 0.04313726, 0, 1,
-2.457536, -0.1243737, -1.146961, 1, 0.04705882, 0, 1,
-2.374545, -0.3818833, -2.137747, 1, 0.05490196, 0, 1,
-2.29372, 0.3523536, -2.678919, 1, 0.05882353, 0, 1,
-2.23874, -1.725162, -2.228749, 1, 0.06666667, 0, 1,
-2.237734, -0.5035423, -1.679913, 1, 0.07058824, 0, 1,
-2.152931, 0.636346, -0.2156706, 1, 0.07843138, 0, 1,
-2.135442, 0.5755782, 0.5181259, 1, 0.08235294, 0, 1,
-2.108394, 0.6578667, -2.153797, 1, 0.09019608, 0, 1,
-2.100826, -1.699173, -0.9722842, 1, 0.09411765, 0, 1,
-2.093682, -1.199, -3.227662, 1, 0.1019608, 0, 1,
-2.093645, -0.3902207, -2.203272, 1, 0.1098039, 0, 1,
-2.063076, -0.002073553, -2.11012, 1, 0.1137255, 0, 1,
-2.060198, 2.853561, 1.4786, 1, 0.1215686, 0, 1,
-2.044914, 1.756844, -2.024255, 1, 0.1254902, 0, 1,
-2.010855, -0.1969368, -2.205121, 1, 0.1333333, 0, 1,
-2.005998, 1.126809, -0.8047065, 1, 0.1372549, 0, 1,
-2.005493, -0.9013754, -0.7518647, 1, 0.145098, 0, 1,
-1.983741, -0.7315208, -2.098661, 1, 0.1490196, 0, 1,
-1.977549, 1.891851, 0.8435882, 1, 0.1568628, 0, 1,
-1.967087, 0.08975943, -2.758877, 1, 0.1607843, 0, 1,
-1.952515, 0.6949368, -2.828733, 1, 0.1686275, 0, 1,
-1.904455, -1.566215, -2.995609, 1, 0.172549, 0, 1,
-1.901623, -0.5874363, -1.543382, 1, 0.1803922, 0, 1,
-1.872223, 1.463545, -0.3966542, 1, 0.1843137, 0, 1,
-1.86129, -1.180723, -2.532776, 1, 0.1921569, 0, 1,
-1.830045, -1.171051, -2.115658, 1, 0.1960784, 0, 1,
-1.789012, 0.5895501, 0.06683935, 1, 0.2039216, 0, 1,
-1.786503, -1.593536, 0.5622182, 1, 0.2117647, 0, 1,
-1.779395, 0.7032138, -0.033025, 1, 0.2156863, 0, 1,
-1.738852, 0.04315175, -1.016379, 1, 0.2235294, 0, 1,
-1.737458, -0.4957595, -2.488688, 1, 0.227451, 0, 1,
-1.718959, -0.3822311, -2.100918, 1, 0.2352941, 0, 1,
-1.700759, 0.8124642, -1.097821, 1, 0.2392157, 0, 1,
-1.699808, -0.2049751, -1.87322, 1, 0.2470588, 0, 1,
-1.693995, -0.4198802, -2.131362, 1, 0.2509804, 0, 1,
-1.603035, 0.2418173, -3.335283, 1, 0.2588235, 0, 1,
-1.594242, 0.001130041, -1.771385, 1, 0.2627451, 0, 1,
-1.591789, -1.073574, -1.866413, 1, 0.2705882, 0, 1,
-1.57297, 0.5038788, -2.532197, 1, 0.2745098, 0, 1,
-1.568785, -0.1856098, -0.3658862, 1, 0.282353, 0, 1,
-1.565556, 2.534185, -0.6216711, 1, 0.2862745, 0, 1,
-1.554571, -1.002226, -1.644105, 1, 0.2941177, 0, 1,
-1.551255, -1.343779, -1.91033, 1, 0.3019608, 0, 1,
-1.544019, -0.1052159, -2.429598, 1, 0.3058824, 0, 1,
-1.54218, -0.3518321, -1.642754, 1, 0.3137255, 0, 1,
-1.530563, 1.485769, -0.9899561, 1, 0.3176471, 0, 1,
-1.524085, -3.760302, -4.323233, 1, 0.3254902, 0, 1,
-1.520948, 0.1530351, -0.1993321, 1, 0.3294118, 0, 1,
-1.519702, 0.7135872, 0.1387171, 1, 0.3372549, 0, 1,
-1.510133, -0.4933475, -2.11923, 1, 0.3411765, 0, 1,
-1.500278, 1.022441, -0.6630931, 1, 0.3490196, 0, 1,
-1.497057, 0.9230011, -2.14537, 1, 0.3529412, 0, 1,
-1.489787, 1.175494, 0.01221183, 1, 0.3607843, 0, 1,
-1.489509, -0.8225542, -0.5238251, 1, 0.3647059, 0, 1,
-1.473845, -0.3470846, -1.977769, 1, 0.372549, 0, 1,
-1.465858, 0.1796188, -1.679448, 1, 0.3764706, 0, 1,
-1.462085, -0.6464506, -0.3599832, 1, 0.3843137, 0, 1,
-1.461146, -0.5643215, -1.934008, 1, 0.3882353, 0, 1,
-1.460233, -0.8350561, -1.892174, 1, 0.3960784, 0, 1,
-1.450892, -0.7182289, -3.335793, 1, 0.4039216, 0, 1,
-1.443871, 0.08327191, -1.043548, 1, 0.4078431, 0, 1,
-1.442641, 1.035629, -0.6885228, 1, 0.4156863, 0, 1,
-1.441829, 0.2646633, -4.057, 1, 0.4196078, 0, 1,
-1.439796, -0.6298704, -1.933127, 1, 0.427451, 0, 1,
-1.437897, 0.2595527, -2.172701, 1, 0.4313726, 0, 1,
-1.416129, -1.232265, -2.0533, 1, 0.4392157, 0, 1,
-1.399295, 1.115524, 0.6143423, 1, 0.4431373, 0, 1,
-1.394894, -1.306116, -1.422593, 1, 0.4509804, 0, 1,
-1.386949, -0.6604681, -1.89695, 1, 0.454902, 0, 1,
-1.369635, 0.0626507, -1.773733, 1, 0.4627451, 0, 1,
-1.3649, -0.07603724, -1.936471, 1, 0.4666667, 0, 1,
-1.334296, 0.2888591, -1.055393, 1, 0.4745098, 0, 1,
-1.334202, -2.393164, -2.810734, 1, 0.4784314, 0, 1,
-1.330034, -0.644664, -1.54926, 1, 0.4862745, 0, 1,
-1.324441, -0.4467328, -1.429828, 1, 0.4901961, 0, 1,
-1.322376, 1.2381, -1.354483, 1, 0.4980392, 0, 1,
-1.316198, 0.8092602, -1.292445, 1, 0.5058824, 0, 1,
-1.312367, -0.5950463, -0.8362496, 1, 0.509804, 0, 1,
-1.312057, -0.5843423, -2.70098, 1, 0.5176471, 0, 1,
-1.298209, 1.954177, -0.7079623, 1, 0.5215687, 0, 1,
-1.286001, 1.585603, 1.314058, 1, 0.5294118, 0, 1,
-1.285789, 0.2679155, -1.947368, 1, 0.5333334, 0, 1,
-1.282299, -0.4361462, -1.368948, 1, 0.5411765, 0, 1,
-1.278324, 0.1437199, -2.874763, 1, 0.5450981, 0, 1,
-1.27026, -1.711519, -2.991587, 1, 0.5529412, 0, 1,
-1.265709, 1.481554, -0.5305699, 1, 0.5568628, 0, 1,
-1.258913, -0.413028, -0.7321492, 1, 0.5647059, 0, 1,
-1.246761, -0.4364708, -3.087294, 1, 0.5686275, 0, 1,
-1.245747, -1.343242, -3.370883, 1, 0.5764706, 0, 1,
-1.245445, 0.6785226, -0.5174835, 1, 0.5803922, 0, 1,
-1.23438, -0.2427634, 0.34882, 1, 0.5882353, 0, 1,
-1.226878, 0.7931278, -0.9605695, 1, 0.5921569, 0, 1,
-1.21884, -2.210742, -2.996166, 1, 0.6, 0, 1,
-1.214866, -0.07013872, 1.064324, 1, 0.6078432, 0, 1,
-1.211677, 1.12488, -0.02618029, 1, 0.6117647, 0, 1,
-1.206046, 2.421126, -1.205796, 1, 0.6196079, 0, 1,
-1.204591, -0.6607878, -2.890632, 1, 0.6235294, 0, 1,
-1.2039, -0.8637736, -0.1267805, 1, 0.6313726, 0, 1,
-1.200097, -1.084197, -2.964427, 1, 0.6352941, 0, 1,
-1.197316, -1.288015, -2.519021, 1, 0.6431373, 0, 1,
-1.192631, -0.130975, -0.2413861, 1, 0.6470588, 0, 1,
-1.189288, 1.506812, -0.2310716, 1, 0.654902, 0, 1,
-1.187784, 0.1522781, -2.017616, 1, 0.6588235, 0, 1,
-1.171277, 2.444065, -0.1156689, 1, 0.6666667, 0, 1,
-1.162202, 0.3619287, -1.759937, 1, 0.6705883, 0, 1,
-1.160547, 0.8683684, -0.990761, 1, 0.6784314, 0, 1,
-1.150908, -0.1949537, -2.607138, 1, 0.682353, 0, 1,
-1.143164, 0.7624267, -0.3197162, 1, 0.6901961, 0, 1,
-1.142384, -0.6636826, -3.260944, 1, 0.6941177, 0, 1,
-1.133834, -0.3795525, -3.836823, 1, 0.7019608, 0, 1,
-1.127463, -0.8959396, -1.367101, 1, 0.7098039, 0, 1,
-1.12473, 0.1387852, -1.656474, 1, 0.7137255, 0, 1,
-1.104771, 1.746104, 1.396108, 1, 0.7215686, 0, 1,
-1.103837, 0.1322783, -0.9671973, 1, 0.7254902, 0, 1,
-1.103596, 1.554234, 0.4339786, 1, 0.7333333, 0, 1,
-1.097831, -0.2442743, -1.825256, 1, 0.7372549, 0, 1,
-1.096537, -1.516364, -2.372857, 1, 0.7450981, 0, 1,
-1.093094, -0.4399536, -2.344954, 1, 0.7490196, 0, 1,
-1.076696, -1.578204, -0.9310444, 1, 0.7568628, 0, 1,
-1.073082, -0.1833317, -2.862015, 1, 0.7607843, 0, 1,
-1.057933, 0.6890671, 0.2722107, 1, 0.7686275, 0, 1,
-1.043802, 0.1967882, -1.260485, 1, 0.772549, 0, 1,
-1.041517, -0.4622487, -3.781141, 1, 0.7803922, 0, 1,
-1.039028, -0.05307461, -1.75757, 1, 0.7843137, 0, 1,
-1.038376, 0.7361758, -1.281005, 1, 0.7921569, 0, 1,
-1.037507, 1.413273, -0.2791351, 1, 0.7960784, 0, 1,
-1.035475, -0.707534, -1.171238, 1, 0.8039216, 0, 1,
-1.032955, -0.1435407, -1.906416, 1, 0.8117647, 0, 1,
-1.031593, 1.369916, -0.4285342, 1, 0.8156863, 0, 1,
-1.023356, -0.607176, -2.332247, 1, 0.8235294, 0, 1,
-1.002948, 1.154291, -1.11427, 1, 0.827451, 0, 1,
-1.0029, 0.9583287, 0.1814426, 1, 0.8352941, 0, 1,
-1.000152, -0.335619, -1.370578, 1, 0.8392157, 0, 1,
-0.9735551, 0.3081433, 0.293154, 1, 0.8470588, 0, 1,
-0.9725834, -0.4346939, -1.667453, 1, 0.8509804, 0, 1,
-0.9620444, -0.5942025, -1.916604, 1, 0.8588235, 0, 1,
-0.9589823, 0.1839352, -1.82875, 1, 0.8627451, 0, 1,
-0.9580072, -0.2668935, -2.57739, 1, 0.8705882, 0, 1,
-0.9532582, -0.06168656, -2.049849, 1, 0.8745098, 0, 1,
-0.9516169, 0.4470859, -0.3278865, 1, 0.8823529, 0, 1,
-0.9472745, -0.2432441, -2.290372, 1, 0.8862745, 0, 1,
-0.9385996, -1.142956, -3.320709, 1, 0.8941177, 0, 1,
-0.9363616, 0.4448108, -0.7910532, 1, 0.8980392, 0, 1,
-0.9211806, 0.9480326, -0.9849336, 1, 0.9058824, 0, 1,
-0.9166823, -1.114827, -1.588653, 1, 0.9137255, 0, 1,
-0.9161693, 0.4808053, -0.7616082, 1, 0.9176471, 0, 1,
-0.9112465, 2.175997, -0.1590492, 1, 0.9254902, 0, 1,
-0.9096323, 0.1945215, 0.552113, 1, 0.9294118, 0, 1,
-0.9083688, 0.1718576, -1.350734, 1, 0.9372549, 0, 1,
-0.9058139, 0.8707954, -1.076111, 1, 0.9411765, 0, 1,
-0.9002126, 1.311875, -0.5059907, 1, 0.9490196, 0, 1,
-0.8925491, 1.204143, -1.108579, 1, 0.9529412, 0, 1,
-0.888837, 0.4702546, -1.016262, 1, 0.9607843, 0, 1,
-0.8878917, 0.5081353, -2.216148, 1, 0.9647059, 0, 1,
-0.8874254, 2.293002, -0.8085133, 1, 0.972549, 0, 1,
-0.8867161, 1.690719, -1.988453, 1, 0.9764706, 0, 1,
-0.8784683, -1.362433, -2.848844, 1, 0.9843137, 0, 1,
-0.8757638, 1.480362, -1.969167, 1, 0.9882353, 0, 1,
-0.8743175, 1.418235, -2.621441, 1, 0.9960784, 0, 1,
-0.8731001, -1.536048, -3.381654, 0.9960784, 1, 0, 1,
-0.8720998, 0.1650377, -1.620953, 0.9921569, 1, 0, 1,
-0.8700181, 0.1942491, -1.519464, 0.9843137, 1, 0, 1,
-0.868558, 0.7732878, 0.2817807, 0.9803922, 1, 0, 1,
-0.8617765, -0.9856275, -1.209099, 0.972549, 1, 0, 1,
-0.8528829, 0.6912166, -0.8544473, 0.9686275, 1, 0, 1,
-0.8484125, -1.424932, -3.043544, 0.9607843, 1, 0, 1,
-0.8479257, 0.09198628, -0.6990049, 0.9568627, 1, 0, 1,
-0.8471464, 0.533895, -0.2983681, 0.9490196, 1, 0, 1,
-0.8428093, -1.587423, -0.2498985, 0.945098, 1, 0, 1,
-0.8400041, -0.6727696, -2.94912, 0.9372549, 1, 0, 1,
-0.8386807, -1.323547, -3.929459, 0.9333333, 1, 0, 1,
-0.8369348, 0.1610861, -3.079891, 0.9254902, 1, 0, 1,
-0.833881, 1.563655, -1.673784, 0.9215686, 1, 0, 1,
-0.8316519, 0.5017344, -2.003347, 0.9137255, 1, 0, 1,
-0.8303714, 0.06610911, -2.366243, 0.9098039, 1, 0, 1,
-0.8297603, -0.7849314, -1.662199, 0.9019608, 1, 0, 1,
-0.8288231, -0.2866009, -1.484952, 0.8941177, 1, 0, 1,
-0.8252531, 1.039289, 0.1787551, 0.8901961, 1, 0, 1,
-0.8207816, 0.1460718, -0.3665658, 0.8823529, 1, 0, 1,
-0.8206998, 0.4298748, 0.878637, 0.8784314, 1, 0, 1,
-0.8179457, 0.6396466, 0.6293997, 0.8705882, 1, 0, 1,
-0.8137304, 0.6461389, 0.5762941, 0.8666667, 1, 0, 1,
-0.8132265, -0.3417082, -2.744436, 0.8588235, 1, 0, 1,
-0.8072745, 0.3285836, -0.5618672, 0.854902, 1, 0, 1,
-0.8041058, 0.5294194, -0.5156537, 0.8470588, 1, 0, 1,
-0.801145, -1.818943, -2.405011, 0.8431373, 1, 0, 1,
-0.8002248, -0.3413662, -2.15478, 0.8352941, 1, 0, 1,
-0.8001067, -0.6866903, -3.179324, 0.8313726, 1, 0, 1,
-0.7991825, -0.4695134, -2.701958, 0.8235294, 1, 0, 1,
-0.7974593, 0.6546354, -1.230756, 0.8196079, 1, 0, 1,
-0.7942145, 0.269998, -1.598588, 0.8117647, 1, 0, 1,
-0.7933405, 0.448375, -1.282283, 0.8078431, 1, 0, 1,
-0.7930458, 1.415534, 0.232336, 0.8, 1, 0, 1,
-0.7925422, 1.345702, -1.683344, 0.7921569, 1, 0, 1,
-0.7908502, 0.4200511, -1.943377, 0.7882353, 1, 0, 1,
-0.7871152, 1.178078, -0.9303061, 0.7803922, 1, 0, 1,
-0.7867228, -0.1187233, -1.923572, 0.7764706, 1, 0, 1,
-0.7814808, 0.6843663, -1.827781, 0.7686275, 1, 0, 1,
-0.7757936, -0.5915336, -2.077944, 0.7647059, 1, 0, 1,
-0.7755498, -0.09518086, -0.5289337, 0.7568628, 1, 0, 1,
-0.7733765, 0.3573856, -2.596709, 0.7529412, 1, 0, 1,
-0.7721091, -0.07360166, -1.70037, 0.7450981, 1, 0, 1,
-0.7707474, 1.438553, -0.6820957, 0.7411765, 1, 0, 1,
-0.7682815, 1.428073, -0.1598712, 0.7333333, 1, 0, 1,
-0.7663313, -1.426921, -2.498241, 0.7294118, 1, 0, 1,
-0.7650998, 0.3000438, -1.769468, 0.7215686, 1, 0, 1,
-0.7602002, -0.01452692, -1.555905, 0.7176471, 1, 0, 1,
-0.7596804, -0.0588897, -1.949046, 0.7098039, 1, 0, 1,
-0.7516485, -0.1249502, -2.791271, 0.7058824, 1, 0, 1,
-0.7515922, -0.3325837, -4.127924, 0.6980392, 1, 0, 1,
-0.7464547, 0.2972839, -0.8116618, 0.6901961, 1, 0, 1,
-0.7444666, -1.979357, -2.870539, 0.6862745, 1, 0, 1,
-0.7419268, -0.5775349, -4.021349, 0.6784314, 1, 0, 1,
-0.7354861, 1.105166, -1.090806, 0.6745098, 1, 0, 1,
-0.7328897, -0.08440792, -2.35565, 0.6666667, 1, 0, 1,
-0.7327163, -0.2855925, -1.883813, 0.6627451, 1, 0, 1,
-0.726867, -0.1873023, -0.3378717, 0.654902, 1, 0, 1,
-0.7233347, -1.796979, -3.452187, 0.6509804, 1, 0, 1,
-0.7218463, -0.6289793, -2.976224, 0.6431373, 1, 0, 1,
-0.7155216, -1.745066, -2.831413, 0.6392157, 1, 0, 1,
-0.7145925, 1.606027, -2.982569, 0.6313726, 1, 0, 1,
-0.7137402, 0.6418422, 0.01601896, 0.627451, 1, 0, 1,
-0.7105142, -0.1679442, -2.217549, 0.6196079, 1, 0, 1,
-0.7097483, -0.5565443, -0.1766132, 0.6156863, 1, 0, 1,
-0.7060876, 0.3328501, 0.1180911, 0.6078432, 1, 0, 1,
-0.7030704, 0.079891, -2.572059, 0.6039216, 1, 0, 1,
-0.7020307, -1.581758, -2.15942, 0.5960785, 1, 0, 1,
-0.6826044, 0.9885738, -0.1752889, 0.5882353, 1, 0, 1,
-0.6700513, -1.849482, -3.808911, 0.5843138, 1, 0, 1,
-0.668808, -1.339811, -3.654727, 0.5764706, 1, 0, 1,
-0.6681678, 0.6250957, -2.448974, 0.572549, 1, 0, 1,
-0.6670604, -0.4439765, -2.131299, 0.5647059, 1, 0, 1,
-0.6670259, 1.762301, -2.122666, 0.5607843, 1, 0, 1,
-0.6618221, -0.6819209, -2.940496, 0.5529412, 1, 0, 1,
-0.6586652, 0.8670645, -1.688436, 0.5490196, 1, 0, 1,
-0.6563717, 0.1147216, -1.67671, 0.5411765, 1, 0, 1,
-0.6551253, 0.7104666, -0.8936514, 0.5372549, 1, 0, 1,
-0.6547425, -0.472011, 1.339594, 0.5294118, 1, 0, 1,
-0.6546601, -0.1945486, -1.796352, 0.5254902, 1, 0, 1,
-0.6517665, 0.5174146, -1.106703, 0.5176471, 1, 0, 1,
-0.6515365, -0.728147, -3.29075, 0.5137255, 1, 0, 1,
-0.6508232, -0.4314941, -2.871226, 0.5058824, 1, 0, 1,
-0.6493315, 1.699962, -0.625623, 0.5019608, 1, 0, 1,
-0.648487, -1.622439, -3.683719, 0.4941176, 1, 0, 1,
-0.6455283, 0.8363558, -1.910934, 0.4862745, 1, 0, 1,
-0.6435389, 0.2600737, -2.378562, 0.4823529, 1, 0, 1,
-0.6433901, -0.06566267, -1.996545, 0.4745098, 1, 0, 1,
-0.6390454, 1.296935, -2.834575, 0.4705882, 1, 0, 1,
-0.6382603, 0.5663171, 2.785106, 0.4627451, 1, 0, 1,
-0.6375723, 0.906238, -0.8225185, 0.4588235, 1, 0, 1,
-0.6353317, 0.08279229, -1.115803, 0.4509804, 1, 0, 1,
-0.6345209, -0.2278434, -1.063912, 0.4470588, 1, 0, 1,
-0.6312127, 0.502499, -0.5554758, 0.4392157, 1, 0, 1,
-0.6274694, -1.782889, -4.490123, 0.4352941, 1, 0, 1,
-0.6268689, 0.4760618, -1.95846, 0.427451, 1, 0, 1,
-0.6236174, -1.582187, -2.296679, 0.4235294, 1, 0, 1,
-0.6213715, 0.6200117, -1.888579, 0.4156863, 1, 0, 1,
-0.6077178, -1.034856, -3.604007, 0.4117647, 1, 0, 1,
-0.5980777, -0.5521629, -1.034128, 0.4039216, 1, 0, 1,
-0.5980471, -2.02201, -2.786417, 0.3960784, 1, 0, 1,
-0.5974869, -0.3760305, -1.653121, 0.3921569, 1, 0, 1,
-0.5921844, 0.5537105, -1.547427, 0.3843137, 1, 0, 1,
-0.5874234, -0.6164585, -3.679501, 0.3803922, 1, 0, 1,
-0.586459, -1.697534, -1.706921, 0.372549, 1, 0, 1,
-0.5836831, -0.7148178, -1.47765, 0.3686275, 1, 0, 1,
-0.5828132, -0.7662424, -0.4601501, 0.3607843, 1, 0, 1,
-0.5826334, -0.06301626, -3.14651, 0.3568628, 1, 0, 1,
-0.58074, -0.1118485, -0.8579243, 0.3490196, 1, 0, 1,
-0.5799437, -0.194128, -1.371873, 0.345098, 1, 0, 1,
-0.576816, -0.6891177, -3.853849, 0.3372549, 1, 0, 1,
-0.5696751, -0.6273751, -2.802992, 0.3333333, 1, 0, 1,
-0.5643877, 2.928436, 0.4741877, 0.3254902, 1, 0, 1,
-0.5637196, 0.6995743, -1.006158, 0.3215686, 1, 0, 1,
-0.5618528, -0.3354531, -4.670007, 0.3137255, 1, 0, 1,
-0.5558807, -0.5052087, -1.699885, 0.3098039, 1, 0, 1,
-0.555304, -0.5762514, 0.2393319, 0.3019608, 1, 0, 1,
-0.5524793, 0.117518, -1.760785, 0.2941177, 1, 0, 1,
-0.5518989, -0.9231622, -2.01231, 0.2901961, 1, 0, 1,
-0.550347, -0.6034454, -2.841735, 0.282353, 1, 0, 1,
-0.5451544, -0.836717, -3.43614, 0.2784314, 1, 0, 1,
-0.5443348, -0.4327494, -2.670613, 0.2705882, 1, 0, 1,
-0.5434501, 0.0881679, -1.984799, 0.2666667, 1, 0, 1,
-0.5380815, -0.07758856, -2.208397, 0.2588235, 1, 0, 1,
-0.5344432, -0.6541758, -3.400642, 0.254902, 1, 0, 1,
-0.5342724, 0.4157586, -1.391783, 0.2470588, 1, 0, 1,
-0.5333686, -1.01289, -2.788245, 0.2431373, 1, 0, 1,
-0.5311239, -0.3629933, -2.146024, 0.2352941, 1, 0, 1,
-0.5182534, 0.1316582, -2.312721, 0.2313726, 1, 0, 1,
-0.5181421, -0.1067294, -1.217651, 0.2235294, 1, 0, 1,
-0.5178479, 0.3590834, -1.92613, 0.2196078, 1, 0, 1,
-0.5176018, 2.490151, -0.4078848, 0.2117647, 1, 0, 1,
-0.5170671, -0.2175121, -1.665796, 0.2078431, 1, 0, 1,
-0.514806, 1.129856, 0.5743402, 0.2, 1, 0, 1,
-0.5130463, 0.8434366, -3.241049, 0.1921569, 1, 0, 1,
-0.5125034, 1.011946, -0.9138443, 0.1882353, 1, 0, 1,
-0.5107585, -0.08180635, -0.01677413, 0.1803922, 1, 0, 1,
-0.5094134, -0.06315061, -1.899045, 0.1764706, 1, 0, 1,
-0.5084089, 0.3605719, 0.7504766, 0.1686275, 1, 0, 1,
-0.5075477, -0.08461549, -2.944188, 0.1647059, 1, 0, 1,
-0.5067063, -0.6675076, -2.938915, 0.1568628, 1, 0, 1,
-0.5054749, 0.2428602, -0.9130514, 0.1529412, 1, 0, 1,
-0.5032665, -0.01216223, -1.123512, 0.145098, 1, 0, 1,
-0.4985188, 1.227682, -0.6630002, 0.1411765, 1, 0, 1,
-0.4869453, 0.1230429, -0.8440306, 0.1333333, 1, 0, 1,
-0.4859089, 1.154862, 1.135079, 0.1294118, 1, 0, 1,
-0.4834119, 0.585781, -0.506648, 0.1215686, 1, 0, 1,
-0.4808542, -0.6159943, -1.568038, 0.1176471, 1, 0, 1,
-0.477764, 2.235626, -0.1221837, 0.1098039, 1, 0, 1,
-0.4767953, 1.31721, 0.5919408, 0.1058824, 1, 0, 1,
-0.4767119, 0.3283306, -0.8504267, 0.09803922, 1, 0, 1,
-0.4759051, -0.1907397, -2.830191, 0.09019608, 1, 0, 1,
-0.4716899, -1.949624, -1.634928, 0.08627451, 1, 0, 1,
-0.468404, -0.06470456, -0.2962545, 0.07843138, 1, 0, 1,
-0.4651856, -1.099297, -2.995782, 0.07450981, 1, 0, 1,
-0.4646839, 0.3151534, -1.131393, 0.06666667, 1, 0, 1,
-0.4626651, 0.6693206, -0.2964784, 0.0627451, 1, 0, 1,
-0.4603564, 1.142038, -0.9689158, 0.05490196, 1, 0, 1,
-0.4602181, -1.344267, -2.283741, 0.05098039, 1, 0, 1,
-0.4511099, 1.221638, -0.4653471, 0.04313726, 1, 0, 1,
-0.448239, 0.9960029, -2.008767, 0.03921569, 1, 0, 1,
-0.4460978, 0.03612069, -1.795359, 0.03137255, 1, 0, 1,
-0.4437868, 0.8424885, -2.411668, 0.02745098, 1, 0, 1,
-0.4431451, 0.4757307, -1.605446, 0.01960784, 1, 0, 1,
-0.4430815, 0.1857206, -0.8674751, 0.01568628, 1, 0, 1,
-0.4424823, -1.485859, -1.768004, 0.007843138, 1, 0, 1,
-0.4391547, -1.188732, -4.41176, 0.003921569, 1, 0, 1,
-0.4372902, -0.7574844, -4.534189, 0, 1, 0.003921569, 1,
-0.4273199, -0.8765469, -3.308722, 0, 1, 0.01176471, 1,
-0.4246667, -0.4357914, -1.719759, 0, 1, 0.01568628, 1,
-0.4237359, 1.462299, -0.4576587, 0, 1, 0.02352941, 1,
-0.4180123, -0.4755616, -3.004624, 0, 1, 0.02745098, 1,
-0.4168649, 1.121622, -0.8902056, 0, 1, 0.03529412, 1,
-0.4144528, -1.932702, -2.358891, 0, 1, 0.03921569, 1,
-0.4094867, -1.651951, -2.47332, 0, 1, 0.04705882, 1,
-0.4073429, 0.3876179, 1.171619, 0, 1, 0.05098039, 1,
-0.3976766, -2.528877, -2.686094, 0, 1, 0.05882353, 1,
-0.3942515, -0.08483817, -1.896004, 0, 1, 0.0627451, 1,
-0.3912548, -0.4612769, -2.078432, 0, 1, 0.07058824, 1,
-0.3891307, 0.2170985, -2.029799, 0, 1, 0.07450981, 1,
-0.3876584, 2.327421, -0.9633385, 0, 1, 0.08235294, 1,
-0.3833913, 0.16368, -0.4653712, 0, 1, 0.08627451, 1,
-0.3781478, 0.5958984, -1.177458, 0, 1, 0.09411765, 1,
-0.3766998, -0.2376316, -1.143108, 0, 1, 0.1019608, 1,
-0.3763322, -0.4776661, -1.384307, 0, 1, 0.1058824, 1,
-0.374123, 1.297066, 0.5718764, 0, 1, 0.1137255, 1,
-0.3736184, -0.3423175, -3.912301, 0, 1, 0.1176471, 1,
-0.3733626, 0.08415764, -1.408553, 0, 1, 0.1254902, 1,
-0.3684938, -1.40973, -0.6397232, 0, 1, 0.1294118, 1,
-0.3665912, 0.0575163, -0.3258188, 0, 1, 0.1372549, 1,
-0.3642472, -0.263317, -3.588958, 0, 1, 0.1411765, 1,
-0.3623856, -0.1874087, -3.229948, 0, 1, 0.1490196, 1,
-0.3479157, -1.904054, -3.939171, 0, 1, 0.1529412, 1,
-0.3447643, 0.349684, -1.422285, 0, 1, 0.1607843, 1,
-0.3441023, 0.08874013, -1.405629, 0, 1, 0.1647059, 1,
-0.3430038, -0.5362461, -2.778962, 0, 1, 0.172549, 1,
-0.3429547, 0.6270007, -0.3285788, 0, 1, 0.1764706, 1,
-0.3357662, -0.2573952, -2.903217, 0, 1, 0.1843137, 1,
-0.3341861, -0.7056987, -1.954094, 0, 1, 0.1882353, 1,
-0.3327921, 1.441676, -0.7556199, 0, 1, 0.1960784, 1,
-0.3291838, -0.9510154, -3.538965, 0, 1, 0.2039216, 1,
-0.3259889, -0.1624193, -1.688256, 0, 1, 0.2078431, 1,
-0.3219696, -1.917771, -2.583322, 0, 1, 0.2156863, 1,
-0.3145133, 0.093146, -2.055918, 0, 1, 0.2196078, 1,
-0.3119037, 1.376546, -1.758883, 0, 1, 0.227451, 1,
-0.3098141, -0.09716521, -2.608367, 0, 1, 0.2313726, 1,
-0.3057587, -1.656817, -3.214546, 0, 1, 0.2392157, 1,
-0.3049255, 0.2112512, -0.3638635, 0, 1, 0.2431373, 1,
-0.3043904, 0.525382, -1.10051, 0, 1, 0.2509804, 1,
-0.3011778, -2.854003, -3.090811, 0, 1, 0.254902, 1,
-0.3003403, 0.2952508, 0.1026602, 0, 1, 0.2627451, 1,
-0.2997833, -0.9595966, -1.027139, 0, 1, 0.2666667, 1,
-0.2980178, -1.056179, -1.689313, 0, 1, 0.2745098, 1,
-0.29778, 0.6108275, -1.256623, 0, 1, 0.2784314, 1,
-0.2952507, 0.388537, -0.7727327, 0, 1, 0.2862745, 1,
-0.2943213, 0.1417456, -1.424406, 0, 1, 0.2901961, 1,
-0.2906769, 0.02300637, -2.677294, 0, 1, 0.2980392, 1,
-0.2894369, 1.662057, -0.5339023, 0, 1, 0.3058824, 1,
-0.2858587, 1.13341, 0.3863964, 0, 1, 0.3098039, 1,
-0.2818773, 0.6428512, -0.9269305, 0, 1, 0.3176471, 1,
-0.2800891, 0.2870157, -0.3600006, 0, 1, 0.3215686, 1,
-0.2790578, 0.3303009, -0.265203, 0, 1, 0.3294118, 1,
-0.2787821, 0.540522, -0.2805069, 0, 1, 0.3333333, 1,
-0.2756161, -0.5898666, -2.246255, 0, 1, 0.3411765, 1,
-0.2746193, -2.012857, -1.964491, 0, 1, 0.345098, 1,
-0.2728235, -0.01478483, -1.222193, 0, 1, 0.3529412, 1,
-0.2703306, -0.6690832, -2.623497, 0, 1, 0.3568628, 1,
-0.2690134, -0.1306003, -1.593297, 0, 1, 0.3647059, 1,
-0.2668788, 0.1637677, -1.529082, 0, 1, 0.3686275, 1,
-0.2645842, 2.932718, 1.932942, 0, 1, 0.3764706, 1,
-0.260031, 0.2626399, -3.18907, 0, 1, 0.3803922, 1,
-0.2592739, 1.343732, -1.165991, 0, 1, 0.3882353, 1,
-0.257771, 0.8196195, -0.428483, 0, 1, 0.3921569, 1,
-0.2567419, -1.280701, -4.580217, 0, 1, 0.4, 1,
-0.254771, 0.8287027, -1.001654, 0, 1, 0.4078431, 1,
-0.2546649, 1.019551, -1.229554, 0, 1, 0.4117647, 1,
-0.2546575, -0.6938625, -2.391577, 0, 1, 0.4196078, 1,
-0.2499822, 1.360268, -0.123975, 0, 1, 0.4235294, 1,
-0.2468718, -1.217478, -3.629378, 0, 1, 0.4313726, 1,
-0.2461234, 0.8069084, -0.07424845, 0, 1, 0.4352941, 1,
-0.242394, 0.9694523, -0.9191512, 0, 1, 0.4431373, 1,
-0.2422824, 0.6317962, -1.079839, 0, 1, 0.4470588, 1,
-0.2412436, -0.9053926, -2.75223, 0, 1, 0.454902, 1,
-0.2380634, 1.462412, -0.8503127, 0, 1, 0.4588235, 1,
-0.2349363, 0.3699756, -1.607916, 0, 1, 0.4666667, 1,
-0.2278246, -0.5879245, -2.34363, 0, 1, 0.4705882, 1,
-0.2231071, -1.422032, -2.393031, 0, 1, 0.4784314, 1,
-0.2176159, 0.5362632, -0.7564389, 0, 1, 0.4823529, 1,
-0.2121425, 0.3424382, 0.3671358, 0, 1, 0.4901961, 1,
-0.2109915, -0.5068462, -2.66473, 0, 1, 0.4941176, 1,
-0.206068, 1.099113, 0.1753655, 0, 1, 0.5019608, 1,
-0.2058551, -1.506223, -2.335214, 0, 1, 0.509804, 1,
-0.2042178, -1.418268, -4.704563, 0, 1, 0.5137255, 1,
-0.2031439, -2.54778, -1.560206, 0, 1, 0.5215687, 1,
-0.2023299, -0.1284941, -1.53425, 0, 1, 0.5254902, 1,
-0.2007313, 0.6415433, -1.554072, 0, 1, 0.5333334, 1,
-0.2003361, -0.02845898, -1.40633, 0, 1, 0.5372549, 1,
-0.1978573, 0.3994628, -0.6619962, 0, 1, 0.5450981, 1,
-0.1953508, 0.3461958, -0.9778728, 0, 1, 0.5490196, 1,
-0.1934064, 1.491456, 0.2385491, 0, 1, 0.5568628, 1,
-0.1887891, 0.2453688, 0.3646845, 0, 1, 0.5607843, 1,
-0.188404, 0.2548555, -0.8592871, 0, 1, 0.5686275, 1,
-0.1813881, 0.6320419, 0.1479469, 0, 1, 0.572549, 1,
-0.17872, 0.6304969, 0.05265236, 0, 1, 0.5803922, 1,
-0.1784401, 1.088374, -0.3750476, 0, 1, 0.5843138, 1,
-0.1761887, 1.195055, 1.176621, 0, 1, 0.5921569, 1,
-0.1721272, -0.7732691, -4.539895, 0, 1, 0.5960785, 1,
-0.167589, 0.3612816, -1.041605, 0, 1, 0.6039216, 1,
-0.1657316, -1.279478, -5.056684, 0, 1, 0.6117647, 1,
-0.1637787, 1.006833, -0.08896799, 0, 1, 0.6156863, 1,
-0.1631176, -0.8581017, -2.118366, 0, 1, 0.6235294, 1,
-0.1603507, -0.4771921, -2.978074, 0, 1, 0.627451, 1,
-0.1566322, 1.325633, 0.789832, 0, 1, 0.6352941, 1,
-0.1558902, -1.251605, -2.559345, 0, 1, 0.6392157, 1,
-0.1554133, 0.4538121, 1.17649, 0, 1, 0.6470588, 1,
-0.1529272, 0.5059278, -1.400274, 0, 1, 0.6509804, 1,
-0.1523832, -2.451356, -3.513876, 0, 1, 0.6588235, 1,
-0.1512886, 0.5994938, -0.7730332, 0, 1, 0.6627451, 1,
-0.1465304, -0.7898428, -3.197807, 0, 1, 0.6705883, 1,
-0.1428545, -0.4818214, -2.898296, 0, 1, 0.6745098, 1,
-0.1420575, -0.369255, -2.853593, 0, 1, 0.682353, 1,
-0.1418228, 1.465203, -0.9376256, 0, 1, 0.6862745, 1,
-0.1334236, -0.220838, -3.086031, 0, 1, 0.6941177, 1,
-0.1302017, 1.53647, 0.1040239, 0, 1, 0.7019608, 1,
-0.1261834, 2.216254, -0.9131525, 0, 1, 0.7058824, 1,
-0.1255956, -0.2368227, -2.089144, 0, 1, 0.7137255, 1,
-0.1255262, -2.243256, -0.4666855, 0, 1, 0.7176471, 1,
-0.124359, 0.06141808, -1.454196, 0, 1, 0.7254902, 1,
-0.1238202, -1.783312, -3.504038, 0, 1, 0.7294118, 1,
-0.1210022, -1.461239, -1.712631, 0, 1, 0.7372549, 1,
-0.1200783, -1.1877, -3.219598, 0, 1, 0.7411765, 1,
-0.1187262, 0.03740392, -0.2069667, 0, 1, 0.7490196, 1,
-0.1171702, -0.4118225, -2.153741, 0, 1, 0.7529412, 1,
-0.1103135, 1.474924, -1.299903, 0, 1, 0.7607843, 1,
-0.1102413, -1.647462, -4.13784, 0, 1, 0.7647059, 1,
-0.1096045, 0.2284678, -0.7018662, 0, 1, 0.772549, 1,
-0.1050483, 1.743429, 1.21112, 0, 1, 0.7764706, 1,
-0.1043924, -0.7917928, -1.226732, 0, 1, 0.7843137, 1,
-0.1034864, -0.405578, -4.294753, 0, 1, 0.7882353, 1,
-0.1005129, 1.079425, 1.42019, 0, 1, 0.7960784, 1,
-0.09905472, -0.27521, -3.942522, 0, 1, 0.8039216, 1,
-0.09881886, -0.2415859, -4.162965, 0, 1, 0.8078431, 1,
-0.09568571, -1.827894, -2.617746, 0, 1, 0.8156863, 1,
-0.09432387, -0.004526405, -1.054654, 0, 1, 0.8196079, 1,
-0.09393125, -0.7318445, -2.955034, 0, 1, 0.827451, 1,
-0.09170095, -2.131713, -2.583794, 0, 1, 0.8313726, 1,
-0.08408827, 0.3623617, -0.4875256, 0, 1, 0.8392157, 1,
-0.08340377, -0.7397513, -2.120523, 0, 1, 0.8431373, 1,
-0.08147226, 0.985203, 0.2597578, 0, 1, 0.8509804, 1,
-0.08073964, -1.155777, -3.020757, 0, 1, 0.854902, 1,
-0.07570034, 0.5759961, 1.424933, 0, 1, 0.8627451, 1,
-0.07539336, -0.7024156, -0.5579334, 0, 1, 0.8666667, 1,
-0.0748662, 0.3994403, 0.9702413, 0, 1, 0.8745098, 1,
-0.07300474, 1.158455, -1.901528, 0, 1, 0.8784314, 1,
-0.07228609, 0.5864617, -1.38025, 0, 1, 0.8862745, 1,
-0.07020661, 1.469435, 0.3053631, 0, 1, 0.8901961, 1,
-0.06554396, 0.3390379, 0.1291374, 0, 1, 0.8980392, 1,
-0.06497576, 0.2938365, -0.570355, 0, 1, 0.9058824, 1,
-0.06412905, -1.123736, -2.333167, 0, 1, 0.9098039, 1,
-0.06256012, 1.133024, -0.3872291, 0, 1, 0.9176471, 1,
-0.0610658, 1.034314, 0.4883869, 0, 1, 0.9215686, 1,
-0.05817383, 0.7662486, -0.6920863, 0, 1, 0.9294118, 1,
-0.05415359, 0.0257317, -1.062471, 0, 1, 0.9333333, 1,
-0.04369, -0.6893856, -2.251534, 0, 1, 0.9411765, 1,
-0.04329783, -0.7344407, -2.433197, 0, 1, 0.945098, 1,
-0.04159638, -0.7897372, -2.596559, 0, 1, 0.9529412, 1,
-0.04090958, -0.1440554, -2.182893, 0, 1, 0.9568627, 1,
-0.04043916, -1.90584, -2.108346, 0, 1, 0.9647059, 1,
-0.04025654, -1.238159, -4.967689, 0, 1, 0.9686275, 1,
-0.03508637, -0.2882767, -2.631467, 0, 1, 0.9764706, 1,
-0.03506, 0.04324433, 0.979598, 0, 1, 0.9803922, 1,
-0.0339621, -0.6298527, -1.652194, 0, 1, 0.9882353, 1,
-0.03330032, 1.251205, 0.9688386, 0, 1, 0.9921569, 1,
-0.0330659, 0.2453635, 0.326867, 0, 1, 1, 1,
-0.0329495, 0.3084918, 2.125844, 0, 0.9921569, 1, 1,
-0.03101423, 2.383324, -0.1123818, 0, 0.9882353, 1, 1,
-0.030406, -0.732676, -2.826155, 0, 0.9803922, 1, 1,
-0.03034864, -0.2194939, -2.100598, 0, 0.9764706, 1, 1,
-0.01768572, -1.648095, -1.896737, 0, 0.9686275, 1, 1,
-0.008003199, 0.8402382, 1.061226, 0, 0.9647059, 1, 1,
-0.007675579, 0.9554554, -0.5778257, 0, 0.9568627, 1, 1,
-0.006782531, -0.1322408, -3.985203, 0, 0.9529412, 1, 1,
-0.002855271, 0.7622237, 2.916932, 0, 0.945098, 1, 1,
-0.002618221, 2.124189, 0.2886718, 0, 0.9411765, 1, 1,
-0.001116928, -1.945947e-05, -2.152901, 0, 0.9333333, 1, 1,
0.0002461013, -1.048803, 3.978751, 0, 0.9294118, 1, 1,
0.002336574, -0.6301312, 1.701651, 0, 0.9215686, 1, 1,
0.009566208, -1.965486, 2.939228, 0, 0.9176471, 1, 1,
0.009650689, 0.3926565, -1.296829, 0, 0.9098039, 1, 1,
0.01117158, 0.7454634, -0.1840316, 0, 0.9058824, 1, 1,
0.01727957, -0.5758762, 6.161774, 0, 0.8980392, 1, 1,
0.01782599, 0.2911282, -0.3808848, 0, 0.8901961, 1, 1,
0.01822625, 0.8690001, 1.378496, 0, 0.8862745, 1, 1,
0.01955237, 1.016756, -0.2133013, 0, 0.8784314, 1, 1,
0.02066888, 0.1360177, -0.9852103, 0, 0.8745098, 1, 1,
0.02183057, 2.223148, -0.7551412, 0, 0.8666667, 1, 1,
0.02463465, -0.3361836, 4.158644, 0, 0.8627451, 1, 1,
0.02472365, -1.644109, 3.399774, 0, 0.854902, 1, 1,
0.03433307, -0.195124, 2.883934, 0, 0.8509804, 1, 1,
0.04433756, -0.5156301, 2.728563, 0, 0.8431373, 1, 1,
0.04910451, 0.8524346, -0.5048371, 0, 0.8392157, 1, 1,
0.0512371, 0.5418441, 0.2631165, 0, 0.8313726, 1, 1,
0.05130741, 0.4357106, -0.1631848, 0, 0.827451, 1, 1,
0.05316261, -0.7909914, 4.089457, 0, 0.8196079, 1, 1,
0.05592712, -0.7507362, 3.612604, 0, 0.8156863, 1, 1,
0.05765186, -0.05366135, 3.011456, 0, 0.8078431, 1, 1,
0.05842317, 0.315966, -0.7943547, 0, 0.8039216, 1, 1,
0.06216831, -0.5534579, 3.741538, 0, 0.7960784, 1, 1,
0.06275338, -0.7743062, 4.874241, 0, 0.7882353, 1, 1,
0.06846809, -0.02091503, 1.623859, 0, 0.7843137, 1, 1,
0.06941109, 1.753265, 0.08635667, 0, 0.7764706, 1, 1,
0.07608879, -0.3870933, 2.552253, 0, 0.772549, 1, 1,
0.07837532, 0.1284862, 1.693145, 0, 0.7647059, 1, 1,
0.07906163, -1.087667, 3.358291, 0, 0.7607843, 1, 1,
0.08035151, 0.1822629, 1.308908, 0, 0.7529412, 1, 1,
0.08620362, 1.632165, -0.4162884, 0, 0.7490196, 1, 1,
0.08779372, 0.3972645, 0.1162674, 0, 0.7411765, 1, 1,
0.08931196, 0.3942078, -0.1438875, 0, 0.7372549, 1, 1,
0.09013933, 0.829652, 0.3836069, 0, 0.7294118, 1, 1,
0.0918984, 0.1468265, 0.7322359, 0, 0.7254902, 1, 1,
0.09202896, 1.37892, 0.7561067, 0, 0.7176471, 1, 1,
0.09241127, 1.208752, -1.582345, 0, 0.7137255, 1, 1,
0.09425192, 0.4238089, -0.3053049, 0, 0.7058824, 1, 1,
0.09669238, -0.2021961, 2.234906, 0, 0.6980392, 1, 1,
0.09741696, 0.5005632, 0.8731838, 0, 0.6941177, 1, 1,
0.09891038, -0.360432, 3.349966, 0, 0.6862745, 1, 1,
0.100017, 0.8811911, -0.4405104, 0, 0.682353, 1, 1,
0.1020694, 1.806803, 1.20886, 0, 0.6745098, 1, 1,
0.1027523, -0.7665898, 2.472543, 0, 0.6705883, 1, 1,
0.1028259, -0.1518357, 1.422073, 0, 0.6627451, 1, 1,
0.1037953, -0.2990535, 2.742033, 0, 0.6588235, 1, 1,
0.1041607, -1.419433, 2.729598, 0, 0.6509804, 1, 1,
0.113402, 0.562983, -0.4628349, 0, 0.6470588, 1, 1,
0.1148422, 0.8112689, -0.4229137, 0, 0.6392157, 1, 1,
0.1204179, 0.9676597, 0.8727693, 0, 0.6352941, 1, 1,
0.1239223, -1.522448, 2.698925, 0, 0.627451, 1, 1,
0.1270732, 1.476819, 0.9384091, 0, 0.6235294, 1, 1,
0.1270994, -0.06242836, 2.240515, 0, 0.6156863, 1, 1,
0.1275764, 0.6263639, 0.02692765, 0, 0.6117647, 1, 1,
0.1281647, 0.4136917, 0.611516, 0, 0.6039216, 1, 1,
0.1281767, -0.02966523, 2.707477, 0, 0.5960785, 1, 1,
0.1300657, 1.006495, 0.6148928, 0, 0.5921569, 1, 1,
0.1427704, 0.3160256, 1.817966, 0, 0.5843138, 1, 1,
0.1449504, -0.4597769, 2.187399, 0, 0.5803922, 1, 1,
0.1485328, -1.397484, 1.592165, 0, 0.572549, 1, 1,
0.1547295, 1.453878, 1.543451, 0, 0.5686275, 1, 1,
0.1549728, -2.18455, 1.783294, 0, 0.5607843, 1, 1,
0.1553546, 0.7096481, 0.5278267, 0, 0.5568628, 1, 1,
0.1560513, 0.6000422, -0.2426319, 0, 0.5490196, 1, 1,
0.1567813, 0.951235, 0.5435886, 0, 0.5450981, 1, 1,
0.1580301, -0.2948303, 2.366446, 0, 0.5372549, 1, 1,
0.159191, 3.257268, 0.1568876, 0, 0.5333334, 1, 1,
0.1681762, -0.5146811, 2.179292, 0, 0.5254902, 1, 1,
0.1691583, 0.7115489, 1.089387, 0, 0.5215687, 1, 1,
0.1702944, 0.6485491, -0.961341, 0, 0.5137255, 1, 1,
0.1743004, -0.5570312, 0.2824651, 0, 0.509804, 1, 1,
0.1757592, 2.373954, -0.2845089, 0, 0.5019608, 1, 1,
0.176172, -1.456423, 3.895868, 0, 0.4941176, 1, 1,
0.1766903, -1.83596, 4.743556, 0, 0.4901961, 1, 1,
0.1777876, -0.1974635, 1.13551, 0, 0.4823529, 1, 1,
0.1788824, -0.03665649, 0.9876921, 0, 0.4784314, 1, 1,
0.1811626, -0.53385, 3.416851, 0, 0.4705882, 1, 1,
0.1832425, 1.455735, 1.923078, 0, 0.4666667, 1, 1,
0.1838349, 1.536977, -1.076379, 0, 0.4588235, 1, 1,
0.192194, -1.190143, 1.957038, 0, 0.454902, 1, 1,
0.2032378, 0.3463776, -0.005264163, 0, 0.4470588, 1, 1,
0.205549, 1.011847, 1.468623, 0, 0.4431373, 1, 1,
0.2061793, 1.447422, 0.2322824, 0, 0.4352941, 1, 1,
0.2069961, -0.6397442, 1.653778, 0, 0.4313726, 1, 1,
0.2137174, 1.085204, -0.658176, 0, 0.4235294, 1, 1,
0.2138958, -0.02415494, 1.398267, 0, 0.4196078, 1, 1,
0.2175999, 0.3083378, 0.1719743, 0, 0.4117647, 1, 1,
0.2181958, -0.88466, 2.763582, 0, 0.4078431, 1, 1,
0.2182946, 0.5428168, 0.5176136, 0, 0.4, 1, 1,
0.2200664, 1.095591, -0.5941988, 0, 0.3921569, 1, 1,
0.2204698, -0.2612594, 0.5050552, 0, 0.3882353, 1, 1,
0.2225826, 1.769077, -0.3881682, 0, 0.3803922, 1, 1,
0.2328204, 0.9350619, -0.08231893, 0, 0.3764706, 1, 1,
0.2465025, 1.322849, -0.4450454, 0, 0.3686275, 1, 1,
0.2468153, -0.0700259, 2.340246, 0, 0.3647059, 1, 1,
0.2499359, 0.2854787, -0.3579004, 0, 0.3568628, 1, 1,
0.2503107, 0.3108276, 1.48108, 0, 0.3529412, 1, 1,
0.2540904, -0.7511125, 4.544156, 0, 0.345098, 1, 1,
0.2555105, 0.7419636, 1.259257, 0, 0.3411765, 1, 1,
0.2556566, 0.2430325, 0.3708051, 0, 0.3333333, 1, 1,
0.2557668, 1.707396, 0.09034612, 0, 0.3294118, 1, 1,
0.2582557, -0.02582452, 1.888719, 0, 0.3215686, 1, 1,
0.258506, -0.7602872, 3.068609, 0, 0.3176471, 1, 1,
0.2642835, -2.875679, 2.184886, 0, 0.3098039, 1, 1,
0.2653719, 0.03397853, -0.5399167, 0, 0.3058824, 1, 1,
0.2671627, -1.149567, 1.914773, 0, 0.2980392, 1, 1,
0.2679139, 0.6784225, 0.9888334, 0, 0.2901961, 1, 1,
0.2765482, 0.4593425, -0.4266027, 0, 0.2862745, 1, 1,
0.2771897, -0.6552334, 3.29777, 0, 0.2784314, 1, 1,
0.2773718, -0.3559446, 3.943276, 0, 0.2745098, 1, 1,
0.2783237, -0.2452088, 2.52686, 0, 0.2666667, 1, 1,
0.2785259, -0.2997985, 2.036549, 0, 0.2627451, 1, 1,
0.2843357, -0.1432211, 0.7425966, 0, 0.254902, 1, 1,
0.2862796, -1.219598, 1.016443, 0, 0.2509804, 1, 1,
0.2877891, 0.5656148, 0.07606322, 0, 0.2431373, 1, 1,
0.2895752, 0.2129725, -0.2905419, 0, 0.2392157, 1, 1,
0.2916533, 0.2982989, 3.711222, 0, 0.2313726, 1, 1,
0.2919919, 0.8927467, 1.034402, 0, 0.227451, 1, 1,
0.293272, 1.661163, 0.8041477, 0, 0.2196078, 1, 1,
0.2955729, 0.1101317, 1.942768, 0, 0.2156863, 1, 1,
0.2984247, 1.092043, -0.06822312, 0, 0.2078431, 1, 1,
0.300065, 0.3975122, 0.9714221, 0, 0.2039216, 1, 1,
0.3035489, -0.3745103, 2.326497, 0, 0.1960784, 1, 1,
0.3036621, -0.9436642, 2.835574, 0, 0.1882353, 1, 1,
0.305542, -1.199591, 3.171416, 0, 0.1843137, 1, 1,
0.306775, 0.03789529, 3.102873, 0, 0.1764706, 1, 1,
0.3093623, 1.21304, 0.04943032, 0, 0.172549, 1, 1,
0.3126646, 1.338723, 0.1259312, 0, 0.1647059, 1, 1,
0.3146021, 1.310962, -0.5541181, 0, 0.1607843, 1, 1,
0.3253066, 0.395876, 2.55749, 0, 0.1529412, 1, 1,
0.3279668, -2.154091, 2.881093, 0, 0.1490196, 1, 1,
0.3281352, -0.2515631, 1.107618, 0, 0.1411765, 1, 1,
0.3287047, -0.3275761, 1.272813, 0, 0.1372549, 1, 1,
0.3330024, -0.1526967, 2.333451, 0, 0.1294118, 1, 1,
0.335091, 1.438219, -0.4729294, 0, 0.1254902, 1, 1,
0.3377202, -0.7007322, 1.546734, 0, 0.1176471, 1, 1,
0.3388382, 0.6583382, -0.2076536, 0, 0.1137255, 1, 1,
0.3392074, -0.006536013, 2.262733, 0, 0.1058824, 1, 1,
0.3487712, 0.3458751, 1.986725, 0, 0.09803922, 1, 1,
0.3492912, 1.392086, -0.6140522, 0, 0.09411765, 1, 1,
0.3540888, -0.4234955, 1.38291, 0, 0.08627451, 1, 1,
0.3560901, -1.309905, 4.133746, 0, 0.08235294, 1, 1,
0.358889, -0.5213667, 2.258845, 0, 0.07450981, 1, 1,
0.36479, -0.5902618, 4.375937, 0, 0.07058824, 1, 1,
0.3649424, -1.629734, 3.247751, 0, 0.0627451, 1, 1,
0.3663269, -1.351409, 1.733696, 0, 0.05882353, 1, 1,
0.3663881, 0.3393523, -0.4628048, 0, 0.05098039, 1, 1,
0.3666809, 1.212605, -0.5692598, 0, 0.04705882, 1, 1,
0.3673984, -2.052985, 4.419762, 0, 0.03921569, 1, 1,
0.3688737, -1.007794, 2.164387, 0, 0.03529412, 1, 1,
0.3727219, -0.5781803, 4.563395, 0, 0.02745098, 1, 1,
0.374, 0.5799852, 1.708375, 0, 0.02352941, 1, 1,
0.3755966, 0.0534719, 0.3770376, 0, 0.01568628, 1, 1,
0.3803351, -0.08922411, 2.433025, 0, 0.01176471, 1, 1,
0.3812056, -0.939734, 4.065707, 0, 0.003921569, 1, 1,
0.3830757, -0.2086534, 1.038498, 0.003921569, 0, 1, 1,
0.3852066, 0.7460418, 1.114196, 0.007843138, 0, 1, 1,
0.3913167, 0.4333058, 3.716232, 0.01568628, 0, 1, 1,
0.3946516, 0.628545, 1.299988, 0.01960784, 0, 1, 1,
0.3948052, 0.9325133, 1.096829, 0.02745098, 0, 1, 1,
0.4039164, -0.9378036, 3.169249, 0.03137255, 0, 1, 1,
0.4064308, -1.371164, 4.206341, 0.03921569, 0, 1, 1,
0.4066447, -2.482226, 3.322369, 0.04313726, 0, 1, 1,
0.4155598, -0.397295, 2.118178, 0.05098039, 0, 1, 1,
0.4191285, -0.787746, 1.660304, 0.05490196, 0, 1, 1,
0.4216008, 0.7610984, 1.275812, 0.0627451, 0, 1, 1,
0.426985, 0.3998915, 1.439944, 0.06666667, 0, 1, 1,
0.4300971, 0.179599, 0.8374353, 0.07450981, 0, 1, 1,
0.4338456, -0.2682995, 2.978184, 0.07843138, 0, 1, 1,
0.4359156, 2.249995, 0.01398322, 0.08627451, 0, 1, 1,
0.4380898, 1.010565, 1.571872, 0.09019608, 0, 1, 1,
0.4404535, 0.7546835, 0.2341029, 0.09803922, 0, 1, 1,
0.4430167, 1.915197, 1.072339, 0.1058824, 0, 1, 1,
0.4438188, 0.4953334, 1.482683, 0.1098039, 0, 1, 1,
0.4464805, 1.684335, 1.766274, 0.1176471, 0, 1, 1,
0.4488572, -0.2256051, 1.982997, 0.1215686, 0, 1, 1,
0.4515531, 0.1688694, 0.3924631, 0.1294118, 0, 1, 1,
0.4523773, -0.6562402, 1.852712, 0.1333333, 0, 1, 1,
0.4527503, 1.059543, 0.2350613, 0.1411765, 0, 1, 1,
0.4555512, 1.076363, -1.105655, 0.145098, 0, 1, 1,
0.459911, -0.2395998, 1.977219, 0.1529412, 0, 1, 1,
0.4609675, -0.5665268, 3.452889, 0.1568628, 0, 1, 1,
0.462794, 1.100141, -0.1616622, 0.1647059, 0, 1, 1,
0.4632653, -0.5755771, 3.108547, 0.1686275, 0, 1, 1,
0.464166, 0.3649251, -0.7904319, 0.1764706, 0, 1, 1,
0.4642152, 0.3599544, -0.4634035, 0.1803922, 0, 1, 1,
0.4644488, 1.080281, -0.4984356, 0.1882353, 0, 1, 1,
0.4644875, -0.01562479, 2.585536, 0.1921569, 0, 1, 1,
0.4677944, -0.07834703, 0.6091987, 0.2, 0, 1, 1,
0.4698985, 0.4513707, 0.9241002, 0.2078431, 0, 1, 1,
0.4781228, -1.280609, 1.962803, 0.2117647, 0, 1, 1,
0.4789676, 0.7009517, 0.7869228, 0.2196078, 0, 1, 1,
0.4853766, 0.2402071, 1.319301, 0.2235294, 0, 1, 1,
0.4949897, 0.1815056, 1.21419, 0.2313726, 0, 1, 1,
0.4965945, -0.4948231, 3.694863, 0.2352941, 0, 1, 1,
0.5012326, -0.5965174, 0.2585358, 0.2431373, 0, 1, 1,
0.5036047, 0.3953169, 1.819584, 0.2470588, 0, 1, 1,
0.5039189, -2.140805, 3.364839, 0.254902, 0, 1, 1,
0.5042212, -0.6649625, 3.606134, 0.2588235, 0, 1, 1,
0.5100592, -0.7437242, 3.849324, 0.2666667, 0, 1, 1,
0.5115107, -0.4444577, 2.672458, 0.2705882, 0, 1, 1,
0.5192502, 1.301062, 0.3943073, 0.2784314, 0, 1, 1,
0.5298744, 1.023895, -1.735201, 0.282353, 0, 1, 1,
0.5312845, 0.7001363, 1.960493, 0.2901961, 0, 1, 1,
0.5320241, 0.02177702, 1.25206, 0.2941177, 0, 1, 1,
0.5328622, -0.5331476, 3.486253, 0.3019608, 0, 1, 1,
0.5332141, 1.155129, 0.5772468, 0.3098039, 0, 1, 1,
0.5406139, 0.04479799, 2.20791, 0.3137255, 0, 1, 1,
0.5434602, -1.297478, 4.719501, 0.3215686, 0, 1, 1,
0.5471828, 2.339169, -1.947651, 0.3254902, 0, 1, 1,
0.5473858, 0.2480362, 0.8122103, 0.3333333, 0, 1, 1,
0.5481525, 0.5019388, 0.08635246, 0.3372549, 0, 1, 1,
0.5541255, -0.1978494, 1.109304, 0.345098, 0, 1, 1,
0.5594254, -0.3017337, 3.118107, 0.3490196, 0, 1, 1,
0.5595002, -0.2536645, 1.346667, 0.3568628, 0, 1, 1,
0.5647658, 0.9346458, -0.02931698, 0.3607843, 0, 1, 1,
0.5773831, 0.4110798, 3.331378, 0.3686275, 0, 1, 1,
0.5809664, 1.365788, 1.188619, 0.372549, 0, 1, 1,
0.5831371, 1.855859, 0.8977689, 0.3803922, 0, 1, 1,
0.5879961, 0.4720224, 1.336806, 0.3843137, 0, 1, 1,
0.5923731, -0.3209255, 3.267518, 0.3921569, 0, 1, 1,
0.5926166, -1.387326, 1.15685, 0.3960784, 0, 1, 1,
0.5996619, 0.4709168, 0.7162442, 0.4039216, 0, 1, 1,
0.6045224, -1.512118, 4.4695, 0.4117647, 0, 1, 1,
0.6057587, -1.222796, 3.554145, 0.4156863, 0, 1, 1,
0.6113282, -1.474486, 1.169703, 0.4235294, 0, 1, 1,
0.6128144, 0.7719143, 0.4088751, 0.427451, 0, 1, 1,
0.6138783, 0.1468094, 2.515848, 0.4352941, 0, 1, 1,
0.6150768, 0.7168998, 0.4042865, 0.4392157, 0, 1, 1,
0.615198, -0.272516, 2.197786, 0.4470588, 0, 1, 1,
0.6201292, 0.3531238, 1.362442, 0.4509804, 0, 1, 1,
0.6205535, 0.0550933, 0.8772728, 0.4588235, 0, 1, 1,
0.6206498, 0.5499718, -0.6697959, 0.4627451, 0, 1, 1,
0.6242682, 1.932387, -0.8952131, 0.4705882, 0, 1, 1,
0.6269287, -0.2027479, 1.188842, 0.4745098, 0, 1, 1,
0.6287684, -0.8278291, 2.549811, 0.4823529, 0, 1, 1,
0.6303771, 0.8149626, 0.4298868, 0.4862745, 0, 1, 1,
0.6343279, 0.4006598, 2.055456, 0.4941176, 0, 1, 1,
0.6358598, 0.8047358, -0.4287249, 0.5019608, 0, 1, 1,
0.6359854, -0.6707927, 1.710317, 0.5058824, 0, 1, 1,
0.6362002, 0.4790282, 0.5893159, 0.5137255, 0, 1, 1,
0.6413638, -0.6136758, 1.145661, 0.5176471, 0, 1, 1,
0.6416259, 0.3272558, 2.49486, 0.5254902, 0, 1, 1,
0.6441678, 0.006997725, 1.337554, 0.5294118, 0, 1, 1,
0.646803, -1.691474, 4.589265, 0.5372549, 0, 1, 1,
0.6479709, 1.673663, -0.4548501, 0.5411765, 0, 1, 1,
0.6490577, -0.4511098, 1.696999, 0.5490196, 0, 1, 1,
0.6504546, 0.3892102, 0.5728264, 0.5529412, 0, 1, 1,
0.6510665, -0.9823808, 1.821764, 0.5607843, 0, 1, 1,
0.6548293, 0.8323821, 0.7782611, 0.5647059, 0, 1, 1,
0.6551023, -0.6577525, 1.851865, 0.572549, 0, 1, 1,
0.6575784, -0.1559305, 0.2298191, 0.5764706, 0, 1, 1,
0.6758111, -0.8415745, 1.891818, 0.5843138, 0, 1, 1,
0.6762321, 2.336895, -0.8697147, 0.5882353, 0, 1, 1,
0.6794994, 0.5949501, 2.475521, 0.5960785, 0, 1, 1,
0.6818888, 0.9116291, 0.6492927, 0.6039216, 0, 1, 1,
0.6871747, 1.51475, 2.795622, 0.6078432, 0, 1, 1,
0.687609, 0.08676233, 1.412142, 0.6156863, 0, 1, 1,
0.6891221, -0.7758788, 1.808681, 0.6196079, 0, 1, 1,
0.6944565, -0.7489991, 2.635933, 0.627451, 0, 1, 1,
0.7062847, -0.04749654, 0.1866754, 0.6313726, 0, 1, 1,
0.7078596, -0.9389865, 2.493991, 0.6392157, 0, 1, 1,
0.7129105, -0.8640951, 3.596871, 0.6431373, 0, 1, 1,
0.7210391, -1.719369, 2.53333, 0.6509804, 0, 1, 1,
0.7253081, 1.501851, 0.5777345, 0.654902, 0, 1, 1,
0.731521, -1.426135, 5.338527, 0.6627451, 0, 1, 1,
0.7361958, -0.2131667, 1.764048, 0.6666667, 0, 1, 1,
0.736575, 1.844692, 2.693691, 0.6745098, 0, 1, 1,
0.7407125, -1.282116, 2.622579, 0.6784314, 0, 1, 1,
0.7504663, -0.6448466, 2.446406, 0.6862745, 0, 1, 1,
0.752564, 1.286358, 1.768951, 0.6901961, 0, 1, 1,
0.7555643, -1.591382, 2.491174, 0.6980392, 0, 1, 1,
0.7589625, -0.2537581, 2.324832, 0.7058824, 0, 1, 1,
0.7624872, 0.673765, 0.9908765, 0.7098039, 0, 1, 1,
0.7763575, -0.3866807, 4.14998, 0.7176471, 0, 1, 1,
0.7792786, -1.832175, 2.945194, 0.7215686, 0, 1, 1,
0.7802269, -0.9025651, 2.292683, 0.7294118, 0, 1, 1,
0.7829294, 1.222906, -1.123984, 0.7333333, 0, 1, 1,
0.7835637, 1.206763, -0.4218915, 0.7411765, 0, 1, 1,
0.7877092, 0.2219511, 1.550428, 0.7450981, 0, 1, 1,
0.7930413, 0.1919358, 2.433726, 0.7529412, 0, 1, 1,
0.7938135, 2.950712, -0.460081, 0.7568628, 0, 1, 1,
0.797215, -0.09365086, 1.289757, 0.7647059, 0, 1, 1,
0.7986013, -2.079989, 4.327392, 0.7686275, 0, 1, 1,
0.7987776, 0.05054221, -0.5042449, 0.7764706, 0, 1, 1,
0.8018906, -0.5377853, 3.939813, 0.7803922, 0, 1, 1,
0.8081536, -0.02299359, 1.147599, 0.7882353, 0, 1, 1,
0.8146828, 0.7941445, 0.3886559, 0.7921569, 0, 1, 1,
0.815459, -1.020923, 3.02797, 0.8, 0, 1, 1,
0.8182315, -1.809512, 2.357325, 0.8078431, 0, 1, 1,
0.822128, 1.231712, 0.5690094, 0.8117647, 0, 1, 1,
0.8222534, -0.06958529, 2.245348, 0.8196079, 0, 1, 1,
0.8241984, -1.71329, 3.249681, 0.8235294, 0, 1, 1,
0.8280883, 0.6810677, -0.954371, 0.8313726, 0, 1, 1,
0.8290436, -0.9208298, 2.511738, 0.8352941, 0, 1, 1,
0.8302895, -1.781001, 3.498672, 0.8431373, 0, 1, 1,
0.8355123, 1.563183, 0.03916859, 0.8470588, 0, 1, 1,
0.8408113, 0.09217981, 1.944149, 0.854902, 0, 1, 1,
0.8468198, 0.03876537, 2.477798, 0.8588235, 0, 1, 1,
0.8507282, -0.5199748, 1.352532, 0.8666667, 0, 1, 1,
0.8602934, 1.641846, 1.515555, 0.8705882, 0, 1, 1,
0.8612963, -1.555104, 1.452791, 0.8784314, 0, 1, 1,
0.8661122, -0.5298649, 1.399372, 0.8823529, 0, 1, 1,
0.8714166, 0.9574329, -0.3396315, 0.8901961, 0, 1, 1,
0.8796715, 0.09620001, 0.4688844, 0.8941177, 0, 1, 1,
0.8801835, -1.720315, 3.442504, 0.9019608, 0, 1, 1,
0.8815642, -0.3022703, 2.045497, 0.9098039, 0, 1, 1,
0.8836009, 0.8160277, -0.2330817, 0.9137255, 0, 1, 1,
0.8862623, -0.0884262, 1.461492, 0.9215686, 0, 1, 1,
0.8948168, -0.04162993, 1.627939, 0.9254902, 0, 1, 1,
0.8953497, 0.06021145, 0.3425472, 0.9333333, 0, 1, 1,
0.8970305, 0.8346916, 0.2764441, 0.9372549, 0, 1, 1,
0.8987579, -0.02459445, -0.6223907, 0.945098, 0, 1, 1,
0.8993137, -0.3195332, 1.148535, 0.9490196, 0, 1, 1,
0.9008818, -0.5544102, 1.833856, 0.9568627, 0, 1, 1,
0.9027103, 0.4383321, 1.801507, 0.9607843, 0, 1, 1,
0.9027976, 1.392792, 0.4997556, 0.9686275, 0, 1, 1,
0.9239362, 0.03123894, 0.5977715, 0.972549, 0, 1, 1,
0.9273649, 0.291855, -0.1712038, 0.9803922, 0, 1, 1,
0.928934, 0.3698634, 0.9292752, 0.9843137, 0, 1, 1,
0.9333288, -2.157468, 2.345267, 0.9921569, 0, 1, 1,
0.9378318, -0.5645368, 0.6936482, 0.9960784, 0, 1, 1,
0.9475127, 1.2574, 1.571313, 1, 0, 0.9960784, 1,
0.949455, 0.6722181, 1.471807, 1, 0, 0.9882353, 1,
0.9523191, -1.421293, 1.436601, 1, 0, 0.9843137, 1,
0.9709734, -0.3698186, 3.030618, 1, 0, 0.9764706, 1,
0.9724227, -1.386528, 1.054261, 1, 0, 0.972549, 1,
0.9749058, 1.668788, 2.042705, 1, 0, 0.9647059, 1,
0.9782434, -0.2403731, 1.491931, 1, 0, 0.9607843, 1,
0.9837704, -0.2310126, 1.007705, 1, 0, 0.9529412, 1,
0.9919518, -0.3318489, 3.46696, 1, 0, 0.9490196, 1,
0.9922339, -0.1142133, 0.3978357, 1, 0, 0.9411765, 1,
0.9927295, -0.4404474, 3.402347, 1, 0, 0.9372549, 1,
0.9942427, 1.040147, 1.406869, 1, 0, 0.9294118, 1,
0.9958897, 1.544546, 1.669305, 1, 0, 0.9254902, 1,
0.9970665, 1.187012, -0.2711867, 1, 0, 0.9176471, 1,
1.004653, -0.781617, 1.631513, 1, 0, 0.9137255, 1,
1.005492, 1.617697, 1.972023, 1, 0, 0.9058824, 1,
1.005565, 0.381105, 1.207646, 1, 0, 0.9019608, 1,
1.013748, 0.2744441, 0.7609341, 1, 0, 0.8941177, 1,
1.019987, -1.807386, 1.939752, 1, 0, 0.8862745, 1,
1.028437, 0.7793768, -1.307358, 1, 0, 0.8823529, 1,
1.03129, -2.302379, 2.107984, 1, 0, 0.8745098, 1,
1.038126, 0.5311509, 0.3907774, 1, 0, 0.8705882, 1,
1.043871, 1.347468, 2.246469, 1, 0, 0.8627451, 1,
1.04566, 1.134052, 1.497375, 1, 0, 0.8588235, 1,
1.053235, -0.5533718, 1.163007, 1, 0, 0.8509804, 1,
1.056377, 0.831713, 0.5444343, 1, 0, 0.8470588, 1,
1.061766, -0.5606826, 2.317528, 1, 0, 0.8392157, 1,
1.064263, -0.04179409, 1.621868, 1, 0, 0.8352941, 1,
1.065674, 0.4309988, 0.4475151, 1, 0, 0.827451, 1,
1.066419, 1.62179, 1.223043, 1, 0, 0.8235294, 1,
1.068051, 0.06142424, 0.3540444, 1, 0, 0.8156863, 1,
1.075939, 0.5017306, 0.159809, 1, 0, 0.8117647, 1,
1.088294, 0.8539295, 1.455979, 1, 0, 0.8039216, 1,
1.090654, -0.6027066, -0.4018254, 1, 0, 0.7960784, 1,
1.095439, -0.2504784, 2.629861, 1, 0, 0.7921569, 1,
1.102169, -0.6695887, 2.814389, 1, 0, 0.7843137, 1,
1.1051, 0.3380298, -1.549147, 1, 0, 0.7803922, 1,
1.107656, 0.4503618, 3.421864, 1, 0, 0.772549, 1,
1.108049, 1.583591, -0.2404718, 1, 0, 0.7686275, 1,
1.108618, -0.9703525, 1.516045, 1, 0, 0.7607843, 1,
1.109672, 0.5511746, 2.219748, 1, 0, 0.7568628, 1,
1.110545, -1.255975, 1.609215, 1, 0, 0.7490196, 1,
1.11129, -0.5663813, 2.944684, 1, 0, 0.7450981, 1,
1.120417, -1.388574, 2.535534, 1, 0, 0.7372549, 1,
1.122921, 0.5406815, -0.1079181, 1, 0, 0.7333333, 1,
1.123041, -0.5790815, 1.902906, 1, 0, 0.7254902, 1,
1.125957, -0.4012815, 2.362974, 1, 0, 0.7215686, 1,
1.139463, 0.6738442, 0.3999932, 1, 0, 0.7137255, 1,
1.14248, -0.7662668, 0.4039931, 1, 0, 0.7098039, 1,
1.144038, 0.1682959, 2.252547, 1, 0, 0.7019608, 1,
1.147881, 1.485974, -1.030521, 1, 0, 0.6941177, 1,
1.149146, -0.9714423, 2.802444, 1, 0, 0.6901961, 1,
1.153825, -1.172973, 4.396734, 1, 0, 0.682353, 1,
1.162399, 0.9105754, 0.8857783, 1, 0, 0.6784314, 1,
1.162643, -1.316078, 1.222718, 1, 0, 0.6705883, 1,
1.166236, -0.5668058, -0.1581639, 1, 0, 0.6666667, 1,
1.168306, -1.025931, 2.959521, 1, 0, 0.6588235, 1,
1.178077, -0.403843, 0.9151192, 1, 0, 0.654902, 1,
1.187081, -0.3532452, 2.473018, 1, 0, 0.6470588, 1,
1.187807, 2.46047, 0.7737257, 1, 0, 0.6431373, 1,
1.189897, 0.02221868, 0.1500412, 1, 0, 0.6352941, 1,
1.19327, -0.8121495, 1.570954, 1, 0, 0.6313726, 1,
1.19342, 1.150345, -0.4344056, 1, 0, 0.6235294, 1,
1.207739, 1.120558, 2.84617, 1, 0, 0.6196079, 1,
1.212411, 0.3192105, 0.8943432, 1, 0, 0.6117647, 1,
1.213329, -0.3535229, 1.85818, 1, 0, 0.6078432, 1,
1.215007, 0.695806, 0.7304261, 1, 0, 0.6, 1,
1.220991, -0.5593808, 1.188012, 1, 0, 0.5921569, 1,
1.221074, 0.9848751, 2.072097, 1, 0, 0.5882353, 1,
1.22441, 0.5096895, 1.612861, 1, 0, 0.5803922, 1,
1.23474, -0.4937647, 1.43985, 1, 0, 0.5764706, 1,
1.241139, -0.5041732, 2.096519, 1, 0, 0.5686275, 1,
1.243979, -0.9017188, 2.597696, 1, 0, 0.5647059, 1,
1.247087, -0.9921528, 2.913458, 1, 0, 0.5568628, 1,
1.249166, 0.2897742, 2.001112, 1, 0, 0.5529412, 1,
1.250384, 0.7404471, 2.121987, 1, 0, 0.5450981, 1,
1.257203, 0.966858, 1.247953, 1, 0, 0.5411765, 1,
1.263542, 0.1240972, 2.211608, 1, 0, 0.5333334, 1,
1.266268, -0.9429343, 2.062446, 1, 0, 0.5294118, 1,
1.26864, -0.290356, 2.571814, 1, 0, 0.5215687, 1,
1.272449, -1.285934, 1.623856, 1, 0, 0.5176471, 1,
1.272876, -0.5628933, 2.557442, 1, 0, 0.509804, 1,
1.280761, -0.4595003, 2.121799, 1, 0, 0.5058824, 1,
1.289676, -0.3263965, 2.29471, 1, 0, 0.4980392, 1,
1.293867, -1.302308, 2.425108, 1, 0, 0.4901961, 1,
1.298485, -0.9288262, 2.309784, 1, 0, 0.4862745, 1,
1.311034, 0.1070804, 0.5178307, 1, 0, 0.4784314, 1,
1.316434, 0.7928105, 1.997346, 1, 0, 0.4745098, 1,
1.317886, 0.05646203, 0.7427759, 1, 0, 0.4666667, 1,
1.320641, 0.9213552, 2.58355, 1, 0, 0.4627451, 1,
1.321941, -1.627242, 2.470509, 1, 0, 0.454902, 1,
1.325278, -1.24265, 2.588982, 1, 0, 0.4509804, 1,
1.32872, 1.469694, -1.425923, 1, 0, 0.4431373, 1,
1.338719, 2.116519, -2.003179, 1, 0, 0.4392157, 1,
1.351217, -0.6641771, 2.165684, 1, 0, 0.4313726, 1,
1.35525, -0.4974277, -1.591506, 1, 0, 0.427451, 1,
1.358849, -0.1951698, 3.203937, 1, 0, 0.4196078, 1,
1.376927, 0.8826014, 0.7604617, 1, 0, 0.4156863, 1,
1.381513, 0.5178005, 1.61023, 1, 0, 0.4078431, 1,
1.391344, 0.7848824, -0.4873682, 1, 0, 0.4039216, 1,
1.391846, -0.8934909, 1.029222, 1, 0, 0.3960784, 1,
1.404161, -0.5959159, 1.608057, 1, 0, 0.3882353, 1,
1.43004, -0.1866026, 1.852609, 1, 0, 0.3843137, 1,
1.431307, -0.5157477, 0.7159985, 1, 0, 0.3764706, 1,
1.437027, -0.1789231, 0.776541, 1, 0, 0.372549, 1,
1.471043, -1.132452, 1.752732, 1, 0, 0.3647059, 1,
1.480789, 0.2132386, 1.889378, 1, 0, 0.3607843, 1,
1.485497, 1.136656, -0.9321719, 1, 0, 0.3529412, 1,
1.48985, -1.081948, 2.311251, 1, 0, 0.3490196, 1,
1.512307, -0.335953, 2.600306, 1, 0, 0.3411765, 1,
1.519282, 0.4257955, 0.3110336, 1, 0, 0.3372549, 1,
1.519317, 0.1987315, 0.5174136, 1, 0, 0.3294118, 1,
1.529197, 1.486658, 1.548838, 1, 0, 0.3254902, 1,
1.532545, -0.5319301, 2.055593, 1, 0, 0.3176471, 1,
1.561188, -0.02893073, 0.4005253, 1, 0, 0.3137255, 1,
1.582922, -0.09116578, 1.706191, 1, 0, 0.3058824, 1,
1.602759, -0.1046767, 0.4149861, 1, 0, 0.2980392, 1,
1.613226, -0.4701294, 0.350146, 1, 0, 0.2941177, 1,
1.620167, 1.146964, 1.044504, 1, 0, 0.2862745, 1,
1.623688, -1.101154, 2.21275, 1, 0, 0.282353, 1,
1.630969, -1.071865, 1.831173, 1, 0, 0.2745098, 1,
1.631363, 0.4461581, 2.683042, 1, 0, 0.2705882, 1,
1.64022, -0.3553022, 0.9162225, 1, 0, 0.2627451, 1,
1.647069, -0.1193287, 1.089523, 1, 0, 0.2588235, 1,
1.652622, 0.3272872, -0.1019699, 1, 0, 0.2509804, 1,
1.658714, -1.069325, 3.011236, 1, 0, 0.2470588, 1,
1.658879, 1.007715, 1.878175, 1, 0, 0.2392157, 1,
1.66943, -0.5520296, 2.454954, 1, 0, 0.2352941, 1,
1.675055, 0.9730043, 0.05388491, 1, 0, 0.227451, 1,
1.687457, 0.748892, 0.7721538, 1, 0, 0.2235294, 1,
1.697511, 2.037065, 0.3434529, 1, 0, 0.2156863, 1,
1.711746, -0.8886433, 1.828859, 1, 0, 0.2117647, 1,
1.714665, 1.133622, 2.48157, 1, 0, 0.2039216, 1,
1.715717, -1.536306, 2.481292, 1, 0, 0.1960784, 1,
1.740513, 0.7842734, 0.3057058, 1, 0, 0.1921569, 1,
1.741961, 0.8663449, 0.7506295, 1, 0, 0.1843137, 1,
1.750679, -0.05544197, 3.612418, 1, 0, 0.1803922, 1,
1.774593, -1.446448, 1.53083, 1, 0, 0.172549, 1,
1.784418, 0.9569484, 1.950709, 1, 0, 0.1686275, 1,
1.786184, 0.2787348, 0.4536015, 1, 0, 0.1607843, 1,
1.840478, 0.667309, 2.520827, 1, 0, 0.1568628, 1,
1.848996, 0.3910551, 0.2849145, 1, 0, 0.1490196, 1,
1.874561, -1.018533, 1.559443, 1, 0, 0.145098, 1,
1.898206, 0.023811, 3.572759, 1, 0, 0.1372549, 1,
1.952574, 1.38688, 1.029903, 1, 0, 0.1333333, 1,
1.963588, 1.042465, 0.7567205, 1, 0, 0.1254902, 1,
1.971324, -0.1306035, 2.412987, 1, 0, 0.1215686, 1,
1.972203, 1.747087, 0.4675689, 1, 0, 0.1137255, 1,
1.99555, -0.7334241, 2.464645, 1, 0, 0.1098039, 1,
2.005382, 0.02783251, 0.5010387, 1, 0, 0.1019608, 1,
2.009696, -0.5151445, 2.121749, 1, 0, 0.09411765, 1,
2.017676, -0.2655406, 2.516657, 1, 0, 0.09019608, 1,
2.02234, 1.229761, 0.1473079, 1, 0, 0.08235294, 1,
2.025895, -0.3873298, 2.121883, 1, 0, 0.07843138, 1,
2.036587, -0.1677313, 2.245373, 1, 0, 0.07058824, 1,
2.064078, -0.858241, 0.7718896, 1, 0, 0.06666667, 1,
2.084617, 0.03768672, 1.812134, 1, 0, 0.05882353, 1,
2.130299, 1.287864, 1.47204, 1, 0, 0.05490196, 1,
2.16077, -1.098524, 2.358899, 1, 0, 0.04705882, 1,
2.24013, 0.4528444, 1.190724, 1, 0, 0.04313726, 1,
2.301095, -1.639781, 2.48177, 1, 0, 0.03529412, 1,
2.404008, 0.512969, 0.5398454, 1, 0, 0.03137255, 1,
2.416629, 0.5281253, 1.894568, 1, 0, 0.02352941, 1,
2.590714, 1.569228, 0.3302223, 1, 0, 0.01960784, 1,
2.942634, 0.9274705, 0.9220574, 1, 0, 0.01176471, 1,
3.000583, 0.6802554, 0.5063102, 1, 0, 0.007843138, 1
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
-0.1586562, -4.94978, -6.958213, 0, -0.5, 0.5, 0.5,
-0.1586562, -4.94978, -6.958213, 1, -0.5, 0.5, 0.5,
-0.1586562, -4.94978, -6.958213, 1, 1.5, 0.5, 0.5,
-0.1586562, -4.94978, -6.958213, 0, 1.5, 0.5, 0.5
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
-4.388878, -0.2515171, -6.958213, 0, -0.5, 0.5, 0.5,
-4.388878, -0.2515171, -6.958213, 1, -0.5, 0.5, 0.5,
-4.388878, -0.2515171, -6.958213, 1, 1.5, 0.5, 0.5,
-4.388878, -0.2515171, -6.958213, 0, 1.5, 0.5, 0.5
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
-4.388878, -4.94978, 0.5525451, 0, -0.5, 0.5, 0.5,
-4.388878, -4.94978, 0.5525451, 1, -0.5, 0.5, 0.5,
-4.388878, -4.94978, 0.5525451, 1, 1.5, 0.5, 0.5,
-4.388878, -4.94978, 0.5525451, 0, 1.5, 0.5, 0.5
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
-3, -3.865566, -5.224961,
3, -3.865566, -5.224961,
-3, -3.865566, -5.224961,
-3, -4.046268, -5.513836,
-2, -3.865566, -5.224961,
-2, -4.046268, -5.513836,
-1, -3.865566, -5.224961,
-1, -4.046268, -5.513836,
0, -3.865566, -5.224961,
0, -4.046268, -5.513836,
1, -3.865566, -5.224961,
1, -4.046268, -5.513836,
2, -3.865566, -5.224961,
2, -4.046268, -5.513836,
3, -3.865566, -5.224961,
3, -4.046268, -5.513836
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
-3, -4.407673, -6.091587, 0, -0.5, 0.5, 0.5,
-3, -4.407673, -6.091587, 1, -0.5, 0.5, 0.5,
-3, -4.407673, -6.091587, 1, 1.5, 0.5, 0.5,
-3, -4.407673, -6.091587, 0, 1.5, 0.5, 0.5,
-2, -4.407673, -6.091587, 0, -0.5, 0.5, 0.5,
-2, -4.407673, -6.091587, 1, -0.5, 0.5, 0.5,
-2, -4.407673, -6.091587, 1, 1.5, 0.5, 0.5,
-2, -4.407673, -6.091587, 0, 1.5, 0.5, 0.5,
-1, -4.407673, -6.091587, 0, -0.5, 0.5, 0.5,
-1, -4.407673, -6.091587, 1, -0.5, 0.5, 0.5,
-1, -4.407673, -6.091587, 1, 1.5, 0.5, 0.5,
-1, -4.407673, -6.091587, 0, 1.5, 0.5, 0.5,
0, -4.407673, -6.091587, 0, -0.5, 0.5, 0.5,
0, -4.407673, -6.091587, 1, -0.5, 0.5, 0.5,
0, -4.407673, -6.091587, 1, 1.5, 0.5, 0.5,
0, -4.407673, -6.091587, 0, 1.5, 0.5, 0.5,
1, -4.407673, -6.091587, 0, -0.5, 0.5, 0.5,
1, -4.407673, -6.091587, 1, -0.5, 0.5, 0.5,
1, -4.407673, -6.091587, 1, 1.5, 0.5, 0.5,
1, -4.407673, -6.091587, 0, 1.5, 0.5, 0.5,
2, -4.407673, -6.091587, 0, -0.5, 0.5, 0.5,
2, -4.407673, -6.091587, 1, -0.5, 0.5, 0.5,
2, -4.407673, -6.091587, 1, 1.5, 0.5, 0.5,
2, -4.407673, -6.091587, 0, 1.5, 0.5, 0.5,
3, -4.407673, -6.091587, 0, -0.5, 0.5, 0.5,
3, -4.407673, -6.091587, 1, -0.5, 0.5, 0.5,
3, -4.407673, -6.091587, 1, 1.5, 0.5, 0.5,
3, -4.407673, -6.091587, 0, 1.5, 0.5, 0.5
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
-3.412673, -2, -5.224961,
-3.412673, 2, -5.224961,
-3.412673, -2, -5.224961,
-3.575374, -2, -5.513836,
-3.412673, 0, -5.224961,
-3.575374, 0, -5.513836,
-3.412673, 2, -5.224961,
-3.575374, 2, -5.513836
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
-3.900775, -2, -6.091587, 0, -0.5, 0.5, 0.5,
-3.900775, -2, -6.091587, 1, -0.5, 0.5, 0.5,
-3.900775, -2, -6.091587, 1, 1.5, 0.5, 0.5,
-3.900775, -2, -6.091587, 0, 1.5, 0.5, 0.5,
-3.900775, 0, -6.091587, 0, -0.5, 0.5, 0.5,
-3.900775, 0, -6.091587, 1, -0.5, 0.5, 0.5,
-3.900775, 0, -6.091587, 1, 1.5, 0.5, 0.5,
-3.900775, 0, -6.091587, 0, 1.5, 0.5, 0.5,
-3.900775, 2, -6.091587, 0, -0.5, 0.5, 0.5,
-3.900775, 2, -6.091587, 1, -0.5, 0.5, 0.5,
-3.900775, 2, -6.091587, 1, 1.5, 0.5, 0.5,
-3.900775, 2, -6.091587, 0, 1.5, 0.5, 0.5
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
-3.412673, -3.865566, -4,
-3.412673, -3.865566, 6,
-3.412673, -3.865566, -4,
-3.575374, -4.046268, -4,
-3.412673, -3.865566, -2,
-3.575374, -4.046268, -2,
-3.412673, -3.865566, 0,
-3.575374, -4.046268, 0,
-3.412673, -3.865566, 2,
-3.575374, -4.046268, 2,
-3.412673, -3.865566, 4,
-3.575374, -4.046268, 4,
-3.412673, -3.865566, 6,
-3.575374, -4.046268, 6
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
-3.900775, -4.407673, -4, 0, -0.5, 0.5, 0.5,
-3.900775, -4.407673, -4, 1, -0.5, 0.5, 0.5,
-3.900775, -4.407673, -4, 1, 1.5, 0.5, 0.5,
-3.900775, -4.407673, -4, 0, 1.5, 0.5, 0.5,
-3.900775, -4.407673, -2, 0, -0.5, 0.5, 0.5,
-3.900775, -4.407673, -2, 1, -0.5, 0.5, 0.5,
-3.900775, -4.407673, -2, 1, 1.5, 0.5, 0.5,
-3.900775, -4.407673, -2, 0, 1.5, 0.5, 0.5,
-3.900775, -4.407673, 0, 0, -0.5, 0.5, 0.5,
-3.900775, -4.407673, 0, 1, -0.5, 0.5, 0.5,
-3.900775, -4.407673, 0, 1, 1.5, 0.5, 0.5,
-3.900775, -4.407673, 0, 0, 1.5, 0.5, 0.5,
-3.900775, -4.407673, 2, 0, -0.5, 0.5, 0.5,
-3.900775, -4.407673, 2, 1, -0.5, 0.5, 0.5,
-3.900775, -4.407673, 2, 1, 1.5, 0.5, 0.5,
-3.900775, -4.407673, 2, 0, 1.5, 0.5, 0.5,
-3.900775, -4.407673, 4, 0, -0.5, 0.5, 0.5,
-3.900775, -4.407673, 4, 1, -0.5, 0.5, 0.5,
-3.900775, -4.407673, 4, 1, 1.5, 0.5, 0.5,
-3.900775, -4.407673, 4, 0, 1.5, 0.5, 0.5,
-3.900775, -4.407673, 6, 0, -0.5, 0.5, 0.5,
-3.900775, -4.407673, 6, 1, -0.5, 0.5, 0.5,
-3.900775, -4.407673, 6, 1, 1.5, 0.5, 0.5,
-3.900775, -4.407673, 6, 0, 1.5, 0.5, 0.5
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
-3.412673, -3.865566, -5.224961,
-3.412673, 3.362532, -5.224961,
-3.412673, -3.865566, 6.330051,
-3.412673, 3.362532, 6.330051,
-3.412673, -3.865566, -5.224961,
-3.412673, -3.865566, 6.330051,
-3.412673, 3.362532, -5.224961,
-3.412673, 3.362532, 6.330051,
-3.412673, -3.865566, -5.224961,
3.09536, -3.865566, -5.224961,
-3.412673, -3.865566, 6.330051,
3.09536, -3.865566, 6.330051,
-3.412673, 3.362532, -5.224961,
3.09536, 3.362532, -5.224961,
-3.412673, 3.362532, 6.330051,
3.09536, 3.362532, 6.330051,
3.09536, -3.865566, -5.224961,
3.09536, 3.362532, -5.224961,
3.09536, -3.865566, 6.330051,
3.09536, 3.362532, 6.330051,
3.09536, -3.865566, -5.224961,
3.09536, -3.865566, 6.330051,
3.09536, 3.362532, -5.224961,
3.09536, 3.362532, 6.330051
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
var radius = 8.06502;
var distance = 35.88218;
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
mvMatrix.translate( 0.1586562, 0.2515171, -0.5525451 );
mvMatrix.scale( 1.339891, 1.206411, 0.7546558 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.88218);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
kinetin<-read.table("kinetin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-kinetin$V2
```

```
## Error in eval(expr, envir, enclos): object 'kinetin' not found
```

```r
y<-kinetin$V3
```

```
## Error in eval(expr, envir, enclos): object 'kinetin' not found
```

```r
z<-kinetin$V4
```

```
## Error in eval(expr, envir, enclos): object 'kinetin' not found
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
-3.317896, -0.8399422, -3.085358, 0, 0, 1, 1, 1,
-3.299121, 0.5069334, -0.05026422, 1, 0, 0, 1, 1,
-2.953491, 0.2877893, -0.4086732, 1, 0, 0, 1, 1,
-2.867202, 0.4807497, -1.848655, 1, 0, 0, 1, 1,
-2.678522, 0.2304656, -2.788649, 1, 0, 0, 1, 1,
-2.527804, 0.5637838, -2.180567, 1, 0, 0, 1, 1,
-2.50685, 0.1270382, -1.508864, 0, 0, 0, 1, 1,
-2.472769, -1.193915, -1.108189, 0, 0, 0, 1, 1,
-2.457536, -0.1243737, -1.146961, 0, 0, 0, 1, 1,
-2.374545, -0.3818833, -2.137747, 0, 0, 0, 1, 1,
-2.29372, 0.3523536, -2.678919, 0, 0, 0, 1, 1,
-2.23874, -1.725162, -2.228749, 0, 0, 0, 1, 1,
-2.237734, -0.5035423, -1.679913, 0, 0, 0, 1, 1,
-2.152931, 0.636346, -0.2156706, 1, 1, 1, 1, 1,
-2.135442, 0.5755782, 0.5181259, 1, 1, 1, 1, 1,
-2.108394, 0.6578667, -2.153797, 1, 1, 1, 1, 1,
-2.100826, -1.699173, -0.9722842, 1, 1, 1, 1, 1,
-2.093682, -1.199, -3.227662, 1, 1, 1, 1, 1,
-2.093645, -0.3902207, -2.203272, 1, 1, 1, 1, 1,
-2.063076, -0.002073553, -2.11012, 1, 1, 1, 1, 1,
-2.060198, 2.853561, 1.4786, 1, 1, 1, 1, 1,
-2.044914, 1.756844, -2.024255, 1, 1, 1, 1, 1,
-2.010855, -0.1969368, -2.205121, 1, 1, 1, 1, 1,
-2.005998, 1.126809, -0.8047065, 1, 1, 1, 1, 1,
-2.005493, -0.9013754, -0.7518647, 1, 1, 1, 1, 1,
-1.983741, -0.7315208, -2.098661, 1, 1, 1, 1, 1,
-1.977549, 1.891851, 0.8435882, 1, 1, 1, 1, 1,
-1.967087, 0.08975943, -2.758877, 1, 1, 1, 1, 1,
-1.952515, 0.6949368, -2.828733, 0, 0, 1, 1, 1,
-1.904455, -1.566215, -2.995609, 1, 0, 0, 1, 1,
-1.901623, -0.5874363, -1.543382, 1, 0, 0, 1, 1,
-1.872223, 1.463545, -0.3966542, 1, 0, 0, 1, 1,
-1.86129, -1.180723, -2.532776, 1, 0, 0, 1, 1,
-1.830045, -1.171051, -2.115658, 1, 0, 0, 1, 1,
-1.789012, 0.5895501, 0.06683935, 0, 0, 0, 1, 1,
-1.786503, -1.593536, 0.5622182, 0, 0, 0, 1, 1,
-1.779395, 0.7032138, -0.033025, 0, 0, 0, 1, 1,
-1.738852, 0.04315175, -1.016379, 0, 0, 0, 1, 1,
-1.737458, -0.4957595, -2.488688, 0, 0, 0, 1, 1,
-1.718959, -0.3822311, -2.100918, 0, 0, 0, 1, 1,
-1.700759, 0.8124642, -1.097821, 0, 0, 0, 1, 1,
-1.699808, -0.2049751, -1.87322, 1, 1, 1, 1, 1,
-1.693995, -0.4198802, -2.131362, 1, 1, 1, 1, 1,
-1.603035, 0.2418173, -3.335283, 1, 1, 1, 1, 1,
-1.594242, 0.001130041, -1.771385, 1, 1, 1, 1, 1,
-1.591789, -1.073574, -1.866413, 1, 1, 1, 1, 1,
-1.57297, 0.5038788, -2.532197, 1, 1, 1, 1, 1,
-1.568785, -0.1856098, -0.3658862, 1, 1, 1, 1, 1,
-1.565556, 2.534185, -0.6216711, 1, 1, 1, 1, 1,
-1.554571, -1.002226, -1.644105, 1, 1, 1, 1, 1,
-1.551255, -1.343779, -1.91033, 1, 1, 1, 1, 1,
-1.544019, -0.1052159, -2.429598, 1, 1, 1, 1, 1,
-1.54218, -0.3518321, -1.642754, 1, 1, 1, 1, 1,
-1.530563, 1.485769, -0.9899561, 1, 1, 1, 1, 1,
-1.524085, -3.760302, -4.323233, 1, 1, 1, 1, 1,
-1.520948, 0.1530351, -0.1993321, 1, 1, 1, 1, 1,
-1.519702, 0.7135872, 0.1387171, 0, 0, 1, 1, 1,
-1.510133, -0.4933475, -2.11923, 1, 0, 0, 1, 1,
-1.500278, 1.022441, -0.6630931, 1, 0, 0, 1, 1,
-1.497057, 0.9230011, -2.14537, 1, 0, 0, 1, 1,
-1.489787, 1.175494, 0.01221183, 1, 0, 0, 1, 1,
-1.489509, -0.8225542, -0.5238251, 1, 0, 0, 1, 1,
-1.473845, -0.3470846, -1.977769, 0, 0, 0, 1, 1,
-1.465858, 0.1796188, -1.679448, 0, 0, 0, 1, 1,
-1.462085, -0.6464506, -0.3599832, 0, 0, 0, 1, 1,
-1.461146, -0.5643215, -1.934008, 0, 0, 0, 1, 1,
-1.460233, -0.8350561, -1.892174, 0, 0, 0, 1, 1,
-1.450892, -0.7182289, -3.335793, 0, 0, 0, 1, 1,
-1.443871, 0.08327191, -1.043548, 0, 0, 0, 1, 1,
-1.442641, 1.035629, -0.6885228, 1, 1, 1, 1, 1,
-1.441829, 0.2646633, -4.057, 1, 1, 1, 1, 1,
-1.439796, -0.6298704, -1.933127, 1, 1, 1, 1, 1,
-1.437897, 0.2595527, -2.172701, 1, 1, 1, 1, 1,
-1.416129, -1.232265, -2.0533, 1, 1, 1, 1, 1,
-1.399295, 1.115524, 0.6143423, 1, 1, 1, 1, 1,
-1.394894, -1.306116, -1.422593, 1, 1, 1, 1, 1,
-1.386949, -0.6604681, -1.89695, 1, 1, 1, 1, 1,
-1.369635, 0.0626507, -1.773733, 1, 1, 1, 1, 1,
-1.3649, -0.07603724, -1.936471, 1, 1, 1, 1, 1,
-1.334296, 0.2888591, -1.055393, 1, 1, 1, 1, 1,
-1.334202, -2.393164, -2.810734, 1, 1, 1, 1, 1,
-1.330034, -0.644664, -1.54926, 1, 1, 1, 1, 1,
-1.324441, -0.4467328, -1.429828, 1, 1, 1, 1, 1,
-1.322376, 1.2381, -1.354483, 1, 1, 1, 1, 1,
-1.316198, 0.8092602, -1.292445, 0, 0, 1, 1, 1,
-1.312367, -0.5950463, -0.8362496, 1, 0, 0, 1, 1,
-1.312057, -0.5843423, -2.70098, 1, 0, 0, 1, 1,
-1.298209, 1.954177, -0.7079623, 1, 0, 0, 1, 1,
-1.286001, 1.585603, 1.314058, 1, 0, 0, 1, 1,
-1.285789, 0.2679155, -1.947368, 1, 0, 0, 1, 1,
-1.282299, -0.4361462, -1.368948, 0, 0, 0, 1, 1,
-1.278324, 0.1437199, -2.874763, 0, 0, 0, 1, 1,
-1.27026, -1.711519, -2.991587, 0, 0, 0, 1, 1,
-1.265709, 1.481554, -0.5305699, 0, 0, 0, 1, 1,
-1.258913, -0.413028, -0.7321492, 0, 0, 0, 1, 1,
-1.246761, -0.4364708, -3.087294, 0, 0, 0, 1, 1,
-1.245747, -1.343242, -3.370883, 0, 0, 0, 1, 1,
-1.245445, 0.6785226, -0.5174835, 1, 1, 1, 1, 1,
-1.23438, -0.2427634, 0.34882, 1, 1, 1, 1, 1,
-1.226878, 0.7931278, -0.9605695, 1, 1, 1, 1, 1,
-1.21884, -2.210742, -2.996166, 1, 1, 1, 1, 1,
-1.214866, -0.07013872, 1.064324, 1, 1, 1, 1, 1,
-1.211677, 1.12488, -0.02618029, 1, 1, 1, 1, 1,
-1.206046, 2.421126, -1.205796, 1, 1, 1, 1, 1,
-1.204591, -0.6607878, -2.890632, 1, 1, 1, 1, 1,
-1.2039, -0.8637736, -0.1267805, 1, 1, 1, 1, 1,
-1.200097, -1.084197, -2.964427, 1, 1, 1, 1, 1,
-1.197316, -1.288015, -2.519021, 1, 1, 1, 1, 1,
-1.192631, -0.130975, -0.2413861, 1, 1, 1, 1, 1,
-1.189288, 1.506812, -0.2310716, 1, 1, 1, 1, 1,
-1.187784, 0.1522781, -2.017616, 1, 1, 1, 1, 1,
-1.171277, 2.444065, -0.1156689, 1, 1, 1, 1, 1,
-1.162202, 0.3619287, -1.759937, 0, 0, 1, 1, 1,
-1.160547, 0.8683684, -0.990761, 1, 0, 0, 1, 1,
-1.150908, -0.1949537, -2.607138, 1, 0, 0, 1, 1,
-1.143164, 0.7624267, -0.3197162, 1, 0, 0, 1, 1,
-1.142384, -0.6636826, -3.260944, 1, 0, 0, 1, 1,
-1.133834, -0.3795525, -3.836823, 1, 0, 0, 1, 1,
-1.127463, -0.8959396, -1.367101, 0, 0, 0, 1, 1,
-1.12473, 0.1387852, -1.656474, 0, 0, 0, 1, 1,
-1.104771, 1.746104, 1.396108, 0, 0, 0, 1, 1,
-1.103837, 0.1322783, -0.9671973, 0, 0, 0, 1, 1,
-1.103596, 1.554234, 0.4339786, 0, 0, 0, 1, 1,
-1.097831, -0.2442743, -1.825256, 0, 0, 0, 1, 1,
-1.096537, -1.516364, -2.372857, 0, 0, 0, 1, 1,
-1.093094, -0.4399536, -2.344954, 1, 1, 1, 1, 1,
-1.076696, -1.578204, -0.9310444, 1, 1, 1, 1, 1,
-1.073082, -0.1833317, -2.862015, 1, 1, 1, 1, 1,
-1.057933, 0.6890671, 0.2722107, 1, 1, 1, 1, 1,
-1.043802, 0.1967882, -1.260485, 1, 1, 1, 1, 1,
-1.041517, -0.4622487, -3.781141, 1, 1, 1, 1, 1,
-1.039028, -0.05307461, -1.75757, 1, 1, 1, 1, 1,
-1.038376, 0.7361758, -1.281005, 1, 1, 1, 1, 1,
-1.037507, 1.413273, -0.2791351, 1, 1, 1, 1, 1,
-1.035475, -0.707534, -1.171238, 1, 1, 1, 1, 1,
-1.032955, -0.1435407, -1.906416, 1, 1, 1, 1, 1,
-1.031593, 1.369916, -0.4285342, 1, 1, 1, 1, 1,
-1.023356, -0.607176, -2.332247, 1, 1, 1, 1, 1,
-1.002948, 1.154291, -1.11427, 1, 1, 1, 1, 1,
-1.0029, 0.9583287, 0.1814426, 1, 1, 1, 1, 1,
-1.000152, -0.335619, -1.370578, 0, 0, 1, 1, 1,
-0.9735551, 0.3081433, 0.293154, 1, 0, 0, 1, 1,
-0.9725834, -0.4346939, -1.667453, 1, 0, 0, 1, 1,
-0.9620444, -0.5942025, -1.916604, 1, 0, 0, 1, 1,
-0.9589823, 0.1839352, -1.82875, 1, 0, 0, 1, 1,
-0.9580072, -0.2668935, -2.57739, 1, 0, 0, 1, 1,
-0.9532582, -0.06168656, -2.049849, 0, 0, 0, 1, 1,
-0.9516169, 0.4470859, -0.3278865, 0, 0, 0, 1, 1,
-0.9472745, -0.2432441, -2.290372, 0, 0, 0, 1, 1,
-0.9385996, -1.142956, -3.320709, 0, 0, 0, 1, 1,
-0.9363616, 0.4448108, -0.7910532, 0, 0, 0, 1, 1,
-0.9211806, 0.9480326, -0.9849336, 0, 0, 0, 1, 1,
-0.9166823, -1.114827, -1.588653, 0, 0, 0, 1, 1,
-0.9161693, 0.4808053, -0.7616082, 1, 1, 1, 1, 1,
-0.9112465, 2.175997, -0.1590492, 1, 1, 1, 1, 1,
-0.9096323, 0.1945215, 0.552113, 1, 1, 1, 1, 1,
-0.9083688, 0.1718576, -1.350734, 1, 1, 1, 1, 1,
-0.9058139, 0.8707954, -1.076111, 1, 1, 1, 1, 1,
-0.9002126, 1.311875, -0.5059907, 1, 1, 1, 1, 1,
-0.8925491, 1.204143, -1.108579, 1, 1, 1, 1, 1,
-0.888837, 0.4702546, -1.016262, 1, 1, 1, 1, 1,
-0.8878917, 0.5081353, -2.216148, 1, 1, 1, 1, 1,
-0.8874254, 2.293002, -0.8085133, 1, 1, 1, 1, 1,
-0.8867161, 1.690719, -1.988453, 1, 1, 1, 1, 1,
-0.8784683, -1.362433, -2.848844, 1, 1, 1, 1, 1,
-0.8757638, 1.480362, -1.969167, 1, 1, 1, 1, 1,
-0.8743175, 1.418235, -2.621441, 1, 1, 1, 1, 1,
-0.8731001, -1.536048, -3.381654, 1, 1, 1, 1, 1,
-0.8720998, 0.1650377, -1.620953, 0, 0, 1, 1, 1,
-0.8700181, 0.1942491, -1.519464, 1, 0, 0, 1, 1,
-0.868558, 0.7732878, 0.2817807, 1, 0, 0, 1, 1,
-0.8617765, -0.9856275, -1.209099, 1, 0, 0, 1, 1,
-0.8528829, 0.6912166, -0.8544473, 1, 0, 0, 1, 1,
-0.8484125, -1.424932, -3.043544, 1, 0, 0, 1, 1,
-0.8479257, 0.09198628, -0.6990049, 0, 0, 0, 1, 1,
-0.8471464, 0.533895, -0.2983681, 0, 0, 0, 1, 1,
-0.8428093, -1.587423, -0.2498985, 0, 0, 0, 1, 1,
-0.8400041, -0.6727696, -2.94912, 0, 0, 0, 1, 1,
-0.8386807, -1.323547, -3.929459, 0, 0, 0, 1, 1,
-0.8369348, 0.1610861, -3.079891, 0, 0, 0, 1, 1,
-0.833881, 1.563655, -1.673784, 0, 0, 0, 1, 1,
-0.8316519, 0.5017344, -2.003347, 1, 1, 1, 1, 1,
-0.8303714, 0.06610911, -2.366243, 1, 1, 1, 1, 1,
-0.8297603, -0.7849314, -1.662199, 1, 1, 1, 1, 1,
-0.8288231, -0.2866009, -1.484952, 1, 1, 1, 1, 1,
-0.8252531, 1.039289, 0.1787551, 1, 1, 1, 1, 1,
-0.8207816, 0.1460718, -0.3665658, 1, 1, 1, 1, 1,
-0.8206998, 0.4298748, 0.878637, 1, 1, 1, 1, 1,
-0.8179457, 0.6396466, 0.6293997, 1, 1, 1, 1, 1,
-0.8137304, 0.6461389, 0.5762941, 1, 1, 1, 1, 1,
-0.8132265, -0.3417082, -2.744436, 1, 1, 1, 1, 1,
-0.8072745, 0.3285836, -0.5618672, 1, 1, 1, 1, 1,
-0.8041058, 0.5294194, -0.5156537, 1, 1, 1, 1, 1,
-0.801145, -1.818943, -2.405011, 1, 1, 1, 1, 1,
-0.8002248, -0.3413662, -2.15478, 1, 1, 1, 1, 1,
-0.8001067, -0.6866903, -3.179324, 1, 1, 1, 1, 1,
-0.7991825, -0.4695134, -2.701958, 0, 0, 1, 1, 1,
-0.7974593, 0.6546354, -1.230756, 1, 0, 0, 1, 1,
-0.7942145, 0.269998, -1.598588, 1, 0, 0, 1, 1,
-0.7933405, 0.448375, -1.282283, 1, 0, 0, 1, 1,
-0.7930458, 1.415534, 0.232336, 1, 0, 0, 1, 1,
-0.7925422, 1.345702, -1.683344, 1, 0, 0, 1, 1,
-0.7908502, 0.4200511, -1.943377, 0, 0, 0, 1, 1,
-0.7871152, 1.178078, -0.9303061, 0, 0, 0, 1, 1,
-0.7867228, -0.1187233, -1.923572, 0, 0, 0, 1, 1,
-0.7814808, 0.6843663, -1.827781, 0, 0, 0, 1, 1,
-0.7757936, -0.5915336, -2.077944, 0, 0, 0, 1, 1,
-0.7755498, -0.09518086, -0.5289337, 0, 0, 0, 1, 1,
-0.7733765, 0.3573856, -2.596709, 0, 0, 0, 1, 1,
-0.7721091, -0.07360166, -1.70037, 1, 1, 1, 1, 1,
-0.7707474, 1.438553, -0.6820957, 1, 1, 1, 1, 1,
-0.7682815, 1.428073, -0.1598712, 1, 1, 1, 1, 1,
-0.7663313, -1.426921, -2.498241, 1, 1, 1, 1, 1,
-0.7650998, 0.3000438, -1.769468, 1, 1, 1, 1, 1,
-0.7602002, -0.01452692, -1.555905, 1, 1, 1, 1, 1,
-0.7596804, -0.0588897, -1.949046, 1, 1, 1, 1, 1,
-0.7516485, -0.1249502, -2.791271, 1, 1, 1, 1, 1,
-0.7515922, -0.3325837, -4.127924, 1, 1, 1, 1, 1,
-0.7464547, 0.2972839, -0.8116618, 1, 1, 1, 1, 1,
-0.7444666, -1.979357, -2.870539, 1, 1, 1, 1, 1,
-0.7419268, -0.5775349, -4.021349, 1, 1, 1, 1, 1,
-0.7354861, 1.105166, -1.090806, 1, 1, 1, 1, 1,
-0.7328897, -0.08440792, -2.35565, 1, 1, 1, 1, 1,
-0.7327163, -0.2855925, -1.883813, 1, 1, 1, 1, 1,
-0.726867, -0.1873023, -0.3378717, 0, 0, 1, 1, 1,
-0.7233347, -1.796979, -3.452187, 1, 0, 0, 1, 1,
-0.7218463, -0.6289793, -2.976224, 1, 0, 0, 1, 1,
-0.7155216, -1.745066, -2.831413, 1, 0, 0, 1, 1,
-0.7145925, 1.606027, -2.982569, 1, 0, 0, 1, 1,
-0.7137402, 0.6418422, 0.01601896, 1, 0, 0, 1, 1,
-0.7105142, -0.1679442, -2.217549, 0, 0, 0, 1, 1,
-0.7097483, -0.5565443, -0.1766132, 0, 0, 0, 1, 1,
-0.7060876, 0.3328501, 0.1180911, 0, 0, 0, 1, 1,
-0.7030704, 0.079891, -2.572059, 0, 0, 0, 1, 1,
-0.7020307, -1.581758, -2.15942, 0, 0, 0, 1, 1,
-0.6826044, 0.9885738, -0.1752889, 0, 0, 0, 1, 1,
-0.6700513, -1.849482, -3.808911, 0, 0, 0, 1, 1,
-0.668808, -1.339811, -3.654727, 1, 1, 1, 1, 1,
-0.6681678, 0.6250957, -2.448974, 1, 1, 1, 1, 1,
-0.6670604, -0.4439765, -2.131299, 1, 1, 1, 1, 1,
-0.6670259, 1.762301, -2.122666, 1, 1, 1, 1, 1,
-0.6618221, -0.6819209, -2.940496, 1, 1, 1, 1, 1,
-0.6586652, 0.8670645, -1.688436, 1, 1, 1, 1, 1,
-0.6563717, 0.1147216, -1.67671, 1, 1, 1, 1, 1,
-0.6551253, 0.7104666, -0.8936514, 1, 1, 1, 1, 1,
-0.6547425, -0.472011, 1.339594, 1, 1, 1, 1, 1,
-0.6546601, -0.1945486, -1.796352, 1, 1, 1, 1, 1,
-0.6517665, 0.5174146, -1.106703, 1, 1, 1, 1, 1,
-0.6515365, -0.728147, -3.29075, 1, 1, 1, 1, 1,
-0.6508232, -0.4314941, -2.871226, 1, 1, 1, 1, 1,
-0.6493315, 1.699962, -0.625623, 1, 1, 1, 1, 1,
-0.648487, -1.622439, -3.683719, 1, 1, 1, 1, 1,
-0.6455283, 0.8363558, -1.910934, 0, 0, 1, 1, 1,
-0.6435389, 0.2600737, -2.378562, 1, 0, 0, 1, 1,
-0.6433901, -0.06566267, -1.996545, 1, 0, 0, 1, 1,
-0.6390454, 1.296935, -2.834575, 1, 0, 0, 1, 1,
-0.6382603, 0.5663171, 2.785106, 1, 0, 0, 1, 1,
-0.6375723, 0.906238, -0.8225185, 1, 0, 0, 1, 1,
-0.6353317, 0.08279229, -1.115803, 0, 0, 0, 1, 1,
-0.6345209, -0.2278434, -1.063912, 0, 0, 0, 1, 1,
-0.6312127, 0.502499, -0.5554758, 0, 0, 0, 1, 1,
-0.6274694, -1.782889, -4.490123, 0, 0, 0, 1, 1,
-0.6268689, 0.4760618, -1.95846, 0, 0, 0, 1, 1,
-0.6236174, -1.582187, -2.296679, 0, 0, 0, 1, 1,
-0.6213715, 0.6200117, -1.888579, 0, 0, 0, 1, 1,
-0.6077178, -1.034856, -3.604007, 1, 1, 1, 1, 1,
-0.5980777, -0.5521629, -1.034128, 1, 1, 1, 1, 1,
-0.5980471, -2.02201, -2.786417, 1, 1, 1, 1, 1,
-0.5974869, -0.3760305, -1.653121, 1, 1, 1, 1, 1,
-0.5921844, 0.5537105, -1.547427, 1, 1, 1, 1, 1,
-0.5874234, -0.6164585, -3.679501, 1, 1, 1, 1, 1,
-0.586459, -1.697534, -1.706921, 1, 1, 1, 1, 1,
-0.5836831, -0.7148178, -1.47765, 1, 1, 1, 1, 1,
-0.5828132, -0.7662424, -0.4601501, 1, 1, 1, 1, 1,
-0.5826334, -0.06301626, -3.14651, 1, 1, 1, 1, 1,
-0.58074, -0.1118485, -0.8579243, 1, 1, 1, 1, 1,
-0.5799437, -0.194128, -1.371873, 1, 1, 1, 1, 1,
-0.576816, -0.6891177, -3.853849, 1, 1, 1, 1, 1,
-0.5696751, -0.6273751, -2.802992, 1, 1, 1, 1, 1,
-0.5643877, 2.928436, 0.4741877, 1, 1, 1, 1, 1,
-0.5637196, 0.6995743, -1.006158, 0, 0, 1, 1, 1,
-0.5618528, -0.3354531, -4.670007, 1, 0, 0, 1, 1,
-0.5558807, -0.5052087, -1.699885, 1, 0, 0, 1, 1,
-0.555304, -0.5762514, 0.2393319, 1, 0, 0, 1, 1,
-0.5524793, 0.117518, -1.760785, 1, 0, 0, 1, 1,
-0.5518989, -0.9231622, -2.01231, 1, 0, 0, 1, 1,
-0.550347, -0.6034454, -2.841735, 0, 0, 0, 1, 1,
-0.5451544, -0.836717, -3.43614, 0, 0, 0, 1, 1,
-0.5443348, -0.4327494, -2.670613, 0, 0, 0, 1, 1,
-0.5434501, 0.0881679, -1.984799, 0, 0, 0, 1, 1,
-0.5380815, -0.07758856, -2.208397, 0, 0, 0, 1, 1,
-0.5344432, -0.6541758, -3.400642, 0, 0, 0, 1, 1,
-0.5342724, 0.4157586, -1.391783, 0, 0, 0, 1, 1,
-0.5333686, -1.01289, -2.788245, 1, 1, 1, 1, 1,
-0.5311239, -0.3629933, -2.146024, 1, 1, 1, 1, 1,
-0.5182534, 0.1316582, -2.312721, 1, 1, 1, 1, 1,
-0.5181421, -0.1067294, -1.217651, 1, 1, 1, 1, 1,
-0.5178479, 0.3590834, -1.92613, 1, 1, 1, 1, 1,
-0.5176018, 2.490151, -0.4078848, 1, 1, 1, 1, 1,
-0.5170671, -0.2175121, -1.665796, 1, 1, 1, 1, 1,
-0.514806, 1.129856, 0.5743402, 1, 1, 1, 1, 1,
-0.5130463, 0.8434366, -3.241049, 1, 1, 1, 1, 1,
-0.5125034, 1.011946, -0.9138443, 1, 1, 1, 1, 1,
-0.5107585, -0.08180635, -0.01677413, 1, 1, 1, 1, 1,
-0.5094134, -0.06315061, -1.899045, 1, 1, 1, 1, 1,
-0.5084089, 0.3605719, 0.7504766, 1, 1, 1, 1, 1,
-0.5075477, -0.08461549, -2.944188, 1, 1, 1, 1, 1,
-0.5067063, -0.6675076, -2.938915, 1, 1, 1, 1, 1,
-0.5054749, 0.2428602, -0.9130514, 0, 0, 1, 1, 1,
-0.5032665, -0.01216223, -1.123512, 1, 0, 0, 1, 1,
-0.4985188, 1.227682, -0.6630002, 1, 0, 0, 1, 1,
-0.4869453, 0.1230429, -0.8440306, 1, 0, 0, 1, 1,
-0.4859089, 1.154862, 1.135079, 1, 0, 0, 1, 1,
-0.4834119, 0.585781, -0.506648, 1, 0, 0, 1, 1,
-0.4808542, -0.6159943, -1.568038, 0, 0, 0, 1, 1,
-0.477764, 2.235626, -0.1221837, 0, 0, 0, 1, 1,
-0.4767953, 1.31721, 0.5919408, 0, 0, 0, 1, 1,
-0.4767119, 0.3283306, -0.8504267, 0, 0, 0, 1, 1,
-0.4759051, -0.1907397, -2.830191, 0, 0, 0, 1, 1,
-0.4716899, -1.949624, -1.634928, 0, 0, 0, 1, 1,
-0.468404, -0.06470456, -0.2962545, 0, 0, 0, 1, 1,
-0.4651856, -1.099297, -2.995782, 1, 1, 1, 1, 1,
-0.4646839, 0.3151534, -1.131393, 1, 1, 1, 1, 1,
-0.4626651, 0.6693206, -0.2964784, 1, 1, 1, 1, 1,
-0.4603564, 1.142038, -0.9689158, 1, 1, 1, 1, 1,
-0.4602181, -1.344267, -2.283741, 1, 1, 1, 1, 1,
-0.4511099, 1.221638, -0.4653471, 1, 1, 1, 1, 1,
-0.448239, 0.9960029, -2.008767, 1, 1, 1, 1, 1,
-0.4460978, 0.03612069, -1.795359, 1, 1, 1, 1, 1,
-0.4437868, 0.8424885, -2.411668, 1, 1, 1, 1, 1,
-0.4431451, 0.4757307, -1.605446, 1, 1, 1, 1, 1,
-0.4430815, 0.1857206, -0.8674751, 1, 1, 1, 1, 1,
-0.4424823, -1.485859, -1.768004, 1, 1, 1, 1, 1,
-0.4391547, -1.188732, -4.41176, 1, 1, 1, 1, 1,
-0.4372902, -0.7574844, -4.534189, 1, 1, 1, 1, 1,
-0.4273199, -0.8765469, -3.308722, 1, 1, 1, 1, 1,
-0.4246667, -0.4357914, -1.719759, 0, 0, 1, 1, 1,
-0.4237359, 1.462299, -0.4576587, 1, 0, 0, 1, 1,
-0.4180123, -0.4755616, -3.004624, 1, 0, 0, 1, 1,
-0.4168649, 1.121622, -0.8902056, 1, 0, 0, 1, 1,
-0.4144528, -1.932702, -2.358891, 1, 0, 0, 1, 1,
-0.4094867, -1.651951, -2.47332, 1, 0, 0, 1, 1,
-0.4073429, 0.3876179, 1.171619, 0, 0, 0, 1, 1,
-0.3976766, -2.528877, -2.686094, 0, 0, 0, 1, 1,
-0.3942515, -0.08483817, -1.896004, 0, 0, 0, 1, 1,
-0.3912548, -0.4612769, -2.078432, 0, 0, 0, 1, 1,
-0.3891307, 0.2170985, -2.029799, 0, 0, 0, 1, 1,
-0.3876584, 2.327421, -0.9633385, 0, 0, 0, 1, 1,
-0.3833913, 0.16368, -0.4653712, 0, 0, 0, 1, 1,
-0.3781478, 0.5958984, -1.177458, 1, 1, 1, 1, 1,
-0.3766998, -0.2376316, -1.143108, 1, 1, 1, 1, 1,
-0.3763322, -0.4776661, -1.384307, 1, 1, 1, 1, 1,
-0.374123, 1.297066, 0.5718764, 1, 1, 1, 1, 1,
-0.3736184, -0.3423175, -3.912301, 1, 1, 1, 1, 1,
-0.3733626, 0.08415764, -1.408553, 1, 1, 1, 1, 1,
-0.3684938, -1.40973, -0.6397232, 1, 1, 1, 1, 1,
-0.3665912, 0.0575163, -0.3258188, 1, 1, 1, 1, 1,
-0.3642472, -0.263317, -3.588958, 1, 1, 1, 1, 1,
-0.3623856, -0.1874087, -3.229948, 1, 1, 1, 1, 1,
-0.3479157, -1.904054, -3.939171, 1, 1, 1, 1, 1,
-0.3447643, 0.349684, -1.422285, 1, 1, 1, 1, 1,
-0.3441023, 0.08874013, -1.405629, 1, 1, 1, 1, 1,
-0.3430038, -0.5362461, -2.778962, 1, 1, 1, 1, 1,
-0.3429547, 0.6270007, -0.3285788, 1, 1, 1, 1, 1,
-0.3357662, -0.2573952, -2.903217, 0, 0, 1, 1, 1,
-0.3341861, -0.7056987, -1.954094, 1, 0, 0, 1, 1,
-0.3327921, 1.441676, -0.7556199, 1, 0, 0, 1, 1,
-0.3291838, -0.9510154, -3.538965, 1, 0, 0, 1, 1,
-0.3259889, -0.1624193, -1.688256, 1, 0, 0, 1, 1,
-0.3219696, -1.917771, -2.583322, 1, 0, 0, 1, 1,
-0.3145133, 0.093146, -2.055918, 0, 0, 0, 1, 1,
-0.3119037, 1.376546, -1.758883, 0, 0, 0, 1, 1,
-0.3098141, -0.09716521, -2.608367, 0, 0, 0, 1, 1,
-0.3057587, -1.656817, -3.214546, 0, 0, 0, 1, 1,
-0.3049255, 0.2112512, -0.3638635, 0, 0, 0, 1, 1,
-0.3043904, 0.525382, -1.10051, 0, 0, 0, 1, 1,
-0.3011778, -2.854003, -3.090811, 0, 0, 0, 1, 1,
-0.3003403, 0.2952508, 0.1026602, 1, 1, 1, 1, 1,
-0.2997833, -0.9595966, -1.027139, 1, 1, 1, 1, 1,
-0.2980178, -1.056179, -1.689313, 1, 1, 1, 1, 1,
-0.29778, 0.6108275, -1.256623, 1, 1, 1, 1, 1,
-0.2952507, 0.388537, -0.7727327, 1, 1, 1, 1, 1,
-0.2943213, 0.1417456, -1.424406, 1, 1, 1, 1, 1,
-0.2906769, 0.02300637, -2.677294, 1, 1, 1, 1, 1,
-0.2894369, 1.662057, -0.5339023, 1, 1, 1, 1, 1,
-0.2858587, 1.13341, 0.3863964, 1, 1, 1, 1, 1,
-0.2818773, 0.6428512, -0.9269305, 1, 1, 1, 1, 1,
-0.2800891, 0.2870157, -0.3600006, 1, 1, 1, 1, 1,
-0.2790578, 0.3303009, -0.265203, 1, 1, 1, 1, 1,
-0.2787821, 0.540522, -0.2805069, 1, 1, 1, 1, 1,
-0.2756161, -0.5898666, -2.246255, 1, 1, 1, 1, 1,
-0.2746193, -2.012857, -1.964491, 1, 1, 1, 1, 1,
-0.2728235, -0.01478483, -1.222193, 0, 0, 1, 1, 1,
-0.2703306, -0.6690832, -2.623497, 1, 0, 0, 1, 1,
-0.2690134, -0.1306003, -1.593297, 1, 0, 0, 1, 1,
-0.2668788, 0.1637677, -1.529082, 1, 0, 0, 1, 1,
-0.2645842, 2.932718, 1.932942, 1, 0, 0, 1, 1,
-0.260031, 0.2626399, -3.18907, 1, 0, 0, 1, 1,
-0.2592739, 1.343732, -1.165991, 0, 0, 0, 1, 1,
-0.257771, 0.8196195, -0.428483, 0, 0, 0, 1, 1,
-0.2567419, -1.280701, -4.580217, 0, 0, 0, 1, 1,
-0.254771, 0.8287027, -1.001654, 0, 0, 0, 1, 1,
-0.2546649, 1.019551, -1.229554, 0, 0, 0, 1, 1,
-0.2546575, -0.6938625, -2.391577, 0, 0, 0, 1, 1,
-0.2499822, 1.360268, -0.123975, 0, 0, 0, 1, 1,
-0.2468718, -1.217478, -3.629378, 1, 1, 1, 1, 1,
-0.2461234, 0.8069084, -0.07424845, 1, 1, 1, 1, 1,
-0.242394, 0.9694523, -0.9191512, 1, 1, 1, 1, 1,
-0.2422824, 0.6317962, -1.079839, 1, 1, 1, 1, 1,
-0.2412436, -0.9053926, -2.75223, 1, 1, 1, 1, 1,
-0.2380634, 1.462412, -0.8503127, 1, 1, 1, 1, 1,
-0.2349363, 0.3699756, -1.607916, 1, 1, 1, 1, 1,
-0.2278246, -0.5879245, -2.34363, 1, 1, 1, 1, 1,
-0.2231071, -1.422032, -2.393031, 1, 1, 1, 1, 1,
-0.2176159, 0.5362632, -0.7564389, 1, 1, 1, 1, 1,
-0.2121425, 0.3424382, 0.3671358, 1, 1, 1, 1, 1,
-0.2109915, -0.5068462, -2.66473, 1, 1, 1, 1, 1,
-0.206068, 1.099113, 0.1753655, 1, 1, 1, 1, 1,
-0.2058551, -1.506223, -2.335214, 1, 1, 1, 1, 1,
-0.2042178, -1.418268, -4.704563, 1, 1, 1, 1, 1,
-0.2031439, -2.54778, -1.560206, 0, 0, 1, 1, 1,
-0.2023299, -0.1284941, -1.53425, 1, 0, 0, 1, 1,
-0.2007313, 0.6415433, -1.554072, 1, 0, 0, 1, 1,
-0.2003361, -0.02845898, -1.40633, 1, 0, 0, 1, 1,
-0.1978573, 0.3994628, -0.6619962, 1, 0, 0, 1, 1,
-0.1953508, 0.3461958, -0.9778728, 1, 0, 0, 1, 1,
-0.1934064, 1.491456, 0.2385491, 0, 0, 0, 1, 1,
-0.1887891, 0.2453688, 0.3646845, 0, 0, 0, 1, 1,
-0.188404, 0.2548555, -0.8592871, 0, 0, 0, 1, 1,
-0.1813881, 0.6320419, 0.1479469, 0, 0, 0, 1, 1,
-0.17872, 0.6304969, 0.05265236, 0, 0, 0, 1, 1,
-0.1784401, 1.088374, -0.3750476, 0, 0, 0, 1, 1,
-0.1761887, 1.195055, 1.176621, 0, 0, 0, 1, 1,
-0.1721272, -0.7732691, -4.539895, 1, 1, 1, 1, 1,
-0.167589, 0.3612816, -1.041605, 1, 1, 1, 1, 1,
-0.1657316, -1.279478, -5.056684, 1, 1, 1, 1, 1,
-0.1637787, 1.006833, -0.08896799, 1, 1, 1, 1, 1,
-0.1631176, -0.8581017, -2.118366, 1, 1, 1, 1, 1,
-0.1603507, -0.4771921, -2.978074, 1, 1, 1, 1, 1,
-0.1566322, 1.325633, 0.789832, 1, 1, 1, 1, 1,
-0.1558902, -1.251605, -2.559345, 1, 1, 1, 1, 1,
-0.1554133, 0.4538121, 1.17649, 1, 1, 1, 1, 1,
-0.1529272, 0.5059278, -1.400274, 1, 1, 1, 1, 1,
-0.1523832, -2.451356, -3.513876, 1, 1, 1, 1, 1,
-0.1512886, 0.5994938, -0.7730332, 1, 1, 1, 1, 1,
-0.1465304, -0.7898428, -3.197807, 1, 1, 1, 1, 1,
-0.1428545, -0.4818214, -2.898296, 1, 1, 1, 1, 1,
-0.1420575, -0.369255, -2.853593, 1, 1, 1, 1, 1,
-0.1418228, 1.465203, -0.9376256, 0, 0, 1, 1, 1,
-0.1334236, -0.220838, -3.086031, 1, 0, 0, 1, 1,
-0.1302017, 1.53647, 0.1040239, 1, 0, 0, 1, 1,
-0.1261834, 2.216254, -0.9131525, 1, 0, 0, 1, 1,
-0.1255956, -0.2368227, -2.089144, 1, 0, 0, 1, 1,
-0.1255262, -2.243256, -0.4666855, 1, 0, 0, 1, 1,
-0.124359, 0.06141808, -1.454196, 0, 0, 0, 1, 1,
-0.1238202, -1.783312, -3.504038, 0, 0, 0, 1, 1,
-0.1210022, -1.461239, -1.712631, 0, 0, 0, 1, 1,
-0.1200783, -1.1877, -3.219598, 0, 0, 0, 1, 1,
-0.1187262, 0.03740392, -0.2069667, 0, 0, 0, 1, 1,
-0.1171702, -0.4118225, -2.153741, 0, 0, 0, 1, 1,
-0.1103135, 1.474924, -1.299903, 0, 0, 0, 1, 1,
-0.1102413, -1.647462, -4.13784, 1, 1, 1, 1, 1,
-0.1096045, 0.2284678, -0.7018662, 1, 1, 1, 1, 1,
-0.1050483, 1.743429, 1.21112, 1, 1, 1, 1, 1,
-0.1043924, -0.7917928, -1.226732, 1, 1, 1, 1, 1,
-0.1034864, -0.405578, -4.294753, 1, 1, 1, 1, 1,
-0.1005129, 1.079425, 1.42019, 1, 1, 1, 1, 1,
-0.09905472, -0.27521, -3.942522, 1, 1, 1, 1, 1,
-0.09881886, -0.2415859, -4.162965, 1, 1, 1, 1, 1,
-0.09568571, -1.827894, -2.617746, 1, 1, 1, 1, 1,
-0.09432387, -0.004526405, -1.054654, 1, 1, 1, 1, 1,
-0.09393125, -0.7318445, -2.955034, 1, 1, 1, 1, 1,
-0.09170095, -2.131713, -2.583794, 1, 1, 1, 1, 1,
-0.08408827, 0.3623617, -0.4875256, 1, 1, 1, 1, 1,
-0.08340377, -0.7397513, -2.120523, 1, 1, 1, 1, 1,
-0.08147226, 0.985203, 0.2597578, 1, 1, 1, 1, 1,
-0.08073964, -1.155777, -3.020757, 0, 0, 1, 1, 1,
-0.07570034, 0.5759961, 1.424933, 1, 0, 0, 1, 1,
-0.07539336, -0.7024156, -0.5579334, 1, 0, 0, 1, 1,
-0.0748662, 0.3994403, 0.9702413, 1, 0, 0, 1, 1,
-0.07300474, 1.158455, -1.901528, 1, 0, 0, 1, 1,
-0.07228609, 0.5864617, -1.38025, 1, 0, 0, 1, 1,
-0.07020661, 1.469435, 0.3053631, 0, 0, 0, 1, 1,
-0.06554396, 0.3390379, 0.1291374, 0, 0, 0, 1, 1,
-0.06497576, 0.2938365, -0.570355, 0, 0, 0, 1, 1,
-0.06412905, -1.123736, -2.333167, 0, 0, 0, 1, 1,
-0.06256012, 1.133024, -0.3872291, 0, 0, 0, 1, 1,
-0.0610658, 1.034314, 0.4883869, 0, 0, 0, 1, 1,
-0.05817383, 0.7662486, -0.6920863, 0, 0, 0, 1, 1,
-0.05415359, 0.0257317, -1.062471, 1, 1, 1, 1, 1,
-0.04369, -0.6893856, -2.251534, 1, 1, 1, 1, 1,
-0.04329783, -0.7344407, -2.433197, 1, 1, 1, 1, 1,
-0.04159638, -0.7897372, -2.596559, 1, 1, 1, 1, 1,
-0.04090958, -0.1440554, -2.182893, 1, 1, 1, 1, 1,
-0.04043916, -1.90584, -2.108346, 1, 1, 1, 1, 1,
-0.04025654, -1.238159, -4.967689, 1, 1, 1, 1, 1,
-0.03508637, -0.2882767, -2.631467, 1, 1, 1, 1, 1,
-0.03506, 0.04324433, 0.979598, 1, 1, 1, 1, 1,
-0.0339621, -0.6298527, -1.652194, 1, 1, 1, 1, 1,
-0.03330032, 1.251205, 0.9688386, 1, 1, 1, 1, 1,
-0.0330659, 0.2453635, 0.326867, 1, 1, 1, 1, 1,
-0.0329495, 0.3084918, 2.125844, 1, 1, 1, 1, 1,
-0.03101423, 2.383324, -0.1123818, 1, 1, 1, 1, 1,
-0.030406, -0.732676, -2.826155, 1, 1, 1, 1, 1,
-0.03034864, -0.2194939, -2.100598, 0, 0, 1, 1, 1,
-0.01768572, -1.648095, -1.896737, 1, 0, 0, 1, 1,
-0.008003199, 0.8402382, 1.061226, 1, 0, 0, 1, 1,
-0.007675579, 0.9554554, -0.5778257, 1, 0, 0, 1, 1,
-0.006782531, -0.1322408, -3.985203, 1, 0, 0, 1, 1,
-0.002855271, 0.7622237, 2.916932, 1, 0, 0, 1, 1,
-0.002618221, 2.124189, 0.2886718, 0, 0, 0, 1, 1,
-0.001116928, -1.945947e-05, -2.152901, 0, 0, 0, 1, 1,
0.0002461013, -1.048803, 3.978751, 0, 0, 0, 1, 1,
0.002336574, -0.6301312, 1.701651, 0, 0, 0, 1, 1,
0.009566208, -1.965486, 2.939228, 0, 0, 0, 1, 1,
0.009650689, 0.3926565, -1.296829, 0, 0, 0, 1, 1,
0.01117158, 0.7454634, -0.1840316, 0, 0, 0, 1, 1,
0.01727957, -0.5758762, 6.161774, 1, 1, 1, 1, 1,
0.01782599, 0.2911282, -0.3808848, 1, 1, 1, 1, 1,
0.01822625, 0.8690001, 1.378496, 1, 1, 1, 1, 1,
0.01955237, 1.016756, -0.2133013, 1, 1, 1, 1, 1,
0.02066888, 0.1360177, -0.9852103, 1, 1, 1, 1, 1,
0.02183057, 2.223148, -0.7551412, 1, 1, 1, 1, 1,
0.02463465, -0.3361836, 4.158644, 1, 1, 1, 1, 1,
0.02472365, -1.644109, 3.399774, 1, 1, 1, 1, 1,
0.03433307, -0.195124, 2.883934, 1, 1, 1, 1, 1,
0.04433756, -0.5156301, 2.728563, 1, 1, 1, 1, 1,
0.04910451, 0.8524346, -0.5048371, 1, 1, 1, 1, 1,
0.0512371, 0.5418441, 0.2631165, 1, 1, 1, 1, 1,
0.05130741, 0.4357106, -0.1631848, 1, 1, 1, 1, 1,
0.05316261, -0.7909914, 4.089457, 1, 1, 1, 1, 1,
0.05592712, -0.7507362, 3.612604, 1, 1, 1, 1, 1,
0.05765186, -0.05366135, 3.011456, 0, 0, 1, 1, 1,
0.05842317, 0.315966, -0.7943547, 1, 0, 0, 1, 1,
0.06216831, -0.5534579, 3.741538, 1, 0, 0, 1, 1,
0.06275338, -0.7743062, 4.874241, 1, 0, 0, 1, 1,
0.06846809, -0.02091503, 1.623859, 1, 0, 0, 1, 1,
0.06941109, 1.753265, 0.08635667, 1, 0, 0, 1, 1,
0.07608879, -0.3870933, 2.552253, 0, 0, 0, 1, 1,
0.07837532, 0.1284862, 1.693145, 0, 0, 0, 1, 1,
0.07906163, -1.087667, 3.358291, 0, 0, 0, 1, 1,
0.08035151, 0.1822629, 1.308908, 0, 0, 0, 1, 1,
0.08620362, 1.632165, -0.4162884, 0, 0, 0, 1, 1,
0.08779372, 0.3972645, 0.1162674, 0, 0, 0, 1, 1,
0.08931196, 0.3942078, -0.1438875, 0, 0, 0, 1, 1,
0.09013933, 0.829652, 0.3836069, 1, 1, 1, 1, 1,
0.0918984, 0.1468265, 0.7322359, 1, 1, 1, 1, 1,
0.09202896, 1.37892, 0.7561067, 1, 1, 1, 1, 1,
0.09241127, 1.208752, -1.582345, 1, 1, 1, 1, 1,
0.09425192, 0.4238089, -0.3053049, 1, 1, 1, 1, 1,
0.09669238, -0.2021961, 2.234906, 1, 1, 1, 1, 1,
0.09741696, 0.5005632, 0.8731838, 1, 1, 1, 1, 1,
0.09891038, -0.360432, 3.349966, 1, 1, 1, 1, 1,
0.100017, 0.8811911, -0.4405104, 1, 1, 1, 1, 1,
0.1020694, 1.806803, 1.20886, 1, 1, 1, 1, 1,
0.1027523, -0.7665898, 2.472543, 1, 1, 1, 1, 1,
0.1028259, -0.1518357, 1.422073, 1, 1, 1, 1, 1,
0.1037953, -0.2990535, 2.742033, 1, 1, 1, 1, 1,
0.1041607, -1.419433, 2.729598, 1, 1, 1, 1, 1,
0.113402, 0.562983, -0.4628349, 1, 1, 1, 1, 1,
0.1148422, 0.8112689, -0.4229137, 0, 0, 1, 1, 1,
0.1204179, 0.9676597, 0.8727693, 1, 0, 0, 1, 1,
0.1239223, -1.522448, 2.698925, 1, 0, 0, 1, 1,
0.1270732, 1.476819, 0.9384091, 1, 0, 0, 1, 1,
0.1270994, -0.06242836, 2.240515, 1, 0, 0, 1, 1,
0.1275764, 0.6263639, 0.02692765, 1, 0, 0, 1, 1,
0.1281647, 0.4136917, 0.611516, 0, 0, 0, 1, 1,
0.1281767, -0.02966523, 2.707477, 0, 0, 0, 1, 1,
0.1300657, 1.006495, 0.6148928, 0, 0, 0, 1, 1,
0.1427704, 0.3160256, 1.817966, 0, 0, 0, 1, 1,
0.1449504, -0.4597769, 2.187399, 0, 0, 0, 1, 1,
0.1485328, -1.397484, 1.592165, 0, 0, 0, 1, 1,
0.1547295, 1.453878, 1.543451, 0, 0, 0, 1, 1,
0.1549728, -2.18455, 1.783294, 1, 1, 1, 1, 1,
0.1553546, 0.7096481, 0.5278267, 1, 1, 1, 1, 1,
0.1560513, 0.6000422, -0.2426319, 1, 1, 1, 1, 1,
0.1567813, 0.951235, 0.5435886, 1, 1, 1, 1, 1,
0.1580301, -0.2948303, 2.366446, 1, 1, 1, 1, 1,
0.159191, 3.257268, 0.1568876, 1, 1, 1, 1, 1,
0.1681762, -0.5146811, 2.179292, 1, 1, 1, 1, 1,
0.1691583, 0.7115489, 1.089387, 1, 1, 1, 1, 1,
0.1702944, 0.6485491, -0.961341, 1, 1, 1, 1, 1,
0.1743004, -0.5570312, 0.2824651, 1, 1, 1, 1, 1,
0.1757592, 2.373954, -0.2845089, 1, 1, 1, 1, 1,
0.176172, -1.456423, 3.895868, 1, 1, 1, 1, 1,
0.1766903, -1.83596, 4.743556, 1, 1, 1, 1, 1,
0.1777876, -0.1974635, 1.13551, 1, 1, 1, 1, 1,
0.1788824, -0.03665649, 0.9876921, 1, 1, 1, 1, 1,
0.1811626, -0.53385, 3.416851, 0, 0, 1, 1, 1,
0.1832425, 1.455735, 1.923078, 1, 0, 0, 1, 1,
0.1838349, 1.536977, -1.076379, 1, 0, 0, 1, 1,
0.192194, -1.190143, 1.957038, 1, 0, 0, 1, 1,
0.2032378, 0.3463776, -0.005264163, 1, 0, 0, 1, 1,
0.205549, 1.011847, 1.468623, 1, 0, 0, 1, 1,
0.2061793, 1.447422, 0.2322824, 0, 0, 0, 1, 1,
0.2069961, -0.6397442, 1.653778, 0, 0, 0, 1, 1,
0.2137174, 1.085204, -0.658176, 0, 0, 0, 1, 1,
0.2138958, -0.02415494, 1.398267, 0, 0, 0, 1, 1,
0.2175999, 0.3083378, 0.1719743, 0, 0, 0, 1, 1,
0.2181958, -0.88466, 2.763582, 0, 0, 0, 1, 1,
0.2182946, 0.5428168, 0.5176136, 0, 0, 0, 1, 1,
0.2200664, 1.095591, -0.5941988, 1, 1, 1, 1, 1,
0.2204698, -0.2612594, 0.5050552, 1, 1, 1, 1, 1,
0.2225826, 1.769077, -0.3881682, 1, 1, 1, 1, 1,
0.2328204, 0.9350619, -0.08231893, 1, 1, 1, 1, 1,
0.2465025, 1.322849, -0.4450454, 1, 1, 1, 1, 1,
0.2468153, -0.0700259, 2.340246, 1, 1, 1, 1, 1,
0.2499359, 0.2854787, -0.3579004, 1, 1, 1, 1, 1,
0.2503107, 0.3108276, 1.48108, 1, 1, 1, 1, 1,
0.2540904, -0.7511125, 4.544156, 1, 1, 1, 1, 1,
0.2555105, 0.7419636, 1.259257, 1, 1, 1, 1, 1,
0.2556566, 0.2430325, 0.3708051, 1, 1, 1, 1, 1,
0.2557668, 1.707396, 0.09034612, 1, 1, 1, 1, 1,
0.2582557, -0.02582452, 1.888719, 1, 1, 1, 1, 1,
0.258506, -0.7602872, 3.068609, 1, 1, 1, 1, 1,
0.2642835, -2.875679, 2.184886, 1, 1, 1, 1, 1,
0.2653719, 0.03397853, -0.5399167, 0, 0, 1, 1, 1,
0.2671627, -1.149567, 1.914773, 1, 0, 0, 1, 1,
0.2679139, 0.6784225, 0.9888334, 1, 0, 0, 1, 1,
0.2765482, 0.4593425, -0.4266027, 1, 0, 0, 1, 1,
0.2771897, -0.6552334, 3.29777, 1, 0, 0, 1, 1,
0.2773718, -0.3559446, 3.943276, 1, 0, 0, 1, 1,
0.2783237, -0.2452088, 2.52686, 0, 0, 0, 1, 1,
0.2785259, -0.2997985, 2.036549, 0, 0, 0, 1, 1,
0.2843357, -0.1432211, 0.7425966, 0, 0, 0, 1, 1,
0.2862796, -1.219598, 1.016443, 0, 0, 0, 1, 1,
0.2877891, 0.5656148, 0.07606322, 0, 0, 0, 1, 1,
0.2895752, 0.2129725, -0.2905419, 0, 0, 0, 1, 1,
0.2916533, 0.2982989, 3.711222, 0, 0, 0, 1, 1,
0.2919919, 0.8927467, 1.034402, 1, 1, 1, 1, 1,
0.293272, 1.661163, 0.8041477, 1, 1, 1, 1, 1,
0.2955729, 0.1101317, 1.942768, 1, 1, 1, 1, 1,
0.2984247, 1.092043, -0.06822312, 1, 1, 1, 1, 1,
0.300065, 0.3975122, 0.9714221, 1, 1, 1, 1, 1,
0.3035489, -0.3745103, 2.326497, 1, 1, 1, 1, 1,
0.3036621, -0.9436642, 2.835574, 1, 1, 1, 1, 1,
0.305542, -1.199591, 3.171416, 1, 1, 1, 1, 1,
0.306775, 0.03789529, 3.102873, 1, 1, 1, 1, 1,
0.3093623, 1.21304, 0.04943032, 1, 1, 1, 1, 1,
0.3126646, 1.338723, 0.1259312, 1, 1, 1, 1, 1,
0.3146021, 1.310962, -0.5541181, 1, 1, 1, 1, 1,
0.3253066, 0.395876, 2.55749, 1, 1, 1, 1, 1,
0.3279668, -2.154091, 2.881093, 1, 1, 1, 1, 1,
0.3281352, -0.2515631, 1.107618, 1, 1, 1, 1, 1,
0.3287047, -0.3275761, 1.272813, 0, 0, 1, 1, 1,
0.3330024, -0.1526967, 2.333451, 1, 0, 0, 1, 1,
0.335091, 1.438219, -0.4729294, 1, 0, 0, 1, 1,
0.3377202, -0.7007322, 1.546734, 1, 0, 0, 1, 1,
0.3388382, 0.6583382, -0.2076536, 1, 0, 0, 1, 1,
0.3392074, -0.006536013, 2.262733, 1, 0, 0, 1, 1,
0.3487712, 0.3458751, 1.986725, 0, 0, 0, 1, 1,
0.3492912, 1.392086, -0.6140522, 0, 0, 0, 1, 1,
0.3540888, -0.4234955, 1.38291, 0, 0, 0, 1, 1,
0.3560901, -1.309905, 4.133746, 0, 0, 0, 1, 1,
0.358889, -0.5213667, 2.258845, 0, 0, 0, 1, 1,
0.36479, -0.5902618, 4.375937, 0, 0, 0, 1, 1,
0.3649424, -1.629734, 3.247751, 0, 0, 0, 1, 1,
0.3663269, -1.351409, 1.733696, 1, 1, 1, 1, 1,
0.3663881, 0.3393523, -0.4628048, 1, 1, 1, 1, 1,
0.3666809, 1.212605, -0.5692598, 1, 1, 1, 1, 1,
0.3673984, -2.052985, 4.419762, 1, 1, 1, 1, 1,
0.3688737, -1.007794, 2.164387, 1, 1, 1, 1, 1,
0.3727219, -0.5781803, 4.563395, 1, 1, 1, 1, 1,
0.374, 0.5799852, 1.708375, 1, 1, 1, 1, 1,
0.3755966, 0.0534719, 0.3770376, 1, 1, 1, 1, 1,
0.3803351, -0.08922411, 2.433025, 1, 1, 1, 1, 1,
0.3812056, -0.939734, 4.065707, 1, 1, 1, 1, 1,
0.3830757, -0.2086534, 1.038498, 1, 1, 1, 1, 1,
0.3852066, 0.7460418, 1.114196, 1, 1, 1, 1, 1,
0.3913167, 0.4333058, 3.716232, 1, 1, 1, 1, 1,
0.3946516, 0.628545, 1.299988, 1, 1, 1, 1, 1,
0.3948052, 0.9325133, 1.096829, 1, 1, 1, 1, 1,
0.4039164, -0.9378036, 3.169249, 0, 0, 1, 1, 1,
0.4064308, -1.371164, 4.206341, 1, 0, 0, 1, 1,
0.4066447, -2.482226, 3.322369, 1, 0, 0, 1, 1,
0.4155598, -0.397295, 2.118178, 1, 0, 0, 1, 1,
0.4191285, -0.787746, 1.660304, 1, 0, 0, 1, 1,
0.4216008, 0.7610984, 1.275812, 1, 0, 0, 1, 1,
0.426985, 0.3998915, 1.439944, 0, 0, 0, 1, 1,
0.4300971, 0.179599, 0.8374353, 0, 0, 0, 1, 1,
0.4338456, -0.2682995, 2.978184, 0, 0, 0, 1, 1,
0.4359156, 2.249995, 0.01398322, 0, 0, 0, 1, 1,
0.4380898, 1.010565, 1.571872, 0, 0, 0, 1, 1,
0.4404535, 0.7546835, 0.2341029, 0, 0, 0, 1, 1,
0.4430167, 1.915197, 1.072339, 0, 0, 0, 1, 1,
0.4438188, 0.4953334, 1.482683, 1, 1, 1, 1, 1,
0.4464805, 1.684335, 1.766274, 1, 1, 1, 1, 1,
0.4488572, -0.2256051, 1.982997, 1, 1, 1, 1, 1,
0.4515531, 0.1688694, 0.3924631, 1, 1, 1, 1, 1,
0.4523773, -0.6562402, 1.852712, 1, 1, 1, 1, 1,
0.4527503, 1.059543, 0.2350613, 1, 1, 1, 1, 1,
0.4555512, 1.076363, -1.105655, 1, 1, 1, 1, 1,
0.459911, -0.2395998, 1.977219, 1, 1, 1, 1, 1,
0.4609675, -0.5665268, 3.452889, 1, 1, 1, 1, 1,
0.462794, 1.100141, -0.1616622, 1, 1, 1, 1, 1,
0.4632653, -0.5755771, 3.108547, 1, 1, 1, 1, 1,
0.464166, 0.3649251, -0.7904319, 1, 1, 1, 1, 1,
0.4642152, 0.3599544, -0.4634035, 1, 1, 1, 1, 1,
0.4644488, 1.080281, -0.4984356, 1, 1, 1, 1, 1,
0.4644875, -0.01562479, 2.585536, 1, 1, 1, 1, 1,
0.4677944, -0.07834703, 0.6091987, 0, 0, 1, 1, 1,
0.4698985, 0.4513707, 0.9241002, 1, 0, 0, 1, 1,
0.4781228, -1.280609, 1.962803, 1, 0, 0, 1, 1,
0.4789676, 0.7009517, 0.7869228, 1, 0, 0, 1, 1,
0.4853766, 0.2402071, 1.319301, 1, 0, 0, 1, 1,
0.4949897, 0.1815056, 1.21419, 1, 0, 0, 1, 1,
0.4965945, -0.4948231, 3.694863, 0, 0, 0, 1, 1,
0.5012326, -0.5965174, 0.2585358, 0, 0, 0, 1, 1,
0.5036047, 0.3953169, 1.819584, 0, 0, 0, 1, 1,
0.5039189, -2.140805, 3.364839, 0, 0, 0, 1, 1,
0.5042212, -0.6649625, 3.606134, 0, 0, 0, 1, 1,
0.5100592, -0.7437242, 3.849324, 0, 0, 0, 1, 1,
0.5115107, -0.4444577, 2.672458, 0, 0, 0, 1, 1,
0.5192502, 1.301062, 0.3943073, 1, 1, 1, 1, 1,
0.5298744, 1.023895, -1.735201, 1, 1, 1, 1, 1,
0.5312845, 0.7001363, 1.960493, 1, 1, 1, 1, 1,
0.5320241, 0.02177702, 1.25206, 1, 1, 1, 1, 1,
0.5328622, -0.5331476, 3.486253, 1, 1, 1, 1, 1,
0.5332141, 1.155129, 0.5772468, 1, 1, 1, 1, 1,
0.5406139, 0.04479799, 2.20791, 1, 1, 1, 1, 1,
0.5434602, -1.297478, 4.719501, 1, 1, 1, 1, 1,
0.5471828, 2.339169, -1.947651, 1, 1, 1, 1, 1,
0.5473858, 0.2480362, 0.8122103, 1, 1, 1, 1, 1,
0.5481525, 0.5019388, 0.08635246, 1, 1, 1, 1, 1,
0.5541255, -0.1978494, 1.109304, 1, 1, 1, 1, 1,
0.5594254, -0.3017337, 3.118107, 1, 1, 1, 1, 1,
0.5595002, -0.2536645, 1.346667, 1, 1, 1, 1, 1,
0.5647658, 0.9346458, -0.02931698, 1, 1, 1, 1, 1,
0.5773831, 0.4110798, 3.331378, 0, 0, 1, 1, 1,
0.5809664, 1.365788, 1.188619, 1, 0, 0, 1, 1,
0.5831371, 1.855859, 0.8977689, 1, 0, 0, 1, 1,
0.5879961, 0.4720224, 1.336806, 1, 0, 0, 1, 1,
0.5923731, -0.3209255, 3.267518, 1, 0, 0, 1, 1,
0.5926166, -1.387326, 1.15685, 1, 0, 0, 1, 1,
0.5996619, 0.4709168, 0.7162442, 0, 0, 0, 1, 1,
0.6045224, -1.512118, 4.4695, 0, 0, 0, 1, 1,
0.6057587, -1.222796, 3.554145, 0, 0, 0, 1, 1,
0.6113282, -1.474486, 1.169703, 0, 0, 0, 1, 1,
0.6128144, 0.7719143, 0.4088751, 0, 0, 0, 1, 1,
0.6138783, 0.1468094, 2.515848, 0, 0, 0, 1, 1,
0.6150768, 0.7168998, 0.4042865, 0, 0, 0, 1, 1,
0.615198, -0.272516, 2.197786, 1, 1, 1, 1, 1,
0.6201292, 0.3531238, 1.362442, 1, 1, 1, 1, 1,
0.6205535, 0.0550933, 0.8772728, 1, 1, 1, 1, 1,
0.6206498, 0.5499718, -0.6697959, 1, 1, 1, 1, 1,
0.6242682, 1.932387, -0.8952131, 1, 1, 1, 1, 1,
0.6269287, -0.2027479, 1.188842, 1, 1, 1, 1, 1,
0.6287684, -0.8278291, 2.549811, 1, 1, 1, 1, 1,
0.6303771, 0.8149626, 0.4298868, 1, 1, 1, 1, 1,
0.6343279, 0.4006598, 2.055456, 1, 1, 1, 1, 1,
0.6358598, 0.8047358, -0.4287249, 1, 1, 1, 1, 1,
0.6359854, -0.6707927, 1.710317, 1, 1, 1, 1, 1,
0.6362002, 0.4790282, 0.5893159, 1, 1, 1, 1, 1,
0.6413638, -0.6136758, 1.145661, 1, 1, 1, 1, 1,
0.6416259, 0.3272558, 2.49486, 1, 1, 1, 1, 1,
0.6441678, 0.006997725, 1.337554, 1, 1, 1, 1, 1,
0.646803, -1.691474, 4.589265, 0, 0, 1, 1, 1,
0.6479709, 1.673663, -0.4548501, 1, 0, 0, 1, 1,
0.6490577, -0.4511098, 1.696999, 1, 0, 0, 1, 1,
0.6504546, 0.3892102, 0.5728264, 1, 0, 0, 1, 1,
0.6510665, -0.9823808, 1.821764, 1, 0, 0, 1, 1,
0.6548293, 0.8323821, 0.7782611, 1, 0, 0, 1, 1,
0.6551023, -0.6577525, 1.851865, 0, 0, 0, 1, 1,
0.6575784, -0.1559305, 0.2298191, 0, 0, 0, 1, 1,
0.6758111, -0.8415745, 1.891818, 0, 0, 0, 1, 1,
0.6762321, 2.336895, -0.8697147, 0, 0, 0, 1, 1,
0.6794994, 0.5949501, 2.475521, 0, 0, 0, 1, 1,
0.6818888, 0.9116291, 0.6492927, 0, 0, 0, 1, 1,
0.6871747, 1.51475, 2.795622, 0, 0, 0, 1, 1,
0.687609, 0.08676233, 1.412142, 1, 1, 1, 1, 1,
0.6891221, -0.7758788, 1.808681, 1, 1, 1, 1, 1,
0.6944565, -0.7489991, 2.635933, 1, 1, 1, 1, 1,
0.7062847, -0.04749654, 0.1866754, 1, 1, 1, 1, 1,
0.7078596, -0.9389865, 2.493991, 1, 1, 1, 1, 1,
0.7129105, -0.8640951, 3.596871, 1, 1, 1, 1, 1,
0.7210391, -1.719369, 2.53333, 1, 1, 1, 1, 1,
0.7253081, 1.501851, 0.5777345, 1, 1, 1, 1, 1,
0.731521, -1.426135, 5.338527, 1, 1, 1, 1, 1,
0.7361958, -0.2131667, 1.764048, 1, 1, 1, 1, 1,
0.736575, 1.844692, 2.693691, 1, 1, 1, 1, 1,
0.7407125, -1.282116, 2.622579, 1, 1, 1, 1, 1,
0.7504663, -0.6448466, 2.446406, 1, 1, 1, 1, 1,
0.752564, 1.286358, 1.768951, 1, 1, 1, 1, 1,
0.7555643, -1.591382, 2.491174, 1, 1, 1, 1, 1,
0.7589625, -0.2537581, 2.324832, 0, 0, 1, 1, 1,
0.7624872, 0.673765, 0.9908765, 1, 0, 0, 1, 1,
0.7763575, -0.3866807, 4.14998, 1, 0, 0, 1, 1,
0.7792786, -1.832175, 2.945194, 1, 0, 0, 1, 1,
0.7802269, -0.9025651, 2.292683, 1, 0, 0, 1, 1,
0.7829294, 1.222906, -1.123984, 1, 0, 0, 1, 1,
0.7835637, 1.206763, -0.4218915, 0, 0, 0, 1, 1,
0.7877092, 0.2219511, 1.550428, 0, 0, 0, 1, 1,
0.7930413, 0.1919358, 2.433726, 0, 0, 0, 1, 1,
0.7938135, 2.950712, -0.460081, 0, 0, 0, 1, 1,
0.797215, -0.09365086, 1.289757, 0, 0, 0, 1, 1,
0.7986013, -2.079989, 4.327392, 0, 0, 0, 1, 1,
0.7987776, 0.05054221, -0.5042449, 0, 0, 0, 1, 1,
0.8018906, -0.5377853, 3.939813, 1, 1, 1, 1, 1,
0.8081536, -0.02299359, 1.147599, 1, 1, 1, 1, 1,
0.8146828, 0.7941445, 0.3886559, 1, 1, 1, 1, 1,
0.815459, -1.020923, 3.02797, 1, 1, 1, 1, 1,
0.8182315, -1.809512, 2.357325, 1, 1, 1, 1, 1,
0.822128, 1.231712, 0.5690094, 1, 1, 1, 1, 1,
0.8222534, -0.06958529, 2.245348, 1, 1, 1, 1, 1,
0.8241984, -1.71329, 3.249681, 1, 1, 1, 1, 1,
0.8280883, 0.6810677, -0.954371, 1, 1, 1, 1, 1,
0.8290436, -0.9208298, 2.511738, 1, 1, 1, 1, 1,
0.8302895, -1.781001, 3.498672, 1, 1, 1, 1, 1,
0.8355123, 1.563183, 0.03916859, 1, 1, 1, 1, 1,
0.8408113, 0.09217981, 1.944149, 1, 1, 1, 1, 1,
0.8468198, 0.03876537, 2.477798, 1, 1, 1, 1, 1,
0.8507282, -0.5199748, 1.352532, 1, 1, 1, 1, 1,
0.8602934, 1.641846, 1.515555, 0, 0, 1, 1, 1,
0.8612963, -1.555104, 1.452791, 1, 0, 0, 1, 1,
0.8661122, -0.5298649, 1.399372, 1, 0, 0, 1, 1,
0.8714166, 0.9574329, -0.3396315, 1, 0, 0, 1, 1,
0.8796715, 0.09620001, 0.4688844, 1, 0, 0, 1, 1,
0.8801835, -1.720315, 3.442504, 1, 0, 0, 1, 1,
0.8815642, -0.3022703, 2.045497, 0, 0, 0, 1, 1,
0.8836009, 0.8160277, -0.2330817, 0, 0, 0, 1, 1,
0.8862623, -0.0884262, 1.461492, 0, 0, 0, 1, 1,
0.8948168, -0.04162993, 1.627939, 0, 0, 0, 1, 1,
0.8953497, 0.06021145, 0.3425472, 0, 0, 0, 1, 1,
0.8970305, 0.8346916, 0.2764441, 0, 0, 0, 1, 1,
0.8987579, -0.02459445, -0.6223907, 0, 0, 0, 1, 1,
0.8993137, -0.3195332, 1.148535, 1, 1, 1, 1, 1,
0.9008818, -0.5544102, 1.833856, 1, 1, 1, 1, 1,
0.9027103, 0.4383321, 1.801507, 1, 1, 1, 1, 1,
0.9027976, 1.392792, 0.4997556, 1, 1, 1, 1, 1,
0.9239362, 0.03123894, 0.5977715, 1, 1, 1, 1, 1,
0.9273649, 0.291855, -0.1712038, 1, 1, 1, 1, 1,
0.928934, 0.3698634, 0.9292752, 1, 1, 1, 1, 1,
0.9333288, -2.157468, 2.345267, 1, 1, 1, 1, 1,
0.9378318, -0.5645368, 0.6936482, 1, 1, 1, 1, 1,
0.9475127, 1.2574, 1.571313, 1, 1, 1, 1, 1,
0.949455, 0.6722181, 1.471807, 1, 1, 1, 1, 1,
0.9523191, -1.421293, 1.436601, 1, 1, 1, 1, 1,
0.9709734, -0.3698186, 3.030618, 1, 1, 1, 1, 1,
0.9724227, -1.386528, 1.054261, 1, 1, 1, 1, 1,
0.9749058, 1.668788, 2.042705, 1, 1, 1, 1, 1,
0.9782434, -0.2403731, 1.491931, 0, 0, 1, 1, 1,
0.9837704, -0.2310126, 1.007705, 1, 0, 0, 1, 1,
0.9919518, -0.3318489, 3.46696, 1, 0, 0, 1, 1,
0.9922339, -0.1142133, 0.3978357, 1, 0, 0, 1, 1,
0.9927295, -0.4404474, 3.402347, 1, 0, 0, 1, 1,
0.9942427, 1.040147, 1.406869, 1, 0, 0, 1, 1,
0.9958897, 1.544546, 1.669305, 0, 0, 0, 1, 1,
0.9970665, 1.187012, -0.2711867, 0, 0, 0, 1, 1,
1.004653, -0.781617, 1.631513, 0, 0, 0, 1, 1,
1.005492, 1.617697, 1.972023, 0, 0, 0, 1, 1,
1.005565, 0.381105, 1.207646, 0, 0, 0, 1, 1,
1.013748, 0.2744441, 0.7609341, 0, 0, 0, 1, 1,
1.019987, -1.807386, 1.939752, 0, 0, 0, 1, 1,
1.028437, 0.7793768, -1.307358, 1, 1, 1, 1, 1,
1.03129, -2.302379, 2.107984, 1, 1, 1, 1, 1,
1.038126, 0.5311509, 0.3907774, 1, 1, 1, 1, 1,
1.043871, 1.347468, 2.246469, 1, 1, 1, 1, 1,
1.04566, 1.134052, 1.497375, 1, 1, 1, 1, 1,
1.053235, -0.5533718, 1.163007, 1, 1, 1, 1, 1,
1.056377, 0.831713, 0.5444343, 1, 1, 1, 1, 1,
1.061766, -0.5606826, 2.317528, 1, 1, 1, 1, 1,
1.064263, -0.04179409, 1.621868, 1, 1, 1, 1, 1,
1.065674, 0.4309988, 0.4475151, 1, 1, 1, 1, 1,
1.066419, 1.62179, 1.223043, 1, 1, 1, 1, 1,
1.068051, 0.06142424, 0.3540444, 1, 1, 1, 1, 1,
1.075939, 0.5017306, 0.159809, 1, 1, 1, 1, 1,
1.088294, 0.8539295, 1.455979, 1, 1, 1, 1, 1,
1.090654, -0.6027066, -0.4018254, 1, 1, 1, 1, 1,
1.095439, -0.2504784, 2.629861, 0, 0, 1, 1, 1,
1.102169, -0.6695887, 2.814389, 1, 0, 0, 1, 1,
1.1051, 0.3380298, -1.549147, 1, 0, 0, 1, 1,
1.107656, 0.4503618, 3.421864, 1, 0, 0, 1, 1,
1.108049, 1.583591, -0.2404718, 1, 0, 0, 1, 1,
1.108618, -0.9703525, 1.516045, 1, 0, 0, 1, 1,
1.109672, 0.5511746, 2.219748, 0, 0, 0, 1, 1,
1.110545, -1.255975, 1.609215, 0, 0, 0, 1, 1,
1.11129, -0.5663813, 2.944684, 0, 0, 0, 1, 1,
1.120417, -1.388574, 2.535534, 0, 0, 0, 1, 1,
1.122921, 0.5406815, -0.1079181, 0, 0, 0, 1, 1,
1.123041, -0.5790815, 1.902906, 0, 0, 0, 1, 1,
1.125957, -0.4012815, 2.362974, 0, 0, 0, 1, 1,
1.139463, 0.6738442, 0.3999932, 1, 1, 1, 1, 1,
1.14248, -0.7662668, 0.4039931, 1, 1, 1, 1, 1,
1.144038, 0.1682959, 2.252547, 1, 1, 1, 1, 1,
1.147881, 1.485974, -1.030521, 1, 1, 1, 1, 1,
1.149146, -0.9714423, 2.802444, 1, 1, 1, 1, 1,
1.153825, -1.172973, 4.396734, 1, 1, 1, 1, 1,
1.162399, 0.9105754, 0.8857783, 1, 1, 1, 1, 1,
1.162643, -1.316078, 1.222718, 1, 1, 1, 1, 1,
1.166236, -0.5668058, -0.1581639, 1, 1, 1, 1, 1,
1.168306, -1.025931, 2.959521, 1, 1, 1, 1, 1,
1.178077, -0.403843, 0.9151192, 1, 1, 1, 1, 1,
1.187081, -0.3532452, 2.473018, 1, 1, 1, 1, 1,
1.187807, 2.46047, 0.7737257, 1, 1, 1, 1, 1,
1.189897, 0.02221868, 0.1500412, 1, 1, 1, 1, 1,
1.19327, -0.8121495, 1.570954, 1, 1, 1, 1, 1,
1.19342, 1.150345, -0.4344056, 0, 0, 1, 1, 1,
1.207739, 1.120558, 2.84617, 1, 0, 0, 1, 1,
1.212411, 0.3192105, 0.8943432, 1, 0, 0, 1, 1,
1.213329, -0.3535229, 1.85818, 1, 0, 0, 1, 1,
1.215007, 0.695806, 0.7304261, 1, 0, 0, 1, 1,
1.220991, -0.5593808, 1.188012, 1, 0, 0, 1, 1,
1.221074, 0.9848751, 2.072097, 0, 0, 0, 1, 1,
1.22441, 0.5096895, 1.612861, 0, 0, 0, 1, 1,
1.23474, -0.4937647, 1.43985, 0, 0, 0, 1, 1,
1.241139, -0.5041732, 2.096519, 0, 0, 0, 1, 1,
1.243979, -0.9017188, 2.597696, 0, 0, 0, 1, 1,
1.247087, -0.9921528, 2.913458, 0, 0, 0, 1, 1,
1.249166, 0.2897742, 2.001112, 0, 0, 0, 1, 1,
1.250384, 0.7404471, 2.121987, 1, 1, 1, 1, 1,
1.257203, 0.966858, 1.247953, 1, 1, 1, 1, 1,
1.263542, 0.1240972, 2.211608, 1, 1, 1, 1, 1,
1.266268, -0.9429343, 2.062446, 1, 1, 1, 1, 1,
1.26864, -0.290356, 2.571814, 1, 1, 1, 1, 1,
1.272449, -1.285934, 1.623856, 1, 1, 1, 1, 1,
1.272876, -0.5628933, 2.557442, 1, 1, 1, 1, 1,
1.280761, -0.4595003, 2.121799, 1, 1, 1, 1, 1,
1.289676, -0.3263965, 2.29471, 1, 1, 1, 1, 1,
1.293867, -1.302308, 2.425108, 1, 1, 1, 1, 1,
1.298485, -0.9288262, 2.309784, 1, 1, 1, 1, 1,
1.311034, 0.1070804, 0.5178307, 1, 1, 1, 1, 1,
1.316434, 0.7928105, 1.997346, 1, 1, 1, 1, 1,
1.317886, 0.05646203, 0.7427759, 1, 1, 1, 1, 1,
1.320641, 0.9213552, 2.58355, 1, 1, 1, 1, 1,
1.321941, -1.627242, 2.470509, 0, 0, 1, 1, 1,
1.325278, -1.24265, 2.588982, 1, 0, 0, 1, 1,
1.32872, 1.469694, -1.425923, 1, 0, 0, 1, 1,
1.338719, 2.116519, -2.003179, 1, 0, 0, 1, 1,
1.351217, -0.6641771, 2.165684, 1, 0, 0, 1, 1,
1.35525, -0.4974277, -1.591506, 1, 0, 0, 1, 1,
1.358849, -0.1951698, 3.203937, 0, 0, 0, 1, 1,
1.376927, 0.8826014, 0.7604617, 0, 0, 0, 1, 1,
1.381513, 0.5178005, 1.61023, 0, 0, 0, 1, 1,
1.391344, 0.7848824, -0.4873682, 0, 0, 0, 1, 1,
1.391846, -0.8934909, 1.029222, 0, 0, 0, 1, 1,
1.404161, -0.5959159, 1.608057, 0, 0, 0, 1, 1,
1.43004, -0.1866026, 1.852609, 0, 0, 0, 1, 1,
1.431307, -0.5157477, 0.7159985, 1, 1, 1, 1, 1,
1.437027, -0.1789231, 0.776541, 1, 1, 1, 1, 1,
1.471043, -1.132452, 1.752732, 1, 1, 1, 1, 1,
1.480789, 0.2132386, 1.889378, 1, 1, 1, 1, 1,
1.485497, 1.136656, -0.9321719, 1, 1, 1, 1, 1,
1.48985, -1.081948, 2.311251, 1, 1, 1, 1, 1,
1.512307, -0.335953, 2.600306, 1, 1, 1, 1, 1,
1.519282, 0.4257955, 0.3110336, 1, 1, 1, 1, 1,
1.519317, 0.1987315, 0.5174136, 1, 1, 1, 1, 1,
1.529197, 1.486658, 1.548838, 1, 1, 1, 1, 1,
1.532545, -0.5319301, 2.055593, 1, 1, 1, 1, 1,
1.561188, -0.02893073, 0.4005253, 1, 1, 1, 1, 1,
1.582922, -0.09116578, 1.706191, 1, 1, 1, 1, 1,
1.602759, -0.1046767, 0.4149861, 1, 1, 1, 1, 1,
1.613226, -0.4701294, 0.350146, 1, 1, 1, 1, 1,
1.620167, 1.146964, 1.044504, 0, 0, 1, 1, 1,
1.623688, -1.101154, 2.21275, 1, 0, 0, 1, 1,
1.630969, -1.071865, 1.831173, 1, 0, 0, 1, 1,
1.631363, 0.4461581, 2.683042, 1, 0, 0, 1, 1,
1.64022, -0.3553022, 0.9162225, 1, 0, 0, 1, 1,
1.647069, -0.1193287, 1.089523, 1, 0, 0, 1, 1,
1.652622, 0.3272872, -0.1019699, 0, 0, 0, 1, 1,
1.658714, -1.069325, 3.011236, 0, 0, 0, 1, 1,
1.658879, 1.007715, 1.878175, 0, 0, 0, 1, 1,
1.66943, -0.5520296, 2.454954, 0, 0, 0, 1, 1,
1.675055, 0.9730043, 0.05388491, 0, 0, 0, 1, 1,
1.687457, 0.748892, 0.7721538, 0, 0, 0, 1, 1,
1.697511, 2.037065, 0.3434529, 0, 0, 0, 1, 1,
1.711746, -0.8886433, 1.828859, 1, 1, 1, 1, 1,
1.714665, 1.133622, 2.48157, 1, 1, 1, 1, 1,
1.715717, -1.536306, 2.481292, 1, 1, 1, 1, 1,
1.740513, 0.7842734, 0.3057058, 1, 1, 1, 1, 1,
1.741961, 0.8663449, 0.7506295, 1, 1, 1, 1, 1,
1.750679, -0.05544197, 3.612418, 1, 1, 1, 1, 1,
1.774593, -1.446448, 1.53083, 1, 1, 1, 1, 1,
1.784418, 0.9569484, 1.950709, 1, 1, 1, 1, 1,
1.786184, 0.2787348, 0.4536015, 1, 1, 1, 1, 1,
1.840478, 0.667309, 2.520827, 1, 1, 1, 1, 1,
1.848996, 0.3910551, 0.2849145, 1, 1, 1, 1, 1,
1.874561, -1.018533, 1.559443, 1, 1, 1, 1, 1,
1.898206, 0.023811, 3.572759, 1, 1, 1, 1, 1,
1.952574, 1.38688, 1.029903, 1, 1, 1, 1, 1,
1.963588, 1.042465, 0.7567205, 1, 1, 1, 1, 1,
1.971324, -0.1306035, 2.412987, 0, 0, 1, 1, 1,
1.972203, 1.747087, 0.4675689, 1, 0, 0, 1, 1,
1.99555, -0.7334241, 2.464645, 1, 0, 0, 1, 1,
2.005382, 0.02783251, 0.5010387, 1, 0, 0, 1, 1,
2.009696, -0.5151445, 2.121749, 1, 0, 0, 1, 1,
2.017676, -0.2655406, 2.516657, 1, 0, 0, 1, 1,
2.02234, 1.229761, 0.1473079, 0, 0, 0, 1, 1,
2.025895, -0.3873298, 2.121883, 0, 0, 0, 1, 1,
2.036587, -0.1677313, 2.245373, 0, 0, 0, 1, 1,
2.064078, -0.858241, 0.7718896, 0, 0, 0, 1, 1,
2.084617, 0.03768672, 1.812134, 0, 0, 0, 1, 1,
2.130299, 1.287864, 1.47204, 0, 0, 0, 1, 1,
2.16077, -1.098524, 2.358899, 0, 0, 0, 1, 1,
2.24013, 0.4528444, 1.190724, 1, 1, 1, 1, 1,
2.301095, -1.639781, 2.48177, 1, 1, 1, 1, 1,
2.404008, 0.512969, 0.5398454, 1, 1, 1, 1, 1,
2.416629, 0.5281253, 1.894568, 1, 1, 1, 1, 1,
2.590714, 1.569228, 0.3302223, 1, 1, 1, 1, 1,
2.942634, 0.9274705, 0.9220574, 1, 1, 1, 1, 1,
3.000583, 0.6802554, 0.5063102, 1, 1, 1, 1, 1
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
var radius = 9.918946;
var distance = 34.83987;
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
mvMatrix.translate( 0.1586564, 0.2515173, -0.5525451 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.83987);
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