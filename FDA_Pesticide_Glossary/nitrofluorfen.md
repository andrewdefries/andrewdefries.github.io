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
-3.300524, 0.9100415, -2.98801, 1, 0, 0, 1,
-3.164851, -1.139798, -0.266709, 1, 0.007843138, 0, 1,
-3.076732, -0.695731, -1.257819, 1, 0.01176471, 0, 1,
-2.99791, -0.9376017, -2.180694, 1, 0.01960784, 0, 1,
-2.903206, 0.2203667, -1.406738, 1, 0.02352941, 0, 1,
-2.728938, -0.4336828, -2.582341, 1, 0.03137255, 0, 1,
-2.651289, -0.8552775, -2.435418, 1, 0.03529412, 0, 1,
-2.611812, -1.15968, -2.454121, 1, 0.04313726, 0, 1,
-2.575273, -2.023622, -1.449792, 1, 0.04705882, 0, 1,
-2.560237, -0.7779443, -1.222352, 1, 0.05490196, 0, 1,
-2.524451, 0.4062031, -2.245738, 1, 0.05882353, 0, 1,
-2.492749, -1.519726, -2.784472, 1, 0.06666667, 0, 1,
-2.45419, 0.7138142, -3.111833, 1, 0.07058824, 0, 1,
-2.362103, 0.7030416, -2.069209, 1, 0.07843138, 0, 1,
-2.326101, 1.079192, -1.338046, 1, 0.08235294, 0, 1,
-2.283386, -0.1517569, -2.054797, 1, 0.09019608, 0, 1,
-2.271174, 1.35485, -2.056512, 1, 0.09411765, 0, 1,
-2.232056, -0.8325401, -3.885668, 1, 0.1019608, 0, 1,
-2.229655, -1.413289, -2.010132, 1, 0.1098039, 0, 1,
-2.209924, 0.3580522, -1.728435, 1, 0.1137255, 0, 1,
-2.178116, -1.103636, -2.412239, 1, 0.1215686, 0, 1,
-2.167881, 0.44101, -3.743657, 1, 0.1254902, 0, 1,
-2.14853, 0.2690622, -1.245688, 1, 0.1333333, 0, 1,
-2.130463, -1.597113, -1.721808, 1, 0.1372549, 0, 1,
-2.122016, -0.7624797, -4.541539, 1, 0.145098, 0, 1,
-2.091928, 0.198596, -2.81236, 1, 0.1490196, 0, 1,
-2.083534, -0.6998614, -2.286721, 1, 0.1568628, 0, 1,
-2.0749, -0.5329244, -2.420225, 1, 0.1607843, 0, 1,
-2.054174, -0.183976, -2.248706, 1, 0.1686275, 0, 1,
-2.041249, 1.246895, -1.041619, 1, 0.172549, 0, 1,
-2.03984, -2.055058, -3.793977, 1, 0.1803922, 0, 1,
-2.028022, -0.1268378, -2.333927, 1, 0.1843137, 0, 1,
-1.960323, 0.6753196, -1.599346, 1, 0.1921569, 0, 1,
-1.960066, -1.487825, -1.791163, 1, 0.1960784, 0, 1,
-1.955507, 0.2010679, -1.180109, 1, 0.2039216, 0, 1,
-1.931809, -0.5010622, -0.8118036, 1, 0.2117647, 0, 1,
-1.93157, -0.3773781, -2.00618, 1, 0.2156863, 0, 1,
-1.89326, -0.04187912, -0.8625087, 1, 0.2235294, 0, 1,
-1.885577, -0.2896595, -0.8281289, 1, 0.227451, 0, 1,
-1.879518, -1.816528, -2.798907, 1, 0.2352941, 0, 1,
-1.869877, -0.2307391, -2.278223, 1, 0.2392157, 0, 1,
-1.847216, -0.1754767, -0.9844494, 1, 0.2470588, 0, 1,
-1.840477, -2.015499, -1.973226, 1, 0.2509804, 0, 1,
-1.83519, -0.7117874, -2.030864, 1, 0.2588235, 0, 1,
-1.807753, 1.457091, -2.321346, 1, 0.2627451, 0, 1,
-1.793396, -0.1877384, -2.581947, 1, 0.2705882, 0, 1,
-1.793159, -1.379766, -1.201239, 1, 0.2745098, 0, 1,
-1.79252, -1.350477, -1.834705, 1, 0.282353, 0, 1,
-1.766446, 0.3388646, -2.155114, 1, 0.2862745, 0, 1,
-1.764844, -0.8223692, -1.181899, 1, 0.2941177, 0, 1,
-1.758884, -0.4420922, -2.497011, 1, 0.3019608, 0, 1,
-1.752206, 1.681132, -1.080142, 1, 0.3058824, 0, 1,
-1.722295, -0.1868414, -0.9290842, 1, 0.3137255, 0, 1,
-1.706387, 0.09291453, -3.214777, 1, 0.3176471, 0, 1,
-1.689004, 0.02397924, -3.526808, 1, 0.3254902, 0, 1,
-1.688307, -1.344278, -1.605119, 1, 0.3294118, 0, 1,
-1.686913, -0.3575013, -2.07047, 1, 0.3372549, 0, 1,
-1.674412, -1.136674, -2.100473, 1, 0.3411765, 0, 1,
-1.650838, 1.491594, -1.611516, 1, 0.3490196, 0, 1,
-1.625315, 0.5854475, 0.2401384, 1, 0.3529412, 0, 1,
-1.62279, 0.01966767, -3.856379, 1, 0.3607843, 0, 1,
-1.612706, -0.2667388, -2.688509, 1, 0.3647059, 0, 1,
-1.599787, 0.261528, -1.213593, 1, 0.372549, 0, 1,
-1.583119, -0.4483917, -1.854697, 1, 0.3764706, 0, 1,
-1.58284, 0.8737534, 0.9758985, 1, 0.3843137, 0, 1,
-1.573394, -0.4084405, -2.880554, 1, 0.3882353, 0, 1,
-1.557377, -0.137321, -1.889969, 1, 0.3960784, 0, 1,
-1.551186, 0.2246955, -1.963225, 1, 0.4039216, 0, 1,
-1.546498, -0.0601482, -1.014574, 1, 0.4078431, 0, 1,
-1.532187, 0.3466513, -2.796917, 1, 0.4156863, 0, 1,
-1.527812, -0.1306312, -2.082672, 1, 0.4196078, 0, 1,
-1.520932, -0.8408312, -2.710246, 1, 0.427451, 0, 1,
-1.515627, -0.2228844, -2.020633, 1, 0.4313726, 0, 1,
-1.508104, 1.252444, -2.108845, 1, 0.4392157, 0, 1,
-1.500706, -0.1738456, 0.0006147448, 1, 0.4431373, 0, 1,
-1.49522, 0.3307077, -1.156748, 1, 0.4509804, 0, 1,
-1.487737, -0.1515992, -0.8813986, 1, 0.454902, 0, 1,
-1.482188, 0.9954125, -2.805258, 1, 0.4627451, 0, 1,
-1.464252, 0.3600954, -2.020183, 1, 0.4666667, 0, 1,
-1.457316, 0.6851385, -1.047265, 1, 0.4745098, 0, 1,
-1.451651, -0.1636147, -1.801751, 1, 0.4784314, 0, 1,
-1.447526, 2.114101, -0.03756281, 1, 0.4862745, 0, 1,
-1.44043, -0.8066732, -3.287384, 1, 0.4901961, 0, 1,
-1.420357, 0.04964944, -3.278653, 1, 0.4980392, 0, 1,
-1.405315, -0.5690665, -2.510295, 1, 0.5058824, 0, 1,
-1.402582, -0.6268444, -1.046803, 1, 0.509804, 0, 1,
-1.400893, -0.5023998, 0.111251, 1, 0.5176471, 0, 1,
-1.393491, -1.865789, -2.813624, 1, 0.5215687, 0, 1,
-1.387221, 0.2396465, -0.9145117, 1, 0.5294118, 0, 1,
-1.384282, -0.7560629, -0.9662211, 1, 0.5333334, 0, 1,
-1.37268, -0.4550377, -2.64676, 1, 0.5411765, 0, 1,
-1.363153, 0.004187935, -1.568928, 1, 0.5450981, 0, 1,
-1.359789, -1.356691, -4.211125, 1, 0.5529412, 0, 1,
-1.351089, 0.4981608, -4.064039, 1, 0.5568628, 0, 1,
-1.335135, -0.8649325, -3.078518, 1, 0.5647059, 0, 1,
-1.330922, -1.140268, -2.52886, 1, 0.5686275, 0, 1,
-1.311882, 0.4961013, -1.405408, 1, 0.5764706, 0, 1,
-1.309007, 1.033258, -0.8417065, 1, 0.5803922, 0, 1,
-1.302629, -0.5787481, -2.04069, 1, 0.5882353, 0, 1,
-1.297651, 0.4126585, -1.235565, 1, 0.5921569, 0, 1,
-1.269325, 0.5935896, 0.1110578, 1, 0.6, 0, 1,
-1.269246, 1.136689, -2.238881, 1, 0.6078432, 0, 1,
-1.242778, -1.350443, -2.270127, 1, 0.6117647, 0, 1,
-1.216684, 0.06049805, -1.727341, 1, 0.6196079, 0, 1,
-1.21493, -0.05019744, -3.658871, 1, 0.6235294, 0, 1,
-1.211492, 0.6863444, -1.023347, 1, 0.6313726, 0, 1,
-1.195413, 1.965271, -2.486215, 1, 0.6352941, 0, 1,
-1.19365, 0.7863045, -1.931122, 1, 0.6431373, 0, 1,
-1.190776, -0.2110905, -2.17104, 1, 0.6470588, 0, 1,
-1.173321, -0.468368, -1.715446, 1, 0.654902, 0, 1,
-1.156414, 0.6862299, -1.228741, 1, 0.6588235, 0, 1,
-1.153239, 0.2202774, -0.8136738, 1, 0.6666667, 0, 1,
-1.150114, -1.647135, -1.188006, 1, 0.6705883, 0, 1,
-1.139314, 0.4895317, -0.9038619, 1, 0.6784314, 0, 1,
-1.137286, 0.567425, -0.1845204, 1, 0.682353, 0, 1,
-1.135353, -0.6738897, -1.095805, 1, 0.6901961, 0, 1,
-1.135134, 0.3964094, -1.631481, 1, 0.6941177, 0, 1,
-1.134459, -1.009119, -3.767309, 1, 0.7019608, 0, 1,
-1.13264, 0.3327733, -0.6224068, 1, 0.7098039, 0, 1,
-1.131399, 0.4826461, -1.156854, 1, 0.7137255, 0, 1,
-1.126976, -0.07404552, -2.369477, 1, 0.7215686, 0, 1,
-1.125675, -0.6161661, -1.677513, 1, 0.7254902, 0, 1,
-1.117475, 2.533168, -0.4368892, 1, 0.7333333, 0, 1,
-1.113959, 0.1491997, -1.12607, 1, 0.7372549, 0, 1,
-1.111715, -1.372543, -3.895197, 1, 0.7450981, 0, 1,
-1.109288, 0.03378176, -1.678599, 1, 0.7490196, 0, 1,
-1.105591, -0.1743283, -1.352401, 1, 0.7568628, 0, 1,
-1.084719, -0.03025209, -0.8018669, 1, 0.7607843, 0, 1,
-1.07804, 1.258525, 0.6916696, 1, 0.7686275, 0, 1,
-1.072857, 0.7009889, -0.7522697, 1, 0.772549, 0, 1,
-1.065905, 1.443519, -0.6456702, 1, 0.7803922, 0, 1,
-1.062795, 0.290914, -0.4299821, 1, 0.7843137, 0, 1,
-1.060342, 0.827217, -1.696271, 1, 0.7921569, 0, 1,
-1.059805, -0.7398161, -1.413471, 1, 0.7960784, 0, 1,
-1.058869, -0.5835522, -1.742424, 1, 0.8039216, 0, 1,
-1.05438, -0.4656609, -2.339736, 1, 0.8117647, 0, 1,
-1.044602, 1.589523, 0.05504351, 1, 0.8156863, 0, 1,
-1.04027, 0.2594886, -2.038446, 1, 0.8235294, 0, 1,
-1.040002, -1.620134, -2.776463, 1, 0.827451, 0, 1,
-1.031675, -0.3094381, -2.982517, 1, 0.8352941, 0, 1,
-1.022401, 2.177811, -0.1557334, 1, 0.8392157, 0, 1,
-1.019797, -1.62361, -4.062694, 1, 0.8470588, 0, 1,
-1.019064, -0.3945573, -1.275074, 1, 0.8509804, 0, 1,
-1.00574, -0.6816624, -2.715283, 1, 0.8588235, 0, 1,
-0.993053, -0.68718, -2.356195, 1, 0.8627451, 0, 1,
-0.9899078, 1.097424, -0.8934793, 1, 0.8705882, 0, 1,
-0.9866747, -0.5946886, -2.790892, 1, 0.8745098, 0, 1,
-0.9742527, -1.003726, -1.030286, 1, 0.8823529, 0, 1,
-0.9732443, -0.1212274, -0.2189607, 1, 0.8862745, 0, 1,
-0.9723746, -2.896248, -2.661735, 1, 0.8941177, 0, 1,
-0.9714818, -0.8203121, -1.995025, 1, 0.8980392, 0, 1,
-0.9671425, 0.3365981, -2.451125, 1, 0.9058824, 0, 1,
-0.9582421, -0.2224939, -1.641395, 1, 0.9137255, 0, 1,
-0.9467725, 1.025113, -1.43756, 1, 0.9176471, 0, 1,
-0.946493, 1.756686, -1.020673, 1, 0.9254902, 0, 1,
-0.9395548, -0.3112923, -2.082693, 1, 0.9294118, 0, 1,
-0.9394862, 2.474019, 1.230944, 1, 0.9372549, 0, 1,
-0.936167, 0.737848, 0.1739936, 1, 0.9411765, 0, 1,
-0.9332013, 0.1551136, -0.286445, 1, 0.9490196, 0, 1,
-0.930967, -0.8853539, -3.111336, 1, 0.9529412, 0, 1,
-0.9173388, -1.305207, -2.383917, 1, 0.9607843, 0, 1,
-0.9167538, 0.530367, -0.4621916, 1, 0.9647059, 0, 1,
-0.9165617, -1.903487, -2.463696, 1, 0.972549, 0, 1,
-0.9162627, 1.936968, -0.01185144, 1, 0.9764706, 0, 1,
-0.9154425, 1.35356, -0.5250461, 1, 0.9843137, 0, 1,
-0.9079058, -1.118025, -1.872922, 1, 0.9882353, 0, 1,
-0.9037802, 1.616099, -0.7005727, 1, 0.9960784, 0, 1,
-0.8979942, 0.1970281, -1.866449, 0.9960784, 1, 0, 1,
-0.8927149, -0.3117912, -2.93695, 0.9921569, 1, 0, 1,
-0.8892644, -0.3505098, -2.383469, 0.9843137, 1, 0, 1,
-0.8872645, 0.7808252, -1.642989, 0.9803922, 1, 0, 1,
-0.8848292, -1.817371, -2.51891, 0.972549, 1, 0, 1,
-0.8836268, 1.147168, -0.7726889, 0.9686275, 1, 0, 1,
-0.8798196, 1.199501, -0.7520671, 0.9607843, 1, 0, 1,
-0.8768901, -0.367148, -0.702051, 0.9568627, 1, 0, 1,
-0.8767219, 0.7214966, -0.7775172, 0.9490196, 1, 0, 1,
-0.8749911, 0.2043095, -1.156421, 0.945098, 1, 0, 1,
-0.8681962, 0.428825, -0.8902479, 0.9372549, 1, 0, 1,
-0.8649029, -2.095683, -4.193452, 0.9333333, 1, 0, 1,
-0.8590728, -1.337062, -1.095187, 0.9254902, 1, 0, 1,
-0.85514, -1.692204, -2.670224, 0.9215686, 1, 0, 1,
-0.85201, -0.03919671, -2.177031, 0.9137255, 1, 0, 1,
-0.8500916, -2.551507, -1.503794, 0.9098039, 1, 0, 1,
-0.8465288, 1.398628, -0.8714138, 0.9019608, 1, 0, 1,
-0.8454526, 1.168171, 1.202973, 0.8941177, 1, 0, 1,
-0.8358029, -0.8447192, -1.666904, 0.8901961, 1, 0, 1,
-0.8326023, -0.2051967, -3.605954, 0.8823529, 1, 0, 1,
-0.8235142, -1.801592, -4.107953, 0.8784314, 1, 0, 1,
-0.8215162, -0.6615914, -1.616056, 0.8705882, 1, 0, 1,
-0.8157102, 0.476834, -1.965734, 0.8666667, 1, 0, 1,
-0.8134884, 0.1186639, -0.9479836, 0.8588235, 1, 0, 1,
-0.8112137, 1.462297, -0.6224956, 0.854902, 1, 0, 1,
-0.8098372, -0.4938785, -2.767007, 0.8470588, 1, 0, 1,
-0.8012081, 0.1735346, -2.034101, 0.8431373, 1, 0, 1,
-0.7989081, 1.144463, -2.285675, 0.8352941, 1, 0, 1,
-0.7981792, -1.257821, -0.9653634, 0.8313726, 1, 0, 1,
-0.7956876, 0.4123863, 0.2300492, 0.8235294, 1, 0, 1,
-0.7921623, 0.6121265, 0.1889013, 0.8196079, 1, 0, 1,
-0.7847656, -1.309661, -3.140259, 0.8117647, 1, 0, 1,
-0.7841731, 0.2378158, -0.6528711, 0.8078431, 1, 0, 1,
-0.7838306, 1.134838, -1.051922, 0.8, 1, 0, 1,
-0.7795426, -1.8144, -3.781, 0.7921569, 1, 0, 1,
-0.7731112, 0.6886015, -2.745793, 0.7882353, 1, 0, 1,
-0.7667226, 2.602221, 0.228001, 0.7803922, 1, 0, 1,
-0.7659395, 0.7016822, -0.1826673, 0.7764706, 1, 0, 1,
-0.7625531, 0.6219094, -0.4936621, 0.7686275, 1, 0, 1,
-0.7494172, 0.7930618, -1.563657, 0.7647059, 1, 0, 1,
-0.7485805, -0.4141858, -3.588413, 0.7568628, 1, 0, 1,
-0.7481355, 1.013658, 0.2618154, 0.7529412, 1, 0, 1,
-0.7470324, -0.06379002, -1.59266, 0.7450981, 1, 0, 1,
-0.7396539, -0.1315428, -2.072089, 0.7411765, 1, 0, 1,
-0.7324345, -0.1336839, -1.430445, 0.7333333, 1, 0, 1,
-0.7312846, 1.285899, -0.9425963, 0.7294118, 1, 0, 1,
-0.7252795, 0.6012543, -2.444571, 0.7215686, 1, 0, 1,
-0.7234175, -0.2562253, -2.362968, 0.7176471, 1, 0, 1,
-0.7210976, -0.6043875, -1.186899, 0.7098039, 1, 0, 1,
-0.7206989, -0.0643545, -2.187317, 0.7058824, 1, 0, 1,
-0.7185461, -0.6394693, -2.55758, 0.6980392, 1, 0, 1,
-0.7170224, -1.170354, -2.92987, 0.6901961, 1, 0, 1,
-0.7160505, -0.568256, -1.358036, 0.6862745, 1, 0, 1,
-0.7129024, -0.3684138, -2.212256, 0.6784314, 1, 0, 1,
-0.7105793, 0.9464492, -0.4082858, 0.6745098, 1, 0, 1,
-0.7090743, 0.8061742, -1.492757, 0.6666667, 1, 0, 1,
-0.7082171, -0.4008089, -0.3417109, 0.6627451, 1, 0, 1,
-0.7026583, 0.9861061, 0.490602, 0.654902, 1, 0, 1,
-0.7019203, -0.3444597, -2.74518, 0.6509804, 1, 0, 1,
-0.7013675, 0.6797509, -1.682219, 0.6431373, 1, 0, 1,
-0.6969504, -0.1526739, -2.479907, 0.6392157, 1, 0, 1,
-0.6944069, -1.431538, -2.271958, 0.6313726, 1, 0, 1,
-0.6938992, 0.805096, 0.007886718, 0.627451, 1, 0, 1,
-0.6933426, 0.3421682, -0.4053533, 0.6196079, 1, 0, 1,
-0.685811, -1.410395, -2.27223, 0.6156863, 1, 0, 1,
-0.6849012, 0.8985853, -0.9094608, 0.6078432, 1, 0, 1,
-0.6845135, 0.2302976, 0.06372076, 0.6039216, 1, 0, 1,
-0.6813675, 0.5922401, -1.558316, 0.5960785, 1, 0, 1,
-0.6796684, -0.940436, -1.133305, 0.5882353, 1, 0, 1,
-0.6770563, 1.160148, -0.3135305, 0.5843138, 1, 0, 1,
-0.676055, -0.1243268, -1.775376, 0.5764706, 1, 0, 1,
-0.6725401, -0.2233916, -1.562767, 0.572549, 1, 0, 1,
-0.6672788, -0.9193164, -1.855799, 0.5647059, 1, 0, 1,
-0.6670189, -0.5829222, -3.621926, 0.5607843, 1, 0, 1,
-0.6550471, -0.8558791, -2.149143, 0.5529412, 1, 0, 1,
-0.6545097, -1.639145, -1.315437, 0.5490196, 1, 0, 1,
-0.6543033, -0.8249428, -1.997775, 0.5411765, 1, 0, 1,
-0.6531658, -0.1296649, -0.8071273, 0.5372549, 1, 0, 1,
-0.6511981, 1.200659, -0.7634694, 0.5294118, 1, 0, 1,
-0.6502304, -0.2900841, -2.519803, 0.5254902, 1, 0, 1,
-0.6484724, -1.704831, -3.701973, 0.5176471, 1, 0, 1,
-0.647934, 0.3425509, -1.886327, 0.5137255, 1, 0, 1,
-0.6465728, -0.1830876, -2.357037, 0.5058824, 1, 0, 1,
-0.6461684, -0.160761, -3.442822, 0.5019608, 1, 0, 1,
-0.6442929, 0.8959292, -2.417101, 0.4941176, 1, 0, 1,
-0.6432907, -0.440291, -3.21711, 0.4862745, 1, 0, 1,
-0.6396868, 0.6840954, 0.1812214, 0.4823529, 1, 0, 1,
-0.6322191, 0.2873499, -2.545478, 0.4745098, 1, 0, 1,
-0.6233649, 0.02577618, -1.21235, 0.4705882, 1, 0, 1,
-0.6227213, 0.9444495, -1.06291, 0.4627451, 1, 0, 1,
-0.6222473, 1.349365, -2.047929, 0.4588235, 1, 0, 1,
-0.6196042, 1.522073, -0.1993722, 0.4509804, 1, 0, 1,
-0.6154757, -0.4175991, -3.043954, 0.4470588, 1, 0, 1,
-0.6119723, -0.404784, -2.105514, 0.4392157, 1, 0, 1,
-0.6116726, 0.5267172, 0.618089, 0.4352941, 1, 0, 1,
-0.6108892, 0.2802809, -2.304809, 0.427451, 1, 0, 1,
-0.6084841, 0.04307412, -0.9019729, 0.4235294, 1, 0, 1,
-0.6028321, -1.184019, -4.122342, 0.4156863, 1, 0, 1,
-0.6023946, -0.008728852, -2.552555, 0.4117647, 1, 0, 1,
-0.6016759, -0.3870826, -1.568685, 0.4039216, 1, 0, 1,
-0.5983151, -1.113506, -2.874101, 0.3960784, 1, 0, 1,
-0.5970564, -0.789223, -0.8321769, 0.3921569, 1, 0, 1,
-0.5961757, -1.112982, -0.1841849, 0.3843137, 1, 0, 1,
-0.5955768, -0.05385578, -2.029737, 0.3803922, 1, 0, 1,
-0.5953491, 0.3026855, -0.9740535, 0.372549, 1, 0, 1,
-0.5892749, -0.3172474, -3.490468, 0.3686275, 1, 0, 1,
-0.5853794, -1.434141, -3.482028, 0.3607843, 1, 0, 1,
-0.5850415, 0.2973222, -1.234583, 0.3568628, 1, 0, 1,
-0.5807801, -0.4599679, -2.718554, 0.3490196, 1, 0, 1,
-0.5806275, 1.247694, -2.276368, 0.345098, 1, 0, 1,
-0.5798327, 0.8705176, 0.8968052, 0.3372549, 1, 0, 1,
-0.5770817, 0.430646, 0.02206033, 0.3333333, 1, 0, 1,
-0.5751833, 0.08384389, -0.2347771, 0.3254902, 1, 0, 1,
-0.5687101, 1.550452, 0.5602143, 0.3215686, 1, 0, 1,
-0.5684108, -1.410252, -3.984408, 0.3137255, 1, 0, 1,
-0.5670083, 1.795072, -0.2665642, 0.3098039, 1, 0, 1,
-0.5641068, -1.641446, -2.473277, 0.3019608, 1, 0, 1,
-0.560268, 0.1391938, -2.525788, 0.2941177, 1, 0, 1,
-0.5585549, -1.003005, -4.811028, 0.2901961, 1, 0, 1,
-0.5584862, -0.2059612, -1.200578, 0.282353, 1, 0, 1,
-0.5576754, -0.4945225, -2.492005, 0.2784314, 1, 0, 1,
-0.5558453, -0.3683258, -2.015675, 0.2705882, 1, 0, 1,
-0.5557849, -1.797722, -3.190033, 0.2666667, 1, 0, 1,
-0.554309, -1.649436, -2.142928, 0.2588235, 1, 0, 1,
-0.5540996, -0.8445741, -3.423573, 0.254902, 1, 0, 1,
-0.5505317, 1.179336, 0.7294272, 0.2470588, 1, 0, 1,
-0.5471593, -0.3389064, -2.630657, 0.2431373, 1, 0, 1,
-0.5459421, -0.9580339, -2.123081, 0.2352941, 1, 0, 1,
-0.5441297, -1.997806, -3.111711, 0.2313726, 1, 0, 1,
-0.5424696, 0.3317831, -1.328037, 0.2235294, 1, 0, 1,
-0.5410517, 0.3956291, 0.6907001, 0.2196078, 1, 0, 1,
-0.5341718, 0.005526951, -2.423311, 0.2117647, 1, 0, 1,
-0.5324231, -0.6161395, -3.482948, 0.2078431, 1, 0, 1,
-0.5252955, 0.8995743, -0.04175472, 0.2, 1, 0, 1,
-0.5242395, -1.363809, -2.195954, 0.1921569, 1, 0, 1,
-0.5204196, 0.668144, -2.023958, 0.1882353, 1, 0, 1,
-0.5190156, -0.4727839, -1.94209, 0.1803922, 1, 0, 1,
-0.5179923, -1.003376, -3.357514, 0.1764706, 1, 0, 1,
-0.5156168, 1.21617, 0.9813024, 0.1686275, 1, 0, 1,
-0.5145981, -0.1324178, -1.752686, 0.1647059, 1, 0, 1,
-0.5116583, 0.2682222, -0.4644921, 0.1568628, 1, 0, 1,
-0.5092599, -0.09591883, -1.892506, 0.1529412, 1, 0, 1,
-0.5075466, 0.4166462, -1.398271, 0.145098, 1, 0, 1,
-0.5026919, 0.1350155, -1.283304, 0.1411765, 1, 0, 1,
-0.4960448, -1.149021, -1.615188, 0.1333333, 1, 0, 1,
-0.4957068, -0.4753838, -2.102693, 0.1294118, 1, 0, 1,
-0.4906496, -0.442133, -1.582656, 0.1215686, 1, 0, 1,
-0.4906075, -0.2656318, 0.9294759, 0.1176471, 1, 0, 1,
-0.4883415, -1.03016, -1.159388, 0.1098039, 1, 0, 1,
-0.4865526, 2.402554, 0.454631, 0.1058824, 1, 0, 1,
-0.4834892, 0.3727745, 0.04440087, 0.09803922, 1, 0, 1,
-0.4834579, 0.7861978, -0.1311806, 0.09019608, 1, 0, 1,
-0.4791115, 0.07906855, -2.040224, 0.08627451, 1, 0, 1,
-0.4732467, -1.352729, -5.206453, 0.07843138, 1, 0, 1,
-0.4721475, -0.08026259, -2.329102, 0.07450981, 1, 0, 1,
-0.4720246, -1.141744, -2.83442, 0.06666667, 1, 0, 1,
-0.4588388, 0.1852016, -0.9269873, 0.0627451, 1, 0, 1,
-0.4471985, 1.250322, -1.504904, 0.05490196, 1, 0, 1,
-0.4440601, -0.3945827, -1.851282, 0.05098039, 1, 0, 1,
-0.4428885, -0.4207976, -1.607093, 0.04313726, 1, 0, 1,
-0.4339889, 0.4169139, -0.3408049, 0.03921569, 1, 0, 1,
-0.4274876, 0.06063188, -1.175933, 0.03137255, 1, 0, 1,
-0.4262544, 0.1099817, 0.3489691, 0.02745098, 1, 0, 1,
-0.4254586, -0.4460772, -2.382757, 0.01960784, 1, 0, 1,
-0.4227613, -0.07540847, -2.826696, 0.01568628, 1, 0, 1,
-0.4210621, -1.073804, -3.231145, 0.007843138, 1, 0, 1,
-0.417097, -1.016965, -2.748331, 0.003921569, 1, 0, 1,
-0.4141338, -0.301762, -2.775749, 0, 1, 0.003921569, 1,
-0.4123015, -0.9063281, -2.847812, 0, 1, 0.01176471, 1,
-0.4089507, -1.416041, -3.141385, 0, 1, 0.01568628, 1,
-0.4061994, 0.7570695, -1.338192, 0, 1, 0.02352941, 1,
-0.4042791, -0.5110796, -3.186384, 0, 1, 0.02745098, 1,
-0.4035291, 0.1466436, -1.416491, 0, 1, 0.03529412, 1,
-0.401176, -0.2743241, -3.552802, 0, 1, 0.03921569, 1,
-0.3988653, 0.5928941, -2.018516, 0, 1, 0.04705882, 1,
-0.3960775, -0.6149471, -0.8621475, 0, 1, 0.05098039, 1,
-0.3947261, -0.1281637, -1.609676, 0, 1, 0.05882353, 1,
-0.3941385, -0.8030336, -2.805727, 0, 1, 0.0627451, 1,
-0.3853852, -0.680777, -3.242541, 0, 1, 0.07058824, 1,
-0.3850817, 0.6155975, -0.4061573, 0, 1, 0.07450981, 1,
-0.3832685, 0.04750652, -0.2214692, 0, 1, 0.08235294, 1,
-0.3822891, 0.9802017, -0.4550103, 0, 1, 0.08627451, 1,
-0.3804637, -0.555127, -2.6118, 0, 1, 0.09411765, 1,
-0.3785279, 0.318616, -1.560418, 0, 1, 0.1019608, 1,
-0.378184, -2.857977, -3.081316, 0, 1, 0.1058824, 1,
-0.3769763, 2.027561, -2.074637, 0, 1, 0.1137255, 1,
-0.37228, 0.3539769, -1.017603, 0, 1, 0.1176471, 1,
-0.368678, -0.3022594, 0.2311884, 0, 1, 0.1254902, 1,
-0.3651008, -2.207004, -3.153158, 0, 1, 0.1294118, 1,
-0.360562, -0.4868108, -2.756733, 0, 1, 0.1372549, 1,
-0.3597885, 0.3143049, -0.7208589, 0, 1, 0.1411765, 1,
-0.3584533, 0.1569282, -1.491285, 0, 1, 0.1490196, 1,
-0.357271, 0.5693235, -2.377776, 0, 1, 0.1529412, 1,
-0.3552345, 1.043624, -1.211795, 0, 1, 0.1607843, 1,
-0.3508441, -0.4929451, -4.063585, 0, 1, 0.1647059, 1,
-0.3486381, 0.3315655, -1.852445, 0, 1, 0.172549, 1,
-0.3460571, -1.230416, -1.842699, 0, 1, 0.1764706, 1,
-0.3451987, -0.3989921, -2.476679, 0, 1, 0.1843137, 1,
-0.3406587, -1.402613, -4.9215, 0, 1, 0.1882353, 1,
-0.3384063, -0.781949, -2.189641, 0, 1, 0.1960784, 1,
-0.3377103, -1.543433, -1.9535, 0, 1, 0.2039216, 1,
-0.3369691, -1.270472, -4.072361, 0, 1, 0.2078431, 1,
-0.334285, 1.761504, 0.060963, 0, 1, 0.2156863, 1,
-0.3320827, 0.8860752, 0.1574705, 0, 1, 0.2196078, 1,
-0.3318966, -0.3614951, -1.830545, 0, 1, 0.227451, 1,
-0.3268557, -1.075036, -2.198091, 0, 1, 0.2313726, 1,
-0.3233413, 0.1982016, -0.1020839, 0, 1, 0.2392157, 1,
-0.3225446, -1.315933, -4.039073, 0, 1, 0.2431373, 1,
-0.3203813, -0.3218002, -4.027794, 0, 1, 0.2509804, 1,
-0.3191145, 1.073755, -1.127375, 0, 1, 0.254902, 1,
-0.3181308, -0.9579289, -1.768411, 0, 1, 0.2627451, 1,
-0.3160086, 2.026034, -1.962437, 0, 1, 0.2666667, 1,
-0.3142914, -1.057945, -3.727449, 0, 1, 0.2745098, 1,
-0.3125011, 1.274013, 0.9965267, 0, 1, 0.2784314, 1,
-0.3089605, -0.3493115, -1.924715, 0, 1, 0.2862745, 1,
-0.3047088, 0.5141463, 0.6432077, 0, 1, 0.2901961, 1,
-0.3040874, 1.623276, 0.7253758, 0, 1, 0.2980392, 1,
-0.3015954, -1.507798, -0.3722453, 0, 1, 0.3058824, 1,
-0.30096, 0.9827125, -1.286898, 0, 1, 0.3098039, 1,
-0.2859253, -1.549012, -4.611569, 0, 1, 0.3176471, 1,
-0.2817709, 0.120269, -0.7331946, 0, 1, 0.3215686, 1,
-0.2798123, -1.969409, -1.944463, 0, 1, 0.3294118, 1,
-0.2759333, 0.2378207, -2.263347, 0, 1, 0.3333333, 1,
-0.2734765, 0.3467577, -1.556457, 0, 1, 0.3411765, 1,
-0.2688527, -0.2299015, -1.680123, 0, 1, 0.345098, 1,
-0.268648, -0.08270705, -1.390742, 0, 1, 0.3529412, 1,
-0.2680378, 0.6603925, -0.3181703, 0, 1, 0.3568628, 1,
-0.2648382, -0.9359795, -2.231325, 0, 1, 0.3647059, 1,
-0.2644214, -0.8283119, -3.385062, 0, 1, 0.3686275, 1,
-0.2625211, 0.8402253, 0.6940423, 0, 1, 0.3764706, 1,
-0.2601293, -0.6848797, -2.881427, 0, 1, 0.3803922, 1,
-0.2595022, 0.4108265, 0.517715, 0, 1, 0.3882353, 1,
-0.2556756, 1.14058, 1.602156, 0, 1, 0.3921569, 1,
-0.2530436, -1.09062, -2.925356, 0, 1, 0.4, 1,
-0.2493034, 0.01787112, -1.96858, 0, 1, 0.4078431, 1,
-0.2359363, 1.599807, 0.1085071, 0, 1, 0.4117647, 1,
-0.2347305, 0.3946176, -0.7517934, 0, 1, 0.4196078, 1,
-0.2314337, 0.8608413, 0.7050161, 0, 1, 0.4235294, 1,
-0.2271872, -0.4128311, -2.40927, 0, 1, 0.4313726, 1,
-0.2241408, 0.3752617, -1.420945, 0, 1, 0.4352941, 1,
-0.2237125, 0.2394227, -1.979604, 0, 1, 0.4431373, 1,
-0.2236675, 1.05663, -1.259833, 0, 1, 0.4470588, 1,
-0.2188139, 0.1422838, -1.412643, 0, 1, 0.454902, 1,
-0.2174194, -0.428542, -4.978671, 0, 1, 0.4588235, 1,
-0.2148704, -1.435956, -4.348985, 0, 1, 0.4666667, 1,
-0.2060221, -0.07562444, -4.367105, 0, 1, 0.4705882, 1,
-0.1965227, -0.4028488, -1.719729, 0, 1, 0.4784314, 1,
-0.1960585, 1.045463, -1.530766, 0, 1, 0.4823529, 1,
-0.1945182, 1.384922, 0.3680156, 0, 1, 0.4901961, 1,
-0.1928858, -0.2618799, -1.869637, 0, 1, 0.4941176, 1,
-0.1909103, 0.187171, -1.573017, 0, 1, 0.5019608, 1,
-0.1896812, -0.4522848, -3.777585, 0, 1, 0.509804, 1,
-0.1867637, 0.1398704, -2.453224, 0, 1, 0.5137255, 1,
-0.186472, -0.3861832, -2.740164, 0, 1, 0.5215687, 1,
-0.1863146, -0.1752394, -2.155681, 0, 1, 0.5254902, 1,
-0.1859615, -0.07339779, -0.8560765, 0, 1, 0.5333334, 1,
-0.1834185, 0.6023534, -0.4814053, 0, 1, 0.5372549, 1,
-0.1774506, -0.3610058, -2.323051, 0, 1, 0.5450981, 1,
-0.1761252, -1.532114, -3.796997, 0, 1, 0.5490196, 1,
-0.1731677, -0.1968844, -2.844039, 0, 1, 0.5568628, 1,
-0.1710298, 0.1429947, -0.532484, 0, 1, 0.5607843, 1,
-0.1706868, 1.132655, 0.4551846, 0, 1, 0.5686275, 1,
-0.1659372, 0.1780587, -1.857597, 0, 1, 0.572549, 1,
-0.1656774, -0.6758093, -2.729562, 0, 1, 0.5803922, 1,
-0.1626244, 0.8576924, 1.34771, 0, 1, 0.5843138, 1,
-0.156997, -0.3214565, -3.721899, 0, 1, 0.5921569, 1,
-0.1553967, 1.699382, -0.6226751, 0, 1, 0.5960785, 1,
-0.1548774, -1.066207, -3.437974, 0, 1, 0.6039216, 1,
-0.1547621, -1.151658, -3.107242, 0, 1, 0.6117647, 1,
-0.1532439, -0.6083568, -4.774592, 0, 1, 0.6156863, 1,
-0.1494863, -0.9678845, -3.837892, 0, 1, 0.6235294, 1,
-0.1430999, -0.7366505, -4.479656, 0, 1, 0.627451, 1,
-0.1420722, -0.09246229, -1.898566, 0, 1, 0.6352941, 1,
-0.1412407, -2.01508, -2.8032, 0, 1, 0.6392157, 1,
-0.1394536, -0.9318115, -1.883876, 0, 1, 0.6470588, 1,
-0.1335612, -1.200629, -2.496656, 0, 1, 0.6509804, 1,
-0.1324114, 0.4113612, -0.1217279, 0, 1, 0.6588235, 1,
-0.1312407, -0.2091985, -1.318406, 0, 1, 0.6627451, 1,
-0.1263583, 0.4004613, 0.3248509, 0, 1, 0.6705883, 1,
-0.1219806, -1.091337, -0.6165238, 0, 1, 0.6745098, 1,
-0.1219579, 0.6384692, 0.1630842, 0, 1, 0.682353, 1,
-0.1188837, 1.602515, -1.509797, 0, 1, 0.6862745, 1,
-0.1187048, 1.044689, 0.3455873, 0, 1, 0.6941177, 1,
-0.117737, -1.147457, -4.059936, 0, 1, 0.7019608, 1,
-0.1172343, 1.456868, -0.8893992, 0, 1, 0.7058824, 1,
-0.1113004, 0.4702654, 0.2900456, 0, 1, 0.7137255, 1,
-0.1103899, 2.175342, 0.3105277, 0, 1, 0.7176471, 1,
-0.104406, 0.5138531, 1.248729, 0, 1, 0.7254902, 1,
-0.1017278, -0.5037337, -3.749269, 0, 1, 0.7294118, 1,
-0.1014964, -0.3698999, -3.923971, 0, 1, 0.7372549, 1,
-0.0998313, 0.06058091, -1.293883, 0, 1, 0.7411765, 1,
-0.09747457, -0.9381227, -2.722319, 0, 1, 0.7490196, 1,
-0.09740932, -2.237583, -4.810557, 0, 1, 0.7529412, 1,
-0.09732238, 0.4289316, 1.28984, 0, 1, 0.7607843, 1,
-0.09508656, -0.7166768, -2.542867, 0, 1, 0.7647059, 1,
-0.0931539, 0.3824954, 0.2967716, 0, 1, 0.772549, 1,
-0.09180653, -0.01155028, -0.3430312, 0, 1, 0.7764706, 1,
-0.08980714, -0.4210477, -2.158839, 0, 1, 0.7843137, 1,
-0.08961976, 0.8546495, 0.03082785, 0, 1, 0.7882353, 1,
-0.08893692, -0.1667456, -1.855571, 0, 1, 0.7960784, 1,
-0.08697509, -1.21856, -1.919847, 0, 1, 0.8039216, 1,
-0.08298471, 0.09313002, -0.7197418, 0, 1, 0.8078431, 1,
-0.07490095, 0.1548301, -0.07874195, 0, 1, 0.8156863, 1,
-0.07362259, 1.012263, -1.94881, 0, 1, 0.8196079, 1,
-0.07355957, 1.0707, 0.1461459, 0, 1, 0.827451, 1,
-0.06910864, -1.432593, -4.762057, 0, 1, 0.8313726, 1,
-0.06685713, 0.04967163, -0.6135637, 0, 1, 0.8392157, 1,
-0.06383424, -0.6397979, -1.935974, 0, 1, 0.8431373, 1,
-0.06250518, -1.332171, -3.515031, 0, 1, 0.8509804, 1,
-0.06025471, -1.619824, -2.976574, 0, 1, 0.854902, 1,
-0.05415755, -0.3766262, -1.709913, 0, 1, 0.8627451, 1,
-0.05310511, -0.01416214, -1.133795, 0, 1, 0.8666667, 1,
-0.0506513, 0.1291675, 1.334485, 0, 1, 0.8745098, 1,
-0.04656679, -0.3254014, -1.644547, 0, 1, 0.8784314, 1,
-0.04628482, 0.5262368, -0.6862752, 0, 1, 0.8862745, 1,
-0.04270989, -1.245898, -2.242493, 0, 1, 0.8901961, 1,
-0.03802992, 0.3902886, -1.368921, 0, 1, 0.8980392, 1,
-0.03760382, 1.613741, -1.160684, 0, 1, 0.9058824, 1,
-0.03208325, -0.2370747, -2.447725, 0, 1, 0.9098039, 1,
-0.02091652, -0.7001566, -1.852916, 0, 1, 0.9176471, 1,
-0.02055678, 1.177751, -0.04099449, 0, 1, 0.9215686, 1,
-0.01650823, -0.01126456, -4.715124, 0, 1, 0.9294118, 1,
-0.01287103, 0.9623019, -0.1198718, 0, 1, 0.9333333, 1,
-0.01272825, 0.03682273, 0.1458844, 0, 1, 0.9411765, 1,
-0.01035115, -0.03674787, -1.957388, 0, 1, 0.945098, 1,
-0.01029631, 0.4949566, 1.258866, 0, 1, 0.9529412, 1,
-0.008448388, 0.7736979, 0.6644505, 0, 1, 0.9568627, 1,
-0.004242175, 1.317001, 0.3744741, 0, 1, 0.9647059, 1,
-0.003588638, 0.2600137, 0.4458191, 0, 1, 0.9686275, 1,
-0.0002027216, 1.438566, -1.747067, 0, 1, 0.9764706, 1,
0.003490683, 0.6526743, -0.4140174, 0, 1, 0.9803922, 1,
0.004003958, -0.7794507, 3.385178, 0, 1, 0.9882353, 1,
0.007913329, -0.05998612, 3.545642, 0, 1, 0.9921569, 1,
0.008907471, -0.7834491, 3.132766, 0, 1, 1, 1,
0.01283528, -0.5110127, 4.536436, 0, 0.9921569, 1, 1,
0.01375814, -1.202631, 4.926889, 0, 0.9882353, 1, 1,
0.01628564, -0.8590546, 1.662167, 0, 0.9803922, 1, 1,
0.01741798, -0.350852, 3.431708, 0, 0.9764706, 1, 1,
0.01853865, 0.4903097, -0.04723132, 0, 0.9686275, 1, 1,
0.02892089, -1.174639, 3.534751, 0, 0.9647059, 1, 1,
0.03745086, 0.7429135, 0.471441, 0, 0.9568627, 1, 1,
0.04062814, 0.1458234, -1.565204, 0, 0.9529412, 1, 1,
0.04201258, 0.7862512, 0.4736227, 0, 0.945098, 1, 1,
0.04286163, 0.09064008, 0.6932593, 0, 0.9411765, 1, 1,
0.04360792, 0.3371399, 0.8934484, 0, 0.9333333, 1, 1,
0.04388347, -0.05304587, 1.239922, 0, 0.9294118, 1, 1,
0.0446707, -0.9640425, 3.151489, 0, 0.9215686, 1, 1,
0.04531033, 0.08395573, -0.4197367, 0, 0.9176471, 1, 1,
0.04616869, 0.8760285, -0.7973231, 0, 0.9098039, 1, 1,
0.04704913, 0.5213485, -0.7662469, 0, 0.9058824, 1, 1,
0.05382927, 0.9145594, 0.03613248, 0, 0.8980392, 1, 1,
0.05856337, 0.9102376, 1.161776, 0, 0.8901961, 1, 1,
0.05928743, 0.3211266, 2.584028, 0, 0.8862745, 1, 1,
0.05942585, 0.08495811, -0.09963811, 0, 0.8784314, 1, 1,
0.06544676, 1.954012, -0.5152352, 0, 0.8745098, 1, 1,
0.06565959, 1.654519, -1.722635, 0, 0.8666667, 1, 1,
0.06777968, -1.229662, 3.691624, 0, 0.8627451, 1, 1,
0.06905925, -0.2944839, 2.752926, 0, 0.854902, 1, 1,
0.0713551, -1.460918, 2.200908, 0, 0.8509804, 1, 1,
0.07685583, 2.958906, -2.085425, 0, 0.8431373, 1, 1,
0.07781688, -0.6338341, 1.90836, 0, 0.8392157, 1, 1,
0.08330214, -0.3607522, 1.705023, 0, 0.8313726, 1, 1,
0.08418753, 0.03613724, 0.7622183, 0, 0.827451, 1, 1,
0.08540399, 0.8151608, -1.131248, 0, 0.8196079, 1, 1,
0.09251701, 0.2304899, 0.3964542, 0, 0.8156863, 1, 1,
0.09441833, -2.504474, 4.869218, 0, 0.8078431, 1, 1,
0.09618668, -1.06925, 4.784566, 0, 0.8039216, 1, 1,
0.09818796, 0.5446257, -0.3792858, 0, 0.7960784, 1, 1,
0.1003566, 0.487816, 1.211425, 0, 0.7882353, 1, 1,
0.1009507, -1.933326, 4.533822, 0, 0.7843137, 1, 1,
0.1070638, -0.6023588, 4.004493, 0, 0.7764706, 1, 1,
0.1094775, -1.39361, 3.196498, 0, 0.772549, 1, 1,
0.1114097, 0.7101075, -0.6513435, 0, 0.7647059, 1, 1,
0.1121598, 0.2602268, 3.828549, 0, 0.7607843, 1, 1,
0.1125672, 1.467472, -0.9500264, 0, 0.7529412, 1, 1,
0.113269, -0.264996, 1.242541, 0, 0.7490196, 1, 1,
0.1134642, -1.251356, 4.510437, 0, 0.7411765, 1, 1,
0.114886, -0.5302785, 2.489663, 0, 0.7372549, 1, 1,
0.1184113, -1.624455, 4.388557, 0, 0.7294118, 1, 1,
0.1206393, -0.1468906, 2.77755, 0, 0.7254902, 1, 1,
0.1233737, 0.8415784, -0.2886589, 0, 0.7176471, 1, 1,
0.1251937, 1.153185, 3.352219, 0, 0.7137255, 1, 1,
0.1252808, 0.9216723, 0.2749823, 0, 0.7058824, 1, 1,
0.1281502, -1.365149, 2.710141, 0, 0.6980392, 1, 1,
0.1281961, -0.09730168, 3.196101, 0, 0.6941177, 1, 1,
0.1293093, -1.644929, 1.390658, 0, 0.6862745, 1, 1,
0.1418346, -1.508996, 3.534551, 0, 0.682353, 1, 1,
0.1436894, -1.357607, 2.674729, 0, 0.6745098, 1, 1,
0.1471258, -1.058735, 3.269593, 0, 0.6705883, 1, 1,
0.1471904, -1.161531, 2.953249, 0, 0.6627451, 1, 1,
0.1510269, 0.798286, 1.2769, 0, 0.6588235, 1, 1,
0.1523669, 0.2874431, 0.2447491, 0, 0.6509804, 1, 1,
0.1534101, 0.4125464, 0.4097289, 0, 0.6470588, 1, 1,
0.1579379, -0.1491033, 3.891103, 0, 0.6392157, 1, 1,
0.1581035, -0.5088228, 2.636292, 0, 0.6352941, 1, 1,
0.1585912, 0.3172452, 0.4659222, 0, 0.627451, 1, 1,
0.1627712, 1.049861, -0.5410503, 0, 0.6235294, 1, 1,
0.1640033, 1.997243, -0.0570096, 0, 0.6156863, 1, 1,
0.1652294, 0.5212344, -0.1300445, 0, 0.6117647, 1, 1,
0.1669321, 1.727435, 0.6158891, 0, 0.6039216, 1, 1,
0.1669898, -0.07541723, 1.196218, 0, 0.5960785, 1, 1,
0.1702846, 0.7564312, -0.5807365, 0, 0.5921569, 1, 1,
0.1716855, 0.7053788, 0.04473783, 0, 0.5843138, 1, 1,
0.173078, -1.531786, 3.131319, 0, 0.5803922, 1, 1,
0.1753514, -0.757017, 2.46571, 0, 0.572549, 1, 1,
0.178097, 0.8035734, -0.3941087, 0, 0.5686275, 1, 1,
0.1796187, -0.4240978, 3.34888, 0, 0.5607843, 1, 1,
0.1804879, 0.3607481, -0.4322129, 0, 0.5568628, 1, 1,
0.1808321, -1.374483, 0.4102826, 0, 0.5490196, 1, 1,
0.1823527, 0.5461847, 0.1489705, 0, 0.5450981, 1, 1,
0.1859579, 0.3341354, -0.7126971, 0, 0.5372549, 1, 1,
0.1888617, -1.133504, 5.091159, 0, 0.5333334, 1, 1,
0.1891993, 0.8677806, 0.2700338, 0, 0.5254902, 1, 1,
0.1906254, -0.6575321, 3.075529, 0, 0.5215687, 1, 1,
0.192771, 1.19399, 0.6259415, 0, 0.5137255, 1, 1,
0.1935462, 0.5224861, 0.4119856, 0, 0.509804, 1, 1,
0.1942599, -1.887162, 3.575971, 0, 0.5019608, 1, 1,
0.1985511, 0.9836533, 0.5537741, 0, 0.4941176, 1, 1,
0.2017266, -1.9136, 4.690229, 0, 0.4901961, 1, 1,
0.208874, 0.2394856, 0.6498827, 0, 0.4823529, 1, 1,
0.213481, -0.5927134, 3.86664, 0, 0.4784314, 1, 1,
0.2134873, -1.787577, 2.701986, 0, 0.4705882, 1, 1,
0.2134966, -0.06570621, 3.48631, 0, 0.4666667, 1, 1,
0.2142689, 0.5705617, 1.376871, 0, 0.4588235, 1, 1,
0.2162552, -0.3116743, 2.412756, 0, 0.454902, 1, 1,
0.2185781, -0.003949516, 2.45682, 0, 0.4470588, 1, 1,
0.2193052, 0.1205357, 0.04752926, 0, 0.4431373, 1, 1,
0.2256064, -0.2733789, 1.95886, 0, 0.4352941, 1, 1,
0.2269418, -0.7174639, 1.351435, 0, 0.4313726, 1, 1,
0.2280995, -2.118685, 3.792572, 0, 0.4235294, 1, 1,
0.2287944, -1.005715, 3.362108, 0, 0.4196078, 1, 1,
0.2308993, 0.510407, 0.6146328, 0, 0.4117647, 1, 1,
0.2319054, -0.002751185, 1.232789, 0, 0.4078431, 1, 1,
0.2321033, 1.06886, 0.7948171, 0, 0.4, 1, 1,
0.2355252, 0.859876, -1.023334, 0, 0.3921569, 1, 1,
0.2375691, 0.1912954, 0.4383732, 0, 0.3882353, 1, 1,
0.240181, -1.244912, 4.300084, 0, 0.3803922, 1, 1,
0.2408879, 0.7777902, 1.465725, 0, 0.3764706, 1, 1,
0.2418662, 0.4240577, -1.529404, 0, 0.3686275, 1, 1,
0.242365, -0.1086103, 2.762827, 0, 0.3647059, 1, 1,
0.2487928, -0.2667467, 2.866397, 0, 0.3568628, 1, 1,
0.2537274, -0.9078201, 1.997358, 0, 0.3529412, 1, 1,
0.2614204, 1.30067, 1.013238, 0, 0.345098, 1, 1,
0.2635239, -0.7720126, 2.985325, 0, 0.3411765, 1, 1,
0.2651719, -1.457462, 2.067568, 0, 0.3333333, 1, 1,
0.2668568, -1.926366, 3.019369, 0, 0.3294118, 1, 1,
0.2673377, -0.364814, 0.6746672, 0, 0.3215686, 1, 1,
0.2719258, -1.47528, 3.219089, 0, 0.3176471, 1, 1,
0.2753121, -1.124449, 3.030148, 0, 0.3098039, 1, 1,
0.2799524, -0.07738347, 2.565004, 0, 0.3058824, 1, 1,
0.28126, -0.2269363, 3.861352, 0, 0.2980392, 1, 1,
0.2854625, 0.08363665, 0.01002526, 0, 0.2901961, 1, 1,
0.2879595, 1.218293, -0.03296086, 0, 0.2862745, 1, 1,
0.2932869, 0.9460755, 0.1948943, 0, 0.2784314, 1, 1,
0.3018035, 1.274815, -0.2137947, 0, 0.2745098, 1, 1,
0.3024064, -1.234331, 4.10278, 0, 0.2666667, 1, 1,
0.3049907, -0.6135531, 2.631579, 0, 0.2627451, 1, 1,
0.305844, -0.1025433, 0.1686896, 0, 0.254902, 1, 1,
0.3073183, 2.547844, 2.252775, 0, 0.2509804, 1, 1,
0.3126432, 0.1844342, 1.161013, 0, 0.2431373, 1, 1,
0.314456, -0.2138923, 2.779458, 0, 0.2392157, 1, 1,
0.3177942, -0.778895, 2.856296, 0, 0.2313726, 1, 1,
0.3200219, 1.070269, -1.161909, 0, 0.227451, 1, 1,
0.3223057, 0.363367, 0.6882679, 0, 0.2196078, 1, 1,
0.3236205, -0.2068423, 1.852291, 0, 0.2156863, 1, 1,
0.3239493, 0.9368578, -0.9355167, 0, 0.2078431, 1, 1,
0.3248825, 0.4207898, 0.1870381, 0, 0.2039216, 1, 1,
0.3263724, -1.284824, 2.772641, 0, 0.1960784, 1, 1,
0.3269446, 0.4995635, 0.9113221, 0, 0.1882353, 1, 1,
0.3321048, -0.2976188, 2.843997, 0, 0.1843137, 1, 1,
0.3338435, 0.6213468, -0.8730879, 0, 0.1764706, 1, 1,
0.3354656, -0.4771957, 1.768596, 0, 0.172549, 1, 1,
0.3368102, 0.3184407, 1.0472, 0, 0.1647059, 1, 1,
0.3380328, 0.8474067, -0.1146571, 0, 0.1607843, 1, 1,
0.3391595, 1.159365, -0.5408281, 0, 0.1529412, 1, 1,
0.3414297, -0.1047333, 1.85571, 0, 0.1490196, 1, 1,
0.3435762, -0.5486802, 1.606771, 0, 0.1411765, 1, 1,
0.3440801, -0.09329499, 1.408602, 0, 0.1372549, 1, 1,
0.3461056, -1.78503, 2.711265, 0, 0.1294118, 1, 1,
0.3463944, 0.7622073, -0.1375336, 0, 0.1254902, 1, 1,
0.3485203, -0.3961205, -0.395741, 0, 0.1176471, 1, 1,
0.3550453, -0.2061268, 1.088151, 0, 0.1137255, 1, 1,
0.3562318, -1.93423, 3.250664, 0, 0.1058824, 1, 1,
0.3578995, 1.03816, -1.156648, 0, 0.09803922, 1, 1,
0.3656683, 0.5073959, -0.02199387, 0, 0.09411765, 1, 1,
0.3723771, -1.101085, 2.113405, 0, 0.08627451, 1, 1,
0.3749286, -0.1351402, 2.535951, 0, 0.08235294, 1, 1,
0.3751203, -0.1122589, 1.211459, 0, 0.07450981, 1, 1,
0.3752846, -0.579237, 2.967958, 0, 0.07058824, 1, 1,
0.3760614, -1.709556, 3.410506, 0, 0.0627451, 1, 1,
0.3782594, -2.053365, 2.590749, 0, 0.05882353, 1, 1,
0.3806698, -0.7717152, 2.204561, 0, 0.05098039, 1, 1,
0.3877086, 0.466357, 0.1208449, 0, 0.04705882, 1, 1,
0.3877695, -0.263291, 1.448062, 0, 0.03921569, 1, 1,
0.3896803, -0.313645, 0.5348875, 0, 0.03529412, 1, 1,
0.3952246, 1.054342, 0.4958338, 0, 0.02745098, 1, 1,
0.3982178, 0.8744389, 0.30677, 0, 0.02352941, 1, 1,
0.4003709, -1.062201, 1.799027, 0, 0.01568628, 1, 1,
0.4006097, -0.6113361, 3.115546, 0, 0.01176471, 1, 1,
0.4018454, 1.177262, 0.4874961, 0, 0.003921569, 1, 1,
0.4079717, -0.5507175, 2.285459, 0.003921569, 0, 1, 1,
0.4094208, 0.4389479, -0.8790182, 0.007843138, 0, 1, 1,
0.4113616, 1.654063, -0.5630341, 0.01568628, 0, 1, 1,
0.4118367, 1.735103, -1.855013, 0.01960784, 0, 1, 1,
0.4144688, -0.291116, 1.897571, 0.02745098, 0, 1, 1,
0.4150473, -1.264964, 3.555815, 0.03137255, 0, 1, 1,
0.4175591, -1.826976, 2.641359, 0.03921569, 0, 1, 1,
0.4185128, 2.013605, 0.3208876, 0.04313726, 0, 1, 1,
0.4200569, -0.2132967, 1.695404, 0.05098039, 0, 1, 1,
0.4234345, 1.083104, 0.08939715, 0.05490196, 0, 1, 1,
0.4252462, 1.034112, -0.1416138, 0.0627451, 0, 1, 1,
0.4252858, 0.4495719, 1.844283, 0.06666667, 0, 1, 1,
0.4280667, 0.05167986, 1.047926, 0.07450981, 0, 1, 1,
0.4301861, -0.1314276, 0.7894405, 0.07843138, 0, 1, 1,
0.4428245, -0.006944848, 2.286406, 0.08627451, 0, 1, 1,
0.4432125, 1.632958, 0.936005, 0.09019608, 0, 1, 1,
0.4476798, -0.4407375, 3.125514, 0.09803922, 0, 1, 1,
0.448301, 0.6395739, 2.232981, 0.1058824, 0, 1, 1,
0.4516627, 0.9392865, 1.88633, 0.1098039, 0, 1, 1,
0.4549682, -1.871064, 0.4298207, 0.1176471, 0, 1, 1,
0.4573368, -1.375168, 1.787679, 0.1215686, 0, 1, 1,
0.4573719, 0.6559637, 1.800251, 0.1294118, 0, 1, 1,
0.4591909, 0.6562926, -0.7300161, 0.1333333, 0, 1, 1,
0.4604912, -0.7589759, 1.011167, 0.1411765, 0, 1, 1,
0.4627424, 0.7939963, 0.2730533, 0.145098, 0, 1, 1,
0.4696346, 1.436236, 1.279871, 0.1529412, 0, 1, 1,
0.4772364, 1.278625, -0.2092123, 0.1568628, 0, 1, 1,
0.4869272, -0.4974654, 3.69053, 0.1647059, 0, 1, 1,
0.4887415, -1.250793, 1.175905, 0.1686275, 0, 1, 1,
0.4926897, -0.5502053, 2.189236, 0.1764706, 0, 1, 1,
0.4931544, -0.4871823, 2.329387, 0.1803922, 0, 1, 1,
0.4940105, -0.6474112, 0.8828605, 0.1882353, 0, 1, 1,
0.4946257, -0.04587309, 2.100575, 0.1921569, 0, 1, 1,
0.4995056, 0.4783608, 0.6256, 0.2, 0, 1, 1,
0.5018227, 0.1348751, 0.709623, 0.2078431, 0, 1, 1,
0.503686, -1.358755, 3.357098, 0.2117647, 0, 1, 1,
0.5046543, 0.7544442, 0.6216831, 0.2196078, 0, 1, 1,
0.5165174, 0.169995, 1.750429, 0.2235294, 0, 1, 1,
0.5229765, -0.4976941, 2.403169, 0.2313726, 0, 1, 1,
0.5234124, -0.5374979, 4.764455, 0.2352941, 0, 1, 1,
0.5266401, 0.2494167, 1.927392, 0.2431373, 0, 1, 1,
0.5314025, 2.307078, -0.8048746, 0.2470588, 0, 1, 1,
0.5345996, 1.384501, 1.126422, 0.254902, 0, 1, 1,
0.5364628, 0.6295465, -0.2787311, 0.2588235, 0, 1, 1,
0.5422861, -0.9428471, 2.268584, 0.2666667, 0, 1, 1,
0.5442851, -0.2395114, 1.811566, 0.2705882, 0, 1, 1,
0.5452003, -2.504673, 2.396499, 0.2784314, 0, 1, 1,
0.5462034, -0.4220845, 2.094576, 0.282353, 0, 1, 1,
0.5471702, -0.04668035, 2.161919, 0.2901961, 0, 1, 1,
0.5497792, -0.07301562, 2.424583, 0.2941177, 0, 1, 1,
0.5503881, -0.9829021, 3.034007, 0.3019608, 0, 1, 1,
0.5518481, 1.27476, -0.9255393, 0.3098039, 0, 1, 1,
0.5555436, 0.3584311, 0.03545376, 0.3137255, 0, 1, 1,
0.5558826, -0.8525826, 2.380932, 0.3215686, 0, 1, 1,
0.557859, -0.9270563, 2.477828, 0.3254902, 0, 1, 1,
0.567697, 0.6887385, 0.6899401, 0.3333333, 0, 1, 1,
0.5701468, -0.388211, 2.344377, 0.3372549, 0, 1, 1,
0.5733613, -0.7077999, 1.179166, 0.345098, 0, 1, 1,
0.577754, -1.057098, 2.920893, 0.3490196, 0, 1, 1,
0.5879015, 0.003347635, 1.400787, 0.3568628, 0, 1, 1,
0.5937681, -0.7187513, 1.969741, 0.3607843, 0, 1, 1,
0.6123571, -1.326324, 1.150477, 0.3686275, 0, 1, 1,
0.624258, -0.5061255, 2.208598, 0.372549, 0, 1, 1,
0.625517, 0.6704412, 0.1146858, 0.3803922, 0, 1, 1,
0.6273197, 0.5763375, 0.503866, 0.3843137, 0, 1, 1,
0.6320489, -1.112252, 3.891642, 0.3921569, 0, 1, 1,
0.6335606, -0.4694553, 2.824414, 0.3960784, 0, 1, 1,
0.6349556, 0.9077146, 0.6500518, 0.4039216, 0, 1, 1,
0.6352723, 0.8891898, 0.7385349, 0.4117647, 0, 1, 1,
0.6356226, 0.7210396, 0.9523513, 0.4156863, 0, 1, 1,
0.6419578, 1.198235, 1.151173, 0.4235294, 0, 1, 1,
0.6463845, -0.7912538, 4.166896, 0.427451, 0, 1, 1,
0.651491, -0.3611727, 3.281911, 0.4352941, 0, 1, 1,
0.6527632, -0.03846145, 0.8428474, 0.4392157, 0, 1, 1,
0.6571846, 1.093283, -0.4153084, 0.4470588, 0, 1, 1,
0.6575639, 1.025289, 1.986163, 0.4509804, 0, 1, 1,
0.658451, -0.7563859, 0.6830582, 0.4588235, 0, 1, 1,
0.6637706, 1.516245, 0.8437586, 0.4627451, 0, 1, 1,
0.6715206, 1.530134, 0.8954325, 0.4705882, 0, 1, 1,
0.6738657, -1.242925, 2.891133, 0.4745098, 0, 1, 1,
0.6761832, -1.900469, 1.818677, 0.4823529, 0, 1, 1,
0.6795468, 0.8186598, -0.711114, 0.4862745, 0, 1, 1,
0.6843165, -0.913044, 2.933254, 0.4941176, 0, 1, 1,
0.6887451, 1.044499, 0.9484961, 0.5019608, 0, 1, 1,
0.6920485, -0.4815059, 1.788154, 0.5058824, 0, 1, 1,
0.6966562, 0.6696635, -1.094901, 0.5137255, 0, 1, 1,
0.6979629, -1.783896, 2.992311, 0.5176471, 0, 1, 1,
0.7015167, 0.8905689, 2.257765, 0.5254902, 0, 1, 1,
0.7018688, 1.958706, 0.6564937, 0.5294118, 0, 1, 1,
0.7033576, -0.1602422, 0.1964275, 0.5372549, 0, 1, 1,
0.7137538, -0.003086041, 1.223423, 0.5411765, 0, 1, 1,
0.7177258, 1.716296, -0.6356378, 0.5490196, 0, 1, 1,
0.7188967, 0.7471671, 0.3170058, 0.5529412, 0, 1, 1,
0.7222139, -0.7462268, 2.488724, 0.5607843, 0, 1, 1,
0.7267973, 0.8240112, 2.617237, 0.5647059, 0, 1, 1,
0.7315462, -0.009844209, 0.009182089, 0.572549, 0, 1, 1,
0.7356225, -0.2731013, 1.665666, 0.5764706, 0, 1, 1,
0.7363778, -0.2185123, 2.591951, 0.5843138, 0, 1, 1,
0.7389119, -2.462503, 3.11934, 0.5882353, 0, 1, 1,
0.7390122, -0.1873948, 3.159099, 0.5960785, 0, 1, 1,
0.7432255, -0.2661414, 2.862106, 0.6039216, 0, 1, 1,
0.747877, 0.04101386, 4.122904, 0.6078432, 0, 1, 1,
0.7517524, 1.272114, 1.609396, 0.6156863, 0, 1, 1,
0.7518019, 1.418572, 0.5564968, 0.6196079, 0, 1, 1,
0.7522888, -1.199655, 0.4682584, 0.627451, 0, 1, 1,
0.7610196, -1.40095, 2.121456, 0.6313726, 0, 1, 1,
0.7629979, -1.216791, 3.718268, 0.6392157, 0, 1, 1,
0.7737421, 0.6541216, 0.09541228, 0.6431373, 0, 1, 1,
0.777031, -0.7965937, 2.598496, 0.6509804, 0, 1, 1,
0.779888, 0.9712164, 1.176204, 0.654902, 0, 1, 1,
0.7811965, -0.3530539, 0.8673561, 0.6627451, 0, 1, 1,
0.7840032, -1.304625, 1.741312, 0.6666667, 0, 1, 1,
0.7905762, -0.6560543, 2.687151, 0.6745098, 0, 1, 1,
0.7924404, -1.158179, 1.143307, 0.6784314, 0, 1, 1,
0.7933074, -0.6639917, 2.614419, 0.6862745, 0, 1, 1,
0.7937132, -1.284661, 2.290771, 0.6901961, 0, 1, 1,
0.7962652, -0.1916162, 2.482779, 0.6980392, 0, 1, 1,
0.8005657, 2.08153, 1.088106, 0.7058824, 0, 1, 1,
0.8061686, 1.691327, -1.058936, 0.7098039, 0, 1, 1,
0.8076791, 1.339969, -0.4714199, 0.7176471, 0, 1, 1,
0.8078653, -0.5833127, 4.079895, 0.7215686, 0, 1, 1,
0.8136713, 0.08495757, 1.036484, 0.7294118, 0, 1, 1,
0.8160647, -0.5137292, 3.213463, 0.7333333, 0, 1, 1,
0.8195917, -0.876924, 2.146529, 0.7411765, 0, 1, 1,
0.8206255, 0.9918597, 0.2150048, 0.7450981, 0, 1, 1,
0.821407, 0.8184067, -0.7400474, 0.7529412, 0, 1, 1,
0.8228269, -0.4709687, 1.892672, 0.7568628, 0, 1, 1,
0.8233526, -0.9479334, 1.148696, 0.7647059, 0, 1, 1,
0.8277754, -0.009390188, 1.528026, 0.7686275, 0, 1, 1,
0.8279133, 0.8983299, 3.444047, 0.7764706, 0, 1, 1,
0.8366266, -1.023084, 2.653677, 0.7803922, 0, 1, 1,
0.8380687, 0.2633131, 0.8423168, 0.7882353, 0, 1, 1,
0.8428077, 0.6820462, 0.7418032, 0.7921569, 0, 1, 1,
0.8446459, -0.6886744, 1.747821, 0.8, 0, 1, 1,
0.8494797, -1.423715, 3.51199, 0.8078431, 0, 1, 1,
0.8549727, 1.22582, 1.811322, 0.8117647, 0, 1, 1,
0.8556763, -0.6631631, 3.033528, 0.8196079, 0, 1, 1,
0.8601233, -0.419863, 2.814105, 0.8235294, 0, 1, 1,
0.8604152, -1.298903, 2.544754, 0.8313726, 0, 1, 1,
0.8612831, 0.4597728, 2.384157, 0.8352941, 0, 1, 1,
0.8648034, 0.2166931, 1.097249, 0.8431373, 0, 1, 1,
0.8652607, 0.8774966, 1.749944, 0.8470588, 0, 1, 1,
0.8652836, -0.2740631, 1.902961, 0.854902, 0, 1, 1,
0.8665534, 0.4018089, 1.241379, 0.8588235, 0, 1, 1,
0.8670949, -0.303333, 1.924759, 0.8666667, 0, 1, 1,
0.8717231, 1.519504, -0.4088247, 0.8705882, 0, 1, 1,
0.8731384, -0.5733542, 2.003779, 0.8784314, 0, 1, 1,
0.8768926, -1.225767, 1.562645, 0.8823529, 0, 1, 1,
0.8805869, -1.073098, 0.09869182, 0.8901961, 0, 1, 1,
0.887506, -0.4849198, 1.916309, 0.8941177, 0, 1, 1,
0.8892694, -0.0468657, 1.894434, 0.9019608, 0, 1, 1,
0.8937255, 0.6695654, 0.9668517, 0.9098039, 0, 1, 1,
0.8942611, 0.3299043, 1.935564, 0.9137255, 0, 1, 1,
0.8967858, 0.6453881, 2.683859, 0.9215686, 0, 1, 1,
0.8992558, -0.5410374, 1.352874, 0.9254902, 0, 1, 1,
0.9032345, 1.249671, 1.589914, 0.9333333, 0, 1, 1,
0.9111757, 0.6622833, 1.359805, 0.9372549, 0, 1, 1,
0.9157498, -0.3586609, 0.8131121, 0.945098, 0, 1, 1,
0.9222794, 0.692991, -0.1166914, 0.9490196, 0, 1, 1,
0.9251741, -1.520363, 4.187152, 0.9568627, 0, 1, 1,
0.9272435, 0.1318058, 2.331535, 0.9607843, 0, 1, 1,
0.9299814, 2.252155, -0.04857532, 0.9686275, 0, 1, 1,
0.9324561, 0.1027861, 1.415883, 0.972549, 0, 1, 1,
0.9335586, -0.9659446, 1.84864, 0.9803922, 0, 1, 1,
0.9394793, -0.2939724, 2.534648, 0.9843137, 0, 1, 1,
0.9404798, -0.03680653, 3.298846, 0.9921569, 0, 1, 1,
0.9408638, 0.02883291, 0.8002223, 0.9960784, 0, 1, 1,
0.9481094, 1.505127, 0.9798159, 1, 0, 0.9960784, 1,
0.9501923, 0.2857439, 1.379299, 1, 0, 0.9882353, 1,
0.9510239, -1.209277, 2.855582, 1, 0, 0.9843137, 1,
0.9532575, 0.09718607, 2.438081, 1, 0, 0.9764706, 1,
0.9568588, -2.051982, 2.484869, 1, 0, 0.972549, 1,
0.970534, 0.8676285, 0.9493587, 1, 0, 0.9647059, 1,
0.9744638, 0.888669, 0.418964, 1, 0, 0.9607843, 1,
0.9813204, 0.009654862, 3.154103, 1, 0, 0.9529412, 1,
0.9834889, 0.1875356, 1.230039, 1, 0, 0.9490196, 1,
0.9964302, 2.188141, 1.028431, 1, 0, 0.9411765, 1,
0.9973468, 1.608028, 0.1564082, 1, 0, 0.9372549, 1,
0.9999396, -0.5792462, 2.351213, 1, 0, 0.9294118, 1,
1.010147, 0.9255725, 1.884412, 1, 0, 0.9254902, 1,
1.012176, 0.09813108, 1.762275, 1, 0, 0.9176471, 1,
1.01221, 0.3636319, 0.3440492, 1, 0, 0.9137255, 1,
1.018791, -0.5629802, 0.1863231, 1, 0, 0.9058824, 1,
1.023159, 0.03379552, 2.781078, 1, 0, 0.9019608, 1,
1.027135, -1.011084, 2.131033, 1, 0, 0.8941177, 1,
1.036936, 0.4886266, 2.535753, 1, 0, 0.8862745, 1,
1.037189, 0.9436746, 1.704236, 1, 0, 0.8823529, 1,
1.047179, -0.2173177, 0.4625333, 1, 0, 0.8745098, 1,
1.050022, 1.519235, -0.3757381, 1, 0, 0.8705882, 1,
1.052862, -0.8350751, 2.527823, 1, 0, 0.8627451, 1,
1.053748, -0.5472404, 2.778863, 1, 0, 0.8588235, 1,
1.05392, -0.5800644, 1.513517, 1, 0, 0.8509804, 1,
1.056973, 0.7718762, 1.466653, 1, 0, 0.8470588, 1,
1.057283, 0.3197415, 1.131591, 1, 0, 0.8392157, 1,
1.063419, 1.203546, -0.5242881, 1, 0, 0.8352941, 1,
1.067583, 0.2901901, 1.148927, 1, 0, 0.827451, 1,
1.07111, -0.4162823, 1.552174, 1, 0, 0.8235294, 1,
1.071124, -0.2240524, 3.571691, 1, 0, 0.8156863, 1,
1.073566, 0.5158193, 2.646635, 1, 0, 0.8117647, 1,
1.077657, -0.1561809, 1.570662, 1, 0, 0.8039216, 1,
1.08026, 0.6026438, 1.136173, 1, 0, 0.7960784, 1,
1.083338, 1.004301, -0.5415813, 1, 0, 0.7921569, 1,
1.087575, -1.349329, 2.925292, 1, 0, 0.7843137, 1,
1.090108, -0.2253893, 2.75906, 1, 0, 0.7803922, 1,
1.093338, -0.07618094, 1.884423, 1, 0, 0.772549, 1,
1.095921, -1.35025, 1.083384, 1, 0, 0.7686275, 1,
1.109773, 0.2229518, 0.7172114, 1, 0, 0.7607843, 1,
1.111234, -0.2001435, 0.9163004, 1, 0, 0.7568628, 1,
1.12521, -0.1740013, 1.81169, 1, 0, 0.7490196, 1,
1.128345, -0.8425794, 0.4239789, 1, 0, 0.7450981, 1,
1.14034, 0.9942613, 1.08303, 1, 0, 0.7372549, 1,
1.14204, 1.371253, -0.07213535, 1, 0, 0.7333333, 1,
1.146779, 0.02709118, 0.9855625, 1, 0, 0.7254902, 1,
1.148864, -0.5226545, 2.677656, 1, 0, 0.7215686, 1,
1.166327, 0.2676477, 1.916709, 1, 0, 0.7137255, 1,
1.176961, 0.9221478, 0.9353085, 1, 0, 0.7098039, 1,
1.179976, 0.5686101, 1.074985, 1, 0, 0.7019608, 1,
1.188687, 0.4287758, 0.5325699, 1, 0, 0.6941177, 1,
1.190284, 0.1997443, -0.1088197, 1, 0, 0.6901961, 1,
1.197235, -0.6542435, 2.653957, 1, 0, 0.682353, 1,
1.199326, 0.5240037, 1.788681, 1, 0, 0.6784314, 1,
1.203771, 1.123828, 2.887241, 1, 0, 0.6705883, 1,
1.208254, -0.3246645, 1.979645, 1, 0, 0.6666667, 1,
1.21395, -0.0535809, 2.248223, 1, 0, 0.6588235, 1,
1.216218, 0.2842833, 1.889669, 1, 0, 0.654902, 1,
1.222361, -0.500075, 1.478621, 1, 0, 0.6470588, 1,
1.226187, -0.1633458, 1.956755, 1, 0, 0.6431373, 1,
1.234984, 0.4594085, 0.01751458, 1, 0, 0.6352941, 1,
1.236618, -2.06275, 2.693111, 1, 0, 0.6313726, 1,
1.259085, 0.01433182, 1.901695, 1, 0, 0.6235294, 1,
1.267256, -0.3186835, 3.267737, 1, 0, 0.6196079, 1,
1.268718, 0.2310017, -0.008074288, 1, 0, 0.6117647, 1,
1.279786, 0.1991511, 0.5159332, 1, 0, 0.6078432, 1,
1.280371, 1.24824, 2.456027, 1, 0, 0.6, 1,
1.290421, -0.8256728, 2.155067, 1, 0, 0.5921569, 1,
1.303357, 0.8357647, 1.184501, 1, 0, 0.5882353, 1,
1.307605, 0.06677008, 0.004542108, 1, 0, 0.5803922, 1,
1.322297, -0.9728597, 2.484186, 1, 0, 0.5764706, 1,
1.323313, 1.499081, -0.6164397, 1, 0, 0.5686275, 1,
1.327262, 1.113155, 1.409616, 1, 0, 0.5647059, 1,
1.329858, -1.084787, 1.904389, 1, 0, 0.5568628, 1,
1.330084, -0.004896721, 1.368204, 1, 0, 0.5529412, 1,
1.330275, 0.2437346, 1.56216, 1, 0, 0.5450981, 1,
1.339415, 1.451769, 0.8211657, 1, 0, 0.5411765, 1,
1.34005, 2.989199, -1.518168, 1, 0, 0.5333334, 1,
1.340235, 1.298533, -0.1050904, 1, 0, 0.5294118, 1,
1.347756, 0.5319155, 1.468558, 1, 0, 0.5215687, 1,
1.351188, -0.02265716, -1.263662, 1, 0, 0.5176471, 1,
1.362307, -0.8645617, 3.334133, 1, 0, 0.509804, 1,
1.382477, -1.037451, 1.749545, 1, 0, 0.5058824, 1,
1.388363, 0.6674157, 2.759921, 1, 0, 0.4980392, 1,
1.393425, 0.2481584, 3.243326, 1, 0, 0.4901961, 1,
1.399721, 0.2185692, 2.117496, 1, 0, 0.4862745, 1,
1.40001, 0.4493625, 1.907872, 1, 0, 0.4784314, 1,
1.403489, -0.8384922, 2.348222, 1, 0, 0.4745098, 1,
1.418958, 1.466335, 1.085324, 1, 0, 0.4666667, 1,
1.427494, 0.4430256, 0.4854643, 1, 0, 0.4627451, 1,
1.427888, -0.7314895, 1.79367, 1, 0, 0.454902, 1,
1.432328, 1.818336, 1.121697, 1, 0, 0.4509804, 1,
1.433529, 0.6197586, 1.50483, 1, 0, 0.4431373, 1,
1.433601, -0.6064526, 3.135649, 1, 0, 0.4392157, 1,
1.436796, -0.8664057, 0.7104629, 1, 0, 0.4313726, 1,
1.444806, 0.1868475, 0.01554656, 1, 0, 0.427451, 1,
1.448272, -0.8035378, 1.71333, 1, 0, 0.4196078, 1,
1.454025, -0.6699579, 3.01897, 1, 0, 0.4156863, 1,
1.463007, -1.129561, 1.688032, 1, 0, 0.4078431, 1,
1.465895, 1.441985, 1.468592, 1, 0, 0.4039216, 1,
1.467346, 0.3148366, 0.6933948, 1, 0, 0.3960784, 1,
1.477692, 0.5656872, 0.7890999, 1, 0, 0.3882353, 1,
1.489606, -0.5378394, 1.518199, 1, 0, 0.3843137, 1,
1.493533, 1.022178, 0.4279865, 1, 0, 0.3764706, 1,
1.498659, 0.6032221, -1.962198, 1, 0, 0.372549, 1,
1.507729, -1.784435, 2.056747, 1, 0, 0.3647059, 1,
1.51206, 0.2989113, 1.729535, 1, 0, 0.3607843, 1,
1.512916, -1.096423, 0.6922457, 1, 0, 0.3529412, 1,
1.546801, -0.01224228, 1.25842, 1, 0, 0.3490196, 1,
1.550139, 1.386715, 0.7273132, 1, 0, 0.3411765, 1,
1.55884, 0.891066, 2.634794, 1, 0, 0.3372549, 1,
1.564956, 0.5030519, -0.0777822, 1, 0, 0.3294118, 1,
1.575545, -0.973893, 1.537301, 1, 0, 0.3254902, 1,
1.57978, 1.291475, -0.3278174, 1, 0, 0.3176471, 1,
1.580159, 0.005896037, 2.423336, 1, 0, 0.3137255, 1,
1.585102, 1.44483, 0.5569943, 1, 0, 0.3058824, 1,
1.590134, 0.5718064, 1.513263, 1, 0, 0.2980392, 1,
1.591673, -1.614922, 1.582508, 1, 0, 0.2941177, 1,
1.596923, -0.6946663, 2.033077, 1, 0, 0.2862745, 1,
1.615968, 0.721061, 1.909607, 1, 0, 0.282353, 1,
1.617717, 0.4838166, -0.6665373, 1, 0, 0.2745098, 1,
1.628406, 0.02156999, 0.6513891, 1, 0, 0.2705882, 1,
1.637109, 1.110282, -0.2285046, 1, 0, 0.2627451, 1,
1.645571, 1.362269, 1.119002, 1, 0, 0.2588235, 1,
1.646768, 1.435152, 1.193157, 1, 0, 0.2509804, 1,
1.653758, 0.8864807, 1.171637, 1, 0, 0.2470588, 1,
1.655133, 1.075231, 1.794085, 1, 0, 0.2392157, 1,
1.671228, 0.2391771, 1.556736, 1, 0, 0.2352941, 1,
1.676646, -0.5352185, 2.023352, 1, 0, 0.227451, 1,
1.679527, 1.244258, 1.271547, 1, 0, 0.2235294, 1,
1.714705, -0.814888, 2.013597, 1, 0, 0.2156863, 1,
1.728156, 0.1875851, 1.585085, 1, 0, 0.2117647, 1,
1.731558, 1.103888, 2.51708, 1, 0, 0.2039216, 1,
1.739242, -0.1905663, 1.91336, 1, 0, 0.1960784, 1,
1.744412, 0.2122536, -0.1852117, 1, 0, 0.1921569, 1,
1.775151, 0.0689355, 3.346043, 1, 0, 0.1843137, 1,
1.80129, 2.199129, 0.7825271, 1, 0, 0.1803922, 1,
1.807744, -1.13237, 0.290547, 1, 0, 0.172549, 1,
1.815084, -0.4868949, 0.8494885, 1, 0, 0.1686275, 1,
1.815616, 1.715363, 1.099859, 1, 0, 0.1607843, 1,
1.83512, 0.8698695, 0.06631833, 1, 0, 0.1568628, 1,
1.851754, -1.896654, 2.414818, 1, 0, 0.1490196, 1,
1.859383, -0.3845028, 1.141701, 1, 0, 0.145098, 1,
1.882627, 1.386078, 1.591148, 1, 0, 0.1372549, 1,
1.883053, 0.0892308, 1.4311, 1, 0, 0.1333333, 1,
1.883582, 0.4071973, 1.363143, 1, 0, 0.1254902, 1,
1.894667, 0.6307669, 2.767704, 1, 0, 0.1215686, 1,
1.947359, 1.333727, 2.104788, 1, 0, 0.1137255, 1,
1.958029, -1.27229, 3.635677, 1, 0, 0.1098039, 1,
1.982447, -0.4915967, 3.893068, 1, 0, 0.1019608, 1,
1.999092, -1.466836, 2.213258, 1, 0, 0.09411765, 1,
2.017832, 0.7844259, 1.025366, 1, 0, 0.09019608, 1,
2.052137, 1.228192, -0.1532754, 1, 0, 0.08235294, 1,
2.076853, 0.4294305, 0.5584531, 1, 0, 0.07843138, 1,
2.120968, 0.4224018, 2.562369, 1, 0, 0.07058824, 1,
2.149814, 0.9423177, 2.010304, 1, 0, 0.06666667, 1,
2.159333, 1.894821, 1.514025, 1, 0, 0.05882353, 1,
2.172925, -2.115379, 1.524715, 1, 0, 0.05490196, 1,
2.211695, -0.8237764, 2.340883, 1, 0, 0.04705882, 1,
2.351738, 1.094441, 1.680634, 1, 0, 0.04313726, 1,
2.421688, -0.1061067, 3.227506, 1, 0, 0.03529412, 1,
2.563516, 1.482629, 0.386907, 1, 0, 0.03137255, 1,
2.651809, -0.9872198, 3.263297, 1, 0, 0.02352941, 1,
2.655791, -0.7645874, 0.7623248, 1, 0, 0.01960784, 1,
2.956141, -0.486811, 1.170086, 1, 0, 0.01176471, 1,
2.963311, -0.7136289, 1.843731, 1, 0, 0.007843138, 1
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
-0.1686065, -3.893831, -6.951898, 0, -0.5, 0.5, 0.5,
-0.1686065, -3.893831, -6.951898, 1, -0.5, 0.5, 0.5,
-0.1686065, -3.893831, -6.951898, 1, 1.5, 0.5, 0.5,
-0.1686065, -3.893831, -6.951898, 0, 1.5, 0.5, 0.5
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
-4.362244, 0.04647577, -6.951898, 0, -0.5, 0.5, 0.5,
-4.362244, 0.04647577, -6.951898, 1, -0.5, 0.5, 0.5,
-4.362244, 0.04647577, -6.951898, 1, 1.5, 0.5, 0.5,
-4.362244, 0.04647577, -6.951898, 0, 1.5, 0.5, 0.5
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
-4.362244, -3.893831, -0.05764699, 0, -0.5, 0.5, 0.5,
-4.362244, -3.893831, -0.05764699, 1, -0.5, 0.5, 0.5,
-4.362244, -3.893831, -0.05764699, 1, 1.5, 0.5, 0.5,
-4.362244, -3.893831, -0.05764699, 0, 1.5, 0.5, 0.5
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
-3, -2.984529, -5.360917,
2, -2.984529, -5.360917,
-3, -2.984529, -5.360917,
-3, -3.13608, -5.626081,
-2, -2.984529, -5.360917,
-2, -3.13608, -5.626081,
-1, -2.984529, -5.360917,
-1, -3.13608, -5.626081,
0, -2.984529, -5.360917,
0, -3.13608, -5.626081,
1, -2.984529, -5.360917,
1, -3.13608, -5.626081,
2, -2.984529, -5.360917,
2, -3.13608, -5.626081
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
-3, -3.43918, -6.156407, 0, -0.5, 0.5, 0.5,
-3, -3.43918, -6.156407, 1, -0.5, 0.5, 0.5,
-3, -3.43918, -6.156407, 1, 1.5, 0.5, 0.5,
-3, -3.43918, -6.156407, 0, 1.5, 0.5, 0.5,
-2, -3.43918, -6.156407, 0, -0.5, 0.5, 0.5,
-2, -3.43918, -6.156407, 1, -0.5, 0.5, 0.5,
-2, -3.43918, -6.156407, 1, 1.5, 0.5, 0.5,
-2, -3.43918, -6.156407, 0, 1.5, 0.5, 0.5,
-1, -3.43918, -6.156407, 0, -0.5, 0.5, 0.5,
-1, -3.43918, -6.156407, 1, -0.5, 0.5, 0.5,
-1, -3.43918, -6.156407, 1, 1.5, 0.5, 0.5,
-1, -3.43918, -6.156407, 0, 1.5, 0.5, 0.5,
0, -3.43918, -6.156407, 0, -0.5, 0.5, 0.5,
0, -3.43918, -6.156407, 1, -0.5, 0.5, 0.5,
0, -3.43918, -6.156407, 1, 1.5, 0.5, 0.5,
0, -3.43918, -6.156407, 0, 1.5, 0.5, 0.5,
1, -3.43918, -6.156407, 0, -0.5, 0.5, 0.5,
1, -3.43918, -6.156407, 1, -0.5, 0.5, 0.5,
1, -3.43918, -6.156407, 1, 1.5, 0.5, 0.5,
1, -3.43918, -6.156407, 0, 1.5, 0.5, 0.5,
2, -3.43918, -6.156407, 0, -0.5, 0.5, 0.5,
2, -3.43918, -6.156407, 1, -0.5, 0.5, 0.5,
2, -3.43918, -6.156407, 1, 1.5, 0.5, 0.5,
2, -3.43918, -6.156407, 0, 1.5, 0.5, 0.5
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
-3.394481, -2, -5.360917,
-3.394481, 2, -5.360917,
-3.394481, -2, -5.360917,
-3.555775, -2, -5.626081,
-3.394481, -1, -5.360917,
-3.555775, -1, -5.626081,
-3.394481, 0, -5.360917,
-3.555775, 0, -5.626081,
-3.394481, 1, -5.360917,
-3.555775, 1, -5.626081,
-3.394481, 2, -5.360917,
-3.555775, 2, -5.626081
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
-3.878362, -2, -6.156407, 0, -0.5, 0.5, 0.5,
-3.878362, -2, -6.156407, 1, -0.5, 0.5, 0.5,
-3.878362, -2, -6.156407, 1, 1.5, 0.5, 0.5,
-3.878362, -2, -6.156407, 0, 1.5, 0.5, 0.5,
-3.878362, -1, -6.156407, 0, -0.5, 0.5, 0.5,
-3.878362, -1, -6.156407, 1, -0.5, 0.5, 0.5,
-3.878362, -1, -6.156407, 1, 1.5, 0.5, 0.5,
-3.878362, -1, -6.156407, 0, 1.5, 0.5, 0.5,
-3.878362, 0, -6.156407, 0, -0.5, 0.5, 0.5,
-3.878362, 0, -6.156407, 1, -0.5, 0.5, 0.5,
-3.878362, 0, -6.156407, 1, 1.5, 0.5, 0.5,
-3.878362, 0, -6.156407, 0, 1.5, 0.5, 0.5,
-3.878362, 1, -6.156407, 0, -0.5, 0.5, 0.5,
-3.878362, 1, -6.156407, 1, -0.5, 0.5, 0.5,
-3.878362, 1, -6.156407, 1, 1.5, 0.5, 0.5,
-3.878362, 1, -6.156407, 0, 1.5, 0.5, 0.5,
-3.878362, 2, -6.156407, 0, -0.5, 0.5, 0.5,
-3.878362, 2, -6.156407, 1, -0.5, 0.5, 0.5,
-3.878362, 2, -6.156407, 1, 1.5, 0.5, 0.5,
-3.878362, 2, -6.156407, 0, 1.5, 0.5, 0.5
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
-3.394481, -2.984529, -4,
-3.394481, -2.984529, 4,
-3.394481, -2.984529, -4,
-3.555775, -3.13608, -4,
-3.394481, -2.984529, -2,
-3.555775, -3.13608, -2,
-3.394481, -2.984529, 0,
-3.555775, -3.13608, 0,
-3.394481, -2.984529, 2,
-3.555775, -3.13608, 2,
-3.394481, -2.984529, 4,
-3.555775, -3.13608, 4
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
-3.878362, -3.43918, -4, 0, -0.5, 0.5, 0.5,
-3.878362, -3.43918, -4, 1, -0.5, 0.5, 0.5,
-3.878362, -3.43918, -4, 1, 1.5, 0.5, 0.5,
-3.878362, -3.43918, -4, 0, 1.5, 0.5, 0.5,
-3.878362, -3.43918, -2, 0, -0.5, 0.5, 0.5,
-3.878362, -3.43918, -2, 1, -0.5, 0.5, 0.5,
-3.878362, -3.43918, -2, 1, 1.5, 0.5, 0.5,
-3.878362, -3.43918, -2, 0, 1.5, 0.5, 0.5,
-3.878362, -3.43918, 0, 0, -0.5, 0.5, 0.5,
-3.878362, -3.43918, 0, 1, -0.5, 0.5, 0.5,
-3.878362, -3.43918, 0, 1, 1.5, 0.5, 0.5,
-3.878362, -3.43918, 0, 0, 1.5, 0.5, 0.5,
-3.878362, -3.43918, 2, 0, -0.5, 0.5, 0.5,
-3.878362, -3.43918, 2, 1, -0.5, 0.5, 0.5,
-3.878362, -3.43918, 2, 1, 1.5, 0.5, 0.5,
-3.878362, -3.43918, 2, 0, 1.5, 0.5, 0.5,
-3.878362, -3.43918, 4, 0, -0.5, 0.5, 0.5,
-3.878362, -3.43918, 4, 1, -0.5, 0.5, 0.5,
-3.878362, -3.43918, 4, 1, 1.5, 0.5, 0.5,
-3.878362, -3.43918, 4, 0, 1.5, 0.5, 0.5
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
-3.394481, -2.984529, -5.360917,
-3.394481, 3.077481, -5.360917,
-3.394481, -2.984529, 5.245623,
-3.394481, 3.077481, 5.245623,
-3.394481, -2.984529, -5.360917,
-3.394481, -2.984529, 5.245623,
-3.394481, 3.077481, -5.360917,
-3.394481, 3.077481, 5.245623,
-3.394481, -2.984529, -5.360917,
3.057268, -2.984529, -5.360917,
-3.394481, -2.984529, 5.245623,
3.057268, -2.984529, 5.245623,
-3.394481, 3.077481, -5.360917,
3.057268, 3.077481, -5.360917,
-3.394481, 3.077481, 5.245623,
3.057268, 3.077481, 5.245623,
3.057268, -2.984529, -5.360917,
3.057268, 3.077481, -5.360917,
3.057268, -2.984529, 5.245623,
3.057268, 3.077481, 5.245623,
3.057268, -2.984529, -5.360917,
3.057268, -2.984529, 5.245623,
3.057268, 3.077481, -5.360917,
3.057268, 3.077481, 5.245623
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
var radius = 7.37728;
var distance = 32.82235;
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
mvMatrix.translate( 0.1686065, -0.04647577, 0.05764699 );
mvMatrix.scale( 1.236325, 1.315811, 0.7520322 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.82235);
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
nitrofluorfen<-read.table("nitrofluorfen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nitrofluorfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitrofluorfen' not found
```

```r
y<-nitrofluorfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitrofluorfen' not found
```

```r
z<-nitrofluorfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitrofluorfen' not found
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
-3.300524, 0.9100415, -2.98801, 0, 0, 1, 1, 1,
-3.164851, -1.139798, -0.266709, 1, 0, 0, 1, 1,
-3.076732, -0.695731, -1.257819, 1, 0, 0, 1, 1,
-2.99791, -0.9376017, -2.180694, 1, 0, 0, 1, 1,
-2.903206, 0.2203667, -1.406738, 1, 0, 0, 1, 1,
-2.728938, -0.4336828, -2.582341, 1, 0, 0, 1, 1,
-2.651289, -0.8552775, -2.435418, 0, 0, 0, 1, 1,
-2.611812, -1.15968, -2.454121, 0, 0, 0, 1, 1,
-2.575273, -2.023622, -1.449792, 0, 0, 0, 1, 1,
-2.560237, -0.7779443, -1.222352, 0, 0, 0, 1, 1,
-2.524451, 0.4062031, -2.245738, 0, 0, 0, 1, 1,
-2.492749, -1.519726, -2.784472, 0, 0, 0, 1, 1,
-2.45419, 0.7138142, -3.111833, 0, 0, 0, 1, 1,
-2.362103, 0.7030416, -2.069209, 1, 1, 1, 1, 1,
-2.326101, 1.079192, -1.338046, 1, 1, 1, 1, 1,
-2.283386, -0.1517569, -2.054797, 1, 1, 1, 1, 1,
-2.271174, 1.35485, -2.056512, 1, 1, 1, 1, 1,
-2.232056, -0.8325401, -3.885668, 1, 1, 1, 1, 1,
-2.229655, -1.413289, -2.010132, 1, 1, 1, 1, 1,
-2.209924, 0.3580522, -1.728435, 1, 1, 1, 1, 1,
-2.178116, -1.103636, -2.412239, 1, 1, 1, 1, 1,
-2.167881, 0.44101, -3.743657, 1, 1, 1, 1, 1,
-2.14853, 0.2690622, -1.245688, 1, 1, 1, 1, 1,
-2.130463, -1.597113, -1.721808, 1, 1, 1, 1, 1,
-2.122016, -0.7624797, -4.541539, 1, 1, 1, 1, 1,
-2.091928, 0.198596, -2.81236, 1, 1, 1, 1, 1,
-2.083534, -0.6998614, -2.286721, 1, 1, 1, 1, 1,
-2.0749, -0.5329244, -2.420225, 1, 1, 1, 1, 1,
-2.054174, -0.183976, -2.248706, 0, 0, 1, 1, 1,
-2.041249, 1.246895, -1.041619, 1, 0, 0, 1, 1,
-2.03984, -2.055058, -3.793977, 1, 0, 0, 1, 1,
-2.028022, -0.1268378, -2.333927, 1, 0, 0, 1, 1,
-1.960323, 0.6753196, -1.599346, 1, 0, 0, 1, 1,
-1.960066, -1.487825, -1.791163, 1, 0, 0, 1, 1,
-1.955507, 0.2010679, -1.180109, 0, 0, 0, 1, 1,
-1.931809, -0.5010622, -0.8118036, 0, 0, 0, 1, 1,
-1.93157, -0.3773781, -2.00618, 0, 0, 0, 1, 1,
-1.89326, -0.04187912, -0.8625087, 0, 0, 0, 1, 1,
-1.885577, -0.2896595, -0.8281289, 0, 0, 0, 1, 1,
-1.879518, -1.816528, -2.798907, 0, 0, 0, 1, 1,
-1.869877, -0.2307391, -2.278223, 0, 0, 0, 1, 1,
-1.847216, -0.1754767, -0.9844494, 1, 1, 1, 1, 1,
-1.840477, -2.015499, -1.973226, 1, 1, 1, 1, 1,
-1.83519, -0.7117874, -2.030864, 1, 1, 1, 1, 1,
-1.807753, 1.457091, -2.321346, 1, 1, 1, 1, 1,
-1.793396, -0.1877384, -2.581947, 1, 1, 1, 1, 1,
-1.793159, -1.379766, -1.201239, 1, 1, 1, 1, 1,
-1.79252, -1.350477, -1.834705, 1, 1, 1, 1, 1,
-1.766446, 0.3388646, -2.155114, 1, 1, 1, 1, 1,
-1.764844, -0.8223692, -1.181899, 1, 1, 1, 1, 1,
-1.758884, -0.4420922, -2.497011, 1, 1, 1, 1, 1,
-1.752206, 1.681132, -1.080142, 1, 1, 1, 1, 1,
-1.722295, -0.1868414, -0.9290842, 1, 1, 1, 1, 1,
-1.706387, 0.09291453, -3.214777, 1, 1, 1, 1, 1,
-1.689004, 0.02397924, -3.526808, 1, 1, 1, 1, 1,
-1.688307, -1.344278, -1.605119, 1, 1, 1, 1, 1,
-1.686913, -0.3575013, -2.07047, 0, 0, 1, 1, 1,
-1.674412, -1.136674, -2.100473, 1, 0, 0, 1, 1,
-1.650838, 1.491594, -1.611516, 1, 0, 0, 1, 1,
-1.625315, 0.5854475, 0.2401384, 1, 0, 0, 1, 1,
-1.62279, 0.01966767, -3.856379, 1, 0, 0, 1, 1,
-1.612706, -0.2667388, -2.688509, 1, 0, 0, 1, 1,
-1.599787, 0.261528, -1.213593, 0, 0, 0, 1, 1,
-1.583119, -0.4483917, -1.854697, 0, 0, 0, 1, 1,
-1.58284, 0.8737534, 0.9758985, 0, 0, 0, 1, 1,
-1.573394, -0.4084405, -2.880554, 0, 0, 0, 1, 1,
-1.557377, -0.137321, -1.889969, 0, 0, 0, 1, 1,
-1.551186, 0.2246955, -1.963225, 0, 0, 0, 1, 1,
-1.546498, -0.0601482, -1.014574, 0, 0, 0, 1, 1,
-1.532187, 0.3466513, -2.796917, 1, 1, 1, 1, 1,
-1.527812, -0.1306312, -2.082672, 1, 1, 1, 1, 1,
-1.520932, -0.8408312, -2.710246, 1, 1, 1, 1, 1,
-1.515627, -0.2228844, -2.020633, 1, 1, 1, 1, 1,
-1.508104, 1.252444, -2.108845, 1, 1, 1, 1, 1,
-1.500706, -0.1738456, 0.0006147448, 1, 1, 1, 1, 1,
-1.49522, 0.3307077, -1.156748, 1, 1, 1, 1, 1,
-1.487737, -0.1515992, -0.8813986, 1, 1, 1, 1, 1,
-1.482188, 0.9954125, -2.805258, 1, 1, 1, 1, 1,
-1.464252, 0.3600954, -2.020183, 1, 1, 1, 1, 1,
-1.457316, 0.6851385, -1.047265, 1, 1, 1, 1, 1,
-1.451651, -0.1636147, -1.801751, 1, 1, 1, 1, 1,
-1.447526, 2.114101, -0.03756281, 1, 1, 1, 1, 1,
-1.44043, -0.8066732, -3.287384, 1, 1, 1, 1, 1,
-1.420357, 0.04964944, -3.278653, 1, 1, 1, 1, 1,
-1.405315, -0.5690665, -2.510295, 0, 0, 1, 1, 1,
-1.402582, -0.6268444, -1.046803, 1, 0, 0, 1, 1,
-1.400893, -0.5023998, 0.111251, 1, 0, 0, 1, 1,
-1.393491, -1.865789, -2.813624, 1, 0, 0, 1, 1,
-1.387221, 0.2396465, -0.9145117, 1, 0, 0, 1, 1,
-1.384282, -0.7560629, -0.9662211, 1, 0, 0, 1, 1,
-1.37268, -0.4550377, -2.64676, 0, 0, 0, 1, 1,
-1.363153, 0.004187935, -1.568928, 0, 0, 0, 1, 1,
-1.359789, -1.356691, -4.211125, 0, 0, 0, 1, 1,
-1.351089, 0.4981608, -4.064039, 0, 0, 0, 1, 1,
-1.335135, -0.8649325, -3.078518, 0, 0, 0, 1, 1,
-1.330922, -1.140268, -2.52886, 0, 0, 0, 1, 1,
-1.311882, 0.4961013, -1.405408, 0, 0, 0, 1, 1,
-1.309007, 1.033258, -0.8417065, 1, 1, 1, 1, 1,
-1.302629, -0.5787481, -2.04069, 1, 1, 1, 1, 1,
-1.297651, 0.4126585, -1.235565, 1, 1, 1, 1, 1,
-1.269325, 0.5935896, 0.1110578, 1, 1, 1, 1, 1,
-1.269246, 1.136689, -2.238881, 1, 1, 1, 1, 1,
-1.242778, -1.350443, -2.270127, 1, 1, 1, 1, 1,
-1.216684, 0.06049805, -1.727341, 1, 1, 1, 1, 1,
-1.21493, -0.05019744, -3.658871, 1, 1, 1, 1, 1,
-1.211492, 0.6863444, -1.023347, 1, 1, 1, 1, 1,
-1.195413, 1.965271, -2.486215, 1, 1, 1, 1, 1,
-1.19365, 0.7863045, -1.931122, 1, 1, 1, 1, 1,
-1.190776, -0.2110905, -2.17104, 1, 1, 1, 1, 1,
-1.173321, -0.468368, -1.715446, 1, 1, 1, 1, 1,
-1.156414, 0.6862299, -1.228741, 1, 1, 1, 1, 1,
-1.153239, 0.2202774, -0.8136738, 1, 1, 1, 1, 1,
-1.150114, -1.647135, -1.188006, 0, 0, 1, 1, 1,
-1.139314, 0.4895317, -0.9038619, 1, 0, 0, 1, 1,
-1.137286, 0.567425, -0.1845204, 1, 0, 0, 1, 1,
-1.135353, -0.6738897, -1.095805, 1, 0, 0, 1, 1,
-1.135134, 0.3964094, -1.631481, 1, 0, 0, 1, 1,
-1.134459, -1.009119, -3.767309, 1, 0, 0, 1, 1,
-1.13264, 0.3327733, -0.6224068, 0, 0, 0, 1, 1,
-1.131399, 0.4826461, -1.156854, 0, 0, 0, 1, 1,
-1.126976, -0.07404552, -2.369477, 0, 0, 0, 1, 1,
-1.125675, -0.6161661, -1.677513, 0, 0, 0, 1, 1,
-1.117475, 2.533168, -0.4368892, 0, 0, 0, 1, 1,
-1.113959, 0.1491997, -1.12607, 0, 0, 0, 1, 1,
-1.111715, -1.372543, -3.895197, 0, 0, 0, 1, 1,
-1.109288, 0.03378176, -1.678599, 1, 1, 1, 1, 1,
-1.105591, -0.1743283, -1.352401, 1, 1, 1, 1, 1,
-1.084719, -0.03025209, -0.8018669, 1, 1, 1, 1, 1,
-1.07804, 1.258525, 0.6916696, 1, 1, 1, 1, 1,
-1.072857, 0.7009889, -0.7522697, 1, 1, 1, 1, 1,
-1.065905, 1.443519, -0.6456702, 1, 1, 1, 1, 1,
-1.062795, 0.290914, -0.4299821, 1, 1, 1, 1, 1,
-1.060342, 0.827217, -1.696271, 1, 1, 1, 1, 1,
-1.059805, -0.7398161, -1.413471, 1, 1, 1, 1, 1,
-1.058869, -0.5835522, -1.742424, 1, 1, 1, 1, 1,
-1.05438, -0.4656609, -2.339736, 1, 1, 1, 1, 1,
-1.044602, 1.589523, 0.05504351, 1, 1, 1, 1, 1,
-1.04027, 0.2594886, -2.038446, 1, 1, 1, 1, 1,
-1.040002, -1.620134, -2.776463, 1, 1, 1, 1, 1,
-1.031675, -0.3094381, -2.982517, 1, 1, 1, 1, 1,
-1.022401, 2.177811, -0.1557334, 0, 0, 1, 1, 1,
-1.019797, -1.62361, -4.062694, 1, 0, 0, 1, 1,
-1.019064, -0.3945573, -1.275074, 1, 0, 0, 1, 1,
-1.00574, -0.6816624, -2.715283, 1, 0, 0, 1, 1,
-0.993053, -0.68718, -2.356195, 1, 0, 0, 1, 1,
-0.9899078, 1.097424, -0.8934793, 1, 0, 0, 1, 1,
-0.9866747, -0.5946886, -2.790892, 0, 0, 0, 1, 1,
-0.9742527, -1.003726, -1.030286, 0, 0, 0, 1, 1,
-0.9732443, -0.1212274, -0.2189607, 0, 0, 0, 1, 1,
-0.9723746, -2.896248, -2.661735, 0, 0, 0, 1, 1,
-0.9714818, -0.8203121, -1.995025, 0, 0, 0, 1, 1,
-0.9671425, 0.3365981, -2.451125, 0, 0, 0, 1, 1,
-0.9582421, -0.2224939, -1.641395, 0, 0, 0, 1, 1,
-0.9467725, 1.025113, -1.43756, 1, 1, 1, 1, 1,
-0.946493, 1.756686, -1.020673, 1, 1, 1, 1, 1,
-0.9395548, -0.3112923, -2.082693, 1, 1, 1, 1, 1,
-0.9394862, 2.474019, 1.230944, 1, 1, 1, 1, 1,
-0.936167, 0.737848, 0.1739936, 1, 1, 1, 1, 1,
-0.9332013, 0.1551136, -0.286445, 1, 1, 1, 1, 1,
-0.930967, -0.8853539, -3.111336, 1, 1, 1, 1, 1,
-0.9173388, -1.305207, -2.383917, 1, 1, 1, 1, 1,
-0.9167538, 0.530367, -0.4621916, 1, 1, 1, 1, 1,
-0.9165617, -1.903487, -2.463696, 1, 1, 1, 1, 1,
-0.9162627, 1.936968, -0.01185144, 1, 1, 1, 1, 1,
-0.9154425, 1.35356, -0.5250461, 1, 1, 1, 1, 1,
-0.9079058, -1.118025, -1.872922, 1, 1, 1, 1, 1,
-0.9037802, 1.616099, -0.7005727, 1, 1, 1, 1, 1,
-0.8979942, 0.1970281, -1.866449, 1, 1, 1, 1, 1,
-0.8927149, -0.3117912, -2.93695, 0, 0, 1, 1, 1,
-0.8892644, -0.3505098, -2.383469, 1, 0, 0, 1, 1,
-0.8872645, 0.7808252, -1.642989, 1, 0, 0, 1, 1,
-0.8848292, -1.817371, -2.51891, 1, 0, 0, 1, 1,
-0.8836268, 1.147168, -0.7726889, 1, 0, 0, 1, 1,
-0.8798196, 1.199501, -0.7520671, 1, 0, 0, 1, 1,
-0.8768901, -0.367148, -0.702051, 0, 0, 0, 1, 1,
-0.8767219, 0.7214966, -0.7775172, 0, 0, 0, 1, 1,
-0.8749911, 0.2043095, -1.156421, 0, 0, 0, 1, 1,
-0.8681962, 0.428825, -0.8902479, 0, 0, 0, 1, 1,
-0.8649029, -2.095683, -4.193452, 0, 0, 0, 1, 1,
-0.8590728, -1.337062, -1.095187, 0, 0, 0, 1, 1,
-0.85514, -1.692204, -2.670224, 0, 0, 0, 1, 1,
-0.85201, -0.03919671, -2.177031, 1, 1, 1, 1, 1,
-0.8500916, -2.551507, -1.503794, 1, 1, 1, 1, 1,
-0.8465288, 1.398628, -0.8714138, 1, 1, 1, 1, 1,
-0.8454526, 1.168171, 1.202973, 1, 1, 1, 1, 1,
-0.8358029, -0.8447192, -1.666904, 1, 1, 1, 1, 1,
-0.8326023, -0.2051967, -3.605954, 1, 1, 1, 1, 1,
-0.8235142, -1.801592, -4.107953, 1, 1, 1, 1, 1,
-0.8215162, -0.6615914, -1.616056, 1, 1, 1, 1, 1,
-0.8157102, 0.476834, -1.965734, 1, 1, 1, 1, 1,
-0.8134884, 0.1186639, -0.9479836, 1, 1, 1, 1, 1,
-0.8112137, 1.462297, -0.6224956, 1, 1, 1, 1, 1,
-0.8098372, -0.4938785, -2.767007, 1, 1, 1, 1, 1,
-0.8012081, 0.1735346, -2.034101, 1, 1, 1, 1, 1,
-0.7989081, 1.144463, -2.285675, 1, 1, 1, 1, 1,
-0.7981792, -1.257821, -0.9653634, 1, 1, 1, 1, 1,
-0.7956876, 0.4123863, 0.2300492, 0, 0, 1, 1, 1,
-0.7921623, 0.6121265, 0.1889013, 1, 0, 0, 1, 1,
-0.7847656, -1.309661, -3.140259, 1, 0, 0, 1, 1,
-0.7841731, 0.2378158, -0.6528711, 1, 0, 0, 1, 1,
-0.7838306, 1.134838, -1.051922, 1, 0, 0, 1, 1,
-0.7795426, -1.8144, -3.781, 1, 0, 0, 1, 1,
-0.7731112, 0.6886015, -2.745793, 0, 0, 0, 1, 1,
-0.7667226, 2.602221, 0.228001, 0, 0, 0, 1, 1,
-0.7659395, 0.7016822, -0.1826673, 0, 0, 0, 1, 1,
-0.7625531, 0.6219094, -0.4936621, 0, 0, 0, 1, 1,
-0.7494172, 0.7930618, -1.563657, 0, 0, 0, 1, 1,
-0.7485805, -0.4141858, -3.588413, 0, 0, 0, 1, 1,
-0.7481355, 1.013658, 0.2618154, 0, 0, 0, 1, 1,
-0.7470324, -0.06379002, -1.59266, 1, 1, 1, 1, 1,
-0.7396539, -0.1315428, -2.072089, 1, 1, 1, 1, 1,
-0.7324345, -0.1336839, -1.430445, 1, 1, 1, 1, 1,
-0.7312846, 1.285899, -0.9425963, 1, 1, 1, 1, 1,
-0.7252795, 0.6012543, -2.444571, 1, 1, 1, 1, 1,
-0.7234175, -0.2562253, -2.362968, 1, 1, 1, 1, 1,
-0.7210976, -0.6043875, -1.186899, 1, 1, 1, 1, 1,
-0.7206989, -0.0643545, -2.187317, 1, 1, 1, 1, 1,
-0.7185461, -0.6394693, -2.55758, 1, 1, 1, 1, 1,
-0.7170224, -1.170354, -2.92987, 1, 1, 1, 1, 1,
-0.7160505, -0.568256, -1.358036, 1, 1, 1, 1, 1,
-0.7129024, -0.3684138, -2.212256, 1, 1, 1, 1, 1,
-0.7105793, 0.9464492, -0.4082858, 1, 1, 1, 1, 1,
-0.7090743, 0.8061742, -1.492757, 1, 1, 1, 1, 1,
-0.7082171, -0.4008089, -0.3417109, 1, 1, 1, 1, 1,
-0.7026583, 0.9861061, 0.490602, 0, 0, 1, 1, 1,
-0.7019203, -0.3444597, -2.74518, 1, 0, 0, 1, 1,
-0.7013675, 0.6797509, -1.682219, 1, 0, 0, 1, 1,
-0.6969504, -0.1526739, -2.479907, 1, 0, 0, 1, 1,
-0.6944069, -1.431538, -2.271958, 1, 0, 0, 1, 1,
-0.6938992, 0.805096, 0.007886718, 1, 0, 0, 1, 1,
-0.6933426, 0.3421682, -0.4053533, 0, 0, 0, 1, 1,
-0.685811, -1.410395, -2.27223, 0, 0, 0, 1, 1,
-0.6849012, 0.8985853, -0.9094608, 0, 0, 0, 1, 1,
-0.6845135, 0.2302976, 0.06372076, 0, 0, 0, 1, 1,
-0.6813675, 0.5922401, -1.558316, 0, 0, 0, 1, 1,
-0.6796684, -0.940436, -1.133305, 0, 0, 0, 1, 1,
-0.6770563, 1.160148, -0.3135305, 0, 0, 0, 1, 1,
-0.676055, -0.1243268, -1.775376, 1, 1, 1, 1, 1,
-0.6725401, -0.2233916, -1.562767, 1, 1, 1, 1, 1,
-0.6672788, -0.9193164, -1.855799, 1, 1, 1, 1, 1,
-0.6670189, -0.5829222, -3.621926, 1, 1, 1, 1, 1,
-0.6550471, -0.8558791, -2.149143, 1, 1, 1, 1, 1,
-0.6545097, -1.639145, -1.315437, 1, 1, 1, 1, 1,
-0.6543033, -0.8249428, -1.997775, 1, 1, 1, 1, 1,
-0.6531658, -0.1296649, -0.8071273, 1, 1, 1, 1, 1,
-0.6511981, 1.200659, -0.7634694, 1, 1, 1, 1, 1,
-0.6502304, -0.2900841, -2.519803, 1, 1, 1, 1, 1,
-0.6484724, -1.704831, -3.701973, 1, 1, 1, 1, 1,
-0.647934, 0.3425509, -1.886327, 1, 1, 1, 1, 1,
-0.6465728, -0.1830876, -2.357037, 1, 1, 1, 1, 1,
-0.6461684, -0.160761, -3.442822, 1, 1, 1, 1, 1,
-0.6442929, 0.8959292, -2.417101, 1, 1, 1, 1, 1,
-0.6432907, -0.440291, -3.21711, 0, 0, 1, 1, 1,
-0.6396868, 0.6840954, 0.1812214, 1, 0, 0, 1, 1,
-0.6322191, 0.2873499, -2.545478, 1, 0, 0, 1, 1,
-0.6233649, 0.02577618, -1.21235, 1, 0, 0, 1, 1,
-0.6227213, 0.9444495, -1.06291, 1, 0, 0, 1, 1,
-0.6222473, 1.349365, -2.047929, 1, 0, 0, 1, 1,
-0.6196042, 1.522073, -0.1993722, 0, 0, 0, 1, 1,
-0.6154757, -0.4175991, -3.043954, 0, 0, 0, 1, 1,
-0.6119723, -0.404784, -2.105514, 0, 0, 0, 1, 1,
-0.6116726, 0.5267172, 0.618089, 0, 0, 0, 1, 1,
-0.6108892, 0.2802809, -2.304809, 0, 0, 0, 1, 1,
-0.6084841, 0.04307412, -0.9019729, 0, 0, 0, 1, 1,
-0.6028321, -1.184019, -4.122342, 0, 0, 0, 1, 1,
-0.6023946, -0.008728852, -2.552555, 1, 1, 1, 1, 1,
-0.6016759, -0.3870826, -1.568685, 1, 1, 1, 1, 1,
-0.5983151, -1.113506, -2.874101, 1, 1, 1, 1, 1,
-0.5970564, -0.789223, -0.8321769, 1, 1, 1, 1, 1,
-0.5961757, -1.112982, -0.1841849, 1, 1, 1, 1, 1,
-0.5955768, -0.05385578, -2.029737, 1, 1, 1, 1, 1,
-0.5953491, 0.3026855, -0.9740535, 1, 1, 1, 1, 1,
-0.5892749, -0.3172474, -3.490468, 1, 1, 1, 1, 1,
-0.5853794, -1.434141, -3.482028, 1, 1, 1, 1, 1,
-0.5850415, 0.2973222, -1.234583, 1, 1, 1, 1, 1,
-0.5807801, -0.4599679, -2.718554, 1, 1, 1, 1, 1,
-0.5806275, 1.247694, -2.276368, 1, 1, 1, 1, 1,
-0.5798327, 0.8705176, 0.8968052, 1, 1, 1, 1, 1,
-0.5770817, 0.430646, 0.02206033, 1, 1, 1, 1, 1,
-0.5751833, 0.08384389, -0.2347771, 1, 1, 1, 1, 1,
-0.5687101, 1.550452, 0.5602143, 0, 0, 1, 1, 1,
-0.5684108, -1.410252, -3.984408, 1, 0, 0, 1, 1,
-0.5670083, 1.795072, -0.2665642, 1, 0, 0, 1, 1,
-0.5641068, -1.641446, -2.473277, 1, 0, 0, 1, 1,
-0.560268, 0.1391938, -2.525788, 1, 0, 0, 1, 1,
-0.5585549, -1.003005, -4.811028, 1, 0, 0, 1, 1,
-0.5584862, -0.2059612, -1.200578, 0, 0, 0, 1, 1,
-0.5576754, -0.4945225, -2.492005, 0, 0, 0, 1, 1,
-0.5558453, -0.3683258, -2.015675, 0, 0, 0, 1, 1,
-0.5557849, -1.797722, -3.190033, 0, 0, 0, 1, 1,
-0.554309, -1.649436, -2.142928, 0, 0, 0, 1, 1,
-0.5540996, -0.8445741, -3.423573, 0, 0, 0, 1, 1,
-0.5505317, 1.179336, 0.7294272, 0, 0, 0, 1, 1,
-0.5471593, -0.3389064, -2.630657, 1, 1, 1, 1, 1,
-0.5459421, -0.9580339, -2.123081, 1, 1, 1, 1, 1,
-0.5441297, -1.997806, -3.111711, 1, 1, 1, 1, 1,
-0.5424696, 0.3317831, -1.328037, 1, 1, 1, 1, 1,
-0.5410517, 0.3956291, 0.6907001, 1, 1, 1, 1, 1,
-0.5341718, 0.005526951, -2.423311, 1, 1, 1, 1, 1,
-0.5324231, -0.6161395, -3.482948, 1, 1, 1, 1, 1,
-0.5252955, 0.8995743, -0.04175472, 1, 1, 1, 1, 1,
-0.5242395, -1.363809, -2.195954, 1, 1, 1, 1, 1,
-0.5204196, 0.668144, -2.023958, 1, 1, 1, 1, 1,
-0.5190156, -0.4727839, -1.94209, 1, 1, 1, 1, 1,
-0.5179923, -1.003376, -3.357514, 1, 1, 1, 1, 1,
-0.5156168, 1.21617, 0.9813024, 1, 1, 1, 1, 1,
-0.5145981, -0.1324178, -1.752686, 1, 1, 1, 1, 1,
-0.5116583, 0.2682222, -0.4644921, 1, 1, 1, 1, 1,
-0.5092599, -0.09591883, -1.892506, 0, 0, 1, 1, 1,
-0.5075466, 0.4166462, -1.398271, 1, 0, 0, 1, 1,
-0.5026919, 0.1350155, -1.283304, 1, 0, 0, 1, 1,
-0.4960448, -1.149021, -1.615188, 1, 0, 0, 1, 1,
-0.4957068, -0.4753838, -2.102693, 1, 0, 0, 1, 1,
-0.4906496, -0.442133, -1.582656, 1, 0, 0, 1, 1,
-0.4906075, -0.2656318, 0.9294759, 0, 0, 0, 1, 1,
-0.4883415, -1.03016, -1.159388, 0, 0, 0, 1, 1,
-0.4865526, 2.402554, 0.454631, 0, 0, 0, 1, 1,
-0.4834892, 0.3727745, 0.04440087, 0, 0, 0, 1, 1,
-0.4834579, 0.7861978, -0.1311806, 0, 0, 0, 1, 1,
-0.4791115, 0.07906855, -2.040224, 0, 0, 0, 1, 1,
-0.4732467, -1.352729, -5.206453, 0, 0, 0, 1, 1,
-0.4721475, -0.08026259, -2.329102, 1, 1, 1, 1, 1,
-0.4720246, -1.141744, -2.83442, 1, 1, 1, 1, 1,
-0.4588388, 0.1852016, -0.9269873, 1, 1, 1, 1, 1,
-0.4471985, 1.250322, -1.504904, 1, 1, 1, 1, 1,
-0.4440601, -0.3945827, -1.851282, 1, 1, 1, 1, 1,
-0.4428885, -0.4207976, -1.607093, 1, 1, 1, 1, 1,
-0.4339889, 0.4169139, -0.3408049, 1, 1, 1, 1, 1,
-0.4274876, 0.06063188, -1.175933, 1, 1, 1, 1, 1,
-0.4262544, 0.1099817, 0.3489691, 1, 1, 1, 1, 1,
-0.4254586, -0.4460772, -2.382757, 1, 1, 1, 1, 1,
-0.4227613, -0.07540847, -2.826696, 1, 1, 1, 1, 1,
-0.4210621, -1.073804, -3.231145, 1, 1, 1, 1, 1,
-0.417097, -1.016965, -2.748331, 1, 1, 1, 1, 1,
-0.4141338, -0.301762, -2.775749, 1, 1, 1, 1, 1,
-0.4123015, -0.9063281, -2.847812, 1, 1, 1, 1, 1,
-0.4089507, -1.416041, -3.141385, 0, 0, 1, 1, 1,
-0.4061994, 0.7570695, -1.338192, 1, 0, 0, 1, 1,
-0.4042791, -0.5110796, -3.186384, 1, 0, 0, 1, 1,
-0.4035291, 0.1466436, -1.416491, 1, 0, 0, 1, 1,
-0.401176, -0.2743241, -3.552802, 1, 0, 0, 1, 1,
-0.3988653, 0.5928941, -2.018516, 1, 0, 0, 1, 1,
-0.3960775, -0.6149471, -0.8621475, 0, 0, 0, 1, 1,
-0.3947261, -0.1281637, -1.609676, 0, 0, 0, 1, 1,
-0.3941385, -0.8030336, -2.805727, 0, 0, 0, 1, 1,
-0.3853852, -0.680777, -3.242541, 0, 0, 0, 1, 1,
-0.3850817, 0.6155975, -0.4061573, 0, 0, 0, 1, 1,
-0.3832685, 0.04750652, -0.2214692, 0, 0, 0, 1, 1,
-0.3822891, 0.9802017, -0.4550103, 0, 0, 0, 1, 1,
-0.3804637, -0.555127, -2.6118, 1, 1, 1, 1, 1,
-0.3785279, 0.318616, -1.560418, 1, 1, 1, 1, 1,
-0.378184, -2.857977, -3.081316, 1, 1, 1, 1, 1,
-0.3769763, 2.027561, -2.074637, 1, 1, 1, 1, 1,
-0.37228, 0.3539769, -1.017603, 1, 1, 1, 1, 1,
-0.368678, -0.3022594, 0.2311884, 1, 1, 1, 1, 1,
-0.3651008, -2.207004, -3.153158, 1, 1, 1, 1, 1,
-0.360562, -0.4868108, -2.756733, 1, 1, 1, 1, 1,
-0.3597885, 0.3143049, -0.7208589, 1, 1, 1, 1, 1,
-0.3584533, 0.1569282, -1.491285, 1, 1, 1, 1, 1,
-0.357271, 0.5693235, -2.377776, 1, 1, 1, 1, 1,
-0.3552345, 1.043624, -1.211795, 1, 1, 1, 1, 1,
-0.3508441, -0.4929451, -4.063585, 1, 1, 1, 1, 1,
-0.3486381, 0.3315655, -1.852445, 1, 1, 1, 1, 1,
-0.3460571, -1.230416, -1.842699, 1, 1, 1, 1, 1,
-0.3451987, -0.3989921, -2.476679, 0, 0, 1, 1, 1,
-0.3406587, -1.402613, -4.9215, 1, 0, 0, 1, 1,
-0.3384063, -0.781949, -2.189641, 1, 0, 0, 1, 1,
-0.3377103, -1.543433, -1.9535, 1, 0, 0, 1, 1,
-0.3369691, -1.270472, -4.072361, 1, 0, 0, 1, 1,
-0.334285, 1.761504, 0.060963, 1, 0, 0, 1, 1,
-0.3320827, 0.8860752, 0.1574705, 0, 0, 0, 1, 1,
-0.3318966, -0.3614951, -1.830545, 0, 0, 0, 1, 1,
-0.3268557, -1.075036, -2.198091, 0, 0, 0, 1, 1,
-0.3233413, 0.1982016, -0.1020839, 0, 0, 0, 1, 1,
-0.3225446, -1.315933, -4.039073, 0, 0, 0, 1, 1,
-0.3203813, -0.3218002, -4.027794, 0, 0, 0, 1, 1,
-0.3191145, 1.073755, -1.127375, 0, 0, 0, 1, 1,
-0.3181308, -0.9579289, -1.768411, 1, 1, 1, 1, 1,
-0.3160086, 2.026034, -1.962437, 1, 1, 1, 1, 1,
-0.3142914, -1.057945, -3.727449, 1, 1, 1, 1, 1,
-0.3125011, 1.274013, 0.9965267, 1, 1, 1, 1, 1,
-0.3089605, -0.3493115, -1.924715, 1, 1, 1, 1, 1,
-0.3047088, 0.5141463, 0.6432077, 1, 1, 1, 1, 1,
-0.3040874, 1.623276, 0.7253758, 1, 1, 1, 1, 1,
-0.3015954, -1.507798, -0.3722453, 1, 1, 1, 1, 1,
-0.30096, 0.9827125, -1.286898, 1, 1, 1, 1, 1,
-0.2859253, -1.549012, -4.611569, 1, 1, 1, 1, 1,
-0.2817709, 0.120269, -0.7331946, 1, 1, 1, 1, 1,
-0.2798123, -1.969409, -1.944463, 1, 1, 1, 1, 1,
-0.2759333, 0.2378207, -2.263347, 1, 1, 1, 1, 1,
-0.2734765, 0.3467577, -1.556457, 1, 1, 1, 1, 1,
-0.2688527, -0.2299015, -1.680123, 1, 1, 1, 1, 1,
-0.268648, -0.08270705, -1.390742, 0, 0, 1, 1, 1,
-0.2680378, 0.6603925, -0.3181703, 1, 0, 0, 1, 1,
-0.2648382, -0.9359795, -2.231325, 1, 0, 0, 1, 1,
-0.2644214, -0.8283119, -3.385062, 1, 0, 0, 1, 1,
-0.2625211, 0.8402253, 0.6940423, 1, 0, 0, 1, 1,
-0.2601293, -0.6848797, -2.881427, 1, 0, 0, 1, 1,
-0.2595022, 0.4108265, 0.517715, 0, 0, 0, 1, 1,
-0.2556756, 1.14058, 1.602156, 0, 0, 0, 1, 1,
-0.2530436, -1.09062, -2.925356, 0, 0, 0, 1, 1,
-0.2493034, 0.01787112, -1.96858, 0, 0, 0, 1, 1,
-0.2359363, 1.599807, 0.1085071, 0, 0, 0, 1, 1,
-0.2347305, 0.3946176, -0.7517934, 0, 0, 0, 1, 1,
-0.2314337, 0.8608413, 0.7050161, 0, 0, 0, 1, 1,
-0.2271872, -0.4128311, -2.40927, 1, 1, 1, 1, 1,
-0.2241408, 0.3752617, -1.420945, 1, 1, 1, 1, 1,
-0.2237125, 0.2394227, -1.979604, 1, 1, 1, 1, 1,
-0.2236675, 1.05663, -1.259833, 1, 1, 1, 1, 1,
-0.2188139, 0.1422838, -1.412643, 1, 1, 1, 1, 1,
-0.2174194, -0.428542, -4.978671, 1, 1, 1, 1, 1,
-0.2148704, -1.435956, -4.348985, 1, 1, 1, 1, 1,
-0.2060221, -0.07562444, -4.367105, 1, 1, 1, 1, 1,
-0.1965227, -0.4028488, -1.719729, 1, 1, 1, 1, 1,
-0.1960585, 1.045463, -1.530766, 1, 1, 1, 1, 1,
-0.1945182, 1.384922, 0.3680156, 1, 1, 1, 1, 1,
-0.1928858, -0.2618799, -1.869637, 1, 1, 1, 1, 1,
-0.1909103, 0.187171, -1.573017, 1, 1, 1, 1, 1,
-0.1896812, -0.4522848, -3.777585, 1, 1, 1, 1, 1,
-0.1867637, 0.1398704, -2.453224, 1, 1, 1, 1, 1,
-0.186472, -0.3861832, -2.740164, 0, 0, 1, 1, 1,
-0.1863146, -0.1752394, -2.155681, 1, 0, 0, 1, 1,
-0.1859615, -0.07339779, -0.8560765, 1, 0, 0, 1, 1,
-0.1834185, 0.6023534, -0.4814053, 1, 0, 0, 1, 1,
-0.1774506, -0.3610058, -2.323051, 1, 0, 0, 1, 1,
-0.1761252, -1.532114, -3.796997, 1, 0, 0, 1, 1,
-0.1731677, -0.1968844, -2.844039, 0, 0, 0, 1, 1,
-0.1710298, 0.1429947, -0.532484, 0, 0, 0, 1, 1,
-0.1706868, 1.132655, 0.4551846, 0, 0, 0, 1, 1,
-0.1659372, 0.1780587, -1.857597, 0, 0, 0, 1, 1,
-0.1656774, -0.6758093, -2.729562, 0, 0, 0, 1, 1,
-0.1626244, 0.8576924, 1.34771, 0, 0, 0, 1, 1,
-0.156997, -0.3214565, -3.721899, 0, 0, 0, 1, 1,
-0.1553967, 1.699382, -0.6226751, 1, 1, 1, 1, 1,
-0.1548774, -1.066207, -3.437974, 1, 1, 1, 1, 1,
-0.1547621, -1.151658, -3.107242, 1, 1, 1, 1, 1,
-0.1532439, -0.6083568, -4.774592, 1, 1, 1, 1, 1,
-0.1494863, -0.9678845, -3.837892, 1, 1, 1, 1, 1,
-0.1430999, -0.7366505, -4.479656, 1, 1, 1, 1, 1,
-0.1420722, -0.09246229, -1.898566, 1, 1, 1, 1, 1,
-0.1412407, -2.01508, -2.8032, 1, 1, 1, 1, 1,
-0.1394536, -0.9318115, -1.883876, 1, 1, 1, 1, 1,
-0.1335612, -1.200629, -2.496656, 1, 1, 1, 1, 1,
-0.1324114, 0.4113612, -0.1217279, 1, 1, 1, 1, 1,
-0.1312407, -0.2091985, -1.318406, 1, 1, 1, 1, 1,
-0.1263583, 0.4004613, 0.3248509, 1, 1, 1, 1, 1,
-0.1219806, -1.091337, -0.6165238, 1, 1, 1, 1, 1,
-0.1219579, 0.6384692, 0.1630842, 1, 1, 1, 1, 1,
-0.1188837, 1.602515, -1.509797, 0, 0, 1, 1, 1,
-0.1187048, 1.044689, 0.3455873, 1, 0, 0, 1, 1,
-0.117737, -1.147457, -4.059936, 1, 0, 0, 1, 1,
-0.1172343, 1.456868, -0.8893992, 1, 0, 0, 1, 1,
-0.1113004, 0.4702654, 0.2900456, 1, 0, 0, 1, 1,
-0.1103899, 2.175342, 0.3105277, 1, 0, 0, 1, 1,
-0.104406, 0.5138531, 1.248729, 0, 0, 0, 1, 1,
-0.1017278, -0.5037337, -3.749269, 0, 0, 0, 1, 1,
-0.1014964, -0.3698999, -3.923971, 0, 0, 0, 1, 1,
-0.0998313, 0.06058091, -1.293883, 0, 0, 0, 1, 1,
-0.09747457, -0.9381227, -2.722319, 0, 0, 0, 1, 1,
-0.09740932, -2.237583, -4.810557, 0, 0, 0, 1, 1,
-0.09732238, 0.4289316, 1.28984, 0, 0, 0, 1, 1,
-0.09508656, -0.7166768, -2.542867, 1, 1, 1, 1, 1,
-0.0931539, 0.3824954, 0.2967716, 1, 1, 1, 1, 1,
-0.09180653, -0.01155028, -0.3430312, 1, 1, 1, 1, 1,
-0.08980714, -0.4210477, -2.158839, 1, 1, 1, 1, 1,
-0.08961976, 0.8546495, 0.03082785, 1, 1, 1, 1, 1,
-0.08893692, -0.1667456, -1.855571, 1, 1, 1, 1, 1,
-0.08697509, -1.21856, -1.919847, 1, 1, 1, 1, 1,
-0.08298471, 0.09313002, -0.7197418, 1, 1, 1, 1, 1,
-0.07490095, 0.1548301, -0.07874195, 1, 1, 1, 1, 1,
-0.07362259, 1.012263, -1.94881, 1, 1, 1, 1, 1,
-0.07355957, 1.0707, 0.1461459, 1, 1, 1, 1, 1,
-0.06910864, -1.432593, -4.762057, 1, 1, 1, 1, 1,
-0.06685713, 0.04967163, -0.6135637, 1, 1, 1, 1, 1,
-0.06383424, -0.6397979, -1.935974, 1, 1, 1, 1, 1,
-0.06250518, -1.332171, -3.515031, 1, 1, 1, 1, 1,
-0.06025471, -1.619824, -2.976574, 0, 0, 1, 1, 1,
-0.05415755, -0.3766262, -1.709913, 1, 0, 0, 1, 1,
-0.05310511, -0.01416214, -1.133795, 1, 0, 0, 1, 1,
-0.0506513, 0.1291675, 1.334485, 1, 0, 0, 1, 1,
-0.04656679, -0.3254014, -1.644547, 1, 0, 0, 1, 1,
-0.04628482, 0.5262368, -0.6862752, 1, 0, 0, 1, 1,
-0.04270989, -1.245898, -2.242493, 0, 0, 0, 1, 1,
-0.03802992, 0.3902886, -1.368921, 0, 0, 0, 1, 1,
-0.03760382, 1.613741, -1.160684, 0, 0, 0, 1, 1,
-0.03208325, -0.2370747, -2.447725, 0, 0, 0, 1, 1,
-0.02091652, -0.7001566, -1.852916, 0, 0, 0, 1, 1,
-0.02055678, 1.177751, -0.04099449, 0, 0, 0, 1, 1,
-0.01650823, -0.01126456, -4.715124, 0, 0, 0, 1, 1,
-0.01287103, 0.9623019, -0.1198718, 1, 1, 1, 1, 1,
-0.01272825, 0.03682273, 0.1458844, 1, 1, 1, 1, 1,
-0.01035115, -0.03674787, -1.957388, 1, 1, 1, 1, 1,
-0.01029631, 0.4949566, 1.258866, 1, 1, 1, 1, 1,
-0.008448388, 0.7736979, 0.6644505, 1, 1, 1, 1, 1,
-0.004242175, 1.317001, 0.3744741, 1, 1, 1, 1, 1,
-0.003588638, 0.2600137, 0.4458191, 1, 1, 1, 1, 1,
-0.0002027216, 1.438566, -1.747067, 1, 1, 1, 1, 1,
0.003490683, 0.6526743, -0.4140174, 1, 1, 1, 1, 1,
0.004003958, -0.7794507, 3.385178, 1, 1, 1, 1, 1,
0.007913329, -0.05998612, 3.545642, 1, 1, 1, 1, 1,
0.008907471, -0.7834491, 3.132766, 1, 1, 1, 1, 1,
0.01283528, -0.5110127, 4.536436, 1, 1, 1, 1, 1,
0.01375814, -1.202631, 4.926889, 1, 1, 1, 1, 1,
0.01628564, -0.8590546, 1.662167, 1, 1, 1, 1, 1,
0.01741798, -0.350852, 3.431708, 0, 0, 1, 1, 1,
0.01853865, 0.4903097, -0.04723132, 1, 0, 0, 1, 1,
0.02892089, -1.174639, 3.534751, 1, 0, 0, 1, 1,
0.03745086, 0.7429135, 0.471441, 1, 0, 0, 1, 1,
0.04062814, 0.1458234, -1.565204, 1, 0, 0, 1, 1,
0.04201258, 0.7862512, 0.4736227, 1, 0, 0, 1, 1,
0.04286163, 0.09064008, 0.6932593, 0, 0, 0, 1, 1,
0.04360792, 0.3371399, 0.8934484, 0, 0, 0, 1, 1,
0.04388347, -0.05304587, 1.239922, 0, 0, 0, 1, 1,
0.0446707, -0.9640425, 3.151489, 0, 0, 0, 1, 1,
0.04531033, 0.08395573, -0.4197367, 0, 0, 0, 1, 1,
0.04616869, 0.8760285, -0.7973231, 0, 0, 0, 1, 1,
0.04704913, 0.5213485, -0.7662469, 0, 0, 0, 1, 1,
0.05382927, 0.9145594, 0.03613248, 1, 1, 1, 1, 1,
0.05856337, 0.9102376, 1.161776, 1, 1, 1, 1, 1,
0.05928743, 0.3211266, 2.584028, 1, 1, 1, 1, 1,
0.05942585, 0.08495811, -0.09963811, 1, 1, 1, 1, 1,
0.06544676, 1.954012, -0.5152352, 1, 1, 1, 1, 1,
0.06565959, 1.654519, -1.722635, 1, 1, 1, 1, 1,
0.06777968, -1.229662, 3.691624, 1, 1, 1, 1, 1,
0.06905925, -0.2944839, 2.752926, 1, 1, 1, 1, 1,
0.0713551, -1.460918, 2.200908, 1, 1, 1, 1, 1,
0.07685583, 2.958906, -2.085425, 1, 1, 1, 1, 1,
0.07781688, -0.6338341, 1.90836, 1, 1, 1, 1, 1,
0.08330214, -0.3607522, 1.705023, 1, 1, 1, 1, 1,
0.08418753, 0.03613724, 0.7622183, 1, 1, 1, 1, 1,
0.08540399, 0.8151608, -1.131248, 1, 1, 1, 1, 1,
0.09251701, 0.2304899, 0.3964542, 1, 1, 1, 1, 1,
0.09441833, -2.504474, 4.869218, 0, 0, 1, 1, 1,
0.09618668, -1.06925, 4.784566, 1, 0, 0, 1, 1,
0.09818796, 0.5446257, -0.3792858, 1, 0, 0, 1, 1,
0.1003566, 0.487816, 1.211425, 1, 0, 0, 1, 1,
0.1009507, -1.933326, 4.533822, 1, 0, 0, 1, 1,
0.1070638, -0.6023588, 4.004493, 1, 0, 0, 1, 1,
0.1094775, -1.39361, 3.196498, 0, 0, 0, 1, 1,
0.1114097, 0.7101075, -0.6513435, 0, 0, 0, 1, 1,
0.1121598, 0.2602268, 3.828549, 0, 0, 0, 1, 1,
0.1125672, 1.467472, -0.9500264, 0, 0, 0, 1, 1,
0.113269, -0.264996, 1.242541, 0, 0, 0, 1, 1,
0.1134642, -1.251356, 4.510437, 0, 0, 0, 1, 1,
0.114886, -0.5302785, 2.489663, 0, 0, 0, 1, 1,
0.1184113, -1.624455, 4.388557, 1, 1, 1, 1, 1,
0.1206393, -0.1468906, 2.77755, 1, 1, 1, 1, 1,
0.1233737, 0.8415784, -0.2886589, 1, 1, 1, 1, 1,
0.1251937, 1.153185, 3.352219, 1, 1, 1, 1, 1,
0.1252808, 0.9216723, 0.2749823, 1, 1, 1, 1, 1,
0.1281502, -1.365149, 2.710141, 1, 1, 1, 1, 1,
0.1281961, -0.09730168, 3.196101, 1, 1, 1, 1, 1,
0.1293093, -1.644929, 1.390658, 1, 1, 1, 1, 1,
0.1418346, -1.508996, 3.534551, 1, 1, 1, 1, 1,
0.1436894, -1.357607, 2.674729, 1, 1, 1, 1, 1,
0.1471258, -1.058735, 3.269593, 1, 1, 1, 1, 1,
0.1471904, -1.161531, 2.953249, 1, 1, 1, 1, 1,
0.1510269, 0.798286, 1.2769, 1, 1, 1, 1, 1,
0.1523669, 0.2874431, 0.2447491, 1, 1, 1, 1, 1,
0.1534101, 0.4125464, 0.4097289, 1, 1, 1, 1, 1,
0.1579379, -0.1491033, 3.891103, 0, 0, 1, 1, 1,
0.1581035, -0.5088228, 2.636292, 1, 0, 0, 1, 1,
0.1585912, 0.3172452, 0.4659222, 1, 0, 0, 1, 1,
0.1627712, 1.049861, -0.5410503, 1, 0, 0, 1, 1,
0.1640033, 1.997243, -0.0570096, 1, 0, 0, 1, 1,
0.1652294, 0.5212344, -0.1300445, 1, 0, 0, 1, 1,
0.1669321, 1.727435, 0.6158891, 0, 0, 0, 1, 1,
0.1669898, -0.07541723, 1.196218, 0, 0, 0, 1, 1,
0.1702846, 0.7564312, -0.5807365, 0, 0, 0, 1, 1,
0.1716855, 0.7053788, 0.04473783, 0, 0, 0, 1, 1,
0.173078, -1.531786, 3.131319, 0, 0, 0, 1, 1,
0.1753514, -0.757017, 2.46571, 0, 0, 0, 1, 1,
0.178097, 0.8035734, -0.3941087, 0, 0, 0, 1, 1,
0.1796187, -0.4240978, 3.34888, 1, 1, 1, 1, 1,
0.1804879, 0.3607481, -0.4322129, 1, 1, 1, 1, 1,
0.1808321, -1.374483, 0.4102826, 1, 1, 1, 1, 1,
0.1823527, 0.5461847, 0.1489705, 1, 1, 1, 1, 1,
0.1859579, 0.3341354, -0.7126971, 1, 1, 1, 1, 1,
0.1888617, -1.133504, 5.091159, 1, 1, 1, 1, 1,
0.1891993, 0.8677806, 0.2700338, 1, 1, 1, 1, 1,
0.1906254, -0.6575321, 3.075529, 1, 1, 1, 1, 1,
0.192771, 1.19399, 0.6259415, 1, 1, 1, 1, 1,
0.1935462, 0.5224861, 0.4119856, 1, 1, 1, 1, 1,
0.1942599, -1.887162, 3.575971, 1, 1, 1, 1, 1,
0.1985511, 0.9836533, 0.5537741, 1, 1, 1, 1, 1,
0.2017266, -1.9136, 4.690229, 1, 1, 1, 1, 1,
0.208874, 0.2394856, 0.6498827, 1, 1, 1, 1, 1,
0.213481, -0.5927134, 3.86664, 1, 1, 1, 1, 1,
0.2134873, -1.787577, 2.701986, 0, 0, 1, 1, 1,
0.2134966, -0.06570621, 3.48631, 1, 0, 0, 1, 1,
0.2142689, 0.5705617, 1.376871, 1, 0, 0, 1, 1,
0.2162552, -0.3116743, 2.412756, 1, 0, 0, 1, 1,
0.2185781, -0.003949516, 2.45682, 1, 0, 0, 1, 1,
0.2193052, 0.1205357, 0.04752926, 1, 0, 0, 1, 1,
0.2256064, -0.2733789, 1.95886, 0, 0, 0, 1, 1,
0.2269418, -0.7174639, 1.351435, 0, 0, 0, 1, 1,
0.2280995, -2.118685, 3.792572, 0, 0, 0, 1, 1,
0.2287944, -1.005715, 3.362108, 0, 0, 0, 1, 1,
0.2308993, 0.510407, 0.6146328, 0, 0, 0, 1, 1,
0.2319054, -0.002751185, 1.232789, 0, 0, 0, 1, 1,
0.2321033, 1.06886, 0.7948171, 0, 0, 0, 1, 1,
0.2355252, 0.859876, -1.023334, 1, 1, 1, 1, 1,
0.2375691, 0.1912954, 0.4383732, 1, 1, 1, 1, 1,
0.240181, -1.244912, 4.300084, 1, 1, 1, 1, 1,
0.2408879, 0.7777902, 1.465725, 1, 1, 1, 1, 1,
0.2418662, 0.4240577, -1.529404, 1, 1, 1, 1, 1,
0.242365, -0.1086103, 2.762827, 1, 1, 1, 1, 1,
0.2487928, -0.2667467, 2.866397, 1, 1, 1, 1, 1,
0.2537274, -0.9078201, 1.997358, 1, 1, 1, 1, 1,
0.2614204, 1.30067, 1.013238, 1, 1, 1, 1, 1,
0.2635239, -0.7720126, 2.985325, 1, 1, 1, 1, 1,
0.2651719, -1.457462, 2.067568, 1, 1, 1, 1, 1,
0.2668568, -1.926366, 3.019369, 1, 1, 1, 1, 1,
0.2673377, -0.364814, 0.6746672, 1, 1, 1, 1, 1,
0.2719258, -1.47528, 3.219089, 1, 1, 1, 1, 1,
0.2753121, -1.124449, 3.030148, 1, 1, 1, 1, 1,
0.2799524, -0.07738347, 2.565004, 0, 0, 1, 1, 1,
0.28126, -0.2269363, 3.861352, 1, 0, 0, 1, 1,
0.2854625, 0.08363665, 0.01002526, 1, 0, 0, 1, 1,
0.2879595, 1.218293, -0.03296086, 1, 0, 0, 1, 1,
0.2932869, 0.9460755, 0.1948943, 1, 0, 0, 1, 1,
0.3018035, 1.274815, -0.2137947, 1, 0, 0, 1, 1,
0.3024064, -1.234331, 4.10278, 0, 0, 0, 1, 1,
0.3049907, -0.6135531, 2.631579, 0, 0, 0, 1, 1,
0.305844, -0.1025433, 0.1686896, 0, 0, 0, 1, 1,
0.3073183, 2.547844, 2.252775, 0, 0, 0, 1, 1,
0.3126432, 0.1844342, 1.161013, 0, 0, 0, 1, 1,
0.314456, -0.2138923, 2.779458, 0, 0, 0, 1, 1,
0.3177942, -0.778895, 2.856296, 0, 0, 0, 1, 1,
0.3200219, 1.070269, -1.161909, 1, 1, 1, 1, 1,
0.3223057, 0.363367, 0.6882679, 1, 1, 1, 1, 1,
0.3236205, -0.2068423, 1.852291, 1, 1, 1, 1, 1,
0.3239493, 0.9368578, -0.9355167, 1, 1, 1, 1, 1,
0.3248825, 0.4207898, 0.1870381, 1, 1, 1, 1, 1,
0.3263724, -1.284824, 2.772641, 1, 1, 1, 1, 1,
0.3269446, 0.4995635, 0.9113221, 1, 1, 1, 1, 1,
0.3321048, -0.2976188, 2.843997, 1, 1, 1, 1, 1,
0.3338435, 0.6213468, -0.8730879, 1, 1, 1, 1, 1,
0.3354656, -0.4771957, 1.768596, 1, 1, 1, 1, 1,
0.3368102, 0.3184407, 1.0472, 1, 1, 1, 1, 1,
0.3380328, 0.8474067, -0.1146571, 1, 1, 1, 1, 1,
0.3391595, 1.159365, -0.5408281, 1, 1, 1, 1, 1,
0.3414297, -0.1047333, 1.85571, 1, 1, 1, 1, 1,
0.3435762, -0.5486802, 1.606771, 1, 1, 1, 1, 1,
0.3440801, -0.09329499, 1.408602, 0, 0, 1, 1, 1,
0.3461056, -1.78503, 2.711265, 1, 0, 0, 1, 1,
0.3463944, 0.7622073, -0.1375336, 1, 0, 0, 1, 1,
0.3485203, -0.3961205, -0.395741, 1, 0, 0, 1, 1,
0.3550453, -0.2061268, 1.088151, 1, 0, 0, 1, 1,
0.3562318, -1.93423, 3.250664, 1, 0, 0, 1, 1,
0.3578995, 1.03816, -1.156648, 0, 0, 0, 1, 1,
0.3656683, 0.5073959, -0.02199387, 0, 0, 0, 1, 1,
0.3723771, -1.101085, 2.113405, 0, 0, 0, 1, 1,
0.3749286, -0.1351402, 2.535951, 0, 0, 0, 1, 1,
0.3751203, -0.1122589, 1.211459, 0, 0, 0, 1, 1,
0.3752846, -0.579237, 2.967958, 0, 0, 0, 1, 1,
0.3760614, -1.709556, 3.410506, 0, 0, 0, 1, 1,
0.3782594, -2.053365, 2.590749, 1, 1, 1, 1, 1,
0.3806698, -0.7717152, 2.204561, 1, 1, 1, 1, 1,
0.3877086, 0.466357, 0.1208449, 1, 1, 1, 1, 1,
0.3877695, -0.263291, 1.448062, 1, 1, 1, 1, 1,
0.3896803, -0.313645, 0.5348875, 1, 1, 1, 1, 1,
0.3952246, 1.054342, 0.4958338, 1, 1, 1, 1, 1,
0.3982178, 0.8744389, 0.30677, 1, 1, 1, 1, 1,
0.4003709, -1.062201, 1.799027, 1, 1, 1, 1, 1,
0.4006097, -0.6113361, 3.115546, 1, 1, 1, 1, 1,
0.4018454, 1.177262, 0.4874961, 1, 1, 1, 1, 1,
0.4079717, -0.5507175, 2.285459, 1, 1, 1, 1, 1,
0.4094208, 0.4389479, -0.8790182, 1, 1, 1, 1, 1,
0.4113616, 1.654063, -0.5630341, 1, 1, 1, 1, 1,
0.4118367, 1.735103, -1.855013, 1, 1, 1, 1, 1,
0.4144688, -0.291116, 1.897571, 1, 1, 1, 1, 1,
0.4150473, -1.264964, 3.555815, 0, 0, 1, 1, 1,
0.4175591, -1.826976, 2.641359, 1, 0, 0, 1, 1,
0.4185128, 2.013605, 0.3208876, 1, 0, 0, 1, 1,
0.4200569, -0.2132967, 1.695404, 1, 0, 0, 1, 1,
0.4234345, 1.083104, 0.08939715, 1, 0, 0, 1, 1,
0.4252462, 1.034112, -0.1416138, 1, 0, 0, 1, 1,
0.4252858, 0.4495719, 1.844283, 0, 0, 0, 1, 1,
0.4280667, 0.05167986, 1.047926, 0, 0, 0, 1, 1,
0.4301861, -0.1314276, 0.7894405, 0, 0, 0, 1, 1,
0.4428245, -0.006944848, 2.286406, 0, 0, 0, 1, 1,
0.4432125, 1.632958, 0.936005, 0, 0, 0, 1, 1,
0.4476798, -0.4407375, 3.125514, 0, 0, 0, 1, 1,
0.448301, 0.6395739, 2.232981, 0, 0, 0, 1, 1,
0.4516627, 0.9392865, 1.88633, 1, 1, 1, 1, 1,
0.4549682, -1.871064, 0.4298207, 1, 1, 1, 1, 1,
0.4573368, -1.375168, 1.787679, 1, 1, 1, 1, 1,
0.4573719, 0.6559637, 1.800251, 1, 1, 1, 1, 1,
0.4591909, 0.6562926, -0.7300161, 1, 1, 1, 1, 1,
0.4604912, -0.7589759, 1.011167, 1, 1, 1, 1, 1,
0.4627424, 0.7939963, 0.2730533, 1, 1, 1, 1, 1,
0.4696346, 1.436236, 1.279871, 1, 1, 1, 1, 1,
0.4772364, 1.278625, -0.2092123, 1, 1, 1, 1, 1,
0.4869272, -0.4974654, 3.69053, 1, 1, 1, 1, 1,
0.4887415, -1.250793, 1.175905, 1, 1, 1, 1, 1,
0.4926897, -0.5502053, 2.189236, 1, 1, 1, 1, 1,
0.4931544, -0.4871823, 2.329387, 1, 1, 1, 1, 1,
0.4940105, -0.6474112, 0.8828605, 1, 1, 1, 1, 1,
0.4946257, -0.04587309, 2.100575, 1, 1, 1, 1, 1,
0.4995056, 0.4783608, 0.6256, 0, 0, 1, 1, 1,
0.5018227, 0.1348751, 0.709623, 1, 0, 0, 1, 1,
0.503686, -1.358755, 3.357098, 1, 0, 0, 1, 1,
0.5046543, 0.7544442, 0.6216831, 1, 0, 0, 1, 1,
0.5165174, 0.169995, 1.750429, 1, 0, 0, 1, 1,
0.5229765, -0.4976941, 2.403169, 1, 0, 0, 1, 1,
0.5234124, -0.5374979, 4.764455, 0, 0, 0, 1, 1,
0.5266401, 0.2494167, 1.927392, 0, 0, 0, 1, 1,
0.5314025, 2.307078, -0.8048746, 0, 0, 0, 1, 1,
0.5345996, 1.384501, 1.126422, 0, 0, 0, 1, 1,
0.5364628, 0.6295465, -0.2787311, 0, 0, 0, 1, 1,
0.5422861, -0.9428471, 2.268584, 0, 0, 0, 1, 1,
0.5442851, -0.2395114, 1.811566, 0, 0, 0, 1, 1,
0.5452003, -2.504673, 2.396499, 1, 1, 1, 1, 1,
0.5462034, -0.4220845, 2.094576, 1, 1, 1, 1, 1,
0.5471702, -0.04668035, 2.161919, 1, 1, 1, 1, 1,
0.5497792, -0.07301562, 2.424583, 1, 1, 1, 1, 1,
0.5503881, -0.9829021, 3.034007, 1, 1, 1, 1, 1,
0.5518481, 1.27476, -0.9255393, 1, 1, 1, 1, 1,
0.5555436, 0.3584311, 0.03545376, 1, 1, 1, 1, 1,
0.5558826, -0.8525826, 2.380932, 1, 1, 1, 1, 1,
0.557859, -0.9270563, 2.477828, 1, 1, 1, 1, 1,
0.567697, 0.6887385, 0.6899401, 1, 1, 1, 1, 1,
0.5701468, -0.388211, 2.344377, 1, 1, 1, 1, 1,
0.5733613, -0.7077999, 1.179166, 1, 1, 1, 1, 1,
0.577754, -1.057098, 2.920893, 1, 1, 1, 1, 1,
0.5879015, 0.003347635, 1.400787, 1, 1, 1, 1, 1,
0.5937681, -0.7187513, 1.969741, 1, 1, 1, 1, 1,
0.6123571, -1.326324, 1.150477, 0, 0, 1, 1, 1,
0.624258, -0.5061255, 2.208598, 1, 0, 0, 1, 1,
0.625517, 0.6704412, 0.1146858, 1, 0, 0, 1, 1,
0.6273197, 0.5763375, 0.503866, 1, 0, 0, 1, 1,
0.6320489, -1.112252, 3.891642, 1, 0, 0, 1, 1,
0.6335606, -0.4694553, 2.824414, 1, 0, 0, 1, 1,
0.6349556, 0.9077146, 0.6500518, 0, 0, 0, 1, 1,
0.6352723, 0.8891898, 0.7385349, 0, 0, 0, 1, 1,
0.6356226, 0.7210396, 0.9523513, 0, 0, 0, 1, 1,
0.6419578, 1.198235, 1.151173, 0, 0, 0, 1, 1,
0.6463845, -0.7912538, 4.166896, 0, 0, 0, 1, 1,
0.651491, -0.3611727, 3.281911, 0, 0, 0, 1, 1,
0.6527632, -0.03846145, 0.8428474, 0, 0, 0, 1, 1,
0.6571846, 1.093283, -0.4153084, 1, 1, 1, 1, 1,
0.6575639, 1.025289, 1.986163, 1, 1, 1, 1, 1,
0.658451, -0.7563859, 0.6830582, 1, 1, 1, 1, 1,
0.6637706, 1.516245, 0.8437586, 1, 1, 1, 1, 1,
0.6715206, 1.530134, 0.8954325, 1, 1, 1, 1, 1,
0.6738657, -1.242925, 2.891133, 1, 1, 1, 1, 1,
0.6761832, -1.900469, 1.818677, 1, 1, 1, 1, 1,
0.6795468, 0.8186598, -0.711114, 1, 1, 1, 1, 1,
0.6843165, -0.913044, 2.933254, 1, 1, 1, 1, 1,
0.6887451, 1.044499, 0.9484961, 1, 1, 1, 1, 1,
0.6920485, -0.4815059, 1.788154, 1, 1, 1, 1, 1,
0.6966562, 0.6696635, -1.094901, 1, 1, 1, 1, 1,
0.6979629, -1.783896, 2.992311, 1, 1, 1, 1, 1,
0.7015167, 0.8905689, 2.257765, 1, 1, 1, 1, 1,
0.7018688, 1.958706, 0.6564937, 1, 1, 1, 1, 1,
0.7033576, -0.1602422, 0.1964275, 0, 0, 1, 1, 1,
0.7137538, -0.003086041, 1.223423, 1, 0, 0, 1, 1,
0.7177258, 1.716296, -0.6356378, 1, 0, 0, 1, 1,
0.7188967, 0.7471671, 0.3170058, 1, 0, 0, 1, 1,
0.7222139, -0.7462268, 2.488724, 1, 0, 0, 1, 1,
0.7267973, 0.8240112, 2.617237, 1, 0, 0, 1, 1,
0.7315462, -0.009844209, 0.009182089, 0, 0, 0, 1, 1,
0.7356225, -0.2731013, 1.665666, 0, 0, 0, 1, 1,
0.7363778, -0.2185123, 2.591951, 0, 0, 0, 1, 1,
0.7389119, -2.462503, 3.11934, 0, 0, 0, 1, 1,
0.7390122, -0.1873948, 3.159099, 0, 0, 0, 1, 1,
0.7432255, -0.2661414, 2.862106, 0, 0, 0, 1, 1,
0.747877, 0.04101386, 4.122904, 0, 0, 0, 1, 1,
0.7517524, 1.272114, 1.609396, 1, 1, 1, 1, 1,
0.7518019, 1.418572, 0.5564968, 1, 1, 1, 1, 1,
0.7522888, -1.199655, 0.4682584, 1, 1, 1, 1, 1,
0.7610196, -1.40095, 2.121456, 1, 1, 1, 1, 1,
0.7629979, -1.216791, 3.718268, 1, 1, 1, 1, 1,
0.7737421, 0.6541216, 0.09541228, 1, 1, 1, 1, 1,
0.777031, -0.7965937, 2.598496, 1, 1, 1, 1, 1,
0.779888, 0.9712164, 1.176204, 1, 1, 1, 1, 1,
0.7811965, -0.3530539, 0.8673561, 1, 1, 1, 1, 1,
0.7840032, -1.304625, 1.741312, 1, 1, 1, 1, 1,
0.7905762, -0.6560543, 2.687151, 1, 1, 1, 1, 1,
0.7924404, -1.158179, 1.143307, 1, 1, 1, 1, 1,
0.7933074, -0.6639917, 2.614419, 1, 1, 1, 1, 1,
0.7937132, -1.284661, 2.290771, 1, 1, 1, 1, 1,
0.7962652, -0.1916162, 2.482779, 1, 1, 1, 1, 1,
0.8005657, 2.08153, 1.088106, 0, 0, 1, 1, 1,
0.8061686, 1.691327, -1.058936, 1, 0, 0, 1, 1,
0.8076791, 1.339969, -0.4714199, 1, 0, 0, 1, 1,
0.8078653, -0.5833127, 4.079895, 1, 0, 0, 1, 1,
0.8136713, 0.08495757, 1.036484, 1, 0, 0, 1, 1,
0.8160647, -0.5137292, 3.213463, 1, 0, 0, 1, 1,
0.8195917, -0.876924, 2.146529, 0, 0, 0, 1, 1,
0.8206255, 0.9918597, 0.2150048, 0, 0, 0, 1, 1,
0.821407, 0.8184067, -0.7400474, 0, 0, 0, 1, 1,
0.8228269, -0.4709687, 1.892672, 0, 0, 0, 1, 1,
0.8233526, -0.9479334, 1.148696, 0, 0, 0, 1, 1,
0.8277754, -0.009390188, 1.528026, 0, 0, 0, 1, 1,
0.8279133, 0.8983299, 3.444047, 0, 0, 0, 1, 1,
0.8366266, -1.023084, 2.653677, 1, 1, 1, 1, 1,
0.8380687, 0.2633131, 0.8423168, 1, 1, 1, 1, 1,
0.8428077, 0.6820462, 0.7418032, 1, 1, 1, 1, 1,
0.8446459, -0.6886744, 1.747821, 1, 1, 1, 1, 1,
0.8494797, -1.423715, 3.51199, 1, 1, 1, 1, 1,
0.8549727, 1.22582, 1.811322, 1, 1, 1, 1, 1,
0.8556763, -0.6631631, 3.033528, 1, 1, 1, 1, 1,
0.8601233, -0.419863, 2.814105, 1, 1, 1, 1, 1,
0.8604152, -1.298903, 2.544754, 1, 1, 1, 1, 1,
0.8612831, 0.4597728, 2.384157, 1, 1, 1, 1, 1,
0.8648034, 0.2166931, 1.097249, 1, 1, 1, 1, 1,
0.8652607, 0.8774966, 1.749944, 1, 1, 1, 1, 1,
0.8652836, -0.2740631, 1.902961, 1, 1, 1, 1, 1,
0.8665534, 0.4018089, 1.241379, 1, 1, 1, 1, 1,
0.8670949, -0.303333, 1.924759, 1, 1, 1, 1, 1,
0.8717231, 1.519504, -0.4088247, 0, 0, 1, 1, 1,
0.8731384, -0.5733542, 2.003779, 1, 0, 0, 1, 1,
0.8768926, -1.225767, 1.562645, 1, 0, 0, 1, 1,
0.8805869, -1.073098, 0.09869182, 1, 0, 0, 1, 1,
0.887506, -0.4849198, 1.916309, 1, 0, 0, 1, 1,
0.8892694, -0.0468657, 1.894434, 1, 0, 0, 1, 1,
0.8937255, 0.6695654, 0.9668517, 0, 0, 0, 1, 1,
0.8942611, 0.3299043, 1.935564, 0, 0, 0, 1, 1,
0.8967858, 0.6453881, 2.683859, 0, 0, 0, 1, 1,
0.8992558, -0.5410374, 1.352874, 0, 0, 0, 1, 1,
0.9032345, 1.249671, 1.589914, 0, 0, 0, 1, 1,
0.9111757, 0.6622833, 1.359805, 0, 0, 0, 1, 1,
0.9157498, -0.3586609, 0.8131121, 0, 0, 0, 1, 1,
0.9222794, 0.692991, -0.1166914, 1, 1, 1, 1, 1,
0.9251741, -1.520363, 4.187152, 1, 1, 1, 1, 1,
0.9272435, 0.1318058, 2.331535, 1, 1, 1, 1, 1,
0.9299814, 2.252155, -0.04857532, 1, 1, 1, 1, 1,
0.9324561, 0.1027861, 1.415883, 1, 1, 1, 1, 1,
0.9335586, -0.9659446, 1.84864, 1, 1, 1, 1, 1,
0.9394793, -0.2939724, 2.534648, 1, 1, 1, 1, 1,
0.9404798, -0.03680653, 3.298846, 1, 1, 1, 1, 1,
0.9408638, 0.02883291, 0.8002223, 1, 1, 1, 1, 1,
0.9481094, 1.505127, 0.9798159, 1, 1, 1, 1, 1,
0.9501923, 0.2857439, 1.379299, 1, 1, 1, 1, 1,
0.9510239, -1.209277, 2.855582, 1, 1, 1, 1, 1,
0.9532575, 0.09718607, 2.438081, 1, 1, 1, 1, 1,
0.9568588, -2.051982, 2.484869, 1, 1, 1, 1, 1,
0.970534, 0.8676285, 0.9493587, 1, 1, 1, 1, 1,
0.9744638, 0.888669, 0.418964, 0, 0, 1, 1, 1,
0.9813204, 0.009654862, 3.154103, 1, 0, 0, 1, 1,
0.9834889, 0.1875356, 1.230039, 1, 0, 0, 1, 1,
0.9964302, 2.188141, 1.028431, 1, 0, 0, 1, 1,
0.9973468, 1.608028, 0.1564082, 1, 0, 0, 1, 1,
0.9999396, -0.5792462, 2.351213, 1, 0, 0, 1, 1,
1.010147, 0.9255725, 1.884412, 0, 0, 0, 1, 1,
1.012176, 0.09813108, 1.762275, 0, 0, 0, 1, 1,
1.01221, 0.3636319, 0.3440492, 0, 0, 0, 1, 1,
1.018791, -0.5629802, 0.1863231, 0, 0, 0, 1, 1,
1.023159, 0.03379552, 2.781078, 0, 0, 0, 1, 1,
1.027135, -1.011084, 2.131033, 0, 0, 0, 1, 1,
1.036936, 0.4886266, 2.535753, 0, 0, 0, 1, 1,
1.037189, 0.9436746, 1.704236, 1, 1, 1, 1, 1,
1.047179, -0.2173177, 0.4625333, 1, 1, 1, 1, 1,
1.050022, 1.519235, -0.3757381, 1, 1, 1, 1, 1,
1.052862, -0.8350751, 2.527823, 1, 1, 1, 1, 1,
1.053748, -0.5472404, 2.778863, 1, 1, 1, 1, 1,
1.05392, -0.5800644, 1.513517, 1, 1, 1, 1, 1,
1.056973, 0.7718762, 1.466653, 1, 1, 1, 1, 1,
1.057283, 0.3197415, 1.131591, 1, 1, 1, 1, 1,
1.063419, 1.203546, -0.5242881, 1, 1, 1, 1, 1,
1.067583, 0.2901901, 1.148927, 1, 1, 1, 1, 1,
1.07111, -0.4162823, 1.552174, 1, 1, 1, 1, 1,
1.071124, -0.2240524, 3.571691, 1, 1, 1, 1, 1,
1.073566, 0.5158193, 2.646635, 1, 1, 1, 1, 1,
1.077657, -0.1561809, 1.570662, 1, 1, 1, 1, 1,
1.08026, 0.6026438, 1.136173, 1, 1, 1, 1, 1,
1.083338, 1.004301, -0.5415813, 0, 0, 1, 1, 1,
1.087575, -1.349329, 2.925292, 1, 0, 0, 1, 1,
1.090108, -0.2253893, 2.75906, 1, 0, 0, 1, 1,
1.093338, -0.07618094, 1.884423, 1, 0, 0, 1, 1,
1.095921, -1.35025, 1.083384, 1, 0, 0, 1, 1,
1.109773, 0.2229518, 0.7172114, 1, 0, 0, 1, 1,
1.111234, -0.2001435, 0.9163004, 0, 0, 0, 1, 1,
1.12521, -0.1740013, 1.81169, 0, 0, 0, 1, 1,
1.128345, -0.8425794, 0.4239789, 0, 0, 0, 1, 1,
1.14034, 0.9942613, 1.08303, 0, 0, 0, 1, 1,
1.14204, 1.371253, -0.07213535, 0, 0, 0, 1, 1,
1.146779, 0.02709118, 0.9855625, 0, 0, 0, 1, 1,
1.148864, -0.5226545, 2.677656, 0, 0, 0, 1, 1,
1.166327, 0.2676477, 1.916709, 1, 1, 1, 1, 1,
1.176961, 0.9221478, 0.9353085, 1, 1, 1, 1, 1,
1.179976, 0.5686101, 1.074985, 1, 1, 1, 1, 1,
1.188687, 0.4287758, 0.5325699, 1, 1, 1, 1, 1,
1.190284, 0.1997443, -0.1088197, 1, 1, 1, 1, 1,
1.197235, -0.6542435, 2.653957, 1, 1, 1, 1, 1,
1.199326, 0.5240037, 1.788681, 1, 1, 1, 1, 1,
1.203771, 1.123828, 2.887241, 1, 1, 1, 1, 1,
1.208254, -0.3246645, 1.979645, 1, 1, 1, 1, 1,
1.21395, -0.0535809, 2.248223, 1, 1, 1, 1, 1,
1.216218, 0.2842833, 1.889669, 1, 1, 1, 1, 1,
1.222361, -0.500075, 1.478621, 1, 1, 1, 1, 1,
1.226187, -0.1633458, 1.956755, 1, 1, 1, 1, 1,
1.234984, 0.4594085, 0.01751458, 1, 1, 1, 1, 1,
1.236618, -2.06275, 2.693111, 1, 1, 1, 1, 1,
1.259085, 0.01433182, 1.901695, 0, 0, 1, 1, 1,
1.267256, -0.3186835, 3.267737, 1, 0, 0, 1, 1,
1.268718, 0.2310017, -0.008074288, 1, 0, 0, 1, 1,
1.279786, 0.1991511, 0.5159332, 1, 0, 0, 1, 1,
1.280371, 1.24824, 2.456027, 1, 0, 0, 1, 1,
1.290421, -0.8256728, 2.155067, 1, 0, 0, 1, 1,
1.303357, 0.8357647, 1.184501, 0, 0, 0, 1, 1,
1.307605, 0.06677008, 0.004542108, 0, 0, 0, 1, 1,
1.322297, -0.9728597, 2.484186, 0, 0, 0, 1, 1,
1.323313, 1.499081, -0.6164397, 0, 0, 0, 1, 1,
1.327262, 1.113155, 1.409616, 0, 0, 0, 1, 1,
1.329858, -1.084787, 1.904389, 0, 0, 0, 1, 1,
1.330084, -0.004896721, 1.368204, 0, 0, 0, 1, 1,
1.330275, 0.2437346, 1.56216, 1, 1, 1, 1, 1,
1.339415, 1.451769, 0.8211657, 1, 1, 1, 1, 1,
1.34005, 2.989199, -1.518168, 1, 1, 1, 1, 1,
1.340235, 1.298533, -0.1050904, 1, 1, 1, 1, 1,
1.347756, 0.5319155, 1.468558, 1, 1, 1, 1, 1,
1.351188, -0.02265716, -1.263662, 1, 1, 1, 1, 1,
1.362307, -0.8645617, 3.334133, 1, 1, 1, 1, 1,
1.382477, -1.037451, 1.749545, 1, 1, 1, 1, 1,
1.388363, 0.6674157, 2.759921, 1, 1, 1, 1, 1,
1.393425, 0.2481584, 3.243326, 1, 1, 1, 1, 1,
1.399721, 0.2185692, 2.117496, 1, 1, 1, 1, 1,
1.40001, 0.4493625, 1.907872, 1, 1, 1, 1, 1,
1.403489, -0.8384922, 2.348222, 1, 1, 1, 1, 1,
1.418958, 1.466335, 1.085324, 1, 1, 1, 1, 1,
1.427494, 0.4430256, 0.4854643, 1, 1, 1, 1, 1,
1.427888, -0.7314895, 1.79367, 0, 0, 1, 1, 1,
1.432328, 1.818336, 1.121697, 1, 0, 0, 1, 1,
1.433529, 0.6197586, 1.50483, 1, 0, 0, 1, 1,
1.433601, -0.6064526, 3.135649, 1, 0, 0, 1, 1,
1.436796, -0.8664057, 0.7104629, 1, 0, 0, 1, 1,
1.444806, 0.1868475, 0.01554656, 1, 0, 0, 1, 1,
1.448272, -0.8035378, 1.71333, 0, 0, 0, 1, 1,
1.454025, -0.6699579, 3.01897, 0, 0, 0, 1, 1,
1.463007, -1.129561, 1.688032, 0, 0, 0, 1, 1,
1.465895, 1.441985, 1.468592, 0, 0, 0, 1, 1,
1.467346, 0.3148366, 0.6933948, 0, 0, 0, 1, 1,
1.477692, 0.5656872, 0.7890999, 0, 0, 0, 1, 1,
1.489606, -0.5378394, 1.518199, 0, 0, 0, 1, 1,
1.493533, 1.022178, 0.4279865, 1, 1, 1, 1, 1,
1.498659, 0.6032221, -1.962198, 1, 1, 1, 1, 1,
1.507729, -1.784435, 2.056747, 1, 1, 1, 1, 1,
1.51206, 0.2989113, 1.729535, 1, 1, 1, 1, 1,
1.512916, -1.096423, 0.6922457, 1, 1, 1, 1, 1,
1.546801, -0.01224228, 1.25842, 1, 1, 1, 1, 1,
1.550139, 1.386715, 0.7273132, 1, 1, 1, 1, 1,
1.55884, 0.891066, 2.634794, 1, 1, 1, 1, 1,
1.564956, 0.5030519, -0.0777822, 1, 1, 1, 1, 1,
1.575545, -0.973893, 1.537301, 1, 1, 1, 1, 1,
1.57978, 1.291475, -0.3278174, 1, 1, 1, 1, 1,
1.580159, 0.005896037, 2.423336, 1, 1, 1, 1, 1,
1.585102, 1.44483, 0.5569943, 1, 1, 1, 1, 1,
1.590134, 0.5718064, 1.513263, 1, 1, 1, 1, 1,
1.591673, -1.614922, 1.582508, 1, 1, 1, 1, 1,
1.596923, -0.6946663, 2.033077, 0, 0, 1, 1, 1,
1.615968, 0.721061, 1.909607, 1, 0, 0, 1, 1,
1.617717, 0.4838166, -0.6665373, 1, 0, 0, 1, 1,
1.628406, 0.02156999, 0.6513891, 1, 0, 0, 1, 1,
1.637109, 1.110282, -0.2285046, 1, 0, 0, 1, 1,
1.645571, 1.362269, 1.119002, 1, 0, 0, 1, 1,
1.646768, 1.435152, 1.193157, 0, 0, 0, 1, 1,
1.653758, 0.8864807, 1.171637, 0, 0, 0, 1, 1,
1.655133, 1.075231, 1.794085, 0, 0, 0, 1, 1,
1.671228, 0.2391771, 1.556736, 0, 0, 0, 1, 1,
1.676646, -0.5352185, 2.023352, 0, 0, 0, 1, 1,
1.679527, 1.244258, 1.271547, 0, 0, 0, 1, 1,
1.714705, -0.814888, 2.013597, 0, 0, 0, 1, 1,
1.728156, 0.1875851, 1.585085, 1, 1, 1, 1, 1,
1.731558, 1.103888, 2.51708, 1, 1, 1, 1, 1,
1.739242, -0.1905663, 1.91336, 1, 1, 1, 1, 1,
1.744412, 0.2122536, -0.1852117, 1, 1, 1, 1, 1,
1.775151, 0.0689355, 3.346043, 1, 1, 1, 1, 1,
1.80129, 2.199129, 0.7825271, 1, 1, 1, 1, 1,
1.807744, -1.13237, 0.290547, 1, 1, 1, 1, 1,
1.815084, -0.4868949, 0.8494885, 1, 1, 1, 1, 1,
1.815616, 1.715363, 1.099859, 1, 1, 1, 1, 1,
1.83512, 0.8698695, 0.06631833, 1, 1, 1, 1, 1,
1.851754, -1.896654, 2.414818, 1, 1, 1, 1, 1,
1.859383, -0.3845028, 1.141701, 1, 1, 1, 1, 1,
1.882627, 1.386078, 1.591148, 1, 1, 1, 1, 1,
1.883053, 0.0892308, 1.4311, 1, 1, 1, 1, 1,
1.883582, 0.4071973, 1.363143, 1, 1, 1, 1, 1,
1.894667, 0.6307669, 2.767704, 0, 0, 1, 1, 1,
1.947359, 1.333727, 2.104788, 1, 0, 0, 1, 1,
1.958029, -1.27229, 3.635677, 1, 0, 0, 1, 1,
1.982447, -0.4915967, 3.893068, 1, 0, 0, 1, 1,
1.999092, -1.466836, 2.213258, 1, 0, 0, 1, 1,
2.017832, 0.7844259, 1.025366, 1, 0, 0, 1, 1,
2.052137, 1.228192, -0.1532754, 0, 0, 0, 1, 1,
2.076853, 0.4294305, 0.5584531, 0, 0, 0, 1, 1,
2.120968, 0.4224018, 2.562369, 0, 0, 0, 1, 1,
2.149814, 0.9423177, 2.010304, 0, 0, 0, 1, 1,
2.159333, 1.894821, 1.514025, 0, 0, 0, 1, 1,
2.172925, -2.115379, 1.524715, 0, 0, 0, 1, 1,
2.211695, -0.8237764, 2.340883, 0, 0, 0, 1, 1,
2.351738, 1.094441, 1.680634, 1, 1, 1, 1, 1,
2.421688, -0.1061067, 3.227506, 1, 1, 1, 1, 1,
2.563516, 1.482629, 0.386907, 1, 1, 1, 1, 1,
2.651809, -0.9872198, 3.263297, 1, 1, 1, 1, 1,
2.655791, -0.7645874, 0.7623248, 1, 1, 1, 1, 1,
2.956141, -0.486811, 1.170086, 1, 1, 1, 1, 1,
2.963311, -0.7136289, 1.843731, 1, 1, 1, 1, 1
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
var radius = 9.231197;
var distance = 32.42419;
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
mvMatrix.translate( 0.1686065, -0.04647577, 0.05764699 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.42419);
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
