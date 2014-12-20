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
-3.066792, -0.3947647, -0.1968476, 1, 0, 0, 1,
-2.812697, 0.4141403, -0.3042598, 1, 0.007843138, 0, 1,
-2.806285, -0.3371263, -0.4036573, 1, 0.01176471, 0, 1,
-2.753713, 1.458155, -0.09540962, 1, 0.01960784, 0, 1,
-2.667085, 1.887042, -0.9628602, 1, 0.02352941, 0, 1,
-2.442907, -1.292311, -1.787285, 1, 0.03137255, 0, 1,
-2.421372, 1.530923, -0.2315114, 1, 0.03529412, 0, 1,
-2.385472, 1.454619, -0.680196, 1, 0.04313726, 0, 1,
-2.367197, -1.583149, -1.830393, 1, 0.04705882, 0, 1,
-2.316297, -0.6355224, -2.236735, 1, 0.05490196, 0, 1,
-2.276345, 1.527291, -0.9560777, 1, 0.05882353, 0, 1,
-2.257419, 0.5601231, -2.383859, 1, 0.06666667, 0, 1,
-2.257346, 1.515997, -2.029705, 1, 0.07058824, 0, 1,
-2.231335, 0.257856, -1.18791, 1, 0.07843138, 0, 1,
-2.225637, 0.1363444, -0.1265335, 1, 0.08235294, 0, 1,
-2.222507, 1.472621, -2.437365, 1, 0.09019608, 0, 1,
-2.222369, 0.003116565, -1.527996, 1, 0.09411765, 0, 1,
-2.217938, -0.1897276, -2.576859, 1, 0.1019608, 0, 1,
-2.162416, 1.610423, -0.2270114, 1, 0.1098039, 0, 1,
-2.154409, 1.418267, -2.522258, 1, 0.1137255, 0, 1,
-2.141283, 2.300674, -1.615356, 1, 0.1215686, 0, 1,
-2.141172, 0.2138307, -1.191725, 1, 0.1254902, 0, 1,
-2.133652, -1.045899, -1.102596, 1, 0.1333333, 0, 1,
-2.11841, 1.099301, -2.604461, 1, 0.1372549, 0, 1,
-2.08515, -0.4411162, -2.598761, 1, 0.145098, 0, 1,
-2.077361, -0.09413053, -0.806887, 1, 0.1490196, 0, 1,
-2.065911, -0.002305982, -3.442481, 1, 0.1568628, 0, 1,
-2.036995, 0.003701061, -2.454439, 1, 0.1607843, 0, 1,
-2.034727, -1.216597, -1.905145, 1, 0.1686275, 0, 1,
-1.980808, 0.7802272, 0.01632419, 1, 0.172549, 0, 1,
-1.946949, -1.040777, -0.4003899, 1, 0.1803922, 0, 1,
-1.94462, 0.7851546, -1.824412, 1, 0.1843137, 0, 1,
-1.936515, 0.0369743, -0.3215045, 1, 0.1921569, 0, 1,
-1.931464, 0.5618706, -1.044348, 1, 0.1960784, 0, 1,
-1.922228, 1.257, -3.158261, 1, 0.2039216, 0, 1,
-1.912581, 0.5076287, -0.4878102, 1, 0.2117647, 0, 1,
-1.906624, -0.4534366, -0.5197278, 1, 0.2156863, 0, 1,
-1.895371, -0.2665715, 0.2090291, 1, 0.2235294, 0, 1,
-1.86006, 0.5852112, -1.663081, 1, 0.227451, 0, 1,
-1.854481, 0.4952368, -0.6569824, 1, 0.2352941, 0, 1,
-1.849623, -0.2797822, -2.300089, 1, 0.2392157, 0, 1,
-1.828905, -1.195949, -4.670797, 1, 0.2470588, 0, 1,
-1.824242, -0.03142503, -1.022342, 1, 0.2509804, 0, 1,
-1.805475, -0.5562752, -2.609875, 1, 0.2588235, 0, 1,
-1.793544, -0.8900669, -0.7488785, 1, 0.2627451, 0, 1,
-1.788695, 0.4473338, -2.296209, 1, 0.2705882, 0, 1,
-1.77608, -0.9976821, -4.503118, 1, 0.2745098, 0, 1,
-1.775975, 1.655664, -0.4592159, 1, 0.282353, 0, 1,
-1.771392, 0.9488317, 0.114275, 1, 0.2862745, 0, 1,
-1.746347, 0.7096844, -1.16291, 1, 0.2941177, 0, 1,
-1.74534, -0.1876621, -0.5699166, 1, 0.3019608, 0, 1,
-1.727054, -0.835132, -1.068146, 1, 0.3058824, 0, 1,
-1.716045, 0.2230244, -1.851075, 1, 0.3137255, 0, 1,
-1.706937, 1.14904, -1.399824, 1, 0.3176471, 0, 1,
-1.677948, -0.5652701, -2.486505, 1, 0.3254902, 0, 1,
-1.673266, -2.078923, -3.059903, 1, 0.3294118, 0, 1,
-1.66272, -0.1433768, -0.7241863, 1, 0.3372549, 0, 1,
-1.651683, -0.1572604, -1.760128, 1, 0.3411765, 0, 1,
-1.647247, -0.685811, -1.823313, 1, 0.3490196, 0, 1,
-1.646404, -1.547478, -1.542619, 1, 0.3529412, 0, 1,
-1.593856, -0.598041, -2.104405, 1, 0.3607843, 0, 1,
-1.579255, 1.509917, -0.8073841, 1, 0.3647059, 0, 1,
-1.576645, -0.9458796, -1.910731, 1, 0.372549, 0, 1,
-1.568324, 1.44547, 0.5208732, 1, 0.3764706, 0, 1,
-1.568213, -0.884963, -2.249216, 1, 0.3843137, 0, 1,
-1.554239, -0.6386105, -1.256866, 1, 0.3882353, 0, 1,
-1.551925, -1.345467, -1.102695, 1, 0.3960784, 0, 1,
-1.547262, -1.982918, -0.8984271, 1, 0.4039216, 0, 1,
-1.527442, -0.06620126, -3.727282, 1, 0.4078431, 0, 1,
-1.517247, -0.6465663, -3.333819, 1, 0.4156863, 0, 1,
-1.514229, -0.6685822, -1.390672, 1, 0.4196078, 0, 1,
-1.509508, 1.67875, -0.9866212, 1, 0.427451, 0, 1,
-1.504631, -0.7137696, -0.8887197, 1, 0.4313726, 0, 1,
-1.499122, -0.9619349, -1.036876, 1, 0.4392157, 0, 1,
-1.493337, -0.1002627, -0.8620251, 1, 0.4431373, 0, 1,
-1.493276, -0.01807822, -1.096987, 1, 0.4509804, 0, 1,
-1.449888, -1.706577, -4.155672, 1, 0.454902, 0, 1,
-1.448068, 0.3243462, -1.588719, 1, 0.4627451, 0, 1,
-1.44009, 0.8826801, -0.992839, 1, 0.4666667, 0, 1,
-1.435681, -0.7065649, -1.194951, 1, 0.4745098, 0, 1,
-1.427147, -2.239713, -1.788448, 1, 0.4784314, 0, 1,
-1.410762, -1.272795, -2.178191, 1, 0.4862745, 0, 1,
-1.408376, -1.344643, -4.328607, 1, 0.4901961, 0, 1,
-1.405161, -0.271551, -0.6331816, 1, 0.4980392, 0, 1,
-1.390385, 0.8219133, -3.038366, 1, 0.5058824, 0, 1,
-1.375712, 0.110159, -1.677845, 1, 0.509804, 0, 1,
-1.372897, 0.6408816, -0.9677551, 1, 0.5176471, 0, 1,
-1.366495, 0.4374685, -1.348958, 1, 0.5215687, 0, 1,
-1.361742, -1.149875, -2.585849, 1, 0.5294118, 0, 1,
-1.359388, 0.6455227, -1.38677, 1, 0.5333334, 0, 1,
-1.35723, 1.733836, 0.9524435, 1, 0.5411765, 0, 1,
-1.351025, -0.1120989, -2.81387, 1, 0.5450981, 0, 1,
-1.350649, -1.092112, -3.213607, 1, 0.5529412, 0, 1,
-1.349639, -1.120245, -2.000036, 1, 0.5568628, 0, 1,
-1.345904, -0.9307345, -2.091744, 1, 0.5647059, 0, 1,
-1.338043, -1.689377, -0.5678668, 1, 0.5686275, 0, 1,
-1.334599, 0.7422014, -0.4780806, 1, 0.5764706, 0, 1,
-1.331224, -0.0663957, -1.724679, 1, 0.5803922, 0, 1,
-1.330584, -0.8309417, -2.824079, 1, 0.5882353, 0, 1,
-1.330053, 0.7758461, -1.883642, 1, 0.5921569, 0, 1,
-1.324585, -1.202944, -3.2321, 1, 0.6, 0, 1,
-1.319933, 1.527579, 0.5740838, 1, 0.6078432, 0, 1,
-1.318583, -1.216676, -1.849815, 1, 0.6117647, 0, 1,
-1.309014, 0.8244429, -1.749236, 1, 0.6196079, 0, 1,
-1.304569, -0.4454601, -2.769665, 1, 0.6235294, 0, 1,
-1.291109, -0.9240856, -1.094955, 1, 0.6313726, 0, 1,
-1.285347, 1.586677, 0.480222, 1, 0.6352941, 0, 1,
-1.283552, -1.073456, -2.066145, 1, 0.6431373, 0, 1,
-1.271898, 0.1131821, -2.204361, 1, 0.6470588, 0, 1,
-1.262976, 0.6943943, -1.786585, 1, 0.654902, 0, 1,
-1.260645, 1.056356, -3.06481, 1, 0.6588235, 0, 1,
-1.257171, 0.4664195, -0.7396591, 1, 0.6666667, 0, 1,
-1.255468, -0.8860493, -2.875673, 1, 0.6705883, 0, 1,
-1.253769, 0.1291396, -2.581843, 1, 0.6784314, 0, 1,
-1.236003, -1.627063, -4.36966, 1, 0.682353, 0, 1,
-1.224367, 0.5271006, -0.8167235, 1, 0.6901961, 0, 1,
-1.220872, 0.3424256, -2.508158, 1, 0.6941177, 0, 1,
-1.216621, -1.34318, -0.489003, 1, 0.7019608, 0, 1,
-1.20742, -0.2027964, -3.191119, 1, 0.7098039, 0, 1,
-1.20635, 0.9728975, -0.9778754, 1, 0.7137255, 0, 1,
-1.199397, 1.151434, -0.5529431, 1, 0.7215686, 0, 1,
-1.199056, -0.8088331, -3.402095, 1, 0.7254902, 0, 1,
-1.182198, -0.4691355, -1.813421, 1, 0.7333333, 0, 1,
-1.162254, -0.571714, -2.438154, 1, 0.7372549, 0, 1,
-1.162074, 0.2061896, -3.477992, 1, 0.7450981, 0, 1,
-1.155229, 0.08439748, -2.866671, 1, 0.7490196, 0, 1,
-1.146814, 0.5250228, -2.46911, 1, 0.7568628, 0, 1,
-1.14654, -0.02951997, -2.935487, 1, 0.7607843, 0, 1,
-1.138543, -1.310846, -1.575698, 1, 0.7686275, 0, 1,
-1.136124, 0.6735991, -0.4493242, 1, 0.772549, 0, 1,
-1.134028, 2.560989, 0.7158973, 1, 0.7803922, 0, 1,
-1.120168, -0.04756305, -0.5740086, 1, 0.7843137, 0, 1,
-1.118947, 0.2427439, -0.2938258, 1, 0.7921569, 0, 1,
-1.118667, 1.237934, -2.248364, 1, 0.7960784, 0, 1,
-1.115065, 0.07523264, -1.82099, 1, 0.8039216, 0, 1,
-1.109269, 0.8442734, -0.4051476, 1, 0.8117647, 0, 1,
-1.107705, 0.7249423, -2.315465, 1, 0.8156863, 0, 1,
-1.10699, -1.603137, -3.939786, 1, 0.8235294, 0, 1,
-1.101706, -0.6740065, -3.163786, 1, 0.827451, 0, 1,
-1.094266, 0.408818, -0.02603867, 1, 0.8352941, 0, 1,
-1.092414, -1.104427, -1.916473, 1, 0.8392157, 0, 1,
-1.088382, 0.4304878, -2.339888, 1, 0.8470588, 0, 1,
-1.082405, 1.218834, -0.2567328, 1, 0.8509804, 0, 1,
-1.080799, 0.5088875, -0.760492, 1, 0.8588235, 0, 1,
-1.074839, 0.4134504, -2.25226, 1, 0.8627451, 0, 1,
-1.074648, 1.283105, -1.010989, 1, 0.8705882, 0, 1,
-1.061125, -0.07254381, -0.6206438, 1, 0.8745098, 0, 1,
-1.060358, -1.46311, -1.963418, 1, 0.8823529, 0, 1,
-1.05388, 0.09463751, -2.529842, 1, 0.8862745, 0, 1,
-1.047244, 0.9161302, -1.314444, 1, 0.8941177, 0, 1,
-1.036135, -0.6137499, -2.691753, 1, 0.8980392, 0, 1,
-1.03225, 0.9548482, -1.549559, 1, 0.9058824, 0, 1,
-1.030817, 0.7899838, -1.179493, 1, 0.9137255, 0, 1,
-1.029614, 0.02439988, -1.543999, 1, 0.9176471, 0, 1,
-1.02552, 0.1270264, -3.006813, 1, 0.9254902, 0, 1,
-1.017203, -0.1143094, -1.781574, 1, 0.9294118, 0, 1,
-1.016895, 0.4027167, -1.500813, 1, 0.9372549, 0, 1,
-1.010845, 0.62235, -0.6634773, 1, 0.9411765, 0, 1,
-0.9995784, -0.7459847, -3.05145, 1, 0.9490196, 0, 1,
-0.9977561, -0.4510146, -3.258691, 1, 0.9529412, 0, 1,
-0.9947016, -0.1461415, -1.949078, 1, 0.9607843, 0, 1,
-0.990117, -0.3113634, -4.247093, 1, 0.9647059, 0, 1,
-0.9857233, -0.6568643, -0.991384, 1, 0.972549, 0, 1,
-0.9834664, -0.5497587, -1.677701, 1, 0.9764706, 0, 1,
-0.9819976, 1.019663, -1.681399, 1, 0.9843137, 0, 1,
-0.978206, -1.401273, -2.680913, 1, 0.9882353, 0, 1,
-0.964396, -1.564664, -2.548318, 1, 0.9960784, 0, 1,
-0.9484634, -0.6294636, -2.176907, 0.9960784, 1, 0, 1,
-0.9437498, -0.3214453, -2.67958, 0.9921569, 1, 0, 1,
-0.9412622, 0.6975216, -0.9622293, 0.9843137, 1, 0, 1,
-0.9383193, -0.07780879, -1.017711, 0.9803922, 1, 0, 1,
-0.9368287, 0.8942685, -1.767174, 0.972549, 1, 0, 1,
-0.9363151, 0.757576, -2.15921, 0.9686275, 1, 0, 1,
-0.9330382, -0.5987788, -2.959769, 0.9607843, 1, 0, 1,
-0.9279233, 0.04934197, -1.288154, 0.9568627, 1, 0, 1,
-0.9264489, -1.545714, -2.9116, 0.9490196, 1, 0, 1,
-0.9262621, -0.3040745, -3.205399, 0.945098, 1, 0, 1,
-0.9253957, -0.8524474, -2.426859, 0.9372549, 1, 0, 1,
-0.9206547, -0.1415248, -2.961331, 0.9333333, 1, 0, 1,
-0.9204968, 0.6568273, -1.237477, 0.9254902, 1, 0, 1,
-0.9177147, 0.07531875, -2.247075, 0.9215686, 1, 0, 1,
-0.9171629, -0.1972813, -2.377468, 0.9137255, 1, 0, 1,
-0.916382, -0.4324333, -0.4855068, 0.9098039, 1, 0, 1,
-0.9151233, -1.252848, -0.7245717, 0.9019608, 1, 0, 1,
-0.9121844, 0.6089016, -2.855695, 0.8941177, 1, 0, 1,
-0.9116134, 0.4611006, -0.4283722, 0.8901961, 1, 0, 1,
-0.910991, 1.37488, 0.119304, 0.8823529, 1, 0, 1,
-0.9103783, -1.14259, -2.309456, 0.8784314, 1, 0, 1,
-0.9098467, -0.2155719, -3.058563, 0.8705882, 1, 0, 1,
-0.9065974, -0.2484326, -1.875573, 0.8666667, 1, 0, 1,
-0.9056193, 0.7372999, -0.7548202, 0.8588235, 1, 0, 1,
-0.9011949, -0.889215, -2.470019, 0.854902, 1, 0, 1,
-0.9004308, 0.5090815, -0.4910629, 0.8470588, 1, 0, 1,
-0.899513, -0.3985196, -2.69027, 0.8431373, 1, 0, 1,
-0.8950407, -0.2343784, -3.628294, 0.8352941, 1, 0, 1,
-0.8927346, 1.023131, -0.5616747, 0.8313726, 1, 0, 1,
-0.8899558, -0.06289487, -1.436697, 0.8235294, 1, 0, 1,
-0.8864594, -0.6903744, -2.897621, 0.8196079, 1, 0, 1,
-0.8769209, 0.5352085, 0.6010867, 0.8117647, 1, 0, 1,
-0.8748184, 0.6956641, -1.638429, 0.8078431, 1, 0, 1,
-0.8729617, -1.086598, -2.499413, 0.8, 1, 0, 1,
-0.8666752, 0.3959196, -2.369362, 0.7921569, 1, 0, 1,
-0.85048, -0.5921816, -2.122741, 0.7882353, 1, 0, 1,
-0.8443969, -1.060142, -4.815194, 0.7803922, 1, 0, 1,
-0.8429717, 0.718138, -2.215384, 0.7764706, 1, 0, 1,
-0.8428745, 1.186998, -0.6300838, 0.7686275, 1, 0, 1,
-0.8428296, 0.08556633, -2.439202, 0.7647059, 1, 0, 1,
-0.8415166, 0.7036383, -1.263399, 0.7568628, 1, 0, 1,
-0.8409137, 1.821501, 0.4275206, 0.7529412, 1, 0, 1,
-0.8389263, -0.7814123, -3.708782, 0.7450981, 1, 0, 1,
-0.8354517, 0.6409151, 0.8931639, 0.7411765, 1, 0, 1,
-0.8333117, -0.4978876, -3.52945, 0.7333333, 1, 0, 1,
-0.8197622, 0.578357, -2.044321, 0.7294118, 1, 0, 1,
-0.815896, 1.395601, -0.584747, 0.7215686, 1, 0, 1,
-0.8118352, 1.068614, 0.2084371, 0.7176471, 1, 0, 1,
-0.8035816, 0.6145001, -0.7784401, 0.7098039, 1, 0, 1,
-0.8017056, 0.5167329, -1.348173, 0.7058824, 1, 0, 1,
-0.7998278, -0.6885867, -1.660721, 0.6980392, 1, 0, 1,
-0.7986007, 0.1585164, -1.313941, 0.6901961, 1, 0, 1,
-0.7979802, -0.2257885, -0.3826795, 0.6862745, 1, 0, 1,
-0.7914947, -0.1575644, -1.424862, 0.6784314, 1, 0, 1,
-0.7887996, -0.22625, -0.3799871, 0.6745098, 1, 0, 1,
-0.7885189, -0.8816279, -2.62779, 0.6666667, 1, 0, 1,
-0.783474, 0.2447742, 0.3804356, 0.6627451, 1, 0, 1,
-0.7781256, -2.331732, -2.005652, 0.654902, 1, 0, 1,
-0.7717234, -1.271444, -2.932026, 0.6509804, 1, 0, 1,
-0.764856, 0.4848393, -1.40529, 0.6431373, 1, 0, 1,
-0.7579898, -0.7713929, -3.832153, 0.6392157, 1, 0, 1,
-0.7561657, -0.8366182, -3.816815, 0.6313726, 1, 0, 1,
-0.7534454, 0.1555861, -2.325165, 0.627451, 1, 0, 1,
-0.7524607, 0.9829094, -2.484193, 0.6196079, 1, 0, 1,
-0.7519822, 0.2504582, -0.4884799, 0.6156863, 1, 0, 1,
-0.7500632, 1.012286, -1.194819, 0.6078432, 1, 0, 1,
-0.7493675, -0.4058017, -1.61622, 0.6039216, 1, 0, 1,
-0.7459549, -0.02754601, -0.9991052, 0.5960785, 1, 0, 1,
-0.7454386, -1.77194, -3.109875, 0.5882353, 1, 0, 1,
-0.7399679, -0.8637648, -1.340571, 0.5843138, 1, 0, 1,
-0.7362521, -0.5459643, -1.37044, 0.5764706, 1, 0, 1,
-0.7313039, 0.5811791, -0.8251522, 0.572549, 1, 0, 1,
-0.7257589, 1.678619, -0.9384224, 0.5647059, 1, 0, 1,
-0.724527, -0.8411869, -3.633392, 0.5607843, 1, 0, 1,
-0.7228453, 0.4716023, -2.648131, 0.5529412, 1, 0, 1,
-0.7226257, 0.1506939, -1.421907, 0.5490196, 1, 0, 1,
-0.7183906, -0.7872573, -2.850527, 0.5411765, 1, 0, 1,
-0.7174147, 0.5071034, -0.7024103, 0.5372549, 1, 0, 1,
-0.7158631, -0.2736869, -1.385722, 0.5294118, 1, 0, 1,
-0.7156904, -1.131554, -1.372386, 0.5254902, 1, 0, 1,
-0.7147418, 0.5062732, -0.2810638, 0.5176471, 1, 0, 1,
-0.7122503, 1.202075, -1.525026, 0.5137255, 1, 0, 1,
-0.7121337, -0.3961929, -1.773414, 0.5058824, 1, 0, 1,
-0.7116743, 0.6289644, -0.9966601, 0.5019608, 1, 0, 1,
-0.7095979, 1.074629, 0.6360262, 0.4941176, 1, 0, 1,
-0.7015196, -0.0746567, -2.686664, 0.4862745, 1, 0, 1,
-0.6976375, -0.009325312, -3.556998, 0.4823529, 1, 0, 1,
-0.6895753, -1.684248, -3.381685, 0.4745098, 1, 0, 1,
-0.6878116, -2.770456, -2.269453, 0.4705882, 1, 0, 1,
-0.6853727, -1.025764, -3.724123, 0.4627451, 1, 0, 1,
-0.6844085, 0.25962, -1.438891, 0.4588235, 1, 0, 1,
-0.6771074, -0.108773, -1.534393, 0.4509804, 1, 0, 1,
-0.6767824, 0.8353336, -1.924177, 0.4470588, 1, 0, 1,
-0.6734685, -0.8598027, -1.742759, 0.4392157, 1, 0, 1,
-0.6701641, 0.181262, -0.6787394, 0.4352941, 1, 0, 1,
-0.6669134, 0.08215633, -0.9403987, 0.427451, 1, 0, 1,
-0.6653028, -0.4058002, -1.426934, 0.4235294, 1, 0, 1,
-0.664664, -1.135641, -4.086997, 0.4156863, 1, 0, 1,
-0.6643814, -0.1815747, -3.216538, 0.4117647, 1, 0, 1,
-0.6585797, 0.9398505, -0.5855114, 0.4039216, 1, 0, 1,
-0.6571203, 1.098303, 1.750776, 0.3960784, 1, 0, 1,
-0.6560921, -1.360748, -2.52156, 0.3921569, 1, 0, 1,
-0.6553835, -0.5185149, -2.254272, 0.3843137, 1, 0, 1,
-0.6531864, -0.3236741, -1.032471, 0.3803922, 1, 0, 1,
-0.652141, 0.5198011, -2.039688, 0.372549, 1, 0, 1,
-0.6517958, 0.0812304, -2.146093, 0.3686275, 1, 0, 1,
-0.6421698, -0.5640656, 0.3042933, 0.3607843, 1, 0, 1,
-0.6409888, -0.09827256, -1.685797, 0.3568628, 1, 0, 1,
-0.6402733, 0.5925053, -1.209041, 0.3490196, 1, 0, 1,
-0.6339337, 1.149776, -0.4897456, 0.345098, 1, 0, 1,
-0.6309797, -0.7593691, -0.7952, 0.3372549, 1, 0, 1,
-0.6287777, -1.336249, -4.210068, 0.3333333, 1, 0, 1,
-0.6238324, -1.004638, -1.55815, 0.3254902, 1, 0, 1,
-0.6211224, -0.9876296, -3.206833, 0.3215686, 1, 0, 1,
-0.6199138, -0.3538812, -2.731733, 0.3137255, 1, 0, 1,
-0.6196161, -1.321441, -3.054672, 0.3098039, 1, 0, 1,
-0.6195137, -0.1220779, -4.532471, 0.3019608, 1, 0, 1,
-0.6188531, 0.06824442, -2.344906, 0.2941177, 1, 0, 1,
-0.618085, 0.06727094, -3.610371, 0.2901961, 1, 0, 1,
-0.6177104, -0.1331851, -3.531476, 0.282353, 1, 0, 1,
-0.6062001, 0.2536381, -2.105087, 0.2784314, 1, 0, 1,
-0.6000135, 1.226147, 0.06138138, 0.2705882, 1, 0, 1,
-0.5951204, 0.2937121, -2.344428, 0.2666667, 1, 0, 1,
-0.5950159, -0.7417509, -2.862885, 0.2588235, 1, 0, 1,
-0.5943252, 0.4275874, -0.8478955, 0.254902, 1, 0, 1,
-0.5938945, 1.731302, 0.01245063, 0.2470588, 1, 0, 1,
-0.5929952, -0.2549012, 0.2557809, 0.2431373, 1, 0, 1,
-0.5849642, 0.006260477, -2.034045, 0.2352941, 1, 0, 1,
-0.5823984, -0.6817349, -0.712249, 0.2313726, 1, 0, 1,
-0.5800996, 0.945678, 0.190246, 0.2235294, 1, 0, 1,
-0.5784394, 0.6088851, -2.796608, 0.2196078, 1, 0, 1,
-0.5771782, -0.4288272, -3.885638, 0.2117647, 1, 0, 1,
-0.5735085, -0.3426173, -2.371287, 0.2078431, 1, 0, 1,
-0.5722149, 0.06399707, -1.850359, 0.2, 1, 0, 1,
-0.5709612, -0.7728486, -0.5894469, 0.1921569, 1, 0, 1,
-0.5705377, -0.3119802, -4.396903, 0.1882353, 1, 0, 1,
-0.5674162, -1.160393, -2.752608, 0.1803922, 1, 0, 1,
-0.564891, 1.128332, -1.844698, 0.1764706, 1, 0, 1,
-0.5594438, 0.005873243, -1.026715, 0.1686275, 1, 0, 1,
-0.5533768, 0.3703509, 0.003574244, 0.1647059, 1, 0, 1,
-0.5514549, 0.02379353, -2.360697, 0.1568628, 1, 0, 1,
-0.5486831, -0.1429357, -1.785488, 0.1529412, 1, 0, 1,
-0.5473558, -2.626042, -2.799742, 0.145098, 1, 0, 1,
-0.5460209, 1.119601, -0.7876525, 0.1411765, 1, 0, 1,
-0.5432647, 0.07847203, -0.2867396, 0.1333333, 1, 0, 1,
-0.5432166, -1.833144, -3.58545, 0.1294118, 1, 0, 1,
-0.5411188, -2.392158, -4.360222, 0.1215686, 1, 0, 1,
-0.5392174, -1.089399, -0.9316065, 0.1176471, 1, 0, 1,
-0.535966, 0.5624675, -0.6807637, 0.1098039, 1, 0, 1,
-0.5333838, -1.270027, -2.723281, 0.1058824, 1, 0, 1,
-0.5262472, 1.024004, -1.404463, 0.09803922, 1, 0, 1,
-0.5252493, 0.6516615, 0.2914189, 0.09019608, 1, 0, 1,
-0.5217861, -1.325613, -0.8515354, 0.08627451, 1, 0, 1,
-0.5200273, 1.535556, -1.406127, 0.07843138, 1, 0, 1,
-0.5191467, 0.6692983, -0.7586999, 0.07450981, 1, 0, 1,
-0.5190905, 0.8491001, 0.7424391, 0.06666667, 1, 0, 1,
-0.5189766, 0.9797729, -2.871157, 0.0627451, 1, 0, 1,
-0.5182806, -0.005009943, -1.837309, 0.05490196, 1, 0, 1,
-0.5179814, -0.8676374, -2.023374, 0.05098039, 1, 0, 1,
-0.5160177, -1.15877, -2.780669, 0.04313726, 1, 0, 1,
-0.5127621, -0.3963082, -1.954415, 0.03921569, 1, 0, 1,
-0.5082306, 0.8381695, -1.829939, 0.03137255, 1, 0, 1,
-0.5079908, 0.4923871, -2.420167, 0.02745098, 1, 0, 1,
-0.506261, 0.8421214, 1.003016, 0.01960784, 1, 0, 1,
-0.5024085, -0.4020212, -1.834439, 0.01568628, 1, 0, 1,
-0.4942729, -0.1291894, -2.205542, 0.007843138, 1, 0, 1,
-0.4905971, 0.8731667, -1.039667, 0.003921569, 1, 0, 1,
-0.4886168, -0.8644863, -3.016297, 0, 1, 0.003921569, 1,
-0.4848412, 0.1222802, -1.095363, 0, 1, 0.01176471, 1,
-0.483857, -0.4039275, -3.461347, 0, 1, 0.01568628, 1,
-0.4820642, -0.621235, -2.961665, 0, 1, 0.02352941, 1,
-0.4818715, -0.01759523, -2.281917, 0, 1, 0.02745098, 1,
-0.4809506, 2.288342, -2.524397, 0, 1, 0.03529412, 1,
-0.4779576, -0.2217899, -3.376817, 0, 1, 0.03921569, 1,
-0.476842, -0.5772027, -1.258212, 0, 1, 0.04705882, 1,
-0.4739616, -0.1044803, -1.135489, 0, 1, 0.05098039, 1,
-0.4736207, -0.4067803, -2.160465, 0, 1, 0.05882353, 1,
-0.4714177, -1.022486, -2.907871, 0, 1, 0.0627451, 1,
-0.4713895, -0.6800379, -3.677063, 0, 1, 0.07058824, 1,
-0.4649601, -0.6995674, -1.401565, 0, 1, 0.07450981, 1,
-0.463209, 0.3617324, -2.008487, 0, 1, 0.08235294, 1,
-0.4530469, 0.4424988, -0.2947924, 0, 1, 0.08627451, 1,
-0.4522566, -0.347305, -1.81377, 0, 1, 0.09411765, 1,
-0.4513017, -0.7138885, -2.193868, 0, 1, 0.1019608, 1,
-0.4505194, 0.5074381, -1.105457, 0, 1, 0.1058824, 1,
-0.446481, -0.1752647, -2.689451, 0, 1, 0.1137255, 1,
-0.4411426, 1.243922, 0.6197307, 0, 1, 0.1176471, 1,
-0.4329982, -1.311209, -3.975928, 0, 1, 0.1254902, 1,
-0.4328784, -1.830557, -4.292414, 0, 1, 0.1294118, 1,
-0.4206652, 0.4147233, -1.068739, 0, 1, 0.1372549, 1,
-0.4201863, -0.5065321, -3.974168, 0, 1, 0.1411765, 1,
-0.4183117, -0.7726162, -3.683154, 0, 1, 0.1490196, 1,
-0.418162, 0.2111437, -1.239497, 0, 1, 0.1529412, 1,
-0.4116949, 0.476932, -0.9159749, 0, 1, 0.1607843, 1,
-0.4026891, 1.426469, 1.039405, 0, 1, 0.1647059, 1,
-0.4001939, 0.7118409, -1.835061, 0, 1, 0.172549, 1,
-0.3945195, -0.6095812, -0.9985317, 0, 1, 0.1764706, 1,
-0.3905774, 0.04704117, 1.091288, 0, 1, 0.1843137, 1,
-0.3866976, 0.6970145, -1.129626, 0, 1, 0.1882353, 1,
-0.386162, -0.4550412, -3.463347, 0, 1, 0.1960784, 1,
-0.3766965, 2.157903, -1.120396, 0, 1, 0.2039216, 1,
-0.374435, -0.3296826, -3.416931, 0, 1, 0.2078431, 1,
-0.3694274, -1.626407, -2.172027, 0, 1, 0.2156863, 1,
-0.3679026, 1.174835, 0.7699779, 0, 1, 0.2196078, 1,
-0.3622255, -0.8117525, -1.467618, 0, 1, 0.227451, 1,
-0.3611289, 1.677281, -0.05117775, 0, 1, 0.2313726, 1,
-0.3607137, -0.2747071, -2.152977, 0, 1, 0.2392157, 1,
-0.3585218, 0.9978812, 0.782795, 0, 1, 0.2431373, 1,
-0.3568756, 0.6109276, 0.4873007, 0, 1, 0.2509804, 1,
-0.3547564, 1.253977, 0.2950413, 0, 1, 0.254902, 1,
-0.3507972, -0.5119609, -0.05736912, 0, 1, 0.2627451, 1,
-0.3491795, 0.2369905, -1.014074, 0, 1, 0.2666667, 1,
-0.3469897, -1.510848, -3.600621, 0, 1, 0.2745098, 1,
-0.3454029, 0.2544564, -1.651931, 0, 1, 0.2784314, 1,
-0.3426294, -1.070898, -2.436974, 0, 1, 0.2862745, 1,
-0.3408711, 0.498751, -0.9781958, 0, 1, 0.2901961, 1,
-0.3404212, -1.344231, -3.581884, 0, 1, 0.2980392, 1,
-0.3342722, -0.6594118, -3.079973, 0, 1, 0.3058824, 1,
-0.3342693, 0.3439505, -0.595572, 0, 1, 0.3098039, 1,
-0.3309365, -1.200029, -2.61807, 0, 1, 0.3176471, 1,
-0.3305648, -0.4617003, -4.354367, 0, 1, 0.3215686, 1,
-0.3300599, -1.285603, -1.71053, 0, 1, 0.3294118, 1,
-0.3260315, -1.705822, -1.313914, 0, 1, 0.3333333, 1,
-0.3225638, -0.9794868, -2.338274, 0, 1, 0.3411765, 1,
-0.3149442, 0.6328562, 0.3018548, 0, 1, 0.345098, 1,
-0.3104316, -1.010399, -2.630726, 0, 1, 0.3529412, 1,
-0.3097394, -1.205378, -3.090342, 0, 1, 0.3568628, 1,
-0.3078696, -0.7974413, -1.603179, 0, 1, 0.3647059, 1,
-0.3073188, -1.545564, -2.304542, 0, 1, 0.3686275, 1,
-0.300185, 0.3327985, 1.450527, 0, 1, 0.3764706, 1,
-0.297527, -0.1213787, -2.118602, 0, 1, 0.3803922, 1,
-0.2923951, -0.9912415, -1.499288, 0, 1, 0.3882353, 1,
-0.291255, -0.4514083, -3.843075, 0, 1, 0.3921569, 1,
-0.2868022, -1.499625, -4.0298, 0, 1, 0.4, 1,
-0.2853931, -0.6273943, -2.792495, 0, 1, 0.4078431, 1,
-0.2790064, -0.7242972, -3.467773, 0, 1, 0.4117647, 1,
-0.2786348, -1.249102, -4.250957, 0, 1, 0.4196078, 1,
-0.2748164, -0.9389303, -1.728424, 0, 1, 0.4235294, 1,
-0.2732025, 0.410324, -0.7990386, 0, 1, 0.4313726, 1,
-0.2719033, 0.7113479, -1.677102, 0, 1, 0.4352941, 1,
-0.2689506, -0.755338, -1.709878, 0, 1, 0.4431373, 1,
-0.2652183, 1.309724, -0.8155123, 0, 1, 0.4470588, 1,
-0.2618906, -1.071209, -2.16746, 0, 1, 0.454902, 1,
-0.2616309, 1.594242, 1.17142, 0, 1, 0.4588235, 1,
-0.2611046, -0.6881724, -2.98224, 0, 1, 0.4666667, 1,
-0.2599031, 0.3778554, -0.05256806, 0, 1, 0.4705882, 1,
-0.259824, -1.692248, -1.730993, 0, 1, 0.4784314, 1,
-0.2583789, 1.305152, -1.652035, 0, 1, 0.4823529, 1,
-0.257787, 0.5820374, 0.8358237, 0, 1, 0.4901961, 1,
-0.2562507, -2.099452, -4.186914, 0, 1, 0.4941176, 1,
-0.2550257, 0.3732016, 1.163721, 0, 1, 0.5019608, 1,
-0.2461734, -1.862939, -0.4861041, 0, 1, 0.509804, 1,
-0.2458482, -0.6209887, -2.276279, 0, 1, 0.5137255, 1,
-0.2404341, 1.857979, -0.6378242, 0, 1, 0.5215687, 1,
-0.239213, -0.1092835, -2.311864, 0, 1, 0.5254902, 1,
-0.2357259, 1.42818, 0.5264429, 0, 1, 0.5333334, 1,
-0.2348243, 0.4711403, -2.149547, 0, 1, 0.5372549, 1,
-0.2336174, 0.9604067, -0.3834348, 0, 1, 0.5450981, 1,
-0.2290558, -0.01356798, -2.734686, 0, 1, 0.5490196, 1,
-0.2287961, -1.261551, -2.979477, 0, 1, 0.5568628, 1,
-0.227348, -1.138059, -0.8611869, 0, 1, 0.5607843, 1,
-0.2264531, -1.163432, -3.528591, 0, 1, 0.5686275, 1,
-0.2244213, -0.9676189, -2.797002, 0, 1, 0.572549, 1,
-0.2239937, 0.4266198, 0.6194616, 0, 1, 0.5803922, 1,
-0.2201572, -0.3646954, -2.579007, 0, 1, 0.5843138, 1,
-0.2176293, 0.3335749, -2.516525, 0, 1, 0.5921569, 1,
-0.2166158, -0.6139354, -1.10483, 0, 1, 0.5960785, 1,
-0.2151161, -0.6652918, -2.635794, 0, 1, 0.6039216, 1,
-0.2140006, 0.6235063, 0.1669939, 0, 1, 0.6117647, 1,
-0.2000137, -1.135449, -2.381403, 0, 1, 0.6156863, 1,
-0.1965586, 0.3181455, 0.2697104, 0, 1, 0.6235294, 1,
-0.1960667, 0.5355231, -0.4956211, 0, 1, 0.627451, 1,
-0.1935014, 1.494169, -0.7555701, 0, 1, 0.6352941, 1,
-0.1929997, -2.543406, -2.627146, 0, 1, 0.6392157, 1,
-0.1919106, -0.06381533, -1.886283, 0, 1, 0.6470588, 1,
-0.1895143, 0.9190364, -1.73442, 0, 1, 0.6509804, 1,
-0.1891266, -1.139532, -2.909561, 0, 1, 0.6588235, 1,
-0.1849277, 0.8404216, 0.1114329, 0, 1, 0.6627451, 1,
-0.1815186, 1.041508, -1.321242, 0, 1, 0.6705883, 1,
-0.1741635, 0.06240499, -2.036492, 0, 1, 0.6745098, 1,
-0.1739291, 1.681314, -0.8152593, 0, 1, 0.682353, 1,
-0.1727857, -0.1176361, -1.546093, 0, 1, 0.6862745, 1,
-0.1711644, -0.04321229, -3.3981, 0, 1, 0.6941177, 1,
-0.162312, 0.4899975, -2.529671, 0, 1, 0.7019608, 1,
-0.1572136, 0.6298465, -0.6191919, 0, 1, 0.7058824, 1,
-0.1548488, -0.9366428, -2.080131, 0, 1, 0.7137255, 1,
-0.1517284, 0.320334, -1.133818, 0, 1, 0.7176471, 1,
-0.1498513, 0.8399464, -0.8706077, 0, 1, 0.7254902, 1,
-0.1494603, -0.1093546, -1.865182, 0, 1, 0.7294118, 1,
-0.1472886, -0.694816, -0.9692993, 0, 1, 0.7372549, 1,
-0.1441907, 1.294384, 0.1864735, 0, 1, 0.7411765, 1,
-0.1375829, 1.546113, -0.7466266, 0, 1, 0.7490196, 1,
-0.1350833, 0.2540903, 0.4172213, 0, 1, 0.7529412, 1,
-0.1327724, 0.2127311, -0.4821551, 0, 1, 0.7607843, 1,
-0.1249232, -1.821638, -3.658622, 0, 1, 0.7647059, 1,
-0.123596, 0.2156592, 0.3867716, 0, 1, 0.772549, 1,
-0.1218049, 0.1664975, 0.465504, 0, 1, 0.7764706, 1,
-0.1190394, 0.2915578, -0.3213122, 0, 1, 0.7843137, 1,
-0.1187411, 0.4532814, -0.3220003, 0, 1, 0.7882353, 1,
-0.1178686, -0.4314864, -3.699459, 0, 1, 0.7960784, 1,
-0.1131498, -1.403067, -5.186009, 0, 1, 0.8039216, 1,
-0.1131451, 1.238077, 1.10093, 0, 1, 0.8078431, 1,
-0.1130629, -1.554566, -3.754755, 0, 1, 0.8156863, 1,
-0.1066907, -2.098275, -3.202418, 0, 1, 0.8196079, 1,
-0.1007973, -2.200946, -2.901771, 0, 1, 0.827451, 1,
-0.09738836, 2.831488, 1.166118, 0, 1, 0.8313726, 1,
-0.09463852, -1.567231, -2.820207, 0, 1, 0.8392157, 1,
-0.09364589, -0.021609, -1.099112, 0, 1, 0.8431373, 1,
-0.07895436, -2.616714, -2.284326, 0, 1, 0.8509804, 1,
-0.07775307, 0.07578167, -0.9940714, 0, 1, 0.854902, 1,
-0.0762475, 0.8710657, 1.597338, 0, 1, 0.8627451, 1,
-0.07559895, -0.374853, -1.249794, 0, 1, 0.8666667, 1,
-0.07339107, 0.5482255, 0.9084429, 0, 1, 0.8745098, 1,
-0.06891518, 0.316335, -0.476476, 0, 1, 0.8784314, 1,
-0.06565011, 0.8346616, 1.816479, 0, 1, 0.8862745, 1,
-0.06052954, -0.4393468, -2.174284, 0, 1, 0.8901961, 1,
-0.05650498, 0.4071685, 1.084674, 0, 1, 0.8980392, 1,
-0.0555815, 0.8728234, 1.138208, 0, 1, 0.9058824, 1,
-0.05438586, -0.4547201, -3.531274, 0, 1, 0.9098039, 1,
-0.05316911, 0.7954599, 1.916446, 0, 1, 0.9176471, 1,
-0.05012747, -0.1826429, -4.004918, 0, 1, 0.9215686, 1,
-0.04750244, 0.1902217, 0.135592, 0, 1, 0.9294118, 1,
-0.04750052, 0.6089212, 1.910518, 0, 1, 0.9333333, 1,
-0.04093111, -0.3927639, -2.362049, 0, 1, 0.9411765, 1,
-0.04090441, 0.4849397, -0.4051486, 0, 1, 0.945098, 1,
-0.03793255, 0.9234667, -0.7300257, 0, 1, 0.9529412, 1,
-0.03689984, 1.613494, -0.6055661, 0, 1, 0.9568627, 1,
-0.03648481, -0.4191623, -2.466481, 0, 1, 0.9647059, 1,
-0.03367475, -0.4336896, -2.620741, 0, 1, 0.9686275, 1,
-0.03258372, -0.1439738, -2.306715, 0, 1, 0.9764706, 1,
-0.03012327, -0.2052746, -5.084455, 0, 1, 0.9803922, 1,
-0.02963974, -1.429812, -4.268541, 0, 1, 0.9882353, 1,
-0.02053525, 0.06121518, 0.879226, 0, 1, 0.9921569, 1,
-0.01910909, -0.9778303, -2.967521, 0, 1, 1, 1,
-0.01322818, -0.7068759, -2.971319, 0, 0.9921569, 1, 1,
-0.00879758, -1.12053, -2.821216, 0, 0.9882353, 1, 1,
-0.003328766, -0.5485396, -1.639248, 0, 0.9803922, 1, 1,
-0.001626395, 0.1184155, -0.7440016, 0, 0.9764706, 1, 1,
0.005320351, -0.2590014, 3.106315, 0, 0.9686275, 1, 1,
0.005627768, -0.2970204, 3.86227, 0, 0.9647059, 1, 1,
0.00570497, -0.3069076, 3.054953, 0, 0.9568627, 1, 1,
0.01415246, 0.7950918, 1.017175, 0, 0.9529412, 1, 1,
0.01502119, 0.5767833, 0.9085811, 0, 0.945098, 1, 1,
0.01806716, -0.02165281, 4.641264, 0, 0.9411765, 1, 1,
0.02178705, 0.2116673, 0.6139169, 0, 0.9333333, 1, 1,
0.02307429, 0.3643769, 1.285148, 0, 0.9294118, 1, 1,
0.02400013, 0.3811834, -2.66963, 0, 0.9215686, 1, 1,
0.02503189, 0.5052759, 1.676253, 0, 0.9176471, 1, 1,
0.02531715, -0.3405494, 2.780556, 0, 0.9098039, 1, 1,
0.03049082, 0.9386986, -0.5384596, 0, 0.9058824, 1, 1,
0.03094734, -0.409842, 3.118601, 0, 0.8980392, 1, 1,
0.03180088, -0.3440473, 1.542852, 0, 0.8901961, 1, 1,
0.03244478, -0.4922807, 5.305374, 0, 0.8862745, 1, 1,
0.03379045, -1.031564, 4.786616, 0, 0.8784314, 1, 1,
0.0360869, -2.587754, 3.410369, 0, 0.8745098, 1, 1,
0.04207399, 2.681635, 0.4055368, 0, 0.8666667, 1, 1,
0.04213046, 0.05300347, 0.8805252, 0, 0.8627451, 1, 1,
0.04244566, 2.499133, 0.2570261, 0, 0.854902, 1, 1,
0.04496768, 0.6550057, 0.3256058, 0, 0.8509804, 1, 1,
0.04501362, 0.3829828, 0.1144728, 0, 0.8431373, 1, 1,
0.04613834, -1.124409, 4.823939, 0, 0.8392157, 1, 1,
0.04685155, -0.9377123, 2.338551, 0, 0.8313726, 1, 1,
0.05320781, -0.09589035, 2.934172, 0, 0.827451, 1, 1,
0.0534898, 0.9298216, 2.318209, 0, 0.8196079, 1, 1,
0.05821569, 2.653248, -1.090617, 0, 0.8156863, 1, 1,
0.05998827, -0.05395284, 2.525644, 0, 0.8078431, 1, 1,
0.06218336, 1.564077, -1.330385, 0, 0.8039216, 1, 1,
0.06438596, 1.669788, -0.859947, 0, 0.7960784, 1, 1,
0.06499638, -1.010306, 4.838499, 0, 0.7882353, 1, 1,
0.06542818, 0.5824126, 0.6060631, 0, 0.7843137, 1, 1,
0.07113676, -0.128023, 0.8435419, 0, 0.7764706, 1, 1,
0.07849728, -0.9118094, 3.201999, 0, 0.772549, 1, 1,
0.0827792, 1.428698, 1.304112, 0, 0.7647059, 1, 1,
0.08328983, -1.618836, 2.233371, 0, 0.7607843, 1, 1,
0.09217111, 0.265544, 2.392381, 0, 0.7529412, 1, 1,
0.09890368, 0.1338238, 1.881224, 0, 0.7490196, 1, 1,
0.09941799, 0.2180478, 0.2119918, 0, 0.7411765, 1, 1,
0.1016601, -2.063157, 3.518296, 0, 0.7372549, 1, 1,
0.1029843, -0.1571601, 0.5615326, 0, 0.7294118, 1, 1,
0.1031571, 0.2569256, 0.4213658, 0, 0.7254902, 1, 1,
0.1092982, -0.1145491, 0.2505335, 0, 0.7176471, 1, 1,
0.1123935, 1.555614, 0.6544429, 0, 0.7137255, 1, 1,
0.1135531, -0.4258161, 3.35736, 0, 0.7058824, 1, 1,
0.1140856, 1.280981, 0.5703681, 0, 0.6980392, 1, 1,
0.1185184, -0.3377822, 4.55063, 0, 0.6941177, 1, 1,
0.1197067, 0.5629571, -0.1397295, 0, 0.6862745, 1, 1,
0.1203462, -0.1921128, 2.294821, 0, 0.682353, 1, 1,
0.1236591, 1.084291, -0.914059, 0, 0.6745098, 1, 1,
0.127006, -1.899852, 3.496878, 0, 0.6705883, 1, 1,
0.1294904, -1.075796, 2.810784, 0, 0.6627451, 1, 1,
0.1356462, 0.2759003, 0.08681164, 0, 0.6588235, 1, 1,
0.1487714, 0.3820279, -0.5496511, 0, 0.6509804, 1, 1,
0.150068, -0.9432703, 3.156082, 0, 0.6470588, 1, 1,
0.1555338, -1.301303, 1.658939, 0, 0.6392157, 1, 1,
0.1585009, -0.9998335, 3.448855, 0, 0.6352941, 1, 1,
0.1594648, 0.09093059, 0.7876148, 0, 0.627451, 1, 1,
0.1601259, -0.03488968, -0.01426444, 0, 0.6235294, 1, 1,
0.1601928, -1.679319, 1.495205, 0, 0.6156863, 1, 1,
0.1614814, -0.1831425, 4.003263, 0, 0.6117647, 1, 1,
0.1666459, 1.151565, -0.2879115, 0, 0.6039216, 1, 1,
0.1732489, 0.1101144, 0.4246637, 0, 0.5960785, 1, 1,
0.173649, -1.596341, 2.342357, 0, 0.5921569, 1, 1,
0.1780374, 1.748495, -1.04422, 0, 0.5843138, 1, 1,
0.1788068, -0.9591194, 0.882174, 0, 0.5803922, 1, 1,
0.1806298, 0.9045841, -0.309823, 0, 0.572549, 1, 1,
0.1813028, 1.858931, 1.43414, 0, 0.5686275, 1, 1,
0.1849119, -0.6700944, 2.229139, 0, 0.5607843, 1, 1,
0.186334, -0.1742008, 4.155076, 0, 0.5568628, 1, 1,
0.1879389, 0.8325572, 1.360045, 0, 0.5490196, 1, 1,
0.1886255, 0.3782639, 0.4254103, 0, 0.5450981, 1, 1,
0.1888157, -1.322458, 4.046005, 0, 0.5372549, 1, 1,
0.1900888, 0.4161396, 0.7760466, 0, 0.5333334, 1, 1,
0.1903963, -0.676017, 2.618243, 0, 0.5254902, 1, 1,
0.1905582, 0.6068962, -0.8166251, 0, 0.5215687, 1, 1,
0.1921668, 0.3579795, 1.369453, 0, 0.5137255, 1, 1,
0.2018384, -0.2828242, 3.143115, 0, 0.509804, 1, 1,
0.2075448, 0.1444568, 1.63552, 0, 0.5019608, 1, 1,
0.2083924, 0.2978792, 1.752658, 0, 0.4941176, 1, 1,
0.2115933, 0.6907549, 0.2938514, 0, 0.4901961, 1, 1,
0.2137707, 0.9417655, -0.6751597, 0, 0.4823529, 1, 1,
0.2147614, 0.134522, 0.1217995, 0, 0.4784314, 1, 1,
0.2194391, 0.5015779, 0.01175004, 0, 0.4705882, 1, 1,
0.2215673, -0.3332658, 3.103143, 0, 0.4666667, 1, 1,
0.2287537, -1.654503, 3.573344, 0, 0.4588235, 1, 1,
0.2325079, 0.796985, -0.250258, 0, 0.454902, 1, 1,
0.2350561, -0.7870157, 3.288665, 0, 0.4470588, 1, 1,
0.2421571, -0.6681802, 0.8653497, 0, 0.4431373, 1, 1,
0.2429337, -0.3386952, 1.420181, 0, 0.4352941, 1, 1,
0.2445016, 0.5588746, 1.071604, 0, 0.4313726, 1, 1,
0.2505335, 1.059209, -0.06003968, 0, 0.4235294, 1, 1,
0.2585246, -0.3139138, 1.250439, 0, 0.4196078, 1, 1,
0.2588216, 0.9210749, 2.827519, 0, 0.4117647, 1, 1,
0.2636187, -0.6800064, 3.145577, 0, 0.4078431, 1, 1,
0.2640133, 0.3928927, -0.4389569, 0, 0.4, 1, 1,
0.2648543, -0.6331145, 5.041869, 0, 0.3921569, 1, 1,
0.2700574, -0.9388942, 4.382643, 0, 0.3882353, 1, 1,
0.2712891, 0.7369589, 0.05801411, 0, 0.3803922, 1, 1,
0.2716551, 1.273885, 0.8096243, 0, 0.3764706, 1, 1,
0.2750304, -0.09663986, 2.583126, 0, 0.3686275, 1, 1,
0.2800731, -1.004434, 2.261181, 0, 0.3647059, 1, 1,
0.2895616, 0.03626776, 2.235602, 0, 0.3568628, 1, 1,
0.2917765, 2.008507, 0.2969573, 0, 0.3529412, 1, 1,
0.2933829, 0.8922253, 1.058491, 0, 0.345098, 1, 1,
0.2937538, 0.6211268, 0.9095378, 0, 0.3411765, 1, 1,
0.2943304, 0.222335, 0.1543046, 0, 0.3333333, 1, 1,
0.2957534, 0.1138656, 0.7875561, 0, 0.3294118, 1, 1,
0.3039574, 0.6431398, 2.085966, 0, 0.3215686, 1, 1,
0.3069437, -1.597205, 2.458686, 0, 0.3176471, 1, 1,
0.3070048, -1.629856, 0.4091603, 0, 0.3098039, 1, 1,
0.3082435, 0.2771395, 1.243454, 0, 0.3058824, 1, 1,
0.3137213, -0.8113809, 1.342974, 0, 0.2980392, 1, 1,
0.3161863, 0.7142382, -0.0193103, 0, 0.2901961, 1, 1,
0.3214014, -0.3382913, 3.57431, 0, 0.2862745, 1, 1,
0.3216819, -0.171198, 1.588053, 0, 0.2784314, 1, 1,
0.327511, -1.228852, -0.04550746, 0, 0.2745098, 1, 1,
0.3312187, -1.966559, 1.478342, 0, 0.2666667, 1, 1,
0.3324988, -0.5683431, 4.005537, 0, 0.2627451, 1, 1,
0.3341786, 0.7915764, 1.460203, 0, 0.254902, 1, 1,
0.3355823, 0.6044544, -0.0600806, 0, 0.2509804, 1, 1,
0.3375745, -0.5355669, 1.875688, 0, 0.2431373, 1, 1,
0.3379547, 0.3681197, 1.244884, 0, 0.2392157, 1, 1,
0.3392578, 0.7687268, -0.3438931, 0, 0.2313726, 1, 1,
0.3428337, 2.277464, -0.4280072, 0, 0.227451, 1, 1,
0.3491683, 0.07176714, 2.821672, 0, 0.2196078, 1, 1,
0.3500651, -0.1716637, 1.101118, 0, 0.2156863, 1, 1,
0.3507045, -0.9538625, 1.7493, 0, 0.2078431, 1, 1,
0.3510143, -0.0844022, 1.840495, 0, 0.2039216, 1, 1,
0.3519291, -0.2119651, 2.309623, 0, 0.1960784, 1, 1,
0.3523887, -0.311311, 1.8281, 0, 0.1882353, 1, 1,
0.3535886, -2.335446, 3.397447, 0, 0.1843137, 1, 1,
0.3546172, -0.6317949, 4.864953, 0, 0.1764706, 1, 1,
0.3568152, -1.220102, 2.270117, 0, 0.172549, 1, 1,
0.3571221, 1.641241, -1.184442, 0, 0.1647059, 1, 1,
0.3593214, -1.613057, 3.211032, 0, 0.1607843, 1, 1,
0.361766, -0.1772749, 1.459275, 0, 0.1529412, 1, 1,
0.3659588, 0.4526339, 0.04711538, 0, 0.1490196, 1, 1,
0.3669643, -0.3014493, 2.578485, 0, 0.1411765, 1, 1,
0.370795, 0.9441662, 0.9265189, 0, 0.1372549, 1, 1,
0.3736364, 1.043091, -0.3948122, 0, 0.1294118, 1, 1,
0.3793462, -0.3826053, 2.33057, 0, 0.1254902, 1, 1,
0.3830116, 0.6433923, 0.1473077, 0, 0.1176471, 1, 1,
0.3835621, 0.2362575, 1.558796, 0, 0.1137255, 1, 1,
0.3842798, 0.009806414, 1.285502, 0, 0.1058824, 1, 1,
0.3880818, 0.1439636, 0.7345759, 0, 0.09803922, 1, 1,
0.3886209, 0.5368026, 1.18178, 0, 0.09411765, 1, 1,
0.3915653, -0.3231264, 2.483342, 0, 0.08627451, 1, 1,
0.3949922, -2.023331, 1.648457, 0, 0.08235294, 1, 1,
0.3957126, -1.546563, 3.49341, 0, 0.07450981, 1, 1,
0.3982505, -0.7877526, 1.901641, 0, 0.07058824, 1, 1,
0.3989223, -0.9468426, 1.394825, 0, 0.0627451, 1, 1,
0.4035862, -1.634935, 2.520268, 0, 0.05882353, 1, 1,
0.4053508, -0.8975287, 2.537811, 0, 0.05098039, 1, 1,
0.4058198, -0.5201589, 2.72714, 0, 0.04705882, 1, 1,
0.4064954, 0.6788093, -1.415041, 0, 0.03921569, 1, 1,
0.4071231, 0.1425286, 2.269147, 0, 0.03529412, 1, 1,
0.4098678, 0.6794447, 0.3951419, 0, 0.02745098, 1, 1,
0.411525, -0.04253631, 2.601982, 0, 0.02352941, 1, 1,
0.4162671, -0.1357208, 2.186528, 0, 0.01568628, 1, 1,
0.4190768, 0.4090322, 2.443965, 0, 0.01176471, 1, 1,
0.4193684, 0.8008481, -0.1392454, 0, 0.003921569, 1, 1,
0.4219091, -1.221786, 2.518747, 0.003921569, 0, 1, 1,
0.4243617, 1.789032, -0.03049734, 0.007843138, 0, 1, 1,
0.4263279, -0.3274856, 2.018851, 0.01568628, 0, 1, 1,
0.428275, 0.77905, 2.350926, 0.01960784, 0, 1, 1,
0.4289237, -0.1150186, 1.965386, 0.02745098, 0, 1, 1,
0.429118, -0.1022405, 2.14263, 0.03137255, 0, 1, 1,
0.43132, 1.0722, -0.1679926, 0.03921569, 0, 1, 1,
0.4322331, 0.4345, 1.81716, 0.04313726, 0, 1, 1,
0.4343044, 0.3303235, 0.7319931, 0.05098039, 0, 1, 1,
0.4345863, 0.5493398, 2.249081, 0.05490196, 0, 1, 1,
0.4362156, 1.617576, 0.4814518, 0.0627451, 0, 1, 1,
0.4398607, -0.3840176, 1.382317, 0.06666667, 0, 1, 1,
0.4416007, -0.1445291, 2.627192, 0.07450981, 0, 1, 1,
0.4427621, -0.8681084, 3.216239, 0.07843138, 0, 1, 1,
0.445541, 0.1394444, 3.020998, 0.08627451, 0, 1, 1,
0.4521469, 1.319438, -1.462938, 0.09019608, 0, 1, 1,
0.4554282, 0.3028598, 2.158392, 0.09803922, 0, 1, 1,
0.4568761, 1.219556, 0.1301835, 0.1058824, 0, 1, 1,
0.4577658, 0.2543342, -0.07318226, 0.1098039, 0, 1, 1,
0.4587989, 1.516864, 1.223222, 0.1176471, 0, 1, 1,
0.4648371, -0.8129863, 1.774361, 0.1215686, 0, 1, 1,
0.4674203, -1.922895, 1.46751, 0.1294118, 0, 1, 1,
0.4678848, -1.586513, 2.451535, 0.1333333, 0, 1, 1,
0.4686757, -3.557901, 3.343438, 0.1411765, 0, 1, 1,
0.4697956, -0.4860616, 3.220287, 0.145098, 0, 1, 1,
0.470443, -0.1778634, 0.9622439, 0.1529412, 0, 1, 1,
0.4715999, -0.1468952, 1.982427, 0.1568628, 0, 1, 1,
0.4720032, -1.893093, 2.478827, 0.1647059, 0, 1, 1,
0.4736868, 0.5589173, -1.448429, 0.1686275, 0, 1, 1,
0.4745395, -0.1705513, 1.860256, 0.1764706, 0, 1, 1,
0.4823129, -1.387096, 3.806174, 0.1803922, 0, 1, 1,
0.4904627, -0.5786813, 2.668757, 0.1882353, 0, 1, 1,
0.4941402, 0.3652649, 1.331182, 0.1921569, 0, 1, 1,
0.4944449, -1.777412, 2.212319, 0.2, 0, 1, 1,
0.4956909, -2.043912, 2.325955, 0.2078431, 0, 1, 1,
0.4961728, 0.9499308, 2.055648, 0.2117647, 0, 1, 1,
0.4988533, -1.870826, 4.813629, 0.2196078, 0, 1, 1,
0.5009887, -1.899853, 3.272273, 0.2235294, 0, 1, 1,
0.5021581, -1.792063, 3.954372, 0.2313726, 0, 1, 1,
0.5029171, -1.711012, 4.113431, 0.2352941, 0, 1, 1,
0.5059028, -0.4008189, 2.673678, 0.2431373, 0, 1, 1,
0.5065006, -0.8291737, 3.89886, 0.2470588, 0, 1, 1,
0.5076827, -1.210584, 3.30076, 0.254902, 0, 1, 1,
0.5087886, -0.09001951, 1.306901, 0.2588235, 0, 1, 1,
0.5105859, -2.235366, 2.199257, 0.2666667, 0, 1, 1,
0.5111867, -0.4902563, 2.613488, 0.2705882, 0, 1, 1,
0.5113835, -1.278893, 4.678671, 0.2784314, 0, 1, 1,
0.5114607, -2.497, 3.951266, 0.282353, 0, 1, 1,
0.5148872, -1.272021, 1.755878, 0.2901961, 0, 1, 1,
0.5149694, -0.2952081, 2.46259, 0.2941177, 0, 1, 1,
0.5166625, 0.3654654, 0.851577, 0.3019608, 0, 1, 1,
0.5167538, 0.2663008, 0.7252116, 0.3098039, 0, 1, 1,
0.5230095, -0.6928798, 1.733871, 0.3137255, 0, 1, 1,
0.5287548, -0.7184727, 1.663269, 0.3215686, 0, 1, 1,
0.5288549, -0.4493213, 2.959083, 0.3254902, 0, 1, 1,
0.5293382, -0.008597458, 1.94571, 0.3333333, 0, 1, 1,
0.5313415, 0.3012241, 1.394072, 0.3372549, 0, 1, 1,
0.5330219, 0.2335721, 0.9008291, 0.345098, 0, 1, 1,
0.5363522, 1.502296, 0.5774478, 0.3490196, 0, 1, 1,
0.538382, 0.2180628, 1.333753, 0.3568628, 0, 1, 1,
0.5387887, -1.188306, 1.603937, 0.3607843, 0, 1, 1,
0.5411115, -1.098766, 3.67771, 0.3686275, 0, 1, 1,
0.5488342, 1.398, 1.618079, 0.372549, 0, 1, 1,
0.5541307, 0.6347427, -0.3475223, 0.3803922, 0, 1, 1,
0.5542942, -0.2596352, 3.52997, 0.3843137, 0, 1, 1,
0.5592933, 1.19614, 1.402639, 0.3921569, 0, 1, 1,
0.5636404, 1.024543, -0.6483967, 0.3960784, 0, 1, 1,
0.5654379, 0.7223777, 1.339055, 0.4039216, 0, 1, 1,
0.5664151, 0.7773594, 1.590742, 0.4117647, 0, 1, 1,
0.5694674, 0.1373525, 0.756256, 0.4156863, 0, 1, 1,
0.5741968, -0.4333434, 0.9691605, 0.4235294, 0, 1, 1,
0.5791649, 0.1040403, 0.6167352, 0.427451, 0, 1, 1,
0.579498, -0.2477033, 2.668948, 0.4352941, 0, 1, 1,
0.5877885, -0.2747882, 1.639079, 0.4392157, 0, 1, 1,
0.5886812, -0.05767064, 2.265537, 0.4470588, 0, 1, 1,
0.5906636, -0.8255641, 2.892474, 0.4509804, 0, 1, 1,
0.5913684, -0.4515152, 1.384568, 0.4588235, 0, 1, 1,
0.5942167, -0.8276827, 3.192497, 0.4627451, 0, 1, 1,
0.5959463, 0.4135448, 0.4908761, 0.4705882, 0, 1, 1,
0.6021829, 1.300632, 0.01145225, 0.4745098, 0, 1, 1,
0.6097258, 0.8277892, 1.269472, 0.4823529, 0, 1, 1,
0.6124694, 0.2676897, 1.629129, 0.4862745, 0, 1, 1,
0.6132367, -2.514309, 2.573478, 0.4941176, 0, 1, 1,
0.6208175, -0.7333545, 2.622591, 0.5019608, 0, 1, 1,
0.6267387, 1.291042, 1.398451, 0.5058824, 0, 1, 1,
0.6330662, -0.427359, 1.56604, 0.5137255, 0, 1, 1,
0.6344037, 1.125143, 0.389962, 0.5176471, 0, 1, 1,
0.6376972, 0.002063775, 2.105517, 0.5254902, 0, 1, 1,
0.6386754, -0.6215252, 2.699847, 0.5294118, 0, 1, 1,
0.6408371, 0.03699721, 2.68865, 0.5372549, 0, 1, 1,
0.6452693, 0.3183877, 1.060364, 0.5411765, 0, 1, 1,
0.6470652, 0.6410381, 0.5173841, 0.5490196, 0, 1, 1,
0.6498394, -1.217692, 3.835699, 0.5529412, 0, 1, 1,
0.6515328, -1.745125, 2.351293, 0.5607843, 0, 1, 1,
0.6528841, -1.60867, 4.451772, 0.5647059, 0, 1, 1,
0.6544676, -2.865712, 1.838405, 0.572549, 0, 1, 1,
0.6601818, 0.3199275, 3.203648, 0.5764706, 0, 1, 1,
0.6623801, 1.43669, 1.335661, 0.5843138, 0, 1, 1,
0.6656699, 1.075735, -0.07177316, 0.5882353, 0, 1, 1,
0.6679224, 0.06753156, 0.6781605, 0.5960785, 0, 1, 1,
0.6682891, 0.2481254, 0.1535389, 0.6039216, 0, 1, 1,
0.6721714, 0.03835282, 2.202691, 0.6078432, 0, 1, 1,
0.6748651, 0.1948416, 0.5989861, 0.6156863, 0, 1, 1,
0.679269, 0.4563625, 1.434676, 0.6196079, 0, 1, 1,
0.6831886, -2.963942, 2.95266, 0.627451, 0, 1, 1,
0.6857148, -0.9650499, 1.067491, 0.6313726, 0, 1, 1,
0.6954079, 0.8871003, 1.846898, 0.6392157, 0, 1, 1,
0.6960355, -0.06952854, 1.444685, 0.6431373, 0, 1, 1,
0.6976524, 1.066188, 0.563453, 0.6509804, 0, 1, 1,
0.6986001, -0.6509647, 1.888313, 0.654902, 0, 1, 1,
0.7040803, -1.372956, 1.372452, 0.6627451, 0, 1, 1,
0.7044372, 0.8201393, 0.7957716, 0.6666667, 0, 1, 1,
0.7161024, 0.7106557, 0.2847624, 0.6745098, 0, 1, 1,
0.7161462, -0.8051962, 0.9529656, 0.6784314, 0, 1, 1,
0.7268508, -0.1664657, 2.571563, 0.6862745, 0, 1, 1,
0.7322807, 0.4362971, -1.155322, 0.6901961, 0, 1, 1,
0.7357275, -0.008682073, 0.9650894, 0.6980392, 0, 1, 1,
0.740733, 1.452937, 0.1536302, 0.7058824, 0, 1, 1,
0.7462555, 2.180871, -0.4685392, 0.7098039, 0, 1, 1,
0.7465883, 0.06905411, 1.792176, 0.7176471, 0, 1, 1,
0.7519439, 2.550898, 2.718552, 0.7215686, 0, 1, 1,
0.7522608, 2.053529, 0.7524881, 0.7294118, 0, 1, 1,
0.7525932, -0.7083468, 3.115436, 0.7333333, 0, 1, 1,
0.7534162, -0.01343259, 2.438443, 0.7411765, 0, 1, 1,
0.7564701, -1.166865, 1.121289, 0.7450981, 0, 1, 1,
0.7566116, 0.08464902, 2.603712, 0.7529412, 0, 1, 1,
0.756924, 1.32035, -0.5182233, 0.7568628, 0, 1, 1,
0.7629613, -0.7219648, 2.045616, 0.7647059, 0, 1, 1,
0.7652999, 1.0052, 1.063715, 0.7686275, 0, 1, 1,
0.7655616, -1.727765, 2.980311, 0.7764706, 0, 1, 1,
0.7700655, -0.03797664, 1.070188, 0.7803922, 0, 1, 1,
0.7744948, 0.1153583, 0.6554118, 0.7882353, 0, 1, 1,
0.7788733, -2.238101, 3.276462, 0.7921569, 0, 1, 1,
0.7796829, 1.116881, 1.666504, 0.8, 0, 1, 1,
0.7804572, 0.1151741, 0.5813867, 0.8078431, 0, 1, 1,
0.7808422, 0.3216948, 0.6369475, 0.8117647, 0, 1, 1,
0.7985612, -1.242329, 4.5173, 0.8196079, 0, 1, 1,
0.7999758, 0.7356576, -0.02780481, 0.8235294, 0, 1, 1,
0.8003789, 1.0164, 0.6811729, 0.8313726, 0, 1, 1,
0.8052089, 0.9051469, 0.3467407, 0.8352941, 0, 1, 1,
0.8052328, 1.787811, -0.08489298, 0.8431373, 0, 1, 1,
0.8076837, -0.9654013, 1.249855, 0.8470588, 0, 1, 1,
0.8094646, -1.053026, 3.48615, 0.854902, 0, 1, 1,
0.8109497, 1.156589, 1.528589, 0.8588235, 0, 1, 1,
0.810989, -1.577265, 2.52222, 0.8666667, 0, 1, 1,
0.8196396, 0.26722, -0.1190187, 0.8705882, 0, 1, 1,
0.8214409, -1.46502, 2.40573, 0.8784314, 0, 1, 1,
0.8215861, -0.8854443, 1.773051, 0.8823529, 0, 1, 1,
0.8223197, -0.4579592, 2.566033, 0.8901961, 0, 1, 1,
0.828684, 1.440418, 2.222432, 0.8941177, 0, 1, 1,
0.8351971, 0.6196376, 0.5563588, 0.9019608, 0, 1, 1,
0.8399925, 0.3806104, 0.9178345, 0.9098039, 0, 1, 1,
0.8408167, 1.177263, -1.065437, 0.9137255, 0, 1, 1,
0.8415389, -0.5373333, 2.095817, 0.9215686, 0, 1, 1,
0.8454835, -0.09799104, 2.761833, 0.9254902, 0, 1, 1,
0.8463619, -0.5658277, 1.022916, 0.9333333, 0, 1, 1,
0.8500949, 0.3928291, 0.01134899, 0.9372549, 0, 1, 1,
0.8511312, -0.6380084, 2.569308, 0.945098, 0, 1, 1,
0.8547631, -0.8649491, 0.1653446, 0.9490196, 0, 1, 1,
0.8594947, 0.1590563, 3.123303, 0.9568627, 0, 1, 1,
0.8604949, 1.909363, 0.8918616, 0.9607843, 0, 1, 1,
0.8625422, -1.043187, 2.556653, 0.9686275, 0, 1, 1,
0.8629046, 0.461757, 1.676745, 0.972549, 0, 1, 1,
0.8663241, -0.3479485, 1.245902, 0.9803922, 0, 1, 1,
0.8699601, 0.8522152, 0.6875978, 0.9843137, 0, 1, 1,
0.8707935, -0.346969, 1.563499, 0.9921569, 0, 1, 1,
0.8716103, 0.2896457, 0.6361004, 0.9960784, 0, 1, 1,
0.8751069, 1.997186, -1.591543, 1, 0, 0.9960784, 1,
0.8824034, -0.6228119, 2.530243, 1, 0, 0.9882353, 1,
0.8832453, 0.5450398, 1.947183, 1, 0, 0.9843137, 1,
0.8834007, -0.3438208, 1.167093, 1, 0, 0.9764706, 1,
0.8835366, -1.293635, 2.082062, 1, 0, 0.972549, 1,
0.8877782, -1.216829, 1.952599, 1, 0, 0.9647059, 1,
0.8895377, 0.7406427, 2.21379, 1, 0, 0.9607843, 1,
0.8899654, -1.780444, 2.631252, 1, 0, 0.9529412, 1,
0.8908224, -1.392989, 1.548072, 1, 0, 0.9490196, 1,
0.8954766, 1.541599, 0.7361292, 1, 0, 0.9411765, 1,
0.9075375, -1.187926, 1.45214, 1, 0, 0.9372549, 1,
0.9129486, 0.5491737, -0.341906, 1, 0, 0.9294118, 1,
0.9146632, 1.059853, -0.04580135, 1, 0, 0.9254902, 1,
0.9150686, 0.4871061, 2.468406, 1, 0, 0.9176471, 1,
0.9166383, -0.6897941, 2.431348, 1, 0, 0.9137255, 1,
0.9188747, 1.039201, 0.5261132, 1, 0, 0.9058824, 1,
0.9196272, -1.51312, 0.6444149, 1, 0, 0.9019608, 1,
0.9201555, -0.007830156, 1.919553, 1, 0, 0.8941177, 1,
0.9214639, 0.5938689, 0.6496623, 1, 0, 0.8862745, 1,
0.9269509, 0.3062577, 1.603408, 1, 0, 0.8823529, 1,
0.9316403, 1.494274, -0.1557114, 1, 0, 0.8745098, 1,
0.9413497, -1.468284, 3.400349, 1, 0, 0.8705882, 1,
0.9472364, 0.9688168, 1.333402, 1, 0, 0.8627451, 1,
0.9488806, 1.281067, 0.6389193, 1, 0, 0.8588235, 1,
0.9592676, 1.028508, 2.292644, 1, 0, 0.8509804, 1,
0.9623958, -1.520787, -0.1020748, 1, 0, 0.8470588, 1,
0.964153, -0.0272941, 1.93406, 1, 0, 0.8392157, 1,
0.9687741, 1.34087, 0.7304192, 1, 0, 0.8352941, 1,
0.9770517, 1.225524, 2.178185, 1, 0, 0.827451, 1,
0.9827551, -1.201789, 0.5354921, 1, 0, 0.8235294, 1,
0.9921079, 0.1019779, 2.170942, 1, 0, 0.8156863, 1,
0.9938604, -0.02247324, 1.901177, 1, 0, 0.8117647, 1,
0.9961389, 0.2222554, 0.9020112, 1, 0, 0.8039216, 1,
1.000137, -0.2334509, 2.691633, 1, 0, 0.7960784, 1,
1.001576, -0.4347664, 3.24249, 1, 0, 0.7921569, 1,
1.011137, -0.1389695, 1.405483, 1, 0, 0.7843137, 1,
1.013879, 0.08734129, 3.808231, 1, 0, 0.7803922, 1,
1.017792, 0.7503092, 0.9247124, 1, 0, 0.772549, 1,
1.0183, 1.204757, 0.9697069, 1, 0, 0.7686275, 1,
1.02182, -1.10204, 2.492421, 1, 0, 0.7607843, 1,
1.02575, -0.2657959, 1.953368, 1, 0, 0.7568628, 1,
1.028267, 1.335793, 0.7006255, 1, 0, 0.7490196, 1,
1.03227, -1.614059, 2.350099, 1, 0, 0.7450981, 1,
1.033098, -0.8434591, 1.6997, 1, 0, 0.7372549, 1,
1.037679, -0.7315491, 1.207171, 1, 0, 0.7333333, 1,
1.038437, -1.401797, 3.594232, 1, 0, 0.7254902, 1,
1.039842, 0.7838966, 0.244096, 1, 0, 0.7215686, 1,
1.045822, 1.585824, 1.923563, 1, 0, 0.7137255, 1,
1.047451, 0.387804, 0.1968129, 1, 0, 0.7098039, 1,
1.051943, 1.06714, 1.105701, 1, 0, 0.7019608, 1,
1.062047, 0.02858766, 2.168168, 1, 0, 0.6941177, 1,
1.062273, 0.4118438, 0.5165836, 1, 0, 0.6901961, 1,
1.062562, -1.014085, 2.793936, 1, 0, 0.682353, 1,
1.065167, 0.9624078, 1.56483, 1, 0, 0.6784314, 1,
1.081761, 0.6002926, 0.1894793, 1, 0, 0.6705883, 1,
1.082313, 0.4676639, 0.9907396, 1, 0, 0.6666667, 1,
1.092866, -0.9465688, 2.115392, 1, 0, 0.6588235, 1,
1.108574, -0.7749643, 1.634684, 1, 0, 0.654902, 1,
1.108911, 0.2191161, 1.651576, 1, 0, 0.6470588, 1,
1.120829, -0.08895243, 1.404601, 1, 0, 0.6431373, 1,
1.120932, 1.723476, 1.105175, 1, 0, 0.6352941, 1,
1.126606, 0.1780315, 3.230246, 1, 0, 0.6313726, 1,
1.134029, -0.6970245, 0.8708723, 1, 0, 0.6235294, 1,
1.146143, 0.2700919, 0.4197615, 1, 0, 0.6196079, 1,
1.149716, 1.747535, -0.3362461, 1, 0, 0.6117647, 1,
1.164725, -1.596132, 1.63782, 1, 0, 0.6078432, 1,
1.16502, 2.160014, 1.968912, 1, 0, 0.6, 1,
1.166743, 0.8818526, 1.935362, 1, 0, 0.5921569, 1,
1.169645, -0.03857451, 0.7736454, 1, 0, 0.5882353, 1,
1.170334, 0.3153377, 0.7156538, 1, 0, 0.5803922, 1,
1.172144, -0.5440508, 3.642277, 1, 0, 0.5764706, 1,
1.182783, 0.3129736, 1.894959, 1, 0, 0.5686275, 1,
1.191625, 1.425681, -0.9995674, 1, 0, 0.5647059, 1,
1.192722, 1.363919, -0.8089347, 1, 0, 0.5568628, 1,
1.199023, 0.9904431, 2.850631, 1, 0, 0.5529412, 1,
1.201414, 0.7074462, 2.406901, 1, 0, 0.5450981, 1,
1.204962, -0.003694711, 2.805672, 1, 0, 0.5411765, 1,
1.209696, -0.7931933, 2.484453, 1, 0, 0.5333334, 1,
1.209938, -0.6511921, 1.566753, 1, 0, 0.5294118, 1,
1.219424, -1.891281, 3.809164, 1, 0, 0.5215687, 1,
1.219563, -1.352154, 2.4154, 1, 0, 0.5176471, 1,
1.222266, 0.6434723, -0.6835213, 1, 0, 0.509804, 1,
1.223205, -1.013183, 1.491599, 1, 0, 0.5058824, 1,
1.231464, -0.707339, 3.416731, 1, 0, 0.4980392, 1,
1.232289, -0.1800031, 0.8013496, 1, 0, 0.4901961, 1,
1.248735, -0.289665, 0.846813, 1, 0, 0.4862745, 1,
1.255143, 1.035006, 1.59572, 1, 0, 0.4784314, 1,
1.257695, -1.431815, 3.096138, 1, 0, 0.4745098, 1,
1.258748, 1.079818, 2.993174, 1, 0, 0.4666667, 1,
1.265132, -0.07887751, 2.427068, 1, 0, 0.4627451, 1,
1.268544, 1.001656, -0.06462616, 1, 0, 0.454902, 1,
1.270766, -0.3156618, 0.39985, 1, 0, 0.4509804, 1,
1.276301, -0.3000086, -0.6780264, 1, 0, 0.4431373, 1,
1.282525, -0.1632128, 0.8868811, 1, 0, 0.4392157, 1,
1.293558, -0.3545465, 2.252792, 1, 0, 0.4313726, 1,
1.298116, -0.2902305, 2.076171, 1, 0, 0.427451, 1,
1.302673, 1.303541, 0.3853962, 1, 0, 0.4196078, 1,
1.305163, -0.09172508, 1.569025, 1, 0, 0.4156863, 1,
1.314336, -0.4338685, 0.7315819, 1, 0, 0.4078431, 1,
1.314506, 0.2626708, 1.156962, 1, 0, 0.4039216, 1,
1.374222, -0.4507865, 1.973449, 1, 0, 0.3960784, 1,
1.38617, -0.5303863, 0.4482391, 1, 0, 0.3882353, 1,
1.421172, -0.6684879, 1.361014, 1, 0, 0.3843137, 1,
1.423889, -0.3581508, -0.01939932, 1, 0, 0.3764706, 1,
1.427674, -0.06804217, 2.096196, 1, 0, 0.372549, 1,
1.433345, 1.898548, 1.035679, 1, 0, 0.3647059, 1,
1.433928, 0.7535154, 0.4314496, 1, 0, 0.3607843, 1,
1.436028, 0.2505678, 1.394317, 1, 0, 0.3529412, 1,
1.466667, 1.141521, 0.9782175, 1, 0, 0.3490196, 1,
1.485448, 0.9370313, 2.178667, 1, 0, 0.3411765, 1,
1.487489, -0.5674565, 2.290766, 1, 0, 0.3372549, 1,
1.488658, 0.0656194, -0.1933623, 1, 0, 0.3294118, 1,
1.499537, 0.138049, 3.096124, 1, 0, 0.3254902, 1,
1.502258, 1.464457, 0.6539716, 1, 0, 0.3176471, 1,
1.523898, -1.059404, 1.582654, 1, 0, 0.3137255, 1,
1.529422, 1.011517, 1.662709, 1, 0, 0.3058824, 1,
1.536904, -0.07444432, 1.721268, 1, 0, 0.2980392, 1,
1.562108, -0.4151139, 0.8662389, 1, 0, 0.2941177, 1,
1.564965, -0.1009564, 1.449823, 1, 0, 0.2862745, 1,
1.570446, -0.858526, 3.322337, 1, 0, 0.282353, 1,
1.606578, -0.9774832, 2.684248, 1, 0, 0.2745098, 1,
1.62192, -1.039162, 1.602121, 1, 0, 0.2705882, 1,
1.624242, 0.9842319, -0.8186717, 1, 0, 0.2627451, 1,
1.629554, 1.459728, 3.282266, 1, 0, 0.2588235, 1,
1.643052, 1.362556, 2.862428, 1, 0, 0.2509804, 1,
1.644346, -0.8409615, 2.395394, 1, 0, 0.2470588, 1,
1.701426, -1.940407, 2.276986, 1, 0, 0.2392157, 1,
1.709746, -1.151116, 1.26016, 1, 0, 0.2352941, 1,
1.729764, -0.38895, 0.5897626, 1, 0, 0.227451, 1,
1.734138, 0.6534201, 2.19717, 1, 0, 0.2235294, 1,
1.736669, -1.445519, 1.970705, 1, 0, 0.2156863, 1,
1.73988, 0.7039772, 1.284366, 1, 0, 0.2117647, 1,
1.741994, -2.1445, 1.922073, 1, 0, 0.2039216, 1,
1.766706, -1.591501, 2.992596, 1, 0, 0.1960784, 1,
1.795661, 0.2207718, 1.960856, 1, 0, 0.1921569, 1,
1.810665, -0.04207495, 0.2664693, 1, 0, 0.1843137, 1,
1.861459, 0.1245264, 4.182839, 1, 0, 0.1803922, 1,
1.878349, -1.34763, 1.666507, 1, 0, 0.172549, 1,
1.878672, 0.8261748, 0.9594532, 1, 0, 0.1686275, 1,
1.954642, 0.04586609, 0.09147274, 1, 0, 0.1607843, 1,
1.959575, 1.667654, 1.100524, 1, 0, 0.1568628, 1,
1.975852, 0.5604958, 2.974686, 1, 0, 0.1490196, 1,
1.991817, 0.6131527, 2.076126, 1, 0, 0.145098, 1,
2.000624, 1.345501, 0.2391382, 1, 0, 0.1372549, 1,
2.011112, -0.1390019, 1.726026, 1, 0, 0.1333333, 1,
2.067315, -0.3596007, 1.592339, 1, 0, 0.1254902, 1,
2.094552, -1.111075, 0.3237272, 1, 0, 0.1215686, 1,
2.102912, 2.546566, 2.125906, 1, 0, 0.1137255, 1,
2.133783, 0.1042225, 2.13588, 1, 0, 0.1098039, 1,
2.163911, 0.2403257, 2.229989, 1, 0, 0.1019608, 1,
2.165515, -0.8901212, 2.064442, 1, 0, 0.09411765, 1,
2.177681, 0.1799857, 1.31021, 1, 0, 0.09019608, 1,
2.213632, 0.24802, 0.8607234, 1, 0, 0.08235294, 1,
2.218841, -0.7829323, 2.857487, 1, 0, 0.07843138, 1,
2.228088, 1.198792, 1.430648, 1, 0, 0.07058824, 1,
2.25359, 0.6921076, 1.390891, 1, 0, 0.06666667, 1,
2.304304, 2.085507, 1.902167, 1, 0, 0.05882353, 1,
2.307447, -0.8092324, 1.767765, 1, 0, 0.05490196, 1,
2.417265, 0.9365757, 1.392179, 1, 0, 0.04705882, 1,
2.442525, -1.039535, 0.9277346, 1, 0, 0.04313726, 1,
2.479271, -0.3087267, 1.394865, 1, 0, 0.03529412, 1,
2.546206, -0.06839718, 2.527681, 1, 0, 0.03137255, 1,
2.560596, -1.122574, 2.249522, 1, 0, 0.02352941, 1,
2.566183, -0.6847016, 2.748413, 1, 0, 0.01960784, 1,
2.698487, 0.5968855, 0.4026872, 1, 0, 0.01176471, 1,
3.229278, 2.065733, 3.789841, 1, 0, 0.007843138, 1
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
0.08124328, -4.640903, -6.964298, 0, -0.5, 0.5, 0.5,
0.08124328, -4.640903, -6.964298, 1, -0.5, 0.5, 0.5,
0.08124328, -4.640903, -6.964298, 1, 1.5, 0.5, 0.5,
0.08124328, -4.640903, -6.964298, 0, 1.5, 0.5, 0.5
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
-4.133976, -0.3632067, -6.964298, 0, -0.5, 0.5, 0.5,
-4.133976, -0.3632067, -6.964298, 1, -0.5, 0.5, 0.5,
-4.133976, -0.3632067, -6.964298, 1, 1.5, 0.5, 0.5,
-4.133976, -0.3632067, -6.964298, 0, 1.5, 0.5, 0.5
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
-4.133976, -4.640903, 0.05968261, 0, -0.5, 0.5, 0.5,
-4.133976, -4.640903, 0.05968261, 1, -0.5, 0.5, 0.5,
-4.133976, -4.640903, 0.05968261, 1, 1.5, 0.5, 0.5,
-4.133976, -4.640903, 0.05968261, 0, 1.5, 0.5, 0.5
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
-3, -3.653742, -5.343379,
3, -3.653742, -5.343379,
-3, -3.653742, -5.343379,
-3, -3.818269, -5.613533,
-2, -3.653742, -5.343379,
-2, -3.818269, -5.613533,
-1, -3.653742, -5.343379,
-1, -3.818269, -5.613533,
0, -3.653742, -5.343379,
0, -3.818269, -5.613533,
1, -3.653742, -5.343379,
1, -3.818269, -5.613533,
2, -3.653742, -5.343379,
2, -3.818269, -5.613533,
3, -3.653742, -5.343379,
3, -3.818269, -5.613533
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
-3, -4.147323, -6.153839, 0, -0.5, 0.5, 0.5,
-3, -4.147323, -6.153839, 1, -0.5, 0.5, 0.5,
-3, -4.147323, -6.153839, 1, 1.5, 0.5, 0.5,
-3, -4.147323, -6.153839, 0, 1.5, 0.5, 0.5,
-2, -4.147323, -6.153839, 0, -0.5, 0.5, 0.5,
-2, -4.147323, -6.153839, 1, -0.5, 0.5, 0.5,
-2, -4.147323, -6.153839, 1, 1.5, 0.5, 0.5,
-2, -4.147323, -6.153839, 0, 1.5, 0.5, 0.5,
-1, -4.147323, -6.153839, 0, -0.5, 0.5, 0.5,
-1, -4.147323, -6.153839, 1, -0.5, 0.5, 0.5,
-1, -4.147323, -6.153839, 1, 1.5, 0.5, 0.5,
-1, -4.147323, -6.153839, 0, 1.5, 0.5, 0.5,
0, -4.147323, -6.153839, 0, -0.5, 0.5, 0.5,
0, -4.147323, -6.153839, 1, -0.5, 0.5, 0.5,
0, -4.147323, -6.153839, 1, 1.5, 0.5, 0.5,
0, -4.147323, -6.153839, 0, 1.5, 0.5, 0.5,
1, -4.147323, -6.153839, 0, -0.5, 0.5, 0.5,
1, -4.147323, -6.153839, 1, -0.5, 0.5, 0.5,
1, -4.147323, -6.153839, 1, 1.5, 0.5, 0.5,
1, -4.147323, -6.153839, 0, 1.5, 0.5, 0.5,
2, -4.147323, -6.153839, 0, -0.5, 0.5, 0.5,
2, -4.147323, -6.153839, 1, -0.5, 0.5, 0.5,
2, -4.147323, -6.153839, 1, 1.5, 0.5, 0.5,
2, -4.147323, -6.153839, 0, 1.5, 0.5, 0.5,
3, -4.147323, -6.153839, 0, -0.5, 0.5, 0.5,
3, -4.147323, -6.153839, 1, -0.5, 0.5, 0.5,
3, -4.147323, -6.153839, 1, 1.5, 0.5, 0.5,
3, -4.147323, -6.153839, 0, 1.5, 0.5, 0.5
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
-3.161233, -3, -5.343379,
-3.161233, 2, -5.343379,
-3.161233, -3, -5.343379,
-3.323357, -3, -5.613533,
-3.161233, -2, -5.343379,
-3.323357, -2, -5.613533,
-3.161233, -1, -5.343379,
-3.323357, -1, -5.613533,
-3.161233, 0, -5.343379,
-3.323357, 0, -5.613533,
-3.161233, 1, -5.343379,
-3.323357, 1, -5.613533,
-3.161233, 2, -5.343379,
-3.323357, 2, -5.613533
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
-3.647604, -3, -6.153839, 0, -0.5, 0.5, 0.5,
-3.647604, -3, -6.153839, 1, -0.5, 0.5, 0.5,
-3.647604, -3, -6.153839, 1, 1.5, 0.5, 0.5,
-3.647604, -3, -6.153839, 0, 1.5, 0.5, 0.5,
-3.647604, -2, -6.153839, 0, -0.5, 0.5, 0.5,
-3.647604, -2, -6.153839, 1, -0.5, 0.5, 0.5,
-3.647604, -2, -6.153839, 1, 1.5, 0.5, 0.5,
-3.647604, -2, -6.153839, 0, 1.5, 0.5, 0.5,
-3.647604, -1, -6.153839, 0, -0.5, 0.5, 0.5,
-3.647604, -1, -6.153839, 1, -0.5, 0.5, 0.5,
-3.647604, -1, -6.153839, 1, 1.5, 0.5, 0.5,
-3.647604, -1, -6.153839, 0, 1.5, 0.5, 0.5,
-3.647604, 0, -6.153839, 0, -0.5, 0.5, 0.5,
-3.647604, 0, -6.153839, 1, -0.5, 0.5, 0.5,
-3.647604, 0, -6.153839, 1, 1.5, 0.5, 0.5,
-3.647604, 0, -6.153839, 0, 1.5, 0.5, 0.5,
-3.647604, 1, -6.153839, 0, -0.5, 0.5, 0.5,
-3.647604, 1, -6.153839, 1, -0.5, 0.5, 0.5,
-3.647604, 1, -6.153839, 1, 1.5, 0.5, 0.5,
-3.647604, 1, -6.153839, 0, 1.5, 0.5, 0.5,
-3.647604, 2, -6.153839, 0, -0.5, 0.5, 0.5,
-3.647604, 2, -6.153839, 1, -0.5, 0.5, 0.5,
-3.647604, 2, -6.153839, 1, 1.5, 0.5, 0.5,
-3.647604, 2, -6.153839, 0, 1.5, 0.5, 0.5
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
-3.161233, -3.653742, -4,
-3.161233, -3.653742, 4,
-3.161233, -3.653742, -4,
-3.323357, -3.818269, -4,
-3.161233, -3.653742, -2,
-3.323357, -3.818269, -2,
-3.161233, -3.653742, 0,
-3.323357, -3.818269, 0,
-3.161233, -3.653742, 2,
-3.323357, -3.818269, 2,
-3.161233, -3.653742, 4,
-3.323357, -3.818269, 4
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
-3.647604, -4.147323, -4, 0, -0.5, 0.5, 0.5,
-3.647604, -4.147323, -4, 1, -0.5, 0.5, 0.5,
-3.647604, -4.147323, -4, 1, 1.5, 0.5, 0.5,
-3.647604, -4.147323, -4, 0, 1.5, 0.5, 0.5,
-3.647604, -4.147323, -2, 0, -0.5, 0.5, 0.5,
-3.647604, -4.147323, -2, 1, -0.5, 0.5, 0.5,
-3.647604, -4.147323, -2, 1, 1.5, 0.5, 0.5,
-3.647604, -4.147323, -2, 0, 1.5, 0.5, 0.5,
-3.647604, -4.147323, 0, 0, -0.5, 0.5, 0.5,
-3.647604, -4.147323, 0, 1, -0.5, 0.5, 0.5,
-3.647604, -4.147323, 0, 1, 1.5, 0.5, 0.5,
-3.647604, -4.147323, 0, 0, 1.5, 0.5, 0.5,
-3.647604, -4.147323, 2, 0, -0.5, 0.5, 0.5,
-3.647604, -4.147323, 2, 1, -0.5, 0.5, 0.5,
-3.647604, -4.147323, 2, 1, 1.5, 0.5, 0.5,
-3.647604, -4.147323, 2, 0, 1.5, 0.5, 0.5,
-3.647604, -4.147323, 4, 0, -0.5, 0.5, 0.5,
-3.647604, -4.147323, 4, 1, -0.5, 0.5, 0.5,
-3.647604, -4.147323, 4, 1, 1.5, 0.5, 0.5,
-3.647604, -4.147323, 4, 0, 1.5, 0.5, 0.5
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
-3.161233, -3.653742, -5.343379,
-3.161233, 2.927329, -5.343379,
-3.161233, -3.653742, 5.462745,
-3.161233, 2.927329, 5.462745,
-3.161233, -3.653742, -5.343379,
-3.161233, -3.653742, 5.462745,
-3.161233, 2.927329, -5.343379,
-3.161233, 2.927329, 5.462745,
-3.161233, -3.653742, -5.343379,
3.323719, -3.653742, -5.343379,
-3.161233, -3.653742, 5.462745,
3.323719, -3.653742, 5.462745,
-3.161233, 2.927329, -5.343379,
3.323719, 2.927329, -5.343379,
-3.161233, 2.927329, 5.462745,
3.323719, 2.927329, 5.462745,
3.323719, -3.653742, -5.343379,
3.323719, 2.927329, -5.343379,
3.323719, -3.653742, 5.462745,
3.323719, 2.927329, 5.462745,
3.323719, -3.653742, -5.343379,
3.323719, -3.653742, 5.462745,
3.323719, 2.927329, -5.343379,
3.323719, 2.927329, 5.462745
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
var radius = 7.591871;
var distance = 33.77709;
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
mvMatrix.translate( -0.08124328, 0.3632067, -0.05968261 );
mvMatrix.scale( 1.265773, 1.247286, 0.7596137 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.77709);
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
silafluofen<-read.table("silafluofen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-silafluofen$V2
```

```
## Error in eval(expr, envir, enclos): object 'silafluofen' not found
```

```r
y<-silafluofen$V3
```

```
## Error in eval(expr, envir, enclos): object 'silafluofen' not found
```

```r
z<-silafluofen$V4
```

```
## Error in eval(expr, envir, enclos): object 'silafluofen' not found
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
-3.066792, -0.3947647, -0.1968476, 0, 0, 1, 1, 1,
-2.812697, 0.4141403, -0.3042598, 1, 0, 0, 1, 1,
-2.806285, -0.3371263, -0.4036573, 1, 0, 0, 1, 1,
-2.753713, 1.458155, -0.09540962, 1, 0, 0, 1, 1,
-2.667085, 1.887042, -0.9628602, 1, 0, 0, 1, 1,
-2.442907, -1.292311, -1.787285, 1, 0, 0, 1, 1,
-2.421372, 1.530923, -0.2315114, 0, 0, 0, 1, 1,
-2.385472, 1.454619, -0.680196, 0, 0, 0, 1, 1,
-2.367197, -1.583149, -1.830393, 0, 0, 0, 1, 1,
-2.316297, -0.6355224, -2.236735, 0, 0, 0, 1, 1,
-2.276345, 1.527291, -0.9560777, 0, 0, 0, 1, 1,
-2.257419, 0.5601231, -2.383859, 0, 0, 0, 1, 1,
-2.257346, 1.515997, -2.029705, 0, 0, 0, 1, 1,
-2.231335, 0.257856, -1.18791, 1, 1, 1, 1, 1,
-2.225637, 0.1363444, -0.1265335, 1, 1, 1, 1, 1,
-2.222507, 1.472621, -2.437365, 1, 1, 1, 1, 1,
-2.222369, 0.003116565, -1.527996, 1, 1, 1, 1, 1,
-2.217938, -0.1897276, -2.576859, 1, 1, 1, 1, 1,
-2.162416, 1.610423, -0.2270114, 1, 1, 1, 1, 1,
-2.154409, 1.418267, -2.522258, 1, 1, 1, 1, 1,
-2.141283, 2.300674, -1.615356, 1, 1, 1, 1, 1,
-2.141172, 0.2138307, -1.191725, 1, 1, 1, 1, 1,
-2.133652, -1.045899, -1.102596, 1, 1, 1, 1, 1,
-2.11841, 1.099301, -2.604461, 1, 1, 1, 1, 1,
-2.08515, -0.4411162, -2.598761, 1, 1, 1, 1, 1,
-2.077361, -0.09413053, -0.806887, 1, 1, 1, 1, 1,
-2.065911, -0.002305982, -3.442481, 1, 1, 1, 1, 1,
-2.036995, 0.003701061, -2.454439, 1, 1, 1, 1, 1,
-2.034727, -1.216597, -1.905145, 0, 0, 1, 1, 1,
-1.980808, 0.7802272, 0.01632419, 1, 0, 0, 1, 1,
-1.946949, -1.040777, -0.4003899, 1, 0, 0, 1, 1,
-1.94462, 0.7851546, -1.824412, 1, 0, 0, 1, 1,
-1.936515, 0.0369743, -0.3215045, 1, 0, 0, 1, 1,
-1.931464, 0.5618706, -1.044348, 1, 0, 0, 1, 1,
-1.922228, 1.257, -3.158261, 0, 0, 0, 1, 1,
-1.912581, 0.5076287, -0.4878102, 0, 0, 0, 1, 1,
-1.906624, -0.4534366, -0.5197278, 0, 0, 0, 1, 1,
-1.895371, -0.2665715, 0.2090291, 0, 0, 0, 1, 1,
-1.86006, 0.5852112, -1.663081, 0, 0, 0, 1, 1,
-1.854481, 0.4952368, -0.6569824, 0, 0, 0, 1, 1,
-1.849623, -0.2797822, -2.300089, 0, 0, 0, 1, 1,
-1.828905, -1.195949, -4.670797, 1, 1, 1, 1, 1,
-1.824242, -0.03142503, -1.022342, 1, 1, 1, 1, 1,
-1.805475, -0.5562752, -2.609875, 1, 1, 1, 1, 1,
-1.793544, -0.8900669, -0.7488785, 1, 1, 1, 1, 1,
-1.788695, 0.4473338, -2.296209, 1, 1, 1, 1, 1,
-1.77608, -0.9976821, -4.503118, 1, 1, 1, 1, 1,
-1.775975, 1.655664, -0.4592159, 1, 1, 1, 1, 1,
-1.771392, 0.9488317, 0.114275, 1, 1, 1, 1, 1,
-1.746347, 0.7096844, -1.16291, 1, 1, 1, 1, 1,
-1.74534, -0.1876621, -0.5699166, 1, 1, 1, 1, 1,
-1.727054, -0.835132, -1.068146, 1, 1, 1, 1, 1,
-1.716045, 0.2230244, -1.851075, 1, 1, 1, 1, 1,
-1.706937, 1.14904, -1.399824, 1, 1, 1, 1, 1,
-1.677948, -0.5652701, -2.486505, 1, 1, 1, 1, 1,
-1.673266, -2.078923, -3.059903, 1, 1, 1, 1, 1,
-1.66272, -0.1433768, -0.7241863, 0, 0, 1, 1, 1,
-1.651683, -0.1572604, -1.760128, 1, 0, 0, 1, 1,
-1.647247, -0.685811, -1.823313, 1, 0, 0, 1, 1,
-1.646404, -1.547478, -1.542619, 1, 0, 0, 1, 1,
-1.593856, -0.598041, -2.104405, 1, 0, 0, 1, 1,
-1.579255, 1.509917, -0.8073841, 1, 0, 0, 1, 1,
-1.576645, -0.9458796, -1.910731, 0, 0, 0, 1, 1,
-1.568324, 1.44547, 0.5208732, 0, 0, 0, 1, 1,
-1.568213, -0.884963, -2.249216, 0, 0, 0, 1, 1,
-1.554239, -0.6386105, -1.256866, 0, 0, 0, 1, 1,
-1.551925, -1.345467, -1.102695, 0, 0, 0, 1, 1,
-1.547262, -1.982918, -0.8984271, 0, 0, 0, 1, 1,
-1.527442, -0.06620126, -3.727282, 0, 0, 0, 1, 1,
-1.517247, -0.6465663, -3.333819, 1, 1, 1, 1, 1,
-1.514229, -0.6685822, -1.390672, 1, 1, 1, 1, 1,
-1.509508, 1.67875, -0.9866212, 1, 1, 1, 1, 1,
-1.504631, -0.7137696, -0.8887197, 1, 1, 1, 1, 1,
-1.499122, -0.9619349, -1.036876, 1, 1, 1, 1, 1,
-1.493337, -0.1002627, -0.8620251, 1, 1, 1, 1, 1,
-1.493276, -0.01807822, -1.096987, 1, 1, 1, 1, 1,
-1.449888, -1.706577, -4.155672, 1, 1, 1, 1, 1,
-1.448068, 0.3243462, -1.588719, 1, 1, 1, 1, 1,
-1.44009, 0.8826801, -0.992839, 1, 1, 1, 1, 1,
-1.435681, -0.7065649, -1.194951, 1, 1, 1, 1, 1,
-1.427147, -2.239713, -1.788448, 1, 1, 1, 1, 1,
-1.410762, -1.272795, -2.178191, 1, 1, 1, 1, 1,
-1.408376, -1.344643, -4.328607, 1, 1, 1, 1, 1,
-1.405161, -0.271551, -0.6331816, 1, 1, 1, 1, 1,
-1.390385, 0.8219133, -3.038366, 0, 0, 1, 1, 1,
-1.375712, 0.110159, -1.677845, 1, 0, 0, 1, 1,
-1.372897, 0.6408816, -0.9677551, 1, 0, 0, 1, 1,
-1.366495, 0.4374685, -1.348958, 1, 0, 0, 1, 1,
-1.361742, -1.149875, -2.585849, 1, 0, 0, 1, 1,
-1.359388, 0.6455227, -1.38677, 1, 0, 0, 1, 1,
-1.35723, 1.733836, 0.9524435, 0, 0, 0, 1, 1,
-1.351025, -0.1120989, -2.81387, 0, 0, 0, 1, 1,
-1.350649, -1.092112, -3.213607, 0, 0, 0, 1, 1,
-1.349639, -1.120245, -2.000036, 0, 0, 0, 1, 1,
-1.345904, -0.9307345, -2.091744, 0, 0, 0, 1, 1,
-1.338043, -1.689377, -0.5678668, 0, 0, 0, 1, 1,
-1.334599, 0.7422014, -0.4780806, 0, 0, 0, 1, 1,
-1.331224, -0.0663957, -1.724679, 1, 1, 1, 1, 1,
-1.330584, -0.8309417, -2.824079, 1, 1, 1, 1, 1,
-1.330053, 0.7758461, -1.883642, 1, 1, 1, 1, 1,
-1.324585, -1.202944, -3.2321, 1, 1, 1, 1, 1,
-1.319933, 1.527579, 0.5740838, 1, 1, 1, 1, 1,
-1.318583, -1.216676, -1.849815, 1, 1, 1, 1, 1,
-1.309014, 0.8244429, -1.749236, 1, 1, 1, 1, 1,
-1.304569, -0.4454601, -2.769665, 1, 1, 1, 1, 1,
-1.291109, -0.9240856, -1.094955, 1, 1, 1, 1, 1,
-1.285347, 1.586677, 0.480222, 1, 1, 1, 1, 1,
-1.283552, -1.073456, -2.066145, 1, 1, 1, 1, 1,
-1.271898, 0.1131821, -2.204361, 1, 1, 1, 1, 1,
-1.262976, 0.6943943, -1.786585, 1, 1, 1, 1, 1,
-1.260645, 1.056356, -3.06481, 1, 1, 1, 1, 1,
-1.257171, 0.4664195, -0.7396591, 1, 1, 1, 1, 1,
-1.255468, -0.8860493, -2.875673, 0, 0, 1, 1, 1,
-1.253769, 0.1291396, -2.581843, 1, 0, 0, 1, 1,
-1.236003, -1.627063, -4.36966, 1, 0, 0, 1, 1,
-1.224367, 0.5271006, -0.8167235, 1, 0, 0, 1, 1,
-1.220872, 0.3424256, -2.508158, 1, 0, 0, 1, 1,
-1.216621, -1.34318, -0.489003, 1, 0, 0, 1, 1,
-1.20742, -0.2027964, -3.191119, 0, 0, 0, 1, 1,
-1.20635, 0.9728975, -0.9778754, 0, 0, 0, 1, 1,
-1.199397, 1.151434, -0.5529431, 0, 0, 0, 1, 1,
-1.199056, -0.8088331, -3.402095, 0, 0, 0, 1, 1,
-1.182198, -0.4691355, -1.813421, 0, 0, 0, 1, 1,
-1.162254, -0.571714, -2.438154, 0, 0, 0, 1, 1,
-1.162074, 0.2061896, -3.477992, 0, 0, 0, 1, 1,
-1.155229, 0.08439748, -2.866671, 1, 1, 1, 1, 1,
-1.146814, 0.5250228, -2.46911, 1, 1, 1, 1, 1,
-1.14654, -0.02951997, -2.935487, 1, 1, 1, 1, 1,
-1.138543, -1.310846, -1.575698, 1, 1, 1, 1, 1,
-1.136124, 0.6735991, -0.4493242, 1, 1, 1, 1, 1,
-1.134028, 2.560989, 0.7158973, 1, 1, 1, 1, 1,
-1.120168, -0.04756305, -0.5740086, 1, 1, 1, 1, 1,
-1.118947, 0.2427439, -0.2938258, 1, 1, 1, 1, 1,
-1.118667, 1.237934, -2.248364, 1, 1, 1, 1, 1,
-1.115065, 0.07523264, -1.82099, 1, 1, 1, 1, 1,
-1.109269, 0.8442734, -0.4051476, 1, 1, 1, 1, 1,
-1.107705, 0.7249423, -2.315465, 1, 1, 1, 1, 1,
-1.10699, -1.603137, -3.939786, 1, 1, 1, 1, 1,
-1.101706, -0.6740065, -3.163786, 1, 1, 1, 1, 1,
-1.094266, 0.408818, -0.02603867, 1, 1, 1, 1, 1,
-1.092414, -1.104427, -1.916473, 0, 0, 1, 1, 1,
-1.088382, 0.4304878, -2.339888, 1, 0, 0, 1, 1,
-1.082405, 1.218834, -0.2567328, 1, 0, 0, 1, 1,
-1.080799, 0.5088875, -0.760492, 1, 0, 0, 1, 1,
-1.074839, 0.4134504, -2.25226, 1, 0, 0, 1, 1,
-1.074648, 1.283105, -1.010989, 1, 0, 0, 1, 1,
-1.061125, -0.07254381, -0.6206438, 0, 0, 0, 1, 1,
-1.060358, -1.46311, -1.963418, 0, 0, 0, 1, 1,
-1.05388, 0.09463751, -2.529842, 0, 0, 0, 1, 1,
-1.047244, 0.9161302, -1.314444, 0, 0, 0, 1, 1,
-1.036135, -0.6137499, -2.691753, 0, 0, 0, 1, 1,
-1.03225, 0.9548482, -1.549559, 0, 0, 0, 1, 1,
-1.030817, 0.7899838, -1.179493, 0, 0, 0, 1, 1,
-1.029614, 0.02439988, -1.543999, 1, 1, 1, 1, 1,
-1.02552, 0.1270264, -3.006813, 1, 1, 1, 1, 1,
-1.017203, -0.1143094, -1.781574, 1, 1, 1, 1, 1,
-1.016895, 0.4027167, -1.500813, 1, 1, 1, 1, 1,
-1.010845, 0.62235, -0.6634773, 1, 1, 1, 1, 1,
-0.9995784, -0.7459847, -3.05145, 1, 1, 1, 1, 1,
-0.9977561, -0.4510146, -3.258691, 1, 1, 1, 1, 1,
-0.9947016, -0.1461415, -1.949078, 1, 1, 1, 1, 1,
-0.990117, -0.3113634, -4.247093, 1, 1, 1, 1, 1,
-0.9857233, -0.6568643, -0.991384, 1, 1, 1, 1, 1,
-0.9834664, -0.5497587, -1.677701, 1, 1, 1, 1, 1,
-0.9819976, 1.019663, -1.681399, 1, 1, 1, 1, 1,
-0.978206, -1.401273, -2.680913, 1, 1, 1, 1, 1,
-0.964396, -1.564664, -2.548318, 1, 1, 1, 1, 1,
-0.9484634, -0.6294636, -2.176907, 1, 1, 1, 1, 1,
-0.9437498, -0.3214453, -2.67958, 0, 0, 1, 1, 1,
-0.9412622, 0.6975216, -0.9622293, 1, 0, 0, 1, 1,
-0.9383193, -0.07780879, -1.017711, 1, 0, 0, 1, 1,
-0.9368287, 0.8942685, -1.767174, 1, 0, 0, 1, 1,
-0.9363151, 0.757576, -2.15921, 1, 0, 0, 1, 1,
-0.9330382, -0.5987788, -2.959769, 1, 0, 0, 1, 1,
-0.9279233, 0.04934197, -1.288154, 0, 0, 0, 1, 1,
-0.9264489, -1.545714, -2.9116, 0, 0, 0, 1, 1,
-0.9262621, -0.3040745, -3.205399, 0, 0, 0, 1, 1,
-0.9253957, -0.8524474, -2.426859, 0, 0, 0, 1, 1,
-0.9206547, -0.1415248, -2.961331, 0, 0, 0, 1, 1,
-0.9204968, 0.6568273, -1.237477, 0, 0, 0, 1, 1,
-0.9177147, 0.07531875, -2.247075, 0, 0, 0, 1, 1,
-0.9171629, -0.1972813, -2.377468, 1, 1, 1, 1, 1,
-0.916382, -0.4324333, -0.4855068, 1, 1, 1, 1, 1,
-0.9151233, -1.252848, -0.7245717, 1, 1, 1, 1, 1,
-0.9121844, 0.6089016, -2.855695, 1, 1, 1, 1, 1,
-0.9116134, 0.4611006, -0.4283722, 1, 1, 1, 1, 1,
-0.910991, 1.37488, 0.119304, 1, 1, 1, 1, 1,
-0.9103783, -1.14259, -2.309456, 1, 1, 1, 1, 1,
-0.9098467, -0.2155719, -3.058563, 1, 1, 1, 1, 1,
-0.9065974, -0.2484326, -1.875573, 1, 1, 1, 1, 1,
-0.9056193, 0.7372999, -0.7548202, 1, 1, 1, 1, 1,
-0.9011949, -0.889215, -2.470019, 1, 1, 1, 1, 1,
-0.9004308, 0.5090815, -0.4910629, 1, 1, 1, 1, 1,
-0.899513, -0.3985196, -2.69027, 1, 1, 1, 1, 1,
-0.8950407, -0.2343784, -3.628294, 1, 1, 1, 1, 1,
-0.8927346, 1.023131, -0.5616747, 1, 1, 1, 1, 1,
-0.8899558, -0.06289487, -1.436697, 0, 0, 1, 1, 1,
-0.8864594, -0.6903744, -2.897621, 1, 0, 0, 1, 1,
-0.8769209, 0.5352085, 0.6010867, 1, 0, 0, 1, 1,
-0.8748184, 0.6956641, -1.638429, 1, 0, 0, 1, 1,
-0.8729617, -1.086598, -2.499413, 1, 0, 0, 1, 1,
-0.8666752, 0.3959196, -2.369362, 1, 0, 0, 1, 1,
-0.85048, -0.5921816, -2.122741, 0, 0, 0, 1, 1,
-0.8443969, -1.060142, -4.815194, 0, 0, 0, 1, 1,
-0.8429717, 0.718138, -2.215384, 0, 0, 0, 1, 1,
-0.8428745, 1.186998, -0.6300838, 0, 0, 0, 1, 1,
-0.8428296, 0.08556633, -2.439202, 0, 0, 0, 1, 1,
-0.8415166, 0.7036383, -1.263399, 0, 0, 0, 1, 1,
-0.8409137, 1.821501, 0.4275206, 0, 0, 0, 1, 1,
-0.8389263, -0.7814123, -3.708782, 1, 1, 1, 1, 1,
-0.8354517, 0.6409151, 0.8931639, 1, 1, 1, 1, 1,
-0.8333117, -0.4978876, -3.52945, 1, 1, 1, 1, 1,
-0.8197622, 0.578357, -2.044321, 1, 1, 1, 1, 1,
-0.815896, 1.395601, -0.584747, 1, 1, 1, 1, 1,
-0.8118352, 1.068614, 0.2084371, 1, 1, 1, 1, 1,
-0.8035816, 0.6145001, -0.7784401, 1, 1, 1, 1, 1,
-0.8017056, 0.5167329, -1.348173, 1, 1, 1, 1, 1,
-0.7998278, -0.6885867, -1.660721, 1, 1, 1, 1, 1,
-0.7986007, 0.1585164, -1.313941, 1, 1, 1, 1, 1,
-0.7979802, -0.2257885, -0.3826795, 1, 1, 1, 1, 1,
-0.7914947, -0.1575644, -1.424862, 1, 1, 1, 1, 1,
-0.7887996, -0.22625, -0.3799871, 1, 1, 1, 1, 1,
-0.7885189, -0.8816279, -2.62779, 1, 1, 1, 1, 1,
-0.783474, 0.2447742, 0.3804356, 1, 1, 1, 1, 1,
-0.7781256, -2.331732, -2.005652, 0, 0, 1, 1, 1,
-0.7717234, -1.271444, -2.932026, 1, 0, 0, 1, 1,
-0.764856, 0.4848393, -1.40529, 1, 0, 0, 1, 1,
-0.7579898, -0.7713929, -3.832153, 1, 0, 0, 1, 1,
-0.7561657, -0.8366182, -3.816815, 1, 0, 0, 1, 1,
-0.7534454, 0.1555861, -2.325165, 1, 0, 0, 1, 1,
-0.7524607, 0.9829094, -2.484193, 0, 0, 0, 1, 1,
-0.7519822, 0.2504582, -0.4884799, 0, 0, 0, 1, 1,
-0.7500632, 1.012286, -1.194819, 0, 0, 0, 1, 1,
-0.7493675, -0.4058017, -1.61622, 0, 0, 0, 1, 1,
-0.7459549, -0.02754601, -0.9991052, 0, 0, 0, 1, 1,
-0.7454386, -1.77194, -3.109875, 0, 0, 0, 1, 1,
-0.7399679, -0.8637648, -1.340571, 0, 0, 0, 1, 1,
-0.7362521, -0.5459643, -1.37044, 1, 1, 1, 1, 1,
-0.7313039, 0.5811791, -0.8251522, 1, 1, 1, 1, 1,
-0.7257589, 1.678619, -0.9384224, 1, 1, 1, 1, 1,
-0.724527, -0.8411869, -3.633392, 1, 1, 1, 1, 1,
-0.7228453, 0.4716023, -2.648131, 1, 1, 1, 1, 1,
-0.7226257, 0.1506939, -1.421907, 1, 1, 1, 1, 1,
-0.7183906, -0.7872573, -2.850527, 1, 1, 1, 1, 1,
-0.7174147, 0.5071034, -0.7024103, 1, 1, 1, 1, 1,
-0.7158631, -0.2736869, -1.385722, 1, 1, 1, 1, 1,
-0.7156904, -1.131554, -1.372386, 1, 1, 1, 1, 1,
-0.7147418, 0.5062732, -0.2810638, 1, 1, 1, 1, 1,
-0.7122503, 1.202075, -1.525026, 1, 1, 1, 1, 1,
-0.7121337, -0.3961929, -1.773414, 1, 1, 1, 1, 1,
-0.7116743, 0.6289644, -0.9966601, 1, 1, 1, 1, 1,
-0.7095979, 1.074629, 0.6360262, 1, 1, 1, 1, 1,
-0.7015196, -0.0746567, -2.686664, 0, 0, 1, 1, 1,
-0.6976375, -0.009325312, -3.556998, 1, 0, 0, 1, 1,
-0.6895753, -1.684248, -3.381685, 1, 0, 0, 1, 1,
-0.6878116, -2.770456, -2.269453, 1, 0, 0, 1, 1,
-0.6853727, -1.025764, -3.724123, 1, 0, 0, 1, 1,
-0.6844085, 0.25962, -1.438891, 1, 0, 0, 1, 1,
-0.6771074, -0.108773, -1.534393, 0, 0, 0, 1, 1,
-0.6767824, 0.8353336, -1.924177, 0, 0, 0, 1, 1,
-0.6734685, -0.8598027, -1.742759, 0, 0, 0, 1, 1,
-0.6701641, 0.181262, -0.6787394, 0, 0, 0, 1, 1,
-0.6669134, 0.08215633, -0.9403987, 0, 0, 0, 1, 1,
-0.6653028, -0.4058002, -1.426934, 0, 0, 0, 1, 1,
-0.664664, -1.135641, -4.086997, 0, 0, 0, 1, 1,
-0.6643814, -0.1815747, -3.216538, 1, 1, 1, 1, 1,
-0.6585797, 0.9398505, -0.5855114, 1, 1, 1, 1, 1,
-0.6571203, 1.098303, 1.750776, 1, 1, 1, 1, 1,
-0.6560921, -1.360748, -2.52156, 1, 1, 1, 1, 1,
-0.6553835, -0.5185149, -2.254272, 1, 1, 1, 1, 1,
-0.6531864, -0.3236741, -1.032471, 1, 1, 1, 1, 1,
-0.652141, 0.5198011, -2.039688, 1, 1, 1, 1, 1,
-0.6517958, 0.0812304, -2.146093, 1, 1, 1, 1, 1,
-0.6421698, -0.5640656, 0.3042933, 1, 1, 1, 1, 1,
-0.6409888, -0.09827256, -1.685797, 1, 1, 1, 1, 1,
-0.6402733, 0.5925053, -1.209041, 1, 1, 1, 1, 1,
-0.6339337, 1.149776, -0.4897456, 1, 1, 1, 1, 1,
-0.6309797, -0.7593691, -0.7952, 1, 1, 1, 1, 1,
-0.6287777, -1.336249, -4.210068, 1, 1, 1, 1, 1,
-0.6238324, -1.004638, -1.55815, 1, 1, 1, 1, 1,
-0.6211224, -0.9876296, -3.206833, 0, 0, 1, 1, 1,
-0.6199138, -0.3538812, -2.731733, 1, 0, 0, 1, 1,
-0.6196161, -1.321441, -3.054672, 1, 0, 0, 1, 1,
-0.6195137, -0.1220779, -4.532471, 1, 0, 0, 1, 1,
-0.6188531, 0.06824442, -2.344906, 1, 0, 0, 1, 1,
-0.618085, 0.06727094, -3.610371, 1, 0, 0, 1, 1,
-0.6177104, -0.1331851, -3.531476, 0, 0, 0, 1, 1,
-0.6062001, 0.2536381, -2.105087, 0, 0, 0, 1, 1,
-0.6000135, 1.226147, 0.06138138, 0, 0, 0, 1, 1,
-0.5951204, 0.2937121, -2.344428, 0, 0, 0, 1, 1,
-0.5950159, -0.7417509, -2.862885, 0, 0, 0, 1, 1,
-0.5943252, 0.4275874, -0.8478955, 0, 0, 0, 1, 1,
-0.5938945, 1.731302, 0.01245063, 0, 0, 0, 1, 1,
-0.5929952, -0.2549012, 0.2557809, 1, 1, 1, 1, 1,
-0.5849642, 0.006260477, -2.034045, 1, 1, 1, 1, 1,
-0.5823984, -0.6817349, -0.712249, 1, 1, 1, 1, 1,
-0.5800996, 0.945678, 0.190246, 1, 1, 1, 1, 1,
-0.5784394, 0.6088851, -2.796608, 1, 1, 1, 1, 1,
-0.5771782, -0.4288272, -3.885638, 1, 1, 1, 1, 1,
-0.5735085, -0.3426173, -2.371287, 1, 1, 1, 1, 1,
-0.5722149, 0.06399707, -1.850359, 1, 1, 1, 1, 1,
-0.5709612, -0.7728486, -0.5894469, 1, 1, 1, 1, 1,
-0.5705377, -0.3119802, -4.396903, 1, 1, 1, 1, 1,
-0.5674162, -1.160393, -2.752608, 1, 1, 1, 1, 1,
-0.564891, 1.128332, -1.844698, 1, 1, 1, 1, 1,
-0.5594438, 0.005873243, -1.026715, 1, 1, 1, 1, 1,
-0.5533768, 0.3703509, 0.003574244, 1, 1, 1, 1, 1,
-0.5514549, 0.02379353, -2.360697, 1, 1, 1, 1, 1,
-0.5486831, -0.1429357, -1.785488, 0, 0, 1, 1, 1,
-0.5473558, -2.626042, -2.799742, 1, 0, 0, 1, 1,
-0.5460209, 1.119601, -0.7876525, 1, 0, 0, 1, 1,
-0.5432647, 0.07847203, -0.2867396, 1, 0, 0, 1, 1,
-0.5432166, -1.833144, -3.58545, 1, 0, 0, 1, 1,
-0.5411188, -2.392158, -4.360222, 1, 0, 0, 1, 1,
-0.5392174, -1.089399, -0.9316065, 0, 0, 0, 1, 1,
-0.535966, 0.5624675, -0.6807637, 0, 0, 0, 1, 1,
-0.5333838, -1.270027, -2.723281, 0, 0, 0, 1, 1,
-0.5262472, 1.024004, -1.404463, 0, 0, 0, 1, 1,
-0.5252493, 0.6516615, 0.2914189, 0, 0, 0, 1, 1,
-0.5217861, -1.325613, -0.8515354, 0, 0, 0, 1, 1,
-0.5200273, 1.535556, -1.406127, 0, 0, 0, 1, 1,
-0.5191467, 0.6692983, -0.7586999, 1, 1, 1, 1, 1,
-0.5190905, 0.8491001, 0.7424391, 1, 1, 1, 1, 1,
-0.5189766, 0.9797729, -2.871157, 1, 1, 1, 1, 1,
-0.5182806, -0.005009943, -1.837309, 1, 1, 1, 1, 1,
-0.5179814, -0.8676374, -2.023374, 1, 1, 1, 1, 1,
-0.5160177, -1.15877, -2.780669, 1, 1, 1, 1, 1,
-0.5127621, -0.3963082, -1.954415, 1, 1, 1, 1, 1,
-0.5082306, 0.8381695, -1.829939, 1, 1, 1, 1, 1,
-0.5079908, 0.4923871, -2.420167, 1, 1, 1, 1, 1,
-0.506261, 0.8421214, 1.003016, 1, 1, 1, 1, 1,
-0.5024085, -0.4020212, -1.834439, 1, 1, 1, 1, 1,
-0.4942729, -0.1291894, -2.205542, 1, 1, 1, 1, 1,
-0.4905971, 0.8731667, -1.039667, 1, 1, 1, 1, 1,
-0.4886168, -0.8644863, -3.016297, 1, 1, 1, 1, 1,
-0.4848412, 0.1222802, -1.095363, 1, 1, 1, 1, 1,
-0.483857, -0.4039275, -3.461347, 0, 0, 1, 1, 1,
-0.4820642, -0.621235, -2.961665, 1, 0, 0, 1, 1,
-0.4818715, -0.01759523, -2.281917, 1, 0, 0, 1, 1,
-0.4809506, 2.288342, -2.524397, 1, 0, 0, 1, 1,
-0.4779576, -0.2217899, -3.376817, 1, 0, 0, 1, 1,
-0.476842, -0.5772027, -1.258212, 1, 0, 0, 1, 1,
-0.4739616, -0.1044803, -1.135489, 0, 0, 0, 1, 1,
-0.4736207, -0.4067803, -2.160465, 0, 0, 0, 1, 1,
-0.4714177, -1.022486, -2.907871, 0, 0, 0, 1, 1,
-0.4713895, -0.6800379, -3.677063, 0, 0, 0, 1, 1,
-0.4649601, -0.6995674, -1.401565, 0, 0, 0, 1, 1,
-0.463209, 0.3617324, -2.008487, 0, 0, 0, 1, 1,
-0.4530469, 0.4424988, -0.2947924, 0, 0, 0, 1, 1,
-0.4522566, -0.347305, -1.81377, 1, 1, 1, 1, 1,
-0.4513017, -0.7138885, -2.193868, 1, 1, 1, 1, 1,
-0.4505194, 0.5074381, -1.105457, 1, 1, 1, 1, 1,
-0.446481, -0.1752647, -2.689451, 1, 1, 1, 1, 1,
-0.4411426, 1.243922, 0.6197307, 1, 1, 1, 1, 1,
-0.4329982, -1.311209, -3.975928, 1, 1, 1, 1, 1,
-0.4328784, -1.830557, -4.292414, 1, 1, 1, 1, 1,
-0.4206652, 0.4147233, -1.068739, 1, 1, 1, 1, 1,
-0.4201863, -0.5065321, -3.974168, 1, 1, 1, 1, 1,
-0.4183117, -0.7726162, -3.683154, 1, 1, 1, 1, 1,
-0.418162, 0.2111437, -1.239497, 1, 1, 1, 1, 1,
-0.4116949, 0.476932, -0.9159749, 1, 1, 1, 1, 1,
-0.4026891, 1.426469, 1.039405, 1, 1, 1, 1, 1,
-0.4001939, 0.7118409, -1.835061, 1, 1, 1, 1, 1,
-0.3945195, -0.6095812, -0.9985317, 1, 1, 1, 1, 1,
-0.3905774, 0.04704117, 1.091288, 0, 0, 1, 1, 1,
-0.3866976, 0.6970145, -1.129626, 1, 0, 0, 1, 1,
-0.386162, -0.4550412, -3.463347, 1, 0, 0, 1, 1,
-0.3766965, 2.157903, -1.120396, 1, 0, 0, 1, 1,
-0.374435, -0.3296826, -3.416931, 1, 0, 0, 1, 1,
-0.3694274, -1.626407, -2.172027, 1, 0, 0, 1, 1,
-0.3679026, 1.174835, 0.7699779, 0, 0, 0, 1, 1,
-0.3622255, -0.8117525, -1.467618, 0, 0, 0, 1, 1,
-0.3611289, 1.677281, -0.05117775, 0, 0, 0, 1, 1,
-0.3607137, -0.2747071, -2.152977, 0, 0, 0, 1, 1,
-0.3585218, 0.9978812, 0.782795, 0, 0, 0, 1, 1,
-0.3568756, 0.6109276, 0.4873007, 0, 0, 0, 1, 1,
-0.3547564, 1.253977, 0.2950413, 0, 0, 0, 1, 1,
-0.3507972, -0.5119609, -0.05736912, 1, 1, 1, 1, 1,
-0.3491795, 0.2369905, -1.014074, 1, 1, 1, 1, 1,
-0.3469897, -1.510848, -3.600621, 1, 1, 1, 1, 1,
-0.3454029, 0.2544564, -1.651931, 1, 1, 1, 1, 1,
-0.3426294, -1.070898, -2.436974, 1, 1, 1, 1, 1,
-0.3408711, 0.498751, -0.9781958, 1, 1, 1, 1, 1,
-0.3404212, -1.344231, -3.581884, 1, 1, 1, 1, 1,
-0.3342722, -0.6594118, -3.079973, 1, 1, 1, 1, 1,
-0.3342693, 0.3439505, -0.595572, 1, 1, 1, 1, 1,
-0.3309365, -1.200029, -2.61807, 1, 1, 1, 1, 1,
-0.3305648, -0.4617003, -4.354367, 1, 1, 1, 1, 1,
-0.3300599, -1.285603, -1.71053, 1, 1, 1, 1, 1,
-0.3260315, -1.705822, -1.313914, 1, 1, 1, 1, 1,
-0.3225638, -0.9794868, -2.338274, 1, 1, 1, 1, 1,
-0.3149442, 0.6328562, 0.3018548, 1, 1, 1, 1, 1,
-0.3104316, -1.010399, -2.630726, 0, 0, 1, 1, 1,
-0.3097394, -1.205378, -3.090342, 1, 0, 0, 1, 1,
-0.3078696, -0.7974413, -1.603179, 1, 0, 0, 1, 1,
-0.3073188, -1.545564, -2.304542, 1, 0, 0, 1, 1,
-0.300185, 0.3327985, 1.450527, 1, 0, 0, 1, 1,
-0.297527, -0.1213787, -2.118602, 1, 0, 0, 1, 1,
-0.2923951, -0.9912415, -1.499288, 0, 0, 0, 1, 1,
-0.291255, -0.4514083, -3.843075, 0, 0, 0, 1, 1,
-0.2868022, -1.499625, -4.0298, 0, 0, 0, 1, 1,
-0.2853931, -0.6273943, -2.792495, 0, 0, 0, 1, 1,
-0.2790064, -0.7242972, -3.467773, 0, 0, 0, 1, 1,
-0.2786348, -1.249102, -4.250957, 0, 0, 0, 1, 1,
-0.2748164, -0.9389303, -1.728424, 0, 0, 0, 1, 1,
-0.2732025, 0.410324, -0.7990386, 1, 1, 1, 1, 1,
-0.2719033, 0.7113479, -1.677102, 1, 1, 1, 1, 1,
-0.2689506, -0.755338, -1.709878, 1, 1, 1, 1, 1,
-0.2652183, 1.309724, -0.8155123, 1, 1, 1, 1, 1,
-0.2618906, -1.071209, -2.16746, 1, 1, 1, 1, 1,
-0.2616309, 1.594242, 1.17142, 1, 1, 1, 1, 1,
-0.2611046, -0.6881724, -2.98224, 1, 1, 1, 1, 1,
-0.2599031, 0.3778554, -0.05256806, 1, 1, 1, 1, 1,
-0.259824, -1.692248, -1.730993, 1, 1, 1, 1, 1,
-0.2583789, 1.305152, -1.652035, 1, 1, 1, 1, 1,
-0.257787, 0.5820374, 0.8358237, 1, 1, 1, 1, 1,
-0.2562507, -2.099452, -4.186914, 1, 1, 1, 1, 1,
-0.2550257, 0.3732016, 1.163721, 1, 1, 1, 1, 1,
-0.2461734, -1.862939, -0.4861041, 1, 1, 1, 1, 1,
-0.2458482, -0.6209887, -2.276279, 1, 1, 1, 1, 1,
-0.2404341, 1.857979, -0.6378242, 0, 0, 1, 1, 1,
-0.239213, -0.1092835, -2.311864, 1, 0, 0, 1, 1,
-0.2357259, 1.42818, 0.5264429, 1, 0, 0, 1, 1,
-0.2348243, 0.4711403, -2.149547, 1, 0, 0, 1, 1,
-0.2336174, 0.9604067, -0.3834348, 1, 0, 0, 1, 1,
-0.2290558, -0.01356798, -2.734686, 1, 0, 0, 1, 1,
-0.2287961, -1.261551, -2.979477, 0, 0, 0, 1, 1,
-0.227348, -1.138059, -0.8611869, 0, 0, 0, 1, 1,
-0.2264531, -1.163432, -3.528591, 0, 0, 0, 1, 1,
-0.2244213, -0.9676189, -2.797002, 0, 0, 0, 1, 1,
-0.2239937, 0.4266198, 0.6194616, 0, 0, 0, 1, 1,
-0.2201572, -0.3646954, -2.579007, 0, 0, 0, 1, 1,
-0.2176293, 0.3335749, -2.516525, 0, 0, 0, 1, 1,
-0.2166158, -0.6139354, -1.10483, 1, 1, 1, 1, 1,
-0.2151161, -0.6652918, -2.635794, 1, 1, 1, 1, 1,
-0.2140006, 0.6235063, 0.1669939, 1, 1, 1, 1, 1,
-0.2000137, -1.135449, -2.381403, 1, 1, 1, 1, 1,
-0.1965586, 0.3181455, 0.2697104, 1, 1, 1, 1, 1,
-0.1960667, 0.5355231, -0.4956211, 1, 1, 1, 1, 1,
-0.1935014, 1.494169, -0.7555701, 1, 1, 1, 1, 1,
-0.1929997, -2.543406, -2.627146, 1, 1, 1, 1, 1,
-0.1919106, -0.06381533, -1.886283, 1, 1, 1, 1, 1,
-0.1895143, 0.9190364, -1.73442, 1, 1, 1, 1, 1,
-0.1891266, -1.139532, -2.909561, 1, 1, 1, 1, 1,
-0.1849277, 0.8404216, 0.1114329, 1, 1, 1, 1, 1,
-0.1815186, 1.041508, -1.321242, 1, 1, 1, 1, 1,
-0.1741635, 0.06240499, -2.036492, 1, 1, 1, 1, 1,
-0.1739291, 1.681314, -0.8152593, 1, 1, 1, 1, 1,
-0.1727857, -0.1176361, -1.546093, 0, 0, 1, 1, 1,
-0.1711644, -0.04321229, -3.3981, 1, 0, 0, 1, 1,
-0.162312, 0.4899975, -2.529671, 1, 0, 0, 1, 1,
-0.1572136, 0.6298465, -0.6191919, 1, 0, 0, 1, 1,
-0.1548488, -0.9366428, -2.080131, 1, 0, 0, 1, 1,
-0.1517284, 0.320334, -1.133818, 1, 0, 0, 1, 1,
-0.1498513, 0.8399464, -0.8706077, 0, 0, 0, 1, 1,
-0.1494603, -0.1093546, -1.865182, 0, 0, 0, 1, 1,
-0.1472886, -0.694816, -0.9692993, 0, 0, 0, 1, 1,
-0.1441907, 1.294384, 0.1864735, 0, 0, 0, 1, 1,
-0.1375829, 1.546113, -0.7466266, 0, 0, 0, 1, 1,
-0.1350833, 0.2540903, 0.4172213, 0, 0, 0, 1, 1,
-0.1327724, 0.2127311, -0.4821551, 0, 0, 0, 1, 1,
-0.1249232, -1.821638, -3.658622, 1, 1, 1, 1, 1,
-0.123596, 0.2156592, 0.3867716, 1, 1, 1, 1, 1,
-0.1218049, 0.1664975, 0.465504, 1, 1, 1, 1, 1,
-0.1190394, 0.2915578, -0.3213122, 1, 1, 1, 1, 1,
-0.1187411, 0.4532814, -0.3220003, 1, 1, 1, 1, 1,
-0.1178686, -0.4314864, -3.699459, 1, 1, 1, 1, 1,
-0.1131498, -1.403067, -5.186009, 1, 1, 1, 1, 1,
-0.1131451, 1.238077, 1.10093, 1, 1, 1, 1, 1,
-0.1130629, -1.554566, -3.754755, 1, 1, 1, 1, 1,
-0.1066907, -2.098275, -3.202418, 1, 1, 1, 1, 1,
-0.1007973, -2.200946, -2.901771, 1, 1, 1, 1, 1,
-0.09738836, 2.831488, 1.166118, 1, 1, 1, 1, 1,
-0.09463852, -1.567231, -2.820207, 1, 1, 1, 1, 1,
-0.09364589, -0.021609, -1.099112, 1, 1, 1, 1, 1,
-0.07895436, -2.616714, -2.284326, 1, 1, 1, 1, 1,
-0.07775307, 0.07578167, -0.9940714, 0, 0, 1, 1, 1,
-0.0762475, 0.8710657, 1.597338, 1, 0, 0, 1, 1,
-0.07559895, -0.374853, -1.249794, 1, 0, 0, 1, 1,
-0.07339107, 0.5482255, 0.9084429, 1, 0, 0, 1, 1,
-0.06891518, 0.316335, -0.476476, 1, 0, 0, 1, 1,
-0.06565011, 0.8346616, 1.816479, 1, 0, 0, 1, 1,
-0.06052954, -0.4393468, -2.174284, 0, 0, 0, 1, 1,
-0.05650498, 0.4071685, 1.084674, 0, 0, 0, 1, 1,
-0.0555815, 0.8728234, 1.138208, 0, 0, 0, 1, 1,
-0.05438586, -0.4547201, -3.531274, 0, 0, 0, 1, 1,
-0.05316911, 0.7954599, 1.916446, 0, 0, 0, 1, 1,
-0.05012747, -0.1826429, -4.004918, 0, 0, 0, 1, 1,
-0.04750244, 0.1902217, 0.135592, 0, 0, 0, 1, 1,
-0.04750052, 0.6089212, 1.910518, 1, 1, 1, 1, 1,
-0.04093111, -0.3927639, -2.362049, 1, 1, 1, 1, 1,
-0.04090441, 0.4849397, -0.4051486, 1, 1, 1, 1, 1,
-0.03793255, 0.9234667, -0.7300257, 1, 1, 1, 1, 1,
-0.03689984, 1.613494, -0.6055661, 1, 1, 1, 1, 1,
-0.03648481, -0.4191623, -2.466481, 1, 1, 1, 1, 1,
-0.03367475, -0.4336896, -2.620741, 1, 1, 1, 1, 1,
-0.03258372, -0.1439738, -2.306715, 1, 1, 1, 1, 1,
-0.03012327, -0.2052746, -5.084455, 1, 1, 1, 1, 1,
-0.02963974, -1.429812, -4.268541, 1, 1, 1, 1, 1,
-0.02053525, 0.06121518, 0.879226, 1, 1, 1, 1, 1,
-0.01910909, -0.9778303, -2.967521, 1, 1, 1, 1, 1,
-0.01322818, -0.7068759, -2.971319, 1, 1, 1, 1, 1,
-0.00879758, -1.12053, -2.821216, 1, 1, 1, 1, 1,
-0.003328766, -0.5485396, -1.639248, 1, 1, 1, 1, 1,
-0.001626395, 0.1184155, -0.7440016, 0, 0, 1, 1, 1,
0.005320351, -0.2590014, 3.106315, 1, 0, 0, 1, 1,
0.005627768, -0.2970204, 3.86227, 1, 0, 0, 1, 1,
0.00570497, -0.3069076, 3.054953, 1, 0, 0, 1, 1,
0.01415246, 0.7950918, 1.017175, 1, 0, 0, 1, 1,
0.01502119, 0.5767833, 0.9085811, 1, 0, 0, 1, 1,
0.01806716, -0.02165281, 4.641264, 0, 0, 0, 1, 1,
0.02178705, 0.2116673, 0.6139169, 0, 0, 0, 1, 1,
0.02307429, 0.3643769, 1.285148, 0, 0, 0, 1, 1,
0.02400013, 0.3811834, -2.66963, 0, 0, 0, 1, 1,
0.02503189, 0.5052759, 1.676253, 0, 0, 0, 1, 1,
0.02531715, -0.3405494, 2.780556, 0, 0, 0, 1, 1,
0.03049082, 0.9386986, -0.5384596, 0, 0, 0, 1, 1,
0.03094734, -0.409842, 3.118601, 1, 1, 1, 1, 1,
0.03180088, -0.3440473, 1.542852, 1, 1, 1, 1, 1,
0.03244478, -0.4922807, 5.305374, 1, 1, 1, 1, 1,
0.03379045, -1.031564, 4.786616, 1, 1, 1, 1, 1,
0.0360869, -2.587754, 3.410369, 1, 1, 1, 1, 1,
0.04207399, 2.681635, 0.4055368, 1, 1, 1, 1, 1,
0.04213046, 0.05300347, 0.8805252, 1, 1, 1, 1, 1,
0.04244566, 2.499133, 0.2570261, 1, 1, 1, 1, 1,
0.04496768, 0.6550057, 0.3256058, 1, 1, 1, 1, 1,
0.04501362, 0.3829828, 0.1144728, 1, 1, 1, 1, 1,
0.04613834, -1.124409, 4.823939, 1, 1, 1, 1, 1,
0.04685155, -0.9377123, 2.338551, 1, 1, 1, 1, 1,
0.05320781, -0.09589035, 2.934172, 1, 1, 1, 1, 1,
0.0534898, 0.9298216, 2.318209, 1, 1, 1, 1, 1,
0.05821569, 2.653248, -1.090617, 1, 1, 1, 1, 1,
0.05998827, -0.05395284, 2.525644, 0, 0, 1, 1, 1,
0.06218336, 1.564077, -1.330385, 1, 0, 0, 1, 1,
0.06438596, 1.669788, -0.859947, 1, 0, 0, 1, 1,
0.06499638, -1.010306, 4.838499, 1, 0, 0, 1, 1,
0.06542818, 0.5824126, 0.6060631, 1, 0, 0, 1, 1,
0.07113676, -0.128023, 0.8435419, 1, 0, 0, 1, 1,
0.07849728, -0.9118094, 3.201999, 0, 0, 0, 1, 1,
0.0827792, 1.428698, 1.304112, 0, 0, 0, 1, 1,
0.08328983, -1.618836, 2.233371, 0, 0, 0, 1, 1,
0.09217111, 0.265544, 2.392381, 0, 0, 0, 1, 1,
0.09890368, 0.1338238, 1.881224, 0, 0, 0, 1, 1,
0.09941799, 0.2180478, 0.2119918, 0, 0, 0, 1, 1,
0.1016601, -2.063157, 3.518296, 0, 0, 0, 1, 1,
0.1029843, -0.1571601, 0.5615326, 1, 1, 1, 1, 1,
0.1031571, 0.2569256, 0.4213658, 1, 1, 1, 1, 1,
0.1092982, -0.1145491, 0.2505335, 1, 1, 1, 1, 1,
0.1123935, 1.555614, 0.6544429, 1, 1, 1, 1, 1,
0.1135531, -0.4258161, 3.35736, 1, 1, 1, 1, 1,
0.1140856, 1.280981, 0.5703681, 1, 1, 1, 1, 1,
0.1185184, -0.3377822, 4.55063, 1, 1, 1, 1, 1,
0.1197067, 0.5629571, -0.1397295, 1, 1, 1, 1, 1,
0.1203462, -0.1921128, 2.294821, 1, 1, 1, 1, 1,
0.1236591, 1.084291, -0.914059, 1, 1, 1, 1, 1,
0.127006, -1.899852, 3.496878, 1, 1, 1, 1, 1,
0.1294904, -1.075796, 2.810784, 1, 1, 1, 1, 1,
0.1356462, 0.2759003, 0.08681164, 1, 1, 1, 1, 1,
0.1487714, 0.3820279, -0.5496511, 1, 1, 1, 1, 1,
0.150068, -0.9432703, 3.156082, 1, 1, 1, 1, 1,
0.1555338, -1.301303, 1.658939, 0, 0, 1, 1, 1,
0.1585009, -0.9998335, 3.448855, 1, 0, 0, 1, 1,
0.1594648, 0.09093059, 0.7876148, 1, 0, 0, 1, 1,
0.1601259, -0.03488968, -0.01426444, 1, 0, 0, 1, 1,
0.1601928, -1.679319, 1.495205, 1, 0, 0, 1, 1,
0.1614814, -0.1831425, 4.003263, 1, 0, 0, 1, 1,
0.1666459, 1.151565, -0.2879115, 0, 0, 0, 1, 1,
0.1732489, 0.1101144, 0.4246637, 0, 0, 0, 1, 1,
0.173649, -1.596341, 2.342357, 0, 0, 0, 1, 1,
0.1780374, 1.748495, -1.04422, 0, 0, 0, 1, 1,
0.1788068, -0.9591194, 0.882174, 0, 0, 0, 1, 1,
0.1806298, 0.9045841, -0.309823, 0, 0, 0, 1, 1,
0.1813028, 1.858931, 1.43414, 0, 0, 0, 1, 1,
0.1849119, -0.6700944, 2.229139, 1, 1, 1, 1, 1,
0.186334, -0.1742008, 4.155076, 1, 1, 1, 1, 1,
0.1879389, 0.8325572, 1.360045, 1, 1, 1, 1, 1,
0.1886255, 0.3782639, 0.4254103, 1, 1, 1, 1, 1,
0.1888157, -1.322458, 4.046005, 1, 1, 1, 1, 1,
0.1900888, 0.4161396, 0.7760466, 1, 1, 1, 1, 1,
0.1903963, -0.676017, 2.618243, 1, 1, 1, 1, 1,
0.1905582, 0.6068962, -0.8166251, 1, 1, 1, 1, 1,
0.1921668, 0.3579795, 1.369453, 1, 1, 1, 1, 1,
0.2018384, -0.2828242, 3.143115, 1, 1, 1, 1, 1,
0.2075448, 0.1444568, 1.63552, 1, 1, 1, 1, 1,
0.2083924, 0.2978792, 1.752658, 1, 1, 1, 1, 1,
0.2115933, 0.6907549, 0.2938514, 1, 1, 1, 1, 1,
0.2137707, 0.9417655, -0.6751597, 1, 1, 1, 1, 1,
0.2147614, 0.134522, 0.1217995, 1, 1, 1, 1, 1,
0.2194391, 0.5015779, 0.01175004, 0, 0, 1, 1, 1,
0.2215673, -0.3332658, 3.103143, 1, 0, 0, 1, 1,
0.2287537, -1.654503, 3.573344, 1, 0, 0, 1, 1,
0.2325079, 0.796985, -0.250258, 1, 0, 0, 1, 1,
0.2350561, -0.7870157, 3.288665, 1, 0, 0, 1, 1,
0.2421571, -0.6681802, 0.8653497, 1, 0, 0, 1, 1,
0.2429337, -0.3386952, 1.420181, 0, 0, 0, 1, 1,
0.2445016, 0.5588746, 1.071604, 0, 0, 0, 1, 1,
0.2505335, 1.059209, -0.06003968, 0, 0, 0, 1, 1,
0.2585246, -0.3139138, 1.250439, 0, 0, 0, 1, 1,
0.2588216, 0.9210749, 2.827519, 0, 0, 0, 1, 1,
0.2636187, -0.6800064, 3.145577, 0, 0, 0, 1, 1,
0.2640133, 0.3928927, -0.4389569, 0, 0, 0, 1, 1,
0.2648543, -0.6331145, 5.041869, 1, 1, 1, 1, 1,
0.2700574, -0.9388942, 4.382643, 1, 1, 1, 1, 1,
0.2712891, 0.7369589, 0.05801411, 1, 1, 1, 1, 1,
0.2716551, 1.273885, 0.8096243, 1, 1, 1, 1, 1,
0.2750304, -0.09663986, 2.583126, 1, 1, 1, 1, 1,
0.2800731, -1.004434, 2.261181, 1, 1, 1, 1, 1,
0.2895616, 0.03626776, 2.235602, 1, 1, 1, 1, 1,
0.2917765, 2.008507, 0.2969573, 1, 1, 1, 1, 1,
0.2933829, 0.8922253, 1.058491, 1, 1, 1, 1, 1,
0.2937538, 0.6211268, 0.9095378, 1, 1, 1, 1, 1,
0.2943304, 0.222335, 0.1543046, 1, 1, 1, 1, 1,
0.2957534, 0.1138656, 0.7875561, 1, 1, 1, 1, 1,
0.3039574, 0.6431398, 2.085966, 1, 1, 1, 1, 1,
0.3069437, -1.597205, 2.458686, 1, 1, 1, 1, 1,
0.3070048, -1.629856, 0.4091603, 1, 1, 1, 1, 1,
0.3082435, 0.2771395, 1.243454, 0, 0, 1, 1, 1,
0.3137213, -0.8113809, 1.342974, 1, 0, 0, 1, 1,
0.3161863, 0.7142382, -0.0193103, 1, 0, 0, 1, 1,
0.3214014, -0.3382913, 3.57431, 1, 0, 0, 1, 1,
0.3216819, -0.171198, 1.588053, 1, 0, 0, 1, 1,
0.327511, -1.228852, -0.04550746, 1, 0, 0, 1, 1,
0.3312187, -1.966559, 1.478342, 0, 0, 0, 1, 1,
0.3324988, -0.5683431, 4.005537, 0, 0, 0, 1, 1,
0.3341786, 0.7915764, 1.460203, 0, 0, 0, 1, 1,
0.3355823, 0.6044544, -0.0600806, 0, 0, 0, 1, 1,
0.3375745, -0.5355669, 1.875688, 0, 0, 0, 1, 1,
0.3379547, 0.3681197, 1.244884, 0, 0, 0, 1, 1,
0.3392578, 0.7687268, -0.3438931, 0, 0, 0, 1, 1,
0.3428337, 2.277464, -0.4280072, 1, 1, 1, 1, 1,
0.3491683, 0.07176714, 2.821672, 1, 1, 1, 1, 1,
0.3500651, -0.1716637, 1.101118, 1, 1, 1, 1, 1,
0.3507045, -0.9538625, 1.7493, 1, 1, 1, 1, 1,
0.3510143, -0.0844022, 1.840495, 1, 1, 1, 1, 1,
0.3519291, -0.2119651, 2.309623, 1, 1, 1, 1, 1,
0.3523887, -0.311311, 1.8281, 1, 1, 1, 1, 1,
0.3535886, -2.335446, 3.397447, 1, 1, 1, 1, 1,
0.3546172, -0.6317949, 4.864953, 1, 1, 1, 1, 1,
0.3568152, -1.220102, 2.270117, 1, 1, 1, 1, 1,
0.3571221, 1.641241, -1.184442, 1, 1, 1, 1, 1,
0.3593214, -1.613057, 3.211032, 1, 1, 1, 1, 1,
0.361766, -0.1772749, 1.459275, 1, 1, 1, 1, 1,
0.3659588, 0.4526339, 0.04711538, 1, 1, 1, 1, 1,
0.3669643, -0.3014493, 2.578485, 1, 1, 1, 1, 1,
0.370795, 0.9441662, 0.9265189, 0, 0, 1, 1, 1,
0.3736364, 1.043091, -0.3948122, 1, 0, 0, 1, 1,
0.3793462, -0.3826053, 2.33057, 1, 0, 0, 1, 1,
0.3830116, 0.6433923, 0.1473077, 1, 0, 0, 1, 1,
0.3835621, 0.2362575, 1.558796, 1, 0, 0, 1, 1,
0.3842798, 0.009806414, 1.285502, 1, 0, 0, 1, 1,
0.3880818, 0.1439636, 0.7345759, 0, 0, 0, 1, 1,
0.3886209, 0.5368026, 1.18178, 0, 0, 0, 1, 1,
0.3915653, -0.3231264, 2.483342, 0, 0, 0, 1, 1,
0.3949922, -2.023331, 1.648457, 0, 0, 0, 1, 1,
0.3957126, -1.546563, 3.49341, 0, 0, 0, 1, 1,
0.3982505, -0.7877526, 1.901641, 0, 0, 0, 1, 1,
0.3989223, -0.9468426, 1.394825, 0, 0, 0, 1, 1,
0.4035862, -1.634935, 2.520268, 1, 1, 1, 1, 1,
0.4053508, -0.8975287, 2.537811, 1, 1, 1, 1, 1,
0.4058198, -0.5201589, 2.72714, 1, 1, 1, 1, 1,
0.4064954, 0.6788093, -1.415041, 1, 1, 1, 1, 1,
0.4071231, 0.1425286, 2.269147, 1, 1, 1, 1, 1,
0.4098678, 0.6794447, 0.3951419, 1, 1, 1, 1, 1,
0.411525, -0.04253631, 2.601982, 1, 1, 1, 1, 1,
0.4162671, -0.1357208, 2.186528, 1, 1, 1, 1, 1,
0.4190768, 0.4090322, 2.443965, 1, 1, 1, 1, 1,
0.4193684, 0.8008481, -0.1392454, 1, 1, 1, 1, 1,
0.4219091, -1.221786, 2.518747, 1, 1, 1, 1, 1,
0.4243617, 1.789032, -0.03049734, 1, 1, 1, 1, 1,
0.4263279, -0.3274856, 2.018851, 1, 1, 1, 1, 1,
0.428275, 0.77905, 2.350926, 1, 1, 1, 1, 1,
0.4289237, -0.1150186, 1.965386, 1, 1, 1, 1, 1,
0.429118, -0.1022405, 2.14263, 0, 0, 1, 1, 1,
0.43132, 1.0722, -0.1679926, 1, 0, 0, 1, 1,
0.4322331, 0.4345, 1.81716, 1, 0, 0, 1, 1,
0.4343044, 0.3303235, 0.7319931, 1, 0, 0, 1, 1,
0.4345863, 0.5493398, 2.249081, 1, 0, 0, 1, 1,
0.4362156, 1.617576, 0.4814518, 1, 0, 0, 1, 1,
0.4398607, -0.3840176, 1.382317, 0, 0, 0, 1, 1,
0.4416007, -0.1445291, 2.627192, 0, 0, 0, 1, 1,
0.4427621, -0.8681084, 3.216239, 0, 0, 0, 1, 1,
0.445541, 0.1394444, 3.020998, 0, 0, 0, 1, 1,
0.4521469, 1.319438, -1.462938, 0, 0, 0, 1, 1,
0.4554282, 0.3028598, 2.158392, 0, 0, 0, 1, 1,
0.4568761, 1.219556, 0.1301835, 0, 0, 0, 1, 1,
0.4577658, 0.2543342, -0.07318226, 1, 1, 1, 1, 1,
0.4587989, 1.516864, 1.223222, 1, 1, 1, 1, 1,
0.4648371, -0.8129863, 1.774361, 1, 1, 1, 1, 1,
0.4674203, -1.922895, 1.46751, 1, 1, 1, 1, 1,
0.4678848, -1.586513, 2.451535, 1, 1, 1, 1, 1,
0.4686757, -3.557901, 3.343438, 1, 1, 1, 1, 1,
0.4697956, -0.4860616, 3.220287, 1, 1, 1, 1, 1,
0.470443, -0.1778634, 0.9622439, 1, 1, 1, 1, 1,
0.4715999, -0.1468952, 1.982427, 1, 1, 1, 1, 1,
0.4720032, -1.893093, 2.478827, 1, 1, 1, 1, 1,
0.4736868, 0.5589173, -1.448429, 1, 1, 1, 1, 1,
0.4745395, -0.1705513, 1.860256, 1, 1, 1, 1, 1,
0.4823129, -1.387096, 3.806174, 1, 1, 1, 1, 1,
0.4904627, -0.5786813, 2.668757, 1, 1, 1, 1, 1,
0.4941402, 0.3652649, 1.331182, 1, 1, 1, 1, 1,
0.4944449, -1.777412, 2.212319, 0, 0, 1, 1, 1,
0.4956909, -2.043912, 2.325955, 1, 0, 0, 1, 1,
0.4961728, 0.9499308, 2.055648, 1, 0, 0, 1, 1,
0.4988533, -1.870826, 4.813629, 1, 0, 0, 1, 1,
0.5009887, -1.899853, 3.272273, 1, 0, 0, 1, 1,
0.5021581, -1.792063, 3.954372, 1, 0, 0, 1, 1,
0.5029171, -1.711012, 4.113431, 0, 0, 0, 1, 1,
0.5059028, -0.4008189, 2.673678, 0, 0, 0, 1, 1,
0.5065006, -0.8291737, 3.89886, 0, 0, 0, 1, 1,
0.5076827, -1.210584, 3.30076, 0, 0, 0, 1, 1,
0.5087886, -0.09001951, 1.306901, 0, 0, 0, 1, 1,
0.5105859, -2.235366, 2.199257, 0, 0, 0, 1, 1,
0.5111867, -0.4902563, 2.613488, 0, 0, 0, 1, 1,
0.5113835, -1.278893, 4.678671, 1, 1, 1, 1, 1,
0.5114607, -2.497, 3.951266, 1, 1, 1, 1, 1,
0.5148872, -1.272021, 1.755878, 1, 1, 1, 1, 1,
0.5149694, -0.2952081, 2.46259, 1, 1, 1, 1, 1,
0.5166625, 0.3654654, 0.851577, 1, 1, 1, 1, 1,
0.5167538, 0.2663008, 0.7252116, 1, 1, 1, 1, 1,
0.5230095, -0.6928798, 1.733871, 1, 1, 1, 1, 1,
0.5287548, -0.7184727, 1.663269, 1, 1, 1, 1, 1,
0.5288549, -0.4493213, 2.959083, 1, 1, 1, 1, 1,
0.5293382, -0.008597458, 1.94571, 1, 1, 1, 1, 1,
0.5313415, 0.3012241, 1.394072, 1, 1, 1, 1, 1,
0.5330219, 0.2335721, 0.9008291, 1, 1, 1, 1, 1,
0.5363522, 1.502296, 0.5774478, 1, 1, 1, 1, 1,
0.538382, 0.2180628, 1.333753, 1, 1, 1, 1, 1,
0.5387887, -1.188306, 1.603937, 1, 1, 1, 1, 1,
0.5411115, -1.098766, 3.67771, 0, 0, 1, 1, 1,
0.5488342, 1.398, 1.618079, 1, 0, 0, 1, 1,
0.5541307, 0.6347427, -0.3475223, 1, 0, 0, 1, 1,
0.5542942, -0.2596352, 3.52997, 1, 0, 0, 1, 1,
0.5592933, 1.19614, 1.402639, 1, 0, 0, 1, 1,
0.5636404, 1.024543, -0.6483967, 1, 0, 0, 1, 1,
0.5654379, 0.7223777, 1.339055, 0, 0, 0, 1, 1,
0.5664151, 0.7773594, 1.590742, 0, 0, 0, 1, 1,
0.5694674, 0.1373525, 0.756256, 0, 0, 0, 1, 1,
0.5741968, -0.4333434, 0.9691605, 0, 0, 0, 1, 1,
0.5791649, 0.1040403, 0.6167352, 0, 0, 0, 1, 1,
0.579498, -0.2477033, 2.668948, 0, 0, 0, 1, 1,
0.5877885, -0.2747882, 1.639079, 0, 0, 0, 1, 1,
0.5886812, -0.05767064, 2.265537, 1, 1, 1, 1, 1,
0.5906636, -0.8255641, 2.892474, 1, 1, 1, 1, 1,
0.5913684, -0.4515152, 1.384568, 1, 1, 1, 1, 1,
0.5942167, -0.8276827, 3.192497, 1, 1, 1, 1, 1,
0.5959463, 0.4135448, 0.4908761, 1, 1, 1, 1, 1,
0.6021829, 1.300632, 0.01145225, 1, 1, 1, 1, 1,
0.6097258, 0.8277892, 1.269472, 1, 1, 1, 1, 1,
0.6124694, 0.2676897, 1.629129, 1, 1, 1, 1, 1,
0.6132367, -2.514309, 2.573478, 1, 1, 1, 1, 1,
0.6208175, -0.7333545, 2.622591, 1, 1, 1, 1, 1,
0.6267387, 1.291042, 1.398451, 1, 1, 1, 1, 1,
0.6330662, -0.427359, 1.56604, 1, 1, 1, 1, 1,
0.6344037, 1.125143, 0.389962, 1, 1, 1, 1, 1,
0.6376972, 0.002063775, 2.105517, 1, 1, 1, 1, 1,
0.6386754, -0.6215252, 2.699847, 1, 1, 1, 1, 1,
0.6408371, 0.03699721, 2.68865, 0, 0, 1, 1, 1,
0.6452693, 0.3183877, 1.060364, 1, 0, 0, 1, 1,
0.6470652, 0.6410381, 0.5173841, 1, 0, 0, 1, 1,
0.6498394, -1.217692, 3.835699, 1, 0, 0, 1, 1,
0.6515328, -1.745125, 2.351293, 1, 0, 0, 1, 1,
0.6528841, -1.60867, 4.451772, 1, 0, 0, 1, 1,
0.6544676, -2.865712, 1.838405, 0, 0, 0, 1, 1,
0.6601818, 0.3199275, 3.203648, 0, 0, 0, 1, 1,
0.6623801, 1.43669, 1.335661, 0, 0, 0, 1, 1,
0.6656699, 1.075735, -0.07177316, 0, 0, 0, 1, 1,
0.6679224, 0.06753156, 0.6781605, 0, 0, 0, 1, 1,
0.6682891, 0.2481254, 0.1535389, 0, 0, 0, 1, 1,
0.6721714, 0.03835282, 2.202691, 0, 0, 0, 1, 1,
0.6748651, 0.1948416, 0.5989861, 1, 1, 1, 1, 1,
0.679269, 0.4563625, 1.434676, 1, 1, 1, 1, 1,
0.6831886, -2.963942, 2.95266, 1, 1, 1, 1, 1,
0.6857148, -0.9650499, 1.067491, 1, 1, 1, 1, 1,
0.6954079, 0.8871003, 1.846898, 1, 1, 1, 1, 1,
0.6960355, -0.06952854, 1.444685, 1, 1, 1, 1, 1,
0.6976524, 1.066188, 0.563453, 1, 1, 1, 1, 1,
0.6986001, -0.6509647, 1.888313, 1, 1, 1, 1, 1,
0.7040803, -1.372956, 1.372452, 1, 1, 1, 1, 1,
0.7044372, 0.8201393, 0.7957716, 1, 1, 1, 1, 1,
0.7161024, 0.7106557, 0.2847624, 1, 1, 1, 1, 1,
0.7161462, -0.8051962, 0.9529656, 1, 1, 1, 1, 1,
0.7268508, -0.1664657, 2.571563, 1, 1, 1, 1, 1,
0.7322807, 0.4362971, -1.155322, 1, 1, 1, 1, 1,
0.7357275, -0.008682073, 0.9650894, 1, 1, 1, 1, 1,
0.740733, 1.452937, 0.1536302, 0, 0, 1, 1, 1,
0.7462555, 2.180871, -0.4685392, 1, 0, 0, 1, 1,
0.7465883, 0.06905411, 1.792176, 1, 0, 0, 1, 1,
0.7519439, 2.550898, 2.718552, 1, 0, 0, 1, 1,
0.7522608, 2.053529, 0.7524881, 1, 0, 0, 1, 1,
0.7525932, -0.7083468, 3.115436, 1, 0, 0, 1, 1,
0.7534162, -0.01343259, 2.438443, 0, 0, 0, 1, 1,
0.7564701, -1.166865, 1.121289, 0, 0, 0, 1, 1,
0.7566116, 0.08464902, 2.603712, 0, 0, 0, 1, 1,
0.756924, 1.32035, -0.5182233, 0, 0, 0, 1, 1,
0.7629613, -0.7219648, 2.045616, 0, 0, 0, 1, 1,
0.7652999, 1.0052, 1.063715, 0, 0, 0, 1, 1,
0.7655616, -1.727765, 2.980311, 0, 0, 0, 1, 1,
0.7700655, -0.03797664, 1.070188, 1, 1, 1, 1, 1,
0.7744948, 0.1153583, 0.6554118, 1, 1, 1, 1, 1,
0.7788733, -2.238101, 3.276462, 1, 1, 1, 1, 1,
0.7796829, 1.116881, 1.666504, 1, 1, 1, 1, 1,
0.7804572, 0.1151741, 0.5813867, 1, 1, 1, 1, 1,
0.7808422, 0.3216948, 0.6369475, 1, 1, 1, 1, 1,
0.7985612, -1.242329, 4.5173, 1, 1, 1, 1, 1,
0.7999758, 0.7356576, -0.02780481, 1, 1, 1, 1, 1,
0.8003789, 1.0164, 0.6811729, 1, 1, 1, 1, 1,
0.8052089, 0.9051469, 0.3467407, 1, 1, 1, 1, 1,
0.8052328, 1.787811, -0.08489298, 1, 1, 1, 1, 1,
0.8076837, -0.9654013, 1.249855, 1, 1, 1, 1, 1,
0.8094646, -1.053026, 3.48615, 1, 1, 1, 1, 1,
0.8109497, 1.156589, 1.528589, 1, 1, 1, 1, 1,
0.810989, -1.577265, 2.52222, 1, 1, 1, 1, 1,
0.8196396, 0.26722, -0.1190187, 0, 0, 1, 1, 1,
0.8214409, -1.46502, 2.40573, 1, 0, 0, 1, 1,
0.8215861, -0.8854443, 1.773051, 1, 0, 0, 1, 1,
0.8223197, -0.4579592, 2.566033, 1, 0, 0, 1, 1,
0.828684, 1.440418, 2.222432, 1, 0, 0, 1, 1,
0.8351971, 0.6196376, 0.5563588, 1, 0, 0, 1, 1,
0.8399925, 0.3806104, 0.9178345, 0, 0, 0, 1, 1,
0.8408167, 1.177263, -1.065437, 0, 0, 0, 1, 1,
0.8415389, -0.5373333, 2.095817, 0, 0, 0, 1, 1,
0.8454835, -0.09799104, 2.761833, 0, 0, 0, 1, 1,
0.8463619, -0.5658277, 1.022916, 0, 0, 0, 1, 1,
0.8500949, 0.3928291, 0.01134899, 0, 0, 0, 1, 1,
0.8511312, -0.6380084, 2.569308, 0, 0, 0, 1, 1,
0.8547631, -0.8649491, 0.1653446, 1, 1, 1, 1, 1,
0.8594947, 0.1590563, 3.123303, 1, 1, 1, 1, 1,
0.8604949, 1.909363, 0.8918616, 1, 1, 1, 1, 1,
0.8625422, -1.043187, 2.556653, 1, 1, 1, 1, 1,
0.8629046, 0.461757, 1.676745, 1, 1, 1, 1, 1,
0.8663241, -0.3479485, 1.245902, 1, 1, 1, 1, 1,
0.8699601, 0.8522152, 0.6875978, 1, 1, 1, 1, 1,
0.8707935, -0.346969, 1.563499, 1, 1, 1, 1, 1,
0.8716103, 0.2896457, 0.6361004, 1, 1, 1, 1, 1,
0.8751069, 1.997186, -1.591543, 1, 1, 1, 1, 1,
0.8824034, -0.6228119, 2.530243, 1, 1, 1, 1, 1,
0.8832453, 0.5450398, 1.947183, 1, 1, 1, 1, 1,
0.8834007, -0.3438208, 1.167093, 1, 1, 1, 1, 1,
0.8835366, -1.293635, 2.082062, 1, 1, 1, 1, 1,
0.8877782, -1.216829, 1.952599, 1, 1, 1, 1, 1,
0.8895377, 0.7406427, 2.21379, 0, 0, 1, 1, 1,
0.8899654, -1.780444, 2.631252, 1, 0, 0, 1, 1,
0.8908224, -1.392989, 1.548072, 1, 0, 0, 1, 1,
0.8954766, 1.541599, 0.7361292, 1, 0, 0, 1, 1,
0.9075375, -1.187926, 1.45214, 1, 0, 0, 1, 1,
0.9129486, 0.5491737, -0.341906, 1, 0, 0, 1, 1,
0.9146632, 1.059853, -0.04580135, 0, 0, 0, 1, 1,
0.9150686, 0.4871061, 2.468406, 0, 0, 0, 1, 1,
0.9166383, -0.6897941, 2.431348, 0, 0, 0, 1, 1,
0.9188747, 1.039201, 0.5261132, 0, 0, 0, 1, 1,
0.9196272, -1.51312, 0.6444149, 0, 0, 0, 1, 1,
0.9201555, -0.007830156, 1.919553, 0, 0, 0, 1, 1,
0.9214639, 0.5938689, 0.6496623, 0, 0, 0, 1, 1,
0.9269509, 0.3062577, 1.603408, 1, 1, 1, 1, 1,
0.9316403, 1.494274, -0.1557114, 1, 1, 1, 1, 1,
0.9413497, -1.468284, 3.400349, 1, 1, 1, 1, 1,
0.9472364, 0.9688168, 1.333402, 1, 1, 1, 1, 1,
0.9488806, 1.281067, 0.6389193, 1, 1, 1, 1, 1,
0.9592676, 1.028508, 2.292644, 1, 1, 1, 1, 1,
0.9623958, -1.520787, -0.1020748, 1, 1, 1, 1, 1,
0.964153, -0.0272941, 1.93406, 1, 1, 1, 1, 1,
0.9687741, 1.34087, 0.7304192, 1, 1, 1, 1, 1,
0.9770517, 1.225524, 2.178185, 1, 1, 1, 1, 1,
0.9827551, -1.201789, 0.5354921, 1, 1, 1, 1, 1,
0.9921079, 0.1019779, 2.170942, 1, 1, 1, 1, 1,
0.9938604, -0.02247324, 1.901177, 1, 1, 1, 1, 1,
0.9961389, 0.2222554, 0.9020112, 1, 1, 1, 1, 1,
1.000137, -0.2334509, 2.691633, 1, 1, 1, 1, 1,
1.001576, -0.4347664, 3.24249, 0, 0, 1, 1, 1,
1.011137, -0.1389695, 1.405483, 1, 0, 0, 1, 1,
1.013879, 0.08734129, 3.808231, 1, 0, 0, 1, 1,
1.017792, 0.7503092, 0.9247124, 1, 0, 0, 1, 1,
1.0183, 1.204757, 0.9697069, 1, 0, 0, 1, 1,
1.02182, -1.10204, 2.492421, 1, 0, 0, 1, 1,
1.02575, -0.2657959, 1.953368, 0, 0, 0, 1, 1,
1.028267, 1.335793, 0.7006255, 0, 0, 0, 1, 1,
1.03227, -1.614059, 2.350099, 0, 0, 0, 1, 1,
1.033098, -0.8434591, 1.6997, 0, 0, 0, 1, 1,
1.037679, -0.7315491, 1.207171, 0, 0, 0, 1, 1,
1.038437, -1.401797, 3.594232, 0, 0, 0, 1, 1,
1.039842, 0.7838966, 0.244096, 0, 0, 0, 1, 1,
1.045822, 1.585824, 1.923563, 1, 1, 1, 1, 1,
1.047451, 0.387804, 0.1968129, 1, 1, 1, 1, 1,
1.051943, 1.06714, 1.105701, 1, 1, 1, 1, 1,
1.062047, 0.02858766, 2.168168, 1, 1, 1, 1, 1,
1.062273, 0.4118438, 0.5165836, 1, 1, 1, 1, 1,
1.062562, -1.014085, 2.793936, 1, 1, 1, 1, 1,
1.065167, 0.9624078, 1.56483, 1, 1, 1, 1, 1,
1.081761, 0.6002926, 0.1894793, 1, 1, 1, 1, 1,
1.082313, 0.4676639, 0.9907396, 1, 1, 1, 1, 1,
1.092866, -0.9465688, 2.115392, 1, 1, 1, 1, 1,
1.108574, -0.7749643, 1.634684, 1, 1, 1, 1, 1,
1.108911, 0.2191161, 1.651576, 1, 1, 1, 1, 1,
1.120829, -0.08895243, 1.404601, 1, 1, 1, 1, 1,
1.120932, 1.723476, 1.105175, 1, 1, 1, 1, 1,
1.126606, 0.1780315, 3.230246, 1, 1, 1, 1, 1,
1.134029, -0.6970245, 0.8708723, 0, 0, 1, 1, 1,
1.146143, 0.2700919, 0.4197615, 1, 0, 0, 1, 1,
1.149716, 1.747535, -0.3362461, 1, 0, 0, 1, 1,
1.164725, -1.596132, 1.63782, 1, 0, 0, 1, 1,
1.16502, 2.160014, 1.968912, 1, 0, 0, 1, 1,
1.166743, 0.8818526, 1.935362, 1, 0, 0, 1, 1,
1.169645, -0.03857451, 0.7736454, 0, 0, 0, 1, 1,
1.170334, 0.3153377, 0.7156538, 0, 0, 0, 1, 1,
1.172144, -0.5440508, 3.642277, 0, 0, 0, 1, 1,
1.182783, 0.3129736, 1.894959, 0, 0, 0, 1, 1,
1.191625, 1.425681, -0.9995674, 0, 0, 0, 1, 1,
1.192722, 1.363919, -0.8089347, 0, 0, 0, 1, 1,
1.199023, 0.9904431, 2.850631, 0, 0, 0, 1, 1,
1.201414, 0.7074462, 2.406901, 1, 1, 1, 1, 1,
1.204962, -0.003694711, 2.805672, 1, 1, 1, 1, 1,
1.209696, -0.7931933, 2.484453, 1, 1, 1, 1, 1,
1.209938, -0.6511921, 1.566753, 1, 1, 1, 1, 1,
1.219424, -1.891281, 3.809164, 1, 1, 1, 1, 1,
1.219563, -1.352154, 2.4154, 1, 1, 1, 1, 1,
1.222266, 0.6434723, -0.6835213, 1, 1, 1, 1, 1,
1.223205, -1.013183, 1.491599, 1, 1, 1, 1, 1,
1.231464, -0.707339, 3.416731, 1, 1, 1, 1, 1,
1.232289, -0.1800031, 0.8013496, 1, 1, 1, 1, 1,
1.248735, -0.289665, 0.846813, 1, 1, 1, 1, 1,
1.255143, 1.035006, 1.59572, 1, 1, 1, 1, 1,
1.257695, -1.431815, 3.096138, 1, 1, 1, 1, 1,
1.258748, 1.079818, 2.993174, 1, 1, 1, 1, 1,
1.265132, -0.07887751, 2.427068, 1, 1, 1, 1, 1,
1.268544, 1.001656, -0.06462616, 0, 0, 1, 1, 1,
1.270766, -0.3156618, 0.39985, 1, 0, 0, 1, 1,
1.276301, -0.3000086, -0.6780264, 1, 0, 0, 1, 1,
1.282525, -0.1632128, 0.8868811, 1, 0, 0, 1, 1,
1.293558, -0.3545465, 2.252792, 1, 0, 0, 1, 1,
1.298116, -0.2902305, 2.076171, 1, 0, 0, 1, 1,
1.302673, 1.303541, 0.3853962, 0, 0, 0, 1, 1,
1.305163, -0.09172508, 1.569025, 0, 0, 0, 1, 1,
1.314336, -0.4338685, 0.7315819, 0, 0, 0, 1, 1,
1.314506, 0.2626708, 1.156962, 0, 0, 0, 1, 1,
1.374222, -0.4507865, 1.973449, 0, 0, 0, 1, 1,
1.38617, -0.5303863, 0.4482391, 0, 0, 0, 1, 1,
1.421172, -0.6684879, 1.361014, 0, 0, 0, 1, 1,
1.423889, -0.3581508, -0.01939932, 1, 1, 1, 1, 1,
1.427674, -0.06804217, 2.096196, 1, 1, 1, 1, 1,
1.433345, 1.898548, 1.035679, 1, 1, 1, 1, 1,
1.433928, 0.7535154, 0.4314496, 1, 1, 1, 1, 1,
1.436028, 0.2505678, 1.394317, 1, 1, 1, 1, 1,
1.466667, 1.141521, 0.9782175, 1, 1, 1, 1, 1,
1.485448, 0.9370313, 2.178667, 1, 1, 1, 1, 1,
1.487489, -0.5674565, 2.290766, 1, 1, 1, 1, 1,
1.488658, 0.0656194, -0.1933623, 1, 1, 1, 1, 1,
1.499537, 0.138049, 3.096124, 1, 1, 1, 1, 1,
1.502258, 1.464457, 0.6539716, 1, 1, 1, 1, 1,
1.523898, -1.059404, 1.582654, 1, 1, 1, 1, 1,
1.529422, 1.011517, 1.662709, 1, 1, 1, 1, 1,
1.536904, -0.07444432, 1.721268, 1, 1, 1, 1, 1,
1.562108, -0.4151139, 0.8662389, 1, 1, 1, 1, 1,
1.564965, -0.1009564, 1.449823, 0, 0, 1, 1, 1,
1.570446, -0.858526, 3.322337, 1, 0, 0, 1, 1,
1.606578, -0.9774832, 2.684248, 1, 0, 0, 1, 1,
1.62192, -1.039162, 1.602121, 1, 0, 0, 1, 1,
1.624242, 0.9842319, -0.8186717, 1, 0, 0, 1, 1,
1.629554, 1.459728, 3.282266, 1, 0, 0, 1, 1,
1.643052, 1.362556, 2.862428, 0, 0, 0, 1, 1,
1.644346, -0.8409615, 2.395394, 0, 0, 0, 1, 1,
1.701426, -1.940407, 2.276986, 0, 0, 0, 1, 1,
1.709746, -1.151116, 1.26016, 0, 0, 0, 1, 1,
1.729764, -0.38895, 0.5897626, 0, 0, 0, 1, 1,
1.734138, 0.6534201, 2.19717, 0, 0, 0, 1, 1,
1.736669, -1.445519, 1.970705, 0, 0, 0, 1, 1,
1.73988, 0.7039772, 1.284366, 1, 1, 1, 1, 1,
1.741994, -2.1445, 1.922073, 1, 1, 1, 1, 1,
1.766706, -1.591501, 2.992596, 1, 1, 1, 1, 1,
1.795661, 0.2207718, 1.960856, 1, 1, 1, 1, 1,
1.810665, -0.04207495, 0.2664693, 1, 1, 1, 1, 1,
1.861459, 0.1245264, 4.182839, 1, 1, 1, 1, 1,
1.878349, -1.34763, 1.666507, 1, 1, 1, 1, 1,
1.878672, 0.8261748, 0.9594532, 1, 1, 1, 1, 1,
1.954642, 0.04586609, 0.09147274, 1, 1, 1, 1, 1,
1.959575, 1.667654, 1.100524, 1, 1, 1, 1, 1,
1.975852, 0.5604958, 2.974686, 1, 1, 1, 1, 1,
1.991817, 0.6131527, 2.076126, 1, 1, 1, 1, 1,
2.000624, 1.345501, 0.2391382, 1, 1, 1, 1, 1,
2.011112, -0.1390019, 1.726026, 1, 1, 1, 1, 1,
2.067315, -0.3596007, 1.592339, 1, 1, 1, 1, 1,
2.094552, -1.111075, 0.3237272, 0, 0, 1, 1, 1,
2.102912, 2.546566, 2.125906, 1, 0, 0, 1, 1,
2.133783, 0.1042225, 2.13588, 1, 0, 0, 1, 1,
2.163911, 0.2403257, 2.229989, 1, 0, 0, 1, 1,
2.165515, -0.8901212, 2.064442, 1, 0, 0, 1, 1,
2.177681, 0.1799857, 1.31021, 1, 0, 0, 1, 1,
2.213632, 0.24802, 0.8607234, 0, 0, 0, 1, 1,
2.218841, -0.7829323, 2.857487, 0, 0, 0, 1, 1,
2.228088, 1.198792, 1.430648, 0, 0, 0, 1, 1,
2.25359, 0.6921076, 1.390891, 0, 0, 0, 1, 1,
2.304304, 2.085507, 1.902167, 0, 0, 0, 1, 1,
2.307447, -0.8092324, 1.767765, 0, 0, 0, 1, 1,
2.417265, 0.9365757, 1.392179, 0, 0, 0, 1, 1,
2.442525, -1.039535, 0.9277346, 1, 1, 1, 1, 1,
2.479271, -0.3087267, 1.394865, 1, 1, 1, 1, 1,
2.546206, -0.06839718, 2.527681, 1, 1, 1, 1, 1,
2.560596, -1.122574, 2.249522, 1, 1, 1, 1, 1,
2.566183, -0.6847016, 2.748413, 1, 1, 1, 1, 1,
2.698487, 0.5968855, 0.4026872, 1, 1, 1, 1, 1,
3.229278, 2.065733, 3.789841, 1, 1, 1, 1, 1
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
var radius = 9.450423;
var distance = 33.19421;
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
mvMatrix.translate( -0.08124352, 0.3632067, -0.05968261 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.19421);
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
