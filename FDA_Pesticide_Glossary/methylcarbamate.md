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
-3.15248, -0.5191808, -1.152181, 1, 0, 0, 1,
-2.756882, -1.103737, -1.504951, 1, 0.007843138, 0, 1,
-2.600849, -0.08640301, -2.865805, 1, 0.01176471, 0, 1,
-2.539849, -0.09156175, -1.215161, 1, 0.01960784, 0, 1,
-2.534594, -1.586533, -0.6265091, 1, 0.02352941, 0, 1,
-2.523857, 0.2459688, -2.81558, 1, 0.03137255, 0, 1,
-2.504055, 1.977956, -0.2461271, 1, 0.03529412, 0, 1,
-2.46424, 0.6286477, -0.08146123, 1, 0.04313726, 0, 1,
-2.319386, -0.7898093, -3.912923, 1, 0.04705882, 0, 1,
-2.315094, -1.051003, 0.04368469, 1, 0.05490196, 0, 1,
-2.262561, 0.9475353, -2.833404, 1, 0.05882353, 0, 1,
-2.246998, -0.2450091, -3.594308, 1, 0.06666667, 0, 1,
-2.212068, 0.05498931, 0.654322, 1, 0.07058824, 0, 1,
-2.169502, -0.4254665, -0.6583588, 1, 0.07843138, 0, 1,
-2.107714, -0.8017166, -0.5289923, 1, 0.08235294, 0, 1,
-2.05145, 0.1339548, -0.2579867, 1, 0.09019608, 0, 1,
-2.042041, -0.8900157, -1.633604, 1, 0.09411765, 0, 1,
-2.011663, -1.133288, -0.4011805, 1, 0.1019608, 0, 1,
-2.008779, 0.156332, -3.308043, 1, 0.1098039, 0, 1,
-1.981614, -0.8560812, -3.126672, 1, 0.1137255, 0, 1,
-1.924262, -0.4812037, -1.861422, 1, 0.1215686, 0, 1,
-1.893294, -0.09394088, -1.211406, 1, 0.1254902, 0, 1,
-1.887898, 1.455523, -1.112986, 1, 0.1333333, 0, 1,
-1.886826, 0.4417573, -2.217525, 1, 0.1372549, 0, 1,
-1.851371, 1.069305, -0.9379926, 1, 0.145098, 0, 1,
-1.848778, 1.098397, -0.4828761, 1, 0.1490196, 0, 1,
-1.847392, 0.2975216, -2.21483, 1, 0.1568628, 0, 1,
-1.843218, 1.470966, -2.16912, 1, 0.1607843, 0, 1,
-1.832683, 1.346552, 0.07639143, 1, 0.1686275, 0, 1,
-1.831542, 0.5346055, -2.247932, 1, 0.172549, 0, 1,
-1.823868, -0.95406, -2.19021, 1, 0.1803922, 0, 1,
-1.815602, 1.451385, -0.7300257, 1, 0.1843137, 0, 1,
-1.764485, -0.7371383, -2.167346, 1, 0.1921569, 0, 1,
-1.741259, 0.7054682, -1.213122, 1, 0.1960784, 0, 1,
-1.736754, -0.6456397, -0.3029763, 1, 0.2039216, 0, 1,
-1.723464, 0.9653342, -2.252331, 1, 0.2117647, 0, 1,
-1.71514, -1.542421, -2.254502, 1, 0.2156863, 0, 1,
-1.705741, 2.089845, -0.3272824, 1, 0.2235294, 0, 1,
-1.702927, -0.0371957, -1.915076, 1, 0.227451, 0, 1,
-1.698056, -0.2825638, 0.08335226, 1, 0.2352941, 0, 1,
-1.692681, -2.55648, -1.752963, 1, 0.2392157, 0, 1,
-1.691071, 0.9091138, -1.761876, 1, 0.2470588, 0, 1,
-1.678997, 1.047519, 0.08176915, 1, 0.2509804, 0, 1,
-1.676248, -1.375882, -2.749344, 1, 0.2588235, 0, 1,
-1.668786, 0.6076406, -3.188914, 1, 0.2627451, 0, 1,
-1.652764, 1.105023, -3.537577, 1, 0.2705882, 0, 1,
-1.638912, 1.235213, -0.8434682, 1, 0.2745098, 0, 1,
-1.625489, 0.6608171, -2.050234, 1, 0.282353, 0, 1,
-1.623056, -0.4613528, -2.884771, 1, 0.2862745, 0, 1,
-1.618116, 0.4202788, -1.58013, 1, 0.2941177, 0, 1,
-1.616585, -0.1239914, -2.356397, 1, 0.3019608, 0, 1,
-1.609802, -0.8779669, -1.964057, 1, 0.3058824, 0, 1,
-1.608461, -0.04332074, -2.090656, 1, 0.3137255, 0, 1,
-1.592174, 1.742947, -1.411962, 1, 0.3176471, 0, 1,
-1.580567, 0.1201162, -2.497242, 1, 0.3254902, 0, 1,
-1.579916, -0.2665986, -2.218915, 1, 0.3294118, 0, 1,
-1.579736, -0.8927009, -4.300747, 1, 0.3372549, 0, 1,
-1.571806, -1.657035, -2.318309, 1, 0.3411765, 0, 1,
-1.565024, -0.6679709, -0.6369267, 1, 0.3490196, 0, 1,
-1.559809, 1.692024, -2.022218, 1, 0.3529412, 0, 1,
-1.552757, -0.08256097, 0.2527066, 1, 0.3607843, 0, 1,
-1.55006, -1.569912, -0.7023672, 1, 0.3647059, 0, 1,
-1.546879, 1.367551, -1.147367, 1, 0.372549, 0, 1,
-1.546441, 0.8121647, -1.187568, 1, 0.3764706, 0, 1,
-1.54218, 0.7630478, -1.731853, 1, 0.3843137, 0, 1,
-1.540392, -0.9655724, -2.259035, 1, 0.3882353, 0, 1,
-1.526933, 0.2397322, -0.5389651, 1, 0.3960784, 0, 1,
-1.526002, -0.3944589, -2.075476, 1, 0.4039216, 0, 1,
-1.525757, -0.04703065, -2.24037, 1, 0.4078431, 0, 1,
-1.525597, -0.8464136, -1.811812, 1, 0.4156863, 0, 1,
-1.518456, -0.9270752, -1.716809, 1, 0.4196078, 0, 1,
-1.494764, -0.8453203, -1.872891, 1, 0.427451, 0, 1,
-1.491718, 0.3953009, -1.7635, 1, 0.4313726, 0, 1,
-1.424411, 0.1486759, -0.5611298, 1, 0.4392157, 0, 1,
-1.424127, -0.07079916, -0.7725946, 1, 0.4431373, 0, 1,
-1.397715, -1.918673, -2.900258, 1, 0.4509804, 0, 1,
-1.390484, -0.3003748, -1.205853, 1, 0.454902, 0, 1,
-1.386435, -1.195033, -1.722663, 1, 0.4627451, 0, 1,
-1.378452, -0.6090274, -3.916577, 1, 0.4666667, 0, 1,
-1.37737, 0.1782168, 0.388227, 1, 0.4745098, 0, 1,
-1.374742, 0.09472837, -0.5389078, 1, 0.4784314, 0, 1,
-1.367923, -1.041916, -1.179142, 1, 0.4862745, 0, 1,
-1.363675, -1.935746, -1.256593, 1, 0.4901961, 0, 1,
-1.353718, 1.386487, -1.106025, 1, 0.4980392, 0, 1,
-1.353367, -0.03807269, -2.922872, 1, 0.5058824, 0, 1,
-1.350457, 1.467364, 0.08208657, 1, 0.509804, 0, 1,
-1.343867, -0.863008, -2.257254, 1, 0.5176471, 0, 1,
-1.343055, 0.1004521, -0.5992124, 1, 0.5215687, 0, 1,
-1.331197, 1.106557, -0.4628337, 1, 0.5294118, 0, 1,
-1.328437, -0.9830374, -3.171124, 1, 0.5333334, 0, 1,
-1.324312, 1.407061, -0.09742633, 1, 0.5411765, 0, 1,
-1.308321, 1.210197, -1.883297, 1, 0.5450981, 0, 1,
-1.307849, -0.5045506, -2.049932, 1, 0.5529412, 0, 1,
-1.307545, -0.4105916, -1.584563, 1, 0.5568628, 0, 1,
-1.30372, -1.611482, -3.870646, 1, 0.5647059, 0, 1,
-1.298366, -0.4118731, -0.348531, 1, 0.5686275, 0, 1,
-1.295179, 0.346187, -0.06866612, 1, 0.5764706, 0, 1,
-1.289975, 0.274588, -0.9681273, 1, 0.5803922, 0, 1,
-1.286868, 0.532545, -0.8250203, 1, 0.5882353, 0, 1,
-1.281508, -2.600907, -2.284897, 1, 0.5921569, 0, 1,
-1.234007, 0.8316455, -1.146965, 1, 0.6, 0, 1,
-1.229058, -1.254442, -2.278318, 1, 0.6078432, 0, 1,
-1.217635, 0.1666891, -1.333469, 1, 0.6117647, 0, 1,
-1.216805, -1.952838, -2.837259, 1, 0.6196079, 0, 1,
-1.205557, 1.653653, 0.01136525, 1, 0.6235294, 0, 1,
-1.199636, 0.5031139, 0.6354232, 1, 0.6313726, 0, 1,
-1.19607, -0.2128852, -1.011262, 1, 0.6352941, 0, 1,
-1.185266, 0.9703966, -0.901067, 1, 0.6431373, 0, 1,
-1.17166, -0.2115923, -1.936244, 1, 0.6470588, 0, 1,
-1.165798, 0.6759615, -0.7722474, 1, 0.654902, 0, 1,
-1.162919, -1.100272, -2.115248, 1, 0.6588235, 0, 1,
-1.161047, 0.5230533, -1.156884, 1, 0.6666667, 0, 1,
-1.158008, 0.2952461, -1.203159, 1, 0.6705883, 0, 1,
-1.156817, -0.4508237, -0.8796082, 1, 0.6784314, 0, 1,
-1.153525, 0.6690117, -0.9344925, 1, 0.682353, 0, 1,
-1.152549, -0.5747651, -1.768939, 1, 0.6901961, 0, 1,
-1.142216, -0.5786253, -3.64689, 1, 0.6941177, 0, 1,
-1.123418, 1.095768, 0.3917144, 1, 0.7019608, 0, 1,
-1.116792, -0.8731911, -2.068309, 1, 0.7098039, 0, 1,
-1.113909, 0.2375432, -1.09901, 1, 0.7137255, 0, 1,
-1.105752, -0.09377554, -1.239373, 1, 0.7215686, 0, 1,
-1.092022, 1.877518, -0.6819441, 1, 0.7254902, 0, 1,
-1.090673, 0.1698003, -2.43792, 1, 0.7333333, 0, 1,
-1.083169, 0.4462321, -1.402402, 1, 0.7372549, 0, 1,
-1.080591, 0.3451371, -1.002159, 1, 0.7450981, 0, 1,
-1.079328, 0.3541122, -2.161558, 1, 0.7490196, 0, 1,
-1.077531, -0.6055633, -1.609063, 1, 0.7568628, 0, 1,
-1.074235, -0.6611932, -3.505658, 1, 0.7607843, 0, 1,
-1.073399, -1.080595, -0.7752941, 1, 0.7686275, 0, 1,
-1.072114, -1.793367, -2.718328, 1, 0.772549, 0, 1,
-1.068127, -0.7125624, -1.434424, 1, 0.7803922, 0, 1,
-1.066586, 1.302477, -0.2310484, 1, 0.7843137, 0, 1,
-1.058646, -0.4711701, -2.359479, 1, 0.7921569, 0, 1,
-1.058561, 0.5415541, -2.561706, 1, 0.7960784, 0, 1,
-1.056722, 0.4589089, -0.1617517, 1, 0.8039216, 0, 1,
-1.056222, -1.360284, -2.185437, 1, 0.8117647, 0, 1,
-1.051794, -0.597635, -1.119264, 1, 0.8156863, 0, 1,
-1.049982, -0.9602902, -1.598911, 1, 0.8235294, 0, 1,
-1.037581, 1.635267, -0.4079692, 1, 0.827451, 0, 1,
-1.032955, 0.4425281, -3.063164, 1, 0.8352941, 0, 1,
-1.030769, 1.039342, -1.240671, 1, 0.8392157, 0, 1,
-1.023306, -0.228735, -4.439121, 1, 0.8470588, 0, 1,
-1.021267, 0.4075381, -2.085637, 1, 0.8509804, 0, 1,
-1.017014, -0.05281476, -0.3458761, 1, 0.8588235, 0, 1,
-1.016102, -0.5183197, -3.54177, 1, 0.8627451, 0, 1,
-1.004847, -0.6640564, -1.092169, 1, 0.8705882, 0, 1,
-1.004584, 0.8721962, -1.098031, 1, 0.8745098, 0, 1,
-1.00029, 0.2251386, -1.83687, 1, 0.8823529, 0, 1,
-0.9913414, -1.397847, -2.452162, 1, 0.8862745, 0, 1,
-0.9849871, -1.215442, -2.426462, 1, 0.8941177, 0, 1,
-0.9848656, 1.220725, -0.07690393, 1, 0.8980392, 0, 1,
-0.9654704, -1.227554, -1.524796, 1, 0.9058824, 0, 1,
-0.9613082, -0.9776589, -2.765318, 1, 0.9137255, 0, 1,
-0.9599423, -1.672323, -1.401795, 1, 0.9176471, 0, 1,
-0.9581804, -0.8708043, -1.686356, 1, 0.9254902, 0, 1,
-0.9544633, -1.790715, -0.7247639, 1, 0.9294118, 0, 1,
-0.9449901, -0.3837341, -3.434294, 1, 0.9372549, 0, 1,
-0.9190872, -0.3989841, -1.932408, 1, 0.9411765, 0, 1,
-0.9177415, -0.5209135, -2.366167, 1, 0.9490196, 0, 1,
-0.9130965, 0.006109704, -0.6642419, 1, 0.9529412, 0, 1,
-0.9069836, -0.2358755, -0.2573786, 1, 0.9607843, 0, 1,
-0.9058704, -0.6504714, -4.682942, 1, 0.9647059, 0, 1,
-0.9041719, -0.136043, -2.122004, 1, 0.972549, 0, 1,
-0.90236, 0.2644294, -0.03049492, 1, 0.9764706, 0, 1,
-0.9021317, -0.8865962, -3.432934, 1, 0.9843137, 0, 1,
-0.8984877, -0.6539558, 0.2831918, 1, 0.9882353, 0, 1,
-0.8974144, -0.4092136, -2.800986, 1, 0.9960784, 0, 1,
-0.8939561, -2.85027, -1.791875, 0.9960784, 1, 0, 1,
-0.8882431, 0.1067723, -0.382628, 0.9921569, 1, 0, 1,
-0.8812625, 0.6655366, -0.6941073, 0.9843137, 1, 0, 1,
-0.8616695, 1.575873, -0.1051748, 0.9803922, 1, 0, 1,
-0.8595481, -0.02081838, -2.515446, 0.972549, 1, 0, 1,
-0.8591452, 2.224062, -2.544557, 0.9686275, 1, 0, 1,
-0.8420219, 0.9815067, -0.874115, 0.9607843, 1, 0, 1,
-0.8385962, 0.2517295, -1.932909, 0.9568627, 1, 0, 1,
-0.833112, 0.1288639, -1.289103, 0.9490196, 1, 0, 1,
-0.8250841, -3.095574, -1.584357, 0.945098, 1, 0, 1,
-0.8227291, 0.5811293, -0.2640474, 0.9372549, 1, 0, 1,
-0.8221862, 1.022763, -1.193373, 0.9333333, 1, 0, 1,
-0.8199779, 1.042378, -0.4999465, 0.9254902, 1, 0, 1,
-0.8196012, 2.74386, 0.1490137, 0.9215686, 1, 0, 1,
-0.8131579, -1.555435, -2.348916, 0.9137255, 1, 0, 1,
-0.8131397, 0.4127985, 0.09342097, 0.9098039, 1, 0, 1,
-0.8119712, -1.411855, -1.075705, 0.9019608, 1, 0, 1,
-0.8059139, 0.6503471, -0.1562267, 0.8941177, 1, 0, 1,
-0.8045266, 1.21878, -0.4261072, 0.8901961, 1, 0, 1,
-0.7938059, -0.7075903, -1.546055, 0.8823529, 1, 0, 1,
-0.7879667, 1.921559, -0.6465637, 0.8784314, 1, 0, 1,
-0.7862998, -0.8469434, -2.006418, 0.8705882, 1, 0, 1,
-0.7838693, 0.836388, 0.06263435, 0.8666667, 1, 0, 1,
-0.7699718, 0.01354935, -1.323084, 0.8588235, 1, 0, 1,
-0.7665104, 0.06024051, -2.167599, 0.854902, 1, 0, 1,
-0.7641514, -1.864354, -3.780961, 0.8470588, 1, 0, 1,
-0.7638585, -1.412848, -2.525335, 0.8431373, 1, 0, 1,
-0.7628055, -1.256458, -1.091795, 0.8352941, 1, 0, 1,
-0.762513, -0.1720904, -2.586274, 0.8313726, 1, 0, 1,
-0.759526, -1.682622, -2.058694, 0.8235294, 1, 0, 1,
-0.7571096, 1.56805, -0.4256575, 0.8196079, 1, 0, 1,
-0.7499649, 1.363519, 0.1175842, 0.8117647, 1, 0, 1,
-0.7487099, -1.140833, -3.306186, 0.8078431, 1, 0, 1,
-0.7474394, -1.577253, -3.810323, 0.8, 1, 0, 1,
-0.7474039, 0.1546843, 0.5615294, 0.7921569, 1, 0, 1,
-0.745333, -0.4141278, -0.6904328, 0.7882353, 1, 0, 1,
-0.7423223, 0.7925014, -0.5020316, 0.7803922, 1, 0, 1,
-0.7416155, 1.404159, -0.3545858, 0.7764706, 1, 0, 1,
-0.7413399, 0.9896594, -0.3496224, 0.7686275, 1, 0, 1,
-0.7363364, -0.7766734, -1.907558, 0.7647059, 1, 0, 1,
-0.7345889, -1.223524, -4.933486, 0.7568628, 1, 0, 1,
-0.7288545, -0.06570448, -0.7427965, 0.7529412, 1, 0, 1,
-0.7259234, 1.089294, -0.3595012, 0.7450981, 1, 0, 1,
-0.7213955, -0.3897416, -1.65385, 0.7411765, 1, 0, 1,
-0.7210734, -0.25148, -2.833113, 0.7333333, 1, 0, 1,
-0.7192469, 0.9929509, 0.8759798, 0.7294118, 1, 0, 1,
-0.7102765, 0.2139234, 1.347394, 0.7215686, 1, 0, 1,
-0.7098573, 1.155208, -0.5407814, 0.7176471, 1, 0, 1,
-0.7062141, -2.236629, -2.7655, 0.7098039, 1, 0, 1,
-0.7022573, -0.6394469, -3.353944, 0.7058824, 1, 0, 1,
-0.694765, -0.4910112, -2.725085, 0.6980392, 1, 0, 1,
-0.6945095, -0.3174995, -1.776103, 0.6901961, 1, 0, 1,
-0.689567, -0.6994964, -2.63939, 0.6862745, 1, 0, 1,
-0.6830864, 0.4133861, -2.007028, 0.6784314, 1, 0, 1,
-0.679827, -0.4471772, -3.04546, 0.6745098, 1, 0, 1,
-0.6763814, -1.647032, -1.622045, 0.6666667, 1, 0, 1,
-0.6742991, 1.059555, -0.3453417, 0.6627451, 1, 0, 1,
-0.6696554, -0.8156849, -2.125334, 0.654902, 1, 0, 1,
-0.6695918, -0.6724782, -2.267711, 0.6509804, 1, 0, 1,
-0.6692311, 0.6864927, 0.4075134, 0.6431373, 1, 0, 1,
-0.6684667, -0.7730206, -3.651451, 0.6392157, 1, 0, 1,
-0.6637737, 0.02514479, -0.9755467, 0.6313726, 1, 0, 1,
-0.6633155, 0.967763, -1.976148, 0.627451, 1, 0, 1,
-0.6623184, 0.3131428, -1.207817, 0.6196079, 1, 0, 1,
-0.6586058, -0.3654069, -1.145681, 0.6156863, 1, 0, 1,
-0.6562862, -0.9025952, -3.307518, 0.6078432, 1, 0, 1,
-0.6454363, 0.4275488, -1.510668, 0.6039216, 1, 0, 1,
-0.6411427, 0.9324771, -0.732796, 0.5960785, 1, 0, 1,
-0.6408769, -0.872246, -3.072469, 0.5882353, 1, 0, 1,
-0.6377431, 0.7439016, -0.7952296, 0.5843138, 1, 0, 1,
-0.6316636, 0.1842752, 0.03433828, 0.5764706, 1, 0, 1,
-0.6255736, -0.4132692, 0.5718814, 0.572549, 1, 0, 1,
-0.6220772, 1.314531, 0.530719, 0.5647059, 1, 0, 1,
-0.6191559, -0.6598244, -2.48431, 0.5607843, 1, 0, 1,
-0.6182212, -2.136282, -2.645314, 0.5529412, 1, 0, 1,
-0.6146547, -0.2669569, -2.927913, 0.5490196, 1, 0, 1,
-0.6139919, 1.046688, 0.4723775, 0.5411765, 1, 0, 1,
-0.6136284, -0.7593694, -3.693101, 0.5372549, 1, 0, 1,
-0.6124551, -0.9081138, -3.460346, 0.5294118, 1, 0, 1,
-0.6074207, -0.5386657, -1.538729, 0.5254902, 1, 0, 1,
-0.6023691, 0.06387538, -1.175603, 0.5176471, 1, 0, 1,
-0.6017835, -0.8674335, -2.873866, 0.5137255, 1, 0, 1,
-0.5996845, -0.7460855, -1.597481, 0.5058824, 1, 0, 1,
-0.5948958, 0.5111051, 1.087801, 0.5019608, 1, 0, 1,
-0.5908998, 0.2964577, -0.4267235, 0.4941176, 1, 0, 1,
-0.5865371, 1.426292, 0.04748827, 0.4862745, 1, 0, 1,
-0.5832398, -0.7407826, -2.576774, 0.4823529, 1, 0, 1,
-0.5828267, 1.083398, 0.4142757, 0.4745098, 1, 0, 1,
-0.5818804, -0.633938, -1.522914, 0.4705882, 1, 0, 1,
-0.579883, 0.6185781, -0.5996842, 0.4627451, 1, 0, 1,
-0.5797992, -0.4833256, -2.392625, 0.4588235, 1, 0, 1,
-0.5787184, -1.200733, -4.864581, 0.4509804, 1, 0, 1,
-0.576337, -1.409408, -2.467372, 0.4470588, 1, 0, 1,
-0.5732021, 0.9255295, -1.521487, 0.4392157, 1, 0, 1,
-0.5730246, 0.01553546, -0.5145767, 0.4352941, 1, 0, 1,
-0.5718055, 0.30133, 0.2594437, 0.427451, 1, 0, 1,
-0.5667614, -0.2430206, 0.1785847, 0.4235294, 1, 0, 1,
-0.5630455, 0.7010106, -1.071542, 0.4156863, 1, 0, 1,
-0.5622804, 0.7818308, -0.09019528, 0.4117647, 1, 0, 1,
-0.5578573, -0.1361173, -1.084542, 0.4039216, 1, 0, 1,
-0.557449, 0.74069, -0.46986, 0.3960784, 1, 0, 1,
-0.5567111, -0.4821563, -2.863373, 0.3921569, 1, 0, 1,
-0.5546716, 0.5412253, -1.547708, 0.3843137, 1, 0, 1,
-0.5519622, -1.436284, -2.331289, 0.3803922, 1, 0, 1,
-0.5484561, -0.01799105, -1.570736, 0.372549, 1, 0, 1,
-0.5479848, 0.2660853, -0.3996951, 0.3686275, 1, 0, 1,
-0.5462515, -0.4230691, -1.839783, 0.3607843, 1, 0, 1,
-0.5460593, -1.068126, -3.009191, 0.3568628, 1, 0, 1,
-0.545061, -0.308273, -2.733766, 0.3490196, 1, 0, 1,
-0.5446231, 0.02001114, -1.007334, 0.345098, 1, 0, 1,
-0.5429388, -0.42366, -2.527649, 0.3372549, 1, 0, 1,
-0.5357085, 0.4889571, -0.6894046, 0.3333333, 1, 0, 1,
-0.5317868, -0.5324122, -1.161093, 0.3254902, 1, 0, 1,
-0.5308565, 0.6742775, 0.078668, 0.3215686, 1, 0, 1,
-0.5272437, 0.3225472, -0.7991478, 0.3137255, 1, 0, 1,
-0.5244818, -0.2928142, -1.317276, 0.3098039, 1, 0, 1,
-0.5212789, -0.3411985, -1.0164, 0.3019608, 1, 0, 1,
-0.5190744, -0.3413601, -1.574296, 0.2941177, 1, 0, 1,
-0.5134237, 0.1131163, -0.08302826, 0.2901961, 1, 0, 1,
-0.5131207, -1.716444, -1.441578, 0.282353, 1, 0, 1,
-0.5094775, 0.1830658, -0.1156703, 0.2784314, 1, 0, 1,
-0.5084043, -1.329857, -3.725976, 0.2705882, 1, 0, 1,
-0.5071496, -1.099028, -2.140953, 0.2666667, 1, 0, 1,
-0.5069432, 0.06941066, 0.1175167, 0.2588235, 1, 0, 1,
-0.5035679, 2.241445, -1.104934, 0.254902, 1, 0, 1,
-0.5019283, 1.034991, -1.213928, 0.2470588, 1, 0, 1,
-0.5003654, 1.962586, -0.3415273, 0.2431373, 1, 0, 1,
-0.5001294, 0.5588375, -1.134919, 0.2352941, 1, 0, 1,
-0.4960944, 0.6285172, 1.221059, 0.2313726, 1, 0, 1,
-0.4921197, 0.8486727, 0.3252344, 0.2235294, 1, 0, 1,
-0.4884659, 0.6478188, -0.7874001, 0.2196078, 1, 0, 1,
-0.4884602, -0.632084, -2.751079, 0.2117647, 1, 0, 1,
-0.4832384, -0.5827174, -2.113852, 0.2078431, 1, 0, 1,
-0.4827333, -0.5799387, -3.284592, 0.2, 1, 0, 1,
-0.4815641, -0.8585579, -3.116271, 0.1921569, 1, 0, 1,
-0.4808566, 0.2611901, -0.72773, 0.1882353, 1, 0, 1,
-0.4773077, 1.907261, -0.4209912, 0.1803922, 1, 0, 1,
-0.4769983, 0.6616561, -0.2477387, 0.1764706, 1, 0, 1,
-0.476139, 0.6022824, 0.7643501, 0.1686275, 1, 0, 1,
-0.47423, 1.792367, 1.215382, 0.1647059, 1, 0, 1,
-0.4737405, 0.03282019, -2.111144, 0.1568628, 1, 0, 1,
-0.4736656, -0.5140008, -3.766896, 0.1529412, 1, 0, 1,
-0.4675623, -0.4947085, -2.771808, 0.145098, 1, 0, 1,
-0.4669594, 2.994011, -0.1041596, 0.1411765, 1, 0, 1,
-0.4631218, -1.640608, -4.389297, 0.1333333, 1, 0, 1,
-0.4496608, -0.7925111, -2.060211, 0.1294118, 1, 0, 1,
-0.4491799, 0.539272, -2.059028, 0.1215686, 1, 0, 1,
-0.4475046, 0.04822402, -2.534713, 0.1176471, 1, 0, 1,
-0.4458233, 1.28581, 0.6056204, 0.1098039, 1, 0, 1,
-0.443411, -0.2639599, -0.9154708, 0.1058824, 1, 0, 1,
-0.440039, 1.537643, -0.01214532, 0.09803922, 1, 0, 1,
-0.436808, 0.681712, -1.122475, 0.09019608, 1, 0, 1,
-0.4339513, 0.1798064, -0.1598873, 0.08627451, 1, 0, 1,
-0.4297789, 1.32442, -1.579993, 0.07843138, 1, 0, 1,
-0.4291334, 0.1707713, -1.330055, 0.07450981, 1, 0, 1,
-0.4277745, 0.4165803, 0.5860058, 0.06666667, 1, 0, 1,
-0.4248749, 1.083976, -0.4508548, 0.0627451, 1, 0, 1,
-0.4240538, -0.188768, -1.719715, 0.05490196, 1, 0, 1,
-0.4213852, -0.5544238, -1.814179, 0.05098039, 1, 0, 1,
-0.4202426, 0.6418339, -1.452402, 0.04313726, 1, 0, 1,
-0.4201122, -0.1855395, -2.488719, 0.03921569, 1, 0, 1,
-0.4157093, 0.3962337, -2.001509, 0.03137255, 1, 0, 1,
-0.4130394, -0.2864113, -3.029708, 0.02745098, 1, 0, 1,
-0.4089726, 1.14093, -1.316193, 0.01960784, 1, 0, 1,
-0.405671, 0.1606381, -1.773652, 0.01568628, 1, 0, 1,
-0.4006569, 2.514963, -0.2222782, 0.007843138, 1, 0, 1,
-0.4003232, -0.450292, -1.922713, 0.003921569, 1, 0, 1,
-0.3995982, -0.4155581, -1.846696, 0, 1, 0.003921569, 1,
-0.3968632, 0.6845098, 1.349509, 0, 1, 0.01176471, 1,
-0.3918516, -0.04565475, -0.6044389, 0, 1, 0.01568628, 1,
-0.3905838, -0.973088, -5.144061, 0, 1, 0.02352941, 1,
-0.3886029, -1.102137, -1.794115, 0, 1, 0.02745098, 1,
-0.3850471, 2.038066, 2.190845, 0, 1, 0.03529412, 1,
-0.383502, -2.035775, -3.572615, 0, 1, 0.03921569, 1,
-0.3827544, 1.350695, -2.332978, 0, 1, 0.04705882, 1,
-0.3676518, -0.7743757, -1.355763, 0, 1, 0.05098039, 1,
-0.3639288, 3.043837, -0.8791898, 0, 1, 0.05882353, 1,
-0.3631659, 0.667886, -3.099411, 0, 1, 0.0627451, 1,
-0.3614763, 0.1431443, 0.0667003, 0, 1, 0.07058824, 1,
-0.3613553, -0.06005596, -2.69734, 0, 1, 0.07450981, 1,
-0.3604893, -0.7412299, -0.7110968, 0, 1, 0.08235294, 1,
-0.3571348, -1.972773, -2.532881, 0, 1, 0.08627451, 1,
-0.3537001, -1.160195, -2.817346, 0, 1, 0.09411765, 1,
-0.3507221, 0.2824347, -1.31866, 0, 1, 0.1019608, 1,
-0.3475288, -0.4342631, -2.840998, 0, 1, 0.1058824, 1,
-0.3470287, 2.605572, 0.6894252, 0, 1, 0.1137255, 1,
-0.3467393, -1.214658, -4.255982, 0, 1, 0.1176471, 1,
-0.3459655, 1.988181, 0.9700458, 0, 1, 0.1254902, 1,
-0.3438651, 1.096521, -1.4915, 0, 1, 0.1294118, 1,
-0.3432048, -1.68025, -3.289045, 0, 1, 0.1372549, 1,
-0.3406276, 0.07598458, -1.53873, 0, 1, 0.1411765, 1,
-0.3369637, 0.0301511, -1.389075, 0, 1, 0.1490196, 1,
-0.3366969, -0.03323476, -1.885309, 0, 1, 0.1529412, 1,
-0.3343729, -1.339514, -0.4584742, 0, 1, 0.1607843, 1,
-0.3317004, 0.9106102, 0.8330265, 0, 1, 0.1647059, 1,
-0.3300771, -1.166837, -3.067081, 0, 1, 0.172549, 1,
-0.3297289, -0.2000506, -2.167152, 0, 1, 0.1764706, 1,
-0.3287488, 0.7380712, -1.49895, 0, 1, 0.1843137, 1,
-0.3281072, -1.573578, -2.721695, 0, 1, 0.1882353, 1,
-0.3251517, 0.05751701, -2.03854, 0, 1, 0.1960784, 1,
-0.3216206, 0.1062431, -0.593255, 0, 1, 0.2039216, 1,
-0.3182661, -2.007635, -1.616502, 0, 1, 0.2078431, 1,
-0.3137346, 0.1212302, -2.06565, 0, 1, 0.2156863, 1,
-0.3099591, 0.3703766, -0.4227192, 0, 1, 0.2196078, 1,
-0.3049966, 0.0919398, 0.209619, 0, 1, 0.227451, 1,
-0.3038998, -0.2568982, -2.729841, 0, 1, 0.2313726, 1,
-0.303777, 0.9696326, -0.6155702, 0, 1, 0.2392157, 1,
-0.3031683, 1.461398, 0.9614041, 0, 1, 0.2431373, 1,
-0.2981437, -0.6849089, -5.9316, 0, 1, 0.2509804, 1,
-0.2942145, 0.9328199, -0.2972404, 0, 1, 0.254902, 1,
-0.2930275, -0.7478702, -2.898533, 0, 1, 0.2627451, 1,
-0.2913319, -0.234758, -1.222632, 0, 1, 0.2666667, 1,
-0.2906362, 0.3731584, -0.6212871, 0, 1, 0.2745098, 1,
-0.287848, 1.165548, 1.392309, 0, 1, 0.2784314, 1,
-0.2867486, -1.541788, -3.478698, 0, 1, 0.2862745, 1,
-0.2866089, -0.3908108, -2.119769, 0, 1, 0.2901961, 1,
-0.2860236, -0.3970257, -2.619742, 0, 1, 0.2980392, 1,
-0.2860006, -1.891018, -5.302306, 0, 1, 0.3058824, 1,
-0.2816582, -0.3404679, -4.576039, 0, 1, 0.3098039, 1,
-0.2776023, 0.4851478, -0.6131086, 0, 1, 0.3176471, 1,
-0.2715938, -1.2508, -1.883574, 0, 1, 0.3215686, 1,
-0.2642456, -1.552748, -2.642094, 0, 1, 0.3294118, 1,
-0.2593946, 0.4455326, -1.088447, 0, 1, 0.3333333, 1,
-0.2589091, -0.1342863, -2.07959, 0, 1, 0.3411765, 1,
-0.2496555, -0.534622, -1.280263, 0, 1, 0.345098, 1,
-0.2490308, -1.880057, -3.178317, 0, 1, 0.3529412, 1,
-0.2476436, 1.783433, 0.9980312, 0, 1, 0.3568628, 1,
-0.2412412, -0.5732663, -0.9726249, 0, 1, 0.3647059, 1,
-0.2407215, -0.6608616, -4.275689, 0, 1, 0.3686275, 1,
-0.2369597, 0.1057739, -1.131261, 0, 1, 0.3764706, 1,
-0.23478, 1.299023, -1.138531, 0, 1, 0.3803922, 1,
-0.2340804, 0.7968269, 0.8309193, 0, 1, 0.3882353, 1,
-0.2311415, 0.4284886, -0.931811, 0, 1, 0.3921569, 1,
-0.2275377, -0.9775305, -3.976541, 0, 1, 0.4, 1,
-0.2253006, -0.4585547, -3.940006, 0, 1, 0.4078431, 1,
-0.2237721, 1.311705, 0.2758538, 0, 1, 0.4117647, 1,
-0.2237084, -0.5240777, -2.187805, 0, 1, 0.4196078, 1,
-0.2233087, -0.5360924, -1.070642, 0, 1, 0.4235294, 1,
-0.2215813, 0.05854659, -1.537163, 0, 1, 0.4313726, 1,
-0.2158152, 0.7876728, -0.1651824, 0, 1, 0.4352941, 1,
-0.2151887, 0.9071898, 0.06431983, 0, 1, 0.4431373, 1,
-0.2150934, 0.7506586, 0.7804087, 0, 1, 0.4470588, 1,
-0.2128757, 1.307502, 1.885251, 0, 1, 0.454902, 1,
-0.2114674, -2.557182, -3.599877, 0, 1, 0.4588235, 1,
-0.2097856, -0.5047464, -3.401443, 0, 1, 0.4666667, 1,
-0.206987, -0.8119631, -3.022307, 0, 1, 0.4705882, 1,
-0.2042456, -0.815176, -0.7243406, 0, 1, 0.4784314, 1,
-0.2027261, 0.5574114, 0.1606247, 0, 1, 0.4823529, 1,
-0.2022337, 1.932254, -0.1234594, 0, 1, 0.4901961, 1,
-0.2013095, 0.7885436, -0.8572694, 0, 1, 0.4941176, 1,
-0.2007715, -0.7150393, -5.119023, 0, 1, 0.5019608, 1,
-0.2007465, -0.4783207, -1.793541, 0, 1, 0.509804, 1,
-0.1945991, 0.7498003, -0.8746712, 0, 1, 0.5137255, 1,
-0.191932, 0.8010423, -0.5943061, 0, 1, 0.5215687, 1,
-0.1859868, 1.337153, -0.777809, 0, 1, 0.5254902, 1,
-0.1841855, 0.4934281, 1.218048, 0, 1, 0.5333334, 1,
-0.1835809, -1.058072, -3.476661, 0, 1, 0.5372549, 1,
-0.1800357, -0.5834755, -2.193003, 0, 1, 0.5450981, 1,
-0.1797651, 0.5912166, -0.3513189, 0, 1, 0.5490196, 1,
-0.1777227, 0.9060581, -0.1345673, 0, 1, 0.5568628, 1,
-0.1766098, -1.730973, -2.995286, 0, 1, 0.5607843, 1,
-0.1737244, -0.6177214, -2.157804, 0, 1, 0.5686275, 1,
-0.1726255, 1.328786, -1.67507, 0, 1, 0.572549, 1,
-0.171552, -0.1124762, -2.944934, 0, 1, 0.5803922, 1,
-0.1673062, -0.1796917, -1.843166, 0, 1, 0.5843138, 1,
-0.165499, -1.267125, -4.355144, 0, 1, 0.5921569, 1,
-0.164599, -0.5882747, -4.323447, 0, 1, 0.5960785, 1,
-0.1613041, -0.7240487, -5.449046, 0, 1, 0.6039216, 1,
-0.1588996, 0.3114482, -0.4803566, 0, 1, 0.6117647, 1,
-0.1583613, -0.549895, -3.446113, 0, 1, 0.6156863, 1,
-0.1572278, -0.3523658, -4.376923, 0, 1, 0.6235294, 1,
-0.1569092, 1.402694, 1.494249, 0, 1, 0.627451, 1,
-0.1561275, -1.548266, -4.46882, 0, 1, 0.6352941, 1,
-0.1560864, 0.1642029, -0.2760274, 0, 1, 0.6392157, 1,
-0.1458198, 0.5398082, -0.4818636, 0, 1, 0.6470588, 1,
-0.1440362, -0.4916303, -1.070633, 0, 1, 0.6509804, 1,
-0.1417246, -0.09578037, -0.9831589, 0, 1, 0.6588235, 1,
-0.1403126, -0.3628062, -3.023553, 0, 1, 0.6627451, 1,
-0.1371039, -1.775447, -4.175416, 0, 1, 0.6705883, 1,
-0.1325627, 0.1185133, -0.5675424, 0, 1, 0.6745098, 1,
-0.1300967, 0.4349856, -0.005851313, 0, 1, 0.682353, 1,
-0.1299578, 0.4108063, -1.498682, 0, 1, 0.6862745, 1,
-0.1262191, 0.0673136, -1.270476, 0, 1, 0.6941177, 1,
-0.1255441, -0.8815879, -2.96027, 0, 1, 0.7019608, 1,
-0.1224372, 1.73916, 0.9350347, 0, 1, 0.7058824, 1,
-0.1219834, 0.1665887, 0.7234421, 0, 1, 0.7137255, 1,
-0.1146909, -3.613684, -4.766962, 0, 1, 0.7176471, 1,
-0.1131343, 0.2629445, -0.9039911, 0, 1, 0.7254902, 1,
-0.1119307, 0.9798385, -0.4371124, 0, 1, 0.7294118, 1,
-0.1104213, -2.128135, -4.319979, 0, 1, 0.7372549, 1,
-0.1092329, 2.094458, 0.3858611, 0, 1, 0.7411765, 1,
-0.1075516, 1.424612, 0.4792595, 0, 1, 0.7490196, 1,
-0.1058878, 1.242555, -0.2867138, 0, 1, 0.7529412, 1,
-0.1049551, 0.04966245, 0.5023147, 0, 1, 0.7607843, 1,
-0.1030182, -1.676051, -2.598565, 0, 1, 0.7647059, 1,
-0.09865674, -1.545376, -2.693651, 0, 1, 0.772549, 1,
-0.09608722, -0.8232317, -3.219217, 0, 1, 0.7764706, 1,
-0.08299169, -0.3898543, -2.612809, 0, 1, 0.7843137, 1,
-0.08231711, -0.1651114, -2.10722, 0, 1, 0.7882353, 1,
-0.0770036, -0.4061101, -0.631094, 0, 1, 0.7960784, 1,
-0.07453062, -1.050859, -4.230239, 0, 1, 0.8039216, 1,
-0.07324427, 0.3679086, 0.1893549, 0, 1, 0.8078431, 1,
-0.06780913, -0.2251642, -1.340308, 0, 1, 0.8156863, 1,
-0.06167789, 0.6468948, -1.339449, 0, 1, 0.8196079, 1,
-0.06116578, 0.2648298, 0.1292865, 0, 1, 0.827451, 1,
-0.05822, 0.2342724, -0.2923505, 0, 1, 0.8313726, 1,
-0.05712447, -0.644372, -2.164069, 0, 1, 0.8392157, 1,
-0.056298, -0.5947002, -2.305541, 0, 1, 0.8431373, 1,
-0.04371902, 1.53723, -0.4201317, 0, 1, 0.8509804, 1,
-0.04342668, 1.437946, -0.3018056, 0, 1, 0.854902, 1,
-0.04233623, -0.3289092, -3.478837, 0, 1, 0.8627451, 1,
-0.04195581, 0.7206017, -1.194, 0, 1, 0.8666667, 1,
-0.04149438, 0.2775818, -1.995793, 0, 1, 0.8745098, 1,
-0.04131592, -0.6259412, -2.528329, 0, 1, 0.8784314, 1,
-0.04095499, 1.170176, -0.2357888, 0, 1, 0.8862745, 1,
-0.03828837, -0.6340646, -4.454209, 0, 1, 0.8901961, 1,
-0.03666128, -0.483007, -3.036313, 0, 1, 0.8980392, 1,
-0.03557254, 0.4039887, 1.55454, 0, 1, 0.9058824, 1,
-0.03507053, -1.105696, -3.620905, 0, 1, 0.9098039, 1,
-0.03186791, 0.3987851, 0.08930258, 0, 1, 0.9176471, 1,
-0.0297138, -0.9713028, -4.056796, 0, 1, 0.9215686, 1,
-0.02969738, -1.080291, -2.251295, 0, 1, 0.9294118, 1,
-0.02792605, 0.5428869, -1.280678, 0, 1, 0.9333333, 1,
-0.02657748, -0.8322955, -4.206283, 0, 1, 0.9411765, 1,
-0.02560078, 0.4493822, -2.536091, 0, 1, 0.945098, 1,
-0.01792845, 1.059907, -0.1555272, 0, 1, 0.9529412, 1,
-0.01596356, -0.9539478, -2.462626, 0, 1, 0.9568627, 1,
-0.0123383, -1.020718, -4.046033, 0, 1, 0.9647059, 1,
-0.01153438, -1.357391, -3.156922, 0, 1, 0.9686275, 1,
-0.009260505, 0.370588, -1.75363, 0, 1, 0.9764706, 1,
-0.006715426, 1.011409, -1.186648, 0, 1, 0.9803922, 1,
-0.004915735, 0.08822966, 1.143434, 0, 1, 0.9882353, 1,
-0.003681433, -1.055651, -4.188294, 0, 1, 0.9921569, 1,
0.002566853, -0.03734756, 3.355568, 0, 1, 1, 1,
0.01330891, 1.436094, -0.5500477, 0, 0.9921569, 1, 1,
0.01410941, -0.2062868, 3.958129, 0, 0.9882353, 1, 1,
0.01446792, 0.001298317, 0.8474274, 0, 0.9803922, 1, 1,
0.01465976, 1.068241, -0.1978928, 0, 0.9764706, 1, 1,
0.01488358, 0.7862495, 1.968239, 0, 0.9686275, 1, 1,
0.01497916, 2.200139, 0.4453705, 0, 0.9647059, 1, 1,
0.0152301, 0.5458703, 0.7603689, 0, 0.9568627, 1, 1,
0.01588322, 0.948793, -1.469485, 0, 0.9529412, 1, 1,
0.0193537, 1.081759, 0.1536198, 0, 0.945098, 1, 1,
0.03260345, -0.5651014, 2.281684, 0, 0.9411765, 1, 1,
0.0331238, 0.3434874, -0.5415576, 0, 0.9333333, 1, 1,
0.03375798, 0.713971, 0.2790418, 0, 0.9294118, 1, 1,
0.03426297, -1.922585, 2.911584, 0, 0.9215686, 1, 1,
0.03551451, -1.993854, 4.191324, 0, 0.9176471, 1, 1,
0.03793674, -1.979692, 1.602233, 0, 0.9098039, 1, 1,
0.03949698, -0.00155079, 1.685896, 0, 0.9058824, 1, 1,
0.03999482, 0.551093, 0.09715746, 0, 0.8980392, 1, 1,
0.04982349, -2.196357, 3.672972, 0, 0.8901961, 1, 1,
0.05498649, 0.337111, -1.026383, 0, 0.8862745, 1, 1,
0.05571176, 0.1825639, 0.5004594, 0, 0.8784314, 1, 1,
0.05682455, 0.6183906, 1.226727, 0, 0.8745098, 1, 1,
0.05751427, -1.528485, 2.563784, 0, 0.8666667, 1, 1,
0.05986335, 0.4316748, -0.3781697, 0, 0.8627451, 1, 1,
0.06221033, -0.2527274, 2.252181, 0, 0.854902, 1, 1,
0.06227291, 1.719235, -1.259181, 0, 0.8509804, 1, 1,
0.06520172, -0.05612322, 1.164609, 0, 0.8431373, 1, 1,
0.06934979, 0.2621715, -1.126461, 0, 0.8392157, 1, 1,
0.07661022, 0.4052662, 0.5089716, 0, 0.8313726, 1, 1,
0.07924125, 1.230235, 1.141443, 0, 0.827451, 1, 1,
0.08621565, -0.6741704, 2.045596, 0, 0.8196079, 1, 1,
0.08907131, -0.2425868, 2.315498, 0, 0.8156863, 1, 1,
0.09046803, 0.4788409, -0.1018806, 0, 0.8078431, 1, 1,
0.09064662, -0.9140036, 2.391971, 0, 0.8039216, 1, 1,
0.09274553, 0.2416052, 0.3237068, 0, 0.7960784, 1, 1,
0.1005342, 1.730687, -1.566085, 0, 0.7882353, 1, 1,
0.1005352, 0.9430815, -0.4928126, 0, 0.7843137, 1, 1,
0.1026207, -1.296324, 3.715135, 0, 0.7764706, 1, 1,
0.1044857, 1.657045, -0.08087705, 0, 0.772549, 1, 1,
0.1101706, -0.759207, 3.172108, 0, 0.7647059, 1, 1,
0.1129089, 0.05002714, -0.227077, 0, 0.7607843, 1, 1,
0.1140655, 0.1490116, 2.444307, 0, 0.7529412, 1, 1,
0.1169646, 0.8322303, 0.9485189, 0, 0.7490196, 1, 1,
0.1186263, -1.212844, 1.848934, 0, 0.7411765, 1, 1,
0.126544, -0.6913379, 3.213817, 0, 0.7372549, 1, 1,
0.1274938, -1.547853, 4.13979, 0, 0.7294118, 1, 1,
0.1282742, -0.7460851, 2.258316, 0, 0.7254902, 1, 1,
0.1294113, -0.726463, 2.460925, 0, 0.7176471, 1, 1,
0.1298088, -0.2611889, 2.57937, 0, 0.7137255, 1, 1,
0.1298872, 1.043709, 0.7847378, 0, 0.7058824, 1, 1,
0.1365163, 1.896864, -1.428634, 0, 0.6980392, 1, 1,
0.1367276, 1.49596, 2.459414, 0, 0.6941177, 1, 1,
0.1387271, -0.1103045, 3.400582, 0, 0.6862745, 1, 1,
0.1405643, -0.03876612, 0.8085568, 0, 0.682353, 1, 1,
0.1406446, 0.8368078, -0.2614632, 0, 0.6745098, 1, 1,
0.1417877, -0.4995935, 2.945392, 0, 0.6705883, 1, 1,
0.1420277, 1.320653, 0.9932103, 0, 0.6627451, 1, 1,
0.1424779, -0.3823187, 2.442737, 0, 0.6588235, 1, 1,
0.1439472, -1.08147, 1.247711, 0, 0.6509804, 1, 1,
0.1486926, 0.4226034, 1.483575, 0, 0.6470588, 1, 1,
0.1534834, -0.2518438, 1.944791, 0, 0.6392157, 1, 1,
0.1551256, -1.095429, 4.463464, 0, 0.6352941, 1, 1,
0.1613367, 0.377735, -0.4416661, 0, 0.627451, 1, 1,
0.1620904, 0.06657381, 0.6383153, 0, 0.6235294, 1, 1,
0.1635908, -1.031561, 4.707104, 0, 0.6156863, 1, 1,
0.1644695, 1.290275, 1.97794, 0, 0.6117647, 1, 1,
0.1645658, 0.04570849, 0.1854343, 0, 0.6039216, 1, 1,
0.1696017, -1.580412, 3.374398, 0, 0.5960785, 1, 1,
0.1702093, -1.549334, 3.768718, 0, 0.5921569, 1, 1,
0.1723685, 0.4612525, 1.556314, 0, 0.5843138, 1, 1,
0.1764968, -0.5859991, 3.104569, 0, 0.5803922, 1, 1,
0.1841219, -0.03551491, 2.664184, 0, 0.572549, 1, 1,
0.1858971, 0.008248542, 1.489969, 0, 0.5686275, 1, 1,
0.1885623, 0.03919964, 1.921386, 0, 0.5607843, 1, 1,
0.1900033, 1.251319, 1.618888, 0, 0.5568628, 1, 1,
0.1920358, 0.2485443, 1.888035, 0, 0.5490196, 1, 1,
0.1928867, -0.07093749, 0.1889796, 0, 0.5450981, 1, 1,
0.1971026, 0.09638109, -0.02460635, 0, 0.5372549, 1, 1,
0.1978887, -0.9463133, 3.196263, 0, 0.5333334, 1, 1,
0.2001996, -1.190375, 3.633516, 0, 0.5254902, 1, 1,
0.2005578, 0.774515, 1.337004, 0, 0.5215687, 1, 1,
0.202673, 1.133714, 0.3430406, 0, 0.5137255, 1, 1,
0.2055354, 1.3423, -0.9352258, 0, 0.509804, 1, 1,
0.2081532, -0.1594942, 1.314646, 0, 0.5019608, 1, 1,
0.2091967, -0.3327537, 2.120656, 0, 0.4941176, 1, 1,
0.2118944, 0.8930811, -0.1588343, 0, 0.4901961, 1, 1,
0.2149403, 3.050068, 0.2626069, 0, 0.4823529, 1, 1,
0.2172832, 1.597696, 0.7369843, 0, 0.4784314, 1, 1,
0.2213829, 0.6224129, 0.3612021, 0, 0.4705882, 1, 1,
0.2231391, 1.526723, 0.4357999, 0, 0.4666667, 1, 1,
0.2241424, 0.235822, -0.3999665, 0, 0.4588235, 1, 1,
0.2316432, 1.102257, 0.09795598, 0, 0.454902, 1, 1,
0.232066, 0.1136529, 1.871592, 0, 0.4470588, 1, 1,
0.2323038, 1.892649, -1.736128, 0, 0.4431373, 1, 1,
0.2409736, 0.4484726, 0.7524764, 0, 0.4352941, 1, 1,
0.2442104, -0.7213315, 2.47776, 0, 0.4313726, 1, 1,
0.2449251, 0.3825086, -0.8098041, 0, 0.4235294, 1, 1,
0.2455709, 0.5022882, 1.159114, 0, 0.4196078, 1, 1,
0.2476184, 0.6086909, 1.309557, 0, 0.4117647, 1, 1,
0.2483762, -0.3117029, 3.907078, 0, 0.4078431, 1, 1,
0.2573119, -0.440789, 2.480079, 0, 0.4, 1, 1,
0.2621295, -2.193102, 3.512641, 0, 0.3921569, 1, 1,
0.2675477, -0.4223198, 2.256331, 0, 0.3882353, 1, 1,
0.2782294, -1.637185, 3.034843, 0, 0.3803922, 1, 1,
0.2816308, -0.4742224, 2.448371, 0, 0.3764706, 1, 1,
0.2927494, 0.7382247, -1.777204, 0, 0.3686275, 1, 1,
0.29452, -1.383848, 3.095747, 0, 0.3647059, 1, 1,
0.2946686, 0.5205566, 0.1849466, 0, 0.3568628, 1, 1,
0.2954679, 0.5964221, 0.4150139, 0, 0.3529412, 1, 1,
0.2979696, 0.6737595, 1.729744, 0, 0.345098, 1, 1,
0.2995948, -0.1378364, 4.017447, 0, 0.3411765, 1, 1,
0.3002482, 1.064161, 1.387914, 0, 0.3333333, 1, 1,
0.3013985, -0.04108319, 1.904346, 0, 0.3294118, 1, 1,
0.302006, -0.3693701, 2.550198, 0, 0.3215686, 1, 1,
0.3050729, -0.3200284, 2.854762, 0, 0.3176471, 1, 1,
0.3081903, 0.07363424, 2.611433, 0, 0.3098039, 1, 1,
0.3120573, 0.0375392, 2.093402, 0, 0.3058824, 1, 1,
0.3121099, 0.09205111, 1.413536, 0, 0.2980392, 1, 1,
0.312536, -0.3294734, 1.432767, 0, 0.2901961, 1, 1,
0.313011, -0.7970543, 2.772162, 0, 0.2862745, 1, 1,
0.3194946, -0.3670391, 1.602821, 0, 0.2784314, 1, 1,
0.3239631, 0.6979389, 1.355084, 0, 0.2745098, 1, 1,
0.3300628, 0.09312113, 1.670282, 0, 0.2666667, 1, 1,
0.3349354, -1.20553, 3.151209, 0, 0.2627451, 1, 1,
0.3365327, -0.1656016, 1.770807, 0, 0.254902, 1, 1,
0.3405387, 0.9397237, 0.7106508, 0, 0.2509804, 1, 1,
0.3458028, -0.7662771, 2.928699, 0, 0.2431373, 1, 1,
0.3462836, -0.6341356, 3.760648, 0, 0.2392157, 1, 1,
0.3469888, 0.5124291, 2.663391, 0, 0.2313726, 1, 1,
0.3547301, 0.8798494, 0.2320762, 0, 0.227451, 1, 1,
0.3589908, -0.644689, 1.881409, 0, 0.2196078, 1, 1,
0.3609239, -0.2673342, 4.046746, 0, 0.2156863, 1, 1,
0.3637747, 0.1460428, 2.700092, 0, 0.2078431, 1, 1,
0.3639704, 0.1000144, 2.747749, 0, 0.2039216, 1, 1,
0.36478, 2.052347, 0.8903328, 0, 0.1960784, 1, 1,
0.3647956, 1.359163, 0.5961739, 0, 0.1882353, 1, 1,
0.364888, 0.4775724, 1.295025, 0, 0.1843137, 1, 1,
0.366597, 0.2432889, 2.332847, 0, 0.1764706, 1, 1,
0.3671692, -0.7019799, 1.838059, 0, 0.172549, 1, 1,
0.3686429, 1.21514, -1.126575, 0, 0.1647059, 1, 1,
0.3693486, 0.9436072, -0.520318, 0, 0.1607843, 1, 1,
0.372436, 0.4357405, -0.1674857, 0, 0.1529412, 1, 1,
0.3757278, -0.3764801, 2.117928, 0, 0.1490196, 1, 1,
0.3757313, 2.037717, 0.9578108, 0, 0.1411765, 1, 1,
0.3788837, -0.6173269, 3.29204, 0, 0.1372549, 1, 1,
0.3793142, -0.07283369, 0.5886786, 0, 0.1294118, 1, 1,
0.3795629, 1.359295, 0.02786524, 0, 0.1254902, 1, 1,
0.3824484, 0.4747722, 0.7809864, 0, 0.1176471, 1, 1,
0.3836803, 0.3236838, 2.422212, 0, 0.1137255, 1, 1,
0.3849695, 0.8579879, -0.9486483, 0, 0.1058824, 1, 1,
0.3852459, 0.261962, 0.5936348, 0, 0.09803922, 1, 1,
0.3904592, -0.1562905, 0.6349242, 0, 0.09411765, 1, 1,
0.3968705, 0.3552858, 1.844585, 0, 0.08627451, 1, 1,
0.4004592, -1.205911, 2.468904, 0, 0.08235294, 1, 1,
0.4031646, -1.172588, 3.50844, 0, 0.07450981, 1, 1,
0.4065759, 0.9281248, 1.254996, 0, 0.07058824, 1, 1,
0.4093432, 0.4391094, 1.950502, 0, 0.0627451, 1, 1,
0.4101526, 1.804344, -0.2104129, 0, 0.05882353, 1, 1,
0.4113186, 0.257027, 0.9944785, 0, 0.05098039, 1, 1,
0.4122778, -1.269146, 2.6216, 0, 0.04705882, 1, 1,
0.4162202, 0.329027, 0.6913768, 0, 0.03921569, 1, 1,
0.418215, 0.139746, 2.412097, 0, 0.03529412, 1, 1,
0.4221357, 0.1876428, 2.581422, 0, 0.02745098, 1, 1,
0.4225974, 0.4471012, 1.056288, 0, 0.02352941, 1, 1,
0.4274418, 0.8297292, 0.7212731, 0, 0.01568628, 1, 1,
0.4277909, -0.003297065, 2.952543, 0, 0.01176471, 1, 1,
0.4341872, -0.3235457, 0.8006383, 0, 0.003921569, 1, 1,
0.4381898, -0.08768634, 0.565447, 0.003921569, 0, 1, 1,
0.4479165, 0.1305831, 1.698813, 0.007843138, 0, 1, 1,
0.4487261, -1.586829, 2.278393, 0.01568628, 0, 1, 1,
0.4492388, 0.2557516, 1.415596, 0.01960784, 0, 1, 1,
0.4524288, -1.387428, 2.000265, 0.02745098, 0, 1, 1,
0.4549112, 0.4727938, 0.9176379, 0.03137255, 0, 1, 1,
0.4572612, 1.331208, 0.6075039, 0.03921569, 0, 1, 1,
0.4589574, -0.3363324, 3.206004, 0.04313726, 0, 1, 1,
0.4642729, -0.4327263, 1.968441, 0.05098039, 0, 1, 1,
0.4648752, -0.7025309, 2.043349, 0.05490196, 0, 1, 1,
0.4676678, -1.174619, 2.807233, 0.0627451, 0, 1, 1,
0.4682197, -0.6132185, 1.562211, 0.06666667, 0, 1, 1,
0.4720506, -0.7847717, 3.97459, 0.07450981, 0, 1, 1,
0.4738392, 1.365358, -0.2084446, 0.07843138, 0, 1, 1,
0.4748293, 1.8139, 0.2525166, 0.08627451, 0, 1, 1,
0.4757758, 2.219769, 1.378116, 0.09019608, 0, 1, 1,
0.4826842, 1.366993, 1.622714, 0.09803922, 0, 1, 1,
0.4836114, 0.7958102, 1.965065, 0.1058824, 0, 1, 1,
0.486666, -0.7492321, 2.363023, 0.1098039, 0, 1, 1,
0.4886773, 0.5375435, -0.04164582, 0.1176471, 0, 1, 1,
0.4891581, 1.330521, 0.7604141, 0.1215686, 0, 1, 1,
0.4894206, -0.4160393, 1.982115, 0.1294118, 0, 1, 1,
0.4900394, -0.8209708, 2.499558, 0.1333333, 0, 1, 1,
0.4928228, 0.3142773, 1.234917, 0.1411765, 0, 1, 1,
0.4934015, -0.9782169, 2.177328, 0.145098, 0, 1, 1,
0.4953296, -0.2550163, 1.520298, 0.1529412, 0, 1, 1,
0.4993369, -0.2041056, 2.559606, 0.1568628, 0, 1, 1,
0.4999007, 0.04621758, 2.353523, 0.1647059, 0, 1, 1,
0.5013557, -1.588272, 2.617538, 0.1686275, 0, 1, 1,
0.5068652, 0.4324365, 0.9678971, 0.1764706, 0, 1, 1,
0.5080484, -1.839349, 1.865035, 0.1803922, 0, 1, 1,
0.5088688, -1.3294, 3.736578, 0.1882353, 0, 1, 1,
0.5167553, 0.8561133, 1.069624, 0.1921569, 0, 1, 1,
0.529215, 0.2367436, 2.755293, 0.2, 0, 1, 1,
0.5313933, -0.9148479, 3.067781, 0.2078431, 0, 1, 1,
0.5319764, -1.55282, 1.938319, 0.2117647, 0, 1, 1,
0.5328587, 0.694759, 0.8362648, 0.2196078, 0, 1, 1,
0.5428255, 0.249502, 0.5949048, 0.2235294, 0, 1, 1,
0.5470789, -1.51173, 3.497632, 0.2313726, 0, 1, 1,
0.5494545, 0.2943457, 1.362117, 0.2352941, 0, 1, 1,
0.5498197, -0.007140876, 1.764219, 0.2431373, 0, 1, 1,
0.5534998, -0.9739265, 4.013774, 0.2470588, 0, 1, 1,
0.5635097, -0.6807117, 2.809493, 0.254902, 0, 1, 1,
0.5643727, -0.287856, 0.2662116, 0.2588235, 0, 1, 1,
0.5678854, 1.173921, -0.2297318, 0.2666667, 0, 1, 1,
0.571817, -1.05686, 3.732056, 0.2705882, 0, 1, 1,
0.5771034, -0.6578485, 2.876213, 0.2784314, 0, 1, 1,
0.5798051, -1.187203, 4.157285, 0.282353, 0, 1, 1,
0.5805733, 0.6223257, 0.0679579, 0.2901961, 0, 1, 1,
0.5812779, -1.670121, 3.490026, 0.2941177, 0, 1, 1,
0.5914949, -0.6073039, 3.835504, 0.3019608, 0, 1, 1,
0.5997153, 0.1057891, 2.221836, 0.3098039, 0, 1, 1,
0.6038443, -0.9458873, 2.668042, 0.3137255, 0, 1, 1,
0.6056022, -0.32354, 1.279505, 0.3215686, 0, 1, 1,
0.612194, 0.5236914, 0.8888685, 0.3254902, 0, 1, 1,
0.6139823, -0.1430528, 2.364022, 0.3333333, 0, 1, 1,
0.6144808, -1.670799, 3.056768, 0.3372549, 0, 1, 1,
0.6147051, 0.334582, 1.319238, 0.345098, 0, 1, 1,
0.6213591, 1.851068, 1.556176, 0.3490196, 0, 1, 1,
0.6233376, -0.4906294, 2.281755, 0.3568628, 0, 1, 1,
0.6237779, -1.259184, 2.241292, 0.3607843, 0, 1, 1,
0.6269698, -0.8720865, 3.539492, 0.3686275, 0, 1, 1,
0.6359743, -0.4536667, 2.340944, 0.372549, 0, 1, 1,
0.6442527, -3.539711, 2.558603, 0.3803922, 0, 1, 1,
0.6503471, -0.2057388, 0.7303076, 0.3843137, 0, 1, 1,
0.6522313, 1.038338, 0.5976871, 0.3921569, 0, 1, 1,
0.6527089, 0.5923983, -0.9450672, 0.3960784, 0, 1, 1,
0.6532138, -0.4664391, 2.1687, 0.4039216, 0, 1, 1,
0.6557591, -1.227411, 3.703234, 0.4117647, 0, 1, 1,
0.6633097, 0.3030452, 0.4014124, 0.4156863, 0, 1, 1,
0.6653147, -0.9289682, 3.896302, 0.4235294, 0, 1, 1,
0.6668232, -0.8265239, 2.509291, 0.427451, 0, 1, 1,
0.6673052, -0.05043202, 1.238198, 0.4352941, 0, 1, 1,
0.6674852, 0.3262862, -0.8481653, 0.4392157, 0, 1, 1,
0.6681427, 0.8817192, 0.8153735, 0.4470588, 0, 1, 1,
0.6684704, -0.1181404, 1.726625, 0.4509804, 0, 1, 1,
0.6735787, -0.01465436, 0.9424461, 0.4588235, 0, 1, 1,
0.6783785, 0.03744753, 1.299079, 0.4627451, 0, 1, 1,
0.6784532, -0.3222027, 2.910922, 0.4705882, 0, 1, 1,
0.6812372, -0.4660716, 2.828289, 0.4745098, 0, 1, 1,
0.6828159, -0.06604237, 0.432926, 0.4823529, 0, 1, 1,
0.6836054, 1.089032, 1.555451, 0.4862745, 0, 1, 1,
0.687491, 0.3290249, 1.732733, 0.4941176, 0, 1, 1,
0.6888986, 0.03881082, 0.1480735, 0.5019608, 0, 1, 1,
0.6926324, -2.480976, 1.793338, 0.5058824, 0, 1, 1,
0.6967171, -1.480576, 2.413707, 0.5137255, 0, 1, 1,
0.697668, -1.555542, 3.493803, 0.5176471, 0, 1, 1,
0.7024319, -0.8393126, 4.113708, 0.5254902, 0, 1, 1,
0.7035826, -2.593837, 2.840222, 0.5294118, 0, 1, 1,
0.707728, 1.448565, 0.6157306, 0.5372549, 0, 1, 1,
0.71094, 1.470763, 0.5650449, 0.5411765, 0, 1, 1,
0.7138599, -0.7195312, 3.714954, 0.5490196, 0, 1, 1,
0.7186966, 1.081038, 1.095379, 0.5529412, 0, 1, 1,
0.7195626, 1.525882, -0.893476, 0.5607843, 0, 1, 1,
0.7229159, 0.248149, 1.049756, 0.5647059, 0, 1, 1,
0.7247723, 0.577433, 2.058949, 0.572549, 0, 1, 1,
0.7286987, 0.1358527, -0.4868278, 0.5764706, 0, 1, 1,
0.7295391, -0.2511907, 2.966105, 0.5843138, 0, 1, 1,
0.7298777, 0.4968649, 1.404353, 0.5882353, 0, 1, 1,
0.7378798, 0.09909003, 0.6684685, 0.5960785, 0, 1, 1,
0.7447888, 1.10721, -1.866776, 0.6039216, 0, 1, 1,
0.7491117, -0.586886, 1.852946, 0.6078432, 0, 1, 1,
0.7493767, -1.136012, 0.9113828, 0.6156863, 0, 1, 1,
0.7577447, -0.4555322, 1.597722, 0.6196079, 0, 1, 1,
0.7584797, -0.5911173, 2.349995, 0.627451, 0, 1, 1,
0.7648115, 0.04807604, 3.203032, 0.6313726, 0, 1, 1,
0.7650252, -0.5372221, 1.479881, 0.6392157, 0, 1, 1,
0.7689204, -0.5749739, 2.587803, 0.6431373, 0, 1, 1,
0.7712912, 0.1893975, 2.1993, 0.6509804, 0, 1, 1,
0.7713355, -0.9383297, 2.136213, 0.654902, 0, 1, 1,
0.7795281, 0.01937513, 0.8949372, 0.6627451, 0, 1, 1,
0.7815458, 0.09129498, 0.305618, 0.6666667, 0, 1, 1,
0.7822053, -0.978088, 1.358749, 0.6745098, 0, 1, 1,
0.7842581, 0.1439159, 3.863859, 0.6784314, 0, 1, 1,
0.7867299, 0.8932635, -0.180109, 0.6862745, 0, 1, 1,
0.7911205, 1.266099, 1.347866, 0.6901961, 0, 1, 1,
0.8046452, 1.680013, 1.241015, 0.6980392, 0, 1, 1,
0.8047615, 0.4346021, 1.514849, 0.7058824, 0, 1, 1,
0.8052896, 1.821609, -0.2268278, 0.7098039, 0, 1, 1,
0.8064141, -0.7464106, 2.000081, 0.7176471, 0, 1, 1,
0.8113751, -0.601252, 2.805128, 0.7215686, 0, 1, 1,
0.81249, 0.7818345, 0.7584759, 0.7294118, 0, 1, 1,
0.8254807, -0.1136463, 2.299052, 0.7333333, 0, 1, 1,
0.8282595, 1.019356, -0.5090066, 0.7411765, 0, 1, 1,
0.8299448, -0.6011832, 2.829061, 0.7450981, 0, 1, 1,
0.8303904, 1.963804, 0.9978066, 0.7529412, 0, 1, 1,
0.8336591, 1.086933, -1.072789, 0.7568628, 0, 1, 1,
0.836457, -0.9424044, 2.645082, 0.7647059, 0, 1, 1,
0.8381056, -0.4153243, 3.232255, 0.7686275, 0, 1, 1,
0.8389401, 0.4179214, 2.084758, 0.7764706, 0, 1, 1,
0.8392418, 0.4061581, 1.839908, 0.7803922, 0, 1, 1,
0.8392869, 0.1947961, 1.819693, 0.7882353, 0, 1, 1,
0.8401954, -0.9554842, 1.058128, 0.7921569, 0, 1, 1,
0.844157, -1.527889, 2.154428, 0.8, 0, 1, 1,
0.8467003, 0.879546, -0.7475202, 0.8078431, 0, 1, 1,
0.8530858, 0.07941688, 3.829504, 0.8117647, 0, 1, 1,
0.855958, 0.1332205, 3.938158, 0.8196079, 0, 1, 1,
0.8583919, 2.0697, 1.351886, 0.8235294, 0, 1, 1,
0.8606139, -0.9018834, 4.722194, 0.8313726, 0, 1, 1,
0.8623532, 1.278742, 0.5247619, 0.8352941, 0, 1, 1,
0.8627666, -0.2788554, 2.270141, 0.8431373, 0, 1, 1,
0.8644543, -0.275403, 2.200501, 0.8470588, 0, 1, 1,
0.866809, -0.8248345, 3.310757, 0.854902, 0, 1, 1,
0.8671272, 1.177636, -0.01402502, 0.8588235, 0, 1, 1,
0.867752, 3.195594, -2.13439, 0.8666667, 0, 1, 1,
0.8677521, 0.545234, 0.9590949, 0.8705882, 0, 1, 1,
0.8680366, 0.3655262, 1.778617, 0.8784314, 0, 1, 1,
0.8687229, 1.44127, 2.369124, 0.8823529, 0, 1, 1,
0.8704079, -0.6661017, 2.681021, 0.8901961, 0, 1, 1,
0.8773911, -0.4228702, 1.289487, 0.8941177, 0, 1, 1,
0.8793534, 0.6522006, 1.520766, 0.9019608, 0, 1, 1,
0.8813258, 0.4232236, 1.150388, 0.9098039, 0, 1, 1,
0.882912, -1.420468, 4.29774, 0.9137255, 0, 1, 1,
0.8848035, 0.3004705, 1.221357, 0.9215686, 0, 1, 1,
0.8888658, 2.4394, 1.197792, 0.9254902, 0, 1, 1,
0.8977404, 0.8473663, 0.1881939, 0.9333333, 0, 1, 1,
0.8979001, 0.8315083, 2.001671, 0.9372549, 0, 1, 1,
0.9025496, -0.615985, 2.415826, 0.945098, 0, 1, 1,
0.9043629, 0.2295684, 1.385194, 0.9490196, 0, 1, 1,
0.9067374, 0.8111657, 0.198409, 0.9568627, 0, 1, 1,
0.9082624, 2.522337, -1.763169, 0.9607843, 0, 1, 1,
0.9196754, 0.04877051, 1.891821, 0.9686275, 0, 1, 1,
0.9198821, -2.5409, 2.804824, 0.972549, 0, 1, 1,
0.9255249, 0.007162027, 0.7857291, 0.9803922, 0, 1, 1,
0.9267672, 0.1074625, 2.227637, 0.9843137, 0, 1, 1,
0.931901, -1.418359, 2.371076, 0.9921569, 0, 1, 1,
0.9335582, 0.861751, 0.8321635, 0.9960784, 0, 1, 1,
0.9375883, -0.04430277, 2.214399, 1, 0, 0.9960784, 1,
0.9402785, 1.165063, 2.115482, 1, 0, 0.9882353, 1,
0.9432715, -0.04426746, 1.074726, 1, 0, 0.9843137, 1,
0.9446733, 0.2508597, 1.862424, 1, 0, 0.9764706, 1,
0.9459453, 1.539851, 0.26571, 1, 0, 0.972549, 1,
0.948794, -0.8501266, 3.926156, 1, 0, 0.9647059, 1,
0.9503115, 0.1747542, 2.347327, 1, 0, 0.9607843, 1,
0.9526866, 0.5089207, 2.916299, 1, 0, 0.9529412, 1,
0.9652923, -0.3771006, 0.2139794, 1, 0, 0.9490196, 1,
0.9817742, -0.1247768, 2.519533, 1, 0, 0.9411765, 1,
0.9882964, 0.5357666, 0.3179097, 1, 0, 0.9372549, 1,
0.9892248, 0.8057368, -0.561461, 1, 0, 0.9294118, 1,
0.9929332, -1.056092, 2.789776, 1, 0, 0.9254902, 1,
0.9946249, 0.1426225, 0.2785033, 1, 0, 0.9176471, 1,
0.9982932, 1.027913, 1.917962, 1, 0, 0.9137255, 1,
1.001487, 0.06038587, 1.064187, 1, 0, 0.9058824, 1,
1.010639, -0.0282438, 1.793977, 1, 0, 0.9019608, 1,
1.016017, 0.7835888, 2.385211, 1, 0, 0.8941177, 1,
1.018913, 1.620112, 0.1082062, 1, 0, 0.8862745, 1,
1.022197, -0.0755671, 1.501749, 1, 0, 0.8823529, 1,
1.022763, -0.6894505, 2.68583, 1, 0, 0.8745098, 1,
1.031413, -0.8427421, 3.617457, 1, 0, 0.8705882, 1,
1.043156, 0.9998312, 1.135062, 1, 0, 0.8627451, 1,
1.043239, 0.1641488, 1.287769, 1, 0, 0.8588235, 1,
1.06396, 1.463615, -0.4903516, 1, 0, 0.8509804, 1,
1.066568, -0.9411141, 1.479281, 1, 0, 0.8470588, 1,
1.074525, 0.9222119, 1.561505, 1, 0, 0.8392157, 1,
1.076816, -0.9335417, 0.2260631, 1, 0, 0.8352941, 1,
1.077071, -0.7546775, 1.976374, 1, 0, 0.827451, 1,
1.084361, 0.1937851, 1.636143, 1, 0, 0.8235294, 1,
1.088715, 0.1926196, 1.705531, 1, 0, 0.8156863, 1,
1.090215, -3.512927, 4.026528, 1, 0, 0.8117647, 1,
1.095515, 0.04093352, 0.07554469, 1, 0, 0.8039216, 1,
1.096243, 0.6231495, 0.8752209, 1, 0, 0.7960784, 1,
1.099629, -1.190046, 0.04794927, 1, 0, 0.7921569, 1,
1.103956, -1.006005, 2.389425, 1, 0, 0.7843137, 1,
1.130481, 0.3495983, 0.9907141, 1, 0, 0.7803922, 1,
1.135116, 0.9472629, 1.440667, 1, 0, 0.772549, 1,
1.136973, 2.22084, 0.718484, 1, 0, 0.7686275, 1,
1.141019, 0.5021687, 0.03993196, 1, 0, 0.7607843, 1,
1.142099, 0.06156293, 2.640623, 1, 0, 0.7568628, 1,
1.161427, -0.634517, 1.942892, 1, 0, 0.7490196, 1,
1.163105, 0.2477476, 0.9979686, 1, 0, 0.7450981, 1,
1.168741, 1.529208, 1.160924, 1, 0, 0.7372549, 1,
1.174376, -0.2805537, 2.437772, 1, 0, 0.7333333, 1,
1.178032, 0.2853955, 1.4446, 1, 0, 0.7254902, 1,
1.178798, -0.08371893, 3.756322, 1, 0, 0.7215686, 1,
1.18353, -0.2694641, 2.060492, 1, 0, 0.7137255, 1,
1.18925, 0.3371861, 1.373639, 1, 0, 0.7098039, 1,
1.191481, 1.040724, 0.1113537, 1, 0, 0.7019608, 1,
1.192532, 1.66697, 0.1304508, 1, 0, 0.6941177, 1,
1.199584, -0.2954865, 1.366467, 1, 0, 0.6901961, 1,
1.203878, -0.1911293, 1.390323, 1, 0, 0.682353, 1,
1.210262, -0.3551019, 2.97693, 1, 0, 0.6784314, 1,
1.219187, -0.4043772, 1.751117, 1, 0, 0.6705883, 1,
1.226603, 0.4534741, 1.26287, 1, 0, 0.6666667, 1,
1.230784, 0.03270661, 1.863473, 1, 0, 0.6588235, 1,
1.232418, 1.259308, 1.976452, 1, 0, 0.654902, 1,
1.233799, -0.9921252, -0.006340818, 1, 0, 0.6470588, 1,
1.235911, -0.8276704, 1.913352, 1, 0, 0.6431373, 1,
1.236962, -0.2936119, 1.823581, 1, 0, 0.6352941, 1,
1.241515, -1.392304, 2.147789, 1, 0, 0.6313726, 1,
1.2476, -0.9013167, 1.37944, 1, 0, 0.6235294, 1,
1.249206, -0.8274632, 2.464212, 1, 0, 0.6196079, 1,
1.24922, 0.6848862, 1.635005, 1, 0, 0.6117647, 1,
1.249434, -1.032686, 3.299708, 1, 0, 0.6078432, 1,
1.251427, -1.109456, 1.382381, 1, 0, 0.6, 1,
1.252801, -0.762242, 4.038259, 1, 0, 0.5921569, 1,
1.257258, -1.461035, 2.63914, 1, 0, 0.5882353, 1,
1.260501, 0.3689535, 1.160536, 1, 0, 0.5803922, 1,
1.262286, 0.8804212, 3.815572, 1, 0, 0.5764706, 1,
1.277149, -0.9094821, 0.4839162, 1, 0, 0.5686275, 1,
1.277815, -1.073724, 2.132216, 1, 0, 0.5647059, 1,
1.278978, -0.05682281, 1.855475, 1, 0, 0.5568628, 1,
1.302073, 0.8627383, 1.430302, 1, 0, 0.5529412, 1,
1.303445, -1.728829, 2.480395, 1, 0, 0.5450981, 1,
1.306293, 0.7053235, 2.066699, 1, 0, 0.5411765, 1,
1.306347, 0.5073951, 1.214076, 1, 0, 0.5333334, 1,
1.307443, -0.04839901, 1.429595, 1, 0, 0.5294118, 1,
1.334192, 0.5866205, 1.530644, 1, 0, 0.5215687, 1,
1.363802, -1.643443, 2.33904, 1, 0, 0.5176471, 1,
1.372092, -0.6533312, 1.176534, 1, 0, 0.509804, 1,
1.37693, 1.403138, 0.01283258, 1, 0, 0.5058824, 1,
1.377005, 1.40208, 2.481538, 1, 0, 0.4980392, 1,
1.377079, 0.3012731, -0.4477849, 1, 0, 0.4901961, 1,
1.379617, -0.9277748, 2.368619, 1, 0, 0.4862745, 1,
1.380064, 0.8723987, 1.098101, 1, 0, 0.4784314, 1,
1.387515, -0.7289907, 1.343999, 1, 0, 0.4745098, 1,
1.395452, -1.387887, 1.861593, 1, 0, 0.4666667, 1,
1.399279, 0.6695122, 1.524674, 1, 0, 0.4627451, 1,
1.402772, -0.133738, -0.9229802, 1, 0, 0.454902, 1,
1.415103, 0.9568782, 1.102634, 1, 0, 0.4509804, 1,
1.416377, -0.9652414, 2.50811, 1, 0, 0.4431373, 1,
1.425179, 0.5167665, 2.149365, 1, 0, 0.4392157, 1,
1.425456, -0.5343252, 2.329547, 1, 0, 0.4313726, 1,
1.430118, 1.629976, 0.4640801, 1, 0, 0.427451, 1,
1.438947, 1.158583, 0.3556865, 1, 0, 0.4196078, 1,
1.448167, 0.794602, 0.6497628, 1, 0, 0.4156863, 1,
1.44879, -1.565516, 1.149278, 1, 0, 0.4078431, 1,
1.452265, 0.4960572, 0.3053062, 1, 0, 0.4039216, 1,
1.471791, 0.1059737, 2.097423, 1, 0, 0.3960784, 1,
1.473399, -0.7980043, 2.512181, 1, 0, 0.3882353, 1,
1.483657, 1.02888, 1.602228, 1, 0, 0.3843137, 1,
1.487125, -0.3317576, 2.24364, 1, 0, 0.3764706, 1,
1.488801, -0.1237002, 1.551746, 1, 0, 0.372549, 1,
1.489182, -0.4323044, 1.598845, 1, 0, 0.3647059, 1,
1.494451, -2.114349, 2.091839, 1, 0, 0.3607843, 1,
1.500275, -0.2088884, 2.504394, 1, 0, 0.3529412, 1,
1.532516, 0.1464152, 0.1653547, 1, 0, 0.3490196, 1,
1.544265, -0.08648707, 1.243347, 1, 0, 0.3411765, 1,
1.548134, 1.974345, 1.497332, 1, 0, 0.3372549, 1,
1.552288, 0.8578628, 1.322921, 1, 0, 0.3294118, 1,
1.584532, -0.4738664, 1.378479, 1, 0, 0.3254902, 1,
1.61108, -1.440479, 2.794117, 1, 0, 0.3176471, 1,
1.612214, -1.243073, 2.229207, 1, 0, 0.3137255, 1,
1.61339, 0.0004874907, 1.555773, 1, 0, 0.3058824, 1,
1.613909, 0.002677346, 2.287292, 1, 0, 0.2980392, 1,
1.616526, -0.5756438, 3.570411, 1, 0, 0.2941177, 1,
1.628746, 0.7304761, 1.384324, 1, 0, 0.2862745, 1,
1.633714, -1.543385, 4.017549, 1, 0, 0.282353, 1,
1.638433, 0.2075031, -0.1328098, 1, 0, 0.2745098, 1,
1.643604, 0.4688166, 0.5819203, 1, 0, 0.2705882, 1,
1.646715, 1.148079, -0.2702016, 1, 0, 0.2627451, 1,
1.662387, 0.4363375, 0.0667886, 1, 0, 0.2588235, 1,
1.668069, -0.4875242, 0.5489694, 1, 0, 0.2509804, 1,
1.683971, 0.4981878, 0.6067554, 1, 0, 0.2470588, 1,
1.705439, -2.348384, 2.335165, 1, 0, 0.2392157, 1,
1.711959, -0.5598258, 2.185939, 1, 0, 0.2352941, 1,
1.719716, 1.336853, -0.08465862, 1, 0, 0.227451, 1,
1.732294, 0.7685825, -0.6288924, 1, 0, 0.2235294, 1,
1.736806, -1.273286, 0.8492643, 1, 0, 0.2156863, 1,
1.759114, -0.684691, 2.772493, 1, 0, 0.2117647, 1,
1.778927, -0.1852631, 2.68259, 1, 0, 0.2039216, 1,
1.794682, 0.5875235, -0.08530687, 1, 0, 0.1960784, 1,
1.835156, 1.027145, 0.5476771, 1, 0, 0.1921569, 1,
1.837069, 1.042397, 2.812709, 1, 0, 0.1843137, 1,
1.840228, -1.137674, 2.957129, 1, 0, 0.1803922, 1,
1.863907, 0.1131745, 0.7739512, 1, 0, 0.172549, 1,
1.873826, 1.317596, -0.5221788, 1, 0, 0.1686275, 1,
1.885097, -0.2867255, 1.073681, 1, 0, 0.1607843, 1,
1.915645, 0.6401529, 2.804816, 1, 0, 0.1568628, 1,
1.935332, -0.1309613, 0.002246193, 1, 0, 0.1490196, 1,
1.935468, -0.8012163, 1.867825, 1, 0, 0.145098, 1,
1.93977, -0.8702304, 2.933465, 1, 0, 0.1372549, 1,
1.961177, 1.106372, 1.880879, 1, 0, 0.1333333, 1,
1.967104, -0.5369179, 2.657447, 1, 0, 0.1254902, 1,
1.993334, -0.1356976, 1.883569, 1, 0, 0.1215686, 1,
2.003306, -0.1008561, 2.483737, 1, 0, 0.1137255, 1,
2.006005, -0.3269484, 2.57316, 1, 0, 0.1098039, 1,
2.041235, 0.1766108, 3.931563, 1, 0, 0.1019608, 1,
2.051455, -0.8505316, 0.4638312, 1, 0, 0.09411765, 1,
2.089982, 0.4467437, 0.2148032, 1, 0, 0.09019608, 1,
2.104542, 0.883846, 0.5169919, 1, 0, 0.08235294, 1,
2.136354, -0.1245769, 1.286947, 1, 0, 0.07843138, 1,
2.138742, 0.6931607, 0.009207925, 1, 0, 0.07058824, 1,
2.147275, -0.06218636, 2.615752, 1, 0, 0.06666667, 1,
2.1545, -0.9967722, 2.581242, 1, 0, 0.05882353, 1,
2.214554, -0.2283472, 0.9038717, 1, 0, 0.05490196, 1,
2.269275, 0.6817659, 0.1270376, 1, 0, 0.04705882, 1,
2.370215, 0.5514482, -0.7503591, 1, 0, 0.04313726, 1,
2.381301, 0.5163254, -0.5141337, 1, 0, 0.03529412, 1,
2.568386, 0.4381672, 0.6262217, 1, 0, 0.03137255, 1,
2.576953, -1.83587, 3.291807, 1, 0, 0.02352941, 1,
2.677649, -0.2945687, 3.728566, 1, 0, 0.01960784, 1,
2.823365, 0.4337525, 1.209535, 1, 0, 0.01176471, 1,
3.359294, 1.430077, 1.036564, 1, 0, 0.007843138, 1
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
0.103407, -4.767857, -7.737418, 0, -0.5, 0.5, 0.5,
0.103407, -4.767857, -7.737418, 1, -0.5, 0.5, 0.5,
0.103407, -4.767857, -7.737418, 1, 1.5, 0.5, 0.5,
0.103407, -4.767857, -7.737418, 0, 1.5, 0.5, 0.5
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
-4.256226, -0.2090453, -7.737418, 0, -0.5, 0.5, 0.5,
-4.256226, -0.2090453, -7.737418, 1, -0.5, 0.5, 0.5,
-4.256226, -0.2090453, -7.737418, 1, 1.5, 0.5, 0.5,
-4.256226, -0.2090453, -7.737418, 0, 1.5, 0.5, 0.5
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
-4.256226, -4.767857, -0.6047029, 0, -0.5, 0.5, 0.5,
-4.256226, -4.767857, -0.6047029, 1, -0.5, 0.5, 0.5,
-4.256226, -4.767857, -0.6047029, 1, 1.5, 0.5, 0.5,
-4.256226, -4.767857, -0.6047029, 0, 1.5, 0.5, 0.5
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
-3, -3.715823, -6.091407,
3, -3.715823, -6.091407,
-3, -3.715823, -6.091407,
-3, -3.891162, -6.365742,
-2, -3.715823, -6.091407,
-2, -3.891162, -6.365742,
-1, -3.715823, -6.091407,
-1, -3.891162, -6.365742,
0, -3.715823, -6.091407,
0, -3.891162, -6.365742,
1, -3.715823, -6.091407,
1, -3.891162, -6.365742,
2, -3.715823, -6.091407,
2, -3.891162, -6.365742,
3, -3.715823, -6.091407,
3, -3.891162, -6.365742
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
-3, -4.24184, -6.914412, 0, -0.5, 0.5, 0.5,
-3, -4.24184, -6.914412, 1, -0.5, 0.5, 0.5,
-3, -4.24184, -6.914412, 1, 1.5, 0.5, 0.5,
-3, -4.24184, -6.914412, 0, 1.5, 0.5, 0.5,
-2, -4.24184, -6.914412, 0, -0.5, 0.5, 0.5,
-2, -4.24184, -6.914412, 1, -0.5, 0.5, 0.5,
-2, -4.24184, -6.914412, 1, 1.5, 0.5, 0.5,
-2, -4.24184, -6.914412, 0, 1.5, 0.5, 0.5,
-1, -4.24184, -6.914412, 0, -0.5, 0.5, 0.5,
-1, -4.24184, -6.914412, 1, -0.5, 0.5, 0.5,
-1, -4.24184, -6.914412, 1, 1.5, 0.5, 0.5,
-1, -4.24184, -6.914412, 0, 1.5, 0.5, 0.5,
0, -4.24184, -6.914412, 0, -0.5, 0.5, 0.5,
0, -4.24184, -6.914412, 1, -0.5, 0.5, 0.5,
0, -4.24184, -6.914412, 1, 1.5, 0.5, 0.5,
0, -4.24184, -6.914412, 0, 1.5, 0.5, 0.5,
1, -4.24184, -6.914412, 0, -0.5, 0.5, 0.5,
1, -4.24184, -6.914412, 1, -0.5, 0.5, 0.5,
1, -4.24184, -6.914412, 1, 1.5, 0.5, 0.5,
1, -4.24184, -6.914412, 0, 1.5, 0.5, 0.5,
2, -4.24184, -6.914412, 0, -0.5, 0.5, 0.5,
2, -4.24184, -6.914412, 1, -0.5, 0.5, 0.5,
2, -4.24184, -6.914412, 1, 1.5, 0.5, 0.5,
2, -4.24184, -6.914412, 0, 1.5, 0.5, 0.5,
3, -4.24184, -6.914412, 0, -0.5, 0.5, 0.5,
3, -4.24184, -6.914412, 1, -0.5, 0.5, 0.5,
3, -4.24184, -6.914412, 1, 1.5, 0.5, 0.5,
3, -4.24184, -6.914412, 0, 1.5, 0.5, 0.5
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
-3.250157, -3, -6.091407,
-3.250157, 3, -6.091407,
-3.250157, -3, -6.091407,
-3.417835, -3, -6.365742,
-3.250157, -2, -6.091407,
-3.417835, -2, -6.365742,
-3.250157, -1, -6.091407,
-3.417835, -1, -6.365742,
-3.250157, 0, -6.091407,
-3.417835, 0, -6.365742,
-3.250157, 1, -6.091407,
-3.417835, 1, -6.365742,
-3.250157, 2, -6.091407,
-3.417835, 2, -6.365742,
-3.250157, 3, -6.091407,
-3.417835, 3, -6.365742
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
-3.753191, -3, -6.914412, 0, -0.5, 0.5, 0.5,
-3.753191, -3, -6.914412, 1, -0.5, 0.5, 0.5,
-3.753191, -3, -6.914412, 1, 1.5, 0.5, 0.5,
-3.753191, -3, -6.914412, 0, 1.5, 0.5, 0.5,
-3.753191, -2, -6.914412, 0, -0.5, 0.5, 0.5,
-3.753191, -2, -6.914412, 1, -0.5, 0.5, 0.5,
-3.753191, -2, -6.914412, 1, 1.5, 0.5, 0.5,
-3.753191, -2, -6.914412, 0, 1.5, 0.5, 0.5,
-3.753191, -1, -6.914412, 0, -0.5, 0.5, 0.5,
-3.753191, -1, -6.914412, 1, -0.5, 0.5, 0.5,
-3.753191, -1, -6.914412, 1, 1.5, 0.5, 0.5,
-3.753191, -1, -6.914412, 0, 1.5, 0.5, 0.5,
-3.753191, 0, -6.914412, 0, -0.5, 0.5, 0.5,
-3.753191, 0, -6.914412, 1, -0.5, 0.5, 0.5,
-3.753191, 0, -6.914412, 1, 1.5, 0.5, 0.5,
-3.753191, 0, -6.914412, 0, 1.5, 0.5, 0.5,
-3.753191, 1, -6.914412, 0, -0.5, 0.5, 0.5,
-3.753191, 1, -6.914412, 1, -0.5, 0.5, 0.5,
-3.753191, 1, -6.914412, 1, 1.5, 0.5, 0.5,
-3.753191, 1, -6.914412, 0, 1.5, 0.5, 0.5,
-3.753191, 2, -6.914412, 0, -0.5, 0.5, 0.5,
-3.753191, 2, -6.914412, 1, -0.5, 0.5, 0.5,
-3.753191, 2, -6.914412, 1, 1.5, 0.5, 0.5,
-3.753191, 2, -6.914412, 0, 1.5, 0.5, 0.5,
-3.753191, 3, -6.914412, 0, -0.5, 0.5, 0.5,
-3.753191, 3, -6.914412, 1, -0.5, 0.5, 0.5,
-3.753191, 3, -6.914412, 1, 1.5, 0.5, 0.5,
-3.753191, 3, -6.914412, 0, 1.5, 0.5, 0.5
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
-3.250157, -3.715823, -4,
-3.250157, -3.715823, 4,
-3.250157, -3.715823, -4,
-3.417835, -3.891162, -4,
-3.250157, -3.715823, -2,
-3.417835, -3.891162, -2,
-3.250157, -3.715823, 0,
-3.417835, -3.891162, 0,
-3.250157, -3.715823, 2,
-3.417835, -3.891162, 2,
-3.250157, -3.715823, 4,
-3.417835, -3.891162, 4
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
-3.753191, -4.24184, -4, 0, -0.5, 0.5, 0.5,
-3.753191, -4.24184, -4, 1, -0.5, 0.5, 0.5,
-3.753191, -4.24184, -4, 1, 1.5, 0.5, 0.5,
-3.753191, -4.24184, -4, 0, 1.5, 0.5, 0.5,
-3.753191, -4.24184, -2, 0, -0.5, 0.5, 0.5,
-3.753191, -4.24184, -2, 1, -0.5, 0.5, 0.5,
-3.753191, -4.24184, -2, 1, 1.5, 0.5, 0.5,
-3.753191, -4.24184, -2, 0, 1.5, 0.5, 0.5,
-3.753191, -4.24184, 0, 0, -0.5, 0.5, 0.5,
-3.753191, -4.24184, 0, 1, -0.5, 0.5, 0.5,
-3.753191, -4.24184, 0, 1, 1.5, 0.5, 0.5,
-3.753191, -4.24184, 0, 0, 1.5, 0.5, 0.5,
-3.753191, -4.24184, 2, 0, -0.5, 0.5, 0.5,
-3.753191, -4.24184, 2, 1, -0.5, 0.5, 0.5,
-3.753191, -4.24184, 2, 1, 1.5, 0.5, 0.5,
-3.753191, -4.24184, 2, 0, 1.5, 0.5, 0.5,
-3.753191, -4.24184, 4, 0, -0.5, 0.5, 0.5,
-3.753191, -4.24184, 4, 1, -0.5, 0.5, 0.5,
-3.753191, -4.24184, 4, 1, 1.5, 0.5, 0.5,
-3.753191, -4.24184, 4, 0, 1.5, 0.5, 0.5
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
-3.250157, -3.715823, -6.091407,
-3.250157, 3.297733, -6.091407,
-3.250157, -3.715823, 4.882001,
-3.250157, 3.297733, 4.882001,
-3.250157, -3.715823, -6.091407,
-3.250157, -3.715823, 4.882001,
-3.250157, 3.297733, -6.091407,
-3.250157, 3.297733, 4.882001,
-3.250157, -3.715823, -6.091407,
3.456971, -3.715823, -6.091407,
-3.250157, -3.715823, 4.882001,
3.456971, -3.715823, 4.882001,
-3.250157, 3.297733, -6.091407,
3.456971, 3.297733, -6.091407,
-3.250157, 3.297733, 4.882001,
3.456971, 3.297733, 4.882001,
3.456971, -3.715823, -6.091407,
3.456971, 3.297733, -6.091407,
3.456971, -3.715823, 4.882001,
3.456971, 3.297733, 4.882001,
3.456971, -3.715823, -6.091407,
3.456971, -3.715823, 4.882001,
3.456971, 3.297733, -6.091407,
3.456971, 3.297733, 4.882001
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
var radius = 7.822245;
var distance = 34.80205;
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
mvMatrix.translate( -0.103407, 0.2090453, 0.6047029 );
mvMatrix.scale( 1.260982, 1.205888, 0.7707328 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.80205);
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
methylcarbamate<-read.table("methylcarbamate.xyz")
```

```
## Error in read.table("methylcarbamate.xyz"): no lines available in input
```

```r
x<-methylcarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate' not found
```

```r
y<-methylcarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate' not found
```

```r
z<-methylcarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate' not found
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
-3.15248, -0.5191808, -1.152181, 0, 0, 1, 1, 1,
-2.756882, -1.103737, -1.504951, 1, 0, 0, 1, 1,
-2.600849, -0.08640301, -2.865805, 1, 0, 0, 1, 1,
-2.539849, -0.09156175, -1.215161, 1, 0, 0, 1, 1,
-2.534594, -1.586533, -0.6265091, 1, 0, 0, 1, 1,
-2.523857, 0.2459688, -2.81558, 1, 0, 0, 1, 1,
-2.504055, 1.977956, -0.2461271, 0, 0, 0, 1, 1,
-2.46424, 0.6286477, -0.08146123, 0, 0, 0, 1, 1,
-2.319386, -0.7898093, -3.912923, 0, 0, 0, 1, 1,
-2.315094, -1.051003, 0.04368469, 0, 0, 0, 1, 1,
-2.262561, 0.9475353, -2.833404, 0, 0, 0, 1, 1,
-2.246998, -0.2450091, -3.594308, 0, 0, 0, 1, 1,
-2.212068, 0.05498931, 0.654322, 0, 0, 0, 1, 1,
-2.169502, -0.4254665, -0.6583588, 1, 1, 1, 1, 1,
-2.107714, -0.8017166, -0.5289923, 1, 1, 1, 1, 1,
-2.05145, 0.1339548, -0.2579867, 1, 1, 1, 1, 1,
-2.042041, -0.8900157, -1.633604, 1, 1, 1, 1, 1,
-2.011663, -1.133288, -0.4011805, 1, 1, 1, 1, 1,
-2.008779, 0.156332, -3.308043, 1, 1, 1, 1, 1,
-1.981614, -0.8560812, -3.126672, 1, 1, 1, 1, 1,
-1.924262, -0.4812037, -1.861422, 1, 1, 1, 1, 1,
-1.893294, -0.09394088, -1.211406, 1, 1, 1, 1, 1,
-1.887898, 1.455523, -1.112986, 1, 1, 1, 1, 1,
-1.886826, 0.4417573, -2.217525, 1, 1, 1, 1, 1,
-1.851371, 1.069305, -0.9379926, 1, 1, 1, 1, 1,
-1.848778, 1.098397, -0.4828761, 1, 1, 1, 1, 1,
-1.847392, 0.2975216, -2.21483, 1, 1, 1, 1, 1,
-1.843218, 1.470966, -2.16912, 1, 1, 1, 1, 1,
-1.832683, 1.346552, 0.07639143, 0, 0, 1, 1, 1,
-1.831542, 0.5346055, -2.247932, 1, 0, 0, 1, 1,
-1.823868, -0.95406, -2.19021, 1, 0, 0, 1, 1,
-1.815602, 1.451385, -0.7300257, 1, 0, 0, 1, 1,
-1.764485, -0.7371383, -2.167346, 1, 0, 0, 1, 1,
-1.741259, 0.7054682, -1.213122, 1, 0, 0, 1, 1,
-1.736754, -0.6456397, -0.3029763, 0, 0, 0, 1, 1,
-1.723464, 0.9653342, -2.252331, 0, 0, 0, 1, 1,
-1.71514, -1.542421, -2.254502, 0, 0, 0, 1, 1,
-1.705741, 2.089845, -0.3272824, 0, 0, 0, 1, 1,
-1.702927, -0.0371957, -1.915076, 0, 0, 0, 1, 1,
-1.698056, -0.2825638, 0.08335226, 0, 0, 0, 1, 1,
-1.692681, -2.55648, -1.752963, 0, 0, 0, 1, 1,
-1.691071, 0.9091138, -1.761876, 1, 1, 1, 1, 1,
-1.678997, 1.047519, 0.08176915, 1, 1, 1, 1, 1,
-1.676248, -1.375882, -2.749344, 1, 1, 1, 1, 1,
-1.668786, 0.6076406, -3.188914, 1, 1, 1, 1, 1,
-1.652764, 1.105023, -3.537577, 1, 1, 1, 1, 1,
-1.638912, 1.235213, -0.8434682, 1, 1, 1, 1, 1,
-1.625489, 0.6608171, -2.050234, 1, 1, 1, 1, 1,
-1.623056, -0.4613528, -2.884771, 1, 1, 1, 1, 1,
-1.618116, 0.4202788, -1.58013, 1, 1, 1, 1, 1,
-1.616585, -0.1239914, -2.356397, 1, 1, 1, 1, 1,
-1.609802, -0.8779669, -1.964057, 1, 1, 1, 1, 1,
-1.608461, -0.04332074, -2.090656, 1, 1, 1, 1, 1,
-1.592174, 1.742947, -1.411962, 1, 1, 1, 1, 1,
-1.580567, 0.1201162, -2.497242, 1, 1, 1, 1, 1,
-1.579916, -0.2665986, -2.218915, 1, 1, 1, 1, 1,
-1.579736, -0.8927009, -4.300747, 0, 0, 1, 1, 1,
-1.571806, -1.657035, -2.318309, 1, 0, 0, 1, 1,
-1.565024, -0.6679709, -0.6369267, 1, 0, 0, 1, 1,
-1.559809, 1.692024, -2.022218, 1, 0, 0, 1, 1,
-1.552757, -0.08256097, 0.2527066, 1, 0, 0, 1, 1,
-1.55006, -1.569912, -0.7023672, 1, 0, 0, 1, 1,
-1.546879, 1.367551, -1.147367, 0, 0, 0, 1, 1,
-1.546441, 0.8121647, -1.187568, 0, 0, 0, 1, 1,
-1.54218, 0.7630478, -1.731853, 0, 0, 0, 1, 1,
-1.540392, -0.9655724, -2.259035, 0, 0, 0, 1, 1,
-1.526933, 0.2397322, -0.5389651, 0, 0, 0, 1, 1,
-1.526002, -0.3944589, -2.075476, 0, 0, 0, 1, 1,
-1.525757, -0.04703065, -2.24037, 0, 0, 0, 1, 1,
-1.525597, -0.8464136, -1.811812, 1, 1, 1, 1, 1,
-1.518456, -0.9270752, -1.716809, 1, 1, 1, 1, 1,
-1.494764, -0.8453203, -1.872891, 1, 1, 1, 1, 1,
-1.491718, 0.3953009, -1.7635, 1, 1, 1, 1, 1,
-1.424411, 0.1486759, -0.5611298, 1, 1, 1, 1, 1,
-1.424127, -0.07079916, -0.7725946, 1, 1, 1, 1, 1,
-1.397715, -1.918673, -2.900258, 1, 1, 1, 1, 1,
-1.390484, -0.3003748, -1.205853, 1, 1, 1, 1, 1,
-1.386435, -1.195033, -1.722663, 1, 1, 1, 1, 1,
-1.378452, -0.6090274, -3.916577, 1, 1, 1, 1, 1,
-1.37737, 0.1782168, 0.388227, 1, 1, 1, 1, 1,
-1.374742, 0.09472837, -0.5389078, 1, 1, 1, 1, 1,
-1.367923, -1.041916, -1.179142, 1, 1, 1, 1, 1,
-1.363675, -1.935746, -1.256593, 1, 1, 1, 1, 1,
-1.353718, 1.386487, -1.106025, 1, 1, 1, 1, 1,
-1.353367, -0.03807269, -2.922872, 0, 0, 1, 1, 1,
-1.350457, 1.467364, 0.08208657, 1, 0, 0, 1, 1,
-1.343867, -0.863008, -2.257254, 1, 0, 0, 1, 1,
-1.343055, 0.1004521, -0.5992124, 1, 0, 0, 1, 1,
-1.331197, 1.106557, -0.4628337, 1, 0, 0, 1, 1,
-1.328437, -0.9830374, -3.171124, 1, 0, 0, 1, 1,
-1.324312, 1.407061, -0.09742633, 0, 0, 0, 1, 1,
-1.308321, 1.210197, -1.883297, 0, 0, 0, 1, 1,
-1.307849, -0.5045506, -2.049932, 0, 0, 0, 1, 1,
-1.307545, -0.4105916, -1.584563, 0, 0, 0, 1, 1,
-1.30372, -1.611482, -3.870646, 0, 0, 0, 1, 1,
-1.298366, -0.4118731, -0.348531, 0, 0, 0, 1, 1,
-1.295179, 0.346187, -0.06866612, 0, 0, 0, 1, 1,
-1.289975, 0.274588, -0.9681273, 1, 1, 1, 1, 1,
-1.286868, 0.532545, -0.8250203, 1, 1, 1, 1, 1,
-1.281508, -2.600907, -2.284897, 1, 1, 1, 1, 1,
-1.234007, 0.8316455, -1.146965, 1, 1, 1, 1, 1,
-1.229058, -1.254442, -2.278318, 1, 1, 1, 1, 1,
-1.217635, 0.1666891, -1.333469, 1, 1, 1, 1, 1,
-1.216805, -1.952838, -2.837259, 1, 1, 1, 1, 1,
-1.205557, 1.653653, 0.01136525, 1, 1, 1, 1, 1,
-1.199636, 0.5031139, 0.6354232, 1, 1, 1, 1, 1,
-1.19607, -0.2128852, -1.011262, 1, 1, 1, 1, 1,
-1.185266, 0.9703966, -0.901067, 1, 1, 1, 1, 1,
-1.17166, -0.2115923, -1.936244, 1, 1, 1, 1, 1,
-1.165798, 0.6759615, -0.7722474, 1, 1, 1, 1, 1,
-1.162919, -1.100272, -2.115248, 1, 1, 1, 1, 1,
-1.161047, 0.5230533, -1.156884, 1, 1, 1, 1, 1,
-1.158008, 0.2952461, -1.203159, 0, 0, 1, 1, 1,
-1.156817, -0.4508237, -0.8796082, 1, 0, 0, 1, 1,
-1.153525, 0.6690117, -0.9344925, 1, 0, 0, 1, 1,
-1.152549, -0.5747651, -1.768939, 1, 0, 0, 1, 1,
-1.142216, -0.5786253, -3.64689, 1, 0, 0, 1, 1,
-1.123418, 1.095768, 0.3917144, 1, 0, 0, 1, 1,
-1.116792, -0.8731911, -2.068309, 0, 0, 0, 1, 1,
-1.113909, 0.2375432, -1.09901, 0, 0, 0, 1, 1,
-1.105752, -0.09377554, -1.239373, 0, 0, 0, 1, 1,
-1.092022, 1.877518, -0.6819441, 0, 0, 0, 1, 1,
-1.090673, 0.1698003, -2.43792, 0, 0, 0, 1, 1,
-1.083169, 0.4462321, -1.402402, 0, 0, 0, 1, 1,
-1.080591, 0.3451371, -1.002159, 0, 0, 0, 1, 1,
-1.079328, 0.3541122, -2.161558, 1, 1, 1, 1, 1,
-1.077531, -0.6055633, -1.609063, 1, 1, 1, 1, 1,
-1.074235, -0.6611932, -3.505658, 1, 1, 1, 1, 1,
-1.073399, -1.080595, -0.7752941, 1, 1, 1, 1, 1,
-1.072114, -1.793367, -2.718328, 1, 1, 1, 1, 1,
-1.068127, -0.7125624, -1.434424, 1, 1, 1, 1, 1,
-1.066586, 1.302477, -0.2310484, 1, 1, 1, 1, 1,
-1.058646, -0.4711701, -2.359479, 1, 1, 1, 1, 1,
-1.058561, 0.5415541, -2.561706, 1, 1, 1, 1, 1,
-1.056722, 0.4589089, -0.1617517, 1, 1, 1, 1, 1,
-1.056222, -1.360284, -2.185437, 1, 1, 1, 1, 1,
-1.051794, -0.597635, -1.119264, 1, 1, 1, 1, 1,
-1.049982, -0.9602902, -1.598911, 1, 1, 1, 1, 1,
-1.037581, 1.635267, -0.4079692, 1, 1, 1, 1, 1,
-1.032955, 0.4425281, -3.063164, 1, 1, 1, 1, 1,
-1.030769, 1.039342, -1.240671, 0, 0, 1, 1, 1,
-1.023306, -0.228735, -4.439121, 1, 0, 0, 1, 1,
-1.021267, 0.4075381, -2.085637, 1, 0, 0, 1, 1,
-1.017014, -0.05281476, -0.3458761, 1, 0, 0, 1, 1,
-1.016102, -0.5183197, -3.54177, 1, 0, 0, 1, 1,
-1.004847, -0.6640564, -1.092169, 1, 0, 0, 1, 1,
-1.004584, 0.8721962, -1.098031, 0, 0, 0, 1, 1,
-1.00029, 0.2251386, -1.83687, 0, 0, 0, 1, 1,
-0.9913414, -1.397847, -2.452162, 0, 0, 0, 1, 1,
-0.9849871, -1.215442, -2.426462, 0, 0, 0, 1, 1,
-0.9848656, 1.220725, -0.07690393, 0, 0, 0, 1, 1,
-0.9654704, -1.227554, -1.524796, 0, 0, 0, 1, 1,
-0.9613082, -0.9776589, -2.765318, 0, 0, 0, 1, 1,
-0.9599423, -1.672323, -1.401795, 1, 1, 1, 1, 1,
-0.9581804, -0.8708043, -1.686356, 1, 1, 1, 1, 1,
-0.9544633, -1.790715, -0.7247639, 1, 1, 1, 1, 1,
-0.9449901, -0.3837341, -3.434294, 1, 1, 1, 1, 1,
-0.9190872, -0.3989841, -1.932408, 1, 1, 1, 1, 1,
-0.9177415, -0.5209135, -2.366167, 1, 1, 1, 1, 1,
-0.9130965, 0.006109704, -0.6642419, 1, 1, 1, 1, 1,
-0.9069836, -0.2358755, -0.2573786, 1, 1, 1, 1, 1,
-0.9058704, -0.6504714, -4.682942, 1, 1, 1, 1, 1,
-0.9041719, -0.136043, -2.122004, 1, 1, 1, 1, 1,
-0.90236, 0.2644294, -0.03049492, 1, 1, 1, 1, 1,
-0.9021317, -0.8865962, -3.432934, 1, 1, 1, 1, 1,
-0.8984877, -0.6539558, 0.2831918, 1, 1, 1, 1, 1,
-0.8974144, -0.4092136, -2.800986, 1, 1, 1, 1, 1,
-0.8939561, -2.85027, -1.791875, 1, 1, 1, 1, 1,
-0.8882431, 0.1067723, -0.382628, 0, 0, 1, 1, 1,
-0.8812625, 0.6655366, -0.6941073, 1, 0, 0, 1, 1,
-0.8616695, 1.575873, -0.1051748, 1, 0, 0, 1, 1,
-0.8595481, -0.02081838, -2.515446, 1, 0, 0, 1, 1,
-0.8591452, 2.224062, -2.544557, 1, 0, 0, 1, 1,
-0.8420219, 0.9815067, -0.874115, 1, 0, 0, 1, 1,
-0.8385962, 0.2517295, -1.932909, 0, 0, 0, 1, 1,
-0.833112, 0.1288639, -1.289103, 0, 0, 0, 1, 1,
-0.8250841, -3.095574, -1.584357, 0, 0, 0, 1, 1,
-0.8227291, 0.5811293, -0.2640474, 0, 0, 0, 1, 1,
-0.8221862, 1.022763, -1.193373, 0, 0, 0, 1, 1,
-0.8199779, 1.042378, -0.4999465, 0, 0, 0, 1, 1,
-0.8196012, 2.74386, 0.1490137, 0, 0, 0, 1, 1,
-0.8131579, -1.555435, -2.348916, 1, 1, 1, 1, 1,
-0.8131397, 0.4127985, 0.09342097, 1, 1, 1, 1, 1,
-0.8119712, -1.411855, -1.075705, 1, 1, 1, 1, 1,
-0.8059139, 0.6503471, -0.1562267, 1, 1, 1, 1, 1,
-0.8045266, 1.21878, -0.4261072, 1, 1, 1, 1, 1,
-0.7938059, -0.7075903, -1.546055, 1, 1, 1, 1, 1,
-0.7879667, 1.921559, -0.6465637, 1, 1, 1, 1, 1,
-0.7862998, -0.8469434, -2.006418, 1, 1, 1, 1, 1,
-0.7838693, 0.836388, 0.06263435, 1, 1, 1, 1, 1,
-0.7699718, 0.01354935, -1.323084, 1, 1, 1, 1, 1,
-0.7665104, 0.06024051, -2.167599, 1, 1, 1, 1, 1,
-0.7641514, -1.864354, -3.780961, 1, 1, 1, 1, 1,
-0.7638585, -1.412848, -2.525335, 1, 1, 1, 1, 1,
-0.7628055, -1.256458, -1.091795, 1, 1, 1, 1, 1,
-0.762513, -0.1720904, -2.586274, 1, 1, 1, 1, 1,
-0.759526, -1.682622, -2.058694, 0, 0, 1, 1, 1,
-0.7571096, 1.56805, -0.4256575, 1, 0, 0, 1, 1,
-0.7499649, 1.363519, 0.1175842, 1, 0, 0, 1, 1,
-0.7487099, -1.140833, -3.306186, 1, 0, 0, 1, 1,
-0.7474394, -1.577253, -3.810323, 1, 0, 0, 1, 1,
-0.7474039, 0.1546843, 0.5615294, 1, 0, 0, 1, 1,
-0.745333, -0.4141278, -0.6904328, 0, 0, 0, 1, 1,
-0.7423223, 0.7925014, -0.5020316, 0, 0, 0, 1, 1,
-0.7416155, 1.404159, -0.3545858, 0, 0, 0, 1, 1,
-0.7413399, 0.9896594, -0.3496224, 0, 0, 0, 1, 1,
-0.7363364, -0.7766734, -1.907558, 0, 0, 0, 1, 1,
-0.7345889, -1.223524, -4.933486, 0, 0, 0, 1, 1,
-0.7288545, -0.06570448, -0.7427965, 0, 0, 0, 1, 1,
-0.7259234, 1.089294, -0.3595012, 1, 1, 1, 1, 1,
-0.7213955, -0.3897416, -1.65385, 1, 1, 1, 1, 1,
-0.7210734, -0.25148, -2.833113, 1, 1, 1, 1, 1,
-0.7192469, 0.9929509, 0.8759798, 1, 1, 1, 1, 1,
-0.7102765, 0.2139234, 1.347394, 1, 1, 1, 1, 1,
-0.7098573, 1.155208, -0.5407814, 1, 1, 1, 1, 1,
-0.7062141, -2.236629, -2.7655, 1, 1, 1, 1, 1,
-0.7022573, -0.6394469, -3.353944, 1, 1, 1, 1, 1,
-0.694765, -0.4910112, -2.725085, 1, 1, 1, 1, 1,
-0.6945095, -0.3174995, -1.776103, 1, 1, 1, 1, 1,
-0.689567, -0.6994964, -2.63939, 1, 1, 1, 1, 1,
-0.6830864, 0.4133861, -2.007028, 1, 1, 1, 1, 1,
-0.679827, -0.4471772, -3.04546, 1, 1, 1, 1, 1,
-0.6763814, -1.647032, -1.622045, 1, 1, 1, 1, 1,
-0.6742991, 1.059555, -0.3453417, 1, 1, 1, 1, 1,
-0.6696554, -0.8156849, -2.125334, 0, 0, 1, 1, 1,
-0.6695918, -0.6724782, -2.267711, 1, 0, 0, 1, 1,
-0.6692311, 0.6864927, 0.4075134, 1, 0, 0, 1, 1,
-0.6684667, -0.7730206, -3.651451, 1, 0, 0, 1, 1,
-0.6637737, 0.02514479, -0.9755467, 1, 0, 0, 1, 1,
-0.6633155, 0.967763, -1.976148, 1, 0, 0, 1, 1,
-0.6623184, 0.3131428, -1.207817, 0, 0, 0, 1, 1,
-0.6586058, -0.3654069, -1.145681, 0, 0, 0, 1, 1,
-0.6562862, -0.9025952, -3.307518, 0, 0, 0, 1, 1,
-0.6454363, 0.4275488, -1.510668, 0, 0, 0, 1, 1,
-0.6411427, 0.9324771, -0.732796, 0, 0, 0, 1, 1,
-0.6408769, -0.872246, -3.072469, 0, 0, 0, 1, 1,
-0.6377431, 0.7439016, -0.7952296, 0, 0, 0, 1, 1,
-0.6316636, 0.1842752, 0.03433828, 1, 1, 1, 1, 1,
-0.6255736, -0.4132692, 0.5718814, 1, 1, 1, 1, 1,
-0.6220772, 1.314531, 0.530719, 1, 1, 1, 1, 1,
-0.6191559, -0.6598244, -2.48431, 1, 1, 1, 1, 1,
-0.6182212, -2.136282, -2.645314, 1, 1, 1, 1, 1,
-0.6146547, -0.2669569, -2.927913, 1, 1, 1, 1, 1,
-0.6139919, 1.046688, 0.4723775, 1, 1, 1, 1, 1,
-0.6136284, -0.7593694, -3.693101, 1, 1, 1, 1, 1,
-0.6124551, -0.9081138, -3.460346, 1, 1, 1, 1, 1,
-0.6074207, -0.5386657, -1.538729, 1, 1, 1, 1, 1,
-0.6023691, 0.06387538, -1.175603, 1, 1, 1, 1, 1,
-0.6017835, -0.8674335, -2.873866, 1, 1, 1, 1, 1,
-0.5996845, -0.7460855, -1.597481, 1, 1, 1, 1, 1,
-0.5948958, 0.5111051, 1.087801, 1, 1, 1, 1, 1,
-0.5908998, 0.2964577, -0.4267235, 1, 1, 1, 1, 1,
-0.5865371, 1.426292, 0.04748827, 0, 0, 1, 1, 1,
-0.5832398, -0.7407826, -2.576774, 1, 0, 0, 1, 1,
-0.5828267, 1.083398, 0.4142757, 1, 0, 0, 1, 1,
-0.5818804, -0.633938, -1.522914, 1, 0, 0, 1, 1,
-0.579883, 0.6185781, -0.5996842, 1, 0, 0, 1, 1,
-0.5797992, -0.4833256, -2.392625, 1, 0, 0, 1, 1,
-0.5787184, -1.200733, -4.864581, 0, 0, 0, 1, 1,
-0.576337, -1.409408, -2.467372, 0, 0, 0, 1, 1,
-0.5732021, 0.9255295, -1.521487, 0, 0, 0, 1, 1,
-0.5730246, 0.01553546, -0.5145767, 0, 0, 0, 1, 1,
-0.5718055, 0.30133, 0.2594437, 0, 0, 0, 1, 1,
-0.5667614, -0.2430206, 0.1785847, 0, 0, 0, 1, 1,
-0.5630455, 0.7010106, -1.071542, 0, 0, 0, 1, 1,
-0.5622804, 0.7818308, -0.09019528, 1, 1, 1, 1, 1,
-0.5578573, -0.1361173, -1.084542, 1, 1, 1, 1, 1,
-0.557449, 0.74069, -0.46986, 1, 1, 1, 1, 1,
-0.5567111, -0.4821563, -2.863373, 1, 1, 1, 1, 1,
-0.5546716, 0.5412253, -1.547708, 1, 1, 1, 1, 1,
-0.5519622, -1.436284, -2.331289, 1, 1, 1, 1, 1,
-0.5484561, -0.01799105, -1.570736, 1, 1, 1, 1, 1,
-0.5479848, 0.2660853, -0.3996951, 1, 1, 1, 1, 1,
-0.5462515, -0.4230691, -1.839783, 1, 1, 1, 1, 1,
-0.5460593, -1.068126, -3.009191, 1, 1, 1, 1, 1,
-0.545061, -0.308273, -2.733766, 1, 1, 1, 1, 1,
-0.5446231, 0.02001114, -1.007334, 1, 1, 1, 1, 1,
-0.5429388, -0.42366, -2.527649, 1, 1, 1, 1, 1,
-0.5357085, 0.4889571, -0.6894046, 1, 1, 1, 1, 1,
-0.5317868, -0.5324122, -1.161093, 1, 1, 1, 1, 1,
-0.5308565, 0.6742775, 0.078668, 0, 0, 1, 1, 1,
-0.5272437, 0.3225472, -0.7991478, 1, 0, 0, 1, 1,
-0.5244818, -0.2928142, -1.317276, 1, 0, 0, 1, 1,
-0.5212789, -0.3411985, -1.0164, 1, 0, 0, 1, 1,
-0.5190744, -0.3413601, -1.574296, 1, 0, 0, 1, 1,
-0.5134237, 0.1131163, -0.08302826, 1, 0, 0, 1, 1,
-0.5131207, -1.716444, -1.441578, 0, 0, 0, 1, 1,
-0.5094775, 0.1830658, -0.1156703, 0, 0, 0, 1, 1,
-0.5084043, -1.329857, -3.725976, 0, 0, 0, 1, 1,
-0.5071496, -1.099028, -2.140953, 0, 0, 0, 1, 1,
-0.5069432, 0.06941066, 0.1175167, 0, 0, 0, 1, 1,
-0.5035679, 2.241445, -1.104934, 0, 0, 0, 1, 1,
-0.5019283, 1.034991, -1.213928, 0, 0, 0, 1, 1,
-0.5003654, 1.962586, -0.3415273, 1, 1, 1, 1, 1,
-0.5001294, 0.5588375, -1.134919, 1, 1, 1, 1, 1,
-0.4960944, 0.6285172, 1.221059, 1, 1, 1, 1, 1,
-0.4921197, 0.8486727, 0.3252344, 1, 1, 1, 1, 1,
-0.4884659, 0.6478188, -0.7874001, 1, 1, 1, 1, 1,
-0.4884602, -0.632084, -2.751079, 1, 1, 1, 1, 1,
-0.4832384, -0.5827174, -2.113852, 1, 1, 1, 1, 1,
-0.4827333, -0.5799387, -3.284592, 1, 1, 1, 1, 1,
-0.4815641, -0.8585579, -3.116271, 1, 1, 1, 1, 1,
-0.4808566, 0.2611901, -0.72773, 1, 1, 1, 1, 1,
-0.4773077, 1.907261, -0.4209912, 1, 1, 1, 1, 1,
-0.4769983, 0.6616561, -0.2477387, 1, 1, 1, 1, 1,
-0.476139, 0.6022824, 0.7643501, 1, 1, 1, 1, 1,
-0.47423, 1.792367, 1.215382, 1, 1, 1, 1, 1,
-0.4737405, 0.03282019, -2.111144, 1, 1, 1, 1, 1,
-0.4736656, -0.5140008, -3.766896, 0, 0, 1, 1, 1,
-0.4675623, -0.4947085, -2.771808, 1, 0, 0, 1, 1,
-0.4669594, 2.994011, -0.1041596, 1, 0, 0, 1, 1,
-0.4631218, -1.640608, -4.389297, 1, 0, 0, 1, 1,
-0.4496608, -0.7925111, -2.060211, 1, 0, 0, 1, 1,
-0.4491799, 0.539272, -2.059028, 1, 0, 0, 1, 1,
-0.4475046, 0.04822402, -2.534713, 0, 0, 0, 1, 1,
-0.4458233, 1.28581, 0.6056204, 0, 0, 0, 1, 1,
-0.443411, -0.2639599, -0.9154708, 0, 0, 0, 1, 1,
-0.440039, 1.537643, -0.01214532, 0, 0, 0, 1, 1,
-0.436808, 0.681712, -1.122475, 0, 0, 0, 1, 1,
-0.4339513, 0.1798064, -0.1598873, 0, 0, 0, 1, 1,
-0.4297789, 1.32442, -1.579993, 0, 0, 0, 1, 1,
-0.4291334, 0.1707713, -1.330055, 1, 1, 1, 1, 1,
-0.4277745, 0.4165803, 0.5860058, 1, 1, 1, 1, 1,
-0.4248749, 1.083976, -0.4508548, 1, 1, 1, 1, 1,
-0.4240538, -0.188768, -1.719715, 1, 1, 1, 1, 1,
-0.4213852, -0.5544238, -1.814179, 1, 1, 1, 1, 1,
-0.4202426, 0.6418339, -1.452402, 1, 1, 1, 1, 1,
-0.4201122, -0.1855395, -2.488719, 1, 1, 1, 1, 1,
-0.4157093, 0.3962337, -2.001509, 1, 1, 1, 1, 1,
-0.4130394, -0.2864113, -3.029708, 1, 1, 1, 1, 1,
-0.4089726, 1.14093, -1.316193, 1, 1, 1, 1, 1,
-0.405671, 0.1606381, -1.773652, 1, 1, 1, 1, 1,
-0.4006569, 2.514963, -0.2222782, 1, 1, 1, 1, 1,
-0.4003232, -0.450292, -1.922713, 1, 1, 1, 1, 1,
-0.3995982, -0.4155581, -1.846696, 1, 1, 1, 1, 1,
-0.3968632, 0.6845098, 1.349509, 1, 1, 1, 1, 1,
-0.3918516, -0.04565475, -0.6044389, 0, 0, 1, 1, 1,
-0.3905838, -0.973088, -5.144061, 1, 0, 0, 1, 1,
-0.3886029, -1.102137, -1.794115, 1, 0, 0, 1, 1,
-0.3850471, 2.038066, 2.190845, 1, 0, 0, 1, 1,
-0.383502, -2.035775, -3.572615, 1, 0, 0, 1, 1,
-0.3827544, 1.350695, -2.332978, 1, 0, 0, 1, 1,
-0.3676518, -0.7743757, -1.355763, 0, 0, 0, 1, 1,
-0.3639288, 3.043837, -0.8791898, 0, 0, 0, 1, 1,
-0.3631659, 0.667886, -3.099411, 0, 0, 0, 1, 1,
-0.3614763, 0.1431443, 0.0667003, 0, 0, 0, 1, 1,
-0.3613553, -0.06005596, -2.69734, 0, 0, 0, 1, 1,
-0.3604893, -0.7412299, -0.7110968, 0, 0, 0, 1, 1,
-0.3571348, -1.972773, -2.532881, 0, 0, 0, 1, 1,
-0.3537001, -1.160195, -2.817346, 1, 1, 1, 1, 1,
-0.3507221, 0.2824347, -1.31866, 1, 1, 1, 1, 1,
-0.3475288, -0.4342631, -2.840998, 1, 1, 1, 1, 1,
-0.3470287, 2.605572, 0.6894252, 1, 1, 1, 1, 1,
-0.3467393, -1.214658, -4.255982, 1, 1, 1, 1, 1,
-0.3459655, 1.988181, 0.9700458, 1, 1, 1, 1, 1,
-0.3438651, 1.096521, -1.4915, 1, 1, 1, 1, 1,
-0.3432048, -1.68025, -3.289045, 1, 1, 1, 1, 1,
-0.3406276, 0.07598458, -1.53873, 1, 1, 1, 1, 1,
-0.3369637, 0.0301511, -1.389075, 1, 1, 1, 1, 1,
-0.3366969, -0.03323476, -1.885309, 1, 1, 1, 1, 1,
-0.3343729, -1.339514, -0.4584742, 1, 1, 1, 1, 1,
-0.3317004, 0.9106102, 0.8330265, 1, 1, 1, 1, 1,
-0.3300771, -1.166837, -3.067081, 1, 1, 1, 1, 1,
-0.3297289, -0.2000506, -2.167152, 1, 1, 1, 1, 1,
-0.3287488, 0.7380712, -1.49895, 0, 0, 1, 1, 1,
-0.3281072, -1.573578, -2.721695, 1, 0, 0, 1, 1,
-0.3251517, 0.05751701, -2.03854, 1, 0, 0, 1, 1,
-0.3216206, 0.1062431, -0.593255, 1, 0, 0, 1, 1,
-0.3182661, -2.007635, -1.616502, 1, 0, 0, 1, 1,
-0.3137346, 0.1212302, -2.06565, 1, 0, 0, 1, 1,
-0.3099591, 0.3703766, -0.4227192, 0, 0, 0, 1, 1,
-0.3049966, 0.0919398, 0.209619, 0, 0, 0, 1, 1,
-0.3038998, -0.2568982, -2.729841, 0, 0, 0, 1, 1,
-0.303777, 0.9696326, -0.6155702, 0, 0, 0, 1, 1,
-0.3031683, 1.461398, 0.9614041, 0, 0, 0, 1, 1,
-0.2981437, -0.6849089, -5.9316, 0, 0, 0, 1, 1,
-0.2942145, 0.9328199, -0.2972404, 0, 0, 0, 1, 1,
-0.2930275, -0.7478702, -2.898533, 1, 1, 1, 1, 1,
-0.2913319, -0.234758, -1.222632, 1, 1, 1, 1, 1,
-0.2906362, 0.3731584, -0.6212871, 1, 1, 1, 1, 1,
-0.287848, 1.165548, 1.392309, 1, 1, 1, 1, 1,
-0.2867486, -1.541788, -3.478698, 1, 1, 1, 1, 1,
-0.2866089, -0.3908108, -2.119769, 1, 1, 1, 1, 1,
-0.2860236, -0.3970257, -2.619742, 1, 1, 1, 1, 1,
-0.2860006, -1.891018, -5.302306, 1, 1, 1, 1, 1,
-0.2816582, -0.3404679, -4.576039, 1, 1, 1, 1, 1,
-0.2776023, 0.4851478, -0.6131086, 1, 1, 1, 1, 1,
-0.2715938, -1.2508, -1.883574, 1, 1, 1, 1, 1,
-0.2642456, -1.552748, -2.642094, 1, 1, 1, 1, 1,
-0.2593946, 0.4455326, -1.088447, 1, 1, 1, 1, 1,
-0.2589091, -0.1342863, -2.07959, 1, 1, 1, 1, 1,
-0.2496555, -0.534622, -1.280263, 1, 1, 1, 1, 1,
-0.2490308, -1.880057, -3.178317, 0, 0, 1, 1, 1,
-0.2476436, 1.783433, 0.9980312, 1, 0, 0, 1, 1,
-0.2412412, -0.5732663, -0.9726249, 1, 0, 0, 1, 1,
-0.2407215, -0.6608616, -4.275689, 1, 0, 0, 1, 1,
-0.2369597, 0.1057739, -1.131261, 1, 0, 0, 1, 1,
-0.23478, 1.299023, -1.138531, 1, 0, 0, 1, 1,
-0.2340804, 0.7968269, 0.8309193, 0, 0, 0, 1, 1,
-0.2311415, 0.4284886, -0.931811, 0, 0, 0, 1, 1,
-0.2275377, -0.9775305, -3.976541, 0, 0, 0, 1, 1,
-0.2253006, -0.4585547, -3.940006, 0, 0, 0, 1, 1,
-0.2237721, 1.311705, 0.2758538, 0, 0, 0, 1, 1,
-0.2237084, -0.5240777, -2.187805, 0, 0, 0, 1, 1,
-0.2233087, -0.5360924, -1.070642, 0, 0, 0, 1, 1,
-0.2215813, 0.05854659, -1.537163, 1, 1, 1, 1, 1,
-0.2158152, 0.7876728, -0.1651824, 1, 1, 1, 1, 1,
-0.2151887, 0.9071898, 0.06431983, 1, 1, 1, 1, 1,
-0.2150934, 0.7506586, 0.7804087, 1, 1, 1, 1, 1,
-0.2128757, 1.307502, 1.885251, 1, 1, 1, 1, 1,
-0.2114674, -2.557182, -3.599877, 1, 1, 1, 1, 1,
-0.2097856, -0.5047464, -3.401443, 1, 1, 1, 1, 1,
-0.206987, -0.8119631, -3.022307, 1, 1, 1, 1, 1,
-0.2042456, -0.815176, -0.7243406, 1, 1, 1, 1, 1,
-0.2027261, 0.5574114, 0.1606247, 1, 1, 1, 1, 1,
-0.2022337, 1.932254, -0.1234594, 1, 1, 1, 1, 1,
-0.2013095, 0.7885436, -0.8572694, 1, 1, 1, 1, 1,
-0.2007715, -0.7150393, -5.119023, 1, 1, 1, 1, 1,
-0.2007465, -0.4783207, -1.793541, 1, 1, 1, 1, 1,
-0.1945991, 0.7498003, -0.8746712, 1, 1, 1, 1, 1,
-0.191932, 0.8010423, -0.5943061, 0, 0, 1, 1, 1,
-0.1859868, 1.337153, -0.777809, 1, 0, 0, 1, 1,
-0.1841855, 0.4934281, 1.218048, 1, 0, 0, 1, 1,
-0.1835809, -1.058072, -3.476661, 1, 0, 0, 1, 1,
-0.1800357, -0.5834755, -2.193003, 1, 0, 0, 1, 1,
-0.1797651, 0.5912166, -0.3513189, 1, 0, 0, 1, 1,
-0.1777227, 0.9060581, -0.1345673, 0, 0, 0, 1, 1,
-0.1766098, -1.730973, -2.995286, 0, 0, 0, 1, 1,
-0.1737244, -0.6177214, -2.157804, 0, 0, 0, 1, 1,
-0.1726255, 1.328786, -1.67507, 0, 0, 0, 1, 1,
-0.171552, -0.1124762, -2.944934, 0, 0, 0, 1, 1,
-0.1673062, -0.1796917, -1.843166, 0, 0, 0, 1, 1,
-0.165499, -1.267125, -4.355144, 0, 0, 0, 1, 1,
-0.164599, -0.5882747, -4.323447, 1, 1, 1, 1, 1,
-0.1613041, -0.7240487, -5.449046, 1, 1, 1, 1, 1,
-0.1588996, 0.3114482, -0.4803566, 1, 1, 1, 1, 1,
-0.1583613, -0.549895, -3.446113, 1, 1, 1, 1, 1,
-0.1572278, -0.3523658, -4.376923, 1, 1, 1, 1, 1,
-0.1569092, 1.402694, 1.494249, 1, 1, 1, 1, 1,
-0.1561275, -1.548266, -4.46882, 1, 1, 1, 1, 1,
-0.1560864, 0.1642029, -0.2760274, 1, 1, 1, 1, 1,
-0.1458198, 0.5398082, -0.4818636, 1, 1, 1, 1, 1,
-0.1440362, -0.4916303, -1.070633, 1, 1, 1, 1, 1,
-0.1417246, -0.09578037, -0.9831589, 1, 1, 1, 1, 1,
-0.1403126, -0.3628062, -3.023553, 1, 1, 1, 1, 1,
-0.1371039, -1.775447, -4.175416, 1, 1, 1, 1, 1,
-0.1325627, 0.1185133, -0.5675424, 1, 1, 1, 1, 1,
-0.1300967, 0.4349856, -0.005851313, 1, 1, 1, 1, 1,
-0.1299578, 0.4108063, -1.498682, 0, 0, 1, 1, 1,
-0.1262191, 0.0673136, -1.270476, 1, 0, 0, 1, 1,
-0.1255441, -0.8815879, -2.96027, 1, 0, 0, 1, 1,
-0.1224372, 1.73916, 0.9350347, 1, 0, 0, 1, 1,
-0.1219834, 0.1665887, 0.7234421, 1, 0, 0, 1, 1,
-0.1146909, -3.613684, -4.766962, 1, 0, 0, 1, 1,
-0.1131343, 0.2629445, -0.9039911, 0, 0, 0, 1, 1,
-0.1119307, 0.9798385, -0.4371124, 0, 0, 0, 1, 1,
-0.1104213, -2.128135, -4.319979, 0, 0, 0, 1, 1,
-0.1092329, 2.094458, 0.3858611, 0, 0, 0, 1, 1,
-0.1075516, 1.424612, 0.4792595, 0, 0, 0, 1, 1,
-0.1058878, 1.242555, -0.2867138, 0, 0, 0, 1, 1,
-0.1049551, 0.04966245, 0.5023147, 0, 0, 0, 1, 1,
-0.1030182, -1.676051, -2.598565, 1, 1, 1, 1, 1,
-0.09865674, -1.545376, -2.693651, 1, 1, 1, 1, 1,
-0.09608722, -0.8232317, -3.219217, 1, 1, 1, 1, 1,
-0.08299169, -0.3898543, -2.612809, 1, 1, 1, 1, 1,
-0.08231711, -0.1651114, -2.10722, 1, 1, 1, 1, 1,
-0.0770036, -0.4061101, -0.631094, 1, 1, 1, 1, 1,
-0.07453062, -1.050859, -4.230239, 1, 1, 1, 1, 1,
-0.07324427, 0.3679086, 0.1893549, 1, 1, 1, 1, 1,
-0.06780913, -0.2251642, -1.340308, 1, 1, 1, 1, 1,
-0.06167789, 0.6468948, -1.339449, 1, 1, 1, 1, 1,
-0.06116578, 0.2648298, 0.1292865, 1, 1, 1, 1, 1,
-0.05822, 0.2342724, -0.2923505, 1, 1, 1, 1, 1,
-0.05712447, -0.644372, -2.164069, 1, 1, 1, 1, 1,
-0.056298, -0.5947002, -2.305541, 1, 1, 1, 1, 1,
-0.04371902, 1.53723, -0.4201317, 1, 1, 1, 1, 1,
-0.04342668, 1.437946, -0.3018056, 0, 0, 1, 1, 1,
-0.04233623, -0.3289092, -3.478837, 1, 0, 0, 1, 1,
-0.04195581, 0.7206017, -1.194, 1, 0, 0, 1, 1,
-0.04149438, 0.2775818, -1.995793, 1, 0, 0, 1, 1,
-0.04131592, -0.6259412, -2.528329, 1, 0, 0, 1, 1,
-0.04095499, 1.170176, -0.2357888, 1, 0, 0, 1, 1,
-0.03828837, -0.6340646, -4.454209, 0, 0, 0, 1, 1,
-0.03666128, -0.483007, -3.036313, 0, 0, 0, 1, 1,
-0.03557254, 0.4039887, 1.55454, 0, 0, 0, 1, 1,
-0.03507053, -1.105696, -3.620905, 0, 0, 0, 1, 1,
-0.03186791, 0.3987851, 0.08930258, 0, 0, 0, 1, 1,
-0.0297138, -0.9713028, -4.056796, 0, 0, 0, 1, 1,
-0.02969738, -1.080291, -2.251295, 0, 0, 0, 1, 1,
-0.02792605, 0.5428869, -1.280678, 1, 1, 1, 1, 1,
-0.02657748, -0.8322955, -4.206283, 1, 1, 1, 1, 1,
-0.02560078, 0.4493822, -2.536091, 1, 1, 1, 1, 1,
-0.01792845, 1.059907, -0.1555272, 1, 1, 1, 1, 1,
-0.01596356, -0.9539478, -2.462626, 1, 1, 1, 1, 1,
-0.0123383, -1.020718, -4.046033, 1, 1, 1, 1, 1,
-0.01153438, -1.357391, -3.156922, 1, 1, 1, 1, 1,
-0.009260505, 0.370588, -1.75363, 1, 1, 1, 1, 1,
-0.006715426, 1.011409, -1.186648, 1, 1, 1, 1, 1,
-0.004915735, 0.08822966, 1.143434, 1, 1, 1, 1, 1,
-0.003681433, -1.055651, -4.188294, 1, 1, 1, 1, 1,
0.002566853, -0.03734756, 3.355568, 1, 1, 1, 1, 1,
0.01330891, 1.436094, -0.5500477, 1, 1, 1, 1, 1,
0.01410941, -0.2062868, 3.958129, 1, 1, 1, 1, 1,
0.01446792, 0.001298317, 0.8474274, 1, 1, 1, 1, 1,
0.01465976, 1.068241, -0.1978928, 0, 0, 1, 1, 1,
0.01488358, 0.7862495, 1.968239, 1, 0, 0, 1, 1,
0.01497916, 2.200139, 0.4453705, 1, 0, 0, 1, 1,
0.0152301, 0.5458703, 0.7603689, 1, 0, 0, 1, 1,
0.01588322, 0.948793, -1.469485, 1, 0, 0, 1, 1,
0.0193537, 1.081759, 0.1536198, 1, 0, 0, 1, 1,
0.03260345, -0.5651014, 2.281684, 0, 0, 0, 1, 1,
0.0331238, 0.3434874, -0.5415576, 0, 0, 0, 1, 1,
0.03375798, 0.713971, 0.2790418, 0, 0, 0, 1, 1,
0.03426297, -1.922585, 2.911584, 0, 0, 0, 1, 1,
0.03551451, -1.993854, 4.191324, 0, 0, 0, 1, 1,
0.03793674, -1.979692, 1.602233, 0, 0, 0, 1, 1,
0.03949698, -0.00155079, 1.685896, 0, 0, 0, 1, 1,
0.03999482, 0.551093, 0.09715746, 1, 1, 1, 1, 1,
0.04982349, -2.196357, 3.672972, 1, 1, 1, 1, 1,
0.05498649, 0.337111, -1.026383, 1, 1, 1, 1, 1,
0.05571176, 0.1825639, 0.5004594, 1, 1, 1, 1, 1,
0.05682455, 0.6183906, 1.226727, 1, 1, 1, 1, 1,
0.05751427, -1.528485, 2.563784, 1, 1, 1, 1, 1,
0.05986335, 0.4316748, -0.3781697, 1, 1, 1, 1, 1,
0.06221033, -0.2527274, 2.252181, 1, 1, 1, 1, 1,
0.06227291, 1.719235, -1.259181, 1, 1, 1, 1, 1,
0.06520172, -0.05612322, 1.164609, 1, 1, 1, 1, 1,
0.06934979, 0.2621715, -1.126461, 1, 1, 1, 1, 1,
0.07661022, 0.4052662, 0.5089716, 1, 1, 1, 1, 1,
0.07924125, 1.230235, 1.141443, 1, 1, 1, 1, 1,
0.08621565, -0.6741704, 2.045596, 1, 1, 1, 1, 1,
0.08907131, -0.2425868, 2.315498, 1, 1, 1, 1, 1,
0.09046803, 0.4788409, -0.1018806, 0, 0, 1, 1, 1,
0.09064662, -0.9140036, 2.391971, 1, 0, 0, 1, 1,
0.09274553, 0.2416052, 0.3237068, 1, 0, 0, 1, 1,
0.1005342, 1.730687, -1.566085, 1, 0, 0, 1, 1,
0.1005352, 0.9430815, -0.4928126, 1, 0, 0, 1, 1,
0.1026207, -1.296324, 3.715135, 1, 0, 0, 1, 1,
0.1044857, 1.657045, -0.08087705, 0, 0, 0, 1, 1,
0.1101706, -0.759207, 3.172108, 0, 0, 0, 1, 1,
0.1129089, 0.05002714, -0.227077, 0, 0, 0, 1, 1,
0.1140655, 0.1490116, 2.444307, 0, 0, 0, 1, 1,
0.1169646, 0.8322303, 0.9485189, 0, 0, 0, 1, 1,
0.1186263, -1.212844, 1.848934, 0, 0, 0, 1, 1,
0.126544, -0.6913379, 3.213817, 0, 0, 0, 1, 1,
0.1274938, -1.547853, 4.13979, 1, 1, 1, 1, 1,
0.1282742, -0.7460851, 2.258316, 1, 1, 1, 1, 1,
0.1294113, -0.726463, 2.460925, 1, 1, 1, 1, 1,
0.1298088, -0.2611889, 2.57937, 1, 1, 1, 1, 1,
0.1298872, 1.043709, 0.7847378, 1, 1, 1, 1, 1,
0.1365163, 1.896864, -1.428634, 1, 1, 1, 1, 1,
0.1367276, 1.49596, 2.459414, 1, 1, 1, 1, 1,
0.1387271, -0.1103045, 3.400582, 1, 1, 1, 1, 1,
0.1405643, -0.03876612, 0.8085568, 1, 1, 1, 1, 1,
0.1406446, 0.8368078, -0.2614632, 1, 1, 1, 1, 1,
0.1417877, -0.4995935, 2.945392, 1, 1, 1, 1, 1,
0.1420277, 1.320653, 0.9932103, 1, 1, 1, 1, 1,
0.1424779, -0.3823187, 2.442737, 1, 1, 1, 1, 1,
0.1439472, -1.08147, 1.247711, 1, 1, 1, 1, 1,
0.1486926, 0.4226034, 1.483575, 1, 1, 1, 1, 1,
0.1534834, -0.2518438, 1.944791, 0, 0, 1, 1, 1,
0.1551256, -1.095429, 4.463464, 1, 0, 0, 1, 1,
0.1613367, 0.377735, -0.4416661, 1, 0, 0, 1, 1,
0.1620904, 0.06657381, 0.6383153, 1, 0, 0, 1, 1,
0.1635908, -1.031561, 4.707104, 1, 0, 0, 1, 1,
0.1644695, 1.290275, 1.97794, 1, 0, 0, 1, 1,
0.1645658, 0.04570849, 0.1854343, 0, 0, 0, 1, 1,
0.1696017, -1.580412, 3.374398, 0, 0, 0, 1, 1,
0.1702093, -1.549334, 3.768718, 0, 0, 0, 1, 1,
0.1723685, 0.4612525, 1.556314, 0, 0, 0, 1, 1,
0.1764968, -0.5859991, 3.104569, 0, 0, 0, 1, 1,
0.1841219, -0.03551491, 2.664184, 0, 0, 0, 1, 1,
0.1858971, 0.008248542, 1.489969, 0, 0, 0, 1, 1,
0.1885623, 0.03919964, 1.921386, 1, 1, 1, 1, 1,
0.1900033, 1.251319, 1.618888, 1, 1, 1, 1, 1,
0.1920358, 0.2485443, 1.888035, 1, 1, 1, 1, 1,
0.1928867, -0.07093749, 0.1889796, 1, 1, 1, 1, 1,
0.1971026, 0.09638109, -0.02460635, 1, 1, 1, 1, 1,
0.1978887, -0.9463133, 3.196263, 1, 1, 1, 1, 1,
0.2001996, -1.190375, 3.633516, 1, 1, 1, 1, 1,
0.2005578, 0.774515, 1.337004, 1, 1, 1, 1, 1,
0.202673, 1.133714, 0.3430406, 1, 1, 1, 1, 1,
0.2055354, 1.3423, -0.9352258, 1, 1, 1, 1, 1,
0.2081532, -0.1594942, 1.314646, 1, 1, 1, 1, 1,
0.2091967, -0.3327537, 2.120656, 1, 1, 1, 1, 1,
0.2118944, 0.8930811, -0.1588343, 1, 1, 1, 1, 1,
0.2149403, 3.050068, 0.2626069, 1, 1, 1, 1, 1,
0.2172832, 1.597696, 0.7369843, 1, 1, 1, 1, 1,
0.2213829, 0.6224129, 0.3612021, 0, 0, 1, 1, 1,
0.2231391, 1.526723, 0.4357999, 1, 0, 0, 1, 1,
0.2241424, 0.235822, -0.3999665, 1, 0, 0, 1, 1,
0.2316432, 1.102257, 0.09795598, 1, 0, 0, 1, 1,
0.232066, 0.1136529, 1.871592, 1, 0, 0, 1, 1,
0.2323038, 1.892649, -1.736128, 1, 0, 0, 1, 1,
0.2409736, 0.4484726, 0.7524764, 0, 0, 0, 1, 1,
0.2442104, -0.7213315, 2.47776, 0, 0, 0, 1, 1,
0.2449251, 0.3825086, -0.8098041, 0, 0, 0, 1, 1,
0.2455709, 0.5022882, 1.159114, 0, 0, 0, 1, 1,
0.2476184, 0.6086909, 1.309557, 0, 0, 0, 1, 1,
0.2483762, -0.3117029, 3.907078, 0, 0, 0, 1, 1,
0.2573119, -0.440789, 2.480079, 0, 0, 0, 1, 1,
0.2621295, -2.193102, 3.512641, 1, 1, 1, 1, 1,
0.2675477, -0.4223198, 2.256331, 1, 1, 1, 1, 1,
0.2782294, -1.637185, 3.034843, 1, 1, 1, 1, 1,
0.2816308, -0.4742224, 2.448371, 1, 1, 1, 1, 1,
0.2927494, 0.7382247, -1.777204, 1, 1, 1, 1, 1,
0.29452, -1.383848, 3.095747, 1, 1, 1, 1, 1,
0.2946686, 0.5205566, 0.1849466, 1, 1, 1, 1, 1,
0.2954679, 0.5964221, 0.4150139, 1, 1, 1, 1, 1,
0.2979696, 0.6737595, 1.729744, 1, 1, 1, 1, 1,
0.2995948, -0.1378364, 4.017447, 1, 1, 1, 1, 1,
0.3002482, 1.064161, 1.387914, 1, 1, 1, 1, 1,
0.3013985, -0.04108319, 1.904346, 1, 1, 1, 1, 1,
0.302006, -0.3693701, 2.550198, 1, 1, 1, 1, 1,
0.3050729, -0.3200284, 2.854762, 1, 1, 1, 1, 1,
0.3081903, 0.07363424, 2.611433, 1, 1, 1, 1, 1,
0.3120573, 0.0375392, 2.093402, 0, 0, 1, 1, 1,
0.3121099, 0.09205111, 1.413536, 1, 0, 0, 1, 1,
0.312536, -0.3294734, 1.432767, 1, 0, 0, 1, 1,
0.313011, -0.7970543, 2.772162, 1, 0, 0, 1, 1,
0.3194946, -0.3670391, 1.602821, 1, 0, 0, 1, 1,
0.3239631, 0.6979389, 1.355084, 1, 0, 0, 1, 1,
0.3300628, 0.09312113, 1.670282, 0, 0, 0, 1, 1,
0.3349354, -1.20553, 3.151209, 0, 0, 0, 1, 1,
0.3365327, -0.1656016, 1.770807, 0, 0, 0, 1, 1,
0.3405387, 0.9397237, 0.7106508, 0, 0, 0, 1, 1,
0.3458028, -0.7662771, 2.928699, 0, 0, 0, 1, 1,
0.3462836, -0.6341356, 3.760648, 0, 0, 0, 1, 1,
0.3469888, 0.5124291, 2.663391, 0, 0, 0, 1, 1,
0.3547301, 0.8798494, 0.2320762, 1, 1, 1, 1, 1,
0.3589908, -0.644689, 1.881409, 1, 1, 1, 1, 1,
0.3609239, -0.2673342, 4.046746, 1, 1, 1, 1, 1,
0.3637747, 0.1460428, 2.700092, 1, 1, 1, 1, 1,
0.3639704, 0.1000144, 2.747749, 1, 1, 1, 1, 1,
0.36478, 2.052347, 0.8903328, 1, 1, 1, 1, 1,
0.3647956, 1.359163, 0.5961739, 1, 1, 1, 1, 1,
0.364888, 0.4775724, 1.295025, 1, 1, 1, 1, 1,
0.366597, 0.2432889, 2.332847, 1, 1, 1, 1, 1,
0.3671692, -0.7019799, 1.838059, 1, 1, 1, 1, 1,
0.3686429, 1.21514, -1.126575, 1, 1, 1, 1, 1,
0.3693486, 0.9436072, -0.520318, 1, 1, 1, 1, 1,
0.372436, 0.4357405, -0.1674857, 1, 1, 1, 1, 1,
0.3757278, -0.3764801, 2.117928, 1, 1, 1, 1, 1,
0.3757313, 2.037717, 0.9578108, 1, 1, 1, 1, 1,
0.3788837, -0.6173269, 3.29204, 0, 0, 1, 1, 1,
0.3793142, -0.07283369, 0.5886786, 1, 0, 0, 1, 1,
0.3795629, 1.359295, 0.02786524, 1, 0, 0, 1, 1,
0.3824484, 0.4747722, 0.7809864, 1, 0, 0, 1, 1,
0.3836803, 0.3236838, 2.422212, 1, 0, 0, 1, 1,
0.3849695, 0.8579879, -0.9486483, 1, 0, 0, 1, 1,
0.3852459, 0.261962, 0.5936348, 0, 0, 0, 1, 1,
0.3904592, -0.1562905, 0.6349242, 0, 0, 0, 1, 1,
0.3968705, 0.3552858, 1.844585, 0, 0, 0, 1, 1,
0.4004592, -1.205911, 2.468904, 0, 0, 0, 1, 1,
0.4031646, -1.172588, 3.50844, 0, 0, 0, 1, 1,
0.4065759, 0.9281248, 1.254996, 0, 0, 0, 1, 1,
0.4093432, 0.4391094, 1.950502, 0, 0, 0, 1, 1,
0.4101526, 1.804344, -0.2104129, 1, 1, 1, 1, 1,
0.4113186, 0.257027, 0.9944785, 1, 1, 1, 1, 1,
0.4122778, -1.269146, 2.6216, 1, 1, 1, 1, 1,
0.4162202, 0.329027, 0.6913768, 1, 1, 1, 1, 1,
0.418215, 0.139746, 2.412097, 1, 1, 1, 1, 1,
0.4221357, 0.1876428, 2.581422, 1, 1, 1, 1, 1,
0.4225974, 0.4471012, 1.056288, 1, 1, 1, 1, 1,
0.4274418, 0.8297292, 0.7212731, 1, 1, 1, 1, 1,
0.4277909, -0.003297065, 2.952543, 1, 1, 1, 1, 1,
0.4341872, -0.3235457, 0.8006383, 1, 1, 1, 1, 1,
0.4381898, -0.08768634, 0.565447, 1, 1, 1, 1, 1,
0.4479165, 0.1305831, 1.698813, 1, 1, 1, 1, 1,
0.4487261, -1.586829, 2.278393, 1, 1, 1, 1, 1,
0.4492388, 0.2557516, 1.415596, 1, 1, 1, 1, 1,
0.4524288, -1.387428, 2.000265, 1, 1, 1, 1, 1,
0.4549112, 0.4727938, 0.9176379, 0, 0, 1, 1, 1,
0.4572612, 1.331208, 0.6075039, 1, 0, 0, 1, 1,
0.4589574, -0.3363324, 3.206004, 1, 0, 0, 1, 1,
0.4642729, -0.4327263, 1.968441, 1, 0, 0, 1, 1,
0.4648752, -0.7025309, 2.043349, 1, 0, 0, 1, 1,
0.4676678, -1.174619, 2.807233, 1, 0, 0, 1, 1,
0.4682197, -0.6132185, 1.562211, 0, 0, 0, 1, 1,
0.4720506, -0.7847717, 3.97459, 0, 0, 0, 1, 1,
0.4738392, 1.365358, -0.2084446, 0, 0, 0, 1, 1,
0.4748293, 1.8139, 0.2525166, 0, 0, 0, 1, 1,
0.4757758, 2.219769, 1.378116, 0, 0, 0, 1, 1,
0.4826842, 1.366993, 1.622714, 0, 0, 0, 1, 1,
0.4836114, 0.7958102, 1.965065, 0, 0, 0, 1, 1,
0.486666, -0.7492321, 2.363023, 1, 1, 1, 1, 1,
0.4886773, 0.5375435, -0.04164582, 1, 1, 1, 1, 1,
0.4891581, 1.330521, 0.7604141, 1, 1, 1, 1, 1,
0.4894206, -0.4160393, 1.982115, 1, 1, 1, 1, 1,
0.4900394, -0.8209708, 2.499558, 1, 1, 1, 1, 1,
0.4928228, 0.3142773, 1.234917, 1, 1, 1, 1, 1,
0.4934015, -0.9782169, 2.177328, 1, 1, 1, 1, 1,
0.4953296, -0.2550163, 1.520298, 1, 1, 1, 1, 1,
0.4993369, -0.2041056, 2.559606, 1, 1, 1, 1, 1,
0.4999007, 0.04621758, 2.353523, 1, 1, 1, 1, 1,
0.5013557, -1.588272, 2.617538, 1, 1, 1, 1, 1,
0.5068652, 0.4324365, 0.9678971, 1, 1, 1, 1, 1,
0.5080484, -1.839349, 1.865035, 1, 1, 1, 1, 1,
0.5088688, -1.3294, 3.736578, 1, 1, 1, 1, 1,
0.5167553, 0.8561133, 1.069624, 1, 1, 1, 1, 1,
0.529215, 0.2367436, 2.755293, 0, 0, 1, 1, 1,
0.5313933, -0.9148479, 3.067781, 1, 0, 0, 1, 1,
0.5319764, -1.55282, 1.938319, 1, 0, 0, 1, 1,
0.5328587, 0.694759, 0.8362648, 1, 0, 0, 1, 1,
0.5428255, 0.249502, 0.5949048, 1, 0, 0, 1, 1,
0.5470789, -1.51173, 3.497632, 1, 0, 0, 1, 1,
0.5494545, 0.2943457, 1.362117, 0, 0, 0, 1, 1,
0.5498197, -0.007140876, 1.764219, 0, 0, 0, 1, 1,
0.5534998, -0.9739265, 4.013774, 0, 0, 0, 1, 1,
0.5635097, -0.6807117, 2.809493, 0, 0, 0, 1, 1,
0.5643727, -0.287856, 0.2662116, 0, 0, 0, 1, 1,
0.5678854, 1.173921, -0.2297318, 0, 0, 0, 1, 1,
0.571817, -1.05686, 3.732056, 0, 0, 0, 1, 1,
0.5771034, -0.6578485, 2.876213, 1, 1, 1, 1, 1,
0.5798051, -1.187203, 4.157285, 1, 1, 1, 1, 1,
0.5805733, 0.6223257, 0.0679579, 1, 1, 1, 1, 1,
0.5812779, -1.670121, 3.490026, 1, 1, 1, 1, 1,
0.5914949, -0.6073039, 3.835504, 1, 1, 1, 1, 1,
0.5997153, 0.1057891, 2.221836, 1, 1, 1, 1, 1,
0.6038443, -0.9458873, 2.668042, 1, 1, 1, 1, 1,
0.6056022, -0.32354, 1.279505, 1, 1, 1, 1, 1,
0.612194, 0.5236914, 0.8888685, 1, 1, 1, 1, 1,
0.6139823, -0.1430528, 2.364022, 1, 1, 1, 1, 1,
0.6144808, -1.670799, 3.056768, 1, 1, 1, 1, 1,
0.6147051, 0.334582, 1.319238, 1, 1, 1, 1, 1,
0.6213591, 1.851068, 1.556176, 1, 1, 1, 1, 1,
0.6233376, -0.4906294, 2.281755, 1, 1, 1, 1, 1,
0.6237779, -1.259184, 2.241292, 1, 1, 1, 1, 1,
0.6269698, -0.8720865, 3.539492, 0, 0, 1, 1, 1,
0.6359743, -0.4536667, 2.340944, 1, 0, 0, 1, 1,
0.6442527, -3.539711, 2.558603, 1, 0, 0, 1, 1,
0.6503471, -0.2057388, 0.7303076, 1, 0, 0, 1, 1,
0.6522313, 1.038338, 0.5976871, 1, 0, 0, 1, 1,
0.6527089, 0.5923983, -0.9450672, 1, 0, 0, 1, 1,
0.6532138, -0.4664391, 2.1687, 0, 0, 0, 1, 1,
0.6557591, -1.227411, 3.703234, 0, 0, 0, 1, 1,
0.6633097, 0.3030452, 0.4014124, 0, 0, 0, 1, 1,
0.6653147, -0.9289682, 3.896302, 0, 0, 0, 1, 1,
0.6668232, -0.8265239, 2.509291, 0, 0, 0, 1, 1,
0.6673052, -0.05043202, 1.238198, 0, 0, 0, 1, 1,
0.6674852, 0.3262862, -0.8481653, 0, 0, 0, 1, 1,
0.6681427, 0.8817192, 0.8153735, 1, 1, 1, 1, 1,
0.6684704, -0.1181404, 1.726625, 1, 1, 1, 1, 1,
0.6735787, -0.01465436, 0.9424461, 1, 1, 1, 1, 1,
0.6783785, 0.03744753, 1.299079, 1, 1, 1, 1, 1,
0.6784532, -0.3222027, 2.910922, 1, 1, 1, 1, 1,
0.6812372, -0.4660716, 2.828289, 1, 1, 1, 1, 1,
0.6828159, -0.06604237, 0.432926, 1, 1, 1, 1, 1,
0.6836054, 1.089032, 1.555451, 1, 1, 1, 1, 1,
0.687491, 0.3290249, 1.732733, 1, 1, 1, 1, 1,
0.6888986, 0.03881082, 0.1480735, 1, 1, 1, 1, 1,
0.6926324, -2.480976, 1.793338, 1, 1, 1, 1, 1,
0.6967171, -1.480576, 2.413707, 1, 1, 1, 1, 1,
0.697668, -1.555542, 3.493803, 1, 1, 1, 1, 1,
0.7024319, -0.8393126, 4.113708, 1, 1, 1, 1, 1,
0.7035826, -2.593837, 2.840222, 1, 1, 1, 1, 1,
0.707728, 1.448565, 0.6157306, 0, 0, 1, 1, 1,
0.71094, 1.470763, 0.5650449, 1, 0, 0, 1, 1,
0.7138599, -0.7195312, 3.714954, 1, 0, 0, 1, 1,
0.7186966, 1.081038, 1.095379, 1, 0, 0, 1, 1,
0.7195626, 1.525882, -0.893476, 1, 0, 0, 1, 1,
0.7229159, 0.248149, 1.049756, 1, 0, 0, 1, 1,
0.7247723, 0.577433, 2.058949, 0, 0, 0, 1, 1,
0.7286987, 0.1358527, -0.4868278, 0, 0, 0, 1, 1,
0.7295391, -0.2511907, 2.966105, 0, 0, 0, 1, 1,
0.7298777, 0.4968649, 1.404353, 0, 0, 0, 1, 1,
0.7378798, 0.09909003, 0.6684685, 0, 0, 0, 1, 1,
0.7447888, 1.10721, -1.866776, 0, 0, 0, 1, 1,
0.7491117, -0.586886, 1.852946, 0, 0, 0, 1, 1,
0.7493767, -1.136012, 0.9113828, 1, 1, 1, 1, 1,
0.7577447, -0.4555322, 1.597722, 1, 1, 1, 1, 1,
0.7584797, -0.5911173, 2.349995, 1, 1, 1, 1, 1,
0.7648115, 0.04807604, 3.203032, 1, 1, 1, 1, 1,
0.7650252, -0.5372221, 1.479881, 1, 1, 1, 1, 1,
0.7689204, -0.5749739, 2.587803, 1, 1, 1, 1, 1,
0.7712912, 0.1893975, 2.1993, 1, 1, 1, 1, 1,
0.7713355, -0.9383297, 2.136213, 1, 1, 1, 1, 1,
0.7795281, 0.01937513, 0.8949372, 1, 1, 1, 1, 1,
0.7815458, 0.09129498, 0.305618, 1, 1, 1, 1, 1,
0.7822053, -0.978088, 1.358749, 1, 1, 1, 1, 1,
0.7842581, 0.1439159, 3.863859, 1, 1, 1, 1, 1,
0.7867299, 0.8932635, -0.180109, 1, 1, 1, 1, 1,
0.7911205, 1.266099, 1.347866, 1, 1, 1, 1, 1,
0.8046452, 1.680013, 1.241015, 1, 1, 1, 1, 1,
0.8047615, 0.4346021, 1.514849, 0, 0, 1, 1, 1,
0.8052896, 1.821609, -0.2268278, 1, 0, 0, 1, 1,
0.8064141, -0.7464106, 2.000081, 1, 0, 0, 1, 1,
0.8113751, -0.601252, 2.805128, 1, 0, 0, 1, 1,
0.81249, 0.7818345, 0.7584759, 1, 0, 0, 1, 1,
0.8254807, -0.1136463, 2.299052, 1, 0, 0, 1, 1,
0.8282595, 1.019356, -0.5090066, 0, 0, 0, 1, 1,
0.8299448, -0.6011832, 2.829061, 0, 0, 0, 1, 1,
0.8303904, 1.963804, 0.9978066, 0, 0, 0, 1, 1,
0.8336591, 1.086933, -1.072789, 0, 0, 0, 1, 1,
0.836457, -0.9424044, 2.645082, 0, 0, 0, 1, 1,
0.8381056, -0.4153243, 3.232255, 0, 0, 0, 1, 1,
0.8389401, 0.4179214, 2.084758, 0, 0, 0, 1, 1,
0.8392418, 0.4061581, 1.839908, 1, 1, 1, 1, 1,
0.8392869, 0.1947961, 1.819693, 1, 1, 1, 1, 1,
0.8401954, -0.9554842, 1.058128, 1, 1, 1, 1, 1,
0.844157, -1.527889, 2.154428, 1, 1, 1, 1, 1,
0.8467003, 0.879546, -0.7475202, 1, 1, 1, 1, 1,
0.8530858, 0.07941688, 3.829504, 1, 1, 1, 1, 1,
0.855958, 0.1332205, 3.938158, 1, 1, 1, 1, 1,
0.8583919, 2.0697, 1.351886, 1, 1, 1, 1, 1,
0.8606139, -0.9018834, 4.722194, 1, 1, 1, 1, 1,
0.8623532, 1.278742, 0.5247619, 1, 1, 1, 1, 1,
0.8627666, -0.2788554, 2.270141, 1, 1, 1, 1, 1,
0.8644543, -0.275403, 2.200501, 1, 1, 1, 1, 1,
0.866809, -0.8248345, 3.310757, 1, 1, 1, 1, 1,
0.8671272, 1.177636, -0.01402502, 1, 1, 1, 1, 1,
0.867752, 3.195594, -2.13439, 1, 1, 1, 1, 1,
0.8677521, 0.545234, 0.9590949, 0, 0, 1, 1, 1,
0.8680366, 0.3655262, 1.778617, 1, 0, 0, 1, 1,
0.8687229, 1.44127, 2.369124, 1, 0, 0, 1, 1,
0.8704079, -0.6661017, 2.681021, 1, 0, 0, 1, 1,
0.8773911, -0.4228702, 1.289487, 1, 0, 0, 1, 1,
0.8793534, 0.6522006, 1.520766, 1, 0, 0, 1, 1,
0.8813258, 0.4232236, 1.150388, 0, 0, 0, 1, 1,
0.882912, -1.420468, 4.29774, 0, 0, 0, 1, 1,
0.8848035, 0.3004705, 1.221357, 0, 0, 0, 1, 1,
0.8888658, 2.4394, 1.197792, 0, 0, 0, 1, 1,
0.8977404, 0.8473663, 0.1881939, 0, 0, 0, 1, 1,
0.8979001, 0.8315083, 2.001671, 0, 0, 0, 1, 1,
0.9025496, -0.615985, 2.415826, 0, 0, 0, 1, 1,
0.9043629, 0.2295684, 1.385194, 1, 1, 1, 1, 1,
0.9067374, 0.8111657, 0.198409, 1, 1, 1, 1, 1,
0.9082624, 2.522337, -1.763169, 1, 1, 1, 1, 1,
0.9196754, 0.04877051, 1.891821, 1, 1, 1, 1, 1,
0.9198821, -2.5409, 2.804824, 1, 1, 1, 1, 1,
0.9255249, 0.007162027, 0.7857291, 1, 1, 1, 1, 1,
0.9267672, 0.1074625, 2.227637, 1, 1, 1, 1, 1,
0.931901, -1.418359, 2.371076, 1, 1, 1, 1, 1,
0.9335582, 0.861751, 0.8321635, 1, 1, 1, 1, 1,
0.9375883, -0.04430277, 2.214399, 1, 1, 1, 1, 1,
0.9402785, 1.165063, 2.115482, 1, 1, 1, 1, 1,
0.9432715, -0.04426746, 1.074726, 1, 1, 1, 1, 1,
0.9446733, 0.2508597, 1.862424, 1, 1, 1, 1, 1,
0.9459453, 1.539851, 0.26571, 1, 1, 1, 1, 1,
0.948794, -0.8501266, 3.926156, 1, 1, 1, 1, 1,
0.9503115, 0.1747542, 2.347327, 0, 0, 1, 1, 1,
0.9526866, 0.5089207, 2.916299, 1, 0, 0, 1, 1,
0.9652923, -0.3771006, 0.2139794, 1, 0, 0, 1, 1,
0.9817742, -0.1247768, 2.519533, 1, 0, 0, 1, 1,
0.9882964, 0.5357666, 0.3179097, 1, 0, 0, 1, 1,
0.9892248, 0.8057368, -0.561461, 1, 0, 0, 1, 1,
0.9929332, -1.056092, 2.789776, 0, 0, 0, 1, 1,
0.9946249, 0.1426225, 0.2785033, 0, 0, 0, 1, 1,
0.9982932, 1.027913, 1.917962, 0, 0, 0, 1, 1,
1.001487, 0.06038587, 1.064187, 0, 0, 0, 1, 1,
1.010639, -0.0282438, 1.793977, 0, 0, 0, 1, 1,
1.016017, 0.7835888, 2.385211, 0, 0, 0, 1, 1,
1.018913, 1.620112, 0.1082062, 0, 0, 0, 1, 1,
1.022197, -0.0755671, 1.501749, 1, 1, 1, 1, 1,
1.022763, -0.6894505, 2.68583, 1, 1, 1, 1, 1,
1.031413, -0.8427421, 3.617457, 1, 1, 1, 1, 1,
1.043156, 0.9998312, 1.135062, 1, 1, 1, 1, 1,
1.043239, 0.1641488, 1.287769, 1, 1, 1, 1, 1,
1.06396, 1.463615, -0.4903516, 1, 1, 1, 1, 1,
1.066568, -0.9411141, 1.479281, 1, 1, 1, 1, 1,
1.074525, 0.9222119, 1.561505, 1, 1, 1, 1, 1,
1.076816, -0.9335417, 0.2260631, 1, 1, 1, 1, 1,
1.077071, -0.7546775, 1.976374, 1, 1, 1, 1, 1,
1.084361, 0.1937851, 1.636143, 1, 1, 1, 1, 1,
1.088715, 0.1926196, 1.705531, 1, 1, 1, 1, 1,
1.090215, -3.512927, 4.026528, 1, 1, 1, 1, 1,
1.095515, 0.04093352, 0.07554469, 1, 1, 1, 1, 1,
1.096243, 0.6231495, 0.8752209, 1, 1, 1, 1, 1,
1.099629, -1.190046, 0.04794927, 0, 0, 1, 1, 1,
1.103956, -1.006005, 2.389425, 1, 0, 0, 1, 1,
1.130481, 0.3495983, 0.9907141, 1, 0, 0, 1, 1,
1.135116, 0.9472629, 1.440667, 1, 0, 0, 1, 1,
1.136973, 2.22084, 0.718484, 1, 0, 0, 1, 1,
1.141019, 0.5021687, 0.03993196, 1, 0, 0, 1, 1,
1.142099, 0.06156293, 2.640623, 0, 0, 0, 1, 1,
1.161427, -0.634517, 1.942892, 0, 0, 0, 1, 1,
1.163105, 0.2477476, 0.9979686, 0, 0, 0, 1, 1,
1.168741, 1.529208, 1.160924, 0, 0, 0, 1, 1,
1.174376, -0.2805537, 2.437772, 0, 0, 0, 1, 1,
1.178032, 0.2853955, 1.4446, 0, 0, 0, 1, 1,
1.178798, -0.08371893, 3.756322, 0, 0, 0, 1, 1,
1.18353, -0.2694641, 2.060492, 1, 1, 1, 1, 1,
1.18925, 0.3371861, 1.373639, 1, 1, 1, 1, 1,
1.191481, 1.040724, 0.1113537, 1, 1, 1, 1, 1,
1.192532, 1.66697, 0.1304508, 1, 1, 1, 1, 1,
1.199584, -0.2954865, 1.366467, 1, 1, 1, 1, 1,
1.203878, -0.1911293, 1.390323, 1, 1, 1, 1, 1,
1.210262, -0.3551019, 2.97693, 1, 1, 1, 1, 1,
1.219187, -0.4043772, 1.751117, 1, 1, 1, 1, 1,
1.226603, 0.4534741, 1.26287, 1, 1, 1, 1, 1,
1.230784, 0.03270661, 1.863473, 1, 1, 1, 1, 1,
1.232418, 1.259308, 1.976452, 1, 1, 1, 1, 1,
1.233799, -0.9921252, -0.006340818, 1, 1, 1, 1, 1,
1.235911, -0.8276704, 1.913352, 1, 1, 1, 1, 1,
1.236962, -0.2936119, 1.823581, 1, 1, 1, 1, 1,
1.241515, -1.392304, 2.147789, 1, 1, 1, 1, 1,
1.2476, -0.9013167, 1.37944, 0, 0, 1, 1, 1,
1.249206, -0.8274632, 2.464212, 1, 0, 0, 1, 1,
1.24922, 0.6848862, 1.635005, 1, 0, 0, 1, 1,
1.249434, -1.032686, 3.299708, 1, 0, 0, 1, 1,
1.251427, -1.109456, 1.382381, 1, 0, 0, 1, 1,
1.252801, -0.762242, 4.038259, 1, 0, 0, 1, 1,
1.257258, -1.461035, 2.63914, 0, 0, 0, 1, 1,
1.260501, 0.3689535, 1.160536, 0, 0, 0, 1, 1,
1.262286, 0.8804212, 3.815572, 0, 0, 0, 1, 1,
1.277149, -0.9094821, 0.4839162, 0, 0, 0, 1, 1,
1.277815, -1.073724, 2.132216, 0, 0, 0, 1, 1,
1.278978, -0.05682281, 1.855475, 0, 0, 0, 1, 1,
1.302073, 0.8627383, 1.430302, 0, 0, 0, 1, 1,
1.303445, -1.728829, 2.480395, 1, 1, 1, 1, 1,
1.306293, 0.7053235, 2.066699, 1, 1, 1, 1, 1,
1.306347, 0.5073951, 1.214076, 1, 1, 1, 1, 1,
1.307443, -0.04839901, 1.429595, 1, 1, 1, 1, 1,
1.334192, 0.5866205, 1.530644, 1, 1, 1, 1, 1,
1.363802, -1.643443, 2.33904, 1, 1, 1, 1, 1,
1.372092, -0.6533312, 1.176534, 1, 1, 1, 1, 1,
1.37693, 1.403138, 0.01283258, 1, 1, 1, 1, 1,
1.377005, 1.40208, 2.481538, 1, 1, 1, 1, 1,
1.377079, 0.3012731, -0.4477849, 1, 1, 1, 1, 1,
1.379617, -0.9277748, 2.368619, 1, 1, 1, 1, 1,
1.380064, 0.8723987, 1.098101, 1, 1, 1, 1, 1,
1.387515, -0.7289907, 1.343999, 1, 1, 1, 1, 1,
1.395452, -1.387887, 1.861593, 1, 1, 1, 1, 1,
1.399279, 0.6695122, 1.524674, 1, 1, 1, 1, 1,
1.402772, -0.133738, -0.9229802, 0, 0, 1, 1, 1,
1.415103, 0.9568782, 1.102634, 1, 0, 0, 1, 1,
1.416377, -0.9652414, 2.50811, 1, 0, 0, 1, 1,
1.425179, 0.5167665, 2.149365, 1, 0, 0, 1, 1,
1.425456, -0.5343252, 2.329547, 1, 0, 0, 1, 1,
1.430118, 1.629976, 0.4640801, 1, 0, 0, 1, 1,
1.438947, 1.158583, 0.3556865, 0, 0, 0, 1, 1,
1.448167, 0.794602, 0.6497628, 0, 0, 0, 1, 1,
1.44879, -1.565516, 1.149278, 0, 0, 0, 1, 1,
1.452265, 0.4960572, 0.3053062, 0, 0, 0, 1, 1,
1.471791, 0.1059737, 2.097423, 0, 0, 0, 1, 1,
1.473399, -0.7980043, 2.512181, 0, 0, 0, 1, 1,
1.483657, 1.02888, 1.602228, 0, 0, 0, 1, 1,
1.487125, -0.3317576, 2.24364, 1, 1, 1, 1, 1,
1.488801, -0.1237002, 1.551746, 1, 1, 1, 1, 1,
1.489182, -0.4323044, 1.598845, 1, 1, 1, 1, 1,
1.494451, -2.114349, 2.091839, 1, 1, 1, 1, 1,
1.500275, -0.2088884, 2.504394, 1, 1, 1, 1, 1,
1.532516, 0.1464152, 0.1653547, 1, 1, 1, 1, 1,
1.544265, -0.08648707, 1.243347, 1, 1, 1, 1, 1,
1.548134, 1.974345, 1.497332, 1, 1, 1, 1, 1,
1.552288, 0.8578628, 1.322921, 1, 1, 1, 1, 1,
1.584532, -0.4738664, 1.378479, 1, 1, 1, 1, 1,
1.61108, -1.440479, 2.794117, 1, 1, 1, 1, 1,
1.612214, -1.243073, 2.229207, 1, 1, 1, 1, 1,
1.61339, 0.0004874907, 1.555773, 1, 1, 1, 1, 1,
1.613909, 0.002677346, 2.287292, 1, 1, 1, 1, 1,
1.616526, -0.5756438, 3.570411, 1, 1, 1, 1, 1,
1.628746, 0.7304761, 1.384324, 0, 0, 1, 1, 1,
1.633714, -1.543385, 4.017549, 1, 0, 0, 1, 1,
1.638433, 0.2075031, -0.1328098, 1, 0, 0, 1, 1,
1.643604, 0.4688166, 0.5819203, 1, 0, 0, 1, 1,
1.646715, 1.148079, -0.2702016, 1, 0, 0, 1, 1,
1.662387, 0.4363375, 0.0667886, 1, 0, 0, 1, 1,
1.668069, -0.4875242, 0.5489694, 0, 0, 0, 1, 1,
1.683971, 0.4981878, 0.6067554, 0, 0, 0, 1, 1,
1.705439, -2.348384, 2.335165, 0, 0, 0, 1, 1,
1.711959, -0.5598258, 2.185939, 0, 0, 0, 1, 1,
1.719716, 1.336853, -0.08465862, 0, 0, 0, 1, 1,
1.732294, 0.7685825, -0.6288924, 0, 0, 0, 1, 1,
1.736806, -1.273286, 0.8492643, 0, 0, 0, 1, 1,
1.759114, -0.684691, 2.772493, 1, 1, 1, 1, 1,
1.778927, -0.1852631, 2.68259, 1, 1, 1, 1, 1,
1.794682, 0.5875235, -0.08530687, 1, 1, 1, 1, 1,
1.835156, 1.027145, 0.5476771, 1, 1, 1, 1, 1,
1.837069, 1.042397, 2.812709, 1, 1, 1, 1, 1,
1.840228, -1.137674, 2.957129, 1, 1, 1, 1, 1,
1.863907, 0.1131745, 0.7739512, 1, 1, 1, 1, 1,
1.873826, 1.317596, -0.5221788, 1, 1, 1, 1, 1,
1.885097, -0.2867255, 1.073681, 1, 1, 1, 1, 1,
1.915645, 0.6401529, 2.804816, 1, 1, 1, 1, 1,
1.935332, -0.1309613, 0.002246193, 1, 1, 1, 1, 1,
1.935468, -0.8012163, 1.867825, 1, 1, 1, 1, 1,
1.93977, -0.8702304, 2.933465, 1, 1, 1, 1, 1,
1.961177, 1.106372, 1.880879, 1, 1, 1, 1, 1,
1.967104, -0.5369179, 2.657447, 1, 1, 1, 1, 1,
1.993334, -0.1356976, 1.883569, 0, 0, 1, 1, 1,
2.003306, -0.1008561, 2.483737, 1, 0, 0, 1, 1,
2.006005, -0.3269484, 2.57316, 1, 0, 0, 1, 1,
2.041235, 0.1766108, 3.931563, 1, 0, 0, 1, 1,
2.051455, -0.8505316, 0.4638312, 1, 0, 0, 1, 1,
2.089982, 0.4467437, 0.2148032, 1, 0, 0, 1, 1,
2.104542, 0.883846, 0.5169919, 0, 0, 0, 1, 1,
2.136354, -0.1245769, 1.286947, 0, 0, 0, 1, 1,
2.138742, 0.6931607, 0.009207925, 0, 0, 0, 1, 1,
2.147275, -0.06218636, 2.615752, 0, 0, 0, 1, 1,
2.1545, -0.9967722, 2.581242, 0, 0, 0, 1, 1,
2.214554, -0.2283472, 0.9038717, 0, 0, 0, 1, 1,
2.269275, 0.6817659, 0.1270376, 0, 0, 0, 1, 1,
2.370215, 0.5514482, -0.7503591, 1, 1, 1, 1, 1,
2.381301, 0.5163254, -0.5141337, 1, 1, 1, 1, 1,
2.568386, 0.4381672, 0.6262217, 1, 1, 1, 1, 1,
2.576953, -1.83587, 3.291807, 1, 1, 1, 1, 1,
2.677649, -0.2945687, 3.728566, 1, 1, 1, 1, 1,
2.823365, 0.4337525, 1.209535, 1, 1, 1, 1, 1,
3.359294, 1.430077, 1.036564, 1, 1, 1, 1, 1
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
var radius = 9.686438;
var distance = 34.0232;
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
mvMatrix.translate( -0.1034069, 0.2090452, 0.6047029 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0232);
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
