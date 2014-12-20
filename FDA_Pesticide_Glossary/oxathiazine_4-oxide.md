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
-2.991247, 0.2536519, -0.9955728, 1, 0, 0, 1,
-2.854267, 0.622687, 0.5092791, 1, 0.007843138, 0, 1,
-2.642419, -0.9636528, -2.540029, 1, 0.01176471, 0, 1,
-2.592094, -0.6688624, -2.425691, 1, 0.01960784, 0, 1,
-2.428723, 0.3583413, -0.9247088, 1, 0.02352941, 0, 1,
-2.307562, 0.6835373, -1.177653, 1, 0.03137255, 0, 1,
-2.307316, 0.2498171, 0.02905189, 1, 0.03529412, 0, 1,
-2.290006, 0.7999615, 0.05531729, 1, 0.04313726, 0, 1,
-2.265314, -0.05393089, -2.459081, 1, 0.04705882, 0, 1,
-2.255361, 0.129973, -1.805542, 1, 0.05490196, 0, 1,
-2.240349, -0.0455834, -1.585688, 1, 0.05882353, 0, 1,
-2.239365, -0.2837145, -1.207108, 1, 0.06666667, 0, 1,
-2.21974, 2.004362, -0.03203874, 1, 0.07058824, 0, 1,
-2.136052, 0.04188914, -1.252316, 1, 0.07843138, 0, 1,
-2.121904, -0.002074759, -1.746904, 1, 0.08235294, 0, 1,
-2.067629, -0.01057815, -3.479723, 1, 0.09019608, 0, 1,
-2.065481, 0.05489927, -1.069842, 1, 0.09411765, 0, 1,
-2.055431, 0.3224857, -2.252737, 1, 0.1019608, 0, 1,
-2.022456, 0.05164826, -1.485944, 1, 0.1098039, 0, 1,
-2.021859, 0.4795558, -1.915806, 1, 0.1137255, 0, 1,
-1.977298, -2.224093, -2.929605, 1, 0.1215686, 0, 1,
-1.956591, 0.9985045, -0.4423442, 1, 0.1254902, 0, 1,
-1.933799, -0.5636909, -2.233308, 1, 0.1333333, 0, 1,
-1.932529, -1.372838, -1.651914, 1, 0.1372549, 0, 1,
-1.921484, 0.2526664, -0.8287697, 1, 0.145098, 0, 1,
-1.911501, 0.6191051, -0.7139604, 1, 0.1490196, 0, 1,
-1.902812, 1.344624, 0.1556057, 1, 0.1568628, 0, 1,
-1.901241, 1.975714, -0.4457194, 1, 0.1607843, 0, 1,
-1.891826, -1.228809, -2.160875, 1, 0.1686275, 0, 1,
-1.889059, 0.5367259, -0.924261, 1, 0.172549, 0, 1,
-1.882837, -1.08885, -1.709008, 1, 0.1803922, 0, 1,
-1.879501, -0.02774688, -3.088807, 1, 0.1843137, 0, 1,
-1.863091, -0.7439618, -1.258149, 1, 0.1921569, 0, 1,
-1.85034, 0.2322123, 0.240638, 1, 0.1960784, 0, 1,
-1.820493, 0.5229098, -2.463599, 1, 0.2039216, 0, 1,
-1.799049, -0.2676994, -1.808279, 1, 0.2117647, 0, 1,
-1.7871, 0.1164479, -2.518358, 1, 0.2156863, 0, 1,
-1.774561, 1.448389, -1.905428, 1, 0.2235294, 0, 1,
-1.765979, 1.689454, -2.195846, 1, 0.227451, 0, 1,
-1.762821, 0.3275022, -1.335666, 1, 0.2352941, 0, 1,
-1.749654, 1.071016, -1.22523, 1, 0.2392157, 0, 1,
-1.742711, 0.9923458, -0.9066697, 1, 0.2470588, 0, 1,
-1.740141, -0.9534965, -2.184533, 1, 0.2509804, 0, 1,
-1.718061, -1.211388, -3.777114, 1, 0.2588235, 0, 1,
-1.706634, 1.778814, -2.346345, 1, 0.2627451, 0, 1,
-1.6954, -0.2232859, -1.985504, 1, 0.2705882, 0, 1,
-1.69519, -0.17507, -1.382344, 1, 0.2745098, 0, 1,
-1.681451, 0.8889876, -2.163687, 1, 0.282353, 0, 1,
-1.680817, -1.926556, -0.9382752, 1, 0.2862745, 0, 1,
-1.676673, 0.5702337, -1.28741, 1, 0.2941177, 0, 1,
-1.66421, -0.1976243, -1.32979, 1, 0.3019608, 0, 1,
-1.637382, 1.211954, -1.62264, 1, 0.3058824, 0, 1,
-1.634974, 0.7811974, -0.4163575, 1, 0.3137255, 0, 1,
-1.61522, 1.717304, 0.2974316, 1, 0.3176471, 0, 1,
-1.603087, -0.7923618, -3.117596, 1, 0.3254902, 0, 1,
-1.594272, 1.613855, -0.2608756, 1, 0.3294118, 0, 1,
-1.593437, -0.1366799, -2.095252, 1, 0.3372549, 0, 1,
-1.582937, -0.3372653, -1.496371, 1, 0.3411765, 0, 1,
-1.581156, -1.556155, -1.925065, 1, 0.3490196, 0, 1,
-1.579527, 0.3225952, -0.6695167, 1, 0.3529412, 0, 1,
-1.576576, -0.3212491, -2.638151, 1, 0.3607843, 0, 1,
-1.572032, 0.2231632, -2.16244, 1, 0.3647059, 0, 1,
-1.565953, 0.8254669, -1.661043, 1, 0.372549, 0, 1,
-1.556508, 0.1475809, 0.7682034, 1, 0.3764706, 0, 1,
-1.55591, -0.541597, -2.049488, 1, 0.3843137, 0, 1,
-1.542098, 0.1659463, -2.225036, 1, 0.3882353, 0, 1,
-1.531278, -0.4874983, -2.638518, 1, 0.3960784, 0, 1,
-1.516456, 0.2160147, -3.388367, 1, 0.4039216, 0, 1,
-1.51622, 0.9681342, -0.1826364, 1, 0.4078431, 0, 1,
-1.504768, -1.386458, -1.322798, 1, 0.4156863, 0, 1,
-1.503256, 0.1535403, -1.666064, 1, 0.4196078, 0, 1,
-1.502365, 0.1779753, -1.93176, 1, 0.427451, 0, 1,
-1.477539, -0.1410934, -0.8200383, 1, 0.4313726, 0, 1,
-1.471159, -0.413941, -2.089035, 1, 0.4392157, 0, 1,
-1.470356, -1.484904, -2.656888, 1, 0.4431373, 0, 1,
-1.463658, 0.9648225, -0.5223861, 1, 0.4509804, 0, 1,
-1.456785, 2.137757, 0.1084949, 1, 0.454902, 0, 1,
-1.452174, 0.4307946, -2.112017, 1, 0.4627451, 0, 1,
-1.439336, -0.6935478, -4.836493, 1, 0.4666667, 0, 1,
-1.43911, 1.250936, 1.006936, 1, 0.4745098, 0, 1,
-1.432383, 1.274275, -1.799005, 1, 0.4784314, 0, 1,
-1.43231, 1.742291, -0.9405075, 1, 0.4862745, 0, 1,
-1.42847, 1.134545, 0.7123209, 1, 0.4901961, 0, 1,
-1.426638, -0.6262097, -1.226052, 1, 0.4980392, 0, 1,
-1.420033, -0.6424168, -1.308545, 1, 0.5058824, 0, 1,
-1.417485, -2.15199, -3.436622, 1, 0.509804, 0, 1,
-1.416868, 0.6862118, -2.326097, 1, 0.5176471, 0, 1,
-1.416851, -2.221951, -4.868981, 1, 0.5215687, 0, 1,
-1.410665, 0.366405, -2.842858, 1, 0.5294118, 0, 1,
-1.401419, 0.6107006, -3.057263, 1, 0.5333334, 0, 1,
-1.391196, 0.2182459, -0.133735, 1, 0.5411765, 0, 1,
-1.377158, -0.712098, -0.9952454, 1, 0.5450981, 0, 1,
-1.350876, -1.410658, -0.8234835, 1, 0.5529412, 0, 1,
-1.345251, 0.02073803, -2.3464, 1, 0.5568628, 0, 1,
-1.338087, 0.3299055, -1.457594, 1, 0.5647059, 0, 1,
-1.319242, 0.524411, -1.265494, 1, 0.5686275, 0, 1,
-1.31832, 0.6087841, -1.180724, 1, 0.5764706, 0, 1,
-1.317835, -0.6591001, -2.430505, 1, 0.5803922, 0, 1,
-1.313997, 2.290394, -0.321131, 1, 0.5882353, 0, 1,
-1.295675, 0.4700084, -1.514778, 1, 0.5921569, 0, 1,
-1.295213, 1.187072, -2.119715, 1, 0.6, 0, 1,
-1.28419, 0.6205055, -1.461931, 1, 0.6078432, 0, 1,
-1.282395, 0.02034342, -2.03942, 1, 0.6117647, 0, 1,
-1.280894, -0.8447008, -1.980151, 1, 0.6196079, 0, 1,
-1.279772, -0.5742186, -3.706993, 1, 0.6235294, 0, 1,
-1.270496, -0.6344701, -0.972734, 1, 0.6313726, 0, 1,
-1.26177, -1.555031, -2.17879, 1, 0.6352941, 0, 1,
-1.260868, -0.4370823, 0.02383496, 1, 0.6431373, 0, 1,
-1.254595, 0.3253915, 0.03481696, 1, 0.6470588, 0, 1,
-1.250321, 1.045746, -1.791441, 1, 0.654902, 0, 1,
-1.23692, -0.9524994, -2.728298, 1, 0.6588235, 0, 1,
-1.234535, -0.004094277, 0.005967224, 1, 0.6666667, 0, 1,
-1.22813, -0.3285674, -0.2823989, 1, 0.6705883, 0, 1,
-1.226409, 1.896338, -1.953705, 1, 0.6784314, 0, 1,
-1.22135, 0.5923832, 1.429797, 1, 0.682353, 0, 1,
-1.215708, 0.3993351, -0.374783, 1, 0.6901961, 0, 1,
-1.213344, 1.147276, 0.704983, 1, 0.6941177, 0, 1,
-1.212955, -0.4003966, -2.69042, 1, 0.7019608, 0, 1,
-1.212909, -0.2608316, -0.7974698, 1, 0.7098039, 0, 1,
-1.20815, 1.21077, -1.467946, 1, 0.7137255, 0, 1,
-1.206386, 0.2972815, -0.5418403, 1, 0.7215686, 0, 1,
-1.20583, 1.321786, 0.8883803, 1, 0.7254902, 0, 1,
-1.20306, 1.144937, -1.291681, 1, 0.7333333, 0, 1,
-1.183838, -0.1071728, -2.083266, 1, 0.7372549, 0, 1,
-1.177873, 0.2127619, -2.46245, 1, 0.7450981, 0, 1,
-1.175078, -1.027238, -1.662085, 1, 0.7490196, 0, 1,
-1.166375, 1.383901, -0.9334899, 1, 0.7568628, 0, 1,
-1.162864, 1.408511, -2.887776, 1, 0.7607843, 0, 1,
-1.161294, 0.9256105, -1.484837, 1, 0.7686275, 0, 1,
-1.157997, -0.2950392, -1.559035, 1, 0.772549, 0, 1,
-1.142954, 0.07068344, -2.158345, 1, 0.7803922, 0, 1,
-1.134572, 0.8032946, 1.29635, 1, 0.7843137, 0, 1,
-1.119833, -0.09592365, -0.9260792, 1, 0.7921569, 0, 1,
-1.116188, 0.8484504, -2.807483, 1, 0.7960784, 0, 1,
-1.098243, -0.6816662, -1.184082, 1, 0.8039216, 0, 1,
-1.098191, 0.06171433, -0.6571863, 1, 0.8117647, 0, 1,
-1.087448, 0.8471093, 0.1505693, 1, 0.8156863, 0, 1,
-1.082562, 0.2197585, -0.7783711, 1, 0.8235294, 0, 1,
-1.080666, -1.286976, -0.6369355, 1, 0.827451, 0, 1,
-1.065183, 0.1267465, -0.4851683, 1, 0.8352941, 0, 1,
-1.063633, 0.1811497, -3.30353, 1, 0.8392157, 0, 1,
-1.062676, -0.6129397, -2.099157, 1, 0.8470588, 0, 1,
-1.061366, -0.0507651, 0.625052, 1, 0.8509804, 0, 1,
-1.056621, -0.05405875, -2.792225, 1, 0.8588235, 0, 1,
-1.050075, 1.673147, 0.8329598, 1, 0.8627451, 0, 1,
-1.031412, 0.3995025, -3.109174, 1, 0.8705882, 0, 1,
-1.02672, 0.5725715, -0.0489529, 1, 0.8745098, 0, 1,
-1.026422, 1.027717, -1.729194, 1, 0.8823529, 0, 1,
-1.022313, 1.414554, 0.1313186, 1, 0.8862745, 0, 1,
-1.019615, 1.946878, 1.736152, 1, 0.8941177, 0, 1,
-1.018606, -1.175035, -0.641735, 1, 0.8980392, 0, 1,
-1.015717, 0.1792581, -0.9085645, 1, 0.9058824, 0, 1,
-1.009434, -0.3334692, -1.991937, 1, 0.9137255, 0, 1,
-1.007789, 0.5086249, -1.152228, 1, 0.9176471, 0, 1,
-1.002707, 0.7663617, -1.100121, 1, 0.9254902, 0, 1,
-0.997677, -1.052559, -2.604362, 1, 0.9294118, 0, 1,
-0.9959552, -0.8283908, -2.161668, 1, 0.9372549, 0, 1,
-0.9948663, 1.444706, -0.7010775, 1, 0.9411765, 0, 1,
-0.9907869, -0.7258659, 0.09055738, 1, 0.9490196, 0, 1,
-0.9872455, 1.562943, 0.3663723, 1, 0.9529412, 0, 1,
-0.9840488, -1.170103, -1.677249, 1, 0.9607843, 0, 1,
-0.9837302, 0.2135011, -1.37359, 1, 0.9647059, 0, 1,
-0.9751899, -2.068677, -2.99513, 1, 0.972549, 0, 1,
-0.9725046, -0.512385, -1.682375, 1, 0.9764706, 0, 1,
-0.9714996, -0.2237363, -3.387255, 1, 0.9843137, 0, 1,
-0.9449788, -0.2815681, -0.3290139, 1, 0.9882353, 0, 1,
-0.9426314, 0.06556114, -1.213739, 1, 0.9960784, 0, 1,
-0.9410353, -0.3375079, -2.510659, 0.9960784, 1, 0, 1,
-0.9384692, 0.8127146, 0.06954772, 0.9921569, 1, 0, 1,
-0.9367465, 0.4453506, -1.171861, 0.9843137, 1, 0, 1,
-0.9367362, -0.2623475, -2.585754, 0.9803922, 1, 0, 1,
-0.9268693, -1.507809, -2.329593, 0.972549, 1, 0, 1,
-0.9213236, -0.2948883, -0.9036278, 0.9686275, 1, 0, 1,
-0.9211649, 0.3924081, -2.541974, 0.9607843, 1, 0, 1,
-0.9200612, -0.4641177, -1.985964, 0.9568627, 1, 0, 1,
-0.9193935, -0.9853212, -2.678599, 0.9490196, 1, 0, 1,
-0.9154781, 1.433046, -0.4443876, 0.945098, 1, 0, 1,
-0.9126419, 0.07525119, -1.076486, 0.9372549, 1, 0, 1,
-0.9038504, 0.07891029, -1.171322, 0.9333333, 1, 0, 1,
-0.9034509, -0.472441, -2.362339, 0.9254902, 1, 0, 1,
-0.8981578, -1.30413, -1.233888, 0.9215686, 1, 0, 1,
-0.8946177, -0.2531862, -2.530635, 0.9137255, 1, 0, 1,
-0.8813742, 0.280988, 0.5453163, 0.9098039, 1, 0, 1,
-0.8789301, 0.1998688, -1.304841, 0.9019608, 1, 0, 1,
-0.8738326, 0.2754278, -1.518789, 0.8941177, 1, 0, 1,
-0.8708051, -1.407759, -1.501493, 0.8901961, 1, 0, 1,
-0.8702895, 0.4889743, -0.1182213, 0.8823529, 1, 0, 1,
-0.869369, 1.901605, -1.151696, 0.8784314, 1, 0, 1,
-0.8684285, 0.6465566, 0.4336167, 0.8705882, 1, 0, 1,
-0.8663332, -1.338583, -1.962961, 0.8666667, 1, 0, 1,
-0.8658984, -0.9977005, -1.499825, 0.8588235, 1, 0, 1,
-0.8597351, 0.5567368, 1.110672, 0.854902, 1, 0, 1,
-0.8596308, 0.02200997, -1.333824, 0.8470588, 1, 0, 1,
-0.8521883, -0.5558909, -1.818212, 0.8431373, 1, 0, 1,
-0.8507507, -1.105392, -2.42944, 0.8352941, 1, 0, 1,
-0.8480185, -0.1083027, -1.91519, 0.8313726, 1, 0, 1,
-0.8445256, 0.03007544, -0.9630859, 0.8235294, 1, 0, 1,
-0.8354097, -0.1232755, -1.749043, 0.8196079, 1, 0, 1,
-0.8311428, -0.6142575, -3.472752, 0.8117647, 1, 0, 1,
-0.8282692, -0.7714559, -1.073191, 0.8078431, 1, 0, 1,
-0.828002, -0.1918255, -0.8068299, 0.8, 1, 0, 1,
-0.822147, -1.144768, -2.369474, 0.7921569, 1, 0, 1,
-0.8214312, -1.536852, -2.439143, 0.7882353, 1, 0, 1,
-0.8185611, -1.028877, -1.967645, 0.7803922, 1, 0, 1,
-0.8184602, 1.090419, 0.1276472, 0.7764706, 1, 0, 1,
-0.8167842, -2.078926, -3.047987, 0.7686275, 1, 0, 1,
-0.8159449, 0.04730098, -1.505972, 0.7647059, 1, 0, 1,
-0.8102107, 1.098346, -1.93802, 0.7568628, 1, 0, 1,
-0.8097153, 0.04823416, -0.5819365, 0.7529412, 1, 0, 1,
-0.806082, -1.592653, -2.965702, 0.7450981, 1, 0, 1,
-0.7953963, -0.362021, -1.11072, 0.7411765, 1, 0, 1,
-0.7934978, 0.5007077, -0.3646629, 0.7333333, 1, 0, 1,
-0.7914476, -0.215134, -1.248611, 0.7294118, 1, 0, 1,
-0.7887379, 0.2983792, -0.6560321, 0.7215686, 1, 0, 1,
-0.7869747, 0.04230456, -2.294906, 0.7176471, 1, 0, 1,
-0.7853688, -0.02410173, -1.938452, 0.7098039, 1, 0, 1,
-0.7847831, -0.04484518, -2.002268, 0.7058824, 1, 0, 1,
-0.7833412, -1.123167, -4.608568, 0.6980392, 1, 0, 1,
-0.7800761, -1.205865, -4.672576, 0.6901961, 1, 0, 1,
-0.7790949, -0.7410788, -2.67304, 0.6862745, 1, 0, 1,
-0.7770647, -0.9614127, -2.328695, 0.6784314, 1, 0, 1,
-0.7770324, -0.115731, -0.9532729, 0.6745098, 1, 0, 1,
-0.7705392, 0.3843152, -0.8744348, 0.6666667, 1, 0, 1,
-0.7638576, 0.6876808, -0.3065197, 0.6627451, 1, 0, 1,
-0.7554206, -1.050384, -3.605159, 0.654902, 1, 0, 1,
-0.749542, 0.6888991, -2.261792, 0.6509804, 1, 0, 1,
-0.741586, -0.7105857, -2.512504, 0.6431373, 1, 0, 1,
-0.7373452, 2.56408, -1.115198, 0.6392157, 1, 0, 1,
-0.7324887, -0.6037804, -1.921504, 0.6313726, 1, 0, 1,
-0.7266054, 0.535412, -1.555595, 0.627451, 1, 0, 1,
-0.7235429, -0.7019078, -3.262656, 0.6196079, 1, 0, 1,
-0.7228847, -1.513894, -3.709213, 0.6156863, 1, 0, 1,
-0.721912, 0.8429062, -0.7171004, 0.6078432, 1, 0, 1,
-0.7193776, 1.150566, 0.153634, 0.6039216, 1, 0, 1,
-0.7055504, -0.168634, -3.345087, 0.5960785, 1, 0, 1,
-0.7013285, -0.6150055, -2.80097, 0.5882353, 1, 0, 1,
-0.6996232, 0.4877087, -1.760227, 0.5843138, 1, 0, 1,
-0.6985041, -1.424155, -2.543965, 0.5764706, 1, 0, 1,
-0.6945092, 1.978925, -0.9765448, 0.572549, 1, 0, 1,
-0.6842609, 0.05468723, -3.337421, 0.5647059, 1, 0, 1,
-0.6758698, 0.05422757, -1.779491, 0.5607843, 1, 0, 1,
-0.6720763, 0.2778142, -1.131773, 0.5529412, 1, 0, 1,
-0.6707479, -0.7594945, -1.035838, 0.5490196, 1, 0, 1,
-0.6671533, 0.4828821, -1.316113, 0.5411765, 1, 0, 1,
-0.6655228, 1.365851, -0.8505677, 0.5372549, 1, 0, 1,
-0.664116, -1.6316, -4.33146, 0.5294118, 1, 0, 1,
-0.6633434, -0.6228818, -1.502452, 0.5254902, 1, 0, 1,
-0.6482809, 1.421101, -0.4053634, 0.5176471, 1, 0, 1,
-0.6461186, -1.90082, -4.215765, 0.5137255, 1, 0, 1,
-0.6394388, -0.01983792, -0.5006442, 0.5058824, 1, 0, 1,
-0.63812, -0.4014714, -3.975129, 0.5019608, 1, 0, 1,
-0.6362317, 0.8973694, -3.515365, 0.4941176, 1, 0, 1,
-0.622399, 0.4114978, -2.522218, 0.4862745, 1, 0, 1,
-0.6171715, 0.7665816, -1.013714, 0.4823529, 1, 0, 1,
-0.6144676, -1.007248, -1.913133, 0.4745098, 1, 0, 1,
-0.6144075, 0.2669134, -0.2275103, 0.4705882, 1, 0, 1,
-0.6114632, -0.5288899, -2.952044, 0.4627451, 1, 0, 1,
-0.6085548, 0.3299924, -2.558925, 0.4588235, 1, 0, 1,
-0.608364, -1.847239, -3.266787, 0.4509804, 1, 0, 1,
-0.6057581, -1.327373, -2.417152, 0.4470588, 1, 0, 1,
-0.6047454, -1.174684, -2.861532, 0.4392157, 1, 0, 1,
-0.6043041, -0.641504, -2.379185, 0.4352941, 1, 0, 1,
-0.6032252, 0.3878573, -0.1477946, 0.427451, 1, 0, 1,
-0.6004716, -0.1035245, -2.598936, 0.4235294, 1, 0, 1,
-0.6004661, -0.3249595, -0.9328333, 0.4156863, 1, 0, 1,
-0.5929888, 0.2826566, -2.120702, 0.4117647, 1, 0, 1,
-0.5926487, -1.716774, -3.547754, 0.4039216, 1, 0, 1,
-0.5859903, -0.3523505, -2.835122, 0.3960784, 1, 0, 1,
-0.5857375, 1.300627, -1.391846, 0.3921569, 1, 0, 1,
-0.5778767, 0.6343637, -1.973216, 0.3843137, 1, 0, 1,
-0.5759339, -0.3714153, -0.8247716, 0.3803922, 1, 0, 1,
-0.5758118, 1.24845, -0.2037052, 0.372549, 1, 0, 1,
-0.5737032, -0.3548323, -2.418036, 0.3686275, 1, 0, 1,
-0.572051, 0.2792379, 0.1260356, 0.3607843, 1, 0, 1,
-0.5692642, -0.1319775, -1.291297, 0.3568628, 1, 0, 1,
-0.5691076, -0.9955405, -0.9308563, 0.3490196, 1, 0, 1,
-0.5512065, 0.1866235, -2.274777, 0.345098, 1, 0, 1,
-0.5486849, 1.073758, -1.799341, 0.3372549, 1, 0, 1,
-0.5367034, 1.979801, -0.9733616, 0.3333333, 1, 0, 1,
-0.5326047, -0.8916755, -2.670906, 0.3254902, 1, 0, 1,
-0.5320967, 0.001644177, -1.590344, 0.3215686, 1, 0, 1,
-0.5303775, 0.4039441, -0.4306575, 0.3137255, 1, 0, 1,
-0.5301856, -0.3060716, -3.106815, 0.3098039, 1, 0, 1,
-0.5269598, -0.1546652, -1.37766, 0.3019608, 1, 0, 1,
-0.5188822, 1.075293, -1.231523, 0.2941177, 1, 0, 1,
-0.5162213, -1.023196, -1.902678, 0.2901961, 1, 0, 1,
-0.512707, -1.883054, -4.132844, 0.282353, 1, 0, 1,
-0.5121268, 0.5762213, -0.5779247, 0.2784314, 1, 0, 1,
-0.5096257, -0.5215222, -3.082922, 0.2705882, 1, 0, 1,
-0.5094254, -2.145106, -1.464924, 0.2666667, 1, 0, 1,
-0.5034608, -0.9647162, -3.89259, 0.2588235, 1, 0, 1,
-0.5008501, 0.02641836, -1.504337, 0.254902, 1, 0, 1,
-0.4987823, 0.1963135, -1.730924, 0.2470588, 1, 0, 1,
-0.4981712, 1.123081, -0.3082637, 0.2431373, 1, 0, 1,
-0.4923612, 0.4340162, -0.1565449, 0.2352941, 1, 0, 1,
-0.4903919, 0.411524, 0.09500358, 0.2313726, 1, 0, 1,
-0.4811482, 0.6984819, -0.8122135, 0.2235294, 1, 0, 1,
-0.4770342, -2.643185, -2.362553, 0.2196078, 1, 0, 1,
-0.4757458, -0.4857726, -1.315225, 0.2117647, 1, 0, 1,
-0.4728675, -0.977073, -1.671762, 0.2078431, 1, 0, 1,
-0.4711795, 0.5835624, -0.8715039, 0.2, 1, 0, 1,
-0.4710452, -0.2360961, -1.785379, 0.1921569, 1, 0, 1,
-0.467651, 0.7399239, -0.07164238, 0.1882353, 1, 0, 1,
-0.4672791, 1.247561, -1.536351, 0.1803922, 1, 0, 1,
-0.4608292, 0.735348, -0.6675125, 0.1764706, 1, 0, 1,
-0.4596165, 0.3640524, -0.126223, 0.1686275, 1, 0, 1,
-0.456648, 0.01961716, -2.027413, 0.1647059, 1, 0, 1,
-0.4546178, -0.4216087, -1.321594, 0.1568628, 1, 0, 1,
-0.4532633, -0.1845264, -2.35965, 0.1529412, 1, 0, 1,
-0.4527257, 1.334226, -0.440787, 0.145098, 1, 0, 1,
-0.4484513, 0.227373, -0.7415197, 0.1411765, 1, 0, 1,
-0.4446383, 0.1237963, -2.813696, 0.1333333, 1, 0, 1,
-0.4438082, 0.1444218, -0.1938051, 0.1294118, 1, 0, 1,
-0.4416711, 0.1313192, 0.04124954, 0.1215686, 1, 0, 1,
-0.4370065, -0.4602158, -3.481371, 0.1176471, 1, 0, 1,
-0.4266685, 1.995585, -0.7828354, 0.1098039, 1, 0, 1,
-0.4259014, 0.4650944, -1.029733, 0.1058824, 1, 0, 1,
-0.422592, -0.7639186, -3.781214, 0.09803922, 1, 0, 1,
-0.4221226, 0.9328427, -0.2502854, 0.09019608, 1, 0, 1,
-0.4217885, 0.1577047, -2.543968, 0.08627451, 1, 0, 1,
-0.4192362, -1.194119, -1.828558, 0.07843138, 1, 0, 1,
-0.4150011, -0.03259004, -2.611638, 0.07450981, 1, 0, 1,
-0.4131783, -2.388643, -4.530428, 0.06666667, 1, 0, 1,
-0.405946, 0.9028515, -0.08901148, 0.0627451, 1, 0, 1,
-0.4058142, 1.47532, -0.4952834, 0.05490196, 1, 0, 1,
-0.4051811, 0.6613254, -0.2168553, 0.05098039, 1, 0, 1,
-0.4000894, 0.4301737, -1.304891, 0.04313726, 1, 0, 1,
-0.3992338, 0.7924177, 0.8620757, 0.03921569, 1, 0, 1,
-0.393173, 1.47549, -0.1485307, 0.03137255, 1, 0, 1,
-0.392658, 0.1076697, -0.9080738, 0.02745098, 1, 0, 1,
-0.3901045, -1.151881, -3.6182, 0.01960784, 1, 0, 1,
-0.3872825, -0.1962134, -1.603301, 0.01568628, 1, 0, 1,
-0.3844766, 0.1454549, -1.88599, 0.007843138, 1, 0, 1,
-0.3814768, 0.8141537, -0.6532927, 0.003921569, 1, 0, 1,
-0.3797221, -0.8181861, -3.505005, 0, 1, 0.003921569, 1,
-0.3775236, 0.07322347, -3.200691, 0, 1, 0.01176471, 1,
-0.373123, -3.2704, -3.410976, 0, 1, 0.01568628, 1,
-0.3693448, -0.3643261, -2.677567, 0, 1, 0.02352941, 1,
-0.3684076, 0.1544822, -0.4385565, 0, 1, 0.02745098, 1,
-0.3651068, 1.522911, -0.7636786, 0, 1, 0.03529412, 1,
-0.3625298, 0.7737848, -0.8823248, 0, 1, 0.03921569, 1,
-0.3562336, 0.07303291, -2.282841, 0, 1, 0.04705882, 1,
-0.3517667, 0.1991351, -2.281817, 0, 1, 0.05098039, 1,
-0.3510648, -1.805355, -3.473378, 0, 1, 0.05882353, 1,
-0.3489618, -0.09735847, -2.703906, 0, 1, 0.0627451, 1,
-0.3470273, -0.8361621, -1.345456, 0, 1, 0.07058824, 1,
-0.3444912, -0.3857756, -3.001646, 0, 1, 0.07450981, 1,
-0.3434927, 0.2649477, -0.4460194, 0, 1, 0.08235294, 1,
-0.334661, -1.13342, -2.396776, 0, 1, 0.08627451, 1,
-0.3279653, 0.08569777, -2.151284, 0, 1, 0.09411765, 1,
-0.3189544, -0.06446429, -1.682466, 0, 1, 0.1019608, 1,
-0.3187028, -0.2417293, -3.30999, 0, 1, 0.1058824, 1,
-0.3184789, 0.2860417, -0.7250131, 0, 1, 0.1137255, 1,
-0.3120805, -1.338765, -3.995466, 0, 1, 0.1176471, 1,
-0.304457, -1.185071, -4.771466, 0, 1, 0.1254902, 1,
-0.3036151, -0.3015503, -2.708604, 0, 1, 0.1294118, 1,
-0.303143, -1.248388, -2.537413, 0, 1, 0.1372549, 1,
-0.3027056, -0.706998, -4.226585, 0, 1, 0.1411765, 1,
-0.3008656, 1.259802, -0.8517716, 0, 1, 0.1490196, 1,
-0.3006529, 0.9563242, -0.6445231, 0, 1, 0.1529412, 1,
-0.299166, 0.9177276, -1.562884, 0, 1, 0.1607843, 1,
-0.296697, -1.06466, -2.331187, 0, 1, 0.1647059, 1,
-0.2936735, -0.3239467, -4.219807, 0, 1, 0.172549, 1,
-0.2936633, -1.070512, -2.884575, 0, 1, 0.1764706, 1,
-0.2934492, -0.1306201, -1.832371, 0, 1, 0.1843137, 1,
-0.2932028, 0.02745471, -0.7446449, 0, 1, 0.1882353, 1,
-0.2929353, -0.3155413, -1.878326, 0, 1, 0.1960784, 1,
-0.2901357, 0.7578015, 0.4154639, 0, 1, 0.2039216, 1,
-0.288472, -0.6228957, -2.237224, 0, 1, 0.2078431, 1,
-0.2882539, 0.9594294, -0.2731607, 0, 1, 0.2156863, 1,
-0.2881369, 0.3438821, -0.6332808, 0, 1, 0.2196078, 1,
-0.2880588, 1.0919, -0.8632104, 0, 1, 0.227451, 1,
-0.2869979, 0.2696859, 0.7543063, 0, 1, 0.2313726, 1,
-0.284799, 0.6595197, -3.43256, 0, 1, 0.2392157, 1,
-0.2841009, 2.481966, -0.09737438, 0, 1, 0.2431373, 1,
-0.2831112, 0.4245863, 1.474431, 0, 1, 0.2509804, 1,
-0.2800331, -0.4312306, -1.899847, 0, 1, 0.254902, 1,
-0.2779556, -0.9003026, -2.524334, 0, 1, 0.2627451, 1,
-0.2752445, 0.596172, -0.07369189, 0, 1, 0.2666667, 1,
-0.27219, -0.2953761, -1.960479, 0, 1, 0.2745098, 1,
-0.2714239, -0.7882429, -3.84675, 0, 1, 0.2784314, 1,
-0.269688, -0.06010235, -1.219269, 0, 1, 0.2862745, 1,
-0.2696378, -1.506612, -3.420365, 0, 1, 0.2901961, 1,
-0.2687882, -0.03700148, -1.859695, 0, 1, 0.2980392, 1,
-0.2629952, -0.97695, -3.235216, 0, 1, 0.3058824, 1,
-0.262776, 0.4562607, -0.01114706, 0, 1, 0.3098039, 1,
-0.252266, 0.2550862, -0.7191219, 0, 1, 0.3176471, 1,
-0.2508793, -0.1239356, -2.227971, 0, 1, 0.3215686, 1,
-0.2462531, 0.3832802, -1.703442, 0, 1, 0.3294118, 1,
-0.2452466, -1.240494, -1.796944, 0, 1, 0.3333333, 1,
-0.2412866, -0.3059036, -2.508729, 0, 1, 0.3411765, 1,
-0.2411275, 0.5270259, 1.561698, 0, 1, 0.345098, 1,
-0.2395889, 0.4028809, 1.144556, 0, 1, 0.3529412, 1,
-0.2389359, -0.1395496, -2.932496, 0, 1, 0.3568628, 1,
-0.2388407, 0.7361568, 0.1379773, 0, 1, 0.3647059, 1,
-0.2364212, -0.1975511, -2.994513, 0, 1, 0.3686275, 1,
-0.2356319, 0.3904897, 0.2331001, 0, 1, 0.3764706, 1,
-0.2310748, 0.1567677, -1.269199, 0, 1, 0.3803922, 1,
-0.2277454, -0.03444395, -2.893922, 0, 1, 0.3882353, 1,
-0.2197448, -0.246958, -1.898569, 0, 1, 0.3921569, 1,
-0.2173703, -0.04274444, -1.795349, 0, 1, 0.4, 1,
-0.2170706, 0.5408637, -0.242635, 0, 1, 0.4078431, 1,
-0.2160215, -0.3955562, -1.909334, 0, 1, 0.4117647, 1,
-0.2134592, 0.1788745, -1.586523, 0, 1, 0.4196078, 1,
-0.203162, -0.4757242, -2.862776, 0, 1, 0.4235294, 1,
-0.2012848, -2.375518, -3.265409, 0, 1, 0.4313726, 1,
-0.1978885, 0.6782407, -0.4026405, 0, 1, 0.4352941, 1,
-0.1972816, -0.9725297, -1.168338, 0, 1, 0.4431373, 1,
-0.1899045, -0.020415, -1.022965, 0, 1, 0.4470588, 1,
-0.1891051, -0.7225822, -2.625829, 0, 1, 0.454902, 1,
-0.1876632, -2.060577, -2.779907, 0, 1, 0.4588235, 1,
-0.1849205, -0.2559341, -1.900342, 0, 1, 0.4666667, 1,
-0.1838859, 2.25274, -0.6415814, 0, 1, 0.4705882, 1,
-0.1832165, -1.799107, -3.195339, 0, 1, 0.4784314, 1,
-0.1828506, 0.4975914, -0.2413048, 0, 1, 0.4823529, 1,
-0.1805698, -1.982259, -4.840414, 0, 1, 0.4901961, 1,
-0.1757364, -2.250533, -3.604618, 0, 1, 0.4941176, 1,
-0.1746654, -0.06819586, -2.466358, 0, 1, 0.5019608, 1,
-0.1713418, 0.3877614, -1.830968, 0, 1, 0.509804, 1,
-0.1694943, 0.9755806, 0.4737121, 0, 1, 0.5137255, 1,
-0.1642769, -0.4950525, -4.319632, 0, 1, 0.5215687, 1,
-0.1637958, -0.2460018, -2.040436, 0, 1, 0.5254902, 1,
-0.1635851, 1.184068, 0.1152757, 0, 1, 0.5333334, 1,
-0.1592361, -0.1845514, -2.635617, 0, 1, 0.5372549, 1,
-0.1571881, -0.04669229, -2.087018, 0, 1, 0.5450981, 1,
-0.1564594, 0.3900665, -0.07062335, 0, 1, 0.5490196, 1,
-0.1550037, -0.8915895, -2.710976, 0, 1, 0.5568628, 1,
-0.1539646, -1.000469, -3.834742, 0, 1, 0.5607843, 1,
-0.1509034, -0.01791233, -0.9561303, 0, 1, 0.5686275, 1,
-0.1500841, 1.174582, -0.5164848, 0, 1, 0.572549, 1,
-0.1490042, -2.134832, -0.4555892, 0, 1, 0.5803922, 1,
-0.1451036, 0.814633, 0.8397661, 0, 1, 0.5843138, 1,
-0.1420429, 0.145105, -1.61538, 0, 1, 0.5921569, 1,
-0.1393747, 1.201076, 1.488209, 0, 1, 0.5960785, 1,
-0.1377432, -0.1396233, -1.394591, 0, 1, 0.6039216, 1,
-0.1350713, 0.04446872, -1.646653, 0, 1, 0.6117647, 1,
-0.1341833, -0.6032616, -0.8023036, 0, 1, 0.6156863, 1,
-0.13094, 0.4042047, 1.562022, 0, 1, 0.6235294, 1,
-0.1305829, -1.073635, -1.156851, 0, 1, 0.627451, 1,
-0.12722, -0.06563462, -2.409127, 0, 1, 0.6352941, 1,
-0.1243811, -0.201917, -2.430479, 0, 1, 0.6392157, 1,
-0.1216019, -1.885601, -1.862969, 0, 1, 0.6470588, 1,
-0.1166163, -0.5556646, -5.068826, 0, 1, 0.6509804, 1,
-0.1149033, -2.195755, -1.35154, 0, 1, 0.6588235, 1,
-0.114707, -0.2832779, -4.739407, 0, 1, 0.6627451, 1,
-0.1146167, 0.2948907, -0.153697, 0, 1, 0.6705883, 1,
-0.1142232, 0.1812514, -0.2371367, 0, 1, 0.6745098, 1,
-0.106393, 0.1471995, -1.39009, 0, 1, 0.682353, 1,
-0.1062051, 2.216778, -1.817008, 0, 1, 0.6862745, 1,
-0.1036075, -1.354419, -3.101692, 0, 1, 0.6941177, 1,
-0.1016153, -1.258077, -2.678082, 0, 1, 0.7019608, 1,
-0.09997598, -2.593827, -2.842101, 0, 1, 0.7058824, 1,
-0.09559078, 0.6001476, 0.5143003, 0, 1, 0.7137255, 1,
-0.09404113, -1.215074, -1.490496, 0, 1, 0.7176471, 1,
-0.09374464, -0.5437573, -4.869754, 0, 1, 0.7254902, 1,
-0.08672325, -1.573746, -4.055584, 0, 1, 0.7294118, 1,
-0.08570581, 0.4552499, -0.1325243, 0, 1, 0.7372549, 1,
-0.08533926, 0.673344, 0.9934317, 0, 1, 0.7411765, 1,
-0.0805558, -0.9057793, -2.495998, 0, 1, 0.7490196, 1,
-0.07661013, -1.502849, -3.761957, 0, 1, 0.7529412, 1,
-0.07564385, 0.3150832, 0.8069733, 0, 1, 0.7607843, 1,
-0.07488736, -1.032058, -3.363809, 0, 1, 0.7647059, 1,
-0.07466578, 0.6149919, -1.562433, 0, 1, 0.772549, 1,
-0.07335087, 0.3967854, -0.9785778, 0, 1, 0.7764706, 1,
-0.07159259, 1.652458, -0.797732, 0, 1, 0.7843137, 1,
-0.07134856, -0.6434121, -4.586599, 0, 1, 0.7882353, 1,
-0.06924162, 0.8473321, 0.1619502, 0, 1, 0.7960784, 1,
-0.06830945, -0.717282, -4.114733, 0, 1, 0.8039216, 1,
-0.06497843, 0.3928351, -0.8991905, 0, 1, 0.8078431, 1,
-0.06129472, -1.71049, -2.998984, 0, 1, 0.8156863, 1,
-0.06027795, 0.2994248, -1.84229, 0, 1, 0.8196079, 1,
-0.05454575, -0.6346216, -2.318344, 0, 1, 0.827451, 1,
-0.05348162, 0.5748705, 1.18329, 0, 1, 0.8313726, 1,
-0.05080378, 0.5739213, -0.688419, 0, 1, 0.8392157, 1,
-0.04718192, 0.6566401, 1.035151, 0, 1, 0.8431373, 1,
-0.04567904, 2.664707, -1.11698, 0, 1, 0.8509804, 1,
-0.03834838, 0.9129484, 1.298917, 0, 1, 0.854902, 1,
-0.03736502, -0.7284595, -2.038593, 0, 1, 0.8627451, 1,
-0.03599883, -0.0931597, -3.136443, 0, 1, 0.8666667, 1,
-0.02934927, 0.9049272, 0.4717413, 0, 1, 0.8745098, 1,
-0.02711745, -0.4255117, -2.651758, 0, 1, 0.8784314, 1,
-0.02687875, 1.830743, 0.7834768, 0, 1, 0.8862745, 1,
-0.02358096, 0.470508, 0.4479825, 0, 1, 0.8901961, 1,
-0.02232512, -0.4803234, -0.5459759, 0, 1, 0.8980392, 1,
-0.01736089, 0.9987301, -0.4317011, 0, 1, 0.9058824, 1,
-0.01639173, -1.793339, -1.827113, 0, 1, 0.9098039, 1,
-0.008024447, -1.703436, -1.632261, 0, 1, 0.9176471, 1,
-0.007936614, -0.4782948, -2.417325, 0, 1, 0.9215686, 1,
-0.007559201, -1.353519, -0.5990744, 0, 1, 0.9294118, 1,
-0.007208428, -0.8667017, -3.293417, 0, 1, 0.9333333, 1,
-0.006515528, -0.1745754, -3.52496, 0, 1, 0.9411765, 1,
-0.004876376, 0.7534704, -0.3417422, 0, 1, 0.945098, 1,
-0.004066063, -1.210248, -2.688043, 0, 1, 0.9529412, 1,
-0.002642854, -0.6780213, -2.12818, 0, 1, 0.9568627, 1,
-0.002244002, -0.557473, -4.044141, 0, 1, 0.9647059, 1,
-0.001589931, 2.302491, 2.084589, 0, 1, 0.9686275, 1,
0.008034889, 0.04323955, 0.0801743, 0, 1, 0.9764706, 1,
0.01123632, 0.5023876, -0.7817562, 0, 1, 0.9803922, 1,
0.01201954, -0.3949096, 2.863804, 0, 1, 0.9882353, 1,
0.01237593, 0.2084325, 1.322299, 0, 1, 0.9921569, 1,
0.01450566, -0.5908362, 1.826753, 0, 1, 1, 1,
0.01653348, 0.2446883, -1.048869, 0, 0.9921569, 1, 1,
0.01821815, -2.294548, 1.981504, 0, 0.9882353, 1, 1,
0.02523907, 1.652852, -1.873042, 0, 0.9803922, 1, 1,
0.02538598, -1.475958, 5.128901, 0, 0.9764706, 1, 1,
0.02701081, -0.7012113, 1.405728, 0, 0.9686275, 1, 1,
0.0293913, 0.7101538, -0.9533352, 0, 0.9647059, 1, 1,
0.03344317, 0.3552559, -0.3456312, 0, 0.9568627, 1, 1,
0.03802187, 0.8144904, 0.4686235, 0, 0.9529412, 1, 1,
0.03827585, -0.4036711, 3.660166, 0, 0.945098, 1, 1,
0.04144043, -0.5584161, 3.191996, 0, 0.9411765, 1, 1,
0.04315779, 1.774213, -0.7730174, 0, 0.9333333, 1, 1,
0.04522275, -1.202241, 4.013092, 0, 0.9294118, 1, 1,
0.04911519, 1.107228, -1.680596, 0, 0.9215686, 1, 1,
0.05346462, -1.316102, 3.441073, 0, 0.9176471, 1, 1,
0.05575474, -0.982517, 1.643813, 0, 0.9098039, 1, 1,
0.05808478, -1.034146, 2.788785, 0, 0.9058824, 1, 1,
0.06366792, -0.671979, 2.530794, 0, 0.8980392, 1, 1,
0.06502505, -0.1839955, 2.012932, 0, 0.8901961, 1, 1,
0.07144631, -1.390187, 3.547988, 0, 0.8862745, 1, 1,
0.07631732, 1.041298, 0.4579257, 0, 0.8784314, 1, 1,
0.08138918, -1.19927, 2.036224, 0, 0.8745098, 1, 1,
0.08355455, 0.2060654, -0.1888903, 0, 0.8666667, 1, 1,
0.08401616, -3.472978, 4.261852, 0, 0.8627451, 1, 1,
0.08454584, 0.4902779, -0.3495259, 0, 0.854902, 1, 1,
0.09009934, 0.7180179, 0.1863956, 0, 0.8509804, 1, 1,
0.09449282, -0.07362441, 2.662182, 0, 0.8431373, 1, 1,
0.09904721, 0.2515277, 1.538099, 0, 0.8392157, 1, 1,
0.09990196, 1.908007, -1.667729, 0, 0.8313726, 1, 1,
0.1011364, 1.221908, -1.177812, 0, 0.827451, 1, 1,
0.1029059, 0.3964776, 0.8645412, 0, 0.8196079, 1, 1,
0.1031087, 0.06650812, -0.8300688, 0, 0.8156863, 1, 1,
0.1053676, 1.482251, 0.7077667, 0, 0.8078431, 1, 1,
0.105634, 1.086595, -1.318257, 0, 0.8039216, 1, 1,
0.1068156, 0.4947923, -0.4169504, 0, 0.7960784, 1, 1,
0.1076935, -1.332755, 3.573749, 0, 0.7882353, 1, 1,
0.1078551, 1.019656, 1.019852, 0, 0.7843137, 1, 1,
0.1113409, -0.2372604, 2.584318, 0, 0.7764706, 1, 1,
0.1141014, 0.5234479, 1.11332, 0, 0.772549, 1, 1,
0.1150202, -0.3548324, 3.092993, 0, 0.7647059, 1, 1,
0.1169149, 0.1881741, 1.893648, 0, 0.7607843, 1, 1,
0.1180119, 0.5115076, 0.1876684, 0, 0.7529412, 1, 1,
0.1199286, 0.3804556, -1.401882, 0, 0.7490196, 1, 1,
0.120928, -0.6320376, 1.677681, 0, 0.7411765, 1, 1,
0.1229313, 0.7347477, 1.893959, 0, 0.7372549, 1, 1,
0.1255839, -2.109893, 1.778346, 0, 0.7294118, 1, 1,
0.1275336, -0.1363576, 2.602877, 0, 0.7254902, 1, 1,
0.1297819, -0.1623519, 1.753006, 0, 0.7176471, 1, 1,
0.1313651, -1.001737, 2.193437, 0, 0.7137255, 1, 1,
0.1320698, -0.4929586, 2.497108, 0, 0.7058824, 1, 1,
0.1326514, 0.9377472, 0.1991709, 0, 0.6980392, 1, 1,
0.1355238, 0.3834299, 0.5340104, 0, 0.6941177, 1, 1,
0.1382104, 1.765313, -0.4576563, 0, 0.6862745, 1, 1,
0.1386487, 0.2734131, 1.541757, 0, 0.682353, 1, 1,
0.1388499, -0.3953535, 5.258297, 0, 0.6745098, 1, 1,
0.1413181, -2.699063, 2.474697, 0, 0.6705883, 1, 1,
0.1414244, -1.137277, 3.179564, 0, 0.6627451, 1, 1,
0.1454339, -0.7218414, 1.416104, 0, 0.6588235, 1, 1,
0.1455487, 0.03327985, -0.09443499, 0, 0.6509804, 1, 1,
0.1478678, -0.1928534, 2.034574, 0, 0.6470588, 1, 1,
0.1502777, -0.9453384, 3.931546, 0, 0.6392157, 1, 1,
0.1536821, 1.859086, 1.117125, 0, 0.6352941, 1, 1,
0.1588767, -0.1718978, 2.276469, 0, 0.627451, 1, 1,
0.1655135, -0.8238958, 3.788665, 0, 0.6235294, 1, 1,
0.1669156, 2.015204, 0.6649863, 0, 0.6156863, 1, 1,
0.1703233, -1.24155, 3.959239, 0, 0.6117647, 1, 1,
0.1705468, -0.4571708, 2.612798, 0, 0.6039216, 1, 1,
0.1731702, -0.2598779, 2.531275, 0, 0.5960785, 1, 1,
0.1751169, -0.7217996, 1.663484, 0, 0.5921569, 1, 1,
0.1753202, -0.7651433, 3.554844, 0, 0.5843138, 1, 1,
0.1763275, 0.1864948, 2.774814, 0, 0.5803922, 1, 1,
0.1783802, -0.1044783, 3.054802, 0, 0.572549, 1, 1,
0.1801488, -0.6584844, 3.140187, 0, 0.5686275, 1, 1,
0.1804332, 2.368355, -2.429249, 0, 0.5607843, 1, 1,
0.1853473, 0.4917707, 0.3272182, 0, 0.5568628, 1, 1,
0.1873545, -0.1821819, 3.253187, 0, 0.5490196, 1, 1,
0.1895332, 0.594609, -0.8907974, 0, 0.5450981, 1, 1,
0.1899908, -0.8841997, 3.261953, 0, 0.5372549, 1, 1,
0.1908405, -1.230818, 2.2572, 0, 0.5333334, 1, 1,
0.1911758, 0.2801071, 1.17835, 0, 0.5254902, 1, 1,
0.1913204, 2.422572, -0.425526, 0, 0.5215687, 1, 1,
0.1924963, -0.3799779, 2.826541, 0, 0.5137255, 1, 1,
0.1932068, -1.207735, 3.099151, 0, 0.509804, 1, 1,
0.2006182, 1.408535, -0.6614469, 0, 0.5019608, 1, 1,
0.2030573, -0.5359048, 3.962325, 0, 0.4941176, 1, 1,
0.203889, -0.2469135, 1.875198, 0, 0.4901961, 1, 1,
0.2049202, -1.692185, 2.065907, 0, 0.4823529, 1, 1,
0.2053002, 1.979461, -0.3783854, 0, 0.4784314, 1, 1,
0.2062927, 0.9438762, -1.283377, 0, 0.4705882, 1, 1,
0.212881, -1.253468, 2.850376, 0, 0.4666667, 1, 1,
0.2137268, -0.9030871, 2.626501, 0, 0.4588235, 1, 1,
0.2183832, 0.2914782, -0.3410804, 0, 0.454902, 1, 1,
0.2248436, -0.6734466, 3.120408, 0, 0.4470588, 1, 1,
0.2252779, -0.04084295, 1.406438, 0, 0.4431373, 1, 1,
0.2300216, 0.4218564, 1.094173, 0, 0.4352941, 1, 1,
0.2310988, 0.5828414, -0.2117035, 0, 0.4313726, 1, 1,
0.2336749, -0.004278361, 1.619715, 0, 0.4235294, 1, 1,
0.2359833, -0.6530054, 4.060267, 0, 0.4196078, 1, 1,
0.2368446, -0.3849071, 2.183356, 0, 0.4117647, 1, 1,
0.2404361, -0.179961, 3.932154, 0, 0.4078431, 1, 1,
0.246773, -0.536644, 1.521561, 0, 0.4, 1, 1,
0.2479478, 0.1535165, 0.2029739, 0, 0.3921569, 1, 1,
0.2490462, 0.9644775, 3.55971, 0, 0.3882353, 1, 1,
0.2545785, 0.1557555, -0.1674264, 0, 0.3803922, 1, 1,
0.2547837, 0.9316472, 1.033278, 0, 0.3764706, 1, 1,
0.2554458, -1.585244, 4.048091, 0, 0.3686275, 1, 1,
0.260773, -0.4958618, 3.986105, 0, 0.3647059, 1, 1,
0.262508, 0.4840687, 1.632967, 0, 0.3568628, 1, 1,
0.2632726, 0.5766256, 1.033085, 0, 0.3529412, 1, 1,
0.2643158, -2.154858, 0.2035727, 0, 0.345098, 1, 1,
0.2689106, 1.266651, -0.6481231, 0, 0.3411765, 1, 1,
0.271432, -0.378638, 2.944377, 0, 0.3333333, 1, 1,
0.272036, -0.01630698, 2.087752, 0, 0.3294118, 1, 1,
0.27828, 0.00868616, 0.6516192, 0, 0.3215686, 1, 1,
0.2816886, 1.687512, 0.3770202, 0, 0.3176471, 1, 1,
0.2879863, -0.1548449, 2.209528, 0, 0.3098039, 1, 1,
0.2882736, -0.1457397, 2.214686, 0, 0.3058824, 1, 1,
0.2902381, -0.5639665, 1.893742, 0, 0.2980392, 1, 1,
0.2927121, 0.1729253, 0.9547561, 0, 0.2901961, 1, 1,
0.2968848, -0.2717755, 4.141072, 0, 0.2862745, 1, 1,
0.2977876, 3.833383, 0.127147, 0, 0.2784314, 1, 1,
0.3069173, 1.934427, -0.5305293, 0, 0.2745098, 1, 1,
0.3083506, -0.4692552, 2.959058, 0, 0.2666667, 1, 1,
0.3149035, -1.133509, 1.657716, 0, 0.2627451, 1, 1,
0.318138, -0.2693174, 1.196764, 0, 0.254902, 1, 1,
0.3197209, 0.8463163, 0.4664533, 0, 0.2509804, 1, 1,
0.3200255, 1.103632, -0.9368361, 0, 0.2431373, 1, 1,
0.3218606, -1.606152, 2.048751, 0, 0.2392157, 1, 1,
0.3235272, -1.410839, 1.885134, 0, 0.2313726, 1, 1,
0.3238737, -0.6293479, 3.096267, 0, 0.227451, 1, 1,
0.3292495, 1.616071, 0.9822295, 0, 0.2196078, 1, 1,
0.329401, 1.061141, 1.820192, 0, 0.2156863, 1, 1,
0.3316949, -1.900849, 2.168444, 0, 0.2078431, 1, 1,
0.3323452, -0.4952357, 3.042145, 0, 0.2039216, 1, 1,
0.3356465, -2.066097, 1.092131, 0, 0.1960784, 1, 1,
0.3393242, 1.352662, 0.3908148, 0, 0.1882353, 1, 1,
0.3456527, 0.578676, 1.110401, 0, 0.1843137, 1, 1,
0.3465947, 0.3325126, -1.922256, 0, 0.1764706, 1, 1,
0.34727, 1.906859, 0.2365684, 0, 0.172549, 1, 1,
0.3503393, 0.1581433, 3.16874, 0, 0.1647059, 1, 1,
0.3544087, 0.7984581, 1.101826, 0, 0.1607843, 1, 1,
0.3595541, -0.5323817, 3.190468, 0, 0.1529412, 1, 1,
0.3660665, -1.40092, 1.692712, 0, 0.1490196, 1, 1,
0.3672398, -1.110693, 1.102905, 0, 0.1411765, 1, 1,
0.3676568, -2.014971, 3.539449, 0, 0.1372549, 1, 1,
0.369278, -0.2979707, 0.8501496, 0, 0.1294118, 1, 1,
0.3732915, -1.078346, 2.338061, 0, 0.1254902, 1, 1,
0.3763008, -1.608174, 3.553062, 0, 0.1176471, 1, 1,
0.3791851, -1.066761, 2.280178, 0, 0.1137255, 1, 1,
0.3792309, -1.043075, 2.2741, 0, 0.1058824, 1, 1,
0.3797377, 1.632851, 0.3639317, 0, 0.09803922, 1, 1,
0.3830576, -2.178707, 5.489812, 0, 0.09411765, 1, 1,
0.3876389, -0.2810233, 2.790947, 0, 0.08627451, 1, 1,
0.387677, -1.16685, 3.92324, 0, 0.08235294, 1, 1,
0.3889492, 0.5332102, -0.01463998, 0, 0.07450981, 1, 1,
0.3943315, -0.2709665, 1.709308, 0, 0.07058824, 1, 1,
0.3963487, 0.08178214, 2.171197, 0, 0.0627451, 1, 1,
0.4024065, 1.151501, 1.61211, 0, 0.05882353, 1, 1,
0.40312, 1.045631, -0.7341287, 0, 0.05098039, 1, 1,
0.4070651, -0.0253678, 0.4713059, 0, 0.04705882, 1, 1,
0.4087254, 0.4889251, 1.332464, 0, 0.03921569, 1, 1,
0.4154702, -0.6055145, 1.907248, 0, 0.03529412, 1, 1,
0.4172075, -1.255979, 5.722003, 0, 0.02745098, 1, 1,
0.4174591, 0.9725947, -0.9238514, 0, 0.02352941, 1, 1,
0.4202985, 0.2355974, 0.8422414, 0, 0.01568628, 1, 1,
0.425361, -2.429174, 4.253197, 0, 0.01176471, 1, 1,
0.4259796, 0.1243605, 1.824974, 0, 0.003921569, 1, 1,
0.4275025, -0.07773424, 1.858167, 0.003921569, 0, 1, 1,
0.4290984, -0.08667728, 2.597056, 0.007843138, 0, 1, 1,
0.433849, 0.5522007, 1.966546, 0.01568628, 0, 1, 1,
0.4345181, -2.0456, 2.347856, 0.01960784, 0, 1, 1,
0.4391403, -2.025381, 3.137841, 0.02745098, 0, 1, 1,
0.440264, -0.1174257, 0.6567253, 0.03137255, 0, 1, 1,
0.4411505, -0.2844209, 2.784973, 0.03921569, 0, 1, 1,
0.4412766, 0.320937, 2.061537, 0.04313726, 0, 1, 1,
0.4441678, 0.6982357, 0.3714975, 0.05098039, 0, 1, 1,
0.4531546, -0.3106719, 2.134069, 0.05490196, 0, 1, 1,
0.4566554, -0.7030343, 2.92508, 0.0627451, 0, 1, 1,
0.4609667, -1.150583, 3.513274, 0.06666667, 0, 1, 1,
0.4623083, 1.362566, -0.2986255, 0.07450981, 0, 1, 1,
0.4625248, 1.362373, 1.169063, 0.07843138, 0, 1, 1,
0.4678014, -0.8334454, 2.186383, 0.08627451, 0, 1, 1,
0.4681844, 0.1051663, 2.893481, 0.09019608, 0, 1, 1,
0.4716433, -0.4963974, 2.596782, 0.09803922, 0, 1, 1,
0.4731084, -0.8360232, 1.532917, 0.1058824, 0, 1, 1,
0.4737996, 0.1422597, 0.3438793, 0.1098039, 0, 1, 1,
0.4745947, -1.313375, 3.835934, 0.1176471, 0, 1, 1,
0.4767293, 0.3599823, 1.589454, 0.1215686, 0, 1, 1,
0.4787619, -0.4000935, 2.500813, 0.1294118, 0, 1, 1,
0.4804156, -0.1897156, 3.371343, 0.1333333, 0, 1, 1,
0.4821726, -1.077535, 2.758175, 0.1411765, 0, 1, 1,
0.4837467, -1.238514, 1.007835, 0.145098, 0, 1, 1,
0.4960102, 0.02337794, 1.851583, 0.1529412, 0, 1, 1,
0.4999272, -0.04542558, 1.945509, 0.1568628, 0, 1, 1,
0.5012714, -0.4786775, 3.274565, 0.1647059, 0, 1, 1,
0.5035248, -0.782582, 3.765768, 0.1686275, 0, 1, 1,
0.504461, -0.2741674, 2.499931, 0.1764706, 0, 1, 1,
0.5047955, 1.695012, -0.09788502, 0.1803922, 0, 1, 1,
0.5048171, 0.6855279, 1.005316, 0.1882353, 0, 1, 1,
0.514563, 1.700397, -0.4956543, 0.1921569, 0, 1, 1,
0.516236, -1.608292, 2.652355, 0.2, 0, 1, 1,
0.5204022, -0.9626625, 3.685452, 0.2078431, 0, 1, 1,
0.5234644, -0.7331995, 2.325203, 0.2117647, 0, 1, 1,
0.5237445, 1.13659, 1.870577, 0.2196078, 0, 1, 1,
0.5266441, -1.226164, 3.576495, 0.2235294, 0, 1, 1,
0.5278587, 0.6367934, 0.2766524, 0.2313726, 0, 1, 1,
0.5365804, -0.1619691, 4.161953, 0.2352941, 0, 1, 1,
0.5370808, 0.2178506, -0.2656178, 0.2431373, 0, 1, 1,
0.5427427, 1.045221, 0.53303, 0.2470588, 0, 1, 1,
0.5454931, -1.332309, 1.138939, 0.254902, 0, 1, 1,
0.5489425, 0.9845945, 1.08905, 0.2588235, 0, 1, 1,
0.5490467, -2.067359, 2.161125, 0.2666667, 0, 1, 1,
0.5544743, 0.2729771, 1.362346, 0.2705882, 0, 1, 1,
0.5554813, 0.7617418, -0.1285982, 0.2784314, 0, 1, 1,
0.5568562, 0.811627, 1.583676, 0.282353, 0, 1, 1,
0.5585211, 1.319684, 1.740079, 0.2901961, 0, 1, 1,
0.5604665, 0.5677761, 1.664482, 0.2941177, 0, 1, 1,
0.5628685, 0.1038942, 0.9589815, 0.3019608, 0, 1, 1,
0.5660985, 0.3766445, 2.482693, 0.3098039, 0, 1, 1,
0.5678965, 0.2579201, 1.61471, 0.3137255, 0, 1, 1,
0.5713481, -0.4771472, 3.617424, 0.3215686, 0, 1, 1,
0.5721611, -0.676265, 2.862231, 0.3254902, 0, 1, 1,
0.5750116, -1.34352, 3.377534, 0.3333333, 0, 1, 1,
0.5755106, -0.2266145, 1.939115, 0.3372549, 0, 1, 1,
0.5755216, -1.287326, 2.458842, 0.345098, 0, 1, 1,
0.5766849, 0.2378551, -0.06512294, 0.3490196, 0, 1, 1,
0.578457, 0.4910586, 0.9028655, 0.3568628, 0, 1, 1,
0.579226, -1.206255, 5.006715, 0.3607843, 0, 1, 1,
0.5823002, 0.2135351, 0.9376006, 0.3686275, 0, 1, 1,
0.5835511, -1.747327, 2.191568, 0.372549, 0, 1, 1,
0.5843082, -0.3251649, 1.962921, 0.3803922, 0, 1, 1,
0.5897772, 2.143711, 1.969762, 0.3843137, 0, 1, 1,
0.593506, 0.9044934, 0.7587875, 0.3921569, 0, 1, 1,
0.6031578, -0.9221803, 1.300034, 0.3960784, 0, 1, 1,
0.6041212, -0.4954928, 1.328666, 0.4039216, 0, 1, 1,
0.6043826, 0.2026942, 2.453426, 0.4117647, 0, 1, 1,
0.6083338, -0.1846388, 0.2197687, 0.4156863, 0, 1, 1,
0.6094106, 0.7755687, 0.1577125, 0.4235294, 0, 1, 1,
0.6101396, -0.3428429, 3.098298, 0.427451, 0, 1, 1,
0.6121956, -1.17227, 2.503252, 0.4352941, 0, 1, 1,
0.6131055, -0.890421, 2.650547, 0.4392157, 0, 1, 1,
0.6183787, 0.01816017, 1.98271, 0.4470588, 0, 1, 1,
0.6271262, -0.6733159, 1.901648, 0.4509804, 0, 1, 1,
0.6274806, -1.547482, 2.184221, 0.4588235, 0, 1, 1,
0.6276826, 2.277674, 1.15354, 0.4627451, 0, 1, 1,
0.6405503, -2.040668, 2.995076, 0.4705882, 0, 1, 1,
0.6407899, -2.451885, 2.973487, 0.4745098, 0, 1, 1,
0.6488261, 0.8088385, 1.549809, 0.4823529, 0, 1, 1,
0.6491283, -0.3982625, 2.793502, 0.4862745, 0, 1, 1,
0.6495834, -1.460428, 2.104604, 0.4941176, 0, 1, 1,
0.660071, -0.894733, 3.734525, 0.5019608, 0, 1, 1,
0.6631962, 0.05550691, 2.817972, 0.5058824, 0, 1, 1,
0.6645334, -1.490353, 2.233566, 0.5137255, 0, 1, 1,
0.6652895, -0.1468898, 1.944733, 0.5176471, 0, 1, 1,
0.6659015, 0.6085169, 1.315498, 0.5254902, 0, 1, 1,
0.6676697, -1.103932, 3.054111, 0.5294118, 0, 1, 1,
0.6680425, 0.464293, 2.756346, 0.5372549, 0, 1, 1,
0.6791421, -0.9451216, 2.32113, 0.5411765, 0, 1, 1,
0.6808265, 1.371905, 0.1394753, 0.5490196, 0, 1, 1,
0.6898587, 0.1540613, 2.620268, 0.5529412, 0, 1, 1,
0.6908197, 0.1667516, 3.402717, 0.5607843, 0, 1, 1,
0.6918718, -0.3451011, 1.490104, 0.5647059, 0, 1, 1,
0.6923828, 0.1365332, 1.735053, 0.572549, 0, 1, 1,
0.6981304, -0.0392745, 1.236849, 0.5764706, 0, 1, 1,
0.7016459, 0.6113524, 1.428575, 0.5843138, 0, 1, 1,
0.7061815, -0.06147241, 2.70523, 0.5882353, 0, 1, 1,
0.7074566, 0.8040335, -0.335822, 0.5960785, 0, 1, 1,
0.7081355, -1.08841, 2.472859, 0.6039216, 0, 1, 1,
0.7102782, 1.109511, -0.08126671, 0.6078432, 0, 1, 1,
0.7115485, 0.4257326, 2.280619, 0.6156863, 0, 1, 1,
0.7295694, -0.1064547, 0.3306942, 0.6196079, 0, 1, 1,
0.7360493, 1.299827, 0.03241792, 0.627451, 0, 1, 1,
0.7362453, 1.406993, 1.874517, 0.6313726, 0, 1, 1,
0.7368793, -0.6369383, 2.626036, 0.6392157, 0, 1, 1,
0.7388789, 0.2390957, 0.7747028, 0.6431373, 0, 1, 1,
0.7455617, -0.3298354, 2.974139, 0.6509804, 0, 1, 1,
0.7515187, -0.5234435, 3.783612, 0.654902, 0, 1, 1,
0.7521597, -0.4155497, 1.288265, 0.6627451, 0, 1, 1,
0.7611869, -1.09476, 1.667158, 0.6666667, 0, 1, 1,
0.7656519, 1.44139, -0.6482888, 0.6745098, 0, 1, 1,
0.767174, 0.8885583, 0.9942285, 0.6784314, 0, 1, 1,
0.7674139, 0.5521061, 1.881571, 0.6862745, 0, 1, 1,
0.7674542, -0.02402134, 0.6107454, 0.6901961, 0, 1, 1,
0.7682006, -0.7534596, 2.136276, 0.6980392, 0, 1, 1,
0.7683823, 0.525107, 1.286875, 0.7058824, 0, 1, 1,
0.7705482, -0.3066178, 2.54481, 0.7098039, 0, 1, 1,
0.7779047, 1.200411, 0.1064092, 0.7176471, 0, 1, 1,
0.7834556, -0.17191, 2.47896, 0.7215686, 0, 1, 1,
0.7840934, 0.8659603, 0.8292071, 0.7294118, 0, 1, 1,
0.791551, -0.9235669, 0.7782277, 0.7333333, 0, 1, 1,
0.7923288, 0.2415742, 4.142024, 0.7411765, 0, 1, 1,
0.7950973, 0.2452279, 3.203884, 0.7450981, 0, 1, 1,
0.7969934, -0.6116904, 1.957035, 0.7529412, 0, 1, 1,
0.7984005, 0.4371744, 2.108164, 0.7568628, 0, 1, 1,
0.7997969, -1.254076, 4.288164, 0.7647059, 0, 1, 1,
0.8032978, -0.3729692, 2.787098, 0.7686275, 0, 1, 1,
0.8085983, -0.9617189, 1.390626, 0.7764706, 0, 1, 1,
0.8089587, 0.248317, 1.173502, 0.7803922, 0, 1, 1,
0.8103742, 1.089686, 0.950101, 0.7882353, 0, 1, 1,
0.8119521, -0.04230114, 1.298882, 0.7921569, 0, 1, 1,
0.8119997, -0.3972162, 3.390949, 0.8, 0, 1, 1,
0.8181479, -0.06640438, 1.482788, 0.8078431, 0, 1, 1,
0.8272337, 0.1972006, -0.1948846, 0.8117647, 0, 1, 1,
0.827557, -0.005299982, 3.278185, 0.8196079, 0, 1, 1,
0.8370741, -0.9374799, 1.896585, 0.8235294, 0, 1, 1,
0.8398508, -0.4579989, 1.032125, 0.8313726, 0, 1, 1,
0.8401133, 1.427825, 0.8692635, 0.8352941, 0, 1, 1,
0.8401654, -0.4078167, 1.818637, 0.8431373, 0, 1, 1,
0.8409362, -0.4262101, 3.521572, 0.8470588, 0, 1, 1,
0.8428932, -0.8674889, 2.124802, 0.854902, 0, 1, 1,
0.8451995, -0.5392904, 2.679124, 0.8588235, 0, 1, 1,
0.8499792, 0.3712077, 0.3142495, 0.8666667, 0, 1, 1,
0.8510857, -2.175696, 2.018393, 0.8705882, 0, 1, 1,
0.8515568, 0.3387787, -2.058808, 0.8784314, 0, 1, 1,
0.8611011, 0.2507955, 2.002294, 0.8823529, 0, 1, 1,
0.8672202, 0.2649681, -0.4506659, 0.8901961, 0, 1, 1,
0.8712764, 1.085156, -0.5415377, 0.8941177, 0, 1, 1,
0.8731376, -0.1846924, 1.544187, 0.9019608, 0, 1, 1,
0.8810203, -0.1719012, 2.79832, 0.9098039, 0, 1, 1,
0.8890836, -1.111905, 3.370694, 0.9137255, 0, 1, 1,
0.8940455, 0.220486, 2.609411, 0.9215686, 0, 1, 1,
0.9073499, 0.239563, 1.22248, 0.9254902, 0, 1, 1,
0.9146507, 0.442932, -1.376313, 0.9333333, 0, 1, 1,
0.9212388, -0.7561509, 2.670679, 0.9372549, 0, 1, 1,
0.9229665, -2.076289, 2.811355, 0.945098, 0, 1, 1,
0.9239349, -0.5514108, 1.602304, 0.9490196, 0, 1, 1,
0.926815, -1.010314, 2.782996, 0.9568627, 0, 1, 1,
0.9316332, 0.6301444, -0.6141883, 0.9607843, 0, 1, 1,
0.9388163, 1.714238, 0.04531905, 0.9686275, 0, 1, 1,
0.9481238, 0.7250991, 2.601845, 0.972549, 0, 1, 1,
0.9671124, 1.513192, 0.4149208, 0.9803922, 0, 1, 1,
0.9704537, 1.296378, 1.18815, 0.9843137, 0, 1, 1,
0.9742666, -0.8197976, 1.663228, 0.9921569, 0, 1, 1,
0.9789394, 0.5492579, 2.188312, 0.9960784, 0, 1, 1,
0.9812678, 1.167038, -0.6395781, 1, 0, 0.9960784, 1,
0.9828348, -0.1680478, 2.842586, 1, 0, 0.9882353, 1,
0.9912967, 0.1035461, 1.712661, 1, 0, 0.9843137, 1,
0.9949734, 0.9384069, 2.189281, 1, 0, 0.9764706, 1,
0.9975003, 0.3367008, -0.7872754, 1, 0, 0.972549, 1,
1.00093, 1.168886, 0.1485754, 1, 0, 0.9647059, 1,
1.003027, -0.2692266, 1.910741, 1, 0, 0.9607843, 1,
1.004655, 0.7343407, -0.6429558, 1, 0, 0.9529412, 1,
1.00539, 1.112707, 1.669798, 1, 0, 0.9490196, 1,
1.008709, -0.8188036, 3.389844, 1, 0, 0.9411765, 1,
1.00981, -1.862103, 1.480103, 1, 0, 0.9372549, 1,
1.011649, 1.881114, 2.024707, 1, 0, 0.9294118, 1,
1.013818, 1.054517, -0.8579447, 1, 0, 0.9254902, 1,
1.025465, -0.06601483, 0.3274343, 1, 0, 0.9176471, 1,
1.032951, -1.817948, 1.917777, 1, 0, 0.9137255, 1,
1.033431, 0.9161399, -0.2364192, 1, 0, 0.9058824, 1,
1.033572, -1.699921, 0.2708277, 1, 0, 0.9019608, 1,
1.034243, 0.5839531, 3.454471, 1, 0, 0.8941177, 1,
1.03728, -0.471878, 0.9483709, 1, 0, 0.8862745, 1,
1.040275, -0.4587138, 2.882431, 1, 0, 0.8823529, 1,
1.042903, -0.6983719, 3.1486, 1, 0, 0.8745098, 1,
1.043855, -0.6046906, 2.352831, 1, 0, 0.8705882, 1,
1.048342, -1.251282, 1.365502, 1, 0, 0.8627451, 1,
1.04926, 0.03653208, 1.535771, 1, 0, 0.8588235, 1,
1.055223, 1.296821, -0.4928078, 1, 0, 0.8509804, 1,
1.057959, 0.6244928, -0.1906078, 1, 0, 0.8470588, 1,
1.059113, -0.6279834, 2.603162, 1, 0, 0.8392157, 1,
1.060308, 0.7589099, 1.001025, 1, 0, 0.8352941, 1,
1.068059, -0.7737979, 2.694509, 1, 0, 0.827451, 1,
1.07911, -0.3085307, 2.097049, 1, 0, 0.8235294, 1,
1.082923, -0.7404408, 1.067854, 1, 0, 0.8156863, 1,
1.083962, -0.2084395, 3.858624, 1, 0, 0.8117647, 1,
1.084727, -0.8435934, 1.047427, 1, 0, 0.8039216, 1,
1.089615, -0.7311869, 3.084209, 1, 0, 0.7960784, 1,
1.091375, -1.462537, 2.648289, 1, 0, 0.7921569, 1,
1.097957, 0.2965336, 2.173478, 1, 0, 0.7843137, 1,
1.100779, -1.169062, 2.977889, 1, 0, 0.7803922, 1,
1.102802, 1.425724, -0.9474178, 1, 0, 0.772549, 1,
1.108329, -0.04891903, 1.602862, 1, 0, 0.7686275, 1,
1.110451, -1.621432, 2.18557, 1, 0, 0.7607843, 1,
1.113607, -0.04609641, 0.6343392, 1, 0, 0.7568628, 1,
1.118711, 0.4406602, 1.591639, 1, 0, 0.7490196, 1,
1.126352, -0.8248677, 2.393518, 1, 0, 0.7450981, 1,
1.129609, -0.1820777, 0.7143754, 1, 0, 0.7372549, 1,
1.13102, 0.5860987, 0.8018239, 1, 0, 0.7333333, 1,
1.134915, -0.7455083, 4.015448, 1, 0, 0.7254902, 1,
1.140094, -0.5934644, 1.927919, 1, 0, 0.7215686, 1,
1.144037, -0.7771049, 1.909148, 1, 0, 0.7137255, 1,
1.145871, 1.49842, 0.7566223, 1, 0, 0.7098039, 1,
1.147399, 0.2051341, 1.229767, 1, 0, 0.7019608, 1,
1.15093, -1.337625, 0.8067256, 1, 0, 0.6941177, 1,
1.15814, 1.036123, 1.143032, 1, 0, 0.6901961, 1,
1.166583, -1.69179, 3.055867, 1, 0, 0.682353, 1,
1.17258, 1.240703, -0.5218018, 1, 0, 0.6784314, 1,
1.175418, 1.566025, 0.8938711, 1, 0, 0.6705883, 1,
1.177626, 1.621502, -1.063174, 1, 0, 0.6666667, 1,
1.187834, -0.6527386, 2.652294, 1, 0, 0.6588235, 1,
1.189939, -1.866416, 3.084652, 1, 0, 0.654902, 1,
1.191552, 1.031274, 2.395681, 1, 0, 0.6470588, 1,
1.191773, -0.3533249, 1.313037, 1, 0, 0.6431373, 1,
1.193061, -0.3995836, 2.418205, 1, 0, 0.6352941, 1,
1.193938, -0.6388715, 1.807001, 1, 0, 0.6313726, 1,
1.204432, 0.4316034, 2.192901, 1, 0, 0.6235294, 1,
1.210729, 0.02260207, 1.713845, 1, 0, 0.6196079, 1,
1.220927, -0.7344067, 3.253263, 1, 0, 0.6117647, 1,
1.227564, -1.199254, 0.8558052, 1, 0, 0.6078432, 1,
1.228178, -1.054795, 1.821396, 1, 0, 0.6, 1,
1.23243, 1.191851, 0.3758145, 1, 0, 0.5921569, 1,
1.25608, 0.2782393, 1.333227, 1, 0, 0.5882353, 1,
1.260622, 0.03570249, 3.250972, 1, 0, 0.5803922, 1,
1.260702, -1.988409, 3.56908, 1, 0, 0.5764706, 1,
1.261932, -0.4939776, 1.417466, 1, 0, 0.5686275, 1,
1.262108, 1.010349, -0.009392804, 1, 0, 0.5647059, 1,
1.276512, 0.7808422, 1.851691, 1, 0, 0.5568628, 1,
1.289447, 0.5793858, 0.5936863, 1, 0, 0.5529412, 1,
1.303159, 1.006593, 0.02537211, 1, 0, 0.5450981, 1,
1.318779, 0.1272216, 0.6716008, 1, 0, 0.5411765, 1,
1.324457, 0.9950286, 0.3841622, 1, 0, 0.5333334, 1,
1.327396, -1.070171, 2.140406, 1, 0, 0.5294118, 1,
1.33206, -0.6882328, 1.430103, 1, 0, 0.5215687, 1,
1.332745, 0.595129, 2.539959, 1, 0, 0.5176471, 1,
1.333953, -1.407586, 2.104227, 1, 0, 0.509804, 1,
1.339281, -1.072917, 0.3796635, 1, 0, 0.5058824, 1,
1.339523, 0.05391433, 3.579681, 1, 0, 0.4980392, 1,
1.340971, -0.165396, 0.5819495, 1, 0, 0.4901961, 1,
1.345631, -1.843108, 2.746393, 1, 0, 0.4862745, 1,
1.346629, 0.7203284, 1.972954, 1, 0, 0.4784314, 1,
1.352288, 0.06660707, 0.7031858, 1, 0, 0.4745098, 1,
1.355114, -0.2439666, 2.994085, 1, 0, 0.4666667, 1,
1.356167, -1.547622, 3.62008, 1, 0, 0.4627451, 1,
1.358113, -1.76452, 3.537896, 1, 0, 0.454902, 1,
1.360185, -1.647508, 3.509235, 1, 0, 0.4509804, 1,
1.36733, 0.3016286, 0.9945233, 1, 0, 0.4431373, 1,
1.374321, -0.3849993, 3.08672, 1, 0, 0.4392157, 1,
1.375252, -0.3377201, 0.8788955, 1, 0, 0.4313726, 1,
1.386165, -0.3333985, 2.847834, 1, 0, 0.427451, 1,
1.389555, -1.139702, 4.090763, 1, 0, 0.4196078, 1,
1.390308, -0.4327525, 2.299901, 1, 0, 0.4156863, 1,
1.391147, 0.2350158, 0.860355, 1, 0, 0.4078431, 1,
1.400299, -1.255288, 3.223279, 1, 0, 0.4039216, 1,
1.415527, -0.1350987, 2.683274, 1, 0, 0.3960784, 1,
1.42424, -0.6240271, 2.472522, 1, 0, 0.3882353, 1,
1.434457, -0.04456139, 1.922343, 1, 0, 0.3843137, 1,
1.448506, -0.5650874, 0.7883726, 1, 0, 0.3764706, 1,
1.469942, -2.003637, 1.549101, 1, 0, 0.372549, 1,
1.482613, 0.06498496, 4.388671, 1, 0, 0.3647059, 1,
1.493891, 0.05579685, 0.6038511, 1, 0, 0.3607843, 1,
1.49724, 1.874399, 1.371969, 1, 0, 0.3529412, 1,
1.521091, 1.057371, 0.5370555, 1, 0, 0.3490196, 1,
1.532407, 1.583999, 1.268245, 1, 0, 0.3411765, 1,
1.549999, 1.921395, 1.650825, 1, 0, 0.3372549, 1,
1.571822, 0.2868835, 1.421424, 1, 0, 0.3294118, 1,
1.574325, -1.253363, 0.7375836, 1, 0, 0.3254902, 1,
1.578174, 1.229854, 0.09114938, 1, 0, 0.3176471, 1,
1.578461, 0.8172519, 0.6606989, 1, 0, 0.3137255, 1,
1.587718, -0.2193001, 1.060202, 1, 0, 0.3058824, 1,
1.589455, 0.5387562, 2.102457, 1, 0, 0.2980392, 1,
1.600968, 0.9287738, 2.257211, 1, 0, 0.2941177, 1,
1.621311, 0.5960597, 0.3464478, 1, 0, 0.2862745, 1,
1.644514, -0.8434123, 2.625623, 1, 0, 0.282353, 1,
1.647821, -0.4073025, 0.8219039, 1, 0, 0.2745098, 1,
1.652298, -0.7186814, 0.8317648, 1, 0, 0.2705882, 1,
1.657282, 0.5596004, 1.130174, 1, 0, 0.2627451, 1,
1.657462, -1.064867, 1.842734, 1, 0, 0.2588235, 1,
1.690409, -0.1205714, 0.5981872, 1, 0, 0.2509804, 1,
1.690701, 2.278179, 1.12053, 1, 0, 0.2470588, 1,
1.74086, 0.7689655, 1.971404, 1, 0, 0.2392157, 1,
1.761964, 0.642759, -1.284403, 1, 0, 0.2352941, 1,
1.766061, 0.06962112, 2.153126, 1, 0, 0.227451, 1,
1.78215, -1.723258, 1.475002, 1, 0, 0.2235294, 1,
1.789962, 1.588468, 0.9399139, 1, 0, 0.2156863, 1,
1.796171, 0.3940841, 1.915472, 1, 0, 0.2117647, 1,
1.800948, 1.040186, 0.4212659, 1, 0, 0.2039216, 1,
1.803076, -1.080871, 1.299306, 1, 0, 0.1960784, 1,
1.810001, -0.5720397, 1.468626, 1, 0, 0.1921569, 1,
1.812441, -0.7527716, 1.902177, 1, 0, 0.1843137, 1,
1.812876, -0.1296594, 1.841276, 1, 0, 0.1803922, 1,
1.826783, -1.331093, 2.011169, 1, 0, 0.172549, 1,
1.833193, 0.2419183, 0.9330325, 1, 0, 0.1686275, 1,
1.872753, 0.7220884, 1.852953, 1, 0, 0.1607843, 1,
1.882643, -1.181942, 3.732412, 1, 0, 0.1568628, 1,
1.886582, 0.544444, 1.950564, 1, 0, 0.1490196, 1,
1.937266, -1.13715, 3.90371, 1, 0, 0.145098, 1,
1.946692, 1.099575, -0.6256555, 1, 0, 0.1372549, 1,
1.9639, 0.1404682, 2.985569, 1, 0, 0.1333333, 1,
1.976376, 0.3786485, 1.228939, 1, 0, 0.1254902, 1,
1.985508, 0.01076313, 0.7958831, 1, 0, 0.1215686, 1,
2.00241, -1.290077, 1.585896, 1, 0, 0.1137255, 1,
2.033345, 0.1971356, 0.8564959, 1, 0, 0.1098039, 1,
2.038809, -0.6566193, 1.290554, 1, 0, 0.1019608, 1,
2.055242, 0.1141811, 1.487489, 1, 0, 0.09411765, 1,
2.059734, 0.08575741, 2.22832, 1, 0, 0.09019608, 1,
2.06262, 0.4986015, 1.943265, 1, 0, 0.08235294, 1,
2.132886, 1.676866, 1.673328, 1, 0, 0.07843138, 1,
2.201546, -0.4203232, 2.057541, 1, 0, 0.07058824, 1,
2.244551, 0.7829286, 1.757148, 1, 0, 0.06666667, 1,
2.44427, 1.925434, 0.1887894, 1, 0, 0.05882353, 1,
2.482826, 0.3110299, 2.842654, 1, 0, 0.05490196, 1,
2.519481, -1.331394, 2.351707, 1, 0, 0.04705882, 1,
2.532903, 0.6456777, 0.1165678, 1, 0, 0.04313726, 1,
2.552035, 0.06901666, 1.007907, 1, 0, 0.03529412, 1,
2.610519, -1.489407, 1.337134, 1, 0, 0.03137255, 1,
2.660911, -0.05372528, 1.162679, 1, 0, 0.02352941, 1,
2.855565, -2.112173, 3.098548, 1, 0, 0.01960784, 1,
3.068637, -0.7489956, 1.302338, 1, 0, 0.01176471, 1,
3.318078, 1.458911, 2.515514, 1, 0, 0.007843138, 1
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
0.1634152, -4.711406, -6.897871, 0, -0.5, 0.5, 0.5,
0.1634152, -4.711406, -6.897871, 1, -0.5, 0.5, 0.5,
0.1634152, -4.711406, -6.897871, 1, 1.5, 0.5, 0.5,
0.1634152, -4.711406, -6.897871, 0, 1.5, 0.5, 0.5
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
-4.060678, 0.1802025, -6.897871, 0, -0.5, 0.5, 0.5,
-4.060678, 0.1802025, -6.897871, 1, -0.5, 0.5, 0.5,
-4.060678, 0.1802025, -6.897871, 1, 1.5, 0.5, 0.5,
-4.060678, 0.1802025, -6.897871, 0, 1.5, 0.5, 0.5
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
-4.060678, -4.711406, 0.3265884, 0, -0.5, 0.5, 0.5,
-4.060678, -4.711406, 0.3265884, 1, -0.5, 0.5, 0.5,
-4.060678, -4.711406, 0.3265884, 1, 1.5, 0.5, 0.5,
-4.060678, -4.711406, 0.3265884, 0, 1.5, 0.5, 0.5
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
-2, -3.582573, -5.230688,
3, -3.582573, -5.230688,
-2, -3.582573, -5.230688,
-2, -3.770712, -5.508552,
-1, -3.582573, -5.230688,
-1, -3.770712, -5.508552,
0, -3.582573, -5.230688,
0, -3.770712, -5.508552,
1, -3.582573, -5.230688,
1, -3.770712, -5.508552,
2, -3.582573, -5.230688,
2, -3.770712, -5.508552,
3, -3.582573, -5.230688,
3, -3.770712, -5.508552
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
-2, -4.14699, -6.06428, 0, -0.5, 0.5, 0.5,
-2, -4.14699, -6.06428, 1, -0.5, 0.5, 0.5,
-2, -4.14699, -6.06428, 1, 1.5, 0.5, 0.5,
-2, -4.14699, -6.06428, 0, 1.5, 0.5, 0.5,
-1, -4.14699, -6.06428, 0, -0.5, 0.5, 0.5,
-1, -4.14699, -6.06428, 1, -0.5, 0.5, 0.5,
-1, -4.14699, -6.06428, 1, 1.5, 0.5, 0.5,
-1, -4.14699, -6.06428, 0, 1.5, 0.5, 0.5,
0, -4.14699, -6.06428, 0, -0.5, 0.5, 0.5,
0, -4.14699, -6.06428, 1, -0.5, 0.5, 0.5,
0, -4.14699, -6.06428, 1, 1.5, 0.5, 0.5,
0, -4.14699, -6.06428, 0, 1.5, 0.5, 0.5,
1, -4.14699, -6.06428, 0, -0.5, 0.5, 0.5,
1, -4.14699, -6.06428, 1, -0.5, 0.5, 0.5,
1, -4.14699, -6.06428, 1, 1.5, 0.5, 0.5,
1, -4.14699, -6.06428, 0, 1.5, 0.5, 0.5,
2, -4.14699, -6.06428, 0, -0.5, 0.5, 0.5,
2, -4.14699, -6.06428, 1, -0.5, 0.5, 0.5,
2, -4.14699, -6.06428, 1, 1.5, 0.5, 0.5,
2, -4.14699, -6.06428, 0, 1.5, 0.5, 0.5,
3, -4.14699, -6.06428, 0, -0.5, 0.5, 0.5,
3, -4.14699, -6.06428, 1, -0.5, 0.5, 0.5,
3, -4.14699, -6.06428, 1, 1.5, 0.5, 0.5,
3, -4.14699, -6.06428, 0, 1.5, 0.5, 0.5
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
-3.085887, -2, -5.230688,
-3.085887, 2, -5.230688,
-3.085887, -2, -5.230688,
-3.248353, -2, -5.508552,
-3.085887, 0, -5.230688,
-3.248353, 0, -5.508552,
-3.085887, 2, -5.230688,
-3.248353, 2, -5.508552
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
-3.573283, -2, -6.06428, 0, -0.5, 0.5, 0.5,
-3.573283, -2, -6.06428, 1, -0.5, 0.5, 0.5,
-3.573283, -2, -6.06428, 1, 1.5, 0.5, 0.5,
-3.573283, -2, -6.06428, 0, 1.5, 0.5, 0.5,
-3.573283, 0, -6.06428, 0, -0.5, 0.5, 0.5,
-3.573283, 0, -6.06428, 1, -0.5, 0.5, 0.5,
-3.573283, 0, -6.06428, 1, 1.5, 0.5, 0.5,
-3.573283, 0, -6.06428, 0, 1.5, 0.5, 0.5,
-3.573283, 2, -6.06428, 0, -0.5, 0.5, 0.5,
-3.573283, 2, -6.06428, 1, -0.5, 0.5, 0.5,
-3.573283, 2, -6.06428, 1, 1.5, 0.5, 0.5,
-3.573283, 2, -6.06428, 0, 1.5, 0.5, 0.5
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
-3.085887, -3.582573, -4,
-3.085887, -3.582573, 4,
-3.085887, -3.582573, -4,
-3.248353, -3.770712, -4,
-3.085887, -3.582573, -2,
-3.248353, -3.770712, -2,
-3.085887, -3.582573, 0,
-3.248353, -3.770712, 0,
-3.085887, -3.582573, 2,
-3.248353, -3.770712, 2,
-3.085887, -3.582573, 4,
-3.248353, -3.770712, 4
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
-3.573283, -4.14699, -4, 0, -0.5, 0.5, 0.5,
-3.573283, -4.14699, -4, 1, -0.5, 0.5, 0.5,
-3.573283, -4.14699, -4, 1, 1.5, 0.5, 0.5,
-3.573283, -4.14699, -4, 0, 1.5, 0.5, 0.5,
-3.573283, -4.14699, -2, 0, -0.5, 0.5, 0.5,
-3.573283, -4.14699, -2, 1, -0.5, 0.5, 0.5,
-3.573283, -4.14699, -2, 1, 1.5, 0.5, 0.5,
-3.573283, -4.14699, -2, 0, 1.5, 0.5, 0.5,
-3.573283, -4.14699, 0, 0, -0.5, 0.5, 0.5,
-3.573283, -4.14699, 0, 1, -0.5, 0.5, 0.5,
-3.573283, -4.14699, 0, 1, 1.5, 0.5, 0.5,
-3.573283, -4.14699, 0, 0, 1.5, 0.5, 0.5,
-3.573283, -4.14699, 2, 0, -0.5, 0.5, 0.5,
-3.573283, -4.14699, 2, 1, -0.5, 0.5, 0.5,
-3.573283, -4.14699, 2, 1, 1.5, 0.5, 0.5,
-3.573283, -4.14699, 2, 0, 1.5, 0.5, 0.5,
-3.573283, -4.14699, 4, 0, -0.5, 0.5, 0.5,
-3.573283, -4.14699, 4, 1, -0.5, 0.5, 0.5,
-3.573283, -4.14699, 4, 1, 1.5, 0.5, 0.5,
-3.573283, -4.14699, 4, 0, 1.5, 0.5, 0.5
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
-3.085887, -3.582573, -5.230688,
-3.085887, 3.942978, -5.230688,
-3.085887, -3.582573, 5.883865,
-3.085887, 3.942978, 5.883865,
-3.085887, -3.582573, -5.230688,
-3.085887, -3.582573, 5.883865,
-3.085887, 3.942978, -5.230688,
-3.085887, 3.942978, 5.883865,
-3.085887, -3.582573, -5.230688,
3.412718, -3.582573, -5.230688,
-3.085887, -3.582573, 5.883865,
3.412718, -3.582573, 5.883865,
-3.085887, 3.942978, -5.230688,
3.412718, 3.942978, -5.230688,
-3.085887, 3.942978, 5.883865,
3.412718, 3.942978, 5.883865,
3.412718, -3.582573, -5.230688,
3.412718, 3.942978, -5.230688,
3.412718, -3.582573, 5.883865,
3.412718, 3.942978, 5.883865,
3.412718, -3.582573, -5.230688,
3.412718, -3.582573, 5.883865,
3.412718, 3.942978, -5.230688,
3.412718, 3.942978, 5.883865
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
var radius = 7.963279;
var distance = 35.42953;
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
mvMatrix.translate( -0.1634152, -0.1802025, -0.3265884 );
mvMatrix.scale( 1.324908, 1.144109, 0.7746649 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.42953);
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
oxathiazine_4-oxide<-read.table("oxathiazine_4-oxide.xyz")
```

```
## Error in read.table("oxathiazine_4-oxide.xyz"): no lines available in input
```

```r
x<-oxathiazine_4-oxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxathiazine_4' not found
```

```r
y<-oxathiazine_4-oxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxathiazine_4' not found
```

```r
z<-oxathiazine_4-oxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxathiazine_4' not found
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
-2.991247, 0.2536519, -0.9955728, 0, 0, 1, 1, 1,
-2.854267, 0.622687, 0.5092791, 1, 0, 0, 1, 1,
-2.642419, -0.9636528, -2.540029, 1, 0, 0, 1, 1,
-2.592094, -0.6688624, -2.425691, 1, 0, 0, 1, 1,
-2.428723, 0.3583413, -0.9247088, 1, 0, 0, 1, 1,
-2.307562, 0.6835373, -1.177653, 1, 0, 0, 1, 1,
-2.307316, 0.2498171, 0.02905189, 0, 0, 0, 1, 1,
-2.290006, 0.7999615, 0.05531729, 0, 0, 0, 1, 1,
-2.265314, -0.05393089, -2.459081, 0, 0, 0, 1, 1,
-2.255361, 0.129973, -1.805542, 0, 0, 0, 1, 1,
-2.240349, -0.0455834, -1.585688, 0, 0, 0, 1, 1,
-2.239365, -0.2837145, -1.207108, 0, 0, 0, 1, 1,
-2.21974, 2.004362, -0.03203874, 0, 0, 0, 1, 1,
-2.136052, 0.04188914, -1.252316, 1, 1, 1, 1, 1,
-2.121904, -0.002074759, -1.746904, 1, 1, 1, 1, 1,
-2.067629, -0.01057815, -3.479723, 1, 1, 1, 1, 1,
-2.065481, 0.05489927, -1.069842, 1, 1, 1, 1, 1,
-2.055431, 0.3224857, -2.252737, 1, 1, 1, 1, 1,
-2.022456, 0.05164826, -1.485944, 1, 1, 1, 1, 1,
-2.021859, 0.4795558, -1.915806, 1, 1, 1, 1, 1,
-1.977298, -2.224093, -2.929605, 1, 1, 1, 1, 1,
-1.956591, 0.9985045, -0.4423442, 1, 1, 1, 1, 1,
-1.933799, -0.5636909, -2.233308, 1, 1, 1, 1, 1,
-1.932529, -1.372838, -1.651914, 1, 1, 1, 1, 1,
-1.921484, 0.2526664, -0.8287697, 1, 1, 1, 1, 1,
-1.911501, 0.6191051, -0.7139604, 1, 1, 1, 1, 1,
-1.902812, 1.344624, 0.1556057, 1, 1, 1, 1, 1,
-1.901241, 1.975714, -0.4457194, 1, 1, 1, 1, 1,
-1.891826, -1.228809, -2.160875, 0, 0, 1, 1, 1,
-1.889059, 0.5367259, -0.924261, 1, 0, 0, 1, 1,
-1.882837, -1.08885, -1.709008, 1, 0, 0, 1, 1,
-1.879501, -0.02774688, -3.088807, 1, 0, 0, 1, 1,
-1.863091, -0.7439618, -1.258149, 1, 0, 0, 1, 1,
-1.85034, 0.2322123, 0.240638, 1, 0, 0, 1, 1,
-1.820493, 0.5229098, -2.463599, 0, 0, 0, 1, 1,
-1.799049, -0.2676994, -1.808279, 0, 0, 0, 1, 1,
-1.7871, 0.1164479, -2.518358, 0, 0, 0, 1, 1,
-1.774561, 1.448389, -1.905428, 0, 0, 0, 1, 1,
-1.765979, 1.689454, -2.195846, 0, 0, 0, 1, 1,
-1.762821, 0.3275022, -1.335666, 0, 0, 0, 1, 1,
-1.749654, 1.071016, -1.22523, 0, 0, 0, 1, 1,
-1.742711, 0.9923458, -0.9066697, 1, 1, 1, 1, 1,
-1.740141, -0.9534965, -2.184533, 1, 1, 1, 1, 1,
-1.718061, -1.211388, -3.777114, 1, 1, 1, 1, 1,
-1.706634, 1.778814, -2.346345, 1, 1, 1, 1, 1,
-1.6954, -0.2232859, -1.985504, 1, 1, 1, 1, 1,
-1.69519, -0.17507, -1.382344, 1, 1, 1, 1, 1,
-1.681451, 0.8889876, -2.163687, 1, 1, 1, 1, 1,
-1.680817, -1.926556, -0.9382752, 1, 1, 1, 1, 1,
-1.676673, 0.5702337, -1.28741, 1, 1, 1, 1, 1,
-1.66421, -0.1976243, -1.32979, 1, 1, 1, 1, 1,
-1.637382, 1.211954, -1.62264, 1, 1, 1, 1, 1,
-1.634974, 0.7811974, -0.4163575, 1, 1, 1, 1, 1,
-1.61522, 1.717304, 0.2974316, 1, 1, 1, 1, 1,
-1.603087, -0.7923618, -3.117596, 1, 1, 1, 1, 1,
-1.594272, 1.613855, -0.2608756, 1, 1, 1, 1, 1,
-1.593437, -0.1366799, -2.095252, 0, 0, 1, 1, 1,
-1.582937, -0.3372653, -1.496371, 1, 0, 0, 1, 1,
-1.581156, -1.556155, -1.925065, 1, 0, 0, 1, 1,
-1.579527, 0.3225952, -0.6695167, 1, 0, 0, 1, 1,
-1.576576, -0.3212491, -2.638151, 1, 0, 0, 1, 1,
-1.572032, 0.2231632, -2.16244, 1, 0, 0, 1, 1,
-1.565953, 0.8254669, -1.661043, 0, 0, 0, 1, 1,
-1.556508, 0.1475809, 0.7682034, 0, 0, 0, 1, 1,
-1.55591, -0.541597, -2.049488, 0, 0, 0, 1, 1,
-1.542098, 0.1659463, -2.225036, 0, 0, 0, 1, 1,
-1.531278, -0.4874983, -2.638518, 0, 0, 0, 1, 1,
-1.516456, 0.2160147, -3.388367, 0, 0, 0, 1, 1,
-1.51622, 0.9681342, -0.1826364, 0, 0, 0, 1, 1,
-1.504768, -1.386458, -1.322798, 1, 1, 1, 1, 1,
-1.503256, 0.1535403, -1.666064, 1, 1, 1, 1, 1,
-1.502365, 0.1779753, -1.93176, 1, 1, 1, 1, 1,
-1.477539, -0.1410934, -0.8200383, 1, 1, 1, 1, 1,
-1.471159, -0.413941, -2.089035, 1, 1, 1, 1, 1,
-1.470356, -1.484904, -2.656888, 1, 1, 1, 1, 1,
-1.463658, 0.9648225, -0.5223861, 1, 1, 1, 1, 1,
-1.456785, 2.137757, 0.1084949, 1, 1, 1, 1, 1,
-1.452174, 0.4307946, -2.112017, 1, 1, 1, 1, 1,
-1.439336, -0.6935478, -4.836493, 1, 1, 1, 1, 1,
-1.43911, 1.250936, 1.006936, 1, 1, 1, 1, 1,
-1.432383, 1.274275, -1.799005, 1, 1, 1, 1, 1,
-1.43231, 1.742291, -0.9405075, 1, 1, 1, 1, 1,
-1.42847, 1.134545, 0.7123209, 1, 1, 1, 1, 1,
-1.426638, -0.6262097, -1.226052, 1, 1, 1, 1, 1,
-1.420033, -0.6424168, -1.308545, 0, 0, 1, 1, 1,
-1.417485, -2.15199, -3.436622, 1, 0, 0, 1, 1,
-1.416868, 0.6862118, -2.326097, 1, 0, 0, 1, 1,
-1.416851, -2.221951, -4.868981, 1, 0, 0, 1, 1,
-1.410665, 0.366405, -2.842858, 1, 0, 0, 1, 1,
-1.401419, 0.6107006, -3.057263, 1, 0, 0, 1, 1,
-1.391196, 0.2182459, -0.133735, 0, 0, 0, 1, 1,
-1.377158, -0.712098, -0.9952454, 0, 0, 0, 1, 1,
-1.350876, -1.410658, -0.8234835, 0, 0, 0, 1, 1,
-1.345251, 0.02073803, -2.3464, 0, 0, 0, 1, 1,
-1.338087, 0.3299055, -1.457594, 0, 0, 0, 1, 1,
-1.319242, 0.524411, -1.265494, 0, 0, 0, 1, 1,
-1.31832, 0.6087841, -1.180724, 0, 0, 0, 1, 1,
-1.317835, -0.6591001, -2.430505, 1, 1, 1, 1, 1,
-1.313997, 2.290394, -0.321131, 1, 1, 1, 1, 1,
-1.295675, 0.4700084, -1.514778, 1, 1, 1, 1, 1,
-1.295213, 1.187072, -2.119715, 1, 1, 1, 1, 1,
-1.28419, 0.6205055, -1.461931, 1, 1, 1, 1, 1,
-1.282395, 0.02034342, -2.03942, 1, 1, 1, 1, 1,
-1.280894, -0.8447008, -1.980151, 1, 1, 1, 1, 1,
-1.279772, -0.5742186, -3.706993, 1, 1, 1, 1, 1,
-1.270496, -0.6344701, -0.972734, 1, 1, 1, 1, 1,
-1.26177, -1.555031, -2.17879, 1, 1, 1, 1, 1,
-1.260868, -0.4370823, 0.02383496, 1, 1, 1, 1, 1,
-1.254595, 0.3253915, 0.03481696, 1, 1, 1, 1, 1,
-1.250321, 1.045746, -1.791441, 1, 1, 1, 1, 1,
-1.23692, -0.9524994, -2.728298, 1, 1, 1, 1, 1,
-1.234535, -0.004094277, 0.005967224, 1, 1, 1, 1, 1,
-1.22813, -0.3285674, -0.2823989, 0, 0, 1, 1, 1,
-1.226409, 1.896338, -1.953705, 1, 0, 0, 1, 1,
-1.22135, 0.5923832, 1.429797, 1, 0, 0, 1, 1,
-1.215708, 0.3993351, -0.374783, 1, 0, 0, 1, 1,
-1.213344, 1.147276, 0.704983, 1, 0, 0, 1, 1,
-1.212955, -0.4003966, -2.69042, 1, 0, 0, 1, 1,
-1.212909, -0.2608316, -0.7974698, 0, 0, 0, 1, 1,
-1.20815, 1.21077, -1.467946, 0, 0, 0, 1, 1,
-1.206386, 0.2972815, -0.5418403, 0, 0, 0, 1, 1,
-1.20583, 1.321786, 0.8883803, 0, 0, 0, 1, 1,
-1.20306, 1.144937, -1.291681, 0, 0, 0, 1, 1,
-1.183838, -0.1071728, -2.083266, 0, 0, 0, 1, 1,
-1.177873, 0.2127619, -2.46245, 0, 0, 0, 1, 1,
-1.175078, -1.027238, -1.662085, 1, 1, 1, 1, 1,
-1.166375, 1.383901, -0.9334899, 1, 1, 1, 1, 1,
-1.162864, 1.408511, -2.887776, 1, 1, 1, 1, 1,
-1.161294, 0.9256105, -1.484837, 1, 1, 1, 1, 1,
-1.157997, -0.2950392, -1.559035, 1, 1, 1, 1, 1,
-1.142954, 0.07068344, -2.158345, 1, 1, 1, 1, 1,
-1.134572, 0.8032946, 1.29635, 1, 1, 1, 1, 1,
-1.119833, -0.09592365, -0.9260792, 1, 1, 1, 1, 1,
-1.116188, 0.8484504, -2.807483, 1, 1, 1, 1, 1,
-1.098243, -0.6816662, -1.184082, 1, 1, 1, 1, 1,
-1.098191, 0.06171433, -0.6571863, 1, 1, 1, 1, 1,
-1.087448, 0.8471093, 0.1505693, 1, 1, 1, 1, 1,
-1.082562, 0.2197585, -0.7783711, 1, 1, 1, 1, 1,
-1.080666, -1.286976, -0.6369355, 1, 1, 1, 1, 1,
-1.065183, 0.1267465, -0.4851683, 1, 1, 1, 1, 1,
-1.063633, 0.1811497, -3.30353, 0, 0, 1, 1, 1,
-1.062676, -0.6129397, -2.099157, 1, 0, 0, 1, 1,
-1.061366, -0.0507651, 0.625052, 1, 0, 0, 1, 1,
-1.056621, -0.05405875, -2.792225, 1, 0, 0, 1, 1,
-1.050075, 1.673147, 0.8329598, 1, 0, 0, 1, 1,
-1.031412, 0.3995025, -3.109174, 1, 0, 0, 1, 1,
-1.02672, 0.5725715, -0.0489529, 0, 0, 0, 1, 1,
-1.026422, 1.027717, -1.729194, 0, 0, 0, 1, 1,
-1.022313, 1.414554, 0.1313186, 0, 0, 0, 1, 1,
-1.019615, 1.946878, 1.736152, 0, 0, 0, 1, 1,
-1.018606, -1.175035, -0.641735, 0, 0, 0, 1, 1,
-1.015717, 0.1792581, -0.9085645, 0, 0, 0, 1, 1,
-1.009434, -0.3334692, -1.991937, 0, 0, 0, 1, 1,
-1.007789, 0.5086249, -1.152228, 1, 1, 1, 1, 1,
-1.002707, 0.7663617, -1.100121, 1, 1, 1, 1, 1,
-0.997677, -1.052559, -2.604362, 1, 1, 1, 1, 1,
-0.9959552, -0.8283908, -2.161668, 1, 1, 1, 1, 1,
-0.9948663, 1.444706, -0.7010775, 1, 1, 1, 1, 1,
-0.9907869, -0.7258659, 0.09055738, 1, 1, 1, 1, 1,
-0.9872455, 1.562943, 0.3663723, 1, 1, 1, 1, 1,
-0.9840488, -1.170103, -1.677249, 1, 1, 1, 1, 1,
-0.9837302, 0.2135011, -1.37359, 1, 1, 1, 1, 1,
-0.9751899, -2.068677, -2.99513, 1, 1, 1, 1, 1,
-0.9725046, -0.512385, -1.682375, 1, 1, 1, 1, 1,
-0.9714996, -0.2237363, -3.387255, 1, 1, 1, 1, 1,
-0.9449788, -0.2815681, -0.3290139, 1, 1, 1, 1, 1,
-0.9426314, 0.06556114, -1.213739, 1, 1, 1, 1, 1,
-0.9410353, -0.3375079, -2.510659, 1, 1, 1, 1, 1,
-0.9384692, 0.8127146, 0.06954772, 0, 0, 1, 1, 1,
-0.9367465, 0.4453506, -1.171861, 1, 0, 0, 1, 1,
-0.9367362, -0.2623475, -2.585754, 1, 0, 0, 1, 1,
-0.9268693, -1.507809, -2.329593, 1, 0, 0, 1, 1,
-0.9213236, -0.2948883, -0.9036278, 1, 0, 0, 1, 1,
-0.9211649, 0.3924081, -2.541974, 1, 0, 0, 1, 1,
-0.9200612, -0.4641177, -1.985964, 0, 0, 0, 1, 1,
-0.9193935, -0.9853212, -2.678599, 0, 0, 0, 1, 1,
-0.9154781, 1.433046, -0.4443876, 0, 0, 0, 1, 1,
-0.9126419, 0.07525119, -1.076486, 0, 0, 0, 1, 1,
-0.9038504, 0.07891029, -1.171322, 0, 0, 0, 1, 1,
-0.9034509, -0.472441, -2.362339, 0, 0, 0, 1, 1,
-0.8981578, -1.30413, -1.233888, 0, 0, 0, 1, 1,
-0.8946177, -0.2531862, -2.530635, 1, 1, 1, 1, 1,
-0.8813742, 0.280988, 0.5453163, 1, 1, 1, 1, 1,
-0.8789301, 0.1998688, -1.304841, 1, 1, 1, 1, 1,
-0.8738326, 0.2754278, -1.518789, 1, 1, 1, 1, 1,
-0.8708051, -1.407759, -1.501493, 1, 1, 1, 1, 1,
-0.8702895, 0.4889743, -0.1182213, 1, 1, 1, 1, 1,
-0.869369, 1.901605, -1.151696, 1, 1, 1, 1, 1,
-0.8684285, 0.6465566, 0.4336167, 1, 1, 1, 1, 1,
-0.8663332, -1.338583, -1.962961, 1, 1, 1, 1, 1,
-0.8658984, -0.9977005, -1.499825, 1, 1, 1, 1, 1,
-0.8597351, 0.5567368, 1.110672, 1, 1, 1, 1, 1,
-0.8596308, 0.02200997, -1.333824, 1, 1, 1, 1, 1,
-0.8521883, -0.5558909, -1.818212, 1, 1, 1, 1, 1,
-0.8507507, -1.105392, -2.42944, 1, 1, 1, 1, 1,
-0.8480185, -0.1083027, -1.91519, 1, 1, 1, 1, 1,
-0.8445256, 0.03007544, -0.9630859, 0, 0, 1, 1, 1,
-0.8354097, -0.1232755, -1.749043, 1, 0, 0, 1, 1,
-0.8311428, -0.6142575, -3.472752, 1, 0, 0, 1, 1,
-0.8282692, -0.7714559, -1.073191, 1, 0, 0, 1, 1,
-0.828002, -0.1918255, -0.8068299, 1, 0, 0, 1, 1,
-0.822147, -1.144768, -2.369474, 1, 0, 0, 1, 1,
-0.8214312, -1.536852, -2.439143, 0, 0, 0, 1, 1,
-0.8185611, -1.028877, -1.967645, 0, 0, 0, 1, 1,
-0.8184602, 1.090419, 0.1276472, 0, 0, 0, 1, 1,
-0.8167842, -2.078926, -3.047987, 0, 0, 0, 1, 1,
-0.8159449, 0.04730098, -1.505972, 0, 0, 0, 1, 1,
-0.8102107, 1.098346, -1.93802, 0, 0, 0, 1, 1,
-0.8097153, 0.04823416, -0.5819365, 0, 0, 0, 1, 1,
-0.806082, -1.592653, -2.965702, 1, 1, 1, 1, 1,
-0.7953963, -0.362021, -1.11072, 1, 1, 1, 1, 1,
-0.7934978, 0.5007077, -0.3646629, 1, 1, 1, 1, 1,
-0.7914476, -0.215134, -1.248611, 1, 1, 1, 1, 1,
-0.7887379, 0.2983792, -0.6560321, 1, 1, 1, 1, 1,
-0.7869747, 0.04230456, -2.294906, 1, 1, 1, 1, 1,
-0.7853688, -0.02410173, -1.938452, 1, 1, 1, 1, 1,
-0.7847831, -0.04484518, -2.002268, 1, 1, 1, 1, 1,
-0.7833412, -1.123167, -4.608568, 1, 1, 1, 1, 1,
-0.7800761, -1.205865, -4.672576, 1, 1, 1, 1, 1,
-0.7790949, -0.7410788, -2.67304, 1, 1, 1, 1, 1,
-0.7770647, -0.9614127, -2.328695, 1, 1, 1, 1, 1,
-0.7770324, -0.115731, -0.9532729, 1, 1, 1, 1, 1,
-0.7705392, 0.3843152, -0.8744348, 1, 1, 1, 1, 1,
-0.7638576, 0.6876808, -0.3065197, 1, 1, 1, 1, 1,
-0.7554206, -1.050384, -3.605159, 0, 0, 1, 1, 1,
-0.749542, 0.6888991, -2.261792, 1, 0, 0, 1, 1,
-0.741586, -0.7105857, -2.512504, 1, 0, 0, 1, 1,
-0.7373452, 2.56408, -1.115198, 1, 0, 0, 1, 1,
-0.7324887, -0.6037804, -1.921504, 1, 0, 0, 1, 1,
-0.7266054, 0.535412, -1.555595, 1, 0, 0, 1, 1,
-0.7235429, -0.7019078, -3.262656, 0, 0, 0, 1, 1,
-0.7228847, -1.513894, -3.709213, 0, 0, 0, 1, 1,
-0.721912, 0.8429062, -0.7171004, 0, 0, 0, 1, 1,
-0.7193776, 1.150566, 0.153634, 0, 0, 0, 1, 1,
-0.7055504, -0.168634, -3.345087, 0, 0, 0, 1, 1,
-0.7013285, -0.6150055, -2.80097, 0, 0, 0, 1, 1,
-0.6996232, 0.4877087, -1.760227, 0, 0, 0, 1, 1,
-0.6985041, -1.424155, -2.543965, 1, 1, 1, 1, 1,
-0.6945092, 1.978925, -0.9765448, 1, 1, 1, 1, 1,
-0.6842609, 0.05468723, -3.337421, 1, 1, 1, 1, 1,
-0.6758698, 0.05422757, -1.779491, 1, 1, 1, 1, 1,
-0.6720763, 0.2778142, -1.131773, 1, 1, 1, 1, 1,
-0.6707479, -0.7594945, -1.035838, 1, 1, 1, 1, 1,
-0.6671533, 0.4828821, -1.316113, 1, 1, 1, 1, 1,
-0.6655228, 1.365851, -0.8505677, 1, 1, 1, 1, 1,
-0.664116, -1.6316, -4.33146, 1, 1, 1, 1, 1,
-0.6633434, -0.6228818, -1.502452, 1, 1, 1, 1, 1,
-0.6482809, 1.421101, -0.4053634, 1, 1, 1, 1, 1,
-0.6461186, -1.90082, -4.215765, 1, 1, 1, 1, 1,
-0.6394388, -0.01983792, -0.5006442, 1, 1, 1, 1, 1,
-0.63812, -0.4014714, -3.975129, 1, 1, 1, 1, 1,
-0.6362317, 0.8973694, -3.515365, 1, 1, 1, 1, 1,
-0.622399, 0.4114978, -2.522218, 0, 0, 1, 1, 1,
-0.6171715, 0.7665816, -1.013714, 1, 0, 0, 1, 1,
-0.6144676, -1.007248, -1.913133, 1, 0, 0, 1, 1,
-0.6144075, 0.2669134, -0.2275103, 1, 0, 0, 1, 1,
-0.6114632, -0.5288899, -2.952044, 1, 0, 0, 1, 1,
-0.6085548, 0.3299924, -2.558925, 1, 0, 0, 1, 1,
-0.608364, -1.847239, -3.266787, 0, 0, 0, 1, 1,
-0.6057581, -1.327373, -2.417152, 0, 0, 0, 1, 1,
-0.6047454, -1.174684, -2.861532, 0, 0, 0, 1, 1,
-0.6043041, -0.641504, -2.379185, 0, 0, 0, 1, 1,
-0.6032252, 0.3878573, -0.1477946, 0, 0, 0, 1, 1,
-0.6004716, -0.1035245, -2.598936, 0, 0, 0, 1, 1,
-0.6004661, -0.3249595, -0.9328333, 0, 0, 0, 1, 1,
-0.5929888, 0.2826566, -2.120702, 1, 1, 1, 1, 1,
-0.5926487, -1.716774, -3.547754, 1, 1, 1, 1, 1,
-0.5859903, -0.3523505, -2.835122, 1, 1, 1, 1, 1,
-0.5857375, 1.300627, -1.391846, 1, 1, 1, 1, 1,
-0.5778767, 0.6343637, -1.973216, 1, 1, 1, 1, 1,
-0.5759339, -0.3714153, -0.8247716, 1, 1, 1, 1, 1,
-0.5758118, 1.24845, -0.2037052, 1, 1, 1, 1, 1,
-0.5737032, -0.3548323, -2.418036, 1, 1, 1, 1, 1,
-0.572051, 0.2792379, 0.1260356, 1, 1, 1, 1, 1,
-0.5692642, -0.1319775, -1.291297, 1, 1, 1, 1, 1,
-0.5691076, -0.9955405, -0.9308563, 1, 1, 1, 1, 1,
-0.5512065, 0.1866235, -2.274777, 1, 1, 1, 1, 1,
-0.5486849, 1.073758, -1.799341, 1, 1, 1, 1, 1,
-0.5367034, 1.979801, -0.9733616, 1, 1, 1, 1, 1,
-0.5326047, -0.8916755, -2.670906, 1, 1, 1, 1, 1,
-0.5320967, 0.001644177, -1.590344, 0, 0, 1, 1, 1,
-0.5303775, 0.4039441, -0.4306575, 1, 0, 0, 1, 1,
-0.5301856, -0.3060716, -3.106815, 1, 0, 0, 1, 1,
-0.5269598, -0.1546652, -1.37766, 1, 0, 0, 1, 1,
-0.5188822, 1.075293, -1.231523, 1, 0, 0, 1, 1,
-0.5162213, -1.023196, -1.902678, 1, 0, 0, 1, 1,
-0.512707, -1.883054, -4.132844, 0, 0, 0, 1, 1,
-0.5121268, 0.5762213, -0.5779247, 0, 0, 0, 1, 1,
-0.5096257, -0.5215222, -3.082922, 0, 0, 0, 1, 1,
-0.5094254, -2.145106, -1.464924, 0, 0, 0, 1, 1,
-0.5034608, -0.9647162, -3.89259, 0, 0, 0, 1, 1,
-0.5008501, 0.02641836, -1.504337, 0, 0, 0, 1, 1,
-0.4987823, 0.1963135, -1.730924, 0, 0, 0, 1, 1,
-0.4981712, 1.123081, -0.3082637, 1, 1, 1, 1, 1,
-0.4923612, 0.4340162, -0.1565449, 1, 1, 1, 1, 1,
-0.4903919, 0.411524, 0.09500358, 1, 1, 1, 1, 1,
-0.4811482, 0.6984819, -0.8122135, 1, 1, 1, 1, 1,
-0.4770342, -2.643185, -2.362553, 1, 1, 1, 1, 1,
-0.4757458, -0.4857726, -1.315225, 1, 1, 1, 1, 1,
-0.4728675, -0.977073, -1.671762, 1, 1, 1, 1, 1,
-0.4711795, 0.5835624, -0.8715039, 1, 1, 1, 1, 1,
-0.4710452, -0.2360961, -1.785379, 1, 1, 1, 1, 1,
-0.467651, 0.7399239, -0.07164238, 1, 1, 1, 1, 1,
-0.4672791, 1.247561, -1.536351, 1, 1, 1, 1, 1,
-0.4608292, 0.735348, -0.6675125, 1, 1, 1, 1, 1,
-0.4596165, 0.3640524, -0.126223, 1, 1, 1, 1, 1,
-0.456648, 0.01961716, -2.027413, 1, 1, 1, 1, 1,
-0.4546178, -0.4216087, -1.321594, 1, 1, 1, 1, 1,
-0.4532633, -0.1845264, -2.35965, 0, 0, 1, 1, 1,
-0.4527257, 1.334226, -0.440787, 1, 0, 0, 1, 1,
-0.4484513, 0.227373, -0.7415197, 1, 0, 0, 1, 1,
-0.4446383, 0.1237963, -2.813696, 1, 0, 0, 1, 1,
-0.4438082, 0.1444218, -0.1938051, 1, 0, 0, 1, 1,
-0.4416711, 0.1313192, 0.04124954, 1, 0, 0, 1, 1,
-0.4370065, -0.4602158, -3.481371, 0, 0, 0, 1, 1,
-0.4266685, 1.995585, -0.7828354, 0, 0, 0, 1, 1,
-0.4259014, 0.4650944, -1.029733, 0, 0, 0, 1, 1,
-0.422592, -0.7639186, -3.781214, 0, 0, 0, 1, 1,
-0.4221226, 0.9328427, -0.2502854, 0, 0, 0, 1, 1,
-0.4217885, 0.1577047, -2.543968, 0, 0, 0, 1, 1,
-0.4192362, -1.194119, -1.828558, 0, 0, 0, 1, 1,
-0.4150011, -0.03259004, -2.611638, 1, 1, 1, 1, 1,
-0.4131783, -2.388643, -4.530428, 1, 1, 1, 1, 1,
-0.405946, 0.9028515, -0.08901148, 1, 1, 1, 1, 1,
-0.4058142, 1.47532, -0.4952834, 1, 1, 1, 1, 1,
-0.4051811, 0.6613254, -0.2168553, 1, 1, 1, 1, 1,
-0.4000894, 0.4301737, -1.304891, 1, 1, 1, 1, 1,
-0.3992338, 0.7924177, 0.8620757, 1, 1, 1, 1, 1,
-0.393173, 1.47549, -0.1485307, 1, 1, 1, 1, 1,
-0.392658, 0.1076697, -0.9080738, 1, 1, 1, 1, 1,
-0.3901045, -1.151881, -3.6182, 1, 1, 1, 1, 1,
-0.3872825, -0.1962134, -1.603301, 1, 1, 1, 1, 1,
-0.3844766, 0.1454549, -1.88599, 1, 1, 1, 1, 1,
-0.3814768, 0.8141537, -0.6532927, 1, 1, 1, 1, 1,
-0.3797221, -0.8181861, -3.505005, 1, 1, 1, 1, 1,
-0.3775236, 0.07322347, -3.200691, 1, 1, 1, 1, 1,
-0.373123, -3.2704, -3.410976, 0, 0, 1, 1, 1,
-0.3693448, -0.3643261, -2.677567, 1, 0, 0, 1, 1,
-0.3684076, 0.1544822, -0.4385565, 1, 0, 0, 1, 1,
-0.3651068, 1.522911, -0.7636786, 1, 0, 0, 1, 1,
-0.3625298, 0.7737848, -0.8823248, 1, 0, 0, 1, 1,
-0.3562336, 0.07303291, -2.282841, 1, 0, 0, 1, 1,
-0.3517667, 0.1991351, -2.281817, 0, 0, 0, 1, 1,
-0.3510648, -1.805355, -3.473378, 0, 0, 0, 1, 1,
-0.3489618, -0.09735847, -2.703906, 0, 0, 0, 1, 1,
-0.3470273, -0.8361621, -1.345456, 0, 0, 0, 1, 1,
-0.3444912, -0.3857756, -3.001646, 0, 0, 0, 1, 1,
-0.3434927, 0.2649477, -0.4460194, 0, 0, 0, 1, 1,
-0.334661, -1.13342, -2.396776, 0, 0, 0, 1, 1,
-0.3279653, 0.08569777, -2.151284, 1, 1, 1, 1, 1,
-0.3189544, -0.06446429, -1.682466, 1, 1, 1, 1, 1,
-0.3187028, -0.2417293, -3.30999, 1, 1, 1, 1, 1,
-0.3184789, 0.2860417, -0.7250131, 1, 1, 1, 1, 1,
-0.3120805, -1.338765, -3.995466, 1, 1, 1, 1, 1,
-0.304457, -1.185071, -4.771466, 1, 1, 1, 1, 1,
-0.3036151, -0.3015503, -2.708604, 1, 1, 1, 1, 1,
-0.303143, -1.248388, -2.537413, 1, 1, 1, 1, 1,
-0.3027056, -0.706998, -4.226585, 1, 1, 1, 1, 1,
-0.3008656, 1.259802, -0.8517716, 1, 1, 1, 1, 1,
-0.3006529, 0.9563242, -0.6445231, 1, 1, 1, 1, 1,
-0.299166, 0.9177276, -1.562884, 1, 1, 1, 1, 1,
-0.296697, -1.06466, -2.331187, 1, 1, 1, 1, 1,
-0.2936735, -0.3239467, -4.219807, 1, 1, 1, 1, 1,
-0.2936633, -1.070512, -2.884575, 1, 1, 1, 1, 1,
-0.2934492, -0.1306201, -1.832371, 0, 0, 1, 1, 1,
-0.2932028, 0.02745471, -0.7446449, 1, 0, 0, 1, 1,
-0.2929353, -0.3155413, -1.878326, 1, 0, 0, 1, 1,
-0.2901357, 0.7578015, 0.4154639, 1, 0, 0, 1, 1,
-0.288472, -0.6228957, -2.237224, 1, 0, 0, 1, 1,
-0.2882539, 0.9594294, -0.2731607, 1, 0, 0, 1, 1,
-0.2881369, 0.3438821, -0.6332808, 0, 0, 0, 1, 1,
-0.2880588, 1.0919, -0.8632104, 0, 0, 0, 1, 1,
-0.2869979, 0.2696859, 0.7543063, 0, 0, 0, 1, 1,
-0.284799, 0.6595197, -3.43256, 0, 0, 0, 1, 1,
-0.2841009, 2.481966, -0.09737438, 0, 0, 0, 1, 1,
-0.2831112, 0.4245863, 1.474431, 0, 0, 0, 1, 1,
-0.2800331, -0.4312306, -1.899847, 0, 0, 0, 1, 1,
-0.2779556, -0.9003026, -2.524334, 1, 1, 1, 1, 1,
-0.2752445, 0.596172, -0.07369189, 1, 1, 1, 1, 1,
-0.27219, -0.2953761, -1.960479, 1, 1, 1, 1, 1,
-0.2714239, -0.7882429, -3.84675, 1, 1, 1, 1, 1,
-0.269688, -0.06010235, -1.219269, 1, 1, 1, 1, 1,
-0.2696378, -1.506612, -3.420365, 1, 1, 1, 1, 1,
-0.2687882, -0.03700148, -1.859695, 1, 1, 1, 1, 1,
-0.2629952, -0.97695, -3.235216, 1, 1, 1, 1, 1,
-0.262776, 0.4562607, -0.01114706, 1, 1, 1, 1, 1,
-0.252266, 0.2550862, -0.7191219, 1, 1, 1, 1, 1,
-0.2508793, -0.1239356, -2.227971, 1, 1, 1, 1, 1,
-0.2462531, 0.3832802, -1.703442, 1, 1, 1, 1, 1,
-0.2452466, -1.240494, -1.796944, 1, 1, 1, 1, 1,
-0.2412866, -0.3059036, -2.508729, 1, 1, 1, 1, 1,
-0.2411275, 0.5270259, 1.561698, 1, 1, 1, 1, 1,
-0.2395889, 0.4028809, 1.144556, 0, 0, 1, 1, 1,
-0.2389359, -0.1395496, -2.932496, 1, 0, 0, 1, 1,
-0.2388407, 0.7361568, 0.1379773, 1, 0, 0, 1, 1,
-0.2364212, -0.1975511, -2.994513, 1, 0, 0, 1, 1,
-0.2356319, 0.3904897, 0.2331001, 1, 0, 0, 1, 1,
-0.2310748, 0.1567677, -1.269199, 1, 0, 0, 1, 1,
-0.2277454, -0.03444395, -2.893922, 0, 0, 0, 1, 1,
-0.2197448, -0.246958, -1.898569, 0, 0, 0, 1, 1,
-0.2173703, -0.04274444, -1.795349, 0, 0, 0, 1, 1,
-0.2170706, 0.5408637, -0.242635, 0, 0, 0, 1, 1,
-0.2160215, -0.3955562, -1.909334, 0, 0, 0, 1, 1,
-0.2134592, 0.1788745, -1.586523, 0, 0, 0, 1, 1,
-0.203162, -0.4757242, -2.862776, 0, 0, 0, 1, 1,
-0.2012848, -2.375518, -3.265409, 1, 1, 1, 1, 1,
-0.1978885, 0.6782407, -0.4026405, 1, 1, 1, 1, 1,
-0.1972816, -0.9725297, -1.168338, 1, 1, 1, 1, 1,
-0.1899045, -0.020415, -1.022965, 1, 1, 1, 1, 1,
-0.1891051, -0.7225822, -2.625829, 1, 1, 1, 1, 1,
-0.1876632, -2.060577, -2.779907, 1, 1, 1, 1, 1,
-0.1849205, -0.2559341, -1.900342, 1, 1, 1, 1, 1,
-0.1838859, 2.25274, -0.6415814, 1, 1, 1, 1, 1,
-0.1832165, -1.799107, -3.195339, 1, 1, 1, 1, 1,
-0.1828506, 0.4975914, -0.2413048, 1, 1, 1, 1, 1,
-0.1805698, -1.982259, -4.840414, 1, 1, 1, 1, 1,
-0.1757364, -2.250533, -3.604618, 1, 1, 1, 1, 1,
-0.1746654, -0.06819586, -2.466358, 1, 1, 1, 1, 1,
-0.1713418, 0.3877614, -1.830968, 1, 1, 1, 1, 1,
-0.1694943, 0.9755806, 0.4737121, 1, 1, 1, 1, 1,
-0.1642769, -0.4950525, -4.319632, 0, 0, 1, 1, 1,
-0.1637958, -0.2460018, -2.040436, 1, 0, 0, 1, 1,
-0.1635851, 1.184068, 0.1152757, 1, 0, 0, 1, 1,
-0.1592361, -0.1845514, -2.635617, 1, 0, 0, 1, 1,
-0.1571881, -0.04669229, -2.087018, 1, 0, 0, 1, 1,
-0.1564594, 0.3900665, -0.07062335, 1, 0, 0, 1, 1,
-0.1550037, -0.8915895, -2.710976, 0, 0, 0, 1, 1,
-0.1539646, -1.000469, -3.834742, 0, 0, 0, 1, 1,
-0.1509034, -0.01791233, -0.9561303, 0, 0, 0, 1, 1,
-0.1500841, 1.174582, -0.5164848, 0, 0, 0, 1, 1,
-0.1490042, -2.134832, -0.4555892, 0, 0, 0, 1, 1,
-0.1451036, 0.814633, 0.8397661, 0, 0, 0, 1, 1,
-0.1420429, 0.145105, -1.61538, 0, 0, 0, 1, 1,
-0.1393747, 1.201076, 1.488209, 1, 1, 1, 1, 1,
-0.1377432, -0.1396233, -1.394591, 1, 1, 1, 1, 1,
-0.1350713, 0.04446872, -1.646653, 1, 1, 1, 1, 1,
-0.1341833, -0.6032616, -0.8023036, 1, 1, 1, 1, 1,
-0.13094, 0.4042047, 1.562022, 1, 1, 1, 1, 1,
-0.1305829, -1.073635, -1.156851, 1, 1, 1, 1, 1,
-0.12722, -0.06563462, -2.409127, 1, 1, 1, 1, 1,
-0.1243811, -0.201917, -2.430479, 1, 1, 1, 1, 1,
-0.1216019, -1.885601, -1.862969, 1, 1, 1, 1, 1,
-0.1166163, -0.5556646, -5.068826, 1, 1, 1, 1, 1,
-0.1149033, -2.195755, -1.35154, 1, 1, 1, 1, 1,
-0.114707, -0.2832779, -4.739407, 1, 1, 1, 1, 1,
-0.1146167, 0.2948907, -0.153697, 1, 1, 1, 1, 1,
-0.1142232, 0.1812514, -0.2371367, 1, 1, 1, 1, 1,
-0.106393, 0.1471995, -1.39009, 1, 1, 1, 1, 1,
-0.1062051, 2.216778, -1.817008, 0, 0, 1, 1, 1,
-0.1036075, -1.354419, -3.101692, 1, 0, 0, 1, 1,
-0.1016153, -1.258077, -2.678082, 1, 0, 0, 1, 1,
-0.09997598, -2.593827, -2.842101, 1, 0, 0, 1, 1,
-0.09559078, 0.6001476, 0.5143003, 1, 0, 0, 1, 1,
-0.09404113, -1.215074, -1.490496, 1, 0, 0, 1, 1,
-0.09374464, -0.5437573, -4.869754, 0, 0, 0, 1, 1,
-0.08672325, -1.573746, -4.055584, 0, 0, 0, 1, 1,
-0.08570581, 0.4552499, -0.1325243, 0, 0, 0, 1, 1,
-0.08533926, 0.673344, 0.9934317, 0, 0, 0, 1, 1,
-0.0805558, -0.9057793, -2.495998, 0, 0, 0, 1, 1,
-0.07661013, -1.502849, -3.761957, 0, 0, 0, 1, 1,
-0.07564385, 0.3150832, 0.8069733, 0, 0, 0, 1, 1,
-0.07488736, -1.032058, -3.363809, 1, 1, 1, 1, 1,
-0.07466578, 0.6149919, -1.562433, 1, 1, 1, 1, 1,
-0.07335087, 0.3967854, -0.9785778, 1, 1, 1, 1, 1,
-0.07159259, 1.652458, -0.797732, 1, 1, 1, 1, 1,
-0.07134856, -0.6434121, -4.586599, 1, 1, 1, 1, 1,
-0.06924162, 0.8473321, 0.1619502, 1, 1, 1, 1, 1,
-0.06830945, -0.717282, -4.114733, 1, 1, 1, 1, 1,
-0.06497843, 0.3928351, -0.8991905, 1, 1, 1, 1, 1,
-0.06129472, -1.71049, -2.998984, 1, 1, 1, 1, 1,
-0.06027795, 0.2994248, -1.84229, 1, 1, 1, 1, 1,
-0.05454575, -0.6346216, -2.318344, 1, 1, 1, 1, 1,
-0.05348162, 0.5748705, 1.18329, 1, 1, 1, 1, 1,
-0.05080378, 0.5739213, -0.688419, 1, 1, 1, 1, 1,
-0.04718192, 0.6566401, 1.035151, 1, 1, 1, 1, 1,
-0.04567904, 2.664707, -1.11698, 1, 1, 1, 1, 1,
-0.03834838, 0.9129484, 1.298917, 0, 0, 1, 1, 1,
-0.03736502, -0.7284595, -2.038593, 1, 0, 0, 1, 1,
-0.03599883, -0.0931597, -3.136443, 1, 0, 0, 1, 1,
-0.02934927, 0.9049272, 0.4717413, 1, 0, 0, 1, 1,
-0.02711745, -0.4255117, -2.651758, 1, 0, 0, 1, 1,
-0.02687875, 1.830743, 0.7834768, 1, 0, 0, 1, 1,
-0.02358096, 0.470508, 0.4479825, 0, 0, 0, 1, 1,
-0.02232512, -0.4803234, -0.5459759, 0, 0, 0, 1, 1,
-0.01736089, 0.9987301, -0.4317011, 0, 0, 0, 1, 1,
-0.01639173, -1.793339, -1.827113, 0, 0, 0, 1, 1,
-0.008024447, -1.703436, -1.632261, 0, 0, 0, 1, 1,
-0.007936614, -0.4782948, -2.417325, 0, 0, 0, 1, 1,
-0.007559201, -1.353519, -0.5990744, 0, 0, 0, 1, 1,
-0.007208428, -0.8667017, -3.293417, 1, 1, 1, 1, 1,
-0.006515528, -0.1745754, -3.52496, 1, 1, 1, 1, 1,
-0.004876376, 0.7534704, -0.3417422, 1, 1, 1, 1, 1,
-0.004066063, -1.210248, -2.688043, 1, 1, 1, 1, 1,
-0.002642854, -0.6780213, -2.12818, 1, 1, 1, 1, 1,
-0.002244002, -0.557473, -4.044141, 1, 1, 1, 1, 1,
-0.001589931, 2.302491, 2.084589, 1, 1, 1, 1, 1,
0.008034889, 0.04323955, 0.0801743, 1, 1, 1, 1, 1,
0.01123632, 0.5023876, -0.7817562, 1, 1, 1, 1, 1,
0.01201954, -0.3949096, 2.863804, 1, 1, 1, 1, 1,
0.01237593, 0.2084325, 1.322299, 1, 1, 1, 1, 1,
0.01450566, -0.5908362, 1.826753, 1, 1, 1, 1, 1,
0.01653348, 0.2446883, -1.048869, 1, 1, 1, 1, 1,
0.01821815, -2.294548, 1.981504, 1, 1, 1, 1, 1,
0.02523907, 1.652852, -1.873042, 1, 1, 1, 1, 1,
0.02538598, -1.475958, 5.128901, 0, 0, 1, 1, 1,
0.02701081, -0.7012113, 1.405728, 1, 0, 0, 1, 1,
0.0293913, 0.7101538, -0.9533352, 1, 0, 0, 1, 1,
0.03344317, 0.3552559, -0.3456312, 1, 0, 0, 1, 1,
0.03802187, 0.8144904, 0.4686235, 1, 0, 0, 1, 1,
0.03827585, -0.4036711, 3.660166, 1, 0, 0, 1, 1,
0.04144043, -0.5584161, 3.191996, 0, 0, 0, 1, 1,
0.04315779, 1.774213, -0.7730174, 0, 0, 0, 1, 1,
0.04522275, -1.202241, 4.013092, 0, 0, 0, 1, 1,
0.04911519, 1.107228, -1.680596, 0, 0, 0, 1, 1,
0.05346462, -1.316102, 3.441073, 0, 0, 0, 1, 1,
0.05575474, -0.982517, 1.643813, 0, 0, 0, 1, 1,
0.05808478, -1.034146, 2.788785, 0, 0, 0, 1, 1,
0.06366792, -0.671979, 2.530794, 1, 1, 1, 1, 1,
0.06502505, -0.1839955, 2.012932, 1, 1, 1, 1, 1,
0.07144631, -1.390187, 3.547988, 1, 1, 1, 1, 1,
0.07631732, 1.041298, 0.4579257, 1, 1, 1, 1, 1,
0.08138918, -1.19927, 2.036224, 1, 1, 1, 1, 1,
0.08355455, 0.2060654, -0.1888903, 1, 1, 1, 1, 1,
0.08401616, -3.472978, 4.261852, 1, 1, 1, 1, 1,
0.08454584, 0.4902779, -0.3495259, 1, 1, 1, 1, 1,
0.09009934, 0.7180179, 0.1863956, 1, 1, 1, 1, 1,
0.09449282, -0.07362441, 2.662182, 1, 1, 1, 1, 1,
0.09904721, 0.2515277, 1.538099, 1, 1, 1, 1, 1,
0.09990196, 1.908007, -1.667729, 1, 1, 1, 1, 1,
0.1011364, 1.221908, -1.177812, 1, 1, 1, 1, 1,
0.1029059, 0.3964776, 0.8645412, 1, 1, 1, 1, 1,
0.1031087, 0.06650812, -0.8300688, 1, 1, 1, 1, 1,
0.1053676, 1.482251, 0.7077667, 0, 0, 1, 1, 1,
0.105634, 1.086595, -1.318257, 1, 0, 0, 1, 1,
0.1068156, 0.4947923, -0.4169504, 1, 0, 0, 1, 1,
0.1076935, -1.332755, 3.573749, 1, 0, 0, 1, 1,
0.1078551, 1.019656, 1.019852, 1, 0, 0, 1, 1,
0.1113409, -0.2372604, 2.584318, 1, 0, 0, 1, 1,
0.1141014, 0.5234479, 1.11332, 0, 0, 0, 1, 1,
0.1150202, -0.3548324, 3.092993, 0, 0, 0, 1, 1,
0.1169149, 0.1881741, 1.893648, 0, 0, 0, 1, 1,
0.1180119, 0.5115076, 0.1876684, 0, 0, 0, 1, 1,
0.1199286, 0.3804556, -1.401882, 0, 0, 0, 1, 1,
0.120928, -0.6320376, 1.677681, 0, 0, 0, 1, 1,
0.1229313, 0.7347477, 1.893959, 0, 0, 0, 1, 1,
0.1255839, -2.109893, 1.778346, 1, 1, 1, 1, 1,
0.1275336, -0.1363576, 2.602877, 1, 1, 1, 1, 1,
0.1297819, -0.1623519, 1.753006, 1, 1, 1, 1, 1,
0.1313651, -1.001737, 2.193437, 1, 1, 1, 1, 1,
0.1320698, -0.4929586, 2.497108, 1, 1, 1, 1, 1,
0.1326514, 0.9377472, 0.1991709, 1, 1, 1, 1, 1,
0.1355238, 0.3834299, 0.5340104, 1, 1, 1, 1, 1,
0.1382104, 1.765313, -0.4576563, 1, 1, 1, 1, 1,
0.1386487, 0.2734131, 1.541757, 1, 1, 1, 1, 1,
0.1388499, -0.3953535, 5.258297, 1, 1, 1, 1, 1,
0.1413181, -2.699063, 2.474697, 1, 1, 1, 1, 1,
0.1414244, -1.137277, 3.179564, 1, 1, 1, 1, 1,
0.1454339, -0.7218414, 1.416104, 1, 1, 1, 1, 1,
0.1455487, 0.03327985, -0.09443499, 1, 1, 1, 1, 1,
0.1478678, -0.1928534, 2.034574, 1, 1, 1, 1, 1,
0.1502777, -0.9453384, 3.931546, 0, 0, 1, 1, 1,
0.1536821, 1.859086, 1.117125, 1, 0, 0, 1, 1,
0.1588767, -0.1718978, 2.276469, 1, 0, 0, 1, 1,
0.1655135, -0.8238958, 3.788665, 1, 0, 0, 1, 1,
0.1669156, 2.015204, 0.6649863, 1, 0, 0, 1, 1,
0.1703233, -1.24155, 3.959239, 1, 0, 0, 1, 1,
0.1705468, -0.4571708, 2.612798, 0, 0, 0, 1, 1,
0.1731702, -0.2598779, 2.531275, 0, 0, 0, 1, 1,
0.1751169, -0.7217996, 1.663484, 0, 0, 0, 1, 1,
0.1753202, -0.7651433, 3.554844, 0, 0, 0, 1, 1,
0.1763275, 0.1864948, 2.774814, 0, 0, 0, 1, 1,
0.1783802, -0.1044783, 3.054802, 0, 0, 0, 1, 1,
0.1801488, -0.6584844, 3.140187, 0, 0, 0, 1, 1,
0.1804332, 2.368355, -2.429249, 1, 1, 1, 1, 1,
0.1853473, 0.4917707, 0.3272182, 1, 1, 1, 1, 1,
0.1873545, -0.1821819, 3.253187, 1, 1, 1, 1, 1,
0.1895332, 0.594609, -0.8907974, 1, 1, 1, 1, 1,
0.1899908, -0.8841997, 3.261953, 1, 1, 1, 1, 1,
0.1908405, -1.230818, 2.2572, 1, 1, 1, 1, 1,
0.1911758, 0.2801071, 1.17835, 1, 1, 1, 1, 1,
0.1913204, 2.422572, -0.425526, 1, 1, 1, 1, 1,
0.1924963, -0.3799779, 2.826541, 1, 1, 1, 1, 1,
0.1932068, -1.207735, 3.099151, 1, 1, 1, 1, 1,
0.2006182, 1.408535, -0.6614469, 1, 1, 1, 1, 1,
0.2030573, -0.5359048, 3.962325, 1, 1, 1, 1, 1,
0.203889, -0.2469135, 1.875198, 1, 1, 1, 1, 1,
0.2049202, -1.692185, 2.065907, 1, 1, 1, 1, 1,
0.2053002, 1.979461, -0.3783854, 1, 1, 1, 1, 1,
0.2062927, 0.9438762, -1.283377, 0, 0, 1, 1, 1,
0.212881, -1.253468, 2.850376, 1, 0, 0, 1, 1,
0.2137268, -0.9030871, 2.626501, 1, 0, 0, 1, 1,
0.2183832, 0.2914782, -0.3410804, 1, 0, 0, 1, 1,
0.2248436, -0.6734466, 3.120408, 1, 0, 0, 1, 1,
0.2252779, -0.04084295, 1.406438, 1, 0, 0, 1, 1,
0.2300216, 0.4218564, 1.094173, 0, 0, 0, 1, 1,
0.2310988, 0.5828414, -0.2117035, 0, 0, 0, 1, 1,
0.2336749, -0.004278361, 1.619715, 0, 0, 0, 1, 1,
0.2359833, -0.6530054, 4.060267, 0, 0, 0, 1, 1,
0.2368446, -0.3849071, 2.183356, 0, 0, 0, 1, 1,
0.2404361, -0.179961, 3.932154, 0, 0, 0, 1, 1,
0.246773, -0.536644, 1.521561, 0, 0, 0, 1, 1,
0.2479478, 0.1535165, 0.2029739, 1, 1, 1, 1, 1,
0.2490462, 0.9644775, 3.55971, 1, 1, 1, 1, 1,
0.2545785, 0.1557555, -0.1674264, 1, 1, 1, 1, 1,
0.2547837, 0.9316472, 1.033278, 1, 1, 1, 1, 1,
0.2554458, -1.585244, 4.048091, 1, 1, 1, 1, 1,
0.260773, -0.4958618, 3.986105, 1, 1, 1, 1, 1,
0.262508, 0.4840687, 1.632967, 1, 1, 1, 1, 1,
0.2632726, 0.5766256, 1.033085, 1, 1, 1, 1, 1,
0.2643158, -2.154858, 0.2035727, 1, 1, 1, 1, 1,
0.2689106, 1.266651, -0.6481231, 1, 1, 1, 1, 1,
0.271432, -0.378638, 2.944377, 1, 1, 1, 1, 1,
0.272036, -0.01630698, 2.087752, 1, 1, 1, 1, 1,
0.27828, 0.00868616, 0.6516192, 1, 1, 1, 1, 1,
0.2816886, 1.687512, 0.3770202, 1, 1, 1, 1, 1,
0.2879863, -0.1548449, 2.209528, 1, 1, 1, 1, 1,
0.2882736, -0.1457397, 2.214686, 0, 0, 1, 1, 1,
0.2902381, -0.5639665, 1.893742, 1, 0, 0, 1, 1,
0.2927121, 0.1729253, 0.9547561, 1, 0, 0, 1, 1,
0.2968848, -0.2717755, 4.141072, 1, 0, 0, 1, 1,
0.2977876, 3.833383, 0.127147, 1, 0, 0, 1, 1,
0.3069173, 1.934427, -0.5305293, 1, 0, 0, 1, 1,
0.3083506, -0.4692552, 2.959058, 0, 0, 0, 1, 1,
0.3149035, -1.133509, 1.657716, 0, 0, 0, 1, 1,
0.318138, -0.2693174, 1.196764, 0, 0, 0, 1, 1,
0.3197209, 0.8463163, 0.4664533, 0, 0, 0, 1, 1,
0.3200255, 1.103632, -0.9368361, 0, 0, 0, 1, 1,
0.3218606, -1.606152, 2.048751, 0, 0, 0, 1, 1,
0.3235272, -1.410839, 1.885134, 0, 0, 0, 1, 1,
0.3238737, -0.6293479, 3.096267, 1, 1, 1, 1, 1,
0.3292495, 1.616071, 0.9822295, 1, 1, 1, 1, 1,
0.329401, 1.061141, 1.820192, 1, 1, 1, 1, 1,
0.3316949, -1.900849, 2.168444, 1, 1, 1, 1, 1,
0.3323452, -0.4952357, 3.042145, 1, 1, 1, 1, 1,
0.3356465, -2.066097, 1.092131, 1, 1, 1, 1, 1,
0.3393242, 1.352662, 0.3908148, 1, 1, 1, 1, 1,
0.3456527, 0.578676, 1.110401, 1, 1, 1, 1, 1,
0.3465947, 0.3325126, -1.922256, 1, 1, 1, 1, 1,
0.34727, 1.906859, 0.2365684, 1, 1, 1, 1, 1,
0.3503393, 0.1581433, 3.16874, 1, 1, 1, 1, 1,
0.3544087, 0.7984581, 1.101826, 1, 1, 1, 1, 1,
0.3595541, -0.5323817, 3.190468, 1, 1, 1, 1, 1,
0.3660665, -1.40092, 1.692712, 1, 1, 1, 1, 1,
0.3672398, -1.110693, 1.102905, 1, 1, 1, 1, 1,
0.3676568, -2.014971, 3.539449, 0, 0, 1, 1, 1,
0.369278, -0.2979707, 0.8501496, 1, 0, 0, 1, 1,
0.3732915, -1.078346, 2.338061, 1, 0, 0, 1, 1,
0.3763008, -1.608174, 3.553062, 1, 0, 0, 1, 1,
0.3791851, -1.066761, 2.280178, 1, 0, 0, 1, 1,
0.3792309, -1.043075, 2.2741, 1, 0, 0, 1, 1,
0.3797377, 1.632851, 0.3639317, 0, 0, 0, 1, 1,
0.3830576, -2.178707, 5.489812, 0, 0, 0, 1, 1,
0.3876389, -0.2810233, 2.790947, 0, 0, 0, 1, 1,
0.387677, -1.16685, 3.92324, 0, 0, 0, 1, 1,
0.3889492, 0.5332102, -0.01463998, 0, 0, 0, 1, 1,
0.3943315, -0.2709665, 1.709308, 0, 0, 0, 1, 1,
0.3963487, 0.08178214, 2.171197, 0, 0, 0, 1, 1,
0.4024065, 1.151501, 1.61211, 1, 1, 1, 1, 1,
0.40312, 1.045631, -0.7341287, 1, 1, 1, 1, 1,
0.4070651, -0.0253678, 0.4713059, 1, 1, 1, 1, 1,
0.4087254, 0.4889251, 1.332464, 1, 1, 1, 1, 1,
0.4154702, -0.6055145, 1.907248, 1, 1, 1, 1, 1,
0.4172075, -1.255979, 5.722003, 1, 1, 1, 1, 1,
0.4174591, 0.9725947, -0.9238514, 1, 1, 1, 1, 1,
0.4202985, 0.2355974, 0.8422414, 1, 1, 1, 1, 1,
0.425361, -2.429174, 4.253197, 1, 1, 1, 1, 1,
0.4259796, 0.1243605, 1.824974, 1, 1, 1, 1, 1,
0.4275025, -0.07773424, 1.858167, 1, 1, 1, 1, 1,
0.4290984, -0.08667728, 2.597056, 1, 1, 1, 1, 1,
0.433849, 0.5522007, 1.966546, 1, 1, 1, 1, 1,
0.4345181, -2.0456, 2.347856, 1, 1, 1, 1, 1,
0.4391403, -2.025381, 3.137841, 1, 1, 1, 1, 1,
0.440264, -0.1174257, 0.6567253, 0, 0, 1, 1, 1,
0.4411505, -0.2844209, 2.784973, 1, 0, 0, 1, 1,
0.4412766, 0.320937, 2.061537, 1, 0, 0, 1, 1,
0.4441678, 0.6982357, 0.3714975, 1, 0, 0, 1, 1,
0.4531546, -0.3106719, 2.134069, 1, 0, 0, 1, 1,
0.4566554, -0.7030343, 2.92508, 1, 0, 0, 1, 1,
0.4609667, -1.150583, 3.513274, 0, 0, 0, 1, 1,
0.4623083, 1.362566, -0.2986255, 0, 0, 0, 1, 1,
0.4625248, 1.362373, 1.169063, 0, 0, 0, 1, 1,
0.4678014, -0.8334454, 2.186383, 0, 0, 0, 1, 1,
0.4681844, 0.1051663, 2.893481, 0, 0, 0, 1, 1,
0.4716433, -0.4963974, 2.596782, 0, 0, 0, 1, 1,
0.4731084, -0.8360232, 1.532917, 0, 0, 0, 1, 1,
0.4737996, 0.1422597, 0.3438793, 1, 1, 1, 1, 1,
0.4745947, -1.313375, 3.835934, 1, 1, 1, 1, 1,
0.4767293, 0.3599823, 1.589454, 1, 1, 1, 1, 1,
0.4787619, -0.4000935, 2.500813, 1, 1, 1, 1, 1,
0.4804156, -0.1897156, 3.371343, 1, 1, 1, 1, 1,
0.4821726, -1.077535, 2.758175, 1, 1, 1, 1, 1,
0.4837467, -1.238514, 1.007835, 1, 1, 1, 1, 1,
0.4960102, 0.02337794, 1.851583, 1, 1, 1, 1, 1,
0.4999272, -0.04542558, 1.945509, 1, 1, 1, 1, 1,
0.5012714, -0.4786775, 3.274565, 1, 1, 1, 1, 1,
0.5035248, -0.782582, 3.765768, 1, 1, 1, 1, 1,
0.504461, -0.2741674, 2.499931, 1, 1, 1, 1, 1,
0.5047955, 1.695012, -0.09788502, 1, 1, 1, 1, 1,
0.5048171, 0.6855279, 1.005316, 1, 1, 1, 1, 1,
0.514563, 1.700397, -0.4956543, 1, 1, 1, 1, 1,
0.516236, -1.608292, 2.652355, 0, 0, 1, 1, 1,
0.5204022, -0.9626625, 3.685452, 1, 0, 0, 1, 1,
0.5234644, -0.7331995, 2.325203, 1, 0, 0, 1, 1,
0.5237445, 1.13659, 1.870577, 1, 0, 0, 1, 1,
0.5266441, -1.226164, 3.576495, 1, 0, 0, 1, 1,
0.5278587, 0.6367934, 0.2766524, 1, 0, 0, 1, 1,
0.5365804, -0.1619691, 4.161953, 0, 0, 0, 1, 1,
0.5370808, 0.2178506, -0.2656178, 0, 0, 0, 1, 1,
0.5427427, 1.045221, 0.53303, 0, 0, 0, 1, 1,
0.5454931, -1.332309, 1.138939, 0, 0, 0, 1, 1,
0.5489425, 0.9845945, 1.08905, 0, 0, 0, 1, 1,
0.5490467, -2.067359, 2.161125, 0, 0, 0, 1, 1,
0.5544743, 0.2729771, 1.362346, 0, 0, 0, 1, 1,
0.5554813, 0.7617418, -0.1285982, 1, 1, 1, 1, 1,
0.5568562, 0.811627, 1.583676, 1, 1, 1, 1, 1,
0.5585211, 1.319684, 1.740079, 1, 1, 1, 1, 1,
0.5604665, 0.5677761, 1.664482, 1, 1, 1, 1, 1,
0.5628685, 0.1038942, 0.9589815, 1, 1, 1, 1, 1,
0.5660985, 0.3766445, 2.482693, 1, 1, 1, 1, 1,
0.5678965, 0.2579201, 1.61471, 1, 1, 1, 1, 1,
0.5713481, -0.4771472, 3.617424, 1, 1, 1, 1, 1,
0.5721611, -0.676265, 2.862231, 1, 1, 1, 1, 1,
0.5750116, -1.34352, 3.377534, 1, 1, 1, 1, 1,
0.5755106, -0.2266145, 1.939115, 1, 1, 1, 1, 1,
0.5755216, -1.287326, 2.458842, 1, 1, 1, 1, 1,
0.5766849, 0.2378551, -0.06512294, 1, 1, 1, 1, 1,
0.578457, 0.4910586, 0.9028655, 1, 1, 1, 1, 1,
0.579226, -1.206255, 5.006715, 1, 1, 1, 1, 1,
0.5823002, 0.2135351, 0.9376006, 0, 0, 1, 1, 1,
0.5835511, -1.747327, 2.191568, 1, 0, 0, 1, 1,
0.5843082, -0.3251649, 1.962921, 1, 0, 0, 1, 1,
0.5897772, 2.143711, 1.969762, 1, 0, 0, 1, 1,
0.593506, 0.9044934, 0.7587875, 1, 0, 0, 1, 1,
0.6031578, -0.9221803, 1.300034, 1, 0, 0, 1, 1,
0.6041212, -0.4954928, 1.328666, 0, 0, 0, 1, 1,
0.6043826, 0.2026942, 2.453426, 0, 0, 0, 1, 1,
0.6083338, -0.1846388, 0.2197687, 0, 0, 0, 1, 1,
0.6094106, 0.7755687, 0.1577125, 0, 0, 0, 1, 1,
0.6101396, -0.3428429, 3.098298, 0, 0, 0, 1, 1,
0.6121956, -1.17227, 2.503252, 0, 0, 0, 1, 1,
0.6131055, -0.890421, 2.650547, 0, 0, 0, 1, 1,
0.6183787, 0.01816017, 1.98271, 1, 1, 1, 1, 1,
0.6271262, -0.6733159, 1.901648, 1, 1, 1, 1, 1,
0.6274806, -1.547482, 2.184221, 1, 1, 1, 1, 1,
0.6276826, 2.277674, 1.15354, 1, 1, 1, 1, 1,
0.6405503, -2.040668, 2.995076, 1, 1, 1, 1, 1,
0.6407899, -2.451885, 2.973487, 1, 1, 1, 1, 1,
0.6488261, 0.8088385, 1.549809, 1, 1, 1, 1, 1,
0.6491283, -0.3982625, 2.793502, 1, 1, 1, 1, 1,
0.6495834, -1.460428, 2.104604, 1, 1, 1, 1, 1,
0.660071, -0.894733, 3.734525, 1, 1, 1, 1, 1,
0.6631962, 0.05550691, 2.817972, 1, 1, 1, 1, 1,
0.6645334, -1.490353, 2.233566, 1, 1, 1, 1, 1,
0.6652895, -0.1468898, 1.944733, 1, 1, 1, 1, 1,
0.6659015, 0.6085169, 1.315498, 1, 1, 1, 1, 1,
0.6676697, -1.103932, 3.054111, 1, 1, 1, 1, 1,
0.6680425, 0.464293, 2.756346, 0, 0, 1, 1, 1,
0.6791421, -0.9451216, 2.32113, 1, 0, 0, 1, 1,
0.6808265, 1.371905, 0.1394753, 1, 0, 0, 1, 1,
0.6898587, 0.1540613, 2.620268, 1, 0, 0, 1, 1,
0.6908197, 0.1667516, 3.402717, 1, 0, 0, 1, 1,
0.6918718, -0.3451011, 1.490104, 1, 0, 0, 1, 1,
0.6923828, 0.1365332, 1.735053, 0, 0, 0, 1, 1,
0.6981304, -0.0392745, 1.236849, 0, 0, 0, 1, 1,
0.7016459, 0.6113524, 1.428575, 0, 0, 0, 1, 1,
0.7061815, -0.06147241, 2.70523, 0, 0, 0, 1, 1,
0.7074566, 0.8040335, -0.335822, 0, 0, 0, 1, 1,
0.7081355, -1.08841, 2.472859, 0, 0, 0, 1, 1,
0.7102782, 1.109511, -0.08126671, 0, 0, 0, 1, 1,
0.7115485, 0.4257326, 2.280619, 1, 1, 1, 1, 1,
0.7295694, -0.1064547, 0.3306942, 1, 1, 1, 1, 1,
0.7360493, 1.299827, 0.03241792, 1, 1, 1, 1, 1,
0.7362453, 1.406993, 1.874517, 1, 1, 1, 1, 1,
0.7368793, -0.6369383, 2.626036, 1, 1, 1, 1, 1,
0.7388789, 0.2390957, 0.7747028, 1, 1, 1, 1, 1,
0.7455617, -0.3298354, 2.974139, 1, 1, 1, 1, 1,
0.7515187, -0.5234435, 3.783612, 1, 1, 1, 1, 1,
0.7521597, -0.4155497, 1.288265, 1, 1, 1, 1, 1,
0.7611869, -1.09476, 1.667158, 1, 1, 1, 1, 1,
0.7656519, 1.44139, -0.6482888, 1, 1, 1, 1, 1,
0.767174, 0.8885583, 0.9942285, 1, 1, 1, 1, 1,
0.7674139, 0.5521061, 1.881571, 1, 1, 1, 1, 1,
0.7674542, -0.02402134, 0.6107454, 1, 1, 1, 1, 1,
0.7682006, -0.7534596, 2.136276, 1, 1, 1, 1, 1,
0.7683823, 0.525107, 1.286875, 0, 0, 1, 1, 1,
0.7705482, -0.3066178, 2.54481, 1, 0, 0, 1, 1,
0.7779047, 1.200411, 0.1064092, 1, 0, 0, 1, 1,
0.7834556, -0.17191, 2.47896, 1, 0, 0, 1, 1,
0.7840934, 0.8659603, 0.8292071, 1, 0, 0, 1, 1,
0.791551, -0.9235669, 0.7782277, 1, 0, 0, 1, 1,
0.7923288, 0.2415742, 4.142024, 0, 0, 0, 1, 1,
0.7950973, 0.2452279, 3.203884, 0, 0, 0, 1, 1,
0.7969934, -0.6116904, 1.957035, 0, 0, 0, 1, 1,
0.7984005, 0.4371744, 2.108164, 0, 0, 0, 1, 1,
0.7997969, -1.254076, 4.288164, 0, 0, 0, 1, 1,
0.8032978, -0.3729692, 2.787098, 0, 0, 0, 1, 1,
0.8085983, -0.9617189, 1.390626, 0, 0, 0, 1, 1,
0.8089587, 0.248317, 1.173502, 1, 1, 1, 1, 1,
0.8103742, 1.089686, 0.950101, 1, 1, 1, 1, 1,
0.8119521, -0.04230114, 1.298882, 1, 1, 1, 1, 1,
0.8119997, -0.3972162, 3.390949, 1, 1, 1, 1, 1,
0.8181479, -0.06640438, 1.482788, 1, 1, 1, 1, 1,
0.8272337, 0.1972006, -0.1948846, 1, 1, 1, 1, 1,
0.827557, -0.005299982, 3.278185, 1, 1, 1, 1, 1,
0.8370741, -0.9374799, 1.896585, 1, 1, 1, 1, 1,
0.8398508, -0.4579989, 1.032125, 1, 1, 1, 1, 1,
0.8401133, 1.427825, 0.8692635, 1, 1, 1, 1, 1,
0.8401654, -0.4078167, 1.818637, 1, 1, 1, 1, 1,
0.8409362, -0.4262101, 3.521572, 1, 1, 1, 1, 1,
0.8428932, -0.8674889, 2.124802, 1, 1, 1, 1, 1,
0.8451995, -0.5392904, 2.679124, 1, 1, 1, 1, 1,
0.8499792, 0.3712077, 0.3142495, 1, 1, 1, 1, 1,
0.8510857, -2.175696, 2.018393, 0, 0, 1, 1, 1,
0.8515568, 0.3387787, -2.058808, 1, 0, 0, 1, 1,
0.8611011, 0.2507955, 2.002294, 1, 0, 0, 1, 1,
0.8672202, 0.2649681, -0.4506659, 1, 0, 0, 1, 1,
0.8712764, 1.085156, -0.5415377, 1, 0, 0, 1, 1,
0.8731376, -0.1846924, 1.544187, 1, 0, 0, 1, 1,
0.8810203, -0.1719012, 2.79832, 0, 0, 0, 1, 1,
0.8890836, -1.111905, 3.370694, 0, 0, 0, 1, 1,
0.8940455, 0.220486, 2.609411, 0, 0, 0, 1, 1,
0.9073499, 0.239563, 1.22248, 0, 0, 0, 1, 1,
0.9146507, 0.442932, -1.376313, 0, 0, 0, 1, 1,
0.9212388, -0.7561509, 2.670679, 0, 0, 0, 1, 1,
0.9229665, -2.076289, 2.811355, 0, 0, 0, 1, 1,
0.9239349, -0.5514108, 1.602304, 1, 1, 1, 1, 1,
0.926815, -1.010314, 2.782996, 1, 1, 1, 1, 1,
0.9316332, 0.6301444, -0.6141883, 1, 1, 1, 1, 1,
0.9388163, 1.714238, 0.04531905, 1, 1, 1, 1, 1,
0.9481238, 0.7250991, 2.601845, 1, 1, 1, 1, 1,
0.9671124, 1.513192, 0.4149208, 1, 1, 1, 1, 1,
0.9704537, 1.296378, 1.18815, 1, 1, 1, 1, 1,
0.9742666, -0.8197976, 1.663228, 1, 1, 1, 1, 1,
0.9789394, 0.5492579, 2.188312, 1, 1, 1, 1, 1,
0.9812678, 1.167038, -0.6395781, 1, 1, 1, 1, 1,
0.9828348, -0.1680478, 2.842586, 1, 1, 1, 1, 1,
0.9912967, 0.1035461, 1.712661, 1, 1, 1, 1, 1,
0.9949734, 0.9384069, 2.189281, 1, 1, 1, 1, 1,
0.9975003, 0.3367008, -0.7872754, 1, 1, 1, 1, 1,
1.00093, 1.168886, 0.1485754, 1, 1, 1, 1, 1,
1.003027, -0.2692266, 1.910741, 0, 0, 1, 1, 1,
1.004655, 0.7343407, -0.6429558, 1, 0, 0, 1, 1,
1.00539, 1.112707, 1.669798, 1, 0, 0, 1, 1,
1.008709, -0.8188036, 3.389844, 1, 0, 0, 1, 1,
1.00981, -1.862103, 1.480103, 1, 0, 0, 1, 1,
1.011649, 1.881114, 2.024707, 1, 0, 0, 1, 1,
1.013818, 1.054517, -0.8579447, 0, 0, 0, 1, 1,
1.025465, -0.06601483, 0.3274343, 0, 0, 0, 1, 1,
1.032951, -1.817948, 1.917777, 0, 0, 0, 1, 1,
1.033431, 0.9161399, -0.2364192, 0, 0, 0, 1, 1,
1.033572, -1.699921, 0.2708277, 0, 0, 0, 1, 1,
1.034243, 0.5839531, 3.454471, 0, 0, 0, 1, 1,
1.03728, -0.471878, 0.9483709, 0, 0, 0, 1, 1,
1.040275, -0.4587138, 2.882431, 1, 1, 1, 1, 1,
1.042903, -0.6983719, 3.1486, 1, 1, 1, 1, 1,
1.043855, -0.6046906, 2.352831, 1, 1, 1, 1, 1,
1.048342, -1.251282, 1.365502, 1, 1, 1, 1, 1,
1.04926, 0.03653208, 1.535771, 1, 1, 1, 1, 1,
1.055223, 1.296821, -0.4928078, 1, 1, 1, 1, 1,
1.057959, 0.6244928, -0.1906078, 1, 1, 1, 1, 1,
1.059113, -0.6279834, 2.603162, 1, 1, 1, 1, 1,
1.060308, 0.7589099, 1.001025, 1, 1, 1, 1, 1,
1.068059, -0.7737979, 2.694509, 1, 1, 1, 1, 1,
1.07911, -0.3085307, 2.097049, 1, 1, 1, 1, 1,
1.082923, -0.7404408, 1.067854, 1, 1, 1, 1, 1,
1.083962, -0.2084395, 3.858624, 1, 1, 1, 1, 1,
1.084727, -0.8435934, 1.047427, 1, 1, 1, 1, 1,
1.089615, -0.7311869, 3.084209, 1, 1, 1, 1, 1,
1.091375, -1.462537, 2.648289, 0, 0, 1, 1, 1,
1.097957, 0.2965336, 2.173478, 1, 0, 0, 1, 1,
1.100779, -1.169062, 2.977889, 1, 0, 0, 1, 1,
1.102802, 1.425724, -0.9474178, 1, 0, 0, 1, 1,
1.108329, -0.04891903, 1.602862, 1, 0, 0, 1, 1,
1.110451, -1.621432, 2.18557, 1, 0, 0, 1, 1,
1.113607, -0.04609641, 0.6343392, 0, 0, 0, 1, 1,
1.118711, 0.4406602, 1.591639, 0, 0, 0, 1, 1,
1.126352, -0.8248677, 2.393518, 0, 0, 0, 1, 1,
1.129609, -0.1820777, 0.7143754, 0, 0, 0, 1, 1,
1.13102, 0.5860987, 0.8018239, 0, 0, 0, 1, 1,
1.134915, -0.7455083, 4.015448, 0, 0, 0, 1, 1,
1.140094, -0.5934644, 1.927919, 0, 0, 0, 1, 1,
1.144037, -0.7771049, 1.909148, 1, 1, 1, 1, 1,
1.145871, 1.49842, 0.7566223, 1, 1, 1, 1, 1,
1.147399, 0.2051341, 1.229767, 1, 1, 1, 1, 1,
1.15093, -1.337625, 0.8067256, 1, 1, 1, 1, 1,
1.15814, 1.036123, 1.143032, 1, 1, 1, 1, 1,
1.166583, -1.69179, 3.055867, 1, 1, 1, 1, 1,
1.17258, 1.240703, -0.5218018, 1, 1, 1, 1, 1,
1.175418, 1.566025, 0.8938711, 1, 1, 1, 1, 1,
1.177626, 1.621502, -1.063174, 1, 1, 1, 1, 1,
1.187834, -0.6527386, 2.652294, 1, 1, 1, 1, 1,
1.189939, -1.866416, 3.084652, 1, 1, 1, 1, 1,
1.191552, 1.031274, 2.395681, 1, 1, 1, 1, 1,
1.191773, -0.3533249, 1.313037, 1, 1, 1, 1, 1,
1.193061, -0.3995836, 2.418205, 1, 1, 1, 1, 1,
1.193938, -0.6388715, 1.807001, 1, 1, 1, 1, 1,
1.204432, 0.4316034, 2.192901, 0, 0, 1, 1, 1,
1.210729, 0.02260207, 1.713845, 1, 0, 0, 1, 1,
1.220927, -0.7344067, 3.253263, 1, 0, 0, 1, 1,
1.227564, -1.199254, 0.8558052, 1, 0, 0, 1, 1,
1.228178, -1.054795, 1.821396, 1, 0, 0, 1, 1,
1.23243, 1.191851, 0.3758145, 1, 0, 0, 1, 1,
1.25608, 0.2782393, 1.333227, 0, 0, 0, 1, 1,
1.260622, 0.03570249, 3.250972, 0, 0, 0, 1, 1,
1.260702, -1.988409, 3.56908, 0, 0, 0, 1, 1,
1.261932, -0.4939776, 1.417466, 0, 0, 0, 1, 1,
1.262108, 1.010349, -0.009392804, 0, 0, 0, 1, 1,
1.276512, 0.7808422, 1.851691, 0, 0, 0, 1, 1,
1.289447, 0.5793858, 0.5936863, 0, 0, 0, 1, 1,
1.303159, 1.006593, 0.02537211, 1, 1, 1, 1, 1,
1.318779, 0.1272216, 0.6716008, 1, 1, 1, 1, 1,
1.324457, 0.9950286, 0.3841622, 1, 1, 1, 1, 1,
1.327396, -1.070171, 2.140406, 1, 1, 1, 1, 1,
1.33206, -0.6882328, 1.430103, 1, 1, 1, 1, 1,
1.332745, 0.595129, 2.539959, 1, 1, 1, 1, 1,
1.333953, -1.407586, 2.104227, 1, 1, 1, 1, 1,
1.339281, -1.072917, 0.3796635, 1, 1, 1, 1, 1,
1.339523, 0.05391433, 3.579681, 1, 1, 1, 1, 1,
1.340971, -0.165396, 0.5819495, 1, 1, 1, 1, 1,
1.345631, -1.843108, 2.746393, 1, 1, 1, 1, 1,
1.346629, 0.7203284, 1.972954, 1, 1, 1, 1, 1,
1.352288, 0.06660707, 0.7031858, 1, 1, 1, 1, 1,
1.355114, -0.2439666, 2.994085, 1, 1, 1, 1, 1,
1.356167, -1.547622, 3.62008, 1, 1, 1, 1, 1,
1.358113, -1.76452, 3.537896, 0, 0, 1, 1, 1,
1.360185, -1.647508, 3.509235, 1, 0, 0, 1, 1,
1.36733, 0.3016286, 0.9945233, 1, 0, 0, 1, 1,
1.374321, -0.3849993, 3.08672, 1, 0, 0, 1, 1,
1.375252, -0.3377201, 0.8788955, 1, 0, 0, 1, 1,
1.386165, -0.3333985, 2.847834, 1, 0, 0, 1, 1,
1.389555, -1.139702, 4.090763, 0, 0, 0, 1, 1,
1.390308, -0.4327525, 2.299901, 0, 0, 0, 1, 1,
1.391147, 0.2350158, 0.860355, 0, 0, 0, 1, 1,
1.400299, -1.255288, 3.223279, 0, 0, 0, 1, 1,
1.415527, -0.1350987, 2.683274, 0, 0, 0, 1, 1,
1.42424, -0.6240271, 2.472522, 0, 0, 0, 1, 1,
1.434457, -0.04456139, 1.922343, 0, 0, 0, 1, 1,
1.448506, -0.5650874, 0.7883726, 1, 1, 1, 1, 1,
1.469942, -2.003637, 1.549101, 1, 1, 1, 1, 1,
1.482613, 0.06498496, 4.388671, 1, 1, 1, 1, 1,
1.493891, 0.05579685, 0.6038511, 1, 1, 1, 1, 1,
1.49724, 1.874399, 1.371969, 1, 1, 1, 1, 1,
1.521091, 1.057371, 0.5370555, 1, 1, 1, 1, 1,
1.532407, 1.583999, 1.268245, 1, 1, 1, 1, 1,
1.549999, 1.921395, 1.650825, 1, 1, 1, 1, 1,
1.571822, 0.2868835, 1.421424, 1, 1, 1, 1, 1,
1.574325, -1.253363, 0.7375836, 1, 1, 1, 1, 1,
1.578174, 1.229854, 0.09114938, 1, 1, 1, 1, 1,
1.578461, 0.8172519, 0.6606989, 1, 1, 1, 1, 1,
1.587718, -0.2193001, 1.060202, 1, 1, 1, 1, 1,
1.589455, 0.5387562, 2.102457, 1, 1, 1, 1, 1,
1.600968, 0.9287738, 2.257211, 1, 1, 1, 1, 1,
1.621311, 0.5960597, 0.3464478, 0, 0, 1, 1, 1,
1.644514, -0.8434123, 2.625623, 1, 0, 0, 1, 1,
1.647821, -0.4073025, 0.8219039, 1, 0, 0, 1, 1,
1.652298, -0.7186814, 0.8317648, 1, 0, 0, 1, 1,
1.657282, 0.5596004, 1.130174, 1, 0, 0, 1, 1,
1.657462, -1.064867, 1.842734, 1, 0, 0, 1, 1,
1.690409, -0.1205714, 0.5981872, 0, 0, 0, 1, 1,
1.690701, 2.278179, 1.12053, 0, 0, 0, 1, 1,
1.74086, 0.7689655, 1.971404, 0, 0, 0, 1, 1,
1.761964, 0.642759, -1.284403, 0, 0, 0, 1, 1,
1.766061, 0.06962112, 2.153126, 0, 0, 0, 1, 1,
1.78215, -1.723258, 1.475002, 0, 0, 0, 1, 1,
1.789962, 1.588468, 0.9399139, 0, 0, 0, 1, 1,
1.796171, 0.3940841, 1.915472, 1, 1, 1, 1, 1,
1.800948, 1.040186, 0.4212659, 1, 1, 1, 1, 1,
1.803076, -1.080871, 1.299306, 1, 1, 1, 1, 1,
1.810001, -0.5720397, 1.468626, 1, 1, 1, 1, 1,
1.812441, -0.7527716, 1.902177, 1, 1, 1, 1, 1,
1.812876, -0.1296594, 1.841276, 1, 1, 1, 1, 1,
1.826783, -1.331093, 2.011169, 1, 1, 1, 1, 1,
1.833193, 0.2419183, 0.9330325, 1, 1, 1, 1, 1,
1.872753, 0.7220884, 1.852953, 1, 1, 1, 1, 1,
1.882643, -1.181942, 3.732412, 1, 1, 1, 1, 1,
1.886582, 0.544444, 1.950564, 1, 1, 1, 1, 1,
1.937266, -1.13715, 3.90371, 1, 1, 1, 1, 1,
1.946692, 1.099575, -0.6256555, 1, 1, 1, 1, 1,
1.9639, 0.1404682, 2.985569, 1, 1, 1, 1, 1,
1.976376, 0.3786485, 1.228939, 1, 1, 1, 1, 1,
1.985508, 0.01076313, 0.7958831, 0, 0, 1, 1, 1,
2.00241, -1.290077, 1.585896, 1, 0, 0, 1, 1,
2.033345, 0.1971356, 0.8564959, 1, 0, 0, 1, 1,
2.038809, -0.6566193, 1.290554, 1, 0, 0, 1, 1,
2.055242, 0.1141811, 1.487489, 1, 0, 0, 1, 1,
2.059734, 0.08575741, 2.22832, 1, 0, 0, 1, 1,
2.06262, 0.4986015, 1.943265, 0, 0, 0, 1, 1,
2.132886, 1.676866, 1.673328, 0, 0, 0, 1, 1,
2.201546, -0.4203232, 2.057541, 0, 0, 0, 1, 1,
2.244551, 0.7829286, 1.757148, 0, 0, 0, 1, 1,
2.44427, 1.925434, 0.1887894, 0, 0, 0, 1, 1,
2.482826, 0.3110299, 2.842654, 0, 0, 0, 1, 1,
2.519481, -1.331394, 2.351707, 0, 0, 0, 1, 1,
2.532903, 0.6456777, 0.1165678, 1, 1, 1, 1, 1,
2.552035, 0.06901666, 1.007907, 1, 1, 1, 1, 1,
2.610519, -1.489407, 1.337134, 1, 1, 1, 1, 1,
2.660911, -0.05372528, 1.162679, 1, 1, 1, 1, 1,
2.855565, -2.112173, 3.098548, 1, 1, 1, 1, 1,
3.068637, -0.7489956, 1.302338, 1, 1, 1, 1, 1,
3.318078, 1.458911, 2.515514, 1, 1, 1, 1, 1
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
var radius = 9.827294;
var distance = 34.51795;
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
mvMatrix.translate( -0.1634153, -0.1802025, -0.3265884 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.51795);
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
