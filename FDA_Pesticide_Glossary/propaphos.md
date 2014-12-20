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
-3.948781, -1.389423, -3.825806, 1, 0, 0, 1,
-2.937629, -0.5198045, -2.138582, 1, 0.007843138, 0, 1,
-2.885315, -1.250683, -1.249615, 1, 0.01176471, 0, 1,
-2.794186, -1.350065, -2.097151, 1, 0.01960784, 0, 1,
-2.626463, 1.414516, -2.716314, 1, 0.02352941, 0, 1,
-2.618695, -0.07526638, -2.693814, 1, 0.03137255, 0, 1,
-2.579619, -0.2009694, -1.198172, 1, 0.03529412, 0, 1,
-2.562653, -1.002883, -0.4973747, 1, 0.04313726, 0, 1,
-2.468271, -0.8883902, -0.2385952, 1, 0.04705882, 0, 1,
-2.445559, -0.2152401, -0.8232462, 1, 0.05490196, 0, 1,
-2.443608, -0.6164451, -1.067637, 1, 0.05882353, 0, 1,
-2.399962, -0.3165957, -2.825678, 1, 0.06666667, 0, 1,
-2.337543, -0.117879, -1.328309, 1, 0.07058824, 0, 1,
-2.321726, -0.7409557, -2.242316, 1, 0.07843138, 0, 1,
-2.200745, -1.7386, -3.498351, 1, 0.08235294, 0, 1,
-2.197744, -2.884496, -2.663349, 1, 0.09019608, 0, 1,
-2.169359, 1.685405, -0.9903613, 1, 0.09411765, 0, 1,
-2.127924, -0.8939914, -3.110152, 1, 0.1019608, 0, 1,
-2.106047, 0.2324205, -1.545967, 1, 0.1098039, 0, 1,
-2.100258, 2.130322, -1.99713, 1, 0.1137255, 0, 1,
-2.099257, 0.159662, -1.820648, 1, 0.1215686, 0, 1,
-2.096849, 0.5673306, 0.1063047, 1, 0.1254902, 0, 1,
-2.089999, 1.013459, -2.220706, 1, 0.1333333, 0, 1,
-2.070941, -0.4510543, -1.189051, 1, 0.1372549, 0, 1,
-2.054914, 0.3944802, -0.3134601, 1, 0.145098, 0, 1,
-2.024891, -0.05314704, -1.261928, 1, 0.1490196, 0, 1,
-2.012877, -0.9892492, -0.1089219, 1, 0.1568628, 0, 1,
-2.001946, -0.7641269, -1.071342, 1, 0.1607843, 0, 1,
-1.983548, 1.241822, -1.007141, 1, 0.1686275, 0, 1,
-1.976405, -2.631835, -1.078227, 1, 0.172549, 0, 1,
-1.964849, -0.7041247, -0.3970321, 1, 0.1803922, 0, 1,
-1.945441, -0.4518276, -2.697532, 1, 0.1843137, 0, 1,
-1.937571, -0.1130484, -2.810492, 1, 0.1921569, 0, 1,
-1.919066, -0.9777042, -3.401349, 1, 0.1960784, 0, 1,
-1.897214, 1.04326, -0.0617798, 1, 0.2039216, 0, 1,
-1.870496, 2.130244, -1.810903, 1, 0.2117647, 0, 1,
-1.868746, -0.9334187, -3.350696, 1, 0.2156863, 0, 1,
-1.856345, -0.4167877, -2.889326, 1, 0.2235294, 0, 1,
-1.851479, 0.3335187, -1.254977, 1, 0.227451, 0, 1,
-1.80196, -0.7393458, -1.453251, 1, 0.2352941, 0, 1,
-1.787819, -0.8390726, -2.544016, 1, 0.2392157, 0, 1,
-1.783846, 0.6598324, -1.919256, 1, 0.2470588, 0, 1,
-1.779809, 0.4696757, -0.8588085, 1, 0.2509804, 0, 1,
-1.776025, -0.02151898, -1.995904, 1, 0.2588235, 0, 1,
-1.773116, -0.05368644, -1.772624, 1, 0.2627451, 0, 1,
-1.76911, -0.06090133, -2.579943, 1, 0.2705882, 0, 1,
-1.764067, 1.53111, -2.743196, 1, 0.2745098, 0, 1,
-1.761232, -1.719595, -3.058591, 1, 0.282353, 0, 1,
-1.751434, 0.9606448, -3.200865, 1, 0.2862745, 0, 1,
-1.749099, -1.699211, -1.941482, 1, 0.2941177, 0, 1,
-1.746505, -0.1236787, -1.666389, 1, 0.3019608, 0, 1,
-1.734252, -1.433763, -0.4950448, 1, 0.3058824, 0, 1,
-1.732509, -1.032801, -1.808312, 1, 0.3137255, 0, 1,
-1.731884, -0.3717028, -3.692646, 1, 0.3176471, 0, 1,
-1.728088, -1.132892, -4.208553, 1, 0.3254902, 0, 1,
-1.725771, 1.019542, -1.034332, 1, 0.3294118, 0, 1,
-1.719549, -0.743144, -0.7946414, 1, 0.3372549, 0, 1,
-1.708339, -0.7051022, -2.690112, 1, 0.3411765, 0, 1,
-1.698344, 0.018063, -1.10023, 1, 0.3490196, 0, 1,
-1.693581, 0.9218175, -1.539419, 1, 0.3529412, 0, 1,
-1.687583, -0.4338578, -2.802661, 1, 0.3607843, 0, 1,
-1.683448, 0.01932499, -0.6974093, 1, 0.3647059, 0, 1,
-1.680948, 1.124009, -2.447947, 1, 0.372549, 0, 1,
-1.666676, -0.1701664, -2.871261, 1, 0.3764706, 0, 1,
-1.657006, 1.953047, -0.7534715, 1, 0.3843137, 0, 1,
-1.64062, -1.256203, -3.514387, 1, 0.3882353, 0, 1,
-1.639363, -1.048364, -2.352444, 1, 0.3960784, 0, 1,
-1.635247, -0.005517843, -1.264679, 1, 0.4039216, 0, 1,
-1.606104, -0.8236049, -2.46969, 1, 0.4078431, 0, 1,
-1.600427, 0.1809567, -3.082044, 1, 0.4156863, 0, 1,
-1.599943, -0.6888537, -2.164347, 1, 0.4196078, 0, 1,
-1.586525, -1.711512, -3.220519, 1, 0.427451, 0, 1,
-1.547808, -0.0945229, -1.612367, 1, 0.4313726, 0, 1,
-1.545654, 1.501599, -0.4114736, 1, 0.4392157, 0, 1,
-1.539245, 1.000912, -2.536494, 1, 0.4431373, 0, 1,
-1.532509, 1.121652, 0.5579982, 1, 0.4509804, 0, 1,
-1.513705, 0.5930362, -2.127686, 1, 0.454902, 0, 1,
-1.504918, -0.6076764, -1.082655, 1, 0.4627451, 0, 1,
-1.492497, 0.548182, -1.015369, 1, 0.4666667, 0, 1,
-1.491947, 0.3578568, -0.5830148, 1, 0.4745098, 0, 1,
-1.479656, -1.367073, -2.727784, 1, 0.4784314, 0, 1,
-1.467295, -1.214944, -1.721652, 1, 0.4862745, 0, 1,
-1.457627, 1.278548, -1.266347, 1, 0.4901961, 0, 1,
-1.457478, -0.6823797, -1.213117, 1, 0.4980392, 0, 1,
-1.448594, 1.537724, -3.267547, 1, 0.5058824, 0, 1,
-1.44266, 0.3773614, -0.1585075, 1, 0.509804, 0, 1,
-1.441365, -0.9817132, -1.84518, 1, 0.5176471, 0, 1,
-1.424378, -0.425265, -0.2296033, 1, 0.5215687, 0, 1,
-1.413491, 0.6671636, -1.089142, 1, 0.5294118, 0, 1,
-1.412827, 0.4982298, -0.8986024, 1, 0.5333334, 0, 1,
-1.402627, 0.7739351, -1.136112, 1, 0.5411765, 0, 1,
-1.387199, -0.1989945, -1.311939, 1, 0.5450981, 0, 1,
-1.385042, 0.4053037, -0.7444599, 1, 0.5529412, 0, 1,
-1.377716, 0.9465833, -1.744611, 1, 0.5568628, 0, 1,
-1.369877, 1.930725, -1.778399, 1, 0.5647059, 0, 1,
-1.363291, -1.17771, -4.403539, 1, 0.5686275, 0, 1,
-1.356962, -0.2418953, -0.6306009, 1, 0.5764706, 0, 1,
-1.346366, 0.8051139, -1.232515, 1, 0.5803922, 0, 1,
-1.340983, 0.1674248, -1.774062, 1, 0.5882353, 0, 1,
-1.338862, 1.780785, 0.5363522, 1, 0.5921569, 0, 1,
-1.338744, 0.496023, -0.6193477, 1, 0.6, 0, 1,
-1.334671, 2.383942, -0.05374021, 1, 0.6078432, 0, 1,
-1.322883, -1.784826, -3.022113, 1, 0.6117647, 0, 1,
-1.31988, -0.5787767, -0.08269052, 1, 0.6196079, 0, 1,
-1.317828, 1.125635, -2.493442, 1, 0.6235294, 0, 1,
-1.316391, -0.8179246, -0.5506837, 1, 0.6313726, 0, 1,
-1.311502, 0.7691154, 0.644923, 1, 0.6352941, 0, 1,
-1.309721, -0.9447965, -0.950523, 1, 0.6431373, 0, 1,
-1.293566, 1.492129, 0.03903424, 1, 0.6470588, 0, 1,
-1.269506, 1.71518, 1.549495, 1, 0.654902, 0, 1,
-1.266487, 0.1342253, -1.308758, 1, 0.6588235, 0, 1,
-1.253263, -0.3718504, -1.950995, 1, 0.6666667, 0, 1,
-1.250955, 0.1919173, -1.380355, 1, 0.6705883, 0, 1,
-1.245533, 1.264843, -1.575572, 1, 0.6784314, 0, 1,
-1.238189, -0.6586679, -1.774963, 1, 0.682353, 0, 1,
-1.233851, -1.220924, -2.605051, 1, 0.6901961, 0, 1,
-1.23341, -1.554645, -2.936246, 1, 0.6941177, 0, 1,
-1.232189, 0.06723727, 0.3673654, 1, 0.7019608, 0, 1,
-1.231398, 0.006210028, -1.098164, 1, 0.7098039, 0, 1,
-1.209795, -1.763001, -2.15111, 1, 0.7137255, 0, 1,
-1.207496, 0.3945128, -1.391245, 1, 0.7215686, 0, 1,
-1.205488, -0.6308408, -3.758762, 1, 0.7254902, 0, 1,
-1.202071, -1.870424, -2.895716, 1, 0.7333333, 0, 1,
-1.188703, -0.9091513, -0.9822546, 1, 0.7372549, 0, 1,
-1.185844, -0.2890501, -0.8235508, 1, 0.7450981, 0, 1,
-1.183205, -0.788711, -2.552841, 1, 0.7490196, 0, 1,
-1.180531, -1.619025, -2.654284, 1, 0.7568628, 0, 1,
-1.164569, -1.283745, -2.199764, 1, 0.7607843, 0, 1,
-1.163139, -0.1060499, -1.326767, 1, 0.7686275, 0, 1,
-1.157072, -1.182551, -1.106003, 1, 0.772549, 0, 1,
-1.148414, -0.9885603, -0.1075183, 1, 0.7803922, 0, 1,
-1.147301, -0.2596016, -1.995586, 1, 0.7843137, 0, 1,
-1.143521, 0.867782, -0.6320394, 1, 0.7921569, 0, 1,
-1.139811, -0.4689808, -0.4599319, 1, 0.7960784, 0, 1,
-1.13189, 1.115692, 0.3630667, 1, 0.8039216, 0, 1,
-1.127285, -0.609568, -1.240497, 1, 0.8117647, 0, 1,
-1.127017, -1.027904, -0.4443293, 1, 0.8156863, 0, 1,
-1.121475, 0.5100581, -0.9502059, 1, 0.8235294, 0, 1,
-1.121454, -0.7980528, -1.512307, 1, 0.827451, 0, 1,
-1.11774, 0.3995747, -0.8334333, 1, 0.8352941, 0, 1,
-1.117253, 0.08428049, -1.280911, 1, 0.8392157, 0, 1,
-1.105932, -0.4960953, -1.524082, 1, 0.8470588, 0, 1,
-1.101798, 1.839761, -1.680019, 1, 0.8509804, 0, 1,
-1.098495, -1.008968, -1.440639, 1, 0.8588235, 0, 1,
-1.098102, 1.774145, 0.8519182, 1, 0.8627451, 0, 1,
-1.096739, -1.128147, -3.505361, 1, 0.8705882, 0, 1,
-1.091979, -0.2472565, -1.193413, 1, 0.8745098, 0, 1,
-1.075861, -0.2843692, -1.322656, 1, 0.8823529, 0, 1,
-1.074892, 1.05353, -0.3631024, 1, 0.8862745, 0, 1,
-1.068875, 1.807265, -0.9731408, 1, 0.8941177, 0, 1,
-1.06825, 0.4585633, -2.31545, 1, 0.8980392, 0, 1,
-1.067749, -1.359646, -3.72381, 1, 0.9058824, 0, 1,
-1.065209, -0.05510031, -0.7525126, 1, 0.9137255, 0, 1,
-1.059061, -0.4065561, -1.219964, 1, 0.9176471, 0, 1,
-1.056417, -0.3896305, -1.714577, 1, 0.9254902, 0, 1,
-1.048947, -0.2455771, -2.160571, 1, 0.9294118, 0, 1,
-1.047909, 0.5543489, -2.610084, 1, 0.9372549, 0, 1,
-1.039011, -0.8221747, -3.043104, 1, 0.9411765, 0, 1,
-1.037377, -0.5025778, -2.012614, 1, 0.9490196, 0, 1,
-1.03151, -2.191159, -2.740032, 1, 0.9529412, 0, 1,
-1.030637, 0.1307761, -3.064669, 1, 0.9607843, 0, 1,
-1.022835, 1.290052, 0.4925912, 1, 0.9647059, 0, 1,
-1.02077, 1.867378, -0.4694731, 1, 0.972549, 0, 1,
-1.019396, -0.3466006, -1.865638, 1, 0.9764706, 0, 1,
-1.018585, 0.3190197, -0.2944999, 1, 0.9843137, 0, 1,
-1.014838, -1.132312, -3.68948, 1, 0.9882353, 0, 1,
-1.011971, 0.5682977, -0.4678322, 1, 0.9960784, 0, 1,
-1.009585, -1.764654, -3.008746, 0.9960784, 1, 0, 1,
-0.9951572, 0.2853019, -0.3351774, 0.9921569, 1, 0, 1,
-0.9842584, 0.2808861, -0.5590317, 0.9843137, 1, 0, 1,
-0.9818931, -0.08750427, -1.944107, 0.9803922, 1, 0, 1,
-0.9813659, -2.410772, -2.695387, 0.972549, 1, 0, 1,
-0.9798843, -0.9862531, -2.20661, 0.9686275, 1, 0, 1,
-0.9714111, -1.194723, -3.317689, 0.9607843, 1, 0, 1,
-0.9686522, -1.85597, -1.832591, 0.9568627, 1, 0, 1,
-0.9604871, -0.2200129, -1.353377, 0.9490196, 1, 0, 1,
-0.9421479, 1.676379, -0.5897261, 0.945098, 1, 0, 1,
-0.9414239, -0.2888072, -1.074116, 0.9372549, 1, 0, 1,
-0.9375235, -1.392152, -2.222897, 0.9333333, 1, 0, 1,
-0.9374216, -0.9478815, -3.191754, 0.9254902, 1, 0, 1,
-0.9340256, -0.6168373, -2.450792, 0.9215686, 1, 0, 1,
-0.9238823, 0.103931, -0.7185354, 0.9137255, 1, 0, 1,
-0.9233751, 2.013031, -0.1018741, 0.9098039, 1, 0, 1,
-0.9230427, 0.2341483, -3.503913, 0.9019608, 1, 0, 1,
-0.9226331, 0.4660441, -0.3304071, 0.8941177, 1, 0, 1,
-0.9215069, 0.3001972, -1.262206, 0.8901961, 1, 0, 1,
-0.9207368, -0.09706248, -2.14847, 0.8823529, 1, 0, 1,
-0.9180897, 0.8414935, -1.755319, 0.8784314, 1, 0, 1,
-0.9159781, 0.08706161, -2.69141, 0.8705882, 1, 0, 1,
-0.9140543, 1.46894, -1.178901, 0.8666667, 1, 0, 1,
-0.9138374, 0.5861304, -1.928265, 0.8588235, 1, 0, 1,
-0.9065515, 0.3956357, -2.275484, 0.854902, 1, 0, 1,
-0.9051427, 0.1096812, -1.209124, 0.8470588, 1, 0, 1,
-0.9043127, 0.4013539, -0.8162896, 0.8431373, 1, 0, 1,
-0.9041593, 0.7832745, -1.22383, 0.8352941, 1, 0, 1,
-0.9039608, 1.340752, -1.676651, 0.8313726, 1, 0, 1,
-0.9039031, -1.982948, -2.904916, 0.8235294, 1, 0, 1,
-0.8975297, -0.8040498, -2.283093, 0.8196079, 1, 0, 1,
-0.8965519, 1.98969, 0.2182955, 0.8117647, 1, 0, 1,
-0.8930023, 0.1923833, -2.212812, 0.8078431, 1, 0, 1,
-0.8849694, 0.1554218, -0.2188553, 0.8, 1, 0, 1,
-0.8824202, -0.7150701, -0.2240909, 0.7921569, 1, 0, 1,
-0.8707822, 2.267635, -2.304018, 0.7882353, 1, 0, 1,
-0.8653744, -1.177582, -1.615843, 0.7803922, 1, 0, 1,
-0.8650377, -0.4455914, -0.5263233, 0.7764706, 1, 0, 1,
-0.8648534, 0.8824115, -0.479228, 0.7686275, 1, 0, 1,
-0.8534849, -2.059265, -2.489131, 0.7647059, 1, 0, 1,
-0.846772, 1.315159, -2.181156, 0.7568628, 1, 0, 1,
-0.842898, 1.496903, 0.6534823, 0.7529412, 1, 0, 1,
-0.8371735, 0.3672381, -2.214776, 0.7450981, 1, 0, 1,
-0.8354845, 0.2639402, -1.524495, 0.7411765, 1, 0, 1,
-0.8232471, -1.886331, -2.088629, 0.7333333, 1, 0, 1,
-0.8180056, 1.906226, 0.4718336, 0.7294118, 1, 0, 1,
-0.8146982, 0.03123529, -1.577304, 0.7215686, 1, 0, 1,
-0.8141981, -0.178377, -0.6005596, 0.7176471, 1, 0, 1,
-0.811371, 1.074472, -1.79146, 0.7098039, 1, 0, 1,
-0.8105915, 0.2193758, -0.7287924, 0.7058824, 1, 0, 1,
-0.8066149, 1.353109, 0.621447, 0.6980392, 1, 0, 1,
-0.8057271, -0.6121436, -1.609651, 0.6901961, 1, 0, 1,
-0.8003872, 0.2256389, -2.110755, 0.6862745, 1, 0, 1,
-0.7909053, 0.6288421, -1.820275, 0.6784314, 1, 0, 1,
-0.7908795, 0.8126881, 0.5837685, 0.6745098, 1, 0, 1,
-0.7907308, -1.266902, -2.012771, 0.6666667, 1, 0, 1,
-0.7852478, -0.2434434, -2.656584, 0.6627451, 1, 0, 1,
-0.7772397, -0.925555, -2.401983, 0.654902, 1, 0, 1,
-0.7769018, 0.8898579, 0.6535793, 0.6509804, 1, 0, 1,
-0.7746354, 0.1141363, -1.41633, 0.6431373, 1, 0, 1,
-0.7723737, -0.7541953, -3.309358, 0.6392157, 1, 0, 1,
-0.7721829, 0.3184021, -1.800907, 0.6313726, 1, 0, 1,
-0.7715872, 0.8943951, 2.058278, 0.627451, 1, 0, 1,
-0.7694691, 1.502269, -0.07257782, 0.6196079, 1, 0, 1,
-0.7641715, -1.628346, -1.945198, 0.6156863, 1, 0, 1,
-0.76058, -0.9632767, -3.374267, 0.6078432, 1, 0, 1,
-0.7566506, 1.264711, -0.1493088, 0.6039216, 1, 0, 1,
-0.7563386, 0.6679662, -1.130917, 0.5960785, 1, 0, 1,
-0.7509784, -0.2818736, -3.049889, 0.5882353, 1, 0, 1,
-0.7486628, 0.2378079, 0.1758501, 0.5843138, 1, 0, 1,
-0.7468658, -1.0152, -3.876652, 0.5764706, 1, 0, 1,
-0.7461015, 0.567752, -0.5100305, 0.572549, 1, 0, 1,
-0.7437447, -0.01369413, -1.92242, 0.5647059, 1, 0, 1,
-0.7395434, 0.08375606, -1.223903, 0.5607843, 1, 0, 1,
-0.7367843, 0.05625061, -2.355396, 0.5529412, 1, 0, 1,
-0.7346372, 0.3079056, -1.710985, 0.5490196, 1, 0, 1,
-0.7288903, -0.547217, -1.646578, 0.5411765, 1, 0, 1,
-0.7258862, 1.691059, -1.08681, 0.5372549, 1, 0, 1,
-0.7122792, 1.227657, 0.5075291, 0.5294118, 1, 0, 1,
-0.7100189, -0.09425957, -3.318202, 0.5254902, 1, 0, 1,
-0.7078812, -1.487493, -4.386611, 0.5176471, 1, 0, 1,
-0.7064369, -0.6610312, -1.427323, 0.5137255, 1, 0, 1,
-0.7055668, -1.048836, -3.168879, 0.5058824, 1, 0, 1,
-0.7019816, 0.7512072, -0.3580455, 0.5019608, 1, 0, 1,
-0.6959308, 1.151824, -2.626194, 0.4941176, 1, 0, 1,
-0.692854, 1.254387, -2.059555, 0.4862745, 1, 0, 1,
-0.6917378, -0.704805, -2.62216, 0.4823529, 1, 0, 1,
-0.6807631, 1.622221, -2.046256, 0.4745098, 1, 0, 1,
-0.6804459, 0.9700304, 0.4368497, 0.4705882, 1, 0, 1,
-0.6799987, -1.003135, -0.9161005, 0.4627451, 1, 0, 1,
-0.6794379, 1.283736, 0.178708, 0.4588235, 1, 0, 1,
-0.6757507, 0.4861078, -0.4165688, 0.4509804, 1, 0, 1,
-0.6728095, 0.06815464, -0.788799, 0.4470588, 1, 0, 1,
-0.6721476, 0.8812199, 0.06309359, 0.4392157, 1, 0, 1,
-0.6676852, -1.941219, -2.626842, 0.4352941, 1, 0, 1,
-0.6639625, 1.228462, -0.4882092, 0.427451, 1, 0, 1,
-0.662785, 0.3653629, 0.2612028, 0.4235294, 1, 0, 1,
-0.66223, 1.950733, -0.6689393, 0.4156863, 1, 0, 1,
-0.6598521, 0.1516212, -1.321476, 0.4117647, 1, 0, 1,
-0.6596544, -1.735238, -2.153656, 0.4039216, 1, 0, 1,
-0.6571869, -0.1523106, -1.771705, 0.3960784, 1, 0, 1,
-0.6495478, 0.05161578, -2.814195, 0.3921569, 1, 0, 1,
-0.6436602, -1.044333, -2.224957, 0.3843137, 1, 0, 1,
-0.6371703, 1.415186, -0.6682703, 0.3803922, 1, 0, 1,
-0.6326057, -0.8073854, -0.1348187, 0.372549, 1, 0, 1,
-0.632013, -0.6094287, -1.38058, 0.3686275, 1, 0, 1,
-0.6252836, 0.06899557, -1.178329, 0.3607843, 1, 0, 1,
-0.625069, 0.3742246, -0.826988, 0.3568628, 1, 0, 1,
-0.6206908, 1.490412, 0.4210932, 0.3490196, 1, 0, 1,
-0.6206008, -0.2808744, -2.50734, 0.345098, 1, 0, 1,
-0.617618, -0.2210217, -1.434518, 0.3372549, 1, 0, 1,
-0.6146465, 0.5410944, -1.895432, 0.3333333, 1, 0, 1,
-0.6097964, -0.349582, -1.416196, 0.3254902, 1, 0, 1,
-0.6082342, -0.1230394, -2.304883, 0.3215686, 1, 0, 1,
-0.5997299, -0.2087058, -0.69568, 0.3137255, 1, 0, 1,
-0.599286, -1.558756, -3.433077, 0.3098039, 1, 0, 1,
-0.5989437, -1.546337, -3.057927, 0.3019608, 1, 0, 1,
-0.5974861, 0.4314852, -1.920986, 0.2941177, 1, 0, 1,
-0.5960202, 0.6537725, -0.2194206, 0.2901961, 1, 0, 1,
-0.5959311, -0.5192789, -0.9263676, 0.282353, 1, 0, 1,
-0.5933971, -0.1631332, -4.054232, 0.2784314, 1, 0, 1,
-0.5867178, -0.7170799, -2.065078, 0.2705882, 1, 0, 1,
-0.5858729, 0.6751533, -0.9001265, 0.2666667, 1, 0, 1,
-0.5839269, 0.9693732, -0.01821433, 0.2588235, 1, 0, 1,
-0.5809507, -0.4759273, -3.519108, 0.254902, 1, 0, 1,
-0.5784254, -0.8432601, -3.767061, 0.2470588, 1, 0, 1,
-0.5766541, -1.401685, -2.818751, 0.2431373, 1, 0, 1,
-0.5757727, -0.2019483, -1.701503, 0.2352941, 1, 0, 1,
-0.5731995, -0.9049873, -2.419583, 0.2313726, 1, 0, 1,
-0.5730419, 2.462988, -0.6204406, 0.2235294, 1, 0, 1,
-0.5730357, 0.6020784, -1.232105, 0.2196078, 1, 0, 1,
-0.5712152, 0.2856074, -2.114944, 0.2117647, 1, 0, 1,
-0.5676035, -0.05364548, -0.4545378, 0.2078431, 1, 0, 1,
-0.5652357, 0.9440555, 0.04773019, 0.2, 1, 0, 1,
-0.5623158, 1.371544, 0.4885117, 0.1921569, 1, 0, 1,
-0.5568401, -1.053855, -3.74646, 0.1882353, 1, 0, 1,
-0.5561245, 0.08608934, -0.4941202, 0.1803922, 1, 0, 1,
-0.552395, 2.114764, -0.03550054, 0.1764706, 1, 0, 1,
-0.5511556, 1.961255, 0.2707923, 0.1686275, 1, 0, 1,
-0.5491353, 0.3374777, -1.450543, 0.1647059, 1, 0, 1,
-0.5476011, 0.2760133, -1.001356, 0.1568628, 1, 0, 1,
-0.5463142, -0.7707008, -2.890433, 0.1529412, 1, 0, 1,
-0.5419151, -0.8699917, -3.370546, 0.145098, 1, 0, 1,
-0.5395515, -1.982443, -2.564056, 0.1411765, 1, 0, 1,
-0.534718, -1.069368, -1.506308, 0.1333333, 1, 0, 1,
-0.5314741, -0.8546982, -3.209503, 0.1294118, 1, 0, 1,
-0.528267, 0.624935, -0.9683096, 0.1215686, 1, 0, 1,
-0.5256109, -0.1591638, -2.638232, 0.1176471, 1, 0, 1,
-0.5226782, -0.4283158, -1.378766, 0.1098039, 1, 0, 1,
-0.522244, 0.12904, 0.08430285, 0.1058824, 1, 0, 1,
-0.5217446, 0.8960219, -0.1423565, 0.09803922, 1, 0, 1,
-0.5162778, 0.8669596, -1.586029, 0.09019608, 1, 0, 1,
-0.5152088, 0.4093082, -0.3922981, 0.08627451, 1, 0, 1,
-0.5062965, -1.003184, -3.516343, 0.07843138, 1, 0, 1,
-0.4989035, -0.8262595, -3.183522, 0.07450981, 1, 0, 1,
-0.4981802, -0.8665809, -1.791521, 0.06666667, 1, 0, 1,
-0.4975337, -1.024194, -2.832617, 0.0627451, 1, 0, 1,
-0.4965068, -0.225476, -2.742911, 0.05490196, 1, 0, 1,
-0.493309, 0.115889, -1.285821, 0.05098039, 1, 0, 1,
-0.4896364, 0.6795776, -0.584631, 0.04313726, 1, 0, 1,
-0.4809508, 1.325642, -1.457678, 0.03921569, 1, 0, 1,
-0.4792474, 0.1462518, -2.847663, 0.03137255, 1, 0, 1,
-0.4722869, 0.6456854, -0.6443604, 0.02745098, 1, 0, 1,
-0.469933, -1.202654, -2.759751, 0.01960784, 1, 0, 1,
-0.4657616, -0.2689199, -3.268559, 0.01568628, 1, 0, 1,
-0.4654249, 0.4331465, -2.312408, 0.007843138, 1, 0, 1,
-0.4500337, -0.3870953, -0.2647025, 0.003921569, 1, 0, 1,
-0.4494249, -0.9113985, -2.13757, 0, 1, 0.003921569, 1,
-0.4478732, -0.3577085, -0.9176787, 0, 1, 0.01176471, 1,
-0.4436304, 0.05692295, -2.326042, 0, 1, 0.01568628, 1,
-0.442948, 0.4685279, -1.308969, 0, 1, 0.02352941, 1,
-0.4363567, 1.211023, -0.6474022, 0, 1, 0.02745098, 1,
-0.4331672, 0.9964927, -0.03169644, 0, 1, 0.03529412, 1,
-0.4308392, 1.43577, -0.3421801, 0, 1, 0.03921569, 1,
-0.4288417, 1.274147, -1.993746, 0, 1, 0.04705882, 1,
-0.4287027, 2.14369, 0.2287502, 0, 1, 0.05098039, 1,
-0.4261342, 0.70932, -0.3852507, 0, 1, 0.05882353, 1,
-0.4244557, 0.589166, -2.549849, 0, 1, 0.0627451, 1,
-0.4243206, -0.3530851, -2.58751, 0, 1, 0.07058824, 1,
-0.4240631, 0.009126636, -2.255517, 0, 1, 0.07450981, 1,
-0.4239545, -0.4540138, -0.9531817, 0, 1, 0.08235294, 1,
-0.4232139, -0.5006557, -1.724765, 0, 1, 0.08627451, 1,
-0.4182554, 0.9935454, 0.4545038, 0, 1, 0.09411765, 1,
-0.4170188, -0.9201024, -3.618001, 0, 1, 0.1019608, 1,
-0.4166544, -0.5307183, -2.048939, 0, 1, 0.1058824, 1,
-0.4126406, -0.05278618, -1.542236, 0, 1, 0.1137255, 1,
-0.4119315, -0.1437196, -3.166858, 0, 1, 0.1176471, 1,
-0.4110269, -0.7825574, -1.135272, 0, 1, 0.1254902, 1,
-0.4102017, -0.4736618, -3.592451, 0, 1, 0.1294118, 1,
-0.4081741, 0.1003935, -0.3053403, 0, 1, 0.1372549, 1,
-0.4080911, 0.6546621, -0.1363043, 0, 1, 0.1411765, 1,
-0.4075776, -0.7765651, -4.185598, 0, 1, 0.1490196, 1,
-0.4059254, 0.3589377, -1.607216, 0, 1, 0.1529412, 1,
-0.4008514, -0.8592483, -2.586023, 0, 1, 0.1607843, 1,
-0.3989816, -0.6155381, -3.288619, 0, 1, 0.1647059, 1,
-0.3965492, 0.01007215, -1.359111, 0, 1, 0.172549, 1,
-0.3927088, 0.3313411, -0.9524463, 0, 1, 0.1764706, 1,
-0.3876365, -1.349498, -2.931667, 0, 1, 0.1843137, 1,
-0.3866614, -0.007283513, -1.26079, 0, 1, 0.1882353, 1,
-0.3843315, 1.667904, 0.4386353, 0, 1, 0.1960784, 1,
-0.3841291, 0.6319718, -2.012526, 0, 1, 0.2039216, 1,
-0.3830115, -0.07904437, -3.614541, 0, 1, 0.2078431, 1,
-0.3809177, 0.2382054, -0.2725973, 0, 1, 0.2156863, 1,
-0.3732873, -0.4622456, -2.387421, 0, 1, 0.2196078, 1,
-0.3698636, -1.135471, -1.353123, 0, 1, 0.227451, 1,
-0.3697691, -0.5890851, -1.102485, 0, 1, 0.2313726, 1,
-0.3664016, 0.2811575, -0.4263558, 0, 1, 0.2392157, 1,
-0.3640132, -1.607024, -3.030725, 0, 1, 0.2431373, 1,
-0.3637399, -1.273782, -2.986866, 0, 1, 0.2509804, 1,
-0.3541714, 0.2213882, -0.01988964, 0, 1, 0.254902, 1,
-0.3517883, -0.5104956, -2.431781, 0, 1, 0.2627451, 1,
-0.3489943, -0.1906788, -1.240402, 0, 1, 0.2666667, 1,
-0.3439392, 0.2650789, -1.064657, 0, 1, 0.2745098, 1,
-0.3435134, 0.3445495, -1.396997, 0, 1, 0.2784314, 1,
-0.3426259, -1.467926, -1.624902, 0, 1, 0.2862745, 1,
-0.3421151, 0.547029, -0.8414065, 0, 1, 0.2901961, 1,
-0.3415489, -0.1623668, -1.692428, 0, 1, 0.2980392, 1,
-0.3407891, -0.474735, -1.617051, 0, 1, 0.3058824, 1,
-0.338513, -1.723327, -2.883495, 0, 1, 0.3098039, 1,
-0.3380435, -0.1013059, -1.72459, 0, 1, 0.3176471, 1,
-0.334324, 0.5363826, 1.25609, 0, 1, 0.3215686, 1,
-0.334068, -0.07752296, -1.902774, 0, 1, 0.3294118, 1,
-0.332945, 0.4559931, 0.9590908, 0, 1, 0.3333333, 1,
-0.3262084, -0.405244, -0.3351941, 0, 1, 0.3411765, 1,
-0.3237436, -0.1587171, -1.48201, 0, 1, 0.345098, 1,
-0.3197452, -2.310777, -4.223279, 0, 1, 0.3529412, 1,
-0.3193081, -0.5526812, -3.206347, 0, 1, 0.3568628, 1,
-0.3113394, -0.4089724, -2.537441, 0, 1, 0.3647059, 1,
-0.3083678, 0.2663808, -0.7562807, 0, 1, 0.3686275, 1,
-0.3068905, -1.521469, -3.092079, 0, 1, 0.3764706, 1,
-0.3052678, -0.02070904, -0.1035318, 0, 1, 0.3803922, 1,
-0.304646, -0.9120567, -0.8486001, 0, 1, 0.3882353, 1,
-0.3039754, 0.7842512, -0.1838148, 0, 1, 0.3921569, 1,
-0.3015341, -0.2215754, -1.231232, 0, 1, 0.4, 1,
-0.3000164, 1.609864, -0.2328637, 0, 1, 0.4078431, 1,
-0.2980419, 0.3539277, -1.110505, 0, 1, 0.4117647, 1,
-0.2958733, -0.5758229, -3.460844, 0, 1, 0.4196078, 1,
-0.2953036, -0.03214826, -1.54925, 0, 1, 0.4235294, 1,
-0.294399, 0.2624884, -0.4157395, 0, 1, 0.4313726, 1,
-0.2920891, 0.6670147, 0.7397186, 0, 1, 0.4352941, 1,
-0.2914388, 1.563444, 1.203378, 0, 1, 0.4431373, 1,
-0.2874652, 1.2584, -0.2748471, 0, 1, 0.4470588, 1,
-0.2824596, -1.265843, -2.568041, 0, 1, 0.454902, 1,
-0.2802928, -0.8417713, -2.75859, 0, 1, 0.4588235, 1,
-0.2750756, 1.714312, 1.172768, 0, 1, 0.4666667, 1,
-0.2698352, -1.328613, -0.176281, 0, 1, 0.4705882, 1,
-0.2666209, -0.7379203, -2.340644, 0, 1, 0.4784314, 1,
-0.2632116, -0.4503808, -3.378097, 0, 1, 0.4823529, 1,
-0.2625915, 0.209182, -1.115945, 0, 1, 0.4901961, 1,
-0.2622687, 1.177292, -2.043504, 0, 1, 0.4941176, 1,
-0.2599467, 2.447624, 0.5798534, 0, 1, 0.5019608, 1,
-0.2598211, -0.6800286, -4.586042, 0, 1, 0.509804, 1,
-0.2591248, -0.5209965, -2.380775, 0, 1, 0.5137255, 1,
-0.2533021, 1.386903, -0.3722036, 0, 1, 0.5215687, 1,
-0.2506181, 0.4468356, 0.1564047, 0, 1, 0.5254902, 1,
-0.2474639, -0.4960512, -3.600982, 0, 1, 0.5333334, 1,
-0.2442726, -0.5421113, -3.286743, 0, 1, 0.5372549, 1,
-0.2439525, 0.142888, -2.249711, 0, 1, 0.5450981, 1,
-0.2432396, 0.09223965, -1.460175, 0, 1, 0.5490196, 1,
-0.2420137, -1.549446, -3.245036, 0, 1, 0.5568628, 1,
-0.2331985, -0.4429826, -1.31094, 0, 1, 0.5607843, 1,
-0.2325735, -1.15397, -2.782666, 0, 1, 0.5686275, 1,
-0.2323287, -0.5767361, -4.16737, 0, 1, 0.572549, 1,
-0.2308296, -0.9623152, -3.069222, 0, 1, 0.5803922, 1,
-0.230063, 1.46475, -1.014627, 0, 1, 0.5843138, 1,
-0.2285696, -0.008071907, -1.955425, 0, 1, 0.5921569, 1,
-0.227449, -0.2523641, -3.127559, 0, 1, 0.5960785, 1,
-0.2227876, 0.2772592, -0.2497469, 0, 1, 0.6039216, 1,
-0.222541, 2.122274, 1.00369, 0, 1, 0.6117647, 1,
-0.2222818, 0.4201498, -0.5883923, 0, 1, 0.6156863, 1,
-0.2212736, 0.1555266, -1.352002, 0, 1, 0.6235294, 1,
-0.2179172, 0.7087292, 1.090294, 0, 1, 0.627451, 1,
-0.2120322, -0.4791456, -4.756144, 0, 1, 0.6352941, 1,
-0.2093617, 0.9589866, -1.147026, 0, 1, 0.6392157, 1,
-0.2083686, 0.7490557, 0.8732729, 0, 1, 0.6470588, 1,
-0.2081263, -0.4772163, -4.166574, 0, 1, 0.6509804, 1,
-0.2066106, -0.1561797, -2.79232, 0, 1, 0.6588235, 1,
-0.2052254, 0.9936901, -0.2729325, 0, 1, 0.6627451, 1,
-0.203728, 0.5809454, 0.4570894, 0, 1, 0.6705883, 1,
-0.2025698, 0.4801192, 0.3377409, 0, 1, 0.6745098, 1,
-0.2022195, 0.692107, -1.693496, 0, 1, 0.682353, 1,
-0.2003281, -1.488913, -4.534919, 0, 1, 0.6862745, 1,
-0.195014, -1.335532, -2.65565, 0, 1, 0.6941177, 1,
-0.1930202, 0.9797631, -0.6036091, 0, 1, 0.7019608, 1,
-0.1905458, 0.1806853, -0.822468, 0, 1, 0.7058824, 1,
-0.1886861, -0.9099351, -3.93793, 0, 1, 0.7137255, 1,
-0.1814588, 0.8858751, -1.530075, 0, 1, 0.7176471, 1,
-0.1757004, 2.081291, -1.116819, 0, 1, 0.7254902, 1,
-0.1722645, -0.2266187, -2.491347, 0, 1, 0.7294118, 1,
-0.1708474, -0.8200199, -0.8212632, 0, 1, 0.7372549, 1,
-0.1684616, -0.9028888, -3.098659, 0, 1, 0.7411765, 1,
-0.162103, -0.4959789, -4.040421, 0, 1, 0.7490196, 1,
-0.1611878, 0.2837054, -0.1937492, 0, 1, 0.7529412, 1,
-0.1589003, 1.38776, 1.133417, 0, 1, 0.7607843, 1,
-0.1588515, -0.8320212, -2.997073, 0, 1, 0.7647059, 1,
-0.1577105, 0.6494149, 1.04238, 0, 1, 0.772549, 1,
-0.1561465, -0.7459717, -2.953548, 0, 1, 0.7764706, 1,
-0.1539993, 0.4243704, 0.05462713, 0, 1, 0.7843137, 1,
-0.1518195, -0.6420205, -2.508192, 0, 1, 0.7882353, 1,
-0.1457973, 0.4644051, 0.3355989, 0, 1, 0.7960784, 1,
-0.1428939, 0.7526657, 1.033428, 0, 1, 0.8039216, 1,
-0.1427621, -0.916956, -2.89685, 0, 1, 0.8078431, 1,
-0.1400076, 0.3344801, 1.969153, 0, 1, 0.8156863, 1,
-0.137519, 0.3071483, 0.3417205, 0, 1, 0.8196079, 1,
-0.1355569, 1.580711, -0.02167204, 0, 1, 0.827451, 1,
-0.1309214, 0.7940618, 2.644698, 0, 1, 0.8313726, 1,
-0.1304212, 1.073192, -0.7171598, 0, 1, 0.8392157, 1,
-0.1283992, 0.3460395, -0.9002573, 0, 1, 0.8431373, 1,
-0.124833, 0.5005228, -0.8488252, 0, 1, 0.8509804, 1,
-0.1217672, -0.7684051, -2.353208, 0, 1, 0.854902, 1,
-0.1197155, 1.475568, 2.442532, 0, 1, 0.8627451, 1,
-0.1188348, -2.137412, -3.632886, 0, 1, 0.8666667, 1,
-0.1180265, 0.4383058, 0.18887, 0, 1, 0.8745098, 1,
-0.117423, 1.223719, -0.1278349, 0, 1, 0.8784314, 1,
-0.116198, -1.451168, -2.71902, 0, 1, 0.8862745, 1,
-0.1152897, 1.076926, -0.4233669, 0, 1, 0.8901961, 1,
-0.1119373, -0.9632947, -4.334476, 0, 1, 0.8980392, 1,
-0.1115536, -0.5971735, -3.121343, 0, 1, 0.9058824, 1,
-0.1077057, -0.1790551, -5.340584, 0, 1, 0.9098039, 1,
-0.1069555, -1.275465, -3.407883, 0, 1, 0.9176471, 1,
-0.1057497, 1.063799, 0.3665253, 0, 1, 0.9215686, 1,
-0.101413, -2.183392, -3.226367, 0, 1, 0.9294118, 1,
-0.1011022, 0.8413641, 0.9533302, 0, 1, 0.9333333, 1,
-0.1004764, 0.63183, 0.24188, 0, 1, 0.9411765, 1,
-0.09976362, 0.7433193, 2.83931, 0, 1, 0.945098, 1,
-0.09766477, 0.7157276, -0.1425688, 0, 1, 0.9529412, 1,
-0.09682434, 1.00577, 0.1622985, 0, 1, 0.9568627, 1,
-0.09665304, 0.5835376, -0.151099, 0, 1, 0.9647059, 1,
-0.09597161, -0.77571, -4.684526, 0, 1, 0.9686275, 1,
-0.0953752, 1.024405, -1.484133, 0, 1, 0.9764706, 1,
-0.09102709, -1.057877, -2.200732, 0, 1, 0.9803922, 1,
-0.07737029, -0.1509614, -2.636779, 0, 1, 0.9882353, 1,
-0.07365607, -0.1000736, -0.7965894, 0, 1, 0.9921569, 1,
-0.07226691, -0.1102126, -3.433629, 0, 1, 1, 1,
-0.07030603, -0.3448534, -2.194485, 0, 0.9921569, 1, 1,
-0.06185523, 1.290806, 0.5564138, 0, 0.9882353, 1, 1,
-0.05791648, 1.345039, 0.3271025, 0, 0.9803922, 1, 1,
-0.05391523, 0.1571062, -0.07668841, 0, 0.9764706, 1, 1,
-0.04932135, -1.342668, -4.138922, 0, 0.9686275, 1, 1,
-0.04541732, -0.2480462, -2.880039, 0, 0.9647059, 1, 1,
-0.03033102, 0.4641018, -0.6997286, 0, 0.9568627, 1, 1,
-0.0300808, 0.606538, -1.200835, 0, 0.9529412, 1, 1,
-0.02771819, -1.221325, -2.981232, 0, 0.945098, 1, 1,
-0.02666581, -0.5890397, -2.522982, 0, 0.9411765, 1, 1,
-0.01946008, -0.116749, -5.034757, 0, 0.9333333, 1, 1,
-0.01845269, -0.397701, -3.933041, 0, 0.9294118, 1, 1,
-0.01697144, 0.2742343, -1.196149, 0, 0.9215686, 1, 1,
-0.01387292, 0.6221945, 1.026225, 0, 0.9176471, 1, 1,
-0.01201991, -0.9698724, -1.477991, 0, 0.9098039, 1, 1,
-0.01118162, 1.468026, -0.5565773, 0, 0.9058824, 1, 1,
-0.01064452, 0.1451954, -0.1023257, 0, 0.8980392, 1, 1,
-0.01027448, -1.286365, -1.637405, 0, 0.8901961, 1, 1,
-0.01014295, 0.3569513, -1.333752, 0, 0.8862745, 1, 1,
-0.01002854, 0.7010267, -0.3947409, 0, 0.8784314, 1, 1,
-0.009412182, -0.1999369, -2.145005, 0, 0.8745098, 1, 1,
-0.009132404, -0.2400953, -1.752684, 0, 0.8666667, 1, 1,
-0.008198214, 0.7690561, 0.7142254, 0, 0.8627451, 1, 1,
-0.005487038, -1.27838, -2.90948, 0, 0.854902, 1, 1,
-0.004797647, -0.263114, -3.351137, 0, 0.8509804, 1, 1,
-0.002158484, -0.424527, -3.061698, 0, 0.8431373, 1, 1,
-0.001757744, -0.1268276, -2.700763, 0, 0.8392157, 1, 1,
-0.0008981896, -0.96075, -1.649816, 0, 0.8313726, 1, 1,
-8.417799e-05, 0.7088813, -1.412555, 0, 0.827451, 1, 1,
0.002150332, -0.8891454, 3.333369, 0, 0.8196079, 1, 1,
0.006611741, 0.4203117, -0.9167784, 0, 0.8156863, 1, 1,
0.007819788, -0.07145001, 1.497194, 0, 0.8078431, 1, 1,
0.01220209, 0.221066, -0.2886989, 0, 0.8039216, 1, 1,
0.01484039, -2.165719, 3.029247, 0, 0.7960784, 1, 1,
0.01727086, -2.379088, 2.787137, 0, 0.7882353, 1, 1,
0.01853581, 0.7870578, 0.1037577, 0, 0.7843137, 1, 1,
0.01924817, -0.1931771, 2.586731, 0, 0.7764706, 1, 1,
0.01993149, -0.1425806, 2.046857, 0, 0.772549, 1, 1,
0.02121134, 0.1067557, 0.9508761, 0, 0.7647059, 1, 1,
0.02254586, 0.3599487, 1.405813, 0, 0.7607843, 1, 1,
0.02845965, -2.2245, 2.522641, 0, 0.7529412, 1, 1,
0.03173208, -1.354897, 3.604332, 0, 0.7490196, 1, 1,
0.03218033, -0.7930794, 2.329866, 0, 0.7411765, 1, 1,
0.03273391, -1.601158, 4.964974, 0, 0.7372549, 1, 1,
0.03954661, -0.8526349, 4.410765, 0, 0.7294118, 1, 1,
0.0414163, -0.4513132, 3.907131, 0, 0.7254902, 1, 1,
0.04179047, -1.059799, 4.001536, 0, 0.7176471, 1, 1,
0.0450442, 1.374208, 0.1409288, 0, 0.7137255, 1, 1,
0.04614848, -0.6863229, 1.561478, 0, 0.7058824, 1, 1,
0.04794841, 0.553519, -0.6275591, 0, 0.6980392, 1, 1,
0.04902178, -0.4100232, 1.938774, 0, 0.6941177, 1, 1,
0.05312034, 0.9378871, 1.057059, 0, 0.6862745, 1, 1,
0.05723389, 0.1546782, 0.4081602, 0, 0.682353, 1, 1,
0.06244607, 0.3359405, 0.3724557, 0, 0.6745098, 1, 1,
0.06366218, -1.297655, 1.637107, 0, 0.6705883, 1, 1,
0.06577779, 1.173205, -0.1587092, 0, 0.6627451, 1, 1,
0.06876238, -0.4944691, 3.019083, 0, 0.6588235, 1, 1,
0.07974173, -0.4313674, 2.8795, 0, 0.6509804, 1, 1,
0.08411674, 0.7726574, -0.3741825, 0, 0.6470588, 1, 1,
0.08442303, 0.09443903, 1.037874, 0, 0.6392157, 1, 1,
0.08482486, 0.2712019, 0.5191537, 0, 0.6352941, 1, 1,
0.08664865, -0.1963977, 2.191279, 0, 0.627451, 1, 1,
0.08694829, -0.8185066, 2.480838, 0, 0.6235294, 1, 1,
0.0880358, -0.1931542, 3.087829, 0, 0.6156863, 1, 1,
0.08905327, -1.473831, 2.938914, 0, 0.6117647, 1, 1,
0.08987854, -0.2067594, 3.570647, 0, 0.6039216, 1, 1,
0.09127314, 0.1097437, -0.5239862, 0, 0.5960785, 1, 1,
0.09495463, 0.1487643, 0.4495541, 0, 0.5921569, 1, 1,
0.09719796, 1.211321, 1.216225, 0, 0.5843138, 1, 1,
0.09824902, -1.142656, 2.619597, 0, 0.5803922, 1, 1,
0.09862558, 0.7355481, -0.5844032, 0, 0.572549, 1, 1,
0.101665, -0.07811949, 2.625608, 0, 0.5686275, 1, 1,
0.1039686, -0.2440977, 1.680687, 0, 0.5607843, 1, 1,
0.10681, -0.2155727, 1.160301, 0, 0.5568628, 1, 1,
0.1071239, 0.1133199, -0.2814417, 0, 0.5490196, 1, 1,
0.1108733, -0.3083628, 2.693329, 0, 0.5450981, 1, 1,
0.1118082, 0.2304319, 0.1899685, 0, 0.5372549, 1, 1,
0.1134711, 0.9395969, 0.9781885, 0, 0.5333334, 1, 1,
0.1147134, 1.637301, -0.7989439, 0, 0.5254902, 1, 1,
0.1152288, -0.7282655, 3.214149, 0, 0.5215687, 1, 1,
0.1175864, 0.3615374, 0.9807122, 0, 0.5137255, 1, 1,
0.118352, 0.8365627, -0.303161, 0, 0.509804, 1, 1,
0.1232466, 0.0809797, 1.362748, 0, 0.5019608, 1, 1,
0.1240796, -0.03383753, 3.132859, 0, 0.4941176, 1, 1,
0.1250909, 0.7201995, 0.8805731, 0, 0.4901961, 1, 1,
0.1268191, -0.9388483, 3.984217, 0, 0.4823529, 1, 1,
0.1285276, 1.607302, 0.6044636, 0, 0.4784314, 1, 1,
0.13139, -0.8074583, 2.185336, 0, 0.4705882, 1, 1,
0.134169, -1.022507, 3.979863, 0, 0.4666667, 1, 1,
0.1345055, -0.1716071, 3.951861, 0, 0.4588235, 1, 1,
0.1345249, -0.5985976, 3.093227, 0, 0.454902, 1, 1,
0.1354886, 0.1429184, 1.871357, 0, 0.4470588, 1, 1,
0.1429853, -0.9546925, 3.255007, 0, 0.4431373, 1, 1,
0.14711, -0.06665247, 0.06426531, 0, 0.4352941, 1, 1,
0.1494021, 0.00289878, 1.710662, 0, 0.4313726, 1, 1,
0.149562, -0.6376843, 1.675342, 0, 0.4235294, 1, 1,
0.1548862, 1.036388, -0.6963496, 0, 0.4196078, 1, 1,
0.1610683, 1.253372, 0.7820153, 0, 0.4117647, 1, 1,
0.1648295, 0.2604054, 0.5640857, 0, 0.4078431, 1, 1,
0.1648904, 1.538244, -0.2022923, 0, 0.4, 1, 1,
0.1649329, -1.11128, 2.157721, 0, 0.3921569, 1, 1,
0.1710393, -1.473133, 2.223336, 0, 0.3882353, 1, 1,
0.1743009, -1.256267, 2.879493, 0, 0.3803922, 1, 1,
0.181674, 0.525017, 0.9677621, 0, 0.3764706, 1, 1,
0.1887505, 1.336944, 0.9620423, 0, 0.3686275, 1, 1,
0.1925007, -0.6091931, 3.355162, 0, 0.3647059, 1, 1,
0.1925104, 0.5978395, -1.040292, 0, 0.3568628, 1, 1,
0.1933191, -0.7634982, 2.610975, 0, 0.3529412, 1, 1,
0.1940733, 0.3793849, 0.6681231, 0, 0.345098, 1, 1,
0.1948928, -0.07494459, 0.2887751, 0, 0.3411765, 1, 1,
0.1956211, -0.6916728, 3.243589, 0, 0.3333333, 1, 1,
0.1956366, 0.1527955, 1.677052, 0, 0.3294118, 1, 1,
0.1967796, 1.193246, -0.3339912, 0, 0.3215686, 1, 1,
0.2006116, 1.571436, 0.2664218, 0, 0.3176471, 1, 1,
0.20123, 0.5498608, -0.3388129, 0, 0.3098039, 1, 1,
0.2141775, -1.89773, 1.974297, 0, 0.3058824, 1, 1,
0.2188137, -2.24338, 2.572673, 0, 0.2980392, 1, 1,
0.2223199, 0.04971427, 2.447318, 0, 0.2901961, 1, 1,
0.2231707, -0.5251223, 4.018586, 0, 0.2862745, 1, 1,
0.2249872, 0.4317787, 0.1292867, 0, 0.2784314, 1, 1,
0.2277351, -0.1925322, 2.27953, 0, 0.2745098, 1, 1,
0.2308559, 1.079478, 0.6961272, 0, 0.2666667, 1, 1,
0.2328424, -0.1772224, 1.828247, 0, 0.2627451, 1, 1,
0.2353913, -1.288487, 2.870415, 0, 0.254902, 1, 1,
0.2374477, -0.221846, 0.2228354, 0, 0.2509804, 1, 1,
0.2384116, -0.563769, 3.780997, 0, 0.2431373, 1, 1,
0.2389467, 0.1395407, 1.526192, 0, 0.2392157, 1, 1,
0.2391152, -0.153024, 2.445706, 0, 0.2313726, 1, 1,
0.2475452, -0.02431547, 1.816879, 0, 0.227451, 1, 1,
0.2476339, -0.168888, 1.84908, 0, 0.2196078, 1, 1,
0.2512236, -0.6923925, 2.315675, 0, 0.2156863, 1, 1,
0.2513445, -0.8297769, 5.603641, 0, 0.2078431, 1, 1,
0.2572173, -0.6830612, 3.025172, 0, 0.2039216, 1, 1,
0.2586991, -0.2789925, 0.8930741, 0, 0.1960784, 1, 1,
0.2601349, -0.6022633, 1.275759, 0, 0.1882353, 1, 1,
0.2608111, -1.129836, 2.247988, 0, 0.1843137, 1, 1,
0.2613956, 1.201005, 2.03266, 0, 0.1764706, 1, 1,
0.2622431, 0.1885868, 2.543815, 0, 0.172549, 1, 1,
0.2625822, -0.2630374, 2.997993, 0, 0.1647059, 1, 1,
0.2638398, 0.0873317, -0.6486932, 0, 0.1607843, 1, 1,
0.2646038, 0.1200207, 0.6243777, 0, 0.1529412, 1, 1,
0.2688545, 0.3760967, -0.2344687, 0, 0.1490196, 1, 1,
0.2694358, -0.07243699, 1.52049, 0, 0.1411765, 1, 1,
0.2703656, -0.5420633, 3.557429, 0, 0.1372549, 1, 1,
0.270958, -0.4587951, 3.993117, 0, 0.1294118, 1, 1,
0.2722107, 0.9865603, 0.5469205, 0, 0.1254902, 1, 1,
0.27496, -0.4120985, 3.171, 0, 0.1176471, 1, 1,
0.2756778, 0.3241752, -0.9621734, 0, 0.1137255, 1, 1,
0.2805986, 0.5773673, 0.4250594, 0, 0.1058824, 1, 1,
0.282437, -1.047709, 3.349702, 0, 0.09803922, 1, 1,
0.2827126, 0.2941563, -0.6626099, 0, 0.09411765, 1, 1,
0.2907967, 0.1095462, 1.295111, 0, 0.08627451, 1, 1,
0.2931386, 0.9394037, 0.6465199, 0, 0.08235294, 1, 1,
0.2934466, 0.8995235, 2.386331, 0, 0.07450981, 1, 1,
0.2964366, 1.393989, 0.09205402, 0, 0.07058824, 1, 1,
0.2989082, 0.09858036, 1.00235, 0, 0.0627451, 1, 1,
0.2992857, -0.8285912, 2.52952, 0, 0.05882353, 1, 1,
0.3026599, -0.8624269, 3.914665, 0, 0.05098039, 1, 1,
0.303562, -1.80488, 3.335092, 0, 0.04705882, 1, 1,
0.304934, 0.124329, 2.263177, 0, 0.03921569, 1, 1,
0.3109276, -0.9255605, 2.301691, 0, 0.03529412, 1, 1,
0.3170841, -0.5410834, 3.954642, 0, 0.02745098, 1, 1,
0.317776, 0.8912971, -0.7640811, 0, 0.02352941, 1, 1,
0.3246564, 0.1919732, 2.431396, 0, 0.01568628, 1, 1,
0.328974, -1.670005, 2.128788, 0, 0.01176471, 1, 1,
0.3294994, 0.7491288, 2.16576, 0, 0.003921569, 1, 1,
0.3303921, 1.564669, 2.609122, 0.003921569, 0, 1, 1,
0.3309461, 0.6026869, 0.3484728, 0.007843138, 0, 1, 1,
0.3334117, 1.252389, 0.4232529, 0.01568628, 0, 1, 1,
0.3377535, -1.880237, 2.777942, 0.01960784, 0, 1, 1,
0.341131, -0.3062767, 2.78175, 0.02745098, 0, 1, 1,
0.3449701, -0.05381824, 0.9996414, 0.03137255, 0, 1, 1,
0.3450971, -1.891747, 1.939888, 0.03921569, 0, 1, 1,
0.3528893, -1.985994, 2.357925, 0.04313726, 0, 1, 1,
0.3532411, 1.171966, 1.578009, 0.05098039, 0, 1, 1,
0.3623337, -0.00123959, 0.8476308, 0.05490196, 0, 1, 1,
0.363011, 0.366744, -0.5678038, 0.0627451, 0, 1, 1,
0.3678867, 0.1205005, 0.6997406, 0.06666667, 0, 1, 1,
0.3685226, -0.6387249, 3.119503, 0.07450981, 0, 1, 1,
0.3722061, -0.5493789, 2.679732, 0.07843138, 0, 1, 1,
0.3733365, -0.6330234, 2.822868, 0.08627451, 0, 1, 1,
0.3766254, 0.9143021, 1.524193, 0.09019608, 0, 1, 1,
0.3776417, 1.547152, 0.7837516, 0.09803922, 0, 1, 1,
0.3790855, 0.2829194, 2.598173, 0.1058824, 0, 1, 1,
0.3866392, 0.7030033, -0.8598292, 0.1098039, 0, 1, 1,
0.3869694, -0.02021437, 3.428872, 0.1176471, 0, 1, 1,
0.3877266, -0.7145333, 1.809524, 0.1215686, 0, 1, 1,
0.3977459, -0.1872333, 2.215734, 0.1294118, 0, 1, 1,
0.4015042, -0.009625583, -0.5802452, 0.1333333, 0, 1, 1,
0.4087106, 0.6805075, 0.8253763, 0.1411765, 0, 1, 1,
0.4103255, -0.6804277, 3.185946, 0.145098, 0, 1, 1,
0.4182374, 1.592745, 0.7594424, 0.1529412, 0, 1, 1,
0.4261568, 0.3002393, 1.105438, 0.1568628, 0, 1, 1,
0.4341895, 0.8022404, 0.05529032, 0.1647059, 0, 1, 1,
0.4349393, 0.2703938, -0.4161936, 0.1686275, 0, 1, 1,
0.4390323, -0.6910978, 4.416386, 0.1764706, 0, 1, 1,
0.4411554, -0.05826605, 3.683129, 0.1803922, 0, 1, 1,
0.4419306, 0.1947502, 2.594635, 0.1882353, 0, 1, 1,
0.4438865, 0.495114, 0.6700063, 0.1921569, 0, 1, 1,
0.4467121, 1.175841, -1.766285, 0.2, 0, 1, 1,
0.4514287, 0.3257675, 1.073012, 0.2078431, 0, 1, 1,
0.4586628, 0.4875887, 0.779127, 0.2117647, 0, 1, 1,
0.4611885, 1.579501, 1.862012, 0.2196078, 0, 1, 1,
0.4655571, -0.5028545, 1.0128, 0.2235294, 0, 1, 1,
0.4692762, -0.9774708, 3.219498, 0.2313726, 0, 1, 1,
0.4694618, -1.503153, 3.948653, 0.2352941, 0, 1, 1,
0.4793639, -2.787445, 3.549231, 0.2431373, 0, 1, 1,
0.480096, 0.5186725, 1.175411, 0.2470588, 0, 1, 1,
0.4802147, 0.2895311, 1.547526, 0.254902, 0, 1, 1,
0.485297, 0.06239108, 1.628045, 0.2588235, 0, 1, 1,
0.4864188, 0.1673531, -0.05791286, 0.2666667, 0, 1, 1,
0.4909905, -0.3853858, 2.08015, 0.2705882, 0, 1, 1,
0.4943811, 1.140172, -0.1324646, 0.2784314, 0, 1, 1,
0.4966982, -0.5444716, 1.746032, 0.282353, 0, 1, 1,
0.4990116, 0.1386759, -0.3145275, 0.2901961, 0, 1, 1,
0.5013182, -0.9160739, 2.13306, 0.2941177, 0, 1, 1,
0.5030382, 0.02808678, 0.9450415, 0.3019608, 0, 1, 1,
0.5051723, -0.9739531, 2.689235, 0.3098039, 0, 1, 1,
0.5058181, 0.5954411, 1.492317, 0.3137255, 0, 1, 1,
0.5066953, 0.7647607, -0.2318593, 0.3215686, 0, 1, 1,
0.5141261, 0.8427051, -0.05925572, 0.3254902, 0, 1, 1,
0.5154688, 0.1323595, 1.615725, 0.3333333, 0, 1, 1,
0.5219919, -1.179511, 2.325501, 0.3372549, 0, 1, 1,
0.522346, -0.5785244, 1.520901, 0.345098, 0, 1, 1,
0.5272921, 1.21464, -0.7757967, 0.3490196, 0, 1, 1,
0.5340475, -0.4610729, 1.080938, 0.3568628, 0, 1, 1,
0.535029, 0.07399307, 0.123494, 0.3607843, 0, 1, 1,
0.5350851, -0.4980598, 2.547292, 0.3686275, 0, 1, 1,
0.5388116, 0.4265667, 1.653122, 0.372549, 0, 1, 1,
0.5406971, -0.9690361, 2.480512, 0.3803922, 0, 1, 1,
0.5422736, 1.453362, -0.2042032, 0.3843137, 0, 1, 1,
0.5447518, -0.4544255, 1.805643, 0.3921569, 0, 1, 1,
0.5450365, -0.02968299, -0.2045031, 0.3960784, 0, 1, 1,
0.5482011, -0.6830026, 1.96821, 0.4039216, 0, 1, 1,
0.5491799, -0.01389823, -0.2619872, 0.4117647, 0, 1, 1,
0.549773, 0.357661, 1.556332, 0.4156863, 0, 1, 1,
0.5551297, 0.08656399, 1.488531, 0.4235294, 0, 1, 1,
0.5555976, -0.5809298, 2.929336, 0.427451, 0, 1, 1,
0.5564225, 1.650756, 1.07795, 0.4352941, 0, 1, 1,
0.5593747, 0.2043761, 0.00534316, 0.4392157, 0, 1, 1,
0.5685959, 1.585815, 1.197688, 0.4470588, 0, 1, 1,
0.5710599, -1.552784, 3.093463, 0.4509804, 0, 1, 1,
0.5752593, -0.2226265, 0.9186574, 0.4588235, 0, 1, 1,
0.5762839, 0.04760948, 2.076323, 0.4627451, 0, 1, 1,
0.5780904, -1.573047, 3.636106, 0.4705882, 0, 1, 1,
0.5926747, -1.723987, 1.2075, 0.4745098, 0, 1, 1,
0.6003661, -0.04509262, -0.6143569, 0.4823529, 0, 1, 1,
0.6059565, 0.03175892, 1.156491, 0.4862745, 0, 1, 1,
0.6060948, -0.5486882, 2.184315, 0.4941176, 0, 1, 1,
0.6145177, -0.4847884, 1.479604, 0.5019608, 0, 1, 1,
0.6246928, -1.236423, 3.873573, 0.5058824, 0, 1, 1,
0.6248835, -0.4917832, 2.638661, 0.5137255, 0, 1, 1,
0.6262745, 0.979053, 1.991587, 0.5176471, 0, 1, 1,
0.6329997, 1.027503, 1.359267, 0.5254902, 0, 1, 1,
0.6374389, 1.975644, -0.6861398, 0.5294118, 0, 1, 1,
0.6432301, -0.5127237, 3.242488, 0.5372549, 0, 1, 1,
0.6443836, -0.0638086, 1.715406, 0.5411765, 0, 1, 1,
0.6495417, 1.410075, 0.0526624, 0.5490196, 0, 1, 1,
0.6523654, -0.2265334, 1.713109, 0.5529412, 0, 1, 1,
0.654249, 0.4862289, 1.162957, 0.5607843, 0, 1, 1,
0.6560015, 0.927501, 0.2334525, 0.5647059, 0, 1, 1,
0.6595154, 0.6139546, 1.303607, 0.572549, 0, 1, 1,
0.6602128, 0.2369339, 0.5653096, 0.5764706, 0, 1, 1,
0.6616467, -1.041883, 1.439293, 0.5843138, 0, 1, 1,
0.6620776, 0.8200195, 1.109072, 0.5882353, 0, 1, 1,
0.6628266, -0.3411196, -1.122588, 0.5960785, 0, 1, 1,
0.6644258, 1.271094, 3.394712, 0.6039216, 0, 1, 1,
0.6661716, 1.559114, 2.326511, 0.6078432, 0, 1, 1,
0.672541, -0.2469571, 3.380708, 0.6156863, 0, 1, 1,
0.6761159, 0.6329545, 1.634279, 0.6196079, 0, 1, 1,
0.6772621, 0.5001507, -0.7056665, 0.627451, 0, 1, 1,
0.6841387, 0.5103709, 1.138658, 0.6313726, 0, 1, 1,
0.6873007, 0.6455857, 1.32963, 0.6392157, 0, 1, 1,
0.6899442, 1.222112, 3.233982, 0.6431373, 0, 1, 1,
0.6908726, -1.738895, 3.24314, 0.6509804, 0, 1, 1,
0.6911536, 0.5999238, 1.951012, 0.654902, 0, 1, 1,
0.6950964, 0.6858317, 1.665777, 0.6627451, 0, 1, 1,
0.6966403, 2.015265, 1.027857, 0.6666667, 0, 1, 1,
0.7018499, 0.7338853, 2.250888, 0.6745098, 0, 1, 1,
0.7028971, 1.203932, -0.4347436, 0.6784314, 0, 1, 1,
0.7035954, -0.5929659, 2.85151, 0.6862745, 0, 1, 1,
0.7072442, -0.4754953, 1.670225, 0.6901961, 0, 1, 1,
0.7090314, 0.5792946, 0.9495935, 0.6980392, 0, 1, 1,
0.7124819, -0.4483624, 2.639479, 0.7058824, 0, 1, 1,
0.7136824, 1.854966, 0.07226174, 0.7098039, 0, 1, 1,
0.7165896, 0.9294743, -0.3608518, 0.7176471, 0, 1, 1,
0.7166874, -0.8128303, 1.676891, 0.7215686, 0, 1, 1,
0.722967, 0.4456567, 0.6591678, 0.7294118, 0, 1, 1,
0.7325492, 1.727424, 2.205316, 0.7333333, 0, 1, 1,
0.7340233, 0.6193985, -0.4260726, 0.7411765, 0, 1, 1,
0.7342362, 0.2132635, -1.425563, 0.7450981, 0, 1, 1,
0.7392833, -0.2578058, 0.7556047, 0.7529412, 0, 1, 1,
0.7476742, -0.8474637, 3.232588, 0.7568628, 0, 1, 1,
0.7497242, -1.134059, 2.72228, 0.7647059, 0, 1, 1,
0.7504523, -0.4624219, 2.052647, 0.7686275, 0, 1, 1,
0.7538927, 0.4924591, 0.6517009, 0.7764706, 0, 1, 1,
0.75425, 0.3736914, 0.3172004, 0.7803922, 0, 1, 1,
0.7544761, -0.9192131, 3.986639, 0.7882353, 0, 1, 1,
0.7553651, -1.124328, 1.821439, 0.7921569, 0, 1, 1,
0.7555074, 0.3578293, 1.464761, 0.8, 0, 1, 1,
0.7591078, -0.5771719, 2.670629, 0.8078431, 0, 1, 1,
0.7648139, 0.5667729, 0.6166642, 0.8117647, 0, 1, 1,
0.7715889, 0.9254916, 1.653667, 0.8196079, 0, 1, 1,
0.7721466, 0.759421, 1.570095, 0.8235294, 0, 1, 1,
0.7735425, -0.9371099, 1.114971, 0.8313726, 0, 1, 1,
0.7739547, -0.5080517, 3.858766, 0.8352941, 0, 1, 1,
0.7746034, 0.7745349, -0.368768, 0.8431373, 0, 1, 1,
0.7749168, 0.7975954, 1.051312, 0.8470588, 0, 1, 1,
0.7761107, -0.5139029, 0.8654472, 0.854902, 0, 1, 1,
0.7777045, 0.3441345, -0.1262683, 0.8588235, 0, 1, 1,
0.7812794, 0.6399252, 0.8685411, 0.8666667, 0, 1, 1,
0.7858139, 0.5713884, -0.589121, 0.8705882, 0, 1, 1,
0.7861231, 0.5001686, 1.046566, 0.8784314, 0, 1, 1,
0.7892359, 1.272524, 0.3274316, 0.8823529, 0, 1, 1,
0.7901609, 0.7521006, 0.8053523, 0.8901961, 0, 1, 1,
0.7935452, -1.149851, 2.067774, 0.8941177, 0, 1, 1,
0.8064913, 1.78844, -0.490346, 0.9019608, 0, 1, 1,
0.8097983, 0.3332307, 0.6631141, 0.9098039, 0, 1, 1,
0.8105767, -1.073302, 2.157251, 0.9137255, 0, 1, 1,
0.8124068, -0.7756638, 1.007058, 0.9215686, 0, 1, 1,
0.817978, -2.179477, 2.885147, 0.9254902, 0, 1, 1,
0.8204656, -1.181776, 3.541179, 0.9333333, 0, 1, 1,
0.8211326, -0.1810372, 0.4654656, 0.9372549, 0, 1, 1,
0.8315488, 0.3197489, 2.084558, 0.945098, 0, 1, 1,
0.8363543, -0.06624753, 4.336566, 0.9490196, 0, 1, 1,
0.8454807, -0.6701954, 3.736417, 0.9568627, 0, 1, 1,
0.8455268, -2.433857, 1.752649, 0.9607843, 0, 1, 1,
0.8526208, 0.13523, 2.699521, 0.9686275, 0, 1, 1,
0.8581852, -1.950656, 2.918501, 0.972549, 0, 1, 1,
0.8600397, -1.572111, 2.38849, 0.9803922, 0, 1, 1,
0.8614367, 0.06713735, 2.401893, 0.9843137, 0, 1, 1,
0.8762757, -0.5581346, 1.608867, 0.9921569, 0, 1, 1,
0.8795552, -0.6885691, 1.311588, 0.9960784, 0, 1, 1,
0.8803135, -0.5817884, 2.027736, 1, 0, 0.9960784, 1,
0.88077, 0.6085559, 1.354398, 1, 0, 0.9882353, 1,
0.8824985, 2.056984, 1.381807, 1, 0, 0.9843137, 1,
0.8852687, -0.4614241, 2.370388, 1, 0, 0.9764706, 1,
0.8867341, 0.9592862, 1.990703, 1, 0, 0.972549, 1,
0.887194, -0.6880299, 2.050415, 1, 0, 0.9647059, 1,
0.8900135, 1.017646, -0.2909827, 1, 0, 0.9607843, 1,
0.8963733, -0.4256155, 3.103698, 1, 0, 0.9529412, 1,
0.898341, -0.946593, 3.763387, 1, 0, 0.9490196, 1,
0.9075987, 0.3769001, 1.321284, 1, 0, 0.9411765, 1,
0.9097017, -1.890449, 3.001617, 1, 0, 0.9372549, 1,
0.9125045, -0.9731124, 3.009104, 1, 0, 0.9294118, 1,
0.9226086, 0.4402209, 1.624815, 1, 0, 0.9254902, 1,
0.9235778, -0.1029206, 0.5214529, 1, 0, 0.9176471, 1,
0.9262354, 0.01247596, 0.7852719, 1, 0, 0.9137255, 1,
0.9357677, 2.115796, 0.9546553, 1, 0, 0.9058824, 1,
0.9378989, -1.415021, 2.743174, 1, 0, 0.9019608, 1,
0.9552023, -0.9536459, 1.484883, 1, 0, 0.8941177, 1,
0.9566744, 0.2919968, 0.7657123, 1, 0, 0.8862745, 1,
0.9637191, -0.1907641, 1.618955, 1, 0, 0.8823529, 1,
0.9691099, -0.1690013, 1.562816, 1, 0, 0.8745098, 1,
0.9723987, -2.335942, 2.45622, 1, 0, 0.8705882, 1,
0.9788204, -1.146953, 3.709463, 1, 0, 0.8627451, 1,
0.9815624, -0.2399013, 0.7062973, 1, 0, 0.8588235, 1,
0.9826011, -0.08673655, 2.092908, 1, 0, 0.8509804, 1,
0.9829618, 0.8929859, -0.264036, 1, 0, 0.8470588, 1,
0.9865475, 0.559655, 2.184811, 1, 0, 0.8392157, 1,
0.9953297, -0.5236717, 3.370913, 1, 0, 0.8352941, 1,
1.005056, -0.398214, 0.8170038, 1, 0, 0.827451, 1,
1.00841, 0.2345743, 2.50563, 1, 0, 0.8235294, 1,
1.022695, -0.3587709, 2.276064, 1, 0, 0.8156863, 1,
1.029736, 0.6902733, 1.641044, 1, 0, 0.8117647, 1,
1.031373, 2.625181, 0.01605047, 1, 0, 0.8039216, 1,
1.032763, 0.6824028, 0.9039783, 1, 0, 0.7960784, 1,
1.033161, 1.24175, 1.440816, 1, 0, 0.7921569, 1,
1.034714, 1.453244, 0.9459158, 1, 0, 0.7843137, 1,
1.040188, -0.04950959, 2.899673, 1, 0, 0.7803922, 1,
1.040436, -1.52825, 1.304396, 1, 0, 0.772549, 1,
1.040919, 0.3192798, 0.4983186, 1, 0, 0.7686275, 1,
1.048079, -0.3789952, 0.5703685, 1, 0, 0.7607843, 1,
1.050464, -0.4363669, 2.056624, 1, 0, 0.7568628, 1,
1.059752, -0.7674195, 3.983203, 1, 0, 0.7490196, 1,
1.061939, 0.856669, 0.6268315, 1, 0, 0.7450981, 1,
1.071033, 0.3158019, 1.006284, 1, 0, 0.7372549, 1,
1.077288, -0.0890431, 2.169331, 1, 0, 0.7333333, 1,
1.078797, -0.489062, 2.156698, 1, 0, 0.7254902, 1,
1.094911, -0.8072893, 2.187364, 1, 0, 0.7215686, 1,
1.103782, -0.9091498, 2.302258, 1, 0, 0.7137255, 1,
1.108863, 1.057192, 0.5240321, 1, 0, 0.7098039, 1,
1.12024, 0.1869394, 1.173618, 1, 0, 0.7019608, 1,
1.122162, -1.025948, 3.332519, 1, 0, 0.6941177, 1,
1.122595, -1.431013, 3.563875, 1, 0, 0.6901961, 1,
1.124762, -0.1841287, 1.919305, 1, 0, 0.682353, 1,
1.133919, -0.09427842, 1.928878, 1, 0, 0.6784314, 1,
1.145031, 0.997052, 0.6986369, 1, 0, 0.6705883, 1,
1.146587, -0.1128325, 1.187034, 1, 0, 0.6666667, 1,
1.151149, -3.299798, 2.421056, 1, 0, 0.6588235, 1,
1.156723, -0.6172496, 0.2989329, 1, 0, 0.654902, 1,
1.158829, -0.2531326, 1.310733, 1, 0, 0.6470588, 1,
1.16225, 0.7386804, 1.090671, 1, 0, 0.6431373, 1,
1.162873, -0.9748618, 1.733277, 1, 0, 0.6352941, 1,
1.172115, -1.026928, 3.13677, 1, 0, 0.6313726, 1,
1.173475, 0.1659475, 1.521208, 1, 0, 0.6235294, 1,
1.177227, 0.678128, -0.5073138, 1, 0, 0.6196079, 1,
1.186332, -0.2036598, 2.458559, 1, 0, 0.6117647, 1,
1.186527, 1.316269, 2.069499, 1, 0, 0.6078432, 1,
1.187092, 0.7423127, 0.2973559, 1, 0, 0.6, 1,
1.190313, 0.832829, 1.804745, 1, 0, 0.5921569, 1,
1.198033, 0.7829003, 1.046583, 1, 0, 0.5882353, 1,
1.200514, 0.9633605, 2.693058, 1, 0, 0.5803922, 1,
1.207635, -2.035334, 1.721408, 1, 0, 0.5764706, 1,
1.211095, -0.520409, 2.788932, 1, 0, 0.5686275, 1,
1.211309, 0.04874149, 2.354079, 1, 0, 0.5647059, 1,
1.211654, -0.6849819, 1.073115, 1, 0, 0.5568628, 1,
1.216358, 0.8003671, 0.8950109, 1, 0, 0.5529412, 1,
1.218058, -3.126558, 1.120442, 1, 0, 0.5450981, 1,
1.224011, 0.4534246, 0.1764081, 1, 0, 0.5411765, 1,
1.234621, -0.2699499, 3.338061, 1, 0, 0.5333334, 1,
1.23571, -1.747231, 3.01357, 1, 0, 0.5294118, 1,
1.244806, -0.8409487, 2.558933, 1, 0, 0.5215687, 1,
1.248634, -1.644841, 0.6478002, 1, 0, 0.5176471, 1,
1.25097, -1.863013, 2.172936, 1, 0, 0.509804, 1,
1.265131, -0.02921965, 0.8389561, 1, 0, 0.5058824, 1,
1.287622, 0.349748, 2.34517, 1, 0, 0.4980392, 1,
1.288039, 0.6873063, 1.381639, 1, 0, 0.4901961, 1,
1.292278, -1.191597, 2.824365, 1, 0, 0.4862745, 1,
1.293695, 1.321307, 0.7416469, 1, 0, 0.4784314, 1,
1.294852, 0.3608731, 0.9391951, 1, 0, 0.4745098, 1,
1.323525, 0.9781461, 0.6968914, 1, 0, 0.4666667, 1,
1.331226, -0.8015347, 3.477644, 1, 0, 0.4627451, 1,
1.360994, -0.8390414, 2.405089, 1, 0, 0.454902, 1,
1.374385, -1.395566, 5.971784, 1, 0, 0.4509804, 1,
1.390809, 1.129482, 0.6683335, 1, 0, 0.4431373, 1,
1.408667, -0.3982958, 1.295274, 1, 0, 0.4392157, 1,
1.410096, 0.2505425, -1.505666, 1, 0, 0.4313726, 1,
1.411118, 0.2619541, 1.533828, 1, 0, 0.427451, 1,
1.412004, 1.202917, -0.9682524, 1, 0, 0.4196078, 1,
1.414267, -0.09587321, 1.937501, 1, 0, 0.4156863, 1,
1.419186, -0.1262639, 1.832574, 1, 0, 0.4078431, 1,
1.420473, -1.892026, 4.942359, 1, 0, 0.4039216, 1,
1.463256, 0.9992549, 0.795909, 1, 0, 0.3960784, 1,
1.478804, -0.7309623, 3.130763, 1, 0, 0.3882353, 1,
1.479568, 0.06540059, 0.1332696, 1, 0, 0.3843137, 1,
1.488548, -0.4860041, 3.009137, 1, 0, 0.3764706, 1,
1.49267, -0.1802081, 0.3049586, 1, 0, 0.372549, 1,
1.494049, 0.8616794, 0.7284622, 1, 0, 0.3647059, 1,
1.502087, 0.2647869, 0.8930315, 1, 0, 0.3607843, 1,
1.504047, 0.2929932, 3.463286, 1, 0, 0.3529412, 1,
1.522152, 0.8699414, 0.5727156, 1, 0, 0.3490196, 1,
1.535485, -0.1613489, 1.079172, 1, 0, 0.3411765, 1,
1.540136, 1.096738, 0.6170323, 1, 0, 0.3372549, 1,
1.540512, -1.0904, 2.517343, 1, 0, 0.3294118, 1,
1.546759, 0.3122065, 0.1196309, 1, 0, 0.3254902, 1,
1.561436, -0.7425167, 0.9570989, 1, 0, 0.3176471, 1,
1.563923, 0.4184552, 0.5881941, 1, 0, 0.3137255, 1,
1.570335, -1.362694, 3.43497, 1, 0, 0.3058824, 1,
1.582914, -0.192743, 1.702021, 1, 0, 0.2980392, 1,
1.585025, -1.166102, 1.357249, 1, 0, 0.2941177, 1,
1.587601, 0.9347493, 0.9339598, 1, 0, 0.2862745, 1,
1.608778, -0.1287885, 2.243819, 1, 0, 0.282353, 1,
1.614939, -0.2550578, 2.040912, 1, 0, 0.2745098, 1,
1.615051, 0.06371275, 3.58498, 1, 0, 0.2705882, 1,
1.618157, -0.6203436, 1.409615, 1, 0, 0.2627451, 1,
1.618989, 1.325069, -0.642064, 1, 0, 0.2588235, 1,
1.6207, 1.565614, 1.997455, 1, 0, 0.2509804, 1,
1.675508, -0.7077923, 3.178278, 1, 0, 0.2470588, 1,
1.682237, 0.2242602, 0.825681, 1, 0, 0.2392157, 1,
1.684909, 1.190137, 0.6718076, 1, 0, 0.2352941, 1,
1.686242, -1.468952, 3.506284, 1, 0, 0.227451, 1,
1.70223, -1.759826, 3.189727, 1, 0, 0.2235294, 1,
1.708683, -0.3835441, 1.477024, 1, 0, 0.2156863, 1,
1.763438, 1.264744, 2.044618, 1, 0, 0.2117647, 1,
1.780505, -1.44619, 2.780634, 1, 0, 0.2039216, 1,
1.786436, 0.6858967, 3.687395, 1, 0, 0.1960784, 1,
1.816121, -0.05128675, 0.8924046, 1, 0, 0.1921569, 1,
1.820036, 0.5329231, 2.037256, 1, 0, 0.1843137, 1,
1.864272, -0.4919274, 2.103178, 1, 0, 0.1803922, 1,
1.86959, 1.129861, 1.900103, 1, 0, 0.172549, 1,
1.883408, 0.04132022, 1.728118, 1, 0, 0.1686275, 1,
1.889134, 1.139422, 1.567886, 1, 0, 0.1607843, 1,
1.916578, 1.618095, 1.298973, 1, 0, 0.1568628, 1,
1.949566, -0.258446, -0.2326969, 1, 0, 0.1490196, 1,
2.002381, -0.3169009, 2.329597, 1, 0, 0.145098, 1,
2.007107, -1.128832, 1.988636, 1, 0, 0.1372549, 1,
2.007515, 0.2779826, 0.3346479, 1, 0, 0.1333333, 1,
2.023764, -1.472216, 3.047382, 1, 0, 0.1254902, 1,
2.101485, -0.2033984, 2.415902, 1, 0, 0.1215686, 1,
2.119823, 0.9790139, 1.51915, 1, 0, 0.1137255, 1,
2.140496, -0.5214686, 2.095314, 1, 0, 0.1098039, 1,
2.185972, 1.266032, -0.4023083, 1, 0, 0.1019608, 1,
2.191959, -0.4772047, 1.966974, 1, 0, 0.09411765, 1,
2.237669, 0.01251623, 1.257038, 1, 0, 0.09019608, 1,
2.26263, -0.9967491, 1.746106, 1, 0, 0.08235294, 1,
2.281454, -1.825905, 0.7221437, 1, 0, 0.07843138, 1,
2.307771, 0.7347564, 1.777873, 1, 0, 0.07058824, 1,
2.310412, 1.351193, -0.5869758, 1, 0, 0.06666667, 1,
2.370106, 0.1497939, 0.1473408, 1, 0, 0.05882353, 1,
2.43425, -1.074482, 2.410263, 1, 0, 0.05490196, 1,
2.554851, 0.6509982, 1.24045, 1, 0, 0.04705882, 1,
2.635439, 1.0641, 2.77915, 1, 0, 0.04313726, 1,
2.671155, -1.344854, 1.939161, 1, 0, 0.03529412, 1,
2.685618, -0.7584478, 1.732385, 1, 0, 0.03137255, 1,
2.805944, -0.1472268, 3.668038, 1, 0, 0.02352941, 1,
2.818219, -1.410717, 1.827979, 1, 0, 0.01960784, 1,
2.937686, -0.6483518, 1.527354, 1, 0, 0.01176471, 1,
3.182635, 0.4575268, 2.083791, 1, 0, 0.007843138, 1
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
-0.383073, -4.304082, -7.25803, 0, -0.5, 0.5, 0.5,
-0.383073, -4.304082, -7.25803, 1, -0.5, 0.5, 0.5,
-0.383073, -4.304082, -7.25803, 1, 1.5, 0.5, 0.5,
-0.383073, -4.304082, -7.25803, 0, 1.5, 0.5, 0.5
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
-5.157556, -0.3373085, -7.25803, 0, -0.5, 0.5, 0.5,
-5.157556, -0.3373085, -7.25803, 1, -0.5, 0.5, 0.5,
-5.157556, -0.3373085, -7.25803, 1, 1.5, 0.5, 0.5,
-5.157556, -0.3373085, -7.25803, 0, 1.5, 0.5, 0.5
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
-5.157556, -4.304082, 0.3155997, 0, -0.5, 0.5, 0.5,
-5.157556, -4.304082, 0.3155997, 1, -0.5, 0.5, 0.5,
-5.157556, -4.304082, 0.3155997, 1, 1.5, 0.5, 0.5,
-5.157556, -4.304082, 0.3155997, 0, 1.5, 0.5, 0.5
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
-2, -3.388673, -5.51027,
2, -3.388673, -5.51027,
-2, -3.388673, -5.51027,
-2, -3.541241, -5.801563,
0, -3.388673, -5.51027,
0, -3.541241, -5.801563,
2, -3.388673, -5.51027,
2, -3.541241, -5.801563
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
-2, -3.846378, -6.38415, 0, -0.5, 0.5, 0.5,
-2, -3.846378, -6.38415, 1, -0.5, 0.5, 0.5,
-2, -3.846378, -6.38415, 1, 1.5, 0.5, 0.5,
-2, -3.846378, -6.38415, 0, 1.5, 0.5, 0.5,
0, -3.846378, -6.38415, 0, -0.5, 0.5, 0.5,
0, -3.846378, -6.38415, 1, -0.5, 0.5, 0.5,
0, -3.846378, -6.38415, 1, 1.5, 0.5, 0.5,
0, -3.846378, -6.38415, 0, 1.5, 0.5, 0.5,
2, -3.846378, -6.38415, 0, -0.5, 0.5, 0.5,
2, -3.846378, -6.38415, 1, -0.5, 0.5, 0.5,
2, -3.846378, -6.38415, 1, 1.5, 0.5, 0.5,
2, -3.846378, -6.38415, 0, 1.5, 0.5, 0.5
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
-4.055752, -3, -5.51027,
-4.055752, 2, -5.51027,
-4.055752, -3, -5.51027,
-4.239386, -3, -5.801563,
-4.055752, -2, -5.51027,
-4.239386, -2, -5.801563,
-4.055752, -1, -5.51027,
-4.239386, -1, -5.801563,
-4.055752, 0, -5.51027,
-4.239386, 0, -5.801563,
-4.055752, 1, -5.51027,
-4.239386, 1, -5.801563,
-4.055752, 2, -5.51027,
-4.239386, 2, -5.801563
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
-4.606654, -3, -6.38415, 0, -0.5, 0.5, 0.5,
-4.606654, -3, -6.38415, 1, -0.5, 0.5, 0.5,
-4.606654, -3, -6.38415, 1, 1.5, 0.5, 0.5,
-4.606654, -3, -6.38415, 0, 1.5, 0.5, 0.5,
-4.606654, -2, -6.38415, 0, -0.5, 0.5, 0.5,
-4.606654, -2, -6.38415, 1, -0.5, 0.5, 0.5,
-4.606654, -2, -6.38415, 1, 1.5, 0.5, 0.5,
-4.606654, -2, -6.38415, 0, 1.5, 0.5, 0.5,
-4.606654, -1, -6.38415, 0, -0.5, 0.5, 0.5,
-4.606654, -1, -6.38415, 1, -0.5, 0.5, 0.5,
-4.606654, -1, -6.38415, 1, 1.5, 0.5, 0.5,
-4.606654, -1, -6.38415, 0, 1.5, 0.5, 0.5,
-4.606654, 0, -6.38415, 0, -0.5, 0.5, 0.5,
-4.606654, 0, -6.38415, 1, -0.5, 0.5, 0.5,
-4.606654, 0, -6.38415, 1, 1.5, 0.5, 0.5,
-4.606654, 0, -6.38415, 0, 1.5, 0.5, 0.5,
-4.606654, 1, -6.38415, 0, -0.5, 0.5, 0.5,
-4.606654, 1, -6.38415, 1, -0.5, 0.5, 0.5,
-4.606654, 1, -6.38415, 1, 1.5, 0.5, 0.5,
-4.606654, 1, -6.38415, 0, 1.5, 0.5, 0.5,
-4.606654, 2, -6.38415, 0, -0.5, 0.5, 0.5,
-4.606654, 2, -6.38415, 1, -0.5, 0.5, 0.5,
-4.606654, 2, -6.38415, 1, 1.5, 0.5, 0.5,
-4.606654, 2, -6.38415, 0, 1.5, 0.5, 0.5
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
-4.055752, -3.388673, -4,
-4.055752, -3.388673, 4,
-4.055752, -3.388673, -4,
-4.239386, -3.541241, -4,
-4.055752, -3.388673, -2,
-4.239386, -3.541241, -2,
-4.055752, -3.388673, 0,
-4.239386, -3.541241, 0,
-4.055752, -3.388673, 2,
-4.239386, -3.541241, 2,
-4.055752, -3.388673, 4,
-4.239386, -3.541241, 4
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
-4.606654, -3.846378, -4, 0, -0.5, 0.5, 0.5,
-4.606654, -3.846378, -4, 1, -0.5, 0.5, 0.5,
-4.606654, -3.846378, -4, 1, 1.5, 0.5, 0.5,
-4.606654, -3.846378, -4, 0, 1.5, 0.5, 0.5,
-4.606654, -3.846378, -2, 0, -0.5, 0.5, 0.5,
-4.606654, -3.846378, -2, 1, -0.5, 0.5, 0.5,
-4.606654, -3.846378, -2, 1, 1.5, 0.5, 0.5,
-4.606654, -3.846378, -2, 0, 1.5, 0.5, 0.5,
-4.606654, -3.846378, 0, 0, -0.5, 0.5, 0.5,
-4.606654, -3.846378, 0, 1, -0.5, 0.5, 0.5,
-4.606654, -3.846378, 0, 1, 1.5, 0.5, 0.5,
-4.606654, -3.846378, 0, 0, 1.5, 0.5, 0.5,
-4.606654, -3.846378, 2, 0, -0.5, 0.5, 0.5,
-4.606654, -3.846378, 2, 1, -0.5, 0.5, 0.5,
-4.606654, -3.846378, 2, 1, 1.5, 0.5, 0.5,
-4.606654, -3.846378, 2, 0, 1.5, 0.5, 0.5,
-4.606654, -3.846378, 4, 0, -0.5, 0.5, 0.5,
-4.606654, -3.846378, 4, 1, -0.5, 0.5, 0.5,
-4.606654, -3.846378, 4, 1, 1.5, 0.5, 0.5,
-4.606654, -3.846378, 4, 0, 1.5, 0.5, 0.5
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
-4.055752, -3.388673, -5.51027,
-4.055752, 2.714056, -5.51027,
-4.055752, -3.388673, 6.141469,
-4.055752, 2.714056, 6.141469,
-4.055752, -3.388673, -5.51027,
-4.055752, -3.388673, 6.141469,
-4.055752, 2.714056, -5.51027,
-4.055752, 2.714056, 6.141469,
-4.055752, -3.388673, -5.51027,
3.289606, -3.388673, -5.51027,
-4.055752, -3.388673, 6.141469,
3.289606, -3.388673, 6.141469,
-4.055752, 2.714056, -5.51027,
3.289606, 2.714056, -5.51027,
-4.055752, 2.714056, 6.141469,
3.289606, 2.714056, 6.141469,
3.289606, -3.388673, -5.51027,
3.289606, 2.714056, -5.51027,
3.289606, -3.388673, 6.141469,
3.289606, 2.714056, 6.141469,
3.289606, -3.388673, -5.51027,
3.289606, -3.388673, 6.141469,
3.289606, 2.714056, -5.51027,
3.289606, 2.714056, 6.141469
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
var radius = 8.044531;
var distance = 35.79103;
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
mvMatrix.translate( 0.383073, 0.3373085, -0.3155997 );
mvMatrix.scale( 1.184136, 1.425248, 0.7464898 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.79103);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
propaphos<-read.table("propaphos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propaphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'propaphos' not found
```

```r
y<-propaphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'propaphos' not found
```

```r
z<-propaphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'propaphos' not found
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
-3.948781, -1.389423, -3.825806, 0, 0, 1, 1, 1,
-2.937629, -0.5198045, -2.138582, 1, 0, 0, 1, 1,
-2.885315, -1.250683, -1.249615, 1, 0, 0, 1, 1,
-2.794186, -1.350065, -2.097151, 1, 0, 0, 1, 1,
-2.626463, 1.414516, -2.716314, 1, 0, 0, 1, 1,
-2.618695, -0.07526638, -2.693814, 1, 0, 0, 1, 1,
-2.579619, -0.2009694, -1.198172, 0, 0, 0, 1, 1,
-2.562653, -1.002883, -0.4973747, 0, 0, 0, 1, 1,
-2.468271, -0.8883902, -0.2385952, 0, 0, 0, 1, 1,
-2.445559, -0.2152401, -0.8232462, 0, 0, 0, 1, 1,
-2.443608, -0.6164451, -1.067637, 0, 0, 0, 1, 1,
-2.399962, -0.3165957, -2.825678, 0, 0, 0, 1, 1,
-2.337543, -0.117879, -1.328309, 0, 0, 0, 1, 1,
-2.321726, -0.7409557, -2.242316, 1, 1, 1, 1, 1,
-2.200745, -1.7386, -3.498351, 1, 1, 1, 1, 1,
-2.197744, -2.884496, -2.663349, 1, 1, 1, 1, 1,
-2.169359, 1.685405, -0.9903613, 1, 1, 1, 1, 1,
-2.127924, -0.8939914, -3.110152, 1, 1, 1, 1, 1,
-2.106047, 0.2324205, -1.545967, 1, 1, 1, 1, 1,
-2.100258, 2.130322, -1.99713, 1, 1, 1, 1, 1,
-2.099257, 0.159662, -1.820648, 1, 1, 1, 1, 1,
-2.096849, 0.5673306, 0.1063047, 1, 1, 1, 1, 1,
-2.089999, 1.013459, -2.220706, 1, 1, 1, 1, 1,
-2.070941, -0.4510543, -1.189051, 1, 1, 1, 1, 1,
-2.054914, 0.3944802, -0.3134601, 1, 1, 1, 1, 1,
-2.024891, -0.05314704, -1.261928, 1, 1, 1, 1, 1,
-2.012877, -0.9892492, -0.1089219, 1, 1, 1, 1, 1,
-2.001946, -0.7641269, -1.071342, 1, 1, 1, 1, 1,
-1.983548, 1.241822, -1.007141, 0, 0, 1, 1, 1,
-1.976405, -2.631835, -1.078227, 1, 0, 0, 1, 1,
-1.964849, -0.7041247, -0.3970321, 1, 0, 0, 1, 1,
-1.945441, -0.4518276, -2.697532, 1, 0, 0, 1, 1,
-1.937571, -0.1130484, -2.810492, 1, 0, 0, 1, 1,
-1.919066, -0.9777042, -3.401349, 1, 0, 0, 1, 1,
-1.897214, 1.04326, -0.0617798, 0, 0, 0, 1, 1,
-1.870496, 2.130244, -1.810903, 0, 0, 0, 1, 1,
-1.868746, -0.9334187, -3.350696, 0, 0, 0, 1, 1,
-1.856345, -0.4167877, -2.889326, 0, 0, 0, 1, 1,
-1.851479, 0.3335187, -1.254977, 0, 0, 0, 1, 1,
-1.80196, -0.7393458, -1.453251, 0, 0, 0, 1, 1,
-1.787819, -0.8390726, -2.544016, 0, 0, 0, 1, 1,
-1.783846, 0.6598324, -1.919256, 1, 1, 1, 1, 1,
-1.779809, 0.4696757, -0.8588085, 1, 1, 1, 1, 1,
-1.776025, -0.02151898, -1.995904, 1, 1, 1, 1, 1,
-1.773116, -0.05368644, -1.772624, 1, 1, 1, 1, 1,
-1.76911, -0.06090133, -2.579943, 1, 1, 1, 1, 1,
-1.764067, 1.53111, -2.743196, 1, 1, 1, 1, 1,
-1.761232, -1.719595, -3.058591, 1, 1, 1, 1, 1,
-1.751434, 0.9606448, -3.200865, 1, 1, 1, 1, 1,
-1.749099, -1.699211, -1.941482, 1, 1, 1, 1, 1,
-1.746505, -0.1236787, -1.666389, 1, 1, 1, 1, 1,
-1.734252, -1.433763, -0.4950448, 1, 1, 1, 1, 1,
-1.732509, -1.032801, -1.808312, 1, 1, 1, 1, 1,
-1.731884, -0.3717028, -3.692646, 1, 1, 1, 1, 1,
-1.728088, -1.132892, -4.208553, 1, 1, 1, 1, 1,
-1.725771, 1.019542, -1.034332, 1, 1, 1, 1, 1,
-1.719549, -0.743144, -0.7946414, 0, 0, 1, 1, 1,
-1.708339, -0.7051022, -2.690112, 1, 0, 0, 1, 1,
-1.698344, 0.018063, -1.10023, 1, 0, 0, 1, 1,
-1.693581, 0.9218175, -1.539419, 1, 0, 0, 1, 1,
-1.687583, -0.4338578, -2.802661, 1, 0, 0, 1, 1,
-1.683448, 0.01932499, -0.6974093, 1, 0, 0, 1, 1,
-1.680948, 1.124009, -2.447947, 0, 0, 0, 1, 1,
-1.666676, -0.1701664, -2.871261, 0, 0, 0, 1, 1,
-1.657006, 1.953047, -0.7534715, 0, 0, 0, 1, 1,
-1.64062, -1.256203, -3.514387, 0, 0, 0, 1, 1,
-1.639363, -1.048364, -2.352444, 0, 0, 0, 1, 1,
-1.635247, -0.005517843, -1.264679, 0, 0, 0, 1, 1,
-1.606104, -0.8236049, -2.46969, 0, 0, 0, 1, 1,
-1.600427, 0.1809567, -3.082044, 1, 1, 1, 1, 1,
-1.599943, -0.6888537, -2.164347, 1, 1, 1, 1, 1,
-1.586525, -1.711512, -3.220519, 1, 1, 1, 1, 1,
-1.547808, -0.0945229, -1.612367, 1, 1, 1, 1, 1,
-1.545654, 1.501599, -0.4114736, 1, 1, 1, 1, 1,
-1.539245, 1.000912, -2.536494, 1, 1, 1, 1, 1,
-1.532509, 1.121652, 0.5579982, 1, 1, 1, 1, 1,
-1.513705, 0.5930362, -2.127686, 1, 1, 1, 1, 1,
-1.504918, -0.6076764, -1.082655, 1, 1, 1, 1, 1,
-1.492497, 0.548182, -1.015369, 1, 1, 1, 1, 1,
-1.491947, 0.3578568, -0.5830148, 1, 1, 1, 1, 1,
-1.479656, -1.367073, -2.727784, 1, 1, 1, 1, 1,
-1.467295, -1.214944, -1.721652, 1, 1, 1, 1, 1,
-1.457627, 1.278548, -1.266347, 1, 1, 1, 1, 1,
-1.457478, -0.6823797, -1.213117, 1, 1, 1, 1, 1,
-1.448594, 1.537724, -3.267547, 0, 0, 1, 1, 1,
-1.44266, 0.3773614, -0.1585075, 1, 0, 0, 1, 1,
-1.441365, -0.9817132, -1.84518, 1, 0, 0, 1, 1,
-1.424378, -0.425265, -0.2296033, 1, 0, 0, 1, 1,
-1.413491, 0.6671636, -1.089142, 1, 0, 0, 1, 1,
-1.412827, 0.4982298, -0.8986024, 1, 0, 0, 1, 1,
-1.402627, 0.7739351, -1.136112, 0, 0, 0, 1, 1,
-1.387199, -0.1989945, -1.311939, 0, 0, 0, 1, 1,
-1.385042, 0.4053037, -0.7444599, 0, 0, 0, 1, 1,
-1.377716, 0.9465833, -1.744611, 0, 0, 0, 1, 1,
-1.369877, 1.930725, -1.778399, 0, 0, 0, 1, 1,
-1.363291, -1.17771, -4.403539, 0, 0, 0, 1, 1,
-1.356962, -0.2418953, -0.6306009, 0, 0, 0, 1, 1,
-1.346366, 0.8051139, -1.232515, 1, 1, 1, 1, 1,
-1.340983, 0.1674248, -1.774062, 1, 1, 1, 1, 1,
-1.338862, 1.780785, 0.5363522, 1, 1, 1, 1, 1,
-1.338744, 0.496023, -0.6193477, 1, 1, 1, 1, 1,
-1.334671, 2.383942, -0.05374021, 1, 1, 1, 1, 1,
-1.322883, -1.784826, -3.022113, 1, 1, 1, 1, 1,
-1.31988, -0.5787767, -0.08269052, 1, 1, 1, 1, 1,
-1.317828, 1.125635, -2.493442, 1, 1, 1, 1, 1,
-1.316391, -0.8179246, -0.5506837, 1, 1, 1, 1, 1,
-1.311502, 0.7691154, 0.644923, 1, 1, 1, 1, 1,
-1.309721, -0.9447965, -0.950523, 1, 1, 1, 1, 1,
-1.293566, 1.492129, 0.03903424, 1, 1, 1, 1, 1,
-1.269506, 1.71518, 1.549495, 1, 1, 1, 1, 1,
-1.266487, 0.1342253, -1.308758, 1, 1, 1, 1, 1,
-1.253263, -0.3718504, -1.950995, 1, 1, 1, 1, 1,
-1.250955, 0.1919173, -1.380355, 0, 0, 1, 1, 1,
-1.245533, 1.264843, -1.575572, 1, 0, 0, 1, 1,
-1.238189, -0.6586679, -1.774963, 1, 0, 0, 1, 1,
-1.233851, -1.220924, -2.605051, 1, 0, 0, 1, 1,
-1.23341, -1.554645, -2.936246, 1, 0, 0, 1, 1,
-1.232189, 0.06723727, 0.3673654, 1, 0, 0, 1, 1,
-1.231398, 0.006210028, -1.098164, 0, 0, 0, 1, 1,
-1.209795, -1.763001, -2.15111, 0, 0, 0, 1, 1,
-1.207496, 0.3945128, -1.391245, 0, 0, 0, 1, 1,
-1.205488, -0.6308408, -3.758762, 0, 0, 0, 1, 1,
-1.202071, -1.870424, -2.895716, 0, 0, 0, 1, 1,
-1.188703, -0.9091513, -0.9822546, 0, 0, 0, 1, 1,
-1.185844, -0.2890501, -0.8235508, 0, 0, 0, 1, 1,
-1.183205, -0.788711, -2.552841, 1, 1, 1, 1, 1,
-1.180531, -1.619025, -2.654284, 1, 1, 1, 1, 1,
-1.164569, -1.283745, -2.199764, 1, 1, 1, 1, 1,
-1.163139, -0.1060499, -1.326767, 1, 1, 1, 1, 1,
-1.157072, -1.182551, -1.106003, 1, 1, 1, 1, 1,
-1.148414, -0.9885603, -0.1075183, 1, 1, 1, 1, 1,
-1.147301, -0.2596016, -1.995586, 1, 1, 1, 1, 1,
-1.143521, 0.867782, -0.6320394, 1, 1, 1, 1, 1,
-1.139811, -0.4689808, -0.4599319, 1, 1, 1, 1, 1,
-1.13189, 1.115692, 0.3630667, 1, 1, 1, 1, 1,
-1.127285, -0.609568, -1.240497, 1, 1, 1, 1, 1,
-1.127017, -1.027904, -0.4443293, 1, 1, 1, 1, 1,
-1.121475, 0.5100581, -0.9502059, 1, 1, 1, 1, 1,
-1.121454, -0.7980528, -1.512307, 1, 1, 1, 1, 1,
-1.11774, 0.3995747, -0.8334333, 1, 1, 1, 1, 1,
-1.117253, 0.08428049, -1.280911, 0, 0, 1, 1, 1,
-1.105932, -0.4960953, -1.524082, 1, 0, 0, 1, 1,
-1.101798, 1.839761, -1.680019, 1, 0, 0, 1, 1,
-1.098495, -1.008968, -1.440639, 1, 0, 0, 1, 1,
-1.098102, 1.774145, 0.8519182, 1, 0, 0, 1, 1,
-1.096739, -1.128147, -3.505361, 1, 0, 0, 1, 1,
-1.091979, -0.2472565, -1.193413, 0, 0, 0, 1, 1,
-1.075861, -0.2843692, -1.322656, 0, 0, 0, 1, 1,
-1.074892, 1.05353, -0.3631024, 0, 0, 0, 1, 1,
-1.068875, 1.807265, -0.9731408, 0, 0, 0, 1, 1,
-1.06825, 0.4585633, -2.31545, 0, 0, 0, 1, 1,
-1.067749, -1.359646, -3.72381, 0, 0, 0, 1, 1,
-1.065209, -0.05510031, -0.7525126, 0, 0, 0, 1, 1,
-1.059061, -0.4065561, -1.219964, 1, 1, 1, 1, 1,
-1.056417, -0.3896305, -1.714577, 1, 1, 1, 1, 1,
-1.048947, -0.2455771, -2.160571, 1, 1, 1, 1, 1,
-1.047909, 0.5543489, -2.610084, 1, 1, 1, 1, 1,
-1.039011, -0.8221747, -3.043104, 1, 1, 1, 1, 1,
-1.037377, -0.5025778, -2.012614, 1, 1, 1, 1, 1,
-1.03151, -2.191159, -2.740032, 1, 1, 1, 1, 1,
-1.030637, 0.1307761, -3.064669, 1, 1, 1, 1, 1,
-1.022835, 1.290052, 0.4925912, 1, 1, 1, 1, 1,
-1.02077, 1.867378, -0.4694731, 1, 1, 1, 1, 1,
-1.019396, -0.3466006, -1.865638, 1, 1, 1, 1, 1,
-1.018585, 0.3190197, -0.2944999, 1, 1, 1, 1, 1,
-1.014838, -1.132312, -3.68948, 1, 1, 1, 1, 1,
-1.011971, 0.5682977, -0.4678322, 1, 1, 1, 1, 1,
-1.009585, -1.764654, -3.008746, 1, 1, 1, 1, 1,
-0.9951572, 0.2853019, -0.3351774, 0, 0, 1, 1, 1,
-0.9842584, 0.2808861, -0.5590317, 1, 0, 0, 1, 1,
-0.9818931, -0.08750427, -1.944107, 1, 0, 0, 1, 1,
-0.9813659, -2.410772, -2.695387, 1, 0, 0, 1, 1,
-0.9798843, -0.9862531, -2.20661, 1, 0, 0, 1, 1,
-0.9714111, -1.194723, -3.317689, 1, 0, 0, 1, 1,
-0.9686522, -1.85597, -1.832591, 0, 0, 0, 1, 1,
-0.9604871, -0.2200129, -1.353377, 0, 0, 0, 1, 1,
-0.9421479, 1.676379, -0.5897261, 0, 0, 0, 1, 1,
-0.9414239, -0.2888072, -1.074116, 0, 0, 0, 1, 1,
-0.9375235, -1.392152, -2.222897, 0, 0, 0, 1, 1,
-0.9374216, -0.9478815, -3.191754, 0, 0, 0, 1, 1,
-0.9340256, -0.6168373, -2.450792, 0, 0, 0, 1, 1,
-0.9238823, 0.103931, -0.7185354, 1, 1, 1, 1, 1,
-0.9233751, 2.013031, -0.1018741, 1, 1, 1, 1, 1,
-0.9230427, 0.2341483, -3.503913, 1, 1, 1, 1, 1,
-0.9226331, 0.4660441, -0.3304071, 1, 1, 1, 1, 1,
-0.9215069, 0.3001972, -1.262206, 1, 1, 1, 1, 1,
-0.9207368, -0.09706248, -2.14847, 1, 1, 1, 1, 1,
-0.9180897, 0.8414935, -1.755319, 1, 1, 1, 1, 1,
-0.9159781, 0.08706161, -2.69141, 1, 1, 1, 1, 1,
-0.9140543, 1.46894, -1.178901, 1, 1, 1, 1, 1,
-0.9138374, 0.5861304, -1.928265, 1, 1, 1, 1, 1,
-0.9065515, 0.3956357, -2.275484, 1, 1, 1, 1, 1,
-0.9051427, 0.1096812, -1.209124, 1, 1, 1, 1, 1,
-0.9043127, 0.4013539, -0.8162896, 1, 1, 1, 1, 1,
-0.9041593, 0.7832745, -1.22383, 1, 1, 1, 1, 1,
-0.9039608, 1.340752, -1.676651, 1, 1, 1, 1, 1,
-0.9039031, -1.982948, -2.904916, 0, 0, 1, 1, 1,
-0.8975297, -0.8040498, -2.283093, 1, 0, 0, 1, 1,
-0.8965519, 1.98969, 0.2182955, 1, 0, 0, 1, 1,
-0.8930023, 0.1923833, -2.212812, 1, 0, 0, 1, 1,
-0.8849694, 0.1554218, -0.2188553, 1, 0, 0, 1, 1,
-0.8824202, -0.7150701, -0.2240909, 1, 0, 0, 1, 1,
-0.8707822, 2.267635, -2.304018, 0, 0, 0, 1, 1,
-0.8653744, -1.177582, -1.615843, 0, 0, 0, 1, 1,
-0.8650377, -0.4455914, -0.5263233, 0, 0, 0, 1, 1,
-0.8648534, 0.8824115, -0.479228, 0, 0, 0, 1, 1,
-0.8534849, -2.059265, -2.489131, 0, 0, 0, 1, 1,
-0.846772, 1.315159, -2.181156, 0, 0, 0, 1, 1,
-0.842898, 1.496903, 0.6534823, 0, 0, 0, 1, 1,
-0.8371735, 0.3672381, -2.214776, 1, 1, 1, 1, 1,
-0.8354845, 0.2639402, -1.524495, 1, 1, 1, 1, 1,
-0.8232471, -1.886331, -2.088629, 1, 1, 1, 1, 1,
-0.8180056, 1.906226, 0.4718336, 1, 1, 1, 1, 1,
-0.8146982, 0.03123529, -1.577304, 1, 1, 1, 1, 1,
-0.8141981, -0.178377, -0.6005596, 1, 1, 1, 1, 1,
-0.811371, 1.074472, -1.79146, 1, 1, 1, 1, 1,
-0.8105915, 0.2193758, -0.7287924, 1, 1, 1, 1, 1,
-0.8066149, 1.353109, 0.621447, 1, 1, 1, 1, 1,
-0.8057271, -0.6121436, -1.609651, 1, 1, 1, 1, 1,
-0.8003872, 0.2256389, -2.110755, 1, 1, 1, 1, 1,
-0.7909053, 0.6288421, -1.820275, 1, 1, 1, 1, 1,
-0.7908795, 0.8126881, 0.5837685, 1, 1, 1, 1, 1,
-0.7907308, -1.266902, -2.012771, 1, 1, 1, 1, 1,
-0.7852478, -0.2434434, -2.656584, 1, 1, 1, 1, 1,
-0.7772397, -0.925555, -2.401983, 0, 0, 1, 1, 1,
-0.7769018, 0.8898579, 0.6535793, 1, 0, 0, 1, 1,
-0.7746354, 0.1141363, -1.41633, 1, 0, 0, 1, 1,
-0.7723737, -0.7541953, -3.309358, 1, 0, 0, 1, 1,
-0.7721829, 0.3184021, -1.800907, 1, 0, 0, 1, 1,
-0.7715872, 0.8943951, 2.058278, 1, 0, 0, 1, 1,
-0.7694691, 1.502269, -0.07257782, 0, 0, 0, 1, 1,
-0.7641715, -1.628346, -1.945198, 0, 0, 0, 1, 1,
-0.76058, -0.9632767, -3.374267, 0, 0, 0, 1, 1,
-0.7566506, 1.264711, -0.1493088, 0, 0, 0, 1, 1,
-0.7563386, 0.6679662, -1.130917, 0, 0, 0, 1, 1,
-0.7509784, -0.2818736, -3.049889, 0, 0, 0, 1, 1,
-0.7486628, 0.2378079, 0.1758501, 0, 0, 0, 1, 1,
-0.7468658, -1.0152, -3.876652, 1, 1, 1, 1, 1,
-0.7461015, 0.567752, -0.5100305, 1, 1, 1, 1, 1,
-0.7437447, -0.01369413, -1.92242, 1, 1, 1, 1, 1,
-0.7395434, 0.08375606, -1.223903, 1, 1, 1, 1, 1,
-0.7367843, 0.05625061, -2.355396, 1, 1, 1, 1, 1,
-0.7346372, 0.3079056, -1.710985, 1, 1, 1, 1, 1,
-0.7288903, -0.547217, -1.646578, 1, 1, 1, 1, 1,
-0.7258862, 1.691059, -1.08681, 1, 1, 1, 1, 1,
-0.7122792, 1.227657, 0.5075291, 1, 1, 1, 1, 1,
-0.7100189, -0.09425957, -3.318202, 1, 1, 1, 1, 1,
-0.7078812, -1.487493, -4.386611, 1, 1, 1, 1, 1,
-0.7064369, -0.6610312, -1.427323, 1, 1, 1, 1, 1,
-0.7055668, -1.048836, -3.168879, 1, 1, 1, 1, 1,
-0.7019816, 0.7512072, -0.3580455, 1, 1, 1, 1, 1,
-0.6959308, 1.151824, -2.626194, 1, 1, 1, 1, 1,
-0.692854, 1.254387, -2.059555, 0, 0, 1, 1, 1,
-0.6917378, -0.704805, -2.62216, 1, 0, 0, 1, 1,
-0.6807631, 1.622221, -2.046256, 1, 0, 0, 1, 1,
-0.6804459, 0.9700304, 0.4368497, 1, 0, 0, 1, 1,
-0.6799987, -1.003135, -0.9161005, 1, 0, 0, 1, 1,
-0.6794379, 1.283736, 0.178708, 1, 0, 0, 1, 1,
-0.6757507, 0.4861078, -0.4165688, 0, 0, 0, 1, 1,
-0.6728095, 0.06815464, -0.788799, 0, 0, 0, 1, 1,
-0.6721476, 0.8812199, 0.06309359, 0, 0, 0, 1, 1,
-0.6676852, -1.941219, -2.626842, 0, 0, 0, 1, 1,
-0.6639625, 1.228462, -0.4882092, 0, 0, 0, 1, 1,
-0.662785, 0.3653629, 0.2612028, 0, 0, 0, 1, 1,
-0.66223, 1.950733, -0.6689393, 0, 0, 0, 1, 1,
-0.6598521, 0.1516212, -1.321476, 1, 1, 1, 1, 1,
-0.6596544, -1.735238, -2.153656, 1, 1, 1, 1, 1,
-0.6571869, -0.1523106, -1.771705, 1, 1, 1, 1, 1,
-0.6495478, 0.05161578, -2.814195, 1, 1, 1, 1, 1,
-0.6436602, -1.044333, -2.224957, 1, 1, 1, 1, 1,
-0.6371703, 1.415186, -0.6682703, 1, 1, 1, 1, 1,
-0.6326057, -0.8073854, -0.1348187, 1, 1, 1, 1, 1,
-0.632013, -0.6094287, -1.38058, 1, 1, 1, 1, 1,
-0.6252836, 0.06899557, -1.178329, 1, 1, 1, 1, 1,
-0.625069, 0.3742246, -0.826988, 1, 1, 1, 1, 1,
-0.6206908, 1.490412, 0.4210932, 1, 1, 1, 1, 1,
-0.6206008, -0.2808744, -2.50734, 1, 1, 1, 1, 1,
-0.617618, -0.2210217, -1.434518, 1, 1, 1, 1, 1,
-0.6146465, 0.5410944, -1.895432, 1, 1, 1, 1, 1,
-0.6097964, -0.349582, -1.416196, 1, 1, 1, 1, 1,
-0.6082342, -0.1230394, -2.304883, 0, 0, 1, 1, 1,
-0.5997299, -0.2087058, -0.69568, 1, 0, 0, 1, 1,
-0.599286, -1.558756, -3.433077, 1, 0, 0, 1, 1,
-0.5989437, -1.546337, -3.057927, 1, 0, 0, 1, 1,
-0.5974861, 0.4314852, -1.920986, 1, 0, 0, 1, 1,
-0.5960202, 0.6537725, -0.2194206, 1, 0, 0, 1, 1,
-0.5959311, -0.5192789, -0.9263676, 0, 0, 0, 1, 1,
-0.5933971, -0.1631332, -4.054232, 0, 0, 0, 1, 1,
-0.5867178, -0.7170799, -2.065078, 0, 0, 0, 1, 1,
-0.5858729, 0.6751533, -0.9001265, 0, 0, 0, 1, 1,
-0.5839269, 0.9693732, -0.01821433, 0, 0, 0, 1, 1,
-0.5809507, -0.4759273, -3.519108, 0, 0, 0, 1, 1,
-0.5784254, -0.8432601, -3.767061, 0, 0, 0, 1, 1,
-0.5766541, -1.401685, -2.818751, 1, 1, 1, 1, 1,
-0.5757727, -0.2019483, -1.701503, 1, 1, 1, 1, 1,
-0.5731995, -0.9049873, -2.419583, 1, 1, 1, 1, 1,
-0.5730419, 2.462988, -0.6204406, 1, 1, 1, 1, 1,
-0.5730357, 0.6020784, -1.232105, 1, 1, 1, 1, 1,
-0.5712152, 0.2856074, -2.114944, 1, 1, 1, 1, 1,
-0.5676035, -0.05364548, -0.4545378, 1, 1, 1, 1, 1,
-0.5652357, 0.9440555, 0.04773019, 1, 1, 1, 1, 1,
-0.5623158, 1.371544, 0.4885117, 1, 1, 1, 1, 1,
-0.5568401, -1.053855, -3.74646, 1, 1, 1, 1, 1,
-0.5561245, 0.08608934, -0.4941202, 1, 1, 1, 1, 1,
-0.552395, 2.114764, -0.03550054, 1, 1, 1, 1, 1,
-0.5511556, 1.961255, 0.2707923, 1, 1, 1, 1, 1,
-0.5491353, 0.3374777, -1.450543, 1, 1, 1, 1, 1,
-0.5476011, 0.2760133, -1.001356, 1, 1, 1, 1, 1,
-0.5463142, -0.7707008, -2.890433, 0, 0, 1, 1, 1,
-0.5419151, -0.8699917, -3.370546, 1, 0, 0, 1, 1,
-0.5395515, -1.982443, -2.564056, 1, 0, 0, 1, 1,
-0.534718, -1.069368, -1.506308, 1, 0, 0, 1, 1,
-0.5314741, -0.8546982, -3.209503, 1, 0, 0, 1, 1,
-0.528267, 0.624935, -0.9683096, 1, 0, 0, 1, 1,
-0.5256109, -0.1591638, -2.638232, 0, 0, 0, 1, 1,
-0.5226782, -0.4283158, -1.378766, 0, 0, 0, 1, 1,
-0.522244, 0.12904, 0.08430285, 0, 0, 0, 1, 1,
-0.5217446, 0.8960219, -0.1423565, 0, 0, 0, 1, 1,
-0.5162778, 0.8669596, -1.586029, 0, 0, 0, 1, 1,
-0.5152088, 0.4093082, -0.3922981, 0, 0, 0, 1, 1,
-0.5062965, -1.003184, -3.516343, 0, 0, 0, 1, 1,
-0.4989035, -0.8262595, -3.183522, 1, 1, 1, 1, 1,
-0.4981802, -0.8665809, -1.791521, 1, 1, 1, 1, 1,
-0.4975337, -1.024194, -2.832617, 1, 1, 1, 1, 1,
-0.4965068, -0.225476, -2.742911, 1, 1, 1, 1, 1,
-0.493309, 0.115889, -1.285821, 1, 1, 1, 1, 1,
-0.4896364, 0.6795776, -0.584631, 1, 1, 1, 1, 1,
-0.4809508, 1.325642, -1.457678, 1, 1, 1, 1, 1,
-0.4792474, 0.1462518, -2.847663, 1, 1, 1, 1, 1,
-0.4722869, 0.6456854, -0.6443604, 1, 1, 1, 1, 1,
-0.469933, -1.202654, -2.759751, 1, 1, 1, 1, 1,
-0.4657616, -0.2689199, -3.268559, 1, 1, 1, 1, 1,
-0.4654249, 0.4331465, -2.312408, 1, 1, 1, 1, 1,
-0.4500337, -0.3870953, -0.2647025, 1, 1, 1, 1, 1,
-0.4494249, -0.9113985, -2.13757, 1, 1, 1, 1, 1,
-0.4478732, -0.3577085, -0.9176787, 1, 1, 1, 1, 1,
-0.4436304, 0.05692295, -2.326042, 0, 0, 1, 1, 1,
-0.442948, 0.4685279, -1.308969, 1, 0, 0, 1, 1,
-0.4363567, 1.211023, -0.6474022, 1, 0, 0, 1, 1,
-0.4331672, 0.9964927, -0.03169644, 1, 0, 0, 1, 1,
-0.4308392, 1.43577, -0.3421801, 1, 0, 0, 1, 1,
-0.4288417, 1.274147, -1.993746, 1, 0, 0, 1, 1,
-0.4287027, 2.14369, 0.2287502, 0, 0, 0, 1, 1,
-0.4261342, 0.70932, -0.3852507, 0, 0, 0, 1, 1,
-0.4244557, 0.589166, -2.549849, 0, 0, 0, 1, 1,
-0.4243206, -0.3530851, -2.58751, 0, 0, 0, 1, 1,
-0.4240631, 0.009126636, -2.255517, 0, 0, 0, 1, 1,
-0.4239545, -0.4540138, -0.9531817, 0, 0, 0, 1, 1,
-0.4232139, -0.5006557, -1.724765, 0, 0, 0, 1, 1,
-0.4182554, 0.9935454, 0.4545038, 1, 1, 1, 1, 1,
-0.4170188, -0.9201024, -3.618001, 1, 1, 1, 1, 1,
-0.4166544, -0.5307183, -2.048939, 1, 1, 1, 1, 1,
-0.4126406, -0.05278618, -1.542236, 1, 1, 1, 1, 1,
-0.4119315, -0.1437196, -3.166858, 1, 1, 1, 1, 1,
-0.4110269, -0.7825574, -1.135272, 1, 1, 1, 1, 1,
-0.4102017, -0.4736618, -3.592451, 1, 1, 1, 1, 1,
-0.4081741, 0.1003935, -0.3053403, 1, 1, 1, 1, 1,
-0.4080911, 0.6546621, -0.1363043, 1, 1, 1, 1, 1,
-0.4075776, -0.7765651, -4.185598, 1, 1, 1, 1, 1,
-0.4059254, 0.3589377, -1.607216, 1, 1, 1, 1, 1,
-0.4008514, -0.8592483, -2.586023, 1, 1, 1, 1, 1,
-0.3989816, -0.6155381, -3.288619, 1, 1, 1, 1, 1,
-0.3965492, 0.01007215, -1.359111, 1, 1, 1, 1, 1,
-0.3927088, 0.3313411, -0.9524463, 1, 1, 1, 1, 1,
-0.3876365, -1.349498, -2.931667, 0, 0, 1, 1, 1,
-0.3866614, -0.007283513, -1.26079, 1, 0, 0, 1, 1,
-0.3843315, 1.667904, 0.4386353, 1, 0, 0, 1, 1,
-0.3841291, 0.6319718, -2.012526, 1, 0, 0, 1, 1,
-0.3830115, -0.07904437, -3.614541, 1, 0, 0, 1, 1,
-0.3809177, 0.2382054, -0.2725973, 1, 0, 0, 1, 1,
-0.3732873, -0.4622456, -2.387421, 0, 0, 0, 1, 1,
-0.3698636, -1.135471, -1.353123, 0, 0, 0, 1, 1,
-0.3697691, -0.5890851, -1.102485, 0, 0, 0, 1, 1,
-0.3664016, 0.2811575, -0.4263558, 0, 0, 0, 1, 1,
-0.3640132, -1.607024, -3.030725, 0, 0, 0, 1, 1,
-0.3637399, -1.273782, -2.986866, 0, 0, 0, 1, 1,
-0.3541714, 0.2213882, -0.01988964, 0, 0, 0, 1, 1,
-0.3517883, -0.5104956, -2.431781, 1, 1, 1, 1, 1,
-0.3489943, -0.1906788, -1.240402, 1, 1, 1, 1, 1,
-0.3439392, 0.2650789, -1.064657, 1, 1, 1, 1, 1,
-0.3435134, 0.3445495, -1.396997, 1, 1, 1, 1, 1,
-0.3426259, -1.467926, -1.624902, 1, 1, 1, 1, 1,
-0.3421151, 0.547029, -0.8414065, 1, 1, 1, 1, 1,
-0.3415489, -0.1623668, -1.692428, 1, 1, 1, 1, 1,
-0.3407891, -0.474735, -1.617051, 1, 1, 1, 1, 1,
-0.338513, -1.723327, -2.883495, 1, 1, 1, 1, 1,
-0.3380435, -0.1013059, -1.72459, 1, 1, 1, 1, 1,
-0.334324, 0.5363826, 1.25609, 1, 1, 1, 1, 1,
-0.334068, -0.07752296, -1.902774, 1, 1, 1, 1, 1,
-0.332945, 0.4559931, 0.9590908, 1, 1, 1, 1, 1,
-0.3262084, -0.405244, -0.3351941, 1, 1, 1, 1, 1,
-0.3237436, -0.1587171, -1.48201, 1, 1, 1, 1, 1,
-0.3197452, -2.310777, -4.223279, 0, 0, 1, 1, 1,
-0.3193081, -0.5526812, -3.206347, 1, 0, 0, 1, 1,
-0.3113394, -0.4089724, -2.537441, 1, 0, 0, 1, 1,
-0.3083678, 0.2663808, -0.7562807, 1, 0, 0, 1, 1,
-0.3068905, -1.521469, -3.092079, 1, 0, 0, 1, 1,
-0.3052678, -0.02070904, -0.1035318, 1, 0, 0, 1, 1,
-0.304646, -0.9120567, -0.8486001, 0, 0, 0, 1, 1,
-0.3039754, 0.7842512, -0.1838148, 0, 0, 0, 1, 1,
-0.3015341, -0.2215754, -1.231232, 0, 0, 0, 1, 1,
-0.3000164, 1.609864, -0.2328637, 0, 0, 0, 1, 1,
-0.2980419, 0.3539277, -1.110505, 0, 0, 0, 1, 1,
-0.2958733, -0.5758229, -3.460844, 0, 0, 0, 1, 1,
-0.2953036, -0.03214826, -1.54925, 0, 0, 0, 1, 1,
-0.294399, 0.2624884, -0.4157395, 1, 1, 1, 1, 1,
-0.2920891, 0.6670147, 0.7397186, 1, 1, 1, 1, 1,
-0.2914388, 1.563444, 1.203378, 1, 1, 1, 1, 1,
-0.2874652, 1.2584, -0.2748471, 1, 1, 1, 1, 1,
-0.2824596, -1.265843, -2.568041, 1, 1, 1, 1, 1,
-0.2802928, -0.8417713, -2.75859, 1, 1, 1, 1, 1,
-0.2750756, 1.714312, 1.172768, 1, 1, 1, 1, 1,
-0.2698352, -1.328613, -0.176281, 1, 1, 1, 1, 1,
-0.2666209, -0.7379203, -2.340644, 1, 1, 1, 1, 1,
-0.2632116, -0.4503808, -3.378097, 1, 1, 1, 1, 1,
-0.2625915, 0.209182, -1.115945, 1, 1, 1, 1, 1,
-0.2622687, 1.177292, -2.043504, 1, 1, 1, 1, 1,
-0.2599467, 2.447624, 0.5798534, 1, 1, 1, 1, 1,
-0.2598211, -0.6800286, -4.586042, 1, 1, 1, 1, 1,
-0.2591248, -0.5209965, -2.380775, 1, 1, 1, 1, 1,
-0.2533021, 1.386903, -0.3722036, 0, 0, 1, 1, 1,
-0.2506181, 0.4468356, 0.1564047, 1, 0, 0, 1, 1,
-0.2474639, -0.4960512, -3.600982, 1, 0, 0, 1, 1,
-0.2442726, -0.5421113, -3.286743, 1, 0, 0, 1, 1,
-0.2439525, 0.142888, -2.249711, 1, 0, 0, 1, 1,
-0.2432396, 0.09223965, -1.460175, 1, 0, 0, 1, 1,
-0.2420137, -1.549446, -3.245036, 0, 0, 0, 1, 1,
-0.2331985, -0.4429826, -1.31094, 0, 0, 0, 1, 1,
-0.2325735, -1.15397, -2.782666, 0, 0, 0, 1, 1,
-0.2323287, -0.5767361, -4.16737, 0, 0, 0, 1, 1,
-0.2308296, -0.9623152, -3.069222, 0, 0, 0, 1, 1,
-0.230063, 1.46475, -1.014627, 0, 0, 0, 1, 1,
-0.2285696, -0.008071907, -1.955425, 0, 0, 0, 1, 1,
-0.227449, -0.2523641, -3.127559, 1, 1, 1, 1, 1,
-0.2227876, 0.2772592, -0.2497469, 1, 1, 1, 1, 1,
-0.222541, 2.122274, 1.00369, 1, 1, 1, 1, 1,
-0.2222818, 0.4201498, -0.5883923, 1, 1, 1, 1, 1,
-0.2212736, 0.1555266, -1.352002, 1, 1, 1, 1, 1,
-0.2179172, 0.7087292, 1.090294, 1, 1, 1, 1, 1,
-0.2120322, -0.4791456, -4.756144, 1, 1, 1, 1, 1,
-0.2093617, 0.9589866, -1.147026, 1, 1, 1, 1, 1,
-0.2083686, 0.7490557, 0.8732729, 1, 1, 1, 1, 1,
-0.2081263, -0.4772163, -4.166574, 1, 1, 1, 1, 1,
-0.2066106, -0.1561797, -2.79232, 1, 1, 1, 1, 1,
-0.2052254, 0.9936901, -0.2729325, 1, 1, 1, 1, 1,
-0.203728, 0.5809454, 0.4570894, 1, 1, 1, 1, 1,
-0.2025698, 0.4801192, 0.3377409, 1, 1, 1, 1, 1,
-0.2022195, 0.692107, -1.693496, 1, 1, 1, 1, 1,
-0.2003281, -1.488913, -4.534919, 0, 0, 1, 1, 1,
-0.195014, -1.335532, -2.65565, 1, 0, 0, 1, 1,
-0.1930202, 0.9797631, -0.6036091, 1, 0, 0, 1, 1,
-0.1905458, 0.1806853, -0.822468, 1, 0, 0, 1, 1,
-0.1886861, -0.9099351, -3.93793, 1, 0, 0, 1, 1,
-0.1814588, 0.8858751, -1.530075, 1, 0, 0, 1, 1,
-0.1757004, 2.081291, -1.116819, 0, 0, 0, 1, 1,
-0.1722645, -0.2266187, -2.491347, 0, 0, 0, 1, 1,
-0.1708474, -0.8200199, -0.8212632, 0, 0, 0, 1, 1,
-0.1684616, -0.9028888, -3.098659, 0, 0, 0, 1, 1,
-0.162103, -0.4959789, -4.040421, 0, 0, 0, 1, 1,
-0.1611878, 0.2837054, -0.1937492, 0, 0, 0, 1, 1,
-0.1589003, 1.38776, 1.133417, 0, 0, 0, 1, 1,
-0.1588515, -0.8320212, -2.997073, 1, 1, 1, 1, 1,
-0.1577105, 0.6494149, 1.04238, 1, 1, 1, 1, 1,
-0.1561465, -0.7459717, -2.953548, 1, 1, 1, 1, 1,
-0.1539993, 0.4243704, 0.05462713, 1, 1, 1, 1, 1,
-0.1518195, -0.6420205, -2.508192, 1, 1, 1, 1, 1,
-0.1457973, 0.4644051, 0.3355989, 1, 1, 1, 1, 1,
-0.1428939, 0.7526657, 1.033428, 1, 1, 1, 1, 1,
-0.1427621, -0.916956, -2.89685, 1, 1, 1, 1, 1,
-0.1400076, 0.3344801, 1.969153, 1, 1, 1, 1, 1,
-0.137519, 0.3071483, 0.3417205, 1, 1, 1, 1, 1,
-0.1355569, 1.580711, -0.02167204, 1, 1, 1, 1, 1,
-0.1309214, 0.7940618, 2.644698, 1, 1, 1, 1, 1,
-0.1304212, 1.073192, -0.7171598, 1, 1, 1, 1, 1,
-0.1283992, 0.3460395, -0.9002573, 1, 1, 1, 1, 1,
-0.124833, 0.5005228, -0.8488252, 1, 1, 1, 1, 1,
-0.1217672, -0.7684051, -2.353208, 0, 0, 1, 1, 1,
-0.1197155, 1.475568, 2.442532, 1, 0, 0, 1, 1,
-0.1188348, -2.137412, -3.632886, 1, 0, 0, 1, 1,
-0.1180265, 0.4383058, 0.18887, 1, 0, 0, 1, 1,
-0.117423, 1.223719, -0.1278349, 1, 0, 0, 1, 1,
-0.116198, -1.451168, -2.71902, 1, 0, 0, 1, 1,
-0.1152897, 1.076926, -0.4233669, 0, 0, 0, 1, 1,
-0.1119373, -0.9632947, -4.334476, 0, 0, 0, 1, 1,
-0.1115536, -0.5971735, -3.121343, 0, 0, 0, 1, 1,
-0.1077057, -0.1790551, -5.340584, 0, 0, 0, 1, 1,
-0.1069555, -1.275465, -3.407883, 0, 0, 0, 1, 1,
-0.1057497, 1.063799, 0.3665253, 0, 0, 0, 1, 1,
-0.101413, -2.183392, -3.226367, 0, 0, 0, 1, 1,
-0.1011022, 0.8413641, 0.9533302, 1, 1, 1, 1, 1,
-0.1004764, 0.63183, 0.24188, 1, 1, 1, 1, 1,
-0.09976362, 0.7433193, 2.83931, 1, 1, 1, 1, 1,
-0.09766477, 0.7157276, -0.1425688, 1, 1, 1, 1, 1,
-0.09682434, 1.00577, 0.1622985, 1, 1, 1, 1, 1,
-0.09665304, 0.5835376, -0.151099, 1, 1, 1, 1, 1,
-0.09597161, -0.77571, -4.684526, 1, 1, 1, 1, 1,
-0.0953752, 1.024405, -1.484133, 1, 1, 1, 1, 1,
-0.09102709, -1.057877, -2.200732, 1, 1, 1, 1, 1,
-0.07737029, -0.1509614, -2.636779, 1, 1, 1, 1, 1,
-0.07365607, -0.1000736, -0.7965894, 1, 1, 1, 1, 1,
-0.07226691, -0.1102126, -3.433629, 1, 1, 1, 1, 1,
-0.07030603, -0.3448534, -2.194485, 1, 1, 1, 1, 1,
-0.06185523, 1.290806, 0.5564138, 1, 1, 1, 1, 1,
-0.05791648, 1.345039, 0.3271025, 1, 1, 1, 1, 1,
-0.05391523, 0.1571062, -0.07668841, 0, 0, 1, 1, 1,
-0.04932135, -1.342668, -4.138922, 1, 0, 0, 1, 1,
-0.04541732, -0.2480462, -2.880039, 1, 0, 0, 1, 1,
-0.03033102, 0.4641018, -0.6997286, 1, 0, 0, 1, 1,
-0.0300808, 0.606538, -1.200835, 1, 0, 0, 1, 1,
-0.02771819, -1.221325, -2.981232, 1, 0, 0, 1, 1,
-0.02666581, -0.5890397, -2.522982, 0, 0, 0, 1, 1,
-0.01946008, -0.116749, -5.034757, 0, 0, 0, 1, 1,
-0.01845269, -0.397701, -3.933041, 0, 0, 0, 1, 1,
-0.01697144, 0.2742343, -1.196149, 0, 0, 0, 1, 1,
-0.01387292, 0.6221945, 1.026225, 0, 0, 0, 1, 1,
-0.01201991, -0.9698724, -1.477991, 0, 0, 0, 1, 1,
-0.01118162, 1.468026, -0.5565773, 0, 0, 0, 1, 1,
-0.01064452, 0.1451954, -0.1023257, 1, 1, 1, 1, 1,
-0.01027448, -1.286365, -1.637405, 1, 1, 1, 1, 1,
-0.01014295, 0.3569513, -1.333752, 1, 1, 1, 1, 1,
-0.01002854, 0.7010267, -0.3947409, 1, 1, 1, 1, 1,
-0.009412182, -0.1999369, -2.145005, 1, 1, 1, 1, 1,
-0.009132404, -0.2400953, -1.752684, 1, 1, 1, 1, 1,
-0.008198214, 0.7690561, 0.7142254, 1, 1, 1, 1, 1,
-0.005487038, -1.27838, -2.90948, 1, 1, 1, 1, 1,
-0.004797647, -0.263114, -3.351137, 1, 1, 1, 1, 1,
-0.002158484, -0.424527, -3.061698, 1, 1, 1, 1, 1,
-0.001757744, -0.1268276, -2.700763, 1, 1, 1, 1, 1,
-0.0008981896, -0.96075, -1.649816, 1, 1, 1, 1, 1,
-8.417799e-05, 0.7088813, -1.412555, 1, 1, 1, 1, 1,
0.002150332, -0.8891454, 3.333369, 1, 1, 1, 1, 1,
0.006611741, 0.4203117, -0.9167784, 1, 1, 1, 1, 1,
0.007819788, -0.07145001, 1.497194, 0, 0, 1, 1, 1,
0.01220209, 0.221066, -0.2886989, 1, 0, 0, 1, 1,
0.01484039, -2.165719, 3.029247, 1, 0, 0, 1, 1,
0.01727086, -2.379088, 2.787137, 1, 0, 0, 1, 1,
0.01853581, 0.7870578, 0.1037577, 1, 0, 0, 1, 1,
0.01924817, -0.1931771, 2.586731, 1, 0, 0, 1, 1,
0.01993149, -0.1425806, 2.046857, 0, 0, 0, 1, 1,
0.02121134, 0.1067557, 0.9508761, 0, 0, 0, 1, 1,
0.02254586, 0.3599487, 1.405813, 0, 0, 0, 1, 1,
0.02845965, -2.2245, 2.522641, 0, 0, 0, 1, 1,
0.03173208, -1.354897, 3.604332, 0, 0, 0, 1, 1,
0.03218033, -0.7930794, 2.329866, 0, 0, 0, 1, 1,
0.03273391, -1.601158, 4.964974, 0, 0, 0, 1, 1,
0.03954661, -0.8526349, 4.410765, 1, 1, 1, 1, 1,
0.0414163, -0.4513132, 3.907131, 1, 1, 1, 1, 1,
0.04179047, -1.059799, 4.001536, 1, 1, 1, 1, 1,
0.0450442, 1.374208, 0.1409288, 1, 1, 1, 1, 1,
0.04614848, -0.6863229, 1.561478, 1, 1, 1, 1, 1,
0.04794841, 0.553519, -0.6275591, 1, 1, 1, 1, 1,
0.04902178, -0.4100232, 1.938774, 1, 1, 1, 1, 1,
0.05312034, 0.9378871, 1.057059, 1, 1, 1, 1, 1,
0.05723389, 0.1546782, 0.4081602, 1, 1, 1, 1, 1,
0.06244607, 0.3359405, 0.3724557, 1, 1, 1, 1, 1,
0.06366218, -1.297655, 1.637107, 1, 1, 1, 1, 1,
0.06577779, 1.173205, -0.1587092, 1, 1, 1, 1, 1,
0.06876238, -0.4944691, 3.019083, 1, 1, 1, 1, 1,
0.07974173, -0.4313674, 2.8795, 1, 1, 1, 1, 1,
0.08411674, 0.7726574, -0.3741825, 1, 1, 1, 1, 1,
0.08442303, 0.09443903, 1.037874, 0, 0, 1, 1, 1,
0.08482486, 0.2712019, 0.5191537, 1, 0, 0, 1, 1,
0.08664865, -0.1963977, 2.191279, 1, 0, 0, 1, 1,
0.08694829, -0.8185066, 2.480838, 1, 0, 0, 1, 1,
0.0880358, -0.1931542, 3.087829, 1, 0, 0, 1, 1,
0.08905327, -1.473831, 2.938914, 1, 0, 0, 1, 1,
0.08987854, -0.2067594, 3.570647, 0, 0, 0, 1, 1,
0.09127314, 0.1097437, -0.5239862, 0, 0, 0, 1, 1,
0.09495463, 0.1487643, 0.4495541, 0, 0, 0, 1, 1,
0.09719796, 1.211321, 1.216225, 0, 0, 0, 1, 1,
0.09824902, -1.142656, 2.619597, 0, 0, 0, 1, 1,
0.09862558, 0.7355481, -0.5844032, 0, 0, 0, 1, 1,
0.101665, -0.07811949, 2.625608, 0, 0, 0, 1, 1,
0.1039686, -0.2440977, 1.680687, 1, 1, 1, 1, 1,
0.10681, -0.2155727, 1.160301, 1, 1, 1, 1, 1,
0.1071239, 0.1133199, -0.2814417, 1, 1, 1, 1, 1,
0.1108733, -0.3083628, 2.693329, 1, 1, 1, 1, 1,
0.1118082, 0.2304319, 0.1899685, 1, 1, 1, 1, 1,
0.1134711, 0.9395969, 0.9781885, 1, 1, 1, 1, 1,
0.1147134, 1.637301, -0.7989439, 1, 1, 1, 1, 1,
0.1152288, -0.7282655, 3.214149, 1, 1, 1, 1, 1,
0.1175864, 0.3615374, 0.9807122, 1, 1, 1, 1, 1,
0.118352, 0.8365627, -0.303161, 1, 1, 1, 1, 1,
0.1232466, 0.0809797, 1.362748, 1, 1, 1, 1, 1,
0.1240796, -0.03383753, 3.132859, 1, 1, 1, 1, 1,
0.1250909, 0.7201995, 0.8805731, 1, 1, 1, 1, 1,
0.1268191, -0.9388483, 3.984217, 1, 1, 1, 1, 1,
0.1285276, 1.607302, 0.6044636, 1, 1, 1, 1, 1,
0.13139, -0.8074583, 2.185336, 0, 0, 1, 1, 1,
0.134169, -1.022507, 3.979863, 1, 0, 0, 1, 1,
0.1345055, -0.1716071, 3.951861, 1, 0, 0, 1, 1,
0.1345249, -0.5985976, 3.093227, 1, 0, 0, 1, 1,
0.1354886, 0.1429184, 1.871357, 1, 0, 0, 1, 1,
0.1429853, -0.9546925, 3.255007, 1, 0, 0, 1, 1,
0.14711, -0.06665247, 0.06426531, 0, 0, 0, 1, 1,
0.1494021, 0.00289878, 1.710662, 0, 0, 0, 1, 1,
0.149562, -0.6376843, 1.675342, 0, 0, 0, 1, 1,
0.1548862, 1.036388, -0.6963496, 0, 0, 0, 1, 1,
0.1610683, 1.253372, 0.7820153, 0, 0, 0, 1, 1,
0.1648295, 0.2604054, 0.5640857, 0, 0, 0, 1, 1,
0.1648904, 1.538244, -0.2022923, 0, 0, 0, 1, 1,
0.1649329, -1.11128, 2.157721, 1, 1, 1, 1, 1,
0.1710393, -1.473133, 2.223336, 1, 1, 1, 1, 1,
0.1743009, -1.256267, 2.879493, 1, 1, 1, 1, 1,
0.181674, 0.525017, 0.9677621, 1, 1, 1, 1, 1,
0.1887505, 1.336944, 0.9620423, 1, 1, 1, 1, 1,
0.1925007, -0.6091931, 3.355162, 1, 1, 1, 1, 1,
0.1925104, 0.5978395, -1.040292, 1, 1, 1, 1, 1,
0.1933191, -0.7634982, 2.610975, 1, 1, 1, 1, 1,
0.1940733, 0.3793849, 0.6681231, 1, 1, 1, 1, 1,
0.1948928, -0.07494459, 0.2887751, 1, 1, 1, 1, 1,
0.1956211, -0.6916728, 3.243589, 1, 1, 1, 1, 1,
0.1956366, 0.1527955, 1.677052, 1, 1, 1, 1, 1,
0.1967796, 1.193246, -0.3339912, 1, 1, 1, 1, 1,
0.2006116, 1.571436, 0.2664218, 1, 1, 1, 1, 1,
0.20123, 0.5498608, -0.3388129, 1, 1, 1, 1, 1,
0.2141775, -1.89773, 1.974297, 0, 0, 1, 1, 1,
0.2188137, -2.24338, 2.572673, 1, 0, 0, 1, 1,
0.2223199, 0.04971427, 2.447318, 1, 0, 0, 1, 1,
0.2231707, -0.5251223, 4.018586, 1, 0, 0, 1, 1,
0.2249872, 0.4317787, 0.1292867, 1, 0, 0, 1, 1,
0.2277351, -0.1925322, 2.27953, 1, 0, 0, 1, 1,
0.2308559, 1.079478, 0.6961272, 0, 0, 0, 1, 1,
0.2328424, -0.1772224, 1.828247, 0, 0, 0, 1, 1,
0.2353913, -1.288487, 2.870415, 0, 0, 0, 1, 1,
0.2374477, -0.221846, 0.2228354, 0, 0, 0, 1, 1,
0.2384116, -0.563769, 3.780997, 0, 0, 0, 1, 1,
0.2389467, 0.1395407, 1.526192, 0, 0, 0, 1, 1,
0.2391152, -0.153024, 2.445706, 0, 0, 0, 1, 1,
0.2475452, -0.02431547, 1.816879, 1, 1, 1, 1, 1,
0.2476339, -0.168888, 1.84908, 1, 1, 1, 1, 1,
0.2512236, -0.6923925, 2.315675, 1, 1, 1, 1, 1,
0.2513445, -0.8297769, 5.603641, 1, 1, 1, 1, 1,
0.2572173, -0.6830612, 3.025172, 1, 1, 1, 1, 1,
0.2586991, -0.2789925, 0.8930741, 1, 1, 1, 1, 1,
0.2601349, -0.6022633, 1.275759, 1, 1, 1, 1, 1,
0.2608111, -1.129836, 2.247988, 1, 1, 1, 1, 1,
0.2613956, 1.201005, 2.03266, 1, 1, 1, 1, 1,
0.2622431, 0.1885868, 2.543815, 1, 1, 1, 1, 1,
0.2625822, -0.2630374, 2.997993, 1, 1, 1, 1, 1,
0.2638398, 0.0873317, -0.6486932, 1, 1, 1, 1, 1,
0.2646038, 0.1200207, 0.6243777, 1, 1, 1, 1, 1,
0.2688545, 0.3760967, -0.2344687, 1, 1, 1, 1, 1,
0.2694358, -0.07243699, 1.52049, 1, 1, 1, 1, 1,
0.2703656, -0.5420633, 3.557429, 0, 0, 1, 1, 1,
0.270958, -0.4587951, 3.993117, 1, 0, 0, 1, 1,
0.2722107, 0.9865603, 0.5469205, 1, 0, 0, 1, 1,
0.27496, -0.4120985, 3.171, 1, 0, 0, 1, 1,
0.2756778, 0.3241752, -0.9621734, 1, 0, 0, 1, 1,
0.2805986, 0.5773673, 0.4250594, 1, 0, 0, 1, 1,
0.282437, -1.047709, 3.349702, 0, 0, 0, 1, 1,
0.2827126, 0.2941563, -0.6626099, 0, 0, 0, 1, 1,
0.2907967, 0.1095462, 1.295111, 0, 0, 0, 1, 1,
0.2931386, 0.9394037, 0.6465199, 0, 0, 0, 1, 1,
0.2934466, 0.8995235, 2.386331, 0, 0, 0, 1, 1,
0.2964366, 1.393989, 0.09205402, 0, 0, 0, 1, 1,
0.2989082, 0.09858036, 1.00235, 0, 0, 0, 1, 1,
0.2992857, -0.8285912, 2.52952, 1, 1, 1, 1, 1,
0.3026599, -0.8624269, 3.914665, 1, 1, 1, 1, 1,
0.303562, -1.80488, 3.335092, 1, 1, 1, 1, 1,
0.304934, 0.124329, 2.263177, 1, 1, 1, 1, 1,
0.3109276, -0.9255605, 2.301691, 1, 1, 1, 1, 1,
0.3170841, -0.5410834, 3.954642, 1, 1, 1, 1, 1,
0.317776, 0.8912971, -0.7640811, 1, 1, 1, 1, 1,
0.3246564, 0.1919732, 2.431396, 1, 1, 1, 1, 1,
0.328974, -1.670005, 2.128788, 1, 1, 1, 1, 1,
0.3294994, 0.7491288, 2.16576, 1, 1, 1, 1, 1,
0.3303921, 1.564669, 2.609122, 1, 1, 1, 1, 1,
0.3309461, 0.6026869, 0.3484728, 1, 1, 1, 1, 1,
0.3334117, 1.252389, 0.4232529, 1, 1, 1, 1, 1,
0.3377535, -1.880237, 2.777942, 1, 1, 1, 1, 1,
0.341131, -0.3062767, 2.78175, 1, 1, 1, 1, 1,
0.3449701, -0.05381824, 0.9996414, 0, 0, 1, 1, 1,
0.3450971, -1.891747, 1.939888, 1, 0, 0, 1, 1,
0.3528893, -1.985994, 2.357925, 1, 0, 0, 1, 1,
0.3532411, 1.171966, 1.578009, 1, 0, 0, 1, 1,
0.3623337, -0.00123959, 0.8476308, 1, 0, 0, 1, 1,
0.363011, 0.366744, -0.5678038, 1, 0, 0, 1, 1,
0.3678867, 0.1205005, 0.6997406, 0, 0, 0, 1, 1,
0.3685226, -0.6387249, 3.119503, 0, 0, 0, 1, 1,
0.3722061, -0.5493789, 2.679732, 0, 0, 0, 1, 1,
0.3733365, -0.6330234, 2.822868, 0, 0, 0, 1, 1,
0.3766254, 0.9143021, 1.524193, 0, 0, 0, 1, 1,
0.3776417, 1.547152, 0.7837516, 0, 0, 0, 1, 1,
0.3790855, 0.2829194, 2.598173, 0, 0, 0, 1, 1,
0.3866392, 0.7030033, -0.8598292, 1, 1, 1, 1, 1,
0.3869694, -0.02021437, 3.428872, 1, 1, 1, 1, 1,
0.3877266, -0.7145333, 1.809524, 1, 1, 1, 1, 1,
0.3977459, -0.1872333, 2.215734, 1, 1, 1, 1, 1,
0.4015042, -0.009625583, -0.5802452, 1, 1, 1, 1, 1,
0.4087106, 0.6805075, 0.8253763, 1, 1, 1, 1, 1,
0.4103255, -0.6804277, 3.185946, 1, 1, 1, 1, 1,
0.4182374, 1.592745, 0.7594424, 1, 1, 1, 1, 1,
0.4261568, 0.3002393, 1.105438, 1, 1, 1, 1, 1,
0.4341895, 0.8022404, 0.05529032, 1, 1, 1, 1, 1,
0.4349393, 0.2703938, -0.4161936, 1, 1, 1, 1, 1,
0.4390323, -0.6910978, 4.416386, 1, 1, 1, 1, 1,
0.4411554, -0.05826605, 3.683129, 1, 1, 1, 1, 1,
0.4419306, 0.1947502, 2.594635, 1, 1, 1, 1, 1,
0.4438865, 0.495114, 0.6700063, 1, 1, 1, 1, 1,
0.4467121, 1.175841, -1.766285, 0, 0, 1, 1, 1,
0.4514287, 0.3257675, 1.073012, 1, 0, 0, 1, 1,
0.4586628, 0.4875887, 0.779127, 1, 0, 0, 1, 1,
0.4611885, 1.579501, 1.862012, 1, 0, 0, 1, 1,
0.4655571, -0.5028545, 1.0128, 1, 0, 0, 1, 1,
0.4692762, -0.9774708, 3.219498, 1, 0, 0, 1, 1,
0.4694618, -1.503153, 3.948653, 0, 0, 0, 1, 1,
0.4793639, -2.787445, 3.549231, 0, 0, 0, 1, 1,
0.480096, 0.5186725, 1.175411, 0, 0, 0, 1, 1,
0.4802147, 0.2895311, 1.547526, 0, 0, 0, 1, 1,
0.485297, 0.06239108, 1.628045, 0, 0, 0, 1, 1,
0.4864188, 0.1673531, -0.05791286, 0, 0, 0, 1, 1,
0.4909905, -0.3853858, 2.08015, 0, 0, 0, 1, 1,
0.4943811, 1.140172, -0.1324646, 1, 1, 1, 1, 1,
0.4966982, -0.5444716, 1.746032, 1, 1, 1, 1, 1,
0.4990116, 0.1386759, -0.3145275, 1, 1, 1, 1, 1,
0.5013182, -0.9160739, 2.13306, 1, 1, 1, 1, 1,
0.5030382, 0.02808678, 0.9450415, 1, 1, 1, 1, 1,
0.5051723, -0.9739531, 2.689235, 1, 1, 1, 1, 1,
0.5058181, 0.5954411, 1.492317, 1, 1, 1, 1, 1,
0.5066953, 0.7647607, -0.2318593, 1, 1, 1, 1, 1,
0.5141261, 0.8427051, -0.05925572, 1, 1, 1, 1, 1,
0.5154688, 0.1323595, 1.615725, 1, 1, 1, 1, 1,
0.5219919, -1.179511, 2.325501, 1, 1, 1, 1, 1,
0.522346, -0.5785244, 1.520901, 1, 1, 1, 1, 1,
0.5272921, 1.21464, -0.7757967, 1, 1, 1, 1, 1,
0.5340475, -0.4610729, 1.080938, 1, 1, 1, 1, 1,
0.535029, 0.07399307, 0.123494, 1, 1, 1, 1, 1,
0.5350851, -0.4980598, 2.547292, 0, 0, 1, 1, 1,
0.5388116, 0.4265667, 1.653122, 1, 0, 0, 1, 1,
0.5406971, -0.9690361, 2.480512, 1, 0, 0, 1, 1,
0.5422736, 1.453362, -0.2042032, 1, 0, 0, 1, 1,
0.5447518, -0.4544255, 1.805643, 1, 0, 0, 1, 1,
0.5450365, -0.02968299, -0.2045031, 1, 0, 0, 1, 1,
0.5482011, -0.6830026, 1.96821, 0, 0, 0, 1, 1,
0.5491799, -0.01389823, -0.2619872, 0, 0, 0, 1, 1,
0.549773, 0.357661, 1.556332, 0, 0, 0, 1, 1,
0.5551297, 0.08656399, 1.488531, 0, 0, 0, 1, 1,
0.5555976, -0.5809298, 2.929336, 0, 0, 0, 1, 1,
0.5564225, 1.650756, 1.07795, 0, 0, 0, 1, 1,
0.5593747, 0.2043761, 0.00534316, 0, 0, 0, 1, 1,
0.5685959, 1.585815, 1.197688, 1, 1, 1, 1, 1,
0.5710599, -1.552784, 3.093463, 1, 1, 1, 1, 1,
0.5752593, -0.2226265, 0.9186574, 1, 1, 1, 1, 1,
0.5762839, 0.04760948, 2.076323, 1, 1, 1, 1, 1,
0.5780904, -1.573047, 3.636106, 1, 1, 1, 1, 1,
0.5926747, -1.723987, 1.2075, 1, 1, 1, 1, 1,
0.6003661, -0.04509262, -0.6143569, 1, 1, 1, 1, 1,
0.6059565, 0.03175892, 1.156491, 1, 1, 1, 1, 1,
0.6060948, -0.5486882, 2.184315, 1, 1, 1, 1, 1,
0.6145177, -0.4847884, 1.479604, 1, 1, 1, 1, 1,
0.6246928, -1.236423, 3.873573, 1, 1, 1, 1, 1,
0.6248835, -0.4917832, 2.638661, 1, 1, 1, 1, 1,
0.6262745, 0.979053, 1.991587, 1, 1, 1, 1, 1,
0.6329997, 1.027503, 1.359267, 1, 1, 1, 1, 1,
0.6374389, 1.975644, -0.6861398, 1, 1, 1, 1, 1,
0.6432301, -0.5127237, 3.242488, 0, 0, 1, 1, 1,
0.6443836, -0.0638086, 1.715406, 1, 0, 0, 1, 1,
0.6495417, 1.410075, 0.0526624, 1, 0, 0, 1, 1,
0.6523654, -0.2265334, 1.713109, 1, 0, 0, 1, 1,
0.654249, 0.4862289, 1.162957, 1, 0, 0, 1, 1,
0.6560015, 0.927501, 0.2334525, 1, 0, 0, 1, 1,
0.6595154, 0.6139546, 1.303607, 0, 0, 0, 1, 1,
0.6602128, 0.2369339, 0.5653096, 0, 0, 0, 1, 1,
0.6616467, -1.041883, 1.439293, 0, 0, 0, 1, 1,
0.6620776, 0.8200195, 1.109072, 0, 0, 0, 1, 1,
0.6628266, -0.3411196, -1.122588, 0, 0, 0, 1, 1,
0.6644258, 1.271094, 3.394712, 0, 0, 0, 1, 1,
0.6661716, 1.559114, 2.326511, 0, 0, 0, 1, 1,
0.672541, -0.2469571, 3.380708, 1, 1, 1, 1, 1,
0.6761159, 0.6329545, 1.634279, 1, 1, 1, 1, 1,
0.6772621, 0.5001507, -0.7056665, 1, 1, 1, 1, 1,
0.6841387, 0.5103709, 1.138658, 1, 1, 1, 1, 1,
0.6873007, 0.6455857, 1.32963, 1, 1, 1, 1, 1,
0.6899442, 1.222112, 3.233982, 1, 1, 1, 1, 1,
0.6908726, -1.738895, 3.24314, 1, 1, 1, 1, 1,
0.6911536, 0.5999238, 1.951012, 1, 1, 1, 1, 1,
0.6950964, 0.6858317, 1.665777, 1, 1, 1, 1, 1,
0.6966403, 2.015265, 1.027857, 1, 1, 1, 1, 1,
0.7018499, 0.7338853, 2.250888, 1, 1, 1, 1, 1,
0.7028971, 1.203932, -0.4347436, 1, 1, 1, 1, 1,
0.7035954, -0.5929659, 2.85151, 1, 1, 1, 1, 1,
0.7072442, -0.4754953, 1.670225, 1, 1, 1, 1, 1,
0.7090314, 0.5792946, 0.9495935, 1, 1, 1, 1, 1,
0.7124819, -0.4483624, 2.639479, 0, 0, 1, 1, 1,
0.7136824, 1.854966, 0.07226174, 1, 0, 0, 1, 1,
0.7165896, 0.9294743, -0.3608518, 1, 0, 0, 1, 1,
0.7166874, -0.8128303, 1.676891, 1, 0, 0, 1, 1,
0.722967, 0.4456567, 0.6591678, 1, 0, 0, 1, 1,
0.7325492, 1.727424, 2.205316, 1, 0, 0, 1, 1,
0.7340233, 0.6193985, -0.4260726, 0, 0, 0, 1, 1,
0.7342362, 0.2132635, -1.425563, 0, 0, 0, 1, 1,
0.7392833, -0.2578058, 0.7556047, 0, 0, 0, 1, 1,
0.7476742, -0.8474637, 3.232588, 0, 0, 0, 1, 1,
0.7497242, -1.134059, 2.72228, 0, 0, 0, 1, 1,
0.7504523, -0.4624219, 2.052647, 0, 0, 0, 1, 1,
0.7538927, 0.4924591, 0.6517009, 0, 0, 0, 1, 1,
0.75425, 0.3736914, 0.3172004, 1, 1, 1, 1, 1,
0.7544761, -0.9192131, 3.986639, 1, 1, 1, 1, 1,
0.7553651, -1.124328, 1.821439, 1, 1, 1, 1, 1,
0.7555074, 0.3578293, 1.464761, 1, 1, 1, 1, 1,
0.7591078, -0.5771719, 2.670629, 1, 1, 1, 1, 1,
0.7648139, 0.5667729, 0.6166642, 1, 1, 1, 1, 1,
0.7715889, 0.9254916, 1.653667, 1, 1, 1, 1, 1,
0.7721466, 0.759421, 1.570095, 1, 1, 1, 1, 1,
0.7735425, -0.9371099, 1.114971, 1, 1, 1, 1, 1,
0.7739547, -0.5080517, 3.858766, 1, 1, 1, 1, 1,
0.7746034, 0.7745349, -0.368768, 1, 1, 1, 1, 1,
0.7749168, 0.7975954, 1.051312, 1, 1, 1, 1, 1,
0.7761107, -0.5139029, 0.8654472, 1, 1, 1, 1, 1,
0.7777045, 0.3441345, -0.1262683, 1, 1, 1, 1, 1,
0.7812794, 0.6399252, 0.8685411, 1, 1, 1, 1, 1,
0.7858139, 0.5713884, -0.589121, 0, 0, 1, 1, 1,
0.7861231, 0.5001686, 1.046566, 1, 0, 0, 1, 1,
0.7892359, 1.272524, 0.3274316, 1, 0, 0, 1, 1,
0.7901609, 0.7521006, 0.8053523, 1, 0, 0, 1, 1,
0.7935452, -1.149851, 2.067774, 1, 0, 0, 1, 1,
0.8064913, 1.78844, -0.490346, 1, 0, 0, 1, 1,
0.8097983, 0.3332307, 0.6631141, 0, 0, 0, 1, 1,
0.8105767, -1.073302, 2.157251, 0, 0, 0, 1, 1,
0.8124068, -0.7756638, 1.007058, 0, 0, 0, 1, 1,
0.817978, -2.179477, 2.885147, 0, 0, 0, 1, 1,
0.8204656, -1.181776, 3.541179, 0, 0, 0, 1, 1,
0.8211326, -0.1810372, 0.4654656, 0, 0, 0, 1, 1,
0.8315488, 0.3197489, 2.084558, 0, 0, 0, 1, 1,
0.8363543, -0.06624753, 4.336566, 1, 1, 1, 1, 1,
0.8454807, -0.6701954, 3.736417, 1, 1, 1, 1, 1,
0.8455268, -2.433857, 1.752649, 1, 1, 1, 1, 1,
0.8526208, 0.13523, 2.699521, 1, 1, 1, 1, 1,
0.8581852, -1.950656, 2.918501, 1, 1, 1, 1, 1,
0.8600397, -1.572111, 2.38849, 1, 1, 1, 1, 1,
0.8614367, 0.06713735, 2.401893, 1, 1, 1, 1, 1,
0.8762757, -0.5581346, 1.608867, 1, 1, 1, 1, 1,
0.8795552, -0.6885691, 1.311588, 1, 1, 1, 1, 1,
0.8803135, -0.5817884, 2.027736, 1, 1, 1, 1, 1,
0.88077, 0.6085559, 1.354398, 1, 1, 1, 1, 1,
0.8824985, 2.056984, 1.381807, 1, 1, 1, 1, 1,
0.8852687, -0.4614241, 2.370388, 1, 1, 1, 1, 1,
0.8867341, 0.9592862, 1.990703, 1, 1, 1, 1, 1,
0.887194, -0.6880299, 2.050415, 1, 1, 1, 1, 1,
0.8900135, 1.017646, -0.2909827, 0, 0, 1, 1, 1,
0.8963733, -0.4256155, 3.103698, 1, 0, 0, 1, 1,
0.898341, -0.946593, 3.763387, 1, 0, 0, 1, 1,
0.9075987, 0.3769001, 1.321284, 1, 0, 0, 1, 1,
0.9097017, -1.890449, 3.001617, 1, 0, 0, 1, 1,
0.9125045, -0.9731124, 3.009104, 1, 0, 0, 1, 1,
0.9226086, 0.4402209, 1.624815, 0, 0, 0, 1, 1,
0.9235778, -0.1029206, 0.5214529, 0, 0, 0, 1, 1,
0.9262354, 0.01247596, 0.7852719, 0, 0, 0, 1, 1,
0.9357677, 2.115796, 0.9546553, 0, 0, 0, 1, 1,
0.9378989, -1.415021, 2.743174, 0, 0, 0, 1, 1,
0.9552023, -0.9536459, 1.484883, 0, 0, 0, 1, 1,
0.9566744, 0.2919968, 0.7657123, 0, 0, 0, 1, 1,
0.9637191, -0.1907641, 1.618955, 1, 1, 1, 1, 1,
0.9691099, -0.1690013, 1.562816, 1, 1, 1, 1, 1,
0.9723987, -2.335942, 2.45622, 1, 1, 1, 1, 1,
0.9788204, -1.146953, 3.709463, 1, 1, 1, 1, 1,
0.9815624, -0.2399013, 0.7062973, 1, 1, 1, 1, 1,
0.9826011, -0.08673655, 2.092908, 1, 1, 1, 1, 1,
0.9829618, 0.8929859, -0.264036, 1, 1, 1, 1, 1,
0.9865475, 0.559655, 2.184811, 1, 1, 1, 1, 1,
0.9953297, -0.5236717, 3.370913, 1, 1, 1, 1, 1,
1.005056, -0.398214, 0.8170038, 1, 1, 1, 1, 1,
1.00841, 0.2345743, 2.50563, 1, 1, 1, 1, 1,
1.022695, -0.3587709, 2.276064, 1, 1, 1, 1, 1,
1.029736, 0.6902733, 1.641044, 1, 1, 1, 1, 1,
1.031373, 2.625181, 0.01605047, 1, 1, 1, 1, 1,
1.032763, 0.6824028, 0.9039783, 1, 1, 1, 1, 1,
1.033161, 1.24175, 1.440816, 0, 0, 1, 1, 1,
1.034714, 1.453244, 0.9459158, 1, 0, 0, 1, 1,
1.040188, -0.04950959, 2.899673, 1, 0, 0, 1, 1,
1.040436, -1.52825, 1.304396, 1, 0, 0, 1, 1,
1.040919, 0.3192798, 0.4983186, 1, 0, 0, 1, 1,
1.048079, -0.3789952, 0.5703685, 1, 0, 0, 1, 1,
1.050464, -0.4363669, 2.056624, 0, 0, 0, 1, 1,
1.059752, -0.7674195, 3.983203, 0, 0, 0, 1, 1,
1.061939, 0.856669, 0.6268315, 0, 0, 0, 1, 1,
1.071033, 0.3158019, 1.006284, 0, 0, 0, 1, 1,
1.077288, -0.0890431, 2.169331, 0, 0, 0, 1, 1,
1.078797, -0.489062, 2.156698, 0, 0, 0, 1, 1,
1.094911, -0.8072893, 2.187364, 0, 0, 0, 1, 1,
1.103782, -0.9091498, 2.302258, 1, 1, 1, 1, 1,
1.108863, 1.057192, 0.5240321, 1, 1, 1, 1, 1,
1.12024, 0.1869394, 1.173618, 1, 1, 1, 1, 1,
1.122162, -1.025948, 3.332519, 1, 1, 1, 1, 1,
1.122595, -1.431013, 3.563875, 1, 1, 1, 1, 1,
1.124762, -0.1841287, 1.919305, 1, 1, 1, 1, 1,
1.133919, -0.09427842, 1.928878, 1, 1, 1, 1, 1,
1.145031, 0.997052, 0.6986369, 1, 1, 1, 1, 1,
1.146587, -0.1128325, 1.187034, 1, 1, 1, 1, 1,
1.151149, -3.299798, 2.421056, 1, 1, 1, 1, 1,
1.156723, -0.6172496, 0.2989329, 1, 1, 1, 1, 1,
1.158829, -0.2531326, 1.310733, 1, 1, 1, 1, 1,
1.16225, 0.7386804, 1.090671, 1, 1, 1, 1, 1,
1.162873, -0.9748618, 1.733277, 1, 1, 1, 1, 1,
1.172115, -1.026928, 3.13677, 1, 1, 1, 1, 1,
1.173475, 0.1659475, 1.521208, 0, 0, 1, 1, 1,
1.177227, 0.678128, -0.5073138, 1, 0, 0, 1, 1,
1.186332, -0.2036598, 2.458559, 1, 0, 0, 1, 1,
1.186527, 1.316269, 2.069499, 1, 0, 0, 1, 1,
1.187092, 0.7423127, 0.2973559, 1, 0, 0, 1, 1,
1.190313, 0.832829, 1.804745, 1, 0, 0, 1, 1,
1.198033, 0.7829003, 1.046583, 0, 0, 0, 1, 1,
1.200514, 0.9633605, 2.693058, 0, 0, 0, 1, 1,
1.207635, -2.035334, 1.721408, 0, 0, 0, 1, 1,
1.211095, -0.520409, 2.788932, 0, 0, 0, 1, 1,
1.211309, 0.04874149, 2.354079, 0, 0, 0, 1, 1,
1.211654, -0.6849819, 1.073115, 0, 0, 0, 1, 1,
1.216358, 0.8003671, 0.8950109, 0, 0, 0, 1, 1,
1.218058, -3.126558, 1.120442, 1, 1, 1, 1, 1,
1.224011, 0.4534246, 0.1764081, 1, 1, 1, 1, 1,
1.234621, -0.2699499, 3.338061, 1, 1, 1, 1, 1,
1.23571, -1.747231, 3.01357, 1, 1, 1, 1, 1,
1.244806, -0.8409487, 2.558933, 1, 1, 1, 1, 1,
1.248634, -1.644841, 0.6478002, 1, 1, 1, 1, 1,
1.25097, -1.863013, 2.172936, 1, 1, 1, 1, 1,
1.265131, -0.02921965, 0.8389561, 1, 1, 1, 1, 1,
1.287622, 0.349748, 2.34517, 1, 1, 1, 1, 1,
1.288039, 0.6873063, 1.381639, 1, 1, 1, 1, 1,
1.292278, -1.191597, 2.824365, 1, 1, 1, 1, 1,
1.293695, 1.321307, 0.7416469, 1, 1, 1, 1, 1,
1.294852, 0.3608731, 0.9391951, 1, 1, 1, 1, 1,
1.323525, 0.9781461, 0.6968914, 1, 1, 1, 1, 1,
1.331226, -0.8015347, 3.477644, 1, 1, 1, 1, 1,
1.360994, -0.8390414, 2.405089, 0, 0, 1, 1, 1,
1.374385, -1.395566, 5.971784, 1, 0, 0, 1, 1,
1.390809, 1.129482, 0.6683335, 1, 0, 0, 1, 1,
1.408667, -0.3982958, 1.295274, 1, 0, 0, 1, 1,
1.410096, 0.2505425, -1.505666, 1, 0, 0, 1, 1,
1.411118, 0.2619541, 1.533828, 1, 0, 0, 1, 1,
1.412004, 1.202917, -0.9682524, 0, 0, 0, 1, 1,
1.414267, -0.09587321, 1.937501, 0, 0, 0, 1, 1,
1.419186, -0.1262639, 1.832574, 0, 0, 0, 1, 1,
1.420473, -1.892026, 4.942359, 0, 0, 0, 1, 1,
1.463256, 0.9992549, 0.795909, 0, 0, 0, 1, 1,
1.478804, -0.7309623, 3.130763, 0, 0, 0, 1, 1,
1.479568, 0.06540059, 0.1332696, 0, 0, 0, 1, 1,
1.488548, -0.4860041, 3.009137, 1, 1, 1, 1, 1,
1.49267, -0.1802081, 0.3049586, 1, 1, 1, 1, 1,
1.494049, 0.8616794, 0.7284622, 1, 1, 1, 1, 1,
1.502087, 0.2647869, 0.8930315, 1, 1, 1, 1, 1,
1.504047, 0.2929932, 3.463286, 1, 1, 1, 1, 1,
1.522152, 0.8699414, 0.5727156, 1, 1, 1, 1, 1,
1.535485, -0.1613489, 1.079172, 1, 1, 1, 1, 1,
1.540136, 1.096738, 0.6170323, 1, 1, 1, 1, 1,
1.540512, -1.0904, 2.517343, 1, 1, 1, 1, 1,
1.546759, 0.3122065, 0.1196309, 1, 1, 1, 1, 1,
1.561436, -0.7425167, 0.9570989, 1, 1, 1, 1, 1,
1.563923, 0.4184552, 0.5881941, 1, 1, 1, 1, 1,
1.570335, -1.362694, 3.43497, 1, 1, 1, 1, 1,
1.582914, -0.192743, 1.702021, 1, 1, 1, 1, 1,
1.585025, -1.166102, 1.357249, 1, 1, 1, 1, 1,
1.587601, 0.9347493, 0.9339598, 0, 0, 1, 1, 1,
1.608778, -0.1287885, 2.243819, 1, 0, 0, 1, 1,
1.614939, -0.2550578, 2.040912, 1, 0, 0, 1, 1,
1.615051, 0.06371275, 3.58498, 1, 0, 0, 1, 1,
1.618157, -0.6203436, 1.409615, 1, 0, 0, 1, 1,
1.618989, 1.325069, -0.642064, 1, 0, 0, 1, 1,
1.6207, 1.565614, 1.997455, 0, 0, 0, 1, 1,
1.675508, -0.7077923, 3.178278, 0, 0, 0, 1, 1,
1.682237, 0.2242602, 0.825681, 0, 0, 0, 1, 1,
1.684909, 1.190137, 0.6718076, 0, 0, 0, 1, 1,
1.686242, -1.468952, 3.506284, 0, 0, 0, 1, 1,
1.70223, -1.759826, 3.189727, 0, 0, 0, 1, 1,
1.708683, -0.3835441, 1.477024, 0, 0, 0, 1, 1,
1.763438, 1.264744, 2.044618, 1, 1, 1, 1, 1,
1.780505, -1.44619, 2.780634, 1, 1, 1, 1, 1,
1.786436, 0.6858967, 3.687395, 1, 1, 1, 1, 1,
1.816121, -0.05128675, 0.8924046, 1, 1, 1, 1, 1,
1.820036, 0.5329231, 2.037256, 1, 1, 1, 1, 1,
1.864272, -0.4919274, 2.103178, 1, 1, 1, 1, 1,
1.86959, 1.129861, 1.900103, 1, 1, 1, 1, 1,
1.883408, 0.04132022, 1.728118, 1, 1, 1, 1, 1,
1.889134, 1.139422, 1.567886, 1, 1, 1, 1, 1,
1.916578, 1.618095, 1.298973, 1, 1, 1, 1, 1,
1.949566, -0.258446, -0.2326969, 1, 1, 1, 1, 1,
2.002381, -0.3169009, 2.329597, 1, 1, 1, 1, 1,
2.007107, -1.128832, 1.988636, 1, 1, 1, 1, 1,
2.007515, 0.2779826, 0.3346479, 1, 1, 1, 1, 1,
2.023764, -1.472216, 3.047382, 1, 1, 1, 1, 1,
2.101485, -0.2033984, 2.415902, 0, 0, 1, 1, 1,
2.119823, 0.9790139, 1.51915, 1, 0, 0, 1, 1,
2.140496, -0.5214686, 2.095314, 1, 0, 0, 1, 1,
2.185972, 1.266032, -0.4023083, 1, 0, 0, 1, 1,
2.191959, -0.4772047, 1.966974, 1, 0, 0, 1, 1,
2.237669, 0.01251623, 1.257038, 1, 0, 0, 1, 1,
2.26263, -0.9967491, 1.746106, 0, 0, 0, 1, 1,
2.281454, -1.825905, 0.7221437, 0, 0, 0, 1, 1,
2.307771, 0.7347564, 1.777873, 0, 0, 0, 1, 1,
2.310412, 1.351193, -0.5869758, 0, 0, 0, 1, 1,
2.370106, 0.1497939, 0.1473408, 0, 0, 0, 1, 1,
2.43425, -1.074482, 2.410263, 0, 0, 0, 1, 1,
2.554851, 0.6509982, 1.24045, 0, 0, 0, 1, 1,
2.635439, 1.0641, 2.77915, 1, 1, 1, 1, 1,
2.671155, -1.344854, 1.939161, 1, 1, 1, 1, 1,
2.685618, -0.7584478, 1.732385, 1, 1, 1, 1, 1,
2.805944, -0.1472268, 3.668038, 1, 1, 1, 1, 1,
2.818219, -1.410717, 1.827979, 1, 1, 1, 1, 1,
2.937686, -0.6483518, 1.527354, 1, 1, 1, 1, 1,
3.182635, 0.4575268, 2.083791, 1, 1, 1, 1, 1
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
var radius = 9.890939;
var distance = 34.7415;
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
mvMatrix.translate( 0.3830731, 0.3373085, -0.3155997 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.7415);
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
