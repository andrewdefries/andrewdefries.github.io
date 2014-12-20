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
-3.082863, 0.8235334, -1.096305, 1, 0, 0, 1,
-3.047042, 0.07981467, -2.476254, 1, 0.007843138, 0, 1,
-2.890885, -0.2481663, -0.2753596, 1, 0.01176471, 0, 1,
-2.876923, 0.9232994, -1.917608, 1, 0.01960784, 0, 1,
-2.809417, 0.424126, -1.649005, 1, 0.02352941, 0, 1,
-2.697566, -0.05322349, -2.212694, 1, 0.03137255, 0, 1,
-2.522533, -0.2198438, -3.583139, 1, 0.03529412, 0, 1,
-2.522528, -0.1675283, -1.481628, 1, 0.04313726, 0, 1,
-2.505521, 0.2879164, -0.1369157, 1, 0.04705882, 0, 1,
-2.473069, 0.5156705, -0.3556698, 1, 0.05490196, 0, 1,
-2.467129, 1.429859, -1.843567, 1, 0.05882353, 0, 1,
-2.414252, 0.5383226, -1.297682, 1, 0.06666667, 0, 1,
-2.385387, -0.4382737, -2.181408, 1, 0.07058824, 0, 1,
-2.31828, -0.9415605, -2.57589, 1, 0.07843138, 0, 1,
-2.302953, -0.3713337, -2.75462, 1, 0.08235294, 0, 1,
-2.288228, -1.59371, -5.016815, 1, 0.09019608, 0, 1,
-2.278312, 1.320394, -0.4462675, 1, 0.09411765, 0, 1,
-2.263036, 0.5485415, -3.566125, 1, 0.1019608, 0, 1,
-2.205484, -0.489414, -0.6100183, 1, 0.1098039, 0, 1,
-2.204631, -2.417145, -0.6867833, 1, 0.1137255, 0, 1,
-2.167015, 0.4696954, -1.126539, 1, 0.1215686, 0, 1,
-2.152323, 0.6972468, -2.35078, 1, 0.1254902, 0, 1,
-2.138819, -2.248069, -1.210322, 1, 0.1333333, 0, 1,
-2.134232, -1.284938, -2.644327, 1, 0.1372549, 0, 1,
-2.062337, 0.6043787, -1.784114, 1, 0.145098, 0, 1,
-2.050305, 1.211982, -2.393384, 1, 0.1490196, 0, 1,
-2.027867, -0.9847834, -3.224605, 1, 0.1568628, 0, 1,
-2.025505, 0.1454897, -1.709903, 1, 0.1607843, 0, 1,
-1.991945, 1.912308, -0.859415, 1, 0.1686275, 0, 1,
-1.977917, 1.001398, -3.349899, 1, 0.172549, 0, 1,
-1.953376, -1.273765, -2.775957, 1, 0.1803922, 0, 1,
-1.896528, 2.325023, -2.340056, 1, 0.1843137, 0, 1,
-1.894034, -1.339958, -2.510079, 1, 0.1921569, 0, 1,
-1.876332, 0.6771668, -2.614718, 1, 0.1960784, 0, 1,
-1.837574, 1.675389, -2.068833, 1, 0.2039216, 0, 1,
-1.792308, -1.081918, -2.172917, 1, 0.2117647, 0, 1,
-1.78955, -1.232196, -0.6576977, 1, 0.2156863, 0, 1,
-1.738966, 1.407195, -1.098983, 1, 0.2235294, 0, 1,
-1.704088, 0.643192, -2.169482, 1, 0.227451, 0, 1,
-1.698051, 0.6777, -2.546837, 1, 0.2352941, 0, 1,
-1.677103, 0.8549687, -1.972249, 1, 0.2392157, 0, 1,
-1.675355, -0.158084, -2.192638, 1, 0.2470588, 0, 1,
-1.674173, 1.304982, -1.946021, 1, 0.2509804, 0, 1,
-1.670744, 0.4201938, -0.6270081, 1, 0.2588235, 0, 1,
-1.628457, 0.2866493, -3.508059, 1, 0.2627451, 0, 1,
-1.623601, 0.8483877, -1.720034, 1, 0.2705882, 0, 1,
-1.618625, 2.349924, -2.879772, 1, 0.2745098, 0, 1,
-1.601387, -0.9137394, 0.1382473, 1, 0.282353, 0, 1,
-1.596202, -1.168023, -2.319816, 1, 0.2862745, 0, 1,
-1.595389, 0.7355044, -0.4480815, 1, 0.2941177, 0, 1,
-1.585522, -0.4458823, -2.355475, 1, 0.3019608, 0, 1,
-1.583138, 0.7654932, -4.26424, 1, 0.3058824, 0, 1,
-1.576651, -1.223323, -2.762053, 1, 0.3137255, 0, 1,
-1.560342, -0.9956762, -3.078566, 1, 0.3176471, 0, 1,
-1.533486, 1.507857, -0.8630641, 1, 0.3254902, 0, 1,
-1.524749, -1.158987, -4.432885, 1, 0.3294118, 0, 1,
-1.52397, -0.6870449, -2.133888, 1, 0.3372549, 0, 1,
-1.52327, -0.5719416, -0.2234435, 1, 0.3411765, 0, 1,
-1.519479, 0.8379697, -1.335891, 1, 0.3490196, 0, 1,
-1.513786, -1.622611, -3.23905, 1, 0.3529412, 0, 1,
-1.50975, 0.2745511, -0.7083147, 1, 0.3607843, 0, 1,
-1.505756, 0.2211022, -3.385739, 1, 0.3647059, 0, 1,
-1.486668, -1.534873, -0.3403729, 1, 0.372549, 0, 1,
-1.486663, 0.9846395, -1.365365, 1, 0.3764706, 0, 1,
-1.471217, -0.9438645, -1.50087, 1, 0.3843137, 0, 1,
-1.456971, 0.227266, -1.651511, 1, 0.3882353, 0, 1,
-1.455061, 0.9305041, -1.192782, 1, 0.3960784, 0, 1,
-1.454964, 0.5156306, -1.487923, 1, 0.4039216, 0, 1,
-1.443406, 0.8049743, -0.08194923, 1, 0.4078431, 0, 1,
-1.43912, -0.4136515, -2.784555, 1, 0.4156863, 0, 1,
-1.43224, -0.5721776, -1.743018, 1, 0.4196078, 0, 1,
-1.41966, -0.05483986, -2.08219, 1, 0.427451, 0, 1,
-1.417244, -1.835381, -2.29152, 1, 0.4313726, 0, 1,
-1.415452, 1.76441, 0.1355129, 1, 0.4392157, 0, 1,
-1.393579, 2.677732, -1.742388, 1, 0.4431373, 0, 1,
-1.386455, 0.09393041, -1.431589, 1, 0.4509804, 0, 1,
-1.35441, 0.557885, -0.4123468, 1, 0.454902, 0, 1,
-1.338377, 1.092025, -2.051562, 1, 0.4627451, 0, 1,
-1.327822, 0.6104776, -0.8339139, 1, 0.4666667, 0, 1,
-1.325548, 0.4209619, -2.156159, 1, 0.4745098, 0, 1,
-1.323384, -0.7463073, -2.478196, 1, 0.4784314, 0, 1,
-1.32183, 1.305104, -1.095766, 1, 0.4862745, 0, 1,
-1.319492, 0.3233029, -0.8054129, 1, 0.4901961, 0, 1,
-1.31568, 1.754296, 1.551176, 1, 0.4980392, 0, 1,
-1.313995, 0.676261, -0.8529933, 1, 0.5058824, 0, 1,
-1.31382, 1.610752, -1.314795, 1, 0.509804, 0, 1,
-1.297718, -0.521695, -2.661231, 1, 0.5176471, 0, 1,
-1.296097, 1.039873, 2.203509, 1, 0.5215687, 0, 1,
-1.296051, 0.01573543, -1.310227, 1, 0.5294118, 0, 1,
-1.294061, -0.02419733, -1.215302, 1, 0.5333334, 0, 1,
-1.273692, -0.5267813, -1.155933, 1, 0.5411765, 0, 1,
-1.273575, -0.4035104, -2.451933, 1, 0.5450981, 0, 1,
-1.271551, 2.69972, -0.1048023, 1, 0.5529412, 0, 1,
-1.268119, 1.667417, -1.334698, 1, 0.5568628, 0, 1,
-1.266515, -1.270908, -1.105906, 1, 0.5647059, 0, 1,
-1.26603, -0.9183597, -1.862856, 1, 0.5686275, 0, 1,
-1.265407, 0.4288658, 1.165752, 1, 0.5764706, 0, 1,
-1.263174, -0.8494791, -2.798583, 1, 0.5803922, 0, 1,
-1.261797, -1.582824, -3.218163, 1, 0.5882353, 0, 1,
-1.258793, 0.5152454, -2.655807, 1, 0.5921569, 0, 1,
-1.249875, 0.9159803, -0.4804932, 1, 0.6, 0, 1,
-1.248303, 0.05290106, -2.360425, 1, 0.6078432, 0, 1,
-1.241106, -0.6118501, -1.902621, 1, 0.6117647, 0, 1,
-1.229623, -1.160597, -0.7304786, 1, 0.6196079, 0, 1,
-1.221332, -0.09365508, -1.392609, 1, 0.6235294, 0, 1,
-1.221257, 0.6488889, -2.973925, 1, 0.6313726, 0, 1,
-1.217176, -0.2362118, -1.985919, 1, 0.6352941, 0, 1,
-1.207534, 0.2822791, -1.719104, 1, 0.6431373, 0, 1,
-1.198261, -0.1601694, -1.424854, 1, 0.6470588, 0, 1,
-1.192215, -2.342287, -3.172648, 1, 0.654902, 0, 1,
-1.18761, 0.5968505, -2.447398, 1, 0.6588235, 0, 1,
-1.186882, 0.3307418, -0.9504544, 1, 0.6666667, 0, 1,
-1.185806, 1.80891, -0.0684258, 1, 0.6705883, 0, 1,
-1.184638, -1.767118, -1.756997, 1, 0.6784314, 0, 1,
-1.182578, -0.9735875, -3.385952, 1, 0.682353, 0, 1,
-1.181637, 1.364971, -1.32352, 1, 0.6901961, 0, 1,
-1.181573, -0.1681301, -2.617232, 1, 0.6941177, 0, 1,
-1.164855, -0.2791424, -1.728083, 1, 0.7019608, 0, 1,
-1.164535, 1.055136, -1.673087, 1, 0.7098039, 0, 1,
-1.163954, -0.5047269, -3.533404, 1, 0.7137255, 0, 1,
-1.163226, -0.7820575, -2.041794, 1, 0.7215686, 0, 1,
-1.144355, -1.96384, -1.655698, 1, 0.7254902, 0, 1,
-1.138557, -1.103919, -1.619613, 1, 0.7333333, 0, 1,
-1.138488, 1.248102, -1.477008, 1, 0.7372549, 0, 1,
-1.113075, -2.159997, -2.381135, 1, 0.7450981, 0, 1,
-1.109405, -0.724367, -2.682382, 1, 0.7490196, 0, 1,
-1.104394, 1.452211, -0.1216308, 1, 0.7568628, 0, 1,
-1.093512, -0.4581533, -1.199216, 1, 0.7607843, 0, 1,
-1.09046, 0.6193344, -0.4613711, 1, 0.7686275, 0, 1,
-1.089934, -0.7943941, -0.6147471, 1, 0.772549, 0, 1,
-1.083392, 0.5086623, -0.559897, 1, 0.7803922, 0, 1,
-1.077765, 0.7001281, -0.9638324, 1, 0.7843137, 0, 1,
-1.077475, -0.2844133, -0.3714005, 1, 0.7921569, 0, 1,
-1.073634, -0.08355252, -2.500329, 1, 0.7960784, 0, 1,
-1.067122, -0.6624976, -2.322586, 1, 0.8039216, 0, 1,
-1.06577, 0.6379761, -2.441018, 1, 0.8117647, 0, 1,
-1.063817, -1.015753, -1.919487, 1, 0.8156863, 0, 1,
-1.056553, -1.157787, -3.158371, 1, 0.8235294, 0, 1,
-1.044298, 0.5278547, 0.2860577, 1, 0.827451, 0, 1,
-1.040243, -1.124048, -3.173157, 1, 0.8352941, 0, 1,
-1.039215, 0.8899634, -0.6716242, 1, 0.8392157, 0, 1,
-1.038326, 0.9707207, -1.768965, 1, 0.8470588, 0, 1,
-1.038087, 1.130655, 0.6854807, 1, 0.8509804, 0, 1,
-1.032818, 1.311253, 0.2169465, 1, 0.8588235, 0, 1,
-1.031906, -1.40559, -0.2313861, 1, 0.8627451, 0, 1,
-1.031226, 0.8998107, -1.180441, 1, 0.8705882, 0, 1,
-1.028752, -1.475588, -0.9109349, 1, 0.8745098, 0, 1,
-1.017236, 2.016993, -0.9801098, 1, 0.8823529, 0, 1,
-1.009742, 0.2445939, -1.644155, 1, 0.8862745, 0, 1,
-1.004794, -0.2063726, -0.6270099, 1, 0.8941177, 0, 1,
-0.9889185, -1.608674, -2.042362, 1, 0.8980392, 0, 1,
-0.9754841, 0.921595, -0.06600838, 1, 0.9058824, 0, 1,
-0.974023, -0.4232002, -2.918867, 1, 0.9137255, 0, 1,
-0.9731473, -0.007620859, -2.086953, 1, 0.9176471, 0, 1,
-0.968122, -1.37624, -2.361252, 1, 0.9254902, 0, 1,
-0.9529349, -0.3814928, -4.183382, 1, 0.9294118, 0, 1,
-0.9523252, 0.5528094, -2.331896, 1, 0.9372549, 0, 1,
-0.9513044, -0.9429444, -2.242484, 1, 0.9411765, 0, 1,
-0.9490909, -0.5629683, -2.137281, 1, 0.9490196, 0, 1,
-0.9453529, -0.1668472, -2.017454, 1, 0.9529412, 0, 1,
-0.9429898, -0.7638585, -2.931114, 1, 0.9607843, 0, 1,
-0.9421349, -1.464223, -1.813765, 1, 0.9647059, 0, 1,
-0.9401115, -1.936782, -2.782557, 1, 0.972549, 0, 1,
-0.9306034, -1.758096, -2.054119, 1, 0.9764706, 0, 1,
-0.9195386, 0.5389206, -2.691281, 1, 0.9843137, 0, 1,
-0.9191023, 0.5502253, 0.7989547, 1, 0.9882353, 0, 1,
-0.9163896, -0.2382911, -0.9010383, 1, 0.9960784, 0, 1,
-0.912366, -0.3106229, -2.140794, 0.9960784, 1, 0, 1,
-0.9063731, -0.9607168, -2.800789, 0.9921569, 1, 0, 1,
-0.9051642, 0.4169881, -2.782277, 0.9843137, 1, 0, 1,
-0.9010577, -1.85918, -0.8876249, 0.9803922, 1, 0, 1,
-0.8963243, -1.299679, -3.507829, 0.972549, 1, 0, 1,
-0.8915619, -0.2703758, -2.110566, 0.9686275, 1, 0, 1,
-0.8909227, -0.7710051, -1.838292, 0.9607843, 1, 0, 1,
-0.8871759, -0.8016172, -2.481467, 0.9568627, 1, 0, 1,
-0.8768131, -0.4727536, -2.108261, 0.9490196, 1, 0, 1,
-0.873152, 1.106895, 0.5514462, 0.945098, 1, 0, 1,
-0.8724184, 0.04993889, -1.297071, 0.9372549, 1, 0, 1,
-0.8690602, 1.117494, -2.202639, 0.9333333, 1, 0, 1,
-0.8642766, -0.2297777, -1.695888, 0.9254902, 1, 0, 1,
-0.8613806, -0.6722919, -0.629815, 0.9215686, 1, 0, 1,
-0.8596358, -1.600322, -3.408448, 0.9137255, 1, 0, 1,
-0.8547297, 0.9837797, -0.2517911, 0.9098039, 1, 0, 1,
-0.8523762, -0.4999005, -2.240573, 0.9019608, 1, 0, 1,
-0.8418255, -1.612164, -0.5986757, 0.8941177, 1, 0, 1,
-0.8347853, -0.1702138, -2.804514, 0.8901961, 1, 0, 1,
-0.833891, 0.6734602, 0.2538377, 0.8823529, 1, 0, 1,
-0.8327447, -1.105958, -2.384495, 0.8784314, 1, 0, 1,
-0.8203521, -1.333348, -0.49563, 0.8705882, 1, 0, 1,
-0.8183321, -0.545041, -2.503945, 0.8666667, 1, 0, 1,
-0.8164846, -1.45511, -2.507048, 0.8588235, 1, 0, 1,
-0.8055616, -0.6483548, -1.410985, 0.854902, 1, 0, 1,
-0.805492, 1.936987, -0.5883594, 0.8470588, 1, 0, 1,
-0.8046541, 0.2190454, -1.554379, 0.8431373, 1, 0, 1,
-0.803103, 0.1257323, -1.90299, 0.8352941, 1, 0, 1,
-0.8015321, -0.3685575, -1.386619, 0.8313726, 1, 0, 1,
-0.7950901, 0.4020944, -1.069423, 0.8235294, 1, 0, 1,
-0.7921954, 0.6159132, -2.165129, 0.8196079, 1, 0, 1,
-0.791994, -0.2441048, -1.875993, 0.8117647, 1, 0, 1,
-0.7881948, 0.1460287, -2.484497, 0.8078431, 1, 0, 1,
-0.7846974, -0.6377928, -2.404023, 0.8, 1, 0, 1,
-0.7820279, 0.7983497, -1.37492, 0.7921569, 1, 0, 1,
-0.7782297, -1.549206, -2.054448, 0.7882353, 1, 0, 1,
-0.7768764, 0.555476, -0.6337547, 0.7803922, 1, 0, 1,
-0.7768655, -0.7221441, -1.011507, 0.7764706, 1, 0, 1,
-0.7758607, 1.188404, -1.209787, 0.7686275, 1, 0, 1,
-0.7674625, -0.05371626, -0.5789084, 0.7647059, 1, 0, 1,
-0.7633563, 0.6896935, -0.4330652, 0.7568628, 1, 0, 1,
-0.7625542, -1.430825, -1.408575, 0.7529412, 1, 0, 1,
-0.7553777, 1.5458, 0.3119413, 0.7450981, 1, 0, 1,
-0.7543373, -1.01034, -1.877536, 0.7411765, 1, 0, 1,
-0.7535272, 1.811932, -0.1247197, 0.7333333, 1, 0, 1,
-0.7460378, -1.381308, -3.153826, 0.7294118, 1, 0, 1,
-0.7371062, 1.329419, -1.626915, 0.7215686, 1, 0, 1,
-0.7335255, 1.161689, 0.2353097, 0.7176471, 1, 0, 1,
-0.7252052, 1.249683, 1.798274, 0.7098039, 1, 0, 1,
-0.7246329, 1.031509, 0.1092452, 0.7058824, 1, 0, 1,
-0.7167068, 0.08697674, -0.7405186, 0.6980392, 1, 0, 1,
-0.7119648, 0.6980143, 0.1613782, 0.6901961, 1, 0, 1,
-0.7095235, 0.1499391, -1.763707, 0.6862745, 1, 0, 1,
-0.7060738, 1.014475, -1.253262, 0.6784314, 1, 0, 1,
-0.7019241, 0.6967143, -0.2410734, 0.6745098, 1, 0, 1,
-0.7009773, 0.5500128, -1.698357, 0.6666667, 1, 0, 1,
-0.6980119, -0.8708095, -2.836929, 0.6627451, 1, 0, 1,
-0.6959435, 0.4649296, -0.9718807, 0.654902, 1, 0, 1,
-0.6881869, 0.9190326, -1.968878, 0.6509804, 1, 0, 1,
-0.6851346, -0.4314481, -0.9285518, 0.6431373, 1, 0, 1,
-0.6849977, -0.8191488, -2.663162, 0.6392157, 1, 0, 1,
-0.6839928, 1.240369, 0.5186157, 0.6313726, 1, 0, 1,
-0.6679482, 0.5326466, -0.218214, 0.627451, 1, 0, 1,
-0.6625945, 1.58569, -0.3676672, 0.6196079, 1, 0, 1,
-0.6602811, 0.3476091, -1.196546, 0.6156863, 1, 0, 1,
-0.6595646, -0.5131037, -2.873967, 0.6078432, 1, 0, 1,
-0.6577939, -0.207614, -1.125868, 0.6039216, 1, 0, 1,
-0.6508219, -0.5194662, -2.01776, 0.5960785, 1, 0, 1,
-0.6480972, -1.117829, -2.213413, 0.5882353, 1, 0, 1,
-0.6473355, 1.856226, -0.6753571, 0.5843138, 1, 0, 1,
-0.6424302, 0.4226189, -1.350946, 0.5764706, 1, 0, 1,
-0.6395236, -0.2152763, -1.47008, 0.572549, 1, 0, 1,
-0.6394683, -0.2415044, -2.874857, 0.5647059, 1, 0, 1,
-0.638212, 0.416744, -0.4989648, 0.5607843, 1, 0, 1,
-0.6337464, -0.9070094, -1.561587, 0.5529412, 1, 0, 1,
-0.6304166, 0.1248908, -0.1698785, 0.5490196, 1, 0, 1,
-0.6286495, -0.505796, -2.61634, 0.5411765, 1, 0, 1,
-0.6274884, -0.4058129, -1.179296, 0.5372549, 1, 0, 1,
-0.6227207, 1.854884, -2.218625, 0.5294118, 1, 0, 1,
-0.6225829, 1.991631, 0.4996339, 0.5254902, 1, 0, 1,
-0.6209785, 0.02768206, -2.809915, 0.5176471, 1, 0, 1,
-0.6157071, -0.3357013, -3.547913, 0.5137255, 1, 0, 1,
-0.6145247, -0.1664194, -0.2610918, 0.5058824, 1, 0, 1,
-0.609045, -0.1327103, -3.02876, 0.5019608, 1, 0, 1,
-0.6046683, -1.576176, -3.106326, 0.4941176, 1, 0, 1,
-0.6045048, 0.2267132, 0.2244475, 0.4862745, 1, 0, 1,
-0.6016645, -0.06665149, -2.705062, 0.4823529, 1, 0, 1,
-0.6012971, -1.254192, -2.053871, 0.4745098, 1, 0, 1,
-0.6009925, 0.3499131, -2.350982, 0.4705882, 1, 0, 1,
-0.6002176, -0.6660445, -3.471376, 0.4627451, 1, 0, 1,
-0.5956476, -0.02249942, -2.149616, 0.4588235, 1, 0, 1,
-0.5944542, -1.029142, -2.720295, 0.4509804, 1, 0, 1,
-0.5931669, -2.131341, -3.256256, 0.4470588, 1, 0, 1,
-0.5802035, -0.6808268, -3.14303, 0.4392157, 1, 0, 1,
-0.5792437, -1.047744, -2.66407, 0.4352941, 1, 0, 1,
-0.5756217, 1.630889, -0.2210317, 0.427451, 1, 0, 1,
-0.5742232, -1.031879, -1.602329, 0.4235294, 1, 0, 1,
-0.5727846, 0.9308087, -0.3847559, 0.4156863, 1, 0, 1,
-0.5722186, -0.4845944, -3.273604, 0.4117647, 1, 0, 1,
-0.5691994, 0.6517175, 2.022712, 0.4039216, 1, 0, 1,
-0.567157, -1.006917, -1.643727, 0.3960784, 1, 0, 1,
-0.5657988, 0.1525318, -1.038037, 0.3921569, 1, 0, 1,
-0.5652076, -1.295364, -3.466069, 0.3843137, 1, 0, 1,
-0.5622555, -0.2214918, -1.326522, 0.3803922, 1, 0, 1,
-0.5607679, 0.2210165, -2.771461, 0.372549, 1, 0, 1,
-0.5578899, 0.2726355, 0.2924865, 0.3686275, 1, 0, 1,
-0.5555017, 0.7956568, -0.2209735, 0.3607843, 1, 0, 1,
-0.5551716, -1.375525, -3.687996, 0.3568628, 1, 0, 1,
-0.5526213, 0.7719241, -1.693509, 0.3490196, 1, 0, 1,
-0.5480047, -1.143528, -2.240098, 0.345098, 1, 0, 1,
-0.5463805, 0.942121, -1.164376, 0.3372549, 1, 0, 1,
-0.540354, 2.163355, 0.1905231, 0.3333333, 1, 0, 1,
-0.5393152, 0.7580974, -0.4601713, 0.3254902, 1, 0, 1,
-0.533104, 0.057999, -2.364407, 0.3215686, 1, 0, 1,
-0.5312551, -0.478195, -2.145572, 0.3137255, 1, 0, 1,
-0.5291317, 1.24228, 0.9902381, 0.3098039, 1, 0, 1,
-0.5270391, 0.6693798, -2.320673, 0.3019608, 1, 0, 1,
-0.5253505, 0.5188487, -1.187544, 0.2941177, 1, 0, 1,
-0.5216503, -0.6391339, -0.1714446, 0.2901961, 1, 0, 1,
-0.5214178, -1.589919, -3.470623, 0.282353, 1, 0, 1,
-0.5205699, -0.2214106, -0.7040086, 0.2784314, 1, 0, 1,
-0.5145211, -0.6863712, -3.466164, 0.2705882, 1, 0, 1,
-0.5142022, -0.09864014, -1.541037, 0.2666667, 1, 0, 1,
-0.514181, 1.11334, 0.2817384, 0.2588235, 1, 0, 1,
-0.5130379, -1.107302, -1.299768, 0.254902, 1, 0, 1,
-0.5115048, 0.4204622, -1.241721, 0.2470588, 1, 0, 1,
-0.5111834, -2.972988, -4.388608, 0.2431373, 1, 0, 1,
-0.5105662, 0.0325685, -0.4532206, 0.2352941, 1, 0, 1,
-0.5105325, -0.5147393, -3.342267, 0.2313726, 1, 0, 1,
-0.5082234, -0.9491436, -3.039865, 0.2235294, 1, 0, 1,
-0.504442, -1.024761, -1.761137, 0.2196078, 1, 0, 1,
-0.5040458, 0.246497, -0.1491379, 0.2117647, 1, 0, 1,
-0.5039805, -0.6319788, -2.029623, 0.2078431, 1, 0, 1,
-0.5027073, -1.79018, -2.896619, 0.2, 1, 0, 1,
-0.4997571, 0.04231967, -0.04140124, 0.1921569, 1, 0, 1,
-0.4979126, 1.224276, -1.358377, 0.1882353, 1, 0, 1,
-0.497316, 0.3464062, -1.39323, 0.1803922, 1, 0, 1,
-0.4965919, -2.4662, -4.432104, 0.1764706, 1, 0, 1,
-0.4960006, 0.3071723, -2.209944, 0.1686275, 1, 0, 1,
-0.4938374, -0.1188638, -2.764342, 0.1647059, 1, 0, 1,
-0.4900973, 0.6469904, -0.6936979, 0.1568628, 1, 0, 1,
-0.4879687, 0.8756332, 0.2274453, 0.1529412, 1, 0, 1,
-0.4832922, -0.806079, -3.06923, 0.145098, 1, 0, 1,
-0.4779299, 2.140927, 0.3565677, 0.1411765, 1, 0, 1,
-0.4772317, -0.2780831, -2.903133, 0.1333333, 1, 0, 1,
-0.4746976, -0.2946982, -1.046429, 0.1294118, 1, 0, 1,
-0.4742201, -1.131365, -3.807652, 0.1215686, 1, 0, 1,
-0.4626361, 0.131343, -0.8880332, 0.1176471, 1, 0, 1,
-0.461873, 1.042723, -0.1072124, 0.1098039, 1, 0, 1,
-0.4616199, 1.196611, 0.6828297, 0.1058824, 1, 0, 1,
-0.461256, 0.6611422, -2.366005, 0.09803922, 1, 0, 1,
-0.4603683, 0.6198137, -0.2271973, 0.09019608, 1, 0, 1,
-0.4568662, -0.9774588, -4.245919, 0.08627451, 1, 0, 1,
-0.4555776, -0.006059234, -1.529032, 0.07843138, 1, 0, 1,
-0.4528068, -1.218915, -1.405209, 0.07450981, 1, 0, 1,
-0.4490714, 0.06206662, -1.396249, 0.06666667, 1, 0, 1,
-0.4423063, 1.107802, 0.440308, 0.0627451, 1, 0, 1,
-0.4410034, 0.736316, 0.4159708, 0.05490196, 1, 0, 1,
-0.4405848, 0.8359283, 0.7901522, 0.05098039, 1, 0, 1,
-0.4401525, 1.09862, -1.858621, 0.04313726, 1, 0, 1,
-0.4400998, 0.4004239, -0.1018138, 0.03921569, 1, 0, 1,
-0.4346338, 0.06281083, -1.799588, 0.03137255, 1, 0, 1,
-0.4338842, -0.5614688, -2.924238, 0.02745098, 1, 0, 1,
-0.4333792, -0.2038501, -0.7647926, 0.01960784, 1, 0, 1,
-0.4246815, 0.01514178, 0.1542894, 0.01568628, 1, 0, 1,
-0.4245963, -0.7157037, -2.643811, 0.007843138, 1, 0, 1,
-0.4241772, 1.254347, -0.8088183, 0.003921569, 1, 0, 1,
-0.4230183, -0.7022463, -2.578763, 0, 1, 0.003921569, 1,
-0.4171198, -0.01612405, -1.132806, 0, 1, 0.01176471, 1,
-0.4152589, 1.235754, 0.08228496, 0, 1, 0.01568628, 1,
-0.4126619, 0.12652, -0.7726309, 0, 1, 0.02352941, 1,
-0.4099516, -1.944919, -4.209742, 0, 1, 0.02745098, 1,
-0.4097885, 0.6206568, -0.5387294, 0, 1, 0.03529412, 1,
-0.4079317, 0.5074745, -0.6153376, 0, 1, 0.03921569, 1,
-0.4071414, -0.4667192, -4.325714, 0, 1, 0.04705882, 1,
-0.4009494, -2.297412, -3.767183, 0, 1, 0.05098039, 1,
-0.3986818, -0.7723267, -2.308787, 0, 1, 0.05882353, 1,
-0.3959598, -0.3712668, -3.377492, 0, 1, 0.0627451, 1,
-0.3931866, 0.944706, -1.256235, 0, 1, 0.07058824, 1,
-0.3912734, -0.2568557, -2.313337, 0, 1, 0.07450981, 1,
-0.3874255, 0.1076217, -0.03578506, 0, 1, 0.08235294, 1,
-0.3852983, 0.79157, -1.615428, 0, 1, 0.08627451, 1,
-0.3822708, -1.118574, -2.468338, 0, 1, 0.09411765, 1,
-0.3814327, 1.566876, -1.003367, 0, 1, 0.1019608, 1,
-0.38107, -0.3296278, -2.97026, 0, 1, 0.1058824, 1,
-0.3774061, -0.05085648, -1.73264, 0, 1, 0.1137255, 1,
-0.3737082, -0.6960863, -2.457705, 0, 1, 0.1176471, 1,
-0.3735823, 0.09988918, -0.8303888, 0, 1, 0.1254902, 1,
-0.3709953, 1.331252, -0.06178008, 0, 1, 0.1294118, 1,
-0.3708318, 0.3566416, -1.06621, 0, 1, 0.1372549, 1,
-0.369534, -0.4796513, -3.924015, 0, 1, 0.1411765, 1,
-0.3669806, -0.8180294, -3.163772, 0, 1, 0.1490196, 1,
-0.3652563, -0.3369713, -3.48696, 0, 1, 0.1529412, 1,
-0.3634391, 0.4545789, -0.2348466, 0, 1, 0.1607843, 1,
-0.3618533, 1.023913, 1.724609, 0, 1, 0.1647059, 1,
-0.3491047, 0.8890703, 0.6979832, 0, 1, 0.172549, 1,
-0.348955, -1.908365, -2.017621, 0, 1, 0.1764706, 1,
-0.3480445, 0.2386502, -2.844921, 0, 1, 0.1843137, 1,
-0.3349904, 0.3006442, -0.07421124, 0, 1, 0.1882353, 1,
-0.3339818, 0.9842194, 1.304569, 0, 1, 0.1960784, 1,
-0.3311613, 0.4494599, -1.12108, 0, 1, 0.2039216, 1,
-0.3284848, -1.510584, -3.227596, 0, 1, 0.2078431, 1,
-0.3273486, 0.8398895, -0.005508178, 0, 1, 0.2156863, 1,
-0.3219976, -0.2478613, -0.02408695, 0, 1, 0.2196078, 1,
-0.3206104, 0.9627312, -0.2432151, 0, 1, 0.227451, 1,
-0.3196087, 0.3817505, -0.8025599, 0, 1, 0.2313726, 1,
-0.3162429, 1.468018, -0.06948459, 0, 1, 0.2392157, 1,
-0.3145494, -1.048446, -1.068741, 0, 1, 0.2431373, 1,
-0.3142311, -0.7865298, -5.223485, 0, 1, 0.2509804, 1,
-0.3112233, 0.2413758, 0.7747229, 0, 1, 0.254902, 1,
-0.307118, -1.219042, -3.036243, 0, 1, 0.2627451, 1,
-0.3047946, 0.3411649, -1.517766, 0, 1, 0.2666667, 1,
-0.3012295, -2.157793, -1.708136, 0, 1, 0.2745098, 1,
-0.3004541, 0.5614269, -1.83676, 0, 1, 0.2784314, 1,
-0.3003414, 0.1181004, -3.069917, 0, 1, 0.2862745, 1,
-0.2936923, -0.8993813, -2.238078, 0, 1, 0.2901961, 1,
-0.2935254, -1.743272, -2.052739, 0, 1, 0.2980392, 1,
-0.2922461, -0.3388211, -2.875866, 0, 1, 0.3058824, 1,
-0.2880493, 0.6102498, -0.3294792, 0, 1, 0.3098039, 1,
-0.2842758, 0.2420358, -2.187721, 0, 1, 0.3176471, 1,
-0.2826107, 1.733715, 0.9102924, 0, 1, 0.3215686, 1,
-0.2775201, -0.6587489, -3.344796, 0, 1, 0.3294118, 1,
-0.2774262, -0.2271172, -2.049947, 0, 1, 0.3333333, 1,
-0.2707008, 0.04843546, -0.2521808, 0, 1, 0.3411765, 1,
-0.2688267, 0.4820389, -0.2512612, 0, 1, 0.345098, 1,
-0.2675604, -0.3003092, -3.32568, 0, 1, 0.3529412, 1,
-0.2650791, -0.0661033, -1.292553, 0, 1, 0.3568628, 1,
-0.2640115, -0.5014168, -2.826434, 0, 1, 0.3647059, 1,
-0.2579071, 0.4152736, -1.245058, 0, 1, 0.3686275, 1,
-0.2577331, -1.179056, -4.086261, 0, 1, 0.3764706, 1,
-0.2541375, -1.224393, -2.671802, 0, 1, 0.3803922, 1,
-0.2489332, -0.6183557, -2.948111, 0, 1, 0.3882353, 1,
-0.2484633, 2.854551, -0.8091057, 0, 1, 0.3921569, 1,
-0.2479169, -1.30982, -3.862302, 0, 1, 0.4, 1,
-0.2472933, -1.165472, -1.614179, 0, 1, 0.4078431, 1,
-0.2381583, 0.1749373, -1.919537, 0, 1, 0.4117647, 1,
-0.2372542, -1.420661, -3.358969, 0, 1, 0.4196078, 1,
-0.2358633, 0.1044996, -0.8498412, 0, 1, 0.4235294, 1,
-0.2329289, -1.716892, -1.227216, 0, 1, 0.4313726, 1,
-0.2325032, -1.16317, -4.453357, 0, 1, 0.4352941, 1,
-0.2313237, -0.2229632, -1.428807, 0, 1, 0.4431373, 1,
-0.2179326, -0.4681233, -2.245432, 0, 1, 0.4470588, 1,
-0.2137556, 0.8411083, 2.076561, 0, 1, 0.454902, 1,
-0.2122225, 0.7603392, -0.6186777, 0, 1, 0.4588235, 1,
-0.2050742, 0.2821999, -1.19931, 0, 1, 0.4666667, 1,
-0.20435, -1.229217, -4.736478, 0, 1, 0.4705882, 1,
-0.2040561, -0.1325647, -2.200812, 0, 1, 0.4784314, 1,
-0.197699, -0.380392, -2.332221, 0, 1, 0.4823529, 1,
-0.1973051, -0.7153367, -2.564828, 0, 1, 0.4901961, 1,
-0.194697, -0.1623795, -0.9192544, 0, 1, 0.4941176, 1,
-0.1910217, -1.002942, -2.281154, 0, 1, 0.5019608, 1,
-0.1896079, 0.7338447, -1.211252, 0, 1, 0.509804, 1,
-0.1854618, 2.553727, 0.3179126, 0, 1, 0.5137255, 1,
-0.1823237, 0.2523562, 0.06866055, 0, 1, 0.5215687, 1,
-0.1796338, -1.024614, -3.655313, 0, 1, 0.5254902, 1,
-0.1791362, -1.459841, -2.760993, 0, 1, 0.5333334, 1,
-0.1786337, -1.448268, -1.486424, 0, 1, 0.5372549, 1,
-0.1782565, -0.3610906, -2.734044, 0, 1, 0.5450981, 1,
-0.176705, 0.6076239, -0.552436, 0, 1, 0.5490196, 1,
-0.1756059, 0.2891012, 0.6612627, 0, 1, 0.5568628, 1,
-0.1744759, 1.357214, -0.4711159, 0, 1, 0.5607843, 1,
-0.1722361, 0.1313852, 0.1887608, 0, 1, 0.5686275, 1,
-0.1721257, -0.5574259, -1.322135, 0, 1, 0.572549, 1,
-0.1704472, 1.113661, 0.3781693, 0, 1, 0.5803922, 1,
-0.1701918, -0.3542325, -2.565925, 0, 1, 0.5843138, 1,
-0.163742, 0.8502427, -0.4597954, 0, 1, 0.5921569, 1,
-0.1618124, 1.736402, 0.1378816, 0, 1, 0.5960785, 1,
-0.160863, 0.02886697, -1.76041, 0, 1, 0.6039216, 1,
-0.1569168, 0.5183457, -2.34293, 0, 1, 0.6117647, 1,
-0.1566977, 2.206408, -0.9456644, 0, 1, 0.6156863, 1,
-0.1535177, 0.6542479, 0.4856055, 0, 1, 0.6235294, 1,
-0.1509716, 0.1510192, 0.2554929, 0, 1, 0.627451, 1,
-0.1493281, -0.3362571, -2.94206, 0, 1, 0.6352941, 1,
-0.1479059, -0.4897577, -3.818375, 0, 1, 0.6392157, 1,
-0.1431821, -0.2263809, -4.119718, 0, 1, 0.6470588, 1,
-0.1307057, 0.329207, -0.08143689, 0, 1, 0.6509804, 1,
-0.1298181, -0.5393823, -1.133141, 0, 1, 0.6588235, 1,
-0.1296369, 0.8254522, 0.7577801, 0, 1, 0.6627451, 1,
-0.1293373, 1.110182, 0.642511, 0, 1, 0.6705883, 1,
-0.1276847, 1.460828, 0.7176996, 0, 1, 0.6745098, 1,
-0.1272347, -0.8296142, -2.609637, 0, 1, 0.682353, 1,
-0.1200639, 1.148817, 1.46341, 0, 1, 0.6862745, 1,
-0.1156269, -0.9231672, -2.917607, 0, 1, 0.6941177, 1,
-0.1138561, -0.0698272, -2.778939, 0, 1, 0.7019608, 1,
-0.111355, -0.1846115, -0.1762539, 0, 1, 0.7058824, 1,
-0.1041969, 0.7370541, -2.918926, 0, 1, 0.7137255, 1,
-0.1023619, 0.4251623, 1.214016, 0, 1, 0.7176471, 1,
-0.1020758, 0.03263637, -1.168902, 0, 1, 0.7254902, 1,
-0.0983611, -0.9533265, -2.980146, 0, 1, 0.7294118, 1,
-0.09333868, 0.7424098, 1.652836, 0, 1, 0.7372549, 1,
-0.09280642, 0.7297163, 1.860373, 0, 1, 0.7411765, 1,
-0.092702, 0.2656495, -1.33315, 0, 1, 0.7490196, 1,
-0.08698803, -0.1334081, -1.520967, 0, 1, 0.7529412, 1,
-0.08087953, 1.535606, 1.570255, 0, 1, 0.7607843, 1,
-0.07182402, 0.7465202, -0.9253536, 0, 1, 0.7647059, 1,
-0.06773617, 1.469651, -0.006995605, 0, 1, 0.772549, 1,
-0.06504751, -0.3956214, -2.155176, 0, 1, 0.7764706, 1,
-0.06355866, 1.223945, 0.8470131, 0, 1, 0.7843137, 1,
-0.06281363, -0.3011032, -2.079986, 0, 1, 0.7882353, 1,
-0.05932792, -1.203925, -3.505255, 0, 1, 0.7960784, 1,
-0.05751374, 0.7258381, -0.3532245, 0, 1, 0.8039216, 1,
-0.05712152, 0.8730308, -1.278874, 0, 1, 0.8078431, 1,
-0.05405947, 0.4426588, -0.2754028, 0, 1, 0.8156863, 1,
-0.05120185, 0.1627594, 1.355697, 0, 1, 0.8196079, 1,
-0.0508948, -0.8477249, -3.48783, 0, 1, 0.827451, 1,
-0.04859122, 0.6022962, 0.6928843, 0, 1, 0.8313726, 1,
-0.04626681, -1.100132, -2.5959, 0, 1, 0.8392157, 1,
-0.0439552, -0.6605809, -2.595614, 0, 1, 0.8431373, 1,
-0.04302214, 0.2199761, -0.5443333, 0, 1, 0.8509804, 1,
-0.04139691, -0.1367871, -1.931061, 0, 1, 0.854902, 1,
-0.02747618, 0.4045526, 0.1397737, 0, 1, 0.8627451, 1,
-0.01816203, 0.2508108, 0.03861624, 0, 1, 0.8666667, 1,
-0.01766236, 0.9578797, 0.4814528, 0, 1, 0.8745098, 1,
-0.01191581, 0.4203634, -0.5820663, 0, 1, 0.8784314, 1,
-0.009786263, 0.1384364, -0.4705313, 0, 1, 0.8862745, 1,
-0.008967911, -1.333255, -3.813969, 0, 1, 0.8901961, 1,
-0.007715657, -0.3557523, -4.407561, 0, 1, 0.8980392, 1,
0.002669642, 0.01918854, 1.855124, 0, 1, 0.9058824, 1,
0.01042082, 0.674054, -1.383087, 0, 1, 0.9098039, 1,
0.01107809, -0.9010267, 1.795646, 0, 1, 0.9176471, 1,
0.01125945, -0.3056232, 4.34187, 0, 1, 0.9215686, 1,
0.01158467, 1.302165, 0.4127194, 0, 1, 0.9294118, 1,
0.01860761, 0.3583809, 0.06531845, 0, 1, 0.9333333, 1,
0.02147113, -0.6565672, 2.789756, 0, 1, 0.9411765, 1,
0.02179005, 0.7709363, 0.1266478, 0, 1, 0.945098, 1,
0.02208776, -0.05866076, 3.796939, 0, 1, 0.9529412, 1,
0.02329269, 0.2569545, 0.9873464, 0, 1, 0.9568627, 1,
0.02524774, 0.1680099, -0.4921967, 0, 1, 0.9647059, 1,
0.03076346, 0.5137697, -1.655417, 0, 1, 0.9686275, 1,
0.0343083, -1.187849, 4.715059, 0, 1, 0.9764706, 1,
0.03648467, 0.4336688, 0.6484513, 0, 1, 0.9803922, 1,
0.03805503, -0.3459685, 2.430174, 0, 1, 0.9882353, 1,
0.04494803, -0.1391034, 0.7521366, 0, 1, 0.9921569, 1,
0.04534161, -0.8082334, 2.648791, 0, 1, 1, 1,
0.04950442, 1.112728, 1.627172, 0, 0.9921569, 1, 1,
0.05080918, 0.2102449, 2.431237, 0, 0.9882353, 1, 1,
0.05707846, 0.008866364, 0.6780037, 0, 0.9803922, 1, 1,
0.05858883, -0.8485889, 4.023505, 0, 0.9764706, 1, 1,
0.05893479, -0.1676779, 4.333793, 0, 0.9686275, 1, 1,
0.06871582, 0.7194307, 0.6971407, 0, 0.9647059, 1, 1,
0.06935299, -1.568518, 1.802547, 0, 0.9568627, 1, 1,
0.07070778, 1.838546, 0.8237092, 0, 0.9529412, 1, 1,
0.07221968, -1.823642, 3.756913, 0, 0.945098, 1, 1,
0.0743013, 0.03302772, 1.030707, 0, 0.9411765, 1, 1,
0.07482828, 0.7086518, 0.2809871, 0, 0.9333333, 1, 1,
0.07519991, 2.370107, -1.315299, 0, 0.9294118, 1, 1,
0.08020493, -0.590821, 4.614782, 0, 0.9215686, 1, 1,
0.08264402, -0.5175316, 1.232311, 0, 0.9176471, 1, 1,
0.0828416, 0.2326472, 0.2391074, 0, 0.9098039, 1, 1,
0.08364242, -1.443275, 2.562759, 0, 0.9058824, 1, 1,
0.08598694, 0.2041578, -1.088026, 0, 0.8980392, 1, 1,
0.09190582, -1.076038, 2.428596, 0, 0.8901961, 1, 1,
0.09415074, -0.8762009, 2.731876, 0, 0.8862745, 1, 1,
0.09588215, 0.4435626, 0.7682168, 0, 0.8784314, 1, 1,
0.0988448, 1.117513, -0.05058299, 0, 0.8745098, 1, 1,
0.09900887, -0.6470912, 2.336796, 0, 0.8666667, 1, 1,
0.1047624, 1.41563, 0.3153698, 0, 0.8627451, 1, 1,
0.1106388, -1.990687, 2.343528, 0, 0.854902, 1, 1,
0.1108122, 1.150985, -1.380369, 0, 0.8509804, 1, 1,
0.1123216, -1.641228, 4.093453, 0, 0.8431373, 1, 1,
0.1145708, -1.925952, 3.939345, 0, 0.8392157, 1, 1,
0.1178391, 0.2775243, 0.6883731, 0, 0.8313726, 1, 1,
0.1239292, -1.093201, 3.896523, 0, 0.827451, 1, 1,
0.1288724, -0.3900533, 2.836513, 0, 0.8196079, 1, 1,
0.1295364, -0.1033792, 0.2619421, 0, 0.8156863, 1, 1,
0.1296278, 0.6007697, -0.8412836, 0, 0.8078431, 1, 1,
0.1301472, -0.5271131, 4.22597, 0, 0.8039216, 1, 1,
0.1317859, -0.4524123, 1.58569, 0, 0.7960784, 1, 1,
0.1330705, 0.5206048, 0.8181494, 0, 0.7882353, 1, 1,
0.134149, 1.259195, 2.102319, 0, 0.7843137, 1, 1,
0.1382992, 0.518106, -0.9115177, 0, 0.7764706, 1, 1,
0.1383201, -0.3608678, 1.021376, 0, 0.772549, 1, 1,
0.1422147, 1.054111, 0.8601577, 0, 0.7647059, 1, 1,
0.145689, 0.2904188, 1.519827, 0, 0.7607843, 1, 1,
0.1474664, -1.743139, 1.896923, 0, 0.7529412, 1, 1,
0.1492162, 0.3868303, 0.2393738, 0, 0.7490196, 1, 1,
0.1550828, 0.117967, -1.138428, 0, 0.7411765, 1, 1,
0.1553013, -0.6639082, 2.068316, 0, 0.7372549, 1, 1,
0.1582178, -0.1443432, 3.509499, 0, 0.7294118, 1, 1,
0.1583274, -0.1049616, 1.354403, 0, 0.7254902, 1, 1,
0.160627, -1.527866, 4.164658, 0, 0.7176471, 1, 1,
0.1609466, -0.6434829, 1.461381, 0, 0.7137255, 1, 1,
0.1661715, -0.9906204, 4.124412, 0, 0.7058824, 1, 1,
0.1749168, 0.09737569, 1.240566, 0, 0.6980392, 1, 1,
0.1784805, 0.1001498, 0.8952013, 0, 0.6941177, 1, 1,
0.1791236, 0.3743775, 0.1750765, 0, 0.6862745, 1, 1,
0.1801716, -1.395354, 3.006345, 0, 0.682353, 1, 1,
0.1807167, -0.5058132, 4.751906, 0, 0.6745098, 1, 1,
0.1831087, -0.2061325, 3.546324, 0, 0.6705883, 1, 1,
0.1831498, -1.68169, 3.962945, 0, 0.6627451, 1, 1,
0.1841602, -0.02558659, 0.3173951, 0, 0.6588235, 1, 1,
0.1949976, -1.917144, 3.632225, 0, 0.6509804, 1, 1,
0.2031885, 1.037085, -0.1389893, 0, 0.6470588, 1, 1,
0.2038863, -2.07068, 3.605733, 0, 0.6392157, 1, 1,
0.2043908, -0.8905818, 2.575645, 0, 0.6352941, 1, 1,
0.2048271, 1.610785, -0.716525, 0, 0.627451, 1, 1,
0.2074291, 1.500583, 2.03589, 0, 0.6235294, 1, 1,
0.2165044, -0.09721538, -1.00496, 0, 0.6156863, 1, 1,
0.2186808, 1.306724, 1.204794, 0, 0.6117647, 1, 1,
0.2197306, -0.008363658, 1.751513, 0, 0.6039216, 1, 1,
0.2254893, 0.196619, 2.133424, 0, 0.5960785, 1, 1,
0.2279823, 1.776569, 0.2210014, 0, 0.5921569, 1, 1,
0.2280564, 0.5833609, -1.660695, 0, 0.5843138, 1, 1,
0.2288272, 0.1001953, 1.33333, 0, 0.5803922, 1, 1,
0.2315918, -0.1910559, 1.540023, 0, 0.572549, 1, 1,
0.2351449, 1.506407, 0.6213784, 0, 0.5686275, 1, 1,
0.2401508, 0.4981133, 1.626703, 0, 0.5607843, 1, 1,
0.2416998, 0.3402671, 2.429259, 0, 0.5568628, 1, 1,
0.2442634, 0.3770314, 0.08721516, 0, 0.5490196, 1, 1,
0.254777, 0.5204689, -0.4714626, 0, 0.5450981, 1, 1,
0.25578, 0.08989069, 0.9763574, 0, 0.5372549, 1, 1,
0.2561507, 1.311438, 0.3290285, 0, 0.5333334, 1, 1,
0.2571226, 0.2393183, 3.080302, 0, 0.5254902, 1, 1,
0.260456, -0.3504649, 0.6840025, 0, 0.5215687, 1, 1,
0.2605177, 1.012397, -0.8052293, 0, 0.5137255, 1, 1,
0.2624227, 2.168004, -0.8228109, 0, 0.509804, 1, 1,
0.2645677, -0.5822126, 2.719923, 0, 0.5019608, 1, 1,
0.2668728, -1.225082, 2.918075, 0, 0.4941176, 1, 1,
0.2679031, -0.7189591, 2.978644, 0, 0.4901961, 1, 1,
0.2696167, 0.2733247, 1.523722, 0, 0.4823529, 1, 1,
0.2705461, 0.3208784, 0.6360348, 0, 0.4784314, 1, 1,
0.2794278, 0.2179081, 0.04623066, 0, 0.4705882, 1, 1,
0.2876828, -1.456714, 4.251529, 0, 0.4666667, 1, 1,
0.2890438, -0.6423333, 3.499604, 0, 0.4588235, 1, 1,
0.2895888, 0.085074, 0.4963792, 0, 0.454902, 1, 1,
0.2902818, -1.00706, 4.78661, 0, 0.4470588, 1, 1,
0.2937677, 0.843568, 0.8758428, 0, 0.4431373, 1, 1,
0.3006639, 0.6869482, -0.6537768, 0, 0.4352941, 1, 1,
0.3082152, 0.1058101, 1.112696, 0, 0.4313726, 1, 1,
0.3099383, 0.6080325, 0.7566316, 0, 0.4235294, 1, 1,
0.3125494, 0.3508121, 0.5710135, 0, 0.4196078, 1, 1,
0.3126409, 0.8122395, 0.6019716, 0, 0.4117647, 1, 1,
0.3162619, -0.3924841, 1.311175, 0, 0.4078431, 1, 1,
0.3231783, 0.5379825, 0.4188398, 0, 0.4, 1, 1,
0.3248094, 1.483986, -1.112046, 0, 0.3921569, 1, 1,
0.3249606, -2.14999, 1.495073, 0, 0.3882353, 1, 1,
0.3270319, -0.8106346, 3.985339, 0, 0.3803922, 1, 1,
0.3298775, -0.8132236, 3.63756, 0, 0.3764706, 1, 1,
0.3370499, -0.7677926, 4.643183, 0, 0.3686275, 1, 1,
0.3394316, -0.6709902, 2.695206, 0, 0.3647059, 1, 1,
0.341292, -0.9773614, 3.930005, 0, 0.3568628, 1, 1,
0.349436, -0.009904576, 1.579682, 0, 0.3529412, 1, 1,
0.3519654, -0.02602113, 1.875271, 0, 0.345098, 1, 1,
0.3528364, -0.3566557, 2.997441, 0, 0.3411765, 1, 1,
0.3533753, 1.468002, 1.544461, 0, 0.3333333, 1, 1,
0.3541421, -0.3851098, 2.610267, 0, 0.3294118, 1, 1,
0.3555076, 0.3535719, 1.15085, 0, 0.3215686, 1, 1,
0.3622175, -0.440594, 1.39377, 0, 0.3176471, 1, 1,
0.3683503, 0.2354412, -0.1857461, 0, 0.3098039, 1, 1,
0.3690604, 0.8041126, 0.7075934, 0, 0.3058824, 1, 1,
0.3695744, -1.143286, 2.568973, 0, 0.2980392, 1, 1,
0.3721073, 0.2809497, 2.103331, 0, 0.2901961, 1, 1,
0.3768673, 1.676577, 1.792646, 0, 0.2862745, 1, 1,
0.3786895, 0.05772566, -0.2901901, 0, 0.2784314, 1, 1,
0.3843166, 1.63393, -0.8239634, 0, 0.2745098, 1, 1,
0.3879009, -0.4788024, 1.261633, 0, 0.2666667, 1, 1,
0.3887932, -0.6877043, 2.118922, 0, 0.2627451, 1, 1,
0.3888283, -1.698893, 1.944473, 0, 0.254902, 1, 1,
0.3905771, 0.2502076, 1.863068, 0, 0.2509804, 1, 1,
0.3953115, -1.529, 1.555391, 0, 0.2431373, 1, 1,
0.3953333, -0.01686465, 3.53591, 0, 0.2392157, 1, 1,
0.3958109, 1.089018, -0.07677928, 0, 0.2313726, 1, 1,
0.3978491, -0.3805124, 0.7319446, 0, 0.227451, 1, 1,
0.399864, -0.6426813, 1.848684, 0, 0.2196078, 1, 1,
0.40019, -0.7965891, 1.580022, 0, 0.2156863, 1, 1,
0.4007285, 0.4959271, 1.591254, 0, 0.2078431, 1, 1,
0.4022779, -0.9756886, 2.056463, 0, 0.2039216, 1, 1,
0.4065246, -0.5520195, 1.848692, 0, 0.1960784, 1, 1,
0.4080913, 1.588201, 1.507058, 0, 0.1882353, 1, 1,
0.411142, 0.7700482, -0.3130805, 0, 0.1843137, 1, 1,
0.4145027, 0.1471673, 1.188739, 0, 0.1764706, 1, 1,
0.4180458, 2.014279, 0.1824623, 0, 0.172549, 1, 1,
0.4194259, -0.02700874, 2.773313, 0, 0.1647059, 1, 1,
0.4217117, 0.8227559, 0.6896016, 0, 0.1607843, 1, 1,
0.4256994, 2.002219, -1.038876, 0, 0.1529412, 1, 1,
0.4277957, 1.334624, -0.4821617, 0, 0.1490196, 1, 1,
0.4285706, -0.4924681, 3.625554, 0, 0.1411765, 1, 1,
0.4286564, -1.274477, 1.563861, 0, 0.1372549, 1, 1,
0.4323383, 1.277087, -0.1052221, 0, 0.1294118, 1, 1,
0.4325883, -0.2366964, 1.196037, 0, 0.1254902, 1, 1,
0.4346015, 1.207443, 0.6844749, 0, 0.1176471, 1, 1,
0.4380941, -0.8177915, 3.646132, 0, 0.1137255, 1, 1,
0.4423261, 0.09032557, 2.450509, 0, 0.1058824, 1, 1,
0.4443936, -0.243296, 3.217507, 0, 0.09803922, 1, 1,
0.447959, -0.7072805, 2.195821, 0, 0.09411765, 1, 1,
0.4497072, 0.1147032, 0.1396508, 0, 0.08627451, 1, 1,
0.4513457, 0.1901425, -1.076998, 0, 0.08235294, 1, 1,
0.455139, 0.6318213, 0.8528023, 0, 0.07450981, 1, 1,
0.4558619, 0.4848265, 1.294098, 0, 0.07058824, 1, 1,
0.4578671, 0.08484583, 1.044831, 0, 0.0627451, 1, 1,
0.4580356, 0.8231391, 1.03133, 0, 0.05882353, 1, 1,
0.4616423, 0.908289, 0.4010424, 0, 0.05098039, 1, 1,
0.4623636, -0.4025156, 3.102999, 0, 0.04705882, 1, 1,
0.4626432, -1.480366, 1.391147, 0, 0.03921569, 1, 1,
0.4646624, 2.413546, -0.8128091, 0, 0.03529412, 1, 1,
0.4682141, 0.2225996, 1.410608, 0, 0.02745098, 1, 1,
0.475462, 0.8511825, 1.327374, 0, 0.02352941, 1, 1,
0.4755304, 2.000074, 0.5697474, 0, 0.01568628, 1, 1,
0.4758837, -0.2447835, 1.387577, 0, 0.01176471, 1, 1,
0.4869378, -0.8300585, 3.332431, 0, 0.003921569, 1, 1,
0.4899905, 0.8479344, 2.91413, 0.003921569, 0, 1, 1,
0.4922749, 1.427125, 0.9542111, 0.007843138, 0, 1, 1,
0.4923232, 0.6657568, 3.030825, 0.01568628, 0, 1, 1,
0.4925759, 0.919947, 0.8296453, 0.01960784, 0, 1, 1,
0.4996935, -1.203591, 2.750369, 0.02745098, 0, 1, 1,
0.5068074, 0.3082671, 1.613423, 0.03137255, 0, 1, 1,
0.5115424, -0.8090129, 2.361069, 0.03921569, 0, 1, 1,
0.5122601, 1.28814, 0.2565001, 0.04313726, 0, 1, 1,
0.5218417, 1.363576, 2.248993, 0.05098039, 0, 1, 1,
0.5222414, 2.642283, 2.361201, 0.05490196, 0, 1, 1,
0.522944, -0.7432594, 1.407217, 0.0627451, 0, 1, 1,
0.5254433, 1.062848, -0.5225229, 0.06666667, 0, 1, 1,
0.5266566, -1.187124, 3.04685, 0.07450981, 0, 1, 1,
0.5270351, 1.075482, 0.361743, 0.07843138, 0, 1, 1,
0.5299231, 1.710643, -0.7078408, 0.08627451, 0, 1, 1,
0.5304529, -1.556242, 3.20003, 0.09019608, 0, 1, 1,
0.5387648, -0.424828, 2.715401, 0.09803922, 0, 1, 1,
0.5392353, -0.1859606, 0.6950817, 0.1058824, 0, 1, 1,
0.5413712, 0.048995, 0.3010188, 0.1098039, 0, 1, 1,
0.5453873, -2.278147, 2.046697, 0.1176471, 0, 1, 1,
0.5470421, -0.6551836, 3.05248, 0.1215686, 0, 1, 1,
0.5472012, -1.071061, 3.059818, 0.1294118, 0, 1, 1,
0.5536273, 0.8870328, 0.7230301, 0.1333333, 0, 1, 1,
0.557042, 1.126335, -1.012242, 0.1411765, 0, 1, 1,
0.5629352, -0.04472535, 1.897249, 0.145098, 0, 1, 1,
0.5668877, 0.3531161, -2.1415, 0.1529412, 0, 1, 1,
0.571631, 1.887436, -0.2196569, 0.1568628, 0, 1, 1,
0.5717575, -0.7341651, 3.123106, 0.1647059, 0, 1, 1,
0.5722774, 0.8974668, 0.4301341, 0.1686275, 0, 1, 1,
0.575581, -1.238228, 5.062751, 0.1764706, 0, 1, 1,
0.5819245, 0.5517071, 0.4066992, 0.1803922, 0, 1, 1,
0.583621, 0.2382698, -0.5562651, 0.1882353, 0, 1, 1,
0.5890678, 0.8826011, 0.6363809, 0.1921569, 0, 1, 1,
0.5933806, 1.00984, 1.316704, 0.2, 0, 1, 1,
0.5943403, 1.005875, 2.004947, 0.2078431, 0, 1, 1,
0.5964675, 0.9119366, 0.7549218, 0.2117647, 0, 1, 1,
0.5990072, -0.5933138, 2.728986, 0.2196078, 0, 1, 1,
0.6054557, 0.1022801, 3.738746, 0.2235294, 0, 1, 1,
0.6065047, -1.407883, 3.301136, 0.2313726, 0, 1, 1,
0.6086806, 0.239227, 0.005627702, 0.2352941, 0, 1, 1,
0.6106403, -1.374085, 2.987942, 0.2431373, 0, 1, 1,
0.6204016, 1.179291, 0.3144601, 0.2470588, 0, 1, 1,
0.622256, -1.342458, 1.060137, 0.254902, 0, 1, 1,
0.6245083, -0.5207261, 1.788872, 0.2588235, 0, 1, 1,
0.6251351, -1.294137, 2.055901, 0.2666667, 0, 1, 1,
0.6332656, 1.305797, 0.03504389, 0.2705882, 0, 1, 1,
0.6354498, -0.1267187, 1.965701, 0.2784314, 0, 1, 1,
0.6379786, 1.066264, -0.9066188, 0.282353, 0, 1, 1,
0.6414757, -0.6256074, 1.975171, 0.2901961, 0, 1, 1,
0.643762, -0.5224406, 2.393185, 0.2941177, 0, 1, 1,
0.646785, -1.655743, 2.809163, 0.3019608, 0, 1, 1,
0.6491408, -0.2446705, 2.263342, 0.3098039, 0, 1, 1,
0.6607963, -1.857203, 1.040829, 0.3137255, 0, 1, 1,
0.661027, -0.917681, 2.559089, 0.3215686, 0, 1, 1,
0.6654772, 1.481179, 2.516613, 0.3254902, 0, 1, 1,
0.6712566, -0.5616959, 1.907515, 0.3333333, 0, 1, 1,
0.6714269, 2.163336, -0.7179202, 0.3372549, 0, 1, 1,
0.681771, 1.20761, 1.12159, 0.345098, 0, 1, 1,
0.6846689, -1.061756, 2.241139, 0.3490196, 0, 1, 1,
0.6910338, -0.4983161, 2.798986, 0.3568628, 0, 1, 1,
0.6973449, 0.3929376, 0.9028355, 0.3607843, 0, 1, 1,
0.6984619, 0.7099562, 1.45033, 0.3686275, 0, 1, 1,
0.7013284, -0.6494166, 1.030323, 0.372549, 0, 1, 1,
0.7020977, 1.290087, 1.101133, 0.3803922, 0, 1, 1,
0.71135, -0.3368327, 1.958895, 0.3843137, 0, 1, 1,
0.7168824, -0.1873777, 1.830956, 0.3921569, 0, 1, 1,
0.720643, 0.8494898, 0.442619, 0.3960784, 0, 1, 1,
0.7270269, 1.466321, 0.7860129, 0.4039216, 0, 1, 1,
0.7353587, 1.431911, -0.4746856, 0.4117647, 0, 1, 1,
0.744453, 1.174662, 0.9753156, 0.4156863, 0, 1, 1,
0.7497505, -0.2379217, 1.460473, 0.4235294, 0, 1, 1,
0.7522171, 0.4218497, 1.092282, 0.427451, 0, 1, 1,
0.7541604, 1.050564, 1.241951, 0.4352941, 0, 1, 1,
0.7561259, -1.918713, 2.645819, 0.4392157, 0, 1, 1,
0.7580118, 1.314672, 1.131984, 0.4470588, 0, 1, 1,
0.7621233, -0.8650095, 1.703765, 0.4509804, 0, 1, 1,
0.7818047, -1.976643, 2.720794, 0.4588235, 0, 1, 1,
0.7825257, -0.3166249, 1.171244, 0.4627451, 0, 1, 1,
0.7847527, -0.2083563, 3.721943, 0.4705882, 0, 1, 1,
0.8054176, 0.2552968, 0.5398578, 0.4745098, 0, 1, 1,
0.8091969, 0.6229014, 2.335283, 0.4823529, 0, 1, 1,
0.8098212, -1.108847, 1.557063, 0.4862745, 0, 1, 1,
0.8110415, -2.092647, 3.208072, 0.4941176, 0, 1, 1,
0.8120026, 0.2630843, 1.42319, 0.5019608, 0, 1, 1,
0.8130478, -0.5648104, 2.426774, 0.5058824, 0, 1, 1,
0.8130488, -0.9046007, 2.196346, 0.5137255, 0, 1, 1,
0.814074, 0.777889, 2.84239, 0.5176471, 0, 1, 1,
0.8204019, -0.7236804, 2.521625, 0.5254902, 0, 1, 1,
0.829285, 0.1516895, 2.597215, 0.5294118, 0, 1, 1,
0.8328115, -1.083655, 1.359535, 0.5372549, 0, 1, 1,
0.8349804, -0.8941, 4.140514, 0.5411765, 0, 1, 1,
0.844555, -0.4405134, 2.394563, 0.5490196, 0, 1, 1,
0.8467129, 1.196363, 0.3016708, 0.5529412, 0, 1, 1,
0.8472211, 0.6612473, 0.9834439, 0.5607843, 0, 1, 1,
0.8578089, -0.9881148, 2.116234, 0.5647059, 0, 1, 1,
0.8597355, -1.521991, 1.324682, 0.572549, 0, 1, 1,
0.8624314, 1.097129, 1.591164, 0.5764706, 0, 1, 1,
0.8684177, 1.712741, 1.762924, 0.5843138, 0, 1, 1,
0.870568, -0.708582, 3.577706, 0.5882353, 0, 1, 1,
0.8798202, 0.3932361, 2.910421, 0.5960785, 0, 1, 1,
0.8807378, 1.614687, 1.031003, 0.6039216, 0, 1, 1,
0.8811314, -0.5145057, -0.05264593, 0.6078432, 0, 1, 1,
0.882872, -2.140648, 1.196735, 0.6156863, 0, 1, 1,
0.8832356, 1.042193, 1.157271, 0.6196079, 0, 1, 1,
0.8833662, -0.07673164, 1.957473, 0.627451, 0, 1, 1,
0.8907923, -0.8118285, 3.459012, 0.6313726, 0, 1, 1,
0.8909186, 0.4287825, 0.6125112, 0.6392157, 0, 1, 1,
0.8939936, -0.4374143, 2.795287, 0.6431373, 0, 1, 1,
0.8987295, 1.128171, -0.8871652, 0.6509804, 0, 1, 1,
0.9010558, 0.7867014, -0.1044225, 0.654902, 0, 1, 1,
0.9068652, -0.6355756, 2.542734, 0.6627451, 0, 1, 1,
0.9098697, -0.6349986, 2.520147, 0.6666667, 0, 1, 1,
0.9109693, 0.07958528, 1.772193, 0.6745098, 0, 1, 1,
0.915863, -0.03083551, 2.164557, 0.6784314, 0, 1, 1,
0.9182121, -1.008882, 1.319131, 0.6862745, 0, 1, 1,
0.9185219, -0.2969942, 0.9292666, 0.6901961, 0, 1, 1,
0.921464, 0.7287824, -0.04471257, 0.6980392, 0, 1, 1,
0.9244119, -1.363913, 2.431981, 0.7058824, 0, 1, 1,
0.9247355, -1.665529, 1.306994, 0.7098039, 0, 1, 1,
0.9269035, -0.08368449, 1.17182, 0.7176471, 0, 1, 1,
0.9358763, -0.534431, 2.672966, 0.7215686, 0, 1, 1,
0.9365658, -0.5817902, 1.954355, 0.7294118, 0, 1, 1,
0.9444268, 0.4441986, 2.299685, 0.7333333, 0, 1, 1,
0.9468021, -0.5251125, 1.917664, 0.7411765, 0, 1, 1,
0.9491326, -1.479987, 3.421154, 0.7450981, 0, 1, 1,
0.9560736, 0.4899762, 0.8447784, 0.7529412, 0, 1, 1,
0.9562799, 0.5955026, 0.2695283, 0.7568628, 0, 1, 1,
0.9598936, -1.009195, 2.235521, 0.7647059, 0, 1, 1,
0.9608974, 1.34166, 0.02096581, 0.7686275, 0, 1, 1,
0.9616986, 0.4318788, 1.53731, 0.7764706, 0, 1, 1,
0.9652604, -0.1068761, 0.1393148, 0.7803922, 0, 1, 1,
0.9657105, 0.4972701, 0.3178666, 0.7882353, 0, 1, 1,
0.9689862, 1.094404, 0.8048986, 0.7921569, 0, 1, 1,
0.977809, -1.675502, 3.191327, 0.8, 0, 1, 1,
0.9798045, -0.3222666, 2.627646, 0.8078431, 0, 1, 1,
0.9855419, 0.5931959, 1.302195, 0.8117647, 0, 1, 1,
0.9907959, -1.765058, 3.644357, 0.8196079, 0, 1, 1,
0.9959664, 0.152722, 0.02197044, 0.8235294, 0, 1, 1,
0.9980572, 1.361456, 0.8465757, 0.8313726, 0, 1, 1,
1.000058, -0.2075691, 1.669858, 0.8352941, 0, 1, 1,
1.001457, -1.379025, 2.464582, 0.8431373, 0, 1, 1,
1.005529, 0.01601669, 0.5711778, 0.8470588, 0, 1, 1,
1.020046, -0.5297053, 1.755786, 0.854902, 0, 1, 1,
1.020759, -0.2916328, 0.6756861, 0.8588235, 0, 1, 1,
1.023122, 0.0258666, 0.7330894, 0.8666667, 0, 1, 1,
1.028015, -3.130759, 4.095288, 0.8705882, 0, 1, 1,
1.032417, 0.7358651, -0.05554757, 0.8784314, 0, 1, 1,
1.03396, -0.9542674, 0.8126028, 0.8823529, 0, 1, 1,
1.039089, 1.770132, 1.330438, 0.8901961, 0, 1, 1,
1.042072, 0.03286063, 0.1658753, 0.8941177, 0, 1, 1,
1.044442, 1.874775, -0.4539487, 0.9019608, 0, 1, 1,
1.047389, 0.200249, -0.9151531, 0.9098039, 0, 1, 1,
1.050929, 1.393452, 0.7856513, 0.9137255, 0, 1, 1,
1.052179, 0.3679654, 2.151569, 0.9215686, 0, 1, 1,
1.053857, -0.007218543, 1.475549, 0.9254902, 0, 1, 1,
1.056769, -1.699551, 3.414371, 0.9333333, 0, 1, 1,
1.059656, -0.6814169, 1.523571, 0.9372549, 0, 1, 1,
1.060037, -0.3011153, 0.6845948, 0.945098, 0, 1, 1,
1.063213, -0.3731162, 1.952853, 0.9490196, 0, 1, 1,
1.064234, -0.1859872, -0.3040149, 0.9568627, 0, 1, 1,
1.071834, -0.9678133, 2.05512, 0.9607843, 0, 1, 1,
1.08442, 0.3648258, 1.879055, 0.9686275, 0, 1, 1,
1.093896, -1.019086, 2.156223, 0.972549, 0, 1, 1,
1.094917, -0.1581772, 1.786601, 0.9803922, 0, 1, 1,
1.095833, -1.423836, 1.208761, 0.9843137, 0, 1, 1,
1.09604, -1.1725, 1.680366, 0.9921569, 0, 1, 1,
1.09798, -0.9504352, 1.247882, 0.9960784, 0, 1, 1,
1.098464, 1.829832, 0.6468159, 1, 0, 0.9960784, 1,
1.105494, -0.1418476, 2.522376, 1, 0, 0.9882353, 1,
1.107148, 0.2844636, 1.77884, 1, 0, 0.9843137, 1,
1.10722, -1.089069, 1.630936, 1, 0, 0.9764706, 1,
1.112354, 0.1458811, 2.803419, 1, 0, 0.972549, 1,
1.122689, 0.002918171, 0.8226063, 1, 0, 0.9647059, 1,
1.127635, 0.6770023, 2.121115, 1, 0, 0.9607843, 1,
1.128917, 1.119299, 1.587039, 1, 0, 0.9529412, 1,
1.142308, 1.72227, 0.5120685, 1, 0, 0.9490196, 1,
1.143932, 2.582211, 0.5760926, 1, 0, 0.9411765, 1,
1.14607, -1.113804, 2.497967, 1, 0, 0.9372549, 1,
1.146708, 0.4226378, 0.3896873, 1, 0, 0.9294118, 1,
1.15422, -0.6956865, 2.116264, 1, 0, 0.9254902, 1,
1.155752, 1.79452, -0.5031965, 1, 0, 0.9176471, 1,
1.156551, 1.639578, 1.163797, 1, 0, 0.9137255, 1,
1.158678, 0.5082247, 0.9540232, 1, 0, 0.9058824, 1,
1.165309, 0.5170414, 1.087814, 1, 0, 0.9019608, 1,
1.170242, 1.030004, 0.4951271, 1, 0, 0.8941177, 1,
1.173593, -0.7046653, 1.145274, 1, 0, 0.8862745, 1,
1.175932, 1.253653, 0.9728901, 1, 0, 0.8823529, 1,
1.178026, -1.260247, 3.360401, 1, 0, 0.8745098, 1,
1.179856, -1.214211, 1.443032, 1, 0, 0.8705882, 1,
1.184759, 0.8099315, 1.552501, 1, 0, 0.8627451, 1,
1.18565, 0.6955919, 1.681062, 1, 0, 0.8588235, 1,
1.191529, 0.9439096, 1.225242, 1, 0, 0.8509804, 1,
1.192015, -0.2305852, 1.653016, 1, 0, 0.8470588, 1,
1.199653, 1.228434, -0.3582365, 1, 0, 0.8392157, 1,
1.204209, 0.4766911, 0.532246, 1, 0, 0.8352941, 1,
1.208061, -0.1634707, 2.338315, 1, 0, 0.827451, 1,
1.215215, -1.449205, 2.803104, 1, 0, 0.8235294, 1,
1.220744, -0.2802514, 1.417582, 1, 0, 0.8156863, 1,
1.227114, 0.4475426, 0.8174314, 1, 0, 0.8117647, 1,
1.228919, -0.5026869, 2.746365, 1, 0, 0.8039216, 1,
1.230116, -0.8523018, 2.65408, 1, 0, 0.7960784, 1,
1.230118, -0.6705704, 2.451251, 1, 0, 0.7921569, 1,
1.245685, 0.09866673, -0.03704755, 1, 0, 0.7843137, 1,
1.247576, 0.9236527, 0.9360316, 1, 0, 0.7803922, 1,
1.25031, -0.3468443, 1.393135, 1, 0, 0.772549, 1,
1.255441, 0.4963253, 0.4485705, 1, 0, 0.7686275, 1,
1.257645, 0.1615205, 2.213408, 1, 0, 0.7607843, 1,
1.257901, -0.7773887, 3.014768, 1, 0, 0.7568628, 1,
1.259094, -1.539654, 1.441585, 1, 0, 0.7490196, 1,
1.267409, 0.7480624, 1.955905, 1, 0, 0.7450981, 1,
1.268487, 2.701236, 0.7524593, 1, 0, 0.7372549, 1,
1.273255, 1.203589, -0.5393298, 1, 0, 0.7333333, 1,
1.273581, -1.067968, 2.802673, 1, 0, 0.7254902, 1,
1.285604, 0.1918675, 1.952216, 1, 0, 0.7215686, 1,
1.285959, 0.1958362, 1.11602, 1, 0, 0.7137255, 1,
1.289027, -1.039958, 2.599501, 1, 0, 0.7098039, 1,
1.291166, -0.2471824, 2.623108, 1, 0, 0.7019608, 1,
1.29252, 0.3607901, 1.951537, 1, 0, 0.6941177, 1,
1.29356, -2.365351, 2.336972, 1, 0, 0.6901961, 1,
1.298239, 1.081145, 0.4620732, 1, 0, 0.682353, 1,
1.301032, -0.9819061, 1.91209, 1, 0, 0.6784314, 1,
1.302462, -0.09019969, 0.02818055, 1, 0, 0.6705883, 1,
1.304084, -0.9772905, 1.697892, 1, 0, 0.6666667, 1,
1.305485, 0.6837053, 0.5700517, 1, 0, 0.6588235, 1,
1.30709, 0.3718538, 0.02680495, 1, 0, 0.654902, 1,
1.311132, -0.1670709, 1.606989, 1, 0, 0.6470588, 1,
1.313705, -0.1720252, 1.127848, 1, 0, 0.6431373, 1,
1.314519, -0.01209363, 2.611915, 1, 0, 0.6352941, 1,
1.315666, -0.6743716, 2.134997, 1, 0, 0.6313726, 1,
1.317652, 0.1021499, 2.65285, 1, 0, 0.6235294, 1,
1.319258, 0.2703847, 1.265237, 1, 0, 0.6196079, 1,
1.322781, 1.134558, -0.3527899, 1, 0, 0.6117647, 1,
1.324358, -1.415456, 1.050063, 1, 0, 0.6078432, 1,
1.328024, 0.7369621, 0.3147142, 1, 0, 0.6, 1,
1.337922, 0.05669515, 0.6277099, 1, 0, 0.5921569, 1,
1.348252, -0.6412914, 0.5388409, 1, 0, 0.5882353, 1,
1.356364, 2.644288, -0.3972351, 1, 0, 0.5803922, 1,
1.357116, -0.4385676, 2.388974, 1, 0, 0.5764706, 1,
1.359528, -0.879024, 1.379349, 1, 0, 0.5686275, 1,
1.366203, 0.5836561, -0.02320402, 1, 0, 0.5647059, 1,
1.367958, -0.149282, 3.655158, 1, 0, 0.5568628, 1,
1.36834, -1.503432, 1.259843, 1, 0, 0.5529412, 1,
1.369465, -2.061705, 4.050378, 1, 0, 0.5450981, 1,
1.373232, 0.1537445, 1.404916, 1, 0, 0.5411765, 1,
1.382757, 0.5726749, 1.399823, 1, 0, 0.5333334, 1,
1.386789, -2.078692, 1.948306, 1, 0, 0.5294118, 1,
1.390913, -0.3840294, 1.163469, 1, 0, 0.5215687, 1,
1.393638, -1.061543, 2.127361, 1, 0, 0.5176471, 1,
1.398424, -0.2239064, 0.8313426, 1, 0, 0.509804, 1,
1.404481, -0.3581314, 2.111779, 1, 0, 0.5058824, 1,
1.404496, 0.4259423, 1.203003, 1, 0, 0.4980392, 1,
1.416583, -1.395595, 2.785903, 1, 0, 0.4901961, 1,
1.417636, 0.6225581, 0.7643545, 1, 0, 0.4862745, 1,
1.419303, -0.5364836, 0.8280112, 1, 0, 0.4784314, 1,
1.425374, -0.1898947, 3.163162, 1, 0, 0.4745098, 1,
1.429824, -0.4727945, -0.8427233, 1, 0, 0.4666667, 1,
1.433943, -0.6018562, 2.58659, 1, 0, 0.4627451, 1,
1.437627, 1.075972, 0.6797763, 1, 0, 0.454902, 1,
1.437769, -0.838308, 1.929206, 1, 0, 0.4509804, 1,
1.439309, 1.40059, -0.4134371, 1, 0, 0.4431373, 1,
1.456764, -0.5659814, 1.715649, 1, 0, 0.4392157, 1,
1.461199, 0.09470971, 2.27365, 1, 0, 0.4313726, 1,
1.472841, 1.895262, 1.98374, 1, 0, 0.427451, 1,
1.47754, 0.2153419, 1.697585, 1, 0, 0.4196078, 1,
1.514007, 0.1107459, -0.2393887, 1, 0, 0.4156863, 1,
1.517119, 0.07154224, 2.200272, 1, 0, 0.4078431, 1,
1.54368, -1.520362, 2.010298, 1, 0, 0.4039216, 1,
1.550117, 0.1550304, 2.15888, 1, 0, 0.3960784, 1,
1.557136, -0.8217624, 3.263185, 1, 0, 0.3882353, 1,
1.570411, 0.3180212, 2.358242, 1, 0, 0.3843137, 1,
1.575092, 0.1241523, 1.092127, 1, 0, 0.3764706, 1,
1.577513, -1.609708, 4.522461, 1, 0, 0.372549, 1,
1.589869, 0.2580883, 0.743553, 1, 0, 0.3647059, 1,
1.590425, -0.9493808, 1.143389, 1, 0, 0.3607843, 1,
1.618552, -0.5746848, 1.044913, 1, 0, 0.3529412, 1,
1.619467, -0.09094511, 1.479944, 1, 0, 0.3490196, 1,
1.624291, -1.166336, 2.108236, 1, 0, 0.3411765, 1,
1.63995, 0.3924677, 1.610931, 1, 0, 0.3372549, 1,
1.658159, 0.3044809, 1.258375, 1, 0, 0.3294118, 1,
1.66773, 1.374172, 1.352706, 1, 0, 0.3254902, 1,
1.679582, -0.62164, 2.482084, 1, 0, 0.3176471, 1,
1.696836, 1.47482, 1.55451, 1, 0, 0.3137255, 1,
1.714816, 0.9382297, 2.055466, 1, 0, 0.3058824, 1,
1.726279, -0.4240949, -0.1448314, 1, 0, 0.2980392, 1,
1.726367, -0.7522634, 2.179096, 1, 0, 0.2941177, 1,
1.742207, 2.232239, 0.4196576, 1, 0, 0.2862745, 1,
1.742641, 0.4340726, 0.8046794, 1, 0, 0.282353, 1,
1.74303, -1.879516, 3.190605, 1, 0, 0.2745098, 1,
1.755387, 1.672186, 0.4989673, 1, 0, 0.2705882, 1,
1.762601, 1.690789, -0.1259177, 1, 0, 0.2627451, 1,
1.774741, -0.5840409, 1.522435, 1, 0, 0.2588235, 1,
1.790023, 0.09494349, 2.119494, 1, 0, 0.2509804, 1,
1.794109, -0.3937785, 2.036658, 1, 0, 0.2470588, 1,
1.835821, 1.078675, 0.08549108, 1, 0, 0.2392157, 1,
1.837876, -0.1907352, 2.757535, 1, 0, 0.2352941, 1,
1.839088, -1.078611, 1.276603, 1, 0, 0.227451, 1,
1.840658, 0.9595991, 0.8004627, 1, 0, 0.2235294, 1,
1.847461, 0.6024075, -0.006501473, 1, 0, 0.2156863, 1,
1.854455, -1.444322, 1.257777, 1, 0, 0.2117647, 1,
1.859163, 1.112696, 1.907425, 1, 0, 0.2039216, 1,
1.859765, -0.3463159, 2.260788, 1, 0, 0.1960784, 1,
1.860441, -1.062405, 1.340273, 1, 0, 0.1921569, 1,
1.865271, -0.4455968, 1.525957, 1, 0, 0.1843137, 1,
1.891029, 1.177448, 1.861987, 1, 0, 0.1803922, 1,
1.899469, -0.00202546, 4.30636, 1, 0, 0.172549, 1,
1.902926, 1.082735, 1.386532, 1, 0, 0.1686275, 1,
1.93178, -0.809271, 2.67511, 1, 0, 0.1607843, 1,
1.951214, -1.279237, 3.285297, 1, 0, 0.1568628, 1,
1.95154, -1.638693, 2.616902, 1, 0, 0.1490196, 1,
1.953925, -1.997898, 2.029623, 1, 0, 0.145098, 1,
1.955113, -0.901155, 2.477355, 1, 0, 0.1372549, 1,
1.974017, 1.382923, 1.365979, 1, 0, 0.1333333, 1,
1.97435, -1.126758, 3.618086, 1, 0, 0.1254902, 1,
1.99531, -1.36619, 2.781325, 1, 0, 0.1215686, 1,
1.998732, 2.155291, 0.9358436, 1, 0, 0.1137255, 1,
2.043763, -1.507734, 2.748454, 1, 0, 0.1098039, 1,
2.058751, -1.720209, -0.01626513, 1, 0, 0.1019608, 1,
2.062891, -0.09356156, 0.6315405, 1, 0, 0.09411765, 1,
2.072398, -0.9315903, 0.8889798, 1, 0, 0.09019608, 1,
2.086597, 0.7484777, 1.905512, 1, 0, 0.08235294, 1,
2.120049, 0.4823666, 1.867295, 1, 0, 0.07843138, 1,
2.179998, -0.9643142, 1.416128, 1, 0, 0.07058824, 1,
2.232206, 0.1506674, 0.7800664, 1, 0, 0.06666667, 1,
2.236975, 1.087099, -0.04200183, 1, 0, 0.05882353, 1,
2.303045, -0.07622679, 2.009899, 1, 0, 0.05490196, 1,
2.34445, -0.6144791, 2.722879, 1, 0, 0.04705882, 1,
2.396926, -0.9030507, 1.507877, 1, 0, 0.04313726, 1,
2.466542, 0.1751595, 1.940182, 1, 0, 0.03529412, 1,
2.559125, -0.6513107, 1.220419, 1, 0, 0.03137255, 1,
2.650029, -0.485208, 2.337504, 1, 0, 0.02352941, 1,
2.796681, -0.1757862, -0.4047909, 1, 0, 0.01960784, 1,
3.004371, 0.4164008, 1.735782, 1, 0, 0.01176471, 1,
3.428868, -0.4507764, 2.296455, 1, 0, 0.007843138, 1
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
0.1730025, -4.14527, -6.967002, 0, -0.5, 0.5, 0.5,
0.1730025, -4.14527, -6.967002, 1, -0.5, 0.5, 0.5,
0.1730025, -4.14527, -6.967002, 1, 1.5, 0.5, 0.5,
0.1730025, -4.14527, -6.967002, 0, 1.5, 0.5, 0.5
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
-4.186602, -0.1381041, -6.967002, 0, -0.5, 0.5, 0.5,
-4.186602, -0.1381041, -6.967002, 1, -0.5, 0.5, 0.5,
-4.186602, -0.1381041, -6.967002, 1, 1.5, 0.5, 0.5,
-4.186602, -0.1381041, -6.967002, 0, 1.5, 0.5, 0.5
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
-4.186602, -4.14527, -0.08036733, 0, -0.5, 0.5, 0.5,
-4.186602, -4.14527, -0.08036733, 1, -0.5, 0.5, 0.5,
-4.186602, -4.14527, -0.08036733, 1, 1.5, 0.5, 0.5,
-4.186602, -4.14527, -0.08036733, 0, 1.5, 0.5, 0.5
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
-3, -3.220539, -5.377779,
3, -3.220539, -5.377779,
-3, -3.220539, -5.377779,
-3, -3.374661, -5.64265,
-2, -3.220539, -5.377779,
-2, -3.374661, -5.64265,
-1, -3.220539, -5.377779,
-1, -3.374661, -5.64265,
0, -3.220539, -5.377779,
0, -3.374661, -5.64265,
1, -3.220539, -5.377779,
1, -3.374661, -5.64265,
2, -3.220539, -5.377779,
2, -3.374661, -5.64265,
3, -3.220539, -5.377779,
3, -3.374661, -5.64265
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
-3, -3.682904, -6.172391, 0, -0.5, 0.5, 0.5,
-3, -3.682904, -6.172391, 1, -0.5, 0.5, 0.5,
-3, -3.682904, -6.172391, 1, 1.5, 0.5, 0.5,
-3, -3.682904, -6.172391, 0, 1.5, 0.5, 0.5,
-2, -3.682904, -6.172391, 0, -0.5, 0.5, 0.5,
-2, -3.682904, -6.172391, 1, -0.5, 0.5, 0.5,
-2, -3.682904, -6.172391, 1, 1.5, 0.5, 0.5,
-2, -3.682904, -6.172391, 0, 1.5, 0.5, 0.5,
-1, -3.682904, -6.172391, 0, -0.5, 0.5, 0.5,
-1, -3.682904, -6.172391, 1, -0.5, 0.5, 0.5,
-1, -3.682904, -6.172391, 1, 1.5, 0.5, 0.5,
-1, -3.682904, -6.172391, 0, 1.5, 0.5, 0.5,
0, -3.682904, -6.172391, 0, -0.5, 0.5, 0.5,
0, -3.682904, -6.172391, 1, -0.5, 0.5, 0.5,
0, -3.682904, -6.172391, 1, 1.5, 0.5, 0.5,
0, -3.682904, -6.172391, 0, 1.5, 0.5, 0.5,
1, -3.682904, -6.172391, 0, -0.5, 0.5, 0.5,
1, -3.682904, -6.172391, 1, -0.5, 0.5, 0.5,
1, -3.682904, -6.172391, 1, 1.5, 0.5, 0.5,
1, -3.682904, -6.172391, 0, 1.5, 0.5, 0.5,
2, -3.682904, -6.172391, 0, -0.5, 0.5, 0.5,
2, -3.682904, -6.172391, 1, -0.5, 0.5, 0.5,
2, -3.682904, -6.172391, 1, 1.5, 0.5, 0.5,
2, -3.682904, -6.172391, 0, 1.5, 0.5, 0.5,
3, -3.682904, -6.172391, 0, -0.5, 0.5, 0.5,
3, -3.682904, -6.172391, 1, -0.5, 0.5, 0.5,
3, -3.682904, -6.172391, 1, 1.5, 0.5, 0.5,
3, -3.682904, -6.172391, 0, 1.5, 0.5, 0.5
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
-3.180539, -3, -5.377779,
-3.180539, 2, -5.377779,
-3.180539, -3, -5.377779,
-3.348216, -3, -5.64265,
-3.180539, -2, -5.377779,
-3.348216, -2, -5.64265,
-3.180539, -1, -5.377779,
-3.348216, -1, -5.64265,
-3.180539, 0, -5.377779,
-3.348216, 0, -5.64265,
-3.180539, 1, -5.377779,
-3.348216, 1, -5.64265,
-3.180539, 2, -5.377779,
-3.348216, 2, -5.64265
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
-3.68357, -3, -6.172391, 0, -0.5, 0.5, 0.5,
-3.68357, -3, -6.172391, 1, -0.5, 0.5, 0.5,
-3.68357, -3, -6.172391, 1, 1.5, 0.5, 0.5,
-3.68357, -3, -6.172391, 0, 1.5, 0.5, 0.5,
-3.68357, -2, -6.172391, 0, -0.5, 0.5, 0.5,
-3.68357, -2, -6.172391, 1, -0.5, 0.5, 0.5,
-3.68357, -2, -6.172391, 1, 1.5, 0.5, 0.5,
-3.68357, -2, -6.172391, 0, 1.5, 0.5, 0.5,
-3.68357, -1, -6.172391, 0, -0.5, 0.5, 0.5,
-3.68357, -1, -6.172391, 1, -0.5, 0.5, 0.5,
-3.68357, -1, -6.172391, 1, 1.5, 0.5, 0.5,
-3.68357, -1, -6.172391, 0, 1.5, 0.5, 0.5,
-3.68357, 0, -6.172391, 0, -0.5, 0.5, 0.5,
-3.68357, 0, -6.172391, 1, -0.5, 0.5, 0.5,
-3.68357, 0, -6.172391, 1, 1.5, 0.5, 0.5,
-3.68357, 0, -6.172391, 0, 1.5, 0.5, 0.5,
-3.68357, 1, -6.172391, 0, -0.5, 0.5, 0.5,
-3.68357, 1, -6.172391, 1, -0.5, 0.5, 0.5,
-3.68357, 1, -6.172391, 1, 1.5, 0.5, 0.5,
-3.68357, 1, -6.172391, 0, 1.5, 0.5, 0.5,
-3.68357, 2, -6.172391, 0, -0.5, 0.5, 0.5,
-3.68357, 2, -6.172391, 1, -0.5, 0.5, 0.5,
-3.68357, 2, -6.172391, 1, 1.5, 0.5, 0.5,
-3.68357, 2, -6.172391, 0, 1.5, 0.5, 0.5
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
-3.180539, -3.220539, -4,
-3.180539, -3.220539, 4,
-3.180539, -3.220539, -4,
-3.348216, -3.374661, -4,
-3.180539, -3.220539, -2,
-3.348216, -3.374661, -2,
-3.180539, -3.220539, 0,
-3.348216, -3.374661, 0,
-3.180539, -3.220539, 2,
-3.348216, -3.374661, 2,
-3.180539, -3.220539, 4,
-3.348216, -3.374661, 4
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
-3.68357, -3.682904, -4, 0, -0.5, 0.5, 0.5,
-3.68357, -3.682904, -4, 1, -0.5, 0.5, 0.5,
-3.68357, -3.682904, -4, 1, 1.5, 0.5, 0.5,
-3.68357, -3.682904, -4, 0, 1.5, 0.5, 0.5,
-3.68357, -3.682904, -2, 0, -0.5, 0.5, 0.5,
-3.68357, -3.682904, -2, 1, -0.5, 0.5, 0.5,
-3.68357, -3.682904, -2, 1, 1.5, 0.5, 0.5,
-3.68357, -3.682904, -2, 0, 1.5, 0.5, 0.5,
-3.68357, -3.682904, 0, 0, -0.5, 0.5, 0.5,
-3.68357, -3.682904, 0, 1, -0.5, 0.5, 0.5,
-3.68357, -3.682904, 0, 1, 1.5, 0.5, 0.5,
-3.68357, -3.682904, 0, 0, 1.5, 0.5, 0.5,
-3.68357, -3.682904, 2, 0, -0.5, 0.5, 0.5,
-3.68357, -3.682904, 2, 1, -0.5, 0.5, 0.5,
-3.68357, -3.682904, 2, 1, 1.5, 0.5, 0.5,
-3.68357, -3.682904, 2, 0, 1.5, 0.5, 0.5,
-3.68357, -3.682904, 4, 0, -0.5, 0.5, 0.5,
-3.68357, -3.682904, 4, 1, -0.5, 0.5, 0.5,
-3.68357, -3.682904, 4, 1, 1.5, 0.5, 0.5,
-3.68357, -3.682904, 4, 0, 1.5, 0.5, 0.5
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
-3.180539, -3.220539, -5.377779,
-3.180539, 2.944331, -5.377779,
-3.180539, -3.220539, 5.217044,
-3.180539, 2.944331, 5.217044,
-3.180539, -3.220539, -5.377779,
-3.180539, -3.220539, 5.217044,
-3.180539, 2.944331, -5.377779,
-3.180539, 2.944331, 5.217044,
-3.180539, -3.220539, -5.377779,
3.526544, -3.220539, -5.377779,
-3.180539, -3.220539, 5.217044,
3.526544, -3.220539, 5.217044,
-3.180539, 2.944331, -5.377779,
3.526544, 2.944331, -5.377779,
-3.180539, 2.944331, 5.217044,
3.526544, 2.944331, 5.217044,
3.526544, -3.220539, -5.377779,
3.526544, 2.944331, -5.377779,
3.526544, -3.220539, 5.217044,
3.526544, 2.944331, 5.217044,
3.526544, -3.220539, -5.377779,
3.526544, -3.220539, 5.217044,
3.526544, 2.944331, -5.377779,
3.526544, 2.944331, 5.217044
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
var radius = 7.461237;
var distance = 33.19588;
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
mvMatrix.translate( -0.1730025, 0.1381041, 0.08036733 );
mvMatrix.scale( 1.202793, 1.308582, 0.7614318 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.19588);
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
phosphoramidite<-read.table("phosphoramidite.xyz")
```

```
## Error in read.table("phosphoramidite.xyz"): no lines available in input
```

```r
x<-phosphoramidite$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidite' not found
```

```r
y<-phosphoramidite$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidite' not found
```

```r
z<-phosphoramidite$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidite' not found
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
-3.082863, 0.8235334, -1.096305, 0, 0, 1, 1, 1,
-3.047042, 0.07981467, -2.476254, 1, 0, 0, 1, 1,
-2.890885, -0.2481663, -0.2753596, 1, 0, 0, 1, 1,
-2.876923, 0.9232994, -1.917608, 1, 0, 0, 1, 1,
-2.809417, 0.424126, -1.649005, 1, 0, 0, 1, 1,
-2.697566, -0.05322349, -2.212694, 1, 0, 0, 1, 1,
-2.522533, -0.2198438, -3.583139, 0, 0, 0, 1, 1,
-2.522528, -0.1675283, -1.481628, 0, 0, 0, 1, 1,
-2.505521, 0.2879164, -0.1369157, 0, 0, 0, 1, 1,
-2.473069, 0.5156705, -0.3556698, 0, 0, 0, 1, 1,
-2.467129, 1.429859, -1.843567, 0, 0, 0, 1, 1,
-2.414252, 0.5383226, -1.297682, 0, 0, 0, 1, 1,
-2.385387, -0.4382737, -2.181408, 0, 0, 0, 1, 1,
-2.31828, -0.9415605, -2.57589, 1, 1, 1, 1, 1,
-2.302953, -0.3713337, -2.75462, 1, 1, 1, 1, 1,
-2.288228, -1.59371, -5.016815, 1, 1, 1, 1, 1,
-2.278312, 1.320394, -0.4462675, 1, 1, 1, 1, 1,
-2.263036, 0.5485415, -3.566125, 1, 1, 1, 1, 1,
-2.205484, -0.489414, -0.6100183, 1, 1, 1, 1, 1,
-2.204631, -2.417145, -0.6867833, 1, 1, 1, 1, 1,
-2.167015, 0.4696954, -1.126539, 1, 1, 1, 1, 1,
-2.152323, 0.6972468, -2.35078, 1, 1, 1, 1, 1,
-2.138819, -2.248069, -1.210322, 1, 1, 1, 1, 1,
-2.134232, -1.284938, -2.644327, 1, 1, 1, 1, 1,
-2.062337, 0.6043787, -1.784114, 1, 1, 1, 1, 1,
-2.050305, 1.211982, -2.393384, 1, 1, 1, 1, 1,
-2.027867, -0.9847834, -3.224605, 1, 1, 1, 1, 1,
-2.025505, 0.1454897, -1.709903, 1, 1, 1, 1, 1,
-1.991945, 1.912308, -0.859415, 0, 0, 1, 1, 1,
-1.977917, 1.001398, -3.349899, 1, 0, 0, 1, 1,
-1.953376, -1.273765, -2.775957, 1, 0, 0, 1, 1,
-1.896528, 2.325023, -2.340056, 1, 0, 0, 1, 1,
-1.894034, -1.339958, -2.510079, 1, 0, 0, 1, 1,
-1.876332, 0.6771668, -2.614718, 1, 0, 0, 1, 1,
-1.837574, 1.675389, -2.068833, 0, 0, 0, 1, 1,
-1.792308, -1.081918, -2.172917, 0, 0, 0, 1, 1,
-1.78955, -1.232196, -0.6576977, 0, 0, 0, 1, 1,
-1.738966, 1.407195, -1.098983, 0, 0, 0, 1, 1,
-1.704088, 0.643192, -2.169482, 0, 0, 0, 1, 1,
-1.698051, 0.6777, -2.546837, 0, 0, 0, 1, 1,
-1.677103, 0.8549687, -1.972249, 0, 0, 0, 1, 1,
-1.675355, -0.158084, -2.192638, 1, 1, 1, 1, 1,
-1.674173, 1.304982, -1.946021, 1, 1, 1, 1, 1,
-1.670744, 0.4201938, -0.6270081, 1, 1, 1, 1, 1,
-1.628457, 0.2866493, -3.508059, 1, 1, 1, 1, 1,
-1.623601, 0.8483877, -1.720034, 1, 1, 1, 1, 1,
-1.618625, 2.349924, -2.879772, 1, 1, 1, 1, 1,
-1.601387, -0.9137394, 0.1382473, 1, 1, 1, 1, 1,
-1.596202, -1.168023, -2.319816, 1, 1, 1, 1, 1,
-1.595389, 0.7355044, -0.4480815, 1, 1, 1, 1, 1,
-1.585522, -0.4458823, -2.355475, 1, 1, 1, 1, 1,
-1.583138, 0.7654932, -4.26424, 1, 1, 1, 1, 1,
-1.576651, -1.223323, -2.762053, 1, 1, 1, 1, 1,
-1.560342, -0.9956762, -3.078566, 1, 1, 1, 1, 1,
-1.533486, 1.507857, -0.8630641, 1, 1, 1, 1, 1,
-1.524749, -1.158987, -4.432885, 1, 1, 1, 1, 1,
-1.52397, -0.6870449, -2.133888, 0, 0, 1, 1, 1,
-1.52327, -0.5719416, -0.2234435, 1, 0, 0, 1, 1,
-1.519479, 0.8379697, -1.335891, 1, 0, 0, 1, 1,
-1.513786, -1.622611, -3.23905, 1, 0, 0, 1, 1,
-1.50975, 0.2745511, -0.7083147, 1, 0, 0, 1, 1,
-1.505756, 0.2211022, -3.385739, 1, 0, 0, 1, 1,
-1.486668, -1.534873, -0.3403729, 0, 0, 0, 1, 1,
-1.486663, 0.9846395, -1.365365, 0, 0, 0, 1, 1,
-1.471217, -0.9438645, -1.50087, 0, 0, 0, 1, 1,
-1.456971, 0.227266, -1.651511, 0, 0, 0, 1, 1,
-1.455061, 0.9305041, -1.192782, 0, 0, 0, 1, 1,
-1.454964, 0.5156306, -1.487923, 0, 0, 0, 1, 1,
-1.443406, 0.8049743, -0.08194923, 0, 0, 0, 1, 1,
-1.43912, -0.4136515, -2.784555, 1, 1, 1, 1, 1,
-1.43224, -0.5721776, -1.743018, 1, 1, 1, 1, 1,
-1.41966, -0.05483986, -2.08219, 1, 1, 1, 1, 1,
-1.417244, -1.835381, -2.29152, 1, 1, 1, 1, 1,
-1.415452, 1.76441, 0.1355129, 1, 1, 1, 1, 1,
-1.393579, 2.677732, -1.742388, 1, 1, 1, 1, 1,
-1.386455, 0.09393041, -1.431589, 1, 1, 1, 1, 1,
-1.35441, 0.557885, -0.4123468, 1, 1, 1, 1, 1,
-1.338377, 1.092025, -2.051562, 1, 1, 1, 1, 1,
-1.327822, 0.6104776, -0.8339139, 1, 1, 1, 1, 1,
-1.325548, 0.4209619, -2.156159, 1, 1, 1, 1, 1,
-1.323384, -0.7463073, -2.478196, 1, 1, 1, 1, 1,
-1.32183, 1.305104, -1.095766, 1, 1, 1, 1, 1,
-1.319492, 0.3233029, -0.8054129, 1, 1, 1, 1, 1,
-1.31568, 1.754296, 1.551176, 1, 1, 1, 1, 1,
-1.313995, 0.676261, -0.8529933, 0, 0, 1, 1, 1,
-1.31382, 1.610752, -1.314795, 1, 0, 0, 1, 1,
-1.297718, -0.521695, -2.661231, 1, 0, 0, 1, 1,
-1.296097, 1.039873, 2.203509, 1, 0, 0, 1, 1,
-1.296051, 0.01573543, -1.310227, 1, 0, 0, 1, 1,
-1.294061, -0.02419733, -1.215302, 1, 0, 0, 1, 1,
-1.273692, -0.5267813, -1.155933, 0, 0, 0, 1, 1,
-1.273575, -0.4035104, -2.451933, 0, 0, 0, 1, 1,
-1.271551, 2.69972, -0.1048023, 0, 0, 0, 1, 1,
-1.268119, 1.667417, -1.334698, 0, 0, 0, 1, 1,
-1.266515, -1.270908, -1.105906, 0, 0, 0, 1, 1,
-1.26603, -0.9183597, -1.862856, 0, 0, 0, 1, 1,
-1.265407, 0.4288658, 1.165752, 0, 0, 0, 1, 1,
-1.263174, -0.8494791, -2.798583, 1, 1, 1, 1, 1,
-1.261797, -1.582824, -3.218163, 1, 1, 1, 1, 1,
-1.258793, 0.5152454, -2.655807, 1, 1, 1, 1, 1,
-1.249875, 0.9159803, -0.4804932, 1, 1, 1, 1, 1,
-1.248303, 0.05290106, -2.360425, 1, 1, 1, 1, 1,
-1.241106, -0.6118501, -1.902621, 1, 1, 1, 1, 1,
-1.229623, -1.160597, -0.7304786, 1, 1, 1, 1, 1,
-1.221332, -0.09365508, -1.392609, 1, 1, 1, 1, 1,
-1.221257, 0.6488889, -2.973925, 1, 1, 1, 1, 1,
-1.217176, -0.2362118, -1.985919, 1, 1, 1, 1, 1,
-1.207534, 0.2822791, -1.719104, 1, 1, 1, 1, 1,
-1.198261, -0.1601694, -1.424854, 1, 1, 1, 1, 1,
-1.192215, -2.342287, -3.172648, 1, 1, 1, 1, 1,
-1.18761, 0.5968505, -2.447398, 1, 1, 1, 1, 1,
-1.186882, 0.3307418, -0.9504544, 1, 1, 1, 1, 1,
-1.185806, 1.80891, -0.0684258, 0, 0, 1, 1, 1,
-1.184638, -1.767118, -1.756997, 1, 0, 0, 1, 1,
-1.182578, -0.9735875, -3.385952, 1, 0, 0, 1, 1,
-1.181637, 1.364971, -1.32352, 1, 0, 0, 1, 1,
-1.181573, -0.1681301, -2.617232, 1, 0, 0, 1, 1,
-1.164855, -0.2791424, -1.728083, 1, 0, 0, 1, 1,
-1.164535, 1.055136, -1.673087, 0, 0, 0, 1, 1,
-1.163954, -0.5047269, -3.533404, 0, 0, 0, 1, 1,
-1.163226, -0.7820575, -2.041794, 0, 0, 0, 1, 1,
-1.144355, -1.96384, -1.655698, 0, 0, 0, 1, 1,
-1.138557, -1.103919, -1.619613, 0, 0, 0, 1, 1,
-1.138488, 1.248102, -1.477008, 0, 0, 0, 1, 1,
-1.113075, -2.159997, -2.381135, 0, 0, 0, 1, 1,
-1.109405, -0.724367, -2.682382, 1, 1, 1, 1, 1,
-1.104394, 1.452211, -0.1216308, 1, 1, 1, 1, 1,
-1.093512, -0.4581533, -1.199216, 1, 1, 1, 1, 1,
-1.09046, 0.6193344, -0.4613711, 1, 1, 1, 1, 1,
-1.089934, -0.7943941, -0.6147471, 1, 1, 1, 1, 1,
-1.083392, 0.5086623, -0.559897, 1, 1, 1, 1, 1,
-1.077765, 0.7001281, -0.9638324, 1, 1, 1, 1, 1,
-1.077475, -0.2844133, -0.3714005, 1, 1, 1, 1, 1,
-1.073634, -0.08355252, -2.500329, 1, 1, 1, 1, 1,
-1.067122, -0.6624976, -2.322586, 1, 1, 1, 1, 1,
-1.06577, 0.6379761, -2.441018, 1, 1, 1, 1, 1,
-1.063817, -1.015753, -1.919487, 1, 1, 1, 1, 1,
-1.056553, -1.157787, -3.158371, 1, 1, 1, 1, 1,
-1.044298, 0.5278547, 0.2860577, 1, 1, 1, 1, 1,
-1.040243, -1.124048, -3.173157, 1, 1, 1, 1, 1,
-1.039215, 0.8899634, -0.6716242, 0, 0, 1, 1, 1,
-1.038326, 0.9707207, -1.768965, 1, 0, 0, 1, 1,
-1.038087, 1.130655, 0.6854807, 1, 0, 0, 1, 1,
-1.032818, 1.311253, 0.2169465, 1, 0, 0, 1, 1,
-1.031906, -1.40559, -0.2313861, 1, 0, 0, 1, 1,
-1.031226, 0.8998107, -1.180441, 1, 0, 0, 1, 1,
-1.028752, -1.475588, -0.9109349, 0, 0, 0, 1, 1,
-1.017236, 2.016993, -0.9801098, 0, 0, 0, 1, 1,
-1.009742, 0.2445939, -1.644155, 0, 0, 0, 1, 1,
-1.004794, -0.2063726, -0.6270099, 0, 0, 0, 1, 1,
-0.9889185, -1.608674, -2.042362, 0, 0, 0, 1, 1,
-0.9754841, 0.921595, -0.06600838, 0, 0, 0, 1, 1,
-0.974023, -0.4232002, -2.918867, 0, 0, 0, 1, 1,
-0.9731473, -0.007620859, -2.086953, 1, 1, 1, 1, 1,
-0.968122, -1.37624, -2.361252, 1, 1, 1, 1, 1,
-0.9529349, -0.3814928, -4.183382, 1, 1, 1, 1, 1,
-0.9523252, 0.5528094, -2.331896, 1, 1, 1, 1, 1,
-0.9513044, -0.9429444, -2.242484, 1, 1, 1, 1, 1,
-0.9490909, -0.5629683, -2.137281, 1, 1, 1, 1, 1,
-0.9453529, -0.1668472, -2.017454, 1, 1, 1, 1, 1,
-0.9429898, -0.7638585, -2.931114, 1, 1, 1, 1, 1,
-0.9421349, -1.464223, -1.813765, 1, 1, 1, 1, 1,
-0.9401115, -1.936782, -2.782557, 1, 1, 1, 1, 1,
-0.9306034, -1.758096, -2.054119, 1, 1, 1, 1, 1,
-0.9195386, 0.5389206, -2.691281, 1, 1, 1, 1, 1,
-0.9191023, 0.5502253, 0.7989547, 1, 1, 1, 1, 1,
-0.9163896, -0.2382911, -0.9010383, 1, 1, 1, 1, 1,
-0.912366, -0.3106229, -2.140794, 1, 1, 1, 1, 1,
-0.9063731, -0.9607168, -2.800789, 0, 0, 1, 1, 1,
-0.9051642, 0.4169881, -2.782277, 1, 0, 0, 1, 1,
-0.9010577, -1.85918, -0.8876249, 1, 0, 0, 1, 1,
-0.8963243, -1.299679, -3.507829, 1, 0, 0, 1, 1,
-0.8915619, -0.2703758, -2.110566, 1, 0, 0, 1, 1,
-0.8909227, -0.7710051, -1.838292, 1, 0, 0, 1, 1,
-0.8871759, -0.8016172, -2.481467, 0, 0, 0, 1, 1,
-0.8768131, -0.4727536, -2.108261, 0, 0, 0, 1, 1,
-0.873152, 1.106895, 0.5514462, 0, 0, 0, 1, 1,
-0.8724184, 0.04993889, -1.297071, 0, 0, 0, 1, 1,
-0.8690602, 1.117494, -2.202639, 0, 0, 0, 1, 1,
-0.8642766, -0.2297777, -1.695888, 0, 0, 0, 1, 1,
-0.8613806, -0.6722919, -0.629815, 0, 0, 0, 1, 1,
-0.8596358, -1.600322, -3.408448, 1, 1, 1, 1, 1,
-0.8547297, 0.9837797, -0.2517911, 1, 1, 1, 1, 1,
-0.8523762, -0.4999005, -2.240573, 1, 1, 1, 1, 1,
-0.8418255, -1.612164, -0.5986757, 1, 1, 1, 1, 1,
-0.8347853, -0.1702138, -2.804514, 1, 1, 1, 1, 1,
-0.833891, 0.6734602, 0.2538377, 1, 1, 1, 1, 1,
-0.8327447, -1.105958, -2.384495, 1, 1, 1, 1, 1,
-0.8203521, -1.333348, -0.49563, 1, 1, 1, 1, 1,
-0.8183321, -0.545041, -2.503945, 1, 1, 1, 1, 1,
-0.8164846, -1.45511, -2.507048, 1, 1, 1, 1, 1,
-0.8055616, -0.6483548, -1.410985, 1, 1, 1, 1, 1,
-0.805492, 1.936987, -0.5883594, 1, 1, 1, 1, 1,
-0.8046541, 0.2190454, -1.554379, 1, 1, 1, 1, 1,
-0.803103, 0.1257323, -1.90299, 1, 1, 1, 1, 1,
-0.8015321, -0.3685575, -1.386619, 1, 1, 1, 1, 1,
-0.7950901, 0.4020944, -1.069423, 0, 0, 1, 1, 1,
-0.7921954, 0.6159132, -2.165129, 1, 0, 0, 1, 1,
-0.791994, -0.2441048, -1.875993, 1, 0, 0, 1, 1,
-0.7881948, 0.1460287, -2.484497, 1, 0, 0, 1, 1,
-0.7846974, -0.6377928, -2.404023, 1, 0, 0, 1, 1,
-0.7820279, 0.7983497, -1.37492, 1, 0, 0, 1, 1,
-0.7782297, -1.549206, -2.054448, 0, 0, 0, 1, 1,
-0.7768764, 0.555476, -0.6337547, 0, 0, 0, 1, 1,
-0.7768655, -0.7221441, -1.011507, 0, 0, 0, 1, 1,
-0.7758607, 1.188404, -1.209787, 0, 0, 0, 1, 1,
-0.7674625, -0.05371626, -0.5789084, 0, 0, 0, 1, 1,
-0.7633563, 0.6896935, -0.4330652, 0, 0, 0, 1, 1,
-0.7625542, -1.430825, -1.408575, 0, 0, 0, 1, 1,
-0.7553777, 1.5458, 0.3119413, 1, 1, 1, 1, 1,
-0.7543373, -1.01034, -1.877536, 1, 1, 1, 1, 1,
-0.7535272, 1.811932, -0.1247197, 1, 1, 1, 1, 1,
-0.7460378, -1.381308, -3.153826, 1, 1, 1, 1, 1,
-0.7371062, 1.329419, -1.626915, 1, 1, 1, 1, 1,
-0.7335255, 1.161689, 0.2353097, 1, 1, 1, 1, 1,
-0.7252052, 1.249683, 1.798274, 1, 1, 1, 1, 1,
-0.7246329, 1.031509, 0.1092452, 1, 1, 1, 1, 1,
-0.7167068, 0.08697674, -0.7405186, 1, 1, 1, 1, 1,
-0.7119648, 0.6980143, 0.1613782, 1, 1, 1, 1, 1,
-0.7095235, 0.1499391, -1.763707, 1, 1, 1, 1, 1,
-0.7060738, 1.014475, -1.253262, 1, 1, 1, 1, 1,
-0.7019241, 0.6967143, -0.2410734, 1, 1, 1, 1, 1,
-0.7009773, 0.5500128, -1.698357, 1, 1, 1, 1, 1,
-0.6980119, -0.8708095, -2.836929, 1, 1, 1, 1, 1,
-0.6959435, 0.4649296, -0.9718807, 0, 0, 1, 1, 1,
-0.6881869, 0.9190326, -1.968878, 1, 0, 0, 1, 1,
-0.6851346, -0.4314481, -0.9285518, 1, 0, 0, 1, 1,
-0.6849977, -0.8191488, -2.663162, 1, 0, 0, 1, 1,
-0.6839928, 1.240369, 0.5186157, 1, 0, 0, 1, 1,
-0.6679482, 0.5326466, -0.218214, 1, 0, 0, 1, 1,
-0.6625945, 1.58569, -0.3676672, 0, 0, 0, 1, 1,
-0.6602811, 0.3476091, -1.196546, 0, 0, 0, 1, 1,
-0.6595646, -0.5131037, -2.873967, 0, 0, 0, 1, 1,
-0.6577939, -0.207614, -1.125868, 0, 0, 0, 1, 1,
-0.6508219, -0.5194662, -2.01776, 0, 0, 0, 1, 1,
-0.6480972, -1.117829, -2.213413, 0, 0, 0, 1, 1,
-0.6473355, 1.856226, -0.6753571, 0, 0, 0, 1, 1,
-0.6424302, 0.4226189, -1.350946, 1, 1, 1, 1, 1,
-0.6395236, -0.2152763, -1.47008, 1, 1, 1, 1, 1,
-0.6394683, -0.2415044, -2.874857, 1, 1, 1, 1, 1,
-0.638212, 0.416744, -0.4989648, 1, 1, 1, 1, 1,
-0.6337464, -0.9070094, -1.561587, 1, 1, 1, 1, 1,
-0.6304166, 0.1248908, -0.1698785, 1, 1, 1, 1, 1,
-0.6286495, -0.505796, -2.61634, 1, 1, 1, 1, 1,
-0.6274884, -0.4058129, -1.179296, 1, 1, 1, 1, 1,
-0.6227207, 1.854884, -2.218625, 1, 1, 1, 1, 1,
-0.6225829, 1.991631, 0.4996339, 1, 1, 1, 1, 1,
-0.6209785, 0.02768206, -2.809915, 1, 1, 1, 1, 1,
-0.6157071, -0.3357013, -3.547913, 1, 1, 1, 1, 1,
-0.6145247, -0.1664194, -0.2610918, 1, 1, 1, 1, 1,
-0.609045, -0.1327103, -3.02876, 1, 1, 1, 1, 1,
-0.6046683, -1.576176, -3.106326, 1, 1, 1, 1, 1,
-0.6045048, 0.2267132, 0.2244475, 0, 0, 1, 1, 1,
-0.6016645, -0.06665149, -2.705062, 1, 0, 0, 1, 1,
-0.6012971, -1.254192, -2.053871, 1, 0, 0, 1, 1,
-0.6009925, 0.3499131, -2.350982, 1, 0, 0, 1, 1,
-0.6002176, -0.6660445, -3.471376, 1, 0, 0, 1, 1,
-0.5956476, -0.02249942, -2.149616, 1, 0, 0, 1, 1,
-0.5944542, -1.029142, -2.720295, 0, 0, 0, 1, 1,
-0.5931669, -2.131341, -3.256256, 0, 0, 0, 1, 1,
-0.5802035, -0.6808268, -3.14303, 0, 0, 0, 1, 1,
-0.5792437, -1.047744, -2.66407, 0, 0, 0, 1, 1,
-0.5756217, 1.630889, -0.2210317, 0, 0, 0, 1, 1,
-0.5742232, -1.031879, -1.602329, 0, 0, 0, 1, 1,
-0.5727846, 0.9308087, -0.3847559, 0, 0, 0, 1, 1,
-0.5722186, -0.4845944, -3.273604, 1, 1, 1, 1, 1,
-0.5691994, 0.6517175, 2.022712, 1, 1, 1, 1, 1,
-0.567157, -1.006917, -1.643727, 1, 1, 1, 1, 1,
-0.5657988, 0.1525318, -1.038037, 1, 1, 1, 1, 1,
-0.5652076, -1.295364, -3.466069, 1, 1, 1, 1, 1,
-0.5622555, -0.2214918, -1.326522, 1, 1, 1, 1, 1,
-0.5607679, 0.2210165, -2.771461, 1, 1, 1, 1, 1,
-0.5578899, 0.2726355, 0.2924865, 1, 1, 1, 1, 1,
-0.5555017, 0.7956568, -0.2209735, 1, 1, 1, 1, 1,
-0.5551716, -1.375525, -3.687996, 1, 1, 1, 1, 1,
-0.5526213, 0.7719241, -1.693509, 1, 1, 1, 1, 1,
-0.5480047, -1.143528, -2.240098, 1, 1, 1, 1, 1,
-0.5463805, 0.942121, -1.164376, 1, 1, 1, 1, 1,
-0.540354, 2.163355, 0.1905231, 1, 1, 1, 1, 1,
-0.5393152, 0.7580974, -0.4601713, 1, 1, 1, 1, 1,
-0.533104, 0.057999, -2.364407, 0, 0, 1, 1, 1,
-0.5312551, -0.478195, -2.145572, 1, 0, 0, 1, 1,
-0.5291317, 1.24228, 0.9902381, 1, 0, 0, 1, 1,
-0.5270391, 0.6693798, -2.320673, 1, 0, 0, 1, 1,
-0.5253505, 0.5188487, -1.187544, 1, 0, 0, 1, 1,
-0.5216503, -0.6391339, -0.1714446, 1, 0, 0, 1, 1,
-0.5214178, -1.589919, -3.470623, 0, 0, 0, 1, 1,
-0.5205699, -0.2214106, -0.7040086, 0, 0, 0, 1, 1,
-0.5145211, -0.6863712, -3.466164, 0, 0, 0, 1, 1,
-0.5142022, -0.09864014, -1.541037, 0, 0, 0, 1, 1,
-0.514181, 1.11334, 0.2817384, 0, 0, 0, 1, 1,
-0.5130379, -1.107302, -1.299768, 0, 0, 0, 1, 1,
-0.5115048, 0.4204622, -1.241721, 0, 0, 0, 1, 1,
-0.5111834, -2.972988, -4.388608, 1, 1, 1, 1, 1,
-0.5105662, 0.0325685, -0.4532206, 1, 1, 1, 1, 1,
-0.5105325, -0.5147393, -3.342267, 1, 1, 1, 1, 1,
-0.5082234, -0.9491436, -3.039865, 1, 1, 1, 1, 1,
-0.504442, -1.024761, -1.761137, 1, 1, 1, 1, 1,
-0.5040458, 0.246497, -0.1491379, 1, 1, 1, 1, 1,
-0.5039805, -0.6319788, -2.029623, 1, 1, 1, 1, 1,
-0.5027073, -1.79018, -2.896619, 1, 1, 1, 1, 1,
-0.4997571, 0.04231967, -0.04140124, 1, 1, 1, 1, 1,
-0.4979126, 1.224276, -1.358377, 1, 1, 1, 1, 1,
-0.497316, 0.3464062, -1.39323, 1, 1, 1, 1, 1,
-0.4965919, -2.4662, -4.432104, 1, 1, 1, 1, 1,
-0.4960006, 0.3071723, -2.209944, 1, 1, 1, 1, 1,
-0.4938374, -0.1188638, -2.764342, 1, 1, 1, 1, 1,
-0.4900973, 0.6469904, -0.6936979, 1, 1, 1, 1, 1,
-0.4879687, 0.8756332, 0.2274453, 0, 0, 1, 1, 1,
-0.4832922, -0.806079, -3.06923, 1, 0, 0, 1, 1,
-0.4779299, 2.140927, 0.3565677, 1, 0, 0, 1, 1,
-0.4772317, -0.2780831, -2.903133, 1, 0, 0, 1, 1,
-0.4746976, -0.2946982, -1.046429, 1, 0, 0, 1, 1,
-0.4742201, -1.131365, -3.807652, 1, 0, 0, 1, 1,
-0.4626361, 0.131343, -0.8880332, 0, 0, 0, 1, 1,
-0.461873, 1.042723, -0.1072124, 0, 0, 0, 1, 1,
-0.4616199, 1.196611, 0.6828297, 0, 0, 0, 1, 1,
-0.461256, 0.6611422, -2.366005, 0, 0, 0, 1, 1,
-0.4603683, 0.6198137, -0.2271973, 0, 0, 0, 1, 1,
-0.4568662, -0.9774588, -4.245919, 0, 0, 0, 1, 1,
-0.4555776, -0.006059234, -1.529032, 0, 0, 0, 1, 1,
-0.4528068, -1.218915, -1.405209, 1, 1, 1, 1, 1,
-0.4490714, 0.06206662, -1.396249, 1, 1, 1, 1, 1,
-0.4423063, 1.107802, 0.440308, 1, 1, 1, 1, 1,
-0.4410034, 0.736316, 0.4159708, 1, 1, 1, 1, 1,
-0.4405848, 0.8359283, 0.7901522, 1, 1, 1, 1, 1,
-0.4401525, 1.09862, -1.858621, 1, 1, 1, 1, 1,
-0.4400998, 0.4004239, -0.1018138, 1, 1, 1, 1, 1,
-0.4346338, 0.06281083, -1.799588, 1, 1, 1, 1, 1,
-0.4338842, -0.5614688, -2.924238, 1, 1, 1, 1, 1,
-0.4333792, -0.2038501, -0.7647926, 1, 1, 1, 1, 1,
-0.4246815, 0.01514178, 0.1542894, 1, 1, 1, 1, 1,
-0.4245963, -0.7157037, -2.643811, 1, 1, 1, 1, 1,
-0.4241772, 1.254347, -0.8088183, 1, 1, 1, 1, 1,
-0.4230183, -0.7022463, -2.578763, 1, 1, 1, 1, 1,
-0.4171198, -0.01612405, -1.132806, 1, 1, 1, 1, 1,
-0.4152589, 1.235754, 0.08228496, 0, 0, 1, 1, 1,
-0.4126619, 0.12652, -0.7726309, 1, 0, 0, 1, 1,
-0.4099516, -1.944919, -4.209742, 1, 0, 0, 1, 1,
-0.4097885, 0.6206568, -0.5387294, 1, 0, 0, 1, 1,
-0.4079317, 0.5074745, -0.6153376, 1, 0, 0, 1, 1,
-0.4071414, -0.4667192, -4.325714, 1, 0, 0, 1, 1,
-0.4009494, -2.297412, -3.767183, 0, 0, 0, 1, 1,
-0.3986818, -0.7723267, -2.308787, 0, 0, 0, 1, 1,
-0.3959598, -0.3712668, -3.377492, 0, 0, 0, 1, 1,
-0.3931866, 0.944706, -1.256235, 0, 0, 0, 1, 1,
-0.3912734, -0.2568557, -2.313337, 0, 0, 0, 1, 1,
-0.3874255, 0.1076217, -0.03578506, 0, 0, 0, 1, 1,
-0.3852983, 0.79157, -1.615428, 0, 0, 0, 1, 1,
-0.3822708, -1.118574, -2.468338, 1, 1, 1, 1, 1,
-0.3814327, 1.566876, -1.003367, 1, 1, 1, 1, 1,
-0.38107, -0.3296278, -2.97026, 1, 1, 1, 1, 1,
-0.3774061, -0.05085648, -1.73264, 1, 1, 1, 1, 1,
-0.3737082, -0.6960863, -2.457705, 1, 1, 1, 1, 1,
-0.3735823, 0.09988918, -0.8303888, 1, 1, 1, 1, 1,
-0.3709953, 1.331252, -0.06178008, 1, 1, 1, 1, 1,
-0.3708318, 0.3566416, -1.06621, 1, 1, 1, 1, 1,
-0.369534, -0.4796513, -3.924015, 1, 1, 1, 1, 1,
-0.3669806, -0.8180294, -3.163772, 1, 1, 1, 1, 1,
-0.3652563, -0.3369713, -3.48696, 1, 1, 1, 1, 1,
-0.3634391, 0.4545789, -0.2348466, 1, 1, 1, 1, 1,
-0.3618533, 1.023913, 1.724609, 1, 1, 1, 1, 1,
-0.3491047, 0.8890703, 0.6979832, 1, 1, 1, 1, 1,
-0.348955, -1.908365, -2.017621, 1, 1, 1, 1, 1,
-0.3480445, 0.2386502, -2.844921, 0, 0, 1, 1, 1,
-0.3349904, 0.3006442, -0.07421124, 1, 0, 0, 1, 1,
-0.3339818, 0.9842194, 1.304569, 1, 0, 0, 1, 1,
-0.3311613, 0.4494599, -1.12108, 1, 0, 0, 1, 1,
-0.3284848, -1.510584, -3.227596, 1, 0, 0, 1, 1,
-0.3273486, 0.8398895, -0.005508178, 1, 0, 0, 1, 1,
-0.3219976, -0.2478613, -0.02408695, 0, 0, 0, 1, 1,
-0.3206104, 0.9627312, -0.2432151, 0, 0, 0, 1, 1,
-0.3196087, 0.3817505, -0.8025599, 0, 0, 0, 1, 1,
-0.3162429, 1.468018, -0.06948459, 0, 0, 0, 1, 1,
-0.3145494, -1.048446, -1.068741, 0, 0, 0, 1, 1,
-0.3142311, -0.7865298, -5.223485, 0, 0, 0, 1, 1,
-0.3112233, 0.2413758, 0.7747229, 0, 0, 0, 1, 1,
-0.307118, -1.219042, -3.036243, 1, 1, 1, 1, 1,
-0.3047946, 0.3411649, -1.517766, 1, 1, 1, 1, 1,
-0.3012295, -2.157793, -1.708136, 1, 1, 1, 1, 1,
-0.3004541, 0.5614269, -1.83676, 1, 1, 1, 1, 1,
-0.3003414, 0.1181004, -3.069917, 1, 1, 1, 1, 1,
-0.2936923, -0.8993813, -2.238078, 1, 1, 1, 1, 1,
-0.2935254, -1.743272, -2.052739, 1, 1, 1, 1, 1,
-0.2922461, -0.3388211, -2.875866, 1, 1, 1, 1, 1,
-0.2880493, 0.6102498, -0.3294792, 1, 1, 1, 1, 1,
-0.2842758, 0.2420358, -2.187721, 1, 1, 1, 1, 1,
-0.2826107, 1.733715, 0.9102924, 1, 1, 1, 1, 1,
-0.2775201, -0.6587489, -3.344796, 1, 1, 1, 1, 1,
-0.2774262, -0.2271172, -2.049947, 1, 1, 1, 1, 1,
-0.2707008, 0.04843546, -0.2521808, 1, 1, 1, 1, 1,
-0.2688267, 0.4820389, -0.2512612, 1, 1, 1, 1, 1,
-0.2675604, -0.3003092, -3.32568, 0, 0, 1, 1, 1,
-0.2650791, -0.0661033, -1.292553, 1, 0, 0, 1, 1,
-0.2640115, -0.5014168, -2.826434, 1, 0, 0, 1, 1,
-0.2579071, 0.4152736, -1.245058, 1, 0, 0, 1, 1,
-0.2577331, -1.179056, -4.086261, 1, 0, 0, 1, 1,
-0.2541375, -1.224393, -2.671802, 1, 0, 0, 1, 1,
-0.2489332, -0.6183557, -2.948111, 0, 0, 0, 1, 1,
-0.2484633, 2.854551, -0.8091057, 0, 0, 0, 1, 1,
-0.2479169, -1.30982, -3.862302, 0, 0, 0, 1, 1,
-0.2472933, -1.165472, -1.614179, 0, 0, 0, 1, 1,
-0.2381583, 0.1749373, -1.919537, 0, 0, 0, 1, 1,
-0.2372542, -1.420661, -3.358969, 0, 0, 0, 1, 1,
-0.2358633, 0.1044996, -0.8498412, 0, 0, 0, 1, 1,
-0.2329289, -1.716892, -1.227216, 1, 1, 1, 1, 1,
-0.2325032, -1.16317, -4.453357, 1, 1, 1, 1, 1,
-0.2313237, -0.2229632, -1.428807, 1, 1, 1, 1, 1,
-0.2179326, -0.4681233, -2.245432, 1, 1, 1, 1, 1,
-0.2137556, 0.8411083, 2.076561, 1, 1, 1, 1, 1,
-0.2122225, 0.7603392, -0.6186777, 1, 1, 1, 1, 1,
-0.2050742, 0.2821999, -1.19931, 1, 1, 1, 1, 1,
-0.20435, -1.229217, -4.736478, 1, 1, 1, 1, 1,
-0.2040561, -0.1325647, -2.200812, 1, 1, 1, 1, 1,
-0.197699, -0.380392, -2.332221, 1, 1, 1, 1, 1,
-0.1973051, -0.7153367, -2.564828, 1, 1, 1, 1, 1,
-0.194697, -0.1623795, -0.9192544, 1, 1, 1, 1, 1,
-0.1910217, -1.002942, -2.281154, 1, 1, 1, 1, 1,
-0.1896079, 0.7338447, -1.211252, 1, 1, 1, 1, 1,
-0.1854618, 2.553727, 0.3179126, 1, 1, 1, 1, 1,
-0.1823237, 0.2523562, 0.06866055, 0, 0, 1, 1, 1,
-0.1796338, -1.024614, -3.655313, 1, 0, 0, 1, 1,
-0.1791362, -1.459841, -2.760993, 1, 0, 0, 1, 1,
-0.1786337, -1.448268, -1.486424, 1, 0, 0, 1, 1,
-0.1782565, -0.3610906, -2.734044, 1, 0, 0, 1, 1,
-0.176705, 0.6076239, -0.552436, 1, 0, 0, 1, 1,
-0.1756059, 0.2891012, 0.6612627, 0, 0, 0, 1, 1,
-0.1744759, 1.357214, -0.4711159, 0, 0, 0, 1, 1,
-0.1722361, 0.1313852, 0.1887608, 0, 0, 0, 1, 1,
-0.1721257, -0.5574259, -1.322135, 0, 0, 0, 1, 1,
-0.1704472, 1.113661, 0.3781693, 0, 0, 0, 1, 1,
-0.1701918, -0.3542325, -2.565925, 0, 0, 0, 1, 1,
-0.163742, 0.8502427, -0.4597954, 0, 0, 0, 1, 1,
-0.1618124, 1.736402, 0.1378816, 1, 1, 1, 1, 1,
-0.160863, 0.02886697, -1.76041, 1, 1, 1, 1, 1,
-0.1569168, 0.5183457, -2.34293, 1, 1, 1, 1, 1,
-0.1566977, 2.206408, -0.9456644, 1, 1, 1, 1, 1,
-0.1535177, 0.6542479, 0.4856055, 1, 1, 1, 1, 1,
-0.1509716, 0.1510192, 0.2554929, 1, 1, 1, 1, 1,
-0.1493281, -0.3362571, -2.94206, 1, 1, 1, 1, 1,
-0.1479059, -0.4897577, -3.818375, 1, 1, 1, 1, 1,
-0.1431821, -0.2263809, -4.119718, 1, 1, 1, 1, 1,
-0.1307057, 0.329207, -0.08143689, 1, 1, 1, 1, 1,
-0.1298181, -0.5393823, -1.133141, 1, 1, 1, 1, 1,
-0.1296369, 0.8254522, 0.7577801, 1, 1, 1, 1, 1,
-0.1293373, 1.110182, 0.642511, 1, 1, 1, 1, 1,
-0.1276847, 1.460828, 0.7176996, 1, 1, 1, 1, 1,
-0.1272347, -0.8296142, -2.609637, 1, 1, 1, 1, 1,
-0.1200639, 1.148817, 1.46341, 0, 0, 1, 1, 1,
-0.1156269, -0.9231672, -2.917607, 1, 0, 0, 1, 1,
-0.1138561, -0.0698272, -2.778939, 1, 0, 0, 1, 1,
-0.111355, -0.1846115, -0.1762539, 1, 0, 0, 1, 1,
-0.1041969, 0.7370541, -2.918926, 1, 0, 0, 1, 1,
-0.1023619, 0.4251623, 1.214016, 1, 0, 0, 1, 1,
-0.1020758, 0.03263637, -1.168902, 0, 0, 0, 1, 1,
-0.0983611, -0.9533265, -2.980146, 0, 0, 0, 1, 1,
-0.09333868, 0.7424098, 1.652836, 0, 0, 0, 1, 1,
-0.09280642, 0.7297163, 1.860373, 0, 0, 0, 1, 1,
-0.092702, 0.2656495, -1.33315, 0, 0, 0, 1, 1,
-0.08698803, -0.1334081, -1.520967, 0, 0, 0, 1, 1,
-0.08087953, 1.535606, 1.570255, 0, 0, 0, 1, 1,
-0.07182402, 0.7465202, -0.9253536, 1, 1, 1, 1, 1,
-0.06773617, 1.469651, -0.006995605, 1, 1, 1, 1, 1,
-0.06504751, -0.3956214, -2.155176, 1, 1, 1, 1, 1,
-0.06355866, 1.223945, 0.8470131, 1, 1, 1, 1, 1,
-0.06281363, -0.3011032, -2.079986, 1, 1, 1, 1, 1,
-0.05932792, -1.203925, -3.505255, 1, 1, 1, 1, 1,
-0.05751374, 0.7258381, -0.3532245, 1, 1, 1, 1, 1,
-0.05712152, 0.8730308, -1.278874, 1, 1, 1, 1, 1,
-0.05405947, 0.4426588, -0.2754028, 1, 1, 1, 1, 1,
-0.05120185, 0.1627594, 1.355697, 1, 1, 1, 1, 1,
-0.0508948, -0.8477249, -3.48783, 1, 1, 1, 1, 1,
-0.04859122, 0.6022962, 0.6928843, 1, 1, 1, 1, 1,
-0.04626681, -1.100132, -2.5959, 1, 1, 1, 1, 1,
-0.0439552, -0.6605809, -2.595614, 1, 1, 1, 1, 1,
-0.04302214, 0.2199761, -0.5443333, 1, 1, 1, 1, 1,
-0.04139691, -0.1367871, -1.931061, 0, 0, 1, 1, 1,
-0.02747618, 0.4045526, 0.1397737, 1, 0, 0, 1, 1,
-0.01816203, 0.2508108, 0.03861624, 1, 0, 0, 1, 1,
-0.01766236, 0.9578797, 0.4814528, 1, 0, 0, 1, 1,
-0.01191581, 0.4203634, -0.5820663, 1, 0, 0, 1, 1,
-0.009786263, 0.1384364, -0.4705313, 1, 0, 0, 1, 1,
-0.008967911, -1.333255, -3.813969, 0, 0, 0, 1, 1,
-0.007715657, -0.3557523, -4.407561, 0, 0, 0, 1, 1,
0.002669642, 0.01918854, 1.855124, 0, 0, 0, 1, 1,
0.01042082, 0.674054, -1.383087, 0, 0, 0, 1, 1,
0.01107809, -0.9010267, 1.795646, 0, 0, 0, 1, 1,
0.01125945, -0.3056232, 4.34187, 0, 0, 0, 1, 1,
0.01158467, 1.302165, 0.4127194, 0, 0, 0, 1, 1,
0.01860761, 0.3583809, 0.06531845, 1, 1, 1, 1, 1,
0.02147113, -0.6565672, 2.789756, 1, 1, 1, 1, 1,
0.02179005, 0.7709363, 0.1266478, 1, 1, 1, 1, 1,
0.02208776, -0.05866076, 3.796939, 1, 1, 1, 1, 1,
0.02329269, 0.2569545, 0.9873464, 1, 1, 1, 1, 1,
0.02524774, 0.1680099, -0.4921967, 1, 1, 1, 1, 1,
0.03076346, 0.5137697, -1.655417, 1, 1, 1, 1, 1,
0.0343083, -1.187849, 4.715059, 1, 1, 1, 1, 1,
0.03648467, 0.4336688, 0.6484513, 1, 1, 1, 1, 1,
0.03805503, -0.3459685, 2.430174, 1, 1, 1, 1, 1,
0.04494803, -0.1391034, 0.7521366, 1, 1, 1, 1, 1,
0.04534161, -0.8082334, 2.648791, 1, 1, 1, 1, 1,
0.04950442, 1.112728, 1.627172, 1, 1, 1, 1, 1,
0.05080918, 0.2102449, 2.431237, 1, 1, 1, 1, 1,
0.05707846, 0.008866364, 0.6780037, 1, 1, 1, 1, 1,
0.05858883, -0.8485889, 4.023505, 0, 0, 1, 1, 1,
0.05893479, -0.1676779, 4.333793, 1, 0, 0, 1, 1,
0.06871582, 0.7194307, 0.6971407, 1, 0, 0, 1, 1,
0.06935299, -1.568518, 1.802547, 1, 0, 0, 1, 1,
0.07070778, 1.838546, 0.8237092, 1, 0, 0, 1, 1,
0.07221968, -1.823642, 3.756913, 1, 0, 0, 1, 1,
0.0743013, 0.03302772, 1.030707, 0, 0, 0, 1, 1,
0.07482828, 0.7086518, 0.2809871, 0, 0, 0, 1, 1,
0.07519991, 2.370107, -1.315299, 0, 0, 0, 1, 1,
0.08020493, -0.590821, 4.614782, 0, 0, 0, 1, 1,
0.08264402, -0.5175316, 1.232311, 0, 0, 0, 1, 1,
0.0828416, 0.2326472, 0.2391074, 0, 0, 0, 1, 1,
0.08364242, -1.443275, 2.562759, 0, 0, 0, 1, 1,
0.08598694, 0.2041578, -1.088026, 1, 1, 1, 1, 1,
0.09190582, -1.076038, 2.428596, 1, 1, 1, 1, 1,
0.09415074, -0.8762009, 2.731876, 1, 1, 1, 1, 1,
0.09588215, 0.4435626, 0.7682168, 1, 1, 1, 1, 1,
0.0988448, 1.117513, -0.05058299, 1, 1, 1, 1, 1,
0.09900887, -0.6470912, 2.336796, 1, 1, 1, 1, 1,
0.1047624, 1.41563, 0.3153698, 1, 1, 1, 1, 1,
0.1106388, -1.990687, 2.343528, 1, 1, 1, 1, 1,
0.1108122, 1.150985, -1.380369, 1, 1, 1, 1, 1,
0.1123216, -1.641228, 4.093453, 1, 1, 1, 1, 1,
0.1145708, -1.925952, 3.939345, 1, 1, 1, 1, 1,
0.1178391, 0.2775243, 0.6883731, 1, 1, 1, 1, 1,
0.1239292, -1.093201, 3.896523, 1, 1, 1, 1, 1,
0.1288724, -0.3900533, 2.836513, 1, 1, 1, 1, 1,
0.1295364, -0.1033792, 0.2619421, 1, 1, 1, 1, 1,
0.1296278, 0.6007697, -0.8412836, 0, 0, 1, 1, 1,
0.1301472, -0.5271131, 4.22597, 1, 0, 0, 1, 1,
0.1317859, -0.4524123, 1.58569, 1, 0, 0, 1, 1,
0.1330705, 0.5206048, 0.8181494, 1, 0, 0, 1, 1,
0.134149, 1.259195, 2.102319, 1, 0, 0, 1, 1,
0.1382992, 0.518106, -0.9115177, 1, 0, 0, 1, 1,
0.1383201, -0.3608678, 1.021376, 0, 0, 0, 1, 1,
0.1422147, 1.054111, 0.8601577, 0, 0, 0, 1, 1,
0.145689, 0.2904188, 1.519827, 0, 0, 0, 1, 1,
0.1474664, -1.743139, 1.896923, 0, 0, 0, 1, 1,
0.1492162, 0.3868303, 0.2393738, 0, 0, 0, 1, 1,
0.1550828, 0.117967, -1.138428, 0, 0, 0, 1, 1,
0.1553013, -0.6639082, 2.068316, 0, 0, 0, 1, 1,
0.1582178, -0.1443432, 3.509499, 1, 1, 1, 1, 1,
0.1583274, -0.1049616, 1.354403, 1, 1, 1, 1, 1,
0.160627, -1.527866, 4.164658, 1, 1, 1, 1, 1,
0.1609466, -0.6434829, 1.461381, 1, 1, 1, 1, 1,
0.1661715, -0.9906204, 4.124412, 1, 1, 1, 1, 1,
0.1749168, 0.09737569, 1.240566, 1, 1, 1, 1, 1,
0.1784805, 0.1001498, 0.8952013, 1, 1, 1, 1, 1,
0.1791236, 0.3743775, 0.1750765, 1, 1, 1, 1, 1,
0.1801716, -1.395354, 3.006345, 1, 1, 1, 1, 1,
0.1807167, -0.5058132, 4.751906, 1, 1, 1, 1, 1,
0.1831087, -0.2061325, 3.546324, 1, 1, 1, 1, 1,
0.1831498, -1.68169, 3.962945, 1, 1, 1, 1, 1,
0.1841602, -0.02558659, 0.3173951, 1, 1, 1, 1, 1,
0.1949976, -1.917144, 3.632225, 1, 1, 1, 1, 1,
0.2031885, 1.037085, -0.1389893, 1, 1, 1, 1, 1,
0.2038863, -2.07068, 3.605733, 0, 0, 1, 1, 1,
0.2043908, -0.8905818, 2.575645, 1, 0, 0, 1, 1,
0.2048271, 1.610785, -0.716525, 1, 0, 0, 1, 1,
0.2074291, 1.500583, 2.03589, 1, 0, 0, 1, 1,
0.2165044, -0.09721538, -1.00496, 1, 0, 0, 1, 1,
0.2186808, 1.306724, 1.204794, 1, 0, 0, 1, 1,
0.2197306, -0.008363658, 1.751513, 0, 0, 0, 1, 1,
0.2254893, 0.196619, 2.133424, 0, 0, 0, 1, 1,
0.2279823, 1.776569, 0.2210014, 0, 0, 0, 1, 1,
0.2280564, 0.5833609, -1.660695, 0, 0, 0, 1, 1,
0.2288272, 0.1001953, 1.33333, 0, 0, 0, 1, 1,
0.2315918, -0.1910559, 1.540023, 0, 0, 0, 1, 1,
0.2351449, 1.506407, 0.6213784, 0, 0, 0, 1, 1,
0.2401508, 0.4981133, 1.626703, 1, 1, 1, 1, 1,
0.2416998, 0.3402671, 2.429259, 1, 1, 1, 1, 1,
0.2442634, 0.3770314, 0.08721516, 1, 1, 1, 1, 1,
0.254777, 0.5204689, -0.4714626, 1, 1, 1, 1, 1,
0.25578, 0.08989069, 0.9763574, 1, 1, 1, 1, 1,
0.2561507, 1.311438, 0.3290285, 1, 1, 1, 1, 1,
0.2571226, 0.2393183, 3.080302, 1, 1, 1, 1, 1,
0.260456, -0.3504649, 0.6840025, 1, 1, 1, 1, 1,
0.2605177, 1.012397, -0.8052293, 1, 1, 1, 1, 1,
0.2624227, 2.168004, -0.8228109, 1, 1, 1, 1, 1,
0.2645677, -0.5822126, 2.719923, 1, 1, 1, 1, 1,
0.2668728, -1.225082, 2.918075, 1, 1, 1, 1, 1,
0.2679031, -0.7189591, 2.978644, 1, 1, 1, 1, 1,
0.2696167, 0.2733247, 1.523722, 1, 1, 1, 1, 1,
0.2705461, 0.3208784, 0.6360348, 1, 1, 1, 1, 1,
0.2794278, 0.2179081, 0.04623066, 0, 0, 1, 1, 1,
0.2876828, -1.456714, 4.251529, 1, 0, 0, 1, 1,
0.2890438, -0.6423333, 3.499604, 1, 0, 0, 1, 1,
0.2895888, 0.085074, 0.4963792, 1, 0, 0, 1, 1,
0.2902818, -1.00706, 4.78661, 1, 0, 0, 1, 1,
0.2937677, 0.843568, 0.8758428, 1, 0, 0, 1, 1,
0.3006639, 0.6869482, -0.6537768, 0, 0, 0, 1, 1,
0.3082152, 0.1058101, 1.112696, 0, 0, 0, 1, 1,
0.3099383, 0.6080325, 0.7566316, 0, 0, 0, 1, 1,
0.3125494, 0.3508121, 0.5710135, 0, 0, 0, 1, 1,
0.3126409, 0.8122395, 0.6019716, 0, 0, 0, 1, 1,
0.3162619, -0.3924841, 1.311175, 0, 0, 0, 1, 1,
0.3231783, 0.5379825, 0.4188398, 0, 0, 0, 1, 1,
0.3248094, 1.483986, -1.112046, 1, 1, 1, 1, 1,
0.3249606, -2.14999, 1.495073, 1, 1, 1, 1, 1,
0.3270319, -0.8106346, 3.985339, 1, 1, 1, 1, 1,
0.3298775, -0.8132236, 3.63756, 1, 1, 1, 1, 1,
0.3370499, -0.7677926, 4.643183, 1, 1, 1, 1, 1,
0.3394316, -0.6709902, 2.695206, 1, 1, 1, 1, 1,
0.341292, -0.9773614, 3.930005, 1, 1, 1, 1, 1,
0.349436, -0.009904576, 1.579682, 1, 1, 1, 1, 1,
0.3519654, -0.02602113, 1.875271, 1, 1, 1, 1, 1,
0.3528364, -0.3566557, 2.997441, 1, 1, 1, 1, 1,
0.3533753, 1.468002, 1.544461, 1, 1, 1, 1, 1,
0.3541421, -0.3851098, 2.610267, 1, 1, 1, 1, 1,
0.3555076, 0.3535719, 1.15085, 1, 1, 1, 1, 1,
0.3622175, -0.440594, 1.39377, 1, 1, 1, 1, 1,
0.3683503, 0.2354412, -0.1857461, 1, 1, 1, 1, 1,
0.3690604, 0.8041126, 0.7075934, 0, 0, 1, 1, 1,
0.3695744, -1.143286, 2.568973, 1, 0, 0, 1, 1,
0.3721073, 0.2809497, 2.103331, 1, 0, 0, 1, 1,
0.3768673, 1.676577, 1.792646, 1, 0, 0, 1, 1,
0.3786895, 0.05772566, -0.2901901, 1, 0, 0, 1, 1,
0.3843166, 1.63393, -0.8239634, 1, 0, 0, 1, 1,
0.3879009, -0.4788024, 1.261633, 0, 0, 0, 1, 1,
0.3887932, -0.6877043, 2.118922, 0, 0, 0, 1, 1,
0.3888283, -1.698893, 1.944473, 0, 0, 0, 1, 1,
0.3905771, 0.2502076, 1.863068, 0, 0, 0, 1, 1,
0.3953115, -1.529, 1.555391, 0, 0, 0, 1, 1,
0.3953333, -0.01686465, 3.53591, 0, 0, 0, 1, 1,
0.3958109, 1.089018, -0.07677928, 0, 0, 0, 1, 1,
0.3978491, -0.3805124, 0.7319446, 1, 1, 1, 1, 1,
0.399864, -0.6426813, 1.848684, 1, 1, 1, 1, 1,
0.40019, -0.7965891, 1.580022, 1, 1, 1, 1, 1,
0.4007285, 0.4959271, 1.591254, 1, 1, 1, 1, 1,
0.4022779, -0.9756886, 2.056463, 1, 1, 1, 1, 1,
0.4065246, -0.5520195, 1.848692, 1, 1, 1, 1, 1,
0.4080913, 1.588201, 1.507058, 1, 1, 1, 1, 1,
0.411142, 0.7700482, -0.3130805, 1, 1, 1, 1, 1,
0.4145027, 0.1471673, 1.188739, 1, 1, 1, 1, 1,
0.4180458, 2.014279, 0.1824623, 1, 1, 1, 1, 1,
0.4194259, -0.02700874, 2.773313, 1, 1, 1, 1, 1,
0.4217117, 0.8227559, 0.6896016, 1, 1, 1, 1, 1,
0.4256994, 2.002219, -1.038876, 1, 1, 1, 1, 1,
0.4277957, 1.334624, -0.4821617, 1, 1, 1, 1, 1,
0.4285706, -0.4924681, 3.625554, 1, 1, 1, 1, 1,
0.4286564, -1.274477, 1.563861, 0, 0, 1, 1, 1,
0.4323383, 1.277087, -0.1052221, 1, 0, 0, 1, 1,
0.4325883, -0.2366964, 1.196037, 1, 0, 0, 1, 1,
0.4346015, 1.207443, 0.6844749, 1, 0, 0, 1, 1,
0.4380941, -0.8177915, 3.646132, 1, 0, 0, 1, 1,
0.4423261, 0.09032557, 2.450509, 1, 0, 0, 1, 1,
0.4443936, -0.243296, 3.217507, 0, 0, 0, 1, 1,
0.447959, -0.7072805, 2.195821, 0, 0, 0, 1, 1,
0.4497072, 0.1147032, 0.1396508, 0, 0, 0, 1, 1,
0.4513457, 0.1901425, -1.076998, 0, 0, 0, 1, 1,
0.455139, 0.6318213, 0.8528023, 0, 0, 0, 1, 1,
0.4558619, 0.4848265, 1.294098, 0, 0, 0, 1, 1,
0.4578671, 0.08484583, 1.044831, 0, 0, 0, 1, 1,
0.4580356, 0.8231391, 1.03133, 1, 1, 1, 1, 1,
0.4616423, 0.908289, 0.4010424, 1, 1, 1, 1, 1,
0.4623636, -0.4025156, 3.102999, 1, 1, 1, 1, 1,
0.4626432, -1.480366, 1.391147, 1, 1, 1, 1, 1,
0.4646624, 2.413546, -0.8128091, 1, 1, 1, 1, 1,
0.4682141, 0.2225996, 1.410608, 1, 1, 1, 1, 1,
0.475462, 0.8511825, 1.327374, 1, 1, 1, 1, 1,
0.4755304, 2.000074, 0.5697474, 1, 1, 1, 1, 1,
0.4758837, -0.2447835, 1.387577, 1, 1, 1, 1, 1,
0.4869378, -0.8300585, 3.332431, 1, 1, 1, 1, 1,
0.4899905, 0.8479344, 2.91413, 1, 1, 1, 1, 1,
0.4922749, 1.427125, 0.9542111, 1, 1, 1, 1, 1,
0.4923232, 0.6657568, 3.030825, 1, 1, 1, 1, 1,
0.4925759, 0.919947, 0.8296453, 1, 1, 1, 1, 1,
0.4996935, -1.203591, 2.750369, 1, 1, 1, 1, 1,
0.5068074, 0.3082671, 1.613423, 0, 0, 1, 1, 1,
0.5115424, -0.8090129, 2.361069, 1, 0, 0, 1, 1,
0.5122601, 1.28814, 0.2565001, 1, 0, 0, 1, 1,
0.5218417, 1.363576, 2.248993, 1, 0, 0, 1, 1,
0.5222414, 2.642283, 2.361201, 1, 0, 0, 1, 1,
0.522944, -0.7432594, 1.407217, 1, 0, 0, 1, 1,
0.5254433, 1.062848, -0.5225229, 0, 0, 0, 1, 1,
0.5266566, -1.187124, 3.04685, 0, 0, 0, 1, 1,
0.5270351, 1.075482, 0.361743, 0, 0, 0, 1, 1,
0.5299231, 1.710643, -0.7078408, 0, 0, 0, 1, 1,
0.5304529, -1.556242, 3.20003, 0, 0, 0, 1, 1,
0.5387648, -0.424828, 2.715401, 0, 0, 0, 1, 1,
0.5392353, -0.1859606, 0.6950817, 0, 0, 0, 1, 1,
0.5413712, 0.048995, 0.3010188, 1, 1, 1, 1, 1,
0.5453873, -2.278147, 2.046697, 1, 1, 1, 1, 1,
0.5470421, -0.6551836, 3.05248, 1, 1, 1, 1, 1,
0.5472012, -1.071061, 3.059818, 1, 1, 1, 1, 1,
0.5536273, 0.8870328, 0.7230301, 1, 1, 1, 1, 1,
0.557042, 1.126335, -1.012242, 1, 1, 1, 1, 1,
0.5629352, -0.04472535, 1.897249, 1, 1, 1, 1, 1,
0.5668877, 0.3531161, -2.1415, 1, 1, 1, 1, 1,
0.571631, 1.887436, -0.2196569, 1, 1, 1, 1, 1,
0.5717575, -0.7341651, 3.123106, 1, 1, 1, 1, 1,
0.5722774, 0.8974668, 0.4301341, 1, 1, 1, 1, 1,
0.575581, -1.238228, 5.062751, 1, 1, 1, 1, 1,
0.5819245, 0.5517071, 0.4066992, 1, 1, 1, 1, 1,
0.583621, 0.2382698, -0.5562651, 1, 1, 1, 1, 1,
0.5890678, 0.8826011, 0.6363809, 1, 1, 1, 1, 1,
0.5933806, 1.00984, 1.316704, 0, 0, 1, 1, 1,
0.5943403, 1.005875, 2.004947, 1, 0, 0, 1, 1,
0.5964675, 0.9119366, 0.7549218, 1, 0, 0, 1, 1,
0.5990072, -0.5933138, 2.728986, 1, 0, 0, 1, 1,
0.6054557, 0.1022801, 3.738746, 1, 0, 0, 1, 1,
0.6065047, -1.407883, 3.301136, 1, 0, 0, 1, 1,
0.6086806, 0.239227, 0.005627702, 0, 0, 0, 1, 1,
0.6106403, -1.374085, 2.987942, 0, 0, 0, 1, 1,
0.6204016, 1.179291, 0.3144601, 0, 0, 0, 1, 1,
0.622256, -1.342458, 1.060137, 0, 0, 0, 1, 1,
0.6245083, -0.5207261, 1.788872, 0, 0, 0, 1, 1,
0.6251351, -1.294137, 2.055901, 0, 0, 0, 1, 1,
0.6332656, 1.305797, 0.03504389, 0, 0, 0, 1, 1,
0.6354498, -0.1267187, 1.965701, 1, 1, 1, 1, 1,
0.6379786, 1.066264, -0.9066188, 1, 1, 1, 1, 1,
0.6414757, -0.6256074, 1.975171, 1, 1, 1, 1, 1,
0.643762, -0.5224406, 2.393185, 1, 1, 1, 1, 1,
0.646785, -1.655743, 2.809163, 1, 1, 1, 1, 1,
0.6491408, -0.2446705, 2.263342, 1, 1, 1, 1, 1,
0.6607963, -1.857203, 1.040829, 1, 1, 1, 1, 1,
0.661027, -0.917681, 2.559089, 1, 1, 1, 1, 1,
0.6654772, 1.481179, 2.516613, 1, 1, 1, 1, 1,
0.6712566, -0.5616959, 1.907515, 1, 1, 1, 1, 1,
0.6714269, 2.163336, -0.7179202, 1, 1, 1, 1, 1,
0.681771, 1.20761, 1.12159, 1, 1, 1, 1, 1,
0.6846689, -1.061756, 2.241139, 1, 1, 1, 1, 1,
0.6910338, -0.4983161, 2.798986, 1, 1, 1, 1, 1,
0.6973449, 0.3929376, 0.9028355, 1, 1, 1, 1, 1,
0.6984619, 0.7099562, 1.45033, 0, 0, 1, 1, 1,
0.7013284, -0.6494166, 1.030323, 1, 0, 0, 1, 1,
0.7020977, 1.290087, 1.101133, 1, 0, 0, 1, 1,
0.71135, -0.3368327, 1.958895, 1, 0, 0, 1, 1,
0.7168824, -0.1873777, 1.830956, 1, 0, 0, 1, 1,
0.720643, 0.8494898, 0.442619, 1, 0, 0, 1, 1,
0.7270269, 1.466321, 0.7860129, 0, 0, 0, 1, 1,
0.7353587, 1.431911, -0.4746856, 0, 0, 0, 1, 1,
0.744453, 1.174662, 0.9753156, 0, 0, 0, 1, 1,
0.7497505, -0.2379217, 1.460473, 0, 0, 0, 1, 1,
0.7522171, 0.4218497, 1.092282, 0, 0, 0, 1, 1,
0.7541604, 1.050564, 1.241951, 0, 0, 0, 1, 1,
0.7561259, -1.918713, 2.645819, 0, 0, 0, 1, 1,
0.7580118, 1.314672, 1.131984, 1, 1, 1, 1, 1,
0.7621233, -0.8650095, 1.703765, 1, 1, 1, 1, 1,
0.7818047, -1.976643, 2.720794, 1, 1, 1, 1, 1,
0.7825257, -0.3166249, 1.171244, 1, 1, 1, 1, 1,
0.7847527, -0.2083563, 3.721943, 1, 1, 1, 1, 1,
0.8054176, 0.2552968, 0.5398578, 1, 1, 1, 1, 1,
0.8091969, 0.6229014, 2.335283, 1, 1, 1, 1, 1,
0.8098212, -1.108847, 1.557063, 1, 1, 1, 1, 1,
0.8110415, -2.092647, 3.208072, 1, 1, 1, 1, 1,
0.8120026, 0.2630843, 1.42319, 1, 1, 1, 1, 1,
0.8130478, -0.5648104, 2.426774, 1, 1, 1, 1, 1,
0.8130488, -0.9046007, 2.196346, 1, 1, 1, 1, 1,
0.814074, 0.777889, 2.84239, 1, 1, 1, 1, 1,
0.8204019, -0.7236804, 2.521625, 1, 1, 1, 1, 1,
0.829285, 0.1516895, 2.597215, 1, 1, 1, 1, 1,
0.8328115, -1.083655, 1.359535, 0, 0, 1, 1, 1,
0.8349804, -0.8941, 4.140514, 1, 0, 0, 1, 1,
0.844555, -0.4405134, 2.394563, 1, 0, 0, 1, 1,
0.8467129, 1.196363, 0.3016708, 1, 0, 0, 1, 1,
0.8472211, 0.6612473, 0.9834439, 1, 0, 0, 1, 1,
0.8578089, -0.9881148, 2.116234, 1, 0, 0, 1, 1,
0.8597355, -1.521991, 1.324682, 0, 0, 0, 1, 1,
0.8624314, 1.097129, 1.591164, 0, 0, 0, 1, 1,
0.8684177, 1.712741, 1.762924, 0, 0, 0, 1, 1,
0.870568, -0.708582, 3.577706, 0, 0, 0, 1, 1,
0.8798202, 0.3932361, 2.910421, 0, 0, 0, 1, 1,
0.8807378, 1.614687, 1.031003, 0, 0, 0, 1, 1,
0.8811314, -0.5145057, -0.05264593, 0, 0, 0, 1, 1,
0.882872, -2.140648, 1.196735, 1, 1, 1, 1, 1,
0.8832356, 1.042193, 1.157271, 1, 1, 1, 1, 1,
0.8833662, -0.07673164, 1.957473, 1, 1, 1, 1, 1,
0.8907923, -0.8118285, 3.459012, 1, 1, 1, 1, 1,
0.8909186, 0.4287825, 0.6125112, 1, 1, 1, 1, 1,
0.8939936, -0.4374143, 2.795287, 1, 1, 1, 1, 1,
0.8987295, 1.128171, -0.8871652, 1, 1, 1, 1, 1,
0.9010558, 0.7867014, -0.1044225, 1, 1, 1, 1, 1,
0.9068652, -0.6355756, 2.542734, 1, 1, 1, 1, 1,
0.9098697, -0.6349986, 2.520147, 1, 1, 1, 1, 1,
0.9109693, 0.07958528, 1.772193, 1, 1, 1, 1, 1,
0.915863, -0.03083551, 2.164557, 1, 1, 1, 1, 1,
0.9182121, -1.008882, 1.319131, 1, 1, 1, 1, 1,
0.9185219, -0.2969942, 0.9292666, 1, 1, 1, 1, 1,
0.921464, 0.7287824, -0.04471257, 1, 1, 1, 1, 1,
0.9244119, -1.363913, 2.431981, 0, 0, 1, 1, 1,
0.9247355, -1.665529, 1.306994, 1, 0, 0, 1, 1,
0.9269035, -0.08368449, 1.17182, 1, 0, 0, 1, 1,
0.9358763, -0.534431, 2.672966, 1, 0, 0, 1, 1,
0.9365658, -0.5817902, 1.954355, 1, 0, 0, 1, 1,
0.9444268, 0.4441986, 2.299685, 1, 0, 0, 1, 1,
0.9468021, -0.5251125, 1.917664, 0, 0, 0, 1, 1,
0.9491326, -1.479987, 3.421154, 0, 0, 0, 1, 1,
0.9560736, 0.4899762, 0.8447784, 0, 0, 0, 1, 1,
0.9562799, 0.5955026, 0.2695283, 0, 0, 0, 1, 1,
0.9598936, -1.009195, 2.235521, 0, 0, 0, 1, 1,
0.9608974, 1.34166, 0.02096581, 0, 0, 0, 1, 1,
0.9616986, 0.4318788, 1.53731, 0, 0, 0, 1, 1,
0.9652604, -0.1068761, 0.1393148, 1, 1, 1, 1, 1,
0.9657105, 0.4972701, 0.3178666, 1, 1, 1, 1, 1,
0.9689862, 1.094404, 0.8048986, 1, 1, 1, 1, 1,
0.977809, -1.675502, 3.191327, 1, 1, 1, 1, 1,
0.9798045, -0.3222666, 2.627646, 1, 1, 1, 1, 1,
0.9855419, 0.5931959, 1.302195, 1, 1, 1, 1, 1,
0.9907959, -1.765058, 3.644357, 1, 1, 1, 1, 1,
0.9959664, 0.152722, 0.02197044, 1, 1, 1, 1, 1,
0.9980572, 1.361456, 0.8465757, 1, 1, 1, 1, 1,
1.000058, -0.2075691, 1.669858, 1, 1, 1, 1, 1,
1.001457, -1.379025, 2.464582, 1, 1, 1, 1, 1,
1.005529, 0.01601669, 0.5711778, 1, 1, 1, 1, 1,
1.020046, -0.5297053, 1.755786, 1, 1, 1, 1, 1,
1.020759, -0.2916328, 0.6756861, 1, 1, 1, 1, 1,
1.023122, 0.0258666, 0.7330894, 1, 1, 1, 1, 1,
1.028015, -3.130759, 4.095288, 0, 0, 1, 1, 1,
1.032417, 0.7358651, -0.05554757, 1, 0, 0, 1, 1,
1.03396, -0.9542674, 0.8126028, 1, 0, 0, 1, 1,
1.039089, 1.770132, 1.330438, 1, 0, 0, 1, 1,
1.042072, 0.03286063, 0.1658753, 1, 0, 0, 1, 1,
1.044442, 1.874775, -0.4539487, 1, 0, 0, 1, 1,
1.047389, 0.200249, -0.9151531, 0, 0, 0, 1, 1,
1.050929, 1.393452, 0.7856513, 0, 0, 0, 1, 1,
1.052179, 0.3679654, 2.151569, 0, 0, 0, 1, 1,
1.053857, -0.007218543, 1.475549, 0, 0, 0, 1, 1,
1.056769, -1.699551, 3.414371, 0, 0, 0, 1, 1,
1.059656, -0.6814169, 1.523571, 0, 0, 0, 1, 1,
1.060037, -0.3011153, 0.6845948, 0, 0, 0, 1, 1,
1.063213, -0.3731162, 1.952853, 1, 1, 1, 1, 1,
1.064234, -0.1859872, -0.3040149, 1, 1, 1, 1, 1,
1.071834, -0.9678133, 2.05512, 1, 1, 1, 1, 1,
1.08442, 0.3648258, 1.879055, 1, 1, 1, 1, 1,
1.093896, -1.019086, 2.156223, 1, 1, 1, 1, 1,
1.094917, -0.1581772, 1.786601, 1, 1, 1, 1, 1,
1.095833, -1.423836, 1.208761, 1, 1, 1, 1, 1,
1.09604, -1.1725, 1.680366, 1, 1, 1, 1, 1,
1.09798, -0.9504352, 1.247882, 1, 1, 1, 1, 1,
1.098464, 1.829832, 0.6468159, 1, 1, 1, 1, 1,
1.105494, -0.1418476, 2.522376, 1, 1, 1, 1, 1,
1.107148, 0.2844636, 1.77884, 1, 1, 1, 1, 1,
1.10722, -1.089069, 1.630936, 1, 1, 1, 1, 1,
1.112354, 0.1458811, 2.803419, 1, 1, 1, 1, 1,
1.122689, 0.002918171, 0.8226063, 1, 1, 1, 1, 1,
1.127635, 0.6770023, 2.121115, 0, 0, 1, 1, 1,
1.128917, 1.119299, 1.587039, 1, 0, 0, 1, 1,
1.142308, 1.72227, 0.5120685, 1, 0, 0, 1, 1,
1.143932, 2.582211, 0.5760926, 1, 0, 0, 1, 1,
1.14607, -1.113804, 2.497967, 1, 0, 0, 1, 1,
1.146708, 0.4226378, 0.3896873, 1, 0, 0, 1, 1,
1.15422, -0.6956865, 2.116264, 0, 0, 0, 1, 1,
1.155752, 1.79452, -0.5031965, 0, 0, 0, 1, 1,
1.156551, 1.639578, 1.163797, 0, 0, 0, 1, 1,
1.158678, 0.5082247, 0.9540232, 0, 0, 0, 1, 1,
1.165309, 0.5170414, 1.087814, 0, 0, 0, 1, 1,
1.170242, 1.030004, 0.4951271, 0, 0, 0, 1, 1,
1.173593, -0.7046653, 1.145274, 0, 0, 0, 1, 1,
1.175932, 1.253653, 0.9728901, 1, 1, 1, 1, 1,
1.178026, -1.260247, 3.360401, 1, 1, 1, 1, 1,
1.179856, -1.214211, 1.443032, 1, 1, 1, 1, 1,
1.184759, 0.8099315, 1.552501, 1, 1, 1, 1, 1,
1.18565, 0.6955919, 1.681062, 1, 1, 1, 1, 1,
1.191529, 0.9439096, 1.225242, 1, 1, 1, 1, 1,
1.192015, -0.2305852, 1.653016, 1, 1, 1, 1, 1,
1.199653, 1.228434, -0.3582365, 1, 1, 1, 1, 1,
1.204209, 0.4766911, 0.532246, 1, 1, 1, 1, 1,
1.208061, -0.1634707, 2.338315, 1, 1, 1, 1, 1,
1.215215, -1.449205, 2.803104, 1, 1, 1, 1, 1,
1.220744, -0.2802514, 1.417582, 1, 1, 1, 1, 1,
1.227114, 0.4475426, 0.8174314, 1, 1, 1, 1, 1,
1.228919, -0.5026869, 2.746365, 1, 1, 1, 1, 1,
1.230116, -0.8523018, 2.65408, 1, 1, 1, 1, 1,
1.230118, -0.6705704, 2.451251, 0, 0, 1, 1, 1,
1.245685, 0.09866673, -0.03704755, 1, 0, 0, 1, 1,
1.247576, 0.9236527, 0.9360316, 1, 0, 0, 1, 1,
1.25031, -0.3468443, 1.393135, 1, 0, 0, 1, 1,
1.255441, 0.4963253, 0.4485705, 1, 0, 0, 1, 1,
1.257645, 0.1615205, 2.213408, 1, 0, 0, 1, 1,
1.257901, -0.7773887, 3.014768, 0, 0, 0, 1, 1,
1.259094, -1.539654, 1.441585, 0, 0, 0, 1, 1,
1.267409, 0.7480624, 1.955905, 0, 0, 0, 1, 1,
1.268487, 2.701236, 0.7524593, 0, 0, 0, 1, 1,
1.273255, 1.203589, -0.5393298, 0, 0, 0, 1, 1,
1.273581, -1.067968, 2.802673, 0, 0, 0, 1, 1,
1.285604, 0.1918675, 1.952216, 0, 0, 0, 1, 1,
1.285959, 0.1958362, 1.11602, 1, 1, 1, 1, 1,
1.289027, -1.039958, 2.599501, 1, 1, 1, 1, 1,
1.291166, -0.2471824, 2.623108, 1, 1, 1, 1, 1,
1.29252, 0.3607901, 1.951537, 1, 1, 1, 1, 1,
1.29356, -2.365351, 2.336972, 1, 1, 1, 1, 1,
1.298239, 1.081145, 0.4620732, 1, 1, 1, 1, 1,
1.301032, -0.9819061, 1.91209, 1, 1, 1, 1, 1,
1.302462, -0.09019969, 0.02818055, 1, 1, 1, 1, 1,
1.304084, -0.9772905, 1.697892, 1, 1, 1, 1, 1,
1.305485, 0.6837053, 0.5700517, 1, 1, 1, 1, 1,
1.30709, 0.3718538, 0.02680495, 1, 1, 1, 1, 1,
1.311132, -0.1670709, 1.606989, 1, 1, 1, 1, 1,
1.313705, -0.1720252, 1.127848, 1, 1, 1, 1, 1,
1.314519, -0.01209363, 2.611915, 1, 1, 1, 1, 1,
1.315666, -0.6743716, 2.134997, 1, 1, 1, 1, 1,
1.317652, 0.1021499, 2.65285, 0, 0, 1, 1, 1,
1.319258, 0.2703847, 1.265237, 1, 0, 0, 1, 1,
1.322781, 1.134558, -0.3527899, 1, 0, 0, 1, 1,
1.324358, -1.415456, 1.050063, 1, 0, 0, 1, 1,
1.328024, 0.7369621, 0.3147142, 1, 0, 0, 1, 1,
1.337922, 0.05669515, 0.6277099, 1, 0, 0, 1, 1,
1.348252, -0.6412914, 0.5388409, 0, 0, 0, 1, 1,
1.356364, 2.644288, -0.3972351, 0, 0, 0, 1, 1,
1.357116, -0.4385676, 2.388974, 0, 0, 0, 1, 1,
1.359528, -0.879024, 1.379349, 0, 0, 0, 1, 1,
1.366203, 0.5836561, -0.02320402, 0, 0, 0, 1, 1,
1.367958, -0.149282, 3.655158, 0, 0, 0, 1, 1,
1.36834, -1.503432, 1.259843, 0, 0, 0, 1, 1,
1.369465, -2.061705, 4.050378, 1, 1, 1, 1, 1,
1.373232, 0.1537445, 1.404916, 1, 1, 1, 1, 1,
1.382757, 0.5726749, 1.399823, 1, 1, 1, 1, 1,
1.386789, -2.078692, 1.948306, 1, 1, 1, 1, 1,
1.390913, -0.3840294, 1.163469, 1, 1, 1, 1, 1,
1.393638, -1.061543, 2.127361, 1, 1, 1, 1, 1,
1.398424, -0.2239064, 0.8313426, 1, 1, 1, 1, 1,
1.404481, -0.3581314, 2.111779, 1, 1, 1, 1, 1,
1.404496, 0.4259423, 1.203003, 1, 1, 1, 1, 1,
1.416583, -1.395595, 2.785903, 1, 1, 1, 1, 1,
1.417636, 0.6225581, 0.7643545, 1, 1, 1, 1, 1,
1.419303, -0.5364836, 0.8280112, 1, 1, 1, 1, 1,
1.425374, -0.1898947, 3.163162, 1, 1, 1, 1, 1,
1.429824, -0.4727945, -0.8427233, 1, 1, 1, 1, 1,
1.433943, -0.6018562, 2.58659, 1, 1, 1, 1, 1,
1.437627, 1.075972, 0.6797763, 0, 0, 1, 1, 1,
1.437769, -0.838308, 1.929206, 1, 0, 0, 1, 1,
1.439309, 1.40059, -0.4134371, 1, 0, 0, 1, 1,
1.456764, -0.5659814, 1.715649, 1, 0, 0, 1, 1,
1.461199, 0.09470971, 2.27365, 1, 0, 0, 1, 1,
1.472841, 1.895262, 1.98374, 1, 0, 0, 1, 1,
1.47754, 0.2153419, 1.697585, 0, 0, 0, 1, 1,
1.514007, 0.1107459, -0.2393887, 0, 0, 0, 1, 1,
1.517119, 0.07154224, 2.200272, 0, 0, 0, 1, 1,
1.54368, -1.520362, 2.010298, 0, 0, 0, 1, 1,
1.550117, 0.1550304, 2.15888, 0, 0, 0, 1, 1,
1.557136, -0.8217624, 3.263185, 0, 0, 0, 1, 1,
1.570411, 0.3180212, 2.358242, 0, 0, 0, 1, 1,
1.575092, 0.1241523, 1.092127, 1, 1, 1, 1, 1,
1.577513, -1.609708, 4.522461, 1, 1, 1, 1, 1,
1.589869, 0.2580883, 0.743553, 1, 1, 1, 1, 1,
1.590425, -0.9493808, 1.143389, 1, 1, 1, 1, 1,
1.618552, -0.5746848, 1.044913, 1, 1, 1, 1, 1,
1.619467, -0.09094511, 1.479944, 1, 1, 1, 1, 1,
1.624291, -1.166336, 2.108236, 1, 1, 1, 1, 1,
1.63995, 0.3924677, 1.610931, 1, 1, 1, 1, 1,
1.658159, 0.3044809, 1.258375, 1, 1, 1, 1, 1,
1.66773, 1.374172, 1.352706, 1, 1, 1, 1, 1,
1.679582, -0.62164, 2.482084, 1, 1, 1, 1, 1,
1.696836, 1.47482, 1.55451, 1, 1, 1, 1, 1,
1.714816, 0.9382297, 2.055466, 1, 1, 1, 1, 1,
1.726279, -0.4240949, -0.1448314, 1, 1, 1, 1, 1,
1.726367, -0.7522634, 2.179096, 1, 1, 1, 1, 1,
1.742207, 2.232239, 0.4196576, 0, 0, 1, 1, 1,
1.742641, 0.4340726, 0.8046794, 1, 0, 0, 1, 1,
1.74303, -1.879516, 3.190605, 1, 0, 0, 1, 1,
1.755387, 1.672186, 0.4989673, 1, 0, 0, 1, 1,
1.762601, 1.690789, -0.1259177, 1, 0, 0, 1, 1,
1.774741, -0.5840409, 1.522435, 1, 0, 0, 1, 1,
1.790023, 0.09494349, 2.119494, 0, 0, 0, 1, 1,
1.794109, -0.3937785, 2.036658, 0, 0, 0, 1, 1,
1.835821, 1.078675, 0.08549108, 0, 0, 0, 1, 1,
1.837876, -0.1907352, 2.757535, 0, 0, 0, 1, 1,
1.839088, -1.078611, 1.276603, 0, 0, 0, 1, 1,
1.840658, 0.9595991, 0.8004627, 0, 0, 0, 1, 1,
1.847461, 0.6024075, -0.006501473, 0, 0, 0, 1, 1,
1.854455, -1.444322, 1.257777, 1, 1, 1, 1, 1,
1.859163, 1.112696, 1.907425, 1, 1, 1, 1, 1,
1.859765, -0.3463159, 2.260788, 1, 1, 1, 1, 1,
1.860441, -1.062405, 1.340273, 1, 1, 1, 1, 1,
1.865271, -0.4455968, 1.525957, 1, 1, 1, 1, 1,
1.891029, 1.177448, 1.861987, 1, 1, 1, 1, 1,
1.899469, -0.00202546, 4.30636, 1, 1, 1, 1, 1,
1.902926, 1.082735, 1.386532, 1, 1, 1, 1, 1,
1.93178, -0.809271, 2.67511, 1, 1, 1, 1, 1,
1.951214, -1.279237, 3.285297, 1, 1, 1, 1, 1,
1.95154, -1.638693, 2.616902, 1, 1, 1, 1, 1,
1.953925, -1.997898, 2.029623, 1, 1, 1, 1, 1,
1.955113, -0.901155, 2.477355, 1, 1, 1, 1, 1,
1.974017, 1.382923, 1.365979, 1, 1, 1, 1, 1,
1.97435, -1.126758, 3.618086, 1, 1, 1, 1, 1,
1.99531, -1.36619, 2.781325, 0, 0, 1, 1, 1,
1.998732, 2.155291, 0.9358436, 1, 0, 0, 1, 1,
2.043763, -1.507734, 2.748454, 1, 0, 0, 1, 1,
2.058751, -1.720209, -0.01626513, 1, 0, 0, 1, 1,
2.062891, -0.09356156, 0.6315405, 1, 0, 0, 1, 1,
2.072398, -0.9315903, 0.8889798, 1, 0, 0, 1, 1,
2.086597, 0.7484777, 1.905512, 0, 0, 0, 1, 1,
2.120049, 0.4823666, 1.867295, 0, 0, 0, 1, 1,
2.179998, -0.9643142, 1.416128, 0, 0, 0, 1, 1,
2.232206, 0.1506674, 0.7800664, 0, 0, 0, 1, 1,
2.236975, 1.087099, -0.04200183, 0, 0, 0, 1, 1,
2.303045, -0.07622679, 2.009899, 0, 0, 0, 1, 1,
2.34445, -0.6144791, 2.722879, 0, 0, 0, 1, 1,
2.396926, -0.9030507, 1.507877, 1, 1, 1, 1, 1,
2.466542, 0.1751595, 1.940182, 1, 1, 1, 1, 1,
2.559125, -0.6513107, 1.220419, 1, 1, 1, 1, 1,
2.650029, -0.485208, 2.337504, 1, 1, 1, 1, 1,
2.796681, -0.1757862, -0.4047909, 1, 1, 1, 1, 1,
3.004371, 0.4164008, 1.735782, 1, 1, 1, 1, 1,
3.428868, -0.4507764, 2.296455, 1, 1, 1, 1, 1
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
var radius = 9.320291;
var distance = 32.73712;
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
mvMatrix.translate( -0.1730027, 0.138104, 0.08036733 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.73712);
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
