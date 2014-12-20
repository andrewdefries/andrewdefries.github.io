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
-4.806414, -1.567854, -2.927028, 1, 0, 0, 1,
-3.430109, 1.66882, -0.8863397, 1, 0.007843138, 0, 1,
-2.903543, 0.04915917, -2.301867, 1, 0.01176471, 0, 1,
-2.834486, 0.0522947, -1.55698, 1, 0.01960784, 0, 1,
-2.760554, -1.467279, -0.6456845, 1, 0.02352941, 0, 1,
-2.759429, 0.6529767, -0.7171597, 1, 0.03137255, 0, 1,
-2.500332, -0.4036449, -2.169197, 1, 0.03529412, 0, 1,
-2.461776, -0.3070608, -0.5169633, 1, 0.04313726, 0, 1,
-2.411756, -0.479575, 0.07194665, 1, 0.04705882, 0, 1,
-2.404202, 1.469076, -0.5817011, 1, 0.05490196, 0, 1,
-2.346589, 2.274594, -2.777569, 1, 0.05882353, 0, 1,
-2.198447, -2.179674, -1.685034, 1, 0.06666667, 0, 1,
-2.142134, -0.7598457, -1.761907, 1, 0.07058824, 0, 1,
-2.131115, -0.5758438, -0.2332813, 1, 0.07843138, 0, 1,
-2.124578, -0.9686784, -3.220505, 1, 0.08235294, 0, 1,
-2.096115, 0.4783994, -1.345924, 1, 0.09019608, 0, 1,
-2.09427, -0.5858633, -3.625865, 1, 0.09411765, 0, 1,
-2.056298, 2.407973, -2.056403, 1, 0.1019608, 0, 1,
-2.031891, -0.2661975, -1.701562, 1, 0.1098039, 0, 1,
-2.006853, -0.4254514, -1.75176, 1, 0.1137255, 0, 1,
-1.994305, 1.546628, -1.452739, 1, 0.1215686, 0, 1,
-1.992723, -1.263081, -2.773565, 1, 0.1254902, 0, 1,
-1.985188, -0.2669785, -0.7704304, 1, 0.1333333, 0, 1,
-1.983553, 0.5030686, -2.454153, 1, 0.1372549, 0, 1,
-1.910906, -1.091004, -2.668898, 1, 0.145098, 0, 1,
-1.903616, 1.732424, -0.9746074, 1, 0.1490196, 0, 1,
-1.900145, -0.07007944, -0.7605071, 1, 0.1568628, 0, 1,
-1.896533, -1.302748, -2.929133, 1, 0.1607843, 0, 1,
-1.893585, -1.041902, -1.834832, 1, 0.1686275, 0, 1,
-1.883512, -1.397479, -3.503938, 1, 0.172549, 0, 1,
-1.879689, 1.552325, -1.291628, 1, 0.1803922, 0, 1,
-1.860027, 0.6657522, -1.848603, 1, 0.1843137, 0, 1,
-1.846453, 1.623495, -1.120902, 1, 0.1921569, 0, 1,
-1.838003, -0.8146436, -0.4800928, 1, 0.1960784, 0, 1,
-1.830191, 0.2260447, -0.9974467, 1, 0.2039216, 0, 1,
-1.821123, -0.2209531, -2.431237, 1, 0.2117647, 0, 1,
-1.807922, 0.1252472, -1.293746, 1, 0.2156863, 0, 1,
-1.798068, 0.7480609, -4.065942, 1, 0.2235294, 0, 1,
-1.784508, -1.502578, -1.44098, 1, 0.227451, 0, 1,
-1.779268, 0.6498029, -2.847853, 1, 0.2352941, 0, 1,
-1.77445, -0.5261928, -2.15233, 1, 0.2392157, 0, 1,
-1.734794, -1.787231, -3.183271, 1, 0.2470588, 0, 1,
-1.721943, 0.1661322, -2.241554, 1, 0.2509804, 0, 1,
-1.721318, 0.7416691, -2.379392, 1, 0.2588235, 0, 1,
-1.711202, 1.581675, 0.4638248, 1, 0.2627451, 0, 1,
-1.704018, -0.2865514, -1.227809, 1, 0.2705882, 0, 1,
-1.701966, 1.447328, -1.537722, 1, 0.2745098, 0, 1,
-1.699789, 1.536692, 0.1005743, 1, 0.282353, 0, 1,
-1.67995, -0.0699582, -2.803118, 1, 0.2862745, 0, 1,
-1.668717, -0.1309905, -0.3930199, 1, 0.2941177, 0, 1,
-1.65106, 0.4261145, -1.563326, 1, 0.3019608, 0, 1,
-1.644248, 1.322326, 0.06053067, 1, 0.3058824, 0, 1,
-1.63989, -0.8976478, -0.9233422, 1, 0.3137255, 0, 1,
-1.62153, -2.967369, -2.132976, 1, 0.3176471, 0, 1,
-1.619674, -1.095446, -2.807047, 1, 0.3254902, 0, 1,
-1.605616, -0.6712622, -1.090535, 1, 0.3294118, 0, 1,
-1.584876, 0.7280744, -2.373781, 1, 0.3372549, 0, 1,
-1.579695, -0.404514, -1.374301, 1, 0.3411765, 0, 1,
-1.572176, -0.3385, -0.4957038, 1, 0.3490196, 0, 1,
-1.571133, -1.208896, -0.7375589, 1, 0.3529412, 0, 1,
-1.563887, -0.2786171, -2.207442, 1, 0.3607843, 0, 1,
-1.562666, -0.1878904, -3.134247, 1, 0.3647059, 0, 1,
-1.555211, -0.9553789, -1.188808, 1, 0.372549, 0, 1,
-1.541212, -0.166709, -1.08531, 1, 0.3764706, 0, 1,
-1.53992, 0.407665, -1.762121, 1, 0.3843137, 0, 1,
-1.535706, 0.886826, -3.754323, 1, 0.3882353, 0, 1,
-1.533849, -1.089476, -1.948313, 1, 0.3960784, 0, 1,
-1.52833, -0.1763815, -2.010392, 1, 0.4039216, 0, 1,
-1.518459, -0.07326715, -2.690985, 1, 0.4078431, 0, 1,
-1.513396, 0.4817709, -1.45488, 1, 0.4156863, 0, 1,
-1.512963, -0.716523, -1.66564, 1, 0.4196078, 0, 1,
-1.502769, -1.326295, -0.8013018, 1, 0.427451, 0, 1,
-1.486644, -0.6618579, -2.007164, 1, 0.4313726, 0, 1,
-1.486515, 0.4438447, 0.8019699, 1, 0.4392157, 0, 1,
-1.482177, 0.3537208, -1.241708, 1, 0.4431373, 0, 1,
-1.481801, -1.168321, -2.734922, 1, 0.4509804, 0, 1,
-1.46335, -0.5007464, -0.4687195, 1, 0.454902, 0, 1,
-1.452172, 0.3182912, -4.033565, 1, 0.4627451, 0, 1,
-1.447135, -0.3666118, -2.559336, 1, 0.4666667, 0, 1,
-1.442228, -0.2753909, -3.15617, 1, 0.4745098, 0, 1,
-1.43439, -2.541974, -4.41207, 1, 0.4784314, 0, 1,
-1.406675, 1.654559, 0.3668294, 1, 0.4862745, 0, 1,
-1.398452, -0.7514095, -3.176418, 1, 0.4901961, 0, 1,
-1.389761, 0.7583604, -2.295279, 1, 0.4980392, 0, 1,
-1.378837, -0.8542458, -3.607158, 1, 0.5058824, 0, 1,
-1.375221, -0.1685795, -1.881757, 1, 0.509804, 0, 1,
-1.372416, 0.7060414, -0.6096508, 1, 0.5176471, 0, 1,
-1.370142, -1.450598, -2.265669, 1, 0.5215687, 0, 1,
-1.368254, 1.332334, -0.7106068, 1, 0.5294118, 0, 1,
-1.363337, -0.6014544, -0.242631, 1, 0.5333334, 0, 1,
-1.355604, 0.6382728, -1.289044, 1, 0.5411765, 0, 1,
-1.347586, 1.627808, -1.400861, 1, 0.5450981, 0, 1,
-1.34318, -0.05226048, -2.161512, 1, 0.5529412, 0, 1,
-1.342574, -1.320538, -1.235405, 1, 0.5568628, 0, 1,
-1.32706, -1.540908, -2.143334, 1, 0.5647059, 0, 1,
-1.32607, 2.444224, -1.145069, 1, 0.5686275, 0, 1,
-1.324793, 0.2119046, -2.501607, 1, 0.5764706, 0, 1,
-1.322709, 1.369234, -0.6003062, 1, 0.5803922, 0, 1,
-1.311744, 0.3673542, -0.7852615, 1, 0.5882353, 0, 1,
-1.302466, -0.09972373, -1.94895, 1, 0.5921569, 0, 1,
-1.300269, 0.8363914, -2.038822, 1, 0.6, 0, 1,
-1.294941, 0.6517376, -0.3586998, 1, 0.6078432, 0, 1,
-1.282829, 2.267712, -1.402512, 1, 0.6117647, 0, 1,
-1.267006, 2.015208, 0.3198363, 1, 0.6196079, 0, 1,
-1.253144, -0.1901137, -2.243237, 1, 0.6235294, 0, 1,
-1.240277, 0.1942085, -0.6567855, 1, 0.6313726, 0, 1,
-1.233057, 0.5370758, 1.009184, 1, 0.6352941, 0, 1,
-1.230606, -0.5227258, -2.233549, 1, 0.6431373, 0, 1,
-1.228469, 2.323309, -1.026516, 1, 0.6470588, 0, 1,
-1.226117, 0.9479743, -0.7856319, 1, 0.654902, 0, 1,
-1.226031, 0.3298062, -0.4968414, 1, 0.6588235, 0, 1,
-1.214307, -0.2700083, -0.9179793, 1, 0.6666667, 0, 1,
-1.212816, 0.5319437, 0.7233217, 1, 0.6705883, 0, 1,
-1.209318, -1.490233, -1.384765, 1, 0.6784314, 0, 1,
-1.2044, -2.918023, -3.767678, 1, 0.682353, 0, 1,
-1.202642, -0.81029, -3.015245, 1, 0.6901961, 0, 1,
-1.200309, 1.323519, 0.2005791, 1, 0.6941177, 0, 1,
-1.195385, -0.1917026, -2.694735, 1, 0.7019608, 0, 1,
-1.194672, -1.260212, -2.90183, 1, 0.7098039, 0, 1,
-1.191733, 0.2199332, -0.5101606, 1, 0.7137255, 0, 1,
-1.186797, -1.655406, -1.227736, 1, 0.7215686, 0, 1,
-1.183188, -0.8112905, -1.95045, 1, 0.7254902, 0, 1,
-1.181576, -1.012762, -2.404535, 1, 0.7333333, 0, 1,
-1.181215, 1.52338, -3.099676, 1, 0.7372549, 0, 1,
-1.177959, 0.9232001, -0.8572525, 1, 0.7450981, 0, 1,
-1.175728, 1.339218, -0.1775976, 1, 0.7490196, 0, 1,
-1.170394, -1.467903, -1.391251, 1, 0.7568628, 0, 1,
-1.169401, 0.9054388, 0.5650061, 1, 0.7607843, 0, 1,
-1.164575, -2.263001, -0.1883492, 1, 0.7686275, 0, 1,
-1.163261, 1.610461, -1.814721, 1, 0.772549, 0, 1,
-1.162573, 0.5409811, -0.1498397, 1, 0.7803922, 0, 1,
-1.154284, 0.7699862, -1.060077, 1, 0.7843137, 0, 1,
-1.153892, -0.6699446, -1.307095, 1, 0.7921569, 0, 1,
-1.148462, 1.686449, -2.382096, 1, 0.7960784, 0, 1,
-1.14432, -1.162999, -4.057635, 1, 0.8039216, 0, 1,
-1.143665, 1.16533, -2.283614, 1, 0.8117647, 0, 1,
-1.139245, 0.2033277, -1.467533, 1, 0.8156863, 0, 1,
-1.13203, 1.110134, -1.30155, 1, 0.8235294, 0, 1,
-1.129543, -0.0175227, -1.66547, 1, 0.827451, 0, 1,
-1.129297, -0.100461, -1.369042, 1, 0.8352941, 0, 1,
-1.123041, 0.2817108, -2.682755, 1, 0.8392157, 0, 1,
-1.122709, 0.2811658, -0.9767793, 1, 0.8470588, 0, 1,
-1.122226, -0.8128639, -0.7845022, 1, 0.8509804, 0, 1,
-1.119051, -0.5959646, -1.593013, 1, 0.8588235, 0, 1,
-1.118227, 0.7496514, -1.12166, 1, 0.8627451, 0, 1,
-1.117632, -1.067484, -2.430389, 1, 0.8705882, 0, 1,
-1.114226, 0.03294403, -1.665635, 1, 0.8745098, 0, 1,
-1.112415, -0.2876168, -2.824679, 1, 0.8823529, 0, 1,
-1.109528, 0.5595615, -1.049221, 1, 0.8862745, 0, 1,
-1.109154, 3.469924, -0.3339102, 1, 0.8941177, 0, 1,
-1.106853, -0.6552594, -2.560038, 1, 0.8980392, 0, 1,
-1.106588, 0.8850894, -0.5641391, 1, 0.9058824, 0, 1,
-1.103468, -0.3305517, -3.137094, 1, 0.9137255, 0, 1,
-1.102365, -1.440274, -4.236444, 1, 0.9176471, 0, 1,
-1.090205, -0.4027685, -2.171642, 1, 0.9254902, 0, 1,
-1.085304, -1.249306, -3.158079, 1, 0.9294118, 0, 1,
-1.082397, 0.256784, -1.891766, 1, 0.9372549, 0, 1,
-1.082343, 0.03454254, -2.59324, 1, 0.9411765, 0, 1,
-1.08221, 0.01858114, 0.009394101, 1, 0.9490196, 0, 1,
-1.081205, -0.586101, -0.7723094, 1, 0.9529412, 0, 1,
-1.080101, 0.1811078, 0.04939908, 1, 0.9607843, 0, 1,
-1.079586, -1.201103, -1.641938, 1, 0.9647059, 0, 1,
-1.067323, -0.09338997, -2.044058, 1, 0.972549, 0, 1,
-1.052086, 0.8988843, -0.9757206, 1, 0.9764706, 0, 1,
-1.050245, -1.406084, -3.630778, 1, 0.9843137, 0, 1,
-1.04919, 0.2305991, -1.138968, 1, 0.9882353, 0, 1,
-1.048267, -1.618177, -4.015086, 1, 0.9960784, 0, 1,
-1.047645, 1.237544, -1.022543, 0.9960784, 1, 0, 1,
-1.04585, 0.02660731, -0.5029308, 0.9921569, 1, 0, 1,
-1.038557, -0.06352215, -1.35584, 0.9843137, 1, 0, 1,
-1.037861, -0.1429353, 0.1535923, 0.9803922, 1, 0, 1,
-1.035662, 0.9221733, -0.8277345, 0.972549, 1, 0, 1,
-1.035572, 0.9078727, -1.194133, 0.9686275, 1, 0, 1,
-1.033302, 1.118984, 0.4771207, 0.9607843, 1, 0, 1,
-1.026744, -2.083143, -2.315369, 0.9568627, 1, 0, 1,
-1.021228, -1.312343, -2.9356, 0.9490196, 1, 0, 1,
-1.011775, -0.6830713, -2.547523, 0.945098, 1, 0, 1,
-1.004356, 1.318988, -0.5695514, 0.9372549, 1, 0, 1,
-1.000262, -0.7267035, -3.020478, 0.9333333, 1, 0, 1,
-0.9994766, -0.4243401, -2.630188, 0.9254902, 1, 0, 1,
-0.9886136, 0.5551453, -0.3406724, 0.9215686, 1, 0, 1,
-0.9807893, 0.162819, -0.08775964, 0.9137255, 1, 0, 1,
-0.9713137, -0.08569448, -1.835798, 0.9098039, 1, 0, 1,
-0.9643651, 1.68307, -0.5949809, 0.9019608, 1, 0, 1,
-0.9565994, 0.2059452, -2.847362, 0.8941177, 1, 0, 1,
-0.9540689, 2.199293, -1.019135, 0.8901961, 1, 0, 1,
-0.9491778, 0.3181388, -1.325216, 0.8823529, 1, 0, 1,
-0.9472173, -1.495985, -4.204687, 0.8784314, 1, 0, 1,
-0.9445274, 0.0436204, -0.9293748, 0.8705882, 1, 0, 1,
-0.9444076, 0.9096288, -2.904456, 0.8666667, 1, 0, 1,
-0.9425685, -2.550291, -3.109567, 0.8588235, 1, 0, 1,
-0.9396828, -1.285139, -2.650224, 0.854902, 1, 0, 1,
-0.930424, -0.7628704, -2.124345, 0.8470588, 1, 0, 1,
-0.9294297, 0.4067482, 0.2539258, 0.8431373, 1, 0, 1,
-0.9250934, 0.9176624, 0.2210082, 0.8352941, 1, 0, 1,
-0.9231636, -0.8864403, -1.587188, 0.8313726, 1, 0, 1,
-0.9163133, -0.4633795, -2.62567, 0.8235294, 1, 0, 1,
-0.9081854, -1.151349, -1.632383, 0.8196079, 1, 0, 1,
-0.9047177, -1.333594, -2.34147, 0.8117647, 1, 0, 1,
-0.8943394, 1.390335, -0.8280444, 0.8078431, 1, 0, 1,
-0.8881077, 1.052141, 0.04203357, 0.8, 1, 0, 1,
-0.8880592, -1.382945, -1.902206, 0.7921569, 1, 0, 1,
-0.8803977, -0.1478188, -0.3932532, 0.7882353, 1, 0, 1,
-0.8757831, -0.3969943, -1.752377, 0.7803922, 1, 0, 1,
-0.8729083, 1.782495, 0.3382521, 0.7764706, 1, 0, 1,
-0.8708674, -1.428268, -2.460991, 0.7686275, 1, 0, 1,
-0.8634963, 1.019963, -1.056861, 0.7647059, 1, 0, 1,
-0.8622346, 0.8855391, -1.263148, 0.7568628, 1, 0, 1,
-0.8603628, 0.4954704, -0.293961, 0.7529412, 1, 0, 1,
-0.8594175, 0.1271607, -2.245266, 0.7450981, 1, 0, 1,
-0.8588874, 1.858962, 0.9913087, 0.7411765, 1, 0, 1,
-0.8556069, 0.6788889, -2.714922, 0.7333333, 1, 0, 1,
-0.8542621, 1.115548, -1.621443, 0.7294118, 1, 0, 1,
-0.8523824, -0.1581538, -0.9580973, 0.7215686, 1, 0, 1,
-0.8474529, 0.4595098, -1.764198, 0.7176471, 1, 0, 1,
-0.8360077, 0.6766586, -0.6427733, 0.7098039, 1, 0, 1,
-0.8306884, -0.7528653, -2.230894, 0.7058824, 1, 0, 1,
-0.8262334, 1.06863, -0.6605043, 0.6980392, 1, 0, 1,
-0.8239965, 1.408505, 0.2635328, 0.6901961, 1, 0, 1,
-0.8234122, -0.6348953, -2.967106, 0.6862745, 1, 0, 1,
-0.8199069, 2.830601, -0.5804088, 0.6784314, 1, 0, 1,
-0.8145784, -0.01873568, -1.282364, 0.6745098, 1, 0, 1,
-0.8099291, 0.1088338, 0.4626629, 0.6666667, 1, 0, 1,
-0.8099049, 0.04674881, -3.349924, 0.6627451, 1, 0, 1,
-0.8080828, -0.240094, -1.705971, 0.654902, 1, 0, 1,
-0.8075897, -0.2824036, -1.927487, 0.6509804, 1, 0, 1,
-0.8028871, -1.063623, -1.174058, 0.6431373, 1, 0, 1,
-0.7977071, 1.886486, -1.096533, 0.6392157, 1, 0, 1,
-0.7933969, -0.7641891, -2.005136, 0.6313726, 1, 0, 1,
-0.7900387, -1.835005, -4.244812, 0.627451, 1, 0, 1,
-0.7890693, -0.3555109, -2.190084, 0.6196079, 1, 0, 1,
-0.7832696, -0.3378784, -0.9319106, 0.6156863, 1, 0, 1,
-0.7783264, -0.5524497, -2.80168, 0.6078432, 1, 0, 1,
-0.7754922, -0.6678702, -2.887326, 0.6039216, 1, 0, 1,
-0.7639533, -2.419762, -3.183006, 0.5960785, 1, 0, 1,
-0.7629938, -0.5448071, -2.335308, 0.5882353, 1, 0, 1,
-0.7627341, -1.733277, -3.815141, 0.5843138, 1, 0, 1,
-0.7535404, 0.8284504, -2.074158, 0.5764706, 1, 0, 1,
-0.7502976, 0.4425174, -0.3233277, 0.572549, 1, 0, 1,
-0.7486042, -1.333783, -2.005937, 0.5647059, 1, 0, 1,
-0.7365882, 0.8414466, -1.056754, 0.5607843, 1, 0, 1,
-0.7338642, -0.4729908, -2.09873, 0.5529412, 1, 0, 1,
-0.7279835, -0.190623, -2.728283, 0.5490196, 1, 0, 1,
-0.7251703, 0.1718515, -0.2768296, 0.5411765, 1, 0, 1,
-0.7218667, 0.1010376, -2.107735, 0.5372549, 1, 0, 1,
-0.710956, 1.57733, -1.232851, 0.5294118, 1, 0, 1,
-0.710277, -2.827637, -3.627091, 0.5254902, 1, 0, 1,
-0.7100886, -1.786979, -1.423406, 0.5176471, 1, 0, 1,
-0.7013322, -0.16256, -1.30734, 0.5137255, 1, 0, 1,
-0.7008284, -0.3428225, -3.411711, 0.5058824, 1, 0, 1,
-0.699116, -1.367491, -2.485479, 0.5019608, 1, 0, 1,
-0.6978641, -0.5834389, -0.7021674, 0.4941176, 1, 0, 1,
-0.6950701, 0.380285, -0.839532, 0.4862745, 1, 0, 1,
-0.69425, -0.4356282, -3.932283, 0.4823529, 1, 0, 1,
-0.6911425, -1.202186, -1.455777, 0.4745098, 1, 0, 1,
-0.691012, 0.2792514, -0.4541474, 0.4705882, 1, 0, 1,
-0.6893324, -0.02227071, -1.117515, 0.4627451, 1, 0, 1,
-0.689212, -1.168627, -3.016449, 0.4588235, 1, 0, 1,
-0.6838956, -0.09113746, -2.58751, 0.4509804, 1, 0, 1,
-0.6766551, 0.7130324, -2.819806, 0.4470588, 1, 0, 1,
-0.6713387, 0.3572558, -1.288884, 0.4392157, 1, 0, 1,
-0.6705018, 0.2125929, -1.23309, 0.4352941, 1, 0, 1,
-0.6702506, -1.051973, -2.787098, 0.427451, 1, 0, 1,
-0.6672393, 0.2280483, 0.415317, 0.4235294, 1, 0, 1,
-0.666345, -1.173235, -2.157869, 0.4156863, 1, 0, 1,
-0.6561566, 0.09547938, -1.094813, 0.4117647, 1, 0, 1,
-0.6523982, -0.05704385, -0.3761801, 0.4039216, 1, 0, 1,
-0.649429, 1.031417, -0.2041164, 0.3960784, 1, 0, 1,
-0.6489753, -1.738358, -2.987643, 0.3921569, 1, 0, 1,
-0.6470543, -1.12945, -3.986326, 0.3843137, 1, 0, 1,
-0.6468456, 0.9106728, -0.470846, 0.3803922, 1, 0, 1,
-0.6468274, 1.244116, -0.7736934, 0.372549, 1, 0, 1,
-0.6453796, -1.746163, -3.283734, 0.3686275, 1, 0, 1,
-0.6435193, 0.7032369, -2.926733, 0.3607843, 1, 0, 1,
-0.6363552, 0.08180793, -0.785158, 0.3568628, 1, 0, 1,
-0.6361759, -1.723459, -3.143163, 0.3490196, 1, 0, 1,
-0.6293747, -0.02347959, -0.5626633, 0.345098, 1, 0, 1,
-0.6198721, -0.466217, -2.598773, 0.3372549, 1, 0, 1,
-0.611276, -0.9974992, -2.729041, 0.3333333, 1, 0, 1,
-0.607387, 0.01120544, 0.2741102, 0.3254902, 1, 0, 1,
-0.6050367, 1.092047, 0.6416327, 0.3215686, 1, 0, 1,
-0.5996116, 0.666622, -1.570672, 0.3137255, 1, 0, 1,
-0.5971905, -0.2248831, -2.180476, 0.3098039, 1, 0, 1,
-0.5908464, 0.7202625, -1.092553, 0.3019608, 1, 0, 1,
-0.5878248, -0.496908, -3.998493, 0.2941177, 1, 0, 1,
-0.5871893, -1.498734, -4.361192, 0.2901961, 1, 0, 1,
-0.5822388, 0.645008, -0.7591846, 0.282353, 1, 0, 1,
-0.5816664, 0.6355703, 0.7045752, 0.2784314, 1, 0, 1,
-0.5794711, -0.3068668, -0.3743305, 0.2705882, 1, 0, 1,
-0.5786306, -0.4199569, -2.870223, 0.2666667, 1, 0, 1,
-0.5742749, 1.802788, 0.6400203, 0.2588235, 1, 0, 1,
-0.5711746, 1.297166, -0.1333011, 0.254902, 1, 0, 1,
-0.5692947, -0.2851913, -2.926392, 0.2470588, 1, 0, 1,
-0.567474, -1.363803, -1.364261, 0.2431373, 1, 0, 1,
-0.5664397, 2.04351, 0.6873959, 0.2352941, 1, 0, 1,
-0.56552, 0.008807172, -2.052448, 0.2313726, 1, 0, 1,
-0.5589994, -0.4894029, -1.79953, 0.2235294, 1, 0, 1,
-0.5579104, 0.8709717, -1.346017, 0.2196078, 1, 0, 1,
-0.5533686, 0.7133785, -3.207193, 0.2117647, 1, 0, 1,
-0.551726, -0.07370892, -1.626268, 0.2078431, 1, 0, 1,
-0.5504292, -1.253886, -4.248951, 0.2, 1, 0, 1,
-0.5472065, -1.123623, -3.385281, 0.1921569, 1, 0, 1,
-0.5369681, 0.3855663, -2.075534, 0.1882353, 1, 0, 1,
-0.5367926, -0.2172053, -1.819392, 0.1803922, 1, 0, 1,
-0.5352462, -0.716288, -2.733677, 0.1764706, 1, 0, 1,
-0.5346032, 0.05019267, -0.6841901, 0.1686275, 1, 0, 1,
-0.5268505, 0.5356628, 1.066268, 0.1647059, 1, 0, 1,
-0.5142568, 0.6556883, -0.4686388, 0.1568628, 1, 0, 1,
-0.5141963, 1.341259, -0.05739465, 0.1529412, 1, 0, 1,
-0.4960793, -0.4246553, -2.969295, 0.145098, 1, 0, 1,
-0.4951939, -0.5884387, -1.896981, 0.1411765, 1, 0, 1,
-0.4947142, -1.362265, -3.006085, 0.1333333, 1, 0, 1,
-0.486801, 0.6849258, -2.069325, 0.1294118, 1, 0, 1,
-0.4858651, -0.2980226, -0.5393729, 0.1215686, 1, 0, 1,
-0.4851059, 1.164694, -0.8312569, 0.1176471, 1, 0, 1,
-0.4849499, 0.5123559, -2.801753, 0.1098039, 1, 0, 1,
-0.4845771, 0.3416815, -1.549742, 0.1058824, 1, 0, 1,
-0.479267, 0.008852225, -0.4198867, 0.09803922, 1, 0, 1,
-0.4792092, 0.3528758, -0.3498424, 0.09019608, 1, 0, 1,
-0.4763955, 1.293819, 0.7606117, 0.08627451, 1, 0, 1,
-0.4704424, 0.3861169, -1.87303, 0.07843138, 1, 0, 1,
-0.4704385, -0.2257327, -2.60781, 0.07450981, 1, 0, 1,
-0.4667031, -0.4446039, -1.591243, 0.06666667, 1, 0, 1,
-0.4640079, 0.8868942, -0.4579395, 0.0627451, 1, 0, 1,
-0.4626837, -0.1727207, -2.024675, 0.05490196, 1, 0, 1,
-0.4579588, 0.8195119, 0.2883247, 0.05098039, 1, 0, 1,
-0.4542442, 0.7011683, -2.369299, 0.04313726, 1, 0, 1,
-0.4523328, -0.3827254, -1.165061, 0.03921569, 1, 0, 1,
-0.4515249, 0.6233045, 0.1596177, 0.03137255, 1, 0, 1,
-0.4484245, 1.564498, -0.5362254, 0.02745098, 1, 0, 1,
-0.4393069, 0.6086836, -0.3886833, 0.01960784, 1, 0, 1,
-0.4354801, 0.0004628606, -1.835891, 0.01568628, 1, 0, 1,
-0.4267464, -0.05256018, -1.230874, 0.007843138, 1, 0, 1,
-0.422084, 0.009975197, -1.023401, 0.003921569, 1, 0, 1,
-0.4198683, 2.190392, 2.499502, 0, 1, 0.003921569, 1,
-0.4139045, 0.01201722, -0.5661344, 0, 1, 0.01176471, 1,
-0.4138462, -1.670808, -4.76874, 0, 1, 0.01568628, 1,
-0.406613, 0.2094678, -2.243845, 0, 1, 0.02352941, 1,
-0.4024906, -1.034589e-05, -1.66204, 0, 1, 0.02745098, 1,
-0.3952944, -0.5294912, -2.781397, 0, 1, 0.03529412, 1,
-0.3945814, -0.3324682, -1.587188, 0, 1, 0.03921569, 1,
-0.385442, -0.4973948, -3.261521, 0, 1, 0.04705882, 1,
-0.3795892, 1.263158, 0.1490623, 0, 1, 0.05098039, 1,
-0.3778451, 0.7270362, -1.393201, 0, 1, 0.05882353, 1,
-0.3733562, -0.8376015, -2.475173, 0, 1, 0.0627451, 1,
-0.3715507, 0.9887387, -1.021672, 0, 1, 0.07058824, 1,
-0.3711957, 0.3366668, -2.241763, 0, 1, 0.07450981, 1,
-0.368314, 0.1971333, -0.2243266, 0, 1, 0.08235294, 1,
-0.3678257, 0.02798668, -2.000049, 0, 1, 0.08627451, 1,
-0.3658798, -0.1679421, -2.941371, 0, 1, 0.09411765, 1,
-0.3649041, 1.38154, 1.398734, 0, 1, 0.1019608, 1,
-0.3580377, 0.08653013, -1.589381, 0, 1, 0.1058824, 1,
-0.3546665, -0.1730118, -3.488713, 0, 1, 0.1137255, 1,
-0.3522237, 0.1962718, -0.9025167, 0, 1, 0.1176471, 1,
-0.3521228, 0.1106465, -0.5836825, 0, 1, 0.1254902, 1,
-0.3500848, 0.8191656, -0.1296422, 0, 1, 0.1294118, 1,
-0.3488674, -0.246472, -2.882533, 0, 1, 0.1372549, 1,
-0.3467132, -0.1616823, -2.932846, 0, 1, 0.1411765, 1,
-0.3464479, 0.1078957, -2.791587, 0, 1, 0.1490196, 1,
-0.3460483, 0.5596737, -2.295947, 0, 1, 0.1529412, 1,
-0.345686, 1.183675, 0.7698981, 0, 1, 0.1607843, 1,
-0.3428626, 0.4812268, -2.431856, 0, 1, 0.1647059, 1,
-0.3411292, -0.4459603, -2.795602, 0, 1, 0.172549, 1,
-0.3405634, -0.2086423, -3.200473, 0, 1, 0.1764706, 1,
-0.3311408, -0.009671101, -1.246277, 0, 1, 0.1843137, 1,
-0.3297473, 0.1091958, -1.783427, 0, 1, 0.1882353, 1,
-0.3297277, 0.1767565, -1.332079, 0, 1, 0.1960784, 1,
-0.327567, 1.474602, -0.5694589, 0, 1, 0.2039216, 1,
-0.3224722, -0.2776752, -1.341759, 0, 1, 0.2078431, 1,
-0.3214123, -1.672897, -5.023273, 0, 1, 0.2156863, 1,
-0.3194925, -0.6620961, -2.776826, 0, 1, 0.2196078, 1,
-0.317616, 1.739377, 0.299783, 0, 1, 0.227451, 1,
-0.3162334, 1.618659, 0.4114277, 0, 1, 0.2313726, 1,
-0.3161152, 1.587827, 0.05552034, 0, 1, 0.2392157, 1,
-0.3155014, -1.026421, -3.053857, 0, 1, 0.2431373, 1,
-0.3136701, -0.6875424, -1.891226, 0, 1, 0.2509804, 1,
-0.3106078, 0.4676165, -1.332785, 0, 1, 0.254902, 1,
-0.3083265, 0.617864, -1.744393, 0, 1, 0.2627451, 1,
-0.3040313, -0.6731879, -1.531736, 0, 1, 0.2666667, 1,
-0.296821, 0.004637485, 0.1916216, 0, 1, 0.2745098, 1,
-0.2963031, -0.1428337, -1.240113, 0, 1, 0.2784314, 1,
-0.2956077, -1.259127, -3.087005, 0, 1, 0.2862745, 1,
-0.2920235, -0.1554383, -3.787587, 0, 1, 0.2901961, 1,
-0.2891569, -0.5879872, -3.713562, 0, 1, 0.2980392, 1,
-0.2840095, -0.4210231, -2.718563, 0, 1, 0.3058824, 1,
-0.283751, -0.5302886, -3.602674, 0, 1, 0.3098039, 1,
-0.2829847, -1.062313, -2.041209, 0, 1, 0.3176471, 1,
-0.2824811, 0.2233968, -1.236533, 0, 1, 0.3215686, 1,
-0.2822067, 0.6146772, 0.06145521, 0, 1, 0.3294118, 1,
-0.2819194, 0.9028195, -1.283939, 0, 1, 0.3333333, 1,
-0.2812847, 0.4248236, -0.5338269, 0, 1, 0.3411765, 1,
-0.2773543, -0.6271138, -2.289451, 0, 1, 0.345098, 1,
-0.2741785, 1.958949, 0.02247575, 0, 1, 0.3529412, 1,
-0.2620535, -0.8448778, -1.292953, 0, 1, 0.3568628, 1,
-0.2554362, -0.02351886, -0.4581671, 0, 1, 0.3647059, 1,
-0.2538481, -0.07169526, -0.1594505, 0, 1, 0.3686275, 1,
-0.2511098, 0.514915, -0.8697116, 0, 1, 0.3764706, 1,
-0.2489373, 1.162659, 0.2150198, 0, 1, 0.3803922, 1,
-0.2369881, 0.5144185, 0.9643469, 0, 1, 0.3882353, 1,
-0.2332642, 0.4150494, -0.2768249, 0, 1, 0.3921569, 1,
-0.2299497, -0.5130466, -2.076971, 0, 1, 0.4, 1,
-0.2292267, 1.291269, -0.8064672, 0, 1, 0.4078431, 1,
-0.2262871, 1.090661, -0.937609, 0, 1, 0.4117647, 1,
-0.2247596, -0.4041477, -3.304984, 0, 1, 0.4196078, 1,
-0.2180782, -0.6788778, -3.38502, 0, 1, 0.4235294, 1,
-0.2172567, -0.9025977, -4.120427, 0, 1, 0.4313726, 1,
-0.2150134, 1.466048, -1.559437, 0, 1, 0.4352941, 1,
-0.2138514, 0.6337258, 1.131861, 0, 1, 0.4431373, 1,
-0.2110781, -0.2409932, -1.243521, 0, 1, 0.4470588, 1,
-0.2026834, -1.757907, -3.104409, 0, 1, 0.454902, 1,
-0.2019971, 0.02555035, -1.609119, 0, 1, 0.4588235, 1,
-0.1973403, 0.3520097, -0.2908662, 0, 1, 0.4666667, 1,
-0.1928989, 1.052824, -0.1725847, 0, 1, 0.4705882, 1,
-0.1926951, 0.05958864, -0.2317853, 0, 1, 0.4784314, 1,
-0.1887918, 0.3818854, -0.4438262, 0, 1, 0.4823529, 1,
-0.1860061, 0.9459779, 0.5645853, 0, 1, 0.4901961, 1,
-0.1829749, -2.056385, -4.184849, 0, 1, 0.4941176, 1,
-0.182071, 1.399273, -0.7297227, 0, 1, 0.5019608, 1,
-0.1805311, -0.7614645, -3.219637, 0, 1, 0.509804, 1,
-0.1712271, 0.4453359, -0.2221023, 0, 1, 0.5137255, 1,
-0.169726, 0.4556822, -1.121925, 0, 1, 0.5215687, 1,
-0.1694752, -0.03976837, -2.386288, 0, 1, 0.5254902, 1,
-0.1679862, -1.806851, -1.906849, 0, 1, 0.5333334, 1,
-0.1660923, -0.8810977, -2.763655, 0, 1, 0.5372549, 1,
-0.1638895, 1.159056, -0.6953791, 0, 1, 0.5450981, 1,
-0.1633649, 0.4240026, -0.1629109, 0, 1, 0.5490196, 1,
-0.1628695, 0.7000076, 0.281503, 0, 1, 0.5568628, 1,
-0.161816, -0.2042162, -1.399825, 0, 1, 0.5607843, 1,
-0.1598967, 0.8909214, 0.3723044, 0, 1, 0.5686275, 1,
-0.1579127, -0.286631, -3.571369, 0, 1, 0.572549, 1,
-0.1573822, 2.328411, -0.6448305, 0, 1, 0.5803922, 1,
-0.1524723, 0.8819138, -1.387108, 0, 1, 0.5843138, 1,
-0.1509324, -0.07973032, -0.08654372, 0, 1, 0.5921569, 1,
-0.1493833, -0.3933117, -4.089418, 0, 1, 0.5960785, 1,
-0.1482602, -0.4830851, -3.995348, 0, 1, 0.6039216, 1,
-0.1413774, 0.1888234, -3.194589, 0, 1, 0.6117647, 1,
-0.1395489, 1.100353, -0.1884657, 0, 1, 0.6156863, 1,
-0.1375573, -1.69376, -4.075214, 0, 1, 0.6235294, 1,
-0.1346003, 0.3114586, -0.8667236, 0, 1, 0.627451, 1,
-0.1342328, 1.560265, 0.8610984, 0, 1, 0.6352941, 1,
-0.1330554, 0.8975874, 0.7591761, 0, 1, 0.6392157, 1,
-0.1315949, 0.148296, -1.048538, 0, 1, 0.6470588, 1,
-0.1302616, -0.5340154, -2.115567, 0, 1, 0.6509804, 1,
-0.1282467, -0.9916735, -2.487503, 0, 1, 0.6588235, 1,
-0.1247349, -0.1954623, -3.156438, 0, 1, 0.6627451, 1,
-0.1222411, -1.654936, -2.36476, 0, 1, 0.6705883, 1,
-0.121916, -2.352493, -1.272825, 0, 1, 0.6745098, 1,
-0.1180867, -0.9034375, -4.718636, 0, 1, 0.682353, 1,
-0.1134937, 0.575119, 1.30958, 0, 1, 0.6862745, 1,
-0.1118033, -1.188509, -3.366119, 0, 1, 0.6941177, 1,
-0.1072728, 0.05692323, -1.069589, 0, 1, 0.7019608, 1,
-0.1055084, -1.16376, -2.13779, 0, 1, 0.7058824, 1,
-0.09593645, -0.4120544, -0.04053766, 0, 1, 0.7137255, 1,
-0.09588855, -0.4517585, -1.647745, 0, 1, 0.7176471, 1,
-0.09342928, -0.3147897, -2.434921, 0, 1, 0.7254902, 1,
-0.09014296, 1.355434, 0.1328001, 0, 1, 0.7294118, 1,
-0.08906195, -1.355562, -2.766373, 0, 1, 0.7372549, 1,
-0.08787267, 0.3574933, -0.7172905, 0, 1, 0.7411765, 1,
-0.08665387, 0.6283251, -0.1200596, 0, 1, 0.7490196, 1,
-0.0860855, -0.3359587, -2.147768, 0, 1, 0.7529412, 1,
-0.08456421, -0.07250884, -2.899524, 0, 1, 0.7607843, 1,
-0.08001345, 2.681602, -1.448608, 0, 1, 0.7647059, 1,
-0.07927571, -0.7033873, -4.663579, 0, 1, 0.772549, 1,
-0.0786435, 0.3432991, -0.220294, 0, 1, 0.7764706, 1,
-0.07731733, -1.854982, -3.30347, 0, 1, 0.7843137, 1,
-0.07534088, 1.029398, 1.08368, 0, 1, 0.7882353, 1,
-0.07357902, -0.3097031, -2.040903, 0, 1, 0.7960784, 1,
-0.07323902, 0.6255276, -0.2651587, 0, 1, 0.8039216, 1,
-0.07101997, 0.1069796, -0.6234844, 0, 1, 0.8078431, 1,
-0.0680066, -0.4963253, -3.562603, 0, 1, 0.8156863, 1,
-0.0666422, -1.256421, -4.157142, 0, 1, 0.8196079, 1,
-0.06265292, -0.3996325, -2.239799, 0, 1, 0.827451, 1,
-0.06077024, -0.20649, -2.380498, 0, 1, 0.8313726, 1,
-0.06043223, 0.7340751, 0.668335, 0, 1, 0.8392157, 1,
-0.05875759, -1.32719, -3.230473, 0, 1, 0.8431373, 1,
-0.05874067, 0.2612185, -0.1756551, 0, 1, 0.8509804, 1,
-0.05637007, -1.788362, -3.483587, 0, 1, 0.854902, 1,
-0.05238299, -0.2027965, -4.673981, 0, 1, 0.8627451, 1,
-0.04873099, 0.3520093, 0.5324788, 0, 1, 0.8666667, 1,
-0.04857761, -0.5980446, -3.542841, 0, 1, 0.8745098, 1,
-0.04745719, -0.433094, -2.254736, 0, 1, 0.8784314, 1,
-0.04279666, 1.543584, -0.7611756, 0, 1, 0.8862745, 1,
-0.03967274, -0.3270275, -5.649721, 0, 1, 0.8901961, 1,
-0.03684057, 1.552984, -0.7141749, 0, 1, 0.8980392, 1,
-0.03364822, 1.2929, -0.9948825, 0, 1, 0.9058824, 1,
-0.0285329, 0.03699901, -0.6177484, 0, 1, 0.9098039, 1,
-0.02788539, -0.5049729, -3.306279, 0, 1, 0.9176471, 1,
-0.02161475, 1.471869, -0.8870412, 0, 1, 0.9215686, 1,
-0.01962817, -0.3131614, -1.85338, 0, 1, 0.9294118, 1,
-0.01520482, -0.2612707, -3.120397, 0, 1, 0.9333333, 1,
-0.01227199, 1.224698, 0.869858, 0, 1, 0.9411765, 1,
-0.007712534, 0.2209807, -0.005656646, 0, 1, 0.945098, 1,
-0.005605122, -0.9000845, -3.271399, 0, 1, 0.9529412, 1,
-0.004949688, 0.6149351, 0.2127868, 0, 1, 0.9568627, 1,
-0.004268368, -0.1200918, -3.410459, 0, 1, 0.9647059, 1,
-0.00219903, 0.2909322, 1.584032, 0, 1, 0.9686275, 1,
-0.0005721883, -0.7068013, -2.342049, 0, 1, 0.9764706, 1,
0.0005000988, 1.224577, -1.743402, 0, 1, 0.9803922, 1,
0.005083805, -0.0545566, 3.63225, 0, 1, 0.9882353, 1,
0.005681968, -0.7886654, 4.376256, 0, 1, 0.9921569, 1,
0.006194154, 0.5236924, -0.9411225, 0, 1, 1, 1,
0.007695829, 1.980873, -1.39688, 0, 0.9921569, 1, 1,
0.01177975, -0.7035537, 3.699523, 0, 0.9882353, 1, 1,
0.01849898, -0.8846227, 2.201506, 0, 0.9803922, 1, 1,
0.02976415, 0.6178113, 1.345957, 0, 0.9764706, 1, 1,
0.02986067, -0.4823066, 3.543097, 0, 0.9686275, 1, 1,
0.03599402, 1.402303, -1.055621, 0, 0.9647059, 1, 1,
0.03713998, 1.130552, 0.7124816, 0, 0.9568627, 1, 1,
0.03800222, -0.4811975, 4.024651, 0, 0.9529412, 1, 1,
0.03892962, -0.9788303, 3.6217, 0, 0.945098, 1, 1,
0.04009333, 0.9714803, 0.689314, 0, 0.9411765, 1, 1,
0.04551816, 0.8492296, 0.02459481, 0, 0.9333333, 1, 1,
0.04634974, 0.9054045, -0.8889761, 0, 0.9294118, 1, 1,
0.04733039, 0.05367932, 1.728893, 0, 0.9215686, 1, 1,
0.04767653, 2.188742, -0.286501, 0, 0.9176471, 1, 1,
0.05357366, 0.4418586, 0.8730375, 0, 0.9098039, 1, 1,
0.05427699, -0.7978317, 1.86236, 0, 0.9058824, 1, 1,
0.05846934, 0.3441364, -0.2446398, 0, 0.8980392, 1, 1,
0.05978421, -1.860524, 2.114697, 0, 0.8901961, 1, 1,
0.06232318, -0.6081337, 2.239394, 0, 0.8862745, 1, 1,
0.06309759, -0.7218465, 0.9296748, 0, 0.8784314, 1, 1,
0.06594825, 0.6028587, 0.09359443, 0, 0.8745098, 1, 1,
0.06770375, 1.334278, 1.562606, 0, 0.8666667, 1, 1,
0.07348574, 0.5285947, -0.5813438, 0, 0.8627451, 1, 1,
0.07467697, 1.602261, -1.869806, 0, 0.854902, 1, 1,
0.07848964, 0.2298552, 0.6005134, 0, 0.8509804, 1, 1,
0.07893777, -0.547619, 2.980298, 0, 0.8431373, 1, 1,
0.08180178, -1.974501, 1.934006, 0, 0.8392157, 1, 1,
0.09204203, -0.6064467, 2.518728, 0, 0.8313726, 1, 1,
0.09667017, 0.180959, 0.8454363, 0, 0.827451, 1, 1,
0.09667975, 0.6623504, -1.53976, 0, 0.8196079, 1, 1,
0.09793217, -0.5733901, 2.783648, 0, 0.8156863, 1, 1,
0.09924313, -1.911202, 3.437118, 0, 0.8078431, 1, 1,
0.1048768, -0.906396, 4.365588, 0, 0.8039216, 1, 1,
0.1049551, 0.4759935, 0.216729, 0, 0.7960784, 1, 1,
0.1052178, 1.671621, -0.6550439, 0, 0.7882353, 1, 1,
0.1054007, 0.9190393, 0.4454712, 0, 0.7843137, 1, 1,
0.1062124, -0.4283327, 4.070975, 0, 0.7764706, 1, 1,
0.1063239, -0.2194168, 1.657246, 0, 0.772549, 1, 1,
0.107219, 1.016642, 0.3104991, 0, 0.7647059, 1, 1,
0.1096542, 1.365849, -0.2342574, 0, 0.7607843, 1, 1,
0.1117811, 0.7625985, 0.4230534, 0, 0.7529412, 1, 1,
0.1165383, -0.8825552, 3.139473, 0, 0.7490196, 1, 1,
0.1227665, 1.243397, -0.448209, 0, 0.7411765, 1, 1,
0.1285771, 0.1618595, 1.308999, 0, 0.7372549, 1, 1,
0.1333162, -2.524402, 4.343679, 0, 0.7294118, 1, 1,
0.1337654, 0.0241961, -1.012217, 0, 0.7254902, 1, 1,
0.1360468, 1.996656, -0.4481112, 0, 0.7176471, 1, 1,
0.1377044, 0.9195997, 0.5464984, 0, 0.7137255, 1, 1,
0.1379569, -0.443497, 2.187562, 0, 0.7058824, 1, 1,
0.1405301, 0.9968015, -1.784438, 0, 0.6980392, 1, 1,
0.141561, 1.796137, 0.1632529, 0, 0.6941177, 1, 1,
0.1500092, -0.6980131, 3.391165, 0, 0.6862745, 1, 1,
0.1535635, -0.6079371, 3.545259, 0, 0.682353, 1, 1,
0.1580091, 0.02169427, 1.116977, 0, 0.6745098, 1, 1,
0.1610737, -0.2466261, 2.734949, 0, 0.6705883, 1, 1,
0.1626684, 0.2455457, 0.7325172, 0, 0.6627451, 1, 1,
0.1629845, -0.2747402, 1.401, 0, 0.6588235, 1, 1,
0.1632205, -0.384491, 2.416883, 0, 0.6509804, 1, 1,
0.1650891, 1.557552, 1.061632, 0, 0.6470588, 1, 1,
0.1655278, -0.03123115, 1.88332, 0, 0.6392157, 1, 1,
0.1671592, 0.1018126, 2.167308, 0, 0.6352941, 1, 1,
0.1705809, -1.053253, 2.356223, 0, 0.627451, 1, 1,
0.1716539, -0.4636344, 2.788009, 0, 0.6235294, 1, 1,
0.1751401, -0.1156198, 2.166587, 0, 0.6156863, 1, 1,
0.1765767, 0.5898407, -0.7087772, 0, 0.6117647, 1, 1,
0.1778831, -0.1694279, 3.25902, 0, 0.6039216, 1, 1,
0.1790201, -0.7821986, 3.970052, 0, 0.5960785, 1, 1,
0.1791965, 0.2769609, 1.20269, 0, 0.5921569, 1, 1,
0.1800743, -1.673783, 4.342805, 0, 0.5843138, 1, 1,
0.1884254, 2.965014, 1.144359, 0, 0.5803922, 1, 1,
0.1931773, -1.371859, 3.627838, 0, 0.572549, 1, 1,
0.1939876, 1.06715, 0.4284934, 0, 0.5686275, 1, 1,
0.1954328, 0.1305856, 0.8259747, 0, 0.5607843, 1, 1,
0.2008478, -0.2342021, 2.293416, 0, 0.5568628, 1, 1,
0.2011385, 0.5437449, 0.6084089, 0, 0.5490196, 1, 1,
0.2028628, 0.804731, -1.274141, 0, 0.5450981, 1, 1,
0.2030702, 2.445839, 0.5859664, 0, 0.5372549, 1, 1,
0.2032571, -0.3031338, 1.799831, 0, 0.5333334, 1, 1,
0.2057909, 0.3278894, 0.4815823, 0, 0.5254902, 1, 1,
0.2114488, -0.8170538, 2.749075, 0, 0.5215687, 1, 1,
0.2158995, -1.255717, 2.638145, 0, 0.5137255, 1, 1,
0.2253442, -0.3023806, 2.145342, 0, 0.509804, 1, 1,
0.2268497, -0.2606242, 2.724091, 0, 0.5019608, 1, 1,
0.2271023, 0.4149247, 1.380983, 0, 0.4941176, 1, 1,
0.231418, -0.2920932, 2.600414, 0, 0.4901961, 1, 1,
0.234953, -0.2246735, 1.257454, 0, 0.4823529, 1, 1,
0.2354189, -1.209619, 4.916451, 0, 0.4784314, 1, 1,
0.2354908, -0.9860019, 3.243345, 0, 0.4705882, 1, 1,
0.2405514, 0.2285502, -0.4523136, 0, 0.4666667, 1, 1,
0.24378, -0.05287975, 2.674982, 0, 0.4588235, 1, 1,
0.2455982, 0.8997668, -0.07942896, 0, 0.454902, 1, 1,
0.2465674, 0.8146843, 0.4694217, 0, 0.4470588, 1, 1,
0.2478743, -1.017947, 1.304772, 0, 0.4431373, 1, 1,
0.2491247, 0.828056, 0.4318565, 0, 0.4352941, 1, 1,
0.2504975, 1.177907, 0.7863424, 0, 0.4313726, 1, 1,
0.2518046, -0.4046016, 2.259106, 0, 0.4235294, 1, 1,
0.2532189, -1.608804, 3.130272, 0, 0.4196078, 1, 1,
0.2534651, -1.459946, 2.775815, 0, 0.4117647, 1, 1,
0.254861, -0.3595909, 2.369691, 0, 0.4078431, 1, 1,
0.2615277, -1.16246, 2.910447, 0, 0.4, 1, 1,
0.2617877, -0.1044172, 1.036369, 0, 0.3921569, 1, 1,
0.2636569, 0.9186759, 0.4241659, 0, 0.3882353, 1, 1,
0.2636898, -0.3032232, 3.405372, 0, 0.3803922, 1, 1,
0.2645555, -0.629142, 3.520761, 0, 0.3764706, 1, 1,
0.2678879, 0.8699762, -0.05058195, 0, 0.3686275, 1, 1,
0.2684423, 1.486975, -2.026113, 0, 0.3647059, 1, 1,
0.2713704, -0.04655496, 3.214886, 0, 0.3568628, 1, 1,
0.2725079, -0.1635339, 1.876925, 0, 0.3529412, 1, 1,
0.2800714, -1.526916, 4.045769, 0, 0.345098, 1, 1,
0.2842628, 1.364101, -0.3299134, 0, 0.3411765, 1, 1,
0.2858985, -1.495675, 1.516473, 0, 0.3333333, 1, 1,
0.2863122, 0.4169788, 2.168989, 0, 0.3294118, 1, 1,
0.2863418, -0.6554228, 1.073512, 0, 0.3215686, 1, 1,
0.2869197, -0.04571038, 2.221383, 0, 0.3176471, 1, 1,
0.2886357, -1.3268, 2.584255, 0, 0.3098039, 1, 1,
0.2938344, 0.1233637, 0.8598931, 0, 0.3058824, 1, 1,
0.2942225, 0.6475701, 0.7688871, 0, 0.2980392, 1, 1,
0.2999253, -0.7422786, 1.851063, 0, 0.2901961, 1, 1,
0.3010351, -0.1939052, 2.454015, 0, 0.2862745, 1, 1,
0.3026643, -0.9740339, 3.324864, 0, 0.2784314, 1, 1,
0.3053573, -0.3102924, 2.795124, 0, 0.2745098, 1, 1,
0.3068958, -1.451078, 1.068545, 0, 0.2666667, 1, 1,
0.3074313, -0.7241806, 1.312827, 0, 0.2627451, 1, 1,
0.3111159, 0.711386, 3.903208, 0, 0.254902, 1, 1,
0.3123519, -0.6793285, 3.848449, 0, 0.2509804, 1, 1,
0.3127487, -0.02129282, 1.829499, 0, 0.2431373, 1, 1,
0.3137219, -0.8339648, 2.85529, 0, 0.2392157, 1, 1,
0.3164394, -1.235607, 3.474188, 0, 0.2313726, 1, 1,
0.3191268, 1.535603, -0.223973, 0, 0.227451, 1, 1,
0.3229133, 0.3241834, 0.8318192, 0, 0.2196078, 1, 1,
0.3232714, -1.32413, 2.882415, 0, 0.2156863, 1, 1,
0.3272641, -0.1070401, 1.529771, 0, 0.2078431, 1, 1,
0.3273029, 1.930538, 1.557895, 0, 0.2039216, 1, 1,
0.3304298, 1.766781, 0.1076716, 0, 0.1960784, 1, 1,
0.3320292, -1.048754, 4.066765, 0, 0.1882353, 1, 1,
0.33255, 1.306535, -1.250376, 0, 0.1843137, 1, 1,
0.3363701, 0.5538027, 0.5822789, 0, 0.1764706, 1, 1,
0.3390667, 1.022055, 0.6897308, 0, 0.172549, 1, 1,
0.3540165, 0.6269673, -0.6959147, 0, 0.1647059, 1, 1,
0.3556836, -1.011363, 2.562255, 0, 0.1607843, 1, 1,
0.358318, 0.1147709, 2.116833, 0, 0.1529412, 1, 1,
0.3591375, 0.5415633, 1.881832, 0, 0.1490196, 1, 1,
0.3624337, 0.3918171, 1.006693, 0, 0.1411765, 1, 1,
0.3629096, 2.306306, -0.7034165, 0, 0.1372549, 1, 1,
0.3641557, -0.7590862, 2.044217, 0, 0.1294118, 1, 1,
0.3650241, 0.9920725, -0.3184896, 0, 0.1254902, 1, 1,
0.3661611, -0.9732848, 1.908075, 0, 0.1176471, 1, 1,
0.3690288, 0.4794023, 1.334278, 0, 0.1137255, 1, 1,
0.3735769, -1.817952, 4.855414, 0, 0.1058824, 1, 1,
0.3742056, -1.371623, 3.350068, 0, 0.09803922, 1, 1,
0.3806598, -1.331728, 1.170605, 0, 0.09411765, 1, 1,
0.3828137, 0.3363836, 1.912192, 0, 0.08627451, 1, 1,
0.3842557, -1.45247, 2.833732, 0, 0.08235294, 1, 1,
0.3859856, 0.264957, 0.868625, 0, 0.07450981, 1, 1,
0.3896615, -0.2895254, 1.184272, 0, 0.07058824, 1, 1,
0.3944764, -0.4891863, 2.906063, 0, 0.0627451, 1, 1,
0.3971215, 0.1698779, 1.560146, 0, 0.05882353, 1, 1,
0.3978943, -1.402993, 0.9313254, 0, 0.05098039, 1, 1,
0.3993326, -0.5515139, 2.065135, 0, 0.04705882, 1, 1,
0.3995112, -0.06631713, 2.666625, 0, 0.03921569, 1, 1,
0.4028077, -0.06897001, 0.8173862, 0, 0.03529412, 1, 1,
0.4065239, 1.080725, -1.833294, 0, 0.02745098, 1, 1,
0.4096648, -0.9908688, 2.267848, 0, 0.02352941, 1, 1,
0.4204461, -0.4765641, 2.841903, 0, 0.01568628, 1, 1,
0.4205926, 1.644673, 0.62002, 0, 0.01176471, 1, 1,
0.4260157, -1.190129, 5.367992, 0, 0.003921569, 1, 1,
0.4263757, -0.9283559, 2.731261, 0.003921569, 0, 1, 1,
0.4277185, -0.3219436, 3.963829, 0.007843138, 0, 1, 1,
0.4302833, 0.5355631, 1.650476, 0.01568628, 0, 1, 1,
0.4322027, -0.4309907, -0.08285586, 0.01960784, 0, 1, 1,
0.4328559, 0.8164239, 1.487862, 0.02745098, 0, 1, 1,
0.4354075, 1.880942, 0.583317, 0.03137255, 0, 1, 1,
0.4389574, -1.325002, 3.719041, 0.03921569, 0, 1, 1,
0.4459579, -0.1398834, 1.805701, 0.04313726, 0, 1, 1,
0.4466846, -0.7094961, 3.798708, 0.05098039, 0, 1, 1,
0.4485179, 0.1840252, 0.4968371, 0.05490196, 0, 1, 1,
0.4530474, 0.003440767, 2.882344, 0.0627451, 0, 1, 1,
0.4538909, 0.3414904, -0.2213474, 0.06666667, 0, 1, 1,
0.4540204, -0.6321312, 3.606598, 0.07450981, 0, 1, 1,
0.4553337, 0.4179054, 1.254727, 0.07843138, 0, 1, 1,
0.4576811, 1.237433, -0.07073469, 0.08627451, 0, 1, 1,
0.4589823, -0.8987914, 3.288052, 0.09019608, 0, 1, 1,
0.4599736, -0.6625758, 2.152073, 0.09803922, 0, 1, 1,
0.4619731, -0.3094015, 1.245779, 0.1058824, 0, 1, 1,
0.4634212, -0.6273798, 2.179215, 0.1098039, 0, 1, 1,
0.4662766, -0.3752266, 0.95522, 0.1176471, 0, 1, 1,
0.4686248, -1.132474, 4.499949, 0.1215686, 0, 1, 1,
0.4693602, 0.09943531, 1.632503, 0.1294118, 0, 1, 1,
0.4705543, 0.7284803, 1.698111, 0.1333333, 0, 1, 1,
0.4706534, -0.2473191, 3.073913, 0.1411765, 0, 1, 1,
0.4715154, 1.812687, 0.2759557, 0.145098, 0, 1, 1,
0.4786598, -0.2889847, 3.871462, 0.1529412, 0, 1, 1,
0.4815604, -1.072885, 2.679282, 0.1568628, 0, 1, 1,
0.4822, -0.4760089, 0.9031132, 0.1647059, 0, 1, 1,
0.4822134, -1.414765, 4.056569, 0.1686275, 0, 1, 1,
0.482839, 0.2651136, 0.611463, 0.1764706, 0, 1, 1,
0.4845299, 0.6355175, 1.787362, 0.1803922, 0, 1, 1,
0.4845459, -1.015728, 2.942813, 0.1882353, 0, 1, 1,
0.4863528, 0.1982413, 2.103723, 0.1921569, 0, 1, 1,
0.4868762, -1.685286, 3.005943, 0.2, 0, 1, 1,
0.4936458, -0.4955052, 2.233295, 0.2078431, 0, 1, 1,
0.4938847, 0.02349763, 3.428631, 0.2117647, 0, 1, 1,
0.5025954, 3.387789, -1.779438, 0.2196078, 0, 1, 1,
0.5038081, -1.067881, 2.644504, 0.2235294, 0, 1, 1,
0.5058702, 1.289942, 2.787236, 0.2313726, 0, 1, 1,
0.508969, -1.186773, 1.613669, 0.2352941, 0, 1, 1,
0.5093616, 0.06055092, 2.324562, 0.2431373, 0, 1, 1,
0.5144174, -0.9030562, 3.183387, 0.2470588, 0, 1, 1,
0.515569, 0.2230211, -0.1137443, 0.254902, 0, 1, 1,
0.5161058, 0.4913478, 0.1888717, 0.2588235, 0, 1, 1,
0.5194477, -0.6293512, 3.240528, 0.2666667, 0, 1, 1,
0.5235661, -1.2125, 3.958793, 0.2705882, 0, 1, 1,
0.5246875, 1.065711, -0.5276114, 0.2784314, 0, 1, 1,
0.5267377, 2.064204, -0.912438, 0.282353, 0, 1, 1,
0.536386, 0.2820456, 1.786366, 0.2901961, 0, 1, 1,
0.5431957, -0.5762106, 3.41742, 0.2941177, 0, 1, 1,
0.5484301, -0.5167869, 1.670357, 0.3019608, 0, 1, 1,
0.5535845, -2.475379, 2.209748, 0.3098039, 0, 1, 1,
0.5560095, 0.4873512, 1.730038, 0.3137255, 0, 1, 1,
0.5586691, -0.4945803, 2.220745, 0.3215686, 0, 1, 1,
0.5633009, -0.5543135, 3.383182, 0.3254902, 0, 1, 1,
0.5707499, 1.434045, 0.5684326, 0.3333333, 0, 1, 1,
0.5754925, -0.110763, 2.045717, 0.3372549, 0, 1, 1,
0.5766959, 0.2786684, 0.9463437, 0.345098, 0, 1, 1,
0.5801603, -0.2034143, 2.088149, 0.3490196, 0, 1, 1,
0.5805875, -0.7827172, 3.472639, 0.3568628, 0, 1, 1,
0.5841298, 0.1539165, 1.793521, 0.3607843, 0, 1, 1,
0.592984, -0.8073215, 3.442328, 0.3686275, 0, 1, 1,
0.5950981, 0.7360264, 2.5232, 0.372549, 0, 1, 1,
0.6010917, 0.2887426, 1.814264, 0.3803922, 0, 1, 1,
0.6027473, 0.7155043, 0.422265, 0.3843137, 0, 1, 1,
0.6101271, 0.3163275, 0.1305337, 0.3921569, 0, 1, 1,
0.6151296, 0.7266197, 0.6901942, 0.3960784, 0, 1, 1,
0.616922, 0.7255992, 1.34559, 0.4039216, 0, 1, 1,
0.6180171, 1.202506, 1.204501, 0.4117647, 0, 1, 1,
0.6191965, 0.2954202, 2.008306, 0.4156863, 0, 1, 1,
0.6213223, -0.3557311, 3.460226, 0.4235294, 0, 1, 1,
0.6240911, -0.5012088, 3.820226, 0.427451, 0, 1, 1,
0.629331, -1.032622, -0.8151285, 0.4352941, 0, 1, 1,
0.6349398, -1.55979, 1.915578, 0.4392157, 0, 1, 1,
0.6437005, -1.049042, 3.70652, 0.4470588, 0, 1, 1,
0.6457868, -1.243174, 3.054672, 0.4509804, 0, 1, 1,
0.6480737, -0.8862523, 1.741268, 0.4588235, 0, 1, 1,
0.6489066, 0.6749745, 1.317418, 0.4627451, 0, 1, 1,
0.6545904, 0.008796245, 1.888451, 0.4705882, 0, 1, 1,
0.6557322, 0.7746138, 1.575377, 0.4745098, 0, 1, 1,
0.6577418, 0.7008932, 1.333752, 0.4823529, 0, 1, 1,
0.6581194, 2.739268, -0.6029184, 0.4862745, 0, 1, 1,
0.658566, -1.606872, 3.522146, 0.4941176, 0, 1, 1,
0.6591251, 1.357878, 1.980683, 0.5019608, 0, 1, 1,
0.6650796, 0.7341868, 0.28695, 0.5058824, 0, 1, 1,
0.6654744, -0.9347699, 2.428386, 0.5137255, 0, 1, 1,
0.6679282, -0.9312553, 3.578098, 0.5176471, 0, 1, 1,
0.6686039, 1.526133, -0.3439393, 0.5254902, 0, 1, 1,
0.6689045, 1.912918, 1.614807, 0.5294118, 0, 1, 1,
0.6692697, 0.6397914, 2.453763, 0.5372549, 0, 1, 1,
0.6742556, -2.290108, 2.914972, 0.5411765, 0, 1, 1,
0.6743927, 0.9853035, 0.1988039, 0.5490196, 0, 1, 1,
0.6773425, 0.09629866, 0.8367403, 0.5529412, 0, 1, 1,
0.6794539, -0.04011633, 1.461626, 0.5607843, 0, 1, 1,
0.6815173, 1.058239, -0.5801577, 0.5647059, 0, 1, 1,
0.6832093, 2.158494, -0.615532, 0.572549, 0, 1, 1,
0.6882526, -0.05287614, 1.5477, 0.5764706, 0, 1, 1,
0.6892484, 1.775605, 0.02090963, 0.5843138, 0, 1, 1,
0.6973391, 0.5465589, 3.54711, 0.5882353, 0, 1, 1,
0.7015165, 0.0872465, 2.173822, 0.5960785, 0, 1, 1,
0.70484, -0.534973, 3.177511, 0.6039216, 0, 1, 1,
0.7070169, -1.07966, 3.151581, 0.6078432, 0, 1, 1,
0.7103866, -0.02812678, -0.3918307, 0.6156863, 0, 1, 1,
0.7229363, -0.49843, 3.138202, 0.6196079, 0, 1, 1,
0.7253418, 0.1871378, 2.101254, 0.627451, 0, 1, 1,
0.7261335, 0.7535832, 1.291613, 0.6313726, 0, 1, 1,
0.7274133, -0.3086271, 1.431753, 0.6392157, 0, 1, 1,
0.7284136, -0.7083989, 1.687839, 0.6431373, 0, 1, 1,
0.729987, -0.6644762, 1.162573, 0.6509804, 0, 1, 1,
0.7340204, -0.7428884, 1.521679, 0.654902, 0, 1, 1,
0.7344582, -0.1615118, 1.883723, 0.6627451, 0, 1, 1,
0.7369245, -0.2869306, 1.995007, 0.6666667, 0, 1, 1,
0.7532304, -0.6528481, 2.743512, 0.6745098, 0, 1, 1,
0.7561268, -1.792898, 2.462086, 0.6784314, 0, 1, 1,
0.7579725, 1.114104, -0.6646893, 0.6862745, 0, 1, 1,
0.7585899, 0.2630122, 1.2766, 0.6901961, 0, 1, 1,
0.761645, -0.05691382, -0.6813883, 0.6980392, 0, 1, 1,
0.7657514, 1.225941, -1.022078, 0.7058824, 0, 1, 1,
0.7798948, 0.09028149, 3.694862, 0.7098039, 0, 1, 1,
0.7859715, 1.847317, -0.2787178, 0.7176471, 0, 1, 1,
0.7974203, 0.8939956, 1.564089, 0.7215686, 0, 1, 1,
0.8014432, -0.03996334, 1.227941, 0.7294118, 0, 1, 1,
0.803098, -1.048946, 1.120512, 0.7333333, 0, 1, 1,
0.8032461, 0.04843207, 2.821351, 0.7411765, 0, 1, 1,
0.8094626, -1.508455, 3.199934, 0.7450981, 0, 1, 1,
0.8108579, -0.06737975, 1.976952, 0.7529412, 0, 1, 1,
0.8153561, 0.1456419, 2.318615, 0.7568628, 0, 1, 1,
0.8201467, -1.137248, 1.204046, 0.7647059, 0, 1, 1,
0.8224229, -1.016729, 3.130783, 0.7686275, 0, 1, 1,
0.8259531, -0.2615167, 1.814966, 0.7764706, 0, 1, 1,
0.8273582, -0.235021, 1.089565, 0.7803922, 0, 1, 1,
0.8324262, 0.7044555, -0.2095855, 0.7882353, 0, 1, 1,
0.8336555, -0.3091175, 1.88676, 0.7921569, 0, 1, 1,
0.8345889, 0.1572437, 2.046167, 0.8, 0, 1, 1,
0.8366834, -0.6766864, 1.660552, 0.8078431, 0, 1, 1,
0.8370141, -0.001465537, 2.422682, 0.8117647, 0, 1, 1,
0.8442, 1.18908, 1.976334, 0.8196079, 0, 1, 1,
0.8545038, -0.5503594, 2.074429, 0.8235294, 0, 1, 1,
0.8551866, -0.5190335, 0.6059651, 0.8313726, 0, 1, 1,
0.8562483, -0.1756968, 1.890791, 0.8352941, 0, 1, 1,
0.856859, -1.59556, 1.83369, 0.8431373, 0, 1, 1,
0.8574204, -1.235337, 3.623247, 0.8470588, 0, 1, 1,
0.8600253, -0.366556, 1.551769, 0.854902, 0, 1, 1,
0.8670241, 1.083596, 0.7445999, 0.8588235, 0, 1, 1,
0.8704056, 0.6195184, 0.6520234, 0.8666667, 0, 1, 1,
0.8847551, 0.8066849, 0.4095922, 0.8705882, 0, 1, 1,
0.8850685, 1.245821, -0.07168327, 0.8784314, 0, 1, 1,
0.887129, -0.2101935, 3.264065, 0.8823529, 0, 1, 1,
0.8873551, 0.3020477, 1.235584, 0.8901961, 0, 1, 1,
0.8894026, -0.855495, 2.255075, 0.8941177, 0, 1, 1,
0.8899841, 0.9783633, 1.185115, 0.9019608, 0, 1, 1,
0.8929814, 0.02591028, 1.74283, 0.9098039, 0, 1, 1,
0.907539, 0.8200721, 1.250797, 0.9137255, 0, 1, 1,
0.9085495, 0.2710825, 1.654579, 0.9215686, 0, 1, 1,
0.9107515, 2.293679, 0.5769236, 0.9254902, 0, 1, 1,
0.9139088, 0.9615337, 1.349723, 0.9333333, 0, 1, 1,
0.9151237, -1.368308, 4.415337, 0.9372549, 0, 1, 1,
0.9204854, 0.48108, 0.5838228, 0.945098, 0, 1, 1,
0.9271321, 0.7312167, 2.414552, 0.9490196, 0, 1, 1,
0.9319686, -0.08009048, 1.817105, 0.9568627, 0, 1, 1,
0.9323494, 0.3699803, 0.329453, 0.9607843, 0, 1, 1,
0.932591, -0.9816802, 3.828152, 0.9686275, 0, 1, 1,
0.9333726, 0.5308418, 1.752048, 0.972549, 0, 1, 1,
0.9341503, 0.6825922, 1.004239, 0.9803922, 0, 1, 1,
0.9378919, 1.083093, -0.8994594, 0.9843137, 0, 1, 1,
0.9416957, -1.417953, 3.663113, 0.9921569, 0, 1, 1,
0.9450351, 0.7803781, 1.978626, 0.9960784, 0, 1, 1,
0.9517538, -1.634692, 2.330266, 1, 0, 0.9960784, 1,
0.9591975, -1.559151, 2.084283, 1, 0, 0.9882353, 1,
0.9627698, 1.195026, 0.8329494, 1, 0, 0.9843137, 1,
0.962867, 0.4569244, 1.07793, 1, 0, 0.9764706, 1,
0.9632685, -0.3051169, 1.834937, 1, 0, 0.972549, 1,
0.9786323, -1.770386, 2.838043, 1, 0, 0.9647059, 1,
0.9847867, -1.17301, 0.03485469, 1, 0, 0.9607843, 1,
0.9973873, 2.25194, -1.021734, 1, 0, 0.9529412, 1,
0.9986801, -0.5932841, 4.335225, 1, 0, 0.9490196, 1,
0.9996269, 1.375929, -0.3009388, 1, 0, 0.9411765, 1,
1.00005, 1.698255, 0.6099424, 1, 0, 0.9372549, 1,
1.001437, 1.739378, 0.2485852, 1, 0, 0.9294118, 1,
1.003163, -0.4856965, 2.92868, 1, 0, 0.9254902, 1,
1.004129, -0.3862813, 0.7206395, 1, 0, 0.9176471, 1,
1.00673, 0.0398253, 2.330626, 1, 0, 0.9137255, 1,
1.009122, 1.009145, 2.275538, 1, 0, 0.9058824, 1,
1.01111, 0.06138923, 2.159246, 1, 0, 0.9019608, 1,
1.012305, 1.024158, 0.508933, 1, 0, 0.8941177, 1,
1.018182, 0.5057458, 2.147943, 1, 0, 0.8862745, 1,
1.021737, 0.5058278, 2.190209, 1, 0, 0.8823529, 1,
1.021785, 2.259959, 1.567772, 1, 0, 0.8745098, 1,
1.027705, 0.9987225, 1.410606, 1, 0, 0.8705882, 1,
1.029927, 0.8911469, 2.663341, 1, 0, 0.8627451, 1,
1.036387, -0.7011794, 0.6456448, 1, 0, 0.8588235, 1,
1.038542, -0.4811213, 2.122605, 1, 0, 0.8509804, 1,
1.04819, 0.4768503, 0.6225045, 1, 0, 0.8470588, 1,
1.04837, -2.343884, 1.925231, 1, 0, 0.8392157, 1,
1.049711, 1.56728, 0.7540226, 1, 0, 0.8352941, 1,
1.053523, 0.901829, 1.201429, 1, 0, 0.827451, 1,
1.053604, 0.05434904, 2.810336, 1, 0, 0.8235294, 1,
1.054287, 0.03311389, 0.09730821, 1, 0, 0.8156863, 1,
1.055503, 0.9486098, 2.518087, 1, 0, 0.8117647, 1,
1.057872, 0.507477, 1.637569, 1, 0, 0.8039216, 1,
1.059773, 0.6918463, 2.150412, 1, 0, 0.7960784, 1,
1.065088, -1.205784, 1.301872, 1, 0, 0.7921569, 1,
1.068186, 1.178291, -0.3413457, 1, 0, 0.7843137, 1,
1.070311, -0.7039942, 2.977427, 1, 0, 0.7803922, 1,
1.071946, 0.7842451, 0.6117929, 1, 0, 0.772549, 1,
1.074481, 1.187222, 0.8493522, 1, 0, 0.7686275, 1,
1.080036, 1.259555, 0.6742538, 1, 0, 0.7607843, 1,
1.086469, 0.1808681, 0.4861474, 1, 0, 0.7568628, 1,
1.08826, -0.915527, 1.250537, 1, 0, 0.7490196, 1,
1.097504, 3.695059, 1.100402, 1, 0, 0.7450981, 1,
1.103531, 0.5352653, -0.1264103, 1, 0, 0.7372549, 1,
1.105265, -0.05444637, 2.780588, 1, 0, 0.7333333, 1,
1.106676, -0.7184669, 2.708356, 1, 0, 0.7254902, 1,
1.116243, 1.229442, 2.05003, 1, 0, 0.7215686, 1,
1.117783, 0.2069309, 1.109375, 1, 0, 0.7137255, 1,
1.120834, -0.2167902, 2.007423, 1, 0, 0.7098039, 1,
1.12497, -0.788224, 3.057295, 1, 0, 0.7019608, 1,
1.128163, -1.286846, 2.862841, 1, 0, 0.6941177, 1,
1.128906, -0.5529124, 3.368235, 1, 0, 0.6901961, 1,
1.131202, -0.4913561, 1.194691, 1, 0, 0.682353, 1,
1.131922, 0.5181752, -0.4729541, 1, 0, 0.6784314, 1,
1.133241, 0.1839326, 2.387688, 1, 0, 0.6705883, 1,
1.13475, -0.1652332, 0.7702607, 1, 0, 0.6666667, 1,
1.138985, 1.047736, 1.258804, 1, 0, 0.6588235, 1,
1.157715, -0.2065047, 1.765647, 1, 0, 0.654902, 1,
1.162994, -0.9681466, 3.705485, 1, 0, 0.6470588, 1,
1.164962, 0.9432623, 2.63705, 1, 0, 0.6431373, 1,
1.167889, -1.669401, 2.567232, 1, 0, 0.6352941, 1,
1.168421, -2.402961, 2.579337, 1, 0, 0.6313726, 1,
1.16852, 0.5484574, 3.953444, 1, 0, 0.6235294, 1,
1.181581, 0.3368508, 1.855994, 1, 0, 0.6196079, 1,
1.182507, -0.5382106, 3.815857, 1, 0, 0.6117647, 1,
1.188521, 0.6193439, 0.5277256, 1, 0, 0.6078432, 1,
1.197168, 0.6292129, 1.897509, 1, 0, 0.6, 1,
1.202134, 0.2539359, 0.6302646, 1, 0, 0.5921569, 1,
1.208885, -1.00908, 1.646783, 1, 0, 0.5882353, 1,
1.212588, 1.732663, -1.269435, 1, 0, 0.5803922, 1,
1.212645, -0.3017552, 0.8504102, 1, 0, 0.5764706, 1,
1.215718, 0.2519172, 2.906722, 1, 0, 0.5686275, 1,
1.222245, 1.115535, 0.5830805, 1, 0, 0.5647059, 1,
1.225671, -1.049203, 4.074813, 1, 0, 0.5568628, 1,
1.227786, -0.5230677, 3.605571, 1, 0, 0.5529412, 1,
1.231665, 0.6772246, -0.7725778, 1, 0, 0.5450981, 1,
1.232805, 2.617937, -1.083608, 1, 0, 0.5411765, 1,
1.236335, -0.3311836, 2.840322, 1, 0, 0.5333334, 1,
1.241531, 0.2084195, 0.2881542, 1, 0, 0.5294118, 1,
1.244295, -0.2520702, 1.465361, 1, 0, 0.5215687, 1,
1.247762, 0.9806542, 0.002151683, 1, 0, 0.5176471, 1,
1.255665, 0.9336613, 1.931333, 1, 0, 0.509804, 1,
1.275025, 1.153602, -1.087895, 1, 0, 0.5058824, 1,
1.275555, -0.0544639, 1.318038, 1, 0, 0.4980392, 1,
1.287601, -1.983767, 1.160148, 1, 0, 0.4901961, 1,
1.294661, -0.508526, 1.607375, 1, 0, 0.4862745, 1,
1.296381, -0.5577618, 2.019521, 1, 0, 0.4784314, 1,
1.30601, -0.2470907, 1.688103, 1, 0, 0.4745098, 1,
1.306879, -0.4990732, 2.959556, 1, 0, 0.4666667, 1,
1.311949, -0.6294699, 0.04919221, 1, 0, 0.4627451, 1,
1.314071, -0.5706084, 3.70743, 1, 0, 0.454902, 1,
1.314805, -0.5942077, 0.3979179, 1, 0, 0.4509804, 1,
1.321108, 1.10135, 1.609652, 1, 0, 0.4431373, 1,
1.32433, 0.1122532, 2.971753, 1, 0, 0.4392157, 1,
1.332956, 1.493194, -0.6117089, 1, 0, 0.4313726, 1,
1.337297, -1.577687, 3.01128, 1, 0, 0.427451, 1,
1.344372, -0.116472, 2.576379, 1, 0, 0.4196078, 1,
1.346187, 0.6430389, -0.1960731, 1, 0, 0.4156863, 1,
1.349239, 1.048621, -0.3613428, 1, 0, 0.4078431, 1,
1.350278, -0.203953, 2.103137, 1, 0, 0.4039216, 1,
1.365208, 0.06295394, 2.857488, 1, 0, 0.3960784, 1,
1.374576, -0.1641698, 0.6633147, 1, 0, 0.3882353, 1,
1.375635, 1.206827, 1.376444, 1, 0, 0.3843137, 1,
1.376619, 0.7026175, 0.9011578, 1, 0, 0.3764706, 1,
1.380689, 0.3890737, 1.528295, 1, 0, 0.372549, 1,
1.383341, -0.656372, 2.978349, 1, 0, 0.3647059, 1,
1.384475, 1.033954, 1.924671, 1, 0, 0.3607843, 1,
1.408968, 0.645295, 0.7575461, 1, 0, 0.3529412, 1,
1.43663, 0.2360295, 1.116814, 1, 0, 0.3490196, 1,
1.441049, 0.4097547, 0.4524547, 1, 0, 0.3411765, 1,
1.44891, -0.4605847, 2.018137, 1, 0, 0.3372549, 1,
1.462449, -1.366815, 3.846098, 1, 0, 0.3294118, 1,
1.463669, -0.8198172, 3.965487, 1, 0, 0.3254902, 1,
1.467978, 0.4050719, 2.15262, 1, 0, 0.3176471, 1,
1.472601, -0.9030853, 1.55629, 1, 0, 0.3137255, 1,
1.473628, -0.1001707, 2.823287, 1, 0, 0.3058824, 1,
1.483403, -1.339333, 2.166493, 1, 0, 0.2980392, 1,
1.490449, -1.704202, 1.632961, 1, 0, 0.2941177, 1,
1.508222, 1.010202, 0.9555305, 1, 0, 0.2862745, 1,
1.53352, -0.7786523, 2.159685, 1, 0, 0.282353, 1,
1.54701, 0.931375, 0.5836682, 1, 0, 0.2745098, 1,
1.559451, -0.2878477, 2.111742, 1, 0, 0.2705882, 1,
1.563361, -0.4259179, 1.049985, 1, 0, 0.2627451, 1,
1.566756, -1.149019, 1.152186, 1, 0, 0.2588235, 1,
1.582672, -1.559956, 2.561943, 1, 0, 0.2509804, 1,
1.584073, -0.4054456, 0.06564066, 1, 0, 0.2470588, 1,
1.594091, -1.133694, 3.289129, 1, 0, 0.2392157, 1,
1.601775, -2.137409, 1.944364, 1, 0, 0.2352941, 1,
1.620835, -0.1480657, 2.537062, 1, 0, 0.227451, 1,
1.643732, 0.04306962, 1.184394, 1, 0, 0.2235294, 1,
1.672005, -0.7580289, 0.01063334, 1, 0, 0.2156863, 1,
1.678084, -0.8160612, 1.95012, 1, 0, 0.2117647, 1,
1.693146, -0.2048079, 0.4835608, 1, 0, 0.2039216, 1,
1.713765, 0.03886345, 2.053516, 1, 0, 0.1960784, 1,
1.729966, 1.137469, 0.9521345, 1, 0, 0.1921569, 1,
1.731459, 0.5865958, 0.07415557, 1, 0, 0.1843137, 1,
1.752379, -0.351147, 1.134075, 1, 0, 0.1803922, 1,
1.76972, 1.276158, 0.2500494, 1, 0, 0.172549, 1,
1.776458, -1.641408, 3.374604, 1, 0, 0.1686275, 1,
1.785826, -0.6766426, 1.000874, 1, 0, 0.1607843, 1,
1.785888, 1.542971, 0.5469698, 1, 0, 0.1568628, 1,
1.790162, 0.7115536, 0.4647585, 1, 0, 0.1490196, 1,
1.829436, -1.185446, 2.072638, 1, 0, 0.145098, 1,
1.855367, 0.3073444, 0.1244137, 1, 0, 0.1372549, 1,
1.892143, -1.249338, 2.26589, 1, 0, 0.1333333, 1,
1.900981, 0.5890175, -0.2275545, 1, 0, 0.1254902, 1,
1.932032, 0.003006855, 0.9071819, 1, 0, 0.1215686, 1,
1.936129, 1.184245, 0.9663019, 1, 0, 0.1137255, 1,
1.961371, 0.9678689, -0.657232, 1, 0, 0.1098039, 1,
1.996731, -2.391544, 0.6912693, 1, 0, 0.1019608, 1,
2.020595, 0.9767357, 0.5521249, 1, 0, 0.09411765, 1,
2.058717, -0.2103538, 3.074297, 1, 0, 0.09019608, 1,
2.09165, 0.3585117, 0.2559999, 1, 0, 0.08235294, 1,
2.162009, -0.8912562, 1.360837, 1, 0, 0.07843138, 1,
2.162269, -2.834403, 4.278773, 1, 0, 0.07058824, 1,
2.215536, -0.1464873, 1.294266, 1, 0, 0.06666667, 1,
2.291896, 0.3109658, 1.471296, 1, 0, 0.05882353, 1,
2.352303, 1.058712, 1.144717, 1, 0, 0.05490196, 1,
2.406631, 0.5959277, 0.9703913, 1, 0, 0.04705882, 1,
2.618142, -0.217085, 1.76896, 1, 0, 0.04313726, 1,
2.620296, -0.2919179, 1.816753, 1, 0, 0.03529412, 1,
2.744197, 0.1380394, -0.9968638, 1, 0, 0.03137255, 1,
2.762461, -0.06169768, 1.509868, 1, 0, 0.02352941, 1,
2.877745, 0.2010455, -0.9326647, 1, 0, 0.01960784, 1,
2.913047, 2.595531, 3.3345, 1, 0, 0.01176471, 1,
3.169563, -0.9850581, 2.560756, 1, 0, 0.007843138, 1
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
-0.8184257, -4.096651, -7.517223, 0, -0.5, 0.5, 0.5,
-0.8184257, -4.096651, -7.517223, 1, -0.5, 0.5, 0.5,
-0.8184257, -4.096651, -7.517223, 1, 1.5, 0.5, 0.5,
-0.8184257, -4.096651, -7.517223, 0, 1.5, 0.5, 0.5
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
-6.158342, 0.363845, -7.517223, 0, -0.5, 0.5, 0.5,
-6.158342, 0.363845, -7.517223, 1, -0.5, 0.5, 0.5,
-6.158342, 0.363845, -7.517223, 1, 1.5, 0.5, 0.5,
-6.158342, 0.363845, -7.517223, 0, 1.5, 0.5, 0.5
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
-6.158342, -4.096651, -0.1408646, 0, -0.5, 0.5, 0.5,
-6.158342, -4.096651, -0.1408646, 1, -0.5, 0.5, 0.5,
-6.158342, -4.096651, -0.1408646, 1, 1.5, 0.5, 0.5,
-6.158342, -4.096651, -0.1408646, 0, 1.5, 0.5, 0.5
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
-4, -3.067306, -5.814987,
2, -3.067306, -5.814987,
-4, -3.067306, -5.814987,
-4, -3.238863, -6.098693,
-2, -3.067306, -5.814987,
-2, -3.238863, -6.098693,
0, -3.067306, -5.814987,
0, -3.238863, -6.098693,
2, -3.067306, -5.814987,
2, -3.238863, -6.098693
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
"-4",
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
-4, -3.581978, -6.666105, 0, -0.5, 0.5, 0.5,
-4, -3.581978, -6.666105, 1, -0.5, 0.5, 0.5,
-4, -3.581978, -6.666105, 1, 1.5, 0.5, 0.5,
-4, -3.581978, -6.666105, 0, 1.5, 0.5, 0.5,
-2, -3.581978, -6.666105, 0, -0.5, 0.5, 0.5,
-2, -3.581978, -6.666105, 1, -0.5, 0.5, 0.5,
-2, -3.581978, -6.666105, 1, 1.5, 0.5, 0.5,
-2, -3.581978, -6.666105, 0, 1.5, 0.5, 0.5,
0, -3.581978, -6.666105, 0, -0.5, 0.5, 0.5,
0, -3.581978, -6.666105, 1, -0.5, 0.5, 0.5,
0, -3.581978, -6.666105, 1, 1.5, 0.5, 0.5,
0, -3.581978, -6.666105, 0, 1.5, 0.5, 0.5,
2, -3.581978, -6.666105, 0, -0.5, 0.5, 0.5,
2, -3.581978, -6.666105, 1, -0.5, 0.5, 0.5,
2, -3.581978, -6.666105, 1, 1.5, 0.5, 0.5,
2, -3.581978, -6.666105, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.926054, -2, -5.814987,
-4.926054, 3, -5.814987,
-4.926054, -2, -5.814987,
-5.131435, -2, -6.098693,
-4.926054, -1, -5.814987,
-5.131435, -1, -6.098693,
-4.926054, 0, -5.814987,
-5.131435, 0, -6.098693,
-4.926054, 1, -5.814987,
-5.131435, 1, -6.098693,
-4.926054, 2, -5.814987,
-5.131435, 2, -6.098693,
-4.926054, 3, -5.814987,
-5.131435, 3, -6.098693
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
-5.542198, -2, -6.666105, 0, -0.5, 0.5, 0.5,
-5.542198, -2, -6.666105, 1, -0.5, 0.5, 0.5,
-5.542198, -2, -6.666105, 1, 1.5, 0.5, 0.5,
-5.542198, -2, -6.666105, 0, 1.5, 0.5, 0.5,
-5.542198, -1, -6.666105, 0, -0.5, 0.5, 0.5,
-5.542198, -1, -6.666105, 1, -0.5, 0.5, 0.5,
-5.542198, -1, -6.666105, 1, 1.5, 0.5, 0.5,
-5.542198, -1, -6.666105, 0, 1.5, 0.5, 0.5,
-5.542198, 0, -6.666105, 0, -0.5, 0.5, 0.5,
-5.542198, 0, -6.666105, 1, -0.5, 0.5, 0.5,
-5.542198, 0, -6.666105, 1, 1.5, 0.5, 0.5,
-5.542198, 0, -6.666105, 0, 1.5, 0.5, 0.5,
-5.542198, 1, -6.666105, 0, -0.5, 0.5, 0.5,
-5.542198, 1, -6.666105, 1, -0.5, 0.5, 0.5,
-5.542198, 1, -6.666105, 1, 1.5, 0.5, 0.5,
-5.542198, 1, -6.666105, 0, 1.5, 0.5, 0.5,
-5.542198, 2, -6.666105, 0, -0.5, 0.5, 0.5,
-5.542198, 2, -6.666105, 1, -0.5, 0.5, 0.5,
-5.542198, 2, -6.666105, 1, 1.5, 0.5, 0.5,
-5.542198, 2, -6.666105, 0, 1.5, 0.5, 0.5,
-5.542198, 3, -6.666105, 0, -0.5, 0.5, 0.5,
-5.542198, 3, -6.666105, 1, -0.5, 0.5, 0.5,
-5.542198, 3, -6.666105, 1, 1.5, 0.5, 0.5,
-5.542198, 3, -6.666105, 0, 1.5, 0.5, 0.5
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
-4.926054, -3.067306, -4,
-4.926054, -3.067306, 4,
-4.926054, -3.067306, -4,
-5.131435, -3.238863, -4,
-4.926054, -3.067306, -2,
-5.131435, -3.238863, -2,
-4.926054, -3.067306, 0,
-5.131435, -3.238863, 0,
-4.926054, -3.067306, 2,
-5.131435, -3.238863, 2,
-4.926054, -3.067306, 4,
-5.131435, -3.238863, 4
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
-5.542198, -3.581978, -4, 0, -0.5, 0.5, 0.5,
-5.542198, -3.581978, -4, 1, -0.5, 0.5, 0.5,
-5.542198, -3.581978, -4, 1, 1.5, 0.5, 0.5,
-5.542198, -3.581978, -4, 0, 1.5, 0.5, 0.5,
-5.542198, -3.581978, -2, 0, -0.5, 0.5, 0.5,
-5.542198, -3.581978, -2, 1, -0.5, 0.5, 0.5,
-5.542198, -3.581978, -2, 1, 1.5, 0.5, 0.5,
-5.542198, -3.581978, -2, 0, 1.5, 0.5, 0.5,
-5.542198, -3.581978, 0, 0, -0.5, 0.5, 0.5,
-5.542198, -3.581978, 0, 1, -0.5, 0.5, 0.5,
-5.542198, -3.581978, 0, 1, 1.5, 0.5, 0.5,
-5.542198, -3.581978, 0, 0, 1.5, 0.5, 0.5,
-5.542198, -3.581978, 2, 0, -0.5, 0.5, 0.5,
-5.542198, -3.581978, 2, 1, -0.5, 0.5, 0.5,
-5.542198, -3.581978, 2, 1, 1.5, 0.5, 0.5,
-5.542198, -3.581978, 2, 0, 1.5, 0.5, 0.5,
-5.542198, -3.581978, 4, 0, -0.5, 0.5, 0.5,
-5.542198, -3.581978, 4, 1, -0.5, 0.5, 0.5,
-5.542198, -3.581978, 4, 1, 1.5, 0.5, 0.5,
-5.542198, -3.581978, 4, 0, 1.5, 0.5, 0.5
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
-4.926054, -3.067306, -5.814987,
-4.926054, 3.794996, -5.814987,
-4.926054, -3.067306, 5.533257,
-4.926054, 3.794996, 5.533257,
-4.926054, -3.067306, -5.814987,
-4.926054, -3.067306, 5.533257,
-4.926054, 3.794996, -5.814987,
-4.926054, 3.794996, 5.533257,
-4.926054, -3.067306, -5.814987,
3.289202, -3.067306, -5.814987,
-4.926054, -3.067306, 5.533257,
3.289202, -3.067306, 5.533257,
-4.926054, 3.794996, -5.814987,
3.289202, 3.794996, -5.814987,
-4.926054, 3.794996, 5.533257,
3.289202, 3.794996, 5.533257,
3.289202, -3.067306, -5.814987,
3.289202, 3.794996, -5.814987,
3.289202, -3.067306, 5.533257,
3.289202, 3.794996, 5.533257,
3.289202, -3.067306, -5.814987,
3.289202, -3.067306, 5.533257,
3.289202, 3.794996, -5.814987,
3.289202, 3.794996, 5.533257
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
var radius = 8.33017;
var distance = 37.06187;
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
mvMatrix.translate( 0.8184257, -0.363845, 0.1408646 );
mvMatrix.scale( 1.096344, 1.312496, 0.7936684 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.06187);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
monolinuron<-read.table("monolinuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-monolinuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'monolinuron' not found
```

```r
y<-monolinuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'monolinuron' not found
```

```r
z<-monolinuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'monolinuron' not found
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
-4.806414, -1.567854, -2.927028, 0, 0, 1, 1, 1,
-3.430109, 1.66882, -0.8863397, 1, 0, 0, 1, 1,
-2.903543, 0.04915917, -2.301867, 1, 0, 0, 1, 1,
-2.834486, 0.0522947, -1.55698, 1, 0, 0, 1, 1,
-2.760554, -1.467279, -0.6456845, 1, 0, 0, 1, 1,
-2.759429, 0.6529767, -0.7171597, 1, 0, 0, 1, 1,
-2.500332, -0.4036449, -2.169197, 0, 0, 0, 1, 1,
-2.461776, -0.3070608, -0.5169633, 0, 0, 0, 1, 1,
-2.411756, -0.479575, 0.07194665, 0, 0, 0, 1, 1,
-2.404202, 1.469076, -0.5817011, 0, 0, 0, 1, 1,
-2.346589, 2.274594, -2.777569, 0, 0, 0, 1, 1,
-2.198447, -2.179674, -1.685034, 0, 0, 0, 1, 1,
-2.142134, -0.7598457, -1.761907, 0, 0, 0, 1, 1,
-2.131115, -0.5758438, -0.2332813, 1, 1, 1, 1, 1,
-2.124578, -0.9686784, -3.220505, 1, 1, 1, 1, 1,
-2.096115, 0.4783994, -1.345924, 1, 1, 1, 1, 1,
-2.09427, -0.5858633, -3.625865, 1, 1, 1, 1, 1,
-2.056298, 2.407973, -2.056403, 1, 1, 1, 1, 1,
-2.031891, -0.2661975, -1.701562, 1, 1, 1, 1, 1,
-2.006853, -0.4254514, -1.75176, 1, 1, 1, 1, 1,
-1.994305, 1.546628, -1.452739, 1, 1, 1, 1, 1,
-1.992723, -1.263081, -2.773565, 1, 1, 1, 1, 1,
-1.985188, -0.2669785, -0.7704304, 1, 1, 1, 1, 1,
-1.983553, 0.5030686, -2.454153, 1, 1, 1, 1, 1,
-1.910906, -1.091004, -2.668898, 1, 1, 1, 1, 1,
-1.903616, 1.732424, -0.9746074, 1, 1, 1, 1, 1,
-1.900145, -0.07007944, -0.7605071, 1, 1, 1, 1, 1,
-1.896533, -1.302748, -2.929133, 1, 1, 1, 1, 1,
-1.893585, -1.041902, -1.834832, 0, 0, 1, 1, 1,
-1.883512, -1.397479, -3.503938, 1, 0, 0, 1, 1,
-1.879689, 1.552325, -1.291628, 1, 0, 0, 1, 1,
-1.860027, 0.6657522, -1.848603, 1, 0, 0, 1, 1,
-1.846453, 1.623495, -1.120902, 1, 0, 0, 1, 1,
-1.838003, -0.8146436, -0.4800928, 1, 0, 0, 1, 1,
-1.830191, 0.2260447, -0.9974467, 0, 0, 0, 1, 1,
-1.821123, -0.2209531, -2.431237, 0, 0, 0, 1, 1,
-1.807922, 0.1252472, -1.293746, 0, 0, 0, 1, 1,
-1.798068, 0.7480609, -4.065942, 0, 0, 0, 1, 1,
-1.784508, -1.502578, -1.44098, 0, 0, 0, 1, 1,
-1.779268, 0.6498029, -2.847853, 0, 0, 0, 1, 1,
-1.77445, -0.5261928, -2.15233, 0, 0, 0, 1, 1,
-1.734794, -1.787231, -3.183271, 1, 1, 1, 1, 1,
-1.721943, 0.1661322, -2.241554, 1, 1, 1, 1, 1,
-1.721318, 0.7416691, -2.379392, 1, 1, 1, 1, 1,
-1.711202, 1.581675, 0.4638248, 1, 1, 1, 1, 1,
-1.704018, -0.2865514, -1.227809, 1, 1, 1, 1, 1,
-1.701966, 1.447328, -1.537722, 1, 1, 1, 1, 1,
-1.699789, 1.536692, 0.1005743, 1, 1, 1, 1, 1,
-1.67995, -0.0699582, -2.803118, 1, 1, 1, 1, 1,
-1.668717, -0.1309905, -0.3930199, 1, 1, 1, 1, 1,
-1.65106, 0.4261145, -1.563326, 1, 1, 1, 1, 1,
-1.644248, 1.322326, 0.06053067, 1, 1, 1, 1, 1,
-1.63989, -0.8976478, -0.9233422, 1, 1, 1, 1, 1,
-1.62153, -2.967369, -2.132976, 1, 1, 1, 1, 1,
-1.619674, -1.095446, -2.807047, 1, 1, 1, 1, 1,
-1.605616, -0.6712622, -1.090535, 1, 1, 1, 1, 1,
-1.584876, 0.7280744, -2.373781, 0, 0, 1, 1, 1,
-1.579695, -0.404514, -1.374301, 1, 0, 0, 1, 1,
-1.572176, -0.3385, -0.4957038, 1, 0, 0, 1, 1,
-1.571133, -1.208896, -0.7375589, 1, 0, 0, 1, 1,
-1.563887, -0.2786171, -2.207442, 1, 0, 0, 1, 1,
-1.562666, -0.1878904, -3.134247, 1, 0, 0, 1, 1,
-1.555211, -0.9553789, -1.188808, 0, 0, 0, 1, 1,
-1.541212, -0.166709, -1.08531, 0, 0, 0, 1, 1,
-1.53992, 0.407665, -1.762121, 0, 0, 0, 1, 1,
-1.535706, 0.886826, -3.754323, 0, 0, 0, 1, 1,
-1.533849, -1.089476, -1.948313, 0, 0, 0, 1, 1,
-1.52833, -0.1763815, -2.010392, 0, 0, 0, 1, 1,
-1.518459, -0.07326715, -2.690985, 0, 0, 0, 1, 1,
-1.513396, 0.4817709, -1.45488, 1, 1, 1, 1, 1,
-1.512963, -0.716523, -1.66564, 1, 1, 1, 1, 1,
-1.502769, -1.326295, -0.8013018, 1, 1, 1, 1, 1,
-1.486644, -0.6618579, -2.007164, 1, 1, 1, 1, 1,
-1.486515, 0.4438447, 0.8019699, 1, 1, 1, 1, 1,
-1.482177, 0.3537208, -1.241708, 1, 1, 1, 1, 1,
-1.481801, -1.168321, -2.734922, 1, 1, 1, 1, 1,
-1.46335, -0.5007464, -0.4687195, 1, 1, 1, 1, 1,
-1.452172, 0.3182912, -4.033565, 1, 1, 1, 1, 1,
-1.447135, -0.3666118, -2.559336, 1, 1, 1, 1, 1,
-1.442228, -0.2753909, -3.15617, 1, 1, 1, 1, 1,
-1.43439, -2.541974, -4.41207, 1, 1, 1, 1, 1,
-1.406675, 1.654559, 0.3668294, 1, 1, 1, 1, 1,
-1.398452, -0.7514095, -3.176418, 1, 1, 1, 1, 1,
-1.389761, 0.7583604, -2.295279, 1, 1, 1, 1, 1,
-1.378837, -0.8542458, -3.607158, 0, 0, 1, 1, 1,
-1.375221, -0.1685795, -1.881757, 1, 0, 0, 1, 1,
-1.372416, 0.7060414, -0.6096508, 1, 0, 0, 1, 1,
-1.370142, -1.450598, -2.265669, 1, 0, 0, 1, 1,
-1.368254, 1.332334, -0.7106068, 1, 0, 0, 1, 1,
-1.363337, -0.6014544, -0.242631, 1, 0, 0, 1, 1,
-1.355604, 0.6382728, -1.289044, 0, 0, 0, 1, 1,
-1.347586, 1.627808, -1.400861, 0, 0, 0, 1, 1,
-1.34318, -0.05226048, -2.161512, 0, 0, 0, 1, 1,
-1.342574, -1.320538, -1.235405, 0, 0, 0, 1, 1,
-1.32706, -1.540908, -2.143334, 0, 0, 0, 1, 1,
-1.32607, 2.444224, -1.145069, 0, 0, 0, 1, 1,
-1.324793, 0.2119046, -2.501607, 0, 0, 0, 1, 1,
-1.322709, 1.369234, -0.6003062, 1, 1, 1, 1, 1,
-1.311744, 0.3673542, -0.7852615, 1, 1, 1, 1, 1,
-1.302466, -0.09972373, -1.94895, 1, 1, 1, 1, 1,
-1.300269, 0.8363914, -2.038822, 1, 1, 1, 1, 1,
-1.294941, 0.6517376, -0.3586998, 1, 1, 1, 1, 1,
-1.282829, 2.267712, -1.402512, 1, 1, 1, 1, 1,
-1.267006, 2.015208, 0.3198363, 1, 1, 1, 1, 1,
-1.253144, -0.1901137, -2.243237, 1, 1, 1, 1, 1,
-1.240277, 0.1942085, -0.6567855, 1, 1, 1, 1, 1,
-1.233057, 0.5370758, 1.009184, 1, 1, 1, 1, 1,
-1.230606, -0.5227258, -2.233549, 1, 1, 1, 1, 1,
-1.228469, 2.323309, -1.026516, 1, 1, 1, 1, 1,
-1.226117, 0.9479743, -0.7856319, 1, 1, 1, 1, 1,
-1.226031, 0.3298062, -0.4968414, 1, 1, 1, 1, 1,
-1.214307, -0.2700083, -0.9179793, 1, 1, 1, 1, 1,
-1.212816, 0.5319437, 0.7233217, 0, 0, 1, 1, 1,
-1.209318, -1.490233, -1.384765, 1, 0, 0, 1, 1,
-1.2044, -2.918023, -3.767678, 1, 0, 0, 1, 1,
-1.202642, -0.81029, -3.015245, 1, 0, 0, 1, 1,
-1.200309, 1.323519, 0.2005791, 1, 0, 0, 1, 1,
-1.195385, -0.1917026, -2.694735, 1, 0, 0, 1, 1,
-1.194672, -1.260212, -2.90183, 0, 0, 0, 1, 1,
-1.191733, 0.2199332, -0.5101606, 0, 0, 0, 1, 1,
-1.186797, -1.655406, -1.227736, 0, 0, 0, 1, 1,
-1.183188, -0.8112905, -1.95045, 0, 0, 0, 1, 1,
-1.181576, -1.012762, -2.404535, 0, 0, 0, 1, 1,
-1.181215, 1.52338, -3.099676, 0, 0, 0, 1, 1,
-1.177959, 0.9232001, -0.8572525, 0, 0, 0, 1, 1,
-1.175728, 1.339218, -0.1775976, 1, 1, 1, 1, 1,
-1.170394, -1.467903, -1.391251, 1, 1, 1, 1, 1,
-1.169401, 0.9054388, 0.5650061, 1, 1, 1, 1, 1,
-1.164575, -2.263001, -0.1883492, 1, 1, 1, 1, 1,
-1.163261, 1.610461, -1.814721, 1, 1, 1, 1, 1,
-1.162573, 0.5409811, -0.1498397, 1, 1, 1, 1, 1,
-1.154284, 0.7699862, -1.060077, 1, 1, 1, 1, 1,
-1.153892, -0.6699446, -1.307095, 1, 1, 1, 1, 1,
-1.148462, 1.686449, -2.382096, 1, 1, 1, 1, 1,
-1.14432, -1.162999, -4.057635, 1, 1, 1, 1, 1,
-1.143665, 1.16533, -2.283614, 1, 1, 1, 1, 1,
-1.139245, 0.2033277, -1.467533, 1, 1, 1, 1, 1,
-1.13203, 1.110134, -1.30155, 1, 1, 1, 1, 1,
-1.129543, -0.0175227, -1.66547, 1, 1, 1, 1, 1,
-1.129297, -0.100461, -1.369042, 1, 1, 1, 1, 1,
-1.123041, 0.2817108, -2.682755, 0, 0, 1, 1, 1,
-1.122709, 0.2811658, -0.9767793, 1, 0, 0, 1, 1,
-1.122226, -0.8128639, -0.7845022, 1, 0, 0, 1, 1,
-1.119051, -0.5959646, -1.593013, 1, 0, 0, 1, 1,
-1.118227, 0.7496514, -1.12166, 1, 0, 0, 1, 1,
-1.117632, -1.067484, -2.430389, 1, 0, 0, 1, 1,
-1.114226, 0.03294403, -1.665635, 0, 0, 0, 1, 1,
-1.112415, -0.2876168, -2.824679, 0, 0, 0, 1, 1,
-1.109528, 0.5595615, -1.049221, 0, 0, 0, 1, 1,
-1.109154, 3.469924, -0.3339102, 0, 0, 0, 1, 1,
-1.106853, -0.6552594, -2.560038, 0, 0, 0, 1, 1,
-1.106588, 0.8850894, -0.5641391, 0, 0, 0, 1, 1,
-1.103468, -0.3305517, -3.137094, 0, 0, 0, 1, 1,
-1.102365, -1.440274, -4.236444, 1, 1, 1, 1, 1,
-1.090205, -0.4027685, -2.171642, 1, 1, 1, 1, 1,
-1.085304, -1.249306, -3.158079, 1, 1, 1, 1, 1,
-1.082397, 0.256784, -1.891766, 1, 1, 1, 1, 1,
-1.082343, 0.03454254, -2.59324, 1, 1, 1, 1, 1,
-1.08221, 0.01858114, 0.009394101, 1, 1, 1, 1, 1,
-1.081205, -0.586101, -0.7723094, 1, 1, 1, 1, 1,
-1.080101, 0.1811078, 0.04939908, 1, 1, 1, 1, 1,
-1.079586, -1.201103, -1.641938, 1, 1, 1, 1, 1,
-1.067323, -0.09338997, -2.044058, 1, 1, 1, 1, 1,
-1.052086, 0.8988843, -0.9757206, 1, 1, 1, 1, 1,
-1.050245, -1.406084, -3.630778, 1, 1, 1, 1, 1,
-1.04919, 0.2305991, -1.138968, 1, 1, 1, 1, 1,
-1.048267, -1.618177, -4.015086, 1, 1, 1, 1, 1,
-1.047645, 1.237544, -1.022543, 1, 1, 1, 1, 1,
-1.04585, 0.02660731, -0.5029308, 0, 0, 1, 1, 1,
-1.038557, -0.06352215, -1.35584, 1, 0, 0, 1, 1,
-1.037861, -0.1429353, 0.1535923, 1, 0, 0, 1, 1,
-1.035662, 0.9221733, -0.8277345, 1, 0, 0, 1, 1,
-1.035572, 0.9078727, -1.194133, 1, 0, 0, 1, 1,
-1.033302, 1.118984, 0.4771207, 1, 0, 0, 1, 1,
-1.026744, -2.083143, -2.315369, 0, 0, 0, 1, 1,
-1.021228, -1.312343, -2.9356, 0, 0, 0, 1, 1,
-1.011775, -0.6830713, -2.547523, 0, 0, 0, 1, 1,
-1.004356, 1.318988, -0.5695514, 0, 0, 0, 1, 1,
-1.000262, -0.7267035, -3.020478, 0, 0, 0, 1, 1,
-0.9994766, -0.4243401, -2.630188, 0, 0, 0, 1, 1,
-0.9886136, 0.5551453, -0.3406724, 0, 0, 0, 1, 1,
-0.9807893, 0.162819, -0.08775964, 1, 1, 1, 1, 1,
-0.9713137, -0.08569448, -1.835798, 1, 1, 1, 1, 1,
-0.9643651, 1.68307, -0.5949809, 1, 1, 1, 1, 1,
-0.9565994, 0.2059452, -2.847362, 1, 1, 1, 1, 1,
-0.9540689, 2.199293, -1.019135, 1, 1, 1, 1, 1,
-0.9491778, 0.3181388, -1.325216, 1, 1, 1, 1, 1,
-0.9472173, -1.495985, -4.204687, 1, 1, 1, 1, 1,
-0.9445274, 0.0436204, -0.9293748, 1, 1, 1, 1, 1,
-0.9444076, 0.9096288, -2.904456, 1, 1, 1, 1, 1,
-0.9425685, -2.550291, -3.109567, 1, 1, 1, 1, 1,
-0.9396828, -1.285139, -2.650224, 1, 1, 1, 1, 1,
-0.930424, -0.7628704, -2.124345, 1, 1, 1, 1, 1,
-0.9294297, 0.4067482, 0.2539258, 1, 1, 1, 1, 1,
-0.9250934, 0.9176624, 0.2210082, 1, 1, 1, 1, 1,
-0.9231636, -0.8864403, -1.587188, 1, 1, 1, 1, 1,
-0.9163133, -0.4633795, -2.62567, 0, 0, 1, 1, 1,
-0.9081854, -1.151349, -1.632383, 1, 0, 0, 1, 1,
-0.9047177, -1.333594, -2.34147, 1, 0, 0, 1, 1,
-0.8943394, 1.390335, -0.8280444, 1, 0, 0, 1, 1,
-0.8881077, 1.052141, 0.04203357, 1, 0, 0, 1, 1,
-0.8880592, -1.382945, -1.902206, 1, 0, 0, 1, 1,
-0.8803977, -0.1478188, -0.3932532, 0, 0, 0, 1, 1,
-0.8757831, -0.3969943, -1.752377, 0, 0, 0, 1, 1,
-0.8729083, 1.782495, 0.3382521, 0, 0, 0, 1, 1,
-0.8708674, -1.428268, -2.460991, 0, 0, 0, 1, 1,
-0.8634963, 1.019963, -1.056861, 0, 0, 0, 1, 1,
-0.8622346, 0.8855391, -1.263148, 0, 0, 0, 1, 1,
-0.8603628, 0.4954704, -0.293961, 0, 0, 0, 1, 1,
-0.8594175, 0.1271607, -2.245266, 1, 1, 1, 1, 1,
-0.8588874, 1.858962, 0.9913087, 1, 1, 1, 1, 1,
-0.8556069, 0.6788889, -2.714922, 1, 1, 1, 1, 1,
-0.8542621, 1.115548, -1.621443, 1, 1, 1, 1, 1,
-0.8523824, -0.1581538, -0.9580973, 1, 1, 1, 1, 1,
-0.8474529, 0.4595098, -1.764198, 1, 1, 1, 1, 1,
-0.8360077, 0.6766586, -0.6427733, 1, 1, 1, 1, 1,
-0.8306884, -0.7528653, -2.230894, 1, 1, 1, 1, 1,
-0.8262334, 1.06863, -0.6605043, 1, 1, 1, 1, 1,
-0.8239965, 1.408505, 0.2635328, 1, 1, 1, 1, 1,
-0.8234122, -0.6348953, -2.967106, 1, 1, 1, 1, 1,
-0.8199069, 2.830601, -0.5804088, 1, 1, 1, 1, 1,
-0.8145784, -0.01873568, -1.282364, 1, 1, 1, 1, 1,
-0.8099291, 0.1088338, 0.4626629, 1, 1, 1, 1, 1,
-0.8099049, 0.04674881, -3.349924, 1, 1, 1, 1, 1,
-0.8080828, -0.240094, -1.705971, 0, 0, 1, 1, 1,
-0.8075897, -0.2824036, -1.927487, 1, 0, 0, 1, 1,
-0.8028871, -1.063623, -1.174058, 1, 0, 0, 1, 1,
-0.7977071, 1.886486, -1.096533, 1, 0, 0, 1, 1,
-0.7933969, -0.7641891, -2.005136, 1, 0, 0, 1, 1,
-0.7900387, -1.835005, -4.244812, 1, 0, 0, 1, 1,
-0.7890693, -0.3555109, -2.190084, 0, 0, 0, 1, 1,
-0.7832696, -0.3378784, -0.9319106, 0, 0, 0, 1, 1,
-0.7783264, -0.5524497, -2.80168, 0, 0, 0, 1, 1,
-0.7754922, -0.6678702, -2.887326, 0, 0, 0, 1, 1,
-0.7639533, -2.419762, -3.183006, 0, 0, 0, 1, 1,
-0.7629938, -0.5448071, -2.335308, 0, 0, 0, 1, 1,
-0.7627341, -1.733277, -3.815141, 0, 0, 0, 1, 1,
-0.7535404, 0.8284504, -2.074158, 1, 1, 1, 1, 1,
-0.7502976, 0.4425174, -0.3233277, 1, 1, 1, 1, 1,
-0.7486042, -1.333783, -2.005937, 1, 1, 1, 1, 1,
-0.7365882, 0.8414466, -1.056754, 1, 1, 1, 1, 1,
-0.7338642, -0.4729908, -2.09873, 1, 1, 1, 1, 1,
-0.7279835, -0.190623, -2.728283, 1, 1, 1, 1, 1,
-0.7251703, 0.1718515, -0.2768296, 1, 1, 1, 1, 1,
-0.7218667, 0.1010376, -2.107735, 1, 1, 1, 1, 1,
-0.710956, 1.57733, -1.232851, 1, 1, 1, 1, 1,
-0.710277, -2.827637, -3.627091, 1, 1, 1, 1, 1,
-0.7100886, -1.786979, -1.423406, 1, 1, 1, 1, 1,
-0.7013322, -0.16256, -1.30734, 1, 1, 1, 1, 1,
-0.7008284, -0.3428225, -3.411711, 1, 1, 1, 1, 1,
-0.699116, -1.367491, -2.485479, 1, 1, 1, 1, 1,
-0.6978641, -0.5834389, -0.7021674, 1, 1, 1, 1, 1,
-0.6950701, 0.380285, -0.839532, 0, 0, 1, 1, 1,
-0.69425, -0.4356282, -3.932283, 1, 0, 0, 1, 1,
-0.6911425, -1.202186, -1.455777, 1, 0, 0, 1, 1,
-0.691012, 0.2792514, -0.4541474, 1, 0, 0, 1, 1,
-0.6893324, -0.02227071, -1.117515, 1, 0, 0, 1, 1,
-0.689212, -1.168627, -3.016449, 1, 0, 0, 1, 1,
-0.6838956, -0.09113746, -2.58751, 0, 0, 0, 1, 1,
-0.6766551, 0.7130324, -2.819806, 0, 0, 0, 1, 1,
-0.6713387, 0.3572558, -1.288884, 0, 0, 0, 1, 1,
-0.6705018, 0.2125929, -1.23309, 0, 0, 0, 1, 1,
-0.6702506, -1.051973, -2.787098, 0, 0, 0, 1, 1,
-0.6672393, 0.2280483, 0.415317, 0, 0, 0, 1, 1,
-0.666345, -1.173235, -2.157869, 0, 0, 0, 1, 1,
-0.6561566, 0.09547938, -1.094813, 1, 1, 1, 1, 1,
-0.6523982, -0.05704385, -0.3761801, 1, 1, 1, 1, 1,
-0.649429, 1.031417, -0.2041164, 1, 1, 1, 1, 1,
-0.6489753, -1.738358, -2.987643, 1, 1, 1, 1, 1,
-0.6470543, -1.12945, -3.986326, 1, 1, 1, 1, 1,
-0.6468456, 0.9106728, -0.470846, 1, 1, 1, 1, 1,
-0.6468274, 1.244116, -0.7736934, 1, 1, 1, 1, 1,
-0.6453796, -1.746163, -3.283734, 1, 1, 1, 1, 1,
-0.6435193, 0.7032369, -2.926733, 1, 1, 1, 1, 1,
-0.6363552, 0.08180793, -0.785158, 1, 1, 1, 1, 1,
-0.6361759, -1.723459, -3.143163, 1, 1, 1, 1, 1,
-0.6293747, -0.02347959, -0.5626633, 1, 1, 1, 1, 1,
-0.6198721, -0.466217, -2.598773, 1, 1, 1, 1, 1,
-0.611276, -0.9974992, -2.729041, 1, 1, 1, 1, 1,
-0.607387, 0.01120544, 0.2741102, 1, 1, 1, 1, 1,
-0.6050367, 1.092047, 0.6416327, 0, 0, 1, 1, 1,
-0.5996116, 0.666622, -1.570672, 1, 0, 0, 1, 1,
-0.5971905, -0.2248831, -2.180476, 1, 0, 0, 1, 1,
-0.5908464, 0.7202625, -1.092553, 1, 0, 0, 1, 1,
-0.5878248, -0.496908, -3.998493, 1, 0, 0, 1, 1,
-0.5871893, -1.498734, -4.361192, 1, 0, 0, 1, 1,
-0.5822388, 0.645008, -0.7591846, 0, 0, 0, 1, 1,
-0.5816664, 0.6355703, 0.7045752, 0, 0, 0, 1, 1,
-0.5794711, -0.3068668, -0.3743305, 0, 0, 0, 1, 1,
-0.5786306, -0.4199569, -2.870223, 0, 0, 0, 1, 1,
-0.5742749, 1.802788, 0.6400203, 0, 0, 0, 1, 1,
-0.5711746, 1.297166, -0.1333011, 0, 0, 0, 1, 1,
-0.5692947, -0.2851913, -2.926392, 0, 0, 0, 1, 1,
-0.567474, -1.363803, -1.364261, 1, 1, 1, 1, 1,
-0.5664397, 2.04351, 0.6873959, 1, 1, 1, 1, 1,
-0.56552, 0.008807172, -2.052448, 1, 1, 1, 1, 1,
-0.5589994, -0.4894029, -1.79953, 1, 1, 1, 1, 1,
-0.5579104, 0.8709717, -1.346017, 1, 1, 1, 1, 1,
-0.5533686, 0.7133785, -3.207193, 1, 1, 1, 1, 1,
-0.551726, -0.07370892, -1.626268, 1, 1, 1, 1, 1,
-0.5504292, -1.253886, -4.248951, 1, 1, 1, 1, 1,
-0.5472065, -1.123623, -3.385281, 1, 1, 1, 1, 1,
-0.5369681, 0.3855663, -2.075534, 1, 1, 1, 1, 1,
-0.5367926, -0.2172053, -1.819392, 1, 1, 1, 1, 1,
-0.5352462, -0.716288, -2.733677, 1, 1, 1, 1, 1,
-0.5346032, 0.05019267, -0.6841901, 1, 1, 1, 1, 1,
-0.5268505, 0.5356628, 1.066268, 1, 1, 1, 1, 1,
-0.5142568, 0.6556883, -0.4686388, 1, 1, 1, 1, 1,
-0.5141963, 1.341259, -0.05739465, 0, 0, 1, 1, 1,
-0.4960793, -0.4246553, -2.969295, 1, 0, 0, 1, 1,
-0.4951939, -0.5884387, -1.896981, 1, 0, 0, 1, 1,
-0.4947142, -1.362265, -3.006085, 1, 0, 0, 1, 1,
-0.486801, 0.6849258, -2.069325, 1, 0, 0, 1, 1,
-0.4858651, -0.2980226, -0.5393729, 1, 0, 0, 1, 1,
-0.4851059, 1.164694, -0.8312569, 0, 0, 0, 1, 1,
-0.4849499, 0.5123559, -2.801753, 0, 0, 0, 1, 1,
-0.4845771, 0.3416815, -1.549742, 0, 0, 0, 1, 1,
-0.479267, 0.008852225, -0.4198867, 0, 0, 0, 1, 1,
-0.4792092, 0.3528758, -0.3498424, 0, 0, 0, 1, 1,
-0.4763955, 1.293819, 0.7606117, 0, 0, 0, 1, 1,
-0.4704424, 0.3861169, -1.87303, 0, 0, 0, 1, 1,
-0.4704385, -0.2257327, -2.60781, 1, 1, 1, 1, 1,
-0.4667031, -0.4446039, -1.591243, 1, 1, 1, 1, 1,
-0.4640079, 0.8868942, -0.4579395, 1, 1, 1, 1, 1,
-0.4626837, -0.1727207, -2.024675, 1, 1, 1, 1, 1,
-0.4579588, 0.8195119, 0.2883247, 1, 1, 1, 1, 1,
-0.4542442, 0.7011683, -2.369299, 1, 1, 1, 1, 1,
-0.4523328, -0.3827254, -1.165061, 1, 1, 1, 1, 1,
-0.4515249, 0.6233045, 0.1596177, 1, 1, 1, 1, 1,
-0.4484245, 1.564498, -0.5362254, 1, 1, 1, 1, 1,
-0.4393069, 0.6086836, -0.3886833, 1, 1, 1, 1, 1,
-0.4354801, 0.0004628606, -1.835891, 1, 1, 1, 1, 1,
-0.4267464, -0.05256018, -1.230874, 1, 1, 1, 1, 1,
-0.422084, 0.009975197, -1.023401, 1, 1, 1, 1, 1,
-0.4198683, 2.190392, 2.499502, 1, 1, 1, 1, 1,
-0.4139045, 0.01201722, -0.5661344, 1, 1, 1, 1, 1,
-0.4138462, -1.670808, -4.76874, 0, 0, 1, 1, 1,
-0.406613, 0.2094678, -2.243845, 1, 0, 0, 1, 1,
-0.4024906, -1.034589e-05, -1.66204, 1, 0, 0, 1, 1,
-0.3952944, -0.5294912, -2.781397, 1, 0, 0, 1, 1,
-0.3945814, -0.3324682, -1.587188, 1, 0, 0, 1, 1,
-0.385442, -0.4973948, -3.261521, 1, 0, 0, 1, 1,
-0.3795892, 1.263158, 0.1490623, 0, 0, 0, 1, 1,
-0.3778451, 0.7270362, -1.393201, 0, 0, 0, 1, 1,
-0.3733562, -0.8376015, -2.475173, 0, 0, 0, 1, 1,
-0.3715507, 0.9887387, -1.021672, 0, 0, 0, 1, 1,
-0.3711957, 0.3366668, -2.241763, 0, 0, 0, 1, 1,
-0.368314, 0.1971333, -0.2243266, 0, 0, 0, 1, 1,
-0.3678257, 0.02798668, -2.000049, 0, 0, 0, 1, 1,
-0.3658798, -0.1679421, -2.941371, 1, 1, 1, 1, 1,
-0.3649041, 1.38154, 1.398734, 1, 1, 1, 1, 1,
-0.3580377, 0.08653013, -1.589381, 1, 1, 1, 1, 1,
-0.3546665, -0.1730118, -3.488713, 1, 1, 1, 1, 1,
-0.3522237, 0.1962718, -0.9025167, 1, 1, 1, 1, 1,
-0.3521228, 0.1106465, -0.5836825, 1, 1, 1, 1, 1,
-0.3500848, 0.8191656, -0.1296422, 1, 1, 1, 1, 1,
-0.3488674, -0.246472, -2.882533, 1, 1, 1, 1, 1,
-0.3467132, -0.1616823, -2.932846, 1, 1, 1, 1, 1,
-0.3464479, 0.1078957, -2.791587, 1, 1, 1, 1, 1,
-0.3460483, 0.5596737, -2.295947, 1, 1, 1, 1, 1,
-0.345686, 1.183675, 0.7698981, 1, 1, 1, 1, 1,
-0.3428626, 0.4812268, -2.431856, 1, 1, 1, 1, 1,
-0.3411292, -0.4459603, -2.795602, 1, 1, 1, 1, 1,
-0.3405634, -0.2086423, -3.200473, 1, 1, 1, 1, 1,
-0.3311408, -0.009671101, -1.246277, 0, 0, 1, 1, 1,
-0.3297473, 0.1091958, -1.783427, 1, 0, 0, 1, 1,
-0.3297277, 0.1767565, -1.332079, 1, 0, 0, 1, 1,
-0.327567, 1.474602, -0.5694589, 1, 0, 0, 1, 1,
-0.3224722, -0.2776752, -1.341759, 1, 0, 0, 1, 1,
-0.3214123, -1.672897, -5.023273, 1, 0, 0, 1, 1,
-0.3194925, -0.6620961, -2.776826, 0, 0, 0, 1, 1,
-0.317616, 1.739377, 0.299783, 0, 0, 0, 1, 1,
-0.3162334, 1.618659, 0.4114277, 0, 0, 0, 1, 1,
-0.3161152, 1.587827, 0.05552034, 0, 0, 0, 1, 1,
-0.3155014, -1.026421, -3.053857, 0, 0, 0, 1, 1,
-0.3136701, -0.6875424, -1.891226, 0, 0, 0, 1, 1,
-0.3106078, 0.4676165, -1.332785, 0, 0, 0, 1, 1,
-0.3083265, 0.617864, -1.744393, 1, 1, 1, 1, 1,
-0.3040313, -0.6731879, -1.531736, 1, 1, 1, 1, 1,
-0.296821, 0.004637485, 0.1916216, 1, 1, 1, 1, 1,
-0.2963031, -0.1428337, -1.240113, 1, 1, 1, 1, 1,
-0.2956077, -1.259127, -3.087005, 1, 1, 1, 1, 1,
-0.2920235, -0.1554383, -3.787587, 1, 1, 1, 1, 1,
-0.2891569, -0.5879872, -3.713562, 1, 1, 1, 1, 1,
-0.2840095, -0.4210231, -2.718563, 1, 1, 1, 1, 1,
-0.283751, -0.5302886, -3.602674, 1, 1, 1, 1, 1,
-0.2829847, -1.062313, -2.041209, 1, 1, 1, 1, 1,
-0.2824811, 0.2233968, -1.236533, 1, 1, 1, 1, 1,
-0.2822067, 0.6146772, 0.06145521, 1, 1, 1, 1, 1,
-0.2819194, 0.9028195, -1.283939, 1, 1, 1, 1, 1,
-0.2812847, 0.4248236, -0.5338269, 1, 1, 1, 1, 1,
-0.2773543, -0.6271138, -2.289451, 1, 1, 1, 1, 1,
-0.2741785, 1.958949, 0.02247575, 0, 0, 1, 1, 1,
-0.2620535, -0.8448778, -1.292953, 1, 0, 0, 1, 1,
-0.2554362, -0.02351886, -0.4581671, 1, 0, 0, 1, 1,
-0.2538481, -0.07169526, -0.1594505, 1, 0, 0, 1, 1,
-0.2511098, 0.514915, -0.8697116, 1, 0, 0, 1, 1,
-0.2489373, 1.162659, 0.2150198, 1, 0, 0, 1, 1,
-0.2369881, 0.5144185, 0.9643469, 0, 0, 0, 1, 1,
-0.2332642, 0.4150494, -0.2768249, 0, 0, 0, 1, 1,
-0.2299497, -0.5130466, -2.076971, 0, 0, 0, 1, 1,
-0.2292267, 1.291269, -0.8064672, 0, 0, 0, 1, 1,
-0.2262871, 1.090661, -0.937609, 0, 0, 0, 1, 1,
-0.2247596, -0.4041477, -3.304984, 0, 0, 0, 1, 1,
-0.2180782, -0.6788778, -3.38502, 0, 0, 0, 1, 1,
-0.2172567, -0.9025977, -4.120427, 1, 1, 1, 1, 1,
-0.2150134, 1.466048, -1.559437, 1, 1, 1, 1, 1,
-0.2138514, 0.6337258, 1.131861, 1, 1, 1, 1, 1,
-0.2110781, -0.2409932, -1.243521, 1, 1, 1, 1, 1,
-0.2026834, -1.757907, -3.104409, 1, 1, 1, 1, 1,
-0.2019971, 0.02555035, -1.609119, 1, 1, 1, 1, 1,
-0.1973403, 0.3520097, -0.2908662, 1, 1, 1, 1, 1,
-0.1928989, 1.052824, -0.1725847, 1, 1, 1, 1, 1,
-0.1926951, 0.05958864, -0.2317853, 1, 1, 1, 1, 1,
-0.1887918, 0.3818854, -0.4438262, 1, 1, 1, 1, 1,
-0.1860061, 0.9459779, 0.5645853, 1, 1, 1, 1, 1,
-0.1829749, -2.056385, -4.184849, 1, 1, 1, 1, 1,
-0.182071, 1.399273, -0.7297227, 1, 1, 1, 1, 1,
-0.1805311, -0.7614645, -3.219637, 1, 1, 1, 1, 1,
-0.1712271, 0.4453359, -0.2221023, 1, 1, 1, 1, 1,
-0.169726, 0.4556822, -1.121925, 0, 0, 1, 1, 1,
-0.1694752, -0.03976837, -2.386288, 1, 0, 0, 1, 1,
-0.1679862, -1.806851, -1.906849, 1, 0, 0, 1, 1,
-0.1660923, -0.8810977, -2.763655, 1, 0, 0, 1, 1,
-0.1638895, 1.159056, -0.6953791, 1, 0, 0, 1, 1,
-0.1633649, 0.4240026, -0.1629109, 1, 0, 0, 1, 1,
-0.1628695, 0.7000076, 0.281503, 0, 0, 0, 1, 1,
-0.161816, -0.2042162, -1.399825, 0, 0, 0, 1, 1,
-0.1598967, 0.8909214, 0.3723044, 0, 0, 0, 1, 1,
-0.1579127, -0.286631, -3.571369, 0, 0, 0, 1, 1,
-0.1573822, 2.328411, -0.6448305, 0, 0, 0, 1, 1,
-0.1524723, 0.8819138, -1.387108, 0, 0, 0, 1, 1,
-0.1509324, -0.07973032, -0.08654372, 0, 0, 0, 1, 1,
-0.1493833, -0.3933117, -4.089418, 1, 1, 1, 1, 1,
-0.1482602, -0.4830851, -3.995348, 1, 1, 1, 1, 1,
-0.1413774, 0.1888234, -3.194589, 1, 1, 1, 1, 1,
-0.1395489, 1.100353, -0.1884657, 1, 1, 1, 1, 1,
-0.1375573, -1.69376, -4.075214, 1, 1, 1, 1, 1,
-0.1346003, 0.3114586, -0.8667236, 1, 1, 1, 1, 1,
-0.1342328, 1.560265, 0.8610984, 1, 1, 1, 1, 1,
-0.1330554, 0.8975874, 0.7591761, 1, 1, 1, 1, 1,
-0.1315949, 0.148296, -1.048538, 1, 1, 1, 1, 1,
-0.1302616, -0.5340154, -2.115567, 1, 1, 1, 1, 1,
-0.1282467, -0.9916735, -2.487503, 1, 1, 1, 1, 1,
-0.1247349, -0.1954623, -3.156438, 1, 1, 1, 1, 1,
-0.1222411, -1.654936, -2.36476, 1, 1, 1, 1, 1,
-0.121916, -2.352493, -1.272825, 1, 1, 1, 1, 1,
-0.1180867, -0.9034375, -4.718636, 1, 1, 1, 1, 1,
-0.1134937, 0.575119, 1.30958, 0, 0, 1, 1, 1,
-0.1118033, -1.188509, -3.366119, 1, 0, 0, 1, 1,
-0.1072728, 0.05692323, -1.069589, 1, 0, 0, 1, 1,
-0.1055084, -1.16376, -2.13779, 1, 0, 0, 1, 1,
-0.09593645, -0.4120544, -0.04053766, 1, 0, 0, 1, 1,
-0.09588855, -0.4517585, -1.647745, 1, 0, 0, 1, 1,
-0.09342928, -0.3147897, -2.434921, 0, 0, 0, 1, 1,
-0.09014296, 1.355434, 0.1328001, 0, 0, 0, 1, 1,
-0.08906195, -1.355562, -2.766373, 0, 0, 0, 1, 1,
-0.08787267, 0.3574933, -0.7172905, 0, 0, 0, 1, 1,
-0.08665387, 0.6283251, -0.1200596, 0, 0, 0, 1, 1,
-0.0860855, -0.3359587, -2.147768, 0, 0, 0, 1, 1,
-0.08456421, -0.07250884, -2.899524, 0, 0, 0, 1, 1,
-0.08001345, 2.681602, -1.448608, 1, 1, 1, 1, 1,
-0.07927571, -0.7033873, -4.663579, 1, 1, 1, 1, 1,
-0.0786435, 0.3432991, -0.220294, 1, 1, 1, 1, 1,
-0.07731733, -1.854982, -3.30347, 1, 1, 1, 1, 1,
-0.07534088, 1.029398, 1.08368, 1, 1, 1, 1, 1,
-0.07357902, -0.3097031, -2.040903, 1, 1, 1, 1, 1,
-0.07323902, 0.6255276, -0.2651587, 1, 1, 1, 1, 1,
-0.07101997, 0.1069796, -0.6234844, 1, 1, 1, 1, 1,
-0.0680066, -0.4963253, -3.562603, 1, 1, 1, 1, 1,
-0.0666422, -1.256421, -4.157142, 1, 1, 1, 1, 1,
-0.06265292, -0.3996325, -2.239799, 1, 1, 1, 1, 1,
-0.06077024, -0.20649, -2.380498, 1, 1, 1, 1, 1,
-0.06043223, 0.7340751, 0.668335, 1, 1, 1, 1, 1,
-0.05875759, -1.32719, -3.230473, 1, 1, 1, 1, 1,
-0.05874067, 0.2612185, -0.1756551, 1, 1, 1, 1, 1,
-0.05637007, -1.788362, -3.483587, 0, 0, 1, 1, 1,
-0.05238299, -0.2027965, -4.673981, 1, 0, 0, 1, 1,
-0.04873099, 0.3520093, 0.5324788, 1, 0, 0, 1, 1,
-0.04857761, -0.5980446, -3.542841, 1, 0, 0, 1, 1,
-0.04745719, -0.433094, -2.254736, 1, 0, 0, 1, 1,
-0.04279666, 1.543584, -0.7611756, 1, 0, 0, 1, 1,
-0.03967274, -0.3270275, -5.649721, 0, 0, 0, 1, 1,
-0.03684057, 1.552984, -0.7141749, 0, 0, 0, 1, 1,
-0.03364822, 1.2929, -0.9948825, 0, 0, 0, 1, 1,
-0.0285329, 0.03699901, -0.6177484, 0, 0, 0, 1, 1,
-0.02788539, -0.5049729, -3.306279, 0, 0, 0, 1, 1,
-0.02161475, 1.471869, -0.8870412, 0, 0, 0, 1, 1,
-0.01962817, -0.3131614, -1.85338, 0, 0, 0, 1, 1,
-0.01520482, -0.2612707, -3.120397, 1, 1, 1, 1, 1,
-0.01227199, 1.224698, 0.869858, 1, 1, 1, 1, 1,
-0.007712534, 0.2209807, -0.005656646, 1, 1, 1, 1, 1,
-0.005605122, -0.9000845, -3.271399, 1, 1, 1, 1, 1,
-0.004949688, 0.6149351, 0.2127868, 1, 1, 1, 1, 1,
-0.004268368, -0.1200918, -3.410459, 1, 1, 1, 1, 1,
-0.00219903, 0.2909322, 1.584032, 1, 1, 1, 1, 1,
-0.0005721883, -0.7068013, -2.342049, 1, 1, 1, 1, 1,
0.0005000988, 1.224577, -1.743402, 1, 1, 1, 1, 1,
0.005083805, -0.0545566, 3.63225, 1, 1, 1, 1, 1,
0.005681968, -0.7886654, 4.376256, 1, 1, 1, 1, 1,
0.006194154, 0.5236924, -0.9411225, 1, 1, 1, 1, 1,
0.007695829, 1.980873, -1.39688, 1, 1, 1, 1, 1,
0.01177975, -0.7035537, 3.699523, 1, 1, 1, 1, 1,
0.01849898, -0.8846227, 2.201506, 1, 1, 1, 1, 1,
0.02976415, 0.6178113, 1.345957, 0, 0, 1, 1, 1,
0.02986067, -0.4823066, 3.543097, 1, 0, 0, 1, 1,
0.03599402, 1.402303, -1.055621, 1, 0, 0, 1, 1,
0.03713998, 1.130552, 0.7124816, 1, 0, 0, 1, 1,
0.03800222, -0.4811975, 4.024651, 1, 0, 0, 1, 1,
0.03892962, -0.9788303, 3.6217, 1, 0, 0, 1, 1,
0.04009333, 0.9714803, 0.689314, 0, 0, 0, 1, 1,
0.04551816, 0.8492296, 0.02459481, 0, 0, 0, 1, 1,
0.04634974, 0.9054045, -0.8889761, 0, 0, 0, 1, 1,
0.04733039, 0.05367932, 1.728893, 0, 0, 0, 1, 1,
0.04767653, 2.188742, -0.286501, 0, 0, 0, 1, 1,
0.05357366, 0.4418586, 0.8730375, 0, 0, 0, 1, 1,
0.05427699, -0.7978317, 1.86236, 0, 0, 0, 1, 1,
0.05846934, 0.3441364, -0.2446398, 1, 1, 1, 1, 1,
0.05978421, -1.860524, 2.114697, 1, 1, 1, 1, 1,
0.06232318, -0.6081337, 2.239394, 1, 1, 1, 1, 1,
0.06309759, -0.7218465, 0.9296748, 1, 1, 1, 1, 1,
0.06594825, 0.6028587, 0.09359443, 1, 1, 1, 1, 1,
0.06770375, 1.334278, 1.562606, 1, 1, 1, 1, 1,
0.07348574, 0.5285947, -0.5813438, 1, 1, 1, 1, 1,
0.07467697, 1.602261, -1.869806, 1, 1, 1, 1, 1,
0.07848964, 0.2298552, 0.6005134, 1, 1, 1, 1, 1,
0.07893777, -0.547619, 2.980298, 1, 1, 1, 1, 1,
0.08180178, -1.974501, 1.934006, 1, 1, 1, 1, 1,
0.09204203, -0.6064467, 2.518728, 1, 1, 1, 1, 1,
0.09667017, 0.180959, 0.8454363, 1, 1, 1, 1, 1,
0.09667975, 0.6623504, -1.53976, 1, 1, 1, 1, 1,
0.09793217, -0.5733901, 2.783648, 1, 1, 1, 1, 1,
0.09924313, -1.911202, 3.437118, 0, 0, 1, 1, 1,
0.1048768, -0.906396, 4.365588, 1, 0, 0, 1, 1,
0.1049551, 0.4759935, 0.216729, 1, 0, 0, 1, 1,
0.1052178, 1.671621, -0.6550439, 1, 0, 0, 1, 1,
0.1054007, 0.9190393, 0.4454712, 1, 0, 0, 1, 1,
0.1062124, -0.4283327, 4.070975, 1, 0, 0, 1, 1,
0.1063239, -0.2194168, 1.657246, 0, 0, 0, 1, 1,
0.107219, 1.016642, 0.3104991, 0, 0, 0, 1, 1,
0.1096542, 1.365849, -0.2342574, 0, 0, 0, 1, 1,
0.1117811, 0.7625985, 0.4230534, 0, 0, 0, 1, 1,
0.1165383, -0.8825552, 3.139473, 0, 0, 0, 1, 1,
0.1227665, 1.243397, -0.448209, 0, 0, 0, 1, 1,
0.1285771, 0.1618595, 1.308999, 0, 0, 0, 1, 1,
0.1333162, -2.524402, 4.343679, 1, 1, 1, 1, 1,
0.1337654, 0.0241961, -1.012217, 1, 1, 1, 1, 1,
0.1360468, 1.996656, -0.4481112, 1, 1, 1, 1, 1,
0.1377044, 0.9195997, 0.5464984, 1, 1, 1, 1, 1,
0.1379569, -0.443497, 2.187562, 1, 1, 1, 1, 1,
0.1405301, 0.9968015, -1.784438, 1, 1, 1, 1, 1,
0.141561, 1.796137, 0.1632529, 1, 1, 1, 1, 1,
0.1500092, -0.6980131, 3.391165, 1, 1, 1, 1, 1,
0.1535635, -0.6079371, 3.545259, 1, 1, 1, 1, 1,
0.1580091, 0.02169427, 1.116977, 1, 1, 1, 1, 1,
0.1610737, -0.2466261, 2.734949, 1, 1, 1, 1, 1,
0.1626684, 0.2455457, 0.7325172, 1, 1, 1, 1, 1,
0.1629845, -0.2747402, 1.401, 1, 1, 1, 1, 1,
0.1632205, -0.384491, 2.416883, 1, 1, 1, 1, 1,
0.1650891, 1.557552, 1.061632, 1, 1, 1, 1, 1,
0.1655278, -0.03123115, 1.88332, 0, 0, 1, 1, 1,
0.1671592, 0.1018126, 2.167308, 1, 0, 0, 1, 1,
0.1705809, -1.053253, 2.356223, 1, 0, 0, 1, 1,
0.1716539, -0.4636344, 2.788009, 1, 0, 0, 1, 1,
0.1751401, -0.1156198, 2.166587, 1, 0, 0, 1, 1,
0.1765767, 0.5898407, -0.7087772, 1, 0, 0, 1, 1,
0.1778831, -0.1694279, 3.25902, 0, 0, 0, 1, 1,
0.1790201, -0.7821986, 3.970052, 0, 0, 0, 1, 1,
0.1791965, 0.2769609, 1.20269, 0, 0, 0, 1, 1,
0.1800743, -1.673783, 4.342805, 0, 0, 0, 1, 1,
0.1884254, 2.965014, 1.144359, 0, 0, 0, 1, 1,
0.1931773, -1.371859, 3.627838, 0, 0, 0, 1, 1,
0.1939876, 1.06715, 0.4284934, 0, 0, 0, 1, 1,
0.1954328, 0.1305856, 0.8259747, 1, 1, 1, 1, 1,
0.2008478, -0.2342021, 2.293416, 1, 1, 1, 1, 1,
0.2011385, 0.5437449, 0.6084089, 1, 1, 1, 1, 1,
0.2028628, 0.804731, -1.274141, 1, 1, 1, 1, 1,
0.2030702, 2.445839, 0.5859664, 1, 1, 1, 1, 1,
0.2032571, -0.3031338, 1.799831, 1, 1, 1, 1, 1,
0.2057909, 0.3278894, 0.4815823, 1, 1, 1, 1, 1,
0.2114488, -0.8170538, 2.749075, 1, 1, 1, 1, 1,
0.2158995, -1.255717, 2.638145, 1, 1, 1, 1, 1,
0.2253442, -0.3023806, 2.145342, 1, 1, 1, 1, 1,
0.2268497, -0.2606242, 2.724091, 1, 1, 1, 1, 1,
0.2271023, 0.4149247, 1.380983, 1, 1, 1, 1, 1,
0.231418, -0.2920932, 2.600414, 1, 1, 1, 1, 1,
0.234953, -0.2246735, 1.257454, 1, 1, 1, 1, 1,
0.2354189, -1.209619, 4.916451, 1, 1, 1, 1, 1,
0.2354908, -0.9860019, 3.243345, 0, 0, 1, 1, 1,
0.2405514, 0.2285502, -0.4523136, 1, 0, 0, 1, 1,
0.24378, -0.05287975, 2.674982, 1, 0, 0, 1, 1,
0.2455982, 0.8997668, -0.07942896, 1, 0, 0, 1, 1,
0.2465674, 0.8146843, 0.4694217, 1, 0, 0, 1, 1,
0.2478743, -1.017947, 1.304772, 1, 0, 0, 1, 1,
0.2491247, 0.828056, 0.4318565, 0, 0, 0, 1, 1,
0.2504975, 1.177907, 0.7863424, 0, 0, 0, 1, 1,
0.2518046, -0.4046016, 2.259106, 0, 0, 0, 1, 1,
0.2532189, -1.608804, 3.130272, 0, 0, 0, 1, 1,
0.2534651, -1.459946, 2.775815, 0, 0, 0, 1, 1,
0.254861, -0.3595909, 2.369691, 0, 0, 0, 1, 1,
0.2615277, -1.16246, 2.910447, 0, 0, 0, 1, 1,
0.2617877, -0.1044172, 1.036369, 1, 1, 1, 1, 1,
0.2636569, 0.9186759, 0.4241659, 1, 1, 1, 1, 1,
0.2636898, -0.3032232, 3.405372, 1, 1, 1, 1, 1,
0.2645555, -0.629142, 3.520761, 1, 1, 1, 1, 1,
0.2678879, 0.8699762, -0.05058195, 1, 1, 1, 1, 1,
0.2684423, 1.486975, -2.026113, 1, 1, 1, 1, 1,
0.2713704, -0.04655496, 3.214886, 1, 1, 1, 1, 1,
0.2725079, -0.1635339, 1.876925, 1, 1, 1, 1, 1,
0.2800714, -1.526916, 4.045769, 1, 1, 1, 1, 1,
0.2842628, 1.364101, -0.3299134, 1, 1, 1, 1, 1,
0.2858985, -1.495675, 1.516473, 1, 1, 1, 1, 1,
0.2863122, 0.4169788, 2.168989, 1, 1, 1, 1, 1,
0.2863418, -0.6554228, 1.073512, 1, 1, 1, 1, 1,
0.2869197, -0.04571038, 2.221383, 1, 1, 1, 1, 1,
0.2886357, -1.3268, 2.584255, 1, 1, 1, 1, 1,
0.2938344, 0.1233637, 0.8598931, 0, 0, 1, 1, 1,
0.2942225, 0.6475701, 0.7688871, 1, 0, 0, 1, 1,
0.2999253, -0.7422786, 1.851063, 1, 0, 0, 1, 1,
0.3010351, -0.1939052, 2.454015, 1, 0, 0, 1, 1,
0.3026643, -0.9740339, 3.324864, 1, 0, 0, 1, 1,
0.3053573, -0.3102924, 2.795124, 1, 0, 0, 1, 1,
0.3068958, -1.451078, 1.068545, 0, 0, 0, 1, 1,
0.3074313, -0.7241806, 1.312827, 0, 0, 0, 1, 1,
0.3111159, 0.711386, 3.903208, 0, 0, 0, 1, 1,
0.3123519, -0.6793285, 3.848449, 0, 0, 0, 1, 1,
0.3127487, -0.02129282, 1.829499, 0, 0, 0, 1, 1,
0.3137219, -0.8339648, 2.85529, 0, 0, 0, 1, 1,
0.3164394, -1.235607, 3.474188, 0, 0, 0, 1, 1,
0.3191268, 1.535603, -0.223973, 1, 1, 1, 1, 1,
0.3229133, 0.3241834, 0.8318192, 1, 1, 1, 1, 1,
0.3232714, -1.32413, 2.882415, 1, 1, 1, 1, 1,
0.3272641, -0.1070401, 1.529771, 1, 1, 1, 1, 1,
0.3273029, 1.930538, 1.557895, 1, 1, 1, 1, 1,
0.3304298, 1.766781, 0.1076716, 1, 1, 1, 1, 1,
0.3320292, -1.048754, 4.066765, 1, 1, 1, 1, 1,
0.33255, 1.306535, -1.250376, 1, 1, 1, 1, 1,
0.3363701, 0.5538027, 0.5822789, 1, 1, 1, 1, 1,
0.3390667, 1.022055, 0.6897308, 1, 1, 1, 1, 1,
0.3540165, 0.6269673, -0.6959147, 1, 1, 1, 1, 1,
0.3556836, -1.011363, 2.562255, 1, 1, 1, 1, 1,
0.358318, 0.1147709, 2.116833, 1, 1, 1, 1, 1,
0.3591375, 0.5415633, 1.881832, 1, 1, 1, 1, 1,
0.3624337, 0.3918171, 1.006693, 1, 1, 1, 1, 1,
0.3629096, 2.306306, -0.7034165, 0, 0, 1, 1, 1,
0.3641557, -0.7590862, 2.044217, 1, 0, 0, 1, 1,
0.3650241, 0.9920725, -0.3184896, 1, 0, 0, 1, 1,
0.3661611, -0.9732848, 1.908075, 1, 0, 0, 1, 1,
0.3690288, 0.4794023, 1.334278, 1, 0, 0, 1, 1,
0.3735769, -1.817952, 4.855414, 1, 0, 0, 1, 1,
0.3742056, -1.371623, 3.350068, 0, 0, 0, 1, 1,
0.3806598, -1.331728, 1.170605, 0, 0, 0, 1, 1,
0.3828137, 0.3363836, 1.912192, 0, 0, 0, 1, 1,
0.3842557, -1.45247, 2.833732, 0, 0, 0, 1, 1,
0.3859856, 0.264957, 0.868625, 0, 0, 0, 1, 1,
0.3896615, -0.2895254, 1.184272, 0, 0, 0, 1, 1,
0.3944764, -0.4891863, 2.906063, 0, 0, 0, 1, 1,
0.3971215, 0.1698779, 1.560146, 1, 1, 1, 1, 1,
0.3978943, -1.402993, 0.9313254, 1, 1, 1, 1, 1,
0.3993326, -0.5515139, 2.065135, 1, 1, 1, 1, 1,
0.3995112, -0.06631713, 2.666625, 1, 1, 1, 1, 1,
0.4028077, -0.06897001, 0.8173862, 1, 1, 1, 1, 1,
0.4065239, 1.080725, -1.833294, 1, 1, 1, 1, 1,
0.4096648, -0.9908688, 2.267848, 1, 1, 1, 1, 1,
0.4204461, -0.4765641, 2.841903, 1, 1, 1, 1, 1,
0.4205926, 1.644673, 0.62002, 1, 1, 1, 1, 1,
0.4260157, -1.190129, 5.367992, 1, 1, 1, 1, 1,
0.4263757, -0.9283559, 2.731261, 1, 1, 1, 1, 1,
0.4277185, -0.3219436, 3.963829, 1, 1, 1, 1, 1,
0.4302833, 0.5355631, 1.650476, 1, 1, 1, 1, 1,
0.4322027, -0.4309907, -0.08285586, 1, 1, 1, 1, 1,
0.4328559, 0.8164239, 1.487862, 1, 1, 1, 1, 1,
0.4354075, 1.880942, 0.583317, 0, 0, 1, 1, 1,
0.4389574, -1.325002, 3.719041, 1, 0, 0, 1, 1,
0.4459579, -0.1398834, 1.805701, 1, 0, 0, 1, 1,
0.4466846, -0.7094961, 3.798708, 1, 0, 0, 1, 1,
0.4485179, 0.1840252, 0.4968371, 1, 0, 0, 1, 1,
0.4530474, 0.003440767, 2.882344, 1, 0, 0, 1, 1,
0.4538909, 0.3414904, -0.2213474, 0, 0, 0, 1, 1,
0.4540204, -0.6321312, 3.606598, 0, 0, 0, 1, 1,
0.4553337, 0.4179054, 1.254727, 0, 0, 0, 1, 1,
0.4576811, 1.237433, -0.07073469, 0, 0, 0, 1, 1,
0.4589823, -0.8987914, 3.288052, 0, 0, 0, 1, 1,
0.4599736, -0.6625758, 2.152073, 0, 0, 0, 1, 1,
0.4619731, -0.3094015, 1.245779, 0, 0, 0, 1, 1,
0.4634212, -0.6273798, 2.179215, 1, 1, 1, 1, 1,
0.4662766, -0.3752266, 0.95522, 1, 1, 1, 1, 1,
0.4686248, -1.132474, 4.499949, 1, 1, 1, 1, 1,
0.4693602, 0.09943531, 1.632503, 1, 1, 1, 1, 1,
0.4705543, 0.7284803, 1.698111, 1, 1, 1, 1, 1,
0.4706534, -0.2473191, 3.073913, 1, 1, 1, 1, 1,
0.4715154, 1.812687, 0.2759557, 1, 1, 1, 1, 1,
0.4786598, -0.2889847, 3.871462, 1, 1, 1, 1, 1,
0.4815604, -1.072885, 2.679282, 1, 1, 1, 1, 1,
0.4822, -0.4760089, 0.9031132, 1, 1, 1, 1, 1,
0.4822134, -1.414765, 4.056569, 1, 1, 1, 1, 1,
0.482839, 0.2651136, 0.611463, 1, 1, 1, 1, 1,
0.4845299, 0.6355175, 1.787362, 1, 1, 1, 1, 1,
0.4845459, -1.015728, 2.942813, 1, 1, 1, 1, 1,
0.4863528, 0.1982413, 2.103723, 1, 1, 1, 1, 1,
0.4868762, -1.685286, 3.005943, 0, 0, 1, 1, 1,
0.4936458, -0.4955052, 2.233295, 1, 0, 0, 1, 1,
0.4938847, 0.02349763, 3.428631, 1, 0, 0, 1, 1,
0.5025954, 3.387789, -1.779438, 1, 0, 0, 1, 1,
0.5038081, -1.067881, 2.644504, 1, 0, 0, 1, 1,
0.5058702, 1.289942, 2.787236, 1, 0, 0, 1, 1,
0.508969, -1.186773, 1.613669, 0, 0, 0, 1, 1,
0.5093616, 0.06055092, 2.324562, 0, 0, 0, 1, 1,
0.5144174, -0.9030562, 3.183387, 0, 0, 0, 1, 1,
0.515569, 0.2230211, -0.1137443, 0, 0, 0, 1, 1,
0.5161058, 0.4913478, 0.1888717, 0, 0, 0, 1, 1,
0.5194477, -0.6293512, 3.240528, 0, 0, 0, 1, 1,
0.5235661, -1.2125, 3.958793, 0, 0, 0, 1, 1,
0.5246875, 1.065711, -0.5276114, 1, 1, 1, 1, 1,
0.5267377, 2.064204, -0.912438, 1, 1, 1, 1, 1,
0.536386, 0.2820456, 1.786366, 1, 1, 1, 1, 1,
0.5431957, -0.5762106, 3.41742, 1, 1, 1, 1, 1,
0.5484301, -0.5167869, 1.670357, 1, 1, 1, 1, 1,
0.5535845, -2.475379, 2.209748, 1, 1, 1, 1, 1,
0.5560095, 0.4873512, 1.730038, 1, 1, 1, 1, 1,
0.5586691, -0.4945803, 2.220745, 1, 1, 1, 1, 1,
0.5633009, -0.5543135, 3.383182, 1, 1, 1, 1, 1,
0.5707499, 1.434045, 0.5684326, 1, 1, 1, 1, 1,
0.5754925, -0.110763, 2.045717, 1, 1, 1, 1, 1,
0.5766959, 0.2786684, 0.9463437, 1, 1, 1, 1, 1,
0.5801603, -0.2034143, 2.088149, 1, 1, 1, 1, 1,
0.5805875, -0.7827172, 3.472639, 1, 1, 1, 1, 1,
0.5841298, 0.1539165, 1.793521, 1, 1, 1, 1, 1,
0.592984, -0.8073215, 3.442328, 0, 0, 1, 1, 1,
0.5950981, 0.7360264, 2.5232, 1, 0, 0, 1, 1,
0.6010917, 0.2887426, 1.814264, 1, 0, 0, 1, 1,
0.6027473, 0.7155043, 0.422265, 1, 0, 0, 1, 1,
0.6101271, 0.3163275, 0.1305337, 1, 0, 0, 1, 1,
0.6151296, 0.7266197, 0.6901942, 1, 0, 0, 1, 1,
0.616922, 0.7255992, 1.34559, 0, 0, 0, 1, 1,
0.6180171, 1.202506, 1.204501, 0, 0, 0, 1, 1,
0.6191965, 0.2954202, 2.008306, 0, 0, 0, 1, 1,
0.6213223, -0.3557311, 3.460226, 0, 0, 0, 1, 1,
0.6240911, -0.5012088, 3.820226, 0, 0, 0, 1, 1,
0.629331, -1.032622, -0.8151285, 0, 0, 0, 1, 1,
0.6349398, -1.55979, 1.915578, 0, 0, 0, 1, 1,
0.6437005, -1.049042, 3.70652, 1, 1, 1, 1, 1,
0.6457868, -1.243174, 3.054672, 1, 1, 1, 1, 1,
0.6480737, -0.8862523, 1.741268, 1, 1, 1, 1, 1,
0.6489066, 0.6749745, 1.317418, 1, 1, 1, 1, 1,
0.6545904, 0.008796245, 1.888451, 1, 1, 1, 1, 1,
0.6557322, 0.7746138, 1.575377, 1, 1, 1, 1, 1,
0.6577418, 0.7008932, 1.333752, 1, 1, 1, 1, 1,
0.6581194, 2.739268, -0.6029184, 1, 1, 1, 1, 1,
0.658566, -1.606872, 3.522146, 1, 1, 1, 1, 1,
0.6591251, 1.357878, 1.980683, 1, 1, 1, 1, 1,
0.6650796, 0.7341868, 0.28695, 1, 1, 1, 1, 1,
0.6654744, -0.9347699, 2.428386, 1, 1, 1, 1, 1,
0.6679282, -0.9312553, 3.578098, 1, 1, 1, 1, 1,
0.6686039, 1.526133, -0.3439393, 1, 1, 1, 1, 1,
0.6689045, 1.912918, 1.614807, 1, 1, 1, 1, 1,
0.6692697, 0.6397914, 2.453763, 0, 0, 1, 1, 1,
0.6742556, -2.290108, 2.914972, 1, 0, 0, 1, 1,
0.6743927, 0.9853035, 0.1988039, 1, 0, 0, 1, 1,
0.6773425, 0.09629866, 0.8367403, 1, 0, 0, 1, 1,
0.6794539, -0.04011633, 1.461626, 1, 0, 0, 1, 1,
0.6815173, 1.058239, -0.5801577, 1, 0, 0, 1, 1,
0.6832093, 2.158494, -0.615532, 0, 0, 0, 1, 1,
0.6882526, -0.05287614, 1.5477, 0, 0, 0, 1, 1,
0.6892484, 1.775605, 0.02090963, 0, 0, 0, 1, 1,
0.6973391, 0.5465589, 3.54711, 0, 0, 0, 1, 1,
0.7015165, 0.0872465, 2.173822, 0, 0, 0, 1, 1,
0.70484, -0.534973, 3.177511, 0, 0, 0, 1, 1,
0.7070169, -1.07966, 3.151581, 0, 0, 0, 1, 1,
0.7103866, -0.02812678, -0.3918307, 1, 1, 1, 1, 1,
0.7229363, -0.49843, 3.138202, 1, 1, 1, 1, 1,
0.7253418, 0.1871378, 2.101254, 1, 1, 1, 1, 1,
0.7261335, 0.7535832, 1.291613, 1, 1, 1, 1, 1,
0.7274133, -0.3086271, 1.431753, 1, 1, 1, 1, 1,
0.7284136, -0.7083989, 1.687839, 1, 1, 1, 1, 1,
0.729987, -0.6644762, 1.162573, 1, 1, 1, 1, 1,
0.7340204, -0.7428884, 1.521679, 1, 1, 1, 1, 1,
0.7344582, -0.1615118, 1.883723, 1, 1, 1, 1, 1,
0.7369245, -0.2869306, 1.995007, 1, 1, 1, 1, 1,
0.7532304, -0.6528481, 2.743512, 1, 1, 1, 1, 1,
0.7561268, -1.792898, 2.462086, 1, 1, 1, 1, 1,
0.7579725, 1.114104, -0.6646893, 1, 1, 1, 1, 1,
0.7585899, 0.2630122, 1.2766, 1, 1, 1, 1, 1,
0.761645, -0.05691382, -0.6813883, 1, 1, 1, 1, 1,
0.7657514, 1.225941, -1.022078, 0, 0, 1, 1, 1,
0.7798948, 0.09028149, 3.694862, 1, 0, 0, 1, 1,
0.7859715, 1.847317, -0.2787178, 1, 0, 0, 1, 1,
0.7974203, 0.8939956, 1.564089, 1, 0, 0, 1, 1,
0.8014432, -0.03996334, 1.227941, 1, 0, 0, 1, 1,
0.803098, -1.048946, 1.120512, 1, 0, 0, 1, 1,
0.8032461, 0.04843207, 2.821351, 0, 0, 0, 1, 1,
0.8094626, -1.508455, 3.199934, 0, 0, 0, 1, 1,
0.8108579, -0.06737975, 1.976952, 0, 0, 0, 1, 1,
0.8153561, 0.1456419, 2.318615, 0, 0, 0, 1, 1,
0.8201467, -1.137248, 1.204046, 0, 0, 0, 1, 1,
0.8224229, -1.016729, 3.130783, 0, 0, 0, 1, 1,
0.8259531, -0.2615167, 1.814966, 0, 0, 0, 1, 1,
0.8273582, -0.235021, 1.089565, 1, 1, 1, 1, 1,
0.8324262, 0.7044555, -0.2095855, 1, 1, 1, 1, 1,
0.8336555, -0.3091175, 1.88676, 1, 1, 1, 1, 1,
0.8345889, 0.1572437, 2.046167, 1, 1, 1, 1, 1,
0.8366834, -0.6766864, 1.660552, 1, 1, 1, 1, 1,
0.8370141, -0.001465537, 2.422682, 1, 1, 1, 1, 1,
0.8442, 1.18908, 1.976334, 1, 1, 1, 1, 1,
0.8545038, -0.5503594, 2.074429, 1, 1, 1, 1, 1,
0.8551866, -0.5190335, 0.6059651, 1, 1, 1, 1, 1,
0.8562483, -0.1756968, 1.890791, 1, 1, 1, 1, 1,
0.856859, -1.59556, 1.83369, 1, 1, 1, 1, 1,
0.8574204, -1.235337, 3.623247, 1, 1, 1, 1, 1,
0.8600253, -0.366556, 1.551769, 1, 1, 1, 1, 1,
0.8670241, 1.083596, 0.7445999, 1, 1, 1, 1, 1,
0.8704056, 0.6195184, 0.6520234, 1, 1, 1, 1, 1,
0.8847551, 0.8066849, 0.4095922, 0, 0, 1, 1, 1,
0.8850685, 1.245821, -0.07168327, 1, 0, 0, 1, 1,
0.887129, -0.2101935, 3.264065, 1, 0, 0, 1, 1,
0.8873551, 0.3020477, 1.235584, 1, 0, 0, 1, 1,
0.8894026, -0.855495, 2.255075, 1, 0, 0, 1, 1,
0.8899841, 0.9783633, 1.185115, 1, 0, 0, 1, 1,
0.8929814, 0.02591028, 1.74283, 0, 0, 0, 1, 1,
0.907539, 0.8200721, 1.250797, 0, 0, 0, 1, 1,
0.9085495, 0.2710825, 1.654579, 0, 0, 0, 1, 1,
0.9107515, 2.293679, 0.5769236, 0, 0, 0, 1, 1,
0.9139088, 0.9615337, 1.349723, 0, 0, 0, 1, 1,
0.9151237, -1.368308, 4.415337, 0, 0, 0, 1, 1,
0.9204854, 0.48108, 0.5838228, 0, 0, 0, 1, 1,
0.9271321, 0.7312167, 2.414552, 1, 1, 1, 1, 1,
0.9319686, -0.08009048, 1.817105, 1, 1, 1, 1, 1,
0.9323494, 0.3699803, 0.329453, 1, 1, 1, 1, 1,
0.932591, -0.9816802, 3.828152, 1, 1, 1, 1, 1,
0.9333726, 0.5308418, 1.752048, 1, 1, 1, 1, 1,
0.9341503, 0.6825922, 1.004239, 1, 1, 1, 1, 1,
0.9378919, 1.083093, -0.8994594, 1, 1, 1, 1, 1,
0.9416957, -1.417953, 3.663113, 1, 1, 1, 1, 1,
0.9450351, 0.7803781, 1.978626, 1, 1, 1, 1, 1,
0.9517538, -1.634692, 2.330266, 1, 1, 1, 1, 1,
0.9591975, -1.559151, 2.084283, 1, 1, 1, 1, 1,
0.9627698, 1.195026, 0.8329494, 1, 1, 1, 1, 1,
0.962867, 0.4569244, 1.07793, 1, 1, 1, 1, 1,
0.9632685, -0.3051169, 1.834937, 1, 1, 1, 1, 1,
0.9786323, -1.770386, 2.838043, 1, 1, 1, 1, 1,
0.9847867, -1.17301, 0.03485469, 0, 0, 1, 1, 1,
0.9973873, 2.25194, -1.021734, 1, 0, 0, 1, 1,
0.9986801, -0.5932841, 4.335225, 1, 0, 0, 1, 1,
0.9996269, 1.375929, -0.3009388, 1, 0, 0, 1, 1,
1.00005, 1.698255, 0.6099424, 1, 0, 0, 1, 1,
1.001437, 1.739378, 0.2485852, 1, 0, 0, 1, 1,
1.003163, -0.4856965, 2.92868, 0, 0, 0, 1, 1,
1.004129, -0.3862813, 0.7206395, 0, 0, 0, 1, 1,
1.00673, 0.0398253, 2.330626, 0, 0, 0, 1, 1,
1.009122, 1.009145, 2.275538, 0, 0, 0, 1, 1,
1.01111, 0.06138923, 2.159246, 0, 0, 0, 1, 1,
1.012305, 1.024158, 0.508933, 0, 0, 0, 1, 1,
1.018182, 0.5057458, 2.147943, 0, 0, 0, 1, 1,
1.021737, 0.5058278, 2.190209, 1, 1, 1, 1, 1,
1.021785, 2.259959, 1.567772, 1, 1, 1, 1, 1,
1.027705, 0.9987225, 1.410606, 1, 1, 1, 1, 1,
1.029927, 0.8911469, 2.663341, 1, 1, 1, 1, 1,
1.036387, -0.7011794, 0.6456448, 1, 1, 1, 1, 1,
1.038542, -0.4811213, 2.122605, 1, 1, 1, 1, 1,
1.04819, 0.4768503, 0.6225045, 1, 1, 1, 1, 1,
1.04837, -2.343884, 1.925231, 1, 1, 1, 1, 1,
1.049711, 1.56728, 0.7540226, 1, 1, 1, 1, 1,
1.053523, 0.901829, 1.201429, 1, 1, 1, 1, 1,
1.053604, 0.05434904, 2.810336, 1, 1, 1, 1, 1,
1.054287, 0.03311389, 0.09730821, 1, 1, 1, 1, 1,
1.055503, 0.9486098, 2.518087, 1, 1, 1, 1, 1,
1.057872, 0.507477, 1.637569, 1, 1, 1, 1, 1,
1.059773, 0.6918463, 2.150412, 1, 1, 1, 1, 1,
1.065088, -1.205784, 1.301872, 0, 0, 1, 1, 1,
1.068186, 1.178291, -0.3413457, 1, 0, 0, 1, 1,
1.070311, -0.7039942, 2.977427, 1, 0, 0, 1, 1,
1.071946, 0.7842451, 0.6117929, 1, 0, 0, 1, 1,
1.074481, 1.187222, 0.8493522, 1, 0, 0, 1, 1,
1.080036, 1.259555, 0.6742538, 1, 0, 0, 1, 1,
1.086469, 0.1808681, 0.4861474, 0, 0, 0, 1, 1,
1.08826, -0.915527, 1.250537, 0, 0, 0, 1, 1,
1.097504, 3.695059, 1.100402, 0, 0, 0, 1, 1,
1.103531, 0.5352653, -0.1264103, 0, 0, 0, 1, 1,
1.105265, -0.05444637, 2.780588, 0, 0, 0, 1, 1,
1.106676, -0.7184669, 2.708356, 0, 0, 0, 1, 1,
1.116243, 1.229442, 2.05003, 0, 0, 0, 1, 1,
1.117783, 0.2069309, 1.109375, 1, 1, 1, 1, 1,
1.120834, -0.2167902, 2.007423, 1, 1, 1, 1, 1,
1.12497, -0.788224, 3.057295, 1, 1, 1, 1, 1,
1.128163, -1.286846, 2.862841, 1, 1, 1, 1, 1,
1.128906, -0.5529124, 3.368235, 1, 1, 1, 1, 1,
1.131202, -0.4913561, 1.194691, 1, 1, 1, 1, 1,
1.131922, 0.5181752, -0.4729541, 1, 1, 1, 1, 1,
1.133241, 0.1839326, 2.387688, 1, 1, 1, 1, 1,
1.13475, -0.1652332, 0.7702607, 1, 1, 1, 1, 1,
1.138985, 1.047736, 1.258804, 1, 1, 1, 1, 1,
1.157715, -0.2065047, 1.765647, 1, 1, 1, 1, 1,
1.162994, -0.9681466, 3.705485, 1, 1, 1, 1, 1,
1.164962, 0.9432623, 2.63705, 1, 1, 1, 1, 1,
1.167889, -1.669401, 2.567232, 1, 1, 1, 1, 1,
1.168421, -2.402961, 2.579337, 1, 1, 1, 1, 1,
1.16852, 0.5484574, 3.953444, 0, 0, 1, 1, 1,
1.181581, 0.3368508, 1.855994, 1, 0, 0, 1, 1,
1.182507, -0.5382106, 3.815857, 1, 0, 0, 1, 1,
1.188521, 0.6193439, 0.5277256, 1, 0, 0, 1, 1,
1.197168, 0.6292129, 1.897509, 1, 0, 0, 1, 1,
1.202134, 0.2539359, 0.6302646, 1, 0, 0, 1, 1,
1.208885, -1.00908, 1.646783, 0, 0, 0, 1, 1,
1.212588, 1.732663, -1.269435, 0, 0, 0, 1, 1,
1.212645, -0.3017552, 0.8504102, 0, 0, 0, 1, 1,
1.215718, 0.2519172, 2.906722, 0, 0, 0, 1, 1,
1.222245, 1.115535, 0.5830805, 0, 0, 0, 1, 1,
1.225671, -1.049203, 4.074813, 0, 0, 0, 1, 1,
1.227786, -0.5230677, 3.605571, 0, 0, 0, 1, 1,
1.231665, 0.6772246, -0.7725778, 1, 1, 1, 1, 1,
1.232805, 2.617937, -1.083608, 1, 1, 1, 1, 1,
1.236335, -0.3311836, 2.840322, 1, 1, 1, 1, 1,
1.241531, 0.2084195, 0.2881542, 1, 1, 1, 1, 1,
1.244295, -0.2520702, 1.465361, 1, 1, 1, 1, 1,
1.247762, 0.9806542, 0.002151683, 1, 1, 1, 1, 1,
1.255665, 0.9336613, 1.931333, 1, 1, 1, 1, 1,
1.275025, 1.153602, -1.087895, 1, 1, 1, 1, 1,
1.275555, -0.0544639, 1.318038, 1, 1, 1, 1, 1,
1.287601, -1.983767, 1.160148, 1, 1, 1, 1, 1,
1.294661, -0.508526, 1.607375, 1, 1, 1, 1, 1,
1.296381, -0.5577618, 2.019521, 1, 1, 1, 1, 1,
1.30601, -0.2470907, 1.688103, 1, 1, 1, 1, 1,
1.306879, -0.4990732, 2.959556, 1, 1, 1, 1, 1,
1.311949, -0.6294699, 0.04919221, 1, 1, 1, 1, 1,
1.314071, -0.5706084, 3.70743, 0, 0, 1, 1, 1,
1.314805, -0.5942077, 0.3979179, 1, 0, 0, 1, 1,
1.321108, 1.10135, 1.609652, 1, 0, 0, 1, 1,
1.32433, 0.1122532, 2.971753, 1, 0, 0, 1, 1,
1.332956, 1.493194, -0.6117089, 1, 0, 0, 1, 1,
1.337297, -1.577687, 3.01128, 1, 0, 0, 1, 1,
1.344372, -0.116472, 2.576379, 0, 0, 0, 1, 1,
1.346187, 0.6430389, -0.1960731, 0, 0, 0, 1, 1,
1.349239, 1.048621, -0.3613428, 0, 0, 0, 1, 1,
1.350278, -0.203953, 2.103137, 0, 0, 0, 1, 1,
1.365208, 0.06295394, 2.857488, 0, 0, 0, 1, 1,
1.374576, -0.1641698, 0.6633147, 0, 0, 0, 1, 1,
1.375635, 1.206827, 1.376444, 0, 0, 0, 1, 1,
1.376619, 0.7026175, 0.9011578, 1, 1, 1, 1, 1,
1.380689, 0.3890737, 1.528295, 1, 1, 1, 1, 1,
1.383341, -0.656372, 2.978349, 1, 1, 1, 1, 1,
1.384475, 1.033954, 1.924671, 1, 1, 1, 1, 1,
1.408968, 0.645295, 0.7575461, 1, 1, 1, 1, 1,
1.43663, 0.2360295, 1.116814, 1, 1, 1, 1, 1,
1.441049, 0.4097547, 0.4524547, 1, 1, 1, 1, 1,
1.44891, -0.4605847, 2.018137, 1, 1, 1, 1, 1,
1.462449, -1.366815, 3.846098, 1, 1, 1, 1, 1,
1.463669, -0.8198172, 3.965487, 1, 1, 1, 1, 1,
1.467978, 0.4050719, 2.15262, 1, 1, 1, 1, 1,
1.472601, -0.9030853, 1.55629, 1, 1, 1, 1, 1,
1.473628, -0.1001707, 2.823287, 1, 1, 1, 1, 1,
1.483403, -1.339333, 2.166493, 1, 1, 1, 1, 1,
1.490449, -1.704202, 1.632961, 1, 1, 1, 1, 1,
1.508222, 1.010202, 0.9555305, 0, 0, 1, 1, 1,
1.53352, -0.7786523, 2.159685, 1, 0, 0, 1, 1,
1.54701, 0.931375, 0.5836682, 1, 0, 0, 1, 1,
1.559451, -0.2878477, 2.111742, 1, 0, 0, 1, 1,
1.563361, -0.4259179, 1.049985, 1, 0, 0, 1, 1,
1.566756, -1.149019, 1.152186, 1, 0, 0, 1, 1,
1.582672, -1.559956, 2.561943, 0, 0, 0, 1, 1,
1.584073, -0.4054456, 0.06564066, 0, 0, 0, 1, 1,
1.594091, -1.133694, 3.289129, 0, 0, 0, 1, 1,
1.601775, -2.137409, 1.944364, 0, 0, 0, 1, 1,
1.620835, -0.1480657, 2.537062, 0, 0, 0, 1, 1,
1.643732, 0.04306962, 1.184394, 0, 0, 0, 1, 1,
1.672005, -0.7580289, 0.01063334, 0, 0, 0, 1, 1,
1.678084, -0.8160612, 1.95012, 1, 1, 1, 1, 1,
1.693146, -0.2048079, 0.4835608, 1, 1, 1, 1, 1,
1.713765, 0.03886345, 2.053516, 1, 1, 1, 1, 1,
1.729966, 1.137469, 0.9521345, 1, 1, 1, 1, 1,
1.731459, 0.5865958, 0.07415557, 1, 1, 1, 1, 1,
1.752379, -0.351147, 1.134075, 1, 1, 1, 1, 1,
1.76972, 1.276158, 0.2500494, 1, 1, 1, 1, 1,
1.776458, -1.641408, 3.374604, 1, 1, 1, 1, 1,
1.785826, -0.6766426, 1.000874, 1, 1, 1, 1, 1,
1.785888, 1.542971, 0.5469698, 1, 1, 1, 1, 1,
1.790162, 0.7115536, 0.4647585, 1, 1, 1, 1, 1,
1.829436, -1.185446, 2.072638, 1, 1, 1, 1, 1,
1.855367, 0.3073444, 0.1244137, 1, 1, 1, 1, 1,
1.892143, -1.249338, 2.26589, 1, 1, 1, 1, 1,
1.900981, 0.5890175, -0.2275545, 1, 1, 1, 1, 1,
1.932032, 0.003006855, 0.9071819, 0, 0, 1, 1, 1,
1.936129, 1.184245, 0.9663019, 1, 0, 0, 1, 1,
1.961371, 0.9678689, -0.657232, 1, 0, 0, 1, 1,
1.996731, -2.391544, 0.6912693, 1, 0, 0, 1, 1,
2.020595, 0.9767357, 0.5521249, 1, 0, 0, 1, 1,
2.058717, -0.2103538, 3.074297, 1, 0, 0, 1, 1,
2.09165, 0.3585117, 0.2559999, 0, 0, 0, 1, 1,
2.162009, -0.8912562, 1.360837, 0, 0, 0, 1, 1,
2.162269, -2.834403, 4.278773, 0, 0, 0, 1, 1,
2.215536, -0.1464873, 1.294266, 0, 0, 0, 1, 1,
2.291896, 0.3109658, 1.471296, 0, 0, 0, 1, 1,
2.352303, 1.058712, 1.144717, 0, 0, 0, 1, 1,
2.406631, 0.5959277, 0.9703913, 0, 0, 0, 1, 1,
2.618142, -0.217085, 1.76896, 1, 1, 1, 1, 1,
2.620296, -0.2919179, 1.816753, 1, 1, 1, 1, 1,
2.744197, 0.1380394, -0.9968638, 1, 1, 1, 1, 1,
2.762461, -0.06169768, 1.509868, 1, 1, 1, 1, 1,
2.877745, 0.2010455, -0.9326647, 1, 1, 1, 1, 1,
2.913047, 2.595531, 3.3345, 1, 1, 1, 1, 1,
3.169563, -0.9850581, 2.560756, 1, 1, 1, 1, 1
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
var radius = 10.20126;
var distance = 35.83149;
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
mvMatrix.translate( 0.8184257, -0.363845, 0.1408646 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.83149);
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
