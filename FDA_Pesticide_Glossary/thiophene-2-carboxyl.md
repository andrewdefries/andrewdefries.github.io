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
-3.186097, 0.5685751, -1.391452, 1, 0, 0, 1,
-3.163628, -0.1947272, -2.82537, 1, 0.007843138, 0, 1,
-2.909533, -0.3896332, -0.738332, 1, 0.01176471, 0, 1,
-2.712796, -0.703311, -3.459901, 1, 0.01960784, 0, 1,
-2.614904, 0.3391837, 0.9959717, 1, 0.02352941, 0, 1,
-2.536974, 1.495684, -1.352699, 1, 0.03137255, 0, 1,
-2.521942, 1.362752, -2.496293, 1, 0.03529412, 0, 1,
-2.508898, -1.512972, -3.152246, 1, 0.04313726, 0, 1,
-2.362623, 0.2598311, -1.697585, 1, 0.04705882, 0, 1,
-2.352102, -0.6765443, -2.503184, 1, 0.05490196, 0, 1,
-2.344409, 2.018309, 0.8401685, 1, 0.05882353, 0, 1,
-2.32208, -0.398365, -0.1847366, 1, 0.06666667, 0, 1,
-2.307068, -1.345944, -3.473358, 1, 0.07058824, 0, 1,
-2.292223, 0.189546, -1.025356, 1, 0.07843138, 0, 1,
-2.279777, 0.1788945, -0.06598537, 1, 0.08235294, 0, 1,
-2.228876, -0.738133, -1.074605, 1, 0.09019608, 0, 1,
-2.227731, 0.1670376, -0.4766685, 1, 0.09411765, 0, 1,
-2.227722, -2.175462, -3.325981, 1, 0.1019608, 0, 1,
-2.206558, 0.3521062, 0.961533, 1, 0.1098039, 0, 1,
-2.200579, -1.519455, -1.601751, 1, 0.1137255, 0, 1,
-2.186333, 0.7556205, -2.797134, 1, 0.1215686, 0, 1,
-2.102308, 0.2969448, -0.3919525, 1, 0.1254902, 0, 1,
-2.086364, -0.5569071, -1.702507, 1, 0.1333333, 0, 1,
-2.069061, 0.4468767, -1.056075, 1, 0.1372549, 0, 1,
-2.06195, -0.3219293, -1.873232, 1, 0.145098, 0, 1,
-2.045701, -0.9426832, -1.257488, 1, 0.1490196, 0, 1,
-2.03573, 0.4318162, -1.695192, 1, 0.1568628, 0, 1,
-2.029732, 0.2811866, -0.3603183, 1, 0.1607843, 0, 1,
-2.027795, 0.708598, -1.07135, 1, 0.1686275, 0, 1,
-1.992302, -0.4054838, -0.8622562, 1, 0.172549, 0, 1,
-1.97506, 0.1567957, -1.006414, 1, 0.1803922, 0, 1,
-1.964017, 0.007752333, -0.3806583, 1, 0.1843137, 0, 1,
-1.963258, -0.819176, -1.336199, 1, 0.1921569, 0, 1,
-1.959853, 1.911732, 0.7574303, 1, 0.1960784, 0, 1,
-1.953801, 1.458523, -1.131242, 1, 0.2039216, 0, 1,
-1.89842, 0.4227072, -0.4468262, 1, 0.2117647, 0, 1,
-1.893713, -0.1722818, -1.506092, 1, 0.2156863, 0, 1,
-1.881178, -1.203228, -0.8111874, 1, 0.2235294, 0, 1,
-1.871464, 0.4611057, -2.04806, 1, 0.227451, 0, 1,
-1.859393, 1.123883, -1.674594, 1, 0.2352941, 0, 1,
-1.848502, 0.461421, -0.8523386, 1, 0.2392157, 0, 1,
-1.841602, -0.5707116, -3.60182, 1, 0.2470588, 0, 1,
-1.832839, 0.8988542, -0.6730406, 1, 0.2509804, 0, 1,
-1.831263, -0.04964478, -1.34154, 1, 0.2588235, 0, 1,
-1.815256, 1.712495, -0.4380963, 1, 0.2627451, 0, 1,
-1.791223, -1.276592, -2.240857, 1, 0.2705882, 0, 1,
-1.768064, 1.060104, -0.4648229, 1, 0.2745098, 0, 1,
-1.76256, 2.134425, -1.422397, 1, 0.282353, 0, 1,
-1.757199, 0.1287073, -0.7239386, 1, 0.2862745, 0, 1,
-1.745495, -0.2086665, -0.2537129, 1, 0.2941177, 0, 1,
-1.743663, -0.2044708, -2.921874, 1, 0.3019608, 0, 1,
-1.742784, 1.722631, 0.1020251, 1, 0.3058824, 0, 1,
-1.734238, 1.155, -1.426368, 1, 0.3137255, 0, 1,
-1.732342, -0.397049, -0.9930584, 1, 0.3176471, 0, 1,
-1.724753, 0.123594, -0.8653398, 1, 0.3254902, 0, 1,
-1.717948, -1.141169, -1.223858, 1, 0.3294118, 0, 1,
-1.703127, 1.178949, -2.7003, 1, 0.3372549, 0, 1,
-1.678999, -0.9865047, -4.415547, 1, 0.3411765, 0, 1,
-1.678089, 0.1607809, -0.8916218, 1, 0.3490196, 0, 1,
-1.669051, 0.684733, -0.7943384, 1, 0.3529412, 0, 1,
-1.649739, 0.1774457, -2.421985, 1, 0.3607843, 0, 1,
-1.64685, 0.9409443, 0.3271909, 1, 0.3647059, 0, 1,
-1.622669, 1.832747, -0.7603711, 1, 0.372549, 0, 1,
-1.619604, -0.004858851, -2.232948, 1, 0.3764706, 0, 1,
-1.611106, -0.6166673, -3.041309, 1, 0.3843137, 0, 1,
-1.609016, -1.327587, -2.055207, 1, 0.3882353, 0, 1,
-1.606454, 0.4483458, -2.3926, 1, 0.3960784, 0, 1,
-1.594015, 0.5930977, -0.8827186, 1, 0.4039216, 0, 1,
-1.580739, -1.150267, -0.7208341, 1, 0.4078431, 0, 1,
-1.576685, 0.1521805, -1.599238, 1, 0.4156863, 0, 1,
-1.571031, -0.3247894, -1.31166, 1, 0.4196078, 0, 1,
-1.569389, -0.4954014, -1.774538, 1, 0.427451, 0, 1,
-1.538003, -2.933287, -2.612259, 1, 0.4313726, 0, 1,
-1.536843, -0.08782125, -2.837476, 1, 0.4392157, 0, 1,
-1.52335, -1.053162, -4.149774, 1, 0.4431373, 0, 1,
-1.522021, 0.04284639, -1.450333, 1, 0.4509804, 0, 1,
-1.51304, -0.5246597, -1.495536, 1, 0.454902, 0, 1,
-1.512988, 0.3127252, -1.220636, 1, 0.4627451, 0, 1,
-1.512533, 1.329066, -1.284725, 1, 0.4666667, 0, 1,
-1.501726, -1.030054, -0.393066, 1, 0.4745098, 0, 1,
-1.494748, -0.9234467, -4.734523, 1, 0.4784314, 0, 1,
-1.478601, -1.051029, -1.758518, 1, 0.4862745, 0, 1,
-1.467388, 0.3441732, -2.205184, 1, 0.4901961, 0, 1,
-1.462009, 1.673966, -1.957082, 1, 0.4980392, 0, 1,
-1.458773, -0.2561566, -1.262896, 1, 0.5058824, 0, 1,
-1.456324, 0.3090371, -2.137345, 1, 0.509804, 0, 1,
-1.449934, -0.4484807, -2.159394, 1, 0.5176471, 0, 1,
-1.446088, 1.099672, -1.090634, 1, 0.5215687, 0, 1,
-1.442669, -0.943825, -2.973197, 1, 0.5294118, 0, 1,
-1.441749, 0.4763873, 1.441263, 1, 0.5333334, 0, 1,
-1.43298, 1.154767, -1.627855, 1, 0.5411765, 0, 1,
-1.419093, -0.3874158, -3.146713, 1, 0.5450981, 0, 1,
-1.41402, -1.169213, -2.264308, 1, 0.5529412, 0, 1,
-1.410414, -0.7655021, -0.5469218, 1, 0.5568628, 0, 1,
-1.404141, -0.5339559, -0.709516, 1, 0.5647059, 0, 1,
-1.397031, 1.15954, 0.01504607, 1, 0.5686275, 0, 1,
-1.393974, -0.6627975, -1.782211, 1, 0.5764706, 0, 1,
-1.389701, -0.7722898, -2.357944, 1, 0.5803922, 0, 1,
-1.388128, -0.5526173, -2.51128, 1, 0.5882353, 0, 1,
-1.383717, -0.7798967, -0.9922888, 1, 0.5921569, 0, 1,
-1.380462, 1.603728, -0.9418374, 1, 0.6, 0, 1,
-1.371971, 0.43971, 0.09802262, 1, 0.6078432, 0, 1,
-1.370518, -0.2670278, -2.760034, 1, 0.6117647, 0, 1,
-1.369466, 1.094707, -0.35564, 1, 0.6196079, 0, 1,
-1.357938, 0.7861139, -1.28883, 1, 0.6235294, 0, 1,
-1.356012, 0.8038685, -0.3338151, 1, 0.6313726, 0, 1,
-1.355911, 1.17998, 1.42174, 1, 0.6352941, 0, 1,
-1.349317, -1.207554, -2.992291, 1, 0.6431373, 0, 1,
-1.325199, 0.7040395, -0.2023757, 1, 0.6470588, 0, 1,
-1.318577, 1.268412, -1.346999, 1, 0.654902, 0, 1,
-1.309104, 0.4405804, -1.660452, 1, 0.6588235, 0, 1,
-1.307907, 0.7582989, -2.282048, 1, 0.6666667, 0, 1,
-1.300281, 0.5142111, 0.5724105, 1, 0.6705883, 0, 1,
-1.27559, -0.5235029, -3.085521, 1, 0.6784314, 0, 1,
-1.272373, -0.04956957, -1.419769, 1, 0.682353, 0, 1,
-1.265861, 0.6924435, -0.1306308, 1, 0.6901961, 0, 1,
-1.260747, -1.579636, -2.58399, 1, 0.6941177, 0, 1,
-1.257986, 0.3297102, -1.590417, 1, 0.7019608, 0, 1,
-1.2512, 1.111162, -1.418403, 1, 0.7098039, 0, 1,
-1.249586, 1.926952, 1.721461, 1, 0.7137255, 0, 1,
-1.245579, -0.01850607, -2.034927, 1, 0.7215686, 0, 1,
-1.244261, 0.08454452, -2.708593, 1, 0.7254902, 0, 1,
-1.243854, -2.427903, -1.088797, 1, 0.7333333, 0, 1,
-1.236703, 0.1799039, -1.574808, 1, 0.7372549, 0, 1,
-1.2307, -0.9763025, -2.909608, 1, 0.7450981, 0, 1,
-1.229852, -0.5233176, -2.684789, 1, 0.7490196, 0, 1,
-1.225772, -0.2478082, -0.9784829, 1, 0.7568628, 0, 1,
-1.225377, -0.2397586, -0.5328754, 1, 0.7607843, 0, 1,
-1.222036, 0.6714182, -1.545992, 1, 0.7686275, 0, 1,
-1.220977, -0.9087259, -2.685613, 1, 0.772549, 0, 1,
-1.21927, 0.4623001, -2.967315, 1, 0.7803922, 0, 1,
-1.210955, -0.05966717, -2.880308, 1, 0.7843137, 0, 1,
-1.197525, -0.2137298, -3.912278, 1, 0.7921569, 0, 1,
-1.183095, -1.306019, -3.285727, 1, 0.7960784, 0, 1,
-1.173562, -1.222965, -3.682463, 1, 0.8039216, 0, 1,
-1.171657, -0.9859896, -2.212014, 1, 0.8117647, 0, 1,
-1.169331, -0.4805006, -3.65365, 1, 0.8156863, 0, 1,
-1.164458, -0.2007495, -1.160616, 1, 0.8235294, 0, 1,
-1.16021, -0.1826378, -1.80003, 1, 0.827451, 0, 1,
-1.157166, -0.09685671, -2.00413, 1, 0.8352941, 0, 1,
-1.142212, 1.209583, -0.621496, 1, 0.8392157, 0, 1,
-1.138746, 1.019002, 1.363111, 1, 0.8470588, 0, 1,
-1.133842, -0.1473445, -0.6593161, 1, 0.8509804, 0, 1,
-1.124828, -0.0596307, -2.512568, 1, 0.8588235, 0, 1,
-1.124241, 0.563514, -2.354788, 1, 0.8627451, 0, 1,
-1.116486, -0.6180686, -2.064459, 1, 0.8705882, 0, 1,
-1.114376, 1.170724, -0.2321951, 1, 0.8745098, 0, 1,
-1.111543, 0.8302419, -0.2686583, 1, 0.8823529, 0, 1,
-1.104553, -2.317806, -5.302565, 1, 0.8862745, 0, 1,
-1.100007, -1.00719, -3.470714, 1, 0.8941177, 0, 1,
-1.093915, 0.3206843, -0.662699, 1, 0.8980392, 0, 1,
-1.09356, 0.4821822, -1.702241, 1, 0.9058824, 0, 1,
-1.066552, 1.039187, -1.569718, 1, 0.9137255, 0, 1,
-1.061853, 0.03390404, 0.6252422, 1, 0.9176471, 0, 1,
-1.058934, 0.673574, -0.8403375, 1, 0.9254902, 0, 1,
-1.058035, -0.2839767, -2.366074, 1, 0.9294118, 0, 1,
-1.055818, 2.019424, -0.3450602, 1, 0.9372549, 0, 1,
-1.053065, 0.2003598, -1.065454, 1, 0.9411765, 0, 1,
-1.050228, 1.198344, -0.3562493, 1, 0.9490196, 0, 1,
-1.047633, -1.722659, -0.806167, 1, 0.9529412, 0, 1,
-1.041415, -0.5691578, -0.8666682, 1, 0.9607843, 0, 1,
-1.029297, -0.6007737, -0.9035886, 1, 0.9647059, 0, 1,
-1.029123, 0.3084392, -2.260372, 1, 0.972549, 0, 1,
-1.02737, -0.3830594, -0.9355112, 1, 0.9764706, 0, 1,
-1.026884, 0.09612248, -2.134084, 1, 0.9843137, 0, 1,
-1.024179, 0.444839, -0.9875655, 1, 0.9882353, 0, 1,
-1.022287, 0.2001819, -0.8448326, 1, 0.9960784, 0, 1,
-1.015346, 1.989974, 0.5192232, 0.9960784, 1, 0, 1,
-1.010893, 1.124229, 0.0002802756, 0.9921569, 1, 0, 1,
-1.010558, 0.2437763, -0.249923, 0.9843137, 1, 0, 1,
-1.007919, -0.3965491, -0.7208842, 0.9803922, 1, 0, 1,
-0.9985624, 0.1298349, -0.4644674, 0.972549, 1, 0, 1,
-0.9980966, -0.1123643, -2.674903, 0.9686275, 1, 0, 1,
-0.9909648, -1.323463, -2.257889, 0.9607843, 1, 0, 1,
-0.9875121, 0.2935533, -0.5951737, 0.9568627, 1, 0, 1,
-0.9778867, 0.2691952, -1.485074, 0.9490196, 1, 0, 1,
-0.9757371, -0.6361689, -1.258411, 0.945098, 1, 0, 1,
-0.9738092, 0.5621733, -0.7212292, 0.9372549, 1, 0, 1,
-0.962413, 0.4443441, -0.3627273, 0.9333333, 1, 0, 1,
-0.9587143, -0.3607045, -1.875605, 0.9254902, 1, 0, 1,
-0.9488595, -2.025808, -1.725361, 0.9215686, 1, 0, 1,
-0.9312825, 0.337582, -1.536256, 0.9137255, 1, 0, 1,
-0.9238034, 0.2780807, -1.703426, 0.9098039, 1, 0, 1,
-0.9225804, 0.1947711, -1.097202, 0.9019608, 1, 0, 1,
-0.9156533, -2.041825, -1.54546, 0.8941177, 1, 0, 1,
-0.9091336, 1.641094, -0.8857423, 0.8901961, 1, 0, 1,
-0.9033037, 0.3650516, -1.672776, 0.8823529, 1, 0, 1,
-0.9017652, -0.04927085, -0.3992332, 0.8784314, 1, 0, 1,
-0.8954263, 1.629428, 0.8570208, 0.8705882, 1, 0, 1,
-0.889686, -1.681308, -3.514546, 0.8666667, 1, 0, 1,
-0.8882446, -0.5370882, -3.416753, 0.8588235, 1, 0, 1,
-0.8878131, 0.9033405, -1.013749, 0.854902, 1, 0, 1,
-0.8850391, 0.6774849, -1.666096, 0.8470588, 1, 0, 1,
-0.884484, 0.3352576, -1.112798, 0.8431373, 1, 0, 1,
-0.8842056, -0.3926862, -1.09172, 0.8352941, 1, 0, 1,
-0.8840023, 0.492865, 1.411528, 0.8313726, 1, 0, 1,
-0.8748032, -0.7889737, -4.363065, 0.8235294, 1, 0, 1,
-0.8742352, -0.9125512, -2.098769, 0.8196079, 1, 0, 1,
-0.8691565, -1.003106, -1.439614, 0.8117647, 1, 0, 1,
-0.8689301, -3.029902, -2.706385, 0.8078431, 1, 0, 1,
-0.8618578, 1.306503, -2.713505, 0.8, 1, 0, 1,
-0.8584856, -0.7097483, -1.323133, 0.7921569, 1, 0, 1,
-0.8558133, 0.1929836, -0.4280863, 0.7882353, 1, 0, 1,
-0.8542156, 0.858819, -1.448272, 0.7803922, 1, 0, 1,
-0.8538617, -1.655235, -2.53332, 0.7764706, 1, 0, 1,
-0.846155, 0.2733205, -1.332028, 0.7686275, 1, 0, 1,
-0.8398054, 0.965143, -1.233483, 0.7647059, 1, 0, 1,
-0.8377334, 0.3283074, -0.2974261, 0.7568628, 1, 0, 1,
-0.8370485, 0.8270717, -2.069502, 0.7529412, 1, 0, 1,
-0.8365041, 0.8483302, -1.715586, 0.7450981, 1, 0, 1,
-0.822565, 0.009786565, -0.9245225, 0.7411765, 1, 0, 1,
-0.8218532, -1.470727, -3.939018, 0.7333333, 1, 0, 1,
-0.8195899, 0.4063035, -1.529152, 0.7294118, 1, 0, 1,
-0.8181445, -0.221735, -1.915512, 0.7215686, 1, 0, 1,
-0.8147746, 1.053908, -1.133295, 0.7176471, 1, 0, 1,
-0.8126056, 0.2673716, -1.394375, 0.7098039, 1, 0, 1,
-0.8119912, -1.063236, -1.924257, 0.7058824, 1, 0, 1,
-0.8119058, 1.648012, -0.2277034, 0.6980392, 1, 0, 1,
-0.8110015, -0.1305762, -2.203075, 0.6901961, 1, 0, 1,
-0.80943, 1.393637, 0.6516302, 0.6862745, 1, 0, 1,
-0.8090411, 0.80371, -0.3410758, 0.6784314, 1, 0, 1,
-0.8056093, 1.378617, -0.4601291, 0.6745098, 1, 0, 1,
-0.8050907, -1.820246, -2.166569, 0.6666667, 1, 0, 1,
-0.7904098, -2.522611, -2.275872, 0.6627451, 1, 0, 1,
-0.7887216, -1.82472, -2.029274, 0.654902, 1, 0, 1,
-0.7839229, -0.06518907, -2.475682, 0.6509804, 1, 0, 1,
-0.7791169, 1.687949, -1.591654, 0.6431373, 1, 0, 1,
-0.7730324, 0.2965668, -1.684108, 0.6392157, 1, 0, 1,
-0.7715464, 0.3685946, -2.506886, 0.6313726, 1, 0, 1,
-0.7698269, -1.039946, -2.628555, 0.627451, 1, 0, 1,
-0.7669178, 0.7585721, -2.516182, 0.6196079, 1, 0, 1,
-0.7627845, -0.272155, -2.22444, 0.6156863, 1, 0, 1,
-0.7612903, -0.4183314, -2.238189, 0.6078432, 1, 0, 1,
-0.7580377, -0.4465694, -0.9621838, 0.6039216, 1, 0, 1,
-0.7553381, 0.733254, -1.974455, 0.5960785, 1, 0, 1,
-0.7479011, -0.5905896, -1.846776, 0.5882353, 1, 0, 1,
-0.7395035, 0.6781332, -0.009998336, 0.5843138, 1, 0, 1,
-0.7382025, -0.7314201, -1.763274, 0.5764706, 1, 0, 1,
-0.7374792, 0.3020156, -0.8607119, 0.572549, 1, 0, 1,
-0.7335314, 1.955381, -0.2127179, 0.5647059, 1, 0, 1,
-0.7283397, 1.371172, -0.5909196, 0.5607843, 1, 0, 1,
-0.7269737, 0.9650995, -0.7759417, 0.5529412, 1, 0, 1,
-0.7178266, 0.1249803, -0.7656975, 0.5490196, 1, 0, 1,
-0.716791, -0.01181334, -1.505259, 0.5411765, 1, 0, 1,
-0.7144386, -0.865895, -2.398462, 0.5372549, 1, 0, 1,
-0.7118445, 0.3546235, -3.378893, 0.5294118, 1, 0, 1,
-0.7036215, -1.83773, -2.739478, 0.5254902, 1, 0, 1,
-0.7020104, 0.8066918, -0.702866, 0.5176471, 1, 0, 1,
-0.7009652, 0.09730612, -2.086321, 0.5137255, 1, 0, 1,
-0.6990752, 0.1434377, -1.66894, 0.5058824, 1, 0, 1,
-0.6979891, -1.790617, -2.327353, 0.5019608, 1, 0, 1,
-0.6941032, 0.7864224, -0.7550106, 0.4941176, 1, 0, 1,
-0.6923633, -1.443066, -3.000194, 0.4862745, 1, 0, 1,
-0.6895039, -0.2510227, -2.637876, 0.4823529, 1, 0, 1,
-0.6876818, 0.5155407, -0.02782536, 0.4745098, 1, 0, 1,
-0.679332, -1.482591, -3.476841, 0.4705882, 1, 0, 1,
-0.6769767, -0.01255005, -2.273464, 0.4627451, 1, 0, 1,
-0.6730345, -0.08326298, -0.7042863, 0.4588235, 1, 0, 1,
-0.6720442, -0.4639517, -3.302886, 0.4509804, 1, 0, 1,
-0.670522, -0.6637316, -1.586526, 0.4470588, 1, 0, 1,
-0.665588, 1.087332, -0.7909501, 0.4392157, 1, 0, 1,
-0.6628342, 0.6992025, -0.4080097, 0.4352941, 1, 0, 1,
-0.6589687, 0.5161054, -1.624659, 0.427451, 1, 0, 1,
-0.6539726, -2.101863, -5.55973, 0.4235294, 1, 0, 1,
-0.651692, -0.1409743, -2.942005, 0.4156863, 1, 0, 1,
-0.6420983, 0.3477774, -1.409169, 0.4117647, 1, 0, 1,
-0.6398814, 1.547074, -1.958936, 0.4039216, 1, 0, 1,
-0.631579, 0.1575882, -0.5832475, 0.3960784, 1, 0, 1,
-0.6265955, -0.5907943, -3.203509, 0.3921569, 1, 0, 1,
-0.6258444, -0.3467374, -2.506329, 0.3843137, 1, 0, 1,
-0.6209084, 0.2362064, -0.4331406, 0.3803922, 1, 0, 1,
-0.6179345, 1.046783, -0.1317155, 0.372549, 1, 0, 1,
-0.6168741, 0.7264454, -1.16005, 0.3686275, 1, 0, 1,
-0.6159751, 0.4537989, -1.33946, 0.3607843, 1, 0, 1,
-0.6126406, 0.2704896, 0.2859455, 0.3568628, 1, 0, 1,
-0.6092033, 0.5152833, -0.7262757, 0.3490196, 1, 0, 1,
-0.6084834, -1.794117, -4.550719, 0.345098, 1, 0, 1,
-0.6067749, -0.7137654, 0.3771961, 0.3372549, 1, 0, 1,
-0.6049516, 0.4208061, -2.731215, 0.3333333, 1, 0, 1,
-0.601265, 0.3114399, -0.7141668, 0.3254902, 1, 0, 1,
-0.6006899, -1.870983, -3.554909, 0.3215686, 1, 0, 1,
-0.5955001, -2.415333, -2.073344, 0.3137255, 1, 0, 1,
-0.5944017, 0.4145537, -1.587482, 0.3098039, 1, 0, 1,
-0.5927091, -0.6314798, -3.050938, 0.3019608, 1, 0, 1,
-0.5925787, 0.3305162, -1.081476, 0.2941177, 1, 0, 1,
-0.5906006, -1.263255, -1.941787, 0.2901961, 1, 0, 1,
-0.5851261, 1.974936, -1.568678, 0.282353, 1, 0, 1,
-0.5822273, -0.5020261, -3.508162, 0.2784314, 1, 0, 1,
-0.5817428, -0.1154514, -0.5163953, 0.2705882, 1, 0, 1,
-0.5802073, 0.4488806, -1.421598, 0.2666667, 1, 0, 1,
-0.5797763, -0.01427108, -0.337469, 0.2588235, 1, 0, 1,
-0.5771512, 0.2529533, -1.308936, 0.254902, 1, 0, 1,
-0.5762777, -0.5703127, -2.153926, 0.2470588, 1, 0, 1,
-0.5670737, -1.952129, -4.360432, 0.2431373, 1, 0, 1,
-0.5665392, -0.6109766, -3.000797, 0.2352941, 1, 0, 1,
-0.5646999, 0.2845458, -0.4556351, 0.2313726, 1, 0, 1,
-0.5641833, -0.3095649, -0.9329857, 0.2235294, 1, 0, 1,
-0.556548, -0.5345253, -2.391816, 0.2196078, 1, 0, 1,
-0.5561339, 0.891158, 1.518789, 0.2117647, 1, 0, 1,
-0.5478719, -0.1531444, -2.663496, 0.2078431, 1, 0, 1,
-0.5445444, 0.3895545, 1.192042, 0.2, 1, 0, 1,
-0.5435757, 0.7250812, -0.6852639, 0.1921569, 1, 0, 1,
-0.5424969, -1.118977, -1.38511, 0.1882353, 1, 0, 1,
-0.5414184, 0.5726478, -2.727686, 0.1803922, 1, 0, 1,
-0.5412043, 2.180754, 0.3249713, 0.1764706, 1, 0, 1,
-0.5333123, 0.7422979, -1.310046, 0.1686275, 1, 0, 1,
-0.5301799, 2.342188, -1.411962, 0.1647059, 1, 0, 1,
-0.5238782, -0.7528511, -2.694219, 0.1568628, 1, 0, 1,
-0.523167, -0.07532796, -1.034891, 0.1529412, 1, 0, 1,
-0.522868, -1.033349, -1.89659, 0.145098, 1, 0, 1,
-0.5091836, 0.04396147, -0.2453902, 0.1411765, 1, 0, 1,
-0.5009882, -1.316774, -4.323526, 0.1333333, 1, 0, 1,
-0.5005419, 1.15856, -0.7088572, 0.1294118, 1, 0, 1,
-0.4996741, -1.412129, -4.13781, 0.1215686, 1, 0, 1,
-0.4963439, -0.425479, -1.238374, 0.1176471, 1, 0, 1,
-0.4939669, -0.4320435, -2.194582, 0.1098039, 1, 0, 1,
-0.4900891, 1.483439, -0.5976896, 0.1058824, 1, 0, 1,
-0.4889546, 1.263775, -0.3855459, 0.09803922, 1, 0, 1,
-0.4811292, -0.0748262, -1.750012, 0.09019608, 1, 0, 1,
-0.4805284, -0.2722111, -2.300207, 0.08627451, 1, 0, 1,
-0.4790429, -2.098936, -1.760047, 0.07843138, 1, 0, 1,
-0.4782496, 0.06807199, -1.477155, 0.07450981, 1, 0, 1,
-0.4708032, -1.288836, -2.52944, 0.06666667, 1, 0, 1,
-0.4680511, 0.5585601, -0.5909694, 0.0627451, 1, 0, 1,
-0.4625004, -1.031095, -1.35458, 0.05490196, 1, 0, 1,
-0.4623589, 0.5967452, 1.910123, 0.05098039, 1, 0, 1,
-0.4581887, -1.706848, -2.888116, 0.04313726, 1, 0, 1,
-0.454501, -0.5819358, -0.3056264, 0.03921569, 1, 0, 1,
-0.4470926, -0.198499, -3.276276, 0.03137255, 1, 0, 1,
-0.4450273, 0.5815454, -0.2736548, 0.02745098, 1, 0, 1,
-0.4445489, 1.360032, -1.728645, 0.01960784, 1, 0, 1,
-0.443617, 0.03461329, -3.772969, 0.01568628, 1, 0, 1,
-0.4432481, 1.205144, -0.9166014, 0.007843138, 1, 0, 1,
-0.442689, 0.3811956, -1.070224, 0.003921569, 1, 0, 1,
-0.4386274, -1.095155, -3.010837, 0, 1, 0.003921569, 1,
-0.4368803, -0.4039204, -0.605701, 0, 1, 0.01176471, 1,
-0.434074, 0.5429821, -0.5999666, 0, 1, 0.01568628, 1,
-0.4304547, 0.3267542, -2.635582, 0, 1, 0.02352941, 1,
-0.4299898, 0.01042134, -1.542702, 0, 1, 0.02745098, 1,
-0.4287747, -0.1565981, -2.859714, 0, 1, 0.03529412, 1,
-0.4265891, -0.598732, -2.30933, 0, 1, 0.03921569, 1,
-0.4217772, 0.7563634, -0.0827318, 0, 1, 0.04705882, 1,
-0.4120791, 0.9921188, 0.992939, 0, 1, 0.05098039, 1,
-0.4113449, 1.14414, 0.4733309, 0, 1, 0.05882353, 1,
-0.4109601, 0.8092973, -0.3022127, 0, 1, 0.0627451, 1,
-0.4086832, -1.442674, -3.336197, 0, 1, 0.07058824, 1,
-0.4079786, -1.206412, -2.793973, 0, 1, 0.07450981, 1,
-0.4074529, -0.2519363, -1.687794, 0, 1, 0.08235294, 1,
-0.3952914, -2.873309, -2.675022, 0, 1, 0.08627451, 1,
-0.3946745, 0.9131294, 0.9761121, 0, 1, 0.09411765, 1,
-0.3945588, -1.997502, -3.173953, 0, 1, 0.1019608, 1,
-0.3941399, 0.8236957, -0.3286109, 0, 1, 0.1058824, 1,
-0.3908915, 0.8900949, -1.247364, 0, 1, 0.1137255, 1,
-0.3855918, -1.148477, -3.6004, 0, 1, 0.1176471, 1,
-0.3845109, -1.404616, -2.169296, 0, 1, 0.1254902, 1,
-0.3842434, 0.2451844, 0.2907434, 0, 1, 0.1294118, 1,
-0.3790548, 1.815005, -0.4694912, 0, 1, 0.1372549, 1,
-0.3764765, 1.159952, -0.7360928, 0, 1, 0.1411765, 1,
-0.361447, 0.8226731, -0.7448857, 0, 1, 0.1490196, 1,
-0.3604564, 0.5307372, -0.7574978, 0, 1, 0.1529412, 1,
-0.3590836, 1.186219, -0.3557057, 0, 1, 0.1607843, 1,
-0.3552853, -0.1634321, -1.466416, 0, 1, 0.1647059, 1,
-0.3537896, 0.1481522, -2.190646, 0, 1, 0.172549, 1,
-0.3436722, 2.709189, 0.3901925, 0, 1, 0.1764706, 1,
-0.3407959, 0.0111056, -2.158691, 0, 1, 0.1843137, 1,
-0.3389938, -1.84796, -2.308651, 0, 1, 0.1882353, 1,
-0.337159, -1.963562, -1.375034, 0, 1, 0.1960784, 1,
-0.3363593, 1.364657, -1.625059, 0, 1, 0.2039216, 1,
-0.3360006, -1.614985, -2.248121, 0, 1, 0.2078431, 1,
-0.3357296, 0.07519611, -1.235635, 0, 1, 0.2156863, 1,
-0.3356914, 0.3439573, -0.8238775, 0, 1, 0.2196078, 1,
-0.3345439, -0.7285114, -4.240551, 0, 1, 0.227451, 1,
-0.3322738, -0.5382919, -3.128693, 0, 1, 0.2313726, 1,
-0.3306091, 0.40385, -2.340747, 0, 1, 0.2392157, 1,
-0.324293, -0.6923693, -2.700133, 0, 1, 0.2431373, 1,
-0.3205908, 0.6656564, 0.05493966, 0, 1, 0.2509804, 1,
-0.3174267, -0.8133288, -2.459189, 0, 1, 0.254902, 1,
-0.3157613, 0.3960003, -0.5195402, 0, 1, 0.2627451, 1,
-0.314894, 0.6956308, 0.6509225, 0, 1, 0.2666667, 1,
-0.3105507, 0.02084802, -2.247363, 0, 1, 0.2745098, 1,
-0.2963186, 1.77984, -0.06870576, 0, 1, 0.2784314, 1,
-0.2928668, -0.8110148, -2.166443, 0, 1, 0.2862745, 1,
-0.2925891, -0.8783495, -3.000698, 0, 1, 0.2901961, 1,
-0.2908703, 1.205548, 1.270121, 0, 1, 0.2980392, 1,
-0.2887593, -0.1716646, -3.007293, 0, 1, 0.3058824, 1,
-0.28688, -1.634658, -1.970128, 0, 1, 0.3098039, 1,
-0.2853363, 1.532677, 0.7710505, 0, 1, 0.3176471, 1,
-0.2847032, -0.1669375, -2.687534, 0, 1, 0.3215686, 1,
-0.2815154, 0.3205417, 0.3060049, 0, 1, 0.3294118, 1,
-0.2799097, 0.8450041, -0.5251077, 0, 1, 0.3333333, 1,
-0.2769525, 1.124022, -0.7758552, 0, 1, 0.3411765, 1,
-0.269209, 0.07892899, 0.04558203, 0, 1, 0.345098, 1,
-0.2690065, 0.4965615, 0.1546278, 0, 1, 0.3529412, 1,
-0.2688129, 0.6009044, 1.035015, 0, 1, 0.3568628, 1,
-0.2658896, 1.803687, 0.2405755, 0, 1, 0.3647059, 1,
-0.2637051, 0.4510122, -1.146127, 0, 1, 0.3686275, 1,
-0.2518183, 0.5272205, -1.782814, 0, 1, 0.3764706, 1,
-0.2513124, 1.197826, -0.5443104, 0, 1, 0.3803922, 1,
-0.2488882, 2.178315, -0.1446619, 0, 1, 0.3882353, 1,
-0.246518, -1.378439, -1.747977, 0, 1, 0.3921569, 1,
-0.2444934, 1.004056, 0.2731633, 0, 1, 0.4, 1,
-0.2397068, 0.3624934, 0.5958505, 0, 1, 0.4078431, 1,
-0.2382247, -0.910946, -4.058923, 0, 1, 0.4117647, 1,
-0.237491, 0.9017363, -0.7360014, 0, 1, 0.4196078, 1,
-0.2373107, 1.66517, -1.054669, 0, 1, 0.4235294, 1,
-0.2355033, -0.4355237, -2.835827, 0, 1, 0.4313726, 1,
-0.2344561, 0.4279436, -0.2640103, 0, 1, 0.4352941, 1,
-0.2336812, 0.4418116, 0.419388, 0, 1, 0.4431373, 1,
-0.2336439, -0.5621176, -1.598871, 0, 1, 0.4470588, 1,
-0.2302407, 0.9889535, 0.8469309, 0, 1, 0.454902, 1,
-0.2295681, -0.01163751, -1.453202, 0, 1, 0.4588235, 1,
-0.2256249, -1.192801, -1.249987, 0, 1, 0.4666667, 1,
-0.2244246, -2.335342, -3.991298, 0, 1, 0.4705882, 1,
-0.2239487, -1.497009, -2.123632, 0, 1, 0.4784314, 1,
-0.2228461, -0.8445451, -3.615171, 0, 1, 0.4823529, 1,
-0.2221307, -0.2066182, -3.32941, 0, 1, 0.4901961, 1,
-0.2213919, 0.307034, -0.8317279, 0, 1, 0.4941176, 1,
-0.2198491, 0.353642, 0.4432121, 0, 1, 0.5019608, 1,
-0.2132061, 0.1117966, -0.6199617, 0, 1, 0.509804, 1,
-0.2126936, -1.137207, -3.292985, 0, 1, 0.5137255, 1,
-0.2125769, -0.5341493, -3.736145, 0, 1, 0.5215687, 1,
-0.2096653, -1.225435, -2.72796, 0, 1, 0.5254902, 1,
-0.2067413, 0.5492141, -1.718159, 0, 1, 0.5333334, 1,
-0.2061562, -0.5509705, -4.781476, 0, 1, 0.5372549, 1,
-0.2059101, 0.8756247, -0.2134461, 0, 1, 0.5450981, 1,
-0.2058821, -1.713466, -3.723161, 0, 1, 0.5490196, 1,
-0.2010169, -0.9295646, -3.286048, 0, 1, 0.5568628, 1,
-0.19688, 0.602689, -1.887756, 0, 1, 0.5607843, 1,
-0.196064, -0.9591758, -4.571903, 0, 1, 0.5686275, 1,
-0.1952746, -0.3950399, -1.927355, 0, 1, 0.572549, 1,
-0.1881811, 1.377905, 1.012969, 0, 1, 0.5803922, 1,
-0.1866774, 1.115768, -2.048779, 0, 1, 0.5843138, 1,
-0.1828984, -0.005387386, -1.127925, 0, 1, 0.5921569, 1,
-0.1826717, -0.6767698, -3.404124, 0, 1, 0.5960785, 1,
-0.1767127, -0.390316, -3.738883, 0, 1, 0.6039216, 1,
-0.1735658, 0.4155771, 1.473835, 0, 1, 0.6117647, 1,
-0.1730619, -1.387619, -4.374063, 0, 1, 0.6156863, 1,
-0.1727425, -1.217323, -0.8214185, 0, 1, 0.6235294, 1,
-0.172357, -1.276256, -2.273032, 0, 1, 0.627451, 1,
-0.1701778, -0.6861488, -2.33122, 0, 1, 0.6352941, 1,
-0.1682559, 0.8103755, 0.3834952, 0, 1, 0.6392157, 1,
-0.1680342, 1.408225, -2.002503, 0, 1, 0.6470588, 1,
-0.1651911, 0.9690105, -0.5686604, 0, 1, 0.6509804, 1,
-0.1632087, -1.141176, -2.799997, 0, 1, 0.6588235, 1,
-0.1627702, 0.5863096, 0.1989757, 0, 1, 0.6627451, 1,
-0.1606512, 1.064234, 1.622927, 0, 1, 0.6705883, 1,
-0.1595313, 1.084333, -1.090906, 0, 1, 0.6745098, 1,
-0.15858, 1.187895, -0.4614204, 0, 1, 0.682353, 1,
-0.1581703, -1.586592, -4.765791, 0, 1, 0.6862745, 1,
-0.1542773, 0.7611654, 0.9798907, 0, 1, 0.6941177, 1,
-0.1537732, 0.2711827, 0.1649239, 0, 1, 0.7019608, 1,
-0.1512907, 0.3607619, -0.6667114, 0, 1, 0.7058824, 1,
-0.1510919, -1.728169, -3.366317, 0, 1, 0.7137255, 1,
-0.1487718, -0.5873893, -3.022849, 0, 1, 0.7176471, 1,
-0.1362708, -0.7045801, -4.685917, 0, 1, 0.7254902, 1,
-0.1328673, 2.389145, -0.620048, 0, 1, 0.7294118, 1,
-0.131979, -1.873204, -3.517156, 0, 1, 0.7372549, 1,
-0.1300934, 0.6348055, -0.3778791, 0, 1, 0.7411765, 1,
-0.1276139, 0.7953305, -0.3544698, 0, 1, 0.7490196, 1,
-0.1206386, 0.03414961, -0.8083524, 0, 1, 0.7529412, 1,
-0.1202449, -0.186018, -1.419479, 0, 1, 0.7607843, 1,
-0.117322, 1.368538, -1.452235, 0, 1, 0.7647059, 1,
-0.1113067, -0.4057928, -2.676145, 0, 1, 0.772549, 1,
-0.110509, 1.340355, -2.345081, 0, 1, 0.7764706, 1,
-0.1091883, -0.8826339, -3.852488, 0, 1, 0.7843137, 1,
-0.1061127, -2.253747, -4.539756, 0, 1, 0.7882353, 1,
-0.1049009, -1.054435, -3.964418, 0, 1, 0.7960784, 1,
-0.1046368, 1.709885, -0.6590824, 0, 1, 0.8039216, 1,
-0.1023831, -0.1633109, -2.831483, 0, 1, 0.8078431, 1,
-0.10093, -0.7724503, -2.598614, 0, 1, 0.8156863, 1,
-0.1004863, 1.044698, 1.778255, 0, 1, 0.8196079, 1,
-0.09703548, -0.5149509, -4.088873, 0, 1, 0.827451, 1,
-0.09515308, 2.248678, -0.6234625, 0, 1, 0.8313726, 1,
-0.09106816, -1.005543, -2.018805, 0, 1, 0.8392157, 1,
-0.08540187, 0.1040602, -0.1490358, 0, 1, 0.8431373, 1,
-0.08509142, 1.296283, -2.352448, 0, 1, 0.8509804, 1,
-0.08282439, -1.297077, -3.587517, 0, 1, 0.854902, 1,
-0.07627529, -0.4602211, -1.881164, 0, 1, 0.8627451, 1,
-0.07544682, 2.241377, 0.4749869, 0, 1, 0.8666667, 1,
-0.07417953, -0.2019645, -1.334969, 0, 1, 0.8745098, 1,
-0.07074819, -0.325362, -2.536107, 0, 1, 0.8784314, 1,
-0.06916858, 0.8464583, -0.02976928, 0, 1, 0.8862745, 1,
-0.06650849, -0.9641923, -5.698643, 0, 1, 0.8901961, 1,
-0.06425376, -0.2268026, -1.934487, 0, 1, 0.8980392, 1,
-0.06412318, -0.05288962, -2.520216, 0, 1, 0.9058824, 1,
-0.06127737, 0.8011727, 0.05326254, 0, 1, 0.9098039, 1,
-0.05732089, 0.6606162, 0.5467025, 0, 1, 0.9176471, 1,
-0.04278395, 0.5737025, 0.02943097, 0, 1, 0.9215686, 1,
-0.04219293, 0.06832211, -1.134676, 0, 1, 0.9294118, 1,
-0.0408591, -0.350919, -1.758667, 0, 1, 0.9333333, 1,
-0.03934145, 0.3172328, -1.082094, 0, 1, 0.9411765, 1,
-0.03747215, 1.301008, -1.097447, 0, 1, 0.945098, 1,
-0.03734326, -0.05523532, -0.4615854, 0, 1, 0.9529412, 1,
-0.03268662, -0.5035989, -4.150385, 0, 1, 0.9568627, 1,
-0.02651684, 0.5723767, 0.3308234, 0, 1, 0.9647059, 1,
-0.02532335, -0.4666516, -4.152949, 0, 1, 0.9686275, 1,
-0.02227679, 0.01218104, -0.5764022, 0, 1, 0.9764706, 1,
-0.01479068, -0.02772662, -1.763286, 0, 1, 0.9803922, 1,
-0.01472436, -0.9764643, -3.207048, 0, 1, 0.9882353, 1,
-0.01434971, 1.404652, -2.179958, 0, 1, 0.9921569, 1,
-0.009068961, -0.7691512, -2.634127, 0, 1, 1, 1,
-0.007012925, -0.4895558, -0.3934046, 0, 0.9921569, 1, 1,
-0.003423559, -0.5905148, -4.026736, 0, 0.9882353, 1, 1,
-0.000482719, -1.90738, -3.218891, 0, 0.9803922, 1, 1,
0.004053625, -0.8265238, 2.932246, 0, 0.9764706, 1, 1,
0.005710549, 0.8986071, 0.3055422, 0, 0.9686275, 1, 1,
0.008111925, -2.091109, 2.869902, 0, 0.9647059, 1, 1,
0.008295145, -0.341933, 2.758457, 0, 0.9568627, 1, 1,
0.009855753, 0.8174763, -0.2722695, 0, 0.9529412, 1, 1,
0.01066509, 0.7962338, -1.119747, 0, 0.945098, 1, 1,
0.01099382, 0.7882087, 0.09139159, 0, 0.9411765, 1, 1,
0.01359099, 0.3406262, 1.141309, 0, 0.9333333, 1, 1,
0.01873207, 0.4299215, -0.1343165, 0, 0.9294118, 1, 1,
0.02308051, -1.050825, 4.207387, 0, 0.9215686, 1, 1,
0.02451896, -1.317496, 2.028595, 0, 0.9176471, 1, 1,
0.03390887, -0.5954702, 3.235702, 0, 0.9098039, 1, 1,
0.0427189, -1.085455, 2.893993, 0, 0.9058824, 1, 1,
0.04872158, -1.447969, 1.973783, 0, 0.8980392, 1, 1,
0.04878115, -1.689439, 1.559884, 0, 0.8901961, 1, 1,
0.0499862, -1.27854, 3.857133, 0, 0.8862745, 1, 1,
0.05010391, -0.3746551, 1.226056, 0, 0.8784314, 1, 1,
0.0524795, -0.2368574, 2.667217, 0, 0.8745098, 1, 1,
0.05477342, 0.8602311, 0.3013436, 0, 0.8666667, 1, 1,
0.07086778, -1.046123, 2.925008, 0, 0.8627451, 1, 1,
0.07111328, -0.9953502, 4.138617, 0, 0.854902, 1, 1,
0.0741443, -1.093422, 2.130374, 0, 0.8509804, 1, 1,
0.08105997, -0.6599798, 2.728875, 0, 0.8431373, 1, 1,
0.08434357, 0.6185076, 0.4716924, 0, 0.8392157, 1, 1,
0.08436151, 1.232797, 0.03606287, 0, 0.8313726, 1, 1,
0.08463613, 0.4570662, -1.123304, 0, 0.827451, 1, 1,
0.08489745, -0.1700369, 3.589912, 0, 0.8196079, 1, 1,
0.08573972, 0.01999067, 1.409604, 0, 0.8156863, 1, 1,
0.08605173, -0.6645668, 1.722495, 0, 0.8078431, 1, 1,
0.0866662, -0.2119682, 3.564973, 0, 0.8039216, 1, 1,
0.08682235, -0.0172922, 2.341386, 0, 0.7960784, 1, 1,
0.08699919, -0.7056807, 1.2211, 0, 0.7882353, 1, 1,
0.08735382, 0.2046389, 0.8452134, 0, 0.7843137, 1, 1,
0.08803178, -1.24993, 0.7227451, 0, 0.7764706, 1, 1,
0.09435409, -1.833605, 1.598583, 0, 0.772549, 1, 1,
0.09485004, -1.880831, 2.983157, 0, 0.7647059, 1, 1,
0.09515583, 1.078876, 1.166647, 0, 0.7607843, 1, 1,
0.09601215, 0.1435174, 0.9582282, 0, 0.7529412, 1, 1,
0.09640669, 1.425639, 2.540687, 0, 0.7490196, 1, 1,
0.1033469, -1.226011, 4.571021, 0, 0.7411765, 1, 1,
0.1068038, -0.2923702, 1.522676, 0, 0.7372549, 1, 1,
0.1072121, -0.2778178, 2.615502, 0, 0.7294118, 1, 1,
0.1072522, -0.139453, 2.95831, 0, 0.7254902, 1, 1,
0.1088364, -1.642596, 2.991967, 0, 0.7176471, 1, 1,
0.1094405, -0.2599517, 1.977038, 0, 0.7137255, 1, 1,
0.1103606, -0.2546383, 2.278802, 0, 0.7058824, 1, 1,
0.1131534, 0.8724791, 1.018098, 0, 0.6980392, 1, 1,
0.1151832, -1.358587, 3.221236, 0, 0.6941177, 1, 1,
0.1183451, -1.824674, 3.103604, 0, 0.6862745, 1, 1,
0.1204607, -2.193407, 2.282789, 0, 0.682353, 1, 1,
0.1206933, 0.6295859, -1.338684, 0, 0.6745098, 1, 1,
0.121376, -0.1312645, 1.683444, 0, 0.6705883, 1, 1,
0.1238372, -0.03821113, 2.080053, 0, 0.6627451, 1, 1,
0.1306743, -1.591566, 0.8117863, 0, 0.6588235, 1, 1,
0.1395754, 0.6358689, 1.765828, 0, 0.6509804, 1, 1,
0.1399866, -0.2241275, 2.942193, 0, 0.6470588, 1, 1,
0.1418694, 1.270927, 0.7170708, 0, 0.6392157, 1, 1,
0.1426023, -2.750456, 2.49805, 0, 0.6352941, 1, 1,
0.1470806, -0.6581361, 2.506784, 0, 0.627451, 1, 1,
0.1503175, -1.018344, 3.883615, 0, 0.6235294, 1, 1,
0.1512381, -0.8103879, 2.979829, 0, 0.6156863, 1, 1,
0.152452, 0.8748965, 0.9312516, 0, 0.6117647, 1, 1,
0.1565559, -0.1242169, 1.319441, 0, 0.6039216, 1, 1,
0.1619567, -0.5741792, 1.483322, 0, 0.5960785, 1, 1,
0.1637643, -0.799004, 5.072791, 0, 0.5921569, 1, 1,
0.1645905, -1.891247, 2.21265, 0, 0.5843138, 1, 1,
0.16824, 0.5920747, 0.4124306, 0, 0.5803922, 1, 1,
0.1683693, 1.165398, 0.3312803, 0, 0.572549, 1, 1,
0.1689632, -1.927436, 3.200547, 0, 0.5686275, 1, 1,
0.1725632, 0.7314256, 0.5222892, 0, 0.5607843, 1, 1,
0.173096, -0.3947586, 2.246138, 0, 0.5568628, 1, 1,
0.1784656, 0.2934754, 2.218312, 0, 0.5490196, 1, 1,
0.1786339, 0.4960915, 0.6364471, 0, 0.5450981, 1, 1,
0.1799358, 0.4854199, -2.154278, 0, 0.5372549, 1, 1,
0.1874503, -0.389197, 2.481311, 0, 0.5333334, 1, 1,
0.1885408, 0.3555785, 0.1070523, 0, 0.5254902, 1, 1,
0.1896145, 0.392424, -0.1809645, 0, 0.5215687, 1, 1,
0.1916908, 0.1611169, 1.257248, 0, 0.5137255, 1, 1,
0.1922057, -0.3342258, 2.701035, 0, 0.509804, 1, 1,
0.1944204, 0.8028798, -0.2586609, 0, 0.5019608, 1, 1,
0.1953578, 0.436509, -1.117234, 0, 0.4941176, 1, 1,
0.1974524, -0.418565, 3.834523, 0, 0.4901961, 1, 1,
0.2000332, 1.64271, 0.1027026, 0, 0.4823529, 1, 1,
0.2095133, -0.8830582, 2.006315, 0, 0.4784314, 1, 1,
0.2135561, -1.127206, 2.24469, 0, 0.4705882, 1, 1,
0.2144255, -1.984739, 2.887604, 0, 0.4666667, 1, 1,
0.2189329, -0.4473913, 2.773255, 0, 0.4588235, 1, 1,
0.2203168, 1.679613, 0.45454, 0, 0.454902, 1, 1,
0.2222902, 0.1627577, 2.112709, 0, 0.4470588, 1, 1,
0.2246007, 2.071823, 1.263724, 0, 0.4431373, 1, 1,
0.2305707, 0.2177925, 0.2573767, 0, 0.4352941, 1, 1,
0.2390564, 0.06426077, 1.395771, 0, 0.4313726, 1, 1,
0.2507668, -1.201221, 2.902634, 0, 0.4235294, 1, 1,
0.2540675, -1.755935, 1.967708, 0, 0.4196078, 1, 1,
0.2596332, 0.2409175, 0.0708224, 0, 0.4117647, 1, 1,
0.2597441, -0.8192143, 2.576684, 0, 0.4078431, 1, 1,
0.2640286, 0.4266706, 1.772963, 0, 0.4, 1, 1,
0.2653431, 0.2238855, 1.578391, 0, 0.3921569, 1, 1,
0.2692211, -1.223747, 2.667819, 0, 0.3882353, 1, 1,
0.2737769, -0.6352813, 1.696068, 0, 0.3803922, 1, 1,
0.2775455, -1.002461, 1.718258, 0, 0.3764706, 1, 1,
0.278651, 0.4922418, -0.02170819, 0, 0.3686275, 1, 1,
0.2813825, -0.6089079, 2.734676, 0, 0.3647059, 1, 1,
0.2824662, 0.2909693, -0.5284823, 0, 0.3568628, 1, 1,
0.295008, -0.2038188, 1.326378, 0, 0.3529412, 1, 1,
0.2963678, -0.6538777, 2.912956, 0, 0.345098, 1, 1,
0.2965791, 1.264547, 1.292968, 0, 0.3411765, 1, 1,
0.2981987, 1.452284, 0.2926068, 0, 0.3333333, 1, 1,
0.3008608, 2.109082, 0.9201745, 0, 0.3294118, 1, 1,
0.3086859, -0.6359542, 4.048045, 0, 0.3215686, 1, 1,
0.3106226, 1.02442, 1.448879, 0, 0.3176471, 1, 1,
0.3110926, -0.3752021, 1.561067, 0, 0.3098039, 1, 1,
0.3133842, 0.5677974, 0.1160918, 0, 0.3058824, 1, 1,
0.3203754, 1.651723, 0.5935625, 0, 0.2980392, 1, 1,
0.3213353, -0.3125584, 1.459077, 0, 0.2901961, 1, 1,
0.3224853, 0.4758334, 0.7941586, 0, 0.2862745, 1, 1,
0.3227458, -1.170525, 4.093884, 0, 0.2784314, 1, 1,
0.323224, -1.1829, 3.983003, 0, 0.2745098, 1, 1,
0.3245718, 1.610329, -0.04962366, 0, 0.2666667, 1, 1,
0.3263076, -0.78896, 4.090097, 0, 0.2627451, 1, 1,
0.3263859, 0.5913514, -1.435104, 0, 0.254902, 1, 1,
0.3279473, -0.9284598, 3.552632, 0, 0.2509804, 1, 1,
0.3308538, -0.0130108, 2.300929, 0, 0.2431373, 1, 1,
0.3369581, -0.5585133, 1.352619, 0, 0.2392157, 1, 1,
0.3401607, -0.1787644, 2.471806, 0, 0.2313726, 1, 1,
0.3411857, -2.294949, 3.922283, 0, 0.227451, 1, 1,
0.345505, 1.618353, 1.025453, 0, 0.2196078, 1, 1,
0.3469808, 0.4710866, -0.1807737, 0, 0.2156863, 1, 1,
0.3520162, 1.242118, -0.4080568, 0, 0.2078431, 1, 1,
0.3529659, 0.0616836, 0.9204609, 0, 0.2039216, 1, 1,
0.3539422, -1.329454, 3.497722, 0, 0.1960784, 1, 1,
0.3569621, 0.02611308, 0.8321781, 0, 0.1882353, 1, 1,
0.369607, -0.2935968, 3.56773, 0, 0.1843137, 1, 1,
0.3703064, -1.641799, 2.545041, 0, 0.1764706, 1, 1,
0.3740957, 0.04743782, 2.405932, 0, 0.172549, 1, 1,
0.3746618, 0.6736751, 2.307692, 0, 0.1647059, 1, 1,
0.3748399, 1.012109, 1.109815, 0, 0.1607843, 1, 1,
0.3816122, -0.4355693, 2.63903, 0, 0.1529412, 1, 1,
0.3828728, 0.957701, -0.4880612, 0, 0.1490196, 1, 1,
0.3846259, 1.167609, -0.3960432, 0, 0.1411765, 1, 1,
0.387119, -1.874408, 1.558872, 0, 0.1372549, 1, 1,
0.3875586, 0.3534765, 0.9989506, 0, 0.1294118, 1, 1,
0.3882519, 0.522539, 1.189341, 0, 0.1254902, 1, 1,
0.389215, -1.313718, 3.318456, 0, 0.1176471, 1, 1,
0.3933988, -1.683853, 4.259297, 0, 0.1137255, 1, 1,
0.3975298, -0.4909462, 3.706145, 0, 0.1058824, 1, 1,
0.3980526, -1.251338, 1.351604, 0, 0.09803922, 1, 1,
0.3995214, 2.114502, 1.407287, 0, 0.09411765, 1, 1,
0.4040308, 0.1313352, 2.016693, 0, 0.08627451, 1, 1,
0.4045426, 1.166337, -0.906775, 0, 0.08235294, 1, 1,
0.4116145, -0.05607435, 1.524571, 0, 0.07450981, 1, 1,
0.4164456, -0.534367, 1.248857, 0, 0.07058824, 1, 1,
0.4286858, -1.180182, 1.373832, 0, 0.0627451, 1, 1,
0.4311968, 1.705301, 0.04772482, 0, 0.05882353, 1, 1,
0.4331883, 0.5749366, 0.6926181, 0, 0.05098039, 1, 1,
0.4371799, -0.1097393, 2.760726, 0, 0.04705882, 1, 1,
0.4382862, 0.03935662, 1.266216, 0, 0.03921569, 1, 1,
0.4395181, -0.1949638, 0.1587326, 0, 0.03529412, 1, 1,
0.4400583, -1.75466, 2.48227, 0, 0.02745098, 1, 1,
0.4412974, 0.7404314, 0.9683337, 0, 0.02352941, 1, 1,
0.4426033, 1.457526, -0.2855762, 0, 0.01568628, 1, 1,
0.4428796, 0.131985, 3.100623, 0, 0.01176471, 1, 1,
0.4454205, 0.5604703, 1.309759, 0, 0.003921569, 1, 1,
0.4463427, -1.015334, 3.717303, 0.003921569, 0, 1, 1,
0.450498, -0.5773889, 2.978532, 0.007843138, 0, 1, 1,
0.4609129, -1.451674, 2.302254, 0.01568628, 0, 1, 1,
0.4614027, 1.661505, 1.514836, 0.01960784, 0, 1, 1,
0.4618696, 1.254908, 0.6674541, 0.02745098, 0, 1, 1,
0.4620216, -1.641857, 2.805619, 0.03137255, 0, 1, 1,
0.4664341, 0.4883305, -1.003547, 0.03921569, 0, 1, 1,
0.4682462, -0.5034344, 1.757296, 0.04313726, 0, 1, 1,
0.4720054, 1.09482, 1.810995, 0.05098039, 0, 1, 1,
0.4731003, 0.3704283, 1.233141, 0.05490196, 0, 1, 1,
0.4754681, -0.8331415, 1.908068, 0.0627451, 0, 1, 1,
0.4799801, 0.3335363, -0.1727077, 0.06666667, 0, 1, 1,
0.4851179, -1.495595, 2.171844, 0.07450981, 0, 1, 1,
0.4865218, -0.4332428, 0.9921241, 0.07843138, 0, 1, 1,
0.4871536, -0.09876699, 2.451357, 0.08627451, 0, 1, 1,
0.4955361, 0.3256417, 2.013422, 0.09019608, 0, 1, 1,
0.4961064, 0.5713714, 1.082442, 0.09803922, 0, 1, 1,
0.4972957, 1.708813, -0.01842973, 0.1058824, 0, 1, 1,
0.5017575, 1.502708, 0.3983874, 0.1098039, 0, 1, 1,
0.5017791, -0.1711315, 1.618883, 0.1176471, 0, 1, 1,
0.5034066, 0.9147267, 0.2267378, 0.1215686, 0, 1, 1,
0.504462, -0.005030425, 1.63791, 0.1294118, 0, 1, 1,
0.5056982, 0.7163649, 1.439581, 0.1333333, 0, 1, 1,
0.508348, 0.3927788, 1.448556, 0.1411765, 0, 1, 1,
0.5120001, -0.1206746, 2.377364, 0.145098, 0, 1, 1,
0.5136809, -0.1680297, 3.327518, 0.1529412, 0, 1, 1,
0.5161728, 0.2019303, 0.2290336, 0.1568628, 0, 1, 1,
0.5177925, -0.07436215, 0.693715, 0.1647059, 0, 1, 1,
0.5260136, -0.6688051, 2.354661, 0.1686275, 0, 1, 1,
0.5302377, 0.6692387, 0.4111379, 0.1764706, 0, 1, 1,
0.5315706, -0.1608091, 0.7985681, 0.1803922, 0, 1, 1,
0.5318782, 1.61332, -0.5204608, 0.1882353, 0, 1, 1,
0.5325561, -2.260035, 2.936066, 0.1921569, 0, 1, 1,
0.5344413, 0.7852668, -1.677314, 0.2, 0, 1, 1,
0.5370217, 0.01213822, 0.1040517, 0.2078431, 0, 1, 1,
0.5384175, 0.6502097, 0.8801078, 0.2117647, 0, 1, 1,
0.5387177, 1.186987, -1.232139, 0.2196078, 0, 1, 1,
0.539605, 0.5798673, 0.503686, 0.2235294, 0, 1, 1,
0.5396581, 0.2661641, 0.3726508, 0.2313726, 0, 1, 1,
0.5398713, 0.419349, 1.089157, 0.2352941, 0, 1, 1,
0.5401657, -0.2905118, 0.9700531, 0.2431373, 0, 1, 1,
0.5412928, -0.1832188, 1.939543, 0.2470588, 0, 1, 1,
0.5423427, -0.5902102, 2.543201, 0.254902, 0, 1, 1,
0.5447589, -0.250424, -0.1643022, 0.2588235, 0, 1, 1,
0.5464886, 0.801626, 1.10598, 0.2666667, 0, 1, 1,
0.5549606, -0.3600989, 1.776383, 0.2705882, 0, 1, 1,
0.5574067, -0.1718574, 0.545692, 0.2784314, 0, 1, 1,
0.5590856, 0.6136836, 1.275144, 0.282353, 0, 1, 1,
0.5646428, -0.2653265, 3.438564, 0.2901961, 0, 1, 1,
0.5693069, 0.1837462, 0.920441, 0.2941177, 0, 1, 1,
0.5726663, 1.139794, -1.045386, 0.3019608, 0, 1, 1,
0.5751217, 0.987655, 1.49428, 0.3098039, 0, 1, 1,
0.5794253, 1.173125, 0.1463289, 0.3137255, 0, 1, 1,
0.5814166, -0.4194473, 1.78606, 0.3215686, 0, 1, 1,
0.5858853, 0.06060038, 0.5023764, 0.3254902, 0, 1, 1,
0.5915921, 0.8134869, 0.7610582, 0.3333333, 0, 1, 1,
0.5925053, -0.1507346, 2.889959, 0.3372549, 0, 1, 1,
0.5950392, -0.1024781, 2.692909, 0.345098, 0, 1, 1,
0.5960726, 0.1608997, 2.590798, 0.3490196, 0, 1, 1,
0.5979398, -0.5089418, 3.622948, 0.3568628, 0, 1, 1,
0.602823, 0.7430772, 2.569411, 0.3607843, 0, 1, 1,
0.6048773, -0.5812035, 3.759975, 0.3686275, 0, 1, 1,
0.6054676, 0.4682328, 2.215312, 0.372549, 0, 1, 1,
0.6125616, 0.3886424, 1.751839, 0.3803922, 0, 1, 1,
0.6171091, 0.5818622, 0.6540754, 0.3843137, 0, 1, 1,
0.6187045, -1.463884, 1.462145, 0.3921569, 0, 1, 1,
0.6204764, -0.3325312, 1.067644, 0.3960784, 0, 1, 1,
0.6233686, 0.1951483, 0.5234444, 0.4039216, 0, 1, 1,
0.6249348, -0.1950076, 2.766456, 0.4117647, 0, 1, 1,
0.6262017, 0.4663986, 0.6541163, 0.4156863, 0, 1, 1,
0.6286731, 0.421675, 1.35324, 0.4235294, 0, 1, 1,
0.6303726, -0.3129447, 3.347788, 0.427451, 0, 1, 1,
0.6306431, 0.099959, -0.6157075, 0.4352941, 0, 1, 1,
0.6381589, 1.579177, 0.8256385, 0.4392157, 0, 1, 1,
0.6399357, -0.6158372, 2.882171, 0.4470588, 0, 1, 1,
0.6431259, -0.2176088, 3.123294, 0.4509804, 0, 1, 1,
0.6492555, -0.1326563, 0.4634402, 0.4588235, 0, 1, 1,
0.6639559, 1.068566, 0.02271668, 0.4627451, 0, 1, 1,
0.6654816, 0.465634, 1.085278, 0.4705882, 0, 1, 1,
0.6659088, 0.2925365, 1.445629, 0.4745098, 0, 1, 1,
0.6679842, -0.2256543, 1.705763, 0.4823529, 0, 1, 1,
0.6724465, -0.4277106, 3.460202, 0.4862745, 0, 1, 1,
0.6749514, -0.4291002, 2.568977, 0.4941176, 0, 1, 1,
0.6834312, 0.01878809, 1.301673, 0.5019608, 0, 1, 1,
0.6917504, -0.6858068, 3.243241, 0.5058824, 0, 1, 1,
0.6940919, -1.142971, 3.560449, 0.5137255, 0, 1, 1,
0.6948185, -0.5231255, 3.108044, 0.5176471, 0, 1, 1,
0.6957887, 0.4536259, 0.5514881, 0.5254902, 0, 1, 1,
0.7008985, -1.14851, 3.233168, 0.5294118, 0, 1, 1,
0.7032344, -1.733713, 1.939685, 0.5372549, 0, 1, 1,
0.704288, 0.7379647, 0.1670343, 0.5411765, 0, 1, 1,
0.710628, -1.196274, 3.114141, 0.5490196, 0, 1, 1,
0.7111621, -1.28984, 3.267733, 0.5529412, 0, 1, 1,
0.7117473, -0.9060099, 3.177909, 0.5607843, 0, 1, 1,
0.712065, 0.06457958, 3.635082, 0.5647059, 0, 1, 1,
0.7178631, 0.3967138, 1.745196, 0.572549, 0, 1, 1,
0.7213274, -0.2552361, 3.182112, 0.5764706, 0, 1, 1,
0.7216222, 0.3568846, 1.547508, 0.5843138, 0, 1, 1,
0.7226177, 0.06130594, 0.5837983, 0.5882353, 0, 1, 1,
0.7372423, 0.5743276, -0.114611, 0.5960785, 0, 1, 1,
0.7396312, -0.1368143, 2.345287, 0.6039216, 0, 1, 1,
0.7437708, -0.5110503, 3.400262, 0.6078432, 0, 1, 1,
0.7499239, 0.201361, 3.13333, 0.6156863, 0, 1, 1,
0.7499593, -0.09818733, 2.420417, 0.6196079, 0, 1, 1,
0.7533306, 0.5816372, 0.9387192, 0.627451, 0, 1, 1,
0.7611986, 0.6963911, 2.256529, 0.6313726, 0, 1, 1,
0.7671075, -1.088886, 0.9800854, 0.6392157, 0, 1, 1,
0.7674031, 0.3506013, 0.4240882, 0.6431373, 0, 1, 1,
0.7708301, -0.822426, 4.056139, 0.6509804, 0, 1, 1,
0.7725931, -0.1140283, 2.754073, 0.654902, 0, 1, 1,
0.7726229, 0.8783908, 0.4529121, 0.6627451, 0, 1, 1,
0.7816334, -0.2167591, 2.423405, 0.6666667, 0, 1, 1,
0.787762, 0.479421, -0.8678705, 0.6745098, 0, 1, 1,
0.789538, 1.720552, -0.09887514, 0.6784314, 0, 1, 1,
0.7918512, -0.8508788, 2.207228, 0.6862745, 0, 1, 1,
0.792074, 0.9495485, 1.702171, 0.6901961, 0, 1, 1,
0.793042, -1.165098, 1.070394, 0.6980392, 0, 1, 1,
0.7969565, 0.1634847, 1.151492, 0.7058824, 0, 1, 1,
0.7993388, 0.3764953, 0.7274156, 0.7098039, 0, 1, 1,
0.8015986, 0.02180588, -0.1229707, 0.7176471, 0, 1, 1,
0.802086, 0.295328, 1.538575, 0.7215686, 0, 1, 1,
0.8056298, -1.127224, 2.337261, 0.7294118, 0, 1, 1,
0.8063363, -0.6264385, 4.532635, 0.7333333, 0, 1, 1,
0.8068434, -0.378837, 3.130094, 0.7411765, 0, 1, 1,
0.8121696, 1.562387, 1.250589, 0.7450981, 0, 1, 1,
0.8123333, 1.59222, 1.516143, 0.7529412, 0, 1, 1,
0.812791, 0.326341, 1.233639, 0.7568628, 0, 1, 1,
0.8154142, -0.06072884, 0.02320146, 0.7647059, 0, 1, 1,
0.8156822, -0.2291615, 2.165199, 0.7686275, 0, 1, 1,
0.8171131, -0.727676, 1.523159, 0.7764706, 0, 1, 1,
0.821142, -0.627429, 1.757342, 0.7803922, 0, 1, 1,
0.8218378, -0.6498133, 1.650829, 0.7882353, 0, 1, 1,
0.8228657, 0.01874823, 2.579029, 0.7921569, 0, 1, 1,
0.8231696, 1.174072, -0.277583, 0.8, 0, 1, 1,
0.8303419, -1.183935, 1.147276, 0.8078431, 0, 1, 1,
0.8385202, 0.8803684, 0.01021599, 0.8117647, 0, 1, 1,
0.8483249, 0.6214435, 1.202906, 0.8196079, 0, 1, 1,
0.8520747, -1.067051, 1.440933, 0.8235294, 0, 1, 1,
0.8591701, -0.5058652, 1.51692, 0.8313726, 0, 1, 1,
0.8615532, -0.3756157, 2.123289, 0.8352941, 0, 1, 1,
0.8665262, 0.9582699, 0.4409486, 0.8431373, 0, 1, 1,
0.8692951, -1.226538, 1.124963, 0.8470588, 0, 1, 1,
0.8711942, 0.5095209, 0.5854057, 0.854902, 0, 1, 1,
0.8780997, 0.85518, 0.5168276, 0.8588235, 0, 1, 1,
0.8807847, 0.8221123, 1.681118, 0.8666667, 0, 1, 1,
0.8894824, 0.5702756, 1.239468, 0.8705882, 0, 1, 1,
0.8919659, -0.3132458, 0.8076336, 0.8784314, 0, 1, 1,
0.893492, -1.397196, 1.962523, 0.8823529, 0, 1, 1,
0.9033075, -0.5615498, 2.31837, 0.8901961, 0, 1, 1,
0.915234, 0.08254705, 1.78178, 0.8941177, 0, 1, 1,
0.9213407, 0.03685413, 1.235335, 0.9019608, 0, 1, 1,
0.9326721, 0.6664064, 3.236033, 0.9098039, 0, 1, 1,
0.9372469, 1.996764, -0.2415712, 0.9137255, 0, 1, 1,
0.9405091, 1.884732, 1.409866, 0.9215686, 0, 1, 1,
0.9462112, 0.5125796, 0.5462251, 0.9254902, 0, 1, 1,
0.9464157, -1.958295, 4.424569, 0.9333333, 0, 1, 1,
0.949918, -0.2239235, 0.5686795, 0.9372549, 0, 1, 1,
0.9512498, -1.052661, 1.244187, 0.945098, 0, 1, 1,
0.9625108, 1.008637, 1.832071, 0.9490196, 0, 1, 1,
0.9643224, -0.8448999, 2.454436, 0.9568627, 0, 1, 1,
0.965121, -0.5039691, 1.638663, 0.9607843, 0, 1, 1,
0.9679466, 0.07268306, 1.076781, 0.9686275, 0, 1, 1,
0.9686259, -0.1621663, 2.876551, 0.972549, 0, 1, 1,
0.9690664, 0.8849344, -0.3898179, 0.9803922, 0, 1, 1,
0.9755126, -0.181281, 2.241776, 0.9843137, 0, 1, 1,
0.9774449, 1.318456, 1.285466, 0.9921569, 0, 1, 1,
0.9813883, -1.007884, 3.239524, 0.9960784, 0, 1, 1,
0.9859745, 0.9557096, -0.3523798, 1, 0, 0.9960784, 1,
0.9891462, 0.08022732, 2.029195, 1, 0, 0.9882353, 1,
0.9897255, -0.08447436, 1.884649, 1, 0, 0.9843137, 1,
0.9907219, -1.461756, 1.434077, 1, 0, 0.9764706, 1,
0.9949576, -1.704669, 1.878302, 1, 0, 0.972549, 1,
0.9986259, 0.1812261, 3.656521, 1, 0, 0.9647059, 1,
1.00281, 0.3778436, 1.432545, 1, 0, 0.9607843, 1,
1.003875, 0.1714649, -0.64604, 1, 0, 0.9529412, 1,
1.004431, -1.068757, 3.371169, 1, 0, 0.9490196, 1,
1.01169, -0.3631861, 0.9054096, 1, 0, 0.9411765, 1,
1.018681, -0.4876001, 1.9476, 1, 0, 0.9372549, 1,
1.018968, -0.4308911, 2.632017, 1, 0, 0.9294118, 1,
1.019419, -0.4841132, 1.964367, 1, 0, 0.9254902, 1,
1.020142, 0.6822884, 3.745978, 1, 0, 0.9176471, 1,
1.025832, 1.742114, 0.7065948, 1, 0, 0.9137255, 1,
1.026652, 0.2489197, 1.605481, 1, 0, 0.9058824, 1,
1.04149, 0.3408573, 1.430716, 1, 0, 0.9019608, 1,
1.045813, -0.1626521, 2.145065, 1, 0, 0.8941177, 1,
1.046522, -0.5005739, 2.293478, 1, 0, 0.8862745, 1,
1.050163, -0.5470707, 1.803343, 1, 0, 0.8823529, 1,
1.050313, -2.03312, 3.473557, 1, 0, 0.8745098, 1,
1.052068, -1.241269, 2.040135, 1, 0, 0.8705882, 1,
1.057796, 0.3746767, 2.340297, 1, 0, 0.8627451, 1,
1.062471, 0.2624828, 1.519029, 1, 0, 0.8588235, 1,
1.066942, 1.59041, 2.407327, 1, 0, 0.8509804, 1,
1.083174, 0.3731179, 1.227849, 1, 0, 0.8470588, 1,
1.086758, 0.4209292, 1.463082, 1, 0, 0.8392157, 1,
1.087743, 1.874669, 0.2263943, 1, 0, 0.8352941, 1,
1.092683, 1.234687, 0.9938083, 1, 0, 0.827451, 1,
1.095034, 1.47543, 0.9521658, 1, 0, 0.8235294, 1,
1.100792, -0.6611452, 1.756073, 1, 0, 0.8156863, 1,
1.104771, -0.004828857, 1.153582, 1, 0, 0.8117647, 1,
1.105864, 0.3956483, 2.761143, 1, 0, 0.8039216, 1,
1.106439, 1.521061, 1.034976, 1, 0, 0.7960784, 1,
1.11719, 0.7464988, -1.074816, 1, 0, 0.7921569, 1,
1.119761, 0.5192636, 0.4841592, 1, 0, 0.7843137, 1,
1.120049, -0.07270481, 0.4190209, 1, 0, 0.7803922, 1,
1.124469, 0.845769, 0.9637811, 1, 0, 0.772549, 1,
1.128168, 0.5911522, 2.591977, 1, 0, 0.7686275, 1,
1.131739, -0.6709989, 1.977427, 1, 0, 0.7607843, 1,
1.139941, -1.283647, 0.7007885, 1, 0, 0.7568628, 1,
1.140916, 1.056011, -0.2961592, 1, 0, 0.7490196, 1,
1.141535, 0.1187914, 0.2544551, 1, 0, 0.7450981, 1,
1.148026, -0.6223282, 3.190528, 1, 0, 0.7372549, 1,
1.163687, -1.371217, 2.844173, 1, 0, 0.7333333, 1,
1.176591, -1.152046, 2.86619, 1, 0, 0.7254902, 1,
1.184688, -3.491873, 3.520684, 1, 0, 0.7215686, 1,
1.187296, 0.5023896, 1.981827, 1, 0, 0.7137255, 1,
1.190489, -0.5417005, 2.63412, 1, 0, 0.7098039, 1,
1.19581, -0.8269373, 2.378372, 1, 0, 0.7019608, 1,
1.1961, 0.4606124, 2.967792, 1, 0, 0.6941177, 1,
1.196212, -0.121661, 1.846669, 1, 0, 0.6901961, 1,
1.199675, 0.07661708, 2.648309, 1, 0, 0.682353, 1,
1.202605, 0.2485554, 1.701619, 1, 0, 0.6784314, 1,
1.204099, -0.7351628, 1.52713, 1, 0, 0.6705883, 1,
1.209024, 0.756992, 1.528159, 1, 0, 0.6666667, 1,
1.221572, -0.9387139, 2.376438, 1, 0, 0.6588235, 1,
1.223829, 0.1236212, 1.327481, 1, 0, 0.654902, 1,
1.224143, 0.4786687, 0.3977321, 1, 0, 0.6470588, 1,
1.224677, -0.3760642, 2.50864, 1, 0, 0.6431373, 1,
1.231807, 0.1572637, 1.15042, 1, 0, 0.6352941, 1,
1.235061, -0.5957952, 0.5954278, 1, 0, 0.6313726, 1,
1.237229, -1.252814, 3.676488, 1, 0, 0.6235294, 1,
1.254218, -0.8024642, 3.677655, 1, 0, 0.6196079, 1,
1.255954, 0.791429, 1.159729, 1, 0, 0.6117647, 1,
1.26796, -0.3124853, 2.204098, 1, 0, 0.6078432, 1,
1.272064, -1.366863, 1.733644, 1, 0, 0.6, 1,
1.279471, -0.1236918, 0.456551, 1, 0, 0.5921569, 1,
1.282064, 0.3879724, 3.059684, 1, 0, 0.5882353, 1,
1.282656, -0.7016307, 1.254504, 1, 0, 0.5803922, 1,
1.28561, 0.253289, 2.016543, 1, 0, 0.5764706, 1,
1.293043, -0.3709041, 4.197744, 1, 0, 0.5686275, 1,
1.294841, -0.5077231, 3.220585, 1, 0, 0.5647059, 1,
1.296024, 0.4999113, 0.7737981, 1, 0, 0.5568628, 1,
1.311306, 0.8740836, 0.7023169, 1, 0, 0.5529412, 1,
1.317299, 1.043212, -1.091993, 1, 0, 0.5450981, 1,
1.319106, 0.3064184, 2.567063, 1, 0, 0.5411765, 1,
1.324769, -0.2371963, 1.956092, 1, 0, 0.5333334, 1,
1.336572, -0.8479478, 1.791165, 1, 0, 0.5294118, 1,
1.351589, -0.6882336, 3.259732, 1, 0, 0.5215687, 1,
1.363075, 2.13988, 1.279975, 1, 0, 0.5176471, 1,
1.364909, -0.6886432, 0.8015858, 1, 0, 0.509804, 1,
1.380686, 1.093239, 0.2377884, 1, 0, 0.5058824, 1,
1.387823, -0.9427239, 4.156888, 1, 0, 0.4980392, 1,
1.389017, -0.1046427, 1.292984, 1, 0, 0.4901961, 1,
1.391767, -0.5668115, 1.809508, 1, 0, 0.4862745, 1,
1.392225, 0.9216592, 2.316933, 1, 0, 0.4784314, 1,
1.396748, 0.432002, 1.656734, 1, 0, 0.4745098, 1,
1.399221, 0.8966596, 2.115983, 1, 0, 0.4666667, 1,
1.415124, 0.0947251, 0.6210005, 1, 0, 0.4627451, 1,
1.415695, -2.836508, -0.3381432, 1, 0, 0.454902, 1,
1.421019, 0.03091974, 2.307084, 1, 0, 0.4509804, 1,
1.431181, -0.1264848, 2.828554, 1, 0, 0.4431373, 1,
1.437998, 0.2953328, 2.626168, 1, 0, 0.4392157, 1,
1.442869, -0.03291352, 1.976996, 1, 0, 0.4313726, 1,
1.444074, -0.8583485, 2.9905, 1, 0, 0.427451, 1,
1.44614, 2.270955, 0.6753002, 1, 0, 0.4196078, 1,
1.451864, 0.9717693, 1.792513, 1, 0, 0.4156863, 1,
1.454393, -0.4360138, 1.342978, 1, 0, 0.4078431, 1,
1.49327, 1.735674, 2.720265, 1, 0, 0.4039216, 1,
1.499782, 0.4240272, 0.1554367, 1, 0, 0.3960784, 1,
1.499925, 1.162638, 1.755016, 1, 0, 0.3882353, 1,
1.50192, 1.769328, 0.6063624, 1, 0, 0.3843137, 1,
1.507756, -2.780589, 3.487259, 1, 0, 0.3764706, 1,
1.524608, 0.4470938, 2.48663, 1, 0, 0.372549, 1,
1.532838, 1.494923, 1.54723, 1, 0, 0.3647059, 1,
1.536886, 0.05784803, 0.09849221, 1, 0, 0.3607843, 1,
1.543397, 0.3940782, 1.770276, 1, 0, 0.3529412, 1,
1.565381, -0.5004506, 2.738617, 1, 0, 0.3490196, 1,
1.580434, -1.68779, 3.384006, 1, 0, 0.3411765, 1,
1.587692, 0.2582884, 0.6826562, 1, 0, 0.3372549, 1,
1.591317, -0.7050182, 0.9349367, 1, 0, 0.3294118, 1,
1.592618, 0.4551046, 0.8417095, 1, 0, 0.3254902, 1,
1.595219, 1.228999, 0.4334977, 1, 0, 0.3176471, 1,
1.59581, 1.924502, 0.9098437, 1, 0, 0.3137255, 1,
1.607322, -0.1486502, -0.4933909, 1, 0, 0.3058824, 1,
1.653773, 0.1321714, 2.271023, 1, 0, 0.2980392, 1,
1.660335, -0.686621, 1.385101, 1, 0, 0.2941177, 1,
1.676144, 1.372131, -0.07251883, 1, 0, 0.2862745, 1,
1.676366, 1.386775, -1.821337, 1, 0, 0.282353, 1,
1.676814, 0.7626344, 2.585456, 1, 0, 0.2745098, 1,
1.679266, 0.8815368, 1.491825, 1, 0, 0.2705882, 1,
1.691345, 1.639181, 1.52921, 1, 0, 0.2627451, 1,
1.723463, -0.91001, 4.53955, 1, 0, 0.2588235, 1,
1.735286, 1.441242, 1.796519, 1, 0, 0.2509804, 1,
1.736039, 0.4111175, 2.324264, 1, 0, 0.2470588, 1,
1.738314, 0.234771, 2.951724, 1, 0, 0.2392157, 1,
1.758606, 0.1422611, 0.0987286, 1, 0, 0.2352941, 1,
1.764008, 0.3403877, 0.1345268, 1, 0, 0.227451, 1,
1.767496, 0.3616706, -0.8443387, 1, 0, 0.2235294, 1,
1.780193, -1.567118, 1.799963, 1, 0, 0.2156863, 1,
1.780198, -0.7284337, 4.775221, 1, 0, 0.2117647, 1,
1.809402, -0.6651396, 2.205525, 1, 0, 0.2039216, 1,
1.823733, 0.598154, 0.7447577, 1, 0, 0.1960784, 1,
1.826026, -0.8375704, 1.726123, 1, 0, 0.1921569, 1,
1.846489, 3.578298, 1.972499, 1, 0, 0.1843137, 1,
1.852545, 0.4679008, 2.544047, 1, 0, 0.1803922, 1,
1.871869, -0.2121646, 1.83312, 1, 0, 0.172549, 1,
1.888355, -1.794384, 1.814651, 1, 0, 0.1686275, 1,
1.940498, 0.8774557, 0.9530988, 1, 0, 0.1607843, 1,
2.000271, 0.8995752, 2.481259, 1, 0, 0.1568628, 1,
2.019519, -0.6206002, 0.6904202, 1, 0, 0.1490196, 1,
2.032361, -1.616451, 2.201835, 1, 0, 0.145098, 1,
2.045041, 0.9210608, 0.9154404, 1, 0, 0.1372549, 1,
2.047015, 1.032147, 2.519675, 1, 0, 0.1333333, 1,
2.063346, 1.772415, 1.276749, 1, 0, 0.1254902, 1,
2.088185, -0.4288374, 3.07554, 1, 0, 0.1215686, 1,
2.0948, -0.2956762, 1.939036, 1, 0, 0.1137255, 1,
2.109037, 1.270035, 0.3011442, 1, 0, 0.1098039, 1,
2.118258, -0.04879135, 1.918281, 1, 0, 0.1019608, 1,
2.124628, -1.59554, 0.5198442, 1, 0, 0.09411765, 1,
2.159903, -1.289324, 3.284788, 1, 0, 0.09019608, 1,
2.183389, 0.2526029, 0.1040109, 1, 0, 0.08235294, 1,
2.300665, 0.5635481, 2.536632, 1, 0, 0.07843138, 1,
2.309651, 0.1391182, 0.7078846, 1, 0, 0.07058824, 1,
2.337811, -0.4910395, 2.449341, 1, 0, 0.06666667, 1,
2.367777, 0.5113669, 1.867743, 1, 0, 0.05882353, 1,
2.412716, -0.6567352, 2.520088, 1, 0, 0.05490196, 1,
2.419263, -1.475998, 2.394495, 1, 0, 0.04705882, 1,
2.446662, 0.340623, 2.955133, 1, 0, 0.04313726, 1,
2.45932, -1.300887, 2.503711, 1, 0, 0.03529412, 1,
2.55358, -0.7892295, 2.657872, 1, 0, 0.03137255, 1,
2.644488, 0.05094368, 1.357993, 1, 0, 0.02352941, 1,
2.863546, 1.083379, 3.02241, 1, 0, 0.01960784, 1,
3.144665, 0.00203727, 2.365765, 1, 0, 0.01176471, 1,
3.147202, -1.286198, 1.333116, 1, 0, 0.007843138, 1
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
-0.01944745, -4.690267, -7.524401, 0, -0.5, 0.5, 0.5,
-0.01944745, -4.690267, -7.524401, 1, -0.5, 0.5, 0.5,
-0.01944745, -4.690267, -7.524401, 1, 1.5, 0.5, 0.5,
-0.01944745, -4.690267, -7.524401, 0, 1.5, 0.5, 0.5
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
-4.259592, 0.04321241, -7.524401, 0, -0.5, 0.5, 0.5,
-4.259592, 0.04321241, -7.524401, 1, -0.5, 0.5, 0.5,
-4.259592, 0.04321241, -7.524401, 1, 1.5, 0.5, 0.5,
-4.259592, 0.04321241, -7.524401, 0, 1.5, 0.5, 0.5
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
-4.259592, -4.690267, -0.3129261, 0, -0.5, 0.5, 0.5,
-4.259592, -4.690267, -0.3129261, 1, -0.5, 0.5, 0.5,
-4.259592, -4.690267, -0.3129261, 1, 1.5, 0.5, 0.5,
-4.259592, -4.690267, -0.3129261, 0, 1.5, 0.5, 0.5
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
-3, -3.597926, -5.860215,
3, -3.597926, -5.860215,
-3, -3.597926, -5.860215,
-3, -3.779983, -6.137579,
-2, -3.597926, -5.860215,
-2, -3.779983, -6.137579,
-1, -3.597926, -5.860215,
-1, -3.779983, -6.137579,
0, -3.597926, -5.860215,
0, -3.779983, -6.137579,
1, -3.597926, -5.860215,
1, -3.779983, -6.137579,
2, -3.597926, -5.860215,
2, -3.779983, -6.137579,
3, -3.597926, -5.860215,
3, -3.779983, -6.137579
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
-3, -4.144096, -6.692308, 0, -0.5, 0.5, 0.5,
-3, -4.144096, -6.692308, 1, -0.5, 0.5, 0.5,
-3, -4.144096, -6.692308, 1, 1.5, 0.5, 0.5,
-3, -4.144096, -6.692308, 0, 1.5, 0.5, 0.5,
-2, -4.144096, -6.692308, 0, -0.5, 0.5, 0.5,
-2, -4.144096, -6.692308, 1, -0.5, 0.5, 0.5,
-2, -4.144096, -6.692308, 1, 1.5, 0.5, 0.5,
-2, -4.144096, -6.692308, 0, 1.5, 0.5, 0.5,
-1, -4.144096, -6.692308, 0, -0.5, 0.5, 0.5,
-1, -4.144096, -6.692308, 1, -0.5, 0.5, 0.5,
-1, -4.144096, -6.692308, 1, 1.5, 0.5, 0.5,
-1, -4.144096, -6.692308, 0, 1.5, 0.5, 0.5,
0, -4.144096, -6.692308, 0, -0.5, 0.5, 0.5,
0, -4.144096, -6.692308, 1, -0.5, 0.5, 0.5,
0, -4.144096, -6.692308, 1, 1.5, 0.5, 0.5,
0, -4.144096, -6.692308, 0, 1.5, 0.5, 0.5,
1, -4.144096, -6.692308, 0, -0.5, 0.5, 0.5,
1, -4.144096, -6.692308, 1, -0.5, 0.5, 0.5,
1, -4.144096, -6.692308, 1, 1.5, 0.5, 0.5,
1, -4.144096, -6.692308, 0, 1.5, 0.5, 0.5,
2, -4.144096, -6.692308, 0, -0.5, 0.5, 0.5,
2, -4.144096, -6.692308, 1, -0.5, 0.5, 0.5,
2, -4.144096, -6.692308, 1, 1.5, 0.5, 0.5,
2, -4.144096, -6.692308, 0, 1.5, 0.5, 0.5,
3, -4.144096, -6.692308, 0, -0.5, 0.5, 0.5,
3, -4.144096, -6.692308, 1, -0.5, 0.5, 0.5,
3, -4.144096, -6.692308, 1, 1.5, 0.5, 0.5,
3, -4.144096, -6.692308, 0, 1.5, 0.5, 0.5
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
-3.281097, -2, -5.860215,
-3.281097, 2, -5.860215,
-3.281097, -2, -5.860215,
-3.444179, -2, -6.137579,
-3.281097, 0, -5.860215,
-3.444179, 0, -6.137579,
-3.281097, 2, -5.860215,
-3.444179, 2, -6.137579
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
-3.770344, -2, -6.692308, 0, -0.5, 0.5, 0.5,
-3.770344, -2, -6.692308, 1, -0.5, 0.5, 0.5,
-3.770344, -2, -6.692308, 1, 1.5, 0.5, 0.5,
-3.770344, -2, -6.692308, 0, 1.5, 0.5, 0.5,
-3.770344, 0, -6.692308, 0, -0.5, 0.5, 0.5,
-3.770344, 0, -6.692308, 1, -0.5, 0.5, 0.5,
-3.770344, 0, -6.692308, 1, 1.5, 0.5, 0.5,
-3.770344, 0, -6.692308, 0, 1.5, 0.5, 0.5,
-3.770344, 2, -6.692308, 0, -0.5, 0.5, 0.5,
-3.770344, 2, -6.692308, 1, -0.5, 0.5, 0.5,
-3.770344, 2, -6.692308, 1, 1.5, 0.5, 0.5,
-3.770344, 2, -6.692308, 0, 1.5, 0.5, 0.5
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
-3.281097, -3.597926, -4,
-3.281097, -3.597926, 4,
-3.281097, -3.597926, -4,
-3.444179, -3.779983, -4,
-3.281097, -3.597926, -2,
-3.444179, -3.779983, -2,
-3.281097, -3.597926, 0,
-3.444179, -3.779983, 0,
-3.281097, -3.597926, 2,
-3.444179, -3.779983, 2,
-3.281097, -3.597926, 4,
-3.444179, -3.779983, 4
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
-3.770344, -4.144096, -4, 0, -0.5, 0.5, 0.5,
-3.770344, -4.144096, -4, 1, -0.5, 0.5, 0.5,
-3.770344, -4.144096, -4, 1, 1.5, 0.5, 0.5,
-3.770344, -4.144096, -4, 0, 1.5, 0.5, 0.5,
-3.770344, -4.144096, -2, 0, -0.5, 0.5, 0.5,
-3.770344, -4.144096, -2, 1, -0.5, 0.5, 0.5,
-3.770344, -4.144096, -2, 1, 1.5, 0.5, 0.5,
-3.770344, -4.144096, -2, 0, 1.5, 0.5, 0.5,
-3.770344, -4.144096, 0, 0, -0.5, 0.5, 0.5,
-3.770344, -4.144096, 0, 1, -0.5, 0.5, 0.5,
-3.770344, -4.144096, 0, 1, 1.5, 0.5, 0.5,
-3.770344, -4.144096, 0, 0, 1.5, 0.5, 0.5,
-3.770344, -4.144096, 2, 0, -0.5, 0.5, 0.5,
-3.770344, -4.144096, 2, 1, -0.5, 0.5, 0.5,
-3.770344, -4.144096, 2, 1, 1.5, 0.5, 0.5,
-3.770344, -4.144096, 2, 0, 1.5, 0.5, 0.5,
-3.770344, -4.144096, 4, 0, -0.5, 0.5, 0.5,
-3.770344, -4.144096, 4, 1, -0.5, 0.5, 0.5,
-3.770344, -4.144096, 4, 1, 1.5, 0.5, 0.5,
-3.770344, -4.144096, 4, 0, 1.5, 0.5, 0.5
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
-3.281097, -3.597926, -5.860215,
-3.281097, 3.684351, -5.860215,
-3.281097, -3.597926, 5.234363,
-3.281097, 3.684351, 5.234363,
-3.281097, -3.597926, -5.860215,
-3.281097, -3.597926, 5.234363,
-3.281097, 3.684351, -5.860215,
-3.281097, 3.684351, 5.234363,
-3.281097, -3.597926, -5.860215,
3.242202, -3.597926, -5.860215,
-3.281097, -3.597926, 5.234363,
3.242202, -3.597926, 5.234363,
-3.281097, 3.684351, -5.860215,
3.242202, 3.684351, -5.860215,
-3.281097, 3.684351, 5.234363,
3.242202, 3.684351, 5.234363,
3.242202, -3.597926, -5.860215,
3.242202, 3.684351, -5.860215,
3.242202, -3.597926, 5.234363,
3.242202, 3.684351, 5.234363,
3.242202, -3.597926, -5.860215,
3.242202, -3.597926, 5.234363,
3.242202, 3.684351, -5.860215,
3.242202, 3.684351, 5.234363
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
var radius = 7.896319;
var distance = 35.13161;
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
mvMatrix.translate( 0.01944745, -0.04321241, 0.3129261 );
mvMatrix.scale( 1.308794, 1.172388, 0.769534 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.13161);
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
thiophene-2-carboxyl<-read.table("thiophene-2-carboxyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiophene-2-carboxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiophene' not found
```

```r
y<-thiophene-2-carboxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiophene' not found
```

```r
z<-thiophene-2-carboxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiophene' not found
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
-3.186097, 0.5685751, -1.391452, 0, 0, 1, 1, 1,
-3.163628, -0.1947272, -2.82537, 1, 0, 0, 1, 1,
-2.909533, -0.3896332, -0.738332, 1, 0, 0, 1, 1,
-2.712796, -0.703311, -3.459901, 1, 0, 0, 1, 1,
-2.614904, 0.3391837, 0.9959717, 1, 0, 0, 1, 1,
-2.536974, 1.495684, -1.352699, 1, 0, 0, 1, 1,
-2.521942, 1.362752, -2.496293, 0, 0, 0, 1, 1,
-2.508898, -1.512972, -3.152246, 0, 0, 0, 1, 1,
-2.362623, 0.2598311, -1.697585, 0, 0, 0, 1, 1,
-2.352102, -0.6765443, -2.503184, 0, 0, 0, 1, 1,
-2.344409, 2.018309, 0.8401685, 0, 0, 0, 1, 1,
-2.32208, -0.398365, -0.1847366, 0, 0, 0, 1, 1,
-2.307068, -1.345944, -3.473358, 0, 0, 0, 1, 1,
-2.292223, 0.189546, -1.025356, 1, 1, 1, 1, 1,
-2.279777, 0.1788945, -0.06598537, 1, 1, 1, 1, 1,
-2.228876, -0.738133, -1.074605, 1, 1, 1, 1, 1,
-2.227731, 0.1670376, -0.4766685, 1, 1, 1, 1, 1,
-2.227722, -2.175462, -3.325981, 1, 1, 1, 1, 1,
-2.206558, 0.3521062, 0.961533, 1, 1, 1, 1, 1,
-2.200579, -1.519455, -1.601751, 1, 1, 1, 1, 1,
-2.186333, 0.7556205, -2.797134, 1, 1, 1, 1, 1,
-2.102308, 0.2969448, -0.3919525, 1, 1, 1, 1, 1,
-2.086364, -0.5569071, -1.702507, 1, 1, 1, 1, 1,
-2.069061, 0.4468767, -1.056075, 1, 1, 1, 1, 1,
-2.06195, -0.3219293, -1.873232, 1, 1, 1, 1, 1,
-2.045701, -0.9426832, -1.257488, 1, 1, 1, 1, 1,
-2.03573, 0.4318162, -1.695192, 1, 1, 1, 1, 1,
-2.029732, 0.2811866, -0.3603183, 1, 1, 1, 1, 1,
-2.027795, 0.708598, -1.07135, 0, 0, 1, 1, 1,
-1.992302, -0.4054838, -0.8622562, 1, 0, 0, 1, 1,
-1.97506, 0.1567957, -1.006414, 1, 0, 0, 1, 1,
-1.964017, 0.007752333, -0.3806583, 1, 0, 0, 1, 1,
-1.963258, -0.819176, -1.336199, 1, 0, 0, 1, 1,
-1.959853, 1.911732, 0.7574303, 1, 0, 0, 1, 1,
-1.953801, 1.458523, -1.131242, 0, 0, 0, 1, 1,
-1.89842, 0.4227072, -0.4468262, 0, 0, 0, 1, 1,
-1.893713, -0.1722818, -1.506092, 0, 0, 0, 1, 1,
-1.881178, -1.203228, -0.8111874, 0, 0, 0, 1, 1,
-1.871464, 0.4611057, -2.04806, 0, 0, 0, 1, 1,
-1.859393, 1.123883, -1.674594, 0, 0, 0, 1, 1,
-1.848502, 0.461421, -0.8523386, 0, 0, 0, 1, 1,
-1.841602, -0.5707116, -3.60182, 1, 1, 1, 1, 1,
-1.832839, 0.8988542, -0.6730406, 1, 1, 1, 1, 1,
-1.831263, -0.04964478, -1.34154, 1, 1, 1, 1, 1,
-1.815256, 1.712495, -0.4380963, 1, 1, 1, 1, 1,
-1.791223, -1.276592, -2.240857, 1, 1, 1, 1, 1,
-1.768064, 1.060104, -0.4648229, 1, 1, 1, 1, 1,
-1.76256, 2.134425, -1.422397, 1, 1, 1, 1, 1,
-1.757199, 0.1287073, -0.7239386, 1, 1, 1, 1, 1,
-1.745495, -0.2086665, -0.2537129, 1, 1, 1, 1, 1,
-1.743663, -0.2044708, -2.921874, 1, 1, 1, 1, 1,
-1.742784, 1.722631, 0.1020251, 1, 1, 1, 1, 1,
-1.734238, 1.155, -1.426368, 1, 1, 1, 1, 1,
-1.732342, -0.397049, -0.9930584, 1, 1, 1, 1, 1,
-1.724753, 0.123594, -0.8653398, 1, 1, 1, 1, 1,
-1.717948, -1.141169, -1.223858, 1, 1, 1, 1, 1,
-1.703127, 1.178949, -2.7003, 0, 0, 1, 1, 1,
-1.678999, -0.9865047, -4.415547, 1, 0, 0, 1, 1,
-1.678089, 0.1607809, -0.8916218, 1, 0, 0, 1, 1,
-1.669051, 0.684733, -0.7943384, 1, 0, 0, 1, 1,
-1.649739, 0.1774457, -2.421985, 1, 0, 0, 1, 1,
-1.64685, 0.9409443, 0.3271909, 1, 0, 0, 1, 1,
-1.622669, 1.832747, -0.7603711, 0, 0, 0, 1, 1,
-1.619604, -0.004858851, -2.232948, 0, 0, 0, 1, 1,
-1.611106, -0.6166673, -3.041309, 0, 0, 0, 1, 1,
-1.609016, -1.327587, -2.055207, 0, 0, 0, 1, 1,
-1.606454, 0.4483458, -2.3926, 0, 0, 0, 1, 1,
-1.594015, 0.5930977, -0.8827186, 0, 0, 0, 1, 1,
-1.580739, -1.150267, -0.7208341, 0, 0, 0, 1, 1,
-1.576685, 0.1521805, -1.599238, 1, 1, 1, 1, 1,
-1.571031, -0.3247894, -1.31166, 1, 1, 1, 1, 1,
-1.569389, -0.4954014, -1.774538, 1, 1, 1, 1, 1,
-1.538003, -2.933287, -2.612259, 1, 1, 1, 1, 1,
-1.536843, -0.08782125, -2.837476, 1, 1, 1, 1, 1,
-1.52335, -1.053162, -4.149774, 1, 1, 1, 1, 1,
-1.522021, 0.04284639, -1.450333, 1, 1, 1, 1, 1,
-1.51304, -0.5246597, -1.495536, 1, 1, 1, 1, 1,
-1.512988, 0.3127252, -1.220636, 1, 1, 1, 1, 1,
-1.512533, 1.329066, -1.284725, 1, 1, 1, 1, 1,
-1.501726, -1.030054, -0.393066, 1, 1, 1, 1, 1,
-1.494748, -0.9234467, -4.734523, 1, 1, 1, 1, 1,
-1.478601, -1.051029, -1.758518, 1, 1, 1, 1, 1,
-1.467388, 0.3441732, -2.205184, 1, 1, 1, 1, 1,
-1.462009, 1.673966, -1.957082, 1, 1, 1, 1, 1,
-1.458773, -0.2561566, -1.262896, 0, 0, 1, 1, 1,
-1.456324, 0.3090371, -2.137345, 1, 0, 0, 1, 1,
-1.449934, -0.4484807, -2.159394, 1, 0, 0, 1, 1,
-1.446088, 1.099672, -1.090634, 1, 0, 0, 1, 1,
-1.442669, -0.943825, -2.973197, 1, 0, 0, 1, 1,
-1.441749, 0.4763873, 1.441263, 1, 0, 0, 1, 1,
-1.43298, 1.154767, -1.627855, 0, 0, 0, 1, 1,
-1.419093, -0.3874158, -3.146713, 0, 0, 0, 1, 1,
-1.41402, -1.169213, -2.264308, 0, 0, 0, 1, 1,
-1.410414, -0.7655021, -0.5469218, 0, 0, 0, 1, 1,
-1.404141, -0.5339559, -0.709516, 0, 0, 0, 1, 1,
-1.397031, 1.15954, 0.01504607, 0, 0, 0, 1, 1,
-1.393974, -0.6627975, -1.782211, 0, 0, 0, 1, 1,
-1.389701, -0.7722898, -2.357944, 1, 1, 1, 1, 1,
-1.388128, -0.5526173, -2.51128, 1, 1, 1, 1, 1,
-1.383717, -0.7798967, -0.9922888, 1, 1, 1, 1, 1,
-1.380462, 1.603728, -0.9418374, 1, 1, 1, 1, 1,
-1.371971, 0.43971, 0.09802262, 1, 1, 1, 1, 1,
-1.370518, -0.2670278, -2.760034, 1, 1, 1, 1, 1,
-1.369466, 1.094707, -0.35564, 1, 1, 1, 1, 1,
-1.357938, 0.7861139, -1.28883, 1, 1, 1, 1, 1,
-1.356012, 0.8038685, -0.3338151, 1, 1, 1, 1, 1,
-1.355911, 1.17998, 1.42174, 1, 1, 1, 1, 1,
-1.349317, -1.207554, -2.992291, 1, 1, 1, 1, 1,
-1.325199, 0.7040395, -0.2023757, 1, 1, 1, 1, 1,
-1.318577, 1.268412, -1.346999, 1, 1, 1, 1, 1,
-1.309104, 0.4405804, -1.660452, 1, 1, 1, 1, 1,
-1.307907, 0.7582989, -2.282048, 1, 1, 1, 1, 1,
-1.300281, 0.5142111, 0.5724105, 0, 0, 1, 1, 1,
-1.27559, -0.5235029, -3.085521, 1, 0, 0, 1, 1,
-1.272373, -0.04956957, -1.419769, 1, 0, 0, 1, 1,
-1.265861, 0.6924435, -0.1306308, 1, 0, 0, 1, 1,
-1.260747, -1.579636, -2.58399, 1, 0, 0, 1, 1,
-1.257986, 0.3297102, -1.590417, 1, 0, 0, 1, 1,
-1.2512, 1.111162, -1.418403, 0, 0, 0, 1, 1,
-1.249586, 1.926952, 1.721461, 0, 0, 0, 1, 1,
-1.245579, -0.01850607, -2.034927, 0, 0, 0, 1, 1,
-1.244261, 0.08454452, -2.708593, 0, 0, 0, 1, 1,
-1.243854, -2.427903, -1.088797, 0, 0, 0, 1, 1,
-1.236703, 0.1799039, -1.574808, 0, 0, 0, 1, 1,
-1.2307, -0.9763025, -2.909608, 0, 0, 0, 1, 1,
-1.229852, -0.5233176, -2.684789, 1, 1, 1, 1, 1,
-1.225772, -0.2478082, -0.9784829, 1, 1, 1, 1, 1,
-1.225377, -0.2397586, -0.5328754, 1, 1, 1, 1, 1,
-1.222036, 0.6714182, -1.545992, 1, 1, 1, 1, 1,
-1.220977, -0.9087259, -2.685613, 1, 1, 1, 1, 1,
-1.21927, 0.4623001, -2.967315, 1, 1, 1, 1, 1,
-1.210955, -0.05966717, -2.880308, 1, 1, 1, 1, 1,
-1.197525, -0.2137298, -3.912278, 1, 1, 1, 1, 1,
-1.183095, -1.306019, -3.285727, 1, 1, 1, 1, 1,
-1.173562, -1.222965, -3.682463, 1, 1, 1, 1, 1,
-1.171657, -0.9859896, -2.212014, 1, 1, 1, 1, 1,
-1.169331, -0.4805006, -3.65365, 1, 1, 1, 1, 1,
-1.164458, -0.2007495, -1.160616, 1, 1, 1, 1, 1,
-1.16021, -0.1826378, -1.80003, 1, 1, 1, 1, 1,
-1.157166, -0.09685671, -2.00413, 1, 1, 1, 1, 1,
-1.142212, 1.209583, -0.621496, 0, 0, 1, 1, 1,
-1.138746, 1.019002, 1.363111, 1, 0, 0, 1, 1,
-1.133842, -0.1473445, -0.6593161, 1, 0, 0, 1, 1,
-1.124828, -0.0596307, -2.512568, 1, 0, 0, 1, 1,
-1.124241, 0.563514, -2.354788, 1, 0, 0, 1, 1,
-1.116486, -0.6180686, -2.064459, 1, 0, 0, 1, 1,
-1.114376, 1.170724, -0.2321951, 0, 0, 0, 1, 1,
-1.111543, 0.8302419, -0.2686583, 0, 0, 0, 1, 1,
-1.104553, -2.317806, -5.302565, 0, 0, 0, 1, 1,
-1.100007, -1.00719, -3.470714, 0, 0, 0, 1, 1,
-1.093915, 0.3206843, -0.662699, 0, 0, 0, 1, 1,
-1.09356, 0.4821822, -1.702241, 0, 0, 0, 1, 1,
-1.066552, 1.039187, -1.569718, 0, 0, 0, 1, 1,
-1.061853, 0.03390404, 0.6252422, 1, 1, 1, 1, 1,
-1.058934, 0.673574, -0.8403375, 1, 1, 1, 1, 1,
-1.058035, -0.2839767, -2.366074, 1, 1, 1, 1, 1,
-1.055818, 2.019424, -0.3450602, 1, 1, 1, 1, 1,
-1.053065, 0.2003598, -1.065454, 1, 1, 1, 1, 1,
-1.050228, 1.198344, -0.3562493, 1, 1, 1, 1, 1,
-1.047633, -1.722659, -0.806167, 1, 1, 1, 1, 1,
-1.041415, -0.5691578, -0.8666682, 1, 1, 1, 1, 1,
-1.029297, -0.6007737, -0.9035886, 1, 1, 1, 1, 1,
-1.029123, 0.3084392, -2.260372, 1, 1, 1, 1, 1,
-1.02737, -0.3830594, -0.9355112, 1, 1, 1, 1, 1,
-1.026884, 0.09612248, -2.134084, 1, 1, 1, 1, 1,
-1.024179, 0.444839, -0.9875655, 1, 1, 1, 1, 1,
-1.022287, 0.2001819, -0.8448326, 1, 1, 1, 1, 1,
-1.015346, 1.989974, 0.5192232, 1, 1, 1, 1, 1,
-1.010893, 1.124229, 0.0002802756, 0, 0, 1, 1, 1,
-1.010558, 0.2437763, -0.249923, 1, 0, 0, 1, 1,
-1.007919, -0.3965491, -0.7208842, 1, 0, 0, 1, 1,
-0.9985624, 0.1298349, -0.4644674, 1, 0, 0, 1, 1,
-0.9980966, -0.1123643, -2.674903, 1, 0, 0, 1, 1,
-0.9909648, -1.323463, -2.257889, 1, 0, 0, 1, 1,
-0.9875121, 0.2935533, -0.5951737, 0, 0, 0, 1, 1,
-0.9778867, 0.2691952, -1.485074, 0, 0, 0, 1, 1,
-0.9757371, -0.6361689, -1.258411, 0, 0, 0, 1, 1,
-0.9738092, 0.5621733, -0.7212292, 0, 0, 0, 1, 1,
-0.962413, 0.4443441, -0.3627273, 0, 0, 0, 1, 1,
-0.9587143, -0.3607045, -1.875605, 0, 0, 0, 1, 1,
-0.9488595, -2.025808, -1.725361, 0, 0, 0, 1, 1,
-0.9312825, 0.337582, -1.536256, 1, 1, 1, 1, 1,
-0.9238034, 0.2780807, -1.703426, 1, 1, 1, 1, 1,
-0.9225804, 0.1947711, -1.097202, 1, 1, 1, 1, 1,
-0.9156533, -2.041825, -1.54546, 1, 1, 1, 1, 1,
-0.9091336, 1.641094, -0.8857423, 1, 1, 1, 1, 1,
-0.9033037, 0.3650516, -1.672776, 1, 1, 1, 1, 1,
-0.9017652, -0.04927085, -0.3992332, 1, 1, 1, 1, 1,
-0.8954263, 1.629428, 0.8570208, 1, 1, 1, 1, 1,
-0.889686, -1.681308, -3.514546, 1, 1, 1, 1, 1,
-0.8882446, -0.5370882, -3.416753, 1, 1, 1, 1, 1,
-0.8878131, 0.9033405, -1.013749, 1, 1, 1, 1, 1,
-0.8850391, 0.6774849, -1.666096, 1, 1, 1, 1, 1,
-0.884484, 0.3352576, -1.112798, 1, 1, 1, 1, 1,
-0.8842056, -0.3926862, -1.09172, 1, 1, 1, 1, 1,
-0.8840023, 0.492865, 1.411528, 1, 1, 1, 1, 1,
-0.8748032, -0.7889737, -4.363065, 0, 0, 1, 1, 1,
-0.8742352, -0.9125512, -2.098769, 1, 0, 0, 1, 1,
-0.8691565, -1.003106, -1.439614, 1, 0, 0, 1, 1,
-0.8689301, -3.029902, -2.706385, 1, 0, 0, 1, 1,
-0.8618578, 1.306503, -2.713505, 1, 0, 0, 1, 1,
-0.8584856, -0.7097483, -1.323133, 1, 0, 0, 1, 1,
-0.8558133, 0.1929836, -0.4280863, 0, 0, 0, 1, 1,
-0.8542156, 0.858819, -1.448272, 0, 0, 0, 1, 1,
-0.8538617, -1.655235, -2.53332, 0, 0, 0, 1, 1,
-0.846155, 0.2733205, -1.332028, 0, 0, 0, 1, 1,
-0.8398054, 0.965143, -1.233483, 0, 0, 0, 1, 1,
-0.8377334, 0.3283074, -0.2974261, 0, 0, 0, 1, 1,
-0.8370485, 0.8270717, -2.069502, 0, 0, 0, 1, 1,
-0.8365041, 0.8483302, -1.715586, 1, 1, 1, 1, 1,
-0.822565, 0.009786565, -0.9245225, 1, 1, 1, 1, 1,
-0.8218532, -1.470727, -3.939018, 1, 1, 1, 1, 1,
-0.8195899, 0.4063035, -1.529152, 1, 1, 1, 1, 1,
-0.8181445, -0.221735, -1.915512, 1, 1, 1, 1, 1,
-0.8147746, 1.053908, -1.133295, 1, 1, 1, 1, 1,
-0.8126056, 0.2673716, -1.394375, 1, 1, 1, 1, 1,
-0.8119912, -1.063236, -1.924257, 1, 1, 1, 1, 1,
-0.8119058, 1.648012, -0.2277034, 1, 1, 1, 1, 1,
-0.8110015, -0.1305762, -2.203075, 1, 1, 1, 1, 1,
-0.80943, 1.393637, 0.6516302, 1, 1, 1, 1, 1,
-0.8090411, 0.80371, -0.3410758, 1, 1, 1, 1, 1,
-0.8056093, 1.378617, -0.4601291, 1, 1, 1, 1, 1,
-0.8050907, -1.820246, -2.166569, 1, 1, 1, 1, 1,
-0.7904098, -2.522611, -2.275872, 1, 1, 1, 1, 1,
-0.7887216, -1.82472, -2.029274, 0, 0, 1, 1, 1,
-0.7839229, -0.06518907, -2.475682, 1, 0, 0, 1, 1,
-0.7791169, 1.687949, -1.591654, 1, 0, 0, 1, 1,
-0.7730324, 0.2965668, -1.684108, 1, 0, 0, 1, 1,
-0.7715464, 0.3685946, -2.506886, 1, 0, 0, 1, 1,
-0.7698269, -1.039946, -2.628555, 1, 0, 0, 1, 1,
-0.7669178, 0.7585721, -2.516182, 0, 0, 0, 1, 1,
-0.7627845, -0.272155, -2.22444, 0, 0, 0, 1, 1,
-0.7612903, -0.4183314, -2.238189, 0, 0, 0, 1, 1,
-0.7580377, -0.4465694, -0.9621838, 0, 0, 0, 1, 1,
-0.7553381, 0.733254, -1.974455, 0, 0, 0, 1, 1,
-0.7479011, -0.5905896, -1.846776, 0, 0, 0, 1, 1,
-0.7395035, 0.6781332, -0.009998336, 0, 0, 0, 1, 1,
-0.7382025, -0.7314201, -1.763274, 1, 1, 1, 1, 1,
-0.7374792, 0.3020156, -0.8607119, 1, 1, 1, 1, 1,
-0.7335314, 1.955381, -0.2127179, 1, 1, 1, 1, 1,
-0.7283397, 1.371172, -0.5909196, 1, 1, 1, 1, 1,
-0.7269737, 0.9650995, -0.7759417, 1, 1, 1, 1, 1,
-0.7178266, 0.1249803, -0.7656975, 1, 1, 1, 1, 1,
-0.716791, -0.01181334, -1.505259, 1, 1, 1, 1, 1,
-0.7144386, -0.865895, -2.398462, 1, 1, 1, 1, 1,
-0.7118445, 0.3546235, -3.378893, 1, 1, 1, 1, 1,
-0.7036215, -1.83773, -2.739478, 1, 1, 1, 1, 1,
-0.7020104, 0.8066918, -0.702866, 1, 1, 1, 1, 1,
-0.7009652, 0.09730612, -2.086321, 1, 1, 1, 1, 1,
-0.6990752, 0.1434377, -1.66894, 1, 1, 1, 1, 1,
-0.6979891, -1.790617, -2.327353, 1, 1, 1, 1, 1,
-0.6941032, 0.7864224, -0.7550106, 1, 1, 1, 1, 1,
-0.6923633, -1.443066, -3.000194, 0, 0, 1, 1, 1,
-0.6895039, -0.2510227, -2.637876, 1, 0, 0, 1, 1,
-0.6876818, 0.5155407, -0.02782536, 1, 0, 0, 1, 1,
-0.679332, -1.482591, -3.476841, 1, 0, 0, 1, 1,
-0.6769767, -0.01255005, -2.273464, 1, 0, 0, 1, 1,
-0.6730345, -0.08326298, -0.7042863, 1, 0, 0, 1, 1,
-0.6720442, -0.4639517, -3.302886, 0, 0, 0, 1, 1,
-0.670522, -0.6637316, -1.586526, 0, 0, 0, 1, 1,
-0.665588, 1.087332, -0.7909501, 0, 0, 0, 1, 1,
-0.6628342, 0.6992025, -0.4080097, 0, 0, 0, 1, 1,
-0.6589687, 0.5161054, -1.624659, 0, 0, 0, 1, 1,
-0.6539726, -2.101863, -5.55973, 0, 0, 0, 1, 1,
-0.651692, -0.1409743, -2.942005, 0, 0, 0, 1, 1,
-0.6420983, 0.3477774, -1.409169, 1, 1, 1, 1, 1,
-0.6398814, 1.547074, -1.958936, 1, 1, 1, 1, 1,
-0.631579, 0.1575882, -0.5832475, 1, 1, 1, 1, 1,
-0.6265955, -0.5907943, -3.203509, 1, 1, 1, 1, 1,
-0.6258444, -0.3467374, -2.506329, 1, 1, 1, 1, 1,
-0.6209084, 0.2362064, -0.4331406, 1, 1, 1, 1, 1,
-0.6179345, 1.046783, -0.1317155, 1, 1, 1, 1, 1,
-0.6168741, 0.7264454, -1.16005, 1, 1, 1, 1, 1,
-0.6159751, 0.4537989, -1.33946, 1, 1, 1, 1, 1,
-0.6126406, 0.2704896, 0.2859455, 1, 1, 1, 1, 1,
-0.6092033, 0.5152833, -0.7262757, 1, 1, 1, 1, 1,
-0.6084834, -1.794117, -4.550719, 1, 1, 1, 1, 1,
-0.6067749, -0.7137654, 0.3771961, 1, 1, 1, 1, 1,
-0.6049516, 0.4208061, -2.731215, 1, 1, 1, 1, 1,
-0.601265, 0.3114399, -0.7141668, 1, 1, 1, 1, 1,
-0.6006899, -1.870983, -3.554909, 0, 0, 1, 1, 1,
-0.5955001, -2.415333, -2.073344, 1, 0, 0, 1, 1,
-0.5944017, 0.4145537, -1.587482, 1, 0, 0, 1, 1,
-0.5927091, -0.6314798, -3.050938, 1, 0, 0, 1, 1,
-0.5925787, 0.3305162, -1.081476, 1, 0, 0, 1, 1,
-0.5906006, -1.263255, -1.941787, 1, 0, 0, 1, 1,
-0.5851261, 1.974936, -1.568678, 0, 0, 0, 1, 1,
-0.5822273, -0.5020261, -3.508162, 0, 0, 0, 1, 1,
-0.5817428, -0.1154514, -0.5163953, 0, 0, 0, 1, 1,
-0.5802073, 0.4488806, -1.421598, 0, 0, 0, 1, 1,
-0.5797763, -0.01427108, -0.337469, 0, 0, 0, 1, 1,
-0.5771512, 0.2529533, -1.308936, 0, 0, 0, 1, 1,
-0.5762777, -0.5703127, -2.153926, 0, 0, 0, 1, 1,
-0.5670737, -1.952129, -4.360432, 1, 1, 1, 1, 1,
-0.5665392, -0.6109766, -3.000797, 1, 1, 1, 1, 1,
-0.5646999, 0.2845458, -0.4556351, 1, 1, 1, 1, 1,
-0.5641833, -0.3095649, -0.9329857, 1, 1, 1, 1, 1,
-0.556548, -0.5345253, -2.391816, 1, 1, 1, 1, 1,
-0.5561339, 0.891158, 1.518789, 1, 1, 1, 1, 1,
-0.5478719, -0.1531444, -2.663496, 1, 1, 1, 1, 1,
-0.5445444, 0.3895545, 1.192042, 1, 1, 1, 1, 1,
-0.5435757, 0.7250812, -0.6852639, 1, 1, 1, 1, 1,
-0.5424969, -1.118977, -1.38511, 1, 1, 1, 1, 1,
-0.5414184, 0.5726478, -2.727686, 1, 1, 1, 1, 1,
-0.5412043, 2.180754, 0.3249713, 1, 1, 1, 1, 1,
-0.5333123, 0.7422979, -1.310046, 1, 1, 1, 1, 1,
-0.5301799, 2.342188, -1.411962, 1, 1, 1, 1, 1,
-0.5238782, -0.7528511, -2.694219, 1, 1, 1, 1, 1,
-0.523167, -0.07532796, -1.034891, 0, 0, 1, 1, 1,
-0.522868, -1.033349, -1.89659, 1, 0, 0, 1, 1,
-0.5091836, 0.04396147, -0.2453902, 1, 0, 0, 1, 1,
-0.5009882, -1.316774, -4.323526, 1, 0, 0, 1, 1,
-0.5005419, 1.15856, -0.7088572, 1, 0, 0, 1, 1,
-0.4996741, -1.412129, -4.13781, 1, 0, 0, 1, 1,
-0.4963439, -0.425479, -1.238374, 0, 0, 0, 1, 1,
-0.4939669, -0.4320435, -2.194582, 0, 0, 0, 1, 1,
-0.4900891, 1.483439, -0.5976896, 0, 0, 0, 1, 1,
-0.4889546, 1.263775, -0.3855459, 0, 0, 0, 1, 1,
-0.4811292, -0.0748262, -1.750012, 0, 0, 0, 1, 1,
-0.4805284, -0.2722111, -2.300207, 0, 0, 0, 1, 1,
-0.4790429, -2.098936, -1.760047, 0, 0, 0, 1, 1,
-0.4782496, 0.06807199, -1.477155, 1, 1, 1, 1, 1,
-0.4708032, -1.288836, -2.52944, 1, 1, 1, 1, 1,
-0.4680511, 0.5585601, -0.5909694, 1, 1, 1, 1, 1,
-0.4625004, -1.031095, -1.35458, 1, 1, 1, 1, 1,
-0.4623589, 0.5967452, 1.910123, 1, 1, 1, 1, 1,
-0.4581887, -1.706848, -2.888116, 1, 1, 1, 1, 1,
-0.454501, -0.5819358, -0.3056264, 1, 1, 1, 1, 1,
-0.4470926, -0.198499, -3.276276, 1, 1, 1, 1, 1,
-0.4450273, 0.5815454, -0.2736548, 1, 1, 1, 1, 1,
-0.4445489, 1.360032, -1.728645, 1, 1, 1, 1, 1,
-0.443617, 0.03461329, -3.772969, 1, 1, 1, 1, 1,
-0.4432481, 1.205144, -0.9166014, 1, 1, 1, 1, 1,
-0.442689, 0.3811956, -1.070224, 1, 1, 1, 1, 1,
-0.4386274, -1.095155, -3.010837, 1, 1, 1, 1, 1,
-0.4368803, -0.4039204, -0.605701, 1, 1, 1, 1, 1,
-0.434074, 0.5429821, -0.5999666, 0, 0, 1, 1, 1,
-0.4304547, 0.3267542, -2.635582, 1, 0, 0, 1, 1,
-0.4299898, 0.01042134, -1.542702, 1, 0, 0, 1, 1,
-0.4287747, -0.1565981, -2.859714, 1, 0, 0, 1, 1,
-0.4265891, -0.598732, -2.30933, 1, 0, 0, 1, 1,
-0.4217772, 0.7563634, -0.0827318, 1, 0, 0, 1, 1,
-0.4120791, 0.9921188, 0.992939, 0, 0, 0, 1, 1,
-0.4113449, 1.14414, 0.4733309, 0, 0, 0, 1, 1,
-0.4109601, 0.8092973, -0.3022127, 0, 0, 0, 1, 1,
-0.4086832, -1.442674, -3.336197, 0, 0, 0, 1, 1,
-0.4079786, -1.206412, -2.793973, 0, 0, 0, 1, 1,
-0.4074529, -0.2519363, -1.687794, 0, 0, 0, 1, 1,
-0.3952914, -2.873309, -2.675022, 0, 0, 0, 1, 1,
-0.3946745, 0.9131294, 0.9761121, 1, 1, 1, 1, 1,
-0.3945588, -1.997502, -3.173953, 1, 1, 1, 1, 1,
-0.3941399, 0.8236957, -0.3286109, 1, 1, 1, 1, 1,
-0.3908915, 0.8900949, -1.247364, 1, 1, 1, 1, 1,
-0.3855918, -1.148477, -3.6004, 1, 1, 1, 1, 1,
-0.3845109, -1.404616, -2.169296, 1, 1, 1, 1, 1,
-0.3842434, 0.2451844, 0.2907434, 1, 1, 1, 1, 1,
-0.3790548, 1.815005, -0.4694912, 1, 1, 1, 1, 1,
-0.3764765, 1.159952, -0.7360928, 1, 1, 1, 1, 1,
-0.361447, 0.8226731, -0.7448857, 1, 1, 1, 1, 1,
-0.3604564, 0.5307372, -0.7574978, 1, 1, 1, 1, 1,
-0.3590836, 1.186219, -0.3557057, 1, 1, 1, 1, 1,
-0.3552853, -0.1634321, -1.466416, 1, 1, 1, 1, 1,
-0.3537896, 0.1481522, -2.190646, 1, 1, 1, 1, 1,
-0.3436722, 2.709189, 0.3901925, 1, 1, 1, 1, 1,
-0.3407959, 0.0111056, -2.158691, 0, 0, 1, 1, 1,
-0.3389938, -1.84796, -2.308651, 1, 0, 0, 1, 1,
-0.337159, -1.963562, -1.375034, 1, 0, 0, 1, 1,
-0.3363593, 1.364657, -1.625059, 1, 0, 0, 1, 1,
-0.3360006, -1.614985, -2.248121, 1, 0, 0, 1, 1,
-0.3357296, 0.07519611, -1.235635, 1, 0, 0, 1, 1,
-0.3356914, 0.3439573, -0.8238775, 0, 0, 0, 1, 1,
-0.3345439, -0.7285114, -4.240551, 0, 0, 0, 1, 1,
-0.3322738, -0.5382919, -3.128693, 0, 0, 0, 1, 1,
-0.3306091, 0.40385, -2.340747, 0, 0, 0, 1, 1,
-0.324293, -0.6923693, -2.700133, 0, 0, 0, 1, 1,
-0.3205908, 0.6656564, 0.05493966, 0, 0, 0, 1, 1,
-0.3174267, -0.8133288, -2.459189, 0, 0, 0, 1, 1,
-0.3157613, 0.3960003, -0.5195402, 1, 1, 1, 1, 1,
-0.314894, 0.6956308, 0.6509225, 1, 1, 1, 1, 1,
-0.3105507, 0.02084802, -2.247363, 1, 1, 1, 1, 1,
-0.2963186, 1.77984, -0.06870576, 1, 1, 1, 1, 1,
-0.2928668, -0.8110148, -2.166443, 1, 1, 1, 1, 1,
-0.2925891, -0.8783495, -3.000698, 1, 1, 1, 1, 1,
-0.2908703, 1.205548, 1.270121, 1, 1, 1, 1, 1,
-0.2887593, -0.1716646, -3.007293, 1, 1, 1, 1, 1,
-0.28688, -1.634658, -1.970128, 1, 1, 1, 1, 1,
-0.2853363, 1.532677, 0.7710505, 1, 1, 1, 1, 1,
-0.2847032, -0.1669375, -2.687534, 1, 1, 1, 1, 1,
-0.2815154, 0.3205417, 0.3060049, 1, 1, 1, 1, 1,
-0.2799097, 0.8450041, -0.5251077, 1, 1, 1, 1, 1,
-0.2769525, 1.124022, -0.7758552, 1, 1, 1, 1, 1,
-0.269209, 0.07892899, 0.04558203, 1, 1, 1, 1, 1,
-0.2690065, 0.4965615, 0.1546278, 0, 0, 1, 1, 1,
-0.2688129, 0.6009044, 1.035015, 1, 0, 0, 1, 1,
-0.2658896, 1.803687, 0.2405755, 1, 0, 0, 1, 1,
-0.2637051, 0.4510122, -1.146127, 1, 0, 0, 1, 1,
-0.2518183, 0.5272205, -1.782814, 1, 0, 0, 1, 1,
-0.2513124, 1.197826, -0.5443104, 1, 0, 0, 1, 1,
-0.2488882, 2.178315, -0.1446619, 0, 0, 0, 1, 1,
-0.246518, -1.378439, -1.747977, 0, 0, 0, 1, 1,
-0.2444934, 1.004056, 0.2731633, 0, 0, 0, 1, 1,
-0.2397068, 0.3624934, 0.5958505, 0, 0, 0, 1, 1,
-0.2382247, -0.910946, -4.058923, 0, 0, 0, 1, 1,
-0.237491, 0.9017363, -0.7360014, 0, 0, 0, 1, 1,
-0.2373107, 1.66517, -1.054669, 0, 0, 0, 1, 1,
-0.2355033, -0.4355237, -2.835827, 1, 1, 1, 1, 1,
-0.2344561, 0.4279436, -0.2640103, 1, 1, 1, 1, 1,
-0.2336812, 0.4418116, 0.419388, 1, 1, 1, 1, 1,
-0.2336439, -0.5621176, -1.598871, 1, 1, 1, 1, 1,
-0.2302407, 0.9889535, 0.8469309, 1, 1, 1, 1, 1,
-0.2295681, -0.01163751, -1.453202, 1, 1, 1, 1, 1,
-0.2256249, -1.192801, -1.249987, 1, 1, 1, 1, 1,
-0.2244246, -2.335342, -3.991298, 1, 1, 1, 1, 1,
-0.2239487, -1.497009, -2.123632, 1, 1, 1, 1, 1,
-0.2228461, -0.8445451, -3.615171, 1, 1, 1, 1, 1,
-0.2221307, -0.2066182, -3.32941, 1, 1, 1, 1, 1,
-0.2213919, 0.307034, -0.8317279, 1, 1, 1, 1, 1,
-0.2198491, 0.353642, 0.4432121, 1, 1, 1, 1, 1,
-0.2132061, 0.1117966, -0.6199617, 1, 1, 1, 1, 1,
-0.2126936, -1.137207, -3.292985, 1, 1, 1, 1, 1,
-0.2125769, -0.5341493, -3.736145, 0, 0, 1, 1, 1,
-0.2096653, -1.225435, -2.72796, 1, 0, 0, 1, 1,
-0.2067413, 0.5492141, -1.718159, 1, 0, 0, 1, 1,
-0.2061562, -0.5509705, -4.781476, 1, 0, 0, 1, 1,
-0.2059101, 0.8756247, -0.2134461, 1, 0, 0, 1, 1,
-0.2058821, -1.713466, -3.723161, 1, 0, 0, 1, 1,
-0.2010169, -0.9295646, -3.286048, 0, 0, 0, 1, 1,
-0.19688, 0.602689, -1.887756, 0, 0, 0, 1, 1,
-0.196064, -0.9591758, -4.571903, 0, 0, 0, 1, 1,
-0.1952746, -0.3950399, -1.927355, 0, 0, 0, 1, 1,
-0.1881811, 1.377905, 1.012969, 0, 0, 0, 1, 1,
-0.1866774, 1.115768, -2.048779, 0, 0, 0, 1, 1,
-0.1828984, -0.005387386, -1.127925, 0, 0, 0, 1, 1,
-0.1826717, -0.6767698, -3.404124, 1, 1, 1, 1, 1,
-0.1767127, -0.390316, -3.738883, 1, 1, 1, 1, 1,
-0.1735658, 0.4155771, 1.473835, 1, 1, 1, 1, 1,
-0.1730619, -1.387619, -4.374063, 1, 1, 1, 1, 1,
-0.1727425, -1.217323, -0.8214185, 1, 1, 1, 1, 1,
-0.172357, -1.276256, -2.273032, 1, 1, 1, 1, 1,
-0.1701778, -0.6861488, -2.33122, 1, 1, 1, 1, 1,
-0.1682559, 0.8103755, 0.3834952, 1, 1, 1, 1, 1,
-0.1680342, 1.408225, -2.002503, 1, 1, 1, 1, 1,
-0.1651911, 0.9690105, -0.5686604, 1, 1, 1, 1, 1,
-0.1632087, -1.141176, -2.799997, 1, 1, 1, 1, 1,
-0.1627702, 0.5863096, 0.1989757, 1, 1, 1, 1, 1,
-0.1606512, 1.064234, 1.622927, 1, 1, 1, 1, 1,
-0.1595313, 1.084333, -1.090906, 1, 1, 1, 1, 1,
-0.15858, 1.187895, -0.4614204, 1, 1, 1, 1, 1,
-0.1581703, -1.586592, -4.765791, 0, 0, 1, 1, 1,
-0.1542773, 0.7611654, 0.9798907, 1, 0, 0, 1, 1,
-0.1537732, 0.2711827, 0.1649239, 1, 0, 0, 1, 1,
-0.1512907, 0.3607619, -0.6667114, 1, 0, 0, 1, 1,
-0.1510919, -1.728169, -3.366317, 1, 0, 0, 1, 1,
-0.1487718, -0.5873893, -3.022849, 1, 0, 0, 1, 1,
-0.1362708, -0.7045801, -4.685917, 0, 0, 0, 1, 1,
-0.1328673, 2.389145, -0.620048, 0, 0, 0, 1, 1,
-0.131979, -1.873204, -3.517156, 0, 0, 0, 1, 1,
-0.1300934, 0.6348055, -0.3778791, 0, 0, 0, 1, 1,
-0.1276139, 0.7953305, -0.3544698, 0, 0, 0, 1, 1,
-0.1206386, 0.03414961, -0.8083524, 0, 0, 0, 1, 1,
-0.1202449, -0.186018, -1.419479, 0, 0, 0, 1, 1,
-0.117322, 1.368538, -1.452235, 1, 1, 1, 1, 1,
-0.1113067, -0.4057928, -2.676145, 1, 1, 1, 1, 1,
-0.110509, 1.340355, -2.345081, 1, 1, 1, 1, 1,
-0.1091883, -0.8826339, -3.852488, 1, 1, 1, 1, 1,
-0.1061127, -2.253747, -4.539756, 1, 1, 1, 1, 1,
-0.1049009, -1.054435, -3.964418, 1, 1, 1, 1, 1,
-0.1046368, 1.709885, -0.6590824, 1, 1, 1, 1, 1,
-0.1023831, -0.1633109, -2.831483, 1, 1, 1, 1, 1,
-0.10093, -0.7724503, -2.598614, 1, 1, 1, 1, 1,
-0.1004863, 1.044698, 1.778255, 1, 1, 1, 1, 1,
-0.09703548, -0.5149509, -4.088873, 1, 1, 1, 1, 1,
-0.09515308, 2.248678, -0.6234625, 1, 1, 1, 1, 1,
-0.09106816, -1.005543, -2.018805, 1, 1, 1, 1, 1,
-0.08540187, 0.1040602, -0.1490358, 1, 1, 1, 1, 1,
-0.08509142, 1.296283, -2.352448, 1, 1, 1, 1, 1,
-0.08282439, -1.297077, -3.587517, 0, 0, 1, 1, 1,
-0.07627529, -0.4602211, -1.881164, 1, 0, 0, 1, 1,
-0.07544682, 2.241377, 0.4749869, 1, 0, 0, 1, 1,
-0.07417953, -0.2019645, -1.334969, 1, 0, 0, 1, 1,
-0.07074819, -0.325362, -2.536107, 1, 0, 0, 1, 1,
-0.06916858, 0.8464583, -0.02976928, 1, 0, 0, 1, 1,
-0.06650849, -0.9641923, -5.698643, 0, 0, 0, 1, 1,
-0.06425376, -0.2268026, -1.934487, 0, 0, 0, 1, 1,
-0.06412318, -0.05288962, -2.520216, 0, 0, 0, 1, 1,
-0.06127737, 0.8011727, 0.05326254, 0, 0, 0, 1, 1,
-0.05732089, 0.6606162, 0.5467025, 0, 0, 0, 1, 1,
-0.04278395, 0.5737025, 0.02943097, 0, 0, 0, 1, 1,
-0.04219293, 0.06832211, -1.134676, 0, 0, 0, 1, 1,
-0.0408591, -0.350919, -1.758667, 1, 1, 1, 1, 1,
-0.03934145, 0.3172328, -1.082094, 1, 1, 1, 1, 1,
-0.03747215, 1.301008, -1.097447, 1, 1, 1, 1, 1,
-0.03734326, -0.05523532, -0.4615854, 1, 1, 1, 1, 1,
-0.03268662, -0.5035989, -4.150385, 1, 1, 1, 1, 1,
-0.02651684, 0.5723767, 0.3308234, 1, 1, 1, 1, 1,
-0.02532335, -0.4666516, -4.152949, 1, 1, 1, 1, 1,
-0.02227679, 0.01218104, -0.5764022, 1, 1, 1, 1, 1,
-0.01479068, -0.02772662, -1.763286, 1, 1, 1, 1, 1,
-0.01472436, -0.9764643, -3.207048, 1, 1, 1, 1, 1,
-0.01434971, 1.404652, -2.179958, 1, 1, 1, 1, 1,
-0.009068961, -0.7691512, -2.634127, 1, 1, 1, 1, 1,
-0.007012925, -0.4895558, -0.3934046, 1, 1, 1, 1, 1,
-0.003423559, -0.5905148, -4.026736, 1, 1, 1, 1, 1,
-0.000482719, -1.90738, -3.218891, 1, 1, 1, 1, 1,
0.004053625, -0.8265238, 2.932246, 0, 0, 1, 1, 1,
0.005710549, 0.8986071, 0.3055422, 1, 0, 0, 1, 1,
0.008111925, -2.091109, 2.869902, 1, 0, 0, 1, 1,
0.008295145, -0.341933, 2.758457, 1, 0, 0, 1, 1,
0.009855753, 0.8174763, -0.2722695, 1, 0, 0, 1, 1,
0.01066509, 0.7962338, -1.119747, 1, 0, 0, 1, 1,
0.01099382, 0.7882087, 0.09139159, 0, 0, 0, 1, 1,
0.01359099, 0.3406262, 1.141309, 0, 0, 0, 1, 1,
0.01873207, 0.4299215, -0.1343165, 0, 0, 0, 1, 1,
0.02308051, -1.050825, 4.207387, 0, 0, 0, 1, 1,
0.02451896, -1.317496, 2.028595, 0, 0, 0, 1, 1,
0.03390887, -0.5954702, 3.235702, 0, 0, 0, 1, 1,
0.0427189, -1.085455, 2.893993, 0, 0, 0, 1, 1,
0.04872158, -1.447969, 1.973783, 1, 1, 1, 1, 1,
0.04878115, -1.689439, 1.559884, 1, 1, 1, 1, 1,
0.0499862, -1.27854, 3.857133, 1, 1, 1, 1, 1,
0.05010391, -0.3746551, 1.226056, 1, 1, 1, 1, 1,
0.0524795, -0.2368574, 2.667217, 1, 1, 1, 1, 1,
0.05477342, 0.8602311, 0.3013436, 1, 1, 1, 1, 1,
0.07086778, -1.046123, 2.925008, 1, 1, 1, 1, 1,
0.07111328, -0.9953502, 4.138617, 1, 1, 1, 1, 1,
0.0741443, -1.093422, 2.130374, 1, 1, 1, 1, 1,
0.08105997, -0.6599798, 2.728875, 1, 1, 1, 1, 1,
0.08434357, 0.6185076, 0.4716924, 1, 1, 1, 1, 1,
0.08436151, 1.232797, 0.03606287, 1, 1, 1, 1, 1,
0.08463613, 0.4570662, -1.123304, 1, 1, 1, 1, 1,
0.08489745, -0.1700369, 3.589912, 1, 1, 1, 1, 1,
0.08573972, 0.01999067, 1.409604, 1, 1, 1, 1, 1,
0.08605173, -0.6645668, 1.722495, 0, 0, 1, 1, 1,
0.0866662, -0.2119682, 3.564973, 1, 0, 0, 1, 1,
0.08682235, -0.0172922, 2.341386, 1, 0, 0, 1, 1,
0.08699919, -0.7056807, 1.2211, 1, 0, 0, 1, 1,
0.08735382, 0.2046389, 0.8452134, 1, 0, 0, 1, 1,
0.08803178, -1.24993, 0.7227451, 1, 0, 0, 1, 1,
0.09435409, -1.833605, 1.598583, 0, 0, 0, 1, 1,
0.09485004, -1.880831, 2.983157, 0, 0, 0, 1, 1,
0.09515583, 1.078876, 1.166647, 0, 0, 0, 1, 1,
0.09601215, 0.1435174, 0.9582282, 0, 0, 0, 1, 1,
0.09640669, 1.425639, 2.540687, 0, 0, 0, 1, 1,
0.1033469, -1.226011, 4.571021, 0, 0, 0, 1, 1,
0.1068038, -0.2923702, 1.522676, 0, 0, 0, 1, 1,
0.1072121, -0.2778178, 2.615502, 1, 1, 1, 1, 1,
0.1072522, -0.139453, 2.95831, 1, 1, 1, 1, 1,
0.1088364, -1.642596, 2.991967, 1, 1, 1, 1, 1,
0.1094405, -0.2599517, 1.977038, 1, 1, 1, 1, 1,
0.1103606, -0.2546383, 2.278802, 1, 1, 1, 1, 1,
0.1131534, 0.8724791, 1.018098, 1, 1, 1, 1, 1,
0.1151832, -1.358587, 3.221236, 1, 1, 1, 1, 1,
0.1183451, -1.824674, 3.103604, 1, 1, 1, 1, 1,
0.1204607, -2.193407, 2.282789, 1, 1, 1, 1, 1,
0.1206933, 0.6295859, -1.338684, 1, 1, 1, 1, 1,
0.121376, -0.1312645, 1.683444, 1, 1, 1, 1, 1,
0.1238372, -0.03821113, 2.080053, 1, 1, 1, 1, 1,
0.1306743, -1.591566, 0.8117863, 1, 1, 1, 1, 1,
0.1395754, 0.6358689, 1.765828, 1, 1, 1, 1, 1,
0.1399866, -0.2241275, 2.942193, 1, 1, 1, 1, 1,
0.1418694, 1.270927, 0.7170708, 0, 0, 1, 1, 1,
0.1426023, -2.750456, 2.49805, 1, 0, 0, 1, 1,
0.1470806, -0.6581361, 2.506784, 1, 0, 0, 1, 1,
0.1503175, -1.018344, 3.883615, 1, 0, 0, 1, 1,
0.1512381, -0.8103879, 2.979829, 1, 0, 0, 1, 1,
0.152452, 0.8748965, 0.9312516, 1, 0, 0, 1, 1,
0.1565559, -0.1242169, 1.319441, 0, 0, 0, 1, 1,
0.1619567, -0.5741792, 1.483322, 0, 0, 0, 1, 1,
0.1637643, -0.799004, 5.072791, 0, 0, 0, 1, 1,
0.1645905, -1.891247, 2.21265, 0, 0, 0, 1, 1,
0.16824, 0.5920747, 0.4124306, 0, 0, 0, 1, 1,
0.1683693, 1.165398, 0.3312803, 0, 0, 0, 1, 1,
0.1689632, -1.927436, 3.200547, 0, 0, 0, 1, 1,
0.1725632, 0.7314256, 0.5222892, 1, 1, 1, 1, 1,
0.173096, -0.3947586, 2.246138, 1, 1, 1, 1, 1,
0.1784656, 0.2934754, 2.218312, 1, 1, 1, 1, 1,
0.1786339, 0.4960915, 0.6364471, 1, 1, 1, 1, 1,
0.1799358, 0.4854199, -2.154278, 1, 1, 1, 1, 1,
0.1874503, -0.389197, 2.481311, 1, 1, 1, 1, 1,
0.1885408, 0.3555785, 0.1070523, 1, 1, 1, 1, 1,
0.1896145, 0.392424, -0.1809645, 1, 1, 1, 1, 1,
0.1916908, 0.1611169, 1.257248, 1, 1, 1, 1, 1,
0.1922057, -0.3342258, 2.701035, 1, 1, 1, 1, 1,
0.1944204, 0.8028798, -0.2586609, 1, 1, 1, 1, 1,
0.1953578, 0.436509, -1.117234, 1, 1, 1, 1, 1,
0.1974524, -0.418565, 3.834523, 1, 1, 1, 1, 1,
0.2000332, 1.64271, 0.1027026, 1, 1, 1, 1, 1,
0.2095133, -0.8830582, 2.006315, 1, 1, 1, 1, 1,
0.2135561, -1.127206, 2.24469, 0, 0, 1, 1, 1,
0.2144255, -1.984739, 2.887604, 1, 0, 0, 1, 1,
0.2189329, -0.4473913, 2.773255, 1, 0, 0, 1, 1,
0.2203168, 1.679613, 0.45454, 1, 0, 0, 1, 1,
0.2222902, 0.1627577, 2.112709, 1, 0, 0, 1, 1,
0.2246007, 2.071823, 1.263724, 1, 0, 0, 1, 1,
0.2305707, 0.2177925, 0.2573767, 0, 0, 0, 1, 1,
0.2390564, 0.06426077, 1.395771, 0, 0, 0, 1, 1,
0.2507668, -1.201221, 2.902634, 0, 0, 0, 1, 1,
0.2540675, -1.755935, 1.967708, 0, 0, 0, 1, 1,
0.2596332, 0.2409175, 0.0708224, 0, 0, 0, 1, 1,
0.2597441, -0.8192143, 2.576684, 0, 0, 0, 1, 1,
0.2640286, 0.4266706, 1.772963, 0, 0, 0, 1, 1,
0.2653431, 0.2238855, 1.578391, 1, 1, 1, 1, 1,
0.2692211, -1.223747, 2.667819, 1, 1, 1, 1, 1,
0.2737769, -0.6352813, 1.696068, 1, 1, 1, 1, 1,
0.2775455, -1.002461, 1.718258, 1, 1, 1, 1, 1,
0.278651, 0.4922418, -0.02170819, 1, 1, 1, 1, 1,
0.2813825, -0.6089079, 2.734676, 1, 1, 1, 1, 1,
0.2824662, 0.2909693, -0.5284823, 1, 1, 1, 1, 1,
0.295008, -0.2038188, 1.326378, 1, 1, 1, 1, 1,
0.2963678, -0.6538777, 2.912956, 1, 1, 1, 1, 1,
0.2965791, 1.264547, 1.292968, 1, 1, 1, 1, 1,
0.2981987, 1.452284, 0.2926068, 1, 1, 1, 1, 1,
0.3008608, 2.109082, 0.9201745, 1, 1, 1, 1, 1,
0.3086859, -0.6359542, 4.048045, 1, 1, 1, 1, 1,
0.3106226, 1.02442, 1.448879, 1, 1, 1, 1, 1,
0.3110926, -0.3752021, 1.561067, 1, 1, 1, 1, 1,
0.3133842, 0.5677974, 0.1160918, 0, 0, 1, 1, 1,
0.3203754, 1.651723, 0.5935625, 1, 0, 0, 1, 1,
0.3213353, -0.3125584, 1.459077, 1, 0, 0, 1, 1,
0.3224853, 0.4758334, 0.7941586, 1, 0, 0, 1, 1,
0.3227458, -1.170525, 4.093884, 1, 0, 0, 1, 1,
0.323224, -1.1829, 3.983003, 1, 0, 0, 1, 1,
0.3245718, 1.610329, -0.04962366, 0, 0, 0, 1, 1,
0.3263076, -0.78896, 4.090097, 0, 0, 0, 1, 1,
0.3263859, 0.5913514, -1.435104, 0, 0, 0, 1, 1,
0.3279473, -0.9284598, 3.552632, 0, 0, 0, 1, 1,
0.3308538, -0.0130108, 2.300929, 0, 0, 0, 1, 1,
0.3369581, -0.5585133, 1.352619, 0, 0, 0, 1, 1,
0.3401607, -0.1787644, 2.471806, 0, 0, 0, 1, 1,
0.3411857, -2.294949, 3.922283, 1, 1, 1, 1, 1,
0.345505, 1.618353, 1.025453, 1, 1, 1, 1, 1,
0.3469808, 0.4710866, -0.1807737, 1, 1, 1, 1, 1,
0.3520162, 1.242118, -0.4080568, 1, 1, 1, 1, 1,
0.3529659, 0.0616836, 0.9204609, 1, 1, 1, 1, 1,
0.3539422, -1.329454, 3.497722, 1, 1, 1, 1, 1,
0.3569621, 0.02611308, 0.8321781, 1, 1, 1, 1, 1,
0.369607, -0.2935968, 3.56773, 1, 1, 1, 1, 1,
0.3703064, -1.641799, 2.545041, 1, 1, 1, 1, 1,
0.3740957, 0.04743782, 2.405932, 1, 1, 1, 1, 1,
0.3746618, 0.6736751, 2.307692, 1, 1, 1, 1, 1,
0.3748399, 1.012109, 1.109815, 1, 1, 1, 1, 1,
0.3816122, -0.4355693, 2.63903, 1, 1, 1, 1, 1,
0.3828728, 0.957701, -0.4880612, 1, 1, 1, 1, 1,
0.3846259, 1.167609, -0.3960432, 1, 1, 1, 1, 1,
0.387119, -1.874408, 1.558872, 0, 0, 1, 1, 1,
0.3875586, 0.3534765, 0.9989506, 1, 0, 0, 1, 1,
0.3882519, 0.522539, 1.189341, 1, 0, 0, 1, 1,
0.389215, -1.313718, 3.318456, 1, 0, 0, 1, 1,
0.3933988, -1.683853, 4.259297, 1, 0, 0, 1, 1,
0.3975298, -0.4909462, 3.706145, 1, 0, 0, 1, 1,
0.3980526, -1.251338, 1.351604, 0, 0, 0, 1, 1,
0.3995214, 2.114502, 1.407287, 0, 0, 0, 1, 1,
0.4040308, 0.1313352, 2.016693, 0, 0, 0, 1, 1,
0.4045426, 1.166337, -0.906775, 0, 0, 0, 1, 1,
0.4116145, -0.05607435, 1.524571, 0, 0, 0, 1, 1,
0.4164456, -0.534367, 1.248857, 0, 0, 0, 1, 1,
0.4286858, -1.180182, 1.373832, 0, 0, 0, 1, 1,
0.4311968, 1.705301, 0.04772482, 1, 1, 1, 1, 1,
0.4331883, 0.5749366, 0.6926181, 1, 1, 1, 1, 1,
0.4371799, -0.1097393, 2.760726, 1, 1, 1, 1, 1,
0.4382862, 0.03935662, 1.266216, 1, 1, 1, 1, 1,
0.4395181, -0.1949638, 0.1587326, 1, 1, 1, 1, 1,
0.4400583, -1.75466, 2.48227, 1, 1, 1, 1, 1,
0.4412974, 0.7404314, 0.9683337, 1, 1, 1, 1, 1,
0.4426033, 1.457526, -0.2855762, 1, 1, 1, 1, 1,
0.4428796, 0.131985, 3.100623, 1, 1, 1, 1, 1,
0.4454205, 0.5604703, 1.309759, 1, 1, 1, 1, 1,
0.4463427, -1.015334, 3.717303, 1, 1, 1, 1, 1,
0.450498, -0.5773889, 2.978532, 1, 1, 1, 1, 1,
0.4609129, -1.451674, 2.302254, 1, 1, 1, 1, 1,
0.4614027, 1.661505, 1.514836, 1, 1, 1, 1, 1,
0.4618696, 1.254908, 0.6674541, 1, 1, 1, 1, 1,
0.4620216, -1.641857, 2.805619, 0, 0, 1, 1, 1,
0.4664341, 0.4883305, -1.003547, 1, 0, 0, 1, 1,
0.4682462, -0.5034344, 1.757296, 1, 0, 0, 1, 1,
0.4720054, 1.09482, 1.810995, 1, 0, 0, 1, 1,
0.4731003, 0.3704283, 1.233141, 1, 0, 0, 1, 1,
0.4754681, -0.8331415, 1.908068, 1, 0, 0, 1, 1,
0.4799801, 0.3335363, -0.1727077, 0, 0, 0, 1, 1,
0.4851179, -1.495595, 2.171844, 0, 0, 0, 1, 1,
0.4865218, -0.4332428, 0.9921241, 0, 0, 0, 1, 1,
0.4871536, -0.09876699, 2.451357, 0, 0, 0, 1, 1,
0.4955361, 0.3256417, 2.013422, 0, 0, 0, 1, 1,
0.4961064, 0.5713714, 1.082442, 0, 0, 0, 1, 1,
0.4972957, 1.708813, -0.01842973, 0, 0, 0, 1, 1,
0.5017575, 1.502708, 0.3983874, 1, 1, 1, 1, 1,
0.5017791, -0.1711315, 1.618883, 1, 1, 1, 1, 1,
0.5034066, 0.9147267, 0.2267378, 1, 1, 1, 1, 1,
0.504462, -0.005030425, 1.63791, 1, 1, 1, 1, 1,
0.5056982, 0.7163649, 1.439581, 1, 1, 1, 1, 1,
0.508348, 0.3927788, 1.448556, 1, 1, 1, 1, 1,
0.5120001, -0.1206746, 2.377364, 1, 1, 1, 1, 1,
0.5136809, -0.1680297, 3.327518, 1, 1, 1, 1, 1,
0.5161728, 0.2019303, 0.2290336, 1, 1, 1, 1, 1,
0.5177925, -0.07436215, 0.693715, 1, 1, 1, 1, 1,
0.5260136, -0.6688051, 2.354661, 1, 1, 1, 1, 1,
0.5302377, 0.6692387, 0.4111379, 1, 1, 1, 1, 1,
0.5315706, -0.1608091, 0.7985681, 1, 1, 1, 1, 1,
0.5318782, 1.61332, -0.5204608, 1, 1, 1, 1, 1,
0.5325561, -2.260035, 2.936066, 1, 1, 1, 1, 1,
0.5344413, 0.7852668, -1.677314, 0, 0, 1, 1, 1,
0.5370217, 0.01213822, 0.1040517, 1, 0, 0, 1, 1,
0.5384175, 0.6502097, 0.8801078, 1, 0, 0, 1, 1,
0.5387177, 1.186987, -1.232139, 1, 0, 0, 1, 1,
0.539605, 0.5798673, 0.503686, 1, 0, 0, 1, 1,
0.5396581, 0.2661641, 0.3726508, 1, 0, 0, 1, 1,
0.5398713, 0.419349, 1.089157, 0, 0, 0, 1, 1,
0.5401657, -0.2905118, 0.9700531, 0, 0, 0, 1, 1,
0.5412928, -0.1832188, 1.939543, 0, 0, 0, 1, 1,
0.5423427, -0.5902102, 2.543201, 0, 0, 0, 1, 1,
0.5447589, -0.250424, -0.1643022, 0, 0, 0, 1, 1,
0.5464886, 0.801626, 1.10598, 0, 0, 0, 1, 1,
0.5549606, -0.3600989, 1.776383, 0, 0, 0, 1, 1,
0.5574067, -0.1718574, 0.545692, 1, 1, 1, 1, 1,
0.5590856, 0.6136836, 1.275144, 1, 1, 1, 1, 1,
0.5646428, -0.2653265, 3.438564, 1, 1, 1, 1, 1,
0.5693069, 0.1837462, 0.920441, 1, 1, 1, 1, 1,
0.5726663, 1.139794, -1.045386, 1, 1, 1, 1, 1,
0.5751217, 0.987655, 1.49428, 1, 1, 1, 1, 1,
0.5794253, 1.173125, 0.1463289, 1, 1, 1, 1, 1,
0.5814166, -0.4194473, 1.78606, 1, 1, 1, 1, 1,
0.5858853, 0.06060038, 0.5023764, 1, 1, 1, 1, 1,
0.5915921, 0.8134869, 0.7610582, 1, 1, 1, 1, 1,
0.5925053, -0.1507346, 2.889959, 1, 1, 1, 1, 1,
0.5950392, -0.1024781, 2.692909, 1, 1, 1, 1, 1,
0.5960726, 0.1608997, 2.590798, 1, 1, 1, 1, 1,
0.5979398, -0.5089418, 3.622948, 1, 1, 1, 1, 1,
0.602823, 0.7430772, 2.569411, 1, 1, 1, 1, 1,
0.6048773, -0.5812035, 3.759975, 0, 0, 1, 1, 1,
0.6054676, 0.4682328, 2.215312, 1, 0, 0, 1, 1,
0.6125616, 0.3886424, 1.751839, 1, 0, 0, 1, 1,
0.6171091, 0.5818622, 0.6540754, 1, 0, 0, 1, 1,
0.6187045, -1.463884, 1.462145, 1, 0, 0, 1, 1,
0.6204764, -0.3325312, 1.067644, 1, 0, 0, 1, 1,
0.6233686, 0.1951483, 0.5234444, 0, 0, 0, 1, 1,
0.6249348, -0.1950076, 2.766456, 0, 0, 0, 1, 1,
0.6262017, 0.4663986, 0.6541163, 0, 0, 0, 1, 1,
0.6286731, 0.421675, 1.35324, 0, 0, 0, 1, 1,
0.6303726, -0.3129447, 3.347788, 0, 0, 0, 1, 1,
0.6306431, 0.099959, -0.6157075, 0, 0, 0, 1, 1,
0.6381589, 1.579177, 0.8256385, 0, 0, 0, 1, 1,
0.6399357, -0.6158372, 2.882171, 1, 1, 1, 1, 1,
0.6431259, -0.2176088, 3.123294, 1, 1, 1, 1, 1,
0.6492555, -0.1326563, 0.4634402, 1, 1, 1, 1, 1,
0.6639559, 1.068566, 0.02271668, 1, 1, 1, 1, 1,
0.6654816, 0.465634, 1.085278, 1, 1, 1, 1, 1,
0.6659088, 0.2925365, 1.445629, 1, 1, 1, 1, 1,
0.6679842, -0.2256543, 1.705763, 1, 1, 1, 1, 1,
0.6724465, -0.4277106, 3.460202, 1, 1, 1, 1, 1,
0.6749514, -0.4291002, 2.568977, 1, 1, 1, 1, 1,
0.6834312, 0.01878809, 1.301673, 1, 1, 1, 1, 1,
0.6917504, -0.6858068, 3.243241, 1, 1, 1, 1, 1,
0.6940919, -1.142971, 3.560449, 1, 1, 1, 1, 1,
0.6948185, -0.5231255, 3.108044, 1, 1, 1, 1, 1,
0.6957887, 0.4536259, 0.5514881, 1, 1, 1, 1, 1,
0.7008985, -1.14851, 3.233168, 1, 1, 1, 1, 1,
0.7032344, -1.733713, 1.939685, 0, 0, 1, 1, 1,
0.704288, 0.7379647, 0.1670343, 1, 0, 0, 1, 1,
0.710628, -1.196274, 3.114141, 1, 0, 0, 1, 1,
0.7111621, -1.28984, 3.267733, 1, 0, 0, 1, 1,
0.7117473, -0.9060099, 3.177909, 1, 0, 0, 1, 1,
0.712065, 0.06457958, 3.635082, 1, 0, 0, 1, 1,
0.7178631, 0.3967138, 1.745196, 0, 0, 0, 1, 1,
0.7213274, -0.2552361, 3.182112, 0, 0, 0, 1, 1,
0.7216222, 0.3568846, 1.547508, 0, 0, 0, 1, 1,
0.7226177, 0.06130594, 0.5837983, 0, 0, 0, 1, 1,
0.7372423, 0.5743276, -0.114611, 0, 0, 0, 1, 1,
0.7396312, -0.1368143, 2.345287, 0, 0, 0, 1, 1,
0.7437708, -0.5110503, 3.400262, 0, 0, 0, 1, 1,
0.7499239, 0.201361, 3.13333, 1, 1, 1, 1, 1,
0.7499593, -0.09818733, 2.420417, 1, 1, 1, 1, 1,
0.7533306, 0.5816372, 0.9387192, 1, 1, 1, 1, 1,
0.7611986, 0.6963911, 2.256529, 1, 1, 1, 1, 1,
0.7671075, -1.088886, 0.9800854, 1, 1, 1, 1, 1,
0.7674031, 0.3506013, 0.4240882, 1, 1, 1, 1, 1,
0.7708301, -0.822426, 4.056139, 1, 1, 1, 1, 1,
0.7725931, -0.1140283, 2.754073, 1, 1, 1, 1, 1,
0.7726229, 0.8783908, 0.4529121, 1, 1, 1, 1, 1,
0.7816334, -0.2167591, 2.423405, 1, 1, 1, 1, 1,
0.787762, 0.479421, -0.8678705, 1, 1, 1, 1, 1,
0.789538, 1.720552, -0.09887514, 1, 1, 1, 1, 1,
0.7918512, -0.8508788, 2.207228, 1, 1, 1, 1, 1,
0.792074, 0.9495485, 1.702171, 1, 1, 1, 1, 1,
0.793042, -1.165098, 1.070394, 1, 1, 1, 1, 1,
0.7969565, 0.1634847, 1.151492, 0, 0, 1, 1, 1,
0.7993388, 0.3764953, 0.7274156, 1, 0, 0, 1, 1,
0.8015986, 0.02180588, -0.1229707, 1, 0, 0, 1, 1,
0.802086, 0.295328, 1.538575, 1, 0, 0, 1, 1,
0.8056298, -1.127224, 2.337261, 1, 0, 0, 1, 1,
0.8063363, -0.6264385, 4.532635, 1, 0, 0, 1, 1,
0.8068434, -0.378837, 3.130094, 0, 0, 0, 1, 1,
0.8121696, 1.562387, 1.250589, 0, 0, 0, 1, 1,
0.8123333, 1.59222, 1.516143, 0, 0, 0, 1, 1,
0.812791, 0.326341, 1.233639, 0, 0, 0, 1, 1,
0.8154142, -0.06072884, 0.02320146, 0, 0, 0, 1, 1,
0.8156822, -0.2291615, 2.165199, 0, 0, 0, 1, 1,
0.8171131, -0.727676, 1.523159, 0, 0, 0, 1, 1,
0.821142, -0.627429, 1.757342, 1, 1, 1, 1, 1,
0.8218378, -0.6498133, 1.650829, 1, 1, 1, 1, 1,
0.8228657, 0.01874823, 2.579029, 1, 1, 1, 1, 1,
0.8231696, 1.174072, -0.277583, 1, 1, 1, 1, 1,
0.8303419, -1.183935, 1.147276, 1, 1, 1, 1, 1,
0.8385202, 0.8803684, 0.01021599, 1, 1, 1, 1, 1,
0.8483249, 0.6214435, 1.202906, 1, 1, 1, 1, 1,
0.8520747, -1.067051, 1.440933, 1, 1, 1, 1, 1,
0.8591701, -0.5058652, 1.51692, 1, 1, 1, 1, 1,
0.8615532, -0.3756157, 2.123289, 1, 1, 1, 1, 1,
0.8665262, 0.9582699, 0.4409486, 1, 1, 1, 1, 1,
0.8692951, -1.226538, 1.124963, 1, 1, 1, 1, 1,
0.8711942, 0.5095209, 0.5854057, 1, 1, 1, 1, 1,
0.8780997, 0.85518, 0.5168276, 1, 1, 1, 1, 1,
0.8807847, 0.8221123, 1.681118, 1, 1, 1, 1, 1,
0.8894824, 0.5702756, 1.239468, 0, 0, 1, 1, 1,
0.8919659, -0.3132458, 0.8076336, 1, 0, 0, 1, 1,
0.893492, -1.397196, 1.962523, 1, 0, 0, 1, 1,
0.9033075, -0.5615498, 2.31837, 1, 0, 0, 1, 1,
0.915234, 0.08254705, 1.78178, 1, 0, 0, 1, 1,
0.9213407, 0.03685413, 1.235335, 1, 0, 0, 1, 1,
0.9326721, 0.6664064, 3.236033, 0, 0, 0, 1, 1,
0.9372469, 1.996764, -0.2415712, 0, 0, 0, 1, 1,
0.9405091, 1.884732, 1.409866, 0, 0, 0, 1, 1,
0.9462112, 0.5125796, 0.5462251, 0, 0, 0, 1, 1,
0.9464157, -1.958295, 4.424569, 0, 0, 0, 1, 1,
0.949918, -0.2239235, 0.5686795, 0, 0, 0, 1, 1,
0.9512498, -1.052661, 1.244187, 0, 0, 0, 1, 1,
0.9625108, 1.008637, 1.832071, 1, 1, 1, 1, 1,
0.9643224, -0.8448999, 2.454436, 1, 1, 1, 1, 1,
0.965121, -0.5039691, 1.638663, 1, 1, 1, 1, 1,
0.9679466, 0.07268306, 1.076781, 1, 1, 1, 1, 1,
0.9686259, -0.1621663, 2.876551, 1, 1, 1, 1, 1,
0.9690664, 0.8849344, -0.3898179, 1, 1, 1, 1, 1,
0.9755126, -0.181281, 2.241776, 1, 1, 1, 1, 1,
0.9774449, 1.318456, 1.285466, 1, 1, 1, 1, 1,
0.9813883, -1.007884, 3.239524, 1, 1, 1, 1, 1,
0.9859745, 0.9557096, -0.3523798, 1, 1, 1, 1, 1,
0.9891462, 0.08022732, 2.029195, 1, 1, 1, 1, 1,
0.9897255, -0.08447436, 1.884649, 1, 1, 1, 1, 1,
0.9907219, -1.461756, 1.434077, 1, 1, 1, 1, 1,
0.9949576, -1.704669, 1.878302, 1, 1, 1, 1, 1,
0.9986259, 0.1812261, 3.656521, 1, 1, 1, 1, 1,
1.00281, 0.3778436, 1.432545, 0, 0, 1, 1, 1,
1.003875, 0.1714649, -0.64604, 1, 0, 0, 1, 1,
1.004431, -1.068757, 3.371169, 1, 0, 0, 1, 1,
1.01169, -0.3631861, 0.9054096, 1, 0, 0, 1, 1,
1.018681, -0.4876001, 1.9476, 1, 0, 0, 1, 1,
1.018968, -0.4308911, 2.632017, 1, 0, 0, 1, 1,
1.019419, -0.4841132, 1.964367, 0, 0, 0, 1, 1,
1.020142, 0.6822884, 3.745978, 0, 0, 0, 1, 1,
1.025832, 1.742114, 0.7065948, 0, 0, 0, 1, 1,
1.026652, 0.2489197, 1.605481, 0, 0, 0, 1, 1,
1.04149, 0.3408573, 1.430716, 0, 0, 0, 1, 1,
1.045813, -0.1626521, 2.145065, 0, 0, 0, 1, 1,
1.046522, -0.5005739, 2.293478, 0, 0, 0, 1, 1,
1.050163, -0.5470707, 1.803343, 1, 1, 1, 1, 1,
1.050313, -2.03312, 3.473557, 1, 1, 1, 1, 1,
1.052068, -1.241269, 2.040135, 1, 1, 1, 1, 1,
1.057796, 0.3746767, 2.340297, 1, 1, 1, 1, 1,
1.062471, 0.2624828, 1.519029, 1, 1, 1, 1, 1,
1.066942, 1.59041, 2.407327, 1, 1, 1, 1, 1,
1.083174, 0.3731179, 1.227849, 1, 1, 1, 1, 1,
1.086758, 0.4209292, 1.463082, 1, 1, 1, 1, 1,
1.087743, 1.874669, 0.2263943, 1, 1, 1, 1, 1,
1.092683, 1.234687, 0.9938083, 1, 1, 1, 1, 1,
1.095034, 1.47543, 0.9521658, 1, 1, 1, 1, 1,
1.100792, -0.6611452, 1.756073, 1, 1, 1, 1, 1,
1.104771, -0.004828857, 1.153582, 1, 1, 1, 1, 1,
1.105864, 0.3956483, 2.761143, 1, 1, 1, 1, 1,
1.106439, 1.521061, 1.034976, 1, 1, 1, 1, 1,
1.11719, 0.7464988, -1.074816, 0, 0, 1, 1, 1,
1.119761, 0.5192636, 0.4841592, 1, 0, 0, 1, 1,
1.120049, -0.07270481, 0.4190209, 1, 0, 0, 1, 1,
1.124469, 0.845769, 0.9637811, 1, 0, 0, 1, 1,
1.128168, 0.5911522, 2.591977, 1, 0, 0, 1, 1,
1.131739, -0.6709989, 1.977427, 1, 0, 0, 1, 1,
1.139941, -1.283647, 0.7007885, 0, 0, 0, 1, 1,
1.140916, 1.056011, -0.2961592, 0, 0, 0, 1, 1,
1.141535, 0.1187914, 0.2544551, 0, 0, 0, 1, 1,
1.148026, -0.6223282, 3.190528, 0, 0, 0, 1, 1,
1.163687, -1.371217, 2.844173, 0, 0, 0, 1, 1,
1.176591, -1.152046, 2.86619, 0, 0, 0, 1, 1,
1.184688, -3.491873, 3.520684, 0, 0, 0, 1, 1,
1.187296, 0.5023896, 1.981827, 1, 1, 1, 1, 1,
1.190489, -0.5417005, 2.63412, 1, 1, 1, 1, 1,
1.19581, -0.8269373, 2.378372, 1, 1, 1, 1, 1,
1.1961, 0.4606124, 2.967792, 1, 1, 1, 1, 1,
1.196212, -0.121661, 1.846669, 1, 1, 1, 1, 1,
1.199675, 0.07661708, 2.648309, 1, 1, 1, 1, 1,
1.202605, 0.2485554, 1.701619, 1, 1, 1, 1, 1,
1.204099, -0.7351628, 1.52713, 1, 1, 1, 1, 1,
1.209024, 0.756992, 1.528159, 1, 1, 1, 1, 1,
1.221572, -0.9387139, 2.376438, 1, 1, 1, 1, 1,
1.223829, 0.1236212, 1.327481, 1, 1, 1, 1, 1,
1.224143, 0.4786687, 0.3977321, 1, 1, 1, 1, 1,
1.224677, -0.3760642, 2.50864, 1, 1, 1, 1, 1,
1.231807, 0.1572637, 1.15042, 1, 1, 1, 1, 1,
1.235061, -0.5957952, 0.5954278, 1, 1, 1, 1, 1,
1.237229, -1.252814, 3.676488, 0, 0, 1, 1, 1,
1.254218, -0.8024642, 3.677655, 1, 0, 0, 1, 1,
1.255954, 0.791429, 1.159729, 1, 0, 0, 1, 1,
1.26796, -0.3124853, 2.204098, 1, 0, 0, 1, 1,
1.272064, -1.366863, 1.733644, 1, 0, 0, 1, 1,
1.279471, -0.1236918, 0.456551, 1, 0, 0, 1, 1,
1.282064, 0.3879724, 3.059684, 0, 0, 0, 1, 1,
1.282656, -0.7016307, 1.254504, 0, 0, 0, 1, 1,
1.28561, 0.253289, 2.016543, 0, 0, 0, 1, 1,
1.293043, -0.3709041, 4.197744, 0, 0, 0, 1, 1,
1.294841, -0.5077231, 3.220585, 0, 0, 0, 1, 1,
1.296024, 0.4999113, 0.7737981, 0, 0, 0, 1, 1,
1.311306, 0.8740836, 0.7023169, 0, 0, 0, 1, 1,
1.317299, 1.043212, -1.091993, 1, 1, 1, 1, 1,
1.319106, 0.3064184, 2.567063, 1, 1, 1, 1, 1,
1.324769, -0.2371963, 1.956092, 1, 1, 1, 1, 1,
1.336572, -0.8479478, 1.791165, 1, 1, 1, 1, 1,
1.351589, -0.6882336, 3.259732, 1, 1, 1, 1, 1,
1.363075, 2.13988, 1.279975, 1, 1, 1, 1, 1,
1.364909, -0.6886432, 0.8015858, 1, 1, 1, 1, 1,
1.380686, 1.093239, 0.2377884, 1, 1, 1, 1, 1,
1.387823, -0.9427239, 4.156888, 1, 1, 1, 1, 1,
1.389017, -0.1046427, 1.292984, 1, 1, 1, 1, 1,
1.391767, -0.5668115, 1.809508, 1, 1, 1, 1, 1,
1.392225, 0.9216592, 2.316933, 1, 1, 1, 1, 1,
1.396748, 0.432002, 1.656734, 1, 1, 1, 1, 1,
1.399221, 0.8966596, 2.115983, 1, 1, 1, 1, 1,
1.415124, 0.0947251, 0.6210005, 1, 1, 1, 1, 1,
1.415695, -2.836508, -0.3381432, 0, 0, 1, 1, 1,
1.421019, 0.03091974, 2.307084, 1, 0, 0, 1, 1,
1.431181, -0.1264848, 2.828554, 1, 0, 0, 1, 1,
1.437998, 0.2953328, 2.626168, 1, 0, 0, 1, 1,
1.442869, -0.03291352, 1.976996, 1, 0, 0, 1, 1,
1.444074, -0.8583485, 2.9905, 1, 0, 0, 1, 1,
1.44614, 2.270955, 0.6753002, 0, 0, 0, 1, 1,
1.451864, 0.9717693, 1.792513, 0, 0, 0, 1, 1,
1.454393, -0.4360138, 1.342978, 0, 0, 0, 1, 1,
1.49327, 1.735674, 2.720265, 0, 0, 0, 1, 1,
1.499782, 0.4240272, 0.1554367, 0, 0, 0, 1, 1,
1.499925, 1.162638, 1.755016, 0, 0, 0, 1, 1,
1.50192, 1.769328, 0.6063624, 0, 0, 0, 1, 1,
1.507756, -2.780589, 3.487259, 1, 1, 1, 1, 1,
1.524608, 0.4470938, 2.48663, 1, 1, 1, 1, 1,
1.532838, 1.494923, 1.54723, 1, 1, 1, 1, 1,
1.536886, 0.05784803, 0.09849221, 1, 1, 1, 1, 1,
1.543397, 0.3940782, 1.770276, 1, 1, 1, 1, 1,
1.565381, -0.5004506, 2.738617, 1, 1, 1, 1, 1,
1.580434, -1.68779, 3.384006, 1, 1, 1, 1, 1,
1.587692, 0.2582884, 0.6826562, 1, 1, 1, 1, 1,
1.591317, -0.7050182, 0.9349367, 1, 1, 1, 1, 1,
1.592618, 0.4551046, 0.8417095, 1, 1, 1, 1, 1,
1.595219, 1.228999, 0.4334977, 1, 1, 1, 1, 1,
1.59581, 1.924502, 0.9098437, 1, 1, 1, 1, 1,
1.607322, -0.1486502, -0.4933909, 1, 1, 1, 1, 1,
1.653773, 0.1321714, 2.271023, 1, 1, 1, 1, 1,
1.660335, -0.686621, 1.385101, 1, 1, 1, 1, 1,
1.676144, 1.372131, -0.07251883, 0, 0, 1, 1, 1,
1.676366, 1.386775, -1.821337, 1, 0, 0, 1, 1,
1.676814, 0.7626344, 2.585456, 1, 0, 0, 1, 1,
1.679266, 0.8815368, 1.491825, 1, 0, 0, 1, 1,
1.691345, 1.639181, 1.52921, 1, 0, 0, 1, 1,
1.723463, -0.91001, 4.53955, 1, 0, 0, 1, 1,
1.735286, 1.441242, 1.796519, 0, 0, 0, 1, 1,
1.736039, 0.4111175, 2.324264, 0, 0, 0, 1, 1,
1.738314, 0.234771, 2.951724, 0, 0, 0, 1, 1,
1.758606, 0.1422611, 0.0987286, 0, 0, 0, 1, 1,
1.764008, 0.3403877, 0.1345268, 0, 0, 0, 1, 1,
1.767496, 0.3616706, -0.8443387, 0, 0, 0, 1, 1,
1.780193, -1.567118, 1.799963, 0, 0, 0, 1, 1,
1.780198, -0.7284337, 4.775221, 1, 1, 1, 1, 1,
1.809402, -0.6651396, 2.205525, 1, 1, 1, 1, 1,
1.823733, 0.598154, 0.7447577, 1, 1, 1, 1, 1,
1.826026, -0.8375704, 1.726123, 1, 1, 1, 1, 1,
1.846489, 3.578298, 1.972499, 1, 1, 1, 1, 1,
1.852545, 0.4679008, 2.544047, 1, 1, 1, 1, 1,
1.871869, -0.2121646, 1.83312, 1, 1, 1, 1, 1,
1.888355, -1.794384, 1.814651, 1, 1, 1, 1, 1,
1.940498, 0.8774557, 0.9530988, 1, 1, 1, 1, 1,
2.000271, 0.8995752, 2.481259, 1, 1, 1, 1, 1,
2.019519, -0.6206002, 0.6904202, 1, 1, 1, 1, 1,
2.032361, -1.616451, 2.201835, 1, 1, 1, 1, 1,
2.045041, 0.9210608, 0.9154404, 1, 1, 1, 1, 1,
2.047015, 1.032147, 2.519675, 1, 1, 1, 1, 1,
2.063346, 1.772415, 1.276749, 1, 1, 1, 1, 1,
2.088185, -0.4288374, 3.07554, 0, 0, 1, 1, 1,
2.0948, -0.2956762, 1.939036, 1, 0, 0, 1, 1,
2.109037, 1.270035, 0.3011442, 1, 0, 0, 1, 1,
2.118258, -0.04879135, 1.918281, 1, 0, 0, 1, 1,
2.124628, -1.59554, 0.5198442, 1, 0, 0, 1, 1,
2.159903, -1.289324, 3.284788, 1, 0, 0, 1, 1,
2.183389, 0.2526029, 0.1040109, 0, 0, 0, 1, 1,
2.300665, 0.5635481, 2.536632, 0, 0, 0, 1, 1,
2.309651, 0.1391182, 0.7078846, 0, 0, 0, 1, 1,
2.337811, -0.4910395, 2.449341, 0, 0, 0, 1, 1,
2.367777, 0.5113669, 1.867743, 0, 0, 0, 1, 1,
2.412716, -0.6567352, 2.520088, 0, 0, 0, 1, 1,
2.419263, -1.475998, 2.394495, 0, 0, 0, 1, 1,
2.446662, 0.340623, 2.955133, 1, 1, 1, 1, 1,
2.45932, -1.300887, 2.503711, 1, 1, 1, 1, 1,
2.55358, -0.7892295, 2.657872, 1, 1, 1, 1, 1,
2.644488, 0.05094368, 1.357993, 1, 1, 1, 1, 1,
2.863546, 1.083379, 3.02241, 1, 1, 1, 1, 1,
3.144665, 0.00203727, 2.365765, 1, 1, 1, 1, 1,
3.147202, -1.286198, 1.333116, 1, 1, 1, 1, 1
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
var radius = 9.758764;
var distance = 34.27724;
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
mvMatrix.translate( 0.01944733, -0.04321241, 0.3129261 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.27724);
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