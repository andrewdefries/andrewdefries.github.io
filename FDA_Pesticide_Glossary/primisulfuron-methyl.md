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
-4.266283, -1.203654, -1.486262, 1, 0, 0, 1,
-2.710072, -1.645759, -4.053904, 1, 0.007843138, 0, 1,
-2.658627, 1.177512, -2.23545, 1, 0.01176471, 0, 1,
-2.566833, 0.6138895, -1.64877, 1, 0.01960784, 0, 1,
-2.54923, -0.6922354, -1.209037, 1, 0.02352941, 0, 1,
-2.469929, 0.6703079, -1.542047, 1, 0.03137255, 0, 1,
-2.382864, -0.3196585, -1.34788, 1, 0.03529412, 0, 1,
-2.376406, -0.581834, -2.635025, 1, 0.04313726, 0, 1,
-2.369887, 0.3167319, 0.0773883, 1, 0.04705882, 0, 1,
-2.204149, -0.1241631, -2.113302, 1, 0.05490196, 0, 1,
-2.193611, -1.762916, -2.557072, 1, 0.05882353, 0, 1,
-2.181177, 0.06917346, -1.077634, 1, 0.06666667, 0, 1,
-2.163813, 0.7018608, -2.215936, 1, 0.07058824, 0, 1,
-2.128849, 0.6249163, -2.929549, 1, 0.07843138, 0, 1,
-2.107631, -0.4207362, -0.9258237, 1, 0.08235294, 0, 1,
-2.097167, 0.37479, 1.634453, 1, 0.09019608, 0, 1,
-2.083483, -0.1973551, -1.481789, 1, 0.09411765, 0, 1,
-2.079571, -0.3608572, -0.1087003, 1, 0.1019608, 0, 1,
-1.977237, -0.6245668, -1.397165, 1, 0.1098039, 0, 1,
-1.975862, 0.9208812, -0.7281803, 1, 0.1137255, 0, 1,
-1.973573, 2.364224, -1.307204, 1, 0.1215686, 0, 1,
-1.955674, 1.760302, -1.48586, 1, 0.1254902, 0, 1,
-1.947723, -1.42544, -2.721763, 1, 0.1333333, 0, 1,
-1.939543, 0.8053073, -0.7749228, 1, 0.1372549, 0, 1,
-1.934966, 0.6251513, -1.655426, 1, 0.145098, 0, 1,
-1.914078, -0.7630594, -3.386511, 1, 0.1490196, 0, 1,
-1.872272, -0.008183391, -1.52289, 1, 0.1568628, 0, 1,
-1.857605, -0.3003377, -2.279223, 1, 0.1607843, 0, 1,
-1.856459, -0.5164003, -2.168659, 1, 0.1686275, 0, 1,
-1.850892, 0.3661097, -1.397327, 1, 0.172549, 0, 1,
-1.849861, -0.755924, -1.443403, 1, 0.1803922, 0, 1,
-1.844086, 0.7551894, -0.9830067, 1, 0.1843137, 0, 1,
-1.838526, -0.367879, -0.4673914, 1, 0.1921569, 0, 1,
-1.828076, 0.7464533, -1.751304, 1, 0.1960784, 0, 1,
-1.811942, 0.3517272, -1.986865, 1, 0.2039216, 0, 1,
-1.807659, -0.5367237, -4.045402, 1, 0.2117647, 0, 1,
-1.804368, 0.279476, -0.6662151, 1, 0.2156863, 0, 1,
-1.80209, 0.07592457, -2.275267, 1, 0.2235294, 0, 1,
-1.799282, 0.8418089, -1.723192, 1, 0.227451, 0, 1,
-1.784553, -1.469297, -1.735134, 1, 0.2352941, 0, 1,
-1.783401, -0.2540286, -2.602066, 1, 0.2392157, 0, 1,
-1.749928, 1.8514, 0.4273532, 1, 0.2470588, 0, 1,
-1.681844, -0.6672883, -0.9679909, 1, 0.2509804, 0, 1,
-1.677087, -0.254991, -1.494764, 1, 0.2588235, 0, 1,
-1.633612, 0.2173734, -0.2509493, 1, 0.2627451, 0, 1,
-1.631934, 2.473697, -1.673021, 1, 0.2705882, 0, 1,
-1.608622, -1.057614, -3.573279, 1, 0.2745098, 0, 1,
-1.575493, -0.9770226, -1.814935, 1, 0.282353, 0, 1,
-1.573565, 1.171396, -0.4536086, 1, 0.2862745, 0, 1,
-1.549153, 0.3539389, -2.819286, 1, 0.2941177, 0, 1,
-1.547158, -0.1692688, -1.099213, 1, 0.3019608, 0, 1,
-1.541597, 0.2825951, -2.379232, 1, 0.3058824, 0, 1,
-1.536488, -2.013196, -2.682992, 1, 0.3137255, 0, 1,
-1.536105, 1.371191, -0.1245267, 1, 0.3176471, 0, 1,
-1.51203, -1.389423, -3.195741, 1, 0.3254902, 0, 1,
-1.505809, -1.211676, 0.509102, 1, 0.3294118, 0, 1,
-1.491127, 1.55728, 0.402675, 1, 0.3372549, 0, 1,
-1.485871, -1.17581, -1.42066, 1, 0.3411765, 0, 1,
-1.472289, -0.4744253, -1.293083, 1, 0.3490196, 0, 1,
-1.461423, -1.042741, -2.317308, 1, 0.3529412, 0, 1,
-1.459075, -2.247877, -2.517373, 1, 0.3607843, 0, 1,
-1.457234, -1.021812, -1.55047, 1, 0.3647059, 0, 1,
-1.456784, 0.3350613, -1.940138, 1, 0.372549, 0, 1,
-1.384787, 1.56269, 1.225503, 1, 0.3764706, 0, 1,
-1.384052, 0.6669021, -0.7179695, 1, 0.3843137, 0, 1,
-1.379874, 0.6150634, -0.9307269, 1, 0.3882353, 0, 1,
-1.374844, 1.810029, 0.6946529, 1, 0.3960784, 0, 1,
-1.36981, 0.2352752, -1.816893, 1, 0.4039216, 0, 1,
-1.366589, -0.4167944, -0.3936591, 1, 0.4078431, 0, 1,
-1.360032, -1.282711, -2.735286, 1, 0.4156863, 0, 1,
-1.359986, 0.7970135, 0.3799824, 1, 0.4196078, 0, 1,
-1.350179, -0.5954363, -1.052408, 1, 0.427451, 0, 1,
-1.350131, -1.853763, 0.03294327, 1, 0.4313726, 0, 1,
-1.349207, -0.06883296, -1.669523, 1, 0.4392157, 0, 1,
-1.331759, 0.01387937, -2.840092, 1, 0.4431373, 0, 1,
-1.328199, 0.285964, -1.58085, 1, 0.4509804, 0, 1,
-1.327269, -0.1004094, -0.5296447, 1, 0.454902, 0, 1,
-1.326443, -1.815185, -2.950389, 1, 0.4627451, 0, 1,
-1.322999, 0.07535403, -1.852526, 1, 0.4666667, 0, 1,
-1.318135, -0.3503578, -2.14717, 1, 0.4745098, 0, 1,
-1.312487, 0.306308, -2.199564, 1, 0.4784314, 0, 1,
-1.307576, 0.4350641, -1.307475, 1, 0.4862745, 0, 1,
-1.301832, 0.9213387, -1.913834, 1, 0.4901961, 0, 1,
-1.297869, -0.8610434, -0.1744832, 1, 0.4980392, 0, 1,
-1.297054, -0.2622193, -1.51624, 1, 0.5058824, 0, 1,
-1.296498, 1.285268, -0.3629696, 1, 0.509804, 0, 1,
-1.284542, -0.2375433, -3.255648, 1, 0.5176471, 0, 1,
-1.280942, 0.132947, -1.982651, 1, 0.5215687, 0, 1,
-1.273782, 1.037133, -0.5452577, 1, 0.5294118, 0, 1,
-1.25852, 2.19505, 0.8048295, 1, 0.5333334, 0, 1,
-1.225805, 0.8572748, -1.681326, 1, 0.5411765, 0, 1,
-1.221353, 0.2103486, -0.06666793, 1, 0.5450981, 0, 1,
-1.217287, 1.148062, -0.4222345, 1, 0.5529412, 0, 1,
-1.215311, 0.570976, -1.743722, 1, 0.5568628, 0, 1,
-1.208994, 1.276811, -2.968892, 1, 0.5647059, 0, 1,
-1.208571, 0.72107, -0.4596732, 1, 0.5686275, 0, 1,
-1.208125, 0.6984023, -0.8302096, 1, 0.5764706, 0, 1,
-1.20584, 0.4157194, -0.7888567, 1, 0.5803922, 0, 1,
-1.205827, -1.018524, -3.047653, 1, 0.5882353, 0, 1,
-1.20141, -0.6575436, -2.294944, 1, 0.5921569, 0, 1,
-1.200202, -1.499614, -2.112159, 1, 0.6, 0, 1,
-1.198445, -0.3685397, -2.282074, 1, 0.6078432, 0, 1,
-1.197792, -0.3999494, -1.672336, 1, 0.6117647, 0, 1,
-1.196567, -1.675503, -1.88424, 1, 0.6196079, 0, 1,
-1.18922, -0.9325255, -2.464084, 1, 0.6235294, 0, 1,
-1.183571, 0.8925698, -1.365911, 1, 0.6313726, 0, 1,
-1.176243, -0.1175056, -1.19056, 1, 0.6352941, 0, 1,
-1.166955, 1.228463, -2.342774, 1, 0.6431373, 0, 1,
-1.158399, -0.06350826, -4.789465, 1, 0.6470588, 0, 1,
-1.149822, 0.1010043, -0.882816, 1, 0.654902, 0, 1,
-1.145927, 0.1007328, -0.7834592, 1, 0.6588235, 0, 1,
-1.143387, 0.4490007, -1.191827, 1, 0.6666667, 0, 1,
-1.141615, -1.911686, -1.874998, 1, 0.6705883, 0, 1,
-1.139963, -1.245845, -2.206375, 1, 0.6784314, 0, 1,
-1.134681, -1.055268, -2.346345, 1, 0.682353, 0, 1,
-1.125112, -0.5612038, -3.066081, 1, 0.6901961, 0, 1,
-1.115127, 2.194518, -0.2945184, 1, 0.6941177, 0, 1,
-1.105888, -0.1907235, -2.010182, 1, 0.7019608, 0, 1,
-1.103798, -0.7222361, -3.435272, 1, 0.7098039, 0, 1,
-1.103091, 0.1192346, -0.9631091, 1, 0.7137255, 0, 1,
-1.099063, 2.073278, -0.350845, 1, 0.7215686, 0, 1,
-1.096799, -0.6264117, -3.289778, 1, 0.7254902, 0, 1,
-1.092154, 1.563145, -3.254161, 1, 0.7333333, 0, 1,
-1.090585, 1.099526, -1.396829, 1, 0.7372549, 0, 1,
-1.088305, 0.2378597, -1.515062, 1, 0.7450981, 0, 1,
-1.081369, 0.2869485, -0.222286, 1, 0.7490196, 0, 1,
-1.080353, -0.218404, -2.351318, 1, 0.7568628, 0, 1,
-1.075294, -1.530603, -1.242704, 1, 0.7607843, 0, 1,
-1.070132, 0.596046, -1.124902, 1, 0.7686275, 0, 1,
-1.067079, -0.2995366, -3.158705, 1, 0.772549, 0, 1,
-1.063887, 0.2602784, -3.0048, 1, 0.7803922, 0, 1,
-1.062209, 1.679481, -1.778871, 1, 0.7843137, 0, 1,
-1.062204, -1.429437, -3.119, 1, 0.7921569, 0, 1,
-1.062135, -0.6925932, -3.040984, 1, 0.7960784, 0, 1,
-1.059648, -1.374229, -2.503891, 1, 0.8039216, 0, 1,
-1.050326, -0.3337135, -1.765314, 1, 0.8117647, 0, 1,
-1.033758, 0.08940113, -0.3193373, 1, 0.8156863, 0, 1,
-1.024327, 0.1255557, -4.493998, 1, 0.8235294, 0, 1,
-1.018389, -0.4404775, -2.120207, 1, 0.827451, 0, 1,
-1.016468, -1.033569, -2.847803, 1, 0.8352941, 0, 1,
-1.016017, -0.09637234, -0.0163919, 1, 0.8392157, 0, 1,
-1.014097, 1.93747, 0.4202825, 1, 0.8470588, 0, 1,
-1.013186, -0.465494, -1.585489, 1, 0.8509804, 0, 1,
-1.007491, -1.747303, -2.084636, 1, 0.8588235, 0, 1,
-1.005283, 1.038905, -1.981957, 1, 0.8627451, 0, 1,
-1.003944, 0.01549724, -2.364892, 1, 0.8705882, 0, 1,
-0.9966429, 2.060007, -1.406057, 1, 0.8745098, 0, 1,
-0.9965377, 2.055594, -2.465681, 1, 0.8823529, 0, 1,
-0.9897701, -1.032626, -2.280457, 1, 0.8862745, 0, 1,
-0.9853839, 0.5026972, -1.277765, 1, 0.8941177, 0, 1,
-0.9839219, 0.220793, -0.09667481, 1, 0.8980392, 0, 1,
-0.9796525, -1.498835, -3.340326, 1, 0.9058824, 0, 1,
-0.9795283, -0.7395123, -1.153312, 1, 0.9137255, 0, 1,
-0.9731275, 0.3835351, -0.7009673, 1, 0.9176471, 0, 1,
-0.9703649, 0.1268635, -0.836328, 1, 0.9254902, 0, 1,
-0.9700989, 0.8682864, -0.1690945, 1, 0.9294118, 0, 1,
-0.9646866, 0.1144793, 0.07791574, 1, 0.9372549, 0, 1,
-0.9630019, -1.034984, -0.3979867, 1, 0.9411765, 0, 1,
-0.9570547, 0.310697, -1.343884, 1, 0.9490196, 0, 1,
-0.9542991, 1.505781, 0.2927881, 1, 0.9529412, 0, 1,
-0.952986, -0.1446394, -1.64652, 1, 0.9607843, 0, 1,
-0.9443992, 0.3821358, -0.6163922, 1, 0.9647059, 0, 1,
-0.9398696, -0.1099835, -1.533661, 1, 0.972549, 0, 1,
-0.9398179, -1.177829, -2.011877, 1, 0.9764706, 0, 1,
-0.9366236, -1.927865, -3.535242, 1, 0.9843137, 0, 1,
-0.9342092, -0.5379883, -1.896777, 1, 0.9882353, 0, 1,
-0.9315598, 0.1276276, -1.241471, 1, 0.9960784, 0, 1,
-0.9298765, 0.4297223, -0.02258269, 0.9960784, 1, 0, 1,
-0.9287114, 0.7957752, -1.341436, 0.9921569, 1, 0, 1,
-0.9285583, 2.033809, -0.4902641, 0.9843137, 1, 0, 1,
-0.9242473, -0.8145584, -0.3951581, 0.9803922, 1, 0, 1,
-0.9225347, 0.7432272, -2.368344, 0.972549, 1, 0, 1,
-0.9207776, -0.2172766, -2.239345, 0.9686275, 1, 0, 1,
-0.9198142, -0.1966481, -1.782736, 0.9607843, 1, 0, 1,
-0.9160343, -0.9591791, -2.633189, 0.9568627, 1, 0, 1,
-0.9148291, -1.31254, -2.179935, 0.9490196, 1, 0, 1,
-0.9122536, -0.2586624, -4.862229, 0.945098, 1, 0, 1,
-0.8977592, 1.089968, -1.617994, 0.9372549, 1, 0, 1,
-0.8975634, -1.069498, -3.328144, 0.9333333, 1, 0, 1,
-0.8974821, 0.2645139, -0.2579049, 0.9254902, 1, 0, 1,
-0.8948538, 0.2846903, -2.230731, 0.9215686, 1, 0, 1,
-0.8921379, -1.149444, -1.434979, 0.9137255, 1, 0, 1,
-0.8867188, -0.9446298, -4.204071, 0.9098039, 1, 0, 1,
-0.8819671, 0.6250416, -0.2156221, 0.9019608, 1, 0, 1,
-0.8800407, -1.319939, -2.87603, 0.8941177, 1, 0, 1,
-0.8784442, 0.5298026, 0.6912986, 0.8901961, 1, 0, 1,
-0.8774224, 1.84177, -1.510426, 0.8823529, 1, 0, 1,
-0.8741735, 0.5064998, 0.5038282, 0.8784314, 1, 0, 1,
-0.8651376, -0.8035867, -2.62215, 0.8705882, 1, 0, 1,
-0.8643655, -0.3475584, -1.86041, 0.8666667, 1, 0, 1,
-0.851706, 0.5032541, -0.775438, 0.8588235, 1, 0, 1,
-0.8499307, 1.306211, -0.2502469, 0.854902, 1, 0, 1,
-0.8494447, -0.4145917, -3.203154, 0.8470588, 1, 0, 1,
-0.8462695, -0.1619179, -3.186273, 0.8431373, 1, 0, 1,
-0.8363048, -0.9898755, -2.87319, 0.8352941, 1, 0, 1,
-0.8336782, -0.9404102, -2.842838, 0.8313726, 1, 0, 1,
-0.8330336, 0.3200735, 1.864037, 0.8235294, 1, 0, 1,
-0.832531, 0.1616308, -0.6640663, 0.8196079, 1, 0, 1,
-0.8321177, -0.154065, -0.7414068, 0.8117647, 1, 0, 1,
-0.8272636, 0.00949211, -0.7389763, 0.8078431, 1, 0, 1,
-0.8238279, -0.5480788, -2.522319, 0.8, 1, 0, 1,
-0.8230271, -0.7009277, -3.291165, 0.7921569, 1, 0, 1,
-0.81879, 2.348186, -2.080673, 0.7882353, 1, 0, 1,
-0.8146904, -0.1952598, -2.397705, 0.7803922, 1, 0, 1,
-0.8125221, -0.8621017, -1.030461, 0.7764706, 1, 0, 1,
-0.8100881, -0.654267, 0.09404564, 0.7686275, 1, 0, 1,
-0.8077039, 0.7235449, -0.04166328, 0.7647059, 1, 0, 1,
-0.8060319, 0.6431395, -1.906444, 0.7568628, 1, 0, 1,
-0.8051175, -1.389849, -2.724317, 0.7529412, 1, 0, 1,
-0.8034796, 1.049184, -0.5498024, 0.7450981, 1, 0, 1,
-0.7960328, 0.2104909, -1.029828, 0.7411765, 1, 0, 1,
-0.7858931, 1.328617, -1.14634, 0.7333333, 1, 0, 1,
-0.7843649, -0.3288082, -1.434528, 0.7294118, 1, 0, 1,
-0.7790664, 0.405714, 0.2067165, 0.7215686, 1, 0, 1,
-0.7761919, -0.5160844, -3.750612, 0.7176471, 1, 0, 1,
-0.7759182, 0.7519899, -0.1588277, 0.7098039, 1, 0, 1,
-0.7628453, -0.3321585, -3.87325, 0.7058824, 1, 0, 1,
-0.7608497, 0.05359885, -1.731583, 0.6980392, 1, 0, 1,
-0.7607847, -0.2587467, 1.088206, 0.6901961, 1, 0, 1,
-0.7583135, 1.082625, 0.6479322, 0.6862745, 1, 0, 1,
-0.7568721, 0.9031683, -0.7290843, 0.6784314, 1, 0, 1,
-0.7534838, -1.580048, -4.849062, 0.6745098, 1, 0, 1,
-0.7531587, -0.9224513, -1.535892, 0.6666667, 1, 0, 1,
-0.7457131, 0.8513933, 0.285237, 0.6627451, 1, 0, 1,
-0.7445976, -1.435476, -2.88805, 0.654902, 1, 0, 1,
-0.7433661, -0.3968493, -1.058681, 0.6509804, 1, 0, 1,
-0.7407506, -1.137393, -1.731268, 0.6431373, 1, 0, 1,
-0.739305, 0.5577186, 0.1200071, 0.6392157, 1, 0, 1,
-0.7374276, 1.250684, 1.097752, 0.6313726, 1, 0, 1,
-0.7371651, 0.7418916, -0.6180207, 0.627451, 1, 0, 1,
-0.7346983, 1.985494, 0.5791597, 0.6196079, 1, 0, 1,
-0.7328874, 0.6759232, -1.753509, 0.6156863, 1, 0, 1,
-0.7306263, 0.5353892, 1.38822, 0.6078432, 1, 0, 1,
-0.7279983, 1.043335, -1.015556, 0.6039216, 1, 0, 1,
-0.7277011, -0.007489468, -1.863109, 0.5960785, 1, 0, 1,
-0.7272709, 1.616602, -0.7319127, 0.5882353, 1, 0, 1,
-0.7117739, 1.366756, -1.165156, 0.5843138, 1, 0, 1,
-0.7042426, 1.508551, -0.2918808, 0.5764706, 1, 0, 1,
-0.7013138, 0.11031, -0.4519876, 0.572549, 1, 0, 1,
-0.7009535, -0.0259061, -1.606673, 0.5647059, 1, 0, 1,
-0.6946398, 0.9966912, 1.055391, 0.5607843, 1, 0, 1,
-0.6946262, 0.3290299, -0.08853898, 0.5529412, 1, 0, 1,
-0.692859, -0.152208, 0.4020967, 0.5490196, 1, 0, 1,
-0.6916563, -0.7695224, -2.688195, 0.5411765, 1, 0, 1,
-0.683415, -1.446497, -2.808622, 0.5372549, 1, 0, 1,
-0.676796, 0.125512, -2.906567, 0.5294118, 1, 0, 1,
-0.6699255, -1.106389, -2.335342, 0.5254902, 1, 0, 1,
-0.6678764, 1.007675, 1.755502, 0.5176471, 1, 0, 1,
-0.6677314, 3.032288, -1.180343, 0.5137255, 1, 0, 1,
-0.667094, -0.1242601, 0.1461712, 0.5058824, 1, 0, 1,
-0.6660903, 0.8364123, 1.127914, 0.5019608, 1, 0, 1,
-0.6590348, -1.902284, -3.103074, 0.4941176, 1, 0, 1,
-0.6546549, 0.5976582, 0.2115004, 0.4862745, 1, 0, 1,
-0.6504319, 0.8566392, 0.1843255, 0.4823529, 1, 0, 1,
-0.646005, -0.038936, -1.181243, 0.4745098, 1, 0, 1,
-0.6454387, -1.140822, -3.29722, 0.4705882, 1, 0, 1,
-0.6432118, 0.2172525, -0.7374086, 0.4627451, 1, 0, 1,
-0.6409925, 0.09279759, -1.602538, 0.4588235, 1, 0, 1,
-0.6366948, -0.3082644, -1.502341, 0.4509804, 1, 0, 1,
-0.6347393, 1.152313, -0.230397, 0.4470588, 1, 0, 1,
-0.6337214, 1.206579, 2.22828, 0.4392157, 1, 0, 1,
-0.6315278, 0.4155886, -1.112191, 0.4352941, 1, 0, 1,
-0.631444, 1.076453, -2.894366, 0.427451, 1, 0, 1,
-0.6258514, -1.202095, -3.169223, 0.4235294, 1, 0, 1,
-0.6225243, 2.317411, 0.7283529, 0.4156863, 1, 0, 1,
-0.6183417, -1.265028, -3.866825, 0.4117647, 1, 0, 1,
-0.6107618, 0.4718981, -0.1778479, 0.4039216, 1, 0, 1,
-0.6059206, 0.6657104, -0.7739236, 0.3960784, 1, 0, 1,
-0.6055194, -0.07883837, -1.186398, 0.3921569, 1, 0, 1,
-0.6039885, 0.1377318, -1.826558, 0.3843137, 1, 0, 1,
-0.6026884, 2.368058, -1.599832, 0.3803922, 1, 0, 1,
-0.5945017, -0.2553768, -1.069024, 0.372549, 1, 0, 1,
-0.5930263, 1.611885, -0.07722752, 0.3686275, 1, 0, 1,
-0.5922611, 0.2013097, -0.4293253, 0.3607843, 1, 0, 1,
-0.5921802, 0.4301665, -0.8501626, 0.3568628, 1, 0, 1,
-0.5921528, -0.1113396, -0.8746821, 0.3490196, 1, 0, 1,
-0.5916837, -0.4901325, -3.397556, 0.345098, 1, 0, 1,
-0.5894827, -0.7339732, -3.038708, 0.3372549, 1, 0, 1,
-0.5887295, 1.049876, 0.07245746, 0.3333333, 1, 0, 1,
-0.5847195, 1.887247, -0.2091126, 0.3254902, 1, 0, 1,
-0.5842697, -0.9079111, -3.662988, 0.3215686, 1, 0, 1,
-0.5829696, -1.108645, -3.851741, 0.3137255, 1, 0, 1,
-0.5814312, 1.229209, -0.8327454, 0.3098039, 1, 0, 1,
-0.5764048, 0.9319072, -0.3422958, 0.3019608, 1, 0, 1,
-0.5758376, -0.9619725, -2.108453, 0.2941177, 1, 0, 1,
-0.5698836, -0.9871236, -2.14187, 0.2901961, 1, 0, 1,
-0.5696719, 1.001206, -0.286452, 0.282353, 1, 0, 1,
-0.5691898, 0.1925997, -1.98932, 0.2784314, 1, 0, 1,
-0.5680215, -0.006685027, -0.4304892, 0.2705882, 1, 0, 1,
-0.5644516, -0.1019402, -1.107184, 0.2666667, 1, 0, 1,
-0.5637959, 0.6620277, -0.6523826, 0.2588235, 1, 0, 1,
-0.5630521, -2.043753, -2.938432, 0.254902, 1, 0, 1,
-0.5602586, -1.39748, -2.934176, 0.2470588, 1, 0, 1,
-0.5572717, 0.6823015, -0.1250294, 0.2431373, 1, 0, 1,
-0.55498, -0.3907179, -1.492648, 0.2352941, 1, 0, 1,
-0.5536934, -0.03725002, -0.6850411, 0.2313726, 1, 0, 1,
-0.553326, -0.8423288, -2.006073, 0.2235294, 1, 0, 1,
-0.5504904, -1.376923, -4.606654, 0.2196078, 1, 0, 1,
-0.5469991, -1.342251, -1.654148, 0.2117647, 1, 0, 1,
-0.5438899, 0.3164409, -0.6472898, 0.2078431, 1, 0, 1,
-0.5418406, -1.071465, -0.3593749, 0.2, 1, 0, 1,
-0.530747, -0.1858013, -1.235094, 0.1921569, 1, 0, 1,
-0.5292866, 1.138679, -0.6429389, 0.1882353, 1, 0, 1,
-0.526513, 0.2213344, 0.3340864, 0.1803922, 1, 0, 1,
-0.5224698, 1.788127, -2.258526, 0.1764706, 1, 0, 1,
-0.5219373, 0.4046694, -2.304037, 0.1686275, 1, 0, 1,
-0.5193599, 0.6259902, -0.448323, 0.1647059, 1, 0, 1,
-0.5163266, 1.291141, -1.514822, 0.1568628, 1, 0, 1,
-0.5139525, -1.358218, -2.186229, 0.1529412, 1, 0, 1,
-0.5138891, -1.129552, -3.065629, 0.145098, 1, 0, 1,
-0.5109136, -0.8578727, -1.786787, 0.1411765, 1, 0, 1,
-0.5106084, -1.680836, -2.095109, 0.1333333, 1, 0, 1,
-0.5098413, 0.04394732, -0.5696361, 0.1294118, 1, 0, 1,
-0.5068452, 0.1113164, 0.1704296, 0.1215686, 1, 0, 1,
-0.505487, 0.3934282, -0.725826, 0.1176471, 1, 0, 1,
-0.5024156, 0.7483019, -1.467856, 0.1098039, 1, 0, 1,
-0.5008907, 1.326045, 0.2438781, 0.1058824, 1, 0, 1,
-0.4985251, 0.8055376, -0.780327, 0.09803922, 1, 0, 1,
-0.4926377, 0.6515639, -1.604831, 0.09019608, 1, 0, 1,
-0.4923964, -0.1037199, -1.663229, 0.08627451, 1, 0, 1,
-0.4893247, 0.7197403, 0.4121411, 0.07843138, 1, 0, 1,
-0.4891465, 0.4381636, -2.525464, 0.07450981, 1, 0, 1,
-0.4885212, 0.275959, -2.125929, 0.06666667, 1, 0, 1,
-0.4878343, 1.001194, -1.782216, 0.0627451, 1, 0, 1,
-0.4875567, -0.2079148, -0.4684065, 0.05490196, 1, 0, 1,
-0.4844716, -0.3246309, -2.524369, 0.05098039, 1, 0, 1,
-0.4840234, -0.9754438, -3.052567, 0.04313726, 1, 0, 1,
-0.4814601, 0.3007227, 0.6135927, 0.03921569, 1, 0, 1,
-0.480338, -0.908776, -3.135671, 0.03137255, 1, 0, 1,
-0.4711206, -1.034487, -3.618399, 0.02745098, 1, 0, 1,
-0.4685602, 2.026692, -1.332261, 0.01960784, 1, 0, 1,
-0.4668013, 0.2106423, -1.951946, 0.01568628, 1, 0, 1,
-0.4544355, 0.9437248, 0.930077, 0.007843138, 1, 0, 1,
-0.4541071, -0.09879309, -0.9736657, 0.003921569, 1, 0, 1,
-0.4503057, 1.03892, -1.726446, 0, 1, 0.003921569, 1,
-0.4460462, -0.5402029, -1.571906, 0, 1, 0.01176471, 1,
-0.4404691, -1.478947, -2.937513, 0, 1, 0.01568628, 1,
-0.4331571, 0.6225756, -1.656044, 0, 1, 0.02352941, 1,
-0.4271387, -0.1468847, -3.864923, 0, 1, 0.02745098, 1,
-0.4246537, 1.197276, -0.670095, 0, 1, 0.03529412, 1,
-0.4184864, -1.483334, -1.760095, 0, 1, 0.03921569, 1,
-0.4170111, 1.227992, -1.487929, 0, 1, 0.04705882, 1,
-0.4166186, 1.275593, 0.6569546, 0, 1, 0.05098039, 1,
-0.4130361, 0.6246264, 0.5337207, 0, 1, 0.05882353, 1,
-0.4130248, -1.74995, -2.906944, 0, 1, 0.0627451, 1,
-0.4114499, 0.5727742, -1.530053, 0, 1, 0.07058824, 1,
-0.4060582, 1.051835, 1.401299, 0, 1, 0.07450981, 1,
-0.4047598, -1.076085, -3.024906, 0, 1, 0.08235294, 1,
-0.4021464, -0.2328232, -3.33828, 0, 1, 0.08627451, 1,
-0.3999888, -1.64936, -1.340511, 0, 1, 0.09411765, 1,
-0.3982636, 0.01617669, -1.691308, 0, 1, 0.1019608, 1,
-0.3979319, -0.1306436, -2.258858, 0, 1, 0.1058824, 1,
-0.3976605, -0.6832416, -3.098313, 0, 1, 0.1137255, 1,
-0.39693, 0.2187928, 0.0724981, 0, 1, 0.1176471, 1,
-0.3952865, -0.1618823, -2.489325, 0, 1, 0.1254902, 1,
-0.3934515, -1.194067, -2.780187, 0, 1, 0.1294118, 1,
-0.3911017, -1.010557, -3.37691, 0, 1, 0.1372549, 1,
-0.3860229, -0.01366729, -2.876211, 0, 1, 0.1411765, 1,
-0.3830102, -1.203154, -4.907076, 0, 1, 0.1490196, 1,
-0.3814205, 0.1990695, -1.319281, 0, 1, 0.1529412, 1,
-0.3741958, 0.3443862, -0.8350435, 0, 1, 0.1607843, 1,
-0.3723703, -1.336737, -2.872873, 0, 1, 0.1647059, 1,
-0.3701099, -0.4497075, -3.748878, 0, 1, 0.172549, 1,
-0.3698511, 0.1575278, -0.4324355, 0, 1, 0.1764706, 1,
-0.367566, -0.8912018, -4.246144, 0, 1, 0.1843137, 1,
-0.3644183, -0.3489788, -2.853914, 0, 1, 0.1882353, 1,
-0.3641417, 1.209322, 1.3309, 0, 1, 0.1960784, 1,
-0.3629453, -1.007815, -2.364437, 0, 1, 0.2039216, 1,
-0.3629365, -0.6901537, -5.153132, 0, 1, 0.2078431, 1,
-0.3613522, 0.1116543, -3.702444, 0, 1, 0.2156863, 1,
-0.3596497, -0.2153997, -2.093529, 0, 1, 0.2196078, 1,
-0.3554904, 0.7022189, -0.3742047, 0, 1, 0.227451, 1,
-0.3513616, 1.004125, -0.2448837, 0, 1, 0.2313726, 1,
-0.3507285, -0.4163896, -3.183685, 0, 1, 0.2392157, 1,
-0.3495206, 0.4533056, -1.274616, 0, 1, 0.2431373, 1,
-0.3475625, 0.2089051, -2.407257, 0, 1, 0.2509804, 1,
-0.3466971, 1.773819, -1.129441, 0, 1, 0.254902, 1,
-0.3446854, -0.83968, -3.905486, 0, 1, 0.2627451, 1,
-0.3391531, 0.7912961, -2.625917, 0, 1, 0.2666667, 1,
-0.3388394, 1.298714, -0.5962563, 0, 1, 0.2745098, 1,
-0.3372634, -0.8549988, -2.166883, 0, 1, 0.2784314, 1,
-0.337197, -0.4679237, -1.576968, 0, 1, 0.2862745, 1,
-0.3357159, -1.881574, -2.922423, 0, 1, 0.2901961, 1,
-0.3352136, 0.1844806, -0.2172183, 0, 1, 0.2980392, 1,
-0.3326717, 0.02560432, -0.6291295, 0, 1, 0.3058824, 1,
-0.3274406, 0.5504037, -2.024059, 0, 1, 0.3098039, 1,
-0.3261011, -1.239671, -2.226592, 0, 1, 0.3176471, 1,
-0.3243473, -0.5328006, -3.127383, 0, 1, 0.3215686, 1,
-0.3239976, 2.399997, -1.458616, 0, 1, 0.3294118, 1,
-0.3238388, -0.2932714, -3.240671, 0, 1, 0.3333333, 1,
-0.3156627, -0.005417144, -1.820162, 0, 1, 0.3411765, 1,
-0.3145645, -0.9137921, -1.498615, 0, 1, 0.345098, 1,
-0.3143323, -1.386193, -2.142301, 0, 1, 0.3529412, 1,
-0.3103283, 0.334533, -1.601044, 0, 1, 0.3568628, 1,
-0.3075249, -0.7233623, -4.340145, 0, 1, 0.3647059, 1,
-0.304501, -0.1147669, -3.428074, 0, 1, 0.3686275, 1,
-0.3039802, 0.3993273, -0.3871579, 0, 1, 0.3764706, 1,
-0.3016112, -2.318986, -1.524357, 0, 1, 0.3803922, 1,
-0.2956254, 1.096746, -0.7054712, 0, 1, 0.3882353, 1,
-0.2945248, 0.6143765, -0.1488643, 0, 1, 0.3921569, 1,
-0.2939862, 0.7353799, 0.7015218, 0, 1, 0.4, 1,
-0.2903976, -1.361439, -3.845391, 0, 1, 0.4078431, 1,
-0.2868907, -0.3431501, -1.725238, 0, 1, 0.4117647, 1,
-0.2827178, 0.7384079, -0.4144428, 0, 1, 0.4196078, 1,
-0.2793991, -0.5389782, -4.066142, 0, 1, 0.4235294, 1,
-0.2787379, 0.6202922, 1.061283, 0, 1, 0.4313726, 1,
-0.273778, 1.303634, -0.5029736, 0, 1, 0.4352941, 1,
-0.2719283, 0.7982513, -0.07429076, 0, 1, 0.4431373, 1,
-0.2629376, -0.4196503, -3.521346, 0, 1, 0.4470588, 1,
-0.2620154, 1.295618, 0.3996376, 0, 1, 0.454902, 1,
-0.2614293, -0.08233739, -0.3925625, 0, 1, 0.4588235, 1,
-0.2578931, -2.196283, -3.307228, 0, 1, 0.4666667, 1,
-0.2552763, -0.1236007, -1.17177, 0, 1, 0.4705882, 1,
-0.2525395, 0.1193611, -1.060074, 0, 1, 0.4784314, 1,
-0.2523565, 0.3830675, 0.5464967, 0, 1, 0.4823529, 1,
-0.235817, 1.402095, 0.5760994, 0, 1, 0.4901961, 1,
-0.2309096, -3.00412, -2.779511, 0, 1, 0.4941176, 1,
-0.2272144, -1.311446, -3.314361, 0, 1, 0.5019608, 1,
-0.2219014, -0.07316382, -0.0493279, 0, 1, 0.509804, 1,
-0.2125917, 0.334677, -0.6716878, 0, 1, 0.5137255, 1,
-0.210607, 0.3067465, 0.09725751, 0, 1, 0.5215687, 1,
-0.2094414, -0.3138172, -3.744566, 0, 1, 0.5254902, 1,
-0.2082594, 1.271465, -0.8484426, 0, 1, 0.5333334, 1,
-0.2067131, 0.003490401, -0.6626171, 0, 1, 0.5372549, 1,
-0.2034173, -0.3738173, -2.82308, 0, 1, 0.5450981, 1,
-0.2020388, 1.31252, 0.408909, 0, 1, 0.5490196, 1,
-0.1964694, -0.4615019, -3.092208, 0, 1, 0.5568628, 1,
-0.1935039, 2.146474, 1.999016, 0, 1, 0.5607843, 1,
-0.1934339, -0.1933551, -3.988605, 0, 1, 0.5686275, 1,
-0.188531, 0.4181638, -1.037629, 0, 1, 0.572549, 1,
-0.1815602, -0.946372, -1.337701, 0, 1, 0.5803922, 1,
-0.1766108, -0.6782635, -2.63276, 0, 1, 0.5843138, 1,
-0.1713267, -1.17293, -2.866521, 0, 1, 0.5921569, 1,
-0.1681214, 0.6250598, 0.3065321, 0, 1, 0.5960785, 1,
-0.1663348, -0.8177527, -2.102751, 0, 1, 0.6039216, 1,
-0.1661407, 0.4211699, -0.1991865, 0, 1, 0.6117647, 1,
-0.1659853, 0.3291516, -0.3317768, 0, 1, 0.6156863, 1,
-0.1653736, -0.4842047, -1.292356, 0, 1, 0.6235294, 1,
-0.1649679, -1.079932, -2.940247, 0, 1, 0.627451, 1,
-0.156301, 0.1608834, -3.321957, 0, 1, 0.6352941, 1,
-0.1540023, 0.03703924, -1.224212, 0, 1, 0.6392157, 1,
-0.1395645, 0.5306908, 0.4677101, 0, 1, 0.6470588, 1,
-0.1338871, -0.4874561, -2.602757, 0, 1, 0.6509804, 1,
-0.1303155, -1.288147, -3.379444, 0, 1, 0.6588235, 1,
-0.1248902, -0.8772936, -0.6451194, 0, 1, 0.6627451, 1,
-0.121179, 0.9669219, -0.3531955, 0, 1, 0.6705883, 1,
-0.1190516, -0.02701327, -2.265595, 0, 1, 0.6745098, 1,
-0.1187824, -0.04301614, -1.627549, 0, 1, 0.682353, 1,
-0.1135623, 0.8044561, -0.8269209, 0, 1, 0.6862745, 1,
-0.1108821, 0.05568752, 0.2184438, 0, 1, 0.6941177, 1,
-0.1069939, 0.6009616, 0.3876316, 0, 1, 0.7019608, 1,
-0.1056666, 0.9294023, -1.015457, 0, 1, 0.7058824, 1,
-0.09832367, -0.6748067, -1.943989, 0, 1, 0.7137255, 1,
-0.09672302, 1.859805, -1.174253, 0, 1, 0.7176471, 1,
-0.092393, 0.4031329, -1.578224, 0, 1, 0.7254902, 1,
-0.09180745, -1.238293, -2.818495, 0, 1, 0.7294118, 1,
-0.08965575, 0.6834151, -1.040799, 0, 1, 0.7372549, 1,
-0.08658557, -0.1284456, -2.369774, 0, 1, 0.7411765, 1,
-0.08572865, -2.67874, -2.154147, 0, 1, 0.7490196, 1,
-0.08561052, -1.0931, -2.97143, 0, 1, 0.7529412, 1,
-0.07978364, -0.439344, -3.207005, 0, 1, 0.7607843, 1,
-0.07620439, 1.47133, -2.010865, 0, 1, 0.7647059, 1,
-0.06949744, -0.3100015, -2.280776, 0, 1, 0.772549, 1,
-0.0677964, 1.455509, -0.2675523, 0, 1, 0.7764706, 1,
-0.06756198, 1.355225, -1.479284, 0, 1, 0.7843137, 1,
-0.06543115, -0.1305548, -2.354445, 0, 1, 0.7882353, 1,
-0.0648624, -1.218606, -2.845327, 0, 1, 0.7960784, 1,
-0.06430306, 0.9777884, 0.759959, 0, 1, 0.8039216, 1,
-0.06377826, 1.160697, -1.943576, 0, 1, 0.8078431, 1,
-0.05314564, 0.7302527, -1.097348, 0, 1, 0.8156863, 1,
-0.04949521, -0.524734, -5.506642, 0, 1, 0.8196079, 1,
-0.0481865, 0.7683676, -0.9744123, 0, 1, 0.827451, 1,
-0.04490681, -0.07838389, -0.6410205, 0, 1, 0.8313726, 1,
-0.04367278, 0.04828868, -0.9404276, 0, 1, 0.8392157, 1,
-0.04343424, -1.202454, -2.784297, 0, 1, 0.8431373, 1,
-0.03984106, -0.6901857, -5.509378, 0, 1, 0.8509804, 1,
-0.03924239, -0.100929, -2.832636, 0, 1, 0.854902, 1,
-0.03816668, 0.5758998, 0.4424785, 0, 1, 0.8627451, 1,
-0.03545292, -1.474178, -5.264249, 0, 1, 0.8666667, 1,
-0.02616553, 0.2110725, -1.651407, 0, 1, 0.8745098, 1,
-0.0231916, 1.565568, -0.3778656, 0, 1, 0.8784314, 1,
-0.02291254, -1.66978, -5.434781, 0, 1, 0.8862745, 1,
-0.02141303, 0.7404159, -0.7579476, 0, 1, 0.8901961, 1,
-0.02022562, -0.3419339, -3.159586, 0, 1, 0.8980392, 1,
-0.016458, 1.151919, -0.2097161, 0, 1, 0.9058824, 1,
-0.01474957, -0.8833318, -2.644569, 0, 1, 0.9098039, 1,
-0.01351091, 0.02410232, -1.554347, 0, 1, 0.9176471, 1,
-0.01227792, 1.896661, -0.4641661, 0, 1, 0.9215686, 1,
-0.008559282, 0.9704854, -0.6728383, 0, 1, 0.9294118, 1,
-0.004085307, -2.338117, -3.288395, 0, 1, 0.9333333, 1,
-0.003800412, 1.543106, -0.4288324, 0, 1, 0.9411765, 1,
-0.003443337, 1.18224, 0.2820193, 0, 1, 0.945098, 1,
0.003741865, -1.456051, 3.263799, 0, 1, 0.9529412, 1,
0.003875676, -0.3064179, 2.844575, 0, 1, 0.9568627, 1,
0.007276032, -1.214793, 1.808313, 0, 1, 0.9647059, 1,
0.00745849, 0.0530581, 0.8224562, 0, 1, 0.9686275, 1,
0.0100749, -0.7727256, 2.78184, 0, 1, 0.9764706, 1,
0.01063314, -1.208122, 4.098454, 0, 1, 0.9803922, 1,
0.01217349, 1.194945, -0.4359072, 0, 1, 0.9882353, 1,
0.01265104, 0.6832811, -1.379655, 0, 1, 0.9921569, 1,
0.01421515, 0.1702077, 0.8907408, 0, 1, 1, 1,
0.01668588, -1.711924, 3.335066, 0, 0.9921569, 1, 1,
0.01779071, -0.2997209, 1.394746, 0, 0.9882353, 1, 1,
0.02378102, 0.07406997, 1.134599, 0, 0.9803922, 1, 1,
0.0238279, 1.842094, 1.400003, 0, 0.9764706, 1, 1,
0.02648897, -0.1838492, 2.110624, 0, 0.9686275, 1, 1,
0.02814843, -0.597042, 5.096163, 0, 0.9647059, 1, 1,
0.03140125, 1.447378, -1.755156, 0, 0.9568627, 1, 1,
0.0332017, 0.5312185, 0.7463046, 0, 0.9529412, 1, 1,
0.0334715, -1.898528, 5.077671, 0, 0.945098, 1, 1,
0.0384561, 0.003257147, 0.9960396, 0, 0.9411765, 1, 1,
0.03958545, 1.483639, 0.1248138, 0, 0.9333333, 1, 1,
0.04913447, -1.825351, 1.792795, 0, 0.9294118, 1, 1,
0.0496599, 0.5737572, -0.6301082, 0, 0.9215686, 1, 1,
0.05036178, 0.4317253, 0.2720577, 0, 0.9176471, 1, 1,
0.05084823, -1.717612, 2.092966, 0, 0.9098039, 1, 1,
0.05234975, 0.3019905, -0.2811636, 0, 0.9058824, 1, 1,
0.07026523, 0.48847, 1.124684, 0, 0.8980392, 1, 1,
0.07620802, 0.5440525, -1.311769, 0, 0.8901961, 1, 1,
0.07653013, -0.1411927, 2.609922, 0, 0.8862745, 1, 1,
0.07847591, -0.389846, 4.322602, 0, 0.8784314, 1, 1,
0.08092305, 0.1958743, 0.01236466, 0, 0.8745098, 1, 1,
0.09658668, -1.800093, 3.736221, 0, 0.8666667, 1, 1,
0.1006686, -0.1422866, 2.29593, 0, 0.8627451, 1, 1,
0.1015564, 0.359814, 0.3593673, 0, 0.854902, 1, 1,
0.102633, 1.051376, -0.1870844, 0, 0.8509804, 1, 1,
0.1035018, -0.3908469, 3.162853, 0, 0.8431373, 1, 1,
0.1046245, 0.1185945, 1.177533, 0, 0.8392157, 1, 1,
0.1108088, -0.4711437, 3.765244, 0, 0.8313726, 1, 1,
0.113284, 0.7051775, -0.1344994, 0, 0.827451, 1, 1,
0.1135785, -0.3873997, 2.515729, 0, 0.8196079, 1, 1,
0.1155534, 0.6838195, 2.260889, 0, 0.8156863, 1, 1,
0.1158158, -0.3826009, 3.263241, 0, 0.8078431, 1, 1,
0.1160164, 0.8067029, 1.71097, 0, 0.8039216, 1, 1,
0.117985, 0.7774227, -0.6830503, 0, 0.7960784, 1, 1,
0.1220244, 0.9171757, 0.9957786, 0, 0.7882353, 1, 1,
0.1298444, 0.9807076, 1.444634, 0, 0.7843137, 1, 1,
0.1331703, -1.204662, 2.018305, 0, 0.7764706, 1, 1,
0.1335656, -1.048105, 4.67202, 0, 0.772549, 1, 1,
0.1336795, 0.4231111, 1.072169, 0, 0.7647059, 1, 1,
0.1385251, -0.03318306, 1.423739, 0, 0.7607843, 1, 1,
0.138752, -0.1324819, 2.794996, 0, 0.7529412, 1, 1,
0.140897, 0.1910628, 0.6031573, 0, 0.7490196, 1, 1,
0.1415458, 2.693557, 1.157762, 0, 0.7411765, 1, 1,
0.1475261, -0.2406417, 3.627394, 0, 0.7372549, 1, 1,
0.149158, -0.8019415, 2.978389, 0, 0.7294118, 1, 1,
0.1497008, 0.7601678, -1.075053, 0, 0.7254902, 1, 1,
0.1505212, 1.064485, -0.762916, 0, 0.7176471, 1, 1,
0.1508455, 0.06409322, 2.645957, 0, 0.7137255, 1, 1,
0.1517057, -0.5570294, 2.167281, 0, 0.7058824, 1, 1,
0.1523001, -0.2507606, 2.785993, 0, 0.6980392, 1, 1,
0.1524001, -1.476948, 3.358738, 0, 0.6941177, 1, 1,
0.1551347, -0.2520792, 2.317032, 0, 0.6862745, 1, 1,
0.1565864, 1.006895, 1.068957, 0, 0.682353, 1, 1,
0.1650228, 0.8438939, 1.29105, 0, 0.6745098, 1, 1,
0.1665988, -2.955788, 3.116981, 0, 0.6705883, 1, 1,
0.1709093, 1.44571, 0.2250836, 0, 0.6627451, 1, 1,
0.1778561, 1.558126, -0.493352, 0, 0.6588235, 1, 1,
0.1786552, 0.5778887, 0.6063941, 0, 0.6509804, 1, 1,
0.1822968, 0.9409913, -0.638841, 0, 0.6470588, 1, 1,
0.1869218, -1.917433, 2.653407, 0, 0.6392157, 1, 1,
0.1880852, -0.4252176, 1.187951, 0, 0.6352941, 1, 1,
0.189266, 0.1415916, 0.260788, 0, 0.627451, 1, 1,
0.1904913, -1.170482, 2.924462, 0, 0.6235294, 1, 1,
0.1959581, -0.9496432, 3.005952, 0, 0.6156863, 1, 1,
0.2021082, 0.009614538, 0.571663, 0, 0.6117647, 1, 1,
0.2024841, 1.233018, 1.034038, 0, 0.6039216, 1, 1,
0.2058416, -0.1747516, 1.51939, 0, 0.5960785, 1, 1,
0.2061405, -0.724229, 2.899347, 0, 0.5921569, 1, 1,
0.2065389, 0.01004633, 1.049419, 0, 0.5843138, 1, 1,
0.2079817, 0.1941602, -0.08108746, 0, 0.5803922, 1, 1,
0.2119328, 1.043191, 0.7509922, 0, 0.572549, 1, 1,
0.2138418, -2.34599, 5.611138, 0, 0.5686275, 1, 1,
0.2170568, -1.513277, 2.380809, 0, 0.5607843, 1, 1,
0.2193521, -1.44435, 3.597536, 0, 0.5568628, 1, 1,
0.224152, 0.9432358, 1.018922, 0, 0.5490196, 1, 1,
0.2267168, -0.1480327, 1.415546, 0, 0.5450981, 1, 1,
0.2280753, -1.249554, 3.196808, 0, 0.5372549, 1, 1,
0.2282202, 2.199995, 0.7647405, 0, 0.5333334, 1, 1,
0.2286131, -0.1661374, 3.607406, 0, 0.5254902, 1, 1,
0.230363, -1.112612, 3.666021, 0, 0.5215687, 1, 1,
0.2304977, -0.37704, 1.677149, 0, 0.5137255, 1, 1,
0.2331211, -0.9091212, 2.170188, 0, 0.509804, 1, 1,
0.2331878, 0.5473942, 0.4076083, 0, 0.5019608, 1, 1,
0.2363528, -0.3808811, 3.603619, 0, 0.4941176, 1, 1,
0.2480009, 0.6441671, 0.3086332, 0, 0.4901961, 1, 1,
0.2480326, -0.07864662, 4.068233, 0, 0.4823529, 1, 1,
0.2482175, 1.189324, -0.148088, 0, 0.4784314, 1, 1,
0.2512052, 0.615898, 0.3450687, 0, 0.4705882, 1, 1,
0.2526938, -0.07482518, 3.706212, 0, 0.4666667, 1, 1,
0.2609663, 1.220408, -1.272884, 0, 0.4588235, 1, 1,
0.2616561, -0.3803017, 2.26394, 0, 0.454902, 1, 1,
0.2629855, 0.7322445, -1.091263, 0, 0.4470588, 1, 1,
0.2630823, 1.389322, 2.433355, 0, 0.4431373, 1, 1,
0.2650907, 0.9116873, 0.5487965, 0, 0.4352941, 1, 1,
0.2666939, 0.6031947, 0.09773089, 0, 0.4313726, 1, 1,
0.2683287, 1.014889, 0.08279122, 0, 0.4235294, 1, 1,
0.2734277, 0.8255164, -1.661186, 0, 0.4196078, 1, 1,
0.2755738, -0.497032, 1.613464, 0, 0.4117647, 1, 1,
0.2772148, -1.234916, 3.317053, 0, 0.4078431, 1, 1,
0.2801609, -0.8883385, 2.194387, 0, 0.4, 1, 1,
0.2810739, 1.139055, -0.7232209, 0, 0.3921569, 1, 1,
0.2857064, -0.3029647, 1.524644, 0, 0.3882353, 1, 1,
0.2874144, 1.020096, -0.8071578, 0, 0.3803922, 1, 1,
0.2949969, 2.103632, -0.661958, 0, 0.3764706, 1, 1,
0.3027402, 0.7326588, -0.193248, 0, 0.3686275, 1, 1,
0.3030923, -0.9106381, 1.330232, 0, 0.3647059, 1, 1,
0.3074337, 0.6350247, -0.1519349, 0, 0.3568628, 1, 1,
0.3092923, 1.946482, 1.219833, 0, 0.3529412, 1, 1,
0.3098113, 0.8639227, -0.1412117, 0, 0.345098, 1, 1,
0.3109276, -0.09870283, 3.692113, 0, 0.3411765, 1, 1,
0.3134369, -0.6399492, 1.297295, 0, 0.3333333, 1, 1,
0.3141599, -0.3105023, 3.198978, 0, 0.3294118, 1, 1,
0.3144153, -2.650412, 1.830769, 0, 0.3215686, 1, 1,
0.3148516, -1.174094, 1.979584, 0, 0.3176471, 1, 1,
0.3156728, -0.9893864, 2.548645, 0, 0.3098039, 1, 1,
0.318834, 0.4201598, -0.136496, 0, 0.3058824, 1, 1,
0.3191847, 1.301882, -0.4426994, 0, 0.2980392, 1, 1,
0.3193817, -0.8257413, 1.688869, 0, 0.2901961, 1, 1,
0.3201998, 0.3521814, 0.03873572, 0, 0.2862745, 1, 1,
0.3206721, -0.4307185, 2.437495, 0, 0.2784314, 1, 1,
0.3245745, -0.7648987, 1.275443, 0, 0.2745098, 1, 1,
0.3294952, 0.7025557, -0.5860031, 0, 0.2666667, 1, 1,
0.3336181, 0.8168916, -0.03455083, 0, 0.2627451, 1, 1,
0.3384578, -1.459659, 1.612221, 0, 0.254902, 1, 1,
0.3393789, 1.269355, -1.291979, 0, 0.2509804, 1, 1,
0.3401307, 0.03592731, 0.6848825, 0, 0.2431373, 1, 1,
0.3404784, -1.00447, 2.104886, 0, 0.2392157, 1, 1,
0.3483233, -0.5507417, 3.622384, 0, 0.2313726, 1, 1,
0.3511678, 0.5455901, 1.286345, 0, 0.227451, 1, 1,
0.353501, -0.07843779, 2.47294, 0, 0.2196078, 1, 1,
0.3574698, 1.411656, 1.05418, 0, 0.2156863, 1, 1,
0.3594732, -1.11053, 3.347061, 0, 0.2078431, 1, 1,
0.3663608, -2.416358, 1.517807, 0, 0.2039216, 1, 1,
0.3678294, 0.342728, 1.211421, 0, 0.1960784, 1, 1,
0.3716685, 0.66295, -0.07311503, 0, 0.1882353, 1, 1,
0.385421, 1.43972, 1.40886, 0, 0.1843137, 1, 1,
0.388469, -1.069839, 3.973021, 0, 0.1764706, 1, 1,
0.3939236, -1.967764, 3.327219, 0, 0.172549, 1, 1,
0.3946367, -0.3874594, 3.173139, 0, 0.1647059, 1, 1,
0.3947448, -0.1007843, -0.8542286, 0, 0.1607843, 1, 1,
0.3966853, -0.7923316, 2.225168, 0, 0.1529412, 1, 1,
0.3968382, 0.5397721, 0.8888803, 0, 0.1490196, 1, 1,
0.3981683, -0.4045475, 2.629334, 0, 0.1411765, 1, 1,
0.3992134, -0.5182961, 3.025226, 0, 0.1372549, 1, 1,
0.3995503, 0.9619884, -0.1927992, 0, 0.1294118, 1, 1,
0.4007285, -2.190825, 3.075969, 0, 0.1254902, 1, 1,
0.4011493, 0.55431, -0.7044986, 0, 0.1176471, 1, 1,
0.4068388, 0.9434608, 1.116848, 0, 0.1137255, 1, 1,
0.4087661, 0.645216, 0.608691, 0, 0.1058824, 1, 1,
0.4094627, -0.3103355, 1.559172, 0, 0.09803922, 1, 1,
0.4101436, 0.123573, 0.7244394, 0, 0.09411765, 1, 1,
0.4144023, -0.790293, 2.634856, 0, 0.08627451, 1, 1,
0.4145086, -0.09306513, 0.1938098, 0, 0.08235294, 1, 1,
0.4156956, 0.2917976, 2.152043, 0, 0.07450981, 1, 1,
0.4173622, 0.1462821, 2.031147, 0, 0.07058824, 1, 1,
0.4210265, 1.461069, 0.08325985, 0, 0.0627451, 1, 1,
0.4211619, 0.7734701, 1.102666, 0, 0.05882353, 1, 1,
0.4264579, 0.4571049, -0.6256765, 0, 0.05098039, 1, 1,
0.4267535, 1.212129, -0.03392306, 0, 0.04705882, 1, 1,
0.4284011, -0.4264423, 2.906634, 0, 0.03921569, 1, 1,
0.4293033, -0.9025408, 1.738164, 0, 0.03529412, 1, 1,
0.4308937, -0.9138154, 2.757011, 0, 0.02745098, 1, 1,
0.4320095, 0.1181173, 1.08766, 0, 0.02352941, 1, 1,
0.4391911, -0.4688436, 1.472233, 0, 0.01568628, 1, 1,
0.4435169, -0.07866634, 2.492518, 0, 0.01176471, 1, 1,
0.449544, -0.9878826, 1.963382, 0, 0.003921569, 1, 1,
0.4559132, 0.2222622, 1.799925, 0.003921569, 0, 1, 1,
0.46126, -1.242022, 2.131245, 0.007843138, 0, 1, 1,
0.4638287, -0.6813613, 2.507914, 0.01568628, 0, 1, 1,
0.4655311, -0.2662075, 2.308046, 0.01960784, 0, 1, 1,
0.4684371, 1.308889, -0.1883554, 0.02745098, 0, 1, 1,
0.4689056, 1.134917, -1.382195, 0.03137255, 0, 1, 1,
0.4751612, 0.4924401, 0.1232133, 0.03921569, 0, 1, 1,
0.4762113, 0.1398909, 1.039405, 0.04313726, 0, 1, 1,
0.4821835, -0.2504479, 1.884821, 0.05098039, 0, 1, 1,
0.4860904, -0.9348413, 3.763846, 0.05490196, 0, 1, 1,
0.4860938, -0.4150498, 0.295724, 0.0627451, 0, 1, 1,
0.4929419, 0.4481579, 0.3491173, 0.06666667, 0, 1, 1,
0.4931934, 0.2166402, 2.713757, 0.07450981, 0, 1, 1,
0.4948159, 1.61732, 0.3096715, 0.07843138, 0, 1, 1,
0.4960712, 0.2199973, 0.8274324, 0.08627451, 0, 1, 1,
0.5080591, 0.6431007, -1.227223, 0.09019608, 0, 1, 1,
0.5126732, 0.6028347, 1.039897, 0.09803922, 0, 1, 1,
0.5211811, -0.1313568, 1.117379, 0.1058824, 0, 1, 1,
0.5218546, -1.232904, 2.866704, 0.1098039, 0, 1, 1,
0.5268431, 0.4721314, 1.107611, 0.1176471, 0, 1, 1,
0.5301128, 0.626727, 1.302668, 0.1215686, 0, 1, 1,
0.5314615, -1.992509, 3.04324, 0.1294118, 0, 1, 1,
0.5340726, 1.353804, -0.1231273, 0.1333333, 0, 1, 1,
0.5348998, -1.711955, 2.867175, 0.1411765, 0, 1, 1,
0.5383129, -1.183279, 1.198047, 0.145098, 0, 1, 1,
0.5400047, 0.3726031, 1.519242, 0.1529412, 0, 1, 1,
0.5421432, -1.234003, 3.411219, 0.1568628, 0, 1, 1,
0.5422249, 0.5899299, 1.589962, 0.1647059, 0, 1, 1,
0.5424725, 0.7268765, -1.832235, 0.1686275, 0, 1, 1,
0.5432947, -0.25556, 2.653933, 0.1764706, 0, 1, 1,
0.5468072, 0.5145974, 1.382381, 0.1803922, 0, 1, 1,
0.5555109, 1.049243, -0.03782322, 0.1882353, 0, 1, 1,
0.5643398, -0.6285934, 2.204549, 0.1921569, 0, 1, 1,
0.5659243, -1.284336, 1.13755, 0.2, 0, 1, 1,
0.5693036, -0.4473549, 2.726815, 0.2078431, 0, 1, 1,
0.5697142, -0.4735997, 3.729298, 0.2117647, 0, 1, 1,
0.5722212, 0.9344396, 0.2085245, 0.2196078, 0, 1, 1,
0.5734593, -0.458517, 3.060935, 0.2235294, 0, 1, 1,
0.5762874, 0.586962, 0.7585059, 0.2313726, 0, 1, 1,
0.5787892, -0.008012296, 2.010235, 0.2352941, 0, 1, 1,
0.5862213, 0.05051668, 1.076338, 0.2431373, 0, 1, 1,
0.5910481, -1.270899, 2.692229, 0.2470588, 0, 1, 1,
0.5915809, 1.035934, -0.8970081, 0.254902, 0, 1, 1,
0.5930635, -0.1140469, 3.441442, 0.2588235, 0, 1, 1,
0.5974281, 0.162973, 0.7872896, 0.2666667, 0, 1, 1,
0.6055613, -0.04374409, 0.605226, 0.2705882, 0, 1, 1,
0.6077692, 1.09133, 0.5451823, 0.2784314, 0, 1, 1,
0.6124917, -0.9416894, 3.083173, 0.282353, 0, 1, 1,
0.6156765, 0.9529639, 1.560151, 0.2901961, 0, 1, 1,
0.6165676, 0.1053181, 2.065034, 0.2941177, 0, 1, 1,
0.6173371, 0.9897836, 2.300238, 0.3019608, 0, 1, 1,
0.6266807, 1.917951, -0.1231498, 0.3098039, 0, 1, 1,
0.6287909, 0.2714775, 0.6600378, 0.3137255, 0, 1, 1,
0.6291213, 0.9224542, -0.2076986, 0.3215686, 0, 1, 1,
0.6350238, 0.1795017, 0.9660433, 0.3254902, 0, 1, 1,
0.6376505, 2.105843, 0.4768057, 0.3333333, 0, 1, 1,
0.6389248, -0.3366723, 1.432683, 0.3372549, 0, 1, 1,
0.640666, 1.459781, 2.732145, 0.345098, 0, 1, 1,
0.6406779, -0.1087298, -0.04154623, 0.3490196, 0, 1, 1,
0.6407983, 0.2345938, 0.7953285, 0.3568628, 0, 1, 1,
0.6435962, 0.1034162, 1.680446, 0.3607843, 0, 1, 1,
0.6448537, 0.6467341, -0.5823674, 0.3686275, 0, 1, 1,
0.6629309, 0.1973863, 2.099887, 0.372549, 0, 1, 1,
0.6679345, 0.7612522, 2.39891, 0.3803922, 0, 1, 1,
0.6747195, 1.566963, 1.150627, 0.3843137, 0, 1, 1,
0.6783794, 0.4539652, 1.827312, 0.3921569, 0, 1, 1,
0.678762, -0.6593204, 2.284785, 0.3960784, 0, 1, 1,
0.6812584, -1.123139, 1.913282, 0.4039216, 0, 1, 1,
0.6826065, -0.3604578, 2.268964, 0.4117647, 0, 1, 1,
0.6931962, -0.9628975, 2.483745, 0.4156863, 0, 1, 1,
0.6977838, -0.4149196, 0.9256328, 0.4235294, 0, 1, 1,
0.701283, 0.5447841, 1.146405, 0.427451, 0, 1, 1,
0.7034684, 1.519029, 1.076645, 0.4352941, 0, 1, 1,
0.7108395, -2.341784, 3.597872, 0.4392157, 0, 1, 1,
0.7115521, 0.4096273, 1.080691, 0.4470588, 0, 1, 1,
0.7147473, 0.1050918, 1.166699, 0.4509804, 0, 1, 1,
0.7175425, 0.1175352, 1.071562, 0.4588235, 0, 1, 1,
0.718442, -0.4246928, 0.5588516, 0.4627451, 0, 1, 1,
0.720797, 1.49377, 0.8569381, 0.4705882, 0, 1, 1,
0.7254478, -0.2580767, 0.7014858, 0.4745098, 0, 1, 1,
0.7265494, -0.7301748, 3.16992, 0.4823529, 0, 1, 1,
0.7318444, -0.6792217, 2.186015, 0.4862745, 0, 1, 1,
0.7321958, 0.02150378, 1.922871, 0.4941176, 0, 1, 1,
0.7323792, 1.112506, -0.7316599, 0.5019608, 0, 1, 1,
0.7423006, 1.377857, 0.6683251, 0.5058824, 0, 1, 1,
0.7444847, -1.060476, 1.710365, 0.5137255, 0, 1, 1,
0.7480628, -0.7199013, 1.249031, 0.5176471, 0, 1, 1,
0.7521466, -0.115662, 0.5935366, 0.5254902, 0, 1, 1,
0.7531098, 1.639678, 0.8003333, 0.5294118, 0, 1, 1,
0.757418, -0.5477499, 2.118164, 0.5372549, 0, 1, 1,
0.7618708, 0.9993731, -0.4535459, 0.5411765, 0, 1, 1,
0.7655012, -0.3308254, 1.821156, 0.5490196, 0, 1, 1,
0.7716402, 1.015491, -0.1105389, 0.5529412, 0, 1, 1,
0.7725201, 0.1622545, 1.420555, 0.5607843, 0, 1, 1,
0.7731342, 0.9587421, 1.754933, 0.5647059, 0, 1, 1,
0.7763344, 0.7273851, 1.118551, 0.572549, 0, 1, 1,
0.778055, -0.2944448, 2.383475, 0.5764706, 0, 1, 1,
0.7789854, 0.9636428, 0.8023559, 0.5843138, 0, 1, 1,
0.780661, 0.01420234, 1.784319, 0.5882353, 0, 1, 1,
0.7832951, -0.8671483, 3.395629, 0.5960785, 0, 1, 1,
0.7833136, 1.40678, 1.015794, 0.6039216, 0, 1, 1,
0.7845598, -0.1604082, 2.840965, 0.6078432, 0, 1, 1,
0.792518, 1.007138, -0.5654418, 0.6156863, 0, 1, 1,
0.7928609, 1.328161, -0.2855537, 0.6196079, 0, 1, 1,
0.7929006, -0.2354268, 2.857118, 0.627451, 0, 1, 1,
0.7930315, -0.6950194, 2.515632, 0.6313726, 0, 1, 1,
0.798095, -0.7717353, 2.058427, 0.6392157, 0, 1, 1,
0.7999825, -1.348769, 3.01883, 0.6431373, 0, 1, 1,
0.8003386, -1.625746, 1.885163, 0.6509804, 0, 1, 1,
0.8079402, 1.162814, 0.4300573, 0.654902, 0, 1, 1,
0.809836, -0.5138952, 1.781496, 0.6627451, 0, 1, 1,
0.8104523, 0.9800154, 1.36676, 0.6666667, 0, 1, 1,
0.8114272, -1.394698, 1.517321, 0.6745098, 0, 1, 1,
0.8127461, 0.7001368, 0.5619737, 0.6784314, 0, 1, 1,
0.8152203, -1.378233, 0.8681504, 0.6862745, 0, 1, 1,
0.8156793, 0.1854202, 1.811782, 0.6901961, 0, 1, 1,
0.8195491, -0.2471744, 2.517618, 0.6980392, 0, 1, 1,
0.8202138, -0.626052, 0.5259745, 0.7058824, 0, 1, 1,
0.8241795, -1.296475, 1.042737, 0.7098039, 0, 1, 1,
0.8262506, 0.7317705, -0.5903025, 0.7176471, 0, 1, 1,
0.8276104, 0.5956795, 0.8452393, 0.7215686, 0, 1, 1,
0.8292477, -0.9197016, 1.259398, 0.7294118, 0, 1, 1,
0.8306533, -0.8799511, 2.706573, 0.7333333, 0, 1, 1,
0.8346171, 0.9870124, 0.9493257, 0.7411765, 0, 1, 1,
0.8408388, -1.032008, 1.347929, 0.7450981, 0, 1, 1,
0.8410742, 0.6854728, 1.670938, 0.7529412, 0, 1, 1,
0.8428723, 2.054346, 0.04998173, 0.7568628, 0, 1, 1,
0.8554923, -2.105244, 2.618678, 0.7647059, 0, 1, 1,
0.8594579, -0.7635312, 0.727713, 0.7686275, 0, 1, 1,
0.8597921, 1.066865, -1.074554, 0.7764706, 0, 1, 1,
0.8678013, -0.06884795, 1.910911, 0.7803922, 0, 1, 1,
0.8681585, -1.195405, 3.16871, 0.7882353, 0, 1, 1,
0.8718617, -1.478532, 1.977738, 0.7921569, 0, 1, 1,
0.8791305, -1.672248, 3.547994, 0.8, 0, 1, 1,
0.8877909, 0.635208, 1.801931, 0.8078431, 0, 1, 1,
0.8889078, 0.2720433, -0.9586502, 0.8117647, 0, 1, 1,
0.8897213, -0.4815603, 1.79967, 0.8196079, 0, 1, 1,
0.8954874, -0.2104093, 1.509452, 0.8235294, 0, 1, 1,
0.8984066, -1.424619, 3.361082, 0.8313726, 0, 1, 1,
0.9012579, -0.4255359, 1.260505, 0.8352941, 0, 1, 1,
0.9026173, 0.4974534, 1.518029, 0.8431373, 0, 1, 1,
0.9033849, -1.480081, 4.106279, 0.8470588, 0, 1, 1,
0.9045991, 1.162862, 2.030751, 0.854902, 0, 1, 1,
0.9057056, 1.192386, 1.049349, 0.8588235, 0, 1, 1,
0.9105367, -0.4929861, 2.141248, 0.8666667, 0, 1, 1,
0.9137818, -0.4629993, 2.596219, 0.8705882, 0, 1, 1,
0.9175127, 2.330991, -0.1347214, 0.8784314, 0, 1, 1,
0.9189222, 1.660131, -0.5253039, 0.8823529, 0, 1, 1,
0.9205137, 0.5772012, 0.09974436, 0.8901961, 0, 1, 1,
0.9207886, 0.007981037, 0.6798183, 0.8941177, 0, 1, 1,
0.9213543, 0.9831643, 1.071825, 0.9019608, 0, 1, 1,
0.9280387, -1.861012, 2.728325, 0.9098039, 0, 1, 1,
0.9476514, 1.115468, -0.7096093, 0.9137255, 0, 1, 1,
0.9488055, 0.9894407, 1.072596, 0.9215686, 0, 1, 1,
0.9550436, -0.94293, 5.00672, 0.9254902, 0, 1, 1,
0.9590917, 1.480743, 0.3934199, 0.9333333, 0, 1, 1,
0.9618391, -0.9788902, 3.211156, 0.9372549, 0, 1, 1,
0.9625931, 0.227283, 0.5635858, 0.945098, 0, 1, 1,
0.9634676, 2.176233, 0.4782657, 0.9490196, 0, 1, 1,
0.9638938, -1.359369, 2.09221, 0.9568627, 0, 1, 1,
0.9791411, 0.7121447, 1.252592, 0.9607843, 0, 1, 1,
0.980195, 0.1583361, 1.135943, 0.9686275, 0, 1, 1,
0.98913, -0.4746816, 2.510985, 0.972549, 0, 1, 1,
0.9898975, 2.562341, 0.900578, 0.9803922, 0, 1, 1,
0.9908382, -0.6127212, 2.55534, 0.9843137, 0, 1, 1,
0.9925599, 0.8862408, 2.386178, 0.9921569, 0, 1, 1,
0.9968573, 0.000838318, 1.725817, 0.9960784, 0, 1, 1,
0.9971972, 0.0729043, 1.441503, 1, 0, 0.9960784, 1,
0.9994885, 0.2283289, -0.2488037, 1, 0, 0.9882353, 1,
1.000167, -0.9945145, 3.129882, 1, 0, 0.9843137, 1,
1.008636, -0.4663587, 2.518906, 1, 0, 0.9764706, 1,
1.010906, -0.2452249, 1.248062, 1, 0, 0.972549, 1,
1.012371, -0.01117387, 2.555408, 1, 0, 0.9647059, 1,
1.012865, -0.7524573, 2.41623, 1, 0, 0.9607843, 1,
1.017131, 0.6180719, 0.6153206, 1, 0, 0.9529412, 1,
1.023111, -0.5019808, 3.467176, 1, 0, 0.9490196, 1,
1.03007, 0.6251454, 0.4163282, 1, 0, 0.9411765, 1,
1.031053, -0.3933192, 0.8554506, 1, 0, 0.9372549, 1,
1.033049, -0.7639691, 1.583024, 1, 0, 0.9294118, 1,
1.03695, 0.3257957, 3.795029, 1, 0, 0.9254902, 1,
1.039442, 0.6846495, 0.2641141, 1, 0, 0.9176471, 1,
1.039818, -0.1801798, 1.73444, 1, 0, 0.9137255, 1,
1.042928, -1.405689, 3.527752, 1, 0, 0.9058824, 1,
1.045536, 1.206776, -0.2497142, 1, 0, 0.9019608, 1,
1.046399, 0.2262994, 1.05438, 1, 0, 0.8941177, 1,
1.055083, -1.342379, 2.203566, 1, 0, 0.8862745, 1,
1.058531, 0.7816517, 0.5032644, 1, 0, 0.8823529, 1,
1.058555, -1.279364, 2.023229, 1, 0, 0.8745098, 1,
1.061999, -0.254897, 1.436008, 1, 0, 0.8705882, 1,
1.070442, 1.66957, -1.657771, 1, 0, 0.8627451, 1,
1.076017, -1.356579, 2.885281, 1, 0, 0.8588235, 1,
1.078944, -1.256942, 2.508985, 1, 0, 0.8509804, 1,
1.086908, -0.5400521, 1.134374, 1, 0, 0.8470588, 1,
1.092692, -1.4563, 0.863138, 1, 0, 0.8392157, 1,
1.09872, 0.1833153, 1.659739, 1, 0, 0.8352941, 1,
1.107816, 0.1649171, 1.67296, 1, 0, 0.827451, 1,
1.120961, 0.8393847, 2.19229, 1, 0, 0.8235294, 1,
1.124109, 0.7157217, 2.748724, 1, 0, 0.8156863, 1,
1.125576, -0.9794899, 0.8393422, 1, 0, 0.8117647, 1,
1.12699, 2.250305, 0.5499117, 1, 0, 0.8039216, 1,
1.135877, 0.09330309, 2.563146, 1, 0, 0.7960784, 1,
1.136795, 0.06142224, 0.8334814, 1, 0, 0.7921569, 1,
1.143807, 0.9978567, 0.6829826, 1, 0, 0.7843137, 1,
1.160544, 0.7717882, 0.513413, 1, 0, 0.7803922, 1,
1.165137, 0.6460535, 2.19082, 1, 0, 0.772549, 1,
1.1707, -0.4609409, 1.881714, 1, 0, 0.7686275, 1,
1.175726, 2.129383, -0.1069157, 1, 0, 0.7607843, 1,
1.1766, 0.4480585, 0.5373836, 1, 0, 0.7568628, 1,
1.179561, -1.289005, 3.165134, 1, 0, 0.7490196, 1,
1.185339, 1.13147, 0.6742486, 1, 0, 0.7450981, 1,
1.187123, 0.5574321, 2.38997, 1, 0, 0.7372549, 1,
1.201614, 0.09455858, 1.016038, 1, 0, 0.7333333, 1,
1.214535, -0.02548273, 1.682923, 1, 0, 0.7254902, 1,
1.217138, -0.6555866, 0.5898051, 1, 0, 0.7215686, 1,
1.223305, -0.6451811, 2.570036, 1, 0, 0.7137255, 1,
1.223534, -0.8494784, 2.114738, 1, 0, 0.7098039, 1,
1.226211, -0.514788, 1.046969, 1, 0, 0.7019608, 1,
1.254835, 0.7292201, -1.160286, 1, 0, 0.6941177, 1,
1.255369, -0.5280933, 2.373111, 1, 0, 0.6901961, 1,
1.268131, -0.7090812, 2.686795, 1, 0, 0.682353, 1,
1.27011, 0.3488818, 0.32343, 1, 0, 0.6784314, 1,
1.273444, -0.4458409, 1.449735, 1, 0, 0.6705883, 1,
1.282843, -0.1028057, 2.481803, 1, 0, 0.6666667, 1,
1.285002, -1.625621, 1.595649, 1, 0, 0.6588235, 1,
1.285691, -0.2432543, 2.474315, 1, 0, 0.654902, 1,
1.297319, 1.043966, 2.265678, 1, 0, 0.6470588, 1,
1.302756, 0.05726216, 0.9594928, 1, 0, 0.6431373, 1,
1.30669, 0.4578278, 3.286381, 1, 0, 0.6352941, 1,
1.312368, 1.303983, 0.7360827, 1, 0, 0.6313726, 1,
1.319171, 1.856101, -1.238922, 1, 0, 0.6235294, 1,
1.341449, -1.179101, 2.297585, 1, 0, 0.6196079, 1,
1.34545, -0.1419303, 2.120831, 1, 0, 0.6117647, 1,
1.345986, 0.2929929, 2.323743, 1, 0, 0.6078432, 1,
1.349056, 1.18529, 2.116237, 1, 0, 0.6, 1,
1.349975, 0.2835346, 1.099744, 1, 0, 0.5921569, 1,
1.359261, 0.7531769, 1.990917, 1, 0, 0.5882353, 1,
1.369683, 1.520694, 2.411696, 1, 0, 0.5803922, 1,
1.376058, -0.1757349, 0.4005335, 1, 0, 0.5764706, 1,
1.380964, 0.1460782, 1.659507, 1, 0, 0.5686275, 1,
1.381123, -0.08458696, 1.174386, 1, 0, 0.5647059, 1,
1.411688, -0.1697776, 1.159006, 1, 0, 0.5568628, 1,
1.414249, 1.166142, 1.721771, 1, 0, 0.5529412, 1,
1.417414, 0.844671, 1.989897, 1, 0, 0.5450981, 1,
1.420025, 0.0241891, 0.7744773, 1, 0, 0.5411765, 1,
1.420737, 0.4030662, 3.77626, 1, 0, 0.5333334, 1,
1.426122, 1.028998, 1.420429, 1, 0, 0.5294118, 1,
1.430022, -0.1846081, -0.7384795, 1, 0, 0.5215687, 1,
1.4319, -3.395643, 3.621088, 1, 0, 0.5176471, 1,
1.434066, 1.479243, -0.1612994, 1, 0, 0.509804, 1,
1.436975, 0.551884, 0.8927495, 1, 0, 0.5058824, 1,
1.443137, 0.4056732, -0.06527571, 1, 0, 0.4980392, 1,
1.459649, 1.320296, -0.4376703, 1, 0, 0.4901961, 1,
1.461369, -0.6750994, 1.38568, 1, 0, 0.4862745, 1,
1.471328, 2.037189, 0.9930092, 1, 0, 0.4784314, 1,
1.472314, -0.08743072, 2.019957, 1, 0, 0.4745098, 1,
1.48343, 0.1111277, 0.8549988, 1, 0, 0.4666667, 1,
1.487919, 0.3405548, 3.105423, 1, 0, 0.4627451, 1,
1.502507, 1.089702, 0.356813, 1, 0, 0.454902, 1,
1.517629, -0.852343, 3.320416, 1, 0, 0.4509804, 1,
1.529236, -1.437044, 1.051795, 1, 0, 0.4431373, 1,
1.544176, 1.087276, 0.8782188, 1, 0, 0.4392157, 1,
1.556538, -1.375942, 2.300569, 1, 0, 0.4313726, 1,
1.561823, -0.08609537, 2.768512, 1, 0, 0.427451, 1,
1.564399, -0.4274023, 1.616853, 1, 0, 0.4196078, 1,
1.564522, -0.4354757, 2.269319, 1, 0, 0.4156863, 1,
1.5703, 0.3961849, 0.4620718, 1, 0, 0.4078431, 1,
1.570433, -1.697454, 1.717134, 1, 0, 0.4039216, 1,
1.576867, 0.1063047, 2.473704, 1, 0, 0.3960784, 1,
1.586145, -1.112833, -0.6945241, 1, 0, 0.3882353, 1,
1.586669, -0.05921048, 0.09373064, 1, 0, 0.3843137, 1,
1.598041, 0.6432312, 1.630909, 1, 0, 0.3764706, 1,
1.641167, 0.9329586, 1.725313, 1, 0, 0.372549, 1,
1.644507, -0.6493716, 3.613852, 1, 0, 0.3647059, 1,
1.657767, 0.6517225, 1.485394, 1, 0, 0.3607843, 1,
1.658272, 0.4102789, -1.098785, 1, 0, 0.3529412, 1,
1.65997, 0.251631, -0.02459654, 1, 0, 0.3490196, 1,
1.66116, 0.435616, 1.882013, 1, 0, 0.3411765, 1,
1.663164, 1.195308, 0.9383677, 1, 0, 0.3372549, 1,
1.667882, -0.02847925, 2.505178, 1, 0, 0.3294118, 1,
1.679832, 1.566049, 1.494771, 1, 0, 0.3254902, 1,
1.680966, 0.7768202, 0.4855788, 1, 0, 0.3176471, 1,
1.682297, -1.263583, 2.347284, 1, 0, 0.3137255, 1,
1.684129, -0.5457326, 2.887924, 1, 0, 0.3058824, 1,
1.692759, 0.2752951, 1.360775, 1, 0, 0.2980392, 1,
1.698868, 0.0405222, -0.2671588, 1, 0, 0.2941177, 1,
1.703264, 1.489856, 1.220931, 1, 0, 0.2862745, 1,
1.714491, -0.05640426, 2.240455, 1, 0, 0.282353, 1,
1.728936, 1.570832, 1.40691, 1, 0, 0.2745098, 1,
1.729831, 2.09411, 0.6237261, 1, 0, 0.2705882, 1,
1.747766, 0.2525669, 0.2878333, 1, 0, 0.2627451, 1,
1.767962, 0.01059641, 1.631751, 1, 0, 0.2588235, 1,
1.773376, 0.5390665, -0.4115913, 1, 0, 0.2509804, 1,
1.777472, 0.2360569, 2.586394, 1, 0, 0.2470588, 1,
1.789959, -0.667909, 3.094733, 1, 0, 0.2392157, 1,
1.79201, -0.6649526, -0.5164105, 1, 0, 0.2352941, 1,
1.792279, -0.5671904, 2.001145, 1, 0, 0.227451, 1,
1.811532, 0.4220285, 1.501406, 1, 0, 0.2235294, 1,
1.835328, -0.2971802, 2.133579, 1, 0, 0.2156863, 1,
1.839372, 0.9710879, 0.8150257, 1, 0, 0.2117647, 1,
1.858879, 0.4801704, 0.8099796, 1, 0, 0.2039216, 1,
1.861909, -0.604122, 0.3743318, 1, 0, 0.1960784, 1,
1.878363, -0.1059195, -1.295832, 1, 0, 0.1921569, 1,
1.880566, 1.672497, 1.364222, 1, 0, 0.1843137, 1,
1.905016, -0.6896753, 2.078857, 1, 0, 0.1803922, 1,
1.935688, 0.8769544, 1.692468, 1, 0, 0.172549, 1,
1.945454, 1.380455, 0.5923071, 1, 0, 0.1686275, 1,
1.973484, 1.187495, 2.05517, 1, 0, 0.1607843, 1,
1.989972, -0.5496772, 0.9677142, 1, 0, 0.1568628, 1,
2.01157, -1.141002, -0.6419011, 1, 0, 0.1490196, 1,
2.027889, -1.357806, 3.390732, 1, 0, 0.145098, 1,
2.029966, -1.351066, 2.094379, 1, 0, 0.1372549, 1,
2.081569, 0.1126749, 1.448349, 1, 0, 0.1333333, 1,
2.107981, -0.04672689, 1.360808, 1, 0, 0.1254902, 1,
2.129699, -0.6820438, 1.739969, 1, 0, 0.1215686, 1,
2.149304, -2.14159, 1.402216, 1, 0, 0.1137255, 1,
2.156204, 0.1430723, 0.4158, 1, 0, 0.1098039, 1,
2.166493, -1.388721, 1.167986, 1, 0, 0.1019608, 1,
2.232884, -0.1143194, 2.789093, 1, 0, 0.09411765, 1,
2.244736, -0.7189441, 2.506668, 1, 0, 0.09019608, 1,
2.266181, -0.06050308, 2.614742, 1, 0, 0.08235294, 1,
2.287259, 0.8007176, 2.349289, 1, 0, 0.07843138, 1,
2.300925, -0.9964931, 3.417765, 1, 0, 0.07058824, 1,
2.309337, 0.6665887, 1.943369, 1, 0, 0.06666667, 1,
2.353463, 2.18848, -0.5955443, 1, 0, 0.05882353, 1,
2.375778, -1.306627, 2.209782, 1, 0, 0.05490196, 1,
2.466901, 0.6800721, 0.797812, 1, 0, 0.04705882, 1,
2.527621, 1.109468, 1.42073, 1, 0, 0.04313726, 1,
2.555319, -1.063653, 2.789509, 1, 0, 0.03529412, 1,
2.569735, 1.215187, 2.898091, 1, 0, 0.03137255, 1,
2.621958, 0.2315584, 1.960064, 1, 0, 0.02352941, 1,
2.657506, 0.8348935, -0.1419445, 1, 0, 0.01960784, 1,
2.819152, 0.4591332, 0.5712519, 1, 0, 0.01176471, 1,
2.839691, -0.4614887, 1.780477, 1, 0, 0.007843138, 1
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
-0.7132958, -4.485177, -7.394305, 0, -0.5, 0.5, 0.5,
-0.7132958, -4.485177, -7.394305, 1, -0.5, 0.5, 0.5,
-0.7132958, -4.485177, -7.394305, 1, 1.5, 0.5, 0.5,
-0.7132958, -4.485177, -7.394305, 0, 1.5, 0.5, 0.5
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
-5.470746, -0.1816777, -7.394305, 0, -0.5, 0.5, 0.5,
-5.470746, -0.1816777, -7.394305, 1, -0.5, 0.5, 0.5,
-5.470746, -0.1816777, -7.394305, 1, 1.5, 0.5, 0.5,
-5.470746, -0.1816777, -7.394305, 0, 1.5, 0.5, 0.5
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
-5.470746, -4.485177, 0.05087996, 0, -0.5, 0.5, 0.5,
-5.470746, -4.485177, 0.05087996, 1, -0.5, 0.5, 0.5,
-5.470746, -4.485177, 0.05087996, 1, 1.5, 0.5, 0.5,
-5.470746, -4.485177, 0.05087996, 0, 1.5, 0.5, 0.5
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
-4, -3.492062, -5.676186,
2, -3.492062, -5.676186,
-4, -3.492062, -5.676186,
-4, -3.657581, -5.962539,
-2, -3.492062, -5.676186,
-2, -3.657581, -5.962539,
0, -3.492062, -5.676186,
0, -3.657581, -5.962539,
2, -3.492062, -5.676186,
2, -3.657581, -5.962539
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
-4, -3.98862, -6.535245, 0, -0.5, 0.5, 0.5,
-4, -3.98862, -6.535245, 1, -0.5, 0.5, 0.5,
-4, -3.98862, -6.535245, 1, 1.5, 0.5, 0.5,
-4, -3.98862, -6.535245, 0, 1.5, 0.5, 0.5,
-2, -3.98862, -6.535245, 0, -0.5, 0.5, 0.5,
-2, -3.98862, -6.535245, 1, -0.5, 0.5, 0.5,
-2, -3.98862, -6.535245, 1, 1.5, 0.5, 0.5,
-2, -3.98862, -6.535245, 0, 1.5, 0.5, 0.5,
0, -3.98862, -6.535245, 0, -0.5, 0.5, 0.5,
0, -3.98862, -6.535245, 1, -0.5, 0.5, 0.5,
0, -3.98862, -6.535245, 1, 1.5, 0.5, 0.5,
0, -3.98862, -6.535245, 0, 1.5, 0.5, 0.5,
2, -3.98862, -6.535245, 0, -0.5, 0.5, 0.5,
2, -3.98862, -6.535245, 1, -0.5, 0.5, 0.5,
2, -3.98862, -6.535245, 1, 1.5, 0.5, 0.5,
2, -3.98862, -6.535245, 0, 1.5, 0.5, 0.5
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
-4.372873, -3, -5.676186,
-4.372873, 3, -5.676186,
-4.372873, -3, -5.676186,
-4.555851, -3, -5.962539,
-4.372873, -2, -5.676186,
-4.555851, -2, -5.962539,
-4.372873, -1, -5.676186,
-4.555851, -1, -5.962539,
-4.372873, 0, -5.676186,
-4.555851, 0, -5.962539,
-4.372873, 1, -5.676186,
-4.555851, 1, -5.962539,
-4.372873, 2, -5.676186,
-4.555851, 2, -5.962539,
-4.372873, 3, -5.676186,
-4.555851, 3, -5.962539
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
-4.921809, -3, -6.535245, 0, -0.5, 0.5, 0.5,
-4.921809, -3, -6.535245, 1, -0.5, 0.5, 0.5,
-4.921809, -3, -6.535245, 1, 1.5, 0.5, 0.5,
-4.921809, -3, -6.535245, 0, 1.5, 0.5, 0.5,
-4.921809, -2, -6.535245, 0, -0.5, 0.5, 0.5,
-4.921809, -2, -6.535245, 1, -0.5, 0.5, 0.5,
-4.921809, -2, -6.535245, 1, 1.5, 0.5, 0.5,
-4.921809, -2, -6.535245, 0, 1.5, 0.5, 0.5,
-4.921809, -1, -6.535245, 0, -0.5, 0.5, 0.5,
-4.921809, -1, -6.535245, 1, -0.5, 0.5, 0.5,
-4.921809, -1, -6.535245, 1, 1.5, 0.5, 0.5,
-4.921809, -1, -6.535245, 0, 1.5, 0.5, 0.5,
-4.921809, 0, -6.535245, 0, -0.5, 0.5, 0.5,
-4.921809, 0, -6.535245, 1, -0.5, 0.5, 0.5,
-4.921809, 0, -6.535245, 1, 1.5, 0.5, 0.5,
-4.921809, 0, -6.535245, 0, 1.5, 0.5, 0.5,
-4.921809, 1, -6.535245, 0, -0.5, 0.5, 0.5,
-4.921809, 1, -6.535245, 1, -0.5, 0.5, 0.5,
-4.921809, 1, -6.535245, 1, 1.5, 0.5, 0.5,
-4.921809, 1, -6.535245, 0, 1.5, 0.5, 0.5,
-4.921809, 2, -6.535245, 0, -0.5, 0.5, 0.5,
-4.921809, 2, -6.535245, 1, -0.5, 0.5, 0.5,
-4.921809, 2, -6.535245, 1, 1.5, 0.5, 0.5,
-4.921809, 2, -6.535245, 0, 1.5, 0.5, 0.5,
-4.921809, 3, -6.535245, 0, -0.5, 0.5, 0.5,
-4.921809, 3, -6.535245, 1, -0.5, 0.5, 0.5,
-4.921809, 3, -6.535245, 1, 1.5, 0.5, 0.5,
-4.921809, 3, -6.535245, 0, 1.5, 0.5, 0.5
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
-4.372873, -3.492062, -4,
-4.372873, -3.492062, 4,
-4.372873, -3.492062, -4,
-4.555851, -3.657581, -4,
-4.372873, -3.492062, -2,
-4.555851, -3.657581, -2,
-4.372873, -3.492062, 0,
-4.555851, -3.657581, 0,
-4.372873, -3.492062, 2,
-4.555851, -3.657581, 2,
-4.372873, -3.492062, 4,
-4.555851, -3.657581, 4
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
-4.921809, -3.98862, -4, 0, -0.5, 0.5, 0.5,
-4.921809, -3.98862, -4, 1, -0.5, 0.5, 0.5,
-4.921809, -3.98862, -4, 1, 1.5, 0.5, 0.5,
-4.921809, -3.98862, -4, 0, 1.5, 0.5, 0.5,
-4.921809, -3.98862, -2, 0, -0.5, 0.5, 0.5,
-4.921809, -3.98862, -2, 1, -0.5, 0.5, 0.5,
-4.921809, -3.98862, -2, 1, 1.5, 0.5, 0.5,
-4.921809, -3.98862, -2, 0, 1.5, 0.5, 0.5,
-4.921809, -3.98862, 0, 0, -0.5, 0.5, 0.5,
-4.921809, -3.98862, 0, 1, -0.5, 0.5, 0.5,
-4.921809, -3.98862, 0, 1, 1.5, 0.5, 0.5,
-4.921809, -3.98862, 0, 0, 1.5, 0.5, 0.5,
-4.921809, -3.98862, 2, 0, -0.5, 0.5, 0.5,
-4.921809, -3.98862, 2, 1, -0.5, 0.5, 0.5,
-4.921809, -3.98862, 2, 1, 1.5, 0.5, 0.5,
-4.921809, -3.98862, 2, 0, 1.5, 0.5, 0.5,
-4.921809, -3.98862, 4, 0, -0.5, 0.5, 0.5,
-4.921809, -3.98862, 4, 1, -0.5, 0.5, 0.5,
-4.921809, -3.98862, 4, 1, 1.5, 0.5, 0.5,
-4.921809, -3.98862, 4, 0, 1.5, 0.5, 0.5
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
-4.372873, -3.492062, -5.676186,
-4.372873, 3.128706, -5.676186,
-4.372873, -3.492062, 5.777946,
-4.372873, 3.128706, 5.777946,
-4.372873, -3.492062, -5.676186,
-4.372873, -3.492062, 5.777946,
-4.372873, 3.128706, -5.676186,
-4.372873, 3.128706, 5.777946,
-4.372873, -3.492062, -5.676186,
2.946281, -3.492062, -5.676186,
-4.372873, -3.492062, 5.777946,
2.946281, -3.492062, 5.777946,
-4.372873, 3.128706, -5.676186,
2.946281, 3.128706, -5.676186,
-4.372873, 3.128706, 5.777946,
2.946281, 3.128706, 5.777946,
2.946281, -3.492062, -5.676186,
2.946281, 3.128706, -5.676186,
2.946281, -3.492062, 5.777946,
2.946281, 3.128706, 5.777946,
2.946281, -3.492062, -5.676186,
2.946281, -3.492062, 5.777946,
2.946281, 3.128706, -5.676186,
2.946281, 3.128706, 5.777946
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
var radius = 8.073562;
var distance = 35.92019;
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
mvMatrix.translate( 0.7132958, 0.1816777, -0.05087996 );
mvMatrix.scale( 1.192664, 1.318471, 0.7621087 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.92019);
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
primisulfuron-methyl<-read.table("primisulfuron-methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-primisulfuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'primisulfuron' not found
```

```r
y<-primisulfuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'primisulfuron' not found
```

```r
z<-primisulfuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'primisulfuron' not found
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
-4.266283, -1.203654, -1.486262, 0, 0, 1, 1, 1,
-2.710072, -1.645759, -4.053904, 1, 0, 0, 1, 1,
-2.658627, 1.177512, -2.23545, 1, 0, 0, 1, 1,
-2.566833, 0.6138895, -1.64877, 1, 0, 0, 1, 1,
-2.54923, -0.6922354, -1.209037, 1, 0, 0, 1, 1,
-2.469929, 0.6703079, -1.542047, 1, 0, 0, 1, 1,
-2.382864, -0.3196585, -1.34788, 0, 0, 0, 1, 1,
-2.376406, -0.581834, -2.635025, 0, 0, 0, 1, 1,
-2.369887, 0.3167319, 0.0773883, 0, 0, 0, 1, 1,
-2.204149, -0.1241631, -2.113302, 0, 0, 0, 1, 1,
-2.193611, -1.762916, -2.557072, 0, 0, 0, 1, 1,
-2.181177, 0.06917346, -1.077634, 0, 0, 0, 1, 1,
-2.163813, 0.7018608, -2.215936, 0, 0, 0, 1, 1,
-2.128849, 0.6249163, -2.929549, 1, 1, 1, 1, 1,
-2.107631, -0.4207362, -0.9258237, 1, 1, 1, 1, 1,
-2.097167, 0.37479, 1.634453, 1, 1, 1, 1, 1,
-2.083483, -0.1973551, -1.481789, 1, 1, 1, 1, 1,
-2.079571, -0.3608572, -0.1087003, 1, 1, 1, 1, 1,
-1.977237, -0.6245668, -1.397165, 1, 1, 1, 1, 1,
-1.975862, 0.9208812, -0.7281803, 1, 1, 1, 1, 1,
-1.973573, 2.364224, -1.307204, 1, 1, 1, 1, 1,
-1.955674, 1.760302, -1.48586, 1, 1, 1, 1, 1,
-1.947723, -1.42544, -2.721763, 1, 1, 1, 1, 1,
-1.939543, 0.8053073, -0.7749228, 1, 1, 1, 1, 1,
-1.934966, 0.6251513, -1.655426, 1, 1, 1, 1, 1,
-1.914078, -0.7630594, -3.386511, 1, 1, 1, 1, 1,
-1.872272, -0.008183391, -1.52289, 1, 1, 1, 1, 1,
-1.857605, -0.3003377, -2.279223, 1, 1, 1, 1, 1,
-1.856459, -0.5164003, -2.168659, 0, 0, 1, 1, 1,
-1.850892, 0.3661097, -1.397327, 1, 0, 0, 1, 1,
-1.849861, -0.755924, -1.443403, 1, 0, 0, 1, 1,
-1.844086, 0.7551894, -0.9830067, 1, 0, 0, 1, 1,
-1.838526, -0.367879, -0.4673914, 1, 0, 0, 1, 1,
-1.828076, 0.7464533, -1.751304, 1, 0, 0, 1, 1,
-1.811942, 0.3517272, -1.986865, 0, 0, 0, 1, 1,
-1.807659, -0.5367237, -4.045402, 0, 0, 0, 1, 1,
-1.804368, 0.279476, -0.6662151, 0, 0, 0, 1, 1,
-1.80209, 0.07592457, -2.275267, 0, 0, 0, 1, 1,
-1.799282, 0.8418089, -1.723192, 0, 0, 0, 1, 1,
-1.784553, -1.469297, -1.735134, 0, 0, 0, 1, 1,
-1.783401, -0.2540286, -2.602066, 0, 0, 0, 1, 1,
-1.749928, 1.8514, 0.4273532, 1, 1, 1, 1, 1,
-1.681844, -0.6672883, -0.9679909, 1, 1, 1, 1, 1,
-1.677087, -0.254991, -1.494764, 1, 1, 1, 1, 1,
-1.633612, 0.2173734, -0.2509493, 1, 1, 1, 1, 1,
-1.631934, 2.473697, -1.673021, 1, 1, 1, 1, 1,
-1.608622, -1.057614, -3.573279, 1, 1, 1, 1, 1,
-1.575493, -0.9770226, -1.814935, 1, 1, 1, 1, 1,
-1.573565, 1.171396, -0.4536086, 1, 1, 1, 1, 1,
-1.549153, 0.3539389, -2.819286, 1, 1, 1, 1, 1,
-1.547158, -0.1692688, -1.099213, 1, 1, 1, 1, 1,
-1.541597, 0.2825951, -2.379232, 1, 1, 1, 1, 1,
-1.536488, -2.013196, -2.682992, 1, 1, 1, 1, 1,
-1.536105, 1.371191, -0.1245267, 1, 1, 1, 1, 1,
-1.51203, -1.389423, -3.195741, 1, 1, 1, 1, 1,
-1.505809, -1.211676, 0.509102, 1, 1, 1, 1, 1,
-1.491127, 1.55728, 0.402675, 0, 0, 1, 1, 1,
-1.485871, -1.17581, -1.42066, 1, 0, 0, 1, 1,
-1.472289, -0.4744253, -1.293083, 1, 0, 0, 1, 1,
-1.461423, -1.042741, -2.317308, 1, 0, 0, 1, 1,
-1.459075, -2.247877, -2.517373, 1, 0, 0, 1, 1,
-1.457234, -1.021812, -1.55047, 1, 0, 0, 1, 1,
-1.456784, 0.3350613, -1.940138, 0, 0, 0, 1, 1,
-1.384787, 1.56269, 1.225503, 0, 0, 0, 1, 1,
-1.384052, 0.6669021, -0.7179695, 0, 0, 0, 1, 1,
-1.379874, 0.6150634, -0.9307269, 0, 0, 0, 1, 1,
-1.374844, 1.810029, 0.6946529, 0, 0, 0, 1, 1,
-1.36981, 0.2352752, -1.816893, 0, 0, 0, 1, 1,
-1.366589, -0.4167944, -0.3936591, 0, 0, 0, 1, 1,
-1.360032, -1.282711, -2.735286, 1, 1, 1, 1, 1,
-1.359986, 0.7970135, 0.3799824, 1, 1, 1, 1, 1,
-1.350179, -0.5954363, -1.052408, 1, 1, 1, 1, 1,
-1.350131, -1.853763, 0.03294327, 1, 1, 1, 1, 1,
-1.349207, -0.06883296, -1.669523, 1, 1, 1, 1, 1,
-1.331759, 0.01387937, -2.840092, 1, 1, 1, 1, 1,
-1.328199, 0.285964, -1.58085, 1, 1, 1, 1, 1,
-1.327269, -0.1004094, -0.5296447, 1, 1, 1, 1, 1,
-1.326443, -1.815185, -2.950389, 1, 1, 1, 1, 1,
-1.322999, 0.07535403, -1.852526, 1, 1, 1, 1, 1,
-1.318135, -0.3503578, -2.14717, 1, 1, 1, 1, 1,
-1.312487, 0.306308, -2.199564, 1, 1, 1, 1, 1,
-1.307576, 0.4350641, -1.307475, 1, 1, 1, 1, 1,
-1.301832, 0.9213387, -1.913834, 1, 1, 1, 1, 1,
-1.297869, -0.8610434, -0.1744832, 1, 1, 1, 1, 1,
-1.297054, -0.2622193, -1.51624, 0, 0, 1, 1, 1,
-1.296498, 1.285268, -0.3629696, 1, 0, 0, 1, 1,
-1.284542, -0.2375433, -3.255648, 1, 0, 0, 1, 1,
-1.280942, 0.132947, -1.982651, 1, 0, 0, 1, 1,
-1.273782, 1.037133, -0.5452577, 1, 0, 0, 1, 1,
-1.25852, 2.19505, 0.8048295, 1, 0, 0, 1, 1,
-1.225805, 0.8572748, -1.681326, 0, 0, 0, 1, 1,
-1.221353, 0.2103486, -0.06666793, 0, 0, 0, 1, 1,
-1.217287, 1.148062, -0.4222345, 0, 0, 0, 1, 1,
-1.215311, 0.570976, -1.743722, 0, 0, 0, 1, 1,
-1.208994, 1.276811, -2.968892, 0, 0, 0, 1, 1,
-1.208571, 0.72107, -0.4596732, 0, 0, 0, 1, 1,
-1.208125, 0.6984023, -0.8302096, 0, 0, 0, 1, 1,
-1.20584, 0.4157194, -0.7888567, 1, 1, 1, 1, 1,
-1.205827, -1.018524, -3.047653, 1, 1, 1, 1, 1,
-1.20141, -0.6575436, -2.294944, 1, 1, 1, 1, 1,
-1.200202, -1.499614, -2.112159, 1, 1, 1, 1, 1,
-1.198445, -0.3685397, -2.282074, 1, 1, 1, 1, 1,
-1.197792, -0.3999494, -1.672336, 1, 1, 1, 1, 1,
-1.196567, -1.675503, -1.88424, 1, 1, 1, 1, 1,
-1.18922, -0.9325255, -2.464084, 1, 1, 1, 1, 1,
-1.183571, 0.8925698, -1.365911, 1, 1, 1, 1, 1,
-1.176243, -0.1175056, -1.19056, 1, 1, 1, 1, 1,
-1.166955, 1.228463, -2.342774, 1, 1, 1, 1, 1,
-1.158399, -0.06350826, -4.789465, 1, 1, 1, 1, 1,
-1.149822, 0.1010043, -0.882816, 1, 1, 1, 1, 1,
-1.145927, 0.1007328, -0.7834592, 1, 1, 1, 1, 1,
-1.143387, 0.4490007, -1.191827, 1, 1, 1, 1, 1,
-1.141615, -1.911686, -1.874998, 0, 0, 1, 1, 1,
-1.139963, -1.245845, -2.206375, 1, 0, 0, 1, 1,
-1.134681, -1.055268, -2.346345, 1, 0, 0, 1, 1,
-1.125112, -0.5612038, -3.066081, 1, 0, 0, 1, 1,
-1.115127, 2.194518, -0.2945184, 1, 0, 0, 1, 1,
-1.105888, -0.1907235, -2.010182, 1, 0, 0, 1, 1,
-1.103798, -0.7222361, -3.435272, 0, 0, 0, 1, 1,
-1.103091, 0.1192346, -0.9631091, 0, 0, 0, 1, 1,
-1.099063, 2.073278, -0.350845, 0, 0, 0, 1, 1,
-1.096799, -0.6264117, -3.289778, 0, 0, 0, 1, 1,
-1.092154, 1.563145, -3.254161, 0, 0, 0, 1, 1,
-1.090585, 1.099526, -1.396829, 0, 0, 0, 1, 1,
-1.088305, 0.2378597, -1.515062, 0, 0, 0, 1, 1,
-1.081369, 0.2869485, -0.222286, 1, 1, 1, 1, 1,
-1.080353, -0.218404, -2.351318, 1, 1, 1, 1, 1,
-1.075294, -1.530603, -1.242704, 1, 1, 1, 1, 1,
-1.070132, 0.596046, -1.124902, 1, 1, 1, 1, 1,
-1.067079, -0.2995366, -3.158705, 1, 1, 1, 1, 1,
-1.063887, 0.2602784, -3.0048, 1, 1, 1, 1, 1,
-1.062209, 1.679481, -1.778871, 1, 1, 1, 1, 1,
-1.062204, -1.429437, -3.119, 1, 1, 1, 1, 1,
-1.062135, -0.6925932, -3.040984, 1, 1, 1, 1, 1,
-1.059648, -1.374229, -2.503891, 1, 1, 1, 1, 1,
-1.050326, -0.3337135, -1.765314, 1, 1, 1, 1, 1,
-1.033758, 0.08940113, -0.3193373, 1, 1, 1, 1, 1,
-1.024327, 0.1255557, -4.493998, 1, 1, 1, 1, 1,
-1.018389, -0.4404775, -2.120207, 1, 1, 1, 1, 1,
-1.016468, -1.033569, -2.847803, 1, 1, 1, 1, 1,
-1.016017, -0.09637234, -0.0163919, 0, 0, 1, 1, 1,
-1.014097, 1.93747, 0.4202825, 1, 0, 0, 1, 1,
-1.013186, -0.465494, -1.585489, 1, 0, 0, 1, 1,
-1.007491, -1.747303, -2.084636, 1, 0, 0, 1, 1,
-1.005283, 1.038905, -1.981957, 1, 0, 0, 1, 1,
-1.003944, 0.01549724, -2.364892, 1, 0, 0, 1, 1,
-0.9966429, 2.060007, -1.406057, 0, 0, 0, 1, 1,
-0.9965377, 2.055594, -2.465681, 0, 0, 0, 1, 1,
-0.9897701, -1.032626, -2.280457, 0, 0, 0, 1, 1,
-0.9853839, 0.5026972, -1.277765, 0, 0, 0, 1, 1,
-0.9839219, 0.220793, -0.09667481, 0, 0, 0, 1, 1,
-0.9796525, -1.498835, -3.340326, 0, 0, 0, 1, 1,
-0.9795283, -0.7395123, -1.153312, 0, 0, 0, 1, 1,
-0.9731275, 0.3835351, -0.7009673, 1, 1, 1, 1, 1,
-0.9703649, 0.1268635, -0.836328, 1, 1, 1, 1, 1,
-0.9700989, 0.8682864, -0.1690945, 1, 1, 1, 1, 1,
-0.9646866, 0.1144793, 0.07791574, 1, 1, 1, 1, 1,
-0.9630019, -1.034984, -0.3979867, 1, 1, 1, 1, 1,
-0.9570547, 0.310697, -1.343884, 1, 1, 1, 1, 1,
-0.9542991, 1.505781, 0.2927881, 1, 1, 1, 1, 1,
-0.952986, -0.1446394, -1.64652, 1, 1, 1, 1, 1,
-0.9443992, 0.3821358, -0.6163922, 1, 1, 1, 1, 1,
-0.9398696, -0.1099835, -1.533661, 1, 1, 1, 1, 1,
-0.9398179, -1.177829, -2.011877, 1, 1, 1, 1, 1,
-0.9366236, -1.927865, -3.535242, 1, 1, 1, 1, 1,
-0.9342092, -0.5379883, -1.896777, 1, 1, 1, 1, 1,
-0.9315598, 0.1276276, -1.241471, 1, 1, 1, 1, 1,
-0.9298765, 0.4297223, -0.02258269, 1, 1, 1, 1, 1,
-0.9287114, 0.7957752, -1.341436, 0, 0, 1, 1, 1,
-0.9285583, 2.033809, -0.4902641, 1, 0, 0, 1, 1,
-0.9242473, -0.8145584, -0.3951581, 1, 0, 0, 1, 1,
-0.9225347, 0.7432272, -2.368344, 1, 0, 0, 1, 1,
-0.9207776, -0.2172766, -2.239345, 1, 0, 0, 1, 1,
-0.9198142, -0.1966481, -1.782736, 1, 0, 0, 1, 1,
-0.9160343, -0.9591791, -2.633189, 0, 0, 0, 1, 1,
-0.9148291, -1.31254, -2.179935, 0, 0, 0, 1, 1,
-0.9122536, -0.2586624, -4.862229, 0, 0, 0, 1, 1,
-0.8977592, 1.089968, -1.617994, 0, 0, 0, 1, 1,
-0.8975634, -1.069498, -3.328144, 0, 0, 0, 1, 1,
-0.8974821, 0.2645139, -0.2579049, 0, 0, 0, 1, 1,
-0.8948538, 0.2846903, -2.230731, 0, 0, 0, 1, 1,
-0.8921379, -1.149444, -1.434979, 1, 1, 1, 1, 1,
-0.8867188, -0.9446298, -4.204071, 1, 1, 1, 1, 1,
-0.8819671, 0.6250416, -0.2156221, 1, 1, 1, 1, 1,
-0.8800407, -1.319939, -2.87603, 1, 1, 1, 1, 1,
-0.8784442, 0.5298026, 0.6912986, 1, 1, 1, 1, 1,
-0.8774224, 1.84177, -1.510426, 1, 1, 1, 1, 1,
-0.8741735, 0.5064998, 0.5038282, 1, 1, 1, 1, 1,
-0.8651376, -0.8035867, -2.62215, 1, 1, 1, 1, 1,
-0.8643655, -0.3475584, -1.86041, 1, 1, 1, 1, 1,
-0.851706, 0.5032541, -0.775438, 1, 1, 1, 1, 1,
-0.8499307, 1.306211, -0.2502469, 1, 1, 1, 1, 1,
-0.8494447, -0.4145917, -3.203154, 1, 1, 1, 1, 1,
-0.8462695, -0.1619179, -3.186273, 1, 1, 1, 1, 1,
-0.8363048, -0.9898755, -2.87319, 1, 1, 1, 1, 1,
-0.8336782, -0.9404102, -2.842838, 1, 1, 1, 1, 1,
-0.8330336, 0.3200735, 1.864037, 0, 0, 1, 1, 1,
-0.832531, 0.1616308, -0.6640663, 1, 0, 0, 1, 1,
-0.8321177, -0.154065, -0.7414068, 1, 0, 0, 1, 1,
-0.8272636, 0.00949211, -0.7389763, 1, 0, 0, 1, 1,
-0.8238279, -0.5480788, -2.522319, 1, 0, 0, 1, 1,
-0.8230271, -0.7009277, -3.291165, 1, 0, 0, 1, 1,
-0.81879, 2.348186, -2.080673, 0, 0, 0, 1, 1,
-0.8146904, -0.1952598, -2.397705, 0, 0, 0, 1, 1,
-0.8125221, -0.8621017, -1.030461, 0, 0, 0, 1, 1,
-0.8100881, -0.654267, 0.09404564, 0, 0, 0, 1, 1,
-0.8077039, 0.7235449, -0.04166328, 0, 0, 0, 1, 1,
-0.8060319, 0.6431395, -1.906444, 0, 0, 0, 1, 1,
-0.8051175, -1.389849, -2.724317, 0, 0, 0, 1, 1,
-0.8034796, 1.049184, -0.5498024, 1, 1, 1, 1, 1,
-0.7960328, 0.2104909, -1.029828, 1, 1, 1, 1, 1,
-0.7858931, 1.328617, -1.14634, 1, 1, 1, 1, 1,
-0.7843649, -0.3288082, -1.434528, 1, 1, 1, 1, 1,
-0.7790664, 0.405714, 0.2067165, 1, 1, 1, 1, 1,
-0.7761919, -0.5160844, -3.750612, 1, 1, 1, 1, 1,
-0.7759182, 0.7519899, -0.1588277, 1, 1, 1, 1, 1,
-0.7628453, -0.3321585, -3.87325, 1, 1, 1, 1, 1,
-0.7608497, 0.05359885, -1.731583, 1, 1, 1, 1, 1,
-0.7607847, -0.2587467, 1.088206, 1, 1, 1, 1, 1,
-0.7583135, 1.082625, 0.6479322, 1, 1, 1, 1, 1,
-0.7568721, 0.9031683, -0.7290843, 1, 1, 1, 1, 1,
-0.7534838, -1.580048, -4.849062, 1, 1, 1, 1, 1,
-0.7531587, -0.9224513, -1.535892, 1, 1, 1, 1, 1,
-0.7457131, 0.8513933, 0.285237, 1, 1, 1, 1, 1,
-0.7445976, -1.435476, -2.88805, 0, 0, 1, 1, 1,
-0.7433661, -0.3968493, -1.058681, 1, 0, 0, 1, 1,
-0.7407506, -1.137393, -1.731268, 1, 0, 0, 1, 1,
-0.739305, 0.5577186, 0.1200071, 1, 0, 0, 1, 1,
-0.7374276, 1.250684, 1.097752, 1, 0, 0, 1, 1,
-0.7371651, 0.7418916, -0.6180207, 1, 0, 0, 1, 1,
-0.7346983, 1.985494, 0.5791597, 0, 0, 0, 1, 1,
-0.7328874, 0.6759232, -1.753509, 0, 0, 0, 1, 1,
-0.7306263, 0.5353892, 1.38822, 0, 0, 0, 1, 1,
-0.7279983, 1.043335, -1.015556, 0, 0, 0, 1, 1,
-0.7277011, -0.007489468, -1.863109, 0, 0, 0, 1, 1,
-0.7272709, 1.616602, -0.7319127, 0, 0, 0, 1, 1,
-0.7117739, 1.366756, -1.165156, 0, 0, 0, 1, 1,
-0.7042426, 1.508551, -0.2918808, 1, 1, 1, 1, 1,
-0.7013138, 0.11031, -0.4519876, 1, 1, 1, 1, 1,
-0.7009535, -0.0259061, -1.606673, 1, 1, 1, 1, 1,
-0.6946398, 0.9966912, 1.055391, 1, 1, 1, 1, 1,
-0.6946262, 0.3290299, -0.08853898, 1, 1, 1, 1, 1,
-0.692859, -0.152208, 0.4020967, 1, 1, 1, 1, 1,
-0.6916563, -0.7695224, -2.688195, 1, 1, 1, 1, 1,
-0.683415, -1.446497, -2.808622, 1, 1, 1, 1, 1,
-0.676796, 0.125512, -2.906567, 1, 1, 1, 1, 1,
-0.6699255, -1.106389, -2.335342, 1, 1, 1, 1, 1,
-0.6678764, 1.007675, 1.755502, 1, 1, 1, 1, 1,
-0.6677314, 3.032288, -1.180343, 1, 1, 1, 1, 1,
-0.667094, -0.1242601, 0.1461712, 1, 1, 1, 1, 1,
-0.6660903, 0.8364123, 1.127914, 1, 1, 1, 1, 1,
-0.6590348, -1.902284, -3.103074, 1, 1, 1, 1, 1,
-0.6546549, 0.5976582, 0.2115004, 0, 0, 1, 1, 1,
-0.6504319, 0.8566392, 0.1843255, 1, 0, 0, 1, 1,
-0.646005, -0.038936, -1.181243, 1, 0, 0, 1, 1,
-0.6454387, -1.140822, -3.29722, 1, 0, 0, 1, 1,
-0.6432118, 0.2172525, -0.7374086, 1, 0, 0, 1, 1,
-0.6409925, 0.09279759, -1.602538, 1, 0, 0, 1, 1,
-0.6366948, -0.3082644, -1.502341, 0, 0, 0, 1, 1,
-0.6347393, 1.152313, -0.230397, 0, 0, 0, 1, 1,
-0.6337214, 1.206579, 2.22828, 0, 0, 0, 1, 1,
-0.6315278, 0.4155886, -1.112191, 0, 0, 0, 1, 1,
-0.631444, 1.076453, -2.894366, 0, 0, 0, 1, 1,
-0.6258514, -1.202095, -3.169223, 0, 0, 0, 1, 1,
-0.6225243, 2.317411, 0.7283529, 0, 0, 0, 1, 1,
-0.6183417, -1.265028, -3.866825, 1, 1, 1, 1, 1,
-0.6107618, 0.4718981, -0.1778479, 1, 1, 1, 1, 1,
-0.6059206, 0.6657104, -0.7739236, 1, 1, 1, 1, 1,
-0.6055194, -0.07883837, -1.186398, 1, 1, 1, 1, 1,
-0.6039885, 0.1377318, -1.826558, 1, 1, 1, 1, 1,
-0.6026884, 2.368058, -1.599832, 1, 1, 1, 1, 1,
-0.5945017, -0.2553768, -1.069024, 1, 1, 1, 1, 1,
-0.5930263, 1.611885, -0.07722752, 1, 1, 1, 1, 1,
-0.5922611, 0.2013097, -0.4293253, 1, 1, 1, 1, 1,
-0.5921802, 0.4301665, -0.8501626, 1, 1, 1, 1, 1,
-0.5921528, -0.1113396, -0.8746821, 1, 1, 1, 1, 1,
-0.5916837, -0.4901325, -3.397556, 1, 1, 1, 1, 1,
-0.5894827, -0.7339732, -3.038708, 1, 1, 1, 1, 1,
-0.5887295, 1.049876, 0.07245746, 1, 1, 1, 1, 1,
-0.5847195, 1.887247, -0.2091126, 1, 1, 1, 1, 1,
-0.5842697, -0.9079111, -3.662988, 0, 0, 1, 1, 1,
-0.5829696, -1.108645, -3.851741, 1, 0, 0, 1, 1,
-0.5814312, 1.229209, -0.8327454, 1, 0, 0, 1, 1,
-0.5764048, 0.9319072, -0.3422958, 1, 0, 0, 1, 1,
-0.5758376, -0.9619725, -2.108453, 1, 0, 0, 1, 1,
-0.5698836, -0.9871236, -2.14187, 1, 0, 0, 1, 1,
-0.5696719, 1.001206, -0.286452, 0, 0, 0, 1, 1,
-0.5691898, 0.1925997, -1.98932, 0, 0, 0, 1, 1,
-0.5680215, -0.006685027, -0.4304892, 0, 0, 0, 1, 1,
-0.5644516, -0.1019402, -1.107184, 0, 0, 0, 1, 1,
-0.5637959, 0.6620277, -0.6523826, 0, 0, 0, 1, 1,
-0.5630521, -2.043753, -2.938432, 0, 0, 0, 1, 1,
-0.5602586, -1.39748, -2.934176, 0, 0, 0, 1, 1,
-0.5572717, 0.6823015, -0.1250294, 1, 1, 1, 1, 1,
-0.55498, -0.3907179, -1.492648, 1, 1, 1, 1, 1,
-0.5536934, -0.03725002, -0.6850411, 1, 1, 1, 1, 1,
-0.553326, -0.8423288, -2.006073, 1, 1, 1, 1, 1,
-0.5504904, -1.376923, -4.606654, 1, 1, 1, 1, 1,
-0.5469991, -1.342251, -1.654148, 1, 1, 1, 1, 1,
-0.5438899, 0.3164409, -0.6472898, 1, 1, 1, 1, 1,
-0.5418406, -1.071465, -0.3593749, 1, 1, 1, 1, 1,
-0.530747, -0.1858013, -1.235094, 1, 1, 1, 1, 1,
-0.5292866, 1.138679, -0.6429389, 1, 1, 1, 1, 1,
-0.526513, 0.2213344, 0.3340864, 1, 1, 1, 1, 1,
-0.5224698, 1.788127, -2.258526, 1, 1, 1, 1, 1,
-0.5219373, 0.4046694, -2.304037, 1, 1, 1, 1, 1,
-0.5193599, 0.6259902, -0.448323, 1, 1, 1, 1, 1,
-0.5163266, 1.291141, -1.514822, 1, 1, 1, 1, 1,
-0.5139525, -1.358218, -2.186229, 0, 0, 1, 1, 1,
-0.5138891, -1.129552, -3.065629, 1, 0, 0, 1, 1,
-0.5109136, -0.8578727, -1.786787, 1, 0, 0, 1, 1,
-0.5106084, -1.680836, -2.095109, 1, 0, 0, 1, 1,
-0.5098413, 0.04394732, -0.5696361, 1, 0, 0, 1, 1,
-0.5068452, 0.1113164, 0.1704296, 1, 0, 0, 1, 1,
-0.505487, 0.3934282, -0.725826, 0, 0, 0, 1, 1,
-0.5024156, 0.7483019, -1.467856, 0, 0, 0, 1, 1,
-0.5008907, 1.326045, 0.2438781, 0, 0, 0, 1, 1,
-0.4985251, 0.8055376, -0.780327, 0, 0, 0, 1, 1,
-0.4926377, 0.6515639, -1.604831, 0, 0, 0, 1, 1,
-0.4923964, -0.1037199, -1.663229, 0, 0, 0, 1, 1,
-0.4893247, 0.7197403, 0.4121411, 0, 0, 0, 1, 1,
-0.4891465, 0.4381636, -2.525464, 1, 1, 1, 1, 1,
-0.4885212, 0.275959, -2.125929, 1, 1, 1, 1, 1,
-0.4878343, 1.001194, -1.782216, 1, 1, 1, 1, 1,
-0.4875567, -0.2079148, -0.4684065, 1, 1, 1, 1, 1,
-0.4844716, -0.3246309, -2.524369, 1, 1, 1, 1, 1,
-0.4840234, -0.9754438, -3.052567, 1, 1, 1, 1, 1,
-0.4814601, 0.3007227, 0.6135927, 1, 1, 1, 1, 1,
-0.480338, -0.908776, -3.135671, 1, 1, 1, 1, 1,
-0.4711206, -1.034487, -3.618399, 1, 1, 1, 1, 1,
-0.4685602, 2.026692, -1.332261, 1, 1, 1, 1, 1,
-0.4668013, 0.2106423, -1.951946, 1, 1, 1, 1, 1,
-0.4544355, 0.9437248, 0.930077, 1, 1, 1, 1, 1,
-0.4541071, -0.09879309, -0.9736657, 1, 1, 1, 1, 1,
-0.4503057, 1.03892, -1.726446, 1, 1, 1, 1, 1,
-0.4460462, -0.5402029, -1.571906, 1, 1, 1, 1, 1,
-0.4404691, -1.478947, -2.937513, 0, 0, 1, 1, 1,
-0.4331571, 0.6225756, -1.656044, 1, 0, 0, 1, 1,
-0.4271387, -0.1468847, -3.864923, 1, 0, 0, 1, 1,
-0.4246537, 1.197276, -0.670095, 1, 0, 0, 1, 1,
-0.4184864, -1.483334, -1.760095, 1, 0, 0, 1, 1,
-0.4170111, 1.227992, -1.487929, 1, 0, 0, 1, 1,
-0.4166186, 1.275593, 0.6569546, 0, 0, 0, 1, 1,
-0.4130361, 0.6246264, 0.5337207, 0, 0, 0, 1, 1,
-0.4130248, -1.74995, -2.906944, 0, 0, 0, 1, 1,
-0.4114499, 0.5727742, -1.530053, 0, 0, 0, 1, 1,
-0.4060582, 1.051835, 1.401299, 0, 0, 0, 1, 1,
-0.4047598, -1.076085, -3.024906, 0, 0, 0, 1, 1,
-0.4021464, -0.2328232, -3.33828, 0, 0, 0, 1, 1,
-0.3999888, -1.64936, -1.340511, 1, 1, 1, 1, 1,
-0.3982636, 0.01617669, -1.691308, 1, 1, 1, 1, 1,
-0.3979319, -0.1306436, -2.258858, 1, 1, 1, 1, 1,
-0.3976605, -0.6832416, -3.098313, 1, 1, 1, 1, 1,
-0.39693, 0.2187928, 0.0724981, 1, 1, 1, 1, 1,
-0.3952865, -0.1618823, -2.489325, 1, 1, 1, 1, 1,
-0.3934515, -1.194067, -2.780187, 1, 1, 1, 1, 1,
-0.3911017, -1.010557, -3.37691, 1, 1, 1, 1, 1,
-0.3860229, -0.01366729, -2.876211, 1, 1, 1, 1, 1,
-0.3830102, -1.203154, -4.907076, 1, 1, 1, 1, 1,
-0.3814205, 0.1990695, -1.319281, 1, 1, 1, 1, 1,
-0.3741958, 0.3443862, -0.8350435, 1, 1, 1, 1, 1,
-0.3723703, -1.336737, -2.872873, 1, 1, 1, 1, 1,
-0.3701099, -0.4497075, -3.748878, 1, 1, 1, 1, 1,
-0.3698511, 0.1575278, -0.4324355, 1, 1, 1, 1, 1,
-0.367566, -0.8912018, -4.246144, 0, 0, 1, 1, 1,
-0.3644183, -0.3489788, -2.853914, 1, 0, 0, 1, 1,
-0.3641417, 1.209322, 1.3309, 1, 0, 0, 1, 1,
-0.3629453, -1.007815, -2.364437, 1, 0, 0, 1, 1,
-0.3629365, -0.6901537, -5.153132, 1, 0, 0, 1, 1,
-0.3613522, 0.1116543, -3.702444, 1, 0, 0, 1, 1,
-0.3596497, -0.2153997, -2.093529, 0, 0, 0, 1, 1,
-0.3554904, 0.7022189, -0.3742047, 0, 0, 0, 1, 1,
-0.3513616, 1.004125, -0.2448837, 0, 0, 0, 1, 1,
-0.3507285, -0.4163896, -3.183685, 0, 0, 0, 1, 1,
-0.3495206, 0.4533056, -1.274616, 0, 0, 0, 1, 1,
-0.3475625, 0.2089051, -2.407257, 0, 0, 0, 1, 1,
-0.3466971, 1.773819, -1.129441, 0, 0, 0, 1, 1,
-0.3446854, -0.83968, -3.905486, 1, 1, 1, 1, 1,
-0.3391531, 0.7912961, -2.625917, 1, 1, 1, 1, 1,
-0.3388394, 1.298714, -0.5962563, 1, 1, 1, 1, 1,
-0.3372634, -0.8549988, -2.166883, 1, 1, 1, 1, 1,
-0.337197, -0.4679237, -1.576968, 1, 1, 1, 1, 1,
-0.3357159, -1.881574, -2.922423, 1, 1, 1, 1, 1,
-0.3352136, 0.1844806, -0.2172183, 1, 1, 1, 1, 1,
-0.3326717, 0.02560432, -0.6291295, 1, 1, 1, 1, 1,
-0.3274406, 0.5504037, -2.024059, 1, 1, 1, 1, 1,
-0.3261011, -1.239671, -2.226592, 1, 1, 1, 1, 1,
-0.3243473, -0.5328006, -3.127383, 1, 1, 1, 1, 1,
-0.3239976, 2.399997, -1.458616, 1, 1, 1, 1, 1,
-0.3238388, -0.2932714, -3.240671, 1, 1, 1, 1, 1,
-0.3156627, -0.005417144, -1.820162, 1, 1, 1, 1, 1,
-0.3145645, -0.9137921, -1.498615, 1, 1, 1, 1, 1,
-0.3143323, -1.386193, -2.142301, 0, 0, 1, 1, 1,
-0.3103283, 0.334533, -1.601044, 1, 0, 0, 1, 1,
-0.3075249, -0.7233623, -4.340145, 1, 0, 0, 1, 1,
-0.304501, -0.1147669, -3.428074, 1, 0, 0, 1, 1,
-0.3039802, 0.3993273, -0.3871579, 1, 0, 0, 1, 1,
-0.3016112, -2.318986, -1.524357, 1, 0, 0, 1, 1,
-0.2956254, 1.096746, -0.7054712, 0, 0, 0, 1, 1,
-0.2945248, 0.6143765, -0.1488643, 0, 0, 0, 1, 1,
-0.2939862, 0.7353799, 0.7015218, 0, 0, 0, 1, 1,
-0.2903976, -1.361439, -3.845391, 0, 0, 0, 1, 1,
-0.2868907, -0.3431501, -1.725238, 0, 0, 0, 1, 1,
-0.2827178, 0.7384079, -0.4144428, 0, 0, 0, 1, 1,
-0.2793991, -0.5389782, -4.066142, 0, 0, 0, 1, 1,
-0.2787379, 0.6202922, 1.061283, 1, 1, 1, 1, 1,
-0.273778, 1.303634, -0.5029736, 1, 1, 1, 1, 1,
-0.2719283, 0.7982513, -0.07429076, 1, 1, 1, 1, 1,
-0.2629376, -0.4196503, -3.521346, 1, 1, 1, 1, 1,
-0.2620154, 1.295618, 0.3996376, 1, 1, 1, 1, 1,
-0.2614293, -0.08233739, -0.3925625, 1, 1, 1, 1, 1,
-0.2578931, -2.196283, -3.307228, 1, 1, 1, 1, 1,
-0.2552763, -0.1236007, -1.17177, 1, 1, 1, 1, 1,
-0.2525395, 0.1193611, -1.060074, 1, 1, 1, 1, 1,
-0.2523565, 0.3830675, 0.5464967, 1, 1, 1, 1, 1,
-0.235817, 1.402095, 0.5760994, 1, 1, 1, 1, 1,
-0.2309096, -3.00412, -2.779511, 1, 1, 1, 1, 1,
-0.2272144, -1.311446, -3.314361, 1, 1, 1, 1, 1,
-0.2219014, -0.07316382, -0.0493279, 1, 1, 1, 1, 1,
-0.2125917, 0.334677, -0.6716878, 1, 1, 1, 1, 1,
-0.210607, 0.3067465, 0.09725751, 0, 0, 1, 1, 1,
-0.2094414, -0.3138172, -3.744566, 1, 0, 0, 1, 1,
-0.2082594, 1.271465, -0.8484426, 1, 0, 0, 1, 1,
-0.2067131, 0.003490401, -0.6626171, 1, 0, 0, 1, 1,
-0.2034173, -0.3738173, -2.82308, 1, 0, 0, 1, 1,
-0.2020388, 1.31252, 0.408909, 1, 0, 0, 1, 1,
-0.1964694, -0.4615019, -3.092208, 0, 0, 0, 1, 1,
-0.1935039, 2.146474, 1.999016, 0, 0, 0, 1, 1,
-0.1934339, -0.1933551, -3.988605, 0, 0, 0, 1, 1,
-0.188531, 0.4181638, -1.037629, 0, 0, 0, 1, 1,
-0.1815602, -0.946372, -1.337701, 0, 0, 0, 1, 1,
-0.1766108, -0.6782635, -2.63276, 0, 0, 0, 1, 1,
-0.1713267, -1.17293, -2.866521, 0, 0, 0, 1, 1,
-0.1681214, 0.6250598, 0.3065321, 1, 1, 1, 1, 1,
-0.1663348, -0.8177527, -2.102751, 1, 1, 1, 1, 1,
-0.1661407, 0.4211699, -0.1991865, 1, 1, 1, 1, 1,
-0.1659853, 0.3291516, -0.3317768, 1, 1, 1, 1, 1,
-0.1653736, -0.4842047, -1.292356, 1, 1, 1, 1, 1,
-0.1649679, -1.079932, -2.940247, 1, 1, 1, 1, 1,
-0.156301, 0.1608834, -3.321957, 1, 1, 1, 1, 1,
-0.1540023, 0.03703924, -1.224212, 1, 1, 1, 1, 1,
-0.1395645, 0.5306908, 0.4677101, 1, 1, 1, 1, 1,
-0.1338871, -0.4874561, -2.602757, 1, 1, 1, 1, 1,
-0.1303155, -1.288147, -3.379444, 1, 1, 1, 1, 1,
-0.1248902, -0.8772936, -0.6451194, 1, 1, 1, 1, 1,
-0.121179, 0.9669219, -0.3531955, 1, 1, 1, 1, 1,
-0.1190516, -0.02701327, -2.265595, 1, 1, 1, 1, 1,
-0.1187824, -0.04301614, -1.627549, 1, 1, 1, 1, 1,
-0.1135623, 0.8044561, -0.8269209, 0, 0, 1, 1, 1,
-0.1108821, 0.05568752, 0.2184438, 1, 0, 0, 1, 1,
-0.1069939, 0.6009616, 0.3876316, 1, 0, 0, 1, 1,
-0.1056666, 0.9294023, -1.015457, 1, 0, 0, 1, 1,
-0.09832367, -0.6748067, -1.943989, 1, 0, 0, 1, 1,
-0.09672302, 1.859805, -1.174253, 1, 0, 0, 1, 1,
-0.092393, 0.4031329, -1.578224, 0, 0, 0, 1, 1,
-0.09180745, -1.238293, -2.818495, 0, 0, 0, 1, 1,
-0.08965575, 0.6834151, -1.040799, 0, 0, 0, 1, 1,
-0.08658557, -0.1284456, -2.369774, 0, 0, 0, 1, 1,
-0.08572865, -2.67874, -2.154147, 0, 0, 0, 1, 1,
-0.08561052, -1.0931, -2.97143, 0, 0, 0, 1, 1,
-0.07978364, -0.439344, -3.207005, 0, 0, 0, 1, 1,
-0.07620439, 1.47133, -2.010865, 1, 1, 1, 1, 1,
-0.06949744, -0.3100015, -2.280776, 1, 1, 1, 1, 1,
-0.0677964, 1.455509, -0.2675523, 1, 1, 1, 1, 1,
-0.06756198, 1.355225, -1.479284, 1, 1, 1, 1, 1,
-0.06543115, -0.1305548, -2.354445, 1, 1, 1, 1, 1,
-0.0648624, -1.218606, -2.845327, 1, 1, 1, 1, 1,
-0.06430306, 0.9777884, 0.759959, 1, 1, 1, 1, 1,
-0.06377826, 1.160697, -1.943576, 1, 1, 1, 1, 1,
-0.05314564, 0.7302527, -1.097348, 1, 1, 1, 1, 1,
-0.04949521, -0.524734, -5.506642, 1, 1, 1, 1, 1,
-0.0481865, 0.7683676, -0.9744123, 1, 1, 1, 1, 1,
-0.04490681, -0.07838389, -0.6410205, 1, 1, 1, 1, 1,
-0.04367278, 0.04828868, -0.9404276, 1, 1, 1, 1, 1,
-0.04343424, -1.202454, -2.784297, 1, 1, 1, 1, 1,
-0.03984106, -0.6901857, -5.509378, 1, 1, 1, 1, 1,
-0.03924239, -0.100929, -2.832636, 0, 0, 1, 1, 1,
-0.03816668, 0.5758998, 0.4424785, 1, 0, 0, 1, 1,
-0.03545292, -1.474178, -5.264249, 1, 0, 0, 1, 1,
-0.02616553, 0.2110725, -1.651407, 1, 0, 0, 1, 1,
-0.0231916, 1.565568, -0.3778656, 1, 0, 0, 1, 1,
-0.02291254, -1.66978, -5.434781, 1, 0, 0, 1, 1,
-0.02141303, 0.7404159, -0.7579476, 0, 0, 0, 1, 1,
-0.02022562, -0.3419339, -3.159586, 0, 0, 0, 1, 1,
-0.016458, 1.151919, -0.2097161, 0, 0, 0, 1, 1,
-0.01474957, -0.8833318, -2.644569, 0, 0, 0, 1, 1,
-0.01351091, 0.02410232, -1.554347, 0, 0, 0, 1, 1,
-0.01227792, 1.896661, -0.4641661, 0, 0, 0, 1, 1,
-0.008559282, 0.9704854, -0.6728383, 0, 0, 0, 1, 1,
-0.004085307, -2.338117, -3.288395, 1, 1, 1, 1, 1,
-0.003800412, 1.543106, -0.4288324, 1, 1, 1, 1, 1,
-0.003443337, 1.18224, 0.2820193, 1, 1, 1, 1, 1,
0.003741865, -1.456051, 3.263799, 1, 1, 1, 1, 1,
0.003875676, -0.3064179, 2.844575, 1, 1, 1, 1, 1,
0.007276032, -1.214793, 1.808313, 1, 1, 1, 1, 1,
0.00745849, 0.0530581, 0.8224562, 1, 1, 1, 1, 1,
0.0100749, -0.7727256, 2.78184, 1, 1, 1, 1, 1,
0.01063314, -1.208122, 4.098454, 1, 1, 1, 1, 1,
0.01217349, 1.194945, -0.4359072, 1, 1, 1, 1, 1,
0.01265104, 0.6832811, -1.379655, 1, 1, 1, 1, 1,
0.01421515, 0.1702077, 0.8907408, 1, 1, 1, 1, 1,
0.01668588, -1.711924, 3.335066, 1, 1, 1, 1, 1,
0.01779071, -0.2997209, 1.394746, 1, 1, 1, 1, 1,
0.02378102, 0.07406997, 1.134599, 1, 1, 1, 1, 1,
0.0238279, 1.842094, 1.400003, 0, 0, 1, 1, 1,
0.02648897, -0.1838492, 2.110624, 1, 0, 0, 1, 1,
0.02814843, -0.597042, 5.096163, 1, 0, 0, 1, 1,
0.03140125, 1.447378, -1.755156, 1, 0, 0, 1, 1,
0.0332017, 0.5312185, 0.7463046, 1, 0, 0, 1, 1,
0.0334715, -1.898528, 5.077671, 1, 0, 0, 1, 1,
0.0384561, 0.003257147, 0.9960396, 0, 0, 0, 1, 1,
0.03958545, 1.483639, 0.1248138, 0, 0, 0, 1, 1,
0.04913447, -1.825351, 1.792795, 0, 0, 0, 1, 1,
0.0496599, 0.5737572, -0.6301082, 0, 0, 0, 1, 1,
0.05036178, 0.4317253, 0.2720577, 0, 0, 0, 1, 1,
0.05084823, -1.717612, 2.092966, 0, 0, 0, 1, 1,
0.05234975, 0.3019905, -0.2811636, 0, 0, 0, 1, 1,
0.07026523, 0.48847, 1.124684, 1, 1, 1, 1, 1,
0.07620802, 0.5440525, -1.311769, 1, 1, 1, 1, 1,
0.07653013, -0.1411927, 2.609922, 1, 1, 1, 1, 1,
0.07847591, -0.389846, 4.322602, 1, 1, 1, 1, 1,
0.08092305, 0.1958743, 0.01236466, 1, 1, 1, 1, 1,
0.09658668, -1.800093, 3.736221, 1, 1, 1, 1, 1,
0.1006686, -0.1422866, 2.29593, 1, 1, 1, 1, 1,
0.1015564, 0.359814, 0.3593673, 1, 1, 1, 1, 1,
0.102633, 1.051376, -0.1870844, 1, 1, 1, 1, 1,
0.1035018, -0.3908469, 3.162853, 1, 1, 1, 1, 1,
0.1046245, 0.1185945, 1.177533, 1, 1, 1, 1, 1,
0.1108088, -0.4711437, 3.765244, 1, 1, 1, 1, 1,
0.113284, 0.7051775, -0.1344994, 1, 1, 1, 1, 1,
0.1135785, -0.3873997, 2.515729, 1, 1, 1, 1, 1,
0.1155534, 0.6838195, 2.260889, 1, 1, 1, 1, 1,
0.1158158, -0.3826009, 3.263241, 0, 0, 1, 1, 1,
0.1160164, 0.8067029, 1.71097, 1, 0, 0, 1, 1,
0.117985, 0.7774227, -0.6830503, 1, 0, 0, 1, 1,
0.1220244, 0.9171757, 0.9957786, 1, 0, 0, 1, 1,
0.1298444, 0.9807076, 1.444634, 1, 0, 0, 1, 1,
0.1331703, -1.204662, 2.018305, 1, 0, 0, 1, 1,
0.1335656, -1.048105, 4.67202, 0, 0, 0, 1, 1,
0.1336795, 0.4231111, 1.072169, 0, 0, 0, 1, 1,
0.1385251, -0.03318306, 1.423739, 0, 0, 0, 1, 1,
0.138752, -0.1324819, 2.794996, 0, 0, 0, 1, 1,
0.140897, 0.1910628, 0.6031573, 0, 0, 0, 1, 1,
0.1415458, 2.693557, 1.157762, 0, 0, 0, 1, 1,
0.1475261, -0.2406417, 3.627394, 0, 0, 0, 1, 1,
0.149158, -0.8019415, 2.978389, 1, 1, 1, 1, 1,
0.1497008, 0.7601678, -1.075053, 1, 1, 1, 1, 1,
0.1505212, 1.064485, -0.762916, 1, 1, 1, 1, 1,
0.1508455, 0.06409322, 2.645957, 1, 1, 1, 1, 1,
0.1517057, -0.5570294, 2.167281, 1, 1, 1, 1, 1,
0.1523001, -0.2507606, 2.785993, 1, 1, 1, 1, 1,
0.1524001, -1.476948, 3.358738, 1, 1, 1, 1, 1,
0.1551347, -0.2520792, 2.317032, 1, 1, 1, 1, 1,
0.1565864, 1.006895, 1.068957, 1, 1, 1, 1, 1,
0.1650228, 0.8438939, 1.29105, 1, 1, 1, 1, 1,
0.1665988, -2.955788, 3.116981, 1, 1, 1, 1, 1,
0.1709093, 1.44571, 0.2250836, 1, 1, 1, 1, 1,
0.1778561, 1.558126, -0.493352, 1, 1, 1, 1, 1,
0.1786552, 0.5778887, 0.6063941, 1, 1, 1, 1, 1,
0.1822968, 0.9409913, -0.638841, 1, 1, 1, 1, 1,
0.1869218, -1.917433, 2.653407, 0, 0, 1, 1, 1,
0.1880852, -0.4252176, 1.187951, 1, 0, 0, 1, 1,
0.189266, 0.1415916, 0.260788, 1, 0, 0, 1, 1,
0.1904913, -1.170482, 2.924462, 1, 0, 0, 1, 1,
0.1959581, -0.9496432, 3.005952, 1, 0, 0, 1, 1,
0.2021082, 0.009614538, 0.571663, 1, 0, 0, 1, 1,
0.2024841, 1.233018, 1.034038, 0, 0, 0, 1, 1,
0.2058416, -0.1747516, 1.51939, 0, 0, 0, 1, 1,
0.2061405, -0.724229, 2.899347, 0, 0, 0, 1, 1,
0.2065389, 0.01004633, 1.049419, 0, 0, 0, 1, 1,
0.2079817, 0.1941602, -0.08108746, 0, 0, 0, 1, 1,
0.2119328, 1.043191, 0.7509922, 0, 0, 0, 1, 1,
0.2138418, -2.34599, 5.611138, 0, 0, 0, 1, 1,
0.2170568, -1.513277, 2.380809, 1, 1, 1, 1, 1,
0.2193521, -1.44435, 3.597536, 1, 1, 1, 1, 1,
0.224152, 0.9432358, 1.018922, 1, 1, 1, 1, 1,
0.2267168, -0.1480327, 1.415546, 1, 1, 1, 1, 1,
0.2280753, -1.249554, 3.196808, 1, 1, 1, 1, 1,
0.2282202, 2.199995, 0.7647405, 1, 1, 1, 1, 1,
0.2286131, -0.1661374, 3.607406, 1, 1, 1, 1, 1,
0.230363, -1.112612, 3.666021, 1, 1, 1, 1, 1,
0.2304977, -0.37704, 1.677149, 1, 1, 1, 1, 1,
0.2331211, -0.9091212, 2.170188, 1, 1, 1, 1, 1,
0.2331878, 0.5473942, 0.4076083, 1, 1, 1, 1, 1,
0.2363528, -0.3808811, 3.603619, 1, 1, 1, 1, 1,
0.2480009, 0.6441671, 0.3086332, 1, 1, 1, 1, 1,
0.2480326, -0.07864662, 4.068233, 1, 1, 1, 1, 1,
0.2482175, 1.189324, -0.148088, 1, 1, 1, 1, 1,
0.2512052, 0.615898, 0.3450687, 0, 0, 1, 1, 1,
0.2526938, -0.07482518, 3.706212, 1, 0, 0, 1, 1,
0.2609663, 1.220408, -1.272884, 1, 0, 0, 1, 1,
0.2616561, -0.3803017, 2.26394, 1, 0, 0, 1, 1,
0.2629855, 0.7322445, -1.091263, 1, 0, 0, 1, 1,
0.2630823, 1.389322, 2.433355, 1, 0, 0, 1, 1,
0.2650907, 0.9116873, 0.5487965, 0, 0, 0, 1, 1,
0.2666939, 0.6031947, 0.09773089, 0, 0, 0, 1, 1,
0.2683287, 1.014889, 0.08279122, 0, 0, 0, 1, 1,
0.2734277, 0.8255164, -1.661186, 0, 0, 0, 1, 1,
0.2755738, -0.497032, 1.613464, 0, 0, 0, 1, 1,
0.2772148, -1.234916, 3.317053, 0, 0, 0, 1, 1,
0.2801609, -0.8883385, 2.194387, 0, 0, 0, 1, 1,
0.2810739, 1.139055, -0.7232209, 1, 1, 1, 1, 1,
0.2857064, -0.3029647, 1.524644, 1, 1, 1, 1, 1,
0.2874144, 1.020096, -0.8071578, 1, 1, 1, 1, 1,
0.2949969, 2.103632, -0.661958, 1, 1, 1, 1, 1,
0.3027402, 0.7326588, -0.193248, 1, 1, 1, 1, 1,
0.3030923, -0.9106381, 1.330232, 1, 1, 1, 1, 1,
0.3074337, 0.6350247, -0.1519349, 1, 1, 1, 1, 1,
0.3092923, 1.946482, 1.219833, 1, 1, 1, 1, 1,
0.3098113, 0.8639227, -0.1412117, 1, 1, 1, 1, 1,
0.3109276, -0.09870283, 3.692113, 1, 1, 1, 1, 1,
0.3134369, -0.6399492, 1.297295, 1, 1, 1, 1, 1,
0.3141599, -0.3105023, 3.198978, 1, 1, 1, 1, 1,
0.3144153, -2.650412, 1.830769, 1, 1, 1, 1, 1,
0.3148516, -1.174094, 1.979584, 1, 1, 1, 1, 1,
0.3156728, -0.9893864, 2.548645, 1, 1, 1, 1, 1,
0.318834, 0.4201598, -0.136496, 0, 0, 1, 1, 1,
0.3191847, 1.301882, -0.4426994, 1, 0, 0, 1, 1,
0.3193817, -0.8257413, 1.688869, 1, 0, 0, 1, 1,
0.3201998, 0.3521814, 0.03873572, 1, 0, 0, 1, 1,
0.3206721, -0.4307185, 2.437495, 1, 0, 0, 1, 1,
0.3245745, -0.7648987, 1.275443, 1, 0, 0, 1, 1,
0.3294952, 0.7025557, -0.5860031, 0, 0, 0, 1, 1,
0.3336181, 0.8168916, -0.03455083, 0, 0, 0, 1, 1,
0.3384578, -1.459659, 1.612221, 0, 0, 0, 1, 1,
0.3393789, 1.269355, -1.291979, 0, 0, 0, 1, 1,
0.3401307, 0.03592731, 0.6848825, 0, 0, 0, 1, 1,
0.3404784, -1.00447, 2.104886, 0, 0, 0, 1, 1,
0.3483233, -0.5507417, 3.622384, 0, 0, 0, 1, 1,
0.3511678, 0.5455901, 1.286345, 1, 1, 1, 1, 1,
0.353501, -0.07843779, 2.47294, 1, 1, 1, 1, 1,
0.3574698, 1.411656, 1.05418, 1, 1, 1, 1, 1,
0.3594732, -1.11053, 3.347061, 1, 1, 1, 1, 1,
0.3663608, -2.416358, 1.517807, 1, 1, 1, 1, 1,
0.3678294, 0.342728, 1.211421, 1, 1, 1, 1, 1,
0.3716685, 0.66295, -0.07311503, 1, 1, 1, 1, 1,
0.385421, 1.43972, 1.40886, 1, 1, 1, 1, 1,
0.388469, -1.069839, 3.973021, 1, 1, 1, 1, 1,
0.3939236, -1.967764, 3.327219, 1, 1, 1, 1, 1,
0.3946367, -0.3874594, 3.173139, 1, 1, 1, 1, 1,
0.3947448, -0.1007843, -0.8542286, 1, 1, 1, 1, 1,
0.3966853, -0.7923316, 2.225168, 1, 1, 1, 1, 1,
0.3968382, 0.5397721, 0.8888803, 1, 1, 1, 1, 1,
0.3981683, -0.4045475, 2.629334, 1, 1, 1, 1, 1,
0.3992134, -0.5182961, 3.025226, 0, 0, 1, 1, 1,
0.3995503, 0.9619884, -0.1927992, 1, 0, 0, 1, 1,
0.4007285, -2.190825, 3.075969, 1, 0, 0, 1, 1,
0.4011493, 0.55431, -0.7044986, 1, 0, 0, 1, 1,
0.4068388, 0.9434608, 1.116848, 1, 0, 0, 1, 1,
0.4087661, 0.645216, 0.608691, 1, 0, 0, 1, 1,
0.4094627, -0.3103355, 1.559172, 0, 0, 0, 1, 1,
0.4101436, 0.123573, 0.7244394, 0, 0, 0, 1, 1,
0.4144023, -0.790293, 2.634856, 0, 0, 0, 1, 1,
0.4145086, -0.09306513, 0.1938098, 0, 0, 0, 1, 1,
0.4156956, 0.2917976, 2.152043, 0, 0, 0, 1, 1,
0.4173622, 0.1462821, 2.031147, 0, 0, 0, 1, 1,
0.4210265, 1.461069, 0.08325985, 0, 0, 0, 1, 1,
0.4211619, 0.7734701, 1.102666, 1, 1, 1, 1, 1,
0.4264579, 0.4571049, -0.6256765, 1, 1, 1, 1, 1,
0.4267535, 1.212129, -0.03392306, 1, 1, 1, 1, 1,
0.4284011, -0.4264423, 2.906634, 1, 1, 1, 1, 1,
0.4293033, -0.9025408, 1.738164, 1, 1, 1, 1, 1,
0.4308937, -0.9138154, 2.757011, 1, 1, 1, 1, 1,
0.4320095, 0.1181173, 1.08766, 1, 1, 1, 1, 1,
0.4391911, -0.4688436, 1.472233, 1, 1, 1, 1, 1,
0.4435169, -0.07866634, 2.492518, 1, 1, 1, 1, 1,
0.449544, -0.9878826, 1.963382, 1, 1, 1, 1, 1,
0.4559132, 0.2222622, 1.799925, 1, 1, 1, 1, 1,
0.46126, -1.242022, 2.131245, 1, 1, 1, 1, 1,
0.4638287, -0.6813613, 2.507914, 1, 1, 1, 1, 1,
0.4655311, -0.2662075, 2.308046, 1, 1, 1, 1, 1,
0.4684371, 1.308889, -0.1883554, 1, 1, 1, 1, 1,
0.4689056, 1.134917, -1.382195, 0, 0, 1, 1, 1,
0.4751612, 0.4924401, 0.1232133, 1, 0, 0, 1, 1,
0.4762113, 0.1398909, 1.039405, 1, 0, 0, 1, 1,
0.4821835, -0.2504479, 1.884821, 1, 0, 0, 1, 1,
0.4860904, -0.9348413, 3.763846, 1, 0, 0, 1, 1,
0.4860938, -0.4150498, 0.295724, 1, 0, 0, 1, 1,
0.4929419, 0.4481579, 0.3491173, 0, 0, 0, 1, 1,
0.4931934, 0.2166402, 2.713757, 0, 0, 0, 1, 1,
0.4948159, 1.61732, 0.3096715, 0, 0, 0, 1, 1,
0.4960712, 0.2199973, 0.8274324, 0, 0, 0, 1, 1,
0.5080591, 0.6431007, -1.227223, 0, 0, 0, 1, 1,
0.5126732, 0.6028347, 1.039897, 0, 0, 0, 1, 1,
0.5211811, -0.1313568, 1.117379, 0, 0, 0, 1, 1,
0.5218546, -1.232904, 2.866704, 1, 1, 1, 1, 1,
0.5268431, 0.4721314, 1.107611, 1, 1, 1, 1, 1,
0.5301128, 0.626727, 1.302668, 1, 1, 1, 1, 1,
0.5314615, -1.992509, 3.04324, 1, 1, 1, 1, 1,
0.5340726, 1.353804, -0.1231273, 1, 1, 1, 1, 1,
0.5348998, -1.711955, 2.867175, 1, 1, 1, 1, 1,
0.5383129, -1.183279, 1.198047, 1, 1, 1, 1, 1,
0.5400047, 0.3726031, 1.519242, 1, 1, 1, 1, 1,
0.5421432, -1.234003, 3.411219, 1, 1, 1, 1, 1,
0.5422249, 0.5899299, 1.589962, 1, 1, 1, 1, 1,
0.5424725, 0.7268765, -1.832235, 1, 1, 1, 1, 1,
0.5432947, -0.25556, 2.653933, 1, 1, 1, 1, 1,
0.5468072, 0.5145974, 1.382381, 1, 1, 1, 1, 1,
0.5555109, 1.049243, -0.03782322, 1, 1, 1, 1, 1,
0.5643398, -0.6285934, 2.204549, 1, 1, 1, 1, 1,
0.5659243, -1.284336, 1.13755, 0, 0, 1, 1, 1,
0.5693036, -0.4473549, 2.726815, 1, 0, 0, 1, 1,
0.5697142, -0.4735997, 3.729298, 1, 0, 0, 1, 1,
0.5722212, 0.9344396, 0.2085245, 1, 0, 0, 1, 1,
0.5734593, -0.458517, 3.060935, 1, 0, 0, 1, 1,
0.5762874, 0.586962, 0.7585059, 1, 0, 0, 1, 1,
0.5787892, -0.008012296, 2.010235, 0, 0, 0, 1, 1,
0.5862213, 0.05051668, 1.076338, 0, 0, 0, 1, 1,
0.5910481, -1.270899, 2.692229, 0, 0, 0, 1, 1,
0.5915809, 1.035934, -0.8970081, 0, 0, 0, 1, 1,
0.5930635, -0.1140469, 3.441442, 0, 0, 0, 1, 1,
0.5974281, 0.162973, 0.7872896, 0, 0, 0, 1, 1,
0.6055613, -0.04374409, 0.605226, 0, 0, 0, 1, 1,
0.6077692, 1.09133, 0.5451823, 1, 1, 1, 1, 1,
0.6124917, -0.9416894, 3.083173, 1, 1, 1, 1, 1,
0.6156765, 0.9529639, 1.560151, 1, 1, 1, 1, 1,
0.6165676, 0.1053181, 2.065034, 1, 1, 1, 1, 1,
0.6173371, 0.9897836, 2.300238, 1, 1, 1, 1, 1,
0.6266807, 1.917951, -0.1231498, 1, 1, 1, 1, 1,
0.6287909, 0.2714775, 0.6600378, 1, 1, 1, 1, 1,
0.6291213, 0.9224542, -0.2076986, 1, 1, 1, 1, 1,
0.6350238, 0.1795017, 0.9660433, 1, 1, 1, 1, 1,
0.6376505, 2.105843, 0.4768057, 1, 1, 1, 1, 1,
0.6389248, -0.3366723, 1.432683, 1, 1, 1, 1, 1,
0.640666, 1.459781, 2.732145, 1, 1, 1, 1, 1,
0.6406779, -0.1087298, -0.04154623, 1, 1, 1, 1, 1,
0.6407983, 0.2345938, 0.7953285, 1, 1, 1, 1, 1,
0.6435962, 0.1034162, 1.680446, 1, 1, 1, 1, 1,
0.6448537, 0.6467341, -0.5823674, 0, 0, 1, 1, 1,
0.6629309, 0.1973863, 2.099887, 1, 0, 0, 1, 1,
0.6679345, 0.7612522, 2.39891, 1, 0, 0, 1, 1,
0.6747195, 1.566963, 1.150627, 1, 0, 0, 1, 1,
0.6783794, 0.4539652, 1.827312, 1, 0, 0, 1, 1,
0.678762, -0.6593204, 2.284785, 1, 0, 0, 1, 1,
0.6812584, -1.123139, 1.913282, 0, 0, 0, 1, 1,
0.6826065, -0.3604578, 2.268964, 0, 0, 0, 1, 1,
0.6931962, -0.9628975, 2.483745, 0, 0, 0, 1, 1,
0.6977838, -0.4149196, 0.9256328, 0, 0, 0, 1, 1,
0.701283, 0.5447841, 1.146405, 0, 0, 0, 1, 1,
0.7034684, 1.519029, 1.076645, 0, 0, 0, 1, 1,
0.7108395, -2.341784, 3.597872, 0, 0, 0, 1, 1,
0.7115521, 0.4096273, 1.080691, 1, 1, 1, 1, 1,
0.7147473, 0.1050918, 1.166699, 1, 1, 1, 1, 1,
0.7175425, 0.1175352, 1.071562, 1, 1, 1, 1, 1,
0.718442, -0.4246928, 0.5588516, 1, 1, 1, 1, 1,
0.720797, 1.49377, 0.8569381, 1, 1, 1, 1, 1,
0.7254478, -0.2580767, 0.7014858, 1, 1, 1, 1, 1,
0.7265494, -0.7301748, 3.16992, 1, 1, 1, 1, 1,
0.7318444, -0.6792217, 2.186015, 1, 1, 1, 1, 1,
0.7321958, 0.02150378, 1.922871, 1, 1, 1, 1, 1,
0.7323792, 1.112506, -0.7316599, 1, 1, 1, 1, 1,
0.7423006, 1.377857, 0.6683251, 1, 1, 1, 1, 1,
0.7444847, -1.060476, 1.710365, 1, 1, 1, 1, 1,
0.7480628, -0.7199013, 1.249031, 1, 1, 1, 1, 1,
0.7521466, -0.115662, 0.5935366, 1, 1, 1, 1, 1,
0.7531098, 1.639678, 0.8003333, 1, 1, 1, 1, 1,
0.757418, -0.5477499, 2.118164, 0, 0, 1, 1, 1,
0.7618708, 0.9993731, -0.4535459, 1, 0, 0, 1, 1,
0.7655012, -0.3308254, 1.821156, 1, 0, 0, 1, 1,
0.7716402, 1.015491, -0.1105389, 1, 0, 0, 1, 1,
0.7725201, 0.1622545, 1.420555, 1, 0, 0, 1, 1,
0.7731342, 0.9587421, 1.754933, 1, 0, 0, 1, 1,
0.7763344, 0.7273851, 1.118551, 0, 0, 0, 1, 1,
0.778055, -0.2944448, 2.383475, 0, 0, 0, 1, 1,
0.7789854, 0.9636428, 0.8023559, 0, 0, 0, 1, 1,
0.780661, 0.01420234, 1.784319, 0, 0, 0, 1, 1,
0.7832951, -0.8671483, 3.395629, 0, 0, 0, 1, 1,
0.7833136, 1.40678, 1.015794, 0, 0, 0, 1, 1,
0.7845598, -0.1604082, 2.840965, 0, 0, 0, 1, 1,
0.792518, 1.007138, -0.5654418, 1, 1, 1, 1, 1,
0.7928609, 1.328161, -0.2855537, 1, 1, 1, 1, 1,
0.7929006, -0.2354268, 2.857118, 1, 1, 1, 1, 1,
0.7930315, -0.6950194, 2.515632, 1, 1, 1, 1, 1,
0.798095, -0.7717353, 2.058427, 1, 1, 1, 1, 1,
0.7999825, -1.348769, 3.01883, 1, 1, 1, 1, 1,
0.8003386, -1.625746, 1.885163, 1, 1, 1, 1, 1,
0.8079402, 1.162814, 0.4300573, 1, 1, 1, 1, 1,
0.809836, -0.5138952, 1.781496, 1, 1, 1, 1, 1,
0.8104523, 0.9800154, 1.36676, 1, 1, 1, 1, 1,
0.8114272, -1.394698, 1.517321, 1, 1, 1, 1, 1,
0.8127461, 0.7001368, 0.5619737, 1, 1, 1, 1, 1,
0.8152203, -1.378233, 0.8681504, 1, 1, 1, 1, 1,
0.8156793, 0.1854202, 1.811782, 1, 1, 1, 1, 1,
0.8195491, -0.2471744, 2.517618, 1, 1, 1, 1, 1,
0.8202138, -0.626052, 0.5259745, 0, 0, 1, 1, 1,
0.8241795, -1.296475, 1.042737, 1, 0, 0, 1, 1,
0.8262506, 0.7317705, -0.5903025, 1, 0, 0, 1, 1,
0.8276104, 0.5956795, 0.8452393, 1, 0, 0, 1, 1,
0.8292477, -0.9197016, 1.259398, 1, 0, 0, 1, 1,
0.8306533, -0.8799511, 2.706573, 1, 0, 0, 1, 1,
0.8346171, 0.9870124, 0.9493257, 0, 0, 0, 1, 1,
0.8408388, -1.032008, 1.347929, 0, 0, 0, 1, 1,
0.8410742, 0.6854728, 1.670938, 0, 0, 0, 1, 1,
0.8428723, 2.054346, 0.04998173, 0, 0, 0, 1, 1,
0.8554923, -2.105244, 2.618678, 0, 0, 0, 1, 1,
0.8594579, -0.7635312, 0.727713, 0, 0, 0, 1, 1,
0.8597921, 1.066865, -1.074554, 0, 0, 0, 1, 1,
0.8678013, -0.06884795, 1.910911, 1, 1, 1, 1, 1,
0.8681585, -1.195405, 3.16871, 1, 1, 1, 1, 1,
0.8718617, -1.478532, 1.977738, 1, 1, 1, 1, 1,
0.8791305, -1.672248, 3.547994, 1, 1, 1, 1, 1,
0.8877909, 0.635208, 1.801931, 1, 1, 1, 1, 1,
0.8889078, 0.2720433, -0.9586502, 1, 1, 1, 1, 1,
0.8897213, -0.4815603, 1.79967, 1, 1, 1, 1, 1,
0.8954874, -0.2104093, 1.509452, 1, 1, 1, 1, 1,
0.8984066, -1.424619, 3.361082, 1, 1, 1, 1, 1,
0.9012579, -0.4255359, 1.260505, 1, 1, 1, 1, 1,
0.9026173, 0.4974534, 1.518029, 1, 1, 1, 1, 1,
0.9033849, -1.480081, 4.106279, 1, 1, 1, 1, 1,
0.9045991, 1.162862, 2.030751, 1, 1, 1, 1, 1,
0.9057056, 1.192386, 1.049349, 1, 1, 1, 1, 1,
0.9105367, -0.4929861, 2.141248, 1, 1, 1, 1, 1,
0.9137818, -0.4629993, 2.596219, 0, 0, 1, 1, 1,
0.9175127, 2.330991, -0.1347214, 1, 0, 0, 1, 1,
0.9189222, 1.660131, -0.5253039, 1, 0, 0, 1, 1,
0.9205137, 0.5772012, 0.09974436, 1, 0, 0, 1, 1,
0.9207886, 0.007981037, 0.6798183, 1, 0, 0, 1, 1,
0.9213543, 0.9831643, 1.071825, 1, 0, 0, 1, 1,
0.9280387, -1.861012, 2.728325, 0, 0, 0, 1, 1,
0.9476514, 1.115468, -0.7096093, 0, 0, 0, 1, 1,
0.9488055, 0.9894407, 1.072596, 0, 0, 0, 1, 1,
0.9550436, -0.94293, 5.00672, 0, 0, 0, 1, 1,
0.9590917, 1.480743, 0.3934199, 0, 0, 0, 1, 1,
0.9618391, -0.9788902, 3.211156, 0, 0, 0, 1, 1,
0.9625931, 0.227283, 0.5635858, 0, 0, 0, 1, 1,
0.9634676, 2.176233, 0.4782657, 1, 1, 1, 1, 1,
0.9638938, -1.359369, 2.09221, 1, 1, 1, 1, 1,
0.9791411, 0.7121447, 1.252592, 1, 1, 1, 1, 1,
0.980195, 0.1583361, 1.135943, 1, 1, 1, 1, 1,
0.98913, -0.4746816, 2.510985, 1, 1, 1, 1, 1,
0.9898975, 2.562341, 0.900578, 1, 1, 1, 1, 1,
0.9908382, -0.6127212, 2.55534, 1, 1, 1, 1, 1,
0.9925599, 0.8862408, 2.386178, 1, 1, 1, 1, 1,
0.9968573, 0.000838318, 1.725817, 1, 1, 1, 1, 1,
0.9971972, 0.0729043, 1.441503, 1, 1, 1, 1, 1,
0.9994885, 0.2283289, -0.2488037, 1, 1, 1, 1, 1,
1.000167, -0.9945145, 3.129882, 1, 1, 1, 1, 1,
1.008636, -0.4663587, 2.518906, 1, 1, 1, 1, 1,
1.010906, -0.2452249, 1.248062, 1, 1, 1, 1, 1,
1.012371, -0.01117387, 2.555408, 1, 1, 1, 1, 1,
1.012865, -0.7524573, 2.41623, 0, 0, 1, 1, 1,
1.017131, 0.6180719, 0.6153206, 1, 0, 0, 1, 1,
1.023111, -0.5019808, 3.467176, 1, 0, 0, 1, 1,
1.03007, 0.6251454, 0.4163282, 1, 0, 0, 1, 1,
1.031053, -0.3933192, 0.8554506, 1, 0, 0, 1, 1,
1.033049, -0.7639691, 1.583024, 1, 0, 0, 1, 1,
1.03695, 0.3257957, 3.795029, 0, 0, 0, 1, 1,
1.039442, 0.6846495, 0.2641141, 0, 0, 0, 1, 1,
1.039818, -0.1801798, 1.73444, 0, 0, 0, 1, 1,
1.042928, -1.405689, 3.527752, 0, 0, 0, 1, 1,
1.045536, 1.206776, -0.2497142, 0, 0, 0, 1, 1,
1.046399, 0.2262994, 1.05438, 0, 0, 0, 1, 1,
1.055083, -1.342379, 2.203566, 0, 0, 0, 1, 1,
1.058531, 0.7816517, 0.5032644, 1, 1, 1, 1, 1,
1.058555, -1.279364, 2.023229, 1, 1, 1, 1, 1,
1.061999, -0.254897, 1.436008, 1, 1, 1, 1, 1,
1.070442, 1.66957, -1.657771, 1, 1, 1, 1, 1,
1.076017, -1.356579, 2.885281, 1, 1, 1, 1, 1,
1.078944, -1.256942, 2.508985, 1, 1, 1, 1, 1,
1.086908, -0.5400521, 1.134374, 1, 1, 1, 1, 1,
1.092692, -1.4563, 0.863138, 1, 1, 1, 1, 1,
1.09872, 0.1833153, 1.659739, 1, 1, 1, 1, 1,
1.107816, 0.1649171, 1.67296, 1, 1, 1, 1, 1,
1.120961, 0.8393847, 2.19229, 1, 1, 1, 1, 1,
1.124109, 0.7157217, 2.748724, 1, 1, 1, 1, 1,
1.125576, -0.9794899, 0.8393422, 1, 1, 1, 1, 1,
1.12699, 2.250305, 0.5499117, 1, 1, 1, 1, 1,
1.135877, 0.09330309, 2.563146, 1, 1, 1, 1, 1,
1.136795, 0.06142224, 0.8334814, 0, 0, 1, 1, 1,
1.143807, 0.9978567, 0.6829826, 1, 0, 0, 1, 1,
1.160544, 0.7717882, 0.513413, 1, 0, 0, 1, 1,
1.165137, 0.6460535, 2.19082, 1, 0, 0, 1, 1,
1.1707, -0.4609409, 1.881714, 1, 0, 0, 1, 1,
1.175726, 2.129383, -0.1069157, 1, 0, 0, 1, 1,
1.1766, 0.4480585, 0.5373836, 0, 0, 0, 1, 1,
1.179561, -1.289005, 3.165134, 0, 0, 0, 1, 1,
1.185339, 1.13147, 0.6742486, 0, 0, 0, 1, 1,
1.187123, 0.5574321, 2.38997, 0, 0, 0, 1, 1,
1.201614, 0.09455858, 1.016038, 0, 0, 0, 1, 1,
1.214535, -0.02548273, 1.682923, 0, 0, 0, 1, 1,
1.217138, -0.6555866, 0.5898051, 0, 0, 0, 1, 1,
1.223305, -0.6451811, 2.570036, 1, 1, 1, 1, 1,
1.223534, -0.8494784, 2.114738, 1, 1, 1, 1, 1,
1.226211, -0.514788, 1.046969, 1, 1, 1, 1, 1,
1.254835, 0.7292201, -1.160286, 1, 1, 1, 1, 1,
1.255369, -0.5280933, 2.373111, 1, 1, 1, 1, 1,
1.268131, -0.7090812, 2.686795, 1, 1, 1, 1, 1,
1.27011, 0.3488818, 0.32343, 1, 1, 1, 1, 1,
1.273444, -0.4458409, 1.449735, 1, 1, 1, 1, 1,
1.282843, -0.1028057, 2.481803, 1, 1, 1, 1, 1,
1.285002, -1.625621, 1.595649, 1, 1, 1, 1, 1,
1.285691, -0.2432543, 2.474315, 1, 1, 1, 1, 1,
1.297319, 1.043966, 2.265678, 1, 1, 1, 1, 1,
1.302756, 0.05726216, 0.9594928, 1, 1, 1, 1, 1,
1.30669, 0.4578278, 3.286381, 1, 1, 1, 1, 1,
1.312368, 1.303983, 0.7360827, 1, 1, 1, 1, 1,
1.319171, 1.856101, -1.238922, 0, 0, 1, 1, 1,
1.341449, -1.179101, 2.297585, 1, 0, 0, 1, 1,
1.34545, -0.1419303, 2.120831, 1, 0, 0, 1, 1,
1.345986, 0.2929929, 2.323743, 1, 0, 0, 1, 1,
1.349056, 1.18529, 2.116237, 1, 0, 0, 1, 1,
1.349975, 0.2835346, 1.099744, 1, 0, 0, 1, 1,
1.359261, 0.7531769, 1.990917, 0, 0, 0, 1, 1,
1.369683, 1.520694, 2.411696, 0, 0, 0, 1, 1,
1.376058, -0.1757349, 0.4005335, 0, 0, 0, 1, 1,
1.380964, 0.1460782, 1.659507, 0, 0, 0, 1, 1,
1.381123, -0.08458696, 1.174386, 0, 0, 0, 1, 1,
1.411688, -0.1697776, 1.159006, 0, 0, 0, 1, 1,
1.414249, 1.166142, 1.721771, 0, 0, 0, 1, 1,
1.417414, 0.844671, 1.989897, 1, 1, 1, 1, 1,
1.420025, 0.0241891, 0.7744773, 1, 1, 1, 1, 1,
1.420737, 0.4030662, 3.77626, 1, 1, 1, 1, 1,
1.426122, 1.028998, 1.420429, 1, 1, 1, 1, 1,
1.430022, -0.1846081, -0.7384795, 1, 1, 1, 1, 1,
1.4319, -3.395643, 3.621088, 1, 1, 1, 1, 1,
1.434066, 1.479243, -0.1612994, 1, 1, 1, 1, 1,
1.436975, 0.551884, 0.8927495, 1, 1, 1, 1, 1,
1.443137, 0.4056732, -0.06527571, 1, 1, 1, 1, 1,
1.459649, 1.320296, -0.4376703, 1, 1, 1, 1, 1,
1.461369, -0.6750994, 1.38568, 1, 1, 1, 1, 1,
1.471328, 2.037189, 0.9930092, 1, 1, 1, 1, 1,
1.472314, -0.08743072, 2.019957, 1, 1, 1, 1, 1,
1.48343, 0.1111277, 0.8549988, 1, 1, 1, 1, 1,
1.487919, 0.3405548, 3.105423, 1, 1, 1, 1, 1,
1.502507, 1.089702, 0.356813, 0, 0, 1, 1, 1,
1.517629, -0.852343, 3.320416, 1, 0, 0, 1, 1,
1.529236, -1.437044, 1.051795, 1, 0, 0, 1, 1,
1.544176, 1.087276, 0.8782188, 1, 0, 0, 1, 1,
1.556538, -1.375942, 2.300569, 1, 0, 0, 1, 1,
1.561823, -0.08609537, 2.768512, 1, 0, 0, 1, 1,
1.564399, -0.4274023, 1.616853, 0, 0, 0, 1, 1,
1.564522, -0.4354757, 2.269319, 0, 0, 0, 1, 1,
1.5703, 0.3961849, 0.4620718, 0, 0, 0, 1, 1,
1.570433, -1.697454, 1.717134, 0, 0, 0, 1, 1,
1.576867, 0.1063047, 2.473704, 0, 0, 0, 1, 1,
1.586145, -1.112833, -0.6945241, 0, 0, 0, 1, 1,
1.586669, -0.05921048, 0.09373064, 0, 0, 0, 1, 1,
1.598041, 0.6432312, 1.630909, 1, 1, 1, 1, 1,
1.641167, 0.9329586, 1.725313, 1, 1, 1, 1, 1,
1.644507, -0.6493716, 3.613852, 1, 1, 1, 1, 1,
1.657767, 0.6517225, 1.485394, 1, 1, 1, 1, 1,
1.658272, 0.4102789, -1.098785, 1, 1, 1, 1, 1,
1.65997, 0.251631, -0.02459654, 1, 1, 1, 1, 1,
1.66116, 0.435616, 1.882013, 1, 1, 1, 1, 1,
1.663164, 1.195308, 0.9383677, 1, 1, 1, 1, 1,
1.667882, -0.02847925, 2.505178, 1, 1, 1, 1, 1,
1.679832, 1.566049, 1.494771, 1, 1, 1, 1, 1,
1.680966, 0.7768202, 0.4855788, 1, 1, 1, 1, 1,
1.682297, -1.263583, 2.347284, 1, 1, 1, 1, 1,
1.684129, -0.5457326, 2.887924, 1, 1, 1, 1, 1,
1.692759, 0.2752951, 1.360775, 1, 1, 1, 1, 1,
1.698868, 0.0405222, -0.2671588, 1, 1, 1, 1, 1,
1.703264, 1.489856, 1.220931, 0, 0, 1, 1, 1,
1.714491, -0.05640426, 2.240455, 1, 0, 0, 1, 1,
1.728936, 1.570832, 1.40691, 1, 0, 0, 1, 1,
1.729831, 2.09411, 0.6237261, 1, 0, 0, 1, 1,
1.747766, 0.2525669, 0.2878333, 1, 0, 0, 1, 1,
1.767962, 0.01059641, 1.631751, 1, 0, 0, 1, 1,
1.773376, 0.5390665, -0.4115913, 0, 0, 0, 1, 1,
1.777472, 0.2360569, 2.586394, 0, 0, 0, 1, 1,
1.789959, -0.667909, 3.094733, 0, 0, 0, 1, 1,
1.79201, -0.6649526, -0.5164105, 0, 0, 0, 1, 1,
1.792279, -0.5671904, 2.001145, 0, 0, 0, 1, 1,
1.811532, 0.4220285, 1.501406, 0, 0, 0, 1, 1,
1.835328, -0.2971802, 2.133579, 0, 0, 0, 1, 1,
1.839372, 0.9710879, 0.8150257, 1, 1, 1, 1, 1,
1.858879, 0.4801704, 0.8099796, 1, 1, 1, 1, 1,
1.861909, -0.604122, 0.3743318, 1, 1, 1, 1, 1,
1.878363, -0.1059195, -1.295832, 1, 1, 1, 1, 1,
1.880566, 1.672497, 1.364222, 1, 1, 1, 1, 1,
1.905016, -0.6896753, 2.078857, 1, 1, 1, 1, 1,
1.935688, 0.8769544, 1.692468, 1, 1, 1, 1, 1,
1.945454, 1.380455, 0.5923071, 1, 1, 1, 1, 1,
1.973484, 1.187495, 2.05517, 1, 1, 1, 1, 1,
1.989972, -0.5496772, 0.9677142, 1, 1, 1, 1, 1,
2.01157, -1.141002, -0.6419011, 1, 1, 1, 1, 1,
2.027889, -1.357806, 3.390732, 1, 1, 1, 1, 1,
2.029966, -1.351066, 2.094379, 1, 1, 1, 1, 1,
2.081569, 0.1126749, 1.448349, 1, 1, 1, 1, 1,
2.107981, -0.04672689, 1.360808, 1, 1, 1, 1, 1,
2.129699, -0.6820438, 1.739969, 0, 0, 1, 1, 1,
2.149304, -2.14159, 1.402216, 1, 0, 0, 1, 1,
2.156204, 0.1430723, 0.4158, 1, 0, 0, 1, 1,
2.166493, -1.388721, 1.167986, 1, 0, 0, 1, 1,
2.232884, -0.1143194, 2.789093, 1, 0, 0, 1, 1,
2.244736, -0.7189441, 2.506668, 1, 0, 0, 1, 1,
2.266181, -0.06050308, 2.614742, 0, 0, 0, 1, 1,
2.287259, 0.8007176, 2.349289, 0, 0, 0, 1, 1,
2.300925, -0.9964931, 3.417765, 0, 0, 0, 1, 1,
2.309337, 0.6665887, 1.943369, 0, 0, 0, 1, 1,
2.353463, 2.18848, -0.5955443, 0, 0, 0, 1, 1,
2.375778, -1.306627, 2.209782, 0, 0, 0, 1, 1,
2.466901, 0.6800721, 0.797812, 0, 0, 0, 1, 1,
2.527621, 1.109468, 1.42073, 1, 1, 1, 1, 1,
2.555319, -1.063653, 2.789509, 1, 1, 1, 1, 1,
2.569735, 1.215187, 2.898091, 1, 1, 1, 1, 1,
2.621958, 0.2315584, 1.960064, 1, 1, 1, 1, 1,
2.657506, 0.8348935, -0.1419445, 1, 1, 1, 1, 1,
2.819152, 0.4591332, 0.5712519, 1, 1, 1, 1, 1,
2.839691, -0.4614887, 1.780477, 1, 1, 1, 1, 1
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
var radius = 9.931982;
var distance = 34.88567;
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
mvMatrix.translate( 0.7132958, 0.1816778, -0.05087996 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.88567);
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
