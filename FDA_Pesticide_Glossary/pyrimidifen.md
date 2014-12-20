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
-3.096571, -0.4294327, -1.054353, 1, 0, 0, 1,
-3.028972, 0.2477725, -1.419144, 1, 0.007843138, 0, 1,
-2.651923, -0.8603539, -1.642106, 1, 0.01176471, 0, 1,
-2.647964, 0.2572591, -0.3515117, 1, 0.01960784, 0, 1,
-2.419717, -0.2383355, 0.623845, 1, 0.02352941, 0, 1,
-2.414021, -0.0439388, -3.481837, 1, 0.03137255, 0, 1,
-2.390554, 2.730472, -1.061333, 1, 0.03529412, 0, 1,
-2.329305, -0.1438248, -1.468051, 1, 0.04313726, 0, 1,
-2.31768, -0.672739, -2.794917, 1, 0.04705882, 0, 1,
-2.250385, 0.2177547, -1.793528, 1, 0.05490196, 0, 1,
-2.240103, -0.1353426, -1.501248, 1, 0.05882353, 0, 1,
-2.233614, 0.3531704, -1.187858, 1, 0.06666667, 0, 1,
-2.18939, 0.05847354, -3.174416, 1, 0.07058824, 0, 1,
-2.127907, 0.2973872, -1.107235, 1, 0.07843138, 0, 1,
-2.036029, 0.2796675, -2.537662, 1, 0.08235294, 0, 1,
-2.035347, -0.2006692, -1.185431, 1, 0.09019608, 0, 1,
-2.012894, -0.9859539, -0.408142, 1, 0.09411765, 0, 1,
-1.985736, 0.9841081, -0.511626, 1, 0.1019608, 0, 1,
-1.980363, -0.02869498, -0.1315751, 1, 0.1098039, 0, 1,
-1.967408, -0.9611954, -0.2083328, 1, 0.1137255, 0, 1,
-1.955548, 0.8802365, -1.93073, 1, 0.1215686, 0, 1,
-1.95054, 0.6807718, -2.024321, 1, 0.1254902, 0, 1,
-1.936789, 0.1012412, -2.369083, 1, 0.1333333, 0, 1,
-1.904068, 0.04044355, -0.2088768, 1, 0.1372549, 0, 1,
-1.892618, -0.7687981, -3.849886, 1, 0.145098, 0, 1,
-1.883819, 0.3404328, -0.776095, 1, 0.1490196, 0, 1,
-1.883124, 0.820749, -1.080631, 1, 0.1568628, 0, 1,
-1.879697, 0.1819761, -0.7544843, 1, 0.1607843, 0, 1,
-1.878059, 0.2128126, -0.9233204, 1, 0.1686275, 0, 1,
-1.868796, 0.02487129, -1.965372, 1, 0.172549, 0, 1,
-1.863297, -1.386784, -2.025484, 1, 0.1803922, 0, 1,
-1.850182, -0.6874389, -0.8062801, 1, 0.1843137, 0, 1,
-1.844268, 0.4023453, -2.300862, 1, 0.1921569, 0, 1,
-1.812174, 0.1423632, -0.8444734, 1, 0.1960784, 0, 1,
-1.808601, -0.1165298, -0.08157641, 1, 0.2039216, 0, 1,
-1.808346, -1.793096, -2.330547, 1, 0.2117647, 0, 1,
-1.804464, 0.77372, -0.7952189, 1, 0.2156863, 0, 1,
-1.798157, 2.093067, -1.186414, 1, 0.2235294, 0, 1,
-1.782273, 1.312886, -3.188545, 1, 0.227451, 0, 1,
-1.771259, 0.8400437, -1.249464, 1, 0.2352941, 0, 1,
-1.741349, -0.8078679, -2.042743, 1, 0.2392157, 0, 1,
-1.712869, 0.8851822, -1.157967, 1, 0.2470588, 0, 1,
-1.702587, -0.845208, -2.372716, 1, 0.2509804, 0, 1,
-1.689993, 0.4302723, -2.341254, 1, 0.2588235, 0, 1,
-1.688987, 0.06848327, -1.327072, 1, 0.2627451, 0, 1,
-1.668179, 1.563079, 0.1346339, 1, 0.2705882, 0, 1,
-1.664079, 0.6208317, -0.4627989, 1, 0.2745098, 0, 1,
-1.63605, -0.3454377, -1.410844, 1, 0.282353, 0, 1,
-1.627297, 0.5569612, -0.8644348, 1, 0.2862745, 0, 1,
-1.615424, 0.4408951, -0.2054311, 1, 0.2941177, 0, 1,
-1.601051, 0.03665523, -1.253348, 1, 0.3019608, 0, 1,
-1.597749, 1.483109, -2.827448, 1, 0.3058824, 0, 1,
-1.593231, -0.4194138, -0.8299019, 1, 0.3137255, 0, 1,
-1.589837, 1.52301, -1.066577, 1, 0.3176471, 0, 1,
-1.586537, 0.9194595, -1.419799, 1, 0.3254902, 0, 1,
-1.576233, 0.3339936, -0.0653065, 1, 0.3294118, 0, 1,
-1.571228, -0.8500103, -4.513855, 1, 0.3372549, 0, 1,
-1.557146, 0.3464807, -0.506137, 1, 0.3411765, 0, 1,
-1.556436, -1.436787, -0.950227, 1, 0.3490196, 0, 1,
-1.550493, 0.745501, -0.006494755, 1, 0.3529412, 0, 1,
-1.538439, 0.3242601, -1.256313, 1, 0.3607843, 0, 1,
-1.53176, 0.7137994, -1.095106, 1, 0.3647059, 0, 1,
-1.511214, -0.005945989, -2.707562, 1, 0.372549, 0, 1,
-1.502088, -0.1046402, -1.052311, 1, 0.3764706, 0, 1,
-1.496147, -0.7871215, -1.851171, 1, 0.3843137, 0, 1,
-1.495951, -2.499408, -2.878198, 1, 0.3882353, 0, 1,
-1.48931, -0.4132158, -2.289533, 1, 0.3960784, 0, 1,
-1.481744, 1.695253, -2.050275, 1, 0.4039216, 0, 1,
-1.479578, -1.181141, -2.627659, 1, 0.4078431, 0, 1,
-1.475562, 0.2143222, -0.1304481, 1, 0.4156863, 0, 1,
-1.467088, 1.603143, 0.2493812, 1, 0.4196078, 0, 1,
-1.466213, -0.7705921, -2.752467, 1, 0.427451, 0, 1,
-1.465919, -1.415215, -3.725518, 1, 0.4313726, 0, 1,
-1.464116, 0.04463831, -0.4770089, 1, 0.4392157, 0, 1,
-1.460736, 0.8804243, -2.430912, 1, 0.4431373, 0, 1,
-1.453572, -0.3446495, -0.1596474, 1, 0.4509804, 0, 1,
-1.445976, -0.001421065, -1.679167, 1, 0.454902, 0, 1,
-1.444248, 0.3440364, -0.4638164, 1, 0.4627451, 0, 1,
-1.435313, 1.140642, -1.486475, 1, 0.4666667, 0, 1,
-1.433014, 0.815827, -1.204051, 1, 0.4745098, 0, 1,
-1.427092, -0.1699669, -1.584323, 1, 0.4784314, 0, 1,
-1.424022, -1.635411, -2.47755, 1, 0.4862745, 0, 1,
-1.420666, -1.311828, -1.858046, 1, 0.4901961, 0, 1,
-1.406041, 1.044611, -2.113578, 1, 0.4980392, 0, 1,
-1.393523, 0.213096, -1.376471, 1, 0.5058824, 0, 1,
-1.3905, 1.857451, -0.1379582, 1, 0.509804, 0, 1,
-1.38677, 0.1272278, -4.318289, 1, 0.5176471, 0, 1,
-1.374554, 0.9620506, -1.71104, 1, 0.5215687, 0, 1,
-1.372062, 0.127955, -2.602751, 1, 0.5294118, 0, 1,
-1.367032, -0.226358, -2.032192, 1, 0.5333334, 0, 1,
-1.34936, -2.789544, -3.556599, 1, 0.5411765, 0, 1,
-1.344638, -0.2707122, -1.617878, 1, 0.5450981, 0, 1,
-1.33276, -0.1114475, -1.5353, 1, 0.5529412, 0, 1,
-1.321377, 0.3615884, 0.7095538, 1, 0.5568628, 0, 1,
-1.312191, -0.3894651, -1.529383, 1, 0.5647059, 0, 1,
-1.303848, 1.674287, -1.056305, 1, 0.5686275, 0, 1,
-1.294721, 0.7334085, -2.322529, 1, 0.5764706, 0, 1,
-1.293534, 1.126505, -0.5721037, 1, 0.5803922, 0, 1,
-1.287523, -0.1015437, -2.171893, 1, 0.5882353, 0, 1,
-1.282026, -0.6325266, -3.073295, 1, 0.5921569, 0, 1,
-1.28083, 0.07279734, -1.429918, 1, 0.6, 0, 1,
-1.280738, 0.4181296, 0.4999364, 1, 0.6078432, 0, 1,
-1.267896, 0.8219282, -0.1252503, 1, 0.6117647, 0, 1,
-1.266453, -1.237927, -2.95806, 1, 0.6196079, 0, 1,
-1.26358, 0.4100899, -0.9157469, 1, 0.6235294, 0, 1,
-1.258446, -0.6569324, -2.349391, 1, 0.6313726, 0, 1,
-1.233252, -2.114241, -1.974835, 1, 0.6352941, 0, 1,
-1.229779, -0.6276422, -1.374311, 1, 0.6431373, 0, 1,
-1.222458, 0.8961056, -1.245387, 1, 0.6470588, 0, 1,
-1.215029, 0.5803567, -1.211694, 1, 0.654902, 0, 1,
-1.214764, -0.8798878, -1.28414, 1, 0.6588235, 0, 1,
-1.208654, -0.2195237, -0.3814702, 1, 0.6666667, 0, 1,
-1.207757, 0.5526673, -2.511055, 1, 0.6705883, 0, 1,
-1.205776, 0.589535, -0.744404, 1, 0.6784314, 0, 1,
-1.196458, -0.1461751, -1.479988, 1, 0.682353, 0, 1,
-1.196069, 0.1379601, -2.386674, 1, 0.6901961, 0, 1,
-1.195834, -0.4798034, -1.744929, 1, 0.6941177, 0, 1,
-1.193752, 0.821788, -0.718895, 1, 0.7019608, 0, 1,
-1.191538, -0.5714808, -2.587408, 1, 0.7098039, 0, 1,
-1.185194, -0.09691723, -1.468553, 1, 0.7137255, 0, 1,
-1.177441, 1.173829, -0.7368748, 1, 0.7215686, 0, 1,
-1.17444, 1.7807, 1.228061, 1, 0.7254902, 0, 1,
-1.170269, 0.4823957, -0.3427212, 1, 0.7333333, 0, 1,
-1.162573, 0.7958943, -0.8065871, 1, 0.7372549, 0, 1,
-1.161016, 0.8766057, -0.6754224, 1, 0.7450981, 0, 1,
-1.148678, 0.5173938, -1.297291, 1, 0.7490196, 0, 1,
-1.142255, -0.2593274, -0.8033261, 1, 0.7568628, 0, 1,
-1.141577, -0.7501611, -2.247607, 1, 0.7607843, 0, 1,
-1.134014, 1.253829, -1.560139, 1, 0.7686275, 0, 1,
-1.131741, -0.3268559, -1.918856, 1, 0.772549, 0, 1,
-1.125862, -0.07532857, 0.9871188, 1, 0.7803922, 0, 1,
-1.125839, -0.2748192, -0.7421303, 1, 0.7843137, 0, 1,
-1.12409, -0.7437717, -2.016797, 1, 0.7921569, 0, 1,
-1.120802, 2.165754, 0.1974411, 1, 0.7960784, 0, 1,
-1.119033, -0.7019537, -1.376421, 1, 0.8039216, 0, 1,
-1.101879, 0.1262126, -2.042879, 1, 0.8117647, 0, 1,
-1.092649, -0.2750602, -1.129127, 1, 0.8156863, 0, 1,
-1.087157, -1.612912, -1.73713, 1, 0.8235294, 0, 1,
-1.0871, -0.3024672, -1.883891, 1, 0.827451, 0, 1,
-1.082567, -1.070474, -1.539702, 1, 0.8352941, 0, 1,
-1.079661, -1.026507, -2.559225, 1, 0.8392157, 0, 1,
-1.078385, -0.4833327, -1.84257, 1, 0.8470588, 0, 1,
-1.077268, 0.1048809, -2.530982, 1, 0.8509804, 0, 1,
-1.076871, 0.8127509, -0.5711752, 1, 0.8588235, 0, 1,
-1.07631, -0.3506177, -2.696644, 1, 0.8627451, 0, 1,
-1.075545, -0.3296407, -2.082386, 1, 0.8705882, 0, 1,
-1.069231, -2.419999, -3.799511, 1, 0.8745098, 0, 1,
-1.064462, 0.002049647, -1.652275, 1, 0.8823529, 0, 1,
-1.054834, 0.5410926, -1.583986, 1, 0.8862745, 0, 1,
-1.053117, -0.9442353, -0.2319368, 1, 0.8941177, 0, 1,
-1.052511, -0.6320201, -0.6498596, 1, 0.8980392, 0, 1,
-1.051833, -1.735971, -3.1108, 1, 0.9058824, 0, 1,
-1.042801, 0.4910208, -2.59954, 1, 0.9137255, 0, 1,
-1.039052, -0.08064957, 0.1102581, 1, 0.9176471, 0, 1,
-1.024557, -0.3651454, -0.7166169, 1, 0.9254902, 0, 1,
-1.023729, 0.261911, -0.767056, 1, 0.9294118, 0, 1,
-1.012674, -0.4694752, -1.487501, 1, 0.9372549, 0, 1,
-1.009131, 1.396924, -0.282822, 1, 0.9411765, 0, 1,
-0.9844465, -0.09454481, -1.692058, 1, 0.9490196, 0, 1,
-0.982558, -0.4270617, -1.874621, 1, 0.9529412, 0, 1,
-0.9670746, -0.5393193, -1.136346, 1, 0.9607843, 0, 1,
-0.953894, -1.649297, -2.558946, 1, 0.9647059, 0, 1,
-0.9512438, 0.2342037, 0.8279976, 1, 0.972549, 0, 1,
-0.9498745, -1.14301, -1.399836, 1, 0.9764706, 0, 1,
-0.9485291, 1.07122, -1.359831, 1, 0.9843137, 0, 1,
-0.9395442, -2.540096, -2.585781, 1, 0.9882353, 0, 1,
-0.9378563, -0.5845526, -3.227815, 1, 0.9960784, 0, 1,
-0.932746, -0.8804707, -2.380544, 0.9960784, 1, 0, 1,
-0.9307061, -0.266603, -1.71363, 0.9921569, 1, 0, 1,
-0.9297687, -0.2725214, -1.936915, 0.9843137, 1, 0, 1,
-0.9277837, 0.3586389, -2.428026, 0.9803922, 1, 0, 1,
-0.9242118, -0.2111133, -1.966523, 0.972549, 1, 0, 1,
-0.9174362, 0.3935159, -0.4142029, 0.9686275, 1, 0, 1,
-0.9166808, 1.258376, -0.1190783, 0.9607843, 1, 0, 1,
-0.9140545, -0.7800112, -2.078246, 0.9568627, 1, 0, 1,
-0.9110795, -0.5084579, 0.3389316, 0.9490196, 1, 0, 1,
-0.906665, 2.085054, -0.6788204, 0.945098, 1, 0, 1,
-0.8967332, -0.3188307, -1.869336, 0.9372549, 1, 0, 1,
-0.8940744, -0.9871866, -2.832965, 0.9333333, 1, 0, 1,
-0.8930161, 0.6868418, -2.68425, 0.9254902, 1, 0, 1,
-0.8839305, -1.031044, -2.162173, 0.9215686, 1, 0, 1,
-0.8828938, -1.023665, -4.269052, 0.9137255, 1, 0, 1,
-0.880318, 0.9920999, -0.529443, 0.9098039, 1, 0, 1,
-0.8769844, 1.014564, -1.371245, 0.9019608, 1, 0, 1,
-0.8721692, 0.8744181, -1.332211, 0.8941177, 1, 0, 1,
-0.8710191, 1.748367, -0.7686022, 0.8901961, 1, 0, 1,
-0.8700869, 0.6538659, -1.411127, 0.8823529, 1, 0, 1,
-0.8591648, -0.8768919, -3.380912, 0.8784314, 1, 0, 1,
-0.8490824, -1.478536, -2.574534, 0.8705882, 1, 0, 1,
-0.8460546, 0.4956288, -0.518198, 0.8666667, 1, 0, 1,
-0.8456391, 0.7647246, -2.136222, 0.8588235, 1, 0, 1,
-0.8447437, -1.376332, -2.927357, 0.854902, 1, 0, 1,
-0.8404493, -0.07799608, -2.580612, 0.8470588, 1, 0, 1,
-0.8313956, 0.05847039, -1.719712, 0.8431373, 1, 0, 1,
-0.8313291, -1.882065, -4.250106, 0.8352941, 1, 0, 1,
-0.8309411, -0.9062445, -2.626335, 0.8313726, 1, 0, 1,
-0.8278863, 1.195235, -1.343579, 0.8235294, 1, 0, 1,
-0.8241253, 0.2496956, -2.690863, 0.8196079, 1, 0, 1,
-0.8232136, 1.802185, -1.364738, 0.8117647, 1, 0, 1,
-0.8195873, 0.07291997, -1.460599, 0.8078431, 1, 0, 1,
-0.8185679, -2.469519, -3.85757, 0.8, 1, 0, 1,
-0.8123978, 0.9178104, -2.131967, 0.7921569, 1, 0, 1,
-0.809582, 1.969221, 0.04170201, 0.7882353, 1, 0, 1,
-0.8043627, -1.461723, -5.270963, 0.7803922, 1, 0, 1,
-0.8003182, 0.115073, -4.674414, 0.7764706, 1, 0, 1,
-0.792253, -0.8912106, -2.241527, 0.7686275, 1, 0, 1,
-0.7875094, 0.8069106, -0.8870329, 0.7647059, 1, 0, 1,
-0.7843614, 1.763335, 0.4489094, 0.7568628, 1, 0, 1,
-0.7796198, -1.105208, -3.507139, 0.7529412, 1, 0, 1,
-0.7790933, 1.865823, 0.1687025, 0.7450981, 1, 0, 1,
-0.7703407, -0.8819564, -1.436907, 0.7411765, 1, 0, 1,
-0.7693074, 1.095733, -1.740591, 0.7333333, 1, 0, 1,
-0.767702, -0.5013493, -2.848634, 0.7294118, 1, 0, 1,
-0.7643199, 2.396838, -0.9660733, 0.7215686, 1, 0, 1,
-0.7599983, -1.191795, -2.220567, 0.7176471, 1, 0, 1,
-0.7577249, 0.03181422, -2.74702, 0.7098039, 1, 0, 1,
-0.7552605, -1.161766, -3.81794, 0.7058824, 1, 0, 1,
-0.7512559, -0.9684979, -1.880823, 0.6980392, 1, 0, 1,
-0.7512425, 0.6491594, 0.6526703, 0.6901961, 1, 0, 1,
-0.7500343, -1.034676, -2.741517, 0.6862745, 1, 0, 1,
-0.7497026, 0.1976439, -1.795245, 0.6784314, 1, 0, 1,
-0.7481514, -1.082302, -0.5634643, 0.6745098, 1, 0, 1,
-0.7425427, 0.6203421, -1.552079, 0.6666667, 1, 0, 1,
-0.7414389, 0.6013566, -2.091437, 0.6627451, 1, 0, 1,
-0.7395349, 0.5256576, -0.9525509, 0.654902, 1, 0, 1,
-0.7322246, -0.5637785, -2.380598, 0.6509804, 1, 0, 1,
-0.7266929, 0.9267493, -1.558749, 0.6431373, 1, 0, 1,
-0.7238424, 1.298007, -2.393482, 0.6392157, 1, 0, 1,
-0.7217622, -0.7382119, -1.996663, 0.6313726, 1, 0, 1,
-0.7202206, -0.2403553, -2.564658, 0.627451, 1, 0, 1,
-0.7172036, -0.2127653, -2.552353, 0.6196079, 1, 0, 1,
-0.7170495, 0.2231225, -1.966825, 0.6156863, 1, 0, 1,
-0.7160221, 1.254397, 2.193353, 0.6078432, 1, 0, 1,
-0.7151528, -0.7491199, -3.047807, 0.6039216, 1, 0, 1,
-0.7138333, -0.9909308, -2.417581, 0.5960785, 1, 0, 1,
-0.7133412, -0.3740319, -2.587517, 0.5882353, 1, 0, 1,
-0.7120701, 0.07238778, 0.5259477, 0.5843138, 1, 0, 1,
-0.7101881, -0.4056695, -1.75524, 0.5764706, 1, 0, 1,
-0.7067589, 0.9844663, 1.628642, 0.572549, 1, 0, 1,
-0.7066954, -0.3162915, -0.9770218, 0.5647059, 1, 0, 1,
-0.699623, -0.4249474, -2.090426, 0.5607843, 1, 0, 1,
-0.6950766, 0.1749841, -2.685613, 0.5529412, 1, 0, 1,
-0.6929436, -0.6128731, -3.244296, 0.5490196, 1, 0, 1,
-0.6918766, 0.1972839, -2.353976, 0.5411765, 1, 0, 1,
-0.691582, 0.3924456, -1.057616, 0.5372549, 1, 0, 1,
-0.6892612, 1.565567, -0.7431262, 0.5294118, 1, 0, 1,
-0.6864046, 0.2837135, -1.435668, 0.5254902, 1, 0, 1,
-0.686123, 0.7084166, -0.4394424, 0.5176471, 1, 0, 1,
-0.6828172, 0.501731, -1.024319, 0.5137255, 1, 0, 1,
-0.6815785, 0.2037884, -0.6243972, 0.5058824, 1, 0, 1,
-0.6807652, 0.8081658, -0.5797461, 0.5019608, 1, 0, 1,
-0.680236, 1.5266, -0.1929015, 0.4941176, 1, 0, 1,
-0.6735296, -1.219185, -2.532342, 0.4862745, 1, 0, 1,
-0.6724077, -0.8811399, -2.551158, 0.4823529, 1, 0, 1,
-0.6671337, -1.719828, -0.7711592, 0.4745098, 1, 0, 1,
-0.6659611, 0.1226114, -0.823584, 0.4705882, 1, 0, 1,
-0.665508, 0.9337729, -1.012301, 0.4627451, 1, 0, 1,
-0.6649402, 0.5089254, -0.4587246, 0.4588235, 1, 0, 1,
-0.6628292, -0.3871019, -2.505321, 0.4509804, 1, 0, 1,
-0.6613519, 0.3174326, -1.846991, 0.4470588, 1, 0, 1,
-0.6539214, 1.472216, 0.03190879, 0.4392157, 1, 0, 1,
-0.651101, -0.5922205, -2.273638, 0.4352941, 1, 0, 1,
-0.6477249, 0.9672263, -2.431015, 0.427451, 1, 0, 1,
-0.6409605, 0.5594512, -1.982719, 0.4235294, 1, 0, 1,
-0.6407241, -0.8526546, -2.784961, 0.4156863, 1, 0, 1,
-0.6386879, -0.8671128, -1.776301, 0.4117647, 1, 0, 1,
-0.6293362, -1.529632, -3.253881, 0.4039216, 1, 0, 1,
-0.6280683, -0.7961624, -2.572603, 0.3960784, 1, 0, 1,
-0.6220703, -0.8062208, -2.47008, 0.3921569, 1, 0, 1,
-0.6217187, 0.1029074, -1.797209, 0.3843137, 1, 0, 1,
-0.6140325, 1.048359, -0.5420639, 0.3803922, 1, 0, 1,
-0.6136747, -0.5551119, -3.228878, 0.372549, 1, 0, 1,
-0.6071051, -1.002425, -1.04064, 0.3686275, 1, 0, 1,
-0.6057781, 0.7740579, 0.6511723, 0.3607843, 1, 0, 1,
-0.6051785, -0.0851348, -1.556636, 0.3568628, 1, 0, 1,
-0.599821, -0.4928753, -3.375936, 0.3490196, 1, 0, 1,
-0.5983171, 1.174392, -1.73499, 0.345098, 1, 0, 1,
-0.5975744, 0.4677598, -0.9548214, 0.3372549, 1, 0, 1,
-0.5975496, 0.5060322, -0.9401383, 0.3333333, 1, 0, 1,
-0.5957153, 1.846342, -0.01278697, 0.3254902, 1, 0, 1,
-0.5937872, 0.6160956, -1.359049, 0.3215686, 1, 0, 1,
-0.5887035, 0.8346261, 0.3618605, 0.3137255, 1, 0, 1,
-0.5802634, -1.114352, -1.273928, 0.3098039, 1, 0, 1,
-0.5757183, 1.594108, -0.7899243, 0.3019608, 1, 0, 1,
-0.5636471, 2.123134, -0.4575182, 0.2941177, 1, 0, 1,
-0.56307, 1.101775, -0.1212333, 0.2901961, 1, 0, 1,
-0.558127, -1.0964, -3.650065, 0.282353, 1, 0, 1,
-0.5441098, 0.9244959, -1.607459, 0.2784314, 1, 0, 1,
-0.5425035, -0.3733407, -4.142391, 0.2705882, 1, 0, 1,
-0.5397766, -0.5766866, -2.821083, 0.2666667, 1, 0, 1,
-0.5341993, -0.2516664, -2.136532, 0.2588235, 1, 0, 1,
-0.5338168, 2.833339, -0.9592134, 0.254902, 1, 0, 1,
-0.5288693, -0.765134, -0.9763365, 0.2470588, 1, 0, 1,
-0.5285329, 0.6874124, -1.207619, 0.2431373, 1, 0, 1,
-0.5271293, -0.4099761, -3.068078, 0.2352941, 1, 0, 1,
-0.5140622, 0.3915255, -1.39519, 0.2313726, 1, 0, 1,
-0.5114494, -1.279372, -2.392251, 0.2235294, 1, 0, 1,
-0.5111277, -0.5636012, -3.148655, 0.2196078, 1, 0, 1,
-0.5084142, 0.9342896, 0.3313484, 0.2117647, 1, 0, 1,
-0.5059096, -0.1848053, -1.535691, 0.2078431, 1, 0, 1,
-0.5024525, 0.6651788, 0.5330789, 0.2, 1, 0, 1,
-0.4981858, -0.8210666, -3.129205, 0.1921569, 1, 0, 1,
-0.4937781, 0.08542074, -1.088203, 0.1882353, 1, 0, 1,
-0.4934376, -0.4812115, -0.911354, 0.1803922, 1, 0, 1,
-0.4893732, -1.392039, -2.085651, 0.1764706, 1, 0, 1,
-0.4887298, -0.2216316, -0.04612572, 0.1686275, 1, 0, 1,
-0.4871274, -0.3197369, -4.061082, 0.1647059, 1, 0, 1,
-0.4816901, 0.3464952, 0.0985632, 0.1568628, 1, 0, 1,
-0.4811463, 0.9923933, -0.8223467, 0.1529412, 1, 0, 1,
-0.4748418, 0.3808912, 0.8391759, 0.145098, 1, 0, 1,
-0.470463, -0.04930691, -3.865889, 0.1411765, 1, 0, 1,
-0.4702417, 1.872655, 0.1561863, 0.1333333, 1, 0, 1,
-0.4679611, -2.540937, -3.523209, 0.1294118, 1, 0, 1,
-0.4651557, 0.3729337, 0.3370479, 0.1215686, 1, 0, 1,
-0.45768, -1.373029, -3.016636, 0.1176471, 1, 0, 1,
-0.455073, -0.2585513, -2.333014, 0.1098039, 1, 0, 1,
-0.454553, -0.2151984, -2.721813, 0.1058824, 1, 0, 1,
-0.451298, 1.015772, -0.5092015, 0.09803922, 1, 0, 1,
-0.4491963, -0.3339121, -1.324757, 0.09019608, 1, 0, 1,
-0.4486158, 2.791766, 0.8575031, 0.08627451, 1, 0, 1,
-0.433245, -0.5660281, -2.278318, 0.07843138, 1, 0, 1,
-0.4262255, -0.4790987, -3.018167, 0.07450981, 1, 0, 1,
-0.4245794, -0.7480187, -0.478852, 0.06666667, 1, 0, 1,
-0.4216476, 1.276896, 0.7845741, 0.0627451, 1, 0, 1,
-0.4184821, 0.4865395, -0.7535403, 0.05490196, 1, 0, 1,
-0.4161703, -0.1397063, -2.587216, 0.05098039, 1, 0, 1,
-0.4160805, 1.251724, -1.770865, 0.04313726, 1, 0, 1,
-0.4145158, -0.5057966, -2.725736, 0.03921569, 1, 0, 1,
-0.4116552, -0.5992249, -1.718713, 0.03137255, 1, 0, 1,
-0.4101446, -0.1856564, -2.469769, 0.02745098, 1, 0, 1,
-0.406195, -0.04897401, -3.392154, 0.01960784, 1, 0, 1,
-0.4044356, -0.9072273, -3.515203, 0.01568628, 1, 0, 1,
-0.3976511, 0.2044936, -0.3543302, 0.007843138, 1, 0, 1,
-0.3973519, 0.31234, -1.784177, 0.003921569, 1, 0, 1,
-0.3868042, -0.2888109, -2.077048, 0, 1, 0.003921569, 1,
-0.3860645, -0.648318, -5.965772, 0, 1, 0.01176471, 1,
-0.385579, -0.7774429, -2.976683, 0, 1, 0.01568628, 1,
-0.3852608, 1.197483, -0.7413543, 0, 1, 0.02352941, 1,
-0.3850088, -2.024828, -1.003539, 0, 1, 0.02745098, 1,
-0.3830942, 1.294488, -0.9313186, 0, 1, 0.03529412, 1,
-0.3791504, -0.2969123, -2.912197, 0, 1, 0.03921569, 1,
-0.3715591, 1.347737, 0.5301009, 0, 1, 0.04705882, 1,
-0.3702766, -0.4807155, -3.418607, 0, 1, 0.05098039, 1,
-0.3692554, 1.241401, 2.248596, 0, 1, 0.05882353, 1,
-0.365983, 1.295037, -0.9169948, 0, 1, 0.0627451, 1,
-0.3636822, 0.6455762, -0.3657356, 0, 1, 0.07058824, 1,
-0.3631614, -0.7206488, -4.17908, 0, 1, 0.07450981, 1,
-0.3613295, 0.2010171, 0.0697636, 0, 1, 0.08235294, 1,
-0.3576015, -0.08300352, -2.697513, 0, 1, 0.08627451, 1,
-0.3523753, -1.32175, -3.666651, 0, 1, 0.09411765, 1,
-0.3426256, 0.910305, -0.7979333, 0, 1, 0.1019608, 1,
-0.3403742, 0.7741327, 1.40938, 0, 1, 0.1058824, 1,
-0.3366743, -0.249476, -1.766576, 0, 1, 0.1137255, 1,
-0.3312391, -0.6256029, -4.470961, 0, 1, 0.1176471, 1,
-0.3286573, 0.915223, -0.6585923, 0, 1, 0.1254902, 1,
-0.32108, -0.2983017, -1.345248, 0, 1, 0.1294118, 1,
-0.3171759, -0.120916, -1.491279, 0, 1, 0.1372549, 1,
-0.3121395, -1.562988, -2.851214, 0, 1, 0.1411765, 1,
-0.3096735, -0.1944016, -1.482661, 0, 1, 0.1490196, 1,
-0.3095114, -1.445619, -2.869129, 0, 1, 0.1529412, 1,
-0.3092743, 2.311166, -0.6328648, 0, 1, 0.1607843, 1,
-0.3091415, 0.1752136, -0.2183575, 0, 1, 0.1647059, 1,
-0.3088185, 0.3104925, 1.055503, 0, 1, 0.172549, 1,
-0.2987562, 0.8704078, -0.2175234, 0, 1, 0.1764706, 1,
-0.2951999, 0.04693269, -1.412501, 0, 1, 0.1843137, 1,
-0.2944959, 0.03516868, -2.087238, 0, 1, 0.1882353, 1,
-0.288578, 0.08199088, -0.8016878, 0, 1, 0.1960784, 1,
-0.2859358, -0.6852695, -3.674735, 0, 1, 0.2039216, 1,
-0.285756, -0.3132955, -1.788979, 0, 1, 0.2078431, 1,
-0.2849469, 1.503493, -0.4666229, 0, 1, 0.2156863, 1,
-0.281577, 0.7023606, 0.007211771, 0, 1, 0.2196078, 1,
-0.2807787, 2.122993, -0.8716673, 0, 1, 0.227451, 1,
-0.277476, 0.4923032, -1.316667, 0, 1, 0.2313726, 1,
-0.2760593, -0.373424, -3.109579, 0, 1, 0.2392157, 1,
-0.2740369, 1.508276, -1.035238, 0, 1, 0.2431373, 1,
-0.2729164, -0.3595766, -2.727635, 0, 1, 0.2509804, 1,
-0.2720579, 2.366254, -0.03154861, 0, 1, 0.254902, 1,
-0.2707738, -0.3513421, -3.536821, 0, 1, 0.2627451, 1,
-0.2705588, 0.1653178, -2.425156, 0, 1, 0.2666667, 1,
-0.2655996, 1.403054, -0.8697838, 0, 1, 0.2745098, 1,
-0.2650448, 1.38605, 0.3131866, 0, 1, 0.2784314, 1,
-0.264715, 0.8323902, -0.7816082, 0, 1, 0.2862745, 1,
-0.2627599, 0.5756959, -0.2862433, 0, 1, 0.2901961, 1,
-0.2623435, 0.4669407, -1.996503, 0, 1, 0.2980392, 1,
-0.2620274, -0.01031729, -0.7240069, 0, 1, 0.3058824, 1,
-0.2535105, -0.3278719, -2.09106, 0, 1, 0.3098039, 1,
-0.2517977, -0.3665502, -2.271781, 0, 1, 0.3176471, 1,
-0.2484361, -0.3953729, -0.380839, 0, 1, 0.3215686, 1,
-0.2471967, -0.3875634, -2.367332, 0, 1, 0.3294118, 1,
-0.2431185, 1.077642, -1.584355, 0, 1, 0.3333333, 1,
-0.2404454, -1.024694, -3.737562, 0, 1, 0.3411765, 1,
-0.2390423, -0.4214374, -3.807037, 0, 1, 0.345098, 1,
-0.2381669, 1.335207, 0.9246383, 0, 1, 0.3529412, 1,
-0.2364654, 0.9290946, 1.104708, 0, 1, 0.3568628, 1,
-0.2281443, 1.172146, -0.1495419, 0, 1, 0.3647059, 1,
-0.2270761, -0.9410928, -3.204605, 0, 1, 0.3686275, 1,
-0.2249473, 2.309228, 1.51822, 0, 1, 0.3764706, 1,
-0.2178726, -1.791442, -2.605778, 0, 1, 0.3803922, 1,
-0.2142635, 1.76878, -1.368163, 0, 1, 0.3882353, 1,
-0.2126388, -0.3464195, -4.273772, 0, 1, 0.3921569, 1,
-0.2117916, 0.4770125, -1.910831, 0, 1, 0.4, 1,
-0.2111901, 0.8343669, -2.61017, 0, 1, 0.4078431, 1,
-0.2089293, 0.5919178, -0.4632474, 0, 1, 0.4117647, 1,
-0.208568, -0.8815836, -3.950567, 0, 1, 0.4196078, 1,
-0.2009927, -0.8963726, -1.922438, 0, 1, 0.4235294, 1,
-0.1996674, -0.6239822, -3.146968, 0, 1, 0.4313726, 1,
-0.1989169, 0.4546324, -0.1235553, 0, 1, 0.4352941, 1,
-0.1972134, 0.109007, -1.740267, 0, 1, 0.4431373, 1,
-0.1921882, -0.2062588, -2.292775, 0, 1, 0.4470588, 1,
-0.1882964, 0.3245971, -0.9316364, 0, 1, 0.454902, 1,
-0.1824593, 0.7035457, -1.507914, 0, 1, 0.4588235, 1,
-0.1774789, 0.4765157, -0.8298185, 0, 1, 0.4666667, 1,
-0.1747488, -0.4159338, -3.66388, 0, 1, 0.4705882, 1,
-0.1728922, 1.234911, -1.258532, 0, 1, 0.4784314, 1,
-0.1714923, -0.4938208, -4.072812, 0, 1, 0.4823529, 1,
-0.1710297, 1.201147, -1.126817, 0, 1, 0.4901961, 1,
-0.1657867, -0.7806171, -3.568213, 0, 1, 0.4941176, 1,
-0.1657814, -1.093066, -3.317925, 0, 1, 0.5019608, 1,
-0.1648821, -1.025231, -2.105489, 0, 1, 0.509804, 1,
-0.1632772, 0.4769068, -0.185793, 0, 1, 0.5137255, 1,
-0.1614888, 0.1449443, -1.015559, 0, 1, 0.5215687, 1,
-0.1596987, 1.263978, -2.133632, 0, 1, 0.5254902, 1,
-0.1575707, -0.7938846, -0.7652423, 0, 1, 0.5333334, 1,
-0.1565788, -0.985064, -2.11871, 0, 1, 0.5372549, 1,
-0.1550943, -0.7671548, -3.519648, 0, 1, 0.5450981, 1,
-0.1536162, -0.318706, -2.653228, 0, 1, 0.5490196, 1,
-0.1504523, 0.7882166, -0.658771, 0, 1, 0.5568628, 1,
-0.150064, 0.3129741, -1.009064, 0, 1, 0.5607843, 1,
-0.1470865, -0.3219895, -1.96563, 0, 1, 0.5686275, 1,
-0.1462718, -0.2760579, -1.929641, 0, 1, 0.572549, 1,
-0.1389448, -0.660218, -1.945315, 0, 1, 0.5803922, 1,
-0.1373721, 0.6236721, 0.2068492, 0, 1, 0.5843138, 1,
-0.1348081, -0.3774515, -3.761214, 0, 1, 0.5921569, 1,
-0.1299247, -0.8606021, -2.723259, 0, 1, 0.5960785, 1,
-0.1266518, 1.230804, -0.2080336, 0, 1, 0.6039216, 1,
-0.1261917, 0.2224655, -0.9351211, 0, 1, 0.6117647, 1,
-0.1257215, 1.095127, 0.7067829, 0, 1, 0.6156863, 1,
-0.1248808, 1.317347, -1.405632, 0, 1, 0.6235294, 1,
-0.1213274, 0.4989806, 0.2515431, 0, 1, 0.627451, 1,
-0.1207335, -0.877655, -2.636009, 0, 1, 0.6352941, 1,
-0.1195709, -0.5450481, -4.541156, 0, 1, 0.6392157, 1,
-0.1130425, -1.083574, -3.047663, 0, 1, 0.6470588, 1,
-0.1129268, -1.738983, -1.489891, 0, 1, 0.6509804, 1,
-0.1126847, -0.9382303, -2.802425, 0, 1, 0.6588235, 1,
-0.1089144, 0.8468233, -0.3444249, 0, 1, 0.6627451, 1,
-0.1070763, -0.2553062, -3.617894, 0, 1, 0.6705883, 1,
-0.1020681, 0.5165859, -0.218689, 0, 1, 0.6745098, 1,
-0.100922, 0.5386668, 1.699996, 0, 1, 0.682353, 1,
-0.09929737, -0.5791253, -3.667575, 0, 1, 0.6862745, 1,
-0.0989161, -1.020225, -3.192366, 0, 1, 0.6941177, 1,
-0.09849592, 2.122964, 0.1619703, 0, 1, 0.7019608, 1,
-0.09473086, 0.8583994, -2.224549, 0, 1, 0.7058824, 1,
-0.09456787, -0.7632058, -5.684873, 0, 1, 0.7137255, 1,
-0.09426066, 0.5018214, -0.3545765, 0, 1, 0.7176471, 1,
-0.09140894, -2.176274, -2.897252, 0, 1, 0.7254902, 1,
-0.09051775, 1.32154, -0.4034806, 0, 1, 0.7294118, 1,
-0.0884724, -0.6709868, -2.809234, 0, 1, 0.7372549, 1,
-0.08651281, -0.05947301, -1.852443, 0, 1, 0.7411765, 1,
-0.08379424, 0.6683372, 0.7336574, 0, 1, 0.7490196, 1,
-0.0835539, 0.4289654, 0.013247, 0, 1, 0.7529412, 1,
-0.08267154, 0.1439378, -1.171603, 0, 1, 0.7607843, 1,
-0.08116782, -0.9439819, -3.545208, 0, 1, 0.7647059, 1,
-0.08106554, -0.6649643, -3.564317, 0, 1, 0.772549, 1,
-0.07367474, 1.372586, -0.2679652, 0, 1, 0.7764706, 1,
-0.06940962, -1.428784, -1.722672, 0, 1, 0.7843137, 1,
-0.06860481, -0.5153018, -4.081259, 0, 1, 0.7882353, 1,
-0.06736775, 0.9869384, -1.374785, 0, 1, 0.7960784, 1,
-0.06236016, -0.06725905, -0.7961736, 0, 1, 0.8039216, 1,
-0.06153827, 0.08705033, -0.2917092, 0, 1, 0.8078431, 1,
-0.06037001, -0.4306892, -2.867545, 0, 1, 0.8156863, 1,
-0.05657997, -1.160176, -4.782505, 0, 1, 0.8196079, 1,
-0.05631103, 1.734481, -0.9186494, 0, 1, 0.827451, 1,
-0.0509995, -0.8128986, -1.968929, 0, 1, 0.8313726, 1,
-0.04941201, 1.526709, -0.1145327, 0, 1, 0.8392157, 1,
-0.04735137, -1.251733, -1.855111, 0, 1, 0.8431373, 1,
-0.04254844, -1.174818, -4.558043, 0, 1, 0.8509804, 1,
-0.03910169, 0.07780908, -0.7765989, 0, 1, 0.854902, 1,
-0.03770602, 0.5158688, -0.006593892, 0, 1, 0.8627451, 1,
-0.03648592, 0.274067, -1.120007, 0, 1, 0.8666667, 1,
-0.03129234, -0.4022808, -2.181445, 0, 1, 0.8745098, 1,
-0.03035262, 1.275709, 1.676969, 0, 1, 0.8784314, 1,
-0.02886513, -1.064261, -2.931491, 0, 1, 0.8862745, 1,
-0.02430507, 0.7417219, 0.8013898, 0, 1, 0.8901961, 1,
-0.02415542, -0.1227851, -4.354028, 0, 1, 0.8980392, 1,
-0.02209327, 0.4125192, -0.2753301, 0, 1, 0.9058824, 1,
-0.01881186, -2.849448, -3.472438, 0, 1, 0.9098039, 1,
-0.01750466, -1.843595, -1.305271, 0, 1, 0.9176471, 1,
-0.01686767, 1.172997, 1.417797, 0, 1, 0.9215686, 1,
-0.01371771, 0.5789646, 2.290265, 0, 1, 0.9294118, 1,
-0.01244182, -0.6658632, -4.735773, 0, 1, 0.9333333, 1,
-0.00987299, -2.60446, -3.540925, 0, 1, 0.9411765, 1,
-0.007676707, 1.706055, 0.9806767, 0, 1, 0.945098, 1,
0.0003072486, -1.124202, 4.415425, 0, 1, 0.9529412, 1,
0.005287616, 0.7194071, -0.3959408, 0, 1, 0.9568627, 1,
0.007837899, -1.038793, 2.533363, 0, 1, 0.9647059, 1,
0.009639565, 0.123966, 0.8584932, 0, 1, 0.9686275, 1,
0.01407093, 1.401126, -1.578512, 0, 1, 0.9764706, 1,
0.01498416, 0.7832707, 0.3349981, 0, 1, 0.9803922, 1,
0.01862049, -1.441458, 3.659678, 0, 1, 0.9882353, 1,
0.0195432, 0.9309044, 0.1401295, 0, 1, 0.9921569, 1,
0.02122711, -0.4885867, 3.68253, 0, 1, 1, 1,
0.02125795, 1.321317, -2.362735, 0, 0.9921569, 1, 1,
0.02431078, 0.8232815, -0.06708881, 0, 0.9882353, 1, 1,
0.02622787, 1.724731, 0.2614348, 0, 0.9803922, 1, 1,
0.02927994, -0.8885814, 2.952163, 0, 0.9764706, 1, 1,
0.03556374, 0.523067, 0.05595783, 0, 0.9686275, 1, 1,
0.03596799, 0.5730147, 0.2085801, 0, 0.9647059, 1, 1,
0.03933004, 2.534464, 0.6568887, 0, 0.9568627, 1, 1,
0.03969922, 0.5498294, 2.336552, 0, 0.9529412, 1, 1,
0.04090274, 0.8582008, -0.257189, 0, 0.945098, 1, 1,
0.04199483, -0.1344934, 5.02853, 0, 0.9411765, 1, 1,
0.04880477, -0.3125873, 3.539685, 0, 0.9333333, 1, 1,
0.05297748, 0.9422511, 0.7188339, 0, 0.9294118, 1, 1,
0.05378077, 0.4581238, 0.8895182, 0, 0.9215686, 1, 1,
0.05670732, 1.999395, 0.962792, 0, 0.9176471, 1, 1,
0.05818401, -0.8659313, 3.294959, 0, 0.9098039, 1, 1,
0.06071375, -0.2710415, 3.874593, 0, 0.9058824, 1, 1,
0.06417703, -0.4612674, 3.83637, 0, 0.8980392, 1, 1,
0.06891175, -1.090879, 3.782635, 0, 0.8901961, 1, 1,
0.07428331, -0.3915975, 3.349802, 0, 0.8862745, 1, 1,
0.07531492, 1.647488, 2.733832, 0, 0.8784314, 1, 1,
0.07572589, -1.609233, 2.592788, 0, 0.8745098, 1, 1,
0.07657488, 0.5983303, 1.187784, 0, 0.8666667, 1, 1,
0.07895155, -0.0670354, 1.173473, 0, 0.8627451, 1, 1,
0.08222461, 0.5152857, 0.3760657, 0, 0.854902, 1, 1,
0.08281096, -0.4554075, 3.363211, 0, 0.8509804, 1, 1,
0.08482641, -0.3803467, 3.00757, 0, 0.8431373, 1, 1,
0.09378095, -0.5575312, 4.041853, 0, 0.8392157, 1, 1,
0.09488437, -0.9148721, 1.930275, 0, 0.8313726, 1, 1,
0.09514775, -1.286401, 3.258164, 0, 0.827451, 1, 1,
0.09598408, 0.5302106, 0.03360408, 0, 0.8196079, 1, 1,
0.1001636, 2.580415, -0.8599292, 0, 0.8156863, 1, 1,
0.106363, 1.266443, -0.199711, 0, 0.8078431, 1, 1,
0.1149019, -0.7022898, 4.288004, 0, 0.8039216, 1, 1,
0.1173727, -1.822617, 3.455519, 0, 0.7960784, 1, 1,
0.1176332, 0.1340939, 0.07940789, 0, 0.7882353, 1, 1,
0.117897, -0.3612726, 3.184916, 0, 0.7843137, 1, 1,
0.1184555, 1.06398, -1.975011, 0, 0.7764706, 1, 1,
0.1207826, -0.4507122, 0.9655014, 0, 0.772549, 1, 1,
0.1208232, -1.730481, 6.776466, 0, 0.7647059, 1, 1,
0.1231517, 0.5546556, -0.6937397, 0, 0.7607843, 1, 1,
0.1248941, -2.912719, 2.198741, 0, 0.7529412, 1, 1,
0.1274289, -2.730567, 3.587636, 0, 0.7490196, 1, 1,
0.1287535, -0.8772601, 0.9464938, 0, 0.7411765, 1, 1,
0.1328575, -2.658254, 3.906036, 0, 0.7372549, 1, 1,
0.1340691, -0.264339, 2.921444, 0, 0.7294118, 1, 1,
0.1348952, -0.5829045, 3.34371, 0, 0.7254902, 1, 1,
0.1381669, -0.9340654, 3.303853, 0, 0.7176471, 1, 1,
0.1404811, -1.54452, 2.457568, 0, 0.7137255, 1, 1,
0.1445575, -0.4507308, 4.102726, 0, 0.7058824, 1, 1,
0.1448211, -0.5693601, 2.272562, 0, 0.6980392, 1, 1,
0.1458003, 1.397321, 1.66841, 0, 0.6941177, 1, 1,
0.1473258, -1.087324, 1.933096, 0, 0.6862745, 1, 1,
0.149916, -0.6367366, 4.742314, 0, 0.682353, 1, 1,
0.1503961, -0.6279661, 3.497327, 0, 0.6745098, 1, 1,
0.1510823, 0.8318905, 1.463675, 0, 0.6705883, 1, 1,
0.1519214, -0.1543116, 2.024527, 0, 0.6627451, 1, 1,
0.1533265, -1.130526, 2.930614, 0, 0.6588235, 1, 1,
0.1561467, -0.310795, 2.479377, 0, 0.6509804, 1, 1,
0.1631855, 1.66912, -0.3535859, 0, 0.6470588, 1, 1,
0.1693222, 0.7123103, -2.410403, 0, 0.6392157, 1, 1,
0.169611, 0.4984703, -0.8730846, 0, 0.6352941, 1, 1,
0.1702774, -0.3596858, 1.586186, 0, 0.627451, 1, 1,
0.1734468, 0.2749577, -0.1389688, 0, 0.6235294, 1, 1,
0.1745008, -0.5417044, 3.455285, 0, 0.6156863, 1, 1,
0.1762181, -1.295839, 2.961719, 0, 0.6117647, 1, 1,
0.1785242, -0.7641808, 2.963179, 0, 0.6039216, 1, 1,
0.178877, 1.71217, -1.468124, 0, 0.5960785, 1, 1,
0.184488, 0.4491081, -0.8692279, 0, 0.5921569, 1, 1,
0.1870182, -0.8967301, 1.499649, 0, 0.5843138, 1, 1,
0.1873174, -0.1798198, 1.663483, 0, 0.5803922, 1, 1,
0.1909391, 0.321534, -0.03325908, 0, 0.572549, 1, 1,
0.1948187, 1.933184, 1.158656, 0, 0.5686275, 1, 1,
0.1961605, -0.1242883, 2.409148, 0, 0.5607843, 1, 1,
0.1997248, -0.73629, 1.312012, 0, 0.5568628, 1, 1,
0.2042225, 0.01858596, 0.9520333, 0, 0.5490196, 1, 1,
0.2069073, -0.7902224, 2.725122, 0, 0.5450981, 1, 1,
0.208122, -0.3111618, 2.419708, 0, 0.5372549, 1, 1,
0.20816, -1.653789, 2.569508, 0, 0.5333334, 1, 1,
0.210135, 0.2285538, 2.097305, 0, 0.5254902, 1, 1,
0.2103516, -1.027532, 3.965773, 0, 0.5215687, 1, 1,
0.2126492, -1.514587, 2.319074, 0, 0.5137255, 1, 1,
0.2147983, -0.85179, 2.731059, 0, 0.509804, 1, 1,
0.2257088, 0.4504082, 1.978644, 0, 0.5019608, 1, 1,
0.2261542, 0.271128, 0.9709124, 0, 0.4941176, 1, 1,
0.2352298, -0.9084042, 1.734615, 0, 0.4901961, 1, 1,
0.2356519, -2.013675, 3.289487, 0, 0.4823529, 1, 1,
0.2427447, -0.02548347, 3.208547, 0, 0.4784314, 1, 1,
0.2443804, -0.615019, 3.550064, 0, 0.4705882, 1, 1,
0.2469646, -0.3503029, 2.011579, 0, 0.4666667, 1, 1,
0.2487913, 0.2037251, 1.978955, 0, 0.4588235, 1, 1,
0.2500321, -2.57657, 3.652705, 0, 0.454902, 1, 1,
0.2536785, -0.3693874, 3.937119, 0, 0.4470588, 1, 1,
0.254627, -0.8277493, 3.069613, 0, 0.4431373, 1, 1,
0.2567935, 0.01743886, -0.627691, 0, 0.4352941, 1, 1,
0.2572474, 0.123553, 0.3508169, 0, 0.4313726, 1, 1,
0.2625928, -2.673151, 2.848856, 0, 0.4235294, 1, 1,
0.2677491, 2.439033, -0.3193589, 0, 0.4196078, 1, 1,
0.2710819, 0.5567982, 1.899828, 0, 0.4117647, 1, 1,
0.271498, -0.706306, 3.192776, 0, 0.4078431, 1, 1,
0.2731643, 0.03799696, 0.2986577, 0, 0.4, 1, 1,
0.2734236, -1.01391, 2.653977, 0, 0.3921569, 1, 1,
0.2734956, 0.1555651, 1.224128, 0, 0.3882353, 1, 1,
0.2795751, 0.9451488, -0.1218115, 0, 0.3803922, 1, 1,
0.2809382, 0.5971512, 1.04306, 0, 0.3764706, 1, 1,
0.2825045, -0.4932251, 2.520095, 0, 0.3686275, 1, 1,
0.2834948, -0.4592983, 2.443536, 0, 0.3647059, 1, 1,
0.28579, -0.9052423, 2.386525, 0, 0.3568628, 1, 1,
0.2881979, -0.08728096, 1.37172, 0, 0.3529412, 1, 1,
0.2884857, -0.3696017, 2.324383, 0, 0.345098, 1, 1,
0.2926342, -0.9916587, 2.904516, 0, 0.3411765, 1, 1,
0.2960656, 0.2863682, -0.4233531, 0, 0.3333333, 1, 1,
0.2984814, 0.9341593, 0.4371985, 0, 0.3294118, 1, 1,
0.3005635, 0.7388777, 1.084096, 0, 0.3215686, 1, 1,
0.3021075, -0.3929428, 2.256709, 0, 0.3176471, 1, 1,
0.3044033, 1.402981, 1.238963, 0, 0.3098039, 1, 1,
0.3097772, -0.1771325, 2.398396, 0, 0.3058824, 1, 1,
0.3105259, -0.02889871, 2.263704, 0, 0.2980392, 1, 1,
0.3127717, -0.6822324, 1.49153, 0, 0.2901961, 1, 1,
0.3135422, 0.5970994, -0.4385473, 0, 0.2862745, 1, 1,
0.3170391, -0.4905903, 2.595984, 0, 0.2784314, 1, 1,
0.3183726, 0.7386116, -1.281402, 0, 0.2745098, 1, 1,
0.3190656, 0.1504695, 0.6891808, 0, 0.2666667, 1, 1,
0.3232246, 0.2734954, 0.3837039, 0, 0.2627451, 1, 1,
0.3236403, -0.2407432, 3.131662, 0, 0.254902, 1, 1,
0.3259462, -0.8799631, 0.9381894, 0, 0.2509804, 1, 1,
0.3290355, -0.1848293, 1.085823, 0, 0.2431373, 1, 1,
0.3296445, -0.7667025, 2.578392, 0, 0.2392157, 1, 1,
0.3300145, 2.813965, -0.4550144, 0, 0.2313726, 1, 1,
0.3323785, -1.286066, 0.7268136, 0, 0.227451, 1, 1,
0.3385384, -2.336449, 4.292128, 0, 0.2196078, 1, 1,
0.3385901, 1.556152, -0.3075218, 0, 0.2156863, 1, 1,
0.3405496, 1.745703, 0.01804678, 0, 0.2078431, 1, 1,
0.3469936, 0.5766138, 1.277889, 0, 0.2039216, 1, 1,
0.3496744, -0.9035576, 3.053656, 0, 0.1960784, 1, 1,
0.3506496, 0.5979975, 1.617854, 0, 0.1882353, 1, 1,
0.3509493, -0.06339005, -0.1601277, 0, 0.1843137, 1, 1,
0.3542338, -1.706268, 3.717388, 0, 0.1764706, 1, 1,
0.3563105, 0.1370652, 3.586881, 0, 0.172549, 1, 1,
0.3573753, -0.04907191, 0.4063733, 0, 0.1647059, 1, 1,
0.3576575, -0.5345695, 2.539075, 0, 0.1607843, 1, 1,
0.3576788, -0.05516632, 2.314934, 0, 0.1529412, 1, 1,
0.3582954, 0.8420557, -1.289047, 0, 0.1490196, 1, 1,
0.3584198, -2.326109, 3.610755, 0, 0.1411765, 1, 1,
0.3600781, -0.3008703, 2.332483, 0, 0.1372549, 1, 1,
0.3641952, -1.114291, 2.375395, 0, 0.1294118, 1, 1,
0.3644781, -1.63616, 3.551462, 0, 0.1254902, 1, 1,
0.370194, -0.1809364, 1.587548, 0, 0.1176471, 1, 1,
0.3734438, 0.6418288, 2.065873, 0, 0.1137255, 1, 1,
0.3806304, 0.598516, 0.3761607, 0, 0.1058824, 1, 1,
0.3823024, -1.169502, 2.135451, 0, 0.09803922, 1, 1,
0.3871267, -0.2966148, 3.359894, 0, 0.09411765, 1, 1,
0.3904764, 0.6696814, 0.03297871, 0, 0.08627451, 1, 1,
0.3933745, 0.3651341, 1.877124, 0, 0.08235294, 1, 1,
0.3940467, -0.9365144, 1.590004, 0, 0.07450981, 1, 1,
0.3942169, 0.5140077, 0.01155627, 0, 0.07058824, 1, 1,
0.3946357, 0.7186352, 0.107032, 0, 0.0627451, 1, 1,
0.3948704, 0.7694015, 0.5585953, 0, 0.05882353, 1, 1,
0.3975982, 0.3493555, -0.3463533, 0, 0.05098039, 1, 1,
0.3989357, 0.6199337, -0.4890098, 0, 0.04705882, 1, 1,
0.4013716, 1.377529, 0.07706058, 0, 0.03921569, 1, 1,
0.4031307, -0.2563053, 3.983874, 0, 0.03529412, 1, 1,
0.4065524, -0.5695109, 1.380327, 0, 0.02745098, 1, 1,
0.4070267, -0.4879129, 2.12521, 0, 0.02352941, 1, 1,
0.4164684, -1.599935, 3.413381, 0, 0.01568628, 1, 1,
0.4169882, 0.2601025, 1.3353, 0, 0.01176471, 1, 1,
0.4249669, -0.7711142, 3.142059, 0, 0.003921569, 1, 1,
0.430992, -0.4666123, 3.41547, 0.003921569, 0, 1, 1,
0.4332963, -0.8168889, 2.14149, 0.007843138, 0, 1, 1,
0.4390503, -0.5278159, 3.028392, 0.01568628, 0, 1, 1,
0.4409474, -0.03376521, 2.752175, 0.01960784, 0, 1, 1,
0.4479381, 1.368557, 2.274974, 0.02745098, 0, 1, 1,
0.463044, -0.4406235, 2.88308, 0.03137255, 0, 1, 1,
0.4690927, -0.2013558, 1.378596, 0.03921569, 0, 1, 1,
0.4748209, 1.53847, -0.9899943, 0.04313726, 0, 1, 1,
0.4757782, -1.689673, 2.528406, 0.05098039, 0, 1, 1,
0.476239, 0.1343167, 1.027172, 0.05490196, 0, 1, 1,
0.4781951, -0.8663589, 3.684643, 0.0627451, 0, 1, 1,
0.4789201, -1.436357, 5.090989, 0.06666667, 0, 1, 1,
0.4818593, -0.9469541, 2.907691, 0.07450981, 0, 1, 1,
0.4889637, -0.1159138, 0.8483169, 0.07843138, 0, 1, 1,
0.4894472, 0.01633444, 2.426363, 0.08627451, 0, 1, 1,
0.4904236, -0.481115, 2.79724, 0.09019608, 0, 1, 1,
0.491365, 1.409085, 0.719297, 0.09803922, 0, 1, 1,
0.4949498, -0.2376904, 1.375482, 0.1058824, 0, 1, 1,
0.5044917, 1.795162, -0.3376051, 0.1098039, 0, 1, 1,
0.50486, 0.3090365, 0.9929038, 0.1176471, 0, 1, 1,
0.5088718, 0.8148416, 0.2023074, 0.1215686, 0, 1, 1,
0.5091343, -0.6596814, 2.806606, 0.1294118, 0, 1, 1,
0.5121669, 0.3014818, 1.175547, 0.1333333, 0, 1, 1,
0.5148203, 0.2089642, 0.3631747, 0.1411765, 0, 1, 1,
0.5185441, 0.3302453, 1.59312, 0.145098, 0, 1, 1,
0.5193265, 1.957921, 0.5229352, 0.1529412, 0, 1, 1,
0.525688, -0.9628121, 2.351962, 0.1568628, 0, 1, 1,
0.5304241, -0.2949239, 1.203104, 0.1647059, 0, 1, 1,
0.5322558, 0.5793236, 0.4380491, 0.1686275, 0, 1, 1,
0.5329892, 1.528161, 0.3875483, 0.1764706, 0, 1, 1,
0.5340127, -0.3983678, 1.97457, 0.1803922, 0, 1, 1,
0.5458159, -1.081862, 2.490427, 0.1882353, 0, 1, 1,
0.5467499, 1.385381, 1.865142, 0.1921569, 0, 1, 1,
0.5473086, 0.3564135, 1.805803, 0.2, 0, 1, 1,
0.5481071, 0.9938808, 0.6611367, 0.2078431, 0, 1, 1,
0.5516192, -0.02122812, 1.001215, 0.2117647, 0, 1, 1,
0.5524722, -0.371157, 3.958865, 0.2196078, 0, 1, 1,
0.564884, -0.8257146, 1.601384, 0.2235294, 0, 1, 1,
0.5658444, 0.9127704, -0.2634217, 0.2313726, 0, 1, 1,
0.5664451, 2.633702, -0.2390552, 0.2352941, 0, 1, 1,
0.5671129, -1.648066, 1.921945, 0.2431373, 0, 1, 1,
0.5681456, -0.3953659, 1.968861, 0.2470588, 0, 1, 1,
0.570217, 0.4442668, 0.07975659, 0.254902, 0, 1, 1,
0.5722461, -0.05385993, 0.6234508, 0.2588235, 0, 1, 1,
0.5724806, 0.02240834, 2.756377, 0.2666667, 0, 1, 1,
0.5745276, -1.613391, 3.100897, 0.2705882, 0, 1, 1,
0.5755747, 0.07761804, 0.2865743, 0.2784314, 0, 1, 1,
0.5765817, -0.6119424, 3.922221, 0.282353, 0, 1, 1,
0.5806816, -3.238475, 2.342995, 0.2901961, 0, 1, 1,
0.586529, -0.6962825, 1.415371, 0.2941177, 0, 1, 1,
0.5882556, -1.315825, 0.4682999, 0.3019608, 0, 1, 1,
0.5904279, 1.065866, 0.9969606, 0.3098039, 0, 1, 1,
0.5965391, -1.516851, 2.137631, 0.3137255, 0, 1, 1,
0.6032163, -0.5572752, 1.015207, 0.3215686, 0, 1, 1,
0.6073012, 0.9516118, 0.3728099, 0.3254902, 0, 1, 1,
0.6100605, -2.20673, 3.434505, 0.3333333, 0, 1, 1,
0.6122922, 2.23191, 0.8696913, 0.3372549, 0, 1, 1,
0.6126026, 1.769348, -0.00937558, 0.345098, 0, 1, 1,
0.614, -1.25228, 3.213531, 0.3490196, 0, 1, 1,
0.6153951, -1.595385, 2.628308, 0.3568628, 0, 1, 1,
0.6174902, -1.206618, 4.132928, 0.3607843, 0, 1, 1,
0.6212594, 0.5081708, 1.459242, 0.3686275, 0, 1, 1,
0.6214737, -1.323079, 4.939883, 0.372549, 0, 1, 1,
0.6216807, 0.727772, 0.6746117, 0.3803922, 0, 1, 1,
0.6224393, -0.1030339, 0.7462751, 0.3843137, 0, 1, 1,
0.6280909, 0.7245673, 0.1236372, 0.3921569, 0, 1, 1,
0.6307788, 0.4406396, 1.001477, 0.3960784, 0, 1, 1,
0.6405486, 0.9266553, 0.747094, 0.4039216, 0, 1, 1,
0.6426076, -0.3158302, 3.002499, 0.4117647, 0, 1, 1,
0.6432065, 0.06458257, 0.8624404, 0.4156863, 0, 1, 1,
0.64517, 1.296785, -0.553765, 0.4235294, 0, 1, 1,
0.6455622, -0.9250378, 1.14519, 0.427451, 0, 1, 1,
0.6525371, -0.4249574, 1.013365, 0.4352941, 0, 1, 1,
0.6532307, -1.257478, 3.973977, 0.4392157, 0, 1, 1,
0.6560388, -0.7317986, 2.649427, 0.4470588, 0, 1, 1,
0.6666614, -0.2838204, 1.105054, 0.4509804, 0, 1, 1,
0.6721892, -0.1781048, 1.662243, 0.4588235, 0, 1, 1,
0.6730195, -0.9277295, 0.975707, 0.4627451, 0, 1, 1,
0.6750702, -1.143206, 1.865984, 0.4705882, 0, 1, 1,
0.6750906, 1.211347, 0.1048706, 0.4745098, 0, 1, 1,
0.6752332, 0.1748169, 0.795288, 0.4823529, 0, 1, 1,
0.6765691, 2.106483, 0.7188557, 0.4862745, 0, 1, 1,
0.6768495, 0.03338866, 1.837659, 0.4941176, 0, 1, 1,
0.6770705, 0.9866819, 0.3921782, 0.5019608, 0, 1, 1,
0.6773915, 0.9838302, 0.9935083, 0.5058824, 0, 1, 1,
0.6840141, 0.6947523, 4.174155, 0.5137255, 0, 1, 1,
0.6851232, 0.2232996, 0.8973854, 0.5176471, 0, 1, 1,
0.6867093, 1.437871, -0.04231317, 0.5254902, 0, 1, 1,
0.6872843, -1.039891, 2.751096, 0.5294118, 0, 1, 1,
0.6877366, 0.08454206, 0.02364238, 0.5372549, 0, 1, 1,
0.6883413, 1.874115, 1.230741, 0.5411765, 0, 1, 1,
0.68947, -0.3459418, 0.2903106, 0.5490196, 0, 1, 1,
0.6902277, 0.08279537, 0.9033641, 0.5529412, 0, 1, 1,
0.6927071, 0.07973492, 2.556184, 0.5607843, 0, 1, 1,
0.6927731, -1.403035, 2.565396, 0.5647059, 0, 1, 1,
0.6959329, -0.6453237, 2.281327, 0.572549, 0, 1, 1,
0.7012734, 2.293898, 0.1678268, 0.5764706, 0, 1, 1,
0.7051771, 0.02385986, 0.6155666, 0.5843138, 0, 1, 1,
0.7062147, 0.2190489, 0.5609133, 0.5882353, 0, 1, 1,
0.7071767, 2.353139, 0.3649056, 0.5960785, 0, 1, 1,
0.7167607, -0.8169453, 2.789709, 0.6039216, 0, 1, 1,
0.7168913, 0.3177577, 3.063245, 0.6078432, 0, 1, 1,
0.7179651, -0.9191018, 1.118637, 0.6156863, 0, 1, 1,
0.7210997, -1.681137, 2.74335, 0.6196079, 0, 1, 1,
0.7220393, 2.055613, 2.340605, 0.627451, 0, 1, 1,
0.7307923, -0.1040872, 1.882692, 0.6313726, 0, 1, 1,
0.7352223, 0.6498265, 0.6285693, 0.6392157, 0, 1, 1,
0.7389184, 0.1321368, 1.635747, 0.6431373, 0, 1, 1,
0.7417087, 0.6008674, 0.234419, 0.6509804, 0, 1, 1,
0.7446951, 0.3814266, 0.5906487, 0.654902, 0, 1, 1,
0.745625, 0.1649363, -1.124299, 0.6627451, 0, 1, 1,
0.750704, 0.807876, 1.053564, 0.6666667, 0, 1, 1,
0.7513625, 0.5987236, 2.123167, 0.6745098, 0, 1, 1,
0.7557701, -0.182188, 2.834117, 0.6784314, 0, 1, 1,
0.7568378, 0.01277454, 1.805654, 0.6862745, 0, 1, 1,
0.7593532, -0.1039234, 2.386202, 0.6901961, 0, 1, 1,
0.7641971, -0.5888098, 2.832662, 0.6980392, 0, 1, 1,
0.7670183, -1.09875, 1.354514, 0.7058824, 0, 1, 1,
0.7679283, 1.455305, -0.5714699, 0.7098039, 0, 1, 1,
0.7705484, 0.7406399, 0.2792829, 0.7176471, 0, 1, 1,
0.771755, -0.5264585, 1.183512, 0.7215686, 0, 1, 1,
0.775329, 0.7124157, 0.07429994, 0.7294118, 0, 1, 1,
0.776987, -0.3915561, 2.497301, 0.7333333, 0, 1, 1,
0.7823243, 0.3289041, 0.1446948, 0.7411765, 0, 1, 1,
0.7867789, 0.3477271, 2.810307, 0.7450981, 0, 1, 1,
0.787128, 1.255055, -1.398549, 0.7529412, 0, 1, 1,
0.7897984, 1.032053, 0.2425689, 0.7568628, 0, 1, 1,
0.792545, -1.139657, 1.63285, 0.7647059, 0, 1, 1,
0.7951296, -1.23654, 1.401447, 0.7686275, 0, 1, 1,
0.7957888, 0.359597, 2.633295, 0.7764706, 0, 1, 1,
0.796533, 0.35352, -0.8477954, 0.7803922, 0, 1, 1,
0.7974604, -0.1999968, 3.064027, 0.7882353, 0, 1, 1,
0.8001429, -1.263179, 3.634705, 0.7921569, 0, 1, 1,
0.8053486, -0.5540361, 0.485007, 0.8, 0, 1, 1,
0.8068754, -0.7467231, 2.013777, 0.8078431, 0, 1, 1,
0.8126147, -0.432564, 3.841036, 0.8117647, 0, 1, 1,
0.8176591, 0.8348714, 1.203296, 0.8196079, 0, 1, 1,
0.8203132, 0.6916012, 1.269984, 0.8235294, 0, 1, 1,
0.8277752, -1.165719, 2.776817, 0.8313726, 0, 1, 1,
0.8284242, -0.04041497, 2.414566, 0.8352941, 0, 1, 1,
0.8294148, 1.008969, 0.2267736, 0.8431373, 0, 1, 1,
0.8314733, 0.3252749, 3.078811, 0.8470588, 0, 1, 1,
0.8315438, 0.4580025, 0.3506252, 0.854902, 0, 1, 1,
0.842448, 1.131654, 1.036556, 0.8588235, 0, 1, 1,
0.8425516, -0.3724518, 1.359405, 0.8666667, 0, 1, 1,
0.8447025, 0.2047622, 0.1786888, 0.8705882, 0, 1, 1,
0.8456848, 0.3303103, 2.393337, 0.8784314, 0, 1, 1,
0.8479091, -0.1034545, 2.98814, 0.8823529, 0, 1, 1,
0.8494182, -0.9751036, 2.340905, 0.8901961, 0, 1, 1,
0.8532816, -1.074546, 3.398976, 0.8941177, 0, 1, 1,
0.8610411, 0.8045876, 0.6869138, 0.9019608, 0, 1, 1,
0.862209, 0.4696903, 0.612934, 0.9098039, 0, 1, 1,
0.8631737, -0.2067032, 1.92884, 0.9137255, 0, 1, 1,
0.8657816, -0.7550437, 4.742646, 0.9215686, 0, 1, 1,
0.8687327, 0.181747, -0.3430763, 0.9254902, 0, 1, 1,
0.8704579, 1.139826, 0.8721322, 0.9333333, 0, 1, 1,
0.8712188, -0.5411869, 2.824192, 0.9372549, 0, 1, 1,
0.8724434, 0.9074884, 1.218573, 0.945098, 0, 1, 1,
0.8742341, -2.362994, 3.596695, 0.9490196, 0, 1, 1,
0.8863805, -0.4901779, 3.794992, 0.9568627, 0, 1, 1,
0.8890585, 0.6153999, 1.875681, 0.9607843, 0, 1, 1,
0.8940513, 0.120608, 1.176198, 0.9686275, 0, 1, 1,
0.8947829, 1.065718, 1.101413, 0.972549, 0, 1, 1,
0.8974733, -0.2970988, 1.010089, 0.9803922, 0, 1, 1,
0.9001923, 0.4087268, 1.229323, 0.9843137, 0, 1, 1,
0.9066461, -0.08828616, 0.4916945, 0.9921569, 0, 1, 1,
0.9075689, 1.723042, 0.8694837, 0.9960784, 0, 1, 1,
0.9151516, 0.5852514, 1.29305, 1, 0, 0.9960784, 1,
0.9186665, -0.263924, 1.867558, 1, 0, 0.9882353, 1,
0.9206516, 0.7527621, 1.743443, 1, 0, 0.9843137, 1,
0.9228276, 0.7964773, 0.6641312, 1, 0, 0.9764706, 1,
0.9246315, -0.2263675, 1.413589, 1, 0, 0.972549, 1,
0.9274248, 1.475571, 0.9688168, 1, 0, 0.9647059, 1,
0.9280382, 2.105959, 0.3600861, 1, 0, 0.9607843, 1,
0.9320367, 0.4487999, 1.107062, 1, 0, 0.9529412, 1,
0.9469463, 0.08996288, -0.1533849, 1, 0, 0.9490196, 1,
0.9527394, 0.5342205, 2.697701, 1, 0, 0.9411765, 1,
0.9532625, 0.2683298, 2.736807, 1, 0, 0.9372549, 1,
0.9552201, 0.7147942, 1.311682, 1, 0, 0.9294118, 1,
0.9568768, -0.6697512, 1.806133, 1, 0, 0.9254902, 1,
0.9611331, -0.552866, 1.169538, 1, 0, 0.9176471, 1,
0.9733308, 1.840679, 0.720879, 1, 0, 0.9137255, 1,
0.9734727, 1.788802, 0.2667588, 1, 0, 0.9058824, 1,
0.9829589, -0.3025344, 1.922681, 1, 0, 0.9019608, 1,
0.9885203, -1.062534, 1.404036, 1, 0, 0.8941177, 1,
0.9937035, -1.682641, 2.919586, 1, 0, 0.8862745, 1,
0.9964521, -0.978893, 2.56675, 1, 0, 0.8823529, 1,
1.000699, -0.8366954, 2.855245, 1, 0, 0.8745098, 1,
1.015869, -0.1728522, 1.390778, 1, 0, 0.8705882, 1,
1.015897, -0.4649219, 1.466011, 1, 0, 0.8627451, 1,
1.016111, -0.1061978, 1.821282, 1, 0, 0.8588235, 1,
1.021976, 0.9760791, 1.353945, 1, 0, 0.8509804, 1,
1.024935, 0.3970503, 0.8717498, 1, 0, 0.8470588, 1,
1.025839, 0.08554072, 1.834646, 1, 0, 0.8392157, 1,
1.028034, 0.1216734, 1.749082, 1, 0, 0.8352941, 1,
1.03299, -1.018473, 2.671967, 1, 0, 0.827451, 1,
1.034567, 1.324649, -0.3955499, 1, 0, 0.8235294, 1,
1.039362, 2.828328, -2.142803, 1, 0, 0.8156863, 1,
1.045002, 1.262171, 0.7920529, 1, 0, 0.8117647, 1,
1.048118, 0.8265916, 0.9515386, 1, 0, 0.8039216, 1,
1.049607, -0.1076974, 0.762057, 1, 0, 0.7960784, 1,
1.051816, -0.2629937, 2.974759, 1, 0, 0.7921569, 1,
1.051884, -0.4059997, 1.133872, 1, 0, 0.7843137, 1,
1.058412, -0.08673677, 0.3365908, 1, 0, 0.7803922, 1,
1.066091, -1.728198, 2.933465, 1, 0, 0.772549, 1,
1.069792, -0.7696602, 3.027084, 1, 0, 0.7686275, 1,
1.071715, -0.3222176, 2.843116, 1, 0, 0.7607843, 1,
1.073357, 1.727205, -0.2316337, 1, 0, 0.7568628, 1,
1.077183, 0.03696582, 2.641949, 1, 0, 0.7490196, 1,
1.08178, -1.584777, 2.344262, 1, 0, 0.7450981, 1,
1.082492, -1.467104, 2.942171, 1, 0, 0.7372549, 1,
1.082888, -1.353832, 3.037279, 1, 0, 0.7333333, 1,
1.092451, 0.9259785, 0.1851148, 1, 0, 0.7254902, 1,
1.101155, 0.05808793, 3.691702, 1, 0, 0.7215686, 1,
1.10881, -0.3123578, 1.997468, 1, 0, 0.7137255, 1,
1.112588, -0.6632345, 3.621352, 1, 0, 0.7098039, 1,
1.124877, -2.4669, 1.692327, 1, 0, 0.7019608, 1,
1.125289, -0.8168825, 1.412792, 1, 0, 0.6941177, 1,
1.133283, -2.099109, 3.532645, 1, 0, 0.6901961, 1,
1.135982, 3.015698, 0.639191, 1, 0, 0.682353, 1,
1.137326, 0.9792045, 0.3313087, 1, 0, 0.6784314, 1,
1.137685, -0.5508795, 1.919826, 1, 0, 0.6705883, 1,
1.13809, -0.1836101, 3.348338, 1, 0, 0.6666667, 1,
1.14283, -1.543806, 0.9497683, 1, 0, 0.6588235, 1,
1.144826, -2.353896, 2.770444, 1, 0, 0.654902, 1,
1.16202, -0.8973289, 2.335647, 1, 0, 0.6470588, 1,
1.187884, -1.009929, 1.699449, 1, 0, 0.6431373, 1,
1.189269, -0.5210915, 1.3631, 1, 0, 0.6352941, 1,
1.190604, 1.933379, 1.470159, 1, 0, 0.6313726, 1,
1.197951, -0.5256376, 0.7847373, 1, 0, 0.6235294, 1,
1.222909, -1.304885, 2.457911, 1, 0, 0.6196079, 1,
1.227952, -0.996126, 1.952551, 1, 0, 0.6117647, 1,
1.231889, 0.9012382, 0.7936482, 1, 0, 0.6078432, 1,
1.234764, -0.006988297, 1.098548, 1, 0, 0.6, 1,
1.234814, -0.3703221, 1.275871, 1, 0, 0.5921569, 1,
1.240552, 0.2109492, 1.728422, 1, 0, 0.5882353, 1,
1.242588, -0.3421062, 1.800945, 1, 0, 0.5803922, 1,
1.24352, -0.7494292, 2.921455, 1, 0, 0.5764706, 1,
1.24648, 0.634609, 1.457543, 1, 0, 0.5686275, 1,
1.259014, 0.2764815, 1.421938, 1, 0, 0.5647059, 1,
1.267338, 0.9392943, 1.079618, 1, 0, 0.5568628, 1,
1.274226, -0.9054841, 3.826397, 1, 0, 0.5529412, 1,
1.28479, 0.07525923, 1.893441, 1, 0, 0.5450981, 1,
1.291857, 0.8290388, 1.176905, 1, 0, 0.5411765, 1,
1.292497, 0.2693598, 1.937997, 1, 0, 0.5333334, 1,
1.29403, 0.830712, 2.385489, 1, 0, 0.5294118, 1,
1.301285, -0.07083776, 0.5894046, 1, 0, 0.5215687, 1,
1.305555, 2.036705, 1.489233, 1, 0, 0.5176471, 1,
1.310235, 0.906258, -0.5032209, 1, 0, 0.509804, 1,
1.315076, 0.002687258, 1.92327, 1, 0, 0.5058824, 1,
1.317001, 1.017203, 1.314577, 1, 0, 0.4980392, 1,
1.324892, 1.958251, 2.583837, 1, 0, 0.4901961, 1,
1.326693, -0.8183749, 1.808536, 1, 0, 0.4862745, 1,
1.346988, -1.41655, 1.839815, 1, 0, 0.4784314, 1,
1.347752, -0.8127223, 2.05643, 1, 0, 0.4745098, 1,
1.358226, 0.1960018, 1.843773, 1, 0, 0.4666667, 1,
1.363204, 0.7011834, -0.02218372, 1, 0, 0.4627451, 1,
1.365232, -1.700905, 3.596828, 1, 0, 0.454902, 1,
1.36594, 0.9003786, 1.280744, 1, 0, 0.4509804, 1,
1.374441, 0.9857469, 2.354852, 1, 0, 0.4431373, 1,
1.380345, -1.232723, 1.300353, 1, 0, 0.4392157, 1,
1.386249, -1.700172, 2.280747, 1, 0, 0.4313726, 1,
1.391275, 0.8541002, -0.5654029, 1, 0, 0.427451, 1,
1.397671, 1.37042, 1.148577, 1, 0, 0.4196078, 1,
1.400342, -0.4632362, 1.140335, 1, 0, 0.4156863, 1,
1.418134, 1.497999, 0.3946038, 1, 0, 0.4078431, 1,
1.420996, -0.1149264, 2.108037, 1, 0, 0.4039216, 1,
1.444618, -0.2435903, 2.169441, 1, 0, 0.3960784, 1,
1.452238, -0.06926955, 1.592332, 1, 0, 0.3882353, 1,
1.459201, -1.494529, 3.465465, 1, 0, 0.3843137, 1,
1.473207, -0.5757156, 1.689956, 1, 0, 0.3764706, 1,
1.483813, -1.278173, 1.386322, 1, 0, 0.372549, 1,
1.484828, -0.3227181, 2.852461, 1, 0, 0.3647059, 1,
1.484845, 2.265496, 0.3159494, 1, 0, 0.3607843, 1,
1.515818, -0.86268, 1.48129, 1, 0, 0.3529412, 1,
1.524012, -0.1667874, 0.7440348, 1, 0, 0.3490196, 1,
1.545638, 0.3948943, 0.6990996, 1, 0, 0.3411765, 1,
1.546148, -0.912909, 1.452062, 1, 0, 0.3372549, 1,
1.549378, -0.05006844, 0.04329354, 1, 0, 0.3294118, 1,
1.55172, 0.8592737, 0.4457494, 1, 0, 0.3254902, 1,
1.555952, 0.8981501, 1.231603, 1, 0, 0.3176471, 1,
1.57597, -0.3001213, 2.788059, 1, 0, 0.3137255, 1,
1.593242, -0.08416413, 1.629165, 1, 0, 0.3058824, 1,
1.593995, -0.1077818, 1.084246, 1, 0, 0.2980392, 1,
1.603966, -0.2201024, 0.8776766, 1, 0, 0.2941177, 1,
1.621328, 0.8975042, 0.7676674, 1, 0, 0.2862745, 1,
1.631018, 0.2189416, 0.5375081, 1, 0, 0.282353, 1,
1.631708, -0.5695615, 1.911789, 1, 0, 0.2745098, 1,
1.647404, -0.6804731, 1.376526, 1, 0, 0.2705882, 1,
1.653037, 0.418205, 0.1336944, 1, 0, 0.2627451, 1,
1.653356, 0.274089, 0.8786666, 1, 0, 0.2588235, 1,
1.660312, 0.1429196, 0.9858731, 1, 0, 0.2509804, 1,
1.692147, -1.341721, 0.4010121, 1, 0, 0.2470588, 1,
1.699408, 0.7260904, 2.900756, 1, 0, 0.2392157, 1,
1.70025, 0.8810353, 0.6078655, 1, 0, 0.2352941, 1,
1.703946, -1.051949, 1.619633, 1, 0, 0.227451, 1,
1.722647, -1.747217, 2.402179, 1, 0, 0.2235294, 1,
1.746159, -0.02011193, 1.922121, 1, 0, 0.2156863, 1,
1.766302, 1.377061, 0.4696941, 1, 0, 0.2117647, 1,
1.779475, 1.926571, -0.126408, 1, 0, 0.2039216, 1,
1.790002, 1.470663, 0.3313701, 1, 0, 0.1960784, 1,
1.795278, -0.7605464, 1.14563, 1, 0, 0.1921569, 1,
1.858399, 0.3288735, 1.284808, 1, 0, 0.1843137, 1,
1.87269, 1.233953, -0.02075923, 1, 0, 0.1803922, 1,
1.881903, -0.1024816, 1.380348, 1, 0, 0.172549, 1,
1.927404, -0.9644587, -0.3233524, 1, 0, 0.1686275, 1,
1.93885, 1.725424, -1.566955, 1, 0, 0.1607843, 1,
1.957544, 1.419877, 1.87803, 1, 0, 0.1568628, 1,
2.034459, -0.5909899, 2.161819, 1, 0, 0.1490196, 1,
2.037124, 0.5167344, 1.032908, 1, 0, 0.145098, 1,
2.079863, -0.4831968, 3.963771, 1, 0, 0.1372549, 1,
2.090794, 0.09869265, 0.09291542, 1, 0, 0.1333333, 1,
2.114742, 0.583802, 1.320063, 1, 0, 0.1254902, 1,
2.11566, 0.5838212, 1.717657, 1, 0, 0.1215686, 1,
2.118323, 1.83314, 2.480979, 1, 0, 0.1137255, 1,
2.12328, -0.3023229, 1.749553, 1, 0, 0.1098039, 1,
2.132988, -0.7081542, 0.875074, 1, 0, 0.1019608, 1,
2.16763, -1.976327, 4.057487, 1, 0, 0.09411765, 1,
2.205638, -1.112892, 3.015221, 1, 0, 0.09019608, 1,
2.207037, -1.874429, 1.132364, 1, 0, 0.08235294, 1,
2.235266, -0.4024915, 1.910602, 1, 0, 0.07843138, 1,
2.311612, 0.4800055, 0.6265873, 1, 0, 0.07058824, 1,
2.337728, -0.4311665, 1.057028, 1, 0, 0.06666667, 1,
2.367062, -0.284297, 2.080571, 1, 0, 0.05882353, 1,
2.402789, -0.7130737, 0.5551988, 1, 0, 0.05490196, 1,
2.430167, -0.4663696, 0.2831744, 1, 0, 0.04705882, 1,
2.565797, 0.1573354, 1.058066, 1, 0, 0.04313726, 1,
2.572842, -0.1851289, 2.536568, 1, 0, 0.03529412, 1,
2.617881, -0.2886184, 3.277681, 1, 0, 0.03137255, 1,
2.694577, -0.09922452, 4.474914, 1, 0, 0.02352941, 1,
2.789628, -0.4863247, -0.5373099, 1, 0, 0.01960784, 1,
2.817956, 0.3338217, 2.580148, 1, 0, 0.01176471, 1,
2.919851, -0.9311575, 1.829824, 1, 0, 0.007843138, 1
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
-0.08836043, -4.298557, -8.125582, 0, -0.5, 0.5, 0.5,
-0.08836043, -4.298557, -8.125582, 1, -0.5, 0.5, 0.5,
-0.08836043, -4.298557, -8.125582, 1, 1.5, 0.5, 0.5,
-0.08836043, -4.298557, -8.125582, 0, 1.5, 0.5, 0.5
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
-4.116355, -0.1113883, -8.125582, 0, -0.5, 0.5, 0.5,
-4.116355, -0.1113883, -8.125582, 1, -0.5, 0.5, 0.5,
-4.116355, -0.1113883, -8.125582, 1, 1.5, 0.5, 0.5,
-4.116355, -0.1113883, -8.125582, 0, 1.5, 0.5, 0.5
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
-4.116355, -4.298557, 0.4053471, 0, -0.5, 0.5, 0.5,
-4.116355, -4.298557, 0.4053471, 1, -0.5, 0.5, 0.5,
-4.116355, -4.298557, 0.4053471, 1, 1.5, 0.5, 0.5,
-4.116355, -4.298557, 0.4053471, 0, 1.5, 0.5, 0.5
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
-3, -3.332287, -6.156906,
2, -3.332287, -6.156906,
-3, -3.332287, -6.156906,
-3, -3.493332, -6.485018,
-2, -3.332287, -6.156906,
-2, -3.493332, -6.485018,
-1, -3.332287, -6.156906,
-1, -3.493332, -6.485018,
0, -3.332287, -6.156906,
0, -3.493332, -6.485018,
1, -3.332287, -6.156906,
1, -3.493332, -6.485018,
2, -3.332287, -6.156906,
2, -3.493332, -6.485018
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
-3, -3.815422, -7.141243, 0, -0.5, 0.5, 0.5,
-3, -3.815422, -7.141243, 1, -0.5, 0.5, 0.5,
-3, -3.815422, -7.141243, 1, 1.5, 0.5, 0.5,
-3, -3.815422, -7.141243, 0, 1.5, 0.5, 0.5,
-2, -3.815422, -7.141243, 0, -0.5, 0.5, 0.5,
-2, -3.815422, -7.141243, 1, -0.5, 0.5, 0.5,
-2, -3.815422, -7.141243, 1, 1.5, 0.5, 0.5,
-2, -3.815422, -7.141243, 0, 1.5, 0.5, 0.5,
-1, -3.815422, -7.141243, 0, -0.5, 0.5, 0.5,
-1, -3.815422, -7.141243, 1, -0.5, 0.5, 0.5,
-1, -3.815422, -7.141243, 1, 1.5, 0.5, 0.5,
-1, -3.815422, -7.141243, 0, 1.5, 0.5, 0.5,
0, -3.815422, -7.141243, 0, -0.5, 0.5, 0.5,
0, -3.815422, -7.141243, 1, -0.5, 0.5, 0.5,
0, -3.815422, -7.141243, 1, 1.5, 0.5, 0.5,
0, -3.815422, -7.141243, 0, 1.5, 0.5, 0.5,
1, -3.815422, -7.141243, 0, -0.5, 0.5, 0.5,
1, -3.815422, -7.141243, 1, -0.5, 0.5, 0.5,
1, -3.815422, -7.141243, 1, 1.5, 0.5, 0.5,
1, -3.815422, -7.141243, 0, 1.5, 0.5, 0.5,
2, -3.815422, -7.141243, 0, -0.5, 0.5, 0.5,
2, -3.815422, -7.141243, 1, -0.5, 0.5, 0.5,
2, -3.815422, -7.141243, 1, 1.5, 0.5, 0.5,
2, -3.815422, -7.141243, 0, 1.5, 0.5, 0.5
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
-3.186818, -3, -6.156906,
-3.186818, 3, -6.156906,
-3.186818, -3, -6.156906,
-3.341741, -3, -6.485018,
-3.186818, -2, -6.156906,
-3.341741, -2, -6.485018,
-3.186818, -1, -6.156906,
-3.341741, -1, -6.485018,
-3.186818, 0, -6.156906,
-3.341741, 0, -6.485018,
-3.186818, 1, -6.156906,
-3.341741, 1, -6.485018,
-3.186818, 2, -6.156906,
-3.341741, 2, -6.485018,
-3.186818, 3, -6.156906,
-3.341741, 3, -6.485018
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
-3.651586, -3, -7.141243, 0, -0.5, 0.5, 0.5,
-3.651586, -3, -7.141243, 1, -0.5, 0.5, 0.5,
-3.651586, -3, -7.141243, 1, 1.5, 0.5, 0.5,
-3.651586, -3, -7.141243, 0, 1.5, 0.5, 0.5,
-3.651586, -2, -7.141243, 0, -0.5, 0.5, 0.5,
-3.651586, -2, -7.141243, 1, -0.5, 0.5, 0.5,
-3.651586, -2, -7.141243, 1, 1.5, 0.5, 0.5,
-3.651586, -2, -7.141243, 0, 1.5, 0.5, 0.5,
-3.651586, -1, -7.141243, 0, -0.5, 0.5, 0.5,
-3.651586, -1, -7.141243, 1, -0.5, 0.5, 0.5,
-3.651586, -1, -7.141243, 1, 1.5, 0.5, 0.5,
-3.651586, -1, -7.141243, 0, 1.5, 0.5, 0.5,
-3.651586, 0, -7.141243, 0, -0.5, 0.5, 0.5,
-3.651586, 0, -7.141243, 1, -0.5, 0.5, 0.5,
-3.651586, 0, -7.141243, 1, 1.5, 0.5, 0.5,
-3.651586, 0, -7.141243, 0, 1.5, 0.5, 0.5,
-3.651586, 1, -7.141243, 0, -0.5, 0.5, 0.5,
-3.651586, 1, -7.141243, 1, -0.5, 0.5, 0.5,
-3.651586, 1, -7.141243, 1, 1.5, 0.5, 0.5,
-3.651586, 1, -7.141243, 0, 1.5, 0.5, 0.5,
-3.651586, 2, -7.141243, 0, -0.5, 0.5, 0.5,
-3.651586, 2, -7.141243, 1, -0.5, 0.5, 0.5,
-3.651586, 2, -7.141243, 1, 1.5, 0.5, 0.5,
-3.651586, 2, -7.141243, 0, 1.5, 0.5, 0.5,
-3.651586, 3, -7.141243, 0, -0.5, 0.5, 0.5,
-3.651586, 3, -7.141243, 1, -0.5, 0.5, 0.5,
-3.651586, 3, -7.141243, 1, 1.5, 0.5, 0.5,
-3.651586, 3, -7.141243, 0, 1.5, 0.5, 0.5
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
-3.186818, -3.332287, -4,
-3.186818, -3.332287, 6,
-3.186818, -3.332287, -4,
-3.341741, -3.493332, -4,
-3.186818, -3.332287, -2,
-3.341741, -3.493332, -2,
-3.186818, -3.332287, 0,
-3.341741, -3.493332, 0,
-3.186818, -3.332287, 2,
-3.341741, -3.493332, 2,
-3.186818, -3.332287, 4,
-3.341741, -3.493332, 4,
-3.186818, -3.332287, 6,
-3.341741, -3.493332, 6
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
"4",
"6"
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
-3.651586, -3.815422, -4, 0, -0.5, 0.5, 0.5,
-3.651586, -3.815422, -4, 1, -0.5, 0.5, 0.5,
-3.651586, -3.815422, -4, 1, 1.5, 0.5, 0.5,
-3.651586, -3.815422, -4, 0, 1.5, 0.5, 0.5,
-3.651586, -3.815422, -2, 0, -0.5, 0.5, 0.5,
-3.651586, -3.815422, -2, 1, -0.5, 0.5, 0.5,
-3.651586, -3.815422, -2, 1, 1.5, 0.5, 0.5,
-3.651586, -3.815422, -2, 0, 1.5, 0.5, 0.5,
-3.651586, -3.815422, 0, 0, -0.5, 0.5, 0.5,
-3.651586, -3.815422, 0, 1, -0.5, 0.5, 0.5,
-3.651586, -3.815422, 0, 1, 1.5, 0.5, 0.5,
-3.651586, -3.815422, 0, 0, 1.5, 0.5, 0.5,
-3.651586, -3.815422, 2, 0, -0.5, 0.5, 0.5,
-3.651586, -3.815422, 2, 1, -0.5, 0.5, 0.5,
-3.651586, -3.815422, 2, 1, 1.5, 0.5, 0.5,
-3.651586, -3.815422, 2, 0, 1.5, 0.5, 0.5,
-3.651586, -3.815422, 4, 0, -0.5, 0.5, 0.5,
-3.651586, -3.815422, 4, 1, -0.5, 0.5, 0.5,
-3.651586, -3.815422, 4, 1, 1.5, 0.5, 0.5,
-3.651586, -3.815422, 4, 0, 1.5, 0.5, 0.5,
-3.651586, -3.815422, 6, 0, -0.5, 0.5, 0.5,
-3.651586, -3.815422, 6, 1, -0.5, 0.5, 0.5,
-3.651586, -3.815422, 6, 1, 1.5, 0.5, 0.5,
-3.651586, -3.815422, 6, 0, 1.5, 0.5, 0.5
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
-3.186818, -3.332287, -6.156906,
-3.186818, 3.109511, -6.156906,
-3.186818, -3.332287, 6.9676,
-3.186818, 3.109511, 6.9676,
-3.186818, -3.332287, -6.156906,
-3.186818, -3.332287, 6.9676,
-3.186818, 3.109511, -6.156906,
-3.186818, 3.109511, 6.9676,
-3.186818, -3.332287, -6.156906,
3.010097, -3.332287, -6.156906,
-3.186818, -3.332287, 6.9676,
3.010097, -3.332287, 6.9676,
-3.186818, 3.109511, -6.156906,
3.010097, 3.109511, -6.156906,
-3.186818, 3.109511, 6.9676,
3.010097, 3.109511, 6.9676,
3.010097, -3.332287, -6.156906,
3.010097, 3.109511, -6.156906,
3.010097, -3.332287, 6.9676,
3.010097, 3.109511, 6.9676,
3.010097, -3.332287, -6.156906,
3.010097, -3.332287, 6.9676,
3.010097, 3.109511, -6.156906,
3.010097, 3.109511, 6.9676
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
var radius = 8.479221;
var distance = 37.72501;
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
mvMatrix.translate( 0.08836043, 0.1113883, -0.4053471 );
mvMatrix.scale( 1.47943, 1.42319, 0.6985329 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.72501);
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
pyrimidifen<-read.table("pyrimidifen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrimidifen$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidifen' not found
```

```r
y<-pyrimidifen$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidifen' not found
```

```r
z<-pyrimidifen$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidifen' not found
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
-3.096571, -0.4294327, -1.054353, 0, 0, 1, 1, 1,
-3.028972, 0.2477725, -1.419144, 1, 0, 0, 1, 1,
-2.651923, -0.8603539, -1.642106, 1, 0, 0, 1, 1,
-2.647964, 0.2572591, -0.3515117, 1, 0, 0, 1, 1,
-2.419717, -0.2383355, 0.623845, 1, 0, 0, 1, 1,
-2.414021, -0.0439388, -3.481837, 1, 0, 0, 1, 1,
-2.390554, 2.730472, -1.061333, 0, 0, 0, 1, 1,
-2.329305, -0.1438248, -1.468051, 0, 0, 0, 1, 1,
-2.31768, -0.672739, -2.794917, 0, 0, 0, 1, 1,
-2.250385, 0.2177547, -1.793528, 0, 0, 0, 1, 1,
-2.240103, -0.1353426, -1.501248, 0, 0, 0, 1, 1,
-2.233614, 0.3531704, -1.187858, 0, 0, 0, 1, 1,
-2.18939, 0.05847354, -3.174416, 0, 0, 0, 1, 1,
-2.127907, 0.2973872, -1.107235, 1, 1, 1, 1, 1,
-2.036029, 0.2796675, -2.537662, 1, 1, 1, 1, 1,
-2.035347, -0.2006692, -1.185431, 1, 1, 1, 1, 1,
-2.012894, -0.9859539, -0.408142, 1, 1, 1, 1, 1,
-1.985736, 0.9841081, -0.511626, 1, 1, 1, 1, 1,
-1.980363, -0.02869498, -0.1315751, 1, 1, 1, 1, 1,
-1.967408, -0.9611954, -0.2083328, 1, 1, 1, 1, 1,
-1.955548, 0.8802365, -1.93073, 1, 1, 1, 1, 1,
-1.95054, 0.6807718, -2.024321, 1, 1, 1, 1, 1,
-1.936789, 0.1012412, -2.369083, 1, 1, 1, 1, 1,
-1.904068, 0.04044355, -0.2088768, 1, 1, 1, 1, 1,
-1.892618, -0.7687981, -3.849886, 1, 1, 1, 1, 1,
-1.883819, 0.3404328, -0.776095, 1, 1, 1, 1, 1,
-1.883124, 0.820749, -1.080631, 1, 1, 1, 1, 1,
-1.879697, 0.1819761, -0.7544843, 1, 1, 1, 1, 1,
-1.878059, 0.2128126, -0.9233204, 0, 0, 1, 1, 1,
-1.868796, 0.02487129, -1.965372, 1, 0, 0, 1, 1,
-1.863297, -1.386784, -2.025484, 1, 0, 0, 1, 1,
-1.850182, -0.6874389, -0.8062801, 1, 0, 0, 1, 1,
-1.844268, 0.4023453, -2.300862, 1, 0, 0, 1, 1,
-1.812174, 0.1423632, -0.8444734, 1, 0, 0, 1, 1,
-1.808601, -0.1165298, -0.08157641, 0, 0, 0, 1, 1,
-1.808346, -1.793096, -2.330547, 0, 0, 0, 1, 1,
-1.804464, 0.77372, -0.7952189, 0, 0, 0, 1, 1,
-1.798157, 2.093067, -1.186414, 0, 0, 0, 1, 1,
-1.782273, 1.312886, -3.188545, 0, 0, 0, 1, 1,
-1.771259, 0.8400437, -1.249464, 0, 0, 0, 1, 1,
-1.741349, -0.8078679, -2.042743, 0, 0, 0, 1, 1,
-1.712869, 0.8851822, -1.157967, 1, 1, 1, 1, 1,
-1.702587, -0.845208, -2.372716, 1, 1, 1, 1, 1,
-1.689993, 0.4302723, -2.341254, 1, 1, 1, 1, 1,
-1.688987, 0.06848327, -1.327072, 1, 1, 1, 1, 1,
-1.668179, 1.563079, 0.1346339, 1, 1, 1, 1, 1,
-1.664079, 0.6208317, -0.4627989, 1, 1, 1, 1, 1,
-1.63605, -0.3454377, -1.410844, 1, 1, 1, 1, 1,
-1.627297, 0.5569612, -0.8644348, 1, 1, 1, 1, 1,
-1.615424, 0.4408951, -0.2054311, 1, 1, 1, 1, 1,
-1.601051, 0.03665523, -1.253348, 1, 1, 1, 1, 1,
-1.597749, 1.483109, -2.827448, 1, 1, 1, 1, 1,
-1.593231, -0.4194138, -0.8299019, 1, 1, 1, 1, 1,
-1.589837, 1.52301, -1.066577, 1, 1, 1, 1, 1,
-1.586537, 0.9194595, -1.419799, 1, 1, 1, 1, 1,
-1.576233, 0.3339936, -0.0653065, 1, 1, 1, 1, 1,
-1.571228, -0.8500103, -4.513855, 0, 0, 1, 1, 1,
-1.557146, 0.3464807, -0.506137, 1, 0, 0, 1, 1,
-1.556436, -1.436787, -0.950227, 1, 0, 0, 1, 1,
-1.550493, 0.745501, -0.006494755, 1, 0, 0, 1, 1,
-1.538439, 0.3242601, -1.256313, 1, 0, 0, 1, 1,
-1.53176, 0.7137994, -1.095106, 1, 0, 0, 1, 1,
-1.511214, -0.005945989, -2.707562, 0, 0, 0, 1, 1,
-1.502088, -0.1046402, -1.052311, 0, 0, 0, 1, 1,
-1.496147, -0.7871215, -1.851171, 0, 0, 0, 1, 1,
-1.495951, -2.499408, -2.878198, 0, 0, 0, 1, 1,
-1.48931, -0.4132158, -2.289533, 0, 0, 0, 1, 1,
-1.481744, 1.695253, -2.050275, 0, 0, 0, 1, 1,
-1.479578, -1.181141, -2.627659, 0, 0, 0, 1, 1,
-1.475562, 0.2143222, -0.1304481, 1, 1, 1, 1, 1,
-1.467088, 1.603143, 0.2493812, 1, 1, 1, 1, 1,
-1.466213, -0.7705921, -2.752467, 1, 1, 1, 1, 1,
-1.465919, -1.415215, -3.725518, 1, 1, 1, 1, 1,
-1.464116, 0.04463831, -0.4770089, 1, 1, 1, 1, 1,
-1.460736, 0.8804243, -2.430912, 1, 1, 1, 1, 1,
-1.453572, -0.3446495, -0.1596474, 1, 1, 1, 1, 1,
-1.445976, -0.001421065, -1.679167, 1, 1, 1, 1, 1,
-1.444248, 0.3440364, -0.4638164, 1, 1, 1, 1, 1,
-1.435313, 1.140642, -1.486475, 1, 1, 1, 1, 1,
-1.433014, 0.815827, -1.204051, 1, 1, 1, 1, 1,
-1.427092, -0.1699669, -1.584323, 1, 1, 1, 1, 1,
-1.424022, -1.635411, -2.47755, 1, 1, 1, 1, 1,
-1.420666, -1.311828, -1.858046, 1, 1, 1, 1, 1,
-1.406041, 1.044611, -2.113578, 1, 1, 1, 1, 1,
-1.393523, 0.213096, -1.376471, 0, 0, 1, 1, 1,
-1.3905, 1.857451, -0.1379582, 1, 0, 0, 1, 1,
-1.38677, 0.1272278, -4.318289, 1, 0, 0, 1, 1,
-1.374554, 0.9620506, -1.71104, 1, 0, 0, 1, 1,
-1.372062, 0.127955, -2.602751, 1, 0, 0, 1, 1,
-1.367032, -0.226358, -2.032192, 1, 0, 0, 1, 1,
-1.34936, -2.789544, -3.556599, 0, 0, 0, 1, 1,
-1.344638, -0.2707122, -1.617878, 0, 0, 0, 1, 1,
-1.33276, -0.1114475, -1.5353, 0, 0, 0, 1, 1,
-1.321377, 0.3615884, 0.7095538, 0, 0, 0, 1, 1,
-1.312191, -0.3894651, -1.529383, 0, 0, 0, 1, 1,
-1.303848, 1.674287, -1.056305, 0, 0, 0, 1, 1,
-1.294721, 0.7334085, -2.322529, 0, 0, 0, 1, 1,
-1.293534, 1.126505, -0.5721037, 1, 1, 1, 1, 1,
-1.287523, -0.1015437, -2.171893, 1, 1, 1, 1, 1,
-1.282026, -0.6325266, -3.073295, 1, 1, 1, 1, 1,
-1.28083, 0.07279734, -1.429918, 1, 1, 1, 1, 1,
-1.280738, 0.4181296, 0.4999364, 1, 1, 1, 1, 1,
-1.267896, 0.8219282, -0.1252503, 1, 1, 1, 1, 1,
-1.266453, -1.237927, -2.95806, 1, 1, 1, 1, 1,
-1.26358, 0.4100899, -0.9157469, 1, 1, 1, 1, 1,
-1.258446, -0.6569324, -2.349391, 1, 1, 1, 1, 1,
-1.233252, -2.114241, -1.974835, 1, 1, 1, 1, 1,
-1.229779, -0.6276422, -1.374311, 1, 1, 1, 1, 1,
-1.222458, 0.8961056, -1.245387, 1, 1, 1, 1, 1,
-1.215029, 0.5803567, -1.211694, 1, 1, 1, 1, 1,
-1.214764, -0.8798878, -1.28414, 1, 1, 1, 1, 1,
-1.208654, -0.2195237, -0.3814702, 1, 1, 1, 1, 1,
-1.207757, 0.5526673, -2.511055, 0, 0, 1, 1, 1,
-1.205776, 0.589535, -0.744404, 1, 0, 0, 1, 1,
-1.196458, -0.1461751, -1.479988, 1, 0, 0, 1, 1,
-1.196069, 0.1379601, -2.386674, 1, 0, 0, 1, 1,
-1.195834, -0.4798034, -1.744929, 1, 0, 0, 1, 1,
-1.193752, 0.821788, -0.718895, 1, 0, 0, 1, 1,
-1.191538, -0.5714808, -2.587408, 0, 0, 0, 1, 1,
-1.185194, -0.09691723, -1.468553, 0, 0, 0, 1, 1,
-1.177441, 1.173829, -0.7368748, 0, 0, 0, 1, 1,
-1.17444, 1.7807, 1.228061, 0, 0, 0, 1, 1,
-1.170269, 0.4823957, -0.3427212, 0, 0, 0, 1, 1,
-1.162573, 0.7958943, -0.8065871, 0, 0, 0, 1, 1,
-1.161016, 0.8766057, -0.6754224, 0, 0, 0, 1, 1,
-1.148678, 0.5173938, -1.297291, 1, 1, 1, 1, 1,
-1.142255, -0.2593274, -0.8033261, 1, 1, 1, 1, 1,
-1.141577, -0.7501611, -2.247607, 1, 1, 1, 1, 1,
-1.134014, 1.253829, -1.560139, 1, 1, 1, 1, 1,
-1.131741, -0.3268559, -1.918856, 1, 1, 1, 1, 1,
-1.125862, -0.07532857, 0.9871188, 1, 1, 1, 1, 1,
-1.125839, -0.2748192, -0.7421303, 1, 1, 1, 1, 1,
-1.12409, -0.7437717, -2.016797, 1, 1, 1, 1, 1,
-1.120802, 2.165754, 0.1974411, 1, 1, 1, 1, 1,
-1.119033, -0.7019537, -1.376421, 1, 1, 1, 1, 1,
-1.101879, 0.1262126, -2.042879, 1, 1, 1, 1, 1,
-1.092649, -0.2750602, -1.129127, 1, 1, 1, 1, 1,
-1.087157, -1.612912, -1.73713, 1, 1, 1, 1, 1,
-1.0871, -0.3024672, -1.883891, 1, 1, 1, 1, 1,
-1.082567, -1.070474, -1.539702, 1, 1, 1, 1, 1,
-1.079661, -1.026507, -2.559225, 0, 0, 1, 1, 1,
-1.078385, -0.4833327, -1.84257, 1, 0, 0, 1, 1,
-1.077268, 0.1048809, -2.530982, 1, 0, 0, 1, 1,
-1.076871, 0.8127509, -0.5711752, 1, 0, 0, 1, 1,
-1.07631, -0.3506177, -2.696644, 1, 0, 0, 1, 1,
-1.075545, -0.3296407, -2.082386, 1, 0, 0, 1, 1,
-1.069231, -2.419999, -3.799511, 0, 0, 0, 1, 1,
-1.064462, 0.002049647, -1.652275, 0, 0, 0, 1, 1,
-1.054834, 0.5410926, -1.583986, 0, 0, 0, 1, 1,
-1.053117, -0.9442353, -0.2319368, 0, 0, 0, 1, 1,
-1.052511, -0.6320201, -0.6498596, 0, 0, 0, 1, 1,
-1.051833, -1.735971, -3.1108, 0, 0, 0, 1, 1,
-1.042801, 0.4910208, -2.59954, 0, 0, 0, 1, 1,
-1.039052, -0.08064957, 0.1102581, 1, 1, 1, 1, 1,
-1.024557, -0.3651454, -0.7166169, 1, 1, 1, 1, 1,
-1.023729, 0.261911, -0.767056, 1, 1, 1, 1, 1,
-1.012674, -0.4694752, -1.487501, 1, 1, 1, 1, 1,
-1.009131, 1.396924, -0.282822, 1, 1, 1, 1, 1,
-0.9844465, -0.09454481, -1.692058, 1, 1, 1, 1, 1,
-0.982558, -0.4270617, -1.874621, 1, 1, 1, 1, 1,
-0.9670746, -0.5393193, -1.136346, 1, 1, 1, 1, 1,
-0.953894, -1.649297, -2.558946, 1, 1, 1, 1, 1,
-0.9512438, 0.2342037, 0.8279976, 1, 1, 1, 1, 1,
-0.9498745, -1.14301, -1.399836, 1, 1, 1, 1, 1,
-0.9485291, 1.07122, -1.359831, 1, 1, 1, 1, 1,
-0.9395442, -2.540096, -2.585781, 1, 1, 1, 1, 1,
-0.9378563, -0.5845526, -3.227815, 1, 1, 1, 1, 1,
-0.932746, -0.8804707, -2.380544, 1, 1, 1, 1, 1,
-0.9307061, -0.266603, -1.71363, 0, 0, 1, 1, 1,
-0.9297687, -0.2725214, -1.936915, 1, 0, 0, 1, 1,
-0.9277837, 0.3586389, -2.428026, 1, 0, 0, 1, 1,
-0.9242118, -0.2111133, -1.966523, 1, 0, 0, 1, 1,
-0.9174362, 0.3935159, -0.4142029, 1, 0, 0, 1, 1,
-0.9166808, 1.258376, -0.1190783, 1, 0, 0, 1, 1,
-0.9140545, -0.7800112, -2.078246, 0, 0, 0, 1, 1,
-0.9110795, -0.5084579, 0.3389316, 0, 0, 0, 1, 1,
-0.906665, 2.085054, -0.6788204, 0, 0, 0, 1, 1,
-0.8967332, -0.3188307, -1.869336, 0, 0, 0, 1, 1,
-0.8940744, -0.9871866, -2.832965, 0, 0, 0, 1, 1,
-0.8930161, 0.6868418, -2.68425, 0, 0, 0, 1, 1,
-0.8839305, -1.031044, -2.162173, 0, 0, 0, 1, 1,
-0.8828938, -1.023665, -4.269052, 1, 1, 1, 1, 1,
-0.880318, 0.9920999, -0.529443, 1, 1, 1, 1, 1,
-0.8769844, 1.014564, -1.371245, 1, 1, 1, 1, 1,
-0.8721692, 0.8744181, -1.332211, 1, 1, 1, 1, 1,
-0.8710191, 1.748367, -0.7686022, 1, 1, 1, 1, 1,
-0.8700869, 0.6538659, -1.411127, 1, 1, 1, 1, 1,
-0.8591648, -0.8768919, -3.380912, 1, 1, 1, 1, 1,
-0.8490824, -1.478536, -2.574534, 1, 1, 1, 1, 1,
-0.8460546, 0.4956288, -0.518198, 1, 1, 1, 1, 1,
-0.8456391, 0.7647246, -2.136222, 1, 1, 1, 1, 1,
-0.8447437, -1.376332, -2.927357, 1, 1, 1, 1, 1,
-0.8404493, -0.07799608, -2.580612, 1, 1, 1, 1, 1,
-0.8313956, 0.05847039, -1.719712, 1, 1, 1, 1, 1,
-0.8313291, -1.882065, -4.250106, 1, 1, 1, 1, 1,
-0.8309411, -0.9062445, -2.626335, 1, 1, 1, 1, 1,
-0.8278863, 1.195235, -1.343579, 0, 0, 1, 1, 1,
-0.8241253, 0.2496956, -2.690863, 1, 0, 0, 1, 1,
-0.8232136, 1.802185, -1.364738, 1, 0, 0, 1, 1,
-0.8195873, 0.07291997, -1.460599, 1, 0, 0, 1, 1,
-0.8185679, -2.469519, -3.85757, 1, 0, 0, 1, 1,
-0.8123978, 0.9178104, -2.131967, 1, 0, 0, 1, 1,
-0.809582, 1.969221, 0.04170201, 0, 0, 0, 1, 1,
-0.8043627, -1.461723, -5.270963, 0, 0, 0, 1, 1,
-0.8003182, 0.115073, -4.674414, 0, 0, 0, 1, 1,
-0.792253, -0.8912106, -2.241527, 0, 0, 0, 1, 1,
-0.7875094, 0.8069106, -0.8870329, 0, 0, 0, 1, 1,
-0.7843614, 1.763335, 0.4489094, 0, 0, 0, 1, 1,
-0.7796198, -1.105208, -3.507139, 0, 0, 0, 1, 1,
-0.7790933, 1.865823, 0.1687025, 1, 1, 1, 1, 1,
-0.7703407, -0.8819564, -1.436907, 1, 1, 1, 1, 1,
-0.7693074, 1.095733, -1.740591, 1, 1, 1, 1, 1,
-0.767702, -0.5013493, -2.848634, 1, 1, 1, 1, 1,
-0.7643199, 2.396838, -0.9660733, 1, 1, 1, 1, 1,
-0.7599983, -1.191795, -2.220567, 1, 1, 1, 1, 1,
-0.7577249, 0.03181422, -2.74702, 1, 1, 1, 1, 1,
-0.7552605, -1.161766, -3.81794, 1, 1, 1, 1, 1,
-0.7512559, -0.9684979, -1.880823, 1, 1, 1, 1, 1,
-0.7512425, 0.6491594, 0.6526703, 1, 1, 1, 1, 1,
-0.7500343, -1.034676, -2.741517, 1, 1, 1, 1, 1,
-0.7497026, 0.1976439, -1.795245, 1, 1, 1, 1, 1,
-0.7481514, -1.082302, -0.5634643, 1, 1, 1, 1, 1,
-0.7425427, 0.6203421, -1.552079, 1, 1, 1, 1, 1,
-0.7414389, 0.6013566, -2.091437, 1, 1, 1, 1, 1,
-0.7395349, 0.5256576, -0.9525509, 0, 0, 1, 1, 1,
-0.7322246, -0.5637785, -2.380598, 1, 0, 0, 1, 1,
-0.7266929, 0.9267493, -1.558749, 1, 0, 0, 1, 1,
-0.7238424, 1.298007, -2.393482, 1, 0, 0, 1, 1,
-0.7217622, -0.7382119, -1.996663, 1, 0, 0, 1, 1,
-0.7202206, -0.2403553, -2.564658, 1, 0, 0, 1, 1,
-0.7172036, -0.2127653, -2.552353, 0, 0, 0, 1, 1,
-0.7170495, 0.2231225, -1.966825, 0, 0, 0, 1, 1,
-0.7160221, 1.254397, 2.193353, 0, 0, 0, 1, 1,
-0.7151528, -0.7491199, -3.047807, 0, 0, 0, 1, 1,
-0.7138333, -0.9909308, -2.417581, 0, 0, 0, 1, 1,
-0.7133412, -0.3740319, -2.587517, 0, 0, 0, 1, 1,
-0.7120701, 0.07238778, 0.5259477, 0, 0, 0, 1, 1,
-0.7101881, -0.4056695, -1.75524, 1, 1, 1, 1, 1,
-0.7067589, 0.9844663, 1.628642, 1, 1, 1, 1, 1,
-0.7066954, -0.3162915, -0.9770218, 1, 1, 1, 1, 1,
-0.699623, -0.4249474, -2.090426, 1, 1, 1, 1, 1,
-0.6950766, 0.1749841, -2.685613, 1, 1, 1, 1, 1,
-0.6929436, -0.6128731, -3.244296, 1, 1, 1, 1, 1,
-0.6918766, 0.1972839, -2.353976, 1, 1, 1, 1, 1,
-0.691582, 0.3924456, -1.057616, 1, 1, 1, 1, 1,
-0.6892612, 1.565567, -0.7431262, 1, 1, 1, 1, 1,
-0.6864046, 0.2837135, -1.435668, 1, 1, 1, 1, 1,
-0.686123, 0.7084166, -0.4394424, 1, 1, 1, 1, 1,
-0.6828172, 0.501731, -1.024319, 1, 1, 1, 1, 1,
-0.6815785, 0.2037884, -0.6243972, 1, 1, 1, 1, 1,
-0.6807652, 0.8081658, -0.5797461, 1, 1, 1, 1, 1,
-0.680236, 1.5266, -0.1929015, 1, 1, 1, 1, 1,
-0.6735296, -1.219185, -2.532342, 0, 0, 1, 1, 1,
-0.6724077, -0.8811399, -2.551158, 1, 0, 0, 1, 1,
-0.6671337, -1.719828, -0.7711592, 1, 0, 0, 1, 1,
-0.6659611, 0.1226114, -0.823584, 1, 0, 0, 1, 1,
-0.665508, 0.9337729, -1.012301, 1, 0, 0, 1, 1,
-0.6649402, 0.5089254, -0.4587246, 1, 0, 0, 1, 1,
-0.6628292, -0.3871019, -2.505321, 0, 0, 0, 1, 1,
-0.6613519, 0.3174326, -1.846991, 0, 0, 0, 1, 1,
-0.6539214, 1.472216, 0.03190879, 0, 0, 0, 1, 1,
-0.651101, -0.5922205, -2.273638, 0, 0, 0, 1, 1,
-0.6477249, 0.9672263, -2.431015, 0, 0, 0, 1, 1,
-0.6409605, 0.5594512, -1.982719, 0, 0, 0, 1, 1,
-0.6407241, -0.8526546, -2.784961, 0, 0, 0, 1, 1,
-0.6386879, -0.8671128, -1.776301, 1, 1, 1, 1, 1,
-0.6293362, -1.529632, -3.253881, 1, 1, 1, 1, 1,
-0.6280683, -0.7961624, -2.572603, 1, 1, 1, 1, 1,
-0.6220703, -0.8062208, -2.47008, 1, 1, 1, 1, 1,
-0.6217187, 0.1029074, -1.797209, 1, 1, 1, 1, 1,
-0.6140325, 1.048359, -0.5420639, 1, 1, 1, 1, 1,
-0.6136747, -0.5551119, -3.228878, 1, 1, 1, 1, 1,
-0.6071051, -1.002425, -1.04064, 1, 1, 1, 1, 1,
-0.6057781, 0.7740579, 0.6511723, 1, 1, 1, 1, 1,
-0.6051785, -0.0851348, -1.556636, 1, 1, 1, 1, 1,
-0.599821, -0.4928753, -3.375936, 1, 1, 1, 1, 1,
-0.5983171, 1.174392, -1.73499, 1, 1, 1, 1, 1,
-0.5975744, 0.4677598, -0.9548214, 1, 1, 1, 1, 1,
-0.5975496, 0.5060322, -0.9401383, 1, 1, 1, 1, 1,
-0.5957153, 1.846342, -0.01278697, 1, 1, 1, 1, 1,
-0.5937872, 0.6160956, -1.359049, 0, 0, 1, 1, 1,
-0.5887035, 0.8346261, 0.3618605, 1, 0, 0, 1, 1,
-0.5802634, -1.114352, -1.273928, 1, 0, 0, 1, 1,
-0.5757183, 1.594108, -0.7899243, 1, 0, 0, 1, 1,
-0.5636471, 2.123134, -0.4575182, 1, 0, 0, 1, 1,
-0.56307, 1.101775, -0.1212333, 1, 0, 0, 1, 1,
-0.558127, -1.0964, -3.650065, 0, 0, 0, 1, 1,
-0.5441098, 0.9244959, -1.607459, 0, 0, 0, 1, 1,
-0.5425035, -0.3733407, -4.142391, 0, 0, 0, 1, 1,
-0.5397766, -0.5766866, -2.821083, 0, 0, 0, 1, 1,
-0.5341993, -0.2516664, -2.136532, 0, 0, 0, 1, 1,
-0.5338168, 2.833339, -0.9592134, 0, 0, 0, 1, 1,
-0.5288693, -0.765134, -0.9763365, 0, 0, 0, 1, 1,
-0.5285329, 0.6874124, -1.207619, 1, 1, 1, 1, 1,
-0.5271293, -0.4099761, -3.068078, 1, 1, 1, 1, 1,
-0.5140622, 0.3915255, -1.39519, 1, 1, 1, 1, 1,
-0.5114494, -1.279372, -2.392251, 1, 1, 1, 1, 1,
-0.5111277, -0.5636012, -3.148655, 1, 1, 1, 1, 1,
-0.5084142, 0.9342896, 0.3313484, 1, 1, 1, 1, 1,
-0.5059096, -0.1848053, -1.535691, 1, 1, 1, 1, 1,
-0.5024525, 0.6651788, 0.5330789, 1, 1, 1, 1, 1,
-0.4981858, -0.8210666, -3.129205, 1, 1, 1, 1, 1,
-0.4937781, 0.08542074, -1.088203, 1, 1, 1, 1, 1,
-0.4934376, -0.4812115, -0.911354, 1, 1, 1, 1, 1,
-0.4893732, -1.392039, -2.085651, 1, 1, 1, 1, 1,
-0.4887298, -0.2216316, -0.04612572, 1, 1, 1, 1, 1,
-0.4871274, -0.3197369, -4.061082, 1, 1, 1, 1, 1,
-0.4816901, 0.3464952, 0.0985632, 1, 1, 1, 1, 1,
-0.4811463, 0.9923933, -0.8223467, 0, 0, 1, 1, 1,
-0.4748418, 0.3808912, 0.8391759, 1, 0, 0, 1, 1,
-0.470463, -0.04930691, -3.865889, 1, 0, 0, 1, 1,
-0.4702417, 1.872655, 0.1561863, 1, 0, 0, 1, 1,
-0.4679611, -2.540937, -3.523209, 1, 0, 0, 1, 1,
-0.4651557, 0.3729337, 0.3370479, 1, 0, 0, 1, 1,
-0.45768, -1.373029, -3.016636, 0, 0, 0, 1, 1,
-0.455073, -0.2585513, -2.333014, 0, 0, 0, 1, 1,
-0.454553, -0.2151984, -2.721813, 0, 0, 0, 1, 1,
-0.451298, 1.015772, -0.5092015, 0, 0, 0, 1, 1,
-0.4491963, -0.3339121, -1.324757, 0, 0, 0, 1, 1,
-0.4486158, 2.791766, 0.8575031, 0, 0, 0, 1, 1,
-0.433245, -0.5660281, -2.278318, 0, 0, 0, 1, 1,
-0.4262255, -0.4790987, -3.018167, 1, 1, 1, 1, 1,
-0.4245794, -0.7480187, -0.478852, 1, 1, 1, 1, 1,
-0.4216476, 1.276896, 0.7845741, 1, 1, 1, 1, 1,
-0.4184821, 0.4865395, -0.7535403, 1, 1, 1, 1, 1,
-0.4161703, -0.1397063, -2.587216, 1, 1, 1, 1, 1,
-0.4160805, 1.251724, -1.770865, 1, 1, 1, 1, 1,
-0.4145158, -0.5057966, -2.725736, 1, 1, 1, 1, 1,
-0.4116552, -0.5992249, -1.718713, 1, 1, 1, 1, 1,
-0.4101446, -0.1856564, -2.469769, 1, 1, 1, 1, 1,
-0.406195, -0.04897401, -3.392154, 1, 1, 1, 1, 1,
-0.4044356, -0.9072273, -3.515203, 1, 1, 1, 1, 1,
-0.3976511, 0.2044936, -0.3543302, 1, 1, 1, 1, 1,
-0.3973519, 0.31234, -1.784177, 1, 1, 1, 1, 1,
-0.3868042, -0.2888109, -2.077048, 1, 1, 1, 1, 1,
-0.3860645, -0.648318, -5.965772, 1, 1, 1, 1, 1,
-0.385579, -0.7774429, -2.976683, 0, 0, 1, 1, 1,
-0.3852608, 1.197483, -0.7413543, 1, 0, 0, 1, 1,
-0.3850088, -2.024828, -1.003539, 1, 0, 0, 1, 1,
-0.3830942, 1.294488, -0.9313186, 1, 0, 0, 1, 1,
-0.3791504, -0.2969123, -2.912197, 1, 0, 0, 1, 1,
-0.3715591, 1.347737, 0.5301009, 1, 0, 0, 1, 1,
-0.3702766, -0.4807155, -3.418607, 0, 0, 0, 1, 1,
-0.3692554, 1.241401, 2.248596, 0, 0, 0, 1, 1,
-0.365983, 1.295037, -0.9169948, 0, 0, 0, 1, 1,
-0.3636822, 0.6455762, -0.3657356, 0, 0, 0, 1, 1,
-0.3631614, -0.7206488, -4.17908, 0, 0, 0, 1, 1,
-0.3613295, 0.2010171, 0.0697636, 0, 0, 0, 1, 1,
-0.3576015, -0.08300352, -2.697513, 0, 0, 0, 1, 1,
-0.3523753, -1.32175, -3.666651, 1, 1, 1, 1, 1,
-0.3426256, 0.910305, -0.7979333, 1, 1, 1, 1, 1,
-0.3403742, 0.7741327, 1.40938, 1, 1, 1, 1, 1,
-0.3366743, -0.249476, -1.766576, 1, 1, 1, 1, 1,
-0.3312391, -0.6256029, -4.470961, 1, 1, 1, 1, 1,
-0.3286573, 0.915223, -0.6585923, 1, 1, 1, 1, 1,
-0.32108, -0.2983017, -1.345248, 1, 1, 1, 1, 1,
-0.3171759, -0.120916, -1.491279, 1, 1, 1, 1, 1,
-0.3121395, -1.562988, -2.851214, 1, 1, 1, 1, 1,
-0.3096735, -0.1944016, -1.482661, 1, 1, 1, 1, 1,
-0.3095114, -1.445619, -2.869129, 1, 1, 1, 1, 1,
-0.3092743, 2.311166, -0.6328648, 1, 1, 1, 1, 1,
-0.3091415, 0.1752136, -0.2183575, 1, 1, 1, 1, 1,
-0.3088185, 0.3104925, 1.055503, 1, 1, 1, 1, 1,
-0.2987562, 0.8704078, -0.2175234, 1, 1, 1, 1, 1,
-0.2951999, 0.04693269, -1.412501, 0, 0, 1, 1, 1,
-0.2944959, 0.03516868, -2.087238, 1, 0, 0, 1, 1,
-0.288578, 0.08199088, -0.8016878, 1, 0, 0, 1, 1,
-0.2859358, -0.6852695, -3.674735, 1, 0, 0, 1, 1,
-0.285756, -0.3132955, -1.788979, 1, 0, 0, 1, 1,
-0.2849469, 1.503493, -0.4666229, 1, 0, 0, 1, 1,
-0.281577, 0.7023606, 0.007211771, 0, 0, 0, 1, 1,
-0.2807787, 2.122993, -0.8716673, 0, 0, 0, 1, 1,
-0.277476, 0.4923032, -1.316667, 0, 0, 0, 1, 1,
-0.2760593, -0.373424, -3.109579, 0, 0, 0, 1, 1,
-0.2740369, 1.508276, -1.035238, 0, 0, 0, 1, 1,
-0.2729164, -0.3595766, -2.727635, 0, 0, 0, 1, 1,
-0.2720579, 2.366254, -0.03154861, 0, 0, 0, 1, 1,
-0.2707738, -0.3513421, -3.536821, 1, 1, 1, 1, 1,
-0.2705588, 0.1653178, -2.425156, 1, 1, 1, 1, 1,
-0.2655996, 1.403054, -0.8697838, 1, 1, 1, 1, 1,
-0.2650448, 1.38605, 0.3131866, 1, 1, 1, 1, 1,
-0.264715, 0.8323902, -0.7816082, 1, 1, 1, 1, 1,
-0.2627599, 0.5756959, -0.2862433, 1, 1, 1, 1, 1,
-0.2623435, 0.4669407, -1.996503, 1, 1, 1, 1, 1,
-0.2620274, -0.01031729, -0.7240069, 1, 1, 1, 1, 1,
-0.2535105, -0.3278719, -2.09106, 1, 1, 1, 1, 1,
-0.2517977, -0.3665502, -2.271781, 1, 1, 1, 1, 1,
-0.2484361, -0.3953729, -0.380839, 1, 1, 1, 1, 1,
-0.2471967, -0.3875634, -2.367332, 1, 1, 1, 1, 1,
-0.2431185, 1.077642, -1.584355, 1, 1, 1, 1, 1,
-0.2404454, -1.024694, -3.737562, 1, 1, 1, 1, 1,
-0.2390423, -0.4214374, -3.807037, 1, 1, 1, 1, 1,
-0.2381669, 1.335207, 0.9246383, 0, 0, 1, 1, 1,
-0.2364654, 0.9290946, 1.104708, 1, 0, 0, 1, 1,
-0.2281443, 1.172146, -0.1495419, 1, 0, 0, 1, 1,
-0.2270761, -0.9410928, -3.204605, 1, 0, 0, 1, 1,
-0.2249473, 2.309228, 1.51822, 1, 0, 0, 1, 1,
-0.2178726, -1.791442, -2.605778, 1, 0, 0, 1, 1,
-0.2142635, 1.76878, -1.368163, 0, 0, 0, 1, 1,
-0.2126388, -0.3464195, -4.273772, 0, 0, 0, 1, 1,
-0.2117916, 0.4770125, -1.910831, 0, 0, 0, 1, 1,
-0.2111901, 0.8343669, -2.61017, 0, 0, 0, 1, 1,
-0.2089293, 0.5919178, -0.4632474, 0, 0, 0, 1, 1,
-0.208568, -0.8815836, -3.950567, 0, 0, 0, 1, 1,
-0.2009927, -0.8963726, -1.922438, 0, 0, 0, 1, 1,
-0.1996674, -0.6239822, -3.146968, 1, 1, 1, 1, 1,
-0.1989169, 0.4546324, -0.1235553, 1, 1, 1, 1, 1,
-0.1972134, 0.109007, -1.740267, 1, 1, 1, 1, 1,
-0.1921882, -0.2062588, -2.292775, 1, 1, 1, 1, 1,
-0.1882964, 0.3245971, -0.9316364, 1, 1, 1, 1, 1,
-0.1824593, 0.7035457, -1.507914, 1, 1, 1, 1, 1,
-0.1774789, 0.4765157, -0.8298185, 1, 1, 1, 1, 1,
-0.1747488, -0.4159338, -3.66388, 1, 1, 1, 1, 1,
-0.1728922, 1.234911, -1.258532, 1, 1, 1, 1, 1,
-0.1714923, -0.4938208, -4.072812, 1, 1, 1, 1, 1,
-0.1710297, 1.201147, -1.126817, 1, 1, 1, 1, 1,
-0.1657867, -0.7806171, -3.568213, 1, 1, 1, 1, 1,
-0.1657814, -1.093066, -3.317925, 1, 1, 1, 1, 1,
-0.1648821, -1.025231, -2.105489, 1, 1, 1, 1, 1,
-0.1632772, 0.4769068, -0.185793, 1, 1, 1, 1, 1,
-0.1614888, 0.1449443, -1.015559, 0, 0, 1, 1, 1,
-0.1596987, 1.263978, -2.133632, 1, 0, 0, 1, 1,
-0.1575707, -0.7938846, -0.7652423, 1, 0, 0, 1, 1,
-0.1565788, -0.985064, -2.11871, 1, 0, 0, 1, 1,
-0.1550943, -0.7671548, -3.519648, 1, 0, 0, 1, 1,
-0.1536162, -0.318706, -2.653228, 1, 0, 0, 1, 1,
-0.1504523, 0.7882166, -0.658771, 0, 0, 0, 1, 1,
-0.150064, 0.3129741, -1.009064, 0, 0, 0, 1, 1,
-0.1470865, -0.3219895, -1.96563, 0, 0, 0, 1, 1,
-0.1462718, -0.2760579, -1.929641, 0, 0, 0, 1, 1,
-0.1389448, -0.660218, -1.945315, 0, 0, 0, 1, 1,
-0.1373721, 0.6236721, 0.2068492, 0, 0, 0, 1, 1,
-0.1348081, -0.3774515, -3.761214, 0, 0, 0, 1, 1,
-0.1299247, -0.8606021, -2.723259, 1, 1, 1, 1, 1,
-0.1266518, 1.230804, -0.2080336, 1, 1, 1, 1, 1,
-0.1261917, 0.2224655, -0.9351211, 1, 1, 1, 1, 1,
-0.1257215, 1.095127, 0.7067829, 1, 1, 1, 1, 1,
-0.1248808, 1.317347, -1.405632, 1, 1, 1, 1, 1,
-0.1213274, 0.4989806, 0.2515431, 1, 1, 1, 1, 1,
-0.1207335, -0.877655, -2.636009, 1, 1, 1, 1, 1,
-0.1195709, -0.5450481, -4.541156, 1, 1, 1, 1, 1,
-0.1130425, -1.083574, -3.047663, 1, 1, 1, 1, 1,
-0.1129268, -1.738983, -1.489891, 1, 1, 1, 1, 1,
-0.1126847, -0.9382303, -2.802425, 1, 1, 1, 1, 1,
-0.1089144, 0.8468233, -0.3444249, 1, 1, 1, 1, 1,
-0.1070763, -0.2553062, -3.617894, 1, 1, 1, 1, 1,
-0.1020681, 0.5165859, -0.218689, 1, 1, 1, 1, 1,
-0.100922, 0.5386668, 1.699996, 1, 1, 1, 1, 1,
-0.09929737, -0.5791253, -3.667575, 0, 0, 1, 1, 1,
-0.0989161, -1.020225, -3.192366, 1, 0, 0, 1, 1,
-0.09849592, 2.122964, 0.1619703, 1, 0, 0, 1, 1,
-0.09473086, 0.8583994, -2.224549, 1, 0, 0, 1, 1,
-0.09456787, -0.7632058, -5.684873, 1, 0, 0, 1, 1,
-0.09426066, 0.5018214, -0.3545765, 1, 0, 0, 1, 1,
-0.09140894, -2.176274, -2.897252, 0, 0, 0, 1, 1,
-0.09051775, 1.32154, -0.4034806, 0, 0, 0, 1, 1,
-0.0884724, -0.6709868, -2.809234, 0, 0, 0, 1, 1,
-0.08651281, -0.05947301, -1.852443, 0, 0, 0, 1, 1,
-0.08379424, 0.6683372, 0.7336574, 0, 0, 0, 1, 1,
-0.0835539, 0.4289654, 0.013247, 0, 0, 0, 1, 1,
-0.08267154, 0.1439378, -1.171603, 0, 0, 0, 1, 1,
-0.08116782, -0.9439819, -3.545208, 1, 1, 1, 1, 1,
-0.08106554, -0.6649643, -3.564317, 1, 1, 1, 1, 1,
-0.07367474, 1.372586, -0.2679652, 1, 1, 1, 1, 1,
-0.06940962, -1.428784, -1.722672, 1, 1, 1, 1, 1,
-0.06860481, -0.5153018, -4.081259, 1, 1, 1, 1, 1,
-0.06736775, 0.9869384, -1.374785, 1, 1, 1, 1, 1,
-0.06236016, -0.06725905, -0.7961736, 1, 1, 1, 1, 1,
-0.06153827, 0.08705033, -0.2917092, 1, 1, 1, 1, 1,
-0.06037001, -0.4306892, -2.867545, 1, 1, 1, 1, 1,
-0.05657997, -1.160176, -4.782505, 1, 1, 1, 1, 1,
-0.05631103, 1.734481, -0.9186494, 1, 1, 1, 1, 1,
-0.0509995, -0.8128986, -1.968929, 1, 1, 1, 1, 1,
-0.04941201, 1.526709, -0.1145327, 1, 1, 1, 1, 1,
-0.04735137, -1.251733, -1.855111, 1, 1, 1, 1, 1,
-0.04254844, -1.174818, -4.558043, 1, 1, 1, 1, 1,
-0.03910169, 0.07780908, -0.7765989, 0, 0, 1, 1, 1,
-0.03770602, 0.5158688, -0.006593892, 1, 0, 0, 1, 1,
-0.03648592, 0.274067, -1.120007, 1, 0, 0, 1, 1,
-0.03129234, -0.4022808, -2.181445, 1, 0, 0, 1, 1,
-0.03035262, 1.275709, 1.676969, 1, 0, 0, 1, 1,
-0.02886513, -1.064261, -2.931491, 1, 0, 0, 1, 1,
-0.02430507, 0.7417219, 0.8013898, 0, 0, 0, 1, 1,
-0.02415542, -0.1227851, -4.354028, 0, 0, 0, 1, 1,
-0.02209327, 0.4125192, -0.2753301, 0, 0, 0, 1, 1,
-0.01881186, -2.849448, -3.472438, 0, 0, 0, 1, 1,
-0.01750466, -1.843595, -1.305271, 0, 0, 0, 1, 1,
-0.01686767, 1.172997, 1.417797, 0, 0, 0, 1, 1,
-0.01371771, 0.5789646, 2.290265, 0, 0, 0, 1, 1,
-0.01244182, -0.6658632, -4.735773, 1, 1, 1, 1, 1,
-0.00987299, -2.60446, -3.540925, 1, 1, 1, 1, 1,
-0.007676707, 1.706055, 0.9806767, 1, 1, 1, 1, 1,
0.0003072486, -1.124202, 4.415425, 1, 1, 1, 1, 1,
0.005287616, 0.7194071, -0.3959408, 1, 1, 1, 1, 1,
0.007837899, -1.038793, 2.533363, 1, 1, 1, 1, 1,
0.009639565, 0.123966, 0.8584932, 1, 1, 1, 1, 1,
0.01407093, 1.401126, -1.578512, 1, 1, 1, 1, 1,
0.01498416, 0.7832707, 0.3349981, 1, 1, 1, 1, 1,
0.01862049, -1.441458, 3.659678, 1, 1, 1, 1, 1,
0.0195432, 0.9309044, 0.1401295, 1, 1, 1, 1, 1,
0.02122711, -0.4885867, 3.68253, 1, 1, 1, 1, 1,
0.02125795, 1.321317, -2.362735, 1, 1, 1, 1, 1,
0.02431078, 0.8232815, -0.06708881, 1, 1, 1, 1, 1,
0.02622787, 1.724731, 0.2614348, 1, 1, 1, 1, 1,
0.02927994, -0.8885814, 2.952163, 0, 0, 1, 1, 1,
0.03556374, 0.523067, 0.05595783, 1, 0, 0, 1, 1,
0.03596799, 0.5730147, 0.2085801, 1, 0, 0, 1, 1,
0.03933004, 2.534464, 0.6568887, 1, 0, 0, 1, 1,
0.03969922, 0.5498294, 2.336552, 1, 0, 0, 1, 1,
0.04090274, 0.8582008, -0.257189, 1, 0, 0, 1, 1,
0.04199483, -0.1344934, 5.02853, 0, 0, 0, 1, 1,
0.04880477, -0.3125873, 3.539685, 0, 0, 0, 1, 1,
0.05297748, 0.9422511, 0.7188339, 0, 0, 0, 1, 1,
0.05378077, 0.4581238, 0.8895182, 0, 0, 0, 1, 1,
0.05670732, 1.999395, 0.962792, 0, 0, 0, 1, 1,
0.05818401, -0.8659313, 3.294959, 0, 0, 0, 1, 1,
0.06071375, -0.2710415, 3.874593, 0, 0, 0, 1, 1,
0.06417703, -0.4612674, 3.83637, 1, 1, 1, 1, 1,
0.06891175, -1.090879, 3.782635, 1, 1, 1, 1, 1,
0.07428331, -0.3915975, 3.349802, 1, 1, 1, 1, 1,
0.07531492, 1.647488, 2.733832, 1, 1, 1, 1, 1,
0.07572589, -1.609233, 2.592788, 1, 1, 1, 1, 1,
0.07657488, 0.5983303, 1.187784, 1, 1, 1, 1, 1,
0.07895155, -0.0670354, 1.173473, 1, 1, 1, 1, 1,
0.08222461, 0.5152857, 0.3760657, 1, 1, 1, 1, 1,
0.08281096, -0.4554075, 3.363211, 1, 1, 1, 1, 1,
0.08482641, -0.3803467, 3.00757, 1, 1, 1, 1, 1,
0.09378095, -0.5575312, 4.041853, 1, 1, 1, 1, 1,
0.09488437, -0.9148721, 1.930275, 1, 1, 1, 1, 1,
0.09514775, -1.286401, 3.258164, 1, 1, 1, 1, 1,
0.09598408, 0.5302106, 0.03360408, 1, 1, 1, 1, 1,
0.1001636, 2.580415, -0.8599292, 1, 1, 1, 1, 1,
0.106363, 1.266443, -0.199711, 0, 0, 1, 1, 1,
0.1149019, -0.7022898, 4.288004, 1, 0, 0, 1, 1,
0.1173727, -1.822617, 3.455519, 1, 0, 0, 1, 1,
0.1176332, 0.1340939, 0.07940789, 1, 0, 0, 1, 1,
0.117897, -0.3612726, 3.184916, 1, 0, 0, 1, 1,
0.1184555, 1.06398, -1.975011, 1, 0, 0, 1, 1,
0.1207826, -0.4507122, 0.9655014, 0, 0, 0, 1, 1,
0.1208232, -1.730481, 6.776466, 0, 0, 0, 1, 1,
0.1231517, 0.5546556, -0.6937397, 0, 0, 0, 1, 1,
0.1248941, -2.912719, 2.198741, 0, 0, 0, 1, 1,
0.1274289, -2.730567, 3.587636, 0, 0, 0, 1, 1,
0.1287535, -0.8772601, 0.9464938, 0, 0, 0, 1, 1,
0.1328575, -2.658254, 3.906036, 0, 0, 0, 1, 1,
0.1340691, -0.264339, 2.921444, 1, 1, 1, 1, 1,
0.1348952, -0.5829045, 3.34371, 1, 1, 1, 1, 1,
0.1381669, -0.9340654, 3.303853, 1, 1, 1, 1, 1,
0.1404811, -1.54452, 2.457568, 1, 1, 1, 1, 1,
0.1445575, -0.4507308, 4.102726, 1, 1, 1, 1, 1,
0.1448211, -0.5693601, 2.272562, 1, 1, 1, 1, 1,
0.1458003, 1.397321, 1.66841, 1, 1, 1, 1, 1,
0.1473258, -1.087324, 1.933096, 1, 1, 1, 1, 1,
0.149916, -0.6367366, 4.742314, 1, 1, 1, 1, 1,
0.1503961, -0.6279661, 3.497327, 1, 1, 1, 1, 1,
0.1510823, 0.8318905, 1.463675, 1, 1, 1, 1, 1,
0.1519214, -0.1543116, 2.024527, 1, 1, 1, 1, 1,
0.1533265, -1.130526, 2.930614, 1, 1, 1, 1, 1,
0.1561467, -0.310795, 2.479377, 1, 1, 1, 1, 1,
0.1631855, 1.66912, -0.3535859, 1, 1, 1, 1, 1,
0.1693222, 0.7123103, -2.410403, 0, 0, 1, 1, 1,
0.169611, 0.4984703, -0.8730846, 1, 0, 0, 1, 1,
0.1702774, -0.3596858, 1.586186, 1, 0, 0, 1, 1,
0.1734468, 0.2749577, -0.1389688, 1, 0, 0, 1, 1,
0.1745008, -0.5417044, 3.455285, 1, 0, 0, 1, 1,
0.1762181, -1.295839, 2.961719, 1, 0, 0, 1, 1,
0.1785242, -0.7641808, 2.963179, 0, 0, 0, 1, 1,
0.178877, 1.71217, -1.468124, 0, 0, 0, 1, 1,
0.184488, 0.4491081, -0.8692279, 0, 0, 0, 1, 1,
0.1870182, -0.8967301, 1.499649, 0, 0, 0, 1, 1,
0.1873174, -0.1798198, 1.663483, 0, 0, 0, 1, 1,
0.1909391, 0.321534, -0.03325908, 0, 0, 0, 1, 1,
0.1948187, 1.933184, 1.158656, 0, 0, 0, 1, 1,
0.1961605, -0.1242883, 2.409148, 1, 1, 1, 1, 1,
0.1997248, -0.73629, 1.312012, 1, 1, 1, 1, 1,
0.2042225, 0.01858596, 0.9520333, 1, 1, 1, 1, 1,
0.2069073, -0.7902224, 2.725122, 1, 1, 1, 1, 1,
0.208122, -0.3111618, 2.419708, 1, 1, 1, 1, 1,
0.20816, -1.653789, 2.569508, 1, 1, 1, 1, 1,
0.210135, 0.2285538, 2.097305, 1, 1, 1, 1, 1,
0.2103516, -1.027532, 3.965773, 1, 1, 1, 1, 1,
0.2126492, -1.514587, 2.319074, 1, 1, 1, 1, 1,
0.2147983, -0.85179, 2.731059, 1, 1, 1, 1, 1,
0.2257088, 0.4504082, 1.978644, 1, 1, 1, 1, 1,
0.2261542, 0.271128, 0.9709124, 1, 1, 1, 1, 1,
0.2352298, -0.9084042, 1.734615, 1, 1, 1, 1, 1,
0.2356519, -2.013675, 3.289487, 1, 1, 1, 1, 1,
0.2427447, -0.02548347, 3.208547, 1, 1, 1, 1, 1,
0.2443804, -0.615019, 3.550064, 0, 0, 1, 1, 1,
0.2469646, -0.3503029, 2.011579, 1, 0, 0, 1, 1,
0.2487913, 0.2037251, 1.978955, 1, 0, 0, 1, 1,
0.2500321, -2.57657, 3.652705, 1, 0, 0, 1, 1,
0.2536785, -0.3693874, 3.937119, 1, 0, 0, 1, 1,
0.254627, -0.8277493, 3.069613, 1, 0, 0, 1, 1,
0.2567935, 0.01743886, -0.627691, 0, 0, 0, 1, 1,
0.2572474, 0.123553, 0.3508169, 0, 0, 0, 1, 1,
0.2625928, -2.673151, 2.848856, 0, 0, 0, 1, 1,
0.2677491, 2.439033, -0.3193589, 0, 0, 0, 1, 1,
0.2710819, 0.5567982, 1.899828, 0, 0, 0, 1, 1,
0.271498, -0.706306, 3.192776, 0, 0, 0, 1, 1,
0.2731643, 0.03799696, 0.2986577, 0, 0, 0, 1, 1,
0.2734236, -1.01391, 2.653977, 1, 1, 1, 1, 1,
0.2734956, 0.1555651, 1.224128, 1, 1, 1, 1, 1,
0.2795751, 0.9451488, -0.1218115, 1, 1, 1, 1, 1,
0.2809382, 0.5971512, 1.04306, 1, 1, 1, 1, 1,
0.2825045, -0.4932251, 2.520095, 1, 1, 1, 1, 1,
0.2834948, -0.4592983, 2.443536, 1, 1, 1, 1, 1,
0.28579, -0.9052423, 2.386525, 1, 1, 1, 1, 1,
0.2881979, -0.08728096, 1.37172, 1, 1, 1, 1, 1,
0.2884857, -0.3696017, 2.324383, 1, 1, 1, 1, 1,
0.2926342, -0.9916587, 2.904516, 1, 1, 1, 1, 1,
0.2960656, 0.2863682, -0.4233531, 1, 1, 1, 1, 1,
0.2984814, 0.9341593, 0.4371985, 1, 1, 1, 1, 1,
0.3005635, 0.7388777, 1.084096, 1, 1, 1, 1, 1,
0.3021075, -0.3929428, 2.256709, 1, 1, 1, 1, 1,
0.3044033, 1.402981, 1.238963, 1, 1, 1, 1, 1,
0.3097772, -0.1771325, 2.398396, 0, 0, 1, 1, 1,
0.3105259, -0.02889871, 2.263704, 1, 0, 0, 1, 1,
0.3127717, -0.6822324, 1.49153, 1, 0, 0, 1, 1,
0.3135422, 0.5970994, -0.4385473, 1, 0, 0, 1, 1,
0.3170391, -0.4905903, 2.595984, 1, 0, 0, 1, 1,
0.3183726, 0.7386116, -1.281402, 1, 0, 0, 1, 1,
0.3190656, 0.1504695, 0.6891808, 0, 0, 0, 1, 1,
0.3232246, 0.2734954, 0.3837039, 0, 0, 0, 1, 1,
0.3236403, -0.2407432, 3.131662, 0, 0, 0, 1, 1,
0.3259462, -0.8799631, 0.9381894, 0, 0, 0, 1, 1,
0.3290355, -0.1848293, 1.085823, 0, 0, 0, 1, 1,
0.3296445, -0.7667025, 2.578392, 0, 0, 0, 1, 1,
0.3300145, 2.813965, -0.4550144, 0, 0, 0, 1, 1,
0.3323785, -1.286066, 0.7268136, 1, 1, 1, 1, 1,
0.3385384, -2.336449, 4.292128, 1, 1, 1, 1, 1,
0.3385901, 1.556152, -0.3075218, 1, 1, 1, 1, 1,
0.3405496, 1.745703, 0.01804678, 1, 1, 1, 1, 1,
0.3469936, 0.5766138, 1.277889, 1, 1, 1, 1, 1,
0.3496744, -0.9035576, 3.053656, 1, 1, 1, 1, 1,
0.3506496, 0.5979975, 1.617854, 1, 1, 1, 1, 1,
0.3509493, -0.06339005, -0.1601277, 1, 1, 1, 1, 1,
0.3542338, -1.706268, 3.717388, 1, 1, 1, 1, 1,
0.3563105, 0.1370652, 3.586881, 1, 1, 1, 1, 1,
0.3573753, -0.04907191, 0.4063733, 1, 1, 1, 1, 1,
0.3576575, -0.5345695, 2.539075, 1, 1, 1, 1, 1,
0.3576788, -0.05516632, 2.314934, 1, 1, 1, 1, 1,
0.3582954, 0.8420557, -1.289047, 1, 1, 1, 1, 1,
0.3584198, -2.326109, 3.610755, 1, 1, 1, 1, 1,
0.3600781, -0.3008703, 2.332483, 0, 0, 1, 1, 1,
0.3641952, -1.114291, 2.375395, 1, 0, 0, 1, 1,
0.3644781, -1.63616, 3.551462, 1, 0, 0, 1, 1,
0.370194, -0.1809364, 1.587548, 1, 0, 0, 1, 1,
0.3734438, 0.6418288, 2.065873, 1, 0, 0, 1, 1,
0.3806304, 0.598516, 0.3761607, 1, 0, 0, 1, 1,
0.3823024, -1.169502, 2.135451, 0, 0, 0, 1, 1,
0.3871267, -0.2966148, 3.359894, 0, 0, 0, 1, 1,
0.3904764, 0.6696814, 0.03297871, 0, 0, 0, 1, 1,
0.3933745, 0.3651341, 1.877124, 0, 0, 0, 1, 1,
0.3940467, -0.9365144, 1.590004, 0, 0, 0, 1, 1,
0.3942169, 0.5140077, 0.01155627, 0, 0, 0, 1, 1,
0.3946357, 0.7186352, 0.107032, 0, 0, 0, 1, 1,
0.3948704, 0.7694015, 0.5585953, 1, 1, 1, 1, 1,
0.3975982, 0.3493555, -0.3463533, 1, 1, 1, 1, 1,
0.3989357, 0.6199337, -0.4890098, 1, 1, 1, 1, 1,
0.4013716, 1.377529, 0.07706058, 1, 1, 1, 1, 1,
0.4031307, -0.2563053, 3.983874, 1, 1, 1, 1, 1,
0.4065524, -0.5695109, 1.380327, 1, 1, 1, 1, 1,
0.4070267, -0.4879129, 2.12521, 1, 1, 1, 1, 1,
0.4164684, -1.599935, 3.413381, 1, 1, 1, 1, 1,
0.4169882, 0.2601025, 1.3353, 1, 1, 1, 1, 1,
0.4249669, -0.7711142, 3.142059, 1, 1, 1, 1, 1,
0.430992, -0.4666123, 3.41547, 1, 1, 1, 1, 1,
0.4332963, -0.8168889, 2.14149, 1, 1, 1, 1, 1,
0.4390503, -0.5278159, 3.028392, 1, 1, 1, 1, 1,
0.4409474, -0.03376521, 2.752175, 1, 1, 1, 1, 1,
0.4479381, 1.368557, 2.274974, 1, 1, 1, 1, 1,
0.463044, -0.4406235, 2.88308, 0, 0, 1, 1, 1,
0.4690927, -0.2013558, 1.378596, 1, 0, 0, 1, 1,
0.4748209, 1.53847, -0.9899943, 1, 0, 0, 1, 1,
0.4757782, -1.689673, 2.528406, 1, 0, 0, 1, 1,
0.476239, 0.1343167, 1.027172, 1, 0, 0, 1, 1,
0.4781951, -0.8663589, 3.684643, 1, 0, 0, 1, 1,
0.4789201, -1.436357, 5.090989, 0, 0, 0, 1, 1,
0.4818593, -0.9469541, 2.907691, 0, 0, 0, 1, 1,
0.4889637, -0.1159138, 0.8483169, 0, 0, 0, 1, 1,
0.4894472, 0.01633444, 2.426363, 0, 0, 0, 1, 1,
0.4904236, -0.481115, 2.79724, 0, 0, 0, 1, 1,
0.491365, 1.409085, 0.719297, 0, 0, 0, 1, 1,
0.4949498, -0.2376904, 1.375482, 0, 0, 0, 1, 1,
0.5044917, 1.795162, -0.3376051, 1, 1, 1, 1, 1,
0.50486, 0.3090365, 0.9929038, 1, 1, 1, 1, 1,
0.5088718, 0.8148416, 0.2023074, 1, 1, 1, 1, 1,
0.5091343, -0.6596814, 2.806606, 1, 1, 1, 1, 1,
0.5121669, 0.3014818, 1.175547, 1, 1, 1, 1, 1,
0.5148203, 0.2089642, 0.3631747, 1, 1, 1, 1, 1,
0.5185441, 0.3302453, 1.59312, 1, 1, 1, 1, 1,
0.5193265, 1.957921, 0.5229352, 1, 1, 1, 1, 1,
0.525688, -0.9628121, 2.351962, 1, 1, 1, 1, 1,
0.5304241, -0.2949239, 1.203104, 1, 1, 1, 1, 1,
0.5322558, 0.5793236, 0.4380491, 1, 1, 1, 1, 1,
0.5329892, 1.528161, 0.3875483, 1, 1, 1, 1, 1,
0.5340127, -0.3983678, 1.97457, 1, 1, 1, 1, 1,
0.5458159, -1.081862, 2.490427, 1, 1, 1, 1, 1,
0.5467499, 1.385381, 1.865142, 1, 1, 1, 1, 1,
0.5473086, 0.3564135, 1.805803, 0, 0, 1, 1, 1,
0.5481071, 0.9938808, 0.6611367, 1, 0, 0, 1, 1,
0.5516192, -0.02122812, 1.001215, 1, 0, 0, 1, 1,
0.5524722, -0.371157, 3.958865, 1, 0, 0, 1, 1,
0.564884, -0.8257146, 1.601384, 1, 0, 0, 1, 1,
0.5658444, 0.9127704, -0.2634217, 1, 0, 0, 1, 1,
0.5664451, 2.633702, -0.2390552, 0, 0, 0, 1, 1,
0.5671129, -1.648066, 1.921945, 0, 0, 0, 1, 1,
0.5681456, -0.3953659, 1.968861, 0, 0, 0, 1, 1,
0.570217, 0.4442668, 0.07975659, 0, 0, 0, 1, 1,
0.5722461, -0.05385993, 0.6234508, 0, 0, 0, 1, 1,
0.5724806, 0.02240834, 2.756377, 0, 0, 0, 1, 1,
0.5745276, -1.613391, 3.100897, 0, 0, 0, 1, 1,
0.5755747, 0.07761804, 0.2865743, 1, 1, 1, 1, 1,
0.5765817, -0.6119424, 3.922221, 1, 1, 1, 1, 1,
0.5806816, -3.238475, 2.342995, 1, 1, 1, 1, 1,
0.586529, -0.6962825, 1.415371, 1, 1, 1, 1, 1,
0.5882556, -1.315825, 0.4682999, 1, 1, 1, 1, 1,
0.5904279, 1.065866, 0.9969606, 1, 1, 1, 1, 1,
0.5965391, -1.516851, 2.137631, 1, 1, 1, 1, 1,
0.6032163, -0.5572752, 1.015207, 1, 1, 1, 1, 1,
0.6073012, 0.9516118, 0.3728099, 1, 1, 1, 1, 1,
0.6100605, -2.20673, 3.434505, 1, 1, 1, 1, 1,
0.6122922, 2.23191, 0.8696913, 1, 1, 1, 1, 1,
0.6126026, 1.769348, -0.00937558, 1, 1, 1, 1, 1,
0.614, -1.25228, 3.213531, 1, 1, 1, 1, 1,
0.6153951, -1.595385, 2.628308, 1, 1, 1, 1, 1,
0.6174902, -1.206618, 4.132928, 1, 1, 1, 1, 1,
0.6212594, 0.5081708, 1.459242, 0, 0, 1, 1, 1,
0.6214737, -1.323079, 4.939883, 1, 0, 0, 1, 1,
0.6216807, 0.727772, 0.6746117, 1, 0, 0, 1, 1,
0.6224393, -0.1030339, 0.7462751, 1, 0, 0, 1, 1,
0.6280909, 0.7245673, 0.1236372, 1, 0, 0, 1, 1,
0.6307788, 0.4406396, 1.001477, 1, 0, 0, 1, 1,
0.6405486, 0.9266553, 0.747094, 0, 0, 0, 1, 1,
0.6426076, -0.3158302, 3.002499, 0, 0, 0, 1, 1,
0.6432065, 0.06458257, 0.8624404, 0, 0, 0, 1, 1,
0.64517, 1.296785, -0.553765, 0, 0, 0, 1, 1,
0.6455622, -0.9250378, 1.14519, 0, 0, 0, 1, 1,
0.6525371, -0.4249574, 1.013365, 0, 0, 0, 1, 1,
0.6532307, -1.257478, 3.973977, 0, 0, 0, 1, 1,
0.6560388, -0.7317986, 2.649427, 1, 1, 1, 1, 1,
0.6666614, -0.2838204, 1.105054, 1, 1, 1, 1, 1,
0.6721892, -0.1781048, 1.662243, 1, 1, 1, 1, 1,
0.6730195, -0.9277295, 0.975707, 1, 1, 1, 1, 1,
0.6750702, -1.143206, 1.865984, 1, 1, 1, 1, 1,
0.6750906, 1.211347, 0.1048706, 1, 1, 1, 1, 1,
0.6752332, 0.1748169, 0.795288, 1, 1, 1, 1, 1,
0.6765691, 2.106483, 0.7188557, 1, 1, 1, 1, 1,
0.6768495, 0.03338866, 1.837659, 1, 1, 1, 1, 1,
0.6770705, 0.9866819, 0.3921782, 1, 1, 1, 1, 1,
0.6773915, 0.9838302, 0.9935083, 1, 1, 1, 1, 1,
0.6840141, 0.6947523, 4.174155, 1, 1, 1, 1, 1,
0.6851232, 0.2232996, 0.8973854, 1, 1, 1, 1, 1,
0.6867093, 1.437871, -0.04231317, 1, 1, 1, 1, 1,
0.6872843, -1.039891, 2.751096, 1, 1, 1, 1, 1,
0.6877366, 0.08454206, 0.02364238, 0, 0, 1, 1, 1,
0.6883413, 1.874115, 1.230741, 1, 0, 0, 1, 1,
0.68947, -0.3459418, 0.2903106, 1, 0, 0, 1, 1,
0.6902277, 0.08279537, 0.9033641, 1, 0, 0, 1, 1,
0.6927071, 0.07973492, 2.556184, 1, 0, 0, 1, 1,
0.6927731, -1.403035, 2.565396, 1, 0, 0, 1, 1,
0.6959329, -0.6453237, 2.281327, 0, 0, 0, 1, 1,
0.7012734, 2.293898, 0.1678268, 0, 0, 0, 1, 1,
0.7051771, 0.02385986, 0.6155666, 0, 0, 0, 1, 1,
0.7062147, 0.2190489, 0.5609133, 0, 0, 0, 1, 1,
0.7071767, 2.353139, 0.3649056, 0, 0, 0, 1, 1,
0.7167607, -0.8169453, 2.789709, 0, 0, 0, 1, 1,
0.7168913, 0.3177577, 3.063245, 0, 0, 0, 1, 1,
0.7179651, -0.9191018, 1.118637, 1, 1, 1, 1, 1,
0.7210997, -1.681137, 2.74335, 1, 1, 1, 1, 1,
0.7220393, 2.055613, 2.340605, 1, 1, 1, 1, 1,
0.7307923, -0.1040872, 1.882692, 1, 1, 1, 1, 1,
0.7352223, 0.6498265, 0.6285693, 1, 1, 1, 1, 1,
0.7389184, 0.1321368, 1.635747, 1, 1, 1, 1, 1,
0.7417087, 0.6008674, 0.234419, 1, 1, 1, 1, 1,
0.7446951, 0.3814266, 0.5906487, 1, 1, 1, 1, 1,
0.745625, 0.1649363, -1.124299, 1, 1, 1, 1, 1,
0.750704, 0.807876, 1.053564, 1, 1, 1, 1, 1,
0.7513625, 0.5987236, 2.123167, 1, 1, 1, 1, 1,
0.7557701, -0.182188, 2.834117, 1, 1, 1, 1, 1,
0.7568378, 0.01277454, 1.805654, 1, 1, 1, 1, 1,
0.7593532, -0.1039234, 2.386202, 1, 1, 1, 1, 1,
0.7641971, -0.5888098, 2.832662, 1, 1, 1, 1, 1,
0.7670183, -1.09875, 1.354514, 0, 0, 1, 1, 1,
0.7679283, 1.455305, -0.5714699, 1, 0, 0, 1, 1,
0.7705484, 0.7406399, 0.2792829, 1, 0, 0, 1, 1,
0.771755, -0.5264585, 1.183512, 1, 0, 0, 1, 1,
0.775329, 0.7124157, 0.07429994, 1, 0, 0, 1, 1,
0.776987, -0.3915561, 2.497301, 1, 0, 0, 1, 1,
0.7823243, 0.3289041, 0.1446948, 0, 0, 0, 1, 1,
0.7867789, 0.3477271, 2.810307, 0, 0, 0, 1, 1,
0.787128, 1.255055, -1.398549, 0, 0, 0, 1, 1,
0.7897984, 1.032053, 0.2425689, 0, 0, 0, 1, 1,
0.792545, -1.139657, 1.63285, 0, 0, 0, 1, 1,
0.7951296, -1.23654, 1.401447, 0, 0, 0, 1, 1,
0.7957888, 0.359597, 2.633295, 0, 0, 0, 1, 1,
0.796533, 0.35352, -0.8477954, 1, 1, 1, 1, 1,
0.7974604, -0.1999968, 3.064027, 1, 1, 1, 1, 1,
0.8001429, -1.263179, 3.634705, 1, 1, 1, 1, 1,
0.8053486, -0.5540361, 0.485007, 1, 1, 1, 1, 1,
0.8068754, -0.7467231, 2.013777, 1, 1, 1, 1, 1,
0.8126147, -0.432564, 3.841036, 1, 1, 1, 1, 1,
0.8176591, 0.8348714, 1.203296, 1, 1, 1, 1, 1,
0.8203132, 0.6916012, 1.269984, 1, 1, 1, 1, 1,
0.8277752, -1.165719, 2.776817, 1, 1, 1, 1, 1,
0.8284242, -0.04041497, 2.414566, 1, 1, 1, 1, 1,
0.8294148, 1.008969, 0.2267736, 1, 1, 1, 1, 1,
0.8314733, 0.3252749, 3.078811, 1, 1, 1, 1, 1,
0.8315438, 0.4580025, 0.3506252, 1, 1, 1, 1, 1,
0.842448, 1.131654, 1.036556, 1, 1, 1, 1, 1,
0.8425516, -0.3724518, 1.359405, 1, 1, 1, 1, 1,
0.8447025, 0.2047622, 0.1786888, 0, 0, 1, 1, 1,
0.8456848, 0.3303103, 2.393337, 1, 0, 0, 1, 1,
0.8479091, -0.1034545, 2.98814, 1, 0, 0, 1, 1,
0.8494182, -0.9751036, 2.340905, 1, 0, 0, 1, 1,
0.8532816, -1.074546, 3.398976, 1, 0, 0, 1, 1,
0.8610411, 0.8045876, 0.6869138, 1, 0, 0, 1, 1,
0.862209, 0.4696903, 0.612934, 0, 0, 0, 1, 1,
0.8631737, -0.2067032, 1.92884, 0, 0, 0, 1, 1,
0.8657816, -0.7550437, 4.742646, 0, 0, 0, 1, 1,
0.8687327, 0.181747, -0.3430763, 0, 0, 0, 1, 1,
0.8704579, 1.139826, 0.8721322, 0, 0, 0, 1, 1,
0.8712188, -0.5411869, 2.824192, 0, 0, 0, 1, 1,
0.8724434, 0.9074884, 1.218573, 0, 0, 0, 1, 1,
0.8742341, -2.362994, 3.596695, 1, 1, 1, 1, 1,
0.8863805, -0.4901779, 3.794992, 1, 1, 1, 1, 1,
0.8890585, 0.6153999, 1.875681, 1, 1, 1, 1, 1,
0.8940513, 0.120608, 1.176198, 1, 1, 1, 1, 1,
0.8947829, 1.065718, 1.101413, 1, 1, 1, 1, 1,
0.8974733, -0.2970988, 1.010089, 1, 1, 1, 1, 1,
0.9001923, 0.4087268, 1.229323, 1, 1, 1, 1, 1,
0.9066461, -0.08828616, 0.4916945, 1, 1, 1, 1, 1,
0.9075689, 1.723042, 0.8694837, 1, 1, 1, 1, 1,
0.9151516, 0.5852514, 1.29305, 1, 1, 1, 1, 1,
0.9186665, -0.263924, 1.867558, 1, 1, 1, 1, 1,
0.9206516, 0.7527621, 1.743443, 1, 1, 1, 1, 1,
0.9228276, 0.7964773, 0.6641312, 1, 1, 1, 1, 1,
0.9246315, -0.2263675, 1.413589, 1, 1, 1, 1, 1,
0.9274248, 1.475571, 0.9688168, 1, 1, 1, 1, 1,
0.9280382, 2.105959, 0.3600861, 0, 0, 1, 1, 1,
0.9320367, 0.4487999, 1.107062, 1, 0, 0, 1, 1,
0.9469463, 0.08996288, -0.1533849, 1, 0, 0, 1, 1,
0.9527394, 0.5342205, 2.697701, 1, 0, 0, 1, 1,
0.9532625, 0.2683298, 2.736807, 1, 0, 0, 1, 1,
0.9552201, 0.7147942, 1.311682, 1, 0, 0, 1, 1,
0.9568768, -0.6697512, 1.806133, 0, 0, 0, 1, 1,
0.9611331, -0.552866, 1.169538, 0, 0, 0, 1, 1,
0.9733308, 1.840679, 0.720879, 0, 0, 0, 1, 1,
0.9734727, 1.788802, 0.2667588, 0, 0, 0, 1, 1,
0.9829589, -0.3025344, 1.922681, 0, 0, 0, 1, 1,
0.9885203, -1.062534, 1.404036, 0, 0, 0, 1, 1,
0.9937035, -1.682641, 2.919586, 0, 0, 0, 1, 1,
0.9964521, -0.978893, 2.56675, 1, 1, 1, 1, 1,
1.000699, -0.8366954, 2.855245, 1, 1, 1, 1, 1,
1.015869, -0.1728522, 1.390778, 1, 1, 1, 1, 1,
1.015897, -0.4649219, 1.466011, 1, 1, 1, 1, 1,
1.016111, -0.1061978, 1.821282, 1, 1, 1, 1, 1,
1.021976, 0.9760791, 1.353945, 1, 1, 1, 1, 1,
1.024935, 0.3970503, 0.8717498, 1, 1, 1, 1, 1,
1.025839, 0.08554072, 1.834646, 1, 1, 1, 1, 1,
1.028034, 0.1216734, 1.749082, 1, 1, 1, 1, 1,
1.03299, -1.018473, 2.671967, 1, 1, 1, 1, 1,
1.034567, 1.324649, -0.3955499, 1, 1, 1, 1, 1,
1.039362, 2.828328, -2.142803, 1, 1, 1, 1, 1,
1.045002, 1.262171, 0.7920529, 1, 1, 1, 1, 1,
1.048118, 0.8265916, 0.9515386, 1, 1, 1, 1, 1,
1.049607, -0.1076974, 0.762057, 1, 1, 1, 1, 1,
1.051816, -0.2629937, 2.974759, 0, 0, 1, 1, 1,
1.051884, -0.4059997, 1.133872, 1, 0, 0, 1, 1,
1.058412, -0.08673677, 0.3365908, 1, 0, 0, 1, 1,
1.066091, -1.728198, 2.933465, 1, 0, 0, 1, 1,
1.069792, -0.7696602, 3.027084, 1, 0, 0, 1, 1,
1.071715, -0.3222176, 2.843116, 1, 0, 0, 1, 1,
1.073357, 1.727205, -0.2316337, 0, 0, 0, 1, 1,
1.077183, 0.03696582, 2.641949, 0, 0, 0, 1, 1,
1.08178, -1.584777, 2.344262, 0, 0, 0, 1, 1,
1.082492, -1.467104, 2.942171, 0, 0, 0, 1, 1,
1.082888, -1.353832, 3.037279, 0, 0, 0, 1, 1,
1.092451, 0.9259785, 0.1851148, 0, 0, 0, 1, 1,
1.101155, 0.05808793, 3.691702, 0, 0, 0, 1, 1,
1.10881, -0.3123578, 1.997468, 1, 1, 1, 1, 1,
1.112588, -0.6632345, 3.621352, 1, 1, 1, 1, 1,
1.124877, -2.4669, 1.692327, 1, 1, 1, 1, 1,
1.125289, -0.8168825, 1.412792, 1, 1, 1, 1, 1,
1.133283, -2.099109, 3.532645, 1, 1, 1, 1, 1,
1.135982, 3.015698, 0.639191, 1, 1, 1, 1, 1,
1.137326, 0.9792045, 0.3313087, 1, 1, 1, 1, 1,
1.137685, -0.5508795, 1.919826, 1, 1, 1, 1, 1,
1.13809, -0.1836101, 3.348338, 1, 1, 1, 1, 1,
1.14283, -1.543806, 0.9497683, 1, 1, 1, 1, 1,
1.144826, -2.353896, 2.770444, 1, 1, 1, 1, 1,
1.16202, -0.8973289, 2.335647, 1, 1, 1, 1, 1,
1.187884, -1.009929, 1.699449, 1, 1, 1, 1, 1,
1.189269, -0.5210915, 1.3631, 1, 1, 1, 1, 1,
1.190604, 1.933379, 1.470159, 1, 1, 1, 1, 1,
1.197951, -0.5256376, 0.7847373, 0, 0, 1, 1, 1,
1.222909, -1.304885, 2.457911, 1, 0, 0, 1, 1,
1.227952, -0.996126, 1.952551, 1, 0, 0, 1, 1,
1.231889, 0.9012382, 0.7936482, 1, 0, 0, 1, 1,
1.234764, -0.006988297, 1.098548, 1, 0, 0, 1, 1,
1.234814, -0.3703221, 1.275871, 1, 0, 0, 1, 1,
1.240552, 0.2109492, 1.728422, 0, 0, 0, 1, 1,
1.242588, -0.3421062, 1.800945, 0, 0, 0, 1, 1,
1.24352, -0.7494292, 2.921455, 0, 0, 0, 1, 1,
1.24648, 0.634609, 1.457543, 0, 0, 0, 1, 1,
1.259014, 0.2764815, 1.421938, 0, 0, 0, 1, 1,
1.267338, 0.9392943, 1.079618, 0, 0, 0, 1, 1,
1.274226, -0.9054841, 3.826397, 0, 0, 0, 1, 1,
1.28479, 0.07525923, 1.893441, 1, 1, 1, 1, 1,
1.291857, 0.8290388, 1.176905, 1, 1, 1, 1, 1,
1.292497, 0.2693598, 1.937997, 1, 1, 1, 1, 1,
1.29403, 0.830712, 2.385489, 1, 1, 1, 1, 1,
1.301285, -0.07083776, 0.5894046, 1, 1, 1, 1, 1,
1.305555, 2.036705, 1.489233, 1, 1, 1, 1, 1,
1.310235, 0.906258, -0.5032209, 1, 1, 1, 1, 1,
1.315076, 0.002687258, 1.92327, 1, 1, 1, 1, 1,
1.317001, 1.017203, 1.314577, 1, 1, 1, 1, 1,
1.324892, 1.958251, 2.583837, 1, 1, 1, 1, 1,
1.326693, -0.8183749, 1.808536, 1, 1, 1, 1, 1,
1.346988, -1.41655, 1.839815, 1, 1, 1, 1, 1,
1.347752, -0.8127223, 2.05643, 1, 1, 1, 1, 1,
1.358226, 0.1960018, 1.843773, 1, 1, 1, 1, 1,
1.363204, 0.7011834, -0.02218372, 1, 1, 1, 1, 1,
1.365232, -1.700905, 3.596828, 0, 0, 1, 1, 1,
1.36594, 0.9003786, 1.280744, 1, 0, 0, 1, 1,
1.374441, 0.9857469, 2.354852, 1, 0, 0, 1, 1,
1.380345, -1.232723, 1.300353, 1, 0, 0, 1, 1,
1.386249, -1.700172, 2.280747, 1, 0, 0, 1, 1,
1.391275, 0.8541002, -0.5654029, 1, 0, 0, 1, 1,
1.397671, 1.37042, 1.148577, 0, 0, 0, 1, 1,
1.400342, -0.4632362, 1.140335, 0, 0, 0, 1, 1,
1.418134, 1.497999, 0.3946038, 0, 0, 0, 1, 1,
1.420996, -0.1149264, 2.108037, 0, 0, 0, 1, 1,
1.444618, -0.2435903, 2.169441, 0, 0, 0, 1, 1,
1.452238, -0.06926955, 1.592332, 0, 0, 0, 1, 1,
1.459201, -1.494529, 3.465465, 0, 0, 0, 1, 1,
1.473207, -0.5757156, 1.689956, 1, 1, 1, 1, 1,
1.483813, -1.278173, 1.386322, 1, 1, 1, 1, 1,
1.484828, -0.3227181, 2.852461, 1, 1, 1, 1, 1,
1.484845, 2.265496, 0.3159494, 1, 1, 1, 1, 1,
1.515818, -0.86268, 1.48129, 1, 1, 1, 1, 1,
1.524012, -0.1667874, 0.7440348, 1, 1, 1, 1, 1,
1.545638, 0.3948943, 0.6990996, 1, 1, 1, 1, 1,
1.546148, -0.912909, 1.452062, 1, 1, 1, 1, 1,
1.549378, -0.05006844, 0.04329354, 1, 1, 1, 1, 1,
1.55172, 0.8592737, 0.4457494, 1, 1, 1, 1, 1,
1.555952, 0.8981501, 1.231603, 1, 1, 1, 1, 1,
1.57597, -0.3001213, 2.788059, 1, 1, 1, 1, 1,
1.593242, -0.08416413, 1.629165, 1, 1, 1, 1, 1,
1.593995, -0.1077818, 1.084246, 1, 1, 1, 1, 1,
1.603966, -0.2201024, 0.8776766, 1, 1, 1, 1, 1,
1.621328, 0.8975042, 0.7676674, 0, 0, 1, 1, 1,
1.631018, 0.2189416, 0.5375081, 1, 0, 0, 1, 1,
1.631708, -0.5695615, 1.911789, 1, 0, 0, 1, 1,
1.647404, -0.6804731, 1.376526, 1, 0, 0, 1, 1,
1.653037, 0.418205, 0.1336944, 1, 0, 0, 1, 1,
1.653356, 0.274089, 0.8786666, 1, 0, 0, 1, 1,
1.660312, 0.1429196, 0.9858731, 0, 0, 0, 1, 1,
1.692147, -1.341721, 0.4010121, 0, 0, 0, 1, 1,
1.699408, 0.7260904, 2.900756, 0, 0, 0, 1, 1,
1.70025, 0.8810353, 0.6078655, 0, 0, 0, 1, 1,
1.703946, -1.051949, 1.619633, 0, 0, 0, 1, 1,
1.722647, -1.747217, 2.402179, 0, 0, 0, 1, 1,
1.746159, -0.02011193, 1.922121, 0, 0, 0, 1, 1,
1.766302, 1.377061, 0.4696941, 1, 1, 1, 1, 1,
1.779475, 1.926571, -0.126408, 1, 1, 1, 1, 1,
1.790002, 1.470663, 0.3313701, 1, 1, 1, 1, 1,
1.795278, -0.7605464, 1.14563, 1, 1, 1, 1, 1,
1.858399, 0.3288735, 1.284808, 1, 1, 1, 1, 1,
1.87269, 1.233953, -0.02075923, 1, 1, 1, 1, 1,
1.881903, -0.1024816, 1.380348, 1, 1, 1, 1, 1,
1.927404, -0.9644587, -0.3233524, 1, 1, 1, 1, 1,
1.93885, 1.725424, -1.566955, 1, 1, 1, 1, 1,
1.957544, 1.419877, 1.87803, 1, 1, 1, 1, 1,
2.034459, -0.5909899, 2.161819, 1, 1, 1, 1, 1,
2.037124, 0.5167344, 1.032908, 1, 1, 1, 1, 1,
2.079863, -0.4831968, 3.963771, 1, 1, 1, 1, 1,
2.090794, 0.09869265, 0.09291542, 1, 1, 1, 1, 1,
2.114742, 0.583802, 1.320063, 1, 1, 1, 1, 1,
2.11566, 0.5838212, 1.717657, 0, 0, 1, 1, 1,
2.118323, 1.83314, 2.480979, 1, 0, 0, 1, 1,
2.12328, -0.3023229, 1.749553, 1, 0, 0, 1, 1,
2.132988, -0.7081542, 0.875074, 1, 0, 0, 1, 1,
2.16763, -1.976327, 4.057487, 1, 0, 0, 1, 1,
2.205638, -1.112892, 3.015221, 1, 0, 0, 1, 1,
2.207037, -1.874429, 1.132364, 0, 0, 0, 1, 1,
2.235266, -0.4024915, 1.910602, 0, 0, 0, 1, 1,
2.311612, 0.4800055, 0.6265873, 0, 0, 0, 1, 1,
2.337728, -0.4311665, 1.057028, 0, 0, 0, 1, 1,
2.367062, -0.284297, 2.080571, 0, 0, 0, 1, 1,
2.402789, -0.7130737, 0.5551988, 0, 0, 0, 1, 1,
2.430167, -0.4663696, 0.2831744, 0, 0, 0, 1, 1,
2.565797, 0.1573354, 1.058066, 1, 1, 1, 1, 1,
2.572842, -0.1851289, 2.536568, 1, 1, 1, 1, 1,
2.617881, -0.2886184, 3.277681, 1, 1, 1, 1, 1,
2.694577, -0.09922452, 4.474914, 1, 1, 1, 1, 1,
2.789628, -0.4863247, -0.5373099, 1, 1, 1, 1, 1,
2.817956, 0.3338217, 2.580148, 1, 1, 1, 1, 1,
2.919851, -0.9311575, 1.829824, 1, 1, 1, 1, 1
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
var radius = 10.28556;
var distance = 36.12759;
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
mvMatrix.translate( 0.08836043, 0.1113884, -0.4053471 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.12759);
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
