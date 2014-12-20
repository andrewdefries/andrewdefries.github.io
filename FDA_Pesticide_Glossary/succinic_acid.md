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
-3.124867, 0.002914448, -2.74534, 1, 0, 0, 1,
-2.985582, 0.5573956, -2.130853, 1, 0.007843138, 0, 1,
-2.892414, -1.210766, -0.9908873, 1, 0.01176471, 0, 1,
-2.686426, -0.5598752, -2.182174, 1, 0.01960784, 0, 1,
-2.603631, -0.6881462, -3.549031, 1, 0.02352941, 0, 1,
-2.596836, -0.03792783, -2.526206, 1, 0.03137255, 0, 1,
-2.533642, 0.9859638, -0.945226, 1, 0.03529412, 0, 1,
-2.531652, 0.7837332, -1.851011, 1, 0.04313726, 0, 1,
-2.490236, 0.5701096, -2.640565, 1, 0.04705882, 0, 1,
-2.394258, -1.188816, -3.276948, 1, 0.05490196, 0, 1,
-2.322026, -0.5793805, 0.08376604, 1, 0.05882353, 0, 1,
-2.292347, -0.3776467, -1.957179, 1, 0.06666667, 0, 1,
-2.226082, -1.824434, -3.075668, 1, 0.07058824, 0, 1,
-2.202541, -0.06389497, -1.462624, 1, 0.07843138, 0, 1,
-2.201735, 0.8284521, -2.280953, 1, 0.08235294, 0, 1,
-2.189581, 0.5216267, -1.774479, 1, 0.09019608, 0, 1,
-2.152803, 0.432229, -2.446643, 1, 0.09411765, 0, 1,
-2.140486, -1.188248, -1.862687, 1, 0.1019608, 0, 1,
-2.099454, -1.845131, -1.096727, 1, 0.1098039, 0, 1,
-2.087657, -0.7476602, -2.175123, 1, 0.1137255, 0, 1,
-2.057968, -0.4238844, -2.447544, 1, 0.1215686, 0, 1,
-2.048369, 0.9618738, -1.680203, 1, 0.1254902, 0, 1,
-2.046926, 1.377745, -1.672233, 1, 0.1333333, 0, 1,
-2.039015, 0.5799774, -1.703668, 1, 0.1372549, 0, 1,
-2.009274, -0.9829582, -1.059901, 1, 0.145098, 0, 1,
-1.969396, 0.02806649, -2.471556, 1, 0.1490196, 0, 1,
-1.967549, 0.4127171, 1.578539, 1, 0.1568628, 0, 1,
-1.950542, 0.3230328, -1.002202, 1, 0.1607843, 0, 1,
-1.945876, 1.037205, -1.89516, 1, 0.1686275, 0, 1,
-1.902732, -0.9328696, -2.979844, 1, 0.172549, 0, 1,
-1.893007, 0.109196, -1.998466, 1, 0.1803922, 0, 1,
-1.891917, 1.846685, -1.273551, 1, 0.1843137, 0, 1,
-1.842128, -0.7384039, -0.7571145, 1, 0.1921569, 0, 1,
-1.817065, -0.8378711, -3.273536, 1, 0.1960784, 0, 1,
-1.792807, 1.573472, -2.113031, 1, 0.2039216, 0, 1,
-1.768034, -0.9592578, -2.32877, 1, 0.2117647, 0, 1,
-1.761376, -0.2717092, -5.055473, 1, 0.2156863, 0, 1,
-1.759293, -0.6342627, -2.538642, 1, 0.2235294, 0, 1,
-1.752957, -2.393465, -2.080775, 1, 0.227451, 0, 1,
-1.750556, 0.7609202, 0.2119582, 1, 0.2352941, 0, 1,
-1.750054, 1.200769, -0.5353882, 1, 0.2392157, 0, 1,
-1.693981, 0.2082844, -2.180047, 1, 0.2470588, 0, 1,
-1.687664, -0.1204857, -2.630757, 1, 0.2509804, 0, 1,
-1.687519, 0.3041576, -1.262022, 1, 0.2588235, 0, 1,
-1.656556, 0.2384055, -2.083279, 1, 0.2627451, 0, 1,
-1.625821, -0.7907528, -1.278731, 1, 0.2705882, 0, 1,
-1.622491, 1.512987, 0.09622867, 1, 0.2745098, 0, 1,
-1.613536, 1.989653, -1.226224, 1, 0.282353, 0, 1,
-1.611942, -0.1103101, -0.8853723, 1, 0.2862745, 0, 1,
-1.606103, -1.371117, -2.729947, 1, 0.2941177, 0, 1,
-1.604535, 1.479279, -1.010035, 1, 0.3019608, 0, 1,
-1.598026, 0.7259943, 0.5138763, 1, 0.3058824, 0, 1,
-1.587794, -1.02064, -2.462371, 1, 0.3137255, 0, 1,
-1.558507, -1.493209, -1.679734, 1, 0.3176471, 0, 1,
-1.553995, 0.3096919, -0.4438116, 1, 0.3254902, 0, 1,
-1.552277, 1.818855, -3.605434, 1, 0.3294118, 0, 1,
-1.549107, 1.164098, -0.6666689, 1, 0.3372549, 0, 1,
-1.54892, -1.17733, -3.574422, 1, 0.3411765, 0, 1,
-1.540236, -0.5588043, -1.717276, 1, 0.3490196, 0, 1,
-1.531169, -0.1591124, -2.616781, 1, 0.3529412, 0, 1,
-1.524267, -0.04814577, -1.617634, 1, 0.3607843, 0, 1,
-1.517675, 0.4875648, 0.7138246, 1, 0.3647059, 0, 1,
-1.514735, -1.883308, -1.214466, 1, 0.372549, 0, 1,
-1.513878, 0.5768986, -2.186314, 1, 0.3764706, 0, 1,
-1.479971, -0.5417258, -2.675872, 1, 0.3843137, 0, 1,
-1.475224, 1.587126, -0.9739937, 1, 0.3882353, 0, 1,
-1.466979, 1.324696, -0.1916204, 1, 0.3960784, 0, 1,
-1.46322, 0.3326737, -2.692431, 1, 0.4039216, 0, 1,
-1.460993, 0.5678014, -0.184735, 1, 0.4078431, 0, 1,
-1.460614, 0.5374898, -1.39286, 1, 0.4156863, 0, 1,
-1.455014, -0.5018595, -0.6048104, 1, 0.4196078, 0, 1,
-1.429364, 0.5824411, 0.4551163, 1, 0.427451, 0, 1,
-1.425449, 0.1761611, -0.2019706, 1, 0.4313726, 0, 1,
-1.420714, 0.5947046, -1.594638, 1, 0.4392157, 0, 1,
-1.413648, -0.5707514, -3.482574, 1, 0.4431373, 0, 1,
-1.387929, 0.3168648, -0.7634205, 1, 0.4509804, 0, 1,
-1.385833, 0.8993759, -2.220441, 1, 0.454902, 0, 1,
-1.385239, -0.2592863, -2.330828, 1, 0.4627451, 0, 1,
-1.370545, -2.073619, -1.669946, 1, 0.4666667, 0, 1,
-1.364012, -0.5389304, -1.024423, 1, 0.4745098, 0, 1,
-1.328939, -0.4759686, -0.8857862, 1, 0.4784314, 0, 1,
-1.322484, 1.148895, -2.136477, 1, 0.4862745, 0, 1,
-1.317868, 0.6298952, 0.4597534, 1, 0.4901961, 0, 1,
-1.309314, 0.5809985, -0.3438748, 1, 0.4980392, 0, 1,
-1.308171, -1.097657, -3.297047, 1, 0.5058824, 0, 1,
-1.305319, -0.1064301, -0.7100258, 1, 0.509804, 0, 1,
-1.301338, 0.1391374, -1.239203, 1, 0.5176471, 0, 1,
-1.297888, -0.5680711, -3.992974, 1, 0.5215687, 0, 1,
-1.296894, -1.600733, -2.76125, 1, 0.5294118, 0, 1,
-1.29417, 0.6133848, 0.3916691, 1, 0.5333334, 0, 1,
-1.293406, 1.194175, -1.788808, 1, 0.5411765, 0, 1,
-1.290671, 0.7444507, -0.9901088, 1, 0.5450981, 0, 1,
-1.288164, 0.7102149, -0.7572876, 1, 0.5529412, 0, 1,
-1.278012, -0.8608536, -2.650159, 1, 0.5568628, 0, 1,
-1.277335, 1.04879, -1.242185, 1, 0.5647059, 0, 1,
-1.272852, 1.029182, -2.524484, 1, 0.5686275, 0, 1,
-1.263958, 1.745394, -1.119924, 1, 0.5764706, 0, 1,
-1.263805, 0.009624555, -0.4258935, 1, 0.5803922, 0, 1,
-1.263788, -1.795866, -1.197988, 1, 0.5882353, 0, 1,
-1.26073, -0.2134335, -2.643747, 1, 0.5921569, 0, 1,
-1.259815, -0.4553606, -1.951542, 1, 0.6, 0, 1,
-1.256675, 0.7458951, -2.036967, 1, 0.6078432, 0, 1,
-1.242389, -0.5681998, -0.5082767, 1, 0.6117647, 0, 1,
-1.241686, 1.671426, -0.9677417, 1, 0.6196079, 0, 1,
-1.240896, -0.3155397, -1.931186, 1, 0.6235294, 0, 1,
-1.240254, 0.4719554, -1.399918, 1, 0.6313726, 0, 1,
-1.239536, -0.01062397, -2.022006, 1, 0.6352941, 0, 1,
-1.231211, -0.4990115, -2.900518, 1, 0.6431373, 0, 1,
-1.230608, -1.148239, -0.5942724, 1, 0.6470588, 0, 1,
-1.227251, 0.8044257, -0.9268876, 1, 0.654902, 0, 1,
-1.225715, 0.7819625, 0.1319076, 1, 0.6588235, 0, 1,
-1.225308, -0.4459375, -3.022791, 1, 0.6666667, 0, 1,
-1.219839, 0.8686711, -1.104028, 1, 0.6705883, 0, 1,
-1.21886, -0.9721311, -2.617331, 1, 0.6784314, 0, 1,
-1.196949, -0.07022712, -2.938743, 1, 0.682353, 0, 1,
-1.188012, 0.4071079, -1.081314, 1, 0.6901961, 0, 1,
-1.179543, -1.396706, -3.011574, 1, 0.6941177, 0, 1,
-1.179479, 2.032444, 0.316167, 1, 0.7019608, 0, 1,
-1.174509, -1.50148, -2.05513, 1, 0.7098039, 0, 1,
-1.173966, 0.5503533, 1.010551, 1, 0.7137255, 0, 1,
-1.173955, 0.07643623, -0.07359534, 1, 0.7215686, 0, 1,
-1.170594, -0.1407242, -2.354012, 1, 0.7254902, 0, 1,
-1.157861, 1.75494, -1.252351, 1, 0.7333333, 0, 1,
-1.154369, 0.6660134, -1.599471, 1, 0.7372549, 0, 1,
-1.149491, 0.1185678, -1.578402, 1, 0.7450981, 0, 1,
-1.148731, 2.319637, -0.1476194, 1, 0.7490196, 0, 1,
-1.142304, -0.1294355, -0.9681641, 1, 0.7568628, 0, 1,
-1.133543, -0.4107002, -3.062466, 1, 0.7607843, 0, 1,
-1.129797, 0.1012063, -0.7572579, 1, 0.7686275, 0, 1,
-1.124615, 0.8913924, 0.01958318, 1, 0.772549, 0, 1,
-1.118249, 0.7184628, -1.43975, 1, 0.7803922, 0, 1,
-1.115217, 0.8721272, 0.7644814, 1, 0.7843137, 0, 1,
-1.106792, -1.239386, -1.934038, 1, 0.7921569, 0, 1,
-1.106755, 1.031779, -1.796554, 1, 0.7960784, 0, 1,
-1.093695, 0.315478, -1.074251, 1, 0.8039216, 0, 1,
-1.091284, -0.4639112, -0.7493805, 1, 0.8117647, 0, 1,
-1.087442, 0.1157649, -1.323509, 1, 0.8156863, 0, 1,
-1.08297, -0.6860659, -1.907948, 1, 0.8235294, 0, 1,
-1.081494, 0.419812, -0.8975307, 1, 0.827451, 0, 1,
-1.0786, -0.3326108, -3.493693, 1, 0.8352941, 0, 1,
-1.059847, 1.464921, 0.0821078, 1, 0.8392157, 0, 1,
-1.058413, 0.390267, -1.875173, 1, 0.8470588, 0, 1,
-1.055043, 0.3155599, -0.001866031, 1, 0.8509804, 0, 1,
-1.052326, 0.905362, -1.275092, 1, 0.8588235, 0, 1,
-1.048419, 0.003317309, -1.081862, 1, 0.8627451, 0, 1,
-1.045952, -2.203824, -3.084738, 1, 0.8705882, 0, 1,
-1.043221, -1.113468, -1.486797, 1, 0.8745098, 0, 1,
-1.04298, -0.8369036, -2.004062, 1, 0.8823529, 0, 1,
-1.038908, -0.6544256, -1.939357, 1, 0.8862745, 0, 1,
-1.037576, -0.9089246, -1.01097, 1, 0.8941177, 0, 1,
-1.033138, 0.19603, -1.53895, 1, 0.8980392, 0, 1,
-1.031386, 0.5807328, -1.141575, 1, 0.9058824, 0, 1,
-1.030844, 0.7514156, -0.1903057, 1, 0.9137255, 0, 1,
-1.029162, -1.003544, -0.7593569, 1, 0.9176471, 0, 1,
-1.025177, -0.4523194, -2.310019, 1, 0.9254902, 0, 1,
-1.024469, 0.3060965, -0.7597399, 1, 0.9294118, 0, 1,
-1.007095, 0.3966177, -0.2063255, 1, 0.9372549, 0, 1,
-1.001325, -0.4084984, -2.47548, 1, 0.9411765, 0, 1,
-1.00075, -0.7121461, -2.861137, 1, 0.9490196, 0, 1,
-1.000679, 1.613241, -2.193384, 1, 0.9529412, 0, 1,
-1.000035, 0.1917822, -1.467682, 1, 0.9607843, 0, 1,
-0.9999041, 0.7399116, 0.8501248, 1, 0.9647059, 0, 1,
-0.9984438, 0.7141215, -0.9568764, 1, 0.972549, 0, 1,
-0.9965019, -0.2149853, -0.01507324, 1, 0.9764706, 0, 1,
-0.9892405, -0.7463603, -1.600462, 1, 0.9843137, 0, 1,
-0.9828501, 0.5833455, 0.00612396, 1, 0.9882353, 0, 1,
-0.9824318, -0.3945248, -1.446776, 1, 0.9960784, 0, 1,
-0.9823455, -1.164798, -1.954213, 0.9960784, 1, 0, 1,
-0.980926, -0.01559218, -1.899219, 0.9921569, 1, 0, 1,
-0.979937, 0.7526577, -0.1178858, 0.9843137, 1, 0, 1,
-0.9799054, 0.2537292, -1.572152, 0.9803922, 1, 0, 1,
-0.9787473, 1.625557, -0.05164949, 0.972549, 1, 0, 1,
-0.9698317, 0.3108629, -1.760509, 0.9686275, 1, 0, 1,
-0.9674276, 0.674591, -0.3834876, 0.9607843, 1, 0, 1,
-0.9586846, 0.1320929, -0.9810425, 0.9568627, 1, 0, 1,
-0.9489079, 0.09286346, -1.439937, 0.9490196, 1, 0, 1,
-0.9464676, -0.3084543, -2.290886, 0.945098, 1, 0, 1,
-0.9448177, -0.3393531, -1.210242, 0.9372549, 1, 0, 1,
-0.9420844, -0.229698, -0.8689133, 0.9333333, 1, 0, 1,
-0.9374501, 1.659368, -0.2423365, 0.9254902, 1, 0, 1,
-0.9310029, 0.3842102, -0.9164381, 0.9215686, 1, 0, 1,
-0.9240785, -0.341705, -2.31574, 0.9137255, 1, 0, 1,
-0.9226682, -0.1160315, -2.168476, 0.9098039, 1, 0, 1,
-0.9211689, 0.7181843, -1.145979, 0.9019608, 1, 0, 1,
-0.9124361, -0.285597, -1.927782, 0.8941177, 1, 0, 1,
-0.9119115, -0.3525511, -2.552203, 0.8901961, 1, 0, 1,
-0.9081228, 0.0753867, -2.003736, 0.8823529, 1, 0, 1,
-0.9051391, 1.911591, -2.787408, 0.8784314, 1, 0, 1,
-0.9044736, -0.02757418, -1.829571, 0.8705882, 1, 0, 1,
-0.8984393, -0.4846862, -3.584111, 0.8666667, 1, 0, 1,
-0.8930321, -0.1130477, 0.07505911, 0.8588235, 1, 0, 1,
-0.8881187, -0.4398103, -0.995744, 0.854902, 1, 0, 1,
-0.8845388, -0.2564163, -3.693091, 0.8470588, 1, 0, 1,
-0.8828295, 0.3717468, 0.1310515, 0.8431373, 1, 0, 1,
-0.8803846, 1.574779, -1.085495, 0.8352941, 1, 0, 1,
-0.8774645, 0.183678, -3.223397, 0.8313726, 1, 0, 1,
-0.875715, -0.2618147, -2.019553, 0.8235294, 1, 0, 1,
-0.8750458, 0.3695561, 0.77094, 0.8196079, 1, 0, 1,
-0.8727126, -1.092984, -2.51436, 0.8117647, 1, 0, 1,
-0.8694106, -0.2436255, 0.04492303, 0.8078431, 1, 0, 1,
-0.8692248, -0.9649619, -2.153954, 0.8, 1, 0, 1,
-0.868165, -1.183174, -2.540917, 0.7921569, 1, 0, 1,
-0.8616382, -1.30179, -0.9166579, 0.7882353, 1, 0, 1,
-0.8572397, -0.7253695, -3.063902, 0.7803922, 1, 0, 1,
-0.857208, -1.227241, -1.956798, 0.7764706, 1, 0, 1,
-0.8549886, 1.179791, -0.3881352, 0.7686275, 1, 0, 1,
-0.8531184, 0.3678282, -2.219186, 0.7647059, 1, 0, 1,
-0.8484846, -0.538826, -3.484327, 0.7568628, 1, 0, 1,
-0.8479413, -1.762332, -2.480894, 0.7529412, 1, 0, 1,
-0.8400023, -0.7266294, -2.585981, 0.7450981, 1, 0, 1,
-0.8374107, -0.2950407, -1.837332, 0.7411765, 1, 0, 1,
-0.8336043, -0.5478679, -0.7395669, 0.7333333, 1, 0, 1,
-0.832151, 0.4988756, -1.864692, 0.7294118, 1, 0, 1,
-0.8299676, -0.4310902, -2.394385, 0.7215686, 1, 0, 1,
-0.827699, -1.07099, -3.339246, 0.7176471, 1, 0, 1,
-0.8243878, 0.2435444, -2.315105, 0.7098039, 1, 0, 1,
-0.8218593, -1.051638, -1.936816, 0.7058824, 1, 0, 1,
-0.8191408, -0.3109656, -3.620421, 0.6980392, 1, 0, 1,
-0.8097448, -0.856442, -2.713264, 0.6901961, 1, 0, 1,
-0.8090194, 1.124798, -1.393964, 0.6862745, 1, 0, 1,
-0.807332, -0.07887549, -2.011714, 0.6784314, 1, 0, 1,
-0.8036913, -0.3672543, -1.853467, 0.6745098, 1, 0, 1,
-0.7994303, 1.488755, 1.44683, 0.6666667, 1, 0, 1,
-0.7972363, 1.285328, -0.8514309, 0.6627451, 1, 0, 1,
-0.7915695, 2.414397, -0.9797824, 0.654902, 1, 0, 1,
-0.7867383, 1.70992, -0.4099235, 0.6509804, 1, 0, 1,
-0.7851469, -0.7733627, -2.323575, 0.6431373, 1, 0, 1,
-0.7831636, -0.4314636, -2.990203, 0.6392157, 1, 0, 1,
-0.772167, 0.4183178, 0.517723, 0.6313726, 1, 0, 1,
-0.7713593, 0.6547288, 1.290158, 0.627451, 1, 0, 1,
-0.7707375, 0.1138713, 0.6747848, 0.6196079, 1, 0, 1,
-0.7675706, -0.3616915, -3.104558, 0.6156863, 1, 0, 1,
-0.7658542, -1.014327, -2.949507, 0.6078432, 1, 0, 1,
-0.7643158, 0.1499007, 0.4117859, 0.6039216, 1, 0, 1,
-0.7625262, 0.4571103, -0.252955, 0.5960785, 1, 0, 1,
-0.7615454, -0.4779822, -2.403176, 0.5882353, 1, 0, 1,
-0.7466406, 0.2145806, -0.8526695, 0.5843138, 1, 0, 1,
-0.739665, 0.3916859, -1.439773, 0.5764706, 1, 0, 1,
-0.7354801, -0.4606973, -3.998167, 0.572549, 1, 0, 1,
-0.734906, -0.3237962, -1.754112, 0.5647059, 1, 0, 1,
-0.7341403, -0.8182565, -0.9676596, 0.5607843, 1, 0, 1,
-0.7300081, 0.3665099, 0.3956324, 0.5529412, 1, 0, 1,
-0.71152, -0.6705334, -0.9240287, 0.5490196, 1, 0, 1,
-0.7099015, -0.9476212, -2.203068, 0.5411765, 1, 0, 1,
-0.6972344, 0.1228275, -0.003537435, 0.5372549, 1, 0, 1,
-0.6846197, 0.3027137, -0.7270159, 0.5294118, 1, 0, 1,
-0.6834198, 0.2313967, -1.365654, 0.5254902, 1, 0, 1,
-0.6773908, 0.4181485, -1.279821, 0.5176471, 1, 0, 1,
-0.6637588, -0.2901848, -2.888365, 0.5137255, 1, 0, 1,
-0.644128, 0.9724964, -0.7722741, 0.5058824, 1, 0, 1,
-0.6416587, 0.3181005, -0.6485779, 0.5019608, 1, 0, 1,
-0.6415559, 0.5967391, -0.5519106, 0.4941176, 1, 0, 1,
-0.6369246, -1.267806, -1.379147, 0.4862745, 1, 0, 1,
-0.6366301, 0.6489606, -2.125508, 0.4823529, 1, 0, 1,
-0.6308044, 0.4514416, 0.3580736, 0.4745098, 1, 0, 1,
-0.6302101, -0.1225332, -3.475026, 0.4705882, 1, 0, 1,
-0.6239119, -0.3630617, -0.03635499, 0.4627451, 1, 0, 1,
-0.6218577, -0.1363213, -0.5866206, 0.4588235, 1, 0, 1,
-0.6143777, -0.330735, -3.887337, 0.4509804, 1, 0, 1,
-0.6095822, -2.486246, -2.950368, 0.4470588, 1, 0, 1,
-0.6072927, 0.7919536, -1.261281, 0.4392157, 1, 0, 1,
-0.6042732, 0.06932843, -2.228211, 0.4352941, 1, 0, 1,
-0.6023582, -1.871811, -2.903965, 0.427451, 1, 0, 1,
-0.597217, 1.025325, -0.2555569, 0.4235294, 1, 0, 1,
-0.5960336, -0.04430785, -3.203181, 0.4156863, 1, 0, 1,
-0.5947867, 0.6850433, -1.638986, 0.4117647, 1, 0, 1,
-0.5946152, 0.552543, -1.130517, 0.4039216, 1, 0, 1,
-0.5935952, 0.7309577, -1.459451, 0.3960784, 1, 0, 1,
-0.5917567, 1.815579, -1.186534, 0.3921569, 1, 0, 1,
-0.5885647, -0.7761189, -2.040902, 0.3843137, 1, 0, 1,
-0.5856177, 0.06880649, -1.120275, 0.3803922, 1, 0, 1,
-0.5855656, 0.7154801, -2.629918, 0.372549, 1, 0, 1,
-0.5836409, 1.284347, -0.6700936, 0.3686275, 1, 0, 1,
-0.5811999, -0.1800318, -0.6257692, 0.3607843, 1, 0, 1,
-0.5786937, 1.960834, -2.318194, 0.3568628, 1, 0, 1,
-0.5770987, -0.7249119, -2.042598, 0.3490196, 1, 0, 1,
-0.5754977, -0.9692699, -3.26561, 0.345098, 1, 0, 1,
-0.5740637, 0.1649945, -1.129225, 0.3372549, 1, 0, 1,
-0.5728502, 1.059939, -1.216875, 0.3333333, 1, 0, 1,
-0.571613, -0.4494192, -1.722145, 0.3254902, 1, 0, 1,
-0.5694037, 0.1748116, -1.767586, 0.3215686, 1, 0, 1,
-0.5683219, 0.3452122, -1.396253, 0.3137255, 1, 0, 1,
-0.5609635, 1.711937, 0.3731453, 0.3098039, 1, 0, 1,
-0.5600014, 0.006687643, -2.304841, 0.3019608, 1, 0, 1,
-0.559717, 2.698838, 0.7538821, 0.2941177, 1, 0, 1,
-0.5591415, -1.155923, -1.129402, 0.2901961, 1, 0, 1,
-0.5562556, 0.928977, -0.7520656, 0.282353, 1, 0, 1,
-0.5526893, -0.08090304, 0.3809641, 0.2784314, 1, 0, 1,
-0.5485016, -0.2892012, -0.4659927, 0.2705882, 1, 0, 1,
-0.5476277, 0.1729951, -1.736183, 0.2666667, 1, 0, 1,
-0.5473391, -1.521778, -3.78148, 0.2588235, 1, 0, 1,
-0.5450739, -0.5042771, -2.266572, 0.254902, 1, 0, 1,
-0.5449511, -1.626625, -2.356361, 0.2470588, 1, 0, 1,
-0.5441447, -0.9736351, -2.014291, 0.2431373, 1, 0, 1,
-0.5440285, -0.04898277, -0.3976638, 0.2352941, 1, 0, 1,
-0.5424196, -0.8023658, -1.491512, 0.2313726, 1, 0, 1,
-0.5406167, -1.652728, -2.279126, 0.2235294, 1, 0, 1,
-0.5388345, -0.4234593, -4.259786, 0.2196078, 1, 0, 1,
-0.5388109, -0.7756354, -2.488051, 0.2117647, 1, 0, 1,
-0.5354717, 1.593366, -0.9638745, 0.2078431, 1, 0, 1,
-0.5336651, -0.1565286, -0.4392526, 0.2, 1, 0, 1,
-0.5300884, 1.225997, -1.690587, 0.1921569, 1, 0, 1,
-0.5266677, -0.9622904, -1.866888, 0.1882353, 1, 0, 1,
-0.5216659, -2.066719, -2.699325, 0.1803922, 1, 0, 1,
-0.5193774, -0.1911681, -0.4797076, 0.1764706, 1, 0, 1,
-0.5185897, -0.434503, -4.045066, 0.1686275, 1, 0, 1,
-0.5154096, 2.408227, 0.2785874, 0.1647059, 1, 0, 1,
-0.5144439, 0.4697949, 0.7877696, 0.1568628, 1, 0, 1,
-0.5100727, 0.6130443, -1.509853, 0.1529412, 1, 0, 1,
-0.5076641, 1.082998, -0.007696255, 0.145098, 1, 0, 1,
-0.5057818, -1.112318, -3.346277, 0.1411765, 1, 0, 1,
-0.5006338, -1.477023, -4.161202, 0.1333333, 1, 0, 1,
-0.5005793, 0.9712837, -1.972289, 0.1294118, 1, 0, 1,
-0.4998248, -0.7623705, -2.160483, 0.1215686, 1, 0, 1,
-0.4989427, -0.1354144, -1.418178, 0.1176471, 1, 0, 1,
-0.4975374, -0.1387687, -2.097584, 0.1098039, 1, 0, 1,
-0.4969838, -0.7898046, -4.48333, 0.1058824, 1, 0, 1,
-0.4967042, 0.1057064, -0.4850565, 0.09803922, 1, 0, 1,
-0.4945965, -0.8505282, -4.599565, 0.09019608, 1, 0, 1,
-0.4852703, -0.2070725, -1.200343, 0.08627451, 1, 0, 1,
-0.483731, -0.5778328, -3.71761, 0.07843138, 1, 0, 1,
-0.4822063, -0.572756, -1.522727, 0.07450981, 1, 0, 1,
-0.4778226, 0.8110714, -0.1235747, 0.06666667, 1, 0, 1,
-0.4770733, -2.460911, -2.294904, 0.0627451, 1, 0, 1,
-0.4751919, 0.5386052, 0.7189685, 0.05490196, 1, 0, 1,
-0.4746385, -0.3681611, -1.790632, 0.05098039, 1, 0, 1,
-0.4734685, 0.5816844, -0.6555666, 0.04313726, 1, 0, 1,
-0.4715405, 0.873283, -1.77947, 0.03921569, 1, 0, 1,
-0.4633557, -0.2209049, -0.2154911, 0.03137255, 1, 0, 1,
-0.4630063, 0.8170677, -0.8332524, 0.02745098, 1, 0, 1,
-0.4481834, -1.039534, -1.772374, 0.01960784, 1, 0, 1,
-0.4463398, 0.6605639, -1.640037, 0.01568628, 1, 0, 1,
-0.4365892, 0.3057128, 0.2780125, 0.007843138, 1, 0, 1,
-0.4331661, -2.187947, -4.875224, 0.003921569, 1, 0, 1,
-0.4314709, 0.4415393, 0.2161586, 0, 1, 0.003921569, 1,
-0.4188767, -0.5690179, -1.948945, 0, 1, 0.01176471, 1,
-0.4181643, 0.8002343, -4.152843, 0, 1, 0.01568628, 1,
-0.4153421, -0.5941265, -2.234895, 0, 1, 0.02352941, 1,
-0.4128707, 0.5761327, -1.099375, 0, 1, 0.02745098, 1,
-0.4120811, 0.1648928, -1.59409, 0, 1, 0.03529412, 1,
-0.4115709, 0.2660498, 0.1728549, 0, 1, 0.03921569, 1,
-0.4101619, -0.5333134, -2.614633, 0, 1, 0.04705882, 1,
-0.4075708, -1.429631, -4.250439, 0, 1, 0.05098039, 1,
-0.4066227, 1.051029, -0.7000123, 0, 1, 0.05882353, 1,
-0.4035402, -1.035915, -4.180586, 0, 1, 0.0627451, 1,
-0.4025534, -0.5665595, -2.097645, 0, 1, 0.07058824, 1,
-0.4009667, 0.6900889, -0.6499742, 0, 1, 0.07450981, 1,
-0.3940494, -0.2212808, -2.2946, 0, 1, 0.08235294, 1,
-0.3898163, -0.4290491, -1.455959, 0, 1, 0.08627451, 1,
-0.384476, 0.4499909, -0.6453789, 0, 1, 0.09411765, 1,
-0.3829068, -0.9717945, -2.347725, 0, 1, 0.1019608, 1,
-0.3779435, -0.8343021, -2.198573, 0, 1, 0.1058824, 1,
-0.3739189, -2.056618, -2.853874, 0, 1, 0.1137255, 1,
-0.373496, -0.7036476, -3.186244, 0, 1, 0.1176471, 1,
-0.3729583, -1.593765, -2.871642, 0, 1, 0.1254902, 1,
-0.3720133, 1.417359, 0.7598301, 0, 1, 0.1294118, 1,
-0.3659604, -0.5386699, -2.304952, 0, 1, 0.1372549, 1,
-0.3648094, 1.265945, 1.192404, 0, 1, 0.1411765, 1,
-0.3633986, -0.2310233, 1.05585, 0, 1, 0.1490196, 1,
-0.3633517, 0.106972, -0.9962736, 0, 1, 0.1529412, 1,
-0.363183, 0.1973541, -1.3061, 0, 1, 0.1607843, 1,
-0.3564456, -0.2144443, -2.334732, 0, 1, 0.1647059, 1,
-0.3546393, 0.2973146, -0.949635, 0, 1, 0.172549, 1,
-0.3509126, 0.491464, -0.7974856, 0, 1, 0.1764706, 1,
-0.3473747, 2.111513, -0.4861646, 0, 1, 0.1843137, 1,
-0.3434601, -0.4466333, -2.405331, 0, 1, 0.1882353, 1,
-0.3428981, 0.4831946, 0.8245122, 0, 1, 0.1960784, 1,
-0.3420892, 0.2326272, -2.320603, 0, 1, 0.2039216, 1,
-0.3412948, 0.1986159, -0.04364551, 0, 1, 0.2078431, 1,
-0.3401652, -1.297173, -3.313067, 0, 1, 0.2156863, 1,
-0.3317611, 0.6632533, -1.202334, 0, 1, 0.2196078, 1,
-0.3309573, 0.154584, -2.215948, 0, 1, 0.227451, 1,
-0.3298944, -0.290244, -2.794876, 0, 1, 0.2313726, 1,
-0.3265301, -0.9779595, -2.637932, 0, 1, 0.2392157, 1,
-0.326012, 1.350252, -1.419437, 0, 1, 0.2431373, 1,
-0.325715, 1.010094, -0.04186915, 0, 1, 0.2509804, 1,
-0.3251354, -0.04754176, -1.136541, 0, 1, 0.254902, 1,
-0.3210087, 1.071116, -1.232361, 0, 1, 0.2627451, 1,
-0.3196474, -0.4504866, -3.55832, 0, 1, 0.2666667, 1,
-0.3145943, 1.328127, 0.7613984, 0, 1, 0.2745098, 1,
-0.3113353, -0.2863109, -3.416642, 0, 1, 0.2784314, 1,
-0.307228, 0.8200587, -0.2243041, 0, 1, 0.2862745, 1,
-0.3047687, 0.5531697, -0.7318181, 0, 1, 0.2901961, 1,
-0.2993593, -1.297515, -2.973134, 0, 1, 0.2980392, 1,
-0.2988273, 0.5093748, 2.655812, 0, 1, 0.3058824, 1,
-0.2945514, -0.09591708, -2.051792, 0, 1, 0.3098039, 1,
-0.2937048, -0.6189233, -3.811145, 0, 1, 0.3176471, 1,
-0.2926074, 2.024269, -0.5594044, 0, 1, 0.3215686, 1,
-0.29142, 0.6567916, -0.5890532, 0, 1, 0.3294118, 1,
-0.2865883, 0.8927156, 0.8992948, 0, 1, 0.3333333, 1,
-0.285742, 0.281487, -2.163772, 0, 1, 0.3411765, 1,
-0.2842683, -0.5246319, -1.591489, 0, 1, 0.345098, 1,
-0.2839789, 1.748335, -0.4280458, 0, 1, 0.3529412, 1,
-0.2835442, 0.1568995, -1.012655, 0, 1, 0.3568628, 1,
-0.2811761, -1.102208, -2.55396, 0, 1, 0.3647059, 1,
-0.2732692, 0.5831943, -1.16976, 0, 1, 0.3686275, 1,
-0.2718411, -0.6264421, -2.165005, 0, 1, 0.3764706, 1,
-0.2709551, 1.554407, -1.370769, 0, 1, 0.3803922, 1,
-0.2653387, 1.01837, 1.453488, 0, 1, 0.3882353, 1,
-0.2618898, 0.2940193, -1.197809, 0, 1, 0.3921569, 1,
-0.2593122, 0.7896073, -0.2311928, 0, 1, 0.4, 1,
-0.2466998, -0.2634197, -3.807633, 0, 1, 0.4078431, 1,
-0.2454093, 0.1546295, -1.85837, 0, 1, 0.4117647, 1,
-0.2443833, 0.08208124, -0.5586742, 0, 1, 0.4196078, 1,
-0.2440657, 1.715415, 0.6482405, 0, 1, 0.4235294, 1,
-0.2401021, 1.14344, -1.157499, 0, 1, 0.4313726, 1,
-0.2387928, -0.6044934, -3.827662, 0, 1, 0.4352941, 1,
-0.2377766, 0.07938008, 0.5355108, 0, 1, 0.4431373, 1,
-0.2376301, 0.8396541, -1.172085, 0, 1, 0.4470588, 1,
-0.2350467, 1.724504, -0.4341281, 0, 1, 0.454902, 1,
-0.2340617, -0.2875382, -3.423172, 0, 1, 0.4588235, 1,
-0.2339131, -1.839767, -3.462925, 0, 1, 0.4666667, 1,
-0.2306795, -0.4428816, -3.642669, 0, 1, 0.4705882, 1,
-0.2305669, -1.197609, -2.318267, 0, 1, 0.4784314, 1,
-0.2261301, -1.022091, -2.380655, 0, 1, 0.4823529, 1,
-0.2215978, -1.444433, -3.256399, 0, 1, 0.4901961, 1,
-0.2193715, 0.137554, -0.7023608, 0, 1, 0.4941176, 1,
-0.2186322, -0.3772472, -2.049063, 0, 1, 0.5019608, 1,
-0.2149104, 2.359697, 0.4592178, 0, 1, 0.509804, 1,
-0.2147569, 1.720714, 1.592827, 0, 1, 0.5137255, 1,
-0.2127337, 0.5783506, 0.5858611, 0, 1, 0.5215687, 1,
-0.2113815, -0.1307575, -5.420407, 0, 1, 0.5254902, 1,
-0.20738, 0.862952, -0.5293303, 0, 1, 0.5333334, 1,
-0.2027002, -1.180489, -2.354629, 0, 1, 0.5372549, 1,
-0.2010254, 1.405156, 0.9168718, 0, 1, 0.5450981, 1,
-0.1962079, -0.8663254, -4.618724, 0, 1, 0.5490196, 1,
-0.1956427, -0.477369, -3.172579, 0, 1, 0.5568628, 1,
-0.193541, -0.05556411, -0.632593, 0, 1, 0.5607843, 1,
-0.1921815, 0.08826497, -2.409276, 0, 1, 0.5686275, 1,
-0.1909838, 0.02006277, -1.970121, 0, 1, 0.572549, 1,
-0.1902612, -0.4541104, -3.123267, 0, 1, 0.5803922, 1,
-0.1899648, -0.4781438, -2.254064, 0, 1, 0.5843138, 1,
-0.1886394, -1.558685, -3.058016, 0, 1, 0.5921569, 1,
-0.1800439, 1.077416, 0.08688523, 0, 1, 0.5960785, 1,
-0.1784278, 0.875985, -0.07964791, 0, 1, 0.6039216, 1,
-0.1771653, 1.702609, 0.1192679, 0, 1, 0.6117647, 1,
-0.1769285, -0.2961265, -2.360812, 0, 1, 0.6156863, 1,
-0.1737235, 0.102496, -1.020993, 0, 1, 0.6235294, 1,
-0.1727968, -1.37877, -2.213789, 0, 1, 0.627451, 1,
-0.1705852, 0.8285387, 0.08118566, 0, 1, 0.6352941, 1,
-0.1687637, 1.85275, -1.073484, 0, 1, 0.6392157, 1,
-0.167331, -0.6520544, -3.041648, 0, 1, 0.6470588, 1,
-0.1659451, 0.1066272, -3.03883, 0, 1, 0.6509804, 1,
-0.1658894, -1.822533, -3.176559, 0, 1, 0.6588235, 1,
-0.1617539, 0.9061952, -0.08205472, 0, 1, 0.6627451, 1,
-0.1614333, -0.02473807, -1.267444, 0, 1, 0.6705883, 1,
-0.1587479, 1.080871, -1.236783, 0, 1, 0.6745098, 1,
-0.1566571, -0.08880706, -3.860438, 0, 1, 0.682353, 1,
-0.1486837, -0.2139213, -1.906397, 0, 1, 0.6862745, 1,
-0.1464832, -0.1828129, -2.609313, 0, 1, 0.6941177, 1,
-0.1432317, -3.747662, -3.636922, 0, 1, 0.7019608, 1,
-0.1426163, 0.8048035, 0.5879798, 0, 1, 0.7058824, 1,
-0.1421587, 1.826705, 0.677597, 0, 1, 0.7137255, 1,
-0.1406777, -1.387833, -3.312933, 0, 1, 0.7176471, 1,
-0.1389135, -0.7925442, -1.285695, 0, 1, 0.7254902, 1,
-0.1358644, -0.6519502, -3.275625, 0, 1, 0.7294118, 1,
-0.1343169, 1.054844, 0.3072923, 0, 1, 0.7372549, 1,
-0.1323281, -0.8109607, -3.122695, 0, 1, 0.7411765, 1,
-0.1308343, 0.01315401, -1.383855, 0, 1, 0.7490196, 1,
-0.1281924, 0.8081711, -2.328734, 0, 1, 0.7529412, 1,
-0.121692, 0.05830468, -1.796815, 0, 1, 0.7607843, 1,
-0.121309, 1.517024, -0.09460665, 0, 1, 0.7647059, 1,
-0.1180784, -0.2189513, -2.935922, 0, 1, 0.772549, 1,
-0.1077824, 0.3200274, -2.202484, 0, 1, 0.7764706, 1,
-0.09070113, 0.3507091, -0.3715069, 0, 1, 0.7843137, 1,
-0.08932331, 0.3059333, 2.146039, 0, 1, 0.7882353, 1,
-0.08375642, -1.203208, -3.303415, 0, 1, 0.7960784, 1,
-0.08311228, -0.04433395, -1.383016, 0, 1, 0.8039216, 1,
-0.08285818, 0.003883671, -1.807092, 0, 1, 0.8078431, 1,
-0.08196642, 0.690662, -0.2327057, 0, 1, 0.8156863, 1,
-0.08187744, -1.219349, -4.421733, 0, 1, 0.8196079, 1,
-0.08067974, 0.2748732, 0.1298326, 0, 1, 0.827451, 1,
-0.08002498, -0.3536415, -2.851371, 0, 1, 0.8313726, 1,
-0.07135951, 1.191773, -0.09684528, 0, 1, 0.8392157, 1,
-0.0707428, -0.7750248, -3.069903, 0, 1, 0.8431373, 1,
-0.06978597, 1.082512, -1.060725, 0, 1, 0.8509804, 1,
-0.0671465, 1.192817, -0.06770553, 0, 1, 0.854902, 1,
-0.06666274, -0.9005969, -4.372614, 0, 1, 0.8627451, 1,
-0.06602113, -0.2270234, -3.676901, 0, 1, 0.8666667, 1,
-0.0641933, 1.145629, 0.1678476, 0, 1, 0.8745098, 1,
-0.06298997, -0.7145489, -5.135755, 0, 1, 0.8784314, 1,
-0.06190621, 0.2017238, 0.6622676, 0, 1, 0.8862745, 1,
-0.06038643, 0.4978853, -1.035804, 0, 1, 0.8901961, 1,
-0.05908604, 0.6219914, -1.074838, 0, 1, 0.8980392, 1,
-0.05468052, 1.11491, 0.2420337, 0, 1, 0.9058824, 1,
-0.05427216, -1.180943, -2.459149, 0, 1, 0.9098039, 1,
-0.05224901, -0.6697557, -2.040549, 0, 1, 0.9176471, 1,
-0.05141743, 1.0213, 0.41778, 0, 1, 0.9215686, 1,
-0.04834693, -0.6567239, -3.705424, 0, 1, 0.9294118, 1,
-0.04346994, 1.027012, 0.5306343, 0, 1, 0.9333333, 1,
-0.03614809, -0.04135299, -4.171888, 0, 1, 0.9411765, 1,
-0.03471375, -0.05282738, -2.444661, 0, 1, 0.945098, 1,
-0.0254248, 0.3669409, -2.328408, 0, 1, 0.9529412, 1,
-0.02355503, -2.765219, -3.892661, 0, 1, 0.9568627, 1,
-0.02184915, 0.08959163, 2.164611, 0, 1, 0.9647059, 1,
-0.01911908, -2.333096, -3.352645, 0, 1, 0.9686275, 1,
-0.01794995, 0.3178541, 1.367287, 0, 1, 0.9764706, 1,
-0.01074418, 0.5507422, 1.085286, 0, 1, 0.9803922, 1,
-0.01063265, -0.9241863, -1.773414, 0, 1, 0.9882353, 1,
-0.00733242, 1.28483, -2.448163, 0, 1, 0.9921569, 1,
-0.004316535, -0.3322683, -3.292187, 0, 1, 1, 1,
-0.0005252635, 0.1537449, -0.3566331, 0, 0.9921569, 1, 1,
0.000132944, 1.008067, 0.5050569, 0, 0.9882353, 1, 1,
0.001178646, -0.9699391, 3.778633, 0, 0.9803922, 1, 1,
0.002595501, -1.271609, 2.685616, 0, 0.9764706, 1, 1,
0.007964982, 0.8818878, -0.9712833, 0, 0.9686275, 1, 1,
0.008966855, 0.306785, 0.04372334, 0, 0.9647059, 1, 1,
0.01209485, -2.008702, 2.687086, 0, 0.9568627, 1, 1,
0.01373306, -0.9982796, 2.623669, 0, 0.9529412, 1, 1,
0.01674223, 1.127897, 0.5006506, 0, 0.945098, 1, 1,
0.01835034, 1.130011, 0.3009167, 0, 0.9411765, 1, 1,
0.01858814, -1.502748, -0.3541401, 0, 0.9333333, 1, 1,
0.01967416, 0.441555, 0.07654395, 0, 0.9294118, 1, 1,
0.02583063, 1.162539, 1.386303, 0, 0.9215686, 1, 1,
0.02587193, -1.59628, 3.678318, 0, 0.9176471, 1, 1,
0.02850043, 0.3009664, 0.6547368, 0, 0.9098039, 1, 1,
0.03341148, 0.6089532, -0.6123123, 0, 0.9058824, 1, 1,
0.0338267, -0.3736764, 1.739848, 0, 0.8980392, 1, 1,
0.03403901, -1.061775, 4.176721, 0, 0.8901961, 1, 1,
0.05014525, 0.5441456, 0.4116819, 0, 0.8862745, 1, 1,
0.05102206, 2.72589, -0.1981967, 0, 0.8784314, 1, 1,
0.05568291, 0.8381633, 1.510369, 0, 0.8745098, 1, 1,
0.05610688, 0.1868725, 0.9150412, 0, 0.8666667, 1, 1,
0.06613637, -0.6413441, 3.774123, 0, 0.8627451, 1, 1,
0.06724232, 1.785277, -0.5008302, 0, 0.854902, 1, 1,
0.06959397, 0.05680475, -1.227894, 0, 0.8509804, 1, 1,
0.0702991, 0.3283655, 0.569998, 0, 0.8431373, 1, 1,
0.07535999, -1.214581, 0.6809719, 0, 0.8392157, 1, 1,
0.07814815, 0.5019404, 1.055165, 0, 0.8313726, 1, 1,
0.07874651, -1.077489, 2.831172, 0, 0.827451, 1, 1,
0.08249149, -1.221378, 3.676603, 0, 0.8196079, 1, 1,
0.08573306, 2.293883, 0.5809985, 0, 0.8156863, 1, 1,
0.08713194, 0.3919081, 0.1459441, 0, 0.8078431, 1, 1,
0.08808255, -0.2972765, 2.127438, 0, 0.8039216, 1, 1,
0.08847672, 0.9557809, -0.7284698, 0, 0.7960784, 1, 1,
0.09246189, -0.4797328, 1.271703, 0, 0.7882353, 1, 1,
0.09349203, -0.4685962, 1.966733, 0, 0.7843137, 1, 1,
0.09450104, 0.0006359996, 3.253355, 0, 0.7764706, 1, 1,
0.09492093, -0.8070559, 4.013672, 0, 0.772549, 1, 1,
0.09655873, 2.585524, -1.212633, 0, 0.7647059, 1, 1,
0.09718451, 0.6944915, -0.7147814, 0, 0.7607843, 1, 1,
0.09917533, -0.6327068, 3.734227, 0, 0.7529412, 1, 1,
0.1013305, -0.5798755, 4.085766, 0, 0.7490196, 1, 1,
0.1058132, -0.1460315, 2.855849, 0, 0.7411765, 1, 1,
0.1093846, -0.9838645, 2.326703, 0, 0.7372549, 1, 1,
0.1118379, 0.7125226, 2.23473, 0, 0.7294118, 1, 1,
0.1138071, -1.157844, 3.440799, 0, 0.7254902, 1, 1,
0.1142801, 0.8058138, -1.01166, 0, 0.7176471, 1, 1,
0.1194256, -0.1043079, 2.763587, 0, 0.7137255, 1, 1,
0.120629, -1.572928, 4.225065, 0, 0.7058824, 1, 1,
0.1227798, -0.0502579, 1.953227, 0, 0.6980392, 1, 1,
0.1237342, -1.423135, 2.587984, 0, 0.6941177, 1, 1,
0.1240914, 2.304582, -0.140247, 0, 0.6862745, 1, 1,
0.1257456, -0.1452427, 1.306529, 0, 0.682353, 1, 1,
0.1266303, 0.01092719, 1.042825, 0, 0.6745098, 1, 1,
0.1283707, 0.06143663, -0.109353, 0, 0.6705883, 1, 1,
0.1358212, -0.00748049, 1.665848, 0, 0.6627451, 1, 1,
0.1367551, 2.140729, -1.092864, 0, 0.6588235, 1, 1,
0.1375831, -0.7686643, 3.306478, 0, 0.6509804, 1, 1,
0.1394353, -0.7192471, 3.09632, 0, 0.6470588, 1, 1,
0.1425247, -0.5329489, 2.955872, 0, 0.6392157, 1, 1,
0.1430369, 0.6263213, -0.002986645, 0, 0.6352941, 1, 1,
0.1441671, 0.8642164, -0.7577854, 0, 0.627451, 1, 1,
0.144443, 0.3222729, 1.734233, 0, 0.6235294, 1, 1,
0.1491553, -0.3815569, 5.051235, 0, 0.6156863, 1, 1,
0.1496775, 1.336031, 1.566492, 0, 0.6117647, 1, 1,
0.15093, -0.7574021, 1.864865, 0, 0.6039216, 1, 1,
0.1562242, -0.3039754, 2.959624, 0, 0.5960785, 1, 1,
0.1620768, -1.093122, 3.378529, 0, 0.5921569, 1, 1,
0.1685433, -0.360267, 2.130025, 0, 0.5843138, 1, 1,
0.1685439, -0.6531187, 0.1611082, 0, 0.5803922, 1, 1,
0.1687498, -0.8999755, 4.502829, 0, 0.572549, 1, 1,
0.1765262, -0.2858519, 3.154518, 0, 0.5686275, 1, 1,
0.1806732, -0.1720388, 2.125458, 0, 0.5607843, 1, 1,
0.1853998, 1.099303, -0.7284274, 0, 0.5568628, 1, 1,
0.1873553, 0.4250613, 1.438525, 0, 0.5490196, 1, 1,
0.1941438, 0.2102137, 1.506926, 0, 0.5450981, 1, 1,
0.1946552, 1.546445, -0.7703284, 0, 0.5372549, 1, 1,
0.1955683, -1.175045, 3.317515, 0, 0.5333334, 1, 1,
0.1969741, -0.1058066, 3.138799, 0, 0.5254902, 1, 1,
0.1975119, 0.3884756, -0.3047712, 0, 0.5215687, 1, 1,
0.1977576, 2.291673, -0.0001561874, 0, 0.5137255, 1, 1,
0.1990877, -1.379706, 2.111771, 0, 0.509804, 1, 1,
0.1999849, -0.6030713, 4.856021, 0, 0.5019608, 1, 1,
0.200086, 0.9045185, -0.7613184, 0, 0.4941176, 1, 1,
0.2034653, 0.5360796, -0.1484478, 0, 0.4901961, 1, 1,
0.2089652, 0.9027376, 1.187091, 0, 0.4823529, 1, 1,
0.2106429, -0.03294183, 1.918905, 0, 0.4784314, 1, 1,
0.2115722, 1.256961, -0.9880441, 0, 0.4705882, 1, 1,
0.2117681, 0.06326032, 1.362795, 0, 0.4666667, 1, 1,
0.2130591, -1.057934, 1.705288, 0, 0.4588235, 1, 1,
0.216844, 0.9597507, -0.9102954, 0, 0.454902, 1, 1,
0.2225738, 0.4096082, 0.1714713, 0, 0.4470588, 1, 1,
0.225031, 0.3961021, 0.702066, 0, 0.4431373, 1, 1,
0.2313498, -1.233466, 2.972134, 0, 0.4352941, 1, 1,
0.2332432, 0.9650241, -0.7092534, 0, 0.4313726, 1, 1,
0.2357873, -0.6851342, 2.845547, 0, 0.4235294, 1, 1,
0.2387223, 0.2123612, 0.3386808, 0, 0.4196078, 1, 1,
0.2394375, -0.1102388, 1.077874, 0, 0.4117647, 1, 1,
0.2416811, -1.066427, 3.125228, 0, 0.4078431, 1, 1,
0.2452984, 0.2720155, 1.107836, 0, 0.4, 1, 1,
0.2474505, -1.047351, 3.33981, 0, 0.3921569, 1, 1,
0.2475362, 0.238496, 1.146961, 0, 0.3882353, 1, 1,
0.2534152, 0.262319, -0.02174579, 0, 0.3803922, 1, 1,
0.2543924, -0.08817799, 2.172925, 0, 0.3764706, 1, 1,
0.2572361, -1.32501, 3.567997, 0, 0.3686275, 1, 1,
0.2574501, 1.446147, -1.382616, 0, 0.3647059, 1, 1,
0.2582294, -0.1437511, 2.210199, 0, 0.3568628, 1, 1,
0.2586784, 0.4735152, 0.06155901, 0, 0.3529412, 1, 1,
0.2604291, -1.165006, 4.283373, 0, 0.345098, 1, 1,
0.2657959, 1.720112, -1.058931, 0, 0.3411765, 1, 1,
0.2672741, -0.6081712, 3.205065, 0, 0.3333333, 1, 1,
0.2681822, -1.513244, 3.287294, 0, 0.3294118, 1, 1,
0.2730862, 0.3229877, 1.285566, 0, 0.3215686, 1, 1,
0.2751517, -1.25738, 3.207522, 0, 0.3176471, 1, 1,
0.2756479, 0.4023176, 0.4962039, 0, 0.3098039, 1, 1,
0.2772088, -0.994657, 2.226068, 0, 0.3058824, 1, 1,
0.2785994, -0.05744859, 1.64394, 0, 0.2980392, 1, 1,
0.2789397, 2.053332, 0.2848416, 0, 0.2901961, 1, 1,
0.2808751, -1.5087, 2.980037, 0, 0.2862745, 1, 1,
0.2868904, -1.163121, 1.734239, 0, 0.2784314, 1, 1,
0.2948895, 1.421128, 0.3851346, 0, 0.2745098, 1, 1,
0.3009233, 0.7511841, 1.539121, 0, 0.2666667, 1, 1,
0.3018736, 2.361681, 0.4125881, 0, 0.2627451, 1, 1,
0.3040869, -0.03392869, 1.110928, 0, 0.254902, 1, 1,
0.307288, 0.2117491, 1.914446, 0, 0.2509804, 1, 1,
0.3082539, 1.950759, -0.6498516, 0, 0.2431373, 1, 1,
0.3097607, 1.796098, 2.15212, 0, 0.2392157, 1, 1,
0.3110633, 0.4024971, 0.9238355, 0, 0.2313726, 1, 1,
0.3110904, 1.509257, -1.642694, 0, 0.227451, 1, 1,
0.312324, -0.3474798, 1.599344, 0, 0.2196078, 1, 1,
0.3142829, -1.823486, 2.405689, 0, 0.2156863, 1, 1,
0.3197272, 2.221317, -0.0290363, 0, 0.2078431, 1, 1,
0.322402, -0.3429259, 2.125432, 0, 0.2039216, 1, 1,
0.3224422, 0.5817294, -0.4725063, 0, 0.1960784, 1, 1,
0.3258448, 0.2375911, -1.613487, 0, 0.1882353, 1, 1,
0.327024, 0.2910385, 0.6641496, 0, 0.1843137, 1, 1,
0.3276014, -0.07116482, 2.398077, 0, 0.1764706, 1, 1,
0.3281151, -0.4325357, 4.512375, 0, 0.172549, 1, 1,
0.3378524, 0.9002625, -1.128862, 0, 0.1647059, 1, 1,
0.3379542, -1.516936, 2.92067, 0, 0.1607843, 1, 1,
0.3410628, 0.8008904, 0.6812135, 0, 0.1529412, 1, 1,
0.3480041, 1.507082, 2.349861, 0, 0.1490196, 1, 1,
0.3498209, 0.2157167, -1.174663, 0, 0.1411765, 1, 1,
0.3531083, -1.284221, 2.119863, 0, 0.1372549, 1, 1,
0.353673, 0.5936572, 0.6984408, 0, 0.1294118, 1, 1,
0.3551751, 1.162739, 2.284848, 0, 0.1254902, 1, 1,
0.3563114, -0.4928608, 2.872944, 0, 0.1176471, 1, 1,
0.3619675, -0.440851, 3.393057, 0, 0.1137255, 1, 1,
0.3622945, -1.83487, 2.595297, 0, 0.1058824, 1, 1,
0.3704892, 0.09710359, 1.682391, 0, 0.09803922, 1, 1,
0.3745763, -2.357233, 2.001998, 0, 0.09411765, 1, 1,
0.3785265, 0.6434681, 2.508244, 0, 0.08627451, 1, 1,
0.3786467, 0.08653042, 2.329608, 0, 0.08235294, 1, 1,
0.3798589, -0.4965325, 2.285066, 0, 0.07450981, 1, 1,
0.384722, 1.063651, 0.01885804, 0, 0.07058824, 1, 1,
0.3861519, -0.2410217, 2.503214, 0, 0.0627451, 1, 1,
0.3952655, -0.2870134, 0.6382141, 0, 0.05882353, 1, 1,
0.3975428, -0.7958564, 3.389305, 0, 0.05098039, 1, 1,
0.3984789, -0.4093186, 2.2817, 0, 0.04705882, 1, 1,
0.4001919, 0.3014614, 0.9193379, 0, 0.03921569, 1, 1,
0.4009405, 0.9188363, -0.05561227, 0, 0.03529412, 1, 1,
0.4048995, -1.572115, 2.429842, 0, 0.02745098, 1, 1,
0.4063367, -0.8719383, 1.082646, 0, 0.02352941, 1, 1,
0.4106709, -0.2112004, 1.565359, 0, 0.01568628, 1, 1,
0.4171969, 0.6455278, 1.05592, 0, 0.01176471, 1, 1,
0.4240589, -2.071033, 2.53426, 0, 0.003921569, 1, 1,
0.4244065, 0.767657, -1.429599, 0.003921569, 0, 1, 1,
0.4281469, -2.277115, 1.99434, 0.007843138, 0, 1, 1,
0.4288124, -0.6833872, 3.37595, 0.01568628, 0, 1, 1,
0.4345812, 1.083311, 0.8694926, 0.01960784, 0, 1, 1,
0.4352546, 2.466179, 0.4817666, 0.02745098, 0, 1, 1,
0.4366217, 1.074879, 1.357855, 0.03137255, 0, 1, 1,
0.4422797, -0.1832441, 4.026594, 0.03921569, 0, 1, 1,
0.4436412, 0.09101901, 2.25047, 0.04313726, 0, 1, 1,
0.4443746, 1.596162, 0.1877035, 0.05098039, 0, 1, 1,
0.4491839, -0.01297511, 1.256549, 0.05490196, 0, 1, 1,
0.4508598, 0.203888, -0.774076, 0.0627451, 0, 1, 1,
0.4525615, -0.4200375, 3.600812, 0.06666667, 0, 1, 1,
0.4529446, -0.4287346, 3.119942, 0.07450981, 0, 1, 1,
0.4553842, -1.337844, 3.653911, 0.07843138, 0, 1, 1,
0.4565082, 0.9321406, 1.136714, 0.08627451, 0, 1, 1,
0.4581438, -0.1447669, 1.091595, 0.09019608, 0, 1, 1,
0.4752598, -0.582304, 4.714774, 0.09803922, 0, 1, 1,
0.4780549, -1.364179, 2.054111, 0.1058824, 0, 1, 1,
0.4785297, 0.7782094, -0.08583827, 0.1098039, 0, 1, 1,
0.4842643, -0.9460804, 0.2314537, 0.1176471, 0, 1, 1,
0.4853452, -0.3741842, 2.021061, 0.1215686, 0, 1, 1,
0.4869256, 0.1455196, 2.132321, 0.1294118, 0, 1, 1,
0.498293, -1.372484, 3.031012, 0.1333333, 0, 1, 1,
0.4995143, -0.8275729, 2.789293, 0.1411765, 0, 1, 1,
0.504368, 1.377866, 1.500879, 0.145098, 0, 1, 1,
0.5048499, 0.8132912, -1.278066, 0.1529412, 0, 1, 1,
0.5079016, -1.124747, 4.901411, 0.1568628, 0, 1, 1,
0.5147502, -0.04991146, 4.290421, 0.1647059, 0, 1, 1,
0.5222775, 1.420257, 0.1895786, 0.1686275, 0, 1, 1,
0.5303069, 1.080771, 0.3831716, 0.1764706, 0, 1, 1,
0.5405987, 1.524064, 0.372018, 0.1803922, 0, 1, 1,
0.543346, -0.6141701, 1.068621, 0.1882353, 0, 1, 1,
0.5467474, 0.0355579, 1.444388, 0.1921569, 0, 1, 1,
0.5467565, 0.3765457, 2.737984, 0.2, 0, 1, 1,
0.5491158, -0.4827316, 1.679004, 0.2078431, 0, 1, 1,
0.5550902, 0.7085855, 1.160468, 0.2117647, 0, 1, 1,
0.5565863, 1.011307, 0.5464181, 0.2196078, 0, 1, 1,
0.5578253, 1.195379, -0.05389013, 0.2235294, 0, 1, 1,
0.5589325, 1.416175, 1.07447, 0.2313726, 0, 1, 1,
0.5602447, -0.6884419, 3.084392, 0.2352941, 0, 1, 1,
0.5620894, 0.7325107, 1.01849, 0.2431373, 0, 1, 1,
0.5720567, 3.089231, -0.41707, 0.2470588, 0, 1, 1,
0.5727971, 1.508481, -0.6510358, 0.254902, 0, 1, 1,
0.577322, -0.2999947, 0.9769343, 0.2588235, 0, 1, 1,
0.5794054, -1.131035, 1.83842, 0.2666667, 0, 1, 1,
0.5821818, -0.01973824, 0.6852252, 0.2705882, 0, 1, 1,
0.5833018, 0.9738988, -0.233859, 0.2784314, 0, 1, 1,
0.586286, 1.20933, -0.8418645, 0.282353, 0, 1, 1,
0.5967468, 2.015838, -1.077614, 0.2901961, 0, 1, 1,
0.5981165, 0.5539476, 1.780078, 0.2941177, 0, 1, 1,
0.601787, 0.7485874, -1.18279, 0.3019608, 0, 1, 1,
0.602564, -1.207465, 1.693606, 0.3098039, 0, 1, 1,
0.6029657, 0.06809685, 3.256411, 0.3137255, 0, 1, 1,
0.6137462, -0.08102151, 1.850762, 0.3215686, 0, 1, 1,
0.6161424, 0.1743099, -0.9242743, 0.3254902, 0, 1, 1,
0.6164021, -0.1819086, 3.323476, 0.3333333, 0, 1, 1,
0.6166565, 1.877465, 0.8196533, 0.3372549, 0, 1, 1,
0.6234072, 2.030594, 0.8159676, 0.345098, 0, 1, 1,
0.6299642, 1.170129, 0.218651, 0.3490196, 0, 1, 1,
0.6374111, -0.3626089, -0.4357324, 0.3568628, 0, 1, 1,
0.639557, -0.3155404, 2.217183, 0.3607843, 0, 1, 1,
0.6411393, -1.420823, 2.550256, 0.3686275, 0, 1, 1,
0.643268, 0.1755716, 1.134723, 0.372549, 0, 1, 1,
0.6442463, -1.470118, 5.217329, 0.3803922, 0, 1, 1,
0.6457729, -0.5451063, 3.146734, 0.3843137, 0, 1, 1,
0.6560636, 0.3109494, 2.283373, 0.3921569, 0, 1, 1,
0.6570221, 1.034557, 1.852242, 0.3960784, 0, 1, 1,
0.6571003, 0.4996676, -0.08467843, 0.4039216, 0, 1, 1,
0.6603517, 1.033869, -0.9808487, 0.4117647, 0, 1, 1,
0.6680993, 0.6363609, 0.1354067, 0.4156863, 0, 1, 1,
0.6683109, 0.6179529, 2.465853, 0.4235294, 0, 1, 1,
0.671333, -0.109408, 0.3427199, 0.427451, 0, 1, 1,
0.6768682, -0.1034016, 0.7083262, 0.4352941, 0, 1, 1,
0.6774613, -0.04521873, 1.090091, 0.4392157, 0, 1, 1,
0.6776202, 0.1591866, 0.8516477, 0.4470588, 0, 1, 1,
0.6786612, 0.1148056, 2.587921, 0.4509804, 0, 1, 1,
0.6810762, 0.5262629, -0.2996352, 0.4588235, 0, 1, 1,
0.6822184, -0.1083258, 1.584267, 0.4627451, 0, 1, 1,
0.6848519, 0.692534, -0.1782834, 0.4705882, 0, 1, 1,
0.6850002, -0.01852247, 1.841914, 0.4745098, 0, 1, 1,
0.6864484, -2.404531, 1.185934, 0.4823529, 0, 1, 1,
0.6869314, -0.1627332, 0.8582047, 0.4862745, 0, 1, 1,
0.6940227, -0.5393082, 1.370652, 0.4941176, 0, 1, 1,
0.6952011, 0.8645898, -0.2059519, 0.5019608, 0, 1, 1,
0.6957234, 0.1235085, 0.5468748, 0.5058824, 0, 1, 1,
0.6965626, -0.3883002, 3.233178, 0.5137255, 0, 1, 1,
0.7066842, 0.5037233, 1.316217, 0.5176471, 0, 1, 1,
0.7149553, -1.315916, 2.013695, 0.5254902, 0, 1, 1,
0.7168202, -0.2999861, 1.372885, 0.5294118, 0, 1, 1,
0.7172402, 0.9547608, 2.785495, 0.5372549, 0, 1, 1,
0.7323496, 1.450275, 0.4205005, 0.5411765, 0, 1, 1,
0.7339884, 0.2468588, 0.9621205, 0.5490196, 0, 1, 1,
0.7400482, -1.220782, 3.631367, 0.5529412, 0, 1, 1,
0.7408357, 1.046376, -0.8407855, 0.5607843, 0, 1, 1,
0.7408944, 0.6328965, 1.617113, 0.5647059, 0, 1, 1,
0.7424002, -0.9444264, 0.3771893, 0.572549, 0, 1, 1,
0.7437332, -0.6137144, 1.362562, 0.5764706, 0, 1, 1,
0.7492432, 0.7856303, 1.772231, 0.5843138, 0, 1, 1,
0.7494188, -0.9890724, 1.492557, 0.5882353, 0, 1, 1,
0.7509657, 0.6263472, -0.1638538, 0.5960785, 0, 1, 1,
0.7621859, 1.689948, 1.547461, 0.6039216, 0, 1, 1,
0.7635737, 0.8980662, 0.1703963, 0.6078432, 0, 1, 1,
0.7664632, 2.767648, 1.054466, 0.6156863, 0, 1, 1,
0.7690114, 0.8001043, -0.4635271, 0.6196079, 0, 1, 1,
0.7762185, 2.292979, 0.1203042, 0.627451, 0, 1, 1,
0.7780879, -0.2679499, 2.426195, 0.6313726, 0, 1, 1,
0.7805027, 0.4758571, 2.022856, 0.6392157, 0, 1, 1,
0.783007, -0.2158113, 1.542108, 0.6431373, 0, 1, 1,
0.7850244, -0.5075305, 2.312091, 0.6509804, 0, 1, 1,
0.7869649, 1.242749, 1.217971, 0.654902, 0, 1, 1,
0.7876343, 0.4623906, 1.823092, 0.6627451, 0, 1, 1,
0.7919146, 0.564835, -0.1015017, 0.6666667, 0, 1, 1,
0.7931558, 0.651522, 1.920121, 0.6745098, 0, 1, 1,
0.7938488, -1.300565, 0.8741001, 0.6784314, 0, 1, 1,
0.7962734, 2.040617, 0.4198875, 0.6862745, 0, 1, 1,
0.7974179, 0.04032145, 1.583288, 0.6901961, 0, 1, 1,
0.8007293, 0.5394014, 0.9882398, 0.6980392, 0, 1, 1,
0.802331, 0.9417217, 0.2809305, 0.7058824, 0, 1, 1,
0.8037974, -1.273347, 1.410183, 0.7098039, 0, 1, 1,
0.8057196, -1.243369, 2.817277, 0.7176471, 0, 1, 1,
0.813162, 2.050695, 1.18678, 0.7215686, 0, 1, 1,
0.8133846, 0.5308034, 1.89344, 0.7294118, 0, 1, 1,
0.8147076, -0.8102881, 1.719239, 0.7333333, 0, 1, 1,
0.8158931, 0.7510577, 0.8211113, 0.7411765, 0, 1, 1,
0.8205829, 0.4437523, 1.730097, 0.7450981, 0, 1, 1,
0.8261098, 1.175891, -1.684639, 0.7529412, 0, 1, 1,
0.8280085, 0.1927286, 1.023764, 0.7568628, 0, 1, 1,
0.8288999, 1.051633, 0.7535304, 0.7647059, 0, 1, 1,
0.8431591, 0.06097009, 0.5530742, 0.7686275, 0, 1, 1,
0.8431801, 0.09170619, 0.9829314, 0.7764706, 0, 1, 1,
0.8485496, -0.5250302, 2.270511, 0.7803922, 0, 1, 1,
0.855131, 1.225601, 1.053647, 0.7882353, 0, 1, 1,
0.8562685, -0.8336579, 1.602424, 0.7921569, 0, 1, 1,
0.856867, 2.833222, 1.134524, 0.8, 0, 1, 1,
0.8625314, -0.6802704, 2.670563, 0.8078431, 0, 1, 1,
0.8669549, -0.7060341, 2.428054, 0.8117647, 0, 1, 1,
0.8698859, -0.2564569, 1.78407, 0.8196079, 0, 1, 1,
0.8752869, 0.8949123, 1.020778, 0.8235294, 0, 1, 1,
0.8755007, 0.5327559, 1.939111, 0.8313726, 0, 1, 1,
0.8835248, -1.264484, 0.5836839, 0.8352941, 0, 1, 1,
0.8847773, 0.5551767, 1.798876, 0.8431373, 0, 1, 1,
0.8850554, -1.006581, 2.530935, 0.8470588, 0, 1, 1,
0.8921704, 0.3338601, 0.8874171, 0.854902, 0, 1, 1,
0.8943822, -0.9230578, 2.424219, 0.8588235, 0, 1, 1,
0.9000242, 0.7652894, 0.3778646, 0.8666667, 0, 1, 1,
0.9002552, -0.005573093, 1.683591, 0.8705882, 0, 1, 1,
0.9039031, 0.4275521, 0.5952641, 0.8784314, 0, 1, 1,
0.9082971, 0.991016, 1.376073, 0.8823529, 0, 1, 1,
0.9108911, -0.08582539, 0.3132921, 0.8901961, 0, 1, 1,
0.9141497, 2.051618, -0.04703477, 0.8941177, 0, 1, 1,
0.9163398, 0.1202464, 3.286277, 0.9019608, 0, 1, 1,
0.916826, -3.300321, 2.66386, 0.9098039, 0, 1, 1,
0.9170429, 1.906988, 1.501445, 0.9137255, 0, 1, 1,
0.9242731, -2.088348, 3.978762, 0.9215686, 0, 1, 1,
0.9270628, 1.446331, -1.189336, 0.9254902, 0, 1, 1,
0.9391884, -0.4416885, 2.19781, 0.9333333, 0, 1, 1,
0.9451789, -0.02380234, 1.798058, 0.9372549, 0, 1, 1,
0.94626, -0.6347216, 1.552388, 0.945098, 0, 1, 1,
0.9477672, -1.061809, 4.1401, 0.9490196, 0, 1, 1,
0.9522107, -0.2728238, 1.186294, 0.9568627, 0, 1, 1,
0.9574714, -0.6615515, 3.333819, 0.9607843, 0, 1, 1,
0.9661705, 0.3234804, 0.4918976, 0.9686275, 0, 1, 1,
0.9698772, 1.085608, 0.8993384, 0.972549, 0, 1, 1,
0.9701056, -0.5900601, 4.386675, 0.9803922, 0, 1, 1,
0.9725876, 0.3989113, 0.006870927, 0.9843137, 0, 1, 1,
0.9803142, -0.0568123, 2.812424, 0.9921569, 0, 1, 1,
0.980912, 1.421098, 0.9857092, 0.9960784, 0, 1, 1,
0.982223, -1.168358, 1.165846, 1, 0, 0.9960784, 1,
0.9885872, -0.1819118, 3.193601, 1, 0, 0.9882353, 1,
0.9986149, -0.3279468, 1.049006, 1, 0, 0.9843137, 1,
1.008302, -0.9983419, 2.795271, 1, 0, 0.9764706, 1,
1.013593, 1.124232, 0.8126904, 1, 0, 0.972549, 1,
1.017525, 1.937446, 0.8062665, 1, 0, 0.9647059, 1,
1.020596, -0.7494982, 1.819204, 1, 0, 0.9607843, 1,
1.02276, -0.6945894, 1.206499, 1, 0, 0.9529412, 1,
1.024148, 1.139476, 2.128765, 1, 0, 0.9490196, 1,
1.025054, 0.6491359, -0.6462836, 1, 0, 0.9411765, 1,
1.026915, 0.4291082, -0.3096109, 1, 0, 0.9372549, 1,
1.031786, -2.591256, 2.581115, 1, 0, 0.9294118, 1,
1.032743, 0.2226495, 2.00774, 1, 0, 0.9254902, 1,
1.033928, -0.08362164, 1.873838, 1, 0, 0.9176471, 1,
1.042081, -1.049631, 2.065092, 1, 0, 0.9137255, 1,
1.0449, -0.3422848, 1.501792, 1, 0, 0.9058824, 1,
1.046481, 0.1830395, 1.291379, 1, 0, 0.9019608, 1,
1.050995, -0.318316, 0.9086359, 1, 0, 0.8941177, 1,
1.052723, -0.01514604, 0.7329441, 1, 0, 0.8862745, 1,
1.060448, -0.4274153, 2.576975, 1, 0, 0.8823529, 1,
1.071992, -0.8015579, 3.091865, 1, 0, 0.8745098, 1,
1.073527, 0.8113934, 1.533234, 1, 0, 0.8705882, 1,
1.076513, -0.2135263, 1.614427, 1, 0, 0.8627451, 1,
1.078131, -0.4018736, 2.031079, 1, 0, 0.8588235, 1,
1.07959, 1.458647, 0.9594893, 1, 0, 0.8509804, 1,
1.090687, -1.258257, 3.204829, 1, 0, 0.8470588, 1,
1.093713, -1.195298, 1.243561, 1, 0, 0.8392157, 1,
1.094854, -0.7300479, 1.78113, 1, 0, 0.8352941, 1,
1.094947, 0.09206988, 2.490542, 1, 0, 0.827451, 1,
1.096253, 0.5508945, 0.8876225, 1, 0, 0.8235294, 1,
1.118036, 0.62378, 0.8579923, 1, 0, 0.8156863, 1,
1.133771, 0.922322, 2.74283, 1, 0, 0.8117647, 1,
1.13731, -0.9770001, 2.418012, 1, 0, 0.8039216, 1,
1.147396, 0.7341057, 1.464913, 1, 0, 0.7960784, 1,
1.151684, 1.092727, 1.620344, 1, 0, 0.7921569, 1,
1.153032, -0.09982219, 3.475865, 1, 0, 0.7843137, 1,
1.156153, -0.5622627, 1.607066, 1, 0, 0.7803922, 1,
1.157039, 0.4252753, -0.2077537, 1, 0, 0.772549, 1,
1.171253, 0.2008671, 2.327864, 1, 0, 0.7686275, 1,
1.175076, 0.3244115, 0.008241816, 1, 0, 0.7607843, 1,
1.175172, -0.4600105, 2.53949, 1, 0, 0.7568628, 1,
1.182632, 0.07136521, 0.4640341, 1, 0, 0.7490196, 1,
1.196477, -1.240534, 3.011735, 1, 0, 0.7450981, 1,
1.197876, 0.4486714, -0.6385145, 1, 0, 0.7372549, 1,
1.19872, -0.8408255, 2.943244, 1, 0, 0.7333333, 1,
1.200136, 1.029577, 0.7961281, 1, 0, 0.7254902, 1,
1.202176, 0.803234, 0.4973237, 1, 0, 0.7215686, 1,
1.204273, 1.63977, -0.2068537, 1, 0, 0.7137255, 1,
1.206339, 0.23484, 0.7050008, 1, 0, 0.7098039, 1,
1.208869, 0.8656389, 1.68623, 1, 0, 0.7019608, 1,
1.213747, 0.006779453, 2.243161, 1, 0, 0.6941177, 1,
1.215083, 0.4623547, 1.382764, 1, 0, 0.6901961, 1,
1.216974, -0.01779983, 0.4224451, 1, 0, 0.682353, 1,
1.230601, -0.2205386, 1.012731, 1, 0, 0.6784314, 1,
1.233102, 0.4763258, 1.724479, 1, 0, 0.6705883, 1,
1.238913, 2.993222, -0.01012336, 1, 0, 0.6666667, 1,
1.241213, 0.4675393, 1.792462, 1, 0, 0.6588235, 1,
1.260666, 1.058802, 0.3474923, 1, 0, 0.654902, 1,
1.261014, -0.2649994, 1.456115, 1, 0, 0.6470588, 1,
1.2617, -0.4571334, -0.0592474, 1, 0, 0.6431373, 1,
1.262722, 0.9391065, 0.9042027, 1, 0, 0.6352941, 1,
1.273134, -0.8085624, 1.437317, 1, 0, 0.6313726, 1,
1.277486, -0.4202912, 2.04108, 1, 0, 0.6235294, 1,
1.280337, 0.2562261, 2.761605, 1, 0, 0.6196079, 1,
1.285976, -0.6743826, 1.792904, 1, 0, 0.6117647, 1,
1.287014, 0.4791589, 0.3724773, 1, 0, 0.6078432, 1,
1.298892, -1.059011, 0.4551566, 1, 0, 0.6, 1,
1.302249, -0.8417397, 2.456553, 1, 0, 0.5921569, 1,
1.309894, -0.2740474, 3.093488, 1, 0, 0.5882353, 1,
1.316949, 0.437295, 2.304959, 1, 0, 0.5803922, 1,
1.322172, -0.7577438, 2.369915, 1, 0, 0.5764706, 1,
1.324663, -1.128903, 2.281869, 1, 0, 0.5686275, 1,
1.326787, 0.3720643, -1.202226, 1, 0, 0.5647059, 1,
1.331577, -0.3968995, 1.931848, 1, 0, 0.5568628, 1,
1.332515, 0.02851902, 1.031874, 1, 0, 0.5529412, 1,
1.335785, 1.49784, 2.552302, 1, 0, 0.5450981, 1,
1.337494, -0.2888297, 0.6061502, 1, 0, 0.5411765, 1,
1.337534, 0.2494003, -0.5462878, 1, 0, 0.5333334, 1,
1.339586, 0.04252471, 1.50528, 1, 0, 0.5294118, 1,
1.345969, 1.20309, 2.217255, 1, 0, 0.5215687, 1,
1.346267, 2.425815, 1.523769, 1, 0, 0.5176471, 1,
1.347013, -0.07333273, 0.7565091, 1, 0, 0.509804, 1,
1.350976, -0.437708, 1.452907, 1, 0, 0.5058824, 1,
1.364058, 0.1785184, 0.6786189, 1, 0, 0.4980392, 1,
1.367835, 2.076609, 0.2770784, 1, 0, 0.4901961, 1,
1.373301, 0.8213365, 2.014121, 1, 0, 0.4862745, 1,
1.393997, -0.86448, 1.086569, 1, 0, 0.4784314, 1,
1.396857, -1.868614, -0.4134024, 1, 0, 0.4745098, 1,
1.397677, 0.6090596, 1.750231, 1, 0, 0.4666667, 1,
1.400954, 0.7704693, 1.21008, 1, 0, 0.4627451, 1,
1.405342, -0.7877312, 0.7580857, 1, 0, 0.454902, 1,
1.416087, -0.602832, 1.691354, 1, 0, 0.4509804, 1,
1.417966, -1.517058, -0.3111163, 1, 0, 0.4431373, 1,
1.420399, -2.079973, 2.283323, 1, 0, 0.4392157, 1,
1.428793, 0.1246118, 1.536052, 1, 0, 0.4313726, 1,
1.431071, 0.1543355, 1.011215, 1, 0, 0.427451, 1,
1.438076, 1.156566, -0.03608595, 1, 0, 0.4196078, 1,
1.440015, 1.014578, 1.345432, 1, 0, 0.4156863, 1,
1.444941, 0.3042679, -0.05731869, 1, 0, 0.4078431, 1,
1.447635, 0.9463012, -0.4288551, 1, 0, 0.4039216, 1,
1.456153, 0.9020206, 1.56185, 1, 0, 0.3960784, 1,
1.456505, -0.790574, 3.025792, 1, 0, 0.3882353, 1,
1.457119, -0.2698824, 2.015223, 1, 0, 0.3843137, 1,
1.469419, 0.6634551, 1.405515, 1, 0, 0.3764706, 1,
1.481371, 0.2893273, 1.260931, 1, 0, 0.372549, 1,
1.491766, 0.1880355, -0.6780077, 1, 0, 0.3647059, 1,
1.496726, -0.4147334, 1.702973, 1, 0, 0.3607843, 1,
1.503654, -1.565849, 1.455684, 1, 0, 0.3529412, 1,
1.503849, -0.3565048, 0.8563128, 1, 0, 0.3490196, 1,
1.531801, -0.5799484, 3.787257, 1, 0, 0.3411765, 1,
1.541628, -0.6016037, 1.705502, 1, 0, 0.3372549, 1,
1.549625, 1.088022, 1.212178, 1, 0, 0.3294118, 1,
1.561999, -0.1732577, 1.235602, 1, 0, 0.3254902, 1,
1.566814, 0.3984175, 0.2041087, 1, 0, 0.3176471, 1,
1.57996, 0.05096281, 1.686521, 1, 0, 0.3137255, 1,
1.585842, -0.001488328, -0.9772159, 1, 0, 0.3058824, 1,
1.589146, 0.9193805, 0.9453216, 1, 0, 0.2980392, 1,
1.590878, 0.4656989, 2.089684, 1, 0, 0.2941177, 1,
1.615338, 1.158273, 0.8410352, 1, 0, 0.2862745, 1,
1.617734, 0.3499252, 1.772305, 1, 0, 0.282353, 1,
1.641444, -2.209648, 1.308231, 1, 0, 0.2745098, 1,
1.646003, 1.16261, 0.2267698, 1, 0, 0.2705882, 1,
1.654795, 1.077834, 0.8001438, 1, 0, 0.2627451, 1,
1.657881, -2.103709, 2.135757, 1, 0, 0.2588235, 1,
1.67591, 0.280988, 2.051414, 1, 0, 0.2509804, 1,
1.677114, 0.3457285, 1.528948, 1, 0, 0.2470588, 1,
1.680126, 0.2039517, -0.1244134, 1, 0, 0.2392157, 1,
1.700308, -0.2096315, 2.187104, 1, 0, 0.2352941, 1,
1.714307, -1.326076, 2.018736, 1, 0, 0.227451, 1,
1.735904, -0.4262212, 2.15196, 1, 0, 0.2235294, 1,
1.739596, 0.12113, 1.776124, 1, 0, 0.2156863, 1,
1.740915, 0.5981191, 1.033167, 1, 0, 0.2117647, 1,
1.74565, -0.1157795, 1.132519, 1, 0, 0.2039216, 1,
1.763049, 1.490044, 1.410963, 1, 0, 0.1960784, 1,
1.782018, -0.1766198, 2.278098, 1, 0, 0.1921569, 1,
1.785589, -0.8666416, 2.688022, 1, 0, 0.1843137, 1,
1.825204, -0.4152129, 3.913014, 1, 0, 0.1803922, 1,
1.832383, 0.8414769, 2.59664, 1, 0, 0.172549, 1,
1.836241, -0.8454025, 2.207846, 1, 0, 0.1686275, 1,
1.839498, 0.2895545, 2.562028, 1, 0, 0.1607843, 1,
1.853691, 0.8349789, 0.6650167, 1, 0, 0.1568628, 1,
1.858109, -0.7391011, 1.72058, 1, 0, 0.1490196, 1,
1.86487, 0.9499844, 1.707179, 1, 0, 0.145098, 1,
1.866627, -0.08217563, 2.19471, 1, 0, 0.1372549, 1,
1.876272, -1.296998, 2.370225, 1, 0, 0.1333333, 1,
1.88721, -0.9100024, 1.496487, 1, 0, 0.1254902, 1,
1.889333, -0.6560509, 2.510441, 1, 0, 0.1215686, 1,
1.908143, -1.336388, -0.2849406, 1, 0, 0.1137255, 1,
1.918073, -0.5841879, 3.773732, 1, 0, 0.1098039, 1,
1.9466, -1.410804, 1.357942, 1, 0, 0.1019608, 1,
1.948075, -1.202723, 1.490047, 1, 0, 0.09411765, 1,
1.952359, -1.514131, 1.494066, 1, 0, 0.09019608, 1,
2.012618, -0.836151, 1.946696, 1, 0, 0.08235294, 1,
2.024159, -1.010738, 1.167915, 1, 0, 0.07843138, 1,
2.056572, -1.177067, 3.188654, 1, 0, 0.07058824, 1,
2.190121, 0.612285, 1.705449, 1, 0, 0.06666667, 1,
2.204906, -0.792454, 1.883785, 1, 0, 0.05882353, 1,
2.283109, -1.014059, 1.203392, 1, 0, 0.05490196, 1,
2.386417, 1.574803, 0.9306632, 1, 0, 0.04705882, 1,
2.429909, 0.200886, 1.778538, 1, 0, 0.04313726, 1,
2.466416, 0.09089562, 3.656217, 1, 0, 0.03529412, 1,
2.485795, -1.563158, 1.836449, 1, 0, 0.03137255, 1,
2.533819, -0.4256386, 1.489262, 1, 0, 0.02352941, 1,
2.714344, -0.368042, 1.908799, 1, 0, 0.01960784, 1,
2.735166, -1.984051, 1.738707, 1, 0, 0.01176471, 1,
2.82318, -0.4624444, -0.4117188, 1, 0, 0.007843138, 1
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
-0.1508436, -4.906516, -7.223504, 0, -0.5, 0.5, 0.5,
-0.1508436, -4.906516, -7.223504, 1, -0.5, 0.5, 0.5,
-0.1508436, -4.906516, -7.223504, 1, 1.5, 0.5, 0.5,
-0.1508436, -4.906516, -7.223504, 0, 1.5, 0.5, 0.5
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
-4.133061, -0.3292154, -7.223504, 0, -0.5, 0.5, 0.5,
-4.133061, -0.3292154, -7.223504, 1, -0.5, 0.5, 0.5,
-4.133061, -0.3292154, -7.223504, 1, 1.5, 0.5, 0.5,
-4.133061, -0.3292154, -7.223504, 0, 1.5, 0.5, 0.5
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
-4.133061, -4.906516, -0.1015391, 0, -0.5, 0.5, 0.5,
-4.133061, -4.906516, -0.1015391, 1, -0.5, 0.5, 0.5,
-4.133061, -4.906516, -0.1015391, 1, 1.5, 0.5, 0.5,
-4.133061, -4.906516, -0.1015391, 0, 1.5, 0.5, 0.5
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
-3, -3.850215, -5.579973,
2, -3.850215, -5.579973,
-3, -3.850215, -5.579973,
-3, -4.026266, -5.853895,
-2, -3.850215, -5.579973,
-2, -4.026266, -5.853895,
-1, -3.850215, -5.579973,
-1, -4.026266, -5.853895,
0, -3.850215, -5.579973,
0, -4.026266, -5.853895,
1, -3.850215, -5.579973,
1, -4.026266, -5.853895,
2, -3.850215, -5.579973,
2, -4.026266, -5.853895
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
-3, -4.378366, -6.401739, 0, -0.5, 0.5, 0.5,
-3, -4.378366, -6.401739, 1, -0.5, 0.5, 0.5,
-3, -4.378366, -6.401739, 1, 1.5, 0.5, 0.5,
-3, -4.378366, -6.401739, 0, 1.5, 0.5, 0.5,
-2, -4.378366, -6.401739, 0, -0.5, 0.5, 0.5,
-2, -4.378366, -6.401739, 1, -0.5, 0.5, 0.5,
-2, -4.378366, -6.401739, 1, 1.5, 0.5, 0.5,
-2, -4.378366, -6.401739, 0, 1.5, 0.5, 0.5,
-1, -4.378366, -6.401739, 0, -0.5, 0.5, 0.5,
-1, -4.378366, -6.401739, 1, -0.5, 0.5, 0.5,
-1, -4.378366, -6.401739, 1, 1.5, 0.5, 0.5,
-1, -4.378366, -6.401739, 0, 1.5, 0.5, 0.5,
0, -4.378366, -6.401739, 0, -0.5, 0.5, 0.5,
0, -4.378366, -6.401739, 1, -0.5, 0.5, 0.5,
0, -4.378366, -6.401739, 1, 1.5, 0.5, 0.5,
0, -4.378366, -6.401739, 0, 1.5, 0.5, 0.5,
1, -4.378366, -6.401739, 0, -0.5, 0.5, 0.5,
1, -4.378366, -6.401739, 1, -0.5, 0.5, 0.5,
1, -4.378366, -6.401739, 1, 1.5, 0.5, 0.5,
1, -4.378366, -6.401739, 0, 1.5, 0.5, 0.5,
2, -4.378366, -6.401739, 0, -0.5, 0.5, 0.5,
2, -4.378366, -6.401739, 1, -0.5, 0.5, 0.5,
2, -4.378366, -6.401739, 1, 1.5, 0.5, 0.5,
2, -4.378366, -6.401739, 0, 1.5, 0.5, 0.5
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
-3.214088, -3, -5.579973,
-3.214088, 3, -5.579973,
-3.214088, -3, -5.579973,
-3.36725, -3, -5.853895,
-3.214088, -2, -5.579973,
-3.36725, -2, -5.853895,
-3.214088, -1, -5.579973,
-3.36725, -1, -5.853895,
-3.214088, 0, -5.579973,
-3.36725, 0, -5.853895,
-3.214088, 1, -5.579973,
-3.36725, 1, -5.853895,
-3.214088, 2, -5.579973,
-3.36725, 2, -5.853895,
-3.214088, 3, -5.579973,
-3.36725, 3, -5.853895
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
-3.673574, -3, -6.401739, 0, -0.5, 0.5, 0.5,
-3.673574, -3, -6.401739, 1, -0.5, 0.5, 0.5,
-3.673574, -3, -6.401739, 1, 1.5, 0.5, 0.5,
-3.673574, -3, -6.401739, 0, 1.5, 0.5, 0.5,
-3.673574, -2, -6.401739, 0, -0.5, 0.5, 0.5,
-3.673574, -2, -6.401739, 1, -0.5, 0.5, 0.5,
-3.673574, -2, -6.401739, 1, 1.5, 0.5, 0.5,
-3.673574, -2, -6.401739, 0, 1.5, 0.5, 0.5,
-3.673574, -1, -6.401739, 0, -0.5, 0.5, 0.5,
-3.673574, -1, -6.401739, 1, -0.5, 0.5, 0.5,
-3.673574, -1, -6.401739, 1, 1.5, 0.5, 0.5,
-3.673574, -1, -6.401739, 0, 1.5, 0.5, 0.5,
-3.673574, 0, -6.401739, 0, -0.5, 0.5, 0.5,
-3.673574, 0, -6.401739, 1, -0.5, 0.5, 0.5,
-3.673574, 0, -6.401739, 1, 1.5, 0.5, 0.5,
-3.673574, 0, -6.401739, 0, 1.5, 0.5, 0.5,
-3.673574, 1, -6.401739, 0, -0.5, 0.5, 0.5,
-3.673574, 1, -6.401739, 1, -0.5, 0.5, 0.5,
-3.673574, 1, -6.401739, 1, 1.5, 0.5, 0.5,
-3.673574, 1, -6.401739, 0, 1.5, 0.5, 0.5,
-3.673574, 2, -6.401739, 0, -0.5, 0.5, 0.5,
-3.673574, 2, -6.401739, 1, -0.5, 0.5, 0.5,
-3.673574, 2, -6.401739, 1, 1.5, 0.5, 0.5,
-3.673574, 2, -6.401739, 0, 1.5, 0.5, 0.5,
-3.673574, 3, -6.401739, 0, -0.5, 0.5, 0.5,
-3.673574, 3, -6.401739, 1, -0.5, 0.5, 0.5,
-3.673574, 3, -6.401739, 1, 1.5, 0.5, 0.5,
-3.673574, 3, -6.401739, 0, 1.5, 0.5, 0.5
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
-3.214088, -3.850215, -4,
-3.214088, -3.850215, 4,
-3.214088, -3.850215, -4,
-3.36725, -4.026266, -4,
-3.214088, -3.850215, -2,
-3.36725, -4.026266, -2,
-3.214088, -3.850215, 0,
-3.36725, -4.026266, 0,
-3.214088, -3.850215, 2,
-3.36725, -4.026266, 2,
-3.214088, -3.850215, 4,
-3.36725, -4.026266, 4
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
-3.673574, -4.378366, -4, 0, -0.5, 0.5, 0.5,
-3.673574, -4.378366, -4, 1, -0.5, 0.5, 0.5,
-3.673574, -4.378366, -4, 1, 1.5, 0.5, 0.5,
-3.673574, -4.378366, -4, 0, 1.5, 0.5, 0.5,
-3.673574, -4.378366, -2, 0, -0.5, 0.5, 0.5,
-3.673574, -4.378366, -2, 1, -0.5, 0.5, 0.5,
-3.673574, -4.378366, -2, 1, 1.5, 0.5, 0.5,
-3.673574, -4.378366, -2, 0, 1.5, 0.5, 0.5,
-3.673574, -4.378366, 0, 0, -0.5, 0.5, 0.5,
-3.673574, -4.378366, 0, 1, -0.5, 0.5, 0.5,
-3.673574, -4.378366, 0, 1, 1.5, 0.5, 0.5,
-3.673574, -4.378366, 0, 0, 1.5, 0.5, 0.5,
-3.673574, -4.378366, 2, 0, -0.5, 0.5, 0.5,
-3.673574, -4.378366, 2, 1, -0.5, 0.5, 0.5,
-3.673574, -4.378366, 2, 1, 1.5, 0.5, 0.5,
-3.673574, -4.378366, 2, 0, 1.5, 0.5, 0.5,
-3.673574, -4.378366, 4, 0, -0.5, 0.5, 0.5,
-3.673574, -4.378366, 4, 1, -0.5, 0.5, 0.5,
-3.673574, -4.378366, 4, 1, 1.5, 0.5, 0.5,
-3.673574, -4.378366, 4, 0, 1.5, 0.5, 0.5
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
-3.214088, -3.850215, -5.579973,
-3.214088, 3.191785, -5.579973,
-3.214088, -3.850215, 5.376895,
-3.214088, 3.191785, 5.376895,
-3.214088, -3.850215, -5.579973,
-3.214088, -3.850215, 5.376895,
-3.214088, 3.191785, -5.579973,
-3.214088, 3.191785, 5.376895,
-3.214088, -3.850215, -5.579973,
2.9124, -3.850215, -5.579973,
-3.214088, -3.850215, 5.376895,
2.9124, -3.850215, 5.376895,
-3.214088, 3.191785, -5.579973,
2.9124, 3.191785, -5.579973,
-3.214088, 3.191785, 5.376895,
2.9124, 3.191785, 5.376895,
2.9124, -3.850215, -5.579973,
2.9124, 3.191785, -5.579973,
2.9124, -3.850215, 5.376895,
2.9124, 3.191785, 5.376895,
2.9124, -3.850215, -5.579973,
2.9124, -3.850215, 5.376895,
2.9124, 3.191785, -5.579973,
2.9124, 3.191785, 5.376895
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
var radius = 7.685919;
var distance = 34.19552;
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
mvMatrix.translate( 0.1508436, 0.3292154, 0.1015391 );
mvMatrix.scale( 1.356432, 1.180086, 0.7584435 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.19552);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
succinic_acid<-read.table("succinic_acid.xyz")
```

```
## Error in read.table("succinic_acid.xyz"): no lines available in input
```

```r
x<-succinic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'succinic_acid' not found
```

```r
y<-succinic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'succinic_acid' not found
```

```r
z<-succinic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'succinic_acid' not found
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
-3.124867, 0.002914448, -2.74534, 0, 0, 1, 1, 1,
-2.985582, 0.5573956, -2.130853, 1, 0, 0, 1, 1,
-2.892414, -1.210766, -0.9908873, 1, 0, 0, 1, 1,
-2.686426, -0.5598752, -2.182174, 1, 0, 0, 1, 1,
-2.603631, -0.6881462, -3.549031, 1, 0, 0, 1, 1,
-2.596836, -0.03792783, -2.526206, 1, 0, 0, 1, 1,
-2.533642, 0.9859638, -0.945226, 0, 0, 0, 1, 1,
-2.531652, 0.7837332, -1.851011, 0, 0, 0, 1, 1,
-2.490236, 0.5701096, -2.640565, 0, 0, 0, 1, 1,
-2.394258, -1.188816, -3.276948, 0, 0, 0, 1, 1,
-2.322026, -0.5793805, 0.08376604, 0, 0, 0, 1, 1,
-2.292347, -0.3776467, -1.957179, 0, 0, 0, 1, 1,
-2.226082, -1.824434, -3.075668, 0, 0, 0, 1, 1,
-2.202541, -0.06389497, -1.462624, 1, 1, 1, 1, 1,
-2.201735, 0.8284521, -2.280953, 1, 1, 1, 1, 1,
-2.189581, 0.5216267, -1.774479, 1, 1, 1, 1, 1,
-2.152803, 0.432229, -2.446643, 1, 1, 1, 1, 1,
-2.140486, -1.188248, -1.862687, 1, 1, 1, 1, 1,
-2.099454, -1.845131, -1.096727, 1, 1, 1, 1, 1,
-2.087657, -0.7476602, -2.175123, 1, 1, 1, 1, 1,
-2.057968, -0.4238844, -2.447544, 1, 1, 1, 1, 1,
-2.048369, 0.9618738, -1.680203, 1, 1, 1, 1, 1,
-2.046926, 1.377745, -1.672233, 1, 1, 1, 1, 1,
-2.039015, 0.5799774, -1.703668, 1, 1, 1, 1, 1,
-2.009274, -0.9829582, -1.059901, 1, 1, 1, 1, 1,
-1.969396, 0.02806649, -2.471556, 1, 1, 1, 1, 1,
-1.967549, 0.4127171, 1.578539, 1, 1, 1, 1, 1,
-1.950542, 0.3230328, -1.002202, 1, 1, 1, 1, 1,
-1.945876, 1.037205, -1.89516, 0, 0, 1, 1, 1,
-1.902732, -0.9328696, -2.979844, 1, 0, 0, 1, 1,
-1.893007, 0.109196, -1.998466, 1, 0, 0, 1, 1,
-1.891917, 1.846685, -1.273551, 1, 0, 0, 1, 1,
-1.842128, -0.7384039, -0.7571145, 1, 0, 0, 1, 1,
-1.817065, -0.8378711, -3.273536, 1, 0, 0, 1, 1,
-1.792807, 1.573472, -2.113031, 0, 0, 0, 1, 1,
-1.768034, -0.9592578, -2.32877, 0, 0, 0, 1, 1,
-1.761376, -0.2717092, -5.055473, 0, 0, 0, 1, 1,
-1.759293, -0.6342627, -2.538642, 0, 0, 0, 1, 1,
-1.752957, -2.393465, -2.080775, 0, 0, 0, 1, 1,
-1.750556, 0.7609202, 0.2119582, 0, 0, 0, 1, 1,
-1.750054, 1.200769, -0.5353882, 0, 0, 0, 1, 1,
-1.693981, 0.2082844, -2.180047, 1, 1, 1, 1, 1,
-1.687664, -0.1204857, -2.630757, 1, 1, 1, 1, 1,
-1.687519, 0.3041576, -1.262022, 1, 1, 1, 1, 1,
-1.656556, 0.2384055, -2.083279, 1, 1, 1, 1, 1,
-1.625821, -0.7907528, -1.278731, 1, 1, 1, 1, 1,
-1.622491, 1.512987, 0.09622867, 1, 1, 1, 1, 1,
-1.613536, 1.989653, -1.226224, 1, 1, 1, 1, 1,
-1.611942, -0.1103101, -0.8853723, 1, 1, 1, 1, 1,
-1.606103, -1.371117, -2.729947, 1, 1, 1, 1, 1,
-1.604535, 1.479279, -1.010035, 1, 1, 1, 1, 1,
-1.598026, 0.7259943, 0.5138763, 1, 1, 1, 1, 1,
-1.587794, -1.02064, -2.462371, 1, 1, 1, 1, 1,
-1.558507, -1.493209, -1.679734, 1, 1, 1, 1, 1,
-1.553995, 0.3096919, -0.4438116, 1, 1, 1, 1, 1,
-1.552277, 1.818855, -3.605434, 1, 1, 1, 1, 1,
-1.549107, 1.164098, -0.6666689, 0, 0, 1, 1, 1,
-1.54892, -1.17733, -3.574422, 1, 0, 0, 1, 1,
-1.540236, -0.5588043, -1.717276, 1, 0, 0, 1, 1,
-1.531169, -0.1591124, -2.616781, 1, 0, 0, 1, 1,
-1.524267, -0.04814577, -1.617634, 1, 0, 0, 1, 1,
-1.517675, 0.4875648, 0.7138246, 1, 0, 0, 1, 1,
-1.514735, -1.883308, -1.214466, 0, 0, 0, 1, 1,
-1.513878, 0.5768986, -2.186314, 0, 0, 0, 1, 1,
-1.479971, -0.5417258, -2.675872, 0, 0, 0, 1, 1,
-1.475224, 1.587126, -0.9739937, 0, 0, 0, 1, 1,
-1.466979, 1.324696, -0.1916204, 0, 0, 0, 1, 1,
-1.46322, 0.3326737, -2.692431, 0, 0, 0, 1, 1,
-1.460993, 0.5678014, -0.184735, 0, 0, 0, 1, 1,
-1.460614, 0.5374898, -1.39286, 1, 1, 1, 1, 1,
-1.455014, -0.5018595, -0.6048104, 1, 1, 1, 1, 1,
-1.429364, 0.5824411, 0.4551163, 1, 1, 1, 1, 1,
-1.425449, 0.1761611, -0.2019706, 1, 1, 1, 1, 1,
-1.420714, 0.5947046, -1.594638, 1, 1, 1, 1, 1,
-1.413648, -0.5707514, -3.482574, 1, 1, 1, 1, 1,
-1.387929, 0.3168648, -0.7634205, 1, 1, 1, 1, 1,
-1.385833, 0.8993759, -2.220441, 1, 1, 1, 1, 1,
-1.385239, -0.2592863, -2.330828, 1, 1, 1, 1, 1,
-1.370545, -2.073619, -1.669946, 1, 1, 1, 1, 1,
-1.364012, -0.5389304, -1.024423, 1, 1, 1, 1, 1,
-1.328939, -0.4759686, -0.8857862, 1, 1, 1, 1, 1,
-1.322484, 1.148895, -2.136477, 1, 1, 1, 1, 1,
-1.317868, 0.6298952, 0.4597534, 1, 1, 1, 1, 1,
-1.309314, 0.5809985, -0.3438748, 1, 1, 1, 1, 1,
-1.308171, -1.097657, -3.297047, 0, 0, 1, 1, 1,
-1.305319, -0.1064301, -0.7100258, 1, 0, 0, 1, 1,
-1.301338, 0.1391374, -1.239203, 1, 0, 0, 1, 1,
-1.297888, -0.5680711, -3.992974, 1, 0, 0, 1, 1,
-1.296894, -1.600733, -2.76125, 1, 0, 0, 1, 1,
-1.29417, 0.6133848, 0.3916691, 1, 0, 0, 1, 1,
-1.293406, 1.194175, -1.788808, 0, 0, 0, 1, 1,
-1.290671, 0.7444507, -0.9901088, 0, 0, 0, 1, 1,
-1.288164, 0.7102149, -0.7572876, 0, 0, 0, 1, 1,
-1.278012, -0.8608536, -2.650159, 0, 0, 0, 1, 1,
-1.277335, 1.04879, -1.242185, 0, 0, 0, 1, 1,
-1.272852, 1.029182, -2.524484, 0, 0, 0, 1, 1,
-1.263958, 1.745394, -1.119924, 0, 0, 0, 1, 1,
-1.263805, 0.009624555, -0.4258935, 1, 1, 1, 1, 1,
-1.263788, -1.795866, -1.197988, 1, 1, 1, 1, 1,
-1.26073, -0.2134335, -2.643747, 1, 1, 1, 1, 1,
-1.259815, -0.4553606, -1.951542, 1, 1, 1, 1, 1,
-1.256675, 0.7458951, -2.036967, 1, 1, 1, 1, 1,
-1.242389, -0.5681998, -0.5082767, 1, 1, 1, 1, 1,
-1.241686, 1.671426, -0.9677417, 1, 1, 1, 1, 1,
-1.240896, -0.3155397, -1.931186, 1, 1, 1, 1, 1,
-1.240254, 0.4719554, -1.399918, 1, 1, 1, 1, 1,
-1.239536, -0.01062397, -2.022006, 1, 1, 1, 1, 1,
-1.231211, -0.4990115, -2.900518, 1, 1, 1, 1, 1,
-1.230608, -1.148239, -0.5942724, 1, 1, 1, 1, 1,
-1.227251, 0.8044257, -0.9268876, 1, 1, 1, 1, 1,
-1.225715, 0.7819625, 0.1319076, 1, 1, 1, 1, 1,
-1.225308, -0.4459375, -3.022791, 1, 1, 1, 1, 1,
-1.219839, 0.8686711, -1.104028, 0, 0, 1, 1, 1,
-1.21886, -0.9721311, -2.617331, 1, 0, 0, 1, 1,
-1.196949, -0.07022712, -2.938743, 1, 0, 0, 1, 1,
-1.188012, 0.4071079, -1.081314, 1, 0, 0, 1, 1,
-1.179543, -1.396706, -3.011574, 1, 0, 0, 1, 1,
-1.179479, 2.032444, 0.316167, 1, 0, 0, 1, 1,
-1.174509, -1.50148, -2.05513, 0, 0, 0, 1, 1,
-1.173966, 0.5503533, 1.010551, 0, 0, 0, 1, 1,
-1.173955, 0.07643623, -0.07359534, 0, 0, 0, 1, 1,
-1.170594, -0.1407242, -2.354012, 0, 0, 0, 1, 1,
-1.157861, 1.75494, -1.252351, 0, 0, 0, 1, 1,
-1.154369, 0.6660134, -1.599471, 0, 0, 0, 1, 1,
-1.149491, 0.1185678, -1.578402, 0, 0, 0, 1, 1,
-1.148731, 2.319637, -0.1476194, 1, 1, 1, 1, 1,
-1.142304, -0.1294355, -0.9681641, 1, 1, 1, 1, 1,
-1.133543, -0.4107002, -3.062466, 1, 1, 1, 1, 1,
-1.129797, 0.1012063, -0.7572579, 1, 1, 1, 1, 1,
-1.124615, 0.8913924, 0.01958318, 1, 1, 1, 1, 1,
-1.118249, 0.7184628, -1.43975, 1, 1, 1, 1, 1,
-1.115217, 0.8721272, 0.7644814, 1, 1, 1, 1, 1,
-1.106792, -1.239386, -1.934038, 1, 1, 1, 1, 1,
-1.106755, 1.031779, -1.796554, 1, 1, 1, 1, 1,
-1.093695, 0.315478, -1.074251, 1, 1, 1, 1, 1,
-1.091284, -0.4639112, -0.7493805, 1, 1, 1, 1, 1,
-1.087442, 0.1157649, -1.323509, 1, 1, 1, 1, 1,
-1.08297, -0.6860659, -1.907948, 1, 1, 1, 1, 1,
-1.081494, 0.419812, -0.8975307, 1, 1, 1, 1, 1,
-1.0786, -0.3326108, -3.493693, 1, 1, 1, 1, 1,
-1.059847, 1.464921, 0.0821078, 0, 0, 1, 1, 1,
-1.058413, 0.390267, -1.875173, 1, 0, 0, 1, 1,
-1.055043, 0.3155599, -0.001866031, 1, 0, 0, 1, 1,
-1.052326, 0.905362, -1.275092, 1, 0, 0, 1, 1,
-1.048419, 0.003317309, -1.081862, 1, 0, 0, 1, 1,
-1.045952, -2.203824, -3.084738, 1, 0, 0, 1, 1,
-1.043221, -1.113468, -1.486797, 0, 0, 0, 1, 1,
-1.04298, -0.8369036, -2.004062, 0, 0, 0, 1, 1,
-1.038908, -0.6544256, -1.939357, 0, 0, 0, 1, 1,
-1.037576, -0.9089246, -1.01097, 0, 0, 0, 1, 1,
-1.033138, 0.19603, -1.53895, 0, 0, 0, 1, 1,
-1.031386, 0.5807328, -1.141575, 0, 0, 0, 1, 1,
-1.030844, 0.7514156, -0.1903057, 0, 0, 0, 1, 1,
-1.029162, -1.003544, -0.7593569, 1, 1, 1, 1, 1,
-1.025177, -0.4523194, -2.310019, 1, 1, 1, 1, 1,
-1.024469, 0.3060965, -0.7597399, 1, 1, 1, 1, 1,
-1.007095, 0.3966177, -0.2063255, 1, 1, 1, 1, 1,
-1.001325, -0.4084984, -2.47548, 1, 1, 1, 1, 1,
-1.00075, -0.7121461, -2.861137, 1, 1, 1, 1, 1,
-1.000679, 1.613241, -2.193384, 1, 1, 1, 1, 1,
-1.000035, 0.1917822, -1.467682, 1, 1, 1, 1, 1,
-0.9999041, 0.7399116, 0.8501248, 1, 1, 1, 1, 1,
-0.9984438, 0.7141215, -0.9568764, 1, 1, 1, 1, 1,
-0.9965019, -0.2149853, -0.01507324, 1, 1, 1, 1, 1,
-0.9892405, -0.7463603, -1.600462, 1, 1, 1, 1, 1,
-0.9828501, 0.5833455, 0.00612396, 1, 1, 1, 1, 1,
-0.9824318, -0.3945248, -1.446776, 1, 1, 1, 1, 1,
-0.9823455, -1.164798, -1.954213, 1, 1, 1, 1, 1,
-0.980926, -0.01559218, -1.899219, 0, 0, 1, 1, 1,
-0.979937, 0.7526577, -0.1178858, 1, 0, 0, 1, 1,
-0.9799054, 0.2537292, -1.572152, 1, 0, 0, 1, 1,
-0.9787473, 1.625557, -0.05164949, 1, 0, 0, 1, 1,
-0.9698317, 0.3108629, -1.760509, 1, 0, 0, 1, 1,
-0.9674276, 0.674591, -0.3834876, 1, 0, 0, 1, 1,
-0.9586846, 0.1320929, -0.9810425, 0, 0, 0, 1, 1,
-0.9489079, 0.09286346, -1.439937, 0, 0, 0, 1, 1,
-0.9464676, -0.3084543, -2.290886, 0, 0, 0, 1, 1,
-0.9448177, -0.3393531, -1.210242, 0, 0, 0, 1, 1,
-0.9420844, -0.229698, -0.8689133, 0, 0, 0, 1, 1,
-0.9374501, 1.659368, -0.2423365, 0, 0, 0, 1, 1,
-0.9310029, 0.3842102, -0.9164381, 0, 0, 0, 1, 1,
-0.9240785, -0.341705, -2.31574, 1, 1, 1, 1, 1,
-0.9226682, -0.1160315, -2.168476, 1, 1, 1, 1, 1,
-0.9211689, 0.7181843, -1.145979, 1, 1, 1, 1, 1,
-0.9124361, -0.285597, -1.927782, 1, 1, 1, 1, 1,
-0.9119115, -0.3525511, -2.552203, 1, 1, 1, 1, 1,
-0.9081228, 0.0753867, -2.003736, 1, 1, 1, 1, 1,
-0.9051391, 1.911591, -2.787408, 1, 1, 1, 1, 1,
-0.9044736, -0.02757418, -1.829571, 1, 1, 1, 1, 1,
-0.8984393, -0.4846862, -3.584111, 1, 1, 1, 1, 1,
-0.8930321, -0.1130477, 0.07505911, 1, 1, 1, 1, 1,
-0.8881187, -0.4398103, -0.995744, 1, 1, 1, 1, 1,
-0.8845388, -0.2564163, -3.693091, 1, 1, 1, 1, 1,
-0.8828295, 0.3717468, 0.1310515, 1, 1, 1, 1, 1,
-0.8803846, 1.574779, -1.085495, 1, 1, 1, 1, 1,
-0.8774645, 0.183678, -3.223397, 1, 1, 1, 1, 1,
-0.875715, -0.2618147, -2.019553, 0, 0, 1, 1, 1,
-0.8750458, 0.3695561, 0.77094, 1, 0, 0, 1, 1,
-0.8727126, -1.092984, -2.51436, 1, 0, 0, 1, 1,
-0.8694106, -0.2436255, 0.04492303, 1, 0, 0, 1, 1,
-0.8692248, -0.9649619, -2.153954, 1, 0, 0, 1, 1,
-0.868165, -1.183174, -2.540917, 1, 0, 0, 1, 1,
-0.8616382, -1.30179, -0.9166579, 0, 0, 0, 1, 1,
-0.8572397, -0.7253695, -3.063902, 0, 0, 0, 1, 1,
-0.857208, -1.227241, -1.956798, 0, 0, 0, 1, 1,
-0.8549886, 1.179791, -0.3881352, 0, 0, 0, 1, 1,
-0.8531184, 0.3678282, -2.219186, 0, 0, 0, 1, 1,
-0.8484846, -0.538826, -3.484327, 0, 0, 0, 1, 1,
-0.8479413, -1.762332, -2.480894, 0, 0, 0, 1, 1,
-0.8400023, -0.7266294, -2.585981, 1, 1, 1, 1, 1,
-0.8374107, -0.2950407, -1.837332, 1, 1, 1, 1, 1,
-0.8336043, -0.5478679, -0.7395669, 1, 1, 1, 1, 1,
-0.832151, 0.4988756, -1.864692, 1, 1, 1, 1, 1,
-0.8299676, -0.4310902, -2.394385, 1, 1, 1, 1, 1,
-0.827699, -1.07099, -3.339246, 1, 1, 1, 1, 1,
-0.8243878, 0.2435444, -2.315105, 1, 1, 1, 1, 1,
-0.8218593, -1.051638, -1.936816, 1, 1, 1, 1, 1,
-0.8191408, -0.3109656, -3.620421, 1, 1, 1, 1, 1,
-0.8097448, -0.856442, -2.713264, 1, 1, 1, 1, 1,
-0.8090194, 1.124798, -1.393964, 1, 1, 1, 1, 1,
-0.807332, -0.07887549, -2.011714, 1, 1, 1, 1, 1,
-0.8036913, -0.3672543, -1.853467, 1, 1, 1, 1, 1,
-0.7994303, 1.488755, 1.44683, 1, 1, 1, 1, 1,
-0.7972363, 1.285328, -0.8514309, 1, 1, 1, 1, 1,
-0.7915695, 2.414397, -0.9797824, 0, 0, 1, 1, 1,
-0.7867383, 1.70992, -0.4099235, 1, 0, 0, 1, 1,
-0.7851469, -0.7733627, -2.323575, 1, 0, 0, 1, 1,
-0.7831636, -0.4314636, -2.990203, 1, 0, 0, 1, 1,
-0.772167, 0.4183178, 0.517723, 1, 0, 0, 1, 1,
-0.7713593, 0.6547288, 1.290158, 1, 0, 0, 1, 1,
-0.7707375, 0.1138713, 0.6747848, 0, 0, 0, 1, 1,
-0.7675706, -0.3616915, -3.104558, 0, 0, 0, 1, 1,
-0.7658542, -1.014327, -2.949507, 0, 0, 0, 1, 1,
-0.7643158, 0.1499007, 0.4117859, 0, 0, 0, 1, 1,
-0.7625262, 0.4571103, -0.252955, 0, 0, 0, 1, 1,
-0.7615454, -0.4779822, -2.403176, 0, 0, 0, 1, 1,
-0.7466406, 0.2145806, -0.8526695, 0, 0, 0, 1, 1,
-0.739665, 0.3916859, -1.439773, 1, 1, 1, 1, 1,
-0.7354801, -0.4606973, -3.998167, 1, 1, 1, 1, 1,
-0.734906, -0.3237962, -1.754112, 1, 1, 1, 1, 1,
-0.7341403, -0.8182565, -0.9676596, 1, 1, 1, 1, 1,
-0.7300081, 0.3665099, 0.3956324, 1, 1, 1, 1, 1,
-0.71152, -0.6705334, -0.9240287, 1, 1, 1, 1, 1,
-0.7099015, -0.9476212, -2.203068, 1, 1, 1, 1, 1,
-0.6972344, 0.1228275, -0.003537435, 1, 1, 1, 1, 1,
-0.6846197, 0.3027137, -0.7270159, 1, 1, 1, 1, 1,
-0.6834198, 0.2313967, -1.365654, 1, 1, 1, 1, 1,
-0.6773908, 0.4181485, -1.279821, 1, 1, 1, 1, 1,
-0.6637588, -0.2901848, -2.888365, 1, 1, 1, 1, 1,
-0.644128, 0.9724964, -0.7722741, 1, 1, 1, 1, 1,
-0.6416587, 0.3181005, -0.6485779, 1, 1, 1, 1, 1,
-0.6415559, 0.5967391, -0.5519106, 1, 1, 1, 1, 1,
-0.6369246, -1.267806, -1.379147, 0, 0, 1, 1, 1,
-0.6366301, 0.6489606, -2.125508, 1, 0, 0, 1, 1,
-0.6308044, 0.4514416, 0.3580736, 1, 0, 0, 1, 1,
-0.6302101, -0.1225332, -3.475026, 1, 0, 0, 1, 1,
-0.6239119, -0.3630617, -0.03635499, 1, 0, 0, 1, 1,
-0.6218577, -0.1363213, -0.5866206, 1, 0, 0, 1, 1,
-0.6143777, -0.330735, -3.887337, 0, 0, 0, 1, 1,
-0.6095822, -2.486246, -2.950368, 0, 0, 0, 1, 1,
-0.6072927, 0.7919536, -1.261281, 0, 0, 0, 1, 1,
-0.6042732, 0.06932843, -2.228211, 0, 0, 0, 1, 1,
-0.6023582, -1.871811, -2.903965, 0, 0, 0, 1, 1,
-0.597217, 1.025325, -0.2555569, 0, 0, 0, 1, 1,
-0.5960336, -0.04430785, -3.203181, 0, 0, 0, 1, 1,
-0.5947867, 0.6850433, -1.638986, 1, 1, 1, 1, 1,
-0.5946152, 0.552543, -1.130517, 1, 1, 1, 1, 1,
-0.5935952, 0.7309577, -1.459451, 1, 1, 1, 1, 1,
-0.5917567, 1.815579, -1.186534, 1, 1, 1, 1, 1,
-0.5885647, -0.7761189, -2.040902, 1, 1, 1, 1, 1,
-0.5856177, 0.06880649, -1.120275, 1, 1, 1, 1, 1,
-0.5855656, 0.7154801, -2.629918, 1, 1, 1, 1, 1,
-0.5836409, 1.284347, -0.6700936, 1, 1, 1, 1, 1,
-0.5811999, -0.1800318, -0.6257692, 1, 1, 1, 1, 1,
-0.5786937, 1.960834, -2.318194, 1, 1, 1, 1, 1,
-0.5770987, -0.7249119, -2.042598, 1, 1, 1, 1, 1,
-0.5754977, -0.9692699, -3.26561, 1, 1, 1, 1, 1,
-0.5740637, 0.1649945, -1.129225, 1, 1, 1, 1, 1,
-0.5728502, 1.059939, -1.216875, 1, 1, 1, 1, 1,
-0.571613, -0.4494192, -1.722145, 1, 1, 1, 1, 1,
-0.5694037, 0.1748116, -1.767586, 0, 0, 1, 1, 1,
-0.5683219, 0.3452122, -1.396253, 1, 0, 0, 1, 1,
-0.5609635, 1.711937, 0.3731453, 1, 0, 0, 1, 1,
-0.5600014, 0.006687643, -2.304841, 1, 0, 0, 1, 1,
-0.559717, 2.698838, 0.7538821, 1, 0, 0, 1, 1,
-0.5591415, -1.155923, -1.129402, 1, 0, 0, 1, 1,
-0.5562556, 0.928977, -0.7520656, 0, 0, 0, 1, 1,
-0.5526893, -0.08090304, 0.3809641, 0, 0, 0, 1, 1,
-0.5485016, -0.2892012, -0.4659927, 0, 0, 0, 1, 1,
-0.5476277, 0.1729951, -1.736183, 0, 0, 0, 1, 1,
-0.5473391, -1.521778, -3.78148, 0, 0, 0, 1, 1,
-0.5450739, -0.5042771, -2.266572, 0, 0, 0, 1, 1,
-0.5449511, -1.626625, -2.356361, 0, 0, 0, 1, 1,
-0.5441447, -0.9736351, -2.014291, 1, 1, 1, 1, 1,
-0.5440285, -0.04898277, -0.3976638, 1, 1, 1, 1, 1,
-0.5424196, -0.8023658, -1.491512, 1, 1, 1, 1, 1,
-0.5406167, -1.652728, -2.279126, 1, 1, 1, 1, 1,
-0.5388345, -0.4234593, -4.259786, 1, 1, 1, 1, 1,
-0.5388109, -0.7756354, -2.488051, 1, 1, 1, 1, 1,
-0.5354717, 1.593366, -0.9638745, 1, 1, 1, 1, 1,
-0.5336651, -0.1565286, -0.4392526, 1, 1, 1, 1, 1,
-0.5300884, 1.225997, -1.690587, 1, 1, 1, 1, 1,
-0.5266677, -0.9622904, -1.866888, 1, 1, 1, 1, 1,
-0.5216659, -2.066719, -2.699325, 1, 1, 1, 1, 1,
-0.5193774, -0.1911681, -0.4797076, 1, 1, 1, 1, 1,
-0.5185897, -0.434503, -4.045066, 1, 1, 1, 1, 1,
-0.5154096, 2.408227, 0.2785874, 1, 1, 1, 1, 1,
-0.5144439, 0.4697949, 0.7877696, 1, 1, 1, 1, 1,
-0.5100727, 0.6130443, -1.509853, 0, 0, 1, 1, 1,
-0.5076641, 1.082998, -0.007696255, 1, 0, 0, 1, 1,
-0.5057818, -1.112318, -3.346277, 1, 0, 0, 1, 1,
-0.5006338, -1.477023, -4.161202, 1, 0, 0, 1, 1,
-0.5005793, 0.9712837, -1.972289, 1, 0, 0, 1, 1,
-0.4998248, -0.7623705, -2.160483, 1, 0, 0, 1, 1,
-0.4989427, -0.1354144, -1.418178, 0, 0, 0, 1, 1,
-0.4975374, -0.1387687, -2.097584, 0, 0, 0, 1, 1,
-0.4969838, -0.7898046, -4.48333, 0, 0, 0, 1, 1,
-0.4967042, 0.1057064, -0.4850565, 0, 0, 0, 1, 1,
-0.4945965, -0.8505282, -4.599565, 0, 0, 0, 1, 1,
-0.4852703, -0.2070725, -1.200343, 0, 0, 0, 1, 1,
-0.483731, -0.5778328, -3.71761, 0, 0, 0, 1, 1,
-0.4822063, -0.572756, -1.522727, 1, 1, 1, 1, 1,
-0.4778226, 0.8110714, -0.1235747, 1, 1, 1, 1, 1,
-0.4770733, -2.460911, -2.294904, 1, 1, 1, 1, 1,
-0.4751919, 0.5386052, 0.7189685, 1, 1, 1, 1, 1,
-0.4746385, -0.3681611, -1.790632, 1, 1, 1, 1, 1,
-0.4734685, 0.5816844, -0.6555666, 1, 1, 1, 1, 1,
-0.4715405, 0.873283, -1.77947, 1, 1, 1, 1, 1,
-0.4633557, -0.2209049, -0.2154911, 1, 1, 1, 1, 1,
-0.4630063, 0.8170677, -0.8332524, 1, 1, 1, 1, 1,
-0.4481834, -1.039534, -1.772374, 1, 1, 1, 1, 1,
-0.4463398, 0.6605639, -1.640037, 1, 1, 1, 1, 1,
-0.4365892, 0.3057128, 0.2780125, 1, 1, 1, 1, 1,
-0.4331661, -2.187947, -4.875224, 1, 1, 1, 1, 1,
-0.4314709, 0.4415393, 0.2161586, 1, 1, 1, 1, 1,
-0.4188767, -0.5690179, -1.948945, 1, 1, 1, 1, 1,
-0.4181643, 0.8002343, -4.152843, 0, 0, 1, 1, 1,
-0.4153421, -0.5941265, -2.234895, 1, 0, 0, 1, 1,
-0.4128707, 0.5761327, -1.099375, 1, 0, 0, 1, 1,
-0.4120811, 0.1648928, -1.59409, 1, 0, 0, 1, 1,
-0.4115709, 0.2660498, 0.1728549, 1, 0, 0, 1, 1,
-0.4101619, -0.5333134, -2.614633, 1, 0, 0, 1, 1,
-0.4075708, -1.429631, -4.250439, 0, 0, 0, 1, 1,
-0.4066227, 1.051029, -0.7000123, 0, 0, 0, 1, 1,
-0.4035402, -1.035915, -4.180586, 0, 0, 0, 1, 1,
-0.4025534, -0.5665595, -2.097645, 0, 0, 0, 1, 1,
-0.4009667, 0.6900889, -0.6499742, 0, 0, 0, 1, 1,
-0.3940494, -0.2212808, -2.2946, 0, 0, 0, 1, 1,
-0.3898163, -0.4290491, -1.455959, 0, 0, 0, 1, 1,
-0.384476, 0.4499909, -0.6453789, 1, 1, 1, 1, 1,
-0.3829068, -0.9717945, -2.347725, 1, 1, 1, 1, 1,
-0.3779435, -0.8343021, -2.198573, 1, 1, 1, 1, 1,
-0.3739189, -2.056618, -2.853874, 1, 1, 1, 1, 1,
-0.373496, -0.7036476, -3.186244, 1, 1, 1, 1, 1,
-0.3729583, -1.593765, -2.871642, 1, 1, 1, 1, 1,
-0.3720133, 1.417359, 0.7598301, 1, 1, 1, 1, 1,
-0.3659604, -0.5386699, -2.304952, 1, 1, 1, 1, 1,
-0.3648094, 1.265945, 1.192404, 1, 1, 1, 1, 1,
-0.3633986, -0.2310233, 1.05585, 1, 1, 1, 1, 1,
-0.3633517, 0.106972, -0.9962736, 1, 1, 1, 1, 1,
-0.363183, 0.1973541, -1.3061, 1, 1, 1, 1, 1,
-0.3564456, -0.2144443, -2.334732, 1, 1, 1, 1, 1,
-0.3546393, 0.2973146, -0.949635, 1, 1, 1, 1, 1,
-0.3509126, 0.491464, -0.7974856, 1, 1, 1, 1, 1,
-0.3473747, 2.111513, -0.4861646, 0, 0, 1, 1, 1,
-0.3434601, -0.4466333, -2.405331, 1, 0, 0, 1, 1,
-0.3428981, 0.4831946, 0.8245122, 1, 0, 0, 1, 1,
-0.3420892, 0.2326272, -2.320603, 1, 0, 0, 1, 1,
-0.3412948, 0.1986159, -0.04364551, 1, 0, 0, 1, 1,
-0.3401652, -1.297173, -3.313067, 1, 0, 0, 1, 1,
-0.3317611, 0.6632533, -1.202334, 0, 0, 0, 1, 1,
-0.3309573, 0.154584, -2.215948, 0, 0, 0, 1, 1,
-0.3298944, -0.290244, -2.794876, 0, 0, 0, 1, 1,
-0.3265301, -0.9779595, -2.637932, 0, 0, 0, 1, 1,
-0.326012, 1.350252, -1.419437, 0, 0, 0, 1, 1,
-0.325715, 1.010094, -0.04186915, 0, 0, 0, 1, 1,
-0.3251354, -0.04754176, -1.136541, 0, 0, 0, 1, 1,
-0.3210087, 1.071116, -1.232361, 1, 1, 1, 1, 1,
-0.3196474, -0.4504866, -3.55832, 1, 1, 1, 1, 1,
-0.3145943, 1.328127, 0.7613984, 1, 1, 1, 1, 1,
-0.3113353, -0.2863109, -3.416642, 1, 1, 1, 1, 1,
-0.307228, 0.8200587, -0.2243041, 1, 1, 1, 1, 1,
-0.3047687, 0.5531697, -0.7318181, 1, 1, 1, 1, 1,
-0.2993593, -1.297515, -2.973134, 1, 1, 1, 1, 1,
-0.2988273, 0.5093748, 2.655812, 1, 1, 1, 1, 1,
-0.2945514, -0.09591708, -2.051792, 1, 1, 1, 1, 1,
-0.2937048, -0.6189233, -3.811145, 1, 1, 1, 1, 1,
-0.2926074, 2.024269, -0.5594044, 1, 1, 1, 1, 1,
-0.29142, 0.6567916, -0.5890532, 1, 1, 1, 1, 1,
-0.2865883, 0.8927156, 0.8992948, 1, 1, 1, 1, 1,
-0.285742, 0.281487, -2.163772, 1, 1, 1, 1, 1,
-0.2842683, -0.5246319, -1.591489, 1, 1, 1, 1, 1,
-0.2839789, 1.748335, -0.4280458, 0, 0, 1, 1, 1,
-0.2835442, 0.1568995, -1.012655, 1, 0, 0, 1, 1,
-0.2811761, -1.102208, -2.55396, 1, 0, 0, 1, 1,
-0.2732692, 0.5831943, -1.16976, 1, 0, 0, 1, 1,
-0.2718411, -0.6264421, -2.165005, 1, 0, 0, 1, 1,
-0.2709551, 1.554407, -1.370769, 1, 0, 0, 1, 1,
-0.2653387, 1.01837, 1.453488, 0, 0, 0, 1, 1,
-0.2618898, 0.2940193, -1.197809, 0, 0, 0, 1, 1,
-0.2593122, 0.7896073, -0.2311928, 0, 0, 0, 1, 1,
-0.2466998, -0.2634197, -3.807633, 0, 0, 0, 1, 1,
-0.2454093, 0.1546295, -1.85837, 0, 0, 0, 1, 1,
-0.2443833, 0.08208124, -0.5586742, 0, 0, 0, 1, 1,
-0.2440657, 1.715415, 0.6482405, 0, 0, 0, 1, 1,
-0.2401021, 1.14344, -1.157499, 1, 1, 1, 1, 1,
-0.2387928, -0.6044934, -3.827662, 1, 1, 1, 1, 1,
-0.2377766, 0.07938008, 0.5355108, 1, 1, 1, 1, 1,
-0.2376301, 0.8396541, -1.172085, 1, 1, 1, 1, 1,
-0.2350467, 1.724504, -0.4341281, 1, 1, 1, 1, 1,
-0.2340617, -0.2875382, -3.423172, 1, 1, 1, 1, 1,
-0.2339131, -1.839767, -3.462925, 1, 1, 1, 1, 1,
-0.2306795, -0.4428816, -3.642669, 1, 1, 1, 1, 1,
-0.2305669, -1.197609, -2.318267, 1, 1, 1, 1, 1,
-0.2261301, -1.022091, -2.380655, 1, 1, 1, 1, 1,
-0.2215978, -1.444433, -3.256399, 1, 1, 1, 1, 1,
-0.2193715, 0.137554, -0.7023608, 1, 1, 1, 1, 1,
-0.2186322, -0.3772472, -2.049063, 1, 1, 1, 1, 1,
-0.2149104, 2.359697, 0.4592178, 1, 1, 1, 1, 1,
-0.2147569, 1.720714, 1.592827, 1, 1, 1, 1, 1,
-0.2127337, 0.5783506, 0.5858611, 0, 0, 1, 1, 1,
-0.2113815, -0.1307575, -5.420407, 1, 0, 0, 1, 1,
-0.20738, 0.862952, -0.5293303, 1, 0, 0, 1, 1,
-0.2027002, -1.180489, -2.354629, 1, 0, 0, 1, 1,
-0.2010254, 1.405156, 0.9168718, 1, 0, 0, 1, 1,
-0.1962079, -0.8663254, -4.618724, 1, 0, 0, 1, 1,
-0.1956427, -0.477369, -3.172579, 0, 0, 0, 1, 1,
-0.193541, -0.05556411, -0.632593, 0, 0, 0, 1, 1,
-0.1921815, 0.08826497, -2.409276, 0, 0, 0, 1, 1,
-0.1909838, 0.02006277, -1.970121, 0, 0, 0, 1, 1,
-0.1902612, -0.4541104, -3.123267, 0, 0, 0, 1, 1,
-0.1899648, -0.4781438, -2.254064, 0, 0, 0, 1, 1,
-0.1886394, -1.558685, -3.058016, 0, 0, 0, 1, 1,
-0.1800439, 1.077416, 0.08688523, 1, 1, 1, 1, 1,
-0.1784278, 0.875985, -0.07964791, 1, 1, 1, 1, 1,
-0.1771653, 1.702609, 0.1192679, 1, 1, 1, 1, 1,
-0.1769285, -0.2961265, -2.360812, 1, 1, 1, 1, 1,
-0.1737235, 0.102496, -1.020993, 1, 1, 1, 1, 1,
-0.1727968, -1.37877, -2.213789, 1, 1, 1, 1, 1,
-0.1705852, 0.8285387, 0.08118566, 1, 1, 1, 1, 1,
-0.1687637, 1.85275, -1.073484, 1, 1, 1, 1, 1,
-0.167331, -0.6520544, -3.041648, 1, 1, 1, 1, 1,
-0.1659451, 0.1066272, -3.03883, 1, 1, 1, 1, 1,
-0.1658894, -1.822533, -3.176559, 1, 1, 1, 1, 1,
-0.1617539, 0.9061952, -0.08205472, 1, 1, 1, 1, 1,
-0.1614333, -0.02473807, -1.267444, 1, 1, 1, 1, 1,
-0.1587479, 1.080871, -1.236783, 1, 1, 1, 1, 1,
-0.1566571, -0.08880706, -3.860438, 1, 1, 1, 1, 1,
-0.1486837, -0.2139213, -1.906397, 0, 0, 1, 1, 1,
-0.1464832, -0.1828129, -2.609313, 1, 0, 0, 1, 1,
-0.1432317, -3.747662, -3.636922, 1, 0, 0, 1, 1,
-0.1426163, 0.8048035, 0.5879798, 1, 0, 0, 1, 1,
-0.1421587, 1.826705, 0.677597, 1, 0, 0, 1, 1,
-0.1406777, -1.387833, -3.312933, 1, 0, 0, 1, 1,
-0.1389135, -0.7925442, -1.285695, 0, 0, 0, 1, 1,
-0.1358644, -0.6519502, -3.275625, 0, 0, 0, 1, 1,
-0.1343169, 1.054844, 0.3072923, 0, 0, 0, 1, 1,
-0.1323281, -0.8109607, -3.122695, 0, 0, 0, 1, 1,
-0.1308343, 0.01315401, -1.383855, 0, 0, 0, 1, 1,
-0.1281924, 0.8081711, -2.328734, 0, 0, 0, 1, 1,
-0.121692, 0.05830468, -1.796815, 0, 0, 0, 1, 1,
-0.121309, 1.517024, -0.09460665, 1, 1, 1, 1, 1,
-0.1180784, -0.2189513, -2.935922, 1, 1, 1, 1, 1,
-0.1077824, 0.3200274, -2.202484, 1, 1, 1, 1, 1,
-0.09070113, 0.3507091, -0.3715069, 1, 1, 1, 1, 1,
-0.08932331, 0.3059333, 2.146039, 1, 1, 1, 1, 1,
-0.08375642, -1.203208, -3.303415, 1, 1, 1, 1, 1,
-0.08311228, -0.04433395, -1.383016, 1, 1, 1, 1, 1,
-0.08285818, 0.003883671, -1.807092, 1, 1, 1, 1, 1,
-0.08196642, 0.690662, -0.2327057, 1, 1, 1, 1, 1,
-0.08187744, -1.219349, -4.421733, 1, 1, 1, 1, 1,
-0.08067974, 0.2748732, 0.1298326, 1, 1, 1, 1, 1,
-0.08002498, -0.3536415, -2.851371, 1, 1, 1, 1, 1,
-0.07135951, 1.191773, -0.09684528, 1, 1, 1, 1, 1,
-0.0707428, -0.7750248, -3.069903, 1, 1, 1, 1, 1,
-0.06978597, 1.082512, -1.060725, 1, 1, 1, 1, 1,
-0.0671465, 1.192817, -0.06770553, 0, 0, 1, 1, 1,
-0.06666274, -0.9005969, -4.372614, 1, 0, 0, 1, 1,
-0.06602113, -0.2270234, -3.676901, 1, 0, 0, 1, 1,
-0.0641933, 1.145629, 0.1678476, 1, 0, 0, 1, 1,
-0.06298997, -0.7145489, -5.135755, 1, 0, 0, 1, 1,
-0.06190621, 0.2017238, 0.6622676, 1, 0, 0, 1, 1,
-0.06038643, 0.4978853, -1.035804, 0, 0, 0, 1, 1,
-0.05908604, 0.6219914, -1.074838, 0, 0, 0, 1, 1,
-0.05468052, 1.11491, 0.2420337, 0, 0, 0, 1, 1,
-0.05427216, -1.180943, -2.459149, 0, 0, 0, 1, 1,
-0.05224901, -0.6697557, -2.040549, 0, 0, 0, 1, 1,
-0.05141743, 1.0213, 0.41778, 0, 0, 0, 1, 1,
-0.04834693, -0.6567239, -3.705424, 0, 0, 0, 1, 1,
-0.04346994, 1.027012, 0.5306343, 1, 1, 1, 1, 1,
-0.03614809, -0.04135299, -4.171888, 1, 1, 1, 1, 1,
-0.03471375, -0.05282738, -2.444661, 1, 1, 1, 1, 1,
-0.0254248, 0.3669409, -2.328408, 1, 1, 1, 1, 1,
-0.02355503, -2.765219, -3.892661, 1, 1, 1, 1, 1,
-0.02184915, 0.08959163, 2.164611, 1, 1, 1, 1, 1,
-0.01911908, -2.333096, -3.352645, 1, 1, 1, 1, 1,
-0.01794995, 0.3178541, 1.367287, 1, 1, 1, 1, 1,
-0.01074418, 0.5507422, 1.085286, 1, 1, 1, 1, 1,
-0.01063265, -0.9241863, -1.773414, 1, 1, 1, 1, 1,
-0.00733242, 1.28483, -2.448163, 1, 1, 1, 1, 1,
-0.004316535, -0.3322683, -3.292187, 1, 1, 1, 1, 1,
-0.0005252635, 0.1537449, -0.3566331, 1, 1, 1, 1, 1,
0.000132944, 1.008067, 0.5050569, 1, 1, 1, 1, 1,
0.001178646, -0.9699391, 3.778633, 1, 1, 1, 1, 1,
0.002595501, -1.271609, 2.685616, 0, 0, 1, 1, 1,
0.007964982, 0.8818878, -0.9712833, 1, 0, 0, 1, 1,
0.008966855, 0.306785, 0.04372334, 1, 0, 0, 1, 1,
0.01209485, -2.008702, 2.687086, 1, 0, 0, 1, 1,
0.01373306, -0.9982796, 2.623669, 1, 0, 0, 1, 1,
0.01674223, 1.127897, 0.5006506, 1, 0, 0, 1, 1,
0.01835034, 1.130011, 0.3009167, 0, 0, 0, 1, 1,
0.01858814, -1.502748, -0.3541401, 0, 0, 0, 1, 1,
0.01967416, 0.441555, 0.07654395, 0, 0, 0, 1, 1,
0.02583063, 1.162539, 1.386303, 0, 0, 0, 1, 1,
0.02587193, -1.59628, 3.678318, 0, 0, 0, 1, 1,
0.02850043, 0.3009664, 0.6547368, 0, 0, 0, 1, 1,
0.03341148, 0.6089532, -0.6123123, 0, 0, 0, 1, 1,
0.0338267, -0.3736764, 1.739848, 1, 1, 1, 1, 1,
0.03403901, -1.061775, 4.176721, 1, 1, 1, 1, 1,
0.05014525, 0.5441456, 0.4116819, 1, 1, 1, 1, 1,
0.05102206, 2.72589, -0.1981967, 1, 1, 1, 1, 1,
0.05568291, 0.8381633, 1.510369, 1, 1, 1, 1, 1,
0.05610688, 0.1868725, 0.9150412, 1, 1, 1, 1, 1,
0.06613637, -0.6413441, 3.774123, 1, 1, 1, 1, 1,
0.06724232, 1.785277, -0.5008302, 1, 1, 1, 1, 1,
0.06959397, 0.05680475, -1.227894, 1, 1, 1, 1, 1,
0.0702991, 0.3283655, 0.569998, 1, 1, 1, 1, 1,
0.07535999, -1.214581, 0.6809719, 1, 1, 1, 1, 1,
0.07814815, 0.5019404, 1.055165, 1, 1, 1, 1, 1,
0.07874651, -1.077489, 2.831172, 1, 1, 1, 1, 1,
0.08249149, -1.221378, 3.676603, 1, 1, 1, 1, 1,
0.08573306, 2.293883, 0.5809985, 1, 1, 1, 1, 1,
0.08713194, 0.3919081, 0.1459441, 0, 0, 1, 1, 1,
0.08808255, -0.2972765, 2.127438, 1, 0, 0, 1, 1,
0.08847672, 0.9557809, -0.7284698, 1, 0, 0, 1, 1,
0.09246189, -0.4797328, 1.271703, 1, 0, 0, 1, 1,
0.09349203, -0.4685962, 1.966733, 1, 0, 0, 1, 1,
0.09450104, 0.0006359996, 3.253355, 1, 0, 0, 1, 1,
0.09492093, -0.8070559, 4.013672, 0, 0, 0, 1, 1,
0.09655873, 2.585524, -1.212633, 0, 0, 0, 1, 1,
0.09718451, 0.6944915, -0.7147814, 0, 0, 0, 1, 1,
0.09917533, -0.6327068, 3.734227, 0, 0, 0, 1, 1,
0.1013305, -0.5798755, 4.085766, 0, 0, 0, 1, 1,
0.1058132, -0.1460315, 2.855849, 0, 0, 0, 1, 1,
0.1093846, -0.9838645, 2.326703, 0, 0, 0, 1, 1,
0.1118379, 0.7125226, 2.23473, 1, 1, 1, 1, 1,
0.1138071, -1.157844, 3.440799, 1, 1, 1, 1, 1,
0.1142801, 0.8058138, -1.01166, 1, 1, 1, 1, 1,
0.1194256, -0.1043079, 2.763587, 1, 1, 1, 1, 1,
0.120629, -1.572928, 4.225065, 1, 1, 1, 1, 1,
0.1227798, -0.0502579, 1.953227, 1, 1, 1, 1, 1,
0.1237342, -1.423135, 2.587984, 1, 1, 1, 1, 1,
0.1240914, 2.304582, -0.140247, 1, 1, 1, 1, 1,
0.1257456, -0.1452427, 1.306529, 1, 1, 1, 1, 1,
0.1266303, 0.01092719, 1.042825, 1, 1, 1, 1, 1,
0.1283707, 0.06143663, -0.109353, 1, 1, 1, 1, 1,
0.1358212, -0.00748049, 1.665848, 1, 1, 1, 1, 1,
0.1367551, 2.140729, -1.092864, 1, 1, 1, 1, 1,
0.1375831, -0.7686643, 3.306478, 1, 1, 1, 1, 1,
0.1394353, -0.7192471, 3.09632, 1, 1, 1, 1, 1,
0.1425247, -0.5329489, 2.955872, 0, 0, 1, 1, 1,
0.1430369, 0.6263213, -0.002986645, 1, 0, 0, 1, 1,
0.1441671, 0.8642164, -0.7577854, 1, 0, 0, 1, 1,
0.144443, 0.3222729, 1.734233, 1, 0, 0, 1, 1,
0.1491553, -0.3815569, 5.051235, 1, 0, 0, 1, 1,
0.1496775, 1.336031, 1.566492, 1, 0, 0, 1, 1,
0.15093, -0.7574021, 1.864865, 0, 0, 0, 1, 1,
0.1562242, -0.3039754, 2.959624, 0, 0, 0, 1, 1,
0.1620768, -1.093122, 3.378529, 0, 0, 0, 1, 1,
0.1685433, -0.360267, 2.130025, 0, 0, 0, 1, 1,
0.1685439, -0.6531187, 0.1611082, 0, 0, 0, 1, 1,
0.1687498, -0.8999755, 4.502829, 0, 0, 0, 1, 1,
0.1765262, -0.2858519, 3.154518, 0, 0, 0, 1, 1,
0.1806732, -0.1720388, 2.125458, 1, 1, 1, 1, 1,
0.1853998, 1.099303, -0.7284274, 1, 1, 1, 1, 1,
0.1873553, 0.4250613, 1.438525, 1, 1, 1, 1, 1,
0.1941438, 0.2102137, 1.506926, 1, 1, 1, 1, 1,
0.1946552, 1.546445, -0.7703284, 1, 1, 1, 1, 1,
0.1955683, -1.175045, 3.317515, 1, 1, 1, 1, 1,
0.1969741, -0.1058066, 3.138799, 1, 1, 1, 1, 1,
0.1975119, 0.3884756, -0.3047712, 1, 1, 1, 1, 1,
0.1977576, 2.291673, -0.0001561874, 1, 1, 1, 1, 1,
0.1990877, -1.379706, 2.111771, 1, 1, 1, 1, 1,
0.1999849, -0.6030713, 4.856021, 1, 1, 1, 1, 1,
0.200086, 0.9045185, -0.7613184, 1, 1, 1, 1, 1,
0.2034653, 0.5360796, -0.1484478, 1, 1, 1, 1, 1,
0.2089652, 0.9027376, 1.187091, 1, 1, 1, 1, 1,
0.2106429, -0.03294183, 1.918905, 1, 1, 1, 1, 1,
0.2115722, 1.256961, -0.9880441, 0, 0, 1, 1, 1,
0.2117681, 0.06326032, 1.362795, 1, 0, 0, 1, 1,
0.2130591, -1.057934, 1.705288, 1, 0, 0, 1, 1,
0.216844, 0.9597507, -0.9102954, 1, 0, 0, 1, 1,
0.2225738, 0.4096082, 0.1714713, 1, 0, 0, 1, 1,
0.225031, 0.3961021, 0.702066, 1, 0, 0, 1, 1,
0.2313498, -1.233466, 2.972134, 0, 0, 0, 1, 1,
0.2332432, 0.9650241, -0.7092534, 0, 0, 0, 1, 1,
0.2357873, -0.6851342, 2.845547, 0, 0, 0, 1, 1,
0.2387223, 0.2123612, 0.3386808, 0, 0, 0, 1, 1,
0.2394375, -0.1102388, 1.077874, 0, 0, 0, 1, 1,
0.2416811, -1.066427, 3.125228, 0, 0, 0, 1, 1,
0.2452984, 0.2720155, 1.107836, 0, 0, 0, 1, 1,
0.2474505, -1.047351, 3.33981, 1, 1, 1, 1, 1,
0.2475362, 0.238496, 1.146961, 1, 1, 1, 1, 1,
0.2534152, 0.262319, -0.02174579, 1, 1, 1, 1, 1,
0.2543924, -0.08817799, 2.172925, 1, 1, 1, 1, 1,
0.2572361, -1.32501, 3.567997, 1, 1, 1, 1, 1,
0.2574501, 1.446147, -1.382616, 1, 1, 1, 1, 1,
0.2582294, -0.1437511, 2.210199, 1, 1, 1, 1, 1,
0.2586784, 0.4735152, 0.06155901, 1, 1, 1, 1, 1,
0.2604291, -1.165006, 4.283373, 1, 1, 1, 1, 1,
0.2657959, 1.720112, -1.058931, 1, 1, 1, 1, 1,
0.2672741, -0.6081712, 3.205065, 1, 1, 1, 1, 1,
0.2681822, -1.513244, 3.287294, 1, 1, 1, 1, 1,
0.2730862, 0.3229877, 1.285566, 1, 1, 1, 1, 1,
0.2751517, -1.25738, 3.207522, 1, 1, 1, 1, 1,
0.2756479, 0.4023176, 0.4962039, 1, 1, 1, 1, 1,
0.2772088, -0.994657, 2.226068, 0, 0, 1, 1, 1,
0.2785994, -0.05744859, 1.64394, 1, 0, 0, 1, 1,
0.2789397, 2.053332, 0.2848416, 1, 0, 0, 1, 1,
0.2808751, -1.5087, 2.980037, 1, 0, 0, 1, 1,
0.2868904, -1.163121, 1.734239, 1, 0, 0, 1, 1,
0.2948895, 1.421128, 0.3851346, 1, 0, 0, 1, 1,
0.3009233, 0.7511841, 1.539121, 0, 0, 0, 1, 1,
0.3018736, 2.361681, 0.4125881, 0, 0, 0, 1, 1,
0.3040869, -0.03392869, 1.110928, 0, 0, 0, 1, 1,
0.307288, 0.2117491, 1.914446, 0, 0, 0, 1, 1,
0.3082539, 1.950759, -0.6498516, 0, 0, 0, 1, 1,
0.3097607, 1.796098, 2.15212, 0, 0, 0, 1, 1,
0.3110633, 0.4024971, 0.9238355, 0, 0, 0, 1, 1,
0.3110904, 1.509257, -1.642694, 1, 1, 1, 1, 1,
0.312324, -0.3474798, 1.599344, 1, 1, 1, 1, 1,
0.3142829, -1.823486, 2.405689, 1, 1, 1, 1, 1,
0.3197272, 2.221317, -0.0290363, 1, 1, 1, 1, 1,
0.322402, -0.3429259, 2.125432, 1, 1, 1, 1, 1,
0.3224422, 0.5817294, -0.4725063, 1, 1, 1, 1, 1,
0.3258448, 0.2375911, -1.613487, 1, 1, 1, 1, 1,
0.327024, 0.2910385, 0.6641496, 1, 1, 1, 1, 1,
0.3276014, -0.07116482, 2.398077, 1, 1, 1, 1, 1,
0.3281151, -0.4325357, 4.512375, 1, 1, 1, 1, 1,
0.3378524, 0.9002625, -1.128862, 1, 1, 1, 1, 1,
0.3379542, -1.516936, 2.92067, 1, 1, 1, 1, 1,
0.3410628, 0.8008904, 0.6812135, 1, 1, 1, 1, 1,
0.3480041, 1.507082, 2.349861, 1, 1, 1, 1, 1,
0.3498209, 0.2157167, -1.174663, 1, 1, 1, 1, 1,
0.3531083, -1.284221, 2.119863, 0, 0, 1, 1, 1,
0.353673, 0.5936572, 0.6984408, 1, 0, 0, 1, 1,
0.3551751, 1.162739, 2.284848, 1, 0, 0, 1, 1,
0.3563114, -0.4928608, 2.872944, 1, 0, 0, 1, 1,
0.3619675, -0.440851, 3.393057, 1, 0, 0, 1, 1,
0.3622945, -1.83487, 2.595297, 1, 0, 0, 1, 1,
0.3704892, 0.09710359, 1.682391, 0, 0, 0, 1, 1,
0.3745763, -2.357233, 2.001998, 0, 0, 0, 1, 1,
0.3785265, 0.6434681, 2.508244, 0, 0, 0, 1, 1,
0.3786467, 0.08653042, 2.329608, 0, 0, 0, 1, 1,
0.3798589, -0.4965325, 2.285066, 0, 0, 0, 1, 1,
0.384722, 1.063651, 0.01885804, 0, 0, 0, 1, 1,
0.3861519, -0.2410217, 2.503214, 0, 0, 0, 1, 1,
0.3952655, -0.2870134, 0.6382141, 1, 1, 1, 1, 1,
0.3975428, -0.7958564, 3.389305, 1, 1, 1, 1, 1,
0.3984789, -0.4093186, 2.2817, 1, 1, 1, 1, 1,
0.4001919, 0.3014614, 0.9193379, 1, 1, 1, 1, 1,
0.4009405, 0.9188363, -0.05561227, 1, 1, 1, 1, 1,
0.4048995, -1.572115, 2.429842, 1, 1, 1, 1, 1,
0.4063367, -0.8719383, 1.082646, 1, 1, 1, 1, 1,
0.4106709, -0.2112004, 1.565359, 1, 1, 1, 1, 1,
0.4171969, 0.6455278, 1.05592, 1, 1, 1, 1, 1,
0.4240589, -2.071033, 2.53426, 1, 1, 1, 1, 1,
0.4244065, 0.767657, -1.429599, 1, 1, 1, 1, 1,
0.4281469, -2.277115, 1.99434, 1, 1, 1, 1, 1,
0.4288124, -0.6833872, 3.37595, 1, 1, 1, 1, 1,
0.4345812, 1.083311, 0.8694926, 1, 1, 1, 1, 1,
0.4352546, 2.466179, 0.4817666, 1, 1, 1, 1, 1,
0.4366217, 1.074879, 1.357855, 0, 0, 1, 1, 1,
0.4422797, -0.1832441, 4.026594, 1, 0, 0, 1, 1,
0.4436412, 0.09101901, 2.25047, 1, 0, 0, 1, 1,
0.4443746, 1.596162, 0.1877035, 1, 0, 0, 1, 1,
0.4491839, -0.01297511, 1.256549, 1, 0, 0, 1, 1,
0.4508598, 0.203888, -0.774076, 1, 0, 0, 1, 1,
0.4525615, -0.4200375, 3.600812, 0, 0, 0, 1, 1,
0.4529446, -0.4287346, 3.119942, 0, 0, 0, 1, 1,
0.4553842, -1.337844, 3.653911, 0, 0, 0, 1, 1,
0.4565082, 0.9321406, 1.136714, 0, 0, 0, 1, 1,
0.4581438, -0.1447669, 1.091595, 0, 0, 0, 1, 1,
0.4752598, -0.582304, 4.714774, 0, 0, 0, 1, 1,
0.4780549, -1.364179, 2.054111, 0, 0, 0, 1, 1,
0.4785297, 0.7782094, -0.08583827, 1, 1, 1, 1, 1,
0.4842643, -0.9460804, 0.2314537, 1, 1, 1, 1, 1,
0.4853452, -0.3741842, 2.021061, 1, 1, 1, 1, 1,
0.4869256, 0.1455196, 2.132321, 1, 1, 1, 1, 1,
0.498293, -1.372484, 3.031012, 1, 1, 1, 1, 1,
0.4995143, -0.8275729, 2.789293, 1, 1, 1, 1, 1,
0.504368, 1.377866, 1.500879, 1, 1, 1, 1, 1,
0.5048499, 0.8132912, -1.278066, 1, 1, 1, 1, 1,
0.5079016, -1.124747, 4.901411, 1, 1, 1, 1, 1,
0.5147502, -0.04991146, 4.290421, 1, 1, 1, 1, 1,
0.5222775, 1.420257, 0.1895786, 1, 1, 1, 1, 1,
0.5303069, 1.080771, 0.3831716, 1, 1, 1, 1, 1,
0.5405987, 1.524064, 0.372018, 1, 1, 1, 1, 1,
0.543346, -0.6141701, 1.068621, 1, 1, 1, 1, 1,
0.5467474, 0.0355579, 1.444388, 1, 1, 1, 1, 1,
0.5467565, 0.3765457, 2.737984, 0, 0, 1, 1, 1,
0.5491158, -0.4827316, 1.679004, 1, 0, 0, 1, 1,
0.5550902, 0.7085855, 1.160468, 1, 0, 0, 1, 1,
0.5565863, 1.011307, 0.5464181, 1, 0, 0, 1, 1,
0.5578253, 1.195379, -0.05389013, 1, 0, 0, 1, 1,
0.5589325, 1.416175, 1.07447, 1, 0, 0, 1, 1,
0.5602447, -0.6884419, 3.084392, 0, 0, 0, 1, 1,
0.5620894, 0.7325107, 1.01849, 0, 0, 0, 1, 1,
0.5720567, 3.089231, -0.41707, 0, 0, 0, 1, 1,
0.5727971, 1.508481, -0.6510358, 0, 0, 0, 1, 1,
0.577322, -0.2999947, 0.9769343, 0, 0, 0, 1, 1,
0.5794054, -1.131035, 1.83842, 0, 0, 0, 1, 1,
0.5821818, -0.01973824, 0.6852252, 0, 0, 0, 1, 1,
0.5833018, 0.9738988, -0.233859, 1, 1, 1, 1, 1,
0.586286, 1.20933, -0.8418645, 1, 1, 1, 1, 1,
0.5967468, 2.015838, -1.077614, 1, 1, 1, 1, 1,
0.5981165, 0.5539476, 1.780078, 1, 1, 1, 1, 1,
0.601787, 0.7485874, -1.18279, 1, 1, 1, 1, 1,
0.602564, -1.207465, 1.693606, 1, 1, 1, 1, 1,
0.6029657, 0.06809685, 3.256411, 1, 1, 1, 1, 1,
0.6137462, -0.08102151, 1.850762, 1, 1, 1, 1, 1,
0.6161424, 0.1743099, -0.9242743, 1, 1, 1, 1, 1,
0.6164021, -0.1819086, 3.323476, 1, 1, 1, 1, 1,
0.6166565, 1.877465, 0.8196533, 1, 1, 1, 1, 1,
0.6234072, 2.030594, 0.8159676, 1, 1, 1, 1, 1,
0.6299642, 1.170129, 0.218651, 1, 1, 1, 1, 1,
0.6374111, -0.3626089, -0.4357324, 1, 1, 1, 1, 1,
0.639557, -0.3155404, 2.217183, 1, 1, 1, 1, 1,
0.6411393, -1.420823, 2.550256, 0, 0, 1, 1, 1,
0.643268, 0.1755716, 1.134723, 1, 0, 0, 1, 1,
0.6442463, -1.470118, 5.217329, 1, 0, 0, 1, 1,
0.6457729, -0.5451063, 3.146734, 1, 0, 0, 1, 1,
0.6560636, 0.3109494, 2.283373, 1, 0, 0, 1, 1,
0.6570221, 1.034557, 1.852242, 1, 0, 0, 1, 1,
0.6571003, 0.4996676, -0.08467843, 0, 0, 0, 1, 1,
0.6603517, 1.033869, -0.9808487, 0, 0, 0, 1, 1,
0.6680993, 0.6363609, 0.1354067, 0, 0, 0, 1, 1,
0.6683109, 0.6179529, 2.465853, 0, 0, 0, 1, 1,
0.671333, -0.109408, 0.3427199, 0, 0, 0, 1, 1,
0.6768682, -0.1034016, 0.7083262, 0, 0, 0, 1, 1,
0.6774613, -0.04521873, 1.090091, 0, 0, 0, 1, 1,
0.6776202, 0.1591866, 0.8516477, 1, 1, 1, 1, 1,
0.6786612, 0.1148056, 2.587921, 1, 1, 1, 1, 1,
0.6810762, 0.5262629, -0.2996352, 1, 1, 1, 1, 1,
0.6822184, -0.1083258, 1.584267, 1, 1, 1, 1, 1,
0.6848519, 0.692534, -0.1782834, 1, 1, 1, 1, 1,
0.6850002, -0.01852247, 1.841914, 1, 1, 1, 1, 1,
0.6864484, -2.404531, 1.185934, 1, 1, 1, 1, 1,
0.6869314, -0.1627332, 0.8582047, 1, 1, 1, 1, 1,
0.6940227, -0.5393082, 1.370652, 1, 1, 1, 1, 1,
0.6952011, 0.8645898, -0.2059519, 1, 1, 1, 1, 1,
0.6957234, 0.1235085, 0.5468748, 1, 1, 1, 1, 1,
0.6965626, -0.3883002, 3.233178, 1, 1, 1, 1, 1,
0.7066842, 0.5037233, 1.316217, 1, 1, 1, 1, 1,
0.7149553, -1.315916, 2.013695, 1, 1, 1, 1, 1,
0.7168202, -0.2999861, 1.372885, 1, 1, 1, 1, 1,
0.7172402, 0.9547608, 2.785495, 0, 0, 1, 1, 1,
0.7323496, 1.450275, 0.4205005, 1, 0, 0, 1, 1,
0.7339884, 0.2468588, 0.9621205, 1, 0, 0, 1, 1,
0.7400482, -1.220782, 3.631367, 1, 0, 0, 1, 1,
0.7408357, 1.046376, -0.8407855, 1, 0, 0, 1, 1,
0.7408944, 0.6328965, 1.617113, 1, 0, 0, 1, 1,
0.7424002, -0.9444264, 0.3771893, 0, 0, 0, 1, 1,
0.7437332, -0.6137144, 1.362562, 0, 0, 0, 1, 1,
0.7492432, 0.7856303, 1.772231, 0, 0, 0, 1, 1,
0.7494188, -0.9890724, 1.492557, 0, 0, 0, 1, 1,
0.7509657, 0.6263472, -0.1638538, 0, 0, 0, 1, 1,
0.7621859, 1.689948, 1.547461, 0, 0, 0, 1, 1,
0.7635737, 0.8980662, 0.1703963, 0, 0, 0, 1, 1,
0.7664632, 2.767648, 1.054466, 1, 1, 1, 1, 1,
0.7690114, 0.8001043, -0.4635271, 1, 1, 1, 1, 1,
0.7762185, 2.292979, 0.1203042, 1, 1, 1, 1, 1,
0.7780879, -0.2679499, 2.426195, 1, 1, 1, 1, 1,
0.7805027, 0.4758571, 2.022856, 1, 1, 1, 1, 1,
0.783007, -0.2158113, 1.542108, 1, 1, 1, 1, 1,
0.7850244, -0.5075305, 2.312091, 1, 1, 1, 1, 1,
0.7869649, 1.242749, 1.217971, 1, 1, 1, 1, 1,
0.7876343, 0.4623906, 1.823092, 1, 1, 1, 1, 1,
0.7919146, 0.564835, -0.1015017, 1, 1, 1, 1, 1,
0.7931558, 0.651522, 1.920121, 1, 1, 1, 1, 1,
0.7938488, -1.300565, 0.8741001, 1, 1, 1, 1, 1,
0.7962734, 2.040617, 0.4198875, 1, 1, 1, 1, 1,
0.7974179, 0.04032145, 1.583288, 1, 1, 1, 1, 1,
0.8007293, 0.5394014, 0.9882398, 1, 1, 1, 1, 1,
0.802331, 0.9417217, 0.2809305, 0, 0, 1, 1, 1,
0.8037974, -1.273347, 1.410183, 1, 0, 0, 1, 1,
0.8057196, -1.243369, 2.817277, 1, 0, 0, 1, 1,
0.813162, 2.050695, 1.18678, 1, 0, 0, 1, 1,
0.8133846, 0.5308034, 1.89344, 1, 0, 0, 1, 1,
0.8147076, -0.8102881, 1.719239, 1, 0, 0, 1, 1,
0.8158931, 0.7510577, 0.8211113, 0, 0, 0, 1, 1,
0.8205829, 0.4437523, 1.730097, 0, 0, 0, 1, 1,
0.8261098, 1.175891, -1.684639, 0, 0, 0, 1, 1,
0.8280085, 0.1927286, 1.023764, 0, 0, 0, 1, 1,
0.8288999, 1.051633, 0.7535304, 0, 0, 0, 1, 1,
0.8431591, 0.06097009, 0.5530742, 0, 0, 0, 1, 1,
0.8431801, 0.09170619, 0.9829314, 0, 0, 0, 1, 1,
0.8485496, -0.5250302, 2.270511, 1, 1, 1, 1, 1,
0.855131, 1.225601, 1.053647, 1, 1, 1, 1, 1,
0.8562685, -0.8336579, 1.602424, 1, 1, 1, 1, 1,
0.856867, 2.833222, 1.134524, 1, 1, 1, 1, 1,
0.8625314, -0.6802704, 2.670563, 1, 1, 1, 1, 1,
0.8669549, -0.7060341, 2.428054, 1, 1, 1, 1, 1,
0.8698859, -0.2564569, 1.78407, 1, 1, 1, 1, 1,
0.8752869, 0.8949123, 1.020778, 1, 1, 1, 1, 1,
0.8755007, 0.5327559, 1.939111, 1, 1, 1, 1, 1,
0.8835248, -1.264484, 0.5836839, 1, 1, 1, 1, 1,
0.8847773, 0.5551767, 1.798876, 1, 1, 1, 1, 1,
0.8850554, -1.006581, 2.530935, 1, 1, 1, 1, 1,
0.8921704, 0.3338601, 0.8874171, 1, 1, 1, 1, 1,
0.8943822, -0.9230578, 2.424219, 1, 1, 1, 1, 1,
0.9000242, 0.7652894, 0.3778646, 1, 1, 1, 1, 1,
0.9002552, -0.005573093, 1.683591, 0, 0, 1, 1, 1,
0.9039031, 0.4275521, 0.5952641, 1, 0, 0, 1, 1,
0.9082971, 0.991016, 1.376073, 1, 0, 0, 1, 1,
0.9108911, -0.08582539, 0.3132921, 1, 0, 0, 1, 1,
0.9141497, 2.051618, -0.04703477, 1, 0, 0, 1, 1,
0.9163398, 0.1202464, 3.286277, 1, 0, 0, 1, 1,
0.916826, -3.300321, 2.66386, 0, 0, 0, 1, 1,
0.9170429, 1.906988, 1.501445, 0, 0, 0, 1, 1,
0.9242731, -2.088348, 3.978762, 0, 0, 0, 1, 1,
0.9270628, 1.446331, -1.189336, 0, 0, 0, 1, 1,
0.9391884, -0.4416885, 2.19781, 0, 0, 0, 1, 1,
0.9451789, -0.02380234, 1.798058, 0, 0, 0, 1, 1,
0.94626, -0.6347216, 1.552388, 0, 0, 0, 1, 1,
0.9477672, -1.061809, 4.1401, 1, 1, 1, 1, 1,
0.9522107, -0.2728238, 1.186294, 1, 1, 1, 1, 1,
0.9574714, -0.6615515, 3.333819, 1, 1, 1, 1, 1,
0.9661705, 0.3234804, 0.4918976, 1, 1, 1, 1, 1,
0.9698772, 1.085608, 0.8993384, 1, 1, 1, 1, 1,
0.9701056, -0.5900601, 4.386675, 1, 1, 1, 1, 1,
0.9725876, 0.3989113, 0.006870927, 1, 1, 1, 1, 1,
0.9803142, -0.0568123, 2.812424, 1, 1, 1, 1, 1,
0.980912, 1.421098, 0.9857092, 1, 1, 1, 1, 1,
0.982223, -1.168358, 1.165846, 1, 1, 1, 1, 1,
0.9885872, -0.1819118, 3.193601, 1, 1, 1, 1, 1,
0.9986149, -0.3279468, 1.049006, 1, 1, 1, 1, 1,
1.008302, -0.9983419, 2.795271, 1, 1, 1, 1, 1,
1.013593, 1.124232, 0.8126904, 1, 1, 1, 1, 1,
1.017525, 1.937446, 0.8062665, 1, 1, 1, 1, 1,
1.020596, -0.7494982, 1.819204, 0, 0, 1, 1, 1,
1.02276, -0.6945894, 1.206499, 1, 0, 0, 1, 1,
1.024148, 1.139476, 2.128765, 1, 0, 0, 1, 1,
1.025054, 0.6491359, -0.6462836, 1, 0, 0, 1, 1,
1.026915, 0.4291082, -0.3096109, 1, 0, 0, 1, 1,
1.031786, -2.591256, 2.581115, 1, 0, 0, 1, 1,
1.032743, 0.2226495, 2.00774, 0, 0, 0, 1, 1,
1.033928, -0.08362164, 1.873838, 0, 0, 0, 1, 1,
1.042081, -1.049631, 2.065092, 0, 0, 0, 1, 1,
1.0449, -0.3422848, 1.501792, 0, 0, 0, 1, 1,
1.046481, 0.1830395, 1.291379, 0, 0, 0, 1, 1,
1.050995, -0.318316, 0.9086359, 0, 0, 0, 1, 1,
1.052723, -0.01514604, 0.7329441, 0, 0, 0, 1, 1,
1.060448, -0.4274153, 2.576975, 1, 1, 1, 1, 1,
1.071992, -0.8015579, 3.091865, 1, 1, 1, 1, 1,
1.073527, 0.8113934, 1.533234, 1, 1, 1, 1, 1,
1.076513, -0.2135263, 1.614427, 1, 1, 1, 1, 1,
1.078131, -0.4018736, 2.031079, 1, 1, 1, 1, 1,
1.07959, 1.458647, 0.9594893, 1, 1, 1, 1, 1,
1.090687, -1.258257, 3.204829, 1, 1, 1, 1, 1,
1.093713, -1.195298, 1.243561, 1, 1, 1, 1, 1,
1.094854, -0.7300479, 1.78113, 1, 1, 1, 1, 1,
1.094947, 0.09206988, 2.490542, 1, 1, 1, 1, 1,
1.096253, 0.5508945, 0.8876225, 1, 1, 1, 1, 1,
1.118036, 0.62378, 0.8579923, 1, 1, 1, 1, 1,
1.133771, 0.922322, 2.74283, 1, 1, 1, 1, 1,
1.13731, -0.9770001, 2.418012, 1, 1, 1, 1, 1,
1.147396, 0.7341057, 1.464913, 1, 1, 1, 1, 1,
1.151684, 1.092727, 1.620344, 0, 0, 1, 1, 1,
1.153032, -0.09982219, 3.475865, 1, 0, 0, 1, 1,
1.156153, -0.5622627, 1.607066, 1, 0, 0, 1, 1,
1.157039, 0.4252753, -0.2077537, 1, 0, 0, 1, 1,
1.171253, 0.2008671, 2.327864, 1, 0, 0, 1, 1,
1.175076, 0.3244115, 0.008241816, 1, 0, 0, 1, 1,
1.175172, -0.4600105, 2.53949, 0, 0, 0, 1, 1,
1.182632, 0.07136521, 0.4640341, 0, 0, 0, 1, 1,
1.196477, -1.240534, 3.011735, 0, 0, 0, 1, 1,
1.197876, 0.4486714, -0.6385145, 0, 0, 0, 1, 1,
1.19872, -0.8408255, 2.943244, 0, 0, 0, 1, 1,
1.200136, 1.029577, 0.7961281, 0, 0, 0, 1, 1,
1.202176, 0.803234, 0.4973237, 0, 0, 0, 1, 1,
1.204273, 1.63977, -0.2068537, 1, 1, 1, 1, 1,
1.206339, 0.23484, 0.7050008, 1, 1, 1, 1, 1,
1.208869, 0.8656389, 1.68623, 1, 1, 1, 1, 1,
1.213747, 0.006779453, 2.243161, 1, 1, 1, 1, 1,
1.215083, 0.4623547, 1.382764, 1, 1, 1, 1, 1,
1.216974, -0.01779983, 0.4224451, 1, 1, 1, 1, 1,
1.230601, -0.2205386, 1.012731, 1, 1, 1, 1, 1,
1.233102, 0.4763258, 1.724479, 1, 1, 1, 1, 1,
1.238913, 2.993222, -0.01012336, 1, 1, 1, 1, 1,
1.241213, 0.4675393, 1.792462, 1, 1, 1, 1, 1,
1.260666, 1.058802, 0.3474923, 1, 1, 1, 1, 1,
1.261014, -0.2649994, 1.456115, 1, 1, 1, 1, 1,
1.2617, -0.4571334, -0.0592474, 1, 1, 1, 1, 1,
1.262722, 0.9391065, 0.9042027, 1, 1, 1, 1, 1,
1.273134, -0.8085624, 1.437317, 1, 1, 1, 1, 1,
1.277486, -0.4202912, 2.04108, 0, 0, 1, 1, 1,
1.280337, 0.2562261, 2.761605, 1, 0, 0, 1, 1,
1.285976, -0.6743826, 1.792904, 1, 0, 0, 1, 1,
1.287014, 0.4791589, 0.3724773, 1, 0, 0, 1, 1,
1.298892, -1.059011, 0.4551566, 1, 0, 0, 1, 1,
1.302249, -0.8417397, 2.456553, 1, 0, 0, 1, 1,
1.309894, -0.2740474, 3.093488, 0, 0, 0, 1, 1,
1.316949, 0.437295, 2.304959, 0, 0, 0, 1, 1,
1.322172, -0.7577438, 2.369915, 0, 0, 0, 1, 1,
1.324663, -1.128903, 2.281869, 0, 0, 0, 1, 1,
1.326787, 0.3720643, -1.202226, 0, 0, 0, 1, 1,
1.331577, -0.3968995, 1.931848, 0, 0, 0, 1, 1,
1.332515, 0.02851902, 1.031874, 0, 0, 0, 1, 1,
1.335785, 1.49784, 2.552302, 1, 1, 1, 1, 1,
1.337494, -0.2888297, 0.6061502, 1, 1, 1, 1, 1,
1.337534, 0.2494003, -0.5462878, 1, 1, 1, 1, 1,
1.339586, 0.04252471, 1.50528, 1, 1, 1, 1, 1,
1.345969, 1.20309, 2.217255, 1, 1, 1, 1, 1,
1.346267, 2.425815, 1.523769, 1, 1, 1, 1, 1,
1.347013, -0.07333273, 0.7565091, 1, 1, 1, 1, 1,
1.350976, -0.437708, 1.452907, 1, 1, 1, 1, 1,
1.364058, 0.1785184, 0.6786189, 1, 1, 1, 1, 1,
1.367835, 2.076609, 0.2770784, 1, 1, 1, 1, 1,
1.373301, 0.8213365, 2.014121, 1, 1, 1, 1, 1,
1.393997, -0.86448, 1.086569, 1, 1, 1, 1, 1,
1.396857, -1.868614, -0.4134024, 1, 1, 1, 1, 1,
1.397677, 0.6090596, 1.750231, 1, 1, 1, 1, 1,
1.400954, 0.7704693, 1.21008, 1, 1, 1, 1, 1,
1.405342, -0.7877312, 0.7580857, 0, 0, 1, 1, 1,
1.416087, -0.602832, 1.691354, 1, 0, 0, 1, 1,
1.417966, -1.517058, -0.3111163, 1, 0, 0, 1, 1,
1.420399, -2.079973, 2.283323, 1, 0, 0, 1, 1,
1.428793, 0.1246118, 1.536052, 1, 0, 0, 1, 1,
1.431071, 0.1543355, 1.011215, 1, 0, 0, 1, 1,
1.438076, 1.156566, -0.03608595, 0, 0, 0, 1, 1,
1.440015, 1.014578, 1.345432, 0, 0, 0, 1, 1,
1.444941, 0.3042679, -0.05731869, 0, 0, 0, 1, 1,
1.447635, 0.9463012, -0.4288551, 0, 0, 0, 1, 1,
1.456153, 0.9020206, 1.56185, 0, 0, 0, 1, 1,
1.456505, -0.790574, 3.025792, 0, 0, 0, 1, 1,
1.457119, -0.2698824, 2.015223, 0, 0, 0, 1, 1,
1.469419, 0.6634551, 1.405515, 1, 1, 1, 1, 1,
1.481371, 0.2893273, 1.260931, 1, 1, 1, 1, 1,
1.491766, 0.1880355, -0.6780077, 1, 1, 1, 1, 1,
1.496726, -0.4147334, 1.702973, 1, 1, 1, 1, 1,
1.503654, -1.565849, 1.455684, 1, 1, 1, 1, 1,
1.503849, -0.3565048, 0.8563128, 1, 1, 1, 1, 1,
1.531801, -0.5799484, 3.787257, 1, 1, 1, 1, 1,
1.541628, -0.6016037, 1.705502, 1, 1, 1, 1, 1,
1.549625, 1.088022, 1.212178, 1, 1, 1, 1, 1,
1.561999, -0.1732577, 1.235602, 1, 1, 1, 1, 1,
1.566814, 0.3984175, 0.2041087, 1, 1, 1, 1, 1,
1.57996, 0.05096281, 1.686521, 1, 1, 1, 1, 1,
1.585842, -0.001488328, -0.9772159, 1, 1, 1, 1, 1,
1.589146, 0.9193805, 0.9453216, 1, 1, 1, 1, 1,
1.590878, 0.4656989, 2.089684, 1, 1, 1, 1, 1,
1.615338, 1.158273, 0.8410352, 0, 0, 1, 1, 1,
1.617734, 0.3499252, 1.772305, 1, 0, 0, 1, 1,
1.641444, -2.209648, 1.308231, 1, 0, 0, 1, 1,
1.646003, 1.16261, 0.2267698, 1, 0, 0, 1, 1,
1.654795, 1.077834, 0.8001438, 1, 0, 0, 1, 1,
1.657881, -2.103709, 2.135757, 1, 0, 0, 1, 1,
1.67591, 0.280988, 2.051414, 0, 0, 0, 1, 1,
1.677114, 0.3457285, 1.528948, 0, 0, 0, 1, 1,
1.680126, 0.2039517, -0.1244134, 0, 0, 0, 1, 1,
1.700308, -0.2096315, 2.187104, 0, 0, 0, 1, 1,
1.714307, -1.326076, 2.018736, 0, 0, 0, 1, 1,
1.735904, -0.4262212, 2.15196, 0, 0, 0, 1, 1,
1.739596, 0.12113, 1.776124, 0, 0, 0, 1, 1,
1.740915, 0.5981191, 1.033167, 1, 1, 1, 1, 1,
1.74565, -0.1157795, 1.132519, 1, 1, 1, 1, 1,
1.763049, 1.490044, 1.410963, 1, 1, 1, 1, 1,
1.782018, -0.1766198, 2.278098, 1, 1, 1, 1, 1,
1.785589, -0.8666416, 2.688022, 1, 1, 1, 1, 1,
1.825204, -0.4152129, 3.913014, 1, 1, 1, 1, 1,
1.832383, 0.8414769, 2.59664, 1, 1, 1, 1, 1,
1.836241, -0.8454025, 2.207846, 1, 1, 1, 1, 1,
1.839498, 0.2895545, 2.562028, 1, 1, 1, 1, 1,
1.853691, 0.8349789, 0.6650167, 1, 1, 1, 1, 1,
1.858109, -0.7391011, 1.72058, 1, 1, 1, 1, 1,
1.86487, 0.9499844, 1.707179, 1, 1, 1, 1, 1,
1.866627, -0.08217563, 2.19471, 1, 1, 1, 1, 1,
1.876272, -1.296998, 2.370225, 1, 1, 1, 1, 1,
1.88721, -0.9100024, 1.496487, 1, 1, 1, 1, 1,
1.889333, -0.6560509, 2.510441, 0, 0, 1, 1, 1,
1.908143, -1.336388, -0.2849406, 1, 0, 0, 1, 1,
1.918073, -0.5841879, 3.773732, 1, 0, 0, 1, 1,
1.9466, -1.410804, 1.357942, 1, 0, 0, 1, 1,
1.948075, -1.202723, 1.490047, 1, 0, 0, 1, 1,
1.952359, -1.514131, 1.494066, 1, 0, 0, 1, 1,
2.012618, -0.836151, 1.946696, 0, 0, 0, 1, 1,
2.024159, -1.010738, 1.167915, 0, 0, 0, 1, 1,
2.056572, -1.177067, 3.188654, 0, 0, 0, 1, 1,
2.190121, 0.612285, 1.705449, 0, 0, 0, 1, 1,
2.204906, -0.792454, 1.883785, 0, 0, 0, 1, 1,
2.283109, -1.014059, 1.203392, 0, 0, 0, 1, 1,
2.386417, 1.574803, 0.9306632, 0, 0, 0, 1, 1,
2.429909, 0.200886, 1.778538, 1, 1, 1, 1, 1,
2.466416, 0.09089562, 3.656217, 1, 1, 1, 1, 1,
2.485795, -1.563158, 1.836449, 1, 1, 1, 1, 1,
2.533819, -0.4256386, 1.489262, 1, 1, 1, 1, 1,
2.714344, -0.368042, 1.908799, 1, 1, 1, 1, 1,
2.735166, -1.984051, 1.738707, 1, 1, 1, 1, 1,
2.82318, -0.4624444, -0.4117188, 1, 1, 1, 1, 1
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
var radius = 9.541739;
var distance = 33.51495;
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
mvMatrix.translate( 0.1508436, 0.3292153, 0.1015391 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.51495);
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
