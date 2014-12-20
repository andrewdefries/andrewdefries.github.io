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
-3.212629, -1.563045, -4.421343, 1, 0, 0, 1,
-3.052432, -1.286435, -2.434342, 1, 0.007843138, 0, 1,
-2.994861, -0.5485001, -0.190635, 1, 0.01176471, 0, 1,
-2.856369, 0.1556903, 0.2433512, 1, 0.01960784, 0, 1,
-2.599278, 1.794002, -2.429822, 1, 0.02352941, 0, 1,
-2.574427, 0.7283502, -0.9451553, 1, 0.03137255, 0, 1,
-2.561374, -0.4230785, 0.07706854, 1, 0.03529412, 0, 1,
-2.539465, -1.319806, -2.949128, 1, 0.04313726, 0, 1,
-2.496528, -1.026438, -2.844256, 1, 0.04705882, 0, 1,
-2.49167, 0.8136932, -1.739887, 1, 0.05490196, 0, 1,
-2.327916, -0.2020074, -1.860565, 1, 0.05882353, 0, 1,
-2.260737, -1.095024, -0.8935618, 1, 0.06666667, 0, 1,
-2.209637, 1.658031, -0.2884168, 1, 0.07058824, 0, 1,
-2.076323, 1.008561, 0.2678403, 1, 0.07843138, 0, 1,
-2.036792, 0.02453697, -3.944027, 1, 0.08235294, 0, 1,
-1.990401, 0.4926112, -2.679578, 1, 0.09019608, 0, 1,
-1.988509, -0.7310612, -2.711478, 1, 0.09411765, 0, 1,
-1.973448, -2.387177, -2.151906, 1, 0.1019608, 0, 1,
-1.957302, -0.4836022, -2.059258, 1, 0.1098039, 0, 1,
-1.955502, -0.5084919, -3.92598, 1, 0.1137255, 0, 1,
-1.936972, 0.3157385, -1.91893, 1, 0.1215686, 0, 1,
-1.930334, -0.2153204, -1.990824, 1, 0.1254902, 0, 1,
-1.898212, -2.020362, -3.372548, 1, 0.1333333, 0, 1,
-1.874978, -1.097283, -3.67948, 1, 0.1372549, 0, 1,
-1.857682, -2.408313, -1.34831, 1, 0.145098, 0, 1,
-1.848603, -2.046172, -0.07251034, 1, 0.1490196, 0, 1,
-1.848191, 0.0458086, -1.467828, 1, 0.1568628, 0, 1,
-1.841256, -0.1454595, -0.2551137, 1, 0.1607843, 0, 1,
-1.837897, -0.6848294, -1.306542, 1, 0.1686275, 0, 1,
-1.836419, 1.232537, -0.8264786, 1, 0.172549, 0, 1,
-1.815162, -0.2453345, -2.717088, 1, 0.1803922, 0, 1,
-1.796616, 1.14741, -1.232316, 1, 0.1843137, 0, 1,
-1.783883, -1.351432, -2.620499, 1, 0.1921569, 0, 1,
-1.747012, -1.403761, -2.339258, 1, 0.1960784, 0, 1,
-1.73961, 1.566928, -0.7177843, 1, 0.2039216, 0, 1,
-1.733074, -1.186726, -2.659135, 1, 0.2117647, 0, 1,
-1.732136, 0.4968009, -1.770737, 1, 0.2156863, 0, 1,
-1.728809, -0.5140014, -0.8072412, 1, 0.2235294, 0, 1,
-1.714731, 0.1586563, -0.4343103, 1, 0.227451, 0, 1,
-1.696087, 1.385681, -0.5524704, 1, 0.2352941, 0, 1,
-1.684209, 0.1858294, -1.371206, 1, 0.2392157, 0, 1,
-1.6672, 0.3262643, -1.378076, 1, 0.2470588, 0, 1,
-1.65941, -0.2967319, -1.642676, 1, 0.2509804, 0, 1,
-1.652203, -0.151812, -2.561235, 1, 0.2588235, 0, 1,
-1.648137, 1.141761, -0.6403877, 1, 0.2627451, 0, 1,
-1.633963, 0.1860269, 0.07496072, 1, 0.2705882, 0, 1,
-1.614247, -3.854069, -2.642123, 1, 0.2745098, 0, 1,
-1.596006, 0.5911341, -2.427228, 1, 0.282353, 0, 1,
-1.595235, 1.024567, -2.075742, 1, 0.2862745, 0, 1,
-1.584907, -0.3193498, -0.9050385, 1, 0.2941177, 0, 1,
-1.578809, -0.7506077, -1.140909, 1, 0.3019608, 0, 1,
-1.572758, -0.8947731, -2.472014, 1, 0.3058824, 0, 1,
-1.552356, 0.01717153, -3.325284, 1, 0.3137255, 0, 1,
-1.551758, -0.4153177, -2.048783, 1, 0.3176471, 0, 1,
-1.551085, 1.553506, -0.1533197, 1, 0.3254902, 0, 1,
-1.549057, 0.376541, 0.17029, 1, 0.3294118, 0, 1,
-1.548493, -0.175294, -0.7431421, 1, 0.3372549, 0, 1,
-1.536331, 0.5901982, -2.252169, 1, 0.3411765, 0, 1,
-1.535059, -0.02596345, -2.075295, 1, 0.3490196, 0, 1,
-1.532526, -1.289846, -4.369933, 1, 0.3529412, 0, 1,
-1.531815, -0.7234566, -2.658326, 1, 0.3607843, 0, 1,
-1.528862, -1.060317, -2.491844, 1, 0.3647059, 0, 1,
-1.510578, -0.8575284, -2.970481, 1, 0.372549, 0, 1,
-1.503188, 0.2450856, -0.7432662, 1, 0.3764706, 0, 1,
-1.500737, -0.539775, -0.5398323, 1, 0.3843137, 0, 1,
-1.493866, 1.596937, 0.05405934, 1, 0.3882353, 0, 1,
-1.492444, -0.1381008, -1.086909, 1, 0.3960784, 0, 1,
-1.47106, -0.7805762, -3.421613, 1, 0.4039216, 0, 1,
-1.467295, -2.029287, -1.054815, 1, 0.4078431, 0, 1,
-1.457825, 1.100104, -0.7110591, 1, 0.4156863, 0, 1,
-1.445855, -0.30408, -0.5073052, 1, 0.4196078, 0, 1,
-1.420881, 0.2783804, -1.367948, 1, 0.427451, 0, 1,
-1.419579, -0.1552827, -2.551049, 1, 0.4313726, 0, 1,
-1.397281, 1.981623, -0.5155566, 1, 0.4392157, 0, 1,
-1.396173, 2.584634, 0.3736762, 1, 0.4431373, 0, 1,
-1.395712, -0.1720879, -1.064199, 1, 0.4509804, 0, 1,
-1.387489, 0.8431742, -1.797415, 1, 0.454902, 0, 1,
-1.382502, 0.7661918, -1.088785, 1, 0.4627451, 0, 1,
-1.368426, 1.025175, -1.038658, 1, 0.4666667, 0, 1,
-1.367147, -0.7540734, -2.03778, 1, 0.4745098, 0, 1,
-1.364434, -0.1396735, -1.74714, 1, 0.4784314, 0, 1,
-1.36047, 0.3782377, -0.6753675, 1, 0.4862745, 0, 1,
-1.357707, 1.250841, -2.585806, 1, 0.4901961, 0, 1,
-1.35015, 1.161761, 0.2366877, 1, 0.4980392, 0, 1,
-1.348569, 1.625912, -1.539338, 1, 0.5058824, 0, 1,
-1.337644, -1.400425, -2.678594, 1, 0.509804, 0, 1,
-1.327656, 0.9359931, 0.6980044, 1, 0.5176471, 0, 1,
-1.320404, -0.3748282, -1.583147, 1, 0.5215687, 0, 1,
-1.309578, -0.789056, -1.68011, 1, 0.5294118, 0, 1,
-1.309396, 0.5545016, 0.9752376, 1, 0.5333334, 0, 1,
-1.303916, 0.04379728, -0.4857931, 1, 0.5411765, 0, 1,
-1.301372, 0.3386786, -1.868845, 1, 0.5450981, 0, 1,
-1.294667, -0.7570639, -3.326841, 1, 0.5529412, 0, 1,
-1.292055, 0.2745347, -0.5258893, 1, 0.5568628, 0, 1,
-1.287213, -2.141067, -3.94035, 1, 0.5647059, 0, 1,
-1.286595, 0.8673949, 0.06624221, 1, 0.5686275, 0, 1,
-1.284445, 0.7722874, 0.5484003, 1, 0.5764706, 0, 1,
-1.278738, 0.2170711, 0.179084, 1, 0.5803922, 0, 1,
-1.275206, -0.6737605, -2.754516, 1, 0.5882353, 0, 1,
-1.25856, 0.9345822, 0.4882403, 1, 0.5921569, 0, 1,
-1.254586, 0.7846592, -1.6313, 1, 0.6, 0, 1,
-1.25353, 0.4027385, -0.3233937, 1, 0.6078432, 0, 1,
-1.233573, -0.2245881, -0.7321323, 1, 0.6117647, 0, 1,
-1.225525, 1.080559, -0.6596153, 1, 0.6196079, 0, 1,
-1.221296, 0.0215536, -1.277138, 1, 0.6235294, 0, 1,
-1.215771, -1.006379, -1.667763, 1, 0.6313726, 0, 1,
-1.21045, 0.8402022, -1.598023, 1, 0.6352941, 0, 1,
-1.204986, -0.1878416, -1.973603, 1, 0.6431373, 0, 1,
-1.200101, 0.3613513, -2.073798, 1, 0.6470588, 0, 1,
-1.193112, -0.64083, -3.81327, 1, 0.654902, 0, 1,
-1.190059, 0.1669458, -0.8509486, 1, 0.6588235, 0, 1,
-1.177729, 1.059462, 0.4258586, 1, 0.6666667, 0, 1,
-1.170716, -0.1807576, -0.6816179, 1, 0.6705883, 0, 1,
-1.161369, -0.09085736, -2.01678, 1, 0.6784314, 0, 1,
-1.159883, -1.0106, -2.073657, 1, 0.682353, 0, 1,
-1.157888, -0.9834701, -2.171549, 1, 0.6901961, 0, 1,
-1.155617, 0.1926178, -1.599669, 1, 0.6941177, 0, 1,
-1.15451, 1.082985, -0.7776993, 1, 0.7019608, 0, 1,
-1.153107, 0.04149402, -1.325823, 1, 0.7098039, 0, 1,
-1.152934, -0.1329874, -1.706629, 1, 0.7137255, 0, 1,
-1.151129, -0.6185927, -0.6279296, 1, 0.7215686, 0, 1,
-1.149749, 1.799431, -1.487395, 1, 0.7254902, 0, 1,
-1.146321, 0.848621, -1.522868, 1, 0.7333333, 0, 1,
-1.145301, -0.1646127, -1.786451, 1, 0.7372549, 0, 1,
-1.144598, -0.007353851, -0.7070064, 1, 0.7450981, 0, 1,
-1.143755, 1.128314, 0.5444858, 1, 0.7490196, 0, 1,
-1.141058, -1.030959, -2.609852, 1, 0.7568628, 0, 1,
-1.133334, 0.7590544, -0.2936285, 1, 0.7607843, 0, 1,
-1.129946, -0.09515493, -0.7450679, 1, 0.7686275, 0, 1,
-1.122115, -0.5391604, -1.680359, 1, 0.772549, 0, 1,
-1.1216, -0.3314342, -2.746454, 1, 0.7803922, 0, 1,
-1.121557, 1.16808, -1.383238, 1, 0.7843137, 0, 1,
-1.119583, -1.578069, -2.751061, 1, 0.7921569, 0, 1,
-1.112516, 0.2478872, -2.180199, 1, 0.7960784, 0, 1,
-1.111244, -1.56876, -2.332074, 1, 0.8039216, 0, 1,
-1.110749, 0.1567293, -0.9282377, 1, 0.8117647, 0, 1,
-1.106944, -0.8388748, -3.427759, 1, 0.8156863, 0, 1,
-1.099857, -0.7828301, -3.469445, 1, 0.8235294, 0, 1,
-1.098966, -0.2080769, -1.407847, 1, 0.827451, 0, 1,
-1.095167, -0.7430413, -2.169658, 1, 0.8352941, 0, 1,
-1.092806, -0.03600657, -1.910135, 1, 0.8392157, 0, 1,
-1.090996, -0.08326925, -0.7951521, 1, 0.8470588, 0, 1,
-1.089619, -0.0498804, -1.059819, 1, 0.8509804, 0, 1,
-1.087092, -2.436734, -3.3275, 1, 0.8588235, 0, 1,
-1.082549, 0.3948116, -1.741119, 1, 0.8627451, 0, 1,
-1.076387, 0.2642007, -2.044003, 1, 0.8705882, 0, 1,
-1.068638, -0.3431993, -3.242001, 1, 0.8745098, 0, 1,
-1.067871, -0.4690817, -1.691118, 1, 0.8823529, 0, 1,
-1.063253, -0.8069294, -3.893918, 1, 0.8862745, 0, 1,
-1.062732, -1.403328, -1.757344, 1, 0.8941177, 0, 1,
-1.059492, 2.402221, -1.445076, 1, 0.8980392, 0, 1,
-1.056626, 0.335648, 0.5401084, 1, 0.9058824, 0, 1,
-1.054341, -2.339582, -2.280871, 1, 0.9137255, 0, 1,
-1.054185, 1.846257, -1.169735, 1, 0.9176471, 0, 1,
-1.033084, 0.1925138, -1.418314, 1, 0.9254902, 0, 1,
-1.03018, -1.045056, -2.5444, 1, 0.9294118, 0, 1,
-1.016251, 0.1886431, -1.193982, 1, 0.9372549, 0, 1,
-1.01113, 0.618595, 0.1919729, 1, 0.9411765, 0, 1,
-1.010422, 0.5013664, -1.019454, 1, 0.9490196, 0, 1,
-1.008673, 0.3885665, -0.2337583, 1, 0.9529412, 0, 1,
-1.006435, 0.7039732, -1.682468, 1, 0.9607843, 0, 1,
-1.004041, -0.5450874, -1.528891, 1, 0.9647059, 0, 1,
-1.003014, -1.273884, -4.88212, 1, 0.972549, 0, 1,
-1.001726, 1.125415, -0.8383113, 1, 0.9764706, 0, 1,
-1.000304, -0.322744, -1.90777, 1, 0.9843137, 0, 1,
-0.9995422, -0.3927156, -2.582452, 1, 0.9882353, 0, 1,
-0.9958465, 0.1469181, -1.744179, 1, 0.9960784, 0, 1,
-0.9951076, 0.08105555, -2.968201, 0.9960784, 1, 0, 1,
-0.9941128, -0.06169357, 0.002545416, 0.9921569, 1, 0, 1,
-0.993157, 0.8229603, 0.6499549, 0.9843137, 1, 0, 1,
-0.9893985, -2.389844, -1.794702, 0.9803922, 1, 0, 1,
-0.9881096, 0.3822655, -1.100201, 0.972549, 1, 0, 1,
-0.987592, 1.924545, -2.558078, 0.9686275, 1, 0, 1,
-0.98159, 0.7448925, -0.2754727, 0.9607843, 1, 0, 1,
-0.9753936, -1.462387, -2.438868, 0.9568627, 1, 0, 1,
-0.9751574, 0.3468293, -0.8198164, 0.9490196, 1, 0, 1,
-0.9749052, 0.7812428, -1.04491, 0.945098, 1, 0, 1,
-0.9742621, -0.559635, -3.013079, 0.9372549, 1, 0, 1,
-0.960742, 0.368027, 0.4119774, 0.9333333, 1, 0, 1,
-0.9594837, -2.803064, -2.255235, 0.9254902, 1, 0, 1,
-0.9541352, 0.6286476, -0.4298778, 0.9215686, 1, 0, 1,
-0.9496745, -0.4589576, -2.854816, 0.9137255, 1, 0, 1,
-0.9481847, -2.711894, -2.378978, 0.9098039, 1, 0, 1,
-0.9480937, -0.1204954, -0.8383061, 0.9019608, 1, 0, 1,
-0.9457237, 0.8633382, -1.603549, 0.8941177, 1, 0, 1,
-0.9415931, -1.015975, -1.360428, 0.8901961, 1, 0, 1,
-0.9394329, -1.399058, -3.892808, 0.8823529, 1, 0, 1,
-0.9356955, -0.06927286, -0.626586, 0.8784314, 1, 0, 1,
-0.9353511, 0.6460614, -1.249258, 0.8705882, 1, 0, 1,
-0.935208, -0.6090164, -2.010679, 0.8666667, 1, 0, 1,
-0.9333653, -0.5714078, -1.958918, 0.8588235, 1, 0, 1,
-0.9296888, 0.5573388, -1.591974, 0.854902, 1, 0, 1,
-0.927294, 0.2091258, -1.327514, 0.8470588, 1, 0, 1,
-0.9259923, -1.137265, -3.106107, 0.8431373, 1, 0, 1,
-0.9256094, -0.6827763, -3.048, 0.8352941, 1, 0, 1,
-0.9254004, -1.531531, -2.284021, 0.8313726, 1, 0, 1,
-0.9130047, -0.8962786, -2.260248, 0.8235294, 1, 0, 1,
-0.9114413, 1.139381, -0.5154219, 0.8196079, 1, 0, 1,
-0.9079946, 0.2734565, -1.570693, 0.8117647, 1, 0, 1,
-0.9078574, 0.9478591, -0.9584989, 0.8078431, 1, 0, 1,
-0.9074988, 0.116333, -2.514486, 0.8, 1, 0, 1,
-0.898936, -1.939971, -1.184029, 0.7921569, 1, 0, 1,
-0.8964161, 1.908708, -0.5809345, 0.7882353, 1, 0, 1,
-0.8960245, -1.602435, -3.460849, 0.7803922, 1, 0, 1,
-0.8934434, 0.02627162, -1.980168, 0.7764706, 1, 0, 1,
-0.880209, 0.4715055, -1.606046, 0.7686275, 1, 0, 1,
-0.8736668, -1.462793, -3.349177, 0.7647059, 1, 0, 1,
-0.8730231, 1.97662, -0.2033673, 0.7568628, 1, 0, 1,
-0.8719786, -1.426713, -2.96544, 0.7529412, 1, 0, 1,
-0.8714615, 0.02804966, -2.393183, 0.7450981, 1, 0, 1,
-0.8710161, 1.123882, 1.486947, 0.7411765, 1, 0, 1,
-0.8686126, 1.094776, 0.80016, 0.7333333, 1, 0, 1,
-0.8574551, -0.8227277, -3.042984, 0.7294118, 1, 0, 1,
-0.857155, -0.1375842, -1.050475, 0.7215686, 1, 0, 1,
-0.8511416, 0.2096841, -0.9869545, 0.7176471, 1, 0, 1,
-0.8507413, -1.558724, -3.630536, 0.7098039, 1, 0, 1,
-0.8506606, -1.038154, -1.838457, 0.7058824, 1, 0, 1,
-0.8472151, 1.28262, -1.682513, 0.6980392, 1, 0, 1,
-0.8425202, -0.110937, -0.5086936, 0.6901961, 1, 0, 1,
-0.839943, 0.216101, -1.24182, 0.6862745, 1, 0, 1,
-0.8321674, 2.360007, -0.2112469, 0.6784314, 1, 0, 1,
-0.8317042, -2.197022, -1.463946, 0.6745098, 1, 0, 1,
-0.8282229, 0.4799331, -2.199103, 0.6666667, 1, 0, 1,
-0.8276057, -0.7465128, -1.784789, 0.6627451, 1, 0, 1,
-0.8266069, 0.03098203, -0.9566378, 0.654902, 1, 0, 1,
-0.8220593, 0.8893969, 0.3078916, 0.6509804, 1, 0, 1,
-0.8195282, 2.332741, 0.3517263, 0.6431373, 1, 0, 1,
-0.8185927, -0.914128, -1.759552, 0.6392157, 1, 0, 1,
-0.8150125, 0.9580792, -0.9093521, 0.6313726, 1, 0, 1,
-0.8144138, -0.7262818, -2.892888, 0.627451, 1, 0, 1,
-0.8106124, 1.369197, -0.3643627, 0.6196079, 1, 0, 1,
-0.8059679, -0.7457188, -1.540394, 0.6156863, 1, 0, 1,
-0.8023818, -0.9065802, -1.864722, 0.6078432, 1, 0, 1,
-0.7943558, -0.4890509, -2.732218, 0.6039216, 1, 0, 1,
-0.7910863, 1.779306, 0.6521646, 0.5960785, 1, 0, 1,
-0.7897425, 0.3168831, -1.181442, 0.5882353, 1, 0, 1,
-0.7890483, -0.03939801, -1.191944, 0.5843138, 1, 0, 1,
-0.7875152, -1.73875, -2.613647, 0.5764706, 1, 0, 1,
-0.7852973, -1.31799, -2.117405, 0.572549, 1, 0, 1,
-0.7669929, -0.3943495, -3.48143, 0.5647059, 1, 0, 1,
-0.7557032, -0.8140129, -1.873531, 0.5607843, 1, 0, 1,
-0.7521918, 0.9362037, -0.2084007, 0.5529412, 1, 0, 1,
-0.7504947, -0.5802893, -2.40407, 0.5490196, 1, 0, 1,
-0.7486731, 0.7856872, 0.442417, 0.5411765, 1, 0, 1,
-0.746919, 0.6544232, -1.063482, 0.5372549, 1, 0, 1,
-0.7455914, 1.472801, -0.5940598, 0.5294118, 1, 0, 1,
-0.7392951, -0.3664205, -1.760736, 0.5254902, 1, 0, 1,
-0.7376162, -1.940706, -2.73351, 0.5176471, 1, 0, 1,
-0.7287509, -1.881803, -3.574597, 0.5137255, 1, 0, 1,
-0.7260685, 0.3254182, -1.159635, 0.5058824, 1, 0, 1,
-0.7235097, -0.08965896, -2.411044, 0.5019608, 1, 0, 1,
-0.7210974, -1.086772, -2.436148, 0.4941176, 1, 0, 1,
-0.7159851, 0.8075004, -1.786312, 0.4862745, 1, 0, 1,
-0.7121521, -0.02076213, -0.8150188, 0.4823529, 1, 0, 1,
-0.7118452, -0.4768614, -4.677945, 0.4745098, 1, 0, 1,
-0.7092463, 1.327147, 0.311614, 0.4705882, 1, 0, 1,
-0.7078945, -2.074107, -3.089034, 0.4627451, 1, 0, 1,
-0.7074014, -0.9468939, 0.1319767, 0.4588235, 1, 0, 1,
-0.7056053, -0.05972793, -1.264716, 0.4509804, 1, 0, 1,
-0.702031, 0.4869747, -0.8268908, 0.4470588, 1, 0, 1,
-0.6998907, 1.578967, -1.319775, 0.4392157, 1, 0, 1,
-0.6989447, -0.1331381, -2.278272, 0.4352941, 1, 0, 1,
-0.6965008, 0.8729145, 0.8034306, 0.427451, 1, 0, 1,
-0.6911899, -2.247018, -4.09621, 0.4235294, 1, 0, 1,
-0.6891959, -1.208504, -1.466023, 0.4156863, 1, 0, 1,
-0.6867748, 0.2378757, -1.279975, 0.4117647, 1, 0, 1,
-0.6853969, 1.10845, 0.8153266, 0.4039216, 1, 0, 1,
-0.6695997, 0.08373283, -3.336204, 0.3960784, 1, 0, 1,
-0.6693826, 0.253621, -1.666226, 0.3921569, 1, 0, 1,
-0.668081, -0.2742415, -0.6842016, 0.3843137, 1, 0, 1,
-0.6651299, 1.27175, -0.6900688, 0.3803922, 1, 0, 1,
-0.6643465, 0.6542999, -1.253813, 0.372549, 1, 0, 1,
-0.6612669, 0.8737001, -1.662106, 0.3686275, 1, 0, 1,
-0.6562901, 0.4555589, -1.462668, 0.3607843, 1, 0, 1,
-0.6533432, 0.5005852, -0.565551, 0.3568628, 1, 0, 1,
-0.6513866, 0.82188, 0.7658805, 0.3490196, 1, 0, 1,
-0.651112, -0.9459255, -2.397314, 0.345098, 1, 0, 1,
-0.6387248, -0.433948, -1.314919, 0.3372549, 1, 0, 1,
-0.6287593, -1.032508, -1.93444, 0.3333333, 1, 0, 1,
-0.6284992, -0.2915919, -2.469024, 0.3254902, 1, 0, 1,
-0.6199874, -0.0261084, -1.41142, 0.3215686, 1, 0, 1,
-0.6093939, 0.0324571, -1.34219, 0.3137255, 1, 0, 1,
-0.6093397, -2.485679, -4.823436, 0.3098039, 1, 0, 1,
-0.6058854, 0.1559689, -1.910751, 0.3019608, 1, 0, 1,
-0.6051536, -1.243985, -4.005198, 0.2941177, 1, 0, 1,
-0.6042612, 1.029665, 0.07387821, 0.2901961, 1, 0, 1,
-0.5994148, -1.070195, -2.459118, 0.282353, 1, 0, 1,
-0.5947171, -0.2069542, -2.052063, 0.2784314, 1, 0, 1,
-0.5942136, 0.2969581, -1.29263, 0.2705882, 1, 0, 1,
-0.5919186, 1.933976, 0.8230562, 0.2666667, 1, 0, 1,
-0.582387, 1.000535, -0.3682784, 0.2588235, 1, 0, 1,
-0.5791938, -0.7891619, -3.357492, 0.254902, 1, 0, 1,
-0.5782885, -0.7939062, -3.382046, 0.2470588, 1, 0, 1,
-0.5747375, 0.2246147, -0.9571868, 0.2431373, 1, 0, 1,
-0.5741605, 1.679497, 0.2667728, 0.2352941, 1, 0, 1,
-0.5740417, 1.083941, -0.8385622, 0.2313726, 1, 0, 1,
-0.5711381, 1.594892, -2.279865, 0.2235294, 1, 0, 1,
-0.5639693, 0.2983176, -2.065641, 0.2196078, 1, 0, 1,
-0.5633574, -0.7866919, -1.579914, 0.2117647, 1, 0, 1,
-0.5622878, -1.694608, -3.179254, 0.2078431, 1, 0, 1,
-0.5606492, 0.1422667, -2.525775, 0.2, 1, 0, 1,
-0.5542029, 0.390792, 0.2275232, 0.1921569, 1, 0, 1,
-0.5489785, -1.133337, -4.081146, 0.1882353, 1, 0, 1,
-0.5477588, 0.5531777, -1.266469, 0.1803922, 1, 0, 1,
-0.5355388, -0.3131644, -1.516939, 0.1764706, 1, 0, 1,
-0.5259244, 0.5442215, -2.654693, 0.1686275, 1, 0, 1,
-0.5246519, -0.971986, -1.638013, 0.1647059, 1, 0, 1,
-0.5220222, -0.2180848, -0.08690776, 0.1568628, 1, 0, 1,
-0.51402, 0.4525363, -0.09025706, 0.1529412, 1, 0, 1,
-0.5133443, 0.06601254, -1.209475, 0.145098, 1, 0, 1,
-0.5129649, 1.004863, 1.339841, 0.1411765, 1, 0, 1,
-0.5123287, 0.7952785, -0.1801445, 0.1333333, 1, 0, 1,
-0.5077859, 0.3922358, 0.7600498, 0.1294118, 1, 0, 1,
-0.5029333, -0.3655194, -3.393808, 0.1215686, 1, 0, 1,
-0.5008014, 0.08297632, -1.096663, 0.1176471, 1, 0, 1,
-0.4993601, 0.03954565, -2.273806, 0.1098039, 1, 0, 1,
-0.4950043, -2.00701, -2.463256, 0.1058824, 1, 0, 1,
-0.4907145, 1.18273, -1.251839, 0.09803922, 1, 0, 1,
-0.4858952, -0.08288588, -1.220026, 0.09019608, 1, 0, 1,
-0.4830728, 0.3875243, -3.575521, 0.08627451, 1, 0, 1,
-0.482789, -0.698296, -4.081983, 0.07843138, 1, 0, 1,
-0.4816987, 0.5926836, 0.001419387, 0.07450981, 1, 0, 1,
-0.4748783, -0.8045449, -3.424468, 0.06666667, 1, 0, 1,
-0.4743446, -0.9801582, -2.293959, 0.0627451, 1, 0, 1,
-0.4728752, 0.9240108, -0.819958, 0.05490196, 1, 0, 1,
-0.4698614, 0.393662, -0.5317023, 0.05098039, 1, 0, 1,
-0.469005, -1.511652, -2.236965, 0.04313726, 1, 0, 1,
-0.4668013, -1.494111, -3.926365, 0.03921569, 1, 0, 1,
-0.4626008, -1.041522, -3.806007, 0.03137255, 1, 0, 1,
-0.4600506, 0.2811677, -0.9573247, 0.02745098, 1, 0, 1,
-0.4541755, 0.0614543, -1.738932, 0.01960784, 1, 0, 1,
-0.4529478, 0.4351567, 0.5151073, 0.01568628, 1, 0, 1,
-0.4494483, -1.014245, -1.840426, 0.007843138, 1, 0, 1,
-0.4478428, -0.1007361, -0.02240207, 0.003921569, 1, 0, 1,
-0.4450469, 0.498383, -2.213845, 0, 1, 0.003921569, 1,
-0.4425638, 0.3463533, -1.963881, 0, 1, 0.01176471, 1,
-0.438002, -0.4561834, -4.018611, 0, 1, 0.01568628, 1,
-0.4358318, 0.04133853, -2.159413, 0, 1, 0.02352941, 1,
-0.4349717, 0.9014433, -1.131611, 0, 1, 0.02745098, 1,
-0.4320754, 0.3126719, -1.403762, 0, 1, 0.03529412, 1,
-0.4275329, 0.2389302, -1.916107, 0, 1, 0.03921569, 1,
-0.4235458, -0.6320409, -0.9834845, 0, 1, 0.04705882, 1,
-0.4191479, 0.1459532, -0.9210915, 0, 1, 0.05098039, 1,
-0.4174057, -0.2921194, -1.33379, 0, 1, 0.05882353, 1,
-0.414527, 0.8885393, -1.164786, 0, 1, 0.0627451, 1,
-0.4119408, 1.968486, -0.7422242, 0, 1, 0.07058824, 1,
-0.4105904, 0.3063042, 1.374687, 0, 1, 0.07450981, 1,
-0.4099752, 0.9182979, 0.526821, 0, 1, 0.08235294, 1,
-0.408977, 1.728765, -0.6441802, 0, 1, 0.08627451, 1,
-0.4089661, -1.014122, -3.230253, 0, 1, 0.09411765, 1,
-0.4046686, -0.5226972, -3.155619, 0, 1, 0.1019608, 1,
-0.4028051, 0.6066738, -1.058194, 0, 1, 0.1058824, 1,
-0.3924689, -0.4874318, -4.284632, 0, 1, 0.1137255, 1,
-0.3921941, 0.6022884, -1.171587, 0, 1, 0.1176471, 1,
-0.3894058, 0.02176023, -1.771101, 0, 1, 0.1254902, 1,
-0.3864807, 0.9923619, -1.013131, 0, 1, 0.1294118, 1,
-0.3819043, 0.4293662, 0.1139751, 0, 1, 0.1372549, 1,
-0.3719032, 0.2411322, 0.2874103, 0, 1, 0.1411765, 1,
-0.3715466, -0.1194135, -1.934857, 0, 1, 0.1490196, 1,
-0.3692089, 0.5578225, -0.6687243, 0, 1, 0.1529412, 1,
-0.3679826, 1.948344, -0.384146, 0, 1, 0.1607843, 1,
-0.3662075, -0.3653682, -2.714411, 0, 1, 0.1647059, 1,
-0.3650842, 0.4920174, -0.764126, 0, 1, 0.172549, 1,
-0.363598, -1.139095, -3.972178, 0, 1, 0.1764706, 1,
-0.3586471, -0.9378715, -3.122253, 0, 1, 0.1843137, 1,
-0.3539031, -1.469188, -3.557817, 0, 1, 0.1882353, 1,
-0.3469701, -0.1131424, -1.144934, 0, 1, 0.1960784, 1,
-0.3387405, 1.630444, 0.9727857, 0, 1, 0.2039216, 1,
-0.3386604, -0.9478801, -3.898456, 0, 1, 0.2078431, 1,
-0.3365528, -0.3756679, -3.500675, 0, 1, 0.2156863, 1,
-0.3365345, 0.5191782, -0.8590282, 0, 1, 0.2196078, 1,
-0.334751, -0.944019, -3.429714, 0, 1, 0.227451, 1,
-0.3325177, -0.5758243, -3.229059, 0, 1, 0.2313726, 1,
-0.3306198, 2.094244, 0.2087001, 0, 1, 0.2392157, 1,
-0.3261422, 0.1739579, -0.6385084, 0, 1, 0.2431373, 1,
-0.3257921, 0.584501, 1.264638, 0, 1, 0.2509804, 1,
-0.3178981, 2.096646, -0.3050876, 0, 1, 0.254902, 1,
-0.3162386, 0.5762526, -0.1068207, 0, 1, 0.2627451, 1,
-0.3139329, -0.4439242, -2.502126, 0, 1, 0.2666667, 1,
-0.3132519, -0.0894038, -1.953956, 0, 1, 0.2745098, 1,
-0.3116035, 1.299715, -0.1186641, 0, 1, 0.2784314, 1,
-0.309638, 1.146237, -0.1696248, 0, 1, 0.2862745, 1,
-0.3077765, 0.1114409, -3.002076, 0, 1, 0.2901961, 1,
-0.2981568, -0.7032185, -3.641401, 0, 1, 0.2980392, 1,
-0.2967606, 0.8541103, -0.3232277, 0, 1, 0.3058824, 1,
-0.2961171, 0.4199263, -1.316199, 0, 1, 0.3098039, 1,
-0.2950405, 0.3124847, -2.974722, 0, 1, 0.3176471, 1,
-0.2907358, 0.7427795, 0.4577921, 0, 1, 0.3215686, 1,
-0.2907293, -0.7581314, -1.514201, 0, 1, 0.3294118, 1,
-0.2882625, -0.5673388, -1.51822, 0, 1, 0.3333333, 1,
-0.2881888, -0.2986014, -4.363939, 0, 1, 0.3411765, 1,
-0.2840089, 0.8999621, 0.3668995, 0, 1, 0.345098, 1,
-0.2805279, -0.4992193, -2.139451, 0, 1, 0.3529412, 1,
-0.2788916, -1.976532, -3.423592, 0, 1, 0.3568628, 1,
-0.2785225, 1.046365, 0.3496381, 0, 1, 0.3647059, 1,
-0.2780169, -1.338045, -2.673561, 0, 1, 0.3686275, 1,
-0.2775376, -0.7615583, -4.690757, 0, 1, 0.3764706, 1,
-0.275501, -0.845212, -2.176303, 0, 1, 0.3803922, 1,
-0.2740627, -0.2606655, -2.563913, 0, 1, 0.3882353, 1,
-0.2729789, 0.3177458, -0.1215228, 0, 1, 0.3921569, 1,
-0.2696843, 1.769839, -1.132382, 0, 1, 0.4, 1,
-0.2673168, 0.2535208, -0.715606, 0, 1, 0.4078431, 1,
-0.2649201, -0.6656588, -3.135993, 0, 1, 0.4117647, 1,
-0.2631024, 0.6851519, -0.9108171, 0, 1, 0.4196078, 1,
-0.2590153, 0.008238339, -3.108479, 0, 1, 0.4235294, 1,
-0.2574288, -1.150013, -2.767915, 0, 1, 0.4313726, 1,
-0.2535709, 1.810511, -0.2094858, 0, 1, 0.4352941, 1,
-0.251101, -1.286954, -3.047388, 0, 1, 0.4431373, 1,
-0.2449397, -0.4688809, -3.390639, 0, 1, 0.4470588, 1,
-0.2415659, 0.3160703, -1.270786, 0, 1, 0.454902, 1,
-0.2410215, 1.488284, 0.3453613, 0, 1, 0.4588235, 1,
-0.2381208, -0.8152732, -1.188602, 0, 1, 0.4666667, 1,
-0.2329928, -0.6844367, -5.433218, 0, 1, 0.4705882, 1,
-0.2301427, -0.1526718, -2.999942, 0, 1, 0.4784314, 1,
-0.2260274, 0.2478488, -1.674987, 0, 1, 0.4823529, 1,
-0.2231292, -1.633231, -2.935925, 0, 1, 0.4901961, 1,
-0.2228099, 0.09898617, -2.025794, 0, 1, 0.4941176, 1,
-0.2205205, 0.8385533, -1.838881, 0, 1, 0.5019608, 1,
-0.2183648, 0.9882651, -0.4741049, 0, 1, 0.509804, 1,
-0.2163362, 1.384824, 0.4793188, 0, 1, 0.5137255, 1,
-0.2156747, 0.9834377, 0.03100556, 0, 1, 0.5215687, 1,
-0.2140043, -0.3968718, -3.663244, 0, 1, 0.5254902, 1,
-0.2130119, 0.3220451, 0.4092427, 0, 1, 0.5333334, 1,
-0.2124867, 0.8583496, -1.670452, 0, 1, 0.5372549, 1,
-0.2102908, 1.2489, -1.025476, 0, 1, 0.5450981, 1,
-0.2063625, -0.6506345, -2.388994, 0, 1, 0.5490196, 1,
-0.2036023, 0.9031939, -1.305342, 0, 1, 0.5568628, 1,
-0.2028392, 0.7246494, 0.8795356, 0, 1, 0.5607843, 1,
-0.2028018, 0.1678486, -0.1381362, 0, 1, 0.5686275, 1,
-0.200925, 1.084735, -0.4762929, 0, 1, 0.572549, 1,
-0.2000971, -2.324781, -3.105274, 0, 1, 0.5803922, 1,
-0.1996328, 2.047404, -1.667278, 0, 1, 0.5843138, 1,
-0.1917655, 0.2635174, -0.60707, 0, 1, 0.5921569, 1,
-0.189666, -0.4639076, -2.460258, 0, 1, 0.5960785, 1,
-0.1889667, -0.2055479, -1.495912, 0, 1, 0.6039216, 1,
-0.1876385, 0.4398064, -0.05223678, 0, 1, 0.6117647, 1,
-0.1875516, -0.7149639, -3.983226, 0, 1, 0.6156863, 1,
-0.186594, 0.3552822, 0.9874461, 0, 1, 0.6235294, 1,
-0.1799704, 0.857954, 0.9854785, 0, 1, 0.627451, 1,
-0.1798635, 0.05651283, -1.902276, 0, 1, 0.6352941, 1,
-0.1768951, 0.2938258, -0.6238832, 0, 1, 0.6392157, 1,
-0.1728083, 0.6389348, 0.4109851, 0, 1, 0.6470588, 1,
-0.1694834, -0.4811413, -3.594753, 0, 1, 0.6509804, 1,
-0.1690931, -0.2637855, -3.740228, 0, 1, 0.6588235, 1,
-0.1689929, 0.912385, 0.681868, 0, 1, 0.6627451, 1,
-0.1683437, 0.2674522, 0.1029232, 0, 1, 0.6705883, 1,
-0.1676292, 0.6444963, 1.638232, 0, 1, 0.6745098, 1,
-0.164826, 0.3270458, -1.129935, 0, 1, 0.682353, 1,
-0.1644433, 0.4895196, -1.413996, 0, 1, 0.6862745, 1,
-0.1541336, -1.365978, -2.164741, 0, 1, 0.6941177, 1,
-0.1529346, 0.8854343, -1.08832, 0, 1, 0.7019608, 1,
-0.1518007, 0.3299142, -0.2489098, 0, 1, 0.7058824, 1,
-0.1508613, 0.4546588, 0.623714, 0, 1, 0.7137255, 1,
-0.1506414, 1.60288, -0.6535109, 0, 1, 0.7176471, 1,
-0.1478302, -0.8134902, -2.000124, 0, 1, 0.7254902, 1,
-0.1466306, -0.3217162, -2.272915, 0, 1, 0.7294118, 1,
-0.1369984, -0.2079166, -1.574318, 0, 1, 0.7372549, 1,
-0.13155, -1.055093, -1.724767, 0, 1, 0.7411765, 1,
-0.1269201, -2.315435, -2.3335, 0, 1, 0.7490196, 1,
-0.1251207, -0.5561115, -3.594909, 0, 1, 0.7529412, 1,
-0.1182112, -0.7968893, -2.340137, 0, 1, 0.7607843, 1,
-0.1170127, -0.08474429, -3.791738, 0, 1, 0.7647059, 1,
-0.1134276, 0.6084408, 1.55008, 0, 1, 0.772549, 1,
-0.1128595, -1.839919, -4.476006, 0, 1, 0.7764706, 1,
-0.1106759, -1.56332, -4.919503, 0, 1, 0.7843137, 1,
-0.1021124, 1.34955, -0.05756823, 0, 1, 0.7882353, 1,
-0.1007436, -0.4144448, -2.528567, 0, 1, 0.7960784, 1,
-0.09994789, 0.1915281, -1.122729, 0, 1, 0.8039216, 1,
-0.09897134, 1.082091, 1.141185, 0, 1, 0.8078431, 1,
-0.09824995, 0.3466958, -0.9953083, 0, 1, 0.8156863, 1,
-0.0946226, -0.8824804, -3.933564, 0, 1, 0.8196079, 1,
-0.09212251, 0.3242628, -1.069976, 0, 1, 0.827451, 1,
-0.0902741, -0.8681182, -4.372823, 0, 1, 0.8313726, 1,
-0.08944463, 2.846849, -0.6572464, 0, 1, 0.8392157, 1,
-0.08875276, -0.8013265, -2.808506, 0, 1, 0.8431373, 1,
-0.0871519, 0.2610023, 1.725416, 0, 1, 0.8509804, 1,
-0.08454129, -0.9087237, -0.0640827, 0, 1, 0.854902, 1,
-0.08251733, 0.1807259, -0.5273454, 0, 1, 0.8627451, 1,
-0.08168174, 1.327659, 0.5347354, 0, 1, 0.8666667, 1,
-0.07920046, 0.7574471, -0.05678999, 0, 1, 0.8745098, 1,
-0.07919294, -0.4118208, -0.7624761, 0, 1, 0.8784314, 1,
-0.07486053, 2.017578, 0.9902339, 0, 1, 0.8862745, 1,
-0.07404524, 0.2952439, 0.1777204, 0, 1, 0.8901961, 1,
-0.07192176, 2.724739, -1.438513, 0, 1, 0.8980392, 1,
-0.06556187, -0.09144624, -4.251056, 0, 1, 0.9058824, 1,
-0.06286973, 0.9967144, 0.1481595, 0, 1, 0.9098039, 1,
-0.0590664, 1.028618, -0.04791622, 0, 1, 0.9176471, 1,
-0.05273183, -1.816241, -1.636235, 0, 1, 0.9215686, 1,
-0.04881068, 0.06086047, 0.3472838, 0, 1, 0.9294118, 1,
-0.04366433, 0.3413459, -0.389535, 0, 1, 0.9333333, 1,
-0.03771777, -0.5636478, -2.240806, 0, 1, 0.9411765, 1,
-0.03287885, 0.02165217, -1.141919, 0, 1, 0.945098, 1,
-0.03186396, -2.472919, -2.014789, 0, 1, 0.9529412, 1,
-0.03186202, -0.1747449, -2.084898, 0, 1, 0.9568627, 1,
-0.03184465, -1.083127, -2.577227, 0, 1, 0.9647059, 1,
-0.02951667, 0.7007639, -1.480933, 0, 1, 0.9686275, 1,
-0.02871903, 0.7866031, 0.3812479, 0, 1, 0.9764706, 1,
-0.02561227, 0.4492672, 0.08999888, 0, 1, 0.9803922, 1,
-0.02554619, 0.3187306, 0.4742167, 0, 1, 0.9882353, 1,
-0.01997647, 0.4672064, -1.17782, 0, 1, 0.9921569, 1,
-0.01488559, -1.095681, -5.541061, 0, 1, 1, 1,
-0.009381136, -0.138738, -3.02097, 0, 0.9921569, 1, 1,
-0.001164264, -0.3472209, -3.715269, 0, 0.9882353, 1, 1,
0.001083383, -0.01511637, 3.12637, 0, 0.9803922, 1, 1,
0.002414719, 0.2719631, -0.7547295, 0, 0.9764706, 1, 1,
0.0048614, -1.103592, 3.173694, 0, 0.9686275, 1, 1,
0.008511601, 0.1704363, 2.171031, 0, 0.9647059, 1, 1,
0.01270162, -0.5920892, 1.024344, 0, 0.9568627, 1, 1,
0.01714294, 0.0104319, 1.407105, 0, 0.9529412, 1, 1,
0.01888185, 0.4520316, 0.9655136, 0, 0.945098, 1, 1,
0.01948213, -1.825327, 2.302523, 0, 0.9411765, 1, 1,
0.02244127, 0.2621311, -0.4881049, 0, 0.9333333, 1, 1,
0.02629318, 0.4790924, -0.7595299, 0, 0.9294118, 1, 1,
0.02759475, 0.2905112, -0.1372872, 0, 0.9215686, 1, 1,
0.02784683, -1.170129, 2.725728, 0, 0.9176471, 1, 1,
0.02869925, -0.7896934, 4.451443, 0, 0.9098039, 1, 1,
0.03340523, -1.927583, 4.268696, 0, 0.9058824, 1, 1,
0.03480143, -1.746485, 4.061464, 0, 0.8980392, 1, 1,
0.03872679, -0.9004667, 2.59427, 0, 0.8901961, 1, 1,
0.04384196, -0.09568501, 1.725999, 0, 0.8862745, 1, 1,
0.04438587, -1.095644, 4.017036, 0, 0.8784314, 1, 1,
0.04873835, -0.05722075, 2.249312, 0, 0.8745098, 1, 1,
0.05112103, 0.9122165, -1.239877, 0, 0.8666667, 1, 1,
0.05520837, 0.7563394, 0.2434807, 0, 0.8627451, 1, 1,
0.0616308, 1.587386, -0.8807385, 0, 0.854902, 1, 1,
0.06190575, -0.2788826, 2.366152, 0, 0.8509804, 1, 1,
0.06384966, -0.4300005, 2.865947, 0, 0.8431373, 1, 1,
0.06432772, -0.6517012, 3.740983, 0, 0.8392157, 1, 1,
0.06785586, -0.3760058, 3.795718, 0, 0.8313726, 1, 1,
0.0680019, 0.4845001, 0.6233861, 0, 0.827451, 1, 1,
0.06993881, 0.1315546, 2.006091, 0, 0.8196079, 1, 1,
0.07956029, 1.574215, 0.5525831, 0, 0.8156863, 1, 1,
0.08017704, 0.4201297, -0.4294846, 0, 0.8078431, 1, 1,
0.08273926, 0.5790374, -0.5000878, 0, 0.8039216, 1, 1,
0.08299772, -0.4184853, 4.465121, 0, 0.7960784, 1, 1,
0.0833791, -0.3636141, 3.01456, 0, 0.7882353, 1, 1,
0.08514396, -0.218634, 3.769454, 0, 0.7843137, 1, 1,
0.08578858, -1.093532, 2.684686, 0, 0.7764706, 1, 1,
0.08909249, -1.984921, 1.637581, 0, 0.772549, 1, 1,
0.09513164, 0.1037336, 1.682246, 0, 0.7647059, 1, 1,
0.09735464, -2.214019, 2.379481, 0, 0.7607843, 1, 1,
0.1089411, -0.2329554, 3.249744, 0, 0.7529412, 1, 1,
0.1105171, -2.133727, 4.307343, 0, 0.7490196, 1, 1,
0.1113921, 0.7763779, -0.6664247, 0, 0.7411765, 1, 1,
0.1190668, -1.072137, 3.221349, 0, 0.7372549, 1, 1,
0.1193686, 0.3610751, 0.9533222, 0, 0.7294118, 1, 1,
0.1220353, 0.5981416, 1.724242, 0, 0.7254902, 1, 1,
0.1317938, 0.6167458, -0.8052984, 0, 0.7176471, 1, 1,
0.1334228, 2.460294, -1.128074, 0, 0.7137255, 1, 1,
0.1372137, 0.7365047, 1.575264, 0, 0.7058824, 1, 1,
0.1372412, -0.05478041, 1.91591, 0, 0.6980392, 1, 1,
0.1387705, 0.6371605, -0.3590605, 0, 0.6941177, 1, 1,
0.1389846, -0.6070871, 2.976597, 0, 0.6862745, 1, 1,
0.1426208, 0.5961399, -0.1269335, 0, 0.682353, 1, 1,
0.1443924, -0.1075033, 3.231506, 0, 0.6745098, 1, 1,
0.1483055, 0.04688415, 1.765135, 0, 0.6705883, 1, 1,
0.1523753, -0.7593225, 2.882749, 0, 0.6627451, 1, 1,
0.1539779, 0.6894869, -0.4922811, 0, 0.6588235, 1, 1,
0.1544861, -1.973417, 1.956515, 0, 0.6509804, 1, 1,
0.1626211, 1.934518, 1.838746, 0, 0.6470588, 1, 1,
0.1684431, -1.259518, 3.935021, 0, 0.6392157, 1, 1,
0.1714686, 2.375324, 0.6085057, 0, 0.6352941, 1, 1,
0.1722742, 1.907682, -0.562646, 0, 0.627451, 1, 1,
0.1860308, -0.2263707, -0.02826259, 0, 0.6235294, 1, 1,
0.1884285, 1.797902, -0.5571477, 0, 0.6156863, 1, 1,
0.1928674, 0.5199486, 0.124038, 0, 0.6117647, 1, 1,
0.1936616, -0.3531377, 2.957294, 0, 0.6039216, 1, 1,
0.1942902, 0.9599359, -0.513613, 0, 0.5960785, 1, 1,
0.1945954, 0.02215443, 1.29223, 0, 0.5921569, 1, 1,
0.1947907, 0.2379845, 0.7351423, 0, 0.5843138, 1, 1,
0.1979173, -0.802063, 3.16359, 0, 0.5803922, 1, 1,
0.1999983, -1.617024, 4.557586, 0, 0.572549, 1, 1,
0.2085597, 0.2294394, 0.337275, 0, 0.5686275, 1, 1,
0.2107322, 1.335535, 0.4919279, 0, 0.5607843, 1, 1,
0.214494, 1.273981, 0.08697978, 0, 0.5568628, 1, 1,
0.2177636, -0.5187597, 3.220495, 0, 0.5490196, 1, 1,
0.2204137, 1.743879, -0.3917476, 0, 0.5450981, 1, 1,
0.2224795, -0.9589078, 4.380553, 0, 0.5372549, 1, 1,
0.2263962, -0.6123468, 3.494841, 0, 0.5333334, 1, 1,
0.2277335, -0.9786021, 2.735582, 0, 0.5254902, 1, 1,
0.2287645, -1.744187, 2.310932, 0, 0.5215687, 1, 1,
0.2289709, -1.321526, 1.241334, 0, 0.5137255, 1, 1,
0.2297556, 0.1759387, 1.107849, 0, 0.509804, 1, 1,
0.2305289, 1.304088, -0.4723603, 0, 0.5019608, 1, 1,
0.2346499, 0.270359, 0.2776739, 0, 0.4941176, 1, 1,
0.2361236, -0.1560689, 1.410255, 0, 0.4901961, 1, 1,
0.2375247, -0.03180894, 1.004889, 0, 0.4823529, 1, 1,
0.2382957, 0.81902, -0.2823158, 0, 0.4784314, 1, 1,
0.2385964, -0.3818209, 2.886781, 0, 0.4705882, 1, 1,
0.2409628, -1.618216, 3.759838, 0, 0.4666667, 1, 1,
0.2431554, -0.2784157, 0.321697, 0, 0.4588235, 1, 1,
0.2453644, -0.1537516, 3.505696, 0, 0.454902, 1, 1,
0.2465603, -1.955688, 3.741488, 0, 0.4470588, 1, 1,
0.2466369, -0.192569, 2.054996, 0, 0.4431373, 1, 1,
0.2478317, -1.471403, 3.041507, 0, 0.4352941, 1, 1,
0.2622361, -1.218712, 2.993823, 0, 0.4313726, 1, 1,
0.2678576, 0.8199121, 0.2763708, 0, 0.4235294, 1, 1,
0.2683551, -0.3435801, 1.993752, 0, 0.4196078, 1, 1,
0.2688377, -0.4405876, 2.350531, 0, 0.4117647, 1, 1,
0.2719662, -0.03564519, 2.205101, 0, 0.4078431, 1, 1,
0.2730708, 0.1984148, 2.157816, 0, 0.4, 1, 1,
0.2734102, 1.263968, 0.9001108, 0, 0.3921569, 1, 1,
0.2755746, -0.03510447, 0.854765, 0, 0.3882353, 1, 1,
0.2761361, -0.7179274, 1.540394, 0, 0.3803922, 1, 1,
0.2771564, 0.2530967, 1.658143, 0, 0.3764706, 1, 1,
0.2828221, 0.7633499, 1.387183, 0, 0.3686275, 1, 1,
0.2839395, -0.5381927, 2.973526, 0, 0.3647059, 1, 1,
0.2876749, 0.5726267, -0.1561667, 0, 0.3568628, 1, 1,
0.2890548, 0.04528176, 2.623953, 0, 0.3529412, 1, 1,
0.3001124, -0.5595217, 2.316872, 0, 0.345098, 1, 1,
0.3058071, -1.717522, 3.0825, 0, 0.3411765, 1, 1,
0.3080712, 0.6136008, 1.560766, 0, 0.3333333, 1, 1,
0.3136636, 0.02545617, 1.045554, 0, 0.3294118, 1, 1,
0.3147494, 0.5036924, 1.350125, 0, 0.3215686, 1, 1,
0.3174306, 1.276824, -0.8784038, 0, 0.3176471, 1, 1,
0.3183682, -2.175143, 3.909727, 0, 0.3098039, 1, 1,
0.3250052, 1.130473, -0.06794863, 0, 0.3058824, 1, 1,
0.3268846, 0.5906022, 2.331118, 0, 0.2980392, 1, 1,
0.3325914, 1.26187, 1.102847, 0, 0.2901961, 1, 1,
0.3326869, -0.190915, 2.435447, 0, 0.2862745, 1, 1,
0.3337996, 1.106556, 0.6498834, 0, 0.2784314, 1, 1,
0.3388748, 0.9528436, 1.001619, 0, 0.2745098, 1, 1,
0.3393238, -1.813843, 1.063252, 0, 0.2666667, 1, 1,
0.3408563, 0.1869995, 1.710525, 0, 0.2627451, 1, 1,
0.3463418, 0.6265279, -0.3731498, 0, 0.254902, 1, 1,
0.3475564, -0.0724381, 1.472867, 0, 0.2509804, 1, 1,
0.3496943, -0.2356137, 2.345983, 0, 0.2431373, 1, 1,
0.3498232, 1.288581, -0.1103181, 0, 0.2392157, 1, 1,
0.3536644, -0.9433224, 1.97561, 0, 0.2313726, 1, 1,
0.3552257, 0.4942454, -0.7122064, 0, 0.227451, 1, 1,
0.3599527, 0.221826, 0.7703918, 0, 0.2196078, 1, 1,
0.3637763, 0.2534036, 2.266005, 0, 0.2156863, 1, 1,
0.3640392, 0.1422337, -0.1140968, 0, 0.2078431, 1, 1,
0.3669013, 0.09325732, 1.652038, 0, 0.2039216, 1, 1,
0.3688468, 1.293769, 0.1237858, 0, 0.1960784, 1, 1,
0.3702655, 0.1991232, 2.882599, 0, 0.1882353, 1, 1,
0.3728402, 0.8033366, -0.2550089, 0, 0.1843137, 1, 1,
0.3816025, -0.6706029, 3.813817, 0, 0.1764706, 1, 1,
0.3819011, 0.5239373, 1.572293, 0, 0.172549, 1, 1,
0.3826564, -0.8639891, 2.949924, 0, 0.1647059, 1, 1,
0.3877747, -0.5880728, 2.164795, 0, 0.1607843, 1, 1,
0.3948397, -0.5317842, 1.582695, 0, 0.1529412, 1, 1,
0.4029697, -0.05791572, 1.471595, 0, 0.1490196, 1, 1,
0.403686, -3.184304, 2.993727, 0, 0.1411765, 1, 1,
0.4052295, 1.237082, -0.5560554, 0, 0.1372549, 1, 1,
0.4076788, -0.2058996, 1.324727, 0, 0.1294118, 1, 1,
0.4106857, -1.274412, 1.145993, 0, 0.1254902, 1, 1,
0.4146241, 0.500774, 0.9917152, 0, 0.1176471, 1, 1,
0.4170135, 1.379156, -1.558325, 0, 0.1137255, 1, 1,
0.4196914, 1.188456, 0.9763681, 0, 0.1058824, 1, 1,
0.4198353, -0.3858734, 2.258057, 0, 0.09803922, 1, 1,
0.420904, -0.8124721, 2.965502, 0, 0.09411765, 1, 1,
0.4241698, 0.9017603, -0.4842244, 0, 0.08627451, 1, 1,
0.4268484, 0.8356399, -0.3362136, 0, 0.08235294, 1, 1,
0.4306697, 1.036668, 2.685769, 0, 0.07450981, 1, 1,
0.4307602, -2.24315, 2.618752, 0, 0.07058824, 1, 1,
0.4309632, -0.000967051, 0.7432398, 0, 0.0627451, 1, 1,
0.4359896, 0.9044001, 1.429311, 0, 0.05882353, 1, 1,
0.4371112, 0.8312318, -1.342006, 0, 0.05098039, 1, 1,
0.4375941, 0.4821056, 0.3089341, 0, 0.04705882, 1, 1,
0.4410742, -0.1612957, 2.088205, 0, 0.03921569, 1, 1,
0.4439424, -0.08217523, 2.420094, 0, 0.03529412, 1, 1,
0.4519097, 0.1848968, 1.854393, 0, 0.02745098, 1, 1,
0.452355, 0.2332866, 2.386072, 0, 0.02352941, 1, 1,
0.4524835, -1.847141, 3.096376, 0, 0.01568628, 1, 1,
0.4577034, -0.06355277, 0.7063677, 0, 0.01176471, 1, 1,
0.4595728, 1.64186, -0.9778706, 0, 0.003921569, 1, 1,
0.4597589, 0.6555287, 2.000503, 0.003921569, 0, 1, 1,
0.460759, 0.5843019, 0.7794765, 0.007843138, 0, 1, 1,
0.4611151, -0.08876387, 1.268717, 0.01568628, 0, 1, 1,
0.4614044, 0.01231917, 1.448174, 0.01960784, 0, 1, 1,
0.4620517, -1.154819, 2.221009, 0.02745098, 0, 1, 1,
0.464049, 0.3654946, 1.782752, 0.03137255, 0, 1, 1,
0.4682281, 0.4475387, -0.8424982, 0.03921569, 0, 1, 1,
0.4798716, 0.3541189, 1.625458, 0.04313726, 0, 1, 1,
0.4809771, 0.01902373, -0.539237, 0.05098039, 0, 1, 1,
0.4830517, 1.532741, 1.826106, 0.05490196, 0, 1, 1,
0.4834116, 0.6778041, -1.026951, 0.0627451, 0, 1, 1,
0.4845733, 0.5737286, -0.2127897, 0.06666667, 0, 1, 1,
0.4856363, 0.5423816, 0.450946, 0.07450981, 0, 1, 1,
0.4884676, 1.715377, -0.4207852, 0.07843138, 0, 1, 1,
0.489654, -0.105437, -0.08709083, 0.08627451, 0, 1, 1,
0.4937276, 0.9680905, 0.9300479, 0.09019608, 0, 1, 1,
0.4991404, 0.960529, 0.9809039, 0.09803922, 0, 1, 1,
0.5013806, -1.460736, 1.651904, 0.1058824, 0, 1, 1,
0.5043375, -2.980724, 3.048905, 0.1098039, 0, 1, 1,
0.5064459, -1.052524, 3.786694, 0.1176471, 0, 1, 1,
0.5085911, -2.239279, 3.076484, 0.1215686, 0, 1, 1,
0.514632, -0.1063066, 1.795667, 0.1294118, 0, 1, 1,
0.5154755, 0.3998688, 0.822317, 0.1333333, 0, 1, 1,
0.5225082, 1.410286, 0.7656872, 0.1411765, 0, 1, 1,
0.526581, 0.04332054, 1.607432, 0.145098, 0, 1, 1,
0.530787, 1.186748, 0.1131005, 0.1529412, 0, 1, 1,
0.5325826, 1.323168, -0.6050137, 0.1568628, 0, 1, 1,
0.5340294, -0.2156704, 1.866235, 0.1647059, 0, 1, 1,
0.5368738, 1.371308, 0.3980126, 0.1686275, 0, 1, 1,
0.5433922, -0.6722456, 3.361551, 0.1764706, 0, 1, 1,
0.5437938, 0.3471589, 0.36018, 0.1803922, 0, 1, 1,
0.545343, -0.2986307, 3.446521, 0.1882353, 0, 1, 1,
0.5467318, 0.4970286, 1.948674, 0.1921569, 0, 1, 1,
0.5480644, 0.7756113, 2.029923, 0.2, 0, 1, 1,
0.5491354, 0.2454471, 0.6110398, 0.2078431, 0, 1, 1,
0.5501508, 0.02510772, 1.354725, 0.2117647, 0, 1, 1,
0.5505015, 0.8127649, -0.04871077, 0.2196078, 0, 1, 1,
0.5523371, -0.5349051, 3.431576, 0.2235294, 0, 1, 1,
0.5559343, -0.5451608, 1.886596, 0.2313726, 0, 1, 1,
0.5574434, -0.4276269, 0.9393868, 0.2352941, 0, 1, 1,
0.5582608, -0.3460276, -0.4592751, 0.2431373, 0, 1, 1,
0.5584135, 0.2501143, 1.347046, 0.2470588, 0, 1, 1,
0.5673163, -0.7634886, 3.246186, 0.254902, 0, 1, 1,
0.5682113, -0.07201749, 0.3536767, 0.2588235, 0, 1, 1,
0.5715778, -0.9916653, 0.6499988, 0.2666667, 0, 1, 1,
0.5763227, -1.017074, 3.49911, 0.2705882, 0, 1, 1,
0.5778226, -0.9071133, 3.505825, 0.2784314, 0, 1, 1,
0.579558, 2.198264, 0.8158143, 0.282353, 0, 1, 1,
0.5795742, 0.7025793, -0.09733948, 0.2901961, 0, 1, 1,
0.5834122, 0.1183614, 2.095342, 0.2941177, 0, 1, 1,
0.5844855, 0.4434256, 1.528117, 0.3019608, 0, 1, 1,
0.5850376, -1.840902, 2.955987, 0.3098039, 0, 1, 1,
0.5879812, 0.5645589, -0.1079616, 0.3137255, 0, 1, 1,
0.591943, 1.750608, -1.420037, 0.3215686, 0, 1, 1,
0.5954579, 0.7058089, 0.5467854, 0.3254902, 0, 1, 1,
0.5970891, -1.190527, 1.363278, 0.3333333, 0, 1, 1,
0.5981051, 0.5897947, -0.5273763, 0.3372549, 0, 1, 1,
0.6049879, -0.3749259, 2.41428, 0.345098, 0, 1, 1,
0.6054133, -0.9217388, 4.101896, 0.3490196, 0, 1, 1,
0.6128698, -0.8840972, 4.086774, 0.3568628, 0, 1, 1,
0.6146007, 1.646748, 0.2619962, 0.3607843, 0, 1, 1,
0.6224537, -0.6517857, 3.969548, 0.3686275, 0, 1, 1,
0.6314247, -0.6186151, 2.334048, 0.372549, 0, 1, 1,
0.6322194, 1.211636, -0.5579826, 0.3803922, 0, 1, 1,
0.6357046, 0.8562701, 0.5971558, 0.3843137, 0, 1, 1,
0.6499307, 1.603012, 1.764826, 0.3921569, 0, 1, 1,
0.6719556, -0.8393161, 2.702987, 0.3960784, 0, 1, 1,
0.6751861, 0.6952195, 1.498935, 0.4039216, 0, 1, 1,
0.6855634, -1.588233, 2.535642, 0.4117647, 0, 1, 1,
0.6856534, -0.2784792, 3.01683, 0.4156863, 0, 1, 1,
0.6862502, -0.62517, 2.701777, 0.4235294, 0, 1, 1,
0.6862651, 1.962132, 3.140971, 0.427451, 0, 1, 1,
0.6929111, 0.9355767, 0.03462315, 0.4352941, 0, 1, 1,
0.6954543, 0.7863919, 1.38992, 0.4392157, 0, 1, 1,
0.7073956, 2.483487, 2.42718, 0.4470588, 0, 1, 1,
0.710801, 0.1091985, 1.27003, 0.4509804, 0, 1, 1,
0.7133309, -1.629005, 2.357833, 0.4588235, 0, 1, 1,
0.7165715, 1.171772, 2.012642, 0.4627451, 0, 1, 1,
0.7187585, 0.08287922, 3.285234, 0.4705882, 0, 1, 1,
0.7189016, 0.4801421, 2.51224, 0.4745098, 0, 1, 1,
0.7198915, -0.09157329, 1.172465, 0.4823529, 0, 1, 1,
0.7210249, -1.782932, 2.032566, 0.4862745, 0, 1, 1,
0.7217245, -0.4312687, 3.276393, 0.4941176, 0, 1, 1,
0.7354649, 0.01590075, 2.78582, 0.5019608, 0, 1, 1,
0.7377548, -0.1789736, 0.9555762, 0.5058824, 0, 1, 1,
0.7483374, -1.338696, 3.369174, 0.5137255, 0, 1, 1,
0.7500286, -0.3308629, 3.817611, 0.5176471, 0, 1, 1,
0.7502047, 0.5253083, 0.5341327, 0.5254902, 0, 1, 1,
0.7561424, 0.01115285, 1.265693, 0.5294118, 0, 1, 1,
0.7719706, 0.3850664, 0.9246333, 0.5372549, 0, 1, 1,
0.7719861, 1.247639, 0.5787787, 0.5411765, 0, 1, 1,
0.7732899, -0.01938125, 0.2091212, 0.5490196, 0, 1, 1,
0.7747597, -0.9645163, 0.1656362, 0.5529412, 0, 1, 1,
0.7755992, 1.184497, 0.8557211, 0.5607843, 0, 1, 1,
0.7764444, 2.11284, 0.3931166, 0.5647059, 0, 1, 1,
0.7802389, 0.9604897, 1.377152, 0.572549, 0, 1, 1,
0.7845679, -0.9575602, 3.029001, 0.5764706, 0, 1, 1,
0.7852845, 0.3280405, 1.461329, 0.5843138, 0, 1, 1,
0.7887198, 0.5527895, 0.3186947, 0.5882353, 0, 1, 1,
0.789933, -2.262355, 3.10364, 0.5960785, 0, 1, 1,
0.7928485, 0.3274426, 0.8965238, 0.6039216, 0, 1, 1,
0.7979534, -1.710817, 2.066192, 0.6078432, 0, 1, 1,
0.7991626, -0.04360093, 1.462471, 0.6156863, 0, 1, 1,
0.8028999, -0.2805417, 2.621438, 0.6196079, 0, 1, 1,
0.8033178, 1.623262, 0.4365065, 0.627451, 0, 1, 1,
0.8109458, 0.4784503, 1.750782, 0.6313726, 0, 1, 1,
0.8111877, -0.7720178, 3.518613, 0.6392157, 0, 1, 1,
0.8176612, -1.453392, 2.501371, 0.6431373, 0, 1, 1,
0.8239874, -0.3710887, 1.82568, 0.6509804, 0, 1, 1,
0.8328365, -0.7974925, 3.002349, 0.654902, 0, 1, 1,
0.8335894, -1.562508, 4.005933, 0.6627451, 0, 1, 1,
0.8360992, 0.6556889, -0.3176959, 0.6666667, 0, 1, 1,
0.8365702, 1.115705, 2.054318, 0.6745098, 0, 1, 1,
0.8368676, 0.6089709, 0.6382624, 0.6784314, 0, 1, 1,
0.8376655, 0.5249409, -0.1600035, 0.6862745, 0, 1, 1,
0.8377631, -0.003492165, 1.836931, 0.6901961, 0, 1, 1,
0.8378736, -0.4938661, 2.51329, 0.6980392, 0, 1, 1,
0.8411224, 0.2764438, 2.091137, 0.7058824, 0, 1, 1,
0.8617301, -0.2242277, 1.176651, 0.7098039, 0, 1, 1,
0.8639905, 2.083072, 0.1538044, 0.7176471, 0, 1, 1,
0.8643329, 2.091232, -0.53, 0.7215686, 0, 1, 1,
0.8644087, -1.358077, 3.10745, 0.7294118, 0, 1, 1,
0.8654838, -0.3768663, 2.825289, 0.7333333, 0, 1, 1,
0.8668516, 1.070279, 1.149748, 0.7411765, 0, 1, 1,
0.8698587, -0.3301072, 0.7920382, 0.7450981, 0, 1, 1,
0.8714574, -0.1748805, 1.143832, 0.7529412, 0, 1, 1,
0.8731698, 1.226503, 2.018516, 0.7568628, 0, 1, 1,
0.8814821, 1.514354, 0.3733322, 0.7647059, 0, 1, 1,
0.882484, -0.3296715, 2.102051, 0.7686275, 0, 1, 1,
0.8860374, -1.3206, 2.013591, 0.7764706, 0, 1, 1,
0.889075, 0.03755951, 2.171671, 0.7803922, 0, 1, 1,
0.8954703, -1.371948, 1.852076, 0.7882353, 0, 1, 1,
0.8954997, -0.5037292, 0.1716728, 0.7921569, 0, 1, 1,
0.9046613, -0.4082757, 0.3805693, 0.8, 0, 1, 1,
0.9063434, -0.4620394, 1.608427, 0.8078431, 0, 1, 1,
0.9072472, -0.2591047, 1.900217, 0.8117647, 0, 1, 1,
0.9143495, 0.1480656, -0.2476564, 0.8196079, 0, 1, 1,
0.917536, -0.3960557, 2.100441, 0.8235294, 0, 1, 1,
0.9199277, 1.212999, -0.4463905, 0.8313726, 0, 1, 1,
0.9204766, 0.434769, 1.548746, 0.8352941, 0, 1, 1,
0.9208801, -0.9325853, 1.80034, 0.8431373, 0, 1, 1,
0.9248053, -0.5979595, 3.261509, 0.8470588, 0, 1, 1,
0.9260241, 1.583807, 1.9016, 0.854902, 0, 1, 1,
0.9263002, -1.012192, 2.233386, 0.8588235, 0, 1, 1,
0.9265305, 0.001538315, 3.140215, 0.8666667, 0, 1, 1,
0.9315361, 0.06148145, -0.9231811, 0.8705882, 0, 1, 1,
0.9323717, -1.012909, 2.544044, 0.8784314, 0, 1, 1,
0.9353714, 0.2392244, 1.720902, 0.8823529, 0, 1, 1,
0.9415071, 1.190619, 1.249908, 0.8901961, 0, 1, 1,
0.9424916, 0.9393108, 1.288192, 0.8941177, 0, 1, 1,
0.9465634, 0.2462039, 1.080829, 0.9019608, 0, 1, 1,
0.9524416, 0.7865157, 0.925992, 0.9098039, 0, 1, 1,
0.9539039, 0.3277003, 2.54939, 0.9137255, 0, 1, 1,
0.9571823, 1.593657, 1.262365, 0.9215686, 0, 1, 1,
0.9573806, -0.4067808, 1.164459, 0.9254902, 0, 1, 1,
0.9607553, 1.65564, 1.099066, 0.9333333, 0, 1, 1,
0.9655789, 0.8982078, 0.2830992, 0.9372549, 0, 1, 1,
0.9683971, -0.8687612, -0.4970752, 0.945098, 0, 1, 1,
0.9694293, -1.95679, 3.208781, 0.9490196, 0, 1, 1,
0.9697211, -0.8598189, 1.473123, 0.9568627, 0, 1, 1,
0.9743798, -0.4109577, 3.975206, 0.9607843, 0, 1, 1,
0.9743893, -0.5298596, 1.021843, 0.9686275, 0, 1, 1,
0.9757709, 0.1804887, 1.495321, 0.972549, 0, 1, 1,
0.9850366, 0.838442, 0.259989, 0.9803922, 0, 1, 1,
0.9864038, -0.4902977, 2.726013, 0.9843137, 0, 1, 1,
0.9868894, -1.002817, 0.3814963, 0.9921569, 0, 1, 1,
0.9875742, 0.6214932, 2.101969, 0.9960784, 0, 1, 1,
0.9895037, 0.2324908, 2.660863, 1, 0, 0.9960784, 1,
1.005209, -0.3486089, 2.374017, 1, 0, 0.9882353, 1,
1.007306, -0.3531485, 2.64189, 1, 0, 0.9843137, 1,
1.007822, 0.2362521, 0.6759707, 1, 0, 0.9764706, 1,
1.014627, -1.525198, 1.847125, 1, 0, 0.972549, 1,
1.021771, 0.1385634, 1.690724, 1, 0, 0.9647059, 1,
1.021834, -0.1575097, 0.7452363, 1, 0, 0.9607843, 1,
1.027934, -0.8505237, 1.937388, 1, 0, 0.9529412, 1,
1.031236, -1.13092, 3.13968, 1, 0, 0.9490196, 1,
1.046624, -0.2921726, 2.807017, 1, 0, 0.9411765, 1,
1.046874, -0.008919059, -0.9412557, 1, 0, 0.9372549, 1,
1.048128, -0.5173268, 2.091626, 1, 0, 0.9294118, 1,
1.048474, -0.992914, 3.186209, 1, 0, 0.9254902, 1,
1.049216, -1.080117, 0.08956555, 1, 0, 0.9176471, 1,
1.049829, -0.08168685, 1.287158, 1, 0, 0.9137255, 1,
1.051327, 1.472025, 1.299027, 1, 0, 0.9058824, 1,
1.052737, 0.5352291, 1.228711, 1, 0, 0.9019608, 1,
1.054354, 0.9796308, 2.705717, 1, 0, 0.8941177, 1,
1.067081, 1.411263, 1.627202, 1, 0, 0.8862745, 1,
1.07041, -0.9800877, 0.705665, 1, 0, 0.8823529, 1,
1.078229, -1.806522, 1.19498, 1, 0, 0.8745098, 1,
1.086083, -0.6462773, 1.045851, 1, 0, 0.8705882, 1,
1.094322, 0.9268705, 0.3811781, 1, 0, 0.8627451, 1,
1.094742, -0.2151577, -0.6263297, 1, 0, 0.8588235, 1,
1.095643, 1.279052, 1.161532, 1, 0, 0.8509804, 1,
1.099192, 0.6942072, -0.2116342, 1, 0, 0.8470588, 1,
1.101275, 0.5985252, 0.4831565, 1, 0, 0.8392157, 1,
1.110974, -0.548964, 2.266199, 1, 0, 0.8352941, 1,
1.112941, -1.514935, 4.079969, 1, 0, 0.827451, 1,
1.114545, 1.26843, -0.007554798, 1, 0, 0.8235294, 1,
1.115355, -0.5333533, -0.2342059, 1, 0, 0.8156863, 1,
1.118693, -1.623882, 2.730555, 1, 0, 0.8117647, 1,
1.120395, -0.3416989, 3.371872, 1, 0, 0.8039216, 1,
1.129333, 0.4894406, 1.598823, 1, 0, 0.7960784, 1,
1.132625, 0.4593663, 0.6841677, 1, 0, 0.7921569, 1,
1.137151, -1.837348, 2.08269, 1, 0, 0.7843137, 1,
1.139505, 0.4893062, 1.43704, 1, 0, 0.7803922, 1,
1.142993, -0.669992, 2.016323, 1, 0, 0.772549, 1,
1.14482, 0.006970589, 2.045644, 1, 0, 0.7686275, 1,
1.147846, -1.243627, 1.16893, 1, 0, 0.7607843, 1,
1.158435, -0.2799191, 1.981358, 1, 0, 0.7568628, 1,
1.16479, 0.4402642, 2.10854, 1, 0, 0.7490196, 1,
1.167186, 1.620258, 0.005007745, 1, 0, 0.7450981, 1,
1.167859, -1.871825, 2.777843, 1, 0, 0.7372549, 1,
1.177454, -1.763615, 3.414943, 1, 0, 0.7333333, 1,
1.178268, 0.8147784, 0.7445888, 1, 0, 0.7254902, 1,
1.18079, -1.949103, 1.463054, 1, 0, 0.7215686, 1,
1.194433, 1.044147, 0.6192794, 1, 0, 0.7137255, 1,
1.19702, -0.9439249, 2.393004, 1, 0, 0.7098039, 1,
1.204755, -1.136077, 2.432356, 1, 0, 0.7019608, 1,
1.216233, -1.071036, 0.8995003, 1, 0, 0.6941177, 1,
1.21811, -0.2403133, 0.3936547, 1, 0, 0.6901961, 1,
1.218743, -1.232142, 3.245438, 1, 0, 0.682353, 1,
1.218963, 1.096415, -0.3592307, 1, 0, 0.6784314, 1,
1.226791, 0.01206142, 1.854406, 1, 0, 0.6705883, 1,
1.228738, -0.2847607, 2.619579, 1, 0, 0.6666667, 1,
1.229817, -1.178778, 2.947934, 1, 0, 0.6588235, 1,
1.234062, 0.3505934, 1.41363, 1, 0, 0.654902, 1,
1.243015, 0.8421659, 1.046242, 1, 0, 0.6470588, 1,
1.244321, -0.6649325, 2.896935, 1, 0, 0.6431373, 1,
1.265757, -0.380807, 0.142828, 1, 0, 0.6352941, 1,
1.268113, 0.6903163, 0.8746265, 1, 0, 0.6313726, 1,
1.27065, -0.03092799, 3.165224, 1, 0, 0.6235294, 1,
1.278471, -0.6672112, 2.75494, 1, 0, 0.6196079, 1,
1.278925, -0.2717271, 0.9861316, 1, 0, 0.6117647, 1,
1.291196, -0.3314357, 2.14767, 1, 0, 0.6078432, 1,
1.291832, 0.3553577, 1.353567, 1, 0, 0.6, 1,
1.295929, 0.298591, 1.49106, 1, 0, 0.5921569, 1,
1.305736, -0.4844252, 2.81718, 1, 0, 0.5882353, 1,
1.311048, -1.012705, 3.171475, 1, 0, 0.5803922, 1,
1.315351, 2.081185, 0.5433496, 1, 0, 0.5764706, 1,
1.3162, 0.1332455, -0.07898561, 1, 0, 0.5686275, 1,
1.318002, 0.5919688, 1.47311, 1, 0, 0.5647059, 1,
1.320902, 0.1778454, 1.723132, 1, 0, 0.5568628, 1,
1.326691, 1.563002, -0.1806768, 1, 0, 0.5529412, 1,
1.336654, -0.6930442, 2.379406, 1, 0, 0.5450981, 1,
1.353483, 0.7036186, 2.014947, 1, 0, 0.5411765, 1,
1.357958, -1.300089, 4.267669, 1, 0, 0.5333334, 1,
1.375023, -1.051141, 1.629825, 1, 0, 0.5294118, 1,
1.376018, 0.6517166, 0.7673686, 1, 0, 0.5215687, 1,
1.392834, 0.9781545, 2.28146, 1, 0, 0.5176471, 1,
1.405667, 0.5980706, 1.953446, 1, 0, 0.509804, 1,
1.405794, 0.00995132, 1.668041, 1, 0, 0.5058824, 1,
1.412121, 0.1375928, 2.749523, 1, 0, 0.4980392, 1,
1.420635, -0.3461644, 1.89633, 1, 0, 0.4901961, 1,
1.430081, -0.0047528, 0.565068, 1, 0, 0.4862745, 1,
1.436834, -0.7667487, 2.121166, 1, 0, 0.4784314, 1,
1.441636, -0.3724322, 0.6245556, 1, 0, 0.4745098, 1,
1.442581, -0.3043792, 3.117358, 1, 0, 0.4666667, 1,
1.468678, 0.7151918, -0.1712915, 1, 0, 0.4627451, 1,
1.469385, -0.8056155, 1.822327, 1, 0, 0.454902, 1,
1.474027, 1.117594, 1.345491, 1, 0, 0.4509804, 1,
1.475759, -0.5406947, 1.83724, 1, 0, 0.4431373, 1,
1.478661, 0.3855971, 0.3210781, 1, 0, 0.4392157, 1,
1.489358, -0.2033022, -0.3044302, 1, 0, 0.4313726, 1,
1.500135, 0.4720897, 1.624558, 1, 0, 0.427451, 1,
1.502325, -2.068208, 2.092421, 1, 0, 0.4196078, 1,
1.515317, -0.1529211, 1.557988, 1, 0, 0.4156863, 1,
1.522277, 0.4001177, -0.05407047, 1, 0, 0.4078431, 1,
1.528309, 0.1541514, 1.908425, 1, 0, 0.4039216, 1,
1.528755, -1.155371, 4.010631, 1, 0, 0.3960784, 1,
1.547021, 2.069077, 0.3161702, 1, 0, 0.3882353, 1,
1.554615, -0.6378247, 0.8571264, 1, 0, 0.3843137, 1,
1.555566, 0.7208602, 1.163201, 1, 0, 0.3764706, 1,
1.557902, 1.565364, 0.3791021, 1, 0, 0.372549, 1,
1.558305, -3.177327, 3.199666, 1, 0, 0.3647059, 1,
1.56331, -0.5312558, 1.600819, 1, 0, 0.3607843, 1,
1.573376, 0.4259765, 1.690038, 1, 0, 0.3529412, 1,
1.607014, 0.446643, 1.435015, 1, 0, 0.3490196, 1,
1.609061, 0.1383473, -0.06195951, 1, 0, 0.3411765, 1,
1.619377, 0.6321777, 0.09246199, 1, 0, 0.3372549, 1,
1.620247, 1.121254, 1.512319, 1, 0, 0.3294118, 1,
1.629274, 1.038253, 1.044585, 1, 0, 0.3254902, 1,
1.643157, -0.2150404, 1.694743, 1, 0, 0.3176471, 1,
1.643836, 0.8243812, 1.199988, 1, 0, 0.3137255, 1,
1.646296, -0.5955998, 1.323694, 1, 0, 0.3058824, 1,
1.661659, 2.282507, 2.279049, 1, 0, 0.2980392, 1,
1.664585, -0.4811573, 1.645632, 1, 0, 0.2941177, 1,
1.713029, -0.2414631, 1.20974, 1, 0, 0.2862745, 1,
1.724427, -0.9271304, 2.173275, 1, 0, 0.282353, 1,
1.72653, -1.097352, 0.555074, 1, 0, 0.2745098, 1,
1.730098, 0.8560571, 0.737398, 1, 0, 0.2705882, 1,
1.742369, 1.319414, 0.4440435, 1, 0, 0.2627451, 1,
1.800786, 0.2022402, 1.768408, 1, 0, 0.2588235, 1,
1.8036, 0.0770738, 1.593274, 1, 0, 0.2509804, 1,
1.811258, 0.05653595, 0.9721419, 1, 0, 0.2470588, 1,
1.82679, -0.5927855, -1.136514, 1, 0, 0.2392157, 1,
1.84243, 0.7859723, 2.164469, 1, 0, 0.2352941, 1,
1.856404, 0.4748788, 2.043633, 1, 0, 0.227451, 1,
1.858382, -0.726729, 2.875354, 1, 0, 0.2235294, 1,
1.861405, 2.024873, 1.887792, 1, 0, 0.2156863, 1,
1.874089, -0.3061176, 3.276815, 1, 0, 0.2117647, 1,
1.888467, 0.01550031, 2.731428, 1, 0, 0.2039216, 1,
1.89543, -0.303514, 2.586065, 1, 0, 0.1960784, 1,
1.913435, -0.6217898, 1.539108, 1, 0, 0.1921569, 1,
1.932584, -1.497205, 1.985836, 1, 0, 0.1843137, 1,
1.96109, -1.359622, 1.816628, 1, 0, 0.1803922, 1,
1.96351, 1.207188, -0.6019961, 1, 0, 0.172549, 1,
2.013037, 0.3744283, 0.5743785, 1, 0, 0.1686275, 1,
2.03245, -0.7993986, 2.396044, 1, 0, 0.1607843, 1,
2.046145, 1.660927, 0.6919659, 1, 0, 0.1568628, 1,
2.055861, 0.08476745, 2.047971, 1, 0, 0.1490196, 1,
2.05833, -0.8514724, 2.538864, 1, 0, 0.145098, 1,
2.101604, 0.4642082, 1.867783, 1, 0, 0.1372549, 1,
2.117512, -2.137756, 2.235651, 1, 0, 0.1333333, 1,
2.119017, -0.5375192, 1.700714, 1, 0, 0.1254902, 1,
2.192858, 0.4340319, 2.133002, 1, 0, 0.1215686, 1,
2.222656, -1.274506, 3.43119, 1, 0, 0.1137255, 1,
2.249769, 0.3336213, 0.4086705, 1, 0, 0.1098039, 1,
2.26919, -0.237193, 0.4809731, 1, 0, 0.1019608, 1,
2.351607, -0.345625, 2.789833, 1, 0, 0.09411765, 1,
2.381371, -0.1212734, 0.4250847, 1, 0, 0.09019608, 1,
2.457319, 0.05600807, 3.071703, 1, 0, 0.08235294, 1,
2.485962, 0.5092627, 1.154983, 1, 0, 0.07843138, 1,
2.491999, -0.2961986, 2.269299, 1, 0, 0.07058824, 1,
2.502399, 0.1966881, 1.797969, 1, 0, 0.06666667, 1,
2.532483, -0.1026369, 0.8660247, 1, 0, 0.05882353, 1,
2.546056, 2.322668, -0.1811665, 1, 0, 0.05490196, 1,
2.554767, 0.5870177, 1.396276, 1, 0, 0.04705882, 1,
2.555006, -0.2229346, 0.7513191, 1, 0, 0.04313726, 1,
2.635543, -1.022096, 2.280208, 1, 0, 0.03529412, 1,
2.641658, 3.400419, 2.057984, 1, 0, 0.03137255, 1,
2.699278, -1.514529, 2.579058, 1, 0, 0.02352941, 1,
2.733375, 0.3686689, 2.753156, 1, 0, 0.01960784, 1,
2.796632, 1.782082, 0.8920467, 1, 0, 0.01176471, 1,
3.337578, 1.739613, 1.497622, 1, 0, 0.007843138, 1
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
0.06247461, -5.083704, -7.252782, 0, -0.5, 0.5, 0.5,
0.06247461, -5.083704, -7.252782, 1, -0.5, 0.5, 0.5,
0.06247461, -5.083704, -7.252782, 1, 1.5, 0.5, 0.5,
0.06247461, -5.083704, -7.252782, 0, 1.5, 0.5, 0.5
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
-4.322889, -0.2268245, -7.252782, 0, -0.5, 0.5, 0.5,
-4.322889, -0.2268245, -7.252782, 1, -0.5, 0.5, 0.5,
-4.322889, -0.2268245, -7.252782, 1, 1.5, 0.5, 0.5,
-4.322889, -0.2268245, -7.252782, 0, 1.5, 0.5, 0.5
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
-4.322889, -5.083704, -0.4917378, 0, -0.5, 0.5, 0.5,
-4.322889, -5.083704, -0.4917378, 1, -0.5, 0.5, 0.5,
-4.322889, -5.083704, -0.4917378, 1, 1.5, 0.5, 0.5,
-4.322889, -5.083704, -0.4917378, 0, 1.5, 0.5, 0.5
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
-3, -3.962886, -5.692541,
3, -3.962886, -5.692541,
-3, -3.962886, -5.692541,
-3, -4.149689, -5.952581,
-2, -3.962886, -5.692541,
-2, -4.149689, -5.952581,
-1, -3.962886, -5.692541,
-1, -4.149689, -5.952581,
0, -3.962886, -5.692541,
0, -4.149689, -5.952581,
1, -3.962886, -5.692541,
1, -4.149689, -5.952581,
2, -3.962886, -5.692541,
2, -4.149689, -5.952581,
3, -3.962886, -5.692541,
3, -4.149689, -5.952581
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
-3, -4.523295, -6.472661, 0, -0.5, 0.5, 0.5,
-3, -4.523295, -6.472661, 1, -0.5, 0.5, 0.5,
-3, -4.523295, -6.472661, 1, 1.5, 0.5, 0.5,
-3, -4.523295, -6.472661, 0, 1.5, 0.5, 0.5,
-2, -4.523295, -6.472661, 0, -0.5, 0.5, 0.5,
-2, -4.523295, -6.472661, 1, -0.5, 0.5, 0.5,
-2, -4.523295, -6.472661, 1, 1.5, 0.5, 0.5,
-2, -4.523295, -6.472661, 0, 1.5, 0.5, 0.5,
-1, -4.523295, -6.472661, 0, -0.5, 0.5, 0.5,
-1, -4.523295, -6.472661, 1, -0.5, 0.5, 0.5,
-1, -4.523295, -6.472661, 1, 1.5, 0.5, 0.5,
-1, -4.523295, -6.472661, 0, 1.5, 0.5, 0.5,
0, -4.523295, -6.472661, 0, -0.5, 0.5, 0.5,
0, -4.523295, -6.472661, 1, -0.5, 0.5, 0.5,
0, -4.523295, -6.472661, 1, 1.5, 0.5, 0.5,
0, -4.523295, -6.472661, 0, 1.5, 0.5, 0.5,
1, -4.523295, -6.472661, 0, -0.5, 0.5, 0.5,
1, -4.523295, -6.472661, 1, -0.5, 0.5, 0.5,
1, -4.523295, -6.472661, 1, 1.5, 0.5, 0.5,
1, -4.523295, -6.472661, 0, 1.5, 0.5, 0.5,
2, -4.523295, -6.472661, 0, -0.5, 0.5, 0.5,
2, -4.523295, -6.472661, 1, -0.5, 0.5, 0.5,
2, -4.523295, -6.472661, 1, 1.5, 0.5, 0.5,
2, -4.523295, -6.472661, 0, 1.5, 0.5, 0.5,
3, -4.523295, -6.472661, 0, -0.5, 0.5, 0.5,
3, -4.523295, -6.472661, 1, -0.5, 0.5, 0.5,
3, -4.523295, -6.472661, 1, 1.5, 0.5, 0.5,
3, -4.523295, -6.472661, 0, 1.5, 0.5, 0.5
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
-3.310882, -2, -5.692541,
-3.310882, 2, -5.692541,
-3.310882, -2, -5.692541,
-3.47955, -2, -5.952581,
-3.310882, 0, -5.692541,
-3.47955, 0, -5.952581,
-3.310882, 2, -5.692541,
-3.47955, 2, -5.952581
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
-3.816886, -2, -6.472661, 0, -0.5, 0.5, 0.5,
-3.816886, -2, -6.472661, 1, -0.5, 0.5, 0.5,
-3.816886, -2, -6.472661, 1, 1.5, 0.5, 0.5,
-3.816886, -2, -6.472661, 0, 1.5, 0.5, 0.5,
-3.816886, 0, -6.472661, 0, -0.5, 0.5, 0.5,
-3.816886, 0, -6.472661, 1, -0.5, 0.5, 0.5,
-3.816886, 0, -6.472661, 1, 1.5, 0.5, 0.5,
-3.816886, 0, -6.472661, 0, 1.5, 0.5, 0.5,
-3.816886, 2, -6.472661, 0, -0.5, 0.5, 0.5,
-3.816886, 2, -6.472661, 1, -0.5, 0.5, 0.5,
-3.816886, 2, -6.472661, 1, 1.5, 0.5, 0.5,
-3.816886, 2, -6.472661, 0, 1.5, 0.5, 0.5
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
-3.310882, -3.962886, -4,
-3.310882, -3.962886, 4,
-3.310882, -3.962886, -4,
-3.47955, -4.149689, -4,
-3.310882, -3.962886, -2,
-3.47955, -4.149689, -2,
-3.310882, -3.962886, 0,
-3.47955, -4.149689, 0,
-3.310882, -3.962886, 2,
-3.47955, -4.149689, 2,
-3.310882, -3.962886, 4,
-3.47955, -4.149689, 4
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
-3.816886, -4.523295, -4, 0, -0.5, 0.5, 0.5,
-3.816886, -4.523295, -4, 1, -0.5, 0.5, 0.5,
-3.816886, -4.523295, -4, 1, 1.5, 0.5, 0.5,
-3.816886, -4.523295, -4, 0, 1.5, 0.5, 0.5,
-3.816886, -4.523295, -2, 0, -0.5, 0.5, 0.5,
-3.816886, -4.523295, -2, 1, -0.5, 0.5, 0.5,
-3.816886, -4.523295, -2, 1, 1.5, 0.5, 0.5,
-3.816886, -4.523295, -2, 0, 1.5, 0.5, 0.5,
-3.816886, -4.523295, 0, 0, -0.5, 0.5, 0.5,
-3.816886, -4.523295, 0, 1, -0.5, 0.5, 0.5,
-3.816886, -4.523295, 0, 1, 1.5, 0.5, 0.5,
-3.816886, -4.523295, 0, 0, 1.5, 0.5, 0.5,
-3.816886, -4.523295, 2, 0, -0.5, 0.5, 0.5,
-3.816886, -4.523295, 2, 1, -0.5, 0.5, 0.5,
-3.816886, -4.523295, 2, 1, 1.5, 0.5, 0.5,
-3.816886, -4.523295, 2, 0, 1.5, 0.5, 0.5,
-3.816886, -4.523295, 4, 0, -0.5, 0.5, 0.5,
-3.816886, -4.523295, 4, 1, -0.5, 0.5, 0.5,
-3.816886, -4.523295, 4, 1, 1.5, 0.5, 0.5,
-3.816886, -4.523295, 4, 0, 1.5, 0.5, 0.5
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
-3.310882, -3.962886, -5.692541,
-3.310882, 3.509237, -5.692541,
-3.310882, -3.962886, 4.709065,
-3.310882, 3.509237, 4.709065,
-3.310882, -3.962886, -5.692541,
-3.310882, -3.962886, 4.709065,
-3.310882, 3.509237, -5.692541,
-3.310882, 3.509237, 4.709065,
-3.310882, -3.962886, -5.692541,
3.435831, -3.962886, -5.692541,
-3.310882, -3.962886, 4.709065,
3.435831, -3.962886, 4.709065,
-3.310882, 3.509237, -5.692541,
3.435831, 3.509237, -5.692541,
-3.310882, 3.509237, 4.709065,
3.435831, 3.509237, 4.709065,
3.435831, -3.962886, -5.692541,
3.435831, 3.509237, -5.692541,
3.435831, -3.962886, 4.709065,
3.435831, 3.509237, 4.709065,
3.435831, -3.962886, -5.692541,
3.435831, -3.962886, 4.709065,
3.435831, 3.509237, -5.692541,
3.435831, 3.509237, 4.709065
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
var radius = 7.729711;
var distance = 34.39036;
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
mvMatrix.translate( -0.06247461, 0.2268245, 0.4917378 );
mvMatrix.scale( 1.238754, 1.118493, 0.8034831 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.39036);
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
tefluthrin<-read.table("tefluthrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tefluthrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'tefluthrin' not found
```

```r
y<-tefluthrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'tefluthrin' not found
```

```r
z<-tefluthrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'tefluthrin' not found
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
-3.212629, -1.563045, -4.421343, 0, 0, 1, 1, 1,
-3.052432, -1.286435, -2.434342, 1, 0, 0, 1, 1,
-2.994861, -0.5485001, -0.190635, 1, 0, 0, 1, 1,
-2.856369, 0.1556903, 0.2433512, 1, 0, 0, 1, 1,
-2.599278, 1.794002, -2.429822, 1, 0, 0, 1, 1,
-2.574427, 0.7283502, -0.9451553, 1, 0, 0, 1, 1,
-2.561374, -0.4230785, 0.07706854, 0, 0, 0, 1, 1,
-2.539465, -1.319806, -2.949128, 0, 0, 0, 1, 1,
-2.496528, -1.026438, -2.844256, 0, 0, 0, 1, 1,
-2.49167, 0.8136932, -1.739887, 0, 0, 0, 1, 1,
-2.327916, -0.2020074, -1.860565, 0, 0, 0, 1, 1,
-2.260737, -1.095024, -0.8935618, 0, 0, 0, 1, 1,
-2.209637, 1.658031, -0.2884168, 0, 0, 0, 1, 1,
-2.076323, 1.008561, 0.2678403, 1, 1, 1, 1, 1,
-2.036792, 0.02453697, -3.944027, 1, 1, 1, 1, 1,
-1.990401, 0.4926112, -2.679578, 1, 1, 1, 1, 1,
-1.988509, -0.7310612, -2.711478, 1, 1, 1, 1, 1,
-1.973448, -2.387177, -2.151906, 1, 1, 1, 1, 1,
-1.957302, -0.4836022, -2.059258, 1, 1, 1, 1, 1,
-1.955502, -0.5084919, -3.92598, 1, 1, 1, 1, 1,
-1.936972, 0.3157385, -1.91893, 1, 1, 1, 1, 1,
-1.930334, -0.2153204, -1.990824, 1, 1, 1, 1, 1,
-1.898212, -2.020362, -3.372548, 1, 1, 1, 1, 1,
-1.874978, -1.097283, -3.67948, 1, 1, 1, 1, 1,
-1.857682, -2.408313, -1.34831, 1, 1, 1, 1, 1,
-1.848603, -2.046172, -0.07251034, 1, 1, 1, 1, 1,
-1.848191, 0.0458086, -1.467828, 1, 1, 1, 1, 1,
-1.841256, -0.1454595, -0.2551137, 1, 1, 1, 1, 1,
-1.837897, -0.6848294, -1.306542, 0, 0, 1, 1, 1,
-1.836419, 1.232537, -0.8264786, 1, 0, 0, 1, 1,
-1.815162, -0.2453345, -2.717088, 1, 0, 0, 1, 1,
-1.796616, 1.14741, -1.232316, 1, 0, 0, 1, 1,
-1.783883, -1.351432, -2.620499, 1, 0, 0, 1, 1,
-1.747012, -1.403761, -2.339258, 1, 0, 0, 1, 1,
-1.73961, 1.566928, -0.7177843, 0, 0, 0, 1, 1,
-1.733074, -1.186726, -2.659135, 0, 0, 0, 1, 1,
-1.732136, 0.4968009, -1.770737, 0, 0, 0, 1, 1,
-1.728809, -0.5140014, -0.8072412, 0, 0, 0, 1, 1,
-1.714731, 0.1586563, -0.4343103, 0, 0, 0, 1, 1,
-1.696087, 1.385681, -0.5524704, 0, 0, 0, 1, 1,
-1.684209, 0.1858294, -1.371206, 0, 0, 0, 1, 1,
-1.6672, 0.3262643, -1.378076, 1, 1, 1, 1, 1,
-1.65941, -0.2967319, -1.642676, 1, 1, 1, 1, 1,
-1.652203, -0.151812, -2.561235, 1, 1, 1, 1, 1,
-1.648137, 1.141761, -0.6403877, 1, 1, 1, 1, 1,
-1.633963, 0.1860269, 0.07496072, 1, 1, 1, 1, 1,
-1.614247, -3.854069, -2.642123, 1, 1, 1, 1, 1,
-1.596006, 0.5911341, -2.427228, 1, 1, 1, 1, 1,
-1.595235, 1.024567, -2.075742, 1, 1, 1, 1, 1,
-1.584907, -0.3193498, -0.9050385, 1, 1, 1, 1, 1,
-1.578809, -0.7506077, -1.140909, 1, 1, 1, 1, 1,
-1.572758, -0.8947731, -2.472014, 1, 1, 1, 1, 1,
-1.552356, 0.01717153, -3.325284, 1, 1, 1, 1, 1,
-1.551758, -0.4153177, -2.048783, 1, 1, 1, 1, 1,
-1.551085, 1.553506, -0.1533197, 1, 1, 1, 1, 1,
-1.549057, 0.376541, 0.17029, 1, 1, 1, 1, 1,
-1.548493, -0.175294, -0.7431421, 0, 0, 1, 1, 1,
-1.536331, 0.5901982, -2.252169, 1, 0, 0, 1, 1,
-1.535059, -0.02596345, -2.075295, 1, 0, 0, 1, 1,
-1.532526, -1.289846, -4.369933, 1, 0, 0, 1, 1,
-1.531815, -0.7234566, -2.658326, 1, 0, 0, 1, 1,
-1.528862, -1.060317, -2.491844, 1, 0, 0, 1, 1,
-1.510578, -0.8575284, -2.970481, 0, 0, 0, 1, 1,
-1.503188, 0.2450856, -0.7432662, 0, 0, 0, 1, 1,
-1.500737, -0.539775, -0.5398323, 0, 0, 0, 1, 1,
-1.493866, 1.596937, 0.05405934, 0, 0, 0, 1, 1,
-1.492444, -0.1381008, -1.086909, 0, 0, 0, 1, 1,
-1.47106, -0.7805762, -3.421613, 0, 0, 0, 1, 1,
-1.467295, -2.029287, -1.054815, 0, 0, 0, 1, 1,
-1.457825, 1.100104, -0.7110591, 1, 1, 1, 1, 1,
-1.445855, -0.30408, -0.5073052, 1, 1, 1, 1, 1,
-1.420881, 0.2783804, -1.367948, 1, 1, 1, 1, 1,
-1.419579, -0.1552827, -2.551049, 1, 1, 1, 1, 1,
-1.397281, 1.981623, -0.5155566, 1, 1, 1, 1, 1,
-1.396173, 2.584634, 0.3736762, 1, 1, 1, 1, 1,
-1.395712, -0.1720879, -1.064199, 1, 1, 1, 1, 1,
-1.387489, 0.8431742, -1.797415, 1, 1, 1, 1, 1,
-1.382502, 0.7661918, -1.088785, 1, 1, 1, 1, 1,
-1.368426, 1.025175, -1.038658, 1, 1, 1, 1, 1,
-1.367147, -0.7540734, -2.03778, 1, 1, 1, 1, 1,
-1.364434, -0.1396735, -1.74714, 1, 1, 1, 1, 1,
-1.36047, 0.3782377, -0.6753675, 1, 1, 1, 1, 1,
-1.357707, 1.250841, -2.585806, 1, 1, 1, 1, 1,
-1.35015, 1.161761, 0.2366877, 1, 1, 1, 1, 1,
-1.348569, 1.625912, -1.539338, 0, 0, 1, 1, 1,
-1.337644, -1.400425, -2.678594, 1, 0, 0, 1, 1,
-1.327656, 0.9359931, 0.6980044, 1, 0, 0, 1, 1,
-1.320404, -0.3748282, -1.583147, 1, 0, 0, 1, 1,
-1.309578, -0.789056, -1.68011, 1, 0, 0, 1, 1,
-1.309396, 0.5545016, 0.9752376, 1, 0, 0, 1, 1,
-1.303916, 0.04379728, -0.4857931, 0, 0, 0, 1, 1,
-1.301372, 0.3386786, -1.868845, 0, 0, 0, 1, 1,
-1.294667, -0.7570639, -3.326841, 0, 0, 0, 1, 1,
-1.292055, 0.2745347, -0.5258893, 0, 0, 0, 1, 1,
-1.287213, -2.141067, -3.94035, 0, 0, 0, 1, 1,
-1.286595, 0.8673949, 0.06624221, 0, 0, 0, 1, 1,
-1.284445, 0.7722874, 0.5484003, 0, 0, 0, 1, 1,
-1.278738, 0.2170711, 0.179084, 1, 1, 1, 1, 1,
-1.275206, -0.6737605, -2.754516, 1, 1, 1, 1, 1,
-1.25856, 0.9345822, 0.4882403, 1, 1, 1, 1, 1,
-1.254586, 0.7846592, -1.6313, 1, 1, 1, 1, 1,
-1.25353, 0.4027385, -0.3233937, 1, 1, 1, 1, 1,
-1.233573, -0.2245881, -0.7321323, 1, 1, 1, 1, 1,
-1.225525, 1.080559, -0.6596153, 1, 1, 1, 1, 1,
-1.221296, 0.0215536, -1.277138, 1, 1, 1, 1, 1,
-1.215771, -1.006379, -1.667763, 1, 1, 1, 1, 1,
-1.21045, 0.8402022, -1.598023, 1, 1, 1, 1, 1,
-1.204986, -0.1878416, -1.973603, 1, 1, 1, 1, 1,
-1.200101, 0.3613513, -2.073798, 1, 1, 1, 1, 1,
-1.193112, -0.64083, -3.81327, 1, 1, 1, 1, 1,
-1.190059, 0.1669458, -0.8509486, 1, 1, 1, 1, 1,
-1.177729, 1.059462, 0.4258586, 1, 1, 1, 1, 1,
-1.170716, -0.1807576, -0.6816179, 0, 0, 1, 1, 1,
-1.161369, -0.09085736, -2.01678, 1, 0, 0, 1, 1,
-1.159883, -1.0106, -2.073657, 1, 0, 0, 1, 1,
-1.157888, -0.9834701, -2.171549, 1, 0, 0, 1, 1,
-1.155617, 0.1926178, -1.599669, 1, 0, 0, 1, 1,
-1.15451, 1.082985, -0.7776993, 1, 0, 0, 1, 1,
-1.153107, 0.04149402, -1.325823, 0, 0, 0, 1, 1,
-1.152934, -0.1329874, -1.706629, 0, 0, 0, 1, 1,
-1.151129, -0.6185927, -0.6279296, 0, 0, 0, 1, 1,
-1.149749, 1.799431, -1.487395, 0, 0, 0, 1, 1,
-1.146321, 0.848621, -1.522868, 0, 0, 0, 1, 1,
-1.145301, -0.1646127, -1.786451, 0, 0, 0, 1, 1,
-1.144598, -0.007353851, -0.7070064, 0, 0, 0, 1, 1,
-1.143755, 1.128314, 0.5444858, 1, 1, 1, 1, 1,
-1.141058, -1.030959, -2.609852, 1, 1, 1, 1, 1,
-1.133334, 0.7590544, -0.2936285, 1, 1, 1, 1, 1,
-1.129946, -0.09515493, -0.7450679, 1, 1, 1, 1, 1,
-1.122115, -0.5391604, -1.680359, 1, 1, 1, 1, 1,
-1.1216, -0.3314342, -2.746454, 1, 1, 1, 1, 1,
-1.121557, 1.16808, -1.383238, 1, 1, 1, 1, 1,
-1.119583, -1.578069, -2.751061, 1, 1, 1, 1, 1,
-1.112516, 0.2478872, -2.180199, 1, 1, 1, 1, 1,
-1.111244, -1.56876, -2.332074, 1, 1, 1, 1, 1,
-1.110749, 0.1567293, -0.9282377, 1, 1, 1, 1, 1,
-1.106944, -0.8388748, -3.427759, 1, 1, 1, 1, 1,
-1.099857, -0.7828301, -3.469445, 1, 1, 1, 1, 1,
-1.098966, -0.2080769, -1.407847, 1, 1, 1, 1, 1,
-1.095167, -0.7430413, -2.169658, 1, 1, 1, 1, 1,
-1.092806, -0.03600657, -1.910135, 0, 0, 1, 1, 1,
-1.090996, -0.08326925, -0.7951521, 1, 0, 0, 1, 1,
-1.089619, -0.0498804, -1.059819, 1, 0, 0, 1, 1,
-1.087092, -2.436734, -3.3275, 1, 0, 0, 1, 1,
-1.082549, 0.3948116, -1.741119, 1, 0, 0, 1, 1,
-1.076387, 0.2642007, -2.044003, 1, 0, 0, 1, 1,
-1.068638, -0.3431993, -3.242001, 0, 0, 0, 1, 1,
-1.067871, -0.4690817, -1.691118, 0, 0, 0, 1, 1,
-1.063253, -0.8069294, -3.893918, 0, 0, 0, 1, 1,
-1.062732, -1.403328, -1.757344, 0, 0, 0, 1, 1,
-1.059492, 2.402221, -1.445076, 0, 0, 0, 1, 1,
-1.056626, 0.335648, 0.5401084, 0, 0, 0, 1, 1,
-1.054341, -2.339582, -2.280871, 0, 0, 0, 1, 1,
-1.054185, 1.846257, -1.169735, 1, 1, 1, 1, 1,
-1.033084, 0.1925138, -1.418314, 1, 1, 1, 1, 1,
-1.03018, -1.045056, -2.5444, 1, 1, 1, 1, 1,
-1.016251, 0.1886431, -1.193982, 1, 1, 1, 1, 1,
-1.01113, 0.618595, 0.1919729, 1, 1, 1, 1, 1,
-1.010422, 0.5013664, -1.019454, 1, 1, 1, 1, 1,
-1.008673, 0.3885665, -0.2337583, 1, 1, 1, 1, 1,
-1.006435, 0.7039732, -1.682468, 1, 1, 1, 1, 1,
-1.004041, -0.5450874, -1.528891, 1, 1, 1, 1, 1,
-1.003014, -1.273884, -4.88212, 1, 1, 1, 1, 1,
-1.001726, 1.125415, -0.8383113, 1, 1, 1, 1, 1,
-1.000304, -0.322744, -1.90777, 1, 1, 1, 1, 1,
-0.9995422, -0.3927156, -2.582452, 1, 1, 1, 1, 1,
-0.9958465, 0.1469181, -1.744179, 1, 1, 1, 1, 1,
-0.9951076, 0.08105555, -2.968201, 1, 1, 1, 1, 1,
-0.9941128, -0.06169357, 0.002545416, 0, 0, 1, 1, 1,
-0.993157, 0.8229603, 0.6499549, 1, 0, 0, 1, 1,
-0.9893985, -2.389844, -1.794702, 1, 0, 0, 1, 1,
-0.9881096, 0.3822655, -1.100201, 1, 0, 0, 1, 1,
-0.987592, 1.924545, -2.558078, 1, 0, 0, 1, 1,
-0.98159, 0.7448925, -0.2754727, 1, 0, 0, 1, 1,
-0.9753936, -1.462387, -2.438868, 0, 0, 0, 1, 1,
-0.9751574, 0.3468293, -0.8198164, 0, 0, 0, 1, 1,
-0.9749052, 0.7812428, -1.04491, 0, 0, 0, 1, 1,
-0.9742621, -0.559635, -3.013079, 0, 0, 0, 1, 1,
-0.960742, 0.368027, 0.4119774, 0, 0, 0, 1, 1,
-0.9594837, -2.803064, -2.255235, 0, 0, 0, 1, 1,
-0.9541352, 0.6286476, -0.4298778, 0, 0, 0, 1, 1,
-0.9496745, -0.4589576, -2.854816, 1, 1, 1, 1, 1,
-0.9481847, -2.711894, -2.378978, 1, 1, 1, 1, 1,
-0.9480937, -0.1204954, -0.8383061, 1, 1, 1, 1, 1,
-0.9457237, 0.8633382, -1.603549, 1, 1, 1, 1, 1,
-0.9415931, -1.015975, -1.360428, 1, 1, 1, 1, 1,
-0.9394329, -1.399058, -3.892808, 1, 1, 1, 1, 1,
-0.9356955, -0.06927286, -0.626586, 1, 1, 1, 1, 1,
-0.9353511, 0.6460614, -1.249258, 1, 1, 1, 1, 1,
-0.935208, -0.6090164, -2.010679, 1, 1, 1, 1, 1,
-0.9333653, -0.5714078, -1.958918, 1, 1, 1, 1, 1,
-0.9296888, 0.5573388, -1.591974, 1, 1, 1, 1, 1,
-0.927294, 0.2091258, -1.327514, 1, 1, 1, 1, 1,
-0.9259923, -1.137265, -3.106107, 1, 1, 1, 1, 1,
-0.9256094, -0.6827763, -3.048, 1, 1, 1, 1, 1,
-0.9254004, -1.531531, -2.284021, 1, 1, 1, 1, 1,
-0.9130047, -0.8962786, -2.260248, 0, 0, 1, 1, 1,
-0.9114413, 1.139381, -0.5154219, 1, 0, 0, 1, 1,
-0.9079946, 0.2734565, -1.570693, 1, 0, 0, 1, 1,
-0.9078574, 0.9478591, -0.9584989, 1, 0, 0, 1, 1,
-0.9074988, 0.116333, -2.514486, 1, 0, 0, 1, 1,
-0.898936, -1.939971, -1.184029, 1, 0, 0, 1, 1,
-0.8964161, 1.908708, -0.5809345, 0, 0, 0, 1, 1,
-0.8960245, -1.602435, -3.460849, 0, 0, 0, 1, 1,
-0.8934434, 0.02627162, -1.980168, 0, 0, 0, 1, 1,
-0.880209, 0.4715055, -1.606046, 0, 0, 0, 1, 1,
-0.8736668, -1.462793, -3.349177, 0, 0, 0, 1, 1,
-0.8730231, 1.97662, -0.2033673, 0, 0, 0, 1, 1,
-0.8719786, -1.426713, -2.96544, 0, 0, 0, 1, 1,
-0.8714615, 0.02804966, -2.393183, 1, 1, 1, 1, 1,
-0.8710161, 1.123882, 1.486947, 1, 1, 1, 1, 1,
-0.8686126, 1.094776, 0.80016, 1, 1, 1, 1, 1,
-0.8574551, -0.8227277, -3.042984, 1, 1, 1, 1, 1,
-0.857155, -0.1375842, -1.050475, 1, 1, 1, 1, 1,
-0.8511416, 0.2096841, -0.9869545, 1, 1, 1, 1, 1,
-0.8507413, -1.558724, -3.630536, 1, 1, 1, 1, 1,
-0.8506606, -1.038154, -1.838457, 1, 1, 1, 1, 1,
-0.8472151, 1.28262, -1.682513, 1, 1, 1, 1, 1,
-0.8425202, -0.110937, -0.5086936, 1, 1, 1, 1, 1,
-0.839943, 0.216101, -1.24182, 1, 1, 1, 1, 1,
-0.8321674, 2.360007, -0.2112469, 1, 1, 1, 1, 1,
-0.8317042, -2.197022, -1.463946, 1, 1, 1, 1, 1,
-0.8282229, 0.4799331, -2.199103, 1, 1, 1, 1, 1,
-0.8276057, -0.7465128, -1.784789, 1, 1, 1, 1, 1,
-0.8266069, 0.03098203, -0.9566378, 0, 0, 1, 1, 1,
-0.8220593, 0.8893969, 0.3078916, 1, 0, 0, 1, 1,
-0.8195282, 2.332741, 0.3517263, 1, 0, 0, 1, 1,
-0.8185927, -0.914128, -1.759552, 1, 0, 0, 1, 1,
-0.8150125, 0.9580792, -0.9093521, 1, 0, 0, 1, 1,
-0.8144138, -0.7262818, -2.892888, 1, 0, 0, 1, 1,
-0.8106124, 1.369197, -0.3643627, 0, 0, 0, 1, 1,
-0.8059679, -0.7457188, -1.540394, 0, 0, 0, 1, 1,
-0.8023818, -0.9065802, -1.864722, 0, 0, 0, 1, 1,
-0.7943558, -0.4890509, -2.732218, 0, 0, 0, 1, 1,
-0.7910863, 1.779306, 0.6521646, 0, 0, 0, 1, 1,
-0.7897425, 0.3168831, -1.181442, 0, 0, 0, 1, 1,
-0.7890483, -0.03939801, -1.191944, 0, 0, 0, 1, 1,
-0.7875152, -1.73875, -2.613647, 1, 1, 1, 1, 1,
-0.7852973, -1.31799, -2.117405, 1, 1, 1, 1, 1,
-0.7669929, -0.3943495, -3.48143, 1, 1, 1, 1, 1,
-0.7557032, -0.8140129, -1.873531, 1, 1, 1, 1, 1,
-0.7521918, 0.9362037, -0.2084007, 1, 1, 1, 1, 1,
-0.7504947, -0.5802893, -2.40407, 1, 1, 1, 1, 1,
-0.7486731, 0.7856872, 0.442417, 1, 1, 1, 1, 1,
-0.746919, 0.6544232, -1.063482, 1, 1, 1, 1, 1,
-0.7455914, 1.472801, -0.5940598, 1, 1, 1, 1, 1,
-0.7392951, -0.3664205, -1.760736, 1, 1, 1, 1, 1,
-0.7376162, -1.940706, -2.73351, 1, 1, 1, 1, 1,
-0.7287509, -1.881803, -3.574597, 1, 1, 1, 1, 1,
-0.7260685, 0.3254182, -1.159635, 1, 1, 1, 1, 1,
-0.7235097, -0.08965896, -2.411044, 1, 1, 1, 1, 1,
-0.7210974, -1.086772, -2.436148, 1, 1, 1, 1, 1,
-0.7159851, 0.8075004, -1.786312, 0, 0, 1, 1, 1,
-0.7121521, -0.02076213, -0.8150188, 1, 0, 0, 1, 1,
-0.7118452, -0.4768614, -4.677945, 1, 0, 0, 1, 1,
-0.7092463, 1.327147, 0.311614, 1, 0, 0, 1, 1,
-0.7078945, -2.074107, -3.089034, 1, 0, 0, 1, 1,
-0.7074014, -0.9468939, 0.1319767, 1, 0, 0, 1, 1,
-0.7056053, -0.05972793, -1.264716, 0, 0, 0, 1, 1,
-0.702031, 0.4869747, -0.8268908, 0, 0, 0, 1, 1,
-0.6998907, 1.578967, -1.319775, 0, 0, 0, 1, 1,
-0.6989447, -0.1331381, -2.278272, 0, 0, 0, 1, 1,
-0.6965008, 0.8729145, 0.8034306, 0, 0, 0, 1, 1,
-0.6911899, -2.247018, -4.09621, 0, 0, 0, 1, 1,
-0.6891959, -1.208504, -1.466023, 0, 0, 0, 1, 1,
-0.6867748, 0.2378757, -1.279975, 1, 1, 1, 1, 1,
-0.6853969, 1.10845, 0.8153266, 1, 1, 1, 1, 1,
-0.6695997, 0.08373283, -3.336204, 1, 1, 1, 1, 1,
-0.6693826, 0.253621, -1.666226, 1, 1, 1, 1, 1,
-0.668081, -0.2742415, -0.6842016, 1, 1, 1, 1, 1,
-0.6651299, 1.27175, -0.6900688, 1, 1, 1, 1, 1,
-0.6643465, 0.6542999, -1.253813, 1, 1, 1, 1, 1,
-0.6612669, 0.8737001, -1.662106, 1, 1, 1, 1, 1,
-0.6562901, 0.4555589, -1.462668, 1, 1, 1, 1, 1,
-0.6533432, 0.5005852, -0.565551, 1, 1, 1, 1, 1,
-0.6513866, 0.82188, 0.7658805, 1, 1, 1, 1, 1,
-0.651112, -0.9459255, -2.397314, 1, 1, 1, 1, 1,
-0.6387248, -0.433948, -1.314919, 1, 1, 1, 1, 1,
-0.6287593, -1.032508, -1.93444, 1, 1, 1, 1, 1,
-0.6284992, -0.2915919, -2.469024, 1, 1, 1, 1, 1,
-0.6199874, -0.0261084, -1.41142, 0, 0, 1, 1, 1,
-0.6093939, 0.0324571, -1.34219, 1, 0, 0, 1, 1,
-0.6093397, -2.485679, -4.823436, 1, 0, 0, 1, 1,
-0.6058854, 0.1559689, -1.910751, 1, 0, 0, 1, 1,
-0.6051536, -1.243985, -4.005198, 1, 0, 0, 1, 1,
-0.6042612, 1.029665, 0.07387821, 1, 0, 0, 1, 1,
-0.5994148, -1.070195, -2.459118, 0, 0, 0, 1, 1,
-0.5947171, -0.2069542, -2.052063, 0, 0, 0, 1, 1,
-0.5942136, 0.2969581, -1.29263, 0, 0, 0, 1, 1,
-0.5919186, 1.933976, 0.8230562, 0, 0, 0, 1, 1,
-0.582387, 1.000535, -0.3682784, 0, 0, 0, 1, 1,
-0.5791938, -0.7891619, -3.357492, 0, 0, 0, 1, 1,
-0.5782885, -0.7939062, -3.382046, 0, 0, 0, 1, 1,
-0.5747375, 0.2246147, -0.9571868, 1, 1, 1, 1, 1,
-0.5741605, 1.679497, 0.2667728, 1, 1, 1, 1, 1,
-0.5740417, 1.083941, -0.8385622, 1, 1, 1, 1, 1,
-0.5711381, 1.594892, -2.279865, 1, 1, 1, 1, 1,
-0.5639693, 0.2983176, -2.065641, 1, 1, 1, 1, 1,
-0.5633574, -0.7866919, -1.579914, 1, 1, 1, 1, 1,
-0.5622878, -1.694608, -3.179254, 1, 1, 1, 1, 1,
-0.5606492, 0.1422667, -2.525775, 1, 1, 1, 1, 1,
-0.5542029, 0.390792, 0.2275232, 1, 1, 1, 1, 1,
-0.5489785, -1.133337, -4.081146, 1, 1, 1, 1, 1,
-0.5477588, 0.5531777, -1.266469, 1, 1, 1, 1, 1,
-0.5355388, -0.3131644, -1.516939, 1, 1, 1, 1, 1,
-0.5259244, 0.5442215, -2.654693, 1, 1, 1, 1, 1,
-0.5246519, -0.971986, -1.638013, 1, 1, 1, 1, 1,
-0.5220222, -0.2180848, -0.08690776, 1, 1, 1, 1, 1,
-0.51402, 0.4525363, -0.09025706, 0, 0, 1, 1, 1,
-0.5133443, 0.06601254, -1.209475, 1, 0, 0, 1, 1,
-0.5129649, 1.004863, 1.339841, 1, 0, 0, 1, 1,
-0.5123287, 0.7952785, -0.1801445, 1, 0, 0, 1, 1,
-0.5077859, 0.3922358, 0.7600498, 1, 0, 0, 1, 1,
-0.5029333, -0.3655194, -3.393808, 1, 0, 0, 1, 1,
-0.5008014, 0.08297632, -1.096663, 0, 0, 0, 1, 1,
-0.4993601, 0.03954565, -2.273806, 0, 0, 0, 1, 1,
-0.4950043, -2.00701, -2.463256, 0, 0, 0, 1, 1,
-0.4907145, 1.18273, -1.251839, 0, 0, 0, 1, 1,
-0.4858952, -0.08288588, -1.220026, 0, 0, 0, 1, 1,
-0.4830728, 0.3875243, -3.575521, 0, 0, 0, 1, 1,
-0.482789, -0.698296, -4.081983, 0, 0, 0, 1, 1,
-0.4816987, 0.5926836, 0.001419387, 1, 1, 1, 1, 1,
-0.4748783, -0.8045449, -3.424468, 1, 1, 1, 1, 1,
-0.4743446, -0.9801582, -2.293959, 1, 1, 1, 1, 1,
-0.4728752, 0.9240108, -0.819958, 1, 1, 1, 1, 1,
-0.4698614, 0.393662, -0.5317023, 1, 1, 1, 1, 1,
-0.469005, -1.511652, -2.236965, 1, 1, 1, 1, 1,
-0.4668013, -1.494111, -3.926365, 1, 1, 1, 1, 1,
-0.4626008, -1.041522, -3.806007, 1, 1, 1, 1, 1,
-0.4600506, 0.2811677, -0.9573247, 1, 1, 1, 1, 1,
-0.4541755, 0.0614543, -1.738932, 1, 1, 1, 1, 1,
-0.4529478, 0.4351567, 0.5151073, 1, 1, 1, 1, 1,
-0.4494483, -1.014245, -1.840426, 1, 1, 1, 1, 1,
-0.4478428, -0.1007361, -0.02240207, 1, 1, 1, 1, 1,
-0.4450469, 0.498383, -2.213845, 1, 1, 1, 1, 1,
-0.4425638, 0.3463533, -1.963881, 1, 1, 1, 1, 1,
-0.438002, -0.4561834, -4.018611, 0, 0, 1, 1, 1,
-0.4358318, 0.04133853, -2.159413, 1, 0, 0, 1, 1,
-0.4349717, 0.9014433, -1.131611, 1, 0, 0, 1, 1,
-0.4320754, 0.3126719, -1.403762, 1, 0, 0, 1, 1,
-0.4275329, 0.2389302, -1.916107, 1, 0, 0, 1, 1,
-0.4235458, -0.6320409, -0.9834845, 1, 0, 0, 1, 1,
-0.4191479, 0.1459532, -0.9210915, 0, 0, 0, 1, 1,
-0.4174057, -0.2921194, -1.33379, 0, 0, 0, 1, 1,
-0.414527, 0.8885393, -1.164786, 0, 0, 0, 1, 1,
-0.4119408, 1.968486, -0.7422242, 0, 0, 0, 1, 1,
-0.4105904, 0.3063042, 1.374687, 0, 0, 0, 1, 1,
-0.4099752, 0.9182979, 0.526821, 0, 0, 0, 1, 1,
-0.408977, 1.728765, -0.6441802, 0, 0, 0, 1, 1,
-0.4089661, -1.014122, -3.230253, 1, 1, 1, 1, 1,
-0.4046686, -0.5226972, -3.155619, 1, 1, 1, 1, 1,
-0.4028051, 0.6066738, -1.058194, 1, 1, 1, 1, 1,
-0.3924689, -0.4874318, -4.284632, 1, 1, 1, 1, 1,
-0.3921941, 0.6022884, -1.171587, 1, 1, 1, 1, 1,
-0.3894058, 0.02176023, -1.771101, 1, 1, 1, 1, 1,
-0.3864807, 0.9923619, -1.013131, 1, 1, 1, 1, 1,
-0.3819043, 0.4293662, 0.1139751, 1, 1, 1, 1, 1,
-0.3719032, 0.2411322, 0.2874103, 1, 1, 1, 1, 1,
-0.3715466, -0.1194135, -1.934857, 1, 1, 1, 1, 1,
-0.3692089, 0.5578225, -0.6687243, 1, 1, 1, 1, 1,
-0.3679826, 1.948344, -0.384146, 1, 1, 1, 1, 1,
-0.3662075, -0.3653682, -2.714411, 1, 1, 1, 1, 1,
-0.3650842, 0.4920174, -0.764126, 1, 1, 1, 1, 1,
-0.363598, -1.139095, -3.972178, 1, 1, 1, 1, 1,
-0.3586471, -0.9378715, -3.122253, 0, 0, 1, 1, 1,
-0.3539031, -1.469188, -3.557817, 1, 0, 0, 1, 1,
-0.3469701, -0.1131424, -1.144934, 1, 0, 0, 1, 1,
-0.3387405, 1.630444, 0.9727857, 1, 0, 0, 1, 1,
-0.3386604, -0.9478801, -3.898456, 1, 0, 0, 1, 1,
-0.3365528, -0.3756679, -3.500675, 1, 0, 0, 1, 1,
-0.3365345, 0.5191782, -0.8590282, 0, 0, 0, 1, 1,
-0.334751, -0.944019, -3.429714, 0, 0, 0, 1, 1,
-0.3325177, -0.5758243, -3.229059, 0, 0, 0, 1, 1,
-0.3306198, 2.094244, 0.2087001, 0, 0, 0, 1, 1,
-0.3261422, 0.1739579, -0.6385084, 0, 0, 0, 1, 1,
-0.3257921, 0.584501, 1.264638, 0, 0, 0, 1, 1,
-0.3178981, 2.096646, -0.3050876, 0, 0, 0, 1, 1,
-0.3162386, 0.5762526, -0.1068207, 1, 1, 1, 1, 1,
-0.3139329, -0.4439242, -2.502126, 1, 1, 1, 1, 1,
-0.3132519, -0.0894038, -1.953956, 1, 1, 1, 1, 1,
-0.3116035, 1.299715, -0.1186641, 1, 1, 1, 1, 1,
-0.309638, 1.146237, -0.1696248, 1, 1, 1, 1, 1,
-0.3077765, 0.1114409, -3.002076, 1, 1, 1, 1, 1,
-0.2981568, -0.7032185, -3.641401, 1, 1, 1, 1, 1,
-0.2967606, 0.8541103, -0.3232277, 1, 1, 1, 1, 1,
-0.2961171, 0.4199263, -1.316199, 1, 1, 1, 1, 1,
-0.2950405, 0.3124847, -2.974722, 1, 1, 1, 1, 1,
-0.2907358, 0.7427795, 0.4577921, 1, 1, 1, 1, 1,
-0.2907293, -0.7581314, -1.514201, 1, 1, 1, 1, 1,
-0.2882625, -0.5673388, -1.51822, 1, 1, 1, 1, 1,
-0.2881888, -0.2986014, -4.363939, 1, 1, 1, 1, 1,
-0.2840089, 0.8999621, 0.3668995, 1, 1, 1, 1, 1,
-0.2805279, -0.4992193, -2.139451, 0, 0, 1, 1, 1,
-0.2788916, -1.976532, -3.423592, 1, 0, 0, 1, 1,
-0.2785225, 1.046365, 0.3496381, 1, 0, 0, 1, 1,
-0.2780169, -1.338045, -2.673561, 1, 0, 0, 1, 1,
-0.2775376, -0.7615583, -4.690757, 1, 0, 0, 1, 1,
-0.275501, -0.845212, -2.176303, 1, 0, 0, 1, 1,
-0.2740627, -0.2606655, -2.563913, 0, 0, 0, 1, 1,
-0.2729789, 0.3177458, -0.1215228, 0, 0, 0, 1, 1,
-0.2696843, 1.769839, -1.132382, 0, 0, 0, 1, 1,
-0.2673168, 0.2535208, -0.715606, 0, 0, 0, 1, 1,
-0.2649201, -0.6656588, -3.135993, 0, 0, 0, 1, 1,
-0.2631024, 0.6851519, -0.9108171, 0, 0, 0, 1, 1,
-0.2590153, 0.008238339, -3.108479, 0, 0, 0, 1, 1,
-0.2574288, -1.150013, -2.767915, 1, 1, 1, 1, 1,
-0.2535709, 1.810511, -0.2094858, 1, 1, 1, 1, 1,
-0.251101, -1.286954, -3.047388, 1, 1, 1, 1, 1,
-0.2449397, -0.4688809, -3.390639, 1, 1, 1, 1, 1,
-0.2415659, 0.3160703, -1.270786, 1, 1, 1, 1, 1,
-0.2410215, 1.488284, 0.3453613, 1, 1, 1, 1, 1,
-0.2381208, -0.8152732, -1.188602, 1, 1, 1, 1, 1,
-0.2329928, -0.6844367, -5.433218, 1, 1, 1, 1, 1,
-0.2301427, -0.1526718, -2.999942, 1, 1, 1, 1, 1,
-0.2260274, 0.2478488, -1.674987, 1, 1, 1, 1, 1,
-0.2231292, -1.633231, -2.935925, 1, 1, 1, 1, 1,
-0.2228099, 0.09898617, -2.025794, 1, 1, 1, 1, 1,
-0.2205205, 0.8385533, -1.838881, 1, 1, 1, 1, 1,
-0.2183648, 0.9882651, -0.4741049, 1, 1, 1, 1, 1,
-0.2163362, 1.384824, 0.4793188, 1, 1, 1, 1, 1,
-0.2156747, 0.9834377, 0.03100556, 0, 0, 1, 1, 1,
-0.2140043, -0.3968718, -3.663244, 1, 0, 0, 1, 1,
-0.2130119, 0.3220451, 0.4092427, 1, 0, 0, 1, 1,
-0.2124867, 0.8583496, -1.670452, 1, 0, 0, 1, 1,
-0.2102908, 1.2489, -1.025476, 1, 0, 0, 1, 1,
-0.2063625, -0.6506345, -2.388994, 1, 0, 0, 1, 1,
-0.2036023, 0.9031939, -1.305342, 0, 0, 0, 1, 1,
-0.2028392, 0.7246494, 0.8795356, 0, 0, 0, 1, 1,
-0.2028018, 0.1678486, -0.1381362, 0, 0, 0, 1, 1,
-0.200925, 1.084735, -0.4762929, 0, 0, 0, 1, 1,
-0.2000971, -2.324781, -3.105274, 0, 0, 0, 1, 1,
-0.1996328, 2.047404, -1.667278, 0, 0, 0, 1, 1,
-0.1917655, 0.2635174, -0.60707, 0, 0, 0, 1, 1,
-0.189666, -0.4639076, -2.460258, 1, 1, 1, 1, 1,
-0.1889667, -0.2055479, -1.495912, 1, 1, 1, 1, 1,
-0.1876385, 0.4398064, -0.05223678, 1, 1, 1, 1, 1,
-0.1875516, -0.7149639, -3.983226, 1, 1, 1, 1, 1,
-0.186594, 0.3552822, 0.9874461, 1, 1, 1, 1, 1,
-0.1799704, 0.857954, 0.9854785, 1, 1, 1, 1, 1,
-0.1798635, 0.05651283, -1.902276, 1, 1, 1, 1, 1,
-0.1768951, 0.2938258, -0.6238832, 1, 1, 1, 1, 1,
-0.1728083, 0.6389348, 0.4109851, 1, 1, 1, 1, 1,
-0.1694834, -0.4811413, -3.594753, 1, 1, 1, 1, 1,
-0.1690931, -0.2637855, -3.740228, 1, 1, 1, 1, 1,
-0.1689929, 0.912385, 0.681868, 1, 1, 1, 1, 1,
-0.1683437, 0.2674522, 0.1029232, 1, 1, 1, 1, 1,
-0.1676292, 0.6444963, 1.638232, 1, 1, 1, 1, 1,
-0.164826, 0.3270458, -1.129935, 1, 1, 1, 1, 1,
-0.1644433, 0.4895196, -1.413996, 0, 0, 1, 1, 1,
-0.1541336, -1.365978, -2.164741, 1, 0, 0, 1, 1,
-0.1529346, 0.8854343, -1.08832, 1, 0, 0, 1, 1,
-0.1518007, 0.3299142, -0.2489098, 1, 0, 0, 1, 1,
-0.1508613, 0.4546588, 0.623714, 1, 0, 0, 1, 1,
-0.1506414, 1.60288, -0.6535109, 1, 0, 0, 1, 1,
-0.1478302, -0.8134902, -2.000124, 0, 0, 0, 1, 1,
-0.1466306, -0.3217162, -2.272915, 0, 0, 0, 1, 1,
-0.1369984, -0.2079166, -1.574318, 0, 0, 0, 1, 1,
-0.13155, -1.055093, -1.724767, 0, 0, 0, 1, 1,
-0.1269201, -2.315435, -2.3335, 0, 0, 0, 1, 1,
-0.1251207, -0.5561115, -3.594909, 0, 0, 0, 1, 1,
-0.1182112, -0.7968893, -2.340137, 0, 0, 0, 1, 1,
-0.1170127, -0.08474429, -3.791738, 1, 1, 1, 1, 1,
-0.1134276, 0.6084408, 1.55008, 1, 1, 1, 1, 1,
-0.1128595, -1.839919, -4.476006, 1, 1, 1, 1, 1,
-0.1106759, -1.56332, -4.919503, 1, 1, 1, 1, 1,
-0.1021124, 1.34955, -0.05756823, 1, 1, 1, 1, 1,
-0.1007436, -0.4144448, -2.528567, 1, 1, 1, 1, 1,
-0.09994789, 0.1915281, -1.122729, 1, 1, 1, 1, 1,
-0.09897134, 1.082091, 1.141185, 1, 1, 1, 1, 1,
-0.09824995, 0.3466958, -0.9953083, 1, 1, 1, 1, 1,
-0.0946226, -0.8824804, -3.933564, 1, 1, 1, 1, 1,
-0.09212251, 0.3242628, -1.069976, 1, 1, 1, 1, 1,
-0.0902741, -0.8681182, -4.372823, 1, 1, 1, 1, 1,
-0.08944463, 2.846849, -0.6572464, 1, 1, 1, 1, 1,
-0.08875276, -0.8013265, -2.808506, 1, 1, 1, 1, 1,
-0.0871519, 0.2610023, 1.725416, 1, 1, 1, 1, 1,
-0.08454129, -0.9087237, -0.0640827, 0, 0, 1, 1, 1,
-0.08251733, 0.1807259, -0.5273454, 1, 0, 0, 1, 1,
-0.08168174, 1.327659, 0.5347354, 1, 0, 0, 1, 1,
-0.07920046, 0.7574471, -0.05678999, 1, 0, 0, 1, 1,
-0.07919294, -0.4118208, -0.7624761, 1, 0, 0, 1, 1,
-0.07486053, 2.017578, 0.9902339, 1, 0, 0, 1, 1,
-0.07404524, 0.2952439, 0.1777204, 0, 0, 0, 1, 1,
-0.07192176, 2.724739, -1.438513, 0, 0, 0, 1, 1,
-0.06556187, -0.09144624, -4.251056, 0, 0, 0, 1, 1,
-0.06286973, 0.9967144, 0.1481595, 0, 0, 0, 1, 1,
-0.0590664, 1.028618, -0.04791622, 0, 0, 0, 1, 1,
-0.05273183, -1.816241, -1.636235, 0, 0, 0, 1, 1,
-0.04881068, 0.06086047, 0.3472838, 0, 0, 0, 1, 1,
-0.04366433, 0.3413459, -0.389535, 1, 1, 1, 1, 1,
-0.03771777, -0.5636478, -2.240806, 1, 1, 1, 1, 1,
-0.03287885, 0.02165217, -1.141919, 1, 1, 1, 1, 1,
-0.03186396, -2.472919, -2.014789, 1, 1, 1, 1, 1,
-0.03186202, -0.1747449, -2.084898, 1, 1, 1, 1, 1,
-0.03184465, -1.083127, -2.577227, 1, 1, 1, 1, 1,
-0.02951667, 0.7007639, -1.480933, 1, 1, 1, 1, 1,
-0.02871903, 0.7866031, 0.3812479, 1, 1, 1, 1, 1,
-0.02561227, 0.4492672, 0.08999888, 1, 1, 1, 1, 1,
-0.02554619, 0.3187306, 0.4742167, 1, 1, 1, 1, 1,
-0.01997647, 0.4672064, -1.17782, 1, 1, 1, 1, 1,
-0.01488559, -1.095681, -5.541061, 1, 1, 1, 1, 1,
-0.009381136, -0.138738, -3.02097, 1, 1, 1, 1, 1,
-0.001164264, -0.3472209, -3.715269, 1, 1, 1, 1, 1,
0.001083383, -0.01511637, 3.12637, 1, 1, 1, 1, 1,
0.002414719, 0.2719631, -0.7547295, 0, 0, 1, 1, 1,
0.0048614, -1.103592, 3.173694, 1, 0, 0, 1, 1,
0.008511601, 0.1704363, 2.171031, 1, 0, 0, 1, 1,
0.01270162, -0.5920892, 1.024344, 1, 0, 0, 1, 1,
0.01714294, 0.0104319, 1.407105, 1, 0, 0, 1, 1,
0.01888185, 0.4520316, 0.9655136, 1, 0, 0, 1, 1,
0.01948213, -1.825327, 2.302523, 0, 0, 0, 1, 1,
0.02244127, 0.2621311, -0.4881049, 0, 0, 0, 1, 1,
0.02629318, 0.4790924, -0.7595299, 0, 0, 0, 1, 1,
0.02759475, 0.2905112, -0.1372872, 0, 0, 0, 1, 1,
0.02784683, -1.170129, 2.725728, 0, 0, 0, 1, 1,
0.02869925, -0.7896934, 4.451443, 0, 0, 0, 1, 1,
0.03340523, -1.927583, 4.268696, 0, 0, 0, 1, 1,
0.03480143, -1.746485, 4.061464, 1, 1, 1, 1, 1,
0.03872679, -0.9004667, 2.59427, 1, 1, 1, 1, 1,
0.04384196, -0.09568501, 1.725999, 1, 1, 1, 1, 1,
0.04438587, -1.095644, 4.017036, 1, 1, 1, 1, 1,
0.04873835, -0.05722075, 2.249312, 1, 1, 1, 1, 1,
0.05112103, 0.9122165, -1.239877, 1, 1, 1, 1, 1,
0.05520837, 0.7563394, 0.2434807, 1, 1, 1, 1, 1,
0.0616308, 1.587386, -0.8807385, 1, 1, 1, 1, 1,
0.06190575, -0.2788826, 2.366152, 1, 1, 1, 1, 1,
0.06384966, -0.4300005, 2.865947, 1, 1, 1, 1, 1,
0.06432772, -0.6517012, 3.740983, 1, 1, 1, 1, 1,
0.06785586, -0.3760058, 3.795718, 1, 1, 1, 1, 1,
0.0680019, 0.4845001, 0.6233861, 1, 1, 1, 1, 1,
0.06993881, 0.1315546, 2.006091, 1, 1, 1, 1, 1,
0.07956029, 1.574215, 0.5525831, 1, 1, 1, 1, 1,
0.08017704, 0.4201297, -0.4294846, 0, 0, 1, 1, 1,
0.08273926, 0.5790374, -0.5000878, 1, 0, 0, 1, 1,
0.08299772, -0.4184853, 4.465121, 1, 0, 0, 1, 1,
0.0833791, -0.3636141, 3.01456, 1, 0, 0, 1, 1,
0.08514396, -0.218634, 3.769454, 1, 0, 0, 1, 1,
0.08578858, -1.093532, 2.684686, 1, 0, 0, 1, 1,
0.08909249, -1.984921, 1.637581, 0, 0, 0, 1, 1,
0.09513164, 0.1037336, 1.682246, 0, 0, 0, 1, 1,
0.09735464, -2.214019, 2.379481, 0, 0, 0, 1, 1,
0.1089411, -0.2329554, 3.249744, 0, 0, 0, 1, 1,
0.1105171, -2.133727, 4.307343, 0, 0, 0, 1, 1,
0.1113921, 0.7763779, -0.6664247, 0, 0, 0, 1, 1,
0.1190668, -1.072137, 3.221349, 0, 0, 0, 1, 1,
0.1193686, 0.3610751, 0.9533222, 1, 1, 1, 1, 1,
0.1220353, 0.5981416, 1.724242, 1, 1, 1, 1, 1,
0.1317938, 0.6167458, -0.8052984, 1, 1, 1, 1, 1,
0.1334228, 2.460294, -1.128074, 1, 1, 1, 1, 1,
0.1372137, 0.7365047, 1.575264, 1, 1, 1, 1, 1,
0.1372412, -0.05478041, 1.91591, 1, 1, 1, 1, 1,
0.1387705, 0.6371605, -0.3590605, 1, 1, 1, 1, 1,
0.1389846, -0.6070871, 2.976597, 1, 1, 1, 1, 1,
0.1426208, 0.5961399, -0.1269335, 1, 1, 1, 1, 1,
0.1443924, -0.1075033, 3.231506, 1, 1, 1, 1, 1,
0.1483055, 0.04688415, 1.765135, 1, 1, 1, 1, 1,
0.1523753, -0.7593225, 2.882749, 1, 1, 1, 1, 1,
0.1539779, 0.6894869, -0.4922811, 1, 1, 1, 1, 1,
0.1544861, -1.973417, 1.956515, 1, 1, 1, 1, 1,
0.1626211, 1.934518, 1.838746, 1, 1, 1, 1, 1,
0.1684431, -1.259518, 3.935021, 0, 0, 1, 1, 1,
0.1714686, 2.375324, 0.6085057, 1, 0, 0, 1, 1,
0.1722742, 1.907682, -0.562646, 1, 0, 0, 1, 1,
0.1860308, -0.2263707, -0.02826259, 1, 0, 0, 1, 1,
0.1884285, 1.797902, -0.5571477, 1, 0, 0, 1, 1,
0.1928674, 0.5199486, 0.124038, 1, 0, 0, 1, 1,
0.1936616, -0.3531377, 2.957294, 0, 0, 0, 1, 1,
0.1942902, 0.9599359, -0.513613, 0, 0, 0, 1, 1,
0.1945954, 0.02215443, 1.29223, 0, 0, 0, 1, 1,
0.1947907, 0.2379845, 0.7351423, 0, 0, 0, 1, 1,
0.1979173, -0.802063, 3.16359, 0, 0, 0, 1, 1,
0.1999983, -1.617024, 4.557586, 0, 0, 0, 1, 1,
0.2085597, 0.2294394, 0.337275, 0, 0, 0, 1, 1,
0.2107322, 1.335535, 0.4919279, 1, 1, 1, 1, 1,
0.214494, 1.273981, 0.08697978, 1, 1, 1, 1, 1,
0.2177636, -0.5187597, 3.220495, 1, 1, 1, 1, 1,
0.2204137, 1.743879, -0.3917476, 1, 1, 1, 1, 1,
0.2224795, -0.9589078, 4.380553, 1, 1, 1, 1, 1,
0.2263962, -0.6123468, 3.494841, 1, 1, 1, 1, 1,
0.2277335, -0.9786021, 2.735582, 1, 1, 1, 1, 1,
0.2287645, -1.744187, 2.310932, 1, 1, 1, 1, 1,
0.2289709, -1.321526, 1.241334, 1, 1, 1, 1, 1,
0.2297556, 0.1759387, 1.107849, 1, 1, 1, 1, 1,
0.2305289, 1.304088, -0.4723603, 1, 1, 1, 1, 1,
0.2346499, 0.270359, 0.2776739, 1, 1, 1, 1, 1,
0.2361236, -0.1560689, 1.410255, 1, 1, 1, 1, 1,
0.2375247, -0.03180894, 1.004889, 1, 1, 1, 1, 1,
0.2382957, 0.81902, -0.2823158, 1, 1, 1, 1, 1,
0.2385964, -0.3818209, 2.886781, 0, 0, 1, 1, 1,
0.2409628, -1.618216, 3.759838, 1, 0, 0, 1, 1,
0.2431554, -0.2784157, 0.321697, 1, 0, 0, 1, 1,
0.2453644, -0.1537516, 3.505696, 1, 0, 0, 1, 1,
0.2465603, -1.955688, 3.741488, 1, 0, 0, 1, 1,
0.2466369, -0.192569, 2.054996, 1, 0, 0, 1, 1,
0.2478317, -1.471403, 3.041507, 0, 0, 0, 1, 1,
0.2622361, -1.218712, 2.993823, 0, 0, 0, 1, 1,
0.2678576, 0.8199121, 0.2763708, 0, 0, 0, 1, 1,
0.2683551, -0.3435801, 1.993752, 0, 0, 0, 1, 1,
0.2688377, -0.4405876, 2.350531, 0, 0, 0, 1, 1,
0.2719662, -0.03564519, 2.205101, 0, 0, 0, 1, 1,
0.2730708, 0.1984148, 2.157816, 0, 0, 0, 1, 1,
0.2734102, 1.263968, 0.9001108, 1, 1, 1, 1, 1,
0.2755746, -0.03510447, 0.854765, 1, 1, 1, 1, 1,
0.2761361, -0.7179274, 1.540394, 1, 1, 1, 1, 1,
0.2771564, 0.2530967, 1.658143, 1, 1, 1, 1, 1,
0.2828221, 0.7633499, 1.387183, 1, 1, 1, 1, 1,
0.2839395, -0.5381927, 2.973526, 1, 1, 1, 1, 1,
0.2876749, 0.5726267, -0.1561667, 1, 1, 1, 1, 1,
0.2890548, 0.04528176, 2.623953, 1, 1, 1, 1, 1,
0.3001124, -0.5595217, 2.316872, 1, 1, 1, 1, 1,
0.3058071, -1.717522, 3.0825, 1, 1, 1, 1, 1,
0.3080712, 0.6136008, 1.560766, 1, 1, 1, 1, 1,
0.3136636, 0.02545617, 1.045554, 1, 1, 1, 1, 1,
0.3147494, 0.5036924, 1.350125, 1, 1, 1, 1, 1,
0.3174306, 1.276824, -0.8784038, 1, 1, 1, 1, 1,
0.3183682, -2.175143, 3.909727, 1, 1, 1, 1, 1,
0.3250052, 1.130473, -0.06794863, 0, 0, 1, 1, 1,
0.3268846, 0.5906022, 2.331118, 1, 0, 0, 1, 1,
0.3325914, 1.26187, 1.102847, 1, 0, 0, 1, 1,
0.3326869, -0.190915, 2.435447, 1, 0, 0, 1, 1,
0.3337996, 1.106556, 0.6498834, 1, 0, 0, 1, 1,
0.3388748, 0.9528436, 1.001619, 1, 0, 0, 1, 1,
0.3393238, -1.813843, 1.063252, 0, 0, 0, 1, 1,
0.3408563, 0.1869995, 1.710525, 0, 0, 0, 1, 1,
0.3463418, 0.6265279, -0.3731498, 0, 0, 0, 1, 1,
0.3475564, -0.0724381, 1.472867, 0, 0, 0, 1, 1,
0.3496943, -0.2356137, 2.345983, 0, 0, 0, 1, 1,
0.3498232, 1.288581, -0.1103181, 0, 0, 0, 1, 1,
0.3536644, -0.9433224, 1.97561, 0, 0, 0, 1, 1,
0.3552257, 0.4942454, -0.7122064, 1, 1, 1, 1, 1,
0.3599527, 0.221826, 0.7703918, 1, 1, 1, 1, 1,
0.3637763, 0.2534036, 2.266005, 1, 1, 1, 1, 1,
0.3640392, 0.1422337, -0.1140968, 1, 1, 1, 1, 1,
0.3669013, 0.09325732, 1.652038, 1, 1, 1, 1, 1,
0.3688468, 1.293769, 0.1237858, 1, 1, 1, 1, 1,
0.3702655, 0.1991232, 2.882599, 1, 1, 1, 1, 1,
0.3728402, 0.8033366, -0.2550089, 1, 1, 1, 1, 1,
0.3816025, -0.6706029, 3.813817, 1, 1, 1, 1, 1,
0.3819011, 0.5239373, 1.572293, 1, 1, 1, 1, 1,
0.3826564, -0.8639891, 2.949924, 1, 1, 1, 1, 1,
0.3877747, -0.5880728, 2.164795, 1, 1, 1, 1, 1,
0.3948397, -0.5317842, 1.582695, 1, 1, 1, 1, 1,
0.4029697, -0.05791572, 1.471595, 1, 1, 1, 1, 1,
0.403686, -3.184304, 2.993727, 1, 1, 1, 1, 1,
0.4052295, 1.237082, -0.5560554, 0, 0, 1, 1, 1,
0.4076788, -0.2058996, 1.324727, 1, 0, 0, 1, 1,
0.4106857, -1.274412, 1.145993, 1, 0, 0, 1, 1,
0.4146241, 0.500774, 0.9917152, 1, 0, 0, 1, 1,
0.4170135, 1.379156, -1.558325, 1, 0, 0, 1, 1,
0.4196914, 1.188456, 0.9763681, 1, 0, 0, 1, 1,
0.4198353, -0.3858734, 2.258057, 0, 0, 0, 1, 1,
0.420904, -0.8124721, 2.965502, 0, 0, 0, 1, 1,
0.4241698, 0.9017603, -0.4842244, 0, 0, 0, 1, 1,
0.4268484, 0.8356399, -0.3362136, 0, 0, 0, 1, 1,
0.4306697, 1.036668, 2.685769, 0, 0, 0, 1, 1,
0.4307602, -2.24315, 2.618752, 0, 0, 0, 1, 1,
0.4309632, -0.000967051, 0.7432398, 0, 0, 0, 1, 1,
0.4359896, 0.9044001, 1.429311, 1, 1, 1, 1, 1,
0.4371112, 0.8312318, -1.342006, 1, 1, 1, 1, 1,
0.4375941, 0.4821056, 0.3089341, 1, 1, 1, 1, 1,
0.4410742, -0.1612957, 2.088205, 1, 1, 1, 1, 1,
0.4439424, -0.08217523, 2.420094, 1, 1, 1, 1, 1,
0.4519097, 0.1848968, 1.854393, 1, 1, 1, 1, 1,
0.452355, 0.2332866, 2.386072, 1, 1, 1, 1, 1,
0.4524835, -1.847141, 3.096376, 1, 1, 1, 1, 1,
0.4577034, -0.06355277, 0.7063677, 1, 1, 1, 1, 1,
0.4595728, 1.64186, -0.9778706, 1, 1, 1, 1, 1,
0.4597589, 0.6555287, 2.000503, 1, 1, 1, 1, 1,
0.460759, 0.5843019, 0.7794765, 1, 1, 1, 1, 1,
0.4611151, -0.08876387, 1.268717, 1, 1, 1, 1, 1,
0.4614044, 0.01231917, 1.448174, 1, 1, 1, 1, 1,
0.4620517, -1.154819, 2.221009, 1, 1, 1, 1, 1,
0.464049, 0.3654946, 1.782752, 0, 0, 1, 1, 1,
0.4682281, 0.4475387, -0.8424982, 1, 0, 0, 1, 1,
0.4798716, 0.3541189, 1.625458, 1, 0, 0, 1, 1,
0.4809771, 0.01902373, -0.539237, 1, 0, 0, 1, 1,
0.4830517, 1.532741, 1.826106, 1, 0, 0, 1, 1,
0.4834116, 0.6778041, -1.026951, 1, 0, 0, 1, 1,
0.4845733, 0.5737286, -0.2127897, 0, 0, 0, 1, 1,
0.4856363, 0.5423816, 0.450946, 0, 0, 0, 1, 1,
0.4884676, 1.715377, -0.4207852, 0, 0, 0, 1, 1,
0.489654, -0.105437, -0.08709083, 0, 0, 0, 1, 1,
0.4937276, 0.9680905, 0.9300479, 0, 0, 0, 1, 1,
0.4991404, 0.960529, 0.9809039, 0, 0, 0, 1, 1,
0.5013806, -1.460736, 1.651904, 0, 0, 0, 1, 1,
0.5043375, -2.980724, 3.048905, 1, 1, 1, 1, 1,
0.5064459, -1.052524, 3.786694, 1, 1, 1, 1, 1,
0.5085911, -2.239279, 3.076484, 1, 1, 1, 1, 1,
0.514632, -0.1063066, 1.795667, 1, 1, 1, 1, 1,
0.5154755, 0.3998688, 0.822317, 1, 1, 1, 1, 1,
0.5225082, 1.410286, 0.7656872, 1, 1, 1, 1, 1,
0.526581, 0.04332054, 1.607432, 1, 1, 1, 1, 1,
0.530787, 1.186748, 0.1131005, 1, 1, 1, 1, 1,
0.5325826, 1.323168, -0.6050137, 1, 1, 1, 1, 1,
0.5340294, -0.2156704, 1.866235, 1, 1, 1, 1, 1,
0.5368738, 1.371308, 0.3980126, 1, 1, 1, 1, 1,
0.5433922, -0.6722456, 3.361551, 1, 1, 1, 1, 1,
0.5437938, 0.3471589, 0.36018, 1, 1, 1, 1, 1,
0.545343, -0.2986307, 3.446521, 1, 1, 1, 1, 1,
0.5467318, 0.4970286, 1.948674, 1, 1, 1, 1, 1,
0.5480644, 0.7756113, 2.029923, 0, 0, 1, 1, 1,
0.5491354, 0.2454471, 0.6110398, 1, 0, 0, 1, 1,
0.5501508, 0.02510772, 1.354725, 1, 0, 0, 1, 1,
0.5505015, 0.8127649, -0.04871077, 1, 0, 0, 1, 1,
0.5523371, -0.5349051, 3.431576, 1, 0, 0, 1, 1,
0.5559343, -0.5451608, 1.886596, 1, 0, 0, 1, 1,
0.5574434, -0.4276269, 0.9393868, 0, 0, 0, 1, 1,
0.5582608, -0.3460276, -0.4592751, 0, 0, 0, 1, 1,
0.5584135, 0.2501143, 1.347046, 0, 0, 0, 1, 1,
0.5673163, -0.7634886, 3.246186, 0, 0, 0, 1, 1,
0.5682113, -0.07201749, 0.3536767, 0, 0, 0, 1, 1,
0.5715778, -0.9916653, 0.6499988, 0, 0, 0, 1, 1,
0.5763227, -1.017074, 3.49911, 0, 0, 0, 1, 1,
0.5778226, -0.9071133, 3.505825, 1, 1, 1, 1, 1,
0.579558, 2.198264, 0.8158143, 1, 1, 1, 1, 1,
0.5795742, 0.7025793, -0.09733948, 1, 1, 1, 1, 1,
0.5834122, 0.1183614, 2.095342, 1, 1, 1, 1, 1,
0.5844855, 0.4434256, 1.528117, 1, 1, 1, 1, 1,
0.5850376, -1.840902, 2.955987, 1, 1, 1, 1, 1,
0.5879812, 0.5645589, -0.1079616, 1, 1, 1, 1, 1,
0.591943, 1.750608, -1.420037, 1, 1, 1, 1, 1,
0.5954579, 0.7058089, 0.5467854, 1, 1, 1, 1, 1,
0.5970891, -1.190527, 1.363278, 1, 1, 1, 1, 1,
0.5981051, 0.5897947, -0.5273763, 1, 1, 1, 1, 1,
0.6049879, -0.3749259, 2.41428, 1, 1, 1, 1, 1,
0.6054133, -0.9217388, 4.101896, 1, 1, 1, 1, 1,
0.6128698, -0.8840972, 4.086774, 1, 1, 1, 1, 1,
0.6146007, 1.646748, 0.2619962, 1, 1, 1, 1, 1,
0.6224537, -0.6517857, 3.969548, 0, 0, 1, 1, 1,
0.6314247, -0.6186151, 2.334048, 1, 0, 0, 1, 1,
0.6322194, 1.211636, -0.5579826, 1, 0, 0, 1, 1,
0.6357046, 0.8562701, 0.5971558, 1, 0, 0, 1, 1,
0.6499307, 1.603012, 1.764826, 1, 0, 0, 1, 1,
0.6719556, -0.8393161, 2.702987, 1, 0, 0, 1, 1,
0.6751861, 0.6952195, 1.498935, 0, 0, 0, 1, 1,
0.6855634, -1.588233, 2.535642, 0, 0, 0, 1, 1,
0.6856534, -0.2784792, 3.01683, 0, 0, 0, 1, 1,
0.6862502, -0.62517, 2.701777, 0, 0, 0, 1, 1,
0.6862651, 1.962132, 3.140971, 0, 0, 0, 1, 1,
0.6929111, 0.9355767, 0.03462315, 0, 0, 0, 1, 1,
0.6954543, 0.7863919, 1.38992, 0, 0, 0, 1, 1,
0.7073956, 2.483487, 2.42718, 1, 1, 1, 1, 1,
0.710801, 0.1091985, 1.27003, 1, 1, 1, 1, 1,
0.7133309, -1.629005, 2.357833, 1, 1, 1, 1, 1,
0.7165715, 1.171772, 2.012642, 1, 1, 1, 1, 1,
0.7187585, 0.08287922, 3.285234, 1, 1, 1, 1, 1,
0.7189016, 0.4801421, 2.51224, 1, 1, 1, 1, 1,
0.7198915, -0.09157329, 1.172465, 1, 1, 1, 1, 1,
0.7210249, -1.782932, 2.032566, 1, 1, 1, 1, 1,
0.7217245, -0.4312687, 3.276393, 1, 1, 1, 1, 1,
0.7354649, 0.01590075, 2.78582, 1, 1, 1, 1, 1,
0.7377548, -0.1789736, 0.9555762, 1, 1, 1, 1, 1,
0.7483374, -1.338696, 3.369174, 1, 1, 1, 1, 1,
0.7500286, -0.3308629, 3.817611, 1, 1, 1, 1, 1,
0.7502047, 0.5253083, 0.5341327, 1, 1, 1, 1, 1,
0.7561424, 0.01115285, 1.265693, 1, 1, 1, 1, 1,
0.7719706, 0.3850664, 0.9246333, 0, 0, 1, 1, 1,
0.7719861, 1.247639, 0.5787787, 1, 0, 0, 1, 1,
0.7732899, -0.01938125, 0.2091212, 1, 0, 0, 1, 1,
0.7747597, -0.9645163, 0.1656362, 1, 0, 0, 1, 1,
0.7755992, 1.184497, 0.8557211, 1, 0, 0, 1, 1,
0.7764444, 2.11284, 0.3931166, 1, 0, 0, 1, 1,
0.7802389, 0.9604897, 1.377152, 0, 0, 0, 1, 1,
0.7845679, -0.9575602, 3.029001, 0, 0, 0, 1, 1,
0.7852845, 0.3280405, 1.461329, 0, 0, 0, 1, 1,
0.7887198, 0.5527895, 0.3186947, 0, 0, 0, 1, 1,
0.789933, -2.262355, 3.10364, 0, 0, 0, 1, 1,
0.7928485, 0.3274426, 0.8965238, 0, 0, 0, 1, 1,
0.7979534, -1.710817, 2.066192, 0, 0, 0, 1, 1,
0.7991626, -0.04360093, 1.462471, 1, 1, 1, 1, 1,
0.8028999, -0.2805417, 2.621438, 1, 1, 1, 1, 1,
0.8033178, 1.623262, 0.4365065, 1, 1, 1, 1, 1,
0.8109458, 0.4784503, 1.750782, 1, 1, 1, 1, 1,
0.8111877, -0.7720178, 3.518613, 1, 1, 1, 1, 1,
0.8176612, -1.453392, 2.501371, 1, 1, 1, 1, 1,
0.8239874, -0.3710887, 1.82568, 1, 1, 1, 1, 1,
0.8328365, -0.7974925, 3.002349, 1, 1, 1, 1, 1,
0.8335894, -1.562508, 4.005933, 1, 1, 1, 1, 1,
0.8360992, 0.6556889, -0.3176959, 1, 1, 1, 1, 1,
0.8365702, 1.115705, 2.054318, 1, 1, 1, 1, 1,
0.8368676, 0.6089709, 0.6382624, 1, 1, 1, 1, 1,
0.8376655, 0.5249409, -0.1600035, 1, 1, 1, 1, 1,
0.8377631, -0.003492165, 1.836931, 1, 1, 1, 1, 1,
0.8378736, -0.4938661, 2.51329, 1, 1, 1, 1, 1,
0.8411224, 0.2764438, 2.091137, 0, 0, 1, 1, 1,
0.8617301, -0.2242277, 1.176651, 1, 0, 0, 1, 1,
0.8639905, 2.083072, 0.1538044, 1, 0, 0, 1, 1,
0.8643329, 2.091232, -0.53, 1, 0, 0, 1, 1,
0.8644087, -1.358077, 3.10745, 1, 0, 0, 1, 1,
0.8654838, -0.3768663, 2.825289, 1, 0, 0, 1, 1,
0.8668516, 1.070279, 1.149748, 0, 0, 0, 1, 1,
0.8698587, -0.3301072, 0.7920382, 0, 0, 0, 1, 1,
0.8714574, -0.1748805, 1.143832, 0, 0, 0, 1, 1,
0.8731698, 1.226503, 2.018516, 0, 0, 0, 1, 1,
0.8814821, 1.514354, 0.3733322, 0, 0, 0, 1, 1,
0.882484, -0.3296715, 2.102051, 0, 0, 0, 1, 1,
0.8860374, -1.3206, 2.013591, 0, 0, 0, 1, 1,
0.889075, 0.03755951, 2.171671, 1, 1, 1, 1, 1,
0.8954703, -1.371948, 1.852076, 1, 1, 1, 1, 1,
0.8954997, -0.5037292, 0.1716728, 1, 1, 1, 1, 1,
0.9046613, -0.4082757, 0.3805693, 1, 1, 1, 1, 1,
0.9063434, -0.4620394, 1.608427, 1, 1, 1, 1, 1,
0.9072472, -0.2591047, 1.900217, 1, 1, 1, 1, 1,
0.9143495, 0.1480656, -0.2476564, 1, 1, 1, 1, 1,
0.917536, -0.3960557, 2.100441, 1, 1, 1, 1, 1,
0.9199277, 1.212999, -0.4463905, 1, 1, 1, 1, 1,
0.9204766, 0.434769, 1.548746, 1, 1, 1, 1, 1,
0.9208801, -0.9325853, 1.80034, 1, 1, 1, 1, 1,
0.9248053, -0.5979595, 3.261509, 1, 1, 1, 1, 1,
0.9260241, 1.583807, 1.9016, 1, 1, 1, 1, 1,
0.9263002, -1.012192, 2.233386, 1, 1, 1, 1, 1,
0.9265305, 0.001538315, 3.140215, 1, 1, 1, 1, 1,
0.9315361, 0.06148145, -0.9231811, 0, 0, 1, 1, 1,
0.9323717, -1.012909, 2.544044, 1, 0, 0, 1, 1,
0.9353714, 0.2392244, 1.720902, 1, 0, 0, 1, 1,
0.9415071, 1.190619, 1.249908, 1, 0, 0, 1, 1,
0.9424916, 0.9393108, 1.288192, 1, 0, 0, 1, 1,
0.9465634, 0.2462039, 1.080829, 1, 0, 0, 1, 1,
0.9524416, 0.7865157, 0.925992, 0, 0, 0, 1, 1,
0.9539039, 0.3277003, 2.54939, 0, 0, 0, 1, 1,
0.9571823, 1.593657, 1.262365, 0, 0, 0, 1, 1,
0.9573806, -0.4067808, 1.164459, 0, 0, 0, 1, 1,
0.9607553, 1.65564, 1.099066, 0, 0, 0, 1, 1,
0.9655789, 0.8982078, 0.2830992, 0, 0, 0, 1, 1,
0.9683971, -0.8687612, -0.4970752, 0, 0, 0, 1, 1,
0.9694293, -1.95679, 3.208781, 1, 1, 1, 1, 1,
0.9697211, -0.8598189, 1.473123, 1, 1, 1, 1, 1,
0.9743798, -0.4109577, 3.975206, 1, 1, 1, 1, 1,
0.9743893, -0.5298596, 1.021843, 1, 1, 1, 1, 1,
0.9757709, 0.1804887, 1.495321, 1, 1, 1, 1, 1,
0.9850366, 0.838442, 0.259989, 1, 1, 1, 1, 1,
0.9864038, -0.4902977, 2.726013, 1, 1, 1, 1, 1,
0.9868894, -1.002817, 0.3814963, 1, 1, 1, 1, 1,
0.9875742, 0.6214932, 2.101969, 1, 1, 1, 1, 1,
0.9895037, 0.2324908, 2.660863, 1, 1, 1, 1, 1,
1.005209, -0.3486089, 2.374017, 1, 1, 1, 1, 1,
1.007306, -0.3531485, 2.64189, 1, 1, 1, 1, 1,
1.007822, 0.2362521, 0.6759707, 1, 1, 1, 1, 1,
1.014627, -1.525198, 1.847125, 1, 1, 1, 1, 1,
1.021771, 0.1385634, 1.690724, 1, 1, 1, 1, 1,
1.021834, -0.1575097, 0.7452363, 0, 0, 1, 1, 1,
1.027934, -0.8505237, 1.937388, 1, 0, 0, 1, 1,
1.031236, -1.13092, 3.13968, 1, 0, 0, 1, 1,
1.046624, -0.2921726, 2.807017, 1, 0, 0, 1, 1,
1.046874, -0.008919059, -0.9412557, 1, 0, 0, 1, 1,
1.048128, -0.5173268, 2.091626, 1, 0, 0, 1, 1,
1.048474, -0.992914, 3.186209, 0, 0, 0, 1, 1,
1.049216, -1.080117, 0.08956555, 0, 0, 0, 1, 1,
1.049829, -0.08168685, 1.287158, 0, 0, 0, 1, 1,
1.051327, 1.472025, 1.299027, 0, 0, 0, 1, 1,
1.052737, 0.5352291, 1.228711, 0, 0, 0, 1, 1,
1.054354, 0.9796308, 2.705717, 0, 0, 0, 1, 1,
1.067081, 1.411263, 1.627202, 0, 0, 0, 1, 1,
1.07041, -0.9800877, 0.705665, 1, 1, 1, 1, 1,
1.078229, -1.806522, 1.19498, 1, 1, 1, 1, 1,
1.086083, -0.6462773, 1.045851, 1, 1, 1, 1, 1,
1.094322, 0.9268705, 0.3811781, 1, 1, 1, 1, 1,
1.094742, -0.2151577, -0.6263297, 1, 1, 1, 1, 1,
1.095643, 1.279052, 1.161532, 1, 1, 1, 1, 1,
1.099192, 0.6942072, -0.2116342, 1, 1, 1, 1, 1,
1.101275, 0.5985252, 0.4831565, 1, 1, 1, 1, 1,
1.110974, -0.548964, 2.266199, 1, 1, 1, 1, 1,
1.112941, -1.514935, 4.079969, 1, 1, 1, 1, 1,
1.114545, 1.26843, -0.007554798, 1, 1, 1, 1, 1,
1.115355, -0.5333533, -0.2342059, 1, 1, 1, 1, 1,
1.118693, -1.623882, 2.730555, 1, 1, 1, 1, 1,
1.120395, -0.3416989, 3.371872, 1, 1, 1, 1, 1,
1.129333, 0.4894406, 1.598823, 1, 1, 1, 1, 1,
1.132625, 0.4593663, 0.6841677, 0, 0, 1, 1, 1,
1.137151, -1.837348, 2.08269, 1, 0, 0, 1, 1,
1.139505, 0.4893062, 1.43704, 1, 0, 0, 1, 1,
1.142993, -0.669992, 2.016323, 1, 0, 0, 1, 1,
1.14482, 0.006970589, 2.045644, 1, 0, 0, 1, 1,
1.147846, -1.243627, 1.16893, 1, 0, 0, 1, 1,
1.158435, -0.2799191, 1.981358, 0, 0, 0, 1, 1,
1.16479, 0.4402642, 2.10854, 0, 0, 0, 1, 1,
1.167186, 1.620258, 0.005007745, 0, 0, 0, 1, 1,
1.167859, -1.871825, 2.777843, 0, 0, 0, 1, 1,
1.177454, -1.763615, 3.414943, 0, 0, 0, 1, 1,
1.178268, 0.8147784, 0.7445888, 0, 0, 0, 1, 1,
1.18079, -1.949103, 1.463054, 0, 0, 0, 1, 1,
1.194433, 1.044147, 0.6192794, 1, 1, 1, 1, 1,
1.19702, -0.9439249, 2.393004, 1, 1, 1, 1, 1,
1.204755, -1.136077, 2.432356, 1, 1, 1, 1, 1,
1.216233, -1.071036, 0.8995003, 1, 1, 1, 1, 1,
1.21811, -0.2403133, 0.3936547, 1, 1, 1, 1, 1,
1.218743, -1.232142, 3.245438, 1, 1, 1, 1, 1,
1.218963, 1.096415, -0.3592307, 1, 1, 1, 1, 1,
1.226791, 0.01206142, 1.854406, 1, 1, 1, 1, 1,
1.228738, -0.2847607, 2.619579, 1, 1, 1, 1, 1,
1.229817, -1.178778, 2.947934, 1, 1, 1, 1, 1,
1.234062, 0.3505934, 1.41363, 1, 1, 1, 1, 1,
1.243015, 0.8421659, 1.046242, 1, 1, 1, 1, 1,
1.244321, -0.6649325, 2.896935, 1, 1, 1, 1, 1,
1.265757, -0.380807, 0.142828, 1, 1, 1, 1, 1,
1.268113, 0.6903163, 0.8746265, 1, 1, 1, 1, 1,
1.27065, -0.03092799, 3.165224, 0, 0, 1, 1, 1,
1.278471, -0.6672112, 2.75494, 1, 0, 0, 1, 1,
1.278925, -0.2717271, 0.9861316, 1, 0, 0, 1, 1,
1.291196, -0.3314357, 2.14767, 1, 0, 0, 1, 1,
1.291832, 0.3553577, 1.353567, 1, 0, 0, 1, 1,
1.295929, 0.298591, 1.49106, 1, 0, 0, 1, 1,
1.305736, -0.4844252, 2.81718, 0, 0, 0, 1, 1,
1.311048, -1.012705, 3.171475, 0, 0, 0, 1, 1,
1.315351, 2.081185, 0.5433496, 0, 0, 0, 1, 1,
1.3162, 0.1332455, -0.07898561, 0, 0, 0, 1, 1,
1.318002, 0.5919688, 1.47311, 0, 0, 0, 1, 1,
1.320902, 0.1778454, 1.723132, 0, 0, 0, 1, 1,
1.326691, 1.563002, -0.1806768, 0, 0, 0, 1, 1,
1.336654, -0.6930442, 2.379406, 1, 1, 1, 1, 1,
1.353483, 0.7036186, 2.014947, 1, 1, 1, 1, 1,
1.357958, -1.300089, 4.267669, 1, 1, 1, 1, 1,
1.375023, -1.051141, 1.629825, 1, 1, 1, 1, 1,
1.376018, 0.6517166, 0.7673686, 1, 1, 1, 1, 1,
1.392834, 0.9781545, 2.28146, 1, 1, 1, 1, 1,
1.405667, 0.5980706, 1.953446, 1, 1, 1, 1, 1,
1.405794, 0.00995132, 1.668041, 1, 1, 1, 1, 1,
1.412121, 0.1375928, 2.749523, 1, 1, 1, 1, 1,
1.420635, -0.3461644, 1.89633, 1, 1, 1, 1, 1,
1.430081, -0.0047528, 0.565068, 1, 1, 1, 1, 1,
1.436834, -0.7667487, 2.121166, 1, 1, 1, 1, 1,
1.441636, -0.3724322, 0.6245556, 1, 1, 1, 1, 1,
1.442581, -0.3043792, 3.117358, 1, 1, 1, 1, 1,
1.468678, 0.7151918, -0.1712915, 1, 1, 1, 1, 1,
1.469385, -0.8056155, 1.822327, 0, 0, 1, 1, 1,
1.474027, 1.117594, 1.345491, 1, 0, 0, 1, 1,
1.475759, -0.5406947, 1.83724, 1, 0, 0, 1, 1,
1.478661, 0.3855971, 0.3210781, 1, 0, 0, 1, 1,
1.489358, -0.2033022, -0.3044302, 1, 0, 0, 1, 1,
1.500135, 0.4720897, 1.624558, 1, 0, 0, 1, 1,
1.502325, -2.068208, 2.092421, 0, 0, 0, 1, 1,
1.515317, -0.1529211, 1.557988, 0, 0, 0, 1, 1,
1.522277, 0.4001177, -0.05407047, 0, 0, 0, 1, 1,
1.528309, 0.1541514, 1.908425, 0, 0, 0, 1, 1,
1.528755, -1.155371, 4.010631, 0, 0, 0, 1, 1,
1.547021, 2.069077, 0.3161702, 0, 0, 0, 1, 1,
1.554615, -0.6378247, 0.8571264, 0, 0, 0, 1, 1,
1.555566, 0.7208602, 1.163201, 1, 1, 1, 1, 1,
1.557902, 1.565364, 0.3791021, 1, 1, 1, 1, 1,
1.558305, -3.177327, 3.199666, 1, 1, 1, 1, 1,
1.56331, -0.5312558, 1.600819, 1, 1, 1, 1, 1,
1.573376, 0.4259765, 1.690038, 1, 1, 1, 1, 1,
1.607014, 0.446643, 1.435015, 1, 1, 1, 1, 1,
1.609061, 0.1383473, -0.06195951, 1, 1, 1, 1, 1,
1.619377, 0.6321777, 0.09246199, 1, 1, 1, 1, 1,
1.620247, 1.121254, 1.512319, 1, 1, 1, 1, 1,
1.629274, 1.038253, 1.044585, 1, 1, 1, 1, 1,
1.643157, -0.2150404, 1.694743, 1, 1, 1, 1, 1,
1.643836, 0.8243812, 1.199988, 1, 1, 1, 1, 1,
1.646296, -0.5955998, 1.323694, 1, 1, 1, 1, 1,
1.661659, 2.282507, 2.279049, 1, 1, 1, 1, 1,
1.664585, -0.4811573, 1.645632, 1, 1, 1, 1, 1,
1.713029, -0.2414631, 1.20974, 0, 0, 1, 1, 1,
1.724427, -0.9271304, 2.173275, 1, 0, 0, 1, 1,
1.72653, -1.097352, 0.555074, 1, 0, 0, 1, 1,
1.730098, 0.8560571, 0.737398, 1, 0, 0, 1, 1,
1.742369, 1.319414, 0.4440435, 1, 0, 0, 1, 1,
1.800786, 0.2022402, 1.768408, 1, 0, 0, 1, 1,
1.8036, 0.0770738, 1.593274, 0, 0, 0, 1, 1,
1.811258, 0.05653595, 0.9721419, 0, 0, 0, 1, 1,
1.82679, -0.5927855, -1.136514, 0, 0, 0, 1, 1,
1.84243, 0.7859723, 2.164469, 0, 0, 0, 1, 1,
1.856404, 0.4748788, 2.043633, 0, 0, 0, 1, 1,
1.858382, -0.726729, 2.875354, 0, 0, 0, 1, 1,
1.861405, 2.024873, 1.887792, 0, 0, 0, 1, 1,
1.874089, -0.3061176, 3.276815, 1, 1, 1, 1, 1,
1.888467, 0.01550031, 2.731428, 1, 1, 1, 1, 1,
1.89543, -0.303514, 2.586065, 1, 1, 1, 1, 1,
1.913435, -0.6217898, 1.539108, 1, 1, 1, 1, 1,
1.932584, -1.497205, 1.985836, 1, 1, 1, 1, 1,
1.96109, -1.359622, 1.816628, 1, 1, 1, 1, 1,
1.96351, 1.207188, -0.6019961, 1, 1, 1, 1, 1,
2.013037, 0.3744283, 0.5743785, 1, 1, 1, 1, 1,
2.03245, -0.7993986, 2.396044, 1, 1, 1, 1, 1,
2.046145, 1.660927, 0.6919659, 1, 1, 1, 1, 1,
2.055861, 0.08476745, 2.047971, 1, 1, 1, 1, 1,
2.05833, -0.8514724, 2.538864, 1, 1, 1, 1, 1,
2.101604, 0.4642082, 1.867783, 1, 1, 1, 1, 1,
2.117512, -2.137756, 2.235651, 1, 1, 1, 1, 1,
2.119017, -0.5375192, 1.700714, 1, 1, 1, 1, 1,
2.192858, 0.4340319, 2.133002, 0, 0, 1, 1, 1,
2.222656, -1.274506, 3.43119, 1, 0, 0, 1, 1,
2.249769, 0.3336213, 0.4086705, 1, 0, 0, 1, 1,
2.26919, -0.237193, 0.4809731, 1, 0, 0, 1, 1,
2.351607, -0.345625, 2.789833, 1, 0, 0, 1, 1,
2.381371, -0.1212734, 0.4250847, 1, 0, 0, 1, 1,
2.457319, 0.05600807, 3.071703, 0, 0, 0, 1, 1,
2.485962, 0.5092627, 1.154983, 0, 0, 0, 1, 1,
2.491999, -0.2961986, 2.269299, 0, 0, 0, 1, 1,
2.502399, 0.1966881, 1.797969, 0, 0, 0, 1, 1,
2.532483, -0.1026369, 0.8660247, 0, 0, 0, 1, 1,
2.546056, 2.322668, -0.1811665, 0, 0, 0, 1, 1,
2.554767, 0.5870177, 1.396276, 0, 0, 0, 1, 1,
2.555006, -0.2229346, 0.7513191, 1, 1, 1, 1, 1,
2.635543, -1.022096, 2.280208, 1, 1, 1, 1, 1,
2.641658, 3.400419, 2.057984, 1, 1, 1, 1, 1,
2.699278, -1.514529, 2.579058, 1, 1, 1, 1, 1,
2.733375, 0.3686689, 2.753156, 1, 1, 1, 1, 1,
2.796632, 1.782082, 0.8920467, 1, 1, 1, 1, 1,
3.337578, 1.739613, 1.497622, 1, 1, 1, 1, 1
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
var radius = 9.607366;
var distance = 33.74546;
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
mvMatrix.translate( -0.06247449, 0.2268248, 0.4917378 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.74546);
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
