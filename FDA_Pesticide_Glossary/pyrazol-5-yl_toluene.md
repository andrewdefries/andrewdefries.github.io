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
-3.130077, -0.4076633, -2.992728, 1, 0, 0, 1,
-2.970421, 0.1312354, -1.795222, 1, 0.007843138, 0, 1,
-2.617897, 0.5918886, -1.925463, 1, 0.01176471, 0, 1,
-2.512986, -0.6142013, -3.168995, 1, 0.01960784, 0, 1,
-2.446887, -0.05592862, -1.274965, 1, 0.02352941, 0, 1,
-2.445246, -1.493758, -2.156282, 1, 0.03137255, 0, 1,
-2.284048, -1.329123, -1.938388, 1, 0.03529412, 0, 1,
-2.231335, -0.4286462, -1.039013, 1, 0.04313726, 0, 1,
-2.220849, -2.034742, -2.473106, 1, 0.04705882, 0, 1,
-2.186778, 0.3835959, -1.648511, 1, 0.05490196, 0, 1,
-2.10836, -0.1006386, 0.112093, 1, 0.05882353, 0, 1,
-2.104031, -0.2105128, -0.5049075, 1, 0.06666667, 0, 1,
-2.021988, -0.9271659, -1.447394, 1, 0.07058824, 0, 1,
-1.979274, -0.2531202, -1.118815, 1, 0.07843138, 0, 1,
-1.943897, -0.9662111, -2.790271, 1, 0.08235294, 0, 1,
-1.930252, -0.3651584, -1.589088, 1, 0.09019608, 0, 1,
-1.878361, 0.1200034, -1.866984, 1, 0.09411765, 0, 1,
-1.866829, -0.5670581, -1.920804, 1, 0.1019608, 0, 1,
-1.852064, 1.532484, -0.5801856, 1, 0.1098039, 0, 1,
-1.805541, -0.7222166, -3.21447, 1, 0.1137255, 0, 1,
-1.78004, 0.8094956, -0.5838037, 1, 0.1215686, 0, 1,
-1.773039, -1.524164, -1.911592, 1, 0.1254902, 0, 1,
-1.771682, -0.1090687, -3.184325, 1, 0.1333333, 0, 1,
-1.760859, -1.177933, -1.518028, 1, 0.1372549, 0, 1,
-1.759252, 1.673506, -1.243744, 1, 0.145098, 0, 1,
-1.756999, 0.7952638, -1.475773, 1, 0.1490196, 0, 1,
-1.754733, 0.9884289, -0.9766816, 1, 0.1568628, 0, 1,
-1.731958, 0.1276937, -2.519125, 1, 0.1607843, 0, 1,
-1.731799, -1.314287, -3.226241, 1, 0.1686275, 0, 1,
-1.716838, 2.60743, -0.5715512, 1, 0.172549, 0, 1,
-1.713987, 0.2227363, -1.267669, 1, 0.1803922, 0, 1,
-1.710074, -1.517277, -1.389744, 1, 0.1843137, 0, 1,
-1.707551, 0.8690341, -2.105946, 1, 0.1921569, 0, 1,
-1.690938, 2.613672, -0.4043247, 1, 0.1960784, 0, 1,
-1.686685, -0.3339328, -1.928229, 1, 0.2039216, 0, 1,
-1.682263, -0.1942438, -2.620641, 1, 0.2117647, 0, 1,
-1.667401, -0.01666812, -1.363495, 1, 0.2156863, 0, 1,
-1.66499, 0.5970491, -1.271137, 1, 0.2235294, 0, 1,
-1.619932, 0.642439, -0.7793834, 1, 0.227451, 0, 1,
-1.616787, -0.08070095, -1.021361, 1, 0.2352941, 0, 1,
-1.597755, -0.9436393, -0.9877068, 1, 0.2392157, 0, 1,
-1.591843, -1.238871, -0.8724799, 1, 0.2470588, 0, 1,
-1.583019, 2.20041, 1.156901, 1, 0.2509804, 0, 1,
-1.558514, 0.5383563, -1.820521, 1, 0.2588235, 0, 1,
-1.54665, -1.007775, -2.093844, 1, 0.2627451, 0, 1,
-1.543687, -0.9735372, -2.040986, 1, 0.2705882, 0, 1,
-1.539687, 0.9637889, -1.487948, 1, 0.2745098, 0, 1,
-1.529783, -0.1444415, -1.631597, 1, 0.282353, 0, 1,
-1.526661, -1.438184, -1.430001, 1, 0.2862745, 0, 1,
-1.519796, -1.05587, -1.551605, 1, 0.2941177, 0, 1,
-1.515597, 0.7601081, -0.5247162, 1, 0.3019608, 0, 1,
-1.512991, -0.5441248, -2.128242, 1, 0.3058824, 0, 1,
-1.510313, -0.892534, -2.498111, 1, 0.3137255, 0, 1,
-1.485875, 0.09420857, -1.184227, 1, 0.3176471, 0, 1,
-1.485854, 0.677743, -0.3724043, 1, 0.3254902, 0, 1,
-1.475789, 0.9947862, -0.03700278, 1, 0.3294118, 0, 1,
-1.469256, -0.2354214, -2.212005, 1, 0.3372549, 0, 1,
-1.456589, -1.031386, -3.522455, 1, 0.3411765, 0, 1,
-1.453952, 0.6851862, -1.31955, 1, 0.3490196, 0, 1,
-1.449394, -0.5435399, -1.976079, 1, 0.3529412, 0, 1,
-1.449354, 0.298688, -1.985573, 1, 0.3607843, 0, 1,
-1.449153, 1.547567, -0.1396406, 1, 0.3647059, 0, 1,
-1.448776, 1.092622, 0.05217259, 1, 0.372549, 0, 1,
-1.446184, 2.773665, -1.348056, 1, 0.3764706, 0, 1,
-1.444071, -0.4071806, -2.446872, 1, 0.3843137, 0, 1,
-1.430373, 0.5808933, -3.076969, 1, 0.3882353, 0, 1,
-1.424427, 0.8468607, -1.365741, 1, 0.3960784, 0, 1,
-1.419071, 0.3775674, -1.793929, 1, 0.4039216, 0, 1,
-1.418202, -0.2778833, -1.270135, 1, 0.4078431, 0, 1,
-1.410788, -0.03735259, -2.282995, 1, 0.4156863, 0, 1,
-1.410332, 0.9770767, 0.3916544, 1, 0.4196078, 0, 1,
-1.408326, 0.1422911, -0.7234885, 1, 0.427451, 0, 1,
-1.403865, -0.4306207, -2.687459, 1, 0.4313726, 0, 1,
-1.386701, 0.7533098, -3.168208, 1, 0.4392157, 0, 1,
-1.382886, 0.002499017, -2.072865, 1, 0.4431373, 0, 1,
-1.379788, -0.582843, -1.821952, 1, 0.4509804, 0, 1,
-1.378607, 0.0911449, 0.574096, 1, 0.454902, 0, 1,
-1.369907, 1.36157, -1.315454, 1, 0.4627451, 0, 1,
-1.357204, -0.7014237, -1.134244, 1, 0.4666667, 0, 1,
-1.347189, -0.8844289, -0.957532, 1, 0.4745098, 0, 1,
-1.344992, -1.571609, -3.128719, 1, 0.4784314, 0, 1,
-1.337239, 0.4696398, -0.5222439, 1, 0.4862745, 0, 1,
-1.33173, 2.322581, 0.2136056, 1, 0.4901961, 0, 1,
-1.331615, 0.08951546, -2.205399, 1, 0.4980392, 0, 1,
-1.329157, 2.194906, 0.05201369, 1, 0.5058824, 0, 1,
-1.326249, -0.2293259, -2.874514, 1, 0.509804, 0, 1,
-1.312765, -0.4266569, -1.805942, 1, 0.5176471, 0, 1,
-1.308582, 0.5991471, -1.921735, 1, 0.5215687, 0, 1,
-1.303422, 0.1338053, -0.7116837, 1, 0.5294118, 0, 1,
-1.296865, 1.033074, -1.807513, 1, 0.5333334, 0, 1,
-1.291543, -0.139437, -1.857652, 1, 0.5411765, 0, 1,
-1.291127, 1.005656, -0.5879058, 1, 0.5450981, 0, 1,
-1.287503, 1.045849, -1.955988, 1, 0.5529412, 0, 1,
-1.285273, 0.03323818, -1.921549, 1, 0.5568628, 0, 1,
-1.284509, 0.752341, -0.09543519, 1, 0.5647059, 0, 1,
-1.277283, 1.204253, -1.118731, 1, 0.5686275, 0, 1,
-1.271127, 0.5532893, -0.8624845, 1, 0.5764706, 0, 1,
-1.268332, -1.368459, -2.350468, 1, 0.5803922, 0, 1,
-1.26681, 0.9247674, -1.751656, 1, 0.5882353, 0, 1,
-1.263131, -0.5540571, -0.8362414, 1, 0.5921569, 0, 1,
-1.256125, -0.1414117, -1.676172, 1, 0.6, 0, 1,
-1.254336, 1.169452, 0.4982708, 1, 0.6078432, 0, 1,
-1.244707, -0.1626455, -2.445867, 1, 0.6117647, 0, 1,
-1.242168, 0.5652897, 0.2060478, 1, 0.6196079, 0, 1,
-1.242126, 0.1924802, -2.647505, 1, 0.6235294, 0, 1,
-1.239959, -0.2138685, -2.294021, 1, 0.6313726, 0, 1,
-1.238508, 0.4535312, -1.859253, 1, 0.6352941, 0, 1,
-1.237097, 0.4479439, -1.489079, 1, 0.6431373, 0, 1,
-1.220463, 0.8707438, -1.347277, 1, 0.6470588, 0, 1,
-1.219565, -0.6625172, -0.6155629, 1, 0.654902, 0, 1,
-1.212447, -1.484007, -3.057582, 1, 0.6588235, 0, 1,
-1.205836, -1.025002, -2.110775, 1, 0.6666667, 0, 1,
-1.201793, 1.939891, -0.5740859, 1, 0.6705883, 0, 1,
-1.199368, -2.204179, -2.710541, 1, 0.6784314, 0, 1,
-1.188858, 0.8947236, 1.065002, 1, 0.682353, 0, 1,
-1.184983, 1.268671, 0.9753283, 1, 0.6901961, 0, 1,
-1.178301, -0.1182536, -2.156181, 1, 0.6941177, 0, 1,
-1.175259, 0.04593453, -1.599506, 1, 0.7019608, 0, 1,
-1.173647, -0.01580445, -1.981877, 1, 0.7098039, 0, 1,
-1.160748, 0.5778021, -0.513952, 1, 0.7137255, 0, 1,
-1.156879, 0.09466887, -1.868973, 1, 0.7215686, 0, 1,
-1.142705, 2.009014, -1.163654, 1, 0.7254902, 0, 1,
-1.139243, -0.01821348, -0.3034744, 1, 0.7333333, 0, 1,
-1.131326, 0.8541391, -3.414354, 1, 0.7372549, 0, 1,
-1.12668, 0.07998115, 0.4178322, 1, 0.7450981, 0, 1,
-1.125902, -1.732239, -0.5655546, 1, 0.7490196, 0, 1,
-1.123424, 1.230492, -1.091804, 1, 0.7568628, 0, 1,
-1.11413, -2.191569, -4.24809, 1, 0.7607843, 0, 1,
-1.098359, 1.756373, 0.1956868, 1, 0.7686275, 0, 1,
-1.097267, 0.7984844, -1.187104, 1, 0.772549, 0, 1,
-1.089437, 1.013506, -1.129506, 1, 0.7803922, 0, 1,
-1.080745, 1.669176, -1.189555, 1, 0.7843137, 0, 1,
-1.071443, -0.8488637, -0.2961112, 1, 0.7921569, 0, 1,
-1.068928, 0.08063386, -2.046978, 1, 0.7960784, 0, 1,
-1.068917, -1.005016, -3.839617, 1, 0.8039216, 0, 1,
-1.067147, 0.4422183, -1.76059, 1, 0.8117647, 0, 1,
-1.064443, 0.3422053, -2.833862, 1, 0.8156863, 0, 1,
-1.059322, -0.9521731, -2.83572, 1, 0.8235294, 0, 1,
-1.056615, -0.5278996, -1.061481, 1, 0.827451, 0, 1,
-1.054015, 0.2324102, -1.707752, 1, 0.8352941, 0, 1,
-1.051377, 0.691129, -0.07941014, 1, 0.8392157, 0, 1,
-1.039287, -0.7604374, -3.332203, 1, 0.8470588, 0, 1,
-1.033847, 0.02143253, -1.013447, 1, 0.8509804, 0, 1,
-1.030889, 0.2125826, -0.06047778, 1, 0.8588235, 0, 1,
-1.02638, 0.2839391, -0.1576135, 1, 0.8627451, 0, 1,
-1.01602, -0.1714869, -2.964292, 1, 0.8705882, 0, 1,
-1.01417, 0.3807364, 0.3186647, 1, 0.8745098, 0, 1,
-1.006088, 2.535331, -1.393166, 1, 0.8823529, 0, 1,
-1.005145, -0.3803408, -1.565716, 1, 0.8862745, 0, 1,
-0.999743, -0.9414032, -3.094704, 1, 0.8941177, 0, 1,
-0.9951091, 0.1828397, -2.874203, 1, 0.8980392, 0, 1,
-0.9947794, -0.9349064, -1.745944, 1, 0.9058824, 0, 1,
-0.9902211, -0.5085434, -2.261701, 1, 0.9137255, 0, 1,
-0.9789299, 1.035257, -0.1394733, 1, 0.9176471, 0, 1,
-0.9776738, 0.1903073, 0.4763132, 1, 0.9254902, 0, 1,
-0.9740203, -0.5863346, -2.636862, 1, 0.9294118, 0, 1,
-0.9729741, 1.186659, -3.856032, 1, 0.9372549, 0, 1,
-0.9723628, -0.3980587, -3.528228, 1, 0.9411765, 0, 1,
-0.9665201, 0.1954223, -0.632547, 1, 0.9490196, 0, 1,
-0.9645164, 1.609784, 1.041408, 1, 0.9529412, 0, 1,
-0.9605236, 1.280309, 0.4945045, 1, 0.9607843, 0, 1,
-0.9603437, -0.2589232, -1.808603, 1, 0.9647059, 0, 1,
-0.9128898, -0.2915806, -3.046256, 1, 0.972549, 0, 1,
-0.9110209, -1.185857, -3.490366, 1, 0.9764706, 0, 1,
-0.9071491, 0.2160735, -0.4128504, 1, 0.9843137, 0, 1,
-0.9047799, -0.5914715, -2.420539, 1, 0.9882353, 0, 1,
-0.8985221, -1.029529, -1.624477, 1, 0.9960784, 0, 1,
-0.8968238, -1.291558, -3.808961, 0.9960784, 1, 0, 1,
-0.8958628, 0.2799076, -1.683052, 0.9921569, 1, 0, 1,
-0.895493, 0.5093132, -0.2992425, 0.9843137, 1, 0, 1,
-0.891302, -1.074157, -3.524249, 0.9803922, 1, 0, 1,
-0.8900551, -0.3069658, -1.492869, 0.972549, 1, 0, 1,
-0.8839279, 2.249824, 0.6526211, 0.9686275, 1, 0, 1,
-0.8795826, 0.05722651, -0.2727842, 0.9607843, 1, 0, 1,
-0.8783557, -1.743087, -4.041105, 0.9568627, 1, 0, 1,
-0.8768648, -0.1986046, -3.477534, 0.9490196, 1, 0, 1,
-0.8755119, -0.14011, -2.059961, 0.945098, 1, 0, 1,
-0.8722919, -0.2559746, -2.031839, 0.9372549, 1, 0, 1,
-0.8710803, 0.3155594, -1.494182, 0.9333333, 1, 0, 1,
-0.8661952, 0.6715659, 0.9019508, 0.9254902, 1, 0, 1,
-0.8648617, -0.1206204, -0.09513153, 0.9215686, 1, 0, 1,
-0.8569108, -0.2370561, -2.619875, 0.9137255, 1, 0, 1,
-0.8563131, 0.141323, -2.258593, 0.9098039, 1, 0, 1,
-0.85422, 0.1535927, -1.485084, 0.9019608, 1, 0, 1,
-0.8516037, 0.2236805, 0.2691064, 0.8941177, 1, 0, 1,
-0.8462631, 0.2377541, -2.970875, 0.8901961, 1, 0, 1,
-0.8376338, 1.703962, -1.281312, 0.8823529, 1, 0, 1,
-0.8332036, 0.9130322, -0.07009504, 0.8784314, 1, 0, 1,
-0.8295134, -0.8555692, -5.098506, 0.8705882, 1, 0, 1,
-0.8286627, 1.324232, 0.4861234, 0.8666667, 1, 0, 1,
-0.8273976, 0.1464557, -2.119284, 0.8588235, 1, 0, 1,
-0.8267989, 0.5006756, -1.873156, 0.854902, 1, 0, 1,
-0.8263823, 0.5797633, 0.9238978, 0.8470588, 1, 0, 1,
-0.8201743, 1.187253, -0.786002, 0.8431373, 1, 0, 1,
-0.8137825, 0.3067618, -1.279973, 0.8352941, 1, 0, 1,
-0.8077897, -1.020661, -2.674696, 0.8313726, 1, 0, 1,
-0.8040739, 0.5067815, -1.700295, 0.8235294, 1, 0, 1,
-0.8029624, 0.8299289, 1.072813, 0.8196079, 1, 0, 1,
-0.801811, 0.1330283, -0.4146031, 0.8117647, 1, 0, 1,
-0.8004701, -0.2347424, -2.780145, 0.8078431, 1, 0, 1,
-0.7997448, -0.8195027, -1.287789, 0.8, 1, 0, 1,
-0.7983604, -0.2874049, -2.33518, 0.7921569, 1, 0, 1,
-0.798067, 0.2274489, -0.5842432, 0.7882353, 1, 0, 1,
-0.7949499, -1.056204, -2.316431, 0.7803922, 1, 0, 1,
-0.7940218, 0.2178313, -2.795383, 0.7764706, 1, 0, 1,
-0.7879472, -0.08168973, -1.468371, 0.7686275, 1, 0, 1,
-0.7861227, 1.17939, -0.1124407, 0.7647059, 1, 0, 1,
-0.7838855, -0.05175864, -1.38001, 0.7568628, 1, 0, 1,
-0.7833689, 0.9013768, -0.3202818, 0.7529412, 1, 0, 1,
-0.7824056, -1.087898, -1.725715, 0.7450981, 1, 0, 1,
-0.7823584, -0.5566502, -1.998751, 0.7411765, 1, 0, 1,
-0.7819649, 1.094635, -0.5697203, 0.7333333, 1, 0, 1,
-0.7793389, 0.6011047, -0.1281571, 0.7294118, 1, 0, 1,
-0.7792405, 0.3454071, -0.4539579, 0.7215686, 1, 0, 1,
-0.7778393, 2.181069, -0.384481, 0.7176471, 1, 0, 1,
-0.7741667, 0.375208, 1.168865, 0.7098039, 1, 0, 1,
-0.769161, 0.2423988, -2.897683, 0.7058824, 1, 0, 1,
-0.7656608, 1.173447, -0.8966303, 0.6980392, 1, 0, 1,
-0.7635728, 0.1010108, -0.9702803, 0.6901961, 1, 0, 1,
-0.7624223, -1.825318, -3.151491, 0.6862745, 1, 0, 1,
-0.7618754, -0.2775491, -1.909213, 0.6784314, 1, 0, 1,
-0.7578207, -0.3803151, -1.198544, 0.6745098, 1, 0, 1,
-0.7571128, -0.4429007, -1.558745, 0.6666667, 1, 0, 1,
-0.7552438, 0.213859, 0.3843062, 0.6627451, 1, 0, 1,
-0.7532029, 0.07488894, -2.96094, 0.654902, 1, 0, 1,
-0.7515405, 0.09260336, -0.8187985, 0.6509804, 1, 0, 1,
-0.7473463, -0.6514342, -1.73611, 0.6431373, 1, 0, 1,
-0.7453485, -0.4868641, -2.845929, 0.6392157, 1, 0, 1,
-0.7423831, 1.883922, -1.235797, 0.6313726, 1, 0, 1,
-0.7417949, -0.5464241, -2.25396, 0.627451, 1, 0, 1,
-0.7409547, -0.2429134, -0.7493156, 0.6196079, 1, 0, 1,
-0.7391097, -1.359011, -2.185231, 0.6156863, 1, 0, 1,
-0.7347834, 1.012389, -1.341706, 0.6078432, 1, 0, 1,
-0.7335749, 1.464712, -1.325815, 0.6039216, 1, 0, 1,
-0.7318168, -0.03076725, -3.774079, 0.5960785, 1, 0, 1,
-0.7304561, 0.5761176, -0.5725845, 0.5882353, 1, 0, 1,
-0.7299549, -0.2630244, -3.070712, 0.5843138, 1, 0, 1,
-0.7268575, 0.6558501, -1.662018, 0.5764706, 1, 0, 1,
-0.7258423, 0.4622883, -0.8555645, 0.572549, 1, 0, 1,
-0.7255393, 1.095435, -1.168756, 0.5647059, 1, 0, 1,
-0.7254753, 0.6842778, 0.3663574, 0.5607843, 1, 0, 1,
-0.7207568, 0.8139046, -0.9141655, 0.5529412, 1, 0, 1,
-0.7206327, -0.3118821, -0.6207939, 0.5490196, 1, 0, 1,
-0.7201506, 1.324857, -1.334479, 0.5411765, 1, 0, 1,
-0.7190518, 0.5201195, -0.7686619, 0.5372549, 1, 0, 1,
-0.714807, 1.697639, -0.4821414, 0.5294118, 1, 0, 1,
-0.7110804, -0.5814927, -2.394214, 0.5254902, 1, 0, 1,
-0.7063735, 0.7691081, -1.322902, 0.5176471, 1, 0, 1,
-0.7047306, -0.1327945, -0.9546027, 0.5137255, 1, 0, 1,
-0.7035456, -0.9426884, -2.279857, 0.5058824, 1, 0, 1,
-0.703036, -1.529925, -1.324745, 0.5019608, 1, 0, 1,
-0.7004464, -1.69758, -3.38877, 0.4941176, 1, 0, 1,
-0.7001022, -0.8188411, -2.191055, 0.4862745, 1, 0, 1,
-0.699706, 1.177751, -0.6750386, 0.4823529, 1, 0, 1,
-0.6980813, 0.06684256, -1.864119, 0.4745098, 1, 0, 1,
-0.6953442, 1.124575, -1.613894, 0.4705882, 1, 0, 1,
-0.6942196, 0.7259136, -1.430952, 0.4627451, 1, 0, 1,
-0.6885778, -1.141572, -1.693416, 0.4588235, 1, 0, 1,
-0.6847354, 0.4207242, -2.296179, 0.4509804, 1, 0, 1,
-0.6830364, 0.5541834, 0.5275026, 0.4470588, 1, 0, 1,
-0.6821691, 0.42489, -1.767666, 0.4392157, 1, 0, 1,
-0.6809357, 0.6823779, -1.742748, 0.4352941, 1, 0, 1,
-0.6793846, 0.2513317, -0.4703439, 0.427451, 1, 0, 1,
-0.6787007, 0.1680017, -0.8024383, 0.4235294, 1, 0, 1,
-0.677654, -1.799843, -3.494502, 0.4156863, 1, 0, 1,
-0.6764781, 0.3499266, -0.8312949, 0.4117647, 1, 0, 1,
-0.6723595, 0.7279333, -0.5762091, 0.4039216, 1, 0, 1,
-0.6708655, 0.2741177, -2.319203, 0.3960784, 1, 0, 1,
-0.6698895, -0.4667243, -1.684595, 0.3921569, 1, 0, 1,
-0.6659868, -0.7635501, -2.031536, 0.3843137, 1, 0, 1,
-0.6625293, -0.7761557, -3.455242, 0.3803922, 1, 0, 1,
-0.6580307, -1.713636, -2.148575, 0.372549, 1, 0, 1,
-0.6543121, 0.6704626, 0.5893829, 0.3686275, 1, 0, 1,
-0.6521921, -0.2613748, -2.516754, 0.3607843, 1, 0, 1,
-0.6471545, 0.5920016, -0.8939623, 0.3568628, 1, 0, 1,
-0.6459711, 0.5536635, -0.3622096, 0.3490196, 1, 0, 1,
-0.6407187, -0.1120816, -2.544126, 0.345098, 1, 0, 1,
-0.639294, 1.578533, 0.2711785, 0.3372549, 1, 0, 1,
-0.6366447, -0.08690415, -2.560187, 0.3333333, 1, 0, 1,
-0.6358899, -0.2018119, -1.543587, 0.3254902, 1, 0, 1,
-0.6319895, -1.622969, -2.847755, 0.3215686, 1, 0, 1,
-0.631862, -0.1181986, -3.504988, 0.3137255, 1, 0, 1,
-0.6264805, -0.7417198, -3.589125, 0.3098039, 1, 0, 1,
-0.626032, -0.7232273, -3.565872, 0.3019608, 1, 0, 1,
-0.62377, -0.1729225, -3.187295, 0.2941177, 1, 0, 1,
-0.6159067, -1.602335, -4.114456, 0.2901961, 1, 0, 1,
-0.6115702, 1.033017, -0.03326878, 0.282353, 1, 0, 1,
-0.6096385, 0.41379, -1.316785, 0.2784314, 1, 0, 1,
-0.6075321, -0.6957653, -2.66606, 0.2705882, 1, 0, 1,
-0.604211, 0.4306968, -1.613169, 0.2666667, 1, 0, 1,
-0.6021215, 0.8050277, -1.792097, 0.2588235, 1, 0, 1,
-0.6008224, 1.095684, -0.3656609, 0.254902, 1, 0, 1,
-0.5974314, -0.1968981, -2.561489, 0.2470588, 1, 0, 1,
-0.5966816, 1.150707, -0.6287692, 0.2431373, 1, 0, 1,
-0.5951257, -0.1402937, -1.106712, 0.2352941, 1, 0, 1,
-0.5869074, -0.06724638, -2.504148, 0.2313726, 1, 0, 1,
-0.5858449, 0.6048383, -1.170917, 0.2235294, 1, 0, 1,
-0.5847122, -0.5204946, -1.779686, 0.2196078, 1, 0, 1,
-0.582942, -0.1805103, -1.796553, 0.2117647, 1, 0, 1,
-0.5825636, -1.063154, -2.344886, 0.2078431, 1, 0, 1,
-0.5810042, -0.7180527, -1.569546, 0.2, 1, 0, 1,
-0.578023, 0.7275566, -1.86767, 0.1921569, 1, 0, 1,
-0.577774, 0.9696693, -0.5737633, 0.1882353, 1, 0, 1,
-0.5758486, 0.3868791, -2.698447, 0.1803922, 1, 0, 1,
-0.5664932, -1.305413, -3.310872, 0.1764706, 1, 0, 1,
-0.56557, -1.67416, -2.569344, 0.1686275, 1, 0, 1,
-0.5545139, 0.6275831, 0.23889, 0.1647059, 1, 0, 1,
-0.5544457, 0.5896436, -1.251879, 0.1568628, 1, 0, 1,
-0.5390804, 0.5174087, 0.2180929, 0.1529412, 1, 0, 1,
-0.5382454, 1.547506, 0.1240429, 0.145098, 1, 0, 1,
-0.537829, -0.8780885, -3.87509, 0.1411765, 1, 0, 1,
-0.5360275, 0.6529253, -0.6824164, 0.1333333, 1, 0, 1,
-0.5240832, 0.8930681, -1.65708, 0.1294118, 1, 0, 1,
-0.5240137, 0.771919, -1.429358, 0.1215686, 1, 0, 1,
-0.5201701, 0.3609959, 0.3073092, 0.1176471, 1, 0, 1,
-0.5170262, -0.8961079, -4.197546, 0.1098039, 1, 0, 1,
-0.510821, -1.008523, -3.502028, 0.1058824, 1, 0, 1,
-0.5057429, -1.780631, -2.742623, 0.09803922, 1, 0, 1,
-0.5014403, 1.345729, 2.494271, 0.09019608, 1, 0, 1,
-0.496002, -1.189674, -1.51549, 0.08627451, 1, 0, 1,
-0.4929012, 0.3264948, -0.810196, 0.07843138, 1, 0, 1,
-0.4928857, 0.9895093, -0.2159118, 0.07450981, 1, 0, 1,
-0.4927849, 1.564425, 1.244901, 0.06666667, 1, 0, 1,
-0.4918588, -0.01121736, -1.740198, 0.0627451, 1, 0, 1,
-0.4890436, 1.022589, -1.384286, 0.05490196, 1, 0, 1,
-0.4844819, -0.3046272, -3.491048, 0.05098039, 1, 0, 1,
-0.4836823, -0.1101386, -1.126034, 0.04313726, 1, 0, 1,
-0.4824091, 0.1893422, -0.7024419, 0.03921569, 1, 0, 1,
-0.479001, -0.4708827, -1.181179, 0.03137255, 1, 0, 1,
-0.4786597, -2.761535, -4.796261, 0.02745098, 1, 0, 1,
-0.4781289, -0.3318296, -1.637978, 0.01960784, 1, 0, 1,
-0.4773369, 0.1549488, -0.7068831, 0.01568628, 1, 0, 1,
-0.4626867, 0.3616709, -1.368488, 0.007843138, 1, 0, 1,
-0.4615295, -0.202141, -2.338704, 0.003921569, 1, 0, 1,
-0.4614014, -0.06701279, -1.54077, 0, 1, 0.003921569, 1,
-0.4561657, 1.148959, -1.297022, 0, 1, 0.01176471, 1,
-0.4551802, -0.2130378, -1.123753, 0, 1, 0.01568628, 1,
-0.4542849, -1.131259, -2.304958, 0, 1, 0.02352941, 1,
-0.4541175, -2.160749, -3.797408, 0, 1, 0.02745098, 1,
-0.4499577, -0.09097381, -3.210397, 0, 1, 0.03529412, 1,
-0.4447762, -1.122642, -2.589874, 0, 1, 0.03921569, 1,
-0.4335235, -0.04819531, -1.884512, 0, 1, 0.04705882, 1,
-0.4306967, 0.6421691, -2.6524, 0, 1, 0.05098039, 1,
-0.4289046, -1.392525, -4.571482, 0, 1, 0.05882353, 1,
-0.4253682, -0.7195449, -2.249592, 0, 1, 0.0627451, 1,
-0.4230946, 0.561267, 0.48573, 0, 1, 0.07058824, 1,
-0.4208905, 0.9932048, -0.5947447, 0, 1, 0.07450981, 1,
-0.4181702, 0.0773987, -1.941132, 0, 1, 0.08235294, 1,
-0.4177658, 1.00301, -0.01838733, 0, 1, 0.08627451, 1,
-0.4164007, -0.2558385, -1.605684, 0, 1, 0.09411765, 1,
-0.4115373, -0.8897782, -4.375791, 0, 1, 0.1019608, 1,
-0.4097234, -0.2195814, -2.560033, 0, 1, 0.1058824, 1,
-0.4094748, 0.3304398, -0.1366585, 0, 1, 0.1137255, 1,
-0.4046094, 0.06611286, -0.844867, 0, 1, 0.1176471, 1,
-0.4039359, -0.2016827, -1.740643, 0, 1, 0.1254902, 1,
-0.4000046, -0.6117933, -2.383375, 0, 1, 0.1294118, 1,
-0.3960328, 0.226761, -0.3794115, 0, 1, 0.1372549, 1,
-0.3949002, 1.946741, -0.08801319, 0, 1, 0.1411765, 1,
-0.3923912, -0.3383363, -0.2553639, 0, 1, 0.1490196, 1,
-0.3917151, 1.425709, -0.5574808, 0, 1, 0.1529412, 1,
-0.3860656, -1.495449, -1.317723, 0, 1, 0.1607843, 1,
-0.3823168, 0.4003579, 0.5378382, 0, 1, 0.1647059, 1,
-0.3809527, 1.510027, -0.4589683, 0, 1, 0.172549, 1,
-0.3793729, 0.9696073, -0.3176055, 0, 1, 0.1764706, 1,
-0.3783991, 0.009923613, -1.521112, 0, 1, 0.1843137, 1,
-0.3775631, 0.7329232, 0.2261551, 0, 1, 0.1882353, 1,
-0.375917, -0.2221051, -2.51276, 0, 1, 0.1960784, 1,
-0.3756599, -0.1704747, -2.994791, 0, 1, 0.2039216, 1,
-0.3685153, 0.7143328, -0.9588818, 0, 1, 0.2078431, 1,
-0.3684475, 0.05455243, -0.04419415, 0, 1, 0.2156863, 1,
-0.366227, 0.3741942, -0.9000387, 0, 1, 0.2196078, 1,
-0.3638801, 0.1461349, -0.0667525, 0, 1, 0.227451, 1,
-0.3589994, 1.009667, 0.1467447, 0, 1, 0.2313726, 1,
-0.3586402, -0.1826182, -1.481853, 0, 1, 0.2392157, 1,
-0.355749, 0.2317202, -1.22737, 0, 1, 0.2431373, 1,
-0.3482983, 1.544548, -0.9320693, 0, 1, 0.2509804, 1,
-0.3477604, -0.3832097, -1.363236, 0, 1, 0.254902, 1,
-0.3471002, -0.2910346, -3.07673, 0, 1, 0.2627451, 1,
-0.3426544, -0.6415038, -3.212586, 0, 1, 0.2666667, 1,
-0.3407241, -1.722221, -2.553602, 0, 1, 0.2745098, 1,
-0.3373595, 1.388341, -0.6557131, 0, 1, 0.2784314, 1,
-0.3235349, -1.359034, -3.431424, 0, 1, 0.2862745, 1,
-0.3229107, 0.01777721, -2.18876, 0, 1, 0.2901961, 1,
-0.322005, -1.367892, -3.20379, 0, 1, 0.2980392, 1,
-0.3175269, 0.4812801, -1.398106, 0, 1, 0.3058824, 1,
-0.3085506, 1.466387, 2.174587, 0, 1, 0.3098039, 1,
-0.3063688, -0.2903803, -1.790919, 0, 1, 0.3176471, 1,
-0.3058214, -1.291058, -2.409981, 0, 1, 0.3215686, 1,
-0.3052917, -0.7146416, -2.428873, 0, 1, 0.3294118, 1,
-0.3047474, -0.1056421, -1.200753, 0, 1, 0.3333333, 1,
-0.2954179, -0.9081502, -1.753749, 0, 1, 0.3411765, 1,
-0.290444, 0.5670194, -0.1871348, 0, 1, 0.345098, 1,
-0.28854, 0.03309835, -2.974569, 0, 1, 0.3529412, 1,
-0.285682, -2.196686, -4.055447, 0, 1, 0.3568628, 1,
-0.2846637, -0.960771, -4.5002, 0, 1, 0.3647059, 1,
-0.2809797, -0.05977294, -1.914037, 0, 1, 0.3686275, 1,
-0.2804539, 0.02308469, -0.9289951, 0, 1, 0.3764706, 1,
-0.2777447, 0.03549484, -1.289978, 0, 1, 0.3803922, 1,
-0.2698439, -0.556487, -4.464324, 0, 1, 0.3882353, 1,
-0.2669926, -1.677268, -0.435315, 0, 1, 0.3921569, 1,
-0.2669559, -1.162753, -1.806075, 0, 1, 0.4, 1,
-0.2656733, 0.2872491, 0.3584218, 0, 1, 0.4078431, 1,
-0.2655628, -0.6783283, -4.401582, 0, 1, 0.4117647, 1,
-0.2644509, 0.5555919, 0.3513977, 0, 1, 0.4196078, 1,
-0.2605146, -0.2860904, -3.017195, 0, 1, 0.4235294, 1,
-0.2586126, -2.163372, -2.666664, 0, 1, 0.4313726, 1,
-0.2562805, 0.8755053, -0.16529, 0, 1, 0.4352941, 1,
-0.2536943, 2.275764, 0.4533318, 0, 1, 0.4431373, 1,
-0.2534046, -0.7975689, -3.19075, 0, 1, 0.4470588, 1,
-0.2527485, 0.6260281, -1.33277, 0, 1, 0.454902, 1,
-0.2501405, 0.9718064, -2.220688, 0, 1, 0.4588235, 1,
-0.245498, 1.404444, 1.331674, 0, 1, 0.4666667, 1,
-0.2416414, 0.6934541, -1.211661, 0, 1, 0.4705882, 1,
-0.2372141, 0.190107, -0.01325386, 0, 1, 0.4784314, 1,
-0.2366748, -0.8646222, -2.508582, 0, 1, 0.4823529, 1,
-0.2366, -0.6013211, -2.34125, 0, 1, 0.4901961, 1,
-0.2341314, -0.9322733, -3.986383, 0, 1, 0.4941176, 1,
-0.226357, -0.2374395, -4.02056, 0, 1, 0.5019608, 1,
-0.2219185, -0.5442023, -2.146049, 0, 1, 0.509804, 1,
-0.2024369, 0.04280894, -2.134077, 0, 1, 0.5137255, 1,
-0.201791, 0.07417549, -0.507412, 0, 1, 0.5215687, 1,
-0.1906198, 0.7855992, -0.9195428, 0, 1, 0.5254902, 1,
-0.1905104, -0.4799128, -2.833753, 0, 1, 0.5333334, 1,
-0.1869908, 2.023438, -0.1210789, 0, 1, 0.5372549, 1,
-0.1830014, -1.215978, -2.980441, 0, 1, 0.5450981, 1,
-0.1809548, 0.1029268, -0.8391415, 0, 1, 0.5490196, 1,
-0.1777999, 0.3482303, 0.123336, 0, 1, 0.5568628, 1,
-0.1774029, -0.2075845, -3.130274, 0, 1, 0.5607843, 1,
-0.1750525, 0.9285477, 0.4679183, 0, 1, 0.5686275, 1,
-0.173893, 0.2832174, -0.8045102, 0, 1, 0.572549, 1,
-0.1733034, 0.1152121, -0.111845, 0, 1, 0.5803922, 1,
-0.1684513, 0.6208432, 0.2910648, 0, 1, 0.5843138, 1,
-0.1664173, 0.4265208, -1.37806, 0, 1, 0.5921569, 1,
-0.1644158, -0.008753501, -1.800956, 0, 1, 0.5960785, 1,
-0.1607264, -0.2205949, -3.145972, 0, 1, 0.6039216, 1,
-0.1565211, 0.05783096, -0.9658696, 0, 1, 0.6117647, 1,
-0.1533701, 1.623682, -0.1293732, 0, 1, 0.6156863, 1,
-0.1524396, 0.7805668, 2.398195, 0, 1, 0.6235294, 1,
-0.1507767, 0.32229, -1.526989, 0, 1, 0.627451, 1,
-0.1504285, 0.05567476, -0.1562517, 0, 1, 0.6352941, 1,
-0.1493719, -0.4869675, -3.63883, 0, 1, 0.6392157, 1,
-0.1489559, 0.1119715, -0.3275186, 0, 1, 0.6470588, 1,
-0.1477673, -0.9159111, -3.177684, 0, 1, 0.6509804, 1,
-0.1473681, 2.2884, 0.6444411, 0, 1, 0.6588235, 1,
-0.1458456, 2.218003, -0.5081959, 0, 1, 0.6627451, 1,
-0.1457071, 0.7021281, 0.065836, 0, 1, 0.6705883, 1,
-0.1410716, -0.573199, -3.143531, 0, 1, 0.6745098, 1,
-0.1402678, -1.229598, -3.692528, 0, 1, 0.682353, 1,
-0.1378428, 0.7264885, -0.4376967, 0, 1, 0.6862745, 1,
-0.1311735, 0.6672723, 0.4487678, 0, 1, 0.6941177, 1,
-0.1311187, 0.05389858, -0.8150729, 0, 1, 0.7019608, 1,
-0.1295114, -1.49347, -4.07598, 0, 1, 0.7058824, 1,
-0.12707, 0.2979084, -0.4924463, 0, 1, 0.7137255, 1,
-0.1231813, -0.9780324, -2.536276, 0, 1, 0.7176471, 1,
-0.1220884, 0.3958703, -0.7971693, 0, 1, 0.7254902, 1,
-0.1196981, 0.2129644, 1.460312, 0, 1, 0.7294118, 1,
-0.1173346, -0.00207832, -1.058702, 0, 1, 0.7372549, 1,
-0.1097343, 0.5455474, -0.07994221, 0, 1, 0.7411765, 1,
-0.109074, 0.506577, 0.5784087, 0, 1, 0.7490196, 1,
-0.1040422, -1.81529, -2.239799, 0, 1, 0.7529412, 1,
-0.1038016, 1.011112, 0.9245309, 0, 1, 0.7607843, 1,
-0.09936647, -0.52315, -1.736245, 0, 1, 0.7647059, 1,
-0.09361371, -2.653746, -2.136904, 0, 1, 0.772549, 1,
-0.09197484, 0.1379924, 0.5589815, 0, 1, 0.7764706, 1,
-0.09192992, 0.4932277, -0.2326977, 0, 1, 0.7843137, 1,
-0.09174229, 0.2360384, -0.2349322, 0, 1, 0.7882353, 1,
-0.08794513, 0.5188191, 0.3338795, 0, 1, 0.7960784, 1,
-0.08663294, -1.612997, -3.156028, 0, 1, 0.8039216, 1,
-0.08250194, -0.01772052, -2.661504, 0, 1, 0.8078431, 1,
-0.07730614, 0.9017946, 0.1895936, 0, 1, 0.8156863, 1,
-0.07670846, 0.1467365, 0.9187431, 0, 1, 0.8196079, 1,
-0.07325173, -0.1304528, -3.388895, 0, 1, 0.827451, 1,
-0.07295638, 2.182887, 2.160999, 0, 1, 0.8313726, 1,
-0.07001238, -0.6028728, -2.386708, 0, 1, 0.8392157, 1,
-0.06941666, 0.4676195, -2.263223, 0, 1, 0.8431373, 1,
-0.06012611, 0.8874982, 0.7973339, 0, 1, 0.8509804, 1,
-0.0588426, 0.4353042, 1.320969, 0, 1, 0.854902, 1,
-0.05733094, 0.3211387, 1.021581, 0, 1, 0.8627451, 1,
-0.04935619, 1.824187, -0.04970584, 0, 1, 0.8666667, 1,
-0.04668758, 0.9732171, -0.8085638, 0, 1, 0.8745098, 1,
-0.04646217, -1.057138, -2.792457, 0, 1, 0.8784314, 1,
-0.04299189, -1.458877, -1.215904, 0, 1, 0.8862745, 1,
-0.0428489, -0.2250909, -1.128877, 0, 1, 0.8901961, 1,
-0.03938188, -0.696457, -2.737472, 0, 1, 0.8980392, 1,
-0.03106141, -1.447039, -2.359328, 0, 1, 0.9058824, 1,
-0.02986939, -0.04102209, -0.8785879, 0, 1, 0.9098039, 1,
-0.02945026, 0.9459004, 0.7020506, 0, 1, 0.9176471, 1,
-0.02915505, 0.1063534, -0.1901318, 0, 1, 0.9215686, 1,
-0.0178359, 0.4787028, 0.2393184, 0, 1, 0.9294118, 1,
-0.01675162, -0.6780298, -2.24015, 0, 1, 0.9333333, 1,
-0.01609055, -0.2405636, -3.754026, 0, 1, 0.9411765, 1,
-0.01482091, 0.05923572, 0.5201306, 0, 1, 0.945098, 1,
-0.01439107, -0.4066677, -2.836362, 0, 1, 0.9529412, 1,
-0.01262671, 0.6562023, -0.730475, 0, 1, 0.9568627, 1,
-0.01072297, 0.590055, -0.4478141, 0, 1, 0.9647059, 1,
-0.01067356, 1.491704, 0.3706168, 0, 1, 0.9686275, 1,
-0.009804715, -0.2215976, -4.767186, 0, 1, 0.9764706, 1,
-0.009075706, 0.2014211, -1.796423, 0, 1, 0.9803922, 1,
-0.008821793, -0.122092, -2.597806, 0, 1, 0.9882353, 1,
-0.00871007, -2.025183, -1.788055, 0, 1, 0.9921569, 1,
-0.00812186, 0.7924725, 1.077477, 0, 1, 1, 1,
-0.00793254, 1.949695, -1.210612, 0, 0.9921569, 1, 1,
-0.005707694, 0.2341956, -2.761065, 0, 0.9882353, 1, 1,
0.003138337, -0.3239043, 4.005861, 0, 0.9803922, 1, 1,
0.003746979, 1.136791, 1.24318, 0, 0.9764706, 1, 1,
0.007190317, -0.7952897, 1.266104, 0, 0.9686275, 1, 1,
0.007411608, -0.1711668, 0.6629829, 0, 0.9647059, 1, 1,
0.01104685, -0.0166301, 2.473593, 0, 0.9568627, 1, 1,
0.01143486, 0.8785506, 0.08423, 0, 0.9529412, 1, 1,
0.01905198, 0.2782056, 0.4448672, 0, 0.945098, 1, 1,
0.01968009, 1.42758, 0.5859742, 0, 0.9411765, 1, 1,
0.02048084, 0.06122344, 2.221934, 0, 0.9333333, 1, 1,
0.02165035, -0.2450201, 2.776914, 0, 0.9294118, 1, 1,
0.0216926, -0.6684489, 3.725393, 0, 0.9215686, 1, 1,
0.02215558, -0.964012, 1.223158, 0, 0.9176471, 1, 1,
0.02446307, 1.26322, -0.1994552, 0, 0.9098039, 1, 1,
0.02473974, 0.0003375725, 1.440676, 0, 0.9058824, 1, 1,
0.02962506, 0.1770708, 0.4288432, 0, 0.8980392, 1, 1,
0.03357264, -0.946556, 3.326722, 0, 0.8901961, 1, 1,
0.03552122, -0.2500692, 3.919271, 0, 0.8862745, 1, 1,
0.0388846, -1.126734, 3.313325, 0, 0.8784314, 1, 1,
0.0398404, 0.2626855, -0.3453965, 0, 0.8745098, 1, 1,
0.04267685, -0.9306443, 2.877027, 0, 0.8666667, 1, 1,
0.04286104, -0.2048153, 2.109807, 0, 0.8627451, 1, 1,
0.04645179, -1.018141, 4.282734, 0, 0.854902, 1, 1,
0.04764061, -0.6595688, 3.238652, 0, 0.8509804, 1, 1,
0.05101912, 0.3191563, 1.83571, 0, 0.8431373, 1, 1,
0.05479734, 1.074844, 0.2367658, 0, 0.8392157, 1, 1,
0.05512476, 1.071195, 1.034207, 0, 0.8313726, 1, 1,
0.05596679, 2.847023, 0.2949523, 0, 0.827451, 1, 1,
0.06044699, 0.04333141, 0.3979344, 0, 0.8196079, 1, 1,
0.06620129, -0.2592354, 2.753, 0, 0.8156863, 1, 1,
0.07786842, 1.728049, 0.219375, 0, 0.8078431, 1, 1,
0.07854612, 2.19168, -0.9595514, 0, 0.8039216, 1, 1,
0.07957926, -1.22673, 3.727104, 0, 0.7960784, 1, 1,
0.08034554, 0.2985769, 0.6288964, 0, 0.7882353, 1, 1,
0.08051565, -0.5360922, 2.065524, 0, 0.7843137, 1, 1,
0.083245, 0.2452304, 1.101546, 0, 0.7764706, 1, 1,
0.08325607, 0.5670167, 1.186965, 0, 0.772549, 1, 1,
0.08342006, -1.400581, 1.814501, 0, 0.7647059, 1, 1,
0.08466718, 0.3735878, -1.352085, 0, 0.7607843, 1, 1,
0.08651748, 1.056353, -2.823629, 0, 0.7529412, 1, 1,
0.08700498, -0.1665803, 4.515469, 0, 0.7490196, 1, 1,
0.0894291, 0.05333282, 2.370906, 0, 0.7411765, 1, 1,
0.09204442, 2.282213, 0.8425456, 0, 0.7372549, 1, 1,
0.09277277, 0.3560409, -1.111299, 0, 0.7294118, 1, 1,
0.09990262, 0.323698, -0.9450356, 0, 0.7254902, 1, 1,
0.1012788, 1.545952, -0.5465361, 0, 0.7176471, 1, 1,
0.1022566, 0.2004538, -1.149816, 0, 0.7137255, 1, 1,
0.1084387, -0.78691, 2.373741, 0, 0.7058824, 1, 1,
0.11196, -0.9960856, 3.964385, 0, 0.6980392, 1, 1,
0.1161168, -1.763976, 1.824157, 0, 0.6941177, 1, 1,
0.1162027, 0.1517471, 1.580882, 0, 0.6862745, 1, 1,
0.1188909, -0.6959268, 1.769268, 0, 0.682353, 1, 1,
0.1196886, 1.346263, 1.381715, 0, 0.6745098, 1, 1,
0.1208884, -1.003801, 2.923778, 0, 0.6705883, 1, 1,
0.1247, -1.275144, 2.430588, 0, 0.6627451, 1, 1,
0.1255003, -0.1274818, 1.391979, 0, 0.6588235, 1, 1,
0.1280682, 0.8210942, 0.7691957, 0, 0.6509804, 1, 1,
0.128799, -0.5423892, 3.534706, 0, 0.6470588, 1, 1,
0.1402771, 0.2147691, -0.2443528, 0, 0.6392157, 1, 1,
0.1456195, 0.373823, 1.572481, 0, 0.6352941, 1, 1,
0.1478116, -1.256952, 4.117052, 0, 0.627451, 1, 1,
0.148222, 1.203157, 0.1834098, 0, 0.6235294, 1, 1,
0.1488465, 1.37697, 1.462182, 0, 0.6156863, 1, 1,
0.1497219, 0.379036, 1.419483, 0, 0.6117647, 1, 1,
0.1531351, -0.5180897, 3.25645, 0, 0.6039216, 1, 1,
0.1573648, -1.384119, 2.433093, 0, 0.5960785, 1, 1,
0.1582021, 0.8716344, -0.2056331, 0, 0.5921569, 1, 1,
0.1585501, 1.602136, 0.6218386, 0, 0.5843138, 1, 1,
0.1598928, -1.200454, 4.063034, 0, 0.5803922, 1, 1,
0.160345, 0.352278, 0.8127149, 0, 0.572549, 1, 1,
0.1639253, -0.08601472, 2.490646, 0, 0.5686275, 1, 1,
0.1667097, 0.7732939, 0.8154014, 0, 0.5607843, 1, 1,
0.1674824, 0.3764885, -0.100758, 0, 0.5568628, 1, 1,
0.1695049, 0.6527421, 0.1837557, 0, 0.5490196, 1, 1,
0.1701062, -0.9803855, 3.364526, 0, 0.5450981, 1, 1,
0.1733519, -0.1903817, 2.196178, 0, 0.5372549, 1, 1,
0.1756438, -1.491002, 2.83898, 0, 0.5333334, 1, 1,
0.1775721, 0.2750122, 0.5416774, 0, 0.5254902, 1, 1,
0.1795901, 0.7908141, 2.167783, 0, 0.5215687, 1, 1,
0.1797863, 0.7435887, -1.685535, 0, 0.5137255, 1, 1,
0.1812299, -1.208568, 2.958197, 0, 0.509804, 1, 1,
0.181296, 0.1327998, 0.8587255, 0, 0.5019608, 1, 1,
0.1815823, -2.718641, 3.767482, 0, 0.4941176, 1, 1,
0.1862588, -0.324334, 2.154165, 0, 0.4901961, 1, 1,
0.2034011, -0.8368511, 2.43308, 0, 0.4823529, 1, 1,
0.2042933, -0.3981898, 3.102164, 0, 0.4784314, 1, 1,
0.2103331, -0.4115782, 0.9296376, 0, 0.4705882, 1, 1,
0.2131822, -0.932308, 4.686511, 0, 0.4666667, 1, 1,
0.2178349, -0.04531448, 2.791715, 0, 0.4588235, 1, 1,
0.2222928, -0.112282, 2.745288, 0, 0.454902, 1, 1,
0.2257785, -1.704531, 2.101333, 0, 0.4470588, 1, 1,
0.2267975, 1.170443, 0.1493361, 0, 0.4431373, 1, 1,
0.2288543, 0.216368, 0.03640361, 0, 0.4352941, 1, 1,
0.2322258, -0.6233616, 3.984872, 0, 0.4313726, 1, 1,
0.2322368, -1.872558, 4.863195, 0, 0.4235294, 1, 1,
0.2322826, -1.569103, 5.276558, 0, 0.4196078, 1, 1,
0.2330073, -0.5249879, 1.711953, 0, 0.4117647, 1, 1,
0.2366589, -0.8024726, 2.861717, 0, 0.4078431, 1, 1,
0.2386227, -0.9937524, 1.927113, 0, 0.4, 1, 1,
0.2401756, 0.3298129, 0.09950539, 0, 0.3921569, 1, 1,
0.2526336, -0.5034727, 2.008954, 0, 0.3882353, 1, 1,
0.259816, 1.487437, 0.7534963, 0, 0.3803922, 1, 1,
0.26295, -1.242011, 4.395278, 0, 0.3764706, 1, 1,
0.2644948, -0.7902899, 2.91595, 0, 0.3686275, 1, 1,
0.2670681, -0.7689638, 1.192548, 0, 0.3647059, 1, 1,
0.2679333, -0.6528078, 1.971002, 0, 0.3568628, 1, 1,
0.2702642, 0.1708719, 0.5350586, 0, 0.3529412, 1, 1,
0.2714959, -0.5695581, 1.549564, 0, 0.345098, 1, 1,
0.2738546, 0.3189762, -0.2285391, 0, 0.3411765, 1, 1,
0.2780961, -2.336886, 2.30243, 0, 0.3333333, 1, 1,
0.2799004, 0.642146, 0.8171013, 0, 0.3294118, 1, 1,
0.2858824, -1.483699, 3.92194, 0, 0.3215686, 1, 1,
0.2877087, -0.5288004, 2.198652, 0, 0.3176471, 1, 1,
0.2878215, -0.3628151, 0.9076664, 0, 0.3098039, 1, 1,
0.2896213, 1.203729, 0.09032234, 0, 0.3058824, 1, 1,
0.2914533, 0.8220053, -0.9494275, 0, 0.2980392, 1, 1,
0.2974429, 0.1925175, 1.235, 0, 0.2901961, 1, 1,
0.2998965, 1.819381, -0.2524178, 0, 0.2862745, 1, 1,
0.3025526, -0.02288153, 2.778383, 0, 0.2784314, 1, 1,
0.3060968, -0.1436212, 2.190731, 0, 0.2745098, 1, 1,
0.3176349, -0.1459729, 2.053407, 0, 0.2666667, 1, 1,
0.3220471, 0.7001067, 2.020665, 0, 0.2627451, 1, 1,
0.3233559, -0.008217081, 2.445009, 0, 0.254902, 1, 1,
0.326687, 1.9726, 1.324212, 0, 0.2509804, 1, 1,
0.3301314, 3.219427, -2.477335, 0, 0.2431373, 1, 1,
0.3316589, -0.07666794, 1.691028, 0, 0.2392157, 1, 1,
0.3357405, 0.928337, -0.1627457, 0, 0.2313726, 1, 1,
0.3442575, 0.5951065, 1.803314, 0, 0.227451, 1, 1,
0.3452619, -0.4348243, 2.352932, 0, 0.2196078, 1, 1,
0.3463139, 1.315219, 1.479602, 0, 0.2156863, 1, 1,
0.3465459, -0.3478658, 2.523047, 0, 0.2078431, 1, 1,
0.3572329, 0.3871016, 0.4410812, 0, 0.2039216, 1, 1,
0.3587457, 0.5244697, 2.177115, 0, 0.1960784, 1, 1,
0.359931, -1.037024, 2.516781, 0, 0.1882353, 1, 1,
0.3611344, 2.22777, -1.267473, 0, 0.1843137, 1, 1,
0.3624245, 1.086115, 0.5809651, 0, 0.1764706, 1, 1,
0.3628531, 0.3269784, 1.374625, 0, 0.172549, 1, 1,
0.3652992, -0.01012674, 1.444546, 0, 0.1647059, 1, 1,
0.3678609, -0.8063409, 3.293673, 0, 0.1607843, 1, 1,
0.3681617, -0.01276766, 0.3066204, 0, 0.1529412, 1, 1,
0.3725834, -1.687884, 1.992824, 0, 0.1490196, 1, 1,
0.3748027, 1.761961, 2.05519, 0, 0.1411765, 1, 1,
0.3794648, 0.215331, 1.562073, 0, 0.1372549, 1, 1,
0.3808749, -0.3617446, 1.42349, 0, 0.1294118, 1, 1,
0.3821405, 0.4982159, 1.276277, 0, 0.1254902, 1, 1,
0.3858247, 0.4904258, -0.4031543, 0, 0.1176471, 1, 1,
0.3866834, 0.5252104, 1.256341, 0, 0.1137255, 1, 1,
0.3884786, 0.5001355, 1.304309, 0, 0.1058824, 1, 1,
0.3932389, -0.08179721, 0.2812379, 0, 0.09803922, 1, 1,
0.3937463, -1.719998, 2.311667, 0, 0.09411765, 1, 1,
0.3944916, 0.7546468, 0.04965916, 0, 0.08627451, 1, 1,
0.3976852, 0.06854615, 1.67283, 0, 0.08235294, 1, 1,
0.3984915, 1.246653, 0.8978365, 0, 0.07450981, 1, 1,
0.4010393, -0.6949168, 3.234209, 0, 0.07058824, 1, 1,
0.4039136, 0.9702731, -0.6427112, 0, 0.0627451, 1, 1,
0.4045637, 2.367811, 1.73106, 0, 0.05882353, 1, 1,
0.4058446, 2.315249, 0.1048466, 0, 0.05098039, 1, 1,
0.406044, 0.2075837, 0.8041968, 0, 0.04705882, 1, 1,
0.4073351, -0.007128352, 2.553196, 0, 0.03921569, 1, 1,
0.408895, -1.044369, 0.9316617, 0, 0.03529412, 1, 1,
0.4127225, -1.36993, 2.648151, 0, 0.02745098, 1, 1,
0.4141295, 0.6462553, 0.9270325, 0, 0.02352941, 1, 1,
0.415255, 0.2874376, 0.8463848, 0, 0.01568628, 1, 1,
0.4154394, 0.06995802, 2.396113, 0, 0.01176471, 1, 1,
0.4167552, 0.8880571, 1.283014, 0, 0.003921569, 1, 1,
0.4183908, -0.01058157, 2.932835, 0.003921569, 0, 1, 1,
0.4201577, 1.270237, 0.4472147, 0.007843138, 0, 1, 1,
0.4227936, -0.9463817, 2.962119, 0.01568628, 0, 1, 1,
0.4243775, 0.6746817, 2.27918, 0.01960784, 0, 1, 1,
0.4247361, 0.4463202, 0.1596003, 0.02745098, 0, 1, 1,
0.4247501, 0.8558687, 1.598949, 0.03137255, 0, 1, 1,
0.4338467, -0.4006677, 4.641458, 0.03921569, 0, 1, 1,
0.4361815, -0.5865076, 2.643358, 0.04313726, 0, 1, 1,
0.4365008, -0.3582715, 1.453117, 0.05098039, 0, 1, 1,
0.4398377, -0.1220669, 1.018743, 0.05490196, 0, 1, 1,
0.4444587, -0.2000221, 0.9512791, 0.0627451, 0, 1, 1,
0.4447179, 1.007928, 1.066023, 0.06666667, 0, 1, 1,
0.4469631, 0.424109, 2.006775, 0.07450981, 0, 1, 1,
0.4477962, 0.357208, 2.437387, 0.07843138, 0, 1, 1,
0.448072, 0.5004517, 1.152208, 0.08627451, 0, 1, 1,
0.4488385, 0.6637859, 1.784943, 0.09019608, 0, 1, 1,
0.4556871, 0.711224, 1.234517, 0.09803922, 0, 1, 1,
0.4585918, -0.5652009, 3.762955, 0.1058824, 0, 1, 1,
0.4631387, 0.08581854, 1.244757, 0.1098039, 0, 1, 1,
0.469183, 1.436758, 0.6007905, 0.1176471, 0, 1, 1,
0.4696634, -2.516628, 2.001084, 0.1215686, 0, 1, 1,
0.4746653, -1.150634, 1.712107, 0.1294118, 0, 1, 1,
0.4760612, -0.9786751, 2.0488, 0.1333333, 0, 1, 1,
0.4783987, 0.6500965, 2.408576, 0.1411765, 0, 1, 1,
0.4851344, -0.6161683, 2.426662, 0.145098, 0, 1, 1,
0.4898712, -0.1380481, 1.429263, 0.1529412, 0, 1, 1,
0.4914128, -0.8958954, 2.449519, 0.1568628, 0, 1, 1,
0.4943941, 2.063936, 0.6415027, 0.1647059, 0, 1, 1,
0.494428, 0.6365548, -0.8430831, 0.1686275, 0, 1, 1,
0.4976959, -0.6843228, 2.120811, 0.1764706, 0, 1, 1,
0.4985279, 0.7149568, 0.3354137, 0.1803922, 0, 1, 1,
0.5014492, -0.8627114, 2.760783, 0.1882353, 0, 1, 1,
0.5041317, 0.6412563, 0.6243494, 0.1921569, 0, 1, 1,
0.5066885, 0.3747855, 0.2672361, 0.2, 0, 1, 1,
0.5100608, -1.855639, 3.623726, 0.2078431, 0, 1, 1,
0.5101953, 0.7415178, -1.081865, 0.2117647, 0, 1, 1,
0.5130093, 0.3581417, -0.4116831, 0.2196078, 0, 1, 1,
0.5147616, 0.7331922, 0.7448658, 0.2235294, 0, 1, 1,
0.5193442, -1.531662, 4.440603, 0.2313726, 0, 1, 1,
0.5215253, 0.220358, 1.333967, 0.2352941, 0, 1, 1,
0.5240758, 0.9216121, -0.6968291, 0.2431373, 0, 1, 1,
0.525801, -0.781617, 1.844432, 0.2470588, 0, 1, 1,
0.5273885, -1.393807, 2.812951, 0.254902, 0, 1, 1,
0.5277123, 0.2463968, 0.2161269, 0.2588235, 0, 1, 1,
0.5348089, -0.8109132, 2.739321, 0.2666667, 0, 1, 1,
0.5378056, 0.1597402, 1.522124, 0.2705882, 0, 1, 1,
0.5407901, -0.9568942, 4.192768, 0.2784314, 0, 1, 1,
0.5414086, -0.4915526, 1.672276, 0.282353, 0, 1, 1,
0.5421353, -0.03086523, 2.793494, 0.2901961, 0, 1, 1,
0.5455674, -0.7233003, 1.956871, 0.2941177, 0, 1, 1,
0.5491512, -0.5267017, 2.781384, 0.3019608, 0, 1, 1,
0.5693036, 1.01431, 0.9622415, 0.3098039, 0, 1, 1,
0.5709578, 0.6374545, -0.799279, 0.3137255, 0, 1, 1,
0.573507, -1.431427, 3.405243, 0.3215686, 0, 1, 1,
0.5766411, -1.40348, 3.528399, 0.3254902, 0, 1, 1,
0.5772337, 0.8213024, -0.3005321, 0.3333333, 0, 1, 1,
0.5793568, -0.4829027, 3.19126, 0.3372549, 0, 1, 1,
0.5896696, 0.963985, 0.9414834, 0.345098, 0, 1, 1,
0.5921787, -0.5820723, 2.644938, 0.3490196, 0, 1, 1,
0.5974298, -0.4009655, 4.422188, 0.3568628, 0, 1, 1,
0.6069764, 0.2636036, 1.367187, 0.3607843, 0, 1, 1,
0.6074471, 0.8411403, -1.019226, 0.3686275, 0, 1, 1,
0.608734, -0.09306234, 1.244811, 0.372549, 0, 1, 1,
0.6094133, 1.481091, 0.5303975, 0.3803922, 0, 1, 1,
0.6095185, 0.4879833, 1.704201, 0.3843137, 0, 1, 1,
0.6103367, 0.21924, 2.116254, 0.3921569, 0, 1, 1,
0.6156209, -0.08444809, 0.9178319, 0.3960784, 0, 1, 1,
0.6167634, -0.7738796, 2.060072, 0.4039216, 0, 1, 1,
0.618683, 1.121467, -0.4670804, 0.4117647, 0, 1, 1,
0.6187453, 2.046158, 0.8496072, 0.4156863, 0, 1, 1,
0.620479, 1.261981, 1.13053, 0.4235294, 0, 1, 1,
0.6213009, 1.323354, 0.3897437, 0.427451, 0, 1, 1,
0.6258299, -2.732161, 3.533884, 0.4352941, 0, 1, 1,
0.6263946, -0.8323413, 2.238365, 0.4392157, 0, 1, 1,
0.6267057, -0.2899888, 3.667299, 0.4470588, 0, 1, 1,
0.6274072, -0.09535021, 1.356663, 0.4509804, 0, 1, 1,
0.6290221, 1.06126, -0.5077181, 0.4588235, 0, 1, 1,
0.6298258, -0.5452549, 1.191253, 0.4627451, 0, 1, 1,
0.6313593, 0.5538439, 1.657095, 0.4705882, 0, 1, 1,
0.6320409, -0.04026951, 1.834554, 0.4745098, 0, 1, 1,
0.6328602, -0.6903605, 2.746224, 0.4823529, 0, 1, 1,
0.6360554, -0.9330313, 0.939278, 0.4862745, 0, 1, 1,
0.6555032, 0.5920051, 1.808619, 0.4941176, 0, 1, 1,
0.6564489, -0.3641063, 2.852936, 0.5019608, 0, 1, 1,
0.6566851, 0.08500808, 2.275525, 0.5058824, 0, 1, 1,
0.6574285, 1.063187, -0.5105098, 0.5137255, 0, 1, 1,
0.6591914, 0.4135802, 2.920094, 0.5176471, 0, 1, 1,
0.6604998, 1.379256, 0.3663689, 0.5254902, 0, 1, 1,
0.6630129, -1.390642, 4.523365, 0.5294118, 0, 1, 1,
0.6739053, -0.6914582, 3.174328, 0.5372549, 0, 1, 1,
0.6764188, 0.5064657, 0.6595092, 0.5411765, 0, 1, 1,
0.67863, 0.2084669, 0.6392118, 0.5490196, 0, 1, 1,
0.6805174, -0.002044248, 1.955648, 0.5529412, 0, 1, 1,
0.6831697, 0.8961265, 0.180161, 0.5607843, 0, 1, 1,
0.6835546, 0.4238207, 0.7879034, 0.5647059, 0, 1, 1,
0.6840215, 0.02028468, 2.064424, 0.572549, 0, 1, 1,
0.6868575, 1.669649, -0.1384877, 0.5764706, 0, 1, 1,
0.6869531, -1.273299, 2.661975, 0.5843138, 0, 1, 1,
0.6877033, 0.7481617, 0.1794, 0.5882353, 0, 1, 1,
0.6891224, -2.214042, 4.275017, 0.5960785, 0, 1, 1,
0.6892528, 0.6918125, 1.022605, 0.6039216, 0, 1, 1,
0.7019155, 0.04289955, 2.889003, 0.6078432, 0, 1, 1,
0.7050908, 1.141638, 1.3666, 0.6156863, 0, 1, 1,
0.718444, 2.079237, -0.1020229, 0.6196079, 0, 1, 1,
0.7185366, 0.1702391, 0.09694622, 0.627451, 0, 1, 1,
0.7196808, 0.9304507, 1.738103, 0.6313726, 0, 1, 1,
0.7327545, -0.05226881, -0.6280819, 0.6392157, 0, 1, 1,
0.7339723, 0.5906258, -0.005284559, 0.6431373, 0, 1, 1,
0.735538, -0.5644973, 1.247324, 0.6509804, 0, 1, 1,
0.7425957, -0.6893359, 1.583123, 0.654902, 0, 1, 1,
0.746796, -1.233502, 3.817263, 0.6627451, 0, 1, 1,
0.7468718, 0.06170313, 1.449087, 0.6666667, 0, 1, 1,
0.7487809, 0.5687147, 1.03703, 0.6745098, 0, 1, 1,
0.7547246, -0.4784255, 1.992944, 0.6784314, 0, 1, 1,
0.7579823, -0.3393522, 2.458285, 0.6862745, 0, 1, 1,
0.7585143, 0.3308696, 0.5063266, 0.6901961, 0, 1, 1,
0.758737, 1.081469, 0.089467, 0.6980392, 0, 1, 1,
0.7648005, -0.4265389, 0.2215355, 0.7058824, 0, 1, 1,
0.7662722, -1.394834, 0.8104638, 0.7098039, 0, 1, 1,
0.7688025, -1.434218, 3.966038, 0.7176471, 0, 1, 1,
0.7722152, -0.06290707, 2.339198, 0.7215686, 0, 1, 1,
0.7743217, 0.6812131, 1.996317, 0.7294118, 0, 1, 1,
0.7779858, 1.058249, 0.4566683, 0.7333333, 0, 1, 1,
0.7892255, -0.5473826, 2.40177, 0.7411765, 0, 1, 1,
0.7907886, -1.345146, 2.664964, 0.7450981, 0, 1, 1,
0.7951756, 0.09230818, 1.282094, 0.7529412, 0, 1, 1,
0.8096984, -2.256207, 3.106255, 0.7568628, 0, 1, 1,
0.8098084, 1.245354, 0.7917504, 0.7647059, 0, 1, 1,
0.8244038, -2.259977, 4.862106, 0.7686275, 0, 1, 1,
0.8324185, 0.7702576, 1.279915, 0.7764706, 0, 1, 1,
0.8327709, 1.50112, 1.477545, 0.7803922, 0, 1, 1,
0.8486964, 0.7705691, -0.3606307, 0.7882353, 0, 1, 1,
0.8495715, 0.677936, -0.3986346, 0.7921569, 0, 1, 1,
0.8514045, -0.7564564, 1.554908, 0.8, 0, 1, 1,
0.8538344, 0.107654, 2.699233, 0.8078431, 0, 1, 1,
0.8560611, -1.891655, 2.641942, 0.8117647, 0, 1, 1,
0.8565846, -0.2829286, 2.269459, 0.8196079, 0, 1, 1,
0.86335, -0.6300518, 1.913687, 0.8235294, 0, 1, 1,
0.8652453, -0.2008517, 3.081079, 0.8313726, 0, 1, 1,
0.8712334, 1.257162, 1.134145, 0.8352941, 0, 1, 1,
0.876451, 0.1674606, 2.167336, 0.8431373, 0, 1, 1,
0.8824856, 0.2665348, 0.8522012, 0.8470588, 0, 1, 1,
0.8857713, -0.2508726, 1.384986, 0.854902, 0, 1, 1,
0.8867671, -0.3663703, 1.862641, 0.8588235, 0, 1, 1,
0.8910787, -0.3826632, 1.875482, 0.8666667, 0, 1, 1,
0.8971574, -0.2108191, 2.252189, 0.8705882, 0, 1, 1,
0.9001331, 0.6036894, 2.750334, 0.8784314, 0, 1, 1,
0.9038504, -1.252045, 2.555576, 0.8823529, 0, 1, 1,
0.9101002, 0.5033078, 1.742683, 0.8901961, 0, 1, 1,
0.9109604, 0.7515758, 1.048843, 0.8941177, 0, 1, 1,
0.9149346, -0.03806803, 1.701131, 0.9019608, 0, 1, 1,
0.918981, 1.685993, 1.2194, 0.9098039, 0, 1, 1,
0.920065, -0.1823735, 3.201095, 0.9137255, 0, 1, 1,
0.927159, -0.7980981, 2.360023, 0.9215686, 0, 1, 1,
0.9290066, 2.13889, 1.44476, 0.9254902, 0, 1, 1,
0.9297808, 0.6494489, 0.6129373, 0.9333333, 0, 1, 1,
0.9460208, 0.5448775, 2.915935, 0.9372549, 0, 1, 1,
0.9478228, 0.1637848, 0.2681834, 0.945098, 0, 1, 1,
0.9584697, -0.9567769, 2.405625, 0.9490196, 0, 1, 1,
0.9622511, 0.8884501, -0.3090062, 0.9568627, 0, 1, 1,
0.9685817, -0.2389032, 2.742584, 0.9607843, 0, 1, 1,
0.9711944, 0.1274179, -0.6175895, 0.9686275, 0, 1, 1,
0.9767001, 1.542455, 1.998674, 0.972549, 0, 1, 1,
0.9840847, -1.020336, 2.085676, 0.9803922, 0, 1, 1,
0.9894921, 0.4699095, 0.5728675, 0.9843137, 0, 1, 1,
0.9896216, 0.7219127, -0.01146411, 0.9921569, 0, 1, 1,
0.9924355, -1.724373, 2.112065, 0.9960784, 0, 1, 1,
0.9933369, -0.5993338, 2.557229, 1, 0, 0.9960784, 1,
0.9941756, -0.7811561, 2.064044, 1, 0, 0.9882353, 1,
0.9967102, -0.7051407, 1.105445, 1, 0, 0.9843137, 1,
0.9972723, -0.3124261, 0.6883738, 1, 0, 0.9764706, 1,
0.9991563, -0.322832, 1.60857, 1, 0, 0.972549, 1,
1.005552, 0.6302407, 0.8461402, 1, 0, 0.9647059, 1,
1.019296, -0.05694876, 0.5971842, 1, 0, 0.9607843, 1,
1.020823, -0.1932701, 1.488905, 1, 0, 0.9529412, 1,
1.033563, 0.237947, 1.082206, 1, 0, 0.9490196, 1,
1.039649, -0.01158998, 0.8329594, 1, 0, 0.9411765, 1,
1.040292, -0.5331639, 0.2454645, 1, 0, 0.9372549, 1,
1.041565, -1.051408, 3.580741, 1, 0, 0.9294118, 1,
1.068771, -0.9155984, 1.666803, 1, 0, 0.9254902, 1,
1.0711, 0.1378562, 2.359028, 1, 0, 0.9176471, 1,
1.078211, -0.0434126, 1.506282, 1, 0, 0.9137255, 1,
1.079701, 0.9206752, -0.627605, 1, 0, 0.9058824, 1,
1.080402, 0.3870667, 1.157281, 1, 0, 0.9019608, 1,
1.080475, 0.7439798, 0.4388269, 1, 0, 0.8941177, 1,
1.08151, -0.5080165, 2.287919, 1, 0, 0.8862745, 1,
1.0828, -0.7820234, 2.604815, 1, 0, 0.8823529, 1,
1.084641, 0.1832929, 2.860905, 1, 0, 0.8745098, 1,
1.086984, 0.3170169, 2.312362, 1, 0, 0.8705882, 1,
1.089424, -0.5646966, 1.782497, 1, 0, 0.8627451, 1,
1.094127, -0.02016956, 2.456508, 1, 0, 0.8588235, 1,
1.100966, -1.101897, 1.603786, 1, 0, 0.8509804, 1,
1.101359, -1.571366, 0.3260641, 1, 0, 0.8470588, 1,
1.101843, 0.2014235, 4.014505, 1, 0, 0.8392157, 1,
1.105704, 0.2479534, 0.7877762, 1, 0, 0.8352941, 1,
1.112231, 0.2439819, 0.7372913, 1, 0, 0.827451, 1,
1.124969, -1.644854, 1.262377, 1, 0, 0.8235294, 1,
1.126221, -1.484169, 3.647744, 1, 0, 0.8156863, 1,
1.134415, -0.01586074, 2.246434, 1, 0, 0.8117647, 1,
1.134581, -0.03864574, 0.8685331, 1, 0, 0.8039216, 1,
1.138019, -0.797146, 1.872259, 1, 0, 0.7960784, 1,
1.138048, 1.970482, 0.4691081, 1, 0, 0.7921569, 1,
1.142278, -0.3188727, 2.751189, 1, 0, 0.7843137, 1,
1.144693, 0.1433678, 2.049709, 1, 0, 0.7803922, 1,
1.152006, 2.246831, 1.316333, 1, 0, 0.772549, 1,
1.153103, -1.1598, 1.710031, 1, 0, 0.7686275, 1,
1.157338, 0.7848846, -0.51596, 1, 0, 0.7607843, 1,
1.15779, -1.420754, 3.544149, 1, 0, 0.7568628, 1,
1.168182, 0.415751, -0.1697805, 1, 0, 0.7490196, 1,
1.170955, -0.7565502, 1.31496, 1, 0, 0.7450981, 1,
1.179068, -0.5610604, 2.588324, 1, 0, 0.7372549, 1,
1.18642, 0.6686702, 0.5678213, 1, 0, 0.7333333, 1,
1.187009, -0.6381171, 1.985817, 1, 0, 0.7254902, 1,
1.189712, -0.1802646, 0.7863924, 1, 0, 0.7215686, 1,
1.190067, 1.293769, 1.364132, 1, 0, 0.7137255, 1,
1.191183, -0.1487467, 3.16479, 1, 0, 0.7098039, 1,
1.192006, -0.3375682, 1.375981, 1, 0, 0.7019608, 1,
1.196625, 0.6813971, 2.472714, 1, 0, 0.6941177, 1,
1.201815, 0.5171704, 1.033453, 1, 0, 0.6901961, 1,
1.203424, 0.6047662, 1.318306, 1, 0, 0.682353, 1,
1.204564, 0.7514811, 1.131004, 1, 0, 0.6784314, 1,
1.206419, -0.3730215, 1.758001, 1, 0, 0.6705883, 1,
1.212515, -0.3610516, -0.102886, 1, 0, 0.6666667, 1,
1.228281, 0.6417947, 2.623645, 1, 0, 0.6588235, 1,
1.228829, 0.7991843, 1.426193, 1, 0, 0.654902, 1,
1.235088, 0.4465479, 0.2247796, 1, 0, 0.6470588, 1,
1.238782, 1.03671, 0.6560528, 1, 0, 0.6431373, 1,
1.243151, -0.095901, 2.585584, 1, 0, 0.6352941, 1,
1.243915, 0.6368422, 3.140344, 1, 0, 0.6313726, 1,
1.245764, -0.5622882, 2.339891, 1, 0, 0.6235294, 1,
1.247451, -1.022756, 3.428629, 1, 0, 0.6196079, 1,
1.256333, 0.6297235, -0.9550385, 1, 0, 0.6117647, 1,
1.257522, 1.272532, 0.04293565, 1, 0, 0.6078432, 1,
1.259384, -0.7376493, 0.1643041, 1, 0, 0.6, 1,
1.280573, -0.4802949, 2.249043, 1, 0, 0.5921569, 1,
1.290819, 0.07732559, 1.92884, 1, 0, 0.5882353, 1,
1.299106, 1.009069, 2.859133, 1, 0, 0.5803922, 1,
1.304322, -1.275356, 3.452915, 1, 0, 0.5764706, 1,
1.314174, -0.8301117, 3.603762, 1, 0, 0.5686275, 1,
1.334439, -0.4569321, 4.488973, 1, 0, 0.5647059, 1,
1.33847, -0.4337566, 0.3775915, 1, 0, 0.5568628, 1,
1.354045, -1.07305, 0.778959, 1, 0, 0.5529412, 1,
1.357977, -1.82878, 3.274254, 1, 0, 0.5450981, 1,
1.358709, 1.724545, 1.229235, 1, 0, 0.5411765, 1,
1.365595, -0.9031547, 1.4905, 1, 0, 0.5333334, 1,
1.367184, 0.6005286, 0.1024579, 1, 0, 0.5294118, 1,
1.373052, -1.461271, 0.8466001, 1, 0, 0.5215687, 1,
1.374616, 1.13527, 1.89753, 1, 0, 0.5176471, 1,
1.376747, 0.3378654, 2.407302, 1, 0, 0.509804, 1,
1.39195, 0.9212635, 0.8685001, 1, 0, 0.5058824, 1,
1.418216, -1.37023, 2.163939, 1, 0, 0.4980392, 1,
1.425544, -0.6020205, 1.400251, 1, 0, 0.4901961, 1,
1.433546, 0.2263914, 0.7104121, 1, 0, 0.4862745, 1,
1.433585, 0.3913379, 2.469625, 1, 0, 0.4784314, 1,
1.437431, 0.4662305, 0.9433693, 1, 0, 0.4745098, 1,
1.448135, 0.2993833, 2.954291, 1, 0, 0.4666667, 1,
1.455463, -0.757767, 3.948796, 1, 0, 0.4627451, 1,
1.459607, -1.627504, 1.408436, 1, 0, 0.454902, 1,
1.464566, -0.4533267, 2.401094, 1, 0, 0.4509804, 1,
1.467332, -0.4585875, 2.485773, 1, 0, 0.4431373, 1,
1.469488, -0.5765957, 2.1635, 1, 0, 0.4392157, 1,
1.471808, -0.1565952, 0.422116, 1, 0, 0.4313726, 1,
1.483654, -0.202352, 1.027784, 1, 0, 0.427451, 1,
1.492199, 0.1779264, 0.7593678, 1, 0, 0.4196078, 1,
1.509465, 0.944232, -2.443337, 1, 0, 0.4156863, 1,
1.520185, -0.2025633, 2.758249, 1, 0, 0.4078431, 1,
1.523772, 1.811566, 0.9686724, 1, 0, 0.4039216, 1,
1.530187, -0.4825831, 0.2405223, 1, 0, 0.3960784, 1,
1.538877, 0.1080647, 2.558433, 1, 0, 0.3882353, 1,
1.541227, 0.3567046, -0.7634412, 1, 0, 0.3843137, 1,
1.545909, -0.3242745, 0.3464707, 1, 0, 0.3764706, 1,
1.547771, 0.7370937, 1.402, 1, 0, 0.372549, 1,
1.55823, 0.1576968, 2.505767, 1, 0, 0.3647059, 1,
1.559441, 1.150749, 2.04658, 1, 0, 0.3607843, 1,
1.56471, -1.269135, 2.612524, 1, 0, 0.3529412, 1,
1.573712, -0.9095067, 2.183579, 1, 0, 0.3490196, 1,
1.580649, -0.02166634, 3.077376, 1, 0, 0.3411765, 1,
1.585716, -1.880943, 2.319944, 1, 0, 0.3372549, 1,
1.597521, 0.6744557, 0.6191645, 1, 0, 0.3294118, 1,
1.601192, 1.474955, 0.7438664, 1, 0, 0.3254902, 1,
1.602892, 0.5688838, 2.954068, 1, 0, 0.3176471, 1,
1.628044, 1.020314, 1.94436, 1, 0, 0.3137255, 1,
1.638449, 1.63134, 2.215657, 1, 0, 0.3058824, 1,
1.645426, 0.4800308, -0.55093, 1, 0, 0.2980392, 1,
1.657365, 1.803493, 0.02121481, 1, 0, 0.2941177, 1,
1.657711, 0.7515217, 1.350839, 1, 0, 0.2862745, 1,
1.658558, 0.4787335, 1.655876, 1, 0, 0.282353, 1,
1.659344, -1.079398, 2.810184, 1, 0, 0.2745098, 1,
1.660991, 0.3580204, 0.5136172, 1, 0, 0.2705882, 1,
1.675698, -0.9656712, 2.736115, 1, 0, 0.2627451, 1,
1.690613, 0.267158, 1.199728, 1, 0, 0.2588235, 1,
1.695262, 0.3124387, 3.363343, 1, 0, 0.2509804, 1,
1.702171, 0.5994425, 1.581545, 1, 0, 0.2470588, 1,
1.704388, 0.3325474, 2.069099, 1, 0, 0.2392157, 1,
1.70946, -1.502632, 3.516319, 1, 0, 0.2352941, 1,
1.715285, -0.3483484, 0.9824598, 1, 0, 0.227451, 1,
1.723101, 0.741006, 2.356013, 1, 0, 0.2235294, 1,
1.723393, -0.2385175, 3.180823, 1, 0, 0.2156863, 1,
1.7357, 0.446822, 2.12198, 1, 0, 0.2117647, 1,
1.793912, 1.443965, 1.128844, 1, 0, 0.2039216, 1,
1.795371, 0.1873592, 1.604762, 1, 0, 0.1960784, 1,
1.825818, -0.703852, 1.354339, 1, 0, 0.1921569, 1,
1.836773, 0.9966842, -0.7243329, 1, 0, 0.1843137, 1,
1.853124, -0.5779548, 2.552344, 1, 0, 0.1803922, 1,
1.853903, 0.3580601, 0.5499674, 1, 0, 0.172549, 1,
1.879909, -1.224446, 2.697959, 1, 0, 0.1686275, 1,
1.881079, 0.6303915, 0.385715, 1, 0, 0.1607843, 1,
1.886033, -0.1919968, 3.143465, 1, 0, 0.1568628, 1,
1.895673, -1.787415, 1.457624, 1, 0, 0.1490196, 1,
1.905018, 1.271201, 0.8553699, 1, 0, 0.145098, 1,
1.907111, 1.228569, 2.116729, 1, 0, 0.1372549, 1,
1.930174, -0.6925464, 2.383043, 1, 0, 0.1333333, 1,
1.932346, -0.6802973, 2.007412, 1, 0, 0.1254902, 1,
1.934189, 1.536556, 0.2305582, 1, 0, 0.1215686, 1,
1.978776, 0.2681276, 1.000629, 1, 0, 0.1137255, 1,
2.015221, 0.03177492, 2.250322, 1, 0, 0.1098039, 1,
2.021762, 1.183876, -0.4343027, 1, 0, 0.1019608, 1,
2.022307, -0.9095559, 1.008349, 1, 0, 0.09411765, 1,
2.033838, -0.9749998, 2.490688, 1, 0, 0.09019608, 1,
2.141012, -0.7916818, 1.277888, 1, 0, 0.08235294, 1,
2.149719, 0.6160232, 1.980881, 1, 0, 0.07843138, 1,
2.244512, 0.3581797, 1.993632, 1, 0, 0.07058824, 1,
2.261594, -0.8774428, 3.149643, 1, 0, 0.06666667, 1,
2.265724, 1.202883, 1.250261, 1, 0, 0.05882353, 1,
2.293393, -1.994824, 0.9399161, 1, 0, 0.05490196, 1,
2.421245, 1.608539, 0.8160424, 1, 0, 0.04705882, 1,
2.432398, -0.7084494, 1.277845, 1, 0, 0.04313726, 1,
2.437429, -0.1396828, 1.363943, 1, 0, 0.03529412, 1,
2.640829, 0.6663366, 1.486008, 1, 0, 0.03137255, 1,
2.761475, -0.1590545, 1.706923, 1, 0, 0.02352941, 1,
2.891605, -0.3606801, 0.6882426, 1, 0, 0.01960784, 1,
3.008536, 0.5912435, 1.558709, 1, 0, 0.01176471, 1,
3.263548, 0.1636268, 1.468173, 1, 0, 0.007843138, 1
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
0.06673551, -3.775308, -6.85708, 0, -0.5, 0.5, 0.5,
0.06673551, -3.775308, -6.85708, 1, -0.5, 0.5, 0.5,
0.06673551, -3.775308, -6.85708, 1, 1.5, 0.5, 0.5,
0.06673551, -3.775308, -6.85708, 0, 1.5, 0.5, 0.5
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
-4.213797, 0.2289463, -6.85708, 0, -0.5, 0.5, 0.5,
-4.213797, 0.2289463, -6.85708, 1, -0.5, 0.5, 0.5,
-4.213797, 0.2289463, -6.85708, 1, 1.5, 0.5, 0.5,
-4.213797, 0.2289463, -6.85708, 0, 1.5, 0.5, 0.5
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
-4.213797, -3.775308, 0.08902621, 0, -0.5, 0.5, 0.5,
-4.213797, -3.775308, 0.08902621, 1, -0.5, 0.5, 0.5,
-4.213797, -3.775308, 0.08902621, 1, 1.5, 0.5, 0.5,
-4.213797, -3.775308, 0.08902621, 0, 1.5, 0.5, 0.5
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
-3, -2.851249, -5.254132,
3, -2.851249, -5.254132,
-3, -2.851249, -5.254132,
-3, -3.005259, -5.52129,
-2, -2.851249, -5.254132,
-2, -3.005259, -5.52129,
-1, -2.851249, -5.254132,
-1, -3.005259, -5.52129,
0, -2.851249, -5.254132,
0, -3.005259, -5.52129,
1, -2.851249, -5.254132,
1, -3.005259, -5.52129,
2, -2.851249, -5.254132,
2, -3.005259, -5.52129,
3, -2.851249, -5.254132,
3, -3.005259, -5.52129
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
-3, -3.313278, -6.055606, 0, -0.5, 0.5, 0.5,
-3, -3.313278, -6.055606, 1, -0.5, 0.5, 0.5,
-3, -3.313278, -6.055606, 1, 1.5, 0.5, 0.5,
-3, -3.313278, -6.055606, 0, 1.5, 0.5, 0.5,
-2, -3.313278, -6.055606, 0, -0.5, 0.5, 0.5,
-2, -3.313278, -6.055606, 1, -0.5, 0.5, 0.5,
-2, -3.313278, -6.055606, 1, 1.5, 0.5, 0.5,
-2, -3.313278, -6.055606, 0, 1.5, 0.5, 0.5,
-1, -3.313278, -6.055606, 0, -0.5, 0.5, 0.5,
-1, -3.313278, -6.055606, 1, -0.5, 0.5, 0.5,
-1, -3.313278, -6.055606, 1, 1.5, 0.5, 0.5,
-1, -3.313278, -6.055606, 0, 1.5, 0.5, 0.5,
0, -3.313278, -6.055606, 0, -0.5, 0.5, 0.5,
0, -3.313278, -6.055606, 1, -0.5, 0.5, 0.5,
0, -3.313278, -6.055606, 1, 1.5, 0.5, 0.5,
0, -3.313278, -6.055606, 0, 1.5, 0.5, 0.5,
1, -3.313278, -6.055606, 0, -0.5, 0.5, 0.5,
1, -3.313278, -6.055606, 1, -0.5, 0.5, 0.5,
1, -3.313278, -6.055606, 1, 1.5, 0.5, 0.5,
1, -3.313278, -6.055606, 0, 1.5, 0.5, 0.5,
2, -3.313278, -6.055606, 0, -0.5, 0.5, 0.5,
2, -3.313278, -6.055606, 1, -0.5, 0.5, 0.5,
2, -3.313278, -6.055606, 1, 1.5, 0.5, 0.5,
2, -3.313278, -6.055606, 0, 1.5, 0.5, 0.5,
3, -3.313278, -6.055606, 0, -0.5, 0.5, 0.5,
3, -3.313278, -6.055606, 1, -0.5, 0.5, 0.5,
3, -3.313278, -6.055606, 1, 1.5, 0.5, 0.5,
3, -3.313278, -6.055606, 0, 1.5, 0.5, 0.5
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
-3.225981, -2, -5.254132,
-3.225981, 3, -5.254132,
-3.225981, -2, -5.254132,
-3.390617, -2, -5.52129,
-3.225981, -1, -5.254132,
-3.390617, -1, -5.52129,
-3.225981, 0, -5.254132,
-3.390617, 0, -5.52129,
-3.225981, 1, -5.254132,
-3.390617, 1, -5.52129,
-3.225981, 2, -5.254132,
-3.390617, 2, -5.52129,
-3.225981, 3, -5.254132,
-3.390617, 3, -5.52129
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
-3.719889, -2, -6.055606, 0, -0.5, 0.5, 0.5,
-3.719889, -2, -6.055606, 1, -0.5, 0.5, 0.5,
-3.719889, -2, -6.055606, 1, 1.5, 0.5, 0.5,
-3.719889, -2, -6.055606, 0, 1.5, 0.5, 0.5,
-3.719889, -1, -6.055606, 0, -0.5, 0.5, 0.5,
-3.719889, -1, -6.055606, 1, -0.5, 0.5, 0.5,
-3.719889, -1, -6.055606, 1, 1.5, 0.5, 0.5,
-3.719889, -1, -6.055606, 0, 1.5, 0.5, 0.5,
-3.719889, 0, -6.055606, 0, -0.5, 0.5, 0.5,
-3.719889, 0, -6.055606, 1, -0.5, 0.5, 0.5,
-3.719889, 0, -6.055606, 1, 1.5, 0.5, 0.5,
-3.719889, 0, -6.055606, 0, 1.5, 0.5, 0.5,
-3.719889, 1, -6.055606, 0, -0.5, 0.5, 0.5,
-3.719889, 1, -6.055606, 1, -0.5, 0.5, 0.5,
-3.719889, 1, -6.055606, 1, 1.5, 0.5, 0.5,
-3.719889, 1, -6.055606, 0, 1.5, 0.5, 0.5,
-3.719889, 2, -6.055606, 0, -0.5, 0.5, 0.5,
-3.719889, 2, -6.055606, 1, -0.5, 0.5, 0.5,
-3.719889, 2, -6.055606, 1, 1.5, 0.5, 0.5,
-3.719889, 2, -6.055606, 0, 1.5, 0.5, 0.5,
-3.719889, 3, -6.055606, 0, -0.5, 0.5, 0.5,
-3.719889, 3, -6.055606, 1, -0.5, 0.5, 0.5,
-3.719889, 3, -6.055606, 1, 1.5, 0.5, 0.5,
-3.719889, 3, -6.055606, 0, 1.5, 0.5, 0.5
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
-3.225981, -2.851249, -4,
-3.225981, -2.851249, 4,
-3.225981, -2.851249, -4,
-3.390617, -3.005259, -4,
-3.225981, -2.851249, -2,
-3.390617, -3.005259, -2,
-3.225981, -2.851249, 0,
-3.390617, -3.005259, 0,
-3.225981, -2.851249, 2,
-3.390617, -3.005259, 2,
-3.225981, -2.851249, 4,
-3.390617, -3.005259, 4
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
-3.719889, -3.313278, -4, 0, -0.5, 0.5, 0.5,
-3.719889, -3.313278, -4, 1, -0.5, 0.5, 0.5,
-3.719889, -3.313278, -4, 1, 1.5, 0.5, 0.5,
-3.719889, -3.313278, -4, 0, 1.5, 0.5, 0.5,
-3.719889, -3.313278, -2, 0, -0.5, 0.5, 0.5,
-3.719889, -3.313278, -2, 1, -0.5, 0.5, 0.5,
-3.719889, -3.313278, -2, 1, 1.5, 0.5, 0.5,
-3.719889, -3.313278, -2, 0, 1.5, 0.5, 0.5,
-3.719889, -3.313278, 0, 0, -0.5, 0.5, 0.5,
-3.719889, -3.313278, 0, 1, -0.5, 0.5, 0.5,
-3.719889, -3.313278, 0, 1, 1.5, 0.5, 0.5,
-3.719889, -3.313278, 0, 0, 1.5, 0.5, 0.5,
-3.719889, -3.313278, 2, 0, -0.5, 0.5, 0.5,
-3.719889, -3.313278, 2, 1, -0.5, 0.5, 0.5,
-3.719889, -3.313278, 2, 1, 1.5, 0.5, 0.5,
-3.719889, -3.313278, 2, 0, 1.5, 0.5, 0.5,
-3.719889, -3.313278, 4, 0, -0.5, 0.5, 0.5,
-3.719889, -3.313278, 4, 1, -0.5, 0.5, 0.5,
-3.719889, -3.313278, 4, 1, 1.5, 0.5, 0.5,
-3.719889, -3.313278, 4, 0, 1.5, 0.5, 0.5
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
-3.225981, -2.851249, -5.254132,
-3.225981, 3.309142, -5.254132,
-3.225981, -2.851249, 5.432184,
-3.225981, 3.309142, 5.432184,
-3.225981, -2.851249, -5.254132,
-3.225981, -2.851249, 5.432184,
-3.225981, 3.309142, -5.254132,
-3.225981, 3.309142, 5.432184,
-3.225981, -2.851249, -5.254132,
3.359452, -2.851249, -5.254132,
-3.225981, -2.851249, 5.432184,
3.359452, -2.851249, 5.432184,
-3.225981, 3.309142, -5.254132,
3.359452, 3.309142, -5.254132,
-3.225981, 3.309142, 5.432184,
3.359452, 3.309142, 5.432184,
3.359452, -2.851249, -5.254132,
3.359452, 3.309142, -5.254132,
3.359452, -2.851249, 5.432184,
3.359452, 3.309142, 5.432184,
3.359452, -2.851249, -5.254132,
3.359452, -2.851249, 5.432184,
3.359452, 3.309142, -5.254132,
3.359452, 3.309142, 5.432184
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
var radius = 7.466487;
var distance = 33.21924;
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
mvMatrix.translate( -0.06673551, -0.2289463, -0.08902621 );
mvMatrix.scale( 1.225874, 1.310454, 0.7554438 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.21924);
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
pyrazol-5-yl_toluene<-read.table("pyrazol-5-yl_toluene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrazol-5-yl_toluene$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrazol' not found
```

```r
y<-pyrazol-5-yl_toluene$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrazol' not found
```

```r
z<-pyrazol-5-yl_toluene$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrazol' not found
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
-3.130077, -0.4076633, -2.992728, 0, 0, 1, 1, 1,
-2.970421, 0.1312354, -1.795222, 1, 0, 0, 1, 1,
-2.617897, 0.5918886, -1.925463, 1, 0, 0, 1, 1,
-2.512986, -0.6142013, -3.168995, 1, 0, 0, 1, 1,
-2.446887, -0.05592862, -1.274965, 1, 0, 0, 1, 1,
-2.445246, -1.493758, -2.156282, 1, 0, 0, 1, 1,
-2.284048, -1.329123, -1.938388, 0, 0, 0, 1, 1,
-2.231335, -0.4286462, -1.039013, 0, 0, 0, 1, 1,
-2.220849, -2.034742, -2.473106, 0, 0, 0, 1, 1,
-2.186778, 0.3835959, -1.648511, 0, 0, 0, 1, 1,
-2.10836, -0.1006386, 0.112093, 0, 0, 0, 1, 1,
-2.104031, -0.2105128, -0.5049075, 0, 0, 0, 1, 1,
-2.021988, -0.9271659, -1.447394, 0, 0, 0, 1, 1,
-1.979274, -0.2531202, -1.118815, 1, 1, 1, 1, 1,
-1.943897, -0.9662111, -2.790271, 1, 1, 1, 1, 1,
-1.930252, -0.3651584, -1.589088, 1, 1, 1, 1, 1,
-1.878361, 0.1200034, -1.866984, 1, 1, 1, 1, 1,
-1.866829, -0.5670581, -1.920804, 1, 1, 1, 1, 1,
-1.852064, 1.532484, -0.5801856, 1, 1, 1, 1, 1,
-1.805541, -0.7222166, -3.21447, 1, 1, 1, 1, 1,
-1.78004, 0.8094956, -0.5838037, 1, 1, 1, 1, 1,
-1.773039, -1.524164, -1.911592, 1, 1, 1, 1, 1,
-1.771682, -0.1090687, -3.184325, 1, 1, 1, 1, 1,
-1.760859, -1.177933, -1.518028, 1, 1, 1, 1, 1,
-1.759252, 1.673506, -1.243744, 1, 1, 1, 1, 1,
-1.756999, 0.7952638, -1.475773, 1, 1, 1, 1, 1,
-1.754733, 0.9884289, -0.9766816, 1, 1, 1, 1, 1,
-1.731958, 0.1276937, -2.519125, 1, 1, 1, 1, 1,
-1.731799, -1.314287, -3.226241, 0, 0, 1, 1, 1,
-1.716838, 2.60743, -0.5715512, 1, 0, 0, 1, 1,
-1.713987, 0.2227363, -1.267669, 1, 0, 0, 1, 1,
-1.710074, -1.517277, -1.389744, 1, 0, 0, 1, 1,
-1.707551, 0.8690341, -2.105946, 1, 0, 0, 1, 1,
-1.690938, 2.613672, -0.4043247, 1, 0, 0, 1, 1,
-1.686685, -0.3339328, -1.928229, 0, 0, 0, 1, 1,
-1.682263, -0.1942438, -2.620641, 0, 0, 0, 1, 1,
-1.667401, -0.01666812, -1.363495, 0, 0, 0, 1, 1,
-1.66499, 0.5970491, -1.271137, 0, 0, 0, 1, 1,
-1.619932, 0.642439, -0.7793834, 0, 0, 0, 1, 1,
-1.616787, -0.08070095, -1.021361, 0, 0, 0, 1, 1,
-1.597755, -0.9436393, -0.9877068, 0, 0, 0, 1, 1,
-1.591843, -1.238871, -0.8724799, 1, 1, 1, 1, 1,
-1.583019, 2.20041, 1.156901, 1, 1, 1, 1, 1,
-1.558514, 0.5383563, -1.820521, 1, 1, 1, 1, 1,
-1.54665, -1.007775, -2.093844, 1, 1, 1, 1, 1,
-1.543687, -0.9735372, -2.040986, 1, 1, 1, 1, 1,
-1.539687, 0.9637889, -1.487948, 1, 1, 1, 1, 1,
-1.529783, -0.1444415, -1.631597, 1, 1, 1, 1, 1,
-1.526661, -1.438184, -1.430001, 1, 1, 1, 1, 1,
-1.519796, -1.05587, -1.551605, 1, 1, 1, 1, 1,
-1.515597, 0.7601081, -0.5247162, 1, 1, 1, 1, 1,
-1.512991, -0.5441248, -2.128242, 1, 1, 1, 1, 1,
-1.510313, -0.892534, -2.498111, 1, 1, 1, 1, 1,
-1.485875, 0.09420857, -1.184227, 1, 1, 1, 1, 1,
-1.485854, 0.677743, -0.3724043, 1, 1, 1, 1, 1,
-1.475789, 0.9947862, -0.03700278, 1, 1, 1, 1, 1,
-1.469256, -0.2354214, -2.212005, 0, 0, 1, 1, 1,
-1.456589, -1.031386, -3.522455, 1, 0, 0, 1, 1,
-1.453952, 0.6851862, -1.31955, 1, 0, 0, 1, 1,
-1.449394, -0.5435399, -1.976079, 1, 0, 0, 1, 1,
-1.449354, 0.298688, -1.985573, 1, 0, 0, 1, 1,
-1.449153, 1.547567, -0.1396406, 1, 0, 0, 1, 1,
-1.448776, 1.092622, 0.05217259, 0, 0, 0, 1, 1,
-1.446184, 2.773665, -1.348056, 0, 0, 0, 1, 1,
-1.444071, -0.4071806, -2.446872, 0, 0, 0, 1, 1,
-1.430373, 0.5808933, -3.076969, 0, 0, 0, 1, 1,
-1.424427, 0.8468607, -1.365741, 0, 0, 0, 1, 1,
-1.419071, 0.3775674, -1.793929, 0, 0, 0, 1, 1,
-1.418202, -0.2778833, -1.270135, 0, 0, 0, 1, 1,
-1.410788, -0.03735259, -2.282995, 1, 1, 1, 1, 1,
-1.410332, 0.9770767, 0.3916544, 1, 1, 1, 1, 1,
-1.408326, 0.1422911, -0.7234885, 1, 1, 1, 1, 1,
-1.403865, -0.4306207, -2.687459, 1, 1, 1, 1, 1,
-1.386701, 0.7533098, -3.168208, 1, 1, 1, 1, 1,
-1.382886, 0.002499017, -2.072865, 1, 1, 1, 1, 1,
-1.379788, -0.582843, -1.821952, 1, 1, 1, 1, 1,
-1.378607, 0.0911449, 0.574096, 1, 1, 1, 1, 1,
-1.369907, 1.36157, -1.315454, 1, 1, 1, 1, 1,
-1.357204, -0.7014237, -1.134244, 1, 1, 1, 1, 1,
-1.347189, -0.8844289, -0.957532, 1, 1, 1, 1, 1,
-1.344992, -1.571609, -3.128719, 1, 1, 1, 1, 1,
-1.337239, 0.4696398, -0.5222439, 1, 1, 1, 1, 1,
-1.33173, 2.322581, 0.2136056, 1, 1, 1, 1, 1,
-1.331615, 0.08951546, -2.205399, 1, 1, 1, 1, 1,
-1.329157, 2.194906, 0.05201369, 0, 0, 1, 1, 1,
-1.326249, -0.2293259, -2.874514, 1, 0, 0, 1, 1,
-1.312765, -0.4266569, -1.805942, 1, 0, 0, 1, 1,
-1.308582, 0.5991471, -1.921735, 1, 0, 0, 1, 1,
-1.303422, 0.1338053, -0.7116837, 1, 0, 0, 1, 1,
-1.296865, 1.033074, -1.807513, 1, 0, 0, 1, 1,
-1.291543, -0.139437, -1.857652, 0, 0, 0, 1, 1,
-1.291127, 1.005656, -0.5879058, 0, 0, 0, 1, 1,
-1.287503, 1.045849, -1.955988, 0, 0, 0, 1, 1,
-1.285273, 0.03323818, -1.921549, 0, 0, 0, 1, 1,
-1.284509, 0.752341, -0.09543519, 0, 0, 0, 1, 1,
-1.277283, 1.204253, -1.118731, 0, 0, 0, 1, 1,
-1.271127, 0.5532893, -0.8624845, 0, 0, 0, 1, 1,
-1.268332, -1.368459, -2.350468, 1, 1, 1, 1, 1,
-1.26681, 0.9247674, -1.751656, 1, 1, 1, 1, 1,
-1.263131, -0.5540571, -0.8362414, 1, 1, 1, 1, 1,
-1.256125, -0.1414117, -1.676172, 1, 1, 1, 1, 1,
-1.254336, 1.169452, 0.4982708, 1, 1, 1, 1, 1,
-1.244707, -0.1626455, -2.445867, 1, 1, 1, 1, 1,
-1.242168, 0.5652897, 0.2060478, 1, 1, 1, 1, 1,
-1.242126, 0.1924802, -2.647505, 1, 1, 1, 1, 1,
-1.239959, -0.2138685, -2.294021, 1, 1, 1, 1, 1,
-1.238508, 0.4535312, -1.859253, 1, 1, 1, 1, 1,
-1.237097, 0.4479439, -1.489079, 1, 1, 1, 1, 1,
-1.220463, 0.8707438, -1.347277, 1, 1, 1, 1, 1,
-1.219565, -0.6625172, -0.6155629, 1, 1, 1, 1, 1,
-1.212447, -1.484007, -3.057582, 1, 1, 1, 1, 1,
-1.205836, -1.025002, -2.110775, 1, 1, 1, 1, 1,
-1.201793, 1.939891, -0.5740859, 0, 0, 1, 1, 1,
-1.199368, -2.204179, -2.710541, 1, 0, 0, 1, 1,
-1.188858, 0.8947236, 1.065002, 1, 0, 0, 1, 1,
-1.184983, 1.268671, 0.9753283, 1, 0, 0, 1, 1,
-1.178301, -0.1182536, -2.156181, 1, 0, 0, 1, 1,
-1.175259, 0.04593453, -1.599506, 1, 0, 0, 1, 1,
-1.173647, -0.01580445, -1.981877, 0, 0, 0, 1, 1,
-1.160748, 0.5778021, -0.513952, 0, 0, 0, 1, 1,
-1.156879, 0.09466887, -1.868973, 0, 0, 0, 1, 1,
-1.142705, 2.009014, -1.163654, 0, 0, 0, 1, 1,
-1.139243, -0.01821348, -0.3034744, 0, 0, 0, 1, 1,
-1.131326, 0.8541391, -3.414354, 0, 0, 0, 1, 1,
-1.12668, 0.07998115, 0.4178322, 0, 0, 0, 1, 1,
-1.125902, -1.732239, -0.5655546, 1, 1, 1, 1, 1,
-1.123424, 1.230492, -1.091804, 1, 1, 1, 1, 1,
-1.11413, -2.191569, -4.24809, 1, 1, 1, 1, 1,
-1.098359, 1.756373, 0.1956868, 1, 1, 1, 1, 1,
-1.097267, 0.7984844, -1.187104, 1, 1, 1, 1, 1,
-1.089437, 1.013506, -1.129506, 1, 1, 1, 1, 1,
-1.080745, 1.669176, -1.189555, 1, 1, 1, 1, 1,
-1.071443, -0.8488637, -0.2961112, 1, 1, 1, 1, 1,
-1.068928, 0.08063386, -2.046978, 1, 1, 1, 1, 1,
-1.068917, -1.005016, -3.839617, 1, 1, 1, 1, 1,
-1.067147, 0.4422183, -1.76059, 1, 1, 1, 1, 1,
-1.064443, 0.3422053, -2.833862, 1, 1, 1, 1, 1,
-1.059322, -0.9521731, -2.83572, 1, 1, 1, 1, 1,
-1.056615, -0.5278996, -1.061481, 1, 1, 1, 1, 1,
-1.054015, 0.2324102, -1.707752, 1, 1, 1, 1, 1,
-1.051377, 0.691129, -0.07941014, 0, 0, 1, 1, 1,
-1.039287, -0.7604374, -3.332203, 1, 0, 0, 1, 1,
-1.033847, 0.02143253, -1.013447, 1, 0, 0, 1, 1,
-1.030889, 0.2125826, -0.06047778, 1, 0, 0, 1, 1,
-1.02638, 0.2839391, -0.1576135, 1, 0, 0, 1, 1,
-1.01602, -0.1714869, -2.964292, 1, 0, 0, 1, 1,
-1.01417, 0.3807364, 0.3186647, 0, 0, 0, 1, 1,
-1.006088, 2.535331, -1.393166, 0, 0, 0, 1, 1,
-1.005145, -0.3803408, -1.565716, 0, 0, 0, 1, 1,
-0.999743, -0.9414032, -3.094704, 0, 0, 0, 1, 1,
-0.9951091, 0.1828397, -2.874203, 0, 0, 0, 1, 1,
-0.9947794, -0.9349064, -1.745944, 0, 0, 0, 1, 1,
-0.9902211, -0.5085434, -2.261701, 0, 0, 0, 1, 1,
-0.9789299, 1.035257, -0.1394733, 1, 1, 1, 1, 1,
-0.9776738, 0.1903073, 0.4763132, 1, 1, 1, 1, 1,
-0.9740203, -0.5863346, -2.636862, 1, 1, 1, 1, 1,
-0.9729741, 1.186659, -3.856032, 1, 1, 1, 1, 1,
-0.9723628, -0.3980587, -3.528228, 1, 1, 1, 1, 1,
-0.9665201, 0.1954223, -0.632547, 1, 1, 1, 1, 1,
-0.9645164, 1.609784, 1.041408, 1, 1, 1, 1, 1,
-0.9605236, 1.280309, 0.4945045, 1, 1, 1, 1, 1,
-0.9603437, -0.2589232, -1.808603, 1, 1, 1, 1, 1,
-0.9128898, -0.2915806, -3.046256, 1, 1, 1, 1, 1,
-0.9110209, -1.185857, -3.490366, 1, 1, 1, 1, 1,
-0.9071491, 0.2160735, -0.4128504, 1, 1, 1, 1, 1,
-0.9047799, -0.5914715, -2.420539, 1, 1, 1, 1, 1,
-0.8985221, -1.029529, -1.624477, 1, 1, 1, 1, 1,
-0.8968238, -1.291558, -3.808961, 1, 1, 1, 1, 1,
-0.8958628, 0.2799076, -1.683052, 0, 0, 1, 1, 1,
-0.895493, 0.5093132, -0.2992425, 1, 0, 0, 1, 1,
-0.891302, -1.074157, -3.524249, 1, 0, 0, 1, 1,
-0.8900551, -0.3069658, -1.492869, 1, 0, 0, 1, 1,
-0.8839279, 2.249824, 0.6526211, 1, 0, 0, 1, 1,
-0.8795826, 0.05722651, -0.2727842, 1, 0, 0, 1, 1,
-0.8783557, -1.743087, -4.041105, 0, 0, 0, 1, 1,
-0.8768648, -0.1986046, -3.477534, 0, 0, 0, 1, 1,
-0.8755119, -0.14011, -2.059961, 0, 0, 0, 1, 1,
-0.8722919, -0.2559746, -2.031839, 0, 0, 0, 1, 1,
-0.8710803, 0.3155594, -1.494182, 0, 0, 0, 1, 1,
-0.8661952, 0.6715659, 0.9019508, 0, 0, 0, 1, 1,
-0.8648617, -0.1206204, -0.09513153, 0, 0, 0, 1, 1,
-0.8569108, -0.2370561, -2.619875, 1, 1, 1, 1, 1,
-0.8563131, 0.141323, -2.258593, 1, 1, 1, 1, 1,
-0.85422, 0.1535927, -1.485084, 1, 1, 1, 1, 1,
-0.8516037, 0.2236805, 0.2691064, 1, 1, 1, 1, 1,
-0.8462631, 0.2377541, -2.970875, 1, 1, 1, 1, 1,
-0.8376338, 1.703962, -1.281312, 1, 1, 1, 1, 1,
-0.8332036, 0.9130322, -0.07009504, 1, 1, 1, 1, 1,
-0.8295134, -0.8555692, -5.098506, 1, 1, 1, 1, 1,
-0.8286627, 1.324232, 0.4861234, 1, 1, 1, 1, 1,
-0.8273976, 0.1464557, -2.119284, 1, 1, 1, 1, 1,
-0.8267989, 0.5006756, -1.873156, 1, 1, 1, 1, 1,
-0.8263823, 0.5797633, 0.9238978, 1, 1, 1, 1, 1,
-0.8201743, 1.187253, -0.786002, 1, 1, 1, 1, 1,
-0.8137825, 0.3067618, -1.279973, 1, 1, 1, 1, 1,
-0.8077897, -1.020661, -2.674696, 1, 1, 1, 1, 1,
-0.8040739, 0.5067815, -1.700295, 0, 0, 1, 1, 1,
-0.8029624, 0.8299289, 1.072813, 1, 0, 0, 1, 1,
-0.801811, 0.1330283, -0.4146031, 1, 0, 0, 1, 1,
-0.8004701, -0.2347424, -2.780145, 1, 0, 0, 1, 1,
-0.7997448, -0.8195027, -1.287789, 1, 0, 0, 1, 1,
-0.7983604, -0.2874049, -2.33518, 1, 0, 0, 1, 1,
-0.798067, 0.2274489, -0.5842432, 0, 0, 0, 1, 1,
-0.7949499, -1.056204, -2.316431, 0, 0, 0, 1, 1,
-0.7940218, 0.2178313, -2.795383, 0, 0, 0, 1, 1,
-0.7879472, -0.08168973, -1.468371, 0, 0, 0, 1, 1,
-0.7861227, 1.17939, -0.1124407, 0, 0, 0, 1, 1,
-0.7838855, -0.05175864, -1.38001, 0, 0, 0, 1, 1,
-0.7833689, 0.9013768, -0.3202818, 0, 0, 0, 1, 1,
-0.7824056, -1.087898, -1.725715, 1, 1, 1, 1, 1,
-0.7823584, -0.5566502, -1.998751, 1, 1, 1, 1, 1,
-0.7819649, 1.094635, -0.5697203, 1, 1, 1, 1, 1,
-0.7793389, 0.6011047, -0.1281571, 1, 1, 1, 1, 1,
-0.7792405, 0.3454071, -0.4539579, 1, 1, 1, 1, 1,
-0.7778393, 2.181069, -0.384481, 1, 1, 1, 1, 1,
-0.7741667, 0.375208, 1.168865, 1, 1, 1, 1, 1,
-0.769161, 0.2423988, -2.897683, 1, 1, 1, 1, 1,
-0.7656608, 1.173447, -0.8966303, 1, 1, 1, 1, 1,
-0.7635728, 0.1010108, -0.9702803, 1, 1, 1, 1, 1,
-0.7624223, -1.825318, -3.151491, 1, 1, 1, 1, 1,
-0.7618754, -0.2775491, -1.909213, 1, 1, 1, 1, 1,
-0.7578207, -0.3803151, -1.198544, 1, 1, 1, 1, 1,
-0.7571128, -0.4429007, -1.558745, 1, 1, 1, 1, 1,
-0.7552438, 0.213859, 0.3843062, 1, 1, 1, 1, 1,
-0.7532029, 0.07488894, -2.96094, 0, 0, 1, 1, 1,
-0.7515405, 0.09260336, -0.8187985, 1, 0, 0, 1, 1,
-0.7473463, -0.6514342, -1.73611, 1, 0, 0, 1, 1,
-0.7453485, -0.4868641, -2.845929, 1, 0, 0, 1, 1,
-0.7423831, 1.883922, -1.235797, 1, 0, 0, 1, 1,
-0.7417949, -0.5464241, -2.25396, 1, 0, 0, 1, 1,
-0.7409547, -0.2429134, -0.7493156, 0, 0, 0, 1, 1,
-0.7391097, -1.359011, -2.185231, 0, 0, 0, 1, 1,
-0.7347834, 1.012389, -1.341706, 0, 0, 0, 1, 1,
-0.7335749, 1.464712, -1.325815, 0, 0, 0, 1, 1,
-0.7318168, -0.03076725, -3.774079, 0, 0, 0, 1, 1,
-0.7304561, 0.5761176, -0.5725845, 0, 0, 0, 1, 1,
-0.7299549, -0.2630244, -3.070712, 0, 0, 0, 1, 1,
-0.7268575, 0.6558501, -1.662018, 1, 1, 1, 1, 1,
-0.7258423, 0.4622883, -0.8555645, 1, 1, 1, 1, 1,
-0.7255393, 1.095435, -1.168756, 1, 1, 1, 1, 1,
-0.7254753, 0.6842778, 0.3663574, 1, 1, 1, 1, 1,
-0.7207568, 0.8139046, -0.9141655, 1, 1, 1, 1, 1,
-0.7206327, -0.3118821, -0.6207939, 1, 1, 1, 1, 1,
-0.7201506, 1.324857, -1.334479, 1, 1, 1, 1, 1,
-0.7190518, 0.5201195, -0.7686619, 1, 1, 1, 1, 1,
-0.714807, 1.697639, -0.4821414, 1, 1, 1, 1, 1,
-0.7110804, -0.5814927, -2.394214, 1, 1, 1, 1, 1,
-0.7063735, 0.7691081, -1.322902, 1, 1, 1, 1, 1,
-0.7047306, -0.1327945, -0.9546027, 1, 1, 1, 1, 1,
-0.7035456, -0.9426884, -2.279857, 1, 1, 1, 1, 1,
-0.703036, -1.529925, -1.324745, 1, 1, 1, 1, 1,
-0.7004464, -1.69758, -3.38877, 1, 1, 1, 1, 1,
-0.7001022, -0.8188411, -2.191055, 0, 0, 1, 1, 1,
-0.699706, 1.177751, -0.6750386, 1, 0, 0, 1, 1,
-0.6980813, 0.06684256, -1.864119, 1, 0, 0, 1, 1,
-0.6953442, 1.124575, -1.613894, 1, 0, 0, 1, 1,
-0.6942196, 0.7259136, -1.430952, 1, 0, 0, 1, 1,
-0.6885778, -1.141572, -1.693416, 1, 0, 0, 1, 1,
-0.6847354, 0.4207242, -2.296179, 0, 0, 0, 1, 1,
-0.6830364, 0.5541834, 0.5275026, 0, 0, 0, 1, 1,
-0.6821691, 0.42489, -1.767666, 0, 0, 0, 1, 1,
-0.6809357, 0.6823779, -1.742748, 0, 0, 0, 1, 1,
-0.6793846, 0.2513317, -0.4703439, 0, 0, 0, 1, 1,
-0.6787007, 0.1680017, -0.8024383, 0, 0, 0, 1, 1,
-0.677654, -1.799843, -3.494502, 0, 0, 0, 1, 1,
-0.6764781, 0.3499266, -0.8312949, 1, 1, 1, 1, 1,
-0.6723595, 0.7279333, -0.5762091, 1, 1, 1, 1, 1,
-0.6708655, 0.2741177, -2.319203, 1, 1, 1, 1, 1,
-0.6698895, -0.4667243, -1.684595, 1, 1, 1, 1, 1,
-0.6659868, -0.7635501, -2.031536, 1, 1, 1, 1, 1,
-0.6625293, -0.7761557, -3.455242, 1, 1, 1, 1, 1,
-0.6580307, -1.713636, -2.148575, 1, 1, 1, 1, 1,
-0.6543121, 0.6704626, 0.5893829, 1, 1, 1, 1, 1,
-0.6521921, -0.2613748, -2.516754, 1, 1, 1, 1, 1,
-0.6471545, 0.5920016, -0.8939623, 1, 1, 1, 1, 1,
-0.6459711, 0.5536635, -0.3622096, 1, 1, 1, 1, 1,
-0.6407187, -0.1120816, -2.544126, 1, 1, 1, 1, 1,
-0.639294, 1.578533, 0.2711785, 1, 1, 1, 1, 1,
-0.6366447, -0.08690415, -2.560187, 1, 1, 1, 1, 1,
-0.6358899, -0.2018119, -1.543587, 1, 1, 1, 1, 1,
-0.6319895, -1.622969, -2.847755, 0, 0, 1, 1, 1,
-0.631862, -0.1181986, -3.504988, 1, 0, 0, 1, 1,
-0.6264805, -0.7417198, -3.589125, 1, 0, 0, 1, 1,
-0.626032, -0.7232273, -3.565872, 1, 0, 0, 1, 1,
-0.62377, -0.1729225, -3.187295, 1, 0, 0, 1, 1,
-0.6159067, -1.602335, -4.114456, 1, 0, 0, 1, 1,
-0.6115702, 1.033017, -0.03326878, 0, 0, 0, 1, 1,
-0.6096385, 0.41379, -1.316785, 0, 0, 0, 1, 1,
-0.6075321, -0.6957653, -2.66606, 0, 0, 0, 1, 1,
-0.604211, 0.4306968, -1.613169, 0, 0, 0, 1, 1,
-0.6021215, 0.8050277, -1.792097, 0, 0, 0, 1, 1,
-0.6008224, 1.095684, -0.3656609, 0, 0, 0, 1, 1,
-0.5974314, -0.1968981, -2.561489, 0, 0, 0, 1, 1,
-0.5966816, 1.150707, -0.6287692, 1, 1, 1, 1, 1,
-0.5951257, -0.1402937, -1.106712, 1, 1, 1, 1, 1,
-0.5869074, -0.06724638, -2.504148, 1, 1, 1, 1, 1,
-0.5858449, 0.6048383, -1.170917, 1, 1, 1, 1, 1,
-0.5847122, -0.5204946, -1.779686, 1, 1, 1, 1, 1,
-0.582942, -0.1805103, -1.796553, 1, 1, 1, 1, 1,
-0.5825636, -1.063154, -2.344886, 1, 1, 1, 1, 1,
-0.5810042, -0.7180527, -1.569546, 1, 1, 1, 1, 1,
-0.578023, 0.7275566, -1.86767, 1, 1, 1, 1, 1,
-0.577774, 0.9696693, -0.5737633, 1, 1, 1, 1, 1,
-0.5758486, 0.3868791, -2.698447, 1, 1, 1, 1, 1,
-0.5664932, -1.305413, -3.310872, 1, 1, 1, 1, 1,
-0.56557, -1.67416, -2.569344, 1, 1, 1, 1, 1,
-0.5545139, 0.6275831, 0.23889, 1, 1, 1, 1, 1,
-0.5544457, 0.5896436, -1.251879, 1, 1, 1, 1, 1,
-0.5390804, 0.5174087, 0.2180929, 0, 0, 1, 1, 1,
-0.5382454, 1.547506, 0.1240429, 1, 0, 0, 1, 1,
-0.537829, -0.8780885, -3.87509, 1, 0, 0, 1, 1,
-0.5360275, 0.6529253, -0.6824164, 1, 0, 0, 1, 1,
-0.5240832, 0.8930681, -1.65708, 1, 0, 0, 1, 1,
-0.5240137, 0.771919, -1.429358, 1, 0, 0, 1, 1,
-0.5201701, 0.3609959, 0.3073092, 0, 0, 0, 1, 1,
-0.5170262, -0.8961079, -4.197546, 0, 0, 0, 1, 1,
-0.510821, -1.008523, -3.502028, 0, 0, 0, 1, 1,
-0.5057429, -1.780631, -2.742623, 0, 0, 0, 1, 1,
-0.5014403, 1.345729, 2.494271, 0, 0, 0, 1, 1,
-0.496002, -1.189674, -1.51549, 0, 0, 0, 1, 1,
-0.4929012, 0.3264948, -0.810196, 0, 0, 0, 1, 1,
-0.4928857, 0.9895093, -0.2159118, 1, 1, 1, 1, 1,
-0.4927849, 1.564425, 1.244901, 1, 1, 1, 1, 1,
-0.4918588, -0.01121736, -1.740198, 1, 1, 1, 1, 1,
-0.4890436, 1.022589, -1.384286, 1, 1, 1, 1, 1,
-0.4844819, -0.3046272, -3.491048, 1, 1, 1, 1, 1,
-0.4836823, -0.1101386, -1.126034, 1, 1, 1, 1, 1,
-0.4824091, 0.1893422, -0.7024419, 1, 1, 1, 1, 1,
-0.479001, -0.4708827, -1.181179, 1, 1, 1, 1, 1,
-0.4786597, -2.761535, -4.796261, 1, 1, 1, 1, 1,
-0.4781289, -0.3318296, -1.637978, 1, 1, 1, 1, 1,
-0.4773369, 0.1549488, -0.7068831, 1, 1, 1, 1, 1,
-0.4626867, 0.3616709, -1.368488, 1, 1, 1, 1, 1,
-0.4615295, -0.202141, -2.338704, 1, 1, 1, 1, 1,
-0.4614014, -0.06701279, -1.54077, 1, 1, 1, 1, 1,
-0.4561657, 1.148959, -1.297022, 1, 1, 1, 1, 1,
-0.4551802, -0.2130378, -1.123753, 0, 0, 1, 1, 1,
-0.4542849, -1.131259, -2.304958, 1, 0, 0, 1, 1,
-0.4541175, -2.160749, -3.797408, 1, 0, 0, 1, 1,
-0.4499577, -0.09097381, -3.210397, 1, 0, 0, 1, 1,
-0.4447762, -1.122642, -2.589874, 1, 0, 0, 1, 1,
-0.4335235, -0.04819531, -1.884512, 1, 0, 0, 1, 1,
-0.4306967, 0.6421691, -2.6524, 0, 0, 0, 1, 1,
-0.4289046, -1.392525, -4.571482, 0, 0, 0, 1, 1,
-0.4253682, -0.7195449, -2.249592, 0, 0, 0, 1, 1,
-0.4230946, 0.561267, 0.48573, 0, 0, 0, 1, 1,
-0.4208905, 0.9932048, -0.5947447, 0, 0, 0, 1, 1,
-0.4181702, 0.0773987, -1.941132, 0, 0, 0, 1, 1,
-0.4177658, 1.00301, -0.01838733, 0, 0, 0, 1, 1,
-0.4164007, -0.2558385, -1.605684, 1, 1, 1, 1, 1,
-0.4115373, -0.8897782, -4.375791, 1, 1, 1, 1, 1,
-0.4097234, -0.2195814, -2.560033, 1, 1, 1, 1, 1,
-0.4094748, 0.3304398, -0.1366585, 1, 1, 1, 1, 1,
-0.4046094, 0.06611286, -0.844867, 1, 1, 1, 1, 1,
-0.4039359, -0.2016827, -1.740643, 1, 1, 1, 1, 1,
-0.4000046, -0.6117933, -2.383375, 1, 1, 1, 1, 1,
-0.3960328, 0.226761, -0.3794115, 1, 1, 1, 1, 1,
-0.3949002, 1.946741, -0.08801319, 1, 1, 1, 1, 1,
-0.3923912, -0.3383363, -0.2553639, 1, 1, 1, 1, 1,
-0.3917151, 1.425709, -0.5574808, 1, 1, 1, 1, 1,
-0.3860656, -1.495449, -1.317723, 1, 1, 1, 1, 1,
-0.3823168, 0.4003579, 0.5378382, 1, 1, 1, 1, 1,
-0.3809527, 1.510027, -0.4589683, 1, 1, 1, 1, 1,
-0.3793729, 0.9696073, -0.3176055, 1, 1, 1, 1, 1,
-0.3783991, 0.009923613, -1.521112, 0, 0, 1, 1, 1,
-0.3775631, 0.7329232, 0.2261551, 1, 0, 0, 1, 1,
-0.375917, -0.2221051, -2.51276, 1, 0, 0, 1, 1,
-0.3756599, -0.1704747, -2.994791, 1, 0, 0, 1, 1,
-0.3685153, 0.7143328, -0.9588818, 1, 0, 0, 1, 1,
-0.3684475, 0.05455243, -0.04419415, 1, 0, 0, 1, 1,
-0.366227, 0.3741942, -0.9000387, 0, 0, 0, 1, 1,
-0.3638801, 0.1461349, -0.0667525, 0, 0, 0, 1, 1,
-0.3589994, 1.009667, 0.1467447, 0, 0, 0, 1, 1,
-0.3586402, -0.1826182, -1.481853, 0, 0, 0, 1, 1,
-0.355749, 0.2317202, -1.22737, 0, 0, 0, 1, 1,
-0.3482983, 1.544548, -0.9320693, 0, 0, 0, 1, 1,
-0.3477604, -0.3832097, -1.363236, 0, 0, 0, 1, 1,
-0.3471002, -0.2910346, -3.07673, 1, 1, 1, 1, 1,
-0.3426544, -0.6415038, -3.212586, 1, 1, 1, 1, 1,
-0.3407241, -1.722221, -2.553602, 1, 1, 1, 1, 1,
-0.3373595, 1.388341, -0.6557131, 1, 1, 1, 1, 1,
-0.3235349, -1.359034, -3.431424, 1, 1, 1, 1, 1,
-0.3229107, 0.01777721, -2.18876, 1, 1, 1, 1, 1,
-0.322005, -1.367892, -3.20379, 1, 1, 1, 1, 1,
-0.3175269, 0.4812801, -1.398106, 1, 1, 1, 1, 1,
-0.3085506, 1.466387, 2.174587, 1, 1, 1, 1, 1,
-0.3063688, -0.2903803, -1.790919, 1, 1, 1, 1, 1,
-0.3058214, -1.291058, -2.409981, 1, 1, 1, 1, 1,
-0.3052917, -0.7146416, -2.428873, 1, 1, 1, 1, 1,
-0.3047474, -0.1056421, -1.200753, 1, 1, 1, 1, 1,
-0.2954179, -0.9081502, -1.753749, 1, 1, 1, 1, 1,
-0.290444, 0.5670194, -0.1871348, 1, 1, 1, 1, 1,
-0.28854, 0.03309835, -2.974569, 0, 0, 1, 1, 1,
-0.285682, -2.196686, -4.055447, 1, 0, 0, 1, 1,
-0.2846637, -0.960771, -4.5002, 1, 0, 0, 1, 1,
-0.2809797, -0.05977294, -1.914037, 1, 0, 0, 1, 1,
-0.2804539, 0.02308469, -0.9289951, 1, 0, 0, 1, 1,
-0.2777447, 0.03549484, -1.289978, 1, 0, 0, 1, 1,
-0.2698439, -0.556487, -4.464324, 0, 0, 0, 1, 1,
-0.2669926, -1.677268, -0.435315, 0, 0, 0, 1, 1,
-0.2669559, -1.162753, -1.806075, 0, 0, 0, 1, 1,
-0.2656733, 0.2872491, 0.3584218, 0, 0, 0, 1, 1,
-0.2655628, -0.6783283, -4.401582, 0, 0, 0, 1, 1,
-0.2644509, 0.5555919, 0.3513977, 0, 0, 0, 1, 1,
-0.2605146, -0.2860904, -3.017195, 0, 0, 0, 1, 1,
-0.2586126, -2.163372, -2.666664, 1, 1, 1, 1, 1,
-0.2562805, 0.8755053, -0.16529, 1, 1, 1, 1, 1,
-0.2536943, 2.275764, 0.4533318, 1, 1, 1, 1, 1,
-0.2534046, -0.7975689, -3.19075, 1, 1, 1, 1, 1,
-0.2527485, 0.6260281, -1.33277, 1, 1, 1, 1, 1,
-0.2501405, 0.9718064, -2.220688, 1, 1, 1, 1, 1,
-0.245498, 1.404444, 1.331674, 1, 1, 1, 1, 1,
-0.2416414, 0.6934541, -1.211661, 1, 1, 1, 1, 1,
-0.2372141, 0.190107, -0.01325386, 1, 1, 1, 1, 1,
-0.2366748, -0.8646222, -2.508582, 1, 1, 1, 1, 1,
-0.2366, -0.6013211, -2.34125, 1, 1, 1, 1, 1,
-0.2341314, -0.9322733, -3.986383, 1, 1, 1, 1, 1,
-0.226357, -0.2374395, -4.02056, 1, 1, 1, 1, 1,
-0.2219185, -0.5442023, -2.146049, 1, 1, 1, 1, 1,
-0.2024369, 0.04280894, -2.134077, 1, 1, 1, 1, 1,
-0.201791, 0.07417549, -0.507412, 0, 0, 1, 1, 1,
-0.1906198, 0.7855992, -0.9195428, 1, 0, 0, 1, 1,
-0.1905104, -0.4799128, -2.833753, 1, 0, 0, 1, 1,
-0.1869908, 2.023438, -0.1210789, 1, 0, 0, 1, 1,
-0.1830014, -1.215978, -2.980441, 1, 0, 0, 1, 1,
-0.1809548, 0.1029268, -0.8391415, 1, 0, 0, 1, 1,
-0.1777999, 0.3482303, 0.123336, 0, 0, 0, 1, 1,
-0.1774029, -0.2075845, -3.130274, 0, 0, 0, 1, 1,
-0.1750525, 0.9285477, 0.4679183, 0, 0, 0, 1, 1,
-0.173893, 0.2832174, -0.8045102, 0, 0, 0, 1, 1,
-0.1733034, 0.1152121, -0.111845, 0, 0, 0, 1, 1,
-0.1684513, 0.6208432, 0.2910648, 0, 0, 0, 1, 1,
-0.1664173, 0.4265208, -1.37806, 0, 0, 0, 1, 1,
-0.1644158, -0.008753501, -1.800956, 1, 1, 1, 1, 1,
-0.1607264, -0.2205949, -3.145972, 1, 1, 1, 1, 1,
-0.1565211, 0.05783096, -0.9658696, 1, 1, 1, 1, 1,
-0.1533701, 1.623682, -0.1293732, 1, 1, 1, 1, 1,
-0.1524396, 0.7805668, 2.398195, 1, 1, 1, 1, 1,
-0.1507767, 0.32229, -1.526989, 1, 1, 1, 1, 1,
-0.1504285, 0.05567476, -0.1562517, 1, 1, 1, 1, 1,
-0.1493719, -0.4869675, -3.63883, 1, 1, 1, 1, 1,
-0.1489559, 0.1119715, -0.3275186, 1, 1, 1, 1, 1,
-0.1477673, -0.9159111, -3.177684, 1, 1, 1, 1, 1,
-0.1473681, 2.2884, 0.6444411, 1, 1, 1, 1, 1,
-0.1458456, 2.218003, -0.5081959, 1, 1, 1, 1, 1,
-0.1457071, 0.7021281, 0.065836, 1, 1, 1, 1, 1,
-0.1410716, -0.573199, -3.143531, 1, 1, 1, 1, 1,
-0.1402678, -1.229598, -3.692528, 1, 1, 1, 1, 1,
-0.1378428, 0.7264885, -0.4376967, 0, 0, 1, 1, 1,
-0.1311735, 0.6672723, 0.4487678, 1, 0, 0, 1, 1,
-0.1311187, 0.05389858, -0.8150729, 1, 0, 0, 1, 1,
-0.1295114, -1.49347, -4.07598, 1, 0, 0, 1, 1,
-0.12707, 0.2979084, -0.4924463, 1, 0, 0, 1, 1,
-0.1231813, -0.9780324, -2.536276, 1, 0, 0, 1, 1,
-0.1220884, 0.3958703, -0.7971693, 0, 0, 0, 1, 1,
-0.1196981, 0.2129644, 1.460312, 0, 0, 0, 1, 1,
-0.1173346, -0.00207832, -1.058702, 0, 0, 0, 1, 1,
-0.1097343, 0.5455474, -0.07994221, 0, 0, 0, 1, 1,
-0.109074, 0.506577, 0.5784087, 0, 0, 0, 1, 1,
-0.1040422, -1.81529, -2.239799, 0, 0, 0, 1, 1,
-0.1038016, 1.011112, 0.9245309, 0, 0, 0, 1, 1,
-0.09936647, -0.52315, -1.736245, 1, 1, 1, 1, 1,
-0.09361371, -2.653746, -2.136904, 1, 1, 1, 1, 1,
-0.09197484, 0.1379924, 0.5589815, 1, 1, 1, 1, 1,
-0.09192992, 0.4932277, -0.2326977, 1, 1, 1, 1, 1,
-0.09174229, 0.2360384, -0.2349322, 1, 1, 1, 1, 1,
-0.08794513, 0.5188191, 0.3338795, 1, 1, 1, 1, 1,
-0.08663294, -1.612997, -3.156028, 1, 1, 1, 1, 1,
-0.08250194, -0.01772052, -2.661504, 1, 1, 1, 1, 1,
-0.07730614, 0.9017946, 0.1895936, 1, 1, 1, 1, 1,
-0.07670846, 0.1467365, 0.9187431, 1, 1, 1, 1, 1,
-0.07325173, -0.1304528, -3.388895, 1, 1, 1, 1, 1,
-0.07295638, 2.182887, 2.160999, 1, 1, 1, 1, 1,
-0.07001238, -0.6028728, -2.386708, 1, 1, 1, 1, 1,
-0.06941666, 0.4676195, -2.263223, 1, 1, 1, 1, 1,
-0.06012611, 0.8874982, 0.7973339, 1, 1, 1, 1, 1,
-0.0588426, 0.4353042, 1.320969, 0, 0, 1, 1, 1,
-0.05733094, 0.3211387, 1.021581, 1, 0, 0, 1, 1,
-0.04935619, 1.824187, -0.04970584, 1, 0, 0, 1, 1,
-0.04668758, 0.9732171, -0.8085638, 1, 0, 0, 1, 1,
-0.04646217, -1.057138, -2.792457, 1, 0, 0, 1, 1,
-0.04299189, -1.458877, -1.215904, 1, 0, 0, 1, 1,
-0.0428489, -0.2250909, -1.128877, 0, 0, 0, 1, 1,
-0.03938188, -0.696457, -2.737472, 0, 0, 0, 1, 1,
-0.03106141, -1.447039, -2.359328, 0, 0, 0, 1, 1,
-0.02986939, -0.04102209, -0.8785879, 0, 0, 0, 1, 1,
-0.02945026, 0.9459004, 0.7020506, 0, 0, 0, 1, 1,
-0.02915505, 0.1063534, -0.1901318, 0, 0, 0, 1, 1,
-0.0178359, 0.4787028, 0.2393184, 0, 0, 0, 1, 1,
-0.01675162, -0.6780298, -2.24015, 1, 1, 1, 1, 1,
-0.01609055, -0.2405636, -3.754026, 1, 1, 1, 1, 1,
-0.01482091, 0.05923572, 0.5201306, 1, 1, 1, 1, 1,
-0.01439107, -0.4066677, -2.836362, 1, 1, 1, 1, 1,
-0.01262671, 0.6562023, -0.730475, 1, 1, 1, 1, 1,
-0.01072297, 0.590055, -0.4478141, 1, 1, 1, 1, 1,
-0.01067356, 1.491704, 0.3706168, 1, 1, 1, 1, 1,
-0.009804715, -0.2215976, -4.767186, 1, 1, 1, 1, 1,
-0.009075706, 0.2014211, -1.796423, 1, 1, 1, 1, 1,
-0.008821793, -0.122092, -2.597806, 1, 1, 1, 1, 1,
-0.00871007, -2.025183, -1.788055, 1, 1, 1, 1, 1,
-0.00812186, 0.7924725, 1.077477, 1, 1, 1, 1, 1,
-0.00793254, 1.949695, -1.210612, 1, 1, 1, 1, 1,
-0.005707694, 0.2341956, -2.761065, 1, 1, 1, 1, 1,
0.003138337, -0.3239043, 4.005861, 1, 1, 1, 1, 1,
0.003746979, 1.136791, 1.24318, 0, 0, 1, 1, 1,
0.007190317, -0.7952897, 1.266104, 1, 0, 0, 1, 1,
0.007411608, -0.1711668, 0.6629829, 1, 0, 0, 1, 1,
0.01104685, -0.0166301, 2.473593, 1, 0, 0, 1, 1,
0.01143486, 0.8785506, 0.08423, 1, 0, 0, 1, 1,
0.01905198, 0.2782056, 0.4448672, 1, 0, 0, 1, 1,
0.01968009, 1.42758, 0.5859742, 0, 0, 0, 1, 1,
0.02048084, 0.06122344, 2.221934, 0, 0, 0, 1, 1,
0.02165035, -0.2450201, 2.776914, 0, 0, 0, 1, 1,
0.0216926, -0.6684489, 3.725393, 0, 0, 0, 1, 1,
0.02215558, -0.964012, 1.223158, 0, 0, 0, 1, 1,
0.02446307, 1.26322, -0.1994552, 0, 0, 0, 1, 1,
0.02473974, 0.0003375725, 1.440676, 0, 0, 0, 1, 1,
0.02962506, 0.1770708, 0.4288432, 1, 1, 1, 1, 1,
0.03357264, -0.946556, 3.326722, 1, 1, 1, 1, 1,
0.03552122, -0.2500692, 3.919271, 1, 1, 1, 1, 1,
0.0388846, -1.126734, 3.313325, 1, 1, 1, 1, 1,
0.0398404, 0.2626855, -0.3453965, 1, 1, 1, 1, 1,
0.04267685, -0.9306443, 2.877027, 1, 1, 1, 1, 1,
0.04286104, -0.2048153, 2.109807, 1, 1, 1, 1, 1,
0.04645179, -1.018141, 4.282734, 1, 1, 1, 1, 1,
0.04764061, -0.6595688, 3.238652, 1, 1, 1, 1, 1,
0.05101912, 0.3191563, 1.83571, 1, 1, 1, 1, 1,
0.05479734, 1.074844, 0.2367658, 1, 1, 1, 1, 1,
0.05512476, 1.071195, 1.034207, 1, 1, 1, 1, 1,
0.05596679, 2.847023, 0.2949523, 1, 1, 1, 1, 1,
0.06044699, 0.04333141, 0.3979344, 1, 1, 1, 1, 1,
0.06620129, -0.2592354, 2.753, 1, 1, 1, 1, 1,
0.07786842, 1.728049, 0.219375, 0, 0, 1, 1, 1,
0.07854612, 2.19168, -0.9595514, 1, 0, 0, 1, 1,
0.07957926, -1.22673, 3.727104, 1, 0, 0, 1, 1,
0.08034554, 0.2985769, 0.6288964, 1, 0, 0, 1, 1,
0.08051565, -0.5360922, 2.065524, 1, 0, 0, 1, 1,
0.083245, 0.2452304, 1.101546, 1, 0, 0, 1, 1,
0.08325607, 0.5670167, 1.186965, 0, 0, 0, 1, 1,
0.08342006, -1.400581, 1.814501, 0, 0, 0, 1, 1,
0.08466718, 0.3735878, -1.352085, 0, 0, 0, 1, 1,
0.08651748, 1.056353, -2.823629, 0, 0, 0, 1, 1,
0.08700498, -0.1665803, 4.515469, 0, 0, 0, 1, 1,
0.0894291, 0.05333282, 2.370906, 0, 0, 0, 1, 1,
0.09204442, 2.282213, 0.8425456, 0, 0, 0, 1, 1,
0.09277277, 0.3560409, -1.111299, 1, 1, 1, 1, 1,
0.09990262, 0.323698, -0.9450356, 1, 1, 1, 1, 1,
0.1012788, 1.545952, -0.5465361, 1, 1, 1, 1, 1,
0.1022566, 0.2004538, -1.149816, 1, 1, 1, 1, 1,
0.1084387, -0.78691, 2.373741, 1, 1, 1, 1, 1,
0.11196, -0.9960856, 3.964385, 1, 1, 1, 1, 1,
0.1161168, -1.763976, 1.824157, 1, 1, 1, 1, 1,
0.1162027, 0.1517471, 1.580882, 1, 1, 1, 1, 1,
0.1188909, -0.6959268, 1.769268, 1, 1, 1, 1, 1,
0.1196886, 1.346263, 1.381715, 1, 1, 1, 1, 1,
0.1208884, -1.003801, 2.923778, 1, 1, 1, 1, 1,
0.1247, -1.275144, 2.430588, 1, 1, 1, 1, 1,
0.1255003, -0.1274818, 1.391979, 1, 1, 1, 1, 1,
0.1280682, 0.8210942, 0.7691957, 1, 1, 1, 1, 1,
0.128799, -0.5423892, 3.534706, 1, 1, 1, 1, 1,
0.1402771, 0.2147691, -0.2443528, 0, 0, 1, 1, 1,
0.1456195, 0.373823, 1.572481, 1, 0, 0, 1, 1,
0.1478116, -1.256952, 4.117052, 1, 0, 0, 1, 1,
0.148222, 1.203157, 0.1834098, 1, 0, 0, 1, 1,
0.1488465, 1.37697, 1.462182, 1, 0, 0, 1, 1,
0.1497219, 0.379036, 1.419483, 1, 0, 0, 1, 1,
0.1531351, -0.5180897, 3.25645, 0, 0, 0, 1, 1,
0.1573648, -1.384119, 2.433093, 0, 0, 0, 1, 1,
0.1582021, 0.8716344, -0.2056331, 0, 0, 0, 1, 1,
0.1585501, 1.602136, 0.6218386, 0, 0, 0, 1, 1,
0.1598928, -1.200454, 4.063034, 0, 0, 0, 1, 1,
0.160345, 0.352278, 0.8127149, 0, 0, 0, 1, 1,
0.1639253, -0.08601472, 2.490646, 0, 0, 0, 1, 1,
0.1667097, 0.7732939, 0.8154014, 1, 1, 1, 1, 1,
0.1674824, 0.3764885, -0.100758, 1, 1, 1, 1, 1,
0.1695049, 0.6527421, 0.1837557, 1, 1, 1, 1, 1,
0.1701062, -0.9803855, 3.364526, 1, 1, 1, 1, 1,
0.1733519, -0.1903817, 2.196178, 1, 1, 1, 1, 1,
0.1756438, -1.491002, 2.83898, 1, 1, 1, 1, 1,
0.1775721, 0.2750122, 0.5416774, 1, 1, 1, 1, 1,
0.1795901, 0.7908141, 2.167783, 1, 1, 1, 1, 1,
0.1797863, 0.7435887, -1.685535, 1, 1, 1, 1, 1,
0.1812299, -1.208568, 2.958197, 1, 1, 1, 1, 1,
0.181296, 0.1327998, 0.8587255, 1, 1, 1, 1, 1,
0.1815823, -2.718641, 3.767482, 1, 1, 1, 1, 1,
0.1862588, -0.324334, 2.154165, 1, 1, 1, 1, 1,
0.2034011, -0.8368511, 2.43308, 1, 1, 1, 1, 1,
0.2042933, -0.3981898, 3.102164, 1, 1, 1, 1, 1,
0.2103331, -0.4115782, 0.9296376, 0, 0, 1, 1, 1,
0.2131822, -0.932308, 4.686511, 1, 0, 0, 1, 1,
0.2178349, -0.04531448, 2.791715, 1, 0, 0, 1, 1,
0.2222928, -0.112282, 2.745288, 1, 0, 0, 1, 1,
0.2257785, -1.704531, 2.101333, 1, 0, 0, 1, 1,
0.2267975, 1.170443, 0.1493361, 1, 0, 0, 1, 1,
0.2288543, 0.216368, 0.03640361, 0, 0, 0, 1, 1,
0.2322258, -0.6233616, 3.984872, 0, 0, 0, 1, 1,
0.2322368, -1.872558, 4.863195, 0, 0, 0, 1, 1,
0.2322826, -1.569103, 5.276558, 0, 0, 0, 1, 1,
0.2330073, -0.5249879, 1.711953, 0, 0, 0, 1, 1,
0.2366589, -0.8024726, 2.861717, 0, 0, 0, 1, 1,
0.2386227, -0.9937524, 1.927113, 0, 0, 0, 1, 1,
0.2401756, 0.3298129, 0.09950539, 1, 1, 1, 1, 1,
0.2526336, -0.5034727, 2.008954, 1, 1, 1, 1, 1,
0.259816, 1.487437, 0.7534963, 1, 1, 1, 1, 1,
0.26295, -1.242011, 4.395278, 1, 1, 1, 1, 1,
0.2644948, -0.7902899, 2.91595, 1, 1, 1, 1, 1,
0.2670681, -0.7689638, 1.192548, 1, 1, 1, 1, 1,
0.2679333, -0.6528078, 1.971002, 1, 1, 1, 1, 1,
0.2702642, 0.1708719, 0.5350586, 1, 1, 1, 1, 1,
0.2714959, -0.5695581, 1.549564, 1, 1, 1, 1, 1,
0.2738546, 0.3189762, -0.2285391, 1, 1, 1, 1, 1,
0.2780961, -2.336886, 2.30243, 1, 1, 1, 1, 1,
0.2799004, 0.642146, 0.8171013, 1, 1, 1, 1, 1,
0.2858824, -1.483699, 3.92194, 1, 1, 1, 1, 1,
0.2877087, -0.5288004, 2.198652, 1, 1, 1, 1, 1,
0.2878215, -0.3628151, 0.9076664, 1, 1, 1, 1, 1,
0.2896213, 1.203729, 0.09032234, 0, 0, 1, 1, 1,
0.2914533, 0.8220053, -0.9494275, 1, 0, 0, 1, 1,
0.2974429, 0.1925175, 1.235, 1, 0, 0, 1, 1,
0.2998965, 1.819381, -0.2524178, 1, 0, 0, 1, 1,
0.3025526, -0.02288153, 2.778383, 1, 0, 0, 1, 1,
0.3060968, -0.1436212, 2.190731, 1, 0, 0, 1, 1,
0.3176349, -0.1459729, 2.053407, 0, 0, 0, 1, 1,
0.3220471, 0.7001067, 2.020665, 0, 0, 0, 1, 1,
0.3233559, -0.008217081, 2.445009, 0, 0, 0, 1, 1,
0.326687, 1.9726, 1.324212, 0, 0, 0, 1, 1,
0.3301314, 3.219427, -2.477335, 0, 0, 0, 1, 1,
0.3316589, -0.07666794, 1.691028, 0, 0, 0, 1, 1,
0.3357405, 0.928337, -0.1627457, 0, 0, 0, 1, 1,
0.3442575, 0.5951065, 1.803314, 1, 1, 1, 1, 1,
0.3452619, -0.4348243, 2.352932, 1, 1, 1, 1, 1,
0.3463139, 1.315219, 1.479602, 1, 1, 1, 1, 1,
0.3465459, -0.3478658, 2.523047, 1, 1, 1, 1, 1,
0.3572329, 0.3871016, 0.4410812, 1, 1, 1, 1, 1,
0.3587457, 0.5244697, 2.177115, 1, 1, 1, 1, 1,
0.359931, -1.037024, 2.516781, 1, 1, 1, 1, 1,
0.3611344, 2.22777, -1.267473, 1, 1, 1, 1, 1,
0.3624245, 1.086115, 0.5809651, 1, 1, 1, 1, 1,
0.3628531, 0.3269784, 1.374625, 1, 1, 1, 1, 1,
0.3652992, -0.01012674, 1.444546, 1, 1, 1, 1, 1,
0.3678609, -0.8063409, 3.293673, 1, 1, 1, 1, 1,
0.3681617, -0.01276766, 0.3066204, 1, 1, 1, 1, 1,
0.3725834, -1.687884, 1.992824, 1, 1, 1, 1, 1,
0.3748027, 1.761961, 2.05519, 1, 1, 1, 1, 1,
0.3794648, 0.215331, 1.562073, 0, 0, 1, 1, 1,
0.3808749, -0.3617446, 1.42349, 1, 0, 0, 1, 1,
0.3821405, 0.4982159, 1.276277, 1, 0, 0, 1, 1,
0.3858247, 0.4904258, -0.4031543, 1, 0, 0, 1, 1,
0.3866834, 0.5252104, 1.256341, 1, 0, 0, 1, 1,
0.3884786, 0.5001355, 1.304309, 1, 0, 0, 1, 1,
0.3932389, -0.08179721, 0.2812379, 0, 0, 0, 1, 1,
0.3937463, -1.719998, 2.311667, 0, 0, 0, 1, 1,
0.3944916, 0.7546468, 0.04965916, 0, 0, 0, 1, 1,
0.3976852, 0.06854615, 1.67283, 0, 0, 0, 1, 1,
0.3984915, 1.246653, 0.8978365, 0, 0, 0, 1, 1,
0.4010393, -0.6949168, 3.234209, 0, 0, 0, 1, 1,
0.4039136, 0.9702731, -0.6427112, 0, 0, 0, 1, 1,
0.4045637, 2.367811, 1.73106, 1, 1, 1, 1, 1,
0.4058446, 2.315249, 0.1048466, 1, 1, 1, 1, 1,
0.406044, 0.2075837, 0.8041968, 1, 1, 1, 1, 1,
0.4073351, -0.007128352, 2.553196, 1, 1, 1, 1, 1,
0.408895, -1.044369, 0.9316617, 1, 1, 1, 1, 1,
0.4127225, -1.36993, 2.648151, 1, 1, 1, 1, 1,
0.4141295, 0.6462553, 0.9270325, 1, 1, 1, 1, 1,
0.415255, 0.2874376, 0.8463848, 1, 1, 1, 1, 1,
0.4154394, 0.06995802, 2.396113, 1, 1, 1, 1, 1,
0.4167552, 0.8880571, 1.283014, 1, 1, 1, 1, 1,
0.4183908, -0.01058157, 2.932835, 1, 1, 1, 1, 1,
0.4201577, 1.270237, 0.4472147, 1, 1, 1, 1, 1,
0.4227936, -0.9463817, 2.962119, 1, 1, 1, 1, 1,
0.4243775, 0.6746817, 2.27918, 1, 1, 1, 1, 1,
0.4247361, 0.4463202, 0.1596003, 1, 1, 1, 1, 1,
0.4247501, 0.8558687, 1.598949, 0, 0, 1, 1, 1,
0.4338467, -0.4006677, 4.641458, 1, 0, 0, 1, 1,
0.4361815, -0.5865076, 2.643358, 1, 0, 0, 1, 1,
0.4365008, -0.3582715, 1.453117, 1, 0, 0, 1, 1,
0.4398377, -0.1220669, 1.018743, 1, 0, 0, 1, 1,
0.4444587, -0.2000221, 0.9512791, 1, 0, 0, 1, 1,
0.4447179, 1.007928, 1.066023, 0, 0, 0, 1, 1,
0.4469631, 0.424109, 2.006775, 0, 0, 0, 1, 1,
0.4477962, 0.357208, 2.437387, 0, 0, 0, 1, 1,
0.448072, 0.5004517, 1.152208, 0, 0, 0, 1, 1,
0.4488385, 0.6637859, 1.784943, 0, 0, 0, 1, 1,
0.4556871, 0.711224, 1.234517, 0, 0, 0, 1, 1,
0.4585918, -0.5652009, 3.762955, 0, 0, 0, 1, 1,
0.4631387, 0.08581854, 1.244757, 1, 1, 1, 1, 1,
0.469183, 1.436758, 0.6007905, 1, 1, 1, 1, 1,
0.4696634, -2.516628, 2.001084, 1, 1, 1, 1, 1,
0.4746653, -1.150634, 1.712107, 1, 1, 1, 1, 1,
0.4760612, -0.9786751, 2.0488, 1, 1, 1, 1, 1,
0.4783987, 0.6500965, 2.408576, 1, 1, 1, 1, 1,
0.4851344, -0.6161683, 2.426662, 1, 1, 1, 1, 1,
0.4898712, -0.1380481, 1.429263, 1, 1, 1, 1, 1,
0.4914128, -0.8958954, 2.449519, 1, 1, 1, 1, 1,
0.4943941, 2.063936, 0.6415027, 1, 1, 1, 1, 1,
0.494428, 0.6365548, -0.8430831, 1, 1, 1, 1, 1,
0.4976959, -0.6843228, 2.120811, 1, 1, 1, 1, 1,
0.4985279, 0.7149568, 0.3354137, 1, 1, 1, 1, 1,
0.5014492, -0.8627114, 2.760783, 1, 1, 1, 1, 1,
0.5041317, 0.6412563, 0.6243494, 1, 1, 1, 1, 1,
0.5066885, 0.3747855, 0.2672361, 0, 0, 1, 1, 1,
0.5100608, -1.855639, 3.623726, 1, 0, 0, 1, 1,
0.5101953, 0.7415178, -1.081865, 1, 0, 0, 1, 1,
0.5130093, 0.3581417, -0.4116831, 1, 0, 0, 1, 1,
0.5147616, 0.7331922, 0.7448658, 1, 0, 0, 1, 1,
0.5193442, -1.531662, 4.440603, 1, 0, 0, 1, 1,
0.5215253, 0.220358, 1.333967, 0, 0, 0, 1, 1,
0.5240758, 0.9216121, -0.6968291, 0, 0, 0, 1, 1,
0.525801, -0.781617, 1.844432, 0, 0, 0, 1, 1,
0.5273885, -1.393807, 2.812951, 0, 0, 0, 1, 1,
0.5277123, 0.2463968, 0.2161269, 0, 0, 0, 1, 1,
0.5348089, -0.8109132, 2.739321, 0, 0, 0, 1, 1,
0.5378056, 0.1597402, 1.522124, 0, 0, 0, 1, 1,
0.5407901, -0.9568942, 4.192768, 1, 1, 1, 1, 1,
0.5414086, -0.4915526, 1.672276, 1, 1, 1, 1, 1,
0.5421353, -0.03086523, 2.793494, 1, 1, 1, 1, 1,
0.5455674, -0.7233003, 1.956871, 1, 1, 1, 1, 1,
0.5491512, -0.5267017, 2.781384, 1, 1, 1, 1, 1,
0.5693036, 1.01431, 0.9622415, 1, 1, 1, 1, 1,
0.5709578, 0.6374545, -0.799279, 1, 1, 1, 1, 1,
0.573507, -1.431427, 3.405243, 1, 1, 1, 1, 1,
0.5766411, -1.40348, 3.528399, 1, 1, 1, 1, 1,
0.5772337, 0.8213024, -0.3005321, 1, 1, 1, 1, 1,
0.5793568, -0.4829027, 3.19126, 1, 1, 1, 1, 1,
0.5896696, 0.963985, 0.9414834, 1, 1, 1, 1, 1,
0.5921787, -0.5820723, 2.644938, 1, 1, 1, 1, 1,
0.5974298, -0.4009655, 4.422188, 1, 1, 1, 1, 1,
0.6069764, 0.2636036, 1.367187, 1, 1, 1, 1, 1,
0.6074471, 0.8411403, -1.019226, 0, 0, 1, 1, 1,
0.608734, -0.09306234, 1.244811, 1, 0, 0, 1, 1,
0.6094133, 1.481091, 0.5303975, 1, 0, 0, 1, 1,
0.6095185, 0.4879833, 1.704201, 1, 0, 0, 1, 1,
0.6103367, 0.21924, 2.116254, 1, 0, 0, 1, 1,
0.6156209, -0.08444809, 0.9178319, 1, 0, 0, 1, 1,
0.6167634, -0.7738796, 2.060072, 0, 0, 0, 1, 1,
0.618683, 1.121467, -0.4670804, 0, 0, 0, 1, 1,
0.6187453, 2.046158, 0.8496072, 0, 0, 0, 1, 1,
0.620479, 1.261981, 1.13053, 0, 0, 0, 1, 1,
0.6213009, 1.323354, 0.3897437, 0, 0, 0, 1, 1,
0.6258299, -2.732161, 3.533884, 0, 0, 0, 1, 1,
0.6263946, -0.8323413, 2.238365, 0, 0, 0, 1, 1,
0.6267057, -0.2899888, 3.667299, 1, 1, 1, 1, 1,
0.6274072, -0.09535021, 1.356663, 1, 1, 1, 1, 1,
0.6290221, 1.06126, -0.5077181, 1, 1, 1, 1, 1,
0.6298258, -0.5452549, 1.191253, 1, 1, 1, 1, 1,
0.6313593, 0.5538439, 1.657095, 1, 1, 1, 1, 1,
0.6320409, -0.04026951, 1.834554, 1, 1, 1, 1, 1,
0.6328602, -0.6903605, 2.746224, 1, 1, 1, 1, 1,
0.6360554, -0.9330313, 0.939278, 1, 1, 1, 1, 1,
0.6555032, 0.5920051, 1.808619, 1, 1, 1, 1, 1,
0.6564489, -0.3641063, 2.852936, 1, 1, 1, 1, 1,
0.6566851, 0.08500808, 2.275525, 1, 1, 1, 1, 1,
0.6574285, 1.063187, -0.5105098, 1, 1, 1, 1, 1,
0.6591914, 0.4135802, 2.920094, 1, 1, 1, 1, 1,
0.6604998, 1.379256, 0.3663689, 1, 1, 1, 1, 1,
0.6630129, -1.390642, 4.523365, 1, 1, 1, 1, 1,
0.6739053, -0.6914582, 3.174328, 0, 0, 1, 1, 1,
0.6764188, 0.5064657, 0.6595092, 1, 0, 0, 1, 1,
0.67863, 0.2084669, 0.6392118, 1, 0, 0, 1, 1,
0.6805174, -0.002044248, 1.955648, 1, 0, 0, 1, 1,
0.6831697, 0.8961265, 0.180161, 1, 0, 0, 1, 1,
0.6835546, 0.4238207, 0.7879034, 1, 0, 0, 1, 1,
0.6840215, 0.02028468, 2.064424, 0, 0, 0, 1, 1,
0.6868575, 1.669649, -0.1384877, 0, 0, 0, 1, 1,
0.6869531, -1.273299, 2.661975, 0, 0, 0, 1, 1,
0.6877033, 0.7481617, 0.1794, 0, 0, 0, 1, 1,
0.6891224, -2.214042, 4.275017, 0, 0, 0, 1, 1,
0.6892528, 0.6918125, 1.022605, 0, 0, 0, 1, 1,
0.7019155, 0.04289955, 2.889003, 0, 0, 0, 1, 1,
0.7050908, 1.141638, 1.3666, 1, 1, 1, 1, 1,
0.718444, 2.079237, -0.1020229, 1, 1, 1, 1, 1,
0.7185366, 0.1702391, 0.09694622, 1, 1, 1, 1, 1,
0.7196808, 0.9304507, 1.738103, 1, 1, 1, 1, 1,
0.7327545, -0.05226881, -0.6280819, 1, 1, 1, 1, 1,
0.7339723, 0.5906258, -0.005284559, 1, 1, 1, 1, 1,
0.735538, -0.5644973, 1.247324, 1, 1, 1, 1, 1,
0.7425957, -0.6893359, 1.583123, 1, 1, 1, 1, 1,
0.746796, -1.233502, 3.817263, 1, 1, 1, 1, 1,
0.7468718, 0.06170313, 1.449087, 1, 1, 1, 1, 1,
0.7487809, 0.5687147, 1.03703, 1, 1, 1, 1, 1,
0.7547246, -0.4784255, 1.992944, 1, 1, 1, 1, 1,
0.7579823, -0.3393522, 2.458285, 1, 1, 1, 1, 1,
0.7585143, 0.3308696, 0.5063266, 1, 1, 1, 1, 1,
0.758737, 1.081469, 0.089467, 1, 1, 1, 1, 1,
0.7648005, -0.4265389, 0.2215355, 0, 0, 1, 1, 1,
0.7662722, -1.394834, 0.8104638, 1, 0, 0, 1, 1,
0.7688025, -1.434218, 3.966038, 1, 0, 0, 1, 1,
0.7722152, -0.06290707, 2.339198, 1, 0, 0, 1, 1,
0.7743217, 0.6812131, 1.996317, 1, 0, 0, 1, 1,
0.7779858, 1.058249, 0.4566683, 1, 0, 0, 1, 1,
0.7892255, -0.5473826, 2.40177, 0, 0, 0, 1, 1,
0.7907886, -1.345146, 2.664964, 0, 0, 0, 1, 1,
0.7951756, 0.09230818, 1.282094, 0, 0, 0, 1, 1,
0.8096984, -2.256207, 3.106255, 0, 0, 0, 1, 1,
0.8098084, 1.245354, 0.7917504, 0, 0, 0, 1, 1,
0.8244038, -2.259977, 4.862106, 0, 0, 0, 1, 1,
0.8324185, 0.7702576, 1.279915, 0, 0, 0, 1, 1,
0.8327709, 1.50112, 1.477545, 1, 1, 1, 1, 1,
0.8486964, 0.7705691, -0.3606307, 1, 1, 1, 1, 1,
0.8495715, 0.677936, -0.3986346, 1, 1, 1, 1, 1,
0.8514045, -0.7564564, 1.554908, 1, 1, 1, 1, 1,
0.8538344, 0.107654, 2.699233, 1, 1, 1, 1, 1,
0.8560611, -1.891655, 2.641942, 1, 1, 1, 1, 1,
0.8565846, -0.2829286, 2.269459, 1, 1, 1, 1, 1,
0.86335, -0.6300518, 1.913687, 1, 1, 1, 1, 1,
0.8652453, -0.2008517, 3.081079, 1, 1, 1, 1, 1,
0.8712334, 1.257162, 1.134145, 1, 1, 1, 1, 1,
0.876451, 0.1674606, 2.167336, 1, 1, 1, 1, 1,
0.8824856, 0.2665348, 0.8522012, 1, 1, 1, 1, 1,
0.8857713, -0.2508726, 1.384986, 1, 1, 1, 1, 1,
0.8867671, -0.3663703, 1.862641, 1, 1, 1, 1, 1,
0.8910787, -0.3826632, 1.875482, 1, 1, 1, 1, 1,
0.8971574, -0.2108191, 2.252189, 0, 0, 1, 1, 1,
0.9001331, 0.6036894, 2.750334, 1, 0, 0, 1, 1,
0.9038504, -1.252045, 2.555576, 1, 0, 0, 1, 1,
0.9101002, 0.5033078, 1.742683, 1, 0, 0, 1, 1,
0.9109604, 0.7515758, 1.048843, 1, 0, 0, 1, 1,
0.9149346, -0.03806803, 1.701131, 1, 0, 0, 1, 1,
0.918981, 1.685993, 1.2194, 0, 0, 0, 1, 1,
0.920065, -0.1823735, 3.201095, 0, 0, 0, 1, 1,
0.927159, -0.7980981, 2.360023, 0, 0, 0, 1, 1,
0.9290066, 2.13889, 1.44476, 0, 0, 0, 1, 1,
0.9297808, 0.6494489, 0.6129373, 0, 0, 0, 1, 1,
0.9460208, 0.5448775, 2.915935, 0, 0, 0, 1, 1,
0.9478228, 0.1637848, 0.2681834, 0, 0, 0, 1, 1,
0.9584697, -0.9567769, 2.405625, 1, 1, 1, 1, 1,
0.9622511, 0.8884501, -0.3090062, 1, 1, 1, 1, 1,
0.9685817, -0.2389032, 2.742584, 1, 1, 1, 1, 1,
0.9711944, 0.1274179, -0.6175895, 1, 1, 1, 1, 1,
0.9767001, 1.542455, 1.998674, 1, 1, 1, 1, 1,
0.9840847, -1.020336, 2.085676, 1, 1, 1, 1, 1,
0.9894921, 0.4699095, 0.5728675, 1, 1, 1, 1, 1,
0.9896216, 0.7219127, -0.01146411, 1, 1, 1, 1, 1,
0.9924355, -1.724373, 2.112065, 1, 1, 1, 1, 1,
0.9933369, -0.5993338, 2.557229, 1, 1, 1, 1, 1,
0.9941756, -0.7811561, 2.064044, 1, 1, 1, 1, 1,
0.9967102, -0.7051407, 1.105445, 1, 1, 1, 1, 1,
0.9972723, -0.3124261, 0.6883738, 1, 1, 1, 1, 1,
0.9991563, -0.322832, 1.60857, 1, 1, 1, 1, 1,
1.005552, 0.6302407, 0.8461402, 1, 1, 1, 1, 1,
1.019296, -0.05694876, 0.5971842, 0, 0, 1, 1, 1,
1.020823, -0.1932701, 1.488905, 1, 0, 0, 1, 1,
1.033563, 0.237947, 1.082206, 1, 0, 0, 1, 1,
1.039649, -0.01158998, 0.8329594, 1, 0, 0, 1, 1,
1.040292, -0.5331639, 0.2454645, 1, 0, 0, 1, 1,
1.041565, -1.051408, 3.580741, 1, 0, 0, 1, 1,
1.068771, -0.9155984, 1.666803, 0, 0, 0, 1, 1,
1.0711, 0.1378562, 2.359028, 0, 0, 0, 1, 1,
1.078211, -0.0434126, 1.506282, 0, 0, 0, 1, 1,
1.079701, 0.9206752, -0.627605, 0, 0, 0, 1, 1,
1.080402, 0.3870667, 1.157281, 0, 0, 0, 1, 1,
1.080475, 0.7439798, 0.4388269, 0, 0, 0, 1, 1,
1.08151, -0.5080165, 2.287919, 0, 0, 0, 1, 1,
1.0828, -0.7820234, 2.604815, 1, 1, 1, 1, 1,
1.084641, 0.1832929, 2.860905, 1, 1, 1, 1, 1,
1.086984, 0.3170169, 2.312362, 1, 1, 1, 1, 1,
1.089424, -0.5646966, 1.782497, 1, 1, 1, 1, 1,
1.094127, -0.02016956, 2.456508, 1, 1, 1, 1, 1,
1.100966, -1.101897, 1.603786, 1, 1, 1, 1, 1,
1.101359, -1.571366, 0.3260641, 1, 1, 1, 1, 1,
1.101843, 0.2014235, 4.014505, 1, 1, 1, 1, 1,
1.105704, 0.2479534, 0.7877762, 1, 1, 1, 1, 1,
1.112231, 0.2439819, 0.7372913, 1, 1, 1, 1, 1,
1.124969, -1.644854, 1.262377, 1, 1, 1, 1, 1,
1.126221, -1.484169, 3.647744, 1, 1, 1, 1, 1,
1.134415, -0.01586074, 2.246434, 1, 1, 1, 1, 1,
1.134581, -0.03864574, 0.8685331, 1, 1, 1, 1, 1,
1.138019, -0.797146, 1.872259, 1, 1, 1, 1, 1,
1.138048, 1.970482, 0.4691081, 0, 0, 1, 1, 1,
1.142278, -0.3188727, 2.751189, 1, 0, 0, 1, 1,
1.144693, 0.1433678, 2.049709, 1, 0, 0, 1, 1,
1.152006, 2.246831, 1.316333, 1, 0, 0, 1, 1,
1.153103, -1.1598, 1.710031, 1, 0, 0, 1, 1,
1.157338, 0.7848846, -0.51596, 1, 0, 0, 1, 1,
1.15779, -1.420754, 3.544149, 0, 0, 0, 1, 1,
1.168182, 0.415751, -0.1697805, 0, 0, 0, 1, 1,
1.170955, -0.7565502, 1.31496, 0, 0, 0, 1, 1,
1.179068, -0.5610604, 2.588324, 0, 0, 0, 1, 1,
1.18642, 0.6686702, 0.5678213, 0, 0, 0, 1, 1,
1.187009, -0.6381171, 1.985817, 0, 0, 0, 1, 1,
1.189712, -0.1802646, 0.7863924, 0, 0, 0, 1, 1,
1.190067, 1.293769, 1.364132, 1, 1, 1, 1, 1,
1.191183, -0.1487467, 3.16479, 1, 1, 1, 1, 1,
1.192006, -0.3375682, 1.375981, 1, 1, 1, 1, 1,
1.196625, 0.6813971, 2.472714, 1, 1, 1, 1, 1,
1.201815, 0.5171704, 1.033453, 1, 1, 1, 1, 1,
1.203424, 0.6047662, 1.318306, 1, 1, 1, 1, 1,
1.204564, 0.7514811, 1.131004, 1, 1, 1, 1, 1,
1.206419, -0.3730215, 1.758001, 1, 1, 1, 1, 1,
1.212515, -0.3610516, -0.102886, 1, 1, 1, 1, 1,
1.228281, 0.6417947, 2.623645, 1, 1, 1, 1, 1,
1.228829, 0.7991843, 1.426193, 1, 1, 1, 1, 1,
1.235088, 0.4465479, 0.2247796, 1, 1, 1, 1, 1,
1.238782, 1.03671, 0.6560528, 1, 1, 1, 1, 1,
1.243151, -0.095901, 2.585584, 1, 1, 1, 1, 1,
1.243915, 0.6368422, 3.140344, 1, 1, 1, 1, 1,
1.245764, -0.5622882, 2.339891, 0, 0, 1, 1, 1,
1.247451, -1.022756, 3.428629, 1, 0, 0, 1, 1,
1.256333, 0.6297235, -0.9550385, 1, 0, 0, 1, 1,
1.257522, 1.272532, 0.04293565, 1, 0, 0, 1, 1,
1.259384, -0.7376493, 0.1643041, 1, 0, 0, 1, 1,
1.280573, -0.4802949, 2.249043, 1, 0, 0, 1, 1,
1.290819, 0.07732559, 1.92884, 0, 0, 0, 1, 1,
1.299106, 1.009069, 2.859133, 0, 0, 0, 1, 1,
1.304322, -1.275356, 3.452915, 0, 0, 0, 1, 1,
1.314174, -0.8301117, 3.603762, 0, 0, 0, 1, 1,
1.334439, -0.4569321, 4.488973, 0, 0, 0, 1, 1,
1.33847, -0.4337566, 0.3775915, 0, 0, 0, 1, 1,
1.354045, -1.07305, 0.778959, 0, 0, 0, 1, 1,
1.357977, -1.82878, 3.274254, 1, 1, 1, 1, 1,
1.358709, 1.724545, 1.229235, 1, 1, 1, 1, 1,
1.365595, -0.9031547, 1.4905, 1, 1, 1, 1, 1,
1.367184, 0.6005286, 0.1024579, 1, 1, 1, 1, 1,
1.373052, -1.461271, 0.8466001, 1, 1, 1, 1, 1,
1.374616, 1.13527, 1.89753, 1, 1, 1, 1, 1,
1.376747, 0.3378654, 2.407302, 1, 1, 1, 1, 1,
1.39195, 0.9212635, 0.8685001, 1, 1, 1, 1, 1,
1.418216, -1.37023, 2.163939, 1, 1, 1, 1, 1,
1.425544, -0.6020205, 1.400251, 1, 1, 1, 1, 1,
1.433546, 0.2263914, 0.7104121, 1, 1, 1, 1, 1,
1.433585, 0.3913379, 2.469625, 1, 1, 1, 1, 1,
1.437431, 0.4662305, 0.9433693, 1, 1, 1, 1, 1,
1.448135, 0.2993833, 2.954291, 1, 1, 1, 1, 1,
1.455463, -0.757767, 3.948796, 1, 1, 1, 1, 1,
1.459607, -1.627504, 1.408436, 0, 0, 1, 1, 1,
1.464566, -0.4533267, 2.401094, 1, 0, 0, 1, 1,
1.467332, -0.4585875, 2.485773, 1, 0, 0, 1, 1,
1.469488, -0.5765957, 2.1635, 1, 0, 0, 1, 1,
1.471808, -0.1565952, 0.422116, 1, 0, 0, 1, 1,
1.483654, -0.202352, 1.027784, 1, 0, 0, 1, 1,
1.492199, 0.1779264, 0.7593678, 0, 0, 0, 1, 1,
1.509465, 0.944232, -2.443337, 0, 0, 0, 1, 1,
1.520185, -0.2025633, 2.758249, 0, 0, 0, 1, 1,
1.523772, 1.811566, 0.9686724, 0, 0, 0, 1, 1,
1.530187, -0.4825831, 0.2405223, 0, 0, 0, 1, 1,
1.538877, 0.1080647, 2.558433, 0, 0, 0, 1, 1,
1.541227, 0.3567046, -0.7634412, 0, 0, 0, 1, 1,
1.545909, -0.3242745, 0.3464707, 1, 1, 1, 1, 1,
1.547771, 0.7370937, 1.402, 1, 1, 1, 1, 1,
1.55823, 0.1576968, 2.505767, 1, 1, 1, 1, 1,
1.559441, 1.150749, 2.04658, 1, 1, 1, 1, 1,
1.56471, -1.269135, 2.612524, 1, 1, 1, 1, 1,
1.573712, -0.9095067, 2.183579, 1, 1, 1, 1, 1,
1.580649, -0.02166634, 3.077376, 1, 1, 1, 1, 1,
1.585716, -1.880943, 2.319944, 1, 1, 1, 1, 1,
1.597521, 0.6744557, 0.6191645, 1, 1, 1, 1, 1,
1.601192, 1.474955, 0.7438664, 1, 1, 1, 1, 1,
1.602892, 0.5688838, 2.954068, 1, 1, 1, 1, 1,
1.628044, 1.020314, 1.94436, 1, 1, 1, 1, 1,
1.638449, 1.63134, 2.215657, 1, 1, 1, 1, 1,
1.645426, 0.4800308, -0.55093, 1, 1, 1, 1, 1,
1.657365, 1.803493, 0.02121481, 1, 1, 1, 1, 1,
1.657711, 0.7515217, 1.350839, 0, 0, 1, 1, 1,
1.658558, 0.4787335, 1.655876, 1, 0, 0, 1, 1,
1.659344, -1.079398, 2.810184, 1, 0, 0, 1, 1,
1.660991, 0.3580204, 0.5136172, 1, 0, 0, 1, 1,
1.675698, -0.9656712, 2.736115, 1, 0, 0, 1, 1,
1.690613, 0.267158, 1.199728, 1, 0, 0, 1, 1,
1.695262, 0.3124387, 3.363343, 0, 0, 0, 1, 1,
1.702171, 0.5994425, 1.581545, 0, 0, 0, 1, 1,
1.704388, 0.3325474, 2.069099, 0, 0, 0, 1, 1,
1.70946, -1.502632, 3.516319, 0, 0, 0, 1, 1,
1.715285, -0.3483484, 0.9824598, 0, 0, 0, 1, 1,
1.723101, 0.741006, 2.356013, 0, 0, 0, 1, 1,
1.723393, -0.2385175, 3.180823, 0, 0, 0, 1, 1,
1.7357, 0.446822, 2.12198, 1, 1, 1, 1, 1,
1.793912, 1.443965, 1.128844, 1, 1, 1, 1, 1,
1.795371, 0.1873592, 1.604762, 1, 1, 1, 1, 1,
1.825818, -0.703852, 1.354339, 1, 1, 1, 1, 1,
1.836773, 0.9966842, -0.7243329, 1, 1, 1, 1, 1,
1.853124, -0.5779548, 2.552344, 1, 1, 1, 1, 1,
1.853903, 0.3580601, 0.5499674, 1, 1, 1, 1, 1,
1.879909, -1.224446, 2.697959, 1, 1, 1, 1, 1,
1.881079, 0.6303915, 0.385715, 1, 1, 1, 1, 1,
1.886033, -0.1919968, 3.143465, 1, 1, 1, 1, 1,
1.895673, -1.787415, 1.457624, 1, 1, 1, 1, 1,
1.905018, 1.271201, 0.8553699, 1, 1, 1, 1, 1,
1.907111, 1.228569, 2.116729, 1, 1, 1, 1, 1,
1.930174, -0.6925464, 2.383043, 1, 1, 1, 1, 1,
1.932346, -0.6802973, 2.007412, 1, 1, 1, 1, 1,
1.934189, 1.536556, 0.2305582, 0, 0, 1, 1, 1,
1.978776, 0.2681276, 1.000629, 1, 0, 0, 1, 1,
2.015221, 0.03177492, 2.250322, 1, 0, 0, 1, 1,
2.021762, 1.183876, -0.4343027, 1, 0, 0, 1, 1,
2.022307, -0.9095559, 1.008349, 1, 0, 0, 1, 1,
2.033838, -0.9749998, 2.490688, 1, 0, 0, 1, 1,
2.141012, -0.7916818, 1.277888, 0, 0, 0, 1, 1,
2.149719, 0.6160232, 1.980881, 0, 0, 0, 1, 1,
2.244512, 0.3581797, 1.993632, 0, 0, 0, 1, 1,
2.261594, -0.8774428, 3.149643, 0, 0, 0, 1, 1,
2.265724, 1.202883, 1.250261, 0, 0, 0, 1, 1,
2.293393, -1.994824, 0.9399161, 0, 0, 0, 1, 1,
2.421245, 1.608539, 0.8160424, 0, 0, 0, 1, 1,
2.432398, -0.7084494, 1.277845, 1, 1, 1, 1, 1,
2.437429, -0.1396828, 1.363943, 1, 1, 1, 1, 1,
2.640829, 0.6663366, 1.486008, 1, 1, 1, 1, 1,
2.761475, -0.1590545, 1.706923, 1, 1, 1, 1, 1,
2.891605, -0.3606801, 0.6882426, 1, 1, 1, 1, 1,
3.008536, 0.5912435, 1.558709, 1, 1, 1, 1, 1,
3.263548, 0.1636268, 1.468173, 1, 1, 1, 1, 1
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
var radius = 9.322312;
var distance = 32.74423;
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
mvMatrix.translate( -0.06673527, -0.2289462, -0.08902621 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.74423);
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
