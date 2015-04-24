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
-2.83338, -2.336945, -1.520959, 1, 0, 0, 1,
-2.812241, 0.3994104, -0.5440812, 1, 0.007843138, 0, 1,
-2.7857, 0.3833764, -1.715989, 1, 0.01176471, 0, 1,
-2.631459, 1.452943, -3.10908, 1, 0.01960784, 0, 1,
-2.601942, 0.4968668, -2.568937, 1, 0.02352941, 0, 1,
-2.568632, -1.079039, -1.026732, 1, 0.03137255, 0, 1,
-2.548955, 0.2898746, -2.066259, 1, 0.03529412, 0, 1,
-2.464832, 0.5418812, -0.8643548, 1, 0.04313726, 0, 1,
-2.450653, -0.2862046, -1.288455, 1, 0.04705882, 0, 1,
-2.385172, -0.7255486, -0.8034021, 1, 0.05490196, 0, 1,
-2.301285, 0.4813515, -2.269844, 1, 0.05882353, 0, 1,
-2.260614, -0.130479, -0.4252613, 1, 0.06666667, 0, 1,
-2.255821, 1.601485, -1.682663, 1, 0.07058824, 0, 1,
-2.226417, -0.9820426, -2.365086, 1, 0.07843138, 0, 1,
-2.213403, 0.6202653, -0.7383546, 1, 0.08235294, 0, 1,
-2.207227, -0.3538676, -3.693335, 1, 0.09019608, 0, 1,
-2.142194, 0.2697622, -1.026798, 1, 0.09411765, 0, 1,
-2.103228, 0.4065784, -2.207044, 1, 0.1019608, 0, 1,
-2.09433, 0.2379172, -1.348394, 1, 0.1098039, 0, 1,
-2.050281, 1.378254, -1.026068, 1, 0.1137255, 0, 1,
-2.035239, -1.186276, 0.4094779, 1, 0.1215686, 0, 1,
-2.019257, 1.057083, -0.1499423, 1, 0.1254902, 0, 1,
-2.013804, -0.5626915, -2.927783, 1, 0.1333333, 0, 1,
-2.000998, 0.4857983, 0.6701298, 1, 0.1372549, 0, 1,
-1.97741, -1.347326, -4.499674, 1, 0.145098, 0, 1,
-1.917363, -0.02559753, 0.3202826, 1, 0.1490196, 0, 1,
-1.868854, -0.6126298, -2.243739, 1, 0.1568628, 0, 1,
-1.859142, -0.5054457, -1.09726, 1, 0.1607843, 0, 1,
-1.842092, 0.004647923, -0.7950231, 1, 0.1686275, 0, 1,
-1.825494, -1.081914, -2.24496, 1, 0.172549, 0, 1,
-1.81505, 0.3519964, -1.694657, 1, 0.1803922, 0, 1,
-1.813554, 0.7652856, -0.7525455, 1, 0.1843137, 0, 1,
-1.792889, -0.008952343, -1.853764, 1, 0.1921569, 0, 1,
-1.767274, -1.007841, -2.340731, 1, 0.1960784, 0, 1,
-1.763588, -0.9957424, -1.413273, 1, 0.2039216, 0, 1,
-1.762523, 0.9183361, -1.069151, 1, 0.2117647, 0, 1,
-1.746625, 0.1073232, 0.2524599, 1, 0.2156863, 0, 1,
-1.739549, -0.4629298, -1.485095, 1, 0.2235294, 0, 1,
-1.711807, 1.663844, 0.5350761, 1, 0.227451, 0, 1,
-1.707959, -0.04166351, -1.663748, 1, 0.2352941, 0, 1,
-1.699657, -0.2594656, -1.91557, 1, 0.2392157, 0, 1,
-1.682475, -0.6302334, -3.615745, 1, 0.2470588, 0, 1,
-1.656028, -1.291675, -0.7029319, 1, 0.2509804, 0, 1,
-1.651226, 0.5140232, 0.03663212, 1, 0.2588235, 0, 1,
-1.650964, 1.350269, 0.08196131, 1, 0.2627451, 0, 1,
-1.647896, 0.08738846, -1.807988, 1, 0.2705882, 0, 1,
-1.633018, 0.8400425, -0.7773045, 1, 0.2745098, 0, 1,
-1.623339, 0.7603282, 0.979314, 1, 0.282353, 0, 1,
-1.619825, 0.221596, -0.3520105, 1, 0.2862745, 0, 1,
-1.613356, -1.260462, -2.320295, 1, 0.2941177, 0, 1,
-1.605294, -0.2555768, -1.549592, 1, 0.3019608, 0, 1,
-1.603651, 0.5128519, -3.584956, 1, 0.3058824, 0, 1,
-1.592974, 0.9673525, -0.8510938, 1, 0.3137255, 0, 1,
-1.572743, -0.3515804, 0.93595, 1, 0.3176471, 0, 1,
-1.572684, -1.530802, -3.100513, 1, 0.3254902, 0, 1,
-1.563622, 0.6412201, -1.046191, 1, 0.3294118, 0, 1,
-1.562804, 0.7074847, -1.213109, 1, 0.3372549, 0, 1,
-1.560511, -0.394315, -2.16923, 1, 0.3411765, 0, 1,
-1.549931, 1.075488, 1.065692, 1, 0.3490196, 0, 1,
-1.541399, 1.231433, -0.5029499, 1, 0.3529412, 0, 1,
-1.533901, 0.4557613, -2.521729, 1, 0.3607843, 0, 1,
-1.530065, 1.660394, -0.508939, 1, 0.3647059, 0, 1,
-1.52416, 0.8188173, -1.18071, 1, 0.372549, 0, 1,
-1.520869, -1.051779, -1.720416, 1, 0.3764706, 0, 1,
-1.496036, 0.2965606, 0.2636608, 1, 0.3843137, 0, 1,
-1.486044, 0.7121612, -0.5196055, 1, 0.3882353, 0, 1,
-1.479753, -1.182764, -1.250374, 1, 0.3960784, 0, 1,
-1.474547, 0.1264878, -0.01432527, 1, 0.4039216, 0, 1,
-1.474134, -1.157804, -1.677265, 1, 0.4078431, 0, 1,
-1.470982, 0.1839124, -0.5216729, 1, 0.4156863, 0, 1,
-1.467124, 1.925014, -1.254059, 1, 0.4196078, 0, 1,
-1.466324, 0.4620103, 0.3122199, 1, 0.427451, 0, 1,
-1.465217, 0.2695947, -2.814776, 1, 0.4313726, 0, 1,
-1.461486, 1.080452, -1.730566, 1, 0.4392157, 0, 1,
-1.449626, -0.8138219, -2.303256, 1, 0.4431373, 0, 1,
-1.443592, -0.05954082, -4.473411, 1, 0.4509804, 0, 1,
-1.432491, -0.4548589, -2.724682, 1, 0.454902, 0, 1,
-1.425591, -0.2301155, -2.772359, 1, 0.4627451, 0, 1,
-1.421517, 1.580844, -0.7463125, 1, 0.4666667, 0, 1,
-1.41877, -0.4807537, -2.881359, 1, 0.4745098, 0, 1,
-1.395684, -0.006936059, 0.09722947, 1, 0.4784314, 0, 1,
-1.385611, -0.9765105, -2.250921, 1, 0.4862745, 0, 1,
-1.373317, -1.188969, -0.6913432, 1, 0.4901961, 0, 1,
-1.367427, -2.797862, -2.447865, 1, 0.4980392, 0, 1,
-1.364888, -0.2137114, -1.308948, 1, 0.5058824, 0, 1,
-1.358993, 0.2053142, -0.9414287, 1, 0.509804, 0, 1,
-1.348326, -0.1485759, -1.263164, 1, 0.5176471, 0, 1,
-1.345807, 2.010236, 0.8892152, 1, 0.5215687, 0, 1,
-1.337554, 1.169669, -0.8795354, 1, 0.5294118, 0, 1,
-1.336265, -0.5857267, -1.427189, 1, 0.5333334, 0, 1,
-1.319821, -0.5138839, -4.341102, 1, 0.5411765, 0, 1,
-1.303667, 0.3447661, -1.483196, 1, 0.5450981, 0, 1,
-1.297795, -0.967629, -1.233919, 1, 0.5529412, 0, 1,
-1.288046, 1.981239, -1.553889, 1, 0.5568628, 0, 1,
-1.285336, 0.0285277, -1.684773, 1, 0.5647059, 0, 1,
-1.278993, 0.1823457, -0.02626202, 1, 0.5686275, 0, 1,
-1.2752, 0.8273813, -1.932343, 1, 0.5764706, 0, 1,
-1.273109, -0.8640745, -3.662507, 1, 0.5803922, 0, 1,
-1.252649, 1.299202, -2.271418, 1, 0.5882353, 0, 1,
-1.244501, -0.07752364, -1.562803, 1, 0.5921569, 0, 1,
-1.243574, 0.4583513, 0.06800071, 1, 0.6, 0, 1,
-1.230604, 0.1666245, -1.812352, 1, 0.6078432, 0, 1,
-1.222592, -0.3843223, -1.289652, 1, 0.6117647, 0, 1,
-1.214405, -0.3687538, -1.744419, 1, 0.6196079, 0, 1,
-1.213755, 0.9035128, -2.582721, 1, 0.6235294, 0, 1,
-1.208855, 0.8539517, -1.608081, 1, 0.6313726, 0, 1,
-1.206061, -0.7024723, -2.730035, 1, 0.6352941, 0, 1,
-1.20591, -1.338033, -3.451247, 1, 0.6431373, 0, 1,
-1.2037, 0.1662091, -0.5218371, 1, 0.6470588, 0, 1,
-1.199279, 0.6967762, -1.537348, 1, 0.654902, 0, 1,
-1.192306, -0.4902898, -2.186537, 1, 0.6588235, 0, 1,
-1.180222, 0.3616595, -0.4080226, 1, 0.6666667, 0, 1,
-1.172242, 1.672758, 1.639264, 1, 0.6705883, 0, 1,
-1.16803, 0.5085918, -1.867887, 1, 0.6784314, 0, 1,
-1.164279, -0.3293719, -1.273319, 1, 0.682353, 0, 1,
-1.158294, 0.3300769, -1.332315, 1, 0.6901961, 0, 1,
-1.158025, 0.05783847, -2.212259, 1, 0.6941177, 0, 1,
-1.157112, -0.909816, -1.382627, 1, 0.7019608, 0, 1,
-1.150007, -0.09534958, -0.5097322, 1, 0.7098039, 0, 1,
-1.148828, -0.7079903, -1.399802, 1, 0.7137255, 0, 1,
-1.131784, -0.5407932, -1.993459, 1, 0.7215686, 0, 1,
-1.124336, 0.6347879, -0.5741343, 1, 0.7254902, 0, 1,
-1.122477, 0.2599373, 0.04671161, 1, 0.7333333, 0, 1,
-1.115285, 1.50999, 0.9717891, 1, 0.7372549, 0, 1,
-1.111689, 0.1256133, -2.34067, 1, 0.7450981, 0, 1,
-1.110003, -0.3353007, -3.256384, 1, 0.7490196, 0, 1,
-1.107666, 1.170427, 0.09419771, 1, 0.7568628, 0, 1,
-1.100064, 0.6949913, -0.592916, 1, 0.7607843, 0, 1,
-1.097586, -0.7284653, -1.678948, 1, 0.7686275, 0, 1,
-1.097203, 0.2659587, -1.222279, 1, 0.772549, 0, 1,
-1.077843, 0.6192783, -0.5282793, 1, 0.7803922, 0, 1,
-1.069441, 0.2204089, -1.055633, 1, 0.7843137, 0, 1,
-1.063906, 1.871059, -1.017385, 1, 0.7921569, 0, 1,
-1.058287, -1.268363, -2.588268, 1, 0.7960784, 0, 1,
-1.041195, 0.2855704, -2.146975, 1, 0.8039216, 0, 1,
-1.039288, 1.276813, -0.5640207, 1, 0.8117647, 0, 1,
-1.036224, 0.5281261, -2.610466, 1, 0.8156863, 0, 1,
-1.019578, -1.332214, -0.6061558, 1, 0.8235294, 0, 1,
-1.017219, 1.950117, 0.03670905, 1, 0.827451, 0, 1,
-1.008373, -1.228187, -2.031363, 1, 0.8352941, 0, 1,
-1.008244, -0.4753743, -3.157605, 1, 0.8392157, 0, 1,
-1.005295, -0.5523205, -2.522324, 1, 0.8470588, 0, 1,
-0.9951522, 1.403637, -1.281704, 1, 0.8509804, 0, 1,
-0.9944178, -0.6405825, -1.415886, 1, 0.8588235, 0, 1,
-0.9918036, 0.67585, -0.17621, 1, 0.8627451, 0, 1,
-0.9855923, 0.2568067, -2.27339, 1, 0.8705882, 0, 1,
-0.98056, 0.7169412, -1.166616, 1, 0.8745098, 0, 1,
-0.9785199, -1.327896, -3.22702, 1, 0.8823529, 0, 1,
-0.9717057, 0.3837419, -1.287409, 1, 0.8862745, 0, 1,
-0.9593738, 0.3851789, -0.07960156, 1, 0.8941177, 0, 1,
-0.9582144, 1.910863, 0.8510923, 1, 0.8980392, 0, 1,
-0.9579156, 0.5843176, -2.311656, 1, 0.9058824, 0, 1,
-0.9519247, -0.1032845, -0.4312543, 1, 0.9137255, 0, 1,
-0.9508869, 0.8544883, -1.819545, 1, 0.9176471, 0, 1,
-0.9477833, -0.3991959, -1.500967, 1, 0.9254902, 0, 1,
-0.942598, -1.529893, -1.879098, 1, 0.9294118, 0, 1,
-0.9404827, -0.5867382, -2.319682, 1, 0.9372549, 0, 1,
-0.939259, -0.2749224, -2.512115, 1, 0.9411765, 0, 1,
-0.9384928, -0.9364916, -1.810502, 1, 0.9490196, 0, 1,
-0.9325339, -1.574832, -3.227404, 1, 0.9529412, 0, 1,
-0.9232269, 1.1231, -1.377817, 1, 0.9607843, 0, 1,
-0.9226801, 1.009281, -0.09379029, 1, 0.9647059, 0, 1,
-0.9188439, -1.987362, -3.42232, 1, 0.972549, 0, 1,
-0.9180382, 0.07066797, -1.748286, 1, 0.9764706, 0, 1,
-0.9085003, 0.001944454, -2.696963, 1, 0.9843137, 0, 1,
-0.9007611, -0.8887534, -1.356762, 1, 0.9882353, 0, 1,
-0.9003111, 0.07959191, -0.3820227, 1, 0.9960784, 0, 1,
-0.894308, -1.11204, -3.433662, 0.9960784, 1, 0, 1,
-0.888162, 0.2860324, -0.8801233, 0.9921569, 1, 0, 1,
-0.8741007, 0.555791, -1.869763, 0.9843137, 1, 0, 1,
-0.8687442, 1.922415, -1.006364, 0.9803922, 1, 0, 1,
-0.8654366, -0.4609146, -2.360354, 0.972549, 1, 0, 1,
-0.8644447, 0.4897423, -0.5881091, 0.9686275, 1, 0, 1,
-0.861409, 2.370653, 0.3632493, 0.9607843, 1, 0, 1,
-0.8613173, 0.09752696, -1.144382, 0.9568627, 1, 0, 1,
-0.8571414, 0.5773034, -2.83851, 0.9490196, 1, 0, 1,
-0.8449217, 2.0963, -0.07884143, 0.945098, 1, 0, 1,
-0.8391917, 0.5374376, -0.7938505, 0.9372549, 1, 0, 1,
-0.8285291, 0.9760309, -0.5902655, 0.9333333, 1, 0, 1,
-0.8214806, -0.5606466, -1.567232, 0.9254902, 1, 0, 1,
-0.8200029, 1.279485, -1.711373, 0.9215686, 1, 0, 1,
-0.8191395, 1.585186, -2.129672, 0.9137255, 1, 0, 1,
-0.8116106, -0.9009609, -2.543875, 0.9098039, 1, 0, 1,
-0.807294, 0.254841, -1.428517, 0.9019608, 1, 0, 1,
-0.8054824, 0.7368765, -0.523545, 0.8941177, 1, 0, 1,
-0.801962, -1.323598, -2.705169, 0.8901961, 1, 0, 1,
-0.7912929, 0.6557993, -1.535814, 0.8823529, 1, 0, 1,
-0.7868139, 1.99253, -1.813138, 0.8784314, 1, 0, 1,
-0.7855691, -0.277717, -3.194428, 0.8705882, 1, 0, 1,
-0.7808986, 0.7095057, -1.515615, 0.8666667, 1, 0, 1,
-0.7755, 0.07209007, -0.5144427, 0.8588235, 1, 0, 1,
-0.7711986, 0.5118637, -1.365445, 0.854902, 1, 0, 1,
-0.7621176, 1.998664, 0.7243581, 0.8470588, 1, 0, 1,
-0.7619323, 0.9569421, -1.282625, 0.8431373, 1, 0, 1,
-0.7575127, -0.2056, -4.197718, 0.8352941, 1, 0, 1,
-0.7559748, 0.4104901, -1.721751, 0.8313726, 1, 0, 1,
-0.7529981, -0.05840496, -1.272582, 0.8235294, 1, 0, 1,
-0.74424, 1.210094, -1.555245, 0.8196079, 1, 0, 1,
-0.7432175, -0.4209609, -0.5157036, 0.8117647, 1, 0, 1,
-0.7405263, 1.980044, -0.8681063, 0.8078431, 1, 0, 1,
-0.7391407, -0.7773316, -1.935011, 0.8, 1, 0, 1,
-0.7390836, -0.869141, -2.585417, 0.7921569, 1, 0, 1,
-0.7356647, -0.5273984, -1.283897, 0.7882353, 1, 0, 1,
-0.7356238, 0.9054574, -1.304947, 0.7803922, 1, 0, 1,
-0.7316517, -0.8618158, -2.341311, 0.7764706, 1, 0, 1,
-0.7312158, 0.7914264, 0.2972647, 0.7686275, 1, 0, 1,
-0.7276925, -0.6403089, -2.19024, 0.7647059, 1, 0, 1,
-0.7212686, 0.1731121, -1.055082, 0.7568628, 1, 0, 1,
-0.7207009, 0.478262, -0.8914949, 0.7529412, 1, 0, 1,
-0.7192992, 0.8177921, -1.78781, 0.7450981, 1, 0, 1,
-0.7169523, -0.1649301, -0.03054175, 0.7411765, 1, 0, 1,
-0.7141477, -1.105658, -1.920169, 0.7333333, 1, 0, 1,
-0.6938973, -0.9951069, -1.514065, 0.7294118, 1, 0, 1,
-0.6897509, -0.4060514, -2.783297, 0.7215686, 1, 0, 1,
-0.6825634, -1.178926, -2.06512, 0.7176471, 1, 0, 1,
-0.6822912, 0.7542231, 0.1806016, 0.7098039, 1, 0, 1,
-0.682121, -0.8003459, -1.671289, 0.7058824, 1, 0, 1,
-0.6818892, 1.061439, -1.944456, 0.6980392, 1, 0, 1,
-0.6797773, 2.269926, -0.6345707, 0.6901961, 1, 0, 1,
-0.668188, -0.9105431, -4.319471, 0.6862745, 1, 0, 1,
-0.6670639, 1.1236, 0.3677835, 0.6784314, 1, 0, 1,
-0.6664789, 1.325404, -0.7763366, 0.6745098, 1, 0, 1,
-0.6636061, -0.02236299, -0.9138048, 0.6666667, 1, 0, 1,
-0.6612332, -0.1555011, -3.206294, 0.6627451, 1, 0, 1,
-0.6587462, 0.4111654, 0.4310069, 0.654902, 1, 0, 1,
-0.6582317, 0.2675515, -1.711567, 0.6509804, 1, 0, 1,
-0.6541098, 0.08361489, -0.4421203, 0.6431373, 1, 0, 1,
-0.643526, -1.137964, -3.183445, 0.6392157, 1, 0, 1,
-0.6428346, -1.555888, -2.048264, 0.6313726, 1, 0, 1,
-0.6383878, -0.6159216, -2.69442, 0.627451, 1, 0, 1,
-0.6382092, 0.2552463, -1.802375, 0.6196079, 1, 0, 1,
-0.6374931, -0.5641649, -1.377086, 0.6156863, 1, 0, 1,
-0.6365113, 1.560629, -0.4453918, 0.6078432, 1, 0, 1,
-0.6361112, 0.2561147, 1.41987, 0.6039216, 1, 0, 1,
-0.6344349, -0.8662423, -4.201849, 0.5960785, 1, 0, 1,
-0.634174, -0.6761578, -1.904664, 0.5882353, 1, 0, 1,
-0.6332515, 0.5721616, -2.705024, 0.5843138, 1, 0, 1,
-0.6313975, 0.7514983, -1.045491, 0.5764706, 1, 0, 1,
-0.6292322, -1.166573, -3.30571, 0.572549, 1, 0, 1,
-0.6256419, -0.2170497, -0.5337042, 0.5647059, 1, 0, 1,
-0.6245669, 0.2743766, -0.4312736, 0.5607843, 1, 0, 1,
-0.6177964, 0.9218436, -0.3531273, 0.5529412, 1, 0, 1,
-0.6151302, 0.6787037, 1.019141, 0.5490196, 1, 0, 1,
-0.6064245, -0.7957839, -1.289831, 0.5411765, 1, 0, 1,
-0.6052794, -2.283313, -3.400595, 0.5372549, 1, 0, 1,
-0.6020126, -0.2210895, -1.914508, 0.5294118, 1, 0, 1,
-0.6007509, -1.105669, -0.7851427, 0.5254902, 1, 0, 1,
-0.5960993, -2.036099, -2.842549, 0.5176471, 1, 0, 1,
-0.5959734, 0.961782, -0.7578559, 0.5137255, 1, 0, 1,
-0.5951353, -0.7596257, -0.7087272, 0.5058824, 1, 0, 1,
-0.5947321, 1.927116, -0.9186005, 0.5019608, 1, 0, 1,
-0.5907622, -0.07015426, -1.115665, 0.4941176, 1, 0, 1,
-0.5907142, 0.7895231, -0.9094629, 0.4862745, 1, 0, 1,
-0.5896739, 0.09067755, -0.6630677, 0.4823529, 1, 0, 1,
-0.5880988, -0.5640119, -2.917341, 0.4745098, 1, 0, 1,
-0.5848725, 0.5036196, -0.6241024, 0.4705882, 1, 0, 1,
-0.5848562, 0.5097011, -2.005766, 0.4627451, 1, 0, 1,
-0.5786928, -0.1360608, -0.482902, 0.4588235, 1, 0, 1,
-0.5784076, -0.9672874, -0.6244124, 0.4509804, 1, 0, 1,
-0.5769921, 0.6360905, -1.157631, 0.4470588, 1, 0, 1,
-0.5766957, 0.2624289, -1.25931, 0.4392157, 1, 0, 1,
-0.5747451, 1.113679, 0.1549316, 0.4352941, 1, 0, 1,
-0.5745741, -1.557894, -1.106937, 0.427451, 1, 0, 1,
-0.5720501, -0.6200601, -2.353951, 0.4235294, 1, 0, 1,
-0.5715551, -0.5240484, -1.425044, 0.4156863, 1, 0, 1,
-0.5622104, 0.1554193, -1.448588, 0.4117647, 1, 0, 1,
-0.5608258, 0.6452177, -0.5124726, 0.4039216, 1, 0, 1,
-0.5575383, 0.5164545, -0.2836333, 0.3960784, 1, 0, 1,
-0.5554792, 0.6599768, 0.08675275, 0.3921569, 1, 0, 1,
-0.5487396, -1.511953, -1.926695, 0.3843137, 1, 0, 1,
-0.5485094, -0.7592463, -2.620706, 0.3803922, 1, 0, 1,
-0.541584, -0.8317163, -2.02535, 0.372549, 1, 0, 1,
-0.528744, 0.1647013, -1.391243, 0.3686275, 1, 0, 1,
-0.5277134, 1.378718, 0.2561715, 0.3607843, 1, 0, 1,
-0.5275093, -1.803997, -2.874505, 0.3568628, 1, 0, 1,
-0.5249128, -0.6253261, -3.460793, 0.3490196, 1, 0, 1,
-0.5238758, 0.769259, -0.372334, 0.345098, 1, 0, 1,
-0.5151529, -1.339861, -2.382436, 0.3372549, 1, 0, 1,
-0.5150949, 1.396077, -1.093004, 0.3333333, 1, 0, 1,
-0.5119579, 0.7895656, -0.6416256, 0.3254902, 1, 0, 1,
-0.492318, 0.04120172, -1.092691, 0.3215686, 1, 0, 1,
-0.4890315, 1.106371, -1.786382, 0.3137255, 1, 0, 1,
-0.4848652, -0.02709318, -0.377322, 0.3098039, 1, 0, 1,
-0.484667, 0.04313194, -2.142009, 0.3019608, 1, 0, 1,
-0.4699272, -0.7187093, -2.754623, 0.2941177, 1, 0, 1,
-0.4688795, 0.6507601, -1.657631, 0.2901961, 1, 0, 1,
-0.4671326, -0.1614133, -1.230384, 0.282353, 1, 0, 1,
-0.4648278, 0.9867294, -1.552143, 0.2784314, 1, 0, 1,
-0.4611673, -0.3370428, -2.402574, 0.2705882, 1, 0, 1,
-0.4607406, -0.3607778, -1.098331, 0.2666667, 1, 0, 1,
-0.4603795, 0.7638679, -0.6421034, 0.2588235, 1, 0, 1,
-0.4603601, 0.7865909, -1.580155, 0.254902, 1, 0, 1,
-0.4507317, -0.3595728, -1.140119, 0.2470588, 1, 0, 1,
-0.439849, -0.1919173, -2.932189, 0.2431373, 1, 0, 1,
-0.4305243, 0.1697819, -1.080729, 0.2352941, 1, 0, 1,
-0.4300137, 0.4282818, -0.4915573, 0.2313726, 1, 0, 1,
-0.4237306, -1.639925, -4.528932, 0.2235294, 1, 0, 1,
-0.421762, -1.688394, -3.110182, 0.2196078, 1, 0, 1,
-0.4211682, -0.672092, -1.395512, 0.2117647, 1, 0, 1,
-0.4198361, 1.828498, -0.4916557, 0.2078431, 1, 0, 1,
-0.4158529, 0.1200031, -1.529366, 0.2, 1, 0, 1,
-0.412691, 0.2810387, -2.135785, 0.1921569, 1, 0, 1,
-0.4124325, 0.9466923, -0.2445541, 0.1882353, 1, 0, 1,
-0.4110285, -0.2259847, -2.243581, 0.1803922, 1, 0, 1,
-0.3991485, -1.624925, -2.337174, 0.1764706, 1, 0, 1,
-0.3970637, -0.8466604, -1.473015, 0.1686275, 1, 0, 1,
-0.3962356, -0.8666243, -2.887294, 0.1647059, 1, 0, 1,
-0.3955176, -0.2629721, -2.479792, 0.1568628, 1, 0, 1,
-0.3898319, -0.372027, -1.832176, 0.1529412, 1, 0, 1,
-0.3883298, 0.1931663, -0.3487125, 0.145098, 1, 0, 1,
-0.3880886, 0.7045059, -0.2838595, 0.1411765, 1, 0, 1,
-0.3850389, -0.1968701, -1.145141, 0.1333333, 1, 0, 1,
-0.3839631, 1.007569, -0.3926655, 0.1294118, 1, 0, 1,
-0.3815439, -0.1950923, -2.050544, 0.1215686, 1, 0, 1,
-0.3811723, 1.632297, -2.241647, 0.1176471, 1, 0, 1,
-0.3741435, -0.8021656, -2.4748, 0.1098039, 1, 0, 1,
-0.3701701, -2.142688, -1.139282, 0.1058824, 1, 0, 1,
-0.3694941, -0.1313433, -1.294833, 0.09803922, 1, 0, 1,
-0.3652345, -0.4404571, -1.087529, 0.09019608, 1, 0, 1,
-0.362885, 0.4849125, -0.8930717, 0.08627451, 1, 0, 1,
-0.3611896, 1.316033, -1.1002, 0.07843138, 1, 0, 1,
-0.3610657, 1.486163, -0.9029356, 0.07450981, 1, 0, 1,
-0.3581358, 1.678165, 0.7361239, 0.06666667, 1, 0, 1,
-0.3568971, -0.1663718, -1.834401, 0.0627451, 1, 0, 1,
-0.3554294, 1.555339, 1.236933, 0.05490196, 1, 0, 1,
-0.3551957, -0.04066833, -0.2552457, 0.05098039, 1, 0, 1,
-0.3511386, -1.532154, -3.53784, 0.04313726, 1, 0, 1,
-0.3507962, -0.02989664, -1.184968, 0.03921569, 1, 0, 1,
-0.3507303, 0.242339, -1.29073, 0.03137255, 1, 0, 1,
-0.3499326, 0.6439146, 1.3163, 0.02745098, 1, 0, 1,
-0.3494831, 0.1626284, -0.8349415, 0.01960784, 1, 0, 1,
-0.34941, -0.2765146, -3.082403, 0.01568628, 1, 0, 1,
-0.3473882, -2.630314, -2.326343, 0.007843138, 1, 0, 1,
-0.3331241, -0.1236142, -1.417927, 0.003921569, 1, 0, 1,
-0.3304067, 0.8152948, -0.224591, 0, 1, 0.003921569, 1,
-0.3244019, 0.5224143, 0.508332, 0, 1, 0.01176471, 1,
-0.3210966, 0.5274503, 0.1705288, 0, 1, 0.01568628, 1,
-0.3205431, -0.2393975, -3.397716, 0, 1, 0.02352941, 1,
-0.3191371, 0.5923057, 0.1122927, 0, 1, 0.02745098, 1,
-0.3183397, 0.6006953, -0.5564774, 0, 1, 0.03529412, 1,
-0.3179113, -1.109137, -3.150931, 0, 1, 0.03921569, 1,
-0.3162021, 0.1433992, -2.941842, 0, 1, 0.04705882, 1,
-0.3152134, 1.50552, -0.5458134, 0, 1, 0.05098039, 1,
-0.3097978, 0.4877908, -0.5195973, 0, 1, 0.05882353, 1,
-0.3097244, 0.4697802, -1.883511, 0, 1, 0.0627451, 1,
-0.3095252, 0.2815981, -1.058631, 0, 1, 0.07058824, 1,
-0.3083596, 0.2399523, -0.9019682, 0, 1, 0.07450981, 1,
-0.3082629, 0.159847, 0.1278121, 0, 1, 0.08235294, 1,
-0.3047707, 0.5933219, 0.1193822, 0, 1, 0.08627451, 1,
-0.3035126, 0.09294586, -1.900026, 0, 1, 0.09411765, 1,
-0.2946217, -0.4251087, -2.782645, 0, 1, 0.1019608, 1,
-0.2946187, 0.3948964, 0.1152589, 0, 1, 0.1058824, 1,
-0.2828513, -0.8206183, -2.712995, 0, 1, 0.1137255, 1,
-0.2827928, -0.2253894, -1.438386, 0, 1, 0.1176471, 1,
-0.2807232, -0.4728707, -2.271175, 0, 1, 0.1254902, 1,
-0.2781779, -0.62595, -2.262362, 0, 1, 0.1294118, 1,
-0.2773326, 0.278807, -0.4091803, 0, 1, 0.1372549, 1,
-0.2735707, 0.9568445, 1.201054, 0, 1, 0.1411765, 1,
-0.272404, -0.4685792, -3.916041, 0, 1, 0.1490196, 1,
-0.2704853, 0.1428541, -2.105939, 0, 1, 0.1529412, 1,
-0.2698724, -0.01021832, -1.193211, 0, 1, 0.1607843, 1,
-0.2676689, 1.695327, -1.749246, 0, 1, 0.1647059, 1,
-0.2652851, 0.7544613, 1.035155, 0, 1, 0.172549, 1,
-0.2631705, 0.8812963, -1.33837, 0, 1, 0.1764706, 1,
-0.2621676, -1.579879, -1.347438, 0, 1, 0.1843137, 1,
-0.2610547, 0.2388436, -0.9481117, 0, 1, 0.1882353, 1,
-0.2529641, -0.7872274, -2.581185, 0, 1, 0.1960784, 1,
-0.2528982, -0.3499587, -0.7691613, 0, 1, 0.2039216, 1,
-0.2501412, -0.09722223, -2.222649, 0, 1, 0.2078431, 1,
-0.2480584, -0.5341441, -0.9145039, 0, 1, 0.2156863, 1,
-0.2457429, 1.776282, -0.5398795, 0, 1, 0.2196078, 1,
-0.2454518, 0.3731621, -0.5467819, 0, 1, 0.227451, 1,
-0.2433344, 1.663377, -0.2503433, 0, 1, 0.2313726, 1,
-0.2404096, -0.1749621, -2.094686, 0, 1, 0.2392157, 1,
-0.2385335, -0.119058, -1.962168, 0, 1, 0.2431373, 1,
-0.2361602, -0.1447551, -1.639082, 0, 1, 0.2509804, 1,
-0.2354561, -0.4859667, -4.056145, 0, 1, 0.254902, 1,
-0.2349024, 1.576524, -0.4822248, 0, 1, 0.2627451, 1,
-0.2347968, 1.807063, -0.3904687, 0, 1, 0.2666667, 1,
-0.230872, -1.65209, -3.32146, 0, 1, 0.2745098, 1,
-0.2305455, 0.05836298, -1.800576, 0, 1, 0.2784314, 1,
-0.2269926, 1.608703, -0.8342866, 0, 1, 0.2862745, 1,
-0.2211632, -1.180865, -2.297182, 0, 1, 0.2901961, 1,
-0.2205453, -1.814137, -3.830054, 0, 1, 0.2980392, 1,
-0.2183169, -1.239915, -3.716455, 0, 1, 0.3058824, 1,
-0.2161968, 0.5865668, 0.04378929, 0, 1, 0.3098039, 1,
-0.2152956, 0.2011946, -1.281952, 0, 1, 0.3176471, 1,
-0.2147465, 1.254086, -0.3385064, 0, 1, 0.3215686, 1,
-0.2125758, -0.4410516, -3.674657, 0, 1, 0.3294118, 1,
-0.2069333, -0.7799388, -3.554297, 0, 1, 0.3333333, 1,
-0.2066867, -1.284026, -3.892682, 0, 1, 0.3411765, 1,
-0.2052467, -0.2324431, -2.050084, 0, 1, 0.345098, 1,
-0.2025138, 1.491838, 0.2266156, 0, 1, 0.3529412, 1,
-0.2020794, -0.6189933, -1.734505, 0, 1, 0.3568628, 1,
-0.2013929, -0.8084509, -5.217393, 0, 1, 0.3647059, 1,
-0.2009418, -1.517826, -3.570983, 0, 1, 0.3686275, 1,
-0.1995006, 0.6146407, 0.1602584, 0, 1, 0.3764706, 1,
-0.1933166, 0.02621201, -0.0513537, 0, 1, 0.3803922, 1,
-0.1926616, 1.131216, -1.667702, 0, 1, 0.3882353, 1,
-0.1920077, 0.3767265, -0.5377384, 0, 1, 0.3921569, 1,
-0.1904274, 0.3280596, -0.9547789, 0, 1, 0.4, 1,
-0.1827941, 0.7719004, 0.8532411, 0, 1, 0.4078431, 1,
-0.1801905, 0.7678746, -1.223513, 0, 1, 0.4117647, 1,
-0.1761362, -2.609433, -3.383539, 0, 1, 0.4196078, 1,
-0.1752779, 0.1730459, -0.7532578, 0, 1, 0.4235294, 1,
-0.1750592, 0.7131989, 0.7250096, 0, 1, 0.4313726, 1,
-0.1733246, -1.392888, -2.743615, 0, 1, 0.4352941, 1,
-0.1733142, -0.3674505, -1.52539, 0, 1, 0.4431373, 1,
-0.1716081, -0.3439626, -5.603244, 0, 1, 0.4470588, 1,
-0.1700214, -0.3842063, -5.314434, 0, 1, 0.454902, 1,
-0.1666545, 1.660787, 0.2791175, 0, 1, 0.4588235, 1,
-0.1622157, -0.007585873, -3.691431, 0, 1, 0.4666667, 1,
-0.1621874, -0.4920312, -2.235615, 0, 1, 0.4705882, 1,
-0.1599338, -0.2146885, -1.142556, 0, 1, 0.4784314, 1,
-0.1570343, 0.2680147, -1.784649, 0, 1, 0.4823529, 1,
-0.1569801, 0.1934929, -1.496127, 0, 1, 0.4901961, 1,
-0.1547133, -0.7215505, -3.123685, 0, 1, 0.4941176, 1,
-0.1536055, -0.08484667, -1.314934, 0, 1, 0.5019608, 1,
-0.1511846, -0.02787101, -1.659879, 0, 1, 0.509804, 1,
-0.1468183, 1.104297, -2.179733, 0, 1, 0.5137255, 1,
-0.1452, -0.6723204, -3.258087, 0, 1, 0.5215687, 1,
-0.1438794, 0.75406, -1.515777, 0, 1, 0.5254902, 1,
-0.142624, 0.2282231, -1.211765, 0, 1, 0.5333334, 1,
-0.1412637, 0.7385895, 0.646888, 0, 1, 0.5372549, 1,
-0.1406295, 1.597125, 0.3863136, 0, 1, 0.5450981, 1,
-0.1357499, -0.4007884, -3.407934, 0, 1, 0.5490196, 1,
-0.133672, 0.9772794, -0.1159316, 0, 1, 0.5568628, 1,
-0.1299607, -0.7756512, -3.711987, 0, 1, 0.5607843, 1,
-0.1256767, -1.040343, -2.057746, 0, 1, 0.5686275, 1,
-0.1227482, -1.358851, -4.723585, 0, 1, 0.572549, 1,
-0.1180841, 1.499106, 0.1807067, 0, 1, 0.5803922, 1,
-0.1150063, -2.152342, -3.03344, 0, 1, 0.5843138, 1,
-0.1147648, 0.9815855, 0.4833905, 0, 1, 0.5921569, 1,
-0.1125089, 0.6772414, -0.9637761, 0, 1, 0.5960785, 1,
-0.1123093, -0.3744274, -3.277065, 0, 1, 0.6039216, 1,
-0.1120834, 0.948834, -0.8920006, 0, 1, 0.6117647, 1,
-0.1094983, -0.4306605, -3.47912, 0, 1, 0.6156863, 1,
-0.1039609, -0.6307424, -6.097106, 0, 1, 0.6235294, 1,
-0.1028176, -0.8085778, -3.272679, 0, 1, 0.627451, 1,
-0.09806404, 0.0143577, -0.6714165, 0, 1, 0.6352941, 1,
-0.09096288, 0.7127832, -0.2767107, 0, 1, 0.6392157, 1,
-0.08287609, 0.8967689, -2.452642, 0, 1, 0.6470588, 1,
-0.08223203, -0.2642131, -2.343377, 0, 1, 0.6509804, 1,
-0.07606619, 0.5185297, -1.349188, 0, 1, 0.6588235, 1,
-0.07605654, 0.167544, -1.05528, 0, 1, 0.6627451, 1,
-0.0753224, 0.4190097, 0.07424499, 0, 1, 0.6705883, 1,
-0.07148306, 0.2598263, -1.105045, 0, 1, 0.6745098, 1,
-0.07075607, 0.7364945, -0.4327456, 0, 1, 0.682353, 1,
-0.06994545, -0.3892734, -2.569592, 0, 1, 0.6862745, 1,
-0.06777257, -1.130414, -1.623567, 0, 1, 0.6941177, 1,
-0.06640326, 0.159146, -0.3943585, 0, 1, 0.7019608, 1,
-0.06634617, 1.815943, 0.8723553, 0, 1, 0.7058824, 1,
-0.06449758, -1.351524, -4.462998, 0, 1, 0.7137255, 1,
-0.06326072, 0.02210468, -1.53545, 0, 1, 0.7176471, 1,
-0.0612903, -0.7106743, -3.590397, 0, 1, 0.7254902, 1,
-0.06098197, -0.9932361, -1.340423, 0, 1, 0.7294118, 1,
-0.05696646, -0.07193109, -3.184201, 0, 1, 0.7372549, 1,
-0.05616445, -0.3748059, -3.101148, 0, 1, 0.7411765, 1,
-0.05472361, 1.216935, 0.4606389, 0, 1, 0.7490196, 1,
-0.05257368, 0.2569541, -0.2355499, 0, 1, 0.7529412, 1,
-0.04938412, -0.752524, -3.237144, 0, 1, 0.7607843, 1,
-0.03734405, 0.4193818, -0.4249457, 0, 1, 0.7647059, 1,
-0.03697057, -0.323911, -5.066506, 0, 1, 0.772549, 1,
-0.03521596, 0.9010423, -2.365735, 0, 1, 0.7764706, 1,
-0.02834824, -0.549982, -4.873408, 0, 1, 0.7843137, 1,
-0.02636238, -0.5545365, -3.128851, 0, 1, 0.7882353, 1,
-0.01272129, 1.281781, -1.02148, 0, 1, 0.7960784, 1,
-0.01177181, 0.08878961, -0.6065711, 0, 1, 0.8039216, 1,
-0.01042047, 0.5357111, -1.07927, 0, 1, 0.8078431, 1,
-0.008603608, 1.918104, 1.34722, 0, 1, 0.8156863, 1,
-0.008032636, 0.0126344, 1.757461, 0, 1, 0.8196079, 1,
-0.003711466, 0.3394013, -0.3032592, 0, 1, 0.827451, 1,
-0.002915984, -0.4067715, -4.937231, 0, 1, 0.8313726, 1,
-0.001416139, -0.2258177, -3.356729, 0, 1, 0.8392157, 1,
0.002702425, -0.5394045, 2.991745, 0, 1, 0.8431373, 1,
0.00362435, 0.2566358, -0.7727423, 0, 1, 0.8509804, 1,
0.005492805, -1.99362, 2.137354, 0, 1, 0.854902, 1,
0.009158344, -1.771793, 3.573544, 0, 1, 0.8627451, 1,
0.01048733, -0.1927376, 1.703693, 0, 1, 0.8666667, 1,
0.0107034, -0.2810548, 4.294782, 0, 1, 0.8745098, 1,
0.01151549, -0.7233064, 2.113962, 0, 1, 0.8784314, 1,
0.01244424, 0.4402931, -0.2318872, 0, 1, 0.8862745, 1,
0.01404301, 0.2570328, -0.2529057, 0, 1, 0.8901961, 1,
0.01547633, -0.1842543, 2.931161, 0, 1, 0.8980392, 1,
0.01758803, -0.5930262, 3.130474, 0, 1, 0.9058824, 1,
0.02545468, 0.08616151, 1.818133, 0, 1, 0.9098039, 1,
0.02625918, 1.62232, 0.9099588, 0, 1, 0.9176471, 1,
0.0293918, -0.3943201, 2.917711, 0, 1, 0.9215686, 1,
0.0300092, 0.5610243, 1.641778, 0, 1, 0.9294118, 1,
0.03257279, 0.7507156, 0.7523624, 0, 1, 0.9333333, 1,
0.03734108, -0.9946179, 1.586941, 0, 1, 0.9411765, 1,
0.04081054, -1.264629, 4.208704, 0, 1, 0.945098, 1,
0.04648898, -0.9275371, 4.09655, 0, 1, 0.9529412, 1,
0.04686315, 1.904054, 0.6508536, 0, 1, 0.9568627, 1,
0.05058907, 0.5807194, 0.7289355, 0, 1, 0.9647059, 1,
0.05089189, -0.09471332, 4.089134, 0, 1, 0.9686275, 1,
0.05302744, -0.2425788, 2.353133, 0, 1, 0.9764706, 1,
0.05322412, 0.7606105, -0.1970835, 0, 1, 0.9803922, 1,
0.05427025, 0.508003, -1.396239, 0, 1, 0.9882353, 1,
0.06348018, -1.657132, 4.821908, 0, 1, 0.9921569, 1,
0.065283, -1.091516, 2.45672, 0, 1, 1, 1,
0.06559968, -0.02226391, 1.845432, 0, 0.9921569, 1, 1,
0.06659199, 0.5837784, 1.075554, 0, 0.9882353, 1, 1,
0.07050903, 1.440998, 0.3614284, 0, 0.9803922, 1, 1,
0.07115338, 0.02054127, 2.669014, 0, 0.9764706, 1, 1,
0.07416655, 0.5461992, 0.2524225, 0, 0.9686275, 1, 1,
0.07505538, 2.780084, -0.1036994, 0, 0.9647059, 1, 1,
0.0810632, -1.069224, 3.807829, 0, 0.9568627, 1, 1,
0.08212642, -0.6720702, 1.506299, 0, 0.9529412, 1, 1,
0.08302129, 1.971325, -1.777502, 0, 0.945098, 1, 1,
0.08687274, 0.3984569, -1.183749, 0, 0.9411765, 1, 1,
0.0871494, -0.6834376, 2.218968, 0, 0.9333333, 1, 1,
0.09018937, -1.534345, 2.138309, 0, 0.9294118, 1, 1,
0.09034793, 0.2409834, 0.5804312, 0, 0.9215686, 1, 1,
0.09415496, 0.7190375, 0.9101, 0, 0.9176471, 1, 1,
0.1003191, -1.197694, 3.395526, 0, 0.9098039, 1, 1,
0.1021124, -0.8757481, 3.20679, 0, 0.9058824, 1, 1,
0.1043403, -0.4433604, 3.744288, 0, 0.8980392, 1, 1,
0.1138104, -1.462601, 4.198721, 0, 0.8901961, 1, 1,
0.118338, 0.1535843, 1.034804, 0, 0.8862745, 1, 1,
0.120015, -0.5551471, 2.707448, 0, 0.8784314, 1, 1,
0.1207866, -1.125561, 3.743815, 0, 0.8745098, 1, 1,
0.1210447, 0.4231566, -0.5295095, 0, 0.8666667, 1, 1,
0.1218205, -0.7843832, 3.98763, 0, 0.8627451, 1, 1,
0.1226773, 0.4530575, -1.251614, 0, 0.854902, 1, 1,
0.1235051, -0.5549713, 2.910913, 0, 0.8509804, 1, 1,
0.1266563, 1.225672, -1.063287, 0, 0.8431373, 1, 1,
0.1279188, -0.5509408, 3.310118, 0, 0.8392157, 1, 1,
0.1305534, 0.031438, 0.7852986, 0, 0.8313726, 1, 1,
0.1312431, 0.1377178, 1.514923, 0, 0.827451, 1, 1,
0.1331793, -0.6020349, 3.949852, 0, 0.8196079, 1, 1,
0.1337567, -0.1131995, 2.858733, 0, 0.8156863, 1, 1,
0.1391804, 0.0875499, 1.833982, 0, 0.8078431, 1, 1,
0.1493415, -2.382895, 2.703249, 0, 0.8039216, 1, 1,
0.1541423, 2.210768, -0.4847922, 0, 0.7960784, 1, 1,
0.1578492, 1.588071, 2.203647, 0, 0.7882353, 1, 1,
0.1604856, 0.1288246, -0.3004479, 0, 0.7843137, 1, 1,
0.16435, 1.790405, 2.101894, 0, 0.7764706, 1, 1,
0.1650713, 0.2531166, 1.613142, 0, 0.772549, 1, 1,
0.1727205, 1.75143, 0.8167721, 0, 0.7647059, 1, 1,
0.1735695, -0.5128803, 3.526834, 0, 0.7607843, 1, 1,
0.1741611, 1.432052, -0.3172899, 0, 0.7529412, 1, 1,
0.1775665, -1.314187, 4.211808, 0, 0.7490196, 1, 1,
0.1788416, -1.164654, 2.375556, 0, 0.7411765, 1, 1,
0.1821623, -0.03286078, 1.377914, 0, 0.7372549, 1, 1,
0.1841817, 1.432436, -1.46554, 0, 0.7294118, 1, 1,
0.1844277, 0.7990612, 0.4936999, 0, 0.7254902, 1, 1,
0.188572, 0.2808114, 0.665875, 0, 0.7176471, 1, 1,
0.1892921, -0.2732442, 2.748259, 0, 0.7137255, 1, 1,
0.1910231, 0.3026526, 0.2796289, 0, 0.7058824, 1, 1,
0.1916878, 0.6550593, 1.999571, 0, 0.6980392, 1, 1,
0.1926778, -0.1025453, 3.868353, 0, 0.6941177, 1, 1,
0.1929937, -0.5770157, 2.387066, 0, 0.6862745, 1, 1,
0.1967285, 0.1986762, 1.179805, 0, 0.682353, 1, 1,
0.199691, -0.8631811, 3.995064, 0, 0.6745098, 1, 1,
0.2010938, 0.1191756, 1.295176, 0, 0.6705883, 1, 1,
0.2035658, -1.232929, 2.827453, 0, 0.6627451, 1, 1,
0.2062806, -0.7323215, 3.499059, 0, 0.6588235, 1, 1,
0.2063248, -0.6498674, 4.261432, 0, 0.6509804, 1, 1,
0.2128303, 0.5711055, 0.6183082, 0, 0.6470588, 1, 1,
0.2146224, -0.4914936, 2.158674, 0, 0.6392157, 1, 1,
0.2156348, -0.221719, 0.6590338, 0, 0.6352941, 1, 1,
0.2176851, -0.7630095, 4.866941, 0, 0.627451, 1, 1,
0.2197694, 1.178405, 1.020722, 0, 0.6235294, 1, 1,
0.2226046, -1.646472, 3.712338, 0, 0.6156863, 1, 1,
0.2274564, -0.2495245, 2.993101, 0, 0.6117647, 1, 1,
0.2277639, 1.152535, -1.185154, 0, 0.6039216, 1, 1,
0.2306606, 0.1622088, 2.989502, 0, 0.5960785, 1, 1,
0.2314255, 0.3453572, -0.252857, 0, 0.5921569, 1, 1,
0.2338436, 0.8114612, 1.351995, 0, 0.5843138, 1, 1,
0.2338975, 0.1015022, 3.257455, 0, 0.5803922, 1, 1,
0.24532, 0.100642, 0.5349367, 0, 0.572549, 1, 1,
0.2500286, 0.2809835, 0.9702951, 0, 0.5686275, 1, 1,
0.252866, 1.107344, 1.53149, 0, 0.5607843, 1, 1,
0.255138, 0.4326749, 1.190494, 0, 0.5568628, 1, 1,
0.2559343, -0.7004753, 2.826302, 0, 0.5490196, 1, 1,
0.257034, -2.278903, 2.731492, 0, 0.5450981, 1, 1,
0.2578963, -0.7768039, 3.007202, 0, 0.5372549, 1, 1,
0.2601047, 0.542381, -0.008734873, 0, 0.5333334, 1, 1,
0.2610517, -0.870584, 0.9883698, 0, 0.5254902, 1, 1,
0.2638685, -0.4889881, 2.298393, 0, 0.5215687, 1, 1,
0.2650742, -1.223099, 3.781168, 0, 0.5137255, 1, 1,
0.2655402, -0.02705596, 2.53808, 0, 0.509804, 1, 1,
0.2669954, -0.196106, 1.353386, 0, 0.5019608, 1, 1,
0.2673357, 0.3572672, 1.434412, 0, 0.4941176, 1, 1,
0.2679158, -0.7425582, 2.009561, 0, 0.4901961, 1, 1,
0.2692819, -0.3867115, 1.76195, 0, 0.4823529, 1, 1,
0.2756373, 0.6466528, 2.216959, 0, 0.4784314, 1, 1,
0.2815515, -0.1136165, 2.120312, 0, 0.4705882, 1, 1,
0.2816143, -1.052304, 2.60393, 0, 0.4666667, 1, 1,
0.2930524, -0.3143899, 1.182099, 0, 0.4588235, 1, 1,
0.2944254, 0.9138111, 0.6643455, 0, 0.454902, 1, 1,
0.294677, 2.254214, -0.6821274, 0, 0.4470588, 1, 1,
0.2963699, -0.362152, 0.9500762, 0, 0.4431373, 1, 1,
0.2994507, 0.3612946, -0.3340807, 0, 0.4352941, 1, 1,
0.2999421, -0.5537751, 0.8030763, 0, 0.4313726, 1, 1,
0.3011183, 0.372603, 0.7793368, 0, 0.4235294, 1, 1,
0.3045057, 0.8836423, -0.1489612, 0, 0.4196078, 1, 1,
0.3070545, 0.5128428, 0.8659371, 0, 0.4117647, 1, 1,
0.3088042, 0.9338547, 0.9065192, 0, 0.4078431, 1, 1,
0.3112974, -0.6510351, 1.774646, 0, 0.4, 1, 1,
0.313094, -0.6612472, 3.598505, 0, 0.3921569, 1, 1,
0.3208446, -0.7329337, 3.193729, 0, 0.3882353, 1, 1,
0.3224946, -0.220257, 2.13109, 0, 0.3803922, 1, 1,
0.3236254, 1.007014, -0.03427095, 0, 0.3764706, 1, 1,
0.3241603, -0.9889567, 3.642308, 0, 0.3686275, 1, 1,
0.3302959, -0.5468168, 3.271624, 0, 0.3647059, 1, 1,
0.3349655, -0.5305648, 3.965442, 0, 0.3568628, 1, 1,
0.3364706, -0.2536268, 0.9788767, 0, 0.3529412, 1, 1,
0.3369934, 0.02868837, 1.962586, 0, 0.345098, 1, 1,
0.3416476, 0.3908168, 1.482738, 0, 0.3411765, 1, 1,
0.3428185, 0.3838514, 0.1978883, 0, 0.3333333, 1, 1,
0.3441656, -0.7994872, 0.7798622, 0, 0.3294118, 1, 1,
0.3443577, -0.8734356, 1.296342, 0, 0.3215686, 1, 1,
0.3506742, 0.01505999, 2.178252, 0, 0.3176471, 1, 1,
0.3523865, -0.04756475, 1.94738, 0, 0.3098039, 1, 1,
0.3533554, 0.4880526, 1.226932, 0, 0.3058824, 1, 1,
0.3541639, -1.040268, 4.018447, 0, 0.2980392, 1, 1,
0.3627462, 0.5684083, 1.665664, 0, 0.2901961, 1, 1,
0.3636946, -0.3831936, 2.329667, 0, 0.2862745, 1, 1,
0.3648929, -2.23387, 3.741257, 0, 0.2784314, 1, 1,
0.3692012, 0.4325874, 2.55131, 0, 0.2745098, 1, 1,
0.369237, 0.2105442, 0.4963409, 0, 0.2666667, 1, 1,
0.3695857, 1.115494, -0.9191554, 0, 0.2627451, 1, 1,
0.3776897, -0.1929168, 3.777175, 0, 0.254902, 1, 1,
0.3795887, -1.885738, 1.778744, 0, 0.2509804, 1, 1,
0.3798225, -0.1213693, 1.207469, 0, 0.2431373, 1, 1,
0.3810991, 1.306243, -0.05841895, 0, 0.2392157, 1, 1,
0.3824541, 1.704514, 0.3284497, 0, 0.2313726, 1, 1,
0.3829407, 0.8360999, 0.5844771, 0, 0.227451, 1, 1,
0.3863054, -0.1940481, 3.124842, 0, 0.2196078, 1, 1,
0.3911585, -0.9861585, 2.943313, 0, 0.2156863, 1, 1,
0.3913782, -0.007881528, 1.971579, 0, 0.2078431, 1, 1,
0.3923307, -1.575756, 4.648003, 0, 0.2039216, 1, 1,
0.3929345, 0.2656426, 2.840213, 0, 0.1960784, 1, 1,
0.3941843, -1.157961, 3.235519, 0, 0.1882353, 1, 1,
0.3973588, 0.8415176, 1.796532, 0, 0.1843137, 1, 1,
0.3982397, 0.976618, 1.290391, 0, 0.1764706, 1, 1,
0.3986514, -0.9356247, 3.973963, 0, 0.172549, 1, 1,
0.4003355, -1.378582, 2.56055, 0, 0.1647059, 1, 1,
0.4052215, -1.111908, 2.070994, 0, 0.1607843, 1, 1,
0.4070267, 0.4740148, 1.77548, 0, 0.1529412, 1, 1,
0.4109378, -0.9996022, 2.659394, 0, 0.1490196, 1, 1,
0.4126325, 0.9279684, 0.6068293, 0, 0.1411765, 1, 1,
0.4130891, -1.706063, 1.986728, 0, 0.1372549, 1, 1,
0.419495, 1.795867, -0.6804783, 0, 0.1294118, 1, 1,
0.4205609, -0.08783692, 2.372825, 0, 0.1254902, 1, 1,
0.4226639, -2.80798, 3.132882, 0, 0.1176471, 1, 1,
0.4246359, -1.917476, 3.314638, 0, 0.1137255, 1, 1,
0.4252869, 0.8860697, 1.200202, 0, 0.1058824, 1, 1,
0.4269107, -0.2550582, 0.3435873, 0, 0.09803922, 1, 1,
0.4328388, -0.6777043, 2.744932, 0, 0.09411765, 1, 1,
0.436547, -0.1533635, 1.6213, 0, 0.08627451, 1, 1,
0.4377667, -2.416235, 2.862791, 0, 0.08235294, 1, 1,
0.4388024, 1.622409, 1.808533, 0, 0.07450981, 1, 1,
0.4445185, -0.90469, 2.829587, 0, 0.07058824, 1, 1,
0.4504977, 0.3061554, 2.291651, 0, 0.0627451, 1, 1,
0.4519133, -0.0255121, 2.019789, 0, 0.05882353, 1, 1,
0.4602568, 0.07357913, 2.142913, 0, 0.05098039, 1, 1,
0.4686081, -1.107005, 1.822134, 0, 0.04705882, 1, 1,
0.4698197, 0.7130758, -0.1143878, 0, 0.03921569, 1, 1,
0.4712412, -3.21205, 4.893142, 0, 0.03529412, 1, 1,
0.4717375, -0.05969017, 1.49307, 0, 0.02745098, 1, 1,
0.4758727, 0.7637728, 1.475987, 0, 0.02352941, 1, 1,
0.477527, -1.203733, 2.685627, 0, 0.01568628, 1, 1,
0.4798254, 0.7258354, -0.7484068, 0, 0.01176471, 1, 1,
0.4832615, 0.5097579, 0.4932019, 0, 0.003921569, 1, 1,
0.4857156, 0.3488107, 2.577934, 0.003921569, 0, 1, 1,
0.4867567, 0.2542666, 0.6863034, 0.007843138, 0, 1, 1,
0.4905368, 0.5430215, 0.7179476, 0.01568628, 0, 1, 1,
0.4936058, -0.1213055, 2.393424, 0.01960784, 0, 1, 1,
0.4975868, 1.018143, -0.1703255, 0.02745098, 0, 1, 1,
0.4997395, 0.49073, 0.5404875, 0.03137255, 0, 1, 1,
0.5006572, 0.4441446, 1.067073, 0.03921569, 0, 1, 1,
0.5012704, 0.5940558, -0.2654537, 0.04313726, 0, 1, 1,
0.5067646, 0.8853077, 2.398277, 0.05098039, 0, 1, 1,
0.5075733, -0.1548638, 1.249131, 0.05490196, 0, 1, 1,
0.5102527, -2.05178, 1.85937, 0.0627451, 0, 1, 1,
0.5124812, 1.133363, 1.074853, 0.06666667, 0, 1, 1,
0.5153417, -1.748336, 1.076692, 0.07450981, 0, 1, 1,
0.5175132, 2.792404, -0.5184261, 0.07843138, 0, 1, 1,
0.5198805, 0.5182156, 0.8064786, 0.08627451, 0, 1, 1,
0.5228648, 0.06036104, 2.6396, 0.09019608, 0, 1, 1,
0.5237846, 2.602788, 0.8713894, 0.09803922, 0, 1, 1,
0.5300483, 0.3771515, -0.07682116, 0.1058824, 0, 1, 1,
0.5309161, -0.2380183, 1.458969, 0.1098039, 0, 1, 1,
0.5313822, 1.131983, 0.5759388, 0.1176471, 0, 1, 1,
0.5436566, -0.4009884, 1.2691, 0.1215686, 0, 1, 1,
0.5464631, 2.657732, -0.4668992, 0.1294118, 0, 1, 1,
0.5470086, -0.1062061, 1.815229, 0.1333333, 0, 1, 1,
0.5472351, -0.4629089, 2.51548, 0.1411765, 0, 1, 1,
0.5479048, 0.05994668, 3.307253, 0.145098, 0, 1, 1,
0.5528767, 0.4236061, 0.4965189, 0.1529412, 0, 1, 1,
0.5565444, -1.30299, 2.247344, 0.1568628, 0, 1, 1,
0.5622531, -0.5111907, 1.563432, 0.1647059, 0, 1, 1,
0.5629462, 2.087806, -0.3398154, 0.1686275, 0, 1, 1,
0.5676742, -0.7716162, 0.9638631, 0.1764706, 0, 1, 1,
0.5678128, 0.192854, -0.02676389, 0.1803922, 0, 1, 1,
0.5683329, 0.01466712, 2.518602, 0.1882353, 0, 1, 1,
0.5716227, 2.715621, 0.5370525, 0.1921569, 0, 1, 1,
0.5718348, -0.01474157, 2.75886, 0.2, 0, 1, 1,
0.5718452, -1.446314, 2.806278, 0.2078431, 0, 1, 1,
0.5725935, -0.5943924, 3.519704, 0.2117647, 0, 1, 1,
0.5760626, 0.2703594, 0.4881112, 0.2196078, 0, 1, 1,
0.5761018, -0.07407067, 2.004209, 0.2235294, 0, 1, 1,
0.5786328, 1.36012, 1.004821, 0.2313726, 0, 1, 1,
0.5820606, 1.59007, 0.6187869, 0.2352941, 0, 1, 1,
0.5874099, -0.5697549, 2.089657, 0.2431373, 0, 1, 1,
0.5911868, -1.363989, 0.8653196, 0.2470588, 0, 1, 1,
0.5998936, -0.0767088, 1.449973, 0.254902, 0, 1, 1,
0.6012813, 1.017896, 0.8589408, 0.2588235, 0, 1, 1,
0.6015218, 0.1718222, 1.9084, 0.2666667, 0, 1, 1,
0.6080756, 0.1378668, 3.69647, 0.2705882, 0, 1, 1,
0.6176832, 0.07810837, 0.4991762, 0.2784314, 0, 1, 1,
0.6209585, 1.771332, -1.212068, 0.282353, 0, 1, 1,
0.6228635, -0.5403701, 2.527539, 0.2901961, 0, 1, 1,
0.6231105, -0.5327412, 1.805408, 0.2941177, 0, 1, 1,
0.6247227, -0.8043315, 3.458449, 0.3019608, 0, 1, 1,
0.6249195, 1.048723, 2.2379, 0.3098039, 0, 1, 1,
0.6287797, -0.3164679, 0.1310204, 0.3137255, 0, 1, 1,
0.6388699, -1.163714, 3.167109, 0.3215686, 0, 1, 1,
0.641275, -0.02694267, 1.148809, 0.3254902, 0, 1, 1,
0.6429392, -0.2495249, 1.83209, 0.3333333, 0, 1, 1,
0.6432013, -0.5340804, 0.5172336, 0.3372549, 0, 1, 1,
0.6458722, 1.869628, 0.08211441, 0.345098, 0, 1, 1,
0.6476651, -0.05948517, 1.154888, 0.3490196, 0, 1, 1,
0.6485454, 0.4818198, 1.358945, 0.3568628, 0, 1, 1,
0.6488137, 1.999985, 1.162389, 0.3607843, 0, 1, 1,
0.6508875, -1.967225, 2.023277, 0.3686275, 0, 1, 1,
0.6585944, -1.048544, 0.5228578, 0.372549, 0, 1, 1,
0.6595967, -1.225039, 2.882455, 0.3803922, 0, 1, 1,
0.6633059, 0.4268693, 0.02514598, 0.3843137, 0, 1, 1,
0.6649151, 1.538815, -0.415274, 0.3921569, 0, 1, 1,
0.6652537, 2.078398, 1.82705, 0.3960784, 0, 1, 1,
0.6682554, -0.633269, 3.768283, 0.4039216, 0, 1, 1,
0.6771065, -0.326535, 2.519754, 0.4117647, 0, 1, 1,
0.67791, 1.251301, 1.007496, 0.4156863, 0, 1, 1,
0.6876507, 0.9985025, 0.2899747, 0.4235294, 0, 1, 1,
0.6883213, 0.2834286, 2.271932, 0.427451, 0, 1, 1,
0.6913296, 0.2312973, 0.5344542, 0.4352941, 0, 1, 1,
0.6917765, -3.266801, 3.20085, 0.4392157, 0, 1, 1,
0.6922894, 0.282725, 1.058821, 0.4470588, 0, 1, 1,
0.6943466, -2.343614, 2.385062, 0.4509804, 0, 1, 1,
0.6979973, -1.068167, 1.010596, 0.4588235, 0, 1, 1,
0.6999781, 1.526722, 0.2856917, 0.4627451, 0, 1, 1,
0.7023696, -0.5668192, 2.166551, 0.4705882, 0, 1, 1,
0.70252, -0.3584712, 1.110341, 0.4745098, 0, 1, 1,
0.7025933, 0.09421866, 2.346143, 0.4823529, 0, 1, 1,
0.7043265, -0.1868846, 1.027771, 0.4862745, 0, 1, 1,
0.7076262, 1.360492, 0.4935636, 0.4941176, 0, 1, 1,
0.7113398, 1.110035, 1.187332, 0.5019608, 0, 1, 1,
0.7177033, 0.1503737, 2.610278, 0.5058824, 0, 1, 1,
0.7190349, -1.235758, 2.567026, 0.5137255, 0, 1, 1,
0.7201717, 0.508903, 1.332037, 0.5176471, 0, 1, 1,
0.7248425, 0.2750067, 2.284154, 0.5254902, 0, 1, 1,
0.729394, -1.427325, 0.7717963, 0.5294118, 0, 1, 1,
0.7297119, 2.904433, 0.6424837, 0.5372549, 0, 1, 1,
0.7309874, -1.936312, 4.216921, 0.5411765, 0, 1, 1,
0.7312379, 0.7428743, 1.83591, 0.5490196, 0, 1, 1,
0.7334347, 0.4001054, 1.594133, 0.5529412, 0, 1, 1,
0.7367367, 0.1716273, 0.7681671, 0.5607843, 0, 1, 1,
0.7404838, -0.9939055, 1.793593, 0.5647059, 0, 1, 1,
0.7425662, 0.06293781, 0.6414113, 0.572549, 0, 1, 1,
0.7434939, 0.3305599, 2.275132, 0.5764706, 0, 1, 1,
0.746497, 2.53462, 0.3035676, 0.5843138, 0, 1, 1,
0.7499154, 0.004723852, 0.3754378, 0.5882353, 0, 1, 1,
0.7542229, -0.2760133, 1.137219, 0.5960785, 0, 1, 1,
0.7578179, 1.365783, 0.8846163, 0.6039216, 0, 1, 1,
0.7645182, 0.8274282, -0.3276817, 0.6078432, 0, 1, 1,
0.765413, -0.4065537, 0.6670676, 0.6156863, 0, 1, 1,
0.7736952, -1.193263, 2.715521, 0.6196079, 0, 1, 1,
0.7749507, -0.6227286, 1.834123, 0.627451, 0, 1, 1,
0.7811801, 1.142681, 0.8045017, 0.6313726, 0, 1, 1,
0.7817273, 0.3493791, -0.09252092, 0.6392157, 0, 1, 1,
0.7847574, -1.951944, 2.106039, 0.6431373, 0, 1, 1,
0.7993371, 0.3008757, 2.453571, 0.6509804, 0, 1, 1,
0.800747, 0.4826251, 1.565261, 0.654902, 0, 1, 1,
0.8017247, -0.07098409, 0.8634747, 0.6627451, 0, 1, 1,
0.8024146, 0.4949322, 0.9679816, 0.6666667, 0, 1, 1,
0.8025227, -1.208816, 1.995085, 0.6745098, 0, 1, 1,
0.8076773, -1.85303, 2.26641, 0.6784314, 0, 1, 1,
0.8182796, -2.142135, 4.00792, 0.6862745, 0, 1, 1,
0.8234459, 2.154194, -1.374992, 0.6901961, 0, 1, 1,
0.8238522, 2.653077, 0.2226749, 0.6980392, 0, 1, 1,
0.8382698, -0.6954611, 2.080232, 0.7058824, 0, 1, 1,
0.8418044, 1.437394, 1.310203, 0.7098039, 0, 1, 1,
0.8468722, -1.875603, 4.995545, 0.7176471, 0, 1, 1,
0.84806, -1.082822, 2.04043, 0.7215686, 0, 1, 1,
0.8493075, -0.01134116, 2.25719, 0.7294118, 0, 1, 1,
0.8495752, 0.4295791, 0.3291709, 0.7333333, 0, 1, 1,
0.8499159, -0.5364656, 3.336087, 0.7411765, 0, 1, 1,
0.8549777, -2.591453, 4.490325, 0.7450981, 0, 1, 1,
0.8555967, 0.0007439165, 1.61354, 0.7529412, 0, 1, 1,
0.8568359, 1.555621, 2.603979, 0.7568628, 0, 1, 1,
0.8569241, 2.147138, 0.04468907, 0.7647059, 0, 1, 1,
0.8603339, -0.4716333, 1.308715, 0.7686275, 0, 1, 1,
0.8667312, -0.4357461, 0.5623878, 0.7764706, 0, 1, 1,
0.8678865, -0.2383568, 2.968282, 0.7803922, 0, 1, 1,
0.8698213, 0.8150406, 0.02046531, 0.7882353, 0, 1, 1,
0.8739235, -1.039307, 0.632318, 0.7921569, 0, 1, 1,
0.8755234, 0.2609138, 1.235256, 0.8, 0, 1, 1,
0.8760372, 1.137761, -0.3769172, 0.8078431, 0, 1, 1,
0.8782721, 0.2181774, 0.5141641, 0.8117647, 0, 1, 1,
0.8783102, 0.00699817, 1.634565, 0.8196079, 0, 1, 1,
0.880028, 1.004123, 0.4856755, 0.8235294, 0, 1, 1,
0.8806663, 1.183856, -0.7115854, 0.8313726, 0, 1, 1,
0.8814012, 0.4667175, 1.768247, 0.8352941, 0, 1, 1,
0.8834745, 0.2607551, 0.377219, 0.8431373, 0, 1, 1,
0.8860849, 1.356835, 0.8729508, 0.8470588, 0, 1, 1,
0.8915416, 0.5231222, 1.148564, 0.854902, 0, 1, 1,
0.8919918, 0.5513589, 2.668882, 0.8588235, 0, 1, 1,
0.9008982, -1.145344, 1.628115, 0.8666667, 0, 1, 1,
0.9062375, -0.436784, 1.181718, 0.8705882, 0, 1, 1,
0.9244117, -0.7314394, 2.577867, 0.8784314, 0, 1, 1,
0.9282254, -1.289242, 0.7566764, 0.8823529, 0, 1, 1,
0.9288771, 0.4992505, 0.4071818, 0.8901961, 0, 1, 1,
0.9318662, -0.08142035, 2.106461, 0.8941177, 0, 1, 1,
0.9329994, 0.448175, 1.873092, 0.9019608, 0, 1, 1,
0.9338032, -0.4960888, 2.632996, 0.9098039, 0, 1, 1,
0.9358476, 0.2545742, 1.673586, 0.9137255, 0, 1, 1,
0.941343, -1.214865, 3.641411, 0.9215686, 0, 1, 1,
0.945521, 0.2321455, 3.190293, 0.9254902, 0, 1, 1,
0.9498187, -2.405718, 3.68691, 0.9333333, 0, 1, 1,
0.9515139, -0.2619423, 1.098899, 0.9372549, 0, 1, 1,
0.9519167, 0.3463437, 0.4761093, 0.945098, 0, 1, 1,
0.955304, -0.7189167, 2.164182, 0.9490196, 0, 1, 1,
0.9558698, 0.06792435, 2.92379, 0.9568627, 0, 1, 1,
0.9606355, -0.7001632, 1.466094, 0.9607843, 0, 1, 1,
0.9617566, 0.3660271, 3.733663, 0.9686275, 0, 1, 1,
0.969287, -0.3816154, 1.508639, 0.972549, 0, 1, 1,
0.9741404, 0.9582675, 0.7957134, 0.9803922, 0, 1, 1,
0.9792192, 0.7572747, 0.5680948, 0.9843137, 0, 1, 1,
0.9818522, -0.5514904, 2.006398, 0.9921569, 0, 1, 1,
0.9849372, 0.5571738, 2.194144, 0.9960784, 0, 1, 1,
0.9877683, 0.5861306, 2.026963, 1, 0, 0.9960784, 1,
0.9894907, 0.5607706, 1.409453, 1, 0, 0.9882353, 1,
0.9902058, 2.048469, -1.129737, 1, 0, 0.9843137, 1,
0.9967235, -1.816828, 3.266826, 1, 0, 0.9764706, 1,
0.9995164, -0.1898627, 2.044834, 1, 0, 0.972549, 1,
1.007897, -0.2372274, -0.1892878, 1, 0, 0.9647059, 1,
1.008208, -1.90065, 2.599871, 1, 0, 0.9607843, 1,
1.010943, -1.269928, 0.6844818, 1, 0, 0.9529412, 1,
1.015825, -1.361833, 1.54671, 1, 0, 0.9490196, 1,
1.019108, 0.7821525, 1.479665, 1, 0, 0.9411765, 1,
1.019251, 1.645361, 0.7828866, 1, 0, 0.9372549, 1,
1.019473, -0.09556273, 1.429792, 1, 0, 0.9294118, 1,
1.023379, -1.30459, 3.239565, 1, 0, 0.9254902, 1,
1.028594, -1.710271, 2.037953, 1, 0, 0.9176471, 1,
1.033404, -0.07409813, 2.888774, 1, 0, 0.9137255, 1,
1.033491, 0.743643, 1.495251, 1, 0, 0.9058824, 1,
1.036157, 0.7945466, 1.230539, 1, 0, 0.9019608, 1,
1.0396, -1.014407, -0.0943592, 1, 0, 0.8941177, 1,
1.041943, -1.754687, 3.781783, 1, 0, 0.8862745, 1,
1.044876, -0.1574121, 3.514565, 1, 0, 0.8823529, 1,
1.047523, -1.515786, 3.281276, 1, 0, 0.8745098, 1,
1.056464, -0.2847759, 0.8365644, 1, 0, 0.8705882, 1,
1.058167, 1.173367, 1.242409, 1, 0, 0.8627451, 1,
1.06516, 0.183748, 1.728649, 1, 0, 0.8588235, 1,
1.065524, -2.207484, 0.8343794, 1, 0, 0.8509804, 1,
1.068311, 0.2613749, 0.8352449, 1, 0, 0.8470588, 1,
1.07528, 0.2810598, 0.826946, 1, 0, 0.8392157, 1,
1.087469, 0.4499568, 3.225832, 1, 0, 0.8352941, 1,
1.111334, -0.1818396, 2.092944, 1, 0, 0.827451, 1,
1.113661, 0.1562789, 1.330244, 1, 0, 0.8235294, 1,
1.116155, 1.313407, 2.353624, 1, 0, 0.8156863, 1,
1.119746, -0.6440597, 1.13151, 1, 0, 0.8117647, 1,
1.122479, 0.2729418, 1.34606, 1, 0, 0.8039216, 1,
1.123822, 0.3622623, 2.139192, 1, 0, 0.7960784, 1,
1.129399, 0.2496167, -0.07652351, 1, 0, 0.7921569, 1,
1.131395, -1.873688, 2.784655, 1, 0, 0.7843137, 1,
1.143234, 1.07459, 1.523511, 1, 0, 0.7803922, 1,
1.150793, -0.9250879, 3.185063, 1, 0, 0.772549, 1,
1.151813, 0.3333982, 2.845712, 1, 0, 0.7686275, 1,
1.156808, -0.1977998, 1.433466, 1, 0, 0.7607843, 1,
1.160438, 0.5587589, 1.882964, 1, 0, 0.7568628, 1,
1.162269, 0.3207581, 3.420174, 1, 0, 0.7490196, 1,
1.168961, -0.5233071, 2.193182, 1, 0, 0.7450981, 1,
1.183721, -0.4210881, 0.307452, 1, 0, 0.7372549, 1,
1.185919, 0.4538163, 0.5954657, 1, 0, 0.7333333, 1,
1.202592, 1.206619, 1.324306, 1, 0, 0.7254902, 1,
1.218112, 0.765943, 1.277974, 1, 0, 0.7215686, 1,
1.221452, -1.048664, 3.304515, 1, 0, 0.7137255, 1,
1.225352, 0.7390407, 1.709397, 1, 0, 0.7098039, 1,
1.227718, 0.4255295, 2.544249, 1, 0, 0.7019608, 1,
1.235853, -0.3179862, 0.5941011, 1, 0, 0.6941177, 1,
1.239567, 0.4140562, 1.538217, 1, 0, 0.6901961, 1,
1.244802, -0.1146125, 0.4894974, 1, 0, 0.682353, 1,
1.249051, -0.2968985, 0.01556307, 1, 0, 0.6784314, 1,
1.254081, 0.5028693, 2.184588, 1, 0, 0.6705883, 1,
1.262263, -0.4746948, 1.24011, 1, 0, 0.6666667, 1,
1.263166, 0.851655, 2.38938, 1, 0, 0.6588235, 1,
1.264352, 0.7041844, 2.067664, 1, 0, 0.654902, 1,
1.26876, -0.4506769, 2.869184, 1, 0, 0.6470588, 1,
1.278848, 0.5811944, -2.447364, 1, 0, 0.6431373, 1,
1.289741, 1.411861, 2.815526, 1, 0, 0.6352941, 1,
1.290629, 0.3472663, 3.870021, 1, 0, 0.6313726, 1,
1.291381, 0.393115, 2.151543, 1, 0, 0.6235294, 1,
1.294683, -0.8790991, 0.2880939, 1, 0, 0.6196079, 1,
1.2967, -0.6890038, 3.118618, 1, 0, 0.6117647, 1,
1.29688, -0.2073991, 1.417133, 1, 0, 0.6078432, 1,
1.297892, -1.144017, 1.650945, 1, 0, 0.6, 1,
1.302784, -0.1016344, 0.09470306, 1, 0, 0.5921569, 1,
1.311216, -1.681015, 1.806786, 1, 0, 0.5882353, 1,
1.316268, 0.3339372, 1.685511, 1, 0, 0.5803922, 1,
1.325336, -0.7961937, 1.541262, 1, 0, 0.5764706, 1,
1.329615, -0.3792834, 3.648089, 1, 0, 0.5686275, 1,
1.332281, -0.6115664, 1.732978, 1, 0, 0.5647059, 1,
1.33413, 0.02286271, -0.1817692, 1, 0, 0.5568628, 1,
1.335856, -0.3019814, 3.377683, 1, 0, 0.5529412, 1,
1.336598, 0.03634194, 0.9902156, 1, 0, 0.5450981, 1,
1.339325, -1.412799, 2.595885, 1, 0, 0.5411765, 1,
1.353796, -0.3887894, 0.4969139, 1, 0, 0.5333334, 1,
1.360867, 0.5932898, -0.1823571, 1, 0, 0.5294118, 1,
1.369042, -0.3322619, 1.66503, 1, 0, 0.5215687, 1,
1.371692, 1.035997, 0.5528991, 1, 0, 0.5176471, 1,
1.377249, 0.5945926, 2.187022, 1, 0, 0.509804, 1,
1.378649, -0.6597338, 2.562995, 1, 0, 0.5058824, 1,
1.393732, -1.396022, 2.160277, 1, 0, 0.4980392, 1,
1.397995, -1.199826, 0.9144363, 1, 0, 0.4901961, 1,
1.398587, 0.5333081, 0.3646761, 1, 0, 0.4862745, 1,
1.414111, 0.7450536, 0.350427, 1, 0, 0.4784314, 1,
1.414307, 0.9642016, 1.040018, 1, 0, 0.4745098, 1,
1.417485, 0.7109833, 1.721941, 1, 0, 0.4666667, 1,
1.420814, -0.06162318, 2.38862, 1, 0, 0.4627451, 1,
1.429739, -1.300509, 2.415535, 1, 0, 0.454902, 1,
1.443754, 0.8607553, 2.142658, 1, 0, 0.4509804, 1,
1.451581, -0.662194, 3.132689, 1, 0, 0.4431373, 1,
1.452731, 0.5027273, 0.8445055, 1, 0, 0.4392157, 1,
1.468548, 1.958781, 1.077203, 1, 0, 0.4313726, 1,
1.470592, 0.7942606, 1.414531, 1, 0, 0.427451, 1,
1.488788, -0.8629677, 1.552777, 1, 0, 0.4196078, 1,
1.493817, 1.053183, 0.6268317, 1, 0, 0.4156863, 1,
1.49921, 0.6263192, 2.604063, 1, 0, 0.4078431, 1,
1.504153, 0.4518578, 2.057846, 1, 0, 0.4039216, 1,
1.516984, -0.3760181, 1.679502, 1, 0, 0.3960784, 1,
1.517051, 0.2768981, 1.588208, 1, 0, 0.3882353, 1,
1.52513, -0.812995, 3.430172, 1, 0, 0.3843137, 1,
1.541034, 1.345736, 0.4659743, 1, 0, 0.3764706, 1,
1.545711, 0.1887045, 0.8225753, 1, 0, 0.372549, 1,
1.552694, 0.702302, 2.069236, 1, 0, 0.3647059, 1,
1.557606, 0.1798101, 2.745936, 1, 0, 0.3607843, 1,
1.562136, -0.7675307, 1.34015, 1, 0, 0.3529412, 1,
1.564977, 0.1362297, 2.310047, 1, 0, 0.3490196, 1,
1.570082, 0.3503157, 2.459554, 1, 0, 0.3411765, 1,
1.576084, -0.9813071, 1.36337, 1, 0, 0.3372549, 1,
1.57734, -0.456483, 3.547441, 1, 0, 0.3294118, 1,
1.579673, 0.3921327, 1.488626, 1, 0, 0.3254902, 1,
1.588002, -2.613002, 3.393222, 1, 0, 0.3176471, 1,
1.603969, -0.1060142, 2.433561, 1, 0, 0.3137255, 1,
1.604383, -0.6333691, 2.754507, 1, 0, 0.3058824, 1,
1.60521, 0.8296429, 1.030689, 1, 0, 0.2980392, 1,
1.611414, -0.1299809, 0.6881944, 1, 0, 0.2941177, 1,
1.621339, -0.4800021, -0.9540813, 1, 0, 0.2862745, 1,
1.631835, 0.5550365, 0.2132079, 1, 0, 0.282353, 1,
1.633362, -1.983459, 2.676327, 1, 0, 0.2745098, 1,
1.637038, 0.4626708, 0.3828173, 1, 0, 0.2705882, 1,
1.644381, -0.1131204, 0.551939, 1, 0, 0.2627451, 1,
1.647096, -0.3308632, 0.2307491, 1, 0, 0.2588235, 1,
1.656269, 0.09172777, 1.393392, 1, 0, 0.2509804, 1,
1.671912, 1.784423, 0.9375631, 1, 0, 0.2470588, 1,
1.717761, 0.2021262, 0.8999318, 1, 0, 0.2392157, 1,
1.737006, -0.9614, 0.8304607, 1, 0, 0.2352941, 1,
1.743917, -1.269032, 2.113418, 1, 0, 0.227451, 1,
1.749943, -1.908072, 3.247971, 1, 0, 0.2235294, 1,
1.75453, -1.085675, 0.9961006, 1, 0, 0.2156863, 1,
1.755362, 1.720694, 1.465319, 1, 0, 0.2117647, 1,
1.766971, -1.022334, 2.282802, 1, 0, 0.2039216, 1,
1.799866, 0.8517652, 1.136855, 1, 0, 0.1960784, 1,
1.812482, -0.5226736, 3.11101, 1, 0, 0.1921569, 1,
1.819058, -1.695311, 2.620527, 1, 0, 0.1843137, 1,
1.845237, 0.1458724, 0.7191534, 1, 0, 0.1803922, 1,
1.866627, 0.1028999, 1.303457, 1, 0, 0.172549, 1,
1.872252, -0.2695783, 0.336292, 1, 0, 0.1686275, 1,
1.883948, -0.08824813, 2.284756, 1, 0, 0.1607843, 1,
1.887794, 0.009714699, 2.384449, 1, 0, 0.1568628, 1,
1.902648, -0.1543582, 1.036736, 1, 0, 0.1490196, 1,
1.925278, 0.1590517, 2.054658, 1, 0, 0.145098, 1,
1.93289, 0.109933, 3.524425, 1, 0, 0.1372549, 1,
1.952435, 0.4579118, 2.470797, 1, 0, 0.1333333, 1,
1.960935, -0.2711627, -0.5552517, 1, 0, 0.1254902, 1,
2.018122, -0.07169737, 1.388037, 1, 0, 0.1215686, 1,
2.020553, 0.3371659, 0.5113326, 1, 0, 0.1137255, 1,
2.038135, 0.1750266, 3.148989, 1, 0, 0.1098039, 1,
2.082407, 0.6694599, 2.146538, 1, 0, 0.1019608, 1,
2.13676, -0.4862885, 0.7336773, 1, 0, 0.09411765, 1,
2.175138, -0.8528636, 1.839044, 1, 0, 0.09019608, 1,
2.178426, 0.1213685, 2.472786, 1, 0, 0.08235294, 1,
2.182736, -0.01911251, 2.978772, 1, 0, 0.07843138, 1,
2.182749, -0.6512797, 0.8636881, 1, 0, 0.07058824, 1,
2.214876, -1.186132, 1.039601, 1, 0, 0.06666667, 1,
2.223204, -0.3328692, 2.130948, 1, 0, 0.05882353, 1,
2.242632, 2.080854, 0.6447201, 1, 0, 0.05490196, 1,
2.297609, -0.7983108, 3.4404, 1, 0, 0.04705882, 1,
2.355077, 1.587579, -0.4167321, 1, 0, 0.04313726, 1,
2.444218, 0.3296081, 2.375456, 1, 0, 0.03529412, 1,
2.445156, 1.199913, 0.0264285, 1, 0, 0.03137255, 1,
2.516008, 1.364869, 2.269314, 1, 0, 0.02352941, 1,
2.571684, 0.2014047, 2.921945, 1, 0, 0.01960784, 1,
2.610785, -0.9561691, 3.070184, 1, 0, 0.01176471, 1,
2.647244, 0.3132754, 2.922073, 1, 0, 0.007843138, 1
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
-0.09306765, -4.312826, -7.97731, 0, -0.5, 0.5, 0.5,
-0.09306765, -4.312826, -7.97731, 1, -0.5, 0.5, 0.5,
-0.09306765, -4.312826, -7.97731, 1, 1.5, 0.5, 0.5,
-0.09306765, -4.312826, -7.97731, 0, 1.5, 0.5, 0.5
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
-3.762345, -0.1811843, -7.97731, 0, -0.5, 0.5, 0.5,
-3.762345, -0.1811843, -7.97731, 1, -0.5, 0.5, 0.5,
-3.762345, -0.1811843, -7.97731, 1, 1.5, 0.5, 0.5,
-3.762345, -0.1811843, -7.97731, 0, 1.5, 0.5, 0.5
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
-3.762345, -4.312826, -0.5507801, 0, -0.5, 0.5, 0.5,
-3.762345, -4.312826, -0.5507801, 1, -0.5, 0.5, 0.5,
-3.762345, -4.312826, -0.5507801, 1, 1.5, 0.5, 0.5,
-3.762345, -4.312826, -0.5507801, 0, 1.5, 0.5, 0.5
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
-2, -3.35937, -6.263495,
2, -3.35937, -6.263495,
-2, -3.35937, -6.263495,
-2, -3.518279, -6.549131,
-1, -3.35937, -6.263495,
-1, -3.518279, -6.549131,
0, -3.35937, -6.263495,
0, -3.518279, -6.549131,
1, -3.35937, -6.263495,
1, -3.518279, -6.549131,
2, -3.35937, -6.263495,
2, -3.518279, -6.549131
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
-2, -3.836098, -7.120402, 0, -0.5, 0.5, 0.5,
-2, -3.836098, -7.120402, 1, -0.5, 0.5, 0.5,
-2, -3.836098, -7.120402, 1, 1.5, 0.5, 0.5,
-2, -3.836098, -7.120402, 0, 1.5, 0.5, 0.5,
-1, -3.836098, -7.120402, 0, -0.5, 0.5, 0.5,
-1, -3.836098, -7.120402, 1, -0.5, 0.5, 0.5,
-1, -3.836098, -7.120402, 1, 1.5, 0.5, 0.5,
-1, -3.836098, -7.120402, 0, 1.5, 0.5, 0.5,
0, -3.836098, -7.120402, 0, -0.5, 0.5, 0.5,
0, -3.836098, -7.120402, 1, -0.5, 0.5, 0.5,
0, -3.836098, -7.120402, 1, 1.5, 0.5, 0.5,
0, -3.836098, -7.120402, 0, 1.5, 0.5, 0.5,
1, -3.836098, -7.120402, 0, -0.5, 0.5, 0.5,
1, -3.836098, -7.120402, 1, -0.5, 0.5, 0.5,
1, -3.836098, -7.120402, 1, 1.5, 0.5, 0.5,
1, -3.836098, -7.120402, 0, 1.5, 0.5, 0.5,
2, -3.836098, -7.120402, 0, -0.5, 0.5, 0.5,
2, -3.836098, -7.120402, 1, -0.5, 0.5, 0.5,
2, -3.836098, -7.120402, 1, 1.5, 0.5, 0.5,
2, -3.836098, -7.120402, 0, 1.5, 0.5, 0.5
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
-2.915589, -3, -6.263495,
-2.915589, 2, -6.263495,
-2.915589, -3, -6.263495,
-3.056715, -3, -6.549131,
-2.915589, -2, -6.263495,
-3.056715, -2, -6.549131,
-2.915589, -1, -6.263495,
-3.056715, -1, -6.549131,
-2.915589, 0, -6.263495,
-3.056715, 0, -6.549131,
-2.915589, 1, -6.263495,
-3.056715, 1, -6.549131,
-2.915589, 2, -6.263495,
-3.056715, 2, -6.549131
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
-3.338967, -3, -7.120402, 0, -0.5, 0.5, 0.5,
-3.338967, -3, -7.120402, 1, -0.5, 0.5, 0.5,
-3.338967, -3, -7.120402, 1, 1.5, 0.5, 0.5,
-3.338967, -3, -7.120402, 0, 1.5, 0.5, 0.5,
-3.338967, -2, -7.120402, 0, -0.5, 0.5, 0.5,
-3.338967, -2, -7.120402, 1, -0.5, 0.5, 0.5,
-3.338967, -2, -7.120402, 1, 1.5, 0.5, 0.5,
-3.338967, -2, -7.120402, 0, 1.5, 0.5, 0.5,
-3.338967, -1, -7.120402, 0, -0.5, 0.5, 0.5,
-3.338967, -1, -7.120402, 1, -0.5, 0.5, 0.5,
-3.338967, -1, -7.120402, 1, 1.5, 0.5, 0.5,
-3.338967, -1, -7.120402, 0, 1.5, 0.5, 0.5,
-3.338967, 0, -7.120402, 0, -0.5, 0.5, 0.5,
-3.338967, 0, -7.120402, 1, -0.5, 0.5, 0.5,
-3.338967, 0, -7.120402, 1, 1.5, 0.5, 0.5,
-3.338967, 0, -7.120402, 0, 1.5, 0.5, 0.5,
-3.338967, 1, -7.120402, 0, -0.5, 0.5, 0.5,
-3.338967, 1, -7.120402, 1, -0.5, 0.5, 0.5,
-3.338967, 1, -7.120402, 1, 1.5, 0.5, 0.5,
-3.338967, 1, -7.120402, 0, 1.5, 0.5, 0.5,
-3.338967, 2, -7.120402, 0, -0.5, 0.5, 0.5,
-3.338967, 2, -7.120402, 1, -0.5, 0.5, 0.5,
-3.338967, 2, -7.120402, 1, 1.5, 0.5, 0.5,
-3.338967, 2, -7.120402, 0, 1.5, 0.5, 0.5
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
-2.915589, -3.35937, -6,
-2.915589, -3.35937, 4,
-2.915589, -3.35937, -6,
-3.056715, -3.518279, -6,
-2.915589, -3.35937, -4,
-3.056715, -3.518279, -4,
-2.915589, -3.35937, -2,
-3.056715, -3.518279, -2,
-2.915589, -3.35937, 0,
-3.056715, -3.518279, 0,
-2.915589, -3.35937, 2,
-3.056715, -3.518279, 2,
-2.915589, -3.35937, 4,
-3.056715, -3.518279, 4
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
-3.338967, -3.836098, -6, 0, -0.5, 0.5, 0.5,
-3.338967, -3.836098, -6, 1, -0.5, 0.5, 0.5,
-3.338967, -3.836098, -6, 1, 1.5, 0.5, 0.5,
-3.338967, -3.836098, -6, 0, 1.5, 0.5, 0.5,
-3.338967, -3.836098, -4, 0, -0.5, 0.5, 0.5,
-3.338967, -3.836098, -4, 1, -0.5, 0.5, 0.5,
-3.338967, -3.836098, -4, 1, 1.5, 0.5, 0.5,
-3.338967, -3.836098, -4, 0, 1.5, 0.5, 0.5,
-3.338967, -3.836098, -2, 0, -0.5, 0.5, 0.5,
-3.338967, -3.836098, -2, 1, -0.5, 0.5, 0.5,
-3.338967, -3.836098, -2, 1, 1.5, 0.5, 0.5,
-3.338967, -3.836098, -2, 0, 1.5, 0.5, 0.5,
-3.338967, -3.836098, 0, 0, -0.5, 0.5, 0.5,
-3.338967, -3.836098, 0, 1, -0.5, 0.5, 0.5,
-3.338967, -3.836098, 0, 1, 1.5, 0.5, 0.5,
-3.338967, -3.836098, 0, 0, 1.5, 0.5, 0.5,
-3.338967, -3.836098, 2, 0, -0.5, 0.5, 0.5,
-3.338967, -3.836098, 2, 1, -0.5, 0.5, 0.5,
-3.338967, -3.836098, 2, 1, 1.5, 0.5, 0.5,
-3.338967, -3.836098, 2, 0, 1.5, 0.5, 0.5,
-3.338967, -3.836098, 4, 0, -0.5, 0.5, 0.5,
-3.338967, -3.836098, 4, 1, -0.5, 0.5, 0.5,
-3.338967, -3.836098, 4, 1, 1.5, 0.5, 0.5,
-3.338967, -3.836098, 4, 0, 1.5, 0.5, 0.5
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
-2.915589, -3.35937, -6.263495,
-2.915589, 2.997001, -6.263495,
-2.915589, -3.35937, 5.161935,
-2.915589, 2.997001, 5.161935,
-2.915589, -3.35937, -6.263495,
-2.915589, -3.35937, 5.161935,
-2.915589, 2.997001, -6.263495,
-2.915589, 2.997001, 5.161935,
-2.915589, -3.35937, -6.263495,
2.729454, -3.35937, -6.263495,
-2.915589, -3.35937, 5.161935,
2.729454, -3.35937, 5.161935,
-2.915589, 2.997001, -6.263495,
2.729454, 2.997001, -6.263495,
-2.915589, 2.997001, 5.161935,
2.729454, 2.997001, 5.161935,
2.729454, -3.35937, -6.263495,
2.729454, 2.997001, -6.263495,
2.729454, -3.35937, 5.161935,
2.729454, 2.997001, 5.161935,
2.729454, -3.35937, -6.263495,
2.729454, -3.35937, 5.161935,
2.729454, 2.997001, -6.263495,
2.729454, 2.997001, 5.161935
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
var radius = 7.604499;
var distance = 33.83327;
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
mvMatrix.translate( 0.09306765, 0.1811843, 0.5507801 );
mvMatrix.scale( 1.456523, 1.293526, 0.7196344 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.83327);
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
methoproptryne<-read.table("methoproptryne.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methoproptryne$V2
```

```
## Error in eval(expr, envir, enclos): object 'methoproptryne' not found
```

```r
y<-methoproptryne$V3
```

```
## Error in eval(expr, envir, enclos): object 'methoproptryne' not found
```

```r
z<-methoproptryne$V4
```

```
## Error in eval(expr, envir, enclos): object 'methoproptryne' not found
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
-2.83338, -2.336945, -1.520959, 0, 0, 1, 1, 1,
-2.812241, 0.3994104, -0.5440812, 1, 0, 0, 1, 1,
-2.7857, 0.3833764, -1.715989, 1, 0, 0, 1, 1,
-2.631459, 1.452943, -3.10908, 1, 0, 0, 1, 1,
-2.601942, 0.4968668, -2.568937, 1, 0, 0, 1, 1,
-2.568632, -1.079039, -1.026732, 1, 0, 0, 1, 1,
-2.548955, 0.2898746, -2.066259, 0, 0, 0, 1, 1,
-2.464832, 0.5418812, -0.8643548, 0, 0, 0, 1, 1,
-2.450653, -0.2862046, -1.288455, 0, 0, 0, 1, 1,
-2.385172, -0.7255486, -0.8034021, 0, 0, 0, 1, 1,
-2.301285, 0.4813515, -2.269844, 0, 0, 0, 1, 1,
-2.260614, -0.130479, -0.4252613, 0, 0, 0, 1, 1,
-2.255821, 1.601485, -1.682663, 0, 0, 0, 1, 1,
-2.226417, -0.9820426, -2.365086, 1, 1, 1, 1, 1,
-2.213403, 0.6202653, -0.7383546, 1, 1, 1, 1, 1,
-2.207227, -0.3538676, -3.693335, 1, 1, 1, 1, 1,
-2.142194, 0.2697622, -1.026798, 1, 1, 1, 1, 1,
-2.103228, 0.4065784, -2.207044, 1, 1, 1, 1, 1,
-2.09433, 0.2379172, -1.348394, 1, 1, 1, 1, 1,
-2.050281, 1.378254, -1.026068, 1, 1, 1, 1, 1,
-2.035239, -1.186276, 0.4094779, 1, 1, 1, 1, 1,
-2.019257, 1.057083, -0.1499423, 1, 1, 1, 1, 1,
-2.013804, -0.5626915, -2.927783, 1, 1, 1, 1, 1,
-2.000998, 0.4857983, 0.6701298, 1, 1, 1, 1, 1,
-1.97741, -1.347326, -4.499674, 1, 1, 1, 1, 1,
-1.917363, -0.02559753, 0.3202826, 1, 1, 1, 1, 1,
-1.868854, -0.6126298, -2.243739, 1, 1, 1, 1, 1,
-1.859142, -0.5054457, -1.09726, 1, 1, 1, 1, 1,
-1.842092, 0.004647923, -0.7950231, 0, 0, 1, 1, 1,
-1.825494, -1.081914, -2.24496, 1, 0, 0, 1, 1,
-1.81505, 0.3519964, -1.694657, 1, 0, 0, 1, 1,
-1.813554, 0.7652856, -0.7525455, 1, 0, 0, 1, 1,
-1.792889, -0.008952343, -1.853764, 1, 0, 0, 1, 1,
-1.767274, -1.007841, -2.340731, 1, 0, 0, 1, 1,
-1.763588, -0.9957424, -1.413273, 0, 0, 0, 1, 1,
-1.762523, 0.9183361, -1.069151, 0, 0, 0, 1, 1,
-1.746625, 0.1073232, 0.2524599, 0, 0, 0, 1, 1,
-1.739549, -0.4629298, -1.485095, 0, 0, 0, 1, 1,
-1.711807, 1.663844, 0.5350761, 0, 0, 0, 1, 1,
-1.707959, -0.04166351, -1.663748, 0, 0, 0, 1, 1,
-1.699657, -0.2594656, -1.91557, 0, 0, 0, 1, 1,
-1.682475, -0.6302334, -3.615745, 1, 1, 1, 1, 1,
-1.656028, -1.291675, -0.7029319, 1, 1, 1, 1, 1,
-1.651226, 0.5140232, 0.03663212, 1, 1, 1, 1, 1,
-1.650964, 1.350269, 0.08196131, 1, 1, 1, 1, 1,
-1.647896, 0.08738846, -1.807988, 1, 1, 1, 1, 1,
-1.633018, 0.8400425, -0.7773045, 1, 1, 1, 1, 1,
-1.623339, 0.7603282, 0.979314, 1, 1, 1, 1, 1,
-1.619825, 0.221596, -0.3520105, 1, 1, 1, 1, 1,
-1.613356, -1.260462, -2.320295, 1, 1, 1, 1, 1,
-1.605294, -0.2555768, -1.549592, 1, 1, 1, 1, 1,
-1.603651, 0.5128519, -3.584956, 1, 1, 1, 1, 1,
-1.592974, 0.9673525, -0.8510938, 1, 1, 1, 1, 1,
-1.572743, -0.3515804, 0.93595, 1, 1, 1, 1, 1,
-1.572684, -1.530802, -3.100513, 1, 1, 1, 1, 1,
-1.563622, 0.6412201, -1.046191, 1, 1, 1, 1, 1,
-1.562804, 0.7074847, -1.213109, 0, 0, 1, 1, 1,
-1.560511, -0.394315, -2.16923, 1, 0, 0, 1, 1,
-1.549931, 1.075488, 1.065692, 1, 0, 0, 1, 1,
-1.541399, 1.231433, -0.5029499, 1, 0, 0, 1, 1,
-1.533901, 0.4557613, -2.521729, 1, 0, 0, 1, 1,
-1.530065, 1.660394, -0.508939, 1, 0, 0, 1, 1,
-1.52416, 0.8188173, -1.18071, 0, 0, 0, 1, 1,
-1.520869, -1.051779, -1.720416, 0, 0, 0, 1, 1,
-1.496036, 0.2965606, 0.2636608, 0, 0, 0, 1, 1,
-1.486044, 0.7121612, -0.5196055, 0, 0, 0, 1, 1,
-1.479753, -1.182764, -1.250374, 0, 0, 0, 1, 1,
-1.474547, 0.1264878, -0.01432527, 0, 0, 0, 1, 1,
-1.474134, -1.157804, -1.677265, 0, 0, 0, 1, 1,
-1.470982, 0.1839124, -0.5216729, 1, 1, 1, 1, 1,
-1.467124, 1.925014, -1.254059, 1, 1, 1, 1, 1,
-1.466324, 0.4620103, 0.3122199, 1, 1, 1, 1, 1,
-1.465217, 0.2695947, -2.814776, 1, 1, 1, 1, 1,
-1.461486, 1.080452, -1.730566, 1, 1, 1, 1, 1,
-1.449626, -0.8138219, -2.303256, 1, 1, 1, 1, 1,
-1.443592, -0.05954082, -4.473411, 1, 1, 1, 1, 1,
-1.432491, -0.4548589, -2.724682, 1, 1, 1, 1, 1,
-1.425591, -0.2301155, -2.772359, 1, 1, 1, 1, 1,
-1.421517, 1.580844, -0.7463125, 1, 1, 1, 1, 1,
-1.41877, -0.4807537, -2.881359, 1, 1, 1, 1, 1,
-1.395684, -0.006936059, 0.09722947, 1, 1, 1, 1, 1,
-1.385611, -0.9765105, -2.250921, 1, 1, 1, 1, 1,
-1.373317, -1.188969, -0.6913432, 1, 1, 1, 1, 1,
-1.367427, -2.797862, -2.447865, 1, 1, 1, 1, 1,
-1.364888, -0.2137114, -1.308948, 0, 0, 1, 1, 1,
-1.358993, 0.2053142, -0.9414287, 1, 0, 0, 1, 1,
-1.348326, -0.1485759, -1.263164, 1, 0, 0, 1, 1,
-1.345807, 2.010236, 0.8892152, 1, 0, 0, 1, 1,
-1.337554, 1.169669, -0.8795354, 1, 0, 0, 1, 1,
-1.336265, -0.5857267, -1.427189, 1, 0, 0, 1, 1,
-1.319821, -0.5138839, -4.341102, 0, 0, 0, 1, 1,
-1.303667, 0.3447661, -1.483196, 0, 0, 0, 1, 1,
-1.297795, -0.967629, -1.233919, 0, 0, 0, 1, 1,
-1.288046, 1.981239, -1.553889, 0, 0, 0, 1, 1,
-1.285336, 0.0285277, -1.684773, 0, 0, 0, 1, 1,
-1.278993, 0.1823457, -0.02626202, 0, 0, 0, 1, 1,
-1.2752, 0.8273813, -1.932343, 0, 0, 0, 1, 1,
-1.273109, -0.8640745, -3.662507, 1, 1, 1, 1, 1,
-1.252649, 1.299202, -2.271418, 1, 1, 1, 1, 1,
-1.244501, -0.07752364, -1.562803, 1, 1, 1, 1, 1,
-1.243574, 0.4583513, 0.06800071, 1, 1, 1, 1, 1,
-1.230604, 0.1666245, -1.812352, 1, 1, 1, 1, 1,
-1.222592, -0.3843223, -1.289652, 1, 1, 1, 1, 1,
-1.214405, -0.3687538, -1.744419, 1, 1, 1, 1, 1,
-1.213755, 0.9035128, -2.582721, 1, 1, 1, 1, 1,
-1.208855, 0.8539517, -1.608081, 1, 1, 1, 1, 1,
-1.206061, -0.7024723, -2.730035, 1, 1, 1, 1, 1,
-1.20591, -1.338033, -3.451247, 1, 1, 1, 1, 1,
-1.2037, 0.1662091, -0.5218371, 1, 1, 1, 1, 1,
-1.199279, 0.6967762, -1.537348, 1, 1, 1, 1, 1,
-1.192306, -0.4902898, -2.186537, 1, 1, 1, 1, 1,
-1.180222, 0.3616595, -0.4080226, 1, 1, 1, 1, 1,
-1.172242, 1.672758, 1.639264, 0, 0, 1, 1, 1,
-1.16803, 0.5085918, -1.867887, 1, 0, 0, 1, 1,
-1.164279, -0.3293719, -1.273319, 1, 0, 0, 1, 1,
-1.158294, 0.3300769, -1.332315, 1, 0, 0, 1, 1,
-1.158025, 0.05783847, -2.212259, 1, 0, 0, 1, 1,
-1.157112, -0.909816, -1.382627, 1, 0, 0, 1, 1,
-1.150007, -0.09534958, -0.5097322, 0, 0, 0, 1, 1,
-1.148828, -0.7079903, -1.399802, 0, 0, 0, 1, 1,
-1.131784, -0.5407932, -1.993459, 0, 0, 0, 1, 1,
-1.124336, 0.6347879, -0.5741343, 0, 0, 0, 1, 1,
-1.122477, 0.2599373, 0.04671161, 0, 0, 0, 1, 1,
-1.115285, 1.50999, 0.9717891, 0, 0, 0, 1, 1,
-1.111689, 0.1256133, -2.34067, 0, 0, 0, 1, 1,
-1.110003, -0.3353007, -3.256384, 1, 1, 1, 1, 1,
-1.107666, 1.170427, 0.09419771, 1, 1, 1, 1, 1,
-1.100064, 0.6949913, -0.592916, 1, 1, 1, 1, 1,
-1.097586, -0.7284653, -1.678948, 1, 1, 1, 1, 1,
-1.097203, 0.2659587, -1.222279, 1, 1, 1, 1, 1,
-1.077843, 0.6192783, -0.5282793, 1, 1, 1, 1, 1,
-1.069441, 0.2204089, -1.055633, 1, 1, 1, 1, 1,
-1.063906, 1.871059, -1.017385, 1, 1, 1, 1, 1,
-1.058287, -1.268363, -2.588268, 1, 1, 1, 1, 1,
-1.041195, 0.2855704, -2.146975, 1, 1, 1, 1, 1,
-1.039288, 1.276813, -0.5640207, 1, 1, 1, 1, 1,
-1.036224, 0.5281261, -2.610466, 1, 1, 1, 1, 1,
-1.019578, -1.332214, -0.6061558, 1, 1, 1, 1, 1,
-1.017219, 1.950117, 0.03670905, 1, 1, 1, 1, 1,
-1.008373, -1.228187, -2.031363, 1, 1, 1, 1, 1,
-1.008244, -0.4753743, -3.157605, 0, 0, 1, 1, 1,
-1.005295, -0.5523205, -2.522324, 1, 0, 0, 1, 1,
-0.9951522, 1.403637, -1.281704, 1, 0, 0, 1, 1,
-0.9944178, -0.6405825, -1.415886, 1, 0, 0, 1, 1,
-0.9918036, 0.67585, -0.17621, 1, 0, 0, 1, 1,
-0.9855923, 0.2568067, -2.27339, 1, 0, 0, 1, 1,
-0.98056, 0.7169412, -1.166616, 0, 0, 0, 1, 1,
-0.9785199, -1.327896, -3.22702, 0, 0, 0, 1, 1,
-0.9717057, 0.3837419, -1.287409, 0, 0, 0, 1, 1,
-0.9593738, 0.3851789, -0.07960156, 0, 0, 0, 1, 1,
-0.9582144, 1.910863, 0.8510923, 0, 0, 0, 1, 1,
-0.9579156, 0.5843176, -2.311656, 0, 0, 0, 1, 1,
-0.9519247, -0.1032845, -0.4312543, 0, 0, 0, 1, 1,
-0.9508869, 0.8544883, -1.819545, 1, 1, 1, 1, 1,
-0.9477833, -0.3991959, -1.500967, 1, 1, 1, 1, 1,
-0.942598, -1.529893, -1.879098, 1, 1, 1, 1, 1,
-0.9404827, -0.5867382, -2.319682, 1, 1, 1, 1, 1,
-0.939259, -0.2749224, -2.512115, 1, 1, 1, 1, 1,
-0.9384928, -0.9364916, -1.810502, 1, 1, 1, 1, 1,
-0.9325339, -1.574832, -3.227404, 1, 1, 1, 1, 1,
-0.9232269, 1.1231, -1.377817, 1, 1, 1, 1, 1,
-0.9226801, 1.009281, -0.09379029, 1, 1, 1, 1, 1,
-0.9188439, -1.987362, -3.42232, 1, 1, 1, 1, 1,
-0.9180382, 0.07066797, -1.748286, 1, 1, 1, 1, 1,
-0.9085003, 0.001944454, -2.696963, 1, 1, 1, 1, 1,
-0.9007611, -0.8887534, -1.356762, 1, 1, 1, 1, 1,
-0.9003111, 0.07959191, -0.3820227, 1, 1, 1, 1, 1,
-0.894308, -1.11204, -3.433662, 1, 1, 1, 1, 1,
-0.888162, 0.2860324, -0.8801233, 0, 0, 1, 1, 1,
-0.8741007, 0.555791, -1.869763, 1, 0, 0, 1, 1,
-0.8687442, 1.922415, -1.006364, 1, 0, 0, 1, 1,
-0.8654366, -0.4609146, -2.360354, 1, 0, 0, 1, 1,
-0.8644447, 0.4897423, -0.5881091, 1, 0, 0, 1, 1,
-0.861409, 2.370653, 0.3632493, 1, 0, 0, 1, 1,
-0.8613173, 0.09752696, -1.144382, 0, 0, 0, 1, 1,
-0.8571414, 0.5773034, -2.83851, 0, 0, 0, 1, 1,
-0.8449217, 2.0963, -0.07884143, 0, 0, 0, 1, 1,
-0.8391917, 0.5374376, -0.7938505, 0, 0, 0, 1, 1,
-0.8285291, 0.9760309, -0.5902655, 0, 0, 0, 1, 1,
-0.8214806, -0.5606466, -1.567232, 0, 0, 0, 1, 1,
-0.8200029, 1.279485, -1.711373, 0, 0, 0, 1, 1,
-0.8191395, 1.585186, -2.129672, 1, 1, 1, 1, 1,
-0.8116106, -0.9009609, -2.543875, 1, 1, 1, 1, 1,
-0.807294, 0.254841, -1.428517, 1, 1, 1, 1, 1,
-0.8054824, 0.7368765, -0.523545, 1, 1, 1, 1, 1,
-0.801962, -1.323598, -2.705169, 1, 1, 1, 1, 1,
-0.7912929, 0.6557993, -1.535814, 1, 1, 1, 1, 1,
-0.7868139, 1.99253, -1.813138, 1, 1, 1, 1, 1,
-0.7855691, -0.277717, -3.194428, 1, 1, 1, 1, 1,
-0.7808986, 0.7095057, -1.515615, 1, 1, 1, 1, 1,
-0.7755, 0.07209007, -0.5144427, 1, 1, 1, 1, 1,
-0.7711986, 0.5118637, -1.365445, 1, 1, 1, 1, 1,
-0.7621176, 1.998664, 0.7243581, 1, 1, 1, 1, 1,
-0.7619323, 0.9569421, -1.282625, 1, 1, 1, 1, 1,
-0.7575127, -0.2056, -4.197718, 1, 1, 1, 1, 1,
-0.7559748, 0.4104901, -1.721751, 1, 1, 1, 1, 1,
-0.7529981, -0.05840496, -1.272582, 0, 0, 1, 1, 1,
-0.74424, 1.210094, -1.555245, 1, 0, 0, 1, 1,
-0.7432175, -0.4209609, -0.5157036, 1, 0, 0, 1, 1,
-0.7405263, 1.980044, -0.8681063, 1, 0, 0, 1, 1,
-0.7391407, -0.7773316, -1.935011, 1, 0, 0, 1, 1,
-0.7390836, -0.869141, -2.585417, 1, 0, 0, 1, 1,
-0.7356647, -0.5273984, -1.283897, 0, 0, 0, 1, 1,
-0.7356238, 0.9054574, -1.304947, 0, 0, 0, 1, 1,
-0.7316517, -0.8618158, -2.341311, 0, 0, 0, 1, 1,
-0.7312158, 0.7914264, 0.2972647, 0, 0, 0, 1, 1,
-0.7276925, -0.6403089, -2.19024, 0, 0, 0, 1, 1,
-0.7212686, 0.1731121, -1.055082, 0, 0, 0, 1, 1,
-0.7207009, 0.478262, -0.8914949, 0, 0, 0, 1, 1,
-0.7192992, 0.8177921, -1.78781, 1, 1, 1, 1, 1,
-0.7169523, -0.1649301, -0.03054175, 1, 1, 1, 1, 1,
-0.7141477, -1.105658, -1.920169, 1, 1, 1, 1, 1,
-0.6938973, -0.9951069, -1.514065, 1, 1, 1, 1, 1,
-0.6897509, -0.4060514, -2.783297, 1, 1, 1, 1, 1,
-0.6825634, -1.178926, -2.06512, 1, 1, 1, 1, 1,
-0.6822912, 0.7542231, 0.1806016, 1, 1, 1, 1, 1,
-0.682121, -0.8003459, -1.671289, 1, 1, 1, 1, 1,
-0.6818892, 1.061439, -1.944456, 1, 1, 1, 1, 1,
-0.6797773, 2.269926, -0.6345707, 1, 1, 1, 1, 1,
-0.668188, -0.9105431, -4.319471, 1, 1, 1, 1, 1,
-0.6670639, 1.1236, 0.3677835, 1, 1, 1, 1, 1,
-0.6664789, 1.325404, -0.7763366, 1, 1, 1, 1, 1,
-0.6636061, -0.02236299, -0.9138048, 1, 1, 1, 1, 1,
-0.6612332, -0.1555011, -3.206294, 1, 1, 1, 1, 1,
-0.6587462, 0.4111654, 0.4310069, 0, 0, 1, 1, 1,
-0.6582317, 0.2675515, -1.711567, 1, 0, 0, 1, 1,
-0.6541098, 0.08361489, -0.4421203, 1, 0, 0, 1, 1,
-0.643526, -1.137964, -3.183445, 1, 0, 0, 1, 1,
-0.6428346, -1.555888, -2.048264, 1, 0, 0, 1, 1,
-0.6383878, -0.6159216, -2.69442, 1, 0, 0, 1, 1,
-0.6382092, 0.2552463, -1.802375, 0, 0, 0, 1, 1,
-0.6374931, -0.5641649, -1.377086, 0, 0, 0, 1, 1,
-0.6365113, 1.560629, -0.4453918, 0, 0, 0, 1, 1,
-0.6361112, 0.2561147, 1.41987, 0, 0, 0, 1, 1,
-0.6344349, -0.8662423, -4.201849, 0, 0, 0, 1, 1,
-0.634174, -0.6761578, -1.904664, 0, 0, 0, 1, 1,
-0.6332515, 0.5721616, -2.705024, 0, 0, 0, 1, 1,
-0.6313975, 0.7514983, -1.045491, 1, 1, 1, 1, 1,
-0.6292322, -1.166573, -3.30571, 1, 1, 1, 1, 1,
-0.6256419, -0.2170497, -0.5337042, 1, 1, 1, 1, 1,
-0.6245669, 0.2743766, -0.4312736, 1, 1, 1, 1, 1,
-0.6177964, 0.9218436, -0.3531273, 1, 1, 1, 1, 1,
-0.6151302, 0.6787037, 1.019141, 1, 1, 1, 1, 1,
-0.6064245, -0.7957839, -1.289831, 1, 1, 1, 1, 1,
-0.6052794, -2.283313, -3.400595, 1, 1, 1, 1, 1,
-0.6020126, -0.2210895, -1.914508, 1, 1, 1, 1, 1,
-0.6007509, -1.105669, -0.7851427, 1, 1, 1, 1, 1,
-0.5960993, -2.036099, -2.842549, 1, 1, 1, 1, 1,
-0.5959734, 0.961782, -0.7578559, 1, 1, 1, 1, 1,
-0.5951353, -0.7596257, -0.7087272, 1, 1, 1, 1, 1,
-0.5947321, 1.927116, -0.9186005, 1, 1, 1, 1, 1,
-0.5907622, -0.07015426, -1.115665, 1, 1, 1, 1, 1,
-0.5907142, 0.7895231, -0.9094629, 0, 0, 1, 1, 1,
-0.5896739, 0.09067755, -0.6630677, 1, 0, 0, 1, 1,
-0.5880988, -0.5640119, -2.917341, 1, 0, 0, 1, 1,
-0.5848725, 0.5036196, -0.6241024, 1, 0, 0, 1, 1,
-0.5848562, 0.5097011, -2.005766, 1, 0, 0, 1, 1,
-0.5786928, -0.1360608, -0.482902, 1, 0, 0, 1, 1,
-0.5784076, -0.9672874, -0.6244124, 0, 0, 0, 1, 1,
-0.5769921, 0.6360905, -1.157631, 0, 0, 0, 1, 1,
-0.5766957, 0.2624289, -1.25931, 0, 0, 0, 1, 1,
-0.5747451, 1.113679, 0.1549316, 0, 0, 0, 1, 1,
-0.5745741, -1.557894, -1.106937, 0, 0, 0, 1, 1,
-0.5720501, -0.6200601, -2.353951, 0, 0, 0, 1, 1,
-0.5715551, -0.5240484, -1.425044, 0, 0, 0, 1, 1,
-0.5622104, 0.1554193, -1.448588, 1, 1, 1, 1, 1,
-0.5608258, 0.6452177, -0.5124726, 1, 1, 1, 1, 1,
-0.5575383, 0.5164545, -0.2836333, 1, 1, 1, 1, 1,
-0.5554792, 0.6599768, 0.08675275, 1, 1, 1, 1, 1,
-0.5487396, -1.511953, -1.926695, 1, 1, 1, 1, 1,
-0.5485094, -0.7592463, -2.620706, 1, 1, 1, 1, 1,
-0.541584, -0.8317163, -2.02535, 1, 1, 1, 1, 1,
-0.528744, 0.1647013, -1.391243, 1, 1, 1, 1, 1,
-0.5277134, 1.378718, 0.2561715, 1, 1, 1, 1, 1,
-0.5275093, -1.803997, -2.874505, 1, 1, 1, 1, 1,
-0.5249128, -0.6253261, -3.460793, 1, 1, 1, 1, 1,
-0.5238758, 0.769259, -0.372334, 1, 1, 1, 1, 1,
-0.5151529, -1.339861, -2.382436, 1, 1, 1, 1, 1,
-0.5150949, 1.396077, -1.093004, 1, 1, 1, 1, 1,
-0.5119579, 0.7895656, -0.6416256, 1, 1, 1, 1, 1,
-0.492318, 0.04120172, -1.092691, 0, 0, 1, 1, 1,
-0.4890315, 1.106371, -1.786382, 1, 0, 0, 1, 1,
-0.4848652, -0.02709318, -0.377322, 1, 0, 0, 1, 1,
-0.484667, 0.04313194, -2.142009, 1, 0, 0, 1, 1,
-0.4699272, -0.7187093, -2.754623, 1, 0, 0, 1, 1,
-0.4688795, 0.6507601, -1.657631, 1, 0, 0, 1, 1,
-0.4671326, -0.1614133, -1.230384, 0, 0, 0, 1, 1,
-0.4648278, 0.9867294, -1.552143, 0, 0, 0, 1, 1,
-0.4611673, -0.3370428, -2.402574, 0, 0, 0, 1, 1,
-0.4607406, -0.3607778, -1.098331, 0, 0, 0, 1, 1,
-0.4603795, 0.7638679, -0.6421034, 0, 0, 0, 1, 1,
-0.4603601, 0.7865909, -1.580155, 0, 0, 0, 1, 1,
-0.4507317, -0.3595728, -1.140119, 0, 0, 0, 1, 1,
-0.439849, -0.1919173, -2.932189, 1, 1, 1, 1, 1,
-0.4305243, 0.1697819, -1.080729, 1, 1, 1, 1, 1,
-0.4300137, 0.4282818, -0.4915573, 1, 1, 1, 1, 1,
-0.4237306, -1.639925, -4.528932, 1, 1, 1, 1, 1,
-0.421762, -1.688394, -3.110182, 1, 1, 1, 1, 1,
-0.4211682, -0.672092, -1.395512, 1, 1, 1, 1, 1,
-0.4198361, 1.828498, -0.4916557, 1, 1, 1, 1, 1,
-0.4158529, 0.1200031, -1.529366, 1, 1, 1, 1, 1,
-0.412691, 0.2810387, -2.135785, 1, 1, 1, 1, 1,
-0.4124325, 0.9466923, -0.2445541, 1, 1, 1, 1, 1,
-0.4110285, -0.2259847, -2.243581, 1, 1, 1, 1, 1,
-0.3991485, -1.624925, -2.337174, 1, 1, 1, 1, 1,
-0.3970637, -0.8466604, -1.473015, 1, 1, 1, 1, 1,
-0.3962356, -0.8666243, -2.887294, 1, 1, 1, 1, 1,
-0.3955176, -0.2629721, -2.479792, 1, 1, 1, 1, 1,
-0.3898319, -0.372027, -1.832176, 0, 0, 1, 1, 1,
-0.3883298, 0.1931663, -0.3487125, 1, 0, 0, 1, 1,
-0.3880886, 0.7045059, -0.2838595, 1, 0, 0, 1, 1,
-0.3850389, -0.1968701, -1.145141, 1, 0, 0, 1, 1,
-0.3839631, 1.007569, -0.3926655, 1, 0, 0, 1, 1,
-0.3815439, -0.1950923, -2.050544, 1, 0, 0, 1, 1,
-0.3811723, 1.632297, -2.241647, 0, 0, 0, 1, 1,
-0.3741435, -0.8021656, -2.4748, 0, 0, 0, 1, 1,
-0.3701701, -2.142688, -1.139282, 0, 0, 0, 1, 1,
-0.3694941, -0.1313433, -1.294833, 0, 0, 0, 1, 1,
-0.3652345, -0.4404571, -1.087529, 0, 0, 0, 1, 1,
-0.362885, 0.4849125, -0.8930717, 0, 0, 0, 1, 1,
-0.3611896, 1.316033, -1.1002, 0, 0, 0, 1, 1,
-0.3610657, 1.486163, -0.9029356, 1, 1, 1, 1, 1,
-0.3581358, 1.678165, 0.7361239, 1, 1, 1, 1, 1,
-0.3568971, -0.1663718, -1.834401, 1, 1, 1, 1, 1,
-0.3554294, 1.555339, 1.236933, 1, 1, 1, 1, 1,
-0.3551957, -0.04066833, -0.2552457, 1, 1, 1, 1, 1,
-0.3511386, -1.532154, -3.53784, 1, 1, 1, 1, 1,
-0.3507962, -0.02989664, -1.184968, 1, 1, 1, 1, 1,
-0.3507303, 0.242339, -1.29073, 1, 1, 1, 1, 1,
-0.3499326, 0.6439146, 1.3163, 1, 1, 1, 1, 1,
-0.3494831, 0.1626284, -0.8349415, 1, 1, 1, 1, 1,
-0.34941, -0.2765146, -3.082403, 1, 1, 1, 1, 1,
-0.3473882, -2.630314, -2.326343, 1, 1, 1, 1, 1,
-0.3331241, -0.1236142, -1.417927, 1, 1, 1, 1, 1,
-0.3304067, 0.8152948, -0.224591, 1, 1, 1, 1, 1,
-0.3244019, 0.5224143, 0.508332, 1, 1, 1, 1, 1,
-0.3210966, 0.5274503, 0.1705288, 0, 0, 1, 1, 1,
-0.3205431, -0.2393975, -3.397716, 1, 0, 0, 1, 1,
-0.3191371, 0.5923057, 0.1122927, 1, 0, 0, 1, 1,
-0.3183397, 0.6006953, -0.5564774, 1, 0, 0, 1, 1,
-0.3179113, -1.109137, -3.150931, 1, 0, 0, 1, 1,
-0.3162021, 0.1433992, -2.941842, 1, 0, 0, 1, 1,
-0.3152134, 1.50552, -0.5458134, 0, 0, 0, 1, 1,
-0.3097978, 0.4877908, -0.5195973, 0, 0, 0, 1, 1,
-0.3097244, 0.4697802, -1.883511, 0, 0, 0, 1, 1,
-0.3095252, 0.2815981, -1.058631, 0, 0, 0, 1, 1,
-0.3083596, 0.2399523, -0.9019682, 0, 0, 0, 1, 1,
-0.3082629, 0.159847, 0.1278121, 0, 0, 0, 1, 1,
-0.3047707, 0.5933219, 0.1193822, 0, 0, 0, 1, 1,
-0.3035126, 0.09294586, -1.900026, 1, 1, 1, 1, 1,
-0.2946217, -0.4251087, -2.782645, 1, 1, 1, 1, 1,
-0.2946187, 0.3948964, 0.1152589, 1, 1, 1, 1, 1,
-0.2828513, -0.8206183, -2.712995, 1, 1, 1, 1, 1,
-0.2827928, -0.2253894, -1.438386, 1, 1, 1, 1, 1,
-0.2807232, -0.4728707, -2.271175, 1, 1, 1, 1, 1,
-0.2781779, -0.62595, -2.262362, 1, 1, 1, 1, 1,
-0.2773326, 0.278807, -0.4091803, 1, 1, 1, 1, 1,
-0.2735707, 0.9568445, 1.201054, 1, 1, 1, 1, 1,
-0.272404, -0.4685792, -3.916041, 1, 1, 1, 1, 1,
-0.2704853, 0.1428541, -2.105939, 1, 1, 1, 1, 1,
-0.2698724, -0.01021832, -1.193211, 1, 1, 1, 1, 1,
-0.2676689, 1.695327, -1.749246, 1, 1, 1, 1, 1,
-0.2652851, 0.7544613, 1.035155, 1, 1, 1, 1, 1,
-0.2631705, 0.8812963, -1.33837, 1, 1, 1, 1, 1,
-0.2621676, -1.579879, -1.347438, 0, 0, 1, 1, 1,
-0.2610547, 0.2388436, -0.9481117, 1, 0, 0, 1, 1,
-0.2529641, -0.7872274, -2.581185, 1, 0, 0, 1, 1,
-0.2528982, -0.3499587, -0.7691613, 1, 0, 0, 1, 1,
-0.2501412, -0.09722223, -2.222649, 1, 0, 0, 1, 1,
-0.2480584, -0.5341441, -0.9145039, 1, 0, 0, 1, 1,
-0.2457429, 1.776282, -0.5398795, 0, 0, 0, 1, 1,
-0.2454518, 0.3731621, -0.5467819, 0, 0, 0, 1, 1,
-0.2433344, 1.663377, -0.2503433, 0, 0, 0, 1, 1,
-0.2404096, -0.1749621, -2.094686, 0, 0, 0, 1, 1,
-0.2385335, -0.119058, -1.962168, 0, 0, 0, 1, 1,
-0.2361602, -0.1447551, -1.639082, 0, 0, 0, 1, 1,
-0.2354561, -0.4859667, -4.056145, 0, 0, 0, 1, 1,
-0.2349024, 1.576524, -0.4822248, 1, 1, 1, 1, 1,
-0.2347968, 1.807063, -0.3904687, 1, 1, 1, 1, 1,
-0.230872, -1.65209, -3.32146, 1, 1, 1, 1, 1,
-0.2305455, 0.05836298, -1.800576, 1, 1, 1, 1, 1,
-0.2269926, 1.608703, -0.8342866, 1, 1, 1, 1, 1,
-0.2211632, -1.180865, -2.297182, 1, 1, 1, 1, 1,
-0.2205453, -1.814137, -3.830054, 1, 1, 1, 1, 1,
-0.2183169, -1.239915, -3.716455, 1, 1, 1, 1, 1,
-0.2161968, 0.5865668, 0.04378929, 1, 1, 1, 1, 1,
-0.2152956, 0.2011946, -1.281952, 1, 1, 1, 1, 1,
-0.2147465, 1.254086, -0.3385064, 1, 1, 1, 1, 1,
-0.2125758, -0.4410516, -3.674657, 1, 1, 1, 1, 1,
-0.2069333, -0.7799388, -3.554297, 1, 1, 1, 1, 1,
-0.2066867, -1.284026, -3.892682, 1, 1, 1, 1, 1,
-0.2052467, -0.2324431, -2.050084, 1, 1, 1, 1, 1,
-0.2025138, 1.491838, 0.2266156, 0, 0, 1, 1, 1,
-0.2020794, -0.6189933, -1.734505, 1, 0, 0, 1, 1,
-0.2013929, -0.8084509, -5.217393, 1, 0, 0, 1, 1,
-0.2009418, -1.517826, -3.570983, 1, 0, 0, 1, 1,
-0.1995006, 0.6146407, 0.1602584, 1, 0, 0, 1, 1,
-0.1933166, 0.02621201, -0.0513537, 1, 0, 0, 1, 1,
-0.1926616, 1.131216, -1.667702, 0, 0, 0, 1, 1,
-0.1920077, 0.3767265, -0.5377384, 0, 0, 0, 1, 1,
-0.1904274, 0.3280596, -0.9547789, 0, 0, 0, 1, 1,
-0.1827941, 0.7719004, 0.8532411, 0, 0, 0, 1, 1,
-0.1801905, 0.7678746, -1.223513, 0, 0, 0, 1, 1,
-0.1761362, -2.609433, -3.383539, 0, 0, 0, 1, 1,
-0.1752779, 0.1730459, -0.7532578, 0, 0, 0, 1, 1,
-0.1750592, 0.7131989, 0.7250096, 1, 1, 1, 1, 1,
-0.1733246, -1.392888, -2.743615, 1, 1, 1, 1, 1,
-0.1733142, -0.3674505, -1.52539, 1, 1, 1, 1, 1,
-0.1716081, -0.3439626, -5.603244, 1, 1, 1, 1, 1,
-0.1700214, -0.3842063, -5.314434, 1, 1, 1, 1, 1,
-0.1666545, 1.660787, 0.2791175, 1, 1, 1, 1, 1,
-0.1622157, -0.007585873, -3.691431, 1, 1, 1, 1, 1,
-0.1621874, -0.4920312, -2.235615, 1, 1, 1, 1, 1,
-0.1599338, -0.2146885, -1.142556, 1, 1, 1, 1, 1,
-0.1570343, 0.2680147, -1.784649, 1, 1, 1, 1, 1,
-0.1569801, 0.1934929, -1.496127, 1, 1, 1, 1, 1,
-0.1547133, -0.7215505, -3.123685, 1, 1, 1, 1, 1,
-0.1536055, -0.08484667, -1.314934, 1, 1, 1, 1, 1,
-0.1511846, -0.02787101, -1.659879, 1, 1, 1, 1, 1,
-0.1468183, 1.104297, -2.179733, 1, 1, 1, 1, 1,
-0.1452, -0.6723204, -3.258087, 0, 0, 1, 1, 1,
-0.1438794, 0.75406, -1.515777, 1, 0, 0, 1, 1,
-0.142624, 0.2282231, -1.211765, 1, 0, 0, 1, 1,
-0.1412637, 0.7385895, 0.646888, 1, 0, 0, 1, 1,
-0.1406295, 1.597125, 0.3863136, 1, 0, 0, 1, 1,
-0.1357499, -0.4007884, -3.407934, 1, 0, 0, 1, 1,
-0.133672, 0.9772794, -0.1159316, 0, 0, 0, 1, 1,
-0.1299607, -0.7756512, -3.711987, 0, 0, 0, 1, 1,
-0.1256767, -1.040343, -2.057746, 0, 0, 0, 1, 1,
-0.1227482, -1.358851, -4.723585, 0, 0, 0, 1, 1,
-0.1180841, 1.499106, 0.1807067, 0, 0, 0, 1, 1,
-0.1150063, -2.152342, -3.03344, 0, 0, 0, 1, 1,
-0.1147648, 0.9815855, 0.4833905, 0, 0, 0, 1, 1,
-0.1125089, 0.6772414, -0.9637761, 1, 1, 1, 1, 1,
-0.1123093, -0.3744274, -3.277065, 1, 1, 1, 1, 1,
-0.1120834, 0.948834, -0.8920006, 1, 1, 1, 1, 1,
-0.1094983, -0.4306605, -3.47912, 1, 1, 1, 1, 1,
-0.1039609, -0.6307424, -6.097106, 1, 1, 1, 1, 1,
-0.1028176, -0.8085778, -3.272679, 1, 1, 1, 1, 1,
-0.09806404, 0.0143577, -0.6714165, 1, 1, 1, 1, 1,
-0.09096288, 0.7127832, -0.2767107, 1, 1, 1, 1, 1,
-0.08287609, 0.8967689, -2.452642, 1, 1, 1, 1, 1,
-0.08223203, -0.2642131, -2.343377, 1, 1, 1, 1, 1,
-0.07606619, 0.5185297, -1.349188, 1, 1, 1, 1, 1,
-0.07605654, 0.167544, -1.05528, 1, 1, 1, 1, 1,
-0.0753224, 0.4190097, 0.07424499, 1, 1, 1, 1, 1,
-0.07148306, 0.2598263, -1.105045, 1, 1, 1, 1, 1,
-0.07075607, 0.7364945, -0.4327456, 1, 1, 1, 1, 1,
-0.06994545, -0.3892734, -2.569592, 0, 0, 1, 1, 1,
-0.06777257, -1.130414, -1.623567, 1, 0, 0, 1, 1,
-0.06640326, 0.159146, -0.3943585, 1, 0, 0, 1, 1,
-0.06634617, 1.815943, 0.8723553, 1, 0, 0, 1, 1,
-0.06449758, -1.351524, -4.462998, 1, 0, 0, 1, 1,
-0.06326072, 0.02210468, -1.53545, 1, 0, 0, 1, 1,
-0.0612903, -0.7106743, -3.590397, 0, 0, 0, 1, 1,
-0.06098197, -0.9932361, -1.340423, 0, 0, 0, 1, 1,
-0.05696646, -0.07193109, -3.184201, 0, 0, 0, 1, 1,
-0.05616445, -0.3748059, -3.101148, 0, 0, 0, 1, 1,
-0.05472361, 1.216935, 0.4606389, 0, 0, 0, 1, 1,
-0.05257368, 0.2569541, -0.2355499, 0, 0, 0, 1, 1,
-0.04938412, -0.752524, -3.237144, 0, 0, 0, 1, 1,
-0.03734405, 0.4193818, -0.4249457, 1, 1, 1, 1, 1,
-0.03697057, -0.323911, -5.066506, 1, 1, 1, 1, 1,
-0.03521596, 0.9010423, -2.365735, 1, 1, 1, 1, 1,
-0.02834824, -0.549982, -4.873408, 1, 1, 1, 1, 1,
-0.02636238, -0.5545365, -3.128851, 1, 1, 1, 1, 1,
-0.01272129, 1.281781, -1.02148, 1, 1, 1, 1, 1,
-0.01177181, 0.08878961, -0.6065711, 1, 1, 1, 1, 1,
-0.01042047, 0.5357111, -1.07927, 1, 1, 1, 1, 1,
-0.008603608, 1.918104, 1.34722, 1, 1, 1, 1, 1,
-0.008032636, 0.0126344, 1.757461, 1, 1, 1, 1, 1,
-0.003711466, 0.3394013, -0.3032592, 1, 1, 1, 1, 1,
-0.002915984, -0.4067715, -4.937231, 1, 1, 1, 1, 1,
-0.001416139, -0.2258177, -3.356729, 1, 1, 1, 1, 1,
0.002702425, -0.5394045, 2.991745, 1, 1, 1, 1, 1,
0.00362435, 0.2566358, -0.7727423, 1, 1, 1, 1, 1,
0.005492805, -1.99362, 2.137354, 0, 0, 1, 1, 1,
0.009158344, -1.771793, 3.573544, 1, 0, 0, 1, 1,
0.01048733, -0.1927376, 1.703693, 1, 0, 0, 1, 1,
0.0107034, -0.2810548, 4.294782, 1, 0, 0, 1, 1,
0.01151549, -0.7233064, 2.113962, 1, 0, 0, 1, 1,
0.01244424, 0.4402931, -0.2318872, 1, 0, 0, 1, 1,
0.01404301, 0.2570328, -0.2529057, 0, 0, 0, 1, 1,
0.01547633, -0.1842543, 2.931161, 0, 0, 0, 1, 1,
0.01758803, -0.5930262, 3.130474, 0, 0, 0, 1, 1,
0.02545468, 0.08616151, 1.818133, 0, 0, 0, 1, 1,
0.02625918, 1.62232, 0.9099588, 0, 0, 0, 1, 1,
0.0293918, -0.3943201, 2.917711, 0, 0, 0, 1, 1,
0.0300092, 0.5610243, 1.641778, 0, 0, 0, 1, 1,
0.03257279, 0.7507156, 0.7523624, 1, 1, 1, 1, 1,
0.03734108, -0.9946179, 1.586941, 1, 1, 1, 1, 1,
0.04081054, -1.264629, 4.208704, 1, 1, 1, 1, 1,
0.04648898, -0.9275371, 4.09655, 1, 1, 1, 1, 1,
0.04686315, 1.904054, 0.6508536, 1, 1, 1, 1, 1,
0.05058907, 0.5807194, 0.7289355, 1, 1, 1, 1, 1,
0.05089189, -0.09471332, 4.089134, 1, 1, 1, 1, 1,
0.05302744, -0.2425788, 2.353133, 1, 1, 1, 1, 1,
0.05322412, 0.7606105, -0.1970835, 1, 1, 1, 1, 1,
0.05427025, 0.508003, -1.396239, 1, 1, 1, 1, 1,
0.06348018, -1.657132, 4.821908, 1, 1, 1, 1, 1,
0.065283, -1.091516, 2.45672, 1, 1, 1, 1, 1,
0.06559968, -0.02226391, 1.845432, 1, 1, 1, 1, 1,
0.06659199, 0.5837784, 1.075554, 1, 1, 1, 1, 1,
0.07050903, 1.440998, 0.3614284, 1, 1, 1, 1, 1,
0.07115338, 0.02054127, 2.669014, 0, 0, 1, 1, 1,
0.07416655, 0.5461992, 0.2524225, 1, 0, 0, 1, 1,
0.07505538, 2.780084, -0.1036994, 1, 0, 0, 1, 1,
0.0810632, -1.069224, 3.807829, 1, 0, 0, 1, 1,
0.08212642, -0.6720702, 1.506299, 1, 0, 0, 1, 1,
0.08302129, 1.971325, -1.777502, 1, 0, 0, 1, 1,
0.08687274, 0.3984569, -1.183749, 0, 0, 0, 1, 1,
0.0871494, -0.6834376, 2.218968, 0, 0, 0, 1, 1,
0.09018937, -1.534345, 2.138309, 0, 0, 0, 1, 1,
0.09034793, 0.2409834, 0.5804312, 0, 0, 0, 1, 1,
0.09415496, 0.7190375, 0.9101, 0, 0, 0, 1, 1,
0.1003191, -1.197694, 3.395526, 0, 0, 0, 1, 1,
0.1021124, -0.8757481, 3.20679, 0, 0, 0, 1, 1,
0.1043403, -0.4433604, 3.744288, 1, 1, 1, 1, 1,
0.1138104, -1.462601, 4.198721, 1, 1, 1, 1, 1,
0.118338, 0.1535843, 1.034804, 1, 1, 1, 1, 1,
0.120015, -0.5551471, 2.707448, 1, 1, 1, 1, 1,
0.1207866, -1.125561, 3.743815, 1, 1, 1, 1, 1,
0.1210447, 0.4231566, -0.5295095, 1, 1, 1, 1, 1,
0.1218205, -0.7843832, 3.98763, 1, 1, 1, 1, 1,
0.1226773, 0.4530575, -1.251614, 1, 1, 1, 1, 1,
0.1235051, -0.5549713, 2.910913, 1, 1, 1, 1, 1,
0.1266563, 1.225672, -1.063287, 1, 1, 1, 1, 1,
0.1279188, -0.5509408, 3.310118, 1, 1, 1, 1, 1,
0.1305534, 0.031438, 0.7852986, 1, 1, 1, 1, 1,
0.1312431, 0.1377178, 1.514923, 1, 1, 1, 1, 1,
0.1331793, -0.6020349, 3.949852, 1, 1, 1, 1, 1,
0.1337567, -0.1131995, 2.858733, 1, 1, 1, 1, 1,
0.1391804, 0.0875499, 1.833982, 0, 0, 1, 1, 1,
0.1493415, -2.382895, 2.703249, 1, 0, 0, 1, 1,
0.1541423, 2.210768, -0.4847922, 1, 0, 0, 1, 1,
0.1578492, 1.588071, 2.203647, 1, 0, 0, 1, 1,
0.1604856, 0.1288246, -0.3004479, 1, 0, 0, 1, 1,
0.16435, 1.790405, 2.101894, 1, 0, 0, 1, 1,
0.1650713, 0.2531166, 1.613142, 0, 0, 0, 1, 1,
0.1727205, 1.75143, 0.8167721, 0, 0, 0, 1, 1,
0.1735695, -0.5128803, 3.526834, 0, 0, 0, 1, 1,
0.1741611, 1.432052, -0.3172899, 0, 0, 0, 1, 1,
0.1775665, -1.314187, 4.211808, 0, 0, 0, 1, 1,
0.1788416, -1.164654, 2.375556, 0, 0, 0, 1, 1,
0.1821623, -0.03286078, 1.377914, 0, 0, 0, 1, 1,
0.1841817, 1.432436, -1.46554, 1, 1, 1, 1, 1,
0.1844277, 0.7990612, 0.4936999, 1, 1, 1, 1, 1,
0.188572, 0.2808114, 0.665875, 1, 1, 1, 1, 1,
0.1892921, -0.2732442, 2.748259, 1, 1, 1, 1, 1,
0.1910231, 0.3026526, 0.2796289, 1, 1, 1, 1, 1,
0.1916878, 0.6550593, 1.999571, 1, 1, 1, 1, 1,
0.1926778, -0.1025453, 3.868353, 1, 1, 1, 1, 1,
0.1929937, -0.5770157, 2.387066, 1, 1, 1, 1, 1,
0.1967285, 0.1986762, 1.179805, 1, 1, 1, 1, 1,
0.199691, -0.8631811, 3.995064, 1, 1, 1, 1, 1,
0.2010938, 0.1191756, 1.295176, 1, 1, 1, 1, 1,
0.2035658, -1.232929, 2.827453, 1, 1, 1, 1, 1,
0.2062806, -0.7323215, 3.499059, 1, 1, 1, 1, 1,
0.2063248, -0.6498674, 4.261432, 1, 1, 1, 1, 1,
0.2128303, 0.5711055, 0.6183082, 1, 1, 1, 1, 1,
0.2146224, -0.4914936, 2.158674, 0, 0, 1, 1, 1,
0.2156348, -0.221719, 0.6590338, 1, 0, 0, 1, 1,
0.2176851, -0.7630095, 4.866941, 1, 0, 0, 1, 1,
0.2197694, 1.178405, 1.020722, 1, 0, 0, 1, 1,
0.2226046, -1.646472, 3.712338, 1, 0, 0, 1, 1,
0.2274564, -0.2495245, 2.993101, 1, 0, 0, 1, 1,
0.2277639, 1.152535, -1.185154, 0, 0, 0, 1, 1,
0.2306606, 0.1622088, 2.989502, 0, 0, 0, 1, 1,
0.2314255, 0.3453572, -0.252857, 0, 0, 0, 1, 1,
0.2338436, 0.8114612, 1.351995, 0, 0, 0, 1, 1,
0.2338975, 0.1015022, 3.257455, 0, 0, 0, 1, 1,
0.24532, 0.100642, 0.5349367, 0, 0, 0, 1, 1,
0.2500286, 0.2809835, 0.9702951, 0, 0, 0, 1, 1,
0.252866, 1.107344, 1.53149, 1, 1, 1, 1, 1,
0.255138, 0.4326749, 1.190494, 1, 1, 1, 1, 1,
0.2559343, -0.7004753, 2.826302, 1, 1, 1, 1, 1,
0.257034, -2.278903, 2.731492, 1, 1, 1, 1, 1,
0.2578963, -0.7768039, 3.007202, 1, 1, 1, 1, 1,
0.2601047, 0.542381, -0.008734873, 1, 1, 1, 1, 1,
0.2610517, -0.870584, 0.9883698, 1, 1, 1, 1, 1,
0.2638685, -0.4889881, 2.298393, 1, 1, 1, 1, 1,
0.2650742, -1.223099, 3.781168, 1, 1, 1, 1, 1,
0.2655402, -0.02705596, 2.53808, 1, 1, 1, 1, 1,
0.2669954, -0.196106, 1.353386, 1, 1, 1, 1, 1,
0.2673357, 0.3572672, 1.434412, 1, 1, 1, 1, 1,
0.2679158, -0.7425582, 2.009561, 1, 1, 1, 1, 1,
0.2692819, -0.3867115, 1.76195, 1, 1, 1, 1, 1,
0.2756373, 0.6466528, 2.216959, 1, 1, 1, 1, 1,
0.2815515, -0.1136165, 2.120312, 0, 0, 1, 1, 1,
0.2816143, -1.052304, 2.60393, 1, 0, 0, 1, 1,
0.2930524, -0.3143899, 1.182099, 1, 0, 0, 1, 1,
0.2944254, 0.9138111, 0.6643455, 1, 0, 0, 1, 1,
0.294677, 2.254214, -0.6821274, 1, 0, 0, 1, 1,
0.2963699, -0.362152, 0.9500762, 1, 0, 0, 1, 1,
0.2994507, 0.3612946, -0.3340807, 0, 0, 0, 1, 1,
0.2999421, -0.5537751, 0.8030763, 0, 0, 0, 1, 1,
0.3011183, 0.372603, 0.7793368, 0, 0, 0, 1, 1,
0.3045057, 0.8836423, -0.1489612, 0, 0, 0, 1, 1,
0.3070545, 0.5128428, 0.8659371, 0, 0, 0, 1, 1,
0.3088042, 0.9338547, 0.9065192, 0, 0, 0, 1, 1,
0.3112974, -0.6510351, 1.774646, 0, 0, 0, 1, 1,
0.313094, -0.6612472, 3.598505, 1, 1, 1, 1, 1,
0.3208446, -0.7329337, 3.193729, 1, 1, 1, 1, 1,
0.3224946, -0.220257, 2.13109, 1, 1, 1, 1, 1,
0.3236254, 1.007014, -0.03427095, 1, 1, 1, 1, 1,
0.3241603, -0.9889567, 3.642308, 1, 1, 1, 1, 1,
0.3302959, -0.5468168, 3.271624, 1, 1, 1, 1, 1,
0.3349655, -0.5305648, 3.965442, 1, 1, 1, 1, 1,
0.3364706, -0.2536268, 0.9788767, 1, 1, 1, 1, 1,
0.3369934, 0.02868837, 1.962586, 1, 1, 1, 1, 1,
0.3416476, 0.3908168, 1.482738, 1, 1, 1, 1, 1,
0.3428185, 0.3838514, 0.1978883, 1, 1, 1, 1, 1,
0.3441656, -0.7994872, 0.7798622, 1, 1, 1, 1, 1,
0.3443577, -0.8734356, 1.296342, 1, 1, 1, 1, 1,
0.3506742, 0.01505999, 2.178252, 1, 1, 1, 1, 1,
0.3523865, -0.04756475, 1.94738, 1, 1, 1, 1, 1,
0.3533554, 0.4880526, 1.226932, 0, 0, 1, 1, 1,
0.3541639, -1.040268, 4.018447, 1, 0, 0, 1, 1,
0.3627462, 0.5684083, 1.665664, 1, 0, 0, 1, 1,
0.3636946, -0.3831936, 2.329667, 1, 0, 0, 1, 1,
0.3648929, -2.23387, 3.741257, 1, 0, 0, 1, 1,
0.3692012, 0.4325874, 2.55131, 1, 0, 0, 1, 1,
0.369237, 0.2105442, 0.4963409, 0, 0, 0, 1, 1,
0.3695857, 1.115494, -0.9191554, 0, 0, 0, 1, 1,
0.3776897, -0.1929168, 3.777175, 0, 0, 0, 1, 1,
0.3795887, -1.885738, 1.778744, 0, 0, 0, 1, 1,
0.3798225, -0.1213693, 1.207469, 0, 0, 0, 1, 1,
0.3810991, 1.306243, -0.05841895, 0, 0, 0, 1, 1,
0.3824541, 1.704514, 0.3284497, 0, 0, 0, 1, 1,
0.3829407, 0.8360999, 0.5844771, 1, 1, 1, 1, 1,
0.3863054, -0.1940481, 3.124842, 1, 1, 1, 1, 1,
0.3911585, -0.9861585, 2.943313, 1, 1, 1, 1, 1,
0.3913782, -0.007881528, 1.971579, 1, 1, 1, 1, 1,
0.3923307, -1.575756, 4.648003, 1, 1, 1, 1, 1,
0.3929345, 0.2656426, 2.840213, 1, 1, 1, 1, 1,
0.3941843, -1.157961, 3.235519, 1, 1, 1, 1, 1,
0.3973588, 0.8415176, 1.796532, 1, 1, 1, 1, 1,
0.3982397, 0.976618, 1.290391, 1, 1, 1, 1, 1,
0.3986514, -0.9356247, 3.973963, 1, 1, 1, 1, 1,
0.4003355, -1.378582, 2.56055, 1, 1, 1, 1, 1,
0.4052215, -1.111908, 2.070994, 1, 1, 1, 1, 1,
0.4070267, 0.4740148, 1.77548, 1, 1, 1, 1, 1,
0.4109378, -0.9996022, 2.659394, 1, 1, 1, 1, 1,
0.4126325, 0.9279684, 0.6068293, 1, 1, 1, 1, 1,
0.4130891, -1.706063, 1.986728, 0, 0, 1, 1, 1,
0.419495, 1.795867, -0.6804783, 1, 0, 0, 1, 1,
0.4205609, -0.08783692, 2.372825, 1, 0, 0, 1, 1,
0.4226639, -2.80798, 3.132882, 1, 0, 0, 1, 1,
0.4246359, -1.917476, 3.314638, 1, 0, 0, 1, 1,
0.4252869, 0.8860697, 1.200202, 1, 0, 0, 1, 1,
0.4269107, -0.2550582, 0.3435873, 0, 0, 0, 1, 1,
0.4328388, -0.6777043, 2.744932, 0, 0, 0, 1, 1,
0.436547, -0.1533635, 1.6213, 0, 0, 0, 1, 1,
0.4377667, -2.416235, 2.862791, 0, 0, 0, 1, 1,
0.4388024, 1.622409, 1.808533, 0, 0, 0, 1, 1,
0.4445185, -0.90469, 2.829587, 0, 0, 0, 1, 1,
0.4504977, 0.3061554, 2.291651, 0, 0, 0, 1, 1,
0.4519133, -0.0255121, 2.019789, 1, 1, 1, 1, 1,
0.4602568, 0.07357913, 2.142913, 1, 1, 1, 1, 1,
0.4686081, -1.107005, 1.822134, 1, 1, 1, 1, 1,
0.4698197, 0.7130758, -0.1143878, 1, 1, 1, 1, 1,
0.4712412, -3.21205, 4.893142, 1, 1, 1, 1, 1,
0.4717375, -0.05969017, 1.49307, 1, 1, 1, 1, 1,
0.4758727, 0.7637728, 1.475987, 1, 1, 1, 1, 1,
0.477527, -1.203733, 2.685627, 1, 1, 1, 1, 1,
0.4798254, 0.7258354, -0.7484068, 1, 1, 1, 1, 1,
0.4832615, 0.5097579, 0.4932019, 1, 1, 1, 1, 1,
0.4857156, 0.3488107, 2.577934, 1, 1, 1, 1, 1,
0.4867567, 0.2542666, 0.6863034, 1, 1, 1, 1, 1,
0.4905368, 0.5430215, 0.7179476, 1, 1, 1, 1, 1,
0.4936058, -0.1213055, 2.393424, 1, 1, 1, 1, 1,
0.4975868, 1.018143, -0.1703255, 1, 1, 1, 1, 1,
0.4997395, 0.49073, 0.5404875, 0, 0, 1, 1, 1,
0.5006572, 0.4441446, 1.067073, 1, 0, 0, 1, 1,
0.5012704, 0.5940558, -0.2654537, 1, 0, 0, 1, 1,
0.5067646, 0.8853077, 2.398277, 1, 0, 0, 1, 1,
0.5075733, -0.1548638, 1.249131, 1, 0, 0, 1, 1,
0.5102527, -2.05178, 1.85937, 1, 0, 0, 1, 1,
0.5124812, 1.133363, 1.074853, 0, 0, 0, 1, 1,
0.5153417, -1.748336, 1.076692, 0, 0, 0, 1, 1,
0.5175132, 2.792404, -0.5184261, 0, 0, 0, 1, 1,
0.5198805, 0.5182156, 0.8064786, 0, 0, 0, 1, 1,
0.5228648, 0.06036104, 2.6396, 0, 0, 0, 1, 1,
0.5237846, 2.602788, 0.8713894, 0, 0, 0, 1, 1,
0.5300483, 0.3771515, -0.07682116, 0, 0, 0, 1, 1,
0.5309161, -0.2380183, 1.458969, 1, 1, 1, 1, 1,
0.5313822, 1.131983, 0.5759388, 1, 1, 1, 1, 1,
0.5436566, -0.4009884, 1.2691, 1, 1, 1, 1, 1,
0.5464631, 2.657732, -0.4668992, 1, 1, 1, 1, 1,
0.5470086, -0.1062061, 1.815229, 1, 1, 1, 1, 1,
0.5472351, -0.4629089, 2.51548, 1, 1, 1, 1, 1,
0.5479048, 0.05994668, 3.307253, 1, 1, 1, 1, 1,
0.5528767, 0.4236061, 0.4965189, 1, 1, 1, 1, 1,
0.5565444, -1.30299, 2.247344, 1, 1, 1, 1, 1,
0.5622531, -0.5111907, 1.563432, 1, 1, 1, 1, 1,
0.5629462, 2.087806, -0.3398154, 1, 1, 1, 1, 1,
0.5676742, -0.7716162, 0.9638631, 1, 1, 1, 1, 1,
0.5678128, 0.192854, -0.02676389, 1, 1, 1, 1, 1,
0.5683329, 0.01466712, 2.518602, 1, 1, 1, 1, 1,
0.5716227, 2.715621, 0.5370525, 1, 1, 1, 1, 1,
0.5718348, -0.01474157, 2.75886, 0, 0, 1, 1, 1,
0.5718452, -1.446314, 2.806278, 1, 0, 0, 1, 1,
0.5725935, -0.5943924, 3.519704, 1, 0, 0, 1, 1,
0.5760626, 0.2703594, 0.4881112, 1, 0, 0, 1, 1,
0.5761018, -0.07407067, 2.004209, 1, 0, 0, 1, 1,
0.5786328, 1.36012, 1.004821, 1, 0, 0, 1, 1,
0.5820606, 1.59007, 0.6187869, 0, 0, 0, 1, 1,
0.5874099, -0.5697549, 2.089657, 0, 0, 0, 1, 1,
0.5911868, -1.363989, 0.8653196, 0, 0, 0, 1, 1,
0.5998936, -0.0767088, 1.449973, 0, 0, 0, 1, 1,
0.6012813, 1.017896, 0.8589408, 0, 0, 0, 1, 1,
0.6015218, 0.1718222, 1.9084, 0, 0, 0, 1, 1,
0.6080756, 0.1378668, 3.69647, 0, 0, 0, 1, 1,
0.6176832, 0.07810837, 0.4991762, 1, 1, 1, 1, 1,
0.6209585, 1.771332, -1.212068, 1, 1, 1, 1, 1,
0.6228635, -0.5403701, 2.527539, 1, 1, 1, 1, 1,
0.6231105, -0.5327412, 1.805408, 1, 1, 1, 1, 1,
0.6247227, -0.8043315, 3.458449, 1, 1, 1, 1, 1,
0.6249195, 1.048723, 2.2379, 1, 1, 1, 1, 1,
0.6287797, -0.3164679, 0.1310204, 1, 1, 1, 1, 1,
0.6388699, -1.163714, 3.167109, 1, 1, 1, 1, 1,
0.641275, -0.02694267, 1.148809, 1, 1, 1, 1, 1,
0.6429392, -0.2495249, 1.83209, 1, 1, 1, 1, 1,
0.6432013, -0.5340804, 0.5172336, 1, 1, 1, 1, 1,
0.6458722, 1.869628, 0.08211441, 1, 1, 1, 1, 1,
0.6476651, -0.05948517, 1.154888, 1, 1, 1, 1, 1,
0.6485454, 0.4818198, 1.358945, 1, 1, 1, 1, 1,
0.6488137, 1.999985, 1.162389, 1, 1, 1, 1, 1,
0.6508875, -1.967225, 2.023277, 0, 0, 1, 1, 1,
0.6585944, -1.048544, 0.5228578, 1, 0, 0, 1, 1,
0.6595967, -1.225039, 2.882455, 1, 0, 0, 1, 1,
0.6633059, 0.4268693, 0.02514598, 1, 0, 0, 1, 1,
0.6649151, 1.538815, -0.415274, 1, 0, 0, 1, 1,
0.6652537, 2.078398, 1.82705, 1, 0, 0, 1, 1,
0.6682554, -0.633269, 3.768283, 0, 0, 0, 1, 1,
0.6771065, -0.326535, 2.519754, 0, 0, 0, 1, 1,
0.67791, 1.251301, 1.007496, 0, 0, 0, 1, 1,
0.6876507, 0.9985025, 0.2899747, 0, 0, 0, 1, 1,
0.6883213, 0.2834286, 2.271932, 0, 0, 0, 1, 1,
0.6913296, 0.2312973, 0.5344542, 0, 0, 0, 1, 1,
0.6917765, -3.266801, 3.20085, 0, 0, 0, 1, 1,
0.6922894, 0.282725, 1.058821, 1, 1, 1, 1, 1,
0.6943466, -2.343614, 2.385062, 1, 1, 1, 1, 1,
0.6979973, -1.068167, 1.010596, 1, 1, 1, 1, 1,
0.6999781, 1.526722, 0.2856917, 1, 1, 1, 1, 1,
0.7023696, -0.5668192, 2.166551, 1, 1, 1, 1, 1,
0.70252, -0.3584712, 1.110341, 1, 1, 1, 1, 1,
0.7025933, 0.09421866, 2.346143, 1, 1, 1, 1, 1,
0.7043265, -0.1868846, 1.027771, 1, 1, 1, 1, 1,
0.7076262, 1.360492, 0.4935636, 1, 1, 1, 1, 1,
0.7113398, 1.110035, 1.187332, 1, 1, 1, 1, 1,
0.7177033, 0.1503737, 2.610278, 1, 1, 1, 1, 1,
0.7190349, -1.235758, 2.567026, 1, 1, 1, 1, 1,
0.7201717, 0.508903, 1.332037, 1, 1, 1, 1, 1,
0.7248425, 0.2750067, 2.284154, 1, 1, 1, 1, 1,
0.729394, -1.427325, 0.7717963, 1, 1, 1, 1, 1,
0.7297119, 2.904433, 0.6424837, 0, 0, 1, 1, 1,
0.7309874, -1.936312, 4.216921, 1, 0, 0, 1, 1,
0.7312379, 0.7428743, 1.83591, 1, 0, 0, 1, 1,
0.7334347, 0.4001054, 1.594133, 1, 0, 0, 1, 1,
0.7367367, 0.1716273, 0.7681671, 1, 0, 0, 1, 1,
0.7404838, -0.9939055, 1.793593, 1, 0, 0, 1, 1,
0.7425662, 0.06293781, 0.6414113, 0, 0, 0, 1, 1,
0.7434939, 0.3305599, 2.275132, 0, 0, 0, 1, 1,
0.746497, 2.53462, 0.3035676, 0, 0, 0, 1, 1,
0.7499154, 0.004723852, 0.3754378, 0, 0, 0, 1, 1,
0.7542229, -0.2760133, 1.137219, 0, 0, 0, 1, 1,
0.7578179, 1.365783, 0.8846163, 0, 0, 0, 1, 1,
0.7645182, 0.8274282, -0.3276817, 0, 0, 0, 1, 1,
0.765413, -0.4065537, 0.6670676, 1, 1, 1, 1, 1,
0.7736952, -1.193263, 2.715521, 1, 1, 1, 1, 1,
0.7749507, -0.6227286, 1.834123, 1, 1, 1, 1, 1,
0.7811801, 1.142681, 0.8045017, 1, 1, 1, 1, 1,
0.7817273, 0.3493791, -0.09252092, 1, 1, 1, 1, 1,
0.7847574, -1.951944, 2.106039, 1, 1, 1, 1, 1,
0.7993371, 0.3008757, 2.453571, 1, 1, 1, 1, 1,
0.800747, 0.4826251, 1.565261, 1, 1, 1, 1, 1,
0.8017247, -0.07098409, 0.8634747, 1, 1, 1, 1, 1,
0.8024146, 0.4949322, 0.9679816, 1, 1, 1, 1, 1,
0.8025227, -1.208816, 1.995085, 1, 1, 1, 1, 1,
0.8076773, -1.85303, 2.26641, 1, 1, 1, 1, 1,
0.8182796, -2.142135, 4.00792, 1, 1, 1, 1, 1,
0.8234459, 2.154194, -1.374992, 1, 1, 1, 1, 1,
0.8238522, 2.653077, 0.2226749, 1, 1, 1, 1, 1,
0.8382698, -0.6954611, 2.080232, 0, 0, 1, 1, 1,
0.8418044, 1.437394, 1.310203, 1, 0, 0, 1, 1,
0.8468722, -1.875603, 4.995545, 1, 0, 0, 1, 1,
0.84806, -1.082822, 2.04043, 1, 0, 0, 1, 1,
0.8493075, -0.01134116, 2.25719, 1, 0, 0, 1, 1,
0.8495752, 0.4295791, 0.3291709, 1, 0, 0, 1, 1,
0.8499159, -0.5364656, 3.336087, 0, 0, 0, 1, 1,
0.8549777, -2.591453, 4.490325, 0, 0, 0, 1, 1,
0.8555967, 0.0007439165, 1.61354, 0, 0, 0, 1, 1,
0.8568359, 1.555621, 2.603979, 0, 0, 0, 1, 1,
0.8569241, 2.147138, 0.04468907, 0, 0, 0, 1, 1,
0.8603339, -0.4716333, 1.308715, 0, 0, 0, 1, 1,
0.8667312, -0.4357461, 0.5623878, 0, 0, 0, 1, 1,
0.8678865, -0.2383568, 2.968282, 1, 1, 1, 1, 1,
0.8698213, 0.8150406, 0.02046531, 1, 1, 1, 1, 1,
0.8739235, -1.039307, 0.632318, 1, 1, 1, 1, 1,
0.8755234, 0.2609138, 1.235256, 1, 1, 1, 1, 1,
0.8760372, 1.137761, -0.3769172, 1, 1, 1, 1, 1,
0.8782721, 0.2181774, 0.5141641, 1, 1, 1, 1, 1,
0.8783102, 0.00699817, 1.634565, 1, 1, 1, 1, 1,
0.880028, 1.004123, 0.4856755, 1, 1, 1, 1, 1,
0.8806663, 1.183856, -0.7115854, 1, 1, 1, 1, 1,
0.8814012, 0.4667175, 1.768247, 1, 1, 1, 1, 1,
0.8834745, 0.2607551, 0.377219, 1, 1, 1, 1, 1,
0.8860849, 1.356835, 0.8729508, 1, 1, 1, 1, 1,
0.8915416, 0.5231222, 1.148564, 1, 1, 1, 1, 1,
0.8919918, 0.5513589, 2.668882, 1, 1, 1, 1, 1,
0.9008982, -1.145344, 1.628115, 1, 1, 1, 1, 1,
0.9062375, -0.436784, 1.181718, 0, 0, 1, 1, 1,
0.9244117, -0.7314394, 2.577867, 1, 0, 0, 1, 1,
0.9282254, -1.289242, 0.7566764, 1, 0, 0, 1, 1,
0.9288771, 0.4992505, 0.4071818, 1, 0, 0, 1, 1,
0.9318662, -0.08142035, 2.106461, 1, 0, 0, 1, 1,
0.9329994, 0.448175, 1.873092, 1, 0, 0, 1, 1,
0.9338032, -0.4960888, 2.632996, 0, 0, 0, 1, 1,
0.9358476, 0.2545742, 1.673586, 0, 0, 0, 1, 1,
0.941343, -1.214865, 3.641411, 0, 0, 0, 1, 1,
0.945521, 0.2321455, 3.190293, 0, 0, 0, 1, 1,
0.9498187, -2.405718, 3.68691, 0, 0, 0, 1, 1,
0.9515139, -0.2619423, 1.098899, 0, 0, 0, 1, 1,
0.9519167, 0.3463437, 0.4761093, 0, 0, 0, 1, 1,
0.955304, -0.7189167, 2.164182, 1, 1, 1, 1, 1,
0.9558698, 0.06792435, 2.92379, 1, 1, 1, 1, 1,
0.9606355, -0.7001632, 1.466094, 1, 1, 1, 1, 1,
0.9617566, 0.3660271, 3.733663, 1, 1, 1, 1, 1,
0.969287, -0.3816154, 1.508639, 1, 1, 1, 1, 1,
0.9741404, 0.9582675, 0.7957134, 1, 1, 1, 1, 1,
0.9792192, 0.7572747, 0.5680948, 1, 1, 1, 1, 1,
0.9818522, -0.5514904, 2.006398, 1, 1, 1, 1, 1,
0.9849372, 0.5571738, 2.194144, 1, 1, 1, 1, 1,
0.9877683, 0.5861306, 2.026963, 1, 1, 1, 1, 1,
0.9894907, 0.5607706, 1.409453, 1, 1, 1, 1, 1,
0.9902058, 2.048469, -1.129737, 1, 1, 1, 1, 1,
0.9967235, -1.816828, 3.266826, 1, 1, 1, 1, 1,
0.9995164, -0.1898627, 2.044834, 1, 1, 1, 1, 1,
1.007897, -0.2372274, -0.1892878, 1, 1, 1, 1, 1,
1.008208, -1.90065, 2.599871, 0, 0, 1, 1, 1,
1.010943, -1.269928, 0.6844818, 1, 0, 0, 1, 1,
1.015825, -1.361833, 1.54671, 1, 0, 0, 1, 1,
1.019108, 0.7821525, 1.479665, 1, 0, 0, 1, 1,
1.019251, 1.645361, 0.7828866, 1, 0, 0, 1, 1,
1.019473, -0.09556273, 1.429792, 1, 0, 0, 1, 1,
1.023379, -1.30459, 3.239565, 0, 0, 0, 1, 1,
1.028594, -1.710271, 2.037953, 0, 0, 0, 1, 1,
1.033404, -0.07409813, 2.888774, 0, 0, 0, 1, 1,
1.033491, 0.743643, 1.495251, 0, 0, 0, 1, 1,
1.036157, 0.7945466, 1.230539, 0, 0, 0, 1, 1,
1.0396, -1.014407, -0.0943592, 0, 0, 0, 1, 1,
1.041943, -1.754687, 3.781783, 0, 0, 0, 1, 1,
1.044876, -0.1574121, 3.514565, 1, 1, 1, 1, 1,
1.047523, -1.515786, 3.281276, 1, 1, 1, 1, 1,
1.056464, -0.2847759, 0.8365644, 1, 1, 1, 1, 1,
1.058167, 1.173367, 1.242409, 1, 1, 1, 1, 1,
1.06516, 0.183748, 1.728649, 1, 1, 1, 1, 1,
1.065524, -2.207484, 0.8343794, 1, 1, 1, 1, 1,
1.068311, 0.2613749, 0.8352449, 1, 1, 1, 1, 1,
1.07528, 0.2810598, 0.826946, 1, 1, 1, 1, 1,
1.087469, 0.4499568, 3.225832, 1, 1, 1, 1, 1,
1.111334, -0.1818396, 2.092944, 1, 1, 1, 1, 1,
1.113661, 0.1562789, 1.330244, 1, 1, 1, 1, 1,
1.116155, 1.313407, 2.353624, 1, 1, 1, 1, 1,
1.119746, -0.6440597, 1.13151, 1, 1, 1, 1, 1,
1.122479, 0.2729418, 1.34606, 1, 1, 1, 1, 1,
1.123822, 0.3622623, 2.139192, 1, 1, 1, 1, 1,
1.129399, 0.2496167, -0.07652351, 0, 0, 1, 1, 1,
1.131395, -1.873688, 2.784655, 1, 0, 0, 1, 1,
1.143234, 1.07459, 1.523511, 1, 0, 0, 1, 1,
1.150793, -0.9250879, 3.185063, 1, 0, 0, 1, 1,
1.151813, 0.3333982, 2.845712, 1, 0, 0, 1, 1,
1.156808, -0.1977998, 1.433466, 1, 0, 0, 1, 1,
1.160438, 0.5587589, 1.882964, 0, 0, 0, 1, 1,
1.162269, 0.3207581, 3.420174, 0, 0, 0, 1, 1,
1.168961, -0.5233071, 2.193182, 0, 0, 0, 1, 1,
1.183721, -0.4210881, 0.307452, 0, 0, 0, 1, 1,
1.185919, 0.4538163, 0.5954657, 0, 0, 0, 1, 1,
1.202592, 1.206619, 1.324306, 0, 0, 0, 1, 1,
1.218112, 0.765943, 1.277974, 0, 0, 0, 1, 1,
1.221452, -1.048664, 3.304515, 1, 1, 1, 1, 1,
1.225352, 0.7390407, 1.709397, 1, 1, 1, 1, 1,
1.227718, 0.4255295, 2.544249, 1, 1, 1, 1, 1,
1.235853, -0.3179862, 0.5941011, 1, 1, 1, 1, 1,
1.239567, 0.4140562, 1.538217, 1, 1, 1, 1, 1,
1.244802, -0.1146125, 0.4894974, 1, 1, 1, 1, 1,
1.249051, -0.2968985, 0.01556307, 1, 1, 1, 1, 1,
1.254081, 0.5028693, 2.184588, 1, 1, 1, 1, 1,
1.262263, -0.4746948, 1.24011, 1, 1, 1, 1, 1,
1.263166, 0.851655, 2.38938, 1, 1, 1, 1, 1,
1.264352, 0.7041844, 2.067664, 1, 1, 1, 1, 1,
1.26876, -0.4506769, 2.869184, 1, 1, 1, 1, 1,
1.278848, 0.5811944, -2.447364, 1, 1, 1, 1, 1,
1.289741, 1.411861, 2.815526, 1, 1, 1, 1, 1,
1.290629, 0.3472663, 3.870021, 1, 1, 1, 1, 1,
1.291381, 0.393115, 2.151543, 0, 0, 1, 1, 1,
1.294683, -0.8790991, 0.2880939, 1, 0, 0, 1, 1,
1.2967, -0.6890038, 3.118618, 1, 0, 0, 1, 1,
1.29688, -0.2073991, 1.417133, 1, 0, 0, 1, 1,
1.297892, -1.144017, 1.650945, 1, 0, 0, 1, 1,
1.302784, -0.1016344, 0.09470306, 1, 0, 0, 1, 1,
1.311216, -1.681015, 1.806786, 0, 0, 0, 1, 1,
1.316268, 0.3339372, 1.685511, 0, 0, 0, 1, 1,
1.325336, -0.7961937, 1.541262, 0, 0, 0, 1, 1,
1.329615, -0.3792834, 3.648089, 0, 0, 0, 1, 1,
1.332281, -0.6115664, 1.732978, 0, 0, 0, 1, 1,
1.33413, 0.02286271, -0.1817692, 0, 0, 0, 1, 1,
1.335856, -0.3019814, 3.377683, 0, 0, 0, 1, 1,
1.336598, 0.03634194, 0.9902156, 1, 1, 1, 1, 1,
1.339325, -1.412799, 2.595885, 1, 1, 1, 1, 1,
1.353796, -0.3887894, 0.4969139, 1, 1, 1, 1, 1,
1.360867, 0.5932898, -0.1823571, 1, 1, 1, 1, 1,
1.369042, -0.3322619, 1.66503, 1, 1, 1, 1, 1,
1.371692, 1.035997, 0.5528991, 1, 1, 1, 1, 1,
1.377249, 0.5945926, 2.187022, 1, 1, 1, 1, 1,
1.378649, -0.6597338, 2.562995, 1, 1, 1, 1, 1,
1.393732, -1.396022, 2.160277, 1, 1, 1, 1, 1,
1.397995, -1.199826, 0.9144363, 1, 1, 1, 1, 1,
1.398587, 0.5333081, 0.3646761, 1, 1, 1, 1, 1,
1.414111, 0.7450536, 0.350427, 1, 1, 1, 1, 1,
1.414307, 0.9642016, 1.040018, 1, 1, 1, 1, 1,
1.417485, 0.7109833, 1.721941, 1, 1, 1, 1, 1,
1.420814, -0.06162318, 2.38862, 1, 1, 1, 1, 1,
1.429739, -1.300509, 2.415535, 0, 0, 1, 1, 1,
1.443754, 0.8607553, 2.142658, 1, 0, 0, 1, 1,
1.451581, -0.662194, 3.132689, 1, 0, 0, 1, 1,
1.452731, 0.5027273, 0.8445055, 1, 0, 0, 1, 1,
1.468548, 1.958781, 1.077203, 1, 0, 0, 1, 1,
1.470592, 0.7942606, 1.414531, 1, 0, 0, 1, 1,
1.488788, -0.8629677, 1.552777, 0, 0, 0, 1, 1,
1.493817, 1.053183, 0.6268317, 0, 0, 0, 1, 1,
1.49921, 0.6263192, 2.604063, 0, 0, 0, 1, 1,
1.504153, 0.4518578, 2.057846, 0, 0, 0, 1, 1,
1.516984, -0.3760181, 1.679502, 0, 0, 0, 1, 1,
1.517051, 0.2768981, 1.588208, 0, 0, 0, 1, 1,
1.52513, -0.812995, 3.430172, 0, 0, 0, 1, 1,
1.541034, 1.345736, 0.4659743, 1, 1, 1, 1, 1,
1.545711, 0.1887045, 0.8225753, 1, 1, 1, 1, 1,
1.552694, 0.702302, 2.069236, 1, 1, 1, 1, 1,
1.557606, 0.1798101, 2.745936, 1, 1, 1, 1, 1,
1.562136, -0.7675307, 1.34015, 1, 1, 1, 1, 1,
1.564977, 0.1362297, 2.310047, 1, 1, 1, 1, 1,
1.570082, 0.3503157, 2.459554, 1, 1, 1, 1, 1,
1.576084, -0.9813071, 1.36337, 1, 1, 1, 1, 1,
1.57734, -0.456483, 3.547441, 1, 1, 1, 1, 1,
1.579673, 0.3921327, 1.488626, 1, 1, 1, 1, 1,
1.588002, -2.613002, 3.393222, 1, 1, 1, 1, 1,
1.603969, -0.1060142, 2.433561, 1, 1, 1, 1, 1,
1.604383, -0.6333691, 2.754507, 1, 1, 1, 1, 1,
1.60521, 0.8296429, 1.030689, 1, 1, 1, 1, 1,
1.611414, -0.1299809, 0.6881944, 1, 1, 1, 1, 1,
1.621339, -0.4800021, -0.9540813, 0, 0, 1, 1, 1,
1.631835, 0.5550365, 0.2132079, 1, 0, 0, 1, 1,
1.633362, -1.983459, 2.676327, 1, 0, 0, 1, 1,
1.637038, 0.4626708, 0.3828173, 1, 0, 0, 1, 1,
1.644381, -0.1131204, 0.551939, 1, 0, 0, 1, 1,
1.647096, -0.3308632, 0.2307491, 1, 0, 0, 1, 1,
1.656269, 0.09172777, 1.393392, 0, 0, 0, 1, 1,
1.671912, 1.784423, 0.9375631, 0, 0, 0, 1, 1,
1.717761, 0.2021262, 0.8999318, 0, 0, 0, 1, 1,
1.737006, -0.9614, 0.8304607, 0, 0, 0, 1, 1,
1.743917, -1.269032, 2.113418, 0, 0, 0, 1, 1,
1.749943, -1.908072, 3.247971, 0, 0, 0, 1, 1,
1.75453, -1.085675, 0.9961006, 0, 0, 0, 1, 1,
1.755362, 1.720694, 1.465319, 1, 1, 1, 1, 1,
1.766971, -1.022334, 2.282802, 1, 1, 1, 1, 1,
1.799866, 0.8517652, 1.136855, 1, 1, 1, 1, 1,
1.812482, -0.5226736, 3.11101, 1, 1, 1, 1, 1,
1.819058, -1.695311, 2.620527, 1, 1, 1, 1, 1,
1.845237, 0.1458724, 0.7191534, 1, 1, 1, 1, 1,
1.866627, 0.1028999, 1.303457, 1, 1, 1, 1, 1,
1.872252, -0.2695783, 0.336292, 1, 1, 1, 1, 1,
1.883948, -0.08824813, 2.284756, 1, 1, 1, 1, 1,
1.887794, 0.009714699, 2.384449, 1, 1, 1, 1, 1,
1.902648, -0.1543582, 1.036736, 1, 1, 1, 1, 1,
1.925278, 0.1590517, 2.054658, 1, 1, 1, 1, 1,
1.93289, 0.109933, 3.524425, 1, 1, 1, 1, 1,
1.952435, 0.4579118, 2.470797, 1, 1, 1, 1, 1,
1.960935, -0.2711627, -0.5552517, 1, 1, 1, 1, 1,
2.018122, -0.07169737, 1.388037, 0, 0, 1, 1, 1,
2.020553, 0.3371659, 0.5113326, 1, 0, 0, 1, 1,
2.038135, 0.1750266, 3.148989, 1, 0, 0, 1, 1,
2.082407, 0.6694599, 2.146538, 1, 0, 0, 1, 1,
2.13676, -0.4862885, 0.7336773, 1, 0, 0, 1, 1,
2.175138, -0.8528636, 1.839044, 1, 0, 0, 1, 1,
2.178426, 0.1213685, 2.472786, 0, 0, 0, 1, 1,
2.182736, -0.01911251, 2.978772, 0, 0, 0, 1, 1,
2.182749, -0.6512797, 0.8636881, 0, 0, 0, 1, 1,
2.214876, -1.186132, 1.039601, 0, 0, 0, 1, 1,
2.223204, -0.3328692, 2.130948, 0, 0, 0, 1, 1,
2.242632, 2.080854, 0.6447201, 0, 0, 0, 1, 1,
2.297609, -0.7983108, 3.4404, 0, 0, 0, 1, 1,
2.355077, 1.587579, -0.4167321, 1, 1, 1, 1, 1,
2.444218, 0.3296081, 2.375456, 1, 1, 1, 1, 1,
2.445156, 1.199913, 0.0264285, 1, 1, 1, 1, 1,
2.516008, 1.364869, 2.269314, 1, 1, 1, 1, 1,
2.571684, 0.2014047, 2.921945, 1, 1, 1, 1, 1,
2.610785, -0.9561691, 3.070184, 1, 1, 1, 1, 1,
2.647244, 0.3132754, 2.922073, 1, 1, 1, 1, 1
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
var radius = 9.432882;
var distance = 33.1326;
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
mvMatrix.translate( 0.09306765, 0.1811843, 0.5507801 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.1326);
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