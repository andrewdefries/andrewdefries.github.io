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
-4.100167, 0.3404503, -1.957103, 1, 0, 0, 1,
-3.226549, -0.7110407, 1.126315, 1, 0.007843138, 0, 1,
-3.051019, -1.467416, -1.880396, 1, 0.01176471, 0, 1,
-3.000353, -0.9943729, -1.917792, 1, 0.01960784, 0, 1,
-2.812015, -0.1719575, -1.361477, 1, 0.02352941, 0, 1,
-2.668548, -1.117496, -0.5393494, 1, 0.03137255, 0, 1,
-2.609903, -0.1544045, -1.322192, 1, 0.03529412, 0, 1,
-2.573228, 1.864, -1.326858, 1, 0.04313726, 0, 1,
-2.466465, 1.217618, -0.6574567, 1, 0.04705882, 0, 1,
-2.40799, 0.5942772, -1.281887, 1, 0.05490196, 0, 1,
-2.405911, -0.04322996, -2.26097, 1, 0.05882353, 0, 1,
-2.225286, 0.1134377, -2.134954, 1, 0.06666667, 0, 1,
-2.224779, 1.162826, -1.762871, 1, 0.07058824, 0, 1,
-2.199126, 0.1319949, -0.6880493, 1, 0.07843138, 0, 1,
-2.194796, 0.3373622, -2.755098, 1, 0.08235294, 0, 1,
-2.188532, -0.7076285, -1.700329, 1, 0.09019608, 0, 1,
-2.187656, -2.759191, -2.990355, 1, 0.09411765, 0, 1,
-2.165717, -0.9782264, -2.462783, 1, 0.1019608, 0, 1,
-2.158555, 0.2338132, -2.637769, 1, 0.1098039, 0, 1,
-2.130339, 0.688637, -1.320116, 1, 0.1137255, 0, 1,
-2.119046, -1.41585, -1.092073, 1, 0.1215686, 0, 1,
-2.10617, 0.02147758, -0.4318039, 1, 0.1254902, 0, 1,
-2.096691, 0.4080136, 0.293557, 1, 0.1333333, 0, 1,
-2.089836, -0.3663458, -0.1642151, 1, 0.1372549, 0, 1,
-2.085442, -1.203084, -3.260121, 1, 0.145098, 0, 1,
-2.074921, 1.008324, -0.9270094, 1, 0.1490196, 0, 1,
-2.072592, 0.1876914, -0.9405404, 1, 0.1568628, 0, 1,
-2.044317, -1.707235, -2.376348, 1, 0.1607843, 0, 1,
-2.013952, -1.135142, -2.307321, 1, 0.1686275, 0, 1,
-2.003056, 0.1762879, -0.1034571, 1, 0.172549, 0, 1,
-1.990122, 0.6601729, -2.595803, 1, 0.1803922, 0, 1,
-1.977123, -0.0009794539, -2.099595, 1, 0.1843137, 0, 1,
-1.968378, 0.2904362, -1.31812, 1, 0.1921569, 0, 1,
-1.968015, -2.039118, -1.408362, 1, 0.1960784, 0, 1,
-1.96744, 0.1998768, -0.3181794, 1, 0.2039216, 0, 1,
-1.932487, 0.04183306, -1.040961, 1, 0.2117647, 0, 1,
-1.930976, -0.4601894, -2.083549, 1, 0.2156863, 0, 1,
-1.920219, 0.7642299, -3.174687, 1, 0.2235294, 0, 1,
-1.896707, 0.6614397, -0.7488968, 1, 0.227451, 0, 1,
-1.892875, 0.3646002, -1.684629, 1, 0.2352941, 0, 1,
-1.892268, -0.09328341, -1.801102, 1, 0.2392157, 0, 1,
-1.888385, 1.73647, -0.3879539, 1, 0.2470588, 0, 1,
-1.874329, 2.289316, -1.834251, 1, 0.2509804, 0, 1,
-1.867786, -1.005479, -1.743504, 1, 0.2588235, 0, 1,
-1.841273, 0.414762, -2.709341, 1, 0.2627451, 0, 1,
-1.838735, -0.6311152, -1.954251, 1, 0.2705882, 0, 1,
-1.817817, -1.631495, -1.848394, 1, 0.2745098, 0, 1,
-1.804678, 1.190254, 0.3661095, 1, 0.282353, 0, 1,
-1.795081, -0.05412131, -1.860392, 1, 0.2862745, 0, 1,
-1.791685, -0.9119824, -3.522112, 1, 0.2941177, 0, 1,
-1.78195, -0.06254834, -0.884319, 1, 0.3019608, 0, 1,
-1.765598, 0.8356023, -0.8828711, 1, 0.3058824, 0, 1,
-1.74855, 0.4876277, -2.854599, 1, 0.3137255, 0, 1,
-1.741275, 0.8212547, -1.483153, 1, 0.3176471, 0, 1,
-1.718192, -1.376746, -1.764879, 1, 0.3254902, 0, 1,
-1.715676, -0.6478366, -4.045028, 1, 0.3294118, 0, 1,
-1.699122, -0.667802, -2.501799, 1, 0.3372549, 0, 1,
-1.693244, 0.1721093, -0.7517402, 1, 0.3411765, 0, 1,
-1.682193, -1.93247, -2.789258, 1, 0.3490196, 0, 1,
-1.646824, -0.7107826, -2.893044, 1, 0.3529412, 0, 1,
-1.596392, -0.4366682, -2.190895, 1, 0.3607843, 0, 1,
-1.588574, 0.0616378, -2.329558, 1, 0.3647059, 0, 1,
-1.584065, 0.8591796, -0.8621403, 1, 0.372549, 0, 1,
-1.56001, 0.0730404, -1.706953, 1, 0.3764706, 0, 1,
-1.554405, -0.01854456, -3.76014, 1, 0.3843137, 0, 1,
-1.54895, 0.3485748, -1.654707, 1, 0.3882353, 0, 1,
-1.514611, 0.9471317, -0.7841806, 1, 0.3960784, 0, 1,
-1.498175, -2.052641, -2.376023, 1, 0.4039216, 0, 1,
-1.497044, -0.08449764, -0.4186152, 1, 0.4078431, 0, 1,
-1.490151, 1.228224, 0.1041328, 1, 0.4156863, 0, 1,
-1.485881, -1.054892, -2.82261, 1, 0.4196078, 0, 1,
-1.483257, -0.5787377, -0.6950774, 1, 0.427451, 0, 1,
-1.478599, 1.731243, -0.1549717, 1, 0.4313726, 0, 1,
-1.466275, -0.2273548, -0.6720653, 1, 0.4392157, 0, 1,
-1.456941, 0.6613253, -1.625725, 1, 0.4431373, 0, 1,
-1.439669, -1.713904, -2.641179, 1, 0.4509804, 0, 1,
-1.438826, -0.06567819, -2.36624, 1, 0.454902, 0, 1,
-1.43629, 0.7952738, -2.969003, 1, 0.4627451, 0, 1,
-1.427237, -1.462807, -3.427893, 1, 0.4666667, 0, 1,
-1.422238, -1.750457, -3.141794, 1, 0.4745098, 0, 1,
-1.416777, 0.4985134, -1.065134, 1, 0.4784314, 0, 1,
-1.414062, 1.106021, -0.6730146, 1, 0.4862745, 0, 1,
-1.389383, 0.0532143, -0.8825295, 1, 0.4901961, 0, 1,
-1.386283, -0.9586702, -2.058605, 1, 0.4980392, 0, 1,
-1.381634, 1.705794, -2.469769, 1, 0.5058824, 0, 1,
-1.378957, -0.5157468, -1.416314, 1, 0.509804, 0, 1,
-1.361284, -1.330029, -2.386908, 1, 0.5176471, 0, 1,
-1.34985, -0.1313448, -0.7076875, 1, 0.5215687, 0, 1,
-1.342173, 1.269577, -0.4650284, 1, 0.5294118, 0, 1,
-1.338316, -0.01657064, -0.427828, 1, 0.5333334, 0, 1,
-1.33592, -0.940001, -0.6885151, 1, 0.5411765, 0, 1,
-1.329103, 0.2302505, -0.02035766, 1, 0.5450981, 0, 1,
-1.323933, 0.4763799, -1.017182, 1, 0.5529412, 0, 1,
-1.323055, -1.138755, -0.4900573, 1, 0.5568628, 0, 1,
-1.310814, -0.3988922, -2.234436, 1, 0.5647059, 0, 1,
-1.306073, -0.8168638, -0.9159718, 1, 0.5686275, 0, 1,
-1.297289, 0.5855296, -0.4690011, 1, 0.5764706, 0, 1,
-1.291335, 0.6196418, -1.586664, 1, 0.5803922, 0, 1,
-1.286671, -0.01726823, -3.067779, 1, 0.5882353, 0, 1,
-1.286524, 0.6485513, -1.06139, 1, 0.5921569, 0, 1,
-1.284773, 0.809905, -1.458306, 1, 0.6, 0, 1,
-1.270998, -0.1258146, -2.178937, 1, 0.6078432, 0, 1,
-1.262211, 0.7276393, -2.869419, 1, 0.6117647, 0, 1,
-1.256456, 0.3157784, -0.4603915, 1, 0.6196079, 0, 1,
-1.255482, 1.093693, -1.777458, 1, 0.6235294, 0, 1,
-1.25146, 0.3452581, -0.6842166, 1, 0.6313726, 0, 1,
-1.249424, 0.1577397, -1.806921, 1, 0.6352941, 0, 1,
-1.248162, 0.02277059, -1.671697, 1, 0.6431373, 0, 1,
-1.241212, 0.2960894, -0.3492807, 1, 0.6470588, 0, 1,
-1.238615, 0.8081803, -0.9673873, 1, 0.654902, 0, 1,
-1.235128, 1.380212, -0.8026961, 1, 0.6588235, 0, 1,
-1.232657, 1.287308, 0.06036157, 1, 0.6666667, 0, 1,
-1.226776, -0.9078649, -1.747184, 1, 0.6705883, 0, 1,
-1.222255, -0.9654156, -1.222127, 1, 0.6784314, 0, 1,
-1.219609, -0.1108601, 0.179681, 1, 0.682353, 0, 1,
-1.217548, 0.4385739, -2.54722, 1, 0.6901961, 0, 1,
-1.207776, -0.4717524, -0.5014516, 1, 0.6941177, 0, 1,
-1.207489, -0.9644559, -2.952731, 1, 0.7019608, 0, 1,
-1.193589, -0.4337935, -1.100823, 1, 0.7098039, 0, 1,
-1.19182, 1.78259, -1.928742, 1, 0.7137255, 0, 1,
-1.189708, -1.036445, -1.532192, 1, 0.7215686, 0, 1,
-1.18379, 0.5991564, -0.7159933, 1, 0.7254902, 0, 1,
-1.18365, 0.7632197, -0.7993577, 1, 0.7333333, 0, 1,
-1.183508, -0.6442698, -0.1088065, 1, 0.7372549, 0, 1,
-1.176526, -0.9994389, -2.417473, 1, 0.7450981, 0, 1,
-1.169855, -1.1632, -1.796439, 1, 0.7490196, 0, 1,
-1.159035, 1.044747, 0.1522322, 1, 0.7568628, 0, 1,
-1.156945, -0.8937602, -0.9775016, 1, 0.7607843, 0, 1,
-1.150239, 0.1484543, -2.19379, 1, 0.7686275, 0, 1,
-1.148092, 0.9884942, -0.1022855, 1, 0.772549, 0, 1,
-1.144912, 1.13679, -3.135448, 1, 0.7803922, 0, 1,
-1.140214, -1.193634, -1.696636, 1, 0.7843137, 0, 1,
-1.129991, -0.3833812, -2.798682, 1, 0.7921569, 0, 1,
-1.123047, 0.5152932, 0.2078328, 1, 0.7960784, 0, 1,
-1.12101, -1.066614, -0.1135485, 1, 0.8039216, 0, 1,
-1.114302, -1.049009, -2.753724, 1, 0.8117647, 0, 1,
-1.110443, -1.316084, -2.396154, 1, 0.8156863, 0, 1,
-1.108211, 0.6795178, -1.394899, 1, 0.8235294, 0, 1,
-1.100294, 0.007656888, -3.854685, 1, 0.827451, 0, 1,
-1.096015, 0.4164448, -1.351589, 1, 0.8352941, 0, 1,
-1.092475, -0.1981814, -0.4586785, 1, 0.8392157, 0, 1,
-1.088596, -0.0773731, -2.871268, 1, 0.8470588, 0, 1,
-1.086993, 0.4257418, -1.659109, 1, 0.8509804, 0, 1,
-1.085297, 0.5764521, -2.456311, 1, 0.8588235, 0, 1,
-1.078866, 1.020893, -0.3148606, 1, 0.8627451, 0, 1,
-1.077763, -0.9547845, -3.28731, 1, 0.8705882, 0, 1,
-1.076174, -1.555969, -4.068427, 1, 0.8745098, 0, 1,
-1.067719, -1.874307, -2.565768, 1, 0.8823529, 0, 1,
-1.063867, 1.989345, -1.365164, 1, 0.8862745, 0, 1,
-1.061969, 0.9189819, -1.303359, 1, 0.8941177, 0, 1,
-1.061736, -1.729407, -2.554197, 1, 0.8980392, 0, 1,
-1.055595, -0.06216392, -4.250826, 1, 0.9058824, 0, 1,
-1.048013, -1.429625, -2.541388, 1, 0.9137255, 0, 1,
-1.047921, 0.3804604, -0.1855944, 1, 0.9176471, 0, 1,
-1.043674, 0.5536507, -0.440231, 1, 0.9254902, 0, 1,
-1.04275, 1.27678, -0.621815, 1, 0.9294118, 0, 1,
-1.04191, -0.3177712, -3.085674, 1, 0.9372549, 0, 1,
-1.036318, 0.4723877, -1.631529, 1, 0.9411765, 0, 1,
-1.036027, -0.5678963, -2.365939, 1, 0.9490196, 0, 1,
-1.032724, 0.4024459, -0.9030492, 1, 0.9529412, 0, 1,
-1.031351, 1.443321, 1.031982, 1, 0.9607843, 0, 1,
-1.031092, 0.7790524, -2.676301, 1, 0.9647059, 0, 1,
-1.030961, 0.273857, -0.769159, 1, 0.972549, 0, 1,
-1.021272, 1.508632, -0.2090819, 1, 0.9764706, 0, 1,
-1.014282, -1.107345, -1.47496, 1, 0.9843137, 0, 1,
-1.009013, -0.1626178, 0.7831798, 1, 0.9882353, 0, 1,
-1.005292, 0.8041054, -0.338299, 1, 0.9960784, 0, 1,
-0.9996681, -0.4226522, -2.758235, 0.9960784, 1, 0, 1,
-0.9952087, -0.5035578, -2.173672, 0.9921569, 1, 0, 1,
-0.9914089, 0.3453398, -3.025183, 0.9843137, 1, 0, 1,
-0.989722, 0.1192297, -1.698933, 0.9803922, 1, 0, 1,
-0.9889964, -0.4189081, -1.837981, 0.972549, 1, 0, 1,
-0.9853674, 0.09810456, 0.007287063, 0.9686275, 1, 0, 1,
-0.9845887, 0.3398283, -1.642359, 0.9607843, 1, 0, 1,
-0.9792805, 0.8202864, -0.6470042, 0.9568627, 1, 0, 1,
-0.9763595, -0.6237461, -2.716938, 0.9490196, 1, 0, 1,
-0.9760545, 0.1218598, -1.184471, 0.945098, 1, 0, 1,
-0.9745089, -0.5274718, -2.334536, 0.9372549, 1, 0, 1,
-0.9744883, 0.3543915, -0.632601, 0.9333333, 1, 0, 1,
-0.9686764, 0.6253044, -1.455837, 0.9254902, 1, 0, 1,
-0.9616749, 1.160589, -0.7739673, 0.9215686, 1, 0, 1,
-0.9610447, -0.3197838, -1.551116, 0.9137255, 1, 0, 1,
-0.9597713, -0.9704928, -4.416508, 0.9098039, 1, 0, 1,
-0.9582458, -0.9676726, -0.8660201, 0.9019608, 1, 0, 1,
-0.9576969, -1.607714, -3.653808, 0.8941177, 1, 0, 1,
-0.9566574, -0.3687181, -1.006323, 0.8901961, 1, 0, 1,
-0.9536235, -0.7277631, -1.900755, 0.8823529, 1, 0, 1,
-0.9518455, -1.975034, -2.633936, 0.8784314, 1, 0, 1,
-0.9510799, 0.3743771, -1.77469, 0.8705882, 1, 0, 1,
-0.9424221, -1.463163, -0.3195049, 0.8666667, 1, 0, 1,
-0.9420662, -1.616749, -2.794286, 0.8588235, 1, 0, 1,
-0.9342545, -0.6682498, -1.284452, 0.854902, 1, 0, 1,
-0.9269278, 0.1014368, -1.559439, 0.8470588, 1, 0, 1,
-0.9226028, -1.174382, 0.6012709, 0.8431373, 1, 0, 1,
-0.9165231, 2.887313, 1.908397, 0.8352941, 1, 0, 1,
-0.9141264, 0.3011135, -3.194223, 0.8313726, 1, 0, 1,
-0.9136899, 2.112584, -0.9283285, 0.8235294, 1, 0, 1,
-0.9126781, -1.658318, -2.192193, 0.8196079, 1, 0, 1,
-0.9083742, 1.843468, -0.345521, 0.8117647, 1, 0, 1,
-0.9065381, -0.2264054, -2.014423, 0.8078431, 1, 0, 1,
-0.8983559, -0.843941, -0.855246, 0.8, 1, 0, 1,
-0.8942231, 0.4860583, 0.5541236, 0.7921569, 1, 0, 1,
-0.8940643, 1.382828, -0.5908033, 0.7882353, 1, 0, 1,
-0.8932258, -0.219619, -3.017514, 0.7803922, 1, 0, 1,
-0.8873942, 0.4074952, -1.384291, 0.7764706, 1, 0, 1,
-0.882234, 0.6504036, -1.472063, 0.7686275, 1, 0, 1,
-0.8765333, 0.6727142, -1.593434, 0.7647059, 1, 0, 1,
-0.8708908, -1.10534, -2.185694, 0.7568628, 1, 0, 1,
-0.8664571, 1.699728, -1.624654, 0.7529412, 1, 0, 1,
-0.8645937, 0.01398573, -1.267168, 0.7450981, 1, 0, 1,
-0.8595752, -0.2887377, -3.67161, 0.7411765, 1, 0, 1,
-0.8524718, 0.1682436, -2.787651, 0.7333333, 1, 0, 1,
-0.8476145, 1.926557, -1.478709, 0.7294118, 1, 0, 1,
-0.841611, -0.3412199, -2.385003, 0.7215686, 1, 0, 1,
-0.8365803, 0.4442365, -1.887116, 0.7176471, 1, 0, 1,
-0.8353892, -0.4782219, -1.434062, 0.7098039, 1, 0, 1,
-0.8292353, 0.5201797, 0.01506476, 0.7058824, 1, 0, 1,
-0.8273344, -0.6649227, -2.801167, 0.6980392, 1, 0, 1,
-0.8175797, -0.3606303, -1.800808, 0.6901961, 1, 0, 1,
-0.8151808, 1.983816, -0.7710909, 0.6862745, 1, 0, 1,
-0.8102258, 0.8588654, -0.9065412, 0.6784314, 1, 0, 1,
-0.808536, -0.9435946, -1.322953, 0.6745098, 1, 0, 1,
-0.8077819, 1.365331, -2.094804, 0.6666667, 1, 0, 1,
-0.8071578, -0.07093414, -3.293575, 0.6627451, 1, 0, 1,
-0.7998319, 0.2939549, -3.800676, 0.654902, 1, 0, 1,
-0.7975855, -1.519549, -2.014183, 0.6509804, 1, 0, 1,
-0.79404, -0.5330412, -2.225788, 0.6431373, 1, 0, 1,
-0.7931551, 1.520014, -1.952225, 0.6392157, 1, 0, 1,
-0.7868755, 0.882525, -1.153932, 0.6313726, 1, 0, 1,
-0.7867049, 0.8748919, -0.9051493, 0.627451, 1, 0, 1,
-0.7862696, 0.1055702, -2.317571, 0.6196079, 1, 0, 1,
-0.7847648, 1.023474, 0.8965808, 0.6156863, 1, 0, 1,
-0.7796389, 0.6481743, -0.4584933, 0.6078432, 1, 0, 1,
-0.7795548, 0.396278, -1.878988, 0.6039216, 1, 0, 1,
-0.7789459, -2.144547, -3.403321, 0.5960785, 1, 0, 1,
-0.7734158, -0.5719766, -1.339654, 0.5882353, 1, 0, 1,
-0.7677183, -0.7421266, -2.046926, 0.5843138, 1, 0, 1,
-0.7675979, -1.571865, -2.39616, 0.5764706, 1, 0, 1,
-0.7658171, -0.3517006, -1.539384, 0.572549, 1, 0, 1,
-0.7637677, 2.045303, 1.602248, 0.5647059, 1, 0, 1,
-0.7603956, 1.067185, -2.36174, 0.5607843, 1, 0, 1,
-0.7596188, 0.6369604, 0.3707008, 0.5529412, 1, 0, 1,
-0.7594156, 0.03308823, -1.328319, 0.5490196, 1, 0, 1,
-0.7470835, 0.6341207, -0.9918719, 0.5411765, 1, 0, 1,
-0.7429512, -1.972174, -3.789712, 0.5372549, 1, 0, 1,
-0.7408662, 0.4656138, 1.966798e-05, 0.5294118, 1, 0, 1,
-0.7329649, 0.4461048, -2.528036, 0.5254902, 1, 0, 1,
-0.7317214, 1.838848, -3.362477, 0.5176471, 1, 0, 1,
-0.7236719, 0.7559472, -1.276641, 0.5137255, 1, 0, 1,
-0.7236679, -0.4796259, -1.547282, 0.5058824, 1, 0, 1,
-0.7201355, 1.384663, 0.3388756, 0.5019608, 1, 0, 1,
-0.7138758, -0.3714343, -1.163468, 0.4941176, 1, 0, 1,
-0.7130467, 1.02862, -0.7592846, 0.4862745, 1, 0, 1,
-0.7125515, -0.377559, -3.203339, 0.4823529, 1, 0, 1,
-0.7103627, -0.0415077, -2.507224, 0.4745098, 1, 0, 1,
-0.6988225, 0.2840806, -1.492863, 0.4705882, 1, 0, 1,
-0.6898112, 0.5839913, -1.747757, 0.4627451, 1, 0, 1,
-0.6891348, 1.036423, -1.632186, 0.4588235, 1, 0, 1,
-0.6801655, -1.475152, -1.723747, 0.4509804, 1, 0, 1,
-0.674282, 0.7936718, 0.2386411, 0.4470588, 1, 0, 1,
-0.6724848, -0.3873418, -2.265618, 0.4392157, 1, 0, 1,
-0.6718109, 0.1050207, -1.786305, 0.4352941, 1, 0, 1,
-0.6644526, -1.424182, -1.473843, 0.427451, 1, 0, 1,
-0.6640325, 0.6692876, -1.577901, 0.4235294, 1, 0, 1,
-0.6639696, -0.5804403, -2.322073, 0.4156863, 1, 0, 1,
-0.6605992, 0.9974838, -1.508236, 0.4117647, 1, 0, 1,
-0.6548811, 0.1078327, 0.6749192, 0.4039216, 1, 0, 1,
-0.6541752, -0.01038124, -0.7865387, 0.3960784, 1, 0, 1,
-0.6512007, 0.03849946, -1.236391, 0.3921569, 1, 0, 1,
-0.6501498, -0.8793334, -1.238903, 0.3843137, 1, 0, 1,
-0.649811, 1.966573, 0.04990575, 0.3803922, 1, 0, 1,
-0.6481372, 0.3335233, -0.08590215, 0.372549, 1, 0, 1,
-0.6416919, -1.928225, -3.592979, 0.3686275, 1, 0, 1,
-0.6404072, -1.50903, -3.401162, 0.3607843, 1, 0, 1,
-0.6398802, -0.0747814, -2.310825, 0.3568628, 1, 0, 1,
-0.6290876, -0.539223, -2.904258, 0.3490196, 1, 0, 1,
-0.6276388, 0.2304173, -1.939607, 0.345098, 1, 0, 1,
-0.6220998, -0.9090652, -1.518005, 0.3372549, 1, 0, 1,
-0.6131756, 2.242262, -0.9199938, 0.3333333, 1, 0, 1,
-0.6096257, -0.6219122, -1.786502, 0.3254902, 1, 0, 1,
-0.6046484, 0.6835275, -0.7012478, 0.3215686, 1, 0, 1,
-0.6039174, -0.07161126, -2.351446, 0.3137255, 1, 0, 1,
-0.603765, -1.48826, -1.247958, 0.3098039, 1, 0, 1,
-0.6027645, 0.0488552, -1.271991, 0.3019608, 1, 0, 1,
-0.5981054, -0.4500175, -2.413196, 0.2941177, 1, 0, 1,
-0.5952911, -0.7178555, -1.933503, 0.2901961, 1, 0, 1,
-0.5903628, 0.1353082, -3.075841, 0.282353, 1, 0, 1,
-0.5857753, -1.121801, -2.712547, 0.2784314, 1, 0, 1,
-0.5854877, 0.01728117, -1.829858, 0.2705882, 1, 0, 1,
-0.5829857, 0.2133399, -0.7255259, 0.2666667, 1, 0, 1,
-0.5800545, -0.01477644, -1.675117, 0.2588235, 1, 0, 1,
-0.5789771, -0.02734585, -2.25591, 0.254902, 1, 0, 1,
-0.5788454, -0.8840633, -3.090268, 0.2470588, 1, 0, 1,
-0.5782567, 1.177245, -1.707499, 0.2431373, 1, 0, 1,
-0.5780447, -0.9891677, -1.862343, 0.2352941, 1, 0, 1,
-0.5764009, 1.098484, -3.716314, 0.2313726, 1, 0, 1,
-0.5711656, 1.255022, 0.9901091, 0.2235294, 1, 0, 1,
-0.570389, 0.6603853, -0.03831517, 0.2196078, 1, 0, 1,
-0.56527, -1.711016, -1.966604, 0.2117647, 1, 0, 1,
-0.5635287, -0.9925697, -4.250418, 0.2078431, 1, 0, 1,
-0.5627021, 0.1042658, -0.3795001, 0.2, 1, 0, 1,
-0.5598723, 0.2339919, -0.8996332, 0.1921569, 1, 0, 1,
-0.5592896, -0.4231962, -1.002866, 0.1882353, 1, 0, 1,
-0.5586075, 0.3379689, -3.767438, 0.1803922, 1, 0, 1,
-0.557214, -0.9781618, -2.699964, 0.1764706, 1, 0, 1,
-0.5463645, -0.2771155, -1.863647, 0.1686275, 1, 0, 1,
-0.5367862, -0.06471623, -1.918232, 0.1647059, 1, 0, 1,
-0.5356318, 0.01237067, -3.34731, 0.1568628, 1, 0, 1,
-0.5310531, 0.378476, 2.165468, 0.1529412, 1, 0, 1,
-0.5257077, -0.01471757, -1.691193, 0.145098, 1, 0, 1,
-0.5209905, 0.3561031, 0.02220768, 0.1411765, 1, 0, 1,
-0.5157772, -1.115687, -2.860316, 0.1333333, 1, 0, 1,
-0.5151041, 0.01433621, -1.912165, 0.1294118, 1, 0, 1,
-0.5147879, 0.711741, -3.251848, 0.1215686, 1, 0, 1,
-0.5125716, 1.444241, -0.7898659, 0.1176471, 1, 0, 1,
-0.5124766, 1.414279, -0.5694777, 0.1098039, 1, 0, 1,
-0.5073344, 0.3240628, -2.284079, 0.1058824, 1, 0, 1,
-0.5064811, 1.627639, -0.1715053, 0.09803922, 1, 0, 1,
-0.5051281, -0.2965896, -4.063702, 0.09019608, 1, 0, 1,
-0.4951594, 0.3458853, 0.96286, 0.08627451, 1, 0, 1,
-0.4879555, -0.2683598, -1.576666, 0.07843138, 1, 0, 1,
-0.4842656, -1.162603, -3.313005, 0.07450981, 1, 0, 1,
-0.4828603, -1.139707, -4.147812, 0.06666667, 1, 0, 1,
-0.4746767, 1.479298, -0.744621, 0.0627451, 1, 0, 1,
-0.472901, 1.179972, -0.3410816, 0.05490196, 1, 0, 1,
-0.4711911, -0.8384968, -3.712443, 0.05098039, 1, 0, 1,
-0.4707138, -2.264385, -2.789979, 0.04313726, 1, 0, 1,
-0.4652081, -0.5023409, -3.929376, 0.03921569, 1, 0, 1,
-0.4650998, -1.556394, -3.803843, 0.03137255, 1, 0, 1,
-0.4636882, 0.1714022, -1.732547, 0.02745098, 1, 0, 1,
-0.4595184, 2.059698, 1.287282, 0.01960784, 1, 0, 1,
-0.4585707, -0.6272888, -2.795486, 0.01568628, 1, 0, 1,
-0.4536381, 1.100701, -0.7343961, 0.007843138, 1, 0, 1,
-0.4498991, 0.3040517, -2.555325, 0.003921569, 1, 0, 1,
-0.4445106, -0.7838982, -3.781147, 0, 1, 0.003921569, 1,
-0.4418888, 0.5576521, -0.8789854, 0, 1, 0.01176471, 1,
-0.4363091, 0.05442214, -1.185196, 0, 1, 0.01568628, 1,
-0.4351369, 0.877068, 0.56905, 0, 1, 0.02352941, 1,
-0.4323263, 0.9430017, 0.3394658, 0, 1, 0.02745098, 1,
-0.432209, -0.3807456, -1.416291, 0, 1, 0.03529412, 1,
-0.4318536, -1.132748, -2.529876, 0, 1, 0.03921569, 1,
-0.4310723, 1.244989, 0.8777773, 0, 1, 0.04705882, 1,
-0.4291911, 0.1266677, -2.559219, 0, 1, 0.05098039, 1,
-0.4278172, -0.5308151, -2.845412, 0, 1, 0.05882353, 1,
-0.4217338, -0.03578755, -2.43124, 0, 1, 0.0627451, 1,
-0.413033, -1.374818, -1.468687, 0, 1, 0.07058824, 1,
-0.4081636, -0.2790882, -1.230273, 0, 1, 0.07450981, 1,
-0.4080754, -1.173189, -5.201077, 0, 1, 0.08235294, 1,
-0.4062096, 1.969647, 0.2941833, 0, 1, 0.08627451, 1,
-0.4050788, -0.2263582, -1.789384, 0, 1, 0.09411765, 1,
-0.4037801, -1.502875, -2.895269, 0, 1, 0.1019608, 1,
-0.4034921, -0.9786231, -3.395274, 0, 1, 0.1058824, 1,
-0.3872534, 0.1444463, -3.09735, 0, 1, 0.1137255, 1,
-0.3833483, 1.52885, -0.5303519, 0, 1, 0.1176471, 1,
-0.3833389, 0.5919326, -0.5325194, 0, 1, 0.1254902, 1,
-0.3809247, -0.680558, -2.817994, 0, 1, 0.1294118, 1,
-0.3780409, -0.6942639, -4.092472, 0, 1, 0.1372549, 1,
-0.3705763, 0.8811382, -1.461472, 0, 1, 0.1411765, 1,
-0.3655931, 1.337464, -0.1079986, 0, 1, 0.1490196, 1,
-0.3648695, 0.7111941, 0.2678111, 0, 1, 0.1529412, 1,
-0.3644847, -0.3784575, -3.260992, 0, 1, 0.1607843, 1,
-0.3612514, -0.7142885, -2.880367, 0, 1, 0.1647059, 1,
-0.3599696, 0.2213294, -1.456576, 0, 1, 0.172549, 1,
-0.3595749, -0.6453545, -3.032934, 0, 1, 0.1764706, 1,
-0.3547637, 0.3817337, 0.175719, 0, 1, 0.1843137, 1,
-0.3505862, 0.2402477, -1.014773, 0, 1, 0.1882353, 1,
-0.3496201, -0.5050323, -1.887147, 0, 1, 0.1960784, 1,
-0.3424146, 2.55912, -1.759764, 0, 1, 0.2039216, 1,
-0.338405, 0.7860608, -0.4103647, 0, 1, 0.2078431, 1,
-0.3383062, 1.463741, -0.4146771, 0, 1, 0.2156863, 1,
-0.3372901, -0.258215, -3.506118, 0, 1, 0.2196078, 1,
-0.33729, 1.704166, -0.6712981, 0, 1, 0.227451, 1,
-0.3371047, -0.1558357, -2.903778, 0, 1, 0.2313726, 1,
-0.336382, 1.355436, 0.0382087, 0, 1, 0.2392157, 1,
-0.3363069, -2.109779, -2.772525, 0, 1, 0.2431373, 1,
-0.3328689, 0.2473466, 0.7199865, 0, 1, 0.2509804, 1,
-0.3292478, -0.3607576, -1.442998, 0, 1, 0.254902, 1,
-0.327815, 0.8205587, 0.1583957, 0, 1, 0.2627451, 1,
-0.3265522, -0.330053, -3.171633, 0, 1, 0.2666667, 1,
-0.3265026, -1.038101, -3.79006, 0, 1, 0.2745098, 1,
-0.3216205, 0.1493359, -2.79933, 0, 1, 0.2784314, 1,
-0.3209803, 0.7666412, -0.3690031, 0, 1, 0.2862745, 1,
-0.3179632, -0.6043199, -3.016776, 0, 1, 0.2901961, 1,
-0.3147616, -0.134317, -1.295975, 0, 1, 0.2980392, 1,
-0.3132504, -2.949486, -2.714204, 0, 1, 0.3058824, 1,
-0.3092946, 1.42467, -0.964903, 0, 1, 0.3098039, 1,
-0.3075857, 0.4988267, 0.3725981, 0, 1, 0.3176471, 1,
-0.2898923, -0.927021, -2.778528, 0, 1, 0.3215686, 1,
-0.2888753, -0.2628837, -0.5321258, 0, 1, 0.3294118, 1,
-0.2857028, 0.0227583, -0.9547212, 0, 1, 0.3333333, 1,
-0.2834417, -0.8536589, -4.23678, 0, 1, 0.3411765, 1,
-0.2825522, 0.9045582, -2.163564, 0, 1, 0.345098, 1,
-0.2819093, 0.1460698, -0.4566693, 0, 1, 0.3529412, 1,
-0.2798503, 1.810909, 0.9733083, 0, 1, 0.3568628, 1,
-0.2775841, 1.54803, -1.073884, 0, 1, 0.3647059, 1,
-0.2754638, 1.192457, -1.383905, 0, 1, 0.3686275, 1,
-0.2741916, -1.268808, -2.374902, 0, 1, 0.3764706, 1,
-0.2705606, -1.316979, -2.981802, 0, 1, 0.3803922, 1,
-0.2704618, -0.8826738, -2.578224, 0, 1, 0.3882353, 1,
-0.2697874, 1.251243, -0.5534267, 0, 1, 0.3921569, 1,
-0.2665707, 0.4132287, 0.4643746, 0, 1, 0.4, 1,
-0.2619949, -0.4344395, -1.658663, 0, 1, 0.4078431, 1,
-0.2586393, 1.312715, 0.05980689, 0, 1, 0.4117647, 1,
-0.2504731, 1.289411, 2.426274, 0, 1, 0.4196078, 1,
-0.2502062, 0.2785265, -0.7754148, 0, 1, 0.4235294, 1,
-0.2463649, -0.6444405, -2.385199, 0, 1, 0.4313726, 1,
-0.2435758, 0.4654703, -0.8418877, 0, 1, 0.4352941, 1,
-0.2427176, -1.583701, -4.335705, 0, 1, 0.4431373, 1,
-0.2386117, 0.1393176, -2.726935, 0, 1, 0.4470588, 1,
-0.2384313, 0.9565358, 0.3268513, 0, 1, 0.454902, 1,
-0.2378094, 1.509284, -1.208556, 0, 1, 0.4588235, 1,
-0.2374092, 0.2960891, -1.885468, 0, 1, 0.4666667, 1,
-0.2363596, -0.08011863, -0.9767665, 0, 1, 0.4705882, 1,
-0.2348972, -1.823337, -3.506326, 0, 1, 0.4784314, 1,
-0.2334505, 0.8368746, -0.7161655, 0, 1, 0.4823529, 1,
-0.2325951, 0.6111042, -0.3097555, 0, 1, 0.4901961, 1,
-0.2307433, 1.092457, 1.463805, 0, 1, 0.4941176, 1,
-0.227136, -1.690669, -1.338748, 0, 1, 0.5019608, 1,
-0.2191504, -0.2946176, -1.624045, 0, 1, 0.509804, 1,
-0.2159666, -0.8816465, -2.938269, 0, 1, 0.5137255, 1,
-0.2058443, -0.6997831, -3.151683, 0, 1, 0.5215687, 1,
-0.2054482, 0.7297718, -0.3984334, 0, 1, 0.5254902, 1,
-0.2023528, 0.3286317, -1.73879, 0, 1, 0.5333334, 1,
-0.1948906, 0.7322786, -1.065441, 0, 1, 0.5372549, 1,
-0.1941006, -0.9770002, -3.378516, 0, 1, 0.5450981, 1,
-0.1934215, 0.1677062, -0.9448069, 0, 1, 0.5490196, 1,
-0.1917761, -0.4514335, -1.888953, 0, 1, 0.5568628, 1,
-0.1915895, -0.4849266, -2.63209, 0, 1, 0.5607843, 1,
-0.1888856, -0.290021, -3.345515, 0, 1, 0.5686275, 1,
-0.1799794, -0.3837036, -3.710597, 0, 1, 0.572549, 1,
-0.1770998, -1.29442, -3.828512, 0, 1, 0.5803922, 1,
-0.1758185, -0.5556078, -2.287822, 0, 1, 0.5843138, 1,
-0.1748256, 0.1483894, -0.2317819, 0, 1, 0.5921569, 1,
-0.1740421, -0.1100858, -2.869314, 0, 1, 0.5960785, 1,
-0.1732791, 0.17789, -1.545237, 0, 1, 0.6039216, 1,
-0.1727589, -0.3925217, -1.859946, 0, 1, 0.6117647, 1,
-0.1645094, -0.2014584, -2.446849, 0, 1, 0.6156863, 1,
-0.1628316, 0.936629, -1.573249, 0, 1, 0.6235294, 1,
-0.16061, 0.2910784, -1.926928, 0, 1, 0.627451, 1,
-0.1589893, -0.2885042, -2.328043, 0, 1, 0.6352941, 1,
-0.158488, 0.1392101, -1.152797, 0, 1, 0.6392157, 1,
-0.1577104, -1.483652, -3.780818, 0, 1, 0.6470588, 1,
-0.1532305, 1.88516, 0.1430067, 0, 1, 0.6509804, 1,
-0.151148, 0.1570083, 0.4293487, 0, 1, 0.6588235, 1,
-0.149567, 1.291624, 0.7577705, 0, 1, 0.6627451, 1,
-0.1464678, 2.332373, 2.143458, 0, 1, 0.6705883, 1,
-0.1450282, 0.7627443, -0.8498001, 0, 1, 0.6745098, 1,
-0.1332459, -1.094244, -2.0433, 0, 1, 0.682353, 1,
-0.1325025, -3.050202, -2.925611, 0, 1, 0.6862745, 1,
-0.1310534, -1.307579, -3.125215, 0, 1, 0.6941177, 1,
-0.123643, 0.686657, -1.359576, 0, 1, 0.7019608, 1,
-0.1232996, -2.279985, -2.549485, 0, 1, 0.7058824, 1,
-0.1197899, -0.05021642, -1.250375, 0, 1, 0.7137255, 1,
-0.118746, 1.095651, 0.696757, 0, 1, 0.7176471, 1,
-0.1160971, -0.1496361, -2.289869, 0, 1, 0.7254902, 1,
-0.1160122, 0.17745, -0.01089939, 0, 1, 0.7294118, 1,
-0.1127388, 1.1243, 0.1634414, 0, 1, 0.7372549, 1,
-0.1122783, 1.532045, 1.410683, 0, 1, 0.7411765, 1,
-0.1086181, 0.08233309, -1.831535, 0, 1, 0.7490196, 1,
-0.1040004, 0.4700736, -0.8497844, 0, 1, 0.7529412, 1,
-0.1024132, -1.55444, -3.369788, 0, 1, 0.7607843, 1,
-0.09936461, 0.9838011, -0.4641663, 0, 1, 0.7647059, 1,
-0.0982446, 0.653325, -0.4082024, 0, 1, 0.772549, 1,
-0.09636715, -1.846106, -3.75814, 0, 1, 0.7764706, 1,
-0.0942049, -0.8655816, -3.337694, 0, 1, 0.7843137, 1,
-0.09262805, 1.942139, 0.1792812, 0, 1, 0.7882353, 1,
-0.0925514, 2.108599, 0.3728885, 0, 1, 0.7960784, 1,
-0.09129419, 0.8374481, -1.21065, 0, 1, 0.8039216, 1,
-0.09117993, 1.719273, -1.231705, 0, 1, 0.8078431, 1,
-0.08991989, 0.3913073, -0.883741, 0, 1, 0.8156863, 1,
-0.08917236, 0.1029211, -1.073355, 0, 1, 0.8196079, 1,
-0.08846799, -0.2114096, -2.16922, 0, 1, 0.827451, 1,
-0.07575528, -1.635027, -2.879438, 0, 1, 0.8313726, 1,
-0.0752243, -0.8553286, -3.75662, 0, 1, 0.8392157, 1,
-0.07472994, -1.867645, -3.954197, 0, 1, 0.8431373, 1,
-0.07274207, 0.3222038, -1.245227, 0, 1, 0.8509804, 1,
-0.06554036, 1.159358, -0.3407919, 0, 1, 0.854902, 1,
-0.06196302, 0.6306211, -0.3967232, 0, 1, 0.8627451, 1,
-0.05756705, -0.8493495, -4.065202, 0, 1, 0.8666667, 1,
-0.05750174, 1.377255, -0.5790391, 0, 1, 0.8745098, 1,
-0.05265193, 0.7403714, -0.3974408, 0, 1, 0.8784314, 1,
-0.05167589, -0.8537287, -2.660542, 0, 1, 0.8862745, 1,
-0.04993167, -0.2308506, -5.553816, 0, 1, 0.8901961, 1,
-0.04907621, -0.9362113, -3.200288, 0, 1, 0.8980392, 1,
-0.04721252, -0.4694651, -4.243245, 0, 1, 0.9058824, 1,
-0.04211156, -0.1417329, -1.650416, 0, 1, 0.9098039, 1,
-0.03574736, 0.6352805, -1.20773, 0, 1, 0.9176471, 1,
-0.03522838, 1.229722, 1.980482, 0, 1, 0.9215686, 1,
-0.0333917, -1.42776, -2.808183, 0, 1, 0.9294118, 1,
-0.03008168, 0.6052638, 1.101734, 0, 1, 0.9333333, 1,
-0.02660623, -0.8736097, -1.59394, 0, 1, 0.9411765, 1,
-0.02319443, 2.358, -0.2144043, 0, 1, 0.945098, 1,
-0.02096036, -0.9380425, -3.580731, 0, 1, 0.9529412, 1,
-0.02050157, -0.9393817, -4.792012, 0, 1, 0.9568627, 1,
-0.01799216, 0.4197214, 0.692342, 0, 1, 0.9647059, 1,
-0.01778271, -0.8645258, -3.521478, 0, 1, 0.9686275, 1,
-0.01644093, 0.5522938, -0.3492435, 0, 1, 0.9764706, 1,
-0.008442844, 1.390986, 0.6902065, 0, 1, 0.9803922, 1,
-0.007476579, -0.4189248, -1.04091, 0, 1, 0.9882353, 1,
-0.005735217, 1.044617, -0.8105068, 0, 1, 0.9921569, 1,
-0.002184565, -0.8140037, -2.790286, 0, 1, 1, 1,
-9.619286e-05, 1.441697, -1.579695, 0, 0.9921569, 1, 1,
0.009887262, -0.7486567, 2.91131, 0, 0.9882353, 1, 1,
0.009946918, -0.4746528, 4.211026, 0, 0.9803922, 1, 1,
0.01360626, 1.451089, 0.4914052, 0, 0.9764706, 1, 1,
0.01934977, -0.3219963, 3.521108, 0, 0.9686275, 1, 1,
0.02107098, -0.3587097, 2.533947, 0, 0.9647059, 1, 1,
0.02263257, 0.6992075, 1.13725, 0, 0.9568627, 1, 1,
0.02420276, -0.3667212, 2.048993, 0, 0.9529412, 1, 1,
0.02447657, 0.7190114, -2.324031, 0, 0.945098, 1, 1,
0.03395275, 0.5722388, -1.240562, 0, 0.9411765, 1, 1,
0.03496244, -0.2808051, 4.051303, 0, 0.9333333, 1, 1,
0.0359251, -1.53444, 4.039095, 0, 0.9294118, 1, 1,
0.03982171, -0.1428211, 4.603826, 0, 0.9215686, 1, 1,
0.0411473, -0.4578528, 1.972776, 0, 0.9176471, 1, 1,
0.04203823, -0.1845352, 4.069842, 0, 0.9098039, 1, 1,
0.04205709, 0.8589013, 1.066278, 0, 0.9058824, 1, 1,
0.04346213, 1.312245, 0.1906385, 0, 0.8980392, 1, 1,
0.04860292, -1.078135, 2.669269, 0, 0.8901961, 1, 1,
0.05151092, -0.5874081, 4.342981, 0, 0.8862745, 1, 1,
0.05298781, 0.6717293, -1.130178, 0, 0.8784314, 1, 1,
0.05428001, -0.2221579, 3.18716, 0, 0.8745098, 1, 1,
0.05777507, 0.3007331, 2.399906, 0, 0.8666667, 1, 1,
0.06047369, 1.419327, 0.5122835, 0, 0.8627451, 1, 1,
0.06079054, -0.1511505, 4.365039, 0, 0.854902, 1, 1,
0.06698574, 0.3413561, 0.5052923, 0, 0.8509804, 1, 1,
0.06919287, 0.8613632, 0.01589101, 0, 0.8431373, 1, 1,
0.07221321, 0.9982696, 1.400261, 0, 0.8392157, 1, 1,
0.07592524, 0.7603793, -0.1367414, 0, 0.8313726, 1, 1,
0.07611266, 0.7193434, 0.6617385, 0, 0.827451, 1, 1,
0.0765103, 0.238582, 2.487435, 0, 0.8196079, 1, 1,
0.07734974, -1.012442, 2.586807, 0, 0.8156863, 1, 1,
0.07807681, 1.430631, 0.1610109, 0, 0.8078431, 1, 1,
0.078284, 1.340327, 1.374161, 0, 0.8039216, 1, 1,
0.08419588, -1.93154, 3.494973, 0, 0.7960784, 1, 1,
0.08639303, 1.046681, -0.5701385, 0, 0.7882353, 1, 1,
0.09217537, -0.6228271, 1.606252, 0, 0.7843137, 1, 1,
0.09339108, -2.03615, 3.277837, 0, 0.7764706, 1, 1,
0.1193015, 0.6352193, 1.170959, 0, 0.772549, 1, 1,
0.1195659, -0.1160055, 1.796505, 0, 0.7647059, 1, 1,
0.1238564, 1.096189, -0.2523231, 0, 0.7607843, 1, 1,
0.1260584, -1.023643, 1.663439, 0, 0.7529412, 1, 1,
0.1310272, 0.899902, -0.4806933, 0, 0.7490196, 1, 1,
0.1318529, 0.5086498, 0.7981458, 0, 0.7411765, 1, 1,
0.1323844, -0.9508501, 2.151483, 0, 0.7372549, 1, 1,
0.1348723, 0.7748108, 1.988518, 0, 0.7294118, 1, 1,
0.1375829, 0.6331614, -0.5792202, 0, 0.7254902, 1, 1,
0.1384024, 0.1623202, 1.332434, 0, 0.7176471, 1, 1,
0.1415973, -0.1818786, -0.2683964, 0, 0.7137255, 1, 1,
0.1451802, 0.8260338, 0.02235839, 0, 0.7058824, 1, 1,
0.1509438, -0.2137007, 1.59206, 0, 0.6980392, 1, 1,
0.154924, -0.1027403, 1.941603, 0, 0.6941177, 1, 1,
0.154962, 0.2190397, -1.48283, 0, 0.6862745, 1, 1,
0.1554115, -1.155063, 3.215949, 0, 0.682353, 1, 1,
0.1567773, 1.303967, -0.4863785, 0, 0.6745098, 1, 1,
0.1572074, 0.31696, 1.709147, 0, 0.6705883, 1, 1,
0.1599457, 0.2021756, -0.1677405, 0, 0.6627451, 1, 1,
0.160902, -0.04021704, 1.745211, 0, 0.6588235, 1, 1,
0.1645694, -0.9830402, 2.865208, 0, 0.6509804, 1, 1,
0.1649914, 0.5362576, 0.6162104, 0, 0.6470588, 1, 1,
0.1650616, -0.4162317, 3.172552, 0, 0.6392157, 1, 1,
0.1654221, 0.6650696, 0.538238, 0, 0.6352941, 1, 1,
0.1721918, 0.5028086, -0.7887167, 0, 0.627451, 1, 1,
0.1741296, -1.55241, 4.103118, 0, 0.6235294, 1, 1,
0.1754998, -0.7741711, 3.52455, 0, 0.6156863, 1, 1,
0.180961, -0.2518552, 3.558576, 0, 0.6117647, 1, 1,
0.1826761, 0.6063657, -1.441905, 0, 0.6039216, 1, 1,
0.1827321, 0.3075525, 1.776342, 0, 0.5960785, 1, 1,
0.185897, -0.1717965, 2.328124, 0, 0.5921569, 1, 1,
0.193596, 0.2812697, 1.06855, 0, 0.5843138, 1, 1,
0.1984769, 0.2703342, 1.083081, 0, 0.5803922, 1, 1,
0.1992622, -0.7495915, 2.948545, 0, 0.572549, 1, 1,
0.2017192, -0.02209738, 1.322565, 0, 0.5686275, 1, 1,
0.2026876, 0.1764114, 0.07138572, 0, 0.5607843, 1, 1,
0.2091295, -0.4407022, 3.61861, 0, 0.5568628, 1, 1,
0.2118739, -0.5530234, 2.123123, 0, 0.5490196, 1, 1,
0.2155646, 0.05540544, 2.026342, 0, 0.5450981, 1, 1,
0.2183124, -1.464479, 1.473695, 0, 0.5372549, 1, 1,
0.223009, -1.363358, 2.436291, 0, 0.5333334, 1, 1,
0.2259873, 1.526635, 0.7821502, 0, 0.5254902, 1, 1,
0.2307958, 0.5780281, 0.919386, 0, 0.5215687, 1, 1,
0.2314599, 0.6800367, -0.1194346, 0, 0.5137255, 1, 1,
0.2327229, 0.9066688, 1.193111, 0, 0.509804, 1, 1,
0.2374448, -0.7024089, 0.6898822, 0, 0.5019608, 1, 1,
0.2404174, 0.1829751, 0.3352099, 0, 0.4941176, 1, 1,
0.2428607, -0.8633626, 2.497067, 0, 0.4901961, 1, 1,
0.2444178, 0.05067073, 0.9970054, 0, 0.4823529, 1, 1,
0.2460596, 1.357386, -0.006136771, 0, 0.4784314, 1, 1,
0.2463278, -1.393155, 3.927149, 0, 0.4705882, 1, 1,
0.2468662, -1.836474, 2.398804, 0, 0.4666667, 1, 1,
0.2499657, -0.9979454, 3.038116, 0, 0.4588235, 1, 1,
0.2558461, 1.570152, 0.4692104, 0, 0.454902, 1, 1,
0.2596056, 0.7009789, 0.6014403, 0, 0.4470588, 1, 1,
0.2601246, -0.2240794, 2.183601, 0, 0.4431373, 1, 1,
0.2641253, 0.7337644, 1.351092, 0, 0.4352941, 1, 1,
0.2683379, 0.5216087, -0.7759202, 0, 0.4313726, 1, 1,
0.2699872, -0.7269102, 3.327248, 0, 0.4235294, 1, 1,
0.2709032, -0.8507925, 4.041138, 0, 0.4196078, 1, 1,
0.2740493, 0.1816782, -0.08099151, 0, 0.4117647, 1, 1,
0.2771035, -0.2442114, 1.559409, 0, 0.4078431, 1, 1,
0.2775788, 0.6231618, 0.2252342, 0, 0.4, 1, 1,
0.278701, -0.4306444, 3.108772, 0, 0.3921569, 1, 1,
0.281797, 0.3409323, 1.028816, 0, 0.3882353, 1, 1,
0.2827742, 0.1900496, 2.414287, 0, 0.3803922, 1, 1,
0.2830225, -0.2252126, 3.356175, 0, 0.3764706, 1, 1,
0.2836363, -1.031603, 2.773016, 0, 0.3686275, 1, 1,
0.2848073, 0.7326428, -0.322008, 0, 0.3647059, 1, 1,
0.28739, 1.898413, -0.7783577, 0, 0.3568628, 1, 1,
0.2885547, -0.8328578, 3.85981, 0, 0.3529412, 1, 1,
0.2891081, 0.9656805, 0.7970274, 0, 0.345098, 1, 1,
0.295398, 0.7848113, -1.231951, 0, 0.3411765, 1, 1,
0.3019167, -0.1778651, 2.159152, 0, 0.3333333, 1, 1,
0.302308, 0.2657682, -0.3999284, 0, 0.3294118, 1, 1,
0.3031697, -0.2750973, 3.567094, 0, 0.3215686, 1, 1,
0.3033886, -0.5451689, 3.039183, 0, 0.3176471, 1, 1,
0.3059605, 1.359238, -1.391834, 0, 0.3098039, 1, 1,
0.309322, 0.5122957, 0.8557451, 0, 0.3058824, 1, 1,
0.309908, 1.725197, 0.2406613, 0, 0.2980392, 1, 1,
0.3116346, 1.330146, -0.1974544, 0, 0.2901961, 1, 1,
0.312275, -1.10988, 1.148876, 0, 0.2862745, 1, 1,
0.3123818, 1.379582, -1.214033, 0, 0.2784314, 1, 1,
0.3144674, 0.887549, -0.172571, 0, 0.2745098, 1, 1,
0.315318, -0.2878975, 2.309837, 0, 0.2666667, 1, 1,
0.3162087, 1.149178, -0.02574991, 0, 0.2627451, 1, 1,
0.3214968, -0.9606373, 3.274347, 0, 0.254902, 1, 1,
0.3221126, 0.1973333, 0.4291772, 0, 0.2509804, 1, 1,
0.3225442, -1.139534, 1.424064, 0, 0.2431373, 1, 1,
0.3292271, 0.8895097, -0.4287342, 0, 0.2392157, 1, 1,
0.3307761, -0.8078409, 3.863191, 0, 0.2313726, 1, 1,
0.3311546, 0.3024904, 0.216792, 0, 0.227451, 1, 1,
0.3317766, 1.379179, 1.236173, 0, 0.2196078, 1, 1,
0.3322719, 0.2630285, 1.127682, 0, 0.2156863, 1, 1,
0.3343911, -0.07598522, 1.526188, 0, 0.2078431, 1, 1,
0.3379542, 0.543978, -1.227297, 0, 0.2039216, 1, 1,
0.339082, -2.696537, 3.67286, 0, 0.1960784, 1, 1,
0.3447431, 0.593356, 0.9204662, 0, 0.1882353, 1, 1,
0.3457936, -0.8647584, 1.684435, 0, 0.1843137, 1, 1,
0.3462036, 0.4080527, 0.1889427, 0, 0.1764706, 1, 1,
0.3466768, -0.7963564, 3.383426, 0, 0.172549, 1, 1,
0.3468501, 0.5684363, 1.388401, 0, 0.1647059, 1, 1,
0.3478463, -0.9027429, 3.038071, 0, 0.1607843, 1, 1,
0.3502407, 0.9553, -0.4623924, 0, 0.1529412, 1, 1,
0.3506836, -1.252241, 2.189706, 0, 0.1490196, 1, 1,
0.3525493, -1.417527, 1.835734, 0, 0.1411765, 1, 1,
0.3537515, 0.4768699, -0.131091, 0, 0.1372549, 1, 1,
0.3544926, -0.3182134, 3.872412, 0, 0.1294118, 1, 1,
0.3599343, -0.4828412, 2.349841, 0, 0.1254902, 1, 1,
0.3634329, -1.249501, 1.197989, 0, 0.1176471, 1, 1,
0.367194, 0.1884157, 0.1714756, 0, 0.1137255, 1, 1,
0.3682033, 0.6031407, 0.5503733, 0, 0.1058824, 1, 1,
0.3707513, -0.4862781, 1.748914, 0, 0.09803922, 1, 1,
0.3713407, 1.182447, 0.06239507, 0, 0.09411765, 1, 1,
0.3720821, -0.09408233, 1.653617, 0, 0.08627451, 1, 1,
0.3749134, -0.2486175, 1.433157, 0, 0.08235294, 1, 1,
0.3758602, 0.8853124, -0.09715168, 0, 0.07450981, 1, 1,
0.3769356, 0.2176052, 1.579895, 0, 0.07058824, 1, 1,
0.3797267, 1.604747, 0.2603005, 0, 0.0627451, 1, 1,
0.3819416, 0.1491535, -0.244718, 0, 0.05882353, 1, 1,
0.3829916, -0.312686, 2.116907, 0, 0.05098039, 1, 1,
0.39041, -0.7905889, 0.03444847, 0, 0.04705882, 1, 1,
0.3925652, 0.6076499, -0.440481, 0, 0.03921569, 1, 1,
0.392696, 0.334719, 1.397522, 0, 0.03529412, 1, 1,
0.3929456, -0.6826493, 3.751957, 0, 0.02745098, 1, 1,
0.3938542, -0.324594, 1.892199, 0, 0.02352941, 1, 1,
0.3971871, -0.4653738, 2.398632, 0, 0.01568628, 1, 1,
0.3993734, 1.101993, 0.6741505, 0, 0.01176471, 1, 1,
0.4031883, -0.9630983, 2.822755, 0, 0.003921569, 1, 1,
0.4070199, 0.1772788, 2.372156, 0.003921569, 0, 1, 1,
0.4084373, -1.417705, 1.946289, 0.007843138, 0, 1, 1,
0.4086595, 0.1919369, 1.456981, 0.01568628, 0, 1, 1,
0.4096995, -1.398614, 3.714958, 0.01960784, 0, 1, 1,
0.4097558, -0.7437698, 2.987763, 0.02745098, 0, 1, 1,
0.4112034, 0.548892, 0.2006343, 0.03137255, 0, 1, 1,
0.4164808, -0.03800442, 0.4358798, 0.03921569, 0, 1, 1,
0.4185683, -1.542964, 2.746104, 0.04313726, 0, 1, 1,
0.4191593, 0.5878758, 0.1854341, 0.05098039, 0, 1, 1,
0.4254403, -0.6529038, 2.133303, 0.05490196, 0, 1, 1,
0.4322204, -0.8734446, 4.609256, 0.0627451, 0, 1, 1,
0.4422809, -1.479634, 2.675013, 0.06666667, 0, 1, 1,
0.443778, -1.661423, 2.376929, 0.07450981, 0, 1, 1,
0.445503, -0.6818194, 2.264785, 0.07843138, 0, 1, 1,
0.4514136, 0.6798208, 1.34281, 0.08627451, 0, 1, 1,
0.454084, -1.470336, 2.076337, 0.09019608, 0, 1, 1,
0.4557597, -1.189919, 3.45647, 0.09803922, 0, 1, 1,
0.4596924, -0.3766885, 3.263024, 0.1058824, 0, 1, 1,
0.4620415, -1.018792, 3.472566, 0.1098039, 0, 1, 1,
0.4631839, 2.378824, -0.3157085, 0.1176471, 0, 1, 1,
0.4648977, 1.669266, 0.4839785, 0.1215686, 0, 1, 1,
0.467484, 0.3841698, -0.508017, 0.1294118, 0, 1, 1,
0.4687257, -0.09228831, 3.236856, 0.1333333, 0, 1, 1,
0.4698925, -0.4035905, 3.067426, 0.1411765, 0, 1, 1,
0.4706301, -1.134118, 3.549535, 0.145098, 0, 1, 1,
0.4721185, 1.099912, -1.268709, 0.1529412, 0, 1, 1,
0.4761379, -0.485355, 2.027735, 0.1568628, 0, 1, 1,
0.4768494, -0.002074285, 1.784861, 0.1647059, 0, 1, 1,
0.4775262, 0.3154019, 1.129509, 0.1686275, 0, 1, 1,
0.4782434, -2.116401, 2.328247, 0.1764706, 0, 1, 1,
0.481022, 1.561492, -1.677968, 0.1803922, 0, 1, 1,
0.4840762, -0.13217, 1.896408, 0.1882353, 0, 1, 1,
0.4840876, -0.7376761, 2.858138, 0.1921569, 0, 1, 1,
0.485208, -0.4700334, 1.318246, 0.2, 0, 1, 1,
0.4857578, -1.505682, 4.008033, 0.2078431, 0, 1, 1,
0.4886085, -1.148327, 1.014196, 0.2117647, 0, 1, 1,
0.4898186, 0.00516833, 1.531014, 0.2196078, 0, 1, 1,
0.4915095, 0.7932168, -0.7919411, 0.2235294, 0, 1, 1,
0.4948692, 1.472594, 0.8951973, 0.2313726, 0, 1, 1,
0.4969607, -1.024956, 3.449299, 0.2352941, 0, 1, 1,
0.4995437, 0.5892569, 1.061029, 0.2431373, 0, 1, 1,
0.510992, 0.5091519, 0.2360115, 0.2470588, 0, 1, 1,
0.5149539, -0.9614909, 2.229512, 0.254902, 0, 1, 1,
0.5153843, 0.3568825, 0.4942934, 0.2588235, 0, 1, 1,
0.5168274, -0.01345328, 0.5320678, 0.2666667, 0, 1, 1,
0.5207742, -1.119959, 2.473341, 0.2705882, 0, 1, 1,
0.5223836, 0.01615735, 2.738355, 0.2784314, 0, 1, 1,
0.5300593, 0.8807222, -0.4001538, 0.282353, 0, 1, 1,
0.5346545, 0.6940432, 1.367897, 0.2901961, 0, 1, 1,
0.538219, 0.6624264, 1.267897, 0.2941177, 0, 1, 1,
0.5394931, -0.2192062, 1.503528, 0.3019608, 0, 1, 1,
0.5399136, 1.126418, 0.06293127, 0.3098039, 0, 1, 1,
0.540794, -0.3599617, 2.710733, 0.3137255, 0, 1, 1,
0.5434942, 0.1462472, 1.744291, 0.3215686, 0, 1, 1,
0.5475157, -1.647377, 0.2629035, 0.3254902, 0, 1, 1,
0.5497219, 1.735772, 0.3876183, 0.3333333, 0, 1, 1,
0.551087, 1.011971, -0.1249843, 0.3372549, 0, 1, 1,
0.5574595, -0.4764359, 1.346188, 0.345098, 0, 1, 1,
0.5678294, -0.2122958, 1.047377, 0.3490196, 0, 1, 1,
0.5760987, -0.9259949, 1.589836, 0.3568628, 0, 1, 1,
0.5782828, 0.7679887, 1.210889, 0.3607843, 0, 1, 1,
0.5805593, 0.9113878, 1.398358, 0.3686275, 0, 1, 1,
0.5839854, 0.6228411, 1.587969, 0.372549, 0, 1, 1,
0.5866525, -1.475818, 3.562089, 0.3803922, 0, 1, 1,
0.5873624, -0.4569755, 1.868562, 0.3843137, 0, 1, 1,
0.5892157, 1.064553, -0.02104456, 0.3921569, 0, 1, 1,
0.5892811, 0.8321863, 0.9792818, 0.3960784, 0, 1, 1,
0.5924636, -0.8981973, 1.964338, 0.4039216, 0, 1, 1,
0.5998676, 0.7761602, 0.1397155, 0.4117647, 0, 1, 1,
0.6004331, -0.1410635, 1.728374, 0.4156863, 0, 1, 1,
0.601413, 0.2385339, 2.846559, 0.4235294, 0, 1, 1,
0.6038566, 2.416735, 0.4377603, 0.427451, 0, 1, 1,
0.604236, 1.099156, 1.515315, 0.4352941, 0, 1, 1,
0.604932, 0.7825326, 1.207072, 0.4392157, 0, 1, 1,
0.6167942, 1.594958, 0.8858708, 0.4470588, 0, 1, 1,
0.6187969, 0.6007669, 0.8601332, 0.4509804, 0, 1, 1,
0.6214101, -1.227711, 3.9033, 0.4588235, 0, 1, 1,
0.6240841, -1.660313, 1.84953, 0.4627451, 0, 1, 1,
0.630298, -0.7547097, 2.4586, 0.4705882, 0, 1, 1,
0.6330185, 0.4421171, 1.918266, 0.4745098, 0, 1, 1,
0.6331095, -0.1186688, 1.018558, 0.4823529, 0, 1, 1,
0.6334043, 0.4180546, 0.1755375, 0.4862745, 0, 1, 1,
0.6378432, 0.4253389, 2.178811, 0.4941176, 0, 1, 1,
0.6378541, -0.03923063, 1.909856, 0.5019608, 0, 1, 1,
0.639782, 0.1516517, -0.5149746, 0.5058824, 0, 1, 1,
0.6416947, -0.3889121, 1.498209, 0.5137255, 0, 1, 1,
0.6428401, 0.3026939, 1.320852, 0.5176471, 0, 1, 1,
0.6432478, 0.531197, 0.1240877, 0.5254902, 0, 1, 1,
0.6443378, 0.9062569, 0.6275782, 0.5294118, 0, 1, 1,
0.6453466, 1.048799, 1.413689, 0.5372549, 0, 1, 1,
0.6479291, 2.864466, -1.144374, 0.5411765, 0, 1, 1,
0.6489655, 2.549633, 1.105697, 0.5490196, 0, 1, 1,
0.6527698, 1.281467, -0.5400763, 0.5529412, 0, 1, 1,
0.6546196, 1.757762, -0.7332554, 0.5607843, 0, 1, 1,
0.6575372, 0.6799604, -0.2480411, 0.5647059, 0, 1, 1,
0.6592566, 0.5035961, 1.317563, 0.572549, 0, 1, 1,
0.6596734, 0.1415988, 1.601363, 0.5764706, 0, 1, 1,
0.6606977, -0.9884023, 1.309575, 0.5843138, 0, 1, 1,
0.6638449, 0.6500239, -0.1799729, 0.5882353, 0, 1, 1,
0.6659414, 1.024994, -0.8386628, 0.5960785, 0, 1, 1,
0.6674307, -0.6102121, 2.669188, 0.6039216, 0, 1, 1,
0.6699737, 0.9873167, 0.8020136, 0.6078432, 0, 1, 1,
0.6703382, 0.7351117, 0.04479338, 0.6156863, 0, 1, 1,
0.6803267, 0.2723624, 0.9743473, 0.6196079, 0, 1, 1,
0.6806468, 0.07556342, 1.6962, 0.627451, 0, 1, 1,
0.6819489, 1.270329, 0.5140976, 0.6313726, 0, 1, 1,
0.6867285, 0.4275683, 1.367258, 0.6392157, 0, 1, 1,
0.686868, -0.8432775, 0.5332403, 0.6431373, 0, 1, 1,
0.69493, 0.7724383, 2.029523, 0.6509804, 0, 1, 1,
0.706537, 0.4168373, 0.1948307, 0.654902, 0, 1, 1,
0.7145246, -0.4658701, 1.140355, 0.6627451, 0, 1, 1,
0.7215921, 0.04989378, 0.105355, 0.6666667, 0, 1, 1,
0.7223018, 0.607842, 1.438665, 0.6745098, 0, 1, 1,
0.7225734, -0.6646488, 3.983819, 0.6784314, 0, 1, 1,
0.7239978, -2.245664, 3.164169, 0.6862745, 0, 1, 1,
0.7336465, -0.4576426, 1.834835, 0.6901961, 0, 1, 1,
0.7354403, 1.37665, 0.8283, 0.6980392, 0, 1, 1,
0.7364066, 1.998317, 0.4343882, 0.7058824, 0, 1, 1,
0.7409804, 0.5942991, 0.7136909, 0.7098039, 0, 1, 1,
0.7449684, 0.4400755, 2.621465, 0.7176471, 0, 1, 1,
0.747362, -0.8237144, 2.141551, 0.7215686, 0, 1, 1,
0.7511541, 0.8522756, 0.6379256, 0.7294118, 0, 1, 1,
0.75517, -0.5477743, 1.469887, 0.7333333, 0, 1, 1,
0.7560279, 1.102233, 1.332283, 0.7411765, 0, 1, 1,
0.7569173, 0.2165088, 1.756029, 0.7450981, 0, 1, 1,
0.7582955, -0.0278456, 0.3180172, 0.7529412, 0, 1, 1,
0.7621436, 0.245756, 1.866218, 0.7568628, 0, 1, 1,
0.7669633, 1.122788, 0.04340318, 0.7647059, 0, 1, 1,
0.7711607, -0.8313009, 1.270599, 0.7686275, 0, 1, 1,
0.7751215, 1.043603, 1.773845, 0.7764706, 0, 1, 1,
0.7793466, -0.2373766, 1.694295, 0.7803922, 0, 1, 1,
0.7840418, 0.3311118, 0.7216437, 0.7882353, 0, 1, 1,
0.7860932, 0.807875, 1.118313, 0.7921569, 0, 1, 1,
0.7882864, -1.564094, 2.348085, 0.8, 0, 1, 1,
0.7894946, 0.4537402, 0.9327385, 0.8078431, 0, 1, 1,
0.7958346, 0.4369731, 0.8774399, 0.8117647, 0, 1, 1,
0.7964649, 0.2693966, -0.7537007, 0.8196079, 0, 1, 1,
0.797631, 0.8057309, -0.6106647, 0.8235294, 0, 1, 1,
0.8019852, 0.5994574, 1.550943, 0.8313726, 0, 1, 1,
0.8041082, -0.5182025, 2.243557, 0.8352941, 0, 1, 1,
0.8090807, -0.2700253, 2.106201, 0.8431373, 0, 1, 1,
0.8184358, -1.278041, 3.172902, 0.8470588, 0, 1, 1,
0.8205763, -0.04692217, 2.681685, 0.854902, 0, 1, 1,
0.8214922, -0.03386036, 3.479838, 0.8588235, 0, 1, 1,
0.8249549, 1.393969, 1.433936, 0.8666667, 0, 1, 1,
0.8321751, 0.9450559, 1.256896, 0.8705882, 0, 1, 1,
0.8356558, 0.7790845, 1.399869, 0.8784314, 0, 1, 1,
0.8375837, 0.4756237, 2.514644, 0.8823529, 0, 1, 1,
0.8382289, 1.036555, -0.8685517, 0.8901961, 0, 1, 1,
0.8410573, -0.7138734, 2.005591, 0.8941177, 0, 1, 1,
0.8457562, 1.582674, 1.699944, 0.9019608, 0, 1, 1,
0.8458732, 0.4632829, 1.033168, 0.9098039, 0, 1, 1,
0.8533354, -1.859793, 3.819816, 0.9137255, 0, 1, 1,
0.8554265, 1.765531, -0.1906535, 0.9215686, 0, 1, 1,
0.8583314, -0.758634, 2.888372, 0.9254902, 0, 1, 1,
0.8585142, 1.27655, 0.3801649, 0.9333333, 0, 1, 1,
0.8664634, -0.4512207, 0.2703347, 0.9372549, 0, 1, 1,
0.8695296, -0.6595647, 4.237319, 0.945098, 0, 1, 1,
0.8718691, 0.9000832, 0.6905575, 0.9490196, 0, 1, 1,
0.8722864, 0.7884566, 0.4171514, 0.9568627, 0, 1, 1,
0.8756643, -0.6005499, 2.617165, 0.9607843, 0, 1, 1,
0.8778875, -1.521972, 1.889399, 0.9686275, 0, 1, 1,
0.8879847, 0.5471297, -0.6600011, 0.972549, 0, 1, 1,
0.8906315, -1.714931, 2.430868, 0.9803922, 0, 1, 1,
0.8972663, -1.626857, 3.720314, 0.9843137, 0, 1, 1,
0.9008337, 0.9730459, 1.802387, 0.9921569, 0, 1, 1,
0.9038955, -2.108872, 3.093893, 0.9960784, 0, 1, 1,
0.9135286, -1.072566, 3.121745, 1, 0, 0.9960784, 1,
0.9157392, -0.4829949, 3.155672, 1, 0, 0.9882353, 1,
0.9226643, 0.3335625, 0.9498426, 1, 0, 0.9843137, 1,
0.9259446, 2.538379, 1.867346, 1, 0, 0.9764706, 1,
0.9340701, -1.511059, 2.32855, 1, 0, 0.972549, 1,
0.9344641, 0.7161482, 1.105708, 1, 0, 0.9647059, 1,
0.938751, 0.07107991, -0.006466057, 1, 0, 0.9607843, 1,
0.9393212, 1.855985, 0.06219769, 1, 0, 0.9529412, 1,
0.9405969, -0.4159724, 1.972928, 1, 0, 0.9490196, 1,
0.9463255, 1.095246, 1.196846, 1, 0, 0.9411765, 1,
0.949817, -0.3666593, 3.463681, 1, 0, 0.9372549, 1,
0.9507289, -0.06280705, 1.809159, 1, 0, 0.9294118, 1,
0.9633165, 0.5674877, 1.821234, 1, 0, 0.9254902, 1,
0.9659609, -1.705411, 2.981686, 1, 0, 0.9176471, 1,
0.9664802, -0.1480603, 2.697449, 1, 0, 0.9137255, 1,
0.9699034, 1.228596, 1.088839, 1, 0, 0.9058824, 1,
0.971813, -0.7254434, 0.996464, 1, 0, 0.9019608, 1,
0.9721721, 0.4499745, 0.4061929, 1, 0, 0.8941177, 1,
0.9785137, -0.9095328, 3.194296, 1, 0, 0.8862745, 1,
0.9823273, -1.478258, 2.798158, 1, 0, 0.8823529, 1,
0.9825106, 0.8263168, -0.1526761, 1, 0, 0.8745098, 1,
0.9890219, -0.1364764, 1.388396, 1, 0, 0.8705882, 1,
0.9918346, -0.2271432, -1.366214, 1, 0, 0.8627451, 1,
0.9958766, -1.180597, 2.401294, 1, 0, 0.8588235, 1,
1.000882, 0.7243087, 0.7039335, 1, 0, 0.8509804, 1,
1.003351, -0.01815872, 1.313127, 1, 0, 0.8470588, 1,
1.011523, 0.9115748, 2.329259, 1, 0, 0.8392157, 1,
1.013378, 2.540327, 0.9487966, 1, 0, 0.8352941, 1,
1.016803, 0.3822252, 0.2790945, 1, 0, 0.827451, 1,
1.018716, -0.7939599, 1.640753, 1, 0, 0.8235294, 1,
1.025051, 1.223099, 3.392604, 1, 0, 0.8156863, 1,
1.026505, 1.135714, 0.4805478, 1, 0, 0.8117647, 1,
1.03245, 1.251637, 0.5343339, 1, 0, 0.8039216, 1,
1.038372, -0.9234421, 1.983201, 1, 0, 0.7960784, 1,
1.039682, 0.7447815, -1.078946, 1, 0, 0.7921569, 1,
1.056287, 0.005594824, 1.632705, 1, 0, 0.7843137, 1,
1.060599, -1.963708, 2.254218, 1, 0, 0.7803922, 1,
1.069419, 0.1195905, 1.331796, 1, 0, 0.772549, 1,
1.072722, -1.271183, 1.520303, 1, 0, 0.7686275, 1,
1.079795, 1.001098, 0.8532947, 1, 0, 0.7607843, 1,
1.084605, 1.358809, 0.03074759, 1, 0, 0.7568628, 1,
1.093395, -0.1665947, 2.694364, 1, 0, 0.7490196, 1,
1.09618, 1.146469, 1.050317, 1, 0, 0.7450981, 1,
1.096883, -0.1262941, 0.1146799, 1, 0, 0.7372549, 1,
1.102168, 1.45439, 0.6289851, 1, 0, 0.7333333, 1,
1.107609, -2.223463, 3.141314, 1, 0, 0.7254902, 1,
1.129267, -1.058457, 2.403967, 1, 0, 0.7215686, 1,
1.138805, 2.550318, 0.3608892, 1, 0, 0.7137255, 1,
1.164635, -1.344418, 2.983125, 1, 0, 0.7098039, 1,
1.179121, -0.4144808, 2.455191, 1, 0, 0.7019608, 1,
1.185046, -0.5024562, 2.073918, 1, 0, 0.6941177, 1,
1.187749, -0.3490587, 0.3995349, 1, 0, 0.6901961, 1,
1.192981, 0.9372341, 1.027899, 1, 0, 0.682353, 1,
1.199007, 1.032049, 0.1534649, 1, 0, 0.6784314, 1,
1.200631, 1.918538, 2.085934, 1, 0, 0.6705883, 1,
1.201406, 0.7859455, 0.05899855, 1, 0, 0.6666667, 1,
1.221104, 0.8011481, 1.151982, 1, 0, 0.6588235, 1,
1.222297, 1.503029, 0.1281509, 1, 0, 0.654902, 1,
1.223495, -0.3043738, 0.269906, 1, 0, 0.6470588, 1,
1.237629, -1.626357, 3.23128, 1, 0, 0.6431373, 1,
1.242613, -1.08741, 2.362327, 1, 0, 0.6352941, 1,
1.248859, -0.5433877, 2.982375, 1, 0, 0.6313726, 1,
1.250864, 2.824364, 1.413023, 1, 0, 0.6235294, 1,
1.266179, 0.1899792, 0.1939965, 1, 0, 0.6196079, 1,
1.267736, -1.202443, 0.7900792, 1, 0, 0.6117647, 1,
1.269169, 1.727368, 0.1004996, 1, 0, 0.6078432, 1,
1.282631, -0.860722, -0.2259142, 1, 0, 0.6, 1,
1.287924, 0.2616432, 0.2312421, 1, 0, 0.5921569, 1,
1.288902, -0.06702504, 0.6530464, 1, 0, 0.5882353, 1,
1.290861, -0.3708143, 0.9605033, 1, 0, 0.5803922, 1,
1.294082, -0.1909047, 0.4999557, 1, 0, 0.5764706, 1,
1.301897, 2.043304, 0.5602698, 1, 0, 0.5686275, 1,
1.311761, -1.144462, 0.5985199, 1, 0, 0.5647059, 1,
1.31275, 0.8205882, 1.97005, 1, 0, 0.5568628, 1,
1.317866, 0.04267283, 1.24585, 1, 0, 0.5529412, 1,
1.331558, -0.6221691, 1.801227, 1, 0, 0.5450981, 1,
1.340423, -1.5417, 3.327353, 1, 0, 0.5411765, 1,
1.340564, -0.8039474, 1.482601, 1, 0, 0.5333334, 1,
1.345722, 0.4615614, 0.4283596, 1, 0, 0.5294118, 1,
1.352062, -0.4500558, 3.023179, 1, 0, 0.5215687, 1,
1.357513, -1.390599, 2.576969, 1, 0, 0.5176471, 1,
1.364062, 0.5244415, 1.734921, 1, 0, 0.509804, 1,
1.367415, -1.325404, 3.808176, 1, 0, 0.5058824, 1,
1.369932, 0.1039195, 1.094339, 1, 0, 0.4980392, 1,
1.375146, -0.3335499, 1.193054, 1, 0, 0.4901961, 1,
1.384994, 0.851244, 0.5711423, 1, 0, 0.4862745, 1,
1.389872, -1.145855, 3.089327, 1, 0, 0.4784314, 1,
1.391211, 0.8972806, 2.057634, 1, 0, 0.4745098, 1,
1.41045, 1.149676, 0.3331231, 1, 0, 0.4666667, 1,
1.415943, -1.491073, 0.8214637, 1, 0, 0.4627451, 1,
1.419213, -0.6157133, 3.370298, 1, 0, 0.454902, 1,
1.41941, 1.365752, 0.2548866, 1, 0, 0.4509804, 1,
1.422922, -1.075555, 1.329227, 1, 0, 0.4431373, 1,
1.423075, 0.5636215, 2.271336, 1, 0, 0.4392157, 1,
1.426761, -0.9052914, 0.4614391, 1, 0, 0.4313726, 1,
1.429336, 0.0741147, 0.5976159, 1, 0, 0.427451, 1,
1.429374, -1.265033, 3.192631, 1, 0, 0.4196078, 1,
1.4349, 0.5992256, 1.609833, 1, 0, 0.4156863, 1,
1.448933, 1.007608, 2.971138, 1, 0, 0.4078431, 1,
1.451575, 0.8354844, 0.2366987, 1, 0, 0.4039216, 1,
1.451656, -0.05735067, 3.083755, 1, 0, 0.3960784, 1,
1.454967, 1.292084, 2.013654, 1, 0, 0.3882353, 1,
1.466216, -0.2452891, 0.3922504, 1, 0, 0.3843137, 1,
1.46905, -0.1090311, 1.179886, 1, 0, 0.3764706, 1,
1.480653, 0.3241764, 2.283351, 1, 0, 0.372549, 1,
1.492024, 2.290565, -0.6288595, 1, 0, 0.3647059, 1,
1.496153, -0.6102965, 1.140843, 1, 0, 0.3607843, 1,
1.519711, 0.4031065, -0.1830541, 1, 0, 0.3529412, 1,
1.528327, 1.976013, 1.090941, 1, 0, 0.3490196, 1,
1.534039, 0.4127878, 1.150741, 1, 0, 0.3411765, 1,
1.543257, 0.8539671, 1.117214, 1, 0, 0.3372549, 1,
1.546667, -0.1368162, 3.156904, 1, 0, 0.3294118, 1,
1.550268, 0.7994497, 2.828088, 1, 0, 0.3254902, 1,
1.554501, -3.617408, 3.861814, 1, 0, 0.3176471, 1,
1.55654, -0.5660459, 0.3872967, 1, 0, 0.3137255, 1,
1.558928, -0.1520009, 0.768394, 1, 0, 0.3058824, 1,
1.582069, -1.377312, 2.97024, 1, 0, 0.2980392, 1,
1.587169, 1.360098, -0.2110123, 1, 0, 0.2941177, 1,
1.60038, 0.2530593, 2.886858, 1, 0, 0.2862745, 1,
1.60389, -0.7965206, 2.090762, 1, 0, 0.282353, 1,
1.604466, 0.6263121, 0.08111449, 1, 0, 0.2745098, 1,
1.630599, 0.1951018, 0.3715827, 1, 0, 0.2705882, 1,
1.63678, -0.9725773, 2.905377, 1, 0, 0.2627451, 1,
1.644219, 1.369673, 1.519232, 1, 0, 0.2588235, 1,
1.651024, -0.3809538, 3.007494, 1, 0, 0.2509804, 1,
1.666873, 0.5052672, 0.32577, 1, 0, 0.2470588, 1,
1.689352, -1.099148, 1.274924, 1, 0, 0.2392157, 1,
1.68973, -0.3487497, 1.916954, 1, 0, 0.2352941, 1,
1.710555, -0.1467392, 1.020413, 1, 0, 0.227451, 1,
1.747535, -0.03539067, 1.324659, 1, 0, 0.2235294, 1,
1.751745, -1.426463, 3.229378, 1, 0, 0.2156863, 1,
1.770009, -0.07949169, 1.332826, 1, 0, 0.2117647, 1,
1.773584, 0.5028036, 1.450981, 1, 0, 0.2039216, 1,
1.802805, 0.04117109, 2.261837, 1, 0, 0.1960784, 1,
1.805189, 1.486254, 1.237776, 1, 0, 0.1921569, 1,
1.86064, 0.3519994, 1.602131, 1, 0, 0.1843137, 1,
1.898623, 0.2786323, 1.30649, 1, 0, 0.1803922, 1,
1.905548, -1.633542, 4.065224, 1, 0, 0.172549, 1,
1.908412, -1.458785, 3.283414, 1, 0, 0.1686275, 1,
1.91194, 0.4638551, 0.3298192, 1, 0, 0.1607843, 1,
1.928402, 0.2819391, 1.722044, 1, 0, 0.1568628, 1,
1.93097, 0.05070412, 1.713934, 1, 0, 0.1490196, 1,
1.965903, -1.011192, 0.3379546, 1, 0, 0.145098, 1,
1.976355, 0.04371425, 2.38412, 1, 0, 0.1372549, 1,
1.983698, -1.016119, 3.238509, 1, 0, 0.1333333, 1,
1.990336, -1.172702, 1.701149, 1, 0, 0.1254902, 1,
1.997927, -0.1688427, 1.192315, 1, 0, 0.1215686, 1,
2.005855, 0.3148384, 1.229304, 1, 0, 0.1137255, 1,
2.025945, -1.098592, 1.840868, 1, 0, 0.1098039, 1,
2.044103, -0.1012668, 1.533509, 1, 0, 0.1019608, 1,
2.051327, -1.946103, 4.444107, 1, 0, 0.09411765, 1,
2.0584, -0.12843, 1.701068, 1, 0, 0.09019608, 1,
2.083167, 0.01101906, 2.467762, 1, 0, 0.08235294, 1,
2.156053, 0.6291875, 1.166858, 1, 0, 0.07843138, 1,
2.236367, 0.5319853, 3.389585, 1, 0, 0.07058824, 1,
2.248809, -0.8587521, 1.607567, 1, 0, 0.06666667, 1,
2.297114, -0.2583174, 2.416981, 1, 0, 0.05882353, 1,
2.351074, 0.2658779, 2.197324, 1, 0, 0.05490196, 1,
2.462359, -3.122532, 3.164019, 1, 0, 0.04705882, 1,
2.479516, -0.8790301, -1.231084, 1, 0, 0.04313726, 1,
2.51056, -0.008922406, 1.25045, 1, 0, 0.03529412, 1,
2.569442, -0.8145782, 1.413874, 1, 0, 0.03137255, 1,
2.639792, 0.9376627, 0.7948427, 1, 0, 0.02352941, 1,
2.744497, 1.092588, 1.213768, 1, 0, 0.01960784, 1,
2.803712, -0.8055518, 3.21105, 1, 0, 0.01176471, 1,
2.94862, -0.3997133, 2.146635, 1, 0, 0.007843138, 1
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
-0.5757734, -4.719958, -7.276457, 0, -0.5, 0.5, 0.5,
-0.5757734, -4.719958, -7.276457, 1, -0.5, 0.5, 0.5,
-0.5757734, -4.719958, -7.276457, 1, 1.5, 0.5, 0.5,
-0.5757734, -4.719958, -7.276457, 0, 1.5, 0.5, 0.5
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
-5.294936, -0.3650472, -7.276457, 0, -0.5, 0.5, 0.5,
-5.294936, -0.3650472, -7.276457, 1, -0.5, 0.5, 0.5,
-5.294936, -0.3650472, -7.276457, 1, 1.5, 0.5, 0.5,
-5.294936, -0.3650472, -7.276457, 0, 1.5, 0.5, 0.5
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
-5.294936, -4.719958, -0.4722803, 0, -0.5, 0.5, 0.5,
-5.294936, -4.719958, -0.4722803, 1, -0.5, 0.5, 0.5,
-5.294936, -4.719958, -0.4722803, 1, 1.5, 0.5, 0.5,
-5.294936, -4.719958, -0.4722803, 0, 1.5, 0.5, 0.5
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
-4, -3.714978, -5.706263,
2, -3.714978, -5.706263,
-4, -3.714978, -5.706263,
-4, -3.882475, -5.967961,
-2, -3.714978, -5.706263,
-2, -3.882475, -5.967961,
0, -3.714978, -5.706263,
0, -3.882475, -5.967961,
2, -3.714978, -5.706263,
2, -3.882475, -5.967961
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
-4, -4.217468, -6.49136, 0, -0.5, 0.5, 0.5,
-4, -4.217468, -6.49136, 1, -0.5, 0.5, 0.5,
-4, -4.217468, -6.49136, 1, 1.5, 0.5, 0.5,
-4, -4.217468, -6.49136, 0, 1.5, 0.5, 0.5,
-2, -4.217468, -6.49136, 0, -0.5, 0.5, 0.5,
-2, -4.217468, -6.49136, 1, -0.5, 0.5, 0.5,
-2, -4.217468, -6.49136, 1, 1.5, 0.5, 0.5,
-2, -4.217468, -6.49136, 0, 1.5, 0.5, 0.5,
0, -4.217468, -6.49136, 0, -0.5, 0.5, 0.5,
0, -4.217468, -6.49136, 1, -0.5, 0.5, 0.5,
0, -4.217468, -6.49136, 1, 1.5, 0.5, 0.5,
0, -4.217468, -6.49136, 0, 1.5, 0.5, 0.5,
2, -4.217468, -6.49136, 0, -0.5, 0.5, 0.5,
2, -4.217468, -6.49136, 1, -0.5, 0.5, 0.5,
2, -4.217468, -6.49136, 1, 1.5, 0.5, 0.5,
2, -4.217468, -6.49136, 0, 1.5, 0.5, 0.5
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
-4.205899, -3, -5.706263,
-4.205899, 2, -5.706263,
-4.205899, -3, -5.706263,
-4.387405, -3, -5.967961,
-4.205899, -2, -5.706263,
-4.387405, -2, -5.967961,
-4.205899, -1, -5.706263,
-4.387405, -1, -5.967961,
-4.205899, 0, -5.706263,
-4.387405, 0, -5.967961,
-4.205899, 1, -5.706263,
-4.387405, 1, -5.967961,
-4.205899, 2, -5.706263,
-4.387405, 2, -5.967961
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
-4.750417, -3, -6.49136, 0, -0.5, 0.5, 0.5,
-4.750417, -3, -6.49136, 1, -0.5, 0.5, 0.5,
-4.750417, -3, -6.49136, 1, 1.5, 0.5, 0.5,
-4.750417, -3, -6.49136, 0, 1.5, 0.5, 0.5,
-4.750417, -2, -6.49136, 0, -0.5, 0.5, 0.5,
-4.750417, -2, -6.49136, 1, -0.5, 0.5, 0.5,
-4.750417, -2, -6.49136, 1, 1.5, 0.5, 0.5,
-4.750417, -2, -6.49136, 0, 1.5, 0.5, 0.5,
-4.750417, -1, -6.49136, 0, -0.5, 0.5, 0.5,
-4.750417, -1, -6.49136, 1, -0.5, 0.5, 0.5,
-4.750417, -1, -6.49136, 1, 1.5, 0.5, 0.5,
-4.750417, -1, -6.49136, 0, 1.5, 0.5, 0.5,
-4.750417, 0, -6.49136, 0, -0.5, 0.5, 0.5,
-4.750417, 0, -6.49136, 1, -0.5, 0.5, 0.5,
-4.750417, 0, -6.49136, 1, 1.5, 0.5, 0.5,
-4.750417, 0, -6.49136, 0, 1.5, 0.5, 0.5,
-4.750417, 1, -6.49136, 0, -0.5, 0.5, 0.5,
-4.750417, 1, -6.49136, 1, -0.5, 0.5, 0.5,
-4.750417, 1, -6.49136, 1, 1.5, 0.5, 0.5,
-4.750417, 1, -6.49136, 0, 1.5, 0.5, 0.5,
-4.750417, 2, -6.49136, 0, -0.5, 0.5, 0.5,
-4.750417, 2, -6.49136, 1, -0.5, 0.5, 0.5,
-4.750417, 2, -6.49136, 1, 1.5, 0.5, 0.5,
-4.750417, 2, -6.49136, 0, 1.5, 0.5, 0.5
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
-4.205899, -3.714978, -4,
-4.205899, -3.714978, 4,
-4.205899, -3.714978, -4,
-4.387405, -3.882475, -4,
-4.205899, -3.714978, -2,
-4.387405, -3.882475, -2,
-4.205899, -3.714978, 0,
-4.387405, -3.882475, 0,
-4.205899, -3.714978, 2,
-4.387405, -3.882475, 2,
-4.205899, -3.714978, 4,
-4.387405, -3.882475, 4
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
-4.750417, -4.217468, -4, 0, -0.5, 0.5, 0.5,
-4.750417, -4.217468, -4, 1, -0.5, 0.5, 0.5,
-4.750417, -4.217468, -4, 1, 1.5, 0.5, 0.5,
-4.750417, -4.217468, -4, 0, 1.5, 0.5, 0.5,
-4.750417, -4.217468, -2, 0, -0.5, 0.5, 0.5,
-4.750417, -4.217468, -2, 1, -0.5, 0.5, 0.5,
-4.750417, -4.217468, -2, 1, 1.5, 0.5, 0.5,
-4.750417, -4.217468, -2, 0, 1.5, 0.5, 0.5,
-4.750417, -4.217468, 0, 0, -0.5, 0.5, 0.5,
-4.750417, -4.217468, 0, 1, -0.5, 0.5, 0.5,
-4.750417, -4.217468, 0, 1, 1.5, 0.5, 0.5,
-4.750417, -4.217468, 0, 0, 1.5, 0.5, 0.5,
-4.750417, -4.217468, 2, 0, -0.5, 0.5, 0.5,
-4.750417, -4.217468, 2, 1, -0.5, 0.5, 0.5,
-4.750417, -4.217468, 2, 1, 1.5, 0.5, 0.5,
-4.750417, -4.217468, 2, 0, 1.5, 0.5, 0.5,
-4.750417, -4.217468, 4, 0, -0.5, 0.5, 0.5,
-4.750417, -4.217468, 4, 1, -0.5, 0.5, 0.5,
-4.750417, -4.217468, 4, 1, 1.5, 0.5, 0.5,
-4.750417, -4.217468, 4, 0, 1.5, 0.5, 0.5
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
-4.205899, -3.714978, -5.706263,
-4.205899, 2.984884, -5.706263,
-4.205899, -3.714978, 4.761702,
-4.205899, 2.984884, 4.761702,
-4.205899, -3.714978, -5.706263,
-4.205899, -3.714978, 4.761702,
-4.205899, 2.984884, -5.706263,
-4.205899, 2.984884, 4.761702,
-4.205899, -3.714978, -5.706263,
3.054352, -3.714978, -5.706263,
-4.205899, -3.714978, 4.761702,
3.054352, -3.714978, 4.761702,
-4.205899, 2.984884, -5.706263,
3.054352, 2.984884, -5.706263,
-4.205899, 2.984884, 4.761702,
3.054352, 2.984884, 4.761702,
3.054352, -3.714978, -5.706263,
3.054352, 2.984884, -5.706263,
3.054352, -3.714978, 4.761702,
3.054352, 2.984884, 4.761702,
3.054352, -3.714978, -5.706263,
3.054352, -3.714978, 4.761702,
3.054352, 2.984884, -5.706263,
3.054352, 2.984884, 4.761702
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
var radius = 7.685939;
var distance = 34.19561;
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
mvMatrix.translate( 0.5757734, 0.3650472, 0.4722803 );
mvMatrix.scale( 1.144614, 1.240352, 0.7938686 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.19561);
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
triazine-2-amine<-read.table("triazine-2-amine.xyz")
```

```
## Error in read.table("triazine-2-amine.xyz"): no lines available in input
```

```r
x<-triazine-2-amine$V2
```

```
## Error in eval(expr, envir, enclos): object 'triazine' not found
```

```r
y<-triazine-2-amine$V3
```

```
## Error in eval(expr, envir, enclos): object 'triazine' not found
```

```r
z<-triazine-2-amine$V4
```

```
## Error in eval(expr, envir, enclos): object 'triazine' not found
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
-4.100167, 0.3404503, -1.957103, 0, 0, 1, 1, 1,
-3.226549, -0.7110407, 1.126315, 1, 0, 0, 1, 1,
-3.051019, -1.467416, -1.880396, 1, 0, 0, 1, 1,
-3.000353, -0.9943729, -1.917792, 1, 0, 0, 1, 1,
-2.812015, -0.1719575, -1.361477, 1, 0, 0, 1, 1,
-2.668548, -1.117496, -0.5393494, 1, 0, 0, 1, 1,
-2.609903, -0.1544045, -1.322192, 0, 0, 0, 1, 1,
-2.573228, 1.864, -1.326858, 0, 0, 0, 1, 1,
-2.466465, 1.217618, -0.6574567, 0, 0, 0, 1, 1,
-2.40799, 0.5942772, -1.281887, 0, 0, 0, 1, 1,
-2.405911, -0.04322996, -2.26097, 0, 0, 0, 1, 1,
-2.225286, 0.1134377, -2.134954, 0, 0, 0, 1, 1,
-2.224779, 1.162826, -1.762871, 0, 0, 0, 1, 1,
-2.199126, 0.1319949, -0.6880493, 1, 1, 1, 1, 1,
-2.194796, 0.3373622, -2.755098, 1, 1, 1, 1, 1,
-2.188532, -0.7076285, -1.700329, 1, 1, 1, 1, 1,
-2.187656, -2.759191, -2.990355, 1, 1, 1, 1, 1,
-2.165717, -0.9782264, -2.462783, 1, 1, 1, 1, 1,
-2.158555, 0.2338132, -2.637769, 1, 1, 1, 1, 1,
-2.130339, 0.688637, -1.320116, 1, 1, 1, 1, 1,
-2.119046, -1.41585, -1.092073, 1, 1, 1, 1, 1,
-2.10617, 0.02147758, -0.4318039, 1, 1, 1, 1, 1,
-2.096691, 0.4080136, 0.293557, 1, 1, 1, 1, 1,
-2.089836, -0.3663458, -0.1642151, 1, 1, 1, 1, 1,
-2.085442, -1.203084, -3.260121, 1, 1, 1, 1, 1,
-2.074921, 1.008324, -0.9270094, 1, 1, 1, 1, 1,
-2.072592, 0.1876914, -0.9405404, 1, 1, 1, 1, 1,
-2.044317, -1.707235, -2.376348, 1, 1, 1, 1, 1,
-2.013952, -1.135142, -2.307321, 0, 0, 1, 1, 1,
-2.003056, 0.1762879, -0.1034571, 1, 0, 0, 1, 1,
-1.990122, 0.6601729, -2.595803, 1, 0, 0, 1, 1,
-1.977123, -0.0009794539, -2.099595, 1, 0, 0, 1, 1,
-1.968378, 0.2904362, -1.31812, 1, 0, 0, 1, 1,
-1.968015, -2.039118, -1.408362, 1, 0, 0, 1, 1,
-1.96744, 0.1998768, -0.3181794, 0, 0, 0, 1, 1,
-1.932487, 0.04183306, -1.040961, 0, 0, 0, 1, 1,
-1.930976, -0.4601894, -2.083549, 0, 0, 0, 1, 1,
-1.920219, 0.7642299, -3.174687, 0, 0, 0, 1, 1,
-1.896707, 0.6614397, -0.7488968, 0, 0, 0, 1, 1,
-1.892875, 0.3646002, -1.684629, 0, 0, 0, 1, 1,
-1.892268, -0.09328341, -1.801102, 0, 0, 0, 1, 1,
-1.888385, 1.73647, -0.3879539, 1, 1, 1, 1, 1,
-1.874329, 2.289316, -1.834251, 1, 1, 1, 1, 1,
-1.867786, -1.005479, -1.743504, 1, 1, 1, 1, 1,
-1.841273, 0.414762, -2.709341, 1, 1, 1, 1, 1,
-1.838735, -0.6311152, -1.954251, 1, 1, 1, 1, 1,
-1.817817, -1.631495, -1.848394, 1, 1, 1, 1, 1,
-1.804678, 1.190254, 0.3661095, 1, 1, 1, 1, 1,
-1.795081, -0.05412131, -1.860392, 1, 1, 1, 1, 1,
-1.791685, -0.9119824, -3.522112, 1, 1, 1, 1, 1,
-1.78195, -0.06254834, -0.884319, 1, 1, 1, 1, 1,
-1.765598, 0.8356023, -0.8828711, 1, 1, 1, 1, 1,
-1.74855, 0.4876277, -2.854599, 1, 1, 1, 1, 1,
-1.741275, 0.8212547, -1.483153, 1, 1, 1, 1, 1,
-1.718192, -1.376746, -1.764879, 1, 1, 1, 1, 1,
-1.715676, -0.6478366, -4.045028, 1, 1, 1, 1, 1,
-1.699122, -0.667802, -2.501799, 0, 0, 1, 1, 1,
-1.693244, 0.1721093, -0.7517402, 1, 0, 0, 1, 1,
-1.682193, -1.93247, -2.789258, 1, 0, 0, 1, 1,
-1.646824, -0.7107826, -2.893044, 1, 0, 0, 1, 1,
-1.596392, -0.4366682, -2.190895, 1, 0, 0, 1, 1,
-1.588574, 0.0616378, -2.329558, 1, 0, 0, 1, 1,
-1.584065, 0.8591796, -0.8621403, 0, 0, 0, 1, 1,
-1.56001, 0.0730404, -1.706953, 0, 0, 0, 1, 1,
-1.554405, -0.01854456, -3.76014, 0, 0, 0, 1, 1,
-1.54895, 0.3485748, -1.654707, 0, 0, 0, 1, 1,
-1.514611, 0.9471317, -0.7841806, 0, 0, 0, 1, 1,
-1.498175, -2.052641, -2.376023, 0, 0, 0, 1, 1,
-1.497044, -0.08449764, -0.4186152, 0, 0, 0, 1, 1,
-1.490151, 1.228224, 0.1041328, 1, 1, 1, 1, 1,
-1.485881, -1.054892, -2.82261, 1, 1, 1, 1, 1,
-1.483257, -0.5787377, -0.6950774, 1, 1, 1, 1, 1,
-1.478599, 1.731243, -0.1549717, 1, 1, 1, 1, 1,
-1.466275, -0.2273548, -0.6720653, 1, 1, 1, 1, 1,
-1.456941, 0.6613253, -1.625725, 1, 1, 1, 1, 1,
-1.439669, -1.713904, -2.641179, 1, 1, 1, 1, 1,
-1.438826, -0.06567819, -2.36624, 1, 1, 1, 1, 1,
-1.43629, 0.7952738, -2.969003, 1, 1, 1, 1, 1,
-1.427237, -1.462807, -3.427893, 1, 1, 1, 1, 1,
-1.422238, -1.750457, -3.141794, 1, 1, 1, 1, 1,
-1.416777, 0.4985134, -1.065134, 1, 1, 1, 1, 1,
-1.414062, 1.106021, -0.6730146, 1, 1, 1, 1, 1,
-1.389383, 0.0532143, -0.8825295, 1, 1, 1, 1, 1,
-1.386283, -0.9586702, -2.058605, 1, 1, 1, 1, 1,
-1.381634, 1.705794, -2.469769, 0, 0, 1, 1, 1,
-1.378957, -0.5157468, -1.416314, 1, 0, 0, 1, 1,
-1.361284, -1.330029, -2.386908, 1, 0, 0, 1, 1,
-1.34985, -0.1313448, -0.7076875, 1, 0, 0, 1, 1,
-1.342173, 1.269577, -0.4650284, 1, 0, 0, 1, 1,
-1.338316, -0.01657064, -0.427828, 1, 0, 0, 1, 1,
-1.33592, -0.940001, -0.6885151, 0, 0, 0, 1, 1,
-1.329103, 0.2302505, -0.02035766, 0, 0, 0, 1, 1,
-1.323933, 0.4763799, -1.017182, 0, 0, 0, 1, 1,
-1.323055, -1.138755, -0.4900573, 0, 0, 0, 1, 1,
-1.310814, -0.3988922, -2.234436, 0, 0, 0, 1, 1,
-1.306073, -0.8168638, -0.9159718, 0, 0, 0, 1, 1,
-1.297289, 0.5855296, -0.4690011, 0, 0, 0, 1, 1,
-1.291335, 0.6196418, -1.586664, 1, 1, 1, 1, 1,
-1.286671, -0.01726823, -3.067779, 1, 1, 1, 1, 1,
-1.286524, 0.6485513, -1.06139, 1, 1, 1, 1, 1,
-1.284773, 0.809905, -1.458306, 1, 1, 1, 1, 1,
-1.270998, -0.1258146, -2.178937, 1, 1, 1, 1, 1,
-1.262211, 0.7276393, -2.869419, 1, 1, 1, 1, 1,
-1.256456, 0.3157784, -0.4603915, 1, 1, 1, 1, 1,
-1.255482, 1.093693, -1.777458, 1, 1, 1, 1, 1,
-1.25146, 0.3452581, -0.6842166, 1, 1, 1, 1, 1,
-1.249424, 0.1577397, -1.806921, 1, 1, 1, 1, 1,
-1.248162, 0.02277059, -1.671697, 1, 1, 1, 1, 1,
-1.241212, 0.2960894, -0.3492807, 1, 1, 1, 1, 1,
-1.238615, 0.8081803, -0.9673873, 1, 1, 1, 1, 1,
-1.235128, 1.380212, -0.8026961, 1, 1, 1, 1, 1,
-1.232657, 1.287308, 0.06036157, 1, 1, 1, 1, 1,
-1.226776, -0.9078649, -1.747184, 0, 0, 1, 1, 1,
-1.222255, -0.9654156, -1.222127, 1, 0, 0, 1, 1,
-1.219609, -0.1108601, 0.179681, 1, 0, 0, 1, 1,
-1.217548, 0.4385739, -2.54722, 1, 0, 0, 1, 1,
-1.207776, -0.4717524, -0.5014516, 1, 0, 0, 1, 1,
-1.207489, -0.9644559, -2.952731, 1, 0, 0, 1, 1,
-1.193589, -0.4337935, -1.100823, 0, 0, 0, 1, 1,
-1.19182, 1.78259, -1.928742, 0, 0, 0, 1, 1,
-1.189708, -1.036445, -1.532192, 0, 0, 0, 1, 1,
-1.18379, 0.5991564, -0.7159933, 0, 0, 0, 1, 1,
-1.18365, 0.7632197, -0.7993577, 0, 0, 0, 1, 1,
-1.183508, -0.6442698, -0.1088065, 0, 0, 0, 1, 1,
-1.176526, -0.9994389, -2.417473, 0, 0, 0, 1, 1,
-1.169855, -1.1632, -1.796439, 1, 1, 1, 1, 1,
-1.159035, 1.044747, 0.1522322, 1, 1, 1, 1, 1,
-1.156945, -0.8937602, -0.9775016, 1, 1, 1, 1, 1,
-1.150239, 0.1484543, -2.19379, 1, 1, 1, 1, 1,
-1.148092, 0.9884942, -0.1022855, 1, 1, 1, 1, 1,
-1.144912, 1.13679, -3.135448, 1, 1, 1, 1, 1,
-1.140214, -1.193634, -1.696636, 1, 1, 1, 1, 1,
-1.129991, -0.3833812, -2.798682, 1, 1, 1, 1, 1,
-1.123047, 0.5152932, 0.2078328, 1, 1, 1, 1, 1,
-1.12101, -1.066614, -0.1135485, 1, 1, 1, 1, 1,
-1.114302, -1.049009, -2.753724, 1, 1, 1, 1, 1,
-1.110443, -1.316084, -2.396154, 1, 1, 1, 1, 1,
-1.108211, 0.6795178, -1.394899, 1, 1, 1, 1, 1,
-1.100294, 0.007656888, -3.854685, 1, 1, 1, 1, 1,
-1.096015, 0.4164448, -1.351589, 1, 1, 1, 1, 1,
-1.092475, -0.1981814, -0.4586785, 0, 0, 1, 1, 1,
-1.088596, -0.0773731, -2.871268, 1, 0, 0, 1, 1,
-1.086993, 0.4257418, -1.659109, 1, 0, 0, 1, 1,
-1.085297, 0.5764521, -2.456311, 1, 0, 0, 1, 1,
-1.078866, 1.020893, -0.3148606, 1, 0, 0, 1, 1,
-1.077763, -0.9547845, -3.28731, 1, 0, 0, 1, 1,
-1.076174, -1.555969, -4.068427, 0, 0, 0, 1, 1,
-1.067719, -1.874307, -2.565768, 0, 0, 0, 1, 1,
-1.063867, 1.989345, -1.365164, 0, 0, 0, 1, 1,
-1.061969, 0.9189819, -1.303359, 0, 0, 0, 1, 1,
-1.061736, -1.729407, -2.554197, 0, 0, 0, 1, 1,
-1.055595, -0.06216392, -4.250826, 0, 0, 0, 1, 1,
-1.048013, -1.429625, -2.541388, 0, 0, 0, 1, 1,
-1.047921, 0.3804604, -0.1855944, 1, 1, 1, 1, 1,
-1.043674, 0.5536507, -0.440231, 1, 1, 1, 1, 1,
-1.04275, 1.27678, -0.621815, 1, 1, 1, 1, 1,
-1.04191, -0.3177712, -3.085674, 1, 1, 1, 1, 1,
-1.036318, 0.4723877, -1.631529, 1, 1, 1, 1, 1,
-1.036027, -0.5678963, -2.365939, 1, 1, 1, 1, 1,
-1.032724, 0.4024459, -0.9030492, 1, 1, 1, 1, 1,
-1.031351, 1.443321, 1.031982, 1, 1, 1, 1, 1,
-1.031092, 0.7790524, -2.676301, 1, 1, 1, 1, 1,
-1.030961, 0.273857, -0.769159, 1, 1, 1, 1, 1,
-1.021272, 1.508632, -0.2090819, 1, 1, 1, 1, 1,
-1.014282, -1.107345, -1.47496, 1, 1, 1, 1, 1,
-1.009013, -0.1626178, 0.7831798, 1, 1, 1, 1, 1,
-1.005292, 0.8041054, -0.338299, 1, 1, 1, 1, 1,
-0.9996681, -0.4226522, -2.758235, 1, 1, 1, 1, 1,
-0.9952087, -0.5035578, -2.173672, 0, 0, 1, 1, 1,
-0.9914089, 0.3453398, -3.025183, 1, 0, 0, 1, 1,
-0.989722, 0.1192297, -1.698933, 1, 0, 0, 1, 1,
-0.9889964, -0.4189081, -1.837981, 1, 0, 0, 1, 1,
-0.9853674, 0.09810456, 0.007287063, 1, 0, 0, 1, 1,
-0.9845887, 0.3398283, -1.642359, 1, 0, 0, 1, 1,
-0.9792805, 0.8202864, -0.6470042, 0, 0, 0, 1, 1,
-0.9763595, -0.6237461, -2.716938, 0, 0, 0, 1, 1,
-0.9760545, 0.1218598, -1.184471, 0, 0, 0, 1, 1,
-0.9745089, -0.5274718, -2.334536, 0, 0, 0, 1, 1,
-0.9744883, 0.3543915, -0.632601, 0, 0, 0, 1, 1,
-0.9686764, 0.6253044, -1.455837, 0, 0, 0, 1, 1,
-0.9616749, 1.160589, -0.7739673, 0, 0, 0, 1, 1,
-0.9610447, -0.3197838, -1.551116, 1, 1, 1, 1, 1,
-0.9597713, -0.9704928, -4.416508, 1, 1, 1, 1, 1,
-0.9582458, -0.9676726, -0.8660201, 1, 1, 1, 1, 1,
-0.9576969, -1.607714, -3.653808, 1, 1, 1, 1, 1,
-0.9566574, -0.3687181, -1.006323, 1, 1, 1, 1, 1,
-0.9536235, -0.7277631, -1.900755, 1, 1, 1, 1, 1,
-0.9518455, -1.975034, -2.633936, 1, 1, 1, 1, 1,
-0.9510799, 0.3743771, -1.77469, 1, 1, 1, 1, 1,
-0.9424221, -1.463163, -0.3195049, 1, 1, 1, 1, 1,
-0.9420662, -1.616749, -2.794286, 1, 1, 1, 1, 1,
-0.9342545, -0.6682498, -1.284452, 1, 1, 1, 1, 1,
-0.9269278, 0.1014368, -1.559439, 1, 1, 1, 1, 1,
-0.9226028, -1.174382, 0.6012709, 1, 1, 1, 1, 1,
-0.9165231, 2.887313, 1.908397, 1, 1, 1, 1, 1,
-0.9141264, 0.3011135, -3.194223, 1, 1, 1, 1, 1,
-0.9136899, 2.112584, -0.9283285, 0, 0, 1, 1, 1,
-0.9126781, -1.658318, -2.192193, 1, 0, 0, 1, 1,
-0.9083742, 1.843468, -0.345521, 1, 0, 0, 1, 1,
-0.9065381, -0.2264054, -2.014423, 1, 0, 0, 1, 1,
-0.8983559, -0.843941, -0.855246, 1, 0, 0, 1, 1,
-0.8942231, 0.4860583, 0.5541236, 1, 0, 0, 1, 1,
-0.8940643, 1.382828, -0.5908033, 0, 0, 0, 1, 1,
-0.8932258, -0.219619, -3.017514, 0, 0, 0, 1, 1,
-0.8873942, 0.4074952, -1.384291, 0, 0, 0, 1, 1,
-0.882234, 0.6504036, -1.472063, 0, 0, 0, 1, 1,
-0.8765333, 0.6727142, -1.593434, 0, 0, 0, 1, 1,
-0.8708908, -1.10534, -2.185694, 0, 0, 0, 1, 1,
-0.8664571, 1.699728, -1.624654, 0, 0, 0, 1, 1,
-0.8645937, 0.01398573, -1.267168, 1, 1, 1, 1, 1,
-0.8595752, -0.2887377, -3.67161, 1, 1, 1, 1, 1,
-0.8524718, 0.1682436, -2.787651, 1, 1, 1, 1, 1,
-0.8476145, 1.926557, -1.478709, 1, 1, 1, 1, 1,
-0.841611, -0.3412199, -2.385003, 1, 1, 1, 1, 1,
-0.8365803, 0.4442365, -1.887116, 1, 1, 1, 1, 1,
-0.8353892, -0.4782219, -1.434062, 1, 1, 1, 1, 1,
-0.8292353, 0.5201797, 0.01506476, 1, 1, 1, 1, 1,
-0.8273344, -0.6649227, -2.801167, 1, 1, 1, 1, 1,
-0.8175797, -0.3606303, -1.800808, 1, 1, 1, 1, 1,
-0.8151808, 1.983816, -0.7710909, 1, 1, 1, 1, 1,
-0.8102258, 0.8588654, -0.9065412, 1, 1, 1, 1, 1,
-0.808536, -0.9435946, -1.322953, 1, 1, 1, 1, 1,
-0.8077819, 1.365331, -2.094804, 1, 1, 1, 1, 1,
-0.8071578, -0.07093414, -3.293575, 1, 1, 1, 1, 1,
-0.7998319, 0.2939549, -3.800676, 0, 0, 1, 1, 1,
-0.7975855, -1.519549, -2.014183, 1, 0, 0, 1, 1,
-0.79404, -0.5330412, -2.225788, 1, 0, 0, 1, 1,
-0.7931551, 1.520014, -1.952225, 1, 0, 0, 1, 1,
-0.7868755, 0.882525, -1.153932, 1, 0, 0, 1, 1,
-0.7867049, 0.8748919, -0.9051493, 1, 0, 0, 1, 1,
-0.7862696, 0.1055702, -2.317571, 0, 0, 0, 1, 1,
-0.7847648, 1.023474, 0.8965808, 0, 0, 0, 1, 1,
-0.7796389, 0.6481743, -0.4584933, 0, 0, 0, 1, 1,
-0.7795548, 0.396278, -1.878988, 0, 0, 0, 1, 1,
-0.7789459, -2.144547, -3.403321, 0, 0, 0, 1, 1,
-0.7734158, -0.5719766, -1.339654, 0, 0, 0, 1, 1,
-0.7677183, -0.7421266, -2.046926, 0, 0, 0, 1, 1,
-0.7675979, -1.571865, -2.39616, 1, 1, 1, 1, 1,
-0.7658171, -0.3517006, -1.539384, 1, 1, 1, 1, 1,
-0.7637677, 2.045303, 1.602248, 1, 1, 1, 1, 1,
-0.7603956, 1.067185, -2.36174, 1, 1, 1, 1, 1,
-0.7596188, 0.6369604, 0.3707008, 1, 1, 1, 1, 1,
-0.7594156, 0.03308823, -1.328319, 1, 1, 1, 1, 1,
-0.7470835, 0.6341207, -0.9918719, 1, 1, 1, 1, 1,
-0.7429512, -1.972174, -3.789712, 1, 1, 1, 1, 1,
-0.7408662, 0.4656138, 1.966798e-05, 1, 1, 1, 1, 1,
-0.7329649, 0.4461048, -2.528036, 1, 1, 1, 1, 1,
-0.7317214, 1.838848, -3.362477, 1, 1, 1, 1, 1,
-0.7236719, 0.7559472, -1.276641, 1, 1, 1, 1, 1,
-0.7236679, -0.4796259, -1.547282, 1, 1, 1, 1, 1,
-0.7201355, 1.384663, 0.3388756, 1, 1, 1, 1, 1,
-0.7138758, -0.3714343, -1.163468, 1, 1, 1, 1, 1,
-0.7130467, 1.02862, -0.7592846, 0, 0, 1, 1, 1,
-0.7125515, -0.377559, -3.203339, 1, 0, 0, 1, 1,
-0.7103627, -0.0415077, -2.507224, 1, 0, 0, 1, 1,
-0.6988225, 0.2840806, -1.492863, 1, 0, 0, 1, 1,
-0.6898112, 0.5839913, -1.747757, 1, 0, 0, 1, 1,
-0.6891348, 1.036423, -1.632186, 1, 0, 0, 1, 1,
-0.6801655, -1.475152, -1.723747, 0, 0, 0, 1, 1,
-0.674282, 0.7936718, 0.2386411, 0, 0, 0, 1, 1,
-0.6724848, -0.3873418, -2.265618, 0, 0, 0, 1, 1,
-0.6718109, 0.1050207, -1.786305, 0, 0, 0, 1, 1,
-0.6644526, -1.424182, -1.473843, 0, 0, 0, 1, 1,
-0.6640325, 0.6692876, -1.577901, 0, 0, 0, 1, 1,
-0.6639696, -0.5804403, -2.322073, 0, 0, 0, 1, 1,
-0.6605992, 0.9974838, -1.508236, 1, 1, 1, 1, 1,
-0.6548811, 0.1078327, 0.6749192, 1, 1, 1, 1, 1,
-0.6541752, -0.01038124, -0.7865387, 1, 1, 1, 1, 1,
-0.6512007, 0.03849946, -1.236391, 1, 1, 1, 1, 1,
-0.6501498, -0.8793334, -1.238903, 1, 1, 1, 1, 1,
-0.649811, 1.966573, 0.04990575, 1, 1, 1, 1, 1,
-0.6481372, 0.3335233, -0.08590215, 1, 1, 1, 1, 1,
-0.6416919, -1.928225, -3.592979, 1, 1, 1, 1, 1,
-0.6404072, -1.50903, -3.401162, 1, 1, 1, 1, 1,
-0.6398802, -0.0747814, -2.310825, 1, 1, 1, 1, 1,
-0.6290876, -0.539223, -2.904258, 1, 1, 1, 1, 1,
-0.6276388, 0.2304173, -1.939607, 1, 1, 1, 1, 1,
-0.6220998, -0.9090652, -1.518005, 1, 1, 1, 1, 1,
-0.6131756, 2.242262, -0.9199938, 1, 1, 1, 1, 1,
-0.6096257, -0.6219122, -1.786502, 1, 1, 1, 1, 1,
-0.6046484, 0.6835275, -0.7012478, 0, 0, 1, 1, 1,
-0.6039174, -0.07161126, -2.351446, 1, 0, 0, 1, 1,
-0.603765, -1.48826, -1.247958, 1, 0, 0, 1, 1,
-0.6027645, 0.0488552, -1.271991, 1, 0, 0, 1, 1,
-0.5981054, -0.4500175, -2.413196, 1, 0, 0, 1, 1,
-0.5952911, -0.7178555, -1.933503, 1, 0, 0, 1, 1,
-0.5903628, 0.1353082, -3.075841, 0, 0, 0, 1, 1,
-0.5857753, -1.121801, -2.712547, 0, 0, 0, 1, 1,
-0.5854877, 0.01728117, -1.829858, 0, 0, 0, 1, 1,
-0.5829857, 0.2133399, -0.7255259, 0, 0, 0, 1, 1,
-0.5800545, -0.01477644, -1.675117, 0, 0, 0, 1, 1,
-0.5789771, -0.02734585, -2.25591, 0, 0, 0, 1, 1,
-0.5788454, -0.8840633, -3.090268, 0, 0, 0, 1, 1,
-0.5782567, 1.177245, -1.707499, 1, 1, 1, 1, 1,
-0.5780447, -0.9891677, -1.862343, 1, 1, 1, 1, 1,
-0.5764009, 1.098484, -3.716314, 1, 1, 1, 1, 1,
-0.5711656, 1.255022, 0.9901091, 1, 1, 1, 1, 1,
-0.570389, 0.6603853, -0.03831517, 1, 1, 1, 1, 1,
-0.56527, -1.711016, -1.966604, 1, 1, 1, 1, 1,
-0.5635287, -0.9925697, -4.250418, 1, 1, 1, 1, 1,
-0.5627021, 0.1042658, -0.3795001, 1, 1, 1, 1, 1,
-0.5598723, 0.2339919, -0.8996332, 1, 1, 1, 1, 1,
-0.5592896, -0.4231962, -1.002866, 1, 1, 1, 1, 1,
-0.5586075, 0.3379689, -3.767438, 1, 1, 1, 1, 1,
-0.557214, -0.9781618, -2.699964, 1, 1, 1, 1, 1,
-0.5463645, -0.2771155, -1.863647, 1, 1, 1, 1, 1,
-0.5367862, -0.06471623, -1.918232, 1, 1, 1, 1, 1,
-0.5356318, 0.01237067, -3.34731, 1, 1, 1, 1, 1,
-0.5310531, 0.378476, 2.165468, 0, 0, 1, 1, 1,
-0.5257077, -0.01471757, -1.691193, 1, 0, 0, 1, 1,
-0.5209905, 0.3561031, 0.02220768, 1, 0, 0, 1, 1,
-0.5157772, -1.115687, -2.860316, 1, 0, 0, 1, 1,
-0.5151041, 0.01433621, -1.912165, 1, 0, 0, 1, 1,
-0.5147879, 0.711741, -3.251848, 1, 0, 0, 1, 1,
-0.5125716, 1.444241, -0.7898659, 0, 0, 0, 1, 1,
-0.5124766, 1.414279, -0.5694777, 0, 0, 0, 1, 1,
-0.5073344, 0.3240628, -2.284079, 0, 0, 0, 1, 1,
-0.5064811, 1.627639, -0.1715053, 0, 0, 0, 1, 1,
-0.5051281, -0.2965896, -4.063702, 0, 0, 0, 1, 1,
-0.4951594, 0.3458853, 0.96286, 0, 0, 0, 1, 1,
-0.4879555, -0.2683598, -1.576666, 0, 0, 0, 1, 1,
-0.4842656, -1.162603, -3.313005, 1, 1, 1, 1, 1,
-0.4828603, -1.139707, -4.147812, 1, 1, 1, 1, 1,
-0.4746767, 1.479298, -0.744621, 1, 1, 1, 1, 1,
-0.472901, 1.179972, -0.3410816, 1, 1, 1, 1, 1,
-0.4711911, -0.8384968, -3.712443, 1, 1, 1, 1, 1,
-0.4707138, -2.264385, -2.789979, 1, 1, 1, 1, 1,
-0.4652081, -0.5023409, -3.929376, 1, 1, 1, 1, 1,
-0.4650998, -1.556394, -3.803843, 1, 1, 1, 1, 1,
-0.4636882, 0.1714022, -1.732547, 1, 1, 1, 1, 1,
-0.4595184, 2.059698, 1.287282, 1, 1, 1, 1, 1,
-0.4585707, -0.6272888, -2.795486, 1, 1, 1, 1, 1,
-0.4536381, 1.100701, -0.7343961, 1, 1, 1, 1, 1,
-0.4498991, 0.3040517, -2.555325, 1, 1, 1, 1, 1,
-0.4445106, -0.7838982, -3.781147, 1, 1, 1, 1, 1,
-0.4418888, 0.5576521, -0.8789854, 1, 1, 1, 1, 1,
-0.4363091, 0.05442214, -1.185196, 0, 0, 1, 1, 1,
-0.4351369, 0.877068, 0.56905, 1, 0, 0, 1, 1,
-0.4323263, 0.9430017, 0.3394658, 1, 0, 0, 1, 1,
-0.432209, -0.3807456, -1.416291, 1, 0, 0, 1, 1,
-0.4318536, -1.132748, -2.529876, 1, 0, 0, 1, 1,
-0.4310723, 1.244989, 0.8777773, 1, 0, 0, 1, 1,
-0.4291911, 0.1266677, -2.559219, 0, 0, 0, 1, 1,
-0.4278172, -0.5308151, -2.845412, 0, 0, 0, 1, 1,
-0.4217338, -0.03578755, -2.43124, 0, 0, 0, 1, 1,
-0.413033, -1.374818, -1.468687, 0, 0, 0, 1, 1,
-0.4081636, -0.2790882, -1.230273, 0, 0, 0, 1, 1,
-0.4080754, -1.173189, -5.201077, 0, 0, 0, 1, 1,
-0.4062096, 1.969647, 0.2941833, 0, 0, 0, 1, 1,
-0.4050788, -0.2263582, -1.789384, 1, 1, 1, 1, 1,
-0.4037801, -1.502875, -2.895269, 1, 1, 1, 1, 1,
-0.4034921, -0.9786231, -3.395274, 1, 1, 1, 1, 1,
-0.3872534, 0.1444463, -3.09735, 1, 1, 1, 1, 1,
-0.3833483, 1.52885, -0.5303519, 1, 1, 1, 1, 1,
-0.3833389, 0.5919326, -0.5325194, 1, 1, 1, 1, 1,
-0.3809247, -0.680558, -2.817994, 1, 1, 1, 1, 1,
-0.3780409, -0.6942639, -4.092472, 1, 1, 1, 1, 1,
-0.3705763, 0.8811382, -1.461472, 1, 1, 1, 1, 1,
-0.3655931, 1.337464, -0.1079986, 1, 1, 1, 1, 1,
-0.3648695, 0.7111941, 0.2678111, 1, 1, 1, 1, 1,
-0.3644847, -0.3784575, -3.260992, 1, 1, 1, 1, 1,
-0.3612514, -0.7142885, -2.880367, 1, 1, 1, 1, 1,
-0.3599696, 0.2213294, -1.456576, 1, 1, 1, 1, 1,
-0.3595749, -0.6453545, -3.032934, 1, 1, 1, 1, 1,
-0.3547637, 0.3817337, 0.175719, 0, 0, 1, 1, 1,
-0.3505862, 0.2402477, -1.014773, 1, 0, 0, 1, 1,
-0.3496201, -0.5050323, -1.887147, 1, 0, 0, 1, 1,
-0.3424146, 2.55912, -1.759764, 1, 0, 0, 1, 1,
-0.338405, 0.7860608, -0.4103647, 1, 0, 0, 1, 1,
-0.3383062, 1.463741, -0.4146771, 1, 0, 0, 1, 1,
-0.3372901, -0.258215, -3.506118, 0, 0, 0, 1, 1,
-0.33729, 1.704166, -0.6712981, 0, 0, 0, 1, 1,
-0.3371047, -0.1558357, -2.903778, 0, 0, 0, 1, 1,
-0.336382, 1.355436, 0.0382087, 0, 0, 0, 1, 1,
-0.3363069, -2.109779, -2.772525, 0, 0, 0, 1, 1,
-0.3328689, 0.2473466, 0.7199865, 0, 0, 0, 1, 1,
-0.3292478, -0.3607576, -1.442998, 0, 0, 0, 1, 1,
-0.327815, 0.8205587, 0.1583957, 1, 1, 1, 1, 1,
-0.3265522, -0.330053, -3.171633, 1, 1, 1, 1, 1,
-0.3265026, -1.038101, -3.79006, 1, 1, 1, 1, 1,
-0.3216205, 0.1493359, -2.79933, 1, 1, 1, 1, 1,
-0.3209803, 0.7666412, -0.3690031, 1, 1, 1, 1, 1,
-0.3179632, -0.6043199, -3.016776, 1, 1, 1, 1, 1,
-0.3147616, -0.134317, -1.295975, 1, 1, 1, 1, 1,
-0.3132504, -2.949486, -2.714204, 1, 1, 1, 1, 1,
-0.3092946, 1.42467, -0.964903, 1, 1, 1, 1, 1,
-0.3075857, 0.4988267, 0.3725981, 1, 1, 1, 1, 1,
-0.2898923, -0.927021, -2.778528, 1, 1, 1, 1, 1,
-0.2888753, -0.2628837, -0.5321258, 1, 1, 1, 1, 1,
-0.2857028, 0.0227583, -0.9547212, 1, 1, 1, 1, 1,
-0.2834417, -0.8536589, -4.23678, 1, 1, 1, 1, 1,
-0.2825522, 0.9045582, -2.163564, 1, 1, 1, 1, 1,
-0.2819093, 0.1460698, -0.4566693, 0, 0, 1, 1, 1,
-0.2798503, 1.810909, 0.9733083, 1, 0, 0, 1, 1,
-0.2775841, 1.54803, -1.073884, 1, 0, 0, 1, 1,
-0.2754638, 1.192457, -1.383905, 1, 0, 0, 1, 1,
-0.2741916, -1.268808, -2.374902, 1, 0, 0, 1, 1,
-0.2705606, -1.316979, -2.981802, 1, 0, 0, 1, 1,
-0.2704618, -0.8826738, -2.578224, 0, 0, 0, 1, 1,
-0.2697874, 1.251243, -0.5534267, 0, 0, 0, 1, 1,
-0.2665707, 0.4132287, 0.4643746, 0, 0, 0, 1, 1,
-0.2619949, -0.4344395, -1.658663, 0, 0, 0, 1, 1,
-0.2586393, 1.312715, 0.05980689, 0, 0, 0, 1, 1,
-0.2504731, 1.289411, 2.426274, 0, 0, 0, 1, 1,
-0.2502062, 0.2785265, -0.7754148, 0, 0, 0, 1, 1,
-0.2463649, -0.6444405, -2.385199, 1, 1, 1, 1, 1,
-0.2435758, 0.4654703, -0.8418877, 1, 1, 1, 1, 1,
-0.2427176, -1.583701, -4.335705, 1, 1, 1, 1, 1,
-0.2386117, 0.1393176, -2.726935, 1, 1, 1, 1, 1,
-0.2384313, 0.9565358, 0.3268513, 1, 1, 1, 1, 1,
-0.2378094, 1.509284, -1.208556, 1, 1, 1, 1, 1,
-0.2374092, 0.2960891, -1.885468, 1, 1, 1, 1, 1,
-0.2363596, -0.08011863, -0.9767665, 1, 1, 1, 1, 1,
-0.2348972, -1.823337, -3.506326, 1, 1, 1, 1, 1,
-0.2334505, 0.8368746, -0.7161655, 1, 1, 1, 1, 1,
-0.2325951, 0.6111042, -0.3097555, 1, 1, 1, 1, 1,
-0.2307433, 1.092457, 1.463805, 1, 1, 1, 1, 1,
-0.227136, -1.690669, -1.338748, 1, 1, 1, 1, 1,
-0.2191504, -0.2946176, -1.624045, 1, 1, 1, 1, 1,
-0.2159666, -0.8816465, -2.938269, 1, 1, 1, 1, 1,
-0.2058443, -0.6997831, -3.151683, 0, 0, 1, 1, 1,
-0.2054482, 0.7297718, -0.3984334, 1, 0, 0, 1, 1,
-0.2023528, 0.3286317, -1.73879, 1, 0, 0, 1, 1,
-0.1948906, 0.7322786, -1.065441, 1, 0, 0, 1, 1,
-0.1941006, -0.9770002, -3.378516, 1, 0, 0, 1, 1,
-0.1934215, 0.1677062, -0.9448069, 1, 0, 0, 1, 1,
-0.1917761, -0.4514335, -1.888953, 0, 0, 0, 1, 1,
-0.1915895, -0.4849266, -2.63209, 0, 0, 0, 1, 1,
-0.1888856, -0.290021, -3.345515, 0, 0, 0, 1, 1,
-0.1799794, -0.3837036, -3.710597, 0, 0, 0, 1, 1,
-0.1770998, -1.29442, -3.828512, 0, 0, 0, 1, 1,
-0.1758185, -0.5556078, -2.287822, 0, 0, 0, 1, 1,
-0.1748256, 0.1483894, -0.2317819, 0, 0, 0, 1, 1,
-0.1740421, -0.1100858, -2.869314, 1, 1, 1, 1, 1,
-0.1732791, 0.17789, -1.545237, 1, 1, 1, 1, 1,
-0.1727589, -0.3925217, -1.859946, 1, 1, 1, 1, 1,
-0.1645094, -0.2014584, -2.446849, 1, 1, 1, 1, 1,
-0.1628316, 0.936629, -1.573249, 1, 1, 1, 1, 1,
-0.16061, 0.2910784, -1.926928, 1, 1, 1, 1, 1,
-0.1589893, -0.2885042, -2.328043, 1, 1, 1, 1, 1,
-0.158488, 0.1392101, -1.152797, 1, 1, 1, 1, 1,
-0.1577104, -1.483652, -3.780818, 1, 1, 1, 1, 1,
-0.1532305, 1.88516, 0.1430067, 1, 1, 1, 1, 1,
-0.151148, 0.1570083, 0.4293487, 1, 1, 1, 1, 1,
-0.149567, 1.291624, 0.7577705, 1, 1, 1, 1, 1,
-0.1464678, 2.332373, 2.143458, 1, 1, 1, 1, 1,
-0.1450282, 0.7627443, -0.8498001, 1, 1, 1, 1, 1,
-0.1332459, -1.094244, -2.0433, 1, 1, 1, 1, 1,
-0.1325025, -3.050202, -2.925611, 0, 0, 1, 1, 1,
-0.1310534, -1.307579, -3.125215, 1, 0, 0, 1, 1,
-0.123643, 0.686657, -1.359576, 1, 0, 0, 1, 1,
-0.1232996, -2.279985, -2.549485, 1, 0, 0, 1, 1,
-0.1197899, -0.05021642, -1.250375, 1, 0, 0, 1, 1,
-0.118746, 1.095651, 0.696757, 1, 0, 0, 1, 1,
-0.1160971, -0.1496361, -2.289869, 0, 0, 0, 1, 1,
-0.1160122, 0.17745, -0.01089939, 0, 0, 0, 1, 1,
-0.1127388, 1.1243, 0.1634414, 0, 0, 0, 1, 1,
-0.1122783, 1.532045, 1.410683, 0, 0, 0, 1, 1,
-0.1086181, 0.08233309, -1.831535, 0, 0, 0, 1, 1,
-0.1040004, 0.4700736, -0.8497844, 0, 0, 0, 1, 1,
-0.1024132, -1.55444, -3.369788, 0, 0, 0, 1, 1,
-0.09936461, 0.9838011, -0.4641663, 1, 1, 1, 1, 1,
-0.0982446, 0.653325, -0.4082024, 1, 1, 1, 1, 1,
-0.09636715, -1.846106, -3.75814, 1, 1, 1, 1, 1,
-0.0942049, -0.8655816, -3.337694, 1, 1, 1, 1, 1,
-0.09262805, 1.942139, 0.1792812, 1, 1, 1, 1, 1,
-0.0925514, 2.108599, 0.3728885, 1, 1, 1, 1, 1,
-0.09129419, 0.8374481, -1.21065, 1, 1, 1, 1, 1,
-0.09117993, 1.719273, -1.231705, 1, 1, 1, 1, 1,
-0.08991989, 0.3913073, -0.883741, 1, 1, 1, 1, 1,
-0.08917236, 0.1029211, -1.073355, 1, 1, 1, 1, 1,
-0.08846799, -0.2114096, -2.16922, 1, 1, 1, 1, 1,
-0.07575528, -1.635027, -2.879438, 1, 1, 1, 1, 1,
-0.0752243, -0.8553286, -3.75662, 1, 1, 1, 1, 1,
-0.07472994, -1.867645, -3.954197, 1, 1, 1, 1, 1,
-0.07274207, 0.3222038, -1.245227, 1, 1, 1, 1, 1,
-0.06554036, 1.159358, -0.3407919, 0, 0, 1, 1, 1,
-0.06196302, 0.6306211, -0.3967232, 1, 0, 0, 1, 1,
-0.05756705, -0.8493495, -4.065202, 1, 0, 0, 1, 1,
-0.05750174, 1.377255, -0.5790391, 1, 0, 0, 1, 1,
-0.05265193, 0.7403714, -0.3974408, 1, 0, 0, 1, 1,
-0.05167589, -0.8537287, -2.660542, 1, 0, 0, 1, 1,
-0.04993167, -0.2308506, -5.553816, 0, 0, 0, 1, 1,
-0.04907621, -0.9362113, -3.200288, 0, 0, 0, 1, 1,
-0.04721252, -0.4694651, -4.243245, 0, 0, 0, 1, 1,
-0.04211156, -0.1417329, -1.650416, 0, 0, 0, 1, 1,
-0.03574736, 0.6352805, -1.20773, 0, 0, 0, 1, 1,
-0.03522838, 1.229722, 1.980482, 0, 0, 0, 1, 1,
-0.0333917, -1.42776, -2.808183, 0, 0, 0, 1, 1,
-0.03008168, 0.6052638, 1.101734, 1, 1, 1, 1, 1,
-0.02660623, -0.8736097, -1.59394, 1, 1, 1, 1, 1,
-0.02319443, 2.358, -0.2144043, 1, 1, 1, 1, 1,
-0.02096036, -0.9380425, -3.580731, 1, 1, 1, 1, 1,
-0.02050157, -0.9393817, -4.792012, 1, 1, 1, 1, 1,
-0.01799216, 0.4197214, 0.692342, 1, 1, 1, 1, 1,
-0.01778271, -0.8645258, -3.521478, 1, 1, 1, 1, 1,
-0.01644093, 0.5522938, -0.3492435, 1, 1, 1, 1, 1,
-0.008442844, 1.390986, 0.6902065, 1, 1, 1, 1, 1,
-0.007476579, -0.4189248, -1.04091, 1, 1, 1, 1, 1,
-0.005735217, 1.044617, -0.8105068, 1, 1, 1, 1, 1,
-0.002184565, -0.8140037, -2.790286, 1, 1, 1, 1, 1,
-9.619286e-05, 1.441697, -1.579695, 1, 1, 1, 1, 1,
0.009887262, -0.7486567, 2.91131, 1, 1, 1, 1, 1,
0.009946918, -0.4746528, 4.211026, 1, 1, 1, 1, 1,
0.01360626, 1.451089, 0.4914052, 0, 0, 1, 1, 1,
0.01934977, -0.3219963, 3.521108, 1, 0, 0, 1, 1,
0.02107098, -0.3587097, 2.533947, 1, 0, 0, 1, 1,
0.02263257, 0.6992075, 1.13725, 1, 0, 0, 1, 1,
0.02420276, -0.3667212, 2.048993, 1, 0, 0, 1, 1,
0.02447657, 0.7190114, -2.324031, 1, 0, 0, 1, 1,
0.03395275, 0.5722388, -1.240562, 0, 0, 0, 1, 1,
0.03496244, -0.2808051, 4.051303, 0, 0, 0, 1, 1,
0.0359251, -1.53444, 4.039095, 0, 0, 0, 1, 1,
0.03982171, -0.1428211, 4.603826, 0, 0, 0, 1, 1,
0.0411473, -0.4578528, 1.972776, 0, 0, 0, 1, 1,
0.04203823, -0.1845352, 4.069842, 0, 0, 0, 1, 1,
0.04205709, 0.8589013, 1.066278, 0, 0, 0, 1, 1,
0.04346213, 1.312245, 0.1906385, 1, 1, 1, 1, 1,
0.04860292, -1.078135, 2.669269, 1, 1, 1, 1, 1,
0.05151092, -0.5874081, 4.342981, 1, 1, 1, 1, 1,
0.05298781, 0.6717293, -1.130178, 1, 1, 1, 1, 1,
0.05428001, -0.2221579, 3.18716, 1, 1, 1, 1, 1,
0.05777507, 0.3007331, 2.399906, 1, 1, 1, 1, 1,
0.06047369, 1.419327, 0.5122835, 1, 1, 1, 1, 1,
0.06079054, -0.1511505, 4.365039, 1, 1, 1, 1, 1,
0.06698574, 0.3413561, 0.5052923, 1, 1, 1, 1, 1,
0.06919287, 0.8613632, 0.01589101, 1, 1, 1, 1, 1,
0.07221321, 0.9982696, 1.400261, 1, 1, 1, 1, 1,
0.07592524, 0.7603793, -0.1367414, 1, 1, 1, 1, 1,
0.07611266, 0.7193434, 0.6617385, 1, 1, 1, 1, 1,
0.0765103, 0.238582, 2.487435, 1, 1, 1, 1, 1,
0.07734974, -1.012442, 2.586807, 1, 1, 1, 1, 1,
0.07807681, 1.430631, 0.1610109, 0, 0, 1, 1, 1,
0.078284, 1.340327, 1.374161, 1, 0, 0, 1, 1,
0.08419588, -1.93154, 3.494973, 1, 0, 0, 1, 1,
0.08639303, 1.046681, -0.5701385, 1, 0, 0, 1, 1,
0.09217537, -0.6228271, 1.606252, 1, 0, 0, 1, 1,
0.09339108, -2.03615, 3.277837, 1, 0, 0, 1, 1,
0.1193015, 0.6352193, 1.170959, 0, 0, 0, 1, 1,
0.1195659, -0.1160055, 1.796505, 0, 0, 0, 1, 1,
0.1238564, 1.096189, -0.2523231, 0, 0, 0, 1, 1,
0.1260584, -1.023643, 1.663439, 0, 0, 0, 1, 1,
0.1310272, 0.899902, -0.4806933, 0, 0, 0, 1, 1,
0.1318529, 0.5086498, 0.7981458, 0, 0, 0, 1, 1,
0.1323844, -0.9508501, 2.151483, 0, 0, 0, 1, 1,
0.1348723, 0.7748108, 1.988518, 1, 1, 1, 1, 1,
0.1375829, 0.6331614, -0.5792202, 1, 1, 1, 1, 1,
0.1384024, 0.1623202, 1.332434, 1, 1, 1, 1, 1,
0.1415973, -0.1818786, -0.2683964, 1, 1, 1, 1, 1,
0.1451802, 0.8260338, 0.02235839, 1, 1, 1, 1, 1,
0.1509438, -0.2137007, 1.59206, 1, 1, 1, 1, 1,
0.154924, -0.1027403, 1.941603, 1, 1, 1, 1, 1,
0.154962, 0.2190397, -1.48283, 1, 1, 1, 1, 1,
0.1554115, -1.155063, 3.215949, 1, 1, 1, 1, 1,
0.1567773, 1.303967, -0.4863785, 1, 1, 1, 1, 1,
0.1572074, 0.31696, 1.709147, 1, 1, 1, 1, 1,
0.1599457, 0.2021756, -0.1677405, 1, 1, 1, 1, 1,
0.160902, -0.04021704, 1.745211, 1, 1, 1, 1, 1,
0.1645694, -0.9830402, 2.865208, 1, 1, 1, 1, 1,
0.1649914, 0.5362576, 0.6162104, 1, 1, 1, 1, 1,
0.1650616, -0.4162317, 3.172552, 0, 0, 1, 1, 1,
0.1654221, 0.6650696, 0.538238, 1, 0, 0, 1, 1,
0.1721918, 0.5028086, -0.7887167, 1, 0, 0, 1, 1,
0.1741296, -1.55241, 4.103118, 1, 0, 0, 1, 1,
0.1754998, -0.7741711, 3.52455, 1, 0, 0, 1, 1,
0.180961, -0.2518552, 3.558576, 1, 0, 0, 1, 1,
0.1826761, 0.6063657, -1.441905, 0, 0, 0, 1, 1,
0.1827321, 0.3075525, 1.776342, 0, 0, 0, 1, 1,
0.185897, -0.1717965, 2.328124, 0, 0, 0, 1, 1,
0.193596, 0.2812697, 1.06855, 0, 0, 0, 1, 1,
0.1984769, 0.2703342, 1.083081, 0, 0, 0, 1, 1,
0.1992622, -0.7495915, 2.948545, 0, 0, 0, 1, 1,
0.2017192, -0.02209738, 1.322565, 0, 0, 0, 1, 1,
0.2026876, 0.1764114, 0.07138572, 1, 1, 1, 1, 1,
0.2091295, -0.4407022, 3.61861, 1, 1, 1, 1, 1,
0.2118739, -0.5530234, 2.123123, 1, 1, 1, 1, 1,
0.2155646, 0.05540544, 2.026342, 1, 1, 1, 1, 1,
0.2183124, -1.464479, 1.473695, 1, 1, 1, 1, 1,
0.223009, -1.363358, 2.436291, 1, 1, 1, 1, 1,
0.2259873, 1.526635, 0.7821502, 1, 1, 1, 1, 1,
0.2307958, 0.5780281, 0.919386, 1, 1, 1, 1, 1,
0.2314599, 0.6800367, -0.1194346, 1, 1, 1, 1, 1,
0.2327229, 0.9066688, 1.193111, 1, 1, 1, 1, 1,
0.2374448, -0.7024089, 0.6898822, 1, 1, 1, 1, 1,
0.2404174, 0.1829751, 0.3352099, 1, 1, 1, 1, 1,
0.2428607, -0.8633626, 2.497067, 1, 1, 1, 1, 1,
0.2444178, 0.05067073, 0.9970054, 1, 1, 1, 1, 1,
0.2460596, 1.357386, -0.006136771, 1, 1, 1, 1, 1,
0.2463278, -1.393155, 3.927149, 0, 0, 1, 1, 1,
0.2468662, -1.836474, 2.398804, 1, 0, 0, 1, 1,
0.2499657, -0.9979454, 3.038116, 1, 0, 0, 1, 1,
0.2558461, 1.570152, 0.4692104, 1, 0, 0, 1, 1,
0.2596056, 0.7009789, 0.6014403, 1, 0, 0, 1, 1,
0.2601246, -0.2240794, 2.183601, 1, 0, 0, 1, 1,
0.2641253, 0.7337644, 1.351092, 0, 0, 0, 1, 1,
0.2683379, 0.5216087, -0.7759202, 0, 0, 0, 1, 1,
0.2699872, -0.7269102, 3.327248, 0, 0, 0, 1, 1,
0.2709032, -0.8507925, 4.041138, 0, 0, 0, 1, 1,
0.2740493, 0.1816782, -0.08099151, 0, 0, 0, 1, 1,
0.2771035, -0.2442114, 1.559409, 0, 0, 0, 1, 1,
0.2775788, 0.6231618, 0.2252342, 0, 0, 0, 1, 1,
0.278701, -0.4306444, 3.108772, 1, 1, 1, 1, 1,
0.281797, 0.3409323, 1.028816, 1, 1, 1, 1, 1,
0.2827742, 0.1900496, 2.414287, 1, 1, 1, 1, 1,
0.2830225, -0.2252126, 3.356175, 1, 1, 1, 1, 1,
0.2836363, -1.031603, 2.773016, 1, 1, 1, 1, 1,
0.2848073, 0.7326428, -0.322008, 1, 1, 1, 1, 1,
0.28739, 1.898413, -0.7783577, 1, 1, 1, 1, 1,
0.2885547, -0.8328578, 3.85981, 1, 1, 1, 1, 1,
0.2891081, 0.9656805, 0.7970274, 1, 1, 1, 1, 1,
0.295398, 0.7848113, -1.231951, 1, 1, 1, 1, 1,
0.3019167, -0.1778651, 2.159152, 1, 1, 1, 1, 1,
0.302308, 0.2657682, -0.3999284, 1, 1, 1, 1, 1,
0.3031697, -0.2750973, 3.567094, 1, 1, 1, 1, 1,
0.3033886, -0.5451689, 3.039183, 1, 1, 1, 1, 1,
0.3059605, 1.359238, -1.391834, 1, 1, 1, 1, 1,
0.309322, 0.5122957, 0.8557451, 0, 0, 1, 1, 1,
0.309908, 1.725197, 0.2406613, 1, 0, 0, 1, 1,
0.3116346, 1.330146, -0.1974544, 1, 0, 0, 1, 1,
0.312275, -1.10988, 1.148876, 1, 0, 0, 1, 1,
0.3123818, 1.379582, -1.214033, 1, 0, 0, 1, 1,
0.3144674, 0.887549, -0.172571, 1, 0, 0, 1, 1,
0.315318, -0.2878975, 2.309837, 0, 0, 0, 1, 1,
0.3162087, 1.149178, -0.02574991, 0, 0, 0, 1, 1,
0.3214968, -0.9606373, 3.274347, 0, 0, 0, 1, 1,
0.3221126, 0.1973333, 0.4291772, 0, 0, 0, 1, 1,
0.3225442, -1.139534, 1.424064, 0, 0, 0, 1, 1,
0.3292271, 0.8895097, -0.4287342, 0, 0, 0, 1, 1,
0.3307761, -0.8078409, 3.863191, 0, 0, 0, 1, 1,
0.3311546, 0.3024904, 0.216792, 1, 1, 1, 1, 1,
0.3317766, 1.379179, 1.236173, 1, 1, 1, 1, 1,
0.3322719, 0.2630285, 1.127682, 1, 1, 1, 1, 1,
0.3343911, -0.07598522, 1.526188, 1, 1, 1, 1, 1,
0.3379542, 0.543978, -1.227297, 1, 1, 1, 1, 1,
0.339082, -2.696537, 3.67286, 1, 1, 1, 1, 1,
0.3447431, 0.593356, 0.9204662, 1, 1, 1, 1, 1,
0.3457936, -0.8647584, 1.684435, 1, 1, 1, 1, 1,
0.3462036, 0.4080527, 0.1889427, 1, 1, 1, 1, 1,
0.3466768, -0.7963564, 3.383426, 1, 1, 1, 1, 1,
0.3468501, 0.5684363, 1.388401, 1, 1, 1, 1, 1,
0.3478463, -0.9027429, 3.038071, 1, 1, 1, 1, 1,
0.3502407, 0.9553, -0.4623924, 1, 1, 1, 1, 1,
0.3506836, -1.252241, 2.189706, 1, 1, 1, 1, 1,
0.3525493, -1.417527, 1.835734, 1, 1, 1, 1, 1,
0.3537515, 0.4768699, -0.131091, 0, 0, 1, 1, 1,
0.3544926, -0.3182134, 3.872412, 1, 0, 0, 1, 1,
0.3599343, -0.4828412, 2.349841, 1, 0, 0, 1, 1,
0.3634329, -1.249501, 1.197989, 1, 0, 0, 1, 1,
0.367194, 0.1884157, 0.1714756, 1, 0, 0, 1, 1,
0.3682033, 0.6031407, 0.5503733, 1, 0, 0, 1, 1,
0.3707513, -0.4862781, 1.748914, 0, 0, 0, 1, 1,
0.3713407, 1.182447, 0.06239507, 0, 0, 0, 1, 1,
0.3720821, -0.09408233, 1.653617, 0, 0, 0, 1, 1,
0.3749134, -0.2486175, 1.433157, 0, 0, 0, 1, 1,
0.3758602, 0.8853124, -0.09715168, 0, 0, 0, 1, 1,
0.3769356, 0.2176052, 1.579895, 0, 0, 0, 1, 1,
0.3797267, 1.604747, 0.2603005, 0, 0, 0, 1, 1,
0.3819416, 0.1491535, -0.244718, 1, 1, 1, 1, 1,
0.3829916, -0.312686, 2.116907, 1, 1, 1, 1, 1,
0.39041, -0.7905889, 0.03444847, 1, 1, 1, 1, 1,
0.3925652, 0.6076499, -0.440481, 1, 1, 1, 1, 1,
0.392696, 0.334719, 1.397522, 1, 1, 1, 1, 1,
0.3929456, -0.6826493, 3.751957, 1, 1, 1, 1, 1,
0.3938542, -0.324594, 1.892199, 1, 1, 1, 1, 1,
0.3971871, -0.4653738, 2.398632, 1, 1, 1, 1, 1,
0.3993734, 1.101993, 0.6741505, 1, 1, 1, 1, 1,
0.4031883, -0.9630983, 2.822755, 1, 1, 1, 1, 1,
0.4070199, 0.1772788, 2.372156, 1, 1, 1, 1, 1,
0.4084373, -1.417705, 1.946289, 1, 1, 1, 1, 1,
0.4086595, 0.1919369, 1.456981, 1, 1, 1, 1, 1,
0.4096995, -1.398614, 3.714958, 1, 1, 1, 1, 1,
0.4097558, -0.7437698, 2.987763, 1, 1, 1, 1, 1,
0.4112034, 0.548892, 0.2006343, 0, 0, 1, 1, 1,
0.4164808, -0.03800442, 0.4358798, 1, 0, 0, 1, 1,
0.4185683, -1.542964, 2.746104, 1, 0, 0, 1, 1,
0.4191593, 0.5878758, 0.1854341, 1, 0, 0, 1, 1,
0.4254403, -0.6529038, 2.133303, 1, 0, 0, 1, 1,
0.4322204, -0.8734446, 4.609256, 1, 0, 0, 1, 1,
0.4422809, -1.479634, 2.675013, 0, 0, 0, 1, 1,
0.443778, -1.661423, 2.376929, 0, 0, 0, 1, 1,
0.445503, -0.6818194, 2.264785, 0, 0, 0, 1, 1,
0.4514136, 0.6798208, 1.34281, 0, 0, 0, 1, 1,
0.454084, -1.470336, 2.076337, 0, 0, 0, 1, 1,
0.4557597, -1.189919, 3.45647, 0, 0, 0, 1, 1,
0.4596924, -0.3766885, 3.263024, 0, 0, 0, 1, 1,
0.4620415, -1.018792, 3.472566, 1, 1, 1, 1, 1,
0.4631839, 2.378824, -0.3157085, 1, 1, 1, 1, 1,
0.4648977, 1.669266, 0.4839785, 1, 1, 1, 1, 1,
0.467484, 0.3841698, -0.508017, 1, 1, 1, 1, 1,
0.4687257, -0.09228831, 3.236856, 1, 1, 1, 1, 1,
0.4698925, -0.4035905, 3.067426, 1, 1, 1, 1, 1,
0.4706301, -1.134118, 3.549535, 1, 1, 1, 1, 1,
0.4721185, 1.099912, -1.268709, 1, 1, 1, 1, 1,
0.4761379, -0.485355, 2.027735, 1, 1, 1, 1, 1,
0.4768494, -0.002074285, 1.784861, 1, 1, 1, 1, 1,
0.4775262, 0.3154019, 1.129509, 1, 1, 1, 1, 1,
0.4782434, -2.116401, 2.328247, 1, 1, 1, 1, 1,
0.481022, 1.561492, -1.677968, 1, 1, 1, 1, 1,
0.4840762, -0.13217, 1.896408, 1, 1, 1, 1, 1,
0.4840876, -0.7376761, 2.858138, 1, 1, 1, 1, 1,
0.485208, -0.4700334, 1.318246, 0, 0, 1, 1, 1,
0.4857578, -1.505682, 4.008033, 1, 0, 0, 1, 1,
0.4886085, -1.148327, 1.014196, 1, 0, 0, 1, 1,
0.4898186, 0.00516833, 1.531014, 1, 0, 0, 1, 1,
0.4915095, 0.7932168, -0.7919411, 1, 0, 0, 1, 1,
0.4948692, 1.472594, 0.8951973, 1, 0, 0, 1, 1,
0.4969607, -1.024956, 3.449299, 0, 0, 0, 1, 1,
0.4995437, 0.5892569, 1.061029, 0, 0, 0, 1, 1,
0.510992, 0.5091519, 0.2360115, 0, 0, 0, 1, 1,
0.5149539, -0.9614909, 2.229512, 0, 0, 0, 1, 1,
0.5153843, 0.3568825, 0.4942934, 0, 0, 0, 1, 1,
0.5168274, -0.01345328, 0.5320678, 0, 0, 0, 1, 1,
0.5207742, -1.119959, 2.473341, 0, 0, 0, 1, 1,
0.5223836, 0.01615735, 2.738355, 1, 1, 1, 1, 1,
0.5300593, 0.8807222, -0.4001538, 1, 1, 1, 1, 1,
0.5346545, 0.6940432, 1.367897, 1, 1, 1, 1, 1,
0.538219, 0.6624264, 1.267897, 1, 1, 1, 1, 1,
0.5394931, -0.2192062, 1.503528, 1, 1, 1, 1, 1,
0.5399136, 1.126418, 0.06293127, 1, 1, 1, 1, 1,
0.540794, -0.3599617, 2.710733, 1, 1, 1, 1, 1,
0.5434942, 0.1462472, 1.744291, 1, 1, 1, 1, 1,
0.5475157, -1.647377, 0.2629035, 1, 1, 1, 1, 1,
0.5497219, 1.735772, 0.3876183, 1, 1, 1, 1, 1,
0.551087, 1.011971, -0.1249843, 1, 1, 1, 1, 1,
0.5574595, -0.4764359, 1.346188, 1, 1, 1, 1, 1,
0.5678294, -0.2122958, 1.047377, 1, 1, 1, 1, 1,
0.5760987, -0.9259949, 1.589836, 1, 1, 1, 1, 1,
0.5782828, 0.7679887, 1.210889, 1, 1, 1, 1, 1,
0.5805593, 0.9113878, 1.398358, 0, 0, 1, 1, 1,
0.5839854, 0.6228411, 1.587969, 1, 0, 0, 1, 1,
0.5866525, -1.475818, 3.562089, 1, 0, 0, 1, 1,
0.5873624, -0.4569755, 1.868562, 1, 0, 0, 1, 1,
0.5892157, 1.064553, -0.02104456, 1, 0, 0, 1, 1,
0.5892811, 0.8321863, 0.9792818, 1, 0, 0, 1, 1,
0.5924636, -0.8981973, 1.964338, 0, 0, 0, 1, 1,
0.5998676, 0.7761602, 0.1397155, 0, 0, 0, 1, 1,
0.6004331, -0.1410635, 1.728374, 0, 0, 0, 1, 1,
0.601413, 0.2385339, 2.846559, 0, 0, 0, 1, 1,
0.6038566, 2.416735, 0.4377603, 0, 0, 0, 1, 1,
0.604236, 1.099156, 1.515315, 0, 0, 0, 1, 1,
0.604932, 0.7825326, 1.207072, 0, 0, 0, 1, 1,
0.6167942, 1.594958, 0.8858708, 1, 1, 1, 1, 1,
0.6187969, 0.6007669, 0.8601332, 1, 1, 1, 1, 1,
0.6214101, -1.227711, 3.9033, 1, 1, 1, 1, 1,
0.6240841, -1.660313, 1.84953, 1, 1, 1, 1, 1,
0.630298, -0.7547097, 2.4586, 1, 1, 1, 1, 1,
0.6330185, 0.4421171, 1.918266, 1, 1, 1, 1, 1,
0.6331095, -0.1186688, 1.018558, 1, 1, 1, 1, 1,
0.6334043, 0.4180546, 0.1755375, 1, 1, 1, 1, 1,
0.6378432, 0.4253389, 2.178811, 1, 1, 1, 1, 1,
0.6378541, -0.03923063, 1.909856, 1, 1, 1, 1, 1,
0.639782, 0.1516517, -0.5149746, 1, 1, 1, 1, 1,
0.6416947, -0.3889121, 1.498209, 1, 1, 1, 1, 1,
0.6428401, 0.3026939, 1.320852, 1, 1, 1, 1, 1,
0.6432478, 0.531197, 0.1240877, 1, 1, 1, 1, 1,
0.6443378, 0.9062569, 0.6275782, 1, 1, 1, 1, 1,
0.6453466, 1.048799, 1.413689, 0, 0, 1, 1, 1,
0.6479291, 2.864466, -1.144374, 1, 0, 0, 1, 1,
0.6489655, 2.549633, 1.105697, 1, 0, 0, 1, 1,
0.6527698, 1.281467, -0.5400763, 1, 0, 0, 1, 1,
0.6546196, 1.757762, -0.7332554, 1, 0, 0, 1, 1,
0.6575372, 0.6799604, -0.2480411, 1, 0, 0, 1, 1,
0.6592566, 0.5035961, 1.317563, 0, 0, 0, 1, 1,
0.6596734, 0.1415988, 1.601363, 0, 0, 0, 1, 1,
0.6606977, -0.9884023, 1.309575, 0, 0, 0, 1, 1,
0.6638449, 0.6500239, -0.1799729, 0, 0, 0, 1, 1,
0.6659414, 1.024994, -0.8386628, 0, 0, 0, 1, 1,
0.6674307, -0.6102121, 2.669188, 0, 0, 0, 1, 1,
0.6699737, 0.9873167, 0.8020136, 0, 0, 0, 1, 1,
0.6703382, 0.7351117, 0.04479338, 1, 1, 1, 1, 1,
0.6803267, 0.2723624, 0.9743473, 1, 1, 1, 1, 1,
0.6806468, 0.07556342, 1.6962, 1, 1, 1, 1, 1,
0.6819489, 1.270329, 0.5140976, 1, 1, 1, 1, 1,
0.6867285, 0.4275683, 1.367258, 1, 1, 1, 1, 1,
0.686868, -0.8432775, 0.5332403, 1, 1, 1, 1, 1,
0.69493, 0.7724383, 2.029523, 1, 1, 1, 1, 1,
0.706537, 0.4168373, 0.1948307, 1, 1, 1, 1, 1,
0.7145246, -0.4658701, 1.140355, 1, 1, 1, 1, 1,
0.7215921, 0.04989378, 0.105355, 1, 1, 1, 1, 1,
0.7223018, 0.607842, 1.438665, 1, 1, 1, 1, 1,
0.7225734, -0.6646488, 3.983819, 1, 1, 1, 1, 1,
0.7239978, -2.245664, 3.164169, 1, 1, 1, 1, 1,
0.7336465, -0.4576426, 1.834835, 1, 1, 1, 1, 1,
0.7354403, 1.37665, 0.8283, 1, 1, 1, 1, 1,
0.7364066, 1.998317, 0.4343882, 0, 0, 1, 1, 1,
0.7409804, 0.5942991, 0.7136909, 1, 0, 0, 1, 1,
0.7449684, 0.4400755, 2.621465, 1, 0, 0, 1, 1,
0.747362, -0.8237144, 2.141551, 1, 0, 0, 1, 1,
0.7511541, 0.8522756, 0.6379256, 1, 0, 0, 1, 1,
0.75517, -0.5477743, 1.469887, 1, 0, 0, 1, 1,
0.7560279, 1.102233, 1.332283, 0, 0, 0, 1, 1,
0.7569173, 0.2165088, 1.756029, 0, 0, 0, 1, 1,
0.7582955, -0.0278456, 0.3180172, 0, 0, 0, 1, 1,
0.7621436, 0.245756, 1.866218, 0, 0, 0, 1, 1,
0.7669633, 1.122788, 0.04340318, 0, 0, 0, 1, 1,
0.7711607, -0.8313009, 1.270599, 0, 0, 0, 1, 1,
0.7751215, 1.043603, 1.773845, 0, 0, 0, 1, 1,
0.7793466, -0.2373766, 1.694295, 1, 1, 1, 1, 1,
0.7840418, 0.3311118, 0.7216437, 1, 1, 1, 1, 1,
0.7860932, 0.807875, 1.118313, 1, 1, 1, 1, 1,
0.7882864, -1.564094, 2.348085, 1, 1, 1, 1, 1,
0.7894946, 0.4537402, 0.9327385, 1, 1, 1, 1, 1,
0.7958346, 0.4369731, 0.8774399, 1, 1, 1, 1, 1,
0.7964649, 0.2693966, -0.7537007, 1, 1, 1, 1, 1,
0.797631, 0.8057309, -0.6106647, 1, 1, 1, 1, 1,
0.8019852, 0.5994574, 1.550943, 1, 1, 1, 1, 1,
0.8041082, -0.5182025, 2.243557, 1, 1, 1, 1, 1,
0.8090807, -0.2700253, 2.106201, 1, 1, 1, 1, 1,
0.8184358, -1.278041, 3.172902, 1, 1, 1, 1, 1,
0.8205763, -0.04692217, 2.681685, 1, 1, 1, 1, 1,
0.8214922, -0.03386036, 3.479838, 1, 1, 1, 1, 1,
0.8249549, 1.393969, 1.433936, 1, 1, 1, 1, 1,
0.8321751, 0.9450559, 1.256896, 0, 0, 1, 1, 1,
0.8356558, 0.7790845, 1.399869, 1, 0, 0, 1, 1,
0.8375837, 0.4756237, 2.514644, 1, 0, 0, 1, 1,
0.8382289, 1.036555, -0.8685517, 1, 0, 0, 1, 1,
0.8410573, -0.7138734, 2.005591, 1, 0, 0, 1, 1,
0.8457562, 1.582674, 1.699944, 1, 0, 0, 1, 1,
0.8458732, 0.4632829, 1.033168, 0, 0, 0, 1, 1,
0.8533354, -1.859793, 3.819816, 0, 0, 0, 1, 1,
0.8554265, 1.765531, -0.1906535, 0, 0, 0, 1, 1,
0.8583314, -0.758634, 2.888372, 0, 0, 0, 1, 1,
0.8585142, 1.27655, 0.3801649, 0, 0, 0, 1, 1,
0.8664634, -0.4512207, 0.2703347, 0, 0, 0, 1, 1,
0.8695296, -0.6595647, 4.237319, 0, 0, 0, 1, 1,
0.8718691, 0.9000832, 0.6905575, 1, 1, 1, 1, 1,
0.8722864, 0.7884566, 0.4171514, 1, 1, 1, 1, 1,
0.8756643, -0.6005499, 2.617165, 1, 1, 1, 1, 1,
0.8778875, -1.521972, 1.889399, 1, 1, 1, 1, 1,
0.8879847, 0.5471297, -0.6600011, 1, 1, 1, 1, 1,
0.8906315, -1.714931, 2.430868, 1, 1, 1, 1, 1,
0.8972663, -1.626857, 3.720314, 1, 1, 1, 1, 1,
0.9008337, 0.9730459, 1.802387, 1, 1, 1, 1, 1,
0.9038955, -2.108872, 3.093893, 1, 1, 1, 1, 1,
0.9135286, -1.072566, 3.121745, 1, 1, 1, 1, 1,
0.9157392, -0.4829949, 3.155672, 1, 1, 1, 1, 1,
0.9226643, 0.3335625, 0.9498426, 1, 1, 1, 1, 1,
0.9259446, 2.538379, 1.867346, 1, 1, 1, 1, 1,
0.9340701, -1.511059, 2.32855, 1, 1, 1, 1, 1,
0.9344641, 0.7161482, 1.105708, 1, 1, 1, 1, 1,
0.938751, 0.07107991, -0.006466057, 0, 0, 1, 1, 1,
0.9393212, 1.855985, 0.06219769, 1, 0, 0, 1, 1,
0.9405969, -0.4159724, 1.972928, 1, 0, 0, 1, 1,
0.9463255, 1.095246, 1.196846, 1, 0, 0, 1, 1,
0.949817, -0.3666593, 3.463681, 1, 0, 0, 1, 1,
0.9507289, -0.06280705, 1.809159, 1, 0, 0, 1, 1,
0.9633165, 0.5674877, 1.821234, 0, 0, 0, 1, 1,
0.9659609, -1.705411, 2.981686, 0, 0, 0, 1, 1,
0.9664802, -0.1480603, 2.697449, 0, 0, 0, 1, 1,
0.9699034, 1.228596, 1.088839, 0, 0, 0, 1, 1,
0.971813, -0.7254434, 0.996464, 0, 0, 0, 1, 1,
0.9721721, 0.4499745, 0.4061929, 0, 0, 0, 1, 1,
0.9785137, -0.9095328, 3.194296, 0, 0, 0, 1, 1,
0.9823273, -1.478258, 2.798158, 1, 1, 1, 1, 1,
0.9825106, 0.8263168, -0.1526761, 1, 1, 1, 1, 1,
0.9890219, -0.1364764, 1.388396, 1, 1, 1, 1, 1,
0.9918346, -0.2271432, -1.366214, 1, 1, 1, 1, 1,
0.9958766, -1.180597, 2.401294, 1, 1, 1, 1, 1,
1.000882, 0.7243087, 0.7039335, 1, 1, 1, 1, 1,
1.003351, -0.01815872, 1.313127, 1, 1, 1, 1, 1,
1.011523, 0.9115748, 2.329259, 1, 1, 1, 1, 1,
1.013378, 2.540327, 0.9487966, 1, 1, 1, 1, 1,
1.016803, 0.3822252, 0.2790945, 1, 1, 1, 1, 1,
1.018716, -0.7939599, 1.640753, 1, 1, 1, 1, 1,
1.025051, 1.223099, 3.392604, 1, 1, 1, 1, 1,
1.026505, 1.135714, 0.4805478, 1, 1, 1, 1, 1,
1.03245, 1.251637, 0.5343339, 1, 1, 1, 1, 1,
1.038372, -0.9234421, 1.983201, 1, 1, 1, 1, 1,
1.039682, 0.7447815, -1.078946, 0, 0, 1, 1, 1,
1.056287, 0.005594824, 1.632705, 1, 0, 0, 1, 1,
1.060599, -1.963708, 2.254218, 1, 0, 0, 1, 1,
1.069419, 0.1195905, 1.331796, 1, 0, 0, 1, 1,
1.072722, -1.271183, 1.520303, 1, 0, 0, 1, 1,
1.079795, 1.001098, 0.8532947, 1, 0, 0, 1, 1,
1.084605, 1.358809, 0.03074759, 0, 0, 0, 1, 1,
1.093395, -0.1665947, 2.694364, 0, 0, 0, 1, 1,
1.09618, 1.146469, 1.050317, 0, 0, 0, 1, 1,
1.096883, -0.1262941, 0.1146799, 0, 0, 0, 1, 1,
1.102168, 1.45439, 0.6289851, 0, 0, 0, 1, 1,
1.107609, -2.223463, 3.141314, 0, 0, 0, 1, 1,
1.129267, -1.058457, 2.403967, 0, 0, 0, 1, 1,
1.138805, 2.550318, 0.3608892, 1, 1, 1, 1, 1,
1.164635, -1.344418, 2.983125, 1, 1, 1, 1, 1,
1.179121, -0.4144808, 2.455191, 1, 1, 1, 1, 1,
1.185046, -0.5024562, 2.073918, 1, 1, 1, 1, 1,
1.187749, -0.3490587, 0.3995349, 1, 1, 1, 1, 1,
1.192981, 0.9372341, 1.027899, 1, 1, 1, 1, 1,
1.199007, 1.032049, 0.1534649, 1, 1, 1, 1, 1,
1.200631, 1.918538, 2.085934, 1, 1, 1, 1, 1,
1.201406, 0.7859455, 0.05899855, 1, 1, 1, 1, 1,
1.221104, 0.8011481, 1.151982, 1, 1, 1, 1, 1,
1.222297, 1.503029, 0.1281509, 1, 1, 1, 1, 1,
1.223495, -0.3043738, 0.269906, 1, 1, 1, 1, 1,
1.237629, -1.626357, 3.23128, 1, 1, 1, 1, 1,
1.242613, -1.08741, 2.362327, 1, 1, 1, 1, 1,
1.248859, -0.5433877, 2.982375, 1, 1, 1, 1, 1,
1.250864, 2.824364, 1.413023, 0, 0, 1, 1, 1,
1.266179, 0.1899792, 0.1939965, 1, 0, 0, 1, 1,
1.267736, -1.202443, 0.7900792, 1, 0, 0, 1, 1,
1.269169, 1.727368, 0.1004996, 1, 0, 0, 1, 1,
1.282631, -0.860722, -0.2259142, 1, 0, 0, 1, 1,
1.287924, 0.2616432, 0.2312421, 1, 0, 0, 1, 1,
1.288902, -0.06702504, 0.6530464, 0, 0, 0, 1, 1,
1.290861, -0.3708143, 0.9605033, 0, 0, 0, 1, 1,
1.294082, -0.1909047, 0.4999557, 0, 0, 0, 1, 1,
1.301897, 2.043304, 0.5602698, 0, 0, 0, 1, 1,
1.311761, -1.144462, 0.5985199, 0, 0, 0, 1, 1,
1.31275, 0.8205882, 1.97005, 0, 0, 0, 1, 1,
1.317866, 0.04267283, 1.24585, 0, 0, 0, 1, 1,
1.331558, -0.6221691, 1.801227, 1, 1, 1, 1, 1,
1.340423, -1.5417, 3.327353, 1, 1, 1, 1, 1,
1.340564, -0.8039474, 1.482601, 1, 1, 1, 1, 1,
1.345722, 0.4615614, 0.4283596, 1, 1, 1, 1, 1,
1.352062, -0.4500558, 3.023179, 1, 1, 1, 1, 1,
1.357513, -1.390599, 2.576969, 1, 1, 1, 1, 1,
1.364062, 0.5244415, 1.734921, 1, 1, 1, 1, 1,
1.367415, -1.325404, 3.808176, 1, 1, 1, 1, 1,
1.369932, 0.1039195, 1.094339, 1, 1, 1, 1, 1,
1.375146, -0.3335499, 1.193054, 1, 1, 1, 1, 1,
1.384994, 0.851244, 0.5711423, 1, 1, 1, 1, 1,
1.389872, -1.145855, 3.089327, 1, 1, 1, 1, 1,
1.391211, 0.8972806, 2.057634, 1, 1, 1, 1, 1,
1.41045, 1.149676, 0.3331231, 1, 1, 1, 1, 1,
1.415943, -1.491073, 0.8214637, 1, 1, 1, 1, 1,
1.419213, -0.6157133, 3.370298, 0, 0, 1, 1, 1,
1.41941, 1.365752, 0.2548866, 1, 0, 0, 1, 1,
1.422922, -1.075555, 1.329227, 1, 0, 0, 1, 1,
1.423075, 0.5636215, 2.271336, 1, 0, 0, 1, 1,
1.426761, -0.9052914, 0.4614391, 1, 0, 0, 1, 1,
1.429336, 0.0741147, 0.5976159, 1, 0, 0, 1, 1,
1.429374, -1.265033, 3.192631, 0, 0, 0, 1, 1,
1.4349, 0.5992256, 1.609833, 0, 0, 0, 1, 1,
1.448933, 1.007608, 2.971138, 0, 0, 0, 1, 1,
1.451575, 0.8354844, 0.2366987, 0, 0, 0, 1, 1,
1.451656, -0.05735067, 3.083755, 0, 0, 0, 1, 1,
1.454967, 1.292084, 2.013654, 0, 0, 0, 1, 1,
1.466216, -0.2452891, 0.3922504, 0, 0, 0, 1, 1,
1.46905, -0.1090311, 1.179886, 1, 1, 1, 1, 1,
1.480653, 0.3241764, 2.283351, 1, 1, 1, 1, 1,
1.492024, 2.290565, -0.6288595, 1, 1, 1, 1, 1,
1.496153, -0.6102965, 1.140843, 1, 1, 1, 1, 1,
1.519711, 0.4031065, -0.1830541, 1, 1, 1, 1, 1,
1.528327, 1.976013, 1.090941, 1, 1, 1, 1, 1,
1.534039, 0.4127878, 1.150741, 1, 1, 1, 1, 1,
1.543257, 0.8539671, 1.117214, 1, 1, 1, 1, 1,
1.546667, -0.1368162, 3.156904, 1, 1, 1, 1, 1,
1.550268, 0.7994497, 2.828088, 1, 1, 1, 1, 1,
1.554501, -3.617408, 3.861814, 1, 1, 1, 1, 1,
1.55654, -0.5660459, 0.3872967, 1, 1, 1, 1, 1,
1.558928, -0.1520009, 0.768394, 1, 1, 1, 1, 1,
1.582069, -1.377312, 2.97024, 1, 1, 1, 1, 1,
1.587169, 1.360098, -0.2110123, 1, 1, 1, 1, 1,
1.60038, 0.2530593, 2.886858, 0, 0, 1, 1, 1,
1.60389, -0.7965206, 2.090762, 1, 0, 0, 1, 1,
1.604466, 0.6263121, 0.08111449, 1, 0, 0, 1, 1,
1.630599, 0.1951018, 0.3715827, 1, 0, 0, 1, 1,
1.63678, -0.9725773, 2.905377, 1, 0, 0, 1, 1,
1.644219, 1.369673, 1.519232, 1, 0, 0, 1, 1,
1.651024, -0.3809538, 3.007494, 0, 0, 0, 1, 1,
1.666873, 0.5052672, 0.32577, 0, 0, 0, 1, 1,
1.689352, -1.099148, 1.274924, 0, 0, 0, 1, 1,
1.68973, -0.3487497, 1.916954, 0, 0, 0, 1, 1,
1.710555, -0.1467392, 1.020413, 0, 0, 0, 1, 1,
1.747535, -0.03539067, 1.324659, 0, 0, 0, 1, 1,
1.751745, -1.426463, 3.229378, 0, 0, 0, 1, 1,
1.770009, -0.07949169, 1.332826, 1, 1, 1, 1, 1,
1.773584, 0.5028036, 1.450981, 1, 1, 1, 1, 1,
1.802805, 0.04117109, 2.261837, 1, 1, 1, 1, 1,
1.805189, 1.486254, 1.237776, 1, 1, 1, 1, 1,
1.86064, 0.3519994, 1.602131, 1, 1, 1, 1, 1,
1.898623, 0.2786323, 1.30649, 1, 1, 1, 1, 1,
1.905548, -1.633542, 4.065224, 1, 1, 1, 1, 1,
1.908412, -1.458785, 3.283414, 1, 1, 1, 1, 1,
1.91194, 0.4638551, 0.3298192, 1, 1, 1, 1, 1,
1.928402, 0.2819391, 1.722044, 1, 1, 1, 1, 1,
1.93097, 0.05070412, 1.713934, 1, 1, 1, 1, 1,
1.965903, -1.011192, 0.3379546, 1, 1, 1, 1, 1,
1.976355, 0.04371425, 2.38412, 1, 1, 1, 1, 1,
1.983698, -1.016119, 3.238509, 1, 1, 1, 1, 1,
1.990336, -1.172702, 1.701149, 1, 1, 1, 1, 1,
1.997927, -0.1688427, 1.192315, 0, 0, 1, 1, 1,
2.005855, 0.3148384, 1.229304, 1, 0, 0, 1, 1,
2.025945, -1.098592, 1.840868, 1, 0, 0, 1, 1,
2.044103, -0.1012668, 1.533509, 1, 0, 0, 1, 1,
2.051327, -1.946103, 4.444107, 1, 0, 0, 1, 1,
2.0584, -0.12843, 1.701068, 1, 0, 0, 1, 1,
2.083167, 0.01101906, 2.467762, 0, 0, 0, 1, 1,
2.156053, 0.6291875, 1.166858, 0, 0, 0, 1, 1,
2.236367, 0.5319853, 3.389585, 0, 0, 0, 1, 1,
2.248809, -0.8587521, 1.607567, 0, 0, 0, 1, 1,
2.297114, -0.2583174, 2.416981, 0, 0, 0, 1, 1,
2.351074, 0.2658779, 2.197324, 0, 0, 0, 1, 1,
2.462359, -3.122532, 3.164019, 0, 0, 0, 1, 1,
2.479516, -0.8790301, -1.231084, 1, 1, 1, 1, 1,
2.51056, -0.008922406, 1.25045, 1, 1, 1, 1, 1,
2.569442, -0.8145782, 1.413874, 1, 1, 1, 1, 1,
2.639792, 0.9376627, 0.7948427, 1, 1, 1, 1, 1,
2.744497, 1.092588, 1.213768, 1, 1, 1, 1, 1,
2.803712, -0.8055518, 3.21105, 1, 1, 1, 1, 1,
2.94862, -0.3997133, 2.146635, 1, 1, 1, 1, 1
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
var radius = 9.560372;
var distance = 33.5804;
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
mvMatrix.translate( 0.5757734, 0.3650473, 0.4722803 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.5804);
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
