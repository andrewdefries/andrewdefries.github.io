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
-2.823901, -0.609124, -1.902425, 1, 0, 0, 1,
-2.79571, -0.540072, -1.979531, 1, 0.007843138, 0, 1,
-2.693564, -0.2688062, -0.9141745, 1, 0.01176471, 0, 1,
-2.555245, -0.07871392, -1.735005, 1, 0.01960784, 0, 1,
-2.554577, 0.6228659, -2.310234, 1, 0.02352941, 0, 1,
-2.470515, 0.7602671, -1.373032, 1, 0.03137255, 0, 1,
-2.338511, 0.1775831, -2.091091, 1, 0.03529412, 0, 1,
-2.336365, -1.381661, -1.872256, 1, 0.04313726, 0, 1,
-2.295132, 1.445472, -1.068325, 1, 0.04705882, 0, 1,
-2.293157, 0.4657799, -2.834711, 1, 0.05490196, 0, 1,
-2.26834, -0.9572642, -1.426749, 1, 0.05882353, 0, 1,
-2.241812, 0.9604855, -1.90778, 1, 0.06666667, 0, 1,
-2.216216, 0.2204835, -3.414321, 1, 0.07058824, 0, 1,
-2.215491, -2.817181, -1.913939, 1, 0.07843138, 0, 1,
-2.130226, -2.218953, -2.649362, 1, 0.08235294, 0, 1,
-2.066712, -1.125301, 0.5817327, 1, 0.09019608, 0, 1,
-2.064002, 0.2086254, -0.8544198, 1, 0.09411765, 0, 1,
-2.056474, -0.1133051, -1.324656, 1, 0.1019608, 0, 1,
-2.045239, 0.2069238, -2.404086, 1, 0.1098039, 0, 1,
-2.036869, 0.2957165, -2.181126, 1, 0.1137255, 0, 1,
-2.016978, -2.620226, -1.980684, 1, 0.1215686, 0, 1,
-1.996126, -1.035228, -1.849669, 1, 0.1254902, 0, 1,
-1.991545, 0.2692959, -0.1760909, 1, 0.1333333, 0, 1,
-1.984641, -1.851911, -1.153154, 1, 0.1372549, 0, 1,
-1.974808, 0.2298247, -1.426045, 1, 0.145098, 0, 1,
-1.974272, -1.577693, -2.822115, 1, 0.1490196, 0, 1,
-1.973401, -0.8773053, 0.2194864, 1, 0.1568628, 0, 1,
-1.927327, -0.3838134, -2.095967, 1, 0.1607843, 0, 1,
-1.925497, 0.7845365, 0.5766234, 1, 0.1686275, 0, 1,
-1.916681, 0.7191289, 0.2934196, 1, 0.172549, 0, 1,
-1.911199, -0.461706, -1.007738, 1, 0.1803922, 0, 1,
-1.895954, 0.8817357, -1.381103, 1, 0.1843137, 0, 1,
-1.890007, 0.6412488, -1.731916, 1, 0.1921569, 0, 1,
-1.8716, 0.4088113, -1.077054, 1, 0.1960784, 0, 1,
-1.841319, 0.6013036, -1.087038, 1, 0.2039216, 0, 1,
-1.834488, -0.533426, -3.873947, 1, 0.2117647, 0, 1,
-1.820021, -0.8711517, -2.186615, 1, 0.2156863, 0, 1,
-1.817932, 1.007375, -1.098318, 1, 0.2235294, 0, 1,
-1.797686, 1.109778, -3.098948, 1, 0.227451, 0, 1,
-1.786635, -0.0270062, -1.826508, 1, 0.2352941, 0, 1,
-1.7866, 1.050875, -1.99716, 1, 0.2392157, 0, 1,
-1.782407, -0.6301076, -3.068995, 1, 0.2470588, 0, 1,
-1.742198, 0.5237606, -1.83441, 1, 0.2509804, 0, 1,
-1.724685, 0.4517398, 0.0415624, 1, 0.2588235, 0, 1,
-1.678293, -0.4817009, -1.136791, 1, 0.2627451, 0, 1,
-1.64775, 0.06189225, -1.28999, 1, 0.2705882, 0, 1,
-1.642529, -0.1219598, -1.811257, 1, 0.2745098, 0, 1,
-1.640294, -0.1565953, -1.495157, 1, 0.282353, 0, 1,
-1.628576, 2.264146, -2.716176, 1, 0.2862745, 0, 1,
-1.593153, 1.095588, -1.633755, 1, 0.2941177, 0, 1,
-1.566065, -0.4862621, -0.5513002, 1, 0.3019608, 0, 1,
-1.56487, -1.235807, -2.556401, 1, 0.3058824, 0, 1,
-1.55807, 1.328356, -1.135877, 1, 0.3137255, 0, 1,
-1.548412, 1.479647, -0.6252792, 1, 0.3176471, 0, 1,
-1.53669, -1.041494, -0.5405777, 1, 0.3254902, 0, 1,
-1.533994, -0.802933, -2.110199, 1, 0.3294118, 0, 1,
-1.519944, -1.03501, -3.190268, 1, 0.3372549, 0, 1,
-1.519558, 1.449211, -0.9336022, 1, 0.3411765, 0, 1,
-1.505814, -1.856101, -3.456036, 1, 0.3490196, 0, 1,
-1.502969, -0.645158, -3.420321, 1, 0.3529412, 0, 1,
-1.48979, 0.7218596, -0.6487021, 1, 0.3607843, 0, 1,
-1.483797, 0.06206768, -2.029305, 1, 0.3647059, 0, 1,
-1.475102, 0.5821213, -0.3755535, 1, 0.372549, 0, 1,
-1.474586, -1.109334, -1.662779, 1, 0.3764706, 0, 1,
-1.472233, -0.6351659, -2.303871, 1, 0.3843137, 0, 1,
-1.465241, -1.792907, -2.661533, 1, 0.3882353, 0, 1,
-1.447989, -0.152218, -0.7558825, 1, 0.3960784, 0, 1,
-1.447204, -0.3718109, -2.243711, 1, 0.4039216, 0, 1,
-1.44673, 0.4669646, 0.9231109, 1, 0.4078431, 0, 1,
-1.445818, -0.7391728, -0.724106, 1, 0.4156863, 0, 1,
-1.421981, -0.777709, 0.4048807, 1, 0.4196078, 0, 1,
-1.414153, 0.4298183, -3.738683, 1, 0.427451, 0, 1,
-1.406065, -1.528424, -1.586903, 1, 0.4313726, 0, 1,
-1.400451, -0.8039162, -2.165301, 1, 0.4392157, 0, 1,
-1.39974, -1.372455, -0.3954583, 1, 0.4431373, 0, 1,
-1.385526, 0.1262576, -2.410691, 1, 0.4509804, 0, 1,
-1.378156, -2.012225, -3.794201, 1, 0.454902, 0, 1,
-1.375004, 0.4402211, -2.483695, 1, 0.4627451, 0, 1,
-1.373197, 0.4544131, -2.629258, 1, 0.4666667, 0, 1,
-1.354688, 1.135002, -0.6027352, 1, 0.4745098, 0, 1,
-1.352576, -0.2329954, -0.973437, 1, 0.4784314, 0, 1,
-1.336982, -0.9137735, -2.527329, 1, 0.4862745, 0, 1,
-1.319437, 0.7236546, -2.29837, 1, 0.4901961, 0, 1,
-1.319007, -0.192032, -0.9748732, 1, 0.4980392, 0, 1,
-1.313068, 0.7576844, -0.83318, 1, 0.5058824, 0, 1,
-1.305164, -0.2617673, -0.7313943, 1, 0.509804, 0, 1,
-1.301986, 0.004758508, -1.04753, 1, 0.5176471, 0, 1,
-1.299618, 0.5253356, -1.917044, 1, 0.5215687, 0, 1,
-1.294879, -0.8703809, -1.802842, 1, 0.5294118, 0, 1,
-1.289676, 1.122884, 1.167446, 1, 0.5333334, 0, 1,
-1.288059, -0.5724054, -1.830879, 1, 0.5411765, 0, 1,
-1.287524, -1.015296, -4.364552, 1, 0.5450981, 0, 1,
-1.277792, -0.3070285, -3.565547, 1, 0.5529412, 0, 1,
-1.275435, 0.3652466, -1.673918, 1, 0.5568628, 0, 1,
-1.274651, 0.746544, -0.9420323, 1, 0.5647059, 0, 1,
-1.27368, -0.9821898, -1.888392, 1, 0.5686275, 0, 1,
-1.270961, -0.8522174, -2.535121, 1, 0.5764706, 0, 1,
-1.264685, -0.3004047, -1.651612, 1, 0.5803922, 0, 1,
-1.258307, 0.1567131, -2.555102, 1, 0.5882353, 0, 1,
-1.258301, -0.6309708, -3.210775, 1, 0.5921569, 0, 1,
-1.254122, -0.8878088, -0.9857751, 1, 0.6, 0, 1,
-1.253734, 0.5247527, -0.9497141, 1, 0.6078432, 0, 1,
-1.249659, -0.9175801, -2.974669, 1, 0.6117647, 0, 1,
-1.248267, -0.6199574, -1.362194, 1, 0.6196079, 0, 1,
-1.240226, -1.274349, -3.797118, 1, 0.6235294, 0, 1,
-1.231743, 0.1125847, -2.476282, 1, 0.6313726, 0, 1,
-1.231071, -0.2965232, -1.685779, 1, 0.6352941, 0, 1,
-1.230444, 1.440305, -0.6902982, 1, 0.6431373, 0, 1,
-1.228651, 1.223833, -3.349499, 1, 0.6470588, 0, 1,
-1.22618, -1.618304, -2.034839, 1, 0.654902, 0, 1,
-1.220402, -1.213267, -1.420343, 1, 0.6588235, 0, 1,
-1.216988, -0.3245171, -1.429503, 1, 0.6666667, 0, 1,
-1.202508, -1.549225, -2.211436, 1, 0.6705883, 0, 1,
-1.199223, -1.248554, -2.140812, 1, 0.6784314, 0, 1,
-1.197035, -1.313375, -2.249653, 1, 0.682353, 0, 1,
-1.193112, 1.328482, 0.2556231, 1, 0.6901961, 0, 1,
-1.183874, -0.3634866, -2.146102, 1, 0.6941177, 0, 1,
-1.169279, 0.8679023, -1.450389, 1, 0.7019608, 0, 1,
-1.152774, -1.268649, -2.725914, 1, 0.7098039, 0, 1,
-1.150194, 0.6241351, -1.663915, 1, 0.7137255, 0, 1,
-1.137001, -0.7177078, -2.545475, 1, 0.7215686, 0, 1,
-1.134961, -1.439161, -4.334893, 1, 0.7254902, 0, 1,
-1.13285, 0.4691987, -0.8921744, 1, 0.7333333, 0, 1,
-1.13156, -0.988597, -3.94512, 1, 0.7372549, 0, 1,
-1.131227, 1.799127, -0.5007073, 1, 0.7450981, 0, 1,
-1.129352, 0.6336442, -1.949994, 1, 0.7490196, 0, 1,
-1.128685, -1.70549, -2.931845, 1, 0.7568628, 0, 1,
-1.128385, 0.1580585, -1.059034, 1, 0.7607843, 0, 1,
-1.124556, -1.063208, -2.516136, 1, 0.7686275, 0, 1,
-1.123613, 0.8242677, -1.063873, 1, 0.772549, 0, 1,
-1.122239, 0.03825428, -1.520527, 1, 0.7803922, 0, 1,
-1.120854, -1.578571, -2.954665, 1, 0.7843137, 0, 1,
-1.117109, 0.1057464, -3.725812, 1, 0.7921569, 0, 1,
-1.113725, -0.09644875, -1.752308, 1, 0.7960784, 0, 1,
-1.112024, 0.4961436, -2.200244, 1, 0.8039216, 0, 1,
-1.101979, 0.9774452, 2.141415, 1, 0.8117647, 0, 1,
-1.098078, 0.2307897, -1.779278, 1, 0.8156863, 0, 1,
-1.094857, -1.973474, -1.233563, 1, 0.8235294, 0, 1,
-1.08499, -0.1603352, -0.865582, 1, 0.827451, 0, 1,
-1.07951, -0.8376817, -2.032892, 1, 0.8352941, 0, 1,
-1.075343, 0.328343, -1.817189, 1, 0.8392157, 0, 1,
-1.063402, -0.397608, -3.277002, 1, 0.8470588, 0, 1,
-1.061062, -0.6157619, -2.637059, 1, 0.8509804, 0, 1,
-1.059607, -0.6730664, -3.68242, 1, 0.8588235, 0, 1,
-1.059083, 0.07179089, -2.517373, 1, 0.8627451, 0, 1,
-1.055991, 0.3629127, -0.6348909, 1, 0.8705882, 0, 1,
-1.050635, 0.6198755, -0.2757145, 1, 0.8745098, 0, 1,
-1.050008, 0.1032613, -1.490171, 1, 0.8823529, 0, 1,
-1.042727, 0.9239761, 0.2679056, 1, 0.8862745, 0, 1,
-1.041747, -2.044209, -2.803187, 1, 0.8941177, 0, 1,
-1.039493, -1.747099, -2.681653, 1, 0.8980392, 0, 1,
-1.035046, -1.696287, -1.734818, 1, 0.9058824, 0, 1,
-1.033419, -1.347642, -2.016124, 1, 0.9137255, 0, 1,
-1.033093, -0.1766985, -0.9277914, 1, 0.9176471, 0, 1,
-1.030751, -1.135319, -1.225239, 1, 0.9254902, 0, 1,
-1.030048, 0.03137126, -0.9822832, 1, 0.9294118, 0, 1,
-1.029665, 0.8166236, -0.4091719, 1, 0.9372549, 0, 1,
-1.023581, 0.01805077, 0.99168, 1, 0.9411765, 0, 1,
-1.02344, 0.5742576, 0.6723844, 1, 0.9490196, 0, 1,
-1.01493, -0.7155407, -3.048651, 1, 0.9529412, 0, 1,
-1.013163, 0.3425733, 0.04079957, 1, 0.9607843, 0, 1,
-1.009792, -1.852271, -1.492081, 1, 0.9647059, 0, 1,
-1.009768, -1.69608, -3.656096, 1, 0.972549, 0, 1,
-1.009495, -0.1199214, -1.951303, 1, 0.9764706, 0, 1,
-1.004771, -0.8655928, -2.690516, 1, 0.9843137, 0, 1,
-0.9999287, 1.620158, -0.4344536, 1, 0.9882353, 0, 1,
-0.9982825, -0.5738087, -1.294846, 1, 0.9960784, 0, 1,
-0.9953139, -0.8067335, -0.7848221, 0.9960784, 1, 0, 1,
-0.9944745, 0.3002317, -0.232631, 0.9921569, 1, 0, 1,
-0.9857261, -0.3307208, -1.495608, 0.9843137, 1, 0, 1,
-0.983032, -0.01590917, -2.464179, 0.9803922, 1, 0, 1,
-0.9710301, -0.7485051, -1.153296, 0.972549, 1, 0, 1,
-0.9697276, 1.336328, -0.6490744, 0.9686275, 1, 0, 1,
-0.9627684, -0.04706978, -1.236735, 0.9607843, 1, 0, 1,
-0.960784, 0.2881782, -0.936277, 0.9568627, 1, 0, 1,
-0.9564052, -1.708006, -0.9901808, 0.9490196, 1, 0, 1,
-0.9526521, -0.03821367, -1.025583, 0.945098, 1, 0, 1,
-0.9497722, -0.2289192, -1.369222, 0.9372549, 1, 0, 1,
-0.9414193, -1.79731, -3.046262, 0.9333333, 1, 0, 1,
-0.9364645, 1.307154, -0.2231039, 0.9254902, 1, 0, 1,
-0.9343086, 1.494498, 1.75394, 0.9215686, 1, 0, 1,
-0.9332309, 0.47467, -0.9655447, 0.9137255, 1, 0, 1,
-0.9278501, -0.9437807, -2.125797, 0.9098039, 1, 0, 1,
-0.9264155, 0.8388731, -0.3520527, 0.9019608, 1, 0, 1,
-0.9214313, -0.9505097, -1.421048, 0.8941177, 1, 0, 1,
-0.9212339, -0.3400362, 0.9553164, 0.8901961, 1, 0, 1,
-0.918295, -0.341702, -1.46005, 0.8823529, 1, 0, 1,
-0.9160279, 0.6892316, 0.002672036, 0.8784314, 1, 0, 1,
-0.9130682, 1.465815, 0.7839115, 0.8705882, 1, 0, 1,
-0.9108681, 1.202451, -2.437115, 0.8666667, 1, 0, 1,
-0.9069385, -0.2653386, -2.978857, 0.8588235, 1, 0, 1,
-0.9058447, -0.8643302, -2.279929, 0.854902, 1, 0, 1,
-0.9001358, 0.3899286, -2.947919, 0.8470588, 1, 0, 1,
-0.8990088, 1.726887, -1.036675, 0.8431373, 1, 0, 1,
-0.896785, 0.5610449, -2.939008, 0.8352941, 1, 0, 1,
-0.8905475, -0.5408062, -2.587747, 0.8313726, 1, 0, 1,
-0.8881677, -0.1144398, 0.7688537, 0.8235294, 1, 0, 1,
-0.886562, 0.6111389, -2.004507, 0.8196079, 1, 0, 1,
-0.8809187, 0.7041396, 0.6114725, 0.8117647, 1, 0, 1,
-0.8806865, -1.556532, -2.638022, 0.8078431, 1, 0, 1,
-0.8793042, 0.4370744, -0.02133736, 0.8, 1, 0, 1,
-0.8779828, -0.1108278, -1.3768, 0.7921569, 1, 0, 1,
-0.8773896, -2.312087, -1.907795, 0.7882353, 1, 0, 1,
-0.8766032, -0.09038385, -2.129399, 0.7803922, 1, 0, 1,
-0.8681059, -0.03069349, -3.055288, 0.7764706, 1, 0, 1,
-0.8667846, 2.027592, 0.8593403, 0.7686275, 1, 0, 1,
-0.8582022, 0.6758052, 0.006085793, 0.7647059, 1, 0, 1,
-0.8571464, -1.714648, -2.755784, 0.7568628, 1, 0, 1,
-0.8547863, -0.1039691, -3.69046, 0.7529412, 1, 0, 1,
-0.8472579, -0.2636197, -0.03197657, 0.7450981, 1, 0, 1,
-0.8408173, 0.007848232, -1.41691, 0.7411765, 1, 0, 1,
-0.8310994, -1.331839, -2.660773, 0.7333333, 1, 0, 1,
-0.8300374, 1.748644, -2.926708, 0.7294118, 1, 0, 1,
-0.8277097, 1.081689, -0.7716172, 0.7215686, 1, 0, 1,
-0.823388, -0.72802, -2.754444, 0.7176471, 1, 0, 1,
-0.8205906, -0.9873127, -2.728985, 0.7098039, 1, 0, 1,
-0.8198983, -1.124486, -2.65479, 0.7058824, 1, 0, 1,
-0.818475, 0.9862886, -0.0216299, 0.6980392, 1, 0, 1,
-0.8159288, -0.09073626, -1.949576, 0.6901961, 1, 0, 1,
-0.8137012, -0.599474, -3.170377, 0.6862745, 1, 0, 1,
-0.8119541, 0.4097128, 0.6788186, 0.6784314, 1, 0, 1,
-0.8099117, 1.58088, -0.6909571, 0.6745098, 1, 0, 1,
-0.8053597, -0.05685983, -0.12344, 0.6666667, 1, 0, 1,
-0.8030915, -0.2301639, -0.4840662, 0.6627451, 1, 0, 1,
-0.8013347, -0.5843828, -3.072826, 0.654902, 1, 0, 1,
-0.7982867, 0.4910958, -1.578497, 0.6509804, 1, 0, 1,
-0.7966044, -0.7747462, -0.4652656, 0.6431373, 1, 0, 1,
-0.7959856, -1.339466, -1.994917, 0.6392157, 1, 0, 1,
-0.7946309, -0.7109307, -1.791562, 0.6313726, 1, 0, 1,
-0.7853695, -1.052851, -2.235952, 0.627451, 1, 0, 1,
-0.7821188, -0.2208484, -2.19968, 0.6196079, 1, 0, 1,
-0.7781966, -0.06946071, -0.5072541, 0.6156863, 1, 0, 1,
-0.7752223, -1.686333, -3.276786, 0.6078432, 1, 0, 1,
-0.7733147, -0.6829506, -3.416833, 0.6039216, 1, 0, 1,
-0.772462, -0.5663733, -0.09306746, 0.5960785, 1, 0, 1,
-0.7697598, -0.8363593, -2.985064, 0.5882353, 1, 0, 1,
-0.7682402, -0.9337867, -2.583658, 0.5843138, 1, 0, 1,
-0.764487, -0.3308588, -1.02845, 0.5764706, 1, 0, 1,
-0.7618512, -0.695638, -2.514232, 0.572549, 1, 0, 1,
-0.7611111, 0.4959183, 0.09597827, 0.5647059, 1, 0, 1,
-0.7598968, -0.9618131, -0.506111, 0.5607843, 1, 0, 1,
-0.7590905, -1.029141, -1.665974, 0.5529412, 1, 0, 1,
-0.757444, -0.3851633, -2.014354, 0.5490196, 1, 0, 1,
-0.7572352, 0.1809372, 1.867226, 0.5411765, 1, 0, 1,
-0.7557319, 1.300306, -0.5896297, 0.5372549, 1, 0, 1,
-0.7553843, 1.388124, -1.852481, 0.5294118, 1, 0, 1,
-0.7553117, 2.208719, 0.9795824, 0.5254902, 1, 0, 1,
-0.7549967, -1.261993, -4.386263, 0.5176471, 1, 0, 1,
-0.7547323, -0.07609741, -0.8415418, 0.5137255, 1, 0, 1,
-0.7488905, 1.191715, -2.38682, 0.5058824, 1, 0, 1,
-0.7477454, 0.1453721, -1.15371, 0.5019608, 1, 0, 1,
-0.7413698, -1.062438, 0.1406273, 0.4941176, 1, 0, 1,
-0.7386639, -1.181436, -2.742014, 0.4862745, 1, 0, 1,
-0.7348269, -1.299009, -2.864521, 0.4823529, 1, 0, 1,
-0.7337306, 0.5488605, -1.117676, 0.4745098, 1, 0, 1,
-0.7308487, -0.4953775, -0.06210693, 0.4705882, 1, 0, 1,
-0.719972, 1.029612, 0.08156132, 0.4627451, 1, 0, 1,
-0.7190211, 0.1634848, -0.05742822, 0.4588235, 1, 0, 1,
-0.7179995, 0.1208086, -2.220896, 0.4509804, 1, 0, 1,
-0.7142923, 1.091033, -0.1576695, 0.4470588, 1, 0, 1,
-0.7137698, -0.884142, -1.324328, 0.4392157, 1, 0, 1,
-0.7127516, 0.120305, 0.2802319, 0.4352941, 1, 0, 1,
-0.7116804, 0.8896083, 0.1683834, 0.427451, 1, 0, 1,
-0.7036394, 1.233812, 0.9872118, 0.4235294, 1, 0, 1,
-0.6994546, -1.536988, -3.598179, 0.4156863, 1, 0, 1,
-0.697334, -1.243398, -3.308054, 0.4117647, 1, 0, 1,
-0.6970386, -0.2044484, -2.013068, 0.4039216, 1, 0, 1,
-0.6955925, -0.4675818, -3.964019, 0.3960784, 1, 0, 1,
-0.6863115, -0.3099667, -0.5134721, 0.3921569, 1, 0, 1,
-0.6858731, -0.3924673, -1.623899, 0.3843137, 1, 0, 1,
-0.6836802, 0.1278014, -1.017606, 0.3803922, 1, 0, 1,
-0.6704489, 0.6604596, -1.013137, 0.372549, 1, 0, 1,
-0.6655805, -0.2106289, -2.936697, 0.3686275, 1, 0, 1,
-0.6616135, -0.1972052, -2.061211, 0.3607843, 1, 0, 1,
-0.6612532, -0.9600537, -1.830498, 0.3568628, 1, 0, 1,
-0.6600522, -0.123523, -2.056041, 0.3490196, 1, 0, 1,
-0.6599292, 0.376727, -0.6788325, 0.345098, 1, 0, 1,
-0.6587083, -0.9563621, -2.452543, 0.3372549, 1, 0, 1,
-0.6586175, -1.426655, -2.890698, 0.3333333, 1, 0, 1,
-0.6582392, 0.1767374, -0.5670567, 0.3254902, 1, 0, 1,
-0.6571314, -0.1863285, -0.2917909, 0.3215686, 1, 0, 1,
-0.6543157, 0.6957425, 1.392252, 0.3137255, 1, 0, 1,
-0.6522961, 1.010461, -0.7226198, 0.3098039, 1, 0, 1,
-0.6522213, -1.753478, -1.661677, 0.3019608, 1, 0, 1,
-0.6472217, 0.5429314, 1.141725, 0.2941177, 1, 0, 1,
-0.64518, 1.065524, -1.320184, 0.2901961, 1, 0, 1,
-0.6444546, -1.10491, -1.690738, 0.282353, 1, 0, 1,
-0.6434796, -0.5259063, -3.65598, 0.2784314, 1, 0, 1,
-0.6393722, 0.7385622, -1.46585, 0.2705882, 1, 0, 1,
-0.6391506, 1.343037, -0.02136376, 0.2666667, 1, 0, 1,
-0.6339804, 1.036804, 1.193155, 0.2588235, 1, 0, 1,
-0.6321832, -0.07413746, -1.663805, 0.254902, 1, 0, 1,
-0.624595, 0.3188019, -0.8686492, 0.2470588, 1, 0, 1,
-0.6240225, 1.544487, -2.684524, 0.2431373, 1, 0, 1,
-0.6186235, 1.058435, -1.062675, 0.2352941, 1, 0, 1,
-0.6133301, -0.8708066, -2.96326, 0.2313726, 1, 0, 1,
-0.6091141, -0.1946117, -1.784043, 0.2235294, 1, 0, 1,
-0.6068118, -0.8649574, -3.389296, 0.2196078, 1, 0, 1,
-0.6016293, -0.6579016, -0.7032427, 0.2117647, 1, 0, 1,
-0.600889, -0.8892557, -2.797187, 0.2078431, 1, 0, 1,
-0.5843477, 0.8782247, 0.3507924, 0.2, 1, 0, 1,
-0.5799468, 0.08777554, -0.06539568, 0.1921569, 1, 0, 1,
-0.5771596, -0.3367122, 0.2597253, 0.1882353, 1, 0, 1,
-0.5769391, -1.448933, -2.263226, 0.1803922, 1, 0, 1,
-0.57679, 0.09890392, -2.228192, 0.1764706, 1, 0, 1,
-0.5754521, -0.1838289, -1.894399, 0.1686275, 1, 0, 1,
-0.5729161, -1.281619, -4.247869, 0.1647059, 1, 0, 1,
-0.568794, 0.7368318, -1.59771, 0.1568628, 1, 0, 1,
-0.5659911, 1.806252, -0.7510322, 0.1529412, 1, 0, 1,
-0.5614334, -0.3761254, -1.744269, 0.145098, 1, 0, 1,
-0.5548115, 0.08268356, -0.8411195, 0.1411765, 1, 0, 1,
-0.5544592, 0.05270111, -0.3136193, 0.1333333, 1, 0, 1,
-0.5515729, 1.443313, 0.04722627, 0.1294118, 1, 0, 1,
-0.5483277, -0.8764513, 0.1838792, 0.1215686, 1, 0, 1,
-0.5473114, 0.2686732, -0.04347026, 0.1176471, 1, 0, 1,
-0.5461594, -1.080656, -3.851666, 0.1098039, 1, 0, 1,
-0.5461394, -0.4070623, -2.480949, 0.1058824, 1, 0, 1,
-0.5456226, 0.7193183, -1.48198, 0.09803922, 1, 0, 1,
-0.5432789, -1.158811, -2.862931, 0.09019608, 1, 0, 1,
-0.5395286, -0.7182523, -4.001852, 0.08627451, 1, 0, 1,
-0.5378423, -0.2281926, -2.820935, 0.07843138, 1, 0, 1,
-0.5369846, -0.7768768, -2.472794, 0.07450981, 1, 0, 1,
-0.5367557, -0.7783622, -1.434205, 0.06666667, 1, 0, 1,
-0.5293882, 0.2929719, -2.770606, 0.0627451, 1, 0, 1,
-0.5289332, 0.2793559, -2.914294, 0.05490196, 1, 0, 1,
-0.5274417, 1.594667, -0.004785225, 0.05098039, 1, 0, 1,
-0.5230054, 0.5104787, -1.264279, 0.04313726, 1, 0, 1,
-0.5206885, 1.561471, 1.05729, 0.03921569, 1, 0, 1,
-0.5180664, -0.4324652, -1.308261, 0.03137255, 1, 0, 1,
-0.5136923, -1.940628, -3.226751, 0.02745098, 1, 0, 1,
-0.50864, -0.6642176, -2.195128, 0.01960784, 1, 0, 1,
-0.5030608, 0.4559695, -0.5906574, 0.01568628, 1, 0, 1,
-0.5020764, -0.2625723, -1.241201, 0.007843138, 1, 0, 1,
-0.4975851, -2.398782, -2.724179, 0.003921569, 1, 0, 1,
-0.4968207, -0.8262804, -1.839695, 0, 1, 0.003921569, 1,
-0.4958375, 0.8806663, -0.5407383, 0, 1, 0.01176471, 1,
-0.4942982, -0.7405536, -1.845674, 0, 1, 0.01568628, 1,
-0.49357, -0.4989229, -0.8746629, 0, 1, 0.02352941, 1,
-0.4926368, -0.3833253, -2.906489, 0, 1, 0.02745098, 1,
-0.4910309, 0.7899043, 1.038354, 0, 1, 0.03529412, 1,
-0.4893194, -0.2082868, -1.369058, 0, 1, 0.03921569, 1,
-0.4868123, -1.656472, -2.73254, 0, 1, 0.04705882, 1,
-0.4834398, -0.9862391, -2.428591, 0, 1, 0.05098039, 1,
-0.4812347, 0.4953449, 0.6671271, 0, 1, 0.05882353, 1,
-0.4801853, 0.2077442, -1.847922, 0, 1, 0.0627451, 1,
-0.4795423, 0.4089788, 0.4939876, 0, 1, 0.07058824, 1,
-0.4743384, 0.2352921, 0.397931, 0, 1, 0.07450981, 1,
-0.4729839, -0.7439258, -2.843035, 0, 1, 0.08235294, 1,
-0.4718145, 0.04675018, -2.431258, 0, 1, 0.08627451, 1,
-0.4659806, 1.112724, -1.051488, 0, 1, 0.09411765, 1,
-0.4625248, -0.5089658, -1.40012, 0, 1, 0.1019608, 1,
-0.4615521, -2.717969, -3.234047, 0, 1, 0.1058824, 1,
-0.4603997, -0.2201112, -2.954325, 0, 1, 0.1137255, 1,
-0.4570794, 0.0253028, -1.939175, 0, 1, 0.1176471, 1,
-0.456863, -0.6488444, -4.310023, 0, 1, 0.1254902, 1,
-0.4547092, 2.26457, 0.7825586, 0, 1, 0.1294118, 1,
-0.4520156, 0.5484094, 0.1060114, 0, 1, 0.1372549, 1,
-0.4470706, -0.7338103, -1.335256, 0, 1, 0.1411765, 1,
-0.443838, 1.943913, -1.97527, 0, 1, 0.1490196, 1,
-0.4424764, -0.1590933, -2.334705, 0, 1, 0.1529412, 1,
-0.4415303, 0.7308602, -0.08852906, 0, 1, 0.1607843, 1,
-0.4385354, -0.8414432, -4.002841, 0, 1, 0.1647059, 1,
-0.4376426, 1.014495, -1.078699, 0, 1, 0.172549, 1,
-0.4344438, -0.3032603, -3.189567, 0, 1, 0.1764706, 1,
-0.4321784, -0.787643, -1.830635, 0, 1, 0.1843137, 1,
-0.4307992, 0.5212998, -0.7626973, 0, 1, 0.1882353, 1,
-0.4257248, -1.212761, -3.692153, 0, 1, 0.1960784, 1,
-0.4256534, -0.4221713, -2.551086, 0, 1, 0.2039216, 1,
-0.4229167, -1.925166, -1.42624, 0, 1, 0.2078431, 1,
-0.4225551, -0.5077989, -4.696368, 0, 1, 0.2156863, 1,
-0.4214612, 1.551109, 0.8840057, 0, 1, 0.2196078, 1,
-0.4188885, 0.4306616, 0.845004, 0, 1, 0.227451, 1,
-0.4175605, 0.852353, -0.8601133, 0, 1, 0.2313726, 1,
-0.4172752, 0.1596464, 0.3478596, 0, 1, 0.2392157, 1,
-0.408886, 0.3850433, -1.605569, 0, 1, 0.2431373, 1,
-0.4061303, -0.1915037, -1.546222, 0, 1, 0.2509804, 1,
-0.401365, 0.4181917, -0.8762761, 0, 1, 0.254902, 1,
-0.4003413, -1.772185, -1.913167, 0, 1, 0.2627451, 1,
-0.3906678, -0.1404905, -0.830649, 0, 1, 0.2666667, 1,
-0.3876475, 0.3294722, -0.3931494, 0, 1, 0.2745098, 1,
-0.3848416, -0.3450184, -2.015257, 0, 1, 0.2784314, 1,
-0.3847803, 1.562872, -1.999661, 0, 1, 0.2862745, 1,
-0.3791969, -0.8321813, -2.562779, 0, 1, 0.2901961, 1,
-0.3788211, 0.9241517, 0.6288197, 0, 1, 0.2980392, 1,
-0.3761909, 1.16238, -0.6179656, 0, 1, 0.3058824, 1,
-0.374917, 0.3390793, -1.461901, 0, 1, 0.3098039, 1,
-0.3744186, 1.167189, -0.9545164, 0, 1, 0.3176471, 1,
-0.3734766, 0.1050306, -0.7788489, 0, 1, 0.3215686, 1,
-0.3708054, 0.1547883, -0.2286348, 0, 1, 0.3294118, 1,
-0.3701444, -0.3777725, -2.584488, 0, 1, 0.3333333, 1,
-0.3681335, 1.082461, -0.2732794, 0, 1, 0.3411765, 1,
-0.366122, 0.8026212, 0.6339562, 0, 1, 0.345098, 1,
-0.3650473, -1.193526, -2.431046, 0, 1, 0.3529412, 1,
-0.3650183, 0.7696115, -0.2220603, 0, 1, 0.3568628, 1,
-0.3624133, 0.07503336, -0.6036629, 0, 1, 0.3647059, 1,
-0.3415726, -0.3279432, -2.178682, 0, 1, 0.3686275, 1,
-0.3394912, -0.4303055, -2.184826, 0, 1, 0.3764706, 1,
-0.3386221, -0.08818221, -2.477476, 0, 1, 0.3803922, 1,
-0.3375969, 0.5010536, -0.003332172, 0, 1, 0.3882353, 1,
-0.3367722, 1.963109, -1.505271, 0, 1, 0.3921569, 1,
-0.3348403, 1.671307, -1.219816, 0, 1, 0.4, 1,
-0.3333438, 0.2523547, -1.409781, 0, 1, 0.4078431, 1,
-0.329465, -1.124752, -1.058501, 0, 1, 0.4117647, 1,
-0.3291113, 0.04210785, -2.31999, 0, 1, 0.4196078, 1,
-0.3284105, -1.161463, -4.084025, 0, 1, 0.4235294, 1,
-0.3280064, 0.651977, -1.793945, 0, 1, 0.4313726, 1,
-0.3264959, 1.907008, 0.5177448, 0, 1, 0.4352941, 1,
-0.3260259, 0.5269909, -0.2272886, 0, 1, 0.4431373, 1,
-0.3240875, 0.4667271, -1.663913, 0, 1, 0.4470588, 1,
-0.3182874, 0.2812161, -0.5192072, 0, 1, 0.454902, 1,
-0.3178268, 0.5070804, -0.08407708, 0, 1, 0.4588235, 1,
-0.3144318, 1.011522, 0.5899207, 0, 1, 0.4666667, 1,
-0.3128101, -0.992862, -4.262103, 0, 1, 0.4705882, 1,
-0.3119424, -0.4310745, -2.030537, 0, 1, 0.4784314, 1,
-0.3118526, 0.687161, 0.5799675, 0, 1, 0.4823529, 1,
-0.3108751, 0.1099602, -0.6171143, 0, 1, 0.4901961, 1,
-0.30841, -2.806446, -3.636566, 0, 1, 0.4941176, 1,
-0.3083086, -0.02780677, -2.616916, 0, 1, 0.5019608, 1,
-0.3078731, -0.8850947, -2.509013, 0, 1, 0.509804, 1,
-0.3064442, 2.00732, -0.06275351, 0, 1, 0.5137255, 1,
-0.3062906, 0.5101121, -0.7613714, 0, 1, 0.5215687, 1,
-0.3030039, -0.02875455, -1.763454, 0, 1, 0.5254902, 1,
-0.2970484, 0.827415, 0.06871492, 0, 1, 0.5333334, 1,
-0.2965689, -0.1603956, -0.2835074, 0, 1, 0.5372549, 1,
-0.2963965, 0.8710915, 0.4412866, 0, 1, 0.5450981, 1,
-0.2839957, -0.361214, -1.920882, 0, 1, 0.5490196, 1,
-0.2807696, 0.3887885, -0.9824393, 0, 1, 0.5568628, 1,
-0.2796504, -2.204433, -3.402883, 0, 1, 0.5607843, 1,
-0.2767432, 1.117374, 0.1372056, 0, 1, 0.5686275, 1,
-0.2736831, 0.3284656, 0.3478062, 0, 1, 0.572549, 1,
-0.2734564, -0.1830631, -3.865966, 0, 1, 0.5803922, 1,
-0.2710437, -0.16909, -3.3142, 0, 1, 0.5843138, 1,
-0.2699001, 0.7668896, 0.7418217, 0, 1, 0.5921569, 1,
-0.2610734, 1.776941, 0.7403487, 0, 1, 0.5960785, 1,
-0.2581058, -1.030194, -2.087219, 0, 1, 0.6039216, 1,
-0.253031, -0.2245277, -3.697179, 0, 1, 0.6117647, 1,
-0.2509814, -2.585968, -3.043535, 0, 1, 0.6156863, 1,
-0.2504267, 0.8029799, 0.005620664, 0, 1, 0.6235294, 1,
-0.2488448, 0.9081602, -2.298578, 0, 1, 0.627451, 1,
-0.2477687, -0.8096121, -2.762111, 0, 1, 0.6352941, 1,
-0.2458752, -2.243448, -2.131214, 0, 1, 0.6392157, 1,
-0.2458397, 0.5005562, -0.03927827, 0, 1, 0.6470588, 1,
-0.2443576, 1.212771, 0.1262552, 0, 1, 0.6509804, 1,
-0.2426423, -0.3397544, -2.365867, 0, 1, 0.6588235, 1,
-0.2398682, -1.895541, -2.951311, 0, 1, 0.6627451, 1,
-0.236685, 0.4247892, 0.01183097, 0, 1, 0.6705883, 1,
-0.2364634, 0.5953582, 0.1457693, 0, 1, 0.6745098, 1,
-0.2357057, -0.5555582, -3.271826, 0, 1, 0.682353, 1,
-0.2322765, 1.088839, -0.6933029, 0, 1, 0.6862745, 1,
-0.2319895, -1.404029, -3.208434, 0, 1, 0.6941177, 1,
-0.2309744, -0.7181634, -4.320827, 0, 1, 0.7019608, 1,
-0.2309305, 0.6640912, 0.113754, 0, 1, 0.7058824, 1,
-0.2295979, 0.7853892, -0.07714164, 0, 1, 0.7137255, 1,
-0.2292484, 0.5005051, -0.3745807, 0, 1, 0.7176471, 1,
-0.2284939, 1.446058, -0.3149424, 0, 1, 0.7254902, 1,
-0.2272913, -0.8233366, -2.601159, 0, 1, 0.7294118, 1,
-0.2265093, -1.646064, -2.446385, 0, 1, 0.7372549, 1,
-0.2261705, -1.506503, -2.427748, 0, 1, 0.7411765, 1,
-0.2225646, 2.249421, 1.541483, 0, 1, 0.7490196, 1,
-0.2174805, -1.217498, -2.178516, 0, 1, 0.7529412, 1,
-0.2143984, -0.9571937, -3.548011, 0, 1, 0.7607843, 1,
-0.212581, -0.869471, -4.030252, 0, 1, 0.7647059, 1,
-0.2097357, 0.01098321, 0.7470114, 0, 1, 0.772549, 1,
-0.2069365, 0.3932946, -0.6255314, 0, 1, 0.7764706, 1,
-0.205683, -0.8955505, -3.371848, 0, 1, 0.7843137, 1,
-0.2046427, 0.8438064, 0.02361706, 0, 1, 0.7882353, 1,
-0.2018919, 2.43026, -0.8396688, 0, 1, 0.7960784, 1,
-0.2016995, -1.682066, -2.567798, 0, 1, 0.8039216, 1,
-0.1987378, 1.379431, 1.213828, 0, 1, 0.8078431, 1,
-0.1973578, -2.185318, -3.097141, 0, 1, 0.8156863, 1,
-0.1961633, -0.3668151, -2.543723, 0, 1, 0.8196079, 1,
-0.1946571, -0.5907027, -2.763203, 0, 1, 0.827451, 1,
-0.1920418, 1.111237, -0.2645457, 0, 1, 0.8313726, 1,
-0.1917743, -0.1704343, -2.506635, 0, 1, 0.8392157, 1,
-0.1773398, 1.472416, 0.3110009, 0, 1, 0.8431373, 1,
-0.1709878, 0.5308539, 0.8581582, 0, 1, 0.8509804, 1,
-0.169899, 0.3434821, -1.23879, 0, 1, 0.854902, 1,
-0.1667809, 1.055547, -0.3482115, 0, 1, 0.8627451, 1,
-0.165874, -0.2838754, -2.362721, 0, 1, 0.8666667, 1,
-0.162694, -0.4860843, -2.144014, 0, 1, 0.8745098, 1,
-0.1570249, 0.08187027, -1.858828, 0, 1, 0.8784314, 1,
-0.1554912, -0.2444072, -1.650797, 0, 1, 0.8862745, 1,
-0.1550584, -0.9982167, -3.799213, 0, 1, 0.8901961, 1,
-0.1487844, -0.9655581, -1.040437, 0, 1, 0.8980392, 1,
-0.1447836, 0.8261421, -0.1401363, 0, 1, 0.9058824, 1,
-0.1397617, 1.627285, 0.8347787, 0, 1, 0.9098039, 1,
-0.1350046, -0.2758393, -3.858125, 0, 1, 0.9176471, 1,
-0.129036, -0.5635116, -3.337986, 0, 1, 0.9215686, 1,
-0.1271897, 3.366492, -0.1791892, 0, 1, 0.9294118, 1,
-0.1264757, -0.2548058, -4.288888, 0, 1, 0.9333333, 1,
-0.1255191, 1.455429, -2.54992, 0, 1, 0.9411765, 1,
-0.1251983, -1.458267, -3.276116, 0, 1, 0.945098, 1,
-0.1218106, 2.111915, -0.285592, 0, 1, 0.9529412, 1,
-0.1212054, -0.7361975, -2.100822, 0, 1, 0.9568627, 1,
-0.1191266, 0.3755029, -2.098912, 0, 1, 0.9647059, 1,
-0.118667, 0.3057997, -2.093385, 0, 1, 0.9686275, 1,
-0.1174408, 1.459829, 0.7769146, 0, 1, 0.9764706, 1,
-0.1170068, -0.5600278, -0.8810945, 0, 1, 0.9803922, 1,
-0.1161405, -1.214002, -3.370382, 0, 1, 0.9882353, 1,
-0.1110891, -0.2595901, -2.184829, 0, 1, 0.9921569, 1,
-0.1087726, 1.346064, -0.2400262, 0, 1, 1, 1,
-0.1011622, 0.2286801, -1.869054, 0, 0.9921569, 1, 1,
-0.100426, -0.8435203, -3.494849, 0, 0.9882353, 1, 1,
-0.09877391, -0.7650414, -2.266295, 0, 0.9803922, 1, 1,
-0.0941321, 0.4992068, 0.5002374, 0, 0.9764706, 1, 1,
-0.09281348, 0.2520945, -2.993176, 0, 0.9686275, 1, 1,
-0.09084357, 0.06850368, -1.395396, 0, 0.9647059, 1, 1,
-0.0874726, -2.160846, -3.490223, 0, 0.9568627, 1, 1,
-0.08300705, -0.1275491, -2.562942, 0, 0.9529412, 1, 1,
-0.08205975, -0.5821492, -2.333996, 0, 0.945098, 1, 1,
-0.08184606, -0.4492579, -2.091001, 0, 0.9411765, 1, 1,
-0.07755275, -1.615077, -3.55038, 0, 0.9333333, 1, 1,
-0.07500193, 0.09574855, -1.883242, 0, 0.9294118, 1, 1,
-0.07258423, -1.411727, -2.911493, 0, 0.9215686, 1, 1,
-0.07116479, -1.766808, -3.624756, 0, 0.9176471, 1, 1,
-0.07030296, -0.8756251, -3.494015, 0, 0.9098039, 1, 1,
-0.06881761, 1.246773, 0.1718678, 0, 0.9058824, 1, 1,
-0.06838607, 0.1698962, -0.3329085, 0, 0.8980392, 1, 1,
-0.06370877, 0.0254058, -0.6041359, 0, 0.8901961, 1, 1,
-0.05856177, 0.3758326, 0.3246368, 0, 0.8862745, 1, 1,
-0.05729513, -0.528018, -2.651156, 0, 0.8784314, 1, 1,
-0.05643782, -1.112047, -3.317465, 0, 0.8745098, 1, 1,
-0.05383396, 0.3807451, -0.04224035, 0, 0.8666667, 1, 1,
-0.05097103, 1.001213, 1.065072, 0, 0.8627451, 1, 1,
-0.04622214, -1.585952, -2.480147, 0, 0.854902, 1, 1,
-0.04241618, -1.300129, -2.347474, 0, 0.8509804, 1, 1,
-0.04076225, -1.010882, -1.744508, 0, 0.8431373, 1, 1,
-0.04053586, 1.306155, 0.4909583, 0, 0.8392157, 1, 1,
-0.03417597, -1.112543, -3.34583, 0, 0.8313726, 1, 1,
-0.03413001, 0.3660032, -1.523607, 0, 0.827451, 1, 1,
-0.03277456, -0.6255993, -2.541162, 0, 0.8196079, 1, 1,
-0.03076824, 0.6131764, 0.4371104, 0, 0.8156863, 1, 1,
-0.02969297, 0.0878149, 0.4226702, 0, 0.8078431, 1, 1,
-0.02591606, 0.3423714, -0.1864092, 0, 0.8039216, 1, 1,
-0.01826039, 1.455388, -0.1187102, 0, 0.7960784, 1, 1,
-0.01310827, 0.3816928, 0.2764481, 0, 0.7882353, 1, 1,
-0.01290384, 0.2721213, -0.3775904, 0, 0.7843137, 1, 1,
-0.006620003, 0.6223264, -0.4684482, 0, 0.7764706, 1, 1,
-0.00221246, 0.1354657, 1.407504, 0, 0.772549, 1, 1,
-1.530695e-05, -0.4231559, -3.684384, 0, 0.7647059, 1, 1,
0.003436438, -0.04361012, 4.004354, 0, 0.7607843, 1, 1,
0.01138621, -0.3723469, 3.417096, 0, 0.7529412, 1, 1,
0.01166508, -0.7915011, 4.18053, 0, 0.7490196, 1, 1,
0.01466662, 1.271248, 0.8765144, 0, 0.7411765, 1, 1,
0.01947521, 1.493569, 0.05766877, 0, 0.7372549, 1, 1,
0.02405791, -0.2546136, 1.351568, 0, 0.7294118, 1, 1,
0.02436998, 0.5258846, -0.3436303, 0, 0.7254902, 1, 1,
0.02438797, 1.49445, -1.00593, 0, 0.7176471, 1, 1,
0.02712132, -0.5226052, 1.245001, 0, 0.7137255, 1, 1,
0.02746743, 0.2897561, 1.304021, 0, 0.7058824, 1, 1,
0.02828966, -1.163256, 3.218689, 0, 0.6980392, 1, 1,
0.03025119, -0.3764124, 3.41587, 0, 0.6941177, 1, 1,
0.0332201, -0.04691998, 2.854911, 0, 0.6862745, 1, 1,
0.0347085, 1.721097, 1.738064, 0, 0.682353, 1, 1,
0.03587077, -0.0945019, 3.052519, 0, 0.6745098, 1, 1,
0.03628013, 1.84015, 1.5281, 0, 0.6705883, 1, 1,
0.0415459, 0.7805247, 2.325319, 0, 0.6627451, 1, 1,
0.04864004, 0.05997061, 1.677314, 0, 0.6588235, 1, 1,
0.04907874, 0.2149808, -1.607018, 0, 0.6509804, 1, 1,
0.04985528, 1.025809, 0.2420138, 0, 0.6470588, 1, 1,
0.05039154, -0.6663082, 5.004665, 0, 0.6392157, 1, 1,
0.05218099, -1.659723, 1.620135, 0, 0.6352941, 1, 1,
0.05383791, 0.1385323, -0.7370667, 0, 0.627451, 1, 1,
0.05434157, -1.21184, 2.500603, 0, 0.6235294, 1, 1,
0.05486071, -0.1530728, 1.314339, 0, 0.6156863, 1, 1,
0.05818977, -0.3784503, 3.983594, 0, 0.6117647, 1, 1,
0.05865017, -0.2640607, 2.649387, 0, 0.6039216, 1, 1,
0.06111644, -1.037266, 3.213984, 0, 0.5960785, 1, 1,
0.06688587, 1.934016, 1.481119, 0, 0.5921569, 1, 1,
0.06780617, -0.6442875, 2.818755, 0, 0.5843138, 1, 1,
0.06935453, -2.420664, 1.556199, 0, 0.5803922, 1, 1,
0.07049717, 0.5208459, -2.587118, 0, 0.572549, 1, 1,
0.0791358, -0.06281657, 1.499763, 0, 0.5686275, 1, 1,
0.0826133, -0.3578318, 3.504916, 0, 0.5607843, 1, 1,
0.08432022, -0.2110745, 1.66083, 0, 0.5568628, 1, 1,
0.08543634, 0.4935328, 1.387078, 0, 0.5490196, 1, 1,
0.08783887, -0.4344608, 4.141037, 0, 0.5450981, 1, 1,
0.08908769, -1.905762, 3.891475, 0, 0.5372549, 1, 1,
0.09039031, 0.1195421, -0.03917857, 0, 0.5333334, 1, 1,
0.09242604, 0.1995795, 0.6901111, 0, 0.5254902, 1, 1,
0.09294945, -0.7458872, 2.322848, 0, 0.5215687, 1, 1,
0.09490874, 0.1706483, -0.00997038, 0, 0.5137255, 1, 1,
0.09927914, 0.1107061, 1.728684, 0, 0.509804, 1, 1,
0.099636, 0.6934303, 0.590193, 0, 0.5019608, 1, 1,
0.1131586, -2.288496, 3.455128, 0, 0.4941176, 1, 1,
0.1137014, -0.8735314, 3.125112, 0, 0.4901961, 1, 1,
0.115175, -1.15504, 3.701653, 0, 0.4823529, 1, 1,
0.1163349, -0.1788891, 2.852765, 0, 0.4784314, 1, 1,
0.1164386, -0.08373336, 1.722598, 0, 0.4705882, 1, 1,
0.1209609, -0.1382017, 3.183797, 0, 0.4666667, 1, 1,
0.1249728, 0.3867494, 0.9603015, 0, 0.4588235, 1, 1,
0.124973, 1.551751, -0.2847421, 0, 0.454902, 1, 1,
0.1273352, 0.3330275, -1.410842, 0, 0.4470588, 1, 1,
0.1353716, -0.1458947, 3.145895, 0, 0.4431373, 1, 1,
0.1373492, -0.3030855, 1.913373, 0, 0.4352941, 1, 1,
0.1392223, 0.04830385, 0.2284432, 0, 0.4313726, 1, 1,
0.1411702, 0.3517635, 1.529925, 0, 0.4235294, 1, 1,
0.1428198, 0.01934305, 3.46993, 0, 0.4196078, 1, 1,
0.1476454, 0.1366964, 1.712626, 0, 0.4117647, 1, 1,
0.1503482, 1.871676, 1.090787, 0, 0.4078431, 1, 1,
0.1589486, -2.270588, 3.762958, 0, 0.4, 1, 1,
0.1606144, -0.8703691, 3.898847, 0, 0.3921569, 1, 1,
0.161063, 0.2994209, 1.262631, 0, 0.3882353, 1, 1,
0.1632108, 0.1412143, 0.4629307, 0, 0.3803922, 1, 1,
0.1655587, -2.740368, 3.637378, 0, 0.3764706, 1, 1,
0.1684665, -0.3923771, 2.553935, 0, 0.3686275, 1, 1,
0.1689043, 0.571033, 2.700551, 0, 0.3647059, 1, 1,
0.1723685, -0.3380668, 1.580278, 0, 0.3568628, 1, 1,
0.1734567, -0.9259437, 3.742187, 0, 0.3529412, 1, 1,
0.177214, -1.402666, 2.466506, 0, 0.345098, 1, 1,
0.1812164, 0.3246834, 0.1174341, 0, 0.3411765, 1, 1,
0.1818506, -0.9981791, 2.931397, 0, 0.3333333, 1, 1,
0.183889, -0.7862325, 3.939676, 0, 0.3294118, 1, 1,
0.1875907, -0.5806069, 1.952681, 0, 0.3215686, 1, 1,
0.1878659, 0.7760721, 0.01192848, 0, 0.3176471, 1, 1,
0.1911739, 0.4531974, -2.717688, 0, 0.3098039, 1, 1,
0.1915694, 0.3240802, -0.9326981, 0, 0.3058824, 1, 1,
0.1916157, -0.2803209, 4.180902, 0, 0.2980392, 1, 1,
0.193437, -0.175376, 3.827935, 0, 0.2901961, 1, 1,
0.1942702, -1.136709, 3.33267, 0, 0.2862745, 1, 1,
0.2029986, 0.1339482, 0.1338412, 0, 0.2784314, 1, 1,
0.2048027, -0.6693276, 2.711195, 0, 0.2745098, 1, 1,
0.2060783, 0.6657734, -0.5444416, 0, 0.2666667, 1, 1,
0.2069864, 0.7085384, 0.5982944, 0, 0.2627451, 1, 1,
0.2099146, 0.2302667, -0.2334619, 0, 0.254902, 1, 1,
0.2135511, 1.724472, -0.4971893, 0, 0.2509804, 1, 1,
0.2154215, -0.644975, 2.148991, 0, 0.2431373, 1, 1,
0.2249533, -0.7291967, 3.490115, 0, 0.2392157, 1, 1,
0.2255162, -0.3689618, 4.205624, 0, 0.2313726, 1, 1,
0.225967, 0.1931297, 0.2165516, 0, 0.227451, 1, 1,
0.2302481, -1.186893, 2.065799, 0, 0.2196078, 1, 1,
0.2325671, 0.69976, 0.4725103, 0, 0.2156863, 1, 1,
0.2370335, -0.1197163, 1.252088, 0, 0.2078431, 1, 1,
0.2373349, 1.084036, -0.3633879, 0, 0.2039216, 1, 1,
0.2382013, -1.131408, 2.07893, 0, 0.1960784, 1, 1,
0.2485551, 0.4341415, 1.937314, 0, 0.1882353, 1, 1,
0.251836, -2.483007, 1.608709, 0, 0.1843137, 1, 1,
0.2531209, -0.4189174, 3.288823, 0, 0.1764706, 1, 1,
0.2533032, -0.6014609, 4.076557, 0, 0.172549, 1, 1,
0.2597387, 0.3793387, 0.0973582, 0, 0.1647059, 1, 1,
0.2617356, 0.3443526, -0.09910643, 0, 0.1607843, 1, 1,
0.2645208, 0.599263, 0.3147784, 0, 0.1529412, 1, 1,
0.2648517, 0.1649924, 0.4463669, 0, 0.1490196, 1, 1,
0.2710004, -1.805963, 3.759253, 0, 0.1411765, 1, 1,
0.273412, 0.1421434, 1.011425, 0, 0.1372549, 1, 1,
0.2743182, -0.7024487, 0.9553861, 0, 0.1294118, 1, 1,
0.2746046, -0.1208467, 0.493574, 0, 0.1254902, 1, 1,
0.2850194, -2.033441, 2.517619, 0, 0.1176471, 1, 1,
0.2893946, -0.6150147, 4.085732, 0, 0.1137255, 1, 1,
0.2899586, -1.434213, 2.607921, 0, 0.1058824, 1, 1,
0.290043, -0.8478551, 1.028287, 0, 0.09803922, 1, 1,
0.2904807, -0.4007991, 1.314869, 0, 0.09411765, 1, 1,
0.2975017, 0.6833092, -1.92147, 0, 0.08627451, 1, 1,
0.2975721, 1.965545, 1.358512, 0, 0.08235294, 1, 1,
0.3022823, 1.633989, 2.444179, 0, 0.07450981, 1, 1,
0.3067083, -0.2625438, 2.82547, 0, 0.07058824, 1, 1,
0.3083811, -0.9094531, 2.399537, 0, 0.0627451, 1, 1,
0.3103255, -0.9761567, 1.553845, 0, 0.05882353, 1, 1,
0.3108648, 0.863237, 0.1861352, 0, 0.05098039, 1, 1,
0.3124359, 1.348923, -0.003537169, 0, 0.04705882, 1, 1,
0.3132991, -1.909392, 2.305172, 0, 0.03921569, 1, 1,
0.3219541, -0.1138138, 1.47562, 0, 0.03529412, 1, 1,
0.3243762, -1.028252, 2.455106, 0, 0.02745098, 1, 1,
0.3257165, -2.3012, 4.561766, 0, 0.02352941, 1, 1,
0.3295853, -2.248258, 3.743533, 0, 0.01568628, 1, 1,
0.3308232, 0.8175018, 1.685693, 0, 0.01176471, 1, 1,
0.3309811, -0.08260128, 0.6909311, 0, 0.003921569, 1, 1,
0.3314977, 1.057395, 0.2427733, 0.003921569, 0, 1, 1,
0.3319793, 0.5660802, -0.6318688, 0.007843138, 0, 1, 1,
0.3326077, -0.510567, 1.798984, 0.01568628, 0, 1, 1,
0.3378138, 1.045992, 0.03254807, 0.01960784, 0, 1, 1,
0.3392502, -0.1955277, 2.994529, 0.02745098, 0, 1, 1,
0.3398331, -1.117059, 2.97687, 0.03137255, 0, 1, 1,
0.3410617, -0.3924012, 1.775793, 0.03921569, 0, 1, 1,
0.3448766, 1.222, -0.04917618, 0.04313726, 0, 1, 1,
0.3495738, 0.2532643, -0.22767, 0.05098039, 0, 1, 1,
0.3570991, -0.952257, 2.754856, 0.05490196, 0, 1, 1,
0.3579, 0.4163585, 0.423072, 0.0627451, 0, 1, 1,
0.360924, 1.58048, -0.9622723, 0.06666667, 0, 1, 1,
0.3635775, -1.380544, 0.06179024, 0.07450981, 0, 1, 1,
0.3646688, -0.55026, 2.458844, 0.07843138, 0, 1, 1,
0.3650072, -0.2463968, 2.334827, 0.08627451, 0, 1, 1,
0.3659038, 0.4515694, 1.240166, 0.09019608, 0, 1, 1,
0.3663527, 0.3020194, 0.6013977, 0.09803922, 0, 1, 1,
0.3704834, 0.0270866, 1.821948, 0.1058824, 0, 1, 1,
0.3742172, -0.2057234, 3.345222, 0.1098039, 0, 1, 1,
0.3751631, -0.2933329, 3.103983, 0.1176471, 0, 1, 1,
0.3754849, -0.2911898, 2.686769, 0.1215686, 0, 1, 1,
0.3755169, 0.4078947, 0.6036279, 0.1294118, 0, 1, 1,
0.3916538, 2.032637, 0.7312516, 0.1333333, 0, 1, 1,
0.3951309, 3.193574, 1.346246, 0.1411765, 0, 1, 1,
0.3979591, -0.4368627, 1.581337, 0.145098, 0, 1, 1,
0.4016597, -0.2090056, 1.486722, 0.1529412, 0, 1, 1,
0.4062796, -1.591758, 1.274847, 0.1568628, 0, 1, 1,
0.4102122, 0.1928521, 2.794429, 0.1647059, 0, 1, 1,
0.4177908, -0.6814463, 3.460091, 0.1686275, 0, 1, 1,
0.4199836, -0.5001337, 3.611468, 0.1764706, 0, 1, 1,
0.4215578, 0.5734269, 1.691783, 0.1803922, 0, 1, 1,
0.4215861, -0.4869298, 5.051638, 0.1882353, 0, 1, 1,
0.4222487, 1.331201, 1.604234, 0.1921569, 0, 1, 1,
0.4227763, 1.169736, 0.3387207, 0.2, 0, 1, 1,
0.4246872, -1.115552, 3.035278, 0.2078431, 0, 1, 1,
0.4269106, -0.6407366, 2.472362, 0.2117647, 0, 1, 1,
0.4276231, 0.9390369, 0.7149801, 0.2196078, 0, 1, 1,
0.4331324, -0.4249867, 2.715521, 0.2235294, 0, 1, 1,
0.436934, 0.5141112, 0.8212122, 0.2313726, 0, 1, 1,
0.4409804, -0.1199581, 2.195393, 0.2352941, 0, 1, 1,
0.4434, 0.8513137, -0.901131, 0.2431373, 0, 1, 1,
0.4451069, 2.074489, -2.228883, 0.2470588, 0, 1, 1,
0.4488431, -1.47336, 3.151467, 0.254902, 0, 1, 1,
0.4519545, 0.6542193, -0.3644937, 0.2588235, 0, 1, 1,
0.4521283, -0.7060819, 2.044528, 0.2666667, 0, 1, 1,
0.45863, -1.234956, 2.641772, 0.2705882, 0, 1, 1,
0.4604215, -1.153728, 2.563586, 0.2784314, 0, 1, 1,
0.4650672, 0.3688459, 0.8663142, 0.282353, 0, 1, 1,
0.4665201, 0.6727033, 1.68409, 0.2901961, 0, 1, 1,
0.467437, 0.7049489, 0.7420453, 0.2941177, 0, 1, 1,
0.4694794, 0.08897222, 2.654265, 0.3019608, 0, 1, 1,
0.4720411, -0.4290526, 2.71109, 0.3098039, 0, 1, 1,
0.4777807, -0.1675655, 2.458254, 0.3137255, 0, 1, 1,
0.4791958, -1.366416, 3.700824, 0.3215686, 0, 1, 1,
0.4829672, -0.4170103, 0.4941853, 0.3254902, 0, 1, 1,
0.4833705, 0.3207051, -0.05380211, 0.3333333, 0, 1, 1,
0.4849991, -0.6921984, 2.346536, 0.3372549, 0, 1, 1,
0.4983973, -0.5295271, 2.536836, 0.345098, 0, 1, 1,
0.5025669, -0.288708, 3.101964, 0.3490196, 0, 1, 1,
0.5026103, -1.190214, 3.97665, 0.3568628, 0, 1, 1,
0.5033079, 1.091765, -0.1442536, 0.3607843, 0, 1, 1,
0.5090178, 0.8583535, 0.04939488, 0.3686275, 0, 1, 1,
0.5096586, 2.061828, 0.08474676, 0.372549, 0, 1, 1,
0.510287, 0.3778418, 0.6085535, 0.3803922, 0, 1, 1,
0.5128263, 1.235182, -1.08738, 0.3843137, 0, 1, 1,
0.5195388, 1.53377, -0.6336071, 0.3921569, 0, 1, 1,
0.5210595, -0.1708506, 2.5463, 0.3960784, 0, 1, 1,
0.523288, 0.6811443, 2.990495, 0.4039216, 0, 1, 1,
0.5236251, -0.8009, 1.481272, 0.4117647, 0, 1, 1,
0.5244949, 1.871793, 1.116676, 0.4156863, 0, 1, 1,
0.5321088, 0.4863298, 1.62121, 0.4235294, 0, 1, 1,
0.5349118, 0.7257786, 1.768999, 0.427451, 0, 1, 1,
0.5461681, 0.9195851, -0.560597, 0.4352941, 0, 1, 1,
0.5499955, 0.9621217, 1.359716, 0.4392157, 0, 1, 1,
0.5563844, -0.2219384, 1.834717, 0.4470588, 0, 1, 1,
0.5613049, 0.2541158, 2.235762, 0.4509804, 0, 1, 1,
0.56955, 1.082287, 1.864712, 0.4588235, 0, 1, 1,
0.578072, -0.5739544, 2.318624, 0.4627451, 0, 1, 1,
0.5852045, 1.410962, -0.1446497, 0.4705882, 0, 1, 1,
0.5854917, 0.5236237, 0.3415044, 0.4745098, 0, 1, 1,
0.5860815, 0.3916003, -0.1033527, 0.4823529, 0, 1, 1,
0.5896586, -1.119451, 3.045007, 0.4862745, 0, 1, 1,
0.589801, 0.832486, 0.7466126, 0.4941176, 0, 1, 1,
0.5931247, -0.8469592, 2.267527, 0.5019608, 0, 1, 1,
0.5954653, -0.6962634, 2.895418, 0.5058824, 0, 1, 1,
0.5960075, 1.314261, 0.5031095, 0.5137255, 0, 1, 1,
0.5971166, -0.1134402, 0.6177348, 0.5176471, 0, 1, 1,
0.6104346, 0.4173005, 0.7352545, 0.5254902, 0, 1, 1,
0.611743, -0.3017312, 2.521089, 0.5294118, 0, 1, 1,
0.6130939, 0.367354, 0.5035449, 0.5372549, 0, 1, 1,
0.6140354, -0.6891719, 2.660176, 0.5411765, 0, 1, 1,
0.6161467, 1.211159, 1.325711, 0.5490196, 0, 1, 1,
0.6333644, -0.2334684, 3.492195, 0.5529412, 0, 1, 1,
0.6391174, -1.002737, 4.81715, 0.5607843, 0, 1, 1,
0.6398854, -1.113997, 1.866164, 0.5647059, 0, 1, 1,
0.6402169, 0.7419034, 2.124907, 0.572549, 0, 1, 1,
0.6473634, -1.027255, 3.499006, 0.5764706, 0, 1, 1,
0.6493533, -0.3954072, 2.680529, 0.5843138, 0, 1, 1,
0.649624, 1.738344, 0.9997916, 0.5882353, 0, 1, 1,
0.6521433, -0.09908363, 1.304132, 0.5960785, 0, 1, 1,
0.6590638, 1.439264, 0.1387838, 0.6039216, 0, 1, 1,
0.6607211, -1.4294, 5.187513, 0.6078432, 0, 1, 1,
0.6615157, -2.413012, 4.493626, 0.6156863, 0, 1, 1,
0.6628966, -0.1775349, 0.8134682, 0.6196079, 0, 1, 1,
0.6638751, -1.302426, 2.192896, 0.627451, 0, 1, 1,
0.6656354, 0.8027466, 1.136033, 0.6313726, 0, 1, 1,
0.6658818, -1.159021, 2.506107, 0.6392157, 0, 1, 1,
0.6693082, 1.094473, 1.701684, 0.6431373, 0, 1, 1,
0.6774811, 0.936183, 0.2939855, 0.6509804, 0, 1, 1,
0.6824506, 0.7030375, 1.524728, 0.654902, 0, 1, 1,
0.6986988, -1.715635, 1.163794, 0.6627451, 0, 1, 1,
0.7032369, -0.848811, 1.683083, 0.6666667, 0, 1, 1,
0.7043426, -0.3039179, 2.468161, 0.6745098, 0, 1, 1,
0.7110731, -1.939375, 3.658063, 0.6784314, 0, 1, 1,
0.7113701, 0.1837899, 1.743546, 0.6862745, 0, 1, 1,
0.7202715, 0.1544707, -0.138365, 0.6901961, 0, 1, 1,
0.7232636, -1.282012, 2.886195, 0.6980392, 0, 1, 1,
0.7302278, 1.114014, 0.6448689, 0.7058824, 0, 1, 1,
0.7331305, 0.9881039, -0.1655762, 0.7098039, 0, 1, 1,
0.7344858, 1.204098, 0.6630894, 0.7176471, 0, 1, 1,
0.7351997, 0.8900765, 2.069747, 0.7215686, 0, 1, 1,
0.7390835, -1.293566, 4.056835, 0.7294118, 0, 1, 1,
0.7404083, 0.6186192, -1.288638, 0.7333333, 0, 1, 1,
0.7545958, 1.272579, 1.155575, 0.7411765, 0, 1, 1,
0.7556919, 0.9987703, 1.230776, 0.7450981, 0, 1, 1,
0.756953, 0.6954281, 0.2593935, 0.7529412, 0, 1, 1,
0.759056, 0.2113703, 2.351122, 0.7568628, 0, 1, 1,
0.7620494, -0.39095, 1.158086, 0.7647059, 0, 1, 1,
0.7684807, -1.988907, 4.585839, 0.7686275, 0, 1, 1,
0.7755663, -0.2758227, 1.342762, 0.7764706, 0, 1, 1,
0.7784979, 1.378838, 0.5533295, 0.7803922, 0, 1, 1,
0.780435, 0.742195, 0.06113813, 0.7882353, 0, 1, 1,
0.7848386, 0.02790926, 0.1475679, 0.7921569, 0, 1, 1,
0.7943556, -0.3531851, 2.807904, 0.8, 0, 1, 1,
0.795874, -0.4829336, 1.32111, 0.8078431, 0, 1, 1,
0.8036511, -1.431804, 3.906832, 0.8117647, 0, 1, 1,
0.8069233, 1.95085, 0.05127943, 0.8196079, 0, 1, 1,
0.8107002, 0.4778828, -0.4294464, 0.8235294, 0, 1, 1,
0.8137907, 0.3291748, 1.532913, 0.8313726, 0, 1, 1,
0.8140045, 0.5926581, 0.2387234, 0.8352941, 0, 1, 1,
0.817028, 0.4144979, 0.03317327, 0.8431373, 0, 1, 1,
0.8192291, 0.1606558, 1.843506, 0.8470588, 0, 1, 1,
0.8195797, -0.4588968, 3.61689, 0.854902, 0, 1, 1,
0.8281111, -0.7341442, 2.523556, 0.8588235, 0, 1, 1,
0.8321999, -0.1226571, 1.683353, 0.8666667, 0, 1, 1,
0.8359904, 1.585543, -0.3716787, 0.8705882, 0, 1, 1,
0.836123, -0.2047728, 1.16569, 0.8784314, 0, 1, 1,
0.837002, 0.1227901, 1.540283, 0.8823529, 0, 1, 1,
0.8408962, 1.806114, -1.093746, 0.8901961, 0, 1, 1,
0.8426766, -1.032858, 2.149844, 0.8941177, 0, 1, 1,
0.8453323, 0.4430533, -0.06012074, 0.9019608, 0, 1, 1,
0.8464898, 0.5376928, 2.669635, 0.9098039, 0, 1, 1,
0.8490174, -0.5121729, 1.90036, 0.9137255, 0, 1, 1,
0.8517447, -1.394907, 1.723775, 0.9215686, 0, 1, 1,
0.8535464, 0.4815204, 1.661218, 0.9254902, 0, 1, 1,
0.8558723, 0.7094169, -0.5884683, 0.9333333, 0, 1, 1,
0.860082, -1.284916, 4.505607, 0.9372549, 0, 1, 1,
0.8621429, 0.07107222, 2.961272, 0.945098, 0, 1, 1,
0.8843433, -0.6294243, 3.874368, 0.9490196, 0, 1, 1,
0.8939291, 1.421145, 1.633172, 0.9568627, 0, 1, 1,
0.8968585, 0.06050136, 1.371635, 0.9607843, 0, 1, 1,
0.8976106, -0.878737, 2.708208, 0.9686275, 0, 1, 1,
0.8979644, 0.9750278, 0.8587829, 0.972549, 0, 1, 1,
0.9006183, -0.5947083, 2.169729, 0.9803922, 0, 1, 1,
0.9187308, -0.4712567, 2.644201, 0.9843137, 0, 1, 1,
0.9205471, 1.559595, 0.5008031, 0.9921569, 0, 1, 1,
0.9360453, 0.6420501, 1.484865, 0.9960784, 0, 1, 1,
0.9399521, 0.08153809, 3.280999, 1, 0, 0.9960784, 1,
0.9403734, -1.411763, 2.079446, 1, 0, 0.9882353, 1,
0.959541, 0.4900387, 0.9365562, 1, 0, 0.9843137, 1,
0.9714313, 1.081605, -1.930346, 1, 0, 0.9764706, 1,
0.9735278, 0.4212439, 0.383959, 1, 0, 0.972549, 1,
0.9774812, 0.1491383, 1.627548, 1, 0, 0.9647059, 1,
0.9778889, -1.118525, 2.26055, 1, 0, 0.9607843, 1,
0.9820342, 1.19918, 0.04676356, 1, 0, 0.9529412, 1,
0.9871593, -0.1951709, 1.615142, 1, 0, 0.9490196, 1,
0.9918542, -0.1993988, 1.685174, 1, 0, 0.9411765, 1,
0.9925163, 0.7105381, 1.027843, 1, 0, 0.9372549, 1,
0.9942822, -2.114209, 4.293497, 1, 0, 0.9294118, 1,
1.007306, 0.6615456, 0.6088827, 1, 0, 0.9254902, 1,
1.009095, -0.1181038, 2.304027, 1, 0, 0.9176471, 1,
1.019948, 1.654029, 2.004544, 1, 0, 0.9137255, 1,
1.021325, -0.4215887, 0.9282504, 1, 0, 0.9058824, 1,
1.021794, -0.4779913, 2.965257, 1, 0, 0.9019608, 1,
1.026246, 0.1220362, 2.17816, 1, 0, 0.8941177, 1,
1.026705, -1.268729, 3.302258, 1, 0, 0.8862745, 1,
1.029593, -1.221715, 2.957653, 1, 0, 0.8823529, 1,
1.029595, -0.8371423, 2.107381, 1, 0, 0.8745098, 1,
1.037785, 0.1644261, 2.288371, 1, 0, 0.8705882, 1,
1.041071, -0.7015394, 3.188322, 1, 0, 0.8627451, 1,
1.049703, 0.5434763, 0.7639453, 1, 0, 0.8588235, 1,
1.051709, -0.8344831, 2.464854, 1, 0, 0.8509804, 1,
1.051821, 0.6309697, -0.07572493, 1, 0, 0.8470588, 1,
1.067948, -0.2148627, 2.403313, 1, 0, 0.8392157, 1,
1.074361, -2.240453, 2.002572, 1, 0, 0.8352941, 1,
1.07722, 1.978748, -0.09201443, 1, 0, 0.827451, 1,
1.080915, -0.1617143, 2.575635, 1, 0, 0.8235294, 1,
1.083917, -0.7112191, 2.532048, 1, 0, 0.8156863, 1,
1.091467, 0.2781647, 1.030485, 1, 0, 0.8117647, 1,
1.092247, -0.5852605, 4.100803, 1, 0, 0.8039216, 1,
1.099823, 0.2188691, 0.2302365, 1, 0, 0.7960784, 1,
1.101195, -1.089066, 2.650249, 1, 0, 0.7921569, 1,
1.107261, -0.783708, 1.127484, 1, 0, 0.7843137, 1,
1.108514, 0.08559631, -0.4844143, 1, 0, 0.7803922, 1,
1.111819, -0.9462479, 3.526002, 1, 0, 0.772549, 1,
1.11571, 0.6105331, 1.465472, 1, 0, 0.7686275, 1,
1.121543, -0.07886736, 2.530118, 1, 0, 0.7607843, 1,
1.126293, -0.8072047, 3.396956, 1, 0, 0.7568628, 1,
1.14187, 0.2746262, 2.003772, 1, 0, 0.7490196, 1,
1.170677, -0.4921224, 2.799392, 1, 0, 0.7450981, 1,
1.174841, 0.06961174, 2.314103, 1, 0, 0.7372549, 1,
1.176166, -2.3029, 3.045976, 1, 0, 0.7333333, 1,
1.187653, -2.15521, 4.028313, 1, 0, 0.7254902, 1,
1.190763, 0.4578488, -0.2069315, 1, 0, 0.7215686, 1,
1.196885, -0.3984682, 3.000986, 1, 0, 0.7137255, 1,
1.198667, 0.4672717, 1.947189, 1, 0, 0.7098039, 1,
1.200317, 0.6119978, 2.033654, 1, 0, 0.7019608, 1,
1.206438, -1.168261, 2.54267, 1, 0, 0.6941177, 1,
1.217114, -0.6934375, 2.523005, 1, 0, 0.6901961, 1,
1.218472, 0.4487167, 1.210792, 1, 0, 0.682353, 1,
1.220018, 0.0194298, 2.823597, 1, 0, 0.6784314, 1,
1.223318, 0.8030728, -1.883065, 1, 0, 0.6705883, 1,
1.225971, -2.25086, 0.8510779, 1, 0, 0.6666667, 1,
1.230689, 0.7594285, 0.2860873, 1, 0, 0.6588235, 1,
1.237737, 1.449497, 0.955601, 1, 0, 0.654902, 1,
1.238533, 0.9976487, 2.346335, 1, 0, 0.6470588, 1,
1.239816, 1.022596, 0.295687, 1, 0, 0.6431373, 1,
1.254089, 0.7213349, -0.2304246, 1, 0, 0.6352941, 1,
1.255262, -0.3969775, 1.943645, 1, 0, 0.6313726, 1,
1.266296, -0.1258332, 2.348645, 1, 0, 0.6235294, 1,
1.271515, 0.2900871, 1.58734, 1, 0, 0.6196079, 1,
1.272351, 1.320714, 0.2215571, 1, 0, 0.6117647, 1,
1.280486, -0.7629261, 3.389634, 1, 0, 0.6078432, 1,
1.289573, 0.0532618, 2.829288, 1, 0, 0.6, 1,
1.29751, 0.3233057, 2.006968, 1, 0, 0.5921569, 1,
1.300584, -0.05777279, 1.774492, 1, 0, 0.5882353, 1,
1.301742, -0.03684919, 1.043956, 1, 0, 0.5803922, 1,
1.303701, 0.5439407, 2.12686, 1, 0, 0.5764706, 1,
1.308664, -0.9858575, 2.869862, 1, 0, 0.5686275, 1,
1.318155, 1.380983, 1.063203, 1, 0, 0.5647059, 1,
1.321373, 0.5376558, 1.121967, 1, 0, 0.5568628, 1,
1.333923, -1.021184, 4.421806, 1, 0, 0.5529412, 1,
1.358203, 0.5995748, 1.990391, 1, 0, 0.5450981, 1,
1.361618, 0.8206882, 3.274369, 1, 0, 0.5411765, 1,
1.397195, 0.6512768, 0.4692009, 1, 0, 0.5333334, 1,
1.397742, -1.761983, 3.070389, 1, 0, 0.5294118, 1,
1.397898, 1.834229, -1.694733, 1, 0, 0.5215687, 1,
1.400357, 1.660256, -1.009832, 1, 0, 0.5176471, 1,
1.400831, 1.094354, 1.891086, 1, 0, 0.509804, 1,
1.410816, -0.8052295, 1.61723, 1, 0, 0.5058824, 1,
1.425561, 0.6621217, 0.5150693, 1, 0, 0.4980392, 1,
1.42612, -1.360415, 1.15784, 1, 0, 0.4901961, 1,
1.429812, -1.358522, 1.296641, 1, 0, 0.4862745, 1,
1.436212, -0.3380704, 1.328812, 1, 0, 0.4784314, 1,
1.444786, 0.4202158, 1.048945, 1, 0, 0.4745098, 1,
1.466827, -0.3566599, 2.365428, 1, 0, 0.4666667, 1,
1.468832, -0.6632092, 2.274096, 1, 0, 0.4627451, 1,
1.468857, -0.3751118, 2.911811, 1, 0, 0.454902, 1,
1.469659, -1.740405, 2.821784, 1, 0, 0.4509804, 1,
1.485565, -2.585375, 0.1034216, 1, 0, 0.4431373, 1,
1.491594, -0.06779878, 1.833348, 1, 0, 0.4392157, 1,
1.497715, -0.1222978, 0.4471678, 1, 0, 0.4313726, 1,
1.499704, 0.710674, 1.028051, 1, 0, 0.427451, 1,
1.503098, -0.4023058, 2.65608, 1, 0, 0.4196078, 1,
1.50551, 0.5425334, -0.2941875, 1, 0, 0.4156863, 1,
1.512377, 0.8246295, 2.231913, 1, 0, 0.4078431, 1,
1.513618, 0.1494934, 0.7484454, 1, 0, 0.4039216, 1,
1.514625, -0.6407889, 2.114072, 1, 0, 0.3960784, 1,
1.53003, 1.217929, -0.04395894, 1, 0, 0.3882353, 1,
1.534251, -2.05404, 3.012218, 1, 0, 0.3843137, 1,
1.5388, 0.8386984, 3.501629, 1, 0, 0.3764706, 1,
1.548159, -1.405426, 3.419857, 1, 0, 0.372549, 1,
1.550185, -0.08020071, 2.85054, 1, 0, 0.3647059, 1,
1.55321, 0.8009276, 2.521845, 1, 0, 0.3607843, 1,
1.560943, -0.4187026, 1.670366, 1, 0, 0.3529412, 1,
1.580505, -1.956516, 1.914793, 1, 0, 0.3490196, 1,
1.607806, -1.000091, 1.613276, 1, 0, 0.3411765, 1,
1.624107, 0.4578058, -0.8218594, 1, 0, 0.3372549, 1,
1.625298, -2.2631, 2.289374, 1, 0, 0.3294118, 1,
1.628324, 1.185333, 1.369376, 1, 0, 0.3254902, 1,
1.635802, 0.6322352, 3.168014, 1, 0, 0.3176471, 1,
1.636211, 1.206861, 0.669837, 1, 0, 0.3137255, 1,
1.640863, -0.716872, 0.9336014, 1, 0, 0.3058824, 1,
1.642117, -0.9237943, 2.629045, 1, 0, 0.2980392, 1,
1.642482, 1.057112, 0.7906814, 1, 0, 0.2941177, 1,
1.656024, -0.1825635, 1.127938, 1, 0, 0.2862745, 1,
1.664887, 0.7752966, -0.5965778, 1, 0, 0.282353, 1,
1.667662, 0.9416369, 0.8144241, 1, 0, 0.2745098, 1,
1.668314, 0.38097, -0.06734708, 1, 0, 0.2705882, 1,
1.693806, 0.4707614, 0.8658036, 1, 0, 0.2627451, 1,
1.70315, 2.124209, 0.7512694, 1, 0, 0.2588235, 1,
1.710876, -0.7892872, 5.046143, 1, 0, 0.2509804, 1,
1.714994, -0.2706202, 1.513155, 1, 0, 0.2470588, 1,
1.716132, 0.5011758, 1.531883, 1, 0, 0.2392157, 1,
1.748666, -2.09295, 0.9855676, 1, 0, 0.2352941, 1,
1.763389, 1.479742, 0.6151512, 1, 0, 0.227451, 1,
1.777629, 0.9301991, 0.5524282, 1, 0, 0.2235294, 1,
1.783944, -0.7021752, 1.748447, 1, 0, 0.2156863, 1,
1.787913, 0.2122797, 1.985285, 1, 0, 0.2117647, 1,
1.855253, -0.3673006, 1.897992, 1, 0, 0.2039216, 1,
1.88164, 0.9350029, 0.6490259, 1, 0, 0.1960784, 1,
1.895992, 1.666976, 1.600385, 1, 0, 0.1921569, 1,
1.898493, -0.7615825, 0.8149447, 1, 0, 0.1843137, 1,
1.92956, -0.8673169, 0.2346122, 1, 0, 0.1803922, 1,
1.93208, -0.9209751, 1.974821, 1, 0, 0.172549, 1,
1.946325, 0.6823056, 2.900567, 1, 0, 0.1686275, 1,
2.001687, -0.9645686, 3.178538, 1, 0, 0.1607843, 1,
2.010523, 3.382219, -0.4502601, 1, 0, 0.1568628, 1,
2.018836, 1.2698, 0.6570722, 1, 0, 0.1490196, 1,
2.034618, 0.579452, 1.308813, 1, 0, 0.145098, 1,
2.037595, 0.6913052, 1.358898, 1, 0, 0.1372549, 1,
2.073667, 0.6086973, 0.9471191, 1, 0, 0.1333333, 1,
2.102145, 0.5435114, 0.9718871, 1, 0, 0.1254902, 1,
2.120018, 0.05664438, 1.02632, 1, 0, 0.1215686, 1,
2.132442, 0.1348695, 0.8150101, 1, 0, 0.1137255, 1,
2.17812, -0.0428419, 1.793891, 1, 0, 0.1098039, 1,
2.196478, -0.5159735, -0.1768999, 1, 0, 0.1019608, 1,
2.250125, 0.2670083, 1.485626, 1, 0, 0.09411765, 1,
2.255619, 0.1474975, 3.195168, 1, 0, 0.09019608, 1,
2.354799, -0.1679238, 1.275374, 1, 0, 0.08235294, 1,
2.362936, -0.1703382, 1.806723, 1, 0, 0.07843138, 1,
2.390055, -0.7844376, 1.493909, 1, 0, 0.07058824, 1,
2.396543, 1.508231, 0.4576533, 1, 0, 0.06666667, 1,
2.43144, -2.425685, 2.193514, 1, 0, 0.05882353, 1,
2.506014, 0.04012612, 2.41988, 1, 0, 0.05490196, 1,
2.536684, 0.3123045, 2.295342, 1, 0, 0.04705882, 1,
2.568714, 0.3020278, 0.8331096, 1, 0, 0.04313726, 1,
2.600304, 2.461402, 4.863015, 1, 0, 0.03529412, 1,
2.614015, 0.09850904, 2.045886, 1, 0, 0.03137255, 1,
2.646643, 0.0005386043, 2.336772, 1, 0, 0.02352941, 1,
2.724751, 0.6814576, 2.541347, 1, 0, 0.01960784, 1,
2.880692, 0.6095141, 1.886884, 1, 0, 0.01176471, 1,
2.94014, 1.452875, 1.263057, 1, 0, 0.007843138, 1
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
0.05811918, -3.867979, -6.371686, 0, -0.5, 0.5, 0.5,
0.05811918, -3.867979, -6.371686, 1, -0.5, 0.5, 0.5,
0.05811918, -3.867979, -6.371686, 1, 1.5, 0.5, 0.5,
0.05811918, -3.867979, -6.371686, 0, 1.5, 0.5, 0.5
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
-3.800906, 0.2825189, -6.371686, 0, -0.5, 0.5, 0.5,
-3.800906, 0.2825189, -6.371686, 1, -0.5, 0.5, 0.5,
-3.800906, 0.2825189, -6.371686, 1, 1.5, 0.5, 0.5,
-3.800906, 0.2825189, -6.371686, 0, 1.5, 0.5, 0.5
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
-3.800906, -3.867979, 0.2455726, 0, -0.5, 0.5, 0.5,
-3.800906, -3.867979, 0.2455726, 1, -0.5, 0.5, 0.5,
-3.800906, -3.867979, 0.2455726, 1, 1.5, 0.5, 0.5,
-3.800906, -3.867979, 0.2455726, 0, 1.5, 0.5, 0.5
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
-2, -2.910172, -4.844626,
2, -2.910172, -4.844626,
-2, -2.910172, -4.844626,
-2, -3.069807, -5.099136,
-1, -2.910172, -4.844626,
-1, -3.069807, -5.099136,
0, -2.910172, -4.844626,
0, -3.069807, -5.099136,
1, -2.910172, -4.844626,
1, -3.069807, -5.099136,
2, -2.910172, -4.844626,
2, -3.069807, -5.099136
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
-2, -3.389076, -5.608156, 0, -0.5, 0.5, 0.5,
-2, -3.389076, -5.608156, 1, -0.5, 0.5, 0.5,
-2, -3.389076, -5.608156, 1, 1.5, 0.5, 0.5,
-2, -3.389076, -5.608156, 0, 1.5, 0.5, 0.5,
-1, -3.389076, -5.608156, 0, -0.5, 0.5, 0.5,
-1, -3.389076, -5.608156, 1, -0.5, 0.5, 0.5,
-1, -3.389076, -5.608156, 1, 1.5, 0.5, 0.5,
-1, -3.389076, -5.608156, 0, 1.5, 0.5, 0.5,
0, -3.389076, -5.608156, 0, -0.5, 0.5, 0.5,
0, -3.389076, -5.608156, 1, -0.5, 0.5, 0.5,
0, -3.389076, -5.608156, 1, 1.5, 0.5, 0.5,
0, -3.389076, -5.608156, 0, 1.5, 0.5, 0.5,
1, -3.389076, -5.608156, 0, -0.5, 0.5, 0.5,
1, -3.389076, -5.608156, 1, -0.5, 0.5, 0.5,
1, -3.389076, -5.608156, 1, 1.5, 0.5, 0.5,
1, -3.389076, -5.608156, 0, 1.5, 0.5, 0.5,
2, -3.389076, -5.608156, 0, -0.5, 0.5, 0.5,
2, -3.389076, -5.608156, 1, -0.5, 0.5, 0.5,
2, -3.389076, -5.608156, 1, 1.5, 0.5, 0.5,
2, -3.389076, -5.608156, 0, 1.5, 0.5, 0.5
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
-2.910362, -2, -4.844626,
-2.910362, 3, -4.844626,
-2.910362, -2, -4.844626,
-3.058786, -2, -5.099136,
-2.910362, -1, -4.844626,
-3.058786, -1, -5.099136,
-2.910362, 0, -4.844626,
-3.058786, 0, -5.099136,
-2.910362, 1, -4.844626,
-3.058786, 1, -5.099136,
-2.910362, 2, -4.844626,
-3.058786, 2, -5.099136,
-2.910362, 3, -4.844626,
-3.058786, 3, -5.099136
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
-3.355634, -2, -5.608156, 0, -0.5, 0.5, 0.5,
-3.355634, -2, -5.608156, 1, -0.5, 0.5, 0.5,
-3.355634, -2, -5.608156, 1, 1.5, 0.5, 0.5,
-3.355634, -2, -5.608156, 0, 1.5, 0.5, 0.5,
-3.355634, -1, -5.608156, 0, -0.5, 0.5, 0.5,
-3.355634, -1, -5.608156, 1, -0.5, 0.5, 0.5,
-3.355634, -1, -5.608156, 1, 1.5, 0.5, 0.5,
-3.355634, -1, -5.608156, 0, 1.5, 0.5, 0.5,
-3.355634, 0, -5.608156, 0, -0.5, 0.5, 0.5,
-3.355634, 0, -5.608156, 1, -0.5, 0.5, 0.5,
-3.355634, 0, -5.608156, 1, 1.5, 0.5, 0.5,
-3.355634, 0, -5.608156, 0, 1.5, 0.5, 0.5,
-3.355634, 1, -5.608156, 0, -0.5, 0.5, 0.5,
-3.355634, 1, -5.608156, 1, -0.5, 0.5, 0.5,
-3.355634, 1, -5.608156, 1, 1.5, 0.5, 0.5,
-3.355634, 1, -5.608156, 0, 1.5, 0.5, 0.5,
-3.355634, 2, -5.608156, 0, -0.5, 0.5, 0.5,
-3.355634, 2, -5.608156, 1, -0.5, 0.5, 0.5,
-3.355634, 2, -5.608156, 1, 1.5, 0.5, 0.5,
-3.355634, 2, -5.608156, 0, 1.5, 0.5, 0.5,
-3.355634, 3, -5.608156, 0, -0.5, 0.5, 0.5,
-3.355634, 3, -5.608156, 1, -0.5, 0.5, 0.5,
-3.355634, 3, -5.608156, 1, 1.5, 0.5, 0.5,
-3.355634, 3, -5.608156, 0, 1.5, 0.5, 0.5
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
-2.910362, -2.910172, -4,
-2.910362, -2.910172, 4,
-2.910362, -2.910172, -4,
-3.058786, -3.069807, -4,
-2.910362, -2.910172, -2,
-3.058786, -3.069807, -2,
-2.910362, -2.910172, 0,
-3.058786, -3.069807, 0,
-2.910362, -2.910172, 2,
-3.058786, -3.069807, 2,
-2.910362, -2.910172, 4,
-3.058786, -3.069807, 4
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
-3.355634, -3.389076, -4, 0, -0.5, 0.5, 0.5,
-3.355634, -3.389076, -4, 1, -0.5, 0.5, 0.5,
-3.355634, -3.389076, -4, 1, 1.5, 0.5, 0.5,
-3.355634, -3.389076, -4, 0, 1.5, 0.5, 0.5,
-3.355634, -3.389076, -2, 0, -0.5, 0.5, 0.5,
-3.355634, -3.389076, -2, 1, -0.5, 0.5, 0.5,
-3.355634, -3.389076, -2, 1, 1.5, 0.5, 0.5,
-3.355634, -3.389076, -2, 0, 1.5, 0.5, 0.5,
-3.355634, -3.389076, 0, 0, -0.5, 0.5, 0.5,
-3.355634, -3.389076, 0, 1, -0.5, 0.5, 0.5,
-3.355634, -3.389076, 0, 1, 1.5, 0.5, 0.5,
-3.355634, -3.389076, 0, 0, 1.5, 0.5, 0.5,
-3.355634, -3.389076, 2, 0, -0.5, 0.5, 0.5,
-3.355634, -3.389076, 2, 1, -0.5, 0.5, 0.5,
-3.355634, -3.389076, 2, 1, 1.5, 0.5, 0.5,
-3.355634, -3.389076, 2, 0, 1.5, 0.5, 0.5,
-3.355634, -3.389076, 4, 0, -0.5, 0.5, 0.5,
-3.355634, -3.389076, 4, 1, -0.5, 0.5, 0.5,
-3.355634, -3.389076, 4, 1, 1.5, 0.5, 0.5,
-3.355634, -3.389076, 4, 0, 1.5, 0.5, 0.5
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
-2.910362, -2.910172, -4.844626,
-2.910362, 3.47521, -4.844626,
-2.910362, -2.910172, 5.335771,
-2.910362, 3.47521, 5.335771,
-2.910362, -2.910172, -4.844626,
-2.910362, -2.910172, 5.335771,
-2.910362, 3.47521, -4.844626,
-2.910362, 3.47521, 5.335771,
-2.910362, -2.910172, -4.844626,
3.0266, -2.910172, -4.844626,
-2.910362, -2.910172, 5.335771,
3.0266, -2.910172, 5.335771,
-2.910362, 3.47521, -4.844626,
3.0266, 3.47521, -4.844626,
-2.910362, 3.47521, 5.335771,
3.0266, 3.47521, 5.335771,
3.0266, -2.910172, -4.844626,
3.0266, 3.47521, -4.844626,
3.0266, -2.910172, 5.335771,
3.0266, 3.47521, 5.335771,
3.0266, -2.910172, -4.844626,
3.0266, -2.910172, 5.335771,
3.0266, 3.47521, -4.844626,
3.0266, 3.47521, 5.335771
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
var radius = 7.157354;
var distance = 31.84388;
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
mvMatrix.translate( -0.05811918, -0.2825189, -0.2455726 );
mvMatrix.scale( 1.303473, 1.211936, 0.7601542 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.84388);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
quizalofop<-read.table("quizalofop.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quizalofop$V2
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
```

```r
y<-quizalofop$V3
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
```

```r
z<-quizalofop$V4
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
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
-2.823901, -0.609124, -1.902425, 0, 0, 1, 1, 1,
-2.79571, -0.540072, -1.979531, 1, 0, 0, 1, 1,
-2.693564, -0.2688062, -0.9141745, 1, 0, 0, 1, 1,
-2.555245, -0.07871392, -1.735005, 1, 0, 0, 1, 1,
-2.554577, 0.6228659, -2.310234, 1, 0, 0, 1, 1,
-2.470515, 0.7602671, -1.373032, 1, 0, 0, 1, 1,
-2.338511, 0.1775831, -2.091091, 0, 0, 0, 1, 1,
-2.336365, -1.381661, -1.872256, 0, 0, 0, 1, 1,
-2.295132, 1.445472, -1.068325, 0, 0, 0, 1, 1,
-2.293157, 0.4657799, -2.834711, 0, 0, 0, 1, 1,
-2.26834, -0.9572642, -1.426749, 0, 0, 0, 1, 1,
-2.241812, 0.9604855, -1.90778, 0, 0, 0, 1, 1,
-2.216216, 0.2204835, -3.414321, 0, 0, 0, 1, 1,
-2.215491, -2.817181, -1.913939, 1, 1, 1, 1, 1,
-2.130226, -2.218953, -2.649362, 1, 1, 1, 1, 1,
-2.066712, -1.125301, 0.5817327, 1, 1, 1, 1, 1,
-2.064002, 0.2086254, -0.8544198, 1, 1, 1, 1, 1,
-2.056474, -0.1133051, -1.324656, 1, 1, 1, 1, 1,
-2.045239, 0.2069238, -2.404086, 1, 1, 1, 1, 1,
-2.036869, 0.2957165, -2.181126, 1, 1, 1, 1, 1,
-2.016978, -2.620226, -1.980684, 1, 1, 1, 1, 1,
-1.996126, -1.035228, -1.849669, 1, 1, 1, 1, 1,
-1.991545, 0.2692959, -0.1760909, 1, 1, 1, 1, 1,
-1.984641, -1.851911, -1.153154, 1, 1, 1, 1, 1,
-1.974808, 0.2298247, -1.426045, 1, 1, 1, 1, 1,
-1.974272, -1.577693, -2.822115, 1, 1, 1, 1, 1,
-1.973401, -0.8773053, 0.2194864, 1, 1, 1, 1, 1,
-1.927327, -0.3838134, -2.095967, 1, 1, 1, 1, 1,
-1.925497, 0.7845365, 0.5766234, 0, 0, 1, 1, 1,
-1.916681, 0.7191289, 0.2934196, 1, 0, 0, 1, 1,
-1.911199, -0.461706, -1.007738, 1, 0, 0, 1, 1,
-1.895954, 0.8817357, -1.381103, 1, 0, 0, 1, 1,
-1.890007, 0.6412488, -1.731916, 1, 0, 0, 1, 1,
-1.8716, 0.4088113, -1.077054, 1, 0, 0, 1, 1,
-1.841319, 0.6013036, -1.087038, 0, 0, 0, 1, 1,
-1.834488, -0.533426, -3.873947, 0, 0, 0, 1, 1,
-1.820021, -0.8711517, -2.186615, 0, 0, 0, 1, 1,
-1.817932, 1.007375, -1.098318, 0, 0, 0, 1, 1,
-1.797686, 1.109778, -3.098948, 0, 0, 0, 1, 1,
-1.786635, -0.0270062, -1.826508, 0, 0, 0, 1, 1,
-1.7866, 1.050875, -1.99716, 0, 0, 0, 1, 1,
-1.782407, -0.6301076, -3.068995, 1, 1, 1, 1, 1,
-1.742198, 0.5237606, -1.83441, 1, 1, 1, 1, 1,
-1.724685, 0.4517398, 0.0415624, 1, 1, 1, 1, 1,
-1.678293, -0.4817009, -1.136791, 1, 1, 1, 1, 1,
-1.64775, 0.06189225, -1.28999, 1, 1, 1, 1, 1,
-1.642529, -0.1219598, -1.811257, 1, 1, 1, 1, 1,
-1.640294, -0.1565953, -1.495157, 1, 1, 1, 1, 1,
-1.628576, 2.264146, -2.716176, 1, 1, 1, 1, 1,
-1.593153, 1.095588, -1.633755, 1, 1, 1, 1, 1,
-1.566065, -0.4862621, -0.5513002, 1, 1, 1, 1, 1,
-1.56487, -1.235807, -2.556401, 1, 1, 1, 1, 1,
-1.55807, 1.328356, -1.135877, 1, 1, 1, 1, 1,
-1.548412, 1.479647, -0.6252792, 1, 1, 1, 1, 1,
-1.53669, -1.041494, -0.5405777, 1, 1, 1, 1, 1,
-1.533994, -0.802933, -2.110199, 1, 1, 1, 1, 1,
-1.519944, -1.03501, -3.190268, 0, 0, 1, 1, 1,
-1.519558, 1.449211, -0.9336022, 1, 0, 0, 1, 1,
-1.505814, -1.856101, -3.456036, 1, 0, 0, 1, 1,
-1.502969, -0.645158, -3.420321, 1, 0, 0, 1, 1,
-1.48979, 0.7218596, -0.6487021, 1, 0, 0, 1, 1,
-1.483797, 0.06206768, -2.029305, 1, 0, 0, 1, 1,
-1.475102, 0.5821213, -0.3755535, 0, 0, 0, 1, 1,
-1.474586, -1.109334, -1.662779, 0, 0, 0, 1, 1,
-1.472233, -0.6351659, -2.303871, 0, 0, 0, 1, 1,
-1.465241, -1.792907, -2.661533, 0, 0, 0, 1, 1,
-1.447989, -0.152218, -0.7558825, 0, 0, 0, 1, 1,
-1.447204, -0.3718109, -2.243711, 0, 0, 0, 1, 1,
-1.44673, 0.4669646, 0.9231109, 0, 0, 0, 1, 1,
-1.445818, -0.7391728, -0.724106, 1, 1, 1, 1, 1,
-1.421981, -0.777709, 0.4048807, 1, 1, 1, 1, 1,
-1.414153, 0.4298183, -3.738683, 1, 1, 1, 1, 1,
-1.406065, -1.528424, -1.586903, 1, 1, 1, 1, 1,
-1.400451, -0.8039162, -2.165301, 1, 1, 1, 1, 1,
-1.39974, -1.372455, -0.3954583, 1, 1, 1, 1, 1,
-1.385526, 0.1262576, -2.410691, 1, 1, 1, 1, 1,
-1.378156, -2.012225, -3.794201, 1, 1, 1, 1, 1,
-1.375004, 0.4402211, -2.483695, 1, 1, 1, 1, 1,
-1.373197, 0.4544131, -2.629258, 1, 1, 1, 1, 1,
-1.354688, 1.135002, -0.6027352, 1, 1, 1, 1, 1,
-1.352576, -0.2329954, -0.973437, 1, 1, 1, 1, 1,
-1.336982, -0.9137735, -2.527329, 1, 1, 1, 1, 1,
-1.319437, 0.7236546, -2.29837, 1, 1, 1, 1, 1,
-1.319007, -0.192032, -0.9748732, 1, 1, 1, 1, 1,
-1.313068, 0.7576844, -0.83318, 0, 0, 1, 1, 1,
-1.305164, -0.2617673, -0.7313943, 1, 0, 0, 1, 1,
-1.301986, 0.004758508, -1.04753, 1, 0, 0, 1, 1,
-1.299618, 0.5253356, -1.917044, 1, 0, 0, 1, 1,
-1.294879, -0.8703809, -1.802842, 1, 0, 0, 1, 1,
-1.289676, 1.122884, 1.167446, 1, 0, 0, 1, 1,
-1.288059, -0.5724054, -1.830879, 0, 0, 0, 1, 1,
-1.287524, -1.015296, -4.364552, 0, 0, 0, 1, 1,
-1.277792, -0.3070285, -3.565547, 0, 0, 0, 1, 1,
-1.275435, 0.3652466, -1.673918, 0, 0, 0, 1, 1,
-1.274651, 0.746544, -0.9420323, 0, 0, 0, 1, 1,
-1.27368, -0.9821898, -1.888392, 0, 0, 0, 1, 1,
-1.270961, -0.8522174, -2.535121, 0, 0, 0, 1, 1,
-1.264685, -0.3004047, -1.651612, 1, 1, 1, 1, 1,
-1.258307, 0.1567131, -2.555102, 1, 1, 1, 1, 1,
-1.258301, -0.6309708, -3.210775, 1, 1, 1, 1, 1,
-1.254122, -0.8878088, -0.9857751, 1, 1, 1, 1, 1,
-1.253734, 0.5247527, -0.9497141, 1, 1, 1, 1, 1,
-1.249659, -0.9175801, -2.974669, 1, 1, 1, 1, 1,
-1.248267, -0.6199574, -1.362194, 1, 1, 1, 1, 1,
-1.240226, -1.274349, -3.797118, 1, 1, 1, 1, 1,
-1.231743, 0.1125847, -2.476282, 1, 1, 1, 1, 1,
-1.231071, -0.2965232, -1.685779, 1, 1, 1, 1, 1,
-1.230444, 1.440305, -0.6902982, 1, 1, 1, 1, 1,
-1.228651, 1.223833, -3.349499, 1, 1, 1, 1, 1,
-1.22618, -1.618304, -2.034839, 1, 1, 1, 1, 1,
-1.220402, -1.213267, -1.420343, 1, 1, 1, 1, 1,
-1.216988, -0.3245171, -1.429503, 1, 1, 1, 1, 1,
-1.202508, -1.549225, -2.211436, 0, 0, 1, 1, 1,
-1.199223, -1.248554, -2.140812, 1, 0, 0, 1, 1,
-1.197035, -1.313375, -2.249653, 1, 0, 0, 1, 1,
-1.193112, 1.328482, 0.2556231, 1, 0, 0, 1, 1,
-1.183874, -0.3634866, -2.146102, 1, 0, 0, 1, 1,
-1.169279, 0.8679023, -1.450389, 1, 0, 0, 1, 1,
-1.152774, -1.268649, -2.725914, 0, 0, 0, 1, 1,
-1.150194, 0.6241351, -1.663915, 0, 0, 0, 1, 1,
-1.137001, -0.7177078, -2.545475, 0, 0, 0, 1, 1,
-1.134961, -1.439161, -4.334893, 0, 0, 0, 1, 1,
-1.13285, 0.4691987, -0.8921744, 0, 0, 0, 1, 1,
-1.13156, -0.988597, -3.94512, 0, 0, 0, 1, 1,
-1.131227, 1.799127, -0.5007073, 0, 0, 0, 1, 1,
-1.129352, 0.6336442, -1.949994, 1, 1, 1, 1, 1,
-1.128685, -1.70549, -2.931845, 1, 1, 1, 1, 1,
-1.128385, 0.1580585, -1.059034, 1, 1, 1, 1, 1,
-1.124556, -1.063208, -2.516136, 1, 1, 1, 1, 1,
-1.123613, 0.8242677, -1.063873, 1, 1, 1, 1, 1,
-1.122239, 0.03825428, -1.520527, 1, 1, 1, 1, 1,
-1.120854, -1.578571, -2.954665, 1, 1, 1, 1, 1,
-1.117109, 0.1057464, -3.725812, 1, 1, 1, 1, 1,
-1.113725, -0.09644875, -1.752308, 1, 1, 1, 1, 1,
-1.112024, 0.4961436, -2.200244, 1, 1, 1, 1, 1,
-1.101979, 0.9774452, 2.141415, 1, 1, 1, 1, 1,
-1.098078, 0.2307897, -1.779278, 1, 1, 1, 1, 1,
-1.094857, -1.973474, -1.233563, 1, 1, 1, 1, 1,
-1.08499, -0.1603352, -0.865582, 1, 1, 1, 1, 1,
-1.07951, -0.8376817, -2.032892, 1, 1, 1, 1, 1,
-1.075343, 0.328343, -1.817189, 0, 0, 1, 1, 1,
-1.063402, -0.397608, -3.277002, 1, 0, 0, 1, 1,
-1.061062, -0.6157619, -2.637059, 1, 0, 0, 1, 1,
-1.059607, -0.6730664, -3.68242, 1, 0, 0, 1, 1,
-1.059083, 0.07179089, -2.517373, 1, 0, 0, 1, 1,
-1.055991, 0.3629127, -0.6348909, 1, 0, 0, 1, 1,
-1.050635, 0.6198755, -0.2757145, 0, 0, 0, 1, 1,
-1.050008, 0.1032613, -1.490171, 0, 0, 0, 1, 1,
-1.042727, 0.9239761, 0.2679056, 0, 0, 0, 1, 1,
-1.041747, -2.044209, -2.803187, 0, 0, 0, 1, 1,
-1.039493, -1.747099, -2.681653, 0, 0, 0, 1, 1,
-1.035046, -1.696287, -1.734818, 0, 0, 0, 1, 1,
-1.033419, -1.347642, -2.016124, 0, 0, 0, 1, 1,
-1.033093, -0.1766985, -0.9277914, 1, 1, 1, 1, 1,
-1.030751, -1.135319, -1.225239, 1, 1, 1, 1, 1,
-1.030048, 0.03137126, -0.9822832, 1, 1, 1, 1, 1,
-1.029665, 0.8166236, -0.4091719, 1, 1, 1, 1, 1,
-1.023581, 0.01805077, 0.99168, 1, 1, 1, 1, 1,
-1.02344, 0.5742576, 0.6723844, 1, 1, 1, 1, 1,
-1.01493, -0.7155407, -3.048651, 1, 1, 1, 1, 1,
-1.013163, 0.3425733, 0.04079957, 1, 1, 1, 1, 1,
-1.009792, -1.852271, -1.492081, 1, 1, 1, 1, 1,
-1.009768, -1.69608, -3.656096, 1, 1, 1, 1, 1,
-1.009495, -0.1199214, -1.951303, 1, 1, 1, 1, 1,
-1.004771, -0.8655928, -2.690516, 1, 1, 1, 1, 1,
-0.9999287, 1.620158, -0.4344536, 1, 1, 1, 1, 1,
-0.9982825, -0.5738087, -1.294846, 1, 1, 1, 1, 1,
-0.9953139, -0.8067335, -0.7848221, 1, 1, 1, 1, 1,
-0.9944745, 0.3002317, -0.232631, 0, 0, 1, 1, 1,
-0.9857261, -0.3307208, -1.495608, 1, 0, 0, 1, 1,
-0.983032, -0.01590917, -2.464179, 1, 0, 0, 1, 1,
-0.9710301, -0.7485051, -1.153296, 1, 0, 0, 1, 1,
-0.9697276, 1.336328, -0.6490744, 1, 0, 0, 1, 1,
-0.9627684, -0.04706978, -1.236735, 1, 0, 0, 1, 1,
-0.960784, 0.2881782, -0.936277, 0, 0, 0, 1, 1,
-0.9564052, -1.708006, -0.9901808, 0, 0, 0, 1, 1,
-0.9526521, -0.03821367, -1.025583, 0, 0, 0, 1, 1,
-0.9497722, -0.2289192, -1.369222, 0, 0, 0, 1, 1,
-0.9414193, -1.79731, -3.046262, 0, 0, 0, 1, 1,
-0.9364645, 1.307154, -0.2231039, 0, 0, 0, 1, 1,
-0.9343086, 1.494498, 1.75394, 0, 0, 0, 1, 1,
-0.9332309, 0.47467, -0.9655447, 1, 1, 1, 1, 1,
-0.9278501, -0.9437807, -2.125797, 1, 1, 1, 1, 1,
-0.9264155, 0.8388731, -0.3520527, 1, 1, 1, 1, 1,
-0.9214313, -0.9505097, -1.421048, 1, 1, 1, 1, 1,
-0.9212339, -0.3400362, 0.9553164, 1, 1, 1, 1, 1,
-0.918295, -0.341702, -1.46005, 1, 1, 1, 1, 1,
-0.9160279, 0.6892316, 0.002672036, 1, 1, 1, 1, 1,
-0.9130682, 1.465815, 0.7839115, 1, 1, 1, 1, 1,
-0.9108681, 1.202451, -2.437115, 1, 1, 1, 1, 1,
-0.9069385, -0.2653386, -2.978857, 1, 1, 1, 1, 1,
-0.9058447, -0.8643302, -2.279929, 1, 1, 1, 1, 1,
-0.9001358, 0.3899286, -2.947919, 1, 1, 1, 1, 1,
-0.8990088, 1.726887, -1.036675, 1, 1, 1, 1, 1,
-0.896785, 0.5610449, -2.939008, 1, 1, 1, 1, 1,
-0.8905475, -0.5408062, -2.587747, 1, 1, 1, 1, 1,
-0.8881677, -0.1144398, 0.7688537, 0, 0, 1, 1, 1,
-0.886562, 0.6111389, -2.004507, 1, 0, 0, 1, 1,
-0.8809187, 0.7041396, 0.6114725, 1, 0, 0, 1, 1,
-0.8806865, -1.556532, -2.638022, 1, 0, 0, 1, 1,
-0.8793042, 0.4370744, -0.02133736, 1, 0, 0, 1, 1,
-0.8779828, -0.1108278, -1.3768, 1, 0, 0, 1, 1,
-0.8773896, -2.312087, -1.907795, 0, 0, 0, 1, 1,
-0.8766032, -0.09038385, -2.129399, 0, 0, 0, 1, 1,
-0.8681059, -0.03069349, -3.055288, 0, 0, 0, 1, 1,
-0.8667846, 2.027592, 0.8593403, 0, 0, 0, 1, 1,
-0.8582022, 0.6758052, 0.006085793, 0, 0, 0, 1, 1,
-0.8571464, -1.714648, -2.755784, 0, 0, 0, 1, 1,
-0.8547863, -0.1039691, -3.69046, 0, 0, 0, 1, 1,
-0.8472579, -0.2636197, -0.03197657, 1, 1, 1, 1, 1,
-0.8408173, 0.007848232, -1.41691, 1, 1, 1, 1, 1,
-0.8310994, -1.331839, -2.660773, 1, 1, 1, 1, 1,
-0.8300374, 1.748644, -2.926708, 1, 1, 1, 1, 1,
-0.8277097, 1.081689, -0.7716172, 1, 1, 1, 1, 1,
-0.823388, -0.72802, -2.754444, 1, 1, 1, 1, 1,
-0.8205906, -0.9873127, -2.728985, 1, 1, 1, 1, 1,
-0.8198983, -1.124486, -2.65479, 1, 1, 1, 1, 1,
-0.818475, 0.9862886, -0.0216299, 1, 1, 1, 1, 1,
-0.8159288, -0.09073626, -1.949576, 1, 1, 1, 1, 1,
-0.8137012, -0.599474, -3.170377, 1, 1, 1, 1, 1,
-0.8119541, 0.4097128, 0.6788186, 1, 1, 1, 1, 1,
-0.8099117, 1.58088, -0.6909571, 1, 1, 1, 1, 1,
-0.8053597, -0.05685983, -0.12344, 1, 1, 1, 1, 1,
-0.8030915, -0.2301639, -0.4840662, 1, 1, 1, 1, 1,
-0.8013347, -0.5843828, -3.072826, 0, 0, 1, 1, 1,
-0.7982867, 0.4910958, -1.578497, 1, 0, 0, 1, 1,
-0.7966044, -0.7747462, -0.4652656, 1, 0, 0, 1, 1,
-0.7959856, -1.339466, -1.994917, 1, 0, 0, 1, 1,
-0.7946309, -0.7109307, -1.791562, 1, 0, 0, 1, 1,
-0.7853695, -1.052851, -2.235952, 1, 0, 0, 1, 1,
-0.7821188, -0.2208484, -2.19968, 0, 0, 0, 1, 1,
-0.7781966, -0.06946071, -0.5072541, 0, 0, 0, 1, 1,
-0.7752223, -1.686333, -3.276786, 0, 0, 0, 1, 1,
-0.7733147, -0.6829506, -3.416833, 0, 0, 0, 1, 1,
-0.772462, -0.5663733, -0.09306746, 0, 0, 0, 1, 1,
-0.7697598, -0.8363593, -2.985064, 0, 0, 0, 1, 1,
-0.7682402, -0.9337867, -2.583658, 0, 0, 0, 1, 1,
-0.764487, -0.3308588, -1.02845, 1, 1, 1, 1, 1,
-0.7618512, -0.695638, -2.514232, 1, 1, 1, 1, 1,
-0.7611111, 0.4959183, 0.09597827, 1, 1, 1, 1, 1,
-0.7598968, -0.9618131, -0.506111, 1, 1, 1, 1, 1,
-0.7590905, -1.029141, -1.665974, 1, 1, 1, 1, 1,
-0.757444, -0.3851633, -2.014354, 1, 1, 1, 1, 1,
-0.7572352, 0.1809372, 1.867226, 1, 1, 1, 1, 1,
-0.7557319, 1.300306, -0.5896297, 1, 1, 1, 1, 1,
-0.7553843, 1.388124, -1.852481, 1, 1, 1, 1, 1,
-0.7553117, 2.208719, 0.9795824, 1, 1, 1, 1, 1,
-0.7549967, -1.261993, -4.386263, 1, 1, 1, 1, 1,
-0.7547323, -0.07609741, -0.8415418, 1, 1, 1, 1, 1,
-0.7488905, 1.191715, -2.38682, 1, 1, 1, 1, 1,
-0.7477454, 0.1453721, -1.15371, 1, 1, 1, 1, 1,
-0.7413698, -1.062438, 0.1406273, 1, 1, 1, 1, 1,
-0.7386639, -1.181436, -2.742014, 0, 0, 1, 1, 1,
-0.7348269, -1.299009, -2.864521, 1, 0, 0, 1, 1,
-0.7337306, 0.5488605, -1.117676, 1, 0, 0, 1, 1,
-0.7308487, -0.4953775, -0.06210693, 1, 0, 0, 1, 1,
-0.719972, 1.029612, 0.08156132, 1, 0, 0, 1, 1,
-0.7190211, 0.1634848, -0.05742822, 1, 0, 0, 1, 1,
-0.7179995, 0.1208086, -2.220896, 0, 0, 0, 1, 1,
-0.7142923, 1.091033, -0.1576695, 0, 0, 0, 1, 1,
-0.7137698, -0.884142, -1.324328, 0, 0, 0, 1, 1,
-0.7127516, 0.120305, 0.2802319, 0, 0, 0, 1, 1,
-0.7116804, 0.8896083, 0.1683834, 0, 0, 0, 1, 1,
-0.7036394, 1.233812, 0.9872118, 0, 0, 0, 1, 1,
-0.6994546, -1.536988, -3.598179, 0, 0, 0, 1, 1,
-0.697334, -1.243398, -3.308054, 1, 1, 1, 1, 1,
-0.6970386, -0.2044484, -2.013068, 1, 1, 1, 1, 1,
-0.6955925, -0.4675818, -3.964019, 1, 1, 1, 1, 1,
-0.6863115, -0.3099667, -0.5134721, 1, 1, 1, 1, 1,
-0.6858731, -0.3924673, -1.623899, 1, 1, 1, 1, 1,
-0.6836802, 0.1278014, -1.017606, 1, 1, 1, 1, 1,
-0.6704489, 0.6604596, -1.013137, 1, 1, 1, 1, 1,
-0.6655805, -0.2106289, -2.936697, 1, 1, 1, 1, 1,
-0.6616135, -0.1972052, -2.061211, 1, 1, 1, 1, 1,
-0.6612532, -0.9600537, -1.830498, 1, 1, 1, 1, 1,
-0.6600522, -0.123523, -2.056041, 1, 1, 1, 1, 1,
-0.6599292, 0.376727, -0.6788325, 1, 1, 1, 1, 1,
-0.6587083, -0.9563621, -2.452543, 1, 1, 1, 1, 1,
-0.6586175, -1.426655, -2.890698, 1, 1, 1, 1, 1,
-0.6582392, 0.1767374, -0.5670567, 1, 1, 1, 1, 1,
-0.6571314, -0.1863285, -0.2917909, 0, 0, 1, 1, 1,
-0.6543157, 0.6957425, 1.392252, 1, 0, 0, 1, 1,
-0.6522961, 1.010461, -0.7226198, 1, 0, 0, 1, 1,
-0.6522213, -1.753478, -1.661677, 1, 0, 0, 1, 1,
-0.6472217, 0.5429314, 1.141725, 1, 0, 0, 1, 1,
-0.64518, 1.065524, -1.320184, 1, 0, 0, 1, 1,
-0.6444546, -1.10491, -1.690738, 0, 0, 0, 1, 1,
-0.6434796, -0.5259063, -3.65598, 0, 0, 0, 1, 1,
-0.6393722, 0.7385622, -1.46585, 0, 0, 0, 1, 1,
-0.6391506, 1.343037, -0.02136376, 0, 0, 0, 1, 1,
-0.6339804, 1.036804, 1.193155, 0, 0, 0, 1, 1,
-0.6321832, -0.07413746, -1.663805, 0, 0, 0, 1, 1,
-0.624595, 0.3188019, -0.8686492, 0, 0, 0, 1, 1,
-0.6240225, 1.544487, -2.684524, 1, 1, 1, 1, 1,
-0.6186235, 1.058435, -1.062675, 1, 1, 1, 1, 1,
-0.6133301, -0.8708066, -2.96326, 1, 1, 1, 1, 1,
-0.6091141, -0.1946117, -1.784043, 1, 1, 1, 1, 1,
-0.6068118, -0.8649574, -3.389296, 1, 1, 1, 1, 1,
-0.6016293, -0.6579016, -0.7032427, 1, 1, 1, 1, 1,
-0.600889, -0.8892557, -2.797187, 1, 1, 1, 1, 1,
-0.5843477, 0.8782247, 0.3507924, 1, 1, 1, 1, 1,
-0.5799468, 0.08777554, -0.06539568, 1, 1, 1, 1, 1,
-0.5771596, -0.3367122, 0.2597253, 1, 1, 1, 1, 1,
-0.5769391, -1.448933, -2.263226, 1, 1, 1, 1, 1,
-0.57679, 0.09890392, -2.228192, 1, 1, 1, 1, 1,
-0.5754521, -0.1838289, -1.894399, 1, 1, 1, 1, 1,
-0.5729161, -1.281619, -4.247869, 1, 1, 1, 1, 1,
-0.568794, 0.7368318, -1.59771, 1, 1, 1, 1, 1,
-0.5659911, 1.806252, -0.7510322, 0, 0, 1, 1, 1,
-0.5614334, -0.3761254, -1.744269, 1, 0, 0, 1, 1,
-0.5548115, 0.08268356, -0.8411195, 1, 0, 0, 1, 1,
-0.5544592, 0.05270111, -0.3136193, 1, 0, 0, 1, 1,
-0.5515729, 1.443313, 0.04722627, 1, 0, 0, 1, 1,
-0.5483277, -0.8764513, 0.1838792, 1, 0, 0, 1, 1,
-0.5473114, 0.2686732, -0.04347026, 0, 0, 0, 1, 1,
-0.5461594, -1.080656, -3.851666, 0, 0, 0, 1, 1,
-0.5461394, -0.4070623, -2.480949, 0, 0, 0, 1, 1,
-0.5456226, 0.7193183, -1.48198, 0, 0, 0, 1, 1,
-0.5432789, -1.158811, -2.862931, 0, 0, 0, 1, 1,
-0.5395286, -0.7182523, -4.001852, 0, 0, 0, 1, 1,
-0.5378423, -0.2281926, -2.820935, 0, 0, 0, 1, 1,
-0.5369846, -0.7768768, -2.472794, 1, 1, 1, 1, 1,
-0.5367557, -0.7783622, -1.434205, 1, 1, 1, 1, 1,
-0.5293882, 0.2929719, -2.770606, 1, 1, 1, 1, 1,
-0.5289332, 0.2793559, -2.914294, 1, 1, 1, 1, 1,
-0.5274417, 1.594667, -0.004785225, 1, 1, 1, 1, 1,
-0.5230054, 0.5104787, -1.264279, 1, 1, 1, 1, 1,
-0.5206885, 1.561471, 1.05729, 1, 1, 1, 1, 1,
-0.5180664, -0.4324652, -1.308261, 1, 1, 1, 1, 1,
-0.5136923, -1.940628, -3.226751, 1, 1, 1, 1, 1,
-0.50864, -0.6642176, -2.195128, 1, 1, 1, 1, 1,
-0.5030608, 0.4559695, -0.5906574, 1, 1, 1, 1, 1,
-0.5020764, -0.2625723, -1.241201, 1, 1, 1, 1, 1,
-0.4975851, -2.398782, -2.724179, 1, 1, 1, 1, 1,
-0.4968207, -0.8262804, -1.839695, 1, 1, 1, 1, 1,
-0.4958375, 0.8806663, -0.5407383, 1, 1, 1, 1, 1,
-0.4942982, -0.7405536, -1.845674, 0, 0, 1, 1, 1,
-0.49357, -0.4989229, -0.8746629, 1, 0, 0, 1, 1,
-0.4926368, -0.3833253, -2.906489, 1, 0, 0, 1, 1,
-0.4910309, 0.7899043, 1.038354, 1, 0, 0, 1, 1,
-0.4893194, -0.2082868, -1.369058, 1, 0, 0, 1, 1,
-0.4868123, -1.656472, -2.73254, 1, 0, 0, 1, 1,
-0.4834398, -0.9862391, -2.428591, 0, 0, 0, 1, 1,
-0.4812347, 0.4953449, 0.6671271, 0, 0, 0, 1, 1,
-0.4801853, 0.2077442, -1.847922, 0, 0, 0, 1, 1,
-0.4795423, 0.4089788, 0.4939876, 0, 0, 0, 1, 1,
-0.4743384, 0.2352921, 0.397931, 0, 0, 0, 1, 1,
-0.4729839, -0.7439258, -2.843035, 0, 0, 0, 1, 1,
-0.4718145, 0.04675018, -2.431258, 0, 0, 0, 1, 1,
-0.4659806, 1.112724, -1.051488, 1, 1, 1, 1, 1,
-0.4625248, -0.5089658, -1.40012, 1, 1, 1, 1, 1,
-0.4615521, -2.717969, -3.234047, 1, 1, 1, 1, 1,
-0.4603997, -0.2201112, -2.954325, 1, 1, 1, 1, 1,
-0.4570794, 0.0253028, -1.939175, 1, 1, 1, 1, 1,
-0.456863, -0.6488444, -4.310023, 1, 1, 1, 1, 1,
-0.4547092, 2.26457, 0.7825586, 1, 1, 1, 1, 1,
-0.4520156, 0.5484094, 0.1060114, 1, 1, 1, 1, 1,
-0.4470706, -0.7338103, -1.335256, 1, 1, 1, 1, 1,
-0.443838, 1.943913, -1.97527, 1, 1, 1, 1, 1,
-0.4424764, -0.1590933, -2.334705, 1, 1, 1, 1, 1,
-0.4415303, 0.7308602, -0.08852906, 1, 1, 1, 1, 1,
-0.4385354, -0.8414432, -4.002841, 1, 1, 1, 1, 1,
-0.4376426, 1.014495, -1.078699, 1, 1, 1, 1, 1,
-0.4344438, -0.3032603, -3.189567, 1, 1, 1, 1, 1,
-0.4321784, -0.787643, -1.830635, 0, 0, 1, 1, 1,
-0.4307992, 0.5212998, -0.7626973, 1, 0, 0, 1, 1,
-0.4257248, -1.212761, -3.692153, 1, 0, 0, 1, 1,
-0.4256534, -0.4221713, -2.551086, 1, 0, 0, 1, 1,
-0.4229167, -1.925166, -1.42624, 1, 0, 0, 1, 1,
-0.4225551, -0.5077989, -4.696368, 1, 0, 0, 1, 1,
-0.4214612, 1.551109, 0.8840057, 0, 0, 0, 1, 1,
-0.4188885, 0.4306616, 0.845004, 0, 0, 0, 1, 1,
-0.4175605, 0.852353, -0.8601133, 0, 0, 0, 1, 1,
-0.4172752, 0.1596464, 0.3478596, 0, 0, 0, 1, 1,
-0.408886, 0.3850433, -1.605569, 0, 0, 0, 1, 1,
-0.4061303, -0.1915037, -1.546222, 0, 0, 0, 1, 1,
-0.401365, 0.4181917, -0.8762761, 0, 0, 0, 1, 1,
-0.4003413, -1.772185, -1.913167, 1, 1, 1, 1, 1,
-0.3906678, -0.1404905, -0.830649, 1, 1, 1, 1, 1,
-0.3876475, 0.3294722, -0.3931494, 1, 1, 1, 1, 1,
-0.3848416, -0.3450184, -2.015257, 1, 1, 1, 1, 1,
-0.3847803, 1.562872, -1.999661, 1, 1, 1, 1, 1,
-0.3791969, -0.8321813, -2.562779, 1, 1, 1, 1, 1,
-0.3788211, 0.9241517, 0.6288197, 1, 1, 1, 1, 1,
-0.3761909, 1.16238, -0.6179656, 1, 1, 1, 1, 1,
-0.374917, 0.3390793, -1.461901, 1, 1, 1, 1, 1,
-0.3744186, 1.167189, -0.9545164, 1, 1, 1, 1, 1,
-0.3734766, 0.1050306, -0.7788489, 1, 1, 1, 1, 1,
-0.3708054, 0.1547883, -0.2286348, 1, 1, 1, 1, 1,
-0.3701444, -0.3777725, -2.584488, 1, 1, 1, 1, 1,
-0.3681335, 1.082461, -0.2732794, 1, 1, 1, 1, 1,
-0.366122, 0.8026212, 0.6339562, 1, 1, 1, 1, 1,
-0.3650473, -1.193526, -2.431046, 0, 0, 1, 1, 1,
-0.3650183, 0.7696115, -0.2220603, 1, 0, 0, 1, 1,
-0.3624133, 0.07503336, -0.6036629, 1, 0, 0, 1, 1,
-0.3415726, -0.3279432, -2.178682, 1, 0, 0, 1, 1,
-0.3394912, -0.4303055, -2.184826, 1, 0, 0, 1, 1,
-0.3386221, -0.08818221, -2.477476, 1, 0, 0, 1, 1,
-0.3375969, 0.5010536, -0.003332172, 0, 0, 0, 1, 1,
-0.3367722, 1.963109, -1.505271, 0, 0, 0, 1, 1,
-0.3348403, 1.671307, -1.219816, 0, 0, 0, 1, 1,
-0.3333438, 0.2523547, -1.409781, 0, 0, 0, 1, 1,
-0.329465, -1.124752, -1.058501, 0, 0, 0, 1, 1,
-0.3291113, 0.04210785, -2.31999, 0, 0, 0, 1, 1,
-0.3284105, -1.161463, -4.084025, 0, 0, 0, 1, 1,
-0.3280064, 0.651977, -1.793945, 1, 1, 1, 1, 1,
-0.3264959, 1.907008, 0.5177448, 1, 1, 1, 1, 1,
-0.3260259, 0.5269909, -0.2272886, 1, 1, 1, 1, 1,
-0.3240875, 0.4667271, -1.663913, 1, 1, 1, 1, 1,
-0.3182874, 0.2812161, -0.5192072, 1, 1, 1, 1, 1,
-0.3178268, 0.5070804, -0.08407708, 1, 1, 1, 1, 1,
-0.3144318, 1.011522, 0.5899207, 1, 1, 1, 1, 1,
-0.3128101, -0.992862, -4.262103, 1, 1, 1, 1, 1,
-0.3119424, -0.4310745, -2.030537, 1, 1, 1, 1, 1,
-0.3118526, 0.687161, 0.5799675, 1, 1, 1, 1, 1,
-0.3108751, 0.1099602, -0.6171143, 1, 1, 1, 1, 1,
-0.30841, -2.806446, -3.636566, 1, 1, 1, 1, 1,
-0.3083086, -0.02780677, -2.616916, 1, 1, 1, 1, 1,
-0.3078731, -0.8850947, -2.509013, 1, 1, 1, 1, 1,
-0.3064442, 2.00732, -0.06275351, 1, 1, 1, 1, 1,
-0.3062906, 0.5101121, -0.7613714, 0, 0, 1, 1, 1,
-0.3030039, -0.02875455, -1.763454, 1, 0, 0, 1, 1,
-0.2970484, 0.827415, 0.06871492, 1, 0, 0, 1, 1,
-0.2965689, -0.1603956, -0.2835074, 1, 0, 0, 1, 1,
-0.2963965, 0.8710915, 0.4412866, 1, 0, 0, 1, 1,
-0.2839957, -0.361214, -1.920882, 1, 0, 0, 1, 1,
-0.2807696, 0.3887885, -0.9824393, 0, 0, 0, 1, 1,
-0.2796504, -2.204433, -3.402883, 0, 0, 0, 1, 1,
-0.2767432, 1.117374, 0.1372056, 0, 0, 0, 1, 1,
-0.2736831, 0.3284656, 0.3478062, 0, 0, 0, 1, 1,
-0.2734564, -0.1830631, -3.865966, 0, 0, 0, 1, 1,
-0.2710437, -0.16909, -3.3142, 0, 0, 0, 1, 1,
-0.2699001, 0.7668896, 0.7418217, 0, 0, 0, 1, 1,
-0.2610734, 1.776941, 0.7403487, 1, 1, 1, 1, 1,
-0.2581058, -1.030194, -2.087219, 1, 1, 1, 1, 1,
-0.253031, -0.2245277, -3.697179, 1, 1, 1, 1, 1,
-0.2509814, -2.585968, -3.043535, 1, 1, 1, 1, 1,
-0.2504267, 0.8029799, 0.005620664, 1, 1, 1, 1, 1,
-0.2488448, 0.9081602, -2.298578, 1, 1, 1, 1, 1,
-0.2477687, -0.8096121, -2.762111, 1, 1, 1, 1, 1,
-0.2458752, -2.243448, -2.131214, 1, 1, 1, 1, 1,
-0.2458397, 0.5005562, -0.03927827, 1, 1, 1, 1, 1,
-0.2443576, 1.212771, 0.1262552, 1, 1, 1, 1, 1,
-0.2426423, -0.3397544, -2.365867, 1, 1, 1, 1, 1,
-0.2398682, -1.895541, -2.951311, 1, 1, 1, 1, 1,
-0.236685, 0.4247892, 0.01183097, 1, 1, 1, 1, 1,
-0.2364634, 0.5953582, 0.1457693, 1, 1, 1, 1, 1,
-0.2357057, -0.5555582, -3.271826, 1, 1, 1, 1, 1,
-0.2322765, 1.088839, -0.6933029, 0, 0, 1, 1, 1,
-0.2319895, -1.404029, -3.208434, 1, 0, 0, 1, 1,
-0.2309744, -0.7181634, -4.320827, 1, 0, 0, 1, 1,
-0.2309305, 0.6640912, 0.113754, 1, 0, 0, 1, 1,
-0.2295979, 0.7853892, -0.07714164, 1, 0, 0, 1, 1,
-0.2292484, 0.5005051, -0.3745807, 1, 0, 0, 1, 1,
-0.2284939, 1.446058, -0.3149424, 0, 0, 0, 1, 1,
-0.2272913, -0.8233366, -2.601159, 0, 0, 0, 1, 1,
-0.2265093, -1.646064, -2.446385, 0, 0, 0, 1, 1,
-0.2261705, -1.506503, -2.427748, 0, 0, 0, 1, 1,
-0.2225646, 2.249421, 1.541483, 0, 0, 0, 1, 1,
-0.2174805, -1.217498, -2.178516, 0, 0, 0, 1, 1,
-0.2143984, -0.9571937, -3.548011, 0, 0, 0, 1, 1,
-0.212581, -0.869471, -4.030252, 1, 1, 1, 1, 1,
-0.2097357, 0.01098321, 0.7470114, 1, 1, 1, 1, 1,
-0.2069365, 0.3932946, -0.6255314, 1, 1, 1, 1, 1,
-0.205683, -0.8955505, -3.371848, 1, 1, 1, 1, 1,
-0.2046427, 0.8438064, 0.02361706, 1, 1, 1, 1, 1,
-0.2018919, 2.43026, -0.8396688, 1, 1, 1, 1, 1,
-0.2016995, -1.682066, -2.567798, 1, 1, 1, 1, 1,
-0.1987378, 1.379431, 1.213828, 1, 1, 1, 1, 1,
-0.1973578, -2.185318, -3.097141, 1, 1, 1, 1, 1,
-0.1961633, -0.3668151, -2.543723, 1, 1, 1, 1, 1,
-0.1946571, -0.5907027, -2.763203, 1, 1, 1, 1, 1,
-0.1920418, 1.111237, -0.2645457, 1, 1, 1, 1, 1,
-0.1917743, -0.1704343, -2.506635, 1, 1, 1, 1, 1,
-0.1773398, 1.472416, 0.3110009, 1, 1, 1, 1, 1,
-0.1709878, 0.5308539, 0.8581582, 1, 1, 1, 1, 1,
-0.169899, 0.3434821, -1.23879, 0, 0, 1, 1, 1,
-0.1667809, 1.055547, -0.3482115, 1, 0, 0, 1, 1,
-0.165874, -0.2838754, -2.362721, 1, 0, 0, 1, 1,
-0.162694, -0.4860843, -2.144014, 1, 0, 0, 1, 1,
-0.1570249, 0.08187027, -1.858828, 1, 0, 0, 1, 1,
-0.1554912, -0.2444072, -1.650797, 1, 0, 0, 1, 1,
-0.1550584, -0.9982167, -3.799213, 0, 0, 0, 1, 1,
-0.1487844, -0.9655581, -1.040437, 0, 0, 0, 1, 1,
-0.1447836, 0.8261421, -0.1401363, 0, 0, 0, 1, 1,
-0.1397617, 1.627285, 0.8347787, 0, 0, 0, 1, 1,
-0.1350046, -0.2758393, -3.858125, 0, 0, 0, 1, 1,
-0.129036, -0.5635116, -3.337986, 0, 0, 0, 1, 1,
-0.1271897, 3.366492, -0.1791892, 0, 0, 0, 1, 1,
-0.1264757, -0.2548058, -4.288888, 1, 1, 1, 1, 1,
-0.1255191, 1.455429, -2.54992, 1, 1, 1, 1, 1,
-0.1251983, -1.458267, -3.276116, 1, 1, 1, 1, 1,
-0.1218106, 2.111915, -0.285592, 1, 1, 1, 1, 1,
-0.1212054, -0.7361975, -2.100822, 1, 1, 1, 1, 1,
-0.1191266, 0.3755029, -2.098912, 1, 1, 1, 1, 1,
-0.118667, 0.3057997, -2.093385, 1, 1, 1, 1, 1,
-0.1174408, 1.459829, 0.7769146, 1, 1, 1, 1, 1,
-0.1170068, -0.5600278, -0.8810945, 1, 1, 1, 1, 1,
-0.1161405, -1.214002, -3.370382, 1, 1, 1, 1, 1,
-0.1110891, -0.2595901, -2.184829, 1, 1, 1, 1, 1,
-0.1087726, 1.346064, -0.2400262, 1, 1, 1, 1, 1,
-0.1011622, 0.2286801, -1.869054, 1, 1, 1, 1, 1,
-0.100426, -0.8435203, -3.494849, 1, 1, 1, 1, 1,
-0.09877391, -0.7650414, -2.266295, 1, 1, 1, 1, 1,
-0.0941321, 0.4992068, 0.5002374, 0, 0, 1, 1, 1,
-0.09281348, 0.2520945, -2.993176, 1, 0, 0, 1, 1,
-0.09084357, 0.06850368, -1.395396, 1, 0, 0, 1, 1,
-0.0874726, -2.160846, -3.490223, 1, 0, 0, 1, 1,
-0.08300705, -0.1275491, -2.562942, 1, 0, 0, 1, 1,
-0.08205975, -0.5821492, -2.333996, 1, 0, 0, 1, 1,
-0.08184606, -0.4492579, -2.091001, 0, 0, 0, 1, 1,
-0.07755275, -1.615077, -3.55038, 0, 0, 0, 1, 1,
-0.07500193, 0.09574855, -1.883242, 0, 0, 0, 1, 1,
-0.07258423, -1.411727, -2.911493, 0, 0, 0, 1, 1,
-0.07116479, -1.766808, -3.624756, 0, 0, 0, 1, 1,
-0.07030296, -0.8756251, -3.494015, 0, 0, 0, 1, 1,
-0.06881761, 1.246773, 0.1718678, 0, 0, 0, 1, 1,
-0.06838607, 0.1698962, -0.3329085, 1, 1, 1, 1, 1,
-0.06370877, 0.0254058, -0.6041359, 1, 1, 1, 1, 1,
-0.05856177, 0.3758326, 0.3246368, 1, 1, 1, 1, 1,
-0.05729513, -0.528018, -2.651156, 1, 1, 1, 1, 1,
-0.05643782, -1.112047, -3.317465, 1, 1, 1, 1, 1,
-0.05383396, 0.3807451, -0.04224035, 1, 1, 1, 1, 1,
-0.05097103, 1.001213, 1.065072, 1, 1, 1, 1, 1,
-0.04622214, -1.585952, -2.480147, 1, 1, 1, 1, 1,
-0.04241618, -1.300129, -2.347474, 1, 1, 1, 1, 1,
-0.04076225, -1.010882, -1.744508, 1, 1, 1, 1, 1,
-0.04053586, 1.306155, 0.4909583, 1, 1, 1, 1, 1,
-0.03417597, -1.112543, -3.34583, 1, 1, 1, 1, 1,
-0.03413001, 0.3660032, -1.523607, 1, 1, 1, 1, 1,
-0.03277456, -0.6255993, -2.541162, 1, 1, 1, 1, 1,
-0.03076824, 0.6131764, 0.4371104, 1, 1, 1, 1, 1,
-0.02969297, 0.0878149, 0.4226702, 0, 0, 1, 1, 1,
-0.02591606, 0.3423714, -0.1864092, 1, 0, 0, 1, 1,
-0.01826039, 1.455388, -0.1187102, 1, 0, 0, 1, 1,
-0.01310827, 0.3816928, 0.2764481, 1, 0, 0, 1, 1,
-0.01290384, 0.2721213, -0.3775904, 1, 0, 0, 1, 1,
-0.006620003, 0.6223264, -0.4684482, 1, 0, 0, 1, 1,
-0.00221246, 0.1354657, 1.407504, 0, 0, 0, 1, 1,
-1.530695e-05, -0.4231559, -3.684384, 0, 0, 0, 1, 1,
0.003436438, -0.04361012, 4.004354, 0, 0, 0, 1, 1,
0.01138621, -0.3723469, 3.417096, 0, 0, 0, 1, 1,
0.01166508, -0.7915011, 4.18053, 0, 0, 0, 1, 1,
0.01466662, 1.271248, 0.8765144, 0, 0, 0, 1, 1,
0.01947521, 1.493569, 0.05766877, 0, 0, 0, 1, 1,
0.02405791, -0.2546136, 1.351568, 1, 1, 1, 1, 1,
0.02436998, 0.5258846, -0.3436303, 1, 1, 1, 1, 1,
0.02438797, 1.49445, -1.00593, 1, 1, 1, 1, 1,
0.02712132, -0.5226052, 1.245001, 1, 1, 1, 1, 1,
0.02746743, 0.2897561, 1.304021, 1, 1, 1, 1, 1,
0.02828966, -1.163256, 3.218689, 1, 1, 1, 1, 1,
0.03025119, -0.3764124, 3.41587, 1, 1, 1, 1, 1,
0.0332201, -0.04691998, 2.854911, 1, 1, 1, 1, 1,
0.0347085, 1.721097, 1.738064, 1, 1, 1, 1, 1,
0.03587077, -0.0945019, 3.052519, 1, 1, 1, 1, 1,
0.03628013, 1.84015, 1.5281, 1, 1, 1, 1, 1,
0.0415459, 0.7805247, 2.325319, 1, 1, 1, 1, 1,
0.04864004, 0.05997061, 1.677314, 1, 1, 1, 1, 1,
0.04907874, 0.2149808, -1.607018, 1, 1, 1, 1, 1,
0.04985528, 1.025809, 0.2420138, 1, 1, 1, 1, 1,
0.05039154, -0.6663082, 5.004665, 0, 0, 1, 1, 1,
0.05218099, -1.659723, 1.620135, 1, 0, 0, 1, 1,
0.05383791, 0.1385323, -0.7370667, 1, 0, 0, 1, 1,
0.05434157, -1.21184, 2.500603, 1, 0, 0, 1, 1,
0.05486071, -0.1530728, 1.314339, 1, 0, 0, 1, 1,
0.05818977, -0.3784503, 3.983594, 1, 0, 0, 1, 1,
0.05865017, -0.2640607, 2.649387, 0, 0, 0, 1, 1,
0.06111644, -1.037266, 3.213984, 0, 0, 0, 1, 1,
0.06688587, 1.934016, 1.481119, 0, 0, 0, 1, 1,
0.06780617, -0.6442875, 2.818755, 0, 0, 0, 1, 1,
0.06935453, -2.420664, 1.556199, 0, 0, 0, 1, 1,
0.07049717, 0.5208459, -2.587118, 0, 0, 0, 1, 1,
0.0791358, -0.06281657, 1.499763, 0, 0, 0, 1, 1,
0.0826133, -0.3578318, 3.504916, 1, 1, 1, 1, 1,
0.08432022, -0.2110745, 1.66083, 1, 1, 1, 1, 1,
0.08543634, 0.4935328, 1.387078, 1, 1, 1, 1, 1,
0.08783887, -0.4344608, 4.141037, 1, 1, 1, 1, 1,
0.08908769, -1.905762, 3.891475, 1, 1, 1, 1, 1,
0.09039031, 0.1195421, -0.03917857, 1, 1, 1, 1, 1,
0.09242604, 0.1995795, 0.6901111, 1, 1, 1, 1, 1,
0.09294945, -0.7458872, 2.322848, 1, 1, 1, 1, 1,
0.09490874, 0.1706483, -0.00997038, 1, 1, 1, 1, 1,
0.09927914, 0.1107061, 1.728684, 1, 1, 1, 1, 1,
0.099636, 0.6934303, 0.590193, 1, 1, 1, 1, 1,
0.1131586, -2.288496, 3.455128, 1, 1, 1, 1, 1,
0.1137014, -0.8735314, 3.125112, 1, 1, 1, 1, 1,
0.115175, -1.15504, 3.701653, 1, 1, 1, 1, 1,
0.1163349, -0.1788891, 2.852765, 1, 1, 1, 1, 1,
0.1164386, -0.08373336, 1.722598, 0, 0, 1, 1, 1,
0.1209609, -0.1382017, 3.183797, 1, 0, 0, 1, 1,
0.1249728, 0.3867494, 0.9603015, 1, 0, 0, 1, 1,
0.124973, 1.551751, -0.2847421, 1, 0, 0, 1, 1,
0.1273352, 0.3330275, -1.410842, 1, 0, 0, 1, 1,
0.1353716, -0.1458947, 3.145895, 1, 0, 0, 1, 1,
0.1373492, -0.3030855, 1.913373, 0, 0, 0, 1, 1,
0.1392223, 0.04830385, 0.2284432, 0, 0, 0, 1, 1,
0.1411702, 0.3517635, 1.529925, 0, 0, 0, 1, 1,
0.1428198, 0.01934305, 3.46993, 0, 0, 0, 1, 1,
0.1476454, 0.1366964, 1.712626, 0, 0, 0, 1, 1,
0.1503482, 1.871676, 1.090787, 0, 0, 0, 1, 1,
0.1589486, -2.270588, 3.762958, 0, 0, 0, 1, 1,
0.1606144, -0.8703691, 3.898847, 1, 1, 1, 1, 1,
0.161063, 0.2994209, 1.262631, 1, 1, 1, 1, 1,
0.1632108, 0.1412143, 0.4629307, 1, 1, 1, 1, 1,
0.1655587, -2.740368, 3.637378, 1, 1, 1, 1, 1,
0.1684665, -0.3923771, 2.553935, 1, 1, 1, 1, 1,
0.1689043, 0.571033, 2.700551, 1, 1, 1, 1, 1,
0.1723685, -0.3380668, 1.580278, 1, 1, 1, 1, 1,
0.1734567, -0.9259437, 3.742187, 1, 1, 1, 1, 1,
0.177214, -1.402666, 2.466506, 1, 1, 1, 1, 1,
0.1812164, 0.3246834, 0.1174341, 1, 1, 1, 1, 1,
0.1818506, -0.9981791, 2.931397, 1, 1, 1, 1, 1,
0.183889, -0.7862325, 3.939676, 1, 1, 1, 1, 1,
0.1875907, -0.5806069, 1.952681, 1, 1, 1, 1, 1,
0.1878659, 0.7760721, 0.01192848, 1, 1, 1, 1, 1,
0.1911739, 0.4531974, -2.717688, 1, 1, 1, 1, 1,
0.1915694, 0.3240802, -0.9326981, 0, 0, 1, 1, 1,
0.1916157, -0.2803209, 4.180902, 1, 0, 0, 1, 1,
0.193437, -0.175376, 3.827935, 1, 0, 0, 1, 1,
0.1942702, -1.136709, 3.33267, 1, 0, 0, 1, 1,
0.2029986, 0.1339482, 0.1338412, 1, 0, 0, 1, 1,
0.2048027, -0.6693276, 2.711195, 1, 0, 0, 1, 1,
0.2060783, 0.6657734, -0.5444416, 0, 0, 0, 1, 1,
0.2069864, 0.7085384, 0.5982944, 0, 0, 0, 1, 1,
0.2099146, 0.2302667, -0.2334619, 0, 0, 0, 1, 1,
0.2135511, 1.724472, -0.4971893, 0, 0, 0, 1, 1,
0.2154215, -0.644975, 2.148991, 0, 0, 0, 1, 1,
0.2249533, -0.7291967, 3.490115, 0, 0, 0, 1, 1,
0.2255162, -0.3689618, 4.205624, 0, 0, 0, 1, 1,
0.225967, 0.1931297, 0.2165516, 1, 1, 1, 1, 1,
0.2302481, -1.186893, 2.065799, 1, 1, 1, 1, 1,
0.2325671, 0.69976, 0.4725103, 1, 1, 1, 1, 1,
0.2370335, -0.1197163, 1.252088, 1, 1, 1, 1, 1,
0.2373349, 1.084036, -0.3633879, 1, 1, 1, 1, 1,
0.2382013, -1.131408, 2.07893, 1, 1, 1, 1, 1,
0.2485551, 0.4341415, 1.937314, 1, 1, 1, 1, 1,
0.251836, -2.483007, 1.608709, 1, 1, 1, 1, 1,
0.2531209, -0.4189174, 3.288823, 1, 1, 1, 1, 1,
0.2533032, -0.6014609, 4.076557, 1, 1, 1, 1, 1,
0.2597387, 0.3793387, 0.0973582, 1, 1, 1, 1, 1,
0.2617356, 0.3443526, -0.09910643, 1, 1, 1, 1, 1,
0.2645208, 0.599263, 0.3147784, 1, 1, 1, 1, 1,
0.2648517, 0.1649924, 0.4463669, 1, 1, 1, 1, 1,
0.2710004, -1.805963, 3.759253, 1, 1, 1, 1, 1,
0.273412, 0.1421434, 1.011425, 0, 0, 1, 1, 1,
0.2743182, -0.7024487, 0.9553861, 1, 0, 0, 1, 1,
0.2746046, -0.1208467, 0.493574, 1, 0, 0, 1, 1,
0.2850194, -2.033441, 2.517619, 1, 0, 0, 1, 1,
0.2893946, -0.6150147, 4.085732, 1, 0, 0, 1, 1,
0.2899586, -1.434213, 2.607921, 1, 0, 0, 1, 1,
0.290043, -0.8478551, 1.028287, 0, 0, 0, 1, 1,
0.2904807, -0.4007991, 1.314869, 0, 0, 0, 1, 1,
0.2975017, 0.6833092, -1.92147, 0, 0, 0, 1, 1,
0.2975721, 1.965545, 1.358512, 0, 0, 0, 1, 1,
0.3022823, 1.633989, 2.444179, 0, 0, 0, 1, 1,
0.3067083, -0.2625438, 2.82547, 0, 0, 0, 1, 1,
0.3083811, -0.9094531, 2.399537, 0, 0, 0, 1, 1,
0.3103255, -0.9761567, 1.553845, 1, 1, 1, 1, 1,
0.3108648, 0.863237, 0.1861352, 1, 1, 1, 1, 1,
0.3124359, 1.348923, -0.003537169, 1, 1, 1, 1, 1,
0.3132991, -1.909392, 2.305172, 1, 1, 1, 1, 1,
0.3219541, -0.1138138, 1.47562, 1, 1, 1, 1, 1,
0.3243762, -1.028252, 2.455106, 1, 1, 1, 1, 1,
0.3257165, -2.3012, 4.561766, 1, 1, 1, 1, 1,
0.3295853, -2.248258, 3.743533, 1, 1, 1, 1, 1,
0.3308232, 0.8175018, 1.685693, 1, 1, 1, 1, 1,
0.3309811, -0.08260128, 0.6909311, 1, 1, 1, 1, 1,
0.3314977, 1.057395, 0.2427733, 1, 1, 1, 1, 1,
0.3319793, 0.5660802, -0.6318688, 1, 1, 1, 1, 1,
0.3326077, -0.510567, 1.798984, 1, 1, 1, 1, 1,
0.3378138, 1.045992, 0.03254807, 1, 1, 1, 1, 1,
0.3392502, -0.1955277, 2.994529, 1, 1, 1, 1, 1,
0.3398331, -1.117059, 2.97687, 0, 0, 1, 1, 1,
0.3410617, -0.3924012, 1.775793, 1, 0, 0, 1, 1,
0.3448766, 1.222, -0.04917618, 1, 0, 0, 1, 1,
0.3495738, 0.2532643, -0.22767, 1, 0, 0, 1, 1,
0.3570991, -0.952257, 2.754856, 1, 0, 0, 1, 1,
0.3579, 0.4163585, 0.423072, 1, 0, 0, 1, 1,
0.360924, 1.58048, -0.9622723, 0, 0, 0, 1, 1,
0.3635775, -1.380544, 0.06179024, 0, 0, 0, 1, 1,
0.3646688, -0.55026, 2.458844, 0, 0, 0, 1, 1,
0.3650072, -0.2463968, 2.334827, 0, 0, 0, 1, 1,
0.3659038, 0.4515694, 1.240166, 0, 0, 0, 1, 1,
0.3663527, 0.3020194, 0.6013977, 0, 0, 0, 1, 1,
0.3704834, 0.0270866, 1.821948, 0, 0, 0, 1, 1,
0.3742172, -0.2057234, 3.345222, 1, 1, 1, 1, 1,
0.3751631, -0.2933329, 3.103983, 1, 1, 1, 1, 1,
0.3754849, -0.2911898, 2.686769, 1, 1, 1, 1, 1,
0.3755169, 0.4078947, 0.6036279, 1, 1, 1, 1, 1,
0.3916538, 2.032637, 0.7312516, 1, 1, 1, 1, 1,
0.3951309, 3.193574, 1.346246, 1, 1, 1, 1, 1,
0.3979591, -0.4368627, 1.581337, 1, 1, 1, 1, 1,
0.4016597, -0.2090056, 1.486722, 1, 1, 1, 1, 1,
0.4062796, -1.591758, 1.274847, 1, 1, 1, 1, 1,
0.4102122, 0.1928521, 2.794429, 1, 1, 1, 1, 1,
0.4177908, -0.6814463, 3.460091, 1, 1, 1, 1, 1,
0.4199836, -0.5001337, 3.611468, 1, 1, 1, 1, 1,
0.4215578, 0.5734269, 1.691783, 1, 1, 1, 1, 1,
0.4215861, -0.4869298, 5.051638, 1, 1, 1, 1, 1,
0.4222487, 1.331201, 1.604234, 1, 1, 1, 1, 1,
0.4227763, 1.169736, 0.3387207, 0, 0, 1, 1, 1,
0.4246872, -1.115552, 3.035278, 1, 0, 0, 1, 1,
0.4269106, -0.6407366, 2.472362, 1, 0, 0, 1, 1,
0.4276231, 0.9390369, 0.7149801, 1, 0, 0, 1, 1,
0.4331324, -0.4249867, 2.715521, 1, 0, 0, 1, 1,
0.436934, 0.5141112, 0.8212122, 1, 0, 0, 1, 1,
0.4409804, -0.1199581, 2.195393, 0, 0, 0, 1, 1,
0.4434, 0.8513137, -0.901131, 0, 0, 0, 1, 1,
0.4451069, 2.074489, -2.228883, 0, 0, 0, 1, 1,
0.4488431, -1.47336, 3.151467, 0, 0, 0, 1, 1,
0.4519545, 0.6542193, -0.3644937, 0, 0, 0, 1, 1,
0.4521283, -0.7060819, 2.044528, 0, 0, 0, 1, 1,
0.45863, -1.234956, 2.641772, 0, 0, 0, 1, 1,
0.4604215, -1.153728, 2.563586, 1, 1, 1, 1, 1,
0.4650672, 0.3688459, 0.8663142, 1, 1, 1, 1, 1,
0.4665201, 0.6727033, 1.68409, 1, 1, 1, 1, 1,
0.467437, 0.7049489, 0.7420453, 1, 1, 1, 1, 1,
0.4694794, 0.08897222, 2.654265, 1, 1, 1, 1, 1,
0.4720411, -0.4290526, 2.71109, 1, 1, 1, 1, 1,
0.4777807, -0.1675655, 2.458254, 1, 1, 1, 1, 1,
0.4791958, -1.366416, 3.700824, 1, 1, 1, 1, 1,
0.4829672, -0.4170103, 0.4941853, 1, 1, 1, 1, 1,
0.4833705, 0.3207051, -0.05380211, 1, 1, 1, 1, 1,
0.4849991, -0.6921984, 2.346536, 1, 1, 1, 1, 1,
0.4983973, -0.5295271, 2.536836, 1, 1, 1, 1, 1,
0.5025669, -0.288708, 3.101964, 1, 1, 1, 1, 1,
0.5026103, -1.190214, 3.97665, 1, 1, 1, 1, 1,
0.5033079, 1.091765, -0.1442536, 1, 1, 1, 1, 1,
0.5090178, 0.8583535, 0.04939488, 0, 0, 1, 1, 1,
0.5096586, 2.061828, 0.08474676, 1, 0, 0, 1, 1,
0.510287, 0.3778418, 0.6085535, 1, 0, 0, 1, 1,
0.5128263, 1.235182, -1.08738, 1, 0, 0, 1, 1,
0.5195388, 1.53377, -0.6336071, 1, 0, 0, 1, 1,
0.5210595, -0.1708506, 2.5463, 1, 0, 0, 1, 1,
0.523288, 0.6811443, 2.990495, 0, 0, 0, 1, 1,
0.5236251, -0.8009, 1.481272, 0, 0, 0, 1, 1,
0.5244949, 1.871793, 1.116676, 0, 0, 0, 1, 1,
0.5321088, 0.4863298, 1.62121, 0, 0, 0, 1, 1,
0.5349118, 0.7257786, 1.768999, 0, 0, 0, 1, 1,
0.5461681, 0.9195851, -0.560597, 0, 0, 0, 1, 1,
0.5499955, 0.9621217, 1.359716, 0, 0, 0, 1, 1,
0.5563844, -0.2219384, 1.834717, 1, 1, 1, 1, 1,
0.5613049, 0.2541158, 2.235762, 1, 1, 1, 1, 1,
0.56955, 1.082287, 1.864712, 1, 1, 1, 1, 1,
0.578072, -0.5739544, 2.318624, 1, 1, 1, 1, 1,
0.5852045, 1.410962, -0.1446497, 1, 1, 1, 1, 1,
0.5854917, 0.5236237, 0.3415044, 1, 1, 1, 1, 1,
0.5860815, 0.3916003, -0.1033527, 1, 1, 1, 1, 1,
0.5896586, -1.119451, 3.045007, 1, 1, 1, 1, 1,
0.589801, 0.832486, 0.7466126, 1, 1, 1, 1, 1,
0.5931247, -0.8469592, 2.267527, 1, 1, 1, 1, 1,
0.5954653, -0.6962634, 2.895418, 1, 1, 1, 1, 1,
0.5960075, 1.314261, 0.5031095, 1, 1, 1, 1, 1,
0.5971166, -0.1134402, 0.6177348, 1, 1, 1, 1, 1,
0.6104346, 0.4173005, 0.7352545, 1, 1, 1, 1, 1,
0.611743, -0.3017312, 2.521089, 1, 1, 1, 1, 1,
0.6130939, 0.367354, 0.5035449, 0, 0, 1, 1, 1,
0.6140354, -0.6891719, 2.660176, 1, 0, 0, 1, 1,
0.6161467, 1.211159, 1.325711, 1, 0, 0, 1, 1,
0.6333644, -0.2334684, 3.492195, 1, 0, 0, 1, 1,
0.6391174, -1.002737, 4.81715, 1, 0, 0, 1, 1,
0.6398854, -1.113997, 1.866164, 1, 0, 0, 1, 1,
0.6402169, 0.7419034, 2.124907, 0, 0, 0, 1, 1,
0.6473634, -1.027255, 3.499006, 0, 0, 0, 1, 1,
0.6493533, -0.3954072, 2.680529, 0, 0, 0, 1, 1,
0.649624, 1.738344, 0.9997916, 0, 0, 0, 1, 1,
0.6521433, -0.09908363, 1.304132, 0, 0, 0, 1, 1,
0.6590638, 1.439264, 0.1387838, 0, 0, 0, 1, 1,
0.6607211, -1.4294, 5.187513, 0, 0, 0, 1, 1,
0.6615157, -2.413012, 4.493626, 1, 1, 1, 1, 1,
0.6628966, -0.1775349, 0.8134682, 1, 1, 1, 1, 1,
0.6638751, -1.302426, 2.192896, 1, 1, 1, 1, 1,
0.6656354, 0.8027466, 1.136033, 1, 1, 1, 1, 1,
0.6658818, -1.159021, 2.506107, 1, 1, 1, 1, 1,
0.6693082, 1.094473, 1.701684, 1, 1, 1, 1, 1,
0.6774811, 0.936183, 0.2939855, 1, 1, 1, 1, 1,
0.6824506, 0.7030375, 1.524728, 1, 1, 1, 1, 1,
0.6986988, -1.715635, 1.163794, 1, 1, 1, 1, 1,
0.7032369, -0.848811, 1.683083, 1, 1, 1, 1, 1,
0.7043426, -0.3039179, 2.468161, 1, 1, 1, 1, 1,
0.7110731, -1.939375, 3.658063, 1, 1, 1, 1, 1,
0.7113701, 0.1837899, 1.743546, 1, 1, 1, 1, 1,
0.7202715, 0.1544707, -0.138365, 1, 1, 1, 1, 1,
0.7232636, -1.282012, 2.886195, 1, 1, 1, 1, 1,
0.7302278, 1.114014, 0.6448689, 0, 0, 1, 1, 1,
0.7331305, 0.9881039, -0.1655762, 1, 0, 0, 1, 1,
0.7344858, 1.204098, 0.6630894, 1, 0, 0, 1, 1,
0.7351997, 0.8900765, 2.069747, 1, 0, 0, 1, 1,
0.7390835, -1.293566, 4.056835, 1, 0, 0, 1, 1,
0.7404083, 0.6186192, -1.288638, 1, 0, 0, 1, 1,
0.7545958, 1.272579, 1.155575, 0, 0, 0, 1, 1,
0.7556919, 0.9987703, 1.230776, 0, 0, 0, 1, 1,
0.756953, 0.6954281, 0.2593935, 0, 0, 0, 1, 1,
0.759056, 0.2113703, 2.351122, 0, 0, 0, 1, 1,
0.7620494, -0.39095, 1.158086, 0, 0, 0, 1, 1,
0.7684807, -1.988907, 4.585839, 0, 0, 0, 1, 1,
0.7755663, -0.2758227, 1.342762, 0, 0, 0, 1, 1,
0.7784979, 1.378838, 0.5533295, 1, 1, 1, 1, 1,
0.780435, 0.742195, 0.06113813, 1, 1, 1, 1, 1,
0.7848386, 0.02790926, 0.1475679, 1, 1, 1, 1, 1,
0.7943556, -0.3531851, 2.807904, 1, 1, 1, 1, 1,
0.795874, -0.4829336, 1.32111, 1, 1, 1, 1, 1,
0.8036511, -1.431804, 3.906832, 1, 1, 1, 1, 1,
0.8069233, 1.95085, 0.05127943, 1, 1, 1, 1, 1,
0.8107002, 0.4778828, -0.4294464, 1, 1, 1, 1, 1,
0.8137907, 0.3291748, 1.532913, 1, 1, 1, 1, 1,
0.8140045, 0.5926581, 0.2387234, 1, 1, 1, 1, 1,
0.817028, 0.4144979, 0.03317327, 1, 1, 1, 1, 1,
0.8192291, 0.1606558, 1.843506, 1, 1, 1, 1, 1,
0.8195797, -0.4588968, 3.61689, 1, 1, 1, 1, 1,
0.8281111, -0.7341442, 2.523556, 1, 1, 1, 1, 1,
0.8321999, -0.1226571, 1.683353, 1, 1, 1, 1, 1,
0.8359904, 1.585543, -0.3716787, 0, 0, 1, 1, 1,
0.836123, -0.2047728, 1.16569, 1, 0, 0, 1, 1,
0.837002, 0.1227901, 1.540283, 1, 0, 0, 1, 1,
0.8408962, 1.806114, -1.093746, 1, 0, 0, 1, 1,
0.8426766, -1.032858, 2.149844, 1, 0, 0, 1, 1,
0.8453323, 0.4430533, -0.06012074, 1, 0, 0, 1, 1,
0.8464898, 0.5376928, 2.669635, 0, 0, 0, 1, 1,
0.8490174, -0.5121729, 1.90036, 0, 0, 0, 1, 1,
0.8517447, -1.394907, 1.723775, 0, 0, 0, 1, 1,
0.8535464, 0.4815204, 1.661218, 0, 0, 0, 1, 1,
0.8558723, 0.7094169, -0.5884683, 0, 0, 0, 1, 1,
0.860082, -1.284916, 4.505607, 0, 0, 0, 1, 1,
0.8621429, 0.07107222, 2.961272, 0, 0, 0, 1, 1,
0.8843433, -0.6294243, 3.874368, 1, 1, 1, 1, 1,
0.8939291, 1.421145, 1.633172, 1, 1, 1, 1, 1,
0.8968585, 0.06050136, 1.371635, 1, 1, 1, 1, 1,
0.8976106, -0.878737, 2.708208, 1, 1, 1, 1, 1,
0.8979644, 0.9750278, 0.8587829, 1, 1, 1, 1, 1,
0.9006183, -0.5947083, 2.169729, 1, 1, 1, 1, 1,
0.9187308, -0.4712567, 2.644201, 1, 1, 1, 1, 1,
0.9205471, 1.559595, 0.5008031, 1, 1, 1, 1, 1,
0.9360453, 0.6420501, 1.484865, 1, 1, 1, 1, 1,
0.9399521, 0.08153809, 3.280999, 1, 1, 1, 1, 1,
0.9403734, -1.411763, 2.079446, 1, 1, 1, 1, 1,
0.959541, 0.4900387, 0.9365562, 1, 1, 1, 1, 1,
0.9714313, 1.081605, -1.930346, 1, 1, 1, 1, 1,
0.9735278, 0.4212439, 0.383959, 1, 1, 1, 1, 1,
0.9774812, 0.1491383, 1.627548, 1, 1, 1, 1, 1,
0.9778889, -1.118525, 2.26055, 0, 0, 1, 1, 1,
0.9820342, 1.19918, 0.04676356, 1, 0, 0, 1, 1,
0.9871593, -0.1951709, 1.615142, 1, 0, 0, 1, 1,
0.9918542, -0.1993988, 1.685174, 1, 0, 0, 1, 1,
0.9925163, 0.7105381, 1.027843, 1, 0, 0, 1, 1,
0.9942822, -2.114209, 4.293497, 1, 0, 0, 1, 1,
1.007306, 0.6615456, 0.6088827, 0, 0, 0, 1, 1,
1.009095, -0.1181038, 2.304027, 0, 0, 0, 1, 1,
1.019948, 1.654029, 2.004544, 0, 0, 0, 1, 1,
1.021325, -0.4215887, 0.9282504, 0, 0, 0, 1, 1,
1.021794, -0.4779913, 2.965257, 0, 0, 0, 1, 1,
1.026246, 0.1220362, 2.17816, 0, 0, 0, 1, 1,
1.026705, -1.268729, 3.302258, 0, 0, 0, 1, 1,
1.029593, -1.221715, 2.957653, 1, 1, 1, 1, 1,
1.029595, -0.8371423, 2.107381, 1, 1, 1, 1, 1,
1.037785, 0.1644261, 2.288371, 1, 1, 1, 1, 1,
1.041071, -0.7015394, 3.188322, 1, 1, 1, 1, 1,
1.049703, 0.5434763, 0.7639453, 1, 1, 1, 1, 1,
1.051709, -0.8344831, 2.464854, 1, 1, 1, 1, 1,
1.051821, 0.6309697, -0.07572493, 1, 1, 1, 1, 1,
1.067948, -0.2148627, 2.403313, 1, 1, 1, 1, 1,
1.074361, -2.240453, 2.002572, 1, 1, 1, 1, 1,
1.07722, 1.978748, -0.09201443, 1, 1, 1, 1, 1,
1.080915, -0.1617143, 2.575635, 1, 1, 1, 1, 1,
1.083917, -0.7112191, 2.532048, 1, 1, 1, 1, 1,
1.091467, 0.2781647, 1.030485, 1, 1, 1, 1, 1,
1.092247, -0.5852605, 4.100803, 1, 1, 1, 1, 1,
1.099823, 0.2188691, 0.2302365, 1, 1, 1, 1, 1,
1.101195, -1.089066, 2.650249, 0, 0, 1, 1, 1,
1.107261, -0.783708, 1.127484, 1, 0, 0, 1, 1,
1.108514, 0.08559631, -0.4844143, 1, 0, 0, 1, 1,
1.111819, -0.9462479, 3.526002, 1, 0, 0, 1, 1,
1.11571, 0.6105331, 1.465472, 1, 0, 0, 1, 1,
1.121543, -0.07886736, 2.530118, 1, 0, 0, 1, 1,
1.126293, -0.8072047, 3.396956, 0, 0, 0, 1, 1,
1.14187, 0.2746262, 2.003772, 0, 0, 0, 1, 1,
1.170677, -0.4921224, 2.799392, 0, 0, 0, 1, 1,
1.174841, 0.06961174, 2.314103, 0, 0, 0, 1, 1,
1.176166, -2.3029, 3.045976, 0, 0, 0, 1, 1,
1.187653, -2.15521, 4.028313, 0, 0, 0, 1, 1,
1.190763, 0.4578488, -0.2069315, 0, 0, 0, 1, 1,
1.196885, -0.3984682, 3.000986, 1, 1, 1, 1, 1,
1.198667, 0.4672717, 1.947189, 1, 1, 1, 1, 1,
1.200317, 0.6119978, 2.033654, 1, 1, 1, 1, 1,
1.206438, -1.168261, 2.54267, 1, 1, 1, 1, 1,
1.217114, -0.6934375, 2.523005, 1, 1, 1, 1, 1,
1.218472, 0.4487167, 1.210792, 1, 1, 1, 1, 1,
1.220018, 0.0194298, 2.823597, 1, 1, 1, 1, 1,
1.223318, 0.8030728, -1.883065, 1, 1, 1, 1, 1,
1.225971, -2.25086, 0.8510779, 1, 1, 1, 1, 1,
1.230689, 0.7594285, 0.2860873, 1, 1, 1, 1, 1,
1.237737, 1.449497, 0.955601, 1, 1, 1, 1, 1,
1.238533, 0.9976487, 2.346335, 1, 1, 1, 1, 1,
1.239816, 1.022596, 0.295687, 1, 1, 1, 1, 1,
1.254089, 0.7213349, -0.2304246, 1, 1, 1, 1, 1,
1.255262, -0.3969775, 1.943645, 1, 1, 1, 1, 1,
1.266296, -0.1258332, 2.348645, 0, 0, 1, 1, 1,
1.271515, 0.2900871, 1.58734, 1, 0, 0, 1, 1,
1.272351, 1.320714, 0.2215571, 1, 0, 0, 1, 1,
1.280486, -0.7629261, 3.389634, 1, 0, 0, 1, 1,
1.289573, 0.0532618, 2.829288, 1, 0, 0, 1, 1,
1.29751, 0.3233057, 2.006968, 1, 0, 0, 1, 1,
1.300584, -0.05777279, 1.774492, 0, 0, 0, 1, 1,
1.301742, -0.03684919, 1.043956, 0, 0, 0, 1, 1,
1.303701, 0.5439407, 2.12686, 0, 0, 0, 1, 1,
1.308664, -0.9858575, 2.869862, 0, 0, 0, 1, 1,
1.318155, 1.380983, 1.063203, 0, 0, 0, 1, 1,
1.321373, 0.5376558, 1.121967, 0, 0, 0, 1, 1,
1.333923, -1.021184, 4.421806, 0, 0, 0, 1, 1,
1.358203, 0.5995748, 1.990391, 1, 1, 1, 1, 1,
1.361618, 0.8206882, 3.274369, 1, 1, 1, 1, 1,
1.397195, 0.6512768, 0.4692009, 1, 1, 1, 1, 1,
1.397742, -1.761983, 3.070389, 1, 1, 1, 1, 1,
1.397898, 1.834229, -1.694733, 1, 1, 1, 1, 1,
1.400357, 1.660256, -1.009832, 1, 1, 1, 1, 1,
1.400831, 1.094354, 1.891086, 1, 1, 1, 1, 1,
1.410816, -0.8052295, 1.61723, 1, 1, 1, 1, 1,
1.425561, 0.6621217, 0.5150693, 1, 1, 1, 1, 1,
1.42612, -1.360415, 1.15784, 1, 1, 1, 1, 1,
1.429812, -1.358522, 1.296641, 1, 1, 1, 1, 1,
1.436212, -0.3380704, 1.328812, 1, 1, 1, 1, 1,
1.444786, 0.4202158, 1.048945, 1, 1, 1, 1, 1,
1.466827, -0.3566599, 2.365428, 1, 1, 1, 1, 1,
1.468832, -0.6632092, 2.274096, 1, 1, 1, 1, 1,
1.468857, -0.3751118, 2.911811, 0, 0, 1, 1, 1,
1.469659, -1.740405, 2.821784, 1, 0, 0, 1, 1,
1.485565, -2.585375, 0.1034216, 1, 0, 0, 1, 1,
1.491594, -0.06779878, 1.833348, 1, 0, 0, 1, 1,
1.497715, -0.1222978, 0.4471678, 1, 0, 0, 1, 1,
1.499704, 0.710674, 1.028051, 1, 0, 0, 1, 1,
1.503098, -0.4023058, 2.65608, 0, 0, 0, 1, 1,
1.50551, 0.5425334, -0.2941875, 0, 0, 0, 1, 1,
1.512377, 0.8246295, 2.231913, 0, 0, 0, 1, 1,
1.513618, 0.1494934, 0.7484454, 0, 0, 0, 1, 1,
1.514625, -0.6407889, 2.114072, 0, 0, 0, 1, 1,
1.53003, 1.217929, -0.04395894, 0, 0, 0, 1, 1,
1.534251, -2.05404, 3.012218, 0, 0, 0, 1, 1,
1.5388, 0.8386984, 3.501629, 1, 1, 1, 1, 1,
1.548159, -1.405426, 3.419857, 1, 1, 1, 1, 1,
1.550185, -0.08020071, 2.85054, 1, 1, 1, 1, 1,
1.55321, 0.8009276, 2.521845, 1, 1, 1, 1, 1,
1.560943, -0.4187026, 1.670366, 1, 1, 1, 1, 1,
1.580505, -1.956516, 1.914793, 1, 1, 1, 1, 1,
1.607806, -1.000091, 1.613276, 1, 1, 1, 1, 1,
1.624107, 0.4578058, -0.8218594, 1, 1, 1, 1, 1,
1.625298, -2.2631, 2.289374, 1, 1, 1, 1, 1,
1.628324, 1.185333, 1.369376, 1, 1, 1, 1, 1,
1.635802, 0.6322352, 3.168014, 1, 1, 1, 1, 1,
1.636211, 1.206861, 0.669837, 1, 1, 1, 1, 1,
1.640863, -0.716872, 0.9336014, 1, 1, 1, 1, 1,
1.642117, -0.9237943, 2.629045, 1, 1, 1, 1, 1,
1.642482, 1.057112, 0.7906814, 1, 1, 1, 1, 1,
1.656024, -0.1825635, 1.127938, 0, 0, 1, 1, 1,
1.664887, 0.7752966, -0.5965778, 1, 0, 0, 1, 1,
1.667662, 0.9416369, 0.8144241, 1, 0, 0, 1, 1,
1.668314, 0.38097, -0.06734708, 1, 0, 0, 1, 1,
1.693806, 0.4707614, 0.8658036, 1, 0, 0, 1, 1,
1.70315, 2.124209, 0.7512694, 1, 0, 0, 1, 1,
1.710876, -0.7892872, 5.046143, 0, 0, 0, 1, 1,
1.714994, -0.2706202, 1.513155, 0, 0, 0, 1, 1,
1.716132, 0.5011758, 1.531883, 0, 0, 0, 1, 1,
1.748666, -2.09295, 0.9855676, 0, 0, 0, 1, 1,
1.763389, 1.479742, 0.6151512, 0, 0, 0, 1, 1,
1.777629, 0.9301991, 0.5524282, 0, 0, 0, 1, 1,
1.783944, -0.7021752, 1.748447, 0, 0, 0, 1, 1,
1.787913, 0.2122797, 1.985285, 1, 1, 1, 1, 1,
1.855253, -0.3673006, 1.897992, 1, 1, 1, 1, 1,
1.88164, 0.9350029, 0.6490259, 1, 1, 1, 1, 1,
1.895992, 1.666976, 1.600385, 1, 1, 1, 1, 1,
1.898493, -0.7615825, 0.8149447, 1, 1, 1, 1, 1,
1.92956, -0.8673169, 0.2346122, 1, 1, 1, 1, 1,
1.93208, -0.9209751, 1.974821, 1, 1, 1, 1, 1,
1.946325, 0.6823056, 2.900567, 1, 1, 1, 1, 1,
2.001687, -0.9645686, 3.178538, 1, 1, 1, 1, 1,
2.010523, 3.382219, -0.4502601, 1, 1, 1, 1, 1,
2.018836, 1.2698, 0.6570722, 1, 1, 1, 1, 1,
2.034618, 0.579452, 1.308813, 1, 1, 1, 1, 1,
2.037595, 0.6913052, 1.358898, 1, 1, 1, 1, 1,
2.073667, 0.6086973, 0.9471191, 1, 1, 1, 1, 1,
2.102145, 0.5435114, 0.9718871, 1, 1, 1, 1, 1,
2.120018, 0.05664438, 1.02632, 0, 0, 1, 1, 1,
2.132442, 0.1348695, 0.8150101, 1, 0, 0, 1, 1,
2.17812, -0.0428419, 1.793891, 1, 0, 0, 1, 1,
2.196478, -0.5159735, -0.1768999, 1, 0, 0, 1, 1,
2.250125, 0.2670083, 1.485626, 1, 0, 0, 1, 1,
2.255619, 0.1474975, 3.195168, 1, 0, 0, 1, 1,
2.354799, -0.1679238, 1.275374, 0, 0, 0, 1, 1,
2.362936, -0.1703382, 1.806723, 0, 0, 0, 1, 1,
2.390055, -0.7844376, 1.493909, 0, 0, 0, 1, 1,
2.396543, 1.508231, 0.4576533, 0, 0, 0, 1, 1,
2.43144, -2.425685, 2.193514, 0, 0, 0, 1, 1,
2.506014, 0.04012612, 2.41988, 0, 0, 0, 1, 1,
2.536684, 0.3123045, 2.295342, 0, 0, 0, 1, 1,
2.568714, 0.3020278, 0.8331096, 1, 1, 1, 1, 1,
2.600304, 2.461402, 4.863015, 1, 1, 1, 1, 1,
2.614015, 0.09850904, 2.045886, 1, 1, 1, 1, 1,
2.646643, 0.0005386043, 2.336772, 1, 1, 1, 1, 1,
2.724751, 0.6814576, 2.541347, 1, 1, 1, 1, 1,
2.880692, 0.6095141, 1.886884, 1, 1, 1, 1, 1,
2.94014, 1.452875, 1.263057, 1, 1, 1, 1, 1
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
var radius = 9.016262;
var distance = 31.66924;
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
mvMatrix.translate( -0.05811918, -0.2825189, -0.2455726 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.66924);
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
