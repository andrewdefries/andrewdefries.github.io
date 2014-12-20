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
-3.272106, 1.268336, -1.606437, 1, 0, 0, 1,
-2.987892, 0.1924866, -1.893781, 1, 0.007843138, 0, 1,
-2.838219, 2.248719, -0.7812634, 1, 0.01176471, 0, 1,
-2.744674, 0.584903, -0.1306154, 1, 0.01960784, 0, 1,
-2.713474, 0.6976652, -1.307085, 1, 0.02352941, 0, 1,
-2.661727, 0.1592676, -2.581578, 1, 0.03137255, 0, 1,
-2.404298, -0.6650957, -1.445865, 1, 0.03529412, 0, 1,
-2.367297, -0.7305294, -3.545016, 1, 0.04313726, 0, 1,
-2.343062, 0.7668402, -3.144798, 1, 0.04705882, 0, 1,
-2.27542, 0.5351043, -2.113506, 1, 0.05490196, 0, 1,
-2.193548, 0.3513334, -1.545249, 1, 0.05882353, 0, 1,
-2.172991, -0.2324781, -3.074506, 1, 0.06666667, 0, 1,
-2.164733, -1.197844, -2.991558, 1, 0.07058824, 0, 1,
-2.15175, -1.261918, -3.609124, 1, 0.07843138, 0, 1,
-2.133616, 0.7445292, -0.4248008, 1, 0.08235294, 0, 1,
-2.116425, 1.972978, -0.9373415, 1, 0.09019608, 0, 1,
-2.08621, -0.7784338, -2.196786, 1, 0.09411765, 0, 1,
-2.045469, -0.3715633, -1.759398, 1, 0.1019608, 0, 1,
-2.042087, -0.1929912, -1.007544, 1, 0.1098039, 0, 1,
-2.037384, -0.4183181, -2.726614, 1, 0.1137255, 0, 1,
-2.006996, -1.674862, -2.751507, 1, 0.1215686, 0, 1,
-1.970104, -0.4985682, -3.103718, 1, 0.1254902, 0, 1,
-1.965982, 0.348921, 0.2887509, 1, 0.1333333, 0, 1,
-1.938803, 0.6169527, -2.893417, 1, 0.1372549, 0, 1,
-1.915501, 1.821869, -0.1580527, 1, 0.145098, 0, 1,
-1.887719, 0.09762558, -3.815379, 1, 0.1490196, 0, 1,
-1.846513, 0.8531982, -1.644523, 1, 0.1568628, 0, 1,
-1.844803, 1.920575, -1.9541, 1, 0.1607843, 0, 1,
-1.837897, -0.3687662, 0.506828, 1, 0.1686275, 0, 1,
-1.826306, -0.4191555, -1.610967, 1, 0.172549, 0, 1,
-1.820336, 3.016339, -1.70512, 1, 0.1803922, 0, 1,
-1.811698, 0.3404871, 0.1216609, 1, 0.1843137, 0, 1,
-1.803712, -0.2325208, -1.241655, 1, 0.1921569, 0, 1,
-1.801432, -0.1848111, -0.8667204, 1, 0.1960784, 0, 1,
-1.795626, 0.5437053, -1.440581, 1, 0.2039216, 0, 1,
-1.789449, 0.3544319, -1.688947, 1, 0.2117647, 0, 1,
-1.779277, -0.7540953, -1.176212, 1, 0.2156863, 0, 1,
-1.775298, 0.4416873, -0.7290649, 1, 0.2235294, 0, 1,
-1.769995, -1.681579, -1.945731, 1, 0.227451, 0, 1,
-1.765808, -0.4553406, -0.7437409, 1, 0.2352941, 0, 1,
-1.753231, 0.4201868, -2.055723, 1, 0.2392157, 0, 1,
-1.729609, 0.9765871, -0.4060106, 1, 0.2470588, 0, 1,
-1.708219, 1.073809, -2.07658, 1, 0.2509804, 0, 1,
-1.704317, 0.4428714, -1.308673, 1, 0.2588235, 0, 1,
-1.70188, -0.03186969, -3.800146, 1, 0.2627451, 0, 1,
-1.697923, 0.4583459, -1.330029, 1, 0.2705882, 0, 1,
-1.68277, 0.9699185, -0.7761271, 1, 0.2745098, 0, 1,
-1.682288, -1.381595, -1.84522, 1, 0.282353, 0, 1,
-1.664487, -1.153505, -1.820389, 1, 0.2862745, 0, 1,
-1.663147, 0.09553162, -1.629865, 1, 0.2941177, 0, 1,
-1.662645, -0.01016666, -0.05179344, 1, 0.3019608, 0, 1,
-1.653913, -0.02797551, -1.960327, 1, 0.3058824, 0, 1,
-1.651549, -0.961484, -1.106002, 1, 0.3137255, 0, 1,
-1.639352, -0.6949285, -1.688224, 1, 0.3176471, 0, 1,
-1.628727, -0.9463337, -2.177955, 1, 0.3254902, 0, 1,
-1.626773, 0.02687967, -1.639501, 1, 0.3294118, 0, 1,
-1.603459, 0.3569925, -1.944852, 1, 0.3372549, 0, 1,
-1.583757, -0.8612341, -2.705726, 1, 0.3411765, 0, 1,
-1.580728, 0.706225, -1.64751, 1, 0.3490196, 0, 1,
-1.577145, -0.4214611, -1.686796, 1, 0.3529412, 0, 1,
-1.566097, 1.248451, -0.8490222, 1, 0.3607843, 0, 1,
-1.566027, -0.5763732, -1.242565, 1, 0.3647059, 0, 1,
-1.557397, -0.4092948, -3.133159, 1, 0.372549, 0, 1,
-1.555113, 0.6095613, -0.9921043, 1, 0.3764706, 0, 1,
-1.55093, 1.105556, -1.537339, 1, 0.3843137, 0, 1,
-1.530199, -0.9623241, -2.419769, 1, 0.3882353, 0, 1,
-1.527956, 0.508911, -0.2964671, 1, 0.3960784, 0, 1,
-1.513423, -0.1754591, -4.051597, 1, 0.4039216, 0, 1,
-1.51185, -0.4431982, -1.440049, 1, 0.4078431, 0, 1,
-1.507249, 0.5226352, -1.287686, 1, 0.4156863, 0, 1,
-1.500804, 1.806142, -1.635827, 1, 0.4196078, 0, 1,
-1.497469, -0.9923069, -3.284179, 1, 0.427451, 0, 1,
-1.488746, -0.7682754, -2.17006, 1, 0.4313726, 0, 1,
-1.483922, -1.954669, -1.372296, 1, 0.4392157, 0, 1,
-1.477137, -0.7414041, -1.783782, 1, 0.4431373, 0, 1,
-1.470906, 0.0328904, -1.728578, 1, 0.4509804, 0, 1,
-1.467451, -0.8704461, -0.978224, 1, 0.454902, 0, 1,
-1.464554, 0.3000494, -1.126419, 1, 0.4627451, 0, 1,
-1.450678, 0.8568247, -1.005874, 1, 0.4666667, 0, 1,
-1.450332, 1.132986, -0.3132727, 1, 0.4745098, 0, 1,
-1.448447, -0.06560265, -2.589356, 1, 0.4784314, 0, 1,
-1.438419, 0.1326119, -1.144347, 1, 0.4862745, 0, 1,
-1.416354, 0.7042114, -0.8533764, 1, 0.4901961, 0, 1,
-1.404796, 0.08590282, -1.54538, 1, 0.4980392, 0, 1,
-1.401939, 0.6224648, 0.594485, 1, 0.5058824, 0, 1,
-1.39749, 1.307455, -2.117757, 1, 0.509804, 0, 1,
-1.393839, -0.04451652, 0.1905398, 1, 0.5176471, 0, 1,
-1.393646, -0.3748831, -2.278689, 1, 0.5215687, 0, 1,
-1.385993, 1.031538, -0.092571, 1, 0.5294118, 0, 1,
-1.385777, 0.164976, -4.481607, 1, 0.5333334, 0, 1,
-1.377045, 0.1224875, 0.9508821, 1, 0.5411765, 0, 1,
-1.375936, -0.8563704, -2.403897, 1, 0.5450981, 0, 1,
-1.373857, -2.187383, -2.503524, 1, 0.5529412, 0, 1,
-1.360282, 0.4986183, -1.018886, 1, 0.5568628, 0, 1,
-1.350938, 0.1350702, -1.057639, 1, 0.5647059, 0, 1,
-1.349866, 1.683319, -0.8279437, 1, 0.5686275, 0, 1,
-1.345102, -1.73801, -2.460496, 1, 0.5764706, 0, 1,
-1.333874, 0.6592376, -0.290816, 1, 0.5803922, 0, 1,
-1.332878, -0.5125331, -2.594144, 1, 0.5882353, 0, 1,
-1.314096, 0.4038231, -1.435323, 1, 0.5921569, 0, 1,
-1.311403, 0.1278873, -3.036262, 1, 0.6, 0, 1,
-1.301752, -0.6017789, -2.620681, 1, 0.6078432, 0, 1,
-1.293441, -0.7180549, -0.1078286, 1, 0.6117647, 0, 1,
-1.279777, 1.537442, -1.320948, 1, 0.6196079, 0, 1,
-1.276466, -0.5160142, -3.275263, 1, 0.6235294, 0, 1,
-1.27582, 0.5754286, -1.697128, 1, 0.6313726, 0, 1,
-1.269187, 0.6323087, -3.413012, 1, 0.6352941, 0, 1,
-1.261351, 0.4224595, -2.316607, 1, 0.6431373, 0, 1,
-1.26106, 0.694653, -0.507466, 1, 0.6470588, 0, 1,
-1.2608, -0.2622879, -2.424144, 1, 0.654902, 0, 1,
-1.258462, 0.7946426, -1.040555, 1, 0.6588235, 0, 1,
-1.256954, 1.053654, -0.5023964, 1, 0.6666667, 0, 1,
-1.235975, 2.295404, -0.6257758, 1, 0.6705883, 0, 1,
-1.234695, -0.1068673, -1.394549, 1, 0.6784314, 0, 1,
-1.234327, -1.567674, -2.111531, 1, 0.682353, 0, 1,
-1.230093, -0.04867236, -1.694928, 1, 0.6901961, 0, 1,
-1.204659, 0.7022109, -2.603928, 1, 0.6941177, 0, 1,
-1.201001, -2.788516, -3.313595, 1, 0.7019608, 0, 1,
-1.189633, -1.229125, -2.560095, 1, 0.7098039, 0, 1,
-1.189178, 1.063021, -0.2149875, 1, 0.7137255, 0, 1,
-1.184322, -0.5164396, -0.8876168, 1, 0.7215686, 0, 1,
-1.183684, 0.5481381, -2.976748, 1, 0.7254902, 0, 1,
-1.180553, -0.7922516, -0.431688, 1, 0.7333333, 0, 1,
-1.18003, -0.1532516, -0.8967373, 1, 0.7372549, 0, 1,
-1.17884, -0.3184907, -2.028884, 1, 0.7450981, 0, 1,
-1.175663, -1.626629, -4.397668, 1, 0.7490196, 0, 1,
-1.167766, 1.067328, -1.512884, 1, 0.7568628, 0, 1,
-1.165109, -0.1438299, -1.066659, 1, 0.7607843, 0, 1,
-1.163047, 1.306824, -1.255407, 1, 0.7686275, 0, 1,
-1.162701, -2.751455, -3.21418, 1, 0.772549, 0, 1,
-1.158925, -0.4407119, -2.446333, 1, 0.7803922, 0, 1,
-1.156695, 0.4315675, -2.38992, 1, 0.7843137, 0, 1,
-1.152979, -2.123834, -0.8101895, 1, 0.7921569, 0, 1,
-1.150488, 0.1802745, -1.982008, 1, 0.7960784, 0, 1,
-1.150133, 1.193014, -0.487706, 1, 0.8039216, 0, 1,
-1.148081, -1.139646, -2.252986, 1, 0.8117647, 0, 1,
-1.138448, 0.542982, -0.7430794, 1, 0.8156863, 0, 1,
-1.134764, 1.368401, -0.1659347, 1, 0.8235294, 0, 1,
-1.126166, -0.09807847, -1.702107, 1, 0.827451, 0, 1,
-1.121095, -0.1077577, -1.584507, 1, 0.8352941, 0, 1,
-1.118175, 0.7214131, -0.9380566, 1, 0.8392157, 0, 1,
-1.115605, -0.04975009, -1.868155, 1, 0.8470588, 0, 1,
-1.110577, 0.4655246, -0.6195168, 1, 0.8509804, 0, 1,
-1.104187, -2.475985, -2.02458, 1, 0.8588235, 0, 1,
-1.095208, -0.5350605, -3.029324, 1, 0.8627451, 0, 1,
-1.094729, 1.795038, -0.1713124, 1, 0.8705882, 0, 1,
-1.094576, -0.9495999, -3.055535, 1, 0.8745098, 0, 1,
-1.092881, 0.7796603, -1.110317, 1, 0.8823529, 0, 1,
-1.092263, 0.6165296, -0.225008, 1, 0.8862745, 0, 1,
-1.087109, -0.3391784, -2.221898, 1, 0.8941177, 0, 1,
-1.083846, 0.4571727, 0.334095, 1, 0.8980392, 0, 1,
-1.081506, -1.749484, -0.308901, 1, 0.9058824, 0, 1,
-1.075253, -0.3751767, -1.52989, 1, 0.9137255, 0, 1,
-1.073176, -0.6966856, -3.302887, 1, 0.9176471, 0, 1,
-1.062413, 0.05057279, -1.087653, 1, 0.9254902, 0, 1,
-1.061988, -0.4484994, -1.072624, 1, 0.9294118, 0, 1,
-1.051563, -0.6241769, -2.311229, 1, 0.9372549, 0, 1,
-1.051321, 1.510175, -2.102792, 1, 0.9411765, 0, 1,
-1.044948, 0.9473603, -0.3139591, 1, 0.9490196, 0, 1,
-1.043342, -1.434878, -2.470022, 1, 0.9529412, 0, 1,
-1.033847, 0.002619179, -0.8984372, 1, 0.9607843, 0, 1,
-1.027188, 0.4437762, -1.455411, 1, 0.9647059, 0, 1,
-1.002533, 1.171281, -0.3967899, 1, 0.972549, 0, 1,
-0.9999569, -0.3125321, -3.828581, 1, 0.9764706, 0, 1,
-0.9935036, -1.803429, -3.888998, 1, 0.9843137, 0, 1,
-0.9892094, 1.311794, -2.012165, 1, 0.9882353, 0, 1,
-0.9836915, -1.300302, -1.155813, 1, 0.9960784, 0, 1,
-0.9827619, -1.869661, -2.368475, 0.9960784, 1, 0, 1,
-0.977837, 0.7420516, -0.5897025, 0.9921569, 1, 0, 1,
-0.9774284, -1.102097, -2.436108, 0.9843137, 1, 0, 1,
-0.9767953, -0.4372961, 0.7111905, 0.9803922, 1, 0, 1,
-0.9756255, -1.040773, -2.827433, 0.972549, 1, 0, 1,
-0.9624689, 2.007969, -0.2554131, 0.9686275, 1, 0, 1,
-0.9548743, -1.004467, -0.3907287, 0.9607843, 1, 0, 1,
-0.9519472, -1.682791, -1.833117, 0.9568627, 1, 0, 1,
-0.9489229, -0.3399878, -2.541701, 0.9490196, 1, 0, 1,
-0.9435609, 0.2546711, -1.316273, 0.945098, 1, 0, 1,
-0.939897, -0.1540963, -3.509913, 0.9372549, 1, 0, 1,
-0.9380161, 0.9711691, -1.700788, 0.9333333, 1, 0, 1,
-0.9292519, 1.105116, -0.306841, 0.9254902, 1, 0, 1,
-0.9283855, -0.1901529, -2.668566, 0.9215686, 1, 0, 1,
-0.9270901, -1.421838, -2.071234, 0.9137255, 1, 0, 1,
-0.9269717, -0.4132989, -2.282379, 0.9098039, 1, 0, 1,
-0.9255055, -0.7434714, -2.720733, 0.9019608, 1, 0, 1,
-0.9245768, 0.1334637, -2.599938, 0.8941177, 1, 0, 1,
-0.9174221, -0.03741887, -2.36357, 0.8901961, 1, 0, 1,
-0.9155421, -0.8802722, -2.370221, 0.8823529, 1, 0, 1,
-0.914142, 0.7050248, -0.2608324, 0.8784314, 1, 0, 1,
-0.9140888, 0.6833627, -1.18827, 0.8705882, 1, 0, 1,
-0.9099294, -1.168297, -3.90565, 0.8666667, 1, 0, 1,
-0.9020839, 1.211752, 0.7348818, 0.8588235, 1, 0, 1,
-0.8988951, -0.4262323, 0.04292368, 0.854902, 1, 0, 1,
-0.8968499, 1.613223, -0.1853889, 0.8470588, 1, 0, 1,
-0.8946434, -1.040952, -0.7250796, 0.8431373, 1, 0, 1,
-0.8943728, 0.6590697, -1.887956, 0.8352941, 1, 0, 1,
-0.8918104, -0.2863027, -1.652248, 0.8313726, 1, 0, 1,
-0.8843143, 1.344381, -1.540802, 0.8235294, 1, 0, 1,
-0.8813508, -0.03061882, -0.8260248, 0.8196079, 1, 0, 1,
-0.8789076, 0.4679566, -0.930994, 0.8117647, 1, 0, 1,
-0.8779615, -0.9496656, -4.472654, 0.8078431, 1, 0, 1,
-0.875895, 0.1107495, -0.4079815, 0.8, 1, 0, 1,
-0.8725732, 0.917396, -1.421757, 0.7921569, 1, 0, 1,
-0.8724563, -0.9656954, -2.65623, 0.7882353, 1, 0, 1,
-0.8723767, 0.6449477, -1.275479, 0.7803922, 1, 0, 1,
-0.8721939, 0.2790132, -1.942673, 0.7764706, 1, 0, 1,
-0.8626015, -1.026349, -3.764307, 0.7686275, 1, 0, 1,
-0.8621958, 1.54791, 0.1203752, 0.7647059, 1, 0, 1,
-0.8594144, -0.4938035, -1.664672, 0.7568628, 1, 0, 1,
-0.8591399, -0.5120296, -1.989812, 0.7529412, 1, 0, 1,
-0.854726, -1.490509, -5.227416, 0.7450981, 1, 0, 1,
-0.8429284, 1.531853, 1.459484, 0.7411765, 1, 0, 1,
-0.8269049, 0.1037294, -0.6728583, 0.7333333, 1, 0, 1,
-0.8221308, 0.4769372, -1.136958, 0.7294118, 1, 0, 1,
-0.8210358, -0.5202894, -2.636674, 0.7215686, 1, 0, 1,
-0.8147793, -0.6578521, -1.530748, 0.7176471, 1, 0, 1,
-0.8036596, 0.1597588, 0.04162887, 0.7098039, 1, 0, 1,
-0.803094, -1.509729, -2.995739, 0.7058824, 1, 0, 1,
-0.8015846, -1.152112, -3.805722, 0.6980392, 1, 0, 1,
-0.8003785, 0.0169089, -1.404097, 0.6901961, 1, 0, 1,
-0.7962221, 0.1682311, -0.7084272, 0.6862745, 1, 0, 1,
-0.7952684, 1.281065, -1.10056, 0.6784314, 1, 0, 1,
-0.792762, 0.912481, -1.005662, 0.6745098, 1, 0, 1,
-0.7904854, -0.3083169, -1.150276, 0.6666667, 1, 0, 1,
-0.7898738, 0.3219697, -2.666354, 0.6627451, 1, 0, 1,
-0.7870737, -0.1802291, -1.542949, 0.654902, 1, 0, 1,
-0.7869675, 0.7743359, -0.995812, 0.6509804, 1, 0, 1,
-0.7869599, 0.07641204, 0.7074595, 0.6431373, 1, 0, 1,
-0.7811642, 0.7966303, -1.850452, 0.6392157, 1, 0, 1,
-0.7776665, 0.1750037, -0.587161, 0.6313726, 1, 0, 1,
-0.7773567, -1.63284, -3.040282, 0.627451, 1, 0, 1,
-0.7772262, 0.06635857, -2.127548, 0.6196079, 1, 0, 1,
-0.7751541, -0.8786854, -3.60232, 0.6156863, 1, 0, 1,
-0.7699506, -0.3963069, -2.889685, 0.6078432, 1, 0, 1,
-0.7693567, -0.2366706, -1.386501, 0.6039216, 1, 0, 1,
-0.7679273, 0.8100319, -0.3960073, 0.5960785, 1, 0, 1,
-0.7667569, -0.1231085, -1.031048, 0.5882353, 1, 0, 1,
-0.7653379, -0.1446464, -0.7800958, 0.5843138, 1, 0, 1,
-0.7648757, 2.15445, -1.87415, 0.5764706, 1, 0, 1,
-0.7645041, 1.382362, -1.957489, 0.572549, 1, 0, 1,
-0.761385, -1.252579, -2.09499, 0.5647059, 1, 0, 1,
-0.7581667, 0.8183093, -1.927696, 0.5607843, 1, 0, 1,
-0.7565119, -0.3694593, -2.015971, 0.5529412, 1, 0, 1,
-0.7504289, 0.8600734, 0.3299259, 0.5490196, 1, 0, 1,
-0.748258, -0.4988863, -1.074155, 0.5411765, 1, 0, 1,
-0.7443709, 0.5599167, -1.168504, 0.5372549, 1, 0, 1,
-0.737758, 0.4685362, -1.335962, 0.5294118, 1, 0, 1,
-0.7375772, -0.5865222, -2.435766, 0.5254902, 1, 0, 1,
-0.7351421, -0.3492045, -0.9512026, 0.5176471, 1, 0, 1,
-0.728884, 0.885175, -1.371407, 0.5137255, 1, 0, 1,
-0.7239638, 1.557976, -0.4912179, 0.5058824, 1, 0, 1,
-0.7231852, -0.3494126, -1.008222, 0.5019608, 1, 0, 1,
-0.719408, 0.3378978, -0.6028329, 0.4941176, 1, 0, 1,
-0.7162809, 0.07013616, -1.205715, 0.4862745, 1, 0, 1,
-0.7133318, -1.353752, -3.927696, 0.4823529, 1, 0, 1,
-0.7102144, 0.5714812, -1.997885, 0.4745098, 1, 0, 1,
-0.7083831, 0.1573123, -2.078929, 0.4705882, 1, 0, 1,
-0.708302, -1.089125, -1.663262, 0.4627451, 1, 0, 1,
-0.7039554, 0.547002, 0.4758995, 0.4588235, 1, 0, 1,
-0.6957376, -0.526884, -2.088928, 0.4509804, 1, 0, 1,
-0.6809984, 0.5814991, -0.7335122, 0.4470588, 1, 0, 1,
-0.6754704, -0.1601675, -2.286153, 0.4392157, 1, 0, 1,
-0.67058, 0.6553188, -0.01418547, 0.4352941, 1, 0, 1,
-0.6688368, 1.173296, -1.309261, 0.427451, 1, 0, 1,
-0.6623844, -0.7878627, -5.06841, 0.4235294, 1, 0, 1,
-0.6444862, 1.950957, 0.6864013, 0.4156863, 1, 0, 1,
-0.6425148, 0.4281743, -1.902278, 0.4117647, 1, 0, 1,
-0.6365334, -0.7137075, -2.448103, 0.4039216, 1, 0, 1,
-0.6270538, 0.4699132, -0.2302847, 0.3960784, 1, 0, 1,
-0.621488, -0.7989104, -1.576722, 0.3921569, 1, 0, 1,
-0.621058, -0.06079089, -1.435565, 0.3843137, 1, 0, 1,
-0.6199935, 0.1369662, 0.6776515, 0.3803922, 1, 0, 1,
-0.6178169, -1.72987, -3.790014, 0.372549, 1, 0, 1,
-0.6173589, -1.273442, -0.6795123, 0.3686275, 1, 0, 1,
-0.6163914, -0.6747562, -1.830198, 0.3607843, 1, 0, 1,
-0.6116828, 0.5685395, -0.7270622, 0.3568628, 1, 0, 1,
-0.6091886, 0.4797185, -1.218944, 0.3490196, 1, 0, 1,
-0.6065825, 0.7495175, -0.6965767, 0.345098, 1, 0, 1,
-0.6060547, 2.265745, -0.6339541, 0.3372549, 1, 0, 1,
-0.6058142, 0.2379386, -1.58082, 0.3333333, 1, 0, 1,
-0.603507, -1.318377, -1.066088, 0.3254902, 1, 0, 1,
-0.6016094, 0.6732079, -3.621885, 0.3215686, 1, 0, 1,
-0.599732, 0.598947, -1.879628, 0.3137255, 1, 0, 1,
-0.58941, 0.864071, 0.845275, 0.3098039, 1, 0, 1,
-0.5883989, 0.6015196, -0.6563615, 0.3019608, 1, 0, 1,
-0.5833141, 0.8780764, -0.7519725, 0.2941177, 1, 0, 1,
-0.5806917, -0.2576481, -1.950907, 0.2901961, 1, 0, 1,
-0.5737039, 0.545288, 1.625634, 0.282353, 1, 0, 1,
-0.5724839, -0.1025935, -0.9347364, 0.2784314, 1, 0, 1,
-0.571694, -0.3479995, -2.975095, 0.2705882, 1, 0, 1,
-0.5713554, -0.8517924, -1.78151, 0.2666667, 1, 0, 1,
-0.5707862, -0.08269469, -3.15784, 0.2588235, 1, 0, 1,
-0.5643283, -0.1297169, -1.953483, 0.254902, 1, 0, 1,
-0.5629001, 0.5056593, 0.1863821, 0.2470588, 1, 0, 1,
-0.5605518, 0.2882747, -0.1924643, 0.2431373, 1, 0, 1,
-0.5598091, 0.4007106, 0.9483314, 0.2352941, 1, 0, 1,
-0.5579875, 0.1968877, -0.08649723, 0.2313726, 1, 0, 1,
-0.5530313, -1.456952, -3.434423, 0.2235294, 1, 0, 1,
-0.5524077, -0.4170554, -3.434535, 0.2196078, 1, 0, 1,
-0.5498974, 2.770639, 0.8028252, 0.2117647, 1, 0, 1,
-0.5466337, 0.4158006, -0.1471947, 0.2078431, 1, 0, 1,
-0.5449667, -0.1971906, -2.305296, 0.2, 1, 0, 1,
-0.544864, -1.17977, -2.834981, 0.1921569, 1, 0, 1,
-0.5407658, 0.01507108, -2.316644, 0.1882353, 1, 0, 1,
-0.5402123, -0.8532361, -0.7961705, 0.1803922, 1, 0, 1,
-0.5357171, 0.9876516, -0.7440206, 0.1764706, 1, 0, 1,
-0.5235686, -0.3850177, -2.568735, 0.1686275, 1, 0, 1,
-0.5218482, -2.690666, -1.915758, 0.1647059, 1, 0, 1,
-0.5170198, -0.2919493, -1.195323, 0.1568628, 1, 0, 1,
-0.5147241, -1.298975, -4.635722, 0.1529412, 1, 0, 1,
-0.511141, -0.5658908, -2.654427, 0.145098, 1, 0, 1,
-0.5097621, -0.3743944, -2.093273, 0.1411765, 1, 0, 1,
-0.5090007, 0.3417242, -1.846373, 0.1333333, 1, 0, 1,
-0.5039459, 1.367988, 0.3625625, 0.1294118, 1, 0, 1,
-0.5001873, -0.4913349, -3.476967, 0.1215686, 1, 0, 1,
-0.4976898, 0.4032816, -0.8063406, 0.1176471, 1, 0, 1,
-0.4968021, 1.412792, -0.02963663, 0.1098039, 1, 0, 1,
-0.4957808, 0.9735875, 0.4160756, 0.1058824, 1, 0, 1,
-0.4910908, 0.7156726, -0.5531026, 0.09803922, 1, 0, 1,
-0.4850761, -2.382076, -2.690951, 0.09019608, 1, 0, 1,
-0.4828386, -0.5601119, -1.611186, 0.08627451, 1, 0, 1,
-0.4806866, -0.04839414, -1.237229, 0.07843138, 1, 0, 1,
-0.4771704, 0.1738283, -1.476658, 0.07450981, 1, 0, 1,
-0.4761437, -0.6650068, -2.97854, 0.06666667, 1, 0, 1,
-0.4740202, -1.293227, -4.299006, 0.0627451, 1, 0, 1,
-0.4700901, -0.605709, -2.050706, 0.05490196, 1, 0, 1,
-0.4698748, 0.06922587, -2.20362, 0.05098039, 1, 0, 1,
-0.4689904, 1.523109, -1.602451, 0.04313726, 1, 0, 1,
-0.4637263, 1.483233, -1.677514, 0.03921569, 1, 0, 1,
-0.4594054, -0.9172528, -4.423762, 0.03137255, 1, 0, 1,
-0.4579123, 0.2406574, -1.746682, 0.02745098, 1, 0, 1,
-0.4564325, 0.5678114, -1.210585, 0.01960784, 1, 0, 1,
-0.4532935, 1.579238, -0.07177614, 0.01568628, 1, 0, 1,
-0.4389509, 0.2581399, -1.144422, 0.007843138, 1, 0, 1,
-0.436445, 1.367859, -0.09848142, 0.003921569, 1, 0, 1,
-0.4360326, -0.6237013, -1.288959, 0, 1, 0.003921569, 1,
-0.4349925, -1.47991, -2.901322, 0, 1, 0.01176471, 1,
-0.4338226, -0.9575433, -2.25459, 0, 1, 0.01568628, 1,
-0.4317521, -0.6381612, -1.740028, 0, 1, 0.02352941, 1,
-0.4302919, 0.3670294, -0.9626069, 0, 1, 0.02745098, 1,
-0.427088, -0.3581283, -1.8058, 0, 1, 0.03529412, 1,
-0.424869, 1.990144, 1.052356, 0, 1, 0.03921569, 1,
-0.4236449, -1.911072, -3.64229, 0, 1, 0.04705882, 1,
-0.4231473, 0.9831897, -0.5490606, 0, 1, 0.05098039, 1,
-0.4220379, -0.1839346, -0.6554059, 0, 1, 0.05882353, 1,
-0.4209263, 0.4632253, 2.765707, 0, 1, 0.0627451, 1,
-0.4112967, -0.3910778, -2.263948, 0, 1, 0.07058824, 1,
-0.4066144, -0.1387982, -1.586928, 0, 1, 0.07450981, 1,
-0.4051263, 0.6784057, 0.08500563, 0, 1, 0.08235294, 1,
-0.4019412, -0.8756941, -3.463382, 0, 1, 0.08627451, 1,
-0.4003389, 0.9598439, -0.0599222, 0, 1, 0.09411765, 1,
-0.3884813, 0.2238163, -1.296246, 0, 1, 0.1019608, 1,
-0.3882944, 1.096294, -0.1720183, 0, 1, 0.1058824, 1,
-0.3856513, 0.8517455, 0.344083, 0, 1, 0.1137255, 1,
-0.3832647, -0.7455464, -2.223801, 0, 1, 0.1176471, 1,
-0.3745979, -1.377356, -4.576165, 0, 1, 0.1254902, 1,
-0.3722917, 0.9601974, -1.354486, 0, 1, 0.1294118, 1,
-0.3622146, 0.6646222, -3.133581, 0, 1, 0.1372549, 1,
-0.3556989, 0.5464571, 0.2608487, 0, 1, 0.1411765, 1,
-0.3554037, -0.3764231, -2.712152, 0, 1, 0.1490196, 1,
-0.3494827, 2.430218, 1.364213, 0, 1, 0.1529412, 1,
-0.3470324, 1.724568, 0.03038568, 0, 1, 0.1607843, 1,
-0.3449128, -1.370826, -2.979699, 0, 1, 0.1647059, 1,
-0.3439837, 0.5434705, -1.129154, 0, 1, 0.172549, 1,
-0.342235, -2.871531, -2.756731, 0, 1, 0.1764706, 1,
-0.3409193, -0.2816973, -3.786543, 0, 1, 0.1843137, 1,
-0.3358409, 0.8888456, -0.9671286, 0, 1, 0.1882353, 1,
-0.3328755, -0.1010593, -0.7629595, 0, 1, 0.1960784, 1,
-0.3324603, -1.200375, -0.5345698, 0, 1, 0.2039216, 1,
-0.328676, 1.64246, -0.9390988, 0, 1, 0.2078431, 1,
-0.3282029, 1.64229, 0.3247353, 0, 1, 0.2156863, 1,
-0.3276833, -0.3343172, -0.7140914, 0, 1, 0.2196078, 1,
-0.32756, -0.1320763, -1.781301, 0, 1, 0.227451, 1,
-0.3241455, 0.3619656, -1.548187, 0, 1, 0.2313726, 1,
-0.3208603, 1.079831, -1.406057, 0, 1, 0.2392157, 1,
-0.3199835, 0.8905855, 1.117216, 0, 1, 0.2431373, 1,
-0.317174, 0.6101023, -0.7778314, 0, 1, 0.2509804, 1,
-0.3138618, 1.515369, 0.1934899, 0, 1, 0.254902, 1,
-0.3125779, 1.347252, 0.6965805, 0, 1, 0.2627451, 1,
-0.3078357, -0.05673769, 0.157689, 0, 1, 0.2666667, 1,
-0.3055218, -0.885084, -3.661923, 0, 1, 0.2745098, 1,
-0.3053488, -1.251645, -4.966755, 0, 1, 0.2784314, 1,
-0.305025, -1.175362, -0.8503289, 0, 1, 0.2862745, 1,
-0.3007545, 0.6105301, -2.0713, 0, 1, 0.2901961, 1,
-0.2987485, -2.125709, -3.252142, 0, 1, 0.2980392, 1,
-0.2954907, -0.4685708, -2.629637, 0, 1, 0.3058824, 1,
-0.2948043, 0.01323413, -2.587352, 0, 1, 0.3098039, 1,
-0.2933295, -0.5119319, -2.799045, 0, 1, 0.3176471, 1,
-0.2922279, -1.477776, -2.7135, 0, 1, 0.3215686, 1,
-0.2883149, 1.462728, -0.006943224, 0, 1, 0.3294118, 1,
-0.2867985, 0.07772949, -2.081219, 0, 1, 0.3333333, 1,
-0.2799144, 1.412015, 0.8232863, 0, 1, 0.3411765, 1,
-0.2757816, -0.04386675, -2.922945, 0, 1, 0.345098, 1,
-0.2757636, 1.404182, -0.9511048, 0, 1, 0.3529412, 1,
-0.2750193, 0.1467017, 0.0261187, 0, 1, 0.3568628, 1,
-0.2744058, 0.6710331, 1.012403, 0, 1, 0.3647059, 1,
-0.2670593, 0.1818849, -1.639394, 0, 1, 0.3686275, 1,
-0.2652081, 1.133439, 0.7398706, 0, 1, 0.3764706, 1,
-0.2612138, 0.2235006, 0.5112219, 0, 1, 0.3803922, 1,
-0.2604538, -1.263534, -3.578411, 0, 1, 0.3882353, 1,
-0.2520907, -0.3804851, -1.855263, 0, 1, 0.3921569, 1,
-0.2445624, 1.424476, -0.7774751, 0, 1, 0.4, 1,
-0.2425038, 0.5029371, -2.175029, 0, 1, 0.4078431, 1,
-0.2403251, -1.231499, -4.410923, 0, 1, 0.4117647, 1,
-0.2372681, 0.1509951, 0.07743274, 0, 1, 0.4196078, 1,
-0.2353546, 2.412241, 0.3545868, 0, 1, 0.4235294, 1,
-0.2340233, -0.2569798, -2.915942, 0, 1, 0.4313726, 1,
-0.2266066, 0.06587631, -0.8017298, 0, 1, 0.4352941, 1,
-0.2183217, 0.4810937, -0.2171776, 0, 1, 0.4431373, 1,
-0.2182962, 0.1730906, -1.059185, 0, 1, 0.4470588, 1,
-0.2180328, 1.623827, -2.763087, 0, 1, 0.454902, 1,
-0.2168562, -1.007523, -3.311049, 0, 1, 0.4588235, 1,
-0.2136687, 0.7289313, 0.03793683, 0, 1, 0.4666667, 1,
-0.2102912, 0.8605618, -0.2255838, 0, 1, 0.4705882, 1,
-0.2063286, 0.1190216, -3.912904, 0, 1, 0.4784314, 1,
-0.2049522, 0.2665051, -0.1389553, 0, 1, 0.4823529, 1,
-0.2034185, -1.863155, -2.437716, 0, 1, 0.4901961, 1,
-0.2033285, -0.8657675, -3.282973, 0, 1, 0.4941176, 1,
-0.1968706, 0.8005073, -0.9584489, 0, 1, 0.5019608, 1,
-0.1937046, -2.809164, -3.506661, 0, 1, 0.509804, 1,
-0.1884775, 0.4762921, 0.5829075, 0, 1, 0.5137255, 1,
-0.1867318, 0.2666562, -0.5787215, 0, 1, 0.5215687, 1,
-0.1831639, -1.473074, -3.431875, 0, 1, 0.5254902, 1,
-0.1822082, 0.1142793, -1.57374, 0, 1, 0.5333334, 1,
-0.1757158, 0.6567367, 0.8401167, 0, 1, 0.5372549, 1,
-0.16908, 1.731655, 0.4387152, 0, 1, 0.5450981, 1,
-0.1689802, 0.2335554, -0.902622, 0, 1, 0.5490196, 1,
-0.1649185, -0.6011346, -3.607411, 0, 1, 0.5568628, 1,
-0.1590235, -0.1528185, -3.531902, 0, 1, 0.5607843, 1,
-0.1575425, -1.586688, -1.823874, 0, 1, 0.5686275, 1,
-0.1555372, -0.8965361, -0.9316576, 0, 1, 0.572549, 1,
-0.1545632, 0.8312213, 0.1456764, 0, 1, 0.5803922, 1,
-0.1526264, -0.5230743, -2.820657, 0, 1, 0.5843138, 1,
-0.15071, -1.021423, -5.077476, 0, 1, 0.5921569, 1,
-0.1500053, -0.3481063, -3.673679, 0, 1, 0.5960785, 1,
-0.1464782, -0.4515093, -3.89287, 0, 1, 0.6039216, 1,
-0.1411329, -0.7751435, -3.046276, 0, 1, 0.6117647, 1,
-0.138318, -0.2359525, -2.368286, 0, 1, 0.6156863, 1,
-0.1382701, 0.5292517, -1.216275, 0, 1, 0.6235294, 1,
-0.1380887, 0.02946702, 0.1915387, 0, 1, 0.627451, 1,
-0.1328112, -0.5936452, -1.428555, 0, 1, 0.6352941, 1,
-0.1301099, -0.6604827, -2.850232, 0, 1, 0.6392157, 1,
-0.127138, 1.371728, 0.6476428, 0, 1, 0.6470588, 1,
-0.1260087, -2.124283, -2.321025, 0, 1, 0.6509804, 1,
-0.1236715, 0.5532281, -0.3077284, 0, 1, 0.6588235, 1,
-0.1226074, 0.5580237, 1.489661, 0, 1, 0.6627451, 1,
-0.1171541, 1.020324, -1.307975, 0, 1, 0.6705883, 1,
-0.1165339, -2.064881, -4.192166, 0, 1, 0.6745098, 1,
-0.1163371, -0.04959342, -1.510757, 0, 1, 0.682353, 1,
-0.112094, -0.4717512, -1.803128, 0, 1, 0.6862745, 1,
-0.1006384, -0.4642174, -2.606283, 0, 1, 0.6941177, 1,
-0.09932391, -1.900902, -2.409357, 0, 1, 0.7019608, 1,
-0.09905888, -0.2540435, -1.488833, 0, 1, 0.7058824, 1,
-0.09705429, -0.259276, -2.60223, 0, 1, 0.7137255, 1,
-0.08969104, 1.024166, -0.6393636, 0, 1, 0.7176471, 1,
-0.08833036, -1.189817, -3.749075, 0, 1, 0.7254902, 1,
-0.08669914, 0.386934, -1.22013, 0, 1, 0.7294118, 1,
-0.08653024, -1.088586, -2.651867, 0, 1, 0.7372549, 1,
-0.08501231, 0.4770967, -1.92828, 0, 1, 0.7411765, 1,
-0.08469966, 1.694964, -0.07328169, 0, 1, 0.7490196, 1,
-0.08205131, -0.4308965, -3.978971, 0, 1, 0.7529412, 1,
-0.08060978, -0.5452389, -1.962827, 0, 1, 0.7607843, 1,
-0.07464115, 0.3124334, -0.128527, 0, 1, 0.7647059, 1,
-0.07359994, -1.064679, -1.580847, 0, 1, 0.772549, 1,
-0.07257432, -0.6511149, -2.368203, 0, 1, 0.7764706, 1,
-0.0713683, 0.8659956, -0.1890638, 0, 1, 0.7843137, 1,
-0.07041818, 1.363543, 0.8735778, 0, 1, 0.7882353, 1,
-0.07011654, -0.5675214, -1.657433, 0, 1, 0.7960784, 1,
-0.06945486, 0.1709416, -3.555657, 0, 1, 0.8039216, 1,
-0.06012459, -1.032034, -4.157229, 0, 1, 0.8078431, 1,
-0.05677767, -0.5924902, -2.800453, 0, 1, 0.8156863, 1,
-0.05303628, 2.025252, 1.434286, 0, 1, 0.8196079, 1,
-0.04737864, -0.827311, -4.775899, 0, 1, 0.827451, 1,
-0.04725293, -0.7961822, -2.931544, 0, 1, 0.8313726, 1,
-0.04314746, 1.608302, -0.4096832, 0, 1, 0.8392157, 1,
-0.04215197, 0.7444112, -1.409031, 0, 1, 0.8431373, 1,
-0.04104013, 0.9514943, 0.1125807, 0, 1, 0.8509804, 1,
-0.03947044, -0.3977376, -4.582071, 0, 1, 0.854902, 1,
-0.03933265, 0.4812736, 1.406144, 0, 1, 0.8627451, 1,
-0.03644297, -0.8117422, -2.750715, 0, 1, 0.8666667, 1,
-0.0340945, 0.8165699, 1.089927, 0, 1, 0.8745098, 1,
-0.0325487, 0.769694, 0.1415034, 0, 1, 0.8784314, 1,
-0.03204605, 0.5903369, 0.02578535, 0, 1, 0.8862745, 1,
-0.03005044, 0.9079933, -0.6805384, 0, 1, 0.8901961, 1,
-0.02583245, 0.07655608, 1.163243, 0, 1, 0.8980392, 1,
-0.01794455, 0.1833793, 1.006564, 0, 1, 0.9058824, 1,
-0.01748825, 1.874963, 0.6028177, 0, 1, 0.9098039, 1,
-0.01053323, 0.4168269, 0.7249871, 0, 1, 0.9176471, 1,
-0.01033045, -0.7925807, -3.11966, 0, 1, 0.9215686, 1,
-0.00881994, 1.681985, 0.7060664, 0, 1, 0.9294118, 1,
-0.004747448, -1.803011, -4.298893, 0, 1, 0.9333333, 1,
0.0009757578, -0.1349539, 3.534286, 0, 1, 0.9411765, 1,
0.002088424, 0.4562746, 0.4449127, 0, 1, 0.945098, 1,
0.01348198, -1.20076, 5.192379, 0, 1, 0.9529412, 1,
0.0139733, 0.6940309, 1.139426, 0, 1, 0.9568627, 1,
0.01943126, -0.1304125, 1.677324, 0, 1, 0.9647059, 1,
0.02145352, -0.1731692, 2.839424, 0, 1, 0.9686275, 1,
0.0240779, -1.318513, 3.866592, 0, 1, 0.9764706, 1,
0.02532205, -1.07604, 1.689128, 0, 1, 0.9803922, 1,
0.02636029, -1.206288, 4.01796, 0, 1, 0.9882353, 1,
0.02738399, 0.6149665, 0.118557, 0, 1, 0.9921569, 1,
0.02759206, 0.02552272, 0.4584838, 0, 1, 1, 1,
0.0379487, 0.5043194, -0.7562932, 0, 0.9921569, 1, 1,
0.04610882, 0.5964888, 0.3742054, 0, 0.9882353, 1, 1,
0.04836403, -0.3057142, 2.499376, 0, 0.9803922, 1, 1,
0.0569735, 0.5268764, 1.189162, 0, 0.9764706, 1, 1,
0.05932553, -0.5252732, 2.187113, 0, 0.9686275, 1, 1,
0.05958984, 0.1066233, 0.7573386, 0, 0.9647059, 1, 1,
0.05985992, 1.076983, 0.7681448, 0, 0.9568627, 1, 1,
0.06686335, 0.779778, -1.564007, 0, 0.9529412, 1, 1,
0.06711576, 0.2625338, -0.4198281, 0, 0.945098, 1, 1,
0.06815637, -0.7623051, 3.353576, 0, 0.9411765, 1, 1,
0.06920923, -0.3506038, 3.801183, 0, 0.9333333, 1, 1,
0.06975262, -0.6453353, 3.931076, 0, 0.9294118, 1, 1,
0.07745145, 0.3589079, -1.908146, 0, 0.9215686, 1, 1,
0.07753353, -0.9806469, 5.181269, 0, 0.9176471, 1, 1,
0.07822423, 0.7911727, 0.2804282, 0, 0.9098039, 1, 1,
0.0841072, -0.1628809, 2.395999, 0, 0.9058824, 1, 1,
0.08434469, -1.535154, 3.250907, 0, 0.8980392, 1, 1,
0.08443228, 0.8019529, -1.883752, 0, 0.8901961, 1, 1,
0.08564661, -0.630513, 2.962146, 0, 0.8862745, 1, 1,
0.08748236, 1.452081, 0.5388875, 0, 0.8784314, 1, 1,
0.0875233, -1.7124, 2.932663, 0, 0.8745098, 1, 1,
0.09368152, -0.1336947, 2.270095, 0, 0.8666667, 1, 1,
0.09390659, -1.177497, 3.296372, 0, 0.8627451, 1, 1,
0.09401032, 1.448033, 1.785882, 0, 0.854902, 1, 1,
0.09993628, 2.961557, 0.280684, 0, 0.8509804, 1, 1,
0.1011669, 0.01582829, 0.4695807, 0, 0.8431373, 1, 1,
0.1089948, -1.429451, 5.247451, 0, 0.8392157, 1, 1,
0.1114192, -1.312248, 0.9358554, 0, 0.8313726, 1, 1,
0.1145451, 0.9170408, -1.20299, 0, 0.827451, 1, 1,
0.1204677, 0.1777931, -0.3642885, 0, 0.8196079, 1, 1,
0.1295605, 0.3529771, -0.2339778, 0, 0.8156863, 1, 1,
0.1297245, -0.1623273, 3.090017, 0, 0.8078431, 1, 1,
0.1314883, -1.579052, 3.665776, 0, 0.8039216, 1, 1,
0.1328492, -0.7728416, 3.72759, 0, 0.7960784, 1, 1,
0.1349008, -1.129904, 4.146699, 0, 0.7882353, 1, 1,
0.1392787, -0.01001948, 1.439331, 0, 0.7843137, 1, 1,
0.1405122, 0.8438069, 2.139652, 0, 0.7764706, 1, 1,
0.1429888, 0.3672707, -0.1156279, 0, 0.772549, 1, 1,
0.1445469, -0.817373, 1.445402, 0, 0.7647059, 1, 1,
0.1469173, -1.404027, 5.289316, 0, 0.7607843, 1, 1,
0.1490315, 1.09943, 0.08133949, 0, 0.7529412, 1, 1,
0.1511851, 0.7890003, -0.09644982, 0, 0.7490196, 1, 1,
0.1511872, -1.780475, 3.212366, 0, 0.7411765, 1, 1,
0.1528828, 0.5139082, 0.7499282, 0, 0.7372549, 1, 1,
0.1565099, 1.485142, 0.2875073, 0, 0.7294118, 1, 1,
0.1573992, -0.3741152, 1.368299, 0, 0.7254902, 1, 1,
0.1618532, 1.381423, 0.4248951, 0, 0.7176471, 1, 1,
0.1628076, 1.273286, 0.2927828, 0, 0.7137255, 1, 1,
0.163702, 0.3210331, 0.3099468, 0, 0.7058824, 1, 1,
0.1655193, 1.082414, 0.625228, 0, 0.6980392, 1, 1,
0.1659551, 1.314157, 1.617648, 0, 0.6941177, 1, 1,
0.1694451, 0.5905567, 0.1227086, 0, 0.6862745, 1, 1,
0.1710314, -0.720096, 4.825234, 0, 0.682353, 1, 1,
0.1738193, -0.8543027, 2.420321, 0, 0.6745098, 1, 1,
0.1744069, -0.6983158, 1.933443, 0, 0.6705883, 1, 1,
0.1761139, 1.786027, 0.03775054, 0, 0.6627451, 1, 1,
0.1777253, -2.038914, 3.754829, 0, 0.6588235, 1, 1,
0.1779279, -1.066855, 3.732806, 0, 0.6509804, 1, 1,
0.178108, -0.5503977, 2.648753, 0, 0.6470588, 1, 1,
0.1786054, 0.2405468, 0.4413147, 0, 0.6392157, 1, 1,
0.1790844, -1.024739, 2.804665, 0, 0.6352941, 1, 1,
0.1800264, -0.5967314, 3.247247, 0, 0.627451, 1, 1,
0.1804321, 0.2475159, 0.867101, 0, 0.6235294, 1, 1,
0.1827072, -0.3473203, 1.795892, 0, 0.6156863, 1, 1,
0.1832576, 0.4547489, 1.166689, 0, 0.6117647, 1, 1,
0.1838581, -0.8121405, 2.860288, 0, 0.6039216, 1, 1,
0.1841492, -1.146273, 3.438808, 0, 0.5960785, 1, 1,
0.185543, 1.926871, 0.4866742, 0, 0.5921569, 1, 1,
0.1864007, -0.8918468, 3.390153, 0, 0.5843138, 1, 1,
0.193835, 0.8325094, -2.133453, 0, 0.5803922, 1, 1,
0.1973563, 1.075096, 0.4904748, 0, 0.572549, 1, 1,
0.2020499, 0.3245799, 0.1117267, 0, 0.5686275, 1, 1,
0.2021228, -0.2078457, 2.916432, 0, 0.5607843, 1, 1,
0.2062542, -1.660225, 2.942318, 0, 0.5568628, 1, 1,
0.210351, -0.6356781, 3.064544, 0, 0.5490196, 1, 1,
0.2136262, 1.489964, 1.176061, 0, 0.5450981, 1, 1,
0.2177303, -1.26178, 2.797712, 0, 0.5372549, 1, 1,
0.2190742, -0.01516204, 1.641752, 0, 0.5333334, 1, 1,
0.2199594, -0.6438677, 3.615946, 0, 0.5254902, 1, 1,
0.2215475, 0.9024533, 0.9988145, 0, 0.5215687, 1, 1,
0.2222026, 0.2076317, 1.174406, 0, 0.5137255, 1, 1,
0.2223704, 0.303137, 0.7927107, 0, 0.509804, 1, 1,
0.2265133, -0.8647277, 2.270636, 0, 0.5019608, 1, 1,
0.2379785, -0.9238585, 3.091393, 0, 0.4941176, 1, 1,
0.2456468, -0.5304267, 4.342759, 0, 0.4901961, 1, 1,
0.247378, -0.944324, 3.976527, 0, 0.4823529, 1, 1,
0.2499301, 1.0603, 0.02692823, 0, 0.4784314, 1, 1,
0.250515, -1.347839, 2.426641, 0, 0.4705882, 1, 1,
0.2533388, -1.007369, 2.998957, 0, 0.4666667, 1, 1,
0.2543916, 0.831807, 2.008761, 0, 0.4588235, 1, 1,
0.2549575, -0.581839, 3.755149, 0, 0.454902, 1, 1,
0.2571797, 0.1668183, 1.819295, 0, 0.4470588, 1, 1,
0.2618906, -0.4851319, 2.199855, 0, 0.4431373, 1, 1,
0.264392, -0.1171093, 2.267758, 0, 0.4352941, 1, 1,
0.2645973, -1.264434, 4.413919, 0, 0.4313726, 1, 1,
0.2654823, -1.283551, 2.767363, 0, 0.4235294, 1, 1,
0.2666342, -0.1980184, 1.024343, 0, 0.4196078, 1, 1,
0.2701551, -0.05757584, 0.5617177, 0, 0.4117647, 1, 1,
0.2745728, 0.7416701, 1.039182, 0, 0.4078431, 1, 1,
0.2746238, -0.1688014, 1.852504, 0, 0.4, 1, 1,
0.2788455, 1.267785, 0.01484173, 0, 0.3921569, 1, 1,
0.2811761, -1.294422, 1.975832, 0, 0.3882353, 1, 1,
0.2830503, -1.148402, 2.193438, 0, 0.3803922, 1, 1,
0.2839015, -0.1495793, 1.401245, 0, 0.3764706, 1, 1,
0.2840744, -0.02140546, 2.132558, 0, 0.3686275, 1, 1,
0.2891161, 0.8322955, 0.9381391, 0, 0.3647059, 1, 1,
0.2900918, 0.1435124, -0.7407271, 0, 0.3568628, 1, 1,
0.2922902, -0.51566, 3.716086, 0, 0.3529412, 1, 1,
0.2922933, -0.7139071, 2.28657, 0, 0.345098, 1, 1,
0.2940817, 0.2689849, -0.6953992, 0, 0.3411765, 1, 1,
0.2953476, -0.499098, 2.860643, 0, 0.3333333, 1, 1,
0.2980115, -0.7887387, 3.796864, 0, 0.3294118, 1, 1,
0.2985521, 1.373046, -0.3594802, 0, 0.3215686, 1, 1,
0.3029885, -0.3665012, 1.990129, 0, 0.3176471, 1, 1,
0.3042082, -0.8229626, 3.294912, 0, 0.3098039, 1, 1,
0.3061262, -1.594918, 3.602999, 0, 0.3058824, 1, 1,
0.3088738, -0.8373247, 1.021562, 0, 0.2980392, 1, 1,
0.3117365, 0.5362711, -0.4814069, 0, 0.2901961, 1, 1,
0.3158827, 0.5811331, 0.07935985, 0, 0.2862745, 1, 1,
0.3183895, -0.4918193, 1.560533, 0, 0.2784314, 1, 1,
0.3189752, 1.205603, 1.31722, 0, 0.2745098, 1, 1,
0.3273498, -0.1755445, 0.7659196, 0, 0.2666667, 1, 1,
0.3325546, 1.632037, -0.5518483, 0, 0.2627451, 1, 1,
0.3334463, 1.061577, 0.8991414, 0, 0.254902, 1, 1,
0.3429165, 0.1410289, 3.249006, 0, 0.2509804, 1, 1,
0.3454907, 0.8419797, -2.270813, 0, 0.2431373, 1, 1,
0.3463781, -0.5308645, 3.205183, 0, 0.2392157, 1, 1,
0.3481987, -0.08063194, 0.6308523, 0, 0.2313726, 1, 1,
0.3570636, -1.546117, 3.030527, 0, 0.227451, 1, 1,
0.3585911, 1.233993, -1.058632, 0, 0.2196078, 1, 1,
0.3592789, 0.2050537, 3.003057, 0, 0.2156863, 1, 1,
0.3635052, -0.3897717, 3.300155, 0, 0.2078431, 1, 1,
0.3684449, 0.04531471, 3.099954, 0, 0.2039216, 1, 1,
0.3690739, 0.2773401, 1.877663, 0, 0.1960784, 1, 1,
0.3693941, -1.595709, 2.269877, 0, 0.1882353, 1, 1,
0.3704357, -1.368859, 2.471956, 0, 0.1843137, 1, 1,
0.3710762, -0.1994704, -0.1276836, 0, 0.1764706, 1, 1,
0.3713232, 0.7264678, 0.4681795, 0, 0.172549, 1, 1,
0.3726515, 1.703523, 1.339347, 0, 0.1647059, 1, 1,
0.3728963, -2.272451, 3.0685, 0, 0.1607843, 1, 1,
0.3731463, -0.213642, 1.331185, 0, 0.1529412, 1, 1,
0.3742345, 1.211572, 0.1921858, 0, 0.1490196, 1, 1,
0.3769674, -1.18107, 3.186648, 0, 0.1411765, 1, 1,
0.3773274, -0.9950206, 1.186526, 0, 0.1372549, 1, 1,
0.3788018, -1.014946, 4.810244, 0, 0.1294118, 1, 1,
0.38092, 1.054445, -0.2799383, 0, 0.1254902, 1, 1,
0.3814866, -0.5777839, 2.671418, 0, 0.1176471, 1, 1,
0.3822816, -0.6743858, 4.521913, 0, 0.1137255, 1, 1,
0.3846293, 0.5883067, -0.6272135, 0, 0.1058824, 1, 1,
0.3848215, -0.8028529, 2.044879, 0, 0.09803922, 1, 1,
0.3922662, 0.7255942, 0.8771113, 0, 0.09411765, 1, 1,
0.3949509, -1.13838, 1.235295, 0, 0.08627451, 1, 1,
0.3963929, 0.2299039, 0.4838795, 0, 0.08235294, 1, 1,
0.3972793, 0.4056482, 0.8976539, 0, 0.07450981, 1, 1,
0.3997966, -0.7011576, 2.881802, 0, 0.07058824, 1, 1,
0.4005634, -0.2330319, 1.787433, 0, 0.0627451, 1, 1,
0.4088823, 0.4609688, 2.17522, 0, 0.05882353, 1, 1,
0.4096515, -0.1547457, 2.805143, 0, 0.05098039, 1, 1,
0.4139768, 0.9309778, -0.9723957, 0, 0.04705882, 1, 1,
0.4152287, 0.5694186, -0.08235701, 0, 0.03921569, 1, 1,
0.415954, -1.246472, 4.169426, 0, 0.03529412, 1, 1,
0.4169718, -0.4558685, 3.294423, 0, 0.02745098, 1, 1,
0.4188255, 0.4358364, 2.147942, 0, 0.02352941, 1, 1,
0.4214655, -0.5736536, 3.808428, 0, 0.01568628, 1, 1,
0.4350945, -0.7429225, 3.933314, 0, 0.01176471, 1, 1,
0.4361473, 0.9676303, 0.447671, 0, 0.003921569, 1, 1,
0.4369285, -0.1581555, -0.1893621, 0.003921569, 0, 1, 1,
0.4369641, 0.2549984, 0.7627447, 0.007843138, 0, 1, 1,
0.4427801, 1.461059, 0.5582424, 0.01568628, 0, 1, 1,
0.4463597, 1.263796, 1.317234, 0.01960784, 0, 1, 1,
0.4552404, 0.7410643, 0.1549647, 0.02745098, 0, 1, 1,
0.4578454, 0.4028227, 1.511012, 0.03137255, 0, 1, 1,
0.4582836, -1.301217, 4.573074, 0.03921569, 0, 1, 1,
0.4589806, -0.01152909, 1.939103, 0.04313726, 0, 1, 1,
0.4600624, -1.946629, 1.736009, 0.05098039, 0, 1, 1,
0.4664976, 1.666294, 0.2941264, 0.05490196, 0, 1, 1,
0.4688941, 2.04218, -0.5491045, 0.0627451, 0, 1, 1,
0.4709564, -1.699869, 3.779459, 0.06666667, 0, 1, 1,
0.4750305, -0.3735383, 3.277591, 0.07450981, 0, 1, 1,
0.4873354, 0.430802, 0.486452, 0.07843138, 0, 1, 1,
0.4879057, -0.03555173, 3.143413, 0.08627451, 0, 1, 1,
0.4882009, -0.5639408, 3.560611, 0.09019608, 0, 1, 1,
0.492633, -0.7980192, 2.333541, 0.09803922, 0, 1, 1,
0.4990955, 0.3459119, 1.52678, 0.1058824, 0, 1, 1,
0.4991253, 0.3442554, 0.8348545, 0.1098039, 0, 1, 1,
0.5040426, -0.2656758, 2.043173, 0.1176471, 0, 1, 1,
0.5092201, 0.04543448, 1.65952, 0.1215686, 0, 1, 1,
0.5094479, 1.495256, 0.9499556, 0.1294118, 0, 1, 1,
0.5121806, 0.006439988, 1.634487, 0.1333333, 0, 1, 1,
0.5124648, -0.6830802, 2.124944, 0.1411765, 0, 1, 1,
0.5151646, 1.125599, 0.5032122, 0.145098, 0, 1, 1,
0.5166875, 1.416644, 0.3940707, 0.1529412, 0, 1, 1,
0.5211723, -0.0759579, 0.4976923, 0.1568628, 0, 1, 1,
0.5234725, 0.2810749, -0.5603254, 0.1647059, 0, 1, 1,
0.5286614, 0.9715137, 0.2237027, 0.1686275, 0, 1, 1,
0.5289505, 0.5050809, 1.140031, 0.1764706, 0, 1, 1,
0.5342022, -0.09033631, 4.156853, 0.1803922, 0, 1, 1,
0.5344424, -0.6291771, 3.180696, 0.1882353, 0, 1, 1,
0.5384141, -1.228835, 1.669008, 0.1921569, 0, 1, 1,
0.5386536, 0.5485799, 1.275024, 0.2, 0, 1, 1,
0.5409805, -1.177609, 1.913637, 0.2078431, 0, 1, 1,
0.5432659, -0.9779478, 1.527314, 0.2117647, 0, 1, 1,
0.5453466, 0.06652469, 1.223526, 0.2196078, 0, 1, 1,
0.5460384, -1.313498, 1.531632, 0.2235294, 0, 1, 1,
0.548772, -0.3768455, 3.310693, 0.2313726, 0, 1, 1,
0.5508317, 1.175325, 1.517763, 0.2352941, 0, 1, 1,
0.554096, -0.2886349, 2.656977, 0.2431373, 0, 1, 1,
0.5576667, -0.985462, 2.519405, 0.2470588, 0, 1, 1,
0.5594396, 0.3939224, -0.4395845, 0.254902, 0, 1, 1,
0.5651803, -0.6508898, 2.794264, 0.2588235, 0, 1, 1,
0.5654112, -0.464493, 2.083596, 0.2666667, 0, 1, 1,
0.5654953, -0.04296394, 1.784894, 0.2705882, 0, 1, 1,
0.5657659, 0.3864231, 0.5099903, 0.2784314, 0, 1, 1,
0.5690482, -0.3508831, 2.758628, 0.282353, 0, 1, 1,
0.5835063, 0.3018419, 1.621937, 0.2901961, 0, 1, 1,
0.5869097, 1.098611, 0.1473597, 0.2941177, 0, 1, 1,
0.5872494, 1.607487, 0.2542411, 0.3019608, 0, 1, 1,
0.5876684, -1.414213, 2.957798, 0.3098039, 0, 1, 1,
0.5886507, 0.7253859, 0.5602737, 0.3137255, 0, 1, 1,
0.5901561, 0.3501957, 0.5663052, 0.3215686, 0, 1, 1,
0.5917909, 0.4601822, 1.4962, 0.3254902, 0, 1, 1,
0.5921083, 0.3265809, 0.7758017, 0.3333333, 0, 1, 1,
0.5955359, 0.892354, 0.08912055, 0.3372549, 0, 1, 1,
0.5967379, 1.885545, 0.002979236, 0.345098, 0, 1, 1,
0.5994284, -0.822764, 2.703736, 0.3490196, 0, 1, 1,
0.599792, -0.2923729, 0.9792501, 0.3568628, 0, 1, 1,
0.6007574, -0.1415077, 3.022897, 0.3607843, 0, 1, 1,
0.6008186, -0.4832862, 0.7863463, 0.3686275, 0, 1, 1,
0.6011713, 1.449195, -1.11473, 0.372549, 0, 1, 1,
0.6046385, 0.4134891, 2.388516, 0.3803922, 0, 1, 1,
0.6118025, -0.7231011, 0.8533283, 0.3843137, 0, 1, 1,
0.6142204, -0.3913922, 0.8533612, 0.3921569, 0, 1, 1,
0.6158598, -2.258607, 2.38481, 0.3960784, 0, 1, 1,
0.6167247, 0.05411407, 1.207871, 0.4039216, 0, 1, 1,
0.6190091, 0.9845024, -0.542119, 0.4117647, 0, 1, 1,
0.6193072, -0.6571222, -0.603807, 0.4156863, 0, 1, 1,
0.6214853, -0.4310766, 1.241786, 0.4235294, 0, 1, 1,
0.6226259, -1.210002, 1.53373, 0.427451, 0, 1, 1,
0.6232865, -0.04579974, 1.41171, 0.4352941, 0, 1, 1,
0.6238271, -1.156012, 3.262667, 0.4392157, 0, 1, 1,
0.6264931, -0.606241, 2.274577, 0.4470588, 0, 1, 1,
0.6311283, -0.03972097, 2.565413, 0.4509804, 0, 1, 1,
0.6323509, -0.4517789, 1.291799, 0.4588235, 0, 1, 1,
0.6329353, 1.077818, 1.428847, 0.4627451, 0, 1, 1,
0.6358876, 0.7261209, -0.2164013, 0.4705882, 0, 1, 1,
0.6373658, 0.7580078, -0.1375996, 0.4745098, 0, 1, 1,
0.6414728, 2.2193, 2.32927, 0.4823529, 0, 1, 1,
0.650813, 0.9024354, 0.7024446, 0.4862745, 0, 1, 1,
0.6517766, -0.4285648, 1.754912, 0.4941176, 0, 1, 1,
0.652244, -1.27225, 2.333288, 0.5019608, 0, 1, 1,
0.6563284, 2.494746, 0.8660457, 0.5058824, 0, 1, 1,
0.6663896, 0.5507856, 0.4948483, 0.5137255, 0, 1, 1,
0.6678355, -0.9250878, 2.448164, 0.5176471, 0, 1, 1,
0.6686629, -0.5848833, 2.786022, 0.5254902, 0, 1, 1,
0.6699781, -0.5325139, 2.176115, 0.5294118, 0, 1, 1,
0.6718874, 0.4255954, 0.6761683, 0.5372549, 0, 1, 1,
0.6732066, -0.6966112, 1.509071, 0.5411765, 0, 1, 1,
0.6810148, -0.2535135, 2.590835, 0.5490196, 0, 1, 1,
0.6865652, 0.7741649, -0.1351621, 0.5529412, 0, 1, 1,
0.7025708, -0.111589, 2.386786, 0.5607843, 0, 1, 1,
0.7078555, -0.3397901, 1.673562, 0.5647059, 0, 1, 1,
0.708527, 1.451062, -0.363562, 0.572549, 0, 1, 1,
0.7128206, -0.3407241, 0.844829, 0.5764706, 0, 1, 1,
0.7157368, 0.6222156, 0.2464339, 0.5843138, 0, 1, 1,
0.7178501, 1.122513, 0.403164, 0.5882353, 0, 1, 1,
0.7269421, 1.474109, 0.6086935, 0.5960785, 0, 1, 1,
0.7308725, -1.334439, 2.952326, 0.6039216, 0, 1, 1,
0.7327649, -0.2960244, 2.18743, 0.6078432, 0, 1, 1,
0.7330204, -1.28297, 3.153689, 0.6156863, 0, 1, 1,
0.7442068, 1.259255, 0.3384925, 0.6196079, 0, 1, 1,
0.7463288, 2.065545, 1.848232, 0.627451, 0, 1, 1,
0.7474051, 0.1400881, 1.007698, 0.6313726, 0, 1, 1,
0.7500361, 1.520596, 1.22311, 0.6392157, 0, 1, 1,
0.7509989, -1.347411, 3.785353, 0.6431373, 0, 1, 1,
0.7544104, 0.7928798, 1.58568, 0.6509804, 0, 1, 1,
0.770041, -0.784444, 0.1638926, 0.654902, 0, 1, 1,
0.7723321, -1.570205, 3.693548, 0.6627451, 0, 1, 1,
0.7762539, 0.1264322, 3.060791, 0.6666667, 0, 1, 1,
0.7777054, -1.254087, 2.69986, 0.6745098, 0, 1, 1,
0.778403, 0.7126805, 2.86454, 0.6784314, 0, 1, 1,
0.7828764, 0.5725639, -1.174001, 0.6862745, 0, 1, 1,
0.783408, 1.441012, -0.0944094, 0.6901961, 0, 1, 1,
0.7865224, -0.4126627, 0.9991886, 0.6980392, 0, 1, 1,
0.7867731, 1.569446, 2.171843, 0.7058824, 0, 1, 1,
0.7869166, -1.086207, 1.609218, 0.7098039, 0, 1, 1,
0.7880942, 0.2732916, 0.8752623, 0.7176471, 0, 1, 1,
0.7912307, 0.8612495, -0.04439512, 0.7215686, 0, 1, 1,
0.7913136, 0.9842521, -0.2122208, 0.7294118, 0, 1, 1,
0.7985238, 0.3250138, 2.253144, 0.7333333, 0, 1, 1,
0.8015149, 0.1643645, 0.1722759, 0.7411765, 0, 1, 1,
0.8028274, -1.919413, 4.282114, 0.7450981, 0, 1, 1,
0.803429, -0.03813468, 0.882157, 0.7529412, 0, 1, 1,
0.8065075, 1.425381, -0.1420486, 0.7568628, 0, 1, 1,
0.8098397, -0.4012942, 1.564765, 0.7647059, 0, 1, 1,
0.8110598, 0.412223, 1.789448, 0.7686275, 0, 1, 1,
0.8175268, 0.0518917, 1.300156, 0.7764706, 0, 1, 1,
0.8183874, 0.5573302, 1.184983, 0.7803922, 0, 1, 1,
0.8200718, 0.344596, 0.5542509, 0.7882353, 0, 1, 1,
0.8228459, -0.4875888, 4.161755, 0.7921569, 0, 1, 1,
0.8272005, -0.470607, 0.8978267, 0.8, 0, 1, 1,
0.8312482, 1.318622, 0.3538282, 0.8078431, 0, 1, 1,
0.8345276, -1.553867, 1.105829, 0.8117647, 0, 1, 1,
0.8364289, -1.352539, 2.944538, 0.8196079, 0, 1, 1,
0.8369284, -0.6511711, 2.03097, 0.8235294, 0, 1, 1,
0.8396574, -1.265147, 2.561054, 0.8313726, 0, 1, 1,
0.8654077, -0.02533027, 1.180208, 0.8352941, 0, 1, 1,
0.8671196, 0.4915974, 2.189665, 0.8431373, 0, 1, 1,
0.8672439, 0.3598598, 1.459372, 0.8470588, 0, 1, 1,
0.8729461, 0.5970085, -1.333341, 0.854902, 0, 1, 1,
0.8749445, 1.602116, 0.7333767, 0.8588235, 0, 1, 1,
0.8769693, 1.128047, 0.2024868, 0.8666667, 0, 1, 1,
0.8821338, 1.556401, -1.061113, 0.8705882, 0, 1, 1,
0.8881184, 0.02383796, 2.374377, 0.8784314, 0, 1, 1,
0.8887239, 0.4224654, 1.404479, 0.8823529, 0, 1, 1,
0.8888923, -1.837984, 2.05298, 0.8901961, 0, 1, 1,
0.8935202, 0.3251726, 0.3715508, 0.8941177, 0, 1, 1,
0.8955562, 0.1069884, 1.153597, 0.9019608, 0, 1, 1,
0.8955933, -0.3389342, 1.297112, 0.9098039, 0, 1, 1,
0.8994952, 3.291736, -1.602164, 0.9137255, 0, 1, 1,
0.9027616, -0.07929384, 0.8079958, 0.9215686, 0, 1, 1,
0.9065828, 0.04446663, 0.9780198, 0.9254902, 0, 1, 1,
0.908799, -1.13317, 2.310657, 0.9333333, 0, 1, 1,
0.9099473, 0.3778945, 1.647864, 0.9372549, 0, 1, 1,
0.9117091, 1.731228, 0.2035541, 0.945098, 0, 1, 1,
0.9141737, 1.415663, 0.9387917, 0.9490196, 0, 1, 1,
0.9196283, -0.4311035, 3.190355, 0.9568627, 0, 1, 1,
0.9225811, -0.9626456, 2.857584, 0.9607843, 0, 1, 1,
0.9327077, -1.552422, 1.38451, 0.9686275, 0, 1, 1,
0.9386566, 0.8423571, 0.3824461, 0.972549, 0, 1, 1,
0.9421938, 1.733467, -0.596328, 0.9803922, 0, 1, 1,
0.9479237, -0.1871364, 1.187594, 0.9843137, 0, 1, 1,
0.9561482, -0.9412481, 2.898249, 0.9921569, 0, 1, 1,
0.9566559, 1.011661, 1.411314, 0.9960784, 0, 1, 1,
0.9618841, -0.4489265, 2.326624, 1, 0, 0.9960784, 1,
0.9622247, 0.5260488, 3.546471, 1, 0, 0.9882353, 1,
0.9695466, 0.4620829, 2.259521, 1, 0, 0.9843137, 1,
0.9797437, -0.6448165, 1.929469, 1, 0, 0.9764706, 1,
0.9803396, 0.7423714, 1.77831, 1, 0, 0.972549, 1,
0.9857849, 0.3300596, 2.159775, 1, 0, 0.9647059, 1,
0.9951333, 0.9313321, -0.1000291, 1, 0, 0.9607843, 1,
0.9955674, 1.32393, -0.8323506, 1, 0, 0.9529412, 1,
0.9968275, 0.05766763, 3.8381, 1, 0, 0.9490196, 1,
0.9989871, -0.7775325, 3.230706, 1, 0, 0.9411765, 1,
0.9997868, -0.7502618, 1.37233, 1, 0, 0.9372549, 1,
1.016545, -0.871506, 0.8687835, 1, 0, 0.9294118, 1,
1.016945, -0.444552, -0.1642314, 1, 0, 0.9254902, 1,
1.021764, 0.9121456, 1.698162, 1, 0, 0.9176471, 1,
1.025359, 0.5798395, 2.238226, 1, 0, 0.9137255, 1,
1.028483, 0.5007864, 0.1150293, 1, 0, 0.9058824, 1,
1.035755, -1.007464, 1.740628, 1, 0, 0.9019608, 1,
1.041676, 1.779943, -0.6629721, 1, 0, 0.8941177, 1,
1.048951, -1.424219, 3.018804, 1, 0, 0.8862745, 1,
1.051604, 1.781419, 0.3265609, 1, 0, 0.8823529, 1,
1.052959, -0.01566689, 1.932296, 1, 0, 0.8745098, 1,
1.055522, 1.219499, 2.748796, 1, 0, 0.8705882, 1,
1.064989, 0.558089, 2.851435, 1, 0, 0.8627451, 1,
1.074486, -1.727123, 2.394381, 1, 0, 0.8588235, 1,
1.075441, -0.4250117, 1.586634, 1, 0, 0.8509804, 1,
1.077485, 0.6587992, -1.456555, 1, 0, 0.8470588, 1,
1.080919, -1.214012, 3.370982, 1, 0, 0.8392157, 1,
1.084606, -0.7921565, 2.092951, 1, 0, 0.8352941, 1,
1.085621, 1.022962, -0.3002977, 1, 0, 0.827451, 1,
1.095038, 2.123924, 0.9415931, 1, 0, 0.8235294, 1,
1.098812, -0.9125599, 4.069109, 1, 0, 0.8156863, 1,
1.098869, -0.3104883, 2.309211, 1, 0, 0.8117647, 1,
1.102509, -0.5378579, 2.972207, 1, 0, 0.8039216, 1,
1.113412, 1.469698, 0.5319532, 1, 0, 0.7960784, 1,
1.120248, -0.5981882, 2.797876, 1, 0, 0.7921569, 1,
1.12091, 0.9424909, 0.7264429, 1, 0, 0.7843137, 1,
1.12931, 0.08606603, 4.030635, 1, 0, 0.7803922, 1,
1.137886, -0.2340854, 0.6938673, 1, 0, 0.772549, 1,
1.139292, 0.7855611, 0.4755897, 1, 0, 0.7686275, 1,
1.141254, 0.7982511, 1.228064, 1, 0, 0.7607843, 1,
1.14524, -0.2253046, 2.745219, 1, 0, 0.7568628, 1,
1.171307, 1.676539, 1.306135, 1, 0, 0.7490196, 1,
1.176816, 0.6786886, 0.9929777, 1, 0, 0.7450981, 1,
1.183112, -1.389068, 1.788607, 1, 0, 0.7372549, 1,
1.183508, -1.120346, 3.359975, 1, 0, 0.7333333, 1,
1.184424, 0.725742, 1.031054, 1, 0, 0.7254902, 1,
1.18766, 2.380598, 1.68307, 1, 0, 0.7215686, 1,
1.204084, 0.4486341, 2.524142, 1, 0, 0.7137255, 1,
1.205633, -1.248016, 2.924188, 1, 0, 0.7098039, 1,
1.213618, -1.532879, 3.638856, 1, 0, 0.7019608, 1,
1.213996, -0.1365013, 1.296466, 1, 0, 0.6941177, 1,
1.222921, -0.3353129, 2.666336, 1, 0, 0.6901961, 1,
1.232378, 0.5354359, 1.149724, 1, 0, 0.682353, 1,
1.252611, -1.496538, 2.893685, 1, 0, 0.6784314, 1,
1.254696, 1.163903, -0.9156703, 1, 0, 0.6705883, 1,
1.258013, -0.8604443, 3.478285, 1, 0, 0.6666667, 1,
1.259132, -0.1839464, 3.232196, 1, 0, 0.6588235, 1,
1.261336, -1.847138, 1.245131, 1, 0, 0.654902, 1,
1.262282, 0.1929704, 1.897039, 1, 0, 0.6470588, 1,
1.270997, -0.5913961, 0.9044794, 1, 0, 0.6431373, 1,
1.275168, -1.471361, 2.384426, 1, 0, 0.6352941, 1,
1.281754, 0.3977733, 1.139403, 1, 0, 0.6313726, 1,
1.286247, -0.7531899, 1.725364, 1, 0, 0.6235294, 1,
1.287568, -0.6967348, 1.348713, 1, 0, 0.6196079, 1,
1.287881, 0.8819919, -0.7412279, 1, 0, 0.6117647, 1,
1.292924, -0.1083996, 1.122882, 1, 0, 0.6078432, 1,
1.295297, -1.139373, 2.434251, 1, 0, 0.6, 1,
1.296883, -0.7601389, 2.564078, 1, 0, 0.5921569, 1,
1.301471, -0.5103874, 3.672591, 1, 0, 0.5882353, 1,
1.307125, -0.9315056, 2.878931, 1, 0, 0.5803922, 1,
1.308333, 0.9653454, 1.211911, 1, 0, 0.5764706, 1,
1.313138, 0.3300477, 2.80628, 1, 0, 0.5686275, 1,
1.314353, 1.181594, 1.259377, 1, 0, 0.5647059, 1,
1.32681, -0.2781236, 2.030119, 1, 0, 0.5568628, 1,
1.328441, -0.3714127, 1.412989, 1, 0, 0.5529412, 1,
1.329857, 0.5757245, 2.914301, 1, 0, 0.5450981, 1,
1.330876, -0.1790512, -0.3523346, 1, 0, 0.5411765, 1,
1.335687, 0.3707316, 0.1564195, 1, 0, 0.5333334, 1,
1.335877, -0.8334299, 1.318872, 1, 0, 0.5294118, 1,
1.344749, 0.06472684, 2.07796, 1, 0, 0.5215687, 1,
1.346025, 0.2387162, 1.080167, 1, 0, 0.5176471, 1,
1.352738, -1.503142, 1.443895, 1, 0, 0.509804, 1,
1.370535, 0.09753142, 0.8741127, 1, 0, 0.5058824, 1,
1.374799, 1.096332, 0.6529377, 1, 0, 0.4980392, 1,
1.382333, -1.299989, 2.045815, 1, 0, 0.4901961, 1,
1.387533, -0.3736753, 1.197858, 1, 0, 0.4862745, 1,
1.392929, -1.935036, 3.605763, 1, 0, 0.4784314, 1,
1.394302, -1.573015, 2.409765, 1, 0, 0.4745098, 1,
1.4152, -1.468431, 3.71026, 1, 0, 0.4666667, 1,
1.416086, -1.132862, 2.56365, 1, 0, 0.4627451, 1,
1.421418, -0.4124366, 1.047223, 1, 0, 0.454902, 1,
1.45149, 0.251478, 0.9555008, 1, 0, 0.4509804, 1,
1.452985, -0.5974427, 0.8216212, 1, 0, 0.4431373, 1,
1.458698, 1.846754, 1.545622, 1, 0, 0.4392157, 1,
1.464349, -0.6024141, 0.601114, 1, 0, 0.4313726, 1,
1.473641, -0.5157428, 2.245158, 1, 0, 0.427451, 1,
1.474031, -0.2413578, 2.045346, 1, 0, 0.4196078, 1,
1.481702, -0.06421507, 2.228681, 1, 0, 0.4156863, 1,
1.496558, -0.9466697, 3.516763, 1, 0, 0.4078431, 1,
1.497144, -0.02863452, 1.241004, 1, 0, 0.4039216, 1,
1.52503, -0.8603991, 1.731626, 1, 0, 0.3960784, 1,
1.539164, 0.9684486, 0.4578385, 1, 0, 0.3882353, 1,
1.540773, 0.1107403, 1.747745, 1, 0, 0.3843137, 1,
1.546812, 1.280212, 0.2226925, 1, 0, 0.3764706, 1,
1.547825, 0.3790457, 0.2922406, 1, 0, 0.372549, 1,
1.557502, -1.592903, 1.895433, 1, 0, 0.3647059, 1,
1.57084, 0.06756946, 1.424695, 1, 0, 0.3607843, 1,
1.580004, 0.3609678, 1.397453, 1, 0, 0.3529412, 1,
1.581283, -0.2542648, 0.3666648, 1, 0, 0.3490196, 1,
1.590493, -1.339484, 3.183101, 1, 0, 0.3411765, 1,
1.602988, -0.2264428, 0.91813, 1, 0, 0.3372549, 1,
1.605777, -0.4888099, 0.02297301, 1, 0, 0.3294118, 1,
1.616768, 1.115515, 0.8930751, 1, 0, 0.3254902, 1,
1.617694, 2.963609, 2.122962, 1, 0, 0.3176471, 1,
1.620808, -1.113943, 1.979669, 1, 0, 0.3137255, 1,
1.641707, 0.3363062, 1.952743, 1, 0, 0.3058824, 1,
1.659039, -0.7524123, 1.21442, 1, 0, 0.2980392, 1,
1.676682, 0.7344865, 2.001189, 1, 0, 0.2941177, 1,
1.680496, -0.8230903, 1.366567, 1, 0, 0.2862745, 1,
1.684924, -2.134426, 1.196837, 1, 0, 0.282353, 1,
1.689521, 0.4114514, 1.068777, 1, 0, 0.2745098, 1,
1.702034, 0.8501433, 1.517074, 1, 0, 0.2705882, 1,
1.704, -0.3550975, 1.482767, 1, 0, 0.2627451, 1,
1.704605, 0.210377, 0.1392346, 1, 0, 0.2588235, 1,
1.70493, -0.2757938, 1.099195, 1, 0, 0.2509804, 1,
1.740573, -1.167727, 0.7500843, 1, 0, 0.2470588, 1,
1.757474, 0.7137651, 2.216933, 1, 0, 0.2392157, 1,
1.763661, -2.58918, 2.755902, 1, 0, 0.2352941, 1,
1.766218, -0.1250613, 1.519842, 1, 0, 0.227451, 1,
1.767164, 0.02193196, 1.137736, 1, 0, 0.2235294, 1,
1.802415, -0.9667907, 3.073824, 1, 0, 0.2156863, 1,
1.82567, 0.4189772, 0.9506879, 1, 0, 0.2117647, 1,
1.825717, -1.709465, 2.194053, 1, 0, 0.2039216, 1,
1.834985, -1.351291, 2.455215, 1, 0, 0.1960784, 1,
1.844984, -0.6854501, 1.304942, 1, 0, 0.1921569, 1,
1.858346, 1.14817, -0.09040864, 1, 0, 0.1843137, 1,
1.860047, -0.4788301, 0.8321928, 1, 0, 0.1803922, 1,
1.880918, -0.01150938, 2.632496, 1, 0, 0.172549, 1,
1.904687, 1.106326, -1.112061, 1, 0, 0.1686275, 1,
1.920622, 0.5955506, -0.3610393, 1, 0, 0.1607843, 1,
1.944866, 0.2814389, 1.488999, 1, 0, 0.1568628, 1,
1.958134, 0.3576709, 1.03253, 1, 0, 0.1490196, 1,
1.989602, 0.589673, 0.9030676, 1, 0, 0.145098, 1,
1.990754, -0.9485065, 2.247988, 1, 0, 0.1372549, 1,
2.023878, -1.062555, -0.2910004, 1, 0, 0.1333333, 1,
2.036077, -0.5149377, 3.486913, 1, 0, 0.1254902, 1,
2.051084, -1.811337, 4.241793, 1, 0, 0.1215686, 1,
2.051851, 0.03088432, 1.258881, 1, 0, 0.1137255, 1,
2.126224, 0.3364069, 0.1898251, 1, 0, 0.1098039, 1,
2.148429, 0.08363581, 0.2291961, 1, 0, 0.1019608, 1,
2.153854, 0.4394045, 1.294794, 1, 0, 0.09411765, 1,
2.18564, 0.4424451, 1.24359, 1, 0, 0.09019608, 1,
2.225869, -0.2115274, 2.324901, 1, 0, 0.08235294, 1,
2.240431, 0.5149666, 4.440366, 1, 0, 0.07843138, 1,
2.289819, -0.5690379, 3.613654, 1, 0, 0.07058824, 1,
2.295884, -0.9750562, 1.23113, 1, 0, 0.06666667, 1,
2.329594, 0.06776121, 2.265397, 1, 0, 0.05882353, 1,
2.391151, 1.117084, 0.9930642, 1, 0, 0.05490196, 1,
2.413638, 0.05388148, 2.159601, 1, 0, 0.04705882, 1,
2.431853, 0.2867516, 2.420725, 1, 0, 0.04313726, 1,
2.496868, 0.6756271, 0.1755804, 1, 0, 0.03529412, 1,
2.584306, -0.4208534, 1.905665, 1, 0, 0.03137255, 1,
2.637943, 0.536943, 0.9994815, 1, 0, 0.02352941, 1,
2.75909, -0.7331268, 1.84304, 1, 0, 0.01960784, 1,
2.846197, -0.926103, 1.827841, 1, 0, 0.01176471, 1,
4.508179, 0.5410874, 1.611784, 1, 0, 0.007843138, 1
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
0.6180365, -3.916205, -7.010002, 0, -0.5, 0.5, 0.5,
0.6180365, -3.916205, -7.010002, 1, -0.5, 0.5, 0.5,
0.6180365, -3.916205, -7.010002, 1, 1.5, 0.5, 0.5,
0.6180365, -3.916205, -7.010002, 0, 1.5, 0.5, 0.5
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
-4.590864, 0.2101024, -7.010002, 0, -0.5, 0.5, 0.5,
-4.590864, 0.2101024, -7.010002, 1, -0.5, 0.5, 0.5,
-4.590864, 0.2101024, -7.010002, 1, 1.5, 0.5, 0.5,
-4.590864, 0.2101024, -7.010002, 0, 1.5, 0.5, 0.5
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
-4.590864, -3.916205, 0.03095007, 0, -0.5, 0.5, 0.5,
-4.590864, -3.916205, 0.03095007, 1, -0.5, 0.5, 0.5,
-4.590864, -3.916205, 0.03095007, 1, 1.5, 0.5, 0.5,
-4.590864, -3.916205, 0.03095007, 0, 1.5, 0.5, 0.5
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
-2, -2.96398, -5.385167,
4, -2.96398, -5.385167,
-2, -2.96398, -5.385167,
-2, -3.122684, -5.655973,
0, -2.96398, -5.385167,
0, -3.122684, -5.655973,
2, -2.96398, -5.385167,
2, -3.122684, -5.655973,
4, -2.96398, -5.385167,
4, -3.122684, -5.655973
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
"2",
"4"
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
-2, -3.440092, -6.197585, 0, -0.5, 0.5, 0.5,
-2, -3.440092, -6.197585, 1, -0.5, 0.5, 0.5,
-2, -3.440092, -6.197585, 1, 1.5, 0.5, 0.5,
-2, -3.440092, -6.197585, 0, 1.5, 0.5, 0.5,
0, -3.440092, -6.197585, 0, -0.5, 0.5, 0.5,
0, -3.440092, -6.197585, 1, -0.5, 0.5, 0.5,
0, -3.440092, -6.197585, 1, 1.5, 0.5, 0.5,
0, -3.440092, -6.197585, 0, 1.5, 0.5, 0.5,
2, -3.440092, -6.197585, 0, -0.5, 0.5, 0.5,
2, -3.440092, -6.197585, 1, -0.5, 0.5, 0.5,
2, -3.440092, -6.197585, 1, 1.5, 0.5, 0.5,
2, -3.440092, -6.197585, 0, 1.5, 0.5, 0.5,
4, -3.440092, -6.197585, 0, -0.5, 0.5, 0.5,
4, -3.440092, -6.197585, 1, -0.5, 0.5, 0.5,
4, -3.440092, -6.197585, 1, 1.5, 0.5, 0.5,
4, -3.440092, -6.197585, 0, 1.5, 0.5, 0.5
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
-3.38881, -2, -5.385167,
-3.38881, 3, -5.385167,
-3.38881, -2, -5.385167,
-3.589152, -2, -5.655973,
-3.38881, -1, -5.385167,
-3.589152, -1, -5.655973,
-3.38881, 0, -5.385167,
-3.589152, 0, -5.655973,
-3.38881, 1, -5.385167,
-3.589152, 1, -5.655973,
-3.38881, 2, -5.385167,
-3.589152, 2, -5.655973,
-3.38881, 3, -5.385167,
-3.589152, 3, -5.655973
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
-3.989837, -2, -6.197585, 0, -0.5, 0.5, 0.5,
-3.989837, -2, -6.197585, 1, -0.5, 0.5, 0.5,
-3.989837, -2, -6.197585, 1, 1.5, 0.5, 0.5,
-3.989837, -2, -6.197585, 0, 1.5, 0.5, 0.5,
-3.989837, -1, -6.197585, 0, -0.5, 0.5, 0.5,
-3.989837, -1, -6.197585, 1, -0.5, 0.5, 0.5,
-3.989837, -1, -6.197585, 1, 1.5, 0.5, 0.5,
-3.989837, -1, -6.197585, 0, 1.5, 0.5, 0.5,
-3.989837, 0, -6.197585, 0, -0.5, 0.5, 0.5,
-3.989837, 0, -6.197585, 1, -0.5, 0.5, 0.5,
-3.989837, 0, -6.197585, 1, 1.5, 0.5, 0.5,
-3.989837, 0, -6.197585, 0, 1.5, 0.5, 0.5,
-3.989837, 1, -6.197585, 0, -0.5, 0.5, 0.5,
-3.989837, 1, -6.197585, 1, -0.5, 0.5, 0.5,
-3.989837, 1, -6.197585, 1, 1.5, 0.5, 0.5,
-3.989837, 1, -6.197585, 0, 1.5, 0.5, 0.5,
-3.989837, 2, -6.197585, 0, -0.5, 0.5, 0.5,
-3.989837, 2, -6.197585, 1, -0.5, 0.5, 0.5,
-3.989837, 2, -6.197585, 1, 1.5, 0.5, 0.5,
-3.989837, 2, -6.197585, 0, 1.5, 0.5, 0.5,
-3.989837, 3, -6.197585, 0, -0.5, 0.5, 0.5,
-3.989837, 3, -6.197585, 1, -0.5, 0.5, 0.5,
-3.989837, 3, -6.197585, 1, 1.5, 0.5, 0.5,
-3.989837, 3, -6.197585, 0, 1.5, 0.5, 0.5
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
-3.38881, -2.96398, -4,
-3.38881, -2.96398, 4,
-3.38881, -2.96398, -4,
-3.589152, -3.122684, -4,
-3.38881, -2.96398, -2,
-3.589152, -3.122684, -2,
-3.38881, -2.96398, 0,
-3.589152, -3.122684, 0,
-3.38881, -2.96398, 2,
-3.589152, -3.122684, 2,
-3.38881, -2.96398, 4,
-3.589152, -3.122684, 4
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
-3.989837, -3.440092, -4, 0, -0.5, 0.5, 0.5,
-3.989837, -3.440092, -4, 1, -0.5, 0.5, 0.5,
-3.989837, -3.440092, -4, 1, 1.5, 0.5, 0.5,
-3.989837, -3.440092, -4, 0, 1.5, 0.5, 0.5,
-3.989837, -3.440092, -2, 0, -0.5, 0.5, 0.5,
-3.989837, -3.440092, -2, 1, -0.5, 0.5, 0.5,
-3.989837, -3.440092, -2, 1, 1.5, 0.5, 0.5,
-3.989837, -3.440092, -2, 0, 1.5, 0.5, 0.5,
-3.989837, -3.440092, 0, 0, -0.5, 0.5, 0.5,
-3.989837, -3.440092, 0, 1, -0.5, 0.5, 0.5,
-3.989837, -3.440092, 0, 1, 1.5, 0.5, 0.5,
-3.989837, -3.440092, 0, 0, 1.5, 0.5, 0.5,
-3.989837, -3.440092, 2, 0, -0.5, 0.5, 0.5,
-3.989837, -3.440092, 2, 1, -0.5, 0.5, 0.5,
-3.989837, -3.440092, 2, 1, 1.5, 0.5, 0.5,
-3.989837, -3.440092, 2, 0, 1.5, 0.5, 0.5,
-3.989837, -3.440092, 4, 0, -0.5, 0.5, 0.5,
-3.989837, -3.440092, 4, 1, -0.5, 0.5, 0.5,
-3.989837, -3.440092, 4, 1, 1.5, 0.5, 0.5,
-3.989837, -3.440092, 4, 0, 1.5, 0.5, 0.5
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
-3.38881, -2.96398, -5.385167,
-3.38881, 3.384185, -5.385167,
-3.38881, -2.96398, 5.447067,
-3.38881, 3.384185, 5.447067,
-3.38881, -2.96398, -5.385167,
-3.38881, -2.96398, 5.447067,
-3.38881, 3.384185, -5.385167,
-3.38881, 3.384185, 5.447067,
-3.38881, -2.96398, -5.385167,
4.624883, -2.96398, -5.385167,
-3.38881, -2.96398, 5.447067,
4.624883, -2.96398, 5.447067,
-3.38881, 3.384185, -5.385167,
4.624883, 3.384185, -5.385167,
-3.38881, 3.384185, 5.447067,
4.624883, 3.384185, 5.447067,
4.624883, -2.96398, -5.385167,
4.624883, 3.384185, -5.385167,
4.624883, -2.96398, 5.447067,
4.624883, 3.384185, 5.447067,
4.624883, -2.96398, -5.385167,
4.624883, -2.96398, 5.447067,
4.624883, 3.384185, -5.385167,
4.624883, 3.384185, 5.447067
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
var radius = 7.953547;
var distance = 35.38623;
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
mvMatrix.translate( -0.6180365, -0.2101024, -0.03095007 );
mvMatrix.scale( 1.073105, 1.354648, 0.7938834 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.38623);
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
thiadiazinane-2-thio<-read.table("thiadiazinane-2-thio.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiadiazinane-2-thio$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazinane' not found
```

```r
y<-thiadiazinane-2-thio$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazinane' not found
```

```r
z<-thiadiazinane-2-thio$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazinane' not found
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
-3.272106, 1.268336, -1.606437, 0, 0, 1, 1, 1,
-2.987892, 0.1924866, -1.893781, 1, 0, 0, 1, 1,
-2.838219, 2.248719, -0.7812634, 1, 0, 0, 1, 1,
-2.744674, 0.584903, -0.1306154, 1, 0, 0, 1, 1,
-2.713474, 0.6976652, -1.307085, 1, 0, 0, 1, 1,
-2.661727, 0.1592676, -2.581578, 1, 0, 0, 1, 1,
-2.404298, -0.6650957, -1.445865, 0, 0, 0, 1, 1,
-2.367297, -0.7305294, -3.545016, 0, 0, 0, 1, 1,
-2.343062, 0.7668402, -3.144798, 0, 0, 0, 1, 1,
-2.27542, 0.5351043, -2.113506, 0, 0, 0, 1, 1,
-2.193548, 0.3513334, -1.545249, 0, 0, 0, 1, 1,
-2.172991, -0.2324781, -3.074506, 0, 0, 0, 1, 1,
-2.164733, -1.197844, -2.991558, 0, 0, 0, 1, 1,
-2.15175, -1.261918, -3.609124, 1, 1, 1, 1, 1,
-2.133616, 0.7445292, -0.4248008, 1, 1, 1, 1, 1,
-2.116425, 1.972978, -0.9373415, 1, 1, 1, 1, 1,
-2.08621, -0.7784338, -2.196786, 1, 1, 1, 1, 1,
-2.045469, -0.3715633, -1.759398, 1, 1, 1, 1, 1,
-2.042087, -0.1929912, -1.007544, 1, 1, 1, 1, 1,
-2.037384, -0.4183181, -2.726614, 1, 1, 1, 1, 1,
-2.006996, -1.674862, -2.751507, 1, 1, 1, 1, 1,
-1.970104, -0.4985682, -3.103718, 1, 1, 1, 1, 1,
-1.965982, 0.348921, 0.2887509, 1, 1, 1, 1, 1,
-1.938803, 0.6169527, -2.893417, 1, 1, 1, 1, 1,
-1.915501, 1.821869, -0.1580527, 1, 1, 1, 1, 1,
-1.887719, 0.09762558, -3.815379, 1, 1, 1, 1, 1,
-1.846513, 0.8531982, -1.644523, 1, 1, 1, 1, 1,
-1.844803, 1.920575, -1.9541, 1, 1, 1, 1, 1,
-1.837897, -0.3687662, 0.506828, 0, 0, 1, 1, 1,
-1.826306, -0.4191555, -1.610967, 1, 0, 0, 1, 1,
-1.820336, 3.016339, -1.70512, 1, 0, 0, 1, 1,
-1.811698, 0.3404871, 0.1216609, 1, 0, 0, 1, 1,
-1.803712, -0.2325208, -1.241655, 1, 0, 0, 1, 1,
-1.801432, -0.1848111, -0.8667204, 1, 0, 0, 1, 1,
-1.795626, 0.5437053, -1.440581, 0, 0, 0, 1, 1,
-1.789449, 0.3544319, -1.688947, 0, 0, 0, 1, 1,
-1.779277, -0.7540953, -1.176212, 0, 0, 0, 1, 1,
-1.775298, 0.4416873, -0.7290649, 0, 0, 0, 1, 1,
-1.769995, -1.681579, -1.945731, 0, 0, 0, 1, 1,
-1.765808, -0.4553406, -0.7437409, 0, 0, 0, 1, 1,
-1.753231, 0.4201868, -2.055723, 0, 0, 0, 1, 1,
-1.729609, 0.9765871, -0.4060106, 1, 1, 1, 1, 1,
-1.708219, 1.073809, -2.07658, 1, 1, 1, 1, 1,
-1.704317, 0.4428714, -1.308673, 1, 1, 1, 1, 1,
-1.70188, -0.03186969, -3.800146, 1, 1, 1, 1, 1,
-1.697923, 0.4583459, -1.330029, 1, 1, 1, 1, 1,
-1.68277, 0.9699185, -0.7761271, 1, 1, 1, 1, 1,
-1.682288, -1.381595, -1.84522, 1, 1, 1, 1, 1,
-1.664487, -1.153505, -1.820389, 1, 1, 1, 1, 1,
-1.663147, 0.09553162, -1.629865, 1, 1, 1, 1, 1,
-1.662645, -0.01016666, -0.05179344, 1, 1, 1, 1, 1,
-1.653913, -0.02797551, -1.960327, 1, 1, 1, 1, 1,
-1.651549, -0.961484, -1.106002, 1, 1, 1, 1, 1,
-1.639352, -0.6949285, -1.688224, 1, 1, 1, 1, 1,
-1.628727, -0.9463337, -2.177955, 1, 1, 1, 1, 1,
-1.626773, 0.02687967, -1.639501, 1, 1, 1, 1, 1,
-1.603459, 0.3569925, -1.944852, 0, 0, 1, 1, 1,
-1.583757, -0.8612341, -2.705726, 1, 0, 0, 1, 1,
-1.580728, 0.706225, -1.64751, 1, 0, 0, 1, 1,
-1.577145, -0.4214611, -1.686796, 1, 0, 0, 1, 1,
-1.566097, 1.248451, -0.8490222, 1, 0, 0, 1, 1,
-1.566027, -0.5763732, -1.242565, 1, 0, 0, 1, 1,
-1.557397, -0.4092948, -3.133159, 0, 0, 0, 1, 1,
-1.555113, 0.6095613, -0.9921043, 0, 0, 0, 1, 1,
-1.55093, 1.105556, -1.537339, 0, 0, 0, 1, 1,
-1.530199, -0.9623241, -2.419769, 0, 0, 0, 1, 1,
-1.527956, 0.508911, -0.2964671, 0, 0, 0, 1, 1,
-1.513423, -0.1754591, -4.051597, 0, 0, 0, 1, 1,
-1.51185, -0.4431982, -1.440049, 0, 0, 0, 1, 1,
-1.507249, 0.5226352, -1.287686, 1, 1, 1, 1, 1,
-1.500804, 1.806142, -1.635827, 1, 1, 1, 1, 1,
-1.497469, -0.9923069, -3.284179, 1, 1, 1, 1, 1,
-1.488746, -0.7682754, -2.17006, 1, 1, 1, 1, 1,
-1.483922, -1.954669, -1.372296, 1, 1, 1, 1, 1,
-1.477137, -0.7414041, -1.783782, 1, 1, 1, 1, 1,
-1.470906, 0.0328904, -1.728578, 1, 1, 1, 1, 1,
-1.467451, -0.8704461, -0.978224, 1, 1, 1, 1, 1,
-1.464554, 0.3000494, -1.126419, 1, 1, 1, 1, 1,
-1.450678, 0.8568247, -1.005874, 1, 1, 1, 1, 1,
-1.450332, 1.132986, -0.3132727, 1, 1, 1, 1, 1,
-1.448447, -0.06560265, -2.589356, 1, 1, 1, 1, 1,
-1.438419, 0.1326119, -1.144347, 1, 1, 1, 1, 1,
-1.416354, 0.7042114, -0.8533764, 1, 1, 1, 1, 1,
-1.404796, 0.08590282, -1.54538, 1, 1, 1, 1, 1,
-1.401939, 0.6224648, 0.594485, 0, 0, 1, 1, 1,
-1.39749, 1.307455, -2.117757, 1, 0, 0, 1, 1,
-1.393839, -0.04451652, 0.1905398, 1, 0, 0, 1, 1,
-1.393646, -0.3748831, -2.278689, 1, 0, 0, 1, 1,
-1.385993, 1.031538, -0.092571, 1, 0, 0, 1, 1,
-1.385777, 0.164976, -4.481607, 1, 0, 0, 1, 1,
-1.377045, 0.1224875, 0.9508821, 0, 0, 0, 1, 1,
-1.375936, -0.8563704, -2.403897, 0, 0, 0, 1, 1,
-1.373857, -2.187383, -2.503524, 0, 0, 0, 1, 1,
-1.360282, 0.4986183, -1.018886, 0, 0, 0, 1, 1,
-1.350938, 0.1350702, -1.057639, 0, 0, 0, 1, 1,
-1.349866, 1.683319, -0.8279437, 0, 0, 0, 1, 1,
-1.345102, -1.73801, -2.460496, 0, 0, 0, 1, 1,
-1.333874, 0.6592376, -0.290816, 1, 1, 1, 1, 1,
-1.332878, -0.5125331, -2.594144, 1, 1, 1, 1, 1,
-1.314096, 0.4038231, -1.435323, 1, 1, 1, 1, 1,
-1.311403, 0.1278873, -3.036262, 1, 1, 1, 1, 1,
-1.301752, -0.6017789, -2.620681, 1, 1, 1, 1, 1,
-1.293441, -0.7180549, -0.1078286, 1, 1, 1, 1, 1,
-1.279777, 1.537442, -1.320948, 1, 1, 1, 1, 1,
-1.276466, -0.5160142, -3.275263, 1, 1, 1, 1, 1,
-1.27582, 0.5754286, -1.697128, 1, 1, 1, 1, 1,
-1.269187, 0.6323087, -3.413012, 1, 1, 1, 1, 1,
-1.261351, 0.4224595, -2.316607, 1, 1, 1, 1, 1,
-1.26106, 0.694653, -0.507466, 1, 1, 1, 1, 1,
-1.2608, -0.2622879, -2.424144, 1, 1, 1, 1, 1,
-1.258462, 0.7946426, -1.040555, 1, 1, 1, 1, 1,
-1.256954, 1.053654, -0.5023964, 1, 1, 1, 1, 1,
-1.235975, 2.295404, -0.6257758, 0, 0, 1, 1, 1,
-1.234695, -0.1068673, -1.394549, 1, 0, 0, 1, 1,
-1.234327, -1.567674, -2.111531, 1, 0, 0, 1, 1,
-1.230093, -0.04867236, -1.694928, 1, 0, 0, 1, 1,
-1.204659, 0.7022109, -2.603928, 1, 0, 0, 1, 1,
-1.201001, -2.788516, -3.313595, 1, 0, 0, 1, 1,
-1.189633, -1.229125, -2.560095, 0, 0, 0, 1, 1,
-1.189178, 1.063021, -0.2149875, 0, 0, 0, 1, 1,
-1.184322, -0.5164396, -0.8876168, 0, 0, 0, 1, 1,
-1.183684, 0.5481381, -2.976748, 0, 0, 0, 1, 1,
-1.180553, -0.7922516, -0.431688, 0, 0, 0, 1, 1,
-1.18003, -0.1532516, -0.8967373, 0, 0, 0, 1, 1,
-1.17884, -0.3184907, -2.028884, 0, 0, 0, 1, 1,
-1.175663, -1.626629, -4.397668, 1, 1, 1, 1, 1,
-1.167766, 1.067328, -1.512884, 1, 1, 1, 1, 1,
-1.165109, -0.1438299, -1.066659, 1, 1, 1, 1, 1,
-1.163047, 1.306824, -1.255407, 1, 1, 1, 1, 1,
-1.162701, -2.751455, -3.21418, 1, 1, 1, 1, 1,
-1.158925, -0.4407119, -2.446333, 1, 1, 1, 1, 1,
-1.156695, 0.4315675, -2.38992, 1, 1, 1, 1, 1,
-1.152979, -2.123834, -0.8101895, 1, 1, 1, 1, 1,
-1.150488, 0.1802745, -1.982008, 1, 1, 1, 1, 1,
-1.150133, 1.193014, -0.487706, 1, 1, 1, 1, 1,
-1.148081, -1.139646, -2.252986, 1, 1, 1, 1, 1,
-1.138448, 0.542982, -0.7430794, 1, 1, 1, 1, 1,
-1.134764, 1.368401, -0.1659347, 1, 1, 1, 1, 1,
-1.126166, -0.09807847, -1.702107, 1, 1, 1, 1, 1,
-1.121095, -0.1077577, -1.584507, 1, 1, 1, 1, 1,
-1.118175, 0.7214131, -0.9380566, 0, 0, 1, 1, 1,
-1.115605, -0.04975009, -1.868155, 1, 0, 0, 1, 1,
-1.110577, 0.4655246, -0.6195168, 1, 0, 0, 1, 1,
-1.104187, -2.475985, -2.02458, 1, 0, 0, 1, 1,
-1.095208, -0.5350605, -3.029324, 1, 0, 0, 1, 1,
-1.094729, 1.795038, -0.1713124, 1, 0, 0, 1, 1,
-1.094576, -0.9495999, -3.055535, 0, 0, 0, 1, 1,
-1.092881, 0.7796603, -1.110317, 0, 0, 0, 1, 1,
-1.092263, 0.6165296, -0.225008, 0, 0, 0, 1, 1,
-1.087109, -0.3391784, -2.221898, 0, 0, 0, 1, 1,
-1.083846, 0.4571727, 0.334095, 0, 0, 0, 1, 1,
-1.081506, -1.749484, -0.308901, 0, 0, 0, 1, 1,
-1.075253, -0.3751767, -1.52989, 0, 0, 0, 1, 1,
-1.073176, -0.6966856, -3.302887, 1, 1, 1, 1, 1,
-1.062413, 0.05057279, -1.087653, 1, 1, 1, 1, 1,
-1.061988, -0.4484994, -1.072624, 1, 1, 1, 1, 1,
-1.051563, -0.6241769, -2.311229, 1, 1, 1, 1, 1,
-1.051321, 1.510175, -2.102792, 1, 1, 1, 1, 1,
-1.044948, 0.9473603, -0.3139591, 1, 1, 1, 1, 1,
-1.043342, -1.434878, -2.470022, 1, 1, 1, 1, 1,
-1.033847, 0.002619179, -0.8984372, 1, 1, 1, 1, 1,
-1.027188, 0.4437762, -1.455411, 1, 1, 1, 1, 1,
-1.002533, 1.171281, -0.3967899, 1, 1, 1, 1, 1,
-0.9999569, -0.3125321, -3.828581, 1, 1, 1, 1, 1,
-0.9935036, -1.803429, -3.888998, 1, 1, 1, 1, 1,
-0.9892094, 1.311794, -2.012165, 1, 1, 1, 1, 1,
-0.9836915, -1.300302, -1.155813, 1, 1, 1, 1, 1,
-0.9827619, -1.869661, -2.368475, 1, 1, 1, 1, 1,
-0.977837, 0.7420516, -0.5897025, 0, 0, 1, 1, 1,
-0.9774284, -1.102097, -2.436108, 1, 0, 0, 1, 1,
-0.9767953, -0.4372961, 0.7111905, 1, 0, 0, 1, 1,
-0.9756255, -1.040773, -2.827433, 1, 0, 0, 1, 1,
-0.9624689, 2.007969, -0.2554131, 1, 0, 0, 1, 1,
-0.9548743, -1.004467, -0.3907287, 1, 0, 0, 1, 1,
-0.9519472, -1.682791, -1.833117, 0, 0, 0, 1, 1,
-0.9489229, -0.3399878, -2.541701, 0, 0, 0, 1, 1,
-0.9435609, 0.2546711, -1.316273, 0, 0, 0, 1, 1,
-0.939897, -0.1540963, -3.509913, 0, 0, 0, 1, 1,
-0.9380161, 0.9711691, -1.700788, 0, 0, 0, 1, 1,
-0.9292519, 1.105116, -0.306841, 0, 0, 0, 1, 1,
-0.9283855, -0.1901529, -2.668566, 0, 0, 0, 1, 1,
-0.9270901, -1.421838, -2.071234, 1, 1, 1, 1, 1,
-0.9269717, -0.4132989, -2.282379, 1, 1, 1, 1, 1,
-0.9255055, -0.7434714, -2.720733, 1, 1, 1, 1, 1,
-0.9245768, 0.1334637, -2.599938, 1, 1, 1, 1, 1,
-0.9174221, -0.03741887, -2.36357, 1, 1, 1, 1, 1,
-0.9155421, -0.8802722, -2.370221, 1, 1, 1, 1, 1,
-0.914142, 0.7050248, -0.2608324, 1, 1, 1, 1, 1,
-0.9140888, 0.6833627, -1.18827, 1, 1, 1, 1, 1,
-0.9099294, -1.168297, -3.90565, 1, 1, 1, 1, 1,
-0.9020839, 1.211752, 0.7348818, 1, 1, 1, 1, 1,
-0.8988951, -0.4262323, 0.04292368, 1, 1, 1, 1, 1,
-0.8968499, 1.613223, -0.1853889, 1, 1, 1, 1, 1,
-0.8946434, -1.040952, -0.7250796, 1, 1, 1, 1, 1,
-0.8943728, 0.6590697, -1.887956, 1, 1, 1, 1, 1,
-0.8918104, -0.2863027, -1.652248, 1, 1, 1, 1, 1,
-0.8843143, 1.344381, -1.540802, 0, 0, 1, 1, 1,
-0.8813508, -0.03061882, -0.8260248, 1, 0, 0, 1, 1,
-0.8789076, 0.4679566, -0.930994, 1, 0, 0, 1, 1,
-0.8779615, -0.9496656, -4.472654, 1, 0, 0, 1, 1,
-0.875895, 0.1107495, -0.4079815, 1, 0, 0, 1, 1,
-0.8725732, 0.917396, -1.421757, 1, 0, 0, 1, 1,
-0.8724563, -0.9656954, -2.65623, 0, 0, 0, 1, 1,
-0.8723767, 0.6449477, -1.275479, 0, 0, 0, 1, 1,
-0.8721939, 0.2790132, -1.942673, 0, 0, 0, 1, 1,
-0.8626015, -1.026349, -3.764307, 0, 0, 0, 1, 1,
-0.8621958, 1.54791, 0.1203752, 0, 0, 0, 1, 1,
-0.8594144, -0.4938035, -1.664672, 0, 0, 0, 1, 1,
-0.8591399, -0.5120296, -1.989812, 0, 0, 0, 1, 1,
-0.854726, -1.490509, -5.227416, 1, 1, 1, 1, 1,
-0.8429284, 1.531853, 1.459484, 1, 1, 1, 1, 1,
-0.8269049, 0.1037294, -0.6728583, 1, 1, 1, 1, 1,
-0.8221308, 0.4769372, -1.136958, 1, 1, 1, 1, 1,
-0.8210358, -0.5202894, -2.636674, 1, 1, 1, 1, 1,
-0.8147793, -0.6578521, -1.530748, 1, 1, 1, 1, 1,
-0.8036596, 0.1597588, 0.04162887, 1, 1, 1, 1, 1,
-0.803094, -1.509729, -2.995739, 1, 1, 1, 1, 1,
-0.8015846, -1.152112, -3.805722, 1, 1, 1, 1, 1,
-0.8003785, 0.0169089, -1.404097, 1, 1, 1, 1, 1,
-0.7962221, 0.1682311, -0.7084272, 1, 1, 1, 1, 1,
-0.7952684, 1.281065, -1.10056, 1, 1, 1, 1, 1,
-0.792762, 0.912481, -1.005662, 1, 1, 1, 1, 1,
-0.7904854, -0.3083169, -1.150276, 1, 1, 1, 1, 1,
-0.7898738, 0.3219697, -2.666354, 1, 1, 1, 1, 1,
-0.7870737, -0.1802291, -1.542949, 0, 0, 1, 1, 1,
-0.7869675, 0.7743359, -0.995812, 1, 0, 0, 1, 1,
-0.7869599, 0.07641204, 0.7074595, 1, 0, 0, 1, 1,
-0.7811642, 0.7966303, -1.850452, 1, 0, 0, 1, 1,
-0.7776665, 0.1750037, -0.587161, 1, 0, 0, 1, 1,
-0.7773567, -1.63284, -3.040282, 1, 0, 0, 1, 1,
-0.7772262, 0.06635857, -2.127548, 0, 0, 0, 1, 1,
-0.7751541, -0.8786854, -3.60232, 0, 0, 0, 1, 1,
-0.7699506, -0.3963069, -2.889685, 0, 0, 0, 1, 1,
-0.7693567, -0.2366706, -1.386501, 0, 0, 0, 1, 1,
-0.7679273, 0.8100319, -0.3960073, 0, 0, 0, 1, 1,
-0.7667569, -0.1231085, -1.031048, 0, 0, 0, 1, 1,
-0.7653379, -0.1446464, -0.7800958, 0, 0, 0, 1, 1,
-0.7648757, 2.15445, -1.87415, 1, 1, 1, 1, 1,
-0.7645041, 1.382362, -1.957489, 1, 1, 1, 1, 1,
-0.761385, -1.252579, -2.09499, 1, 1, 1, 1, 1,
-0.7581667, 0.8183093, -1.927696, 1, 1, 1, 1, 1,
-0.7565119, -0.3694593, -2.015971, 1, 1, 1, 1, 1,
-0.7504289, 0.8600734, 0.3299259, 1, 1, 1, 1, 1,
-0.748258, -0.4988863, -1.074155, 1, 1, 1, 1, 1,
-0.7443709, 0.5599167, -1.168504, 1, 1, 1, 1, 1,
-0.737758, 0.4685362, -1.335962, 1, 1, 1, 1, 1,
-0.7375772, -0.5865222, -2.435766, 1, 1, 1, 1, 1,
-0.7351421, -0.3492045, -0.9512026, 1, 1, 1, 1, 1,
-0.728884, 0.885175, -1.371407, 1, 1, 1, 1, 1,
-0.7239638, 1.557976, -0.4912179, 1, 1, 1, 1, 1,
-0.7231852, -0.3494126, -1.008222, 1, 1, 1, 1, 1,
-0.719408, 0.3378978, -0.6028329, 1, 1, 1, 1, 1,
-0.7162809, 0.07013616, -1.205715, 0, 0, 1, 1, 1,
-0.7133318, -1.353752, -3.927696, 1, 0, 0, 1, 1,
-0.7102144, 0.5714812, -1.997885, 1, 0, 0, 1, 1,
-0.7083831, 0.1573123, -2.078929, 1, 0, 0, 1, 1,
-0.708302, -1.089125, -1.663262, 1, 0, 0, 1, 1,
-0.7039554, 0.547002, 0.4758995, 1, 0, 0, 1, 1,
-0.6957376, -0.526884, -2.088928, 0, 0, 0, 1, 1,
-0.6809984, 0.5814991, -0.7335122, 0, 0, 0, 1, 1,
-0.6754704, -0.1601675, -2.286153, 0, 0, 0, 1, 1,
-0.67058, 0.6553188, -0.01418547, 0, 0, 0, 1, 1,
-0.6688368, 1.173296, -1.309261, 0, 0, 0, 1, 1,
-0.6623844, -0.7878627, -5.06841, 0, 0, 0, 1, 1,
-0.6444862, 1.950957, 0.6864013, 0, 0, 0, 1, 1,
-0.6425148, 0.4281743, -1.902278, 1, 1, 1, 1, 1,
-0.6365334, -0.7137075, -2.448103, 1, 1, 1, 1, 1,
-0.6270538, 0.4699132, -0.2302847, 1, 1, 1, 1, 1,
-0.621488, -0.7989104, -1.576722, 1, 1, 1, 1, 1,
-0.621058, -0.06079089, -1.435565, 1, 1, 1, 1, 1,
-0.6199935, 0.1369662, 0.6776515, 1, 1, 1, 1, 1,
-0.6178169, -1.72987, -3.790014, 1, 1, 1, 1, 1,
-0.6173589, -1.273442, -0.6795123, 1, 1, 1, 1, 1,
-0.6163914, -0.6747562, -1.830198, 1, 1, 1, 1, 1,
-0.6116828, 0.5685395, -0.7270622, 1, 1, 1, 1, 1,
-0.6091886, 0.4797185, -1.218944, 1, 1, 1, 1, 1,
-0.6065825, 0.7495175, -0.6965767, 1, 1, 1, 1, 1,
-0.6060547, 2.265745, -0.6339541, 1, 1, 1, 1, 1,
-0.6058142, 0.2379386, -1.58082, 1, 1, 1, 1, 1,
-0.603507, -1.318377, -1.066088, 1, 1, 1, 1, 1,
-0.6016094, 0.6732079, -3.621885, 0, 0, 1, 1, 1,
-0.599732, 0.598947, -1.879628, 1, 0, 0, 1, 1,
-0.58941, 0.864071, 0.845275, 1, 0, 0, 1, 1,
-0.5883989, 0.6015196, -0.6563615, 1, 0, 0, 1, 1,
-0.5833141, 0.8780764, -0.7519725, 1, 0, 0, 1, 1,
-0.5806917, -0.2576481, -1.950907, 1, 0, 0, 1, 1,
-0.5737039, 0.545288, 1.625634, 0, 0, 0, 1, 1,
-0.5724839, -0.1025935, -0.9347364, 0, 0, 0, 1, 1,
-0.571694, -0.3479995, -2.975095, 0, 0, 0, 1, 1,
-0.5713554, -0.8517924, -1.78151, 0, 0, 0, 1, 1,
-0.5707862, -0.08269469, -3.15784, 0, 0, 0, 1, 1,
-0.5643283, -0.1297169, -1.953483, 0, 0, 0, 1, 1,
-0.5629001, 0.5056593, 0.1863821, 0, 0, 0, 1, 1,
-0.5605518, 0.2882747, -0.1924643, 1, 1, 1, 1, 1,
-0.5598091, 0.4007106, 0.9483314, 1, 1, 1, 1, 1,
-0.5579875, 0.1968877, -0.08649723, 1, 1, 1, 1, 1,
-0.5530313, -1.456952, -3.434423, 1, 1, 1, 1, 1,
-0.5524077, -0.4170554, -3.434535, 1, 1, 1, 1, 1,
-0.5498974, 2.770639, 0.8028252, 1, 1, 1, 1, 1,
-0.5466337, 0.4158006, -0.1471947, 1, 1, 1, 1, 1,
-0.5449667, -0.1971906, -2.305296, 1, 1, 1, 1, 1,
-0.544864, -1.17977, -2.834981, 1, 1, 1, 1, 1,
-0.5407658, 0.01507108, -2.316644, 1, 1, 1, 1, 1,
-0.5402123, -0.8532361, -0.7961705, 1, 1, 1, 1, 1,
-0.5357171, 0.9876516, -0.7440206, 1, 1, 1, 1, 1,
-0.5235686, -0.3850177, -2.568735, 1, 1, 1, 1, 1,
-0.5218482, -2.690666, -1.915758, 1, 1, 1, 1, 1,
-0.5170198, -0.2919493, -1.195323, 1, 1, 1, 1, 1,
-0.5147241, -1.298975, -4.635722, 0, 0, 1, 1, 1,
-0.511141, -0.5658908, -2.654427, 1, 0, 0, 1, 1,
-0.5097621, -0.3743944, -2.093273, 1, 0, 0, 1, 1,
-0.5090007, 0.3417242, -1.846373, 1, 0, 0, 1, 1,
-0.5039459, 1.367988, 0.3625625, 1, 0, 0, 1, 1,
-0.5001873, -0.4913349, -3.476967, 1, 0, 0, 1, 1,
-0.4976898, 0.4032816, -0.8063406, 0, 0, 0, 1, 1,
-0.4968021, 1.412792, -0.02963663, 0, 0, 0, 1, 1,
-0.4957808, 0.9735875, 0.4160756, 0, 0, 0, 1, 1,
-0.4910908, 0.7156726, -0.5531026, 0, 0, 0, 1, 1,
-0.4850761, -2.382076, -2.690951, 0, 0, 0, 1, 1,
-0.4828386, -0.5601119, -1.611186, 0, 0, 0, 1, 1,
-0.4806866, -0.04839414, -1.237229, 0, 0, 0, 1, 1,
-0.4771704, 0.1738283, -1.476658, 1, 1, 1, 1, 1,
-0.4761437, -0.6650068, -2.97854, 1, 1, 1, 1, 1,
-0.4740202, -1.293227, -4.299006, 1, 1, 1, 1, 1,
-0.4700901, -0.605709, -2.050706, 1, 1, 1, 1, 1,
-0.4698748, 0.06922587, -2.20362, 1, 1, 1, 1, 1,
-0.4689904, 1.523109, -1.602451, 1, 1, 1, 1, 1,
-0.4637263, 1.483233, -1.677514, 1, 1, 1, 1, 1,
-0.4594054, -0.9172528, -4.423762, 1, 1, 1, 1, 1,
-0.4579123, 0.2406574, -1.746682, 1, 1, 1, 1, 1,
-0.4564325, 0.5678114, -1.210585, 1, 1, 1, 1, 1,
-0.4532935, 1.579238, -0.07177614, 1, 1, 1, 1, 1,
-0.4389509, 0.2581399, -1.144422, 1, 1, 1, 1, 1,
-0.436445, 1.367859, -0.09848142, 1, 1, 1, 1, 1,
-0.4360326, -0.6237013, -1.288959, 1, 1, 1, 1, 1,
-0.4349925, -1.47991, -2.901322, 1, 1, 1, 1, 1,
-0.4338226, -0.9575433, -2.25459, 0, 0, 1, 1, 1,
-0.4317521, -0.6381612, -1.740028, 1, 0, 0, 1, 1,
-0.4302919, 0.3670294, -0.9626069, 1, 0, 0, 1, 1,
-0.427088, -0.3581283, -1.8058, 1, 0, 0, 1, 1,
-0.424869, 1.990144, 1.052356, 1, 0, 0, 1, 1,
-0.4236449, -1.911072, -3.64229, 1, 0, 0, 1, 1,
-0.4231473, 0.9831897, -0.5490606, 0, 0, 0, 1, 1,
-0.4220379, -0.1839346, -0.6554059, 0, 0, 0, 1, 1,
-0.4209263, 0.4632253, 2.765707, 0, 0, 0, 1, 1,
-0.4112967, -0.3910778, -2.263948, 0, 0, 0, 1, 1,
-0.4066144, -0.1387982, -1.586928, 0, 0, 0, 1, 1,
-0.4051263, 0.6784057, 0.08500563, 0, 0, 0, 1, 1,
-0.4019412, -0.8756941, -3.463382, 0, 0, 0, 1, 1,
-0.4003389, 0.9598439, -0.0599222, 1, 1, 1, 1, 1,
-0.3884813, 0.2238163, -1.296246, 1, 1, 1, 1, 1,
-0.3882944, 1.096294, -0.1720183, 1, 1, 1, 1, 1,
-0.3856513, 0.8517455, 0.344083, 1, 1, 1, 1, 1,
-0.3832647, -0.7455464, -2.223801, 1, 1, 1, 1, 1,
-0.3745979, -1.377356, -4.576165, 1, 1, 1, 1, 1,
-0.3722917, 0.9601974, -1.354486, 1, 1, 1, 1, 1,
-0.3622146, 0.6646222, -3.133581, 1, 1, 1, 1, 1,
-0.3556989, 0.5464571, 0.2608487, 1, 1, 1, 1, 1,
-0.3554037, -0.3764231, -2.712152, 1, 1, 1, 1, 1,
-0.3494827, 2.430218, 1.364213, 1, 1, 1, 1, 1,
-0.3470324, 1.724568, 0.03038568, 1, 1, 1, 1, 1,
-0.3449128, -1.370826, -2.979699, 1, 1, 1, 1, 1,
-0.3439837, 0.5434705, -1.129154, 1, 1, 1, 1, 1,
-0.342235, -2.871531, -2.756731, 1, 1, 1, 1, 1,
-0.3409193, -0.2816973, -3.786543, 0, 0, 1, 1, 1,
-0.3358409, 0.8888456, -0.9671286, 1, 0, 0, 1, 1,
-0.3328755, -0.1010593, -0.7629595, 1, 0, 0, 1, 1,
-0.3324603, -1.200375, -0.5345698, 1, 0, 0, 1, 1,
-0.328676, 1.64246, -0.9390988, 1, 0, 0, 1, 1,
-0.3282029, 1.64229, 0.3247353, 1, 0, 0, 1, 1,
-0.3276833, -0.3343172, -0.7140914, 0, 0, 0, 1, 1,
-0.32756, -0.1320763, -1.781301, 0, 0, 0, 1, 1,
-0.3241455, 0.3619656, -1.548187, 0, 0, 0, 1, 1,
-0.3208603, 1.079831, -1.406057, 0, 0, 0, 1, 1,
-0.3199835, 0.8905855, 1.117216, 0, 0, 0, 1, 1,
-0.317174, 0.6101023, -0.7778314, 0, 0, 0, 1, 1,
-0.3138618, 1.515369, 0.1934899, 0, 0, 0, 1, 1,
-0.3125779, 1.347252, 0.6965805, 1, 1, 1, 1, 1,
-0.3078357, -0.05673769, 0.157689, 1, 1, 1, 1, 1,
-0.3055218, -0.885084, -3.661923, 1, 1, 1, 1, 1,
-0.3053488, -1.251645, -4.966755, 1, 1, 1, 1, 1,
-0.305025, -1.175362, -0.8503289, 1, 1, 1, 1, 1,
-0.3007545, 0.6105301, -2.0713, 1, 1, 1, 1, 1,
-0.2987485, -2.125709, -3.252142, 1, 1, 1, 1, 1,
-0.2954907, -0.4685708, -2.629637, 1, 1, 1, 1, 1,
-0.2948043, 0.01323413, -2.587352, 1, 1, 1, 1, 1,
-0.2933295, -0.5119319, -2.799045, 1, 1, 1, 1, 1,
-0.2922279, -1.477776, -2.7135, 1, 1, 1, 1, 1,
-0.2883149, 1.462728, -0.006943224, 1, 1, 1, 1, 1,
-0.2867985, 0.07772949, -2.081219, 1, 1, 1, 1, 1,
-0.2799144, 1.412015, 0.8232863, 1, 1, 1, 1, 1,
-0.2757816, -0.04386675, -2.922945, 1, 1, 1, 1, 1,
-0.2757636, 1.404182, -0.9511048, 0, 0, 1, 1, 1,
-0.2750193, 0.1467017, 0.0261187, 1, 0, 0, 1, 1,
-0.2744058, 0.6710331, 1.012403, 1, 0, 0, 1, 1,
-0.2670593, 0.1818849, -1.639394, 1, 0, 0, 1, 1,
-0.2652081, 1.133439, 0.7398706, 1, 0, 0, 1, 1,
-0.2612138, 0.2235006, 0.5112219, 1, 0, 0, 1, 1,
-0.2604538, -1.263534, -3.578411, 0, 0, 0, 1, 1,
-0.2520907, -0.3804851, -1.855263, 0, 0, 0, 1, 1,
-0.2445624, 1.424476, -0.7774751, 0, 0, 0, 1, 1,
-0.2425038, 0.5029371, -2.175029, 0, 0, 0, 1, 1,
-0.2403251, -1.231499, -4.410923, 0, 0, 0, 1, 1,
-0.2372681, 0.1509951, 0.07743274, 0, 0, 0, 1, 1,
-0.2353546, 2.412241, 0.3545868, 0, 0, 0, 1, 1,
-0.2340233, -0.2569798, -2.915942, 1, 1, 1, 1, 1,
-0.2266066, 0.06587631, -0.8017298, 1, 1, 1, 1, 1,
-0.2183217, 0.4810937, -0.2171776, 1, 1, 1, 1, 1,
-0.2182962, 0.1730906, -1.059185, 1, 1, 1, 1, 1,
-0.2180328, 1.623827, -2.763087, 1, 1, 1, 1, 1,
-0.2168562, -1.007523, -3.311049, 1, 1, 1, 1, 1,
-0.2136687, 0.7289313, 0.03793683, 1, 1, 1, 1, 1,
-0.2102912, 0.8605618, -0.2255838, 1, 1, 1, 1, 1,
-0.2063286, 0.1190216, -3.912904, 1, 1, 1, 1, 1,
-0.2049522, 0.2665051, -0.1389553, 1, 1, 1, 1, 1,
-0.2034185, -1.863155, -2.437716, 1, 1, 1, 1, 1,
-0.2033285, -0.8657675, -3.282973, 1, 1, 1, 1, 1,
-0.1968706, 0.8005073, -0.9584489, 1, 1, 1, 1, 1,
-0.1937046, -2.809164, -3.506661, 1, 1, 1, 1, 1,
-0.1884775, 0.4762921, 0.5829075, 1, 1, 1, 1, 1,
-0.1867318, 0.2666562, -0.5787215, 0, 0, 1, 1, 1,
-0.1831639, -1.473074, -3.431875, 1, 0, 0, 1, 1,
-0.1822082, 0.1142793, -1.57374, 1, 0, 0, 1, 1,
-0.1757158, 0.6567367, 0.8401167, 1, 0, 0, 1, 1,
-0.16908, 1.731655, 0.4387152, 1, 0, 0, 1, 1,
-0.1689802, 0.2335554, -0.902622, 1, 0, 0, 1, 1,
-0.1649185, -0.6011346, -3.607411, 0, 0, 0, 1, 1,
-0.1590235, -0.1528185, -3.531902, 0, 0, 0, 1, 1,
-0.1575425, -1.586688, -1.823874, 0, 0, 0, 1, 1,
-0.1555372, -0.8965361, -0.9316576, 0, 0, 0, 1, 1,
-0.1545632, 0.8312213, 0.1456764, 0, 0, 0, 1, 1,
-0.1526264, -0.5230743, -2.820657, 0, 0, 0, 1, 1,
-0.15071, -1.021423, -5.077476, 0, 0, 0, 1, 1,
-0.1500053, -0.3481063, -3.673679, 1, 1, 1, 1, 1,
-0.1464782, -0.4515093, -3.89287, 1, 1, 1, 1, 1,
-0.1411329, -0.7751435, -3.046276, 1, 1, 1, 1, 1,
-0.138318, -0.2359525, -2.368286, 1, 1, 1, 1, 1,
-0.1382701, 0.5292517, -1.216275, 1, 1, 1, 1, 1,
-0.1380887, 0.02946702, 0.1915387, 1, 1, 1, 1, 1,
-0.1328112, -0.5936452, -1.428555, 1, 1, 1, 1, 1,
-0.1301099, -0.6604827, -2.850232, 1, 1, 1, 1, 1,
-0.127138, 1.371728, 0.6476428, 1, 1, 1, 1, 1,
-0.1260087, -2.124283, -2.321025, 1, 1, 1, 1, 1,
-0.1236715, 0.5532281, -0.3077284, 1, 1, 1, 1, 1,
-0.1226074, 0.5580237, 1.489661, 1, 1, 1, 1, 1,
-0.1171541, 1.020324, -1.307975, 1, 1, 1, 1, 1,
-0.1165339, -2.064881, -4.192166, 1, 1, 1, 1, 1,
-0.1163371, -0.04959342, -1.510757, 1, 1, 1, 1, 1,
-0.112094, -0.4717512, -1.803128, 0, 0, 1, 1, 1,
-0.1006384, -0.4642174, -2.606283, 1, 0, 0, 1, 1,
-0.09932391, -1.900902, -2.409357, 1, 0, 0, 1, 1,
-0.09905888, -0.2540435, -1.488833, 1, 0, 0, 1, 1,
-0.09705429, -0.259276, -2.60223, 1, 0, 0, 1, 1,
-0.08969104, 1.024166, -0.6393636, 1, 0, 0, 1, 1,
-0.08833036, -1.189817, -3.749075, 0, 0, 0, 1, 1,
-0.08669914, 0.386934, -1.22013, 0, 0, 0, 1, 1,
-0.08653024, -1.088586, -2.651867, 0, 0, 0, 1, 1,
-0.08501231, 0.4770967, -1.92828, 0, 0, 0, 1, 1,
-0.08469966, 1.694964, -0.07328169, 0, 0, 0, 1, 1,
-0.08205131, -0.4308965, -3.978971, 0, 0, 0, 1, 1,
-0.08060978, -0.5452389, -1.962827, 0, 0, 0, 1, 1,
-0.07464115, 0.3124334, -0.128527, 1, 1, 1, 1, 1,
-0.07359994, -1.064679, -1.580847, 1, 1, 1, 1, 1,
-0.07257432, -0.6511149, -2.368203, 1, 1, 1, 1, 1,
-0.0713683, 0.8659956, -0.1890638, 1, 1, 1, 1, 1,
-0.07041818, 1.363543, 0.8735778, 1, 1, 1, 1, 1,
-0.07011654, -0.5675214, -1.657433, 1, 1, 1, 1, 1,
-0.06945486, 0.1709416, -3.555657, 1, 1, 1, 1, 1,
-0.06012459, -1.032034, -4.157229, 1, 1, 1, 1, 1,
-0.05677767, -0.5924902, -2.800453, 1, 1, 1, 1, 1,
-0.05303628, 2.025252, 1.434286, 1, 1, 1, 1, 1,
-0.04737864, -0.827311, -4.775899, 1, 1, 1, 1, 1,
-0.04725293, -0.7961822, -2.931544, 1, 1, 1, 1, 1,
-0.04314746, 1.608302, -0.4096832, 1, 1, 1, 1, 1,
-0.04215197, 0.7444112, -1.409031, 1, 1, 1, 1, 1,
-0.04104013, 0.9514943, 0.1125807, 1, 1, 1, 1, 1,
-0.03947044, -0.3977376, -4.582071, 0, 0, 1, 1, 1,
-0.03933265, 0.4812736, 1.406144, 1, 0, 0, 1, 1,
-0.03644297, -0.8117422, -2.750715, 1, 0, 0, 1, 1,
-0.0340945, 0.8165699, 1.089927, 1, 0, 0, 1, 1,
-0.0325487, 0.769694, 0.1415034, 1, 0, 0, 1, 1,
-0.03204605, 0.5903369, 0.02578535, 1, 0, 0, 1, 1,
-0.03005044, 0.9079933, -0.6805384, 0, 0, 0, 1, 1,
-0.02583245, 0.07655608, 1.163243, 0, 0, 0, 1, 1,
-0.01794455, 0.1833793, 1.006564, 0, 0, 0, 1, 1,
-0.01748825, 1.874963, 0.6028177, 0, 0, 0, 1, 1,
-0.01053323, 0.4168269, 0.7249871, 0, 0, 0, 1, 1,
-0.01033045, -0.7925807, -3.11966, 0, 0, 0, 1, 1,
-0.00881994, 1.681985, 0.7060664, 0, 0, 0, 1, 1,
-0.004747448, -1.803011, -4.298893, 1, 1, 1, 1, 1,
0.0009757578, -0.1349539, 3.534286, 1, 1, 1, 1, 1,
0.002088424, 0.4562746, 0.4449127, 1, 1, 1, 1, 1,
0.01348198, -1.20076, 5.192379, 1, 1, 1, 1, 1,
0.0139733, 0.6940309, 1.139426, 1, 1, 1, 1, 1,
0.01943126, -0.1304125, 1.677324, 1, 1, 1, 1, 1,
0.02145352, -0.1731692, 2.839424, 1, 1, 1, 1, 1,
0.0240779, -1.318513, 3.866592, 1, 1, 1, 1, 1,
0.02532205, -1.07604, 1.689128, 1, 1, 1, 1, 1,
0.02636029, -1.206288, 4.01796, 1, 1, 1, 1, 1,
0.02738399, 0.6149665, 0.118557, 1, 1, 1, 1, 1,
0.02759206, 0.02552272, 0.4584838, 1, 1, 1, 1, 1,
0.0379487, 0.5043194, -0.7562932, 1, 1, 1, 1, 1,
0.04610882, 0.5964888, 0.3742054, 1, 1, 1, 1, 1,
0.04836403, -0.3057142, 2.499376, 1, 1, 1, 1, 1,
0.0569735, 0.5268764, 1.189162, 0, 0, 1, 1, 1,
0.05932553, -0.5252732, 2.187113, 1, 0, 0, 1, 1,
0.05958984, 0.1066233, 0.7573386, 1, 0, 0, 1, 1,
0.05985992, 1.076983, 0.7681448, 1, 0, 0, 1, 1,
0.06686335, 0.779778, -1.564007, 1, 0, 0, 1, 1,
0.06711576, 0.2625338, -0.4198281, 1, 0, 0, 1, 1,
0.06815637, -0.7623051, 3.353576, 0, 0, 0, 1, 1,
0.06920923, -0.3506038, 3.801183, 0, 0, 0, 1, 1,
0.06975262, -0.6453353, 3.931076, 0, 0, 0, 1, 1,
0.07745145, 0.3589079, -1.908146, 0, 0, 0, 1, 1,
0.07753353, -0.9806469, 5.181269, 0, 0, 0, 1, 1,
0.07822423, 0.7911727, 0.2804282, 0, 0, 0, 1, 1,
0.0841072, -0.1628809, 2.395999, 0, 0, 0, 1, 1,
0.08434469, -1.535154, 3.250907, 1, 1, 1, 1, 1,
0.08443228, 0.8019529, -1.883752, 1, 1, 1, 1, 1,
0.08564661, -0.630513, 2.962146, 1, 1, 1, 1, 1,
0.08748236, 1.452081, 0.5388875, 1, 1, 1, 1, 1,
0.0875233, -1.7124, 2.932663, 1, 1, 1, 1, 1,
0.09368152, -0.1336947, 2.270095, 1, 1, 1, 1, 1,
0.09390659, -1.177497, 3.296372, 1, 1, 1, 1, 1,
0.09401032, 1.448033, 1.785882, 1, 1, 1, 1, 1,
0.09993628, 2.961557, 0.280684, 1, 1, 1, 1, 1,
0.1011669, 0.01582829, 0.4695807, 1, 1, 1, 1, 1,
0.1089948, -1.429451, 5.247451, 1, 1, 1, 1, 1,
0.1114192, -1.312248, 0.9358554, 1, 1, 1, 1, 1,
0.1145451, 0.9170408, -1.20299, 1, 1, 1, 1, 1,
0.1204677, 0.1777931, -0.3642885, 1, 1, 1, 1, 1,
0.1295605, 0.3529771, -0.2339778, 1, 1, 1, 1, 1,
0.1297245, -0.1623273, 3.090017, 0, 0, 1, 1, 1,
0.1314883, -1.579052, 3.665776, 1, 0, 0, 1, 1,
0.1328492, -0.7728416, 3.72759, 1, 0, 0, 1, 1,
0.1349008, -1.129904, 4.146699, 1, 0, 0, 1, 1,
0.1392787, -0.01001948, 1.439331, 1, 0, 0, 1, 1,
0.1405122, 0.8438069, 2.139652, 1, 0, 0, 1, 1,
0.1429888, 0.3672707, -0.1156279, 0, 0, 0, 1, 1,
0.1445469, -0.817373, 1.445402, 0, 0, 0, 1, 1,
0.1469173, -1.404027, 5.289316, 0, 0, 0, 1, 1,
0.1490315, 1.09943, 0.08133949, 0, 0, 0, 1, 1,
0.1511851, 0.7890003, -0.09644982, 0, 0, 0, 1, 1,
0.1511872, -1.780475, 3.212366, 0, 0, 0, 1, 1,
0.1528828, 0.5139082, 0.7499282, 0, 0, 0, 1, 1,
0.1565099, 1.485142, 0.2875073, 1, 1, 1, 1, 1,
0.1573992, -0.3741152, 1.368299, 1, 1, 1, 1, 1,
0.1618532, 1.381423, 0.4248951, 1, 1, 1, 1, 1,
0.1628076, 1.273286, 0.2927828, 1, 1, 1, 1, 1,
0.163702, 0.3210331, 0.3099468, 1, 1, 1, 1, 1,
0.1655193, 1.082414, 0.625228, 1, 1, 1, 1, 1,
0.1659551, 1.314157, 1.617648, 1, 1, 1, 1, 1,
0.1694451, 0.5905567, 0.1227086, 1, 1, 1, 1, 1,
0.1710314, -0.720096, 4.825234, 1, 1, 1, 1, 1,
0.1738193, -0.8543027, 2.420321, 1, 1, 1, 1, 1,
0.1744069, -0.6983158, 1.933443, 1, 1, 1, 1, 1,
0.1761139, 1.786027, 0.03775054, 1, 1, 1, 1, 1,
0.1777253, -2.038914, 3.754829, 1, 1, 1, 1, 1,
0.1779279, -1.066855, 3.732806, 1, 1, 1, 1, 1,
0.178108, -0.5503977, 2.648753, 1, 1, 1, 1, 1,
0.1786054, 0.2405468, 0.4413147, 0, 0, 1, 1, 1,
0.1790844, -1.024739, 2.804665, 1, 0, 0, 1, 1,
0.1800264, -0.5967314, 3.247247, 1, 0, 0, 1, 1,
0.1804321, 0.2475159, 0.867101, 1, 0, 0, 1, 1,
0.1827072, -0.3473203, 1.795892, 1, 0, 0, 1, 1,
0.1832576, 0.4547489, 1.166689, 1, 0, 0, 1, 1,
0.1838581, -0.8121405, 2.860288, 0, 0, 0, 1, 1,
0.1841492, -1.146273, 3.438808, 0, 0, 0, 1, 1,
0.185543, 1.926871, 0.4866742, 0, 0, 0, 1, 1,
0.1864007, -0.8918468, 3.390153, 0, 0, 0, 1, 1,
0.193835, 0.8325094, -2.133453, 0, 0, 0, 1, 1,
0.1973563, 1.075096, 0.4904748, 0, 0, 0, 1, 1,
0.2020499, 0.3245799, 0.1117267, 0, 0, 0, 1, 1,
0.2021228, -0.2078457, 2.916432, 1, 1, 1, 1, 1,
0.2062542, -1.660225, 2.942318, 1, 1, 1, 1, 1,
0.210351, -0.6356781, 3.064544, 1, 1, 1, 1, 1,
0.2136262, 1.489964, 1.176061, 1, 1, 1, 1, 1,
0.2177303, -1.26178, 2.797712, 1, 1, 1, 1, 1,
0.2190742, -0.01516204, 1.641752, 1, 1, 1, 1, 1,
0.2199594, -0.6438677, 3.615946, 1, 1, 1, 1, 1,
0.2215475, 0.9024533, 0.9988145, 1, 1, 1, 1, 1,
0.2222026, 0.2076317, 1.174406, 1, 1, 1, 1, 1,
0.2223704, 0.303137, 0.7927107, 1, 1, 1, 1, 1,
0.2265133, -0.8647277, 2.270636, 1, 1, 1, 1, 1,
0.2379785, -0.9238585, 3.091393, 1, 1, 1, 1, 1,
0.2456468, -0.5304267, 4.342759, 1, 1, 1, 1, 1,
0.247378, -0.944324, 3.976527, 1, 1, 1, 1, 1,
0.2499301, 1.0603, 0.02692823, 1, 1, 1, 1, 1,
0.250515, -1.347839, 2.426641, 0, 0, 1, 1, 1,
0.2533388, -1.007369, 2.998957, 1, 0, 0, 1, 1,
0.2543916, 0.831807, 2.008761, 1, 0, 0, 1, 1,
0.2549575, -0.581839, 3.755149, 1, 0, 0, 1, 1,
0.2571797, 0.1668183, 1.819295, 1, 0, 0, 1, 1,
0.2618906, -0.4851319, 2.199855, 1, 0, 0, 1, 1,
0.264392, -0.1171093, 2.267758, 0, 0, 0, 1, 1,
0.2645973, -1.264434, 4.413919, 0, 0, 0, 1, 1,
0.2654823, -1.283551, 2.767363, 0, 0, 0, 1, 1,
0.2666342, -0.1980184, 1.024343, 0, 0, 0, 1, 1,
0.2701551, -0.05757584, 0.5617177, 0, 0, 0, 1, 1,
0.2745728, 0.7416701, 1.039182, 0, 0, 0, 1, 1,
0.2746238, -0.1688014, 1.852504, 0, 0, 0, 1, 1,
0.2788455, 1.267785, 0.01484173, 1, 1, 1, 1, 1,
0.2811761, -1.294422, 1.975832, 1, 1, 1, 1, 1,
0.2830503, -1.148402, 2.193438, 1, 1, 1, 1, 1,
0.2839015, -0.1495793, 1.401245, 1, 1, 1, 1, 1,
0.2840744, -0.02140546, 2.132558, 1, 1, 1, 1, 1,
0.2891161, 0.8322955, 0.9381391, 1, 1, 1, 1, 1,
0.2900918, 0.1435124, -0.7407271, 1, 1, 1, 1, 1,
0.2922902, -0.51566, 3.716086, 1, 1, 1, 1, 1,
0.2922933, -0.7139071, 2.28657, 1, 1, 1, 1, 1,
0.2940817, 0.2689849, -0.6953992, 1, 1, 1, 1, 1,
0.2953476, -0.499098, 2.860643, 1, 1, 1, 1, 1,
0.2980115, -0.7887387, 3.796864, 1, 1, 1, 1, 1,
0.2985521, 1.373046, -0.3594802, 1, 1, 1, 1, 1,
0.3029885, -0.3665012, 1.990129, 1, 1, 1, 1, 1,
0.3042082, -0.8229626, 3.294912, 1, 1, 1, 1, 1,
0.3061262, -1.594918, 3.602999, 0, 0, 1, 1, 1,
0.3088738, -0.8373247, 1.021562, 1, 0, 0, 1, 1,
0.3117365, 0.5362711, -0.4814069, 1, 0, 0, 1, 1,
0.3158827, 0.5811331, 0.07935985, 1, 0, 0, 1, 1,
0.3183895, -0.4918193, 1.560533, 1, 0, 0, 1, 1,
0.3189752, 1.205603, 1.31722, 1, 0, 0, 1, 1,
0.3273498, -0.1755445, 0.7659196, 0, 0, 0, 1, 1,
0.3325546, 1.632037, -0.5518483, 0, 0, 0, 1, 1,
0.3334463, 1.061577, 0.8991414, 0, 0, 0, 1, 1,
0.3429165, 0.1410289, 3.249006, 0, 0, 0, 1, 1,
0.3454907, 0.8419797, -2.270813, 0, 0, 0, 1, 1,
0.3463781, -0.5308645, 3.205183, 0, 0, 0, 1, 1,
0.3481987, -0.08063194, 0.6308523, 0, 0, 0, 1, 1,
0.3570636, -1.546117, 3.030527, 1, 1, 1, 1, 1,
0.3585911, 1.233993, -1.058632, 1, 1, 1, 1, 1,
0.3592789, 0.2050537, 3.003057, 1, 1, 1, 1, 1,
0.3635052, -0.3897717, 3.300155, 1, 1, 1, 1, 1,
0.3684449, 0.04531471, 3.099954, 1, 1, 1, 1, 1,
0.3690739, 0.2773401, 1.877663, 1, 1, 1, 1, 1,
0.3693941, -1.595709, 2.269877, 1, 1, 1, 1, 1,
0.3704357, -1.368859, 2.471956, 1, 1, 1, 1, 1,
0.3710762, -0.1994704, -0.1276836, 1, 1, 1, 1, 1,
0.3713232, 0.7264678, 0.4681795, 1, 1, 1, 1, 1,
0.3726515, 1.703523, 1.339347, 1, 1, 1, 1, 1,
0.3728963, -2.272451, 3.0685, 1, 1, 1, 1, 1,
0.3731463, -0.213642, 1.331185, 1, 1, 1, 1, 1,
0.3742345, 1.211572, 0.1921858, 1, 1, 1, 1, 1,
0.3769674, -1.18107, 3.186648, 1, 1, 1, 1, 1,
0.3773274, -0.9950206, 1.186526, 0, 0, 1, 1, 1,
0.3788018, -1.014946, 4.810244, 1, 0, 0, 1, 1,
0.38092, 1.054445, -0.2799383, 1, 0, 0, 1, 1,
0.3814866, -0.5777839, 2.671418, 1, 0, 0, 1, 1,
0.3822816, -0.6743858, 4.521913, 1, 0, 0, 1, 1,
0.3846293, 0.5883067, -0.6272135, 1, 0, 0, 1, 1,
0.3848215, -0.8028529, 2.044879, 0, 0, 0, 1, 1,
0.3922662, 0.7255942, 0.8771113, 0, 0, 0, 1, 1,
0.3949509, -1.13838, 1.235295, 0, 0, 0, 1, 1,
0.3963929, 0.2299039, 0.4838795, 0, 0, 0, 1, 1,
0.3972793, 0.4056482, 0.8976539, 0, 0, 0, 1, 1,
0.3997966, -0.7011576, 2.881802, 0, 0, 0, 1, 1,
0.4005634, -0.2330319, 1.787433, 0, 0, 0, 1, 1,
0.4088823, 0.4609688, 2.17522, 1, 1, 1, 1, 1,
0.4096515, -0.1547457, 2.805143, 1, 1, 1, 1, 1,
0.4139768, 0.9309778, -0.9723957, 1, 1, 1, 1, 1,
0.4152287, 0.5694186, -0.08235701, 1, 1, 1, 1, 1,
0.415954, -1.246472, 4.169426, 1, 1, 1, 1, 1,
0.4169718, -0.4558685, 3.294423, 1, 1, 1, 1, 1,
0.4188255, 0.4358364, 2.147942, 1, 1, 1, 1, 1,
0.4214655, -0.5736536, 3.808428, 1, 1, 1, 1, 1,
0.4350945, -0.7429225, 3.933314, 1, 1, 1, 1, 1,
0.4361473, 0.9676303, 0.447671, 1, 1, 1, 1, 1,
0.4369285, -0.1581555, -0.1893621, 1, 1, 1, 1, 1,
0.4369641, 0.2549984, 0.7627447, 1, 1, 1, 1, 1,
0.4427801, 1.461059, 0.5582424, 1, 1, 1, 1, 1,
0.4463597, 1.263796, 1.317234, 1, 1, 1, 1, 1,
0.4552404, 0.7410643, 0.1549647, 1, 1, 1, 1, 1,
0.4578454, 0.4028227, 1.511012, 0, 0, 1, 1, 1,
0.4582836, -1.301217, 4.573074, 1, 0, 0, 1, 1,
0.4589806, -0.01152909, 1.939103, 1, 0, 0, 1, 1,
0.4600624, -1.946629, 1.736009, 1, 0, 0, 1, 1,
0.4664976, 1.666294, 0.2941264, 1, 0, 0, 1, 1,
0.4688941, 2.04218, -0.5491045, 1, 0, 0, 1, 1,
0.4709564, -1.699869, 3.779459, 0, 0, 0, 1, 1,
0.4750305, -0.3735383, 3.277591, 0, 0, 0, 1, 1,
0.4873354, 0.430802, 0.486452, 0, 0, 0, 1, 1,
0.4879057, -0.03555173, 3.143413, 0, 0, 0, 1, 1,
0.4882009, -0.5639408, 3.560611, 0, 0, 0, 1, 1,
0.492633, -0.7980192, 2.333541, 0, 0, 0, 1, 1,
0.4990955, 0.3459119, 1.52678, 0, 0, 0, 1, 1,
0.4991253, 0.3442554, 0.8348545, 1, 1, 1, 1, 1,
0.5040426, -0.2656758, 2.043173, 1, 1, 1, 1, 1,
0.5092201, 0.04543448, 1.65952, 1, 1, 1, 1, 1,
0.5094479, 1.495256, 0.9499556, 1, 1, 1, 1, 1,
0.5121806, 0.006439988, 1.634487, 1, 1, 1, 1, 1,
0.5124648, -0.6830802, 2.124944, 1, 1, 1, 1, 1,
0.5151646, 1.125599, 0.5032122, 1, 1, 1, 1, 1,
0.5166875, 1.416644, 0.3940707, 1, 1, 1, 1, 1,
0.5211723, -0.0759579, 0.4976923, 1, 1, 1, 1, 1,
0.5234725, 0.2810749, -0.5603254, 1, 1, 1, 1, 1,
0.5286614, 0.9715137, 0.2237027, 1, 1, 1, 1, 1,
0.5289505, 0.5050809, 1.140031, 1, 1, 1, 1, 1,
0.5342022, -0.09033631, 4.156853, 1, 1, 1, 1, 1,
0.5344424, -0.6291771, 3.180696, 1, 1, 1, 1, 1,
0.5384141, -1.228835, 1.669008, 1, 1, 1, 1, 1,
0.5386536, 0.5485799, 1.275024, 0, 0, 1, 1, 1,
0.5409805, -1.177609, 1.913637, 1, 0, 0, 1, 1,
0.5432659, -0.9779478, 1.527314, 1, 0, 0, 1, 1,
0.5453466, 0.06652469, 1.223526, 1, 0, 0, 1, 1,
0.5460384, -1.313498, 1.531632, 1, 0, 0, 1, 1,
0.548772, -0.3768455, 3.310693, 1, 0, 0, 1, 1,
0.5508317, 1.175325, 1.517763, 0, 0, 0, 1, 1,
0.554096, -0.2886349, 2.656977, 0, 0, 0, 1, 1,
0.5576667, -0.985462, 2.519405, 0, 0, 0, 1, 1,
0.5594396, 0.3939224, -0.4395845, 0, 0, 0, 1, 1,
0.5651803, -0.6508898, 2.794264, 0, 0, 0, 1, 1,
0.5654112, -0.464493, 2.083596, 0, 0, 0, 1, 1,
0.5654953, -0.04296394, 1.784894, 0, 0, 0, 1, 1,
0.5657659, 0.3864231, 0.5099903, 1, 1, 1, 1, 1,
0.5690482, -0.3508831, 2.758628, 1, 1, 1, 1, 1,
0.5835063, 0.3018419, 1.621937, 1, 1, 1, 1, 1,
0.5869097, 1.098611, 0.1473597, 1, 1, 1, 1, 1,
0.5872494, 1.607487, 0.2542411, 1, 1, 1, 1, 1,
0.5876684, -1.414213, 2.957798, 1, 1, 1, 1, 1,
0.5886507, 0.7253859, 0.5602737, 1, 1, 1, 1, 1,
0.5901561, 0.3501957, 0.5663052, 1, 1, 1, 1, 1,
0.5917909, 0.4601822, 1.4962, 1, 1, 1, 1, 1,
0.5921083, 0.3265809, 0.7758017, 1, 1, 1, 1, 1,
0.5955359, 0.892354, 0.08912055, 1, 1, 1, 1, 1,
0.5967379, 1.885545, 0.002979236, 1, 1, 1, 1, 1,
0.5994284, -0.822764, 2.703736, 1, 1, 1, 1, 1,
0.599792, -0.2923729, 0.9792501, 1, 1, 1, 1, 1,
0.6007574, -0.1415077, 3.022897, 1, 1, 1, 1, 1,
0.6008186, -0.4832862, 0.7863463, 0, 0, 1, 1, 1,
0.6011713, 1.449195, -1.11473, 1, 0, 0, 1, 1,
0.6046385, 0.4134891, 2.388516, 1, 0, 0, 1, 1,
0.6118025, -0.7231011, 0.8533283, 1, 0, 0, 1, 1,
0.6142204, -0.3913922, 0.8533612, 1, 0, 0, 1, 1,
0.6158598, -2.258607, 2.38481, 1, 0, 0, 1, 1,
0.6167247, 0.05411407, 1.207871, 0, 0, 0, 1, 1,
0.6190091, 0.9845024, -0.542119, 0, 0, 0, 1, 1,
0.6193072, -0.6571222, -0.603807, 0, 0, 0, 1, 1,
0.6214853, -0.4310766, 1.241786, 0, 0, 0, 1, 1,
0.6226259, -1.210002, 1.53373, 0, 0, 0, 1, 1,
0.6232865, -0.04579974, 1.41171, 0, 0, 0, 1, 1,
0.6238271, -1.156012, 3.262667, 0, 0, 0, 1, 1,
0.6264931, -0.606241, 2.274577, 1, 1, 1, 1, 1,
0.6311283, -0.03972097, 2.565413, 1, 1, 1, 1, 1,
0.6323509, -0.4517789, 1.291799, 1, 1, 1, 1, 1,
0.6329353, 1.077818, 1.428847, 1, 1, 1, 1, 1,
0.6358876, 0.7261209, -0.2164013, 1, 1, 1, 1, 1,
0.6373658, 0.7580078, -0.1375996, 1, 1, 1, 1, 1,
0.6414728, 2.2193, 2.32927, 1, 1, 1, 1, 1,
0.650813, 0.9024354, 0.7024446, 1, 1, 1, 1, 1,
0.6517766, -0.4285648, 1.754912, 1, 1, 1, 1, 1,
0.652244, -1.27225, 2.333288, 1, 1, 1, 1, 1,
0.6563284, 2.494746, 0.8660457, 1, 1, 1, 1, 1,
0.6663896, 0.5507856, 0.4948483, 1, 1, 1, 1, 1,
0.6678355, -0.9250878, 2.448164, 1, 1, 1, 1, 1,
0.6686629, -0.5848833, 2.786022, 1, 1, 1, 1, 1,
0.6699781, -0.5325139, 2.176115, 1, 1, 1, 1, 1,
0.6718874, 0.4255954, 0.6761683, 0, 0, 1, 1, 1,
0.6732066, -0.6966112, 1.509071, 1, 0, 0, 1, 1,
0.6810148, -0.2535135, 2.590835, 1, 0, 0, 1, 1,
0.6865652, 0.7741649, -0.1351621, 1, 0, 0, 1, 1,
0.7025708, -0.111589, 2.386786, 1, 0, 0, 1, 1,
0.7078555, -0.3397901, 1.673562, 1, 0, 0, 1, 1,
0.708527, 1.451062, -0.363562, 0, 0, 0, 1, 1,
0.7128206, -0.3407241, 0.844829, 0, 0, 0, 1, 1,
0.7157368, 0.6222156, 0.2464339, 0, 0, 0, 1, 1,
0.7178501, 1.122513, 0.403164, 0, 0, 0, 1, 1,
0.7269421, 1.474109, 0.6086935, 0, 0, 0, 1, 1,
0.7308725, -1.334439, 2.952326, 0, 0, 0, 1, 1,
0.7327649, -0.2960244, 2.18743, 0, 0, 0, 1, 1,
0.7330204, -1.28297, 3.153689, 1, 1, 1, 1, 1,
0.7442068, 1.259255, 0.3384925, 1, 1, 1, 1, 1,
0.7463288, 2.065545, 1.848232, 1, 1, 1, 1, 1,
0.7474051, 0.1400881, 1.007698, 1, 1, 1, 1, 1,
0.7500361, 1.520596, 1.22311, 1, 1, 1, 1, 1,
0.7509989, -1.347411, 3.785353, 1, 1, 1, 1, 1,
0.7544104, 0.7928798, 1.58568, 1, 1, 1, 1, 1,
0.770041, -0.784444, 0.1638926, 1, 1, 1, 1, 1,
0.7723321, -1.570205, 3.693548, 1, 1, 1, 1, 1,
0.7762539, 0.1264322, 3.060791, 1, 1, 1, 1, 1,
0.7777054, -1.254087, 2.69986, 1, 1, 1, 1, 1,
0.778403, 0.7126805, 2.86454, 1, 1, 1, 1, 1,
0.7828764, 0.5725639, -1.174001, 1, 1, 1, 1, 1,
0.783408, 1.441012, -0.0944094, 1, 1, 1, 1, 1,
0.7865224, -0.4126627, 0.9991886, 1, 1, 1, 1, 1,
0.7867731, 1.569446, 2.171843, 0, 0, 1, 1, 1,
0.7869166, -1.086207, 1.609218, 1, 0, 0, 1, 1,
0.7880942, 0.2732916, 0.8752623, 1, 0, 0, 1, 1,
0.7912307, 0.8612495, -0.04439512, 1, 0, 0, 1, 1,
0.7913136, 0.9842521, -0.2122208, 1, 0, 0, 1, 1,
0.7985238, 0.3250138, 2.253144, 1, 0, 0, 1, 1,
0.8015149, 0.1643645, 0.1722759, 0, 0, 0, 1, 1,
0.8028274, -1.919413, 4.282114, 0, 0, 0, 1, 1,
0.803429, -0.03813468, 0.882157, 0, 0, 0, 1, 1,
0.8065075, 1.425381, -0.1420486, 0, 0, 0, 1, 1,
0.8098397, -0.4012942, 1.564765, 0, 0, 0, 1, 1,
0.8110598, 0.412223, 1.789448, 0, 0, 0, 1, 1,
0.8175268, 0.0518917, 1.300156, 0, 0, 0, 1, 1,
0.8183874, 0.5573302, 1.184983, 1, 1, 1, 1, 1,
0.8200718, 0.344596, 0.5542509, 1, 1, 1, 1, 1,
0.8228459, -0.4875888, 4.161755, 1, 1, 1, 1, 1,
0.8272005, -0.470607, 0.8978267, 1, 1, 1, 1, 1,
0.8312482, 1.318622, 0.3538282, 1, 1, 1, 1, 1,
0.8345276, -1.553867, 1.105829, 1, 1, 1, 1, 1,
0.8364289, -1.352539, 2.944538, 1, 1, 1, 1, 1,
0.8369284, -0.6511711, 2.03097, 1, 1, 1, 1, 1,
0.8396574, -1.265147, 2.561054, 1, 1, 1, 1, 1,
0.8654077, -0.02533027, 1.180208, 1, 1, 1, 1, 1,
0.8671196, 0.4915974, 2.189665, 1, 1, 1, 1, 1,
0.8672439, 0.3598598, 1.459372, 1, 1, 1, 1, 1,
0.8729461, 0.5970085, -1.333341, 1, 1, 1, 1, 1,
0.8749445, 1.602116, 0.7333767, 1, 1, 1, 1, 1,
0.8769693, 1.128047, 0.2024868, 1, 1, 1, 1, 1,
0.8821338, 1.556401, -1.061113, 0, 0, 1, 1, 1,
0.8881184, 0.02383796, 2.374377, 1, 0, 0, 1, 1,
0.8887239, 0.4224654, 1.404479, 1, 0, 0, 1, 1,
0.8888923, -1.837984, 2.05298, 1, 0, 0, 1, 1,
0.8935202, 0.3251726, 0.3715508, 1, 0, 0, 1, 1,
0.8955562, 0.1069884, 1.153597, 1, 0, 0, 1, 1,
0.8955933, -0.3389342, 1.297112, 0, 0, 0, 1, 1,
0.8994952, 3.291736, -1.602164, 0, 0, 0, 1, 1,
0.9027616, -0.07929384, 0.8079958, 0, 0, 0, 1, 1,
0.9065828, 0.04446663, 0.9780198, 0, 0, 0, 1, 1,
0.908799, -1.13317, 2.310657, 0, 0, 0, 1, 1,
0.9099473, 0.3778945, 1.647864, 0, 0, 0, 1, 1,
0.9117091, 1.731228, 0.2035541, 0, 0, 0, 1, 1,
0.9141737, 1.415663, 0.9387917, 1, 1, 1, 1, 1,
0.9196283, -0.4311035, 3.190355, 1, 1, 1, 1, 1,
0.9225811, -0.9626456, 2.857584, 1, 1, 1, 1, 1,
0.9327077, -1.552422, 1.38451, 1, 1, 1, 1, 1,
0.9386566, 0.8423571, 0.3824461, 1, 1, 1, 1, 1,
0.9421938, 1.733467, -0.596328, 1, 1, 1, 1, 1,
0.9479237, -0.1871364, 1.187594, 1, 1, 1, 1, 1,
0.9561482, -0.9412481, 2.898249, 1, 1, 1, 1, 1,
0.9566559, 1.011661, 1.411314, 1, 1, 1, 1, 1,
0.9618841, -0.4489265, 2.326624, 1, 1, 1, 1, 1,
0.9622247, 0.5260488, 3.546471, 1, 1, 1, 1, 1,
0.9695466, 0.4620829, 2.259521, 1, 1, 1, 1, 1,
0.9797437, -0.6448165, 1.929469, 1, 1, 1, 1, 1,
0.9803396, 0.7423714, 1.77831, 1, 1, 1, 1, 1,
0.9857849, 0.3300596, 2.159775, 1, 1, 1, 1, 1,
0.9951333, 0.9313321, -0.1000291, 0, 0, 1, 1, 1,
0.9955674, 1.32393, -0.8323506, 1, 0, 0, 1, 1,
0.9968275, 0.05766763, 3.8381, 1, 0, 0, 1, 1,
0.9989871, -0.7775325, 3.230706, 1, 0, 0, 1, 1,
0.9997868, -0.7502618, 1.37233, 1, 0, 0, 1, 1,
1.016545, -0.871506, 0.8687835, 1, 0, 0, 1, 1,
1.016945, -0.444552, -0.1642314, 0, 0, 0, 1, 1,
1.021764, 0.9121456, 1.698162, 0, 0, 0, 1, 1,
1.025359, 0.5798395, 2.238226, 0, 0, 0, 1, 1,
1.028483, 0.5007864, 0.1150293, 0, 0, 0, 1, 1,
1.035755, -1.007464, 1.740628, 0, 0, 0, 1, 1,
1.041676, 1.779943, -0.6629721, 0, 0, 0, 1, 1,
1.048951, -1.424219, 3.018804, 0, 0, 0, 1, 1,
1.051604, 1.781419, 0.3265609, 1, 1, 1, 1, 1,
1.052959, -0.01566689, 1.932296, 1, 1, 1, 1, 1,
1.055522, 1.219499, 2.748796, 1, 1, 1, 1, 1,
1.064989, 0.558089, 2.851435, 1, 1, 1, 1, 1,
1.074486, -1.727123, 2.394381, 1, 1, 1, 1, 1,
1.075441, -0.4250117, 1.586634, 1, 1, 1, 1, 1,
1.077485, 0.6587992, -1.456555, 1, 1, 1, 1, 1,
1.080919, -1.214012, 3.370982, 1, 1, 1, 1, 1,
1.084606, -0.7921565, 2.092951, 1, 1, 1, 1, 1,
1.085621, 1.022962, -0.3002977, 1, 1, 1, 1, 1,
1.095038, 2.123924, 0.9415931, 1, 1, 1, 1, 1,
1.098812, -0.9125599, 4.069109, 1, 1, 1, 1, 1,
1.098869, -0.3104883, 2.309211, 1, 1, 1, 1, 1,
1.102509, -0.5378579, 2.972207, 1, 1, 1, 1, 1,
1.113412, 1.469698, 0.5319532, 1, 1, 1, 1, 1,
1.120248, -0.5981882, 2.797876, 0, 0, 1, 1, 1,
1.12091, 0.9424909, 0.7264429, 1, 0, 0, 1, 1,
1.12931, 0.08606603, 4.030635, 1, 0, 0, 1, 1,
1.137886, -0.2340854, 0.6938673, 1, 0, 0, 1, 1,
1.139292, 0.7855611, 0.4755897, 1, 0, 0, 1, 1,
1.141254, 0.7982511, 1.228064, 1, 0, 0, 1, 1,
1.14524, -0.2253046, 2.745219, 0, 0, 0, 1, 1,
1.171307, 1.676539, 1.306135, 0, 0, 0, 1, 1,
1.176816, 0.6786886, 0.9929777, 0, 0, 0, 1, 1,
1.183112, -1.389068, 1.788607, 0, 0, 0, 1, 1,
1.183508, -1.120346, 3.359975, 0, 0, 0, 1, 1,
1.184424, 0.725742, 1.031054, 0, 0, 0, 1, 1,
1.18766, 2.380598, 1.68307, 0, 0, 0, 1, 1,
1.204084, 0.4486341, 2.524142, 1, 1, 1, 1, 1,
1.205633, -1.248016, 2.924188, 1, 1, 1, 1, 1,
1.213618, -1.532879, 3.638856, 1, 1, 1, 1, 1,
1.213996, -0.1365013, 1.296466, 1, 1, 1, 1, 1,
1.222921, -0.3353129, 2.666336, 1, 1, 1, 1, 1,
1.232378, 0.5354359, 1.149724, 1, 1, 1, 1, 1,
1.252611, -1.496538, 2.893685, 1, 1, 1, 1, 1,
1.254696, 1.163903, -0.9156703, 1, 1, 1, 1, 1,
1.258013, -0.8604443, 3.478285, 1, 1, 1, 1, 1,
1.259132, -0.1839464, 3.232196, 1, 1, 1, 1, 1,
1.261336, -1.847138, 1.245131, 1, 1, 1, 1, 1,
1.262282, 0.1929704, 1.897039, 1, 1, 1, 1, 1,
1.270997, -0.5913961, 0.9044794, 1, 1, 1, 1, 1,
1.275168, -1.471361, 2.384426, 1, 1, 1, 1, 1,
1.281754, 0.3977733, 1.139403, 1, 1, 1, 1, 1,
1.286247, -0.7531899, 1.725364, 0, 0, 1, 1, 1,
1.287568, -0.6967348, 1.348713, 1, 0, 0, 1, 1,
1.287881, 0.8819919, -0.7412279, 1, 0, 0, 1, 1,
1.292924, -0.1083996, 1.122882, 1, 0, 0, 1, 1,
1.295297, -1.139373, 2.434251, 1, 0, 0, 1, 1,
1.296883, -0.7601389, 2.564078, 1, 0, 0, 1, 1,
1.301471, -0.5103874, 3.672591, 0, 0, 0, 1, 1,
1.307125, -0.9315056, 2.878931, 0, 0, 0, 1, 1,
1.308333, 0.9653454, 1.211911, 0, 0, 0, 1, 1,
1.313138, 0.3300477, 2.80628, 0, 0, 0, 1, 1,
1.314353, 1.181594, 1.259377, 0, 0, 0, 1, 1,
1.32681, -0.2781236, 2.030119, 0, 0, 0, 1, 1,
1.328441, -0.3714127, 1.412989, 0, 0, 0, 1, 1,
1.329857, 0.5757245, 2.914301, 1, 1, 1, 1, 1,
1.330876, -0.1790512, -0.3523346, 1, 1, 1, 1, 1,
1.335687, 0.3707316, 0.1564195, 1, 1, 1, 1, 1,
1.335877, -0.8334299, 1.318872, 1, 1, 1, 1, 1,
1.344749, 0.06472684, 2.07796, 1, 1, 1, 1, 1,
1.346025, 0.2387162, 1.080167, 1, 1, 1, 1, 1,
1.352738, -1.503142, 1.443895, 1, 1, 1, 1, 1,
1.370535, 0.09753142, 0.8741127, 1, 1, 1, 1, 1,
1.374799, 1.096332, 0.6529377, 1, 1, 1, 1, 1,
1.382333, -1.299989, 2.045815, 1, 1, 1, 1, 1,
1.387533, -0.3736753, 1.197858, 1, 1, 1, 1, 1,
1.392929, -1.935036, 3.605763, 1, 1, 1, 1, 1,
1.394302, -1.573015, 2.409765, 1, 1, 1, 1, 1,
1.4152, -1.468431, 3.71026, 1, 1, 1, 1, 1,
1.416086, -1.132862, 2.56365, 1, 1, 1, 1, 1,
1.421418, -0.4124366, 1.047223, 0, 0, 1, 1, 1,
1.45149, 0.251478, 0.9555008, 1, 0, 0, 1, 1,
1.452985, -0.5974427, 0.8216212, 1, 0, 0, 1, 1,
1.458698, 1.846754, 1.545622, 1, 0, 0, 1, 1,
1.464349, -0.6024141, 0.601114, 1, 0, 0, 1, 1,
1.473641, -0.5157428, 2.245158, 1, 0, 0, 1, 1,
1.474031, -0.2413578, 2.045346, 0, 0, 0, 1, 1,
1.481702, -0.06421507, 2.228681, 0, 0, 0, 1, 1,
1.496558, -0.9466697, 3.516763, 0, 0, 0, 1, 1,
1.497144, -0.02863452, 1.241004, 0, 0, 0, 1, 1,
1.52503, -0.8603991, 1.731626, 0, 0, 0, 1, 1,
1.539164, 0.9684486, 0.4578385, 0, 0, 0, 1, 1,
1.540773, 0.1107403, 1.747745, 0, 0, 0, 1, 1,
1.546812, 1.280212, 0.2226925, 1, 1, 1, 1, 1,
1.547825, 0.3790457, 0.2922406, 1, 1, 1, 1, 1,
1.557502, -1.592903, 1.895433, 1, 1, 1, 1, 1,
1.57084, 0.06756946, 1.424695, 1, 1, 1, 1, 1,
1.580004, 0.3609678, 1.397453, 1, 1, 1, 1, 1,
1.581283, -0.2542648, 0.3666648, 1, 1, 1, 1, 1,
1.590493, -1.339484, 3.183101, 1, 1, 1, 1, 1,
1.602988, -0.2264428, 0.91813, 1, 1, 1, 1, 1,
1.605777, -0.4888099, 0.02297301, 1, 1, 1, 1, 1,
1.616768, 1.115515, 0.8930751, 1, 1, 1, 1, 1,
1.617694, 2.963609, 2.122962, 1, 1, 1, 1, 1,
1.620808, -1.113943, 1.979669, 1, 1, 1, 1, 1,
1.641707, 0.3363062, 1.952743, 1, 1, 1, 1, 1,
1.659039, -0.7524123, 1.21442, 1, 1, 1, 1, 1,
1.676682, 0.7344865, 2.001189, 1, 1, 1, 1, 1,
1.680496, -0.8230903, 1.366567, 0, 0, 1, 1, 1,
1.684924, -2.134426, 1.196837, 1, 0, 0, 1, 1,
1.689521, 0.4114514, 1.068777, 1, 0, 0, 1, 1,
1.702034, 0.8501433, 1.517074, 1, 0, 0, 1, 1,
1.704, -0.3550975, 1.482767, 1, 0, 0, 1, 1,
1.704605, 0.210377, 0.1392346, 1, 0, 0, 1, 1,
1.70493, -0.2757938, 1.099195, 0, 0, 0, 1, 1,
1.740573, -1.167727, 0.7500843, 0, 0, 0, 1, 1,
1.757474, 0.7137651, 2.216933, 0, 0, 0, 1, 1,
1.763661, -2.58918, 2.755902, 0, 0, 0, 1, 1,
1.766218, -0.1250613, 1.519842, 0, 0, 0, 1, 1,
1.767164, 0.02193196, 1.137736, 0, 0, 0, 1, 1,
1.802415, -0.9667907, 3.073824, 0, 0, 0, 1, 1,
1.82567, 0.4189772, 0.9506879, 1, 1, 1, 1, 1,
1.825717, -1.709465, 2.194053, 1, 1, 1, 1, 1,
1.834985, -1.351291, 2.455215, 1, 1, 1, 1, 1,
1.844984, -0.6854501, 1.304942, 1, 1, 1, 1, 1,
1.858346, 1.14817, -0.09040864, 1, 1, 1, 1, 1,
1.860047, -0.4788301, 0.8321928, 1, 1, 1, 1, 1,
1.880918, -0.01150938, 2.632496, 1, 1, 1, 1, 1,
1.904687, 1.106326, -1.112061, 1, 1, 1, 1, 1,
1.920622, 0.5955506, -0.3610393, 1, 1, 1, 1, 1,
1.944866, 0.2814389, 1.488999, 1, 1, 1, 1, 1,
1.958134, 0.3576709, 1.03253, 1, 1, 1, 1, 1,
1.989602, 0.589673, 0.9030676, 1, 1, 1, 1, 1,
1.990754, -0.9485065, 2.247988, 1, 1, 1, 1, 1,
2.023878, -1.062555, -0.2910004, 1, 1, 1, 1, 1,
2.036077, -0.5149377, 3.486913, 1, 1, 1, 1, 1,
2.051084, -1.811337, 4.241793, 0, 0, 1, 1, 1,
2.051851, 0.03088432, 1.258881, 1, 0, 0, 1, 1,
2.126224, 0.3364069, 0.1898251, 1, 0, 0, 1, 1,
2.148429, 0.08363581, 0.2291961, 1, 0, 0, 1, 1,
2.153854, 0.4394045, 1.294794, 1, 0, 0, 1, 1,
2.18564, 0.4424451, 1.24359, 1, 0, 0, 1, 1,
2.225869, -0.2115274, 2.324901, 0, 0, 0, 1, 1,
2.240431, 0.5149666, 4.440366, 0, 0, 0, 1, 1,
2.289819, -0.5690379, 3.613654, 0, 0, 0, 1, 1,
2.295884, -0.9750562, 1.23113, 0, 0, 0, 1, 1,
2.329594, 0.06776121, 2.265397, 0, 0, 0, 1, 1,
2.391151, 1.117084, 0.9930642, 0, 0, 0, 1, 1,
2.413638, 0.05388148, 2.159601, 0, 0, 0, 1, 1,
2.431853, 0.2867516, 2.420725, 1, 1, 1, 1, 1,
2.496868, 0.6756271, 0.1755804, 1, 1, 1, 1, 1,
2.584306, -0.4208534, 1.905665, 1, 1, 1, 1, 1,
2.637943, 0.536943, 0.9994815, 1, 1, 1, 1, 1,
2.75909, -0.7331268, 1.84304, 1, 1, 1, 1, 1,
2.846197, -0.926103, 1.827841, 1, 1, 1, 1, 1,
4.508179, 0.5410874, 1.611784, 1, 1, 1, 1, 1
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
var radius = 9.822721;
var distance = 34.50189;
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
mvMatrix.translate( -0.6180365, -0.2101023, -0.03095007 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50189);
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
