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
-3.227588, 1.469111, -0.9051896, 1, 0, 0, 1,
-2.900102, 0.8930877, -1.195186, 1, 0.007843138, 0, 1,
-2.755545, 0.3437533, -1.668061, 1, 0.01176471, 0, 1,
-2.585804, -0.3284538, -2.207596, 1, 0.01960784, 0, 1,
-2.490748, -1.28624, -0.967275, 1, 0.02352941, 0, 1,
-2.476861, 1.373402, -0.1065061, 1, 0.03137255, 0, 1,
-2.388524, -0.5408158, -2.399321, 1, 0.03529412, 0, 1,
-2.373948, 0.9641734, -1.552967, 1, 0.04313726, 0, 1,
-2.321198, 0.581443, -0.3157169, 1, 0.04705882, 0, 1,
-2.260384, -0.2767268, -1.125587, 1, 0.05490196, 0, 1,
-2.258844, -1.073242, -2.501029, 1, 0.05882353, 0, 1,
-2.241127, 1.407658, -1.491979, 1, 0.06666667, 0, 1,
-2.216614, -0.2466528, -0.6586704, 1, 0.07058824, 0, 1,
-2.204905, -0.6956065, -2.855596, 1, 0.07843138, 0, 1,
-2.200589, -0.04467537, -1.269801, 1, 0.08235294, 0, 1,
-2.177009, -0.3580665, -0.8718344, 1, 0.09019608, 0, 1,
-2.123375, -1.452959, -2.838201, 1, 0.09411765, 0, 1,
-2.091604, 0.4558755, -1.632401, 1, 0.1019608, 0, 1,
-2.086002, 1.847765, -1.59731, 1, 0.1098039, 0, 1,
-2.071813, -0.5593724, -1.400821, 1, 0.1137255, 0, 1,
-2.032049, 1.728408, -0.2081086, 1, 0.1215686, 0, 1,
-2.02893, -0.8937711, -0.578679, 1, 0.1254902, 0, 1,
-2.007948, -1.335649, -2.628026, 1, 0.1333333, 0, 1,
-2.001118, 0.9230188, -1.579704, 1, 0.1372549, 0, 1,
-1.999958, 0.736216, 0.04172016, 1, 0.145098, 0, 1,
-1.97902, -2.021505, -2.694823, 1, 0.1490196, 0, 1,
-1.960796, -0.3546134, -0.5287309, 1, 0.1568628, 0, 1,
-1.898095, 2.355306, -1.580922, 1, 0.1607843, 0, 1,
-1.896067, -1.018208, -2.01459, 1, 0.1686275, 0, 1,
-1.893613, -1.10219, -1.764943, 1, 0.172549, 0, 1,
-1.8561, 1.11572, -1.700691, 1, 0.1803922, 0, 1,
-1.851563, -1.053017, -1.168251, 1, 0.1843137, 0, 1,
-1.799971, 0.7984126, -1.756768, 1, 0.1921569, 0, 1,
-1.799756, 1.28261, -0.846297, 1, 0.1960784, 0, 1,
-1.798415, 1.148341, -2.349577, 1, 0.2039216, 0, 1,
-1.793883, -0.09500573, -2.65906, 1, 0.2117647, 0, 1,
-1.793567, -1.133561, -1.344683, 1, 0.2156863, 0, 1,
-1.790367, 0.9245046, -2.952446, 1, 0.2235294, 0, 1,
-1.777697, -0.3321701, -2.933452, 1, 0.227451, 0, 1,
-1.757727, 0.1077792, -1.426563, 1, 0.2352941, 0, 1,
-1.754294, -0.5293393, -3.680417, 1, 0.2392157, 0, 1,
-1.743258, 0.4802523, 0.1486764, 1, 0.2470588, 0, 1,
-1.741099, 0.2764374, -1.43841, 1, 0.2509804, 0, 1,
-1.738378, -0.05952012, -3.057514, 1, 0.2588235, 0, 1,
-1.734126, 1.617478, 0.3138647, 1, 0.2627451, 0, 1,
-1.725298, -1.723421, 0.1059623, 1, 0.2705882, 0, 1,
-1.690686, 0.1237528, -1.772725, 1, 0.2745098, 0, 1,
-1.657219, -0.7598228, -2.098254, 1, 0.282353, 0, 1,
-1.657117, -0.001859979, -1.359642, 1, 0.2862745, 0, 1,
-1.649635, -0.7803037, -0.5532784, 1, 0.2941177, 0, 1,
-1.64793, -0.2630028, -3.245991, 1, 0.3019608, 0, 1,
-1.645673, 1.973702, -0.03051482, 1, 0.3058824, 0, 1,
-1.635354, -0.5942904, -2.399182, 1, 0.3137255, 0, 1,
-1.616405, 0.7457088, -0.5047428, 1, 0.3176471, 0, 1,
-1.613917, -1.784333, -2.915126, 1, 0.3254902, 0, 1,
-1.600339, -1.752681, -2.921706, 1, 0.3294118, 0, 1,
-1.584, -1.576484, -3.237353, 1, 0.3372549, 0, 1,
-1.576263, 1.695313, -0.8628477, 1, 0.3411765, 0, 1,
-1.57555, 0.01117691, -0.8051657, 1, 0.3490196, 0, 1,
-1.567474, 0.006094235, -1.831705, 1, 0.3529412, 0, 1,
-1.552817, 0.01741329, -1.645893, 1, 0.3607843, 0, 1,
-1.547905, 2.185204, -1.515537, 1, 0.3647059, 0, 1,
-1.538297, 0.3441583, -0.347687, 1, 0.372549, 0, 1,
-1.536364, 0.7828552, -3.463983, 1, 0.3764706, 0, 1,
-1.533135, -0.126929, -2.230358, 1, 0.3843137, 0, 1,
-1.513982, -0.291344, -1.252621, 1, 0.3882353, 0, 1,
-1.501655, -0.3924436, -0.5853126, 1, 0.3960784, 0, 1,
-1.498106, -0.1480087, -1.976082, 1, 0.4039216, 0, 1,
-1.49363, -0.9803837, -2.104871, 1, 0.4078431, 0, 1,
-1.492138, -0.1059293, -1.423632, 1, 0.4156863, 0, 1,
-1.477903, -0.09246235, 0.3429735, 1, 0.4196078, 0, 1,
-1.456301, -0.8631619, -2.540519, 1, 0.427451, 0, 1,
-1.452446, -0.1788633, -3.563959, 1, 0.4313726, 0, 1,
-1.442667, 0.9455612, -0.3513127, 1, 0.4392157, 0, 1,
-1.435148, -0.6558719, -2.165236, 1, 0.4431373, 0, 1,
-1.423043, 1.177273, -1.560977, 1, 0.4509804, 0, 1,
-1.419341, 0.3706361, -0.1553469, 1, 0.454902, 0, 1,
-1.403316, -0.4149835, -1.345108, 1, 0.4627451, 0, 1,
-1.402537, -0.9298297, -0.1594895, 1, 0.4666667, 0, 1,
-1.401504, 0.5724199, -1.341822, 1, 0.4745098, 0, 1,
-1.401185, 1.292521, 1.098377, 1, 0.4784314, 0, 1,
-1.395657, 0.1665039, -0.7592595, 1, 0.4862745, 0, 1,
-1.381523, -0.2025036, -2.321266, 1, 0.4901961, 0, 1,
-1.37532, 1.066396, -2.012563, 1, 0.4980392, 0, 1,
-1.361938, 1.153155, -1.125762, 1, 0.5058824, 0, 1,
-1.348086, -0.8364922, -2.197427, 1, 0.509804, 0, 1,
-1.338855, 0.06017349, -2.095936, 1, 0.5176471, 0, 1,
-1.334353, -0.7952711, -2.235635, 1, 0.5215687, 0, 1,
-1.326658, 0.6988218, -4.0097, 1, 0.5294118, 0, 1,
-1.325737, 1.202293, -0.1874116, 1, 0.5333334, 0, 1,
-1.324674, 1.525606, -0.8498428, 1, 0.5411765, 0, 1,
-1.32116, 0.03186769, -2.549555, 1, 0.5450981, 0, 1,
-1.31069, -0.1564727, -2.625564, 1, 0.5529412, 0, 1,
-1.305124, -0.419366, -1.326238, 1, 0.5568628, 0, 1,
-1.30496, -0.3422109, -1.497647, 1, 0.5647059, 0, 1,
-1.301554, -0.2262304, -2.073548, 1, 0.5686275, 0, 1,
-1.299802, -1.548902, -2.278687, 1, 0.5764706, 0, 1,
-1.295113, -0.6983981, -1.637094, 1, 0.5803922, 0, 1,
-1.292062, -1.145827, -2.269274, 1, 0.5882353, 0, 1,
-1.291675, -1.753085, -4.709235, 1, 0.5921569, 0, 1,
-1.28796, 1.444782, -2.284532, 1, 0.6, 0, 1,
-1.278114, -0.7038314, -1.457893, 1, 0.6078432, 0, 1,
-1.272485, 1.743748, -1.046103, 1, 0.6117647, 0, 1,
-1.267944, 1.530453, -0.3251306, 1, 0.6196079, 0, 1,
-1.262514, -0.1494748, -3.078378, 1, 0.6235294, 0, 1,
-1.23696, -0.1186488, -1.828714, 1, 0.6313726, 0, 1,
-1.236805, -0.006784339, -1.718761, 1, 0.6352941, 0, 1,
-1.230956, 1.231558, -0.8371344, 1, 0.6431373, 0, 1,
-1.225449, 0.04440877, -2.648542, 1, 0.6470588, 0, 1,
-1.224548, 1.832625, -1.062254, 1, 0.654902, 0, 1,
-1.21857, 1.379654, -0.6541332, 1, 0.6588235, 0, 1,
-1.217384, 0.8423977, -2.375008, 1, 0.6666667, 0, 1,
-1.213787, 0.189575, -1.966303, 1, 0.6705883, 0, 1,
-1.209173, 0.6632168, 0.205865, 1, 0.6784314, 0, 1,
-1.197326, 0.9846779, -0.4316657, 1, 0.682353, 0, 1,
-1.195291, -0.7003842, -0.8808645, 1, 0.6901961, 0, 1,
-1.18541, -0.7570533, -1.030347, 1, 0.6941177, 0, 1,
-1.179897, 1.179451, 0.1464036, 1, 0.7019608, 0, 1,
-1.176064, 1.922134, 0.4864373, 1, 0.7098039, 0, 1,
-1.173936, 1.52412, -0.4412978, 1, 0.7137255, 0, 1,
-1.168034, 2.466029, -0.3307015, 1, 0.7215686, 0, 1,
-1.16524, -0.4093945, -0.513743, 1, 0.7254902, 0, 1,
-1.156075, -0.4375778, -4.536682, 1, 0.7333333, 0, 1,
-1.150623, 0.5422027, -1.56743, 1, 0.7372549, 0, 1,
-1.147821, -0.9276363, -1.903373, 1, 0.7450981, 0, 1,
-1.147767, -1.072204, -1.989682, 1, 0.7490196, 0, 1,
-1.142509, -0.08025389, -1.54264, 1, 0.7568628, 0, 1,
-1.135861, -0.6356566, -3.274247, 1, 0.7607843, 0, 1,
-1.132042, -0.09200124, -0.07269149, 1, 0.7686275, 0, 1,
-1.129634, 0.4927365, -1.670886, 1, 0.772549, 0, 1,
-1.128689, 0.8535761, -1.167788, 1, 0.7803922, 0, 1,
-1.118538, 1.635421, 0.8383669, 1, 0.7843137, 0, 1,
-1.117992, -1.178655, -2.849938, 1, 0.7921569, 0, 1,
-1.112699, 2.244039, -0.8221251, 1, 0.7960784, 0, 1,
-1.109265, 0.2313365, 0.5256339, 1, 0.8039216, 0, 1,
-1.108403, -0.08097672, -0.3988534, 1, 0.8117647, 0, 1,
-1.101751, -1.353886, -2.349969, 1, 0.8156863, 0, 1,
-1.100329, -0.267709, -1.465224, 1, 0.8235294, 0, 1,
-1.099259, 0.4651565, -0.6587525, 1, 0.827451, 0, 1,
-1.096436, 0.05819252, -1.597369, 1, 0.8352941, 0, 1,
-1.085551, 0.2391379, -1.59864, 1, 0.8392157, 0, 1,
-1.078686, 1.420654, 0.05529442, 1, 0.8470588, 0, 1,
-1.071153, -2.296116, -2.636548, 1, 0.8509804, 0, 1,
-1.057625, 0.7441253, -1.373435, 1, 0.8588235, 0, 1,
-1.057098, -0.5827008, -0.4520699, 1, 0.8627451, 0, 1,
-1.051546, -0.4454689, -2.180192, 1, 0.8705882, 0, 1,
-1.047435, 1.636337, -0.7964268, 1, 0.8745098, 0, 1,
-1.035221, -0.6599193, -1.147514, 1, 0.8823529, 0, 1,
-1.033506, -2.090995, -5.263949, 1, 0.8862745, 0, 1,
-1.033003, -0.7045346, -4.194808, 1, 0.8941177, 0, 1,
-1.029566, -0.1841936, -1.454527, 1, 0.8980392, 0, 1,
-1.029338, -1.466235, -2.921089, 1, 0.9058824, 0, 1,
-1.027766, 0.4636974, -3.495923, 1, 0.9137255, 0, 1,
-1.013696, -0.2513282, -2.096773, 1, 0.9176471, 0, 1,
-0.9904364, -0.7503397, -2.022614, 1, 0.9254902, 0, 1,
-0.9819894, -0.6787486, -0.6867195, 1, 0.9294118, 0, 1,
-0.981476, 1.355378, -1.063303, 1, 0.9372549, 0, 1,
-0.9746338, 0.09818733, -1.880709, 1, 0.9411765, 0, 1,
-0.9659465, -0.4054627, -0.6327167, 1, 0.9490196, 0, 1,
-0.9658984, 1.273767, -0.534968, 1, 0.9529412, 0, 1,
-0.9657058, -1.402882, -1.904276, 1, 0.9607843, 0, 1,
-0.9476005, 0.6789857, 1.109743, 1, 0.9647059, 0, 1,
-0.9355156, 0.9294404, -0.6442801, 1, 0.972549, 0, 1,
-0.9340665, 1.671599, -0.4905631, 1, 0.9764706, 0, 1,
-0.932236, 0.377773, -1.790373, 1, 0.9843137, 0, 1,
-0.9306477, -1.175253, -2.375767, 1, 0.9882353, 0, 1,
-0.9296374, -0.235158, -1.050066, 1, 0.9960784, 0, 1,
-0.9229661, 0.5530102, -0.8483077, 0.9960784, 1, 0, 1,
-0.9165625, -0.6597297, -3.782087, 0.9921569, 1, 0, 1,
-0.9130065, 0.2767967, -2.401155, 0.9843137, 1, 0, 1,
-0.9126612, 0.5805345, -2.55071, 0.9803922, 1, 0, 1,
-0.9102582, -0.8626012, -1.817641, 0.972549, 1, 0, 1,
-0.9092767, -0.3193463, -4.592484, 0.9686275, 1, 0, 1,
-0.9075797, -0.4440691, -1.329359, 0.9607843, 1, 0, 1,
-0.8990268, 1.277229, -2.333862, 0.9568627, 1, 0, 1,
-0.8962863, -1.249742, -1.444887, 0.9490196, 1, 0, 1,
-0.8952093, -0.5180194, -1.955435, 0.945098, 1, 0, 1,
-0.8946217, -0.2458021, -2.787635, 0.9372549, 1, 0, 1,
-0.8913848, -1.766337, -1.254843, 0.9333333, 1, 0, 1,
-0.8892664, -0.7776302, -3.40867, 0.9254902, 1, 0, 1,
-0.8848107, 1.662499, -0.6144661, 0.9215686, 1, 0, 1,
-0.8824489, 1.609169, -0.3824306, 0.9137255, 1, 0, 1,
-0.8722941, -1.14237, -1.158948, 0.9098039, 1, 0, 1,
-0.8700222, -0.09034251, -1.893908, 0.9019608, 1, 0, 1,
-0.8589565, -0.9380217, -3.494777, 0.8941177, 1, 0, 1,
-0.8519903, -1.348669, -1.929265, 0.8901961, 1, 0, 1,
-0.8471889, -0.2015673, -1.75135, 0.8823529, 1, 0, 1,
-0.8460174, -1.271136, -0.6954098, 0.8784314, 1, 0, 1,
-0.8425863, -1.360222, -2.623737, 0.8705882, 1, 0, 1,
-0.8370823, 1.713163, -0.9458424, 0.8666667, 1, 0, 1,
-0.8360033, -0.06726363, -1.669908, 0.8588235, 1, 0, 1,
-0.8348557, -1.21844, -3.285358, 0.854902, 1, 0, 1,
-0.8342264, 1.151963, -1.997653, 0.8470588, 1, 0, 1,
-0.8294116, -0.4070292, -1.296593, 0.8431373, 1, 0, 1,
-0.8259076, 0.3577015, -0.8005392, 0.8352941, 1, 0, 1,
-0.8240986, -0.9882174, -2.990659, 0.8313726, 1, 0, 1,
-0.8238782, -0.9560984, -1.783744, 0.8235294, 1, 0, 1,
-0.8222178, -0.2799281, -2.095079, 0.8196079, 1, 0, 1,
-0.8212923, -0.6890104, -2.309258, 0.8117647, 1, 0, 1,
-0.8107337, -0.4553591, -3.436921, 0.8078431, 1, 0, 1,
-0.8095338, 0.02109196, -1.234967, 0.8, 1, 0, 1,
-0.8045264, -0.3371174, -2.37796, 0.7921569, 1, 0, 1,
-0.7974238, -0.4902315, -1.41193, 0.7882353, 1, 0, 1,
-0.7959771, 1.442434, 0.213991, 0.7803922, 1, 0, 1,
-0.7949334, 0.3371156, -1.281534, 0.7764706, 1, 0, 1,
-0.7944645, -1.099959, -1.923137, 0.7686275, 1, 0, 1,
-0.7920809, -1.266807, -2.569738, 0.7647059, 1, 0, 1,
-0.7853798, 0.2404567, -0.9933403, 0.7568628, 1, 0, 1,
-0.7800915, 0.5277598, 0.4332622, 0.7529412, 1, 0, 1,
-0.7727768, 0.9254783, -1.155524, 0.7450981, 1, 0, 1,
-0.7712913, -1.122297, -5.071529, 0.7411765, 1, 0, 1,
-0.770744, -1.562889, -1.241543, 0.7333333, 1, 0, 1,
-0.7703466, -0.7209861, -3.8536, 0.7294118, 1, 0, 1,
-0.7662362, 0.4576784, -0.03302881, 0.7215686, 1, 0, 1,
-0.7662016, 1.784287, -2.026007, 0.7176471, 1, 0, 1,
-0.7586073, -1.677652, -3.00264, 0.7098039, 1, 0, 1,
-0.7583134, 0.5721476, -1.95705, 0.7058824, 1, 0, 1,
-0.7582614, -0.9190138, -1.43711, 0.6980392, 1, 0, 1,
-0.7563545, -0.8338385, -3.066913, 0.6901961, 1, 0, 1,
-0.7507172, -0.2247755, -0.5839655, 0.6862745, 1, 0, 1,
-0.7496229, 1.682556, 1.053249, 0.6784314, 1, 0, 1,
-0.7435748, -0.7330059, -2.766917, 0.6745098, 1, 0, 1,
-0.7425656, -0.3204849, -1.070832, 0.6666667, 1, 0, 1,
-0.7388862, -0.9674372, -2.304026, 0.6627451, 1, 0, 1,
-0.73199, -0.545941, -1.897863, 0.654902, 1, 0, 1,
-0.7283913, 0.07168887, 0.738223, 0.6509804, 1, 0, 1,
-0.7234633, 0.8068141, -0.2229516, 0.6431373, 1, 0, 1,
-0.7234505, 1.242434, -0.9189192, 0.6392157, 1, 0, 1,
-0.7217723, -0.6979948, -2.111659, 0.6313726, 1, 0, 1,
-0.7080702, 1.872219, 1.413719, 0.627451, 1, 0, 1,
-0.7043774, -0.06943945, -1.723972, 0.6196079, 1, 0, 1,
-0.7015227, 0.587543, -2.19616, 0.6156863, 1, 0, 1,
-0.7011285, 0.3911977, -1.902339, 0.6078432, 1, 0, 1,
-0.6980871, -0.8372685, -3.631949, 0.6039216, 1, 0, 1,
-0.6979992, -0.7171639, -4.346258, 0.5960785, 1, 0, 1,
-0.6923243, -0.7305886, -3.609017, 0.5882353, 1, 0, 1,
-0.686927, -0.5438493, -2.0444, 0.5843138, 1, 0, 1,
-0.6841334, -0.9167673, -2.01193, 0.5764706, 1, 0, 1,
-0.683054, -0.282265, -2.263002, 0.572549, 1, 0, 1,
-0.6769409, 0.3432867, -1.598155, 0.5647059, 1, 0, 1,
-0.6671369, 1.719113, 0.2259987, 0.5607843, 1, 0, 1,
-0.6660497, -0.1128393, -2.982045, 0.5529412, 1, 0, 1,
-0.659966, -0.05083752, -1.979775, 0.5490196, 1, 0, 1,
-0.6593617, -0.8394433, -2.316961, 0.5411765, 1, 0, 1,
-0.6544012, 0.5196179, 0.006741823, 0.5372549, 1, 0, 1,
-0.6536838, -0.2679987, -2.523062, 0.5294118, 1, 0, 1,
-0.6530881, -0.2223357, -1.692266, 0.5254902, 1, 0, 1,
-0.6493913, -0.4292785, -1.82878, 0.5176471, 1, 0, 1,
-0.6487679, 2.21714, -0.3804008, 0.5137255, 1, 0, 1,
-0.6478415, 0.6114274, 0.2752032, 0.5058824, 1, 0, 1,
-0.6457816, -1.777141, -4.512397, 0.5019608, 1, 0, 1,
-0.6447446, 1.48373e-05, -2.425058, 0.4941176, 1, 0, 1,
-0.6434614, -0.2501619, -2.385127, 0.4862745, 1, 0, 1,
-0.6433498, 0.6279109, -0.3920041, 0.4823529, 1, 0, 1,
-0.64213, 0.7832515, -1.004198, 0.4745098, 1, 0, 1,
-0.6401093, -1.370955, -1.431679, 0.4705882, 1, 0, 1,
-0.6320789, -1.554993, -1.866359, 0.4627451, 1, 0, 1,
-0.6317501, 0.2405156, -0.8883526, 0.4588235, 1, 0, 1,
-0.6215652, -0.1396655, -2.208555, 0.4509804, 1, 0, 1,
-0.621428, 0.9677386, -0.4247133, 0.4470588, 1, 0, 1,
-0.6209747, -0.3963522, -1.830248, 0.4392157, 1, 0, 1,
-0.6130499, -0.1089762, -0.9210563, 0.4352941, 1, 0, 1,
-0.610863, 0.4866711, -0.08161332, 0.427451, 1, 0, 1,
-0.610294, -2.027776, -4.726944, 0.4235294, 1, 0, 1,
-0.6095272, 1.042992, 0.5932013, 0.4156863, 1, 0, 1,
-0.6087117, 0.4802805, -2.408885, 0.4117647, 1, 0, 1,
-0.6054739, -0.70426, -3.992551, 0.4039216, 1, 0, 1,
-0.6051967, -0.7618678, -2.099989, 0.3960784, 1, 0, 1,
-0.6029474, 0.2019104, -1.837058, 0.3921569, 1, 0, 1,
-0.601281, -1.57105, -3.64479, 0.3843137, 1, 0, 1,
-0.597437, 0.7813039, 0.306672, 0.3803922, 1, 0, 1,
-0.5963931, 0.4128647, -1.544373, 0.372549, 1, 0, 1,
-0.5955343, -0.2483905, -1.827576, 0.3686275, 1, 0, 1,
-0.5936198, -0.01032283, -1.628531, 0.3607843, 1, 0, 1,
-0.5915878, -0.7474912, -0.5754066, 0.3568628, 1, 0, 1,
-0.5904747, -0.5479748, -1.803009, 0.3490196, 1, 0, 1,
-0.5836494, 0.8798172, -0.6264461, 0.345098, 1, 0, 1,
-0.5778986, -0.7203118, -3.566601, 0.3372549, 1, 0, 1,
-0.5759319, -0.4987608, -1.761287, 0.3333333, 1, 0, 1,
-0.5724897, 0.4847673, 0.1157688, 0.3254902, 1, 0, 1,
-0.5660588, 0.6609005, -2.322427, 0.3215686, 1, 0, 1,
-0.5614904, -0.9418678, -2.595984, 0.3137255, 1, 0, 1,
-0.5595289, -0.880281, -3.410493, 0.3098039, 1, 0, 1,
-0.5549788, -0.6533718, -3.493748, 0.3019608, 1, 0, 1,
-0.5515307, -1.43407, -1.480469, 0.2941177, 1, 0, 1,
-0.5507247, -0.3560566, -0.1835739, 0.2901961, 1, 0, 1,
-0.55046, -0.5755513, -4.153776, 0.282353, 1, 0, 1,
-0.5502245, -1.088731, -2.989078, 0.2784314, 1, 0, 1,
-0.549091, -0.1242196, -2.010161, 0.2705882, 1, 0, 1,
-0.546755, -0.2984967, -1.008983, 0.2666667, 1, 0, 1,
-0.5466044, -1.020981, -3.292592, 0.2588235, 1, 0, 1,
-0.5435012, 1.064407, -0.1619138, 0.254902, 1, 0, 1,
-0.5377852, 0.006790411, -3.672285, 0.2470588, 1, 0, 1,
-0.5372664, 0.3004541, 0.2923011, 0.2431373, 1, 0, 1,
-0.5371618, -1.421118, -3.452535, 0.2352941, 1, 0, 1,
-0.5325884, 1.601832, 0.09787463, 0.2313726, 1, 0, 1,
-0.5297966, -1.087234, -3.286217, 0.2235294, 1, 0, 1,
-0.5232725, -1.933514, -3.084079, 0.2196078, 1, 0, 1,
-0.5228807, 0.2644163, -0.7144824, 0.2117647, 1, 0, 1,
-0.5153611, 0.1334589, -1.260754, 0.2078431, 1, 0, 1,
-0.5098138, 1.851583, -1.770278, 0.2, 1, 0, 1,
-0.5075966, 0.5906264, 0.1356892, 0.1921569, 1, 0, 1,
-0.5048898, 0.2805439, -0.2474286, 0.1882353, 1, 0, 1,
-0.5035049, 0.1439262, -0.8365078, 0.1803922, 1, 0, 1,
-0.49625, -0.4579815, -4.164939, 0.1764706, 1, 0, 1,
-0.4920736, -1.507931, -2.296602, 0.1686275, 1, 0, 1,
-0.4915894, -0.6508808, -1.808873, 0.1647059, 1, 0, 1,
-0.4908411, 0.3462042, -1.016932, 0.1568628, 1, 0, 1,
-0.4816534, -0.3691154, -0.0262601, 0.1529412, 1, 0, 1,
-0.4795259, 1.57182, -1.013471, 0.145098, 1, 0, 1,
-0.4772911, 0.8659872, -1.965069, 0.1411765, 1, 0, 1,
-0.4700743, -0.420508, -2.932671, 0.1333333, 1, 0, 1,
-0.4654251, -0.1034707, -1.364493, 0.1294118, 1, 0, 1,
-0.4653842, -1.429995, -2.792368, 0.1215686, 1, 0, 1,
-0.4645606, -0.6465645, -1.298684, 0.1176471, 1, 0, 1,
-0.4637132, -0.4340962, -2.55877, 0.1098039, 1, 0, 1,
-0.4589989, -1.346536, -3.686336, 0.1058824, 1, 0, 1,
-0.4540464, -0.1609961, -1.371025, 0.09803922, 1, 0, 1,
-0.4490751, 0.9751292, 0.8589924, 0.09019608, 1, 0, 1,
-0.4458537, -0.5431816, -1.771045, 0.08627451, 1, 0, 1,
-0.4457323, -0.3907199, -0.7627097, 0.07843138, 1, 0, 1,
-0.4418257, -1.462891, -3.811811, 0.07450981, 1, 0, 1,
-0.4337767, -0.4002034, -1.832933, 0.06666667, 1, 0, 1,
-0.4316664, -0.3079742, -2.910833, 0.0627451, 1, 0, 1,
-0.4244317, 0.5395654, 1.42, 0.05490196, 1, 0, 1,
-0.4203186, -0.5119488, -1.987497, 0.05098039, 1, 0, 1,
-0.4197055, 0.05908172, -0.2884144, 0.04313726, 1, 0, 1,
-0.41782, -1.045226, -2.232414, 0.03921569, 1, 0, 1,
-0.4157342, 1.248927, -1.122733, 0.03137255, 1, 0, 1,
-0.4149773, -0.7745097, -2.190461, 0.02745098, 1, 0, 1,
-0.4149356, 1.482856, -0.3492077, 0.01960784, 1, 0, 1,
-0.4139873, -0.4513659, -3.823446, 0.01568628, 1, 0, 1,
-0.4111754, 0.3055659, -1.581097, 0.007843138, 1, 0, 1,
-0.4106848, 0.08908875, -2.193775, 0.003921569, 1, 0, 1,
-0.407875, 1.276958, 0.6799065, 0, 1, 0.003921569, 1,
-0.4045733, 0.2216502, 1.218759, 0, 1, 0.01176471, 1,
-0.404507, 0.687655, 1.514313, 0, 1, 0.01568628, 1,
-0.402183, -1.990938, -3.043328, 0, 1, 0.02352941, 1,
-0.4017678, 0.04040568, -1.005252, 0, 1, 0.02745098, 1,
-0.400912, 0.08011828, -1.666696, 0, 1, 0.03529412, 1,
-0.396844, 0.5429253, -2.303638, 0, 1, 0.03921569, 1,
-0.3967445, -1.117878, -1.394872, 0, 1, 0.04705882, 1,
-0.3950618, 0.3727051, 0.1051996, 0, 1, 0.05098039, 1,
-0.3892753, -1.766334, -3.101476, 0, 1, 0.05882353, 1,
-0.3887508, 0.2970462, -1.648303, 0, 1, 0.0627451, 1,
-0.3882557, -0.6757293, -3.892804, 0, 1, 0.07058824, 1,
-0.3851267, -0.1445087, -1.664394, 0, 1, 0.07450981, 1,
-0.3849894, -0.5228249, -3.496056, 0, 1, 0.08235294, 1,
-0.3780871, 0.8202065, -1.41417, 0, 1, 0.08627451, 1,
-0.376438, -0.2419169, -1.342375, 0, 1, 0.09411765, 1,
-0.3742519, 0.6063207, -0.7309415, 0, 1, 0.1019608, 1,
-0.3722411, 1.526039, -0.6590747, 0, 1, 0.1058824, 1,
-0.3706172, -1.154205, -2.453399, 0, 1, 0.1137255, 1,
-0.3683777, -1.546799, 0.1795287, 0, 1, 0.1176471, 1,
-0.3680708, -0.4013333, -2.46651, 0, 1, 0.1254902, 1,
-0.3680687, -0.6466916, -2.243258, 0, 1, 0.1294118, 1,
-0.3659213, -0.7808914, -3.334127, 0, 1, 0.1372549, 1,
-0.3594443, -1.126558, -1.655785, 0, 1, 0.1411765, 1,
-0.3587022, -0.7063982, -3.043761, 0, 1, 0.1490196, 1,
-0.3569638, 0.2555888, -0.2000352, 0, 1, 0.1529412, 1,
-0.3566103, -0.405427, -2.997603, 0, 1, 0.1607843, 1,
-0.3564941, 1.206218, 1.971265, 0, 1, 0.1647059, 1,
-0.3531661, -0.4042397, -3.638453, 0, 1, 0.172549, 1,
-0.3521296, -0.479663, -3.006123, 0, 1, 0.1764706, 1,
-0.3507265, -0.8810856, -2.969287, 0, 1, 0.1843137, 1,
-0.3481799, -0.4007413, -2.265465, 0, 1, 0.1882353, 1,
-0.3417043, -0.06733207, -1.328903, 0, 1, 0.1960784, 1,
-0.3388109, -0.1347639, -0.7695686, 0, 1, 0.2039216, 1,
-0.3379029, -0.9586511, -2.739245, 0, 1, 0.2078431, 1,
-0.3364439, -0.4150521, -3.551113, 0, 1, 0.2156863, 1,
-0.3270739, -0.4188562, -2.691822, 0, 1, 0.2196078, 1,
-0.3265411, -0.8949404, -3.089769, 0, 1, 0.227451, 1,
-0.3223074, -0.3669836, -2.389599, 0, 1, 0.2313726, 1,
-0.3215685, 1.370038, -0.6344919, 0, 1, 0.2392157, 1,
-0.315247, 1.67382, -1.77386, 0, 1, 0.2431373, 1,
-0.3139022, -0.3150844, -2.78528, 0, 1, 0.2509804, 1,
-0.3072596, 0.9224468, -1.254814, 0, 1, 0.254902, 1,
-0.3035773, 0.3604243, -1.132356, 0, 1, 0.2627451, 1,
-0.3010903, 0.3450519, -3.038668, 0, 1, 0.2666667, 1,
-0.3008524, -0.3788255, -2.344277, 0, 1, 0.2745098, 1,
-0.2943329, 0.5657901, -0.3839937, 0, 1, 0.2784314, 1,
-0.2937161, -0.7040169, -3.992052, 0, 1, 0.2862745, 1,
-0.2825605, -0.3039975, -3.210345, 0, 1, 0.2901961, 1,
-0.2800997, -0.3413052, -1.745457, 0, 1, 0.2980392, 1,
-0.2771607, -0.2974725, -1.722954, 0, 1, 0.3058824, 1,
-0.2677049, -1.074544, -4.810894, 0, 1, 0.3098039, 1,
-0.2665724, -0.1643439, -1.982945, 0, 1, 0.3176471, 1,
-0.2659878, 0.05708846, -0.5828803, 0, 1, 0.3215686, 1,
-0.2641486, 0.8852879, 0.2544821, 0, 1, 0.3294118, 1,
-0.2639869, -0.6450466, -3.411508, 0, 1, 0.3333333, 1,
-0.2618259, 0.0960318, -0.8719254, 0, 1, 0.3411765, 1,
-0.2566467, 0.6851476, 0.1556809, 0, 1, 0.345098, 1,
-0.2539874, -0.5000609, -4.461812, 0, 1, 0.3529412, 1,
-0.2536702, 0.6971222, -0.7080765, 0, 1, 0.3568628, 1,
-0.2484647, -1.528137, -3.975305, 0, 1, 0.3647059, 1,
-0.2482159, 1.019065, 0.1012899, 0, 1, 0.3686275, 1,
-0.2478926, 0.03554637, -1.593055, 0, 1, 0.3764706, 1,
-0.2475986, -0.306477, -0.5793632, 0, 1, 0.3803922, 1,
-0.2472525, 0.1074441, -1.747367, 0, 1, 0.3882353, 1,
-0.2433679, -0.7276064, -1.796987, 0, 1, 0.3921569, 1,
-0.2405596, 0.1176931, -1.024035, 0, 1, 0.4, 1,
-0.2378904, 0.3681697, -0.6016834, 0, 1, 0.4078431, 1,
-0.2328078, 0.5405411, -1.598447, 0, 1, 0.4117647, 1,
-0.2262014, 0.4450221, -0.2966135, 0, 1, 0.4196078, 1,
-0.2178478, -0.04934588, -0.5923864, 0, 1, 0.4235294, 1,
-0.2176533, 0.6782259, -1.11016, 0, 1, 0.4313726, 1,
-0.2172502, -0.5188329, -2.528772, 0, 1, 0.4352941, 1,
-0.2143624, 0.03933202, -1.73611, 0, 1, 0.4431373, 1,
-0.2082171, -0.5649957, -3.222801, 0, 1, 0.4470588, 1,
-0.2055519, -0.01407756, -3.083252, 0, 1, 0.454902, 1,
-0.1978833, 1.027186, -0.61136, 0, 1, 0.4588235, 1,
-0.1963314, -0.248926, -2.168669, 0, 1, 0.4666667, 1,
-0.1912579, -0.6640871, -2.391229, 0, 1, 0.4705882, 1,
-0.1912441, 0.5455707, -0.4364457, 0, 1, 0.4784314, 1,
-0.1884988, 1.180634, 1.299687, 0, 1, 0.4823529, 1,
-0.18769, -0.1345996, -0.2637686, 0, 1, 0.4901961, 1,
-0.1760628, -0.9261364, -3.260356, 0, 1, 0.4941176, 1,
-0.1749834, -0.8097595, -2.127179, 0, 1, 0.5019608, 1,
-0.1743018, -0.407755, -3.441917, 0, 1, 0.509804, 1,
-0.1741897, -0.6338858, -2.708387, 0, 1, 0.5137255, 1,
-0.1688132, -1.118588, -3.06772, 0, 1, 0.5215687, 1,
-0.1624266, -1.288576, -2.062461, 0, 1, 0.5254902, 1,
-0.1605984, 0.4385837, -0.7603171, 0, 1, 0.5333334, 1,
-0.1594595, 1.281239, -1.911697, 0, 1, 0.5372549, 1,
-0.1590519, 0.5047942, 0.3438292, 0, 1, 0.5450981, 1,
-0.1583998, 0.06495938, -1.258842, 0, 1, 0.5490196, 1,
-0.1578584, 0.9440702, -1.206958, 0, 1, 0.5568628, 1,
-0.1516308, 0.411961, -0.009630088, 0, 1, 0.5607843, 1,
-0.1426503, 1.55108, 0.8693811, 0, 1, 0.5686275, 1,
-0.1418527, -1.070197, -3.111767, 0, 1, 0.572549, 1,
-0.1404347, -1.389954, -3.668756, 0, 1, 0.5803922, 1,
-0.139708, 0.2688287, -0.2393575, 0, 1, 0.5843138, 1,
-0.1375883, 0.7230452, 1.223753, 0, 1, 0.5921569, 1,
-0.1340521, 0.5246314, 0.2865566, 0, 1, 0.5960785, 1,
-0.1329626, -0.7270399, -1.621871, 0, 1, 0.6039216, 1,
-0.1304686, -0.2977716, -1.718996, 0, 1, 0.6117647, 1,
-0.1270338, 1.636077, -0.605469, 0, 1, 0.6156863, 1,
-0.1242252, 1.013318, 1.199416, 0, 1, 0.6235294, 1,
-0.1240922, 0.01677382, -2.5883, 0, 1, 0.627451, 1,
-0.1174743, -0.4472274, -2.568328, 0, 1, 0.6352941, 1,
-0.1172075, -1.011214, -2.747934, 0, 1, 0.6392157, 1,
-0.1108572, -0.9031594, -4.096445, 0, 1, 0.6470588, 1,
-0.1047084, -1.114207, -4.074366, 0, 1, 0.6509804, 1,
-0.1017924, 0.3621922, -2.474674, 0, 1, 0.6588235, 1,
-0.1002296, -0.8740433, -3.540146, 0, 1, 0.6627451, 1,
-0.09959396, -0.9730392, -3.294416, 0, 1, 0.6705883, 1,
-0.08816709, -0.7098457, -2.894258, 0, 1, 0.6745098, 1,
-0.0847562, 0.1738341, -2.037439, 0, 1, 0.682353, 1,
-0.08348897, 0.3901687, -2.901954, 0, 1, 0.6862745, 1,
-0.08344835, 0.2587566, -1.840158, 0, 1, 0.6941177, 1,
-0.08126866, -0.4965934, -4.153397, 0, 1, 0.7019608, 1,
-0.08085066, 0.3744816, -0.5720184, 0, 1, 0.7058824, 1,
-0.07277033, 0.1280356, 1.642909, 0, 1, 0.7137255, 1,
-0.06968786, 0.02747363, -0.1950983, 0, 1, 0.7176471, 1,
-0.06956621, -0.8050121, -3.702031, 0, 1, 0.7254902, 1,
-0.06927203, -0.4843566, -2.07842, 0, 1, 0.7294118, 1,
-0.06777328, -0.3343735, -3.198437, 0, 1, 0.7372549, 1,
-0.0664745, 1.391705, -2.613196, 0, 1, 0.7411765, 1,
-0.06613535, 1.019661, -2.34391, 0, 1, 0.7490196, 1,
-0.0645642, 0.8037676, -0.4888183, 0, 1, 0.7529412, 1,
-0.06434687, 0.5870811, -1.661547, 0, 1, 0.7607843, 1,
-0.05799299, 0.09885383, 0.3391387, 0, 1, 0.7647059, 1,
-0.05735774, 0.1681451, -0.8530801, 0, 1, 0.772549, 1,
-0.05671411, -1.64966, -3.766273, 0, 1, 0.7764706, 1,
-0.05346359, -0.05421006, -2.739949, 0, 1, 0.7843137, 1,
-0.05295064, -1.017446, -2.792568, 0, 1, 0.7882353, 1,
-0.05217825, -1.397536, -3.524608, 0, 1, 0.7960784, 1,
-0.04382274, 2.291422, 0.05773174, 0, 1, 0.8039216, 1,
-0.04199154, -0.161422, -2.634872, 0, 1, 0.8078431, 1,
-0.04185722, 1.148299, 1.810459, 0, 1, 0.8156863, 1,
-0.04139617, -1.11955, -5.528773, 0, 1, 0.8196079, 1,
-0.04084635, 0.1180751, -0.1679451, 0, 1, 0.827451, 1,
-0.03877864, 0.3406916, -0.807201, 0, 1, 0.8313726, 1,
-0.0359483, 0.169685, -0.0001155805, 0, 1, 0.8392157, 1,
-0.03489012, 0.1091285, -2.202987, 0, 1, 0.8431373, 1,
-0.03228958, -0.6270162, -3.135983, 0, 1, 0.8509804, 1,
-0.0301408, -1.230342, -2.974963, 0, 1, 0.854902, 1,
-0.02783676, 0.1813942, -0.7351665, 0, 1, 0.8627451, 1,
-0.02484833, 0.7218173, -0.3625819, 0, 1, 0.8666667, 1,
-0.02275552, 1.298967, 0.6601692, 0, 1, 0.8745098, 1,
-0.02180232, 0.7759089, -0.4979431, 0, 1, 0.8784314, 1,
-0.01886786, 1.110591, -1.958399, 0, 1, 0.8862745, 1,
-0.01799282, 0.06270105, 2.323644, 0, 1, 0.8901961, 1,
-0.01743232, 0.002831528, -2.674404, 0, 1, 0.8980392, 1,
-0.01726476, -0.9702454, -3.71355, 0, 1, 0.9058824, 1,
-0.01498666, 1.033942, -1.166993, 0, 1, 0.9098039, 1,
0.001251988, -1.760154, 3.806939, 0, 1, 0.9176471, 1,
0.001466742, -0.6131049, 1.835846, 0, 1, 0.9215686, 1,
0.003406835, 0.4788191, 0.2213843, 0, 1, 0.9294118, 1,
0.007986683, 0.6083416, 0.895575, 0, 1, 0.9333333, 1,
0.009155979, -0.4271018, 2.045152, 0, 1, 0.9411765, 1,
0.00940676, -1.408607, 1.855465, 0, 1, 0.945098, 1,
0.01470761, -1.160949, 3.193566, 0, 1, 0.9529412, 1,
0.01739044, 0.9025411, 0.5562283, 0, 1, 0.9568627, 1,
0.02824044, -1.73581, 2.112967, 0, 1, 0.9647059, 1,
0.03099165, 0.7768816, -0.04736434, 0, 1, 0.9686275, 1,
0.03263289, -0.9530854, 5.61866, 0, 1, 0.9764706, 1,
0.03772826, 0.1049773, 0.1003174, 0, 1, 0.9803922, 1,
0.04222525, -1.072589, 3.988056, 0, 1, 0.9882353, 1,
0.04321096, 0.3086909, 0.2425236, 0, 1, 0.9921569, 1,
0.04622494, -1.273937, 2.719868, 0, 1, 1, 1,
0.04724776, -0.9133484, 1.587174, 0, 0.9921569, 1, 1,
0.05016882, 0.8239396, -1.174307, 0, 0.9882353, 1, 1,
0.06147108, 1.634041, 0.3161972, 0, 0.9803922, 1, 1,
0.06190205, -0.4548945, 2.832826, 0, 0.9764706, 1, 1,
0.06973984, 0.1230029, 0.9532559, 0, 0.9686275, 1, 1,
0.07869029, -2.13536, 3.15739, 0, 0.9647059, 1, 1,
0.08536742, 0.01864309, 1.940406, 0, 0.9568627, 1, 1,
0.08603552, -0.8278301, 2.570267, 0, 0.9529412, 1, 1,
0.08857129, -0.8140871, 4.075191, 0, 0.945098, 1, 1,
0.08976609, 0.6229745, 0.3939419, 0, 0.9411765, 1, 1,
0.09150111, -0.7845553, 4.334607, 0, 0.9333333, 1, 1,
0.09259994, -2.311959, 2.609705, 0, 0.9294118, 1, 1,
0.09481865, 0.1580888, -0.118993, 0, 0.9215686, 1, 1,
0.09604856, 0.04461527, 3.952706, 0, 0.9176471, 1, 1,
0.1034665, -1.235481, 0.9080334, 0, 0.9098039, 1, 1,
0.1067474, 0.7610189, 1.028526, 0, 0.9058824, 1, 1,
0.1084111, -0.5408946, 3.230578, 0, 0.8980392, 1, 1,
0.1087375, -1.361709, 2.306189, 0, 0.8901961, 1, 1,
0.1110126, 0.2559663, 0.2418471, 0, 0.8862745, 1, 1,
0.1132948, -0.6600161, 3.334259, 0, 0.8784314, 1, 1,
0.11816, -0.790107, 1.541867, 0, 0.8745098, 1, 1,
0.1222418, 0.9597399, 1.241225, 0, 0.8666667, 1, 1,
0.1226504, -1.137454, 2.401431, 0, 0.8627451, 1, 1,
0.1235598, -0.9688176, 4.804664, 0, 0.854902, 1, 1,
0.1248355, -1.101223, 3.202617, 0, 0.8509804, 1, 1,
0.1317645, -1.337671, 3.500732, 0, 0.8431373, 1, 1,
0.1380645, -0.1578142, 1.672329, 0, 0.8392157, 1, 1,
0.1380866, -0.4823318, 2.800591, 0, 0.8313726, 1, 1,
0.13962, -2.412934, 4.613836, 0, 0.827451, 1, 1,
0.1407779, -0.3833788, 1.508272, 0, 0.8196079, 1, 1,
0.1429021, 0.1562738, 0.4522335, 0, 0.8156863, 1, 1,
0.1472638, 0.1417942, 0.6866515, 0, 0.8078431, 1, 1,
0.1487076, -0.1565742, 3.34022, 0, 0.8039216, 1, 1,
0.1499895, -0.09756776, 0.9813519, 0, 0.7960784, 1, 1,
0.1528111, 1.066674, -0.8767658, 0, 0.7882353, 1, 1,
0.1541885, -1.160206, 1.811313, 0, 0.7843137, 1, 1,
0.1572767, 0.07551321, 0.9125954, 0, 0.7764706, 1, 1,
0.1573764, -1.728683, 1.237797, 0, 0.772549, 1, 1,
0.1666639, -1.345117, 4.444925, 0, 0.7647059, 1, 1,
0.1669411, -0.7143729, 1.580401, 0, 0.7607843, 1, 1,
0.167694, 0.2936716, 3.157819, 0, 0.7529412, 1, 1,
0.1731904, -0.01681307, 1.868587, 0, 0.7490196, 1, 1,
0.1756354, 1.695088, -0.1013489, 0, 0.7411765, 1, 1,
0.1790207, -0.7150422, 3.803318, 0, 0.7372549, 1, 1,
0.1814887, -2.007158, 3.679855, 0, 0.7294118, 1, 1,
0.1822695, -1.844757, 2.326505, 0, 0.7254902, 1, 1,
0.1835273, 1.540084, 1.016033, 0, 0.7176471, 1, 1,
0.1926801, -0.2216143, 2.384767, 0, 0.7137255, 1, 1,
0.1934165, 0.1704455, 2.804714, 0, 0.7058824, 1, 1,
0.1944431, -0.06679097, 1.368506, 0, 0.6980392, 1, 1,
0.1971727, -0.03150365, 3.070109, 0, 0.6941177, 1, 1,
0.1977942, 1.521846, 1.146066, 0, 0.6862745, 1, 1,
0.1981578, -1.140435, 2.334559, 0, 0.682353, 1, 1,
0.2003658, 1.02839, -2.014896, 0, 0.6745098, 1, 1,
0.2003804, 1.522406, 1.666043, 0, 0.6705883, 1, 1,
0.2044453, -0.3574536, 0.8822276, 0, 0.6627451, 1, 1,
0.2064301, -0.5454797, 3.933628, 0, 0.6588235, 1, 1,
0.2093205, -0.4601943, 3.287532, 0, 0.6509804, 1, 1,
0.2122575, -0.325346, 2.1948, 0, 0.6470588, 1, 1,
0.2125451, -0.5702929, 1.898497, 0, 0.6392157, 1, 1,
0.2157515, 0.209802, 1.217458, 0, 0.6352941, 1, 1,
0.2184387, 0.7058647, -1.294476, 0, 0.627451, 1, 1,
0.220089, 0.2424197, 2.845558, 0, 0.6235294, 1, 1,
0.2209845, -0.6608112, 3.64534, 0, 0.6156863, 1, 1,
0.2239855, 0.6809032, 0.5059999, 0, 0.6117647, 1, 1,
0.2243495, 1.093791, 0.7008674, 0, 0.6039216, 1, 1,
0.2295941, -0.2795282, 2.919909, 0, 0.5960785, 1, 1,
0.2318076, 0.3536011, 1.889242, 0, 0.5921569, 1, 1,
0.2328061, -0.03385812, 2.013265, 0, 0.5843138, 1, 1,
0.2328884, -1.301078, 4.217524, 0, 0.5803922, 1, 1,
0.2364412, -1.540332, 2.665853, 0, 0.572549, 1, 1,
0.2376263, 0.3947521, -0.4038086, 0, 0.5686275, 1, 1,
0.2396497, -0.3604729, 4.229607, 0, 0.5607843, 1, 1,
0.2408014, 1.117456, 0.9965268, 0, 0.5568628, 1, 1,
0.2413084, 1.082512, -1.069585, 0, 0.5490196, 1, 1,
0.2415016, -0.6042894, 3.29134, 0, 0.5450981, 1, 1,
0.2505583, 0.6554757, 0.5258204, 0, 0.5372549, 1, 1,
0.2513509, 0.5608454, 0.5999556, 0, 0.5333334, 1, 1,
0.2552822, -1.134359, 3.434145, 0, 0.5254902, 1, 1,
0.2566996, -0.3438345, 1.640302, 0, 0.5215687, 1, 1,
0.2637324, -0.1214978, 1.866606, 0, 0.5137255, 1, 1,
0.2659039, -0.03513512, 0.8880085, 0, 0.509804, 1, 1,
0.2668147, 0.4561484, 0.420462, 0, 0.5019608, 1, 1,
0.267347, -1.553014, 4.822899, 0, 0.4941176, 1, 1,
0.2722247, 1.486759, -1.758645, 0, 0.4901961, 1, 1,
0.2727973, 0.6425484, 0.8962793, 0, 0.4823529, 1, 1,
0.286405, 0.1786593, 1.201689, 0, 0.4784314, 1, 1,
0.2920798, 0.4397952, -0.202756, 0, 0.4705882, 1, 1,
0.2924007, -1.068317, 1.559054, 0, 0.4666667, 1, 1,
0.2940202, 0.04800545, 0.3963135, 0, 0.4588235, 1, 1,
0.2949996, 0.6139812, 2.238827, 0, 0.454902, 1, 1,
0.2968866, 0.8349385, 1.399714, 0, 0.4470588, 1, 1,
0.297723, 0.7507074, 1.104316, 0, 0.4431373, 1, 1,
0.3002227, 0.09819732, 2.783407, 0, 0.4352941, 1, 1,
0.3059063, -0.1953178, 1.96238, 0, 0.4313726, 1, 1,
0.3080695, 1.373814, 1.184159, 0, 0.4235294, 1, 1,
0.3085238, -1.064454, 2.681802, 0, 0.4196078, 1, 1,
0.3098437, 0.1061263, 2.475463, 0, 0.4117647, 1, 1,
0.3103684, -0.4583797, 2.42314, 0, 0.4078431, 1, 1,
0.3111711, 0.2040973, 0.8749216, 0, 0.4, 1, 1,
0.3113848, 1.898594, -0.8758912, 0, 0.3921569, 1, 1,
0.3125804, 0.124908, 2.59071, 0, 0.3882353, 1, 1,
0.3265201, 0.3857611, -0.06166173, 0, 0.3803922, 1, 1,
0.3279447, 0.424269, -0.3106058, 0, 0.3764706, 1, 1,
0.3284601, 0.129341, 2.991443, 0, 0.3686275, 1, 1,
0.3325887, 1.002163, 1.769693, 0, 0.3647059, 1, 1,
0.3340847, 0.8171158, 0.6739359, 0, 0.3568628, 1, 1,
0.3356673, 0.5139779, 1.991343, 0, 0.3529412, 1, 1,
0.335964, -0.7912263, 4.015173, 0, 0.345098, 1, 1,
0.3417379, -0.01651279, 2.068229, 0, 0.3411765, 1, 1,
0.3533066, 0.5943456, -0.5648466, 0, 0.3333333, 1, 1,
0.3591526, -1.103309, 1.850043, 0, 0.3294118, 1, 1,
0.3608155, 0.403248, 1.44353, 0, 0.3215686, 1, 1,
0.3621262, -0.8946652, 1.615983, 0, 0.3176471, 1, 1,
0.3667515, 2.009874, -0.6991068, 0, 0.3098039, 1, 1,
0.3672972, 0.1093868, 1.612982, 0, 0.3058824, 1, 1,
0.369359, -0.8745667, 2.670733, 0, 0.2980392, 1, 1,
0.3708352, 0.7591754, -0.4687078, 0, 0.2901961, 1, 1,
0.3710852, 1.097935, -0.06138534, 0, 0.2862745, 1, 1,
0.3736391, 2.038813, -0.4649042, 0, 0.2784314, 1, 1,
0.3754561, 0.4870475, 0.8064087, 0, 0.2745098, 1, 1,
0.3791423, -1.359514, 2.414397, 0, 0.2666667, 1, 1,
0.3802456, -0.1512992, 0.1664146, 0, 0.2627451, 1, 1,
0.3810161, 0.1914315, 0.9312139, 0, 0.254902, 1, 1,
0.3812985, 1.169026, 0.3681521, 0, 0.2509804, 1, 1,
0.3881198, 0.38578, 2.741105, 0, 0.2431373, 1, 1,
0.3941703, 0.6697297, 2.778357, 0, 0.2392157, 1, 1,
0.3943993, 0.7644347, 0.6379785, 0, 0.2313726, 1, 1,
0.3954321, -1.423614, 3.148271, 0, 0.227451, 1, 1,
0.4003642, 0.8669289, 0.01990098, 0, 0.2196078, 1, 1,
0.4034403, 0.4910702, 0.1084478, 0, 0.2156863, 1, 1,
0.4073304, 0.1153327, 1.741655, 0, 0.2078431, 1, 1,
0.4088304, -1.773724, 5.149894, 0, 0.2039216, 1, 1,
0.4105882, 0.7674459, 0.7045528, 0, 0.1960784, 1, 1,
0.4123418, 0.4645015, 0.6976747, 0, 0.1882353, 1, 1,
0.4130739, 1.068591, 0.3299522, 0, 0.1843137, 1, 1,
0.414534, 1.637737, 2.384319, 0, 0.1764706, 1, 1,
0.4155623, -0.9269777, 2.71069, 0, 0.172549, 1, 1,
0.4165958, 1.163904, 2.685346, 0, 0.1647059, 1, 1,
0.4179603, -1.407691, 3.004591, 0, 0.1607843, 1, 1,
0.4207186, -0.5722497, 3.026499, 0, 0.1529412, 1, 1,
0.4230313, 1.083003, 0.8862473, 0, 0.1490196, 1, 1,
0.4254888, -0.2425885, 1.558447, 0, 0.1411765, 1, 1,
0.4261158, 1.314645, 2.209978, 0, 0.1372549, 1, 1,
0.4339021, -0.04348765, 1.35853, 0, 0.1294118, 1, 1,
0.437657, -1.790808, 2.770823, 0, 0.1254902, 1, 1,
0.4398752, 0.8176056, 0.5012708, 0, 0.1176471, 1, 1,
0.4436506, 0.9777659, -0.9468328, 0, 0.1137255, 1, 1,
0.4466053, -1.732982, 2.017389, 0, 0.1058824, 1, 1,
0.4474832, 0.4144172, 2.040155, 0, 0.09803922, 1, 1,
0.4477496, 0.121277, 0.9323226, 0, 0.09411765, 1, 1,
0.4489744, -0.05737668, 0.5512658, 0, 0.08627451, 1, 1,
0.4532935, 0.3285809, 2.258049, 0, 0.08235294, 1, 1,
0.4539036, 0.8654141, 0.2873388, 0, 0.07450981, 1, 1,
0.4561825, -1.936106, 3.570847, 0, 0.07058824, 1, 1,
0.4574364, -0.8587339, 1.726561, 0, 0.0627451, 1, 1,
0.4619763, -0.6498552, 1.695743, 0, 0.05882353, 1, 1,
0.4628024, 0.4841131, -0.171351, 0, 0.05098039, 1, 1,
0.4635529, -1.016404, 4.630665, 0, 0.04705882, 1, 1,
0.4670534, -1.872676, 1.761627, 0, 0.03921569, 1, 1,
0.4675634, -0.125764, 2.998228, 0, 0.03529412, 1, 1,
0.4801993, 1.083028, -0.1838537, 0, 0.02745098, 1, 1,
0.4833679, 0.7964954, 0.4975507, 0, 0.02352941, 1, 1,
0.4848387, 0.6057935, 0.2452288, 0, 0.01568628, 1, 1,
0.4864146, 1.07997, 0.2369702, 0, 0.01176471, 1, 1,
0.4877843, 1.327579, -1.298089, 0, 0.003921569, 1, 1,
0.4892746, -1.630579, 3.42869, 0.003921569, 0, 1, 1,
0.4904678, -0.7865305, 4.211808, 0.007843138, 0, 1, 1,
0.4928615, -1.224514, 2.872645, 0.01568628, 0, 1, 1,
0.494849, -0.6377634, 2.193802, 0.01960784, 0, 1, 1,
0.494925, -0.3520448, 1.680685, 0.02745098, 0, 1, 1,
0.4955811, 1.347633, -0.07659409, 0.03137255, 0, 1, 1,
0.4967789, 0.3602398, 1.654028, 0.03921569, 0, 1, 1,
0.4988805, -0.3025698, 1.854775, 0.04313726, 0, 1, 1,
0.5017651, -0.0607038, 1.600702, 0.05098039, 0, 1, 1,
0.5022397, 1.357217, -0.8377649, 0.05490196, 0, 1, 1,
0.5091487, -2.442427, 3.962733, 0.0627451, 0, 1, 1,
0.5124037, -0.0624512, 0.7876911, 0.06666667, 0, 1, 1,
0.5145892, 0.2400597, 0.8862427, 0.07450981, 0, 1, 1,
0.5163508, 0.09204718, 1.461224, 0.07843138, 0, 1, 1,
0.5169532, -0.6149396, 2.805614, 0.08627451, 0, 1, 1,
0.5236008, -0.1258169, 0.9019137, 0.09019608, 0, 1, 1,
0.5272084, 0.6859051, 0.8580968, 0.09803922, 0, 1, 1,
0.5335027, 0.6410055, -0.2027501, 0.1058824, 0, 1, 1,
0.5385723, -0.3325121, 1.874656, 0.1098039, 0, 1, 1,
0.5464808, -1.183927, 3.078447, 0.1176471, 0, 1, 1,
0.5483308, -1.486373, 4.875685, 0.1215686, 0, 1, 1,
0.5500123, -1.473982, 2.225071, 0.1294118, 0, 1, 1,
0.5567528, -0.7495131, 1.801084, 0.1333333, 0, 1, 1,
0.5603921, -0.1508185, 0.3447344, 0.1411765, 0, 1, 1,
0.560468, -1.63707, 1.625902, 0.145098, 0, 1, 1,
0.5619125, -0.3429283, 2.434852, 0.1529412, 0, 1, 1,
0.5629995, -0.2267644, 1.863661, 0.1568628, 0, 1, 1,
0.563101, -0.5344895, 2.860521, 0.1647059, 0, 1, 1,
0.5654922, -1.760363, 2.655547, 0.1686275, 0, 1, 1,
0.5683503, 1.599939, 0.6202475, 0.1764706, 0, 1, 1,
0.5694419, 0.7589483, 2.487166, 0.1803922, 0, 1, 1,
0.5694985, 0.2073271, 0.7408477, 0.1882353, 0, 1, 1,
0.5715106, 1.084508, -0.158609, 0.1921569, 0, 1, 1,
0.5725582, 1.556598, 0.731992, 0.2, 0, 1, 1,
0.5726051, 1.141649, 0.6263415, 0.2078431, 0, 1, 1,
0.5779495, 0.2195112, 1.540435, 0.2117647, 0, 1, 1,
0.5790852, -0.6042866, 3.35258, 0.2196078, 0, 1, 1,
0.5816848, 0.2101475, 2.763643, 0.2235294, 0, 1, 1,
0.5872119, 0.6593649, 0.09747102, 0.2313726, 0, 1, 1,
0.5881739, -1.437909, 1.572527, 0.2352941, 0, 1, 1,
0.589543, 0.2914281, 1.221573, 0.2431373, 0, 1, 1,
0.591499, 1.154432, -1.139461, 0.2470588, 0, 1, 1,
0.59871, 0.218498, 2.049467, 0.254902, 0, 1, 1,
0.6058338, -0.8190113, 2.324146, 0.2588235, 0, 1, 1,
0.6062172, 1.316138, -0.1081385, 0.2666667, 0, 1, 1,
0.6112794, 0.1405951, 1.908471, 0.2705882, 0, 1, 1,
0.6130727, 2.805203, -0.7931769, 0.2784314, 0, 1, 1,
0.6230242, -0.4467906, 3.298654, 0.282353, 0, 1, 1,
0.6231523, 0.2666214, 0.9364019, 0.2901961, 0, 1, 1,
0.6239867, -1.007731, 3.706892, 0.2941177, 0, 1, 1,
0.6259025, 0.4845878, 2.788813, 0.3019608, 0, 1, 1,
0.6267021, 0.6997814, 0.9551444, 0.3098039, 0, 1, 1,
0.62705, -0.9587977, 3.576752, 0.3137255, 0, 1, 1,
0.6321008, 0.1541412, 3.129497, 0.3215686, 0, 1, 1,
0.6327785, 0.8189152, 0.1699099, 0.3254902, 0, 1, 1,
0.6351801, 0.5388658, -0.2198773, 0.3333333, 0, 1, 1,
0.6373065, 1.553731, -0.2756131, 0.3372549, 0, 1, 1,
0.6421257, -2.250565, 0.6126749, 0.345098, 0, 1, 1,
0.6424757, -0.8789666, 3.72104, 0.3490196, 0, 1, 1,
0.6439884, -2.228218, 2.225238, 0.3568628, 0, 1, 1,
0.6449931, -0.1252913, 2.410857, 0.3607843, 0, 1, 1,
0.6458824, -1.020595, 4.46187, 0.3686275, 0, 1, 1,
0.6470767, 0.4634627, 1.060068, 0.372549, 0, 1, 1,
0.6495641, 0.3375842, 0.3415115, 0.3803922, 0, 1, 1,
0.6505425, -0.6291254, 2.046113, 0.3843137, 0, 1, 1,
0.6541715, -2.059127, 2.521441, 0.3921569, 0, 1, 1,
0.6546569, 0.4721273, 2.465165, 0.3960784, 0, 1, 1,
0.6549217, -0.4987438, 2.176064, 0.4039216, 0, 1, 1,
0.6555713, -0.2390293, 2.244239, 0.4117647, 0, 1, 1,
0.6559575, -0.901929, 2.705453, 0.4156863, 0, 1, 1,
0.6563011, -0.1544904, 1.391736, 0.4235294, 0, 1, 1,
0.6621484, 0.7767366, 1.183302, 0.427451, 0, 1, 1,
0.6621847, -0.04893062, 1.503502, 0.4352941, 0, 1, 1,
0.6668831, 0.6545882, 2.314812, 0.4392157, 0, 1, 1,
0.6691266, 0.9617709, -0.8041155, 0.4470588, 0, 1, 1,
0.6749475, 0.3061379, 0.513261, 0.4509804, 0, 1, 1,
0.6751364, 0.04433912, 1.668762, 0.4588235, 0, 1, 1,
0.6756269, 0.6948704, 0.9448788, 0.4627451, 0, 1, 1,
0.678451, 0.6725307, 0.2647316, 0.4705882, 0, 1, 1,
0.6822606, 0.5559855, 2.231107, 0.4745098, 0, 1, 1,
0.6827042, 1.099878, 1.650683, 0.4823529, 0, 1, 1,
0.6883729, 1.639283, 0.07181096, 0.4862745, 0, 1, 1,
0.6898172, 0.6513485, 2.115365, 0.4941176, 0, 1, 1,
0.6902969, 1.042278, 2.065962, 0.5019608, 0, 1, 1,
0.6909499, -0.2819037, 3.44972, 0.5058824, 0, 1, 1,
0.692318, -1.573522, 3.47453, 0.5137255, 0, 1, 1,
0.694329, -0.6373428, 2.472418, 0.5176471, 0, 1, 1,
0.6947038, -0.03774736, 2.820499, 0.5254902, 0, 1, 1,
0.6995863, 0.1096712, 0.3737881, 0.5294118, 0, 1, 1,
0.6997068, 0.1094141, 2.630122, 0.5372549, 0, 1, 1,
0.6999611, -0.3197379, 1.062176, 0.5411765, 0, 1, 1,
0.7041267, -0.1771773, 1.257668, 0.5490196, 0, 1, 1,
0.7046149, -1.496271, 0.7644503, 0.5529412, 0, 1, 1,
0.705948, 0.8916041, -0.2181167, 0.5607843, 0, 1, 1,
0.7077169, 0.9140342, 0.3534905, 0.5647059, 0, 1, 1,
0.7143095, 0.1630856, 2.531041, 0.572549, 0, 1, 1,
0.7160692, 0.6181928, 1.630479, 0.5764706, 0, 1, 1,
0.7168254, -0.08773661, 1.93253, 0.5843138, 0, 1, 1,
0.7183491, 0.4772561, 0.1050473, 0.5882353, 0, 1, 1,
0.7256315, 1.764747, -0.9032646, 0.5960785, 0, 1, 1,
0.725777, -0.09708507, 0.5450105, 0.6039216, 0, 1, 1,
0.7280146, -0.134911, 2.665872, 0.6078432, 0, 1, 1,
0.7280827, -0.5581737, 2.56011, 0.6156863, 0, 1, 1,
0.7328561, -1.599363, 0.7440382, 0.6196079, 0, 1, 1,
0.7334532, -0.7197681, 2.13392, 0.627451, 0, 1, 1,
0.7390919, 0.158744, 1.558089, 0.6313726, 0, 1, 1,
0.7397723, 0.787137, 0.8319132, 0.6392157, 0, 1, 1,
0.7426004, -1.167532, 2.64432, 0.6431373, 0, 1, 1,
0.7443757, 0.7406541, -0.1062947, 0.6509804, 0, 1, 1,
0.7484246, 0.8637426, -0.2826571, 0.654902, 0, 1, 1,
0.7506899, 0.7056121, 2.093528, 0.6627451, 0, 1, 1,
0.7571377, -0.5322685, 0.6309423, 0.6666667, 0, 1, 1,
0.7631136, 0.8020681, 0.5414379, 0.6745098, 0, 1, 1,
0.7642037, -1.588001, 4.130687, 0.6784314, 0, 1, 1,
0.7730408, -1.024124, 3.607337, 0.6862745, 0, 1, 1,
0.777149, 1.475956, -0.6710886, 0.6901961, 0, 1, 1,
0.7797602, -1.654244, 3.568898, 0.6980392, 0, 1, 1,
0.7798628, -2.592, 0.607886, 0.7058824, 0, 1, 1,
0.7895424, -0.8138385, 1.44565, 0.7098039, 0, 1, 1,
0.7964038, -1.043651, 3.207553, 0.7176471, 0, 1, 1,
0.7986378, -0.7700723, 1.865001, 0.7215686, 0, 1, 1,
0.8002741, 1.359488, 1.815847, 0.7294118, 0, 1, 1,
0.8019407, 0.7384021, 0.08166096, 0.7333333, 0, 1, 1,
0.8023504, 0.9452575, -0.1548788, 0.7411765, 0, 1, 1,
0.8107911, -1.208442, 5.064216, 0.7450981, 0, 1, 1,
0.8120785, -0.3054867, 2.269097, 0.7529412, 0, 1, 1,
0.8133761, -0.06004419, 0.2378785, 0.7568628, 0, 1, 1,
0.8183244, 1.172866, -0.228114, 0.7647059, 0, 1, 1,
0.8184966, 0.3060205, 1.580602, 0.7686275, 0, 1, 1,
0.821507, -0.06854791, 1.499651, 0.7764706, 0, 1, 1,
0.8242464, -0.3701485, 1.202657, 0.7803922, 0, 1, 1,
0.8245657, -1.132404, 0.7343009, 0.7882353, 0, 1, 1,
0.8247685, 0.2309669, 0.336894, 0.7921569, 0, 1, 1,
0.8270864, 0.8573555, 1.05855, 0.8, 0, 1, 1,
0.8297886, -0.1519905, 1.844439, 0.8078431, 0, 1, 1,
0.8406724, 0.2496762, 1.907965, 0.8117647, 0, 1, 1,
0.841134, 0.03676399, 2.193555, 0.8196079, 0, 1, 1,
0.8475824, 0.03519668, 1.407636, 0.8235294, 0, 1, 1,
0.851038, 1.202934, -0.701755, 0.8313726, 0, 1, 1,
0.8518544, -1.309948, 2.374552, 0.8352941, 0, 1, 1,
0.8555003, 0.6578247, -0.7359785, 0.8431373, 0, 1, 1,
0.8681356, 0.735477, 0.6774233, 0.8470588, 0, 1, 1,
0.8734182, -1.074305, 2.017373, 0.854902, 0, 1, 1,
0.8745803, -0.1943426, 0.6452687, 0.8588235, 0, 1, 1,
0.8837478, 0.8038056, 2.205838, 0.8666667, 0, 1, 1,
0.8847892, 0.260176, 2.264335, 0.8705882, 0, 1, 1,
0.8850591, -1.351763, 5.871188, 0.8784314, 0, 1, 1,
0.890571, -1.365355, 1.005557, 0.8823529, 0, 1, 1,
0.8939629, 0.7380165, 0.1586558, 0.8901961, 0, 1, 1,
0.8956251, 0.7345193, 1.608733, 0.8941177, 0, 1, 1,
0.8966719, -0.3508346, 3.737873, 0.9019608, 0, 1, 1,
0.9065061, -0.5629756, 2.125561, 0.9098039, 0, 1, 1,
0.9132457, -1.573877, 3.188366, 0.9137255, 0, 1, 1,
0.9276397, -0.3479265, 3.263446, 0.9215686, 0, 1, 1,
0.9378187, 1.384932, 0.06465891, 0.9254902, 0, 1, 1,
0.9398699, -1.922983, 0.8166769, 0.9333333, 0, 1, 1,
0.9426104, -0.1755326, 2.070155, 0.9372549, 0, 1, 1,
0.9440375, 0.1053422, 0.7313471, 0.945098, 0, 1, 1,
0.961214, -1.469845, 4.416183, 0.9490196, 0, 1, 1,
0.9627526, 1.198424, 2.081952, 0.9568627, 0, 1, 1,
0.9646711, 0.03836191, 1.524322, 0.9607843, 0, 1, 1,
0.972533, 0.6232193, 1.361937, 0.9686275, 0, 1, 1,
0.9839507, -0.5044388, 2.276799, 0.972549, 0, 1, 1,
0.9847828, -0.8800355, 0.3100045, 0.9803922, 0, 1, 1,
0.9877476, -0.1341049, 1.826548, 0.9843137, 0, 1, 1,
0.9884174, 1.156827, 1.841714, 0.9921569, 0, 1, 1,
0.9913214, -1.166796, 1.261239, 0.9960784, 0, 1, 1,
1.000399, 0.1955994, 3.11814, 1, 0, 0.9960784, 1,
1.00549, 0.2165989, 1.587425, 1, 0, 0.9882353, 1,
1.007002, -1.586402, -0.01482966, 1, 0, 0.9843137, 1,
1.011849, -0.08018723, 1.716054, 1, 0, 0.9764706, 1,
1.023592, 0.585102, -1.234316, 1, 0, 0.972549, 1,
1.02483, 0.4673043, 1.646694, 1, 0, 0.9647059, 1,
1.029023, 0.1671333, 1.706173, 1, 0, 0.9607843, 1,
1.030687, -0.7800165, 2.370164, 1, 0, 0.9529412, 1,
1.035226, 1.320865, 0.16279, 1, 0, 0.9490196, 1,
1.035459, -0.3181343, 1.308475, 1, 0, 0.9411765, 1,
1.037168, -0.2009002, 1.935606, 1, 0, 0.9372549, 1,
1.037466, 1.009321, -0.6271594, 1, 0, 0.9294118, 1,
1.047212, -0.6782709, 3.168293, 1, 0, 0.9254902, 1,
1.048976, 0.6451557, 0.637605, 1, 0, 0.9176471, 1,
1.04999, 2.030097, 1.985805, 1, 0, 0.9137255, 1,
1.055401, -0.5126476, 3.594434, 1, 0, 0.9058824, 1,
1.063586, 0.3579634, 1.296062, 1, 0, 0.9019608, 1,
1.065371, -1.699627, 1.792124, 1, 0, 0.8941177, 1,
1.068873, 1.172525, -0.2036278, 1, 0, 0.8862745, 1,
1.074882, -0.7341517, 2.081476, 1, 0, 0.8823529, 1,
1.094007, -1.711644, 3.039087, 1, 0, 0.8745098, 1,
1.094592, -2.002027, 1.743054, 1, 0, 0.8705882, 1,
1.097746, 0.1943209, 3.690822, 1, 0, 0.8627451, 1,
1.109208, 0.048533, 2.480393, 1, 0, 0.8588235, 1,
1.112739, -0.8108076, 1.730559, 1, 0, 0.8509804, 1,
1.114618, 1.001193, -0.9562458, 1, 0, 0.8470588, 1,
1.125403, -0.4993767, 1.487594, 1, 0, 0.8392157, 1,
1.129338, -0.7252954, 2.516779, 1, 0, 0.8352941, 1,
1.131853, 1.236333, 1.151107, 1, 0, 0.827451, 1,
1.135328, 0.3325038, 0.6751024, 1, 0, 0.8235294, 1,
1.138141, 0.1034366, 1.495106, 1, 0, 0.8156863, 1,
1.142971, 0.04190853, 2.034774, 1, 0, 0.8117647, 1,
1.14771, -0.9667577, 1.339824, 1, 0, 0.8039216, 1,
1.157939, 1.704962, -0.7488179, 1, 0, 0.7960784, 1,
1.178811, 0.06800152, 2.798612, 1, 0, 0.7921569, 1,
1.180883, -0.7002708, 4.089178, 1, 0, 0.7843137, 1,
1.186888, -0.6298013, -0.4800384, 1, 0, 0.7803922, 1,
1.188748, -1.356261, 1.616481, 1, 0, 0.772549, 1,
1.191206, -1.199171, 3.278767, 1, 0, 0.7686275, 1,
1.195685, -1.22673, 2.386441, 1, 0, 0.7607843, 1,
1.198015, 0.6641523, 0.8043972, 1, 0, 0.7568628, 1,
1.204846, -1.889822, 2.990039, 1, 0, 0.7490196, 1,
1.207441, -0.2211977, 2.832303, 1, 0, 0.7450981, 1,
1.209113, 0.5486232, 0.9574692, 1, 0, 0.7372549, 1,
1.213577, -0.3278325, 2.764497, 1, 0, 0.7333333, 1,
1.222232, 0.6177224, 1.77006, 1, 0, 0.7254902, 1,
1.226511, 0.8822659, 2.201569, 1, 0, 0.7215686, 1,
1.227018, -0.5133837, 0.05943421, 1, 0, 0.7137255, 1,
1.227151, -2.178003, 1.366316, 1, 0, 0.7098039, 1,
1.229263, -0.7803198, 1.750045, 1, 0, 0.7019608, 1,
1.233758, -0.1682478, 0.6813613, 1, 0, 0.6941177, 1,
1.235496, -0.2240229, 0.1383584, 1, 0, 0.6901961, 1,
1.236246, 0.5603773, 1.45622, 1, 0, 0.682353, 1,
1.250479, 0.4482228, -0.0584523, 1, 0, 0.6784314, 1,
1.259529, -1.222148, 2.823479, 1, 0, 0.6705883, 1,
1.268031, -2.15504, 2.867467, 1, 0, 0.6666667, 1,
1.275488, -0.9862431, 2.25052, 1, 0, 0.6588235, 1,
1.296477, -0.04856049, 2.768571, 1, 0, 0.654902, 1,
1.301646, 0.3819789, 3.478761, 1, 0, 0.6470588, 1,
1.310171, -0.5150786, 0.289395, 1, 0, 0.6431373, 1,
1.325037, -0.8613682, 1.947663, 1, 0, 0.6352941, 1,
1.327041, -0.04443243, 2.648039, 1, 0, 0.6313726, 1,
1.335818, -1.403999, 1.449538, 1, 0, 0.6235294, 1,
1.336355, 0.6368948, 2.048698, 1, 0, 0.6196079, 1,
1.353385, 1.09525, -0.2957225, 1, 0, 0.6117647, 1,
1.356072, -0.07119615, 1.222242, 1, 0, 0.6078432, 1,
1.363096, -0.00678429, 2.703649, 1, 0, 0.6, 1,
1.38748, -0.3455812, 2.528581, 1, 0, 0.5921569, 1,
1.40933, 0.1025422, 1.04925, 1, 0, 0.5882353, 1,
1.423042, -0.03839001, -0.3976861, 1, 0, 0.5803922, 1,
1.423781, 0.1983756, 2.932954, 1, 0, 0.5764706, 1,
1.427989, 1.410958, 1.471372, 1, 0, 0.5686275, 1,
1.430058, -0.5658243, 1.294009, 1, 0, 0.5647059, 1,
1.442389, 0.8347238, 1.75829, 1, 0, 0.5568628, 1,
1.443525, 1.120738, -0.1823808, 1, 0, 0.5529412, 1,
1.451723, 0.8809562, 1.097349, 1, 0, 0.5450981, 1,
1.457373, -0.2291136, 2.253315, 1, 0, 0.5411765, 1,
1.460282, 0.4938444, 1.309159, 1, 0, 0.5333334, 1,
1.467423, -2.259648, 2.401809, 1, 0, 0.5294118, 1,
1.480573, 1.361939, 0.1097826, 1, 0, 0.5215687, 1,
1.482139, -0.2302637, 2.52722, 1, 0, 0.5176471, 1,
1.489324, -0.3035514, 2.273222, 1, 0, 0.509804, 1,
1.515193, -0.9428418, 2.419165, 1, 0, 0.5058824, 1,
1.520624, 0.8848419, 0.4070944, 1, 0, 0.4980392, 1,
1.523607, 1.6536, 1.163664, 1, 0, 0.4901961, 1,
1.546875, 1.4441, 0.9711784, 1, 0, 0.4862745, 1,
1.573534, 0.60717, 2.510015, 1, 0, 0.4784314, 1,
1.589081, 0.4926257, 0.7660603, 1, 0, 0.4745098, 1,
1.59082, 0.1326116, -0.9742163, 1, 0, 0.4666667, 1,
1.592342, 0.3654498, 3.017894, 1, 0, 0.4627451, 1,
1.594105, -0.4438227, 1.715101, 1, 0, 0.454902, 1,
1.605166, 0.1532129, 1.252646, 1, 0, 0.4509804, 1,
1.61843, -0.2402686, 1.713457, 1, 0, 0.4431373, 1,
1.621934, -0.7084073, 1.74546, 1, 0, 0.4392157, 1,
1.629286, -0.9293676, 1.714778, 1, 0, 0.4313726, 1,
1.633912, -0.03392432, 1.313394, 1, 0, 0.427451, 1,
1.64346, -0.4309573, 1.686145, 1, 0, 0.4196078, 1,
1.656724, -0.6315936, 1.259309, 1, 0, 0.4156863, 1,
1.663986, 0.840651, 2.602913, 1, 0, 0.4078431, 1,
1.687201, -1.121347, 3.268404, 1, 0, 0.4039216, 1,
1.703614, -0.4073648, 2.3046, 1, 0, 0.3960784, 1,
1.706806, -0.2112293, 0.8006569, 1, 0, 0.3882353, 1,
1.714199, -0.09013087, 3.74119, 1, 0, 0.3843137, 1,
1.7261, -2.472056, 1.988622, 1, 0, 0.3764706, 1,
1.747801, 1.602134, 1.118666, 1, 0, 0.372549, 1,
1.751276, 0.0721955, 2.11603, 1, 0, 0.3647059, 1,
1.755121, 0.1929519, 0.5674447, 1, 0, 0.3607843, 1,
1.764879, 0.432201, 0.8876085, 1, 0, 0.3529412, 1,
1.779804, 1.203397, 1.393941, 1, 0, 0.3490196, 1,
1.783403, 1.201258, 2.110076, 1, 0, 0.3411765, 1,
1.783941, -0.2659891, 1.807748, 1, 0, 0.3372549, 1,
1.789806, 1.079548, 1.041358, 1, 0, 0.3294118, 1,
1.79166, -0.190729, 1.831384, 1, 0, 0.3254902, 1,
1.797344, 0.7010042, 1.729112, 1, 0, 0.3176471, 1,
1.804626, -0.001845285, 1.0755, 1, 0, 0.3137255, 1,
1.812981, -0.6477147, 2.265883, 1, 0, 0.3058824, 1,
1.820635, 0.2759157, 2.312602, 1, 0, 0.2980392, 1,
1.831504, -0.09429822, 2.258292, 1, 0, 0.2941177, 1,
1.837347, 0.6120231, 2.461167, 1, 0, 0.2862745, 1,
1.843355, -0.01422535, 3.998709, 1, 0, 0.282353, 1,
1.843786, -0.374106, 2.727905, 1, 0, 0.2745098, 1,
1.847234, -0.1895025, 2.091368, 1, 0, 0.2705882, 1,
1.849234, 0.8744813, 0.03199188, 1, 0, 0.2627451, 1,
1.882531, -0.6683336, 3.304646, 1, 0, 0.2588235, 1,
1.894152, -0.8766252, 2.744903, 1, 0, 0.2509804, 1,
1.895409, 1.079136, 0.2668512, 1, 0, 0.2470588, 1,
1.899546, 1.756044, 1.803043, 1, 0, 0.2392157, 1,
1.904084, 0.9584141, 2.105667, 1, 0, 0.2352941, 1,
1.906816, 0.5881438, 0.7524801, 1, 0, 0.227451, 1,
1.929748, -2.665533, 3.585228, 1, 0, 0.2235294, 1,
1.932119, 2.253322, 0.6545032, 1, 0, 0.2156863, 1,
1.975502, 1.123884, 1.341231, 1, 0, 0.2117647, 1,
1.985528, -0.4739096, 0.09008779, 1, 0, 0.2039216, 1,
1.990014, -0.4045478, 0.8505318, 1, 0, 0.1960784, 1,
1.993861, -0.3267431, 1.780596, 1, 0, 0.1921569, 1,
1.994327, -0.5281279, 3.543575, 1, 0, 0.1843137, 1,
2.000398, -1.486441, 1.867278, 1, 0, 0.1803922, 1,
2.007889, -1.559655, 2.623998, 1, 0, 0.172549, 1,
2.02072, 0.1415955, 2.126363, 1, 0, 0.1686275, 1,
2.025695, 2.68246, -0.7963513, 1, 0, 0.1607843, 1,
2.031064, -0.2186928, 1.012778, 1, 0, 0.1568628, 1,
2.041622, -0.8989937, 2.334045, 1, 0, 0.1490196, 1,
2.091029, -2.331855, 2.459146, 1, 0, 0.145098, 1,
2.108383, -1.634257, 1.469604, 1, 0, 0.1372549, 1,
2.121243, 1.731338, -0.08128149, 1, 0, 0.1333333, 1,
2.128276, 0.7012717, 1.844578, 1, 0, 0.1254902, 1,
2.170056, -0.3821771, 2.680133, 1, 0, 0.1215686, 1,
2.175025, -0.4868214, 1.235577, 1, 0, 0.1137255, 1,
2.200251, -0.4249873, 3.38372, 1, 0, 0.1098039, 1,
2.244517, 1.152384, 1.285018, 1, 0, 0.1019608, 1,
2.280961, 0.2670706, 2.205092, 1, 0, 0.09411765, 1,
2.311235, -1.437073, 1.133188, 1, 0, 0.09019608, 1,
2.331278, 0.7998028, -0.02179515, 1, 0, 0.08235294, 1,
2.349884, 0.7321412, 0.2753883, 1, 0, 0.07843138, 1,
2.39894, -1.037574, 2.276856, 1, 0, 0.07058824, 1,
2.451228, 0.1175953, 0.5212568, 1, 0, 0.06666667, 1,
2.462195, 0.5343769, 3.172184, 1, 0, 0.05882353, 1,
2.464031, -1.711252, 2.259967, 1, 0, 0.05490196, 1,
2.524302, -0.6840609, 1.499065, 1, 0, 0.04705882, 1,
2.53779, -0.1379198, 1.22688, 1, 0, 0.04313726, 1,
2.554387, -1.855943, 2.546417, 1, 0, 0.03529412, 1,
2.586535, -1.55189, -0.01653835, 1, 0, 0.03137255, 1,
2.955881, -0.346992, 1.850994, 1, 0, 0.02352941, 1,
3.027704, 1.890037, 2.178273, 1, 0, 0.01960784, 1,
3.082851, 2.066807, -0.8818214, 1, 0, 0.01176471, 1,
3.232174, 0.8251055, 0.9440134, 1, 0, 0.007843138, 1
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
0.002293229, -3.592823, -7.461066, 0, -0.5, 0.5, 0.5,
0.002293229, -3.592823, -7.461066, 1, -0.5, 0.5, 0.5,
0.002293229, -3.592823, -7.461066, 1, 1.5, 0.5, 0.5,
0.002293229, -3.592823, -7.461066, 0, 1.5, 0.5, 0.5
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
-4.322518, 0.06983483, -7.461066, 0, -0.5, 0.5, 0.5,
-4.322518, 0.06983483, -7.461066, 1, -0.5, 0.5, 0.5,
-4.322518, 0.06983483, -7.461066, 1, 1.5, 0.5, 0.5,
-4.322518, 0.06983483, -7.461066, 0, 1.5, 0.5, 0.5
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
-4.322518, -3.592823, 0.1712074, 0, -0.5, 0.5, 0.5,
-4.322518, -3.592823, 0.1712074, 1, -0.5, 0.5, 0.5,
-4.322518, -3.592823, 0.1712074, 1, 1.5, 0.5, 0.5,
-4.322518, -3.592823, 0.1712074, 0, 1.5, 0.5, 0.5
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
-3, -2.747594, -5.699772,
3, -2.747594, -5.699772,
-3, -2.747594, -5.699772,
-3, -2.888466, -5.993321,
-2, -2.747594, -5.699772,
-2, -2.888466, -5.993321,
-1, -2.747594, -5.699772,
-1, -2.888466, -5.993321,
0, -2.747594, -5.699772,
0, -2.888466, -5.993321,
1, -2.747594, -5.699772,
1, -2.888466, -5.993321,
2, -2.747594, -5.699772,
2, -2.888466, -5.993321,
3, -2.747594, -5.699772,
3, -2.888466, -5.993321
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
-3, -3.170209, -6.580419, 0, -0.5, 0.5, 0.5,
-3, -3.170209, -6.580419, 1, -0.5, 0.5, 0.5,
-3, -3.170209, -6.580419, 1, 1.5, 0.5, 0.5,
-3, -3.170209, -6.580419, 0, 1.5, 0.5, 0.5,
-2, -3.170209, -6.580419, 0, -0.5, 0.5, 0.5,
-2, -3.170209, -6.580419, 1, -0.5, 0.5, 0.5,
-2, -3.170209, -6.580419, 1, 1.5, 0.5, 0.5,
-2, -3.170209, -6.580419, 0, 1.5, 0.5, 0.5,
-1, -3.170209, -6.580419, 0, -0.5, 0.5, 0.5,
-1, -3.170209, -6.580419, 1, -0.5, 0.5, 0.5,
-1, -3.170209, -6.580419, 1, 1.5, 0.5, 0.5,
-1, -3.170209, -6.580419, 0, 1.5, 0.5, 0.5,
0, -3.170209, -6.580419, 0, -0.5, 0.5, 0.5,
0, -3.170209, -6.580419, 1, -0.5, 0.5, 0.5,
0, -3.170209, -6.580419, 1, 1.5, 0.5, 0.5,
0, -3.170209, -6.580419, 0, 1.5, 0.5, 0.5,
1, -3.170209, -6.580419, 0, -0.5, 0.5, 0.5,
1, -3.170209, -6.580419, 1, -0.5, 0.5, 0.5,
1, -3.170209, -6.580419, 1, 1.5, 0.5, 0.5,
1, -3.170209, -6.580419, 0, 1.5, 0.5, 0.5,
2, -3.170209, -6.580419, 0, -0.5, 0.5, 0.5,
2, -3.170209, -6.580419, 1, -0.5, 0.5, 0.5,
2, -3.170209, -6.580419, 1, 1.5, 0.5, 0.5,
2, -3.170209, -6.580419, 0, 1.5, 0.5, 0.5,
3, -3.170209, -6.580419, 0, -0.5, 0.5, 0.5,
3, -3.170209, -6.580419, 1, -0.5, 0.5, 0.5,
3, -3.170209, -6.580419, 1, 1.5, 0.5, 0.5,
3, -3.170209, -6.580419, 0, 1.5, 0.5, 0.5
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
-3.324484, -2, -5.699772,
-3.324484, 2, -5.699772,
-3.324484, -2, -5.699772,
-3.490823, -2, -5.993321,
-3.324484, -1, -5.699772,
-3.490823, -1, -5.993321,
-3.324484, 0, -5.699772,
-3.490823, 0, -5.993321,
-3.324484, 1, -5.699772,
-3.490823, 1, -5.993321,
-3.324484, 2, -5.699772,
-3.490823, 2, -5.993321
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
-3.823501, -2, -6.580419, 0, -0.5, 0.5, 0.5,
-3.823501, -2, -6.580419, 1, -0.5, 0.5, 0.5,
-3.823501, -2, -6.580419, 1, 1.5, 0.5, 0.5,
-3.823501, -2, -6.580419, 0, 1.5, 0.5, 0.5,
-3.823501, -1, -6.580419, 0, -0.5, 0.5, 0.5,
-3.823501, -1, -6.580419, 1, -0.5, 0.5, 0.5,
-3.823501, -1, -6.580419, 1, 1.5, 0.5, 0.5,
-3.823501, -1, -6.580419, 0, 1.5, 0.5, 0.5,
-3.823501, 0, -6.580419, 0, -0.5, 0.5, 0.5,
-3.823501, 0, -6.580419, 1, -0.5, 0.5, 0.5,
-3.823501, 0, -6.580419, 1, 1.5, 0.5, 0.5,
-3.823501, 0, -6.580419, 0, 1.5, 0.5, 0.5,
-3.823501, 1, -6.580419, 0, -0.5, 0.5, 0.5,
-3.823501, 1, -6.580419, 1, -0.5, 0.5, 0.5,
-3.823501, 1, -6.580419, 1, 1.5, 0.5, 0.5,
-3.823501, 1, -6.580419, 0, 1.5, 0.5, 0.5,
-3.823501, 2, -6.580419, 0, -0.5, 0.5, 0.5,
-3.823501, 2, -6.580419, 1, -0.5, 0.5, 0.5,
-3.823501, 2, -6.580419, 1, 1.5, 0.5, 0.5,
-3.823501, 2, -6.580419, 0, 1.5, 0.5, 0.5
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
-3.324484, -2.747594, -4,
-3.324484, -2.747594, 4,
-3.324484, -2.747594, -4,
-3.490823, -2.888466, -4,
-3.324484, -2.747594, -2,
-3.490823, -2.888466, -2,
-3.324484, -2.747594, 0,
-3.490823, -2.888466, 0,
-3.324484, -2.747594, 2,
-3.490823, -2.888466, 2,
-3.324484, -2.747594, 4,
-3.490823, -2.888466, 4
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
-3.823501, -3.170209, -4, 0, -0.5, 0.5, 0.5,
-3.823501, -3.170209, -4, 1, -0.5, 0.5, 0.5,
-3.823501, -3.170209, -4, 1, 1.5, 0.5, 0.5,
-3.823501, -3.170209, -4, 0, 1.5, 0.5, 0.5,
-3.823501, -3.170209, -2, 0, -0.5, 0.5, 0.5,
-3.823501, -3.170209, -2, 1, -0.5, 0.5, 0.5,
-3.823501, -3.170209, -2, 1, 1.5, 0.5, 0.5,
-3.823501, -3.170209, -2, 0, 1.5, 0.5, 0.5,
-3.823501, -3.170209, 0, 0, -0.5, 0.5, 0.5,
-3.823501, -3.170209, 0, 1, -0.5, 0.5, 0.5,
-3.823501, -3.170209, 0, 1, 1.5, 0.5, 0.5,
-3.823501, -3.170209, 0, 0, 1.5, 0.5, 0.5,
-3.823501, -3.170209, 2, 0, -0.5, 0.5, 0.5,
-3.823501, -3.170209, 2, 1, -0.5, 0.5, 0.5,
-3.823501, -3.170209, 2, 1, 1.5, 0.5, 0.5,
-3.823501, -3.170209, 2, 0, 1.5, 0.5, 0.5,
-3.823501, -3.170209, 4, 0, -0.5, 0.5, 0.5,
-3.823501, -3.170209, 4, 1, -0.5, 0.5, 0.5,
-3.823501, -3.170209, 4, 1, 1.5, 0.5, 0.5,
-3.823501, -3.170209, 4, 0, 1.5, 0.5, 0.5
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
-3.324484, -2.747594, -5.699772,
-3.324484, 2.887264, -5.699772,
-3.324484, -2.747594, 6.042187,
-3.324484, 2.887264, 6.042187,
-3.324484, -2.747594, -5.699772,
-3.324484, -2.747594, 6.042187,
-3.324484, 2.887264, -5.699772,
-3.324484, 2.887264, 6.042187,
-3.324484, -2.747594, -5.699772,
3.329071, -2.747594, -5.699772,
-3.324484, -2.747594, 6.042187,
3.329071, -2.747594, 6.042187,
-3.324484, 2.887264, -5.699772,
3.329071, 2.887264, -5.699772,
-3.324484, 2.887264, 6.042187,
3.329071, 2.887264, 6.042187,
3.329071, -2.747594, -5.699772,
3.329071, 2.887264, -5.699772,
3.329071, -2.747594, 6.042187,
3.329071, 2.887264, 6.042187,
3.329071, -2.747594, -5.699772,
3.329071, -2.747594, 6.042187,
3.329071, 2.887264, -5.699772,
3.329071, 2.887264, 6.042187
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
var radius = 7.809546;
var distance = 34.74556;
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
mvMatrix.translate( -0.002293229, -0.06983483, -0.1712074 );
mvMatrix.scale( 1.269071, 1.4985, 0.7191163 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.74556);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
mefluidide<-read.table("mefluidide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mefluidide$V2
```

```
## Error in eval(expr, envir, enclos): object 'mefluidide' not found
```

```r
y<-mefluidide$V3
```

```
## Error in eval(expr, envir, enclos): object 'mefluidide' not found
```

```r
z<-mefluidide$V4
```

```
## Error in eval(expr, envir, enclos): object 'mefluidide' not found
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
-3.227588, 1.469111, -0.9051896, 0, 0, 1, 1, 1,
-2.900102, 0.8930877, -1.195186, 1, 0, 0, 1, 1,
-2.755545, 0.3437533, -1.668061, 1, 0, 0, 1, 1,
-2.585804, -0.3284538, -2.207596, 1, 0, 0, 1, 1,
-2.490748, -1.28624, -0.967275, 1, 0, 0, 1, 1,
-2.476861, 1.373402, -0.1065061, 1, 0, 0, 1, 1,
-2.388524, -0.5408158, -2.399321, 0, 0, 0, 1, 1,
-2.373948, 0.9641734, -1.552967, 0, 0, 0, 1, 1,
-2.321198, 0.581443, -0.3157169, 0, 0, 0, 1, 1,
-2.260384, -0.2767268, -1.125587, 0, 0, 0, 1, 1,
-2.258844, -1.073242, -2.501029, 0, 0, 0, 1, 1,
-2.241127, 1.407658, -1.491979, 0, 0, 0, 1, 1,
-2.216614, -0.2466528, -0.6586704, 0, 0, 0, 1, 1,
-2.204905, -0.6956065, -2.855596, 1, 1, 1, 1, 1,
-2.200589, -0.04467537, -1.269801, 1, 1, 1, 1, 1,
-2.177009, -0.3580665, -0.8718344, 1, 1, 1, 1, 1,
-2.123375, -1.452959, -2.838201, 1, 1, 1, 1, 1,
-2.091604, 0.4558755, -1.632401, 1, 1, 1, 1, 1,
-2.086002, 1.847765, -1.59731, 1, 1, 1, 1, 1,
-2.071813, -0.5593724, -1.400821, 1, 1, 1, 1, 1,
-2.032049, 1.728408, -0.2081086, 1, 1, 1, 1, 1,
-2.02893, -0.8937711, -0.578679, 1, 1, 1, 1, 1,
-2.007948, -1.335649, -2.628026, 1, 1, 1, 1, 1,
-2.001118, 0.9230188, -1.579704, 1, 1, 1, 1, 1,
-1.999958, 0.736216, 0.04172016, 1, 1, 1, 1, 1,
-1.97902, -2.021505, -2.694823, 1, 1, 1, 1, 1,
-1.960796, -0.3546134, -0.5287309, 1, 1, 1, 1, 1,
-1.898095, 2.355306, -1.580922, 1, 1, 1, 1, 1,
-1.896067, -1.018208, -2.01459, 0, 0, 1, 1, 1,
-1.893613, -1.10219, -1.764943, 1, 0, 0, 1, 1,
-1.8561, 1.11572, -1.700691, 1, 0, 0, 1, 1,
-1.851563, -1.053017, -1.168251, 1, 0, 0, 1, 1,
-1.799971, 0.7984126, -1.756768, 1, 0, 0, 1, 1,
-1.799756, 1.28261, -0.846297, 1, 0, 0, 1, 1,
-1.798415, 1.148341, -2.349577, 0, 0, 0, 1, 1,
-1.793883, -0.09500573, -2.65906, 0, 0, 0, 1, 1,
-1.793567, -1.133561, -1.344683, 0, 0, 0, 1, 1,
-1.790367, 0.9245046, -2.952446, 0, 0, 0, 1, 1,
-1.777697, -0.3321701, -2.933452, 0, 0, 0, 1, 1,
-1.757727, 0.1077792, -1.426563, 0, 0, 0, 1, 1,
-1.754294, -0.5293393, -3.680417, 0, 0, 0, 1, 1,
-1.743258, 0.4802523, 0.1486764, 1, 1, 1, 1, 1,
-1.741099, 0.2764374, -1.43841, 1, 1, 1, 1, 1,
-1.738378, -0.05952012, -3.057514, 1, 1, 1, 1, 1,
-1.734126, 1.617478, 0.3138647, 1, 1, 1, 1, 1,
-1.725298, -1.723421, 0.1059623, 1, 1, 1, 1, 1,
-1.690686, 0.1237528, -1.772725, 1, 1, 1, 1, 1,
-1.657219, -0.7598228, -2.098254, 1, 1, 1, 1, 1,
-1.657117, -0.001859979, -1.359642, 1, 1, 1, 1, 1,
-1.649635, -0.7803037, -0.5532784, 1, 1, 1, 1, 1,
-1.64793, -0.2630028, -3.245991, 1, 1, 1, 1, 1,
-1.645673, 1.973702, -0.03051482, 1, 1, 1, 1, 1,
-1.635354, -0.5942904, -2.399182, 1, 1, 1, 1, 1,
-1.616405, 0.7457088, -0.5047428, 1, 1, 1, 1, 1,
-1.613917, -1.784333, -2.915126, 1, 1, 1, 1, 1,
-1.600339, -1.752681, -2.921706, 1, 1, 1, 1, 1,
-1.584, -1.576484, -3.237353, 0, 0, 1, 1, 1,
-1.576263, 1.695313, -0.8628477, 1, 0, 0, 1, 1,
-1.57555, 0.01117691, -0.8051657, 1, 0, 0, 1, 1,
-1.567474, 0.006094235, -1.831705, 1, 0, 0, 1, 1,
-1.552817, 0.01741329, -1.645893, 1, 0, 0, 1, 1,
-1.547905, 2.185204, -1.515537, 1, 0, 0, 1, 1,
-1.538297, 0.3441583, -0.347687, 0, 0, 0, 1, 1,
-1.536364, 0.7828552, -3.463983, 0, 0, 0, 1, 1,
-1.533135, -0.126929, -2.230358, 0, 0, 0, 1, 1,
-1.513982, -0.291344, -1.252621, 0, 0, 0, 1, 1,
-1.501655, -0.3924436, -0.5853126, 0, 0, 0, 1, 1,
-1.498106, -0.1480087, -1.976082, 0, 0, 0, 1, 1,
-1.49363, -0.9803837, -2.104871, 0, 0, 0, 1, 1,
-1.492138, -0.1059293, -1.423632, 1, 1, 1, 1, 1,
-1.477903, -0.09246235, 0.3429735, 1, 1, 1, 1, 1,
-1.456301, -0.8631619, -2.540519, 1, 1, 1, 1, 1,
-1.452446, -0.1788633, -3.563959, 1, 1, 1, 1, 1,
-1.442667, 0.9455612, -0.3513127, 1, 1, 1, 1, 1,
-1.435148, -0.6558719, -2.165236, 1, 1, 1, 1, 1,
-1.423043, 1.177273, -1.560977, 1, 1, 1, 1, 1,
-1.419341, 0.3706361, -0.1553469, 1, 1, 1, 1, 1,
-1.403316, -0.4149835, -1.345108, 1, 1, 1, 1, 1,
-1.402537, -0.9298297, -0.1594895, 1, 1, 1, 1, 1,
-1.401504, 0.5724199, -1.341822, 1, 1, 1, 1, 1,
-1.401185, 1.292521, 1.098377, 1, 1, 1, 1, 1,
-1.395657, 0.1665039, -0.7592595, 1, 1, 1, 1, 1,
-1.381523, -0.2025036, -2.321266, 1, 1, 1, 1, 1,
-1.37532, 1.066396, -2.012563, 1, 1, 1, 1, 1,
-1.361938, 1.153155, -1.125762, 0, 0, 1, 1, 1,
-1.348086, -0.8364922, -2.197427, 1, 0, 0, 1, 1,
-1.338855, 0.06017349, -2.095936, 1, 0, 0, 1, 1,
-1.334353, -0.7952711, -2.235635, 1, 0, 0, 1, 1,
-1.326658, 0.6988218, -4.0097, 1, 0, 0, 1, 1,
-1.325737, 1.202293, -0.1874116, 1, 0, 0, 1, 1,
-1.324674, 1.525606, -0.8498428, 0, 0, 0, 1, 1,
-1.32116, 0.03186769, -2.549555, 0, 0, 0, 1, 1,
-1.31069, -0.1564727, -2.625564, 0, 0, 0, 1, 1,
-1.305124, -0.419366, -1.326238, 0, 0, 0, 1, 1,
-1.30496, -0.3422109, -1.497647, 0, 0, 0, 1, 1,
-1.301554, -0.2262304, -2.073548, 0, 0, 0, 1, 1,
-1.299802, -1.548902, -2.278687, 0, 0, 0, 1, 1,
-1.295113, -0.6983981, -1.637094, 1, 1, 1, 1, 1,
-1.292062, -1.145827, -2.269274, 1, 1, 1, 1, 1,
-1.291675, -1.753085, -4.709235, 1, 1, 1, 1, 1,
-1.28796, 1.444782, -2.284532, 1, 1, 1, 1, 1,
-1.278114, -0.7038314, -1.457893, 1, 1, 1, 1, 1,
-1.272485, 1.743748, -1.046103, 1, 1, 1, 1, 1,
-1.267944, 1.530453, -0.3251306, 1, 1, 1, 1, 1,
-1.262514, -0.1494748, -3.078378, 1, 1, 1, 1, 1,
-1.23696, -0.1186488, -1.828714, 1, 1, 1, 1, 1,
-1.236805, -0.006784339, -1.718761, 1, 1, 1, 1, 1,
-1.230956, 1.231558, -0.8371344, 1, 1, 1, 1, 1,
-1.225449, 0.04440877, -2.648542, 1, 1, 1, 1, 1,
-1.224548, 1.832625, -1.062254, 1, 1, 1, 1, 1,
-1.21857, 1.379654, -0.6541332, 1, 1, 1, 1, 1,
-1.217384, 0.8423977, -2.375008, 1, 1, 1, 1, 1,
-1.213787, 0.189575, -1.966303, 0, 0, 1, 1, 1,
-1.209173, 0.6632168, 0.205865, 1, 0, 0, 1, 1,
-1.197326, 0.9846779, -0.4316657, 1, 0, 0, 1, 1,
-1.195291, -0.7003842, -0.8808645, 1, 0, 0, 1, 1,
-1.18541, -0.7570533, -1.030347, 1, 0, 0, 1, 1,
-1.179897, 1.179451, 0.1464036, 1, 0, 0, 1, 1,
-1.176064, 1.922134, 0.4864373, 0, 0, 0, 1, 1,
-1.173936, 1.52412, -0.4412978, 0, 0, 0, 1, 1,
-1.168034, 2.466029, -0.3307015, 0, 0, 0, 1, 1,
-1.16524, -0.4093945, -0.513743, 0, 0, 0, 1, 1,
-1.156075, -0.4375778, -4.536682, 0, 0, 0, 1, 1,
-1.150623, 0.5422027, -1.56743, 0, 0, 0, 1, 1,
-1.147821, -0.9276363, -1.903373, 0, 0, 0, 1, 1,
-1.147767, -1.072204, -1.989682, 1, 1, 1, 1, 1,
-1.142509, -0.08025389, -1.54264, 1, 1, 1, 1, 1,
-1.135861, -0.6356566, -3.274247, 1, 1, 1, 1, 1,
-1.132042, -0.09200124, -0.07269149, 1, 1, 1, 1, 1,
-1.129634, 0.4927365, -1.670886, 1, 1, 1, 1, 1,
-1.128689, 0.8535761, -1.167788, 1, 1, 1, 1, 1,
-1.118538, 1.635421, 0.8383669, 1, 1, 1, 1, 1,
-1.117992, -1.178655, -2.849938, 1, 1, 1, 1, 1,
-1.112699, 2.244039, -0.8221251, 1, 1, 1, 1, 1,
-1.109265, 0.2313365, 0.5256339, 1, 1, 1, 1, 1,
-1.108403, -0.08097672, -0.3988534, 1, 1, 1, 1, 1,
-1.101751, -1.353886, -2.349969, 1, 1, 1, 1, 1,
-1.100329, -0.267709, -1.465224, 1, 1, 1, 1, 1,
-1.099259, 0.4651565, -0.6587525, 1, 1, 1, 1, 1,
-1.096436, 0.05819252, -1.597369, 1, 1, 1, 1, 1,
-1.085551, 0.2391379, -1.59864, 0, 0, 1, 1, 1,
-1.078686, 1.420654, 0.05529442, 1, 0, 0, 1, 1,
-1.071153, -2.296116, -2.636548, 1, 0, 0, 1, 1,
-1.057625, 0.7441253, -1.373435, 1, 0, 0, 1, 1,
-1.057098, -0.5827008, -0.4520699, 1, 0, 0, 1, 1,
-1.051546, -0.4454689, -2.180192, 1, 0, 0, 1, 1,
-1.047435, 1.636337, -0.7964268, 0, 0, 0, 1, 1,
-1.035221, -0.6599193, -1.147514, 0, 0, 0, 1, 1,
-1.033506, -2.090995, -5.263949, 0, 0, 0, 1, 1,
-1.033003, -0.7045346, -4.194808, 0, 0, 0, 1, 1,
-1.029566, -0.1841936, -1.454527, 0, 0, 0, 1, 1,
-1.029338, -1.466235, -2.921089, 0, 0, 0, 1, 1,
-1.027766, 0.4636974, -3.495923, 0, 0, 0, 1, 1,
-1.013696, -0.2513282, -2.096773, 1, 1, 1, 1, 1,
-0.9904364, -0.7503397, -2.022614, 1, 1, 1, 1, 1,
-0.9819894, -0.6787486, -0.6867195, 1, 1, 1, 1, 1,
-0.981476, 1.355378, -1.063303, 1, 1, 1, 1, 1,
-0.9746338, 0.09818733, -1.880709, 1, 1, 1, 1, 1,
-0.9659465, -0.4054627, -0.6327167, 1, 1, 1, 1, 1,
-0.9658984, 1.273767, -0.534968, 1, 1, 1, 1, 1,
-0.9657058, -1.402882, -1.904276, 1, 1, 1, 1, 1,
-0.9476005, 0.6789857, 1.109743, 1, 1, 1, 1, 1,
-0.9355156, 0.9294404, -0.6442801, 1, 1, 1, 1, 1,
-0.9340665, 1.671599, -0.4905631, 1, 1, 1, 1, 1,
-0.932236, 0.377773, -1.790373, 1, 1, 1, 1, 1,
-0.9306477, -1.175253, -2.375767, 1, 1, 1, 1, 1,
-0.9296374, -0.235158, -1.050066, 1, 1, 1, 1, 1,
-0.9229661, 0.5530102, -0.8483077, 1, 1, 1, 1, 1,
-0.9165625, -0.6597297, -3.782087, 0, 0, 1, 1, 1,
-0.9130065, 0.2767967, -2.401155, 1, 0, 0, 1, 1,
-0.9126612, 0.5805345, -2.55071, 1, 0, 0, 1, 1,
-0.9102582, -0.8626012, -1.817641, 1, 0, 0, 1, 1,
-0.9092767, -0.3193463, -4.592484, 1, 0, 0, 1, 1,
-0.9075797, -0.4440691, -1.329359, 1, 0, 0, 1, 1,
-0.8990268, 1.277229, -2.333862, 0, 0, 0, 1, 1,
-0.8962863, -1.249742, -1.444887, 0, 0, 0, 1, 1,
-0.8952093, -0.5180194, -1.955435, 0, 0, 0, 1, 1,
-0.8946217, -0.2458021, -2.787635, 0, 0, 0, 1, 1,
-0.8913848, -1.766337, -1.254843, 0, 0, 0, 1, 1,
-0.8892664, -0.7776302, -3.40867, 0, 0, 0, 1, 1,
-0.8848107, 1.662499, -0.6144661, 0, 0, 0, 1, 1,
-0.8824489, 1.609169, -0.3824306, 1, 1, 1, 1, 1,
-0.8722941, -1.14237, -1.158948, 1, 1, 1, 1, 1,
-0.8700222, -0.09034251, -1.893908, 1, 1, 1, 1, 1,
-0.8589565, -0.9380217, -3.494777, 1, 1, 1, 1, 1,
-0.8519903, -1.348669, -1.929265, 1, 1, 1, 1, 1,
-0.8471889, -0.2015673, -1.75135, 1, 1, 1, 1, 1,
-0.8460174, -1.271136, -0.6954098, 1, 1, 1, 1, 1,
-0.8425863, -1.360222, -2.623737, 1, 1, 1, 1, 1,
-0.8370823, 1.713163, -0.9458424, 1, 1, 1, 1, 1,
-0.8360033, -0.06726363, -1.669908, 1, 1, 1, 1, 1,
-0.8348557, -1.21844, -3.285358, 1, 1, 1, 1, 1,
-0.8342264, 1.151963, -1.997653, 1, 1, 1, 1, 1,
-0.8294116, -0.4070292, -1.296593, 1, 1, 1, 1, 1,
-0.8259076, 0.3577015, -0.8005392, 1, 1, 1, 1, 1,
-0.8240986, -0.9882174, -2.990659, 1, 1, 1, 1, 1,
-0.8238782, -0.9560984, -1.783744, 0, 0, 1, 1, 1,
-0.8222178, -0.2799281, -2.095079, 1, 0, 0, 1, 1,
-0.8212923, -0.6890104, -2.309258, 1, 0, 0, 1, 1,
-0.8107337, -0.4553591, -3.436921, 1, 0, 0, 1, 1,
-0.8095338, 0.02109196, -1.234967, 1, 0, 0, 1, 1,
-0.8045264, -0.3371174, -2.37796, 1, 0, 0, 1, 1,
-0.7974238, -0.4902315, -1.41193, 0, 0, 0, 1, 1,
-0.7959771, 1.442434, 0.213991, 0, 0, 0, 1, 1,
-0.7949334, 0.3371156, -1.281534, 0, 0, 0, 1, 1,
-0.7944645, -1.099959, -1.923137, 0, 0, 0, 1, 1,
-0.7920809, -1.266807, -2.569738, 0, 0, 0, 1, 1,
-0.7853798, 0.2404567, -0.9933403, 0, 0, 0, 1, 1,
-0.7800915, 0.5277598, 0.4332622, 0, 0, 0, 1, 1,
-0.7727768, 0.9254783, -1.155524, 1, 1, 1, 1, 1,
-0.7712913, -1.122297, -5.071529, 1, 1, 1, 1, 1,
-0.770744, -1.562889, -1.241543, 1, 1, 1, 1, 1,
-0.7703466, -0.7209861, -3.8536, 1, 1, 1, 1, 1,
-0.7662362, 0.4576784, -0.03302881, 1, 1, 1, 1, 1,
-0.7662016, 1.784287, -2.026007, 1, 1, 1, 1, 1,
-0.7586073, -1.677652, -3.00264, 1, 1, 1, 1, 1,
-0.7583134, 0.5721476, -1.95705, 1, 1, 1, 1, 1,
-0.7582614, -0.9190138, -1.43711, 1, 1, 1, 1, 1,
-0.7563545, -0.8338385, -3.066913, 1, 1, 1, 1, 1,
-0.7507172, -0.2247755, -0.5839655, 1, 1, 1, 1, 1,
-0.7496229, 1.682556, 1.053249, 1, 1, 1, 1, 1,
-0.7435748, -0.7330059, -2.766917, 1, 1, 1, 1, 1,
-0.7425656, -0.3204849, -1.070832, 1, 1, 1, 1, 1,
-0.7388862, -0.9674372, -2.304026, 1, 1, 1, 1, 1,
-0.73199, -0.545941, -1.897863, 0, 0, 1, 1, 1,
-0.7283913, 0.07168887, 0.738223, 1, 0, 0, 1, 1,
-0.7234633, 0.8068141, -0.2229516, 1, 0, 0, 1, 1,
-0.7234505, 1.242434, -0.9189192, 1, 0, 0, 1, 1,
-0.7217723, -0.6979948, -2.111659, 1, 0, 0, 1, 1,
-0.7080702, 1.872219, 1.413719, 1, 0, 0, 1, 1,
-0.7043774, -0.06943945, -1.723972, 0, 0, 0, 1, 1,
-0.7015227, 0.587543, -2.19616, 0, 0, 0, 1, 1,
-0.7011285, 0.3911977, -1.902339, 0, 0, 0, 1, 1,
-0.6980871, -0.8372685, -3.631949, 0, 0, 0, 1, 1,
-0.6979992, -0.7171639, -4.346258, 0, 0, 0, 1, 1,
-0.6923243, -0.7305886, -3.609017, 0, 0, 0, 1, 1,
-0.686927, -0.5438493, -2.0444, 0, 0, 0, 1, 1,
-0.6841334, -0.9167673, -2.01193, 1, 1, 1, 1, 1,
-0.683054, -0.282265, -2.263002, 1, 1, 1, 1, 1,
-0.6769409, 0.3432867, -1.598155, 1, 1, 1, 1, 1,
-0.6671369, 1.719113, 0.2259987, 1, 1, 1, 1, 1,
-0.6660497, -0.1128393, -2.982045, 1, 1, 1, 1, 1,
-0.659966, -0.05083752, -1.979775, 1, 1, 1, 1, 1,
-0.6593617, -0.8394433, -2.316961, 1, 1, 1, 1, 1,
-0.6544012, 0.5196179, 0.006741823, 1, 1, 1, 1, 1,
-0.6536838, -0.2679987, -2.523062, 1, 1, 1, 1, 1,
-0.6530881, -0.2223357, -1.692266, 1, 1, 1, 1, 1,
-0.6493913, -0.4292785, -1.82878, 1, 1, 1, 1, 1,
-0.6487679, 2.21714, -0.3804008, 1, 1, 1, 1, 1,
-0.6478415, 0.6114274, 0.2752032, 1, 1, 1, 1, 1,
-0.6457816, -1.777141, -4.512397, 1, 1, 1, 1, 1,
-0.6447446, 1.48373e-05, -2.425058, 1, 1, 1, 1, 1,
-0.6434614, -0.2501619, -2.385127, 0, 0, 1, 1, 1,
-0.6433498, 0.6279109, -0.3920041, 1, 0, 0, 1, 1,
-0.64213, 0.7832515, -1.004198, 1, 0, 0, 1, 1,
-0.6401093, -1.370955, -1.431679, 1, 0, 0, 1, 1,
-0.6320789, -1.554993, -1.866359, 1, 0, 0, 1, 1,
-0.6317501, 0.2405156, -0.8883526, 1, 0, 0, 1, 1,
-0.6215652, -0.1396655, -2.208555, 0, 0, 0, 1, 1,
-0.621428, 0.9677386, -0.4247133, 0, 0, 0, 1, 1,
-0.6209747, -0.3963522, -1.830248, 0, 0, 0, 1, 1,
-0.6130499, -0.1089762, -0.9210563, 0, 0, 0, 1, 1,
-0.610863, 0.4866711, -0.08161332, 0, 0, 0, 1, 1,
-0.610294, -2.027776, -4.726944, 0, 0, 0, 1, 1,
-0.6095272, 1.042992, 0.5932013, 0, 0, 0, 1, 1,
-0.6087117, 0.4802805, -2.408885, 1, 1, 1, 1, 1,
-0.6054739, -0.70426, -3.992551, 1, 1, 1, 1, 1,
-0.6051967, -0.7618678, -2.099989, 1, 1, 1, 1, 1,
-0.6029474, 0.2019104, -1.837058, 1, 1, 1, 1, 1,
-0.601281, -1.57105, -3.64479, 1, 1, 1, 1, 1,
-0.597437, 0.7813039, 0.306672, 1, 1, 1, 1, 1,
-0.5963931, 0.4128647, -1.544373, 1, 1, 1, 1, 1,
-0.5955343, -0.2483905, -1.827576, 1, 1, 1, 1, 1,
-0.5936198, -0.01032283, -1.628531, 1, 1, 1, 1, 1,
-0.5915878, -0.7474912, -0.5754066, 1, 1, 1, 1, 1,
-0.5904747, -0.5479748, -1.803009, 1, 1, 1, 1, 1,
-0.5836494, 0.8798172, -0.6264461, 1, 1, 1, 1, 1,
-0.5778986, -0.7203118, -3.566601, 1, 1, 1, 1, 1,
-0.5759319, -0.4987608, -1.761287, 1, 1, 1, 1, 1,
-0.5724897, 0.4847673, 0.1157688, 1, 1, 1, 1, 1,
-0.5660588, 0.6609005, -2.322427, 0, 0, 1, 1, 1,
-0.5614904, -0.9418678, -2.595984, 1, 0, 0, 1, 1,
-0.5595289, -0.880281, -3.410493, 1, 0, 0, 1, 1,
-0.5549788, -0.6533718, -3.493748, 1, 0, 0, 1, 1,
-0.5515307, -1.43407, -1.480469, 1, 0, 0, 1, 1,
-0.5507247, -0.3560566, -0.1835739, 1, 0, 0, 1, 1,
-0.55046, -0.5755513, -4.153776, 0, 0, 0, 1, 1,
-0.5502245, -1.088731, -2.989078, 0, 0, 0, 1, 1,
-0.549091, -0.1242196, -2.010161, 0, 0, 0, 1, 1,
-0.546755, -0.2984967, -1.008983, 0, 0, 0, 1, 1,
-0.5466044, -1.020981, -3.292592, 0, 0, 0, 1, 1,
-0.5435012, 1.064407, -0.1619138, 0, 0, 0, 1, 1,
-0.5377852, 0.006790411, -3.672285, 0, 0, 0, 1, 1,
-0.5372664, 0.3004541, 0.2923011, 1, 1, 1, 1, 1,
-0.5371618, -1.421118, -3.452535, 1, 1, 1, 1, 1,
-0.5325884, 1.601832, 0.09787463, 1, 1, 1, 1, 1,
-0.5297966, -1.087234, -3.286217, 1, 1, 1, 1, 1,
-0.5232725, -1.933514, -3.084079, 1, 1, 1, 1, 1,
-0.5228807, 0.2644163, -0.7144824, 1, 1, 1, 1, 1,
-0.5153611, 0.1334589, -1.260754, 1, 1, 1, 1, 1,
-0.5098138, 1.851583, -1.770278, 1, 1, 1, 1, 1,
-0.5075966, 0.5906264, 0.1356892, 1, 1, 1, 1, 1,
-0.5048898, 0.2805439, -0.2474286, 1, 1, 1, 1, 1,
-0.5035049, 0.1439262, -0.8365078, 1, 1, 1, 1, 1,
-0.49625, -0.4579815, -4.164939, 1, 1, 1, 1, 1,
-0.4920736, -1.507931, -2.296602, 1, 1, 1, 1, 1,
-0.4915894, -0.6508808, -1.808873, 1, 1, 1, 1, 1,
-0.4908411, 0.3462042, -1.016932, 1, 1, 1, 1, 1,
-0.4816534, -0.3691154, -0.0262601, 0, 0, 1, 1, 1,
-0.4795259, 1.57182, -1.013471, 1, 0, 0, 1, 1,
-0.4772911, 0.8659872, -1.965069, 1, 0, 0, 1, 1,
-0.4700743, -0.420508, -2.932671, 1, 0, 0, 1, 1,
-0.4654251, -0.1034707, -1.364493, 1, 0, 0, 1, 1,
-0.4653842, -1.429995, -2.792368, 1, 0, 0, 1, 1,
-0.4645606, -0.6465645, -1.298684, 0, 0, 0, 1, 1,
-0.4637132, -0.4340962, -2.55877, 0, 0, 0, 1, 1,
-0.4589989, -1.346536, -3.686336, 0, 0, 0, 1, 1,
-0.4540464, -0.1609961, -1.371025, 0, 0, 0, 1, 1,
-0.4490751, 0.9751292, 0.8589924, 0, 0, 0, 1, 1,
-0.4458537, -0.5431816, -1.771045, 0, 0, 0, 1, 1,
-0.4457323, -0.3907199, -0.7627097, 0, 0, 0, 1, 1,
-0.4418257, -1.462891, -3.811811, 1, 1, 1, 1, 1,
-0.4337767, -0.4002034, -1.832933, 1, 1, 1, 1, 1,
-0.4316664, -0.3079742, -2.910833, 1, 1, 1, 1, 1,
-0.4244317, 0.5395654, 1.42, 1, 1, 1, 1, 1,
-0.4203186, -0.5119488, -1.987497, 1, 1, 1, 1, 1,
-0.4197055, 0.05908172, -0.2884144, 1, 1, 1, 1, 1,
-0.41782, -1.045226, -2.232414, 1, 1, 1, 1, 1,
-0.4157342, 1.248927, -1.122733, 1, 1, 1, 1, 1,
-0.4149773, -0.7745097, -2.190461, 1, 1, 1, 1, 1,
-0.4149356, 1.482856, -0.3492077, 1, 1, 1, 1, 1,
-0.4139873, -0.4513659, -3.823446, 1, 1, 1, 1, 1,
-0.4111754, 0.3055659, -1.581097, 1, 1, 1, 1, 1,
-0.4106848, 0.08908875, -2.193775, 1, 1, 1, 1, 1,
-0.407875, 1.276958, 0.6799065, 1, 1, 1, 1, 1,
-0.4045733, 0.2216502, 1.218759, 1, 1, 1, 1, 1,
-0.404507, 0.687655, 1.514313, 0, 0, 1, 1, 1,
-0.402183, -1.990938, -3.043328, 1, 0, 0, 1, 1,
-0.4017678, 0.04040568, -1.005252, 1, 0, 0, 1, 1,
-0.400912, 0.08011828, -1.666696, 1, 0, 0, 1, 1,
-0.396844, 0.5429253, -2.303638, 1, 0, 0, 1, 1,
-0.3967445, -1.117878, -1.394872, 1, 0, 0, 1, 1,
-0.3950618, 0.3727051, 0.1051996, 0, 0, 0, 1, 1,
-0.3892753, -1.766334, -3.101476, 0, 0, 0, 1, 1,
-0.3887508, 0.2970462, -1.648303, 0, 0, 0, 1, 1,
-0.3882557, -0.6757293, -3.892804, 0, 0, 0, 1, 1,
-0.3851267, -0.1445087, -1.664394, 0, 0, 0, 1, 1,
-0.3849894, -0.5228249, -3.496056, 0, 0, 0, 1, 1,
-0.3780871, 0.8202065, -1.41417, 0, 0, 0, 1, 1,
-0.376438, -0.2419169, -1.342375, 1, 1, 1, 1, 1,
-0.3742519, 0.6063207, -0.7309415, 1, 1, 1, 1, 1,
-0.3722411, 1.526039, -0.6590747, 1, 1, 1, 1, 1,
-0.3706172, -1.154205, -2.453399, 1, 1, 1, 1, 1,
-0.3683777, -1.546799, 0.1795287, 1, 1, 1, 1, 1,
-0.3680708, -0.4013333, -2.46651, 1, 1, 1, 1, 1,
-0.3680687, -0.6466916, -2.243258, 1, 1, 1, 1, 1,
-0.3659213, -0.7808914, -3.334127, 1, 1, 1, 1, 1,
-0.3594443, -1.126558, -1.655785, 1, 1, 1, 1, 1,
-0.3587022, -0.7063982, -3.043761, 1, 1, 1, 1, 1,
-0.3569638, 0.2555888, -0.2000352, 1, 1, 1, 1, 1,
-0.3566103, -0.405427, -2.997603, 1, 1, 1, 1, 1,
-0.3564941, 1.206218, 1.971265, 1, 1, 1, 1, 1,
-0.3531661, -0.4042397, -3.638453, 1, 1, 1, 1, 1,
-0.3521296, -0.479663, -3.006123, 1, 1, 1, 1, 1,
-0.3507265, -0.8810856, -2.969287, 0, 0, 1, 1, 1,
-0.3481799, -0.4007413, -2.265465, 1, 0, 0, 1, 1,
-0.3417043, -0.06733207, -1.328903, 1, 0, 0, 1, 1,
-0.3388109, -0.1347639, -0.7695686, 1, 0, 0, 1, 1,
-0.3379029, -0.9586511, -2.739245, 1, 0, 0, 1, 1,
-0.3364439, -0.4150521, -3.551113, 1, 0, 0, 1, 1,
-0.3270739, -0.4188562, -2.691822, 0, 0, 0, 1, 1,
-0.3265411, -0.8949404, -3.089769, 0, 0, 0, 1, 1,
-0.3223074, -0.3669836, -2.389599, 0, 0, 0, 1, 1,
-0.3215685, 1.370038, -0.6344919, 0, 0, 0, 1, 1,
-0.315247, 1.67382, -1.77386, 0, 0, 0, 1, 1,
-0.3139022, -0.3150844, -2.78528, 0, 0, 0, 1, 1,
-0.3072596, 0.9224468, -1.254814, 0, 0, 0, 1, 1,
-0.3035773, 0.3604243, -1.132356, 1, 1, 1, 1, 1,
-0.3010903, 0.3450519, -3.038668, 1, 1, 1, 1, 1,
-0.3008524, -0.3788255, -2.344277, 1, 1, 1, 1, 1,
-0.2943329, 0.5657901, -0.3839937, 1, 1, 1, 1, 1,
-0.2937161, -0.7040169, -3.992052, 1, 1, 1, 1, 1,
-0.2825605, -0.3039975, -3.210345, 1, 1, 1, 1, 1,
-0.2800997, -0.3413052, -1.745457, 1, 1, 1, 1, 1,
-0.2771607, -0.2974725, -1.722954, 1, 1, 1, 1, 1,
-0.2677049, -1.074544, -4.810894, 1, 1, 1, 1, 1,
-0.2665724, -0.1643439, -1.982945, 1, 1, 1, 1, 1,
-0.2659878, 0.05708846, -0.5828803, 1, 1, 1, 1, 1,
-0.2641486, 0.8852879, 0.2544821, 1, 1, 1, 1, 1,
-0.2639869, -0.6450466, -3.411508, 1, 1, 1, 1, 1,
-0.2618259, 0.0960318, -0.8719254, 1, 1, 1, 1, 1,
-0.2566467, 0.6851476, 0.1556809, 1, 1, 1, 1, 1,
-0.2539874, -0.5000609, -4.461812, 0, 0, 1, 1, 1,
-0.2536702, 0.6971222, -0.7080765, 1, 0, 0, 1, 1,
-0.2484647, -1.528137, -3.975305, 1, 0, 0, 1, 1,
-0.2482159, 1.019065, 0.1012899, 1, 0, 0, 1, 1,
-0.2478926, 0.03554637, -1.593055, 1, 0, 0, 1, 1,
-0.2475986, -0.306477, -0.5793632, 1, 0, 0, 1, 1,
-0.2472525, 0.1074441, -1.747367, 0, 0, 0, 1, 1,
-0.2433679, -0.7276064, -1.796987, 0, 0, 0, 1, 1,
-0.2405596, 0.1176931, -1.024035, 0, 0, 0, 1, 1,
-0.2378904, 0.3681697, -0.6016834, 0, 0, 0, 1, 1,
-0.2328078, 0.5405411, -1.598447, 0, 0, 0, 1, 1,
-0.2262014, 0.4450221, -0.2966135, 0, 0, 0, 1, 1,
-0.2178478, -0.04934588, -0.5923864, 0, 0, 0, 1, 1,
-0.2176533, 0.6782259, -1.11016, 1, 1, 1, 1, 1,
-0.2172502, -0.5188329, -2.528772, 1, 1, 1, 1, 1,
-0.2143624, 0.03933202, -1.73611, 1, 1, 1, 1, 1,
-0.2082171, -0.5649957, -3.222801, 1, 1, 1, 1, 1,
-0.2055519, -0.01407756, -3.083252, 1, 1, 1, 1, 1,
-0.1978833, 1.027186, -0.61136, 1, 1, 1, 1, 1,
-0.1963314, -0.248926, -2.168669, 1, 1, 1, 1, 1,
-0.1912579, -0.6640871, -2.391229, 1, 1, 1, 1, 1,
-0.1912441, 0.5455707, -0.4364457, 1, 1, 1, 1, 1,
-0.1884988, 1.180634, 1.299687, 1, 1, 1, 1, 1,
-0.18769, -0.1345996, -0.2637686, 1, 1, 1, 1, 1,
-0.1760628, -0.9261364, -3.260356, 1, 1, 1, 1, 1,
-0.1749834, -0.8097595, -2.127179, 1, 1, 1, 1, 1,
-0.1743018, -0.407755, -3.441917, 1, 1, 1, 1, 1,
-0.1741897, -0.6338858, -2.708387, 1, 1, 1, 1, 1,
-0.1688132, -1.118588, -3.06772, 0, 0, 1, 1, 1,
-0.1624266, -1.288576, -2.062461, 1, 0, 0, 1, 1,
-0.1605984, 0.4385837, -0.7603171, 1, 0, 0, 1, 1,
-0.1594595, 1.281239, -1.911697, 1, 0, 0, 1, 1,
-0.1590519, 0.5047942, 0.3438292, 1, 0, 0, 1, 1,
-0.1583998, 0.06495938, -1.258842, 1, 0, 0, 1, 1,
-0.1578584, 0.9440702, -1.206958, 0, 0, 0, 1, 1,
-0.1516308, 0.411961, -0.009630088, 0, 0, 0, 1, 1,
-0.1426503, 1.55108, 0.8693811, 0, 0, 0, 1, 1,
-0.1418527, -1.070197, -3.111767, 0, 0, 0, 1, 1,
-0.1404347, -1.389954, -3.668756, 0, 0, 0, 1, 1,
-0.139708, 0.2688287, -0.2393575, 0, 0, 0, 1, 1,
-0.1375883, 0.7230452, 1.223753, 0, 0, 0, 1, 1,
-0.1340521, 0.5246314, 0.2865566, 1, 1, 1, 1, 1,
-0.1329626, -0.7270399, -1.621871, 1, 1, 1, 1, 1,
-0.1304686, -0.2977716, -1.718996, 1, 1, 1, 1, 1,
-0.1270338, 1.636077, -0.605469, 1, 1, 1, 1, 1,
-0.1242252, 1.013318, 1.199416, 1, 1, 1, 1, 1,
-0.1240922, 0.01677382, -2.5883, 1, 1, 1, 1, 1,
-0.1174743, -0.4472274, -2.568328, 1, 1, 1, 1, 1,
-0.1172075, -1.011214, -2.747934, 1, 1, 1, 1, 1,
-0.1108572, -0.9031594, -4.096445, 1, 1, 1, 1, 1,
-0.1047084, -1.114207, -4.074366, 1, 1, 1, 1, 1,
-0.1017924, 0.3621922, -2.474674, 1, 1, 1, 1, 1,
-0.1002296, -0.8740433, -3.540146, 1, 1, 1, 1, 1,
-0.09959396, -0.9730392, -3.294416, 1, 1, 1, 1, 1,
-0.08816709, -0.7098457, -2.894258, 1, 1, 1, 1, 1,
-0.0847562, 0.1738341, -2.037439, 1, 1, 1, 1, 1,
-0.08348897, 0.3901687, -2.901954, 0, 0, 1, 1, 1,
-0.08344835, 0.2587566, -1.840158, 1, 0, 0, 1, 1,
-0.08126866, -0.4965934, -4.153397, 1, 0, 0, 1, 1,
-0.08085066, 0.3744816, -0.5720184, 1, 0, 0, 1, 1,
-0.07277033, 0.1280356, 1.642909, 1, 0, 0, 1, 1,
-0.06968786, 0.02747363, -0.1950983, 1, 0, 0, 1, 1,
-0.06956621, -0.8050121, -3.702031, 0, 0, 0, 1, 1,
-0.06927203, -0.4843566, -2.07842, 0, 0, 0, 1, 1,
-0.06777328, -0.3343735, -3.198437, 0, 0, 0, 1, 1,
-0.0664745, 1.391705, -2.613196, 0, 0, 0, 1, 1,
-0.06613535, 1.019661, -2.34391, 0, 0, 0, 1, 1,
-0.0645642, 0.8037676, -0.4888183, 0, 0, 0, 1, 1,
-0.06434687, 0.5870811, -1.661547, 0, 0, 0, 1, 1,
-0.05799299, 0.09885383, 0.3391387, 1, 1, 1, 1, 1,
-0.05735774, 0.1681451, -0.8530801, 1, 1, 1, 1, 1,
-0.05671411, -1.64966, -3.766273, 1, 1, 1, 1, 1,
-0.05346359, -0.05421006, -2.739949, 1, 1, 1, 1, 1,
-0.05295064, -1.017446, -2.792568, 1, 1, 1, 1, 1,
-0.05217825, -1.397536, -3.524608, 1, 1, 1, 1, 1,
-0.04382274, 2.291422, 0.05773174, 1, 1, 1, 1, 1,
-0.04199154, -0.161422, -2.634872, 1, 1, 1, 1, 1,
-0.04185722, 1.148299, 1.810459, 1, 1, 1, 1, 1,
-0.04139617, -1.11955, -5.528773, 1, 1, 1, 1, 1,
-0.04084635, 0.1180751, -0.1679451, 1, 1, 1, 1, 1,
-0.03877864, 0.3406916, -0.807201, 1, 1, 1, 1, 1,
-0.0359483, 0.169685, -0.0001155805, 1, 1, 1, 1, 1,
-0.03489012, 0.1091285, -2.202987, 1, 1, 1, 1, 1,
-0.03228958, -0.6270162, -3.135983, 1, 1, 1, 1, 1,
-0.0301408, -1.230342, -2.974963, 0, 0, 1, 1, 1,
-0.02783676, 0.1813942, -0.7351665, 1, 0, 0, 1, 1,
-0.02484833, 0.7218173, -0.3625819, 1, 0, 0, 1, 1,
-0.02275552, 1.298967, 0.6601692, 1, 0, 0, 1, 1,
-0.02180232, 0.7759089, -0.4979431, 1, 0, 0, 1, 1,
-0.01886786, 1.110591, -1.958399, 1, 0, 0, 1, 1,
-0.01799282, 0.06270105, 2.323644, 0, 0, 0, 1, 1,
-0.01743232, 0.002831528, -2.674404, 0, 0, 0, 1, 1,
-0.01726476, -0.9702454, -3.71355, 0, 0, 0, 1, 1,
-0.01498666, 1.033942, -1.166993, 0, 0, 0, 1, 1,
0.001251988, -1.760154, 3.806939, 0, 0, 0, 1, 1,
0.001466742, -0.6131049, 1.835846, 0, 0, 0, 1, 1,
0.003406835, 0.4788191, 0.2213843, 0, 0, 0, 1, 1,
0.007986683, 0.6083416, 0.895575, 1, 1, 1, 1, 1,
0.009155979, -0.4271018, 2.045152, 1, 1, 1, 1, 1,
0.00940676, -1.408607, 1.855465, 1, 1, 1, 1, 1,
0.01470761, -1.160949, 3.193566, 1, 1, 1, 1, 1,
0.01739044, 0.9025411, 0.5562283, 1, 1, 1, 1, 1,
0.02824044, -1.73581, 2.112967, 1, 1, 1, 1, 1,
0.03099165, 0.7768816, -0.04736434, 1, 1, 1, 1, 1,
0.03263289, -0.9530854, 5.61866, 1, 1, 1, 1, 1,
0.03772826, 0.1049773, 0.1003174, 1, 1, 1, 1, 1,
0.04222525, -1.072589, 3.988056, 1, 1, 1, 1, 1,
0.04321096, 0.3086909, 0.2425236, 1, 1, 1, 1, 1,
0.04622494, -1.273937, 2.719868, 1, 1, 1, 1, 1,
0.04724776, -0.9133484, 1.587174, 1, 1, 1, 1, 1,
0.05016882, 0.8239396, -1.174307, 1, 1, 1, 1, 1,
0.06147108, 1.634041, 0.3161972, 1, 1, 1, 1, 1,
0.06190205, -0.4548945, 2.832826, 0, 0, 1, 1, 1,
0.06973984, 0.1230029, 0.9532559, 1, 0, 0, 1, 1,
0.07869029, -2.13536, 3.15739, 1, 0, 0, 1, 1,
0.08536742, 0.01864309, 1.940406, 1, 0, 0, 1, 1,
0.08603552, -0.8278301, 2.570267, 1, 0, 0, 1, 1,
0.08857129, -0.8140871, 4.075191, 1, 0, 0, 1, 1,
0.08976609, 0.6229745, 0.3939419, 0, 0, 0, 1, 1,
0.09150111, -0.7845553, 4.334607, 0, 0, 0, 1, 1,
0.09259994, -2.311959, 2.609705, 0, 0, 0, 1, 1,
0.09481865, 0.1580888, -0.118993, 0, 0, 0, 1, 1,
0.09604856, 0.04461527, 3.952706, 0, 0, 0, 1, 1,
0.1034665, -1.235481, 0.9080334, 0, 0, 0, 1, 1,
0.1067474, 0.7610189, 1.028526, 0, 0, 0, 1, 1,
0.1084111, -0.5408946, 3.230578, 1, 1, 1, 1, 1,
0.1087375, -1.361709, 2.306189, 1, 1, 1, 1, 1,
0.1110126, 0.2559663, 0.2418471, 1, 1, 1, 1, 1,
0.1132948, -0.6600161, 3.334259, 1, 1, 1, 1, 1,
0.11816, -0.790107, 1.541867, 1, 1, 1, 1, 1,
0.1222418, 0.9597399, 1.241225, 1, 1, 1, 1, 1,
0.1226504, -1.137454, 2.401431, 1, 1, 1, 1, 1,
0.1235598, -0.9688176, 4.804664, 1, 1, 1, 1, 1,
0.1248355, -1.101223, 3.202617, 1, 1, 1, 1, 1,
0.1317645, -1.337671, 3.500732, 1, 1, 1, 1, 1,
0.1380645, -0.1578142, 1.672329, 1, 1, 1, 1, 1,
0.1380866, -0.4823318, 2.800591, 1, 1, 1, 1, 1,
0.13962, -2.412934, 4.613836, 1, 1, 1, 1, 1,
0.1407779, -0.3833788, 1.508272, 1, 1, 1, 1, 1,
0.1429021, 0.1562738, 0.4522335, 1, 1, 1, 1, 1,
0.1472638, 0.1417942, 0.6866515, 0, 0, 1, 1, 1,
0.1487076, -0.1565742, 3.34022, 1, 0, 0, 1, 1,
0.1499895, -0.09756776, 0.9813519, 1, 0, 0, 1, 1,
0.1528111, 1.066674, -0.8767658, 1, 0, 0, 1, 1,
0.1541885, -1.160206, 1.811313, 1, 0, 0, 1, 1,
0.1572767, 0.07551321, 0.9125954, 1, 0, 0, 1, 1,
0.1573764, -1.728683, 1.237797, 0, 0, 0, 1, 1,
0.1666639, -1.345117, 4.444925, 0, 0, 0, 1, 1,
0.1669411, -0.7143729, 1.580401, 0, 0, 0, 1, 1,
0.167694, 0.2936716, 3.157819, 0, 0, 0, 1, 1,
0.1731904, -0.01681307, 1.868587, 0, 0, 0, 1, 1,
0.1756354, 1.695088, -0.1013489, 0, 0, 0, 1, 1,
0.1790207, -0.7150422, 3.803318, 0, 0, 0, 1, 1,
0.1814887, -2.007158, 3.679855, 1, 1, 1, 1, 1,
0.1822695, -1.844757, 2.326505, 1, 1, 1, 1, 1,
0.1835273, 1.540084, 1.016033, 1, 1, 1, 1, 1,
0.1926801, -0.2216143, 2.384767, 1, 1, 1, 1, 1,
0.1934165, 0.1704455, 2.804714, 1, 1, 1, 1, 1,
0.1944431, -0.06679097, 1.368506, 1, 1, 1, 1, 1,
0.1971727, -0.03150365, 3.070109, 1, 1, 1, 1, 1,
0.1977942, 1.521846, 1.146066, 1, 1, 1, 1, 1,
0.1981578, -1.140435, 2.334559, 1, 1, 1, 1, 1,
0.2003658, 1.02839, -2.014896, 1, 1, 1, 1, 1,
0.2003804, 1.522406, 1.666043, 1, 1, 1, 1, 1,
0.2044453, -0.3574536, 0.8822276, 1, 1, 1, 1, 1,
0.2064301, -0.5454797, 3.933628, 1, 1, 1, 1, 1,
0.2093205, -0.4601943, 3.287532, 1, 1, 1, 1, 1,
0.2122575, -0.325346, 2.1948, 1, 1, 1, 1, 1,
0.2125451, -0.5702929, 1.898497, 0, 0, 1, 1, 1,
0.2157515, 0.209802, 1.217458, 1, 0, 0, 1, 1,
0.2184387, 0.7058647, -1.294476, 1, 0, 0, 1, 1,
0.220089, 0.2424197, 2.845558, 1, 0, 0, 1, 1,
0.2209845, -0.6608112, 3.64534, 1, 0, 0, 1, 1,
0.2239855, 0.6809032, 0.5059999, 1, 0, 0, 1, 1,
0.2243495, 1.093791, 0.7008674, 0, 0, 0, 1, 1,
0.2295941, -0.2795282, 2.919909, 0, 0, 0, 1, 1,
0.2318076, 0.3536011, 1.889242, 0, 0, 0, 1, 1,
0.2328061, -0.03385812, 2.013265, 0, 0, 0, 1, 1,
0.2328884, -1.301078, 4.217524, 0, 0, 0, 1, 1,
0.2364412, -1.540332, 2.665853, 0, 0, 0, 1, 1,
0.2376263, 0.3947521, -0.4038086, 0, 0, 0, 1, 1,
0.2396497, -0.3604729, 4.229607, 1, 1, 1, 1, 1,
0.2408014, 1.117456, 0.9965268, 1, 1, 1, 1, 1,
0.2413084, 1.082512, -1.069585, 1, 1, 1, 1, 1,
0.2415016, -0.6042894, 3.29134, 1, 1, 1, 1, 1,
0.2505583, 0.6554757, 0.5258204, 1, 1, 1, 1, 1,
0.2513509, 0.5608454, 0.5999556, 1, 1, 1, 1, 1,
0.2552822, -1.134359, 3.434145, 1, 1, 1, 1, 1,
0.2566996, -0.3438345, 1.640302, 1, 1, 1, 1, 1,
0.2637324, -0.1214978, 1.866606, 1, 1, 1, 1, 1,
0.2659039, -0.03513512, 0.8880085, 1, 1, 1, 1, 1,
0.2668147, 0.4561484, 0.420462, 1, 1, 1, 1, 1,
0.267347, -1.553014, 4.822899, 1, 1, 1, 1, 1,
0.2722247, 1.486759, -1.758645, 1, 1, 1, 1, 1,
0.2727973, 0.6425484, 0.8962793, 1, 1, 1, 1, 1,
0.286405, 0.1786593, 1.201689, 1, 1, 1, 1, 1,
0.2920798, 0.4397952, -0.202756, 0, 0, 1, 1, 1,
0.2924007, -1.068317, 1.559054, 1, 0, 0, 1, 1,
0.2940202, 0.04800545, 0.3963135, 1, 0, 0, 1, 1,
0.2949996, 0.6139812, 2.238827, 1, 0, 0, 1, 1,
0.2968866, 0.8349385, 1.399714, 1, 0, 0, 1, 1,
0.297723, 0.7507074, 1.104316, 1, 0, 0, 1, 1,
0.3002227, 0.09819732, 2.783407, 0, 0, 0, 1, 1,
0.3059063, -0.1953178, 1.96238, 0, 0, 0, 1, 1,
0.3080695, 1.373814, 1.184159, 0, 0, 0, 1, 1,
0.3085238, -1.064454, 2.681802, 0, 0, 0, 1, 1,
0.3098437, 0.1061263, 2.475463, 0, 0, 0, 1, 1,
0.3103684, -0.4583797, 2.42314, 0, 0, 0, 1, 1,
0.3111711, 0.2040973, 0.8749216, 0, 0, 0, 1, 1,
0.3113848, 1.898594, -0.8758912, 1, 1, 1, 1, 1,
0.3125804, 0.124908, 2.59071, 1, 1, 1, 1, 1,
0.3265201, 0.3857611, -0.06166173, 1, 1, 1, 1, 1,
0.3279447, 0.424269, -0.3106058, 1, 1, 1, 1, 1,
0.3284601, 0.129341, 2.991443, 1, 1, 1, 1, 1,
0.3325887, 1.002163, 1.769693, 1, 1, 1, 1, 1,
0.3340847, 0.8171158, 0.6739359, 1, 1, 1, 1, 1,
0.3356673, 0.5139779, 1.991343, 1, 1, 1, 1, 1,
0.335964, -0.7912263, 4.015173, 1, 1, 1, 1, 1,
0.3417379, -0.01651279, 2.068229, 1, 1, 1, 1, 1,
0.3533066, 0.5943456, -0.5648466, 1, 1, 1, 1, 1,
0.3591526, -1.103309, 1.850043, 1, 1, 1, 1, 1,
0.3608155, 0.403248, 1.44353, 1, 1, 1, 1, 1,
0.3621262, -0.8946652, 1.615983, 1, 1, 1, 1, 1,
0.3667515, 2.009874, -0.6991068, 1, 1, 1, 1, 1,
0.3672972, 0.1093868, 1.612982, 0, 0, 1, 1, 1,
0.369359, -0.8745667, 2.670733, 1, 0, 0, 1, 1,
0.3708352, 0.7591754, -0.4687078, 1, 0, 0, 1, 1,
0.3710852, 1.097935, -0.06138534, 1, 0, 0, 1, 1,
0.3736391, 2.038813, -0.4649042, 1, 0, 0, 1, 1,
0.3754561, 0.4870475, 0.8064087, 1, 0, 0, 1, 1,
0.3791423, -1.359514, 2.414397, 0, 0, 0, 1, 1,
0.3802456, -0.1512992, 0.1664146, 0, 0, 0, 1, 1,
0.3810161, 0.1914315, 0.9312139, 0, 0, 0, 1, 1,
0.3812985, 1.169026, 0.3681521, 0, 0, 0, 1, 1,
0.3881198, 0.38578, 2.741105, 0, 0, 0, 1, 1,
0.3941703, 0.6697297, 2.778357, 0, 0, 0, 1, 1,
0.3943993, 0.7644347, 0.6379785, 0, 0, 0, 1, 1,
0.3954321, -1.423614, 3.148271, 1, 1, 1, 1, 1,
0.4003642, 0.8669289, 0.01990098, 1, 1, 1, 1, 1,
0.4034403, 0.4910702, 0.1084478, 1, 1, 1, 1, 1,
0.4073304, 0.1153327, 1.741655, 1, 1, 1, 1, 1,
0.4088304, -1.773724, 5.149894, 1, 1, 1, 1, 1,
0.4105882, 0.7674459, 0.7045528, 1, 1, 1, 1, 1,
0.4123418, 0.4645015, 0.6976747, 1, 1, 1, 1, 1,
0.4130739, 1.068591, 0.3299522, 1, 1, 1, 1, 1,
0.414534, 1.637737, 2.384319, 1, 1, 1, 1, 1,
0.4155623, -0.9269777, 2.71069, 1, 1, 1, 1, 1,
0.4165958, 1.163904, 2.685346, 1, 1, 1, 1, 1,
0.4179603, -1.407691, 3.004591, 1, 1, 1, 1, 1,
0.4207186, -0.5722497, 3.026499, 1, 1, 1, 1, 1,
0.4230313, 1.083003, 0.8862473, 1, 1, 1, 1, 1,
0.4254888, -0.2425885, 1.558447, 1, 1, 1, 1, 1,
0.4261158, 1.314645, 2.209978, 0, 0, 1, 1, 1,
0.4339021, -0.04348765, 1.35853, 1, 0, 0, 1, 1,
0.437657, -1.790808, 2.770823, 1, 0, 0, 1, 1,
0.4398752, 0.8176056, 0.5012708, 1, 0, 0, 1, 1,
0.4436506, 0.9777659, -0.9468328, 1, 0, 0, 1, 1,
0.4466053, -1.732982, 2.017389, 1, 0, 0, 1, 1,
0.4474832, 0.4144172, 2.040155, 0, 0, 0, 1, 1,
0.4477496, 0.121277, 0.9323226, 0, 0, 0, 1, 1,
0.4489744, -0.05737668, 0.5512658, 0, 0, 0, 1, 1,
0.4532935, 0.3285809, 2.258049, 0, 0, 0, 1, 1,
0.4539036, 0.8654141, 0.2873388, 0, 0, 0, 1, 1,
0.4561825, -1.936106, 3.570847, 0, 0, 0, 1, 1,
0.4574364, -0.8587339, 1.726561, 0, 0, 0, 1, 1,
0.4619763, -0.6498552, 1.695743, 1, 1, 1, 1, 1,
0.4628024, 0.4841131, -0.171351, 1, 1, 1, 1, 1,
0.4635529, -1.016404, 4.630665, 1, 1, 1, 1, 1,
0.4670534, -1.872676, 1.761627, 1, 1, 1, 1, 1,
0.4675634, -0.125764, 2.998228, 1, 1, 1, 1, 1,
0.4801993, 1.083028, -0.1838537, 1, 1, 1, 1, 1,
0.4833679, 0.7964954, 0.4975507, 1, 1, 1, 1, 1,
0.4848387, 0.6057935, 0.2452288, 1, 1, 1, 1, 1,
0.4864146, 1.07997, 0.2369702, 1, 1, 1, 1, 1,
0.4877843, 1.327579, -1.298089, 1, 1, 1, 1, 1,
0.4892746, -1.630579, 3.42869, 1, 1, 1, 1, 1,
0.4904678, -0.7865305, 4.211808, 1, 1, 1, 1, 1,
0.4928615, -1.224514, 2.872645, 1, 1, 1, 1, 1,
0.494849, -0.6377634, 2.193802, 1, 1, 1, 1, 1,
0.494925, -0.3520448, 1.680685, 1, 1, 1, 1, 1,
0.4955811, 1.347633, -0.07659409, 0, 0, 1, 1, 1,
0.4967789, 0.3602398, 1.654028, 1, 0, 0, 1, 1,
0.4988805, -0.3025698, 1.854775, 1, 0, 0, 1, 1,
0.5017651, -0.0607038, 1.600702, 1, 0, 0, 1, 1,
0.5022397, 1.357217, -0.8377649, 1, 0, 0, 1, 1,
0.5091487, -2.442427, 3.962733, 1, 0, 0, 1, 1,
0.5124037, -0.0624512, 0.7876911, 0, 0, 0, 1, 1,
0.5145892, 0.2400597, 0.8862427, 0, 0, 0, 1, 1,
0.5163508, 0.09204718, 1.461224, 0, 0, 0, 1, 1,
0.5169532, -0.6149396, 2.805614, 0, 0, 0, 1, 1,
0.5236008, -0.1258169, 0.9019137, 0, 0, 0, 1, 1,
0.5272084, 0.6859051, 0.8580968, 0, 0, 0, 1, 1,
0.5335027, 0.6410055, -0.2027501, 0, 0, 0, 1, 1,
0.5385723, -0.3325121, 1.874656, 1, 1, 1, 1, 1,
0.5464808, -1.183927, 3.078447, 1, 1, 1, 1, 1,
0.5483308, -1.486373, 4.875685, 1, 1, 1, 1, 1,
0.5500123, -1.473982, 2.225071, 1, 1, 1, 1, 1,
0.5567528, -0.7495131, 1.801084, 1, 1, 1, 1, 1,
0.5603921, -0.1508185, 0.3447344, 1, 1, 1, 1, 1,
0.560468, -1.63707, 1.625902, 1, 1, 1, 1, 1,
0.5619125, -0.3429283, 2.434852, 1, 1, 1, 1, 1,
0.5629995, -0.2267644, 1.863661, 1, 1, 1, 1, 1,
0.563101, -0.5344895, 2.860521, 1, 1, 1, 1, 1,
0.5654922, -1.760363, 2.655547, 1, 1, 1, 1, 1,
0.5683503, 1.599939, 0.6202475, 1, 1, 1, 1, 1,
0.5694419, 0.7589483, 2.487166, 1, 1, 1, 1, 1,
0.5694985, 0.2073271, 0.7408477, 1, 1, 1, 1, 1,
0.5715106, 1.084508, -0.158609, 1, 1, 1, 1, 1,
0.5725582, 1.556598, 0.731992, 0, 0, 1, 1, 1,
0.5726051, 1.141649, 0.6263415, 1, 0, 0, 1, 1,
0.5779495, 0.2195112, 1.540435, 1, 0, 0, 1, 1,
0.5790852, -0.6042866, 3.35258, 1, 0, 0, 1, 1,
0.5816848, 0.2101475, 2.763643, 1, 0, 0, 1, 1,
0.5872119, 0.6593649, 0.09747102, 1, 0, 0, 1, 1,
0.5881739, -1.437909, 1.572527, 0, 0, 0, 1, 1,
0.589543, 0.2914281, 1.221573, 0, 0, 0, 1, 1,
0.591499, 1.154432, -1.139461, 0, 0, 0, 1, 1,
0.59871, 0.218498, 2.049467, 0, 0, 0, 1, 1,
0.6058338, -0.8190113, 2.324146, 0, 0, 0, 1, 1,
0.6062172, 1.316138, -0.1081385, 0, 0, 0, 1, 1,
0.6112794, 0.1405951, 1.908471, 0, 0, 0, 1, 1,
0.6130727, 2.805203, -0.7931769, 1, 1, 1, 1, 1,
0.6230242, -0.4467906, 3.298654, 1, 1, 1, 1, 1,
0.6231523, 0.2666214, 0.9364019, 1, 1, 1, 1, 1,
0.6239867, -1.007731, 3.706892, 1, 1, 1, 1, 1,
0.6259025, 0.4845878, 2.788813, 1, 1, 1, 1, 1,
0.6267021, 0.6997814, 0.9551444, 1, 1, 1, 1, 1,
0.62705, -0.9587977, 3.576752, 1, 1, 1, 1, 1,
0.6321008, 0.1541412, 3.129497, 1, 1, 1, 1, 1,
0.6327785, 0.8189152, 0.1699099, 1, 1, 1, 1, 1,
0.6351801, 0.5388658, -0.2198773, 1, 1, 1, 1, 1,
0.6373065, 1.553731, -0.2756131, 1, 1, 1, 1, 1,
0.6421257, -2.250565, 0.6126749, 1, 1, 1, 1, 1,
0.6424757, -0.8789666, 3.72104, 1, 1, 1, 1, 1,
0.6439884, -2.228218, 2.225238, 1, 1, 1, 1, 1,
0.6449931, -0.1252913, 2.410857, 1, 1, 1, 1, 1,
0.6458824, -1.020595, 4.46187, 0, 0, 1, 1, 1,
0.6470767, 0.4634627, 1.060068, 1, 0, 0, 1, 1,
0.6495641, 0.3375842, 0.3415115, 1, 0, 0, 1, 1,
0.6505425, -0.6291254, 2.046113, 1, 0, 0, 1, 1,
0.6541715, -2.059127, 2.521441, 1, 0, 0, 1, 1,
0.6546569, 0.4721273, 2.465165, 1, 0, 0, 1, 1,
0.6549217, -0.4987438, 2.176064, 0, 0, 0, 1, 1,
0.6555713, -0.2390293, 2.244239, 0, 0, 0, 1, 1,
0.6559575, -0.901929, 2.705453, 0, 0, 0, 1, 1,
0.6563011, -0.1544904, 1.391736, 0, 0, 0, 1, 1,
0.6621484, 0.7767366, 1.183302, 0, 0, 0, 1, 1,
0.6621847, -0.04893062, 1.503502, 0, 0, 0, 1, 1,
0.6668831, 0.6545882, 2.314812, 0, 0, 0, 1, 1,
0.6691266, 0.9617709, -0.8041155, 1, 1, 1, 1, 1,
0.6749475, 0.3061379, 0.513261, 1, 1, 1, 1, 1,
0.6751364, 0.04433912, 1.668762, 1, 1, 1, 1, 1,
0.6756269, 0.6948704, 0.9448788, 1, 1, 1, 1, 1,
0.678451, 0.6725307, 0.2647316, 1, 1, 1, 1, 1,
0.6822606, 0.5559855, 2.231107, 1, 1, 1, 1, 1,
0.6827042, 1.099878, 1.650683, 1, 1, 1, 1, 1,
0.6883729, 1.639283, 0.07181096, 1, 1, 1, 1, 1,
0.6898172, 0.6513485, 2.115365, 1, 1, 1, 1, 1,
0.6902969, 1.042278, 2.065962, 1, 1, 1, 1, 1,
0.6909499, -0.2819037, 3.44972, 1, 1, 1, 1, 1,
0.692318, -1.573522, 3.47453, 1, 1, 1, 1, 1,
0.694329, -0.6373428, 2.472418, 1, 1, 1, 1, 1,
0.6947038, -0.03774736, 2.820499, 1, 1, 1, 1, 1,
0.6995863, 0.1096712, 0.3737881, 1, 1, 1, 1, 1,
0.6997068, 0.1094141, 2.630122, 0, 0, 1, 1, 1,
0.6999611, -0.3197379, 1.062176, 1, 0, 0, 1, 1,
0.7041267, -0.1771773, 1.257668, 1, 0, 0, 1, 1,
0.7046149, -1.496271, 0.7644503, 1, 0, 0, 1, 1,
0.705948, 0.8916041, -0.2181167, 1, 0, 0, 1, 1,
0.7077169, 0.9140342, 0.3534905, 1, 0, 0, 1, 1,
0.7143095, 0.1630856, 2.531041, 0, 0, 0, 1, 1,
0.7160692, 0.6181928, 1.630479, 0, 0, 0, 1, 1,
0.7168254, -0.08773661, 1.93253, 0, 0, 0, 1, 1,
0.7183491, 0.4772561, 0.1050473, 0, 0, 0, 1, 1,
0.7256315, 1.764747, -0.9032646, 0, 0, 0, 1, 1,
0.725777, -0.09708507, 0.5450105, 0, 0, 0, 1, 1,
0.7280146, -0.134911, 2.665872, 0, 0, 0, 1, 1,
0.7280827, -0.5581737, 2.56011, 1, 1, 1, 1, 1,
0.7328561, -1.599363, 0.7440382, 1, 1, 1, 1, 1,
0.7334532, -0.7197681, 2.13392, 1, 1, 1, 1, 1,
0.7390919, 0.158744, 1.558089, 1, 1, 1, 1, 1,
0.7397723, 0.787137, 0.8319132, 1, 1, 1, 1, 1,
0.7426004, -1.167532, 2.64432, 1, 1, 1, 1, 1,
0.7443757, 0.7406541, -0.1062947, 1, 1, 1, 1, 1,
0.7484246, 0.8637426, -0.2826571, 1, 1, 1, 1, 1,
0.7506899, 0.7056121, 2.093528, 1, 1, 1, 1, 1,
0.7571377, -0.5322685, 0.6309423, 1, 1, 1, 1, 1,
0.7631136, 0.8020681, 0.5414379, 1, 1, 1, 1, 1,
0.7642037, -1.588001, 4.130687, 1, 1, 1, 1, 1,
0.7730408, -1.024124, 3.607337, 1, 1, 1, 1, 1,
0.777149, 1.475956, -0.6710886, 1, 1, 1, 1, 1,
0.7797602, -1.654244, 3.568898, 1, 1, 1, 1, 1,
0.7798628, -2.592, 0.607886, 0, 0, 1, 1, 1,
0.7895424, -0.8138385, 1.44565, 1, 0, 0, 1, 1,
0.7964038, -1.043651, 3.207553, 1, 0, 0, 1, 1,
0.7986378, -0.7700723, 1.865001, 1, 0, 0, 1, 1,
0.8002741, 1.359488, 1.815847, 1, 0, 0, 1, 1,
0.8019407, 0.7384021, 0.08166096, 1, 0, 0, 1, 1,
0.8023504, 0.9452575, -0.1548788, 0, 0, 0, 1, 1,
0.8107911, -1.208442, 5.064216, 0, 0, 0, 1, 1,
0.8120785, -0.3054867, 2.269097, 0, 0, 0, 1, 1,
0.8133761, -0.06004419, 0.2378785, 0, 0, 0, 1, 1,
0.8183244, 1.172866, -0.228114, 0, 0, 0, 1, 1,
0.8184966, 0.3060205, 1.580602, 0, 0, 0, 1, 1,
0.821507, -0.06854791, 1.499651, 0, 0, 0, 1, 1,
0.8242464, -0.3701485, 1.202657, 1, 1, 1, 1, 1,
0.8245657, -1.132404, 0.7343009, 1, 1, 1, 1, 1,
0.8247685, 0.2309669, 0.336894, 1, 1, 1, 1, 1,
0.8270864, 0.8573555, 1.05855, 1, 1, 1, 1, 1,
0.8297886, -0.1519905, 1.844439, 1, 1, 1, 1, 1,
0.8406724, 0.2496762, 1.907965, 1, 1, 1, 1, 1,
0.841134, 0.03676399, 2.193555, 1, 1, 1, 1, 1,
0.8475824, 0.03519668, 1.407636, 1, 1, 1, 1, 1,
0.851038, 1.202934, -0.701755, 1, 1, 1, 1, 1,
0.8518544, -1.309948, 2.374552, 1, 1, 1, 1, 1,
0.8555003, 0.6578247, -0.7359785, 1, 1, 1, 1, 1,
0.8681356, 0.735477, 0.6774233, 1, 1, 1, 1, 1,
0.8734182, -1.074305, 2.017373, 1, 1, 1, 1, 1,
0.8745803, -0.1943426, 0.6452687, 1, 1, 1, 1, 1,
0.8837478, 0.8038056, 2.205838, 1, 1, 1, 1, 1,
0.8847892, 0.260176, 2.264335, 0, 0, 1, 1, 1,
0.8850591, -1.351763, 5.871188, 1, 0, 0, 1, 1,
0.890571, -1.365355, 1.005557, 1, 0, 0, 1, 1,
0.8939629, 0.7380165, 0.1586558, 1, 0, 0, 1, 1,
0.8956251, 0.7345193, 1.608733, 1, 0, 0, 1, 1,
0.8966719, -0.3508346, 3.737873, 1, 0, 0, 1, 1,
0.9065061, -0.5629756, 2.125561, 0, 0, 0, 1, 1,
0.9132457, -1.573877, 3.188366, 0, 0, 0, 1, 1,
0.9276397, -0.3479265, 3.263446, 0, 0, 0, 1, 1,
0.9378187, 1.384932, 0.06465891, 0, 0, 0, 1, 1,
0.9398699, -1.922983, 0.8166769, 0, 0, 0, 1, 1,
0.9426104, -0.1755326, 2.070155, 0, 0, 0, 1, 1,
0.9440375, 0.1053422, 0.7313471, 0, 0, 0, 1, 1,
0.961214, -1.469845, 4.416183, 1, 1, 1, 1, 1,
0.9627526, 1.198424, 2.081952, 1, 1, 1, 1, 1,
0.9646711, 0.03836191, 1.524322, 1, 1, 1, 1, 1,
0.972533, 0.6232193, 1.361937, 1, 1, 1, 1, 1,
0.9839507, -0.5044388, 2.276799, 1, 1, 1, 1, 1,
0.9847828, -0.8800355, 0.3100045, 1, 1, 1, 1, 1,
0.9877476, -0.1341049, 1.826548, 1, 1, 1, 1, 1,
0.9884174, 1.156827, 1.841714, 1, 1, 1, 1, 1,
0.9913214, -1.166796, 1.261239, 1, 1, 1, 1, 1,
1.000399, 0.1955994, 3.11814, 1, 1, 1, 1, 1,
1.00549, 0.2165989, 1.587425, 1, 1, 1, 1, 1,
1.007002, -1.586402, -0.01482966, 1, 1, 1, 1, 1,
1.011849, -0.08018723, 1.716054, 1, 1, 1, 1, 1,
1.023592, 0.585102, -1.234316, 1, 1, 1, 1, 1,
1.02483, 0.4673043, 1.646694, 1, 1, 1, 1, 1,
1.029023, 0.1671333, 1.706173, 0, 0, 1, 1, 1,
1.030687, -0.7800165, 2.370164, 1, 0, 0, 1, 1,
1.035226, 1.320865, 0.16279, 1, 0, 0, 1, 1,
1.035459, -0.3181343, 1.308475, 1, 0, 0, 1, 1,
1.037168, -0.2009002, 1.935606, 1, 0, 0, 1, 1,
1.037466, 1.009321, -0.6271594, 1, 0, 0, 1, 1,
1.047212, -0.6782709, 3.168293, 0, 0, 0, 1, 1,
1.048976, 0.6451557, 0.637605, 0, 0, 0, 1, 1,
1.04999, 2.030097, 1.985805, 0, 0, 0, 1, 1,
1.055401, -0.5126476, 3.594434, 0, 0, 0, 1, 1,
1.063586, 0.3579634, 1.296062, 0, 0, 0, 1, 1,
1.065371, -1.699627, 1.792124, 0, 0, 0, 1, 1,
1.068873, 1.172525, -0.2036278, 0, 0, 0, 1, 1,
1.074882, -0.7341517, 2.081476, 1, 1, 1, 1, 1,
1.094007, -1.711644, 3.039087, 1, 1, 1, 1, 1,
1.094592, -2.002027, 1.743054, 1, 1, 1, 1, 1,
1.097746, 0.1943209, 3.690822, 1, 1, 1, 1, 1,
1.109208, 0.048533, 2.480393, 1, 1, 1, 1, 1,
1.112739, -0.8108076, 1.730559, 1, 1, 1, 1, 1,
1.114618, 1.001193, -0.9562458, 1, 1, 1, 1, 1,
1.125403, -0.4993767, 1.487594, 1, 1, 1, 1, 1,
1.129338, -0.7252954, 2.516779, 1, 1, 1, 1, 1,
1.131853, 1.236333, 1.151107, 1, 1, 1, 1, 1,
1.135328, 0.3325038, 0.6751024, 1, 1, 1, 1, 1,
1.138141, 0.1034366, 1.495106, 1, 1, 1, 1, 1,
1.142971, 0.04190853, 2.034774, 1, 1, 1, 1, 1,
1.14771, -0.9667577, 1.339824, 1, 1, 1, 1, 1,
1.157939, 1.704962, -0.7488179, 1, 1, 1, 1, 1,
1.178811, 0.06800152, 2.798612, 0, 0, 1, 1, 1,
1.180883, -0.7002708, 4.089178, 1, 0, 0, 1, 1,
1.186888, -0.6298013, -0.4800384, 1, 0, 0, 1, 1,
1.188748, -1.356261, 1.616481, 1, 0, 0, 1, 1,
1.191206, -1.199171, 3.278767, 1, 0, 0, 1, 1,
1.195685, -1.22673, 2.386441, 1, 0, 0, 1, 1,
1.198015, 0.6641523, 0.8043972, 0, 0, 0, 1, 1,
1.204846, -1.889822, 2.990039, 0, 0, 0, 1, 1,
1.207441, -0.2211977, 2.832303, 0, 0, 0, 1, 1,
1.209113, 0.5486232, 0.9574692, 0, 0, 0, 1, 1,
1.213577, -0.3278325, 2.764497, 0, 0, 0, 1, 1,
1.222232, 0.6177224, 1.77006, 0, 0, 0, 1, 1,
1.226511, 0.8822659, 2.201569, 0, 0, 0, 1, 1,
1.227018, -0.5133837, 0.05943421, 1, 1, 1, 1, 1,
1.227151, -2.178003, 1.366316, 1, 1, 1, 1, 1,
1.229263, -0.7803198, 1.750045, 1, 1, 1, 1, 1,
1.233758, -0.1682478, 0.6813613, 1, 1, 1, 1, 1,
1.235496, -0.2240229, 0.1383584, 1, 1, 1, 1, 1,
1.236246, 0.5603773, 1.45622, 1, 1, 1, 1, 1,
1.250479, 0.4482228, -0.0584523, 1, 1, 1, 1, 1,
1.259529, -1.222148, 2.823479, 1, 1, 1, 1, 1,
1.268031, -2.15504, 2.867467, 1, 1, 1, 1, 1,
1.275488, -0.9862431, 2.25052, 1, 1, 1, 1, 1,
1.296477, -0.04856049, 2.768571, 1, 1, 1, 1, 1,
1.301646, 0.3819789, 3.478761, 1, 1, 1, 1, 1,
1.310171, -0.5150786, 0.289395, 1, 1, 1, 1, 1,
1.325037, -0.8613682, 1.947663, 1, 1, 1, 1, 1,
1.327041, -0.04443243, 2.648039, 1, 1, 1, 1, 1,
1.335818, -1.403999, 1.449538, 0, 0, 1, 1, 1,
1.336355, 0.6368948, 2.048698, 1, 0, 0, 1, 1,
1.353385, 1.09525, -0.2957225, 1, 0, 0, 1, 1,
1.356072, -0.07119615, 1.222242, 1, 0, 0, 1, 1,
1.363096, -0.00678429, 2.703649, 1, 0, 0, 1, 1,
1.38748, -0.3455812, 2.528581, 1, 0, 0, 1, 1,
1.40933, 0.1025422, 1.04925, 0, 0, 0, 1, 1,
1.423042, -0.03839001, -0.3976861, 0, 0, 0, 1, 1,
1.423781, 0.1983756, 2.932954, 0, 0, 0, 1, 1,
1.427989, 1.410958, 1.471372, 0, 0, 0, 1, 1,
1.430058, -0.5658243, 1.294009, 0, 0, 0, 1, 1,
1.442389, 0.8347238, 1.75829, 0, 0, 0, 1, 1,
1.443525, 1.120738, -0.1823808, 0, 0, 0, 1, 1,
1.451723, 0.8809562, 1.097349, 1, 1, 1, 1, 1,
1.457373, -0.2291136, 2.253315, 1, 1, 1, 1, 1,
1.460282, 0.4938444, 1.309159, 1, 1, 1, 1, 1,
1.467423, -2.259648, 2.401809, 1, 1, 1, 1, 1,
1.480573, 1.361939, 0.1097826, 1, 1, 1, 1, 1,
1.482139, -0.2302637, 2.52722, 1, 1, 1, 1, 1,
1.489324, -0.3035514, 2.273222, 1, 1, 1, 1, 1,
1.515193, -0.9428418, 2.419165, 1, 1, 1, 1, 1,
1.520624, 0.8848419, 0.4070944, 1, 1, 1, 1, 1,
1.523607, 1.6536, 1.163664, 1, 1, 1, 1, 1,
1.546875, 1.4441, 0.9711784, 1, 1, 1, 1, 1,
1.573534, 0.60717, 2.510015, 1, 1, 1, 1, 1,
1.589081, 0.4926257, 0.7660603, 1, 1, 1, 1, 1,
1.59082, 0.1326116, -0.9742163, 1, 1, 1, 1, 1,
1.592342, 0.3654498, 3.017894, 1, 1, 1, 1, 1,
1.594105, -0.4438227, 1.715101, 0, 0, 1, 1, 1,
1.605166, 0.1532129, 1.252646, 1, 0, 0, 1, 1,
1.61843, -0.2402686, 1.713457, 1, 0, 0, 1, 1,
1.621934, -0.7084073, 1.74546, 1, 0, 0, 1, 1,
1.629286, -0.9293676, 1.714778, 1, 0, 0, 1, 1,
1.633912, -0.03392432, 1.313394, 1, 0, 0, 1, 1,
1.64346, -0.4309573, 1.686145, 0, 0, 0, 1, 1,
1.656724, -0.6315936, 1.259309, 0, 0, 0, 1, 1,
1.663986, 0.840651, 2.602913, 0, 0, 0, 1, 1,
1.687201, -1.121347, 3.268404, 0, 0, 0, 1, 1,
1.703614, -0.4073648, 2.3046, 0, 0, 0, 1, 1,
1.706806, -0.2112293, 0.8006569, 0, 0, 0, 1, 1,
1.714199, -0.09013087, 3.74119, 0, 0, 0, 1, 1,
1.7261, -2.472056, 1.988622, 1, 1, 1, 1, 1,
1.747801, 1.602134, 1.118666, 1, 1, 1, 1, 1,
1.751276, 0.0721955, 2.11603, 1, 1, 1, 1, 1,
1.755121, 0.1929519, 0.5674447, 1, 1, 1, 1, 1,
1.764879, 0.432201, 0.8876085, 1, 1, 1, 1, 1,
1.779804, 1.203397, 1.393941, 1, 1, 1, 1, 1,
1.783403, 1.201258, 2.110076, 1, 1, 1, 1, 1,
1.783941, -0.2659891, 1.807748, 1, 1, 1, 1, 1,
1.789806, 1.079548, 1.041358, 1, 1, 1, 1, 1,
1.79166, -0.190729, 1.831384, 1, 1, 1, 1, 1,
1.797344, 0.7010042, 1.729112, 1, 1, 1, 1, 1,
1.804626, -0.001845285, 1.0755, 1, 1, 1, 1, 1,
1.812981, -0.6477147, 2.265883, 1, 1, 1, 1, 1,
1.820635, 0.2759157, 2.312602, 1, 1, 1, 1, 1,
1.831504, -0.09429822, 2.258292, 1, 1, 1, 1, 1,
1.837347, 0.6120231, 2.461167, 0, 0, 1, 1, 1,
1.843355, -0.01422535, 3.998709, 1, 0, 0, 1, 1,
1.843786, -0.374106, 2.727905, 1, 0, 0, 1, 1,
1.847234, -0.1895025, 2.091368, 1, 0, 0, 1, 1,
1.849234, 0.8744813, 0.03199188, 1, 0, 0, 1, 1,
1.882531, -0.6683336, 3.304646, 1, 0, 0, 1, 1,
1.894152, -0.8766252, 2.744903, 0, 0, 0, 1, 1,
1.895409, 1.079136, 0.2668512, 0, 0, 0, 1, 1,
1.899546, 1.756044, 1.803043, 0, 0, 0, 1, 1,
1.904084, 0.9584141, 2.105667, 0, 0, 0, 1, 1,
1.906816, 0.5881438, 0.7524801, 0, 0, 0, 1, 1,
1.929748, -2.665533, 3.585228, 0, 0, 0, 1, 1,
1.932119, 2.253322, 0.6545032, 0, 0, 0, 1, 1,
1.975502, 1.123884, 1.341231, 1, 1, 1, 1, 1,
1.985528, -0.4739096, 0.09008779, 1, 1, 1, 1, 1,
1.990014, -0.4045478, 0.8505318, 1, 1, 1, 1, 1,
1.993861, -0.3267431, 1.780596, 1, 1, 1, 1, 1,
1.994327, -0.5281279, 3.543575, 1, 1, 1, 1, 1,
2.000398, -1.486441, 1.867278, 1, 1, 1, 1, 1,
2.007889, -1.559655, 2.623998, 1, 1, 1, 1, 1,
2.02072, 0.1415955, 2.126363, 1, 1, 1, 1, 1,
2.025695, 2.68246, -0.7963513, 1, 1, 1, 1, 1,
2.031064, -0.2186928, 1.012778, 1, 1, 1, 1, 1,
2.041622, -0.8989937, 2.334045, 1, 1, 1, 1, 1,
2.091029, -2.331855, 2.459146, 1, 1, 1, 1, 1,
2.108383, -1.634257, 1.469604, 1, 1, 1, 1, 1,
2.121243, 1.731338, -0.08128149, 1, 1, 1, 1, 1,
2.128276, 0.7012717, 1.844578, 1, 1, 1, 1, 1,
2.170056, -0.3821771, 2.680133, 0, 0, 1, 1, 1,
2.175025, -0.4868214, 1.235577, 1, 0, 0, 1, 1,
2.200251, -0.4249873, 3.38372, 1, 0, 0, 1, 1,
2.244517, 1.152384, 1.285018, 1, 0, 0, 1, 1,
2.280961, 0.2670706, 2.205092, 1, 0, 0, 1, 1,
2.311235, -1.437073, 1.133188, 1, 0, 0, 1, 1,
2.331278, 0.7998028, -0.02179515, 0, 0, 0, 1, 1,
2.349884, 0.7321412, 0.2753883, 0, 0, 0, 1, 1,
2.39894, -1.037574, 2.276856, 0, 0, 0, 1, 1,
2.451228, 0.1175953, 0.5212568, 0, 0, 0, 1, 1,
2.462195, 0.5343769, 3.172184, 0, 0, 0, 1, 1,
2.464031, -1.711252, 2.259967, 0, 0, 0, 1, 1,
2.524302, -0.6840609, 1.499065, 0, 0, 0, 1, 1,
2.53779, -0.1379198, 1.22688, 1, 1, 1, 1, 1,
2.554387, -1.855943, 2.546417, 1, 1, 1, 1, 1,
2.586535, -1.55189, -0.01653835, 1, 1, 1, 1, 1,
2.955881, -0.346992, 1.850994, 1, 1, 1, 1, 1,
3.027704, 1.890037, 2.178273, 1, 1, 1, 1, 1,
3.082851, 2.066807, -0.8818214, 1, 1, 1, 1, 1,
3.232174, 0.8251055, 0.9440134, 1, 1, 1, 1, 1
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
var radius = 9.635812;
var distance = 33.84538;
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
mvMatrix.translate( -0.002293348, -0.06983483, -0.1712074 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.84538);
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
