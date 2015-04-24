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
-2.709355, 1.110731, -0.8742043, 1, 0, 0, 1,
-2.653746, 1.656012, 0.4601464, 1, 0.007843138, 0, 1,
-2.649369, -1.283689, -1.942332, 1, 0.01176471, 0, 1,
-2.63843, 1.29675, 0.6117181, 1, 0.01960784, 0, 1,
-2.616342, -0.9215894, -0.6836, 1, 0.02352941, 0, 1,
-2.585138, -1.112941, -2.275822, 1, 0.03137255, 0, 1,
-2.488288, -1.844827, -3.977705, 1, 0.03529412, 0, 1,
-2.477959, -1.409676, -2.571587, 1, 0.04313726, 0, 1,
-2.375686, 1.016854, -0.8984836, 1, 0.04705882, 0, 1,
-2.342043, -1.500615, -2.447305, 1, 0.05490196, 0, 1,
-2.305446, -2.516012, -1.446433, 1, 0.05882353, 0, 1,
-2.300497, -2.112977, -2.032259, 1, 0.06666667, 0, 1,
-2.246969, 2.08019, 1.848838, 1, 0.07058824, 0, 1,
-2.237426, 0.2631585, -2.406999, 1, 0.07843138, 0, 1,
-2.221891, 0.5400221, -1.338915, 1, 0.08235294, 0, 1,
-2.21256, -0.62734, -1.752213, 1, 0.09019608, 0, 1,
-2.196028, -0.5721601, -1.101201, 1, 0.09411765, 0, 1,
-2.168509, 0.2068027, -0.3524676, 1, 0.1019608, 0, 1,
-2.118278, 0.4812145, -1.861461, 1, 0.1098039, 0, 1,
-2.104585, 1.428843, -0.6882275, 1, 0.1137255, 0, 1,
-2.096102, 0.5057458, -1.928709, 1, 0.1215686, 0, 1,
-2.090164, 0.9924808, -0.7425156, 1, 0.1254902, 0, 1,
-2.076713, 0.3228586, -2.164413, 1, 0.1333333, 0, 1,
-2.070012, -0.963513, -1.824189, 1, 0.1372549, 0, 1,
-2.068826, -0.8671169, -1.997344, 1, 0.145098, 0, 1,
-2.046489, 3.342416, -1.134911, 1, 0.1490196, 0, 1,
-2.022322, 0.3520821, -0.3012728, 1, 0.1568628, 0, 1,
-2.020023, 0.6052465, -1.878618, 1, 0.1607843, 0, 1,
-2.008218, -1.507327, -0.823801, 1, 0.1686275, 0, 1,
-1.999464, 0.5121103, -0.6371793, 1, 0.172549, 0, 1,
-1.996114, -0.9320564, -3.544847, 1, 0.1803922, 0, 1,
-1.994416, -0.09379081, -2.354485, 1, 0.1843137, 0, 1,
-1.993315, -0.4288224, -3.199709, 1, 0.1921569, 0, 1,
-1.96348, -0.3777962, -0.8670107, 1, 0.1960784, 0, 1,
-1.882027, -0.4309956, -2.834112, 1, 0.2039216, 0, 1,
-1.872963, 1.220972, 0.1977958, 1, 0.2117647, 0, 1,
-1.86556, -0.05990745, 0.187251, 1, 0.2156863, 0, 1,
-1.857915, 0.3942851, -0.9729539, 1, 0.2235294, 0, 1,
-1.845353, -0.7356033, -3.760382, 1, 0.227451, 0, 1,
-1.797481, 0.8905975, -2.473484, 1, 0.2352941, 0, 1,
-1.77388, 0.3176729, -2.231247, 1, 0.2392157, 0, 1,
-1.771275, -0.173713, -1.530877, 1, 0.2470588, 0, 1,
-1.763383, -1.293699, 0.558556, 1, 0.2509804, 0, 1,
-1.762748, 0.01380043, -3.162321, 1, 0.2588235, 0, 1,
-1.744204, -1.950429, -1.579695, 1, 0.2627451, 0, 1,
-1.743224, 1.111773, 0.2488309, 1, 0.2705882, 0, 1,
-1.742995, 1.08122, -1.387744, 1, 0.2745098, 0, 1,
-1.725824, -1.189253, -0.9770327, 1, 0.282353, 0, 1,
-1.72534, -0.4684551, -2.022189, 1, 0.2862745, 0, 1,
-1.710765, 1.07984, -1.906685, 1, 0.2941177, 0, 1,
-1.70113, -1.304179, -3.152329, 1, 0.3019608, 0, 1,
-1.682441, 0.1504622, -2.09627, 1, 0.3058824, 0, 1,
-1.672101, -0.5297266, -1.811076, 1, 0.3137255, 0, 1,
-1.669028, 1.014444, -0.372678, 1, 0.3176471, 0, 1,
-1.668702, 0.8225796, 0.6940433, 1, 0.3254902, 0, 1,
-1.658151, -0.4317693, -1.346782, 1, 0.3294118, 0, 1,
-1.656058, 1.029344, -3.033313, 1, 0.3372549, 0, 1,
-1.633338, 0.07401091, -0.47302, 1, 0.3411765, 0, 1,
-1.63292, -1.071809, -2.525406, 1, 0.3490196, 0, 1,
-1.612785, 0.5023192, 1.308033, 1, 0.3529412, 0, 1,
-1.606764, -0.3236362, 0.622462, 1, 0.3607843, 0, 1,
-1.602199, 2.759114, 0.01964602, 1, 0.3647059, 0, 1,
-1.587965, 0.586433, 0.4927439, 1, 0.372549, 0, 1,
-1.583517, -2.082761, -1.220854, 1, 0.3764706, 0, 1,
-1.573446, 0.6681721, -2.718496, 1, 0.3843137, 0, 1,
-1.572814, -0.5267192, -1.660445, 1, 0.3882353, 0, 1,
-1.571095, -1.650186, -4.013337, 1, 0.3960784, 0, 1,
-1.570454, 0.2394165, -2.22057, 1, 0.4039216, 0, 1,
-1.570388, -0.7050222, -1.529305, 1, 0.4078431, 0, 1,
-1.567774, 0.2110928, -1.100982, 1, 0.4156863, 0, 1,
-1.545245, 0.8170531, -2.712429, 1, 0.4196078, 0, 1,
-1.544196, -0.1215548, -1.595619, 1, 0.427451, 0, 1,
-1.538716, 0.1296836, -1.562802, 1, 0.4313726, 0, 1,
-1.530451, 0.3281142, -0.5656477, 1, 0.4392157, 0, 1,
-1.523779, 0.01124232, -3.396836, 1, 0.4431373, 0, 1,
-1.520667, 1.323459, -1.413357, 1, 0.4509804, 0, 1,
-1.513063, 0.7551759, -0.1665072, 1, 0.454902, 0, 1,
-1.504199, 0.3250908, 0.489069, 1, 0.4627451, 0, 1,
-1.501853, 0.5764344, 0.2312128, 1, 0.4666667, 0, 1,
-1.493661, -0.5892744, -3.533785, 1, 0.4745098, 0, 1,
-1.483942, -1.376163, -3.655025, 1, 0.4784314, 0, 1,
-1.482435, 0.2669758, 0.1200745, 1, 0.4862745, 0, 1,
-1.473016, -0.4369763, -1.874377, 1, 0.4901961, 0, 1,
-1.472407, -0.5609623, -0.8814376, 1, 0.4980392, 0, 1,
-1.464546, -0.3673125, -2.818144, 1, 0.5058824, 0, 1,
-1.456164, 1.467486, 0.09236664, 1, 0.509804, 0, 1,
-1.450959, -0.4252436, -2.661951, 1, 0.5176471, 0, 1,
-1.430208, -0.4426149, -1.6338, 1, 0.5215687, 0, 1,
-1.421812, 0.686247, -4.167454, 1, 0.5294118, 0, 1,
-1.414645, 0.1331943, -2.276621, 1, 0.5333334, 0, 1,
-1.409209, 0.7974265, -1.123137, 1, 0.5411765, 0, 1,
-1.408652, 1.92848, 0.1650865, 1, 0.5450981, 0, 1,
-1.385592, -2.057446, -2.782564, 1, 0.5529412, 0, 1,
-1.382339, -2.34906, -2.331249, 1, 0.5568628, 0, 1,
-1.378863, -1.196015, -2.890959, 1, 0.5647059, 0, 1,
-1.373295, 1.09969, -1.645983, 1, 0.5686275, 0, 1,
-1.36292, -0.01870771, -2.087508, 1, 0.5764706, 0, 1,
-1.358644, -0.5708292, 0.6864797, 1, 0.5803922, 0, 1,
-1.358001, 1.234003, 0.6799803, 1, 0.5882353, 0, 1,
-1.346181, 0.4464286, -2.013594, 1, 0.5921569, 0, 1,
-1.338874, -0.6679442, -3.167846, 1, 0.6, 0, 1,
-1.337607, 0.9646283, -1.411565, 1, 0.6078432, 0, 1,
-1.331233, 1.955185, -0.08264633, 1, 0.6117647, 0, 1,
-1.318688, 0.1888555, -2.404693, 1, 0.6196079, 0, 1,
-1.31177, -0.1871718, -2.37291, 1, 0.6235294, 0, 1,
-1.308581, -0.5608192, -1.330254, 1, 0.6313726, 0, 1,
-1.292307, -0.868161, -1.257891, 1, 0.6352941, 0, 1,
-1.288727, -0.9812593, -1.069845, 1, 0.6431373, 0, 1,
-1.287802, 1.318982, -2.176648, 1, 0.6470588, 0, 1,
-1.284189, -0.09580883, -1.988783, 1, 0.654902, 0, 1,
-1.274293, -0.1124326, -1.174154, 1, 0.6588235, 0, 1,
-1.269879, -1.143215, -2.823358, 1, 0.6666667, 0, 1,
-1.266371, 2.260577, -0.5994186, 1, 0.6705883, 0, 1,
-1.254817, 1.824306, 1.531591, 1, 0.6784314, 0, 1,
-1.250589, -1.183223, -3.26707, 1, 0.682353, 0, 1,
-1.249887, -0.7171872, -2.603475, 1, 0.6901961, 0, 1,
-1.240491, -1.066655, -4.264385, 1, 0.6941177, 0, 1,
-1.233861, -0.6008868, -3.675416, 1, 0.7019608, 0, 1,
-1.229013, 2.465081, -0.6818714, 1, 0.7098039, 0, 1,
-1.225823, 0.9413049, -2.713267, 1, 0.7137255, 0, 1,
-1.214744, -0.6910418, -2.208778, 1, 0.7215686, 0, 1,
-1.205751, -0.6629438, -1.56001, 1, 0.7254902, 0, 1,
-1.203533, -0.08968893, -1.32857, 1, 0.7333333, 0, 1,
-1.19177, 0.1430067, -1.576935, 1, 0.7372549, 0, 1,
-1.185176, 1.0392, -0.5189704, 1, 0.7450981, 0, 1,
-1.172664, 0.3074748, 0.8359742, 1, 0.7490196, 0, 1,
-1.165089, 0.2702468, -1.500614, 1, 0.7568628, 0, 1,
-1.159725, 1.104378, 0.7630334, 1, 0.7607843, 0, 1,
-1.159468, -1.789851, -1.791709, 1, 0.7686275, 0, 1,
-1.150268, 0.6891122, 0.6360948, 1, 0.772549, 0, 1,
-1.147152, 1.357468, -1.505621, 1, 0.7803922, 0, 1,
-1.146925, -0.5398172, -2.985409, 1, 0.7843137, 0, 1,
-1.146666, -0.7113972, -0.7984669, 1, 0.7921569, 0, 1,
-1.145823, 1.294391, -1.343071, 1, 0.7960784, 0, 1,
-1.145285, -0.6701096, -0.4874155, 1, 0.8039216, 0, 1,
-1.136674, 0.8678982, -0.7108462, 1, 0.8117647, 0, 1,
-1.136246, -0.2327889, -0.1511853, 1, 0.8156863, 0, 1,
-1.131112, 0.6486506, -1.022544, 1, 0.8235294, 0, 1,
-1.130284, 1.198706, -0.7844856, 1, 0.827451, 0, 1,
-1.127508, 0.5011952, -1.969594, 1, 0.8352941, 0, 1,
-1.124107, -1.279493, -3.333622, 1, 0.8392157, 0, 1,
-1.102975, -1.282167, -3.73504, 1, 0.8470588, 0, 1,
-1.098241, -0.5577965, -2.358904, 1, 0.8509804, 0, 1,
-1.092284, 0.6829401, -1.401073, 1, 0.8588235, 0, 1,
-1.091587, -1.016488, -2.067444, 1, 0.8627451, 0, 1,
-1.091555, 1.962937, -0.8692848, 1, 0.8705882, 0, 1,
-1.085075, 2.402519, -0.08958573, 1, 0.8745098, 0, 1,
-1.083297, 0.7468332, -0.2561784, 1, 0.8823529, 0, 1,
-1.081102, 0.0143149, 0.1527715, 1, 0.8862745, 0, 1,
-1.079861, 1.010617, -0.2284565, 1, 0.8941177, 0, 1,
-1.074611, 1.422982, 0.116773, 1, 0.8980392, 0, 1,
-1.070099, 0.7971448, 0.3769024, 1, 0.9058824, 0, 1,
-1.067917, 0.03295833, -1.838744, 1, 0.9137255, 0, 1,
-1.062298, 1.025105, -1.401117, 1, 0.9176471, 0, 1,
-1.061356, 0.9686118, 0.07634794, 1, 0.9254902, 0, 1,
-1.045142, -0.7357278, -1.933842, 1, 0.9294118, 0, 1,
-1.030752, -1.504899, -2.074149, 1, 0.9372549, 0, 1,
-1.026156, -1.245469, -2.707461, 1, 0.9411765, 0, 1,
-1.018314, -0.2388337, -1.549837, 1, 0.9490196, 0, 1,
-1.012187, 0.5808351, 0.635527, 1, 0.9529412, 0, 1,
-1.011607, 0.1306163, -0.215121, 1, 0.9607843, 0, 1,
-1.007831, -0.8207102, -0.689504, 1, 0.9647059, 0, 1,
-1.002601, -1.246423, -2.749434, 1, 0.972549, 0, 1,
-1.00035, 1.009666, -0.08924811, 1, 0.9764706, 0, 1,
-0.9997613, -0.9873987, -2.294111, 1, 0.9843137, 0, 1,
-0.9792876, -0.8485544, -1.535876, 1, 0.9882353, 0, 1,
-0.9788733, -0.1233069, -2.556216, 1, 0.9960784, 0, 1,
-0.9779589, 0.9747553, 1.289693, 0.9960784, 1, 0, 1,
-0.9724162, 1.434326, -0.6479058, 0.9921569, 1, 0, 1,
-0.9684646, -0.2287306, -2.054657, 0.9843137, 1, 0, 1,
-0.9572573, 1.670617, -0.8905604, 0.9803922, 1, 0, 1,
-0.9531108, -0.705391, -1.789532, 0.972549, 1, 0, 1,
-0.9526382, -0.713969, -3.273445, 0.9686275, 1, 0, 1,
-0.9496885, -2.110932, -2.743742, 0.9607843, 1, 0, 1,
-0.9453599, 1.196242, -1.184231, 0.9568627, 1, 0, 1,
-0.9434443, -1.912639, -3.081082, 0.9490196, 1, 0, 1,
-0.9388754, -0.03030092, -2.131622, 0.945098, 1, 0, 1,
-0.9239348, 0.105318, -0.2763464, 0.9372549, 1, 0, 1,
-0.9212265, -0.1848541, -0.9869266, 0.9333333, 1, 0, 1,
-0.9201242, 0.6920182, -1.517414, 0.9254902, 1, 0, 1,
-0.9200543, 0.5868208, -0.6026478, 0.9215686, 1, 0, 1,
-0.9159347, 1.359751, 1.010396, 0.9137255, 1, 0, 1,
-0.9134672, 1.851237, -1.592968, 0.9098039, 1, 0, 1,
-0.908258, -1.047087, -1.555556, 0.9019608, 1, 0, 1,
-0.8938471, 0.1475139, -2.725674, 0.8941177, 1, 0, 1,
-0.884801, 0.9426619, -0.7895982, 0.8901961, 1, 0, 1,
-0.8795984, -1.437117, -2.918233, 0.8823529, 1, 0, 1,
-0.871897, -0.8990517, -2.941954, 0.8784314, 1, 0, 1,
-0.8664867, 0.9624377, -0.7731655, 0.8705882, 1, 0, 1,
-0.8664401, 1.030707, 0.2497365, 0.8666667, 1, 0, 1,
-0.8646567, 0.2730266, -1.134941, 0.8588235, 1, 0, 1,
-0.8583515, 0.6398998, -1.932479, 0.854902, 1, 0, 1,
-0.8550348, 0.8708524, -0.5045846, 0.8470588, 1, 0, 1,
-0.8493316, 1.503346, 0.8202528, 0.8431373, 1, 0, 1,
-0.8407378, -0.6223725, -1.519058, 0.8352941, 1, 0, 1,
-0.8391587, 0.2155353, -1.170395, 0.8313726, 1, 0, 1,
-0.8327478, -0.05891576, -1.714272, 0.8235294, 1, 0, 1,
-0.8304535, -1.040937, -3.122881, 0.8196079, 1, 0, 1,
-0.8288393, -1.576482, -1.37704, 0.8117647, 1, 0, 1,
-0.8271521, 0.4711006, -0.9778373, 0.8078431, 1, 0, 1,
-0.8239881, -0.977932, -2.896381, 0.8, 1, 0, 1,
-0.8172126, 0.2593979, -2.228515, 0.7921569, 1, 0, 1,
-0.8162188, -0.2427571, -2.690401, 0.7882353, 1, 0, 1,
-0.816164, 0.9605803, -0.8652416, 0.7803922, 1, 0, 1,
-0.8148755, -0.2967029, -2.678631, 0.7764706, 1, 0, 1,
-0.789437, -1.113967, -1.543325, 0.7686275, 1, 0, 1,
-0.7883488, 0.6635092, -0.1030958, 0.7647059, 1, 0, 1,
-0.7867804, 0.5352955, -1.569163, 0.7568628, 1, 0, 1,
-0.7853804, 0.1320567, -1.280396, 0.7529412, 1, 0, 1,
-0.7611097, -0.1774899, -0.7531425, 0.7450981, 1, 0, 1,
-0.7560219, 0.264934, -1.782165, 0.7411765, 1, 0, 1,
-0.7502931, 0.2696286, -0.8803518, 0.7333333, 1, 0, 1,
-0.7483584, 1.324963, 0.5885344, 0.7294118, 1, 0, 1,
-0.7449136, -0.2350974, -0.8694216, 0.7215686, 1, 0, 1,
-0.7436235, -1.447103, -3.441632, 0.7176471, 1, 0, 1,
-0.7428963, -1.202204, -3.036623, 0.7098039, 1, 0, 1,
-0.742312, 1.893162, 1.903341, 0.7058824, 1, 0, 1,
-0.7399361, 0.9710843, -0.9995056, 0.6980392, 1, 0, 1,
-0.7380512, -0.07540227, -1.795851, 0.6901961, 1, 0, 1,
-0.7355406, -1.385707, -1.450094, 0.6862745, 1, 0, 1,
-0.7323034, -0.002826183, -1.145299, 0.6784314, 1, 0, 1,
-0.7277573, 1.22299, -1.018384, 0.6745098, 1, 0, 1,
-0.7259657, 0.1662899, -1.72211, 0.6666667, 1, 0, 1,
-0.7242718, -0.2243264, -3.377667, 0.6627451, 1, 0, 1,
-0.7242633, 0.4498768, 0.6984397, 0.654902, 1, 0, 1,
-0.7236745, -2.007175, -4.077013, 0.6509804, 1, 0, 1,
-0.7204, 0.229191, -1.38618, 0.6431373, 1, 0, 1,
-0.7203401, -0.02556848, -1.681386, 0.6392157, 1, 0, 1,
-0.7154046, -0.06696641, 0.1740294, 0.6313726, 1, 0, 1,
-0.7124493, 1.265038, -1.168956, 0.627451, 1, 0, 1,
-0.7095118, -1.733815, -0.6740284, 0.6196079, 1, 0, 1,
-0.7085611, 0.2531692, -1.585032, 0.6156863, 1, 0, 1,
-0.706707, 0.2004807, -1.317908, 0.6078432, 1, 0, 1,
-0.7066808, 1.204517, -0.3804772, 0.6039216, 1, 0, 1,
-0.7048804, 0.1419711, -1.768258, 0.5960785, 1, 0, 1,
-0.6999192, 0.169764, -1.431811, 0.5882353, 1, 0, 1,
-0.6974496, 1.073897, -0.04725359, 0.5843138, 1, 0, 1,
-0.6918601, -0.6004766, -0.7542734, 0.5764706, 1, 0, 1,
-0.6861834, -1.177475, -1.972436, 0.572549, 1, 0, 1,
-0.6855466, -0.5417874, -3.001416, 0.5647059, 1, 0, 1,
-0.685182, -2.234663, -3.642348, 0.5607843, 1, 0, 1,
-0.6823443, -0.4114445, -3.261793, 0.5529412, 1, 0, 1,
-0.6777477, 2.30402, -0.9062124, 0.5490196, 1, 0, 1,
-0.6755509, -0.7649955, -4.28318, 0.5411765, 1, 0, 1,
-0.6649979, -1.073279, -0.941939, 0.5372549, 1, 0, 1,
-0.6584184, 0.08600263, -1.940215, 0.5294118, 1, 0, 1,
-0.6581107, 0.09262453, -0.872627, 0.5254902, 1, 0, 1,
-0.6543481, 0.3555828, -1.477371, 0.5176471, 1, 0, 1,
-0.6495004, 0.6352237, 0.5837907, 0.5137255, 1, 0, 1,
-0.6473832, -3.59904, -4.148349, 0.5058824, 1, 0, 1,
-0.644605, -0.9104588, -3.522761, 0.5019608, 1, 0, 1,
-0.6435617, 0.1827736, -1.068395, 0.4941176, 1, 0, 1,
-0.6433737, -1.587279, -2.482409, 0.4862745, 1, 0, 1,
-0.6404698, -0.2920727, -1.446413, 0.4823529, 1, 0, 1,
-0.6375898, 0.6751139, -1.600189, 0.4745098, 1, 0, 1,
-0.6293785, 0.02963225, -3.984957, 0.4705882, 1, 0, 1,
-0.6249424, -0.7130966, -3.470687, 0.4627451, 1, 0, 1,
-0.6229454, -1.066467, -0.9756239, 0.4588235, 1, 0, 1,
-0.6206536, 0.4052231, -0.06091109, 0.4509804, 1, 0, 1,
-0.6196184, -0.4611761, -2.457053, 0.4470588, 1, 0, 1,
-0.6146661, 1.977698, -1.096526, 0.4392157, 1, 0, 1,
-0.6066391, 0.4723645, -0.3544955, 0.4352941, 1, 0, 1,
-0.6058325, -0.9498076, -1.427503, 0.427451, 1, 0, 1,
-0.5984471, 1.16278, -1.372471, 0.4235294, 1, 0, 1,
-0.5968682, 1.277277, 0.2150832, 0.4156863, 1, 0, 1,
-0.584564, -1.63695, -3.356801, 0.4117647, 1, 0, 1,
-0.5820498, -2.847094, -2.873339, 0.4039216, 1, 0, 1,
-0.5815395, -0.1312623, -2.199326, 0.3960784, 1, 0, 1,
-0.5808259, -0.6149982, -2.257739, 0.3921569, 1, 0, 1,
-0.5806644, -0.02596829, -0.9641153, 0.3843137, 1, 0, 1,
-0.5766745, -2.055326, -3.487224, 0.3803922, 1, 0, 1,
-0.5743554, -0.2155651, -2.619656, 0.372549, 1, 0, 1,
-0.5742095, -1.37111, -3.408101, 0.3686275, 1, 0, 1,
-0.5735686, 0.6912009, -2.506401, 0.3607843, 1, 0, 1,
-0.5715492, 0.6722072, 0.4138484, 0.3568628, 1, 0, 1,
-0.5658857, -0.126404, -0.07904895, 0.3490196, 1, 0, 1,
-0.5567301, -0.1456819, -2.274879, 0.345098, 1, 0, 1,
-0.5538787, -0.2049539, -1.558306, 0.3372549, 1, 0, 1,
-0.5517249, 0.8874309, -1.673747, 0.3333333, 1, 0, 1,
-0.5507402, 0.7963461, 0.02755925, 0.3254902, 1, 0, 1,
-0.5495572, 1.102376, -2.430727, 0.3215686, 1, 0, 1,
-0.5454333, -0.281886, -2.033453, 0.3137255, 1, 0, 1,
-0.5418358, -1.361569, -2.798982, 0.3098039, 1, 0, 1,
-0.54069, -0.2399123, -2.337337, 0.3019608, 1, 0, 1,
-0.5362474, -0.3939091, -3.065767, 0.2941177, 1, 0, 1,
-0.5360985, -0.3185694, -2.217228, 0.2901961, 1, 0, 1,
-0.5351012, -2.466039, -2.184304, 0.282353, 1, 0, 1,
-0.534604, -1.006313, -0.9029312, 0.2784314, 1, 0, 1,
-0.5337331, -1.693693, -3.057817, 0.2705882, 1, 0, 1,
-0.5296854, -1.36624, -3.271719, 0.2666667, 1, 0, 1,
-0.5277199, -0.9422691, -1.569108, 0.2588235, 1, 0, 1,
-0.5270002, 0.1776168, -0.2393072, 0.254902, 1, 0, 1,
-0.5234819, 0.7423334, 0.3355469, 0.2470588, 1, 0, 1,
-0.522233, -1.236706, -2.713928, 0.2431373, 1, 0, 1,
-0.5218902, -1.939547, -2.389155, 0.2352941, 1, 0, 1,
-0.517727, 0.7284303, -0.8958562, 0.2313726, 1, 0, 1,
-0.5149383, 0.9794941, 0.5538837, 0.2235294, 1, 0, 1,
-0.5148407, 0.5787517, -0.4637124, 0.2196078, 1, 0, 1,
-0.5089853, 0.194428, -2.611129, 0.2117647, 1, 0, 1,
-0.506364, 0.4288291, -0.5776585, 0.2078431, 1, 0, 1,
-0.5063249, -0.8068887, -2.838726, 0.2, 1, 0, 1,
-0.5026982, -1.034304, -2.14996, 0.1921569, 1, 0, 1,
-0.4992656, -1.249108, -3.257548, 0.1882353, 1, 0, 1,
-0.4985237, 2.496207, -0.7394969, 0.1803922, 1, 0, 1,
-0.4942946, -0.3581429, -2.244439, 0.1764706, 1, 0, 1,
-0.4924685, -0.2710499, -1.324438, 0.1686275, 1, 0, 1,
-0.4871397, -1.64267, -3.171561, 0.1647059, 1, 0, 1,
-0.4835342, 1.980444, -0.3211136, 0.1568628, 1, 0, 1,
-0.4816598, 0.62848, -0.3932796, 0.1529412, 1, 0, 1,
-0.4805842, 1.154377, -2.225066, 0.145098, 1, 0, 1,
-0.476723, -0.03739592, -1.615986, 0.1411765, 1, 0, 1,
-0.4760149, 1.464989, 0.2150721, 0.1333333, 1, 0, 1,
-0.4755478, -1.183878, -3.131592, 0.1294118, 1, 0, 1,
-0.4726978, -0.1095433, -2.669115, 0.1215686, 1, 0, 1,
-0.4717799, -0.618372, -3.908036, 0.1176471, 1, 0, 1,
-0.4706438, -0.3600036, -1.091175, 0.1098039, 1, 0, 1,
-0.468105, 0.2076707, 0.4236164, 0.1058824, 1, 0, 1,
-0.4672473, 1.815539, -0.8188981, 0.09803922, 1, 0, 1,
-0.4667627, 0.6907701, 0.3828173, 0.09019608, 1, 0, 1,
-0.4652622, -0.8650756, -2.952375, 0.08627451, 1, 0, 1,
-0.4639775, -1.490306, -4.019479, 0.07843138, 1, 0, 1,
-0.4635405, -0.6089658, -3.18972, 0.07450981, 1, 0, 1,
-0.4609272, -0.8558291, -2.925061, 0.06666667, 1, 0, 1,
-0.4583954, -2.540185, -4.837395, 0.0627451, 1, 0, 1,
-0.4566002, -0.1049241, -1.590274, 0.05490196, 1, 0, 1,
-0.447497, 1.788559, -0.4446602, 0.05098039, 1, 0, 1,
-0.4456076, 1.399644, -0.6836004, 0.04313726, 1, 0, 1,
-0.4394645, 0.6218082, 1.798377, 0.03921569, 1, 0, 1,
-0.4391355, -0.9663999, -3.219254, 0.03137255, 1, 0, 1,
-0.4378642, -1.23657, -3.005421, 0.02745098, 1, 0, 1,
-0.4337271, -1.610144, -1.978949, 0.01960784, 1, 0, 1,
-0.4322911, -0.6380712, -1.014054, 0.01568628, 1, 0, 1,
-0.4297488, 1.509745, 0.6786652, 0.007843138, 1, 0, 1,
-0.4290566, -0.2094447, -3.109226, 0.003921569, 1, 0, 1,
-0.4278485, -0.2989831, -0.9378229, 0, 1, 0.003921569, 1,
-0.4164466, 0.6431871, 0.2341919, 0, 1, 0.01176471, 1,
-0.4159324, -0.2407146, -2.502398, 0, 1, 0.01568628, 1,
-0.415811, 0.2039638, -3.715056, 0, 1, 0.02352941, 1,
-0.4103287, -0.2703402, -2.638145, 0, 1, 0.02745098, 1,
-0.4099052, 1.966191, -0.3497579, 0, 1, 0.03529412, 1,
-0.402492, -1.734338, -2.814217, 0, 1, 0.03921569, 1,
-0.4014649, -0.4218637, 0.09065932, 0, 1, 0.04705882, 1,
-0.4003741, -2.027831, -3.406587, 0, 1, 0.05098039, 1,
-0.4003606, -0.07087515, -2.10218, 0, 1, 0.05882353, 1,
-0.3998115, -0.9229348, -4.345416, 0, 1, 0.0627451, 1,
-0.3988101, -0.2364744, -2.312402, 0, 1, 0.07058824, 1,
-0.3963857, -0.5634769, -1.903085, 0, 1, 0.07450981, 1,
-0.3941633, 0.04585664, -1.39612, 0, 1, 0.08235294, 1,
-0.3920608, 0.01585415, -1.521812, 0, 1, 0.08627451, 1,
-0.3879046, -0.8728022, -3.146116, 0, 1, 0.09411765, 1,
-0.3867811, -1.025203, -2.148136, 0, 1, 0.1019608, 1,
-0.3850677, -0.8792525, -3.582676, 0, 1, 0.1058824, 1,
-0.3668476, -1.12425, -2.025717, 0, 1, 0.1137255, 1,
-0.3664638, -0.8838144, -2.270514, 0, 1, 0.1176471, 1,
-0.3660636, 2.068197, 0.1997531, 0, 1, 0.1254902, 1,
-0.3625598, 2.406742, 2.483527, 0, 1, 0.1294118, 1,
-0.3606037, -0.9261922, -1.435935, 0, 1, 0.1372549, 1,
-0.3568764, -0.4205648, -4.164317, 0, 1, 0.1411765, 1,
-0.3511113, 2.024484, -0.1844218, 0, 1, 0.1490196, 1,
-0.3448273, -1.298467, -2.583911, 0, 1, 0.1529412, 1,
-0.3410965, -1.260868, -1.719075, 0, 1, 0.1607843, 1,
-0.3380583, -0.4811364, -2.354648, 0, 1, 0.1647059, 1,
-0.3308566, 0.2434514, -1.827364, 0, 1, 0.172549, 1,
-0.3259354, -0.5339559, -3.248312, 0, 1, 0.1764706, 1,
-0.324178, -0.6269836, -2.041053, 0, 1, 0.1843137, 1,
-0.3204986, 0.8271719, -1.213224, 0, 1, 0.1882353, 1,
-0.3191461, 0.8313778, 0.2127862, 0, 1, 0.1960784, 1,
-0.3158796, 0.2819755, -3.050004, 0, 1, 0.2039216, 1,
-0.3092077, 0.883643, -2.11113, 0, 1, 0.2078431, 1,
-0.3086226, 0.4142784, -1.050193, 0, 1, 0.2156863, 1,
-0.3047476, -0.4584616, -1.803936, 0, 1, 0.2196078, 1,
-0.3031713, 0.6250223, -1.917042, 0, 1, 0.227451, 1,
-0.3014966, -0.6993161, -1.985451, 0, 1, 0.2313726, 1,
-0.2868206, -1.016554, -3.525114, 0, 1, 0.2392157, 1,
-0.2860777, 1.122589, 0.07643665, 0, 1, 0.2431373, 1,
-0.2849997, -0.4580627, -3.474385, 0, 1, 0.2509804, 1,
-0.2809488, -0.6933726, -3.038111, 0, 1, 0.254902, 1,
-0.2750981, 0.8432549, 0.7794372, 0, 1, 0.2627451, 1,
-0.2700107, 0.629802, -1.792696, 0, 1, 0.2666667, 1,
-0.2604745, -1.368697, -2.934864, 0, 1, 0.2745098, 1,
-0.2594092, -0.3760079, -3.652028, 0, 1, 0.2784314, 1,
-0.2574488, 0.78256, -0.3997049, 0, 1, 0.2862745, 1,
-0.2555546, 1.472753, 0.5941035, 0, 1, 0.2901961, 1,
-0.2501288, 0.3553162, -2.11091, 0, 1, 0.2980392, 1,
-0.2480897, -1.440551, -1.273865, 0, 1, 0.3058824, 1,
-0.2470343, 0.3505427, -0.07226974, 0, 1, 0.3098039, 1,
-0.2445419, 1.44525, -0.9685966, 0, 1, 0.3176471, 1,
-0.2401668, -1.144753, -1.687759, 0, 1, 0.3215686, 1,
-0.2398707, 0.8417682, 0.5086187, 0, 1, 0.3294118, 1,
-0.2365705, -0.5058414, -2.616706, 0, 1, 0.3333333, 1,
-0.2351978, -0.3609766, -3.362648, 0, 1, 0.3411765, 1,
-0.2294498, -0.34245, -2.297502, 0, 1, 0.345098, 1,
-0.2279436, 0.6815897, 1.614193, 0, 1, 0.3529412, 1,
-0.2272493, 0.5926583, 0.6479945, 0, 1, 0.3568628, 1,
-0.2235627, 0.002697976, 1.385235, 0, 1, 0.3647059, 1,
-0.2216983, 0.2187784, -0.5530823, 0, 1, 0.3686275, 1,
-0.2208103, 1.745829, -0.6043766, 0, 1, 0.3764706, 1,
-0.2188732, 0.8164222, -0.670612, 0, 1, 0.3803922, 1,
-0.2175021, 0.8482196, -0.09909049, 0, 1, 0.3882353, 1,
-0.2151493, -0.3710767, -2.140512, 0, 1, 0.3921569, 1,
-0.2150039, -0.1663749, -2.370842, 0, 1, 0.4, 1,
-0.2141524, 0.2676257, -1.035597, 0, 1, 0.4078431, 1,
-0.2119901, -0.780267, -2.744817, 0, 1, 0.4117647, 1,
-0.2065357, 0.8571681, 0.5372303, 0, 1, 0.4196078, 1,
-0.1996333, -0.3085097, -1.329454, 0, 1, 0.4235294, 1,
-0.1965902, -0.1836481, -2.021312, 0, 1, 0.4313726, 1,
-0.192735, -1.759201, -3.031625, 0, 1, 0.4352941, 1,
-0.1927064, 0.95609, 1.428365, 0, 1, 0.4431373, 1,
-0.1921834, 1.082872, 0.6518705, 0, 1, 0.4470588, 1,
-0.191714, 0.5525594, -0.4699475, 0, 1, 0.454902, 1,
-0.1891878, -0.7735471, -2.100311, 0, 1, 0.4588235, 1,
-0.188968, 0.8484878, -1.072198, 0, 1, 0.4666667, 1,
-0.1834912, -0.488629, -2.570681, 0, 1, 0.4705882, 1,
-0.1771387, 0.3113925, -1.444482, 0, 1, 0.4784314, 1,
-0.175319, 0.2276318, 1.460761, 0, 1, 0.4823529, 1,
-0.1726344, 0.9908344, -0.09172463, 0, 1, 0.4901961, 1,
-0.1692583, -0.7509819, -3.915095, 0, 1, 0.4941176, 1,
-0.1688718, 1.425133, 0.260222, 0, 1, 0.5019608, 1,
-0.1678348, -0.1690103, -2.295392, 0, 1, 0.509804, 1,
-0.16356, 1.453446, 0.2045677, 0, 1, 0.5137255, 1,
-0.1612674, 0.4340146, -0.3274622, 0, 1, 0.5215687, 1,
-0.1568744, -0.3867929, -2.627248, 0, 1, 0.5254902, 1,
-0.1504258, -0.7183052, -2.770685, 0, 1, 0.5333334, 1,
-0.1460513, 1.087691, -0.6941571, 0, 1, 0.5372549, 1,
-0.1456937, 0.2764534, 0.9164144, 0, 1, 0.5450981, 1,
-0.1400831, 0.03904669, -0.9740788, 0, 1, 0.5490196, 1,
-0.1391852, 1.078029, -1.21186, 0, 1, 0.5568628, 1,
-0.1288582, 1.110535, 0.9285539, 0, 1, 0.5607843, 1,
-0.1217872, -1.415245, -1.912613, 0, 1, 0.5686275, 1,
-0.1202782, -0.3460696, -2.855644, 0, 1, 0.572549, 1,
-0.1196753, -1.284525, -1.278747, 0, 1, 0.5803922, 1,
-0.1184539, -1.383497, -2.550326, 0, 1, 0.5843138, 1,
-0.115978, 2.276453, -0.5170951, 0, 1, 0.5921569, 1,
-0.1061447, -0.7531225, -2.8177, 0, 1, 0.5960785, 1,
-0.105645, 0.6272659, 0.3473987, 0, 1, 0.6039216, 1,
-0.1033614, 2.053251, -1.640673, 0, 1, 0.6117647, 1,
-0.09972374, -1.678141, -3.047554, 0, 1, 0.6156863, 1,
-0.09542929, 1.941742, -0.6666943, 0, 1, 0.6235294, 1,
-0.09273598, -2.478569, -0.3701324, 0, 1, 0.627451, 1,
-0.09053235, 1.011062, 0.2238698, 0, 1, 0.6352941, 1,
-0.08631483, -0.4017034, -2.61761, 0, 1, 0.6392157, 1,
-0.08518354, -0.004641817, -1.705381, 0, 1, 0.6470588, 1,
-0.08158078, -0.5528732, -2.445584, 0, 1, 0.6509804, 1,
-0.08010486, -0.5615745, -4.783692, 0, 1, 0.6588235, 1,
-0.07559225, 0.1938976, -1.897139, 0, 1, 0.6627451, 1,
-0.07386414, 0.1143548, -0.6581026, 0, 1, 0.6705883, 1,
-0.07366042, 0.3550681, -1.8215, 0, 1, 0.6745098, 1,
-0.07360541, -0.8906708, -4.203731, 0, 1, 0.682353, 1,
-0.07171056, -1.150248, -3.149798, 0, 1, 0.6862745, 1,
-0.07038007, -0.1874308, -1.715944, 0, 1, 0.6941177, 1,
-0.06979688, 0.03246259, -1.768278, 0, 1, 0.7019608, 1,
-0.06817212, 1.373776, 1.501549, 0, 1, 0.7058824, 1,
-0.06776063, 0.4449265, 0.07740671, 0, 1, 0.7137255, 1,
-0.06715627, 0.452799, -1.01607, 0, 1, 0.7176471, 1,
-0.06515975, -1.407388, -3.67731, 0, 1, 0.7254902, 1,
-0.06360883, -0.1610063, -2.966202, 0, 1, 0.7294118, 1,
-0.06085522, -0.9712557, -3.799726, 0, 1, 0.7372549, 1,
-0.05895928, 0.6880007, -0.424082, 0, 1, 0.7411765, 1,
-0.0564913, 0.6377527, 0.9127771, 0, 1, 0.7490196, 1,
-0.0535505, -0.5329875, -3.459157, 0, 1, 0.7529412, 1,
-0.05209663, 0.1324932, 0.1968398, 0, 1, 0.7607843, 1,
-0.04646559, 1.021103, -0.7305996, 0, 1, 0.7647059, 1,
-0.04464709, -0.1458851, -2.351169, 0, 1, 0.772549, 1,
-0.04337529, 0.1168023, -0.2420523, 0, 1, 0.7764706, 1,
-0.03990458, -1.31656, -3.012972, 0, 1, 0.7843137, 1,
-0.0357245, -0.9428853, -4.507655, 0, 1, 0.7882353, 1,
-0.0303601, 0.8493217, -0.5878969, 0, 1, 0.7960784, 1,
-0.02783194, 1.05052, -0.8078863, 0, 1, 0.8039216, 1,
-0.01891593, 0.405317, -0.3555626, 0, 1, 0.8078431, 1,
-0.01818859, -1.594912, -4.453527, 0, 1, 0.8156863, 1,
-0.01795778, 0.3731683, 0.2453333, 0, 1, 0.8196079, 1,
-0.0178507, -0.02346631, 0.4612378, 0, 1, 0.827451, 1,
-0.01657505, 1.460709, -0.5147941, 0, 1, 0.8313726, 1,
-0.01511057, -0.3809011, -3.586696, 0, 1, 0.8392157, 1,
-0.01329041, -0.6382154, -4.827591, 0, 1, 0.8431373, 1,
-0.0129981, -0.3460478, -2.898876, 0, 1, 0.8509804, 1,
-0.01212094, 0.2998489, 0.6369522, 0, 1, 0.854902, 1,
-0.01148752, 0.8750236, -0.5339828, 0, 1, 0.8627451, 1,
-0.01039949, -0.4931135, -0.763222, 0, 1, 0.8666667, 1,
-0.01034976, 1.058664, 0.009227844, 0, 1, 0.8745098, 1,
-0.01005053, 0.9621099, -0.2413678, 0, 1, 0.8784314, 1,
-0.009819257, 1.736805, 1.881176, 0, 1, 0.8862745, 1,
9.098044e-05, -0.8009087, 1.899966, 0, 1, 0.8901961, 1,
0.0004403957, -0.1870261, 2.774183, 0, 1, 0.8980392, 1,
0.002958637, -1.354936, 3.999477, 0, 1, 0.9058824, 1,
0.004869564, -0.668685, 3.88112, 0, 1, 0.9098039, 1,
0.007809713, 0.4276294, 0.3100104, 0, 1, 0.9176471, 1,
0.01631483, 0.6753523, -1.176778, 0, 1, 0.9215686, 1,
0.01634702, -0.2093559, 3.41924, 0, 1, 0.9294118, 1,
0.01933405, -1.353343, 2.555614, 0, 1, 0.9333333, 1,
0.02079473, 1.395099, 1.620077, 0, 1, 0.9411765, 1,
0.02351402, -0.6559176, 2.658329, 0, 1, 0.945098, 1,
0.02726399, 0.814079, 0.8597574, 0, 1, 0.9529412, 1,
0.02727779, -0.5051026, 2.685435, 0, 1, 0.9568627, 1,
0.02729103, 0.1903077, 1.262577, 0, 1, 0.9647059, 1,
0.02968372, -0.3460508, 4.066128, 0, 1, 0.9686275, 1,
0.03166852, -0.9247177, 2.781232, 0, 1, 0.9764706, 1,
0.03401323, 0.466832, 0.9436445, 0, 1, 0.9803922, 1,
0.03703329, -0.7221946, 5.12029, 0, 1, 0.9882353, 1,
0.03705422, -0.5764481, 4.783695, 0, 1, 0.9921569, 1,
0.04283913, -1.760789, 2.212837, 0, 1, 1, 1,
0.04948596, -1.375527, 2.085185, 0, 0.9921569, 1, 1,
0.05012245, -0.1834951, 3.001479, 0, 0.9882353, 1, 1,
0.05104874, 0.03279695, 3.926963, 0, 0.9803922, 1, 1,
0.05149752, -0.8061177, 2.863472, 0, 0.9764706, 1, 1,
0.05792172, -0.7518128, 3.441263, 0, 0.9686275, 1, 1,
0.06140279, -0.6108446, 2.503119, 0, 0.9647059, 1, 1,
0.06282806, 1.169098, -0.2193383, 0, 0.9568627, 1, 1,
0.06663884, -1.446205, 2.759096, 0, 0.9529412, 1, 1,
0.06859834, -1.179651, 3.590332, 0, 0.945098, 1, 1,
0.07340989, -0.7388321, 2.37764, 0, 0.9411765, 1, 1,
0.07548194, 0.6694087, -1.713304, 0, 0.9333333, 1, 1,
0.07668582, 1.412174, -0.5158219, 0, 0.9294118, 1, 1,
0.08442391, 1.868815, -1.148836, 0, 0.9215686, 1, 1,
0.08965424, -1.095689, 2.864753, 0, 0.9176471, 1, 1,
0.09001596, 0.1353257, 0.08618812, 0, 0.9098039, 1, 1,
0.09011593, 1.097486, 0.632655, 0, 0.9058824, 1, 1,
0.09107656, -0.5875956, 4.071043, 0, 0.8980392, 1, 1,
0.09136801, -0.2071598, 4.441087, 0, 0.8901961, 1, 1,
0.09242022, 0.6148799, -0.3948325, 0, 0.8862745, 1, 1,
0.09680849, 0.1268749, 1.554969, 0, 0.8784314, 1, 1,
0.09714096, -0.7942703, 3.510174, 0, 0.8745098, 1, 1,
0.1026649, -1.273625, 4.446487, 0, 0.8666667, 1, 1,
0.1026659, 0.5659492, 0.4150292, 0, 0.8627451, 1, 1,
0.1030398, 0.3626951, -0.1635102, 0, 0.854902, 1, 1,
0.1142693, 1.473941, -1.578797, 0, 0.8509804, 1, 1,
0.1151122, 0.9576218, 0.4610622, 0, 0.8431373, 1, 1,
0.1214489, 1.434221, 1.371902, 0, 0.8392157, 1, 1,
0.1255134, -1.799502, 3.985013, 0, 0.8313726, 1, 1,
0.1298096, 1.437544, -0.3803698, 0, 0.827451, 1, 1,
0.1302299, 0.8029532, 0.0331353, 0, 0.8196079, 1, 1,
0.1349354, 0.06562486, 2.27609, 0, 0.8156863, 1, 1,
0.1379732, 0.1300935, 0.9191372, 0, 0.8078431, 1, 1,
0.1383934, -0.2354096, 1.075609, 0, 0.8039216, 1, 1,
0.1392197, -0.7842794, 3.174306, 0, 0.7960784, 1, 1,
0.1404492, 1.78306, 0.7164642, 0, 0.7882353, 1, 1,
0.1425551, -1.299356, 2.076292, 0, 0.7843137, 1, 1,
0.1445093, -0.3589798, 2.144123, 0, 0.7764706, 1, 1,
0.1456163, 1.636032, 0.6666024, 0, 0.772549, 1, 1,
0.1461662, 0.824139, 0.7433799, 0, 0.7647059, 1, 1,
0.1519915, -1.014017, 2.895247, 0, 0.7607843, 1, 1,
0.1536609, 1.120203, 0.3651803, 0, 0.7529412, 1, 1,
0.1555146, 2.020031, -2.393185, 0, 0.7490196, 1, 1,
0.1568836, 0.3935046, 0.8079208, 0, 0.7411765, 1, 1,
0.1571891, -0.1440758, 1.702471, 0, 0.7372549, 1, 1,
0.1596307, -0.1484347, 1.465155, 0, 0.7294118, 1, 1,
0.1604256, 0.1985343, 3.223811, 0, 0.7254902, 1, 1,
0.1623829, 0.4606843, -0.5865929, 0, 0.7176471, 1, 1,
0.1658077, -1.814544, 1.01454, 0, 0.7137255, 1, 1,
0.1689637, 0.5193198, 0.08299249, 0, 0.7058824, 1, 1,
0.1695085, 1.119276, 0.7082516, 0, 0.6980392, 1, 1,
0.1720394, 0.7531783, -0.7425562, 0, 0.6941177, 1, 1,
0.172723, -1.814778, 1.591784, 0, 0.6862745, 1, 1,
0.176309, -0.06437875, 1.64584, 0, 0.682353, 1, 1,
0.1808549, 0.05869603, 1.052608, 0, 0.6745098, 1, 1,
0.1820488, 0.4935661, 0.2317131, 0, 0.6705883, 1, 1,
0.1862254, 1.30021, 2.610349, 0, 0.6627451, 1, 1,
0.1869108, 2.679414, -0.6577927, 0, 0.6588235, 1, 1,
0.1897228, 0.7612685, 0.6237142, 0, 0.6509804, 1, 1,
0.194706, 0.2977239, 0.5834915, 0, 0.6470588, 1, 1,
0.1960989, 0.5312992, 1.208109, 0, 0.6392157, 1, 1,
0.1969331, -1.320494, 3.163732, 0, 0.6352941, 1, 1,
0.1977167, 0.07448519, -0.8098618, 0, 0.627451, 1, 1,
0.2034435, 0.888848, 0.1709549, 0, 0.6235294, 1, 1,
0.206424, 0.2219843, 0.5321056, 0, 0.6156863, 1, 1,
0.2076533, 0.6870466, 1.398353, 0, 0.6117647, 1, 1,
0.2095789, 1.659225, -0.09343824, 0, 0.6039216, 1, 1,
0.2096667, 0.5312465, 0.4250802, 0, 0.5960785, 1, 1,
0.2116366, 1.672107, 0.3608524, 0, 0.5921569, 1, 1,
0.2128053, -0.4091308, 2.491386, 0, 0.5843138, 1, 1,
0.2128254, -0.791888, 1.63476, 0, 0.5803922, 1, 1,
0.2137706, 2.029513, -0.6731742, 0, 0.572549, 1, 1,
0.2239771, 0.9618837, 0.3388043, 0, 0.5686275, 1, 1,
0.2268965, 0.5369783, 0.3773801, 0, 0.5607843, 1, 1,
0.2297233, 1.177667, 1.252695, 0, 0.5568628, 1, 1,
0.2301201, -0.2394685, 3.087036, 0, 0.5490196, 1, 1,
0.2310755, 1.041024, -0.1829581, 0, 0.5450981, 1, 1,
0.2314399, -0.8213921, 2.835907, 0, 0.5372549, 1, 1,
0.2345675, -1.380658, 2.844367, 0, 0.5333334, 1, 1,
0.2365236, -0.543061, 3.662586, 0, 0.5254902, 1, 1,
0.2389917, -1.158377, 1.704928, 0, 0.5215687, 1, 1,
0.2396703, 0.06708642, 2.601155, 0, 0.5137255, 1, 1,
0.2424366, -0.07304389, 2.043415, 0, 0.509804, 1, 1,
0.242786, 0.5281918, -0.6873535, 0, 0.5019608, 1, 1,
0.2433064, 0.4881206, -1.2916, 0, 0.4941176, 1, 1,
0.2451015, 1.224072, 2.01501, 0, 0.4901961, 1, 1,
0.2451239, 2.615358, -1.380767, 0, 0.4823529, 1, 1,
0.246254, -0.5613609, 2.339923, 0, 0.4784314, 1, 1,
0.2467564, -0.223609, 2.180726, 0, 0.4705882, 1, 1,
0.2473743, 0.7675343, -0.2780961, 0, 0.4666667, 1, 1,
0.2523179, -0.3899503, 3.488856, 0, 0.4588235, 1, 1,
0.2537242, 0.5878944, -1.100321, 0, 0.454902, 1, 1,
0.2548241, 0.4038556, 1.203837, 0, 0.4470588, 1, 1,
0.2567124, 0.8486112, -1.428184, 0, 0.4431373, 1, 1,
0.2575266, -0.4929443, 3.278933, 0, 0.4352941, 1, 1,
0.263395, -1.05012, 1.488856, 0, 0.4313726, 1, 1,
0.2664057, -0.2685272, 2.469364, 0, 0.4235294, 1, 1,
0.2688854, 0.8328634, -0.3607664, 0, 0.4196078, 1, 1,
0.2717414, 0.195826, 2.400654, 0, 0.4117647, 1, 1,
0.2725113, 1.497157, -0.4151314, 0, 0.4078431, 1, 1,
0.2779531, -1.462164, 3.741845, 0, 0.4, 1, 1,
0.2793033, -1.584567, 2.481902, 0, 0.3921569, 1, 1,
0.2881235, -0.2996617, 3.254275, 0, 0.3882353, 1, 1,
0.2897711, -1.060607, 3.813485, 0, 0.3803922, 1, 1,
0.2910762, 0.6088986, -0.04202194, 0, 0.3764706, 1, 1,
0.2911641, -0.3260642, 0.7971834, 0, 0.3686275, 1, 1,
0.2939288, -1.127047, 4.917335, 0, 0.3647059, 1, 1,
0.2947097, 1.007278, 1.445582, 0, 0.3568628, 1, 1,
0.2985086, 1.663272, 2.133564, 0, 0.3529412, 1, 1,
0.2994798, 0.4156316, 0.2861083, 0, 0.345098, 1, 1,
0.2995916, 0.6573693, 0.5369633, 0, 0.3411765, 1, 1,
0.2999722, -1.004611, 1.249514, 0, 0.3333333, 1, 1,
0.3013448, -0.1899388, 2.153672, 0, 0.3294118, 1, 1,
0.3075845, 1.824719, -0.9205089, 0, 0.3215686, 1, 1,
0.3133748, -0.724283, 3.55797, 0, 0.3176471, 1, 1,
0.314585, 1.340185, 0.1032525, 0, 0.3098039, 1, 1,
0.3151446, 1.842083, 0.1148148, 0, 0.3058824, 1, 1,
0.3209146, -0.7631981, 2.572893, 0, 0.2980392, 1, 1,
0.3249891, -0.07972749, 1.634179, 0, 0.2901961, 1, 1,
0.3263342, 0.442438, 1.612002, 0, 0.2862745, 1, 1,
0.3347956, 0.9543252, -1.829892, 0, 0.2784314, 1, 1,
0.3367033, -0.5767367, 2.838926, 0, 0.2745098, 1, 1,
0.3393098, 1.336112, 0.6064209, 0, 0.2666667, 1, 1,
0.3402255, -0.703016, 1.775337, 0, 0.2627451, 1, 1,
0.3412263, -0.3731552, 2.229253, 0, 0.254902, 1, 1,
0.3451911, 0.8643755, 0.1902626, 0, 0.2509804, 1, 1,
0.3478605, -1.034812, 2.856685, 0, 0.2431373, 1, 1,
0.3485146, 0.368684, 1.753785, 0, 0.2392157, 1, 1,
0.3493474, 1.651641, 2.226394, 0, 0.2313726, 1, 1,
0.3510325, -1.467403, 4.017789, 0, 0.227451, 1, 1,
0.3514092, -1.188612, 2.09829, 0, 0.2196078, 1, 1,
0.3534662, -0.08388432, 1.932347, 0, 0.2156863, 1, 1,
0.3535634, -0.4650753, 2.720403, 0, 0.2078431, 1, 1,
0.3667204, 1.067176, -0.2764432, 0, 0.2039216, 1, 1,
0.3671516, -1.58633, 2.989757, 0, 0.1960784, 1, 1,
0.3704088, -0.4607347, 2.236984, 0, 0.1882353, 1, 1,
0.3724743, -0.1529416, 1.942523, 0, 0.1843137, 1, 1,
0.3737156, 0.9521778, 1.143559, 0, 0.1764706, 1, 1,
0.3756117, 1.0396, -0.1537611, 0, 0.172549, 1, 1,
0.3830367, -1.602286, 2.829125, 0, 0.1647059, 1, 1,
0.3856191, -0.2655772, 3.357465, 0, 0.1607843, 1, 1,
0.3860506, -2.305552, 2.765827, 0, 0.1529412, 1, 1,
0.3924076, 0.8582175, 0.1397236, 0, 0.1490196, 1, 1,
0.3943721, -1.333769, 3.742488, 0, 0.1411765, 1, 1,
0.3949685, -0.6075888, 3.267991, 0, 0.1372549, 1, 1,
0.4042568, -0.2465442, 2.64328, 0, 0.1294118, 1, 1,
0.4066109, -0.00173841, 0.7195969, 0, 0.1254902, 1, 1,
0.4081905, 1.023135, 1.857755, 0, 0.1176471, 1, 1,
0.4098783, -1.300112, 5.241776, 0, 0.1137255, 1, 1,
0.413436, -1.739002, 2.369326, 0, 0.1058824, 1, 1,
0.4161273, -0.7386562, 2.686488, 0, 0.09803922, 1, 1,
0.416131, -0.8924447, 0.8690862, 0, 0.09411765, 1, 1,
0.4301003, -0.1263272, 1.454788, 0, 0.08627451, 1, 1,
0.4328519, -0.1054056, 1.079869, 0, 0.08235294, 1, 1,
0.4350355, -0.9083971, 2.763619, 0, 0.07450981, 1, 1,
0.4350365, 0.3457362, 1.456841, 0, 0.07058824, 1, 1,
0.4355042, 0.5419614, -1.001925, 0, 0.0627451, 1, 1,
0.4366214, -0.9843929, 1.995114, 0, 0.05882353, 1, 1,
0.4412766, -0.5465177, 1.805684, 0, 0.05098039, 1, 1,
0.4435982, -0.7117763, 3.136942, 0, 0.04705882, 1, 1,
0.4445778, -0.7118659, 3.06706, 0, 0.03921569, 1, 1,
0.4488888, 1.846268, 0.08278238, 0, 0.03529412, 1, 1,
0.4506591, 0.6917698, 0.6964755, 0, 0.02745098, 1, 1,
0.4570082, -0.07757575, 0.7205162, 0, 0.02352941, 1, 1,
0.4576711, -0.4242133, 1.509591, 0, 0.01568628, 1, 1,
0.4592931, -0.3208006, 1.554385, 0, 0.01176471, 1, 1,
0.4604749, 0.4730071, 1.602366, 0, 0.003921569, 1, 1,
0.4607667, 0.6881101, -0.6395969, 0.003921569, 0, 1, 1,
0.4651145, 1.93976, -1.740387, 0.007843138, 0, 1, 1,
0.4653807, 0.6410739, -0.08415163, 0.01568628, 0, 1, 1,
0.4672147, 0.118222, 2.685816, 0.01960784, 0, 1, 1,
0.4701066, -0.228833, 1.726624, 0.02745098, 0, 1, 1,
0.4723849, 1.221566, 1.483434, 0.03137255, 0, 1, 1,
0.4759611, -0.1921242, 1.310955, 0.03921569, 0, 1, 1,
0.4786129, 2.441913, 0.8189439, 0.04313726, 0, 1, 1,
0.4788383, -0.3332432, 0.3516239, 0.05098039, 0, 1, 1,
0.4817415, -0.2062095, 1.462973, 0.05490196, 0, 1, 1,
0.4833545, 1.228698, 0.8924198, 0.0627451, 0, 1, 1,
0.4870301, 0.55558, -0.6566889, 0.06666667, 0, 1, 1,
0.4878545, 1.15344, 1.670855, 0.07450981, 0, 1, 1,
0.4960519, 0.2403943, 1.097251, 0.07843138, 0, 1, 1,
0.4986039, -0.04748623, 2.384148, 0.08627451, 0, 1, 1,
0.5068116, 0.05643205, 0.9039946, 0.09019608, 0, 1, 1,
0.5073164, 2.132348, 0.6821834, 0.09803922, 0, 1, 1,
0.5229544, -0.2572877, 1.389869, 0.1058824, 0, 1, 1,
0.5303291, -0.3726158, 1.895396, 0.1098039, 0, 1, 1,
0.5362324, -1.784782, 3.653607, 0.1176471, 0, 1, 1,
0.5371747, -2.396752, 3.685482, 0.1215686, 0, 1, 1,
0.5404423, 0.608967, -1.544166, 0.1294118, 0, 1, 1,
0.5412638, 0.07778095, 1.839282, 0.1333333, 0, 1, 1,
0.5428461, -1.579061, 2.875266, 0.1411765, 0, 1, 1,
0.5454991, 0.9512913, -0.6006748, 0.145098, 0, 1, 1,
0.5480711, 1.291255, 1.707309, 0.1529412, 0, 1, 1,
0.5497674, -0.6005452, 4.236028, 0.1568628, 0, 1, 1,
0.5511903, -1.592817, 1.475372, 0.1647059, 0, 1, 1,
0.5587921, 2.504028, 0.6940181, 0.1686275, 0, 1, 1,
0.5589514, 0.1559013, 0.5624881, 0.1764706, 0, 1, 1,
0.5626414, -1.963155, 3.310685, 0.1803922, 0, 1, 1,
0.562796, 0.1753161, 1.236508, 0.1882353, 0, 1, 1,
0.5631364, 0.09490004, 1.652943, 0.1921569, 0, 1, 1,
0.5631593, 0.7187355, 1.937522, 0.2, 0, 1, 1,
0.5638434, -0.6605694, 1.838117, 0.2078431, 0, 1, 1,
0.5678473, -0.09882231, 1.54933, 0.2117647, 0, 1, 1,
0.5737187, -0.58529, 2.684132, 0.2196078, 0, 1, 1,
0.5740213, -0.7496988, 3.551245, 0.2235294, 0, 1, 1,
0.5749938, -0.887383, 1.87144, 0.2313726, 0, 1, 1,
0.5779141, -0.3249261, 1.692959, 0.2352941, 0, 1, 1,
0.582256, 0.5075874, -0.3058036, 0.2431373, 0, 1, 1,
0.5861114, 1.683274, 0.7659071, 0.2470588, 0, 1, 1,
0.5916812, 0.4044494, 0.9507117, 0.254902, 0, 1, 1,
0.592498, -0.04374553, 2.804088, 0.2588235, 0, 1, 1,
0.5948058, 1.078232, 2.11143, 0.2666667, 0, 1, 1,
0.5984286, -1.082208, 3.083749, 0.2705882, 0, 1, 1,
0.5991681, 0.7515323, 2.161008, 0.2784314, 0, 1, 1,
0.5991929, -1.704006, 3.996708, 0.282353, 0, 1, 1,
0.5992718, 0.5474168, 2.902591, 0.2901961, 0, 1, 1,
0.5999289, -0.4432885, 1.234035, 0.2941177, 0, 1, 1,
0.6063182, -1.679385, 3.136757, 0.3019608, 0, 1, 1,
0.6126312, -1.735768, 3.38649, 0.3098039, 0, 1, 1,
0.6146415, 0.6316952, -0.2395574, 0.3137255, 0, 1, 1,
0.6152796, 0.5186776, -0.1365494, 0.3215686, 0, 1, 1,
0.6189862, 0.1809411, -1.04412, 0.3254902, 0, 1, 1,
0.6204394, 1.578888, -0.1241073, 0.3333333, 0, 1, 1,
0.6280262, -0.6868994, 3.714032, 0.3372549, 0, 1, 1,
0.6367602, -0.857551, 4.39251, 0.345098, 0, 1, 1,
0.637067, -0.08551287, 1.985781, 0.3490196, 0, 1, 1,
0.6411341, -1.79256, 3.354652, 0.3568628, 0, 1, 1,
0.64159, -0.6448511, 1.890632, 0.3607843, 0, 1, 1,
0.6435112, -0.3154779, 3.675359, 0.3686275, 0, 1, 1,
0.6448574, 1.771918, 1.116746, 0.372549, 0, 1, 1,
0.6458285, -0.7000357, 1.721564, 0.3803922, 0, 1, 1,
0.6468516, 1.132491, 0.8124391, 0.3843137, 0, 1, 1,
0.6480049, -0.1923531, 1.03221, 0.3921569, 0, 1, 1,
0.6516728, 0.2815659, -1.263773, 0.3960784, 0, 1, 1,
0.6527675, 0.6995939, -0.8442032, 0.4039216, 0, 1, 1,
0.6596544, -0.6049092, 1.604152, 0.4117647, 0, 1, 1,
0.6601602, -0.3796145, 3.164001, 0.4156863, 0, 1, 1,
0.6601938, 0.7224429, 2.113506, 0.4235294, 0, 1, 1,
0.6632451, -0.5011165, -0.05681393, 0.427451, 0, 1, 1,
0.6635093, 1.365799, 0.7858509, 0.4352941, 0, 1, 1,
0.6739641, -1.16543, 4.095822, 0.4392157, 0, 1, 1,
0.6740084, 0.9860301, -0.4723684, 0.4470588, 0, 1, 1,
0.6819229, -0.3556588, 2.431118, 0.4509804, 0, 1, 1,
0.6844702, -0.5397314, 2.740865, 0.4588235, 0, 1, 1,
0.6885519, -0.2713026, 2.157998, 0.4627451, 0, 1, 1,
0.6894233, 1.07361, 0.8184125, 0.4705882, 0, 1, 1,
0.6916842, -0.3389478, 0.7821034, 0.4745098, 0, 1, 1,
0.7042869, -0.6354634, 3.597704, 0.4823529, 0, 1, 1,
0.7065212, 0.0820398, 2.009658, 0.4862745, 0, 1, 1,
0.7084056, -0.4853612, 1.031438, 0.4941176, 0, 1, 1,
0.7090552, 0.7848336, 2.168597, 0.5019608, 0, 1, 1,
0.709441, 0.5514871, -0.5502145, 0.5058824, 0, 1, 1,
0.7098008, -0.9251027, 1.846252, 0.5137255, 0, 1, 1,
0.7098647, 1.061522, 0.5269216, 0.5176471, 0, 1, 1,
0.7171385, -0.3970818, 0.6061735, 0.5254902, 0, 1, 1,
0.7181556, 0.9792482, -0.1724014, 0.5294118, 0, 1, 1,
0.7195542, -1.415412, 4.786808, 0.5372549, 0, 1, 1,
0.7213007, -1.170531, 4.260974, 0.5411765, 0, 1, 1,
0.726433, -3.11338, 2.052742, 0.5490196, 0, 1, 1,
0.7340536, -0.3767674, 1.095771, 0.5529412, 0, 1, 1,
0.7390749, -0.7454675, 2.9612, 0.5607843, 0, 1, 1,
0.7394511, -0.9896584, 2.21836, 0.5647059, 0, 1, 1,
0.7426844, -2.2501, 2.559978, 0.572549, 0, 1, 1,
0.7477964, 1.501019, 0.8370056, 0.5764706, 0, 1, 1,
0.7488018, -0.1335554, 2.699052, 0.5843138, 0, 1, 1,
0.759378, -0.2730645, 2.771189, 0.5882353, 0, 1, 1,
0.7749377, -0.2254117, 3.622844, 0.5960785, 0, 1, 1,
0.7762657, -0.2006792, -0.4224882, 0.6039216, 0, 1, 1,
0.7777214, 1.07232, 1.069257, 0.6078432, 0, 1, 1,
0.7798841, -1.392095, 0.813711, 0.6156863, 0, 1, 1,
0.7799103, -0.8440366, 2.843334, 0.6196079, 0, 1, 1,
0.7814294, -1.044205, 2.499707, 0.627451, 0, 1, 1,
0.7820778, 0.04187674, 3.041522, 0.6313726, 0, 1, 1,
0.7848149, 0.7195025, 1.745494, 0.6392157, 0, 1, 1,
0.785517, 0.6477273, 0.3757229, 0.6431373, 0, 1, 1,
0.7855363, 1.442163, 0.05795547, 0.6509804, 0, 1, 1,
0.7958817, 0.5457669, -0.1877349, 0.654902, 0, 1, 1,
0.799468, 2.101882, 0.3835056, 0.6627451, 0, 1, 1,
0.7995733, -0.5705916, 3.509749, 0.6666667, 0, 1, 1,
0.8037158, -0.5642725, 2.111118, 0.6745098, 0, 1, 1,
0.8051694, -0.9179598, 2.047106, 0.6784314, 0, 1, 1,
0.8162609, -0.02983972, 0.5419731, 0.6862745, 0, 1, 1,
0.816872, 0.1833626, 1.585265, 0.6901961, 0, 1, 1,
0.8191406, 1.056143, 1.521543, 0.6980392, 0, 1, 1,
0.8263625, -1.849583, 3.372706, 0.7058824, 0, 1, 1,
0.8348888, 1.591418, -0.2013362, 0.7098039, 0, 1, 1,
0.8403639, -0.2886651, 2.491087, 0.7176471, 0, 1, 1,
0.8429478, 0.65881, 1.604095, 0.7215686, 0, 1, 1,
0.8463337, -0.2374353, 2.927623, 0.7294118, 0, 1, 1,
0.8516219, -0.001702779, 0.8503006, 0.7333333, 0, 1, 1,
0.858845, -0.326158, 2.560544, 0.7411765, 0, 1, 1,
0.8604622, -0.155837, 1.72278, 0.7450981, 0, 1, 1,
0.8649121, -0.2390717, 0.5420884, 0.7529412, 0, 1, 1,
0.8738309, -0.1225801, 0.8349028, 0.7568628, 0, 1, 1,
0.8746181, 1.339596, -0.4360163, 0.7647059, 0, 1, 1,
0.8765313, 0.08240179, 3.0138, 0.7686275, 0, 1, 1,
0.8780943, -2.288359, 1.0517, 0.7764706, 0, 1, 1,
0.8835286, 0.2941551, 1.146619, 0.7803922, 0, 1, 1,
0.886964, 0.368345, 1.457501, 0.7882353, 0, 1, 1,
0.8873264, -1.158643, 1.434432, 0.7921569, 0, 1, 1,
0.8879512, -2.472919, 1.466543, 0.8, 0, 1, 1,
0.8918905, -1.583194, 2.425006, 0.8078431, 0, 1, 1,
0.8941094, -1.692682, 2.535865, 0.8117647, 0, 1, 1,
0.903217, 0.7714357, 0.0977205, 0.8196079, 0, 1, 1,
0.9034771, 0.2719508, 1.506691, 0.8235294, 0, 1, 1,
0.9120547, -0.4577648, 2.144514, 0.8313726, 0, 1, 1,
0.9139701, -1.588795, 1.550986, 0.8352941, 0, 1, 1,
0.9228281, 0.5082324, 0.9731238, 0.8431373, 0, 1, 1,
0.9239843, -1.561093, 3.316586, 0.8470588, 0, 1, 1,
0.9312803, 1.635599, -0.7703174, 0.854902, 0, 1, 1,
0.9370391, 1.203996, 1.864648, 0.8588235, 0, 1, 1,
0.9410492, -0.2874985, 2.294705, 0.8666667, 0, 1, 1,
0.9475926, -0.02439521, 1.582868, 0.8705882, 0, 1, 1,
0.9498412, -2.126586, 4.002472, 0.8784314, 0, 1, 1,
0.953204, 0.8384508, 1.558892, 0.8823529, 0, 1, 1,
0.9570199, -0.7438135, 2.900896, 0.8901961, 0, 1, 1,
0.9714032, -0.7310492, 3.855084, 0.8941177, 0, 1, 1,
0.9726326, 0.699062, 0.259973, 0.9019608, 0, 1, 1,
0.9751377, -1.151836, 2.319621, 0.9098039, 0, 1, 1,
0.9777769, 0.9631379, -0.6249841, 0.9137255, 0, 1, 1,
0.9830739, 0.3343061, 0.7824473, 0.9215686, 0, 1, 1,
0.9843735, 0.5799885, 0.2085899, 0.9254902, 0, 1, 1,
0.9845599, -2.140027, 1.533384, 0.9333333, 0, 1, 1,
0.9970386, -0.3403501, 2.356265, 0.9372549, 0, 1, 1,
0.9977332, -0.6976557, 1.484791, 0.945098, 0, 1, 1,
0.9984018, -0.05798542, 1.641947, 0.9490196, 0, 1, 1,
1.003628, -1.665279, 4.340358, 0.9568627, 0, 1, 1,
1.003882, 0.2562583, 1.961798, 0.9607843, 0, 1, 1,
1.006423, 0.9812402, 2.069593, 0.9686275, 0, 1, 1,
1.006645, -1.707353, 2.393348, 0.972549, 0, 1, 1,
1.007378, -0.6106962, 2.338995, 0.9803922, 0, 1, 1,
1.007587, -1.531392, 2.703633, 0.9843137, 0, 1, 1,
1.01398, 0.114879, 2.477724, 0.9921569, 0, 1, 1,
1.014467, 0.6490805, 1.960137, 0.9960784, 0, 1, 1,
1.016638, -0.2002836, 1.703078, 1, 0, 0.9960784, 1,
1.026528, 1.148848, 1.018994, 1, 0, 0.9882353, 1,
1.029774, -1.197721, 4.636657, 1, 0, 0.9843137, 1,
1.039806, 0.1739347, 0.7052727, 1, 0, 0.9764706, 1,
1.040947, 0.5799703, 1.146622, 1, 0, 0.972549, 1,
1.041547, -0.6297922, 1.853771, 1, 0, 0.9647059, 1,
1.045473, 1.868036, -0.655036, 1, 0, 0.9607843, 1,
1.046516, 1.006009, -0.2776234, 1, 0, 0.9529412, 1,
1.046595, 1.548631, 0.3635903, 1, 0, 0.9490196, 1,
1.046764, 0.7263901, 0.6468812, 1, 0, 0.9411765, 1,
1.04688, 0.302622, 0.9376857, 1, 0, 0.9372549, 1,
1.052807, 0.1403703, -0.3935823, 1, 0, 0.9294118, 1,
1.052946, -1.638076, 2.954312, 1, 0, 0.9254902, 1,
1.059426, 0.84087, 1.311394, 1, 0, 0.9176471, 1,
1.059511, -0.8285769, 2.204059, 1, 0, 0.9137255, 1,
1.066334, -1.955177, 2.172604, 1, 0, 0.9058824, 1,
1.067422, -1.25295, 4.05262, 1, 0, 0.9019608, 1,
1.06753, -0.4828977, 2.00826, 1, 0, 0.8941177, 1,
1.067689, 1.340711, 1.397419, 1, 0, 0.8862745, 1,
1.080584, 0.4156217, 1.362087, 1, 0, 0.8823529, 1,
1.080648, -0.06309425, 0.3274762, 1, 0, 0.8745098, 1,
1.084019, -1.72478, 2.924997, 1, 0, 0.8705882, 1,
1.084037, 0.137114, 0.5470084, 1, 0, 0.8627451, 1,
1.086551, -0.4023904, 0.7643855, 1, 0, 0.8588235, 1,
1.097133, 1.05874, 0.9018397, 1, 0, 0.8509804, 1,
1.098489, -0.5125682, 1.281474, 1, 0, 0.8470588, 1,
1.107118, -0.912744, 1.828883, 1, 0, 0.8392157, 1,
1.110756, 1.545931, 0.2431857, 1, 0, 0.8352941, 1,
1.118014, 0.1650131, 2.850292, 1, 0, 0.827451, 1,
1.121039, -2.208898, 4.70151, 1, 0, 0.8235294, 1,
1.125337, -2.076848, 2.825242, 1, 0, 0.8156863, 1,
1.126582, -0.6983695, 2.686562, 1, 0, 0.8117647, 1,
1.128561, -2.078019, 3.771287, 1, 0, 0.8039216, 1,
1.143808, -0.7012674, 3.96398, 1, 0, 0.7960784, 1,
1.144742, 1.249744, 1.462083, 1, 0, 0.7921569, 1,
1.146942, 0.07769096, 3.168904, 1, 0, 0.7843137, 1,
1.148085, -0.140887, 1.548624, 1, 0, 0.7803922, 1,
1.154733, 0.04707422, 1.55797, 1, 0, 0.772549, 1,
1.165416, 1.466451, -1.343752, 1, 0, 0.7686275, 1,
1.179656, -0.08392853, 2.608378, 1, 0, 0.7607843, 1,
1.182499, 2.180898, -0.515995, 1, 0, 0.7568628, 1,
1.186783, 0.5617878, 2.533932, 1, 0, 0.7490196, 1,
1.194259, -1.02568, 1.393682, 1, 0, 0.7450981, 1,
1.196068, 0.4464618, 2.076204, 1, 0, 0.7372549, 1,
1.204865, 0.8103268, 0.8059651, 1, 0, 0.7333333, 1,
1.206795, 1.115788, 1.300456, 1, 0, 0.7254902, 1,
1.220992, 0.9351851, 0.3013751, 1, 0, 0.7215686, 1,
1.223446, 0.4162737, 1.867105, 1, 0, 0.7137255, 1,
1.225577, -0.1145296, 2.682332, 1, 0, 0.7098039, 1,
1.231437, -0.02055632, 0.827027, 1, 0, 0.7019608, 1,
1.233209, -0.8638061, 2.807689, 1, 0, 0.6941177, 1,
1.238085, 0.032999, 0.8053578, 1, 0, 0.6901961, 1,
1.248248, -0.7015819, 2.527701, 1, 0, 0.682353, 1,
1.249106, -1.232326, 3.383498, 1, 0, 0.6784314, 1,
1.261238, 0.2282251, 1.216918, 1, 0, 0.6705883, 1,
1.274281, 0.4350464, -0.5425464, 1, 0, 0.6666667, 1,
1.28248, -1.492598, 2.213739, 1, 0, 0.6588235, 1,
1.282812, -0.4223817, 1.790582, 1, 0, 0.654902, 1,
1.283629, -0.3658244, 2.096652, 1, 0, 0.6470588, 1,
1.287151, 0.2787346, 1.183757, 1, 0, 0.6431373, 1,
1.287269, 0.2441562, 2.611197, 1, 0, 0.6352941, 1,
1.289532, 0.6568918, 2.134329, 1, 0, 0.6313726, 1,
1.294698, 1.33668, 0.4616524, 1, 0, 0.6235294, 1,
1.296321, 0.102617, 2.939864, 1, 0, 0.6196079, 1,
1.296886, -0.1462352, 0.7739001, 1, 0, 0.6117647, 1,
1.299032, -0.394715, 2.419144, 1, 0, 0.6078432, 1,
1.300447, -2.565826, 1.912938, 1, 0, 0.6, 1,
1.308921, 0.4481422, 0.6457045, 1, 0, 0.5921569, 1,
1.311991, 0.230933, 0.852569, 1, 0, 0.5882353, 1,
1.32383, 0.7454255, -0.5074432, 1, 0, 0.5803922, 1,
1.32556, -1.043076, 1.391065, 1, 0, 0.5764706, 1,
1.326645, -0.374348, 3.396791, 1, 0, 0.5686275, 1,
1.33484, -0.4020861, 1.657001, 1, 0, 0.5647059, 1,
1.342293, 0.3604306, 0.7657725, 1, 0, 0.5568628, 1,
1.35969, -0.3922506, 1.873605, 1, 0, 0.5529412, 1,
1.365424, 1.032006, 1.791447, 1, 0, 0.5450981, 1,
1.368117, -0.5849032, 2.650596, 1, 0, 0.5411765, 1,
1.369394, -0.3974522, 4.183167, 1, 0, 0.5333334, 1,
1.384784, -1.504866, 3.110063, 1, 0, 0.5294118, 1,
1.385254, -0.7554224, 0.3690166, 1, 0, 0.5215687, 1,
1.388621, 1.399012, 1.761435, 1, 0, 0.5176471, 1,
1.396818, 0.2422611, 2.132688, 1, 0, 0.509804, 1,
1.397441, 1.133193, 2.527098, 1, 0, 0.5058824, 1,
1.402512, -0.569947, 3.258079, 1, 0, 0.4980392, 1,
1.412149, -0.07144313, 2.563584, 1, 0, 0.4901961, 1,
1.412625, -1.327081, 2.294797, 1, 0, 0.4862745, 1,
1.416978, -1.373885, 1.429236, 1, 0, 0.4784314, 1,
1.433879, -1.844454, 2.13241, 1, 0, 0.4745098, 1,
1.43441, 0.5268832, 0.885927, 1, 0, 0.4666667, 1,
1.437415, 0.1227669, 0.5066991, 1, 0, 0.4627451, 1,
1.442172, 1.319668, 2.860255, 1, 0, 0.454902, 1,
1.446493, -1.460453, 1.656278, 1, 0, 0.4509804, 1,
1.450736, -0.6858426, 1.627572, 1, 0, 0.4431373, 1,
1.454936, 0.3057067, 0.6234859, 1, 0, 0.4392157, 1,
1.455108, 1.198774, 0.8773796, 1, 0, 0.4313726, 1,
1.458818, 0.4675671, 1.121423, 1, 0, 0.427451, 1,
1.490336, 0.3619022, 2.383212, 1, 0, 0.4196078, 1,
1.495151, 0.3263791, -0.3431987, 1, 0, 0.4156863, 1,
1.500023, -0.1618221, 1.450577, 1, 0, 0.4078431, 1,
1.512058, 0.6905034, 0.5384606, 1, 0, 0.4039216, 1,
1.528775, 1.036692, -0.08715384, 1, 0, 0.3960784, 1,
1.564404, 0.2902459, 0.4714985, 1, 0, 0.3882353, 1,
1.571476, -2.469918, 0.4124078, 1, 0, 0.3843137, 1,
1.576789, 1.770512, 1.517761, 1, 0, 0.3764706, 1,
1.589347, 0.3768702, 2.127678, 1, 0, 0.372549, 1,
1.621546, 1.590321, -0.4552338, 1, 0, 0.3647059, 1,
1.622783, -0.5668178, 1.741767, 1, 0, 0.3607843, 1,
1.628386, -2.244884, 2.729455, 1, 0, 0.3529412, 1,
1.632499, -0.3669318, 2.305247, 1, 0, 0.3490196, 1,
1.653973, -1.423779, 5.118649, 1, 0, 0.3411765, 1,
1.658927, -0.1257296, 0.8253464, 1, 0, 0.3372549, 1,
1.669683, -0.05349585, 2.669015, 1, 0, 0.3294118, 1,
1.680283, 0.6391369, -0.1711137, 1, 0, 0.3254902, 1,
1.696043, 0.345078, 2.195144, 1, 0, 0.3176471, 1,
1.704531, 0.007210721, 1.158696, 1, 0, 0.3137255, 1,
1.705777, 1.132832, 0.09497855, 1, 0, 0.3058824, 1,
1.732427, -0.4928725, 1.842312, 1, 0, 0.2980392, 1,
1.734048, 0.843641, 2.461893, 1, 0, 0.2941177, 1,
1.735308, -1.209419, 1.638626, 1, 0, 0.2862745, 1,
1.75413, 0.508647, 0.9908438, 1, 0, 0.282353, 1,
1.755189, -0.03465039, 0.1451021, 1, 0, 0.2745098, 1,
1.755251, -0.6384822, -0.7813738, 1, 0, 0.2705882, 1,
1.760769, 0.3501365, 1.015276, 1, 0, 0.2627451, 1,
1.764402, 1.364099, 2.372042, 1, 0, 0.2588235, 1,
1.766701, 1.642099, 0.3239682, 1, 0, 0.2509804, 1,
1.774815, -0.1343094, 1.768323, 1, 0, 0.2470588, 1,
1.779447, -0.1045929, 2.343832, 1, 0, 0.2392157, 1,
1.78242, 0.6820168, 0.9096091, 1, 0, 0.2352941, 1,
1.78265, 0.9818269, 1.952834, 1, 0, 0.227451, 1,
1.783032, -0.3692411, 0.5477785, 1, 0, 0.2235294, 1,
1.784854, -1.366807, 3.152706, 1, 0, 0.2156863, 1,
1.78672, 0.4439972, 1.609842, 1, 0, 0.2117647, 1,
1.796575, -0.2070813, 1.942989, 1, 0, 0.2039216, 1,
1.828498, -1.20057, -0.7416939, 1, 0, 0.1960784, 1,
1.835868, -2.77871, 1.997056, 1, 0, 0.1921569, 1,
1.840651, -0.5850897, 2.392658, 1, 0, 0.1843137, 1,
1.870194, -0.5367608, 3.282403, 1, 0, 0.1803922, 1,
1.878019, -1.37769, 2.16736, 1, 0, 0.172549, 1,
1.884294, -1.52876, 3.715161, 1, 0, 0.1686275, 1,
1.89002, -0.8873699, 2.714483, 1, 0, 0.1607843, 1,
1.891562, -0.9627923, 2.848886, 1, 0, 0.1568628, 1,
1.90983, 0.2997826, 1.813228, 1, 0, 0.1490196, 1,
1.963082, 0.6235118, 2.868011, 1, 0, 0.145098, 1,
1.9737, 0.4746868, 1.493007, 1, 0, 0.1372549, 1,
2.01785, -0.6271145, 2.86834, 1, 0, 0.1333333, 1,
2.035518, 1.525637, 0.1120008, 1, 0, 0.1254902, 1,
2.042348, -0.03192877, 2.862823, 1, 0, 0.1215686, 1,
2.058536, 1.706235, 1.537329, 1, 0, 0.1137255, 1,
2.071762, -0.3873741, 1.873734, 1, 0, 0.1098039, 1,
2.101969, 1.054596, 0.8690766, 1, 0, 0.1019608, 1,
2.101987, 0.6810546, -0.214911, 1, 0, 0.09411765, 1,
2.112468, 0.6177695, 0.5025766, 1, 0, 0.09019608, 1,
2.187041, 1.455755, 1.859311, 1, 0, 0.08235294, 1,
2.207254, 0.4854827, 1.532422, 1, 0, 0.07843138, 1,
2.214042, 0.03889291, 1.698869, 1, 0, 0.07058824, 1,
2.216605, -2.294877, 3.962314, 1, 0, 0.06666667, 1,
2.366803, -0.6397663, 1.883785, 1, 0, 0.05882353, 1,
2.367536, -1.064262, 0.7722376, 1, 0, 0.05490196, 1,
2.385838, 0.05421865, 0.8553941, 1, 0, 0.04705882, 1,
2.40365, 1.12086, 0.6939347, 1, 0, 0.04313726, 1,
2.460932, 0.04286629, 2.009008, 1, 0, 0.03529412, 1,
2.479987, -1.067202, 0.8486487, 1, 0, 0.03137255, 1,
2.764516, -1.54624, 0.9944737, 1, 0, 0.02352941, 1,
2.848851, 1.025558, 1.333238, 1, 0, 0.01960784, 1,
3.113539, -0.8826091, 1.878761, 1, 0, 0.01176471, 1,
3.26579, -0.06203137, 0.8614497, 1, 0, 0.007843138, 1
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
0.2782177, -4.775617, -6.545814, 0, -0.5, 0.5, 0.5,
0.2782177, -4.775617, -6.545814, 1, -0.5, 0.5, 0.5,
0.2782177, -4.775617, -6.545814, 1, 1.5, 0.5, 0.5,
0.2782177, -4.775617, -6.545814, 0, 1.5, 0.5, 0.5
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
-3.722142, -0.128312, -6.545814, 0, -0.5, 0.5, 0.5,
-3.722142, -0.128312, -6.545814, 1, -0.5, 0.5, 0.5,
-3.722142, -0.128312, -6.545814, 1, 1.5, 0.5, 0.5,
-3.722142, -0.128312, -6.545814, 0, 1.5, 0.5, 0.5
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
-3.722142, -4.775617, 0.2021906, 0, -0.5, 0.5, 0.5,
-3.722142, -4.775617, 0.2021906, 1, -0.5, 0.5, 0.5,
-3.722142, -4.775617, 0.2021906, 1, 1.5, 0.5, 0.5,
-3.722142, -4.775617, 0.2021906, 0, 1.5, 0.5, 0.5
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
-2, -3.703162, -4.988582,
3, -3.703162, -4.988582,
-2, -3.703162, -4.988582,
-2, -3.881904, -5.248121,
-1, -3.703162, -4.988582,
-1, -3.881904, -5.248121,
0, -3.703162, -4.988582,
0, -3.881904, -5.248121,
1, -3.703162, -4.988582,
1, -3.881904, -5.248121,
2, -3.703162, -4.988582,
2, -3.881904, -5.248121,
3, -3.703162, -4.988582,
3, -3.881904, -5.248121
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
-2, -4.239389, -5.767198, 0, -0.5, 0.5, 0.5,
-2, -4.239389, -5.767198, 1, -0.5, 0.5, 0.5,
-2, -4.239389, -5.767198, 1, 1.5, 0.5, 0.5,
-2, -4.239389, -5.767198, 0, 1.5, 0.5, 0.5,
-1, -4.239389, -5.767198, 0, -0.5, 0.5, 0.5,
-1, -4.239389, -5.767198, 1, -0.5, 0.5, 0.5,
-1, -4.239389, -5.767198, 1, 1.5, 0.5, 0.5,
-1, -4.239389, -5.767198, 0, 1.5, 0.5, 0.5,
0, -4.239389, -5.767198, 0, -0.5, 0.5, 0.5,
0, -4.239389, -5.767198, 1, -0.5, 0.5, 0.5,
0, -4.239389, -5.767198, 1, 1.5, 0.5, 0.5,
0, -4.239389, -5.767198, 0, 1.5, 0.5, 0.5,
1, -4.239389, -5.767198, 0, -0.5, 0.5, 0.5,
1, -4.239389, -5.767198, 1, -0.5, 0.5, 0.5,
1, -4.239389, -5.767198, 1, 1.5, 0.5, 0.5,
1, -4.239389, -5.767198, 0, 1.5, 0.5, 0.5,
2, -4.239389, -5.767198, 0, -0.5, 0.5, 0.5,
2, -4.239389, -5.767198, 1, -0.5, 0.5, 0.5,
2, -4.239389, -5.767198, 1, 1.5, 0.5, 0.5,
2, -4.239389, -5.767198, 0, 1.5, 0.5, 0.5,
3, -4.239389, -5.767198, 0, -0.5, 0.5, 0.5,
3, -4.239389, -5.767198, 1, -0.5, 0.5, 0.5,
3, -4.239389, -5.767198, 1, 1.5, 0.5, 0.5,
3, -4.239389, -5.767198, 0, 1.5, 0.5, 0.5
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
-2.798982, -3, -4.988582,
-2.798982, 3, -4.988582,
-2.798982, -3, -4.988582,
-2.952842, -3, -5.248121,
-2.798982, -2, -4.988582,
-2.952842, -2, -5.248121,
-2.798982, -1, -4.988582,
-2.952842, -1, -5.248121,
-2.798982, 0, -4.988582,
-2.952842, 0, -5.248121,
-2.798982, 1, -4.988582,
-2.952842, 1, -5.248121,
-2.798982, 2, -4.988582,
-2.952842, 2, -5.248121,
-2.798982, 3, -4.988582,
-2.952842, 3, -5.248121
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
-3.260562, -3, -5.767198, 0, -0.5, 0.5, 0.5,
-3.260562, -3, -5.767198, 1, -0.5, 0.5, 0.5,
-3.260562, -3, -5.767198, 1, 1.5, 0.5, 0.5,
-3.260562, -3, -5.767198, 0, 1.5, 0.5, 0.5,
-3.260562, -2, -5.767198, 0, -0.5, 0.5, 0.5,
-3.260562, -2, -5.767198, 1, -0.5, 0.5, 0.5,
-3.260562, -2, -5.767198, 1, 1.5, 0.5, 0.5,
-3.260562, -2, -5.767198, 0, 1.5, 0.5, 0.5,
-3.260562, -1, -5.767198, 0, -0.5, 0.5, 0.5,
-3.260562, -1, -5.767198, 1, -0.5, 0.5, 0.5,
-3.260562, -1, -5.767198, 1, 1.5, 0.5, 0.5,
-3.260562, -1, -5.767198, 0, 1.5, 0.5, 0.5,
-3.260562, 0, -5.767198, 0, -0.5, 0.5, 0.5,
-3.260562, 0, -5.767198, 1, -0.5, 0.5, 0.5,
-3.260562, 0, -5.767198, 1, 1.5, 0.5, 0.5,
-3.260562, 0, -5.767198, 0, 1.5, 0.5, 0.5,
-3.260562, 1, -5.767198, 0, -0.5, 0.5, 0.5,
-3.260562, 1, -5.767198, 1, -0.5, 0.5, 0.5,
-3.260562, 1, -5.767198, 1, 1.5, 0.5, 0.5,
-3.260562, 1, -5.767198, 0, 1.5, 0.5, 0.5,
-3.260562, 2, -5.767198, 0, -0.5, 0.5, 0.5,
-3.260562, 2, -5.767198, 1, -0.5, 0.5, 0.5,
-3.260562, 2, -5.767198, 1, 1.5, 0.5, 0.5,
-3.260562, 2, -5.767198, 0, 1.5, 0.5, 0.5,
-3.260562, 3, -5.767198, 0, -0.5, 0.5, 0.5,
-3.260562, 3, -5.767198, 1, -0.5, 0.5, 0.5,
-3.260562, 3, -5.767198, 1, 1.5, 0.5, 0.5,
-3.260562, 3, -5.767198, 0, 1.5, 0.5, 0.5
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
-2.798982, -3.703162, -4,
-2.798982, -3.703162, 4,
-2.798982, -3.703162, -4,
-2.952842, -3.881904, -4,
-2.798982, -3.703162, -2,
-2.952842, -3.881904, -2,
-2.798982, -3.703162, 0,
-2.952842, -3.881904, 0,
-2.798982, -3.703162, 2,
-2.952842, -3.881904, 2,
-2.798982, -3.703162, 4,
-2.952842, -3.881904, 4
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
-3.260562, -4.239389, -4, 0, -0.5, 0.5, 0.5,
-3.260562, -4.239389, -4, 1, -0.5, 0.5, 0.5,
-3.260562, -4.239389, -4, 1, 1.5, 0.5, 0.5,
-3.260562, -4.239389, -4, 0, 1.5, 0.5, 0.5,
-3.260562, -4.239389, -2, 0, -0.5, 0.5, 0.5,
-3.260562, -4.239389, -2, 1, -0.5, 0.5, 0.5,
-3.260562, -4.239389, -2, 1, 1.5, 0.5, 0.5,
-3.260562, -4.239389, -2, 0, 1.5, 0.5, 0.5,
-3.260562, -4.239389, 0, 0, -0.5, 0.5, 0.5,
-3.260562, -4.239389, 0, 1, -0.5, 0.5, 0.5,
-3.260562, -4.239389, 0, 1, 1.5, 0.5, 0.5,
-3.260562, -4.239389, 0, 0, 1.5, 0.5, 0.5,
-3.260562, -4.239389, 2, 0, -0.5, 0.5, 0.5,
-3.260562, -4.239389, 2, 1, -0.5, 0.5, 0.5,
-3.260562, -4.239389, 2, 1, 1.5, 0.5, 0.5,
-3.260562, -4.239389, 2, 0, 1.5, 0.5, 0.5,
-3.260562, -4.239389, 4, 0, -0.5, 0.5, 0.5,
-3.260562, -4.239389, 4, 1, -0.5, 0.5, 0.5,
-3.260562, -4.239389, 4, 1, 1.5, 0.5, 0.5,
-3.260562, -4.239389, 4, 0, 1.5, 0.5, 0.5
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
-2.798982, -3.703162, -4.988582,
-2.798982, 3.446538, -4.988582,
-2.798982, -3.703162, 5.392963,
-2.798982, 3.446538, 5.392963,
-2.798982, -3.703162, -4.988582,
-2.798982, -3.703162, 5.392963,
-2.798982, 3.446538, -4.988582,
-2.798982, 3.446538, 5.392963,
-2.798982, -3.703162, -4.988582,
3.355417, -3.703162, -4.988582,
-2.798982, -3.703162, 5.392963,
3.355417, -3.703162, 5.392963,
-2.798982, 3.446538, -4.988582,
3.355417, 3.446538, -4.988582,
-2.798982, 3.446538, 5.392963,
3.355417, 3.446538, 5.392963,
3.355417, -3.703162, -4.988582,
3.355417, 3.446538, -4.988582,
3.355417, -3.703162, 5.392963,
3.355417, 3.446538, 5.392963,
3.355417, -3.703162, -4.988582,
3.355417, -3.703162, 5.392963,
3.355417, 3.446538, -4.988582,
3.355417, 3.446538, 5.392963
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
var radius = 7.490423;
var distance = 33.32574;
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
mvMatrix.translate( -0.2782177, 0.128312, -0.2021906 );
mvMatrix.scale( 1.315936, 1.132746, 0.7801143 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.32574);
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

