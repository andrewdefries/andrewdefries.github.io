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
-3.202825, -0.6062821, -1.982493, 1, 0, 0, 1,
-2.838685, 0.8120751, -1.35603, 1, 0.007843138, 0, 1,
-2.687909, -2.289396, -2.471311, 1, 0.01176471, 0, 1,
-2.57054, 0.1268304, -0.3334999, 1, 0.01960784, 0, 1,
-2.479139, -0.5689745, -3.080075, 1, 0.02352941, 0, 1,
-2.477343, 0.4758865, -3.686247, 1, 0.03137255, 0, 1,
-2.435137, 0.1227029, -1.276407, 1, 0.03529412, 0, 1,
-2.432055, -0.4696378, -1.320874, 1, 0.04313726, 0, 1,
-2.421737, 0.9987329, -0.09695732, 1, 0.04705882, 0, 1,
-2.398345, -0.9688284, -1.300597, 1, 0.05490196, 0, 1,
-2.390118, 0.7224357, 0.4215744, 1, 0.05882353, 0, 1,
-2.335289, -0.4151267, -1.868307, 1, 0.06666667, 0, 1,
-2.327864, 1.017643, -1.292534, 1, 0.07058824, 0, 1,
-2.326534, -0.504823, -0.2427046, 1, 0.07843138, 0, 1,
-2.323401, 1.242107, 0.3129157, 1, 0.08235294, 0, 1,
-2.281122, 0.418974, -3.422119, 1, 0.09019608, 0, 1,
-2.277135, 1.033873, -0.05225783, 1, 0.09411765, 0, 1,
-2.276891, 1.703125, -0.7456892, 1, 0.1019608, 0, 1,
-2.236017, -0.664937, -1.365891, 1, 0.1098039, 0, 1,
-2.224024, 1.853663, -1.501573, 1, 0.1137255, 0, 1,
-2.207318, 1.192321, -1.690068, 1, 0.1215686, 0, 1,
-2.184076, 0.896185, -2.824865, 1, 0.1254902, 0, 1,
-2.130745, 0.9992844, -1.82077, 1, 0.1333333, 0, 1,
-2.086892, 0.745231, -3.687267, 1, 0.1372549, 0, 1,
-2.051574, 0.6163394, -0.2024691, 1, 0.145098, 0, 1,
-2.03476, -1.232632, -2.60718, 1, 0.1490196, 0, 1,
-1.951251, -1.149103, -1.514029, 1, 0.1568628, 0, 1,
-1.942598, 1.16674, -0.6866857, 1, 0.1607843, 0, 1,
-1.937066, 1.360423, -0.6621507, 1, 0.1686275, 0, 1,
-1.922906, -0.1410103, -1.884776, 1, 0.172549, 0, 1,
-1.878726, -0.4862532, -1.542455, 1, 0.1803922, 0, 1,
-1.875329, 0.1147491, -1.322122, 1, 0.1843137, 0, 1,
-1.87202, -0.2291163, -2.573068, 1, 0.1921569, 0, 1,
-1.846693, -0.5780534, -0.8583142, 1, 0.1960784, 0, 1,
-1.84, -0.06857079, -3.936376, 1, 0.2039216, 0, 1,
-1.838522, -0.6062297, -0.8689184, 1, 0.2117647, 0, 1,
-1.801882, 0.5529194, -1.941636, 1, 0.2156863, 0, 1,
-1.797176, -0.6005911, -3.836848, 1, 0.2235294, 0, 1,
-1.794945, 0.4598522, -0.1597145, 1, 0.227451, 0, 1,
-1.78836, 1.282567, -0.1032856, 1, 0.2352941, 0, 1,
-1.780879, 0.5842203, -1.440054, 1, 0.2392157, 0, 1,
-1.765744, -0.08667644, -4.044789, 1, 0.2470588, 0, 1,
-1.744357, -0.3712376, -2.165969, 1, 0.2509804, 0, 1,
-1.737338, -0.3490006, -1.535569, 1, 0.2588235, 0, 1,
-1.7363, 1.073214, -2.630641, 1, 0.2627451, 0, 1,
-1.725224, -1.252772, -1.275767, 1, 0.2705882, 0, 1,
-1.715664, 2.056092, -1.405287, 1, 0.2745098, 0, 1,
-1.712525, 1.311561, -0.03597432, 1, 0.282353, 0, 1,
-1.693909, 0.3805944, -2.547224, 1, 0.2862745, 0, 1,
-1.69048, -0.1079481, -1.530766, 1, 0.2941177, 0, 1,
-1.68274, -1.08683, -3.337833, 1, 0.3019608, 0, 1,
-1.674276, -0.6331809, -2.419541, 1, 0.3058824, 0, 1,
-1.668198, -1.078582, -1.468281, 1, 0.3137255, 0, 1,
-1.666749, 1.396863, -2.231426, 1, 0.3176471, 0, 1,
-1.652992, -0.4384446, -2.707261, 1, 0.3254902, 0, 1,
-1.640734, 0.0524831, -0.6667341, 1, 0.3294118, 0, 1,
-1.630219, 1.485047, -1.405064, 1, 0.3372549, 0, 1,
-1.627607, 0.8829133, 0.785101, 1, 0.3411765, 0, 1,
-1.615052, 0.1119988, -1.167284, 1, 0.3490196, 0, 1,
-1.61313, -0.08072554, 0.6404203, 1, 0.3529412, 0, 1,
-1.611992, 0.6406043, -1.389223, 1, 0.3607843, 0, 1,
-1.606529, 1.761841, -1.603418, 1, 0.3647059, 0, 1,
-1.602179, -1.196329, -2.591752, 1, 0.372549, 0, 1,
-1.59778, 0.8378285, -0.5202025, 1, 0.3764706, 0, 1,
-1.597121, -0.00854501, -1.985396, 1, 0.3843137, 0, 1,
-1.596073, -0.5558844, -1.495815, 1, 0.3882353, 0, 1,
-1.57047, 0.1945363, 0.2610331, 1, 0.3960784, 0, 1,
-1.552818, 0.05990288, -1.57465, 1, 0.4039216, 0, 1,
-1.506821, 0.833564, -4.167004, 1, 0.4078431, 0, 1,
-1.496575, -0.6620404, -2.032634, 1, 0.4156863, 0, 1,
-1.487354, -0.2747311, -2.846677, 1, 0.4196078, 0, 1,
-1.464479, 0.5300305, -2.2463, 1, 0.427451, 0, 1,
-1.45743, 0.7999862, -0.318315, 1, 0.4313726, 0, 1,
-1.449766, -0.01169509, -2.600141, 1, 0.4392157, 0, 1,
-1.44272, 0.8566296, -0.2582687, 1, 0.4431373, 0, 1,
-1.434643, -0.02776969, -1.2431, 1, 0.4509804, 0, 1,
-1.428918, -0.6064893, 0.01510713, 1, 0.454902, 0, 1,
-1.427553, 0.5559389, -2.830034, 1, 0.4627451, 0, 1,
-1.397831, -0.1419261, -3.317905, 1, 0.4666667, 0, 1,
-1.390323, -0.3591037, -1.474137, 1, 0.4745098, 0, 1,
-1.386893, -0.7186701, -1.788038, 1, 0.4784314, 0, 1,
-1.382428, 1.481955, 0.7812945, 1, 0.4862745, 0, 1,
-1.379313, -0.5649489, -1.636104, 1, 0.4901961, 0, 1,
-1.365804, 0.2029414, -1.841972, 1, 0.4980392, 0, 1,
-1.361086, 0.6785861, 0.5819802, 1, 0.5058824, 0, 1,
-1.350165, 2.291403, -2.364192, 1, 0.509804, 0, 1,
-1.33086, 0.5305822, -2.266901, 1, 0.5176471, 0, 1,
-1.328866, 2.678594, -1.174342, 1, 0.5215687, 0, 1,
-1.318714, -0.06770941, -1.887613, 1, 0.5294118, 0, 1,
-1.297995, -0.4116363, -3.434733, 1, 0.5333334, 0, 1,
-1.290923, 0.3702473, 1.140161, 1, 0.5411765, 0, 1,
-1.286557, 0.385584, -1.435493, 1, 0.5450981, 0, 1,
-1.283395, 1.457379, -2.353121, 1, 0.5529412, 0, 1,
-1.283378, 0.08334062, -1.025937, 1, 0.5568628, 0, 1,
-1.281103, 0.4920249, -1.750425, 1, 0.5647059, 0, 1,
-1.280178, -0.4942557, -2.676865, 1, 0.5686275, 0, 1,
-1.279794, -0.2653746, -1.955598, 1, 0.5764706, 0, 1,
-1.278531, 0.8436219, -1.510614, 1, 0.5803922, 0, 1,
-1.278088, -0.2252497, -2.57783, 1, 0.5882353, 0, 1,
-1.275946, -1.411851, -1.315584, 1, 0.5921569, 0, 1,
-1.272228, -0.1994599, -2.721143, 1, 0.6, 0, 1,
-1.272019, -0.2999111, -2.181305, 1, 0.6078432, 0, 1,
-1.271271, -0.3907354, -2.356773, 1, 0.6117647, 0, 1,
-1.258863, 0.4283139, -0.6952024, 1, 0.6196079, 0, 1,
-1.258436, 0.886332, -0.3207149, 1, 0.6235294, 0, 1,
-1.257737, -1.343076, -0.7896422, 1, 0.6313726, 0, 1,
-1.253732, 1.718638, 0.8258901, 1, 0.6352941, 0, 1,
-1.250452, -2.250588, -1.682711, 1, 0.6431373, 0, 1,
-1.249484, 0.1988156, -2.166769, 1, 0.6470588, 0, 1,
-1.247072, 0.1934612, -1.062815, 1, 0.654902, 0, 1,
-1.242653, -1.936383, -1.709423, 1, 0.6588235, 0, 1,
-1.238379, 1.771207, -1.340876, 1, 0.6666667, 0, 1,
-1.236249, 0.4857719, -3.470651, 1, 0.6705883, 0, 1,
-1.229672, -1.440145, -2.145315, 1, 0.6784314, 0, 1,
-1.223984, -1.067239, -0.9748513, 1, 0.682353, 0, 1,
-1.218396, 1.28346, -1.263094, 1, 0.6901961, 0, 1,
-1.217404, 0.2575306, -2.568118, 1, 0.6941177, 0, 1,
-1.213338, 0.5999494, -1.603706, 1, 0.7019608, 0, 1,
-1.213062, -1.06191, -2.252193, 1, 0.7098039, 0, 1,
-1.199527, 2.429022, -0.2333606, 1, 0.7137255, 0, 1,
-1.197266, -0.1976035, -0.1342566, 1, 0.7215686, 0, 1,
-1.194576, -0.1642009, -1.22218, 1, 0.7254902, 0, 1,
-1.190275, -0.2937062, -0.5367885, 1, 0.7333333, 0, 1,
-1.180991, 1.309111, -1.440188, 1, 0.7372549, 0, 1,
-1.174562, -0.5437251, -2.114668, 1, 0.7450981, 0, 1,
-1.172128, -1.256273, -2.897428, 1, 0.7490196, 0, 1,
-1.171322, -0.3635118, -0.2348985, 1, 0.7568628, 0, 1,
-1.170959, -1.134842, -3.362215, 1, 0.7607843, 0, 1,
-1.165916, -0.06259283, -1.569835, 1, 0.7686275, 0, 1,
-1.165295, -0.4775658, -2.340861, 1, 0.772549, 0, 1,
-1.158843, -0.6001033, -3.714048, 1, 0.7803922, 0, 1,
-1.13879, 0.2826363, -1.68914, 1, 0.7843137, 0, 1,
-1.13536, 1.069239, -0.4151007, 1, 0.7921569, 0, 1,
-1.134599, 1.205536, -1.072003, 1, 0.7960784, 0, 1,
-1.122068, 0.9887383, -1.293792, 1, 0.8039216, 0, 1,
-1.113651, 0.5466889, -2.373375, 1, 0.8117647, 0, 1,
-1.107654, -1.053957, -2.342141, 1, 0.8156863, 0, 1,
-1.106753, -0.7737144, -2.409925, 1, 0.8235294, 0, 1,
-1.094502, -0.526068, -2.976638, 1, 0.827451, 0, 1,
-1.092546, -0.880547, -2.25078, 1, 0.8352941, 0, 1,
-1.079442, 0.1826072, -2.027505, 1, 0.8392157, 0, 1,
-1.079043, 0.9581435, 0.4494386, 1, 0.8470588, 0, 1,
-1.078293, -0.7919129, -0.8466146, 1, 0.8509804, 0, 1,
-1.077432, 0.08686029, -2.182074, 1, 0.8588235, 0, 1,
-1.075029, 0.8160568, 0.7128125, 1, 0.8627451, 0, 1,
-1.071455, -0.8205135, -2.215736, 1, 0.8705882, 0, 1,
-1.070805, 0.3341363, -1.065608, 1, 0.8745098, 0, 1,
-1.070264, 0.8109078, -0.5658612, 1, 0.8823529, 0, 1,
-1.066198, -0.367827, -0.6605349, 1, 0.8862745, 0, 1,
-1.063461, 0.7599047, -0.7129136, 1, 0.8941177, 0, 1,
-1.062958, 1.086558, -0.4079344, 1, 0.8980392, 0, 1,
-1.033519, 0.01631247, -1.484326, 1, 0.9058824, 0, 1,
-1.026036, 1.548962, -0.1699191, 1, 0.9137255, 0, 1,
-1.024345, 0.0314307, -1.968993, 1, 0.9176471, 0, 1,
-1.016882, -0.418649, -2.407046, 1, 0.9254902, 0, 1,
-1.016225, -0.6623864, 0.1834347, 1, 0.9294118, 0, 1,
-1.014489, -0.1972326, -2.032716, 1, 0.9372549, 0, 1,
-1.013597, 0.742147, -2.367094, 1, 0.9411765, 0, 1,
-1.011075, 2.571213, -1.16535, 1, 0.9490196, 0, 1,
-1.005113, -1.366456, -1.604695, 1, 0.9529412, 0, 1,
-1.003555, -0.2408405, -1.49769, 1, 0.9607843, 0, 1,
-0.9981084, -0.05228632, -0.1607168, 1, 0.9647059, 0, 1,
-0.988723, -1.033061, -3.794154, 1, 0.972549, 0, 1,
-0.9842726, -1.072652, -1.969626, 1, 0.9764706, 0, 1,
-0.9835687, -0.7115309, -1.708694, 1, 0.9843137, 0, 1,
-0.9781239, -0.6643522, -1.871211, 1, 0.9882353, 0, 1,
-0.9743116, -0.187398, -3.172209, 1, 0.9960784, 0, 1,
-0.9720712, -0.8241523, -2.584823, 0.9960784, 1, 0, 1,
-0.9704102, 1.260169, 2.012478, 0.9921569, 1, 0, 1,
-0.9691389, -1.397893, -1.375456, 0.9843137, 1, 0, 1,
-0.967158, -0.6966063, -2.711167, 0.9803922, 1, 0, 1,
-0.9601934, -0.01969865, -1.321263, 0.972549, 1, 0, 1,
-0.9587522, -2.255798, -1.723952, 0.9686275, 1, 0, 1,
-0.9535953, -0.09909717, -1.744696, 0.9607843, 1, 0, 1,
-0.9533306, -0.8371733, -3.309963, 0.9568627, 1, 0, 1,
-0.9502343, 0.4220039, -1.068071, 0.9490196, 1, 0, 1,
-0.9492604, 0.6287799, 0.7241008, 0.945098, 1, 0, 1,
-0.9474742, 2.462982, -0.8123904, 0.9372549, 1, 0, 1,
-0.9400939, 0.1426945, 0.120239, 0.9333333, 1, 0, 1,
-0.9317366, -1.088763, -2.705565, 0.9254902, 1, 0, 1,
-0.9200833, 1.018564, 1.014161, 0.9215686, 1, 0, 1,
-0.9168012, 0.05167383, -0.5715508, 0.9137255, 1, 0, 1,
-0.9158599, 1.085497, -1.252917, 0.9098039, 1, 0, 1,
-0.9149803, 1.141343, 0.9999631, 0.9019608, 1, 0, 1,
-0.910243, 0.774488, 0.9911088, 0.8941177, 1, 0, 1,
-0.9037495, 1.424961, -0.84741, 0.8901961, 1, 0, 1,
-0.8984499, 0.6498575, -2.285798, 0.8823529, 1, 0, 1,
-0.8917884, 0.1641816, 0.4032053, 0.8784314, 1, 0, 1,
-0.8863184, 0.4267181, -1.375985, 0.8705882, 1, 0, 1,
-0.8855572, 0.08207186, -0.8034269, 0.8666667, 1, 0, 1,
-0.8852062, 0.4247932, 0.07405656, 0.8588235, 1, 0, 1,
-0.881704, 0.06648346, -0.8037745, 0.854902, 1, 0, 1,
-0.8809789, -2.164945, -1.883325, 0.8470588, 1, 0, 1,
-0.880949, -0.1548969, -1.818633, 0.8431373, 1, 0, 1,
-0.8792003, -0.2945217, -1.195822, 0.8352941, 1, 0, 1,
-0.8724004, 1.098601, -0.175213, 0.8313726, 1, 0, 1,
-0.8670726, -0.5846629, -1.552323, 0.8235294, 1, 0, 1,
-0.8653872, -0.1852125, 0.03733641, 0.8196079, 1, 0, 1,
-0.8608699, -0.1751491, -2.401405, 0.8117647, 1, 0, 1,
-0.8575935, 0.1266593, -1.078561, 0.8078431, 1, 0, 1,
-0.8458781, 1.253963, -1.316913, 0.8, 1, 0, 1,
-0.8449941, -1.824648, -2.534198, 0.7921569, 1, 0, 1,
-0.8422386, 0.2252055, -1.456989, 0.7882353, 1, 0, 1,
-0.8345901, 0.06532934, -2.152007, 0.7803922, 1, 0, 1,
-0.8337811, 1.818332, -1.431589, 0.7764706, 1, 0, 1,
-0.8304049, 1.983704, -0.5716094, 0.7686275, 1, 0, 1,
-0.8293509, -1.751113, -3.495887, 0.7647059, 1, 0, 1,
-0.8264594, -0.3281451, -1.718058, 0.7568628, 1, 0, 1,
-0.8251198, -0.1371203, -0.8338018, 0.7529412, 1, 0, 1,
-0.8172039, 0.3627026, -0.3866182, 0.7450981, 1, 0, 1,
-0.8150677, 0.03726114, -0.3406393, 0.7411765, 1, 0, 1,
-0.8105484, -0.575543, -2.953548, 0.7333333, 1, 0, 1,
-0.7985679, 1.065848, -1.27828, 0.7294118, 1, 0, 1,
-0.7932621, 1.064857, 1.355363, 0.7215686, 1, 0, 1,
-0.7918755, -1.555459, -1.264078, 0.7176471, 1, 0, 1,
-0.7912109, 3.166321, 0.5425991, 0.7098039, 1, 0, 1,
-0.7907277, -0.4809161, -2.620072, 0.7058824, 1, 0, 1,
-0.7806717, 1.007383, -0.3193694, 0.6980392, 1, 0, 1,
-0.7797562, -0.6890501, -0.4911743, 0.6901961, 1, 0, 1,
-0.778694, -0.2095176, -1.324461, 0.6862745, 1, 0, 1,
-0.7753211, 0.05092306, -3.026231, 0.6784314, 1, 0, 1,
-0.7747896, -0.5113068, -0.5685623, 0.6745098, 1, 0, 1,
-0.7728437, -0.02256479, -3.448626, 0.6666667, 1, 0, 1,
-0.7701714, 0.7219735, -1.254668, 0.6627451, 1, 0, 1,
-0.7618183, -2.418309, -5.183713, 0.654902, 1, 0, 1,
-0.7559968, 0.8292163, 0.01964573, 0.6509804, 1, 0, 1,
-0.7507535, -1.984952, -2.186658, 0.6431373, 1, 0, 1,
-0.7502381, -0.7837368, -3.49704, 0.6392157, 1, 0, 1,
-0.745799, -0.2388509, -4.165147, 0.6313726, 1, 0, 1,
-0.7457179, -0.9299124, -1.947264, 0.627451, 1, 0, 1,
-0.7446398, -1.434169, -1.09571, 0.6196079, 1, 0, 1,
-0.7397569, 0.2749636, -0.7913364, 0.6156863, 1, 0, 1,
-0.7357021, 1.092936, -1.232418, 0.6078432, 1, 0, 1,
-0.7314323, 0.6466077, -0.08052581, 0.6039216, 1, 0, 1,
-0.7252288, -0.3371195, -3.362011, 0.5960785, 1, 0, 1,
-0.7250072, 0.03580169, -1.458842, 0.5882353, 1, 0, 1,
-0.7234432, 1.478291, 0.699592, 0.5843138, 1, 0, 1,
-0.7218796, -0.4439811, -1.050477, 0.5764706, 1, 0, 1,
-0.7213585, 1.685215, 0.8964975, 0.572549, 1, 0, 1,
-0.7187674, -0.3348396, -3.140672, 0.5647059, 1, 0, 1,
-0.7157177, -0.1329317, -1.515032, 0.5607843, 1, 0, 1,
-0.7111026, 0.4642448, -1.073517, 0.5529412, 1, 0, 1,
-0.7081193, -0.5343235, -3.08524, 0.5490196, 1, 0, 1,
-0.707978, -1.195214, -2.597837, 0.5411765, 1, 0, 1,
-0.6897978, 0.1361302, -0.6925679, 0.5372549, 1, 0, 1,
-0.6894931, 0.8974052, -0.7473269, 0.5294118, 1, 0, 1,
-0.6893243, -0.6595457, -2.269654, 0.5254902, 1, 0, 1,
-0.6844073, -0.8857002, -3.354963, 0.5176471, 1, 0, 1,
-0.6743295, -0.1640576, -2.208748, 0.5137255, 1, 0, 1,
-0.6679174, 0.01620403, -1.98939, 0.5058824, 1, 0, 1,
-0.6633309, -0.09145518, -1.81456, 0.5019608, 1, 0, 1,
-0.6629008, 1.657459, -2.15041, 0.4941176, 1, 0, 1,
-0.6469865, -0.8526365, -1.144842, 0.4862745, 1, 0, 1,
-0.6465171, -0.2925467, -2.848749, 0.4823529, 1, 0, 1,
-0.646333, -0.4401907, -1.183207, 0.4745098, 1, 0, 1,
-0.6455407, -0.7713515, -4.236424, 0.4705882, 1, 0, 1,
-0.6392404, -1.263214, -3.193677, 0.4627451, 1, 0, 1,
-0.627889, -0.3610754, -1.624274, 0.4588235, 1, 0, 1,
-0.627361, 0.9239214, 0.4661781, 0.4509804, 1, 0, 1,
-0.6268189, 0.9197373, -0.4975603, 0.4470588, 1, 0, 1,
-0.6265823, 0.07924055, -2.500189, 0.4392157, 1, 0, 1,
-0.623521, -0.8073796, -1.322946, 0.4352941, 1, 0, 1,
-0.622591, -0.1375913, -1.50391, 0.427451, 1, 0, 1,
-0.6184047, 1.717129, 0.08671764, 0.4235294, 1, 0, 1,
-0.6170154, -0.03782006, -3.045465, 0.4156863, 1, 0, 1,
-0.6109299, 0.1082214, -2.068169, 0.4117647, 1, 0, 1,
-0.6105292, 0.297105, -1.740147, 0.4039216, 1, 0, 1,
-0.6075031, 0.6662521, -0.05562142, 0.3960784, 1, 0, 1,
-0.6074322, -0.9179028, -3.307868, 0.3921569, 1, 0, 1,
-0.6040543, -0.7542079, -2.642854, 0.3843137, 1, 0, 1,
-0.602686, -1.029358, -0.6566329, 0.3803922, 1, 0, 1,
-0.6004935, -0.3257487, -2.681899, 0.372549, 1, 0, 1,
-0.5986094, -0.1996588, 0.2705448, 0.3686275, 1, 0, 1,
-0.5981367, 0.4401486, 0.696484, 0.3607843, 1, 0, 1,
-0.5952153, -0.01049138, -2.237853, 0.3568628, 1, 0, 1,
-0.5951104, -0.5063944, -3.972019, 0.3490196, 1, 0, 1,
-0.593932, 0.3615817, -0.7091226, 0.345098, 1, 0, 1,
-0.5925069, 0.8587753, 0.6657629, 0.3372549, 1, 0, 1,
-0.590324, -1.877848, -2.430899, 0.3333333, 1, 0, 1,
-0.589148, -0.5256374, -2.4345, 0.3254902, 1, 0, 1,
-0.5873967, 0.3458815, -0.6370897, 0.3215686, 1, 0, 1,
-0.5825086, 0.01040868, -0.7483421, 0.3137255, 1, 0, 1,
-0.5780746, 0.9475155, -0.7521017, 0.3098039, 1, 0, 1,
-0.5756365, 0.07065079, -0.4239701, 0.3019608, 1, 0, 1,
-0.5716398, -1.504239, -2.712822, 0.2941177, 1, 0, 1,
-0.5696337, -1.32426, -2.502842, 0.2901961, 1, 0, 1,
-0.5682171, 0.1116507, -0.7545648, 0.282353, 1, 0, 1,
-0.5677794, -1.124468, -2.224102, 0.2784314, 1, 0, 1,
-0.56668, 1.364823, 0.6238317, 0.2705882, 1, 0, 1,
-0.5644611, -1.846192, -4.037605, 0.2666667, 1, 0, 1,
-0.5635198, -0.7519102, -3.165776, 0.2588235, 1, 0, 1,
-0.5545759, 0.1236088, -0.7878131, 0.254902, 1, 0, 1,
-0.5505408, 0.3536784, -2.580135, 0.2470588, 1, 0, 1,
-0.5450917, -0.1994347, -2.905153, 0.2431373, 1, 0, 1,
-0.5450525, 2.436411, -1.867222, 0.2352941, 1, 0, 1,
-0.536799, 0.5475315, -0.6521116, 0.2313726, 1, 0, 1,
-0.5272584, -1.055398, -2.169667, 0.2235294, 1, 0, 1,
-0.5253754, 1.372186, -0.7621605, 0.2196078, 1, 0, 1,
-0.5226012, 0.1994574, -2.110515, 0.2117647, 1, 0, 1,
-0.5188831, -0.05602311, -1.843426, 0.2078431, 1, 0, 1,
-0.5164043, -0.7435447, -2.936026, 0.2, 1, 0, 1,
-0.5161844, -0.5236365, -1.374541, 0.1921569, 1, 0, 1,
-0.5129222, 0.4347205, -1.023469, 0.1882353, 1, 0, 1,
-0.5099679, 0.5183187, 0.4854841, 0.1803922, 1, 0, 1,
-0.5039461, -2.32921, -2.66402, 0.1764706, 1, 0, 1,
-0.503649, -0.7172768, -3.4783, 0.1686275, 1, 0, 1,
-0.5028472, 0.08123932, -2.026415, 0.1647059, 1, 0, 1,
-0.502278, 0.5346556, -0.3719067, 0.1568628, 1, 0, 1,
-0.4993021, -0.2802574, -1.706823, 0.1529412, 1, 0, 1,
-0.4950581, -1.19726, -1.301631, 0.145098, 1, 0, 1,
-0.4942822, 1.79988, 0.5260045, 0.1411765, 1, 0, 1,
-0.4942447, 0.813823, -0.2393119, 0.1333333, 1, 0, 1,
-0.4905236, -0.3232967, -2.200917, 0.1294118, 1, 0, 1,
-0.4865241, -0.1977668, -2.041693, 0.1215686, 1, 0, 1,
-0.4863291, 2.175243, 1.156496, 0.1176471, 1, 0, 1,
-0.485429, -0.1503836, -2.218009, 0.1098039, 1, 0, 1,
-0.4832764, -1.126448, -3.799332, 0.1058824, 1, 0, 1,
-0.4827368, -0.6113229, -2.00742, 0.09803922, 1, 0, 1,
-0.4782196, -0.6192059, -4.055056, 0.09019608, 1, 0, 1,
-0.477221, -0.4919083, -1.957703, 0.08627451, 1, 0, 1,
-0.4728489, 0.2675471, -1.165935, 0.07843138, 1, 0, 1,
-0.471822, 0.7146432, 1.996149, 0.07450981, 1, 0, 1,
-0.4670838, 0.02300264, -1.288803, 0.06666667, 1, 0, 1,
-0.4633495, 0.7953663, -0.3610734, 0.0627451, 1, 0, 1,
-0.4581134, -0.4633356, -3.093206, 0.05490196, 1, 0, 1,
-0.4559732, 1.61033, -1.298414, 0.05098039, 1, 0, 1,
-0.4523303, -0.7249022, -2.923577, 0.04313726, 1, 0, 1,
-0.4445344, 2.049066, 0.5992825, 0.03921569, 1, 0, 1,
-0.4388019, -0.2732999, -1.274669, 0.03137255, 1, 0, 1,
-0.4359631, -0.1900417, -3.705518, 0.02745098, 1, 0, 1,
-0.4330691, 0.06826219, -2.261586, 0.01960784, 1, 0, 1,
-0.4305512, 0.02995033, -0.2558197, 0.01568628, 1, 0, 1,
-0.4301295, 1.315048, -1.495184, 0.007843138, 1, 0, 1,
-0.4213375, 0.1594002, -2.41036, 0.003921569, 1, 0, 1,
-0.4206375, -1.425831, -4.157207, 0, 1, 0.003921569, 1,
-0.4167168, -0.9888867, -2.433892, 0, 1, 0.01176471, 1,
-0.4160592, -0.5608593, -2.023981, 0, 1, 0.01568628, 1,
-0.4145935, -0.3625937, -3.40692, 0, 1, 0.02352941, 1,
-0.407443, 1.335531, 0.5931358, 0, 1, 0.02745098, 1,
-0.4070138, 1.347183, -0.7530228, 0, 1, 0.03529412, 1,
-0.4069925, -0.8411255, -3.104712, 0, 1, 0.03921569, 1,
-0.4049169, -0.201776, -2.726494, 0, 1, 0.04705882, 1,
-0.4016476, -0.3392105, -3.078586, 0, 1, 0.05098039, 1,
-0.3972995, 0.06637167, -0.9801998, 0, 1, 0.05882353, 1,
-0.3954532, -0.1508046, -3.062814, 0, 1, 0.0627451, 1,
-0.3925246, 1.626694, -1.268769, 0, 1, 0.07058824, 1,
-0.3911952, -1.977216, -1.414626, 0, 1, 0.07450981, 1,
-0.3907425, 0.6403944, -2.16704, 0, 1, 0.08235294, 1,
-0.3905864, 0.9668708, 0.3271543, 0, 1, 0.08627451, 1,
-0.3881086, 0.8505613, -1.272247, 0, 1, 0.09411765, 1,
-0.3865662, -1.561833, -2.057494, 0, 1, 0.1019608, 1,
-0.3789837, -0.7373863, -1.681596, 0, 1, 0.1058824, 1,
-0.3787559, 2.562872, 0.08035765, 0, 1, 0.1137255, 1,
-0.3786656, 0.3660859, -0.8347728, 0, 1, 0.1176471, 1,
-0.3784664, 0.1235599, -0.6177648, 0, 1, 0.1254902, 1,
-0.3750599, 2.687069, -0.8732522, 0, 1, 0.1294118, 1,
-0.3732515, -0.7049316, -3.044179, 0, 1, 0.1372549, 1,
-0.3732283, 1.042626, -0.2953033, 0, 1, 0.1411765, 1,
-0.372708, -1.027937, -2.299126, 0, 1, 0.1490196, 1,
-0.3717617, 1.808385, -0.4391428, 0, 1, 0.1529412, 1,
-0.3681464, 1.334743, 1.105695, 0, 1, 0.1607843, 1,
-0.3654434, 1.656666, -0.1886467, 0, 1, 0.1647059, 1,
-0.3642489, -2.108385, -2.7666, 0, 1, 0.172549, 1,
-0.3637572, -1.382223, -4.82024, 0, 1, 0.1764706, 1,
-0.3549688, 1.074517, -0.02197153, 0, 1, 0.1843137, 1,
-0.3549547, 0.02821684, -2.510271, 0, 1, 0.1882353, 1,
-0.3502607, 1.07939, -0.6137975, 0, 1, 0.1960784, 1,
-0.3493943, -1.457215, -2.826256, 0, 1, 0.2039216, 1,
-0.3488032, 1.412021, 0.4847789, 0, 1, 0.2078431, 1,
-0.3479989, -0.593892, -1.743821, 0, 1, 0.2156863, 1,
-0.3469197, -0.2997661, -2.159099, 0, 1, 0.2196078, 1,
-0.3452192, 0.8805599, -0.05279111, 0, 1, 0.227451, 1,
-0.3427159, -0.7577679, -2.350832, 0, 1, 0.2313726, 1,
-0.3407844, -0.07618356, -2.234099, 0, 1, 0.2392157, 1,
-0.3395891, 0.3855002, 0.5517507, 0, 1, 0.2431373, 1,
-0.3392518, 0.2241808, 0.7230719, 0, 1, 0.2509804, 1,
-0.3358268, -1.393477, -3.454639, 0, 1, 0.254902, 1,
-0.3346711, 0.6876961, -1.529784, 0, 1, 0.2627451, 1,
-0.3340809, -0.7258244, -4.406306, 0, 1, 0.2666667, 1,
-0.3319698, 0.7629557, -1.377516, 0, 1, 0.2745098, 1,
-0.3268271, 0.4230202, -0.006933644, 0, 1, 0.2784314, 1,
-0.3208679, 1.196406, -0.3587747, 0, 1, 0.2862745, 1,
-0.3190989, 1.821393, -0.068437, 0, 1, 0.2901961, 1,
-0.3186407, -0.6936336, -3.238304, 0, 1, 0.2980392, 1,
-0.3163986, -0.7000955, -2.277387, 0, 1, 0.3058824, 1,
-0.3149023, -1.457491, -2.520724, 0, 1, 0.3098039, 1,
-0.3002297, -1.502644, -1.494346, 0, 1, 0.3176471, 1,
-0.2970572, -0.4286063, -2.883329, 0, 1, 0.3215686, 1,
-0.2930748, -0.1609812, -3.005806, 0, 1, 0.3294118, 1,
-0.2897973, 0.1526039, -0.4374669, 0, 1, 0.3333333, 1,
-0.2887588, 0.2014709, -0.4877974, 0, 1, 0.3411765, 1,
-0.2880623, -1.747164, -2.615722, 0, 1, 0.345098, 1,
-0.2850803, -1.014176, -2.399879, 0, 1, 0.3529412, 1,
-0.2837861, -0.126959, -1.331767, 0, 1, 0.3568628, 1,
-0.2830421, -0.5753374, -3.834644, 0, 1, 0.3647059, 1,
-0.2826233, -1.017065, -1.65402, 0, 1, 0.3686275, 1,
-0.2804225, -0.2667663, -2.762581, 0, 1, 0.3764706, 1,
-0.2788764, -0.8218665, -3.373476, 0, 1, 0.3803922, 1,
-0.2766066, 0.4122173, -1.260478, 0, 1, 0.3882353, 1,
-0.2757459, -1.608423, -2.066897, 0, 1, 0.3921569, 1,
-0.2750944, 0.7300672, 2.041486, 0, 1, 0.4, 1,
-0.2721263, 0.6152946, 0.7178649, 0, 1, 0.4078431, 1,
-0.2690837, 1.499506, -1.394006, 0, 1, 0.4117647, 1,
-0.2689476, 0.01785367, -2.036312, 0, 1, 0.4196078, 1,
-0.2656959, 2.033084, -0.4582183, 0, 1, 0.4235294, 1,
-0.2615687, -0.7773826, -2.307115, 0, 1, 0.4313726, 1,
-0.2577154, -0.6448179, -1.003209, 0, 1, 0.4352941, 1,
-0.2538547, 0.4426113, 0.4515444, 0, 1, 0.4431373, 1,
-0.2520618, 0.03995229, -0.8188866, 0, 1, 0.4470588, 1,
-0.2520135, -0.5134261, -1.881489, 0, 1, 0.454902, 1,
-0.2486831, 0.4358856, 0.7809531, 0, 1, 0.4588235, 1,
-0.2479719, 0.9612085, 1.259265, 0, 1, 0.4666667, 1,
-0.247242, 0.5543241, -0.6357762, 0, 1, 0.4705882, 1,
-0.245604, -0.4853502, -4.204177, 0, 1, 0.4784314, 1,
-0.2445282, 0.8440141, -0.7641477, 0, 1, 0.4823529, 1,
-0.2358531, -1.580572, -5.082596, 0, 1, 0.4901961, 1,
-0.2347841, 0.2189951, 0.521776, 0, 1, 0.4941176, 1,
-0.2345594, -0.1429, -3.053843, 0, 1, 0.5019608, 1,
-0.2301029, -0.2077705, -1.518375, 0, 1, 0.509804, 1,
-0.2272683, 0.6238296, 1.832853, 0, 1, 0.5137255, 1,
-0.224282, 0.8812369, -0.1780882, 0, 1, 0.5215687, 1,
-0.2223896, 0.8894489, -0.2878351, 0, 1, 0.5254902, 1,
-0.2202993, 1.38893, 0.2866462, 0, 1, 0.5333334, 1,
-0.2198818, 1.83033, -0.7451686, 0, 1, 0.5372549, 1,
-0.2190856, -2.305241, -4.368686, 0, 1, 0.5450981, 1,
-0.2186883, -0.5377674, -1.370961, 0, 1, 0.5490196, 1,
-0.2179103, -1.355186, -1.205862, 0, 1, 0.5568628, 1,
-0.2159499, -0.1484196, -4.510929, 0, 1, 0.5607843, 1,
-0.2152675, 0.02860459, -1.100268, 0, 1, 0.5686275, 1,
-0.2127783, -2.679816, -3.13783, 0, 1, 0.572549, 1,
-0.2089653, -1.274776, -1.516942, 0, 1, 0.5803922, 1,
-0.2039322, 0.9981053, 1.967659, 0, 1, 0.5843138, 1,
-0.2027968, -0.7017419, -2.379527, 0, 1, 0.5921569, 1,
-0.1958066, 0.7077695, 0.5348127, 0, 1, 0.5960785, 1,
-0.1918098, 1.143637, 0.3135733, 0, 1, 0.6039216, 1,
-0.1847209, 0.8032584, 1.157677, 0, 1, 0.6117647, 1,
-0.1846489, -2.626107, -1.924031, 0, 1, 0.6156863, 1,
-0.1838928, -0.4572895, -2.756016, 0, 1, 0.6235294, 1,
-0.1818268, -0.3105378, -4.405034, 0, 1, 0.627451, 1,
-0.1745124, 1.744432, 0.9695729, 0, 1, 0.6352941, 1,
-0.1744681, -0.07740092, -1.014171, 0, 1, 0.6392157, 1,
-0.1741996, 1.519448, -0.1747741, 0, 1, 0.6470588, 1,
-0.1729499, 0.4772799, -0.9857555, 0, 1, 0.6509804, 1,
-0.172317, -0.2128925, -1.741064, 0, 1, 0.6588235, 1,
-0.1682911, 0.2855359, -2.382605, 0, 1, 0.6627451, 1,
-0.1678406, 1.578119, 0.659174, 0, 1, 0.6705883, 1,
-0.1669663, 1.051979, 1.090406, 0, 1, 0.6745098, 1,
-0.1660405, -2.609982, -2.782912, 0, 1, 0.682353, 1,
-0.1639646, -0.5968004, -1.180493, 0, 1, 0.6862745, 1,
-0.1636748, -0.5226068, -2.476422, 0, 1, 0.6941177, 1,
-0.1598185, 1.422181, 1.24158, 0, 1, 0.7019608, 1,
-0.1591044, -0.9381152, -2.273702, 0, 1, 0.7058824, 1,
-0.1566105, -0.4880363, -3.305387, 0, 1, 0.7137255, 1,
-0.1552702, 1.005661, 1.403654, 0, 1, 0.7176471, 1,
-0.1534873, 1.372923, 1.520771, 0, 1, 0.7254902, 1,
-0.1457031, -1.711867, -3.506885, 0, 1, 0.7294118, 1,
-0.1405412, 1.664029, 0.9000347, 0, 1, 0.7372549, 1,
-0.1384037, 0.6032367, 0.3091014, 0, 1, 0.7411765, 1,
-0.1321326, -0.9478276, -3.500401, 0, 1, 0.7490196, 1,
-0.1295328, 0.1434938, -1.524442, 0, 1, 0.7529412, 1,
-0.1273821, 1.38515, 0.892855, 0, 1, 0.7607843, 1,
-0.1267602, 1.048813, -0.6795613, 0, 1, 0.7647059, 1,
-0.1250123, -0.4299083, -2.274355, 0, 1, 0.772549, 1,
-0.1234038, -1.093378, -2.538685, 0, 1, 0.7764706, 1,
-0.1200344, 0.6421311, 0.7438657, 0, 1, 0.7843137, 1,
-0.1187324, 2.289624, 0.4662716, 0, 1, 0.7882353, 1,
-0.1176923, 0.238828, 0.648455, 0, 1, 0.7960784, 1,
-0.1148698, 0.1779374, -0.8913339, 0, 1, 0.8039216, 1,
-0.1131453, 0.390159, -0.9606447, 0, 1, 0.8078431, 1,
-0.1085021, -1.230464, -1.882389, 0, 1, 0.8156863, 1,
-0.1056881, -0.7809699, -3.407365, 0, 1, 0.8196079, 1,
-0.1016926, -0.6895299, -5.311926, 0, 1, 0.827451, 1,
-0.1008373, 0.6747073, 0.8501074, 0, 1, 0.8313726, 1,
-0.1003937, 0.842386, 0.7978891, 0, 1, 0.8392157, 1,
-0.10017, -0.3469176, -2.1628, 0, 1, 0.8431373, 1,
-0.09901053, 0.6090352, 0.3340307, 0, 1, 0.8509804, 1,
-0.09616829, 0.2128434, -0.2524996, 0, 1, 0.854902, 1,
-0.09154078, -1.046255, -2.934783, 0, 1, 0.8627451, 1,
-0.09043276, 0.0240551, -0.8068377, 0, 1, 0.8666667, 1,
-0.08918423, -1.482164, -1.968052, 0, 1, 0.8745098, 1,
-0.08323276, 0.4078838, 1.40881, 0, 1, 0.8784314, 1,
-0.08159418, -0.1739894, -4.117819, 0, 1, 0.8862745, 1,
-0.07921997, -1.632145, -1.986967, 0, 1, 0.8901961, 1,
-0.07913988, -1.257028, -4.446214, 0, 1, 0.8980392, 1,
-0.07880978, -1.791957, -0.352411, 0, 1, 0.9058824, 1,
-0.07859839, -0.5151765, -4.062252, 0, 1, 0.9098039, 1,
-0.07474907, -0.2320139, -2.214182, 0, 1, 0.9176471, 1,
-0.07302009, -0.7247704, -2.98512, 0, 1, 0.9215686, 1,
-0.0708638, 0.1292763, -0.5754118, 0, 1, 0.9294118, 1,
-0.06995283, -1.221627, -3.780688, 0, 1, 0.9333333, 1,
-0.06873824, -0.3418584, -3.254989, 0, 1, 0.9411765, 1,
-0.06824845, 0.3891432, -2.103575, 0, 1, 0.945098, 1,
-0.05879112, 1.231916, 1.804941, 0, 1, 0.9529412, 1,
-0.05738788, -0.009387613, -2.812893, 0, 1, 0.9568627, 1,
-0.05086409, 1.520592, 1.456444, 0, 1, 0.9647059, 1,
-0.04862309, -0.211644, -2.681813, 0, 1, 0.9686275, 1,
-0.04794247, -0.4371054, -3.248059, 0, 1, 0.9764706, 1,
-0.0478096, -0.8256915, -0.3288592, 0, 1, 0.9803922, 1,
-0.0465301, -0.1905608, -3.172602, 0, 1, 0.9882353, 1,
-0.04483384, 0.1482287, -0.6561121, 0, 1, 0.9921569, 1,
-0.04277866, 0.9156798, -0.09673283, 0, 1, 1, 1,
-0.03914534, 1.318441, 0.4602563, 0, 0.9921569, 1, 1,
-0.03771437, -0.8957065, -3.517643, 0, 0.9882353, 1, 1,
-0.03687346, 0.001321478, -2.858714, 0, 0.9803922, 1, 1,
-0.03121587, 0.1335132, 0.4188112, 0, 0.9764706, 1, 1,
-0.02671313, 2.412585, -0.739391, 0, 0.9686275, 1, 1,
-0.02218308, -1.482263, -3.014884, 0, 0.9647059, 1, 1,
-0.01835182, -0.9935188, -3.285198, 0, 0.9568627, 1, 1,
-0.01790794, 1.205479, 0.09581158, 0, 0.9529412, 1, 1,
-0.01283438, -0.8118703, -4.361786, 0, 0.945098, 1, 1,
-0.005857654, -0.6381811, -4.125554, 0, 0.9411765, 1, 1,
-0.003314232, 0.01277185, -1.031613, 0, 0.9333333, 1, 1,
-0.002876468, -0.577054, -2.519794, 0, 0.9294118, 1, 1,
-0.0005523692, -1.080245, -4.145903, 0, 0.9215686, 1, 1,
-4.569458e-05, 2.05587, -0.2095153, 0, 0.9176471, 1, 1,
0.007320788, 2.676787, -0.08654176, 0, 0.9098039, 1, 1,
0.009823705, 2.166867, 1.199022, 0, 0.9058824, 1, 1,
0.01191769, 2.094723, -1.416901, 0, 0.8980392, 1, 1,
0.01678017, 0.4895346, -1.481257, 0, 0.8901961, 1, 1,
0.02216402, -1.31176, 0.6760382, 0, 0.8862745, 1, 1,
0.03264239, -0.1878817, 2.180909, 0, 0.8784314, 1, 1,
0.03509958, -0.6492233, 1.185172, 0, 0.8745098, 1, 1,
0.03521324, 0.6655678, -0.4356086, 0, 0.8666667, 1, 1,
0.03570619, -0.01790339, 2.681648, 0, 0.8627451, 1, 1,
0.03703314, -0.9027735, 1.98486, 0, 0.854902, 1, 1,
0.03948458, 0.3297284, 1.300023, 0, 0.8509804, 1, 1,
0.04217707, 1.171372, -1.452492, 0, 0.8431373, 1, 1,
0.04472933, -0.2903825, 3.611998, 0, 0.8392157, 1, 1,
0.04538226, -0.7958299, 2.259522, 0, 0.8313726, 1, 1,
0.0474322, 0.665054, 0.708854, 0, 0.827451, 1, 1,
0.04871448, -1.01718, 2.310566, 0, 0.8196079, 1, 1,
0.05073839, 0.9481412, -1.333728, 0, 0.8156863, 1, 1,
0.05160113, -0.1621016, 2.370389, 0, 0.8078431, 1, 1,
0.05444863, -0.07082742, 3.328882, 0, 0.8039216, 1, 1,
0.0550514, -1.253691, 2.096833, 0, 0.7960784, 1, 1,
0.05703191, 1.676798, 0.629463, 0, 0.7882353, 1, 1,
0.06137848, 0.698223, 1.299981, 0, 0.7843137, 1, 1,
0.06488445, 1.997849, -0.1104167, 0, 0.7764706, 1, 1,
0.07597126, 1.171882, 0.2620824, 0, 0.772549, 1, 1,
0.0796715, -1.179139, 2.681982, 0, 0.7647059, 1, 1,
0.08360027, 1.113133, -1.534227, 0, 0.7607843, 1, 1,
0.08373472, -1.385703, 4.032501, 0, 0.7529412, 1, 1,
0.08671184, 1.011662, 1.068016, 0, 0.7490196, 1, 1,
0.08985375, -1.54047, 1.705522, 0, 0.7411765, 1, 1,
0.09043287, -0.5461375, 2.573145, 0, 0.7372549, 1, 1,
0.09048389, -0.3728187, 2.12142, 0, 0.7294118, 1, 1,
0.09653067, -2.055493, 2.004327, 0, 0.7254902, 1, 1,
0.0991062, 0.7450073, 0.4319219, 0, 0.7176471, 1, 1,
0.1025386, -0.4980934, 4.322817, 0, 0.7137255, 1, 1,
0.1045531, 0.8354557, 1.044356, 0, 0.7058824, 1, 1,
0.1077314, -0.6125972, 2.548181, 0, 0.6980392, 1, 1,
0.111131, -0.4029441, 2.529706, 0, 0.6941177, 1, 1,
0.1112406, 0.6278247, 1.530402, 0, 0.6862745, 1, 1,
0.1139126, -0.7036673, 2.766237, 0, 0.682353, 1, 1,
0.114099, -0.6652851, 0.8683371, 0, 0.6745098, 1, 1,
0.1149102, -0.519595, 1.216902, 0, 0.6705883, 1, 1,
0.1236065, -0.2901099, 2.481526, 0, 0.6627451, 1, 1,
0.1251482, 0.07844736, 1.287416, 0, 0.6588235, 1, 1,
0.1265473, -1.952625, 3.06908, 0, 0.6509804, 1, 1,
0.1272451, -0.4957454, 3.206558, 0, 0.6470588, 1, 1,
0.1277709, 0.5166609, 0.4675329, 0, 0.6392157, 1, 1,
0.1290085, -1.92204, 4.660315, 0, 0.6352941, 1, 1,
0.1290788, 0.5126858, 0.4604607, 0, 0.627451, 1, 1,
0.1338878, -2.509568, 2.547788, 0, 0.6235294, 1, 1,
0.1350888, -0.3046246, 2.085516, 0, 0.6156863, 1, 1,
0.1355897, 0.005687042, 1.183525, 0, 0.6117647, 1, 1,
0.1368346, -0.9428115, 3.969759, 0, 0.6039216, 1, 1,
0.1472453, 0.7124386, -0.328495, 0, 0.5960785, 1, 1,
0.1479389, -0.8401767, 5.723621, 0, 0.5921569, 1, 1,
0.1554579, -0.3457451, 2.904176, 0, 0.5843138, 1, 1,
0.1572189, -0.2952358, 1.975189, 0, 0.5803922, 1, 1,
0.1575982, 0.4190319, 0.08192659, 0, 0.572549, 1, 1,
0.1583019, -0.06837403, 0.3964171, 0, 0.5686275, 1, 1,
0.1623382, -0.06644885, 3.901925, 0, 0.5607843, 1, 1,
0.1725239, -0.9715616, 4.735217, 0, 0.5568628, 1, 1,
0.1729859, -0.04606238, 3.448442, 0, 0.5490196, 1, 1,
0.1757808, -0.1616269, 3.498201, 0, 0.5450981, 1, 1,
0.1758449, 0.1826586, 0.3574449, 0, 0.5372549, 1, 1,
0.1917508, -0.5825408, 2.091539, 0, 0.5333334, 1, 1,
0.1924953, 0.3258971, -1.545707, 0, 0.5254902, 1, 1,
0.1947379, -0.149461, 3.276223, 0, 0.5215687, 1, 1,
0.1947477, 1.38196, 0.7306167, 0, 0.5137255, 1, 1,
0.194814, 1.329758, -2.078522, 0, 0.509804, 1, 1,
0.1954466, -0.1374105, 2.605515, 0, 0.5019608, 1, 1,
0.1959657, -1.40854, 3.541255, 0, 0.4941176, 1, 1,
0.197935, 0.1772501, 1.529916, 0, 0.4901961, 1, 1,
0.1993328, 0.1984569, 2.477056, 0, 0.4823529, 1, 1,
0.2036344, 0.8143446, 0.2708726, 0, 0.4784314, 1, 1,
0.2061461, -1.025341, 2.386666, 0, 0.4705882, 1, 1,
0.212642, 1.466606, 1.141767, 0, 0.4666667, 1, 1,
0.2204844, -1.50533, 2.45243, 0, 0.4588235, 1, 1,
0.2224299, 0.2961518, 0.4836205, 0, 0.454902, 1, 1,
0.2333469, 0.0275152, -0.2953562, 0, 0.4470588, 1, 1,
0.2360086, 1.828176, -0.1920916, 0, 0.4431373, 1, 1,
0.2431075, 0.8728784, -0.7029251, 0, 0.4352941, 1, 1,
0.24444, -0.1801476, 2.529037, 0, 0.4313726, 1, 1,
0.248658, 1.770681, -1.333109, 0, 0.4235294, 1, 1,
0.2546365, -0.3256605, 2.565173, 0, 0.4196078, 1, 1,
0.2581786, -0.5194061, 3.013013, 0, 0.4117647, 1, 1,
0.2585327, 0.8626028, 2.722749, 0, 0.4078431, 1, 1,
0.2619379, 0.2363139, 0.01676208, 0, 0.4, 1, 1,
0.2632115, 0.8210572, 0.7868211, 0, 0.3921569, 1, 1,
0.2634113, -1.132501, 4.918349, 0, 0.3882353, 1, 1,
0.2646044, 2.407754, 0.04318948, 0, 0.3803922, 1, 1,
0.267077, 1.495589, -0.4806086, 0, 0.3764706, 1, 1,
0.2746487, -0.1356502, 3.550108, 0, 0.3686275, 1, 1,
0.2765174, -1.213092, 3.753693, 0, 0.3647059, 1, 1,
0.2795725, -0.2966352, 2.252861, 0, 0.3568628, 1, 1,
0.2812515, 0.1559952, -0.3536671, 0, 0.3529412, 1, 1,
0.2832456, 1.100225, 1.102991, 0, 0.345098, 1, 1,
0.2839883, 0.777969, -0.00208924, 0, 0.3411765, 1, 1,
0.2841134, -0.5988844, 2.101861, 0, 0.3333333, 1, 1,
0.2856137, 1.44883, -1.060549, 0, 0.3294118, 1, 1,
0.2865036, -0.002124526, 1.234018, 0, 0.3215686, 1, 1,
0.2917643, 0.1732497, -0.3348719, 0, 0.3176471, 1, 1,
0.2947136, -0.8843179, 2.07562, 0, 0.3098039, 1, 1,
0.2947283, -1.467873, 3.489356, 0, 0.3058824, 1, 1,
0.3023981, -0.05456697, -1.263705, 0, 0.2980392, 1, 1,
0.3060109, -1.973835, 2.31792, 0, 0.2901961, 1, 1,
0.3066041, 1.314819, 2.14328, 0, 0.2862745, 1, 1,
0.3116703, 0.2570869, 0.752591, 0, 0.2784314, 1, 1,
0.312016, -1.496754, 2.212148, 0, 0.2745098, 1, 1,
0.312171, -1.397041, 3.166602, 0, 0.2666667, 1, 1,
0.312351, -0.2377611, 1.522613, 0, 0.2627451, 1, 1,
0.3136235, 0.7928737, -0.04315828, 0, 0.254902, 1, 1,
0.3188922, 0.507906, 2.730757, 0, 0.2509804, 1, 1,
0.3216719, -0.3109285, 3.169399, 0, 0.2431373, 1, 1,
0.3223948, -0.7666833, 3.384799, 0, 0.2392157, 1, 1,
0.3258941, 0.195754, 0.4138007, 0, 0.2313726, 1, 1,
0.3432079, -0.5470212, 4.118539, 0, 0.227451, 1, 1,
0.3443855, 0.8769341, 1.256836, 0, 0.2196078, 1, 1,
0.3484382, 0.5369223, 0.9427668, 0, 0.2156863, 1, 1,
0.3490532, 0.9522393, -0.1820087, 0, 0.2078431, 1, 1,
0.3506409, 0.625001, -0.1709087, 0, 0.2039216, 1, 1,
0.3517261, -0.4120693, 2.969791, 0, 0.1960784, 1, 1,
0.35438, -0.9539998, 2.119045, 0, 0.1882353, 1, 1,
0.3623172, 0.2165739, 1.410557, 0, 0.1843137, 1, 1,
0.3625548, -0.6697651, 2.409386, 0, 0.1764706, 1, 1,
0.3650479, -0.5159245, 3.666975, 0, 0.172549, 1, 1,
0.3658881, 0.9633153, 0.6495333, 0, 0.1647059, 1, 1,
0.368136, 1.488801, 1.716544, 0, 0.1607843, 1, 1,
0.3707245, -1.187873, 4.217229, 0, 0.1529412, 1, 1,
0.3730836, -1.627054, 3.140819, 0, 0.1490196, 1, 1,
0.3768405, 1.390793, -1.262555, 0, 0.1411765, 1, 1,
0.3813117, 2.723504, 0.0665378, 0, 0.1372549, 1, 1,
0.3820887, -0.7449722, 1.591112, 0, 0.1294118, 1, 1,
0.38537, -0.0376723, -0.3770866, 0, 0.1254902, 1, 1,
0.3885074, 1.392553, -0.3341178, 0, 0.1176471, 1, 1,
0.3905892, 0.5453568, 1.695593, 0, 0.1137255, 1, 1,
0.391794, -1.751598, 3.825911, 0, 0.1058824, 1, 1,
0.3930362, 2.009222, -1.044361, 0, 0.09803922, 1, 1,
0.3934769, 0.2350706, 0.1295452, 0, 0.09411765, 1, 1,
0.4000579, 0.3519267, 2.124698, 0, 0.08627451, 1, 1,
0.4045295, 1.354814, 0.3370273, 0, 0.08235294, 1, 1,
0.4106626, -0.6714126, 1.069622, 0, 0.07450981, 1, 1,
0.4247169, -1.482584, 2.888297, 0, 0.07058824, 1, 1,
0.425649, 1.573073, 0.3163242, 0, 0.0627451, 1, 1,
0.4283062, 0.3578991, 1.469819, 0, 0.05882353, 1, 1,
0.4317809, -0.02956008, 3.262295, 0, 0.05098039, 1, 1,
0.4371756, -1.068187, 4.161519, 0, 0.04705882, 1, 1,
0.4409313, -1.575965, 3.295918, 0, 0.03921569, 1, 1,
0.4423265, -0.9298301, 1.539487, 0, 0.03529412, 1, 1,
0.4444323, -1.756022, 3.563116, 0, 0.02745098, 1, 1,
0.4445047, 1.524997, 0.1358566, 0, 0.02352941, 1, 1,
0.4466561, 2.585966, -0.2486136, 0, 0.01568628, 1, 1,
0.4480849, -0.1052034, 1.821408, 0, 0.01176471, 1, 1,
0.4502619, -0.1204485, 2.128295, 0, 0.003921569, 1, 1,
0.4556745, 0.463461, 0.8696803, 0.003921569, 0, 1, 1,
0.4568508, 1.40158, 0.07829905, 0.007843138, 0, 1, 1,
0.4678106, 0.8185789, -0.9138266, 0.01568628, 0, 1, 1,
0.4681641, 0.3529561, 0.8181727, 0.01960784, 0, 1, 1,
0.4734773, -1.083522, 3.63692, 0.02745098, 0, 1, 1,
0.4786115, 0.5055957, 1.975981, 0.03137255, 0, 1, 1,
0.4802063, 0.7490702, 2.754393, 0.03921569, 0, 1, 1,
0.4852735, 0.04177355, 1.726729, 0.04313726, 0, 1, 1,
0.4858167, -0.2110942, 2.739435, 0.05098039, 0, 1, 1,
0.4891598, -0.6690096, 1.376374, 0.05490196, 0, 1, 1,
0.4898694, 0.07201211, 1.602781, 0.0627451, 0, 1, 1,
0.4919534, 0.0405163, 3.035655, 0.06666667, 0, 1, 1,
0.4924343, -0.08162989, 0.7654685, 0.07450981, 0, 1, 1,
0.4950807, -0.5787792, 2.347413, 0.07843138, 0, 1, 1,
0.4983404, 0.596945, 1.485246, 0.08627451, 0, 1, 1,
0.498753, 1.39689, 0.5596154, 0.09019608, 0, 1, 1,
0.4992958, 0.8548828, 0.7517996, 0.09803922, 0, 1, 1,
0.5014617, 0.5585945, 1.742867, 0.1058824, 0, 1, 1,
0.5025367, 0.7431616, 0.1361181, 0.1098039, 0, 1, 1,
0.5043089, 1.167727, 0.4015539, 0.1176471, 0, 1, 1,
0.5114653, 0.6555569, 1.116963, 0.1215686, 0, 1, 1,
0.5115219, -0.1468936, 2.151515, 0.1294118, 0, 1, 1,
0.5134087, 0.6318308, 0.04985341, 0.1333333, 0, 1, 1,
0.5151539, 0.1584262, 0.1040851, 0.1411765, 0, 1, 1,
0.5156885, -1.085415, 2.246541, 0.145098, 0, 1, 1,
0.5161443, 0.1807245, 2.230953, 0.1529412, 0, 1, 1,
0.5205806, -0.4012769, 0.9505166, 0.1568628, 0, 1, 1,
0.5330023, -0.7445264, 3.253816, 0.1647059, 0, 1, 1,
0.5357065, 0.1214723, 1.238356, 0.1686275, 0, 1, 1,
0.5374194, -0.7949166, 3.702563, 0.1764706, 0, 1, 1,
0.5390728, -2.189904, 2.310894, 0.1803922, 0, 1, 1,
0.5652508, 0.04323144, -0.08811507, 0.1882353, 0, 1, 1,
0.5656188, 0.08940089, 1.96288, 0.1921569, 0, 1, 1,
0.5656361, 0.6372001, 1.172589, 0.2, 0, 1, 1,
0.567508, 0.3549151, 1.054756, 0.2078431, 0, 1, 1,
0.5708625, -0.6056776, 2.320545, 0.2117647, 0, 1, 1,
0.5726134, 1.386861, -0.8672488, 0.2196078, 0, 1, 1,
0.5820844, -1.103255, 2.873576, 0.2235294, 0, 1, 1,
0.5830618, 0.07193797, -1.363975, 0.2313726, 0, 1, 1,
0.5833222, 0.4335291, 1.9589, 0.2352941, 0, 1, 1,
0.5834841, -0.6074892, 1.827523, 0.2431373, 0, 1, 1,
0.5856894, -0.1524087, 2.172133, 0.2470588, 0, 1, 1,
0.5864907, -0.5452781, 2.29318, 0.254902, 0, 1, 1,
0.5876126, 0.2921602, -0.419258, 0.2588235, 0, 1, 1,
0.5887142, -0.3687751, -0.5805682, 0.2666667, 0, 1, 1,
0.5972787, -0.9316415, 2.850807, 0.2705882, 0, 1, 1,
0.6043243, 0.3930944, 2.04107, 0.2784314, 0, 1, 1,
0.6064632, -1.659743, 3.118131, 0.282353, 0, 1, 1,
0.6070435, -0.1885005, 3.059374, 0.2901961, 0, 1, 1,
0.6073994, -1.148676, 2.63124, 0.2941177, 0, 1, 1,
0.6076018, 0.5637774, -0.1780312, 0.3019608, 0, 1, 1,
0.6132618, 0.1334769, 0.9022146, 0.3098039, 0, 1, 1,
0.6195908, 0.5734849, 2.159437, 0.3137255, 0, 1, 1,
0.621056, -0.3713317, 0.9611612, 0.3215686, 0, 1, 1,
0.6213233, -0.1353814, 1.806192, 0.3254902, 0, 1, 1,
0.621477, 1.380263, 1.449077, 0.3333333, 0, 1, 1,
0.6318027, 0.01131041, -0.9870397, 0.3372549, 0, 1, 1,
0.6323424, 1.23806, 1.199082, 0.345098, 0, 1, 1,
0.6489716, -1.455625, 4.292945, 0.3490196, 0, 1, 1,
0.6506337, -1.631526, 3.912846, 0.3568628, 0, 1, 1,
0.6520526, 0.6002074, 3.001491, 0.3607843, 0, 1, 1,
0.6546231, -0.9829558, 2.855685, 0.3686275, 0, 1, 1,
0.6622795, 1.057644, 1.923365, 0.372549, 0, 1, 1,
0.6630045, 0.06616703, 2.205894, 0.3803922, 0, 1, 1,
0.6651295, 1.119495, 0.005773427, 0.3843137, 0, 1, 1,
0.6654788, 2.115198, 1.169059, 0.3921569, 0, 1, 1,
0.6715528, -1.442018, 3.556225, 0.3960784, 0, 1, 1,
0.6767684, 1.052884, 0.07927632, 0.4039216, 0, 1, 1,
0.6795131, 0.2609056, 0.6863769, 0.4117647, 0, 1, 1,
0.6823127, -1.111264, 3.813483, 0.4156863, 0, 1, 1,
0.6840723, 0.8946914, 0.09023418, 0.4235294, 0, 1, 1,
0.6865841, 1.614193, 0.4783984, 0.427451, 0, 1, 1,
0.6920162, 0.3260932, 2.256657, 0.4352941, 0, 1, 1,
0.6983504, 0.4124666, 0.00106033, 0.4392157, 0, 1, 1,
0.7006294, 1.929076, 0.8855153, 0.4470588, 0, 1, 1,
0.7009262, -0.5055958, 1.423899, 0.4509804, 0, 1, 1,
0.7023737, -0.03440897, 1.49085, 0.4588235, 0, 1, 1,
0.7049655, -0.04616096, 3.174432, 0.4627451, 0, 1, 1,
0.7049963, -0.4274421, 3.570414, 0.4705882, 0, 1, 1,
0.7055238, 0.7015581, 0.7025028, 0.4745098, 0, 1, 1,
0.7111247, 0.4627683, 2.051093, 0.4823529, 0, 1, 1,
0.7114711, 0.586965, 1.480467, 0.4862745, 0, 1, 1,
0.7132054, 0.5048941, 1.388407, 0.4941176, 0, 1, 1,
0.7162946, -0.007711841, 2.331973, 0.5019608, 0, 1, 1,
0.7173214, 1.051217, 2.020874, 0.5058824, 0, 1, 1,
0.7266723, -0.4938651, 2.70497, 0.5137255, 0, 1, 1,
0.7267118, -0.953613, 2.143697, 0.5176471, 0, 1, 1,
0.7336591, 1.725217, 1.46305, 0.5254902, 0, 1, 1,
0.7359878, -0.6194614, 1.93908, 0.5294118, 0, 1, 1,
0.7371922, -0.1158874, 1.241693, 0.5372549, 0, 1, 1,
0.7406009, -2.748878, 1.883566, 0.5411765, 0, 1, 1,
0.7424185, 0.3619315, 1.277075, 0.5490196, 0, 1, 1,
0.7437434, -1.509729, 2.328295, 0.5529412, 0, 1, 1,
0.7457123, -0.05543685, 1.439956, 0.5607843, 0, 1, 1,
0.7472075, -0.3295155, 1.233548, 0.5647059, 0, 1, 1,
0.7482297, 0.5742077, 0.9644391, 0.572549, 0, 1, 1,
0.74901, 0.7667726, 0.08660401, 0.5764706, 0, 1, 1,
0.7547766, -0.467299, 1.413222, 0.5843138, 0, 1, 1,
0.7549701, 1.440915, -0.8290548, 0.5882353, 0, 1, 1,
0.7659928, -1.183017, 3.852428, 0.5960785, 0, 1, 1,
0.7703693, 0.1752002, 1.042885, 0.6039216, 0, 1, 1,
0.7780293, 1.407778, 0.8919058, 0.6078432, 0, 1, 1,
0.778038, 1.058483, 3.140143, 0.6156863, 0, 1, 1,
0.7808983, 0.8902973, 1.218084, 0.6196079, 0, 1, 1,
0.7931552, -1.459634, 3.305252, 0.627451, 0, 1, 1,
0.7985072, 0.7816869, 2.459695, 0.6313726, 0, 1, 1,
0.8041836, -0.5271224, 3.614187, 0.6392157, 0, 1, 1,
0.8042758, 0.3441597, 0.4007104, 0.6431373, 0, 1, 1,
0.8111246, -0.4474894, 2.847367, 0.6509804, 0, 1, 1,
0.8132364, 0.3420107, 1.008294, 0.654902, 0, 1, 1,
0.8196843, 0.5877894, 0.7625659, 0.6627451, 0, 1, 1,
0.8303378, -0.3412521, 2.119355, 0.6666667, 0, 1, 1,
0.8310732, 0.03106896, 0.9327967, 0.6745098, 0, 1, 1,
0.833909, 1.00167, 3.276616, 0.6784314, 0, 1, 1,
0.8359354, 1.405497, 1.471018, 0.6862745, 0, 1, 1,
0.8361404, 0.5621875, 0.2447083, 0.6901961, 0, 1, 1,
0.8502452, 0.3236439, 1.282424, 0.6980392, 0, 1, 1,
0.8531123, 1.868861, 0.6010427, 0.7058824, 0, 1, 1,
0.8607828, -0.950579, 2.052787, 0.7098039, 0, 1, 1,
0.861171, -0.8821502, 2.164458, 0.7176471, 0, 1, 1,
0.8669657, -0.5090883, 1.180301, 0.7215686, 0, 1, 1,
0.8747416, -0.04473522, 1.960066, 0.7294118, 0, 1, 1,
0.876092, 0.1659166, 2.757685, 0.7333333, 0, 1, 1,
0.8805758, -0.9232803, 2.919725, 0.7411765, 0, 1, 1,
0.8832836, 1.227618, -0.06956123, 0.7450981, 0, 1, 1,
0.8834175, -0.5092953, 2.174458, 0.7529412, 0, 1, 1,
0.8845181, -0.1672507, 0.06026531, 0.7568628, 0, 1, 1,
0.8932303, -1.233845, 2.600223, 0.7647059, 0, 1, 1,
0.895991, -0.1836954, 3.78856, 0.7686275, 0, 1, 1,
0.8962603, -1.265237, 2.384957, 0.7764706, 0, 1, 1,
0.9013585, -0.3455222, 3.920985, 0.7803922, 0, 1, 1,
0.9034914, -0.1744155, 2.872807, 0.7882353, 0, 1, 1,
0.9053693, 1.17278, 0.8775612, 0.7921569, 0, 1, 1,
0.9065677, -0.1831552, 0.1260537, 0.8, 0, 1, 1,
0.9107509, -0.1454794, 2.075953, 0.8078431, 0, 1, 1,
0.9199964, 0.8079997, 2.522626, 0.8117647, 0, 1, 1,
0.9210209, -0.149363, 1.145471, 0.8196079, 0, 1, 1,
0.9237583, 1.385119, 1.627858, 0.8235294, 0, 1, 1,
0.9238204, -1.193682, 2.712187, 0.8313726, 0, 1, 1,
0.9302012, -1.185994, 3.872162, 0.8352941, 0, 1, 1,
0.9334958, 0.4087743, -0.1935471, 0.8431373, 0, 1, 1,
0.934855, 0.7668024, 1.089119, 0.8470588, 0, 1, 1,
0.9358118, 1.921768, 2.433651, 0.854902, 0, 1, 1,
0.9411133, -1.042603, 2.231796, 0.8588235, 0, 1, 1,
0.9457438, -1.647424, 3.118875, 0.8666667, 0, 1, 1,
0.9507647, 1.238544, 0.504298, 0.8705882, 0, 1, 1,
0.9565023, -1.060572, 3.914497, 0.8784314, 0, 1, 1,
0.9629525, 2.231219, -0.8156173, 0.8823529, 0, 1, 1,
0.9630561, 0.1293263, 2.828651, 0.8901961, 0, 1, 1,
0.9659653, -0.558239, 2.123103, 0.8941177, 0, 1, 1,
0.9690211, 0.841725, 1.550648, 0.9019608, 0, 1, 1,
0.9712373, 0.5882918, 1.519597, 0.9098039, 0, 1, 1,
0.9719711, 0.532038, 2.422624, 0.9137255, 0, 1, 1,
0.9727041, 1.085372, -0.4909232, 0.9215686, 0, 1, 1,
0.9774002, 0.02103517, 1.593855, 0.9254902, 0, 1, 1,
0.977522, -1.011422, 3.925997, 0.9333333, 0, 1, 1,
0.978843, -1.417722, 2.213861, 0.9372549, 0, 1, 1,
0.9830024, -0.5102104, 0.7862157, 0.945098, 0, 1, 1,
0.9844064, -1.356187, 2.589841, 0.9490196, 0, 1, 1,
0.9852577, -0.1011333, 2.62636, 0.9568627, 0, 1, 1,
0.9897012, -0.6675089, 0.1563215, 0.9607843, 0, 1, 1,
0.990531, -1.293822, 2.300998, 0.9686275, 0, 1, 1,
0.9905587, -0.0985976, 1.886762, 0.972549, 0, 1, 1,
0.9983006, -0.1712298, 0.7481503, 0.9803922, 0, 1, 1,
1.005158, -0.935623, 3.218771, 0.9843137, 0, 1, 1,
1.008525, 0.6725448, 1.711012, 0.9921569, 0, 1, 1,
1.015515, -0.6291716, 2.512218, 0.9960784, 0, 1, 1,
1.017476, 1.451026, 0.2720786, 1, 0, 0.9960784, 1,
1.019144, -0.07510511, 1.518879, 1, 0, 0.9882353, 1,
1.024134, -1.467472, 1.149025, 1, 0, 0.9843137, 1,
1.024929, -1.147157, 3.288535, 1, 0, 0.9764706, 1,
1.02624, 0.2986283, 0.4270156, 1, 0, 0.972549, 1,
1.028036, 0.2491633, 1.253124, 1, 0, 0.9647059, 1,
1.02936, -0.2893004, 2.479781, 1, 0, 0.9607843, 1,
1.036895, -0.6797857, 2.673358, 1, 0, 0.9529412, 1,
1.039367, 0.7923149, 1.561208, 1, 0, 0.9490196, 1,
1.044415, -0.1953645, 3.444965, 1, 0, 0.9411765, 1,
1.049189, -0.5587904, 3.988275, 1, 0, 0.9372549, 1,
1.056484, -1.978645, 4.115675, 1, 0, 0.9294118, 1,
1.062944, 0.8836009, -0.408217, 1, 0, 0.9254902, 1,
1.069136, -0.09038921, 3.23941, 1, 0, 0.9176471, 1,
1.090712, 1.948713, 0.1174222, 1, 0, 0.9137255, 1,
1.097923, -0.2421421, 0.5673984, 1, 0, 0.9058824, 1,
1.10057, -1.589859, 3.355768, 1, 0, 0.9019608, 1,
1.10194, -2.064316, 1.365011, 1, 0, 0.8941177, 1,
1.10526, 0.9283389, 0.05919117, 1, 0, 0.8862745, 1,
1.10896, -1.901327, 4.414528, 1, 0, 0.8823529, 1,
1.112428, -1.803663, 3.056998, 1, 0, 0.8745098, 1,
1.121845, -0.7542999, 2.106429, 1, 0, 0.8705882, 1,
1.124237, -0.09287193, 1.533717, 1, 0, 0.8627451, 1,
1.13459, 0.2094779, 0.181225, 1, 0, 0.8588235, 1,
1.137815, -1.487571, 3.262178, 1, 0, 0.8509804, 1,
1.14347, 0.7683748, 1.795364, 1, 0, 0.8470588, 1,
1.143521, -1.669958, 2.14881, 1, 0, 0.8392157, 1,
1.144455, 1.816628, -0.09542771, 1, 0, 0.8352941, 1,
1.149746, 0.7398531, -0.2887259, 1, 0, 0.827451, 1,
1.149966, 0.782669, 0.5720347, 1, 0, 0.8235294, 1,
1.156046, -0.1563329, 1.533384, 1, 0, 0.8156863, 1,
1.159197, 0.8975339, 0.9007536, 1, 0, 0.8117647, 1,
1.159207, -0.1716701, 2.2541, 1, 0, 0.8039216, 1,
1.160016, 0.1666526, 1.220389, 1, 0, 0.7960784, 1,
1.165806, 0.3895324, 0.0367482, 1, 0, 0.7921569, 1,
1.179876, -0.29612, 1.745992, 1, 0, 0.7843137, 1,
1.183662, 0.9350291, 2.049184, 1, 0, 0.7803922, 1,
1.185263, -1.448557, 2.827022, 1, 0, 0.772549, 1,
1.189896, 0.09864461, -0.6856546, 1, 0, 0.7686275, 1,
1.20303, 0.9492509, 1.661578, 1, 0, 0.7607843, 1,
1.203043, 0.3355111, 1.047099, 1, 0, 0.7568628, 1,
1.204075, 0.5192872, 0.4718837, 1, 0, 0.7490196, 1,
1.245879, -0.294284, 2.786029, 1, 0, 0.7450981, 1,
1.246406, -1.095958, 1.664058, 1, 0, 0.7372549, 1,
1.271214, 0.5036398, 1.315495, 1, 0, 0.7333333, 1,
1.271426, -0.1806326, 2.174723, 1, 0, 0.7254902, 1,
1.274286, 2.323133, 1.74111, 1, 0, 0.7215686, 1,
1.278312, -0.7074634, 2.038506, 1, 0, 0.7137255, 1,
1.279657, 0.08346056, 1.84217, 1, 0, 0.7098039, 1,
1.286619, -2.185923, 0.7725307, 1, 0, 0.7019608, 1,
1.296708, 1.299439, 0.8369054, 1, 0, 0.6941177, 1,
1.30049, -0.1854152, 1.453656, 1, 0, 0.6901961, 1,
1.303832, 1.549694, 1.419305, 1, 0, 0.682353, 1,
1.310534, -1.680712, 1.571359, 1, 0, 0.6784314, 1,
1.317763, -0.8775296, 1.710807, 1, 0, 0.6705883, 1,
1.329961, -1.480727, 1.358421, 1, 0, 0.6666667, 1,
1.331331, -0.02300021, 0.8251646, 1, 0, 0.6588235, 1,
1.338474, -0.07907046, 3.287297, 1, 0, 0.654902, 1,
1.347783, 0.2180951, 0.7070581, 1, 0, 0.6470588, 1,
1.359792, 1.135263, 2.035753, 1, 0, 0.6431373, 1,
1.380778, -0.5538689, 3.016161, 1, 0, 0.6352941, 1,
1.38352, -0.2711796, 1.671384, 1, 0, 0.6313726, 1,
1.392446, -1.013795, 1.583756, 1, 0, 0.6235294, 1,
1.395216, -0.3903165, 3.124791, 1, 0, 0.6196079, 1,
1.396015, -0.3602355, 3.02838, 1, 0, 0.6117647, 1,
1.399366, -0.5555743, 0.1787921, 1, 0, 0.6078432, 1,
1.407017, 0.5057177, 1.242213, 1, 0, 0.6, 1,
1.407817, -0.3515036, -0.5889114, 1, 0, 0.5921569, 1,
1.41432, -0.1485059, 2.994492, 1, 0, 0.5882353, 1,
1.420771, -0.1963993, 2.235594, 1, 0, 0.5803922, 1,
1.423965, 0.5105706, 2.779423, 1, 0, 0.5764706, 1,
1.428826, 0.6319517, 1.428823, 1, 0, 0.5686275, 1,
1.436648, -0.4868033, 2.651889, 1, 0, 0.5647059, 1,
1.441561, 0.6250951, 0.3455616, 1, 0, 0.5568628, 1,
1.44416, 0.1281344, 1.556328, 1, 0, 0.5529412, 1,
1.445188, -0.9806893, 2.573048, 1, 0, 0.5450981, 1,
1.454435, -2.212984, 1.201297, 1, 0, 0.5411765, 1,
1.459657, 0.166103, 1.709607, 1, 0, 0.5333334, 1,
1.470254, -1.782807, 2.03813, 1, 0, 0.5294118, 1,
1.476662, -2.034273, 4.465944, 1, 0, 0.5215687, 1,
1.481369, 2.245108, 0.9747737, 1, 0, 0.5176471, 1,
1.484368, -0.4427091, 1.012174, 1, 0, 0.509804, 1,
1.490441, 1.709865, 1.59096, 1, 0, 0.5058824, 1,
1.503819, 0.8563952, 0.08312646, 1, 0, 0.4980392, 1,
1.510812, -0.254216, 2.046964, 1, 0, 0.4901961, 1,
1.514779, 1.734396, 1.195473, 1, 0, 0.4862745, 1,
1.515589, 0.3650559, 1.256024, 1, 0, 0.4784314, 1,
1.522309, -0.06038707, 1.454631, 1, 0, 0.4745098, 1,
1.538082, -1.099479, 1.163018, 1, 0, 0.4666667, 1,
1.543663, -1.204195, 2.752678, 1, 0, 0.4627451, 1,
1.545968, 0.417668, 3.439304, 1, 0, 0.454902, 1,
1.551179, -0.6161756, 2.33714, 1, 0, 0.4509804, 1,
1.564144, 1.183837, 0.4823909, 1, 0, 0.4431373, 1,
1.564267, -0.3246283, 0.1205854, 1, 0, 0.4392157, 1,
1.594407, -0.1524585, 2.430122, 1, 0, 0.4313726, 1,
1.596449, -1.827469, 2.153953, 1, 0, 0.427451, 1,
1.596786, -0.6432073, 2.533755, 1, 0, 0.4196078, 1,
1.60035, -0.5333166, 0.8526819, 1, 0, 0.4156863, 1,
1.606666, 0.02424769, 1.868466, 1, 0, 0.4078431, 1,
1.616315, 0.9700502, 0.2386954, 1, 0, 0.4039216, 1,
1.619409, 0.399395, 1.943906, 1, 0, 0.3960784, 1,
1.625693, 0.636595, -0.0510282, 1, 0, 0.3882353, 1,
1.636548, 0.2628612, 1.343745, 1, 0, 0.3843137, 1,
1.645647, 1.368584, 2.011711, 1, 0, 0.3764706, 1,
1.657053, -0.9885272, 3.191048, 1, 0, 0.372549, 1,
1.673783, 1.980897, 2.599701, 1, 0, 0.3647059, 1,
1.678853, -0.04047055, 1.475875, 1, 0, 0.3607843, 1,
1.682895, 0.5261172, -0.01452717, 1, 0, 0.3529412, 1,
1.686822, 0.4448778, 0.7754521, 1, 0, 0.3490196, 1,
1.690766, 0.8519634, 1.357219, 1, 0, 0.3411765, 1,
1.694656, -1.610232, 0.895293, 1, 0, 0.3372549, 1,
1.716034, 1.40359, 1.416477, 1, 0, 0.3294118, 1,
1.716488, -0.3217433, 1.440349, 1, 0, 0.3254902, 1,
1.722772, -0.6580529, 2.398372, 1, 0, 0.3176471, 1,
1.725116, 0.03111407, 2.323578, 1, 0, 0.3137255, 1,
1.72631, 1.491591, 1.445927, 1, 0, 0.3058824, 1,
1.726751, -0.07471779, 2.244147, 1, 0, 0.2980392, 1,
1.747539, -1.678445, 2.461898, 1, 0, 0.2941177, 1,
1.749215, 0.005399894, 1.285701, 1, 0, 0.2862745, 1,
1.756409, 1.82057, 2.689518, 1, 0, 0.282353, 1,
1.756829, -0.5952849, 1.153853, 1, 0, 0.2745098, 1,
1.760199, 0.2987735, 2.303193, 1, 0, 0.2705882, 1,
1.781942, -0.07121583, 0.3938576, 1, 0, 0.2627451, 1,
1.80599, 2.231158, 2.518774, 1, 0, 0.2588235, 1,
1.806847, -1.688573, 2.378229, 1, 0, 0.2509804, 1,
1.809811, 2.299004, -0.2086117, 1, 0, 0.2470588, 1,
1.810281, -0.3898467, 0.8242755, 1, 0, 0.2392157, 1,
1.825055, 1.2826, 0.6857147, 1, 0, 0.2352941, 1,
1.828243, -0.9833397, 1.120032, 1, 0, 0.227451, 1,
1.839393, -0.2672934, 0.5107134, 1, 0, 0.2235294, 1,
1.85529, 0.0279629, 0.2136431, 1, 0, 0.2156863, 1,
1.874435, 0.8998978, 1.326338, 1, 0, 0.2117647, 1,
1.89886, 1.755141, 0.2544766, 1, 0, 0.2039216, 1,
1.900234, -1.164385, 2.690866, 1, 0, 0.1960784, 1,
1.901207, -1.503708, 1.536808, 1, 0, 0.1921569, 1,
1.905485, 0.8618351, 0.33544, 1, 0, 0.1843137, 1,
1.90609, -0.9426939, 2.933335, 1, 0, 0.1803922, 1,
1.932046, 1.56919, 2.192765, 1, 0, 0.172549, 1,
1.935831, -0.7040069, 1.044199, 1, 0, 0.1686275, 1,
1.947898, -0.2419754, 0.801377, 1, 0, 0.1607843, 1,
1.95703, -0.5394312, 1.218617, 1, 0, 0.1568628, 1,
1.96017, 1.023905, 1.916381, 1, 0, 0.1490196, 1,
1.972258, -0.05910096, 2.025021, 1, 0, 0.145098, 1,
1.97326, -0.3736532, 1.47631, 1, 0, 0.1372549, 1,
1.991866, -0.6851473, 1.404625, 1, 0, 0.1333333, 1,
2.025748, -0.9918162, 1.814378, 1, 0, 0.1254902, 1,
2.039977, -0.4561681, 2.6518, 1, 0, 0.1215686, 1,
2.083193, 0.2116594, 2.346997, 1, 0, 0.1137255, 1,
2.089555, -0.6958098, 1.023325, 1, 0, 0.1098039, 1,
2.108212, 0.1332545, 1.002096, 1, 0, 0.1019608, 1,
2.185794, 1.722359, 1.74666, 1, 0, 0.09411765, 1,
2.2573, -0.1000631, 2.259952, 1, 0, 0.09019608, 1,
2.292693, 0.7686327, 1.308589, 1, 0, 0.08235294, 1,
2.294014, 0.2784441, 2.637811, 1, 0, 0.07843138, 1,
2.312006, -0.6109737, 3.005024, 1, 0, 0.07058824, 1,
2.328583, 0.2067289, 3.439311, 1, 0, 0.06666667, 1,
2.404005, 0.8368257, 1.77793, 1, 0, 0.05882353, 1,
2.405104, 0.71984, 0.5101434, 1, 0, 0.05490196, 1,
2.499902, -0.9546075, 0.8624049, 1, 0, 0.04705882, 1,
2.515578, -0.5144181, 1.161059, 1, 0, 0.04313726, 1,
2.531722, 0.7957098, 0.1551885, 1, 0, 0.03529412, 1,
2.540719, 0.5793079, -0.2493966, 1, 0, 0.03137255, 1,
2.551499, -0.7380673, 1.141493, 1, 0, 0.02352941, 1,
2.577962, 0.4598315, 1.427655, 1, 0, 0.01960784, 1,
2.746871, -0.2718946, 1.006066, 1, 0, 0.01176471, 1,
2.787278, -0.5244378, 1.856633, 1, 0, 0.007843138, 1
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
-0.2077733, -3.751504, -7.182451, 0, -0.5, 0.5, 0.5,
-0.2077733, -3.751504, -7.182451, 1, -0.5, 0.5, 0.5,
-0.2077733, -3.751504, -7.182451, 1, 1.5, 0.5, 0.5,
-0.2077733, -3.751504, -7.182451, 0, 1.5, 0.5, 0.5
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
-4.218147, 0.2087215, -7.182451, 0, -0.5, 0.5, 0.5,
-4.218147, 0.2087215, -7.182451, 1, -0.5, 0.5, 0.5,
-4.218147, 0.2087215, -7.182451, 1, 1.5, 0.5, 0.5,
-4.218147, 0.2087215, -7.182451, 0, 1.5, 0.5, 0.5
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
-4.218147, -3.751504, 0.2058475, 0, -0.5, 0.5, 0.5,
-4.218147, -3.751504, 0.2058475, 1, -0.5, 0.5, 0.5,
-4.218147, -3.751504, 0.2058475, 1, 1.5, 0.5, 0.5,
-4.218147, -3.751504, 0.2058475, 0, 1.5, 0.5, 0.5
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
-3, -2.837606, -5.477459,
2, -2.837606, -5.477459,
-3, -2.837606, -5.477459,
-3, -2.989922, -5.761624,
-2, -2.837606, -5.477459,
-2, -2.989922, -5.761624,
-1, -2.837606, -5.477459,
-1, -2.989922, -5.761624,
0, -2.837606, -5.477459,
0, -2.989922, -5.761624,
1, -2.837606, -5.477459,
1, -2.989922, -5.761624,
2, -2.837606, -5.477459,
2, -2.989922, -5.761624
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
-3, -3.294555, -6.329955, 0, -0.5, 0.5, 0.5,
-3, -3.294555, -6.329955, 1, -0.5, 0.5, 0.5,
-3, -3.294555, -6.329955, 1, 1.5, 0.5, 0.5,
-3, -3.294555, -6.329955, 0, 1.5, 0.5, 0.5,
-2, -3.294555, -6.329955, 0, -0.5, 0.5, 0.5,
-2, -3.294555, -6.329955, 1, -0.5, 0.5, 0.5,
-2, -3.294555, -6.329955, 1, 1.5, 0.5, 0.5,
-2, -3.294555, -6.329955, 0, 1.5, 0.5, 0.5,
-1, -3.294555, -6.329955, 0, -0.5, 0.5, 0.5,
-1, -3.294555, -6.329955, 1, -0.5, 0.5, 0.5,
-1, -3.294555, -6.329955, 1, 1.5, 0.5, 0.5,
-1, -3.294555, -6.329955, 0, 1.5, 0.5, 0.5,
0, -3.294555, -6.329955, 0, -0.5, 0.5, 0.5,
0, -3.294555, -6.329955, 1, -0.5, 0.5, 0.5,
0, -3.294555, -6.329955, 1, 1.5, 0.5, 0.5,
0, -3.294555, -6.329955, 0, 1.5, 0.5, 0.5,
1, -3.294555, -6.329955, 0, -0.5, 0.5, 0.5,
1, -3.294555, -6.329955, 1, -0.5, 0.5, 0.5,
1, -3.294555, -6.329955, 1, 1.5, 0.5, 0.5,
1, -3.294555, -6.329955, 0, 1.5, 0.5, 0.5,
2, -3.294555, -6.329955, 0, -0.5, 0.5, 0.5,
2, -3.294555, -6.329955, 1, -0.5, 0.5, 0.5,
2, -3.294555, -6.329955, 1, 1.5, 0.5, 0.5,
2, -3.294555, -6.329955, 0, 1.5, 0.5, 0.5
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
-3.292676, -2, -5.477459,
-3.292676, 3, -5.477459,
-3.292676, -2, -5.477459,
-3.446922, -2, -5.761624,
-3.292676, -1, -5.477459,
-3.446922, -1, -5.761624,
-3.292676, 0, -5.477459,
-3.446922, 0, -5.761624,
-3.292676, 1, -5.477459,
-3.446922, 1, -5.761624,
-3.292676, 2, -5.477459,
-3.446922, 2, -5.761624,
-3.292676, 3, -5.477459,
-3.446922, 3, -5.761624
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
-3.755412, -2, -6.329955, 0, -0.5, 0.5, 0.5,
-3.755412, -2, -6.329955, 1, -0.5, 0.5, 0.5,
-3.755412, -2, -6.329955, 1, 1.5, 0.5, 0.5,
-3.755412, -2, -6.329955, 0, 1.5, 0.5, 0.5,
-3.755412, -1, -6.329955, 0, -0.5, 0.5, 0.5,
-3.755412, -1, -6.329955, 1, -0.5, 0.5, 0.5,
-3.755412, -1, -6.329955, 1, 1.5, 0.5, 0.5,
-3.755412, -1, -6.329955, 0, 1.5, 0.5, 0.5,
-3.755412, 0, -6.329955, 0, -0.5, 0.5, 0.5,
-3.755412, 0, -6.329955, 1, -0.5, 0.5, 0.5,
-3.755412, 0, -6.329955, 1, 1.5, 0.5, 0.5,
-3.755412, 0, -6.329955, 0, 1.5, 0.5, 0.5,
-3.755412, 1, -6.329955, 0, -0.5, 0.5, 0.5,
-3.755412, 1, -6.329955, 1, -0.5, 0.5, 0.5,
-3.755412, 1, -6.329955, 1, 1.5, 0.5, 0.5,
-3.755412, 1, -6.329955, 0, 1.5, 0.5, 0.5,
-3.755412, 2, -6.329955, 0, -0.5, 0.5, 0.5,
-3.755412, 2, -6.329955, 1, -0.5, 0.5, 0.5,
-3.755412, 2, -6.329955, 1, 1.5, 0.5, 0.5,
-3.755412, 2, -6.329955, 0, 1.5, 0.5, 0.5,
-3.755412, 3, -6.329955, 0, -0.5, 0.5, 0.5,
-3.755412, 3, -6.329955, 1, -0.5, 0.5, 0.5,
-3.755412, 3, -6.329955, 1, 1.5, 0.5, 0.5,
-3.755412, 3, -6.329955, 0, 1.5, 0.5, 0.5
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
-3.292676, -2.837606, -4,
-3.292676, -2.837606, 4,
-3.292676, -2.837606, -4,
-3.446922, -2.989922, -4,
-3.292676, -2.837606, -2,
-3.446922, -2.989922, -2,
-3.292676, -2.837606, 0,
-3.446922, -2.989922, 0,
-3.292676, -2.837606, 2,
-3.446922, -2.989922, 2,
-3.292676, -2.837606, 4,
-3.446922, -2.989922, 4
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
-3.755412, -3.294555, -4, 0, -0.5, 0.5, 0.5,
-3.755412, -3.294555, -4, 1, -0.5, 0.5, 0.5,
-3.755412, -3.294555, -4, 1, 1.5, 0.5, 0.5,
-3.755412, -3.294555, -4, 0, 1.5, 0.5, 0.5,
-3.755412, -3.294555, -2, 0, -0.5, 0.5, 0.5,
-3.755412, -3.294555, -2, 1, -0.5, 0.5, 0.5,
-3.755412, -3.294555, -2, 1, 1.5, 0.5, 0.5,
-3.755412, -3.294555, -2, 0, 1.5, 0.5, 0.5,
-3.755412, -3.294555, 0, 0, -0.5, 0.5, 0.5,
-3.755412, -3.294555, 0, 1, -0.5, 0.5, 0.5,
-3.755412, -3.294555, 0, 1, 1.5, 0.5, 0.5,
-3.755412, -3.294555, 0, 0, 1.5, 0.5, 0.5,
-3.755412, -3.294555, 2, 0, -0.5, 0.5, 0.5,
-3.755412, -3.294555, 2, 1, -0.5, 0.5, 0.5,
-3.755412, -3.294555, 2, 1, 1.5, 0.5, 0.5,
-3.755412, -3.294555, 2, 0, 1.5, 0.5, 0.5,
-3.755412, -3.294555, 4, 0, -0.5, 0.5, 0.5,
-3.755412, -3.294555, 4, 1, -0.5, 0.5, 0.5,
-3.755412, -3.294555, 4, 1, 1.5, 0.5, 0.5,
-3.755412, -3.294555, 4, 0, 1.5, 0.5, 0.5
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
-3.292676, -2.837606, -5.477459,
-3.292676, 3.255049, -5.477459,
-3.292676, -2.837606, 5.889154,
-3.292676, 3.255049, 5.889154,
-3.292676, -2.837606, -5.477459,
-3.292676, -2.837606, 5.889154,
-3.292676, 3.255049, -5.477459,
-3.292676, 3.255049, 5.889154,
-3.292676, -2.837606, -5.477459,
2.87713, -2.837606, -5.477459,
-3.292676, -2.837606, 5.889154,
2.87713, -2.837606, 5.889154,
-3.292676, 3.255049, -5.477459,
2.87713, 3.255049, -5.477459,
-3.292676, 3.255049, 5.889154,
2.87713, 3.255049, 5.889154,
2.87713, -2.837606, -5.477459,
2.87713, 3.255049, -5.477459,
2.87713, -2.837606, 5.889154,
2.87713, 3.255049, 5.889154,
2.87713, -2.837606, -5.477459,
2.87713, -2.837606, 5.889154,
2.87713, 3.255049, -5.477459,
2.87713, 3.255049, 5.889154
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
var radius = 7.633996;
var distance = 33.96451;
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
mvMatrix.translate( 0.2077733, -0.2087215, -0.2058475 );
mvMatrix.scale( 1.33781, 1.35475, 0.7261641 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.96451);
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
triflusulfuron-methy<-read.table("triflusulfuron-methy.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triflusulfuron-methy$V2
```

```
## Error in eval(expr, envir, enclos): object 'triflusulfuron' not found
```

```r
y<-triflusulfuron-methy$V3
```

```
## Error in eval(expr, envir, enclos): object 'triflusulfuron' not found
```

```r
z<-triflusulfuron-methy$V4
```

```
## Error in eval(expr, envir, enclos): object 'triflusulfuron' not found
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
-3.202825, -0.6062821, -1.982493, 0, 0, 1, 1, 1,
-2.838685, 0.8120751, -1.35603, 1, 0, 0, 1, 1,
-2.687909, -2.289396, -2.471311, 1, 0, 0, 1, 1,
-2.57054, 0.1268304, -0.3334999, 1, 0, 0, 1, 1,
-2.479139, -0.5689745, -3.080075, 1, 0, 0, 1, 1,
-2.477343, 0.4758865, -3.686247, 1, 0, 0, 1, 1,
-2.435137, 0.1227029, -1.276407, 0, 0, 0, 1, 1,
-2.432055, -0.4696378, -1.320874, 0, 0, 0, 1, 1,
-2.421737, 0.9987329, -0.09695732, 0, 0, 0, 1, 1,
-2.398345, -0.9688284, -1.300597, 0, 0, 0, 1, 1,
-2.390118, 0.7224357, 0.4215744, 0, 0, 0, 1, 1,
-2.335289, -0.4151267, -1.868307, 0, 0, 0, 1, 1,
-2.327864, 1.017643, -1.292534, 0, 0, 0, 1, 1,
-2.326534, -0.504823, -0.2427046, 1, 1, 1, 1, 1,
-2.323401, 1.242107, 0.3129157, 1, 1, 1, 1, 1,
-2.281122, 0.418974, -3.422119, 1, 1, 1, 1, 1,
-2.277135, 1.033873, -0.05225783, 1, 1, 1, 1, 1,
-2.276891, 1.703125, -0.7456892, 1, 1, 1, 1, 1,
-2.236017, -0.664937, -1.365891, 1, 1, 1, 1, 1,
-2.224024, 1.853663, -1.501573, 1, 1, 1, 1, 1,
-2.207318, 1.192321, -1.690068, 1, 1, 1, 1, 1,
-2.184076, 0.896185, -2.824865, 1, 1, 1, 1, 1,
-2.130745, 0.9992844, -1.82077, 1, 1, 1, 1, 1,
-2.086892, 0.745231, -3.687267, 1, 1, 1, 1, 1,
-2.051574, 0.6163394, -0.2024691, 1, 1, 1, 1, 1,
-2.03476, -1.232632, -2.60718, 1, 1, 1, 1, 1,
-1.951251, -1.149103, -1.514029, 1, 1, 1, 1, 1,
-1.942598, 1.16674, -0.6866857, 1, 1, 1, 1, 1,
-1.937066, 1.360423, -0.6621507, 0, 0, 1, 1, 1,
-1.922906, -0.1410103, -1.884776, 1, 0, 0, 1, 1,
-1.878726, -0.4862532, -1.542455, 1, 0, 0, 1, 1,
-1.875329, 0.1147491, -1.322122, 1, 0, 0, 1, 1,
-1.87202, -0.2291163, -2.573068, 1, 0, 0, 1, 1,
-1.846693, -0.5780534, -0.8583142, 1, 0, 0, 1, 1,
-1.84, -0.06857079, -3.936376, 0, 0, 0, 1, 1,
-1.838522, -0.6062297, -0.8689184, 0, 0, 0, 1, 1,
-1.801882, 0.5529194, -1.941636, 0, 0, 0, 1, 1,
-1.797176, -0.6005911, -3.836848, 0, 0, 0, 1, 1,
-1.794945, 0.4598522, -0.1597145, 0, 0, 0, 1, 1,
-1.78836, 1.282567, -0.1032856, 0, 0, 0, 1, 1,
-1.780879, 0.5842203, -1.440054, 0, 0, 0, 1, 1,
-1.765744, -0.08667644, -4.044789, 1, 1, 1, 1, 1,
-1.744357, -0.3712376, -2.165969, 1, 1, 1, 1, 1,
-1.737338, -0.3490006, -1.535569, 1, 1, 1, 1, 1,
-1.7363, 1.073214, -2.630641, 1, 1, 1, 1, 1,
-1.725224, -1.252772, -1.275767, 1, 1, 1, 1, 1,
-1.715664, 2.056092, -1.405287, 1, 1, 1, 1, 1,
-1.712525, 1.311561, -0.03597432, 1, 1, 1, 1, 1,
-1.693909, 0.3805944, -2.547224, 1, 1, 1, 1, 1,
-1.69048, -0.1079481, -1.530766, 1, 1, 1, 1, 1,
-1.68274, -1.08683, -3.337833, 1, 1, 1, 1, 1,
-1.674276, -0.6331809, -2.419541, 1, 1, 1, 1, 1,
-1.668198, -1.078582, -1.468281, 1, 1, 1, 1, 1,
-1.666749, 1.396863, -2.231426, 1, 1, 1, 1, 1,
-1.652992, -0.4384446, -2.707261, 1, 1, 1, 1, 1,
-1.640734, 0.0524831, -0.6667341, 1, 1, 1, 1, 1,
-1.630219, 1.485047, -1.405064, 0, 0, 1, 1, 1,
-1.627607, 0.8829133, 0.785101, 1, 0, 0, 1, 1,
-1.615052, 0.1119988, -1.167284, 1, 0, 0, 1, 1,
-1.61313, -0.08072554, 0.6404203, 1, 0, 0, 1, 1,
-1.611992, 0.6406043, -1.389223, 1, 0, 0, 1, 1,
-1.606529, 1.761841, -1.603418, 1, 0, 0, 1, 1,
-1.602179, -1.196329, -2.591752, 0, 0, 0, 1, 1,
-1.59778, 0.8378285, -0.5202025, 0, 0, 0, 1, 1,
-1.597121, -0.00854501, -1.985396, 0, 0, 0, 1, 1,
-1.596073, -0.5558844, -1.495815, 0, 0, 0, 1, 1,
-1.57047, 0.1945363, 0.2610331, 0, 0, 0, 1, 1,
-1.552818, 0.05990288, -1.57465, 0, 0, 0, 1, 1,
-1.506821, 0.833564, -4.167004, 0, 0, 0, 1, 1,
-1.496575, -0.6620404, -2.032634, 1, 1, 1, 1, 1,
-1.487354, -0.2747311, -2.846677, 1, 1, 1, 1, 1,
-1.464479, 0.5300305, -2.2463, 1, 1, 1, 1, 1,
-1.45743, 0.7999862, -0.318315, 1, 1, 1, 1, 1,
-1.449766, -0.01169509, -2.600141, 1, 1, 1, 1, 1,
-1.44272, 0.8566296, -0.2582687, 1, 1, 1, 1, 1,
-1.434643, -0.02776969, -1.2431, 1, 1, 1, 1, 1,
-1.428918, -0.6064893, 0.01510713, 1, 1, 1, 1, 1,
-1.427553, 0.5559389, -2.830034, 1, 1, 1, 1, 1,
-1.397831, -0.1419261, -3.317905, 1, 1, 1, 1, 1,
-1.390323, -0.3591037, -1.474137, 1, 1, 1, 1, 1,
-1.386893, -0.7186701, -1.788038, 1, 1, 1, 1, 1,
-1.382428, 1.481955, 0.7812945, 1, 1, 1, 1, 1,
-1.379313, -0.5649489, -1.636104, 1, 1, 1, 1, 1,
-1.365804, 0.2029414, -1.841972, 1, 1, 1, 1, 1,
-1.361086, 0.6785861, 0.5819802, 0, 0, 1, 1, 1,
-1.350165, 2.291403, -2.364192, 1, 0, 0, 1, 1,
-1.33086, 0.5305822, -2.266901, 1, 0, 0, 1, 1,
-1.328866, 2.678594, -1.174342, 1, 0, 0, 1, 1,
-1.318714, -0.06770941, -1.887613, 1, 0, 0, 1, 1,
-1.297995, -0.4116363, -3.434733, 1, 0, 0, 1, 1,
-1.290923, 0.3702473, 1.140161, 0, 0, 0, 1, 1,
-1.286557, 0.385584, -1.435493, 0, 0, 0, 1, 1,
-1.283395, 1.457379, -2.353121, 0, 0, 0, 1, 1,
-1.283378, 0.08334062, -1.025937, 0, 0, 0, 1, 1,
-1.281103, 0.4920249, -1.750425, 0, 0, 0, 1, 1,
-1.280178, -0.4942557, -2.676865, 0, 0, 0, 1, 1,
-1.279794, -0.2653746, -1.955598, 0, 0, 0, 1, 1,
-1.278531, 0.8436219, -1.510614, 1, 1, 1, 1, 1,
-1.278088, -0.2252497, -2.57783, 1, 1, 1, 1, 1,
-1.275946, -1.411851, -1.315584, 1, 1, 1, 1, 1,
-1.272228, -0.1994599, -2.721143, 1, 1, 1, 1, 1,
-1.272019, -0.2999111, -2.181305, 1, 1, 1, 1, 1,
-1.271271, -0.3907354, -2.356773, 1, 1, 1, 1, 1,
-1.258863, 0.4283139, -0.6952024, 1, 1, 1, 1, 1,
-1.258436, 0.886332, -0.3207149, 1, 1, 1, 1, 1,
-1.257737, -1.343076, -0.7896422, 1, 1, 1, 1, 1,
-1.253732, 1.718638, 0.8258901, 1, 1, 1, 1, 1,
-1.250452, -2.250588, -1.682711, 1, 1, 1, 1, 1,
-1.249484, 0.1988156, -2.166769, 1, 1, 1, 1, 1,
-1.247072, 0.1934612, -1.062815, 1, 1, 1, 1, 1,
-1.242653, -1.936383, -1.709423, 1, 1, 1, 1, 1,
-1.238379, 1.771207, -1.340876, 1, 1, 1, 1, 1,
-1.236249, 0.4857719, -3.470651, 0, 0, 1, 1, 1,
-1.229672, -1.440145, -2.145315, 1, 0, 0, 1, 1,
-1.223984, -1.067239, -0.9748513, 1, 0, 0, 1, 1,
-1.218396, 1.28346, -1.263094, 1, 0, 0, 1, 1,
-1.217404, 0.2575306, -2.568118, 1, 0, 0, 1, 1,
-1.213338, 0.5999494, -1.603706, 1, 0, 0, 1, 1,
-1.213062, -1.06191, -2.252193, 0, 0, 0, 1, 1,
-1.199527, 2.429022, -0.2333606, 0, 0, 0, 1, 1,
-1.197266, -0.1976035, -0.1342566, 0, 0, 0, 1, 1,
-1.194576, -0.1642009, -1.22218, 0, 0, 0, 1, 1,
-1.190275, -0.2937062, -0.5367885, 0, 0, 0, 1, 1,
-1.180991, 1.309111, -1.440188, 0, 0, 0, 1, 1,
-1.174562, -0.5437251, -2.114668, 0, 0, 0, 1, 1,
-1.172128, -1.256273, -2.897428, 1, 1, 1, 1, 1,
-1.171322, -0.3635118, -0.2348985, 1, 1, 1, 1, 1,
-1.170959, -1.134842, -3.362215, 1, 1, 1, 1, 1,
-1.165916, -0.06259283, -1.569835, 1, 1, 1, 1, 1,
-1.165295, -0.4775658, -2.340861, 1, 1, 1, 1, 1,
-1.158843, -0.6001033, -3.714048, 1, 1, 1, 1, 1,
-1.13879, 0.2826363, -1.68914, 1, 1, 1, 1, 1,
-1.13536, 1.069239, -0.4151007, 1, 1, 1, 1, 1,
-1.134599, 1.205536, -1.072003, 1, 1, 1, 1, 1,
-1.122068, 0.9887383, -1.293792, 1, 1, 1, 1, 1,
-1.113651, 0.5466889, -2.373375, 1, 1, 1, 1, 1,
-1.107654, -1.053957, -2.342141, 1, 1, 1, 1, 1,
-1.106753, -0.7737144, -2.409925, 1, 1, 1, 1, 1,
-1.094502, -0.526068, -2.976638, 1, 1, 1, 1, 1,
-1.092546, -0.880547, -2.25078, 1, 1, 1, 1, 1,
-1.079442, 0.1826072, -2.027505, 0, 0, 1, 1, 1,
-1.079043, 0.9581435, 0.4494386, 1, 0, 0, 1, 1,
-1.078293, -0.7919129, -0.8466146, 1, 0, 0, 1, 1,
-1.077432, 0.08686029, -2.182074, 1, 0, 0, 1, 1,
-1.075029, 0.8160568, 0.7128125, 1, 0, 0, 1, 1,
-1.071455, -0.8205135, -2.215736, 1, 0, 0, 1, 1,
-1.070805, 0.3341363, -1.065608, 0, 0, 0, 1, 1,
-1.070264, 0.8109078, -0.5658612, 0, 0, 0, 1, 1,
-1.066198, -0.367827, -0.6605349, 0, 0, 0, 1, 1,
-1.063461, 0.7599047, -0.7129136, 0, 0, 0, 1, 1,
-1.062958, 1.086558, -0.4079344, 0, 0, 0, 1, 1,
-1.033519, 0.01631247, -1.484326, 0, 0, 0, 1, 1,
-1.026036, 1.548962, -0.1699191, 0, 0, 0, 1, 1,
-1.024345, 0.0314307, -1.968993, 1, 1, 1, 1, 1,
-1.016882, -0.418649, -2.407046, 1, 1, 1, 1, 1,
-1.016225, -0.6623864, 0.1834347, 1, 1, 1, 1, 1,
-1.014489, -0.1972326, -2.032716, 1, 1, 1, 1, 1,
-1.013597, 0.742147, -2.367094, 1, 1, 1, 1, 1,
-1.011075, 2.571213, -1.16535, 1, 1, 1, 1, 1,
-1.005113, -1.366456, -1.604695, 1, 1, 1, 1, 1,
-1.003555, -0.2408405, -1.49769, 1, 1, 1, 1, 1,
-0.9981084, -0.05228632, -0.1607168, 1, 1, 1, 1, 1,
-0.988723, -1.033061, -3.794154, 1, 1, 1, 1, 1,
-0.9842726, -1.072652, -1.969626, 1, 1, 1, 1, 1,
-0.9835687, -0.7115309, -1.708694, 1, 1, 1, 1, 1,
-0.9781239, -0.6643522, -1.871211, 1, 1, 1, 1, 1,
-0.9743116, -0.187398, -3.172209, 1, 1, 1, 1, 1,
-0.9720712, -0.8241523, -2.584823, 1, 1, 1, 1, 1,
-0.9704102, 1.260169, 2.012478, 0, 0, 1, 1, 1,
-0.9691389, -1.397893, -1.375456, 1, 0, 0, 1, 1,
-0.967158, -0.6966063, -2.711167, 1, 0, 0, 1, 1,
-0.9601934, -0.01969865, -1.321263, 1, 0, 0, 1, 1,
-0.9587522, -2.255798, -1.723952, 1, 0, 0, 1, 1,
-0.9535953, -0.09909717, -1.744696, 1, 0, 0, 1, 1,
-0.9533306, -0.8371733, -3.309963, 0, 0, 0, 1, 1,
-0.9502343, 0.4220039, -1.068071, 0, 0, 0, 1, 1,
-0.9492604, 0.6287799, 0.7241008, 0, 0, 0, 1, 1,
-0.9474742, 2.462982, -0.8123904, 0, 0, 0, 1, 1,
-0.9400939, 0.1426945, 0.120239, 0, 0, 0, 1, 1,
-0.9317366, -1.088763, -2.705565, 0, 0, 0, 1, 1,
-0.9200833, 1.018564, 1.014161, 0, 0, 0, 1, 1,
-0.9168012, 0.05167383, -0.5715508, 1, 1, 1, 1, 1,
-0.9158599, 1.085497, -1.252917, 1, 1, 1, 1, 1,
-0.9149803, 1.141343, 0.9999631, 1, 1, 1, 1, 1,
-0.910243, 0.774488, 0.9911088, 1, 1, 1, 1, 1,
-0.9037495, 1.424961, -0.84741, 1, 1, 1, 1, 1,
-0.8984499, 0.6498575, -2.285798, 1, 1, 1, 1, 1,
-0.8917884, 0.1641816, 0.4032053, 1, 1, 1, 1, 1,
-0.8863184, 0.4267181, -1.375985, 1, 1, 1, 1, 1,
-0.8855572, 0.08207186, -0.8034269, 1, 1, 1, 1, 1,
-0.8852062, 0.4247932, 0.07405656, 1, 1, 1, 1, 1,
-0.881704, 0.06648346, -0.8037745, 1, 1, 1, 1, 1,
-0.8809789, -2.164945, -1.883325, 1, 1, 1, 1, 1,
-0.880949, -0.1548969, -1.818633, 1, 1, 1, 1, 1,
-0.8792003, -0.2945217, -1.195822, 1, 1, 1, 1, 1,
-0.8724004, 1.098601, -0.175213, 1, 1, 1, 1, 1,
-0.8670726, -0.5846629, -1.552323, 0, 0, 1, 1, 1,
-0.8653872, -0.1852125, 0.03733641, 1, 0, 0, 1, 1,
-0.8608699, -0.1751491, -2.401405, 1, 0, 0, 1, 1,
-0.8575935, 0.1266593, -1.078561, 1, 0, 0, 1, 1,
-0.8458781, 1.253963, -1.316913, 1, 0, 0, 1, 1,
-0.8449941, -1.824648, -2.534198, 1, 0, 0, 1, 1,
-0.8422386, 0.2252055, -1.456989, 0, 0, 0, 1, 1,
-0.8345901, 0.06532934, -2.152007, 0, 0, 0, 1, 1,
-0.8337811, 1.818332, -1.431589, 0, 0, 0, 1, 1,
-0.8304049, 1.983704, -0.5716094, 0, 0, 0, 1, 1,
-0.8293509, -1.751113, -3.495887, 0, 0, 0, 1, 1,
-0.8264594, -0.3281451, -1.718058, 0, 0, 0, 1, 1,
-0.8251198, -0.1371203, -0.8338018, 0, 0, 0, 1, 1,
-0.8172039, 0.3627026, -0.3866182, 1, 1, 1, 1, 1,
-0.8150677, 0.03726114, -0.3406393, 1, 1, 1, 1, 1,
-0.8105484, -0.575543, -2.953548, 1, 1, 1, 1, 1,
-0.7985679, 1.065848, -1.27828, 1, 1, 1, 1, 1,
-0.7932621, 1.064857, 1.355363, 1, 1, 1, 1, 1,
-0.7918755, -1.555459, -1.264078, 1, 1, 1, 1, 1,
-0.7912109, 3.166321, 0.5425991, 1, 1, 1, 1, 1,
-0.7907277, -0.4809161, -2.620072, 1, 1, 1, 1, 1,
-0.7806717, 1.007383, -0.3193694, 1, 1, 1, 1, 1,
-0.7797562, -0.6890501, -0.4911743, 1, 1, 1, 1, 1,
-0.778694, -0.2095176, -1.324461, 1, 1, 1, 1, 1,
-0.7753211, 0.05092306, -3.026231, 1, 1, 1, 1, 1,
-0.7747896, -0.5113068, -0.5685623, 1, 1, 1, 1, 1,
-0.7728437, -0.02256479, -3.448626, 1, 1, 1, 1, 1,
-0.7701714, 0.7219735, -1.254668, 1, 1, 1, 1, 1,
-0.7618183, -2.418309, -5.183713, 0, 0, 1, 1, 1,
-0.7559968, 0.8292163, 0.01964573, 1, 0, 0, 1, 1,
-0.7507535, -1.984952, -2.186658, 1, 0, 0, 1, 1,
-0.7502381, -0.7837368, -3.49704, 1, 0, 0, 1, 1,
-0.745799, -0.2388509, -4.165147, 1, 0, 0, 1, 1,
-0.7457179, -0.9299124, -1.947264, 1, 0, 0, 1, 1,
-0.7446398, -1.434169, -1.09571, 0, 0, 0, 1, 1,
-0.7397569, 0.2749636, -0.7913364, 0, 0, 0, 1, 1,
-0.7357021, 1.092936, -1.232418, 0, 0, 0, 1, 1,
-0.7314323, 0.6466077, -0.08052581, 0, 0, 0, 1, 1,
-0.7252288, -0.3371195, -3.362011, 0, 0, 0, 1, 1,
-0.7250072, 0.03580169, -1.458842, 0, 0, 0, 1, 1,
-0.7234432, 1.478291, 0.699592, 0, 0, 0, 1, 1,
-0.7218796, -0.4439811, -1.050477, 1, 1, 1, 1, 1,
-0.7213585, 1.685215, 0.8964975, 1, 1, 1, 1, 1,
-0.7187674, -0.3348396, -3.140672, 1, 1, 1, 1, 1,
-0.7157177, -0.1329317, -1.515032, 1, 1, 1, 1, 1,
-0.7111026, 0.4642448, -1.073517, 1, 1, 1, 1, 1,
-0.7081193, -0.5343235, -3.08524, 1, 1, 1, 1, 1,
-0.707978, -1.195214, -2.597837, 1, 1, 1, 1, 1,
-0.6897978, 0.1361302, -0.6925679, 1, 1, 1, 1, 1,
-0.6894931, 0.8974052, -0.7473269, 1, 1, 1, 1, 1,
-0.6893243, -0.6595457, -2.269654, 1, 1, 1, 1, 1,
-0.6844073, -0.8857002, -3.354963, 1, 1, 1, 1, 1,
-0.6743295, -0.1640576, -2.208748, 1, 1, 1, 1, 1,
-0.6679174, 0.01620403, -1.98939, 1, 1, 1, 1, 1,
-0.6633309, -0.09145518, -1.81456, 1, 1, 1, 1, 1,
-0.6629008, 1.657459, -2.15041, 1, 1, 1, 1, 1,
-0.6469865, -0.8526365, -1.144842, 0, 0, 1, 1, 1,
-0.6465171, -0.2925467, -2.848749, 1, 0, 0, 1, 1,
-0.646333, -0.4401907, -1.183207, 1, 0, 0, 1, 1,
-0.6455407, -0.7713515, -4.236424, 1, 0, 0, 1, 1,
-0.6392404, -1.263214, -3.193677, 1, 0, 0, 1, 1,
-0.627889, -0.3610754, -1.624274, 1, 0, 0, 1, 1,
-0.627361, 0.9239214, 0.4661781, 0, 0, 0, 1, 1,
-0.6268189, 0.9197373, -0.4975603, 0, 0, 0, 1, 1,
-0.6265823, 0.07924055, -2.500189, 0, 0, 0, 1, 1,
-0.623521, -0.8073796, -1.322946, 0, 0, 0, 1, 1,
-0.622591, -0.1375913, -1.50391, 0, 0, 0, 1, 1,
-0.6184047, 1.717129, 0.08671764, 0, 0, 0, 1, 1,
-0.6170154, -0.03782006, -3.045465, 0, 0, 0, 1, 1,
-0.6109299, 0.1082214, -2.068169, 1, 1, 1, 1, 1,
-0.6105292, 0.297105, -1.740147, 1, 1, 1, 1, 1,
-0.6075031, 0.6662521, -0.05562142, 1, 1, 1, 1, 1,
-0.6074322, -0.9179028, -3.307868, 1, 1, 1, 1, 1,
-0.6040543, -0.7542079, -2.642854, 1, 1, 1, 1, 1,
-0.602686, -1.029358, -0.6566329, 1, 1, 1, 1, 1,
-0.6004935, -0.3257487, -2.681899, 1, 1, 1, 1, 1,
-0.5986094, -0.1996588, 0.2705448, 1, 1, 1, 1, 1,
-0.5981367, 0.4401486, 0.696484, 1, 1, 1, 1, 1,
-0.5952153, -0.01049138, -2.237853, 1, 1, 1, 1, 1,
-0.5951104, -0.5063944, -3.972019, 1, 1, 1, 1, 1,
-0.593932, 0.3615817, -0.7091226, 1, 1, 1, 1, 1,
-0.5925069, 0.8587753, 0.6657629, 1, 1, 1, 1, 1,
-0.590324, -1.877848, -2.430899, 1, 1, 1, 1, 1,
-0.589148, -0.5256374, -2.4345, 1, 1, 1, 1, 1,
-0.5873967, 0.3458815, -0.6370897, 0, 0, 1, 1, 1,
-0.5825086, 0.01040868, -0.7483421, 1, 0, 0, 1, 1,
-0.5780746, 0.9475155, -0.7521017, 1, 0, 0, 1, 1,
-0.5756365, 0.07065079, -0.4239701, 1, 0, 0, 1, 1,
-0.5716398, -1.504239, -2.712822, 1, 0, 0, 1, 1,
-0.5696337, -1.32426, -2.502842, 1, 0, 0, 1, 1,
-0.5682171, 0.1116507, -0.7545648, 0, 0, 0, 1, 1,
-0.5677794, -1.124468, -2.224102, 0, 0, 0, 1, 1,
-0.56668, 1.364823, 0.6238317, 0, 0, 0, 1, 1,
-0.5644611, -1.846192, -4.037605, 0, 0, 0, 1, 1,
-0.5635198, -0.7519102, -3.165776, 0, 0, 0, 1, 1,
-0.5545759, 0.1236088, -0.7878131, 0, 0, 0, 1, 1,
-0.5505408, 0.3536784, -2.580135, 0, 0, 0, 1, 1,
-0.5450917, -0.1994347, -2.905153, 1, 1, 1, 1, 1,
-0.5450525, 2.436411, -1.867222, 1, 1, 1, 1, 1,
-0.536799, 0.5475315, -0.6521116, 1, 1, 1, 1, 1,
-0.5272584, -1.055398, -2.169667, 1, 1, 1, 1, 1,
-0.5253754, 1.372186, -0.7621605, 1, 1, 1, 1, 1,
-0.5226012, 0.1994574, -2.110515, 1, 1, 1, 1, 1,
-0.5188831, -0.05602311, -1.843426, 1, 1, 1, 1, 1,
-0.5164043, -0.7435447, -2.936026, 1, 1, 1, 1, 1,
-0.5161844, -0.5236365, -1.374541, 1, 1, 1, 1, 1,
-0.5129222, 0.4347205, -1.023469, 1, 1, 1, 1, 1,
-0.5099679, 0.5183187, 0.4854841, 1, 1, 1, 1, 1,
-0.5039461, -2.32921, -2.66402, 1, 1, 1, 1, 1,
-0.503649, -0.7172768, -3.4783, 1, 1, 1, 1, 1,
-0.5028472, 0.08123932, -2.026415, 1, 1, 1, 1, 1,
-0.502278, 0.5346556, -0.3719067, 1, 1, 1, 1, 1,
-0.4993021, -0.2802574, -1.706823, 0, 0, 1, 1, 1,
-0.4950581, -1.19726, -1.301631, 1, 0, 0, 1, 1,
-0.4942822, 1.79988, 0.5260045, 1, 0, 0, 1, 1,
-0.4942447, 0.813823, -0.2393119, 1, 0, 0, 1, 1,
-0.4905236, -0.3232967, -2.200917, 1, 0, 0, 1, 1,
-0.4865241, -0.1977668, -2.041693, 1, 0, 0, 1, 1,
-0.4863291, 2.175243, 1.156496, 0, 0, 0, 1, 1,
-0.485429, -0.1503836, -2.218009, 0, 0, 0, 1, 1,
-0.4832764, -1.126448, -3.799332, 0, 0, 0, 1, 1,
-0.4827368, -0.6113229, -2.00742, 0, 0, 0, 1, 1,
-0.4782196, -0.6192059, -4.055056, 0, 0, 0, 1, 1,
-0.477221, -0.4919083, -1.957703, 0, 0, 0, 1, 1,
-0.4728489, 0.2675471, -1.165935, 0, 0, 0, 1, 1,
-0.471822, 0.7146432, 1.996149, 1, 1, 1, 1, 1,
-0.4670838, 0.02300264, -1.288803, 1, 1, 1, 1, 1,
-0.4633495, 0.7953663, -0.3610734, 1, 1, 1, 1, 1,
-0.4581134, -0.4633356, -3.093206, 1, 1, 1, 1, 1,
-0.4559732, 1.61033, -1.298414, 1, 1, 1, 1, 1,
-0.4523303, -0.7249022, -2.923577, 1, 1, 1, 1, 1,
-0.4445344, 2.049066, 0.5992825, 1, 1, 1, 1, 1,
-0.4388019, -0.2732999, -1.274669, 1, 1, 1, 1, 1,
-0.4359631, -0.1900417, -3.705518, 1, 1, 1, 1, 1,
-0.4330691, 0.06826219, -2.261586, 1, 1, 1, 1, 1,
-0.4305512, 0.02995033, -0.2558197, 1, 1, 1, 1, 1,
-0.4301295, 1.315048, -1.495184, 1, 1, 1, 1, 1,
-0.4213375, 0.1594002, -2.41036, 1, 1, 1, 1, 1,
-0.4206375, -1.425831, -4.157207, 1, 1, 1, 1, 1,
-0.4167168, -0.9888867, -2.433892, 1, 1, 1, 1, 1,
-0.4160592, -0.5608593, -2.023981, 0, 0, 1, 1, 1,
-0.4145935, -0.3625937, -3.40692, 1, 0, 0, 1, 1,
-0.407443, 1.335531, 0.5931358, 1, 0, 0, 1, 1,
-0.4070138, 1.347183, -0.7530228, 1, 0, 0, 1, 1,
-0.4069925, -0.8411255, -3.104712, 1, 0, 0, 1, 1,
-0.4049169, -0.201776, -2.726494, 1, 0, 0, 1, 1,
-0.4016476, -0.3392105, -3.078586, 0, 0, 0, 1, 1,
-0.3972995, 0.06637167, -0.9801998, 0, 0, 0, 1, 1,
-0.3954532, -0.1508046, -3.062814, 0, 0, 0, 1, 1,
-0.3925246, 1.626694, -1.268769, 0, 0, 0, 1, 1,
-0.3911952, -1.977216, -1.414626, 0, 0, 0, 1, 1,
-0.3907425, 0.6403944, -2.16704, 0, 0, 0, 1, 1,
-0.3905864, 0.9668708, 0.3271543, 0, 0, 0, 1, 1,
-0.3881086, 0.8505613, -1.272247, 1, 1, 1, 1, 1,
-0.3865662, -1.561833, -2.057494, 1, 1, 1, 1, 1,
-0.3789837, -0.7373863, -1.681596, 1, 1, 1, 1, 1,
-0.3787559, 2.562872, 0.08035765, 1, 1, 1, 1, 1,
-0.3786656, 0.3660859, -0.8347728, 1, 1, 1, 1, 1,
-0.3784664, 0.1235599, -0.6177648, 1, 1, 1, 1, 1,
-0.3750599, 2.687069, -0.8732522, 1, 1, 1, 1, 1,
-0.3732515, -0.7049316, -3.044179, 1, 1, 1, 1, 1,
-0.3732283, 1.042626, -0.2953033, 1, 1, 1, 1, 1,
-0.372708, -1.027937, -2.299126, 1, 1, 1, 1, 1,
-0.3717617, 1.808385, -0.4391428, 1, 1, 1, 1, 1,
-0.3681464, 1.334743, 1.105695, 1, 1, 1, 1, 1,
-0.3654434, 1.656666, -0.1886467, 1, 1, 1, 1, 1,
-0.3642489, -2.108385, -2.7666, 1, 1, 1, 1, 1,
-0.3637572, -1.382223, -4.82024, 1, 1, 1, 1, 1,
-0.3549688, 1.074517, -0.02197153, 0, 0, 1, 1, 1,
-0.3549547, 0.02821684, -2.510271, 1, 0, 0, 1, 1,
-0.3502607, 1.07939, -0.6137975, 1, 0, 0, 1, 1,
-0.3493943, -1.457215, -2.826256, 1, 0, 0, 1, 1,
-0.3488032, 1.412021, 0.4847789, 1, 0, 0, 1, 1,
-0.3479989, -0.593892, -1.743821, 1, 0, 0, 1, 1,
-0.3469197, -0.2997661, -2.159099, 0, 0, 0, 1, 1,
-0.3452192, 0.8805599, -0.05279111, 0, 0, 0, 1, 1,
-0.3427159, -0.7577679, -2.350832, 0, 0, 0, 1, 1,
-0.3407844, -0.07618356, -2.234099, 0, 0, 0, 1, 1,
-0.3395891, 0.3855002, 0.5517507, 0, 0, 0, 1, 1,
-0.3392518, 0.2241808, 0.7230719, 0, 0, 0, 1, 1,
-0.3358268, -1.393477, -3.454639, 0, 0, 0, 1, 1,
-0.3346711, 0.6876961, -1.529784, 1, 1, 1, 1, 1,
-0.3340809, -0.7258244, -4.406306, 1, 1, 1, 1, 1,
-0.3319698, 0.7629557, -1.377516, 1, 1, 1, 1, 1,
-0.3268271, 0.4230202, -0.006933644, 1, 1, 1, 1, 1,
-0.3208679, 1.196406, -0.3587747, 1, 1, 1, 1, 1,
-0.3190989, 1.821393, -0.068437, 1, 1, 1, 1, 1,
-0.3186407, -0.6936336, -3.238304, 1, 1, 1, 1, 1,
-0.3163986, -0.7000955, -2.277387, 1, 1, 1, 1, 1,
-0.3149023, -1.457491, -2.520724, 1, 1, 1, 1, 1,
-0.3002297, -1.502644, -1.494346, 1, 1, 1, 1, 1,
-0.2970572, -0.4286063, -2.883329, 1, 1, 1, 1, 1,
-0.2930748, -0.1609812, -3.005806, 1, 1, 1, 1, 1,
-0.2897973, 0.1526039, -0.4374669, 1, 1, 1, 1, 1,
-0.2887588, 0.2014709, -0.4877974, 1, 1, 1, 1, 1,
-0.2880623, -1.747164, -2.615722, 1, 1, 1, 1, 1,
-0.2850803, -1.014176, -2.399879, 0, 0, 1, 1, 1,
-0.2837861, -0.126959, -1.331767, 1, 0, 0, 1, 1,
-0.2830421, -0.5753374, -3.834644, 1, 0, 0, 1, 1,
-0.2826233, -1.017065, -1.65402, 1, 0, 0, 1, 1,
-0.2804225, -0.2667663, -2.762581, 1, 0, 0, 1, 1,
-0.2788764, -0.8218665, -3.373476, 1, 0, 0, 1, 1,
-0.2766066, 0.4122173, -1.260478, 0, 0, 0, 1, 1,
-0.2757459, -1.608423, -2.066897, 0, 0, 0, 1, 1,
-0.2750944, 0.7300672, 2.041486, 0, 0, 0, 1, 1,
-0.2721263, 0.6152946, 0.7178649, 0, 0, 0, 1, 1,
-0.2690837, 1.499506, -1.394006, 0, 0, 0, 1, 1,
-0.2689476, 0.01785367, -2.036312, 0, 0, 0, 1, 1,
-0.2656959, 2.033084, -0.4582183, 0, 0, 0, 1, 1,
-0.2615687, -0.7773826, -2.307115, 1, 1, 1, 1, 1,
-0.2577154, -0.6448179, -1.003209, 1, 1, 1, 1, 1,
-0.2538547, 0.4426113, 0.4515444, 1, 1, 1, 1, 1,
-0.2520618, 0.03995229, -0.8188866, 1, 1, 1, 1, 1,
-0.2520135, -0.5134261, -1.881489, 1, 1, 1, 1, 1,
-0.2486831, 0.4358856, 0.7809531, 1, 1, 1, 1, 1,
-0.2479719, 0.9612085, 1.259265, 1, 1, 1, 1, 1,
-0.247242, 0.5543241, -0.6357762, 1, 1, 1, 1, 1,
-0.245604, -0.4853502, -4.204177, 1, 1, 1, 1, 1,
-0.2445282, 0.8440141, -0.7641477, 1, 1, 1, 1, 1,
-0.2358531, -1.580572, -5.082596, 1, 1, 1, 1, 1,
-0.2347841, 0.2189951, 0.521776, 1, 1, 1, 1, 1,
-0.2345594, -0.1429, -3.053843, 1, 1, 1, 1, 1,
-0.2301029, -0.2077705, -1.518375, 1, 1, 1, 1, 1,
-0.2272683, 0.6238296, 1.832853, 1, 1, 1, 1, 1,
-0.224282, 0.8812369, -0.1780882, 0, 0, 1, 1, 1,
-0.2223896, 0.8894489, -0.2878351, 1, 0, 0, 1, 1,
-0.2202993, 1.38893, 0.2866462, 1, 0, 0, 1, 1,
-0.2198818, 1.83033, -0.7451686, 1, 0, 0, 1, 1,
-0.2190856, -2.305241, -4.368686, 1, 0, 0, 1, 1,
-0.2186883, -0.5377674, -1.370961, 1, 0, 0, 1, 1,
-0.2179103, -1.355186, -1.205862, 0, 0, 0, 1, 1,
-0.2159499, -0.1484196, -4.510929, 0, 0, 0, 1, 1,
-0.2152675, 0.02860459, -1.100268, 0, 0, 0, 1, 1,
-0.2127783, -2.679816, -3.13783, 0, 0, 0, 1, 1,
-0.2089653, -1.274776, -1.516942, 0, 0, 0, 1, 1,
-0.2039322, 0.9981053, 1.967659, 0, 0, 0, 1, 1,
-0.2027968, -0.7017419, -2.379527, 0, 0, 0, 1, 1,
-0.1958066, 0.7077695, 0.5348127, 1, 1, 1, 1, 1,
-0.1918098, 1.143637, 0.3135733, 1, 1, 1, 1, 1,
-0.1847209, 0.8032584, 1.157677, 1, 1, 1, 1, 1,
-0.1846489, -2.626107, -1.924031, 1, 1, 1, 1, 1,
-0.1838928, -0.4572895, -2.756016, 1, 1, 1, 1, 1,
-0.1818268, -0.3105378, -4.405034, 1, 1, 1, 1, 1,
-0.1745124, 1.744432, 0.9695729, 1, 1, 1, 1, 1,
-0.1744681, -0.07740092, -1.014171, 1, 1, 1, 1, 1,
-0.1741996, 1.519448, -0.1747741, 1, 1, 1, 1, 1,
-0.1729499, 0.4772799, -0.9857555, 1, 1, 1, 1, 1,
-0.172317, -0.2128925, -1.741064, 1, 1, 1, 1, 1,
-0.1682911, 0.2855359, -2.382605, 1, 1, 1, 1, 1,
-0.1678406, 1.578119, 0.659174, 1, 1, 1, 1, 1,
-0.1669663, 1.051979, 1.090406, 1, 1, 1, 1, 1,
-0.1660405, -2.609982, -2.782912, 1, 1, 1, 1, 1,
-0.1639646, -0.5968004, -1.180493, 0, 0, 1, 1, 1,
-0.1636748, -0.5226068, -2.476422, 1, 0, 0, 1, 1,
-0.1598185, 1.422181, 1.24158, 1, 0, 0, 1, 1,
-0.1591044, -0.9381152, -2.273702, 1, 0, 0, 1, 1,
-0.1566105, -0.4880363, -3.305387, 1, 0, 0, 1, 1,
-0.1552702, 1.005661, 1.403654, 1, 0, 0, 1, 1,
-0.1534873, 1.372923, 1.520771, 0, 0, 0, 1, 1,
-0.1457031, -1.711867, -3.506885, 0, 0, 0, 1, 1,
-0.1405412, 1.664029, 0.9000347, 0, 0, 0, 1, 1,
-0.1384037, 0.6032367, 0.3091014, 0, 0, 0, 1, 1,
-0.1321326, -0.9478276, -3.500401, 0, 0, 0, 1, 1,
-0.1295328, 0.1434938, -1.524442, 0, 0, 0, 1, 1,
-0.1273821, 1.38515, 0.892855, 0, 0, 0, 1, 1,
-0.1267602, 1.048813, -0.6795613, 1, 1, 1, 1, 1,
-0.1250123, -0.4299083, -2.274355, 1, 1, 1, 1, 1,
-0.1234038, -1.093378, -2.538685, 1, 1, 1, 1, 1,
-0.1200344, 0.6421311, 0.7438657, 1, 1, 1, 1, 1,
-0.1187324, 2.289624, 0.4662716, 1, 1, 1, 1, 1,
-0.1176923, 0.238828, 0.648455, 1, 1, 1, 1, 1,
-0.1148698, 0.1779374, -0.8913339, 1, 1, 1, 1, 1,
-0.1131453, 0.390159, -0.9606447, 1, 1, 1, 1, 1,
-0.1085021, -1.230464, -1.882389, 1, 1, 1, 1, 1,
-0.1056881, -0.7809699, -3.407365, 1, 1, 1, 1, 1,
-0.1016926, -0.6895299, -5.311926, 1, 1, 1, 1, 1,
-0.1008373, 0.6747073, 0.8501074, 1, 1, 1, 1, 1,
-0.1003937, 0.842386, 0.7978891, 1, 1, 1, 1, 1,
-0.10017, -0.3469176, -2.1628, 1, 1, 1, 1, 1,
-0.09901053, 0.6090352, 0.3340307, 1, 1, 1, 1, 1,
-0.09616829, 0.2128434, -0.2524996, 0, 0, 1, 1, 1,
-0.09154078, -1.046255, -2.934783, 1, 0, 0, 1, 1,
-0.09043276, 0.0240551, -0.8068377, 1, 0, 0, 1, 1,
-0.08918423, -1.482164, -1.968052, 1, 0, 0, 1, 1,
-0.08323276, 0.4078838, 1.40881, 1, 0, 0, 1, 1,
-0.08159418, -0.1739894, -4.117819, 1, 0, 0, 1, 1,
-0.07921997, -1.632145, -1.986967, 0, 0, 0, 1, 1,
-0.07913988, -1.257028, -4.446214, 0, 0, 0, 1, 1,
-0.07880978, -1.791957, -0.352411, 0, 0, 0, 1, 1,
-0.07859839, -0.5151765, -4.062252, 0, 0, 0, 1, 1,
-0.07474907, -0.2320139, -2.214182, 0, 0, 0, 1, 1,
-0.07302009, -0.7247704, -2.98512, 0, 0, 0, 1, 1,
-0.0708638, 0.1292763, -0.5754118, 0, 0, 0, 1, 1,
-0.06995283, -1.221627, -3.780688, 1, 1, 1, 1, 1,
-0.06873824, -0.3418584, -3.254989, 1, 1, 1, 1, 1,
-0.06824845, 0.3891432, -2.103575, 1, 1, 1, 1, 1,
-0.05879112, 1.231916, 1.804941, 1, 1, 1, 1, 1,
-0.05738788, -0.009387613, -2.812893, 1, 1, 1, 1, 1,
-0.05086409, 1.520592, 1.456444, 1, 1, 1, 1, 1,
-0.04862309, -0.211644, -2.681813, 1, 1, 1, 1, 1,
-0.04794247, -0.4371054, -3.248059, 1, 1, 1, 1, 1,
-0.0478096, -0.8256915, -0.3288592, 1, 1, 1, 1, 1,
-0.0465301, -0.1905608, -3.172602, 1, 1, 1, 1, 1,
-0.04483384, 0.1482287, -0.6561121, 1, 1, 1, 1, 1,
-0.04277866, 0.9156798, -0.09673283, 1, 1, 1, 1, 1,
-0.03914534, 1.318441, 0.4602563, 1, 1, 1, 1, 1,
-0.03771437, -0.8957065, -3.517643, 1, 1, 1, 1, 1,
-0.03687346, 0.001321478, -2.858714, 1, 1, 1, 1, 1,
-0.03121587, 0.1335132, 0.4188112, 0, 0, 1, 1, 1,
-0.02671313, 2.412585, -0.739391, 1, 0, 0, 1, 1,
-0.02218308, -1.482263, -3.014884, 1, 0, 0, 1, 1,
-0.01835182, -0.9935188, -3.285198, 1, 0, 0, 1, 1,
-0.01790794, 1.205479, 0.09581158, 1, 0, 0, 1, 1,
-0.01283438, -0.8118703, -4.361786, 1, 0, 0, 1, 1,
-0.005857654, -0.6381811, -4.125554, 0, 0, 0, 1, 1,
-0.003314232, 0.01277185, -1.031613, 0, 0, 0, 1, 1,
-0.002876468, -0.577054, -2.519794, 0, 0, 0, 1, 1,
-0.0005523692, -1.080245, -4.145903, 0, 0, 0, 1, 1,
-4.569458e-05, 2.05587, -0.2095153, 0, 0, 0, 1, 1,
0.007320788, 2.676787, -0.08654176, 0, 0, 0, 1, 1,
0.009823705, 2.166867, 1.199022, 0, 0, 0, 1, 1,
0.01191769, 2.094723, -1.416901, 1, 1, 1, 1, 1,
0.01678017, 0.4895346, -1.481257, 1, 1, 1, 1, 1,
0.02216402, -1.31176, 0.6760382, 1, 1, 1, 1, 1,
0.03264239, -0.1878817, 2.180909, 1, 1, 1, 1, 1,
0.03509958, -0.6492233, 1.185172, 1, 1, 1, 1, 1,
0.03521324, 0.6655678, -0.4356086, 1, 1, 1, 1, 1,
0.03570619, -0.01790339, 2.681648, 1, 1, 1, 1, 1,
0.03703314, -0.9027735, 1.98486, 1, 1, 1, 1, 1,
0.03948458, 0.3297284, 1.300023, 1, 1, 1, 1, 1,
0.04217707, 1.171372, -1.452492, 1, 1, 1, 1, 1,
0.04472933, -0.2903825, 3.611998, 1, 1, 1, 1, 1,
0.04538226, -0.7958299, 2.259522, 1, 1, 1, 1, 1,
0.0474322, 0.665054, 0.708854, 1, 1, 1, 1, 1,
0.04871448, -1.01718, 2.310566, 1, 1, 1, 1, 1,
0.05073839, 0.9481412, -1.333728, 1, 1, 1, 1, 1,
0.05160113, -0.1621016, 2.370389, 0, 0, 1, 1, 1,
0.05444863, -0.07082742, 3.328882, 1, 0, 0, 1, 1,
0.0550514, -1.253691, 2.096833, 1, 0, 0, 1, 1,
0.05703191, 1.676798, 0.629463, 1, 0, 0, 1, 1,
0.06137848, 0.698223, 1.299981, 1, 0, 0, 1, 1,
0.06488445, 1.997849, -0.1104167, 1, 0, 0, 1, 1,
0.07597126, 1.171882, 0.2620824, 0, 0, 0, 1, 1,
0.0796715, -1.179139, 2.681982, 0, 0, 0, 1, 1,
0.08360027, 1.113133, -1.534227, 0, 0, 0, 1, 1,
0.08373472, -1.385703, 4.032501, 0, 0, 0, 1, 1,
0.08671184, 1.011662, 1.068016, 0, 0, 0, 1, 1,
0.08985375, -1.54047, 1.705522, 0, 0, 0, 1, 1,
0.09043287, -0.5461375, 2.573145, 0, 0, 0, 1, 1,
0.09048389, -0.3728187, 2.12142, 1, 1, 1, 1, 1,
0.09653067, -2.055493, 2.004327, 1, 1, 1, 1, 1,
0.0991062, 0.7450073, 0.4319219, 1, 1, 1, 1, 1,
0.1025386, -0.4980934, 4.322817, 1, 1, 1, 1, 1,
0.1045531, 0.8354557, 1.044356, 1, 1, 1, 1, 1,
0.1077314, -0.6125972, 2.548181, 1, 1, 1, 1, 1,
0.111131, -0.4029441, 2.529706, 1, 1, 1, 1, 1,
0.1112406, 0.6278247, 1.530402, 1, 1, 1, 1, 1,
0.1139126, -0.7036673, 2.766237, 1, 1, 1, 1, 1,
0.114099, -0.6652851, 0.8683371, 1, 1, 1, 1, 1,
0.1149102, -0.519595, 1.216902, 1, 1, 1, 1, 1,
0.1236065, -0.2901099, 2.481526, 1, 1, 1, 1, 1,
0.1251482, 0.07844736, 1.287416, 1, 1, 1, 1, 1,
0.1265473, -1.952625, 3.06908, 1, 1, 1, 1, 1,
0.1272451, -0.4957454, 3.206558, 1, 1, 1, 1, 1,
0.1277709, 0.5166609, 0.4675329, 0, 0, 1, 1, 1,
0.1290085, -1.92204, 4.660315, 1, 0, 0, 1, 1,
0.1290788, 0.5126858, 0.4604607, 1, 0, 0, 1, 1,
0.1338878, -2.509568, 2.547788, 1, 0, 0, 1, 1,
0.1350888, -0.3046246, 2.085516, 1, 0, 0, 1, 1,
0.1355897, 0.005687042, 1.183525, 1, 0, 0, 1, 1,
0.1368346, -0.9428115, 3.969759, 0, 0, 0, 1, 1,
0.1472453, 0.7124386, -0.328495, 0, 0, 0, 1, 1,
0.1479389, -0.8401767, 5.723621, 0, 0, 0, 1, 1,
0.1554579, -0.3457451, 2.904176, 0, 0, 0, 1, 1,
0.1572189, -0.2952358, 1.975189, 0, 0, 0, 1, 1,
0.1575982, 0.4190319, 0.08192659, 0, 0, 0, 1, 1,
0.1583019, -0.06837403, 0.3964171, 0, 0, 0, 1, 1,
0.1623382, -0.06644885, 3.901925, 1, 1, 1, 1, 1,
0.1725239, -0.9715616, 4.735217, 1, 1, 1, 1, 1,
0.1729859, -0.04606238, 3.448442, 1, 1, 1, 1, 1,
0.1757808, -0.1616269, 3.498201, 1, 1, 1, 1, 1,
0.1758449, 0.1826586, 0.3574449, 1, 1, 1, 1, 1,
0.1917508, -0.5825408, 2.091539, 1, 1, 1, 1, 1,
0.1924953, 0.3258971, -1.545707, 1, 1, 1, 1, 1,
0.1947379, -0.149461, 3.276223, 1, 1, 1, 1, 1,
0.1947477, 1.38196, 0.7306167, 1, 1, 1, 1, 1,
0.194814, 1.329758, -2.078522, 1, 1, 1, 1, 1,
0.1954466, -0.1374105, 2.605515, 1, 1, 1, 1, 1,
0.1959657, -1.40854, 3.541255, 1, 1, 1, 1, 1,
0.197935, 0.1772501, 1.529916, 1, 1, 1, 1, 1,
0.1993328, 0.1984569, 2.477056, 1, 1, 1, 1, 1,
0.2036344, 0.8143446, 0.2708726, 1, 1, 1, 1, 1,
0.2061461, -1.025341, 2.386666, 0, 0, 1, 1, 1,
0.212642, 1.466606, 1.141767, 1, 0, 0, 1, 1,
0.2204844, -1.50533, 2.45243, 1, 0, 0, 1, 1,
0.2224299, 0.2961518, 0.4836205, 1, 0, 0, 1, 1,
0.2333469, 0.0275152, -0.2953562, 1, 0, 0, 1, 1,
0.2360086, 1.828176, -0.1920916, 1, 0, 0, 1, 1,
0.2431075, 0.8728784, -0.7029251, 0, 0, 0, 1, 1,
0.24444, -0.1801476, 2.529037, 0, 0, 0, 1, 1,
0.248658, 1.770681, -1.333109, 0, 0, 0, 1, 1,
0.2546365, -0.3256605, 2.565173, 0, 0, 0, 1, 1,
0.2581786, -0.5194061, 3.013013, 0, 0, 0, 1, 1,
0.2585327, 0.8626028, 2.722749, 0, 0, 0, 1, 1,
0.2619379, 0.2363139, 0.01676208, 0, 0, 0, 1, 1,
0.2632115, 0.8210572, 0.7868211, 1, 1, 1, 1, 1,
0.2634113, -1.132501, 4.918349, 1, 1, 1, 1, 1,
0.2646044, 2.407754, 0.04318948, 1, 1, 1, 1, 1,
0.267077, 1.495589, -0.4806086, 1, 1, 1, 1, 1,
0.2746487, -0.1356502, 3.550108, 1, 1, 1, 1, 1,
0.2765174, -1.213092, 3.753693, 1, 1, 1, 1, 1,
0.2795725, -0.2966352, 2.252861, 1, 1, 1, 1, 1,
0.2812515, 0.1559952, -0.3536671, 1, 1, 1, 1, 1,
0.2832456, 1.100225, 1.102991, 1, 1, 1, 1, 1,
0.2839883, 0.777969, -0.00208924, 1, 1, 1, 1, 1,
0.2841134, -0.5988844, 2.101861, 1, 1, 1, 1, 1,
0.2856137, 1.44883, -1.060549, 1, 1, 1, 1, 1,
0.2865036, -0.002124526, 1.234018, 1, 1, 1, 1, 1,
0.2917643, 0.1732497, -0.3348719, 1, 1, 1, 1, 1,
0.2947136, -0.8843179, 2.07562, 1, 1, 1, 1, 1,
0.2947283, -1.467873, 3.489356, 0, 0, 1, 1, 1,
0.3023981, -0.05456697, -1.263705, 1, 0, 0, 1, 1,
0.3060109, -1.973835, 2.31792, 1, 0, 0, 1, 1,
0.3066041, 1.314819, 2.14328, 1, 0, 0, 1, 1,
0.3116703, 0.2570869, 0.752591, 1, 0, 0, 1, 1,
0.312016, -1.496754, 2.212148, 1, 0, 0, 1, 1,
0.312171, -1.397041, 3.166602, 0, 0, 0, 1, 1,
0.312351, -0.2377611, 1.522613, 0, 0, 0, 1, 1,
0.3136235, 0.7928737, -0.04315828, 0, 0, 0, 1, 1,
0.3188922, 0.507906, 2.730757, 0, 0, 0, 1, 1,
0.3216719, -0.3109285, 3.169399, 0, 0, 0, 1, 1,
0.3223948, -0.7666833, 3.384799, 0, 0, 0, 1, 1,
0.3258941, 0.195754, 0.4138007, 0, 0, 0, 1, 1,
0.3432079, -0.5470212, 4.118539, 1, 1, 1, 1, 1,
0.3443855, 0.8769341, 1.256836, 1, 1, 1, 1, 1,
0.3484382, 0.5369223, 0.9427668, 1, 1, 1, 1, 1,
0.3490532, 0.9522393, -0.1820087, 1, 1, 1, 1, 1,
0.3506409, 0.625001, -0.1709087, 1, 1, 1, 1, 1,
0.3517261, -0.4120693, 2.969791, 1, 1, 1, 1, 1,
0.35438, -0.9539998, 2.119045, 1, 1, 1, 1, 1,
0.3623172, 0.2165739, 1.410557, 1, 1, 1, 1, 1,
0.3625548, -0.6697651, 2.409386, 1, 1, 1, 1, 1,
0.3650479, -0.5159245, 3.666975, 1, 1, 1, 1, 1,
0.3658881, 0.9633153, 0.6495333, 1, 1, 1, 1, 1,
0.368136, 1.488801, 1.716544, 1, 1, 1, 1, 1,
0.3707245, -1.187873, 4.217229, 1, 1, 1, 1, 1,
0.3730836, -1.627054, 3.140819, 1, 1, 1, 1, 1,
0.3768405, 1.390793, -1.262555, 1, 1, 1, 1, 1,
0.3813117, 2.723504, 0.0665378, 0, 0, 1, 1, 1,
0.3820887, -0.7449722, 1.591112, 1, 0, 0, 1, 1,
0.38537, -0.0376723, -0.3770866, 1, 0, 0, 1, 1,
0.3885074, 1.392553, -0.3341178, 1, 0, 0, 1, 1,
0.3905892, 0.5453568, 1.695593, 1, 0, 0, 1, 1,
0.391794, -1.751598, 3.825911, 1, 0, 0, 1, 1,
0.3930362, 2.009222, -1.044361, 0, 0, 0, 1, 1,
0.3934769, 0.2350706, 0.1295452, 0, 0, 0, 1, 1,
0.4000579, 0.3519267, 2.124698, 0, 0, 0, 1, 1,
0.4045295, 1.354814, 0.3370273, 0, 0, 0, 1, 1,
0.4106626, -0.6714126, 1.069622, 0, 0, 0, 1, 1,
0.4247169, -1.482584, 2.888297, 0, 0, 0, 1, 1,
0.425649, 1.573073, 0.3163242, 0, 0, 0, 1, 1,
0.4283062, 0.3578991, 1.469819, 1, 1, 1, 1, 1,
0.4317809, -0.02956008, 3.262295, 1, 1, 1, 1, 1,
0.4371756, -1.068187, 4.161519, 1, 1, 1, 1, 1,
0.4409313, -1.575965, 3.295918, 1, 1, 1, 1, 1,
0.4423265, -0.9298301, 1.539487, 1, 1, 1, 1, 1,
0.4444323, -1.756022, 3.563116, 1, 1, 1, 1, 1,
0.4445047, 1.524997, 0.1358566, 1, 1, 1, 1, 1,
0.4466561, 2.585966, -0.2486136, 1, 1, 1, 1, 1,
0.4480849, -0.1052034, 1.821408, 1, 1, 1, 1, 1,
0.4502619, -0.1204485, 2.128295, 1, 1, 1, 1, 1,
0.4556745, 0.463461, 0.8696803, 1, 1, 1, 1, 1,
0.4568508, 1.40158, 0.07829905, 1, 1, 1, 1, 1,
0.4678106, 0.8185789, -0.9138266, 1, 1, 1, 1, 1,
0.4681641, 0.3529561, 0.8181727, 1, 1, 1, 1, 1,
0.4734773, -1.083522, 3.63692, 1, 1, 1, 1, 1,
0.4786115, 0.5055957, 1.975981, 0, 0, 1, 1, 1,
0.4802063, 0.7490702, 2.754393, 1, 0, 0, 1, 1,
0.4852735, 0.04177355, 1.726729, 1, 0, 0, 1, 1,
0.4858167, -0.2110942, 2.739435, 1, 0, 0, 1, 1,
0.4891598, -0.6690096, 1.376374, 1, 0, 0, 1, 1,
0.4898694, 0.07201211, 1.602781, 1, 0, 0, 1, 1,
0.4919534, 0.0405163, 3.035655, 0, 0, 0, 1, 1,
0.4924343, -0.08162989, 0.7654685, 0, 0, 0, 1, 1,
0.4950807, -0.5787792, 2.347413, 0, 0, 0, 1, 1,
0.4983404, 0.596945, 1.485246, 0, 0, 0, 1, 1,
0.498753, 1.39689, 0.5596154, 0, 0, 0, 1, 1,
0.4992958, 0.8548828, 0.7517996, 0, 0, 0, 1, 1,
0.5014617, 0.5585945, 1.742867, 0, 0, 0, 1, 1,
0.5025367, 0.7431616, 0.1361181, 1, 1, 1, 1, 1,
0.5043089, 1.167727, 0.4015539, 1, 1, 1, 1, 1,
0.5114653, 0.6555569, 1.116963, 1, 1, 1, 1, 1,
0.5115219, -0.1468936, 2.151515, 1, 1, 1, 1, 1,
0.5134087, 0.6318308, 0.04985341, 1, 1, 1, 1, 1,
0.5151539, 0.1584262, 0.1040851, 1, 1, 1, 1, 1,
0.5156885, -1.085415, 2.246541, 1, 1, 1, 1, 1,
0.5161443, 0.1807245, 2.230953, 1, 1, 1, 1, 1,
0.5205806, -0.4012769, 0.9505166, 1, 1, 1, 1, 1,
0.5330023, -0.7445264, 3.253816, 1, 1, 1, 1, 1,
0.5357065, 0.1214723, 1.238356, 1, 1, 1, 1, 1,
0.5374194, -0.7949166, 3.702563, 1, 1, 1, 1, 1,
0.5390728, -2.189904, 2.310894, 1, 1, 1, 1, 1,
0.5652508, 0.04323144, -0.08811507, 1, 1, 1, 1, 1,
0.5656188, 0.08940089, 1.96288, 1, 1, 1, 1, 1,
0.5656361, 0.6372001, 1.172589, 0, 0, 1, 1, 1,
0.567508, 0.3549151, 1.054756, 1, 0, 0, 1, 1,
0.5708625, -0.6056776, 2.320545, 1, 0, 0, 1, 1,
0.5726134, 1.386861, -0.8672488, 1, 0, 0, 1, 1,
0.5820844, -1.103255, 2.873576, 1, 0, 0, 1, 1,
0.5830618, 0.07193797, -1.363975, 1, 0, 0, 1, 1,
0.5833222, 0.4335291, 1.9589, 0, 0, 0, 1, 1,
0.5834841, -0.6074892, 1.827523, 0, 0, 0, 1, 1,
0.5856894, -0.1524087, 2.172133, 0, 0, 0, 1, 1,
0.5864907, -0.5452781, 2.29318, 0, 0, 0, 1, 1,
0.5876126, 0.2921602, -0.419258, 0, 0, 0, 1, 1,
0.5887142, -0.3687751, -0.5805682, 0, 0, 0, 1, 1,
0.5972787, -0.9316415, 2.850807, 0, 0, 0, 1, 1,
0.6043243, 0.3930944, 2.04107, 1, 1, 1, 1, 1,
0.6064632, -1.659743, 3.118131, 1, 1, 1, 1, 1,
0.6070435, -0.1885005, 3.059374, 1, 1, 1, 1, 1,
0.6073994, -1.148676, 2.63124, 1, 1, 1, 1, 1,
0.6076018, 0.5637774, -0.1780312, 1, 1, 1, 1, 1,
0.6132618, 0.1334769, 0.9022146, 1, 1, 1, 1, 1,
0.6195908, 0.5734849, 2.159437, 1, 1, 1, 1, 1,
0.621056, -0.3713317, 0.9611612, 1, 1, 1, 1, 1,
0.6213233, -0.1353814, 1.806192, 1, 1, 1, 1, 1,
0.621477, 1.380263, 1.449077, 1, 1, 1, 1, 1,
0.6318027, 0.01131041, -0.9870397, 1, 1, 1, 1, 1,
0.6323424, 1.23806, 1.199082, 1, 1, 1, 1, 1,
0.6489716, -1.455625, 4.292945, 1, 1, 1, 1, 1,
0.6506337, -1.631526, 3.912846, 1, 1, 1, 1, 1,
0.6520526, 0.6002074, 3.001491, 1, 1, 1, 1, 1,
0.6546231, -0.9829558, 2.855685, 0, 0, 1, 1, 1,
0.6622795, 1.057644, 1.923365, 1, 0, 0, 1, 1,
0.6630045, 0.06616703, 2.205894, 1, 0, 0, 1, 1,
0.6651295, 1.119495, 0.005773427, 1, 0, 0, 1, 1,
0.6654788, 2.115198, 1.169059, 1, 0, 0, 1, 1,
0.6715528, -1.442018, 3.556225, 1, 0, 0, 1, 1,
0.6767684, 1.052884, 0.07927632, 0, 0, 0, 1, 1,
0.6795131, 0.2609056, 0.6863769, 0, 0, 0, 1, 1,
0.6823127, -1.111264, 3.813483, 0, 0, 0, 1, 1,
0.6840723, 0.8946914, 0.09023418, 0, 0, 0, 1, 1,
0.6865841, 1.614193, 0.4783984, 0, 0, 0, 1, 1,
0.6920162, 0.3260932, 2.256657, 0, 0, 0, 1, 1,
0.6983504, 0.4124666, 0.00106033, 0, 0, 0, 1, 1,
0.7006294, 1.929076, 0.8855153, 1, 1, 1, 1, 1,
0.7009262, -0.5055958, 1.423899, 1, 1, 1, 1, 1,
0.7023737, -0.03440897, 1.49085, 1, 1, 1, 1, 1,
0.7049655, -0.04616096, 3.174432, 1, 1, 1, 1, 1,
0.7049963, -0.4274421, 3.570414, 1, 1, 1, 1, 1,
0.7055238, 0.7015581, 0.7025028, 1, 1, 1, 1, 1,
0.7111247, 0.4627683, 2.051093, 1, 1, 1, 1, 1,
0.7114711, 0.586965, 1.480467, 1, 1, 1, 1, 1,
0.7132054, 0.5048941, 1.388407, 1, 1, 1, 1, 1,
0.7162946, -0.007711841, 2.331973, 1, 1, 1, 1, 1,
0.7173214, 1.051217, 2.020874, 1, 1, 1, 1, 1,
0.7266723, -0.4938651, 2.70497, 1, 1, 1, 1, 1,
0.7267118, -0.953613, 2.143697, 1, 1, 1, 1, 1,
0.7336591, 1.725217, 1.46305, 1, 1, 1, 1, 1,
0.7359878, -0.6194614, 1.93908, 1, 1, 1, 1, 1,
0.7371922, -0.1158874, 1.241693, 0, 0, 1, 1, 1,
0.7406009, -2.748878, 1.883566, 1, 0, 0, 1, 1,
0.7424185, 0.3619315, 1.277075, 1, 0, 0, 1, 1,
0.7437434, -1.509729, 2.328295, 1, 0, 0, 1, 1,
0.7457123, -0.05543685, 1.439956, 1, 0, 0, 1, 1,
0.7472075, -0.3295155, 1.233548, 1, 0, 0, 1, 1,
0.7482297, 0.5742077, 0.9644391, 0, 0, 0, 1, 1,
0.74901, 0.7667726, 0.08660401, 0, 0, 0, 1, 1,
0.7547766, -0.467299, 1.413222, 0, 0, 0, 1, 1,
0.7549701, 1.440915, -0.8290548, 0, 0, 0, 1, 1,
0.7659928, -1.183017, 3.852428, 0, 0, 0, 1, 1,
0.7703693, 0.1752002, 1.042885, 0, 0, 0, 1, 1,
0.7780293, 1.407778, 0.8919058, 0, 0, 0, 1, 1,
0.778038, 1.058483, 3.140143, 1, 1, 1, 1, 1,
0.7808983, 0.8902973, 1.218084, 1, 1, 1, 1, 1,
0.7931552, -1.459634, 3.305252, 1, 1, 1, 1, 1,
0.7985072, 0.7816869, 2.459695, 1, 1, 1, 1, 1,
0.8041836, -0.5271224, 3.614187, 1, 1, 1, 1, 1,
0.8042758, 0.3441597, 0.4007104, 1, 1, 1, 1, 1,
0.8111246, -0.4474894, 2.847367, 1, 1, 1, 1, 1,
0.8132364, 0.3420107, 1.008294, 1, 1, 1, 1, 1,
0.8196843, 0.5877894, 0.7625659, 1, 1, 1, 1, 1,
0.8303378, -0.3412521, 2.119355, 1, 1, 1, 1, 1,
0.8310732, 0.03106896, 0.9327967, 1, 1, 1, 1, 1,
0.833909, 1.00167, 3.276616, 1, 1, 1, 1, 1,
0.8359354, 1.405497, 1.471018, 1, 1, 1, 1, 1,
0.8361404, 0.5621875, 0.2447083, 1, 1, 1, 1, 1,
0.8502452, 0.3236439, 1.282424, 1, 1, 1, 1, 1,
0.8531123, 1.868861, 0.6010427, 0, 0, 1, 1, 1,
0.8607828, -0.950579, 2.052787, 1, 0, 0, 1, 1,
0.861171, -0.8821502, 2.164458, 1, 0, 0, 1, 1,
0.8669657, -0.5090883, 1.180301, 1, 0, 0, 1, 1,
0.8747416, -0.04473522, 1.960066, 1, 0, 0, 1, 1,
0.876092, 0.1659166, 2.757685, 1, 0, 0, 1, 1,
0.8805758, -0.9232803, 2.919725, 0, 0, 0, 1, 1,
0.8832836, 1.227618, -0.06956123, 0, 0, 0, 1, 1,
0.8834175, -0.5092953, 2.174458, 0, 0, 0, 1, 1,
0.8845181, -0.1672507, 0.06026531, 0, 0, 0, 1, 1,
0.8932303, -1.233845, 2.600223, 0, 0, 0, 1, 1,
0.895991, -0.1836954, 3.78856, 0, 0, 0, 1, 1,
0.8962603, -1.265237, 2.384957, 0, 0, 0, 1, 1,
0.9013585, -0.3455222, 3.920985, 1, 1, 1, 1, 1,
0.9034914, -0.1744155, 2.872807, 1, 1, 1, 1, 1,
0.9053693, 1.17278, 0.8775612, 1, 1, 1, 1, 1,
0.9065677, -0.1831552, 0.1260537, 1, 1, 1, 1, 1,
0.9107509, -0.1454794, 2.075953, 1, 1, 1, 1, 1,
0.9199964, 0.8079997, 2.522626, 1, 1, 1, 1, 1,
0.9210209, -0.149363, 1.145471, 1, 1, 1, 1, 1,
0.9237583, 1.385119, 1.627858, 1, 1, 1, 1, 1,
0.9238204, -1.193682, 2.712187, 1, 1, 1, 1, 1,
0.9302012, -1.185994, 3.872162, 1, 1, 1, 1, 1,
0.9334958, 0.4087743, -0.1935471, 1, 1, 1, 1, 1,
0.934855, 0.7668024, 1.089119, 1, 1, 1, 1, 1,
0.9358118, 1.921768, 2.433651, 1, 1, 1, 1, 1,
0.9411133, -1.042603, 2.231796, 1, 1, 1, 1, 1,
0.9457438, -1.647424, 3.118875, 1, 1, 1, 1, 1,
0.9507647, 1.238544, 0.504298, 0, 0, 1, 1, 1,
0.9565023, -1.060572, 3.914497, 1, 0, 0, 1, 1,
0.9629525, 2.231219, -0.8156173, 1, 0, 0, 1, 1,
0.9630561, 0.1293263, 2.828651, 1, 0, 0, 1, 1,
0.9659653, -0.558239, 2.123103, 1, 0, 0, 1, 1,
0.9690211, 0.841725, 1.550648, 1, 0, 0, 1, 1,
0.9712373, 0.5882918, 1.519597, 0, 0, 0, 1, 1,
0.9719711, 0.532038, 2.422624, 0, 0, 0, 1, 1,
0.9727041, 1.085372, -0.4909232, 0, 0, 0, 1, 1,
0.9774002, 0.02103517, 1.593855, 0, 0, 0, 1, 1,
0.977522, -1.011422, 3.925997, 0, 0, 0, 1, 1,
0.978843, -1.417722, 2.213861, 0, 0, 0, 1, 1,
0.9830024, -0.5102104, 0.7862157, 0, 0, 0, 1, 1,
0.9844064, -1.356187, 2.589841, 1, 1, 1, 1, 1,
0.9852577, -0.1011333, 2.62636, 1, 1, 1, 1, 1,
0.9897012, -0.6675089, 0.1563215, 1, 1, 1, 1, 1,
0.990531, -1.293822, 2.300998, 1, 1, 1, 1, 1,
0.9905587, -0.0985976, 1.886762, 1, 1, 1, 1, 1,
0.9983006, -0.1712298, 0.7481503, 1, 1, 1, 1, 1,
1.005158, -0.935623, 3.218771, 1, 1, 1, 1, 1,
1.008525, 0.6725448, 1.711012, 1, 1, 1, 1, 1,
1.015515, -0.6291716, 2.512218, 1, 1, 1, 1, 1,
1.017476, 1.451026, 0.2720786, 1, 1, 1, 1, 1,
1.019144, -0.07510511, 1.518879, 1, 1, 1, 1, 1,
1.024134, -1.467472, 1.149025, 1, 1, 1, 1, 1,
1.024929, -1.147157, 3.288535, 1, 1, 1, 1, 1,
1.02624, 0.2986283, 0.4270156, 1, 1, 1, 1, 1,
1.028036, 0.2491633, 1.253124, 1, 1, 1, 1, 1,
1.02936, -0.2893004, 2.479781, 0, 0, 1, 1, 1,
1.036895, -0.6797857, 2.673358, 1, 0, 0, 1, 1,
1.039367, 0.7923149, 1.561208, 1, 0, 0, 1, 1,
1.044415, -0.1953645, 3.444965, 1, 0, 0, 1, 1,
1.049189, -0.5587904, 3.988275, 1, 0, 0, 1, 1,
1.056484, -1.978645, 4.115675, 1, 0, 0, 1, 1,
1.062944, 0.8836009, -0.408217, 0, 0, 0, 1, 1,
1.069136, -0.09038921, 3.23941, 0, 0, 0, 1, 1,
1.090712, 1.948713, 0.1174222, 0, 0, 0, 1, 1,
1.097923, -0.2421421, 0.5673984, 0, 0, 0, 1, 1,
1.10057, -1.589859, 3.355768, 0, 0, 0, 1, 1,
1.10194, -2.064316, 1.365011, 0, 0, 0, 1, 1,
1.10526, 0.9283389, 0.05919117, 0, 0, 0, 1, 1,
1.10896, -1.901327, 4.414528, 1, 1, 1, 1, 1,
1.112428, -1.803663, 3.056998, 1, 1, 1, 1, 1,
1.121845, -0.7542999, 2.106429, 1, 1, 1, 1, 1,
1.124237, -0.09287193, 1.533717, 1, 1, 1, 1, 1,
1.13459, 0.2094779, 0.181225, 1, 1, 1, 1, 1,
1.137815, -1.487571, 3.262178, 1, 1, 1, 1, 1,
1.14347, 0.7683748, 1.795364, 1, 1, 1, 1, 1,
1.143521, -1.669958, 2.14881, 1, 1, 1, 1, 1,
1.144455, 1.816628, -0.09542771, 1, 1, 1, 1, 1,
1.149746, 0.7398531, -0.2887259, 1, 1, 1, 1, 1,
1.149966, 0.782669, 0.5720347, 1, 1, 1, 1, 1,
1.156046, -0.1563329, 1.533384, 1, 1, 1, 1, 1,
1.159197, 0.8975339, 0.9007536, 1, 1, 1, 1, 1,
1.159207, -0.1716701, 2.2541, 1, 1, 1, 1, 1,
1.160016, 0.1666526, 1.220389, 1, 1, 1, 1, 1,
1.165806, 0.3895324, 0.0367482, 0, 0, 1, 1, 1,
1.179876, -0.29612, 1.745992, 1, 0, 0, 1, 1,
1.183662, 0.9350291, 2.049184, 1, 0, 0, 1, 1,
1.185263, -1.448557, 2.827022, 1, 0, 0, 1, 1,
1.189896, 0.09864461, -0.6856546, 1, 0, 0, 1, 1,
1.20303, 0.9492509, 1.661578, 1, 0, 0, 1, 1,
1.203043, 0.3355111, 1.047099, 0, 0, 0, 1, 1,
1.204075, 0.5192872, 0.4718837, 0, 0, 0, 1, 1,
1.245879, -0.294284, 2.786029, 0, 0, 0, 1, 1,
1.246406, -1.095958, 1.664058, 0, 0, 0, 1, 1,
1.271214, 0.5036398, 1.315495, 0, 0, 0, 1, 1,
1.271426, -0.1806326, 2.174723, 0, 0, 0, 1, 1,
1.274286, 2.323133, 1.74111, 0, 0, 0, 1, 1,
1.278312, -0.7074634, 2.038506, 1, 1, 1, 1, 1,
1.279657, 0.08346056, 1.84217, 1, 1, 1, 1, 1,
1.286619, -2.185923, 0.7725307, 1, 1, 1, 1, 1,
1.296708, 1.299439, 0.8369054, 1, 1, 1, 1, 1,
1.30049, -0.1854152, 1.453656, 1, 1, 1, 1, 1,
1.303832, 1.549694, 1.419305, 1, 1, 1, 1, 1,
1.310534, -1.680712, 1.571359, 1, 1, 1, 1, 1,
1.317763, -0.8775296, 1.710807, 1, 1, 1, 1, 1,
1.329961, -1.480727, 1.358421, 1, 1, 1, 1, 1,
1.331331, -0.02300021, 0.8251646, 1, 1, 1, 1, 1,
1.338474, -0.07907046, 3.287297, 1, 1, 1, 1, 1,
1.347783, 0.2180951, 0.7070581, 1, 1, 1, 1, 1,
1.359792, 1.135263, 2.035753, 1, 1, 1, 1, 1,
1.380778, -0.5538689, 3.016161, 1, 1, 1, 1, 1,
1.38352, -0.2711796, 1.671384, 1, 1, 1, 1, 1,
1.392446, -1.013795, 1.583756, 0, 0, 1, 1, 1,
1.395216, -0.3903165, 3.124791, 1, 0, 0, 1, 1,
1.396015, -0.3602355, 3.02838, 1, 0, 0, 1, 1,
1.399366, -0.5555743, 0.1787921, 1, 0, 0, 1, 1,
1.407017, 0.5057177, 1.242213, 1, 0, 0, 1, 1,
1.407817, -0.3515036, -0.5889114, 1, 0, 0, 1, 1,
1.41432, -0.1485059, 2.994492, 0, 0, 0, 1, 1,
1.420771, -0.1963993, 2.235594, 0, 0, 0, 1, 1,
1.423965, 0.5105706, 2.779423, 0, 0, 0, 1, 1,
1.428826, 0.6319517, 1.428823, 0, 0, 0, 1, 1,
1.436648, -0.4868033, 2.651889, 0, 0, 0, 1, 1,
1.441561, 0.6250951, 0.3455616, 0, 0, 0, 1, 1,
1.44416, 0.1281344, 1.556328, 0, 0, 0, 1, 1,
1.445188, -0.9806893, 2.573048, 1, 1, 1, 1, 1,
1.454435, -2.212984, 1.201297, 1, 1, 1, 1, 1,
1.459657, 0.166103, 1.709607, 1, 1, 1, 1, 1,
1.470254, -1.782807, 2.03813, 1, 1, 1, 1, 1,
1.476662, -2.034273, 4.465944, 1, 1, 1, 1, 1,
1.481369, 2.245108, 0.9747737, 1, 1, 1, 1, 1,
1.484368, -0.4427091, 1.012174, 1, 1, 1, 1, 1,
1.490441, 1.709865, 1.59096, 1, 1, 1, 1, 1,
1.503819, 0.8563952, 0.08312646, 1, 1, 1, 1, 1,
1.510812, -0.254216, 2.046964, 1, 1, 1, 1, 1,
1.514779, 1.734396, 1.195473, 1, 1, 1, 1, 1,
1.515589, 0.3650559, 1.256024, 1, 1, 1, 1, 1,
1.522309, -0.06038707, 1.454631, 1, 1, 1, 1, 1,
1.538082, -1.099479, 1.163018, 1, 1, 1, 1, 1,
1.543663, -1.204195, 2.752678, 1, 1, 1, 1, 1,
1.545968, 0.417668, 3.439304, 0, 0, 1, 1, 1,
1.551179, -0.6161756, 2.33714, 1, 0, 0, 1, 1,
1.564144, 1.183837, 0.4823909, 1, 0, 0, 1, 1,
1.564267, -0.3246283, 0.1205854, 1, 0, 0, 1, 1,
1.594407, -0.1524585, 2.430122, 1, 0, 0, 1, 1,
1.596449, -1.827469, 2.153953, 1, 0, 0, 1, 1,
1.596786, -0.6432073, 2.533755, 0, 0, 0, 1, 1,
1.60035, -0.5333166, 0.8526819, 0, 0, 0, 1, 1,
1.606666, 0.02424769, 1.868466, 0, 0, 0, 1, 1,
1.616315, 0.9700502, 0.2386954, 0, 0, 0, 1, 1,
1.619409, 0.399395, 1.943906, 0, 0, 0, 1, 1,
1.625693, 0.636595, -0.0510282, 0, 0, 0, 1, 1,
1.636548, 0.2628612, 1.343745, 0, 0, 0, 1, 1,
1.645647, 1.368584, 2.011711, 1, 1, 1, 1, 1,
1.657053, -0.9885272, 3.191048, 1, 1, 1, 1, 1,
1.673783, 1.980897, 2.599701, 1, 1, 1, 1, 1,
1.678853, -0.04047055, 1.475875, 1, 1, 1, 1, 1,
1.682895, 0.5261172, -0.01452717, 1, 1, 1, 1, 1,
1.686822, 0.4448778, 0.7754521, 1, 1, 1, 1, 1,
1.690766, 0.8519634, 1.357219, 1, 1, 1, 1, 1,
1.694656, -1.610232, 0.895293, 1, 1, 1, 1, 1,
1.716034, 1.40359, 1.416477, 1, 1, 1, 1, 1,
1.716488, -0.3217433, 1.440349, 1, 1, 1, 1, 1,
1.722772, -0.6580529, 2.398372, 1, 1, 1, 1, 1,
1.725116, 0.03111407, 2.323578, 1, 1, 1, 1, 1,
1.72631, 1.491591, 1.445927, 1, 1, 1, 1, 1,
1.726751, -0.07471779, 2.244147, 1, 1, 1, 1, 1,
1.747539, -1.678445, 2.461898, 1, 1, 1, 1, 1,
1.749215, 0.005399894, 1.285701, 0, 0, 1, 1, 1,
1.756409, 1.82057, 2.689518, 1, 0, 0, 1, 1,
1.756829, -0.5952849, 1.153853, 1, 0, 0, 1, 1,
1.760199, 0.2987735, 2.303193, 1, 0, 0, 1, 1,
1.781942, -0.07121583, 0.3938576, 1, 0, 0, 1, 1,
1.80599, 2.231158, 2.518774, 1, 0, 0, 1, 1,
1.806847, -1.688573, 2.378229, 0, 0, 0, 1, 1,
1.809811, 2.299004, -0.2086117, 0, 0, 0, 1, 1,
1.810281, -0.3898467, 0.8242755, 0, 0, 0, 1, 1,
1.825055, 1.2826, 0.6857147, 0, 0, 0, 1, 1,
1.828243, -0.9833397, 1.120032, 0, 0, 0, 1, 1,
1.839393, -0.2672934, 0.5107134, 0, 0, 0, 1, 1,
1.85529, 0.0279629, 0.2136431, 0, 0, 0, 1, 1,
1.874435, 0.8998978, 1.326338, 1, 1, 1, 1, 1,
1.89886, 1.755141, 0.2544766, 1, 1, 1, 1, 1,
1.900234, -1.164385, 2.690866, 1, 1, 1, 1, 1,
1.901207, -1.503708, 1.536808, 1, 1, 1, 1, 1,
1.905485, 0.8618351, 0.33544, 1, 1, 1, 1, 1,
1.90609, -0.9426939, 2.933335, 1, 1, 1, 1, 1,
1.932046, 1.56919, 2.192765, 1, 1, 1, 1, 1,
1.935831, -0.7040069, 1.044199, 1, 1, 1, 1, 1,
1.947898, -0.2419754, 0.801377, 1, 1, 1, 1, 1,
1.95703, -0.5394312, 1.218617, 1, 1, 1, 1, 1,
1.96017, 1.023905, 1.916381, 1, 1, 1, 1, 1,
1.972258, -0.05910096, 2.025021, 1, 1, 1, 1, 1,
1.97326, -0.3736532, 1.47631, 1, 1, 1, 1, 1,
1.991866, -0.6851473, 1.404625, 1, 1, 1, 1, 1,
2.025748, -0.9918162, 1.814378, 1, 1, 1, 1, 1,
2.039977, -0.4561681, 2.6518, 0, 0, 1, 1, 1,
2.083193, 0.2116594, 2.346997, 1, 0, 0, 1, 1,
2.089555, -0.6958098, 1.023325, 1, 0, 0, 1, 1,
2.108212, 0.1332545, 1.002096, 1, 0, 0, 1, 1,
2.185794, 1.722359, 1.74666, 1, 0, 0, 1, 1,
2.2573, -0.1000631, 2.259952, 1, 0, 0, 1, 1,
2.292693, 0.7686327, 1.308589, 0, 0, 0, 1, 1,
2.294014, 0.2784441, 2.637811, 0, 0, 0, 1, 1,
2.312006, -0.6109737, 3.005024, 0, 0, 0, 1, 1,
2.328583, 0.2067289, 3.439311, 0, 0, 0, 1, 1,
2.404005, 0.8368257, 1.77793, 0, 0, 0, 1, 1,
2.405104, 0.71984, 0.5101434, 0, 0, 0, 1, 1,
2.499902, -0.9546075, 0.8624049, 0, 0, 0, 1, 1,
2.515578, -0.5144181, 1.161059, 1, 1, 1, 1, 1,
2.531722, 0.7957098, 0.1551885, 1, 1, 1, 1, 1,
2.540719, 0.5793079, -0.2493966, 1, 1, 1, 1, 1,
2.551499, -0.7380673, 1.141493, 1, 1, 1, 1, 1,
2.577962, 0.4598315, 1.427655, 1, 1, 1, 1, 1,
2.746871, -0.2718946, 1.006066, 1, 1, 1, 1, 1,
2.787278, -0.5244378, 1.856633, 1, 1, 1, 1, 1
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
var radius = 9.46923;
var distance = 33.26027;
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
mvMatrix.translate( 0.2077732, -0.2087214, -0.2058475 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.26027);
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
